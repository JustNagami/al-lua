local var_0_0 = class("Apartment", import(".BaseVO"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.configId = arg_1_1.ship_group
	arg_1_0.level = arg_1_1.favor_lv
	arg_1_0.favor = arg_1_1.favor_exp
	arg_1_0.daily = arg_1_1.daily_favor
	arg_1_0.skinId = arg_1_1.cur_skin
	arg_1_0.skinList = {}

	table.insert(arg_1_0.skinList, arg_1_0:getConfig("skin_model"))

	for iter_1_0, iter_1_1 in ipairs(arg_1_1.skins) do
		table.insert(arg_1_0.skinList, iter_1_1)
	end

	table.sort(arg_1_0.skinList)

	arg_1_0.triggerCountDic = setmetatable({}, {
		__index = function(arg_2_0, arg_2_1)
			return 0
		end
	})

	for iter_1_2, iter_1_3 in ipairs(arg_1_1.regular_trigger) do
		arg_1_0.triggerCountDic[iter_1_3] = arg_1_0.triggerCountDic[iter_1_3] + 1
	end

	arg_1_0.furnitures = {}

	table.Ipairs(arg_1_1.furnitures, function(arg_3_0, arg_3_1)
		arg_1_0.furnitures[arg_3_0] = Dorm3dFurniture.New({
			configId = arg_3_1.furniture_id,
			slotId = arg_3_1.slot_id
		})
	end)

	arg_1_0.slotDic = {}

	table.Ipairs(arg_1_0:GetSlotIDList(), function(arg_4_0, arg_4_1)
		arg_1_0.slotDic[arg_4_1] = Dorm3dFurnitureSlot.New({
			configId = arg_4_1
		})
	end)

	arg_1_0.zoneDic = {}
	arg_1_0.zoneReplaceDic = {}

	table.Ipairs(arg_1_0:GetZoneIDList(), function(arg_5_0, arg_5_1)
		local var_5_0 = Dorm3dZone.New({
			configId = arg_5_1
		})
		local var_5_1 = var_5_0:GetWatchCameraName()

		arg_1_0.zoneDic[var_5_1] = var_5_0
		arg_1_0.zoneReplaceDic[var_5_1] = {}

		var_5_0:SetSlots(_.map(var_5_0:GetSlotIDList(), function(arg_6_0)
			return arg_1_0.slotDic[arg_6_0]
		end))
	end)
	arg_1_0:UpdateFurnitureReplaceConfig()

	arg_1_0.cameraZones = _.map(arg_1_0:GetCameraZoneIDList(), function(arg_7_0)
		return Dorm3dCameraZone.New({
			configId = arg_7_0
		})
	end)
	arg_1_0.talkDic = {}

	for iter_1_4, iter_1_5 in ipairs(arg_1_1.dialogues) do
		arg_1_0.talkDic[iter_1_5] = true
	end

	arg_1_0.collectItemDic = {}

	for iter_1_6, iter_1_7 in ipairs(arg_1_1.collections) do
		arg_1_0.collectItemDic[iter_1_7] = true
	end
end

function var_0_0.bindConfigTable(arg_8_0)
	return pg.dorm3d_dorm_template
end

function var_0_0.getFavorConfig(arg_9_0, arg_9_1, arg_9_2)
	arg_9_2 = arg_9_2 or arg_9_0.level

	local var_9_0 = pg.dorm3d_favor.get_id_list_by_char_id[arg_9_0.configId]

	return pg.dorm3d_favor[var_9_0[arg_9_2]][arg_9_1]
end

function var_0_0.getFavor(arg_10_0)
	return arg_10_0.favor, arg_10_0:getNextExp()
end

function var_0_0.getDailyFavor(arg_11_0)
	return arg_11_0.daily, getDorm3dGameset("daily_exp_max")[1]
end

function var_0_0.getLevel(arg_12_0)
	return arg_12_0.level
end

function var_0_0.addLevel(arg_13_0)
	arg_13_0.favor = arg_13_0.favor - arg_13_0:getNextExp()
	arg_13_0.level = arg_13_0.level + 1
end

function var_0_0.addSkin(arg_14_0, arg_14_1)
	table.insert(arg_14_0.skinList, arg_14_1)
	table.sort(arg_14_0.skinList)
end

function var_0_0.getSkinId(arg_15_0)
	if arg_15_0.skinId == 0 then
		return arg_15_0:getConfig("skin_model")
	else
		return arg_15_0.skinId
	end
end

function var_0_0.getStageRank(arg_16_0)
	if not var_0_0.stageDic then
		var_0_0.stageDic = {}

		for iter_16_0, iter_16_1 in ipairs(getDorm3dGameset("stage_level")[2]) do
			for iter_16_2, iter_16_3 in ipairs(iter_16_1) do
				var_0_0.stageDic[iter_16_3] = iter_16_0
			end
		end
	end

	return var_0_0.stageDic[arg_16_0.level]
end

function var_0_0.getNextExp(arg_17_0)
	if arg_17_0.level < getDorm3dGameset("favor_level")[1] then
		return arg_17_0:getFavorConfig("favor_exp", arg_17_0.level + 1)
	else
		return 0
	end
end

function var_0_0.GetScene(arg_18_0)
	return arg_18_0:getConfig("scene")
end

function var_0_0.GetBaseScene(arg_19_0)
	return arg_19_0:getConfig("scene_base")
end

function var_0_0.GetSceneRootName(arg_20_0)
	return arg_20_0:getConfig("scene_parent")
end

function var_0_0.GetAssetName(arg_21_0)
	return arg_21_0:getConfig("asset_name")
end

function var_0_0.GetBaseModelName(arg_22_0)
	return arg_22_0:getConfig("base_model")
end

function var_0_0.GetSceneData(arg_23_0)
	return {
		sceneName = arg_23_0:getConfig("scene"),
		baseSceneName = arg_23_0:getConfig("scene_base"),
		modelName = arg_23_0:GetSkinModelName()
	}
end

function var_0_0.GetSkinModelName(arg_24_0)
	local var_24_0 = arg_24_0.skinId

	if var_24_0 == 0 then
		var_24_0 = arg_24_0:getConfig("skin_model")
	end

	assert(underscore.any(pg.dorm3d_resource.get_id_list_by_ship_group[arg_24_0.configId], function(arg_25_0)
		return var_24_0 == arg_25_0
	end))

	return pg.dorm3d_resource[var_24_0].model_id
end

function var_0_0.GetZoneIDList(arg_26_0)
	return pg.dorm3d_zone_template.get_id_list_by_char_id[arg_26_0.configId]
end

function var_0_0.GetSlotIDList(arg_27_0)
	return pg.dorm3d_furniture_slot_template.get_id_list_by_char_id[arg_27_0.configId]
end

function var_0_0.GetFurnitureZoneIDList(arg_28_0)
	return arg_28_0:getConfig("furniture_zones")
end

function var_0_0.GetCameraZoneIDList(arg_29_0)
	return pg.dorm3d_camera_zone_template.get_id_list_by_char_id[arg_29_0.configId]
end

function var_0_0.GetZones(arg_30_0)
	return underscore(arg_30_0.zoneDic):chain():values():sort(CompareFuncs({
		function(arg_31_0)
			return arg_31_0.configId
		end
	})):value()
end

function var_0_0.GetFurnitureZones(arg_32_0)
	local var_32_0 = arg_32_0:GetFurnitureZoneIDList()

	return underscore.map(var_32_0, function(arg_33_0)
		return (table.Find(arg_32_0.zoneDic, function(arg_34_0, arg_34_1)
			return arg_34_1:GetConfigID() == arg_33_0
		end))
	end)
end

function var_0_0.GetCameraZones(arg_35_0)
	return arg_35_0.cameraZones
end

function var_0_0.GetSlots(arg_36_0)
	return underscore(arg_36_0.slotDic):chain():values():sort(CompareFuncs({
		function(arg_37_0)
			return arg_37_0.configId
		end
	})):value()
end

function var_0_0.GetFurnitureIDList(arg_38_0)
	return pg.dorm3d_furniture_template.get_id_list_by_char_id[arg_38_0.configId]
end

function var_0_0.GetFurnitures(arg_39_0)
	return arg_39_0.furnitures
end

function var_0_0.AddFurnitureByID(arg_40_0, arg_40_1)
	table.insert(arg_40_0.furnitures, Dorm3dFurniture.New({
		configId = arg_40_1
	}))
end

function var_0_0.ReplaceFurnitures(arg_41_0, arg_41_1)
	_.each(arg_41_1, function(arg_42_0)
		arg_41_0:ReplaceFurniture(arg_42_0.slotId, arg_42_0.furnitureId)
	end)
	arg_41_0:UpdateFurnitureReplaceConfig()
end

function var_0_0.ReplaceFurniture(arg_43_0, arg_43_1, arg_43_2)
	if arg_43_1 > 0 then
		local var_43_0 = _.detect(arg_43_0.furnitures, function(arg_44_0)
			return arg_44_0:GetSlotID() == arg_43_1
		end)

		if var_43_0 then
			var_43_0:SetSlotID(0)
		end
	end

	if arg_43_2 > 0 then
		local var_43_1 = _.detect(arg_43_0.furnitures, function(arg_45_0)
			return arg_45_0:GetConfigID() == arg_43_2 and arg_45_0:GetSlotID() == 0
		end)

		if var_43_1 then
			var_43_1:SetSlotID(arg_43_1)
		end
	end
end

function var_0_0.UpdateFurnitureReplaceConfig(arg_46_0)
	local var_46_0 = {}

	for iter_46_0, iter_46_1 in ipairs(arg_46_0.furnitures) do
		if iter_46_1.slotId ~= 0 then
			var_46_0[iter_46_1.slotId] = iter_46_1
		end
	end

	for iter_46_2, iter_46_3 in ipairs(arg_46_0.zoneDic) do
		if iter_46_2 ~= "" then
			for iter_46_4, iter_46_5 in ipairs(iter_46_3:GetSlots()) do
				local var_46_1 = var_46_0[iter_46_5.configId]

				if var_46_1 then
					if var_46_1:getConfig("touch_id") ~= 0 then
						assert(not arg_46_0.zoneReplaceDic[iter_46_2].touch_id)

						arg_46_0.zoneReplaceDic[iter_46_2].touch_id = var_46_1:getConfig("touch_id")
					end

					if var_46_1:getConfig("lazy_action") ~= "" then
						assert(not arg_46_0.zoneReplaceDic[iter_46_2].lazy_action)

						arg_46_0.zoneReplaceDic[iter_46_2].lazy_action = var_46_1:getConfig("lazy_action")
					end
				end
			end
		end
	end
end

function var_0_0.getTalkingList(arg_47_0, arg_47_1, arg_47_2, arg_47_3)
	return underscore.filter(pg.dorm3d_dialogue_group.get_id_list_by_char_id[arg_47_0.configId], function(arg_48_0)
		return (not arg_47_1 or tobool(arg_47_1[pg.dorm3d_dialogue_group[arg_48_0].type])) and (not arg_47_3 or not arg_47_0.talkDic[arg_48_0]) and (not arg_47_2 or arg_47_0:checkUnlockConfig(pg.dorm3d_dialogue_group[arg_48_0].unlock))
	end)
end

function var_0_0.getForceEnterTalking(arg_49_0)
	return arg_49_0:getTalkingList({
		[100] = true
	}, true, true)
end

var_0_0.ENTER_TALK_TYPE_DIC = {
	[101] = function(arg_50_0, arg_50_1)
		return PlayerPrefs.GetString("DORM3D_DAILY_ENTER", "") ~= pg.TimeMgr.GetInstance():CurrentSTimeDesc("%Y/%m/%d")
	end,
	[102] = function(arg_51_0, arg_51_1)
		return underscore.any(arg_51_0, function(arg_52_0)
			return getProxy(ActivityProxy):IsActivityNotEnd(arg_52_0)
		end)
	end,
	[103] = function(arg_53_0, arg_53_1)
		return PlayerPrefs.GetInt("dorm3d_enter_count_" .. arg_53_1, 0) > arg_53_0[1]
	end,
	[104] = function(arg_54_0, arg_54_1)
		return true
	end
}

function var_0_0.getEnterTalking(arg_55_0)
	local var_55_0

	for iter_55_0, iter_55_1 in ipairs(arg_55_0:getTalkingList(var_0_0.ENTER_TALK_TYPE_DIC, true)) do
		local var_55_1 = pg.dorm3d_dialogue_group[iter_55_1]

		if switch(var_55_1.type, var_0_0.ENTER_TALK_TYPE_DIC, function(arg_56_0)
			return false
		end, var_55_1.trigger_config, arg_55_0.configId) then
			if not var_55_0 or var_55_1.type < pg.dorm3d_dialogue_group[var_55_0[1]].type then
				var_55_0 = {
					iter_55_1
				}
			elseif var_55_1.type == pg.dorm3d_dialogue_group[var_55_0[1]].type then
				table.insert(var_55_0, iter_55_1)
			end
		end
	end

	return var_55_0 or {}
end

function var_0_0.getFurnitureTalking(arg_57_0, arg_57_1)
	return underscore.filter(arg_57_0:getTalkingList({
		[200] = true
	}, true), function(arg_58_0)
		local var_58_0 = pg.dorm3d_dialogue_group[arg_58_0]

		return var_58_0.trigger_config == "" or var_58_0.trigger_config == arg_57_1
	end)
end

function var_0_0.getZoneTalking(arg_59_0)
	return arg_59_0:getTalkingList({
		[300] = true
	}, true, true)
end

function var_0_0.getDistanceTalking(arg_60_0)
	return arg_60_0:getTalkingList({
		[550] = true
	}, true, true)
end

function var_0_0.getSpecialTalking(arg_61_0)
	return arg_61_0:getTalkingList({
		[700] = true
	}, true, true)
end

function var_0_0.getTouchConfig(arg_62_0, arg_62_1)
	return pg.dorm3d_touch_data[arg_62_0:getZoneConfig(arg_62_1, "touch_id")]
end

function var_0_0.getGiftIds(arg_63_0)
	local var_63_0 = pg.dorm3d_gift.get_id_list_by_ship_group_id

	return table.mergeArray(var_63_0[0], var_63_0[arg_63_0.configId] or {})
end

function var_0_0.getCollectConfig(arg_64_0, arg_64_1)
	local var_64_0 = pg.dorm3D_collect[arg_64_0.configId]

	return var_64_0 and var_64_0[arg_64_1] or nil
end

var_0_0.ITEM_LOCK = 0
var_0_0.ITEM_UNLOCK = 1
var_0_0.ITEM_ACTIVE = 2
var_0_0.ITEM_FIRST = 3

function var_0_0.getTriggerableCollectItemDic(arg_65_0, arg_65_1)
	local var_65_0 = {}

	for iter_65_0, iter_65_1 in ipairs(pg.dorm3d_collection_template.get_id_list_by_dorm3d_belong[arg_65_0.configId]) do
		local var_65_1 = pg.dorm3d_collection_template[iter_65_1]

		if not arg_65_0:checkUnlockConfig(var_65_1.unlock) then
			var_65_0[iter_65_1] = var_0_0.ITEM_LOCK
		elseif arg_65_0.collectItemDic[iter_65_1] then
			var_65_0[iter_65_1] = var_0_0.ITEM_ACTIVE
		else
			var_65_0[iter_65_1] = var_0_0.ITEM_FIRST
		end
	end

	return var_65_0
end

function var_0_0.checkUnlockConfig(arg_66_0, arg_66_1)
	local var_66_0, var_66_1 = unpack(arg_66_1)

	return switch(var_66_0, {
		function()
			if arg_66_0.level >= var_66_1 then
				return true
			else
				return false, i18n("apartment_level_unenough", var_66_1)
			end
		end,
		function()
			if underscore.any(arg_66_0.furnitures, function(arg_69_0)
				return arg_69_0.configId == var_66_1
			end) then
				return true
			else
				return false, string.format("without dorm furniture:%d", var_66_1)
			end
		end,
		function()
			if getProxy(ApartmentProxy):isGiveGiftDone(var_66_1) then
				return true
			else
				return false, string.format("gift:%d didn't had given", var_66_1)
			end
		end,
		function()
			local var_71_0 = getProxy(CollectionProxy):getShipGroup(arg_66_0.configId)

			if var_71_0 and var_71_0.married > 0 then
				return true
			else
				return false, string.format("ship:%d was not married", arg_66_0.configId)
			end
		end
	}, function()
		return false, string.format("without unlock type:%d", var_66_0)
	end)
end

function var_0_0.getUnlockTip(arg_73_0, arg_73_1)
	local var_73_0, var_73_1 = unpack(arg_73_1)

	return switch(var_73_0, {
		function()
			return string.format("apartment level over level:%d to unlock", var_73_1)
		end,
		function()
			return string.format("fetch dorm furniture:%d to unlock", var_73_1)
		end,
		function()
			return string.format("fetch dorm furniture:%d to unlock", var_73_1)
		end,
		function()
			return string.format("marry with shipGroup:%d to unlock", arg_73_0.configId)
		end
	}, function()
		return string.format("undefined unlock config {%d, %d}", var_73_0, var_73_1)
	end)
end

function var_0_0.getNormalZoneNames(arg_79_0)
	return underscore(arg_79_0.zoneDic):chain():values():select(function(arg_80_0)
		return not arg_80_0:IsGlobal()
	end):map(function(arg_81_0)
		return arg_81_0:GetWatchCameraName()
	end):value()
end

function var_0_0.getZoneConfig(arg_82_0, arg_82_1, arg_82_2)
	local var_82_0 = arg_82_0.zoneDic[arg_82_1]

	return arg_82_0.zoneReplaceDic[arg_82_1][arg_82_2] or var_82_0:getConfig(arg_82_2)
end

function var_0_0.isUnlockTouchGame(arg_83_0)
	return true
end

function var_0_0.getDownloadNameList(arg_84_0)
	local var_84_0 = DormGroupConst.GetDownloadResourceDic()

	return var_84_0[string.lower(arg_84_0:getConfig("resource_name"))] or {}, var_84_0.common or {}
end

function var_0_0.needDownload(arg_85_0)
	local var_85_0, var_85_1 = arg_85_0:getDownloadNameList()

	return #var_85_0 > 0 or #var_85_1 > 0
end

function var_0_0.filterUnlockTalkList(arg_86_0, arg_86_1)
	return underscore.filter(arg_86_1, function(arg_87_0)
		return arg_86_0:checkUnlockConfig(pg.dorm3d_dialogue_group[arg_87_0].unlock)
	end)
end

function var_0_0.getIconTip(arg_88_0)
	if #arg_88_0:getForceEnterTalking() > 0 then
		return "main"
	elseif getProxy(ApartmentProxy):getApartmentGiftCount(arg_88_0.configId) then
		return "gift"
	elseif false then
		return "furnitrue"
	elseif false then
		return "talk"
	else
		return nil
	end
end

return var_0_0
