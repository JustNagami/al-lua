local var_0_0 = class("JapanV3FrameRePage", import(".TemplatePage.FrameReTemplatePage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.super.OnInit(arg_1_0)

	arg_1_0.bar = arg_1_0:findTF("frame/barContent/bar", arg_1_0.bg)
end

return var_0_0
