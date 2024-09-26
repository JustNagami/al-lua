local var_0_0 = class("Dorm3dShoppingConfirmWindow", import("view.base.BaseUI"))

var_0_0.SELECTED_WIDTH = 52
var_0_0.UNSELECTED_WIDTH = 12
var_0_0.LOOP_DURATION = 5

function var_0_0.getUIName(arg_1_0)
	return "Dorm3dShopWindow"
end

function var_0_0.init(arg_2_0)
	arg_2_0.previewTf = arg_2_0._tf:Find("Window/Preview")
	arg_2_0.bubbleContent = arg_2_0._tf:Find("Window/Bubbles/content")
	arg_2_0.bubbleTpl = arg_2_0._tf:Find("Window/Bubbles/tpl")
	arg_2_0.bubbleList = UIItemList.New(arg_2_0.bubbleContent, arg_2_0.bubbleTpl)
	arg_2_0.scrollSnap = BannerScrollRect4Dorm.New(arg_2_0._tf:Find("Window/banner/mask/content"), arg_2_0._tf:Find("Window/banner/dots"))

	setActive(arg_2_0.bubbleTpl, false)
	switch(arg_2_0.contextData.drop.__cname, {
		Dorm3dGift = function()
			arg_2_0.unlockTips = pg.dorm3d_gift[arg_2_0.contextData.drop.configId].unlock_tips or {}
			arg_2_0.unlockBanners = pg.dorm3d_gift[arg_2_0.contextData.drop.configId].unlock_banners or {}
			arg_2_0.isSP = pg.dorm3d_gift[arg_2_0.contextData.drop.configId].ship_group_id ~= 0
			arg_2_0.addFavor = pg.dorm3d_favor_trigger[pg.dorm3d_gift[arg_2_0.contextData.drop.configId].favor_trigger_id].num

			setActive(arg_2_0._tf:Find("Window/Title/gift"), true)
		end,
		Dorm3dFurniture = function()
			arg_2_0.unlockTips = pg.dorm3d_furniture_template[arg_2_0.contextData.drop.configId].unlock_tips or {}
			arg_2_0.unlockBanners = pg.dorm3d_furniture_template[arg_2_0.contextData.drop.configId].unlock_banners or {}
			arg_2_0.isSP = pg.dorm3d_furniture_template[arg_2_0.contextData.drop.configId].is_exclusive == 1

			setActive(arg_2_0._tf:Find("Window/Title/furniture"), true)
		end
	})
end

function var_0_0.didEnter(arg_5_0)
	onButton(arg_5_0, arg_5_0._tf:Find("Window/Confirm"), function()
		local var_6_0 = arg_5_0.contextData.onYes

		arg_5_0:closeView()
		existCall(var_6_0)
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0._tf:Find("Window/Cancel"), function()
		local var_7_0 = arg_5_0.contextData.onNo

		arg_5_0:closeView()
		existCall(var_7_0)
	end, SFX_CANCEL)
	onButton(arg_5_0, arg_5_0._tf:Find("Mask"), function()
		local var_8_0 = arg_5_0.contextData.onClose

		arg_5_0:closeView()
		existCall(var_8_0)
	end)
	arg_5_0:InitUIList()
	arg_5_0:InitDropIcon()
	arg_5_0:InitBanner()

	local var_5_0

	if arg_5_0.contextData.content.cost == 0 then
		var_5_0 = i18n("dorm3d_purchase_confirm_free", arg_5_0.contextData.content.icon, arg_5_0.contextData.content.cost, arg_5_0.contextData.content.name)
	elseif arg_5_0.contextData.content.off > 0 then
		var_5_0 = i18n("dorm3d_purchase_confirm_discount", arg_5_0.contextData.content.icon, arg_5_0.contextData.content.cost, arg_5_0.contextData.content.old, arg_5_0.contextData.content.name)
	else
		var_5_0 = i18n("dorm3d_purchase_confirm_original", arg_5_0.contextData.content.icon, arg_5_0.contextData.content.cost, arg_5_0.contextData.content.name)
	end

	setText(arg_5_0._tf:Find("Window/Content"), var_5_0)
	setText(arg_5_0._tf:Find("Window/Confirm/Text"), i18n("msgbox_text_confirm"))
	setText(arg_5_0._tf:Find("Window/Cancel/Text"), i18n("msgbox_text_cancel"))
	pg.UIMgr.GetInstance():OverlayPanel(arg_5_0._tf, {
		weight = LayerWeightConst.THIRD_LAYER
	})
end

function var_0_0.InitBanner(arg_9_0)
	for iter_9_0 = 1, #arg_9_0.unlockBanners do
		local var_9_0 = arg_9_0.scrollSnap:AddChild()

		LoadImageSpriteAsync("dorm3dbanner/" .. arg_9_0.unlockBanners[iter_9_0], var_9_0)
	end

	arg_9_0.scrollSnap:SetUp()
end

function var_0_0.InitUIList(arg_10_0)
	arg_10_0.bubbleList:make(function(arg_11_0, arg_11_1, arg_11_2)
		if arg_11_0 == UIItemList.EventInit then
			local var_11_0 = arg_11_1 + 1
			local var_11_1 = arg_10_0.unlockTips[var_11_0]

			LoadImageSpriteAtlasAsync("ui/shoptip_atlas", "icon_" .. var_11_1, arg_11_2:Find("icon/icon"), true)
			setText(arg_11_2:Find("bubble/Text"), i18n("dorm3d_shop_tag" .. var_11_1))
			setActive(arg_11_2:Find("bubble"), false)
			onToggle(arg_10_0, arg_11_2, function(arg_12_0)
				setActive(arg_11_2:Find("icon/select"), arg_12_0)
				setActive(arg_11_2:Find("icon/unselect"), not arg_12_0)
				setActive(arg_11_2:Find("bubble"), arg_12_0)
			end)
		end
	end)
	arg_10_0.bubbleList:align(#arg_10_0.unlockTips)
end

function var_0_0.InitDropIcon(arg_13_0)
	LoadImageSpriteAtlasAsync(arg_13_0.contextData.drop:GetIcon(), "", arg_13_0._tf:Find("Window/Item/Dorm3dIconTpl/icon"), true)
	GetImageSpriteFromAtlasAsync("weaponframes", "dorm3d_" .. ItemRarity.Rarity2Print(arg_13_0.contextData.drop:GetRarity()), arg_13_0._tf:Find("Window/Item/Dorm3dIconTpl"))
	setActive(arg_13_0._tf:Find("Window/Item/sp"), arg_13_0.isSP)
	setText(arg_13_0._tf:Find("Window/Item/sp/Text"), i18n("dorm3d_purchase_confirm_tip"))

	if arg_13_0.addFavor then
		setActive(arg_13_0._tf:Find("Window/Item/gift"), true)
		setText(arg_13_0._tf:Find("Window/Item/gift/Text"), "+" .. arg_13_0.addFavor)
	end
end

function var_0_0.willExit(arg_14_0)
	arg_14_0.scrollSnap:Dispose()

	arg_14_0.scrollSnap = nil

	pg.UIMgr.GetInstance():UnOverlayPanel(arg_14_0._tf)
end

return var_0_0
