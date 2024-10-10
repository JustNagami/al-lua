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
			pg.TipsMgr.GetInstance():ShowTips("Success!")
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
	arg_4_0.uiStack = {}
	arg_4_0.uiStore = {}
end

function var_0_0.BindEvent(arg_74_0)
	var_0_0.super.BindEvent(arg_74_0)
	arg_74_0:bind(arg_74_0.CLICK_CHARACTER, function(arg_75_0, arg_75_1)
		if arg_74_0.uiState ~= "base" or not arg_74_0.ladyDict[arg_75_1].nowCanWatchState then
			return
		end

		local var_75_0 = {}
		local var_75_1 = arg_74_0.ladyDict[arg_75_1]

		if var_75_1:GetBlackboardValue("inPending") then
			table.insert(var_75_0, function(arg_76_0)
				var_75_1:OutOfPending(arg_75_1, arg_76_0)
			end)
		else
			table.insert(var_75_0, function(arg_77_0)
				arg_74_0:OutOfLazy(arg_75_1, arg_77_0)
			end)
		end

		seriesAsync(var_75_0, function()
			if not arg_74_0.room:isPersonalRoom() then
				arg_74_0:SetApartment(getProxy(ApartmentProxy):getApartment(arg_75_1))
			end

			arg_74_0:EnterWatchMode()
		end)
		pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_touch_v1")
	end)
	arg_74_0:bind(arg_74_0.CLICK_CONTACT, function(arg_79_0, arg_79_1)
		arg_74_0:TriggerContact(arg_79_1)
	end)
	arg_74_0:bind(arg_74_0.DISTANCE_TRIGGER, function(arg_80_0, arg_80_1, arg_80_2)
		if arg_74_0.uiState == "base" then
			arg_74_0:CheckDistanceTalk(arg_80_1, arg_80_2)
		end
	end)
	arg_74_0:bind(arg_74_0.WALK_DISTANCE_TRIGGER, function(arg_81_0, arg_81_1, arg_81_2)
		if arg_74_0.apartment and arg_74_0.apartment:GetConfigID() == arg_81_1 then
			existCall(arg_74_0.walkNearCallback, arg_81_2)
		end
	end)
	arg_74_0:bind(arg_74_0.CHANGE_WATCH, function(arg_82_0, arg_82_1)
		arg_74_0.ladyDict[arg_82_1]:ChangeCanWatchState()
	end)
	arg_74_0:bind(arg_74_0.ON_TOUCH_CHARACTER, function(arg_83_0, arg_83_1)
		if not arg_74_0.ladyDict[arg_74_0.apartment:GetConfigID()]:GetBlackboardValue("inIK") then
			return
		end

		arg_74_0:OnTouchCharacterBody(arg_83_1)
	end)
	arg_74_0:bind(arg_74_0.ON_IK_STATUS_CHANGED, function(arg_84_0, arg_84_1, arg_84_2)
		if not arg_74_0.ladyDict[arg_74_0.apartment:GetConfigID()]:GetBlackboardValue("inTouching") then
			return
		end

		arg_74_0:DoTouch(arg_84_1, arg_84_2)
	end)
	arg_74_0:bind(arg_74_0.ON_ENTER_SECTOR, function(arg_85_0, arg_85_1)
		arg_74_0.ladyDict[arg_85_1]:ChangeCanWatchState()
	end)
	arg_74_0:bind(arg_74_0.ON_CHANGE_DISTANCE, function(arg_86_0, arg_86_1, arg_86_2)
		arg_74_0.ladyDict[arg_86_1]:ChangeCanWatchState()
	end)
end

function var_0_0.didEnter(arg_87_0)
	var_0_0.super.didEnter(arg_87_0)
	arg_87_0:UpdateZoneList()

	arg_87_0.resumeCallback = arg_87_0.contextData.resumeCallback
	arg_87_0.contextData.resumeCallback = nil

	arg_87_0:SetUI(function()
		arg_87_0:didEnterCheck()
	end, "base")
end

function var_0_0.FinishEnterResume(arg_89_0)
	if not arg_89_0.resumeCallback then
		return
	end

	local var_89_0 = arg_89_0.resumeCallback

	arg_89_0.resumeCallback = nil

	return var_89_0()
end

function var_0_0.EnableJoystick(arg_90_0, arg_90_1)
	setActive(arg_90_0._joystick, arg_90_1)
end

function var_0_0.EnablePOVLayer(arg_91_0, arg_91_1)
	setActive(arg_91_0.povLayer, arg_91_1)

	if not arg_91_1 then
		arg_91_0:emit(arg_91_0.ON_POV_STICK_MOVE_END)
	end
end

function var_0_0.SetUIStore(arg_92_0, arg_92_1, ...)
	table.insertto(arg_92_0.uiStore, {
		...
	})
	existCall(arg_92_1)
end

function var_0_0.SetUI(arg_93_0, arg_93_1, ...)
	while rawget(arg_93_0, "class") ~= var_0_0 do
		arg_93_0 = getmetatable(arg_93_0).__index
	end

	table.insertto(arg_93_0.uiStore, {
		...
	})

	for iter_93_0, iter_93_1 in ipairs(arg_93_0.uiStore) do
		if iter_93_1 == "back" then
			assert(#arg_93_0.uiStack > 0)

			arg_93_0.uiState = table.remove(arg_93_0.uiStack)
		elseif iter_93_1 == arg_93_0.uiState and iter_93_1 == "ik" then
			-- block empty
		else
			table.insert(arg_93_0.uiStack, arg_93_0.uiState)

			arg_93_0.uiState = iter_93_1
		end
	end

	arg_93_0.uiStore = {}

	eachChild(arg_93_0.uiContianer, function(arg_94_0)
		setActive(arg_94_0, arg_94_0.name == arg_93_0.uiState)
	end)
	arg_93_0:EnablePOVLayer(arg_93_0.uiState == "base" or arg_93_0.uiState == "walk")
	arg_93_0:TempHideContact(arg_93_0.uiState ~= "base")
	arg_93_0:SetFloatEnable(arg_93_0.uiState == "walk")
	setActive(arg_93_0.rtFloatPage, arg_93_0.uiState == "walk")
	switch(arg_93_0.uiState, {
		base = function()
			if not arg_93_0.room:isPersonalRoom() then
				arg_93_0:SetApartment(nil)
			end

			arg_93_0:UpdateBtnState()
		end,
		watch = function()
			eachChild(arg_93_0.rtRole, function(arg_97_0)
				setActive(arg_97_0, false)
			end)

			local var_96_0 = underscore.filter({
				"Talk",
				"Touch",
				"Gift",
				"MiniGame",
				"Volleyball",
				"Performance"
			}, function(arg_98_0)
				return arg_93_0:CheckSystemOpen(arg_98_0)
			end)
			local var_96_1 = 0.05

			for iter_96_0, iter_96_1 in ipairs(var_96_0) do
				LeanTween.delayedCall(var_96_1, System.Action(function()
					setActive(arg_93_0.rtRole:Find(iter_96_1), true)
				end))

				var_96_1 = var_96_1 + 0.066
			end

			setActive(arg_93_0.rtRole:Find("Gift/bg/Tip"), Dorm3dGift.NeedViewTip(arg_93_0.apartment:GetConfigID()))
		end,
		ik = function()
			setActive(arg_93_0.uiContianer:Find("ik/Right/MenuSmall"), arg_93_0.room:isPersonalRoom())
			setActive(arg_93_0.uiContianer:Find("ik/Right/Menu"), false)
		end,
		walk = function()
			setText(arg_93_0.uiContianer:Find("walk/dialogue/content"), i18n("dorm3d_removable", arg_93_0.apartment:getConfig("name")))
		end
	})
	arg_93_0:ActiveStateCamera(arg_93_0.uiState, function()
		if arg_93_1 then
			arg_93_1()
		elseif arg_93_0.uiState == "base" then
			arg_93_0:CheckQueue()
		end
	end)
end

function var_0_0.EnterWatchMode(arg_103_0, arg_103_1)
	local var_103_0 = arg_103_0.apartment:GetConfigID()

	seriesAsync({
		function(arg_104_0)
			arg_103_0:emit(arg_103_0.SHOW_BLOCK)
			arg_103_0.ladyDict[var_103_0]:SetBlackboardValue("inWatchMode", true)
			arg_103_0:SetUI(arg_104_0, "watch")
		end,
		function(arg_105_0)
			arg_103_0:emit(arg_103_0.HIDE_BLOCK)
		end
	})
end

function var_0_0.ExitWatchMode(arg_106_0)
	local var_106_0 = arg_106_0.apartment:GetConfigID()

	seriesAsync({
		function(arg_107_0)
			arg_106_0:emit(arg_106_0.SHOW_BLOCK)
			arg_106_0:SetUI(arg_107_0, "back")
		end,
		function(arg_108_0)
			arg_106_0.ladyDict[var_106_0]:SetBlackboardValue("inWatchMode", false)
			arg_106_0:emit(arg_106_0.HIDE_BLOCK)
			arg_106_0:CheckQueue()
		end
	})
end

function var_0_0.SetInPending(arg_109_0, arg_109_1)
	local var_109_0 = arg_109_0:GetBlackboardValue("groupId")
	local var_109_1 = pg.dorm3d_welcome[arg_109_1]

	arg_109_0:SetBlackboardValue("inPending", true)
	arg_109_0:ChangeCanWatchState()
	arg_109_0:EnableHeadIK(false)

	arg_109_0.contextData.ladyZone[var_109_0] = var_109_1.area
	arg_109_0.ladyBaseZone = arg_109_0.contextData.ladyZone[var_109_0]
	arg_109_0.ladyActiveZone = var_109_1.welcome_staypoint

	arg_109_0:ChangeCharacterPosition()

	if var_109_1.item_shield ~= "" then
		arg_109_0.hideItemDic = {}

		for iter_109_0, iter_109_1 in ipairs(var_109_1.item_shield) do
			local var_109_2 = arg_109_0.modelRoot:Find(iter_109_1)

			if not var_109_2 then
				warning(string.format("welcome:%d without hide item:%s", arg_109_1, iter_109_1))
			else
				arg_109_0.hideItemDic[iter_109_1] = isActive(var_109_2)

				setActive(var_109_2, false)
			end
		end
	end

	onNextTick(function()
		if arg_109_0.tfPendintItem then
			setActive(arg_109_0.tfPendintItem, true)
		end

		arg_109_0:SwitchAnim(var_109_1.welcome_idle)
	end)

	arg_109_0.wakeUpTalkId = var_109_1.welcome_talk
end

function var_0_0.SetOutPending(arg_111_0)
	arg_111_0:SetBlackboardValue("inPending", false)
	arg_111_0:ChangeCanWatchState()
	arg_111_0:EnableHeadIK(true)

	arg_111_0.wakeUpTalkId = nil

	if arg_111_0.tfPendintItem then
		setActive(arg_111_0.tfPendintItem, false)
	end

	if arg_111_0.hideItemDic then
		for iter_111_0, iter_111_1 in pairs(arg_111_0.hideItemDic) do
			setActive(arg_111_0.modelRoot:Find(iter_111_0), iter_111_1)
		end

		arg_111_0.hideItemDic = nil
	end
end

function var_0_0.IsModeInHidePending(arg_112_0, arg_112_1)
	for iter_112_0, iter_112_1 in pairs(arg_112_0.ladyDict) do
		if iter_112_1.hideItemDic and iter_112_1.hideItemDic[arg_112_1] ~= nil then
			return true
		end
	end

	return false
end

function var_0_0.EnterAccompanyMode(arg_113_0, arg_113_1)
	local var_113_0 = pg.dorm3d_accompany[arg_113_1]
	local var_113_1
	local var_113_2

	if var_113_0.sceneInfo ~= "" then
		var_113_1, var_113_2 = unpack(string.split(var_113_0.sceneInfo, "|"))
	end

	local var_113_3 = {
		type = "timeline",
		name = var_113_0.timeline,
		scene = var_113_1,
		sceneRoot = var_113_2,
		accompanys = {}
	}

	for iter_113_0, iter_113_1 in ipairs(var_113_0.jump_trigger) do
		local var_113_4, var_113_5 = unpack(iter_113_1)

		var_113_3.accompanys[var_113_4] = var_113_5
	end

	local var_113_6, var_113_7 = unpack(var_113_0.favor)

	getProxy(ApartmentProxy):RecordAccompanyTime()
	pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataAccompany(1, var_113_0.ship_id, var_113_0.performance_time, 0, var_113_1 or arg_113_0.artSceneInfo))

	local var_113_8 = {}

	table.insert(var_113_8, function(arg_114_0)
		arg_113_0:SetUI(arg_114_0, "blank", "accompany")
	end)
	table.insert(var_113_8, function(arg_115_0)
		arg_113_0.accompanyFavorCount = 0
		arg_113_0.accompanyFavorTimer = Timer.New(function()
			arg_113_0.accompanyFavorCount = arg_113_0.accompanyFavorCount + 1
		end, var_113_6, -1)

		arg_113_0.accompanyFavorTimer:Start()

		arg_113_0.accompanyPerformanceTimer = Timer.New(function()
			arg_113_0.canTriggerAccompanyPerformance = true

			warning(arg_113_0.canTriggerAccompanyPerformance)
		end, var_113_0.performance_time, -1)

		arg_113_0.accompanyPerformanceTimer:Start()
		arg_113_0:PlayTimeline(var_113_3, function(arg_118_0, arg_118_1)
			arg_118_1()
			arg_115_0()
		end)
	end)
	seriesAsync(var_113_8, function()
		assert(arg_113_0.accompanyFavorTimer)
		arg_113_0.accompanyFavorTimer:Stop()

		arg_113_0.accompanyFavorTimer = nil

		assert(arg_113_0.accompanyPerformanceTimer)
		arg_113_0.accompanyPerformanceTimer:Stop()

		arg_113_0.accompanyPerformanceTimer = nil
		arg_113_0.canTriggerAccompanyPerformance = nil

		local var_119_0 = math.min(arg_113_0.accompanyFavorCount, getProxy(ApartmentProxy):getStamina())

		if var_119_0 > 0 then
			local var_119_1 = var_113_7[var_119_0]

			warning(var_119_1)
			arg_113_0:emit(Dorm3dRoomMediator.TRIGGER_FAVOR, arg_113_0.apartment.configId, var_119_1)
		end

		local var_119_2 = 0
		local var_119_3 = getProxy(ApartmentProxy):GetAccompanyTime()

		if var_119_3 then
			var_119_2 = pg.TimeMgr.GetInstance():GetServerTime() - var_119_3
		end

		pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataAccompany(2, var_113_0.ship_id, var_113_0.performance_time, var_119_2, var_113_1 or arg_113_0.artSceneInfo))
		arg_113_0:SetUI(nil, "back", "back")
	end)
