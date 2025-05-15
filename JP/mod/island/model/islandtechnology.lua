local var_0_0 = class("IslandTechnology", import("model.vo.BaseVO"))

var_0_0.STATUS = {
	NORMAL = "normal",
	FINISHED = "finished",
	LOCK = "lock",
	UNLOCK = "unlock",
	STUDYING = "studying",
	RECEIVE = "receive"
}
var_0_0.UNLCOK_TYPE = {
	FINISH_TASK = 1,
	EXIST_ABILITY = 2
}

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.id = arg_1_1
	arg_1_0.configId = arg_1_1
	arg_1_0.finishedCnt = arg_1_2 or 0
end

function var_0_0.SetFinishedCnt(arg_2_0, arg_2_1)
	arg_2_0.finishedCnt = arg_2_1
end

function var_0_0.AddFinishedCnt(arg_3_0)
	arg_3_0.finishedCnt = arg_3_0.finishedCnt + 1
end

function var_0_0.GetFinishedCnt(arg_4_0)
	return arg_4_0.finishedCnt
end

function var_0_0.bindConfigTable(arg_5_0)
	return pg.island_technology_template
end

function var_0_0.IsAutoType(arg_6_0)
	return arg_6_0:getConfig("auto_finish") == 0
end

function var_0_0.CheckFinishImmd(arg_7_0)
	return arg_7_0:IsUnlock() and arg_7_0:IsAutoType() and arg_7_0.finishedCnt == 0
end

function var_0_0.GetFormulaId(arg_8_0)
	return arg_8_0:getConfig("formula_id")
end

function var_0_0.IsOnceType(arg_9_0)
	return arg_9_0:getConfig("tech_repeat")[1] == 0
end

function var_0_0.IsNoLimitType(arg_10_0)
	return not arg_10_0:IsOnceType() and arg_10_0:getConfig("tech_repeat")[2] == 0
end

function var_0_0.GetMaxFinishedCnt(arg_11_0)
	return arg_11_0:IsOnceType() and 1 or arg_11_0:getConfig("tech_repeat")[2]
end

function var_0_0.CheckRemainCnt(arg_12_0)
	return arg_12_0:IsNoLimitType() or arg_12_0:GetMaxFinishedCnt() - arg_12_0.finishedCnt > 0
end

function var_0_0.GetAbilityId(arg_13_0)
	return pg.island_formula[arg_13_0:GetFormulaId()].unlock_type
end

function var_0_0.IsUnlock(arg_14_0)
	local var_14_0 = arg_14_0:GetAbilityId()

	return var_14_0 == 0 or getProxy(IslandProxy):GetIsland():GetAblityAgency():HasAbility(var_14_0)
end

function var_0_0.GetRecycleItemInfos(arg_15_0)
	local var_15_0 = {}

	underscore.each(arg_15_0:getConfig("item_unlock"), function(arg_16_0)
		table.insert(var_15_0, Drop.New({
			type = DROP_TYPE_ISLAND_ITEM,
			id = arg_16_0[1],
			count = arg_16_0[2]
		}))
	end)

	return var_15_0
end

function var_0_0.CanUnlock(arg_17_0)
	if getProxy(IslandProxy):GetIsland():GetLevel() < arg_17_0:getConfig("island_level") then
		return false
	end

	local var_17_0 = arg_17_0:GetRecycleItemInfos()

	if underscore.any(var_17_0, function(arg_18_0)
		return getProxy(IslandProxy):GetIsland():GetInventoryAgency():GetOwnCount(arg_18_0.id) < arg_18_0.count
	end) then
		return false
	end

	local var_17_1 = arg_17_0:getConfig("sys_unlock")

	if var_17_1 == "" or #var_17_1 == 0 then
		return true
	end

	return underscore.all(var_17_1, function(arg_19_0)
		return arg_17_0:MatchCondition(arg_19_0)
	end)
end

function var_0_0.MatchCondition(arg_20_0, arg_20_1)
	local var_20_0 = arg_20_1[1]
	local var_20_1 = arg_20_1[2]

	return switch(var_20_0, {
		[var_0_0.UNLCOK_TYPE.FINISH_TASK] = function()
			return getProxy(IslandProxy):GetIsland():GetTaskAgency():IsFinishTask(var_20_1)
		end,
		[var_0_0.UNLCOK_TYPE.EXIST_ABILITY] = function()
			return getProxy(IslandProxy):GetIsland():GetAblityAgency():HasAbility(var_20_1)
		end
	}, function()
		return false
	end)
end

function var_0_0.GetStatus(arg_24_0)
	if not arg_24_0:IsUnlock() then
		return arg_24_0:CanUnlock() and var_0_0.STATUS.UNLOCK or var_0_0.STATUS.LOCK
	end

	local var_24_0 = getProxy(IslandProxy):GetIsland():GetBuildingAgency():GetDelegationSlotDataByTechId(arg_24_0.id)

	if var_24_0 then
		return var_24_0:GetSlotRewardData() and var_0_0.STATUS.RECEIVE or var_0_0.STATUS.STUDYING
	else
		return arg_24_0:CheckRemainCnt() and var_0_0.STATUS.NORMAL or var_0_0.STATUS.FINISHED
	end
end

function var_0_0.GetSlotId(arg_25_0)
	local var_25_0 = getProxy(IslandProxy):GetIsland():GetBuildingAgency():GetDelegationSlotDataByTechId(arg_25_0.id)

	return var_25_0 and var_25_0.id
end

return var_0_0
