local var_0_0 = class("ApartmentRoom", import(".BaseVO"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.id = arg_1_1.id
	arg_1_0.configId = arg_1_0.id
end

function var_0_0.bindConfigTable(arg_2_0)
	return pg.dorm3d_rooms
end

function var_0_0.getDownloadNameList(arg_3_0)
	local var_3_0 = arg_3_0:getConfig("type")

	if var_3_0 == 1 then
		return {}, DormGroupConst.GetDownloadResourceDic().common or {}
	elseif var_3_0 == 2 then
		local var_3_1 = arg_3_0:getApartmentId()
		local var_3_2 = pg.dorm3d_dorm_template[var_3_1]
		local var_3_3 = DormGroupConst.GetDownloadResourceDic()

		return var_3_3[string.lower(var_3_2.resource_name)] or {}, var_3_3.common or {}
	else
		assert(false)
	end
end

function var_0_0.getState(arg_4_0)
	if DormGroupConst.DormDownloadLock and DormGroupConst.DormDownloadLock.roomId == arg_4_0.configId then
		return "loading"
	else
		local var_4_0, var_4_1 = arg_4_0:getDownloadNameList()

		if #var_4_0 > 0 or #var_4_1 > 0 then
			return "download"
		else
			return "complete"
		end
	end
end

function var_0_0.getApartmentId(arg_5_0)
	assert(arg_5_0:getConfig("type") == 2)

	return arg_5_0:getConfig("character")[1]
end

function var_0_0.getApartment(arg_6_0)
	return getProxy(ApartmentProxy):getApartment(arg_6_0:getApartmentId())
end

function var_0_0.getInteractRange(arg_7_0)
	local var_7_0, var_7_1 = unpack(arg_7_0:getConfig("character_range"))

	var_7_1 = var_7_1 or var_7_0

	return var_7_0, var_7_1
end

function var_0_0.getRoomName(arg_8_0)
	return arg_8_0:getConfig("room")
end

return var_0_0
