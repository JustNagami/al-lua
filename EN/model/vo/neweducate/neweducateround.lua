local var_0_0 = class("NewEducateRound", import("model.vo.BaseVO"))

function var_0_0.bindConfigTable(arg_1_0)
	return pg.child2_round
end

function var_0_0.Ctor(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0:InitConfig(arg_2_1)

	arg_2_0.round = arg_2_2.round
	arg_2_0.id = arg_2_0.round2Id[arg_2_0.round]
	arg_2_0.configId = arg_2_0.id
end

function var_0_0.InitConfig(arg_3_0, arg_3_1)
	arg_3_0.round2Id = {}
	arg_3_0.assessRoundIds = {}
	arg_3_0.talentRoundIds = {}

	for iter_3_0, iter_3_1 in ipairs(pg.child2_round.get_id_list_by_character[arg_3_1]) do
		local var_3_0 = pg.child2_round[iter_3_1]

		arg_3_0.round2Id[var_3_0.round] = iter_3_1

		if var_3_0.target_id ~= 0 then
			table.insert(arg_3_0.assessRoundIds, var_3_0.round)
		end

		if var_3_0.benefit_select ~= "" and #var_3_0.benefit_select ~= 0 then
			table.insert(arg_3_0.talentRoundIds, var_3_0.round)
		end
	end

	table.sort(arg_3_0.assessRoundIds)
	table.sort(arg_3_0.talentRoundIds)
end

function var_0_0.GetTalentRoundIds(arg_4_0)
	return arg_4_0.talentRoundIds
end

function var_0_0.IsTalentRound(arg_5_0)
	return table.contains(arg_5_0.talentRoundIds, arg_5_0.round)
end

function var_0_0.IsShowAssessTip(arg_6_0)
	if arg_6_0.round == 1 then
		return true
	end

	for iter_6_0, iter_6_1 in ipairs(arg_6_0.assessRoundIds) do
		if arg_6_0.round == iter_6_1 + 1 then
			return true
		end
	end

	return false
end

function var_0_0.GetProgressInfo(arg_7_0)
	local var_7_0 = underscore.detect(arg_7_0.assessRoundIds, function(arg_8_0)
		return arg_8_0 >= arg_7_0.round
	end)
	local var_7_1 = pg.child2_round[arg_7_0.round2Id[var_7_0]].target_id

	return arg_7_0.round, var_7_0 - arg_7_0.round, pg.child2_target[var_7_1].attr_sum
end

function var_0_0.IsEndRound(arg_9_0)
	return not arg_9_0.round2Id[arg_9_0.round + 1]
end

function var_0_0.OnNextRound(arg_10_0)
	arg_10_0.round = arg_10_0.round + 1
	arg_10_0.id = arg_10_0.round2Id[arg_10_0.round]
	arg_10_0.configId = arg_10_0.id
	arg_10_0.chatIds = nil
end

return var_0_0
