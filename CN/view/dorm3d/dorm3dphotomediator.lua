local var_0_0 = class("Dorm3dPhotoMediator", import("view.base.ContextMediator"))

var_0_0.SHARE_PANEL = "Dorm3dPhotoMediator:SHARE_PANEL"
var_0_0.Camera_Pinch_Value_Change = "Camera_Pinch_Value_Change"
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

		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.DORM3D_AR, {
			ARCheckState = arg_3_1,
			roomId = var_1_0.room:GetConfigID(),
			groupId = var_1_0.apartment:GetConfigID()
		})
	end)
end

function var_0_0.listNotificationInterests(arg_4_0)
	return {
		ApartmentProxy.UPDATE_APARTMENT,
		var_0_0.Camera_Pinch_Value_Change
	}
end

function var_0_0.handleNotification(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_1:getName()
	local var_5_1 = arg_5_1:getBody()

	if var_5_0 == ApartmentProxy.UPDATE_APARTMENT then
		-- block empty
	elseif var_5_0 == var_0_0.Camera_Pinch_Value_Change then
		-- block empty
	end
end

function var_0_0.remove(arg_6_0)
	return
end

return var_0_0
