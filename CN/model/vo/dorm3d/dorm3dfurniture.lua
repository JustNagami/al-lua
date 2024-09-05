local var_0_0 = class("Dorm3dFurniture", import("model.vo.BaseVO"))

var_0_0.TYPE = {
	DECORATION = 3,
	FLOOR = 2,
	COUCH = 5,
	BED = 4,
	WALLPAPER = 1,
	TABLE = 6
}
var_0_0.TYPE2NAME = {
	"dorm3d_furnitrue_type_wallpaper",
	"dorm3d_furnitrue_type_floor",
	"dorm3d_furnitrue_type_decoration",
	"dorm3d_furnitrue_type_bed",
	"dorm3d_furnitrue_type_couch",
	"dorm3d_furnitrue_type_table"
}

function var_0_0.bindConfigTable(arg_1_0)
	return pg.dorm3d_furniture_template
end

function var_0_0.Ctor(arg_2_0, arg_2_1)
	var_0_0.super.Ctor(arg_2_0, arg_2_1)

	arg_2_0.slotId = arg_2_0.slotId or 0
end

function var_0_0.GetSlotID(arg_3_0)
	return arg_3_0.slotId
end

function var_0_0.SetSlotID(arg_4_0, arg_4_1)
	arg_4_0.slotId = arg_4_1
end

function var_0_0.GetName(arg_5_0)
	return arg_5_0:getConfig("name")
end

function var_0_0.GetType(arg_6_0)
	return arg_6_0:getConfig("type")
end

function var_0_0.GetRarity(arg_7_0)
	return arg_7_0:getConfig("rarity")
end

function var_0_0.GetTargetSlots(arg_8_0)
	return arg_8_0:getConfig("target_slots")
end

function var_0_0.GetShipGroupId(arg_9_0)
	return arg_9_0:getConfig("char_id")
end

function var_0_0.GetIcon(arg_10_0)
	return arg_10_0:getConfig("icon")
end

function var_0_0.GetModel(arg_11_0)
	return arg_11_0:getConfig("model")
end

function var_0_0.GetAcesses(arg_12_0)
	local var_12_0 = arg_12_0:getConfig("acesses")

	if var_12_0 == nil or var_12_0 == "" then
		return {}
	end

	return var_12_0
end

function var_0_0.GetShopID(arg_13_0)
	local var_13_0 = arg_13_0:getConfig("shop_id")
	local var_13_1 = getProxy(ApartmentProxy):GetFurnitureShopCount(arg_13_0:GetConfigID())

	for iter_13_0 = 1, #var_13_0 - 1 do
		local var_13_2 = var_13_0[iter_13_0]
		local var_13_3 = pg.shop_template[var_13_2].limit_args[1]

		if not var_13_3 then
			return var_13_2
		elseif var_13_3[1] == "dailycount" or var_13_3[1] == "count" then
			if var_13_1 < var_13_3[3] then
				return var_13_2
			end
		else
			return var_13_2
		end
	end

	return var_13_0[#var_13_0]
end

function var_0_0.IsValuable(arg_14_0)
	return arg_14_0:getConfig("is_exclusive") == 1
end

function var_0_0.NeedViewTip(arg_15_0)
	local var_15_0 = var_0_0.bindConfigTable()
	local var_15_1 = _.keys(var_15_0.get_id_list_by_char_id)

	return _.any(var_15_1, function(arg_16_0)
		if arg_16_0 == 0 then
			return false
		end

		if arg_15_0 and arg_15_0 > 0 and arg_16_0 ~= arg_15_0 then
			return false
		end

		local var_16_0 = var_15_0.get_id_list_by_char_id[arg_16_0]
		local var_16_1 = getProxy(ApartmentProxy):getApartment(arg_16_0)

		if not var_16_1 then
			return false
		end

		local var_16_2 = var_16_1:GetFurnitures()

		return _.any(_.reverse(var_16_0), function(arg_17_0)
			local var_17_0 = Dorm3dFurniture.New({
				configId = arg_17_0
			})

			if not var_17_0:GetShopID() then
				return
			end

			if not _.detect(var_16_2, function(arg_18_0)
				return arg_18_0:GetConfigID() == var_17_0:GetConfigID()
			end) then
				return
			end

			return Dorm3dFurniture.GetViewedFlag(arg_17_0) == 0
		end)
	end)
end

function var_0_0.GetViewedFlag(arg_19_0)
	local var_19_0 = getProxy(PlayerProxy):getRawData().id

	return PlayerPrefs.GetInt(var_19_0 .. "_dorm3dFurnitureViewed_" .. arg_19_0, 0)
end

function var_0_0.SetViewedFlag(arg_20_0)
	if var_0_0.GetViewedFlag(arg_20_0) > 0 then
		return
	end

	local var_20_0 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt(var_20_0 .. "_dorm3dFurnitureViewed_" .. arg_20_0, arg_20_0)

	return true
end

return var_0_0
