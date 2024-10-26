local var_0_0 = class("Dorm3dLevelLayer", import("view.base.BaseUI"))

var_0_0.SERVER_TYPE = 1
var_0_0.CLIENT_TYPE = 2
var_0_0.STORY_TYPE = 3
var_0_0.NAME_MIN_SIZE = 4
var_0_0.NAME_SHORT_SIZE = 8
var_0_0.NAME_LONG_SIZE = 14
var_0_0.PLAYERPREFS_KEY = "Dorm3dLayer.playerprefs"

function var_0_0.getUIName(arg_1_0)
	return "Dorm3dLevelUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.rtLevelPanel = arg_2_0._tf:Find("panel")

	onButton(arg_2_0, arg_2_0._tf:Find("btn_back"), function()
		arg_2_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_2_0, arg_2_0._tf:Find("bg"), function()
		arg_2_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_2_0, arg_2_0.rtLevelPanel:Find("bg/bottom/btn_time"), function()
		local var_5_0 = getDorm3dGameset("drom3d_time_unlock")[1]

		if var_5_0 > arg_2_0.apartment.level then
			pg.TipsMgr.GetInstance():ShowTips(i18n("apartment_level_unenough", var_5_0))

			return
		end

		arg_2_0:ShowTimeSelectWindow()
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.rtLevelPanel:Find("bg/bottom/btn_skin"), function()
		local var_6_0 = getDorm3dGameset("drom3d_clothing_unlock")[1]

		if var_6_0 > arg_2_0.apartment.level then
			pg.TipsMgr.GetInstance():ShowTips(i18n("apartment_level_unenough", var_6_0))

			return
		end

		arg_2_0:ShowSkinSelectWindow()
	end, SFX_PANEL)
	setActive(arg_2_0.rtLevelPanel:Find("bg/bottom/btn_skin"), false)

	arg_2_0.rtTimeSelectWindow = arg_2_0._tf:Find("TimeSelectWindow")

	onButton(arg_2_0, arg_2_0.rtTimeSelectWindow:Find("bg"), function()
		setActive(arg_2_0.rtTimeSelectWindow, false)
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_2_0.rtTimeSelectWindow, arg_2_0._tf)
	end, SFX_CANCEL)

	arg_2_0.rtSkinSelectWindow = arg_2_0._tf:Find("SkinSelectWindow")

	onButton(arg_2_0, arg_2_0.rtSkinSelectWindow:Find("bg"), function()
		setActive(arg_2_0.rtSkinSelectWindow, false)
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_2_0.rtSkinSelectWindow, arg_2_0._tf)
	end, SFX_CANCEL)

	arg_2_0.rtRenameWindow = arg_2_0._tf:Find("RenameWindow")

	onButton(arg_2_0, arg_2_0.rtLevelPanel:Find("bg/left/rot"), function()
		arg_2_0:ShowRenameWindow()
	end, SFX_PANEL)

	arg_2_0.callInput = arg_2_0.rtRenameWindow:Find("panel/input/nickname")

	onButton(arg_2_0, arg_2_0.rtRenameWindow:Find("panel/confirm"), function()
		local var_10_0 = getInputText(arg_2_0.callInput)

		if var_10_0 == "" then
			return
		end

		if not nameValidityCheck(var_10_0, var_0_0.NAME_MIN_SIZE, var_0_0.NAME_LONG_SIZE, {
			"spece_illegal_tip",
			"dorm3d_appellation_waring3",
			"dorm3d_appellation_waring2",
			"dorm3d_appellation_waring1"
		}) then
			setInputText(arg_2_0.callInput, arg_2_0.apartment:GetCallName())

			return
		end

		if var_10_0 == arg_2_0.apartment:GetCallName() then
			return
		end

		if arg_2_0.apartment:GetSetCallCd() > 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_appellation_waring4"))

			return
		end

		if arg_2_0.renameReset then
			arg_2_0:emit(Dorm3dLevelMediator.RENAME_RESET, arg_2_0.apartment.configId)
		else
			arg_2_0:emit(Dorm3dLevelMediator.RENAME, arg_2_0.apartment.configId, var_10_0)
		end
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.rtRenameWindow:Find("panel/cancel"), function()
		arg_2_0:CloseRenameWindow()
	end, SFX_CANCEL)
	onButton(arg_2_0, arg_2_0.rtRenameWindow:Find("panel/reset"), function()
		setInputText(arg_2_0.callInput, pg.dorm3d_dorm_template[arg_2_0.apartment.configId].default_appellation)

		arg_2_0.renameReset = true
	end)

	arg_2_0.nameShort = arg_2_0.rtLevelPanel:Find("bg/left/rot/short")
	arg_2_0.nameLong = arg_2_0.rtLevelPanel:Find("bg/left/rot/long")
	arg_2_0.blurPanel = arg_2_0._tf:Find("blur")

	arg_2_0.callInput:GetComponent(typeof(InputField)).onValueChanged:AddListener(function()
		arg_2_0.renameReset = false
	end)
	setActive(arg_2_0.rtLevelPanel:Find("bg/left/rot"), PLATFORM_CODE == PLATFORM_CH)
	arg_2_0:InitItemList()
