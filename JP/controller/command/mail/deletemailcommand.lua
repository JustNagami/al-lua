local var_0_0 = class("DeleteMailCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = getProxy(MailProxy)

	if var_1_1:getMailById(var_1_0) == nil then
		print("邮件不存在: " .. var_1_0)

		return
	end

	pg.ConnectionMgr.GetInstance():Send(30006, {
		id = var_1_0
	}, 30007, function(arg_2_0)
		for iter_2_0, iter_2_1 in ipairs(arg_2_0.id_list) do
			var_1_1:removeMailById(iter_2_1)
		end

		arg_1_0:sendNotification(GAME.DELETE_MAIL_DONE)
	end)
end

return var_0_0
