local var_0_0 = class("DeleteAllMailCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	pg.ConnectionMgr.GetInstance():Send(30006, {
		id = 0
	}, 30007, function(arg_2_0)
		local var_2_0 = getProxy(MailProxy)

		for iter_2_0, iter_2_1 in ipairs(arg_2_0.id_list) do
			if var_2_0:hasMailById(iter_2_1) then
				var_2_0:removeMailById(iter_2_1)
			end
		end

		arg_1_0:sendNotification(GAME.DELETE_ALL_MAIL_DONE)
	end)
end

return var_0_0
