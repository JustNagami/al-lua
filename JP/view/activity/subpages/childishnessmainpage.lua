local var_0_0 = class("ChildishnessMainPage", import(".TemplatePage.PreviewTemplatePage"))

function var_0_0.OnFirstFlush(arg_1_0)
	arg_1_0.super.OnFirstFlush(arg_1_0)
	onButton(arg_1_0, arg_1_0:findTF("fight", arg_1_0.btnList), function()
		arg_1_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.KINDERGARTEN)
	end)
	onButton(arg_1_0, arg_1_0:findTF("shop", arg_1_0.btnList), function()
		arg_1_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.SKINSHOP)
	end)
end

return var_0_0
