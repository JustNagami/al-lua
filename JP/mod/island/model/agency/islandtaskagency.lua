local var_0_0 = class("IslandTaskAgency", import(".IslandBaseAgency"))

var_0_0.TASK_ADDED = "IslandTaskAgency.TASK_ADDED"
var_0_0.TASK_UPDATED = "IslandTaskAgency.TASK_UPDATED"
var_0_0.TASK_REMOVED = "IslandTaskAgency.TASK_REMOVED"
var_0_0.FUTURE_TASK_REMOVED = "IslandTaskAgency.FUTURE_TASK_REMOVED"

function var_0_0.OnInit(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1.task_info or {}

	arg_1_0.traceId = var_1_0.focus_id or 0
	arg_1_0.finishedIds = var_1_0.task_id_list_finish or {}
	arg_1_0.tasks = {}

	for iter_1_0, iter_1_1 in ipairs(var_1_0.task_list or {}) do
		local var_1_1 = IslandTask.New(iter_1_1)

		arg_1_0.tasks[var_1_1.id] = var_1_1
	end

	arg_1_0:InitFutureTasks(var_1_0.task_list_random or {})

	for iter_1_2, iter_1_3 in pairs(arg_1_0.tasks) do
		if arg_1_0.randomTaskTimes[iter_1_3.id] then
			iter_1_3:SetEndTime(arg_1_0.randomTaskTimes[iter_1_3.id])
		end
	end
end

function var_0_0.InitFutureTasks(arg_2_0, arg_2_1)
	arg_2_0.mutexIds = Clone(arg_2_0.finishedIds)

	for iter_2_0, iter_2_1 in pairs(arg_2_0.tasks) do
		table.insert(arg_2_0.mutexIds, iter_2_1.id)
	end

	arg_2_0.futureTasks = {}
	arg_2_0.randomTaskTimes = {}

	for iter_2_2, iter_2_3 in ipairs(arg_2_1) do
		arg_2_0.randomTaskTimes[iter_2_3.task_id] = iter_2_3.timestamp

		if not arg_2_0:CheckMutex(iter_2_3.task_id) then
			local var_2_0 = IslandFutureTask.New(iter_2_3)

			arg_2_0.futureTasks[var_2_0.id] = var_2_0
		end
	end

	for iter_2_4, iter_2_5 in ipairs(IslandTaskType.GetPermanentTypes()) do
		local var_2_1 = pg.island_task.get_id_list_by_type[iter_2_5]
		local var_2_2 = underscore.select(var_2_1, function(arg_3_0)
			return not var_0_0.IsServerAcceptType(arg_3_0) and not arg_2_0:CheckMutex(arg_3_0)
		end)

		underscore.each(var_2_2, function(arg_4_0)
			local var_4_0 = IslandFutureTask.New({
				task_id = arg_4_0
			})

			arg_2_0.futureTasks[var_4_0.id] = var_4_0
		end)
	end
end

function var_0_0.CheckMutex(arg_5_0, arg_5_1)
	if arg_5_0:IsPassId(arg_5_1) then
		return true
	end

	local var_5_0 = pg.island_task[arg_5_1].unlock_condition

	if var_5_0 == "" or #var_5_0 == 0 then
		return false
	end

	return underscore.any(var_5_0, function(arg_6_0)
		return arg_6_0[1] == IslandFutureTask.CONDITION_TYPE.MUTEX_TASK and table.contains(arg_5_0.mutexIds, arg_6_0[2])
	end)
end

function var_0_0.IsFinishTask(arg_7_0, arg_7_1)
	return table.contains(arg_7_0.finishedIds, arg_7_1)
end

function var_0_0.IsPassId(arg_8_0, arg_8_1)
	return table.contains(arg_8_0.mutexIds, arg_8_1)
end

function var_0_0.GetTasks(arg_9_0)
	return arg_9_0.tasks
end

function var_0_0.GetTask(arg_10_0, arg_10_1)
	return arg_10_0.tasks[arg_10_1]
end

function var_0_0.GetFutureTask(arg_11_0, arg_11_1)
	return arg_11_0.futureTasks[taskId]
end

function var_0_0.SetTraceId(arg_12_0, arg_12_1)
	arg_12_0.traceId = arg_12_1
end

function var_0_0.GetTraceId(arg_13_0)
	return arg_13_0.traceId
end

function var_0_0.GetTraceTask(arg_14_0)
	if arg_14_0.traceId == 0 then
		return nil
	end

	return arg_14_0.tasks[arg_14_0.traceId]
end

function var_0_0.AddTask(arg_15_0, arg_15_1)
	arg_15_0.tasks[arg_15_1.id] = arg_15_1

	if arg_15_0.randomTaskTimes[arg_15_1.id] then
		arg_15_0.tasks[arg_15_1.id]:SetEndTime(arg_15_0.randomTaskTimes[arg_15_1.id])
	end

	arg_15_0.futureTasks[arg_15_1.id] = nil

	table.insert(arg_15_0.mutexIds, arg_15_1.id)

	for iter_15_0, iter_15_1 in pairs(arg_15_0.futureTasks) do
		if arg_15_0:CheckMutex(iter_15_1.id) then
			arg_15_0:RemoveFutureTask(iter_15_1.id)
		end
	end

	arg_15_0:DispatchEvent(var_0_0.TASK_ADDED, arg_15_1)
end

function var_0_0.UpdateTask(arg_16_0, arg_16_1)
	arg_16_0.tasks[arg_16_1.id] = arg_16_1

	if arg_16_0.randomTaskTimes[arg_16_1.id] then
		arg_16_0.tasks[arg_16_1.id]:SetEndTime(arg_16_0.randomTaskTimes[arg_16_1.id])
	end

	arg_16_0:DispatchEvent(var_0_0.TASK_UPDATED, arg_16_1)

	if arg_16_1:IsFinish() and arg_16_1:IsSubmitImmediately() then
		pg.m02:sendNotification(GAME.ISLAND_SUBMIT_TASK, {
			taskId = arg_16_1.id
		})
	end
end

function var_0_0.AddFinishId(arg_17_0, arg_17_1)
	table.insert(arg_17_0.finishedIds, arg_17_1)
end

function var_0_0.RemoveTask(arg_18_0, arg_18_1)
	local var_18_0 = arg_18_0.tasks[arg_18_1]

	arg_18_0.tasks[arg_18_1] = nil

	arg_18_0:DispatchEvent(var_0_0.TASK_REMOVED, var_18_0)
end

function var_0_0.RemoveFutureTask(arg_19_0, arg_19_1)
	local var_19_0 = arg_19_0.futureTasks[arg_19_1]

	arg_19_0.futureTasks[arg_19_1] = nil

	arg_19_0:DispatchEvent(var_0_0.FUTURE_TASK_REMOVED, var_19_0)
end

function var_0_0.UpdatePerDay(arg_20_0)
	pg.m02:sendNotification(GAME.ISLAND_GET_RANDOM_REFRESH_TASK)
end

function var_0_0.UpdateRandomRefreshTask(arg_21_0, arg_21_1)
	for iter_21_0, iter_21_1 in ipairs(arg_21_1.remove_task_list or {}) do
		arg_21_0.tasks[iter_21_1] = nil
	end

	for iter_21_2, iter_21_3 in ipairs(arg_21_1.remove_task_finish or {}) do
		table.removebyvalue(arg_21_0.finishedIds, iter_21_3)
	end

	arg_21_0:InitFutureTasks(arg_21_1.task_list_random or {})
end

function var_0_0.UpdatePerSecond(arg_22_0)
	for iter_22_0, iter_22_1 in pairs(arg_22_0.tasks) do
		if not iter_22_1:InTime() then
			arg_22_0:RemoveTask(iter_22_1.id)
		end
	end

	local var_22_0 = {}

	for iter_22_2, iter_22_3 in pairs(arg_22_0.futureTasks) do
		if not iter_22_3:InTime() then
			arg_22_0:RemoveFutureTask(iter_22_3.id)
		elseif iter_22_3:IsUnlock() and iter_22_3:IsAcceptImmediately() then
			table.insert(var_22_0, task)
		end
	end

	if #var_22_0 > 0 then
		pg.m02:sendNotification(GAME.ISLAND_ACCEPT_TASK, {
			taskIds = var_22_0
		})
	end
end

function var_0_0.GetCanAcceptTasks(arg_23_0)
	local var_23_0 = {}

	for iter_23_0, iter_23_1 in pairs(arg_23_0.futureTasks) do
		if iter_23_1:IsUnlock() then
			table.insert(var_23_0, iter_23_1)
		end
	end

	return var_23_0
end

function var_0_0.GetCanSubmitTasks(arg_24_0)
	local var_24_0 = {}

	for iter_24_0, iter_24_1 in pairs(arg_24_0.tasks) do
		if iter_24_1:IsFinish() then
			table.insert(var_24_0, iter_24_1)
		end
	end

	return var_24_0
end

function var_0_0.GetCanAcceptTasksByMapId(arg_25_0, arg_25_1)
	local var_25_0 = {}

	for iter_25_0, iter_25_1 in pairs(arg_25_0.futureTasks) do
		if iter_25_1:getConfig("map_trigger_tips") == arg_25_1 and iter_25_1:IsUnlock() then
			table.insert(var_25_0, iter_25_1)
		end
	end

	return var_25_0
end

function var_0_0.GetCanSubmitTasksByMapId(arg_26_0, arg_26_1)
	local var_26_0 = {}

	for iter_26_0, iter_26_1 in pairs(arg_26_0.tasks) do
		if iter_26_1:getConfig("map_complete_tips") == arg_26_1 and iter_26_1:IsFinish() then
			table.insert(var_26_0, iter_26_1)
		end
	end

	return var_26_0
end

function var_0_0.IsServerAcceptType(arg_27_0)
	return pg.island_task[arg_27_0].trigger_type == 3
end

return var_0_0
