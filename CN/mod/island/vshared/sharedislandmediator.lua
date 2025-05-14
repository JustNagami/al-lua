local var_0_0 = class("SharedIslandMediator", import("..View.base.IslandBaseMediator"))

var_0_0.EXIT = "SharedIslandMediator:EXIT"

function var_0_0._register(arg_1_0)
	arg_1_0:bind(var_0_0.EXIT, function(arg_2_0, arg_2_1)
		arg_1_0:sendNotification(GAME.ISLAND_EXIT_SHARED, {
			id = arg_2_1
		})
	end)
end

function var_0_0._listNotificationInterests(arg_3_0)
	return {
		GAME.ISLAND_EXIT_SHARED_DONE
	}
end

function var_0_0._handleNotification(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_1:getName()
	local var_4_1 = arg_4_1:getBody()

	if var_4_0 == GAME.ISLAND_EXIT_SHARED_DONE then
		arg_4_0.viewComponent:emit(BaseUI.ON_HOME)
	end
end

return var_0_0
