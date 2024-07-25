local var_0_0 = class("RepairLoveLetterItemMailCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.item_id
	local var_1_2 = var_1_0.group_id

	pg.ConnectionMgr.GetInstance():Send(30018, {
		item_id = var_1_1,
		year = var_1_0.year or 0,
		groupid = var_1_2 or 0
	}, 30019, function(arg_2_0)
		if arg_2_0.ret == 0 then
			getProxy(BagProxy):SetLoveLetterRepairInfo(var_1_1 .. "_" .. var_1_2, nil)
			getProxy(BagProxy):removeItemById(var_1_1, 1, var_1_2)

			getProxy(MailProxy).collectionIds = nil

			local var_2_0 = PlayerConst.addTranDrop(arg_2_0.drop_list)

			arg_1_0:sendNotification(GAME.LOVE_ITEM_MAIL_REPAIR_DONE, {
				awards = underscore.filter(var_2_0, function(arg_3_0)
					return not arg_3_0:isLoveLetter()
				end)
			})
		elseif arg_2_0.ret == 6 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("loveletter_recover_tip5"))
		elseif arg_2_0.ret == 7 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("loveletter_recover_tip3"))
		elseif arg_2_0.ret == 40 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("player_harvestResource_error_fullBag"))
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("", arg_2_0.ret))
		end
	end)
end

return var_0_0
