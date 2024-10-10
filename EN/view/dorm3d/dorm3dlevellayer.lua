local var_0_0 = class("Dorm3dLevelLayer", import("view.base.BaseUI"))

var_0_0.SERVER_TYPE = 1
var_0_0.CLIENT_TYPE = 2
var_0_0.STORY_TYPE = 3

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
	arg_2_0:InitItemList()
end

function var_0_0.SetApartment(arg_9_0, arg_9_1)
	arg_9_0.apartment = arg_9_1
end

function var_0_0.InitItemList(arg_10_0)
	arg_10_0.rtLevelContainer = arg_10_0.rtLevelPanel:Find("bg/awards/content")
	arg_10_0.levelItemList = UIItemList.New(arg_10_0.rtLevelContainer, arg_10_0.rtLevelContainer:Find("tpl"))

	arg_10_0.levelItemList:make(function(arg_11_0, arg_11_1, arg_11_2)
		local var_11_0 = arg_11_1 + 1
		local var_11_1 = arg_10_0.apartment:getFavorConfig("levelup_item", var_11_0)
		local var_11_2 = arg_10_0.apartment:getFavorConfig("levelup_client_item", var_11_0)
		local var_11_3 = arg_11_2:Find("items")
		local var_11_4 = {}

		for iter_11_0, iter_11_1 in pairs(var_11_1) do
			table.insert(var_11_4, {
				type = var_0_0.SERVER_TYPE,
				data = iter_11_1
			})
		end

		local var_11_5 = false

		for iter_11_2, iter_11_3 in pairs(var_11_2) do
			if iter_11_3[1] == Dorm3dIconHelper.DORM_STORY then
				table.insert(var_11_4, {
					type = var_0_0.STORY_TYPE,
					data = iter_11_3
				})

				var_11_5 = true
			else
				table.insert(var_11_4, {
					type = var_0_0.CLIENT_TYPE,
					data = iter_11_3
				})
			end
		end

		if arg_11_0 == UIItemList.EventInit then
			setActive(arg_11_2:Find("bg/normal"), not var_11_5)
			setActive(arg_11_2:Find("bg/special"), var_11_5)

			local function var_11_6(arg_12_0)
				local var_12_0 = var_11_3:GetChild(arg_12_0 - 1)
				local var_12_1 = var_12_0:Find("item")
				local var_12_2 = var_12_1:Find("Dorm3dIconTpl")

				if arg_12_0 <= #var_11_4 then
					switch(var_11_4[arg_12_0].type, {
						[var_0_0.SERVER_TYPE] = function()
							setActive(var_12_2:Find("count"), true)

							local var_13_0 = Drop.Create(var_11_4[arg_12_0].data)

							updateDorm3dIcon(var_12_2, var_13_0)
							onButton(arg_10_0, var_12_0, function()
								arg_10_0:emit(BaseUI.ON_NEW_DROP, {
									drop = var_13_0
								})
							end, SFX_PANEL)
						end,
						[var_0_0.CLIENT_TYPE] = function()
							setActive(var_12_2:Find("count"), true)
							Dorm3dIconHelper.UpdateDorm3dIcon(var_12_2, var_11_4[arg_12_0].data)

							local var_15_0 = Dorm3dIconHelper.Data2Config(var_11_4[arg_12_0].data)

							onButton(arg_10_0, var_12_0, function()
								arg_10_0:emit(Dorm3dLevelMediator.ON_DROP_CLIENT, {
									data = var_11_4[arg_12_0].data
								})
							end, SFX_PANEL)
						end,
						[var_0_0.STORY_TYPE] = function()
							local var_17_0 = Dorm3dIconHelper.Data2Config(var_11_4[arg_12_0].data)

							setActive(var_12_1:Find("sp"), true)
							setActive(var_12_0:Find("story"), true)
							onButton(arg_10_0, var_12_0, function()
								arg_10_0:emit(Dorm3dLevelMediator.ON_DROP_CLIENT, {
									data = var_11_4[arg_12_0].data
								})
							end, SFX_PANEL)
							Dorm3dIconHelper.UpdateDorm3dIcon(var_12_2, var_11_4[arg_12_0].data)
							setText(var_12_0:Find("story/Text"), i18n("dorm3d_favor_level_story"))
						end
					})
				else
					setActive(var_12_1, false)
					setActive(var_12_0:Find("empty"), true)
				end
			end

			for iter_11_4 = 1, var_11_3.childCount do
				var_11_6(iter_11_4)
			end
		elseif arg_11_0 == UIItemList.EventUpdate then
			local var_11_7 = var_11_0 <= arg_10_0.apartment.level

			setActive(arg_11_2:Find("unlock"), var_11_7)
			setText(arg_11_2:Find("number"), string.format("<color=%s>%02d</color>", var_11_5 and "#FFFFFF" or var_11_7 and "#b6b1b7" or "#827d82", var_11_0))

			if var_11_7 then
				setGray(arg_11_2:Find("items"), true, true)
			end
		end
	end)
