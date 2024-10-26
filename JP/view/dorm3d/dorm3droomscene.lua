local var_0_0 = class("Dorm3dRoomScene", import("view.dorm3d.Dorm3dRoomTemplateScene"))

function var_0_0.getUIName(arg_1_0)
	return "Dorm3dMainUI"
end

function var_0_0.SetRoom(arg_2_0, arg_2_1)
	var_0_0.super.SetRoom(arg_2_0, arg_2_1)
	arg_2_0:UpdateContactState()
end

function var_0_0.SetApartment(arg_3_0, arg_3_1)
	arg_3_0.apartment = arg_3_1

	arg_3_0:UpdateFavorDisplay()
end

function var_0_0.init(arg_4_0)
	var_0_0.super.init(arg_4_0)
	Shader.SetGlobalFloat("_ScreenClipOff", 1)

	arg_4_0.uiContianer = arg_4_0._tf:Find("UI")

	local var_4_0 = arg_4_0.uiContianer:Find("base")

	onButton(arg_4_0, var_4_0:Find("btn_back"), function()
		arg_4_0:emit(BaseUI.ON_BACK)
	end, "ui-dorm_back_v2")
	onButton(arg_4_0, var_4_0:Find("btn_back/help"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.help_dorm3d_info.tip
		})
	end, SFX_PANEL)

	arg_4_0.rtFavorLevel = var_4_0:Find("top/favor_level")

	setActive(arg_4_0.rtFavorLevel, arg_4_0.room:isPersonalRoom())
	onButton(arg_4_0, arg_4_0.rtFavorLevel, function()
		local var_7_0 = {}

		arg_4_0:emit(Dorm3dRoomMediator.OPEN_LEVEL_LAYER, {
			apartment = arg_4_0.apartment,
			timeIndex = arg_4_0.contextData.timeIndex,
			baseCamera = arg_4_0.mainCameraTF,
			roomId = arg_4_0.room:GetConfigID()
		})
	end, SFX_PANEL)
	onButton(arg_4_0, var_4_0:Find("left/btn_photograph"), function()
		if #arg_4_0.contextData.groupIds == 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_photo_no_role"))

			return
		end

		local var_8_0, var_8_1 = arg_4_0:CheckSystemOpen("Photo")

		if not var_8_0 then
			pg.TipsMgr.GetInstance():ShowTips(var_8_1)

			return
		end

		if not arg_4_0.apartment then
			local var_8_2 = getProxy(ApartmentProxy):getApartment(arg_4_0.contextData.groupIds[1])

			arg_4_0:SetApartment(var_8_2)
		end

		arg_4_0:OutOfLazy(arg_4_0.apartment:GetConfigID(), function()
			arg_4_0:emit(Dorm3dRoomMediator.OPEN_CAMERA_LAYER, arg_4_0, arg_4_0.apartment:GetConfigID())
		end)
	end, SFX_PANEL)
	onButton(arg_4_0, var_4_0:Find("left/btn_collection"), function()
		local var_10_0, var_10_1 = arg_4_0:CheckSystemOpen("Collection")

		if not var_10_0 then
			pg.TipsMgr.GetInstance():ShowTips(var_10_1)

			return
		end

		setActive(var_4_0:Find("left/btn_collection/tip"), false)
		PlayerPrefs.SetInt("apartment_collection_item", 0)
		PlayerPrefs.SetInt("apartment_collection_recall", 0)
		arg_4_0:emit(Dorm3dRoomMediator.OPEN_COLLECTION_LAYER, arg_4_0.room:GetConfigID())
	end, SFX_PANEL)
	onButton(arg_4_0, var_4_0:Find("left/btn_furniture"), function()
		local var_11_0, var_11_1 = arg_4_0:CheckSystemOpen("Furniture")

		if not var_11_0 then
			pg.TipsMgr.GetInstance():ShowTips(var_11_1)

			return
		end

		arg_4_0:emit(Dorm3dRoomMediator.OPEN_FURNITURE_SELECT, {
			apartment = arg_4_0.apartment
		})
	end, SFX_PANEL)

	if not arg_4_0.room:isPersonalRoom() then
		setActive(var_4_0:Find("left/line_furniture"), false)
		setActive(var_4_0:Find("left/btn_furniture"), false)
	end

	onButton(arg_4_0, var_4_0:Find("left/btn_accompany"), function()
		local var_12_0, var_12_1 = arg_4_0:CheckSystemOpen("Accompany")

		if not var_12_0 then
			pg.TipsMgr.GetInstance():ShowTips(var_12_1)

			return
		end

		local var_12_2 = arg_4_0.apartment:GetConfigID()
		local var_12_3

		arg_4_0:emit(Dorm3dRoomMediator.OPEN_ACCOMPANY_WINDOW, {
			groupId = var_12_2,
			confirmFunc = function(arg_13_0)
				var_12_3 = arg_13_0
			end
		}, function()
			if var_12_3 then
				arg_4_0:OutOfLazy(var_12_2, function()
					arg_4_0:EnterAccompanyMode(var_12_3)
				end)
			else
				arg_4_0:CheckQueue()
			end
		end)
	end, SFX_PANEL)

	if not arg_4_0.room:isPersonalRoom() then
		setActive(var_4_0:Find("left/line_accompany"), false)
		setActive(var_4_0:Find("left/btn_accompany"), false)
	end

	onButton(arg_4_0, var_4_0:Find("left/btn_invite"), function()
		arg_4_0:emit(Dorm3dRoomMediator.OPEN_INVITE_WINDOW, arg_4_0.room:GetConfigID(), underscore.rest(arg_4_0.contextData.groupIds, 1))
	end, SFX_PANEL)

	if arg_4_0.room:isPersonalRoom() then
		setActive(var_4_0:Find("left/line_invite"), false)
		setActive(var_4_0:Find("left/btn_invite"), false)
	end

	arg_4_0.btnZone = var_4_0:Find("right/Zone")
	arg_4_0.rtZoneList = var_4_0:Find("right/Zone/List")

	setActive(arg_4_0.rtZoneList, false)
	onButton(arg_4_0, arg_4_0.btnZone, function()
		setActive(arg_4_0.rtZoneList, not isActive(arg_4_0.rtZoneList))
	end, SFX_PANEL)
	UIItemList.StaticAlign(arg_4_0.rtZoneList, arg_4_0.rtZoneList:GetChild(0), #arg_4_0.zoneDatas, function(arg_18_0, arg_18_1, arg_18_2)
		if arg_18_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_18_1 = arg_18_1 + 1

		local var_18_0 = arg_4_0.zoneDatas[arg_18_1]
		local var_18_1 = var_18_0:GetWatchCameraName()

		arg_18_2.name = var_18_1

		setText(arg_18_2:Find("Name"), var_18_0:GetName())
		setActive(arg_18_2:Find("Line"), arg_18_1 < #arg_4_0.zoneDatas)
		onButton(arg_4_0, arg_18_2, function()
			if arg_4_0.uiState ~= "base" then
				return
			end

			setActive(arg_4_0.rtZoneList, false)

			local var_19_0 = {}

			if arg_4_0.room:isPersonalRoom() and not arg_4_0.ladyDict[arg_4_0.apartment:GetConfigID()]:GetBlackboardValue("inPending") then
				table.insert(var_19_0, function(arg_20_0)
					arg_4_0:OutOfLazy(arg_4_0.apartment:GetConfigID(), arg_20_0)
				end)
			end

			table.insert(var_19_0, function(arg_21_0)
				arg_4_0:ShiftZone(var_18_1, arg_21_0)
			end)
			seriesAsync(var_19_0, function()
				arg_4_0:CheckQueue()
			end)
		end, SFX_PANEL)
	end)

	local var_4_1 = arg_4_0.uiContianer:Find("walk")
	local var_4_2 = arg_4_0.uiContianer:Find("ik")

	onButton(arg_4_0, var_4_2:Find("btn_back"), function()
		if isActive(var_4_2:Find("Panel")) then
			triggerButton(var_4_2:Find("Panel/BG/Close"))

			return
		end

		if arg_4_0.ikSpecialCall then
			local var_23_0 = arg_4_0.ikSpecialCall

			arg_4_0.ikSpecialCall = nil

			existCall(var_23_0)
		else
			arg_4_0:ExitTouchMode()
		end
	end, "ui-dorm_back_v2")
	onButton(arg_4_0, var_4_2:Find("btn_back/help"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("roll_gametip")
		})
	end, SFX_PANEL)
	onButton(arg_4_0, var_4_2:Find("Right/btn_camera"), function()
		arg_4_0:CycleIKCameraGroup()
	end, SFX_PANEL)
	onButton(arg_4_0, var_4_2:Find("Right/MenuSmall"), function()
		setActive(var_4_2:Find("Right/MenuSmall"), false)
		setActive(var_4_2:Find("Right/Menu"), true)
	end, SFX_PANEL)
	onButton(arg_4_0, var_4_2:Find("Right/Menu/Collapse"), function()
		setActive(var_4_2:Find("Right/Menu"), false)
		setActive(var_4_2:Find("Right/MenuSmall"), true)
	end, SFX_PANEL)

	local function var_4_3()
		local var_28_0 = arg_4_0.apartment:GetConfigID()
		local var_28_1 = arg_4_0.ladyDict[var_28_0]
		local var_28_2 = var_28_1.skinIdList
		local var_28_3 = var_28_1.skinId
		local var_28_4 = {}
		local var_28_5 = {}

		_.each(var_28_2, function(arg_29_0)
			if ApartmentProxy.CheckUnlockConfig(pg.dorm3d_resource[arg_29_0].unlock) then
				table.insert(var_28_4, arg_29_0)
			else
				table.insert(var_28_5, arg_29_0)
			end
		end)

		local function var_28_6(arg_30_0, arg_30_1)
			local var_30_0 = arg_30_1 and var_28_4 or var_28_5

			UIItemList.StaticAlign(arg_30_0, arg_30_0:GetChild(0), #var_30_0, function(arg_31_0, arg_31_1, arg_31_2)
				if arg_31_0 ~= UIItemList.EventUpdate then
					return
				end

				local var_31_0 = var_30_0[arg_31_1 + 1]

				setActive(arg_31_2:Find("Selected"), var_31_0 == var_28_3)
				setActive(arg_31_2:Find("Lock"), not arg_30_1)

				if not arg_30_1 then
					setText(arg_31_2:Find("Lock/Bar/Text"), pg.dorm3d_resource[var_31_0].unlock_text)
				end

				arg_4_0.loader:GetSpriteQuiet(string.format("dorm3dselect/apartment_skin_%d", var_31_0), "", arg_31_2:Find("Icon"))
				onButton(arg_4_0, arg_31_2, function()
					if not arg_30_1 then
						local var_32_0, var_32_1 = ApartmentProxy.CheckUnlockConfig(pg.dorm3d_resource[var_31_0].unlock)

						pg.TipsMgr.GetInstance():ShowTips(var_32_1)

						return
					end

					if var_31_0 == var_28_3 then
						return
					end

					local var_32_2 = var_31_0

					seriesAsync({
						function(arg_33_0)
							arg_4_0:SetIKState(false, arg_33_0)
						end,
						function(arg_34_0)
							arg_4_0.SwitchCharacterSkin(var_28_1, var_28_0, var_32_2)
							arg_4_0:SwitchIKConfig(var_28_1, var_28_1.ikConfig.id)
							arg_4_0:SetIKState(true, arg_34_0)
						end,
						var_4_3
					})
				end, SFX_PANEL)
			end)
		end

		var_28_6(var_4_2:Find("Panel/BG/Scroll/Content/Unlock/List"), true)
		var_28_6(var_4_2:Find("Panel/BG/Scroll/Content/Lock/List"), false)
	end

	onButton(arg_4_0, var_4_2:Find("Right/Menu"), function()
		setActive(var_4_2:Find("Right"), false)
		setActive(var_4_2:Find("Panel"), true)
		var_4_3()
	end, SFX_PANEL)
	onButton(arg_4_0, var_4_2:Find("Panel/BG/Close"), function()
		setActive(var_4_2:Find("Panel"), false)
		setActive(var_4_2:Find("Right"), true)
	end, SFX_PANEL)
	setText(var_4_2:Find("Panel/BG/Scroll/Content/Unlock/Title/Text"), i18n("word_unlock"))
	setText(var_4_2:Find("Panel/BG/Scroll/Content/Lock/Title/Text"), i18n("word_lock"))

	arg_4_0.ikTipsRoot = var_4_2:Find("Tips")

	setActive(arg_4_0.ikTipsRoot, false)
	GetOrAddComponent(arg_4_0.ikTipsRoot:GetChild(0), typeof(RectTransform))

	arg_4_0.ikHand = var_4_2:Find("Handler")

	setActive(arg_4_0.ikHand, false)
	eachChild(arg_4_0.ikHand, function(arg_37_0)
		setActive(arg_37_0, false)
	end)

	local var_4_4 = arg_4_0.uiContianer:Find("accompany")

	onButton(arg_4_0, var_4_4:Find("btn_back"), function()
		arg_4_0:ExitAccompanyMode()
	end, "ui-dorm_back_v2")

	arg_4_0.unlockList = {}
	arg_4_0.rtFavorUp = arg_4_0._tf:Find("Toast/favor_up")

	arg_4_0.rtFavorUp:GetComponent("DftAniEvent"):SetEndEvent(function(arg_39_0)
		setActive(arg_4_0.rtFavorUp, false)

		if #arg_4_0.unlockList > 0 then
			setText(arg_4_0.rtFavorUp:Find("Text"), table.remove(arg_4_0.unlockList, 1))
			setActive(arg_4_0.rtFavorUp, true)
		end
	end)
	setActive(arg_4_0.rtFavorUp, false)

	arg_4_0.rtFavorUpDaily = arg_4_0._tf:Find("Toast/favor_up_daily")

	setActive(arg_4_0.rtFavorUpDaily, false)

	arg_4_0.rtStaminaPop = arg_4_0._tf:Find("Toast/stamina")

	local var_4_5 = arg_4_0.rtStaminaPop:GetComponent("DftAniEvent")

	var_4_5:SetTriggerEvent(function(arg_40_0)
		local var_40_0, var_40_1 = getProxy(ApartmentProxy):getStamina()

		setText(arg_4_0.rtStaminaPop:Find("Text"), string.format("%d/%d", var_40_0, var_40_1))
	end)
	var_4_5:SetEndEvent(function(arg_41_0)
		setActive(arg_4_0.rtStaminaPop, false)
	end)
	setActive(arg_4_0.rtStaminaPop, false)

	arg_4_0.rtLevelUpWindow = arg_4_0._tf:Find("LevelUpWindow")

	setActive(arg_4_0.rtLevelUpWindow, false)
	onButton(arg_4_0, arg_4_0.rtLevelUpWindow:Find("bg"), function()
		if arg_4_0.isLock then
			return
		end

		arg_4_0.isLock = true

		quickPlayAnimation(arg_4_0.rtLevelUpWindow, "anim_dorm3d_levelup_out")
		LeanTween.delayedCall(0.2, System.Action(function()
			arg_4_0.isLock = false

			setActive(arg_4_0.rtLevelUpWindow, false)
			pg.UIMgr.GetInstance():UnOverlayPanel(arg_4_0.rtLevelUpWindow, arg_4_0._tf)
			existCall(arg_4_0.levelUpCallback)
		end))
	end, SFX_PANEL)

	local var_4_6 = arg_4_0.uiContianer:Find("watch")

	onButton(arg_4_0, var_4_6:Find("btn_back"), function()
		arg_4_0:ExitWatchMode()
	end, "ui-dorm_back_v2")
	onButton(arg_4_0, var_4_6:Find("btn_back/help"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("roll_gametip")
		})
	end, SFX_PANEL)

	arg_4_0.rtStaminaDisplay = var_4_6:Find("stamina")
	arg_4_0.rtRole = arg_4_0.uiContianer:Find("watch/Role")

	onButton(arg_4_0, arg_4_0.rtRole:Find("Talk"), function()
		local var_46_0 = arg_4_0.ladyDict[arg_4_0.apartment:GetConfigID()].ladyBaseZone
		local var_46_1 = arg_4_0.apartment:getFurnitureTalking(arg_4_0.room:GetConfigID(), var_46_0)

		if #var_46_1 == 0 then
			pg.TipsMgr.GetInstance():ShowTips("without topic")

			return
		end

		arg_4_0:DoTalk(var_46_1[math.random(#var_46_1)], function()
			local var_47_0 = getDorm3dGameset("drom3d_favir_trigger_talk")[1]

			arg_4_0:emit(Dorm3dRoomMediator.TRIGGER_FAVOR, arg_4_0.apartment.configId, var_47_0)
		end)
	end, "ui-dorm_click_v2")
	setText(arg_4_0.rtRole:Find("Talk/bg/Text"), i18n("dorm3d_talk"))
	onButton(arg_4_0, arg_4_0.rtRole:Find("Touch"), function()
		arg_4_0:EnterTouchMode()
	end, "ui-dorm_click_v2")
	setText(arg_4_0.rtRole:Find("Touch/bg/Text"), i18n("dorm3d_touch"))
	onButton(arg_4_0, arg_4_0.rtRole:Find("Gift"), function()
		arg_4_0:emit(arg_4_0.SHOW_BLOCK)
		arg_4_0:ActiveStateCamera("gift", function()
			arg_4_0:emit(arg_4_0.HIDE_BLOCK)
		end)
		arg_4_0:emit(Dorm3dRoomMediator.OPEN_GIFT_LAYER, {
			apartment = arg_4_0.apartment,
			baseCamera = arg_4_0.mainCameraTF
		})
	end, "ui-dorm_click_v2")
	setText(arg_4_0.rtRole:Find("Gift/bg/Text"), i18n("dorm3d_gift"))
	onButton(arg_4_0, arg_4_0.rtRole:Find("MiniGame"), function()
		local var_51_0 = arg_4_0.ladyDict[arg_4_0.apartment:GetConfigID()]
		local var_51_1 = {}

		table.insert(var_51_1, function(arg_52_0)
			arg_4_0:SetAllBlackbloardValue("inLockLayer", true)
			arg_4_0:TempHideUI(true, arg_52_0)
		end)

		if var_51_0.ladyBaseZone ~= "Chair" then
			table.insert(var_51_1, function(arg_53_0)
				arg_4_0:ShiftZone("Chair", arg_53_0)
			end)
		end

		table.insert(var_51_1, function(arg_54_0)
			parallelAsync({
				function(arg_55_0)
					var_51_0:PlaySingleAction("SitStart", arg_55_0)
				end,
				function(arg_56_0)
					arg_4_0:ActiveStateCamera("talk", arg_56_0)
				end
			}, arg_54_0)
		end)
		table.insert(var_51_1, function(arg_57_0)
			pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataMiniGame(1))
			arg_4_0:EnableMiniGameCutIn()
			arg_4_0:emit(Dorm3dRoomMediator.OPEN_MINIGAME_WINDOW, {
				isDorm3d = true
			}, arg_57_0)
		end)
		table.insert(var_51_1, function(arg_58_0)
			arg_4_0:DisableMiniGameCutIn()
			var_51_0:PlaySingleAction("SitEnd", arg_58_0)
		end)
		seriesAsync(var_51_1, function()
			arg_4_0:SetAllBlackbloardValue("inLockLayer", false)
			arg_4_0:TempHideUI(false)
		end)
	end, "ui-dorm_click_v2")
	setText(arg_4_0.rtRole:Find("MiniGame/bg/Text"), i18n("dorm3d_minigame_button1"))
	onButton(arg_4_0, arg_4_0.rtRole:Find("Volleyball"), function()
		arg_4_0:emit(Dorm3dRoomMediator.ENTER_VOLLEYBALL)
	end, "ui-dorm_click_v2")
	setText(arg_4_0.rtRole:Find("Volleyball/bg/Text"), i18n("dorm3d_volleyball_button"))
	onButton(arg_4_0, arg_4_0.rtRole:Find("Performance"), function()
		arg_4_0:PerformanceQueue("DormLvPerformance02", function()
			pg.TipsMgr.GetInstance():ShowTips("完了しました")
		end)
	end, "ui-dorm_click_v2")

	arg_4_0.rtFloatPage = arg_4_0._tf:Find("FloatPage")
	arg_4_0.tplFloat = arg_4_0.rtFloatPage:Find("tpl")

	setActive(arg_4_0.tplFloat, false)

	local var_4_7 = cloneTplTo(arg_4_0.tplFloat, arg_4_0.rtFloatPage, "lady")

	eachChild(var_4_7, function(arg_63_0)
		setActive(arg_63_0, arg_63_0.name == "walk")
	end)

	arg_4_0._joystick = arg_4_0._tf:Find("Stick")

	setActive(arg_4_0._joystick, false)
	arg_4_0._joystick:GetComponent(typeof(SlideController)):SetStickFunc(function(arg_64_0)
		arg_4_0:emit(arg_4_0.ON_STICK_MOVE, arg_64_0)
	end)

	arg_4_0.povLayer = arg_4_0._tf:Find("POVControl")

	setActive(arg_4_0.povLayer, false)
	;(function()
		local var_65_0 = arg_4_0.povLayer:Find("Move"):GetComponent(typeof(SlideController))

		var_65_0:AddBeginDragFunc(function(arg_66_0, arg_66_1)
			arg_4_0:emit(arg_4_0.ON_POV_STICK_MOVE_BEGIN, arg_66_1)
		end)
		var_65_0:SetStickFunc(function(arg_67_0)
			arg_4_0:emit(arg_4_0.ON_POV_STICK_MOVE, arg_67_0)
		end)
		var_65_0:AddDragEndFunc(function(arg_68_0, arg_68_1)
			arg_4_0:emit(arg_4_0.ON_POV_STICK_MOVE_END, arg_68_1)
		end)
		arg_4_0.povLayer:Find("View"):GetComponent(typeof(SlideController)):SetStickFunc(function(arg_69_0)
			arg_4_0:emit(arg_4_0.ON_POV_STICK_VIEW, arg_69_0)
		end)
	end)()

	arg_4_0.ikControlLayer = var_4_2:Find("ControlLayer")

	;(function()
		local var_70_0
		local var_70_1 = arg_4_0.ikControlLayer:GetComponent(typeof(SlideController))

		var_70_1:AddBeginDragFunc(function(arg_71_0, arg_71_1)
			local var_71_0 = arg_4_0.ladyDict[arg_4_0.apartment:GetConfigID()]
			local var_71_1 = arg_71_1.position
			local var_71_2 = CameraMgr.instance:Raycast(arg_4_0.sceneRaycaster, var_71_1)

			if var_71_2.Length ~= 0 then
				local var_71_3 = var_71_2[0].gameObject.transform
				local var_71_4 = table.keyof(var_71_0.ladyColliders, var_71_3)

				if var_71_4 then
					arg_4_0:emit(var_0_0.ON_BEGIN_DRAG_CHARACTER_BODY, var_71_0, var_71_4, var_71_1)

					var_70_0 = tobool(var_71_0.ikHandler)

					return
				end
			end
		end)
		var_70_1:AddDragFunc(function(arg_72_0, arg_72_1)
			local var_72_0 = arg_72_1.position
			local var_72_1 = arg_4_0.ladyDict[arg_4_0.apartment:GetConfigID()]

			if var_72_1.ikHandler then
				var_72_1:emit(var_0_0.ON_DRAG_CHARACTER_BODY, var_72_1, var_72_0)

				return
			end

			if var_70_0 then
				return
			end

			local var_72_2 = arg_72_1.delta

			arg_4_0:emit(arg_4_0.ON_STICK_MOVE, var_72_2)
		end)
		var_70_1:AddDragEndFunc(function(arg_73_0, arg_73_1)
			var_70_0 = nil

			local var_73_0 = arg_4_0.ladyDict[arg_4_0.apartment:GetConfigID()]

			if var_73_0.ikHandler then
				var_73_0:emit(var_0_0.ON_RELEASE_CHARACTER_BODY, var_73_0)

				return
			end
		end)
	end)()

	arg_4_0.rtExtraScreen = arg_4_0._tf:Find("ExtraScreen")
	arg_4_0.rtTouchGamePanel = arg_4_0.rtExtraScreen:Find("TouchGame")
	arg_4_0.rtTimelineScreen = arg_4_0.rtExtraScreen:Find("TimelineScreen")

	onButton(arg_4_0, arg_4_0.rtTimelineScreen:Find("btn_skip"), function()
		existCall(arg_4_0.timelineFinishCall)
	end, SFX_CANCEL)

	arg_4_0.uiStack = {}
	arg_4_0.uiStore = {}
end

function var_0_0.BindEvent(arg_75_0)
	var_0_0.super.BindEvent(arg_75_0)
	arg_75_0:bind(arg_75_0.CLICK_CHARACTER, function(arg_76_0, arg_76_1)
		if arg_75_0.uiState ~= "base" or not arg_75_0.ladyDict[arg_76_1].nowCanWatchState then
			return
		end

		local var_76_0 = {}
		local var_76_1 = arg_75_0.ladyDict[arg_76_1]

		if var_76_1:GetBlackboardValue("inPending") then
			table.insert(var_76_0, function(arg_77_0)
				var_76_1:OutOfPending(arg_76_1, arg_77_0)
			end)
		else
			table.insert(var_76_0, function(arg_78_0)
				arg_75_0:OutOfLazy(arg_76_1, arg_78_0)
			end)
		end

		seriesAsync(var_76_0, function()
			if not arg_75_0.room:isPersonalRoom() then
				arg_75_0:SetApartment(getProxy(ApartmentProxy):getApartment(arg_76_1))
			end

			arg_75_0:EnterWatchMode()
		end)
		pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_touch_v1")
	end)
	arg_75_0:bind(arg_75_0.CLICK_CONTACT, function(arg_80_0, arg_80_1)
		arg_75_0:TriggerContact(arg_80_1)
	end)
	arg_75_0:bind(arg_75_0.DISTANCE_TRIGGER, function(arg_81_0, arg_81_1, arg_81_2)
		if arg_75_0.uiState == "base" then
			arg_75_0:CheckDistanceTalk(arg_81_1, arg_81_2)
		end
	end)
	arg_75_0:bind(arg_75_0.WALK_DISTANCE_TRIGGER, function(arg_82_0, arg_82_1, arg_82_2)
		if arg_75_0.apartment and arg_75_0.apartment:GetConfigID() == arg_82_1 then
			existCall(arg_75_0.walkNearCallback, arg_82_2)
		end
	end)
	arg_75_0:bind(arg_75_0.CHANGE_WATCH, function(arg_83_0, arg_83_1)
		arg_75_0.ladyDict[arg_83_1]:ChangeCanWatchState()
	end)
	arg_75_0:bind(arg_75_0.ON_TOUCH_CHARACTER, function(arg_84_0, arg_84_1)
		if not arg_75_0.ladyDict[arg_75_0.apartment:GetConfigID()]:GetBlackboardValue("inIK") then
			return
		end

		arg_75_0:OnTouchCharacterBody(arg_84_1)
	end)
	arg_75_0:bind(arg_75_0.ON_IK_STATUS_CHANGED, function(arg_85_0, arg_85_1, arg_85_2)
		if not arg_75_0.ladyDict[arg_75_0.apartment:GetConfigID()]:GetBlackboardValue("inTouching") then
			return
		end

		arg_75_0:DoTouch(arg_85_1, arg_85_2)
	end)
	arg_75_0:bind(arg_75_0.ON_ENTER_SECTOR, function(arg_86_0, arg_86_1)
		arg_75_0.ladyDict[arg_86_1]:ChangeCanWatchState()
	end)
	arg_75_0:bind(arg_75_0.ON_CHANGE_DISTANCE, function(arg_87_0, arg_87_1, arg_87_2)
		arg_75_0.ladyDict[arg_87_1]:ChangeCanWatchState()
	end)
end

function var_0_0.didEnter(arg_88_0)
	var_0_0.super.didEnter(arg_88_0)
	arg_88_0:UpdateZoneList()

	arg_88_0.resumeCallback = arg_88_0.contextData.resumeCallback
	arg_88_0.contextData.resumeCallback = nil

	arg_88_0:SetUI(function()
		arg_88_0:didEnterCheck()
	end, "base")
end

function var_0_0.FinishEnterResume(arg_90_0)
	if not arg_90_0.resumeCallback then
		return
	end

	local var_90_0 = arg_90_0.resumeCallback

	arg_90_0.resumeCallback = nil

	return var_90_0()
end

function var_0_0.EnableJoystick(arg_91_0, arg_91_1)
	setActive(arg_91_0._joystick, arg_91_1)
end

function var_0_0.EnablePOVLayer(arg_92_0, arg_92_1)
	setActive(arg_92_0.povLayer, arg_92_1)

	if not arg_92_1 then
		arg_92_0:emit(arg_92_0.ON_POV_STICK_MOVE_END)
	end
end

function var_0_0.SetUIStore(arg_93_0, arg_93_1, ...)
	table.insertto(arg_93_0.uiStore, {
		...
	})
	existCall(arg_93_1)
end

function var_0_0.SetUI(arg_94_0, arg_94_1, ...)
	while rawget(arg_94_0, "class") ~= var_0_0 do
		arg_94_0 = getmetatable(arg_94_0).__index
	end

	table.insertto(arg_94_0.uiStore, {
		...
	})

	for iter_94_0, iter_94_1 in ipairs(arg_94_0.uiStore) do
		if iter_94_1 == "back" then
			assert(#arg_94_0.uiStack > 0)

			arg_94_0.uiState = table.remove(arg_94_0.uiStack)
		elseif iter_94_1 == arg_94_0.uiState and iter_94_1 == "ik" then
			-- block empty
		else
			table.insert(arg_94_0.uiStack, arg_94_0.uiState)

			arg_94_0.uiState = iter_94_1
		end
	end

	arg_94_0.uiStore = {}

	eachChild(arg_94_0.uiContianer, function(arg_95_0)
		setActive(arg_95_0, arg_95_0.name == arg_94_0.uiState)
	end)
	arg_94_0:EnablePOVLayer(arg_94_0.uiState == "base" or arg_94_0.uiState == "walk")
	arg_94_0:TempHideContact(arg_94_0.uiState ~= "base")
	arg_94_0:SetFloatEnable(arg_94_0.uiState == "walk")
	setActive(arg_94_0.rtFloatPage, arg_94_0.uiState == "walk")
	switch(arg_94_0.uiState, {
		base = function()
			if not arg_94_0.room:isPersonalRoom() then
				arg_94_0:SetApartment(nil)
			end

			arg_94_0:UpdateBtnState()
		end,
		watch = function()
			eachChild(arg_94_0.rtRole, function(arg_98_0)
				setActive(arg_98_0, false)
			end)

			local var_97_0 = underscore.filter({
				"Talk",
				"Touch",
				"Gift",
				"MiniGame",
				"Volleyball",
				"Performance"
			}, function(arg_99_0)
				return arg_94_0:CheckSystemOpen(arg_99_0)
			end)
			local var_97_1 = 0.05

			for iter_97_0, iter_97_1 in ipairs(var_97_0) do
				LeanTween.delayedCall(var_97_1, System.Action(function()
					setActive(arg_94_0.rtRole:Find(iter_97_1), true)
				end))

				var_97_1 = var_97_1 + 0.066
			end

			setActive(arg_94_0.rtRole:Find("Gift/bg/Tip"), Dorm3dGift.NeedViewTip(arg_94_0.apartment:GetConfigID()))
		end,
		ik = function()
			setActive(arg_94_0.uiContianer:Find("ik/Right/MenuSmall"), arg_94_0.room:isPersonalRoom())
			setActive(arg_94_0.uiContianer:Find("ik/Right/Menu"), false)
		end,
		walk = function()
			setText(arg_94_0.uiContianer:Find("walk/dialogue/content"), i18n("dorm3d_removable", arg_94_0.apartment:getConfig("name")))
		end
	})
	arg_94_0:ActiveStateCamera(arg_94_0.uiState, function()
		if arg_94_1 then
			arg_94_1()
		elseif arg_94_0.uiState == "base" then
			arg_94_0:CheckQueue()
		end
	end)
end

function var_0_0.EnterWatchMode(arg_104_0, arg_104_1)
	local var_104_0 = arg_104_0.apartment:GetConfigID()

	seriesAsync({
		function(arg_105_0)
			arg_104_0:emit(arg_104_0.SHOW_BLOCK)
			arg_104_0.ladyDict[var_104_0]:SetBlackboardValue("inWatchMode", true)
			arg_104_0:SetUI(arg_105_0, "watch")
		end,
		function(arg_106_0)
			arg_104_0:emit(arg_104_0.HIDE_BLOCK)
		end
	})
end

function var_0_0.ExitWatchMode(arg_107_0)
	local var_107_0 = arg_107_0.apartment:GetConfigID()

	seriesAsync({
		function(arg_108_0)
			arg_107_0:emit(arg_107_0.SHOW_BLOCK)
			arg_107_0:SetUI(arg_108_0, "back")
		end,
		function(arg_109_0)
			arg_107_0.ladyDict[var_107_0]:SetBlackboardValue("inWatchMode", false)
			arg_107_0:emit(arg_107_0.HIDE_BLOCK)
			arg_107_0:CheckQueue()
		end
	})
end

function var_0_0.SetInPending(arg_110_0, arg_110_1)
	local var_110_0 = arg_110_0:GetBlackboardValue("groupId")
	local var_110_1 = pg.dorm3d_welcome[arg_110_1]

	arg_110_0:SetBlackboardValue("inPending", true)
	arg_110_0:ChangeCanWatchState()
	arg_110_0:EnableHeadIK(false)

	arg_110_0.contextData.ladyZone[var_110_0] = var_110_1.area
	arg_110_0.ladyBaseZone = arg_110_0.contextData.ladyZone[var_110_0]
	arg_110_0.ladyActiveZone = var_110_1.welcome_staypoint

	arg_110_0:ChangeCharacterPosition()

	if var_110_1.item_shield ~= "" then
		arg_110_0.hideItemDic = {}

		for iter_110_0, iter_110_1 in ipairs(var_110_1.item_shield) do
			local var_110_2 = arg_110_0.modelRoot:Find(iter_110_1)

			if not var_110_2 then
				warning(string.format("welcome:%d without hide item:%s", arg_110_1, iter_110_1))
			else
				arg_110_0.hideItemDic[iter_110_1] = isActive(var_110_2)

				setActive(var_110_2, false)
			end
		end
	end

	onNextTick(function()
		if arg_110_0.tfPendintItem then
			setActive(arg_110_0.tfPendintItem, true)
		end

		arg_110_0:SwitchAnim(var_110_1.welcome_idle)
	end)

	arg_110_0.wakeUpTalkId = var_110_1.welcome_talk
end

function var_0_0.SetOutPending(arg_112_0)
	arg_112_0:SetBlackboardValue("inPending", false)
	arg_112_0:ChangeCanWatchState()
	arg_112_0:EnableHeadIK(true)

	arg_112_0.wakeUpTalkId = nil

	if arg_112_0.tfPendintItem then
		setActive(arg_112_0.tfPendintItem, false)
	end

	if arg_112_0.hideItemDic then
		for iter_112_0, iter_112_1 in pairs(arg_112_0.hideItemDic) do
			setActive(arg_112_0.modelRoot:Find(iter_112_0), iter_112_1)
		end

		arg_112_0.hideItemDic = nil
	end
end

function var_0_0.IsModeInHidePending(arg_113_0, arg_113_1)
	for iter_113_0, iter_113_1 in pairs(arg_113_0.ladyDict) do
		if iter_113_1.hideItemDic and iter_113_1.hideItemDic[arg_113_1] ~= nil then
			return true
		end
	end

	return false
end

function var_0_0.EnterAccompanyMode(arg_114_0, arg_114_1)
	local var_114_0 = pg.dorm3d_accompany[arg_114_1]
	local var_114_1
	local var_114_2

	if var_114_0.sceneInfo ~= "" then
		var_114_1, var_114_2 = unpack(string.split(var_114_0.sceneInfo, "|"))
	end

	local var_114_3 = {
		type = "timeline",
		name = var_114_0.timeline,
		scene = var_114_1,
		sceneRoot = var_114_2,
		accompanys = {}
	}

	for iter_114_0, iter_114_1 in ipairs(var_114_0.jump_trigger) do
		local var_114_4, var_114_5 = unpack(iter_114_1)

		var_114_3.accompanys[var_114_4] = var_114_5
	end

	local var_114_6, var_114_7 = unpack(var_114_0.favor)

	getProxy(ApartmentProxy):RecordAccompanyTime()
	pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataAccompany(1, var_114_0.ship_id, var_114_0.performance_time, 0, var_114_1 or arg_114_0.artSceneInfo))

	local var_114_8 = {}

	table.insert(var_114_8, function(arg_115_0)
		arg_114_0:SetUI(arg_115_0, "blank", "accompany")
	end)
	table.insert(var_114_8, function(arg_116_0)
		arg_114_0.accompanyFavorCount = 0
		arg_114_0.accompanyFavorTimer = Timer.New(function()
			arg_114_0.accompanyFavorCount = arg_114_0.accompanyFavorCount + 1
		end, var_114_6, -1)

		arg_114_0.accompanyFavorTimer:Start()

		arg_114_0.accompanyPerformanceTimer = Timer.New(function()
			arg_114_0.canTriggerAccompanyPerformance = true

			warning(arg_114_0.canTriggerAccompanyPerformance)
		end, var_114_0.performance_time, -1)

		arg_114_0.accompanyPerformanceTimer:Start()
		arg_114_0:PlayTimeline(var_114_3, function(arg_119_0, arg_119_1)
			arg_119_1()
			arg_116_0()
		end)
	end)
	seriesAsync(var_114_8, function()
		assert(arg_114_0.accompanyFavorTimer)
		arg_114_0.accompanyFavorTimer:Stop()

		arg_114_0.accompanyFavorTimer = nil

		assert(arg_114_0.accompanyPerformanceTimer)
		arg_114_0.accompanyPerformanceTimer:Stop()

		arg_114_0.accompanyPerformanceTimer = nil
		arg_114_0.canTriggerAccompanyPerformance = nil

		local var_120_0 = math.min(arg_114_0.accompanyFavorCount, getProxy(ApartmentProxy):getStamina())

		if var_120_0 > 0 then
			local var_120_1 = var_114_7[var_120_0]

			warning(var_120_1)
			arg_114_0:emit(Dorm3dRoomMediator.TRIGGER_FAVOR, arg_114_0.apartment.configId, var_120_1)
		end

		local var_120_2 = 0
		local var_120_3 = getProxy(ApartmentProxy):GetAccompanyTime()

		if var_120_3 then
			var_120_2 = pg.TimeMgr.GetInstance():GetServerTime() - var_120_3
		end

		pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataAccompany(2, var_114_0.ship_id, var_114_0.performance_time, var_120_2, var_114_1 or arg_114_0.artSceneInfo))
		arg_114_0:SetUI(nil, "back", "back")
	end)
