local var_0_0 = class("ApartmentProxy", import(".NetProxy"))

var_0_0.UPDATE_APARTMENT = "ApartmentProxy.UPDATE_APARTMENT"
var_0_0.UPDATE_ROOM = "ApartmentProxy.UPDATE_ROOM"
var_0_0.UPDATE_GIFT_COUNT = "ApartmentProxy.UPDATE_GIFT_COUNT"
var_0_0.ZERO_HOUR_REFRESH = "ApartmentProxy.ZERO_HOUR_REFRESH"

function var_0_0.register(arg_1_0)
	arg_1_0.data = {}
	arg_1_0.roomData = {}
	arg_1_0.giftBag = setDefaultZeroMetatable({})
	arg_1_0.giftGiveCount = setDefaultZeroMetatable({})
	arg_1_0.stamina = 0
	arg_1_0.shopCount = {
		dailyGift = {},
		permanentGift = {},
		dailyFurniture = {},
		permanentFurniture = {}
	}

	arg_1_0:on(28000, function(arg_2_0)
		arg_1_0.stamina = getDorm3dGameset("daily_vigor_max")[1] - arg_2_0.daily_vigor_max

		for iter_2_0, iter_2_1 in ipairs(arg_2_0.gifts) do
			arg_1_0.giftBag[iter_2_1.gift_id] = iter_2_1.number
			arg_1_0.giftGiveCount[iter_2_1.gift_id] = iter_2_1.used_number
		end

		for iter_2_2, iter_2_3 in ipairs(arg_2_0.ships) do
			local var_2_0 = Apartment.New(iter_2_3)

			arg_1_0.data[var_2_0:GetConfigID()] = var_2_0
		end

		for iter_2_4, iter_2_5 in ipairs(arg_2_0.rooms) do
			local var_2_1 = ApartmentRoom.New(iter_2_5)

			arg_1_0.roomData[var_2_1:GetConfigID()] = var_2_1
		end

		local function var_2_2(arg_3_0, arg_3_1)
			_.each(arg_3_0 or {}, function(arg_4_0)
				arg_3_1[arg_4_0.gift_id] = arg_4_0.count
			end)
		end

		var_2_2(arg_2_0.gift_daily, arg_1_0.shopCount.dailyGift)
		var_2_2(arg_2_0.gift_permanent, arg_1_0.shopCount.permanentGift)
		var_2_2(arg_2_0.furniture_daily, arg_1_0.shopCount.dailyFurniture)
		var_2_2(arg_2_0.furniture_permanent, arg_1_0.shopCount.permanentFurniture)
	end)
end

function var_0_0.timeCall(arg_5_0)
	return {
		[ProxyRegister.DayCall] = function(arg_6_0, arg_6_1)
			if pg.TimeMgr.GetInstance():GetServerWeek() ~= 1 then
				return
			end

			arg_5_0:ResetDailyShopCount()

			arg_5_0.stamina = getDorm3dGameset("daily_vigor_max")[1]

			arg_5_0:sendNotification(var_0_0.ZERO_HOUR_REFRESH)
		end
	}
end

function var_0_0.InitGiftDaily(arg_7_0)
	for iter_7_0, iter_7_1 in pairs(pg.dorm3d_gift.all) do
		local var_7_0 = pg.dorm3d_gift[iter_7_1]

		if #var_7_0.shop_id > 0 then
			local var_7_1 = pg.shop_template[var_7_0.shop_id[1]].group

			if var_7_1 ~= 0 then
				arg_7_0.shopCount.dailyGift[var_7_0.id] = getProxy(ShopsProxy):GetGroupPayCount(var_7_1)
			end
		end
	end
end

function var_0_0.updateApartment(arg_8_0, arg_8_1)
	arg_8_0.data[arg_8_1.configId] = arg_8_1:clone()

	arg_8_0:sendNotification(var_0_0.UPDATE_APARTMENT, arg_8_1)
end

function var_0_0.updateRoom(arg_9_0, arg_9_1)
	arg_9_0.roomData[arg_9_1.configId] = arg_9_1:clone()

	arg_9_0:sendNotification(var_0_0.UPDATE_ROOM, arg_9_1)
end

