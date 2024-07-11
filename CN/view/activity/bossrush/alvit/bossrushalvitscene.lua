local var_0_0 = class("BossRushAlvitScene", import("view.base.BaseUI"))

var_0_0.DISPLAY = {
	STORY = 2,
	BATTLE = 1
}

function var_0_0.getUIName(arg_1_0)
	return "BossRushAlvitUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.top = arg_2_0._tf:Find("Top")
	arg_2_0.ptBtn = arg_2_0.top:Find("right/pt")
	arg_2_0.ptText = arg_2_0.ptBtn:Find("value/Text")
	arg_2_0.ptTip = arg_2_0.ptBtn:Find("tip")
	arg_2_0.rankBtn = arg_2_0.top:Find("right/rank")
	arg_2_0.taskBtn = arg_2_0.top:Find("right/task")
	arg_2_0.taskTip = arg_2_0.taskBtn:Find("tip")
	arg_2_0.seriesNodes = _.map(_.range(arg_2_0._tf:Find("Battle/Nodes").childCount), function(arg_3_0)
		return arg_2_0._tf:Find("Battle/Nodes"):GetChild(arg_3_0 - 1)
	end)
	arg_2_0.nodes = {}

	for iter_2_0 = 1, arg_2_0._tf:Find("Story/Nodes").childCount do
		local var_2_0 = arg_2_0._tf:Find("Story/Nodes"):GetChild(iter_2_0 - 1)

		arg_2_0.nodes[var_2_0.name] = var_2_0
	end

	arg_2_0.progressText = arg_2_0._tf:Find("Story/Desc/Text")
	arg_2_0.storyAward = arg_2_0._tf:Find("Story/Award")
	arg_2_0.ActionSequence = {}
end

function var_0_0.SetActivity(arg_4_0, arg_4_1)
	arg_4_0.activity = arg_4_1
end

function var_0_0.SetPtActivity(arg_5_0, arg_5_1)
	arg_5_0.ptActivity = arg_5_1
	arg_5_0.ptData = ActivityPtData.New(arg_5_0.ptActivity)
end

function var_0_0.didEnter(arg_6_0)
	onButton(arg_6_0, arg_6_0.top:Find("top/back"), function()
		arg_6_0:onBackPressed()
	end, SFX_CANCEL)
	onButton(arg_6_0, arg_6_0.top:Find("top/home"), function()
		arg_6_0:quickExitFunc()
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.rankBtn, function()
		arg_6_0:emit(BossRushAlvitMediator.ON_EXTRA_RANK)
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.ptBtn, function()
		arg_6_0:emit(BossRushAlvitMediator.GO_SUBLAYER, Context.New({
			mediator = ChildishnessSchoolPtMediator,
			viewComponent = ChildishnessSchoolPtPage
		}))
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.taskBtn, function()
		arg_6_0:emit(BossRushAlvitMediator.GO_SUBLAYER, Context.New({
			mediator = ChildishnessSchoolTaskMediator,
			viewComponent = ChildishnessSchoolTaskPage
		}))
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0._tf:Find("Battle/Story"), function()
		arg_6_0:SetDisplayMode(var_0_0.DISPLAY.STORY)
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0._tf:Find("Story/Battle"), function()
		arg_6_0:SetDisplayMode(var_0_0.DISPLAY.BATTLE)
	end, SFX_PANEL)

	local var_6_0 = arg_6_0.activity:getConfig("config_client").storys

	arg_6_0.storyNodesDict = {}

	_.each(var_6_0, function(arg_14_0)
		arg_6_0.storyNodesDict[arg_14_0] = BossRushStoryNode.New({
			id = arg_14_0
		})
	end)
	arg_6_0:UpdateStoryTask()

	local var_6_1 = arg_6_0.contextData.displayMode or BossRushAlvitScene.DISPLAY.BATTLE

	arg_6_0.contextData.displayMode = nil

	arg_6_0:SetDisplayMode(var_6_1)
end

function var_0_0.getBGM(arg_15_0)
	local var_15_0 = pg.voice_bgm[arg_15_0.__cname]

	if not var_15_0 then
		return nil
	end

	local var_15_1 = var_15_0.bgm
	local var_15_2 = "story-richang-11"
	local var_15_3 = arg_15_0.contextData.displayMode

	if var_15_3 == var_0_0.DISPLAY.BATTLE then
		return var_15_1
	elseif var_15_3 == var_0_0.DISPLAY.STORY then
		return var_15_2
	end