end

function var_0_0.ExitAccompanyMode(arg_121_0)
	existCall(arg_121_0.timelineFinishCall)
end

function var_0_0.EnterTouchMode(arg_122_0)
	if arg_122_0.ladyDict[arg_122_0.apartment:GetConfigID()]:GetBlackboardValue("inTouching") then
		return
	end

	local var_122_0 = arg_122_0.ladyDict[arg_122_0.apartment:GetConfigID()]
	local var_122_1 = arg_122_0.room:getApartmentZoneConfig(var_122_0.ladyBaseZone, "touch_id", arg_122_0.apartment:GetConfigID())

	arg_122_0.touchConfig = var_122_1 and pg.dorm3d_touch_data[var_122_1] or nil
	arg_122_0.inTouchGame = arg_122_0.touchConfig.heartbeat_enable > 0

	setActive(arg_122_0.rtTouchGamePanel, arg_122_0.inTouchGame)

	if arg_122_0.inTouchGame then
		arg_122_0.touchCount = 0
		arg_122_0.lastCount = 0
		arg_122_0.topCount = 0

		arg_122_0:UpdateTouchGameDisplay()
		setSlider(arg_122_0.rtTouchGamePanel:Find("slider"), 0, 100, arg_122_0.touchCount >= 500 and 100 or arg_122_0.touchCount % 100)
		quickPlayAnimation(arg_122_0.rtTouchGamePanel, "anim_dorm3d_touch_in")
		quickPlayAnimation(arg_122_0.rtTouchGamePanel:Find("slider/icon"), "anim_dorm3d_touch_icon")

		arg_122_0.downTimer = Timer.New(function()
			if not arg_122_0.ladyDict[arg_122_0.apartment:GetConfigID()]:GetBlackboardValue("inTalking") then
				arg_122_0:UpdateTouchCount(-2)
			end
		end, 1, -1)

		arg_122_0.downTimer:Start()
	end

	local var_122_2 = {}

	table.insert(var_122_2, function(arg_124_0)
		var_122_0:SetBlackboardValue("inTouching", true)
		arg_122_0:emit(arg_122_0.SHOW_BLOCK)
		arg_122_0:SetUI(arg_124_0, "blank")
	end)
	table.insert(var_122_2, function(arg_125_0)
		local var_125_0 = arg_122_0.inTouchGame and math.floor(arg_122_0.touchCount / 100) or 0
		local var_125_1 = arg_122_0.touchConfig.ik_status[var_125_0 + 1]

		arg_122_0:SwitchIKConfig(var_122_0, var_125_1)
		setActive(arg_122_0.uiContianer:Find("ik/btn_back"), true)
		arg_122_0:SetIKState(true, arg_125_0)
	end)
	table.insert(var_122_2, function(arg_126_0)
		existCall(arg_126_0)
	end)
	seriesAsync(var_122_2, function()
		Shader.SetGlobalFloat("_ScreenClipOff", 0)
		arg_122_0:emit(arg_122_0.HIDE_BLOCK)
	end)