end

function var_0_0.ExitAccompanyMode(arg_120_0)
	existCall(arg_120_0.timelineFinishCall)
end

function var_0_0.EnterTouchMode(arg_121_0)
	if arg_121_0.ladyDict[arg_121_0.apartment:GetConfigID()]:GetBlackboardValue("inTouching") then
		return
	end

	local var_121_0 = arg_121_0.ladyDict[arg_121_0.apartment:GetConfigID()]
	local var_121_1 = arg_121_0.room:getApartmentZoneConfig(var_121_0.ladyBaseZone, "touch_id", arg_121_0.apartment:GetConfigID())

	arg_121_0.touchConfig = var_121_1 and pg.dorm3d_touch_data[var_121_1] or nil
	arg_121_0.inTouchGame = arg_121_0.touchConfig.heartbeat_enable > 0

	setActive(arg_121_0.rtTouchGamePanel, arg_121_0.inTouchGame)

	if arg_121_0.inTouchGame then
		arg_121_0.touchCount = 0
		arg_121_0.lastCount = 0
		arg_121_0.topCount = 0

		arg_121_0:UpdateTouchGameDisplay()
		setSlider(arg_121_0.rtTouchGamePanel:Find("slider"), 0, 100, arg_121_0.touchCount >= 500 and 100 or arg_121_0.touchCount % 100)
		quickPlayAnimation(arg_121_0.rtTouchGamePanel, "anim_dorm3d_touch_in")
		quickPlayAnimation(arg_121_0.rtTouchGamePanel:Find("slider/icon"), "anim_dorm3d_touch_icon")

		arg_121_0.downTimer = Timer.New(function()
			if not arg_121_0.ladyDict[arg_121_0.apartment:GetConfigID()]:GetBlackboardValue("inTalking") then
				arg_121_0:UpdateTouchCount(-2)
			end
		end, 1, -1)

		arg_121_0.downTimer:Start()
	end

	local var_121_2 = {}

	table.insert(var_121_2, function(arg_123_0)
		var_121_0:SetBlackboardValue("inTouching", true)
		arg_121_0:emit(arg_121_0.SHOW_BLOCK)
		arg_121_0:SetUI(arg_123_0, "blank")
	end)
	table.insert(var_121_2, function(arg_124_0)
		local var_124_0 = arg_121_0.inTouchGame and math.floor(arg_121_0.touchCount / 100) or 0
		local var_124_1 = arg_121_0.touchConfig.ik_status[var_124_0 + 1]

		arg_121_0:SwitchIKConfig(var_121_0, var_124_1)
		setActive(arg_121_0.uiContianer:Find("ik/btn_back"), true)
		arg_121_0:SetIKState(true, arg_124_0)
	end)
	table.insert(var_121_2, function(arg_125_0)
		existCall(arg_125_0)
	end)
	seriesAsync(var_121_2, function()
		Shader.SetGlobalFloat("_ScreenClipOff", 0)
		arg_121_0:emit(arg_121_0.HIDE_BLOCK)
	end)
end

function var_0_0.ExitTouchMode(arg_127_0)
	local var_127_0 = arg_127_0.ladyDict[arg_127_0.apartment:GetConfigID()]

	if not var_127_0:GetBlackboardValue("inTouching") then
		return
	end

	local var_127_1 = {}

	if arg_127_0.inTouchGame then
		table.insert(var_127_1, function(arg_128_0)
			arg_127_0:emit(arg_127_0.SHOW_BLOCK)
			quickPlayAnimation(arg_127_0.rtTouchGamePanel, "anim_dorm3d_touch_out")
			onDelayTick(arg_128_0, 0.5)
		end)
		table.insert(var_127_1, function(arg_129_0)
			local var_129_0 = 0

			for iter_129_0, iter_129_1 in ipairs(arg_127_0.touchConfig.heartbeat_favor) do
				if iter_129_1[1] > arg_127_0.topCount then
					break
				else
					var_129_0 = iter_129_1[2]
				end
			end

			if var_129_0 > 0 then
				arg_127_0:emit(Dorm3dRoomMediator.TRIGGER_FAVOR, arg_127_0.apartment.configId, var_129_0)
			end

			arg_127_0.touchCount = nil
			arg_127_0.topCount = nil

			if arg_127_0.downTimer then
				arg_127_0.downTimer:Stop()

				arg_127_0.downTimer = nil
			end

			arg_127_0.inTouchGame = false

			setActive(arg_127_0.rtTouchGamePanel, false)
			Shader.SetGlobalFloat("_ScreenClipOff", 1)
			arg_129_0()
		end)
	else
		table.insert(var_127_1, function(arg_130_0)
			arg_127_0:emit(arg_127_0.SHOW_BLOCK)

			local var_130_0 = arg_127_0.touchConfig.default_favor

			if var_130_0 > 0 then
				arg_127_0:emit(Dorm3dRoomMediator.TRIGGER_FAVOR, arg_127_0.apartment.configId, var_130_0)
			end

			Shader.SetGlobalFloat("_ScreenClipOff", 1)
			arg_130_0()
		end)
	end

	table.insert(var_127_1, function(arg_131_0)
		var_127_0.ikConfig = {
			character_position = var_127_0.ladyBaseZone,
			character_action = arg_127_0.touchConfig.finish_action
		}

		arg_127_0:SetIKState(false, arg_131_0)
	end)
	table.insert(var_127_1, function(arg_132_0)
		var_127_0.ikConfig = nil
		arg_127_0.blockIK = nil

		arg_127_0:SetUI(arg_132_0, "back")
	end)
	seriesAsync(var_127_1, function()
		var_127_0:SetBlackboardValue("inTouching", false)
		arg_127_0:emit(arg_127_0.HIDE_BLOCK)

		arg_127_0.touchConfig = nil
		arg_127_0.blockIK = nil

		local var_133_0 = arg_127_0.touchExitCall

		arg_127_0.touchExitCall = nil

		existCall(var_133_0)
	end)
end

