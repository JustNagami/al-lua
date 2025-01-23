local var_0_0 = class("NewEducateAssessCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0 and var_1_0.callback
	local var_1_2 = var_1_0.id
	local var_1_3 = var_1_0.rank

	pg.ConnectionMgr.GetInstance():Send(29013, {
		id = var_1_2,
		rank = var_1_3
	}, 29014, function(arg_2_0)
		if arg_2_0.result == 0 then
			local var_2_0 = getProxy(NewEducateProxy):GetCurChar()

			var_2_0:GetFSM():SetCurNode(arg_2_0.first_node)
			var_2_0:GetFSM():SetStystemNo(NewEducateFSM.STYSTEM.ASSESS)
			var_2_0:AddAssessRecord(var_2_0:GetRoundData().round, var_1_3)

			if arg_2_0.first_node ~= 0 then
				arg_1_0:sendNotification(GAME.NEW_EDUCATE_NODE_START, {
					node = arg_2_0.first_node
				})
			else
				existCall(var_1_1)
			end
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("NewEducate_Assess: ", arg_2_0.result))
		end
	end)
end

return var_0_0
