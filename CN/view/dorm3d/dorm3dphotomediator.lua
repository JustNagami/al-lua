local var_0_0 = class("Dorm3dPhotoMediator", import("view.base.ContextMediator"))

var_0_0.SHARE_PANEL = "Dorm3dPhotoMediator:SHARE_PANEL"
var_0_0.Camera_Pinch_Value_Change = "Camera_Pinch_Value_Change"

function var_0_0.register(arg_1_0)
	local var_1_0 = pg.m02:retrieveMediator(Dorm3dSceneMediator.__cname):getViewComponent()

	arg_1_0.viewComponent:SetSceneRoot(var_1_0)

	local var_1_1 = var_1_0:GetApartment()

	arg_1_0.viewComponent:SetApartment(var_1_1)
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
end

function var_0_0.listNotificationInterests(arg_3_0)
	return {
		ApartmentProxy.UPDATE_APARTMENT,
		var_0_0.Camera_Pinch_Value_Change
	}
end

function var_0_0.handleNotification(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_1:getName()
	local var_4_1 = arg_4_1:getBody()

	if var_4_0 == ApartmentProxy.UPDATE_APARTMENT then
		-- block empty
	elseif var_4_0 == var_0_0.Camera_Pinch_Value_Change then
		arg_4_0.viewComponent:SetCamaraPinchSliderValue(arg_4_1.body.value)
	end
end

function var_0_0.remove(arg_5_0)
	return
end

return var_0_0
