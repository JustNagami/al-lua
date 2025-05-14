local var_0_0 = class("NcSendEvent", import("..base.NodeCanvasBaseTask"))

function var_0_0.OnExecute(arg_1_0)
	local var_1_0 = arg_1_0:GetStringArg("eventName")

	arg_1_0:SendEvent(ISLAND_EVT[var_1_0], {
		node = arg_1_0
	})
	arg_1_0:EndAction()
end

return var_0_0
