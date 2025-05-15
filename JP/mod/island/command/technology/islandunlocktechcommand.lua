local var_0_0 = class("IslandUnlockTechCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody().techId

	warning("Island Unlock Tech", var_1_0)
	pg.ConnectionMgr.GetInstance():Send(21520, {
		tech_id = var_1_0
	}, 21521, function(arg_2_0)
		if arg_2_0.result == 0 then
			local var_2_0 = getProxy(IslandProxy):GetIsland()
			local var_2_1 = var_2_0:GetTechnologyAgency():GetTechnology(var_1_0)

			var_2_0:GetAblityAgency():AddAblity(var_2_1:GetAbilityId())

			local var_2_2 = var_2_0:GetInventoryAgency()

			for iter_2_0, iter_2_1 in ipairs(var_2_1:GetRecycleItemInfos()) do
				var_2_2:RemoveItem(iter_2_1.id, iter_2_1.count)
			end

			arg_1_0:sendNotification(GAME.ISLAND_UNLOCK_TECH_DONE)

			if var_2_1:IsAutoType() then
				warning("After Unlock To Finish Immd")
				arg_1_0:sendNotification(GAME.ISLAND_FINISH_TECH_IMMD, {
					techId = var_1_0
				})
			end
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

return var_0_0
