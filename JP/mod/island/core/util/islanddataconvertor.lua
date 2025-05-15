local var_0_0 = class("IslandDataConvertor")

function var_0_0.Island2SceneData(arg_1_0)
	local var_1_0 = arg_1_0:GetMapId()
	local var_1_1 = arg_1_0:GetSpawnPointId()
	local var_1_2 = arg_1_0:GetVisitorAgency():GetPlayerList()
	local var_1_3 = pg.island_map[var_1_0]
	local var_1_4 = {}
	local var_1_5 = {}
	local var_1_6 = {}

	var_0_0.SceneData2IslandUnits(var_1_4, var_1_2, var_1_0, var_1_1)
	var_0_0.SystemData2IslandUnits(var_1_4, arg_1_0, var_1_0)
	var_0_0.CollectSystemData(var_1_5, var_1_6, arg_1_0, var_1_0)

	return {
		mapId = var_1_0,
		unitList = var_1_4,
		sceneName = var_1_3.sceneName,
		systemList = var_1_5,
		systemUnits = var_1_6
	}
end

function var_0_0.Island2SceneName(arg_2_0)
	local var_2_0 = arg_2_0:GetMapId()

	return pg.island_map[var_2_0].sceneName
end

function var_0_0.SystemData2IslandUnits(arg_3_0, arg_3_1, arg_3_2)
	var_0_0.CollectBuildingSystemUnits(arg_3_0, arg_3_1, arg_3_2)

	if arg_3_1:IsPrivate() then
		var_0_0.CollectOrderSystemUnits(arg_3_0, arg_3_1, arg_3_2)
	end
end

function var_0_0.CollectBuildingSystemUnits(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = arg_4_1:GetBuildingAgency():GetBuildings()

	for iter_4_0, iter_4_1 in pairs(var_4_0) do
		for iter_4_2, iter_4_3 in ipairs(iter_4_1:GetSlotUnitDataByModelData()) do
			local var_4_1 = iter_4_3[1]
			local var_4_2 = iter_4_3[2]
			local var_4_3 = var_0_0.ModelId2IslandUnit(var_4_1, var_4_2, arg_4_2)

			if var_4_3 then
				table.insert(arg_4_0, var_4_3)
			end
		end
	end
end

function var_0_0.CollectOrderSystemUnits(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = arg_5_1:GetOrderAgency():GetShipSlotList()

	for iter_5_0, iter_5_1 in pairs(var_5_0) do
		if not iter_5_1:IsLock() and iter_5_1:GetWorldObjId() > 0 then
			local var_5_1 = pg.island_world_objects[iter_5_1:GetWorldObjId()]

			if var_5_1 and var_5_1.mapId == arg_5_2 then
				local var_5_2 = {}
				local var_5_3 = var_0_0.WorldObj2IslandUnit(var_5_1, var_5_2)

				table.insert(arg_5_0, var_5_3)
			end
		end
	end
end

function var_0_0.CollectSystemData(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	local var_6_0 = pg.island_production_place.get_id_list_by_map_id[arg_6_3] or {}
	local var_6_1 = arg_6_2:GetBuildingAgency()

	for iter_6_0, iter_6_1 in ipairs(var_6_0) do
		local var_6_2 = IslandCharacterSystemVO.New(iter_6_1)
		local var_6_3 = var_6_1:GetBuilding(iter_6_1)
		local var_6_4 = 0

		if var_6_3 then
			local var_6_5 = var_6_3:GetShipIdAndAreaIdList()

			for iter_6_2, iter_6_3 in ipairs(var_6_5) do
				local var_6_6 = var_6_2:GetUnit(iter_6_3.ship_id, iter_6_3.area_id)

				table.insert(arg_6_1, var_6_6)

				var_6_4 = var_6_4 + 1
			end
		end

		var_6_2:SetkWorkerCnt(var_6_4)
		table.insert(arg_6_0, var_6_2)
	end
end

function var_0_0.SceneData2IslandUnits(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	local var_7_0 = pg.island_world_objects.get_id_list_by_mapId[arg_7_2] or {}

	for iter_7_0, iter_7_1 in ipairs(var_7_0) do
		local var_7_1 = pg.island_world_objects[iter_7_1]

		if var_7_1.unitId > 0 and var_7_1.gen_type ~= 1 then
			local var_7_2 = var_0_0.WorldObj2IslandUnit(var_7_1)

			table.insert(arg_7_0, var_7_2)
		end
	end

	for iter_7_2, iter_7_3 in pairs(arg_7_1) do
		local var_7_3 = var_0_0.PlayerData2IslandUnit(iter_7_3, arg_7_2, arg_7_3)

		table.insert(arg_7_0, var_7_3)
	end
end

function var_0_0.PlayerData2IslandUnit(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0
	local var_8_1
	local var_8_2 = pg.island_world_objects.get_id_list_by_mapId[arg_8_1] or {}

	for iter_8_0, iter_8_1 in ipairs(var_8_2) do
		local var_8_3 = pg.island_world_objects[iter_8_1]

		if var_8_3.unitId == 0 then
			var_8_0 = var_8_3

			break
		end
	end

	assert(var_8_0)

	if arg_8_0:IsSelf() then
		local var_8_4 = {
			id = arg_8_0.id,
			unitId = arg_8_0:GetShipId(),
			typ = IslandConst.UNIT_TYPE_PLAYER
		}
		local var_8_5 = arg_8_2 and pg.island_world_objects[arg_8_2] or var_8_0

		var_8_1 = var_0_0.WorldObj2IslandUnit(var_8_5, var_8_4)
	else
		local var_8_6 = {
			id = arg_8_0.id,
			unitId = arg_8_0:GetShipId(),
			typ = IslandConst.UNIT_TYPE_VISITOR
		}

		var_8_1 = var_0_0.WorldObj2IslandUnit(var_8_0, var_8_6)
	end

	return var_8_1
end

function var_0_0.ModelId2IslandUnit(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = pg.island_world_objects[arg_9_0] or {}
	local var_9_1

	if var_9_0.mapId == arg_9_2 then
		local var_9_2 = {
			unitId = arg_9_1
		}

		var_9_1 = var_0_0.WorldObj2IslandUnit(var_9_0, var_9_2)
	end

	return var_9_1
end

function var_0_0.WorldObj2IslandUnit(arg_10_0, arg_10_1)
	arg_10_1 = arg_10_1 or {}

	return (IslandUnitVO.New({
		id = arg_10_1.id or arg_10_0.id,
		modelId = arg_10_1.unitId or arg_10_0.unitId,
		type = arg_10_1.typ or arg_10_0.type,
		name = arg_10_0.name,
		position = arg_10_0.param.position,
		rotation = arg_10_0.param.rotation,
		scale = arg_10_0.param.scale or {
			1,
			1,
			1
		},
		behaviourTree = arg_10_0.behaviourTree
	}))
end

return var_0_0