function var_0_0.ChangeWalkScene(arg_134_0, arg_134_1, arg_134_2)
	local var_134_0 = arg_134_0.ladyDict[arg_134_0.apartment:GetConfigID()]

	seriesAsync({
		function(arg_135_0)
			arg_134_0:ChangeArtScene(arg_134_1, arg_135_0)
		end,
		function(arg_136_0)
			var_134_0:ChangeSubScene(arg_134_1, arg_136_0)
		end,
		function(arg_137_0)
			arg_134_0:emit(arg_134_0.SHOW_BLOCK)

			if arg_134_1 == arg_134_0.sceneInfo then
				arg_134_0:SetUI(arg_137_0, "back")
			elseif arg_134_0.uiState ~= "walk" then
				arg_134_0:SetUI(arg_137_0, "walk")
			else
				arg_137_0()
			end
		end
	}, function()
		arg_134_0:emit(arg_134_0.HIDE_BLOCK)
		var_134_0:SetBlackboardValue("inWalk", arg_134_1 ~= arg_134_0.sceneInfo)
		existCall(arg_134_2)
	end)
end

function var_0_0.EnterWalkMode(arg_139_0)
	local var_139_0 = arg_139_0.apartment:GetConfigID()
	local var_139_1 = arg_139_0.ladyDict[var_139_0]

	seriesAsync({
		function(arg_140_0)
			arg_139_0:emit(arg_139_0.SHOW_BLOCK)
			arg_139_0:HideCharacter(var_139_0)
			var_139_1:SetBlackboardValue("inWalk", true)
			arg_139_0:SetUI(arg_140_0, "walk")
		end,
		function(arg_141_0)
			arg_139_0:emit(arg_139_0.HIDE_BLOCK)
			arg_139_0:ChangeArtScene(arg_139_0.walkInfo.scene .. "|" .. arg_139_0.walkInfo.sceneRoot, arg_141_0)
		end,
		function(arg_142_0)
			arg_139_0:LoadSubScene(arg_139_0.walkInfo, arg_142_0)
		end
	}, function()
		return
	end)
end

function var_0_0.ExitWalkMode(arg_144_0)
	local var_144_0 = arg_144_0.apartment:GetConfigID()
	local var_144_1 = arg_144_0.ladyDict[var_144_0]

	seriesAsync({
		function(arg_145_0)
			arg_144_0:ChangeArtScene(arg_144_0.walkLastSceneInfo, arg_145_0)
		end,
		function(arg_146_0)
			arg_144_0:UnloadSubScene(arg_144_0.walkInfo, arg_146_0)
		end,
		function(arg_147_0)
			arg_144_0:emit(arg_144_0.SHOW_BLOCK)
			arg_144_0:SetUI(arg_147_0, "back")
		end
	}, function()
		arg_144_0:emit(arg_144_0.HIDE_BLOCK)
		arg_144_0:RevertCharacter(var_144_0)
		var_144_1:SetBlackboardValue("inWalk", false)

		local var_148_0 = arg_144_0.walkExitCall

		arg_144_0.walkExitCall = nil
		arg_144_0.walkLastSceneInfo = nil
		arg_144_0.walkInfo = nil

		existCall(var_148_0)
	end)
end

function var_0_0.EnableMiniGameCutIn(arg_149_0)
	if not arg_149_0.tfCutIn then
		return
	end

	local var_149_0 = arg_149_0.rtExtraScreen:Find("MiniGameCutIn")

	setActive(var_149_0, true)

	local var_149_1 = GetOrAddComponent(var_149_0:Find("bg/mask/cut_in"), "CameraRTUI")

	setActive(var_149_1, true)
	pg.CameraRTMgr.GetInstance():Bind(var_149_1, arg_149_0.tfCutIn:Find("TestCamera"):GetComponent(typeof(Camera)))
	quickPlayAnimator(arg_149_0.modelCutIn.lady, "Idle")
	quickPlayAnimator(arg_149_0.modelCutIn.player, "Idle")
	setActive(arg_149_0.tfCutIn, true)
end

function var_0_0.DisableMiniGameCutIn(arg_150_0)
	if not arg_150_0.tfCutIn then
		return
	end

	local var_150_0 = arg_150_0.rtExtraScreen:Find("MiniGameCutIn")
	local var_150_1 = GetOrAddComponent(var_150_0:Find("bg/mask/cut_in"), "CameraRTUI")

	pg.CameraRTMgr.GetInstance():Clean(var_150_1)
	setActive(var_150_0, false)
	setActive(arg_150_0.tfCutIn, false)
end

function var_0_0.SwitchIKConfig(arg_151_0, arg_151_1, arg_151_2)
	local var_151_0 = pg.dorm3d_ik_status[arg_151_2]

	if var_151_0.skin_id ~= arg_151_1.skinId then
		local var_151_1 = pg.dorm3d_ik_status.get_id_list_by_base[var_151_0.base]
		local var_151_2 = _.detect(var_151_1, function(arg_152_0)
			return pg.dorm3d_ik_status[arg_152_0].skin_id == arg_151_1.skinId
		end)

		assert(var_151_2, string.format("Missing Status Config By Skin: %s original Status: %s", arg_151_1.skinId, arg_151_2))

		var_151_0 = pg.dorm3d_ik_status[var_151_2]
	end

	arg_151_1.ikConfig = var_151_0
end