end

function var_0_0.SetApartment(arg_14_0, arg_14_1)
	arg_14_0.apartment = arg_14_1
end

function var_0_0.InitItemList(arg_15_0)
	arg_15_0.rtLevelContainer = arg_15_0.rtLevelPanel:Find("bg/awards/content")
	arg_15_0.levelItemList = UIItemList.New(arg_15_0.rtLevelContainer, arg_15_0.rtLevelContainer:Find("tpl"))

	arg_15_0.levelItemList:make(function(arg_16_0, arg_16_1, arg_16_2)
		local var_16_0 = arg_16_1 + 1
		local var_16_1 = arg_15_0.apartment:getFavorConfig("levelup_item", var_16_0)
		local var_16_2 = arg_15_0.apartment:getFavorConfig("levelup_client_item", var_16_0)
		local var_16_3 = arg_16_2:Find("items")
		local var_16_4 = {}

		for iter_16_0, iter_16_1 in pairs(var_16_1) do
			table.insert(var_16_4, {
				type = var_0_0.SERVER_TYPE,
				data = iter_16_1
			})
		end

		local var_16_5 = false

		for iter_16_2, iter_16_3 in pairs(var_16_2) do
			if iter_16_3[1] == Dorm3dIconHelper.DORM_STORY then
				table.insert(var_16_4, {
					type = var_0_0.STORY_TYPE,
					data = iter_16_3
				})

				var_16_5 = true
			else
				table.insert(var_16_4, {
					type = var_0_0.CLIENT_TYPE,
					data = iter_16_3
				})
			end
		end

		if arg_16_0 == UIItemList.EventInit then
			setActive(arg_16_2:Find("bg/normal"), not var_16_5)
			setActive(arg_16_2:Find("bg/special"), var_16_5)

			local function var_16_6(arg_17_0)
				local var_17_0 = var_16_3:GetChild(arg_17_0 - 1)
				local var_17_1 = var_17_0:Find("item")
				local var_17_2 = var_17_1:Find("Dorm3dIconTpl")

				if arg_17_0 <= #var_16_4 then
					switch(var_16_4[arg_17_0].type, {
						[var_0_0.SERVER_TYPE] = function()
							setActive(var_17_2:Find("count"), true)

							local var_18_0 = Drop.Create(var_16_4[arg_17_0].data)

							updateDorm3dIcon(var_17_2, var_18_0)
							onButton(arg_15_0, var_17_0, function()
								arg_15_0:emit(BaseUI.ON_NEW_DROP, {
									drop = var_18_0
								})
							end, SFX_PANEL)
						end,
						[var_0_0.CLIENT_TYPE] = function()
							setActive(var_17_2:Find("count"), true)
							Dorm3dIconHelper.UpdateDorm3dIcon(var_17_2, var_16_4[arg_17_0].data)

							local var_20_0 = Dorm3dIconHelper.Data2Config(var_16_4[arg_17_0].data)

							onButton(arg_15_0, var_17_0, function()
								arg_15_0:emit(Dorm3dLevelMediator.ON_DROP_CLIENT, {
									data = var_16_4[arg_17_0].data
								})
							end, SFX_PANEL)
						end,
						[var_0_0.STORY_TYPE] = function()
							local var_22_0 = Dorm3dIconHelper.Data2Config(var_16_4[arg_17_0].data)

							setActive(var_17_1:Find("sp"), true)
							setActive(var_17_0:Find("story"), true)
							onButton(arg_15_0, var_17_0, function()
								arg_15_0:emit(Dorm3dLevelMediator.ON_DROP_CLIENT, {
									data = var_16_4[arg_17_0].data
								})
							end, SFX_PANEL)
							Dorm3dIconHelper.UpdateDorm3dIcon(var_17_2, var_16_4[arg_17_0].data)
							setText(var_17_0:Find("story/Text"), i18n("dorm3d_favor_level_story"))
						end
					})
				else
					setActive(var_17_1, false)
					setActive(var_17_0:Find("empty"), true)
				end
			end

			for iter_16_4 = 1, var_16_3.childCount do
				var_16_6(iter_16_4)
			end
		elseif arg_16_0 == UIItemList.EventUpdate then
			local var_16_7 = var_16_0 <= arg_15_0.apartment.level

			setActive(arg_16_2:Find("unlock"), var_16_7)
			setText(arg_16_2:Find("number"), string.format("<color=%s>%02d</color>", var_16_5 and "#FFFFFF" or var_16_7 and "#b6b1b7" or "#827d82", var_16_0))

			if var_16_7 then
				setGray(arg_16_2:Find("items"), true, true)
			end
		end
	end)