end

function var_0_0.SetDisplayMode(arg_16_0, arg_16_1)
	if arg_16_1 == arg_16_0.contextData.displayMode then
		return
	end

	arg_16_0.contextData.displayMode = arg_16_1

	arg_16_0:PlayBGM()
	arg_16_0:UpdateView()
end

function var_0_0.UpdateView(arg_17_0)
	local var_17_0 = arg_17_0.contextData.displayMode == var_0_0.DISPLAY.BATTLE

	setActive(arg_17_0._tf:Find("Battle"), var_17_0)
	setActive(arg_17_0._tf:Find("Story"), not var_17_0)
	arg_17_0:UpdateBattle()

	if not var_17_0 then
		arg_17_0:UpdateStory()
	end

	arg_17_0:UpdateTaskTip()

	local var_17_1 = arg_17_0.contextData.displayMode

	arg_17_0:addbubbleMsgBoxList({
		function(arg_18_0)
			local var_18_0

			if var_17_1 == var_0_0.DISPLAY.BATTLE then
				var_18_0 = arg_17_0.activity:getConfig("config_client").openActivityStory
			elseif var_17_1 == var_0_0.DISPLAY.STORY then
				var_18_0 = arg_17_0.activity:getConfig("config_client").openStory
			end

			arg_17_0:PlayStory(var_18_0, arg_18_0)
		end,
		function(arg_19_0)
			local var_19_0 = true

			for iter_19_0, iter_19_1 in pairs(arg_17_0.storyNodesDict) do
				local var_19_1 = iter_19_1:GetStory()

				if var_19_1 and var_19_1 ~= "" then
					var_19_0 = var_19_0 and pg.NewStoryMgr.GetInstance():IsPlayed(var_19_1)
				end

				if not var_19_0 then
					break
				end
			end

			if var_19_0 and arg_17_0.storyTask and arg_17_0.storyTask:getTaskStatus() == 2 then
				local var_19_2 = arg_17_0.activity:getConfig("config_client").endStory

				arg_17_0:PlayStory(var_19_2, function(arg_20_0)
					arg_19_0()

					if arg_20_0 then
						arg_17_0:UpdateView()
					end
				end)

				return
			end

			arg_19_0()
		end
	})
end

function var_0_0.UpdateBattle(arg_21_0)
	local var_21_0 = arg_21_0.activity
	local var_21_1 = var_21_0:GetActiveSeriesIds()

	table.Foreach(arg_21_0.seriesNodes, function(arg_22_0, arg_22_1)
		local var_22_0 = var_21_1[arg_22_0]
		local var_22_1 = BossRushSeriesData.New({
			id = var_22_0,
			actId = var_21_0.id
		})
		local var_22_2 = var_22_1:IsUnlock(var_21_0)

		setActive(arg_22_1, var_22_2)

		local var_22_3 = var_22_1:GetType() == BossRushSeriesData.TYPE.SP
		local var_22_4 = true

		if var_22_3 then
			local var_22_5 = var_21_0:GetUsedBonus()[arg_22_0] or 0
			local var_22_6 = var_22_1:GetMaxBonusCount()

			setText(arg_22_1:Find("count/Text"), i18n("series_enemy_SP_count") .. math.max(0, var_22_6 - var_22_5) .. "/" .. var_22_6)

			var_22_4 = var_22_6 - var_22_5 > 0
		end

		local function var_22_7()
			if not var_22_2 then
				local var_23_0 = var_22_1:GetPreSeriesId()
				local var_23_1 = BossRushSeriesData.New({
					id = var_23_0
				})

				pg.TipsMgr.GetInstance():ShowTips(i18n("series_enemy_unlock", var_23_1:GetName()))

				return
			end

			if not var_22_4 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("series_enemy_SP_error"))

				return
			end

			arg_21_0:emit(BossRushAlvitMediator.ON_FLEET_SELECT, var_22_1)
		end

		onButton(arg_21_0, arg_22_1:Find("icon"), function()
			var_22_7()
		end, SFX_PANEL)
		onButton(arg_21_0, arg_22_1:Find("text"), function()
			var_22_7()
		end, SFX_PANEL)
	end)
	setText(arg_21_0.ptText, arg_21_0.ptActivity.data1)
	setActive(arg_21_0.ptTip, Activity.IsActivityReady(arg_21_0.ptActivity))
	setActive(arg_21_0._tf:Find("Battle/Story/new"), arg_21_0.storyTask and arg_21_0.storyTask:getTaskStatus() ~= 2)
