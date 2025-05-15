local var_0_0 = class("NcPlayGuide", import("..base.NodeCanvasBaseTask"))

function var_0_0.OnExecute(arg_1_0)
	local var_1_0 = arg_1_0:GetStringArg("guide")

	pg.NewGuideMgr.GetInstance():Play(var_1_0, {}, function()
		arg_1_0:EndAction()
	end, nil)
end

return var_0_0
