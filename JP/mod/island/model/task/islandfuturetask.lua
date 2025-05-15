local var_0_0 = class("IslandFutureTask", import("model.vo.BaseVO"))

var_0_0.CONDITION_TYPE = {
	FINISH_TASK = 2,
	IN_TIME = 5,
	EXIST_ABILITY = 3,
	MUTEX_TASK = 4
}

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.id = arg_1_1.task_id
	arg_1_0.configId = arg_1_0.id
end

function var_0_0.bindConfigTable(arg_2_0)
	return pg.island_task
end

function var_0_0.InTime(arg_3_0)
	local var_3_0 = arg_3_0:getConfig("unlock_condition")

	if var_3_0 == "" or #var_3_0 == 0 then
		return true
	end

	return underscore.all(var_3_0, function(arg_4_0)
		return arg_4_0[1] ~= var_0_0.CONDITION_TYPE.IN_TIME or arg_4_0[1] == var_0_0.CONDITION_TYPE.IN_TIME and pg.TimeMgr.GetInstance():inTime(arg_4_0[2])
	end)
end

function var_0_0.IsAcceptImmediately(arg_5_0)
	return arg_5_0:getConfig("trigger_type") == 2 and arg_5_0:getConfig("trigger_data") == 0
end

function var_0_0.IsUnlock(arg_6_0)
	local var_6_0 = arg_6_0:getConfig("unlock_condition")

	if var_6_0 == "" or #var_6_0 == 0 then
		return true
	end

	return underscore.all(var_6_0, function(arg_7_0)
		return arg_6_0:MatchCondition(arg_7_0)
	end)
end

function var_0_0.MatchCondition(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_1[1]
	local var_8_1 = arg_8_1[2]

	return switch(var_8_0, {
		[var_0_0.CONDITION_TYPE.FINISH_TASK] = function()
			return getProxy(IslandProxy):GetIsland():GetTaskAgency():IsFinishTask(var_8_1)
		end,
		[var_0_0.CONDITION_TYPE.EXIST_ABILITY] = function()
			return getProxy(IslandProxy):GetIsland():GetAblityAgency():HasAbility(var_8_1)
		end,
		[var_0_0.CONDITION_TYPE.MUTEX_TASK] = function()
			return not getProxy(IslandProxy):GetIsland():GetTaskAgency():IsPassId(var_8_1)
		end,
		[var_0_0.CONDITION_TYPE.IN_TIME] = function()
			return pg.TimeMgr.GetInstance():inTime(var_8_1)
		end
	}, function()
		return false
	end)
end

return var_0_0