function var_0_0.SetIKState(arg_153_0, arg_153_1, arg_153_2)
	local var_153_0 = arg_153_0.ladyDict[arg_153_0.apartment:GetConfigID()]
	local var_153_1 = {}

	if arg_153_1 then
		table.insert(var_153_1, function(arg_154_0)
			var_153_0:SetBlackboardValue("inIK", true)
			arg_153_0:emit(arg_153_0.SHOW_BLOCK)

			local var_154_0 = var_153_0.ikConfig.camera_group

			setActive(arg_153_0.uiContianer:Find("ik/Right/btn_camera"), #pg.dorm3d_ik_status.get_id_list_by_camera_group[var_154_0] > 1)
			arg_154_0()
		end)

		if arg_153_0.uiState ~= "ik" then
			table.insert(var_153_1, function(arg_155_0)
				arg_153_0:SetUI(arg_155_0, "ik")
			end)
		end

		table.insert(var_153_1, function(arg_156_0)
			Shader.SetGlobalFloat("_ScreenClipOff", 0)
			arg_153_0.SetIKStatus(var_153_0, var_153_0.ikConfig, arg_156_0)
		end)
		table.insert(var_153_1, function(arg_157_0)
			arg_153_0:emit(arg_153_0.HIDE_BLOCK)
			arg_157_0()
		end)
	else
		assert(arg_153_0.uiState == "ik")
		table.insert(var_153_1, function(arg_158_0)
			arg_153_0:emit(arg_153_0.SHOW_BLOCK)
			Shader.SetGlobalFloat("_ScreenClipOff", 1)
			arg_158_0()
		end)

		local var_153_2 = var_153_0.skinIdList

		if var_153_0.skinId ~= var_153_2[1] then
			table.insert(var_153_1, function(arg_159_0)
				local var_159_0 = arg_153_0.apartment:GetConfigID()

				arg_153_0.SwitchCharacterSkin(var_153_0, var_159_0, var_153_2[1], arg_159_0)
			end)
		end

		table.insert(var_153_1, function(arg_160_0)
			warning(var_153_0.ikConfig.character_action)
			var_153_0:ExitIKStatus(var_153_0.ikConfig, arg_160_0)
		end)
		table.insert(var_153_1, function(arg_161_0)
			arg_153_0:SetUI(arg_161_0, "back")
		end)
		table.insert(var_153_1, function(arg_162_0)
			var_153_0:SetBlackboardValue("inIK", false)
			arg_153_0:emit(arg_153_0.HIDE_BLOCK)
			arg_162_0()
		end)
	end

	seriesAsync(var_153_1, arg_153_2)
end

function var_0_0.TouchModeAction(arg_163_0, arg_163_1, arg_163_2, ...)
	return switch(arg_163_2, {
		function(arg_164_0, arg_164_1)
			return function(arg_165_0)
				seriesAsync({
					function(arg_166_0)
						arg_163_0.RevertAllIKLayer(arg_163_1, 0, arg_166_0)
					end,
					function(arg_167_0)
						if not arg_164_1 or arg_164_1 == "" then
							return arg_167_0()
						end

						arg_163_0:PlaySingleAction(arg_164_1, arg_167_0)
					end,
					function(arg_168_0)
						arg_163_0:SwitchIKConfig(arg_163_1, arg_164_0)
						arg_163_0:SetIKState(true, arg_168_0)
					end,
					arg_165_0
				})
			end
		end,
		function()
			return function()
				if arg_163_0.ikSpecialCall then
					local var_170_0 = arg_163_0.ikSpecialCall

					arg_163_0.ikSpecialCall = nil

					existCall(var_170_0)
				else
					arg_163_0:ExitTouchMode()
				end
			end
		end,
		function(arg_171_0, arg_171_1)
			return function(arg_172_0)
				arg_163_0.RevertAllIKLayer(arg_163_1, arg_171_0, function()
					arg_163_0:PlaySingleAction(arg_171_1, arg_172_0)
				end)
			end
		end,
		function(arg_174_0, arg_174_1)
			return function(arg_175_0)
				arg_163_0.RevertAllIKLayer(arg_163_1, arg_174_0, function()
					arg_163_0:DoTalk(arg_174_1, arg_175_0)
				end)
			end
		end
	}, function()
		return function()
			return
		end
	end, ...)
end

function var_0_0.OnTriggerIK(arg_179_0, arg_179_1)
	local var_179_0 = arg_179_0.ladyDict[arg_179_0.apartment:GetConfigID()]

	if not var_179_0.ikConfig then
		return
	end

	for iter_179_0, iter_179_1 in ipairs(var_179_0.ikConfig.ik_id) do
		local var_179_1, var_179_2, var_179_3 = unpack(iter_179_1)

		if var_179_1 == arg_179_1 then
			arg_179_0.blockIK = true

			arg_179_0:TouchModeAction(var_179_0, unpack(var_179_3))(function()
				arg_179_0.enableIKTip = true

				arg_179_0:ResetIKTipTimer()

				arg_179_0.blockIK = nil
			end)

			return
		end
	end

	assert(false, string.format("Missing %s callback in status %s", arg_179_1, var_179_0.ikConfig.id))
end

function var_0_0.OnTouchCharacterBody(arg_181_0, arg_181_1)
	local var_181_0 = arg_181_0.ladyDict[arg_181_0.apartment:GetConfigID()]

	if not var_181_0.ikConfig then
		return
	end

	for iter_181_0, iter_181_1 in ipairs(var_181_0.ikConfig.touch_data) do
		local var_181_1, var_181_2, var_181_3 = unpack(iter_181_1)
		local var_181_4 = pg.dorm3d_ik_touch[var_181_1]

		if var_181_4.body == arg_181_1 then
			local var_181_5 = var_181_4.action_emote

			if #var_181_5 > 0 then
				var_181_0:PlayFaceAnim(var_181_5)
			end

			local var_181_6 = var_181_4.vibrate

			if type(var_181_6) == "table" and VibrateMgr.Instance:IsSupport() then
				local var_181_7 = {}
				local var_181_8 = {}
				local var_181_9 = {}

				underscore.each(var_181_6, function(arg_182_0)
					table.insert(var_181_7, arg_182_0[1])
					table.insert(var_181_8, arg_182_0[2])
					table.insert(var_181_9, 1)
				end)

				if PLATFORM == PLATFORM_ANDROID then
					VibrateMgr.Instance:VibrateWaveform(var_181_7, var_181_8)
				elseif PLATFORM == PLATFORM_ANDROID then
					VibrateMgr.Instance:VibrateWaveform(var_181_7, var_181_8, var_181_9)
				end
			end

			arg_181_0.blockIK = true

			arg_181_0:TouchModeAction(var_181_0, unpack(var_181_3))(function()
				arg_181_0.enableIKTip = true

				arg_181_0:ResetIKTipTimer()

				arg_181_0.blockIK = nil
			end)

			return
		end
	end
end

function var_0_0.UpdateTouchGameDisplay(arg_184_0)
	setActive(arg_184_0.rtTouchGamePanel:Find("effect_bg"), arg_184_0.touchCount > 100)
	setActive(arg_184_0.rtTouchGamePanel:Find("slider/icon/beating"), arg_184_0.touchCount > 100)

	if arg_184_0.touchCount < 100 then
		quickPlayAnimation(arg_184_0.rtTouchGamePanel, "anim_dorm3d_touch_change_out")
		quickPlayAnimation(arg_184_0.rtTouchGamePanel:Find("slider/icon"), "anim_dorm3d_touch_icon")
	elseif arg_184_0.touchCount < 200 then
		quickPlayAnimation(arg_184_0.rtTouchGamePanel, "anim_dorm3d_touch_change")
		quickPlayAnimation(arg_184_0.rtTouchGamePanel:Find("slider/icon"), "anim_dorm3d_touch_icon_1")
		pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_heartbeat")
	end
end

function var_0_0.UpdateTouchCount(arg_185_0, arg_185_1)
	local var_185_0 = arg_185_0.touchCount

	arg_185_0.touchCount = math.clamp(arg_185_0.touchCount + arg_185_1, 100 * math.floor(arg_185_0.touchCount / 100), 500)

	warning(arg_185_0.touchCount)

	if arg_185_0.sliderLT and LeanTween.isTweening(arg_185_0.sliderLT) then
		var_185_0 = LeanTween.descr(arg_185_0.sliderLT).val

		LeanTween.cancel(arg_185_0.sliderLT)

		arg_185_0.sliderLT = nil
	end

	if math.clamp(var_185_0, 0, 500) ~= math.clamp(arg_185_0.touchCount, 0, 500) then
		local var_185_1 = GetComponent(arg_185_0.rtTouchGamePanel:Find("slider"), typeof(Slider))

		arg_185_0.sliderLT = LeanTween.value(var_185_0, arg_185_0.touchCount, math.abs(arg_185_0.touchCount - var_185_0) / 50):setOnUpdate(System.Action_float(function(arg_186_0)
			var_185_1.value = arg_186_0 >= 500 and 100 or arg_186_0 % 100
		end)):setEase(LeanTweenType.easeInOutCubic).uniqueId
	else
		setSlider(arg_185_0.rtTouchGamePanel:Find("slider"), 0, 100, arg_185_0.touchCount >= 500 and 100 or arg_185_0.touchCount % 100)
	end

	if math.floor(arg_185_0.touchCount / 100) ~= math.floor(var_185_0 / 100) then
		arg_185_0:UpdateTouchGameDisplay()

		local var_185_2 = arg_185_0.touchConfig.ik_status[math.floor(arg_185_0.touchCount / 100) + 1]

		if var_185_2 then
			arg_185_0:SwitchIKConfig(arg_185_0, var_185_2)
			arg_185_0:SetIKState(true)
		end
	end

	arg_185_0.topCount = math.max(arg_185_0.topCount, arg_185_0.touchCount)
end

function var_0_0.DoTouch(arg_187_0, arg_187_1, arg_187_2)
	if arg_187_0.inTouchGame then
		switch(arg_187_2, {
			function()
				arg_187_0:UpdateTouchCount(10)
			end,
			function()
				arg_187_0:UpdateTouchCount(2)
			end,
			function()
				arg_187_0:UpdateTouchCount(10)
			end,
			function()
				arg_187_0:UpdateTouchCount(20)
			end
		})
	end
end

function var_0_0.DoTalk(arg_192_0, arg_192_1, arg_192_2)
	while rawget(arg_192_0, "class") ~= var_0_0 do
		arg_192_0 = getmetatable(arg_192_0).__index
	end

	if arg_192_0.apartment and arg_192_0.ladyDict[arg_192_0.apartment:GetConfigID()]:GetBlackboardValue("inTalking") then
		errorMsg("Talking block:" .. arg_192_1)

		return
	end

	if not arg_192_0.room:isPersonalRoom() then
		local var_192_0 = pg.dorm3d_dialogue_group[arg_192_1].char_id

		if arg_192_0.apartment then
			assert(arg_192_0.apartment:GetConfigID() == var_192_0)
		else
			arg_192_0:SetApartment(getProxy(ApartmentProxy):getApartment(var_192_0))
		end
	end

	local var_192_1 = arg_192_0.ladyDict[arg_192_0.apartment:GetConfigID()]

	if arg_192_1 == 10010 and not arg_192_0.apartment.talkDic[arg_192_1] then
		arg_192_0.firstTimelineTouch = true
		arg_192_0.firstMoveGuide = true
	end

	local var_192_2 = {}
	local var_192_3 = arg_192_0.ladyDict[arg_192_0.apartment:GetConfigID()]

	if var_192_3:GetBlackboardValue("inPending") then
		table.insert(var_192_2, function(arg_193_0)
			arg_192_0:OutOfLazy(arg_192_0.apartment:GetConfigID(), arg_193_0)
		end)
	end

	local var_192_4 = pg.dorm3d_dialogue_group[arg_192_1]
	local var_192_5 = var_192_4.performance_type == 1
	local var_192_6

	table.insert(var_192_2, function(arg_194_0)
		arg_192_0:emit(arg_192_0.SHOW_BLOCK)
		var_192_3:SetBlackboardValue(var_192_5 and "inPerformance" or "inTalking", true)
		arg_192_0:emit(Dorm3dRoomMediator.DO_TALK, arg_192_1, function(arg_195_0)
			var_192_6 = arg_195_0

			arg_194_0()
		end)
	end)
	table.insert(var_192_2, function(arg_196_0)
		pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataDialog(arg_192_0.apartment.configId, arg_192_0.apartment.level, arg_192_1, var_192_4.type, arg_192_0.room:getZoneConfig(arg_192_0.ladyDict[arg_192_0.apartment:GetConfigID()].ladyBaseZone, "id"), var_192_4.action_type, table.CastToString(var_192_4.trigger_config), arg_192_0.room:GetConfigID()))

		if pg.NewGuideMgr.GetInstance():IsBusy() then
			pg.NewGuideMgr.GetInstance():Pause()
		end

		arg_192_0:SetUI(arg_196_0, "blank")
	end)

	if var_192_4.trigger_area and var_192_4.trigger_area ~= "" then
		table.insert(var_192_2, function(arg_197_0)
			arg_192_0:ShiftZone(var_192_4.trigger_area, arg_197_0)
		end)
	end

	if var_192_4.performance_type == 0 then
		table.insert(var_192_2, function(arg_198_0)
			pg.NewStoryMgr.GetInstance():ForceManualPlay(var_192_4.story, function()
				onDelayTick(arg_198_0, 0.001)
			end, true)
		end)
	elseif var_192_4.performance_type == 1 then
		table.insert(var_192_2, function(arg_200_0)
			arg_192_0:emit(arg_192_0.HIDE_BLOCK)
			arg_192_0:PerformanceQueue(var_192_4.story, arg_200_0)
		end)
		table.insert(var_192_2, function(arg_201_0)
			arg_192_0:emit(arg_192_0.SHOW_BLOCK)
			arg_201_0()
		end)
	else
		assert(false)
	end

	table.insert(var_192_2, function(arg_202_0)
		local var_202_0 = pg.NewStoryMgr.GetInstance():StoryName2StoryId(var_192_4.story)

		if var_202_0 then
			local var_202_1 = "1"

			pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataStory(var_202_0, var_202_1))
		end

		if var_192_6 and #var_192_6 > 0 then
			arg_192_0:emit(Dorm3dRoomMediator.OPEN_DROP_LAYER, var_192_6, arg_202_0)
		else
			arg_202_0()
		end
	end)
	table.insert(var_192_2, function(arg_203_0)
		if pg.NewGuideMgr.GetInstance():IsPause() then
			pg.NewGuideMgr.GetInstance():Resume()
		end

		arg_192_0:emit(arg_192_0.HIDE_BLOCK)
		var_192_3:SetBlackboardValue(var_192_5 and "inPerformance" or "inTalking", false)
		arg_192_0:SetUI(arg_203_0, "back")
	end)
	seriesAsync(var_192_2, function()
		if arg_192_2 then
			return arg_192_2()
		else
			arg_192_0:CheckQueue()
		end
	end)
end

function var_0_0.DoTalkTouchOption(arg_205_0, arg_205_1, arg_205_2, arg_205_3)
	local var_205_0 = arg_205_0.rtExtraScreen:Find("TalkTouchOption")
	local var_205_1 = pg.NewStoryMgr.GetInstance()._tf

	if isActive(var_205_1) then
		setParent(var_205_0, var_205_1)
	else
		pg.UIMgr.GetInstance():OverlayPanel(var_205_0, {
			weight = LayerWeightConst.SECOND_LAYER,
			groupName = LayerWeightConst.GROUP_DORM3D
		})
	end

	arg_205_0.tempExtraPanel = var_205_0

	local var_205_2
	local var_205_3 = var_205_0:Find("content")

	UIItemList.StaticAlign(var_205_3, var_205_3:Find("clickTpl"), #arg_205_1.options, function(arg_206_0, arg_206_1, arg_206_2)
		arg_206_1 = arg_206_1 + 1

		if arg_206_0 == UIItemList.EventUpdate then
			local var_206_0 = arg_205_1.options[arg_206_1]

			setAnchoredPosition(arg_206_2, NewPos(unpack(var_206_0.pos)))
			onButton(arg_205_0, arg_206_2, function()
				var_205_2(var_206_0.flag)
			end, SFX_CONFIRM)
			setActive(arg_206_2, not table.contains(arg_205_2, var_206_0.flag))
		end
	end)
	setActive(var_205_0, true)

	function var_205_2(arg_208_0)
		setActive(var_205_0, false)

		if isActive(var_205_1) then
			setParent(var_205_0, arg_205_0.rtExtraScreen)
		else
			pg.UIMgr.GetInstance():UnOverlayPanel(var_205_0, arg_205_0.rtExtraScreen)
		end

		arg_205_0.tempExtraPanel = nil

		arg_205_3(arg_208_0)
	end
