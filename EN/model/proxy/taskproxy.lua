local var_0_0 = class("TaskProxy", import(".NetProxy"))

var_0_0.TASK_ADDED = "task added"
var_0_0.TASK_UPDATED = "task updated"
var_0_0.TASK_REMOVED = "task removed"
var_0_0.TASK_FINISH = "task finish"
var_0_0.TASK_PROGRESS_UPDATE = "task TASK_PROGRESS_UPDATE"
var_0_0.WEEK_TASK_UPDATED = "week task updated"
var_0_0.WEEK_TASKS_ADDED = "week tasks added"
var_0_0.WEEK_TASKS_DELETED = "week task deleted"
var_0_0.WEEK_TASK_RESET = "week task refresh"
mingshiTriggerId = 1
mingshiActivityId = 21
changdaoActivityId = 10006
changdaoTaskStartId = 5031

function var_0_0.register(arg_1_0)
	arg_1_0.data = {}
	arg_1_0.finishData = {}
	arg_1_0.tmpInfo = {}

	arg_1_0:on(20001, function(arg_2_0)
		arg_1_0:initTaskInfo(arg_2_0.info)
		getProxy(TechnologyProxy):updateBlueprintStates()
	end)
	arg_1_0:on(20002, function(arg_3_0)
		arg_1_0:updateProgress(arg_3_0.info)
		arg_1_0:sendNotification(GAME.TASK_PROGRESS_UPDATE)
	end)
	arg_1_0:on(20003, function(arg_4_0)
		for iter_4_0, iter_4_1 in ipairs(arg_4_0.info) do
			local var_4_0 = Task.New(iter_4_1)

			arg_1_0:addTask(var_4_0)
		end
	end)
	arg_1_0:on(20004, function(arg_5_0)
		for iter_5_0, iter_5_1 in ipairs(arg_5_0.id_list) do
			arg_1_0:removeTaskById(iter_5_1)
		end
	end)
	arg_1_0:on(20015, function(arg_6_0)
		local var_6_0 = arg_6_0.time

		arg_1_0:sendNotification(GAME.ZERO_HOUR)
	end)

	arg_1_0.taskTriggers = {}
	arg_1_0.weekTaskProgressInfo = WeekTaskProgress.New()

	arg_1_0:on(20101, function(arg_7_0)
		arg_1_0.weekTaskProgressInfo:Init(arg_7_0.info)
		arg_1_0:sendNotification(var_0_0.WEEK_TASK_RESET)
	end)
	arg_1_0:on(20102, function(arg_8_0)
		for iter_8_0, iter_8_1 in ipairs(arg_8_0.task) do
			print("update sub task ", iter_8_1)

			local var_8_0 = WeekPtTask.New(iter_8_1)

			arg_1_0.weekTaskProgressInfo:UpdateSubTask(var_8_0)
			arg_1_0:sendNotification(var_0_0.WEEK_TASK_UPDATED, {
				id = var_8_0.id
			})
		end
	end)
	arg_1_0:on(20103, function(arg_9_0)
		for iter_9_0, iter_9_1 in ipairs(arg_9_0.id) do
			print("add sub task ", iter_9_1)

			local var_9_0 = WeekPtTask.New({
				progress = 0,
				id = iter_9_1
			})

			arg_1_0.weekTaskProgressInfo:AddSubTask(var_9_0)
		end

		arg_1_0:sendNotification(var_0_0.WEEK_TASKS_ADDED)
	end)
	arg_1_0:on(20104, function(arg_10_0)
		for iter_10_0, iter_10_1 in ipairs(arg_10_0.id) do
			print("remove sub task ", iter_10_1)
			arg_1_0.weekTaskProgressInfo:RemoveSubTask(iter_10_1)
		end

		arg_1_0:sendNotification(var_0_0.WEEK_TASKS_DELETED)
	end)
	arg_1_0:on(20105, function(arg_11_0)
		local var_11_0 = arg_11_0.pt

		arg_1_0.weekTaskProgressInfo:UpdateProgress(var_11_0)
	end)

	arg_1_0.submittingTask = {}
end

function var_0_0.initTaskInfo(arg_12_0, arg_12_1, arg_12_2)
	for iter_12_0, iter_12_1 in ipairs(arg_12_1) do
		local var_12_0 = Task.New(iter_12_1)

		if var_12_0:getConfigTable() ~= nil then
			var_12_0:display("loaded")

			if var_12_0:getTaskStatus() ~= 2 then
				arg_12_0.data[var_12_0.id] = var_12_0
			else
				arg_12_0.finishData[var_12_0.id] = var_12_0
			end

			var_12_0:setActId(arg_12_2)
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("task_notfound_error") .. tostring(iter_12_1.id))
			Debugger.LogWarning("Missing Task Config, id :" .. tostring(iter_12_1.id))
		end
	end
