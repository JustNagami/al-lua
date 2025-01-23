local var_0_0 = class("NewEducateSelMindCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody().id

	pg.ConnectionMgr.GetInstance():Send(29090, {
		id = var_1_0
	}, 29091, function(arg_2_0)
		if arg_2_0.result == 0 then
			local var_2_0 = getProxy(NewEducateProxy):GetCurChar():GetFSM()

			var_2_0:SetStystemNo(NewEducateFSM.STYSTEM.MIND)

			local var_2_1 = NewEducateStateBase.New()

			var_2_0:SetState(NewEducateFSM.STYSTEM.MIND, var_2_1)

			local var_2_2 = NewEducateHelper.MergeDrops(arg_2_0.drop)

			NewEducateHelper.UpdateDropsData(var_2_2)
			arg_1_0:sendNotification(GAME.NEW_EDUCATE_SEL_MIND_DONE, {
				drops = NewEducateHelper.FilterBenefit(var_2_2),
				node = arg_2_0.first_node
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("NewEducate_SelMind", arg_2_0.result))
		end
	end)
end

return var_0_0