end

function var_0_0.didEnter(arg_24_0)
	local var_24_0, var_24_1 = arg_24_0.apartment:getFavor()

	setText(arg_24_0.rtLevelPanel:Find("bg/favor/level"), string.format("Lv.%d : ", arg_24_0.apartment.level))
	setText(arg_24_0.rtLevelPanel:Find("bg/favor/level/Text"), string.format("%d/%d", var_24_0, var_24_1))
	setSlider(arg_24_0.rtLevelPanel:Find("bg/favor/progressBg/progress"), 0, var_24_1, var_24_0)
	arg_24_0.levelItemList:align(getDorm3dGameset("favor_level")[1])

	arg_24_0.rtLevelContainer:GetComponent(typeof(ScrollRect)).horizontalNormalizedPosition = 0

	local var_24_2 = arg_24_0.apartment.level >= getDorm3dGameset("drom3d_time_unlock")[1]

	setImageAlpha(arg_24_0.rtLevelPanel:Find("bg/bottom/btn_time"), not var_24_2 and 0.2 or 1)
	setActive(arg_24_0.rtLevelPanel:Find("bg/bottom/btn_time/lock"), not var_24_2)

	local var_24_3 = arg_24_0.apartment.level >= getDorm3dGameset("drom3d_clothing_unlock")[1]

	setImageAlpha(arg_24_0.rtLevelPanel:Find("bg/bottom/btn_skin/Image"), not var_24_3 and 0.2 or 1)
	setActive(arg_24_0.rtLevelPanel:Find("bg/bottom/btn_skin/lock"), not var_24_3)
	setText(arg_24_0.rtLevelPanel:Find("bg/left/rot/Text"), i18n("dorm3d_appellation_title"))
	setText(arg_24_0.rtRenameWindow:Find("panel/cancel/Text"), i18n("word_cancel"))
	setText(arg_24_0.rtRenameWindow:Find("panel/confirm/Text"), i18n("word_ok"))
	arg_24_0:UpdateName()
	arg_24_0:UpdateRed()
end

function var_0_0.IsShowRed()
	return PlayerPrefs.GetInt(var_0_0.PLAYERPREFS_KEY, 0) == 0
end

function var_0_0.UpdateRed(arg_26_0)
	setActive(arg_26_0.rtLevelPanel:Find("bg/left/rot/red"), var_0_0.IsShowRed())
	arg_26_0:emit(Dorm3dLevelMediator.UPDATE_FAVOR_DISPLAY)
end

function var_0_0.UpdateName(arg_27_0)
	local var_27_0 = arg_27_0.apartment:GetCallName()
	local var_27_1, var_27_2 = utf8_to_unicode(var_27_0)
	local var_27_3 = var_27_2 <= var_0_0.NAME_SHORT_SIZE

	setActive(arg_27_0.nameShort, var_27_3)
	setActive(arg_27_0.nameLong, not var_27_3)
	setText(var_27_3 and arg_27_0.nameShort:Find("Text") or arg_27_0.nameLong:Find("Text"), var_27_0)
end

