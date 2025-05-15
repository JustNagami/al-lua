local var_0_0 = class("IslandPlayerDataMonitor", import(".IslandBaseMonitor"))

function var_0_0.register(arg_1_0)
	arg_1_0:on(21206, function(arg_2_0)
		if not arg_1_0:IsSelf(arg_2_0.island_id) then
			return
		end

		for iter_2_0, iter_2_1 in ipairs(arg_2_0.player_list) do
			arg_1_0:HandlePlayerData(iter_2_1)
		end
	end)
	arg_1_0:on(21309, function(arg_3_0)
		if not arg_1_0:IsSelf(arg_3_0.island_id) then
			return
		end

		arg_1_0:HandleAgoraData(arg_3_0.update_list, arg_3_0.delete_list, arg_3_0.add_list)
	end)
	arg_1_0:on(21407, function(arg_4_0)
		if not arg_1_0:IsSelf(arg_4_0.island_id) then
			return
		end

		arg_1_0:HandleOrderData(arg_4_0.order_info)
	end)
	arg_1_0:on(21040, function(arg_5_0)
		arg_1_0:HandleTaskData(arg_5_0.task_list)
	end)
	arg_1_0:on(21518, function(arg_6_0)
		arg_1_0:HandleSlotFormulaData(arg_6_0)
	end)
	arg_1_0:on(21519, function(arg_7_0)
		arg_1_0:HandleBuildUnlockData(arg_7_0)
	end)
end

function var_0_0.HandleAgoraData(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	if getProxy(IslandProxy):GetIsland().id == arg_8_0:GetIsland().id then
		return
	end

	local var_8_0 = arg_8_0:GetIsland():GetAgoraAgency()

	var_8_0:DeletePlacements(arg_8_2)
	var_8_0:AddPlacements(arg_8_3)
	var_8_0:UpdatePlacements(arg_8_1)
end

function var_0_0.HandlePlayerData(arg_9_0, arg_9_1)
	if arg_9_1.state == IslandConst.PLAYER_DATA_STATE_EMPTY then
		arg_9_0:UpdatePlayerData(arg_9_1)
	elseif arg_9_1.state == IslandConst.PLAYER_DATA_STATE_ENTER then
		arg_9_0:HandlePlayerEnter(arg_9_1)
	elseif arg_9_1.state == IslandConst.PLAYER_DATA_STATE_EXIT then
		arg_9_0:HandlePlayerExit(arg_9_1.id)
	end
end

function var_0_0.HandlePlayerExit(arg_10_0, arg_10_1)
	if arg_10_0:GetIsland():GetVisitorAgency():GetPlayerList()[arg_10_1] then
		arg_10_0:GetIsland():GetVisitorAgency():DeletePlayer(arg_10_1)
	end
end

function var_0_0.HandlePlayerEnter(arg_11_0, arg_11_1)
	local var_11_0 = arg_11_1.id

	if not arg_11_0:GetIsland():GetVisitorAgency():GetPlayerList()[var_11_0] then
		local var_11_1 = IslandPlayer.New({
			id = var_11_0
		})

		arg_11_0:GetIsland():GetVisitorAgency():AddPlayer(var_11_1)
		arg_11_0:UpdatePlayerData(arg_11_1)
	end
end

function var_0_0.UpdatePlayerData(arg_12_0, arg_12_1)
	arg_12_0:GetIsland():GetVisitorAgency():GetPlayerList()[arg_12_1.id]:UpdateName(arg_12_1.name)
end

function var_0_0.HandleOrderData(arg_13_0, arg_13_1)
	arg_13_0:GetIsland():GetOrderAgency():UpdateOrAddOrder(arg_13_1)
end

function var_0_0.HandleTaskData(arg_14_0, arg_14_1)
	local var_14_0 = arg_14_0:GetIsland():GetTaskAgency()

	for iter_14_0, iter_14_1 in ipairs(arg_14_1) do
		local var_14_1 = underscore.all(iter_14_1.process_list, function(arg_15_0)
			return arg_15_0.target_count == 0
		end)
		local var_14_2 = IslandTask.New(iter_14_1)

		if var_14_1 then
			var_14_0:AddTask(var_14_2)
		else
			var_14_0:UpdateTask(var_14_2)
		end
	end
end

function var_0_0.HandleSlotFormulaData(arg_16_0, arg_16_1)
	local var_16_0 = getProxy(IslandProxy):GetIsland():GetBuildingAgency()
	local var_16_1 = arg_16_1.area_id
	local var_16_2 = pg.island_production_slot[var_16_1].place

	var_16_0:GetBuilding(var_16_2):GetDelegationSlotData(var_16_1):ResetFormulaNum(arg_16_1)
end

function var_0_0.HandleBuildUnlockData(arg_17_0, arg_17_1)
	getProxy(IslandProxy):GetIsland():GetBuildingAgency():InitBuildData(arg_17_1)
end

return var_0_0
