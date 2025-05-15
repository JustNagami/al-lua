local var_0_0 = class("NodeCanvasBaseTask", import(".NodeCanvasBaseObject"))

function var_0_0.Execute(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0:Init(arg_1_1, arg_1_2)
	arg_1_0:OnExecute()
end

function var_0_0.Update(arg_2_0)
	arg_2_0:OnUpdate()
end

function var_0_0.Stop(arg_3_0)
	arg_3_0:OnStop()
end

function var_0_0.Pause(arg_4_0)
	arg_4_0:OnPause()
end

function var_0_0.Resume(arg_5_0)
	arg_5_0:OnResume()
end

function var_0_0.EndAction(arg_6_0, arg_6_1)
	local var_6_0 = arg_6_0:GetNodeInstance()

	if var_6_0 then
		var_6_0:EndAction(defaultValue(arg_6_1, true))
	end
end

function var_0_0.SendEvent(arg_7_0, arg_7_1, arg_7_2)
	if not _IslandCore then
		return
	end

	_IslandCore:GetController():NotifiyCore(arg_7_1, arg_7_2)
	_IslandCore:GetController():NotifiyIsland(arg_7_1, arg_7_2)
end

function var_0_0.OnExecute(arg_8_0)
	return
end

function var_0_0.OnUpdate(arg_9_0)
	return
end

function var_0_0.OnStop(arg_10_0)
	return
end

function var_0_0.OnPause(arg_11_0)
	return
end

function var_0_0.OnResume(arg_12_0)
	return
end

return var_0_0
