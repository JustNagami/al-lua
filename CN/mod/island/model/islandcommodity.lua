local var_0_0 = class("IslandCommodity", import("model.vo.BaseVO"))
local var_0_1 = pg.pay_data_display

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.configId = arg_1_1.id
	arg_1_0.id = arg_1_1.id
	arg_1_0.purchasedNum = arg_1_1.num
end

function var_0_0.bindConfigTable(arg_2_0)
	return pg.island_shop_goods
end

function var_0_0.GetName(arg_3_0)
	return arg_3_0:getConfig("goods_name")
end

function var_0_0.GetDescription(arg_4_0)
	return arg_4_0:getConfig("desc")
end

function var_0_0.GetIcon(arg_5_0)
	return arg_5_0:getConfig("icon")
end

function var_0_0.GetShopIds(arg_6_0)
	return arg_6_0:getConfig("shop_id")
end

function var_0_0.GetResourceConsume(arg_7_0)
	return arg_7_0:getConfig("resource_consume")
end

function var_0_0.GetItems(arg_8_0)
	return arg_8_0:getConfig("items")
end

function var_0_0.GetPayId(arg_9_0)
	return arg_9_0:getConfig("pay_id")
end

function var_0_0.GetMaxNum(arg_10_0)
	return arg_10_0:getConfig("limited_num")
end

function var_0_0.IsShowPurchaseLimit(arg_11_0)
	return arg_11_0:getConfig("limited_show") == 1
end

function var_0_0.IsShowSellOut(arg_12_0)
	return arg_12_0:getConfig("remian_show") == 1
end

function var_0_0.GetDiscount(arg_13_0)
	local var_13_0 = 0

	if pg.TimeMgr.GetInstance():inTime(arg_13_0:getConfig("discount_time")) then
		var_13_0 = arg_13_0:getConfig("discount")
	end

	return var_13_0
end

function var_0_0.GetCommodityShowType(arg_14_0)
	return arg_14_0:getConfig("goods_detail_type")
end

function var_0_0.GetPacketItemsShowTypes(arg_15_0)
	return arg_15_0:getConfig("groups_detail_type")
end

function var_0_0.UpdateNum(arg_16_0, arg_16_1)
	arg_16_0.purchasedNum = arg_16_1
end

function var_0_0.AddNum(arg_17_0, arg_17_1)
	arg_17_0.purchasedNum = arg_17_0.purchasedNum + arg_17_1
end

function var_0_0.GetPayConfig(arg_18_0)
	return var_0_1[arg_18_0:GetPayId()]
end

function var_0_0.IsTimeLimitCommodity(arg_19_0)
	local var_19_0 = arg_19_0:getConfig("time")

	if type(var_19_0) == "table" then
		return true
	end

	return false
end

return var_0_0