end

function var_0_0.updateProgress(arg_13_0, arg_13_1)
	for iter_13_0, iter_13_1 in ipairs(arg_13_1) do
		local var_13_0 = arg_13_0.data[iter_13_1.id]

		print("任务id" .. iter_13_1.id .. "更新")

		if var_13_0 ~= nil then
			local var_13_1 = var_13_0:isFinish()

			var_13_0.progress = iter_13_1.progress

			arg_13_0:updateTask(var_13_0)

			if not var_13_1 then
				arg_13_0:sendNotification(var_0_0.TASK_PROGRESS_UPDATE, var_13_0:clone())
			end
		end
	end
end

function var_0_0.initActData(arg_14_0, arg_14_1, arg_14_2)
	arg_14_0:initTaskInfo(arg_14_2, arg_14_1)
end

function var_0_0.updateActProgress(arg_15_0, arg_15_1, arg_15_2)
	arg_15_0:updateProgress(arg_15_2)
end

function var_0_0.addActData(arg_16_0, arg_16_1, arg_16_2)
	for iter_16_0, iter_16_1 in ipairs(arg_16_2) do
		local var_16_0 = Task.New(iter_16_1)

		var_16_0:setActId(arg_16_1)
		arg_16_0:addTask(var_16_0)
	end
end

function var_0_0.removeActData(arg_17_0, arg_17_1, arg_17_2)
	for iter_17_0, iter_17_1 in ipairs(arg_17_2) do
		arg_17_0:removeTaskById(iter_17_1.id)
	end
end

function var_0_0.clearTimeOut(arg_18_0)
	if not arg_18_0.datas or #arg_18_0.datas == 0 then
		return
	end

	local var_18_0 = false
	local var_18_1 = {}

	for iter_18_0 = #arg_18_0.datas, 1, -1 do
		local var_18_2 = arg_18_0.datas[iter_18_0]

		if var_18_2:isActivityTask() then
			local var_18_3 = var_18_2:getActId()
			local var_18_4 = getProxy(ActivityProxy):getActivityById(var_18_3)

			if not var_18_4 or var_18_4:isEnd() then
				table.insert(var_18_1, var_18_2)

				local var_18_5 = true
			end
		end
	end

	for iter_18_1 = 1, #var_18_1 do
		arg_18_0:removeTask(var_18_1[iter_18_1])
	end
end

function var_0_0.GetWeekTaskProgressInfo(arg_19_0)
	return arg_19_0.weekTaskProgressInfo
end

function var_0_0.getTasksForBluePrint(arg_20_0)
	local var_20_0 = {}

	for iter_20_0, iter_20_1 in pairs(arg_20_0.data or {}) do
		var_20_0[iter_20_1.id] = iter_20_1
	end

	for iter_20_2, iter_20_3 in pairs(arg_20_0.finishData) do
		var_20_0[iter_20_3.id] = iter_20_3
	end

	return var_20_0
end

function var_0_0.addTmpTask(arg_21_0, arg_21_1)
	arg_21_0.tmpInfo[arg_21_1.id] = arg_21_1
end

function var_0_0.checkTmpTask(arg_22_0, arg_22_1)
	if arg_22_0.tmpInfo[arg_22_1] then
		arg_22_0:addTask(arg_22_0.tmpInfo[arg_22_1])

		arg_22_0.tmpInfo[arg_22_1] = nil
	end
end

function var_0_0.addTask(arg_23_0, arg_23_1)
	assert(isa(arg_23_1, Task), "should be an instance of Task")

	if arg_23_0.data[arg_23_1.id] then
		arg_23_0:addTmpTask(arg_23_1)

		return
	end

	if arg_23_1:getConfigTable() == nil then
		pg.TipsMgr.GetInstance():ShowTips(i18n("task_notfound_error") .. tostring(arg_23_1.id))
		Debugger.LogWarning("Missing Task Config, id :" .. tostring(arg_23_1.id))

		return
	end

	arg_23_0.data[arg_23_1.id] = arg_23_1:clone()

	arg_23_0.data[arg_23_1.id]:display("added")
	arg_23_0.data[arg_23_1.id]:onAdded()
	arg_23_0.facade:sendNotification(var_0_0.TASK_ADDED, arg_23_1:clone())
	arg_23_0:checkAutoSubmitTask(arg_23_1)
end

function var_0_0.updateTask(arg_24_0, arg_24_1)
	assert(isa(arg_24_1, Task), "should be an instance of Task")

	local var_24_0 = arg_24_0.data[arg_24_1.id]

	assert(var_24_0 ~= nil, "task should exist")

	arg_24_0.data[arg_24_1.id] = arg_24_1:clone()
	arg_24_0.data[arg_24_1.id].acceptTime = var_24_0.acceptTime

	arg_24_0.data[arg_24_1.id]:display("updated")
	arg_24_0.facade:sendNotification(var_0_0.TASK_UPDATED, arg_24_1:clone())
	arg_24_0:checkAutoSubmitTask(arg_24_1)
