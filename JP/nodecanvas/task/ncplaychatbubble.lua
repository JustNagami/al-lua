local var_0_0 = class("NcPlayChatBubble", import("..base.NodeCanvasBaseTask"))

function var_0_0.OnExecute(arg_1_0)
	local var_1_0 = arg_1_0:GetStringArg("storyName")

	arg_1_0:DoAction(var_1_0, function()
		arg_1_0:EndAction()
	end)
end

function var_0_0.DoAction(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0:SendEvent(ISLAND_EVT.PLAY_BUBBLE, {
		name = arg_3_1,
		callback = arg_3_2
	})
end

return var_0_0
