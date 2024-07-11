local var_0_0 = class("SubmitTaskCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = arg_1_1:getType()
	local var_1_2
	local var_1_3 = {}
	local var_1_4 = getProxy(TaskProxy)
	local var_1_5 = true

	if type(var_1_0) == "number" or type(var_1_0) == "string" then
		var_1_2 = var_1_0
	elseif type(var_1_0) == "table" then
		if var_1_0.normal_submit then
			var_1_5 = var_1_0.virtual ~= nil and var_1_0.virtual
			var_1_2 = var_1_0.taskId
		else
			var_1_2 = var_1_0.taskId

			local var_1_6 = var_1_0.index
			local var_1_7 = var_1_4:getTaskById(var_1_2)

			assert(var_1_7:isSelectable())

			local var_1_8 = var_1_7:getConfig("award_choice")[var_1_6]

			for iter_1_0, iter_1_1 in ipairs(var_1_8) do
				table.insert(var_1_3, {
					type = iter_1_1[1],
					id = iter_1_1[2],
					number = iter_1_1[3]
				})
			end
		end
	end

	local var_1_9 = var_1_4:getTaskById(var_1_2)

	if not var_1_9 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("task_is_not_existence", var_1_2))

		if var_1_1 then
			var_1_1(false)
		end

		return
	end

	if not var_1_9:isFinish() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("task_submitTask_error_notFinish"))

		if var_1_1 then
			var_1_1(false)
		end

		return
	end

	if var_1_9:isActivityTask() then
		pg.m02:sendNotification(GAME.SUBMIT_ACTIVITY_TASK, {
			act_id = var_1_9:getActId(),
			task_ids = {
				var_1_2
			},
			callback = function(arg_2_0, arg_2_1)
				if arg_2_0 and var_1_1 then
					var_1_1(arg_2_0)
				end
			end
		})

		return
	end

	if var_1_4:isSubmitting(var_1_2) then
		return
	else
		var_1_4:addSubmittingTask(var_1_2)
	end

	local var_1_10 = {}

	if var_1_9:IsOverflowShipExpItem() and not arg_1_0:InTaskScene() then
		table.insert(var_1_10, function(arg_3_0)
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("player_expResource_mail_fullBag"),
				onYes = arg_3_0,
				onNo = function()
					var_1_4:removeSubmittingTask(var_1_2)

					if var_1_1 then
						var_1_1(false)
					end
				end
			})
		end)
	end

	seriesAsync(var_1_10, function()
		pg.ConnectionMgr.GetInstance():Send(20005, {
			id = var_1_9.id,
			choice_award = var_1_3
		}, 20006, function(arg_6_0)
			var_1_4:removeSubmittingTask(var_1_2)

			if arg_6_0.result == 0 then
				local var_6_0 = PlayerConst.addTranDrop(arg_6_0.award_list, {
					taskId = var_1_9.id
				})

				if not var_1_5 then
					for iter_6_0 = #var_6_0, 1, -1 do
						if var_6_0[iter_6_0].type == DROP_TYPE_VITEM then
							table.remove(var_6_0, iter_6_0)
						end
					end
				end

				var_0_0.OnSubmitSuccess(var_1_9, var_1_1)
				pg.m02:sendNotification(GAME.SUBMIT_TASK_DONE, var_6_0, {
					var_1_9.id
				})
			else
				pg.TipsMgr.GetInstance():ShowTips(errorTip("task_submitTask", arg_6_0.result))

				if var_1_1 then
					var_1_1(false)
				end
			end
		end)
	end)
end

function var_0_0.OnSubmitSuccess(arg_7_0, arg_7_1)
	var_0_0.CheckTaskSub(arg_7_0)
	var_0_0.AddGuildLivness(arg_7_0)
	var_0_0.CheckTaskType(arg_7_0)
	var_0_0.UpdateActivity(arg_7_0)

	if arg_7_1 then
		arg_7_1(true)
	end
end

function var_0_0.CheckTaskSub(arg_8_0)
	if arg_8_0:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_ITEM then
		local var_8_0 = tonumber(arg_8_0:getConfig("target_id"))
		local var_8_1 = arg_8_0:getConfig("target_num")

		getProxy(BagProxy):removeItemById(tonumber(var_8_0), tonumber(var_8_1))
	elseif arg_8_0:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_VIRTUAL_ITEM then
		local var_8_2 = tonumber(arg_8_0:getConfig("target_id"))
		local var_8_3 = arg_8_0:getConfig("target_num")

		getProxy(ActivityProxy):removeVitemById(var_8_2, var_8_3)
	elseif arg_8_0:getConfig("sub_type") == TASK_SUB_TYPE_PLAYER_RES then
		local var_8_4 = tonumber(arg_8_0:getConfig("target_id"))
		local var_8_5 = arg_8_0:getConfig("target_num")
		local var_8_6 = getProxy(PlayerProxy)
		local var_8_7 = var_8_6:getData()

		var_8_7:consume({
			[id2res(var_8_4)] = var_8_5
		})
		var_8_6:updatePlayer(var_8_7)
	end
end

function var_0_0.CheckTaskType(arg_9_0)
	if arg_9_0:getConfig("type") == Task.TYPE_REFLUX then
		getProxy(RefluxProxy):addPtAfterSubTasks({
			arg_9_0
		})
	end

	if arg_9_0:getConfig("type") ~= 8 then
		getProxy(TaskProxy):removeTask(arg_9_0)
	else
		arg_9_0.submitTime = 1

		getProxy(TaskProxy):updateTask(arg_9_0)
	end
end

function var_0_0.AddGuildLivness(arg_10_0)
	if arg_10_0:IsGuildAddLivnessType() then
		local var_10_0 = getProxy(GuildProxy)
		local var_10_1 = var_10_0:getData()
		local var_10_2 = 0
		local var_10_3 = false

		if var_10_1 and arg_10_0:isGuildTask() then
			var_10_1:setWeeklyTaskFlag(1)

			local var_10_4 = var_10_1:getWeeklyTask()

			if var_10_4 then
				var_10_2 = var_10_4:GetLivenessAddition()
			end

			var_10_3 = true
		elseif arg_10_0:IsRoutineType() then
			var_10_2 = pg.guildset.new_daily_task_guild_active.key_value
		elseif arg_10_0:IsWeeklyType() then
			var_10_2 = pg.guildset.new_weekly_task_guild_active.key_value
		end

		if var_10_1 and var_10_2 and var_10_2 > 0 then
			var_10_1:getMemberById(getProxy(PlayerProxy):getRawData().id):AddLiveness(var_10_2)

			var_10_3 = true
		end

		if var_10_3 then
			var_10_0:updateGuild(var_10_1)
		end
	end
end

function var_0_0.UpdateActivity(arg_11_0)
	local var_11_0 = getProxy(ActivityProxy)
	local var_11_1 = var_11_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_TASK_LIST_MONITOR)

	if var_11_1 and not var_11_1:isEnd() then
		local var_11_2 = var_11_1:getConfig("config_data")[1] or {}

		if table.contains(var_11_2, arg_11_0.id) then
			var_11_0:monitorTaskList(var_11_1)
		end
	end
end

function var_0_0.InTaskScene(arg_12_0)
	return getProxy(ContextProxy):getCurrentContext().mediator == TaskMediator
end

return var_0_0