end

function var_0_0.ExitTouchMode(arg_128_0)
	local var_128_0 = arg_128_0.ladyDict[arg_128_0.apartment:GetConfigID()]

	if not var_128_0:GetBlackboardValue("inTouching") then
		return
	end

	local var_128_1 = {}

	if arg_128_0.inTouchGame then
		table.insert(var_128_1, function(arg_129_0)
			arg_128_0:emit(arg_128_0.SHOW_BLOCK)
			quickPlayAnimation(arg_128_0.rtTouchGamePanel, "anim_dorm3d_touch_out")
			onDelayTick(arg_129_0, 0.5)
		end)
		table.insert(var_128_1, function(arg_130_0)
			local var_130_0 = 0

			for iter_130_0, iter_130_1 in ipairs(arg_128_0.touchConfig.heartbeat_favor) do
				if iter_130_1[1] > arg_128_0.topCount then
					break
				else
					var_130_0 = iter_130_1[2]
				end
			end

			if var_130_0 > 0 then
				arg_128_0:emit(Dorm3dRoomMediator.TRIGGER_FAVOR, arg_128_0.apartment.configId, var_130_0)
			end

			arg_128_0.touchCount = nil
			arg_128_0.topCount = nil

			if arg_128_0.downTimer then
				arg_128_0.downTimer:Stop()

				arg_128_0.downTimer = nil
			end

			arg_128_0.inTouchGame = false

			setActive(arg_128_0.rtTouchGamePanel, false)
			Shader.SetGlobalFloat("_ScreenClipOff", 1)
			arg_130_0()
		end)
	else
		table.insert(var_128_1, function(arg_131_0)
			arg_128_0:emit(arg_128_0.SHOW_BLOCK)

			local var_131_0 = arg_128_0.touchConfig.default_favor

			if var_131_0 > 0 then
				arg_128_0:emit(Dorm3dRoomMediator.TRIGGER_FAVOR, arg_128_0.apartment.configId, var_131_0)
			end

			Shader.SetGlobalFloat("_ScreenClipOff", 1)
			arg_131_0()
		end)
	end

	table.insert(var_128_1, function(arg_132_0)
		var_128_0.ikConfig = {
			character_position = var_128_0.ladyBaseZone,
			character_action = arg_128_0.touchConfig.finish_action
		}

		arg_128_0:SetIKState(false, arg_132_0)
	end)
	table.insert(var_128_1, function(arg_133_0)
		var_128_0.ikConfig = nil
		arg_128_0.blockIK = nil

		arg_128_0:SetUI(arg_133_0, "back")
	end)
	seriesAsync(var_128_1, function()
		var_128_0:SetBlackboardValue("inTouching", false)
		arg_128_0:emit(arg_128_0.HIDE_BLOCK)

		arg_128_0.touchConfig = nil
		arg_128_0.blockIK = nil

		local var_134_0 = arg_128_0.touchExitCall

		arg_128_0.touchExitCall = nil

		existCall(var_134_0)
	end)
