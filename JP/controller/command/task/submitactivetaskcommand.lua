local var_0_0 = class("SubmitActiveTaskCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody() or {}
	local var_1_1 = var_1_0.callback
	local var_1_2 = pg.activity_template[var_1_0.act_id].type
	local var_1_3 = {}

	if table.contains(TotalTaskProxy.avatar_task_type, var_1_2) then
		-- block empty
	elseif table.contains(TotalTaskProxy.activity_task_type, var_1_2) then
		for iter_1_0, iter_1_1 in ipairs(var_1_0.task_ids) do
			local var_1_4 = getProxy(ActivityTaskProxy):getTaskVo(var_1_0.act_id, iter_1_1)

			if var_1_4 then
				table.insert(var_1_3, var_1_4)
			end
		end
	elseif table.contains(TotalTaskProxy.normal_task_type, var_1_2) then
		for iter_1_2, iter_1_3 in ipairs(var_1_0.task_ids) do
			local var_1_5 = getProxy(TaskProxy):getTaskById(iter_1_3)

			table.insert(var_1_3, var_1_5)
		end
	end

	if not arg_1_0:InTaskScene() then
		local var_1_6, var_1_7 = arg_1_0:filterOverflowTaskVOList(var_1_3)

		if var_1_7 then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("player_expResource_mail_fullBag"),
				onYes = function()
					arg_1_0:submitActivity(var_1_0, var_1_3, var_1_2, var_1_1)
				end,
				onNo = function()
					if var_1_1 then
						var_1_1(false)
					end
				end
			})

			return
		end
	end

	arg_1_0:submitActivity(var_1_0, var_1_3, var_1_2, var_1_1)
end

function var_0_0.submitActivity(arg_4_0, arg_4_1, arg_4_2, arg_4_3, arg_4_4)
	pg.ConnectionMgr.GetInstance():Send(20205, {
		act_id = arg_4_1.act_id,
		task_ids = arg_4_1.task_ids
	}, 20206, function(arg_5_0)
		if arg_5_0.result == 0 then
			local var_5_0 = {}

			if table.contains(TotalTaskProxy.avatar_task_type, arg_4_3) then
				local var_5_1 = pg.activity_template[arg_4_1.act_id].config_id
				local var_5_2 = pg.activity_event_avatarframe[var_5_1]
				local var_5_3 = Clone(var_5_2.award_display)[1]
				local var_5_4 = 0

				for iter_5_0, iter_5_1 in ipairs(arg_4_1.task_ids) do
					var_5_4 = var_5_4 + arg_4_0:getAwardNum(var_5_2, iter_5_1)
				end

				local var_5_5 = getProxy(ActivityProxy):RawGetActivityById(arg_4_1.act_id)

				if var_5_5 then
					var_5_5.data1 = var_5_5.data1 + var_5_4
				end

				var_5_3[3] = var_5_4

				local var_5_6 = Drop.Create(var_5_3)

				table.insert(var_5_0, var_5_6)
				arg_4_0:sendNotification(GAME.SUBMIT_AVATAR_TASK_DONE, {
					awards = var_5_0
				})
			elseif table.contains(TotalTaskProxy.activity_task_type, arg_4_3) then
				local var_5_7 = PlayerConst.addTranDrop(arg_5_0.award_list, {})

				for iter_5_2 = 1, #arg_4_1.task_ids do
					local var_5_8 = arg_4_1.task_ids[iter_5_2]
					local var_5_9 = pg.task_data_template[var_5_8]
					local var_5_10 = var_5_9.award_display
					local var_5_11 = var_5_9.type
					local var_5_12 = var_5_9.sub_type
					local var_5_13 = tonumber(var_5_9.target_id)
					local var_5_14 = tonumber(var_5_9.target_id_2)
					local var_5_15 = var_5_9.target_num
					local var_5_16 = getProxy(ActivityProxy):getActivityById(arg_4_1.act_id)

					if var_5_11 == 6 and var_5_16 then
						assert(var_5_16)

						local var_5_17 = var_5_16:GetFinishedTaskIds()

						if not table.contains(var_5_17, var_5_8) then
							table.insert(var_5_17, var_5_8)
							getProxy(ActivityProxy):updateActivity(var_5_16)
						end
					end

					if var_5_11 == 6 and var_5_12 == 1006 and pg.activity_drop_type[var_5_13] then
						local var_5_18 = pg.activity_drop_type[var_5_13].activity_id
						local var_5_19 = getProxy(ActivityProxy):getActivityById(var_5_18)

						if var_5_19 then
							var_5_19:subVitemNumber(var_5_14, var_5_15)
							getProxy(ActivityProxy):updateActivity(var_5_19)
						end
					end
				end

				for iter_5_3, iter_5_4 in ipairs(arg_4_2) do
					SubmitTaskCommand.OnSubmitSuccess(iter_5_4)
				end

				arg_4_0:sendNotification(GAME.SUBMIT_ACTIVITY_TASK_DONE, {
					awards = var_5_7
				})
			elseif table.contains(TotalTaskProxy.normal_task_type, arg_4_3) then
				local var_5_20 = PlayerConst.addTranDrop(arg_5_0.award_list, {})

				for iter_5_5, iter_5_6 in ipairs(arg_4_2) do
					SubmitTaskCommand.OnSubmitSuccess(iter_5_6)
				end

				arg_4_0:sendNotification(GAME.SUBMIT_ACTIVITY_TASK_DONE, {
					awards = var_5_20
				})
			end

			if arg_4_4 then
				arg_4_4(true)
			end
		else
			if arg_4_4 then
				arg_4_4(false)
			end

			pg.TipsMgr.GetInstance():ShowTips(errorTip("", arg_5_0.result))
		end
	end)