function var_0_0.triggerFavor(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = arg_10_0.data[arg_10_1]
	local var_10_1 = pg.dorm3d_favor_trigger[arg_10_2]
	local var_10_2 = 0
	local var_10_3 = 0

	if arg_10_0.stamina >= var_10_1.is_daily_max and not var_10_0:isMaxFavor() then
		var_10_3 = var_10_1.is_daily_max
		var_10_2 = math.min(var_10_1.num, var_10_0:getMaxFavor())
	end

	arg_10_0.stamina = arg_10_0.stamina - var_10_3
	var_10_0.favor = var_10_0.favor + var_10_2
	var_10_0.triggerCountDic[arg_10_2] = var_10_0.triggerCountDic[arg_10_2] + 1

	pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataFavor(arg_10_1, var_10_2, var_10_0.favor, var_10_1.type, table.CastToString(var_10_1.param)))
	arg_10_0:updateApartment(var_10_0)

	return var_10_2, var_10_3
end

function var_0_0.getStamina(arg_11_0)
	return arg_11_0.stamina, getDorm3dGameset("daily_vigor_max")[1]
end

function var_0_0.getApartment(arg_12_0, arg_12_1)
	return arg_12_0.data[arg_12_1] and arg_12_0.data[arg_12_1]:clone() or nil
end

function var_0_0.getRoom(arg_13_0, arg_13_1)
	return arg_13_0.roomData[arg_13_1]
end

function var_0_0.getGiftCount(arg_14_0, arg_14_1)
	return arg_14_0.giftBag[arg_14_1]
end

function var_0_0.changeGiftCount(arg_15_0, arg_15_1, arg_15_2)
	assert(arg_15_2 ~= 0)

	arg_15_0.giftBag[arg_15_1] = arg_15_0.giftBag[arg_15_1] + arg_15_2

	arg_15_0:sendNotification(var_0_0.UPDATE_GIFT_COUNT, arg_15_1)
end

function var_0_0.getApartmentGiftCount(arg_16_0, arg_16_1)
	for iter_16_0, iter_16_1 in pairs(arg_16_0.giftBag) do
		if iter_16_1 > 0 and pg.dorm3d_gift[iter_16_0].ship_group_id == arg_16_1 then
			return iter_16_0
		end
	end

	return nil
end

function var_0_0.addGiftGiveCount(arg_17_0, arg_17_1, arg_17_2)
	arg_17_0.giftGiveCount[arg_17_1] = arg_17_0.giftGiveCount[arg_17_1] + arg_17_2
end

function var_0_0.isGiveGiftDone(arg_18_0, arg_18_1)
	return arg_18_0.giftGiveCount[arg_18_1] > 0
end

function var_0_0.GetGiftShopCount(arg_19_0, arg_19_1)
	return arg_19_0.shopCount.dailyGift[arg_19_1] or arg_19_0.shopCount.permanentGift[arg_19_1] or 0
end

function var_0_0.AddDailyGiftShopCount(arg_20_0, arg_20_1, arg_20_2)
	arg_20_0.shopCount.dailyGift[arg_20_1] = (arg_20_0.shopCount.dailyGift[arg_20_1] or 0) + arg_20_2
end

function var_0_0.AddPermanentGiftShopCount(arg_21_0, arg_21_1, arg_21_2)
	arg_21_0.shopCount.permanentGift[arg_21_1] = (arg_21_0.shopCount.permanentGift[arg_21_1] or 0) + arg_21_2
end

function var_0_0.GetFurnitureShopCount(arg_22_0, arg_22_1)
	return arg_22_0.shopCount.dailyFurniture[arg_22_1] or arg_22_0.shopCount.permanentFurniture[arg_22_1] or 0
end

function var_0_0.AddDailyFurnitureShopCount(arg_23_0, arg_23_1, arg_23_2)
	arg_23_0.shopCount.dailyFurniture[arg_23_1] = (arg_23_0.shopCount.dailyFurniture[arg_23_1] or 0) + arg_23_2
end

function var_0_0.AddPermanentFurnitureShopCount(arg_24_0, arg_24_1, arg_24_2)
	arg_24_0.shopCount.permanentFurniture[arg_24_1] = (arg_24_0.shopCount.permanentFurniture[arg_24_1] or 0) + arg_24_2
end

function var_0_0.ResetDailyShopCount(arg_25_0)
	table.clear(arg_25_0.shopCount.dailyGift)
	table.clear(arg_25_0.shopCount.dailyFurniture)
end

function var_0_0.RecordEnterTime(arg_26_0)
	arg_26_0.dormEnterTimeStamp = pg.TimeMgr.GetInstance():GetServerTime()
end

function var_0_0.GetEnterTime(arg_27_0)
	return arg_27_0.dormEnterTimeStamp
