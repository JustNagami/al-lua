local var_0_0 = class("IslandUpgradeBuildingCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody().id
	local var_1_1 = getProxy(IslandProxy):GetIsland():GetBuildingAgency()
	local var_1_2 = var_1_1:GetBuilding(var_1_0)

	if not var_1_2 or not var_1_2:CanUpgrade() then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(21051, {
		building_id = var_1_0
	}, 21052, function(arg_2_0)
		if arg_2_0.ret == 0 then
			var_1_2:Upgrade()
			var_1_1:UpdateBuilding(var_1_2)

			for iter_2_0, iter_2_1 in ipairs(var_1_2:GetUpgradeCost()) do
				local var_2_0 = Drop.New({
					type = iter_2_1[1],
					id = iter_2_1[2],
					count = iter_2_1[3]
				})

				arg_1_0:sendNotification(GAME.CONSUME_ITEM, var_2_0)
			end

			arg_1_0:sendNotification(GAME.ISLAND_UPGRADE_BUILDING_DONE, {
				id = var_1_0
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

return var_0_0
