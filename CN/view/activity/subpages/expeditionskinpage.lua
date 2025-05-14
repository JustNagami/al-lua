local var_0_0 = class("ExpeditionSkinPage", import(".TemplatePage.SkinTemplatePage"))

function var_0_0.OnUpdateFlush(arg_1_0)
	var_0_0.super.OnUpdateFlush(arg_1_0)

	if arg_1_0.dayTF then
		setText(arg_1_0.dayTF, arg_1_0.nday .. "/" .. #arg_1_0.taskGroup)
	end
end

function var_0_0.GetProgressColor(arg_2_0)
	return "#b9b49c"
end

return var_0_0
