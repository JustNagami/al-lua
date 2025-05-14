local var_0_0 = class("AgoraPlaceableItem", import("...IslandDispatcher"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_0.super.Ctor(arg_1_0)

	arg_1_0.id = arg_1_1.id
	arg_1_0.position = Vector2.zero
	arg_1_0.rotation = Vector3.zero
	arg_1_0.size = arg_1_2 or Vector2.one
	arg_1_0.area = arg_1_0:GenArea()
end

function var_0_0.IsSame(arg_2_0, arg_2_1)
	return arg_2_0.position == arg_2_1.position and arg_2_0.rotation == arg_2_1.rotation
end

function var_0_0.Clear(arg_3_0)
	arg_3_0.position = Vector2.zero
	arg_3_0.rotation = Vector3.zero
end

function var_0_0.GetSize(arg_4_0)
	return arg_4_0.size
end

function var_0_0.GetSizeWithRotation(arg_5_0)
	if arg_5_0:IsForward() then
		return arg_5_0:GetSize()
	else
		return Vector2(arg_5_0.size.y, arg_5_0.size.x)
	end
end

function var_0_0.GetRotation(arg_6_0)
	return arg_6_0.rotation
end

function var_0_0.UpdateRotation(arg_7_0, arg_7_1)
	arg_7_0.rotation = arg_7_1

	arg_7_0:DispatchEvent(ISLAND_AGORA_EVT.ITEM_DIR_UPDATE, arg_7_0.rotation)
	arg_7_0:UpdatePosition(arg_7_0.position)
end

function var_0_0.UpdatePosition(arg_8_0, arg_8_1)
	arg_8_0.position = arg_8_1
	arg_8_0.area = arg_8_0:ReGenArea(true)

	arg_8_0:DispatchEvent(ISLAND_AGORA_EVT.ITEM_POSITION_UPDATE, arg_8_0.area)
end

function var_0_0.GetPosition(arg_9_0)
	return arg_9_0.position
end

function var_0_0.IsSquareSize(arg_10_0)
	return arg_10_0.size.x == arg_10_0.size.y
end

function var_0_0.ReGenArea(arg_11_0, arg_11_1)
	if arg_11_0:IsSquareSize() and not arg_11_1 then
		return arg_11_0:GetArea()
	end

	return arg_11_0:GenArea()
end

function var_0_0.IsForward(arg_12_0)
	return arg_12_0.rotation.y == 0 or arg_12_0.rotation.y == 180
end

function var_0_0.Rotation(arg_13_0)
	local var_13_0 = arg_13_0.rotation.y + 90

	if var_13_0 > 270 then
		var_13_0 = 0
	end

	arg_13_0:UpdateRotation(Vector3(0, var_13_0, 0))
end

function var_0_0.GenArea(arg_14_0)
	return arg_14_0:GenAreaByPosition(arg_14_0.position)
end

function var_0_0.GenAreaByPosition(arg_15_0, arg_15_1)
	if arg_15_0:IsForward() then
		return AgoraCalc.GetArea(arg_15_1, arg_15_0.size)
	else
		return AgoraCalc.GetArea(arg_15_1, Vector2(arg_15_0.size.y, arg_15_0.size.x))
	end
end

function var_0_0.GetArea(arg_16_0)
	return arg_16_0.area
end

function var_0_0.GetResPath(arg_17_0)
	assert(false)
end

function var_0_0.ToPlacementData(arg_18_0)
	return IslandPlacementData.New({
		id = arg_18_0.id,
		x = arg_18_0.position.x,
		y = arg_18_0.position.y,
		dir = arg_18_0.rotation.y / 90
	})
end

function var_0_0.FlushDataFromPlacementData(arg_19_0, arg_19_1)
	arg_19_0:UpdatePosition(arg_19_1:GetPosition())
	arg_19_0:UpdateRotation(arg_19_1:GetRotation())
end

return var_0_0
