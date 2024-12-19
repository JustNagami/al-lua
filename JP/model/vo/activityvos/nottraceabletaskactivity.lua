local var_0_0 = class("NotTraceableTaskActivity", import("model.vo.ActivityVOs.ITaskActivity"))

function var_0_0.GetTaskIdsByDay(arg_1_0)
	return arg_1_0:getConfig("config_data")
end

function var_0_0.GetCurrentDay(arg_2_0, arg_2_1)
	local var_2_0 = 86400
	local var_2_1 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_2_2 = arg_2_0:getConfig("time")
	local var_2_3 = pg.TimeMgr.GetInstance():parseTimeFromConfig(var_2_2[2])
	local var_2_4 = math.ceil((var_2_1 - var_2_3) / var_2_0)
	local var_2_5 = arg_2_0:getConfig("config_data")

	if var_2_4 > #var_2_5 then
		var_2_4 = #var_2_5
	end

	return var_2_4
end

return var_0_0
