local var_0_0 = class("IslandSubmitTaskCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.taskId
	local var_1_2 = var_1_0.callback

	warning("SubmitTask", var_1_1)
	pg.ConnectionMgr.GetInstance():Send(21038, {
		task_id = var_1_1
	}, 21039, function(arg_2_0)
		if arg_2_0.result == 0 then
			local var_2_0 = getProxy(IslandProxy):GetIsland():GetTaskAgency()
			local var_2_1 = var_2_0:GetTask(var_1_1)
			local var_2_2 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()

			for iter_2_0, iter_2_1 in ipairs(var_2_1:GetRecycleItemInfos()) do
				var_2_2:RemoveItem(iter_2_1.id, iter_2_1.count)
			end

			var_2_0:RemoveTask(var_1_1)
			var_2_0:AddFinishId(var_1_1)

			local var_2_3 = IslandDropHelper.AddItems(arg_2_0)

			arg_1_0:sendNotification(GAME.ISLAND_SUBMIT_TASK_DONE, {
				taskId = var_1_1,
				dropData = var_2_3,
				callback = var_1_2
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

return var_0_0
