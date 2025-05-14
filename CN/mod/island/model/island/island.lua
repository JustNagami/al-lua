local var_0_0 = class("Island", import(".BaseIsland"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0, arg_1_1.public_data)
	arg_1_0:InitPrivateData(arg_1_1.private_data)

	local var_1_0 = {}

	for iter_1_0, iter_1_1 in ipairs(arg_1_1.private_data.furniture_list or {}) do
		table.insert(var_1_0, IslandFurniture.New(iter_1_1))
	end

	arg_1_0:GetAgoraAgency():SetFurnitures(var_1_0)
	arg_1_0:GetInventoryAgency():SetLevel(arg_1_1.public_data.storage_level)
end

function var_0_0.InitPrivateData(arg_2_0, arg_2_1)
	arg_2_0.accessAgency = IslandAccessAgency.New(arg_2_0, arg_2_1)
	arg_2_0.inventoryAgency = IslandInventoryAgency.New(arg_2_0, arg_2_1)
	arg_2_0.orderAgency = IslandOrderAgency.New(arg_2_0, arg_2_1)
	arg_2_0.shopAgency = IslandShopAgency.New(arg_2_0, arg_2_1)
	arg_2_0.buildingAgency = IslandBuildingAgency.New(arg_2_0, arg_2_1)
	arg_2_0.taskAgency = IslandTaskAgency.New(arg_2_0, arg_2_1)
end

function var_0_0.IsPrivate(arg_3_0)
	return true
end

function var_0_0.GetAccessAgency(arg_4_0)
	return arg_4_0.accessAgency
end

function var_0_0.GetInventoryAgency(arg_5_0)
	return arg_5_0.inventoryAgency
end

function var_0_0.GetOrderAgency(arg_6_0)
	return arg_6_0.orderAgency
end

function var_0_0.GetShopAgency(arg_7_0)
	return arg_7_0.shopAgency
end

function var_0_0.GetTaskAgency(arg_8_0)
	return arg_8_0.taskAgency
end

function var_0_0.GetBuildingAgency(arg_9_0)
	return arg_9_0.buildingAgency
end

function var_0_0.UpdatePerDay(arg_10_0)
	var_0_0.super.UpdatePerDay(arg_10_0)
	arg_10_0:GetOrderAgency():UpdatePerDay()
	arg_10_0:GetTaskAgency():UpdatePerDay()
end

function var_0_0.UpdatePerSecond(arg_11_0)
	var_0_0.super.UpdatePerDay(arg_11_0)

	if arg_11_0.buildingAgency then
		arg_11_0.buildingAgency:UpdatePerSecond()
	end

	arg_11_0:GetTaskAgency():UpdatePerSecond()
end

return var_0_0
