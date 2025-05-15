local var_0_0 = class("IslandAcceptTaskCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody().taskIds

	for iter_1_0, iter_1_1 in ipairs(var_1_0) do
		warning("Req AcceptTask", iter_1_1)
	end

	pg.ConnectionMgr.GetInstance():Send(21032, {
		task_id_list = var_1_0
	}, 21033, function(arg_2_0)
		local var_2_0 = getProxy(IslandProxy):GetIsland():GetTaskAgency()
		local var_2_1 = {}

		for iter_2_0, iter_2_1 in ipairs(arg_2_0.task_list or {}) do
			warning("Real AcceptTask", iter_2_1.id)

			local var_2_2 = IslandTask.New(iter_2_1)

			var_2_0:AddTask(var_2_2)
			table.insert(var_2_1, iter_2_1.id)
		end

		if #var_1_0 ~= #var_2_1 then
			pg.TipsMgr.GetInstance():ShowTips("!!!部分任务接取失败,请检查配置!!!")
		end

		arg_1_0:sendNotification(GAME.ISLAND_ACCEPT_TASK_DONE, {
			taskIds = var_2_1
		})
	end)
end

return var_0_0
