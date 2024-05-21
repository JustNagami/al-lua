ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleUnitEvent
local var_0_2 = var_0_0.Battle.BattleBuffEvent
local var_0_3 = var_0_0.Battle.BattleConst
local var_0_4 = var_0_0.Battle.BattleVariable
local var_0_5 = var_0_0.Battle.BattleConfig
local var_0_6 = var_0_0.Battle.BattleAttr
local var_0_7 = var_0_0.Battle.BattleDataFunction
local var_0_8 = var_0_0.Battle.UnitState
local var_0_9 = class("BattleUnit")

var_0_0.Battle.BattleUnit = var_0_9
var_0_9.__name = "BattleUnit"

function var_0_9.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_0.EventDispatcher.AttachEventDispatcher(arg_1_0)

	arg_1_0._uniqueID = arg_1_1
	arg_1_0._speedExemptKey = "unit_" .. arg_1_1
	arg_1_0._unitState = var_0_0.Battle.UnitState.New(arg_1_0)
	arg_1_0._move = var_0_0.Battle.MoveComponent.New()
	arg_1_0._weaponQueue = var_0_0.Battle.WeaponQueue.New()

	arg_1_0:Init()
	arg_1_0:SetIFF(arg_1_2)

	arg_1_0._distanceBackup = {}
	arg_1_0._battleProxy = var_0_0.Battle.BattleDataProxy.GetInstance()
	arg_1_0._frame = 0
end

function var_0_9.Retreat(arg_2_0)
	arg_2_0:TriggerBuff(var_0_3.BuffEffectType.ON_RETREAT, {})
end

function var_0_9.SetMotion(arg_3_0, arg_3_1)
	arg_3_0._move:SetMotionVO(arg_3_1)
end

function var_0_9.SetBound(arg_4_0, arg_4_1, arg_4_2, arg_4_3, arg_4_4, arg_4_5, arg_4_6)
	arg_4_0._move:SetCorpsArea(arg_4_5, arg_4_6)
	arg_4_0._move:SetBorder(arg_4_3, arg_4_4, arg_4_1, arg_4_2)
end

function var_0_9.ActiveCldBox(arg_5_0)
	arg_5_0._cldComponent:SetActive(true)
end

function var_0_9.DeactiveCldBox(arg_6_0)
	arg_6_0._cldComponent:SetActive(false)
end

function var_0_9.Init(arg_7_0)
	arg_7_0._hostileCldList = {}
	arg_7_0._currentHPRate = 1
	arg_7_0._currentDMGRate = 0
	arg_7_0._tagCount = 0
	arg_7_0._tagIndex = 0
	arg_7_0._tagList = {}
	arg_7_0._aliveState = true
	arg_7_0._isMainFleetUnit = false
	arg_7_0._bulletCache = {}
	arg_7_0._speed = Vector3.zero
	arg_7_0._dir = var_0_3.UnitDir.RIGHT
	arg_7_0._extraInfo = {}
	arg_7_0._GCDTimerList = {}
	arg_7_0._buffList = {}
	arg_7_0._buffStockList = {}
	arg_7_0._labelTagList = {}
	arg_7_0._exposedToSnoar = false
	arg_7_0._moveCast = true
	arg_7_0._remoteBoundBone = {}
end

function var_0_9.Update(arg_8_0, arg_8_1)
	if arg_8_0:IsAlive() and not arg_8_0._isSickness then
		arg_8_0._move:Update()
		arg_8_0._move:FixSpeed(arg_8_0._cldComponent)
		arg_8_0._move:Move(arg_8_0:GetSpeedRatio())
	end

	arg_8_0:UpdateAction()
end

function var_0_9.UpdateWeapon(arg_9_0, arg_9_1)
	if not arg_9_0:IsAlive() or arg_9_0._isSickness then
		return
	end

	if not arg_9_0._antiSubVigilanceState or arg_9_0._antiSubVigilanceState:IsWeaponUseable() then
		local var_9_0 = arg_9_0._move:GetPos()
		local var_9_1 = arg_9_0._weaponRightBound
		local var_9_2 = arg_9_0._weaponLowerBound

		if (var_9_1 == nil or var_9_1 > var_9_0.x) and (var_9_2 == nil or var_9_2 < var_9_0.z) then
			arg_9_0._weaponQueue:Update(arg_9_1)
		end
	end

	if not arg_9_0:IsAlive() then
		return
	end

	arg_9_0:UpdateBuff(arg_9_1)
end

function var_0_9.UpdateAirAssist(arg_10_0)
	if arg_10_0._airAssistList then
		for iter_10_0, iter_10_1 in ipairs(arg_10_0._airAssistList) do
			iter_10_1:Update()
		end
	end
end

function var_0_9.UpdatePhaseSwitcher(arg_11_0)
	if arg_11_0._phaseSwitcher then
		arg_11_0._phaseSwitcher:Update()
	end
end

function var_0_9.SetInterruptSickness(arg_12_0, arg_12_1)
	arg_12_0._isSickness = arg_12_1
end

function var_0_9.SummonSickness(arg_13_0, arg_13_1)
	if arg_13_0._isSickness == true then
		return
	end

	local function var_13_0()
		arg_13_0:RemoveSummonSickness()
	end

	arg_13_0._isSickness = true
	arg_13_0._sicknessTimer = pg.TimeMgr.GetInstance():AddBattleTimer("summonSickness", 0, arg_13_1, var_13_0, true)
end

function var_0_9.RemoveSummonSickness(arg_15_0)
	arg_15_0._isSickness = false

	pg.TimeMgr.GetInstance():RemoveBattleTimer(arg_15_0._sicknessTimer)

	arg_15_0._sicknessTimer = nil
end

function var_0_9.GetTargetedPriority(arg_16_0)
	local var_16_0

	if arg_16_0._aimBias then
		local var_16_1 = arg_16_0._aimBias:GetCurrentState()

		if var_16_1 == arg_16_0._aimBias.STATE_SKILL_EXPOSE or var_16_1 == arg_16_0._aimBias.STATE_TOTAL_EXPOSE then
			var_16_0 = arg_16_0:GetTemplate().battle_unit_type
		else
			var_16_0 = -200
		end
	else
		var_16_0 = arg_16_0:GetTemplate().battle_unit_type
	end

	return var_16_0
end

function var_0_9.PlayFX(arg_17_0, arg_17_1, arg_17_2)
	arg_17_0:DispatchEvent(var_0_0.Event.New(var_0_1.PLAY_FX, {
		fxName = arg_17_1,
		notAttach = not arg_17_2
	}))
end

