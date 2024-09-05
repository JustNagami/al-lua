local var_0_0 = class("Dorm3dRoomUnlockWindowMediator", import("view.base.ContextMediator"))

var_0_0.ON_UNLOCK_DORM_ROOM = "Dorm3dRoomUnlockWindowMediator.ON_UNLOCK_DORM_ROOM"

function var_0_0.register(arg_1_0)
	arg_1_0:bind(var_0_0.ON_UNLOCK_DORM_ROOM, function(arg_2_0, arg_2_1)
		arg_1_0:sendNotification(GAME.APARTMENT_ROOM_UNLOCK, {
			roomId = arg_2_1
		})
	end)
end

function var_0_0.initNotificationHandleDic(arg_3_0)
	arg_3_0.handleDic = {
		[GAME.APARTMENT_ROOM_UNLOCK_DONE] = function(arg_4_0, arg_4_1)
			local var_4_0 = arg_4_1:getBody()

			arg_4_0.viewComponent:closeView()
		end
	}
end

function var_0_0.remove(arg_5_0)
	return
end

return var_0_0
