local var_0_0 = class("MainBasePainting", import("view.base.BaseEventLogic"))
local var_0_1 = 1
local var_0_2 = 2
local var_0_3 = 3
local var_0_4 = 4
local var_0_5

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_0.super.Ctor(arg_1_0, arg_1_2)
	pg.DelegateInfo.New(arg_1_0)

	arg_1_0.container = arg_1_1
	arg_1_0.state = var_0_1
	var_0_5 = pg.AssistantInfo
	arg_1_0.wordPosition = arg_1_1:Find("live2d")
	arg_1_0.cvLoader = MainCVLoader.New()
	arg_1_0.longPressEvent = arg_1_1:GetComponent("UILongPressTrigger").onLongPressed
end

function var_0_0.IsUnload(arg_2_0)
	return arg_2_0.state == var_0_4
end

function var_0_0.GetCenterPos(arg_3_0)
	return arg_3_0.wordPosition.position
end

function var_0_0.IsLoading(arg_4_0)
	return arg_4_0.state == var_0_2
end

function var_0_0.IsLoaded(arg_5_0)
	return arg_5_0.state == var_0_3
end

function var_0_0.Load(arg_6_0, arg_6_1)
	arg_6_0.isPuase = false
	arg_6_0.isExited = false
	arg_6_0.state = var_0_2
	arg_6_0.ship = arg_6_1
	arg_6_0.paintingName = arg_6_1:getPainting()

	arg_6_0:OnLoad(function()
		arg_6_0.state = var_0_3

		if arg_6_0.triggerWhenLoaded then
			arg_6_0:TriggerEventAtFirstTime()
		end

		arg_6_0:InitClickEvent()
	end)
end

function var_0_0.Unload(arg_8_0)
	arg_8_0.state = var_0_4

	removeOnButton(arg_8_0.container)
	arg_8_0.longPressEvent:RemoveAllListeners()
	arg_8_0:StopChatAnimtion()
	arg_8_0.cvLoader:Stop()
	arg_8_0:RemoveTimer()
	arg_8_0:OnUnload()

	arg_8_0.paintingName = nil

	LeanTween.cancel(arg_8_0.container.gameObject)
end

function var_0_0.UnloadOnlyPainting(arg_9_0)
	arg_9_0.state = var_0_4

	removeOnButton(arg_9_0.container)
	arg_9_0.longPressEvent:RemoveAllListeners()
	arg_9_0:RemoveTimer()
	arg_9_0:OnUnload()

	arg_9_0.paintingName = nil
end

function var_0_0.InitClickEvent(arg_10_0)
	onButton(arg_10_0, arg_10_0.container, function()
		arg_10_0:OnClick()
		arg_10_0:TriggerPersonalTask(arg_10_0.ship.groupId)
	end)
	arg_10_0.longPressEvent:RemoveAllListeners()
	arg_10_0.longPressEvent:AddListener(function()
		if getProxy(ContextProxy):getCurrentContext().viewComponent.__cname == "NewMainScene" then
			arg_10_0:OnLongPress()
		end
	end)
end

function var_0_0.TriggerPersonalTask(arg_13_0, arg_13_1)
	if arg_13_0.isFoldState then
		return
	end

	arg_13_0:TriggerInterActionTask()

	local var_13_0 = getProxy(TaskProxy)

	for iter_13_0, iter_13_1 in ipairs(pg.task_data_trigger.all) do
		local var_13_1 = pg.task_data_trigger[iter_13_1]

		if var_13_1.group_id == arg_13_1 then
			local var_13_2 = var_13_1.task_id

			if not var_13_0:getFinishTaskById(var_13_2) then
				arg_13_0:CheckStoryDownload(var_13_2, function()
					pg.m02:sendNotification(GAME.TRIGGER_TASK, var_13_2)
				end)

				break
			end
		end
	end
end

function var_0_0.TriggerInterActionTask(arg_15_0)
	local var_15_0 = getProxy(TaskProxy):GetFlagShipInterActionTaskList()

	if var_15_0 and #var_15_0 > 0 then
		for iter_15_0, iter_15_1 in ipairs(var_15_0) do
			pg.m02:sendNotification(GAME.UPDATE_TASK_PROGRESS, {
				taskId = iter_15_1.id
			})
		end
	end
end

