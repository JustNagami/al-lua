slot0 = class("Dorm3dFurnitureSlot", import("model.vo.BaseVO"))

function slot0.bindConfigTable(slot0)
	return pg.dorm3d_furniture_slot_template
end

function slot0.GetName(slot0)
	return slot0:getConfig("name")
end

function slot0.GetType(slot0)
	return slot0:getConfig("type")
end

function slot0.GetShipGroupId(slot0)
	return slot0:getConfig("char_id")
end

function slot0.GetZoneID(slot0)
	return slot0:getConfig("zone_id")
end

function slot0.GetDefaultFurniture(slot0)
	return slot0:getConfig("default_furniture")
end

function slot0.GetFurnitureName(slot0)
	return slot0:getConfig("furniture_name")
end

function slot0.CanUseFurniture(slot0, slot1)
	if slot1:GetType() ~= slot0:GetType() then
		return false
	end

	if #slot1:GetTargetSlots() == 0 then
		return true
	end

	return table.contains(slot2, slot0:GetConfigID())
end

return slot0
