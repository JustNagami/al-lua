local var_0_0 = class("Dorm3dPhotoMediator", import("view.base.ContextMediator"))

var_0_0.SHARE_PANEL = "Dorm3dPhotoMediator:SHARE_PANEL"
var_0_0.CAMERA_LIFT_CHANGED = "CAMERA_LIFT_CHANGED"
var_0_0.CAMERA_STICK_MOVE = "CAMERA_STICK_MOVE"
var_0_0.GO_AR = "Dorm3dPhotoMediator:GO_AR"

function var_0_0.register(arg_1_0)
	local var_1_0 = arg_1_0.contextData.view

	arg_1_0.viewComponent:SetSceneRoot(var_1_0)
	arg_1_0.viewComponent:SetRoom(var_1_0.room)
	arg_1_0:bind(var_0_0.SHARE_PANEL, function(arg_2_0, arg_2_1, arg_2_2)
		arg_1_0:addSubLayers(Context.New({
			mediator = Dorm3dPhotoShareLayerMediator,
			viewComponent = Dorm3dPhotoShareLayer,
			data = {
				photoTex = arg_2_1,
				photoData = arg_2_2
			}
		}))
	end)
	arg_1_0:bind(var_0_0.GO_AR, function(arg_3_0, arg_3_1)
		if LOCK_DORM3D_AR then
			pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_AR_switch"))

			return
		end

		if pg.SdkMgr.GetInstance():IsYunPackage() then
			pg.TipsMgr.GetInstance():ShowTips("指挥官，当前平台不支持该功能哦")

			return
		end

		local var_3_0
		local var_3_1

		local function var_3_2()
			arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.DORM3D_AR, {
				ARCheckState = arg_3_1,
				roomId = var_1_0.room:GetConfigID(),
				groupId = var_1_0.apartment:GetConfigID()
			})
		end

		local function var_3_3()
			if CameraHelper.IsAndroid() then
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("apply_permission_camera_tip3"),
					onYes = function()
						CameraHelper.RequestCamera(var_3_2, var_3_3)
					end
				})
			elseif CameraHelper.IsIOS() then
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("apply_permission_camera_tip2")
				})
			end
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("apply_permission_camera_tip1"),
			onYes = function()
				CameraHelper.RequestCamera(var_3_2, var_3_3)
			end
		})
	end)
end

function var_0_0.listNotificationInterests(arg_8_0)
	return {
		ApartmentProxy.UPDATE_APARTMENT,
		var_0_0.CAMERA_LIFT_CHANGED,
		var_0_0.CAMERA_STICK_MOVE
	}
end

function var_0_0.handleNotification(arg_9_0, arg_9_1)
	local var_9_0 = arg_9_1:getName()
	local var_9_1 = arg_9_1:getBody()

	if var_9_0 == ApartmentProxy.UPDATE_APARTMENT then
		-- block empty
	elseif var_9_0 == var_0_0.CAMERA_LIFT_CHANGED then
		arg_9_0.viewComponent:SetPhotoCameraSliderValue(var_9_1.value)
	elseif var_9_0 == var_0_0.CAMERA_STICK_MOVE then
		arg_9_0.viewComponent:SetPhotoStickDelta(var_9_1)
	end
end

function var_0_0.remove(arg_10_0)
	return
end

return var_0_0
