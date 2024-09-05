local var_0_0 = class("SelectDorm3DMediator", import("view.base.ContextMediator"))

var_0_0.ON_DORM = "SelectDorm3DMediator.ON_DORM"
var_0_0.ON_UNLOCK_DORM_ROOM = "SelectDorm3DMediator.ON_UNLOCK_DORM_ROOM"
var_0_0.OPEN_ROOM_UNLOCK_WINDOW = "SelectDorm3DMediator.OPEN_ROOM_UNLOCK_WINDOW"
var_0_0.ON_SUBMIT_TASK = "SelectDorm3DMediator.ON_SUBMIT_TASK"

function var_0_0.register(arg_1_0)
	arg_1_0:bind(var_0_0.ON_DORM, function(arg_2_0, arg_2_1, arg_2_2)
		if arg_2_1 == 1 then
			(function()
				local var_3_0 = table.concat(arg_2_2.groupIds, ",")

				pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataRoom(arg_2_2.roomId, 7, var_3_0))
			end)()
			arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.DORM3D_VOLLEYBALL, arg_2_2)
		elseif arg_2_1 == 2 then
			pg.SceneAnimMgr.GetInstance():Dorm3DSceneChange(function(arg_4_0)
				arg_2_2.resumeCallback = arg_4_0

				arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.DORM3D, arg_2_2)
			end)
		else
			assert(false)
		end
	end)
	arg_1_0:bind(var_0_0.ON_UNLOCK_DORM_ROOM, function(arg_5_0, arg_5_1)
		arg_1_0:sendNotification(GAME.APARTMENT_ROOM_UNLOCK, {
			roomId = arg_5_1
		})
	end)
	arg_1_0:bind(var_0_0.OPEN_ROOM_UNLOCK_WINDOW, function(arg_6_0, arg_6_1)
		arg_1_0:addSubLayers(Context.New({
			viewComponent = Dorm3dRoomUnlockWindow,
			mediator = Dorm3dRoomUnlockWindowMediator,
			data = {
				roomId = arg_6_1
			}
		}))
	end)
	arg_1_0:bind(var_0_0.ON_SUBMIT_TASK, function(arg_7_0, arg_7_1)
		arg_1_0:sendNotification(GAME.SUBMIT_TASK, arg_7_1)
	end)
end

function var_0_0.initNotificationHandleDic(arg_8_0)
	arg_8_0.handleDic = {
		[DormGroupConst.NotifyDormDownloadStart] = function(arg_9_0, arg_9_1)
			local var_9_0 = arg_9_1:getBody()

			arg_9_0.viewComponent:DownloadUpdate(DormGroupConst.DormDownloadLock.roomId, "start")
		end,
		[DormGroupConst.NotifyDormDownloadProgress] = function(arg_10_0, arg_10_1)
			local var_10_0 = arg_10_1:getBody()

			arg_10_0.viewComponent:DownloadUpdate(DormGroupConst.DormDownloadLock.roomId, "loading")
		end,
		[DormGroupConst.NotifyDormDownloadFinish] = function(arg_11_0, arg_11_1)
			arg_11_0.viewComponent:DownloadUpdate(arg_11_1:getBody(), "finish")
		end,
		[GAME.APARTMENT_ROOM_UNLOCK_DONE] = function(arg_12_0, arg_12_1)
			local var_12_0 = arg_12_1:getBody()

			arg_12_0.viewComponent:AfterRoomUnlock(var_12_0)
		end,
		[PlayerProxy.UPDATED] = function(arg_13_0, arg_13_1)
			local var_13_0 = arg_13_1:getBody()

			arg_13_0.viewComponent:UpdateRes()
		end,
		[GAME.SUBMIT_TASK_DONE] = function(arg_14_0, arg_14_1)
			local var_14_0 = arg_14_1:getBody()

			if arg_14_1:getType()[1] == getDorm3dGameset("drom3d_weekly_task")[1] then
				if #var_14_0 > 0 then
					arg_14_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_14_0, function()
						arg_14_0.viewComponent:UpdateWeekTask()
					end)
				else
					arg_14_0.viewComponent:UpdateWeekTask()
				end
			end
		end
	}
end

return var_0_0
