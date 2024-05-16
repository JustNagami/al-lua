local var_0_0 = class("TakeAllAttachmentCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = getProxy(MailProxy)
	local var_1_1 = var_1_0:GetAttchmentDic()
	local var_1_2, var_1_3 = CheckOverflow(var_1_1)

	if not var_1_2 then
		switch(var_1_3, {
			gold = function()
				pg.TipsMgr.GetInstance():ShowTips(i18n("gold_max_tip_title") .. i18n("resource_max_tip_mail"))
			end,
			oil = function()
				pg.TipsMgr.GetInstance():ShowTips(i18n("oil_max_tip_title") .. i18n("resource_max_tip_mail"))
			end,
			equip = function()
				pg.TipsMgr.GetInstance():ShowTips(i18n("mail_takeAttachment_error_magazine_full"))
			end,
			ship = function()
				pg.TipsMgr.GetInstance():ShowTips(i18n("mail_takeAttachment_error_dockYrad_full"))
			end
		})

		return
	end

	local var_1_4 = {}

	if not CheckShipExpOverflow(var_1_1) then
		table.insert(var_1_4, function(arg_6_0)
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("player_expResource_mail_fullBag"),
				onYes = arg_6_0
			})
		end)
	end

	if var_1_1[DROP_TYPE_WORLD_ITEM] > 0 then
		local var_1_5 = nowWorld()

		if not var_1_5:IsActivate() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("mail_takeAttachment_error_noWorld"))

			return
		elseif var_1_5:CheckReset() then
			table.insert(var_1_4, function(arg_7_0)
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("mail_takeAttachment_error_reWorld"),
					onYes = arg_7_0
				})
			end)
		end
	end

	local var_1_6 = underscore.select(var_1_0:getMailAttachments(), function(arg_8_0)
		return arg_8_0.attachFlag == Mail.ATTACHMENT_EXIST
	end)

	seriesAsync(var_1_4, function(arg_9_0)
		pg.ConnectionMgr.GetInstance():Send(30004, {
			id = underscore.map(var_1_6, function(arg_10_0)
				return arg_10_0.id
			end)
		}, 30005, function(arg_11_0)
			for iter_11_0, iter_11_1 in ipairs(var_1_6) do
				iter_11_1.readFlag = 2
				iter_11_1.attachFlag = iter_11_1.ATTACHMENT_TAKEN

				var_1_0:updateMail(iter_11_1)
			end

			local var_11_0 = PlayerConst.addTranDrop(arg_11_0.attachment_list)
			local var_11_1 = math.max(var_1_0._existAttachmentCount - #arg_11_0.attachment_list, 0)

			var_1_0:unpdateExistAttachment(var_11_1)
			arg_1_0:sendNotification(GAME.TAKE_ALL_ATTACHMENT_DONE, {
				mails = var_1_6,
				items = var_11_0
			})
		end)
	end)
end

return var_0_0