function var_0_0.ShowRenameWindow(arg_28_0)
	setActive(arg_28_0._tf:Find("bg"), false)
	setActive(arg_28_0._tf:Find("btn_back"), false)
	setActive(arg_28_0.rtLevelPanel, false)
	setActive(arg_28_0.rtRenameWindow, true)
	setActive(arg_28_0.blurPanel, true)
	pg.UIMgr.GetInstance():OverlayPanelPB(arg_28_0.blurPanel, {
		pbList = {
			arg_28_0.blurPanel
		},
		groupName = LayerWeightConst.GROUP_DORM3D,
		weight = arg_28_0:getWeightFromData() + 1
	})
	pg.UIMgr.GetInstance():OverlayPanel(arg_28_0.rtRenameWindow, {
		groupName = LayerWeightConst.GROUP_DORM3D,
		weight = arg_28_0:getWeightFromData() + 1
	})
	setInputText(arg_28_0.callInput, arg_28_0.apartment:GetCallName())

	local var_28_0 = arg_28_0.apartment:GetSetCallCd()
	local var_28_1

	if var_28_0 > 3600 then
		var_28_1 = math.floor(var_28_0 / 3600) .. i18n("word_hour")
	elseif var_28_0 > 60 then
		var_28_1 = math.floor(var_28_0 / 60) .. i18n("word_minute")
	else
		var_28_1 = var_28_0 .. i18n("word_second")
	end

	setText(arg_28_0.rtRenameWindow:Find("panel/time"), var_28_0 == 0 and i18n("dorm3d_appellation_interval") or i18n("dorm3d_appellation_cd", var_28_1))
	PlayerPrefs.SetInt(var_0_0.PLAYERPREFS_KEY, 1)
	arg_28_0:UpdateRed()
end

function var_0_0.CloseRenameWindow(arg_29_0)
	setActive(arg_29_0._tf:Find("bg"), true)
	setActive(arg_29_0._tf:Find("btn_back"), true)
	setActive(arg_29_0.rtLevelPanel, true)
	setActive(arg_29_0.rtRenameWindow, false)
	setActive(arg_29_0.blurPanel, false)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_29_0.blurPanel, arg_29_0._tf)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_29_0.rtRenameWindow, arg_29_0._tf)
	arg_29_0:UpdateName()
end

function var_0_0.ShowTimeSelectWindow(arg_30_0)
	local var_30_0 = arg_30_0.rtTimeSelectWindow:Find("panel")

	setText(var_30_0:Find("title"), i18n("dorm3d_time_choose"))

	for iter_30_0, iter_30_1 in ipairs({
		"day",
		"night"
	}) do
		local var_30_1 = var_30_0:Find("content/" .. iter_30_1)

		setText(var_30_1:Find("now/Text"), i18n("dorm3d_now_time"))
		setActive(var_30_1:Find("now"), iter_30_0 == arg_30_0.contextData.timeIndex)
		onToggle(arg_30_0, var_30_1, function(arg_31_0)
			if arg_31_0 == true then
				arg_30_0.selectTimeIndex = iter_30_0
			end

			quickPlayAnimation(var_30_1, arg_31_0 and "anim_dorm3d_timeselect_click" or "anim_dorm3d_timeselect_unclick")
		end, SFX_PANEL)
	end

	triggerToggle(var_30_0:Find("content"):GetChild(arg_30_0.contextData.timeIndex - 1), true)
	setText(var_30_0:Find("bottom/toggle_lock/Text"), i18n("dorm3d_is_auto_time"))
	onToggle(arg_30_0, var_30_0:Find("bottom/toggle_lock"), function(arg_32_0)
		if arg_32_0 then
			PlayerPrefs.SetInt(ApartmentProxy.GetTimePPName(), 0)
		else
			PlayerPrefs.SetInt(ApartmentProxy.GetTimePPName(), arg_30_0.contextData.timeIndex)
		end

		quickPlayAnimation(var_30_0:Find("bottom/toggle_lock"), arg_32_0 and "anim_dorm3d_timeselect_bottom_on" or "anim_dorm3d_timeselect_bottom_off")
	end, SFX_PANEL)
	triggerToggle(var_30_0:Find("bottom/toggle_lock"), PlayerPrefs.GetInt(ApartmentProxy.GetTimePPName(), 1) == 0)
	onButton(arg_30_0, var_30_0:Find("bottom/btn_confirm"), function()
		warning(arg_30_0.contextData.timeIndex, arg_30_0.selectTimeIndex)
		pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_day_night_switching" .. arg_30_0.selectTimeIndex))

		if arg_30_0.contextData.timeIndex == arg_30_0.selectTimeIndex then
			return
		else
			if PlayerPrefs.GetInt(ApartmentProxy.GetTimePPName(), 1) ~= 0 then
				PlayerPrefs.SetInt(ApartmentProxy.GetTimePPName(), arg_30_0.selectTimeIndex)
			end

			triggerButton(arg_30_0.rtTimeSelectWindow:Find("bg"))
			arg_30_0:emit(Dorm3dLevelMediator.CHAMGE_TIME, arg_30_0.selectTimeIndex)
		end
	end, SFX_CONFIRM)
	setActive(arg_30_0.rtTimeSelectWindow, true)
	pg.UIMgr.GetInstance():OverlayPanel(arg_30_0.rtTimeSelectWindow, {
		weight = LayerWeightConst.SECOND_LAYER,
		groupName = LayerWeightConst.GROUP_DORM3D
	})
