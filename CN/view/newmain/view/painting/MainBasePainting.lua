local var_0_0 = class("MainBasePainting")
local var_0_1 = 1
local var_0_2 = 2
local var_0_3 = 3
local var_0_4 = 4
local var_0_5

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	pg.DelegateInfo.New(arg_1_0)

	arg_1_0.container = arg_1_1
	arg_1_0.chatTf = arg_1_2
	arg_1_0.chatText = arg_1_2:Find("Text")
	arg_1_0.chatTextBg = arg_1_2:Find("chatbgtop")
	arg_1_0.initChatBgH = arg_1_0.chatTextBg.sizeDelta.y
	arg_1_0.state = var_0_1
	var_0_5 = pg.AssistantInfo
	arg_1_0.cvLoader = MainCVLoader.New()
	arg_1_0.longPressEvent = arg_1_1:GetComponent("UILongPressTrigger").onLongPressed
end

function var_0_0.GetCenterPos(arg_2_0)
	local var_2_0 = arg_2_0.container

	return (arg_2_0.chatTf.parent:InverseTransformPoint(var_2_0.position))
end

function var_0_0.IsLoading(arg_3_0)
	return arg_3_0.state == var_0_2
end

function var_0_0.IsLoaded(arg_4_0)
	return arg_4_0.state == var_0_3
end

function var_0_0.Load(arg_5_0, arg_5_1)
	arg_5_0.isPuase = false
	arg_5_0.isExited = false
	arg_5_0.state = var_0_2
	arg_5_0.ship = arg_5_1
	arg_5_0.paintingName = arg_5_1:getPainting()

	arg_5_0:OnLoad(function()
		arg_5_0.state = var_0_3

		if arg_5_0.triggerWhenLoaded then
			arg_5_0:TriggerEventAtFirstTime()
		end

		arg_5_0:InitClickEvent()
	end)
end

function var_0_0.Unload(arg_7_0)
	arg_7_0.state = var_0_4

	removeOnButton(arg_7_0.container)
	arg_7_0.longPressEvent:RemoveAllListeners()
	arg_7_0:StopChatAnimtion()
	arg_7_0.cvLoader:Stop()
	arg_7_0:RemoveTimer()
	arg_7_0:OnUnload()

	arg_7_0.paintingName = nil
end

function var_0_0.UnloadOnlyPainting(arg_8_0)
	arg_8_0.state = var_0_4

	removeOnButton(arg_8_0.container)
	arg_8_0.longPressEvent:RemoveAllListeners()
	arg_8_0:RemoveTimer()
	arg_8_0:OnUnload()

	arg_8_0.paintingName = nil
end

function var_0_0.InitClickEvent(arg_9_0)
	onButton(arg_9_0, arg_9_0.container, function()
		arg_9_0:OnClick()
		arg_9_0:TriggerPersonalTask(arg_9_0.ship.groupId)
	end)
	arg_9_0.longPressEvent:RemoveAllListeners()
	arg_9_0.longPressEvent:AddListener(function()
		if getProxy(ContextProxy):getCurrentContext().viewComponent.__cname == "NewMainScene" then
			arg_9_0:OnLongPress()
		end
	end)
end

function var_0_0.TriggerPersonalTask(arg_12_0, arg_12_1)
	if arg_12_0.isFoldState then
		return
	end

	arg_12_0:TriggerInterActionTask()

	local var_12_0 = getProxy(TaskProxy)

	for iter_12_0, iter_12_1 in ipairs(pg.task_data_trigger.all) do
		local var_12_1 = pg.task_data_trigger[iter_12_1]

		if var_12_1.group_id == arg_12_1 then
			local var_12_2 = var_12_1.task_id

			if not var_12_0:getFinishTaskById(var_12_2) then
				arg_12_0:CheckStoryDownload(var_12_2, function()
					pg.m02:sendNotification(GAME.TRIGGER_TASK, var_12_2)
				end)

				break
			end
		end
	end