end

function var_0_0.getTasks(arg_25_0)
	local var_25_0 = {}

	for iter_25_0, iter_25_1 in pairs(arg_25_0.data) do
		table.insert(var_25_0, iter_25_1)
	end

	return Clone(var_25_0)
end

function var_0_0.getTaskById(arg_26_0, arg_26_1)
	if arg_26_0.data[arg_26_1] then
		return arg_26_0.data[arg_26_1]:clone()
	end
end

function var_0_0.getFinishTaskById(arg_27_0, arg_27_1)
	if arg_27_0.finishData[arg_27_1] then
		return arg_27_0.finishData[arg_27_1]:clone()
	end
end

function var_0_0.getTaskVO(arg_28_0, arg_28_1)
	return arg_28_0:getTaskById(arg_28_1) or arg_28_0:getFinishTaskById(arg_28_1)
end

function var_0_0.getCanReceiveCount(arg_29_0)
	local var_29_0 = 0

	for iter_29_0, iter_29_1 in pairs(arg_29_0.data) do
		if iter_29_1:ShowOnTaskScene() and iter_29_1:isFinish() and iter_29_1:isReceive() == false then
			var_29_0 = var_29_0 + 1

			local var_29_1 = iter_29_1:getConfig("award_display")

			for iter_29_2, iter_29_3 in ipairs(var_29_1) do
				local var_29_2, var_29_3, var_29_4 = unpack(iter_29_3)

				if not LOCK_UR_SHIP and var_29_2 == DROP_TYPE_VITEM and Item.getConfigData(var_29_3).virtual_type == 20 then
					local var_29_5 = pg.gameset.urpt_chapter_max.description[1]
					local var_29_6 = not LOCK_UR_SHIP and getProxy(BagProxy):GetLimitCntById(var_29_5) or 0
					local var_29_7 = not LOCK_UR_SHIP and pg.gameset.urpt_chapter_max.description[2] or 0

					if var_29_6 + var_29_4 - var_29_7 > 0 then
						var_29_0 = var_29_0 - 1
					end
				end
			end
		end
	end

	local var_29_8 = arg_29_0:GetWeekTaskProgressInfo()

	if var_29_8:CanUpgrade() then
		var_29_0 = var_29_0 + 1
	end

	return var_29_0 + var_29_8:GetCanSubmitSubTaskCnt()
end

function var_0_0.getNotFinishCount(arg_30_0, arg_30_1)
	local var_30_0 = arg_30_1 or 3
	local var_30_1 = 0

	for iter_30_0, iter_30_1 in pairs(arg_30_0.data) do
		if iter_30_1:GetRealType() == var_30_0 and iter_30_1:isFinish() == false then
			var_30_1 = var_30_1 + 1
		end
	end

	return var_30_1
end

function var_0_0.removeTask(arg_31_0, arg_31_1)
	assert(isa(arg_31_1, Task), "should be an instance of Task")
	arg_31_0:removeTaskById(arg_31_1.id)
end

function var_0_0.removeTaskById(arg_32_0, arg_32_1)
	local var_32_0 = arg_32_0.data[arg_32_1]

	if var_32_0 == nil then
		return
	end

	arg_32_0.finishData[arg_32_1] = arg_32_0.data[arg_32_1]:clone()
	arg_32_0.finishData[arg_32_1].submitTime = pg.TimeMgr.GetInstance():GetServerTime()
	arg_32_0.data[arg_32_1] = nil

	arg_32_0.facade:sendNotification(var_0_0.TASK_REMOVED, var_32_0)
	arg_32_0:checkTmpTask(arg_32_1)
end

function var_0_0.getmingshiTaskID(arg_33_0, arg_33_1)
	local var_33_0 = pg.task_data_trigger[mingshiTriggerId]

	if arg_33_1 >= var_33_0.count then
		local var_33_1 = var_33_0.task_id

		if var_33_1 and not arg_33_0:getTaskVO(var_33_1) then
			return var_33_1
		end
	end

	return 0
end