end

function var_0_0.ShowSkinSelectWindow(arg_34_0)
	local var_34_0 = arg_34_0.rtSkinSelectWindow:Find("panel")

	setText(var_34_0:Find("title"), i18n("dorm3d_clothing_choose"))
	UIItemList.StaticAlign(var_34_0:Find("content"), var_34_0:Find("content/tpl"), #arg_34_0.apartment.skinList, function(arg_35_0, arg_35_1, arg_35_2)
		arg_35_1 = arg_35_1 + 1

		if arg_35_0 == UIItemList.EventUpdate then
			local var_35_0 = arg_34_0.apartment.skinList[arg_35_1]

			if var_35_0 == 0 then
				var_35_0 = arg_34_0.apartment:getConfig("skin_model")
			end

			GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/apartment_skin_%d", var_35_0), "", arg_35_2:Find("Image"))
			GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/apartment_skin_name_%s", pg.dorm3d_resource[var_35_0].picture), "", arg_35_2:Find("name"))
			setText(arg_35_2:Find("select/now/Text"), i18n("dorm3d_now_clothing"))
			setActive(arg_35_2:Find("select/now"), arg_34_0.apartment:getSkinId() == var_35_0)
			onToggle(arg_34_0, arg_35_2, function(arg_36_0)
				if arg_36_0 == true then
					arg_34_0.selectSkinId = var_35_0
				end
			end, SFX_PANEL)
			triggerToggle(arg_35_2, arg_34_0.apartment:getSkinId() == var_35_0)
		end
	end)
	setText(var_34_0:Find("bottom/btn_confirm/Text"), i18n("word_ok"))
	onButton(arg_34_0, var_34_0:Find("bottom/btn_confirm"), function()
		triggerButton(arg_34_0.rtSkinSelectWindow:Find("bg"))

		if arg_34_0.apartment:getSkinId() ~= arg_34_0.selectSkinId then
			arg_34_0:emit(Dorm3dLevelMediator.CHANGE_SKIN, arg_34_0.apartment.configId, arg_34_0.selectSkinId)
		end
	end, SFX_CONFIRM)
	setActive(arg_34_0.rtSkinSelectWindow, true)
	pg.UIMgr.GetInstance():OverlayPanel(arg_34_0.rtSkinSelectWindow, {
		weight = LayerWeightConst.SECOND_LAYER,
		groupName = LayerWeightConst.GROUP_DORM3D
	})
end

function var_0_0.onBackPressed(arg_38_0)
	if isActive(arg_38_0.rtSkinSelectWindow) then
		triggerButton(arg_38_0.rtSkinSelectWindow:Find("bg"))
	elseif isActive(arg_38_0.rtTimeSelectWindow) then
		triggerButton(arg_38_0.rtTimeSelectWindow:Find("bg"))
	elseif isActive(arg_38_0.rtRenameWindow) then
		triggerButton(arg_38_0.rtRenameWindow:Find("panel/cancel"))
	else
		var_0_0.super.onBackPressed(arg_38_0)
	end
end

function var_0_0.willExit(arg_39_0)
	return
end

return var_0_0
