local var_0_0 = class("MailMediator", import("..base.ContextMediator"))

var_0_0.ON_OPEN = "MailMediator:ON_OPEN"
var_0_0.ON_TAKE = "MailMediator:ON_TAKE"
var_0_0.ON_DELETE = "MailMediator:ON_DELETE"
var_0_0.ON_TAKE_ALL = "MailMediator:ON_TAKE_ALL"
var_0_0.ON_DELETE_ALL = "MailMediator:ON_DELETE_ALL"
var_0_0.ON_MORE_OLDER = "MailMediator:ON_MORE_OLDER"
var_0_0.ON_MORE_NEWER = "MailMediator:ON_MORE_NEWER"
var_0_0.ON_CHANGE_IMP = "MailMediator:ON_CHANGE_IMP"

function var_0_0.register(arg_1_0)
	local var_1_0 = getProxy(MailProxy)

	arg_1_0:bind(var_0_0.ON_OPEN, function(arg_2_0, arg_2_1)
		arg_1_0:sendNotification(GAME.OPEN_MAIL, arg_2_1)
	end)
	arg_1_0:bind(var_0_0.ON_TAKE, function(arg_3_0, arg_3_1)
		arg_1_0:sendNotification(GAME.TAKE_ATTACHMENT, arg_3_1)
	end)
	arg_1_0:bind(var_0_0.ON_TAKE_ALL, function(arg_4_0)
		local var_4_0 = var_1_0:getMailAttachments()

		if #var_4_0 > 0 then
			local var_4_1 = arg_1_0:getAllAttachment()

			arg_1_0.viewComponent:showMsgBox({
				content = i18n("take_all_mail", #var_4_0),
				onYes = function()
					arg_1_0:sendNotification(GAME.TAKE_ALL_ATTACHMENT)
				end,
				items = var_4_1
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("take_nothing"))
		end
	end)
	arg_1_0:bind(var_0_0.ON_DELETE, function(arg_6_0, arg_6_1)
		arg_1_0:sendNotification(GAME.DELETE_MAIL, arg_6_1)
	end)
	arg_1_0:bind(var_0_0.ON_DELETE_ALL, function(arg_7_0)
		arg_1_0:sendNotification(GAME.DELETE_ALL_MAIL)
	end)
	arg_1_0:bind(var_0_0.ON_MORE_NEWER, function(arg_8_0)
		local var_8_0 = var_1_0:getNewestMail()

		arg_1_0:sendNotification(GAME.GET_MAIL_LIST, {
			splitId = var_8_0 and var_8_0.id or 0,
			type = var_8_0 and 1 or 0
		})
	end)
	arg_1_0:bind(var_0_0.ON_MORE_OLDER, function(arg_9_0)
		local var_9_0 = var_1_0:getOldestMail()

		arg_1_0:sendNotification(GAME.GET_MAIL_LIST, {
			splitId = var_9_0 and var_9_0.id or 0,
			type = var_9_0 and 2 or 0
		})
	end)
	arg_1_0:bind(var_0_0.ON_CHANGE_IMP, function(arg_10_0, arg_10_1, arg_10_2)
		arg_1_0:sendNotification(GAME.CHANGE_MAIL_IMP_FLAG, {
			id = arg_10_1,
			flag = arg_10_2
		})
	end)
	arg_1_0.viewComponent:setUnreadMailCount(var_1_0.unread)
	arg_1_0.viewComponent:setMailCount(var_1_0.total)

	if not var_1_0.init then
		arg_1_0:sendNotification(GAME.GET_MAIL_LIST, {
			split_id = 0,
			type = 0
		})
	elseif var_1_0.dirty then
		local var_1_1 = var_1_0:getNewestMail()

		arg_1_0:sendNotification(GAME.GET_MAIL_LIST, {
			splitId = var_1_1 and var_1_1.id or 0,
			type = var_1_1 and 1 or 0
		})
	else
		arg_1_0.viewComponent:setMailData(var_1_0:getMails())
		arg_1_0.viewComponent:updateMailList()
	end
end

function var_0_0.getAllAttachment(arg_11_0)
	local var_11_0 = {}
	local var_11_1 = getProxy(MailProxy):getAllAttachment()
	local var_11_2 = underscore.map(var_11_1, function(arg_12_0)
		return Drop.New({
			type = arg_12_0.type,
			id = arg_12_0.id,
			count = arg_12_0.count
		})
	end)

	table.sort(var_11_2, CompareFuncs({
		function(arg_13_0)
			return -arg_13_0:getDropRarity()
		end,
		function(arg_14_0)
			return -arg_14_0.id
		end
	}))

	return var_11_2
end

function var_0_0.listNotificationInterests(arg_15_0)
	return {
		GAME.TAKE_ATTACHMENT_FULL_SHIP,
		GAME.TAKE_ATTACHMENT_FULL_EQUIP,
		GAME.GET_MAIL_LIST_DONE,
		GAME.DELETE_MAIL_DONE,
		GAME.DELETE_ALL_MAIL_DONE,
		GAME.CHANGE_MAIL_IMP_FLAG_DONE,
		GAME.TAKE_ATTACHMENT_DONE,
		GAME.TAKE_ALL_ATTACHMENT_DONE,
		GAME.OPEN_MAIL_DONE,
		MailProxy.MAIL_TOTAL,
		BayProxy.SHIP_ADDED,
		GAME.USE_ITEM_DONE
	}
end

function var_0_0.handleNotification(arg_16_0, arg_16_1)
	local var_16_0 = arg_16_1:getName()
	local var_16_1 = arg_16_1:getBody()

	if var_16_0 == GAME.GET_MAIL_LIST_DONE or var_16_0 == GAME.DELETE_MAIL_DONE then
		arg_16_0.viewComponent:setMailData(getProxy(MailProxy):getMails())
		arg_16_0.viewComponent:updateMailList()
	elseif var_16_0 == GAME.DELETE_ALL_MAIL_DONE then
		local var_16_2 = getProxy(MailProxy)
		local var_16_3 = var_16_2:getMails()

		if #var_16_3 < var_16_2.total and #var_16_3 < Mail.SINGLE_COUNT then
			local var_16_4 = var_16_2:getOldestMail()

			arg_16_0:sendNotification(GAME.GET_MAIL_LIST, {
				splitId = var_16_4 and var_16_4.id or 0,
				type = var_16_4 and 2 or 0
			})
		else
			arg_16_0.viewComponent:setMailData(var_16_3)
			arg_16_0.viewComponent:updateMailList()
		end
	elseif var_16_0 == MailProxy.MAIL_TOTAL then
		arg_16_0.viewComponent:setMailCount(var_16_1)
	elseif var_16_0 == GAME.OPEN_MAIL_DONE then
		arg_16_0.viewComponent:openMail(var_16_1)
		arg_16_0.viewComponent:updateMail(var_16_1)
	elseif var_16_0 == GAME.CHANGE_MAIL_IMP_FLAG_DONE then
		arg_16_0.viewComponent:updateMail(var_16_1)
	elseif var_16_0 == GAME.TAKE_ATTACHMENT_DONE or var_16_0 == GAME.TAKE_ALL_ATTACHMENT_DONE then
		for iter_16_0, iter_16_1 in ipairs(var_16_1.mails) do
			arg_16_0.viewComponent:updateMail(iter_16_1)
		end

		arg_16_0:ShowAndCheckDrops(var_16_1.items)
	elseif var_16_0 == GAME.DELETE_MAIL_DONE then
		pg.TipsMgr.GetInstance():ShowTips(i18n("main_mailMediator_mailDelete"))
	elseif var_16_0 == GAME.DELETE_ALL_MAIL_DONE then
		pg.TipsMgr.GetInstance():ShowTips(i18n("main_mailMediator_mailDelete"))
	elseif var_16_0 == GAME.TAKE_ATTACHMENT_FULL_EQUIP then
		arg_16_0.viewComponent:UnblurMailBox()
		NoPosMsgBox(i18n("switch_to_shop_tip_noPos"), openDestroyEquip, gotoChargeScene)
	elseif var_16_0 == GAME.TAKE_ATTACHMENT_FULL_SHIP then
		arg_16_0.viewComponent:UnblurMailBox()
		NoPosMsgBox(i18n("switch_to_shop_tip_noDockyard"), openDockyardClear, gotoChargeScene, openDockyardIntensify)
	elseif var_16_0 == GAME.USE_ITEM_DONE and table.getCount(var_16_1) ~= 0 then
		arg_16_0.viewComponent:emit(BaseUI.ON_AWARD, {
			animation = true,
			items = var_16_1
		})
	end
end

function var_0_0.ShowAndCheckDrops(arg_17_0, arg_17_1)
	if not arg_17_1 then
		return
	end

	local var_17_0 = {}

	if #arg_17_1 > 0 then
		table.insert(var_17_0, function(arg_18_0)
			arg_17_0.viewComponent:emit(BaseUI.ON_ACHIEVE, arg_17_1, arg_18_0)
		end)
	end

	local var_17_1 = underscore.detect(arg_17_1, function(arg_19_0)
		return arg_19_0.type == DROP_TYPE_ITEM and arg_19_0:getConfig("type") == Item.SKIN_ASSIGNED_TYPE and Item.InTimeLimitSkinAssigned(arg_19_0.id)
	end)

	if var_17_1 then
		table.insert(var_17_0, function(arg_20_0)
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				hideNo = true,
				content = i18n("skin_exchange_usetip", var_17_1:getName()),
				onYes = arg_20_0,
				onNo = arg_20_0
			})
		end)
	end

	seriesAsync(var_17_0, function()
		local var_21_0
		local var_21_1 = getProxy(TechnologyProxy)

		if PlayerPrefs.GetInt("help_research_package", 0) == 0 then
			for iter_21_0, iter_21_1 in ipairs(arg_17_1) do
				if iter_21_1.type == DROP_TYPE_ITEM then
					var_21_0 = checkExist(var_21_1:getItemCanUnlockBluePrint(iter_21_1.id), {
						1
					})

					if var_21_0 then
						break
					end
				end
			end
		end

		if var_21_0 then
			PlayerPrefs.SetInt("help_research_package", 1)
			PlayerPrefs.Save()
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_HELP,
				helps = i18n("help_research_package"),
				show_blueprint = var_21_0
			})
		end
	end)
end

return var_0_0
