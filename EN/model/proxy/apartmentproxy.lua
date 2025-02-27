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
			arg_5_0:InitGiftDaily()
		end
	}
end

function var_0_0.InitGiftDaily(arg_7_0)
	pg.m02:sendNotification(GAME.GET_CHARGE_LIST, {
		callback = function()
			for iter_8_0, iter_8_1 in pairs(pg.dorm3d_gift.all) do
				local var_8_0 = pg.dorm3d_gift[iter_8_1]

				if #var_8_0.shop_id > 0 then
					local var_8_1 = pg.shop_template[var_8_0.shop_id[1]].group

					if var_8_1 ~= 0 then
						arg_7_0.shopCount.dailyGift[var_8_0.id] = getProxy(ShopsProxy):GetGroupPayCount(var_8_1)
					end
				end
			end
		end
	})
end

function var_0_0.updateApartment(arg_9_0, arg_9_1)
	arg_9_0.data[arg_9_1.configId] = arg_9_1:clone()

	arg_9_0:sendNotification(var_0_0.UPDATE_APARTMENT, arg_9_1)
end

function var_0_0.updateRoom(arg_10_0, arg_10_1)
	arg_10_0.roomData[arg_10_1.configId] = arg_10_1:clone()

	arg_10_0:sendNotification(var_0_0.UPDATE_ROOM, arg_10_1)
end

function var_0_0.triggerFavor(arg_11_0, arg_11_1, arg_11_2, arg_11_3)
	arg_11_3 = arg_11_3 or 1

	local var_11_0 = arg_11_0.data[arg_11_1]
	local var_11_1 = pg.dorm3d_favor_trigger[arg_11_2]
	local var_11_2 = 0
	local var_11_3 = 0

	if arg_11_0.stamina >= var_11_1.is_daily_max and not var_11_0:isMaxFavor() then
		var_11_3 = var_11_1.is_daily_max * arg_11_3
		var_11_2 = math.min(var_11_1.num * arg_11_3, var_11_0:getMaxFavor() - var_11_0.favor)
	end

	arg_11_0.stamina = arg_11_0.stamina - var_11_3
	var_11_0.favor = var_11_0.favor + var_11_2
	var_11_0.triggerCountDic[arg_11_2] = var_11_0.triggerCountDic[arg_11_2] + 1

	pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataFavor(arg_11_1, var_11_2, var_11_0.favor, var_11_1.type, table.CastToString(var_11_1.param)))
	arg_11_0:updateApartment(var_11_0)

	return var_11_2, var_11_3
end

function var_0_0.getStamina(arg_12_0)
	return arg_12_0.stamina, getDorm3dGameset("daily_vigor_max")[1]
end

function var_0_0.RawGetApartment(arg_13_0, arg_13_1)
	return arg_13_0.data[arg_13_1]
end

function var_0_0.getApartment(arg_14_0, arg_14_1)
	return arg_14_0.data[arg_14_1] and arg_14_0.data[arg_14_1]:clone() or nil
end

function var_0_0.getRoom(arg_15_0, arg_15_1)
	return arg_15_0.roomData[arg_15_1]
end

function var_0_0.getGiftCount(arg_16_0, arg_16_1)
	return arg_16_0.giftBag[arg_16_1]
end

function var_0_0.changeGiftCount(arg_17_0, arg_17_1, arg_17_2)
	assert(arg_17_2 ~= 0)

	arg_17_0.giftBag[arg_17_1] = arg_17_0.giftBag[arg_17_1] + arg_17_2

	arg_17_0:sendNotification(var_0_0.UPDATE_GIFT_COUNT, arg_17_1)
end

function var_0_0.getApartmentGiftCount(arg_18_0, arg_18_1)
	for iter_18_0, iter_18_1 in pairs(arg_18_0.giftBag) do
		if iter_18_1 > 0 and pg.dorm3d_gift[iter_18_0].ship_group_id == arg_18_1 then
			return iter_18_0
		end
	end

	return nil
end

function var_0_0.addGiftGiveCount(arg_19_0, arg_19_1, arg_19_2)
	arg_19_0.giftGiveCount[arg_19_1] = arg_19_0.giftGiveCount[arg_19_1] + arg_19_2
end

function var_0_0.isGiveGiftDone(arg_20_0, arg_20_1)
	return arg_20_0.giftGiveCount[arg_20_1] > 0
end

function var_0_0.GetGiftShopCount(arg_21_0, arg_21_1)
	return arg_21_0.shopCount.dailyGift[arg_21_1] or arg_21_0.shopCount.permanentGift[arg_21_1] or 0
end

function var_0_0.AddDailyGiftShopCount(arg_22_0, arg_22_1, arg_22_2)
	arg_22_0.shopCount.dailyGift[arg_22_1] = (arg_22_0.shopCount.dailyGift[arg_22_1] or 0) + arg_22_2
end

function var_0_0.AddPermanentGiftShopCount(arg_23_0, arg_23_1, arg_23_2)
	arg_23_0.shopCount.permanentGift[arg_23_1] = (arg_23_0.shopCount.permanentGift[arg_23_1] or 0) + arg_23_2
end

function var_0_0.GetFurnitureShopCount(arg_24_0, arg_24_1)
	return arg_24_0.shopCount.dailyFurniture[arg_24_1] or arg_24_0.shopCount.permanentFurniture[arg_24_1] or 0
end

