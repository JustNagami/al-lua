local var_0_0 = class("HMSFramePage", import(".TemplatePage.NewFrameTemplatePage"))

function var_0_0.Switch(arg_1_0, arg_1_1)
	local var_1_0
	local var_1_1

	if arg_1_1 then
		var_1_0, var_1_1 = arg_1_0.phases[1], arg_1_0.phases[2]
	else
		var_1_0, var_1_1 = arg_1_0.phases[2], arg_1_0.phases[1]
	end

	local var_1_2 = GetOrAddComponent(var_1_0, typeof(CanvasGroup))
	local var_1_3 = var_1_0.localPosition
	local var_1_4 = var_1_1.localPosition

	var_1_1:SetAsLastSibling()
	setActive(var_1_0:Find("Image"), false)
	setActive(var_1_0:Find("label"), true)
	setActive(var_1_1:Find("Image"), true)
	setActive(var_1_1:Find("label"), false)
end

return var_0_0
