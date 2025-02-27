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
			local var_8_2 = arg_4_0.contextData.groupIds[1]

			for iter_8_0, iter_8_1 in pairs(arg_4_0.ladyDict) do
				if iter_8_1.ladyBaseZone == arg_4_0:GetAttachedFurnitureName() then
					var_8_2 = iter_8_0

					break
				end
			end

			arg_4_0:SetApartment(getProxy(ApartmentProxy):getApartment(var_8_2))
		end

		getProxy(Dorm3dChatProxy):TriggerEvent({
			{
				value = 1,
				event_type = arg_4_0.contextData.timeIndex == 1 and 114 or 119,
				ship_id = arg_4_0.apartment:GetConfigID()
			}
		})
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

			if arg_4_0.room:isPersonalRoom() and not arg_4_0:GetBlackboardValue(arg_4_0.ladyDict[arg_4_0.apartment:GetConfigID()], "inPending") then
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
	onButton(arg_4_0, var_4_2:Find("btn_back_heartbeat"), function()
		arg_4_0:ExitHeartbeatMode()
	end, "ui-dorm_back_v2")
	setActive(var_4_2:Find("btn_back_heartbeat"), false)
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
		local var_29_0 = arg_4_0.apartment:GetConfigID()
		local var_29_1 = arg_4_0.ladyDict[var_29_0]
		local var_29_2 = var_29_1.skinIdList
		local var_29_3 = var_29_1.skinId
		local var_29_4 = {}
		local var_29_5 = {}

		_.each(var_29_2, function(arg_30_0)
			if ApartmentProxy.CheckUnlockConfig(pg.dorm3d_resource[arg_30_0].unlock) then
				table.insert(var_29_4, arg_30_0)
			else
				table.insert(var_29_5, arg_30_0)
			end
		end)

		local function var_29_6(arg_31_0, arg_31_1)
			local var_31_0 = arg_31_1 and var_29_4 or var_29_5

			UIItemList.StaticAlign(arg_31_0, arg_31_0:GetChild(0), #var_31_0, function(arg_32_0, arg_32_1, arg_32_2)
				if arg_32_0 ~= UIItemList.EventUpdate then
					return
				end

				local var_32_0 = var_31_0[arg_32_1 + 1]

				setActive(arg_32_2:Find("Selected"), var_32_0 == var_29_3)
				setActive(arg_32_2:Find("Lock"), not arg_31_1)

				if not arg_31_1 then
					setText(arg_32_2:Find("Lock/Bar/Text"), pg.dorm3d_resource[var_32_0].unlock_text)
				end

				arg_4_0.loader:GetSpriteQuiet(string.format("dorm3dselect/apartment_skin_%d", var_32_0), "", arg_32_2:Find("Icon"))
				onButton(arg_4_0, arg_32_2, function()
					if not arg_31_1 then
						local var_33_0, var_33_1 = ApartmentProxy.CheckUnlockConfig(pg.dorm3d_resource[var_32_0].unlock)

						pg.TipsMgr.GetInstance():ShowTips(var_33_1)

						return
					end

					if var_32_0 == var_29_3 then
						return
					end

					local var_33_2 = var_32_0

					seriesAsync({
						function(arg_34_0)
							arg_4_0:SetIKState(false, arg_34_0)
						end,
						function(arg_35_0)
							arg_4_0:SwitchCharacterSkin(var_29_1, var_29_0, var_33_2)
							arg_4_0:SwitchIKConfig(var_29_1, var_29_1.ikConfig.id)
							arg_4_0:SetIKState(true, arg_35_0)
						end,
						var_4_3
					})
				end, SFX_PANEL)
			end)
		end

		var_29_6(var_4_2:Find("Panel/BG/Scroll/Content/Unlock/List"), true)
		var_29_6(var_4_2:Find("Panel/BG/Scroll/Content/Lock/List"), false)
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

	local var_4_4 = arg_4_0._tf:Find("IKControl")

	arg_4_0.ikTipsRoot = var_4_4:Find("Tips")

	setActive(arg_4_0.ikTipsRoot, false)

	arg_4_0.ikClickTipsRoot = var_4_4:Find("ClickTips")

	setActive(arg_4_0.ikClickTipsRoot, false)

	arg_4_0.ikHand = var_4_4:Find("Handler")

	setActive(arg_4_0.ikHand, false)
	eachChild(arg_4_0.ikHand, function(arg_38_0)
		setActive(arg_38_0, false)
	end)

	arg_4_0.ikTextTipsRoot = var_4_4:Find("TextTips")

	setActive(arg_4_0.ikTextTipsRoot, false)
	eachChild(arg_4_0.ikTextTipsRoot, function(arg_39_0)
		setActive(arg_39_0, false)
	end)

	arg_4_0.ikControlUI = var_4_4

	local var_4_5 = arg_4_0.uiContianer:Find("accompany")

	onButton(arg_4_0, var_4_5:Find("btn_back"), function()
		arg_4_0:ExitAccompanyMode()
	end, "ui-dorm_back_v2")

	arg_4_0.unlockList = {}
	arg_4_0.rtFavorUp = arg_4_0._tf:Find("Toast/favor_up")

	arg_4_0.rtFavorUp:GetComponent("DftAniEvent"):SetEndEvent(function(arg_41_0)
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

	local var_4_6 = arg_4_0.rtStaminaPop:GetComponent("DftAniEvent")

	var_4_6:SetTriggerEvent(function(arg_42_0)
		local var_42_0, var_42_1 = getProxy(ApartmentProxy):getStamina()

		setText(arg_4_0.rtStaminaPop:Find("Text"), string.format("%d/%d", var_42_0, var_42_1))
	end)
	var_4_6:SetEndEvent(function(arg_43_0)
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

	local var_4_7 = arg_4_0.uiContianer:Find("watch")

	onButton(arg_4_0, var_4_7:Find("btn_back"), function()
		arg_4_0:ExitWatchMode()
	end, "ui-dorm_back_v2")
	onButton(arg_4_0, var_4_7:Find("btn_back/help"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("roll_gametip")
		})
	end, SFX_PANEL)

	arg_4_0.rtStaminaDisplay = var_4_7:Find("stamina")
	arg_4_0.rtRole = arg_4_0.uiContianer:Find("watch/Role")

	onButton(arg_4_0, arg_4_0.rtRole:Find("Talk"), function()
		local var_48_0 = arg_4_0.ladyDict[arg_4_0.apartment:GetConfigID()].ladyBaseZone
		local var_48_1 = arg_4_0.apartment:getFurnitureTalking(arg_4_0.room:GetConfigID(), var_48_0)

		if #var_48_1 == 0 then
			pg.TipsMgr.GetInstance():ShowTips("without topic")

			return
		end

		arg_4_0:DoTalk(var_48_1[math.random(#var_48_1)], function()
			local var_49_0 = getDorm3dGameset("drom3d_favir_trigger_talk")[1]

			arg_4_0:emit(Dorm3dRoomMediator.TRIGGER_FAVOR, arg_4_0.apartment.configId, var_49_0)
		end)
	end, "ui-dorm_click_v2")
	setText(arg_4_0.rtRole:Find("Talk/bg/Text"), i18n("dorm3d_talk"))
	onButton(arg_4_0, arg_4_0.rtRole:Find("Touch"), function()
		getProxy(Dorm3dChatProxy):TriggerEvent({
			{
				value = 1,
				event_type = arg_4_0.contextData.timeIndex == 1 and 111 or 116,
				ship_id = arg_4_0.apartment:GetConfigID()
			},
			{
				value = 1,
				event_type = 156,
				ship_id = arg_4_0.apartment:GetConfigID()
			}
		})
		arg_4_0:EnterTouchMode()
	end, "ui-dorm_click_v2")
	setText(arg_4_0.rtRole:Find("Touch/bg/Text"), i18n("dorm3d_touch"))
	onButton(arg_4_0, arg_4_0.rtRole:Find("Gift"), function()
		arg_4_0:emit(arg_4_0.SHOW_BLOCK)
		arg_4_0:ActiveStateCamera("gift", function()
			arg_4_0:emit(arg_4_0.HIDE_BLOCK)
		end)
		arg_4_0:emit(Dorm3dRoomMediator.OPEN_GIFT_LAYER, {
			groupId = arg_4_0.apartment:GetConfigID(),
			baseCamera = arg_4_0.mainCameraTF
		})
	end, "ui-dorm_click_v2")
	setText(arg_4_0.rtRole:Find("Gift/bg/Text"), i18n("dorm3d_gift"))
	onButton(arg_4_0, arg_4_0.rtRole:Find("MiniGame"), function()
		assert(not arg_4_0.nowMiniGameId)

		arg_4_0.nowMiniGameId = arg_4_0.room:getMiniGames()[1]

		local var_53_0 = pg.dorm3d_minigame[arg_4_0.nowMiniGameId]
		local var_53_1 = arg_4_0.ladyDict[arg_4_0.apartment:GetConfigID()]

		getProxy(Dorm3dChatProxy):TriggerEvent({
			{
				value = 1,
				event_type = arg_4_0.contextData.timeIndex == 1 and 112 or 117,
				ship_id = arg_4_0.apartment:GetConfigID()
			},
			{
				value = 1,
				event_type = 158,
				ship_id = arg_4_0.apartment:GetConfigID()
			}
		})

		local var_53_2 = {}

		table.insert(var_53_2, function(arg_54_0)
			arg_4_0:SetAllBlackbloardValue("inLockLayer", true)
			arg_4_0:TempHideUI(true, arg_54_0)
		end)

		if var_53_0.area ~= "" and var_53_1.ladyBaseZone ~= var_53_0.area then
			table.insert(var_53_2, function(arg_55_0)
				arg_4_0:ShiftZone(var_53_0.area, arg_55_0)
			end)
		end

		local var_53_3
		local var_53_4

		if var_53_0.action ~= "" then
			var_53_3, var_53_4 = unpack(var_53_0.action)
		end

		table.insert(var_53_2, function(arg_56_0)
			parallelAsync({
				function(arg_57_0)
					if var_53_3 then
						arg_4_0:PlaySingleAction(var_53_1, var_53_3, arg_57_0)
					else
						arg_57_0()
					end
				end,
				function(arg_58_0)
					arg_4_0:ActiveStateCamera("talk", arg_58_0)
				end
			}, arg_56_0)
		end)
		table.insert(var_53_2, function(arg_59_0)
			pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataMiniGame(1))
			arg_4_0:HandleGameNotification(Dorm3dMiniGameMediator.OPERATION, {
				operationCode = "BEFORE_OPEN_GAME",
				miniGameId = arg_4_0.nowMiniGameId
			})
			arg_4_0:EnableMiniGameCutIn()
			arg_4_0:emit(Dorm3dRoomMediator.OPEN_MINIGAME_WINDOW, {
				isDorm3d = true,
				minigameId = arg_4_0.nowMiniGameId
			}, arg_59_0)
		end)
		table.insert(var_53_2, function(arg_60_0)
			arg_4_0:DisableMiniGameCutIn()

			if var_53_4 then
				arg_4_0:PlaySingleAction(var_53_1, var_53_4, arg_60_0)
			else
				arg_60_0()
			end
		end)
		seriesAsync(var_53_2, function()
			arg_4_0:SetAllBlackbloardValue("inLockLayer", false)
			arg_4_0:TempHideUI(false)

			arg_4_0.nowMiniGameId = nil
		end)
	end, "ui-dorm_click_v2")
	setText(arg_4_0.rtRole:Find("MiniGame/bg/Text"), i18n("dorm3d_minigame_button1"))
	onButton(arg_4_0, arg_4_0.rtRole:Find("Volleyball"), function()
		arg_4_0:emit(Dorm3dRoomMediator.ENTER_VOLLEYBALL, arg_4_0.apartment:GetConfigID())
	end, "ui-dorm_click_v2")
	setText(arg_4_0.rtRole:Find("Volleyball/bg/Text"), i18n("dorm3d_volleyball_button"))
	onButton(arg_4_0, arg_4_0.rtRole:Find("Performance"), function()
		arg_4_0:DoTalk(20500, function()
			pg.TipsMgr.GetInstance():ShowTips("Success!")
		end)
	end, "ui-dorm_click_v2")

	arg_4_0.rtFloatPage = arg_4_0._tf:Find("FloatPage")
	arg_4_0.tplFloat = arg_4_0.rtFloatPage:Find("tpl")

	setActive(arg_4_0.tplFloat, false)

	local var_4_8 = cloneTplTo(arg_4_0.tplFloat, arg_4_0.rtFloatPage, "lady")

	eachChild(var_4_8, function(arg_65_0)
		setActive(arg_65_0, arg_65_0.name == "walk")
	end)

	arg_4_0._joystick = arg_4_0._tf:Find("Stick")

	setActive(arg_4_0._joystick, false)
	arg_4_0._joystick:GetComponent(typeof(SlideController)):SetStickFunc(function(arg_66_0)
		arg_4_0:emit(arg_4_0.ON_STICK_MOVE, arg_66_0)
	end)

	arg_4_0.povLayer = arg_4_0._tf:Find("POVControl")

	setActive(arg_4_0.povLayer, false)
	;(function()
		local var_67_0 = arg_4_0.povLayer:Find("Move"):GetComponent(typeof(SlideController))

		var_67_0:AddBeginDragFunc(function(arg_68_0, arg_68_1)
			arg_4_0:emit(arg_4_0.ON_POV_STICK_MOVE_BEGIN, arg_68_1)
		end)
		var_67_0:SetStickFunc(function(arg_69_0)
			arg_4_0:emit(arg_4_0.ON_POV_STICK_MOVE, arg_69_0)
		end)
		var_67_0:AddDragEndFunc(function(arg_70_0, arg_70_1)
			arg_4_0:emit(arg_4_0.ON_POV_STICK_MOVE_END, arg_70_1)
		end)
		arg_4_0.povLayer:Find("View"):GetComponent(typeof(SlideController)):SetStickFunc(function(arg_71_0)
			arg_4_0:emit(arg_4_0.ON_POV_STICK_VIEW, arg_71_0)
		end)
	end)()

	arg_4_0.ikControlLayer = var_4_4:Find("ControlLayer")

	;(function()
		local var_72_0
		local var_72_1 = arg_4_0.ikControlLayer:GetComponent(typeof(SlideController))

		var_72_1:AddBeginDragFunc(function(arg_73_0, arg_73_1)
			local var_73_0 = arg_4_0.ladyDict[arg_4_0.apartment:GetConfigID()]

			if not var_73_0.IKSettings then
				return
			end

			local var_73_1 = arg_73_1.position
			local var_73_2 = CameraMgr.instance:Raycast(var_73_0.IKSettings.CameraRaycaster, var_73_1)

			if var_73_2.Length ~= 0 then
				local var_73_3 = var_73_2[0].gameObject.transform
				local var_73_4 = table.keyof(var_73_0.IKSettings.Colliders, var_73_3)

				if var_73_4 then
					arg_4_0:emit(var_0_0.ON_BEGIN_DRAG_CHARACTER_BODY, var_73_0, var_73_4, var_73_1)

					var_72_0 = tobool(var_73_0.ikHandler)

					return
				end
			end
		end)
		var_72_1:AddDragFunc(function(arg_74_0, arg_74_1)
			local var_74_0 = arg_74_1.position
			local var_74_1 = arg_4_0.ladyDict[arg_4_0.apartment:GetConfigID()]

			if var_74_1.ikHandler then
				var_74_1:emit(var_0_0.ON_DRAG_CHARACTER_BODY, var_74_1, var_74_0)

				return
			end

			if var_72_0 then
				return
			end

			local var_74_2 = arg_74_1.delta

			arg_4_0:emit(arg_4_0.ON_STICK_MOVE, var_74_2)
		end)
		var_72_1:AddDragEndFunc(function(arg_75_0, arg_75_1)
			var_72_0 = nil

			local var_75_0 = arg_4_0.ladyDict[arg_4_0.apartment:GetConfigID()]

			if var_75_0.ikHandler then
				var_75_0:emit(var_0_0.ON_RELEASE_CHARACTER_BODY, var_75_0)

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

function var_0_0.BindEvent(arg_77_0)
	var_0_0.super.BindEvent(arg_77_0)
	arg_77_0:bind(arg_77_0.CLICK_CHARACTER, function(arg_78_0, arg_78_1)
		if arg_77_0.uiState ~= "base" or not arg_77_0.ladyDict[arg_78_1].nowCanWatchState then
			return
		end

		local var_78_0 = {}
		local var_78_1 = arg_77_0.ladyDict[arg_78_1]

		if arg_77_0:GetBlackboardValue(var_78_1, "inPending") then
			table.insert(var_78_0, function(arg_79_0)
				var_78_1:OutOfPending(arg_78_1, arg_79_0)
			end)
		else
			table.insert(var_78_0, function(arg_80_0)
				arg_77_0:OutOfLazy(arg_78_1, arg_80_0)
			end)
		end

		seriesAsync(var_78_0, function()
			if not arg_77_0.room:isPersonalRoom() then
				arg_77_0:SetApartment(getProxy(ApartmentProxy):getApartment(arg_78_1))
			end

			arg_77_0:EnterWatchMode()
		end)
		pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_touch_v1")
	end)
	arg_77_0:bind(arg_77_0.CLICK_CONTACT, function(arg_82_0, arg_82_1)
		arg_77_0:TriggerContact(arg_82_1)
	end)
	arg_77_0:bind(arg_77_0.DISTANCE_TRIGGER, function(arg_83_0, arg_83_1, arg_83_2)
		if arg_77_0.uiState == "base" then
			arg_77_0:CheckDistanceTalk(arg_83_1, arg_83_2)
		end
	end)
	arg_77_0:bind(arg_77_0.WALK_DISTANCE_TRIGGER, function(arg_84_0, arg_84_1, arg_84_2)
		if arg_77_0.apartment and arg_77_0.apartment:GetConfigID() == arg_84_1 then
			existCall(arg_77_0.walkNearCallback, arg_84_2)
		end
	end)
	arg_77_0:bind(arg_77_0.CHANGE_WATCH, function(arg_85_0, arg_85_1)
		arg_77_0:ChangeCanWatchState(arg_77_0.ladyDict[arg_85_1])
	end)
	arg_77_0:bind(arg_77_0.ON_TOUCH_CHARACTER, function(arg_86_0, arg_86_1)
		local var_86_0 = arg_77_0.ladyDict[arg_77_0.apartment:GetConfigID()]

		if not arg_77_0:GetBlackboardValue(var_86_0, "inIK") then
			return
		end

		arg_77_0:OnTouchCharacterBody(arg_86_1)
	end)
	arg_77_0:bind(var_0_0.ON_IK_STATUS_CHANGED, function(arg_87_0, arg_87_1, arg_87_2)
		local var_87_0 = arg_77_0.ladyDict[arg_77_0.apartment:GetConfigID()]

		if not arg_77_0:GetBlackboardValue(var_87_0, "inTouching") then
			return
		end

		arg_77_0:DoTouch(arg_87_1, arg_87_2)
	end)
	arg_77_0:bind(arg_77_0.ON_ENTER_SECTOR, function(arg_88_0, arg_88_1)
		arg_77_0:ChangeCanWatchState(arg_77_0.ladyDict[arg_88_1])
	end)
	arg_77_0:bind(arg_77_0.ON_CHANGE_DISTANCE, function(arg_89_0, arg_89_1, arg_89_2)
		arg_77_0:ChangeCanWatchState(arg_77_0.ladyDict[arg_89_1])
	end)
end

function var_0_0.didEnter(arg_90_0)
	arg_90_0.resumeCallback = arg_90_0.contextData.resumeCallback
	arg_90_0.contextData.resumeCallback = nil

	var_0_0.super.didEnter(arg_90_0)
	arg_90_0:UpdateZoneList()
	arg_90_0:SetUI(function()
		arg_90_0:didEnterCheck()
	end, "base")
end

function var_0_0.FinishEnterResume(arg_92_0)
	if not arg_92_0.resumeCallback then
		return
	end

	local var_92_0 = arg_92_0.resumeCallback

	arg_92_0.resumeCallback = nil

	return var_92_0()
end

function var_0_0.EnableJoystick(arg_93_0, arg_93_1)
	setActive(arg_93_0._joystick, arg_93_1)
end

function var_0_0.EnablePOVLayer(arg_94_0, arg_94_1)
	setActive(arg_94_0.povLayer, arg_94_1)

	if not arg_94_1 then
		arg_94_0:emit(arg_94_0.ON_POV_STICK_MOVE_END)
	end
end

function var_0_0.SetUIStore(arg_95_0, arg_95_1, ...)
	table.insertto(arg_95_0.uiStore, {
		...
	})
	existCall(arg_95_1)
end

function var_0_0.SetUI(arg_96_0, arg_96_1, ...)
	while rawget(arg_96_0, "class") ~= var_0_0 do
		arg_96_0 = getmetatable(arg_96_0).__index
	end

	table.insertto(arg_96_0.uiStore, {
		...
	})

	for iter_96_0, iter_96_1 in ipairs(arg_96_0.uiStore) do
		if iter_96_1 == "back" then
			assert(#arg_96_0.uiStack > 0)

			arg_96_0.uiState = table.remove(arg_96_0.uiStack)
		elseif iter_96_1 == arg_96_0.uiState and iter_96_1 == "ik" then
			-- block empty
		else
			table.insert(arg_96_0.uiStack, arg_96_0.uiState)

			arg_96_0.uiState = iter_96_1
		end
	end

	arg_96_0.uiStore = {}

	eachChild(arg_96_0.uiContianer, function(arg_97_0)
		setActive(arg_97_0, arg_97_0.name == arg_96_0.uiState)
	end)
	arg_96_0:EnablePOVLayer(arg_96_0.uiState == "base" or arg_96_0.uiState == "walk")
	arg_96_0:TempHideContact(arg_96_0.uiState ~= "base")
	arg_96_0:SetFloatEnable(arg_96_0.uiState == "walk")
	setActive(arg_96_0.rtFloatPage, arg_96_0.uiState == "walk")
	setActive(arg_96_0.ikControlUI, arg_96_0.uiState == "ik")
	switch(arg_96_0.uiState, {
		base = function()
			if not arg_96_0.room:isPersonalRoom() then
				arg_96_0:SetApartment(nil)
			end

			arg_96_0:UpdateBtnState()
		end,
		watch = function()
			eachChild(arg_96_0.rtRole, function(arg_100_0)
				setActive(arg_100_0, false)
			end)

			local var_99_0 = underscore.filter({
				"Talk",
				"Touch",
				"Gift",
				"MiniGame",
				"Volleyball",
				"Performance"
			}, function(arg_101_0)
				return arg_96_0:CheckSystemOpen(arg_101_0)
			end)
			local var_99_1 = 0.05

			for iter_99_0, iter_99_1 in ipairs(var_99_0) do
				LeanTween.delayedCall(var_99_1, System.Action(function()
					setActive(arg_96_0.rtRole:Find(iter_99_1), true)
				end))

				var_99_1 = var_99_1 + 0.066
			end

			setActive(arg_96_0.rtRole:Find("Gift/bg/Tip"), Dorm3dGift.NeedViewTip(arg_96_0.apartment:GetConfigID()))
		end,
		ik = function()
			setActive(arg_96_0.uiContianer:Find("ik/Right/MenuSmall"), arg_96_0.room:isPersonalRoom() and not arg_96_0.performanceInfo)
			setActive(arg_96_0.uiContianer:Find("ik/Right/Menu"), false)
		end,
		walk = function()
			setText(arg_96_0.uiContianer:Find("walk/dialogue/content"), i18n("dorm3d_removable", arg_96_0.apartment:getConfig("name")))
		end
	})
	arg_96_0:ActiveStateCamera(arg_96_0.uiState, function()
		if arg_96_1 then
			arg_96_1()
		elseif arg_96_0.uiState == "base" then
			arg_96_0:CheckQueue()
		end
	end)
end

function var_0_0.EnterWatchMode(arg_106_0)
	local var_106_0 = arg_106_0.apartment:GetConfigID()

	seriesAsync({
		function(arg_107_0)
			arg_106_0:emit(arg_106_0.SHOW_BLOCK)
			arg_106_0:SetBlackboardValue(arg_106_0.ladyDict[var_106_0], "inWatchMode", true)
			arg_106_0:SetUI(arg_107_0, "watch")
		end,
		function(arg_108_0)
			arg_106_0:emit(arg_106_0.HIDE_BLOCK)
		end
	})
end

function var_0_0.ExitWatchMode(arg_109_0)
	local var_109_0 = arg_109_0.apartment:GetConfigID()

	seriesAsync({
		function(arg_110_0)
			arg_109_0:emit(arg_109_0.SHOW_BLOCK)
			arg_109_0:SetUI(arg_110_0, "back")
		end,
		function(arg_111_0)
			arg_109_0:SetBlackboardValue(arg_109_0.ladyDict[var_109_0], "inWatchMode", false)
			arg_109_0:emit(arg_109_0.HIDE_BLOCK)
			arg_109_0:CheckQueue()
		end
	})
end

function var_0_0.SetInPending(arg_112_0, arg_112_1, arg_112_2)
	local var_112_0 = arg_112_0:GetBlackboardValue(arg_112_1, "groupId")
	local var_112_1 = pg.dorm3d_welcome[arg_112_2]

	arg_112_0:SetBlackboardValue(arg_112_1, "inPending", true)
	arg_112_0:ChangeCanWatchState(arg_112_1)
	arg_112_0:EnableHeadIK(arg_112_1, false)

	arg_112_0.contextData.ladyZone[var_112_0] = var_112_1.area
	arg_112_1.ladyBaseZone = arg_112_0.contextData.ladyZone[var_112_0]
	arg_112_1.ladyActiveZone = var_112_1.welcome_staypoint

	arg_112_0:ChangeCharacterPosition(arg_112_1)

	if var_112_1.item_shield ~= "" then
		arg_112_0.hideItemDic = {}

		for iter_112_0, iter_112_1 in ipairs(var_112_1.item_shield) do
			local var_112_2 = arg_112_0.modelRoot:Find(iter_112_1)

			if not var_112_2 then
				warning(string.format("welcome:%d without hide item:%s", arg_112_2, iter_112_1))
			else
				arg_112_0.hideItemDic[iter_112_1] = isActive(var_112_2)

				setActive(var_112_2, false)
			end
		end
	end

	onNextTick(function()
		if arg_112_1.tfPendintItem then
			setActive(arg_112_1.tfPendintItem, true)
		end

		arg_112_0:SwitchAnim(arg_112_1, var_112_1.welcome_idle)
	end)

	arg_112_0.wakeUpTalkId = var_112_1.welcome_talk
end

function var_0_0.SetOutPending(arg_114_0, arg_114_1)
	arg_114_0:SetBlackboardValue(arg_114_1, "inPending", false)
	arg_114_0:ChangeCanWatchState(arg_114_1)
	arg_114_0:EnableHeadIK(arg_114_1, true)

	arg_114_0.wakeUpTalkId = nil

	if arg_114_1.tfPendintItem then
		setActive(arg_114_1.tfPendintItem, false)
	end

	if arg_114_0.hideItemDic then
		for iter_114_0, iter_114_1 in pairs(arg_114_0.hideItemDic) do
			setActive(arg_114_0.modelRoot:Find(iter_114_0), iter_114_1)
		end

		arg_114_0.hideItemDic = nil
	end
end

function var_0_0.IsModeInHidePending(arg_115_0, arg_115_1)
	for iter_115_0, iter_115_1 in pairs(arg_115_0.ladyDict) do
		if iter_115_1.hideItemDic and iter_115_1.hideItemDic[arg_115_1] ~= nil then
			return true
		end
	end

	return false
end

function var_0_0.EnterAccompanyMode(arg_116_0, arg_116_1)
	local var_116_0 = pg.dorm3d_accompany[arg_116_1]
	local var_116_1
	local var_116_2

	if var_116_0.sceneInfo ~= "" then
		var_116_1, var_116_2 = unpack(string.split(var_116_0.sceneInfo, "|"))
	end

	local var_116_3 = {
		type = "timeline",
		name = var_116_0.timeline,
		scene = var_116_1,
		sceneRoot = var_116_2,
		accompanys = {}
	}

	for iter_116_0, iter_116_1 in ipairs(var_116_0.jump_trigger) do
		local var_116_4, var_116_5 = unpack(iter_116_1)

		var_116_3.accompanys[var_116_4] = var_116_5
	end

	local var_116_6, var_116_7 = unpack(var_116_0.favor)

	getProxy(Dorm3dChatProxy):TriggerEvent({
		{
			value = 1,
			event_type = 161,
			ship_id = arg_116_0.apartment:GetConfigID()
		}
	})
	getProxy(ApartmentProxy):RecordAccompanyTime()
	pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataAccompany(1, var_116_0.ship_id, var_116_0.performance_time, 0, var_116_1 or arg_116_0.dormSceneMgr.artSceneInfo))

	local var_116_8 = {}

	table.insert(var_116_8, function(arg_117_0)
		arg_116_0:SetUI(arg_117_0, "blank", "accompany")
	end)
	table.insert(var_116_8, function(arg_118_0)
		arg_116_0.accompanyFavorCount = 0
		arg_116_0.accompanyFavorTimer = Timer.New(function()
			arg_116_0.accompanyFavorCount = arg_116_0.accompanyFavorCount + 1
		end, var_116_6, -1)

		arg_116_0.accompanyFavorTimer:Start()

		arg_116_0.accompanyPerformanceTimer = Timer.New(function()
			arg_116_0.canTriggerAccompanyPerformance = true
		end, var_116_0.performance_time, -1)

		arg_116_0.accompanyPerformanceTimer:Start()
		arg_116_0:PlayTimeline(var_116_3, function(arg_121_0, arg_121_1)
			arg_121_1()
			arg_118_0()
		end)
	end)
	seriesAsync(var_116_8, function()
		assert(arg_116_0.accompanyFavorTimer)
		arg_116_0.accompanyFavorTimer:Stop()

		arg_116_0.accompanyFavorTimer = nil

		assert(arg_116_0.accompanyPerformanceTimer)
		arg_116_0.accompanyPerformanceTimer:Stop()

		arg_116_0.accompanyPerformanceTimer = nil
		arg_116_0.canTriggerAccompanyPerformance = nil

		local var_122_0 = math.min(arg_116_0.accompanyFavorCount, getProxy(ApartmentProxy):getStamina())

		if var_122_0 > 0 then
			local var_122_1 = var_116_7[var_122_0]

			warning(var_122_1)
			arg_116_0:emit(Dorm3dRoomMediator.TRIGGER_FAVOR, arg_116_0.apartment.configId, var_122_1)
		end

		local var_122_2 = 0
		local var_122_3 = getProxy(ApartmentProxy):GetAccompanyTime()

		if var_122_3 then
			var_122_2 = pg.TimeMgr.GetInstance():GetServerTime() - var_122_3
		end

		pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataAccompany(2, var_116_0.ship_id, var_116_0.performance_time, var_122_2, var_116_1 or arg_116_0.dormSceneMgr.artSceneInfo))
		arg_116_0:SetUI(nil, "back", "back")
	end)
end

function var_0_0.ExitAccompanyMode(arg_123_0)
	existCall(arg_123_0.timelineFinishCall)
end

function var_0_0.EnterTouchMode(arg_124_0)
	local var_124_0 = arg_124_0.ladyDict[arg_124_0.apartment:GetConfigID()]

	if arg_124_0:GetBlackboardValue(var_124_0, "inTouching") then
		return
	end

	local var_124_1 = arg_124_0.room:getApartmentZoneConfig(var_124_0.ladyBaseZone, "touch_id", arg_124_0.apartment:GetConfigID())

	arg_124_0.touchConfig = pg.dorm3d_touch_data[var_124_1]

	if not arg_124_0.touchConfig then
		arg_124_0:EnterTimelineTouchMode()

		return
	end

	arg_124_0.inTouchGame = arg_124_0.touchConfig.heartbeat_enable > 0

	setActive(arg_124_0.rtTouchGamePanel, arg_124_0.inTouchGame)

	if arg_124_0.inTouchGame then
		arg_124_0.touchCount = 0
		arg_124_0.touchLevel = 1
		arg_124_0.lastCount = 0
		arg_124_0.topCount = 0

		arg_124_0:UpdateTouchGameDisplay()
		setSlider(arg_124_0.rtTouchGamePanel:Find("slider"), 0, 100, arg_124_0.touchCount >= 200 and 100 or arg_124_0.touchCount % 100)
		quickPlayAnimation(arg_124_0.rtTouchGamePanel, "anim_dorm3d_touch_in")
		quickPlayAnimation(arg_124_0.rtTouchGamePanel:Find("slider/icon"), "anim_dorm3d_touch_icon")

		arg_124_0.downTimer = Timer.New(function()
			local var_125_0 = pg.dorm3d_set.reduce_interaction.key_value_int

			if arg_124_0.touchLevel > 1 then
				var_125_0 = pg.dorm3d_set.reduce_heartbeat.key_value_int
			end

			arg_124_0:UpdateTouchCount(var_125_0)
		end, 1, -1)

		arg_124_0.downTimer:Start()
	end

	local var_124_2 = {}

	table.insert(var_124_2, function(arg_126_0)
		arg_124_0:SetBlackboardValue(var_124_0, "inTouching", true)
		arg_124_0:emit(arg_124_0.SHOW_BLOCK)
		arg_124_0:SetUI(arg_126_0, "blank")
	end)
	table.insert(var_124_2, function(arg_127_0)
		local var_127_0 = arg_124_0.touchConfig.ik_status[1]

		arg_124_0:SwitchIKConfig(var_124_0, var_127_0)
		setActive(arg_124_0.uiContianer:Find("ik/btn_back"), true)
		arg_124_0:SetIKState(true, arg_127_0)
	end)
	table.insert(var_124_2, function(arg_128_0)
		existCall(arg_128_0)
	end)
	seriesAsync(var_124_2, function()
		Shader.SetGlobalFloat("_ScreenClipOff", 0)
		arg_124_0:emit(arg_124_0.HIDE_BLOCK)
	end)
end

function var_0_0.ExitTouchMode(arg_130_0)
	local var_130_0 = arg_130_0.ladyDict[arg_130_0.apartment:GetConfigID()]

	if not arg_130_0:GetBlackboardValue(var_130_0, "inTouching") then
		return
	end

	if arg_130_0.touchTimelineConfig then
		existCall(arg_130_0.timelineFinishCall)

		return
	end

	local var_130_1 = {}

	if arg_130_0.inTouchGame then
		table.insert(var_130_1, function(arg_131_0)
			arg_130_0:emit(arg_130_0.SHOW_BLOCK)
			quickPlayAnimation(arg_130_0.rtTouchGamePanel, "anim_dorm3d_touch_out")
			onDelayTick(arg_131_0, 0.5)
		end)
		table.insert(var_130_1, function(arg_132_0)
			local var_132_0 = 0

			for iter_132_0, iter_132_1 in ipairs(arg_130_0.touchConfig.heartbeat_favor) do
				if iter_132_1[1] > arg_130_0.topCount then
					break
				else
					var_132_0 = iter_132_1[2]
				end
			end

			if var_132_0 > 0 then
				arg_130_0:emit(Dorm3dRoomMediator.TRIGGER_FAVOR, arg_130_0.apartment.configId, var_132_0)
			end

			arg_130_0.touchCount = nil
			arg_130_0.touchLevel = nil
			arg_130_0.topCount = nil

			if arg_130_0.downTimer then
				arg_130_0.downTimer:Stop()

				arg_130_0.downTimer = nil
			end

			arg_130_0.inTouchGame = false

			setActive(arg_130_0.rtTouchGamePanel, false)
			Shader.SetGlobalFloat("_ScreenClipOff", 1)
			arg_132_0()
		end)
	else
		table.insert(var_130_1, function(arg_133_0)
			arg_130_0:emit(arg_130_0.SHOW_BLOCK)

			local var_133_0 = arg_130_0.touchConfig.default_favor

			if var_133_0 > 0 then
				arg_130_0:emit(Dorm3dRoomMediator.TRIGGER_FAVOR, arg_130_0.apartment.configId, var_133_0)
			end

			Shader.SetGlobalFloat("_ScreenClipOff", 1)
			arg_133_0()
		end)
	end

	table.insert(var_130_1, function(arg_134_0)
		var_130_0.ikConfig = {
			character_position = var_130_0.ladyBaseZone,
			character_action = arg_130_0.touchConfig.finish_action
		}

		arg_130_0:SetIKState(false, arg_134_0)
	end)
	table.insert(var_130_1, function(arg_135_0)
		var_130_0.ikConfig = nil
		arg_130_0.blockIK = nil

		arg_130_0:SetUI(arg_135_0, "back")
	end)
	seriesAsync(var_130_1, function()
		arg_130_0:SetBlackboardValue(var_130_0, "inTouching", false)
		arg_130_0:emit(arg_130_0.HIDE_BLOCK)

		arg_130_0.touchConfig = nil

		local var_136_0 = arg_130_0.touchExitCall

		arg_130_0.touchExitCall = nil

		existCall(var_136_0)
	end)
end

function var_0_0.ChangeWalkScene(arg_137_0, arg_137_1, arg_137_2)
	local var_137_0 = arg_137_0.ladyDict[arg_137_0.apartment:GetConfigID()]

	seriesAsync({
		function(arg_138_0)
			arg_137_0:ChangeArtScene(arg_137_1, arg_138_0)
		end,
		function(arg_139_0)
			var_137_0:ChangeSubScene(arg_137_1, arg_139_0)
		end,
		function(arg_140_0)
			arg_137_0:emit(arg_137_0.SHOW_BLOCK)

			if arg_137_1 == arg_137_0.dormSceneMgr.sceneInfo then
				arg_137_0:SetUI(arg_140_0, "back")
			elseif arg_137_0.uiState ~= "walk" then
				arg_137_0:SetUI(arg_140_0, "walk")
			else
				arg_140_0()
			end
		end
	}, function()
		arg_137_0:emit(arg_137_0.HIDE_BLOCK)
		arg_137_0:SetBlackboardValue(var_137_0, "inWalk", arg_137_1 ~= arg_137_0.dormSceneMgr.sceneInfo)
		existCall(arg_137_2)
	end)
end

function var_0_0.EnterTimelineTouchMode(arg_142_0)
	local var_142_0 = arg_142_0.ladyDict[arg_142_0.apartment:GetConfigID()]

	if arg_142_0:GetBlackboardValue(var_142_0, "inIK") then
		return
	end

	local var_142_1 = arg_142_0.room:getApartmentZoneConfig(var_142_0.ladyBaseZone, "touch_id", arg_142_0.apartment:GetConfigID())
	local var_142_2 = pg.dorm3d_ik_timeline[var_142_1]

	assert(var_142_2, "Missing config in dorm3d_ik_timeline ID: " .. (var_142_1 or "nil"))

	arg_142_0.touchTimelineConfig = var_142_2

	local var_142_3 = {}

	table.insert(var_142_3, function(arg_143_0)
		arg_142_0:SetBlackboardValue(var_142_0, "inIK", true)
		arg_142_0:emit(arg_142_0.SHOW_BLOCK)
		arg_142_0:SetUI(arg_143_0, "ik")
	end)
	table.insert(var_142_3, function(arg_144_0)
		setActive(arg_142_0.uiContianer:Find("ik/btn_back"), true)
		setActive(arg_142_0.uiContianer:Find("ik/Right/btn_camera"), false)
		setActive(arg_142_0.uiContianer:Find("ik/Right/Menu"), false)
		setActive(arg_142_0.uiContianer:Find("ik/Right/MenuSmall"), false)
		Shader.SetGlobalFloat("_ScreenClipOff", 0)
		arg_142_0:emit(arg_142_0.HIDE_BLOCK)
		arg_142_0:HideCharacterBylayer(var_142_0)
		setActive(var_142_0.ladyCollider, false)

		local var_144_0
		local var_144_1

		if #var_142_2.scene > 0 then
			var_144_0, var_144_1 = unpack(string.split(var_142_2.scene, "|"))
		end

		arg_142_0:PlayTimeline({
			name = var_142_2.timeline,
			scene = var_144_0,
			sceneRoot = var_144_1
		}, function(arg_145_0, arg_145_1)
			arg_145_1()
			arg_142_0:ExitTimelineTouchMode()
		end)
	end)
	seriesAsync(var_142_3, function()
		return
	end)
end

function var_0_0.ExitTimelineTouchMode(arg_147_0)
	local var_147_0 = arg_147_0.ladyDict[arg_147_0.apartment:GetConfigID()]

	if not arg_147_0:GetBlackboardValue(var_147_0, "inIK") then
		return
	end

	arg_147_0.touchTimelineConfig = nil

	local var_147_1 = {}

	table.insert(var_147_1, function(arg_148_0)
		arg_147_0:emit(arg_147_0.SHOW_BLOCK)
		Shader.SetGlobalFloat("_ScreenClipOff", 1)
		arg_148_0()
	end)
	table.insert(var_147_1, function(arg_149_0)
		arg_147_0:RevertCharacterBylayer(var_147_0)
		setActive(var_147_0.ladyCollider, true)
		arg_147_0:SetUI(arg_149_0, "back")
	end)
	seriesAsync(var_147_1, function()
		arg_147_0:SetBlackboardValue(var_147_0, "inIK", false)
		arg_147_0:emit(arg_147_0.HIDE_BLOCK)
	end)
end

function var_0_0.EnterWalkMode(arg_151_0)
	local var_151_0 = arg_151_0.apartment:GetConfigID()
	local var_151_1 = arg_151_0.ladyDict[var_151_0]

	seriesAsync({
		function(arg_152_0)
			arg_151_0:emit(arg_151_0.SHOW_BLOCK)
			arg_151_0:HideCharacter(var_151_0)
			arg_151_0:SetBlackboardValue(var_151_1, "inWalk", true)
			arg_151_0:SetUI(arg_152_0, "walk")
		end,
		function(arg_153_0)
			arg_151_0:emit(arg_151_0.HIDE_BLOCK)
			arg_151_0:ChangeArtScene(arg_151_0.walkInfo.scene .. "|" .. arg_151_0.walkInfo.sceneRoot, arg_153_0)
		end,
		function(arg_154_0)
			arg_151_0:LoadSubScene(arg_151_0.walkInfo, arg_154_0)
		end
	}, function()
		return
	end)
end

function var_0_0.ExitWalkMode(arg_156_0)
	local var_156_0 = arg_156_0.apartment:GetConfigID()
	local var_156_1 = arg_156_0.ladyDict[var_156_0]

	seriesAsync({
		function(arg_157_0)
			arg_156_0:ChangeArtScene(arg_156_0.walkLastSceneInfo, arg_157_0)
		end,
		function(arg_158_0)
			arg_156_0:UnloadSubScene(arg_156_0.walkInfo, arg_158_0)
		end,
		function(arg_159_0)
			arg_156_0:emit(arg_156_0.SHOW_BLOCK)
			arg_156_0:SetUI(arg_159_0, "back")
		end
	}, function()
		arg_156_0:emit(arg_156_0.HIDE_BLOCK)
		arg_156_0:RevertCharacter(var_156_0)
		arg_156_0:SetBlackboardValue(var_156_1, "inWalk", false)

		local var_160_0 = arg_156_0.walkExitCall

		arg_156_0.walkExitCall = nil
		arg_156_0.walkLastSceneInfo = nil
		arg_156_0.walkInfo = nil

		existCall(var_160_0)
	end)
end

function var_0_0.EnableMiniGameCutIn(arg_161_0)
	if not arg_161_0.tfCutIn then
		return
	end

	local var_161_0 = arg_161_0.rtExtraScreen:Find("MiniGameCutIn")

	setActive(var_161_0, true)

	local var_161_1 = GetOrAddComponent(var_161_0:Find("bg/mask/cut_in"), "CameraRTUI")

	setActive(var_161_1, true)
	pg.CameraRTMgr.GetInstance():Bind(var_161_1, arg_161_0.tfCutIn:Find("TestCamera"):GetComponent(typeof(Camera)))
	quickPlayAnimator(arg_161_0.modelCutIn.lady, "Idle")
	quickPlayAnimator(arg_161_0.modelCutIn.player, "Idle")
	setActive(arg_161_0.tfCutIn, true)
end

function var_0_0.DisableMiniGameCutIn(arg_162_0)
	if not arg_162_0.tfCutIn then
		return
	end

	local var_162_0 = arg_162_0.rtExtraScreen:Find("MiniGameCutIn")
	local var_162_1 = GetOrAddComponent(var_162_0:Find("bg/mask/cut_in"), "CameraRTUI")

	pg.CameraRTMgr.GetInstance():Clean(var_162_1)
	setActive(var_162_0, false)
	setActive(arg_162_0.tfCutIn, false)
end

function var_0_0.SwitchIKConfig(arg_163_0, arg_163_1, arg_163_2)
	local var_163_0 = pg.dorm3d_ik_status[arg_163_2]

	if var_163_0.skin_id ~= arg_163_1.skinId then
		local var_163_1 = pg.dorm3d_ik_status.get_id_list_by_base[var_163_0.base]
		local var_163_2 = _.detect(var_163_1, function(arg_164_0)
			return pg.dorm3d_ik_status[arg_164_0].skin_id == arg_163_1.skinId
		end)

		assert(var_163_2, string.format("Missing Status Config By Skin: %s original Status: %s", arg_163_1.skinId, arg_163_2))

		var_163_0 = pg.dorm3d_ik_status[var_163_2]
	end

	arg_163_1.ikConfig = var_163_0
end

function var_0_0.SetIKState(arg_165_0, arg_165_1, arg_165_2)
	local var_165_0 = arg_165_0.ladyDict[arg_165_0.apartment:GetConfigID()]
	local var_165_1 = {}

	if arg_165_1 then
		table.insert(var_165_1, function(arg_166_0)
			arg_165_0:SetBlackboardValue(var_165_0, "inIK", true)
			arg_165_0:emit(arg_165_0.SHOW_BLOCK)

			local var_166_0 = var_165_0.ikConfig.camera_group

			setActive(arg_165_0.uiContianer:Find("ik/Right/btn_camera"), #pg.dorm3d_ik_status.get_id_list_by_camera_group[var_166_0] > 1)
			setActive(arg_165_0.ikControlUI, true)
			arg_166_0()
		end)

		if arg_165_0.uiState ~= "ik" then
			table.insert(var_165_1, function(arg_167_0)
				arg_165_0:SetUI(arg_167_0, "ik")
			end)
		end

		table.insert(var_165_1, function(arg_168_0)
			Shader.SetGlobalFloat("_ScreenClipOff", 0)
			arg_165_0:SetIKStatus(var_165_0, var_165_0.ikConfig, arg_168_0)
		end)
		table.insert(var_165_1, function(arg_169_0)
			arg_165_0:emit(arg_165_0.HIDE_BLOCK)
			arg_169_0()
		end)
	else
		assert(arg_165_0.uiState == "ik")
		table.insert(var_165_1, function(arg_170_0)
			setActive(arg_165_0.ikControlUI, false)
			arg_165_0:emit(arg_165_0.SHOW_BLOCK)
			Shader.SetGlobalFloat("_ScreenClipOff", 1)
			arg_170_0()
		end)

		local var_165_2 = var_165_0.skinIdList

		if var_165_0.skinId ~= var_165_2[1] then
			table.insert(var_165_1, function(arg_171_0)
				local var_171_0 = arg_165_0.apartment:GetConfigID()

				arg_165_0:SwitchCharacterSkin(var_165_0, var_171_0, var_165_2[1], arg_171_0)
			end)
		end

		table.insert(var_165_1, function(arg_172_0)
			arg_165_0:ExitIKStatus(var_165_0, var_165_0.ikConfig, arg_172_0)
			arg_165_0:ResetSceneItemAnimators()
		end)
		table.insert(var_165_1, function(arg_173_0)
			arg_165_0:SetUI(arg_173_0, "back")
		end)
		table.insert(var_165_1, function(arg_174_0)
			arg_165_0:SetBlackboardValue(var_165_0, "inIK", false)
			arg_165_0:emit(arg_165_0.HIDE_BLOCK)
			arg_174_0()
		end)
	end

	seriesAsync(var_165_1, arg_165_2)
end

function var_0_0.TouchModeAction(arg_175_0, arg_175_1, arg_175_2, arg_175_3, ...)
	return switch(arg_175_3, {
		function(arg_176_0, arg_176_1)
			return function(arg_177_0)
				seriesAsync({
					function(arg_178_0)
						if not arg_176_1 or arg_176_1 == "" then
							return arg_178_0()
						end

						arg_175_0:PlaySingleAction(arg_175_1, arg_176_1, arg_178_0)
					end,
					function(arg_179_0)
						arg_175_0:SwitchIKConfig(arg_175_1, arg_176_0)
						arg_175_0:SetIKState(true, arg_179_0)
					end,
					arg_177_0
				})
			end
		end,
		function()
			return function()
				if arg_175_0.ikSpecialCall then
					local var_181_0 = arg_175_0.ikSpecialCall

					arg_175_0.ikSpecialCall = nil

					existCall(var_181_0)
				else
					arg_175_0:ExitTouchMode()
				end
			end
		end,
		function(arg_182_0, arg_182_1)
			return function(arg_183_0)
				arg_175_0:PlaySingleAction(arg_175_1, arg_182_1, arg_183_0)
			end
		end,
		function(arg_184_0, arg_184_1, arg_184_2)
			return function(arg_185_0)
				seriesAsync({
					function(arg_186_0)
						arg_175_0:DoTalk(arg_184_1, arg_186_0)
					end,
					function(arg_187_0)
						if not arg_184_2 or arg_184_2 == 0 then
							return arg_187_0()
						end

						arg_175_0:SwitchIKConfig(arg_175_1, arg_184_2)
						arg_175_0:SetIKState(true, arg_187_0)
					end,
					arg_185_0
				})
			end
		end,
		function(arg_188_0, arg_188_1, arg_188_2, arg_188_3)
			return function(arg_189_0)
				arg_175_0:PlaySceneItemAnim(arg_188_2, arg_188_3)
				arg_175_0:PlaySingleAction(arg_188_1, arg_189_0)
			end
		end,
		function(arg_190_0)
			return function(arg_191_0)
				local var_191_0 = pg.dorm3d_ik_touch[arg_175_2]

				if #var_191_0.scene_item == 0 then
					return
				end

				local var_191_1 = arg_175_0:GetSceneItem(var_191_0.scene_item)

				if not var_191_1 then
					warning(string.format("dorm3d_ik_touch:%d without scene_item:%s", arg_175_2, var_191_0.scene_item))

					return
				end

				local var_191_2 = var_191_1:Find(arg_190_0)

				if not IsNil(var_191_2) then
					setActive(var_191_2, false)
					setActive(var_191_2, true)
				end

				arg_191_0()
			end
		end,
		function(arg_192_0)
			local var_192_0 = pg.dorm3d_ik_touch_move[arg_192_0]
			local var_192_1 = var_192_0.target_ik
			local var_192_2 = var_192_0.move_time
			local var_192_3 = var_192_0.ik_point
			local var_192_4 = var_192_0.touch_step

			arg_175_1.IKSettings.forceMove = arg_175_1.IKSettings.forceMove or {}

			local var_192_5 = arg_175_1.IKSettings.forceMove

			var_192_5[var_192_1] = var_192_5[var_192_1] or {}
			var_192_5[var_192_1].count = var_192_5[var_192_1].count or 0

			return function(arg_193_0)
				seriesAsync({
					function(arg_194_0)
						if var_192_5[var_192_1].count >= #var_192_4 then
							return arg_194_0()
						end

						local var_194_0 = Dorm3dIK.New({
							configId = var_192_1
						})
						local var_194_1 = Vector2.New(unpack(var_192_3))
						local var_194_2 = var_192_5[var_192_1].count
						local var_194_3 = var_192_4[var_194_2 + 1] - (var_194_2 == 0 and 0 or var_192_4[var_194_2])

						var_192_5[var_192_1].count = var_194_2 + 1

						pg.IKMgr.GetInstance():ResetIK(var_194_0:GetTriggerBoneName())

						local var_194_4 = arg_175_1.IKSettings.Colliders[var_194_0:GetTriggerBoneName()]
						local var_194_5 = arg_175_0.raycastCamera:WorldToScreenPoint(var_194_4.position)

						pg.IKMgr.GetInstance():PlayIKMove(var_194_5, var_194_0:GetTriggerBoneName(), var_194_1, var_192_4[var_194_2 + 1], var_192_2, function()
							var_192_5[var_192_1].count = 0

							arg_194_0()
						end)
					end,
					arg_193_0
				})
			end
		end
	}, function()
		return function()
			return
		end
	end, ...)
end

function var_0_0.OnTriggerIK(arg_198_0, arg_198_1)
	local var_198_0 = arg_198_0.ladyDict[arg_198_0.apartment:GetConfigID()]

	if var_198_0.ikTimelineMode then
		arg_198_0:ExitIKTimelineStatus(var_198_0)

		local var_198_1 = arg_198_1:GetTimelineAction()

		if var_198_1 then
			arg_198_0.nowTimelinePlayer:TriggerEvent(var_198_1)
		end

		return
	end

	if not var_198_0.ikConfig then
		return
	end

	local var_198_2 = arg_198_1:GetControllerPath()
	local var_198_3 = var_198_0.ikActionDict[var_198_2]

	if not var_198_3 then
		return
	end

	arg_198_0.blockIK = true

	arg_198_0:TouchModeAction(var_198_0, arg_198_1:GetConfigID(), unpack(var_198_3))(function()
		arg_198_0:ResetIKTipTimer()

		arg_198_0.blockIK = nil
	end)
end

function var_0_0.OnTouchCharacterBody(arg_200_0, arg_200_1)
	local var_200_0 = arg_200_0.ladyDict[arg_200_0.apartment:GetConfigID()]

	if not var_200_0.ikConfig then
		return
	end

	if type(var_200_0.ikConfig.touch_data) ~= "table" then
		return
	end

	for iter_200_0, iter_200_1 in ipairs(var_200_0.iKTouchDatas) do
		local var_200_1, var_200_2, var_200_3 = unpack(iter_200_1)
		local var_200_4 = pg.dorm3d_ik_touch[var_200_1]

		if var_200_4.body == arg_200_1 then
			local var_200_5 = var_200_4.action_emote

			if #var_200_5 > 0 then
				arg_200_0:PlayFaceAnim(var_200_0, var_200_5)
			end

			local var_200_6 = var_200_4.vibrate

			if type(var_200_6) == "table" and VibrateMgr.Instance:IsSupport() then
				local var_200_7 = {}
				local var_200_8 = {}
				local var_200_9 = {}

				underscore.each(var_200_6, function(arg_201_0)
					table.insert(var_200_7, arg_201_0[1])
					table.insert(var_200_8, arg_201_0[2])
					table.insert(var_200_9, 1)
				end)

				if PLATFORM == PLATFORM_ANDROID then
					VibrateMgr.Instance:VibrateWaveform(var_200_7, var_200_8)
				elseif PLATFORM == PLATFORM_ANDROID then
					VibrateMgr.Instance:VibrateWaveform(var_200_7, var_200_8, var_200_9)
				end
			end

			arg_200_0.blockIK = true

			arg_200_0:TouchModeAction(var_200_0, var_200_1, unpack(var_200_3))(function()
				arg_200_0:ResetIKTipTimer()

				arg_200_0.blockIK = nil
			end)

			return
		end
	end
end

function var_0_0.UpdateTouchGameDisplay(arg_203_0)
	setActive(arg_203_0.rtTouchGamePanel:Find("effect_bg"), arg_203_0.touchLevel == 2)
	setActive(arg_203_0.rtTouchGamePanel:Find("slider/icon/beating"), arg_203_0.touchLevel == 2)

	if arg_203_0.touchLevel == 1 then
		setActive(arg_203_0.uiContianer:Find("ik/btn_back"), true)
		setActive(arg_203_0.uiContianer:Find("ik/btn_back_heartbeat"), false)
		quickPlayAnimation(arg_203_0.rtTouchGamePanel, "anim_dorm3d_touch_change_out")
		quickPlayAnimation(arg_203_0.rtTouchGamePanel:Find("slider/icon"), "anim_dorm3d_touch_icon")
	elseif arg_203_0.touchLevel == 2 then
		setActive(arg_203_0.uiContianer:Find("ik/btn_back"), false)
		setActive(arg_203_0.uiContianer:Find("ik/btn_back_heartbeat"), true)
		quickPlayAnimation(arg_203_0.rtTouchGamePanel, "anim_dorm3d_touch_change")
		quickPlayAnimation(arg_203_0.rtTouchGamePanel:Find("slider/icon"), "anim_dorm3d_touch_icon_1")
		pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_heartbeat")
	end
end

function var_0_0.UpdateTouchCount(arg_204_0, arg_204_1)
	if arg_204_0.touchLevel > 1 then
		arg_204_1 = math.min(0, arg_204_1)
	end

	arg_204_0.touchCount = math.clamp(arg_204_0.touchCount + arg_204_1, 0, 100)

	if arg_204_0.sliderLT and LeanTween.isTweening(arg_204_0.sliderLT) then
		LeanTween.cancel(arg_204_0.sliderLT)

		arg_204_0.sliderLT = nil
	end

	setSlider(arg_204_0.rtTouchGamePanel:Find("slider"), 0, 100, arg_204_0.touchCount)

	local var_204_0

	if arg_204_0.touchCount >= 100 then
		var_204_0 = 2
	elseif arg_204_0.touchCount <= 0 then
		var_204_0 = 1
	end

	if var_204_0 and var_204_0 ~= arg_204_0.touchLevel then
		if arg_204_0.blockIK then
			return
		end

		arg_204_0.touchLevel = var_204_0

		local var_204_1 = arg_204_0.touchConfig.ik_status[var_204_0]

		if var_204_1 then
			if var_204_0 > 1 then
				arg_204_0.touchCount = 200
			elseif var_204_0 == 1 then
				arg_204_0.touchCount = 0
			end

			local var_204_2 = arg_204_0.ladyDict[arg_204_0.apartment:GetConfigID()]

			seriesAsync({
				function(arg_205_0)
					arg_204_0:ShowBlackScreen(true, arg_205_0)
				end,
				function(arg_206_0)
					arg_204_0:SwitchIKConfig(var_204_2, var_204_1)
					arg_204_0:SetIKState(true, arg_206_0)

					if var_204_0 > 1 and arg_204_0.touchConfig.heartbeat_enter_anim ~= "" then
						arg_204_0:SwitchAnim(var_204_2, arg_204_0.touchConfig.heartbeat_enter_anim)
					end
				end,
				function(arg_207_0)
					arg_204_0:ShowBlackScreen(false, arg_207_0)
				end
			})
		end

		arg_204_0:UpdateTouchCount(0)
		arg_204_0:UpdateTouchGameDisplay()
	end

	arg_204_0.topCount = math.max(arg_204_0.topCount, arg_204_0.touchCount)
end

function var_0_0.ExitHeartbeatMode(arg_208_0)
	if not arg_208_0.touchLevel or arg_208_0.touchLevel == 1 then
		return
	end

	arg_208_0.touchCount = 0

	arg_208_0:UpdateTouchCount(0)
end

function var_0_0.DoTouch(arg_209_0, arg_209_1, arg_209_2)
	if arg_209_0.inTouchGame then
		switch(arg_209_2, {
			function()
				arg_209_0:UpdateTouchCount(pg.dorm3d_set.rapport_heartbeat.key_value_int)
			end,
			function()
				arg_209_0:UpdateTouchCount(pg.dorm3d_set.rapport_heartbeat.key_value_int)
			end,
			function()
				arg_209_0:UpdateTouchCount(pg.dorm3d_set.rapport_heartbeat.key_value_int)
			end,
			function()
				arg_209_0:UpdateTouchCount(pg.dorm3d_set.rapport_heartbeat_trriger.key_value_int)
			end
		})
	end
end

function var_0_0.DoTalk(arg_214_0, arg_214_1, arg_214_2)
	while rawget(arg_214_0, "class") ~= var_0_0 do
		arg_214_0 = getmetatable(arg_214_0).__index
	end

	if arg_214_0.apartment and arg_214_0:GetBlackboardValue(arg_214_0.ladyDict[arg_214_0.apartment:GetConfigID()], "inTalking") then
		errorMsg("Talking block:" .. arg_214_1)

		return
	end

	if not arg_214_0.room:isPersonalRoom() then
		local var_214_0 = pg.dorm3d_dialogue_group[arg_214_1].char_id

		if arg_214_0.apartment then
			assert(arg_214_0.apartment:GetConfigID() == var_214_0)
		else
			arg_214_0:SetApartment(getProxy(ApartmentProxy):getApartment(var_214_0))
		end
	end

	local var_214_1 = arg_214_0.ladyDict[arg_214_0.apartment:GetConfigID()]

	if arg_214_1 == 10010 and not arg_214_0.apartment.talkDic[arg_214_1] then
		arg_214_0.firstTimelineTouch = true
		arg_214_0.firstMoveGuide = true
	end

	getProxy(Dorm3dChatProxy):TriggerEvent({
		{
			value = 1,
			event_type = arg_214_0.contextData.timeIndex == 1 and 110 or 115,
			ship_id = arg_214_0.apartment:GetConfigID()
		},
		{
			value = 1,
			event_type = 155,
			ship_id = arg_214_0.apartment:GetConfigID()
		}
	})

	local var_214_2 = {}

	if arg_214_0:GetBlackboardValue(var_214_1, "inPending") then
		table.insert(var_214_2, function(arg_215_0)
			arg_214_0:OutOfLazy(arg_214_0.apartment:GetConfigID(), arg_215_0)
		end)
	end

	local var_214_3 = pg.dorm3d_dialogue_group[arg_214_1]
	local var_214_4 = var_214_3.performance_type == 1
	local var_214_5

	table.insert(var_214_2, function(arg_216_0)
		arg_214_0:emit(arg_214_0.SHOW_BLOCK)
		arg_214_0:SetBlackboardValue(var_214_1, var_214_4 and "inPerformance" or "inTalking", true)
		arg_214_0:emit(Dorm3dRoomMediator.DO_TALK, arg_214_1, function(arg_217_0)
			var_214_5 = arg_217_0

			arg_216_0()
		end)
	end)
	table.insert(var_214_2, function(arg_218_0)
		pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataDialog(arg_214_0.apartment.configId, arg_214_0.apartment.level, arg_214_1, var_214_3.type, arg_214_0.room:getZoneConfig(arg_214_0.ladyDict[arg_214_0.apartment:GetConfigID()].ladyBaseZone, "id"), var_214_3.action_type, table.CastToString(var_214_3.trigger_config), arg_214_0.room:GetConfigID()))

		if pg.NewGuideMgr.GetInstance():IsBusy() then
			pg.NewGuideMgr.GetInstance():Pause()
		end

		arg_214_0:SetUI(arg_218_0, "blank")
	end)

	if var_214_3.trigger_area and var_214_3.trigger_area ~= "" then
		table.insert(var_214_2, function(arg_219_0)
			arg_214_0:ShiftZone(var_214_3.trigger_area, arg_219_0)
		end)
	end

	if var_214_3.performance_type == 0 then
		table.insert(var_214_2, function(arg_220_0)
			arg_214_0:emit(arg_214_0.HIDE_BLOCK)
			pg.NewStoryMgr.GetInstance():ForceManualPlay(var_214_3.story, function()
				onDelayTick(arg_220_0, 0.001)
			end, true)
		end)
	elseif var_214_3.performance_type == 1 then
		table.insert(var_214_2, function(arg_222_0)
			arg_214_0:emit(arg_214_0.HIDE_BLOCK)
			arg_214_0:PerformanceQueue(var_214_3.story, arg_222_0)
		end)
	else
		assert(false)
	end

	table.insert(var_214_2, function(arg_223_0)
		arg_214_0:emit(arg_214_0.SHOW_BLOCK)
		arg_223_0()
	end)
	table.insert(var_214_2, function(arg_224_0)
		local var_224_0 = pg.NewStoryMgr.GetInstance():StoryName2StoryId(var_214_3.story)

		if var_224_0 then
			local var_224_1 = "1"

			pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataStory(var_224_0, var_224_1))
		end

		if var_214_5 and #var_214_5 > 0 then
			arg_214_0:emit(Dorm3dRoomMediator.OPEN_DROP_LAYER, var_214_5, arg_224_0)
		else
			arg_224_0()
		end
	end)
	table.insert(var_214_2, function(arg_225_0)
		if pg.NewGuideMgr.GetInstance():IsPause() then
			pg.NewGuideMgr.GetInstance():Resume()
		end

		arg_214_0:emit(arg_214_0.HIDE_BLOCK)
		arg_214_0:SetBlackboardValue(var_214_1, var_214_4 and "inPerformance" or "inTalking", false)
		arg_214_0:SetUI(arg_225_0, "back")
	end)
	seriesAsync(var_214_2, function()
		if arg_214_2 then
			return arg_214_2()
		else
			arg_214_0:CheckQueue()
		end
	end)
end

function var_0_0.DoTalkTouchOption(arg_227_0, arg_227_1, arg_227_2, arg_227_3)
	local var_227_0 = arg_227_0.rtExtraScreen:Find("TalkTouchOption")
	local var_227_1
	local var_227_2 = var_227_0:Find("content")

	UIItemList.StaticAlign(var_227_2, var_227_2:Find("clickTpl"), #arg_227_1.options, function(arg_228_0, arg_228_1, arg_228_2)
		arg_228_1 = arg_228_1 + 1

		if arg_228_0 == UIItemList.EventUpdate then
			local var_228_0 = arg_227_1.options[arg_228_1]

			setAnchoredPosition(arg_228_2, NewPos(unpack(var_228_0.pos)))
			onButton(arg_227_0, arg_228_2, function()
				var_227_1(var_228_0.flag)
			end, SFX_CONFIRM)
			setActive(arg_228_2, not table.contains(arg_227_2, var_228_0.flag))
		end
	end)
	setActive(var_227_0, true)

	function var_227_1(arg_230_0)
		setActive(var_227_0, false)
		arg_227_3(arg_230_0)
	end
end

function var_0_0.DoTimelineOption(arg_231_0, arg_231_1, arg_231_2)
	local var_231_0 = arg_231_0.rtTimelineScreen:Find("TimelineOption")
	local var_231_1
	local var_231_2 = var_231_0:Find("content")

	UIItemList.StaticAlign(var_231_2, var_231_2:Find("clickTpl"), #arg_231_1, function(arg_232_0, arg_232_1, arg_232_2)
		arg_232_1 = arg_232_1 + 1

		if arg_232_0 == UIItemList.EventUpdate then
			local var_232_0 = arg_231_1[arg_232_1]

			setText(arg_232_2:Find("Text"), HXSet.hxLan(var_232_0.content))
			onButton(arg_231_0, arg_232_2, function()
				var_231_1(arg_232_1)
			end, SFX_CONFIRM)
		end
	end)
	setActive(var_231_0, true)

	function var_231_1(arg_234_0)
		setActive(var_231_0, false)
		arg_231_2(arg_234_0)
	end
end

function var_0_0.DoTimelineTouch(arg_235_0, arg_235_1, arg_235_2)
	local var_235_0 = arg_235_0.rtTimelineScreen:Find("TimelineTouch")
	local var_235_1
	local var_235_2 = var_235_0:Find("content")

	UIItemList.StaticAlign(var_235_2, var_235_2:Find("clickTpl"), #arg_235_1, function(arg_236_0, arg_236_1, arg_236_2)
		arg_236_1 = arg_236_1 + 1

		if arg_236_0 == UIItemList.EventUpdate then
			local var_236_0 = arg_235_1[arg_236_1]

			setAnchoredPosition(arg_236_2, NewPos(unpack(var_236_0.pos)))
			onButton(arg_235_0, arg_236_2, function()
				var_235_1(arg_236_1)
			end, SFX_CONFIRM)

			if arg_235_0.firstTimelineTouch then
				arg_235_0.firstTimelineTouch = nil

				setActive(arg_236_2:Find("finger"), true)
			end
		end
	end)
	setActive(var_235_0, true)

	function var_235_1(arg_238_0)
		setActive(var_235_0, false)
		arg_235_2(arg_238_0)
	end
end

function var_0_0.DoShortWait(arg_239_0, arg_239_1)
	local var_239_0 = arg_239_0.ladyDict[arg_239_1]
	local var_239_1 = getProxy(ApartmentProxy):getApartment(arg_239_1)
	local var_239_2 = arg_239_0.room:getApartmentZoneConfig(var_239_0.ladyBaseZone, "special_action", arg_239_1)
	local var_239_3 = var_239_2 and var_239_2[math.random(#var_239_2)] or nil

	if not var_239_3 then
		return
	end

	arg_239_0:PlaySingleAction(var_239_0, var_239_3)
end

function var_0_0.OutOfLazy(arg_240_0, arg_240_1, arg_240_2)
	local var_240_0 = arg_240_0.ladyDict[arg_240_1]
	local var_240_1 = {}

	if arg_240_0:GetBlackboardValue(var_240_0, "inPending") then
		table.insert(var_240_1, function(arg_241_0)
			arg_240_0.shiftLady = arg_240_1

			arg_240_0:ShiftZone(var_240_0.ladyBaseZone, arg_241_0)
		end)
	end

	seriesAsync(var_240_1, arg_240_2)
end

function var_0_0.OutOfPending(arg_242_0, arg_242_1, arg_242_2)
	assert(arg_242_0.wakeUpTalkId)

	local var_242_0 = arg_242_0.wakeUpTalkId

	seriesAsync({
		function(arg_243_0)
			arg_242_0:SetUI(arg_243_0, "blank")
		end,
		function(arg_244_0)
			arg_242_0.shiftLady = arg_242_1

			arg_242_0:ShiftZone(arg_242_0.ladyBaseZone, arg_244_0)
		end,
		function(arg_245_0)
			arg_242_0:DoTalk(var_242_0, arg_245_0)
		end
	}, function()
		arg_242_0:SetUIStore(arg_242_2, "back")
	end)
end

function var_0_0.ChangeCanWatchState(arg_247_0, arg_247_1)
	local var_247_0

	if arg_247_0:GetBlackboardValue(arg_247_1, "inPending") then
		var_247_0 = tobool(arg_247_0:GetBlackboardValue(arg_247_1, "inDistance"))
	else
		local var_247_1 = arg_247_0:GetBlackboardValue(arg_247_1, "groupId")

		var_247_0 = tobool(arg_247_0.activeLady[var_247_1] and pg.NodeCanvasMgr.GetInstance():GetBlackboradValue("canWatch", arg_247_1.ladyBlackboard))
	end

	if not arg_247_1.nowCanWatchState or arg_247_1.nowCanWatchState ~= var_247_0 then
		arg_247_1.nowCanWatchState = var_247_0

		arg_247_0:ShowOrHideCanWatchMark(arg_247_1, arg_247_1.nowCanWatchState)
	end
end

function var_0_0.HandleGameNotification(arg_248_0, arg_248_1, arg_248_2)
	local var_248_0 = arg_248_0.ladyDict[arg_248_0.apartment:GetConfigID()]

	switch(arg_248_1, {
		[Dorm3dMiniGameMediator.OPERATION] = function()
			local var_249_0 = arg_248_2.miniGameId

			switch(arg_248_2.miniGameId, {
				[67] = function()
					if arg_248_2.operationCode == "GAME_HIT_AREA" then
						local var_250_0 = {
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
						local var_250_1, var_250_2 = unpack(var_250_0[arg_248_2.index])

						arg_248_0:PlayFaceAnim(var_248_0, var_250_1)

						if arg_248_0.tfCutIn then
							quickPlayAnimator(arg_248_0.modelCutIn.lady, var_250_2)
							quickPlayAnimator(arg_248_0.modelCutIn.player, var_250_2)
						end
					elseif arg_248_2.operationCode == "GAME_RESULT" then
						if arg_248_2.win then
							arg_248_0:PlayFaceAnim(var_248_0, "Face_XYX_victory")
							arg_248_0:PlaySingleAction(var_248_0, "minigame_win")
						else
							arg_248_0:PlayFaceAnim(var_248_0, "Face_XYX_lose")
							arg_248_0:PlaySingleAction(var_248_0, "minigame_lose")
						end

						setActive(arg_248_0.rtExtraScreen:Find("MiniGameCutIn"), false)
					end
				end,
				[70] = function()
					if arg_248_2.operationCode == "GAME_READY" then
						arg_248_0.cameras[var_0_0.CAMERA.TALK].Follow = nil
						arg_248_0.cameras[var_0_0.CAMERA.TALK].LookAt = nil

						arg_248_0:PlaySingleAction(var_248_0, "shuohua_sikao")
					elseif arg_248_2.operationCode == "ROUND_RESULT" then
						local var_251_0

						if arg_248_2.success then
							var_251_0 = {
								"shuohua_wenhou",
								"shuohua_sikao"
							}
						else
							var_251_0 = {
								"shuohua_yaotou",
								"shuohua_sikao"
							}
						end

						seriesAsync(underscore.map(var_251_0, function(arg_252_0)
							return function(arg_253_0)
								arg_248_0:PlaySingleAction(var_248_0, arg_252_0, arg_253_0)
							end
						end), function()
							return
						end)
					elseif arg_248_2.operationCode == "GAME_RESULT" then
						local var_251_1 = arg_248_0.cameras[var_0_0.CAMERA.TALK].transform

						var_251_1.position = var_251_1.position + var_251_1.right * 0.11

						local var_251_2 = {
							"shuohua_gandong"
						}

						seriesAsync(underscore.map(var_251_2, function(arg_255_0)
							return function(arg_256_0)
								arg_248_0:PlaySingleAction(var_248_0, arg_255_0, arg_256_0)
							end
						end), function()
							return
						end)
					end
				end,
				[75] = function()
					if arg_248_2.operationCode == "BEFORE_OPEN_GAME" then
						arg_248_0.cameras[var_0_0.CAMERA.TALK].Follow = nil
						arg_248_0.cameras[var_0_0.CAMERA.TALK].LookAt = nil
					elseif arg_248_2.operationCode == "GAME_RPS_RESULT" then
						if arg_248_2.index == 1 then
							arg_248_0:PlaySingleAction(var_248_0, "ab_shuohua_lianxuyaotou_01")
							arg_248_0:PlayFaceAnim(var_248_0, "Face_weixiao")
						elseif arg_248_2.index == 2 then
							arg_248_0:PlaySingleAction(var_248_0, "ab_shuohua_lianxudiantou_01")
							arg_248_0:PlayFaceAnim(var_248_0, "Face_kaixin")
						end
					elseif arg_248_2.operationCode == "GAME_RESULT" then
						if not arg_248_2.win then
							arg_248_0:PlaySingleAction(var_248_0, "ab_shuohua_taibangle_01")
						end

						arg_248_0:PlayFaceAnim(var_248_0, "Face_kaixin")
					end
				end
			}, function()
				warning("without miniGameId:" .. arg_248_2.miniGameId)
			end)

			if arg_248_2.operationCode == "BEFORE_OPEN_GAME" then
				local var_249_1 = getProxy(PlayerProxy):getPlayerId()
				local var_249_2 = 0

				if var_249_0 == 67 or var_249_0 == 70 then
					var_249_2 = PlayerPrefs.GetInt("mg_new_score_" .. tostring(var_249_1) .. "_" .. arg_248_2.miniGameId, 0)
				else
					var_249_2 = PlayerPrefs.GetInt("mg_score_" .. tostring(var_249_1) .. "_" .. arg_248_2.miniGameId, 0)
				end

				arg_248_0.highScore = var_249_2
			elseif arg_248_2.operationCode == "GAME_RESULT" then
				local var_249_3 = arg_248_2.score
				local var_249_4 = getProxy(PlayerProxy):getPlayerId()

				if var_249_3 > arg_248_0.highScore then
					if var_249_0 == 67 or var_249_0 == 70 then
						PlayerPrefs.SetInt("mg_new_score_" .. tostring(var_249_4) .. "_" .. arg_248_2.miniGameId, var_249_3)
					end

					getProxy(Dorm3dChatProxy):TriggerEvent({
						{
							event_type = 159,
							value = var_249_3,
							ship_id = arg_248_0.apartment:GetConfigID()
						}
					})
				end

				pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataMiniGame(2, arg_248_2.score))
			elseif arg_248_2.operationCode == "GAME_CLOSE" and arg_248_2.doTrack == false then
				pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataMiniGame(3))
			end
		end
	})
end

function var_0_0.PerformanceQueue(arg_260_0, arg_260_1, arg_260_2)
	local var_260_0, var_260_1 = pcall(function()
		return require("GameCfg.dorm." .. arg_260_1)
	end)

	if not var_260_0 then
		errorMsg("不存在表演ID对应的Lua:" .. arg_260_1)
		existCall(arg_260_2)

		return
	end

	warning(arg_260_1)

	arg_260_0.performanceInfo = {
		name = arg_260_1
	}

	local var_260_2 = {}

	table.insert(var_260_2, function(arg_262_0)
		arg_260_0:SetUI(arg_262_0, "blank")
	end)
	table.insertto(var_260_2, underscore.map(var_260_1, function(arg_263_0)
		return switch(arg_263_0.type, {
			function()
				return function(arg_265_0)
					local var_265_0 = unpack(arg_263_0.params)

					arg_260_0:DoTalk(var_265_0, arg_265_0, true)
				end
			end,
			function()
				return function(arg_267_0)
					arg_260_0.touchExitCall = arg_267_0

					arg_260_0:EnterTouchMode()
				end
			end,
			function()
				return function(arg_269_0)
					local var_269_0 = arg_260_0.ladyDict[arg_260_0.apartment:GetConfigID()]

					arg_260_0:PlaySingleAction(var_269_0, arg_263_0.name, arg_269_0)
				end
			end,
			function()
				return function(arg_271_0)
					arg_260_0:emit(arg_260_0.PLAY_EXPRESSION, arg_263_0)
					arg_271_0()
				end
			end,
			function()
				return function(arg_273_0)
					arg_260_0:ShiftZone(arg_263_0.name, arg_273_0)
				end
			end,
			function()
				return function(arg_275_0)
					arg_260_0.contextData.timeIndex = arg_263_0.params[1]

					if arg_260_0.dormSceneMgr.artSceneInfo == arg_260_0.dormSceneMgr.sceneInfo then
						arg_260_0:SwitchDayNight(arg_260_0.contextData.timeIndex)
						onNextTick(function()
							arg_260_0:RefreshSlots()
						end)
					end

					arg_260_0:UpdateContactState()
					onNextTick(arg_275_0)
				end
			end,
			function()
				return function(arg_278_0)
					arg_260_0:ActiveStateCamera(arg_263_0.name, arg_278_0)
				end
			end,
			function()
				return function(arg_280_0)
					if arg_263_0.name == "base" then
						arg_260_0:ChangeArtScene(arg_260_0.dormSceneMgr.sceneInfo, arg_280_0)
					else
						local var_280_0 = arg_263_0.params.scene
						local var_280_1 = arg_263_0.params.sceneRoot

						arg_260_0:ChangeArtScene(var_280_0 .. "|" .. var_280_1, arg_280_0)
					end
				end
			end,
			function()
				return function(arg_282_0)
					local var_282_0 = arg_263_0.params.name

					if arg_263_0.name == "load" then
						func = tobool(arg_263_0.params.wait_timeline) and function(arg_283_0)
							arg_260_0.waitForTimeline = arg_283_0
						end

						arg_260_0:LoadTimelineScene(var_282_0, true, func, arg_282_0)
					elseif arg_263_0.name == "unload" then
						arg_260_0:UnloadTimelineScene(var_282_0, true, arg_282_0)
					else
						assert(false)
					end
				end
			end,
			function()
				return function(arg_285_0)
					setActive(arg_260_0.uiContianer:Find("walk/btn_back"), false)

					local var_285_0 = arg_260_0.ladyDict[arg_260_0.apartment:GetConfigID()]

					if arg_263_0.name == "change" then
						local var_285_1 = arg_263_0.params.scene
						local var_285_2 = arg_263_0.params.sceneRoot

						var_285_0.walkBornPoint = arg_263_0.params.point or "Default"

						arg_260_0:ChangeWalkScene(var_285_1 .. "|" .. var_285_2, arg_285_0)
					elseif arg_263_0.name == "back" then
						var_285_0.walkBornPoint = nil

						arg_260_0:ChangeWalkScene(arg_260_0.dormSceneMgr.sceneInfo, arg_285_0)
					elseif arg_263_0.name == "set" then
						local function var_285_3()
							local var_286_0 = arg_285_0

							arg_285_0 = nil

							return existCall(var_286_0)
						end

						for iter_285_0, iter_285_1 in pairs(arg_263_0.params) do
							switch(iter_285_0, {
								back_button_trigger = function(arg_287_0)
									onButton(arg_260_0, arg_260_0.uiContianer:Find("walk/btn_back"), var_285_3, "ui-dorm_back_v2")
									setActive(arg_260_0.uiContianer:Find("walk/btn_back"), IsUnityEditor and arg_287_0)
								end,
								near_trigger = function(arg_288_0)
									if arg_288_0 == true then
										arg_288_0 = 1.5
									end

									if arg_288_0 then
										function arg_260_0.walkNearCallback(arg_289_0)
											if arg_289_0 < arg_288_0 then
												arg_260_0.walkNearCallback = nil

												var_285_3()
											end
										end
									else
										arg_260_0.walkNearCallback = nil
									end
								end
							}, nil, iter_285_1)
						end

						if arg_260_0.firstMoveGuide then
							setActive(arg_260_0.povLayer:Find("Guide"), arg_260_0.firstMoveGuide)

							arg_260_0.firstMoveGuide = nil
						end
					else
						assert(false)
					end
				end
			end,
			function()
				return function(arg_291_0)
					if arg_263_0.name == "set" then
						local var_291_0 = arg_260_0.ladyDict[arg_260_0.apartment:GetConfigID()]

						arg_260_0:SwitchIKConfig(var_291_0, arg_263_0.params.state)
						setActive(arg_260_0.uiContianer:Find("ik/btn_back"), not arg_263_0.params.hide_back)

						arg_260_0.ikSpecialCall = arg_291_0

						arg_260_0:SetIKState(true)
					elseif arg_263_0.name == "back" then
						local var_291_1 = arg_260_0.ladyDict[arg_260_0.apartment:GetConfigID()]

						var_291_1.ikConfig = arg_263_0.params

						arg_260_0:SetIKState(false, function()
							var_291_1.ikConfig = nil

							existCall(arg_291_0)
						end)
					else
						assert(false)
					end
				end
			end,
			function()
				return function(arg_294_0)
					arg_260_0.blackSceneInfo = setmetatable(arg_263_0.params or {}, {
						__index = {
							color = "#000000",
							time = 0.3,
							delay = arg_263_0.name == "show" and 0 or 0.5
						}
					})

					if arg_263_0.name == "show" then
						arg_260_0:ShowBlackScreen(true, arg_294_0)
					elseif arg_263_0.name == "hide" then
						arg_260_0:ShowBlackScreen(false, arg_294_0)
					else
						assert(false)
					end

					arg_260_0.blackSceneInfo = nil
				end
			end
		})
	end))
	table.insert(var_260_2, function(arg_295_0)
		arg_260_0:SetUI(arg_295_0, "back")

		arg_260_0.performanceInfo = nil
	end)
	seriesAsync(var_260_2, arg_260_2)
end

function var_0_0.TriggerContact(arg_296_0, arg_296_1)
	arg_296_0:emit(Dorm3dRoomMediator.COLLECTION_ITEM, {
		itemId = arg_296_1,
		roomId = arg_296_0.room:GetConfigID(),
		groupId = arg_296_0.room:isPersonalRoom() and arg_296_0.apartment:GetConfigID() or 0
	})
end

function var_0_0.UpdateContactState(arg_297_0)
	arg_297_0:SetContactStateDic(arg_297_0.room:getTriggerableCollectItemDic(arg_297_0.contextData.timeIndex))
end

function var_0_0.UpdateFavorDisplay(arg_298_0)
	local var_298_0, var_298_1 = getProxy(ApartmentProxy):getStamina()

	setText(arg_298_0.rtStaminaDisplay:Find("Text"), string.format("%d/%d", var_298_0, var_298_1))
	setActive(arg_298_0.rtStaminaDisplay, false)

	if arg_298_0.apartment then
		setText(arg_298_0.rtFavorLevel:Find("rank/Text"), arg_298_0.apartment.level)

		local var_298_2, var_298_3 = arg_298_0.apartment:getFavor()
		local var_298_4 = arg_298_0.apartment:isMaxFavor()

		setActive(arg_298_0.rtFavorLevel:Find("Max"), var_298_4)
		setActive(arg_298_0.rtFavorLevel:Find("Text"), not var_298_4)
		setText(arg_298_0.rtFavorLevel:Find("Text"), string.format("<color=#ff6698>%d</color>/%d", var_298_2, var_298_3))
	end

	setActive(arg_298_0.rtFavorLevel:Find("red"), Dorm3dLevelLayer.IsShowRed())
end

function var_0_0.UpdateBtnState(arg_299_0)
	local var_299_0 = not arg_299_0.room:isPersonalRoom() or arg_299_0:CheckSystemOpen("Furniture")
	local var_299_1 = Dorm3dFurniture.IsTimelimitShopTip(arg_299_0.room:GetConfigID())

	setActive(arg_299_0.uiContianer:Find("base/left/btn_furniture/tipTimelimit"), var_299_0 and var_299_1)

	local var_299_2 = Dorm3dFurniture.NeedViewTip(arg_299_0.room:GetConfigID())

	setActive(arg_299_0.uiContianer:Find("base/left/btn_furniture/tip"), var_299_0 and not var_299_1 and var_299_2)
	setActive(arg_299_0.uiContianer:Find("base/btn_back/main"), underscore(getProxy(ApartmentProxy):getRawData()):chain():values():filter(function(arg_300_0)
		return tobool(arg_300_0)
	end):any(function(arg_301_0)
		return #arg_301_0:getSpecialTalking() > 0 or arg_301_0:getIconTip() == "main"
	end):value())
	setActive(arg_299_0.uiContianer:Find("base/left/btn_collection/tip"), PlayerPrefs.GetInt("apartment_collection_item", 0) > 0 or PlayerPrefs.GetInt("apartment_collection_recall", 0) > 0)
end

function var_0_0.AddUnlockDisplay(arg_302_0, arg_302_1)
	table.insert(arg_302_0.unlockList, arg_302_1)

	if not isActive(arg_302_0.rtFavorUp) then
		setText(arg_302_0.rtFavorUp:Find("Text"), table.remove(arg_302_0.unlockList, 1))
		setActive(arg_302_0.rtFavorUp, true)
	end
end

function var_0_0.PopFavorTrigger(arg_303_0, arg_303_1)
	local var_303_0 = arg_303_1.triggerId
	local var_303_1 = arg_303_1.delta
	local var_303_2 = arg_303_1.cost
	local var_303_3 = arg_303_1.apartment
	local var_303_4 = pg.dorm3d_favor_trigger[var_303_0]

	if var_303_4.is_repeat == 0 then
		if var_303_0 == getDorm3dGameset("drom3d_favir_trigger_onwer")[1] then
			arg_303_0:AddUnlockDisplay(i18n("dorm3d_own_favor"))
		elseif var_303_0 == getDorm3dGameset("drom3d_favir_trigger_propose")[1] then
			arg_303_0:AddUnlockDisplay(i18n("dorm3d_pledge_favor"))
		else
			arg_303_0:AddUnlockDisplay(string.format("unknow favor trigger:%d unlock", var_303_0))
		end
	elseif arg_303_1.delta > 0 then
		local var_303_5, var_303_6 = var_303_3:getFavor()
		local var_303_7 = var_303_5 + var_303_1

		setText(arg_303_0.rtFavorUpDaily:Find("bg/Text"), string.format("<size=30>+%d</size>", math.min(9999, var_303_1)))
		setSlider(arg_303_0.rtFavorUpDaily:Find("bg/slider"), 0, var_303_6, var_303_5)
		setAnchoredPosition(arg_303_0.rtFavorUpDaily:Find("bg"), arg_303_1.isGift and NewPos(-354, 223) or NewPos(-208, 105))

		local var_303_8 = {}
		local var_303_9 = arg_303_0.rtFavorUpDaily:Find("bg/effect")

		eachChild(var_303_9, function(arg_304_0)
			setActive(arg_304_0, false)
		end)

		local var_303_10

		if var_303_4.effect and var_303_4.effect ~= "" then
			var_303_10 = var_303_9:Find(var_303_4.effect .. "(Clone)")

			if not var_303_10 then
				table.insert(var_303_8, function(arg_305_0)
					LoadAndInstantiateAsync("Dorm3D/Effect/Prefab/ExpressionUI", "uifx_dorm3d_yinfu01", function(arg_306_0)
						setParent(arg_306_0, var_303_9)

						var_303_10 = tf(arg_306_0)

						arg_305_0()
					end)
				end)
			else
				setActive(var_303_10, true)
			end
		end

		local var_303_11 = arg_303_0.rtFavorUpDaily:GetComponent("DftAniEvent")

		var_303_11:SetTriggerEvent(function(arg_307_0)
			local var_307_0 = GetComponent(arg_303_0.rtFavorUpDaily:Find("bg/slider"), typeof(Slider))

			LeanTween.value(var_303_5, var_303_7, 0.5):setOnUpdate(System.Action_float(function(arg_308_0)
				var_307_0.value = arg_308_0
			end)):setEase(LeanTweenType.easeInOutQuad):setDelay(0.165):setOnComplete(System.Action(function()
				LeanTween.delayedCall(0.165, System.Action(function()
					if arg_303_0.exited then
						return
					end

					quickPlayAnimator(arg_303_0.rtFavorUpDaily, "favor_out")
				end))
			end))
			pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_progaress_bar")
		end)
		var_303_11:SetEndEvent(function(arg_311_0)
			setActive(arg_303_0.rtFavorUpDaily, false)
		end)
		seriesAsync(var_303_8, function()
			local var_312_0 = arg_303_0.ladyDict[var_303_3:GetConfigID()]

			setLocalPosition(arg_303_0.rtFavorUpDaily, arg_303_0:GetLocalPosition(arg_303_0:GetScreenPosition(var_312_0.ladyHeadCenter.position), arg_303_0.rtFavorUpDaily.parent))
			setActive(arg_303_0.rtFavorUpDaily, true)
			SetCompomentEnabled(arg_303_0.rtFavorUpDaily, typeof(Animator), true)
			quickPlayAnimator(arg_303_0.rtFavorUpDaily, "favor_open")

			if var_303_2 > 0 then
				local var_312_1, var_312_2 = getProxy(ApartmentProxy):getStamina()

				setText(arg_303_0.rtStaminaPop:Find("Text/Text (1)"), "-" .. var_303_2)
				setText(arg_303_0.rtStaminaPop:Find("Text"), string.format("%d/%d", var_312_1 + var_303_2, var_312_2))
				setActive(arg_303_0.rtStaminaPop, true)
			end
		end)
	end
end

function var_0_0.PopFavorLevelUp(arg_313_0, arg_313_1, arg_313_2, arg_313_3)
	arg_313_0.isLock = true

	LeanTween.delayedCall(0.33, System.Action(function()
		arg_313_0.isLock = false
	end))

	local var_313_0 = math.floor(arg_313_1.level / 10)
	local var_313_1 = math.fmod(arg_313_1.level, 10)

	GetImageSpriteFromAtlasAsync("ui/favor_atlas", var_313_1, arg_313_0.rtLevelUpWindow:Find("panel/bg/item1/mark/level/digit2"))
	GetImageSpriteFromAtlasAsync("ui/favor_atlas", var_313_0, arg_313_0.rtLevelUpWindow:Find("panel/bg/item1/mark/level/digit1"))
	setActive(arg_313_0.rtLevelUpWindow:Find("panel/bg/item1/mark/level/digit1"), var_313_0 > 0)

	local var_313_2
	local var_313_3

	arg_313_0.clientAward, var_313_3 = Dorm3dIconHelper.SplitStory(arg_313_1:getFavorConfig("levelup_client_item", arg_313_1.level))
	arg_313_0.serverAward = arg_313_2

	local var_313_4 = arg_313_0.rtLevelUpWindow:Find("panel/info/content/itemContent")

	if not arg_313_0.levelItemList then
		arg_313_0.levelItemList = UIItemList.New(var_313_4, var_313_4:Find("tpl"))

		arg_313_0.levelItemList:make(function(arg_315_0, arg_315_1, arg_315_2)
			local var_315_0 = arg_315_1 + 1

			if arg_315_0 == UIItemList.EventUpdate then
				if arg_315_1 < #arg_313_0.serverAward then
					updateDorm3dIcon(arg_315_2, arg_313_0.serverAward[var_315_0])
					onButton(arg_313_0, arg_315_2, function()
						arg_313_0:emit(BaseUI.ON_NEW_DROP, {
							drop = arg_313_0.serverAward[var_315_0]
						})
					end, SFX_PANEL)
				else
					Dorm3dIconHelper.UpdateDorm3dIcon(arg_315_2, arg_313_0.clientAward[var_315_0 - #arg_313_0.serverAward])
					onButton(arg_313_0, arg_315_2, function()
						arg_313_0:emit(Dorm3dRoomMediator.ON_DROP_CLIENT, {
							data = arg_313_0.clientAward[var_315_0 - #arg_313_0.serverAward]
						})
					end, SFX_PANEL)
				end
			end
		end)
	end

	arg_313_0.levelItemList:align(#arg_313_0.serverAward + #arg_313_0.clientAward)
	setActive(arg_313_0.rtLevelUpWindow, true)
	pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_upgrade")
	pg.UIMgr.GetInstance():OverlayPanel(arg_313_0.rtLevelUpWindow, {
		weight = LayerWeightConst.SECOND_LAYER,
		groupName = LayerWeightConst.GROUP_DORM3D
	})

	function arg_313_0.levelUpCallback()
		arg_313_0.levelUpCallback = nil

		if var_313_3 then
			arg_313_0:PopNewStoryTip(var_313_3)
		end

		existCall(arg_313_3)
	end
end

function var_0_0.PopNewStoryTip(arg_319_0, arg_319_1, arg_319_2)
	local var_319_0 = arg_319_0.uiContianer:Find("base/top/story_tip")

	setActive(var_319_0, true)
	LeanTween.delayedCall(1, System.Action(function()
		setActive(var_319_0, false)
	end))
	setText(var_319_0:Find("Text"), i18n("dorm3d_story_unlock_tip", pg.dorm3d_recall[arg_319_1[2]].name))
	existCall(arg_319_2)
end

function var_0_0.UpdateZoneList(arg_321_0)
	local var_321_0

	if arg_321_0.room:isPersonalRoom() then
		var_321_0 = arg_321_0.ladyDict[arg_321_0.apartment:GetConfigID()].ladyBaseZone
	else
		var_321_0 = arg_321_0:GetAttachedFurnitureName()
	end

	for iter_321_0, iter_321_1 in ipairs(arg_321_0.zoneDatas) do
		if iter_321_1:GetWatchCameraName() == var_321_0 then
			setText(arg_321_0.btnZone:Find("Text"), iter_321_1:GetName())
			setTextColor(arg_321_0.rtZoneList:GetChild(iter_321_0 - 1):Find("Name"), Color.NewHex("5CCAFF"))
		else
			setTextColor(arg_321_0.rtZoneList:GetChild(iter_321_0 - 1):Find("Name"), Color.NewHex("FFFFFF99"))
		end
	end
end

function var_0_0.TalkingEventHandle(arg_322_0, arg_322_1)
	local var_322_0 = {}
	local var_322_1 = {}
	local var_322_2 = arg_322_1.data

	if var_322_2.op_list then
		for iter_322_0, iter_322_1 in ipairs(var_322_2.op_list) do
			table.insert(var_322_0, function(arg_323_0)
				local function var_323_0()
					local var_324_0 = arg_323_0

					arg_323_0 = nil

					return existCall(var_324_0)
				end

				switch(iter_322_1.type, {
					action = function()
						local var_325_0 = arg_322_0.ladyDict[arg_322_0.apartment:GetConfigID()]

						arg_322_0:PlaySingleAction(var_325_0, iter_322_1.name, var_323_0)
					end,
					item_action = function()
						arg_322_0:PlaySceneItemAnim(iter_322_1.id, iter_322_1.name)
						var_323_0()
					end,
					timeline = function()
						if arg_322_0.inTouchGame then
							setActive(arg_322_0.rtTouchGamePanel, false)
						end

						arg_322_0:PlayTimeline(iter_322_1, function(arg_328_0, arg_328_1)
							setActive(arg_322_0.rtTouchGamePanel, arg_322_0.inTouchGame)

							var_322_1.notifiCallback = arg_328_1

							var_323_0()
						end)
					end,
					clickOption = function()
						arg_322_0:DoTalkTouchOption(iter_322_1, arg_322_1.flags, function(arg_330_0)
							var_322_1.optionIndex = arg_330_0

							var_323_0()
						end)
					end,
					wait = function()
						arg_322_0.LTs = arg_322_0.LTs or {}

						table.insert(arg_322_0.LTs, LeanTween.delayedCall(iter_322_1.time, System.Action(var_323_0)).uniqueId)
					end,
					expression = function()
						arg_322_0:emit(arg_322_0.PLAY_EXPRESSION, iter_322_1)
						var_323_0()
					end
				}, function()
					assert(false, "op type error:", iter_322_1.type)
				end)

				if iter_322_1.skip then
					var_323_0()
				end
			end)
		end
	end

	seriesAsync(var_322_0, function()
		if arg_322_1.callbackData then
			arg_322_0:emit(Dorm3dRoomMediator.TALKING_EVENT_FINISH, arg_322_1.callbackData.name, var_322_1)
		end
	end)
end

function var_0_0.CheckQueue(arg_335_0)
	if arg_335_0.inGuide or arg_335_0.uiState ~= "base" then
		return
	end

	if arg_335_0.room:GetConfigID() == 1 and arg_335_0:CheckGuide() then
		-- block empty
	elseif arg_335_0.room:isPersonalRoom() and arg_335_0:CheckLevelUp() then
		-- block empty
	elseif arg_335_0.apartment and arg_335_0:CheckEnterDeal() then
		-- block empty
	elseif arg_335_0.apartment and arg_335_0:CheckActiveTalk() then
		-- block empty
	elseif arg_335_0.apartment then
		arg_335_0:CheckFavorTrigger()
	end

	arg_335_0.contextData.hasEnterCheck = true
end

function var_0_0.didEnterCheck(arg_336_0)
	local var_336_0

	if arg_336_0.contextData.specialId then
		var_336_0 = arg_336_0.contextData.specialId
		arg_336_0.contextData.specialId = nil

		arg_336_0:DoTalk(var_336_0, function()
			arg_336_0:closeView()
		end)
	elseif not arg_336_0.contextData.hasEnterCheck and arg_336_0.apartment then
		for iter_336_0, iter_336_1 in ipairs(arg_336_0.apartment:getForceEnterTalking(arg_336_0.room:GetConfigID())) do
			var_336_0 = iter_336_1

			arg_336_0:DoTalk(iter_336_1)

			break
		end
	end

	if var_336_0 and pg.dorm3d_dialogue_group[var_336_0].extend_loading > 0 then
		arg_336_0.contextData.hasEnterCheck = true

		pg.SceneAnimMgr.GetInstance():RegisterDormNextCall(function()
			arg_336_0:FinishEnterResume()
		end)
	else
		if arg_336_0.apartment and arg_336_0.contextData.pendingDic[arg_336_0.apartment:GetConfigID()] then
			arg_336_0.contextData.hasEnterCheck = true
		end

		for iter_336_2, iter_336_3 in pairs(arg_336_0.contextData.pendingDic) do
			arg_336_0:SetInPending(arg_336_0.ladyDict[iter_336_2], iter_336_3)
		end

		arg_336_0.contextData.pendingDic = {}

		arg_336_0:FinishEnterResume()
		arg_336_0:CheckQueue()
	end
end

function var_0_0.CheckGuide(arg_339_0)
	if arg_339_0:GetBlackboardValue(arg_339_0.ladyDict[arg_339_0.apartment:GetConfigID()], "inPending") then
		return
	end

	for iter_339_0, iter_339_1 in ipairs({
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
				return arg_339_0:CheckSystemOpen("Furniture")
			end
		},
		{
			name = "DORM3D_GUIDE_07",
			active = function()
				return arg_339_0:CheckSystemOpen("DayNight")
			end
		}
	}) do
		if not pg.NewStoryMgr.GetInstance():IsPlayed(iter_339_1.name) and iter_339_1.active() then
			arg_339_0:SetAllBlackbloardValue("inGuide", true)

			local function var_339_0()
				pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGuide(2, pg.NewStoryMgr.GetInstance():StoryName2StoryId(iter_339_1.name)))
				arg_339_0:SetAllBlackbloardValue("inGuide", false)
			end

			pg.m02:sendNotification(GAME.STORY_UPDATE, {
				storyId = iter_339_1.name
			})
			pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGuide(1, pg.NewStoryMgr.GetInstance():StoryName2StoryId(iter_339_1.name)))
			pg.NewGuideMgr.GetInstance():Play(iter_339_1.name, nil, var_339_0, var_339_0)

			return true
		end
	end

	return false
end

function var_0_0.CheckFavorTrigger(arg_345_0)
	for iter_345_0, iter_345_1 in ipairs({
		{
			triggerId = getDorm3dGameset("drom3d_favir_trigger_onwer")[1],
			active = function()
				local var_346_0 = getProxy(CollectionProxy):getShipGroup(arg_345_0.apartment.configId)

				return tobool(var_346_0)
			end
		},
		{
			triggerId = getDorm3dGameset("drom3d_favir_trigger_propose")[1],
			active = function()
				local var_347_0 = getProxy(CollectionProxy):getShipGroup(arg_345_0.apartment.configId)

				return var_347_0 and var_347_0.married > 0
			end
		}
	}) do
		if arg_345_0.apartment.triggerCountDic[iter_345_1.triggerId] == 0 and iter_345_1.active() then
			arg_345_0:emit(Dorm3dRoomMediator.TRIGGER_FAVOR, arg_345_0.apartment.configId, iter_345_1.triggerId)
		end
	end
end

function var_0_0.CheckEnterDeal(arg_348_0)
	if arg_348_0.contextData.hasEnterCheck then
		return false
	end

	local var_348_0 = arg_348_0.apartment:GetConfigID()
	local var_348_1 = "dorm3d_enter_count_" .. var_348_0
	local var_348_2 = pg.TimeMgr.GetInstance():CurrentSTimeDesc("%Y/%m/%d")

	if PlayerPrefs.GetString("dorm3d_enter_count_day") ~= var_348_2 then
		PlayerPrefs.SetString("dorm3d_enter_count_day", var_348_2)
		PlayerPrefs.SetInt(var_348_1, 1)
	else
		PlayerPrefs.SetInt(var_348_1, PlayerPrefs.GetInt(var_348_1, 0) + 1)
	end

	local var_348_3 = arg_348_0.apartment:getEnterTalking(arg_348_0.room:GetConfigID())

	PlayerPrefs.SetString("DORM3D_DAILY_ENTER", pg.TimeMgr.GetInstance():CurrentSTimeDesc("%Y/%m/%d"))

	if #var_348_3 > 0 then
		arg_348_0:DoTalk(var_348_3[math.random(#var_348_3)])

		return true
	end
end

function var_0_0.CheckActiveTalk(arg_349_0)
	local var_349_0 = arg_349_0.ladyDict[arg_349_0.apartment:GetConfigID()]

	if arg_349_0:GetBlackboardValue(var_349_0, "inPending") then
		return false
	end

	local var_349_1 = arg_349_0.apartment:getZoneTalking(arg_349_0.room:GetConfigID(), var_349_0.ladyBaseZone)

	if #var_349_1 > 0 then
		arg_349_0:DoTalk(var_349_1[1])

		return true
	else
		return false
	end
end

function var_0_0.CheckDistanceTalk(arg_350_0, arg_350_1, arg_350_2)
	local var_350_0 = arg_350_0.ladyDict[arg_350_1].ladyBaseZone
	local var_350_1 = getProxy(ApartmentProxy):getApartment(arg_350_1)

	for iter_350_0, iter_350_1 in ipairs(var_350_1:getDistanceTalking(arg_350_0.room:GetConfigID(), var_350_0)) do
		arg_350_0:DoTalk(iter_350_1)

		return
	end
end

function var_0_0.CheckSystemOpen(arg_351_0, arg_351_1)
	if arg_351_0.room:isPersonalRoom() then
		return switch(arg_351_1, {
			Talk = function()
				local var_352_0 = 1

				return var_352_0 <= arg_351_0.apartment.level, i18n("apartment_level_unenough", var_352_0)
			end,
			Touch = function()
				local var_353_0 = getDorm3dGameset("drom3d_touch_dialogue")[1]

				return var_353_0 <= arg_351_0.apartment.level, i18n("apartment_level_unenough", var_353_0)
			end,
			Gift = function()
				local var_354_0 = getDorm3dGameset("drom3d_gift_dialogue")[1]

				return var_354_0 <= arg_351_0.apartment.level, i18n("apartment_level_unenough", var_354_0)
			end,
			Volleyball = function()
				return false
			end,
			Photo = function()
				local var_356_0 = getDorm3dGameset("drom3d_photograph_unlock")[1]

				return var_356_0 <= arg_351_0.apartment.level, i18n("apartment_level_unenough", var_356_0)
			end,
			Collection = function()
				local var_357_0 = getDorm3dGameset("drom3d_recall_unlock")[1]

				return var_357_0 <= arg_351_0.apartment.level, i18n("apartment_level_unenough", var_357_0)
			end,
			Furniture = function()
				local var_358_0 = getDorm3dGameset("drom3d_furniture_unlock")[1]

				return var_358_0 <= arg_351_0.apartment.level, i18n("apartment_level_unenough", var_358_0)
			end,
			DayNight = function()
				local var_359_0 = getDorm3dGameset("drom3d_time_unlock")[1]

				return var_359_0 <= arg_351_0.apartment.level, i18n("apartment_level_unenough", var_359_0)
			end,
			Accompany = function()
				local var_360_0 = 1

				return var_360_0 <= arg_351_0.apartment.level, i18n("apartment_level_unenough", var_360_0)
			end,
			MiniGame = function()
				local var_361_0 = 1

				if var_361_0 > arg_351_0.apartment.level then
					return false, i18n("apartment_level_unenough", var_361_0)
				elseif #arg_351_0.room:getMiniGames() <= 0 then
					return false, "without minigame config in room:" .. arg_351_0.room.configId
				else
					return true
				end
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
		return switch(arg_351_1, {
			Gift = function()
				return false
			end,
			Volleyball = function()
				return arg_351_0.room:GetConfigID() == 4
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

function var_0_0.CheckLevelUp(arg_373_0)
	if arg_373_0.apartment:canLevelUp() then
		arg_373_0:emit(Dorm3dRoomMediator.FAVOR_LEVEL_UP, arg_373_0.apartment.configId)

		return true
	end

	return false
end

function var_0_0.GetIKHandTF(arg_374_0)
	return arg_374_0.ikHand
end

function var_0_0.CycleIKCameraGroup(arg_375_0)
	local var_375_0 = arg_375_0.ladyDict[arg_375_0.apartment:GetConfigID()]

	assert(arg_375_0:GetBlackboardValue(var_375_0, "inIK"))
	seriesAsync({
		function(arg_376_0)
			pg.IKMgr.GetInstance():ResetActiveIKs()

			local var_376_0 = var_375_0.ikConfig
			local var_376_1 = var_376_0.camera_group
			local var_376_2 = pg.dorm3d_ik_status.get_id_list_by_camera_group[var_376_1]
			local var_376_3 = var_376_2[table.indexof(var_376_2, var_376_0.id) % #var_376_2 + 1]

			arg_375_0:SwitchIKConfig(var_375_0, var_376_3)
			arg_375_0:SetIKState(true)
		end
	})
end

function var_0_0.TempHideUI(arg_377_0, arg_377_1, arg_377_2)
	local var_377_0 = defaultValue(arg_377_0.hideCount, 0)

	arg_377_0.hideCount = var_377_0 + (arg_377_1 and 1 or -1)

	assert(arg_377_0.hideCount >= 0)

	if arg_377_0.hideCount * var_377_0 > 0 then
		return existCall(arg_377_2)
	elseif arg_377_0.hideCount > 0 then
		arg_377_0:SetUI(arg_377_2, "blank")
	else
		arg_377_0:SetUI(arg_377_2, "back")
	end
end

function var_0_0.onBackPressed(arg_378_0)
	if arg_378_0.exited or arg_378_0.retainCount > 0 then
		-- block empty
	elseif isActive(arg_378_0.rtLevelUpWindow) then
		triggerButton(arg_378_0.rtLevelUpWindow:Find("bg"))
	elseif arg_378_0.uiState ~= "base" then
		-- block empty
	else
		arg_378_0:closeView()
	end
end

function var_0_0.willExit(arg_379_0)
	if arg_379_0.downTimer then
		arg_379_0.downTimer:Stop()

		arg_379_0.downTimer = nil
	end

	if arg_379_0.LTs then
		underscore.map(arg_379_0.LTs, function(arg_380_0)
			LeanTween.cancel(arg_380_0)
		end)

		arg_379_0.LTs = nil
	end

	if arg_379_0.sliderLT then
		LeanTween.cancel(arg_379_0.sliderLT)

		arg_379_0.sliderLT = nil
	end

	for iter_379_0, iter_379_1 in pairs(arg_379_0.ladyDict) do
		iter_379_1.wakeUpTalkId = nil
	end

	if arg_379_0.accompanyFavorTimer then
		arg_379_0.accompanyFavorTimer:Stop()

		arg_379_0.accompanyFavorTimer = nil
	end

	if arg_379_0.accompanyPerformanceTimer then
		arg_379_0.accompanyPerformanceTimer:Stop()

		arg_379_0.accompanyPerformanceTimer = nil
	end

	arg_379_0.canTriggerAccompanyPerformance = nil

	var_0_0.super.willExit(arg_379_0)
end

return var_0_0
