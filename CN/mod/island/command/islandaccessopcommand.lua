local var_0_0 = class("IslandAccessOpCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.op
	local var_1_2 = var_1_0.list

	pg.ConnectionMgr.GetInstance():Send(21302, {
		cmd = var_1_1,
		user_id_list = var_1_2
	}, 21303, function(arg_2_0)
		if arg_2_0.result == 0 then
			local var_2_0 = getProxy(IslandProxy):GetIsland():GetAccessAgency()

			if var_1_1 == IslandConst.ACCESS_OP_SET_WHITELIST then
				var_2_0:SetWhiteList(var_1_2)
			elseif var_1_1 == IslandConst.ACCESS_OP_SET_BLACKLIST then
				var_2_0:SetBlackList(var_1_2)
			elseif var_1_1 == IslandConst.ACCESS_OP_KICK then
				-- block empty
			elseif var_1_1 == IslandConst.ACCESS_OP_KICKANDBLACKLIST then
				var_2_0:AddBlackList(var_1_2)
			end

			arg_1_0:sendNotification(GAME.ISLAND_ACCESS_OP_DONE, {
				op = var_1_1
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.ret)
		end
	end)
end

return var_0_0
