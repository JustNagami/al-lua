local var_0_0 = class("IslandAgoraAgency", import(".IslandBaseAgency"))

var_0_0.AGORA_UPGRADE = "IslandAgoraAgency:AGORA_UPGRADE"
var_0_0.ADD_PLACEMENT = "IslandAgoraAgency:ADD_PLACEMENT"
var_0_0.DELETE_PLACEMENT = "IslandAgoraAgency:DELETE_PLACEMENT"

function var_0_0.OnInit(arg_1_0, arg_1_1)
	arg_1_0.level = arg_1_1.agora.level or 1
	arg_1_0.maxLevel = table.getCount(IslandConst.AGORA_LEVEL_2_SIZE)
	arg_1_0.furnitures = {}
	arg_1_0.placedList = {}

	for iter_1_0, iter_1_1 in ipairs(arg_1_1.agora.furniture_list or {}) do
		table.insert(arg_1_0.furnitures, IslandFurniture.New(iter_1_1))
	end

	for iter_1_2, iter_1_3 in ipairs(arg_1_1.agora.placed_list or {}) do
		table.insert(arg_1_0.placedList, IslandPlacementData.New(iter_1_3))
	end
end

function var_0_0.SetFurnitures(arg_2_0, arg_2_1)
	arg_2_0.furnitures = arg_2_1
end

function var_0_0.GetLevel(arg_3_0)
	return arg_3_0.level
end

function var_0_0.GetFurnitures(arg_4_0)
	return arg_4_0.furnitures
end

function var_0_0.GetPlacedList(arg_5_0)
	return arg_5_0.placedList
end

function var_0_0.UpdatePlacedList(arg_6_0, arg_6_1)
	arg_6_0.placedList = arg_6_1
end

function var_0_0.CanUpgrade(arg_7_0)
	return arg_7_0.level < arg_7_0.maxLevel
end

function var_0_0.Upgrade(arg_8_0)
	arg_8_0.level = arg_8_0.level + 1

	arg_8_0:DispatchEvent(var_0_0.AGORA_UPGRADE, arg_8_0.level)
end

function var_0_0.AddPlacements(arg_9_0, arg_9_1)
	for iter_9_0, iter_9_1 in ipairs(arg_9_1) do
		local var_9_0 = IslandPlacementData.New(iter_9_1)

		table.insert(arg_9_0.placedList, var_9_0)
		arg_9_0:DispatchEvent(var_0_0.ADD_PLACEMENT, var_9_0)
	end
end

function var_0_0.DeletePlacements(arg_10_0, arg_10_1)
	for iter_10_0, iter_10_1 in ipairs(arg_10_1) do
		local var_10_0 = _.detect(arg_10_0.placedList, function(arg_11_0)
			return arg_11_0.id == iter_10_1.id
		end)

		if var_10_0 then
			table.removebyvalue(arg_10_0.placedList, var_10_0)
			arg_10_0:DispatchEvent(var_0_0.DELETE_PLACEMENT, var_10_0.id)
		end
	end
end

function var_0_0.UpdatePlacements(arg_12_0, arg_12_1)
	arg_12_0:DeletePlacements(arg_12_1)
	arg_12_0:AddPlacements(arg_12_1)
end

return var_0_0
