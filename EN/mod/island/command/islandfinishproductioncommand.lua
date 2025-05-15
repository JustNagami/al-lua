local var_0_0 = class("IslandFinishProductionCommand", pm.SimpleCommand)

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

	pg.ConnectionMgr.GetInstance():Send(21057, {
		building_id = var_1_1,
		area_id = var_1_2
	}, 21058, function(arg_2_0)
		if arg_2_0.ret == 0 then
			local var_2_0 = IslandProductionUnit.New(arg_2_0.area_info)

			var_1_3:UpdateUnit(var_2_0)

			local var_2_1 = IslandDropHelper.AddItems(arg_2_0)

			arg_1_0:sendNotification(GAME.ISLAND_FINISH_PRODUCTION_DONE, {
				dropData = var_2_1
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

return var_0_0
