local var_0_0 = class("OpenMailCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = getProxy(MailProxy)
	local var_1_2 = var_1_1:getMailById(var_1_0)

	if var_1_2 == nil then
		print("邮件不存在: " .. var_1_0)

		return
	end

	if var_1_2.openned then
		arg_1_0:sendNotification(GAME.OPEN_MAIL_DONE, var_1_2)

		return
	end

	pg.ConnectionMgr.GetInstance():Send(30008, {
		id = var_1_2.id
	}, 30009, function(arg_2_0)
		var_1_2.readFlag = 2

		var_1_2:extend(arg_2_0.detail_info)
		var_1_1:updateMail(var_1_2)
		arg_1_0:sendNotification(GAME.OPEN_MAIL_DONE, var_1_2)
	end)
end

return var_0_0
