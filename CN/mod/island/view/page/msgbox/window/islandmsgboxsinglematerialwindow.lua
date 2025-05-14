local var_0_0 = class("IslandMsgBoxSingleMaterialWindow", import(".IslandMsgBoxSingleItemWindow"))

function var_0_0.getUIName(arg_1_0)
	return "IslandCommonMsgBoxWithSingleMaterial"
end

function var_0_0.OnLoaded(arg_2_0)
	var_0_0.super.OnLoaded(arg_2_0)

	arg_2_0.valueTxt = arg_2_0:findTF("calc/value/Text"):GetComponent(typeof(Text))
	arg_2_0.addBtn = arg_2_0:findTF("calc/add")
	arg_2_0.reduceBtn = arg_2_0:findTF("calc/reduce")
	arg_2_0.sellBtn = arg_2_0:findTF("calc/sell_btn")
	arg_2_0.priceTxt = arg_2_0:findTF("calc/sell_btn/price/Text"):GetComponent(typeof(Text))

	setText(arg_2_0:findTF("calc/sell_btn/Text"), i18n1("出售"))
end

function var_0_0.OnShow(arg_3_0)
	var_0_0.super.OnShow(arg_3_0)

	local var_3_0 = arg_3_0.settings

	onButton(arg_3_0, arg_3_0.addBtn, function()
		local var_4_0 = arg_3_0.value + 1

		arg_3_0:UpdateValue(var_4_0)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.reduceBtn, function()
		local var_5_0 = arg_3_0.value - 1

		arg_3_0:UpdateValue(var_5_0)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.sellBtn, function()
		local var_6_0 = arg_3_0.item:GetSellingPrice()
		local var_6_1 = var_6_0:getName()
		local var_6_2 = arg_3_0.item:GetName()
		local var_6_3 = arg_3_0.value
		local var_6_4 = var_6_0.count * arg_3_0.value

		arg_3_0:GetMsgBoxMgr():Show({
			content = i18n1(string.format("是否确认出售,%sx%d\n获得%sx%d", var_6_2, var_6_3, var_6_1, var_6_4)),
			onYes = function()
				arg_3_0:emit(IslandMediator.ON_SELL_ITEM, arg_3_0.item.id, arg_3_0.value)
				arg_3_0:Hide()
			end
		})
	end, SFX_PANEL)
	arg_3_0:bind(GAME.ISLAND_SELL_ITEM_DONE, function()
		arg_3_0:FlushCalc(arg_3_0.item.id)
	end)

	local var_3_1 = var_3_0.itemId

	arg_3_0:FlushCalc(var_3_1)
end

function var_0_0.FlushCalc(arg_9_0, arg_9_1)
	arg_9_0.item = getProxy(IslandProxy):GetIsland():GetInventoryAgency():GetItemById(arg_9_1) or IslandItem.New({
		id = arg_9_1
	})
	arg_9_0.value = 1

	arg_9_0:UpdateValue(arg_9_0.value)
end

function var_0_0.UpdateValue(arg_10_0, arg_10_1)
	arg_10_0.value = math.max(1, math.min(arg_10_1, arg_10_0.item:GetCount()))

	local var_10_0 = arg_10_0.item:GetSellingPrice()

	arg_10_0.priceTxt.text = "x" .. var_10_0.count * arg_10_0.value
	arg_10_0.valueTxt.text = arg_10_0.value
end

return var_0_0
