local var_0_0 = class("SelectDorm3DMediator", import("view.base.ContextMediator"))

var_0_0.ON_DORM = "SelectDorm3DMediator.ON_DORM"
var_0_0.ON_UNLOCK_DORM_ROOM = "SelectDorm3DMediator.ON_UNLOCK_DORM_ROOM"
var_0_0.ON_SUBMIT_TASK = "SelectDorm3DMediator.ON_SUBMIT_TASK"
var_0_0.OPEN_INVITE_LAYER = "SelectDorm3DMediator.OPEN_INVITE_LAYER"
var_0_0.OPEN_ROOM_UNLOCK_WINDOW = "SelectDorm3DMediator.OPEN_ROOM_UNLOCK_WINDOW"
var_0_0.OPEN_INS_LAYER = "SelectDorm3DMediator.OPEN_INS_LAYER"

function var_0_0.register(arg_1_0)
	arg_1_0:bind(var_0_0.ON_DORM, function(arg_2_0, arg_2_1)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.DORM3D_ROOM, arg_2_1)
	end)
	arg_1_0:bind(var_0_0.ON_UNLOCK_DORM_ROOM, function(arg_3_0, arg_3_1)
		arg_1_0:sendNotification(GAME.APARTMENT_ROOM_UNLOCK, {
			roomId = arg_3_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_SUBMIT_TASK, function(arg_4_0, arg_4_1)
		arg_1_0:sendNotification(GAME.SUBMIT_TASK, arg_4_1)
	end)
	arg_1_0:bind(var_0_0.OPEN_ROOM_UNLOCK_WINDOW, function(arg_5_0, arg_5_1)
		arg_1_0:addSubLayers(Context.New({
			viewComponent = Dorm3dRoomUnlockWindow,
			mediator = Dorm3dRoomUnlockWindowMediator,
			data = {
				roomId = arg_5_1
			}
		}))
	end)
	arg_1_0:bind(var_0_0.OPEN_INVITE_LAYER, function(arg_6_0, arg_6_1, arg_6_2)
		arg_1_0:addSubLayers(Context.New({
			viewComponent = Dorm3dInviteLayer,
			mediator = Dorm3dInviteMediator,
			data = {
				roomId = arg_6_1,
				groupIds = arg_6_2
			}
		}))
	end)
	arg_1_0:bind(var_0_0.OPEN_INS_LAYER, function(arg_7_0, arg_7_1)
		arg_1_0:addSubLayers(Context.New({
			viewComponent = Dorm3dInsMainLayer,
			mediator = Dorm3dInsMainMediator,
			data = {
				isPhone = arg_7_1
			},
			onRemoved = function()
				arg_1_0.viewComponent:FlushInsBtn()
			end
		}))
	end)

	if not arg_1_0.contextData.hasEnterCheck then
		arg_1_0.contextData.hasEnterCheck = true

		arg_1_0:sendNotification(GAME.SELECT_DORM_ENTER)
	end
end

function var_0_0.initNotificationHandleDic(arg_9_0)
	arg_9_0.handleDic = {
		[DormGroupConst.NotifyDormDownloadStart] = function(arg_10_0, arg_10_1)
			local var_10_0 = arg_10_1:getBody()

			arg_10_0.viewComponent:DownloadUpdate(DormGroupConst.DormDownloadLock.roomId, "start")
		end,
		[DormGroupConst.NotifyDormDownloadProgress] = function(arg_11_0, arg_11_1)
			local var_11_0 = arg_11_1:getBody()

			arg_11_0.viewComponent:DownloadUpdate(DormGroupConst.DormDownloadLock.roomId, "loading")
		end,
		[DormGroupConst.NotifyDormDownloadFinish] = function(arg_12_0, arg_12_1)
			arg_12_0.viewComponent:DownloadUpdate(arg_12_1:getBody(), "finish")
		end,
		[Dorm3dInsMainMediator.NotifyDormDelete] = function(arg_13_0, arg_13_1)
			arg_13_0.viewComponent:DownloadUpdate(arg_13_1:getBody(), "delete")
		end,
		[GAME.APARTMENT_ROOM_UNLOCK_DONE] = function(arg_14_0, arg_14_1)
			local var_14_0 = arg_14_1:getBody()

			arg_14_0.viewComponent:AfterRoomUnlock(var_14_0)
		end,
		[PlayerProxy.UPDATED] = function(arg_15_0, arg_15_1)
			local var_15_0 = arg_15_1:getBody()

			arg_15_0.viewComponent:UpdateRes()
		end,
		[GAME.SUBMIT_TASK_DONE] = function(arg_16_0, arg_16_1)
			local var_16_0 = arg_16_1:getBody()

			if arg_16_1:getType()[1] == getDorm3dGameset("drom3d_weekly_task")[1] then
				if #var_16_0 > 0 then
					arg_16_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_16_0, function()
						arg_16_0.viewComponent:UpdateWeekTask()
					end)
				else
					arg_16_0.viewComponent:UpdateWeekTask()
				end
			end
		end,
		[Dorm3dInviteMediator.ON_DORM] = function(arg_18_0, arg_18_1)
			local var_18_0 = arg_18_1:getBody()

			arg_18_0:sendNotification(GAME.GO_SCENE, SCENE.DORM3D_ROOM, var_18_0)
		end,
		[ApartmentProxy.ZERO_HOUR_REFRESH] = function(arg_19_0, arg_19_1)
			local var_19_0 = arg_19_1:getBody()

			arg_19_0.viewComponent:UpdateStamina()
		end
	}
end

return var_0_0
