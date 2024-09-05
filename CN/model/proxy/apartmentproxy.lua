local var_0_0 = class("ApartmentProxy", import(".NetProxy"))

var_0_0.UPDATE_APARTMENT = "ApartmentProxy.UPDATE_APARTMENT"
var_0_0.UPDATE_PUBLIC_ROOM = "ApartmentProxy.UPDATE_PUBLIC_ROOM"
var_0_0.UPDATE_GIFT_COUNT = "ApartmentProxy.UPDATE_GIFT_COUNT"

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

			arg_1_0.data[var_2_0.configId] = var_2_0
		end

		for iter_2_4, iter_2_5 in ipairs(arg_2_0.rooms) do
			arg_1_0.roomData[iter_2_5] = ApartmentRoom.New({
				id = iter_2_5
			})
		end

		local function var_2_1(arg_3_0, arg_3_1)
			_.each(arg_3_0 or {}, function(arg_4_0)
				arg_3_1[arg_4_0.gift_id] = arg_4_0.count
			end)
		end

		var_2_1(arg_2_0.gift_daily, arg_1_0.shopCount.dailyGift)
		var_2_1(arg_2_0.gift_permanent, arg_1_0.shopCount.permanentGift)
		var_2_1(arg_2_0.furniture_daily, arg_1_0.shopCount.dailyFurniture)
		var_2_1(arg_2_0.furniture_permanent, arg_1_0.shopCount.permanentFurniture)
	end)
end

function var_0_0.timeCall(arg_5_0)
	return {
		[ProxyRegister.DayCall] = function(arg_6_0, arg_6_1)
			arg_5_0:ResetDailyShopCount()
		end
	}
end

function var_0_0.updateApartment(arg_7_0, arg_7_1)
	arg_7_0.data[arg_7_1.configId] = arg_7_1:clone()

	arg_7_0:sendNotification(var_0_0.UPDATE_APARTMENT, arg_7_1)
end

function var_0_0.updateRoom(arg_8_0, arg_8_1)
	arg_8_0.roomData[arg_8_1.configId] = arg_8_1:clone()

	arg_8_0:sendNotification(var_0_0.UPDATE_PUBLIC_ROOM, arg_8_1)
end

function var_0_0.triggerFavor(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = arg_9_0.data[arg_9_1]
	local var_9_1 = 0
	local var_9_2 = pg.dorm3d_favor_trigger[arg_9_2]

	if var_9_2.is_daily_max == 0 or arg_9_0.stamina > 0 then
		arg_9_0.stamina = arg_9_0.stamina - var_9_2.is_daily_max
		var_9_1 = var_9_2.num
	end

	var_9_0.favor = var_9_0.favor + var_9_1
	var_9_0.triggerCountDic[arg_9_2] = var_9_0.triggerCountDic[arg_9_2] + 1

	pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataFavor(arg_9_1, var_9_1, var_9_0.favor, var_9_2.type, table.CastToString(var_9_2.param)))
	arg_9_0:updateApartment(var_9_0)

	return var_9_1
end

function var_0_0.getStamina(arg_10_0)
	return arg_10_0.stamina, getDorm3dGameset("daily_vigor_max")[1]
end

function var_0_0.getApartment(arg_11_0, arg_11_1)
	return arg_11_0.data[arg_11_1] and arg_11_0.data[arg_11_1]:clone() or nil
end

function var_0_0.getRoom(arg_12_0, arg_12_1)
	return arg_12_0.roomData[arg_12_1]
end

function var_0_0.getGiftCount(arg_13_0, arg_13_1)
	return arg_13_0.giftBag[arg_13_1]
end

function var_0_0.changeGiftCount(arg_14_0, arg_14_1, arg_14_2)
	assert(arg_14_2 ~= 0)

	arg_14_0.giftBag[arg_14_1] = arg_14_0.giftBag[arg_14_1] + arg_14_2

	arg_14_0:sendNotification(var_0_0.UPDATE_GIFT_COUNT, arg_14_1)
end

function var_0_0.getApartmentGiftCount(arg_15_0, arg_15_1)
	for iter_15_0, iter_15_1 in pairs(arg_15_0.giftBag) do
		if iter_15_1 > 0 and pg.dorm3d_gift[iter_15_0].ship_group_id == arg_15_1 then
			return iter_15_0
		end
	end

	return nil
end

function var_0_0.addGiftGiveCount(arg_16_0, arg_16_1, arg_16_2)
	arg_16_0.giftGiveCount[arg_16_1] = arg_16_0.giftGiveCount[arg_16_1] + arg_16_2
end

function var_0_0.isGiveGiftDone(arg_17_0, arg_17_1)
	return arg_17_0.giftGiveCount[arg_17_1] > 0
end

function var_0_0.getGiftUnlockTalk(arg_18_0, arg_18_1, arg_18_2)
	for iter_18_0, iter_18_1 in ipairs(pg.dorm3d_dialogue_group.get_id_list_by_char_id[20220]) do
		local var_18_0 = pg.dorm3d_dialogue_group[iter_18_1]

		if var_18_0.type == 401 and arg_18_0.data[arg_18_1]:checkUnlockConfig(var_18_0.unlock) then
			return iter_18_1
		end
	end
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

local var_0_1 = {
	6,
	18
}

function var_0_0.GetTimeIndex(arg_28_0)
	local var_28_0 = #var_0_1

	for iter_28_0, iter_28_1 in ipairs(var_0_1) do
		if arg_28_0 < iter_28_1 then
			break
		else
			var_28_0 = iter_28_0
		end
	end

	return var_28_0
end

return var_0_0
