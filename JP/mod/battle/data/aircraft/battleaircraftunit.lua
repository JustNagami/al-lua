ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleUnitEvent
local var_0_2 = var_0_0.Battle.BattleConst
local var_0_3 = var_0_0.Battle.BattleConfig
local var_0_4 = var_0_0.Battle.BattleVariable
local var_0_5 = var_0_0.Battle.BattleDataFunction
local var_0_6 = class("BattleAircraftUnit")

var_0_0.Battle.BattleAircraftUnit = var_0_6
var_0_6.__name = "BattleAircraftUnit"
var_0_6.STATE_CREATE = "Create"
var_0_6.STATE_ATTACK = "Attack"
var_0_6.STATE_DESTORY = "Destory"
var_0_6.HEIGHT = var_0_3.AircraftHeight + 5

function var_0_6.Ctor(arg_1_0, arg_1_1)
	var_0_0.EventDispatcher.AttachEventDispatcher(arg_1_0)

	arg_1_0._uniqueID = arg_1_1
	arg_1_0._speedExemptKey = "air_" .. arg_1_1
	arg_1_0._dir = var_0_0.Battle.BattleConst.UnitDir.RIGHT
	arg_1_0._type = var_0_2.UnitType.AIRCRAFT_UNIT
	arg_1_0._currentState = arg_1_0.STATE_CREATE
	arg_1_0._distanceBackup = {}
	arg_1_0._battleProxy = var_0_0.Battle.BattleDataProxy.GetInstance()
	arg_1_0._frame = 0
	arg_1_0._weaponPotential = 1

	arg_1_0:Init()
end

