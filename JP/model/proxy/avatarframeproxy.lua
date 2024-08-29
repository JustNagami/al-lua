local var_0_0 = class("AvatarFrameProxy", import(".NetProxy"))

var_0_0.FRAME_TASK_UPDATED = "frame task updated"
var_0_0.FRAME_TASK_TIME_OUT = "frame task time out"

function var_0_0.register(arg_1_0)
	arg_1_0.avatarFrames = {}
	arg_1_0.actTasks = {}
end

function var_0_0.initListData(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	arg_2_0.avatarFrames = {}

	local var_2_0 = {}
	local var_2_1 = {}

	for iter_2_0, iter_2_1 in ipairs(arg_2_2) do
		local var_2_2 = arg_2_0:createAvatarFrameTask(arg_2_1, iter_2_1)

		table.insert(var_2_0, var_2_2)
	end

	if arg_2_3 and #arg_2_3 then
		for iter_2_2, iter_2_3 in ipairs(arg_2_3) do
			local var_2_3 = arg_2_0:createAvatarFrameTask(arg_2_1, {
				id = iter_2_3
			})

			var_2_3:setTaskFinish()
			table.insert(var_2_1, var_2_3)
		end
	end

	table.insert(arg_2_0.avatarFrames, {
		actId = arg_2_1,
		tasks = var_2_0,
		finish_tasks = finishTask
	})
end

function var_0_0.update(arg_3_0, arg_3_1, arg_3_2)
	for iter_3_0, iter_3_1 in ipairs(arg_3_2) do
		arg_3_0:updateAvatarTask(arg_3_1, iter_3_1)
	end

	arg_3_0.facade:sendNotification(var_0_0.FRAME_TASK_UPDATED)
end

function var_0_0.addData(arg_4_0, arg_4_1, arg_4_2)
	for iter_4_0, iter_4_1 in ipairs(arg_4_2) do
		local var_4_0 = arg_4_0:createAvatarFrameTask(arg_4_1, iter_4_1)

		arg_4_0:addAvatarTask(arg_4_1, var_4_0)
	end

	arg_4_0.facade:sendNotification(var_0_0.FRAME_TASK_UPDATED)
end

function var_0_0.removeData(arg_5_0, arg_5_1, arg_5_2)
	for iter_5_0, iter_5_1 in ipairs(arg_5_2) do
		arg_5_0:removeAvatarTask(arg_5_1, iter_5_1.id)
	end

	arg_5_0.facade:sendNotification(var_0_0.FRAME_TASK_UPDATED)
end

function var_0_0.createAvatarFrameTask(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = pg.activity_template[arg_6_1].config_id

	return (AvatarFrameTask.New(arg_6_1, var_6_0, arg_6_2))
end

function var_0_0.updateAvatarTask(arg_7_0, arg_7_1, arg_7_2)
	for iter_7_0 = 1, #arg_7_0.avatarFrames do
		if arg_7_0.avatarFrames[iter_7_0].actId == arg_7_1 then
			local var_7_0 = arg_7_0.avatarFrames[iter_7_0]

			for iter_7_1 = #var_7_0.tasks, 1, -1 do
				if var_7_0.tasks[iter_7_1].id == arg_7_2.id then
					var_7_0.tasks[iter_7_1]:updateProgress(arg_7_2.progress)
				end
			end
		end
	end
end

function var_0_0.addAvatarTask(arg_8_0, arg_8_1, arg_8_2)
	for iter_8_0 = 1, #arg_8_0.avatarFrames do
		if arg_8_0.avatarFrames[iter_8_0].actId == arg_8_1 then
			local var_8_0 = arg_8_0.avatarFrames[iter_8_0]

			for iter_8_1 = #var_8_0.tasks, 1, -1 do
				if var_8_0.tasks[iter_8_1].id == arg_8_2.id then
					table.remove(var_8_0.tasks, iter_8_1)
				end
			end

			table.insert(var_8_0.tasks, arg_8_2)
		end
	end
end

function var_0_0.removeAvatarTask(arg_9_0, arg_9_1, arg_9_2)
	for iter_9_0 = 1, #arg_9_0.avatarFrames do
		if arg_9_0.avatarFrames[iter_9_0].actId == arg_9_1 then
			local var_9_0 = arg_9_0.avatarFrames[iter_9_0]

			for iter_9_1 = #var_9_0.tasks, 1, -1 do
				if var_9_0.tasks[iter_9_1].id == arg_9_2 then
					table.remove(var_9_0.tasks, iter_9_1)
				end
			end
		end
	end
end

function var_0_0.getAvatarFrameById(arg_10_0, arg_10_1)
	for iter_10_0 = 1, #arg_10_0.avatarFrames do
		if arg_10_0.avatarFrames[iter_10_0].actId == arg_10_1 then
			return Clone(arg_10_0.avatarFrames[iter_10_0])
		end
	end

	return nil
end

function var_0_0.getAllAvatarFrame(arg_11_0)
	return Clone(arg_11_0.avatarFrames)
end

function var_0_0.getCanReceiveCount(arg_12_0)
	local var_12_0 = 0

	for iter_12_0 = 1, #arg_12_0.avatarFrames do
		local var_12_1 = arg_12_0.avatarFrames[iter_12_0]

		for iter_12_1, iter_12_2 in ipairs(var_12_1.tasks) do
			if iter_12_2:getTaskStatus() == 1 then
				var_12_0 = var_12_0 + 1
			end
		end
	end

	return var_12_0
end

function var_0_0.clearTimeOut(arg_13_0)
	if not arg_13_0.avatarFrames or #arg_13_0.avatarFrames == 0 then
		return
	end

	local var_13_0 = false

	for iter_13_0 = #arg_13_0.avatarFrames, 1, -1 do
		local var_13_1 = arg_13_0.avatarFrames[iter_13_0].actId
		local var_13_2 = getProxy(ActivityProxy):getActivityById(var_13_1)

		if not var_13_2 or var_13_2:isEnd() then
			table.remove(arg_13_0.avatarFrames, iter_13_0)

			var_13_0 = true
		end
	end

	if var_13_0 then
		arg_13_0.facade:sendNotification(var_0_0.FRAME_TASK_UPDATED)
		arg_13_0.facade:sendNotification(var_0_0.FRAME_TASK_TIME_OUT)
	end
end

return var_0_0