end

function var_0_0.ChangeWalkScene(arg_135_0, arg_135_1, arg_135_2)
	local var_135_0 = arg_135_0.ladyDict[arg_135_0.apartment:GetConfigID()]

	seriesAsync({
		function(arg_136_0)
			arg_135_0:ChangeArtScene(arg_135_1, arg_136_0)
		end,
		function(arg_137_0)
			var_135_0:ChangeSubScene(arg_135_1, arg_137_0)
		end,
		function(arg_138_0)
			arg_135_0:emit(arg_135_0.SHOW_BLOCK)

			if arg_135_1 == arg_135_0.sceneInfo then
				arg_135_0:SetUI(arg_138_0, "back")
			elseif arg_135_0.uiState ~= "walk" then
				arg_135_0:SetUI(arg_138_0, "walk")
			else
				arg_138_0()
			end
		end
	}, function()
		arg_135_0:emit(arg_135_0.HIDE_BLOCK)
		var_135_0:SetBlackboardValue("inWalk", arg_135_1 ~= arg_135_0.sceneInfo)
		existCall(arg_135_2)
	end)
end

function var_0_0.EnterWalkMode(arg_140_0)
	local var_140_0 = arg_140_0.apartment:GetConfigID()
	local var_140_1 = arg_140_0.ladyDict[var_140_0]

	seriesAsync({
		function(arg_141_0)
			arg_140_0:emit(arg_140_0.SHOW_BLOCK)
			arg_140_0:HideCharacter(var_140_0)
			var_140_1:SetBlackboardValue("inWalk", true)
			arg_140_0:SetUI(arg_141_0, "walk")
		end,
		function(arg_142_0)
			arg_140_0:emit(arg_140_0.HIDE_BLOCK)
			arg_140_0:ChangeArtScene(arg_140_0.walkInfo.scene .. "|" .. arg_140_0.walkInfo.sceneRoot, arg_142_0)
		end,
		function(arg_143_0)
			arg_140_0:LoadSubScene(arg_140_0.walkInfo, arg_143_0)
		end
	}, function()
		return
	end)
end

function var_0_0.ExitWalkMode(arg_145_0)
	local var_145_0 = arg_145_0.apartment:GetConfigID()
	local var_145_1 = arg_145_0.ladyDict[var_145_0]

	seriesAsync({
		function(arg_146_0)
			arg_145_0:ChangeArtScene(arg_145_0.walkLastSceneInfo, arg_146_0)
		end,
		function(arg_147_0)
			arg_145_0:UnloadSubScene(arg_145_0.walkInfo, arg_147_0)
		end,
		function(arg_148_0)
			arg_145_0:emit(arg_145_0.SHOW_BLOCK)
			arg_145_0:SetUI(arg_148_0, "back")
		end
	}, function()
		arg_145_0:emit(arg_145_0.HIDE_BLOCK)
		arg_145_0:RevertCharacter(var_145_0)
		var_145_1:SetBlackboardValue("inWalk", false)

		local var_149_0 = arg_145_0.walkExitCall

		arg_145_0.walkExitCall = nil
		arg_145_0.walkLastSceneInfo = nil
		arg_145_0.walkInfo = nil

		existCall(var_149_0)
	end)
end

function var_0_0.EnableMiniGameCutIn(arg_150_0)
	if not arg_150_0.tfCutIn then
		return
	end

	local var_150_0 = arg_150_0.rtExtraScreen:Find("MiniGameCutIn")

	setActive(var_150_0, true)

	local var_150_1 = GetOrAddComponent(var_150_0:Find("bg/mask/cut_in"), "CameraRTUI")

	setActive(var_150_1, true)
	pg.CameraRTMgr.GetInstance():Bind(var_150_1, arg_150_0.tfCutIn:Find("TestCamera"):GetComponent(typeof(Camera)))
	quickPlayAnimator(arg_150_0.modelCutIn.lady, "Idle")
	quickPlayAnimator(arg_150_0.modelCutIn.player, "Idle")
	setActive(arg_150_0.tfCutIn, true)
end

function var_0_0.DisableMiniGameCutIn(arg_151_0)
	if not arg_151_0.tfCutIn then
		return
	end

	local var_151_0 = arg_151_0.rtExtraScreen:Find("MiniGameCutIn")
	local var_151_1 = GetOrAddComponent(var_151_0:Find("bg/mask/cut_in"), "CameraRTUI")

	pg.CameraRTMgr.GetInstance():Clean(var_151_1)
	setActive(var_151_0, false)
	setActive(arg_151_0.tfCutIn, false)
end

function var_0_0.SwitchIKConfig(arg_152_0, arg_152_1, arg_152_2)
	local var_152_0 = pg.dorm3d_ik_status[arg_152_2]

	if var_152_0.skin_id ~= arg_152_1.skinId then
		local var_152_1 = pg.dorm3d_ik_status.get_id_list_by_base[var_152_0.base]
		local var_152_2 = _.detect(var_152_1, function(arg_153_0)
			return pg.dorm3d_ik_status[arg_153_0].skin_id == arg_152_1.skinId
		end)

		assert(var_152_2, string.format("Missing Status Config By Skin: %s original Status: %s", arg_152_1.skinId, arg_152_2))

		var_152_0 = pg.dorm3d_ik_status[var_152_2]
	end

	arg_152_1.ikConfig = var_152_0
end

