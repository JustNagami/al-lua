local var_0_0 = class("ApartmentRoom", import(".BaseVO"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.id = arg_1_1.id
	arg_1_0.configId = arg_1_0.id
	arg_1_0.unlockCharacter = {}

	for iter_1_0, iter_1_1 in ipairs(arg_1_1.ships or {}) do
		arg_1_0.unlockCharacter[iter_1_1] = true
	end

	arg_1_0.furnitures = {}

	table.Ipairs(arg_1_1.furnitures or {}, function(arg_2_0, arg_2_1)
		arg_1_0.furnitures[arg_2_0] = Dorm3dFurniture.New({
			configId = arg_2_1.furniture_id,
			slotId = arg_2_1.slot_id
		})
	end)

	arg_1_0.slotDic = {}

	table.Ipairs(arg_1_0:GetSlotIDList(), function(arg_3_0, arg_3_1)
		arg_1_0.slotDic[arg_3_1] = Dorm3dFurnitureSlot.New({
			configId = arg_3_1
		})
	end)

	arg_1_0.zoneDic = {}
	arg_1_0.zoneReplaceDic = {}

	table.Ipairs(arg_1_0:GetZoneIDList(), function(arg_4_0, arg_4_1)
		local var_4_0 = Dorm3dZone.New({
			configId = arg_4_1
		})
		local var_4_1 = var_4_0:GetWatchCameraName()

		arg_1_0.zoneDic[var_4_1] = var_4_0
		arg_1_0.zoneReplaceDic[var_4_1] = {}

		var_4_0:SetSlots(_.map(var_4_0:GetSlotIDList(), function(arg_5_0)
			return arg_1_0.slotDic[arg_5_0]
		end))
	end)
	arg_1_0:UpdateFurnitureReplaceConfig()

	arg_1_0.cameraZones = _.map(arg_1_0:GetCameraZoneIDList(), function(arg_6_0)
		return Dorm3dCameraZone.New({
			configId = arg_6_0
		})
	end)
	arg_1_0.collectItemDic = {}

	for iter_1_2, iter_1_3 in ipairs(arg_1_1.collections or {}) do
		arg_1_0.collectItemDic[iter_1_3] = true
	end

	arg_1_0.shipArAnimationDic = {}

	local var_1_0 = arg_1_0:getConfig("ar_anim")

	if var_1_0 then
		for iter_1_4, iter_1_5 in ipairs(var_1_0) do
			local var_1_1 = iter_1_5[1]
			local var_1_2 = iter_1_5[2]
			local var_1_3 = _.map(var_1_2, function(arg_7_0)
				return Dorm3dCameraAnim.New({
					configId = arg_7_0
				})
			end)

			arg_1_0.shipArAnimationDic[var_1_1] = var_1_3
		end
	end
end

function var_0_0.bindConfigTable(arg_8_0)
	return pg.dorm3d_rooms
end

function var_0_0.getDownloadNameList(arg_9_0)
	local var_9_0 = arg_9_0:getConfig("type")

	if var_9_0 == 1 then
		return {}, DormGroupConst.GetDownloadResourceDic().common or {}
	elseif var_9_0 == 2 then
		local var_9_1 = DormGroupConst.GetDownloadResourceDic()

		return var_9_1[arg_9_0:getConfig("resource_name")] or {}, var_9_1.common or {}
	else
		assert(false)
	end
end

function var_0_0.needDownload(arg_10_0)
	local var_10_0, var_10_1 = arg_10_0:getDownloadNameList()

	return #var_10_0 > 0 or #var_10_1 > 0
end

function var_0_0.getDownloadNeedSize(arg_11_0)
	local var_11_0, var_11_1 = arg_11_0:getDownloadNameList()
	local var_11_2 = table.mergeArray(var_11_0, var_11_1)
	local var_11_3, var_11_4 = DormGroupConst.CalcDormListSize(var_11_2)

	return var_11_3, var_11_4
end

function var_0_0.getState(arg_12_0)
	if DormGroupConst.DormDownloadLock and DormGroupConst.DormDownloadLock.roomId == arg_12_0.configId then
		return "loading"
	elseif arg_12_0:needDownload() then
		return "download"
	else
		return "complete"
	end
end

function var_0_0.isPersonalRoom(arg_13_0)
	return arg_13_0:getConfig("type") == 2
end

function var_0_0.getPersonalGroupId(arg_14_0)
	assert(arg_14_0:isPersonalRoom())

	return arg_14_0:getConfig("character")[1]
end

function var_0_0.getInviteList(arg_15_0)
	return table.mergeArray(arg_15_0:getConfig("character"), arg_15_0:getConfig("character_pay"))
end

function var_0_0.getInteractRange(arg_16_0)
	local var_16_0, var_16_1 = unpack(arg_16_0:getConfig("character_range"))

	var_16_1 = var_16_1 or var_16_0

	return var_16_0, var_16_1
end

function var_0_0.getRoomName(arg_17_0)
	return arg_17_0:getConfig("room")
end

function var_0_0.GetZoneIDList(arg_18_0)
	return pg.dorm3d_zone_template.get_id_list_by_room_id[arg_18_0.configId] or {}
end

function var_0_0.GetSlotIDList(arg_19_0)
	return pg.dorm3d_furniture_slot_template.get_id_list_by_room_id[arg_19_0.configId] or {}
end

function var_0_0.GetFurnitureZoneIDList(arg_20_0)
	return arg_20_0:getConfig("furniture_zones")
end

function var_0_0.GetCameraZoneIDList(arg_21_0)
	return pg.dorm3d_camera_zone_template.get_id_list_by_room_id[arg_21_0.configId] or {}
end

function var_0_0.GetZones(arg_22_0)
	return underscore(arg_22_0.zoneDic):chain():values():sort(CompareFuncs({
		function(arg_23_0)
			return arg_23_0.configId
		end
	})):value()
end

function var_0_0.GetFurnitureZones(arg_24_0)
	local var_24_0 = arg_24_0:GetFurnitureZoneIDList()

	return underscore.map(var_24_0, function(arg_25_0)
		return (table.Find(arg_24_0.zoneDic, function(arg_26_0, arg_26_1)
			return arg_26_1:GetConfigID() == arg_25_0
		end))
	end)
end

function var_0_0.GetCameraZones(arg_27_0)
	return arg_27_0.cameraZones
end

function var_0_0.GetSlots(arg_28_0)
	return underscore(arg_28_0.slotDic):chain():values():sort(CompareFuncs({
		function(arg_29_0)
			return arg_29_0.configId
		end
	})):value()
end

function var_0_0.GetFurnitureIDList(arg_30_0)
	return pg.dorm3d_furniture_template.get_id_list_by_room_id[arg_30_0.configId]
end

function var_0_0.GetFurnitures(arg_31_0)
	return arg_31_0.furnitures
end

function var_0_0.AddFurnitureByID(arg_32_0, arg_32_1)
	table.insert(arg_32_0.furnitures, Dorm3dFurniture.New({
		configId = arg_32_1
	}))
end

function var_0_0.ReplaceFurnitures(arg_33_0, arg_33_1)
	_.each(arg_33_1, function(arg_34_0)
		arg_33_0:ReplaceFurniture(arg_34_0.slotId, arg_34_0.furnitureId)
	end)
	arg_33_0:UpdateFurnitureReplaceConfig()
end

function var_0_0.ReplaceFurniture(arg_35_0, arg_35_1, arg_35_2)
	if arg_35_1 > 0 then
		local var_35_0 = _.detect(arg_35_0.furnitures, function(arg_36_0)
			return arg_36_0:GetSlotID() == arg_35_1
		end)

		if var_35_0 then
			var_35_0:SetSlotID(0)
		end
	end

	if arg_35_2 > 0 then
		local var_35_1 = _.detect(arg_35_0.furnitures, function(arg_37_0)
			return arg_37_0:GetConfigID() == arg_35_2 and arg_37_0:GetSlotID() == 0
		end)

		if var_35_1 then
			var_35_1:SetSlotID(arg_35_1)
		end
	end
end

function var_0_0.IsFurnitureSetIn(arg_38_0, arg_38_1)
	for iter_38_0, iter_38_1 in ipairs(arg_38_0.furnitures) do
		if iter_38_1:GetConfigID() == arg_38_1 and iter_38_1.slotId > 0 then
			return true
		end
	end

	return false
end

function var_0_0.UpdateFurnitureReplaceConfig(arg_39_0)
	local var_39_0 = {}

	for iter_39_0, iter_39_1 in ipairs(arg_39_0.furnitures) do
		if iter_39_1.slotId ~= 0 then
			var_39_0[iter_39_1.slotId] = iter_39_1
		end
	end

	for iter_39_2, iter_39_3 in pairs(arg_39_0.zoneDic) do
		if iter_39_2 ~= "" then
			for iter_39_4, iter_39_5 in ipairs(iter_39_3:GetSlots()) do
				local var_39_1 = var_39_0[iter_39_5.configId]

				if var_39_1 and var_39_1:getConfig("touch_id") ~= "" then
					arg_39_0.zoneReplaceDic[iter_39_2].touch_id = var_39_1:getConfig("touch_id")
				end
			end
		end
	end
end

var_0_0.ITEM_LOCK = 0
var_0_0.ITEM_UNLOCK = 1
var_0_0.ITEM_ACTIVE = 2
var_0_0.ITEM_FIRST = 3

function var_0_0.getTriggerableCollectItemDic(arg_40_0, arg_40_1)
	local var_40_0 = {}

	for iter_40_0, iter_40_1 in ipairs(pg.dorm3d_collection_template.get_id_list_by_room_id[arg_40_0.configId] or {}) do
		local var_40_1 = pg.dorm3d_collection_template[iter_40_1]

		if var_40_1.time ~= 0 and var_40_1.time ~= arg_40_1 or not ApartmentProxy.CheckUnlockConfig(var_40_1.unlock) then
			var_40_0[iter_40_1] = var_0_0.ITEM_LOCK
		elseif arg_40_0.collectItemDic[iter_40_1] then
			var_40_0[iter_40_1] = var_0_0.ITEM_ACTIVE
		else
			var_40_0[iter_40_1] = var_0_0.ITEM_FIRST
		end
	end

	return var_40_0
end

function var_0_0.getNormalZoneNames(arg_41_0)
	return underscore(arg_41_0.zoneDic):chain():values():select(function(arg_42_0)
		return not arg_42_0:IsGlobal()
	end):map(function(arg_43_0)
		return arg_43_0:GetWatchCameraName()
	end):value()
end

function var_0_0.getZoneConfig(arg_44_0, arg_44_1, arg_44_2)
	local var_44_0 = arg_44_0.zoneDic[arg_44_1]

	return arg_44_0.zoneReplaceDic[arg_44_1][arg_44_2] or var_44_0:getConfig(arg_44_2)
end

function var_0_0.getApartmentZoneConfig(arg_45_0, arg_45_1, arg_45_2, arg_45_3)
	return Apartment.getGroupConfig(arg_45_3, arg_45_0:getZoneConfig(arg_45_1, arg_45_2))
end

function var_0_0.getAllARAnimationListByShip(arg_46_0, arg_46_1)
	return arg_46_0.shipArAnimationDic[arg_46_1]
end

return var_0_0
