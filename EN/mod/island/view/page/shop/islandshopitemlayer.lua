local var_0_0 = class("IslandShopItemLayer", import("view.base.BaseSubView"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)

	arg_1_0.showType = arg_1_4
end

function var_0_0.getUIName(arg_2_0)
	if arg_2_0.showType == IslandConst.COMMODITY_SHOW_ITEM_FULL then
		return "IslandShopItemFullUI"
	else
		return "IslandShopItemHalfUI"
	end
end

function var_0_0.OnLoaded(arg_3_0)
	arg_3_0.topItem = arg_3_0:findTF("item/panel_bg")
	arg_3_0.icon = arg_3_0:findTF("icon", arg_3_0.topItem)
	arg_3_0.name = arg_3_0:findTF("display_panel/name_container/name/Text", arg_3_0.topItem)
	arg_3_0.desc = arg_3_0:findTF("display_panel/desc/Text", arg_3_0.topItem)
	arg_3_0.count = arg_3_0:findTF("count/number_panel/value")
	arg_3_0.leftBtn = arg_3_0:findTF("count/number_panel/left")
	arg_3_0.rightBtn = arg_3_0:findTF("count/number_panel/right")
	arg_3_0.maxBtn = arg_3_0:findTF("count/max")
	arg_3_0.bottomItemList = UIItemList.New(arg_3_0:findTF("got/panel_bg/list"), arg_3_0:findTF("got/panel_bg/list/item"))
	arg_3_0.cancelBtn = arg_3_0:findTF("actions/cancel_button")
	arg_3_0.confirmBtn = arg_3_0:findTF("actions/confirm_button")
	arg_3_0.consumeIcon = arg_3_0:findTF("consumeIcon", arg_3_0.confirmBtn)
	arg_3_0.consumeCount = arg_3_0:findTF("consumeCount", arg_3_0.confirmBtn)

	setText(arg_3_0:findTF("got/panel_bg/got_text"), i18n("shops_msgbox_output"))
	setText(arg_3_0:findTF("count/image_text"), i18n("shops_msgbox_exchange_count"))
	setText(arg_3_0:findTF("actions/cancel_button/label"), i18n("shop_word_cancel"))
	setText(arg_3_0:findTF("actions/confirm_button/label"), i18n("shop_word_exchange"))
end

function var_0_0.OnInit(arg_4_0)
	onButton(arg_4_0, arg_4_0.cancelBtn, function()
		arg_4_0:Close()
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0._tf:Find("bg"), function()
		arg_4_0:Close()
	end, SFX_PANEL)
end

function var_0_0.SetUp(arg_7_0, arg_7_1, arg_7_2)
	GetImageSpriteFromAtlasAsync(arg_7_2:GetIcon(), "", arg_7_0.icon)
	setText(arg_7_0.name, arg_7_2:GetName())
	setText(arg_7_0.desc, arg_7_2:GetDescription())

	local var_7_0 = arg_7_2:GetMaxNum() - arg_7_2.purchasedNum

	if arg_7_2:GetMaxNum() == 0 then
		var_7_0 = 99
	end

	local var_7_1 = arg_7_2:GetItems()
	local var_7_2 = arg_7_2:GetResourceConsume()

	local function var_7_3(arg_8_0)
		arg_8_0 = math.max(arg_8_0, 1)
		arg_8_0 = math.min(arg_8_0, var_7_0)
		arg_7_0.curCount = arg_8_0

		setText(arg_7_0.count, arg_8_0)

		for iter_8_0 = 1, #arg_7_0.itemsCountTFs do
			local var_8_0 = arg_7_0.itemsCountTFs[iter_8_0]

			setText(var_8_0, var_7_1[iter_8_0][3] * arg_7_0.curCount)
		end

		setText(arg_7_0.consumeCount, math.ceil((100 - arg_7_2:GetDiscount()) / 100 * var_7_2[3]) * arg_7_0.curCount)
	end

	onButton(arg_7_0, arg_7_0.leftBtn, function()
		var_7_3(arg_7_0.curCount - 1)
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.rightBtn, function()
		var_7_3(arg_7_0.curCount + 1)
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.maxBtn, function()
		var_7_3(var_7_0)
	end, SFX_PANEL)

	arg_7_0.itemsCountTFs = {}

	arg_7_0.bottomItemList:make(function(arg_12_0, arg_12_1, arg_12_2)
		if arg_12_0 == UIItemList.EventUpdate then
			local var_12_0 = var_7_1[arg_12_1 + 1]
			local var_12_1 = {
				type = var_12_0[1],
				id = var_12_0[2],
				count = var_12_0[3]
			}

			updateDrop(arg_12_2:Find("IslandItemTpl"), var_12_1)
			setText(arg_12_2:Find("name"), pg.island_item_data_template[var_12_0[2]].name)
			table.insert(arg_7_0.itemsCountTFs, arg_12_2:Find("icon_bg/count"))
		end
	end)
	arg_7_0.bottomItemList:align(#var_7_1)
	var_7_3(1)
	GetImageSpriteFromAtlasAsync(Drop.New({
		type = var_7_2[1],
		id = var_7_2[2]
	}):getIcon(), "", arg_7_0.consumeIcon)
	onButton(arg_7_0, arg_7_0.confirmBtn, function()
		arg_7_0:emit(IslandMediator.BUY_COMMODITY, arg_7_1, arg_7_2.id, arg_7_0.curCount)
	end, SFX_PANEL)
end

function var_0_0.Open(arg_14_0, arg_14_1, arg_14_2)
	arg_14_0.opening = true

	pg.UIMgr.GetInstance():BlurPanel(arg_14_0._tf)
	arg_14_0:SetUp(arg_14_1, arg_14_2)
	arg_14_0:Show()
end

function var_0_0.Close(arg_15_0)
	if arg_15_0.opening then
		arg_15_0.opening = false

		pg.UIMgr.GetInstance():UnblurPanel(arg_15_0._tf, arg_15_0._parentTf)
		arg_15_0:Hide()
	end
end

function var_0_0.OnDestroy(arg_16_0)
	return
end

return var_0_0
