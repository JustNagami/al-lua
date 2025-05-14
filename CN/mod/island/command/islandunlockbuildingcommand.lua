local var_0_0 = class("IslandUnlockBuildingCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody().buildingId
	local var_1_1 = getProxy(IslandProxy):GetIsland():GetBuildingAgency()
	local var_1_2 = var_1_1:GetBuilding(var_1_0)

	if not var_1_2 then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(21049, {
		building_id = var_1_0
	}, 21050, function(arg_2_0)
		if arg_2_0.ret == 0 then
			var_1_2:SetUnlockSystem(true)
			var_1_1:UpdateBuilding(var_1_2)
			arg_1_0:sendNotification(GAME.ISLAND_UNLOCK_BUILDING_DONE, {
				id = var_1_0
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

return var_0_0