end

function var_0_0.DoTimelineOption(arg_209_0, arg_209_1, arg_209_2)
	local var_209_0 = arg_209_0.rtExtraScreen:Find("TimelineOption")

	if not var_209_0 then
		return
	end

	local var_209_1 = pg.NewStoryMgr.GetInstance()._tf

	if isActive(var_209_1) then
		setParent(var_209_0, var_209_1)
	else
		pg.UIMgr.GetInstance():OverlayPanel(var_209_0, {
			weight = LayerWeightConst.SECOND_LAYER,
			groupName = LayerWeightConst.GROUP_DORM3D
		})
	end

	arg_209_0.tempExtraPanel = var_209_0

	local var_209_2
	local var_209_3 = var_209_0:Find("content")

	UIItemList.StaticAlign(var_209_3, var_209_3:Find("clickTpl"), #arg_209_1, function(arg_210_0, arg_210_1, arg_210_2)
		arg_210_1 = arg_210_1 + 1

		if arg_210_0 == UIItemList.EventUpdate then
			local var_210_0 = arg_209_1[arg_210_1]

			setText(arg_210_2:Find("Text"), var_210_0.content)
			onButton(arg_209_0, arg_210_2, function()
				var_209_2(arg_210_1)
			end, SFX_CONFIRM)
		end
	end)
	setActive(var_209_0, true)

	function var_209_2(arg_212_0)
		setActive(var_209_0, false)

		if isActive(var_209_1) then
			setParent(var_209_0, arg_209_0.rtExtraScreen)
		else
			pg.UIMgr.GetInstance():UnOverlayPanel(var_209_0, arg_209_0.rtExtraScreen)
		end

		arg_209_0.tempExtraPanel = nil

		arg_209_2(arg_212_0)
	end
end

function var_0_0.DoTimelineTouch(arg_213_0, arg_213_1, arg_213_2)
	local var_213_0 = arg_213_0.rtExtraScreen:Find("TimelineTouch")

	if not var_213_0 then
		return
	end

	local var_213_1 = pg.NewStoryMgr.GetInstance()._tf

	if isActive(var_213_1) then
		setParent(var_213_0, var_213_1)
	else
		pg.UIMgr.GetInstance():OverlayPanel(var_213_0, {
			weight = LayerWeightConst.SECOND_LAYER,
			groupName = LayerWeightConst.GROUP_DORM3D
		})
	end

	arg_213_0.tempExtraPanel = var_213_0

	local var_213_2
	local var_213_3 = var_213_0:Find("content")

	UIItemList.StaticAlign(var_213_3, var_213_3:Find("clickTpl"), #arg_213_1, function(arg_214_0, arg_214_1, arg_214_2)
		arg_214_1 = arg_214_1 + 1

		if arg_214_0 == UIItemList.EventUpdate then
			local var_214_0 = arg_213_1[arg_214_1]

			setAnchoredPosition(arg_214_2, NewPos(unpack(var_214_0.pos)))
			onButton(arg_213_0, arg_214_2, function()
				var_213_2(arg_214_1)
			end, SFX_CONFIRM)

			if arg_213_0.firstTimelineTouch then
				arg_213_0.firstTimelineTouch = nil

				setActive(arg_214_2:Find("finger"), true)
			end
		end
	end)
	setActive(var_213_0, true)

	function var_213_2(arg_216_0)
		setActive(var_213_0, false)

		if isActive(var_213_1) then
			setParent(var_213_0, arg_213_0.rtExtraScreen)
		else
			pg.UIMgr.GetInstance():UnOverlayPanel(var_213_0, arg_213_0.rtExtraScreen)
		end

		arg_213_0.tempExtraPanel = nil

		arg_213_2(arg_216_0)
	end
end

function var_0_0.DoShortWait(arg_217_0, arg_217_1)
	local var_217_0 = arg_217_0.ladyDict[arg_217_1]
	local var_217_1 = getProxy(ApartmentProxy):getApartment(arg_217_1)
	local var_217_2 = arg_217_0.room:getApartmentZoneConfig(var_217_0.ladyBaseZone, "special_action", arg_217_1)
	local var_217_3 = var_217_2 and var_217_2[math.random(#var_217_2)] or nil

	if not var_217_3 then
		return
	end

	var_217_0:PlaySingleAction(var_217_3)
end

function var_0_0.OutOfLazy(arg_218_0, arg_218_1, arg_218_2)
	local var_218_0 = arg_218_0.ladyDict[arg_218_1]
	local var_218_1 = {}

	if var_218_0:GetBlackboardValue("inPending") then
		table.insert(var_218_1, function(arg_219_0)
			arg_218_0.shiftLady = arg_218_1

			arg_218_0:ShiftZone(var_218_0.ladyBaseZone, arg_219_0)
		end)
	end

	seriesAsync(var_218_1, arg_218_2)
end

function var_0_0.OutOfPending(arg_220_0, arg_220_1, arg_220_2)
	assert(arg_220_0.wakeUpTalkId)

	local var_220_0 = arg_220_0.wakeUpTalkId

	seriesAsync({
		function(arg_221_0)
			arg_220_0:SetUI(arg_221_0, "blank")
		end,
		function(arg_222_0)
			arg_220_0.shiftLady = arg_220_1

			arg_220_0:ShiftZone(arg_220_0.ladyBaseZone, arg_222_0)
		end,
		function(arg_223_0)
			arg_220_0:DoTalk(var_220_0, arg_223_0)
		end
	}, function()
		arg_220_0:SetUIStore(arg_220_2, "back")
	end)
end

function var_0_0.ChangeCanWatchState(arg_225_0)
	local var_225_0

	if arg_225_0:GetBlackboardValue("inPending") then
		var_225_0 = tobool(arg_225_0:GetBlackboardValue("inDistance"))
	else
		local var_225_1 = arg_225_0:GetBlackboardValue("groupId")

		var_225_0 = tobool(arg_225_0.activeLady[var_225_1] and pg.NodeCanvasMgr.GetInstance():GetBlackboradValue("canWatch", arg_225_0.ladyBlackboard))
	end

	if not arg_225_0.nowCanWatchState or arg_225_0.nowCanWatchState ~= var_225_0 then
		arg_225_0.nowCanWatchState = var_225_0

		arg_225_0:ShowOrHideCanWatchMark(arg_225_0.nowCanWatchState)
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

function var_0_0.HandleGameNotification(arg_226_0, arg_226_1, arg_226_2)
	local var_226_0 = arg_226_0.ladyDict[arg_226_0.apartment:GetConfigID()]

	switch(arg_226_1, {
		[EatFoodMediator.HIT_AREA] = function()
			local var_227_0, var_227_1 = unpack(var_0_1[arg_226_2.index])

			var_226_0:PlaySingleAction(var_227_0)

			if arg_226_0.tfCutIn then
				quickPlayAnimator(arg_226_0.modelCutIn.lady, var_227_1)
				quickPlayAnimator(arg_226_0.modelCutIn.player, var_227_1)
			end
		end,
		[EatFoodMediator.RESULT] = function()
			if arg_226_2.win then
				var_226_0:PlaySingleAction("Face_XYX_victory")
				var_226_0:PlaySingleAction("minigame_win")
			else
				var_226_0:PlaySingleAction("Face_XYX_lose")
				var_226_0:PlaySingleAction("minigame_lose")
			end

			setActive(arg_226_0.rtExtraScreen:Find("MiniGameCutIn"), false)
			pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataMiniGame(2, arg_226_2.score))
		end,
		[EatFoodMediator.LEAVE_GAME] = function()
			if arg_226_2 == false then
				pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataMiniGame(3))
			end
		end
	})
end

