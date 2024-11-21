local var_0_0 = class("MiniGameTaskProgressUpdateCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.taskId
	local var_1_2 = pg.task_data_template[var_1_1]
	local var_1_3 = getProxy(TaskProxy)
	local var_1_4 = var_1_3:getTaskById(var_1_1)

	if not var_1_4 then
		return
	end

	local var_1_5 = var_1_4:getConfig("sub_type")
	local var_1_6 = tonumber(var_1_4:getConfig("target_id"))
	local var_1_7 = var_1_0.progressAdd

	pg.ConnectionMgr.GetInstance():Send(20016, {
		event_type = var_1_5,
		event_target = var_1_6,
		event_count = var_1_7
	}, 20017, function(arg_2_0)
		if arg_2_0.result == 0 then
			local var_2_0 = var_1_4.progress + var_1_7

			var_1_4:updateProgress(var_2_0)
			var_1_3:updateTask(var_1_4)
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

return var_0_0