function var_0_0.CheckStoryDownload(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = {}
	local var_16_1 = arg_16_1

	while true do
		local var_16_2 = pg.task_data_template[var_16_1]

		if var_16_2.story_id ~= "" then
			table.insert(var_16_0, var_16_2.story_id)
		end

		if var_16_2.next_task == "" or var_16_2.next_task == "0" then
			break
		end

		var_16_1 = var_16_1 + 1
	end

	local var_16_3 = pg.NewStoryMgr.GetInstance():GetStoryPaintingsByNameList(var_16_0)
	local var_16_4 = _.map(var_16_3, function(arg_17_0)
		return "painting/" .. arg_17_0
	end)

	PaintingGroupConst.PaintingDownload({
		isShowBox = true,
		paintingNameList = var_16_4,
		finishFunc = arg_16_2
	})
end

function var_0_0.TriggerEventAtFirstTime(arg_18_0)
	if not arg_18_0:IsLoaded() then
		arg_18_0.triggerWhenLoaded = true

		return
	end

	arg_18_0.triggerWhenLoaded = false

	arg_18_0:OnFirstTimeTriggerEvent()
end

function var_0_0.OnFirstTimeTriggerEvent(arg_19_0)
	local function var_19_0(arg_20_0)
		arg_19_0:_TriggerEvent(arg_20_0)
	end

	if getProxy(PlayerProxy):getFlag("login") then
		getProxy(PlayerProxy):setFlag("login", nil)
		var_19_0("event_login")
	elseif getProxy(PlayerProxy):getFlag("battle") then
		getProxy(PlayerProxy):setFlag("battle", nil)
		var_19_0("home")
	else
		arg_19_0:TriggerNextEventAuto()
	end
end

function var_0_0._TriggerEvent(arg_21_0, arg_21_1)
	local var_21_0 = var_0_5.assistantEvents[arg_21_1]

	if var_21_0.dialog ~= "" then
		arg_21_0:DisplayWord(var_21_0.dialog)
	else
		arg_21_0:TriggerNextEventAuto()
	end
end

function var_0_0.TriggerEvent(arg_22_0, arg_22_1)
	if arg_22_0.isDragAndZoomState then
		return
	end

	if arg_22_0.chatting then
		return
	end

	arg_22_0:RemoveTimer()
	arg_22_0:_TriggerEvent(arg_22_1)
	arg_22_0:OnTriggerEvent()
end

function var_0_0.TriggerNextEventAuto(arg_23_0)
	if arg_23_0.isPuase or arg_23_0.isExited then
		return
	end

	arg_23_0:OnEndChatting()
	arg_23_0:RemoveTimer()

	arg_23_0.timer = Timer.New(function()
		arg_23_0:OnTimerTriggerEvent()
	end, 30, 1, true)

	arg_23_0.timer:Start()
end

function var_0_0.OnTimerTriggerEvent(arg_25_0)
	if arg_25_0:OnEnableTimerEvent() then
		local var_25_0 = arg_25_0:CollectIdleEvents(arg_25_0.lastChatEvent)

		arg_25_0.lastChatEvent = var_25_0[math.ceil(math.random(#var_25_0))]

		arg_25_0:_TriggerEvent(arg_25_0.lastChatEvent)
		arg_25_0:OnTriggerEventAuto()
		arg_25_0:RemoveTimer()
	end
end

function var_0_0.OnEnableTimerEvent(arg_26_0)
	return true
end

function var_0_0.OnStartChatting(arg_27_0)
	arg_27_0.chatting = true
end

function var_0_0.OnEndChatting(arg_28_0)
	arg_28_0.chatting = false
end

function var_0_0.GetWordAndCv(arg_29_0, arg_29_1, arg_29_2)
	local var_29_0, var_29_1, var_29_2, var_29_3, var_29_4, var_29_5 = ShipWordHelper.GetCvDataForShip(arg_29_0.ship, arg_29_2)

	return var_29_0, var_29_1, var_29_2, var_29_3, var_29_4, var_29_5
end

function var_0_0.DisplayWord(arg_30_0, arg_30_1)
	arg_30_0:OnStartChatting()

	local var_30_0, var_30_1, var_30_2, var_30_3, var_30_4, var_30_5 = arg_30_0:GetWordAndCv(arg_30_0.ship, arg_30_1)

	if not var_30_2 or var_30_2 == nil or var_30_2 == "" or var_30_2 == "nil" then
		arg_30_0:OnEndChatting()

		return
	end

	arg_30_0:OnDisplayWorld(arg_30_1)
	arg_30_0:emit(MainWordView.SET_CONTENT, arg_30_1, var_30_2)
	arg_30_0:PlayCvAndAnimation(var_30_4, var_30_3, var_30_1)
end

function var_0_0.PlayCvAndAnimation(arg_31_0, arg_31_1, arg_31_2, arg_31_3)
	if getProxy(ContextProxy):getContextByMediator(NewShipMediator) then
		arg_31_0:OnEndChatting()

		return
	end

	local var_31_0 = -1

	seriesAsync({
		function(arg_32_0)
			if not arg_31_3 or not not pg.NewStoryMgr.GetInstance():IsRunning() then
				arg_32_0()

				return
			end

			arg_31_0:PlayCV(arg_31_1, arg_31_2, arg_31_3, function(arg_33_0)
				var_31_0 = arg_33_0

				arg_32_0()
			end)
		end,
		function(arg_34_0)
			arg_31_0:StartChatAnimtion(var_31_0, arg_34_0)
		end
	}, function()
		arg_31_0:OnDisplayWordEnd()
	end)
end

function var_0_0.OnDisplayWordEnd(arg_36_0)
	arg_36_0:TriggerNextEventAuto()
end

function var_0_0.PlayCV(arg_37_0, arg_37_1, arg_37_2, arg_37_3, arg_37_4)
	local var_37_0 = ShipWordHelper.RawGetCVKey(arg_37_0.ship.skinId)
	local var_37_1 = pg.CriMgr.GetCVBankName(var_37_0)

	arg_37_0.cvLoader:Load(var_37_1, arg_37_3, 0, arg_37_4)
end

function var_0_0.StartChatAnimtion(arg_38_0, arg_38_1, arg_38_2)
	local var_38_0 = 0.3
	local var_38_1 = arg_38_1 > 0 and arg_38_1 or 3

	arg_38_0:emit(MainWordView.START_ANIMATION, var_38_0, var_38_1)
	arg_38_0:AddCharTimer(function()
		if arg_38_0:IsUnload() then
			return
		end

		arg_38_2()
	end, var_38_0 * 3 + var_38_1)
end

function var_0_0.AddCharTimer(arg_40_0, arg_40_1, arg_40_2)
	arg_40_0:RemoveChatTimer()

	arg_40_0.chatTimer = Timer.New(arg_40_1, arg_40_2, 1)

	arg_40_0.chatTimer:Start()
end

function var_0_0.RemoveChatTimer(arg_41_0)
	if arg_41_0.chatTimer then
		arg_41_0.chatTimer:Stop()

		arg_41_0.chatTimer = nil
	end
end

function var_0_0.StopChatAnimtion(arg_42_0)
	arg_42_0:emit(MainWordView.STOP_ANIMATION)
	arg_42_0:OnEndChatting()
end

function var_0_0.OnStopVoice(arg_43_0)
	arg_43_0.cvLoader:Stop()
end

function var_0_0.CollectIdleEvents(arg_44_0, arg_44_1)
	local var_44_0 = {}

	if getProxy(EventProxy):hasFinishState() and arg_44_1 ~= "event_complete" then
		table.insert(var_44_0, "event_complete")
	else
		if getProxy(TaskProxy):getCanReceiveCount() > 0 and arg_44_1 ~= "mission_complete" then
			table.insert(var_44_0, "mission_complete")
		end

		if getProxy(MailProxy):GetUnreadCount() > 0 and arg_44_1 ~= "mail" then
			table.insert(var_44_0, "mail")
		end

		if #var_44_0 == 0 then
			local var_44_1 = arg_44_0.ship:getCVIntimacy()

			var_44_0 = var_0_5.filterAssistantEvents(Clone(var_0_5.IdleEvents), arg_44_0.ship.skinId, var_44_1)

			if getProxy(TaskProxy):getNotFinishCount() and getProxy(TaskProxy):getNotFinishCount() > 0 and arg_44_1 ~= "mission" then
				table.insert(var_44_0, "mission")
			end
		end
	end

	return var_44_0
end

function var_0_0.CollectTouchEvents(arg_45_0)
	local var_45_0 = arg_45_0.ship:getCVIntimacy()

	return (var_0_5.filterAssistantEvents(var_0_5.PaintingTouchEvents, arg_45_0.ship.skinId, var_45_0))
end

function var_0_0.GetTouchEvent(arg_46_0, arg_46_1)
	return (var_0_5.filterAssistantEvents(var_0_5.getAssistantTouchEvents(arg_46_1, arg_46_0.ship.skinId), arg_46_0.ship.skinId, 0))
end

function var_0_0.GetIdleEvents(arg_47_0)
	return (var_0_5.filterAssistantEvents(var_0_5.IdleEvents, arg_47_0.ship.skinId, 0))
end

function var_0_0.GetEventConfig(arg_48_0, arg_48_1)
	return var_0_5.assistantEvents[arg_48_1]
end

function var_0_0.GetSpecialTouchEvent(arg_49_0, arg_49_1)
	return var_0_5.getPaintingTouchEvents(arg_49_1)
end

function var_0_0.RemoveTimer(arg_50_0)
	if arg_50_0.timer then
		arg_50_0.timer:Stop()

		arg_50_0.timer = nil
	end
end

function var_0_0.IsExited(arg_51_0)
	return arg_51_0.isExited
end

function var_0_0.Fold(arg_52_0, arg_52_1, arg_52_2)
	arg_52_0.isFoldState = arg_52_1

	arg_52_0:RemoveMoveTimer()
	arg_52_0:OnFold(arg_52_1)
end

function var_0_0.RemoveMoveTimer(arg_53_0)
	if arg_53_0.moveTimer then
		arg_53_0.moveTimer:Stop()

		arg_53_0.moveTimer = nil
	end
end

function var_0_0.EnableOrDisableMove(arg_54_0, arg_54_1)
	arg_54_0.isDragAndZoomState = arg_54_1

	arg_54_0:RemoveMoveTimer()

	if arg_54_1 then
		arg_54_0:StopChatAnimtion()
		arg_54_0:RemoveTimer()
		arg_54_0.cvLoader:Stop()
	else
		arg_54_0:TriggerNextEventAuto()
	end

	arg_54_0:OnEnableOrDisableDragAndZoom(arg_54_1)
end

function var_0_0.GetOffset(arg_55_0)
	return 0
end

function var_0_0.IslimitYPos(arg_56_0)
	return false
end

function var_0_0.PauseForSilent(arg_57_0)
	if arg_57_0:IsLoaded() then
		arg_57_0:_Pause()
	end
end

function var_0_0._Pause(arg_58_0)
	arg_58_0.isPuase = true

	arg_58_0:RemoveMoveTimer()
	arg_58_0:StopChatAnimtion()
	arg_58_0:RemoveChatTimer()
	arg_58_0:RemoveTimer()
	arg_58_0.cvLoader:Stop()
end

function var_0_0.Puase(arg_59_0)
	arg_59_0:_Pause()
	arg_59_0:OnPuase()
end

function var_0_0.ResumeForSilent(arg_60_0)
	if arg_60_0:IsLoaded() then
		arg_60_0:_Resume()
	end
end

function var_0_0._Resume(arg_61_0)
	arg_61_0.isPuase = false

	arg_61_0:TriggerNextEventAuto()
end

function var_0_0.Resume(arg_62_0)
	arg_62_0:_Resume()
	arg_62_0:OnResume()
end

function var_0_0.updateShip(arg_63_0, arg_63_1)
	if arg_63_1 and arg_63_0.ship.id == arg_63_1.id then
		arg_63_0.ship = arg_63_1
	end

	arg_63_0:OnUpdateShip(arg_63_1)
end

function var_0_0.OnUpdateShip(arg_64_0, arg_64_1)
	return
end

function var_0_0.Dispose(arg_65_0)
	arg_65_0:disposeEvent()

	arg_65_0.isExited = true

	pg.DelegateInfo.Dispose(arg_65_0)

	if arg_65_0.state == var_0_3 then
		arg_65_0:UnLoad()
	end

	arg_65_0.cvLoader:Dispose()

	arg_65_0.cvLoader = nil
	arg_65_0.triggerWhenLoaded = false

	arg_65_0:RemoveTimer()
	arg_65_0:RemoveMoveTimer()
	arg_65_0:RemoveChatTimer()
end

function var_0_0.OnLoad(arg_66_0, arg_66_1)
	arg_66_1()
end

function var_0_0.OnUnload(arg_67_0)
	return
end

function var_0_0.OnClick(arg_68_0)
	return
end

function var_0_0.OnLongPress(arg_69_0)
	return
end

function var_0_0.OnTriggerEvent(arg_70_0)
	return
end

function var_0_0.OnTriggerEventAuto(arg_71_0)
	return
end

function var_0_0.OnDisplayWorld(arg_72_0, arg_72_1)
	return
end

function var_0_0.OnFold(arg_73_0, arg_73_1)
	return
end

function var_0_0.OnEnableOrDisableDragAndZoom(arg_74_0, arg_74_1)
	return
end

function var_0_0.OnPuase(arg_75_0)
	return
end

function var_0_0.OnResume(arg_76_0)
	return
end

return var_0_0