end

function var_0_0.RecordAccompanyTime(arg_28_0)
	arg_28_0.dormAccompanyTimeStamp = pg.TimeMgr.GetInstance():GetServerTime()
end

function var_0_0.GetAccompanyTime(arg_29_0)
	return arg_29_0.dormAccompanyTimeStamp
end

local var_0_1 = {
	6,
	18
}

function var_0_0.GetTimeIndex(arg_30_0)
	local var_30_0 = #var_0_1

	for iter_30_0, iter_30_1 in ipairs(var_0_1) do
		if arg_30_0 < iter_30_1 then
			break
		else
			var_30_0 = iter_30_0
		end
	end

	return var_30_0
end

function var_0_0.GetTimePPName()
	local var_31_0 = getProxy(PlayerProxy):getRawData()

	return "DORM3D_SCENE_LOCK_TIME_IN_PLAYER:" .. var_31_0.id
end

function var_0_0.CheckUnlockConfig(arg_32_0)
	if arg_32_0 == nil or arg_32_0 == "" or #arg_32_0 == 0 then
		return true
	end

	return switch(arg_32_0[1], {
		function(arg_33_0, arg_33_1, arg_33_2)
			local var_33_0 = getProxy(ApartmentProxy):getApartment(arg_33_1)

			if var_33_0 and arg_33_2 <= var_33_0.level then
				return true
			else
				return false, i18n("apartment_level_unenough", arg_33_2)
			end
		end,
		function(arg_34_0, arg_34_1)
			local var_34_0 = getProxy(ApartmentProxy):getRoom(pg.dorm3d_furniture_template[arg_34_1].room_id)

			if var_34_0 and underscore.any(var_34_0.furnitures, function(arg_35_0)
				return arg_35_0.configId == arg_34_1
			end) then
				return true
			else
				return false, string.format("without dorm furniture:%d", arg_34_1)
			end
		end,
		function(arg_36_0, arg_36_1)
			if getProxy(ApartmentProxy):isGiveGiftDone(arg_36_1) then
				return true
			else
				return false, string.format("gift:%d didn't had given", arg_36_1)
			end
		end,
		function(arg_37_0, arg_37_1)
			local var_37_0 = getProxy(CollectionProxy):getShipGroup(arg_37_1)

			if var_37_0 and var_37_0.married > 0 then
				return true
			else
				return false, string.format("ship:%d was not married", arg_37_1)
			end
		end,
		function(arg_38_0, arg_38_1, arg_38_2)
			local var_38_0 = getProxy(ApartmentProxy):getRoom(arg_38_1)

			return var_38_0 and var_38_0.unlockCharacter[arg_38_2], i18n("dorm3d_skin_locked")
		end
	}, function(arg_39_0)
		return false, string.format("without unlock type:%d", arg_39_0)
	end, unpack(arg_32_0))
end

function var_0_0.PendingRandom(arg_40_0, arg_40_1)
	local var_40_0 = {}

	for iter_40_0, iter_40_1 in ipairs(arg_40_1) do
		if underscore.detect(pg.dorm3d_rooms[arg_40_0].character_welcome, function(arg_41_0)
			return arg_41_0[1] == iter_40_1
		end)[2] > math.random() * 10000 then
			var_40_0[iter_40_1] = {}
		end
	end

	for iter_40_2, iter_40_3 in ipairs(pg.dorm3d_welcome.get_id_list_by_room_id[arg_40_0] or {}) do
		local var_40_1 = pg.dorm3d_welcome[iter_40_3]

		if var_40_0[var_40_1.ship_id] then
			table.insert(var_40_0[var_40_1.ship_id], iter_40_3)
		end
	end

	local var_40_2 = {}

	for iter_40_4, iter_40_5 in pairs(var_40_0) do
		local var_40_3 = 0
		local var_40_4 = 0

		for iter_40_6, iter_40_7 in ipairs(iter_40_5) do
			var_40_4 = var_40_4 + pg.dorm3d_welcome[iter_40_7].weight
		end

		local var_40_5 = math.random() * var_40_4

		for iter_40_8, iter_40_9 in ipairs(iter_40_5) do
			var_40_3 = var_40_3 + pg.dorm3d_welcome[iter_40_9].weight

			if var_40_5 < var_40_3 then
				var_40_2[iter_40_4] = iter_40_9

				break
			end
		end
	end

	return var_40_2
end

return var_0_0
