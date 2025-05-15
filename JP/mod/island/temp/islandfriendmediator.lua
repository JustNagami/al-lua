local var_0_0 = class("IslandFriendMediator", import("view.friend.FriendMediator"))

var_0_0.MODIFY_ACCESS_TYPE = "IslandFriendMediator:MODIFY_ACCESS_TYPE"
var_0_0.ACCESS_OP = "IslandFriendMediator:ACCESS_OP"
var_0_0.ENTER_ISLAND = "IslandFriendMediator:ENTER_ISLAND"

function var_0_0.register(arg_1_0)
	var_0_0.super.register(arg_1_0)
	arg_1_0:bind(var_0_0.MODIFY_ACCESS_TYPE, function(arg_2_0, arg_2_1)
		arg_1_0:sendNotification(GAME.ISLAND_SET_ACCESS_TYPE, {
			flag = arg_2_1
		})
	end)
	arg_1_0:bind(var_0_0.ACCESS_OP, function(arg_3_0, arg_3_1, arg_3_2)
		arg_1_0:sendNotification(GAME.ISLAND_ACCESS_OP, {
			op = arg_3_1,
			list = arg_3_2
		})
	end)
	arg_1_0:bind(var_0_0.ENTER_ISLAND, function(arg_4_0, arg_4_1)
		arg_1_0:sendNotification(GAME.ISLAND_ENTER, {
			id = arg_4_1
		})
	end)
end

function var_0_0.listNotificationInterests(arg_5_0)
	local var_5_0 = var_0_0.super.listNotificationInterests(arg_5_0)
	local var_5_1 = {
		GAME.ISLAND_ACCESS_OP_DONE
	}

	for iter_5_0, iter_5_1 in ipairs(var_5_1) do
		table.insert(var_5_0, iter_5_1)
	end

	return var_5_0
end

function var_0_0.handleNotification(arg_6_0, arg_6_1)
	var_0_0.super.handleNotification(arg_6_0, arg_6_1)

	local var_6_0 = arg_6_1:getName()
	local var_6_1 = arg_6_1:getBody()

	if var_6_0 == GAME.ISLAND_ACCESS_OP_DONE and var_6_1.op == IslandConst.ACCESS_OP_SET_WHITELIST then
		arg_6_0.viewComponent:UpdateWhiteList()
	end
end

return var_0_0
