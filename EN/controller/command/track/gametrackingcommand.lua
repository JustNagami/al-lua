local var_0_0 = class("GameTrackingCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody().infos

	pg.ConnectionMgr.GetInstance():Send(10991, {
		infos = var_1_0
	})
end

return var_0_0
