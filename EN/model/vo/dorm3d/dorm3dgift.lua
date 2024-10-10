local var_0_0 = class("Dorm3dGift", import("model.vo.BaseVO"))

function var_0_0.bindConfigTable(arg_1_0)
	return pg.dorm3d_gift
end

function var_0_0.GetName(arg_2_0)
	return arg_2_0:getConfig("name")
end

function var_0_0.GetRarity(arg_3_0)
	return arg_3_0:getConfig("rarity")
end

function var_0_0.GetShipGroupId(arg_4_0)
	return arg_4_0:getConfig("ship_group_id")
end

function var_0_0.GetIcon(arg_5_0)
	return arg_5_0:getConfig("icon")
end

function var_0_0.GetDesc(arg_6_0)
	return arg_6_0:getConfig("display")
end

function var_0_0.GetShopID(arg_7_0)
	local var_7_0 = arg_7_0:getConfig("shop_id")
	local var_7_1 = getProxy(ApartmentProxy):GetGiftShopCount(arg_7_0.configId)

	for iter_7_0 = 1, #var_7_0 - 1 do
		local var_7_2 = var_7_0[iter_7_0]
		local var_7_3 = pg.shop_template[var_7_2]
		local var_7_4 = var_7_3.limit_args[1]

		if not var_7_4 and var_7_3.group_type == 0 then
			return var_7_2
		elseif var_7_4 and (var_7_4[1] == "dailycount" or var_7_4[1] == "count") then
			if var_7_1 < var_7_4[3] then
				return var_7_2
			end
		elseif var_7_3.group_type == 2 then
			if var_7_1 < var_7_3.group_limit then
				return var_7_2
			end
		else
			return var_7_2
		end
	end

	return var_7_0[#var_7_0]
end

function var_0_0.NeedViewTip(arg_8_0)
	local var_8_0 = var_0_0.bindConfigTable()
	local var_8_1 = _.keys(var_8_0.get_id_list_by_ship_group_id)

	return _.any(var_8_1, function(arg_9_0)
		if arg_9_0 == 0 then
			return
		end

		if arg_8_0 and arg_8_0 > 0 and arg_9_0 ~= arg_8_0 then
			return
		end

		local var_9_0 = var_8_0.get_id_list_by_ship_group_id[arg_9_0]

		return _.any(var_9_0, function(arg_10_0)
			return Dorm3dGift.New({
				configId = arg_10_0
			}):GetShopID() and not getProxy(ApartmentProxy):isGiveGiftDone(arg_10_0) and Dorm3dGift.GetViewedFlag(arg_10_0) == 0
		end)
	end)
end

function var_0_0.GetViewedFlag(arg_11_0)
	local var_11_0 = getProxy(PlayerProxy):getRawData().id

	return PlayerPrefs.GetInt(var_11_0 .. "_dorm3dGiftViewed_" .. arg_11_0, 0)
end

function var_0_0.SetViewedFlag(arg_12_0)
	if var_0_0.GetViewedFlag(arg_12_0) > 0 then
		return
	end

	local var_12_0 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt(var_12_0 .. "_dorm3dGiftViewed_" .. arg_12_0, 1)

	return true
end

return var_0_0
