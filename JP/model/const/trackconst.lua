local var_0_0 = class("TrackConst")

function var_0_0.GetTrackData(arg_1_0, arg_1_1, ...)
	return {
		system = arg_1_0,
		id = arg_1_1,
		desc = var_0_0.GetDesc(arg_1_0, arg_1_1, ...)
	}
end

function var_0_0.GetDesc(arg_2_0, arg_2_1, ...)
	return var_0_0["Build" .. arg_2_0 .. "Action" .. arg_2_1 .. "Desc"](unpack({
		...
	}))
end

var_0_0.SYSTEM_SHOP = 1
var_0_0.ACTION_ENTER_MAIN = 1
var_0_0.ACTION_ENTER_GIFT = 2
var_0_0.ACTION_BUY_RECOMMEND = 3
var_0_0.ACTION_LOOKUP_RECOMMEND = 4

function var_0_0.Build1Action1Desc(arg_3_0)
	return arg_3_0 and "1" or "0"
end

function var_0_0.Build1Action2Desc(arg_4_0)
	return arg_4_0 and "1" or "0"
end

function var_0_0.Build1Action3Desc(arg_5_0)
	return arg_5_0 .. ""
end

function var_0_0.Build1Action4Desc(arg_6_0)
	return arg_6_0 .. ""
end

local var_0_1 = 1
local var_0_2 = 4
local var_0_3 = 1
local var_0_4 = 2
local var_0_5 = 3

function var_0_0.StoryStart(arg_7_0)
	if not arg_7_0 then
		return
	end

	local var_7_0 = {
		type = var_0_1,
		eventId = var_0_3,
		para1 = tostring(arg_7_0)
	}

	pg.m02:sendNotification(GAME.NEW_TRACK, var_7_0)
end

function var_0_0.StorySkip(arg_8_0, arg_8_1)
	if not arg_8_0 then
		return
	end

	local var_8_0 = {
		type = var_0_1,
		eventId = var_0_4,
		para1 = tostring(arg_8_0),
		para2 = tostring(arg_8_1 or "0")
	}

	pg.m02:sendNotification(GAME.NEW_TRACK, var_8_0)
end

function var_0_0.StoryOption(arg_9_0, arg_9_1)
	if not arg_9_0 then
		return
	end

	local var_9_0 = {
		type = var_0_5,
		eventId = var_0_5,
		para1 = tostring(arg_9_0),
		para2 = tostring(arg_9_1 or "0_0")
	}

	pg.m02:sendNotification(GAME.NEW_TRACK, var_9_0)
end

function var_0_0.EmojiSend(arg_10_0)
	local var_10_0 = "777#(%d+)#777"
	local var_10_1 = arg_10_0:match(var_10_0)
	local var_10_2 = tonumber(var_10_1)

	if var_10_2 and var_10_2 > 0 then
		local var_10_3 = {
			eventId = 0,
			type = var_0_2,
			para1 = tostring(var_10_2)
		}

		pg.m02:sendNotification(GAME.NEW_TRACK, var_10_3)
	end
end

var_0_0.TRACK_NEW_BULLETIN_OPEN_URL = 2
var_0_0.EVENT_NEW_BULLETIN_OPEN_URL = 1

function var_0_0.Track(arg_11_0, arg_11_1, ...)
	local var_11_0, var_11_1, var_11_2 = ...
	local var_11_3 = {
		type = arg_11_0,
		eventId = arg_11_1,
		para1 = var_11_0,
		para2 = var_11_1,
		para3 = var_11_2
	}

	pg.m02:sendNotification(GAME.NEW_TRACK, var_11_3)
end

function var_0_0.TrackingExitSilentView(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = {
		arg3 = 0,
		trackType = 1,
		arg1 = arg_12_0,
		arg2 = arg_12_1,
		arg4 = tostring(arg_12_2)
	}

	pg.m02:sendNotification(GAME.MAIN_SCENE_TRACK, var_12_0)
end

function var_0_0.TrackingTouchBanner(arg_13_0)
	local var_13_0 = {
		arg1 = 0,
		trackType = 2,
		arg2 = 0,
		arg3 = 0,
		arg4 = tostring(arg_13_0)
	}

	pg.m02:sendNotification(GAME.MAIN_SCENE_TRACK, var_13_0)
end

function var_0_0.TrackingSwitchPainting(arg_14_0, arg_14_1)
	local var_14_0 = {
		arg3 = 0,
		trackType = 3,
		arg4 = "",
		arg1 = arg_14_0,
		arg2 = arg_14_1
	}

	pg.m02:sendNotification(GAME.MAIN_SCENE_TRACK, var_14_0)
end

function var_0_0.TrackingUrExchangeFetch(arg_15_0, arg_15_1)
	local var_15_0 = {
		trackType = 1,
		arg1 = arg_15_0,
		arg2 = arg_15_1
	}

	pg.m02:sendNotification(GAME.UR_EXCHANGE_TRACK, var_15_0)
end

function var_0_0.TrackingUrExchangeJump(arg_16_0)
	local var_16_0 = {
		arg1 = 0,
		trackType = 2,
		arg2 = arg_16_0
	}

	pg.m02:sendNotification(GAME.UR_EXCHANGE_TRACK, var_16_0)
end

return var_0_0