function var_0_0.AddDailyFurnitureShopCount(arg_25_0, arg_25_1, arg_25_2)
	arg_25_0.shopCount.dailyFurniture[arg_25_1] = (arg_25_0.shopCount.dailyFurniture[arg_25_1] or 0) + arg_25_2
end

function var_0_0.AddPermanentFurnitureShopCount(arg_26_0, arg_26_1, arg_26_2)
	arg_26_0.shopCount.permanentFurniture[arg_26_1] = (arg_26_0.shopCount.permanentFurniture[arg_26_1] or 0) + arg_26_2
end

function var_0_0.ResetDailyShopCount(arg_27_0)
	table.clear(arg_27_0.shopCount.dailyGift)
	table.clear(arg_27_0.shopCount.dailyFurniture)
end

function var_0_0.RecordEnterTime(arg_28_0)
	arg_28_0.dormEnterTimeStamp = pg.TimeMgr.GetInstance():GetServerTime()
end

function var_0_0.GetEnterTime(arg_29_0)
	return arg_29_0.dormEnterTimeStamp
end

function var_0_0.RecordAccompanyTime(arg_30_0)
	arg_30_0.dormAccompanyTimeStamp = pg.TimeMgr.GetInstance():GetServerTime()
end

function var_0_0.GetAccompanyTime(arg_31_0)
	return arg_31_0.dormAccompanyTimeStamp
end

local var_0_1 = {
	6,
	18
}

function var_0_0.GetTimeIndex(arg_32_0)
	local var_32_0 = #var_0_1

	for iter_32_0, iter_32_1 in ipairs(var_0_1) do
		if arg_32_0 < iter_32_1 then
			break
		else
			var_32_0 = iter_32_0
		end
	end

	return var_32_0
end

function var_0_0.GetTimePPName()
	local var_33_0 = getProxy(PlayerProxy):getRawData()

	return "DORM3D_SCENE_LOCK_TIME_IN_PLAYER:" .. var_33_0.id
end

function var_0_0.CheckUnlockConfig(arg_34_0)
	if arg_34_0 == nil or arg_34_0 == "" or #arg_34_0 == 0 then
		return true
	end

	return switch(arg_34_0[1], {
		function(arg_35_0, arg_35_1, arg_35_2)
			local var_35_0 = getProxy(ApartmentProxy):getApartment(arg_35_1)

			if var_35_0 and arg_35_2 <= var_35_0.level then
				return true
			else
				return false, i18n("apartment_level_unenough", arg_35_2)
			end
		end,
		function(arg_36_0, arg_36_1)
			local var_36_0 = getProxy(ApartmentProxy):getRoom(pg.dorm3d_furniture_template[arg_36_1].room_id)

			if var_36_0 and underscore.any(var_36_0.furnitures, function(arg_37_0)
				return arg_37_0.configId == arg_36_1
			end) then
				return true
			else
				return false, string.format("without dorm furniture:%d", arg_36_1)
			end
		end,
		function(arg_38_0, arg_38_1)
			if getProxy(ApartmentProxy):isGiveGiftDone(arg_38_1) then
				return true
			else
				return false, string.format("gift:%d didn't had given", arg_38_1)
			end
		end,
		function(arg_39_0, arg_39_1)
			local var_39_0 = getProxy(CollectionProxy):getShipGroup(arg_39_1)

			if var_39_0 and var_39_0.married > 0 then
				return true
			else
				return false, string.format("ship:%d was not married", arg_39_1)
			end
		end,
		function(arg_40_0, arg_40_1, arg_40_2)
			local var_40_0 = getProxy(ApartmentProxy):getRoom(arg_40_1)

			return var_40_0 and var_40_0.unlockCharacter[arg_40_2], i18n("dorm3d_skin_locked")
		end
	}, function(arg_41_0)
		return false, string.format("without unlock type:%d", arg_41_0)
	end, unpack(arg_34_0))
end

function var_0_0.PendingRandom(arg_42_0, arg_42_1)
	local var_42_0 = {}

	for iter_42_0, iter_42_1 in ipairs(arg_42_1) do
		local var_42_1 = underscore.detect(pg.dorm3d_rooms[arg_42_0].character_welcome, function(arg_43_0)
			return arg_43_0[1] == iter_42_1
		end)

		if var_42_1 and var_42_1[2] > math.random() * 10000 then
			var_42_0[iter_42_1] = {}
		end
	end

	for iter_42_2, iter_42_3 in ipairs(pg.dorm3d_welcome.get_id_list_by_room_id[arg_42_0] or {}) do
		local var_42_2 = pg.dorm3d_welcome[iter_42_3]

		if var_42_0[var_42_2.ship_id] then
			table.insert(var_42_0[var_42_2.ship_id], iter_42_3)
		end
	end

	local var_42_3 = {}

	for iter_42_4, iter_42_5 in pairs(var_42_0) do
		local var_42_4 = 0
		local var_42_5 = 0

		for iter_42_6, iter_42_7 in ipairs(iter_42_5) do
			var_42_5 = var_42_5 + pg.dorm3d_welcome[iter_42_7].weight
		end

		local var_42_6 = math.random() * var_42_5

		for iter_42_8, iter_42_9 in ipairs(iter_42_5) do
			var_42_4 = var_42_4 + pg.dorm3d_welcome[iter_42_9].weight

			if var_42_6 < var_42_4 then
				var_42_3[iter_42_4] = iter_42_9

				break
			end
		end
	end

	return var_42_3
end

return var_0_0