end

function var_0_0.didEnter(arg_19_0)
	local var_19_0, var_19_1 = arg_19_0.apartment:getFavor()

	setText(arg_19_0.rtLevelPanel:Find("bg/favor/level"), string.format("Lv.%d : ", arg_19_0.apartment.level))
	setText(arg_19_0.rtLevelPanel:Find("bg/favor/level/Text"), string.format("%d/%d", var_19_0, var_19_1))
	setSlider(arg_19_0.rtLevelPanel:Find("bg/favor/progressBg/progress"), 0, var_19_1, var_19_0)
	arg_19_0.levelItemList:align(getDorm3dGameset("favor_level")[1])

	arg_19_0.rtLevelContainer:GetComponent(typeof(ScrollRect)).horizontalNormalizedPosition = 0

	local var_19_2 = arg_19_0.apartment.level >= getDorm3dGameset("drom3d_time_unlock")[1]

	setImageAlpha(arg_19_0.rtLevelPanel:Find("bg/bottom/btn_time"), not var_19_2 and 0.2 or 1)
	setActive(arg_19_0.rtLevelPanel:Find("bg/bottom/btn_time/lock"), not var_19_2)

	local var_19_3 = arg_19_0.apartment.level >= getDorm3dGameset("drom3d_clothing_unlock")[1]

	setImageAlpha(arg_19_0.rtLevelPanel:Find("bg/bottom/btn_skin/Image"), not var_19_3 and 0.2 or 1)
	setActive(arg_19_0.rtLevelPanel:Find("bg/bottom/btn_skin/lock"), not var_19_3)
end

function var_0_0.ShowTimeSelectWindow(arg_20_0)
	local var_20_0 = arg_20_0.rtTimeSelectWindow:Find("panel")

	setText(var_20_0:Find("title"), i18n("dorm3d_time_choose"))

	for iter_20_0, iter_20_1 in ipairs({
		"day",
		"night"
	}) do
		local var_20_1 = var_20_0:Find("content/" .. iter_20_1)

		setText(var_20_1:Find("now/Text"), i18n("dorm3d_now_time"))
		setActive(var_20_1:Find("now"), iter_20_0 == arg_20_0.contextData.timeIndex)
		onToggle(arg_20_0, var_20_1, function(arg_21_0)
			if arg_21_0 == true then
				arg_20_0.selectTimeIndex = iter_20_0
			end

			quickPlayAnimation(var_20_1, arg_21_0 and "anim_dorm3d_timeselect_click" or "anim_dorm3d_timeselect_unclick")
		end, SFX_PANEL)
	end

	triggerToggle(var_20_0:Find("content"):GetChild(arg_20_0.contextData.timeIndex - 1), true)
	setText(var_20_0:Find("bottom/toggle_lock/Text"), i18n("dorm3d_is_auto_time"))
	onToggle(arg_20_0, var_20_0:Find("bottom/toggle_lock"), function(arg_22_0)
		if arg_22_0 then
			PlayerPrefs.SetInt(ApartmentProxy.GetTimePPName(), 0)
		else
			PlayerPrefs.SetInt(ApartmentProxy.GetTimePPName(), arg_20_0.contextData.timeIndex)
		end

		quickPlayAnimation(var_20_0:Find("bottom/toggle_lock"), arg_22_0 and "anim_dorm3d_timeselect_bottom_on" or "anim_dorm3d_timeselect_bottom_off")
	end, SFX_PANEL)
	triggerToggle(var_20_0:Find("bottom/toggle_lock"), PlayerPrefs.GetInt(ApartmentProxy.GetTimePPName(), 1) == 0)
	onButton(arg_20_0, var_20_0:Find("bottom/btn_confirm"), function()
		warning(arg_20_0.contextData.timeIndex, arg_20_0.selectTimeIndex)
		pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_day_night_switching" .. arg_20_0.selectTimeIndex))

		if arg_20_0.contextData.timeIndex == arg_20_0.selectTimeIndex then
			return
		else
			if PlayerPrefs.GetInt(ApartmentProxy.GetTimePPName(), 1) ~= 0 then
				PlayerPrefs.SetInt(ApartmentProxy.GetTimePPName(), arg_20_0.selectTimeIndex)
			end

			triggerButton(arg_20_0.rtTimeSelectWindow:Find("bg"))
			arg_20_0:emit(Dorm3dLevelMediator.CHAMGE_TIME, arg_20_0.selectTimeIndex)
		end
	end, SFX_CONFIRM)
	setActive(arg_20_0.rtTimeSelectWindow, true)
	pg.UIMgr.GetInstance():OverlayPanel(arg_20_0.rtTimeSelectWindow, {
		weight = LayerWeightConst.SECOND_LAYER,
		groupName = LayerWeightConst.GROUP_DORM3D
	})
