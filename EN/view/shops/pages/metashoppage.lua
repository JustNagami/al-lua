local var_0_0 = class("MetaShopPage", import(".ActivitySelectableShopPage"))

function var_0_0.getUIName(arg_1_0)
	return "MetaShop"
end

function var_0_0.ResId2ItemId(arg_2_0, arg_2_1)
	return arg_2_1
end

function var_0_0.SetResIcon(arg_3_0)
	var_0_0.super.SetResIcon(arg_3_0, DROP_TYPE_ITEM)
end

function var_0_0.UpdateTip(arg_4_0)
	arg_4_0.time.text = i18n("meta_shop_tip")
end

function var_0_0.SetPurchaseConfirmCb(arg_5_0, arg_5_1)
	arg_5_0.purchaseWindow:ExecuteAction("SetConfirmCb", function(arg_6_0, arg_6_1, arg_6_2)
		arg_5_0:emit(NewShopsMediator.ON_META_SHOP, arg_5_0.shop.activityId, 1, arg_6_0, arg_6_2, arg_6_1)
	end)
	arg_5_0.purchaseWindow:ExecuteAction("Hide")
end

function var_0_0.OnUpdatePlayer(arg_7_0)
	return
end

function var_0_0.OnUpdateItems(arg_8_0)
	local var_8_0 = arg_8_0.shop:GetResList()

	for iter_8_0, iter_8_1 in pairs(arg_8_0.resTrList) do
		local var_8_1 = iter_8_1[1]
		local var_8_2 = iter_8_1[2]
		local var_8_3 = iter_8_1[3]
		local var_8_4 = var_8_0[iter_8_0]

		setActive(var_8_1, var_8_4 ~= nil)

		if var_8_4 ~= nil then
			var_8_3.text = (arg_8_0.items[var_8_4] or Item.New({
				count = 0,
				id = var_8_4
			})).count
		end
	end
end

function var_0_0.OnPurchase(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = arg_9_0.shop.activityId

	arg_9_0:emit(NewShopsMediator.ON_META_SHOP, var_9_0, 1, arg_9_1.id, arg_9_2, {
		{
			key = arg_9_1:getConfig("commodity_id"),
			value = arg_9_2
		}
	})
end

function var_0_0.GetPaintingName(arg_10_0)
	local var_10_0, var_10_1, var_10_2 = var_0_0.super.GetPaintingName(arg_10_0)
	local var_10_3

	if type(var_10_0) == "table" then
		var_10_3 = var_10_0[math.random(1, #var_10_0)]
	else
		var_10_3 = var_10_0
	end

	return var_10_3, var_10_1, var_10_2
end

return var_0_0
