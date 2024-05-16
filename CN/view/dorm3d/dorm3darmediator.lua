slot0 = class("Dorm3dARMediator", import("view.base.ContextMediator"))

function slot0.register(slot0)
end

function slot0.listNotificationInterests(slot0)
	return {}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == nil then
		-- Nothing
	end
end

return slot0
