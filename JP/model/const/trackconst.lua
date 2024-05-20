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
local var_0_2 = 1
local var_0_3 = 2

function var_0_0.StoryStart(arg_7_0)
	if not arg_7_0 then
		return
	end

	local var_7_0 = {
		type = var_0_1,
		eventId = var_0_2,
		para1 = tostring(arg_7_0)
	}

	pg.m02:sendNotification(GAME.NEW_TRACK, var_7_0)
end

function var_0_0.StorySkip(arg_8_0)
	if not arg_8_0 then
		return
	end

	local var_8_0 = {
		type = var_0_1,
		eventId = var_0_3,
		para1 = tostring(arg_8_0)
	}

	pg.m02:sendNotification(GAME.NEW_TRACK, var_8_0)
end

var_0_0.TRACK_NEW_BULLETIN_OPEN_URL = 2
var_0_0.EVENT_NEW_BULLETIN_OPEN_URL = 1

function var_0_0.Track(arg_9_0, arg_9_1, ...)
	local var_9_0, var_9_1, var_9_2 = ...
	local var_9_3 = {
		type = arg_9_0,
		eventId = arg_9_1,
		para1 = var_9_0,
		para2 = var_9_1,
		para3 = var_9_2
	}

	pg.m02:sendNotification(GAME.NEW_TRACK, var_9_3)
end

return var_0_0
