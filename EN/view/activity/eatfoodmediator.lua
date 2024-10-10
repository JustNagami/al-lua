local var_0_0 = class("EatFoodMediator", import("..base.ContextMediator"))

var_0_0.GAME_HIT_AREA = "game hit score"
var_0_0.GAME_CLOSE = "game close"
var_0_0.GAME_RESULT = "game result"
var_0_0.HIT_AREA = "EatFoodMediator:event hit area"
var_0_0.LEAVE_GAME = "EatFoodMediato:event leave game"
var_0_0.RESULT = "EatFoodMediato:event result"

function var_0_0.register(arg_1_0)
	arg_1_0:bind(EatFoodMediator.GAME_HIT_AREA, function(arg_2_0, arg_2_1, arg_2_2)
		arg_1_0:sendNotification(EatFoodMediator.HIT_AREA, arg_2_1)
	end)
	arg_1_0:bind(EatFoodMediator.GAME_CLOSE, function(arg_3_0, arg_3_1, arg_3_2)
		arg_1_0:sendNotification(EatFoodMediator.LEAVE_GAME, arg_3_1)
	end)
	arg_1_0:bind(EatFoodMediator.GAME_RESULT, function(arg_4_0, arg_4_1, arg_4_2)
		arg_1_0:sendNotification(EatFoodMediator.RESULT, arg_4_1)
	end)
end

function var_0_0.listNotificationInterests(arg_5_0)
	return {}
end

function var_0_0.handleNotification(arg_6_0, arg_6_1)
	local var_6_0 = arg_6_1:getName()
	local var_6_1 = arg_6_1:getBody()
end

return var_0_0
