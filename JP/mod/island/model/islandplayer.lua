local var_0_0 = class("IslandPlayer")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.id = arg_1_1.id
	arg_1_0.name = arg_1_1.name
	arg_1_0.position = Vector3.zero
	arg_1_0.rotation = Vector3.zero

	arg_1_0:InitDressupData()
end

function var_0_0.GetShipId(arg_2_0)
	if arg_2_0:IsSelf() then
		return IslandConst.SPAWN_PLAYER_ID
	else
		return IslandConst.SPAWN_PLAYER_ID_OTHER
	end
end

function var_0_0.IsSelf(arg_3_0)
	return arg_3_0.id == getProxy(PlayerProxy):getRawData().id
end

function var_0_0.GetName(arg_4_0)
	return arg_4_0.name
end

function var_0_0.SetPosition(arg_5_0, arg_5_1)
	arg_5_0.position = arg_5_1
end

function var_0_0.SetRotation(arg_6_0, arg_6_1)
	arg_6_0.rotation = arg_6_1
end

function var_0_0.UpdateName(arg_7_0, arg_7_1)
	arg_7_0.name = arg_7_1
end

function var_0_0.InitDressupData(arg_8_0)
	arg_8_0.dressupData = {}
end

function var_0_0.ChangeDressUpByType(arg_9_0, arg_9_1, arg_9_2)
	arg_9_0.dressupData[arg_9_1] = arg_9_2
end

function var_0_0.GetDressupData(arg_10_0)
	return arg_10_0.dressupData
end

return var_0_0
