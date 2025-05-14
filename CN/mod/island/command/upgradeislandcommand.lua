local var_0_0 = class("UpgradeIslandCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()

	if not getProxy(IslandProxy):GetIsland():CanLevelUp() then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(21000, {
		type = 0
	}, 21001, function(arg_2_0)
		if arg_2_0.ret == 0 then
			local var_2_0 = getProxy(IslandProxy):GetIsland()

			var_2_0:Upgrade()

			local var_2_1 = IslandDropHelper.AddItems(arg_2_0)
			local var_2_2 = var_2_0:GetUpgradeConsume()

			for iter_2_0, iter_2_1 in pairs(var_2_2) do
				local var_2_3 = Drop.New({
					type = iter_2_1[1],
					id = iter_2_1[2],
					count = iter_2_1[3]
				})

				arg_1_0:sendNotification(GAME.CONSUME_ITEM, var_2_3)
			end

			arg_1_0:sendNotification(GAME.ISLAND_UPGRADE_DONE, {
				dropData = var_2_1
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.ret] .. arg_2_0.ret)
		end
	end)
end

return var_0_0
