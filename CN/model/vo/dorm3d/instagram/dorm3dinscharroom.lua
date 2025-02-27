local var_0_0 = class("Dorm3dInsCharRoom", import(".Dorm3dInsRoom"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0, arg_1_1)

	arg_1_0.groupId = arg_1_0:GetConfig("character")[1]
	arg_1_0.isCare = getProxy(Dorm3dChatProxy):GetChatCare(arg_1_0.groupId) == 1
end

function var_0_0.GetName(arg_2_0)
	return ShipGroup.getDefaultShipNameByGroupID(arg_2_0.groupId)
end

function var_0_0.GetFurnitureNum(arg_3_0)
	local var_3_0 = _.select(pg.dorm3d_furniture_template.get_id_list_by_room_id[arg_3_0.id], function(arg_4_0)
		return pg.dorm3d_furniture_template[arg_4_0].is_special == 1
	end)
	local var_3_1 = getProxy(ApartmentProxy)

	return _.reduce(var_3_0, 0, function(arg_5_0, arg_5_1)
		return arg_5_0 + var_3_1:GetFurnitureShopCount(arg_5_1)
	end)
end

function var_0_0.GetGiftNum(arg_6_0)
	local var_6_0 = pg.dorm3d_gift.get_id_list_by_ship_group_id[arg_6_0.groupId]
	local var_6_1 = getProxy(ApartmentProxy)

	return _.reduce(var_6_0, 0, function(arg_7_0, arg_7_1)
		return arg_7_0 + var_6_1:GetGiftShopCount(arg_7_1)
	end)
end

function var_0_0.GetLastVisit(arg_8_0)
	local var_8_0 = getProxy(ApartmentProxy):getApartment(arg_8_0.groupId)
	local var_8_1 = var_8_0 and var_8_0.visitTime or 0

	if var_8_1 == 0 then
		return i18n("dorm3d_privatechat_no_visit_time")
	end

	local var_8_2 = math.floor((pg.TimeMgr.GetInstance():GetServerTime() - var_8_1) / 86400)

	return var_8_2 == 0 and i18n("dorm3d_privatechat_visit_time_now") or i18n("dorm3d_privatechat_visit_time", var_8_2)
end

function var_0_0.GetFavorLevel(arg_9_0)
	local var_9_0 = getProxy(ApartmentProxy):getApartment(arg_9_0.groupId)

	return var_9_0 and var_9_0.level or 0
end

function var_0_0.GetCard(arg_10_0)
	local var_10_0 = Apartment.New({
		ship_group = arg_10_0.groupId
	}):GetSkinModelID(arg_10_0:GetConfig("tag"))

	return string.format("dorm3dselect/apartment_skin_%d", var_10_0)
end

function var_0_0.IsCare(arg_11_0)
	return arg_11_0.isCare
end

function var_0_0.SetCare(arg_12_0, arg_12_1)
	arg_12_0.isCare = arg_12_1 == 1

	getProxy(Dorm3dChatProxy):SetChatCare(arg_12_0.groupId, arg_12_1)
end

function var_0_0.ShouldTip(arg_13_0)
	local var_13_0 = arg_13_0:GetInsContent()
	local var_13_1 = arg_13_0:GetChatContent()
	local var_13_2 = arg_13_0:GetChatContent()

	return var_13_0 or var_13_1 or var_13_2
end

function var_0_0.GetInsContent(arg_14_0)
	if arg_14_0:IsDownloaded() and getProxy(Dorm3dInsProxy):AnyInstagramShouldTip(arg_14_0.groupId) then
		return true, i18n("dorm3d_privatechat_new_topics", arg_14_0:GetConfig("room"))
	else
		return false, i18n("dorm3d_privatechat_nonew_topics")
	end
end

function var_0_0.GetPhoneContent(arg_15_0)
	if arg_15_0:IsDownloaded() and getProxy(Dorm3dInsProxy):ShoudTipPhoneById(arg_15_0.groupId) then
		return true, i18n("dorm3d_privatechat_new_calls")
	else
		return false, i18n("dorm3d_privatechat_nonew_calls")
	end
end

function var_0_0.GetChatContent(arg_16_0)
	if arg_16_0:IsDownloaded() and getProxy(Dorm3dChatProxy):ShouldShowShipTip(arg_16_0.groupId) then
		return true, i18n("dorm3d_privatechat_nonew_messages")
	else
		return false, i18n("dorm3d_privatechat_new_messages")
	end
end

return var_0_0
