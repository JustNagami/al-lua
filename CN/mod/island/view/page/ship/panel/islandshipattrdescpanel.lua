local var_0_0 = class("IslandShipAttrDescPanel")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.tr = arg_1_1
	arg_1_0.labelTxt = findTF(arg_1_1, "label"):GetComponent(typeof(Text))
	arg_1_0.gradeTxt = findTF(arg_1_1, "label/Text"):GetComponent(typeof(Text))
	arg_1_0.descTxt = findTF(arg_1_1, "Text"):GetComponent(typeof(Text))
	arg_1_0.hideTime = 5
end

function var_0_0.Show(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	arg_2_0.tr.localPosition = arg_2_3 + Vector3(-150, -30, 0)

	setActive(arg_2_0.tr, true)

	local var_2_0 = arg_2_1:GetAttrGradeStr(arg_2_2)
	local var_2_1 = IslandShipAttr.ToChinese(arg_2_2)
	local var_2_2 = arg_2_1:GetAttrGradeValue(arg_2_2)

	arg_2_0.labelTxt.text = var_2_1 .. i18n1("成长")
	arg_2_0.gradeTxt.text = var_2_0
	arg_2_0.descTxt.text = i18n1(string.format("每提升一级可以增加角色%s点%s属性值", var_2_2, var_2_1)) .. "\n" .. i18n1("属性描述...")

	arg_2_0:AddTimer()
end

function var_0_0.AddTimer(arg_3_0)
	arg_3_0:RemoveTimer()

	arg_3_0.timer = Timer.New(function()
		arg_3_0:Hide()
	end, arg_3_0.hideTime, 1)

	arg_3_0.timer:Start()
end

function var_0_0.RemoveTimer(arg_5_0)
	if arg_5_0.timer then
		arg_5_0.timer:Stop()
	end

	arg_5_0.timer = nil
end

function var_0_0.Hide(arg_6_0)
	setActive(arg_6_0.tr, false)
end

function var_0_0.Dispose(arg_7_0)
	arg_7_0:Hide()
	arg_7_0:RemoveTimer()
end

return var_0_0
