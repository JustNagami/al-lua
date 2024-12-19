local var_0_0 = class("ActivityTaskProxy", import(".NetProxy"))

function var_0_0.register(arg_1_0)
	arg_1_0.actTasks = {}
	arg_1_0.autoSubmitTasks = {}
end

function var_0_0.initActList(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	if not arg_2_2 then
		return {}
	end

	local var_2_0 = {}
	local var_2_1 = {}

	for iter_2_0, iter_2_1 in ipairs(arg_2_2) do
		local var_2_2 = arg_2_0:createTask(arg_2_1, iter_2_1)

		table.insert(var_2_0, var_2_2)
	end

	if arg_2_3 and #arg_2_3 > 0 then
		for iter_2_2, iter_2_3 in ipairs(arg_2_3) do
			local var_2_3 = arg_2_0:createTask(arg_2_1, {
				id = iter_2_3
			})

			table.insert(var_2_1, var_2_3)
		end
	end

	table.insert(arg_2_0.actTasks, {
		actId = arg_2_1,
		tasks = var_2_0,
		finish_tasks = var_2_1
	})
	arg_2_0:checkAutoSubmit()
end

function var_0_0.finishActTask(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = pg.task_data_template[arg_3_2].type

	if not table.contains(TotalTaskProxy.act_task_onece_type, var_3_0) then
		return
	end

	for iter_3_0 = 1, #arg_3_0.actTasks do
		if arg_3_0.actTasks[iter_3_0].actId == arg_3_1 then
			local var_3_1 = true

			for iter_3_1, iter_3_2 in ipairs(arg_3_0.actTasks[iter_3_0].finish_tasks) do
				if iter_3_2.id == arg_3_2 then
					var_3_1 = false

					break
				end
			end

			if var_3_1 then
				table.insert(arg_3_0.actTasks[iter_3_0].finish_tasks, arg_3_0:createTask(arg_3_1, {
					id = arg_3_2
				}))
			end
		end
	end
end

function var_0_0.updateActList(arg_4_0, arg_4_1, arg_4_2)
	for iter_4_0, iter_4_1 in ipairs(arg_4_2) do
		for iter_4_2 = 1, #arg_4_0.actTasks do
			if arg_4_0.actTasks[iter_4_2].actId == arg_4_1 then
				for iter_4_3, iter_4_4 in ipairs(arg_4_0.actTasks[iter_4_2].tasks) do
					if iter_4_4.id == iter_4_1.id then
						iter_4_4:updateProgress(iter_4_1.progress)
					end
				end
			end
		end
	end

	arg_4_0:checkAutoSubmit()
end

function var_0_0.addActList(arg_5_0, arg_5_1, arg_5_2)
	for iter_5_0, iter_5_1 in ipairs(arg_5_2) do
		for iter_5_2 = 1, #arg_5_0.actTasks do
			if arg_5_0.actTasks[iter_5_2].actId == arg_5_1 then
				local var_5_0 = arg_5_0.actTasks[iter_5_2].tasks

				for iter_5_3 = #var_5_0, 1, -1 do
					if var_5_0[iter_5_3].id == iter_5_1.id then
						table.remove(var_5_0, iter_5_3)
					end
				end

				local var_5_1 = arg_5_0:createTask(arg_5_1, iter_5_1)

				table.insert(var_5_0, var_5_1)
			end
		end
	end

	arg_5_0:checkAutoSubmit()
end

function var_0_0.checkAutoSubmit(arg_6_0)
	if not arg_6_0.actTasks or #arg_6_0.actTasks == 0 then
		return
	end

	for iter_6_0 = 1, #arg_6_0.actTasks do
		local var_6_0 = arg_6_0.actTasks[iter_6_0].actId
		local var_6_1 = arg_6_0.actTasks[iter_6_0].tasks
		local var_6_2 = {}

		for iter_6_1, iter_6_2 in ipairs(var_6_1) do
			if iter_6_2.autoCommit and iter_6_2:isFinish() then
				if not table.contains(arg_6_0.autoSubmitTasks, iter_6_2.id) then
					table.insert(var_6_2, iter_6_2.id)
					table.insert(arg_6_0.autoSubmitTasks, iter_6_2.id)
				else
					warning("task_id" .. iter_6_2.id .. "已经存在于提交列表中，无需重复提交")
				end
			end
		end

		if #var_6_2 > 0 then
			arg_6_0:sendNotification(GAME.SUBMIT_ACTIVITY_TASK, {
				act_id = var_6_0,
				task_ids = var_6_2
			})
		end
	end
end

function var_0_0.removeActList(arg_7_0, arg_7_1, arg_7_2)
	for iter_7_0, iter_7_1 in ipairs(arg_7_2) do
		for iter_7_2 = 1, #arg_7_0.actTasks do
			if arg_7_0.actTasks[iter_7_2].actId == arg_7_1 then
				local var_7_0 = arg_7_0.actTasks[iter_7_2].tasks

				for iter_7_3 = #var_7_0, 1, -1 do
					if var_7_0[iter_7_3].id == iter_7_1.id then
						if var_7_0[iter_7_3]:isCircle() then
							var_7_0[iter_7_3]:updateProgress(0)
						else
							local var_7_1 = table.remove(var_7_0, iter_7_3)

							arg_7_0:finishActTask(arg_7_1, var_7_1.id)
						end
					end
				end
			end
		end
	end
end

function var_0_0.getTaskById(arg_8_0, arg_8_1)
	for iter_8_0, iter_8_1 in ipairs(arg_8_0.actTasks) do
		if iter_8_1.actId == arg_8_1 then
			return Clone(iter_8_1.tasks)
		end
	end

	return {}
end

function var_0_0.getFinishTaskById(arg_9_0, arg_9_1)
	for iter_9_0, iter_9_1 in ipairs(arg_9_0.actTasks) do
		if iter_9_1.actId == arg_9_1 then
			local var_9_0 = Clone(iter_9_1.finish_tasks)

			_.each(var_9_0, function(arg_10_0)
				arg_10_0:setOver()
			end)

			return var_9_0
		end
	end

	return {}
end

function var_0_0.getFinishTasksByActId(arg_11_0, arg_11_1)
	local var_11_0 = getProxy(ActivityProxy):getActivityById(arg_11_1)

	if not var_11_0 then
		return {}
	end

	local var_11_1 = var_11_0:GetFinishedTaskIds()

	return _.map(var_11_1, function(arg_12_0)
		local var_12_0 = ActivityTask.New(arg_11_1, {
			id = arg_12_0
		})

		var_12_0:setOver()

		return var_12_0
	end)
end

function var_0_0.checkTasksFinish(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = {}

	for iter_13_0, iter_13_1 in ipairs(arg_13_0:getFinishTasksByActId(arg_13_1)) do
		var_13_0[iter_13_1.id] = true
	end

	return underscore.all(arg_13_2, function(arg_14_0)
		return var_13_0[arg_14_0.id]
	end)
end

function var_0_0.getTaskVOsByActId(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_0:getTaskById(arg_15_1)

	table.insertto(var_15_0, arg_15_0:getFinishTasksByActId(arg_15_1))

	return var_15_0
end

function var_0_0.getActTaskTip(arg_16_0, arg_16_1)
	local var_16_0 = {}

	for iter_16_0, iter_16_1 in ipairs(arg_16_0.actTasks) do
		if iter_16_1.actId == arg_16_1 then
			var_16_0 = iter_16_1.tasks
		end
	end

	local var_16_1 = 0

	for iter_16_2, iter_16_3 in ipairs(var_16_0) do
		if not iter_16_3:isCircle() and not iter_16_3:isOver() and iter_16_3:isFinish() and not iter_16_3.autoCommit then
			var_16_1 = var_16_1 + 1
		end
	end

	return var_16_1 > 0
end

function var_0_0.getTaskVo(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = arg_17_0:getTaskById(arg_17_1)

	for iter_17_0 = 1, #var_17_0 do
		if var_17_0[iter_17_0].id == arg_17_2 then
			return Clone(var_17_0[iter_17_0])
		end
	end

	return nil
end

function var_0_0.createTask(arg_18_0, arg_18_1, arg_18_2)
	return (ActivityTask.New(arg_18_1, arg_18_2))
end

function var_0_0.getFinishTasks(arg_19_0)
	local var_19_0 = getProxy(ActivityProxy):GetTaskActivities()
	local var_19_1 = {}

	_.each(_.map(var_19_0, function(arg_20_0)
		return arg_19_0:getFinishTasksByActId(arg_20_0.id)
	end), function(arg_21_0)
		table.insertto(var_19_1, arg_21_0)
	end)

	return var_19_1
end

return var_0_0
