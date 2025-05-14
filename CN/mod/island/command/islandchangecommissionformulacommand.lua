local var_0_0 = class("IslandChangeCommissionFormulaCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.buildingId
	local var_1_2 = var_1_0.commissionId
	local var_1_3 = var_1_0.formulaId
	local var_1_4 = var_1_0.callback
	local var_1_5 = getProxy(IslandProxy):GetIsland():GetBuildingAgency():GetBuilding(var_1_1)

	if not var_1_5 then
		return
	end

	local var_1_6 = var_1_5:GetCommission(var_1_2)
	local var_1_7 = var_1_5:GetFormula(var_1_3)

	if not var_1_6 or not var_1_7 then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(21061, {
		building_id = var_1_1,
		area_id = var_1_2,
		formula_id = var_1_3
	}, 21062, function(arg_2_0)
		if arg_2_0.ret == 0 then
			local var_2_0 = IslandProductionCommission.New(arg_2_0.area_info)

			var_1_5:UpdateCommission(var_2_0)
			arg_1_0:sendNotification(GAME.ISLAND_CHANGE_COMMISSION_FORMULA_DONE)

			if var_1_4 then
				var_1_4()
			end
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

return var_0_0
