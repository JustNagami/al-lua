local var_0_0 = class("IslandSetAccessAuthorityCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody().flag

	pg.ConnectionMgr.GetInstance():Send(21300, {
		open_flag = var_1_0
	}, 21301, function(arg_2_0)
		if arg_2_0.result == 0 then
			getProxy(IslandProxy):GetIsland():GetAccessAgency():SetAccessType(var_1_0)
			arg_1_0:sendNotification(GAME.ISLAND_SET_ACCESS_TYPE_DONE)
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.ret)
		end
	end)
end

return var_0_0