function var_0_0.SetIKState(arg_154_0, arg_154_1, arg_154_2)
	local var_154_0 = arg_154_0.ladyDict[arg_154_0.apartment:GetConfigID()]
	local var_154_1 = {}

	if arg_154_1 then
		table.insert(var_154_1, function(arg_155_0)
			var_154_0:SetBlackboardValue("inIK", true)
			arg_154_0:emit(arg_154_0.SHOW_BLOCK)

			local var_155_0 = var_154_0.ikConfig.camera_group

			setActive(arg_154_0.uiContianer:Find("ik/Right/btn_camera"), #pg.dorm3d_ik_status.get_id_list_by_camera_group[var_155_0] > 1)
			arg_155_0()
		end)

		if arg_154_0.uiState ~= "ik" then
			table.insert(var_154_1, function(arg_156_0)
				arg_154_0:SetUI(arg_156_0, "ik")
			end)
		end

		table.insert(var_154_1, function(arg_157_0)
			Shader.SetGlobalFloat("_ScreenClipOff", 0)
			arg_154_0.SetIKStatus(var_154_0, var_154_0.ikConfig, arg_157_0)
		end)
		table.insert(var_154_1, function(arg_158_0)
			arg_154_0:emit(arg_154_0.HIDE_BLOCK)
			arg_158_0()
		end)
	else
		assert(arg_154_0.uiState == "ik")
		table.insert(var_154_1, function(arg_159_0)
			arg_154_0:emit(arg_154_0.SHOW_BLOCK)
			Shader.SetGlobalFloat("_ScreenClipOff", 1)
			arg_159_0()
		end)

		local var_154_2 = var_154_0.skinIdList

		if var_154_0.skinId ~= var_154_2[1] then
			table.insert(var_154_1, function(arg_160_0)
				local var_160_0 = arg_154_0.apartment:GetConfigID()

				arg_154_0.SwitchCharacterSkin(var_154_0, var_160_0, var_154_2[1], arg_160_0)
			end)
		end

		table.insert(var_154_1, function(arg_161_0)
			warning(var_154_0.ikConfig.character_action)
			var_154_0:ExitIKStatus(var_154_0.ikConfig, arg_161_0)
		end)
		table.insert(var_154_1, function(arg_162_0)
			arg_154_0:SetUI(arg_162_0, "back")
		end)
		table.insert(var_154_1, function(arg_163_0)
			var_154_0:SetBlackboardValue("inIK", false)
			arg_154_0:emit(arg_154_0.HIDE_BLOCK)
			arg_163_0()
		end)
	end

	seriesAsync(var_154_1, arg_154_2)
end

function var_0_0.TouchModeAction(arg_164_0, arg_164_1, arg_164_2, ...)
	return switch(arg_164_2, {
		function(arg_165_0, arg_165_1)
			return function(arg_166_0)
				seriesAsync({
					function(arg_167_0)
						arg_164_0.RevertAllIKLayer(arg_164_1, 0, arg_167_0)
					end,
					function(arg_168_0)
						if not arg_165_1 or arg_165_1 == "" then
							return arg_168_0()
						end

						arg_164_0:PlaySingleAction(arg_165_1, arg_168_0)
					end,
					function(arg_169_0)
						arg_164_0:SwitchIKConfig(arg_164_1, arg_165_0)
						arg_164_0:SetIKState(true, arg_169_0)
					end,
					arg_166_0
				})
			end
		end,
		function()
			return function()
				if arg_164_0.ikSpecialCall then
					local var_171_0 = arg_164_0.ikSpecialCall

					arg_164_0.ikSpecialCall = nil

					existCall(var_171_0)
				else
					arg_164_0:ExitTouchMode()
				end
			end
		end,
		function(arg_172_0, arg_172_1)
			return function(arg_173_0)
				arg_164_0.RevertAllIKLayer(arg_164_1, arg_172_0, function()
					arg_164_0:PlaySingleAction(arg_172_1, arg_173_0)
				end)
			end
		end,
		function(arg_175_0, arg_175_1, arg_175_2)
			return function(arg_176_0)
				seriesAsync({
					function(arg_177_0)
						arg_164_0.RevertAllIKLayer(arg_164_1, arg_175_0, arg_177_0)
					end,
					function(arg_178_0)
						arg_164_0:DoTalk(arg_175_1, arg_178_0)
					end,
					function(arg_179_0)
						if not arg_175_2 or arg_175_2 == 0 then
							return arg_179_0()
						end

						arg_164_0:SwitchIKConfig(arg_164_1, arg_175_2)
						arg_164_0:SetIKState(true, arg_179_0)
					end,
					arg_176_0
				})
			end
		end
	}, function()
		return function()
			return
		end
	end, ...)
end

function var_0_0.OnTriggerIK(arg_182_0, arg_182_1)
	local var_182_0 = arg_182_0.ladyDict[arg_182_0.apartment:GetConfigID()]

	if not var_182_0.ikConfig then
		return
	end

	for iter_182_0, iter_182_1 in ipairs(var_182_0.ikConfig.ik_id) do
		local var_182_1, var_182_2, var_182_3 = unpack(iter_182_1)

		if var_182_1 == arg_182_1 then
			arg_182_0.blockIK = true

			arg_182_0:TouchModeAction(var_182_0, unpack(var_182_3))(function()
				arg_182_0.enableIKTip = true

				arg_182_0:ResetIKTipTimer()

				arg_182_0.blockIK = nil
			end)

			return
		end
	end

	assert(false, string.format("Missing %s callback in status %s", arg_182_1, var_182_0.ikConfig.id))
end

function var_0_0.OnTouchCharacterBody(arg_184_0, arg_184_1)
	local var_184_0 = arg_184_0.ladyDict[arg_184_0.apartment:GetConfigID()]

	if not var_184_0.ikConfig then
		return
	end

	for iter_184_0, iter_184_1 in ipairs(var_184_0.ikConfig.touch_data) do
		local var_184_1, var_184_2, var_184_3 = unpack(iter_184_1)
		local var_184_4 = pg.dorm3d_ik_touch[var_184_1]

		if var_184_4.body == arg_184_1 then
			local var_184_5 = var_184_4.action_emote

			if #var_184_5 > 0 then
				var_184_0:PlayFaceAnim(var_184_5)
			end

			local var_184_6 = var_184_4.vibrate

			if type(var_184_6) == "table" and VibrateMgr.Instance:IsSupport() then
				local var_184_7 = {}
				local var_184_8 = {}
				local var_184_9 = {}

				underscore.each(var_184_6, function(arg_185_0)
					table.insert(var_184_7, arg_185_0[1])
					table.insert(var_184_8, arg_185_0[2])
					table.insert(var_184_9, 1)
				end)

				if PLATFORM == PLATFORM_ANDROID then
					VibrateMgr.Instance:VibrateWaveform(var_184_7, var_184_8)
				elseif PLATFORM == PLATFORM_ANDROID then
					VibrateMgr.Instance:VibrateWaveform(var_184_7, var_184_8, var_184_9)
				end
			end

			arg_184_0.blockIK = true

			arg_184_0:TouchModeAction(var_184_0, unpack(var_184_3))(function()
				arg_184_0.enableIKTip = true

				arg_184_0:ResetIKTipTimer()

				arg_184_0.blockIK = nil
			end)

			return
		end
	end
end

function var_0_0.UpdateTouchGameDisplay(arg_187_0)
	setActive(arg_187_0.rtTouchGamePanel:Find("effect_bg"), arg_187_0.touchCount > 100)
	setActive(arg_187_0.rtTouchGamePanel:Find("slider/icon/beating"), arg_187_0.touchCount > 100)

	if arg_187_0.touchCount < 100 then
		quickPlayAnimation(arg_187_0.rtTouchGamePanel, "anim_dorm3d_touch_change_out")
		quickPlayAnimation(arg_187_0.rtTouchGamePanel:Find("slider/icon"), "anim_dorm3d_touch_icon")
	elseif arg_187_0.touchCount < 200 then
		quickPlayAnimation(arg_187_0.rtTouchGamePanel, "anim_dorm3d_touch_change")
		quickPlayAnimation(arg_187_0.rtTouchGamePanel:Find("slider/icon"), "anim_dorm3d_touch_icon_1")
		pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_heartbeat")
	end
end

function var_0_0.UpdateTouchCount(arg_188_0, arg_188_1)
	local var_188_0 = arg_188_0.touchCount

	arg_188_0.touchCount = math.clamp(arg_188_0.touchCount + arg_188_1, 100 * math.floor(arg_188_0.touchCount / 100), 500)

	warning(arg_188_0.touchCount)

	if arg_188_0.sliderLT and LeanTween.isTweening(arg_188_0.sliderLT) then
		var_188_0 = LeanTween.descr(arg_188_0.sliderLT).val

		LeanTween.cancel(arg_188_0.sliderLT)

		arg_188_0.sliderLT = nil
	end

	if math.clamp(var_188_0, 0, 500) ~= math.clamp(arg_188_0.touchCount, 0, 500) then
		local var_188_1 = GetComponent(arg_188_0.rtTouchGamePanel:Find("slider"), typeof(Slider))

		arg_188_0.sliderLT = LeanTween.value(var_188_0, arg_188_0.touchCount, math.abs(arg_188_0.touchCount - var_188_0) / 50):setOnUpdate(System.Action_float(function(arg_189_0)
			var_188_1.value = arg_189_0 >= 500 and 100 or arg_189_0 % 100
		end)):setEase(LeanTweenType.easeInOutCubic).uniqueId
	else
		setSlider(arg_188_0.rtTouchGamePanel:Find("slider"), 0, 100, arg_188_0.touchCount >= 500 and 100 or arg_188_0.touchCount % 100)
	end

	if math.floor(arg_188_0.touchCount / 100) ~= math.floor(var_188_0 / 100) then
		arg_188_0:UpdateTouchGameDisplay()

		local var_188_2 = arg_188_0.touchConfig.ik_status[math.floor(arg_188_0.touchCount / 100) + 1]

		if var_188_2 then
			arg_188_0:SwitchIKConfig(arg_188_0, var_188_2)
			arg_188_0:SetIKState(true)
		end
	end

	arg_188_0.topCount = math.max(arg_188_0.topCount, arg_188_0.touchCount)
end

function var_0_0.DoTouch(arg_190_0, arg_190_1, arg_190_2)
	if arg_190_0.inTouchGame then
		switch(arg_190_2, {
			function()
				arg_190_0:UpdateTouchCount(10)
			end,
			function()
				arg_190_0:UpdateTouchCount(2)
			end,
			function()
				arg_190_0:UpdateTouchCount(10)
			end,
			function()
				arg_190_0:UpdateTouchCount(20)
			end
		})
	end
end

function var_0_0.DoTalk(arg_195_0, arg_195_1, arg_195_2)
	while rawget(arg_195_0, "class") ~= var_0_0 do
		arg_195_0 = getmetatable(arg_195_0).__index
	end

	if arg_195_0.apartment and arg_195_0.ladyDict[arg_195_0.apartment:GetConfigID()]:GetBlackboardValue("inTalking") then
		errorMsg("Talking block:" .. arg_195_1)

		return
	end

	if not arg_195_0.room:isPersonalRoom() then
		local var_195_0 = pg.dorm3d_dialogue_group[arg_195_1].char_id

		if arg_195_0.apartment then
			assert(arg_195_0.apartment:GetConfigID() == var_195_0)
		else
			arg_195_0:SetApartment(getProxy(ApartmentProxy):getApartment(var_195_0))
		end
	end

	local var_195_1 = arg_195_0.ladyDict[arg_195_0.apartment:GetConfigID()]

	if arg_195_1 == 10010 and not arg_195_0.apartment.talkDic[arg_195_1] then
		arg_195_0.firstTimelineTouch = true
		arg_195_0.firstMoveGuide = true
	end

	local var_195_2 = {}
	local var_195_3 = arg_195_0.ladyDict[arg_195_0.apartment:GetConfigID()]

	if var_195_3:GetBlackboardValue("inPending") then
		table.insert(var_195_2, function(arg_196_0)
			arg_195_0:OutOfLazy(arg_195_0.apartment:GetConfigID(), arg_196_0)
		end)
	end

	local var_195_4 = pg.dorm3d_dialogue_group[arg_195_1]
	local var_195_5 = var_195_4.performance_type == 1
	local var_195_6

	table.insert(var_195_2, function(arg_197_0)
		arg_195_0:emit(arg_195_0.SHOW_BLOCK)
		var_195_3:SetBlackboardValue(var_195_5 and "inPerformance" or "inTalking", true)
		arg_195_0:emit(Dorm3dRoomMediator.DO_TALK, arg_195_1, function(arg_198_0)
			var_195_6 = arg_198_0

			arg_197_0()
		end)
	end)
	table.insert(var_195_2, function(arg_199_0)
		pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataDialog(arg_195_0.apartment.configId, arg_195_0.apartment.level, arg_195_1, var_195_4.type, arg_195_0.room:getZoneConfig(arg_195_0.ladyDict[arg_195_0.apartment:GetConfigID()].ladyBaseZone, "id"), var_195_4.action_type, table.CastToString(var_195_4.trigger_config), arg_195_0.room:GetConfigID()))

		if pg.NewGuideMgr.GetInstance():IsBusy() then
			pg.NewGuideMgr.GetInstance():Pause()
		end

		arg_195_0:SetUI(arg_199_0, "blank")
	end)

	if var_195_4.trigger_area and var_195_4.trigger_area ~= "" then
		table.insert(var_195_2, function(arg_200_0)
			arg_195_0:ShiftZone(var_195_4.trigger_area, arg_200_0)
		end)
	end

	if var_195_4.performance_type == 0 then
		table.insert(var_195_2, function(arg_201_0)
			arg_195_0:emit(arg_195_0.HIDE_BLOCK)
			pg.NewStoryMgr.GetInstance():ForceManualPlay(var_195_4.story, function()
				onDelayTick(arg_201_0, 0.001)
			end, true)
		end)
	elseif var_195_4.performance_type == 1 then
		table.insert(var_195_2, function(arg_203_0)
			arg_195_0:emit(arg_195_0.HIDE_BLOCK)
			arg_195_0:PerformanceQueue(var_195_4.story, arg_203_0)
		end)
	else
		assert(false)
	end

	table.insert(var_195_2, function(arg_204_0)
		arg_195_0:emit(arg_195_0.SHOW_BLOCK)
		arg_204_0()
	end)
	table.insert(var_195_2, function(arg_205_0)
		local var_205_0 = pg.NewStoryMgr.GetInstance():StoryName2StoryId(var_195_4.story)

		if var_205_0 then
			local var_205_1 = "1"

			pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataStory(var_205_0, var_205_1))
		end

		if var_195_6 and #var_195_6 > 0 then
			arg_195_0:emit(Dorm3dRoomMediator.OPEN_DROP_LAYER, var_195_6, arg_205_0)
		else
			arg_205_0()
		end
	end)
	table.insert(var_195_2, function(arg_206_0)
		if pg.NewGuideMgr.GetInstance():IsPause() then
			pg.NewGuideMgr.GetInstance():Resume()
		end

		arg_195_0:emit(arg_195_0.HIDE_BLOCK)
		var_195_3:SetBlackboardValue(var_195_5 and "inPerformance" or "inTalking", false)
		arg_195_0:SetUI(arg_206_0, "back")
	end)
	seriesAsync(var_195_2, function()
		if arg_195_2 then
			return arg_195_2()
		else
			arg_195_0:CheckQueue()
		end
	end)
end

function var_0_0.DoTalkTouchOption(arg_208_0, arg_208_1, arg_208_2, arg_208_3)
	local var_208_0 = arg_208_0.rtExtraScreen:Find("TalkTouchOption")
	local var_208_1
	local var_208_2 = var_208_0:Find("content")

	UIItemList.StaticAlign(var_208_2, var_208_2:Find("clickTpl"), #arg_208_1.options, function(arg_209_0, arg_209_1, arg_209_2)
		arg_209_1 = arg_209_1 + 1

		if arg_209_0 == UIItemList.EventUpdate then
			local var_209_0 = arg_208_1.options[arg_209_1]

			setAnchoredPosition(arg_209_2, NewPos(unpack(var_209_0.pos)))
			onButton(arg_208_0, arg_209_2, function()
				var_208_1(var_209_0.flag)
			end, SFX_CONFIRM)
			setActive(arg_209_2, not table.contains(arg_208_2, var_209_0.flag))
		end
	end)
	setActive(var_208_0, true)

	function var_208_1(arg_211_0)
		setActive(var_208_0, false)
		arg_208_3(arg_211_0)
	end
