local var_0_0 = class("TakeAttachmentCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = getProxy(MailProxy)
	local var_1_2 = var_1_1:getMailById(var_1_0)

	if var_1_2 == nil then
		pg.TipsMgr.GetInstance():ShowTips(i18n("mail_takeAttachment_error_noMail", var_1_0))

		return
	end

	if var_1_2.attachFlag ~= var_1_2.ATTACHMENT_EXIST then
		pg.TipsMgr.GetInstance():ShowTips(i18n("mail_takeAttachment_error_noAttach"))

		return
	end

	local var_1_3 = var_1_2:GetAttchmentDic()
	local var_1_4, var_1_5 = CheckOverflow(var_1_3)

	if not var_1_4 then
		switch(var_1_5, {
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

	local var_1_6 = {}

	if not CheckShipExpOverflow(var_1_3) then
		table.insert(var_1_6, function(arg_6_0)
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("player_expResource_mail_fullBag"),
				onYes = arg_6_0
			})
		end)
	end

	if var_1_3[DROP_TYPE_WORLD_ITEM] > 0 then
		local var_1_7 = nowWorld()

		if not var_1_7:IsActivate() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("mail_takeAttachment_error_noWorld"))

			return
		elseif var_1_7:CheckReset() then
			table.insert(var_1_6, function(arg_7_0)
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("mail_takeAttachment_error_reWorld"),
					onYes = arg_7_0
				})
			end)
		end
	end

	seriesAsync(var_1_6, function()
		pg.ConnectionMgr.GetInstance():Send(30004, {
			id = {
				var_1_2.id
			}
		}, 30005, function(arg_9_0)
			var_1_2.readFlag = 2
			var_1_2.attachFlag = var_1_2.ATTACHMENT_TAKEN

			var_1_1:updateMail(var_1_2)

			local var_9_0 = PlayerConst.addTranDrop(arg_9_0.attachment_list)
			local var_9_1 = var_1_1:GetAttachmentCount()

			var_1_1:unpdateExistAttachment(var_9_1 - 1)
			arg_1_0:sendNotification(GAME.TAKE_ATTACHMENT_DONE, {
				mails = {
					var_1_2
				},
				items = var_9_0
			})
		end)
	end)
end

return var_0_0
