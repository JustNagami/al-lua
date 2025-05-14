local var_0_0 = class("IslandController", import(".IslandBaseController"))

function var_0_0.Init(arg_1_0)
	arg_1_0.sceneData = IslandDataConvertor.Island2SceneData(arg_1_0.island)
	arg_1_0.mapId = arg_1_0.sceneData.mapId
end

function var_0_0.SetUp(arg_2_0)
	for iter_2_0, iter_2_1 in ipairs(arg_2_0.sceneData.unitList) do
		arg_2_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, iter_2_1)
	end

	for iter_2_2, iter_2_3 in ipairs(arg_2_0.sceneData.systemList) do
		arg_2_0:NotifiyCore(ISLAND_EVT.GEN_SYSTEM, iter_2_3)
	end

	for iter_2_4, iter_2_5 in ipairs(arg_2_0.sceneData.systemUnits) do
		arg_2_0:NotifiyCore(ISLAND_EVT.GEN_SYSTEM_UNIT, iter_2_5)
	end

	arg_2_0.playerInputManager = PlayerInputManager.New(arg_2_0)
	arg_2_0.islandSyncMgr = IslandSyncMgr.New(arg_2_0)
end

function var_0_0.OnCoreInitFinish(arg_3_0)
	arg_3_0:NotifiyCore(ISLAND_EVT.INIT_FINISH)
	arg_3_0:NotifiyIsland(ISLAND_EX_EVT.INIT_FINISH)
	arg_3_0.islandSyncMgr:Init()
end

function var_0_0.GetMapID(arg_4_0)
	return arg_4_0.mapId
end

function var_0_0.AddListeners(arg_5_0)
	arg_5_0:AddIslandListener(IslandVisitorAgency.PLAYER_ADD, arg_5_0.OnPlayerAdd)
	arg_5_0:AddIslandListener(IslandVisitorAgency.PLAYER_EXIT, arg_5_0.OnPlayerExit)
	arg_5_0:AddIslandListener(IslandVisitorAgency.CHANGE_PLAYER_DRESS, arg_5_0.OnPlayerChangeDress)
	arg_5_0:AddIslandListener(IslandSyncMgr.ISLAND_SYNC_DATA_UPDATE, arg_5_0.OnSyncDataUpdate)
	arg_5_0:AddIslandListener(IslandSyncMgr.ISLAND_SYNC_OBJ_UPDATE, arg_5_0.OnSyncObjUpdate)
	arg_5_0:AddIslandListener(IslandBuildingAgency.SLOT_STATE_CHANGE, arg_5_0.OnReGenUnit)
	arg_5_0:AddIslandListener(IslandBuildingAgency.SLOT_UNIT_REMOVE, arg_5_0.OnRemoveUnit)
	arg_5_0:AddIslandListener(IslandStartDelegationCommand.START_DELEGATION, arg_5_0.OnStartDelegation)
	arg_5_0:AddIslandListener(IslandFinishDelegationCommand.END_DELEGATION, arg_5_0.OnEndDelegation)
end

function var_0_0.RemoveListeners(arg_6_0)
	arg_6_0:RemoveIslandListener(IslandVisitorAgency.PLAYER_ADD, arg_6_0.OnPlayerAdd)
	arg_6_0:RemoveIslandListener(IslandVisitorAgency.PLAYER_EXIT, arg_6_0.OnPlayerExit)
	arg_6_0:RemoveIslandListener(IslandVisitorAgency.CHANGE_PLAYER_DRESS, arg_6_0.OnPlayerChangeDress)
	arg_6_0:RemoveIslandListener(IslandSyncMgr.ISLAND_SYNC_DATA_UPDATE, arg_6_0.OnSyncDataUpdate)
	arg_6_0:RemoveIslandListener(IslandSyncMgr.ISLAND_SYNC_OBJ_UPDATE, arg_6_0.OnSyncObjUpdate)
	arg_6_0:RemoveIslandListener(IslandBuildingAgency.SLOT_STATE_CHANGE, arg_6_0.OnReGenUnit)
	arg_6_0:RemoveIslandListener(IslandBuildingAgency.SLOT_UNIT_REMOVE, arg_6_0.OnRemoveUnit)
	arg_6_0:RemoveIslandListener(IslandStartDelegationCommand.START_DELEGATION, arg_6_0.OnStartDelegation)
	arg_6_0:RemoveIslandListener(IslandFinishDelegationCommand.END_DELEGATION, arg_6_0.OnEndDelegation)
