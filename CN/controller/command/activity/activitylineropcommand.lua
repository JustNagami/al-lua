local var_0_0 = class("ActivityLinerOPCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.callback
	local var_1_2 = getProxy(ActivityProxy)
	local var_1_3 = var_1_2:getActivityById(var_1_0.activity_id)

	if not var_1_3 or var_1_3:isEnd() then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(11202, {
		activity_id = var_1_0.activity_id,
		cmd = var_1_0.cmd or 0,
		arg1 = var_1_0.arg1 or 0,
		arg2 = var_1_0.arg2 or 0,
		arg_list = {}
	}, 11203, function(arg_2_0)
		if arg_2_0.result == 0 then
			local var_2_0 = {}
			local var_2_1 = PlayerConst.addTranDrop(arg_2_0.award_list)

			if var_1_0.cmd == 1 then
				local var_2_2 = var_1_3:GetCurTime()

				switch(var_2_2:GetType(), {
					[LinerTime.TYPE.TARGET] = function()
						return
					end,
					[LinerTime.TYPE.EXPLORE] = function()
						var_1_3:AddExploredRoom(var_1_0.arg1)
					end,
					[LinerTime.TYPE.EVENT] = function()
						var_1_3:AddEvent(var_1_0.arg1, var_1_0.arg2)
					end,
					[LinerTime.TYPE.STORY] = function()
						return
					end
				})

				if var_1_3:CheckTimeFinish() then
					var_1_3:UpdateTimeIdx()
					var_1_3:UpdateRoomIdx(true)
				end

				if var_1_3:CheckRoomFinish() then
					var_1_3:UpdateRoomIdx(false)
				end
			elseif var_1_0.cmd == 2 then
				var_1_3:AddTimeAwardFlag(var_1_0.arg1)
			elseif var_1_0.cmd == 3 then
				var_1_3:AddRoomAwardFlag(var_1_0.arg1)
			elseif var_1_0.cmd == 4 then
				var_1_3:AddEventAwardFlag(var_1_0.arg1, var_1_0.arg2)
			end

			var_1_2:updateActivity(var_1_3)

			if var_1_1 then
				var_1_1()
			end

			arg_1_0:sendNotification(GAME.ACTIVITY_LINER_OP_DONE, {
				awards = var_2_1
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

return var_0_0
