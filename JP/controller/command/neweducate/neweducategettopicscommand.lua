local var_0_0 = class("NewEducateGetTopicsCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0 and var_1_0.callback
	local var_1_2 = var_1_0.id

	pg.ConnectionMgr.GetInstance():Send(29015, {
		id = var_1_2
	}, 29016, function(arg_2_0)
		if arg_2_0.result == 0 then
			local var_2_0 = getProxy(NewEducateProxy):GetCurChar():GetFSM()

			var_2_0:SetStystemNo(NewEducateFSM.STYSTEM.TOPIC)

			local var_2_1 = NewEducateTopicState.New({
				finished = 0,
				chats = arg_2_0.chats
			})

			var_2_0:SetState(NewEducateFSM.STYSTEM.TOPIC, var_2_1)
			existCall(var_1_1)
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("NewEducate_GetTopics", arg_2_0.result))
		end
	end)
end

return var_0_0