end

function var_0_0.OnPlayerAdd(arg_7_0, arg_7_1)
	local var_7_0 = IslandDataConvertor.PlayerData2IslandUnit(arg_7_1.player, arg_7_0.mapId)

	arg_7_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_7_0)
end

function var_0_0.OnPlayerExit(arg_8_0, arg_8_1)
	arg_8_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, arg_8_1.id)
end

function var_0_0.OnPlayerChangeDress(arg_9_0, arg_9_1)
	arg_9_0:NotifiyCore(ISLAND_EVT.CHANGE_DRESS, arg_9_1)
end

function var_0_0.OnReGenUnit(arg_10_0, arg_10_1)
	assert(arg_10_1.unitId and arg_10_1.modelId)

	local var_10_0 = IslandDataConvertor.ModelId2IslandUnit(arg_10_1.unitId, arg_10_1.modelId, arg_10_0.mapId)

	assert(var_10_0)

	if var_10_0 then
		arg_10_0:NotifiyCore(ISLAND_EVT.GEN_UNIT, var_10_0)
	end
end

function var_0_0.OnRemoveUnit(arg_11_0, arg_11_1)
	assert(arg_11_1.unitId)
	arg_11_0:NotifiyCore(ISLAND_EVT.RMOVE_UNIT, arg_11_1.unitId)
end

function var_0_0.OnSyncInteraction(arg_12_0, arg_12_1, arg_12_2)
	arg_12_0.islandSyncMgr:TryControlUnitInteraction(arg_12_1, arg_12_2)
end

function var_0_0.OnSyncDataUpdate(arg_13_0, arg_13_1)
	arg_13_0.islandSyncMgr:HandleSyncData(arg_13_1)
end

function var_0_0.OnSyncObjUpdate(arg_14_0, arg_14_1)
	arg_14_0.islandSyncMgr:HandleSyncObj(arg_14_1)
end

function var_0_0.Update(arg_15_0)
	arg_15_0.playerInputManager:Update()
	arg_15_0.islandSyncMgr:Update()
end

function var_0_0.OnDispose(arg_16_0)
	if arg_16_0.playerInputManager then
		arg_16_0.playerInputManager:Dispose()

		arg_16_0.playerInputManager = nil
	end

	if arg_16_0.islandSyncMgr then
		arg_16_0.islandSyncMgr:Dispose()

		arg_16_0.islandSyncMgr = nil
	end
end

function var_0_0.OnStartDelegation(arg_17_0, arg_17_1)
	local var_17_0

	for iter_17_0, iter_17_1 in ipairs(arg_17_0.sceneData.systemList) do
		if iter_17_1.id == arg_17_1.build_id then
			var_17_0 = iter_17_1

			break
		end
	end

	if not var_17_0 then
		return
	end

	local var_17_1 = var_17_0:GetUnit(arg_17_1.ship_id, arg_17_1.area_id, true)

	if var_17_1 then
		arg_17_0:NotifiyCore(ISLAND_EVT.GEN_SYSTEM_UNIT, var_17_1)
	end

	arg_17_0:NotifiyCore(ISLAND_EVT.START_DEGATION, arg_17_1)
end

function var_0_0.OnEndDelegation(arg_18_0, arg_18_1)
	local var_18_0

	for iter_18_0, iter_18_1 in ipairs(arg_18_0.sceneData.systemList) do
		if iter_18_1.id == arg_18_1.build_id then
			var_18_0 = iter_18_1

			break
		end
	end

	if not var_18_0 then
		return
	end

	local var_18_1 = var_18_0:GetUnit(arg_18_1.ship_id, arg_18_1.area_id, true)

	if var_18_1 then
		arg_18_0:NotifiyCore(ISLAND_EVT.REMOVE_SYSTEM_UNIT, var_18_1.id)
	end

	arg_18_0:NotifiyCore(ISLAND_EVT.END_DEGATION, arg_18_1)
end

return var_0_0