function var_0_0.dealMingshiTouchFlag(arg_34_0, arg_34_1)
	local var_34_0 = getProxy(ActivityProxy):getActivityById(mingshiActivityId)

	if not var_34_0 or var_34_0:isEnd() then
		return
	end

	local var_34_1 = var_34_0:getConfig("config_id")
	local var_34_2 = var_34_0:getConfig("config_data")[1]

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		hideNo = true,
		content = i18n("mingshi_task_tip_" .. arg_34_1)
	})

	local var_34_3 = arg_34_0:getTaskById(var_34_2)

	if var_34_3 and var_34_3:getTaskStatus() < 1 then
		if not arg_34_0.mingshiTouchList then
			arg_34_0.mingshiTouchList = {}
		end

		for iter_34_0, iter_34_1 in pairs(arg_34_0.mingshiTouchList) do
			if iter_34_1 == arg_34_1 then
				return
			end
		end

		for iter_34_2, iter_34_3 in pairs(var_34_0.data1_list) do
			if iter_34_3 == arg_34_1 then
				return
			end
		end

		table.insert(arg_34_0.mingshiTouchList, arg_34_1)
		arg_34_0:sendNotification(GAME.ACTIVITY_OPERATION, {
			cmd = 2,
			activity_id = mingshiActivityId,
			arg1 = arg_34_1
		})
	end
end

function var_0_0.mingshiTouchFlagEnabled(arg_35_0)
	local var_35_0 = getProxy(ActivityProxy):getActivityById(mingshiActivityId)

	if not var_35_0 or var_35_0:isEnd() then
		return
	end

	local var_35_1 = tonumber(var_35_0:getConfig("config_id"))
	local var_35_2 = tonumber(var_35_0:getConfig("config_data")[1])
	local var_35_3 = arg_35_0:getTaskById(var_35_2)

	if var_35_3 and var_35_3:getTaskStatus() < 1 then
		return true
	end

	if arg_35_0:getTaskVO(var_35_1) then
		return false
	end

	return true
end

function var_0_0.getAcademyTask(arg_36_0, arg_36_1)
	local var_36_0 = getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_TASK_LIST)
	local var_36_1 = _.detect(var_36_0, function(arg_37_0)
		local var_37_0 = arg_37_0:getTaskShip()

		return var_37_0 and var_37_0.groupId == arg_36_1
	end)

	if var_36_1 and not var_36_1:isEnd() then
		return getActivityTask(var_36_1, true)
	end
end

function var_0_0.isFinishPrevTasks(arg_38_0, arg_38_1)
	local var_38_0 = Task.New({
		id = arg_38_1
	}):getConfig("open_need")

	if var_38_0 and type(var_38_0) == "table" and #var_38_0 > 0 then
		return _.all(var_38_0, function(arg_39_0)
			local var_39_0 = arg_38_0:getTaskById(arg_39_0) or arg_38_0:getFinishTaskById(arg_39_0)

			return var_39_0 and var_39_0:isReceive()
		end)
	end

	return true
end

function var_0_0.isReceiveTasks(arg_40_0, arg_40_1)
	return _.all(arg_40_1, function(arg_41_0)
		local var_41_0 = arg_40_0:getFinishTaskById(arg_41_0)

		return var_41_0 and var_41_0:isReceive()
	end)
end

function var_0_0.pushAutoSubmitTask(arg_42_0)
	for iter_42_0, iter_42_1 in pairs(arg_42_0.data) do
		arg_42_0:checkAutoSubmitTask(iter_42_1)
	end
end

function var_0_0.checkAutoSubmitTask(arg_43_0, arg_43_1)
	if arg_43_1:getConfig("auto_commit") == 1 and arg_43_1:isFinish() then
		arg_43_0:sendNotification(GAME.SUBMIT_TASK, arg_43_1.id)
	end
end

function var_0_0.addSubmittingTask(arg_44_0, arg_44_1)
	arg_44_0.submittingTask[arg_44_1] = true
end

function var_0_0.removeSubmittingTask(arg_45_0, arg_45_1)
	arg_45_0.submittingTask[arg_45_1] = nil
end

function var_0_0.isSubmitting(arg_46_0, arg_46_1)
	return arg_46_0.submittingTask[arg_46_1]
end

function var_0_0.triggerClientTasks(arg_47_0)
	local var_47_0 = {}

	for iter_47_0, iter_47_1 in pairs(arg_47_0.data) do
		if iter_47_1:isClientTrigger() then
			table.insert(var_47_0, iter_47_1)
		end
	end

	return var_47_0
end

function var_0_0.GetBackYardInterActionTaskList(arg_48_0)
	local var_48_0 = {}

	for iter_48_0, iter_48_1 in pairs(arg_48_0.data) do
		if iter_48_1:IsBackYardInterActionType() then
			table.insert(var_48_0, iter_48_1)
		end
	end

	return var_48_0
end

function var_0_0.GetFlagShipInterActionTaskList(arg_49_0)
	local var_49_0 = {}

	for iter_49_0, iter_49_1 in pairs(arg_49_0.data) do
		if iter_49_1:IsFlagShipInterActionType() then
			table.insert(var_49_0, iter_49_1)
		end
	end

	return var_49_0
end

return var_0_0
