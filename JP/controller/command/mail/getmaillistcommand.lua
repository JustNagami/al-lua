local var_0_0 = class("GetMailListCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.type
	local var_1_2 = var_1_0.splitId

	pg.ConnectionMgr.GetInstance():Send(30002, {
		type = var_1_1,
		split_id = var_1_2
	}, 30003, function(arg_2_0)
		local var_2_0 = getProxy(MailProxy)

		if #arg_2_0.mail_list > 0 then
			for iter_2_0, iter_2_1 in ipairs(arg_2_0.mail_list) do
				var_2_0:addMail(Mail.New(iter_2_1))
			end
		elseif var_2_0.init then
			pg.TipsMgr.GetInstance():ShowTips(i18n("mail_getMailList_error_noNewMail"))
		end

		var_2_0.dirty = false
		var_2_0.init = true

		arg_1_0:sendNotification(GAME.GET_MAIL_LIST_DONE)
	end)
end

return var_0_0
