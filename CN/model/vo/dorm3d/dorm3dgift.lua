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
		local var_7_3 = pg.shop_template[var_7_2].limit_args[1]

		if not var_7_3 then
			return var_7_2
		elseif var_7_3[1] == "dailycount" or var_7_3[1] == "count" then
			if var_7_1 < var_7_3[3] then
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
	local var_8_2 = var_0_0.GetViewedFlag()

	return _.any(var_8_1, function(arg_9_0)
		if arg_9_0 == 0 then
			return false
		end

		if arg_8_0 and arg_8_0 > 0 and arg_9_0 ~= arg_8_0 then
			return false
		end

		local var_9_0 = var_8_0.get_id_list_by_ship_group_id[arg_9_0]

		return var_8_2 < var_9_0[#var_9_0]
	end)
end

function var_0_0.GetViewedFlag()
	local var_10_0 = getProxy(PlayerProxy):getRawData().id

	return PlayerPrefs.GetInt(var_10_0 .. "_dorm3dGiftViewed", 0)
end

function var_0_0.SetViewedFlag(arg_11_0)
	if arg_11_0 <= var_0_0.GetViewedFlag() then
		return
	end

	local var_11_0 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt(var_11_0 .. "_dorm3dGiftViewed", arg_11_0)

	return true
end

return var_0_0