end

function var_0_0.UpdateStory(arg_26_0)
	local var_26_0 = {}
	local var_26_1 = pg.NewStoryMgr.GetInstance()
	local var_26_2 = 1
	local var_26_3 = 2
	local var_26_4 = 3
	local var_26_5 = 0
	local var_26_6 = 0

	for iter_26_0, iter_26_1 in pairs(arg_26_0.storyNodesDict) do
		var_26_0[iter_26_0] = {}

		local var_26_7 = iter_26_1:GetStory()
		local var_26_8 = true

		if var_26_7 and var_26_7 ~= "" then
			var_26_8 = var_26_1:IsPlayed(var_26_7)
			var_26_5 = var_26_5 + (var_26_8 and 1 or 0)
			var_26_6 = var_26_6 + 1
		end

		var_26_0[iter_26_0].status = var_26_8 and var_26_4 or var_26_2
	end

	setText(arg_26_0.progressText, var_26_5 .. "/" .. var_26_6)

	local var_26_9 = _.sort(_.values(arg_26_0.storyNodesDict), function(arg_27_0, arg_27_1)
		return arg_27_0.id < arg_27_1.id
	end)

	_.each(var_26_9, function(arg_28_0)
		local var_28_0 = arg_28_0:GetTriggers()

		if var_26_0[arg_28_0.id].status == var_26_4 then
			return
		end

		if not _.any(var_28_0, function(arg_29_0)
			if arg_29_0.type == BossRushStoryNode.TRIGGER_TYPE.PT_GOT then
				return arg_26_0.ptActivity.data1 < arg_29_0.value
			elseif arg_29_0.type == BossRushStoryNode.TRIGGER_TYPE.SERIES_PASSED then
				return not BossRushSeriesData.New({
					id = arg_29_0.value,
					actId = arg_26_0.activity.id
				}):IsUnlock(arg_26_0.activity)
			elseif arg_29_0.type == BossRushStoryNode.TRIGGER_TYPE.STORY_READED then
				return var_26_0[arg_29_0.value].status < var_26_4
			end
		end) then
			var_26_0[arg_28_0.id].status = var_26_3
		end
	end)
	table.Foreach(arg_26_0.storyNodesDict, function(arg_30_0, arg_30_1)
		local var_30_0 = arg_26_0.nodes[tostring(arg_30_1.id)]
		local var_30_1 = isActive(var_30_0)

		if var_26_0[arg_30_0].status > var_26_2 then
			if not var_30_1 then
				setActive(var_30_0, true)
			end

			setActive(var_30_0, true)

			if not var_30_1 then
				var_30_0:GetComponent(typeof(Animation)):Play("anim_kinder_bossrush_story_tip")
			end
		else
			setActive(var_30_0, false)
		end

		setText(var_30_0:Find("main/Text"), arg_30_1:GetName())

		local var_30_2 = var_26_0[arg_30_0].status == var_26_3
		local var_30_3 = arg_30_1:GetType()

		if var_30_3 == BossRushStoryNode.NODE_TYPE.NORMAL then
			setActive(var_30_0:Find("tags/story"), true)
			setActive(var_30_0:Find("tags/battle"), false)
		elseif var_30_3 == BossRushStoryNode.NODE_TYPE.EVENT then
			-- block empty
		elseif var_30_3 == BossRushStoryNode.NODE_TYPE.BATTLE then
			setActive(var_30_0:Find("tags/story"), false)
			setActive(var_30_0:Find("tags/battle"), true)
		end

		local var_30_4 = var_26_0[arg_30_0].status == var_26_4

		setActive(var_30_0:Find("main"), not var_30_4)
		setActive(var_30_0:Find("finish"), var_30_4)
		setActive(var_30_0:Find("finish_tag"), var_30_4)
		onButton(arg_26_0, var_30_0, function()
			if not var_30_2 or var_30_4 then
				return
			end

			local var_31_0 = arg_30_1:GetStory()

			arg_26_0:PlayStory(var_31_0, function()
				arg_26_0:UpdateView()
			end)
		end)
	end)
	setActive(arg_26_0.storyAward, tobool(arg_26_0.storyTask))

	if arg_26_0.storyTask then
		local var_26_10 = arg_26_0.storyTask:getConfig("award_display")
		local var_26_11 = Drop.New({
			type = var_26_10[1][1],
			id = var_26_10[1][2],
			count = var_26_10[1][3]
		})

		updateDrop(arg_26_0.storyAward:GetChild(0), var_26_11)

		local var_26_12 = arg_26_0.storyTask:getTaskStatus()

		setActive(arg_26_0.storyAward:Find("get"), var_26_12 == 1)
		setActive(arg_26_0.storyAward:Find("got"), var_26_12 == 2)

		if var_26_12 == 1 then
			arg_26_0:emit(BossRushAlvitMediator.ON_TASK_SUBMIT, arg_26_0.storyTask)
		end

		onButton(arg_26_0, arg_26_0.storyAward, function()
			arg_26_0:emit(BaseUI.ON_DROP, var_26_11)
		end)
	end
