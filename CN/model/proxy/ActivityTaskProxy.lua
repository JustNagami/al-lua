local var_0_0 = class("ActivityTaskProxy", import(".NetProxy"))

function var_0_0.register(arg_1_0)
	arg_1_0.actTasks = {}
	arg_1_0.autoSubmitTasks = {}
end

function var_0_0.clearData(arg_2_0)
	arg_2_0.actTasks = {}
	arg_2_0.autoSubmitTasks = {}
end

function var_0_0.initActList(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	if not arg_3_2 then
		return {}
	end

	local var_3_0 = {}
	local var_3_1 = {}

	for iter_3_0, iter_3_1 in ipairs(arg_3_2) do
		local var_3_2 = arg_3_0:createTask(arg_3_1, iter_3_1)

		table.insert(var_3_0, var_3_2)
	end

	if arg_3_3 and #arg_3_3 > 0 then
		for iter_3_2, iter_3_3 in ipairs(arg_3_3) do
			local var_3_3 = arg_3_0:createTask(arg_3_1, {
				id = iter_3_3
			})

			table.insert(var_3_1, var_3_3)
		end
	end

	table.insert(arg_3_0.actTasks, {
		actId = arg_3_1,
		tasks = var_3_0,
		finish_tasks = var_3_1
	})
	arg_3_0:checkAutoSubmit()
end

function var_0_0.finishActTask(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = pg.task_data_template[arg_4_2].type

	if not table.contains(TotalTaskProxy.act_task_onece_type, var_4_0) then
		return
	end

	for iter_4_0 = 1, #arg_4_0.actTasks do
		if arg_4_0.actTasks[iter_4_0].actId == arg_4_1 then
			local var_4_1 = true

			for iter_4_1, iter_4_2 in ipairs(arg_4_0.actTasks[iter_4_0].finish_tasks) do
				if iter_4_2.id == arg_4_2 then
					var_4_1 = false

					break
				end
			end

			if var_4_1 then
				table.insert(arg_4_0.actTasks[iter_4_0].finish_tasks, arg_4_0:createTask(arg_4_1, {
					id = arg_4_2
				}))
			end
		end
	end
end

function var_0_0.updateActList(arg_5_0, arg_5_1, arg_5_2)
	for iter_5_0, iter_5_1 in ipairs(arg_5_2) do
		for iter_5_2 = 1, #arg_5_0.actTasks do
			if arg_5_0.actTasks[iter_5_2].actId == arg_5_1 then
				for iter_5_3, iter_5_4 in ipairs(arg_5_0.actTasks[iter_5_2].tasks) do
					if iter_5_4.id == iter_5_1.id then
						iter_5_4:updateProgress(iter_5_1.progress)
					end
				end
			end
		end
	end

	arg_5_0:checkAutoSubmit()
end

function var_0_0.addActList(arg_6_0, arg_6_1, arg_6_2)
	for iter_6_0, iter_6_1 in ipairs(arg_6_2) do
		for iter_6_2 = 1, #arg_6_0.actTasks do
			if arg_6_0.actTasks[iter_6_2].actId == arg_6_1 then
				local var_6_0 = arg_6_0.actTasks[iter_6_2].tasks

				for iter_6_3 = #var_6_0, 1, -1 do
					if var_6_0[iter_6_3].id == iter_6_1.id then
						table.remove(var_6_0, iter_6_3)
					end
				end

				local var_6_1 = arg_6_0:createTask(arg_6_1, iter_6_1)

				table.insert(var_6_0, var_6_1)
			end
		end
	end

	arg_6_0:checkAutoSubmit()
end

function var_0_0.checkAutoSubmit(arg_7_0)
	if not arg_7_0.actTasks or #arg_7_0.actTasks == 0 then
		return
	end

	for iter_7_0 = 1, #arg_7_0.actTasks do
		local var_7_0 = arg_7_0.actTasks[iter_7_0].actId
		local var_7_1 = arg_7_0.actTasks[iter_7_0].tasks
		local var_7_2 = {}

		for iter_7_1, iter_7_2 in ipairs(var_7_1) do
			if iter_7_2.autoCommit and iter_7_2:isFinish() then
				if not table.contains(arg_7_0.autoSubmitTasks, iter_7_2.id) then
					table.insert(var_7_2, iter_7_2.id)
					table.insert(arg_7_0.autoSubmitTasks, iter_7_2.id)
				else
					warning("task_id" .. iter_7_2.id .. "已经存在于提交列表中，无需重复提交")
				end
			end
		end

		if #var_7_2 > 0 then
			arg_7_0:sendNotification(GAME.SUBMIT_ACTIVITY_TASK, {
				act_id = var_7_0,
				task_ids = var_7_2
			})
		end
	end
end

function var_0_0.removeActList(arg_8_0, arg_8_1, arg_8_2)
	for iter_8_0, iter_8_1 in ipairs(arg_8_2) do
		for iter_8_2 = 1, #arg_8_0.actTasks do
			if arg_8_0.actTasks[iter_8_2].actId == arg_8_1 then
				local var_8_0 = arg_8_0.actTasks[iter_8_2].tasks

				for iter_8_3 = #var_8_0, 1, -1 do
					if var_8_0[iter_8_3].id == iter_8_1.id then
						if var_8_0[iter_8_3]:isCircle() then
							var_8_0[iter_8_3]:updateProgress(0)
						else
							local var_8_1 = table.remove(var_8_0, iter_8_3)

							arg_8_0:finishActTask(arg_8_1, var_8_1.id)
						end
					end
				end
			end
		end
	end
end

function var_0_0.getTaskById(arg_9_0, arg_9_1)
	for iter_9_0, iter_9_1 in ipairs(arg_9_0.actTasks) do
		if iter_9_1.actId == arg_9_1 then
			return Clone(iter_9_1.tasks)
		end
	end

	return {}
end

function var_0_0.getFinishTaskById(arg_10_0, arg_10_1)
	for iter_10_0, iter_10_1 in ipairs(arg_10_0.actTasks) do
		if iter_10_1.actId == arg_10_1 then
			local var_10_0 = Clone(iter_10_1.finish_tasks)

			_.each(var_10_0, function(arg_11_0)
				arg_11_0:setOver()
			end)

			return var_10_0
		end
	end

	return {}
end

function var_0_0.getFinishTasksByActId(arg_12_0, arg_12_1)
	local var_12_0 = getProxy(ActivityProxy):getActivityById(arg_12_1)

	if not var_12_0 then
		return {}
	end

	local var_12_1 = var_12_0:GetFinishedTaskIds()

	return _.map(var_12_1, function(arg_13_0)
		local var_13_0 = ActivityTask.New(arg_12_1, {
			id = arg_13_0
		})

		var_13_0:setOver()

		return var_13_0
	end)
end

function var_0_0.checkTasksFinish(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = {}

	for iter_14_0, iter_14_1 in ipairs(arg_14_0:getFinishTasksByActId(arg_14_1)) do
		var_14_0[iter_14_1.id] = true
	end

	return underscore.all(arg_14_2, function(arg_15_0)
		return var_14_0[arg_15_0.id]
	end)
end

function var_0_0.getTaskVOsByActId(arg_16_0, arg_16_1)
	local var_16_0 = arg_16_0:getTaskById(arg_16_1)

	table.insertto(var_16_0, arg_16_0:getFinishTasksByActId(arg_16_1))

	return var_16_0
end

function var_0_0.getActTaskTip(arg_17_0, arg_17_1)
	local var_17_0 = {}

	for iter_17_0, iter_17_1 in ipairs(arg_17_0.actTasks) do
		if iter_17_1.actId == arg_17_1 then
			var_17_0 = iter_17_1.tasks
		end
	end

	local var_17_1 = 0

	for iter_17_2, iter_17_3 in ipairs(var_17_0) do
		if not iter_17_3:isCircle() and not iter_17_3:isOver() and iter_17_3:isFinish() and not iter_17_3.autoCommit then
			var_17_1 = var_17_1 + 1
		end
	end

	return var_17_1 > 0
end

function var_0_0.getTaskVo(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = arg_18_0:getTaskById(arg_18_1)

	for iter_18_0 = 1, #var_18_0 do
		if var_18_0[iter_18_0].id == arg_18_2 then
			return Clone(var_18_0[iter_18_0])
		end
	end

	return nil
end

function var_0_0.createTask(arg_19_0, arg_19_1, arg_19_2)
	return (ActivityTask.New(arg_19_1, arg_19_2))
end

function var_0_0.getFinishTasks(arg_20_0)
	local var_20_0 = getProxy(ActivityProxy):GetTaskActivities()
	local var_20_1 = {}

	_.each(_.map(var_20_0, function(arg_21_0)
		return arg_20_0:getFinishTasksByActId(arg_21_0.id)
	end), function(arg_22_0)
		table.insertto(var_20_1, arg_22_0)
	end)

	return var_20_1
end

return var_0_0
