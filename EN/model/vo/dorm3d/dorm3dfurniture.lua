slot0 = class("Dorm3dFurniture", import("model.vo.BaseVO"))
slot0.TYPE = {
	DECORATION = 3,
	FLOOR = 2,
	COUCH = 5,
	BED = 4,
	WALLPAPER = 1,
	TABLE = 6
}
slot0.TYPE2NAME = {
	"dorm3d_furnitrue_type_wallpaper",
	"dorm3d_furnitrue_type_floor",
	"dorm3d_furnitrue_type_decoration",
	"dorm3d_furnitrue_type_bed",
	"dorm3d_furnitrue_type_couch",
	"dorm3d_furnitrue_type_table"
}

function slot0.bindConfigTable(slot0)
	return pg.dorm3d_furniture_template
end

function slot0.Ctor(slot0, slot1)
	uv0.super.Ctor(slot0, slot1)

	slot0.slotId = slot0.slotId or 0
end

function slot0.GetSlotID(slot0)
	return slot0.slotId
end

function slot0.SetSlotID(slot0, slot1)
	slot0.slotId = slot1
end

function slot0.GetName(slot0)
	return slot0:getConfig("name")
end

function slot0.GetType(slot0)
	return slot0:getConfig("type")
end

function slot0.GetRarity(slot0)
	return slot0:getConfig("rarity")
end

function slot0.GetTargetSlots(slot0)
	return slot0:getConfig("target_slots")
end

function slot0.GetShipGroupId(slot0)
	return slot0:getConfig("char_id")
end

function slot0.GetIcon(slot0)
	return slot0:getConfig("icon")
end

function slot0.GetModel(slot0)
	return slot0:getConfig("model")
end

function slot0.GetAcesses(slot0)
	if slot0:getConfig("acesses") == nil or slot1 == "" then
		return {}
	end

	return slot1
end

return slot0
