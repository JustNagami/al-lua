ys = ys or {}

local var_0_0 = ys

var_0_0.Battle.BattleBuffReflectDamage = class("BattleBuffReflectDamage", var_0_0.Battle.BattleBuffEffect)
var_0_0.Battle.BattleBuffReflectDamage.__name = "BattleBuffReflectDamage"

local var_0_1 = var_0_0.Battle.BattleBuffReflectDamage

function var_0_1.Ctor(arg_1_0, arg_1_1)
	var_0_1.super.Ctor(arg_1_0, arg_1_1)
end

function var_0_1.SetArgs(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = arg_2_0._tempData.arg_list

	arg_2_0._triggerValve = var_2_0.valve
	arg_2_0._reflectRate = var_2_0.reflectRate
	arg_2_0._reflectTargetChoice = var_2_0.reflectTarget.target_choise
	arg_2_0._reflectTargetParam = var_2_0.reflectTarget.arg_list
end

function var_0_1.onDamageConclude(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	if arg_3_0:damageCheck(arg_3_3) and not arg_3_3.isReflect then
		local var_3_0, var_3_1 = arg_3_1:GetHP()
		local var_3_2 = -arg_3_3.validDHP

		if var_3_2 >= math.floor(var_3_1 * arg_3_0._triggerValve) then
			local var_3_3 = var_0_0.Battle.BattleDataProxy.GetInstance()
			local var_3_4 = arg_3_0:getTargetList(arg_3_1, arg_3_0._reflectTargetChoice, arg_3_0._reflectTargetParam, {})

			if #var_3_4 ~= 0 then
				local var_3_5 = var_3_4[1]
				local var_3_6 = math.floor(arg_3_0._reflectRate * var_3_2)

				var_3_3:HandleDirectDamage(var_3_5, var_3_6, arg_3_1, nil, true)
			end
		end
	end
end
