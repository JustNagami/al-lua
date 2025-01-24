local var_0_0 = class("NewEducateBuff", import("model.vo.BaseVO"))

var_0_0.TYPE = {
	TALENT = 1,
	STATUS = 2
}
var_0_0.RARITY = {
	BLUE = 1,
	GOLD = 3,
	PURPLE = 2,
	COLOURS = 4
}

function var_0_0.bindConfigTable(arg_1_0)
	return pg.child2_benefit_list
end

function var_0_0.Ctor(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.id = arg_2_1
	arg_2_0.configId = arg_2_0.id
	arg_2_0.round = arg_2_2

	arg_2_0:InitEndRound()
end

function var_0_0.InitEndRound(arg_3_0)
	local var_3_0 = arg_3_0:getConfig("during_time")

	arg_3_0.endRound = var_3_0 == -1 and var_3_0 or arg_3_0.round + var_3_0
end

function var_0_0.GetEndRound(arg_4_0)
	return arg_4_0.endRound
end

function var_0_0.GetBenefitIdsByEffectType(arg_5_0, arg_5_1)
	local var_5_0 = {}

	for iter_5_0, iter_5_1 in ipairs(arg_5_0:getConfig("show_content")) do
		if underscore.any(pg.child2_benefit[iter_5_1].effect, function(arg_6_0)
			assert(type(arg_6_0) == "table", "请检查effect配置的括号,benefit id:" .. iter_5_1)

			return arg_6_0[1] == arg_5_1
		end) then
			table.insert(var_5_0, iter_5_1)
		end
	end

	return var_5_0
end

return var_0_0
