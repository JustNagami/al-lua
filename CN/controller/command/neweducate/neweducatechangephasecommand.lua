local var_0_0 = class("NewEducateChangePhaseCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody().id

	pg.ConnectionMgr.GetInstance():Send(29025, {
		id = var_1_0
	}, 29026, function(arg_2_0)
		if arg_2_0.result == 0 then
			NewEducateHelper.TrackRoundEnd()

			local var_2_0 = getProxy(NewEducateProxy):GetCurChar()

			var_2_0:GetFSM():SetCurNode(arg_2_0.first_node)
			var_2_0:GetFSM():SetStystemNo(NewEducateFSM.STYSTEM.PHASE)

			local var_2_1 = NewEducateHelper.MergeDrops(arg_2_0.drop)

			NewEducateHelper.UpdateDropsData(var_2_1)

			if not var_2_0:GetRoundData():IsEndRound() then
				getProxy(NewEducateProxy):NextRound()
			end

			var_2_0:GetFSM():SetCurNode(arg_2_0.first_node)
			arg_1_0:sendNotification(GAME.NEW_EDUCATE_CHANGE_PHASE_DONE, {
				drops = NewEducateHelper.FilterBenefit(var_2_1),
				node = arg_2_0.first_node
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("NewEducate_ChangePhase: ", arg_2_0.result))
		end
	end)
end

return var_0_0
