local var_0_0 = class("Apartment", import(".BaseVO"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.configId = arg_1_1.ship_group
	arg_1_0.level = arg_1_1.favor_lv
	arg_1_0.favor = arg_1_1.favor_exp
	arg_1_0.daily = arg_1_1.daily_favor
	arg_1_0.skinId = arg_1_1.cur_skin
	arg_1_0.callName = arg_1_1.name
	arg_1_0.setCallCd = arg_1_1.name_cd
	arg_1_0.setCallTimeStamp = pg.TimeMgr.GetInstance():GetServerTime()
	arg_1_0.skinList = {}

	table.insert(arg_1_0.skinList, arg_1_0:getConfig("skin_model"))

	for iter_1_0, iter_1_1 in ipairs(arg_1_1.skins or {}) do
		table.insert(arg_1_0.skinList, iter_1_1)
	end

	table.sort(arg_1_0.skinList)

	arg_1_0.triggerCountDic = setmetatable({}, {
		__index = function(arg_2_0, arg_2_1)
			return 0
		end
	})

	for iter_1_2, iter_1_3 in ipairs(arg_1_1.regular_trigger or {}) do
		arg_1_0.triggerCountDic[iter_1_3] = arg_1_0.triggerCountDic[iter_1_3] + 1
	end

	arg_1_0.talkDic = {}

	for iter_1_4, iter_1_5 in ipairs(arg_1_1.dialogues or {}) do
		arg_1_0.talkDic[iter_1_5] = true
	end
end

function var_0_0.bindConfigTable(arg_3_0)
	return pg.dorm3d_dorm_template
end

function var_0_0.getFavorConfig(arg_4_0, arg_4_1, arg_4_2)
	arg_4_2 = arg_4_2 or arg_4_0.level

	local var_4_0 = pg.dorm3d_favor.get_id_list_by_char_id[arg_4_0.configId]

	return pg.dorm3d_favor[var_4_0[arg_4_2]][arg_4_1]
end

function var_0_0.getFavor(arg_5_0)
	return arg_5_0.favor, arg_5_0:getNextFavor()
end

function var_0_0.getNextFavor(arg_6_0)
	if arg_6_0.level < getDorm3dGameset("favor_level")[1] then
		return arg_6_0:getFavorConfig("favor_exp", arg_6_0.level + 1)
	else
		return 2147483647
	end
end

function var_0_0.getMaxFavor(arg_7_0)
	local var_7_0 = 0

	for iter_7_0 = arg_7_0.level + 1, getDorm3dGameset("favor_level")[1] do
		var_7_0 = var_7_0 + arg_7_0:getFavorConfig("favor_exp", iter_7_0)
	end

	return var_7_0
end

function var_0_0.isMaxFavor(arg_8_0)
	return arg_8_0.level >= getDorm3dGameset("favor_level")[1] or arg_8_0.favor >= arg_8_0:getMaxFavor()
end

function var_0_0.getLevel(arg_9_0)
	return arg_9_0.level, getDorm3dGameset("favor_level")[1]
end

function var_0_0.canLevelUp(arg_10_0)
	return arg_10_0.level < getDorm3dGameset("favor_level")[1] and arg_10_0.favor >= arg_10_0:getNextFavor()
end

function var_0_0.addLevel(arg_11_0)
	assert(arg_11_0:canLevelUp())

	arg_11_0.favor = arg_11_0.favor - arg_11_0:getNextFavor()
	arg_11_0.level = arg_11_0.level + 1
end

function var_0_0.addSkin(arg_12_0, arg_12_1)
	table.insert(arg_12_0.skinList, arg_12_1)
	table.sort(arg_12_0.skinList)
end

function var_0_0.getSkinId(arg_13_0)
	if arg_13_0.skinId == 0 then
		return arg_13_0:getConfig("skin_model")
	else
		return arg_13_0.skinId
	end
end

function var_0_0.GetSkinModelID(arg_14_0, arg_14_1)
	local var_14_0 = arg_14_0:getConfig("skin_model")

	if arg_14_1 and arg_14_1 ~= "" then
		var_14_0 = underscore.detect(pg.dorm3d_resource.get_id_list_by_ship_group[arg_14_0.configId], function(arg_15_0)
			return table.contains(pg.dorm3d_resource[arg_15_0].tags, arg_14_1)
		end)
	end

	return var_14_0
end

function var_0_0.GetCallName(arg_16_0)
	return arg_16_0.callName and #arg_16_0.callName > 0 and arg_16_0.callName or pg.dorm3d_dorm_template[arg_16_0.configId].default_appellation
end

function var_0_0.GetSetCallCd(arg_17_0)
	if not arg_17_0.setCallCd or pg.TimeMgr.GetInstance():GetServerTime() >= arg_17_0.setCallCd then
		return 0
	end

	return arg_17_0.setCallCd - pg.TimeMgr.GetInstance():GetServerTime()
end

function var_0_0.getTalkingList(arg_18_0, arg_18_1)
	return underscore.filter(pg.dorm3d_dialogue_group.get_id_list_by_char_id[arg_18_0.configId], function(arg_19_0)
		local var_19_0 = pg.dorm3d_dialogue_group[arg_19_0]

		return (not arg_18_1.typeDic or tobool(arg_18_1.typeDic[var_19_0.type])) and (not arg_18_1.roomId or var_19_0.room_id == 0 or arg_18_1.roomId == var_19_0.room_id) and (not arg_18_1.unplay or not arg_18_0.talkDic[arg_19_0]) and (not arg_18_1.unlock or ApartmentProxy.CheckUnlockConfig(var_19_0.unlock))
	end)
end

function var_0_0.getForceEnterTalking(arg_20_0, arg_20_1)
	return arg_20_0:getTalkingList({
		unlock = true,
		unplay = true,
		typeDic = {
			[100] = true
		},
		roomId = arg_20_1
	})
end

var_0_0.ENTER_TALK_TYPE_DIC = {
	[101] = function(arg_21_0, arg_21_1)
		return PlayerPrefs.GetString("DORM3D_DAILY_ENTER", "") ~= pg.TimeMgr.GetInstance():CurrentSTimeDesc("%Y/%m/%d")
	end,
	[102] = function(arg_22_0, arg_22_1)
		return underscore.any(arg_22_0, function(arg_23_0)
			return getProxy(ActivityProxy):IsActivityNotEnd(arg_23_0)
		end)
	end,
	[103] = function(arg_24_0, arg_24_1)
		return PlayerPrefs.GetInt("dorm3d_enter_count_" .. arg_24_1, 0) > arg_24_0[1]
	end,
	[104] = function(arg_25_0, arg_25_1)
		return true
	end
}

function var_0_0.getEnterTalking(arg_26_0, arg_26_1)
	local var_26_0

	for iter_26_0, iter_26_1 in ipairs(arg_26_0:getTalkingList({
		unlock = true,
		typeDic = var_0_0.ENTER_TALK_TYPE_DIC,
		roomId = arg_26_1
	})) do
		local var_26_1 = pg.dorm3d_dialogue_group[iter_26_1]

		if switch(var_26_1.type, var_0_0.ENTER_TALK_TYPE_DIC, function(arg_27_0)
			return false
		end, var_26_1.trigger_config, arg_26_0.configId) then
			if not var_26_0 or var_26_1.type < pg.dorm3d_dialogue_group[var_26_0[1]].type then
				var_26_0 = {
					iter_26_1
				}
			elseif var_26_1.type == pg.dorm3d_dialogue_group[var_26_0[1]].type then
				table.insert(var_26_0, iter_26_1)
			end
		end
	end

	return var_26_0 or {}
end

function var_0_0.getFurnitureTalking(arg_28_0, arg_28_1, arg_28_2)
	return underscore.filter(arg_28_0:getTalkingList({
		unlock = true,
		typeDic = {
			[200] = true
		},
		roomId = arg_28_1
	}), function(arg_29_0)
		local var_29_0 = pg.dorm3d_dialogue_group[arg_29_0]

		return var_29_0.trigger_config == "" or var_29_0.trigger_config == arg_28_2
	end)
end

function var_0_0.getZoneTalking(arg_30_0, arg_30_1, arg_30_2)
	return underscore.filter(arg_30_0:getTalkingList({
		unlock = true,
		unplay = true,
		typeDic = {
			[300] = true
		},
		roomId = arg_30_1
	}), function(arg_31_0)
		return pg.dorm3d_dialogue_group[arg_31_0].trigger_config == arg_30_2
	end)
end

function var_0_0.getDistanceTalking(arg_32_0, arg_32_1, arg_32_2)
	return underscore.filter(arg_32_0:getTalkingList({
		unlock = true,
		unplay = true,
		typeDic = {
			[550] = true
		},
		roomId = arg_32_1
	}), function(arg_33_0)
		return pg.dorm3d_dialogue_group[arg_33_0].trigger_config == arg_32_2
	end)
end

function var_0_0.getSpecialTalking(arg_34_0, arg_34_1)
	return arg_34_0:getTalkingList({
		unlock = true,
		unplay = true,
		typeDic = {
			[700] = true
		},
		roomId = arg_34_1
	})
end

function var_0_0.getGiftIds(arg_35_0)
	local var_35_0 = pg.dorm3d_gift.get_id_list_by_ship_group_id

	return table.mergeArray(var_35_0[0], var_35_0[arg_35_0.configId] or {})
end

function var_0_0.needDownload(arg_36_0)
	local var_36_0, var_36_1 = ApartmentRoom.New({
		id = arg_36_0:getConfig("bind_room")
	}):getDownloadNameList()

	return #var_36_0 > 0 or #var_36_1 > 0
end

function var_0_0.filterUnlockTalkList(arg_37_0, arg_37_1)
	return underscore.filter(arg_37_1, function(arg_38_0)
		return ApartmentProxy.CheckUnlockConfig(pg.dorm3d_dialogue_group[arg_38_0].unlock)
	end)
end

function var_0_0.getIconTip(arg_39_0, arg_39_1)
	if #arg_39_0:getForceEnterTalking(arg_39_1) > 0 then
		return "main"
	elseif getProxy(ApartmentProxy):getApartmentGiftCount(arg_39_0.configId) then
		return "gift"
	elseif Dorm3dFurniture.IsTimelimitShopTip(arg_39_1) then
		return "furniture"
	elseif false then
		return "talk"
	else
		return nil
	end
end

function var_0_0.getGroupConfig(arg_40_0, arg_40_1)
	if not arg_40_1 or arg_40_1 == "" then
		return nil
	end

	for iter_40_0, iter_40_1 in ipairs(arg_40_1) do
		if iter_40_1[1] == arg_40_0 then
			return iter_40_1[2]
		end
	end

	return nil
end

return var_0_0
