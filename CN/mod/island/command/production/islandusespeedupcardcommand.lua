local var_0_0 = class("IslandUseSpeedupCardCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.build_id
	local var_1_2 = var_1_0.area_id
	local var_1_3 = var_1_0.item_id
	local var_1_4 = var_1_0.num
	local var_1_5 = getProxy(IslandProxy):GetIsland():GetBuildingAgency()

	pg.ConnectionMgr.GetInstance():Send(21513, {
		build_id = var_1_1,
		area_id = var_1_2,
		item_id = var_1_3,
		num = var_1_4
	}, 21514, function(arg_2_0)
		if arg_2_0.result == 0 then
			local var_2_0 = var_1_5:GetBuilding(var_1_1):GetDelegationSlotData(var_1_2):GetSlotRoleData()

			if var_2_0 then
				var_2_0:ResetItem_times(arg_2_0.item_times)
			end

			arg_1_0:sendNotification(GAME.ISLAND_USESPEEDUPCARD_DONE)
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

return var_0_0
