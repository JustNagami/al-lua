local var_0_0 = class("GetIslandExtraShipAwardCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.id
	local var_1_2 = var_1_0.op
	local var_1_3 = getProxy(IslandProxy):GetIsland():GetCharacterAgency()
	local var_1_4 = var_1_3:GetShipById(var_1_1)

	if not var_1_4 then
		return
	end

	local var_1_5 = table.indexof(var_1_4:GetAllExtraAwardOP(), var_1_2)

	pg.ConnectionMgr.GetInstance():Send(21047, {
		ship_id = var_1_1,
		index = var_1_5
	}, 21048, function(arg_2_0)
		if arg_2_0.ret == 0 then
			local var_2_0 = IslandDropHelper.AddItems(arg_2_0)

			var_1_3:ExtraShipAward(var_1_1, var_1_2)
			arg_1_0:sendNotification(GAME.ISLAND_GET_EXTRA_AWARD_DONE, {
				dropData = var_2_0
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

return var_0_0