end

function var_0_0.DoTimelineOption(arg_212_0, arg_212_1, arg_212_2)
	local var_212_0 = arg_212_0.rtTimelineScreen:Find("TimelineOption")
	local var_212_1
	local var_212_2 = var_212_0:Find("content")

	UIItemList.StaticAlign(var_212_2, var_212_2:Find("clickTpl"), #arg_212_1, function(arg_213_0, arg_213_1, arg_213_2)
		arg_213_1 = arg_213_1 + 1

		if arg_213_0 == UIItemList.EventUpdate then
			local var_213_0 = arg_212_1[arg_213_1]

			setText(arg_213_2:Find("Text"), var_213_0.content)
			onButton(arg_212_0, arg_213_2, function()
				var_212_1(arg_213_1)
			end, SFX_CONFIRM)
		end
	end)
	setActive(var_212_0, true)

	function var_212_1(arg_215_0)
		setActive(var_212_0, false)
		arg_212_2(arg_215_0)
	end
end

function var_0_0.DoTimelineTouch(arg_216_0, arg_216_1, arg_216_2)
	local var_216_0 = arg_216_0.rtTimelineScreen:Find("TimelineTouch")
	local var_216_1
	local var_216_2 = var_216_0:Find("content")

	UIItemList.StaticAlign(var_216_2, var_216_2:Find("clickTpl"), #arg_216_1, function(arg_217_0, arg_217_1, arg_217_2)
		arg_217_1 = arg_217_1 + 1

		if arg_217_0 == UIItemList.EventUpdate then
			local var_217_0 = arg_216_1[arg_217_1]

			setAnchoredPosition(arg_217_2, NewPos(unpack(var_217_0.pos)))
			onButton(arg_216_0, arg_217_2, function()
				var_216_1(arg_217_1)
			end, SFX_CONFIRM)

			if arg_216_0.firstTimelineTouch then
				arg_216_0.firstTimelineTouch = nil

				setActive(arg_217_2:Find("finger"), true)
			end
		end
	end)
	setActive(var_216_0, true)

	function var_216_1(arg_219_0)
		setActive(var_216_0, false)
		arg_216_2(arg_219_0)
	end
end

function var_0_0.DoShortWait(arg_220_0, arg_220_1)
	local var_220_0 = arg_220_0.ladyDict[arg_220_1]
	local var_220_1 = getProxy(ApartmentProxy):getApartment(arg_220_1)
	local var_220_2 = arg_220_0.room:getApartmentZoneConfig(var_220_0.ladyBaseZone, "special_action", arg_220_1)
	local var_220_3 = var_220_2 and var_220_2[math.random(#var_220_2)] or nil

	if not var_220_3 then
		return
	end

	var_220_0:PlaySingleAction(var_220_3)
end

function var_0_0.OutOfLazy(arg_221_0, arg_221_1, arg_221_2)
	local var_221_0 = arg_221_0.ladyDict[arg_221_1]
	local var_221_1 = {}

	if var_221_0:GetBlackboardValue("inPending") then
		table.insert(var_221_1, function(arg_222_0)
			arg_221_0.shiftLady = arg_221_1

			arg_221_0:ShiftZone(var_221_0.ladyBaseZone, arg_222_0)
		end)
	end

	seriesAsync(var_221_1, arg_221_2)
end

function var_0_0.OutOfPending(arg_223_0, arg_223_1, arg_223_2)
	assert(arg_223_0.wakeUpTalkId)

	local var_223_0 = arg_223_0.wakeUpTalkId

	seriesAsync({
		function(arg_224_0)
			arg_223_0:SetUI(arg_224_0, "blank")
		end,
		function(arg_225_0)
			arg_223_0.shiftLady = arg_223_1

			arg_223_0:ShiftZone(arg_223_0.ladyBaseZone, arg_225_0)
		end,
		function(arg_226_0)
			arg_223_0:DoTalk(var_223_0, arg_226_0)
		end
	}, function()
		arg_223_0:SetUIStore(arg_223_2, "back")
	end)
end

function var_0_0.ChangeCanWatchState(arg_228_0)
	local var_228_0

	if arg_228_0:GetBlackboardValue("inPending") then
		var_228_0 = tobool(arg_228_0:GetBlackboardValue("inDistance"))
	else
		local var_228_1 = arg_228_0:GetBlackboardValue("groupId")

		var_228_0 = tobool(arg_228_0.activeLady[var_228_1] and pg.NodeCanvasMgr.GetInstance():GetBlackboradValue("canWatch", arg_228_0.ladyBlackboard))
	end

	if not arg_228_0.nowCanWatchState or arg_228_0.nowCanWatchState ~= var_228_0 then
		arg_228_0.nowCanWatchState = var_228_0

		arg_228_0:ShowOrHideCanWatchMark(arg_228_0.nowCanWatchState)
	end
end

local var_0_1 = {
	{
		"Face_XYX_1",
		"zhongji"
	},
	{
		"Face_XYX_2",
		"qingji"
	},
	{
		"Face_XYX_3",
		"miss"
	}
}

function var_0_0.HandleGameNotification(arg_229_0, arg_229_1, arg_229_2)
	local var_229_0 = arg_229_0.ladyDict[arg_229_0.apartment:GetConfigID()]

	switch(arg_229_1, {
		[EatFoodMediator.HIT_AREA] = function()
			local var_230_0, var_230_1 = unpack(var_0_1[arg_229_2.index])

			var_229_0:PlaySingleAction(var_230_0)

			if arg_229_0.tfCutIn then
				quickPlayAnimator(arg_229_0.modelCutIn.lady, var_230_1)
				quickPlayAnimator(arg_229_0.modelCutIn.player, var_230_1)
			end
		end,
		[EatFoodMediator.RESULT] = function()
			if arg_229_2.win then
				var_229_0:PlaySingleAction("Face_XYX_victory")
				var_229_0:PlaySingleAction("minigame_win")
			else
				var_229_0:PlaySingleAction("Face_XYX_lose")
				var_229_0:PlaySingleAction("minigame_lose")
			end

			setActive(arg_229_0.rtExtraScreen:Find("MiniGameCutIn"), false)
			pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataMiniGame(2, arg_229_2.score))
		end,
		[EatFoodMediator.LEAVE_GAME] = function()
			if arg_229_2 == false then
				pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataMiniGame(3))
			end
		end
	})
end

function var_0_0.PerformanceQueue(arg_233_0, arg_233_1, arg_233_2)
	local var_233_0, var_233_1 = pcall(function()
		return require("GameCfg.dorm." .. arg_233_1)
	end)

	if not var_233_0 then
		errorMsg("不存在表演ID对应的Lua:" .. arg_233_1)
		existCall(arg_233_2)

		return
	end

	warning(arg_233_1)

	local var_233_2 = {}

	table.insert(var_233_2, function(arg_235_0)
		arg_233_0:SetUI(arg_235_0, "blank")
	end)
	table.insertto(var_233_2, underscore.map(var_233_1, function(arg_236_0)
		return switch(arg_236_0.type, {
			function()
				return function(arg_238_0)
					local var_238_0 = unpack(arg_236_0.params)

					arg_233_0:DoTalk(var_238_0, arg_238_0, true)
				end
			end,
			function()
				return function(arg_240_0)
					arg_233_0.touchExitCall = arg_240_0

					arg_233_0:EnterTouchMode()
				end
			end,
			function()
				return function(arg_242_0)
					arg_233_0.ladyDict[arg_233_0.apartment:GetConfigID()]:PlaySingleAction(arg_236_0.name, arg_242_0)
				end
			end,
			function()
				return function(arg_244_0)
					arg_233_0:emit(arg_233_0.PLAY_EXPRESSION, arg_236_0)
					arg_244_0()
				end
			end,
			function()
				return function(arg_246_0)
					arg_233_0:ShiftZone(arg_236_0.name, arg_246_0)
				end
			end,
			function()
				return function(arg_248_0)
					arg_233_0.contextData.timeIndex = arg_236_0.params[1]

					if arg_233_0.artSceneInfo == arg_233_0.sceneInfo then
						arg_233_0:SwitchDayNight(arg_233_0.contextData.timeIndex)
						onNextTick(function()
							arg_233_0:RefreshSlots()
						end)
					end

					arg_233_0:UpdateContactState()
					onNextTick(arg_248_0)
				end
			end,
			function()
				return function(arg_251_0)
					arg_233_0:ActiveStateCamera(arg_236_0.name, arg_251_0)
				end
			end,
			function()
				return function(arg_253_0)
					if arg_236_0.name == "base" then
						arg_233_0:ChangeArtScene(arg_233_0.sceneInfo, arg_253_0)
					else
						local var_253_0 = arg_236_0.params.scene
						local var_253_1 = arg_236_0.params.sceneRoot

						arg_233_0:ChangeArtScene(var_253_0 .. "|" .. var_253_1, arg_253_0)
					end
				end
			end,
			function()
				return function(arg_255_0)
					local var_255_0 = arg_236_0.params.name

					if arg_236_0.name == "load" then
						arg_233_0.waitForTimeline = tobool(arg_236_0.params.wait_timeline)

						arg_233_0:LoadTimelineScene(var_255_0, true, arg_255_0)
					elseif arg_236_0.name == "unload" then
						arg_233_0:UnloadTimelineScene(var_255_0, true, arg_255_0)
					else
						assert(false)
					end
				end
			end,
			function()
				return function(arg_257_0)
					setActive(arg_233_0.uiContianer:Find("walk/btn_back"), false)

					if arg_236_0.name == "change" then
						local var_257_0 = arg_236_0.params.scene
						local var_257_1 = arg_236_0.params.sceneRoot

						arg_233_0.walkBornPoint = arg_236_0.params.point or "Default"

						arg_233_0:ChangeWalkScene(var_257_0 .. "|" .. var_257_1, arg_257_0)
					elseif arg_236_0.name == "back" then
						arg_233_0.walkBornPoint = nil

						arg_233_0:ChangeWalkScene(arg_233_0.sceneInfo, arg_257_0)
					elseif arg_236_0.name == "set" then
						local function var_257_2()
							local var_258_0 = arg_257_0

							arg_257_0 = nil

							return existCall(var_258_0)
						end

						for iter_257_0, iter_257_1 in pairs(arg_236_0.params) do
							switch(iter_257_0, {
								back_button_trigger = function(arg_259_0)
									onButton(arg_233_0, arg_233_0.uiContianer:Find("walk/btn_back"), var_257_2, "ui-dorm_back_v2")
									setActive(arg_233_0.uiContianer:Find("walk/btn_back"), IsUnityEditor and arg_259_0)
								end,
								near_trigger = function(arg_260_0)
									if arg_260_0 == true then
										arg_260_0 = 1.5
									end

									if arg_260_0 then
										function arg_233_0.walkNearCallback(arg_261_0)
											if arg_261_0 < arg_260_0 then
												arg_233_0.walkNearCallback = nil

												var_257_2()
											end
										end
									else
										arg_233_0.walkNearCallback = nil
									end
								end
							}, nil, iter_257_1)
						end

						if arg_233_0.firstMoveGuide then
							setActive(arg_233_0.povLayer:Find("Guide"), arg_233_0.firstMoveGuide)

							arg_233_0.firstMoveGuide = nil
						end
					else
						assert(false)
					end
				end
			end,
			function()
				return function(arg_263_0)
					if arg_236_0.name == "set" then
						arg_233_0:SwitchIKConfig(arg_233_0, arg_236_0.params.state)
						setActive(arg_233_0.uiContianer:Find("ik/btn_back"), not arg_236_0.params.hide_back)

						arg_233_0.ikSpecialCall = arg_263_0

						arg_233_0:SetIKState(true)
					elseif arg_236_0.name == "back" then
						local var_263_0 = arg_233_0.ladyDict[arg_233_0.apartment:GetConfigID()]

						var_263_0.ikConfig = arg_236_0.params

						arg_233_0:SetIKState(false, function()
							var_263_0.ikConfig = nil

							existCall(arg_263_0)
						end)
					else
						assert(false)
					end
				end
			end,
			function()
				return function(arg_266_0)
					arg_233_0.blackSceneInfo = setmetatable(arg_236_0.params or {}, {
						__index = {
							color = "#000000",
							time = 0.3,
							delay = arg_236_0.name == "show" and 0 or 0.5
						}
					})

					if arg_236_0.name == "show" then
						arg_233_0:ShowBlackScreen(true, arg_266_0)
					elseif arg_236_0.name == "hide" then
						arg_233_0:ShowBlackScreen(false, arg_266_0)
					else
						assert(false)
					end

					arg_233_0.blackSceneInfo = nil
				end
			end
		})
	end))
	table.insert(var_233_2, function(arg_267_0)
		arg_233_0:SetUI(arg_267_0, "back")
	end)
	seriesAsync(var_233_2, arg_233_2)
end

function var_0_0.TriggerContact(arg_268_0, arg_268_1)
	arg_268_0:emit(Dorm3dRoomMediator.COLLECTION_ITEM, {
		itemId = arg_268_1,
		roomId = arg_268_0.room:GetConfigID(),
		groupId = arg_268_0.room:isPersonalRoom() and arg_268_0.apartment:GetConfigID() or 0
	})
end

