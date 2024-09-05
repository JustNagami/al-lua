local var_0_0 = class("Dorm3dGiftLayer", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "Dorm3dGiftUI"
end

function var_0_0.init(arg_2_0)
	local var_2_0 = arg_2_0._tf:Find("btn_back")

	onButton(arg_2_0, var_2_0, function()
		arg_2_0:closeView()
	end, SFX_CANCEL)

	arg_2_0.rtGiftPanel = arg_2_0._tf:Find("gift_panel")

	for iter_2_0, iter_2_1 in ipairs({
		"all",
		"normal",
		"pro"
	}) do
		onToggle(arg_2_0, arg_2_0.rtGiftPanel:Find("content/toggles/" .. iter_2_1), function(arg_4_0)
			if arg_4_0 then
				if arg_2_0.afterFirst then
					quickPlayAnimation(arg_2_0.rtGiftPanel, "anim_dorm3d_giftui_change")
				else
					arg_2_0.afterFirst = true
				end

				arg_2_0:UpdateSelectToggle(iter_2_1)
			end
		end, SFX_PANEL)
	end

	local var_2_1 = arg_2_0.rtGiftPanel:Find("content/view/container")

	arg_2_0.giftItemList = UIItemList.New(var_2_1, var_2_1:Find("tpl"))

	arg_2_0.giftItemList:make(function(arg_5_0, arg_5_1, arg_5_2)
		arg_5_1 = arg_5_1 + 1

		if arg_5_0 == UIItemList.EventUpdate then
			arg_2_0:UpdateGift(arg_5_2, arg_2_0.filterGiftIds[arg_5_1])
		end
	end)

	arg_2_0.showedGiftRecords = {}

	onScroll(arg_2_0, var_2_1, function(arg_6_0)
		arg_2_0:OnGiftListScroll(arg_6_0)
	end)

	arg_2_0.btnConfirm = arg_2_0.rtGiftPanel:Find("bottom/btn_confirm")

	onButton(arg_2_0, arg_2_0.btnConfirm, function()
		arg_2_0:ConfirmGiveGifts()
	end, SFX_CONFIRM)

	arg_2_0.rtInfoWindow = arg_2_0._tf:Find("info_window")

	onButton(arg_2_0, arg_2_0.rtInfoWindow:Find("bg"), function()
		arg_2_0:HideInfoWindow()
	end, SFX_CANCEL)
	onButton(arg_2_0, arg_2_0.rtInfoWindow:Find("panel/title/btn_close"), function()
		arg_2_0:HideInfoWindow()
	end, SFX_CANCEL)

	arg_2_0.rtLackWindow = arg_2_0._tf:Find("lack_window")

	onButton(arg_2_0, arg_2_0.rtLackWindow:Find("bg"), function()
		arg_2_0:HideLackWindow()
	end, SFX_CANCEL)
	onButton(arg_2_0, arg_2_0.rtLackWindow:Find("panel/title/btn_close"), function()
		arg_2_0:HideLackWindow()
	end, SFX_CANCEL)
	pg.UIMgr.GetInstance():TempOverlayPanelPB(arg_2_0.rtGiftPanel, {
		pbList = {
			arg_2_0.rtGiftPanel
		},
		baseCamera = arg_2_0.contextData.baseCamera,
		groupName = LayerWeightConst.GROUP_DORM3D
	})
end

function var_0_0.SetApartment(arg_12_0, arg_12_1)
	arg_12_0.apartment = arg_12_1
	arg_12_0.giftIds = arg_12_0.apartment:getGiftIds()
	arg_12_0.proxy = getProxy(ApartmentProxy)
end

function var_0_0.didEnter(arg_13_0)
	triggerToggle(arg_13_0.rtGiftPanel:Find("content/toggles/all"), true)
	arg_13_0:UpdateConfirmBtn()
end

function var_0_0.UpdateSelectToggle(arg_14_0, arg_14_1)
	if arg_14_0.toggleState == arg_14_1 then
		return
	end

	arg_14_0.toggleState = arg_14_1
	arg_14_0.filterGiftIds = underscore.filter(arg_14_0.giftIds, function(arg_15_0)
		return arg_14_1 == "all" or arg_14_1 == "normal" == (pg.dorm3d_gift[arg_15_0].ship_group_id == 0)
	end)

	table.sort(arg_14_0.filterGiftIds, CompareFuncs({
		function(arg_16_0)
			return (arg_14_0.proxy:getGiftCount(arg_16_0) > 0 and -1 or 1) * (pg.dorm3d_gift[arg_16_0].ship_group_id == 0 and 1 or 2)
		end,
		function(arg_17_0)
			return pg.dorm3d_gift[arg_17_0].ship_group_id > 0 and arg_14_0.proxy:isGiveGiftDone(arg_17_0) and 1 or 0
		end,
		function(arg_18_0)
			return arg_18_0
		end
	}))
	arg_14_0.giftItemList:align(#arg_14_0.filterGiftIds)
end

function var_0_0.UpdateGift(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
	arg_19_1.name = arg_19_2

	local var_19_0 = arg_19_1:Find("base")
	local var_19_1 = Drop.New({
		type = DROP_TYPE_DORM3D_GIFT,
		id = arg_19_2,
		count = arg_19_0.proxy:getGiftCount(arg_19_2)
	})

	updateDorm3dIcon(var_19_0:Find("Dorm3dIconTpl"), var_19_1)
	setText(var_19_0:Find("info/name"), var_19_1:getName())

	local var_19_2 = var_19_1:getConfig("ship_group_id") ~= 0

	setActive(var_19_0:Find("mark"), var_19_2)
	setActive(var_19_0:Find("bg/normal"), not var_19_2)
	setActive(var_19_0:Find("bg/pro"), var_19_2)
	setText(var_19_0:Find("info/Text"), i18n("dorm3d_gift_owner_num") .. string.format("%d", var_19_1.count))

	local var_19_3 = var_19_0:Find("info/effect")

	setActive(var_19_3:Find("favor"), true)

	local var_19_4 = pg.dorm3d_favor_trigger[var_19_1.cfg.favor_trigger_id].num

	setText(var_19_3:Find("favor/number"), "+" .. var_19_4)
	setActive(var_19_3:Find("story"), var_19_2)
	onButton(arg_19_0, var_19_0:Find("info/btn_info"), function()
		arg_19_0:OpenLackWindow(var_19_1)
	end, SFX_PANEL)

	local var_19_5 = var_19_2 and arg_19_0.proxy:isGiveGiftDone(arg_19_2)
	local var_19_6 = Dorm3dGift.New({
		configId = arg_19_2
	})
	local var_19_7 = var_19_6:GetShopID()
	local var_19_8 = var_19_7 and pg.shop_template[var_19_7]
	local var_19_9 = tobool(var_19_7)

	setActive(var_19_0:Find("info/lack"), var_19_9)
	setActive(var_19_0:Find("info/lack/tip"), var_19_2 and Dorm3dGift.NeedViewTip(arg_19_0.apartment:GetConfigID()))
	onButton(arg_19_0, var_19_0:Find("info/lack"), function()
		local var_21_0 = ""

		if var_19_8.resource_type == 4 or var_19_8.resource_type == 14 then
			var_21_0 = "diamond"
		elseif var_19_8.resource_type == 1 then
			var_21_0 = "gold"
		end

		arg_19_0:emit(Dorm3dGiftMediator.SHOW_SHOPPING_CONFIRM_WINDOW, {
			content = i18n("dorm3d_shop_gift", "<icon name=" .. var_21_0 .. " w=1.1 h=1.1/>", setColorStr("x" .. var_19_8.resource_num, "#169fff"), setColorStr(var_19_1:getConfig("name"), "#169fff")),
			tip = i18n("dorm3d_shop_gift_tip"),
			drop = var_19_6,
			onYes = function()
				arg_19_0:emit(GAME.SHOPPING, {
					silentTip = true,
					count = 1,
					shopId = var_19_7
				})
			end
		})
	end, SFX_PANEL)
	setActive(arg_19_1:Find("mask"), var_19_5)
	setText(arg_19_1:Find("mask/Image/Text"), "is Done")
	onToggle(arg_19_0, arg_19_1, function(arg_23_0)
		if arg_23_0 then
			arg_19_0.selectGiftId = arg_19_2

			arg_19_0:UpdateConfirmBtn()
		elseif arg_19_0.selectGiftId == arg_19_2 then
			arg_19_0.selectGiftId = nil

			arg_19_0:UpdateConfirmBtn()
		end
	end, SFX_PANEL)
	setToggleEnabled(arg_19_1, not var_19_5)
	triggerToggle(arg_19_1, arg_19_3)
end

function var_0_0.SingleUpdateGift(arg_24_0, arg_24_1)
	local var_24_0 = table.indexof(arg_24_0.filterGiftIds, arg_24_1)

	if var_24_0 > 0 then
		arg_24_0:UpdateGift(arg_24_0.giftItemList.container:GetChild(var_24_0 - 1), arg_24_1, true)
	end
end

function var_0_0.OnGiftListScroll(arg_25_0, arg_25_1)
	local var_25_0 = arg_25_0.rtGiftPanel:Find("content/view/container")
	local var_25_1 = GetComponent(var_25_0, typeof(VerticalLayoutGroup))
	local var_25_2 = var_25_0.rect.height
	local var_25_3 = var_25_0:GetChild(0).rect.height + var_25_1.spacing
	local var_25_4 = var_25_0.anchoredPosition.y
	local var_25_5 = var_25_4 + var_25_2
	local var_25_6 = math.floor((var_25_4 - var_25_1.padding.top) / var_25_3)
	local var_25_7 = math.ceil((var_25_5 - var_25_1.padding.top) / var_25_3)

	for iter_25_0 = math.max(1, var_25_6), math.min(#arg_25_0.filterGiftIds, var_25_7) do
		local var_25_8 = arg_25_0.filterGiftIds[iter_25_0]

		if not arg_25_0.showedGiftRecords[var_25_8] then
			arg_25_0.showedGiftRecords[var_25_8] = true

			local var_25_9 = Dorm3dGift.SetViewedFlag(var_25_8)
		end
	end
end

function var_0_0.UpdateConfirmBtn(arg_26_0)
	setButtonEnabled(arg_26_0.btnConfirm, tobool(arg_26_0.selectGiftId))
end

function var_0_0.ConfirmGiveGifts(arg_27_0)
	if arg_27_0.proxy:getGiftCount(arg_27_0.selectGiftId) == 0 then
		if pg.dorm3d_gift[arg_27_0.selectGiftId].ship_group_id > 0 and arg_27_0.proxy:isGiveGiftDone(arg_27_0.selectGiftId) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_shop_gift_already_given"))
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_shop_gift_not_owned"))
		end

		return
	end

	arg_27_0:emit(Dorm3dGiftMediator.GIVE_GIFT, arg_27_0.selectGiftId)
end

function var_0_0.AfterGiveGift(arg_28_0, arg_28_1)
	local var_28_0 = arg_28_1.giftId
	local var_28_1 = table.indexof(arg_28_0.filterGiftIds, var_28_0)

	if var_28_1 > 0 then
		local var_28_2 = arg_28_0.giftItemList.container:GetChild(var_28_1 - 1)

		quickPlayAnimation(var_28_2, "anim_dorm3d_giftui_Select")
	end

	local var_28_3 = pg.dorm3d_gift[var_28_0]
	local var_28_4 = {}

	if var_28_3.reply_dialogue_id ~= 0 and arg_28_0.apartment:checkUnlockConfig(pg.dorm3d_dialogue_group[var_28_3.reply_dialogue_id].unlock) then
		table.insert(var_28_4, function(arg_29_0)
			arg_28_0:emit(Dorm3dGiftMediator.DO_TALK, var_28_3.reply_dialogue_id, arg_29_0)
		end)
	end

	if var_28_3.unlock_dialogue_id > 0 then
		arg_28_0:emit()
		table.insert(var_28_4, function(arg_30_0)
			pg.TipsMgr.GetInstance():ShowTips(string.format("talk %d is unlocked", talkId))
			arg_30_0()
		end)
	end

	seriesAsync(var_28_4, function()
		arg_28_0:CheckLevelUp()
	end)
end

function var_0_0.CheckLevelUp(arg_32_0)
	if arg_32_0.apartment.favor >= arg_32_0.apartment:getNextExp() then
		arg_32_0:emit(Dorm3dSceneMediator.FAVOR_LEVEL_UP, arg_32_0.apartment.configId)
	end
end

function var_0_0.OpenInfoWindow(arg_33_0, arg_33_1)
	local var_33_0 = arg_33_0.rtInfoWindow:Find("panel")

	setText(var_33_0:Find("title/Text"), i18n("words_information"))
	updateDorm3dIcon(var_33_0:Find("middle/Dorm3dIconTpl"), arg_33_1)

	local var_33_1 = arg_33_1:getConfig("ship_group_id") ~= 0

	setActive(var_33_0:Find("middle/Dorm3dIconTpl/mark"), var_33_1)
	setText(var_33_0:Find("middle/Text"), "???")
	onButton(arg_33_0, var_33_0:Find("bottom/btn_buy"), function()
		pg.TipsMgr.GetInstance():ShowTips("without shop config")
	end, SFX_CONFIRM)
	setActive(arg_33_0.rtInfoWindow, true)
	pg.UIMgr.GetInstance():OverlayPanel(arg_33_0.rtInfoWindow, {
		weight = LayerWeightConst.SECOND_LAYER,
		groupName = LayerWeightConst.GROUP_DORM3D
	})
end

function var_0_0.HideInfoWindow(arg_35_0)
	setActive(arg_35_0.rtInfoWindow, false)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_35_0.rtInfoWindow, arg_35_0._tf)
end

function var_0_0.OpenLackWindow(arg_36_0, arg_36_1)
	local var_36_0 = arg_36_0.rtLackWindow:Find("panel")

	setText(var_36_0:Find("title/Text"), i18n("child_msg_title_detail"))
	updateDorm3dIcon(var_36_0:Find("middle/Dorm3dIconTpl"), arg_36_1)

	local var_36_1 = arg_36_1:getConfig("ship_group_id") ~= 0

	setActive(var_36_0:Find("middle/Dorm3dIconTpl/mark"), var_36_1)
	setText(var_36_0:Find("middle/info/name"), arg_36_1:getName())
	setText(var_36_0:Find("middle/info/count"), string.format("count:<color=#39bfff>%d</color>", arg_36_1.count))
	setText(var_36_0:Find("middle/info/desc"), arg_36_1:getConfig("display"))
	setText(var_36_0:Find("line/lack/Text"), "lack")

	local var_36_2 = ItemTipPanel.GetDropLackConfig(arg_36_1)
	local var_36_3 = var_36_2 and var_36_2.description or {}
	local var_36_4 = var_36_0:Find("bottom/container")

	UIItemList.StaticAlign(var_36_4, var_36_4:Find("tpl"), #var_36_3, function(arg_37_0, arg_37_1, arg_37_2)
		arg_37_1 = arg_37_1 + 1

		if arg_37_0 == UIItemList.EventUpdate then
			local var_37_0 = var_36_3[arg_37_1]
			local var_37_1, var_37_2, var_37_3 = unpack(var_37_0)

			setText(arg_37_2:Find("Text"), var_37_1)
			setText(arg_37_2:Find("btn_go/Text"), i18n("feast_res_window_go_label"))

			local var_37_4, var_37_5, var_37_6 = unpack(var_36_2)
			local var_37_7, var_37_8 = unpack(var_37_5)
			local var_37_9 = #var_37_7 > 0

			if var_37_6 and var_37_6 ~= 0 then
				var_37_9 = var_37_9 and getProxy(ActivityProxy):IsActivityNotEnd(var_37_6)
			end

			setActive(arg_37_2:Find("btn_go"), var_37_9)
			onButton(arg_36_0, arg_37_2:Find("btn_go"), function()
				ItemTipPanel.ConfigGoScene(var_37_7, var_37_8, function()
					arg_36_0:closeView()
				end)
			end, SFX_PANEL)
		end
	end)
	setActive(arg_36_0.rtLackWindow, true)
	pg.UIMgr.GetInstance():OverlayPanel(arg_36_0.rtLackWindow, {
		weight = LayerWeightConst.SECOND_LAYER,
		groupName = LayerWeightConst.GROUP_DORM3D
	})
end

function var_0_0.HideLackWindow(arg_40_0)
	setActive(arg_40_0.rtLackWindow, false)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_40_0.rtLackWindow, arg_40_0._tf)
end

function var_0_0.onBackPressed(arg_41_0)
	if isActive(arg_41_0.rtInfoWindow) then
		arg_41_0:HideInfoWindow()

		return
	end

	if isActive(arg_41_0.rtLackWindow) then
		arg_41_0:HideLackWindow()

		return
	end

	var_0_0.super.onBackPressed(arg_41_0)
end

function var_0_0.willExit(arg_42_0)
	if isActive(arg_42_0.rtInfoWindow) then
		arg_42_0:HideInfoWindow()
	end

	if isActive(arg_42_0.rtLackWindow) then
		arg_42_0:HideLackWindow()
	end

	pg.UIMgr.GetInstance():TempUnblurPanel(arg_42_0.rtGiftPanel, arg_42_0._tf)
end

return var_0_0
