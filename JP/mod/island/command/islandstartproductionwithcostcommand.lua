local var_0_0 = class("IslandStartProductionCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.buildingId
	local var_1_2 = var_1_0.unitId
	local var_1_3 = getProxy(IslandProxy):GetIsland():GetBuildingAgency():GetBuilding(var_1_1)

	if not var_1_3 then
		return
	end

	if not var_1_3:GetUnit(var_1_2) then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(21055, {
		building_id = var_1_1,
		area_id = var_1_2
	}, 21056, function(arg_2_0)
		if arg_2_0.ret == 0 then
			local var_2_0 = IslandProductionUnit.New(arg_2_0.area_info)

			var_1_3:UpdateUnit(var_2_0)
			arg_1_0:sendNotification(GAME.ISLAND_START_PRODUCTION_WITH_COST_DONE)
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

return var_0_0