function var_0_0.UpdateContactState(arg_269_0)
	arg_269_0:SetContactStateDic(arg_269_0.room:getTriggerableCollectItemDic(arg_269_0.contextData.timeIndex))
end

function var_0_0.UpdateFavorDisplay(arg_270_0)
	local var_270_0, var_270_1 = getProxy(ApartmentProxy):getStamina()

	setText(arg_270_0.rtStaminaDisplay:Find("Text"), string.format("%d/%d", var_270_0, var_270_1))
	setActive(arg_270_0.rtStaminaDisplay, false)

	if arg_270_0.apartment then
		setText(arg_270_0.rtFavorLevel:Find("rank/Text"), arg_270_0.apartment.level)

		local var_270_2, var_270_3 = arg_270_0.apartment:getFavor()

		setText(arg_270_0.rtFavorLevel:Find("Text"), string.format("<color=#ff6698>%d</color>/%d", var_270_2, var_270_3))
	end

	setActive(arg_270_0.rtFavorLevel:Find("red"), Dorm3dLevelLayer.IsShowRed())
end

function var_0_0.UpdateBtnState(arg_271_0)
	if arg_271_0.room:isPersonalRoom() then
		setActive(arg_271_0.uiContianer:Find("base/left/btn_furniture/tip"), arg_271_0:CheckSystemOpen("Furniture") and Dorm3dFurniture.NeedViewTip(arg_271_0.room:GetConfigID()))
	else
		setActive(arg_271_0.uiContianer:Find("base/left/btn_furniture/tip"), Dorm3dFurniture.NeedViewTip(arg_271_0.room:GetConfigID()))
	end

	setActive(arg_271_0.uiContianer:Find("base/btn_back/main"), underscore(getProxy(ApartmentProxy):getRawData()):chain():values():filter(function(arg_272_0)
		return tobool(arg_272_0)
	end):any(function(arg_273_0)
		return #arg_273_0:getSpecialTalking() > 0 or arg_273_0:getIconTip() == "main"
	end):value())
	setActive(arg_271_0.uiContianer:Find("base/left/btn_collection/tip"), PlayerPrefs.GetInt("apartment_collection_item", 0) > 0 or PlayerPrefs.GetInt("apartment_collection_recall", 0) > 0)
end

function var_0_0.AddUnlockDisplay(arg_274_0, arg_274_1)
	table.insert(arg_274_0.unlockList, arg_274_1)

	if not isActive(arg_274_0.rtFavorUp) then
		setText(arg_274_0.rtFavorUp:Find("Text"), table.remove(arg_274_0.unlockList, 1))
		setActive(arg_274_0.rtFavorUp, true)
	end
end

function var_0_0.PopFavorTrigger(arg_275_0, arg_275_1)
	local var_275_0 = arg_275_1.triggerId
	local var_275_1 = arg_275_1.delta
	local var_275_2 = arg_275_1.cost
	local var_275_3 = arg_275_1.apartment
	local var_275_4 = pg.dorm3d_favor_trigger[var_275_0]

	if var_275_4.is_repeat == 0 then
		if var_275_0 == getDorm3dGameset("drom3d_favir_trigger_onwer")[1] then
			arg_275_0:AddUnlockDisplay(i18n("dorm3d_own_favor"))
		elseif var_275_0 == getDorm3dGameset("drom3d_favir_trigger_propose")[1] then
			arg_275_0:AddUnlockDisplay(i18n("dorm3d_pledge_favor"))
		else
			arg_275_0:AddUnlockDisplay(string.format("unknow favor trigger:%d unlock", var_275_0))
		end
	elseif arg_275_1.delta > 0 then
		local var_275_5, var_275_6 = var_275_3:getFavor()
		local var_275_7 = var_275_5 + var_275_1

		setText(arg_275_0.rtFavorUpDaily:Find("bg/Text"), string.format("<size=30>+%d</size>", var_275_1))
		setSlider(arg_275_0.rtFavorUpDaily:Find("bg/slider"), 0, var_275_6, var_275_5)
		setAnchoredPosition(arg_275_0.rtFavorUpDaily:Find("bg"), arg_275_1.isGift and NewPos(-354, 223) or NewPos(-208, 105))

		local var_275_8 = {}
		local var_275_9 = arg_275_0.rtFavorUpDaily:Find("bg/effect")

		eachChild(var_275_9, function(arg_276_0)
			setActive(arg_276_0, false)
		end)

		local var_275_10

		if var_275_4.effect and var_275_4.effect ~= "" then
			var_275_10 = var_275_9:Find(var_275_4.effect .. "(Clone)")

			if not var_275_10 then
				table.insert(var_275_8, function(arg_277_0)
					LoadAndInstantiateAsync("Dorm3D/Effect/Prefab/ExpressionUI", "uifx_dorm3d_yinfu01", function(arg_278_0)
						setParent(arg_278_0, var_275_9)

						var_275_10 = tf(arg_278_0)

						arg_277_0()
					end)
				end)
			else
				setActive(var_275_10, true)
			end
		end

		local var_275_11 = arg_275_0.rtFavorUpDaily:GetComponent("DftAniEvent")

		var_275_11:SetTriggerEvent(function(arg_279_0)
			local var_279_0 = GetComponent(arg_275_0.rtFavorUpDaily:Find("bg/slider"), typeof(Slider))

			LeanTween.value(var_275_5, var_275_7, 0.5):setOnUpdate(System.Action_float(function(arg_280_0)
				var_279_0.value = arg_280_0
			end)):setEase(LeanTweenType.easeInOutQuad):setDelay(0.165):setOnComplete(System.Action(function()
				LeanTween.delayedCall(0.165, System.Action(function()
					if arg_275_0.exited then
						return
					end

					quickPlayAnimator(arg_275_0.rtFavorUpDaily, "favor_out")
				end))
			end))
			pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_progaress_bar")
		end)
		var_275_11:SetEndEvent(function(arg_283_0)
			setActive(arg_275_0.rtFavorUpDaily, false)
		end)
		seriesAsync(var_275_8, function()
			local var_284_0 = arg_275_0.ladyDict[var_275_3:GetConfigID()]

			setLocalPosition(arg_275_0.rtFavorUpDaily, arg_275_0:GetLocalPosition(arg_275_0:GetScreenPosition(var_284_0.ladyHeadCenter.position), arg_275_0.rtFavorUpDaily.parent))
			setActive(arg_275_0.rtFavorUpDaily, true)
			SetCompomentEnabled(arg_275_0.rtFavorUpDaily, typeof(Animator), true)
			quickPlayAnimator(arg_275_0.rtFavorUpDaily, "favor_open")

			if var_275_2 > 0 then
				local var_284_1, var_284_2 = getProxy(ApartmentProxy):getStamina()

				setText(arg_275_0.rtStaminaPop:Find("Text/Text (1)"), "-" .. var_275_2)
				setText(arg_275_0.rtStaminaPop:Find("Text"), string.format("%d/%d", var_284_1 + var_275_2, var_284_2))
				setActive(arg_275_0.rtStaminaPop, true)
			end
		end)
	end
end

