local var_0_0 = class("MailLayer", import("..base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "MailBoxUI2"
end

function var_0_0.init(arg_2_0)
	arg_2_0.closeButton = arg_2_0:findTF("main/top/btnBack")
	arg_2_0.takeAllButton = arg_2_0:findTF("main/get_all_button")
	arg_2_0.deleteAllButton = arg_2_0:findTF("main/delete_all_button")
	arg_2_0.mainPanel = arg_2_0:findTF("main")
	arg_2_0.mailPanel = arg_2_0:findTF("main/list_panel/list")
	arg_2_0.pullToRefreshNewer = arg_2_0:findTF("pull_to_refresh_newer", arg_2_0.mailPanel)
	arg_2_0.pullToRefreshOlder = arg_2_0:findTF("pull_to_refresh_older", arg_2_0.mailPanel)
	arg_2_0.mailList = arg_2_0:findTF("mails", arg_2_0.mailPanel)
	arg_2_0.mailTpl = arg_2_0.mailList:Find("mail_tpl")
	arg_2_0.nullTpl = arg_2_0:findTF("null_tpl", arg_2_0.mailPanel)
	arg_2_0.scrollBar = arg_2_0:findTF("Scrollbar", arg_2_0.mailPanel)
	arg_2_0.mailCount = arg_2_0:findTF("main/count_bg/Text")
	arg_2_0.toggleNormal = arg_2_0:findTF("main/toggle_normal")
	arg_2_0.toggleMatter = arg_2_0:findTF("main/toggle_matter")
	arg_2_0.mailTip = arg_2_0:findTF("main/tip")
	arg_2_0.letterPanel = arg_2_0:findTF("letter")
	arg_2_0.letterContant = arg_2_0:findTF("panel/main/contant", arg_2_0.letterPanel)
	arg_2_0.wordSpace = arg_2_0:findTF("sentences", arg_2_0.letterContant)
	arg_2_0.wordText = arg_2_0:findTF("word", arg_2_0.wordSpace)
	arg_2_0.lineTpl = arg_2_0:findTF("line_tpl", arg_2_0.wordSpace)
	arg_2_0.wordList = UIItemList.New(arg_2_0.wordSpace, arg_2_0.lineTpl)
	arg_2_0.attachmentTpl = arg_2_0:getTpl("attachments/equipmenttpl ", arg_2_0.letterContant)
	arg_2_0.radioImp = arg_2_0:findTF("matter", arg_2_0.letterPanel)
	arg_2_0.panelStateList = {
		"initial",
		"openMail"
	}
	arg_2_0.panelState = arg_2_0.panelStateList[1]

	pg.UIMgr.GetInstance():BlurPanel(arg_2_0._tf, false, {
		weight = LayerWeightConst.SECOND_LAYER
	})

	arg_2_0.msgBoxTF = arg_2_0:findTF("msgbox")

	setActive(arg_2_0.msgBoxTF, false)

	arg_2_0.msgConfirmBtn = arg_2_0:findTF("window/actions/confirm_button", arg_2_0.msgBoxTF)
	arg_2_0.msgCancelBtn = arg_2_0:findTF("window/actions/cancel_button", arg_2_0.msgBoxTF)
	arg_2_0.msgItemContainerTF = arg_2_0:findTF("window/items/content/list/", arg_2_0.msgBoxTF)
	arg_2_0.msgItemTF = arg_2_0:getTpl("item", arg_2_0.msgItemContainerTF)
	arg_2_0.msgContentTF = arg_2_0:findTF("window/items/content/Text", arg_2_0.msgBoxTF):GetComponent(typeof(Text))
	arg_2_0.mailItemList = UIItemList.New(arg_2_0.mailList, arg_2_0.mailTpl)

	arg_2_0.mailItemList:make(function(arg_3_0, arg_3_1, arg_3_2)
		arg_3_1 = arg_3_1 + 1

		if arg_3_0 == UIItemList.EventUpdate then
			arg_2_0:updateMail(arg_2_0.filterMailVOs[arg_3_1])
		end
	end)
end

function var_0_0.setMailData(arg_4_0, arg_4_1)
	arg_4_0.mailVOs = arg_4_1
end

function var_0_0.setUnreadMailCount(arg_5_0, arg_5_1)
	arg_5_0.unreadCount = arg_5_1
end

function var_0_0.setMailCount(arg_6_0, arg_6_1)
	arg_6_0.totalCount = arg_6_1
end

function var_0_0.setOrMovePanelState(arg_7_0, arg_7_1, arg_7_2)
	if arg_7_2 then
		setAnchoredPosition(arg_7_0.mainPanel, Vector2.zero)
		SetActive(arg_7_0.mainPanel, true)
		setAnchoredPosition(arg_7_0.letterPanel, Vector2.zero)
		SetActive(arg_7_0.letterPanel, false)

		return
	end

	if arg_7_1 == arg_7_0.panelState then
		return
	end

	if LeanTween.isTweening(go(arg_7_0.mainPanel)) or LeanTween.isTweening(go(arg_7_0.letterPanel)) then
		return
	end

	if arg_7_1 == arg_7_0.panelStateList[2] then
		LeanTween.moveX(rtf(arg_7_0.mainPanel), -402, 0.2)
		SetActive(arg_7_0.letterPanel, true)
		LeanTween.moveX(rtf(arg_7_0.letterPanel), 402, 0.2)
	elseif arg_7_1 == arg_7_0.panelStateList[1] then
		LeanTween.moveX(rtf(arg_7_0.mainPanel), 0, 0.2)
		LeanTween.moveX(rtf(arg_7_0.letterPanel), 0, 0.2):setOnComplete(System.Action(function()
			SetActive(arg_7_0.letterPanel, false)
		end))
	end

	arg_7_0.panelState = arg_7_1
end

function var_0_0.didEnter(arg_9_0)
	arg_9_0:setOrMovePanelState(arg_9_0.panelState, true)
	onButton(arg_9_0, arg_9_0._tf, function()
		arg_9_0:emit(var_0_0.ON_CLOSE)
	end, SFX_CANCEL)
	onButton(arg_9_0, arg_9_0.closeButton, function()
		triggerButton(arg_9_0._tf)
	end, SFX_CANCEL)
	onButton(arg_9_0, arg_9_0.deleteAllButton, function()
		if arg_9_0.totalCount == 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("main_mailLayer_mailBoxClear"))

			return
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("main_mailLayer_quest_clear"),
			onYes = function()
				arg_9_0:emit(MailMediator.ON_DELETE_ALL)
			end
		})
	end, SFX_PANEL)
	onButton(arg_9_0, arg_9_0.takeAllButton, function()
		if arg_9_0.totalCount == 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("main_mailLayer_mailBoxClear"))

			return
		end

		arg_9_0:emit(MailMediator.ON_TAKE_ALL)
	end, SFX_PANEL)
	onToggle(arg_9_0, arg_9_0.toggleNormal, function(arg_15_0)
		arg_9_0:updateMailList()
	end, SFX_PANEL)
	onToggle(arg_9_0, arg_9_0.toggleMatter, function(arg_16_0)
		arg_9_0:updateMailList()
	end, SFX_PANEL)

	local var_9_0 = arg_9_0.mailList:GetComponent("UIPullToRefreshTrigger")
	local var_9_1 = arg_9_0.pullToRefreshNewer:GetComponent("CanvasGroup")

	var_9_1.alpha = 0

	local var_9_2 = arg_9_0.pullToRefreshOlder:GetComponent("CanvasGroup")

	var_9_2.alpha = 0

	pg.DelegateInfo.Add(arg_9_0, var_9_0.onValueChanged)
	var_9_0.onValueChanged:AddListener(function(arg_17_0)
		if arg_17_0 > 0 then
			var_9_1.alpha = arg_17_0 * arg_17_0
		else
			var_9_1.alpha = 0
		end

		if arg_17_0 < 0 and #arg_9_0.mailVOs < arg_9_0.totalCount then
			var_9_2.alpha = arg_17_0 * arg_17_0
		else
			var_9_2.alpha = 0
		end
	end)
	pg.DelegateInfo.Add(arg_9_0, var_9_0.onRefreshTop)
	var_9_0.onRefreshTop:AddListener(function()
		if #arg_9_0.mailVOs < arg_9_0.totalCount and arg_9_0.unreadCount > 0 then
			arg_9_0:emit(MailMediator.ON_MORE_NEWER)
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("main_mailLayer_noNewMail"))
		end
	end)

	local var_9_3 = arg_9_0.mailList:GetComponent("ScrollRect")

	pg.DelegateInfo.Add(arg_9_0, var_9_0.onDragEnd)
	var_9_0.onDragEnd:AddListener(function()
		if var_9_3.verticalNormalizedPosition <= 0.1 and #arg_9_0.mailVOs < arg_9_0.totalCount then
			arg_9_0:emit(MailMediator.ON_MORE_OLDER)
		end
	end)
