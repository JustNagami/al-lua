local var_0_0 = class("Dorm3dBaseView", import("view.base.BaseSubView"))

function var_0_0.SetApartment(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.apartment = arg_1_1

	arg_1_0:UpdateFavorDisplay()
	arg_1_0:UpdateContactState()
	arg_1_0:UpdateZoneList()
	arg_1_0:UpdateBtnState()
end

function var_0_0.OnInit(arg_2_0)
	Shader.SetGlobalFloat("_ScreenClipOff", 1)

	arg_2_0.uiContianer = arg_2_0._tf:Find("UI")

	local var_2_0 = arg_2_0.uiContianer:Find("base")

	onButton(arg_2_0, var_2_0:Find("btn_back"), function()
		arg_2_0:emit(BaseUI.ON_BACK)
	end, "ui-dorm_back_v2")
	onButton(arg_2_0, var_2_0:Find("btn_back/help"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.help_dorm3d_info.tip
		})
	end, SFX_PANEL)

	arg_2_0.rtFavorLevel = var_2_0:Find("top/favor_level")

	onButton(arg_2_0, arg_2_0.rtFavorLevel, function()
		local var_5_0 = {}

		arg_2_0:emit(Dorm3dSceneMediator.OPEN_LEVEL_LAYER, {
			baseCamera = arg_2_0.sceneView.mainCameraTF
		})
	end, SFX_PANEL)
	onButton(arg_2_0, var_2_0:Find("left/btn_furniture"), function()
		local var_6_0, var_6_1 = arg_2_0.apartment:checkUnlockConfig(getDorm3dGameset("drom3d_furniture_unlock")[2])

		if not var_6_0 then
			pg.TipsMgr.GetInstance():ShowTips(var_6_1)

			return
		end

		arg_2_0:emit(Dorm3dSceneMediator.OPEN_FURNITURE_SELECT)
	end, SFX_PANEL)
	onButton(arg_2_0, var_2_0:Find("left/btn_photograph"), function()
		local var_7_0, var_7_1 = arg_2_0.apartment:checkUnlockConfig(getDorm3dGameset("drom3d_photograph_unlock")[2])

		if not var_7_0 then
			pg.TipsMgr.GetInstance():ShowTips(var_7_1)

			return
		end

		arg_2_0:emit(Dorm3dSceneMediator.OPEN_CAMERA_LAYER)
	end, SFX_PANEL)
	onButton(arg_2_0, var_2_0:Find("left/btn_collection"), function()
		local var_8_0, var_8_1 = arg_2_0.apartment:checkUnlockConfig(getDorm3dGameset("drom3d_recall_unlock")[2])

		if not var_8_0 then
			pg.TipsMgr.GetInstance():ShowTips(var_8_1)

			return
		end

		arg_2_0:emit(Dorm3dSceneMediator.OPEN_COLLECTION_LAYER)
	end, SFX_PANEL)

	local var_2_1 = arg_2_0.uiContianer:Find("walk")
	local var_2_2 = arg_2_0.uiContianer:Find("ik")

	onButton(arg_2_0, var_2_2:Find("btn_back/help"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("roll_gametip")
		})
	end, SFX_PANEL)

	arg_2_0.ikTipsRoot = var_2_2:Find("Tips")

	setActive(arg_2_0.ikTipsRoot, false)
	GetOrAddComponent(arg_2_0.ikTipsRoot:GetChild(0), typeof(RectTransform))

	arg_2_0.ikHand = var_2_2:Find("Handler")

	setActive(arg_2_0.ikHand, false)
	eachChild(arg_2_0.ikHand, function(arg_10_0)
		setActive(arg_10_0, false)
	end)

	arg_2_0.unlockList = {}
	arg_2_0.rtFavorUp = arg_2_0._tf:Find("Toast/favor_up")

	arg_2_0.rtFavorUp:GetComponent("DftAniEvent"):SetEndEvent(function(arg_11_0)
		setActive(arg_2_0.rtFavorUp, false)

		if #arg_2_0.unlockList > 0 then
			setText(arg_2_0.rtFavorUp:Find("Text"), table.remove(arg_2_0.unlockList, 1))
			setActive(arg_2_0.rtFavorUp, true)
		end
	end)
	setActive(arg_2_0.rtFavorUp, false)

	arg_2_0.rtFavorUpDaily = arg_2_0._tf:Find("Toast/favor_up_daily")

	setActive(arg_2_0.rtFavorUpDaily, false)

	arg_2_0.rtStaminaPop = arg_2_0._tf:Find("Toast/stamina")

	local var_2_3 = arg_2_0.rtStaminaPop:GetComponent("DftAniEvent")

	var_2_3:SetTriggerEvent(function(arg_12_0)
		local var_12_0, var_12_1 = getProxy(ApartmentProxy):getStamina()

		setText(arg_2_0.rtStaminaPop:Find("Text"), string.format("%d/%d", var_12_0, var_12_1))
	end)
	var_2_3:SetEndEvent(function(arg_13_0)
		setActive(arg_2_0.rtStaminaPop, false)
	end)
	setActive(arg_2_0.rtStaminaPop, false)

	arg_2_0.rtLevelUpWindow = arg_2_0._tf:Find("LevelUpWindow")

	setActive(arg_2_0.rtLevelUpWindow, false)
	onButton(arg_2_0, arg_2_0.rtLevelUpWindow:Find("bg"), function()
		if arg_2_0.isLock then
			return
		end

		arg_2_0.isLock = true

		quickPlayAnimation(arg_2_0.rtLevelUpWindow, "anim_dorm3d_levelup_out")
		LeanTween.delayedCall(0.2, System.Action(function()
			arg_2_0.isLock = false

			setActive(arg_2_0.rtLevelUpWindow, false)
			pg.UIMgr.GetInstance():UnOverlayPanel(arg_2_0.rtLevelUpWindow, arg_2_0._tf)
			existCall(arg_2_0.levelUpCallback)
		end))
	end, SFX_PANEL)

	local var_2_4 = arg_2_0.uiContianer:Find("watch")

	onButton(arg_2_0, var_2_4:Find("btn_back"), function()
		arg_2_0:ExitWatchMode()
	end, "ui-dorm_back_v2")
	onButton(arg_2_0, var_2_4:Find("btn_back/help"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("roll_gametip")
		})
	end, SFX_PANEL)

	arg_2_0.rtStaminaDisplay = var_2_4:Find("stamina")
	arg_2_0.rtRole = arg_2_0.uiContianer:Find("watch/Role")

	onButton(arg_2_0, arg_2_0.rtRole:Find("Talk"), function()
		local var_18_0 = arg_2_0.apartment:getFurnitureTalking(arg_2_0:GetZoneName())

		if #var_18_0 == 0 then
			pg.TipsMgr.GetInstance():ShowTips("without topic")

			return
		end

		arg_2_0:DoTalk(var_18_0[math.random(#var_18_0)], function()
			local var_19_0 = getDorm3dGameset("drom3d_favir_trigger_talk")[1]

			arg_2_0:emit(Dorm3dSceneMediator.TRIGGER_FAVOR, arg_2_0.apartment.configId, var_19_0)
		end)
	end, "ui-dorm_click_v2")
	setText(arg_2_0.rtRole:Find("Talk/bg/Text"), i18n("dorm3d_talk"))
	onButton(arg_2_0, arg_2_0.rtRole:Find("Touch"), function()
		local var_20_0, var_20_1 = arg_2_0.apartment:checkUnlockConfig(getDorm3dGameset("drom3d_touch_dialogue")[2])

		if not var_20_0 then
			pg.TipsMgr.GetInstance():ShowTips(var_20_1)

			return
		end

		arg_2_0:EnterTouchMode()
	end, "ui-dorm_click_v2")
	setText(arg_2_0.rtRole:Find("Touch/bg/Text"), i18n("dorm3d_touch"))
	onButton(arg_2_0, arg_2_0.rtRole:Find("Gift"), function()
		local var_21_0, var_21_1 = arg_2_0.apartment:checkUnlockConfig(getDorm3dGameset("drom3d_gift_dialogue")[2])

		if not var_21_0 then
			pg.TipsMgr.GetInstance():ShowTips(var_21_1)

			return
		end

		arg_2_0:emit(Dorm3dScene.SHOW_BLOCK)
		parallelAsync({
			function(arg_22_0)
				arg_2_0:emit(Dorm3dSceneMediator.OPEN_GIFT_LAYER, {
					baseCamera = arg_2_0.sceneView.mainCameraTF
				}, arg_22_0)
			end,
			function(arg_23_0)
				arg_2_0.sceneView:ActiveStateCamera("gift", arg_23_0)
			end
		}, function()
			arg_2_0:emit(Dorm3dScene.HIDE_BLOCK)
		end)
	end, "ui-dorm_click_v2")
	setText(arg_2_0.rtRole:Find("Gift/bg/Text"), i18n("dorm3d_gift"))
	onButton(arg_2_0, arg_2_0.rtRole:Find("Performance"), function()
		arg_2_0:PerformanceQueue("DormLvPerformance02", function()
			pg.TipsMgr.GetInstance():ShowTips("Success!")
		end)
	end, "ui-dorm_click_v2")

	arg_2_0.rtFloatPage = arg_2_0._tf:Find("FloatPage")
	arg_2_0.tplFloat = arg_2_0.rtFloatPage:Find("tpl")

	setActive(arg_2_0.tplFloat, false)

	local var_2_5 = cloneTplTo(arg_2_0.tplFloat, arg_2_0.rtFloatPage, "lady")

	eachChild(var_2_5, function(arg_27_0)
		setActive(arg_27_0, arg_27_0.name == "walk")
	end)

	arg_2_0._joystick = arg_2_0._tf:Find("Stick")

	setActive(arg_2_0._joystick, false)
	arg_2_0._joystick:GetComponent(typeof(SlideController)):SetStickFunc(function(arg_28_0)
		arg_2_0:emit(Dorm3dScene.ON_STICK_MOVE, arg_28_0)
	end)

	arg_2_0.povLayer = arg_2_0._tf:Find("POVControl")

	setActive(arg_2_0.povLayer, false)
	;(function()
		local var_29_0 = arg_2_0.povLayer:Find("Move"):GetComponent(typeof(SlideController))

		var_29_0:AddBeginDragFunc(function(arg_30_0, arg_30_1)
			arg_2_0:emit(Dorm3dScene.ON_POV_STICK_MOVE_BEGIN, arg_30_1)
		end)
		var_29_0:SetStickFunc(function(arg_31_0)
			arg_2_0:emit(Dorm3dScene.ON_POV_STICK_MOVE, arg_31_0)
		end)
		var_29_0:AddDragEndFunc(function(arg_32_0, arg_32_1)
			arg_2_0:emit(Dorm3dScene.ON_POV_STICK_MOVE_END, arg_32_1)
		end)
		arg_2_0.povLayer:Find("View"):GetComponent(typeof(SlideController)):SetStickFunc(function(arg_33_0)
			arg_2_0:emit(Dorm3dScene.ON_POV_STICK_VIEW, arg_33_0)
		end)
	end)()

	arg_2_0.rtExtraScreen = arg_2_0._tf:Find("ExtraScreen")
	arg_2_0.rtTouchGamePanel = arg_2_0.rtExtraScreen:Find("TouchGame")
	arg_2_0.uiStack = {}
	arg_2_0.cvLoader = ShipProfileCVLoader.New()

	setActive(var_2_0:Find("right/Zone/List"), false)
end

function var_0_0.initNodeCanvas(arg_34_0, arg_34_1)
	arg_34_0.rtMainAI = arg_34_1

	local var_34_0 = pg.NodeCanvasMgr.GetInstance()

	var_34_0:SetOwner(arg_34_0.rtMainAI)

	for iter_34_0, iter_34_1 in ipairs(arg_34_0.contextData.blackboard or {
		inTalking = false,
		inWatchMode = false
	}) do
		arg_34_0:SetBlackboardValue(iter_34_0, iter_34_1)
	end

	var_34_0:RegisterFunc("ClickCharacter", function(arg_35_0)
		if arg_34_0.uiState ~= "base" then
			return
		end

		if not arg_34_0:GetBlackboardValue("inWatchMode") and arg_34_0.nowCanWatchState then
			arg_34_0:OutOfLazy(function()
				arg_34_0:EnterWatchMode()
			end)
			pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_touch_v1")
		end
	end)
	var_34_0:RegisterFunc("MoveFurniture", function(arg_37_0)
		if arg_34_0.uiState ~= "base" or arg_34_0.sceneView:GetAttachedFurnitureName() == arg_37_0.name then
			return
		end

		arg_34_0:OutOfLazy(function()
			arg_34_0:SetBlackboardValue("inMoving", true)
			arg_34_0:emit(Dorm3dScene.MOVE_PLAYER_TO_FURNITURE, arg_37_0.name, function()
				arg_34_0:SetBlackboardValue("inMoving", false)
			end)
		end)
	end)
	var_34_0:RegisterFunc("ClickCharacterInWatch", function()
		arg_34_0:OutOfLazy(function()
			arg_34_0:emit(Dorm3dScene.WATCH_MODE_INTERACTIVE)
		end)
		pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_touch_v1")
	end)
	var_34_0:RegisterFunc("ClickContact", function(arg_42_0)
		arg_34_0:TriggerContact(tonumber(arg_42_0))
	end)
	var_34_0:RegisterFunc("ShortWaitAction", function()
		arg_34_0:DoShortWait()
	end)
	var_34_0:RegisterFunc("LongWaitAction", function()
		arg_34_0:DoLongWait()
	end)
	var_34_0:RegisterFunc("DistanceTrigger", function()
		if arg_34_0:GetBlackboardValue("inWalk") then
			existCall(arg_34_0.walkNearCallback, arg_34_0.sceneView.dis)
		elseif arg_34_0.uiState == "base" then
			arg_34_0:CheckDistanceTalk(arg_34_0.sceneView.dis)
		end
	end)
	var_34_0:RegisterFunc("ChangeWatch", function()
		local var_46_0 = arg_34_0:ChangeCanWatchState()

		if not arg_34_0.contextData.hasFirstCheck then
			arg_34_0.contextData.hasFirstCheck = true

			if arg_34_0:CheckFirstEnter(function(arg_47_0)
				if pg.dorm3d_dialogue_group[arg_47_0].extend_loading > 0 then
					pg.SceneAnimMgr.GetInstance():RegisterDormNextCall(function()
						arg_34_0:FinishEnterResume()
					end)
				else
					arg_34_0:FinishEnterResume()
				end
			end) then
				arg_34_0.contextData.hasEnterCheck = true

				return
			end

			arg_34_0:FinishEnterResume()
		end

		if not var_46_0 or arg_34_0:CheckLevelUp() then
			-- block empty
		else
			arg_34_0:CheckQueue()
		end
	end)
end

function var_0_0.BindEvent(arg_49_0)
	arg_49_0:bind(Dorm3dScene.ON_IK_STATUS_CHANGED, function(arg_50_0, arg_50_1, arg_50_2)
		if not arg_49_0:GetBlackboardValue("inTouching") then
			return
		end

		arg_49_0:DoTouch(arg_50_1, arg_50_2)
	end)
	arg_49_0:bind(Dorm3dScene.ON_ENTER_SECTOR, function(arg_51_0, arg_51_1)
		if not arg_49_0.contextData.hasEnterCheck then
			return
		end

		arg_49_0:ChangeCanWatchState()
	end)
end

function var_0_0.TreeStart(arg_52_0)
	SetCompomentEnabled(arg_52_0.rtMainAI, "BehaviourTreeOwner", true)
	arg_52_0:SetUI("base")
end

function var_0_0.FinishEnterResume(arg_53_0)
	if not arg_53_0.contextData.resumeCallback then
		return
	end

	existCall(arg_53_0.contextData.resumeCallback)

	arg_53_0.contextData.resumeCallback = nil
end

function var_0_0.SetBlackboardValue(arg_54_0, arg_54_1, arg_54_2)
	arg_54_0.contextData.blackboard = arg_54_0.contextData.blackboard or {}
	arg_54_0.contextData.blackboard[arg_54_1] = arg_54_2

	pg.NodeCanvasMgr.GetInstance():SetBlackboradValue(arg_54_1, arg_54_2)
end

function var_0_0.GetBlackboardValue(arg_55_0, arg_55_1)
	arg_55_0.contextData.blackboard = arg_55_0.contextData.blackboard or {}

	return arg_55_0.contextData.blackboard[arg_55_1]
end

function var_0_0.SendNodeCanvasEvent(arg_56_0, arg_56_1, arg_56_2)
	pg.NodeCanvasMgr.GetInstance():SendEvent(arg_56_1, arg_56_2)
end

function var_0_0.EnableJoystick(arg_57_0, arg_57_1)
	setActive(arg_57_0._joystick, arg_57_1)
end

function var_0_0.EnablePOVLayer(arg_58_0, arg_58_1)
	setActive(arg_58_0.povLayer, arg_58_1)

	if not arg_58_1 then
		arg_58_0:emit(Dorm3dScene.ON_POV_STICK_MOVE_END)
	end
end

function var_0_0.SetUI(arg_59_0, ...)
	for iter_59_0, iter_59_1 in ipairs({
		...
	}) do
		if iter_59_1 == "back" then
			assert(#arg_59_0.uiStack > 0)

			arg_59_0.uiState = table.remove(arg_59_0.uiStack)
		elseif iter_59_1 == arg_59_0.uiState and iter_59_1 == "ik" then
			-- block empty
		else
			table.insert(arg_59_0.uiStack, arg_59_0.uiState)

			arg_59_0.uiState = iter_59_1
		end
	end

	warning(arg_59_0.uiState, " / ", ...)
	eachChild(arg_59_0.uiContianer, function(arg_60_0)
		setActive(arg_60_0, arg_60_0.name == arg_59_0.uiState)
	end)
	arg_59_0:EnablePOVLayer(arg_59_0.uiState == "base" or arg_59_0.uiState == "walk")
	arg_59_0.sceneView:TempHideContact(arg_59_0.uiState ~= "base")
	arg_59_0.sceneView:SetFloatEnable(arg_59_0.uiState == "walk")
	setActive(arg_59_0.rtFloatPage, arg_59_0.uiState == "walk")
	switch(arg_59_0.uiState, {
		base = function()
			if not arg_59_0.apartment then
				return
			end

			arg_59_0:UpdateBtnState()
		end,
		watch = function()
			eachChild(arg_59_0.rtRole, function(arg_63_0)
				setActive(arg_63_0, false)
			end)

			local var_62_0 = underscore.filter({
				"Talk",
				"Touch",
				"Gift",
				"Performance"
			}, function(arg_64_0)
				return switch(arg_64_0, {
					Talk = function()
						return true
					end,
					Performance = function()
						return IsUnityEditor
					end
				}, function()
					return arg_59_0.apartment:checkUnlockConfig(getDorm3dGameset(string.format("drom3d_%s_dialogue", string.lower(arg_64_0)))[2])
				end)
			end)
			local var_62_1 = 0.05

			for iter_62_0, iter_62_1 in ipairs(var_62_0) do
				LeanTween.delayedCall(var_62_1, System.Action(function()
					setActive(arg_59_0.rtRole:Find(iter_62_1), true)
				end))

				var_62_1 = var_62_1 + 0.066
			end

			setActive(arg_59_0.rtRole:Find("Gift/bg/Tip"), Dorm3dGift.NeedViewTip(arg_59_0.apartment.configIds))
		end,
		walk = function()
			setText(arg_59_0.uiContianer:Find("walk/dialogue/content"), i18n("dorm3d_removable", arg_59_0.apartment:getConfig("name")))
		end
	})
	arg_59_0.sceneView:ActiveStateCamera(arg_59_0.uiState, function()
		if arg_59_0.uiSetCallback then
			(function()
				local var_71_0 = arg_59_0.uiSetCallback

				arg_59_0.uiSetCallback = nil

				return var_71_0()
			end)()
		end
	end)
end

function var_0_0.EnterWatchMode(arg_72_0)
	seriesAsync({
		function(arg_73_0)
			arg_72_0:emit(Dorm3dScene.SHOW_BLOCK)
			arg_72_0:SetBlackboardValue("inWatchMode", true)

			arg_72_0.uiSetCallback = arg_73_0

			arg_72_0:SetUI("watch")
		end,
		function(arg_74_0)
			arg_72_0:emit(Dorm3dScene.HIDE_BLOCK)
		end
	})
end

function var_0_0.ExitWatchMode(arg_75_0)
	seriesAsync({
		function(arg_76_0)
			arg_75_0:emit(Dorm3dScene.SHOW_BLOCK)

			arg_75_0.uiSetCallback = arg_76_0

			arg_75_0:SetUI("back")
		end,
		function(arg_77_0)
			arg_75_0:SetBlackboardValue("inWatchMode", false)
			arg_75_0:emit(Dorm3dScene.HIDE_BLOCK)
		end
	})
end

function var_0_0.EnterTouchMode(arg_78_0)
	if arg_78_0:GetBlackboardValue("inTouching") then
		return
	end

	arg_78_0.touchConfig = arg_78_0.apartment:getTouchConfig(arg_78_0:GetZoneName())
	arg_78_0.inTouchGame = arg_78_0.touchConfig.heartbeat_enable > 0

	setActive(arg_78_0.rtTouchGamePanel, arg_78_0.inTouchGame)

	if arg_78_0.inTouchGame then
		arg_78_0.touchCount = 0
		arg_78_0.lastCount = 0
		arg_78_0.topCount = 0

		arg_78_0:UpdateTouchGameDisplay()
		setSlider(arg_78_0.rtTouchGamePanel:Find("slider"), 0, 100, arg_78_0.touchCount >= 500 and 100 or arg_78_0.touchCount % 100)
		quickPlayAnimation(arg_78_0.rtTouchGamePanel, "anim_dorm3d_touch_in")
		quickPlayAnimation(arg_78_0.rtTouchGamePanel:Find("slider/icon"), "anim_dorm3d_touch_icon")

		arg_78_0.downTimer = Timer.New(function()
			if not arg_78_0:GetBlackboardValue("inTalking") then
				arg_78_0:UpdateTouchCount(-2)
			end
		end, 1, -1)

		arg_78_0.downTimer:Start()
	end

	local var_78_0 = {}

	table.insert(var_78_0, function(arg_80_0)
		arg_78_0:SetBlackboardValue("inTouching", true)
		arg_78_0:emit(Dorm3dScene.SHOW_BLOCK)

		arg_78_0.uiSetCallback = arg_80_0

		arg_78_0:SetUI("blank")
	end)
	table.insert(var_78_0, function(arg_81_0)
		arg_78_0.ikConfig = pg.dorm3d_ik_status[arg_78_0.touchConfig.ik_status]

		setActive(arg_78_0.uiContianer:Find("ik/btn_back"), true)
		arg_78_0:SetIKState(true, arg_81_0)
	end)
	seriesAsync(var_78_0, function()
		Shader.SetGlobalFloat("_ScreenClipOff", 0)
		arg_78_0:emit(Dorm3dScene.HIDE_BLOCK)
	end)
end

function var_0_0.ExitTouchMode(arg_83_0)
	if not arg_83_0:GetBlackboardValue("inTouching") then
		return
	end

	local var_83_0 = {}

	if arg_83_0.inTouchGame then
		table.insert(var_83_0, function(arg_84_0)
			arg_83_0:emit(Dorm3dScene.SHOW_BLOCK)
			quickPlayAnimation(arg_83_0.rtTouchGamePanel, "anim_dorm3d_touch_out")
			onDelayTick(arg_84_0, 0.5)
		end)
		table.insert(var_83_0, function(arg_85_0)
			local var_85_0 = 0

			for iter_85_0, iter_85_1 in ipairs(arg_83_0.touchConfig.heartbeat_favor) do
				if iter_85_1[1] > arg_83_0.topCount then
					break
				else
					var_85_0 = iter_85_1[2]
				end
			end

			if var_85_0 > 0 then
				arg_83_0:emit(Dorm3dSceneMediator.TRIGGER_FAVOR, arg_83_0.apartment.configId, var_85_0)
			end

			arg_83_0.touchCount = nil
			arg_83_0.topCount = nil

			if arg_83_0.downTimer then
				arg_83_0.downTimer:Stop()

				arg_83_0.downTimer = nil
			end

			arg_83_0.inTouchGame = false

			setActive(arg_83_0.rtTouchGamePanel, false)
			Shader.SetGlobalFloat("_ScreenClipOff", 1)
			arg_85_0()
		end)
	else
		table.insert(var_83_0, function(arg_86_0)
			arg_83_0:emit(Dorm3dScene.SHOW_BLOCK)
			Shader.SetGlobalFloat("_ScreenClipOff", 1)
			arg_86_0()
		end)
	end

	table.insert(var_83_0, function(arg_87_0)
		arg_83_0.ikConfig = {
			character_position = arg_83_0:GetZoneName(),
			character_action = arg_83_0.touchConfig.finish_action
		}

		arg_83_0:SetIKState(false, arg_87_0)
	end)
	table.insert(var_83_0, function(arg_88_0)
		arg_83_0.uiSetCallback = arg_88_0

		arg_83_0:SetUI("back")
	end)
	seriesAsync(var_83_0, function()
		arg_83_0:SetBlackboardValue("inTouching", false)
		arg_83_0:emit(Dorm3dScene.HIDE_BLOCK)

		arg_83_0.touchConfig = nil
		arg_83_0.sceneView.blockIK = nil

		local var_89_0 = arg_83_0.touchExitCall

		arg_83_0.touchExitCall = nil

		existCall(var_89_0)
	end)
end

function var_0_0.ChangeWalkScene(arg_90_0, arg_90_1, arg_90_2)
	seriesAsync({
		function(arg_91_0)
			arg_90_0.sceneView:ChangeArtScene(arg_90_1, arg_91_0)
		end,
		function(arg_92_0)
			arg_90_0.sceneView:ChangeSubScene(arg_90_1, arg_92_0)
		end,
		function(arg_93_0)
			arg_90_0:emit(Dorm3dScene.SHOW_BLOCK)

			if arg_90_1 == arg_90_0.sceneView.sceneInfo then
				arg_90_0.uiSetCallback = arg_93_0

				arg_90_0:SetUI("back")
			elseif arg_90_0.uiState ~= "walk" then
				arg_90_0.uiSetCallback = arg_93_0

				arg_90_0:SetUI("walk")
			else
				arg_93_0()
			end
		end
	}, function()
		arg_90_0:emit(Dorm3dScene.HIDE_BLOCK)
		arg_90_0:SetBlackboardValue("inWalk", arg_90_1 ~= arg_90_0.sceneView.sceneInfo)
		existCall(arg_90_2)
	end)
end

function var_0_0.EnterWalkMode(arg_95_0)
	seriesAsync({
		function(arg_96_0)
			arg_95_0:emit(Dorm3dScene.SHOW_BLOCK)
			arg_95_0:SetBlackboardValue("inWalk", true)

			arg_95_0.uiSetCallback = arg_96_0

			arg_95_0:SetUI("walk")
		end,
		function(arg_97_0)
			arg_95_0:emit(Dorm3dScene.HIDE_BLOCK)
			arg_95_0.sceneView:ChangeArtScene(arg_95_0.walkInfo.scene .. "|" .. arg_95_0.walkInfo.sceneRoot, arg_97_0)
		end,
		function(arg_98_0)
			arg_95_0.sceneView:LoadSubScene(arg_95_0.walkInfo, arg_98_0)
		end
	}, function()
		return
	end)
end

function var_0_0.ExitWalkMode(arg_100_0)
	seriesAsync({
		function(arg_101_0)
			arg_100_0.sceneView:ChangeArtScene(arg_100_0.walkLastSceneInfo, arg_101_0)
		end,
		function(arg_102_0)
			arg_100_0.sceneView:UnloadSubScene(arg_100_0.walkInfo, arg_102_0)
		end,
		function(arg_103_0)
			arg_100_0:emit(Dorm3dScene.SHOW_BLOCK)

			arg_100_0.uiSetCallback = arg_103_0

			arg_100_0:SetUI("back")
		end
	}, function()
		arg_100_0:emit(Dorm3dScene.HIDE_BLOCK)
		arg_100_0:SetBlackboardValue("inWalk", false)

		local var_104_0 = arg_100_0.walkExitCall

		arg_100_0.walkExitCall = nil
		arg_100_0.walkLastSceneInfo = nil
		arg_100_0.walkInfo = nil

		existCall(var_104_0)
	end)
end

function var_0_0.SetIKState(arg_105_0, arg_105_1, arg_105_2)
	local var_105_0 = {}

	if arg_105_1 then
		table.insert(var_105_0, function(arg_106_0)
			arg_105_0:SetBlackboardValue("inIK", true)
			arg_105_0:emit(Dorm3dScene.SHOW_BLOCK)
			arg_106_0()
		end)
		table.insert(var_105_0, function(arg_107_0)
			arg_105_0.sceneView:SetIKStatus(arg_105_0.ikConfig, arg_107_0)
		end)

		if arg_105_0.uiState ~= "ik" then
			table.insert(var_105_0, function(arg_108_0)
				arg_105_0.uiSetCallback = arg_108_0

				arg_105_0:SetUI("ik")
			end)
		end

		table.insert(var_105_0, function(arg_109_0)
			Shader.SetGlobalFloat("_ScreenClipOff", 0)

			local function var_109_0(arg_110_0, ...)
				return switch(arg_110_0, {
					function(arg_111_0, arg_111_1)
						return function(arg_112_0)
							seriesAsync({
								function(arg_113_0)
									if not arg_111_1 or arg_111_1 == "" then
										return arg_113_0()
									end

									arg_105_0.sceneView:PlaySingleAction(arg_111_1, arg_113_0)
								end,
								function()
									arg_105_0.ikConfig = pg.dorm3d_ik_status[arg_111_0]

									arg_105_0:SetIKState(true, arg_109_0)
								end,
								arg_112_0
							})
						end
					end,
					function()
						return function()
							if arg_105_0.ikSpecialCall then
								local var_116_0 = arg_105_0.ikSpecialCall

								arg_105_0.ikSpecialCall = nil

								existCall(var_116_0)
							else
								arg_105_0:ExitTouchMode()
							end
						end
					end,
					function(arg_117_0)
						return function(arg_118_0)
							arg_105_0.sceneView:PlaySingleAction(arg_117_0, arg_118_0)
						end
					end,
					function(arg_119_0)
						return function(arg_120_0)
							arg_105_0:DoTalk(arg_119_0, arg_120_0)
						end
					end
				}, function()
					return function()
						return
					end
				end, ...)
			end

			local var_109_1 = {}
			local var_109_2 = {}

			for iter_109_0, iter_109_1 in ipairs(arg_105_0.ikConfig.ik_id) do
				local var_109_3, var_109_4, var_109_5, var_109_6 = unpack(iter_109_1)

				var_109_1[var_109_3] = var_109_0(unpack(var_109_5))
				var_109_2[var_109_3] = setmetatable(var_109_6 or {}, {
					__index = {
						"",
						"",
						"",
						""
					}
				})
			end

			arg_105_0.ikFaceDic = var_109_2

			onButton(arg_105_0, arg_105_0.uiContianer:Find("ik/btn_back"), var_109_0(2), "ui-dorm_back_v2")
			arg_105_0.sceneView:EnableTouchIK(true, var_109_1)
			arg_105_0:emit(Dorm3dScene.HIDE_BLOCK)
			arg_109_0()
		end)
	else
		assert(arg_105_0.uiState == "ik")
		table.insert(var_105_0, function(arg_123_0)
			arg_105_0:emit(Dorm3dScene.SHOW_BLOCK)
			Shader.SetGlobalFloat("_ScreenClipOff", 1)
			arg_105_0.sceneView:EnableTouchIK(false)
			arg_105_0.sceneView:ExitIKStatus(arg_105_0.ikConfig, arg_123_0)
		end)
		table.insert(var_105_0, function(arg_124_0)
			arg_105_0.uiSetCallback = arg_124_0

			arg_105_0:SetUI("back")
		end)
		table.insert(var_105_0, function(arg_125_0)
			arg_105_0:SetBlackboardValue("inIK", false)
			arg_105_0:emit(Dorm3dScene.HIDE_BLOCK)

			arg_105_0.ikConfig = nil
			arg_105_0.ikFaceDic = nil

			arg_125_0()
		end)
	end

	seriesAsync(var_105_0, arg_105_2)
end

function var_0_0.UpdateTouchGameDisplay(arg_126_0)
	setActive(arg_126_0.rtTouchGamePanel:Find("effect_bg"), arg_126_0.touchCount > 100)
	setActive(arg_126_0.rtTouchGamePanel:Find("slider/icon/beating"), arg_126_0.touchCount > 100)

	if arg_126_0.touchCount < 100 then
		quickPlayAnimation(arg_126_0.rtTouchGamePanel, "anim_dorm3d_touch_change_out")
		quickPlayAnimation(arg_126_0.rtTouchGamePanel:Find("slider/icon"), "anim_dorm3d_touch_icon")
	elseif arg_126_0.touchCount < 200 then
		quickPlayAnimation(arg_126_0.rtTouchGamePanel, "anim_dorm3d_touch_change")
		quickPlayAnimation(arg_126_0.rtTouchGamePanel:Find("slider/icon"), "anim_dorm3d_touch_icon_1")
		pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_heartbeat")
	end
end

function var_0_0.UpdateTouchCount(arg_127_0, arg_127_1)
	local var_127_0 = arg_127_0.touchCount

	arg_127_0.touchCount = math.clamp(arg_127_0.touchCount + arg_127_1, 0, 510)

	warning(arg_127_0.touchCount)

	if arg_127_0.sliderLT and LeanTween.isTweening(arg_127_0.sliderLT) then
		var_127_0 = LeanTween.descr(arg_127_0.sliderLT).val

		LeanTween.cancel(arg_127_0.sliderLT)

		arg_127_0.sliderLT = nil
	end

	if math.clamp(var_127_0, 0, 500) ~= math.clamp(arg_127_0.touchCount, 0, 500) then
		local var_127_1 = GetComponent(arg_127_0.rtTouchGamePanel:Find("slider"), typeof(Slider))

		arg_127_0.sliderLT = LeanTween.value(var_127_0, arg_127_0.touchCount, math.abs(arg_127_0.touchCount - var_127_0) / 50):setOnUpdate(System.Action_float(function(arg_128_0)
			var_127_1.value = arg_128_0 >= 500 and 100 or arg_128_0 % 100
		end)):setEase(LeanTweenType.easeInOutCubic).uniqueId
	else
		setSlider(arg_127_0.rtTouchGamePanel:Find("slider"), 0, 100, arg_127_0.touchCount >= 500 and 100 or arg_127_0.touchCount % 100)
	end

	if math.floor(arg_127_0.touchCount / 100) ~= math.floor(var_127_0 / 100) then
		arg_127_0:UpdateTouchGameDisplay()
	end

	arg_127_0.topCount = math.max(arg_127_0.topCount, arg_127_0.touchCount)
end

function var_0_0.DoTouch(arg_129_0, arg_129_1, arg_129_2)
	if arg_129_0.inTouchGame then
		switch(arg_129_2, {
			function()
				arg_129_0:UpdateTouchCount(10)
			end,
			function()
				arg_129_0:UpdateTouchCount(2)
			end,
			function()
				arg_129_0:UpdateTouchCount(10)
			end,
			function()
				arg_129_0:UpdateTouchCount(20)
			end
		})
	end

	if arg_129_0.ikFaceDic[arg_129_1][arg_129_2] ~= "" then
		arg_129_0:emit(Dorm3dScene.PLAY_SINGLE_ACTION, arg_129_0.ikFaceDic[arg_129_1][arg_129_2])
	end
end

function var_0_0.DoTalk(arg_134_0, arg_134_1, arg_134_2)
	if arg_134_0:GetBlackboardValue("inTalking") then
		errorMsg("Talking block:" .. arg_134_1)

		return
	end

	warning(arg_134_1)

	if arg_134_1 == 10010 and not arg_134_0.apartment.talkDic[arg_134_1] then
		arg_134_0.firstTimelineTouch = true
		arg_134_0.firstMoveGuide = true
	end

	local var_134_0 = {}
	local var_134_1 = pg.dorm3d_dialogue_group[arg_134_1]
	local var_134_2 = var_134_1.performance_type == 1
	local var_134_3

	table.insert(var_134_0, function(arg_135_0)
		arg_134_0:emit(Dorm3dScene.SHOW_BLOCK)
		arg_134_0:SetBlackboardValue(var_134_2 and "inPerformance" or "inTalking", true)
		arg_134_0:emit(Dorm3dSceneMediator.DO_TALK, arg_134_1, function(arg_136_0)
			var_134_3 = arg_136_0

			arg_135_0()
		end)
	end)
	table.insert(var_134_0, function(arg_137_0)
		pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataDialog(arg_134_0.apartment.configId, arg_134_0.apartment.level, arg_134_1, var_134_1.type, arg_134_0.apartment:getZoneConfig(var_134_1.trigger_area, "id"), var_134_1.action_type, table.CastToString(var_134_1.trigger_config)))

		if pg.NewGuideMgr.GetInstance():IsBusy() then
			pg.NewGuideMgr.GetInstance():Pause()
		end

		arg_134_0.uiSetCallback = arg_137_0

		arg_134_0:SetUI("blank")
	end)

	if var_134_1.trigger_area and var_134_1.trigger_area ~= "" then
		table.insert(var_134_0, function(arg_138_0)
			arg_134_0:emit(Dorm3dScene.MOVE_PLAYER_BY_CUT, var_134_1.trigger_area, arg_138_0)
		end)
	end

	if var_134_1.performance_type == 0 then
		table.insert(var_134_0, function(arg_139_0)
			pg.NewStoryMgr.GetInstance():ForceManualPlay(var_134_1.story, arg_139_0, true)
		end)
	elseif var_134_1.performance_type == 1 then
		table.insert(var_134_0, function(arg_140_0)
			arg_134_0:emit(Dorm3dScene.HIDE_BLOCK)
			arg_134_0:PerformanceQueue(var_134_1.story, arg_140_0)
		end)
		table.insert(var_134_0, function(arg_141_0)
			arg_134_0:emit(Dorm3dScene.SHOW_BLOCK)
			arg_141_0()
		end)
	else
		assert(false)
	end

	table.insert(var_134_0, function(arg_142_0)
		local var_142_0 = pg.NewStoryMgr.GetInstance():StoryName2StoryId(var_134_1.story)

		if var_142_0 then
			local var_142_1 = "1"

			pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataStory(var_142_0, var_142_1))
		end

		if var_134_3 and #var_134_3 > 0 then
			arg_134_0:emit(Dorm3dSceneMediator.OPEN_DROP_LAYER, var_134_3, arg_142_0)
		else
			arg_142_0()
		end
	end)
	table.insert(var_134_0, function(arg_143_0)
		if pg.NewGuideMgr.GetInstance():IsPause() then
			pg.NewGuideMgr.GetInstance():Resume()
		end

		arg_134_0:emit(Dorm3dScene.HIDE_BLOCK)
		arg_134_0:SetBlackboardValue(var_134_2 and "inPerformance" or "inTalking", false)

		arg_134_0.uiSetCallback = arg_143_0

		arg_134_0:SetUI("back")
	end)
	seriesAsync(var_134_0, arg_134_2)
end

function var_0_0.DoTalkTouchOption(arg_144_0, arg_144_1, arg_144_2, arg_144_3)
	local var_144_0 = arg_144_0.rtExtraScreen:Find("TalkTouchOption")
	local var_144_1 = pg.NewStoryMgr.GetInstance()._tf

	if isActive(var_144_1) then
		setParent(var_144_0, var_144_1)
	else
		pg.UIMgr.GetInstance():OverlayPanel(var_144_0, {
			weight = LayerWeightConst.SECOND_LAYER,
			groupName = LayerWeightConst.GROUP_DORM3D
		})
	end

	arg_144_0.tempExtraPanel = var_144_0

	local var_144_2
	local var_144_3 = var_144_0:Find("content")

	UIItemList.StaticAlign(var_144_3, var_144_3:Find("clickTpl"), #arg_144_1.options, function(arg_145_0, arg_145_1, arg_145_2)
		arg_145_1 = arg_145_1 + 1

		if arg_145_0 == UIItemList.EventUpdate then
			local var_145_0 = arg_144_1.options[arg_145_1]

			setAnchoredPosition(arg_145_2, NewPos(unpack(var_145_0.pos)))
			onButton(arg_144_0, arg_145_2, function()
				var_144_2(var_145_0.flag)
			end, SFX_CONFIRM)
			setActive(arg_145_2, not table.contains(arg_144_2, var_145_0.flag))
		end
	end)
	setActive(var_144_0, true)

	function var_144_2(arg_147_0)
		setActive(var_144_0, false)

		if isActive(var_144_1) then
			setParent(var_144_0, arg_144_0.rtExtraScreen)
		else
			pg.UIMgr.GetInstance():UnOverlayPanel(var_144_0, arg_144_0.rtExtraScreen)
		end

		arg_144_0.tempExtraPanel = nil

		arg_144_3(arg_147_0)
	end
end

function var_0_0.DoTimelineOption(arg_148_0, arg_148_1, arg_148_2)
	local var_148_0 = arg_148_0.rtExtraScreen:Find("TimelineOption")

	if not var_148_0 then
		return
	end

	local var_148_1 = pg.NewStoryMgr.GetInstance()._tf

	if isActive(var_148_1) then
		setParent(var_148_0, var_148_1)
	else
		pg.UIMgr.GetInstance():OverlayPanel(var_148_0, {
			weight = LayerWeightConst.SECOND_LAYER,
			groupName = LayerWeightConst.GROUP_DORM3D
		})
	end

	arg_148_0.tempExtraPanel = var_148_0

	local var_148_2
	local var_148_3 = var_148_0:Find("content")

	UIItemList.StaticAlign(var_148_3, var_148_3:Find("clickTpl"), #arg_148_1, function(arg_149_0, arg_149_1, arg_149_2)
		arg_149_1 = arg_149_1 + 1

		if arg_149_0 == UIItemList.EventUpdate then
			local var_149_0 = arg_148_1[arg_149_1]

			setText(arg_149_2:Find("Text"), var_149_0.content)
			onButton(arg_148_0, arg_149_2, function()
				var_148_2(arg_149_1)
			end, SFX_CONFIRM)
		end
	end)
	setActive(var_148_0, true)

	function var_148_2(arg_151_0)
		setActive(var_148_0, false)

		if isActive(var_148_1) then
			setParent(var_148_0, arg_148_0.rtExtraScreen)
		else
			pg.UIMgr.GetInstance():UnOverlayPanel(var_148_0, arg_148_0.rtExtraScreen)
		end

		arg_148_0.tempExtraPanel = nil

		arg_148_2(arg_151_0)
	end
end

function var_0_0.DoTimelineTouch(arg_152_0, arg_152_1, arg_152_2)
	local var_152_0 = arg_152_0.rtExtraScreen:Find("TimelineTouch")

	if not var_152_0 then
		return
	end

	local var_152_1 = pg.NewStoryMgr.GetInstance()._tf

	if isActive(var_152_1) then
		setParent(var_152_0, var_152_1)
	else
		pg.UIMgr.GetInstance():OverlayPanel(var_152_0, {
			weight = LayerWeightConst.SECOND_LAYER,
			groupName = LayerWeightConst.GROUP_DORM3D
		})
	end

	arg_152_0.tempExtraPanel = var_152_0

	local var_152_2
	local var_152_3 = var_152_0:Find("content")

	UIItemList.StaticAlign(var_152_3, var_152_3:Find("clickTpl"), #arg_152_1, function(arg_153_0, arg_153_1, arg_153_2)
		arg_153_1 = arg_153_1 + 1

		if arg_153_0 == UIItemList.EventUpdate then
			local var_153_0 = arg_152_1[arg_153_1]

			setAnchoredPosition(arg_153_2, NewPos(unpack(var_153_0.pos)))
			onButton(arg_152_0, arg_153_2, function()
				var_152_2(arg_153_1)
			end, SFX_CONFIRM)

			if arg_152_0.firstTimelineTouch then
				arg_152_0.firstTimelineTouch = nil

				setActive(arg_153_2:Find("finger"), true)
			end
		end
	end)
	setActive(var_152_0, true)

	function var_152_2(arg_155_0)
		setActive(var_152_0, false)

		if isActive(var_152_1) then
			setParent(var_152_0, arg_152_0.rtExtraScreen)
		else
			pg.UIMgr.GetInstance():UnOverlayPanel(var_152_0, arg_152_0.rtExtraScreen)
		end

		arg_152_0.tempExtraPanel = nil

		arg_152_2(arg_155_0)
	end
end

function var_0_0.DoShortWait(arg_156_0)
	local var_156_0 = arg_156_0.apartment:getZoneConfig(arg_156_0:GetZoneName(), "special_action")
	local var_156_1 = var_156_0 ~= "" and var_156_0[math.random(#var_156_0)] or nil

	if not var_156_1 then
		return
	end

	arg_156_0:emit(Dorm3dScene.PLAY_SINGLE_ACTION, var_156_1)
end

function var_0_0.DoLongWait(arg_157_0)
	if arg_157_0:GetBlackboardValue("inWatchMode") then
		warning(arg_157_0:GetZoneName(), arg_157_0.apartment:getZoneConfig(arg_157_0:GetZoneName(), "special_talk"))

		local var_157_0 = arg_157_0.apartment:filterUnlockTalkList(arg_157_0.apartment:getZoneConfig(arg_157_0:GetZoneName(), "special_talk"))

		if #var_157_0 == 0 then
			return
		end

		arg_157_0:DoTalk(var_157_0[math.random(#var_157_0)])
	else
		assert(not arg_157_0:GetBlackboardValue("inLazy"))

		local var_157_1 = arg_157_0.apartment:getZoneConfig(arg_157_0:GetZoneName(), "lazy_action")

		if #var_157_1 == 0 then
			return
		end

		arg_157_0:SetBlackboardValue("inLazy", true)
		arg_157_0:emit(Dorm3dScene.PLAY_SINGLE_ACTION, var_157_1[1])
	end
end

function var_0_0.OutOfLazy(arg_158_0, arg_158_1)
	local var_158_0 = {}

	if arg_158_0:GetBlackboardValue("inLazy") then
		local var_158_1 = arg_158_0.apartment:getZoneConfig(arg_158_0:GetZoneName(), "lazy_action")[2]

		table.insert(var_158_0, function(arg_159_0)
			arg_158_0:emit(Dorm3dScene.SHOW_BLOCK)
			arg_158_0:emit(Dorm3dScene.PLAY_SINGLE_ACTION, var_158_1, function()
				arg_158_0:SetBlackboardValue("inLazy", false)
				arg_158_0:emit(Dorm3dScene.HIDE_BLOCK)
				arg_159_0()
			end)
		end)
	end

	seriesAsync(var_158_0, arg_158_1)
end

function var_0_0.ChangeCanWatchState(arg_161_0)
	local var_161_0 = tobool(pg.NodeCanvasMgr.GetInstance():GetBlackboradValue("canWatch"))

	if not arg_161_0.nowCanWatchState or arg_161_0.nowCanWatchState ~= (tobool(arg_161_0.sceneView.activeSector) and var_161_0) then
		arg_161_0.nowCanWatchState = tobool(arg_161_0.sceneView.activeSector) and var_161_0

		arg_161_0.sceneView:ShowOrHideCanWatchMark(arg_161_0.nowCanWatchState)
	end

	return var_161_0
end

function var_0_0.PerformanceQueue(arg_162_0, arg_162_1, arg_162_2)
	local var_162_0, var_162_1 = pcall(function()
		return require("GameCfg.dorm." .. arg_162_1)
	end)

	if not var_162_0 then
		errorMsg("不存在表演ID对应的Lua:" .. arg_162_1)
		existCall(arg_162_2)

		return
	end

	warning(arg_162_1)

	local var_162_2 = {}

	table.insert(var_162_2, function(arg_164_0)
		arg_162_0.uiSetCallback = arg_164_0

		arg_162_0:SetUI("blank")
	end)
	table.insertto(var_162_2, underscore.map(var_162_1, function(arg_165_0)
		return switch(arg_165_0.type, {
			function()
				return function(arg_167_0)
					local var_167_0 = unpack(arg_165_0.params)

					arg_162_0:DoTalk(var_167_0, arg_167_0, true)
				end
			end,
			function()
				return function(arg_169_0)
					arg_162_0.touchExitCall = arg_169_0

					arg_162_0:EnterTouchMode()
				end
			end,
			function()
				return function(arg_171_0)
					arg_162_0:emit(Dorm3dScene.PLAY_SINGLE_ACTION, arg_165_0.name, arg_171_0)
				end
			end,
			function()
				return function(arg_173_0)
					arg_162_0:emit(Dorm3dScene.PLAY_EXPRESSION, arg_165_0)
					arg_173_0()
				end
			end,
			function()
				return function(arg_175_0)
					if arg_162_0:GetZoneName() ~= arg_165_0.name then
						arg_162_0:emit(Dorm3dScene.MOVE_PLAYER_BY_CUT, arg_165_0.name, arg_175_0)
					else
						arg_175_0()
					end
				end
			end,
			function()
				return function(arg_177_0)
					if PlayerPrefs.GetInt("DORM3D_SCENE_LOCK_TIME", 0) ~= 0 then
						PlayerPrefs.SetInt("DORM3D_SCENE_LOCK_TIME", arg_165_0.params[1])
					end

					arg_162_0.contextData.timeIndex = arg_165_0.params[1]

					arg_162_0.sceneView:SwitchDayNight(arg_162_0.contextData.timeIndex)
					onNextTick(arg_177_0)
				end
			end,
			function()
				return function(arg_179_0)
					arg_162_0.sceneView:ActiveStateCamera(arg_165_0.name, arg_179_0)
				end
			end,
			function()
				return function(arg_181_0)
					if arg_165_0.name == "base" then
						arg_162_0.sceneView:ChangeArtScene(arg_162_0.sceneView.sceneInfo, arg_181_0)
					else
						local var_181_0 = arg_165_0.params.scene
						local var_181_1 = arg_165_0.params.sceneRoot

						arg_162_0.sceneView:ChangeArtScene(var_181_0 .. "|" .. var_181_1, arg_181_0)
					end
				end
			end,
			function()
				return function(arg_183_0)
					local var_183_0 = arg_165_0.params.name

					if arg_165_0.name == "load" then
						arg_162_0.sceneView.waitForTimeline = tobool(arg_165_0.params.wait_timeline)

						arg_162_0.sceneView:LoadTimelineScene(var_183_0, true, arg_183_0)
					elseif arg_165_0.name == "unload" then
						arg_162_0.sceneView:UnloadTimelineScene(var_183_0, true, arg_183_0)
					else
						assert(false)
					end
				end
			end,
			function()
				return function(arg_185_0)
					setActive(arg_162_0.uiContianer:Find("walk/btn_back"), false)

					if arg_165_0.name == "change" then
						local var_185_0 = arg_165_0.params.scene
						local var_185_1 = arg_165_0.params.sceneRoot

						arg_162_0.sceneView.walkBornPoint = arg_165_0.params.point or "Default"

						arg_162_0:ChangeWalkScene(var_185_0 .. "|" .. var_185_1, arg_185_0)
					elseif arg_165_0.name == "back" then
						arg_162_0.sceneView.walkBornPoint = nil

						arg_162_0:ChangeWalkScene(arg_162_0.sceneView.sceneInfo, arg_185_0)
					elseif arg_165_0.name == "set" then
						local function var_185_2()
							local var_186_0 = arg_185_0

							arg_185_0 = nil

							return existCall(var_186_0)
						end

						for iter_185_0, iter_185_1 in pairs(arg_165_0.params) do
							switch(iter_185_0, {
								back_button_trigger = function(arg_187_0)
									onButton(arg_162_0, arg_162_0.uiContianer:Find("walk/btn_back"), var_185_2, "ui-dorm_back_v2")
									setActive(arg_162_0.uiContianer:Find("walk/btn_back"), IsUnityEditor and arg_187_0)
								end,
								near_trigger = function(arg_188_0)
									if arg_188_0 == true then
										arg_188_0 = 1.5
									end

									if arg_188_0 then
										function arg_162_0.walkNearCallback(arg_189_0)
											if arg_189_0 < arg_188_0 then
												arg_162_0.walkNearCallback = nil

												var_185_2()
											end
										end
									else
										arg_162_0.walkNearCallback = nil
									end
								end
							}, nil, iter_185_1)
						end

						if arg_162_0.firstMoveGuide then
							setActive(arg_162_0.povLayer:Find("Guide"), arg_162_0.firstMoveGuide)

							arg_162_0.firstMoveGuide = nil
						end
					else
						assert(false)
					end
				end
			end,
			function()
				return function(arg_191_0)
					if arg_165_0.name == "set" then
						arg_162_0.ikConfig = pg.dorm3d_ik_status[arg_165_0.params.state]

						setActive(arg_162_0.uiContianer:Find("ik/btn_back"), not arg_165_0.params.hide_back)

						arg_162_0.ikSpecialCall = arg_191_0

						arg_162_0:SetIKState(true)
					elseif arg_165_0.name == "back" then
						assert(arg_162_0:GetBlackboardValue("inIK"))

						arg_162_0.ikConfig = arg_165_0.params

						arg_162_0:SetIKState(false, arg_191_0)
					else
						assert(false)
					end
				end
			end,
			function()
				return function(arg_193_0)
					arg_162_0.sceneView.blackSceneInfo = setmetatable(arg_165_0.params or {}, {
						__index = {
							color = "#000000",
							time = 0.3,
							delay = arg_165_0.name == "show" and 0 or 0.5
						}
					})

					if arg_165_0.name == "show" then
						arg_162_0.sceneView:ShowBlackScreen(true, arg_193_0)
					elseif arg_165_0.name == "hide" then
						arg_162_0.sceneView:ShowBlackScreen(false, arg_193_0)
					else
						assert(false)
					end

					arg_162_0.sceneView.blackSceneInfo = nil
				end
			end
		})
	end))
	table.insert(var_162_2, function(arg_194_0)
		arg_162_0.uiSetCallback = arg_194_0

		arg_162_0:SetUI("back")
	end)
	seriesAsync(var_162_2, arg_162_2)
end

function var_0_0.TriggerContact(arg_195_0, arg_195_1)
	arg_195_0:emit(Dorm3dSceneMediator.COLLECTION_ITEM, arg_195_0.apartment.configId, arg_195_1)
end

function var_0_0.UpdateContactState(arg_196_0)
	arg_196_0.sceneView:SetContactStateDic(arg_196_0.apartment:getTriggerableCollectItemDic(arg_196_0:GetZoneName()))
end

function var_0_0.UpdateFavorDisplay(arg_197_0)
	setText(arg_197_0.rtFavorLevel:Find("rank/Text"), arg_197_0.apartment.level)

	local var_197_0 = arg_197_0.apartment.favor
	local var_197_1 = arg_197_0.apartment:getNextExp()

	setText(arg_197_0.rtFavorLevel:Find("Text"), string.format("<color=#ff6698>%d</color>/%d", var_197_0, var_197_1))

	local var_197_2, var_197_3 = getProxy(ApartmentProxy):getStamina()

	setText(arg_197_0.rtStaminaDisplay:Find("Text"), string.format("%d/%d", var_197_2, var_197_3))
	setActive(arg_197_0.rtStaminaDisplay, false)
end

function var_0_0.UpdateBtnState(arg_198_0)
	setActive(arg_198_0.uiContianer:Find("base/left/btn_furniture/tip"), arg_198_0.apartment:checkUnlockConfig(getDorm3dGameset("drom3d_furniture_unlock")[2]) and Dorm3dFurniture.NeedViewTip(arg_198_0.apartment.configIds))
	setActive(arg_198_0.uiContianer:Find("base/btn_back/main"), underscore(getProxy(ApartmentProxy):getRawData()):chain():values():filter(function(arg_199_0)
		return tobool(arg_199_0)
	end):any(function(arg_200_0)
		return #arg_200_0:getSpecialTalking() > 0 or arg_200_0:getIconTip() == "main"
	end):value())
end

function var_0_0.AddUnlockDisplay(arg_201_0, arg_201_1)
	table.insert(arg_201_0.unlockList, arg_201_1)

	if not isActive(arg_201_0.rtFavorUp) then
		setText(arg_201_0.rtFavorUp:Find("Text"), table.remove(arg_201_0.unlockList, 1))
		setActive(arg_201_0.rtFavorUp, true)
	end
end

function var_0_0.PopFavorTrigger(arg_202_0, arg_202_1)
	local var_202_0 = arg_202_1.triggerId
	local var_202_1 = arg_202_1.delta
	local var_202_2 = arg_202_1.apartment
	local var_202_3 = pg.dorm3d_favor_trigger[var_202_0]

	if var_202_3.is_repeat == 0 then
		if var_202_0 == getDorm3dGameset("drom3d_favir_trigger_onwer")[1] then
			arg_202_0:AddUnlockDisplay(i18n("dorm3d_own_favor"))
		elseif var_202_0 == getDorm3dGameset("drom3d_favir_trigger_propose")[1] then
			arg_202_0:AddUnlockDisplay(i18n("dorm3d_pledge_favor"))
		else
			arg_202_0:AddUnlockDisplay(string.format("unknow favor trigger:%d unlock", var_202_0))
		end
	elseif arg_202_1.delta > 0 then
		local var_202_4, var_202_5 = var_202_2:getFavor()
		local var_202_6 = var_202_4 + var_202_1

		setText(arg_202_0.rtFavorUpDaily:Find("bg/Text"), string.format("<size=48>+%d</size>", var_202_1))
		setSlider(arg_202_0.rtFavorUpDaily:Find("bg/slider"), 0, var_202_5, var_202_4)
		setAnchoredPosition(arg_202_0.rtFavorUpDaily:Find("bg"), arg_202_1.isGift and NewPos(-354, 223) or NewPos(-208, 105))

		local var_202_7 = {}
		local var_202_8 = arg_202_0.rtFavorUpDaily:Find("bg/effect")

		eachChild(var_202_8, function(arg_203_0)
			setActive(arg_203_0, false)
		end)

		local var_202_9

		if var_202_3.effect and var_202_3.effect ~= "" then
			var_202_9 = var_202_8:Find(var_202_3.effect .. "(Clone)")

			if not var_202_9 then
				table.insert(var_202_7, function(arg_204_0)
					warning(var_202_3.effect)
					LoadAndInstantiateAsync("Dorm3D/Effect/Prefab/ExpressionUI", "uifx_dorm3d_yinfu01", function(arg_205_0)
						setParent(arg_205_0, var_202_8)

						var_202_9 = tf(arg_205_0)

						arg_204_0()
					end)
				end)
			else
				setActive(var_202_9, true)
			end
		end

		local var_202_10 = arg_202_0.rtFavorUpDaily:GetComponent("DftAniEvent")

		var_202_10:SetTriggerEvent(function(arg_206_0)
			local var_206_0 = GetComponent(arg_202_0.rtFavorUpDaily:Find("bg/slider"), typeof(Slider))

			LeanTween.value(var_202_4, var_202_6, 0.5):setOnUpdate(System.Action_float(function(arg_207_0)
				var_206_0.value = arg_207_0
			end)):setEase(LeanTweenType.easeInOutQuad):setDelay(0.165):setOnComplete(System.Action(function()
				LeanTween.delayedCall(0.165, System.Action(function()
					quickPlayAnimator(arg_202_0.rtFavorUpDaily, "favor_out")
				end))
			end))
			pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_progaress_bar")
		end)
		var_202_10:SetEndEvent(function(arg_210_0)
			setActive(arg_202_0.rtFavorUpDaily, false)
		end)
		seriesAsync(var_202_7, function()
			setLocalPosition(arg_202_0.rtFavorUpDaily, arg_202_0.sceneView:GetLocalPosition(arg_202_0.sceneView:GetScreenPosition(arg_202_0.sceneView.ladyHeadCenter.position), arg_202_0.rtFavorUpDaily.parent))
			setActive(arg_202_0.rtFavorUpDaily, true)
			SetCompomentEnabled(arg_202_0.rtFavorUpDaily, typeof(Animator), true)
			quickPlayAnimator(arg_202_0.rtFavorUpDaily, "favor_open")

			if var_202_3.is_daily_max > 0 then
				local var_211_0, var_211_1 = getProxy(ApartmentProxy):getStamina()

				setText(arg_202_0.rtStaminaPop:Find("Text"), string.format("%d/%d", var_211_0 + 1, var_211_1))
				setActive(arg_202_0.rtStaminaPop, true)
			end
		end)
	end
end

function var_0_0.PopFavorLevelUp(arg_212_0, arg_212_1, arg_212_2)
	arg_212_0.isLock = true

	LeanTween.delayedCall(0.33, System.Action(function()
		arg_212_0.isLock = false
	end))
	triggerToggle(arg_212_0.rtLevelUpWindow:Find("panel/bg/item1/mark/level/Image_" .. arg_212_1.level), true)
	setText(arg_212_0.rtLevelUpWindow:Find("panel/info/Text"), arg_212_1:getFavorConfig("levelup_trigger_mention"))
	setText(arg_212_0.rtLevelUpWindow:Find("panel/info/Text_1"), arg_212_1:getFavorConfig("levelup_trigger_comment"))
	setActive(arg_212_0.rtLevelUpWindow, true)
	pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_upgrade")
	pg.UIMgr.GetInstance():OverlayPanel(arg_212_0.rtLevelUpWindow, {
		weight = LayerWeightConst.SECOND_LAYER,
		groupName = LayerWeightConst.GROUP_DORM3D
	})

	function arg_212_0.levelUpCallback()
		arg_212_0.levelUpCallback = nil

		existCall(arg_212_2)
	end
end

function var_0_0.UpdateZoneList(arg_215_0)
	local var_215_0 = _.select(arg_215_0.apartment:GetZones(), function(arg_216_0)
		return not arg_216_0:IsGlobal()
	end)
	local var_215_1 = arg_215_0.uiContianer:Find("base")
	local var_215_2 = var_215_1:Find("right/Zone")
	local var_215_3 = var_215_1:Find("right/Zone/List")

	onButton(arg_215_0, var_215_2, function()
		setActive(var_215_3, not isActive(var_215_3))
	end, SFX_PANEL)
	;(function()
		local var_218_0 = arg_215_0:GetZoneName()

		UIItemList.StaticAlign(var_215_3, var_215_3:GetChild(0), #var_215_0, function(arg_219_0, arg_219_1, arg_219_2)
			if arg_219_0 ~= UIItemList.EventUpdate then
				return
			end

			arg_219_1 = arg_219_1 + 1

			local var_219_0 = var_215_0[arg_219_1]

			arg_219_2.name = var_219_0:GetWatchCameraName()

			local var_219_1 = var_219_0:GetName()

			setText(arg_219_2:Find("Name"), var_219_1)

			local var_219_2 = var_219_0:GetWatchCameraName() == var_218_0 and Color.NewHex("5CCAFF") or Color.NewHex("FFFFFF99")

			if var_219_0:GetWatchCameraName() == var_218_0 then
				setText(var_215_2:Find("Text"), var_219_1)
			end

			setTextColor(arg_219_2:Find("Name"), var_219_2)
			setActive(arg_219_2:Find("Line"), arg_219_1 < #var_215_0)
		end)
	end)()
	UIItemList.StaticAlign(var_215_3, var_215_3:GetChild(0), #var_215_0, function(arg_220_0, arg_220_1, arg_220_2)
		if arg_220_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_220_1 = arg_220_1 + 1

		onButton(arg_215_0, arg_220_2, function()
			local var_221_0 = var_215_0[arg_220_1]:GetWatchCameraName()

			if var_221_0 == arg_215_0:GetZoneName() then
				return
			end

			setActive(var_215_3, false)

			if arg_215_0.uiState ~= "base" then
				return
			end

			arg_215_0:OutOfLazy(function()
				arg_215_0:emit(Dorm3dScene.MOVE_PLAYER_BY_CUT, var_221_0, function()
					arg_215_0:CheckQueue()
				end)
			end)
		end, SFX_PANEL)
	end)
end

function var_0_0.TalkingEventHandle(arg_224_0, arg_224_1)
	local var_224_0 = {}
	local var_224_1 = {}
	local var_224_2 = arg_224_1.data

	if var_224_2.op_list then
		for iter_224_0, iter_224_1 in ipairs(var_224_2.op_list) do
			table.insert(var_224_0, function(arg_225_0)
				local function var_225_0()
					local var_226_0 = arg_225_0

					arg_225_0 = nil

					return existCall(var_226_0)
				end

				switch(iter_224_1.type, {
					action = function()
						arg_224_0:emit(Dorm3dScene.PLAY_SINGLE_ACTION, iter_224_1.name, var_225_0)
					end,
					timeline = function()
						if arg_224_0.inTouchGame then
							setActive(arg_224_0.rtTouchGamePanel, false)
						end

						arg_224_0:emit(Dorm3dScene.PLAY_TIMELINE, iter_224_1, function(arg_229_0, arg_229_1)
							setActive(arg_224_0.rtTouchGamePanel, arg_224_0.inTouchGame)

							var_224_1.notifiCallback = arg_229_1

							warning("Timeline Finish")
							var_225_0()
						end)
					end,
					clickOption = function()
						arg_224_0:DoTalkTouchOption(iter_224_1, arg_224_1.flags, function(arg_231_0)
							var_224_1.optionIndex = arg_231_0

							var_225_0()
						end)
					end,
					wait = function()
						arg_224_0.LTs = arg_224_0.LTs or {}

						table.insert(arg_224_0.LTs, LeanTween.delayedCall(iter_224_1.time, System.Action(var_225_0)).uniqueId)
					end,
					expression = function()
						arg_224_0:emit(Dorm3dScene.PLAY_EXPRESSION, iter_224_1)
						var_225_0()
					end
				}, function()
					assert(false, "op type error:", iter_224_1.type)
				end)

				if iter_224_1.skip then
					var_225_0()
				end
			end)
		end
	end

	seriesAsync(var_224_0, function()
		if arg_224_1.callbackData then
			warning("send notification", Dorm3dSceneMediator.TALKING_EVENT_FINISH)
			arg_224_0:emit(Dorm3dSceneMediator.TALKING_EVENT_FINISH, arg_224_1.callbackData.name, var_224_1)
		end
	end)
end

function var_0_0.CheckQueue(arg_236_0)
	if arg_236_0.uiState ~= "base" then
		return
	end

	warning("CheckQueue")

	if arg_236_0:CheckGuide() then
		-- block empty
	elseif arg_236_0:CheckEnterDeal() then
		-- block empty
	elseif arg_236_0:CheckActiveTalk() then
		-- block empty
	else
		arg_236_0:CheckFavorTrigger()
	end

	arg_236_0.contextData.hasEnterCheck = true
end

function var_0_0.CheckFirstEnter(arg_237_0, arg_237_1)
	if arg_237_0.contextData.specialId then
		local var_237_0 = arg_237_0.contextData.specialId

		arg_237_0.contextData.specialId = nil

		arg_237_1(var_237_0)
		arg_237_0:DoTalk(var_237_0, function()
			arg_237_0.sceneView:closeView()
		end)

		return var_237_0
	end

	for iter_237_0, iter_237_1 in ipairs(arg_237_0.apartment:getForceEnterTalking()) do
		arg_237_1(iter_237_1)
		arg_237_0:DoTalk(iter_237_1)

		return iter_237_1
	end

	return false
end

function var_0_0.CheckGuide(arg_239_0)
	do return false end

	if arg_239_0:GetBlackboardValue("inGuide") then
		return false
	end

	for iter_239_0, iter_239_1 in ipairs({
		{
			name = "DORM3D_GUIDE02",
			active = function()
				return arg_239_0.uiState == "base"
			end
		},
		{
			name = "DORM3D_GUIDE03",
			active = function()
				return arg_239_0.uiState == "base" and arg_239_0.apartment.level >= 2
			end
		},
		{
			name = "DORM3D_GUIDE04",
			active = function()
				return arg_239_0.uiState == "base" and pg.NewStoryMgr.GetInstance():IsPlayed("DORM3D_GUIDE03")
			end
		},
		{
			name = "DORM3D_GUIDE05",
			active = function()
				return arg_239_0.uiState == "base" and pg.NewStoryMgr.GetInstance():IsPlayed("DORM3D_GUIDE04")
			end
		},
		{
			name = "DORM3D_GUIDE06",
			active = function()
				return arg_239_0.uiState == "base" and arg_239_0.apartment:checkUnlockConfig(getDorm3dGameset("drom3d_furniture_unlock")[2])
			end
		}
	}) do
		if not pg.NewStoryMgr.GetInstance():IsPlayed(iter_239_1.name) and iter_239_1.active() then
			arg_239_0:SetBlackboardValue("inGuide", true)

			local function var_239_0()
				arg_239_0:SetBlackboardValue("inGuide", false)
			end

			pg.NewGuideMgr.GetInstance():Play(iter_239_1.name, nil, var_239_0, var_239_0)

			return true
		end
	end

	return false
end

function var_0_0.CheckFavorTrigger(arg_246_0)
	for iter_246_0, iter_246_1 in ipairs({
		{
			triggerId = getDorm3dGameset("drom3d_favir_trigger_onwer")[1],
			active = function()
				local var_247_0 = getProxy(CollectionProxy):getShipGroup(arg_246_0.apartment.configId)

				return tobool(var_247_0)
			end
		},
		{
			triggerId = getDorm3dGameset("drom3d_favir_trigger_propose")[1],
			active = function()
				local var_248_0 = getProxy(CollectionProxy):getShipGroup(arg_246_0.apartment.configId)

				return var_248_0 and var_248_0.married > 0
			end
		}
	}) do
		if arg_246_0.apartment.triggerCountDic[iter_246_1.triggerId] == 0 and iter_246_1.active() then
			arg_246_0:emit(Dorm3dSceneMediator.TRIGGER_FAVOR, arg_246_0.apartment.configId, iter_246_1.triggerId)
		end
	end
end

function var_0_0.CheckEnterDeal(arg_249_0)
	if arg_249_0.contextData.hasEnterCheck then
		return false
	end

	local var_249_0 = "dorm3d_enter_count_" .. arg_249_0.apartment.configId
	local var_249_1 = pg.TimeMgr.GetInstance():CurrentSTimeDesc("%Y/%m/%d")

	if PlayerPrefs.GetString("dorm3d_enter_count_day") ~= var_249_1 then
		PlayerPrefs.SetString("dorm3d_enter_count_day", var_249_1)
		PlayerPrefs.SetInt(var_249_0, 1)
	else
		PlayerPrefs.SetInt(var_249_0, PlayerPrefs.GetInt(var_249_0, 0) + 1)
	end

	local var_249_2 = arg_249_0.apartment:getEnterTalking()

	PlayerPrefs.SetString("DORM3D_DAILY_ENTER", pg.TimeMgr.GetInstance():CurrentSTimeDesc("%Y/%m/%d"))

	if #var_249_2 > 0 then
		arg_249_0:DoTalk(var_249_2[math.random(#var_249_2)])

		return true
	end

	local var_249_3 = arg_249_0.apartment:getZoneConfig(arg_249_0:GetZoneName(), "lazy_action")

	if #var_249_3 > 0 then
		arg_249_0:SetBlackboardValue("inLazy", true)
		arg_249_0:emit(Dorm3dScene.SWITCH_ACTION, var_249_3[3])
	end

	return true
end

function var_0_0.CheckActiveTalk(arg_250_0)
	for iter_250_0, iter_250_1 in ipairs(arg_250_0.apartment:getZoneTalking()) do
		if pg.dorm3d_dialogue_group[iter_250_1].trigger_config == arg_250_0:GetZoneName() then
			arg_250_0:DoTalk(iter_250_1)

			return true
		end
	end

	return false
end

function var_0_0.CheckDistanceTalk(arg_251_0, arg_251_1)
	for iter_251_0, iter_251_1 in ipairs(arg_251_0.apartment:getDistanceTalking()) do
		if pg.dorm3d_dialogue_group[iter_251_1].trigger_config == arg_251_0:GetZoneName() then
			arg_251_0:DoTalk(iter_251_1)

			return
		end
	end
end

function var_0_0.CheckLevelUp(arg_252_0)
	if arg_252_0.apartment.favor >= arg_252_0.apartment:getNextExp() then
		arg_252_0:emit(Dorm3dSceneMediator.FAVOR_LEVEL_UP, arg_252_0.apartment.configId)

		return true
	end

	return false
end

function var_0_0.GetZoneName(arg_253_0)
	return arg_253_0.sceneView:GetAttachedFurnitureName()
end

function var_0_0.GetIKTipsRootTF(arg_254_0)
	return arg_254_0.ikTipsRoot
end

function var_0_0.GetIKHandTF(arg_255_0)
	return arg_255_0.ikHand
end

function var_0_0.TempHideUI(arg_256_0, arg_256_1)
	local var_256_0 = defaultValue(arg_256_0.hideCount, 0)

	arg_256_0.hideCount = var_256_0 + (arg_256_1 and 1 or -1)

	assert(arg_256_0.hideCount >= 0)

	if arg_256_0.hideCount * var_256_0 > 0 then
		return
	end

	if arg_256_0.hideCount > 0 then
		arg_256_0:SetUI("blank")
	else
		arg_256_0:SetUI("back")
	end
end

function var_0_0.onBackPressed(arg_257_0)
	if isActive(arg_257_0.rtLevelUpWindow) then
		triggerButton(arg_257_0.rtLevelUpWindow:Find("bg"))

		return true
	elseif arg_257_0.uiState ~= "base" then
		return true
	end

	return false
end

function var_0_0.OnDestroy(arg_258_0)
	arg_258_0.exited = true

	arg_258_0.cvLoader:Dispose()

	if arg_258_0.tempExtraPanel and isActive(arg_258_0.tempExtraPanel) then
		setActive(rt, false)

		if isActive(pg.NewStoryMgr.GetInstance()._tf) then
			setParent(rt, arg_258_0.rtExtraScreen)
		else
			pg.UIMgr.GetInstance():UnOverlayPanel(rt, arg_258_0.rtExtraScreen)
		end

		arg_258_0.tempExtraPanel = nil
	end

	if arg_258_0.LTs then
		underscore.map(arg_258_0.LTs, function(arg_259_0)
			LeanTween.cancel(arg_259_0)
		end)

		arg_258_0.LTs = nil
	end

	if arg_258_0.sliderLT then
		LeanTween.cancel(arg_258_0.sliderLT)

		arg_258_0.sliderLT = nil
	end

	arg_258_0:SetBlackboardValue("inLockLayer", nil)
	SetCompomentEnabled(arg_258_0.rtMainAI, "BehaviourTreeOwner", false)
	pg.NodeCanvasMgr.GetInstance():Clear()
end

return var_0_0