function var_0_0.PopFavorLevelUp(arg_285_0, arg_285_1, arg_285_2, arg_285_3)
	arg_285_0.isLock = true

	LeanTween.delayedCall(0.33, System.Action(function()
		arg_285_0.isLock = false
	end))

	local var_285_0 = math.floor(arg_285_1.level / 10)
	local var_285_1 = math.fmod(arg_285_1.level, 10)

	GetImageSpriteFromAtlasAsync("ui/favor_atlas", var_285_1, arg_285_0.rtLevelUpWindow:Find("panel/bg/item1/mark/level/digit2"))
	GetImageSpriteFromAtlasAsync("ui/favor_atlas", var_285_0, arg_285_0.rtLevelUpWindow:Find("panel/bg/item1/mark/level/digit1"))
	setActive(arg_285_0.rtLevelUpWindow:Find("panel/bg/item1/mark/level/digit1"), var_285_0 > 0)

	local var_285_2
	local var_285_3

	arg_285_0.clientAward, var_285_3 = Dorm3dIconHelper.SplitStory(arg_285_1:getFavorConfig("levelup_client_item", arg_285_1.level))
	arg_285_0.serverAward = arg_285_2

	local var_285_4 = arg_285_0.rtLevelUpWindow:Find("panel/info/content/itemContent")

	if not arg_285_0.levelItemList then
		arg_285_0.levelItemList = UIItemList.New(var_285_4, var_285_4:Find("tpl"))

		arg_285_0.levelItemList:make(function(arg_287_0, arg_287_1, arg_287_2)
			local var_287_0 = arg_287_1 + 1

			if arg_287_0 == UIItemList.EventUpdate then
				if arg_287_1 < #arg_285_0.serverAward then
					updateDorm3dIcon(arg_287_2, arg_285_0.serverAward[var_287_0])
					onButton(arg_285_0, arg_287_2, function()
						arg_285_0:emit(BaseUI.ON_NEW_DROP, {
							drop = arg_285_0.serverAward[var_287_0]
						})
					end, SFX_PANEL)
				else
					Dorm3dIconHelper.UpdateDorm3dIcon(arg_287_2, arg_285_0.clientAward[var_287_0 - #arg_285_0.serverAward])
					onButton(arg_285_0, arg_287_2, function()
						arg_285_0:emit(Dorm3dRoomMediator.ON_DROP_CLIENT, {
							data = arg_285_0.clientAward[var_287_0 - #arg_285_0.serverAward]
						})
					end, SFX_PANEL)
				end
			end
		end)
	end

	arg_285_0.levelItemList:align(#arg_285_0.serverAward + #arg_285_0.clientAward)
	setActive(arg_285_0.rtLevelUpWindow, true)
	pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_upgrade")
	pg.UIMgr.GetInstance():OverlayPanel(arg_285_0.rtLevelUpWindow, {
		weight = LayerWeightConst.SECOND_LAYER,
		groupName = LayerWeightConst.GROUP_DORM3D
	})

	function arg_285_0.levelUpCallback()
		arg_285_0.levelUpCallback = nil

		if var_285_3 then
			arg_285_0:PopNewStoryTip(var_285_3)
		end

		existCall(arg_285_3)
	end
end

function var_0_0.PopNewStoryTip(arg_291_0, arg_291_1, arg_291_2)
	local var_291_0 = arg_291_0.uiContianer:Find("base/top/story_tip")

	setActive(var_291_0, true)
	LeanTween.delayedCall(1, System.Action(function()
		setActive(var_291_0, false)
	end))
	setText(var_291_0:Find("Text"), i18n("dorm3d_story_unlock_tip", pg.dorm3d_recall[arg_291_1[2]].name))
	existCall(arg_291_2)
end

function var_0_0.UpdateZoneList(arg_293_0)
	local var_293_0

	if arg_293_0.room:isPersonalRoom() then
		var_293_0 = arg_293_0.ladyDict[arg_293_0.apartment:GetConfigID()].ladyBaseZone
	else
		var_293_0 = arg_293_0:GetAttachedFurnitureName()
	end

	for iter_293_0, iter_293_1 in ipairs(arg_293_0.zoneDatas) do
		if iter_293_1:GetWatchCameraName() == var_293_0 then
			setText(arg_293_0.btnZone:Find("Text"), iter_293_1:GetName())
			setTextColor(arg_293_0.rtZoneList:GetChild(iter_293_0 - 1):Find("Name"), Color.NewHex("5CCAFF"))
		else
			setTextColor(arg_293_0.rtZoneList:GetChild(iter_293_0 - 1):Find("Name"), Color.NewHex("FFFFFF99"))
		end
	end
end

function var_0_0.TalkingEventHandle(arg_294_0, arg_294_1)
	local var_294_0 = {}
	local var_294_1 = {}
	local var_294_2 = arg_294_1.data

	if var_294_2.op_list then
		for iter_294_0, iter_294_1 in ipairs(var_294_2.op_list) do
			table.insert(var_294_0, function(arg_295_0)
				local function var_295_0()
					local var_296_0 = arg_295_0

					arg_295_0 = nil

					return existCall(var_296_0)
				end

				switch(iter_294_1.type, {
					action = function()
						arg_294_0.ladyDict[arg_294_0.apartment:GetConfigID()]:PlaySingleAction(iter_294_1.name, var_295_0)
					end,
					timeline = function()
						if arg_294_0.inTouchGame then
							setActive(arg_294_0.rtTouchGamePanel, false)
						end

						arg_294_0:PlayTimeline(iter_294_1, function(arg_299_0, arg_299_1)
							setActive(arg_294_0.rtTouchGamePanel, arg_294_0.inTouchGame)

							var_294_1.notifiCallback = arg_299_1

							var_295_0()
						end)
					end,
					clickOption = function()
						arg_294_0:DoTalkTouchOption(iter_294_1, arg_294_1.flags, function(arg_301_0)
							var_294_1.optionIndex = arg_301_0

							var_295_0()
						end)
					end,
					wait = function()
						arg_294_0.LTs = arg_294_0.LTs or {}

						table.insert(arg_294_0.LTs, LeanTween.delayedCall(iter_294_1.time, System.Action(var_295_0)).uniqueId)
					end,
					expression = function()
						arg_294_0:emit(arg_294_0.PLAY_EXPRESSION, iter_294_1)
						var_295_0()
					end
				}, function()
					assert(false, "op type error:", iter_294_1.type)
				end)

				if iter_294_1.skip then
					var_295_0()
				end
			end)
		end
	end

	seriesAsync(var_294_0, function()
		if arg_294_1.callbackData then
			arg_294_0:emit(Dorm3dRoomMediator.TALKING_EVENT_FINISH, arg_294_1.callbackData.name, var_294_1)
		end
	end)
end

function var_0_0.CheckQueue(arg_306_0)
	if arg_306_0.inGuide or arg_306_0.uiState ~= "base" then
		return
	end

	if arg_306_0.room:GetConfigID() == 1 and arg_306_0:CheckGuide() then
		-- block empty
	elseif arg_306_0.room:isPersonalRoom() and arg_306_0:CheckLevelUp() then
		-- block empty
	elseif arg_306_0.apartment and arg_306_0:CheckEnterDeal() then
		-- block empty
	elseif arg_306_0.apartment and arg_306_0:CheckActiveTalk() then
		-- block empty
	elseif arg_306_0.apartment then
		arg_306_0:CheckFavorTrigger()
	end

	arg_306_0.contextData.hasEnterCheck = true
end

function var_0_0.didEnterCheck(arg_307_0)
	local var_307_0

	if arg_307_0.contextData.specialId then
		var_307_0 = arg_307_0.contextData.specialId
		arg_307_0.contextData.specialId = nil

		arg_307_0:DoTalk(var_307_0, function()
			arg_307_0:closeView()
		end)
	elseif not arg_307_0.contextData.hasEnterCheck and arg_307_0.apartment then
		for iter_307_0, iter_307_1 in ipairs(arg_307_0.apartment:getForceEnterTalking(arg_307_0.room:GetConfigID())) do
			var_307_0 = iter_307_1

			arg_307_0:DoTalk(iter_307_1)

			break
		end
	end

	if var_307_0 and pg.dorm3d_dialogue_group[var_307_0].extend_loading > 0 then
		arg_307_0.contextData.hasEnterCheck = true

		pg.SceneAnimMgr.GetInstance():RegisterDormNextCall(function()
			arg_307_0:FinishEnterResume()
		end)
	else
		if arg_307_0.apartment and arg_307_0.contextData.pendingDic[arg_307_0.apartment:GetConfigID()] then
			arg_307_0.contextData.hasEnterCheck = true
		end

		for iter_307_2, iter_307_3 in pairs(arg_307_0.contextData.pendingDic) do
			arg_307_0.ladyDict[iter_307_2]:SetInPending(iter_307_3)
		end

		arg_307_0.contextData.pendingDic = {}

		arg_307_0:FinishEnterResume()
		arg_307_0:CheckQueue()
	end
end

function var_0_0.CheckGuide(arg_310_0)
	if arg_310_0.ladyDict[arg_310_0.apartment:GetConfigID()]:GetBlackboardValue("inPending") then
		return
	end

	for iter_310_0, iter_310_1 in ipairs({
		{
			name = "DORM3D_GUIDE_03",
			active = function()
				return true
			end
		},
		{
			name = "DORM3D_GUIDE_04",
			active = function()
				return true
			end
		},
		{
			name = "DORM3D_GUIDE_05",
			active = function()
				return arg_310_0:CheckSystemOpen("Furniture")
			end
		},
		{
			name = "DORM3D_GUIDE_07",
			active = function()
				return arg_310_0:CheckSystemOpen("DayNight")
			end
		}
	}) do
		if not pg.NewStoryMgr.GetInstance():IsPlayed(iter_310_1.name) and iter_310_1.active() then
			arg_310_0:SetAllBlackbloardValue("inGuide", true)

			local function var_310_0()
				pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGuide(2, pg.NewStoryMgr.GetInstance():StoryName2StoryId(iter_310_1.name)))
				arg_310_0:SetAllBlackbloardValue("inGuide", false)
			end

			pg.m02:sendNotification(GAME.STORY_UPDATE, {
				storyId = iter_310_1.name
			})
			pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGuide(1, pg.NewStoryMgr.GetInstance():StoryName2StoryId(iter_310_1.name)))
			pg.NewGuideMgr.GetInstance():Play(iter_310_1.name, nil, var_310_0, var_310_0)

			return true
		end
	end

	return false
end

function var_0_0.CheckFavorTrigger(arg_316_0)
	for iter_316_0, iter_316_1 in ipairs({
		{
			triggerId = getDorm3dGameset("drom3d_favir_trigger_onwer")[1],
			active = function()
				local var_317_0 = getProxy(CollectionProxy):getShipGroup(arg_316_0.apartment.configId)

				return tobool(var_317_0)
			end
		},
		{
			triggerId = getDorm3dGameset("drom3d_favir_trigger_propose")[1],
			active = function()
				local var_318_0 = getProxy(CollectionProxy):getShipGroup(arg_316_0.apartment.configId)

				return var_318_0 and var_318_0.married > 0
			end
		}
	}) do
		if arg_316_0.apartment.triggerCountDic[iter_316_1.triggerId] == 0 and iter_316_1.active() then
			arg_316_0:emit(Dorm3dRoomMediator.TRIGGER_FAVOR, arg_316_0.apartment.configId, iter_316_1.triggerId)
		end
	end
end

function var_0_0.CheckEnterDeal(arg_319_0)
	if arg_319_0.contextData.hasEnterCheck then
		return false
	end

	local var_319_0 = arg_319_0.apartment:GetConfigID()
	local var_319_1 = "dorm3d_enter_count_" .. var_319_0
	local var_319_2 = pg.TimeMgr.GetInstance():CurrentSTimeDesc("%Y/%m/%d")

	if PlayerPrefs.GetString("dorm3d_enter_count_day") ~= var_319_2 then
		PlayerPrefs.SetString("dorm3d_enter_count_day", var_319_2)
		PlayerPrefs.SetInt(var_319_1, 1)
	else
		PlayerPrefs.SetInt(var_319_1, PlayerPrefs.GetInt(var_319_1, 0) + 1)
	end

	local var_319_3 = arg_319_0.apartment:getEnterTalking(arg_319_0.room:GetConfigID())

	PlayerPrefs.SetString("DORM3D_DAILY_ENTER", pg.TimeMgr.GetInstance():CurrentSTimeDesc("%Y/%m/%d"))

	if #var_319_3 > 0 then
		arg_319_0:DoTalk(var_319_3[math.random(#var_319_3)])

		return true
	end
end

function var_0_0.CheckActiveTalk(arg_320_0)
	local var_320_0 = arg_320_0.ladyDict[arg_320_0.apartment:GetConfigID()]

	if var_320_0:GetBlackboardValue("inPending") then
		return false
	end

	local var_320_1 = arg_320_0.apartment:getZoneTalking(arg_320_0.room:GetConfigID(), var_320_0.ladyBaseZone)

	if #var_320_1 > 0 then
		arg_320_0:DoTalk(var_320_1[1])

		return true
	else
		return false
	end
end

function var_0_0.CheckDistanceTalk(arg_321_0, arg_321_1, arg_321_2)
	local var_321_0 = arg_321_0.ladyDict[arg_321_1].ladyBaseZone
	local var_321_1 = getProxy(ApartmentProxy):getApartment(arg_321_1)

	for iter_321_0, iter_321_1 in ipairs(var_321_1:getDistanceTalking(arg_321_0.room:GetConfigID(), var_321_0)) do
		arg_321_0:DoTalk(iter_321_1)

		return
	end
end

function var_0_0.CheckSystemOpen(arg_322_0, arg_322_1)
	if arg_322_0.room:isPersonalRoom() then
		return switch(arg_322_1, {
			Talk = function()
				local var_323_0 = 1

				return var_323_0 <= arg_322_0.apartment.level, i18n("apartment_level_unenough", var_323_0)
			end,
			Touch = function()
				local var_324_0 = getDorm3dGameset("drom3d_touch_dialogue")[1]

				return var_324_0 <= arg_322_0.apartment.level, i18n("apartment_level_unenough", var_324_0)
			end,
			Gift = function()
				local var_325_0 = getDorm3dGameset("drom3d_gift_dialogue")[1]

				return var_325_0 <= arg_322_0.apartment.level, i18n("apartment_level_unenough", var_325_0)
			end,
			Volleyball = function()
				return false
			end,
			Photo = function()
				local var_327_0 = getDorm3dGameset("drom3d_photograph_unlock")[1]

				return var_327_0 <= arg_322_0.apartment.level, i18n("apartment_level_unenough", var_327_0)
			end,
			Collection = function()
				local var_328_0 = getDorm3dGameset("drom3d_recall_unlock")[1]

				return var_328_0 <= arg_322_0.apartment.level, i18n("apartment_level_unenough", var_328_0)
			end,
			Furniture = function()
				local var_329_0 = getDorm3dGameset("drom3d_furniture_unlock")[1]

				return var_329_0 <= arg_322_0.apartment.level, i18n("apartment_level_unenough", var_329_0)
			end,
			DayNight = function()
				local var_330_0 = getDorm3dGameset("drom3d_time_unlock")[1]

				return var_330_0 <= arg_322_0.apartment.level, i18n("apartment_level_unenough", var_330_0)
			end,
			Accompany = function()
				local var_331_0 = 1

				return var_331_0 <= arg_322_0.apartment.level, i18n("apartment_level_unenough", var_331_0)
			end,
			MiniGame = function()
				local var_332_0 = 1

				return var_332_0 <= arg_322_0.apartment.level, i18n("apartment_level_unenough", var_332_0)
			end,
			Invite = function()
				return false
			end,
			Performance = function()
				return IsUnityEditor
			end
		}, function()
			return true
		end)
	else
		return switch(arg_322_1, {
			Gift = function()
				return false
			end,
			Volleyball = function()
				return arg_322_0.room:GetConfigID() == 4
			end,
			Furniture = function()
				return false
			end,
			DayNight = function()
				return false
			end,
			Accompany = function()
				return false
			end,
			MiniGame = function()
				return false
			end,
			Performance = function()
				return IsUnityEditor
			end
		}, function()
			return true
		end)
	end
end

function var_0_0.CheckLevelUp(arg_344_0)
	if arg_344_0.apartment:canLevelUp() then
		arg_344_0:emit(Dorm3dRoomMediator.FAVOR_LEVEL_UP, arg_344_0.apartment.configId)

		return true
	end

	return false
end

function var_0_0.GetIKTipsRootTF(arg_345_0)
	return arg_345_0.ikTipsRoot
end

function var_0_0.GetIKHandTF(arg_346_0)
	return arg_346_0.ikHand
end

function var_0_0.CycleIKCameraGroup(arg_347_0)
	local var_347_0 = arg_347_0.ladyDict[arg_347_0.apartment:GetConfigID()]

	assert(var_347_0:GetBlackboardValue("inIK"))
	seriesAsync({
		function(arg_348_0)
			arg_347_0.RevertIKLayer(var_347_0, 0, arg_348_0)
		end,
		function(arg_349_0)
			local var_349_0 = var_347_0.ikConfig
			local var_349_1 = var_349_0.camera_group
			local var_349_2 = pg.dorm3d_ik_status.get_id_list_by_camera_group[var_349_1]
			local var_349_3 = var_349_2[table.indexof(var_349_2, var_349_0.id) % #var_349_2 + 1]

			arg_347_0:SwitchIKConfig(var_347_0, var_349_3)
			arg_347_0:SetIKState(true)
		end
	})
end

function var_0_0.TempHideUI(arg_350_0, arg_350_1, arg_350_2)
	local var_350_0 = defaultValue(arg_350_0.hideCount, 0)

	arg_350_0.hideCount = var_350_0 + (arg_350_1 and 1 or -1)

	assert(arg_350_0.hideCount >= 0)

	if arg_350_0.hideCount * var_350_0 > 0 then
		return existCall(arg_350_2)
	elseif arg_350_0.hideCount > 0 then
		arg_350_0:SetUI(arg_350_2, "blank")
	else
		arg_350_0:SetUI(arg_350_2, "back")
	end
end

function var_0_0.onBackPressed(arg_351_0)
	if arg_351_0.exited or arg_351_0.retainCount > 0 then
		-- block empty
	elseif isActive(arg_351_0.rtLevelUpWindow) then
		triggerButton(arg_351_0.rtLevelUpWindow:Find("bg"))
	elseif arg_351_0.uiState ~= "base" then
		-- block empty
	else
		arg_351_0:closeView()
	end
end

function var_0_0.willExit(arg_352_0)
	if arg_352_0.downTimer then
		arg_352_0.downTimer:Stop()

		arg_352_0.downTimer = nil
	end

	if arg_352_0.LTs then
		underscore.map(arg_352_0.LTs, function(arg_353_0)
			LeanTween.cancel(arg_353_0)
		end)

		arg_352_0.LTs = nil
	end

	if arg_352_0.sliderLT then
		LeanTween.cancel(arg_352_0.sliderLT)

		arg_352_0.sliderLT = nil
	end

	for iter_352_0, iter_352_1 in pairs(arg_352_0.ladyDict) do
		iter_352_1.wakeUpTalkId = nil
	end

	if arg_352_0.accompanyFavorTimer then
		arg_352_0.accompanyFavorTimer:Stop()

		arg_352_0.accompanyFavorTimer = nil
	end

	if arg_352_0.accompanyPerformanceTimer then
		arg_352_0.accompanyPerformanceTimer:Stop()

		arg_352_0.accompanyPerformanceTimer = nil
	end

	arg_352_0.canTriggerAccompanyPerformance = nil

	var_0_0.super.willExit(arg_352_0)
end

return var_0_0
