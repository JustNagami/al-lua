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

function var_0_0.getState(arg_10_0)
	if DormGroupConst.DormDownloadLock and DormGroupConst.DormDownloadLock.roomId == arg_10_0.configId then
		return "loading"
	else
		local var_10_0, var_10_1 = arg_10_0:getDownloadNameList()

		if #var_10_0 > 0 or #var_10_1 > 0 then
			return "download"
		else
			return "complete"
		end
	end
end

function var_0_0.isPersonalRoom(arg_11_0)
	return arg_11_0:getConfig("type") == 2
end

function var_0_0.getPersonalGroupId(arg_12_0)
	assert(arg_12_0:isPersonalRoom())

	return arg_12_0:getConfig("character")[1]
end

function var_0_0.getInviteList(arg_13_0)
	return table.mergeArray(arg_13_0:getConfig("character"), arg_13_0:getConfig("character_pay"))
end

function var_0_0.getInteractRange(arg_14_0)
	local var_14_0, var_14_1 = unpack(arg_14_0:getConfig("character_range"))

	var_14_1 = var_14_1 or var_14_0

	return var_14_0, var_14_1
end

function var_0_0.getRoomName(arg_15_0)
	return arg_15_0:getConfig("room")
end

function var_0_0.GetZoneIDList(arg_16_0)
	return pg.dorm3d_zone_template.get_id_list_by_room_id[arg_16_0.configId] or {}
end

function var_0_0.GetSlotIDList(arg_17_0)
	return pg.dorm3d_furniture_slot_template.get_id_list_by_room_id[arg_17_0.configId] or {}
end

function var_0_0.GetFurnitureZoneIDList(arg_18_0)
	return arg_18_0:getConfig("furniture_zones")
end

function var_0_0.GetCameraZoneIDList(arg_19_0)
	return pg.dorm3d_camera_zone_template.get_id_list_by_room_id[arg_19_0.configId] or {}
end

function var_0_0.GetZones(arg_20_0)
	return underscore(arg_20_0.zoneDic):chain():values():sort(CompareFuncs({
		function(arg_21_0)
			return arg_21_0.configId
		end
	})):value()
end

function var_0_0.GetFurnitureZones(arg_22_0)
	local var_22_0 = arg_22_0:GetFurnitureZoneIDList()

	return underscore.map(var_22_0, function(arg_23_0)
		return (table.Find(arg_22_0.zoneDic, function(arg_24_0, arg_24_1)
			return arg_24_1:GetConfigID() == arg_23_0
		end))
	end)
end

function var_0_0.GetCameraZones(arg_25_0)
	return arg_25_0.cameraZones
end

function var_0_0.GetSlots(arg_26_0)
	return underscore(arg_26_0.slotDic):chain():values():sort(CompareFuncs({
		function(arg_27_0)
			return arg_27_0.configId
		end
	})):value()
end

function var_0_0.GetFurnitureIDList(arg_28_0)
	return pg.dorm3d_furniture_template.get_id_list_by_room_id[arg_28_0.configId]
end

function var_0_0.GetFurnitures(arg_29_0)
	return arg_29_0.furnitures
end

function var_0_0.AddFurnitureByID(arg_30_0, arg_30_1)
	table.insert(arg_30_0.furnitures, Dorm3dFurniture.New({
		configId = arg_30_1
	}))
end

function var_0_0.ReplaceFurnitures(arg_31_0, arg_31_1)
	_.each(arg_31_1, function(arg_32_0)
		arg_31_0:ReplaceFurniture(arg_32_0.slotId, arg_32_0.furnitureId)
	end)
	arg_31_0:UpdateFurnitureReplaceConfig()
end