end

function var_0_0.ShowSkinSelectWindow(arg_24_0)
	local var_24_0 = arg_24_0.rtSkinSelectWindow:Find("panel")

	setText(var_24_0:Find("title"), i18n("dorm3d_clothing_choose"))
	UIItemList.StaticAlign(var_24_0:Find("content"), var_24_0:Find("content/tpl"), #arg_24_0.apartment.skinList, function(arg_25_0, arg_25_1, arg_25_2)
		arg_25_1 = arg_25_1 + 1

		if arg_25_0 == UIItemList.EventUpdate then
			local var_25_0 = arg_24_0.apartment.skinList[arg_25_1]

			if var_25_0 == 0 then
				var_25_0 = arg_24_0.apartment:getConfig("skin_model")
			end

			GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/apartment_skin_%d", var_25_0), "", arg_25_2:Find("Image"))
			GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/apartment_skin_name_%s", pg.dorm3d_resource[var_25_0].picture), "", arg_25_2:Find("name"))
			setText(arg_25_2:Find("select/now/Text"), i18n("dorm3d_now_clothing"))
			setActive(arg_25_2:Find("select/now"), arg_24_0.apartment:getSkinId() == var_25_0)
			onToggle(arg_24_0, arg_25_2, function(arg_26_0)
				if arg_26_0 == true then
					arg_24_0.selectSkinId = var_25_0
				end
			end, SFX_PANEL)
			triggerToggle(arg_25_2, arg_24_0.apartment:getSkinId() == var_25_0)
		end
	end)
	setText(var_24_0:Find("bottom/btn_confirm/Text"), i18n("word_ok"))
	onButton(arg_24_0, var_24_0:Find("bottom/btn_confirm"), function()
		triggerButton(arg_24_0.rtSkinSelectWindow:Find("bg"))

		if arg_24_0.apartment:getSkinId() ~= arg_24_0.selectSkinId then
			arg_24_0:emit(Dorm3dLevelMediator.CHANGE_SKIN, arg_24_0.apartment.configId, arg_24_0.selectSkinId)
		end
	end, SFX_CONFIRM)
	setActive(arg_24_0.rtSkinSelectWindow, true)
	pg.UIMgr.GetInstance():OverlayPanel(arg_24_0.rtSkinSelectWindow, {
		weight = LayerWeightConst.SECOND_LAYER,
		groupName = LayerWeightConst.GROUP_DORM3D
	})
end

function var_0_0.onBackPressed(arg_28_0)
	if isActive(arg_28_0.rtSkinSelectWindow) then
		triggerButton(arg_28_0.rtSkinSelectWindow:Find("bg"))
	elseif isActive(arg_28_0.rtTimeSelectWindow) then
		triggerButton(arg_28_0.rtTimeSelectWindow:Find("bg"))
	else
		var_0_0.super.onBackPressed(arg_28_0)
	end
end

function var_0_0.willExit(arg_29_0)
	return
end

return var_0_0
