local var_0_0 = class("AgoraPlaceableArea", import("...IslandDispatcher"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_0.super.Ctor(arg_1_0)

	arg_1_0.size = arg_1_1
	arg_1_0.placedlist = arg_1_2
	arg_1_0.map = arg_1_0:GenMap()
end

function var_0_0.GetSize(arg_2_0)
	return arg_2_0.size
end

function var_0_0.UpdateSize(arg_3_0, arg_3_1)
	arg_3_0.size = arg_3_1

	local var_3_0 = arg_3_0:GenMap()
	local var_3_1 = arg_3_0.map

	for iter_3_0, iter_3_1 in pairs(var_3_0) do
		for iter_3_2, iter_3_3 in pairs(iter_3_1) do
			if var_3_1[iter_3_0] ~= nil and var_3_1[iter_3_0][iter_3_2] ~= nil then
				var_3_0[iter_3_0][iter_3_2] = var_3_1[iter_3_0][iter_3_2]
			end
		end
	end

	arg_3_0.map = var_3_0

	arg_3_0:DispatchEvent(ISLAND_AGORA_EVT.MAP_SIZE_UPDATE, arg_3_0.size)
end

function var_0_0.GetRangeCoord(arg_4_0)
	return (AgoraCalc.GetSizeCoord(arg_4_0.size))
end

function var_0_0.InRange(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = arg_5_0:GetRangeCoord()

	return arg_5_1 >= var_5_0.x and arg_5_1 <= var_5_0.z and arg_5_2 <= var_5_0.y and arg_5_2 >= var_5_0.w
end

function var_0_0.ClampRange(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	local var_6_0 = arg_6_3:GetSizeWithRotation()
	local var_6_1 = AgoraCalc.GetSizeCoord(var_6_0)
	local var_6_2 = arg_6_0:GetRangeCoord()
	local var_6_3 = var_6_2.x - var_6_1.x
	local var_6_4 = var_6_2.z - var_6_1.z
	local var_6_5 = var_6_2.w - var_6_1.w
	local var_6_6 = var_6_2.y - var_6_1.y

	arg_6_1 = Mathf.Clamp(arg_6_1, var_6_3, var_6_4)
	arg_6_2 = Mathf.Clamp(arg_6_2, var_6_5, var_6_6)

	return Vector2(arg_6_1, arg_6_2)
end

function var_0_0.GenMap(arg_7_0)
	local var_7_0 = {}
	local var_7_1 = AgoraCalc.GetArea(Vector2.zero, arg_7_0.size)

	for iter_7_0, iter_7_1 in ipairs(var_7_1) do
		local var_7_2 = iter_7_1.x
		local var_7_3 = iter_7_1.y

		if not var_7_0[var_7_2] then
			var_7_0[var_7_2] = {}
		end

		var_7_0[var_7_2][var_7_3] = true
	end

	return var_7_0
end

function var_0_0.IsUsing(arg_8_0, arg_8_1)
	return arg_8_0.placedlist[arg_8_1] ~= nil
end

function var_0_0.GetPlacedlist(arg_9_0)
	return arg_9_0.placedlist
end

function var_0_0.AddItem(arg_10_0, arg_10_1)
	local var_10_0 = arg_10_1:GetArea()

	for iter_10_0, iter_10_1 in ipairs(var_10_0) do
		arg_10_0:UpdateMapState(iter_10_1.x, iter_10_1.y, false)
	end

	arg_10_0.placedlist[arg_10_1.id] = arg_10_1
end

function var_0_0.RemoveItem(arg_11_0, arg_11_1)
	local var_11_0 = arg_11_1:GetArea()

	for iter_11_0, iter_11_1 in ipairs(var_11_0) do
		arg_11_0:UpdateMapState(iter_11_1.x, iter_11_1.y, true)
	end

	arg_11_0.placedlist[arg_11_1.id] = nil
end

function var_0_0.GetPlacedItem(arg_12_0, arg_12_1)
	return arg_12_0.placedlist[arg_12_1]
end

function var_0_0.IsEmptyArea(arg_13_0, arg_13_1)
	return _.all(arg_13_1, function(arg_14_0)
		return arg_13_0:InRange(arg_14_0.x, arg_14_0.y) and arg_13_0.map[arg_14_0.x][arg_14_0.y] == true
	end)
end

function var_0_0.GetItemInArea(arg_15_0, arg_15_1)
	local var_15_0 = _.detect(arg_15_1, function(arg_16_0)
		return arg_15_0.map[arg_16_0.x][arg_16_0.y] == false
	end)

	if var_15_0 then
		local var_15_1 = arg_15_0:GetItemInPosition(var_15_0)

		if var_15_1 then
			return var_15_1
		end
	end

	return nil
end

function var_0_0.FindEmptyArea4Item(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = {}
	local var_17_1 = {}

	table.insert(var_17_0, arg_17_1)

	while #var_17_0 > 0 do
		local var_17_2 = table.remove(var_17_0, 1)
		local var_17_3 = arg_17_2:GenAreaByPosition(var_17_2)

		if arg_17_0:IsEmptyArea(var_17_3) then
			return var_17_2
		end

		table.insert(var_17_1, var_17_2)

		for iter_17_0, iter_17_1 in ipairs({
			Vector2(var_17_2.x, var_17_2.y - 1),
			Vector2(var_17_2.x - 1, var_17_2.y),
			Vector2(var_17_2.x + 1, var_17_2.y),
			Vector2(var_17_2.x, var_17_2.y + 1)
		}) do
			if not table.contains(var_17_1, iter_17_1) and arg_17_0:InRange(iter_17_1.x, iter_17_1.y) then
				table.insert(var_17_0, iter_17_1)
			end
		end
	end
end

function var_0_0.GetItemInPosition(arg_18_0, arg_18_1)
	if not arg_18_0:InRange(arg_18_1.x, arg_18_1.y) then
		return nil
	end

	if arg_18_0.map[arg_18_1.x][arg_18_1.y] == false then
		return arg_18_0:FindItemInPosition(arg_18_1)
	end

	return nil
end

function var_0_0.FindItemInPosition(arg_19_0, arg_19_1)
	for iter_19_0, iter_19_1 in pairs(arg_19_0.placedlist) do
		local var_19_0 = iter_19_1:GetArea()

		for iter_19_2, iter_19_3 in ipairs(var_19_0) do
			if iter_19_3 == arg_19_1 then
				return iter_19_1
			end
		end
	end

	return nil
end

function var_0_0.UpdateMapState(arg_20_0, arg_20_1, arg_20_2, arg_20_3)
	arg_20_0.map[arg_20_1][arg_20_2] = arg_20_3

	arg_20_0:DispatchEvent(ISLAND_AGORA_EVT.MAP_STATE_UPDATE, {
		position = Vector2(arg_20_1, arg_20_2),
		flag = arg_20_3
	})
end

return var_0_0