function var_0_0.PerformanceQueue(arg_230_0, arg_230_1, arg_230_2)
	local var_230_0, var_230_1 = pcall(function()
		return require("GameCfg.dorm." .. arg_230_1)
	end)

	if not var_230_0 then
		errorMsg("不存在表演ID对应的Lua:" .. arg_230_1)
		existCall(arg_230_2)

		return
	end

	warning(arg_230_1)

	local var_230_2 = {}

	table.insert(var_230_2, function(arg_232_0)
		arg_230_0:SetUI(arg_232_0, "blank")
	end)
	table.insertto(var_230_2, underscore.map(var_230_1, function(arg_233_0)
		return switch(arg_233_0.type, {
			function()
				return function(arg_235_0)
					local var_235_0 = unpack(arg_233_0.params)

					arg_230_0:DoTalk(var_235_0, arg_235_0, true)
				end
			end,
			function()
				return function(arg_237_0)
					arg_230_0.touchExitCall = arg_237_0

					arg_230_0:EnterTouchMode()
				end
			end,
			function()
				return function(arg_239_0)
					arg_230_0.ladyDict[arg_230_0.apartment:GetConfigID()]:PlaySingleAction(arg_233_0.name, arg_239_0)
				end
			end,
			function()
				return function(arg_241_0)
					arg_230_0:emit(arg_230_0.PLAY_EXPRESSION, arg_233_0)
					arg_241_0()
				end
			end,
			function()
				return function(arg_243_0)
					arg_230_0:ShiftZone(arg_233_0.name, arg_243_0)
				end
			end,
			function()
				return function(arg_245_0)
					arg_230_0.contextData.timeIndex = arg_233_0.params[1]

					if arg_230_0.artSceneInfo == arg_230_0.sceneInfo then
						arg_230_0:SwitchDayNight(arg_230_0.contextData.timeIndex)
						onNextTick(function()
							arg_230_0:RefreshSlots()
						end)
					end

					arg_230_0:UpdateContactState()
					onNextTick(arg_245_0)
				end
			end,
			function()
				return function(arg_248_0)
					arg_230_0:ActiveStateCamera(arg_233_0.name, arg_248_0)
				end
			end,
			function()
				return function(arg_250_0)
					if arg_233_0.name == "base" then
						arg_230_0:ChangeArtScene(arg_230_0.sceneInfo, arg_250_0)
					else
						local var_250_0 = arg_233_0.params.scene
						local var_250_1 = arg_233_0.params.sceneRoot

						arg_230_0:ChangeArtScene(var_250_0 .. "|" .. var_250_1, arg_250_0)
					end
				end
			end,
			function()
				return function(arg_252_0)
					local var_252_0 = arg_233_0.params.name

					if arg_233_0.name == "load" then
						arg_230_0.waitForTimeline = tobool(arg_233_0.params.wait_timeline)

						arg_230_0:LoadTimelineScene(var_252_0, true, arg_252_0)
					elseif arg_233_0.name == "unload" then
						arg_230_0:UnloadTimelineScene(var_252_0, true, arg_252_0)
					else
						assert(false)
					end
				end
			end,
			function()
				return function(arg_254_0)
					setActive(arg_230_0.uiContianer:Find("walk/btn_back"), false)

					if arg_233_0.name == "change" then
						local var_254_0 = arg_233_0.params.scene
						local var_254_1 = arg_233_0.params.sceneRoot

						arg_230_0.walkBornPoint = arg_233_0.params.point or "Default"

						arg_230_0:ChangeWalkScene(var_254_0 .. "|" .. var_254_1, arg_254_0)
					elseif arg_233_0.name == "back" then
						arg_230_0.walkBornPoint = nil

						arg_230_0:ChangeWalkScene(arg_230_0.sceneInfo, arg_254_0)
					elseif arg_233_0.name == "set" then
						local function var_254_2()
							local var_255_0 = arg_254_0

							arg_254_0 = nil

							return existCall(var_255_0)
						end

						for iter_254_0, iter_254_1 in pairs(arg_233_0.params) do
							switch(iter_254_0, {
								back_button_trigger = function(arg_256_0)
									onButton(arg_230_0, arg_230_0.uiContianer:Find("walk/btn_back"), var_254_2, "ui-dorm_back_v2")
									setActive(arg_230_0.uiContianer:Find("walk/btn_back"), IsUnityEditor and arg_256_0)
								end,
								near_trigger = function(arg_257_0)
									if arg_257_0 == true then
										arg_257_0 = 1.5
									end

									if arg_257_0 then
										function arg_230_0.walkNearCallback(arg_258_0)
											if arg_258_0 < arg_257_0 then
												arg_230_0.walkNearCallback = nil

												var_254_2()
											end
										end
									else
										arg_230_0.walkNearCallback = nil
									end
								end
							}, nil, iter_254_1)
						end

						if arg_230_0.firstMoveGuide then
							setActive(arg_230_0.povLayer:Find("Guide"), arg_230_0.firstMoveGuide)

							arg_230_0.firstMoveGuide = nil
						end
					else
						assert(false)
					end
				end
			end,
			function()
				return function(arg_260_0)
					if arg_233_0.name == "set" then
						arg_230_0:SwitchIKConfig(arg_230_0, arg_233_0.params.state)
						setActive(arg_230_0.uiContianer:Find("ik/btn_back"), not arg_233_0.params.hide_back)

						arg_230_0.ikSpecialCall = arg_260_0

						arg_230_0:SetIKState(true)
					elseif arg_233_0.name == "back" then
						local var_260_0 = arg_230_0.ladyDict[arg_230_0.apartment:GetConfigID()]

						var_260_0.ikConfig = arg_233_0.params

						arg_230_0:SetIKState(false, function()
							var_260_0.ikConfig = nil

							existCall(arg_260_0)
						end)
					else
						assert(false)
					end
				end
			end,
			function()
				return function(arg_263_0)
					arg_230_0.blackSceneInfo = setmetatable(arg_233_0.params or {}, {
						__index = {
							color = "#000000",
							time = 0.3,
							delay = arg_233_0.name == "show" and 0 or 0.5
						}
					})

					if arg_233_0.name == "show" then
						arg_230_0:ShowBlackScreen(true, arg_263_0)
					elseif arg_233_0.name == "hide" then
						arg_230_0:ShowBlackScreen(false, arg_263_0)
					else
						assert(false)
					end

					arg_230_0.blackSceneInfo = nil
				end
			end
		})
	end))
	table.insert(var_230_2, function(arg_264_0)
		arg_230_0:SetUI(arg_264_0, "back")
	end)
	seriesAsync(var_230_2, arg_230_2)
end

function var_0_0.TriggerContact(arg_265_0, arg_265_1)
	arg_265_0:emit(Dorm3dRoomMediator.COLLECTION_ITEM, {
		itemId = arg_265_1,
		roomId = arg_265_0.room:GetConfigID(),
		groupId = arg_265_0.room:isPersonalRoom() and arg_265_0.apartment:GetConfigID() or 0
	})
end

function var_0_0.UpdateContactState(arg_266_0)
	arg_266_0:SetContactStateDic(arg_266_0.room:getTriggerableCollectItemDic(arg_266_0.contextData.timeIndex))
end

function var_0_0.UpdateFavorDisplay(arg_267_0)
	local var_267_0, var_267_1 = getProxy(ApartmentProxy):getStamina()

	setText(arg_267_0.rtStaminaDisplay:Find("Text"), string.format("%d/%d", var_267_0, var_267_1))
	setActive(arg_267_0.rtStaminaDisplay, false)

	if arg_267_0.apartment then
		setText(arg_267_0.rtFavorLevel:Find("rank/Text"), arg_267_0.apartment.level)

		local var_267_2, var_267_3 = arg_267_0.apartment:getFavor()

		setText(arg_267_0.rtFavorLevel:Find("Text"), string.format("<color=#ff6698>%d</color>/%d", var_267_2, var_267_3))
	end
end

function var_0_0.UpdateBtnState(arg_268_0)
	if arg_268_0.room:isPersonalRoom() then
		setActive(arg_268_0.uiContianer:Find("base/left/btn_furniture/tip"), arg_268_0:CheckSystemOpen("Furniture") and Dorm3dFurniture.NeedViewTip(arg_268_0.room:GetConfigID()))
	else
		setActive(arg_268_0.uiContianer:Find("base/left/btn_furniture/tip"), Dorm3dFurniture.NeedViewTip(arg_268_0.room:GetConfigID()))
	end

	setActive(arg_268_0.uiContianer:Find("base/btn_back/main"), underscore(getProxy(ApartmentProxy):getRawData()):chain():values():filter(function(arg_269_0)
		return tobool(arg_269_0)
	end):any(function(arg_270_0)
		return #arg_270_0:getSpecialTalking() > 0 or arg_270_0:getIconTip() == "main"
	end):value())
	setActive(arg_268_0.uiContianer:Find("base/left/btn_collection/tip"), PlayerPrefs.GetInt("apartment_collection_item", 0) > 0 or PlayerPrefs.GetInt("apartment_collection_recall", 0) > 0)
end

function var_0_0.AddUnlockDisplay(arg_271_0, arg_271_1)
	table.insert(arg_271_0.unlockList, arg_271_1)

	if not isActive(arg_271_0.rtFavorUp) then
		setText(arg_271_0.rtFavorUp:Find("Text"), table.remove(arg_271_0.unlockList, 1))
		setActive(arg_271_0.rtFavorUp, true)
	end
end

function var_0_0.PopFavorTrigger(arg_272_0, arg_272_1)
	local var_272_0 = arg_272_1.triggerId
	local var_272_1 = arg_272_1.delta
	local var_272_2 = arg_272_1.cost
	local var_272_3 = arg_272_1.apartment
	local var_272_4 = pg.dorm3d_favor_trigger[var_272_0]

	if var_272_4.is_repeat == 0 then
		if var_272_0 == getDorm3dGameset("drom3d_favir_trigger_onwer")[1] then
			arg_272_0:AddUnlockDisplay(i18n("dorm3d_own_favor"))
		elseif var_272_0 == getDorm3dGameset("drom3d_favir_trigger_propose")[1] then
			arg_272_0:AddUnlockDisplay(i18n("dorm3d_pledge_favor"))
		else
			arg_272_0:AddUnlockDisplay(string.format("unknow favor trigger:%d unlock", var_272_0))
		end
	elseif arg_272_1.delta > 0 then
		local var_272_5, var_272_6 = var_272_3:getFavor()
		local var_272_7 = var_272_5 + var_272_1

		setText(arg_272_0.rtFavorUpDaily:Find("bg/Text"), string.format("<size=48>+%d</size>", var_272_1))
		setSlider(arg_272_0.rtFavorUpDaily:Find("bg/slider"), 0, var_272_6, var_272_5)
		setAnchoredPosition(arg_272_0.rtFavorUpDaily:Find("bg"), arg_272_1.isGift and NewPos(-354, 223) or NewPos(-208, 105))

		local var_272_8 = {}
		local var_272_9 = arg_272_0.rtFavorUpDaily:Find("bg/effect")

		eachChild(var_272_9, function(arg_273_0)
			setActive(arg_273_0, false)
		end)

		local var_272_10

		if var_272_4.effect and var_272_4.effect ~= "" then
			var_272_10 = var_272_9:Find(var_272_4.effect .. "(Clone)")

			if not var_272_10 then
				table.insert(var_272_8, function(arg_274_0)
					LoadAndInstantiateAsync("Dorm3D/Effect/Prefab/ExpressionUI", "uifx_dorm3d_yinfu01", function(arg_275_0)
						setParent(arg_275_0, var_272_9)

						var_272_10 = tf(arg_275_0)

						arg_274_0()
					end)
				end)
			else
				setActive(var_272_10, true)
			end
		end

		local var_272_11 = arg_272_0.rtFavorUpDaily:GetComponent("DftAniEvent")

		var_272_11:SetTriggerEvent(function(arg_276_0)
			local var_276_0 = GetComponent(arg_272_0.rtFavorUpDaily:Find("bg/slider"), typeof(Slider))

			LeanTween.value(var_272_5, var_272_7, 0.5):setOnUpdate(System.Action_float(function(arg_277_0)
				var_276_0.value = arg_277_0
			end)):setEase(LeanTweenType.easeInOutQuad):setDelay(0.165):setOnComplete(System.Action(function()
				LeanTween.delayedCall(0.165, System.Action(function()
					if arg_272_0.exited then
						return
					end

					quickPlayAnimator(arg_272_0.rtFavorUpDaily, "favor_out")
				end))
			end))
			pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_progaress_bar")
		end)
		var_272_11:SetEndEvent(function(arg_280_0)
			setActive(arg_272_0.rtFavorUpDaily, false)
		end)
		seriesAsync(var_272_8, function()
			local var_281_0 = arg_272_0.ladyDict[var_272_3:GetConfigID()]

			setLocalPosition(arg_272_0.rtFavorUpDaily, arg_272_0:GetLocalPosition(arg_272_0:GetScreenPosition(var_281_0.ladyHeadCenter.position), arg_272_0.rtFavorUpDaily.parent))
			setActive(arg_272_0.rtFavorUpDaily, true)
			SetCompomentEnabled(arg_272_0.rtFavorUpDaily, typeof(Animator), true)
			quickPlayAnimator(arg_272_0.rtFavorUpDaily, "favor_open")

			if var_272_2 > 0 then
				local var_281_1, var_281_2 = getProxy(ApartmentProxy):getStamina()

				setText(arg_272_0.rtStaminaPop:Find("Text/Text (1)"), "-" .. var_272_2)
				setText(arg_272_0.rtStaminaPop:Find("Text"), string.format("%d/%d", var_281_1 + var_272_2, var_281_2))
				setActive(arg_272_0.rtStaminaPop, true)
			end
		end)
	end