end

function var_0_0.filterOverflowTaskVOList(arg_6_0, arg_6_1)
	local var_6_0 = {}
	local var_6_1 = getProxy(PlayerProxy):getData()
	local var_6_2 = pg.gameset.urpt_chapter_max.description[1]
	local var_6_3 = var_6_1.gold
	local var_6_4 = var_6_1.oil
	local var_6_5 = not LOCK_UR_SHIP and getProxy(BagProxy):GetLimitCntById(var_6_2) or 0
	local var_6_6 = pg.gameset.max_gold.key_value
	local var_6_7 = pg.gameset.max_oil.key_value

	if LOCK_UR_SHIP or not pg.gameset.urpt_chapter_max.description[2] then
		local var_6_8 = 0
	end

	local var_6_9 = false

	for iter_6_0, iter_6_1 in pairs(arg_6_1) do
		local var_6_10 = iter_6_1:judgeOverflow(var_6_3, var_6_4, var_6_5)

		if not var_6_10 then
			table.insert(var_6_0, iter_6_1)
		end

		if var_6_10 then
			var_6_9 = true
		end
	end

	return var_6_0, var_6_9
end

function var_0_0.getAwardNum(arg_7_0, arg_7_1, arg_7_2)
	for iter_7_0 = 1, #AvatarFrameTask.fillter_task_type do
		local var_7_0 = AvatarFrameTask.fillter_task_type[iter_7_0]
		local var_7_1 = arg_7_1[var_7_0]

		for iter_7_1, iter_7_2 in ipairs(var_7_1) do
			if arg_7_2 == iter_7_2[1] then
				if var_7_0 == AvatarFrameTask.type_task_level then
					return iter_7_2[6]
				elseif var_7_0 == AvatarFrameTask.type_task_ship then
					return iter_7_2[4]
				end
			end
		end
	end

	print("找不到taskId:" .. arg_7_2)

	return 0
end

function var_0_0.InTaskScene(arg_8_0)
	return getProxy(ContextProxy):getCurrentContext().mediator == TaskMediator
end

return var_0_0
