slot0 = class("StoryEventTriggerListener", pm.Mediator)

function slot0.Ctor(slot0, slot1)
	slot0.eventList = slot1

	uv0.super.Ctor(slot0)
	pg.m02:registerMediator(slot0)

	slot0.caches = {}
end

function slot0.listNotificationInterests(slot0)
	return slot0.eventList
end

function slot0.handleNotification(slot0, slot1)
	slot2 = slot1:getName()
	slot3 = slot1:getBody()

	print(slot2, slot3)

	slot0.caches[slot2] = {
		slot3
	}
end

function slot0.Clear(slot0)
	slot0.caches = {}
end

function slot0.ExistCache(slot0, slot1)
	return slot0.caches[slot1] ~= nil
end

function slot0.ExistArg(slot0, slot1)
	return slot0.caches[slot1][1] ~= nil
end

function slot0.GetArg(slot0, slot1)
	if not slot0:ExistCache(slot1) then
		return nil
	end

	if not slot0:ExistArg(slot1) then
		return nil
	end

	return slot0.caches[slot1][1]
end

function slot0.Dispose(slot0)
	slot0:Clear()
	pg.m02:removeMediator(slot0.__cname)
end

return slot0
