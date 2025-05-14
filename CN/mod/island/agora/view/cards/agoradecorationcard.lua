local var_0_0 = class("AgoraDecorationCard")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0._go = arg_1_1
	arg_1_0.tr = arg_1_1.transform
	arg_1_0.mask = arg_1_0.tr:Find("mask")
	arg_1_0.mark = arg_1_0.tr:Find("mark")
	arg_1_0.nameTxt = arg_1_0.tr:Find("name"):GetComponent(typeof(Text))
	arg_1_0.using = arg_1_0.tr:Find("using")
	arg_1_0.usingText = arg_1_0.using:Find("Text"):GetComponent(typeof(Text))
	arg_1_0.notowned = arg_1_0.tr:Find("notowned")
	arg_1_0.cntTxt = arg_1_0.tr:Find("cnt/Text"):GetComponent(typeof(Text))
	arg_1_0.usingText.text = i18n1("使用中")
end

function var_0_0.Update(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	arg_2_0.item = arg_2_1
	arg_2_0.isUsing = arg_2_2
	arg_2_0.nameTxt.text = arg_2_1:GetName()

	setActive(arg_2_0.using, arg_2_2)
	setActive(arg_2_0.mark, arg_2_0.item.id == arg_2_3)
	setActive(arg_2_0.notowned, false)

	arg_2_0.cntTxt.text = 1
end

function var_0_0.Dispose(arg_3_0)
	return
end

return var_0_0
