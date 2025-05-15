local var_0_0 = class("IslandStartDelegationCommand", pm.SimpleCommand)

var_0_0.START_DELEGATION = "IslandStartDelegationCommand:START_DELEGATION"

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.build_id
	local var_1_2 = var_1_0.area_id
	local var_1_3 = var_1_0.ship_id
	local var_1_4 = var_1_0.formula_id
	local var_1_5 = var_1_0.num
	local var_1_6 = getProxy(IslandProxy):GetIsland()
	local var_1_7 = var_1_6:GetBuildingAgency()

	pg.ConnectionMgr.GetInstance():Send(21501, {
		build_id = var_1_1,
		area_id = var_1_2,
		ship_id = var_1_3,
		formula_id = var_1_4,
		num = var_1_5
	}, 21502, function(arg_2_0)
		if arg_2_0.result == 0 then
			var_1_7:GetBuilding(var_1_1):UpdateDeleationRoleDataBySlotId(arg_2_0.ship_appoint.id, arg_2_0.ship_appoint)
			var_1_6:DispatchEvent(var_0_0.START_DELEGATION, {
				build_id = var_1_1,
				ship_id = var_1_3,
				area_id = var_1_2
			})
			arg_1_0:sendNotification(GAME.ISLAND_START_DELEGATION_DONE)
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

return var_0_0
