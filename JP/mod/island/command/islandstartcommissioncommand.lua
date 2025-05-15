local var_0_0 = class("IslandStartCommissionCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.buildingId
	local var_1_2 = var_1_0.commissionId
	local var_1_3 = var_1_0.shipId
	local var_1_4 = var_1_0.formulaId
	local var_1_5 = var_1_0.callback
	local var_1_6 = getProxy(IslandProxy):GetIsland():GetBuildingAgency():GetBuilding(var_1_1)

	if not var_1_6 then
		return
	end

	local var_1_7 = var_1_6:GetCommission(var_1_2)
	local var_1_8 = var_1_6:GetFormula(var_1_4)

	if not var_1_7 or not var_1_8 then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(21063, {
		building_id = var_1_1,
		appoint_pos = var_1_2,
		role_id = var_1_3,
		formula_id = var_1_4
	}, 21064, function(arg_2_0)
		if arg_2_0.ret == 0 then
			local var_2_0 = IslandProductionCommission.New(arg_2_0.appoint_info)

			var_1_6:UpdateCommission(var_2_0)
			arg_1_0:sendNotification(GAME.ISLAND_START_COMMISSION_DONE)

			if var_1_5 then
				var_1_5()
			end
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

return var_0_0