function var_0_9.SwitchShader(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
	arg_18_0:DispatchEvent(var_0_0.Event.New(var_0_1.SWITCH_SHADER, {
		shader = arg_18_1,
		color = arg_18_2,
		args = arg_18_3
	}))
end

function var_0_9.SendAttackTrigger(arg_19_0)
	arg_19_0:DispatchEvent(var_0_0.Event.New(var_0_1.SPAWN_CACHE_BULLET, {}))
end

function var_0_9.HandleDamageToDeath(arg_20_0)
	local var_20_0 = {
		isMiss = false,
		isCri = true,
		isHeal = false,
		damageReason = var_0_3.UnitDeathReason.DESTRUCT
	}

	arg_20_0:UpdateHP(math.floor(-arg_20_0._currentHP), var_20_0)
end

function var_0_9.UpdateHP(arg_21_0, arg_21_1, arg_21_2)
	if not arg_21_0:IsAlive() then
		return 0
	end

	local var_21_0 = arg_21_0:IsAlive()

	if not var_21_0 then
		return 0
	end

	local var_21_1 = arg_21_2.isMiss
	local var_21_2 = arg_21_2.isCri
	local var_21_3 = arg_21_2.isHeal
	local var_21_4 = arg_21_2.isShare
	local var_21_5 = arg_21_2.attr
	local var_21_6 = arg_21_2.damageReason
	local var_21_7 = arg_21_2.font
	local var_21_8 = arg_21_2.cldPos
	local var_21_9 = arg_21_2.incorrupt
	local var_21_10

	if not var_21_3 then
		local var_21_11 = {
			damage = -arg_21_1,
			isShare = var_21_4,
			miss = var_21_1,
			cri = var_21_2,
			damageSrc = arg_21_2.srcID,
			damageAttr = var_21_5,
			damageReason = var_21_6
		}

		if not var_21_4 then
			arg_21_0:TriggerBuff(var_0_3.BuffEffectType.ON_BEFORE_TAKE_DAMAGE, var_21_11)

			if var_21_11.capFlag then
				arg_21_0:TriggerBuff(var_0_3.BuffEffectType.ON_DAMAGE_FIX, var_21_11)
			end
		end

		var_21_10 = -var_21_11.damage

		arg_21_0:TriggerBuff(var_0_3.BuffEffectType.ON_TAKE_DAMAGE, var_21_11)

		if arg_21_0._currentHP <= var_21_11.damage then
			arg_21_0:TriggerBuff(var_0_3.BuffEffectType.ON_BEFORE_FATAL_DAMAGE, {})
		end

		arg_21_1 = -var_21_11.damage

		if var_21_10 ~= arg_21_1 then
			({}).absorb = var_21_10 - arg_21_1

			arg_21_0:TriggerBuff(var_0_3.BuffEffectType.ON_SHIELD_ABSORB, var_21_11)
		end

		if var_0_6.IsInvincible(arg_21_0) then
			return 0
		end
	else
		var_21_10 = arg_21_1

		local var_21_12 = {
			damage = arg_21_1,
			isHeal = var_21_3,
			incorrupt = var_21_9
		}

		arg_21_0:TriggerBuff(var_0_3.BuffEffectType.ON_TAKE_HEALING, var_21_12)

		var_21_3 = var_21_12.isHeal
		arg_21_1 = var_21_12.damage

		local var_21_13 = math.max(0, arg_21_0._currentHP + arg_21_1 - arg_21_0:GetMaxHP())

		if var_21_13 > 0 then
			arg_21_0:TriggerBuff(var_0_3.BuffEffectType.ON_OVER_HEALING, {
				overHealing = var_21_13
			})
		end
	end

	local var_21_14 = math.min(arg_21_0:GetMaxHP(), math.max(0, arg_21_0._currentHP + arg_21_1))
	local var_21_15 = var_21_14 - arg_21_0._currentHP

	arg_21_0:SetCurrentHP(var_21_14)

	local var_21_16 = {
		preShieldHP = var_21_10,
		dHP = arg_21_1,
		validDHP = var_21_15,
		isMiss = var_21_1,
		isCri = var_21_2,
		isHeal = var_21_3,
		font = var_21_7
	}

	if var_21_8 and not var_21_8:EqualZero() then
		local var_21_17 = arg_21_0:GetPosition()
		local var_21_18 = arg_21_0:GetBoxSize().x
		local var_21_19 = var_21_17.x - var_21_18
		local var_21_20 = var_21_17.x + var_21_18
		local var_21_21 = var_21_8:Clone()

		var_21_21.x = Mathf.Clamp(var_21_21.x, var_21_19, var_21_20)
		var_21_16.posOffset = var_21_17 - var_21_21
	end

	arg_21_0:UpdateHPAction(var_21_16)

	if not arg_21_0:IsAlive() and var_21_0 then
		arg_21_0:SetDeathReason(arg_21_2.damageReason)
		arg_21_0:DeadAction()
	end

	if arg_21_0:IsAlive() then
		arg_21_0:TriggerBuff(var_0_3.BuffEffectType.ON_HP_RATIO_UPDATE, {
			dHP = arg_21_1,
			unit = arg_21_0,
			validDHP = var_21_15
		})
	end

	return arg_21_1
end

function var_0_9.UpdateHPAction(arg_22_0, arg_22_1)
	arg_22_0:DispatchEvent(var_0_0.Event.New(var_0_1.UPDATE_HP, arg_22_1))
end

function var_0_9.DeadAction(arg_23_0)
	arg_23_0:TriggerBuff(var_0_3.BuffEffectType.ON_SINK, {})
	arg_23_0:DeacActionClear()
end

function var_0_9.DeacActionClear(arg_24_0)
	arg_24_0._aliveState = false

	var_0_6.Spirit(arg_24_0)
	var_0_6.AppendInvincible(arg_24_0)
	arg_24_0:DeadActionEvent()
end

function var_0_9.DeadActionEvent(arg_25_0)
	arg_25_0:DispatchEvent(var_0_0.Event.New(var_0_1.WILL_DIE, {}))
	arg_25_0:DispatchEvent(var_0_0.Event.New(var_0_1.DYING, {}))
end

function var_0_9.SendDeadEvent(arg_26_0)
	arg_26_0:DispatchEvent(var_0_0.Event.New(var_0_0.Battle.BattleUnitEvent.DYING, {}))
end

function var_0_9.SetDeathReason(arg_27_0, arg_27_1)
	arg_27_0._deathReason = arg_27_1
end

function var_0_9.GetDeathReason(arg_28_0)
	return arg_28_0._deathReason or var_0_3.UnitDeathReason.KILLED
end

function var_0_9.DispatchScorePoint(arg_29_0, arg_29_1)
	arg_29_0:DispatchEvent(var_0_0.Event.New(var_0_0.Battle.BattleUnitEvent.UPDATE_SCORE, {
		score = arg_29_1
	}))
end

function var_0_9.SetTemplate(arg_30_0, arg_30_1, arg_30_2)
	arg_30_0._tmpID = arg_30_1
end

function var_0_9.GetTemplateID(arg_31_0)
	return arg_31_0._tmpID
end

function var_0_9.SetOverrideLevel(arg_32_0, arg_32_1)
	arg_32_0._overrideLevel = arg_32_1
end

function var_0_9.SetSkinId(arg_33_0)
	return
end

function var_0_9.SetGearScore(arg_34_0, arg_34_1)
	arg_34_0._GS = arg_34_1
end

function var_0_9.GetGearScore(arg_35_0)
	return arg_35_0._GS or 0
end

function var_0_9.GetSkinID(arg_36_0)
	return arg_36_0._tmpID
end

function var_0_9.GetDefaultSkinID(arg_37_0)
	return arg_37_0._tmpID
end

function var_0_9.GetSkinAttachmentInfo(arg_38_0)
	return arg_38_0._orbitSkinIDList
end

function var_0_9.GetWeaponBoundBone(arg_39_0)
	return arg_39_0._tmpData.bound_bone
end

function var_0_9.ActionKeyOffsetUseable(arg_40_0)
	return true
end

function var_0_9.RemoveRemoteBoundBone(arg_41_0, arg_41_1)
	arg_41_0._remoteBoundBone[arg_41_1] = nil
end

function var_0_9.SetRemoteBoundBone(arg_42_0, arg_42_1, arg_42_2, arg_42_3)
	local var_42_0 = arg_42_0._remoteBoundBone[arg_42_1] or {}

	var_42_0[arg_42_2] = arg_42_3
	arg_42_0._remoteBoundBone[arg_42_1] = var_42_0
end

function var_0_9.GetRemoteBoundBone(arg_43_0, arg_43_1)
	for iter_43_0, iter_43_1 in pairs(arg_43_0._remoteBoundBone) do
		local var_43_0 = iter_43_1[arg_43_1]

		if var_43_0 then
			local var_43_1 = var_0_0.Battle.BattleTargetChoise.TargetFleetIndex(arg_43_0, {
				fleetPos = var_43_0
			})[1]

			if var_43_1 and var_43_1:IsAlive() then
				local var_43_2 = Clone(var_43_1:GetPosition())

				var_43_2:Set(var_43_2.x, 1.5, var_43_2.z)

				return var_43_2
			end
		end
	end
end

function var_0_9.GetLabelTag(arg_44_0)
	return arg_44_0._labelTagList
end

function var_0_9.ContainsLabelTag(arg_45_0, arg_45_1)
	if arg_45_0._labelTagList == nil then
		return false
	end

	for iter_45_0, iter_45_1 in ipairs(arg_45_1) do
		if table.contains(arg_45_0._labelTagList, iter_45_1) then
			return true
		end
	end

	return false
end

function var_0_9.AddLabelTag(arg_46_0, arg_46_1)
	table.insert(arg_46_0._labelTagList, arg_46_1)

	local var_46_0 = var_0_6.GetCurrent(arg_46_0, "labelTag")

	var_46_0[arg_46_1] = (var_46_0[arg_46_1] or 0) + 1
end

function var_0_9.RemoveLabelTag(arg_47_0, arg_47_1)
	for iter_47_0, iter_47_1 in ipairs(arg_47_0._labelTagList) do
		if iter_47_1 == arg_47_1 then
			table.remove(arg_47_0._labelTagList, iter_47_0)

			local var_47_0 = var_0_6.GetCurrent(arg_47_0, "labelTag")

			var_47_0[arg_47_1] = var_47_0[arg_47_1] - 1

			break
		end
	end
end

function var_0_9.setStandardLabelTag(arg_48_0)
	local var_48_0 = "N_" .. arg_48_0._tmpData.nationality
	local var_48_1 = "T_" .. arg_48_0._tmpData.type

	arg_48_0:AddLabelTag(var_48_0)
	arg_48_0:AddLabelTag(var_48_1)
end

function var_0_9.GetRarity(arg_49_0)
	return
end

function var_0_9.GetIntimacy(arg_50_0)
	return 0
end

function var_0_9.IsBoss(arg_51_0)
	return false
end

function var_0_9.GetSpeedRatio(arg_52_0)
	return var_0_4.GetSpeedRatio(arg_52_0:GetSpeedExemptKey(), arg_52_0._IFF)
end

function var_0_9.GetSpeedExemptKey(arg_53_0)
	return arg_53_0._speedExemptKey
end

function var_0_9.SetMoveCast(arg_54_0, arg_54_1)
	arg_54_0._moveCast = arg_54_1
end

function var_0_9.IsMoveCast(arg_55_0)
	return arg_55_0._moveCast
end

function var_0_9.SetCrash(arg_56_0, arg_56_1)
	arg_56_0._isCrash = arg_56_1

	if arg_56_1 then
		local var_56_0 = var_0_0.Battle.BattleBuffUnit.New(var_0_5.SHIP_CLD_BUFF)

		arg_56_0:AddBuff(var_56_0)
	else
		arg_56_0:RemoveBuff(var_0_5.SHIP_CLD_BUFF)
	end
end

function var_0_9.IsCrash(arg_57_0)
	return arg_57_0._isCrash
end

function var_0_9.OverrideDeadFX(arg_58_0, arg_58_1)
	arg_58_0._deadFX = arg_58_1
end

function var_0_9.GetDeadFX(arg_59_0)
	return arg_59_0._deadFX
end

function var_0_9.SetEquipment(arg_60_0, arg_60_1)
	arg_60_0._equipmentList = arg_60_1
	arg_60_0._autoWeaponList = {}
	arg_60_0._manualTorpedoList = {}
	arg_60_0._chargeList = {}
	arg_60_0._AAList = {}
	arg_60_0._fleetAAList = {}
	arg_60_0._fleetRangeAAList = {}
	arg_60_0._hiveList = {}
	arg_60_0._totalWeapon = {}

	arg_60_0:setWeapon(arg_60_1)
end

function var_0_9.GetEquipment(arg_61_0)
	return arg_61_0._equipmentList
end

function var_0_9.SetProficiencyList(arg_62_0, arg_62_1)
	arg_62_0._proficiencyList = arg_62_1
end

function var_0_9.SetSpWeapon(arg_63_0, arg_63_1)
	arg_63_0._spWeapon = arg_63_1
end

function var_0_9.GetSpWeapon(arg_64_0)
	return arg_64_0._spWeapon
end

function var_0_9.setWeapon(arg_65_0, arg_65_1)
	for iter_65_0, iter_65_1 in ipairs(arg_65_1) do
		local var_65_0 = iter_65_1.equipment.weapon_id

		for iter_65_2, iter_65_3 in ipairs(var_65_0) do
			if iter_65_3 ~= -1 then
				local var_65_1 = var_0_0.Battle.BattleDataFunction.CreateWeaponUnit(iter_65_3, arg_65_0, nil, iter_65_0)

				arg_65_0._totalWeapon[#arg_65_0._totalWeapon + 1] = var_65_1

				local var_65_2 = var_65_1:GetTemplateData().type

				if var_65_2 == var_0_3.EquipmentType.MANUAL_TORPEDO then
					arg_65_0._manualTorpedoList[#arg_65_0._manualTorpedoList + 1] = var_65_1

					arg_65_0._weaponQueue:AppendWeapon(var_65_1)
				elseif var_65_2 == var_0_3.EquipmentType.STRIKE_AIRCRAFT then
					-- block empty
				else
					assert(#var_65_0 < 2, "自动武器一组不允许配置多个")
					arg_65_0:AddAutoWeapon(var_65_1)
				end

				if var_65_2 == var_0_3.EquipmentType.INTERCEPT_AIRCRAFT or var_65_2 == var_0_3.EquipmentType.STRIKE_AIRCRAFT then
					arg_65_0._hiveList[#arg_65_0._hiveList + 1] = var_65_1
				end

				if var_65_2 == var_0_3.EquipmentType.ANTI_AIR then
					arg_65_0._AAList[#arg_65_0._AAList + 1] = var_65_1
				end
			end
		end
	end
end

function var_0_9.CheckWeaponInitial(arg_66_0)
	arg_66_0._weaponQueue:CheckWeaponInitalCD()

	if arg_66_0._airAssistQueue then
		arg_66_0._airAssistQueue:CheckWeaponInitalCD()
	end

	arg_66_0:DispatchEvent(var_0_0.Event.New(var_0_1.INIT_COOL_DOWN, {}))
end

function var_0_9.FlushReloadingWeapon(arg_67_0)
	arg_67_0._weaponQueue:FlushWeaponReloadRequire()

	if arg_67_0._airAssistQueue then
		arg_67_0._airAssistQueue:FlushWeaponReloadRequire()
	end
end

function var_0_9.AddNewAutoWeapon(arg_68_0, arg_68_1)
	local var_68_0 = var_0_7.CreateWeaponUnit(arg_68_1, arg_68_0)

	arg_68_0:AddAutoWeapon(var_68_0)
	arg_68_0:DispatchEvent(var_0_0.Event.New(var_0_0.Battle.BattleBuffEvent.BUFF_EFFECT_NEW_WEAPON, {
		weapon = var_68_0
	}))

	return var_68_0
end

function var_0_9.AddAutoWeapon(arg_69_0, arg_69_1)
	arg_69_0._autoWeaponList[#arg_69_0._autoWeaponList + 1] = arg_69_1

	arg_69_0._weaponQueue:AppendWeapon(arg_69_1)
end

function var_0_9.RemoveAutoWeapon(arg_70_0, arg_70_1)
	arg_70_0._weaponQueue:RemoveWeapon(arg_70_1)

	local var_70_0 = 1
	local var_70_1 = #arg_70_0._autoWeaponList

	while var_70_0 <= var_70_1 do
		if arg_70_0._autoWeaponList[var_70_0] == arg_70_1 then
			arg_70_0:DispatchEvent(var_0_0.Event.New(var_0_1.REMOVE_WEAPON, {
				weapon = arg_70_1
			}))
			table.remove(arg_70_0._autoWeaponList, var_70_0)

			break
		end

		var_70_0 = var_70_0 + 1
	end
end

function var_0_9.RemoveAutoWeaponByWeaponID(arg_71_0, arg_71_1)
	for iter_71_0, iter_71_1 in ipairs(arg_71_0._autoWeaponList) do
		if iter_71_1:GetWeaponId() == arg_71_1 then
			iter_71_1:Clear()
			arg_71_0:RemoveAutoWeapon(iter_71_1)

			break
		end
	end
end

function var_0_9.RemoveAllAutoWeapon(arg_72_0)
	local var_72_0 = #arg_72_0._autoWeaponList

	while var_72_0 > 0 do
		local var_72_1 = arg_72_0._autoWeaponList[var_72_0]

		var_72_1:Clear()
		arg_72_0:RemoveAutoWeapon(var_72_1)

		var_72_0 = var_72_0 - 1
	end
end

function var_0_9.AddFleetAntiAirWeapon(arg_73_0, arg_73_1)
	return
end

function var_0_9.RemoveFleetAntiAirWeapon(arg_74_0, arg_74_1)
	return
end

function var_0_9.AttachFleetRangeAAWeapon(arg_75_0, arg_75_1)
	arg_75_0._fleetRangeAA = arg_75_1

	arg_75_0:DispatchEvent(var_0_0.Event.New(var_0_1.CREATE_TEMPORARY_WEAPON, {
		weapon = arg_75_1
	}))
end

function var_0_9.DetachFleetRangeAAWeapon(arg_76_0)
	arg_76_0:DispatchEvent(var_0_0.Event.New(var_0_1.REMOVE_WEAPON, {
		weapon = arg_76_0._fleetRangeAA
	}))

	arg_76_0._fleetRangeAA = nil
end

function var_0_9.GetFleetRangeAAWeapon(arg_77_0)
	return arg_77_0._fleetRangeAA
end

function var_0_9.ShiftWeapon(arg_78_0, arg_78_1, arg_78_2)
	for iter_78_0, iter_78_1 in ipairs(arg_78_1) do
		arg_78_0:RemoveAutoWeaponByWeaponID(iter_78_1)
	end

	for iter_78_2, iter_78_3 in ipairs(arg_78_2) do
		arg_78_0:AddNewAutoWeapon(iter_78_3):InitialCD()
	end
end

function var_0_9.ExpandWeaponMount(arg_79_0, arg_79_1)
	if arg_79_1 == "airAssist" then
		var_0_7.ExpandAllinStrike(arg_79_0)
	end
end

function var_0_9.ReduceWeaponMount(arg_80_0, arg_80_1)
	return
end

function var_0_9.CeaseAllWeapon(arg_81_0, arg_81_1)
	arg_81_0._ceaseFire = arg_81_1
end

function var_0_9.IsCease(arg_82_0)
	return arg_82_0._ceaseFire
end

function var_0_9.GetAllWeapon(arg_83_0)
	return arg_83_0._totalWeapon
end

function var_0_9.GetTotalWeapon(arg_84_0)
	return arg_84_0._weaponQueue:GetTotalWeaponUnit()
end

function var_0_9.GetAutoWeapons(arg_85_0)
	return arg_85_0._autoWeaponList
end

function var_0_9.GetChargeList(arg_86_0)
	return arg_86_0._chargeList
end

function var_0_9.GetChargeQueue(arg_87_0)
	return arg_87_0._weaponQueue:GetChargeWeaponQueue()
end

function var_0_9.GetAntiAirWeapon(arg_88_0)
	return arg_88_0._AAList
end

function var_0_9.GetFleetAntiAirList(arg_89_0)
	return arg_89_0._fleetAAList
end

function var_0_9.GetFleetRangeAntiAirList(arg_90_0)
	return arg_90_0._fleetRangeAAList
end

function var_0_9.GetTorpedoList(arg_91_0)
	return arg_91_0._manualTorpedoList
end

function var_0_9.GetTorpedoQueue(arg_92_0)
	return arg_92_0._weaponQueue:GetManualTorpedoQueue()
end

function var_0_9.GetWeaponByIndex(arg_93_0, arg_93_1)
	for iter_93_0, iter_93_1 in ipairs(arg_93_0._totalWeapon) do
		if iter_93_1:GetEquipmentIndex() == arg_93_1 then
			return iter_93_1
		end
	end
end

function var_0_9.GetHiveList(arg_94_0)
	return arg_94_0._hiveList
end

function var_0_9.SetAirAssistList(arg_95_0, arg_95_1)
	arg_95_0._airAssistList = arg_95_1
	arg_95_0._airAssistQueue = var_0_0.Battle.ManualWeaponQueue.New(arg_95_0:GetManualWeaponParallel()[var_0_3.ManualWeaponIndex.AIR_ASSIST])

	for iter_95_0, iter_95_1 in ipairs(arg_95_0._airAssistList) do
		arg_95_0._airAssistQueue:AppendWeapon(iter_95_1)
	end
end

function var_0_9.GetAirAssistList(arg_96_0)
	return arg_96_0._airAssistList
end

function var_0_9.GetAirAssistQueue(arg_97_0)
	return arg_97_0._airAssistQueue
end

function var_0_9.GetManualWeaponParallel(arg_98_0)
	return {
		1,
		1,
		1
	}
end

function var_0_9.configWeaponQueueParallel(arg_99_0)
	local var_99_0 = arg_99_0:GetManualWeaponParallel()

	arg_99_0._weaponQueue:ConfigParallel(var_99_0[var_0_3.ManualWeaponIndex.CALIBRATION], var_99_0[var_0_3.ManualWeaponIndex.TORPEDO])
end

function var_0_9.ClearWeapon(arg_100_0)
	arg_100_0._weaponQueue:ClearAllWeapon()

	local var_100_0 = arg_100_0._airAssistList

	if var_100_0 then
		for iter_100_0, iter_100_1 in ipairs(var_100_0) do
			iter_100_1:Clear()
		end
	end
end

function var_0_9.GetSpeed(arg_101_0)
	return arg_101_0._move:GetSpeed()
end

function var_0_9.GetPosition(arg_102_0)
	return arg_102_0._move:GetPos()
end

function var_0_9.GetBornPosition(arg_103_0)
	return arg_103_0._bornPos
end

function var_0_9.GetCLDZCenterPosition(arg_104_0)
	local var_104_0 = arg_104_0._battleProxy.FrameIndex

	if arg_104_0._zCenterFrame ~= var_104_0 then
		arg_104_0._zCenterFrame = var_104_0

		local var_104_1 = arg_104_0:GetCldBox()

		arg_104_0._cldZCenterCache = (var_104_1.min + var_104_1.max) * 0.5
	end

	return arg_104_0._cldZCenterCache
end

function var_0_9.GetBeenAimedPosition(arg_105_0)
	local var_105_0 = arg_105_0:GetCLDZCenterPosition()

	if not var_105_0 then
		return var_105_0
	end

	local var_105_1 = arg_105_0:GetTemplate() and arg_105_0:GetTemplate().aim_offset

	if not var_105_1 then
		return var_105_0
	end

	local var_105_2 = Vector3(var_105_0.x + var_105_1[1], var_105_0.y + var_105_1[2], var_105_0.z + var_105_1[3])

	arg_105_0:biasAimPosition(var_105_2)

	return var_105_2
end

function var_0_9.biasAimPosition(arg_106_0, arg_106_1)
	local var_106_0 = var_0_6.GetCurrent(arg_106_0, "aimBias")

	if var_106_0 > 0 then
		local var_106_1 = var_106_0 * 2
		local var_106_2 = math.random() * var_106_1 - var_106_0
		local var_106_3 = math.random() * var_106_1 - var_106_0

		arg_106_1:Set(arg_106_1.x + var_106_2, arg_106_1.y, arg_106_1.z + var_106_3)
	end

	return arg_106_1
end

function var_0_9.CancelFollowTeam(arg_107_0)
	arg_107_0._move:CancelFormationCtrl()
end

function var_0_9.UpdateFormationOffset(arg_108_0, arg_108_1)
	arg_108_0._move:SetFormationCtrlInfo(Vector3(arg_108_1.x, arg_108_1.y, arg_108_1.z))
end

function var_0_9.GetDistance(arg_109_0, arg_109_1)
	local var_109_0 = arg_109_0._battleProxy.FrameIndex

	if arg_109_0._frame ~= var_109_0 then
		arg_109_0._distanceBackup = {}
		arg_109_0._frame = var_109_0
	end

	local var_109_1 = arg_109_0._distanceBackup[arg_109_1]

	if var_109_1 == nil then
		var_109_1 = Vector3.Distance(arg_109_0:GetPosition(), arg_109_1:GetPosition())
		arg_109_0._distanceBackup[arg_109_1] = var_109_1

		arg_109_1:backupDistance(arg_109_0, var_109_1)
	end

	return var_109_1
end

function var_0_9.backupDistance(arg_110_0, arg_110_1, arg_110_2)
	local var_110_0 = arg_110_0._battleProxy.FrameIndex

	if arg_110_0._frame ~= var_110_0 then
		arg_110_0._distanceBackup = {}
		arg_110_0._frame = var_110_0
	end

	arg_110_0._distanceBackup[arg_110_1] = arg_110_2
end

function var_0_9.GetDirection(arg_111_0)
	return arg_111_0._dir
end

function var_0_9.SetBornPosition(arg_112_0, arg_112_1)
	arg_112_0._bornPos = arg_112_1
end

function var_0_9.SetPosition(arg_113_0, arg_113_1)
	arg_113_0._move:SetPos(arg_113_1)
end

function var_0_9.IsMoving(arg_114_0)
	local var_114_0 = arg_114_0._move:GetSpeed()

	return var_114_0.x ~= 0 or var_114_0.z ~= 0
end

function var_0_9.SetUncontrollableSpeedWithYAngle(arg_115_0, arg_115_1, arg_115_2, arg_115_3)
	local var_115_0 = math.deg2Rad * arg_115_1
	local var_115_1 = Vector3(math.cos(var_115_0), 0, math.sin(var_115_0))

	arg_115_0:SetUncontrollableSpeed(var_115_1, arg_115_2, arg_115_3)
end

function var_0_9.SetUncontrollableSpeedWithDir(arg_116_0, arg_116_1, arg_116_2, arg_116_3)
	local var_116_0 = math.sqrt(arg_116_1.x * arg_116_1.x + arg_116_1.z * arg_116_1.z)

	arg_116_0:SetUncontrollableSpeed(arg_116_1 / var_116_0, arg_116_2, arg_116_3)
end

function var_0_9.SetUncontrollableSpeed(arg_117_0, arg_117_1, arg_117_2, arg_117_3)
	if not arg_117_2 or not arg_117_3 then
		return
	end

	arg_117_0._move:SetForceMove(arg_117_1, arg_117_2, arg_117_3, arg_117_2 / arg_117_3)
end

function var_0_9.ClearUncontrollableSpeed(arg_118_0)
	arg_118_0._move:ClearForceMove()
end

function var_0_9.SetAdditiveSpeed(arg_119_0, arg_119_1)
	arg_119_0._move:UpdateAdditiveSpeed(arg_119_1)
end

function var_0_9.RemoveAdditiveSpeed(arg_120_0)
	arg_120_0._move:RemoveAdditiveSpeed()
end

function var_0_9.Boost(arg_121_0, arg_121_1, arg_121_2, arg_121_3, arg_121_4, arg_121_5)
	arg_121_0._move:SetForceMove(arg_121_1, arg_121_2, arg_121_3, arg_121_4, arg_121_5)
end

function var_0_9.ActiveUnstoppable(arg_122_0, arg_122_1)
	arg_122_0._move:ActiveUnstoppable(arg_122_1)
end

function var_0_9.SetImmuneCommonBulletCLD(arg_123_0)
	arg_123_0._immuneCommonBulletCLD = true
end

function var_0_9.IsImmuneCommonBulletCLD(arg_124_0)
	return arg_124_0._immuneCommonBulletCLD
end

function var_0_9.SetWeaponPreCastBound(arg_125_0, arg_125_1)
	arg_125_0._preCastBound = arg_125_1

	arg_125_0:UpdatePrecastMoveLimit()
end

function var_0_9.EnterGCD(arg_126_0, arg_126_1, arg_126_2)
	if arg_126_0._GCDTimerList[arg_126_2] ~= nil then
		return
	end

	local function var_126_0()
		arg_126_0:RemoveGCDTimer(arg_126_2)
	end

	arg_126_0._weaponQueue:QueueEnterGCD(arg_126_2, arg_126_1)

	arg_126_0._GCDTimerList[arg_126_2] = pg.TimeMgr.GetInstance():AddBattleTimer("weaponGCD", 0, arg_126_1, var_126_0, true)

	arg_126_0:UpdatePrecastMoveLimit()
end

function var_0_9.RemoveGCDTimer(arg_128_0, arg_128_1)
	pg.TimeMgr.GetInstance():RemoveBattleTimer(arg_128_0._GCDTimerList[arg_128_1])

	arg_128_0._GCDTimerList[arg_128_1] = nil

	arg_128_0:UpdatePrecastMoveLimit()
end

function var_0_9.UpdatePrecastMoveLimit(arg_129_0)
	arg_129_0:UpdateMoveLimit()
end

function var_0_9.UpdateMoveLimit(arg_130_0)
	local var_130_0 = arg_130_0:IsMoveAble()

	arg_130_0._move:SetStaticState(not var_130_0)
end

function var_0_9.AddBuff(arg_131_0, arg_131_1, arg_131_2)
	local var_131_0 = arg_131_1:GetID()
	local var_131_1 = {
		unit_id = arg_131_0._uniqueID,
		buff_id = var_131_0
	}
	local var_131_2 = arg_131_0:GetBuff(var_131_0)

	if var_131_2 then
		local var_131_3 = var_131_2:GetLv()
		local var_131_4 = arg_131_1:GetLv()

		if arg_131_2 then
			local var_131_5 = arg_131_0._buffStockList[var_131_0] or {}

			table.insert(var_131_5, arg_131_1)

			arg_131_0._buffStockList[var_131_0] = var_131_5
		else
			var_131_1.buff_level = math.max(var_131_3, var_131_4)

			if var_131_4 <= var_131_3 then
				var_131_2:Stack(arg_131_0)

				var_131_1.stack_count = var_131_2:GetStack()

				arg_131_0:DispatchEvent(var_0_0.Event.New(var_0_2.BUFF_STACK, var_131_1))
			else
				arg_131_0:DispatchEvent(var_0_0.Event.New(var_0_2.BUFF_CAST, var_131_1))
				arg_131_0:RemoveBuff(var_131_0)

				arg_131_0._buffList[var_131_0] = arg_131_1

				arg_131_1:Attach(arg_131_0)
				arg_131_0:DispatchEvent(var_0_0.Event.New(var_0_2.BUFF_ATTACH, var_131_1))
			end
		end
	else
		arg_131_0:DispatchEvent(var_0_0.Event.New(var_0_2.BUFF_CAST, var_131_1))

		arg_131_0._buffList[var_131_0] = arg_131_1

		arg_131_1:Attach(arg_131_0)

		var_131_1.buff_level = arg_131_1:GetLv()

		arg_131_0:DispatchEvent(var_0_0.Event.New(var_0_2.BUFF_ATTACH, var_131_1))
	end

	arg_131_0:TriggerBuff(var_0_3.BuffEffectType.ON_BUFF_ADDED, {
		buffID = var_131_0
	})
end

function var_0_9.SetBuffStack(arg_132_0, arg_132_1, arg_132_2, arg_132_3)
	if arg_132_3 <= 0 then
		arg_132_0:RemoveBuff(arg_132_1)
	else
		local var_132_0 = arg_132_0:GetBuff(arg_132_1)

		if var_132_0 then
			var_132_0:UpdateStack(arg_132_0, arg_132_3)

			return var_132_0
		else
			local var_132_1 = var_0_0.Battle.BattleBuffUnit.New(arg_132_1, arg_132_2)

			arg_132_0:AddBuff(var_132_1)
			var_132_1:UpdateStack(arg_132_0, arg_132_3)

			return var_132_1
		end
	end
end

function var_0_9.UpdateBuff(arg_133_0, arg_133_1)
	local var_133_0 = arg_133_0._buffList

	for iter_133_0, iter_133_1 in pairs(var_133_0) do
		iter_133_1:Update(arg_133_0, arg_133_1)

		if not arg_133_0:IsAlive() then
			break
		end
	end
end

function var_0_9.ConsumeBuffStack(arg_134_0, arg_134_1, arg_134_2)
	local var_134_0 = arg_134_0:GetBuff(arg_134_1)

	if var_134_0 then
		if not arg_134_2 then
			arg_134_0:RemoveBuff(arg_134_1)
		else
			local var_134_1 = var_134_0:GetStack()
			local var_134_2 = math.max(0, var_134_1 - arg_134_2)

			if var_134_2 == 0 then
				arg_134_0:RemoveBuff(arg_134_1)
			else
				var_134_0:UpdateStack(arg_134_0, var_134_2)
			end
		end
	end
end

function var_0_9.RemoveBuff(arg_135_0, arg_135_1, arg_135_2)
	if arg_135_2 and arg_135_0._buffStockList[arg_135_1] then
		local var_135_0 = table.remove(arg_135_0._buffStockList[arg_135_1])

		if var_135_0 then
			var_135_0:Clear()

			return
		end
	end

	local var_135_1 = arg_135_0:GetBuff(arg_135_1)

	if var_135_1 then
		var_135_1:Remove()
	end

	arg_135_0:TriggerBuff(var_0_3.BuffEffectType.ON_BUFF_REMOVED, {
		buffID = arg_135_1
	})
end

function var_0_9.ClearBuff(arg_136_0)
	local var_136_0 = arg_136_0._buffList

	for iter_136_0, iter_136_1 in pairs(var_136_0) do
		iter_136_1:Clear()
	end

	local var_136_1 = arg_136_0._buffStockList

	for iter_136_2, iter_136_3 in pairs(var_136_1) do
		for iter_136_4, iter_136_5 in pairs(iter_136_3) do
			iter_136_5:Clear()
		end
	end
end

function var_0_9.TriggerBuff(arg_137_0, arg_137_1, arg_137_2)
	var_0_0.Battle.BattleBuffUnit.Trigger(arg_137_0, arg_137_1, arg_137_2)
end

function var_0_9.GetBuffList(arg_138_0)
	return arg_138_0._buffList
end

function var_0_9.GetBuff(arg_139_0, arg_139_1)
	arg_139_0._buffList = arg_139_0._buffList

	return arg_139_0._buffList[arg_139_1]
end

function var_0_9.DispatchSkillFloat(arg_140_0, arg_140_1, arg_140_2, arg_140_3)
	local var_140_0 = {
		coverHrzIcon = arg_140_3,
		commander = arg_140_2,
		skillName = arg_140_1
	}

	arg_140_0:DispatchEvent(var_0_0.Event.New(var_0_1.SKILL_FLOAT, var_140_0))
end

function var_0_9.DispatchCutIn(arg_141_0, arg_141_1, arg_141_2)
	local var_141_0 = {
		caster = arg_141_0,
		skill = arg_141_1
	}

	arg_141_0:DispatchEvent(var_0_0.Event.New(var_0_1.CUT_INT, var_141_0))
end

function var_0_9.DispatchCastClock(arg_142_0, arg_142_1, arg_142_2, arg_142_3, arg_142_4, arg_142_5)
	local var_142_0 = {
		isActive = arg_142_1,
		buffEffect = arg_142_2,
		iconType = arg_142_3,
		interrupt = arg_142_4,
		reverse = arg_142_5
	}

	arg_142_0:DispatchEvent(var_0_0.Event.New(var_0_1.ADD_BUFF_CLOCK, var_142_0))
end

function var_0_9.SetAI(arg_143_0, arg_143_1)
	local var_143_0 = var_0_7.GetAITmpDataFromID(arg_143_1)

	arg_143_0._autoPilotAI = var_0_0.Battle.AutoPilot.New(arg_143_0, var_143_0), arg_143_0._move:CancelFormationCtrl()
end

function var_0_9.AddPhaseSwitcher(arg_144_0, arg_144_1)
	arg_144_0._phaseSwitcher = arg_144_1
end

function var_0_9.GetPhaseSwitcher(arg_145_0)
	return arg_145_0._phaseSwitcher
end

function var_0_9.StateChange(arg_146_0, arg_146_1, arg_146_2)
	arg_146_0._unitState:ChangeState(arg_146_1, arg_146_2)
end

function var_0_9.UpdateAction(arg_147_0)
	local var_147_0 = arg_147_0:GetSpeed().x * arg_147_0._IFF

	if arg_147_0._oxyState and arg_147_0._oxyState:GetCurrentDiveState() == var_0_3.OXY_STATE.DIVE then
		if var_147_0 >= 0 then
			arg_147_0._unitState:ChangeState(var_0_8.STATE_DIVE)
		else
			arg_147_0._unitState:ChangeState(var_0_8.STATE_DIVELEFT)
		end
	elseif var_147_0 >= 0 then
		arg_147_0._unitState:ChangeState(var_0_8.STATE_MOVE)
	else
		arg_147_0._unitState:ChangeState(var_0_8.STATE_MOVELEFT)
	end
end

function var_0_9.SetActionKeyOffset(arg_148_0, arg_148_1)
	arg_148_0._actionKeyOffset = arg_148_1

	arg_148_0._unitState:FreshActionKeyOffset()
end

function var_0_9.GetActionKeyOffset(arg_149_0)
	return arg_149_0._actionKeyOffset
end

function var_0_9.GetCurrentState(arg_150_0)
	return arg_150_0._unitState:GetCurrentStateName()
end

function var_0_9.NeedWeaponCache(arg_151_0)
	return arg_151_0._unitState:NeedWeaponCache()
end

function var_0_9.CharacterActionTriggerCallback(arg_152_0)
	arg_152_0._unitState:OnActionTrigger()
end

function var_0_9.CharacterActionEndCallback(arg_153_0)
	arg_153_0._unitState:OnActionEnd()
end

function var_0_9.CharacterActionStartCallback(arg_154_0)
	return
end

function var_0_9.DispatchChat(arg_155_0, arg_155_1, arg_155_2, arg_155_3)
	if not arg_155_1 or #arg_155_1 == 0 then
		return
	end

	local var_155_0 = {
		content = HXSet.hxLan(arg_155_1),
		duration = arg_155_2,
		key = arg_155_3
	}

	arg_155_0:DispatchEvent(var_0_0.Event.New(var_0_1.POP_UP, var_155_0))
end

function var_0_9.DispatchVoice(arg_156_0, arg_156_1)
	local var_156_0 = arg_156_0:GetIntimacy()
	local var_156_1, var_156_2, var_156_3 = ShipWordHelper.GetWordAndCV(arg_156_0:GetSkinID(), arg_156_1, 1, true, var_156_0)

	if var_156_2 then
		local var_156_4 = {
			content = var_156_2,
			key = arg_156_1
		}

		arg_156_0:DispatchEvent(var_0_0.Event.New(var_0_1.VOICE, var_156_4))
	end
end

function var_0_9.GetHostileCldList(arg_157_0)
	return arg_157_0._hostileCldList
end

function var_0_9.AppendHostileCld(arg_158_0, arg_158_1, arg_158_2)
	arg_158_0._hostileCldList[arg_158_1] = arg_158_2
end

function var_0_9.RemoveHostileCld(arg_159_0, arg_159_1)
	pg.TimeMgr.GetInstance():RemoveBattleTimer(arg_159_0._hostileCldList[arg_159_1])

	arg_159_0._hostileCldList[arg_159_1] = nil
end

function var_0_9.GetExtraInfo(arg_160_0)
	return arg_160_0._extraInfo
end

function var_0_9.GetTemplate(arg_161_0)
	return nil
end

function var_0_9.GetTemplateValue(arg_162_0, arg_162_1)
	return arg_162_0:GetTemplate()[arg_162_1]
end

function var_0_9.GetUniqueID(arg_163_0)
	return arg_163_0._uniqueID
end

function var_0_9.SetIFF(arg_164_0, arg_164_1)
	arg_164_0._IFF = arg_164_1

	if arg_164_1 == var_0_5.FRIENDLY_CODE then
		arg_164_0._dir = var_0_3.UnitDir.RIGHT
	elseif arg_164_1 == var_0_5.FOE_CODE then
		arg_164_0._dir = var_0_3.UnitDir.LEFT
	end
end

function var_0_9.GetIFF(arg_165_0)
	return arg_165_0._IFF
end

function var_0_9.GetUnitType(arg_166_0)
	return arg_166_0._type
end

function var_0_9.GetHPRate(arg_167_0)
	return arg_167_0._currentHPRate
end

function var_0_9.GetHP(arg_168_0)
	return arg_168_0._currentHP, arg_168_0:GetMaxHP()
end

function var_0_9.GetCurrentHP(arg_169_0)
	return arg_169_0._currentHP
end

function var_0_9.SetCurrentHP(arg_170_0, arg_170_1)
	arg_170_0._currentHP = arg_170_1
	arg_170_0._currentHPRate = arg_170_0._currentHP / arg_170_0:GetMaxHP()
	arg_170_0._currentDMGRate = 1 - arg_170_0._currentHPRate

	var_0_6.SetCurrent(arg_170_0, "HPRate", arg_170_0._currentHPRate)
	var_0_6.SetCurrent(arg_170_0, "DMGRate", arg_170_0._currentDMGRate)
end

function var_0_9.GetAttr(arg_171_0)
	return var_0_6.GetAttr(arg_171_0)
end

function var_0_9.GetAttrByName(arg_172_0, arg_172_1)
	return var_0_6.GetCurrent(arg_172_0, arg_172_1)
end

function var_0_9.GetMaxHP(arg_173_0)
	return arg_173_0:GetAttrByName("maxHP")
end

function var_0_9.GetReload(arg_174_0)
	return arg_174_0:GetAttrByName("loadSpeed")
end

function var_0_9.GetTorpedoPower(arg_175_0)
	return arg_175_0:GetAttrByName("torpedoPower")
end

function var_0_9.CanDoAntiSub(arg_176_0)
	return arg_176_0:GetAttrByName("antiSubPower") > 0
end

function var_0_9.IsShowHPBar(arg_177_0)
	return false
end

function var_0_9.IsAlive(arg_178_0)
	local var_178_0 = arg_178_0:GetCurrentHP()

	return arg_178_0._aliveState and var_178_0 > 0
end

function var_0_9.SetMainFleetUnit(arg_179_0)
	arg_179_0._isMainFleetUnit = true

	arg_179_0:SetMainUnitStatic(true)
end

function var_0_9.IsMainFleetUnit(arg_180_0)
	return arg_180_0._isMainFleetUnit
end

function var_0_9.SetMainUnitStatic(arg_181_0, arg_181_1)
	arg_181_0._isMainStatic = arg_181_1

	arg_181_0._move:SetStaticState(arg_181_1)
end

function var_0_9.SetMainUnitIndex(arg_182_0, arg_182_1)
	arg_182_0._mainUnitIndex = arg_182_1
end

function var_0_9.GetMainUnitIndex(arg_183_0)
	return arg_183_0._mainUnitIndex or 1
end

function var_0_9.IsMoveAble(arg_184_0)
	local var_184_0 = table.getCount(arg_184_0._GCDTimerList) > 0 or arg_184_0._preCastBound
	local var_184_1 = var_0_6.IsStun(arg_184_0)
	local var_184_2 = arg_184_0:IsMoveCast()

	return not arg_184_0._isMainStatic and (var_184_2 or not var_184_0) and not var_184_1
end

function var_0_9.Reinforce(arg_185_0)
	arg_185_0._isReinforcement = true
end

function var_0_9.IsReinforcement(arg_186_0)
	return arg_186_0._isReinforcement
end

function var_0_9.SetReinforceCastTime(arg_187_0, arg_187_1)
	arg_187_0._reinforceCastTime = arg_187_1
end

function var_0_9.GetReinforceCastTime(arg_188_0)
	return arg_188_0._reinforceCastTime
end

function var_0_9.GetFleetVO(arg_189_0)
	return
end

function var_0_9.SetFormationIndex(arg_190_0, arg_190_1)
	return
end

function var_0_9.SetMaster(arg_191_0)
	return
end

function var_0_9.GetMaster(arg_192_0)
	return nil
end

function var_0_9.IsSpectre(arg_193_0)
	return
end

function var_0_9.Clear(arg_194_0)
	arg_194_0._aliveState = false

	for iter_194_0, iter_194_1 in pairs(arg_194_0._hostileCldList) do
		arg_194_0:RemoveHostileCld(iter_194_0)
	end

	arg_194_0:ClearWeapon()
	arg_194_0:ClearBuff()

	arg_194_0._distanceBackup = {}
end

function var_0_9.Dispose(arg_195_0)
	arg_195_0._exposedList = nil
	arg_195_0._phaseSwitcher = nil

	arg_195_0._weaponQueue:Dispose()

	if arg_195_0._airAssistQueue then
		arg_195_0._airAssistQueue:Clear()

		arg_195_0._airAssistQueue = nil
	end

	arg_195_0._equipmentList = nil
	arg_195_0._totalWeapon = nil

	local var_195_0 = arg_195_0._airAssistList

	if var_195_0 then
		for iter_195_0, iter_195_1 in ipairs(var_195_0) do
			iter_195_1:Dispose()
		end
	end

	for iter_195_2, iter_195_3 in ipairs(arg_195_0._fleetAAList) do
		iter_195_3:Dispose()
	end

	for iter_195_4, iter_195_5 in ipairs(arg_195_0._fleetRangeAAList) do
		iter_195_5:Dispose()
	end

	local var_195_1 = arg_195_0._buffList

	for iter_195_6, iter_195_7 in pairs(var_195_1) do
		iter_195_7:Dispose()
	end

	local var_195_2 = arg_195_0._buffStockList

	for iter_195_8, iter_195_9 in pairs(var_195_2) do
		for iter_195_10, iter_195_11 in pairs(iter_195_9) do
			iter_195_11:Clear()
		end
	end

	arg_195_0._fleetRangeAA = nil
	arg_195_0._aimBias = nil
	arg_195_0._buffList = nil
	arg_195_0._buffStockList = nil
	arg_195_0._cldZCenterCache = nil
	arg_195_0._remoteBoundBone = nil

	arg_195_0:RemoveSummonSickness()
	var_0_0.EventDispatcher.DetachEventDispatcher(arg_195_0)
end

function var_0_9.InitCldComponent(arg_196_0)
	local var_196_0 = arg_196_0:GetTemplate().cld_box
	local var_196_1 = arg_196_0:GetTemplate().cld_offset
	local var_196_2 = var_196_1[1]

	if arg_196_0:GetDirection() == var_0_3.UnitDir.LEFT then
		var_196_2 = var_196_2 * -1
	end

	arg_196_0._cldComponent = var_0_0.Battle.BattleCubeCldComponent.New(var_196_0[1], var_196_0[2], var_196_0[3], var_196_2, var_196_1[3] + var_196_0[3] / 2)
end

function var_0_9.GetBoxSize(arg_197_0)
	return arg_197_0._cldComponent:GetCldBoxSize()
end

function var_0_9.GetCldBox(arg_198_0)
	return arg_198_0._cldComponent:GetCldBox(arg_198_0:GetPosition())
end

function var_0_9.GetCldData(arg_199_0)
	return arg_199_0._cldComponent:GetCldData()
end

function var_0_9.InitOxygen(arg_200_0)
	arg_200_0._maxOxy = arg_200_0:GetAttrByName("oxyMax")
	arg_200_0._currentOxy = arg_200_0:GetAttrByName("oxyMax")
	arg_200_0._oxyRecovery = arg_200_0:GetAttrByName("oxyRecovery")
	arg_200_0._oxyRecoveryBench = arg_200_0:GetAttrByName("oxyRecoveryBench")
	arg_200_0._oxyRecoverySurface = arg_200_0:GetAttrByName("oxyRecoverySurface")
	arg_200_0._oxyConsume = arg_200_0:GetAttrByName("oxyCost")
	arg_200_0._oxyState = var_0_0.Battle.OxyState.New(arg_200_0)

	arg_200_0._oxyState:OnDiveState()
	arg_200_0:ConfigBubbleFX()

	return arg_200_0._oxyState
end

function var_0_9.UpdateOxygen(arg_201_0, arg_201_1)
	if arg_201_0._oxyState then
		arg_201_0._lastOxyUpdateStamp = arg_201_0._lastOxyUpdateStamp or arg_201_1

		arg_201_0._oxyState:UpdateOxygen()

		if arg_201_0._oxyState:GetNextBubbleStamp() and arg_201_1 > arg_201_0._oxyState:GetNextBubbleStamp() then
			arg_201_0._oxyState:FlashBubbleStamp(arg_201_1)
			arg_201_0:PlayFX(arg_201_0._bubbleFX, true)
		end

		arg_201_0._lastOxyUpdateStamp = arg_201_1

		arg_201_0:updateSonarExposeTag()
	end
end

function var_0_9.OxyRecover(arg_202_0, arg_202_1)
	local var_202_0

	if arg_202_1 == var_0_0.Battle.OxyState.STATE_FREE_BENCH then
		var_202_0 = arg_202_0._oxyRecoveryBench
	elseif arg_202_1 == var_0_0.Battle.OxyState.STATE_FREE_FLOAT then
		var_202_0 = arg_202_0._oxyRecovery
	else
		var_202_0 = arg_202_0._oxyRecoverySurface
	end

	local var_202_1 = pg.TimeMgr.GetInstance():GetCombatTime() - arg_202_0._lastOxyUpdateStamp

	arg_202_0._currentOxy = math.min(arg_202_0._maxOxy, arg_202_0._currentOxy + var_202_0 * var_202_1)
end

function var_0_9.OxyConsume(arg_203_0)
	local var_203_0 = pg.TimeMgr.GetInstance():GetCombatTime() - arg_203_0._lastOxyUpdateStamp

	arg_203_0._currentOxy = math.max(0, arg_203_0._currentOxy - arg_203_0._oxyConsume * var_203_0)
end

function var_0_9.ChangeOxygenState(arg_204_0, arg_204_1)
	arg_204_0._oxyState:ChangeState(arg_204_1)
end

function var_0_9.ChangeWeaponDiveState(arg_205_0)
	for iter_205_0, iter_205_1 in ipairs(arg_205_0._autoWeaponList) do
		iter_205_1:ChangeDiveState()
	end
end

function var_0_9.GetOxygenProgress(arg_206_0)
	return arg_206_0._currentOxy / arg_206_0._maxOxy
end

function var_0_9.GetCuurentOxygen(arg_207_0)
	return arg_207_0._currentOxy or 0
end

function var_0_9.ConfigBubbleFX(arg_208_0)
	return
end

function var_0_9.SetDiveInvisible(arg_209_0, arg_209_1)
	arg_209_0._diveInvisible = arg_209_1

	arg_209_0:DispatchEvent(var_0_0.Event.New(var_0_1.SUBMARINE_VISIBLE))
	arg_209_0:DispatchEvent(var_0_0.Event.New(var_0_1.SUBMARINE_DETECTED))
	arg_209_0:dispatchDetectedTrigger()
end

function var_0_9.GetDiveInvisible(arg_210_0)
	return arg_210_0._diveInvisible
end

function var_0_9.GetOxygenVisible(arg_211_0)
	return arg_211_0._oxyState and arg_211_0._oxyState:GetBarVisible()
end

function var_0_9.SetForceVisible(arg_212_0)
	arg_212_0:DispatchEvent(var_0_0.Event.New(var_0_1.SUBMARINE_FORCE_DETECTED))
end

function var_0_9.Detected(arg_213_0, arg_213_1)
	local var_213_0

	if arg_213_0._exposedToSnoar == false and not arg_213_0._exposedOverTimeStamp then
		var_213_0 = true
	end

	if arg_213_1 then
		arg_213_0:updateExposeTimeStamp(arg_213_1)
	else
		arg_213_0._exposedToSnoar = true
	end

	if var_213_0 then
		arg_213_0:DispatchEvent(var_0_0.Event.New(var_0_1.SUBMARINE_DETECTED, {}))
		arg_213_0:dispatchDetectedTrigger()
	end
end

function var_0_9.Undetected(arg_214_0)
	arg_214_0._exposedToSnoar = false

	arg_214_0:updateExposeTimeStamp(var_0_5.SUB_EXPOSE_LASTING_DURATION)
end

function var_0_9.RemoveSonarExpose(arg_215_0)
	arg_215_0._exposedToSnoar = false
	arg_215_0._exposedOverTimeStamp = nil
end

function var_0_9.updateSonarExposeTag(arg_216_0)
	if arg_216_0._exposedOverTimeStamp and not arg_216_0._exposedToSnoar and pg.TimeMgr.GetInstance():GetCombatTime() > arg_216_0._exposedOverTimeStamp then
		arg_216_0._exposedOverTimeStamp = nil

		arg_216_0:DispatchEvent(var_0_0.Event.New(var_0_1.SUBMARINE_DETECTED, {
			detected = false
		}))
		arg_216_0:dispatchDetectedTrigger()
	end
end

function var_0_9.updateExposeTimeStamp(arg_217_0, arg_217_1)
	local var_217_0 = pg.TimeMgr.GetInstance():GetCombatTime() + arg_217_1

	arg_217_0._exposedOverTimeStamp = arg_217_0._exposedOverTimeStamp or 0
	arg_217_0._exposedOverTimeStamp = var_217_0 < arg_217_0._exposedOverTimeStamp and arg_217_0._exposedOverTimeStamp or var_217_0
end

function var_0_9.IsRunMode(arg_218_0)
	return arg_218_0._oxyState and arg_218_0._oxyState:GetRundMode()
end

function var_0_9.GetDiveDetected(arg_219_0)
	return arg_219_0:GetDiveInvisible() and (arg_219_0._exposedOverTimeStamp or arg_219_0._exposedToSnoar)
end

function var_0_9.GetForceExpose(arg_220_0)
	return arg_220_0._oxyState and arg_220_0._oxyState:GetForceExpose()
end

function var_0_9.dispatchDetectedTrigger(arg_221_0)
	if arg_221_0:GetDiveDetected() then
		arg_221_0:TriggerBuff(var_0_3.BuffEffectType.ON_SUB_DETECTED, {})
	else
		arg_221_0:TriggerBuff(var_0_3.BuffEffectType.ON_SUB_UNDETECTED, {})
	end
end

function var_0_9.GetRaidDuration(arg_222_0)
	return arg_222_0:GetAttrByName("oxyMax") / arg_222_0:GetAttrByName("oxyCost")
end

function var_0_9.EnterRaidRange(arg_223_0)
	if arg_223_0:GetPosition().x > arg_223_0._subRaidLine then
		return true
	else
		return false
	end
end

function var_0_9.EnterRetreatRange(arg_224_0)
	if arg_224_0:GetPosition().x < arg_224_0._subRetreatLine then
		return true
	else
		return false
	end
end

function var_0_9.GetOxyState(arg_225_0)
	return arg_225_0._oxyState
end

function var_0_9.GetCurrentOxyState(arg_226_0)
	if not arg_226_0._oxyState then
		return var_0_3.OXY_STATE.FLOAT
	else
		return arg_226_0._oxyState:GetCurrentDiveState()
	end
end

function var_0_9.InitAntiSubState(arg_227_0, arg_227_1, arg_227_2)
	arg_227_0._antiSubVigilanceState = var_0_0.Battle.AntiSubState.New(arg_227_0)

	arg_227_0:DispatchEvent(var_0_0.Event.New(var_0_1.INIT_ANIT_SUB_VIGILANCE, {
		sonarRange = arg_227_1
	}))

	return arg_227_0._antiSubVigilanceState
end

function var_0_9.GetAntiSubState(arg_228_0)
	return arg_228_0._antiSubVigilanceState
end

function var_0_9.UpdateBlindInvisibleBySpectre(arg_229_0)
	local var_229_0, var_229_1 = arg_229_0:IsSpectre()

	if var_229_1 <= var_0_5.SPECTRE_UNIT_TYPE and var_229_1 ~= var_0_5.VISIBLE_SPECTRE_UNIT_TYPE then
		arg_229_0:SetBlindInvisible(true)
	else
		arg_229_0:SetBlindInvisible(false)
	end
end

function var_0_9.SetBlindInvisible(arg_230_0, arg_230_1)
	arg_230_0._exposedList = arg_230_1 and {} or nil
	arg_230_0._blindInvisible = arg_230_1

	arg_230_0:DispatchEvent(var_0_0.Event.New(var_0_1.BLIND_VISIBLE))
end

function var_0_9.GetBlindInvisible(arg_231_0)
	return arg_231_0._blindInvisible
end

function var_0_9.GetExposed(arg_232_0)
	if not arg_232_0._blindInvisible then
		return true
	end

	for iter_232_0, iter_232_1 in pairs(arg_232_0._exposedList) do
		return true
	end
end

function var_0_9.AppendExposed(arg_233_0, arg_233_1)
	if not arg_233_0._blindInvisible then
		return
	end

	local var_233_0 = arg_233_0._exposedList[arg_233_1]

	arg_233_0._exposedList[arg_233_1] = true

	if not var_233_0 then
		arg_233_0:DispatchEvent(var_0_0.Event.New(var_0_1.BLIND_EXPOSE))
	end
end

function var_0_9.RemoveExposed(arg_234_0, arg_234_1)
	if not arg_234_0._blindInvisible then
		return
	end

	arg_234_0._exposedList[arg_234_1] = nil

	arg_234_0:DispatchEvent(var_0_0.Event.New(var_0_1.BLIND_EXPOSE))
end

function var_0_9.SetWorldDeathMark(arg_235_0)
	arg_235_0._worldDeathMark = true
end

function var_0_9.GetWorldDeathMark(arg_236_0)
	return arg_236_0._worldDeathMark
end

function var_0_9.InitCloak(arg_237_0)
	arg_237_0._cloak = var_0_0.Battle.BattleUnitCloakComponent.New(arg_237_0)

	arg_237_0:DispatchEvent(var_0_0.Event.New(var_0_1.INIT_CLOAK))

	return arg_237_0._cloak
end

function var_0_9.CloakOnFire(arg_238_0, arg_238_1)
	if arg_238_0._cloak then
		arg_238_0._cloak:UpdateDotExpose(arg_238_1)
	end
end

function var_0_9.CloakExpose(arg_239_0, arg_239_1)
	if arg_239_0._cloak then
		arg_239_0._cloak:AppendExpose(arg_239_1)
	end
end

function var_0_9.StrikeExpose(arg_240_0)
	if arg_240_0._cloak then
		arg_240_0._cloak:AppendStrikeExpose()
	end
end

function var_0_9.BombardExpose(arg_241_0)
	if arg_241_0._cloak then
		arg_241_0._cloak:AppendBombardExpose()
	end
end

function var_0_9.UpdateCloak(arg_242_0, arg_242_1)
	arg_242_0._cloak:Update(arg_242_1)
end

function var_0_9.UpdateCloakConfig(arg_243_0)
	if arg_243_0._cloak then
		arg_243_0._cloak:UpdateCloakConfig()
		arg_243_0:DispatchEvent(var_0_0.Event.New(var_0_1.UPDATE_CLOAK_CONFIG))
	end
end

function var_0_9.DispatchCloakStateUpdate(arg_244_0)
	if arg_244_0._cloak then
		arg_244_0:DispatchEvent(var_0_0.Event.New(var_0_1.UPDATE_CLOAK_STATE))
	end
end

function var_0_9.GetCloak(arg_245_0)
	return arg_245_0._cloak
end

function var_0_9.AttachAimBias(arg_246_0, arg_246_1)
	arg_246_0._aimBias = arg_246_1

	arg_246_0:DispatchEvent(var_0_0.Event.New(var_0_1.INIT_AIMBIAS))
end

function var_0_9.DetachAimBias(arg_247_0)
	arg_247_0:DispatchEvent(var_0_0.Event.New(var_0_1.REMOVE_AIMBIAS))
	arg_247_0._aimBias:RemoveCrew(arg_247_0)

	arg_247_0._aimBias = nil
end

function var_0_9.ExitSmokeArea(arg_248_0)
	arg_248_0._aimBias:SmokeExitPause()
end

function var_0_9.UpdateAimBiasSkillState(arg_249_0)
	if arg_249_0._aimBias and arg_249_0._aimBias:GetHost() == arg_249_0 then
		arg_249_0._aimBias:UpdateSkillLock()
	end
end

function var_0_9.HostAimBias(arg_250_0)
	if arg_250_0._aimBias then
		arg_250_0:DispatchEvent(var_0_0.Event.New(var_0_1.HOST_AIMBIAS))
	end
end

function var_0_9.GetAimBias(arg_251_0)
	return arg_251_0._aimBias
end

function var_0_9.SwitchSpine(arg_252_0, arg_252_1, arg_252_2)
	arg_252_0:DispatchEvent(var_0_0.Event.New(var_0_1.SWITCH_SPINE, {
		skin = arg_252_1,
		HPBarOffset = arg_252_2
	}))
end

function var_0_9.Freeze(arg_253_0)
	for iter_253_0, iter_253_1 in ipairs(arg_253_0._totalWeapon) do
		iter_253_1:StartJamming()
	end

	if arg_253_0._airAssistList then
		for iter_253_2, iter_253_3 in ipairs(arg_253_0._airAssistList) do
			iter_253_3:StartJamming()
		end
	end
end

function var_0_9.ActiveFreeze(arg_254_0)
	for iter_254_0, iter_254_1 in ipairs(arg_254_0._totalWeapon) do
		iter_254_1:JammingEliminate()
	end

	if arg_254_0._airAssistList then
		for iter_254_2, iter_254_3 in ipairs(arg_254_0._airAssistList) do
			iter_254_3:JammingEliminate()
		end
	end
end

function var_0_9.ActiveWeaponSectorView(arg_255_0, arg_255_1, arg_255_2)
	local var_255_0 = {
		weapon = arg_255_1,
		isActive = arg_255_2
	}

	arg_255_0:DispatchEvent(var_0_0.Event.New(var_0_1.WEAPON_SECTOR, var_255_0))
end