function var_0_6.SetBound(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0._top = arg_2_1
	arg_2_0._bottom = arg_2_2

	if arg_2_0._tmpData.spawn_brownian then
		arg_2_0._speedZ = (math.random() - 0.5) * 0.5
	else
		arg_2_0._speedZ = 0
	end

	arg_2_0:SetTargetZ()
end

function var_0_6.SetViewBoundData(arg_3_0, arg_3_1, arg_3_2, arg_3_3, arg_3_4)
	arg_3_0._cameraTop = arg_3_1 + 3
	arg_3_0._cameraBottom = arg_3_2 - 23
	arg_3_0._cameraLeft = arg_3_3 - 3
	arg_3_0._cameraRight = arg_3_4 + 10
end

function var_0_6.Update(arg_4_0, arg_4_1)
	arg_4_0._pos:Add(arg_4_0._speed)
	arg_4_0:UpdateSpeed()
	arg_4_0:UpdateWeapon()
end

function var_0_6.ActiveCldBox(arg_5_0)
	arg_5_0._cldComponent:SetActive(true)
end

function var_0_6.DeactiveCldBox(arg_6_0)
	arg_6_0._cldComponent:SetActive(false)
end

function var_0_6.Init(arg_7_0)
	arg_7_0._aliveState = true
	arg_7_0._speed = Vector3.zero
	arg_7_0._pos = Vector3.zero
	arg_7_0._undefeated = false
	arg_7_0._labelTagList = {}
end

function var_0_6.Clear(arg_8_0)
	if arg_8_0._createTimer then
		pg.TimeMgr.GetInstance():RemoveBattleTimer(arg_8_0._createTimer)

		arg_8_0._createTimer = nil
	end

	arg_8_0:ShutdownWeapon()

	arg_8_0._distanceBackup = {}
end

function var_0_6.SetWeaponPreCastBound(arg_9_0)
	return
end

function var_0_6.EnterGCD(arg_10_0)
	return
end

function var_0_6.CreateWeapon(arg_11_0)
	local var_11_0 = {}

	for iter_11_0, iter_11_1 in ipairs(arg_11_0._tmpData.weapon_ID) do
		var_11_0[iter_11_0] = var_0_0.Battle.BattleDataFunction.CreateAirFighterWeaponUnit(iter_11_1, arg_11_0, iter_11_0, arg_11_0._weaponPotential)
	end

	return var_11_0
end

function var_0_6.ShutdownWeapon(arg_12_0)
	for iter_12_0, iter_12_1 in ipairs(arg_12_0:GetWeapon()) do
		iter_12_1:Clear()
	end
end

function var_0_6.UpdateWeapon(arg_13_0)
	if arg_13_0._currentState == arg_13_0.STATE_ATTACK then
		for iter_13_0, iter_13_1 in ipairs(arg_13_0:GetWeapon()) do
			iter_13_1:Update()
		end
	end
end

function var_0_6.GetWeapon(arg_14_0)
	return arg_14_0._weapon
end

function var_0_6.GetCurrentHP(arg_15_0)
	return arg_15_0._currentHP
end

function var_0_6.GetMaxHP(arg_16_0)
	return var_0_0.Battle.BattleAttr.GetCurrent(arg_16_0, "maxHP")
end

function var_0_6.IsUndefeated(arg_17_0)
	return arg_17_0._undefeated
end

function var_0_6.IsAlive(arg_18_0)
	return arg_18_0._aliveState
end

function var_0_6.IsCease(arg_19_0)
	return false
end

function var_0_6.GetOxyState(arg_20_0)
	return nil
end

function var_0_6.IsBoss(arg_21_0)
	return nil
end

function var_0_6.HandleDamageToDeath(arg_22_0)
	arg_22_0:UpdateHP(-arg_22_0._currentHP, {
		isMiss = false,
		isCri = false,
		isHeal = false
	})
end

function var_0_6.UpdateHP(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = arg_23_2.isMiss
	local var_23_1 = arg_23_2.isCri
	local var_23_2 = arg_23_2.isHeal

	arg_23_0._currentHP = arg_23_0._currentHP + arg_23_1

	local var_23_3 = arg_23_0:GetMaxHP()

	if var_23_3 < arg_23_0._currentHP then
		arg_23_0._currentHP = var_23_3
	end

	if arg_23_0._currentHP < 0 then
		arg_23_0._currentHP = 0
	end

	local var_23_4 = {
		dHP = arg_23_1,
		isMiss = var_23_0,
		isCri = var_23_1,
		isHeal = var_23_2
	}

	arg_23_0:DispatchEvent(var_0_0.Event.New(var_0_1.UPDATE_AIR_CRAFT_HP, var_23_4))

	if arg_23_0._currentHP <= 0 and arg_23_0:IsAlive() then
		arg_23_0:onDead()
	end

	return arg_23_1
end

function var_0_6.onDead(arg_24_0)
	arg_24_0._currentState = arg_24_0.STATE_DESTORY
	arg_24_0._aliveState = false
end

function var_0_6.UpdateSpeed(arg_25_0)
	local var_25_0 = arg_25_0._speedDir
	local var_25_1 = arg_25_0._velocity * arg_25_0:GetSpeedRatio()

	arg_25_0._speed:Copy(var_25_0)
	arg_25_0._speed:Mul(var_25_1)

	local var_25_2 = arg_25_0:GetPosition()

	if var_25_2.y < var_0_6.HEIGHT then
		arg_25_0._speed.y = math.max(0.4, 1 - var_25_2.y / var_0_3.AircraftHeight)
	end

	arg_25_0._speed.z = var_25_1 * arg_25_0._speedZ

	if arg_25_0._tmpData.spawn_brownian == 1 then
		local var_25_3 = arg_25_0._targetZ - var_25_2.z

		if var_25_1 < var_25_3 then
			arg_25_0._speed.z = var_25_1 * 0.5
		elseif var_25_3 < -var_25_1 then
			arg_25_0._speed.z = -var_25_1 * 0.5
		else
			arg_25_0:SetTargetZ()
		end
	end
end

function var_0_6.OutBound(arg_26_0)
	arg_26_0._undefeated = true

	arg_26_0:onDead()
end

function var_0_6.GetSize(arg_27_0)
	if arg_27_0._currentState == arg_27_0.STATE_CREATE then
		return Mathf.Clamp(arg_27_0:GetPosition().y / var_0_6.HEIGHT, 0.1, arg_27_0._scale)
	else
		return arg_27_0._scale
	end
end

function var_0_6.SetTemplate(arg_28_0, arg_28_1)
	arg_28_0._tmpData = arg_28_1

	arg_28_0:InitCldComponent()
	var_0_0.Battle.BattleAttr.SetAircraftAttFromTemp(arg_28_0)

	arg_28_0._currentHP = arg_28_0:GetMaxHP()
	arg_28_0._weapon = arg_28_0:CreateWeapon()
	arg_28_0._modelID = arg_28_1.model_ID

	local var_28_0 = arg_28_1.speed + arg_28_0:GetAttrByName("aircraftBooster")

	arg_28_0._velocity = var_0_0.Battle.BattleFormulas.ConvertAircraftSpeed(var_28_0)
	arg_28_0._scale = arg_28_1.scale or 1
end

function var_0_6.SetWeanponPotential(arg_29_0, arg_29_1)
	arg_29_0._weaponPotential = arg_29_1
end

function var_0_6.SetTargetZ(arg_30_0)
	local var_30_0 = arg_30_0._bottom
	local var_30_1 = arg_30_0._top

	arg_30_0._targetZ = (var_30_0 + var_30_1) * 0.5 + (var_30_1 - var_30_0) * (math.random() - 0.5) * 0.6
end

function var_0_6.SetMotherUnit(arg_31_0, arg_31_1)
	arg_31_0._motherUnit = arg_31_1

	local var_31_0 = arg_31_0._motherUnit:GetIFF()

	arg_31_0:SetIFF(var_31_0)
	arg_31_0:SetAttr(arg_31_1)

	local var_31_1 = arg_31_0._motherUnit:GetWeaponBoundBone()

	if var_31_1.remote then
		local var_31_2 = var_31_1.remote
		local var_31_3 = Vector3(var_31_2[1], var_31_2[2], var_31_2[3])

		var_31_3.x = var_31_3.x * var_31_0

		local var_31_4 = arg_31_0._battleProxy:GetStageInfo().mainUnitPosition
		local var_31_5

		if var_31_4 and var_31_4[var_31_0] then
			var_31_5 = var_31_4[var_31_0][1]
		else
			var_31_5 = var_0_3.MAIN_UNIT_POS[var_31_0][1]
		end

		local var_31_6 = var_31_5 + var_31_3

		arg_31_0:SetPosition(var_31_6)
	else
		arg_31_0:SetPosition(arg_31_0._motherUnit:GetPosition())
	end

	if arg_31_1:GetIFF() == var_0_3.FRIENDLY_CODE then
		arg_31_0._dir = var_0_2.UnitDir.RIGHT
		arg_31_0._isPlayerAircraft = true
	else
		arg_31_0._dir = var_0_2.UnitDir.LEFT
	end
end

function var_0_6.GetLabelTag(arg_32_0)
	return arg_32_0._labelTagList
end

function var_0_6.AddLabelTag(arg_33_0, arg_33_1)
	table.insert(arg_33_0._labelTagList, arg_33_1)

	local var_33_0 = arg_33_0:GetAttrByName("labelTag")

	var_33_0[arg_33_1] = (var_33_0[arg_33_1] or 0) + 1
end

function var_0_6.ContainsLabelTag(arg_34_0, arg_34_1)
	if arg_34_0._labelTagList == nil then
		return false
	end

	for iter_34_0, iter_34_1 in ipairs(arg_34_1) do
		if table.contains(arg_34_0._labelTagList, iter_34_1) then
			return true
		end
	end

	return false
end

function var_0_6.SetIFF(arg_35_0, arg_35_1)
	arg_35_0._IFF = arg_35_1
end

function var_0_6.SetPosition(arg_36_0, arg_36_1)
	arg_36_0._pos:Set(arg_36_1.x, arg_36_1.y, arg_36_1.z)
end

function var_0_6.IsOutViewBound(arg_37_0)
	local var_37_0 = arg_37_0:GetPosition()
	local var_37_1 = var_37_0.x
	local var_37_2 = var_37_0.z

	if var_37_1 > arg_37_0._cameraRight or var_37_2 > arg_37_0._cameraTop or var_37_2 < arg_37_0._cameraBottom then
		return true
	end
end

function var_0_6.GetDistance(arg_38_0, arg_38_1)
	local var_38_0 = arg_38_0._battleProxy.FrameIndex

	if arg_38_0._frame ~= var_38_0 then
		arg_38_0._distanceBackup = {}
		arg_38_0._frame = var_38_0
	end

	local var_38_1 = arg_38_0._distanceBackup[arg_38_1]

	if var_38_1 == nil then
		var_38_1 = Vector3.Distance(pg.Tool.FilterY(arg_38_0:GetPosition()), pg.Tool.FilterY(arg_38_1:GetPosition()))
		arg_38_0._distanceBackup[arg_38_1] = var_38_1

		arg_38_1:backupDistance(arg_38_0, var_38_1)
	end

	return var_38_1
end

function var_0_6.backupDistance(arg_39_0, arg_39_1, arg_39_2)
	local var_39_0 = arg_39_0._battleProxy.FrameIndex

	if arg_39_0._frame ~= var_39_0 then
		arg_39_0._distanceBackup = {}
		arg_39_0._frame = var_39_0
	end

	arg_39_0._distanceBackup[arg_39_1] = arg_39_2
end

function var_0_6.GetSkinID(arg_40_0)
	return arg_40_0._modelID
end

function var_0_6.SetSkinID(arg_41_0, arg_41_1)
	arg_41_0._skinID = arg_41_1
	arg_41_0._modelID = var_0_5.GetEquipSkin(arg_41_0._skinID)

	for iter_41_0, iter_41_1 in ipairs(arg_41_0._weapon) do
		iter_41_1:SetDerivateSkin(arg_41_1)
	end
end

function var_0_6.SetSkinData(arg_42_0, arg_42_1)
	return
end

function var_0_6.SetAttr(arg_43_0, arg_43_1)
	var_0_0.Battle.BattleAttr.SetAircraftAttFromMother(arg_43_0, arg_43_1)
end

function var_0_6.GetAttr(arg_44_0)
	return var_0_0.Battle.BattleAttr.GetAttr(arg_44_0)
end

function var_0_6.GetAttrByName(arg_45_0, arg_45_1)
	return var_0_0.Battle.BattleAttr.GetCurrent(arg_45_0, arg_45_1)
end

function var_0_6.GetMotherUnit(arg_46_0)
	return arg_46_0._motherUnit
end

function var_0_6.GetUniqueID(arg_47_0)
	return arg_47_0._uniqueID
end

function var_0_6.GetIFF(arg_48_0)
	return arg_48_0._IFF
end

function var_0_6.GetCurrentState(arg_49_0)
	return arg_49_0._currentState
end

function var_0_6.GetVelocity(arg_50_0)
	return arg_50_0._velocity
end

function var_0_6.GetSpeed(arg_51_0)
	return arg_51_0._speed
end

function var_0_6.GetPosition(arg_52_0)
	return arg_52_0._pos
end

function var_0_6.GetBornPosition(arg_53_0)
	return nil
end

function var_0_6.GetCLDZCenterPosition(arg_54_0)
	local var_54_0 = arg_54_0:GetBoxSize()

	return Vector3(arg_54_0._pos.x, arg_54_0._pos.y, arg_54_0._pos.z + var_54_0.z)
end

function var_0_6.GetBeenAimedPosition(arg_55_0)
	local var_55_0 = arg_55_0:GetTemplate().aim_offset
	local var_55_1 = arg_55_0:GetCLDZCenterPosition()

	if not var_55_0 then
		return var_55_1
	end

	return Vector3(var_55_1.x + var_55_0[1], var_55_1.y + var_55_0[2], var_55_1.z + var_55_0[3])
end

function var_0_6.GetDirection(arg_56_0)
	return arg_56_0._dir
end

function var_0_6.GetTemplate(arg_57_0)
	return arg_57_0._tmpData
end

function var_0_6.GetTemplateID(arg_58_0)
	return arg_58_0._tmpData.id
end

function var_0_6.GetUnitType(arg_59_0)
	return arg_59_0._type
end

function var_0_6.GetHPRate(arg_60_0)
	return arg_60_0._currentHP / arg_60_0:GetMaxHP()
end

function var_0_6.GetBoxSize(arg_61_0)
	return arg_61_0._cldComponent:GetCldBoxSize()
end

function var_0_6.GetSpeedRatio(arg_62_0)
	return var_0_4.GetSpeedRatio(arg_62_0:GetSpeedExemptKey(), arg_62_0._IFF)
end

function var_0_6.GetSpeedExemptKey(arg_63_0)
	return arg_63_0._speedExemptKey
end

function var_0_6.IsPlayerAircraft(arg_64_0)
	return arg_64_0._isPlayerAircraft
end

function var_0_6.IsShowHPBar(arg_65_0)
	return false
end

function var_0_6.SetUnVisitable(arg_66_0)
	var_0_0.Battle.BattleAttr.UnVisitable(arg_66_0)
end

function var_0_6.SetVisitable(arg_67_0)
	var_0_0.Battle.BattleAttr.Visitable(arg_67_0)
end

function var_0_6.IsVisitable(arg_68_0)
	return var_0_0.Battle.BattleAttr.IsVisitable(arg_68_0)
end

function var_0_6.OverrideDeadFX(arg_69_0, arg_69_1)
	arg_69_0._deadFX = arg_69_1
end

function var_0_6.GetDeadFX(arg_70_0)
	return arg_70_0._deadFX
end

function var_0_6.TriggerBuff(arg_71_0, arg_71_1, arg_71_2)
	return
end

function var_0_6.AddCreateTimer(arg_72_0, arg_72_1, arg_72_2)
	arg_72_0._currentState = arg_72_0.STATE_CREATE
	arg_72_0._speedDir = arg_72_1
	arg_72_2 = arg_72_2 or 1.5

	local function var_72_0()
		arg_72_0._currentState = arg_72_0.STATE_ATTACK
		arg_72_0._speedDir = Vector3(arg_72_0._dir, 0, 0)

		pg.TimeMgr.GetInstance():RemoveBattleTimer(arg_72_0._createTimer)

		arg_72_0._createTimer = nil
	end

	arg_72_0._createTimer = pg.TimeMgr.GetInstance():AddBattleTimer("AddCreateTimer", 0, arg_72_2, var_72_0)
end

function var_0_6.Dispose(arg_74_0)
	var_0_0.EventDispatcher.DetachEventDispatcher(arg_74_0)
end

function var_0_6.InitCldComponent(arg_75_0)
	local var_75_0 = arg_75_0:GetTemplate().cld_box
	local var_75_1 = arg_75_0:GetTemplate().cld_offset
	local var_75_2 = var_75_1[1]

	if arg_75_0:GetDirection() == var_0_0.Battle.BattleConst.UnitDir.LEFT then
		var_75_2 = var_75_2 * -1
	end

	arg_75_0._cldComponent = var_0_0.Battle.BattleCubeCldComponent.New(var_75_0[1], var_75_0[2], var_75_0[3], var_75_2, var_75_1[3])

	local var_75_3 = {
		type = var_0_2.CldType.AIRCRAFT,
		IFF = arg_75_0:GetIFF(),
		UID = arg_75_0:GetUniqueID()
	}

	arg_75_0._cldComponent:SetCldData(var_75_3)
end

function var_0_6.GetCldBox(arg_76_0)
	return arg_76_0._cldComponent:GetCldBox(arg_76_0:GetPosition())
end

function var_0_6.GetCldData(arg_77_0)
	return arg_77_0._cldComponent:GetCldData()
end

function var_0_6.AddBuff(arg_78_0)
	return
end

function var_0_6.SetBuffStack(arg_79_0)
	return
end

function var_0_6.RemoveBuff(arg_80_0)
	return
end

function var_0_6.TriggerBuff(arg_81_0)
	return
end

function var_0_6.CloakExpose(arg_82_0)
	return
end

function var_0_6.GetCurrentOxyState(arg_83_0)
	return nil
end

function var_0_6.RemoveRemoteBoundBone(arg_84_0)
	return
end

function var_0_6.SetRemoteBoundBone(arg_85_0)
	return
end

function var_0_6.GetRemoteBoundBone(arg_86_0)
	return
end
