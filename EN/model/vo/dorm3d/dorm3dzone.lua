slot0 = class("Dorm3dZone", import("model.vo.BaseVO"))

function slot0.bindConfigTable(slot0)
	return pg.dorm3d_zone_template
end

function slot0.GetName(slot0)
	return slot0:getConfig("name")
end

function slot0.GetShipGroupId(slot0)
	return slot0:getConfig("char_id")
end

function slot0.IsGlobal(slot0)
	return slot0:getConfig("is_global") == 1
end

function slot0.GetWatchCameraName(slot0)
	return slot0:getConfig("watch_camera")
end

function slot0.GetSlotIDList(slot0)
	return pg.dorm3d_furniture_slot_template.get_id_list_by_zone_id[slot0.configId] or {}
end

function slot0.SetSlots(slot0, slot1)
	slot0.slots = slot1
end

function slot0.GetSlots(slot0)
	return slot0.slots or {}
end

function slot0.GetTypePriorities(slot0)
	if slot0:getConfig("type_prioritys") == nil or slot1 == "" then
		return {}
	end

	return slot1
end

function slot0.SortTypes(slot0, slot1)
	slot2 = slot0:GetTypePriorities()

	table.sort(slot1, CompareFuncs({
		function (slot0)
			return table.indexof(uv0, slot0) or 99
		end,
		function (slot0)
			return -slot0
		end
	}))
end

return slot0