end

function var_0_0.PopFavorLevelUp(arg_282_0, arg_282_1, arg_282_2, arg_282_3)
	arg_282_0.isLock = true

	LeanTween.delayedCall(0.33, System.Action(function()
		arg_282_0.isLock = false
	end))

	local var_282_0 = math.floor(arg_282_1.level / 10)
	local var_282_1 = math.fmod(arg_282_1.level, 10)

	GetImageSpriteFromAtlasAsync("ui/favor_atlas", var_282_1, arg_282_0.rtLevelUpWindow:Find("panel/bg/item1/mark/level/digit2"))
	GetImageSpriteFromAtlasAsync("ui/favor_atlas", var_282_0, arg_282_0.rtLevelUpWindow:Find("panel/bg/item1/mark/level/digit1"))
	setActive(arg_282_0.rtLevelUpWindow:Find("panel/bg/item1/mark/level/digit1"), var_282_0 > 0)

	local var_282_2
	local var_282_3

	arg_282_0.clientAward, var_282_3 = Dorm3dIconHelper.SplitStory(arg_282_1:getFavorConfig("levelup_client_item", arg_282_1.level))
	arg_282_0.serverAward = arg_282_2

	local var_282_4 = arg_282_0.rtLevelUpWindow:Find("panel/info/content/itemContent")

	if not arg_282_0.levelItemList then
		arg_282_0.levelItemList = UIItemList.New(var_282_4, var_282_4:Find("tpl"))

		arg_282_0.levelItemList:make(function(arg_284_0, arg_284_1, arg_284_2)
			local var_284_0 = arg_284_1 + 1

			if arg_284_0 == UIItemList.EventUpdate then
				if arg_284_1 < #arg_282_0.serverAward then
					updateDorm3dIcon(arg_284_2, arg_282_0.serverAward[var_284_0])
					onButton(arg_282_0, arg_284_2, function()
						arg_282_0:emit(BaseUI.ON_NEW_DROP, {
							drop = arg_282_0.serverAward[var_284_0]
						})
					end, SFX_PANEL)
				else
					Dorm3dIconHelper.UpdateDorm3dIcon(arg_284_2, arg_282_0.clientAward[var_284_0 - #arg_282_0.serverAward])
					onButton(arg_282_0, arg_284_2, function()
						arg_282_0:emit(Dorm3dRoomMediator.ON_DROP_CLIENT, {
							data = arg_282_0.clientAward[var_284_0 - #arg_282_0.serverAward]
						})
					end, SFX_PANEL)
				end
			end
		end)
	end

	arg_282_0.levelItemList:align(#arg_282_0.serverAward + #arg_282_0.clientAward)
	setActive(arg_282_0.rtLevelUpWindow, true)
	pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_upgrade")
	pg.UIMgr.GetInstance():OverlayPanel(arg_282_0.rtLevelUpWindow, {
		weight = LayerWeightConst.SECOND_LAYER,
		groupName = LayerWeightConst.GROUP_DORM3D
	})

	function arg_282_0.levelUpCallback()
		arg_282_0.levelUpCallback = nil

		if var_282_3 then
			arg_282_0:PopNewStoryTip(var_282_3)
		end

		existCall(arg_282_3)
	end
end

function var_0_0.PopNewStoryTip(arg_288_0, arg_288_1, arg_288_2)
	local var_288_0 = arg_288_0.uiContianer:Find("base/top/story_tip")

	setActive(var_288_0, true)
	LeanTween.delayedCall(1, System.Action(function()
		setActive(var_288_0, false)
	end))
	setText(var_288_0:Find("Text"), i18n("dorm3d_story_unlock_tip", pg.dorm3d_recall[arg_288_1[2]].name))
	existCall(arg_288_2)
end

function var_0_0.UpdateZoneList(arg_290_0)
	local var_290_0

	if arg_290_0.room:isPersonalRoom() then
		var_290_0 = arg_290_0.ladyDict[arg_290_0.apartment:GetConfigID()].ladyBaseZone
	else
		var_290_0 = arg_290_0:GetAttachedFurnitureName()
	end

	for iter_290_0, iter_290_1 in ipairs(arg_290_0.zoneDatas) do
		if iter_290_1:GetWatchCameraName() == var_290_0 then
			setText(arg_290_0.btnZone:Find("Text"), iter_290_1:GetName())
			setTextColor(arg_290_0.rtZoneList:GetChild(iter_290_0 - 1):Find("Name"), Color.NewHex("5CCAFF"))
		else
			setTextColor(arg_290_0.rtZoneList:GetChild(iter_290_0 - 1):Find("Name"), Color.NewHex("FFFFFF99"))
		end
	end
end

function var_0_0.TalkingEventHandle(arg_291_0, arg_291_1)
	local var_291_0 = {}
	local var_291_1 = {}
	local var_291_2 = arg_291_1.data

	if var_291_2.op_list then
		for iter_291_0, iter_291_1 in ipairs(var_291_2.op_list) do
			table.insert(var_291_0, function(arg_292_0)
				local function var_292_0()
					local var_293_0 = arg_292_0

					arg_292_0 = nil

					return existCall(var_293_0)
				end

				switch(iter_291_1.type, {
					action = function()
						arg_291_0.ladyDict[arg_291_0.apartment:GetConfigID()]:PlaySingleAction(iter_291_1.name, var_292_0)
					end,
					timeline = function()
						if arg_291_0.inTouchGame then
							setActive(arg_291_0.rtTouchGamePanel, false)
						end

						arg_291_0:PlayTimeline(iter_291_1, function(arg_296_0, arg_296_1)
							setActive(arg_291_0.rtTouchGamePanel, arg_291_0.inTouchGame)

							var_291_1.notifiCallback = arg_296_1

							var_292_0()
						end)
					end,
					clickOption = function()
						arg_291_0:DoTalkTouchOption(iter_291_1, arg_291_1.flags, function(arg_298_0)
							var_291_1.optionIndex = arg_298_0

							var_292_0()
						end)
					end,
					wait = function()
						arg_291_0.LTs = arg_291_0.LTs or {}

						table.insert(arg_291_0.LTs, LeanTween.delayedCall(iter_291_1.time, System.Action(var_292_0)).uniqueId)
					end,
					expression = function()
						arg_291_0:emit(arg_291_0.PLAY_EXPRESSION, iter_291_1)
						var_292_0()
					end
				}, function()
					assert(false, "op type error:", iter_291_1.type)
				end)

				if iter_291_1.skip then
					var_292_0()
				end
			end)
		end
	end

	seriesAsync(var_291_0, function()
		if arg_291_1.callbackData then
			arg_291_0:emit(Dorm3dRoomMediator.TALKING_EVENT_FINISH, arg_291_1.callbackData.name, var_291_1)
		end
	end)
end

function var_0_0.CheckQueue(arg_303_0)
	if arg_303_0.inGuide or arg_303_0.uiState ~= "base" then
		return
	end

	if arg_303_0.room:GetConfigID() == 1 and arg_303_0:CheckGuide() then
		-- block empty
	elseif arg_303_0.room:isPersonalRoom() and arg_303_0:CheckLevelUp() then
		-- block empty
	elseif arg_303_0.apartment and arg_303_0:CheckEnterDeal() then
		-- block empty
	elseif arg_303_0.apartment and arg_303_0:CheckActiveTalk() then
		-- block empty
	elseif arg_303_0.apartment then
		arg_303_0:CheckFavorTrigger()
	end

	arg_303_0.contextData.hasEnterCheck = true
end

function var_0_0.didEnterCheck(arg_304_0)
	local var_304_0

	if arg_304_0.contextData.specialId then
		var_304_0 = arg_304_0.contextData.specialId
		arg_304_0.contextData.specialId = nil

		arg_304_0:DoTalk(var_304_0, function()
			arg_304_0:closeView()
		end)
	elseif not arg_304_0.contextData.hasEnterCheck and arg_304_0.apartment then
		for iter_304_0, iter_304_1 in ipairs(arg_304_0.apartment:getForceEnterTalking(arg_304_0.room:GetConfigID())) do
			var_304_0 = iter_304_1

			arg_304_0:DoTalk(iter_304_1)

			break
		end
	end

	if var_304_0 and pg.dorm3d_dialogue_group[var_304_0].extend_loading > 0 then
		arg_304_0.contextData.hasEnterCheck = true

		pg.SceneAnimMgr.GetInstance():RegisterDormNextCall(function()
			arg_304_0:FinishEnterResume()
		end)
	else
		if arg_304_0.apartment and arg_304_0.contextData.pendingDic[arg_304_0.apartment:GetConfigID()] then
			arg_304_0.contextData.hasEnterCheck = true
		end

		for iter_304_2, iter_304_3 in pairs(arg_304_0.contextData.pendingDic) do
			arg_304_0.ladyDict[iter_304_2]:SetInPending(iter_304_3)
		end

		arg_304_0.contextData.pendingDic = {}

		arg_304_0:FinishEnterResume()
		arg_304_0:CheckQueue()
	end
end

function var_0_0.CheckGuide(arg_307_0)
	if arg_307_0.ladyDict[arg_307_0.apartment:GetConfigID()]:GetBlackboardValue("inPending") then
		return
	end

	for iter_307_0, iter_307_1 in ipairs({
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
				return arg_307_0:CheckSystemOpen("Furniture")
			end
		},
		{
			name = "DORM3D_GUIDE_07",
			active = function()
				return arg_307_0:CheckSystemOpen("DayNight")
			end
		}
	}) do
		if not pg.NewStoryMgr.GetInstance():IsPlayed(iter_307_1.name) and iter_307_1.active() then
			arg_307_0:SetAllBlackbloardValue("inGuide", true)

			local function var_307_0()
				pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGuide(2, pg.NewStoryMgr.GetInstance():StoryName2StoryId(iter_307_1.name)))
				arg_307_0:SetAllBlackbloardValue("inGuide", false)
			end

			pg.m02:sendNotification(GAME.STORY_UPDATE, {
				storyId = iter_307_1.name
			})
			pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGuide(1, pg.NewStoryMgr.GetInstance():StoryName2StoryId(iter_307_1.name)))
			pg.NewGuideMgr.GetInstance():Play(iter_307_1.name, nil, var_307_0, var_307_0)

			return true
		end
	end

	return false
end

function var_0_0.CheckFavorTrigger(arg_313_0)
	for iter_313_0, iter_313_1 in ipairs({
		{
			triggerId = getDorm3dGameset("drom3d_favir_trigger_onwer")[1],
			active = function()
				local var_314_0 = getProxy(CollectionProxy):getShipGroup(arg_313_0.apartment.configId)

				return tobool(var_314_0)
			end
		},
		{
			triggerId = getDorm3dGameset("drom3d_favir_trigger_propose")[1],
			active = function()
				local var_315_0 = getProxy(CollectionProxy):getShipGroup(arg_313_0.apartment.configId)

				return var_315_0 and var_315_0.married > 0
			end
		}
	}) do
		if arg_313_0.apartment.triggerCountDic[iter_313_1.triggerId] == 0 and iter_313_1.active() then
			arg_313_0:emit(Dorm3dRoomMediator.TRIGGER_FAVOR, arg_313_0.apartment.configId, iter_313_1.triggerId)
		end
	end
end

function var_0_0.CheckEnterDeal(arg_316_0)
	if arg_316_0.contextData.hasEnterCheck then
		return false
	end

	local var_316_0 = arg_316_0.apartment:GetConfigID()
	local var_316_1 = "dorm3d_enter_count_" .. var_316_0
	local var_316_2 = pg.TimeMgr.GetInstance():CurrentSTimeDesc("%Y/%m/%d")

	if PlayerPrefs.GetString("dorm3d_enter_count_day") ~= var_316_2 then
		PlayerPrefs.SetString("dorm3d_enter_count_day", var_316_2)
		PlayerPrefs.SetInt(var_316_1, 1)
	else
		PlayerPrefs.SetInt(var_316_1, PlayerPrefs.GetInt(var_316_1, 0) + 1)
	end

	local var_316_3 = arg_316_0.apartment:getEnterTalking(arg_316_0.room:GetConfigID())

	PlayerPrefs.SetString("DORM3D_DAILY_ENTER", pg.TimeMgr.GetInstance():CurrentSTimeDesc("%Y/%m/%d"))

	if #var_316_3 > 0 then
		arg_316_0:DoTalk(var_316_3[math.random(#var_316_3)])

		return true
	end
end

function var_0_0.CheckActiveTalk(arg_317_0)
	local var_317_0 = arg_317_0.ladyDict[arg_317_0.apartment:GetConfigID()]

	if var_317_0:GetBlackboardValue("inPending") then
		return false
	end

	local var_317_1 = arg_317_0.apartment:getZoneTalking(arg_317_0.room:GetConfigID(), var_317_0.ladyBaseZone)

	if #var_317_1 > 0 then
		arg_317_0:DoTalk(var_317_1[1])

		return true
	else
		return false
	end
end

function var_0_0.CheckDistanceTalk(arg_318_0, arg_318_1, arg_318_2)
	local var_318_0 = arg_318_0.ladyDict[arg_318_1].ladyBaseZone
	local var_318_1 = getProxy(ApartmentProxy):getApartment(arg_318_1)

	for iter_318_0, iter_318_1 in ipairs(var_318_1:getDistanceTalking(arg_318_0.room:GetConfigID(), var_318_0)) do
		arg_318_0:DoTalk(iter_318_1)

		return
	end
end

function var_0_0.CheckSystemOpen(arg_319_0, arg_319_1)
	if arg_319_0.room:isPersonalRoom() then
		return switch(arg_319_1, {
			Talk = function()
				local var_320_0 = 1

				return var_320_0 <= arg_319_0.apartment.level, i18n("apartment_level_unenough", var_320_0)
			end,
			Touch = function()
				local var_321_0 = getDorm3dGameset("drom3d_touch_dialogue")[1]

				return var_321_0 <= arg_319_0.apartment.level, i18n("apartment_level_unenough", var_321_0)
			end,
			Gift = function()
				local var_322_0 = getDorm3dGameset("drom3d_gift_dialogue")[1]

				return var_322_0 <= arg_319_0.apartment.level, i18n("apartment_level_unenough", var_322_0)
			end,
			Volleyball = function()
				return false
			end,
			Photo = function()
				local var_324_0 = getDorm3dGameset("drom3d_photograph_unlock")[1]

				return var_324_0 <= arg_319_0.apartment.level, i18n("apartment_level_unenough", var_324_0)
			end,
			Collection = function()
				local var_325_0 = getDorm3dGameset("drom3d_recall_unlock")[1]

				return var_325_0 <= arg_319_0.apartment.level, i18n("apartment_level_unenough", var_325_0)
			end,
			Furniture = function()
				local var_326_0 = getDorm3dGameset("drom3d_furniture_unlock")[1]

				return var_326_0 <= arg_319_0.apartment.level, i18n("apartment_level_unenough", var_326_0)
			end,
			DayNight = function()
				local var_327_0 = getDorm3dGameset("drom3d_time_unlock")[1]

				return var_327_0 <= arg_319_0.apartment.level, i18n("apartment_level_unenough", var_327_0)
			end,
			Accompany = function()
				local var_328_0 = 1

				return var_328_0 <= arg_319_0.apartment.level, i18n("apartment_level_unenough", var_328_0)
			end,
			MiniGame = function()
				local var_329_0 = 1

				return var_329_0 <= arg_319_0.apartment.level, i18n("apartment_level_unenough", var_329_0)
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
		return switch(arg_319_1, {
			Gift = function()
				return false
			end,
			Volleyball = function()
				return arg_319_0.room:GetConfigID() == 4
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

function var_0_0.CheckLevelUp(arg_341_0)
	if arg_341_0.apartment:canLevelUp() then
		arg_341_0:emit(Dorm3dRoomMediator.FAVOR_LEVEL_UP, arg_341_0.apartment.configId)

		return true
	end

	return false
end

function var_0_0.GetIKTipsRootTF(arg_342_0)
	return arg_342_0.ikTipsRoot
end

function var_0_0.GetIKHandTF(arg_343_0)
	return arg_343_0.ikHand
end

function var_0_0.CycleIKCameraGroup(arg_344_0)
	local var_344_0 = arg_344_0.ladyDict[arg_344_0.apartment:GetConfigID()]

	assert(var_344_0:GetBlackboardValue("inIK"))
	seriesAsync({
		function(arg_345_0)
			arg_344_0.RevertIKLayer(var_344_0, 0, arg_345_0)
		end,
		function(arg_346_0)
			local var_346_0 = var_344_0.ikConfig
			local var_346_1 = var_346_0.camera_group
			local var_346_2 = pg.dorm3d_ik_status.get_id_list_by_camera_group[var_346_1]
			local var_346_3 = var_346_2[table.indexof(var_346_2, var_346_0.id) % #var_346_2 + 1]

			arg_344_0:SwitchIKConfig(var_344_0, var_346_3)
			arg_344_0:SetIKState(true)
		end
	})
end

function var_0_0.TempHideUI(arg_347_0, arg_347_1, arg_347_2)
	local var_347_0 = defaultValue(arg_347_0.hideCount, 0)

	arg_347_0.hideCount = var_347_0 + (arg_347_1 and 1 or -1)

	assert(arg_347_0.hideCount >= 0)

	if arg_347_0.hideCount * var_347_0 > 0 then
		return existCall(arg_347_2)
	elseif arg_347_0.hideCount > 0 then
		arg_347_0:SetUI(arg_347_2, "blank")
	else
		arg_347_0:SetUI(arg_347_2, "back")
	end
end

function var_0_0.onBackPressed(arg_348_0)
	if arg_348_0.exited or arg_348_0.retainCount > 0 then
		-- block empty
	elseif isActive(arg_348_0.rtLevelUpWindow) then
		triggerButton(arg_348_0.rtLevelUpWindow:Find("bg"))
	elseif arg_348_0.uiState ~= "base" then
		-- block empty
	else
		arg_348_0:closeView()
	end
end

function var_0_0.willExit(arg_349_0)
	if arg_349_0.tempExtraPanel and isActive(arg_349_0.tempExtraPanel) then
		local var_349_0 = arg_349_0.tempExtraPanel

		setActive(var_349_0, false)

		if isActive(pg.NewStoryMgr.GetInstance()._tf) then
			setParent(var_349_0, arg_349_0.rtExtraScreen)
		else
			pg.UIMgr.GetInstance():UnOverlayPanel(var_349_0, arg_349_0.rtExtraScreen)
		end

		arg_349_0.tempExtraPanel = nil
	end

	if arg_349_0.downTimer then
		arg_349_0.downTimer:Stop()

		arg_349_0.downTimer = nil
	end

	if arg_349_0.LTs then
		underscore.map(arg_349_0.LTs, function(arg_350_0)
			LeanTween.cancel(arg_350_0)
		end)

		arg_349_0.LTs = nil
	end

	if arg_349_0.sliderLT then
		LeanTween.cancel(arg_349_0.sliderLT)

		arg_349_0.sliderLT = nil
	end

	for iter_349_0, iter_349_1 in pairs(arg_349_0.ladyDict) do
		iter_349_1.wakeUpTalkId = nil
	end

	if arg_349_0.accompanyFavorTimer then
		arg_349_0.accompanyFavorTimer:Stop()

		arg_349_0.accompanyFavorTimer = nil
	end

	if arg_349_0.accompanyPerformanceTimer then
		arg_349_0.accompanyPerformanceTimer:Stop()

		arg_349_0.accompanyPerformanceTimer = nil
	end

	arg_349_0.canTriggerAccompanyPerformance = nil

	var_0_0.super.willExit(arg_349_0)
end

return var_0_0
