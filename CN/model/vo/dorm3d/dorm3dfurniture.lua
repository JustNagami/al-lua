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

function var_0_0.GetIcon(arg_9_0)
	return arg_9_0:getConfig("icon")
end

function var_0_0.GetModel(arg_10_0)
	return arg_10_0:getConfig("model")
end

function var_0_0.GetAcesses(arg_11_0)
	local var_11_0 = arg_11_0:getConfig("acesses")

	if var_11_0 == nil or var_11_0 == "" then
		return {}
	end

	return var_11_0
end

function var_0_0.GetShopID(arg_12_0)
	return arg_12_0:getConfig("shop_id")[1] or 0
end

function var_0_0.IsValuable(arg_13_0)
	return arg_13_0:getConfig("is_exclusive") == 1
end

function var_0_0.IsSpecial(arg_14_0)
	return arg_14_0:getConfig("is_special") == 1
end

function var_0_0.InShopTime(arg_15_0)
	local var_15_0 = arg_15_0:GetShopID()

	if var_15_0 == 0 then
		return true
	end

	local var_15_1 = pg.shop_template[var_15_0]

	return pg.TimeMgr.GetInstance():inTime(var_15_1.time)
end

function var_0_0.GetEndTime(arg_16_0)
	local var_16_0 = arg_16_0:GetShopID()

	if var_16_0 == 0 then
		return 0
	end

	local var_16_1 = pg.shop_template[var_16_0].time

	if var_16_1 == "always" or var_16_1 == "stop" then
		return 0
	end

	return (pg.TimeMgr.GetInstance():parseTimeFromConfig(var_16_1[2]))
end

function var_0_0.NeedViewTip(arg_17_0)
	local var_17_0 = arg_17_0 and {
		getProxy(ApartmentProxy):getRoom(arg_17_0)
	} or underscore.values(getProxy(ApartmentProxy).roomData)

	return underscore.any(var_17_0, function(arg_18_0)
		return underscore.any(arg_18_0:GetFurnitures(), function(arg_19_0)
			return Dorm3dFurniture.GetViewedFlag(arg_19_0:GetConfigID()) == 0
		end)
	end)
end

function var_0_0.GetViewedFlag(arg_20_0)
	local var_20_0 = getProxy(PlayerProxy):getRawData().id

	return PlayerPrefs.GetInt(var_20_0 .. "_dorm3dFurnitureViewed_" .. arg_20_0, 0)
end

function var_0_0.SetViewedFlag(arg_21_0)
	if var_0_0.GetViewedFlag(arg_21_0) > 0 then
		return
	end

	local var_21_0 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt(var_21_0 .. "_dorm3dFurnitureViewed_" .. arg_21_0, 1)

	return true
end

function var_0_0.IsTimelimitShopTip(arg_22_0)
	local var_22_0 = arg_22_0 and {
		getProxy(ApartmentProxy):getRoom(arg_22_0)
	} or underscore.values(getProxy(ApartmentProxy).roomData)

	return underscore.any(var_22_0, function(arg_23_0)
		local var_23_0 = arg_23_0:GetFurnitures()
		local var_23_1 = pg.dorm3d_furniture_template.get_id_list_by_room_id[arg_23_0:GetConfigID()] or {}

		return _.any(var_23_1, function(arg_24_0)
			local var_24_0 = Dorm3dFurniture.New({
				configId = arg_24_0
			})

			return var_24_0:GetEndTime() > 0 and var_24_0:InShopTime() and not _.detect(var_23_0, function(arg_25_0)
				return arg_25_0:GetConfigID() == arg_24_0
			end)
		end)
	end)
end

return var_0_0
