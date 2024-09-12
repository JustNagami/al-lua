ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleConst.UnitType
local var_0_2 = var_0_0.Battle.BattleConst.AircraftUnitType
local var_0_3 = var_0_0.Battle.BattleConst.CharacterUnitType

var_0_0.Battle.BattleCannonBulletFactory = singletonClass("BattleCannonBulletFactory", var_0_0.Battle.BattleBulletFactory)
var_0_0.Battle.BattleCannonBulletFactory.__name = "BattleCannonBulletFactory"

local var_0_4 = var_0_0.Battle.BattleCannonBulletFactory

function var_0_4.Ctor(arg_1_0)
	var_0_4.super.Ctor(arg_1_0)
end

function var_0_4.MakeBullet(arg_2_0)
	return var_0_0.Battle.BattleCannonBullet.New()
end

local var_0_5 = Quaternion.Euler(-90, 0, 0)

function var_0_4.onBulletHitFunc(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = var_0_4.GetDataProxy()
	local var_3_1 = arg_3_0:GetBulletData()
	local var_3_2 = var_3_1:GetTemplate()
	local var_3_3

	if table.contains(var_0_2, arg_3_2) then
		var_3_3 = var_0_4.GetSceneMediator():GetAircraft(arg_3_1)
	elseif table.contains(var_0_3, arg_3_2) then
		var_3_3 = var_0_4.GetSceneMediator():GetCharacter(arg_3_1)
	end

	if not var_3_3 then
		return
	end

	local var_3_4 = var_3_3:GetUnitData()
	local var_3_5 = {
		_bullet = var_3_1,
		equipIndex = var_3_1:GetWeapon():GetEquipmentIndex(),
		bulletTag = var_3_1:GetExtraTag()
	}

	var_3_1:BuffTrigger(var_0_0.Battle.BattleConst.BuffEffectType.ON_BULLET_COLLIDE_BEFORE, var_3_5)

	local var_3_6, var_3_7 = var_3_0:HandleDamage(var_3_1, var_3_4)
	local var_3_8

	if var_3_3:GetGO() then
		if var_3_6 then
			local var_3_9, var_3_10 = var_0_4.GetFXPool():GetFX(arg_3_0:GetMissFXID())
			local var_3_11 = var_3_3:GetUnitData():GetBoxSize()
			local var_3_12 = math.random(0, 1)

			if var_3_12 == 0 then
				var_3_12 = -1
			end

			local var_3_13 = (math.random() - 0.5) * var_3_11.x
			local var_3_14 = Vector3(var_3_13, 0, var_3_11.z * var_3_12):Add(var_3_3:GetPosition())

			pg.EffectMgr.GetInstance():PlayBattleEffect(var_3_9, var_3_14:Add(var_3_10), true)
			var_0_0.Battle.PlayBattleSFX(var_3_1:GetMissSFX())
		else
			var_3_8 = var_3_3:AddFX(arg_3_0:GetFXID())

			var_0_0.Battle.PlayBattleSFX(var_3_1:GetHitSFX())

			local var_3_15 = var_3_4:GetDirection()
			local var_3_16 = arg_3_0:GetPosition() - var_3_3:GetPosition()

			var_3_16.x = var_3_16.x * var_3_15

			local var_3_17 = var_3_8.transform.localPosition
			local var_3_18 = (var_0_5 * var_3_3:GetTf().localRotation).eulerAngles.x

			var_3_16.y = math.cos(math.deg2Rad * var_3_18) * var_3_16.z
			var_3_16.z = 0

			local var_3_19 = var_3_16 / var_3_3:GetInitScale()

			var_3_17:Add(var_3_19)

			var_3_8.transform.localPosition = var_3_17
		end
	end

	if var_3_8 and var_3_4:GetIFF() == var_3_0:GetFoeCode() then
		local var_3_20 = var_3_8.transform
		local var_3_21 = var_3_20.localRotation

		var_3_20.localRotation = Vector3(var_3_21.x, 180, var_3_21.z)
	end

	if var_3_1:GetPierceCount() <= 0 then
		var_3_0:RemoveBulletUnit(var_3_1:GetUniqueID())
	end
end

function var_0_4.onBulletMissFunc(arg_4_0)
	local var_4_0 = arg_4_0:GetBulletData()
	local var_4_1 = var_4_0:GetTemplate()
	local var_4_2, var_4_3 = var_0_4.GetFXPool():GetFX(arg_4_0:GetMissFXID())

	pg.EffectMgr.GetInstance():PlayBattleEffect(var_4_2, var_4_3:Add(arg_4_0:GetPosition()), true)
	var_0_0.Battle.PlayBattleSFX(var_4_0:GetMissSFX())
end

function var_0_4.MakeModel(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4)
	local var_5_0 = arg_5_0:GetDataProxy()
	local var_5_1 = arg_5_1:GetBulletData()

	if not arg_5_0:GetBulletPool():InstBullet(arg_5_1:GetModleID(), function(arg_6_0)
		arg_5_1:AddModel(arg_6_0)
	end) then
		arg_5_1:AddTempModel(arg_5_0:GetTempGOPool():GetObject())
	end

	arg_5_1:SetSpawn(arg_5_2)
	arg_5_1:SetFXFunc(arg_5_0.onBulletHitFunc, arg_5_0.onBulletMissFunc)
	arg_5_0:GetSceneMediator():AddBullet(arg_5_1)
end