end

function var_0_0.UnblurMailBox(arg_20_0)
	pg.UIMgr.GetInstance():UnblurPanel(arg_20_0._tf, pg.UIMgr.GetInstance()._normalUIMain)
end

function var_0_0.updateMailList(arg_21_0)
	if arg_21_0.frozenUpdateMailList then
		return
	end

	local var_21_0 = getToggleState(arg_21_0.toggleNormal)
	local var_21_1 = getToggleState(arg_21_0.toggleMatter)

	if not var_21_0 and not var_21_1 then
		arg_21_0.frozenUpdateMailList = true

		triggerToggle(arg_21_0.toggleNormal, true)
		triggerToggle(arg_21_0.toggleMatter, true)

		arg_21_0.frozenUpdateMailList = false
		var_21_0 = true
		var_21_1 = true
	end

	table.sort(arg_21_0.mailVOs, Mail.sortByTime)

	arg_21_0.filterMailVOs = underscore.filter(arg_21_0.mailVOs, function(arg_22_0)
		return var_21_0 and arg_22_0.importantFlag ~= 1 or var_21_1 and arg_22_0.importantFlag == 1
	end)

	if arg_21_0.lastOpenMailId and underscore.all(arg_21_0.filterMailVOs, function(arg_23_0)
		return arg_23_0.id ~= arg_21_0.lastOpenMailId
	end) then
		arg_21_0:setOrMovePanelState("initial")

		arg_21_0.lastOpenMailId = nil
	end

	arg_21_0.mailItemList:align(#arg_21_0.filterMailVOs)
	setActive(arg_21_0.nullTpl, #arg_21_0.filterMailVOs == 0)

	if var_21_0 and var_21_1 then
		setText(arg_21_0.nullTpl:Find("Text"), i18n("empty_tip_mailboxui"))
	else
		setText(arg_21_0.nullTpl:Find("Text"), i18n("mail_filter_placeholder"))
	end

	setActive(arg_21_0.deleteAllButton, var_21_0 or not var_21_1)
	setText(arg_21_0.mailCount, arg_21_0.totalCount .. "<color=#B1BAC9FF>/1000</color>")
	arg_21_0:showMailTip(#arg_21_0.mailVOs ~= arg_21_0.totalCount)
end

function var_0_0.showMailTip(arg_24_0, arg_24_1)
	setActive(arg_24_0.mailTip, arg_24_1)

	if arg_24_1 then
		if not LeanTween.isTweening(go(arg_24_0.mailTip)) then
			LeanTween.alpha(arg_24_0.mailTip, 0, 0)
			LeanTween.alpha(arg_24_0.mailTip, 1, 0.7):setEase(LeanTweenType.easeInOutSine):setLoopPingPong()
		end
	elseif LeanTween.isTweening(go(arg_24_0.mailTip)) then
		LeanTween.cancel(go(arg_24_0.mailTip))
	end
end

function var_0_0.setLetterContent(arg_25_0, arg_25_1)
	setActive(arg_25_0.wordText, arg_25_1)
	setActive(arg_25_0.lineTpl, arg_25_1)

	if not arg_25_1 then
		return
	end

	setText(arg_25_0.wordText, arg_25_1)
	Canvas.ForceUpdateCanvases()

	local var_25_0 = math.floor(arg_25_0.wordText.rect.height / arg_25_0.lineTpl.rect.height) + 1

	arg_25_0.wordList:align(var_25_0 + 1)
end

function var_0_0.updateMailMark(arg_26_0, arg_26_1)
	if not arg_26_0.lastOpenMailId then
		return
	end

	local var_26_0 = table.getIndex(arg_26_0.filterMailVOs, function(arg_27_0)
		return arg_27_0.id == arg_26_0.lastOpenMailId
	end)

	if var_26_0 then
		setActive(arg_26_0.mailList:GetChild(var_26_0 - 1):Find("check_mark"), arg_26_1)
	end
end

function var_0_0.openMail(arg_28_0, arg_28_1)
	assert(isa(arg_28_1, Mail), "should be an instance of Mail")
	assert(arg_28_1.openned, "mail should be openned")
	arg_28_0:updateMailMark(false)

	arg_28_0.lastOpenMailId = arg_28_1.id

	arg_28_0:updateMailMark(true)
	arg_28_0:setOrMovePanelState("openMail")

	local var_28_0 = arg_28_0.letterPanel

	setText(findTF(var_28_0, "panel/main/contant/title"), arg_28_1.title)
	setText(findTF(var_28_0, "panel/main/contant/title"), i18n2(arg_28_1.title))
	setText(findTF(var_28_0, "panel/main/contant/date/date_bg/text"), os.date("%m/%d/%y", arg_28_1.date))
	setText(findTF(var_28_0, "from/text"), arg_28_1.sender)
	arg_28_0:setLetterContent(arg_28_1.content)

	local var_28_1 = findTF(var_28_0, "get_button")

	onButton(arg_28_0, var_28_1, function()
		arg_28_0:emit(MailMediator.ON_TAKE, arg_28_1.id)
	end, SFX_PANEL)

	local var_28_2 = 0

	if arg_28_1.attachFlag == arg_28_1.ATTACHMENT_EXIST then
		setButtonEnabled(var_28_1, true)

		var_28_2 = 1
	else
		var_28_2 = arg_28_1.attachFlag == arg_28_1.ATTACHMENT_NONE and 2 or 3

		setButtonEnabled(var_28_1, false)
	end

	setActive(findTF(var_28_1, "get"), var_28_2 == 1)
	setActive(findTF(var_28_1, "none"), var_28_2 == 2)
	setActive(findTF(var_28_1, "got"), var_28_2 == 3)
	setActive(findTF(var_28_1, "mask"), var_28_2 ~= 1)
	setActive(arg_28_0.letterContant, true)

	local var_28_3 = findTF(arg_28_0.letterContant, "attachments")

	removeAllChildren(var_28_3)

	local var_28_4 = false

	for iter_28_0, iter_28_1 in ipairs(arg_28_1.attachments) do
		local var_28_5 = cloneTplTo(arg_28_0.attachmentTpl, var_28_3)
		local var_28_6 = arg_28_1.readFlag == 2 and arg_28_1.attachFlag == arg_28_1.ATTACHMENT_TAKEN

		arg_28_0:setAttachment(var_28_5, iter_28_1, var_28_6)

		var_28_4 = true
	end

	setActive(var_28_3, var_28_4)
	setActive(arg_28_0.radioImp:Find("on"), arg_28_1.importantFlag == 1)
	setActive(arg_28_0.radioImp:Find("off"), arg_28_1.importantFlag == 0)
	onButton(arg_28_0, arg_28_0.radioImp, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n(arg_28_1.importantFlag == 1 and "mail_confirm_cancel_important_flag" or "mail_confirm_set_important_flag"),
			onYes = function()
				arg_28_0:emit(MailMediator.ON_CHANGE_IMP, arg_28_1.id, arg_28_1.importantFlag == 1 and 0 or 1)
			end
		})
	end, SFX_PANEL)
end

function var_0_0.setAttachment(arg_32_0, arg_32_1, arg_32_2, arg_32_3)
	setActive(arg_32_1:Find("mask"), arg_32_3)

	local var_32_0 = {
		type = arg_32_2.type,
		id = arg_32_2.id,
		count = arg_32_2.count
	}

	updateDrop(arg_32_1, var_32_0)
	onButton(arg_32_0, arg_32_1, function()
		arg_32_0:emit(var_0_0.ON_DROP, var_32_0)
	end, SFX_PANEL)
end

function var_0_0.updateMail(arg_34_0, arg_34_1)
	assert(isa(arg_34_1, Mail), "should be an instance of Mail")

	for iter_34_0, iter_34_1 in ipairs(arg_34_0.mailVOs) do
		if iter_34_1.id == arg_34_1.id then
			arg_34_0.mailVOs[iter_34_0] = arg_34_1
		end
	end

	local var_34_0 = table.getIndex(arg_34_0.filterMailVOs, function(arg_35_0)
		return arg_35_0.id == arg_34_1.id
	end)

	if not var_34_0 then
		return
	end

	local var_34_1 = arg_34_0.mailList:GetChild(var_34_0 - 1)

	onButton(arg_34_0, var_34_1, function()
		if arg_34_0.lastOpenMailId == arg_34_1.id then
			arg_34_0:updateMailMark(false)
			arg_34_0:setOrMovePanelState("initial")

			arg_34_0.lastOpenMailId = nil
		else
			arg_34_0:emit(MailMediator.ON_OPEN, arg_34_1.id)
		end
	end, SFX_PANEL)

	local var_34_2 = arg_34_0:findTF("mask", var_34_1)

	setActive(findTF(var_34_1, "tip_bg"), arg_34_1.attachFlag ~= arg_34_1.ATTACHMENT_NONE)

	local var_34_3 = arg_34_1.attachFlag ~= arg_34_1.ATTACHMENT_NONE
	local var_34_4 = findTF(var_34_1, "res_icon")
	local var_34_5 = findTF(var_34_1, "icon")

	setActive(var_34_4, not var_34_3)
	setActive(var_34_5, var_34_3)

	if var_34_3 then
		setText(findTF(var_34_1, "tip_bg/Text"), #arg_34_1.attachments)

		local var_34_6 = arg_34_1.attachments[1]

		arg_34_0:setAttachment(var_34_5, var_34_6, arg_34_1.attachFlag == 2)
		setActive(var_34_2, arg_34_1.readFlag == 2 and arg_34_1.attachFlag == arg_34_1.ATTACHMENT_TAKEN)
	else
		if arg_34_1.readFlag == 2 then
			arg_34_0:setSpriteTo("resources/mail_read", var_34_4, true)
		else
			arg_34_0:setSpriteTo("resources/mail_unread", var_34_4, true)
		end

		setActive(var_34_2, arg_34_1.readFlag == 2)
	end

	local var_34_7 = findTF(var_34_1, "title")

	setText(var_34_7, shortenString(arg_34_1.title, 15))

	local var_34_8 = findTF(var_34_1, "date")

	setText(var_34_8, os.date("%m/%d/%y", arg_34_1.date))
	setActive(var_34_1:Find("star"), arg_34_1.importantFlag == 1)
	setActive(var_34_1:Find("check_mark"), arg_34_0.lastOpenMailId == arg_34_1.id)

	if arg_34_0.lastOpenMailId == arg_34_1.id then
		arg_34_0:openMail(arg_34_1)
	end
end

function var_0_0.onDelete(arg_37_0, arg_37_1)
	if arg_37_1.attachFlag == arg_37_1.ATTACHMENT_EXIST then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("main_mailLayer_quest_deleteNotTakeAttach"),
			onYes = function()
				arg_37_0:emit(MailMediator.ON_DELETE, arg_37_1.id)
			end
		})
	elseif arg_37_1.attachFlag == arg_37_1.ATTACHMENT_EXIST then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("main_mailLayer_quest_deleteNotRead"),
			onYes = function()
				arg_37_0:emit(MailMediator.ON_DELETE, arg_37_1.id)
			end
		})
	else
		arg_37_0:emit(MailMediator.ON_DELETE, arg_37_1.id)
	end
