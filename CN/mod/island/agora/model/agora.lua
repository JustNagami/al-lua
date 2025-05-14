local var_0_0 = class("Agora", import(".AgoraPlaceableArea"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0, arg_1_1.size, arg_1_1.placedlist)

	arg_1_0.placeableList = arg_1_1.placeableList
end

function var_0_0.AddPlaceableList(arg_2_0, arg_2_1)
	arg_2_0.placeableList[arg_2_1.id] = arg_2_1
end

function var_0_0.GetPlaceableList(arg_3_0)
	return arg_3_0.placeableList
end

function var_0_0.GetPlaceableItem(arg_4_0, arg_4_1)
	return arg_4_0.placeableList[arg_4_1]
end

function var_0_0.PlaceItem(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = arg_5_0.placeableList[arg_5_1]

	var_5_0:UpdatePosition(arg_5_2)
	arg_5_0:AddItem(var_5_0)
	arg_5_0:DispatchEvent(ISLAND_AGORA_EVT.GEN_ITEM, var_5_0)
end

function var_0_0.UnPlaceItem(arg_6_0, arg_6_1)
	local var_6_0 = arg_6_0.placeableList[arg_6_1]

	arg_6_0:RemoveItem(var_6_0)
	arg_6_0:DispatchEvent(ISLAND_AGORA_EVT.REMOVE_ITEM, var_6_0)
end

return var_0_0
