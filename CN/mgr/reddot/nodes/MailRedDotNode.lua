local var_0_0 = class("MailRedDotNode", import(".RedDotNode"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0._mailMsg = findTF(arg_1_1, "unread")
	arg_1_0._mailEmpty = findTF(arg_1_1, "read")
	arg_1_0._attachmentHint = findTF(arg_1_1, "attachmentLabel")
	arg_1_0._attachmentCountText = findTF(arg_1_0._attachmentHint, "attachmentCountText"):GetComponent(typeof(Text))

	var_0_0.super.Ctor(arg_1_0, arg_1_1, {
		pg.RedDotMgr.TYPES.MAIL
	})
end

function var_0_0.GetName(arg_2_0)
	return arg_2_0.gameObject.name
end

function var_0_0.Init(arg_3_0)
	var_0_0.super.Init(arg_3_0)

	local var_3_0 = getProxy(MailProxy)

	if var_3_0.total >= 1000 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("warning_mail_max_2"))
	elseif var_3_0.total >= 950 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("warning_mail_max_1", var_3_0.total))
	end
end

function var_0_0.SetData(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_1

	if var_4_0 > 0 then
		SetActive(arg_4_0._attachmentHint, true)
		SetActive(arg_4_0._mailEmpty, false)
		SetActive(arg_4_0._mailMsg, true)

		arg_4_0.gameObject:GetComponent(typeof(Button)).targetGraphic = arg_4_0._mailMsg:GetComponent(typeof(Image))
		arg_4_0._attachmentCountText.text = var_4_0
	else
		SetActive(arg_4_0._mailEmpty, true)
		SetActive(arg_4_0._mailMsg, false)
		SetActive(arg_4_0._attachmentHint, false)

		arg_4_0.gameObject:GetComponent(typeof(Button)).targetGraphic = arg_4_0._mailEmpty:GetComponent(typeof(Image))
	end
end

return var_0_0
