local var_0_0 = class("IslandBuildingAgency", import(".IslandBaseAgency"))

var_0_0.SLOT_STATE_CHANGE = "IslandBuildingAgency:SLOT_STATE_CHANGE"
var_0_0.SLOT_UNIT_REMOVE = "IslandBuildingAgency:SLOT_UNIT_REMOVE"

function var_0_0.OnInit(arg_1_0, arg_1_1)
	arg_1_0.buildings = {}

	for iter_1_0, iter_1_1 in ipairs(arg_1_1.build_list or {}) do
		local var_1_0 = IslandBuilding.New(iter_1_1)

		arg_1_0.buildings[iter_1_1.id] = var_1_0
	end
end

function var_0_0.GetBuilding(arg_2_0, arg_2_1)
	return arg_2_0.buildings[arg_2_1]
end

function var_0_0.GetBuildings(arg_3_0)
	return arg_3_0.buildings
end

function var_0_0.GetBuildingList(arg_4_0)
	local var_4_0 = {}

	for iter_4_0, iter_4_1 in pairs(arg_4_0.buildings) do
		table.insert(var_4_0, iter_4_1)
	end

	return var_4_0
end

function var_0_0.UpdateBuilding(arg_5_0, arg_5_1)
	arg_5_0.buildings[arg_5_1.id] = arg_5_1
end

function var_0_0.UpdatePerSecond(arg_6_0)
	for iter_6_0, iter_6_1 in pairs(arg_6_0.buildings) do
		iter_6_1:UpdatePerSecond()
	end
end

function var_0_0.InitSlotRoleDataByAbility(arg_7_0, arg_7_1)
	local var_7_0 = pg.island_ability_template[arg_7_1].effect
	local var_7_1 = pg.island_production_slot[var_7_0].place
	local var_7_2 = arg_7_0:GetBuilding(var_7_1)

	if not var_7_2 then
		warning("需要先解锁产地,再解锁产地上的槽位")

		return
	end

	var_7_2:InitSlotRoleDataByAbility(var_7_0)
end

function var_0_0.InitBuildData(arg_8_0, arg_8_1)
	if arg_8_0.buildings[arg_8_1.id] then
		warning("产地已经解锁过了,下发的产地id是" .. arg_8_1.id)

		return
	end

	local var_8_0 = IslandBuilding.New(arg_8_1)

	arg_8_0.buildings[arg_8_1.id] = var_8_0
end

function var_0_0.GetCurrentMapCheckWorldObjectList(arg_9_0)
	local var_9_0 = arg_9_0.host:GetMapId()
	local var_9_1 = {}

	for iter_9_0, iter_9_1 in pairs(arg_9_0:GetBuildings()) do
		if iter_9_1:getConfigTable().map_id == var_9_0 then
			local var_9_2 = iter_9_1:GetCheckWorldIdByModelData()

			var_9_1 = table.mergeArray(var_9_1, var_9_2)
		end
	end

	return var_9_1
end

function var_0_0.GetMinimumDelegationCompletionTimeByMapId(arg_10_0, arg_10_1)
	local var_10_0 = pg.island_production_place.get_id_list_by_map_id[arg_10_1] or {}
	local var_10_1

	for iter_10_0, iter_10_1 in ipairs(var_10_0) do
		local var_10_2 = arg_10_0.buildings[iter_10_1]

		if var_10_2 then
			local var_10_3 = var_10_2:GetMinRoleDeleGationTime()

			if var_10_3 ~= -1 then
				var_10_1 = var_10_1 and math.min(var_10_3, var_10_1) or var_10_3
			end
		end
	end

	return var_10_1 and var_10_1 or -1
end

function var_0_0.GetDelegationSlotDataByTechId(arg_11_0, arg_11_1)
	local var_11_0 = arg_11_0.buildings[IslandTechnologyAgency.PLACE_ID]

	if not var_11_0 then
		return
	end

	local var_11_1 = pg.island_technology_template[arg_11_1].formula_id

	return var_11_0:GetDelegationSlotDataByFormulaId(var_11_1)
end

return var_0_0