end

function var_0_0.PlayStory(arg_34_0, arg_34_1, arg_34_2)
	if not arg_34_1 then
		return existCall(arg_34_2)
	end

	local var_34_0 = pg.NewStoryMgr.GetInstance()
	local var_34_1 = var_34_0:IsPlayed(arg_34_1)

	seriesAsync({
		function(arg_35_0)
			if var_34_1 then
				return arg_35_0()
			end

			local var_35_0 = tonumber(arg_34_1)

			if var_35_0 and var_35_0 > 0 then
				arg_34_0:emit(BossRushAlvitMediator.ON_PERFORM_COMBAT, var_35_0)
			else
				var_34_0:Play(arg_34_1, arg_35_0)
			end
		end,
		function(arg_36_0, ...)
			existCall(arg_34_2, ...)
		end
	})
end

function var_0_0.UpdateStoryTask(arg_37_0)
	local var_37_0 = arg_37_0.activity:getConfig("config_client").tasks[1]

	arg_37_0.storyTask = getProxy(TaskProxy):getTaskVO(var_37_0) or Task.New({
		submit_time = 1,
		id = var_37_0
	})
end

function var_0_0.UpdateTaskTip(arg_38_0)
	setActive(arg_38_0.taskTip, Activity.IsActivityReady(getProxy(ActivityProxy):getActivityById(ActivityConst.ALVIT_TASK_ACT_ID)))
end

function var_0_0.addbubbleMsgBoxList(arg_39_0, arg_39_1)
	local var_39_0 = #arg_39_0.ActionSequence == 0

	table.insertto(arg_39_0.ActionSequence, arg_39_1)

	if not var_39_0 then
		return
	end

	arg_39_0:resumeBubble()
end

function var_0_0.addbubbleMsgBox(arg_40_0, arg_40_1)
	local var_40_0 = #arg_40_0.ActionSequence == 0

	table.insert(arg_40_0.ActionSequence, arg_40_1)

	if not var_40_0 then
		return
	end

	arg_40_0:resumeBubble()
end

function var_0_0.resumeBubble(arg_41_0)
	if #arg_41_0.ActionSequence == 0 then
		return
	end

	local var_41_0

	local function var_41_1()
		local var_42_0 = arg_41_0.ActionSequence[1]

		if var_42_0 then
			var_42_0(function()
				table.remove(arg_41_0.ActionSequence, 1)
				var_41_1()
			end)
		end
	end

	var_41_1()
end

function var_0_0.onBackPressed(arg_44_0)
	arg_44_0:emit(BossRushAlvitMediator.GO_SCENE, SCENE.KINDERGARTEN, {
		isBack = true
	})
end

function var_0_0.CleanBubbleMsgbox(arg_45_0)
	table.clean(arg_45_0.ActionSequence)
end

return var_0_0
