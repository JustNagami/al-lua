ys = ys or {}

local var_0_0 = ys

var_0_0.Battle.BattleSkillSetCount = class("BattleSkillSetCount", var_0_0.Battle.BattleSkillEffect)
var_0_0.Battle.BattleSkillSetCount.__name = "BattleSkillSetCount"

local var_0_1 = var_0_0.Battle.BattleSkillSetCount

function var_0_1.Ctor(arg_1_0, arg_1_1)
	var_0_1.super.Ctor(arg_1_0, arg_1_1, lv)

	arg_1_0._countType = arg_1_0._tempData.arg_list.countType
	arg_1_0._countTarget = arg_1_0._tempData.arg_list.countTarget or 0
end

function var_0_1.DoDataEffect(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0:doSetCounter(arg_2_2)
end

function var_0_1.DoDataEffectWithoutTarget(arg_3_0, arg_3_1)
	arg_3_0:doSetCounter(arg_3_1)
end

function var_0_1.doSetCounter(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_1:GetBuffList()

	for iter_4_0, iter_4_1 in pairs(var_4_0) do
		local var_4_1 = iter_4_1:GetEffectList()

		for iter_4_2, iter_4_3 in ipairs(var_4_1) do
			if iter_4_3:GetEffectType() == var_0_0.Battle.BattleBuffEffect.FX_TYPE_COUNTER and iter_4_3:GetCountType() == arg_4_0._countType then
				iter_4_3:SetCount(arg_4_0._countTarget)
			end
		end
	end
end