function var_0_0.ReplaceFurniture(arg_33_0, arg_33_1, arg_33_2)
	if arg_33_1 > 0 then
		local var_33_0 = _.detect(arg_33_0.furnitures, function(arg_34_0)
			return arg_34_0:GetSlotID() == arg_33_1
		end)

		if var_33_0 then
			var_33_0:SetSlotID(0)
		end
	end

	if arg_33_2 > 0 then
		local var_33_1 = _.detect(arg_33_0.furnitures, function(arg_35_0)
			return arg_35_0:GetConfigID() == arg_33_2 and arg_35_0:GetSlotID() == 0
		end)

		if var_33_1 then
			var_33_1:SetSlotID(arg_33_1)
		end
	end
end

function var_0_0.IsFurnitureSetIn(arg_36_0, arg_36_1)
	for iter_36_0, iter_36_1 in ipairs(arg_36_0.furnitures) do
		if iter_36_1:GetConfigID() == arg_36_1 and iter_36_1.slotId > 0 then
			return true
		end
	end

	return false
end

function var_0_0.UpdateFurnitureReplaceConfig(arg_37_0)
	local var_37_0 = {}

	for iter_37_0, iter_37_1 in ipairs(arg_37_0.furnitures) do
		if iter_37_1.slotId ~= 0 then
			var_37_0[iter_37_1.slotId] = iter_37_1
		end
	end

	for iter_37_2, iter_37_3 in pairs(arg_37_0.zoneDic) do
		if iter_37_2 ~= "" then
			for iter_37_4, iter_37_5 in ipairs(iter_37_3:GetSlots()) do
				local var_37_1 = var_37_0[iter_37_5.configId]

				if var_37_1 then
					if var_37_1:getConfig("touch_id") ~= "" then
						arg_37_0.zoneReplaceDic[iter_37_2].touch_id = var_37_1:getConfig("touch_id")
					end

					if var_37_1:getConfig("lazy_action") ~= "" then
						arg_37_0.zoneReplaceDic[iter_37_2].lazy_action = var_37_1:getConfig("lazy_action")
					end
				end
			end
		end
	end
end

var_0_0.ITEM_LOCK = 0
var_0_0.ITEM_UNLOCK = 1
var_0_0.ITEM_ACTIVE = 2
var_0_0.ITEM_FIRST = 3

function var_0_0.getTriggerableCollectItemDic(arg_38_0, arg_38_1)
	local var_38_0 = {}

	for iter_38_0, iter_38_1 in ipairs(pg.dorm3d_collection_template.get_id_list_by_room_id[arg_38_0.configId] or {}) do
		local var_38_1 = pg.dorm3d_collection_template[iter_38_1]

		if var_38_1.time ~= 0 and var_38_1.time ~= arg_38_1 or not ApartmentProxy.CheckUnlockConfig(var_38_1.unlock) then
			var_38_0[iter_38_1] = var_0_0.ITEM_LOCK
		elseif arg_38_0.collectItemDic[iter_38_1] then
			var_38_0[iter_38_1] = var_0_0.ITEM_ACTIVE
		else
			var_38_0[iter_38_1] = var_0_0.ITEM_FIRST
		end
	end

	return var_38_0
end

function var_0_0.getNormalZoneNames(arg_39_0)
	return underscore(arg_39_0.zoneDic):chain():values():select(function(arg_40_0)
		return not arg_40_0:IsGlobal()
	end):map(function(arg_41_0)
		return arg_41_0:GetWatchCameraName()
	end):value()
end

function var_0_0.getZoneConfig(arg_42_0, arg_42_1, arg_42_2)
	local var_42_0 = arg_42_0.zoneDic[arg_42_1]

	return arg_42_0.zoneReplaceDic[arg_42_1][arg_42_2] or var_42_0:getConfig(arg_42_2)
end

function var_0_0.getApartmentZoneConfig(arg_43_0, arg_43_1, arg_43_2, arg_43_3)
	return Apartment.getGroupConfig(arg_43_3, arg_43_0:getZoneConfig(arg_43_1, arg_43_2))
end

function var_0_0.getAllARAnimationListByShip(arg_44_0, arg_44_1)
	return arg_44_0.shipArAnimationDic[arg_44_1]
end

return var_0_0
