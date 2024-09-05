local var_0_0 = class("Dorm3dTrackCommand", pm.SimpleCommand)

var_0_0.TYPE_DORM_ENTER = 1
var_0_0.TYPE_DORM_TOUCH = 2
var_0_0.TYPE_DORM_DIALOG = 3
var_0_0.TYPE_DORM_FAVOR = 4
var_0_0.TYPE_DORM_GIFT = 5
var_0_0.TYPE_DORM_FURNITURE = 6
var_0_0.TYPE_DORM_COLLECTION_ITEM = 7
var_0_0.TYPE_DORM_STORY = 8
var_0_0.TYPE_DORM_CAMERA = 9
var_0_0.TYPE_DORM_COVER = 10
var_0_0.TYPE_DORM_DOWNLOAD = 11
var_0_0.TYPE_DORM_IK_FURNITURE = 12
var_0_0.TYPE_DORM_ROOM = 13

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1.body

	print("TRACK DORM3D\n", table.CastToString(var_1_0))

	if not pg.ConnectionMgr.GetInstance():getConnection() or not pg.ConnectionMgr.GetInstance():isConnected() then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(28090, {
		track_typ = var_1_0.trackType,
		int_arg1 = var_1_0.arg1 or 0,
		int_arg2 = var_1_0.arg2 or 0,
		int_arg3 = var_1_0.arg3 or 0,
		int_arg4 = var_1_0.arg4 or 0,
		int_arg5 = var_1_0.arg5 or 0,
		str_arg1 = var_1_0.str1 or "",
		str_arg2 = var_1_0.str2 or "",
		str_arg3 = var_1_0.str3 or ""
	})
end

function var_0_0.BuildDataEnter(arg_2_0, arg_2_1)
	return {
		trackType = var_0_0.TYPE_DORM_ENTER,
		arg1 = arg_2_0,
		arg2 = arg_2_1
	}
end

function var_0_0.BuildDataTouch(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	return {
		trackType = var_0_0.TYPE_DORM_TOUCH,
		arg1 = arg_3_0,
		arg2 = arg_3_1,
		str1 = arg_3_2,
		str2 = arg_3_3
	}
end

function var_0_0.BuildDataDialog(arg_4_0, arg_4_1, arg_4_2, arg_4_3, arg_4_4, arg_4_5, arg_4_6)
	return {
		trackType = var_0_0.TYPE_DORM_DIALOG,
		arg1 = arg_4_0,
		arg2 = arg_4_1,
		arg3 = arg_4_2,
		arg4 = arg_4_3,
		arg5 = arg_4_4,
		str1 = arg_4_5,
		str2 = arg_4_6
	}
end

function var_0_0.BuildDataFavor(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4)
	return {
		trackType = var_0_0.TYPE_DORM_FAVOR,
		arg1 = arg_5_0,
		arg2 = arg_5_1,
		arg3 = arg_5_2,
		arg4 = arg_5_3,
		str1 = arg_5_4
	}
end

function var_0_0.BuildDataGift(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	return {
		trackType = var_0_0.TYPE_DORM_GIFT,
		arg2 = arg_6_0,
		arg3 = arg_6_1,
		arg4 = arg_6_2,
		str1 = arg_6_3
	}
end

function var_0_0.BuildDataFurniture(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	return {
		trackType = var_0_0.TYPE_DORM_FURNITURE,
		arg2 = arg_7_0,
		arg3 = arg_7_1,
		arg4 = arg_7_2,
		str1 = arg_7_3
	}
end

function var_0_0.BuildDataCollectionItem(arg_8_0, arg_8_1)
	return {
		trackType = var_0_0.TYPE_DORM_COLLECTION_ITEM,
		arg1 = arg_8_0,
		arg2 = arg_8_1
	}
end

function var_0_0.BuildDataStory(arg_9_0, arg_9_1)
	return {
		trackType = var_0_0.TYPE_DORM_STORY,
		arg1 = arg_9_0,
		str1 = arg_9_1
	}
end

function var_0_0.BuildCameraMsg(arg_10_0, arg_10_1, arg_10_2, arg_10_3, arg_10_4, arg_10_5, arg_10_6)
	return table.concat(_.map({
		arg_10_0,
		arg_10_1,
		arg_10_2,
		arg_10_3,
		arg_10_4,
		arg_10_5,
		arg_10_6
	}, function(arg_11_0)
		return tostring(arg_11_0)
	end), "_")
end

function var_0_0.BuildDataCamera(arg_12_0, arg_12_1, arg_12_2)
	return {
		trackType = var_0_0.TYPE_DORM_CAMERA,
		arg1 = arg_12_0,
		arg2 = arg_12_1,
		str1 = arg_12_2
	}
end

function var_0_0.BuildDataCover(arg_13_0, arg_13_1)
	return {
		trackType = var_0_0.TYPE_DORM_COVER,
		arg1 = arg_13_0,
		arg2 = arg_13_1
	}
end

function var_0_0.BuildDataDownload(arg_14_0, arg_14_1)
	return {
		trackType = var_0_0.TYPE_DORM_DOWNLOAD,
		arg1 = arg_14_0,
		arg2 = arg_14_1
	}
end

function var_0_0.BuildDataIKFurniture(arg_15_0, arg_15_1)
	return {
		trackType = var_0_0.TYPE_DORM_IK_FURNITURE,
		arg1 = arg_15_0,
		arg2 = arg_15_1
	}
end

function var_0_0.BuildDataRoom(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
	return {
		trackType = var_0_0.TYPE_DORM_ROOM,
		arg1 = arg_16_0,
		arg2 = arg_16_1,
		str1 = arg_16_2,
		str2 = arg_16_3
	}
end

return var_0_0
