local var_0_0 = class("NewEducateSelTalentCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.id
	local var_1_2 = var_1_0.talentId
	local var_1_3 = var_1_0.idx

	pg.ConnectionMgr.GetInstance():Send(29023, {
		id = var_1_1,
		talent = var_1_2
	}, 29024, function(arg_2_0)
		if arg_2_0.result == 0 then
			local var_2_0 = getProxy(NewEducateProxy)

			var_2_0:AddBuff(var_1_2, 1)

			local var_2_1 = var_2_0:GetCurChar():GetFSM():GetState(NewEducateFSM.STYSTEM.TALENT)

			var_2_1:MarkFinish()
			arg_1_0:sendNotification(GAME.NEW_EDUCATE_SEL_TALENT_DONE, {
				idx = var_1_3
			})

			local var_2_2 = getProxy(NewEducateProxy):GetCurChar()

			pg.m02:sendNotification(GAME.NEW_EDUCATE_TRACK, NewEducateTrackCommand.BuildDataTalent(var_2_2.id, var_2_2:GetGameCnt(), var_2_2:GetRoundData().round, 2, var_1_2, table.concat(var_2_1:GetTalents(), ",")))
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("NewEducate_SelTalent", arg_2_0.result))
		end
	end)
end

return var_0_0
