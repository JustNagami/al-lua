local var_0_0 = class("ChangeMailImpFlagCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()

	pg.ConnectionMgr.GetInstance():Send(30010, {
		id = var_1_0.id,
		flag = var_1_0.flag
	}, 30011, function(arg_2_0)
		if arg_2_0.result == 0 then
			local var_2_0 = getProxy(MailProxy)
			local var_2_1 = var_2_0:getMailById(var_1_0.id)

			var_2_1:setImportantFlag(var_1_0.flag)
			var_2_0:updateMail(var_2_1)
			arg_1_0:sendNotification(GAME.CHANGE_MAIL_IMP_FLAG_DONE, var_2_1)
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("change_mail_imp_flag", arg_2_0.result))
		end
	end)
end

return var_0_0