end

function var_0_0.showMsgBox(arg_40_0, arg_40_1)
	arg_40_0.isShowMsgBox = true

	setActive(arg_40_0.msgBoxTF, true)
	onButton(arg_40_0, arg_40_0.msgCancelBtn, function()
		arg_40_0:closeMsgBox()
	end, SFX_PANEL)
	onButton(arg_40_0, arg_40_0.msgConfirmBtn, function()
		if arg_40_1.onYes then
			arg_40_1.onYes()
		end

		arg_40_0:closeMsgBox()
	end, SFX_PANEL)
	onButton(arg_40_0, arg_40_0.msgBoxTF, function()
		arg_40_0:closeMsgBox()
	end, SFX_PANEL)
	onButton(arg_40_0, arg_40_0:findTF("window/top/btnBack", arg_40_0.msgBoxTF), function()
		arg_40_0:closeMsgBox()
	end, SFX_PANEL)
	removeAllChildren(arg_40_0.msgItemContainerTF)

	local var_40_0 = arg_40_1.items or {}

	for iter_40_0, iter_40_1 in pairs(var_40_0) do
		local var_40_1 = cloneTplTo(arg_40_0.msgItemTF, arg_40_0.msgItemContainerTF)

		updateDrop(var_40_1, iter_40_1)
	end

	arg_40_0.msgContentTF.text = i18n2(arg_40_1.content) or ""
end

function var_0_0.closeMsgBox(arg_45_0)
	if arg_45_0.isShowMsgBox then
		arg_45_0.isShowMsgBox = nil

		setActive(arg_45_0.msgBoxTF, false)
	end
end

function var_0_0.willExit(arg_46_0)
	arg_46_0:UnblurMailBox()
	arg_46_0:closeMsgBox()
end

return var_0_0
