local var_0_0 = class("IslandShopp", import("model.vo.BaseVO"))
local var_0_1 = pg.island_shop_banner
local var_0_2 = pg.island_shop_normal_template
local var_0_3 = pg.island_shop_goods

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.configId = arg_1_1.id
	arg_1_0.id = arg_1_1.id
	arg_1_0.island = arg_1_2

	arg_1_0:UpdateData(arg_1_1)
end

function var_0_0.bindConfigTable(arg_2_0)
	return pg.island_shop_template
end

function var_0_0.GetTagType(arg_3_0)
	return arg_3_0:getConfig("tag_type")
end

function var_0_0.GetShopIcon(arg_4_0)
	return arg_4_0:getConfig("shop_icon")
end

function var_0_0.GetTagIcon(arg_5_0)
	return arg_5_0:getConfig("tag_icon")
end

function var_0_0.GetFirstShopId(arg_6_0)
	return arg_6_0:getConfig("first_shop")
end

function var_0_0.GetSecondShopId(arg_7_0)
	return arg_7_0:getConfig("second_shop")
end

function var_0_0.GetShowType(arg_8_0)
	return arg_8_0:getConfig("show_type")
end

function var_0_0.GetTopResources(arg_9_0)
	return arg_9_0:getConfig("top_resource")
end

function var_0_0.GetCameraSet(arg_10_0)
	return arg_10_0:getConfig("camera_set")
end

function var_0_0.GetOrder(arg_11_0)
	return arg_11_0:getConfig("order")
end

function var_0_0.GetGoodIds(arg_12_0)
	return arg_12_0:getConfig("goods_id")
end

function var_0_0.IsNormalShop(arg_13_0)
	return arg_13_0:getConfig("shop_type") == 1
end

function var_0_0.IsTemporaryShop(arg_14_0)
	return arg_14_0:getConfig("shop_type") == 2
end

function var_0_0.GetExistTime(arg_15_0)
	if arg_15_0:IsNormalShop() then
		return var_0_2[arg_15_0.id].exist_time
	end

	return nil
end

function var_0_0.GetPlayerRefreshResource(arg_16_0)
	local var_16_0 = var_0_2[arg_16_0.id].refresh_player

	if type(var_16_0) == "table" then
		return var_16_0
	end

	return nil
end

function var_0_0.GetMaxRefreshCount(arg_17_0)
	if arg_17_0:IsNormalShop() then
		return var_0_2[arg_17_0.id].refresh_set
	end

	return 0
end

function var_0_0.GetFirstRefreshFree(arg_18_0)
	return var_0_2[arg_18_0.id].refresh_free == 1
end

function var_0_0.UpdateData(arg_19_0, arg_19_1)
	arg_19_0.existTime = arg_19_1.exist_time
	arg_19_0.refreshTime = arg_19_1.refresh_time
	arg_19_0.refreshCount = arg_19_1.refresh_count

	arg_19_0:SetCommodities(arg_19_1.goods_list)
	arg_19_0:SortCommodities()
end

function var_0_0.SetCommodities(arg_20_0, arg_20_1)
	arg_20_0.commodities = {}
	arg_20_0.commodityIds = {}

	if arg_20_0:IsTemporaryShop() then
		for iter_20_0, iter_20_1 in ipairs(arg_20_1) do
			local var_20_0 = IslandCommodity.New(iter_20_1)

			table.insert(arg_20_0.commodities, var_20_0)
			table.insert(arg_20_0.commodityIds, iter_20_1.id)
		end
	else
		for iter_20_2, iter_20_3 in ipairs(arg_20_0:GetGoodIds()) do
			if arg_20_0:ShouldShowCommodity(iter_20_3) then
				local var_20_1 = IslandCommodity.New({
					num = 0,
					id = iter_20_3
				})

				table.insert(arg_20_0.commodities, var_20_1)
				table.insert(arg_20_0.commodityIds, iter_20_3)
			end
		end

		for iter_20_4, iter_20_5 in ipairs(arg_20_1) do
			local var_20_2 = arg_20_0:GetCommodityById(iter_20_5.id)

			if var_20_2 then
				var_20_2:UpdateNum(iter_20_5.count)

				if var_20_2:GetMaxNum() ~= 0 and var_20_2.purchasedNum == var_20_2:GetMaxNum() and not var_20_2:IsShowSellOut() then
					table.remove(arg_20_0.commodities, var_20_2)
					table.remove(arg_20_0.commodityIds, var_20_2.id)
				end
			end
		end
	end
end

function var_0_0.ShouldShowCommodity(arg_21_0, arg_21_1)
	local var_21_0 = arg_21_0.island:GetAblityAgency()
	local var_21_1 = var_0_3[arg_21_1].unlock
	local var_21_2 = true

	if type(var_21_1) == "table" and #var_21_1 > 0 then
		for iter_21_0, iter_21_1 in ipairs(var_21_1) do
			if not var_21_0:HasAbility(iter_21_1) then
				var_21_2 = false

				break
			end
		end
	end

	local var_21_3 = pg.TimeMgr.GetInstance():inTime(var_0_3[arg_21_1].time)

	return var_21_2 and var_21_3
end

function var_0_0.SortCommodities(arg_22_0)
	local var_22_0 = {}

	for iter_22_0, iter_22_1 in ipairs(arg_22_0:GetGoodIds()) do
		local var_22_1 = arg_22_0:GetCommodityById(iter_22_1)

		if var_22_1 then
			table.insert(var_22_0, var_22_1)
		end
	end

	arg_22_0.commodities = var_22_0
end

function var_0_0.GetCommodities(arg_23_0)
	return arg_23_0.commodities
end

function var_0_0.GetCommodityById(arg_24_0, arg_24_1)
	if not table.contains(arg_24_0.commodityIds, arg_24_1) then
		return nil
	end

	for iter_24_0, iter_24_1 in ipairs(arg_24_0.commodities) do
		if iter_24_1.id == arg_24_1 then
			return iter_24_1
		end
	end
end

function var_0_0.UpdateCommodity(arg_25_0, arg_25_1, arg_25_2)
	local var_25_0 = arg_25_0:GetCommodityById(arg_25_1)

	if var_25_0 then
		var_25_0:AddNum(arg_25_2)
	end
end

function var_0_0.GetBanners(arg_26_0)
	if arg_26_0:GetShowType() ~= 1 then
		return nil
	end

	local var_26_0 = {}

	for iter_26_0, iter_26_1 in ipairs(var_0_1.get_id_list_by_shop_page_id[arg_26_0.id]) do
		local var_26_1 = var_0_1[iter_26_1]

		if pg.TimeMgr.GetInstance():inTime(var_26_1.time) then
			table.insert(var_26_0, var_26_1)
		end
	end
end

return var_0_0
