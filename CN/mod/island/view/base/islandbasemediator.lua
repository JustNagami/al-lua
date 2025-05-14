local var_0_0 = class("IslandBaseMediator", import("view.base.ContextMediator"))

var_0_0.SET_UP = "IslandBaseScene:SET_UP"

function var_0_0.register(arg_1_0)
	arg_1_0:bind(var_0_0.SET_UP, function(arg_2_0)
		arg_1_0:SetUp()
	end)
	arg_1_0:_register()
end

function var_0_0.listNotificationInterests(arg_3_0)
	return arg_3_0:_listNotificationInterests()
end

function var_0_0.handleNotification(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_1:getName()
	local var_4_1 = arg_4_1:getBody()

	arg_4_0:_handleNotification(arg_4_1)
	arg_4_0.viewComponent:emit(var_4_0, var_4_1)
end

function var_0_0.SetUp(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_0.viewComponent:GetIsland()

	_IslandCore = IslandCore.New(var_5_0, arg_5_1)
end

function var_0_0.SwitchScene(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = arg_6_0.viewComponent:GetIsland()

	var_6_0:SetMapId(arg_6_1)

	if arg_6_2 then
		var_6_0:SetSpawnPointId(arg_6_2)
	end

	arg_6_0:UnloadScene()
	arg_6_0:SetUp(true)
end

function var_0_0.UnloadScene(arg_7_0, arg_7_1)
	arg_7_0.viewComponent:OnUnloadScene()

	if _IslandCore then
		_IslandCore:Dispose(arg_7_1)

		_IslandCore = nil
	end
end

function var_0_0.remove(arg_8_0)
	arg_8_0:UnloadScene(true)
	arg_8_0:_remove()
end

function var_0_0._register(arg_9_0)
	return
end

function var_0_0._listNotificationInterests(arg_10_0)
	return {}
end

function var_0_0._handleNotification(arg_11_0, arg_11_1)
	return
end

function var_0_0._remove(arg_12_0)
	return
end

return var_0_0
