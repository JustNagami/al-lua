local var_0_0 = class("IslandUpgradeAgoraCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = getProxy(IslandProxy):GetIsland():GetAgoraAgency()

	if not var_1_1:CanUpgrade() then
		pg.TipsMgr.GetInstance():ShowTips(i18n1("已是最大等级"))

		return
	end

	pg.ConnectionMgr.GetInstance():Send(21305, {
		type = 0
	}, 21306, function(arg_2_0)
		if arg_2_0.result == 0 then
			var_1_1:Upgrade()
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

return var_0_0
