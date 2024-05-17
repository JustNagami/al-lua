slot0 = class("Dorm3dPhotoMediator", import("view.base.ContextMediator"))

function slot0.register(slot0)
	slot2 = pg.m02:retrieveMediator(Dorm3dSceneMediator.__cname):getViewComponent()

	slot0.viewComponent:SetSceneRoot(slot2)
	slot0.viewComponent:SetApartment(slot2:GetApartment())
	slot0:bind(SnapshotScene.SHARE_PANEL, function (slot0, slot1, slot2)
		uv0:addSubLayers(Context.New({
			mediator = SnapshotShareMediator,
			viewComponent = SnapshotShareLayer,
			data = {
				photoTex = slot1,
				photoData = slot2
			}
		}))
	end)
end

function slot0.listNotificationInterests(slot0)
	return {
		ApartmentProxy.UPDATE_APARTMENT
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == ApartmentProxy.UPDATE_APARTMENT then
		-- Nothing
	end
end

function slot0.remove(slot0)
end

return slot0