end

function var_0_0.TriggerInterActionTask(arg_14_0)
	local var_14_0 = getProxy(TaskProxy):GetFlagShipInterActionTaskList()

	if var_14_0 and #var_14_0 > 0 then
		for iter_14_0, iter_14_1 in ipairs(var_14_0) do
			pg.m02:sendNotification(GAME.UPDATE_TASK_PROGRESS, {
				taskId = iter_14_1.id
			})
		end
	end
end

function var_0_0.CheckStoryDownload(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = {}
	local var_15_1 = arg_15_1

	while true do
		local var_15_2 = pg.task_data_template[var_15_1]

		if var_15_2.story_id ~= "" then
			table.insert(var_15_0, var_15_2.story_id)
		end

		if var_15_2.next_task == "" or var_15_2.next_task == "0" then
			break
		end

		var_15_1 = var_15_1 + 1
	end

	local var_15_3 = pg.NewStoryMgr.GetInstance():GetStoryPaintingsByNameList(var_15_0)
	local var_15_4 = _.map(var_15_3, function(arg_16_0)
		return "painting/" .. arg_16_0
	end)

	PaintingGroupConst.PaintingDownload({
		isShowBox = true,
		paintingNameList = var_15_4,
		finishFunc = arg_15_2
	})
end

function var_0_0.TriggerEventAtFirstTime(arg_17_0)
	if not arg_17_0:IsLoaded() then
		arg_17_0.triggerWhenLoaded = true

		return
	end

	arg_17_0.triggerWhenLoaded = false

	arg_17_0:OnFirstTimeTriggerEvent()
end

function var_0_0.OnFirstTimeTriggerEvent(arg_18_0)
	local function var_18_0(arg_19_0)
		arg_18_0:_TriggerEvent(arg_19_0)
	end

	if getProxy(PlayerProxy):getFlag("login") then
		getProxy(PlayerProxy):setFlag("login", nil)
		var_18_0("event_login")
	elseif getProxy(PlayerProxy):getFlag("battle") then
		getProxy(PlayerProxy):setFlag("battle", nil)
		var_18_0("home")
	else
		arg_18_0:TriggerNextEventAuto()
	end
end

function var_0_0._TriggerEvent(arg_20_0, arg_20_1)
	local var_20_0 = var_0_5.assistantEvents[arg_20_1]

	if var_20_0.dialog ~= "" then
		arg_20_0:DisplayWord(var_20_0.dialog)
	else
		arg_20_0:TriggerNextEventAuto()
	end
end

function var_0_0.TriggerEvent(arg_21_0, arg_21_1)
	if arg_21_0.isDragAndZoomState then
		return
	end

	if arg_21_0.chatting then
		return
	end

	arg_21_0:RemoveTimer()
	arg_21_0:_TriggerEvent(arg_21_1)
	arg_21_0:OnTriggerEvent()
end

function var_0_0.TriggerNextEventAuto(arg_22_0)
	if arg_22_0.isPuase or arg_22_0.isExited then
		return
	end

	arg_22_0:OnEndChatting()
	arg_22_0:RemoveTimer()

	arg_22_0.timer = Timer.New(function()
		local var_23_0 = arg_22_0:CollectIdleEvents(arg_22_0.lastChatEvent)

		arg_22_0.lastChatEvent = var_23_0[math.ceil(math.random(#var_23_0))]

		arg_22_0:_TriggerEvent(arg_22_0.lastChatEvent)
		arg_22_0:OnTriggerEventAuto()
		arg_22_0:RemoveTimer()
	end, 30, 1, true)

	arg_22_0.timer:Start()
end

function var_0_0.OnStartChatting(arg_24_0)
	arg_24_0.chatting = true
end

function var_0_0.OnEndChatting(arg_25_0)
	arg_25_0.chatting = false
end

function var_0_0.GetWordAndCv(arg_26_0, arg_26_1, arg_26_2)
	local var_26_0, var_26_1, var_26_2, var_26_3, var_26_4, var_26_5 = ShipWordHelper.GetCvDataForShip(arg_26_0.ship, arg_26_2)

	return var_26_0, var_26_1, var_26_2, var_26_3, var_26_4, var_26_5
end

function var_0_0.DisplayWord(arg_27_0, arg_27_1)
	arg_27_0:OnStartChatting()

	local var_27_0, var_27_1, var_27_2, var_27_3, var_27_4, var_27_5 = arg_27_0:GetWordAndCv(arg_27_0.ship, arg_27_1)

	if not var_27_2 or var_27_2 == nil or var_27_2 == "" or var_27_2 == "nil" then
		arg_27_0:OnEndChatting()

		return
	end

	if PLATFORM_CODE == PLATFORM_US then
		setTextEN(arg_27_0.chatText, var_27_2)
	else
		setText(arg_27_0.chatText, SwitchSpecialChar(var_27_2))
	end

	arg_27_0:AdjustChatPosition()
	arg_27_0:OnDisplayWorld(arg_27_1)
	arg_27_0:RegisterChatSkipAction(arg_27_1)
	arg_27_0:PlayCvAndAnimation(var_27_4, var_27_3, var_27_1)
end

function var_0_0.RegisterChatSkipAction(arg_28_0, arg_28_1)
	removeOnButton(arg_28_0.chatTf)
	onButton(arg_28_0, arg_28_0.chatTf, function()
		if arg_28_1 == "mission_complete" or arg_28_1 == "mission" then
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.TASK)
		elseif arg_28_1 == "collection" then
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.EVENT)
		elseif arg_28_1 == "event_complete" then
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.EVENT)
		end
	end)
end

function var_0_0.PlayCvAndAnimation(arg_30_0, arg_30_1, arg_30_2, arg_30_3)
	if getProxy(ContextProxy):getContextByMediator(NewShipMediator) then
		arg_30_0:OnEndChatting()

		return
	end

	local var_30_0 = -1

	seriesAsync({
		function(arg_31_0)
			if not arg_30_3 or not not pg.NewStoryMgr.GetInstance():IsRunning() then
				arg_31_0()

				return
			end

			arg_30_0:PlayCV(arg_30_1, arg_30_2, arg_30_3, function(arg_32_0)
				var_30_0 = arg_32_0

				arg_31_0()
			end)
		end,
		function(arg_33_0)
			arg_30_0:StartChatAnimtion(var_30_0, arg_33_0)
		end
	}, function()
		arg_30_0:OnDisplayWordEnd()
	end)
end

function var_0_0.OnDisplayWordEnd(arg_35_0)
	arg_35_0:TriggerNextEventAuto()
end

function var_0_0.PlayCV(arg_36_0, arg_36_1, arg_36_2, arg_36_3, arg_36_4)
	local var_36_0 = ShipWordHelper.RawGetCVKey(arg_36_0.ship.skinId)
	local var_36_1 = pg.CriMgr.GetCVBankName(var_36_0)

	arg_36_0.cvLoader:Load(var_36_1, arg_36_3, 0, arg_36_4)
end

function var_0_0.AdjustChatPosition(arg_37_0)
	local var_37_0 = arg_37_0.chatText:GetComponent(typeof(Text))

	if #var_37_0.text > CHAT_POP_STR_LEN then
		var_37_0.alignment = TextAnchor.MiddleLeft
	else
		var_37_0.alignment = TextAnchor.MiddleCenter
	end

	local var_37_1 = var_37_0.preferredHeight + 26

	if var_37_1 > arg_37_0.initChatBgH then
		arg_37_0.chatTextBg.sizeDelta = Vector2.New(arg_37_0.chatTextBg.sizeDelta.x, var_37_1)
	else
		arg_37_0.chatTextBg.sizeDelta = Vector2.New(arg_37_0.chatTextBg.sizeDelta.x, arg_37_0.initChatBgH)
	end

	if arg_37_0.isFoldState then
		local var_37_2 = arg_37_0:GetCenterPos()

		arg_37_0.chatTf.localPosition = Vector3(var_37_2.x, -190, 0)
	end
end

function var_0_0.StartChatAnimtion(arg_38_0, arg_38_1, arg_38_2)
	local var_38_0 = getProxy(SettingsProxy):ShouldShipMainSceneWord() and 1 or 0
	local var_38_1 = 0.3
	local var_38_2 = arg_38_1 > 0 and arg_38_1 or 3

	LeanTween.scale(rtf(arg_38_0.chatTf.gameObject), Vector3.New(var_38_0, var_38_0, 1), var_38_1):setEase(LeanTweenType.easeOutBack):setOnComplete(System.Action(function()
		LeanTween.scale(rtf(arg_38_0.chatTf.gameObject), Vector3.New(0, 0, 1), var_38_1):setEase(LeanTweenType.easeInBack):setDelay(var_38_1 + var_38_2):setOnComplete(System.Action(arg_38_2))
	end))
end

function var_0_0.StopChatAnimtion(arg_40_0)
	if LeanTween.isTweening(arg_40_0.chatTf.gameObject) then
		LeanTween.cancel(arg_40_0.chatTf.gameObject)
	end

	arg_40_0.chatTf.localScale = Vector3.zero

	arg_40_0:OnEndChatting()
end

function var_0_0.OnStopVoice(arg_41_0)
	arg_41_0.cvLoader:Stop()
end

function var_0_0.CollectIdleEvents(arg_42_0, arg_42_1)
	local var_42_0 = {}

	if getProxy(EventProxy):hasFinishState() and arg_42_1 ~= "event_complete" then
		table.insert(var_42_0, "event_complete")
	else
		if getProxy(TaskProxy):getCanReceiveCount() > 0 and arg_42_1 ~= "mission_complete" then
			table.insert(var_42_0, "mission_complete")
		end

		if getProxy(MailProxy):GetAttachmentCount() > 0 and arg_42_1 ~= "mail" then
			table.insert(var_42_0, "mail")
		end

		if #var_42_0 == 0 then
			local var_42_1 = arg_42_0.ship:getCVIntimacy()

			var_42_0 = var_0_5.filterAssistantEvents(Clone(var_0_5.IdleEvents), arg_42_0.ship.skinId, var_42_1)

			if getProxy(TaskProxy):getNotFinishCount() and getProxy(TaskProxy):getNotFinishCount() > 0 and arg_42_1 ~= "mission" then
				table.insert(var_42_0, "mission")
			end
		end
	end

	return var_42_0
end

function var_0_0.CollectTouchEvents(arg_43_0)
	local var_43_0 = arg_43_0.ship:getCVIntimacy()

	return (var_0_5.filterAssistantEvents(var_0_5.PaintingTouchEvents, arg_43_0.ship.skinId, var_43_0))
end

function var_0_0.GetTouchEvent(arg_44_0, arg_44_1)
	return (var_0_5.filterAssistantEvents(var_0_5.getAssistantTouchEvents(arg_44_1, arg_44_0.ship.skinId), arg_44_0.ship.skinId, 0))
end

function var_0_0.GetIdleEvents(arg_45_0)
	return (var_0_5.filterAssistantEvents(var_0_5.IdleEvents, arg_45_0.ship.skinId, 0))
end

function var_0_0.GetEventConfig(arg_46_0, arg_46_1)
	return var_0_5.assistantEvents[arg_46_1]
end

function var_0_0.GetSpecialTouchEvent(arg_47_0, arg_47_1)
	return var_0_5.getPaintingTouchEvents(arg_47_1)
end

function var_0_0.RemoveTimer(arg_48_0)
	if arg_48_0.timer then
		arg_48_0.timer:Stop()

		arg_48_0.timer = nil
	end
end

function var_0_0.IsExited(arg_49_0)
	return arg_49_0.isExited
end

function var_0_0.Fold(arg_50_0, arg_50_1, arg_50_2)
	arg_50_0.isFoldState = arg_50_1

	arg_50_0:RemoveMoveTimer()

	if arg_50_1 and arg_50_2 > 0 then
		LeanTween.value(arg_50_0.container.gameObject, 0, 1, arg_50_2):setOnUpdate(System.Action_float(function(arg_51_0)
			local var_51_0 = arg_50_0:GetCenterPos()

			arg_50_0.chatTf.localPosition = Vector3(var_51_0.x, -190, 0)
		end))
	end

	arg_50_0:OnFold(arg_50_1)
end

function var_0_0.RemoveMoveTimer(arg_52_0)
	if arg_52_0.moveTimer then
		arg_52_0.moveTimer:Stop()

		arg_52_0.moveTimer = nil
	end
end

function var_0_0.EnableOrDisableMove(arg_53_0, arg_53_1)
	arg_53_0.isDragAndZoomState = arg_53_1

	arg_53_0:RemoveMoveTimer()

	if arg_53_1 then
		arg_53_0:StopChatAnimtion()
		arg_53_0:RemoveTimer()
		arg_53_0.cvLoader:Stop()
	else
		arg_53_0:TriggerNextEventAuto()
	end

	arg_53_0:OnEnableOrDisableDragAndZoom(arg_53_1)
end

function var_0_0.GetOffset(arg_54_0)
	return 0
end

function var_0_0.IslimitYPos(arg_55_0)
	return false
end

function var_0_0.Puase(arg_56_0)
	arg_56_0.isPuase = true

	arg_56_0:RemoveMoveTimer()
	arg_56_0:StopChatAnimtion()
	arg_56_0:RemoveTimer()
	arg_56_0.cvLoader:Stop()
	arg_56_0:OnPuase()
end

function var_0_0.Resume(arg_57_0)
	arg_57_0.isPuase = false

	arg_57_0:TriggerNextEventAuto()
	arg_57_0:OnResume()
end

function var_0_0.updateShip(arg_58_0, arg_58_1)
	arg_58_0:OnUpdateShip(arg_58_1)
end

function var_0_0.OnUpdateShip(arg_59_0, arg_59_1)
	return
end

function var_0_0.Dispose(arg_60_0)
	arg_60_0.isExited = true

	pg.DelegateInfo.Dispose(arg_60_0)

	if arg_60_0.state == var_0_3 then
		arg_60_0:UnLoad()
	end

	arg_60_0.cvLoader:Dispose()

	arg_60_0.cvLoader = nil
	arg_60_0.triggerWhenLoaded = false

	arg_60_0:RemoveTimer()
	arg_60_0:RemoveMoveTimer()
end

function var_0_0.OnLoad(arg_61_0, arg_61_1)
	arg_61_1()
end

function var_0_0.OnUnload(arg_62_0)
	return
end

function var_0_0.OnClick(arg_63_0)
	return
end

function var_0_0.OnLongPress(arg_64_0)
	return
end

function var_0_0.OnTriggerEvent(arg_65_0)
	return
end

function var_0_0.OnTriggerEventAuto(arg_66_0)
	return
end

function var_0_0.OnDisplayWorld(arg_67_0, arg_67_1)
	return
end

function var_0_0.OnFold(arg_68_0, arg_68_1)
	return
end

function var_0_0.OnEnableOrDisableDragAndZoom(arg_69_0, arg_69_1)
	return
end

function var_0_0.OnPuase(arg_70_0)
	return
end

function var_0_0.OnResume(arg_71_0)
	return
end

return var_0_0
