local var_0_0 = class("MonopolyCar2024Page", import("view.base.BaseActivityPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.startBtn = arg_1_0:findTF("AD/start")
	arg_1_0.leftCountTxt = arg_1_0.startBtn:Find("Text"):GetComponent(typeof(Text))
	arg_1_0.turnCntTxt = arg_1_0:findTF("AD/turn"):GetComponent(typeof(Text))
	arg_1_0.progressTxt = arg_1_0:findTF("AD/progress"):GetComponent(typeof(Text))
	arg_1_0.turnAwards = {
		arg_1_0:findTF("AD/turn_awards/award_1"),
		arg_1_0:findTF("AD/turn_awards/award_2"),
		arg_1_0:findTF("AD/turn_awards/award_3")
	}
	arg_1_0.turnGoBtn = arg_1_0:findTF("AD/turn_awards/battle_btn")
	arg_1_0.turnGetBtn = arg_1_0:findTF("AD/turn_awards/get_btn")
	arg_1_0.progressImage = arg_1_0:findTF("AD/turn_awards/progress/bar")

	onButton(arg_1_0, arg_1_0.startBtn, function()
		if not arg_1_0.activity or arg_1_0.activity:isEnd() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

			return
		end

		arg_1_0:emit(ActivityMediator.GO_MONOPOLY2024, arg_1_0.activity.id)
	end, SFX_PANEL)

	arg_1_0.taskGoBtn = arg_1_0:findTF("AD/battle_btn")
	arg_1_0.taskGetBtn = arg_1_0:findTF("AD/get_btn")
	arg_1_0.taskGotBtn = arg_1_0:findTF("AD/got_btn")
	arg_1_0.taskDesc = arg_1_0:findTF("AD/Text"):GetComponent(typeof(Text))
	arg_1_0.taskAward = arg_1_0:findTF("AD/award")
	arg_1_0.taskProgress = arg_1_0:findTF("AD/taskProgress")
end

function var_0_0.OnDataSetting(arg_3_0)
	return
end

function var_0_0.OnFirstFlush(arg_4_0)
	return
end

function var_0_0.OnUpdateFlush(arg_5_0)
	arg_5_0:UpdateTurnAwards()
	arg_5_0:UpdateTask()
end

function var_0_0.UpdateTurnAwards(arg_6_0)
	local var_6_0 = arg_6_0.activity
	local var_6_1 = 3
	local var_6_2 = (var_6_0.data1_list[3] or 1) - 1
	local var_6_3 = var_6_0.data1_list[6] or 0

	arg_6_0.turnCntTxt.text = var_6_2 .. "/" .. var_6_1

	local var_6_4 = (math.max(var_6_0.data2, 1) - 1) / #(var_6_0:getDataConfig("map") or {})

	if var_6_4 == 0 and var_6_2 > 0 then
		var_6_4 = 1
	end

	arg_6_0.progressTxt.text = string.format("%.1f", var_6_4 * 100) .. "%"

	local var_6_5 = var_6_3 + 1
	local var_6_6 = var_6_0:getDataConfig("sum_lap_reward_show")

	for iter_6_0, iter_6_1 in ipairs(arg_6_0.turnAwards) do
		local var_6_7 = var_6_6[iter_6_0]
		local var_6_8 = Drop.New({
			type = var_6_7[1],
			id = var_6_7[2],
			count = var_6_7[3]
		})

		updateDrop(iter_6_1:Find("mask"), var_6_8)
		onButton(arg_6_0, iter_6_1, function()
			arg_6_0:emit(BaseUI.ON_DROP, var_6_8)
		end, SFX_PANEL)
		setActive(iter_6_1:Find("mark"), iter_6_0 == var_6_5)
		setActive(iter_6_1:Find("got"), iter_6_0 <= var_6_3)
	end

	local var_6_9 = var_6_1 < var_6_5
	local var_6_10 = var_6_5 <= var_6_2

	setActive(arg_6_0.turnGoBtn, not var_6_10 and not var_6_9)
	setActive(arg_6_0.turnGetBtn, var_6_10 and not var_6_9)

	local var_6_11 = {
		0.183,
		0.587,
		1
	}

	if var_6_2 <= 0 then
		setFillAmount(arg_6_0.progressImage, 0)
	else
		setFillAmount(arg_6_0.progressImage, var_6_11[var_6_2] or 1)
	end

	local var_6_12 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_6_13 = var_6_0.data1
	local var_6_14 = math.ceil((var_6_12 - var_6_13) / 86400) * var_6_0:getDataConfig("daily_time") + (var_6_0.data1_list[1] or 0) - (var_6_0.data1_list[2] or 0)

	arg_6_0.leftCountTxt.text = i18n("MonopolyCar2024Game_total_num_tip", var_6_14)

	onButton(arg_6_0, arg_6_0.turnGetBtn, function()
		pg.m02:sendNotification(GAME.MONOPOLY_OP, {
			activity_id = var_6_0.id,
			arg1 = var_6_5,
			cmd = ActivityConst.MONOPOLY_OP_ROUND_AWD
		})
	end, SFX_PANEL)
end

function var_0_0.UpdateTask(arg_9_0)
	local var_9_0 = pg.activity_const.MONOPOLY_TASK_ACT_ID.act_id
	local var_9_1 = getProxy(ActivityProxy):getActivityById(var_9_0)

	if not var_9_1 or var_9_1:isEnd() then
		return
	end

	local var_9_2 = var_9_1:getConfig("config_data")[1]
	local var_9_3 = getProxy(TaskProxy)
	local var_9_4 = var_9_3:getTaskById(var_9_2) or var_9_3:getFinishTaskById(var_9_2) or Task.New({
		id = var_9_2
	})
	local var_9_5 = var_9_3:getTaskById(var_9_2)
	local var_9_6 = var_9_4:getConfig("award_display")[1]
	local var_9_7 = Drop.New({
		type = var_9_6[1],
		id = var_9_6[2],
		count = var_9_6[3]
	})

	updateDrop(arg_9_0.taskAward:Find("mask"), var_9_7)
	onButton(arg_9_0, arg_9_0.taskAward, function()
		arg_9_0:emit(BaseUI.ON_DROP, var_9_7)
	end, SFX_PANEL)

	local var_9_8 = var_9_4:getConfig("target_num")

	if var_9_5 ~= nil then
		local var_9_9 = math.min(var_9_4:getProgress(), var_9_8)

		setSlider(arg_9_0.taskProgress, 0, var_9_8, var_9_9)

		local var_9_10 = var_9_4:getConfig("desc")

		for iter_9_0, iter_9_1 in ipairs({
			var_9_9
		}) do
			var_9_10 = string.gsub(var_9_10, "$" .. iter_9_0, iter_9_1)
		end

		arg_9_0.taskDesc.text = var_9_10

		local var_9_11 = var_9_4:isFinish()
		local var_9_12 = var_9_4:isReceive()

		setActive(arg_9_0.taskGoBtn, not var_9_11 and not var_9_12)
		setActive(arg_9_0.taskGetBtn, var_9_11 and not var_9_12)
		setActive(arg_9_0.taskGotBtn, var_9_12)
	else
		local var_9_13 = var_9_8

		setSlider(arg_9_0.taskProgress, 0, var_9_8, var_9_13)

		local var_9_14 = var_9_4:getConfig("desc")

		for iter_9_2, iter_9_3 in ipairs({
			var_9_13
		}) do
			var_9_14 = string.gsub(var_9_14, "$" .. iter_9_2, iter_9_3)
		end

		arg_9_0.taskDesc.text = var_9_14

		setActive(arg_9_0.taskGoBtn, false)
		setActive(arg_9_0.taskGetBtn, false)
		setActive(arg_9_0.taskGotBtn, true)
	end

	onButton(arg_9_0, arg_9_0.taskGetBtn, function()
		arg_9_0:emit(ActivityMediator.ON_TASK_SUBMIT, var_9_4, function(arg_12_0)
			if arg_12_0 then
				arg_9_0:OnUpdateFlush()
			end
		end)
	end, SFX_PANEL)
end

function var_0_0.OnHideFlush(arg_13_0)
	return
end

function var_0_0.OnDestroy(arg_14_0)
	return
end

return var_0_0
