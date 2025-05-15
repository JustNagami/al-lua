local var_0_0 = class("IslandGetDelegationAwardCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.type
	local var_1_2 = var_1_0.build_id
	local var_1_3 = var_1_0.area_id
	local var_1_4 = var_1_0.type
	local var_1_5 = getProxy(IslandProxy):GetIsland()
	local var_1_6 = var_1_5:GetBuildingAgency()
	local var_1_7 = var_1_5:GetCharacterAgency()

	pg.ConnectionMgr.GetInstance():Send(21505, {
		build_id = var_1_2,
		area_id = var_1_3,
		type = var_1_4
	}, 21506, function(arg_2_0)
		if arg_2_0.result == 0 then
			local var_2_0 = var_1_6:GetBuilding(var_1_2)

			var_2_0:UpdateDeleationRewardDataBySlotId(var_1_3, nil)

			if var_1_4 == 1 then
				local var_2_1 = var_2_0:GetDelegationSlotData(var_1_3):GetSlotRoleData()

				if var_2_1 then
					var_2_1:ResetGetTimes(arg_2_0.get_times)
				end
			end

			local var_2_2 = IslandDropHelper.AddItems(arg_2_0)

			arg_1_0:sendNotification(GAME.ISLAND_GET_DELEGATION_AWARD_DONE)
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

return var_0_0
