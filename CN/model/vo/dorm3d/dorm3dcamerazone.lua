slot0 = class("Dorm3dCameraZone", import("model.vo.BaseVO"))

function slot0.bindConfigTable(slot0)
	return pg.dorm3d_camera_zone_template
end

function slot0.Ctor(slot0, slot1)
	uv0.super.Ctor(slot0, slot1)

	slot0.regulaAnims = _.map(slot0:GetRegularAnimIDList(), function (slot0)
		return Dorm3dCameraAnim.New({
			configId = slot0
		})
	end)
	slot0.specialAnims = _.map(slot0:GetSpecialFurnitureIDList(), function (slot0)
		slot1 = slot0[1]

		return {
			furnitureId = slot1,
			slotId = slot0[2],
			anims = _.map(uv0:GetSpecialAnimIDListByFurnitureID(slot1), function (slot0)
				return Dorm3dCameraAnim.New({
					configId = slot0
				})
			end)
		}
	end)
end

function slot0.GetName(slot0)
	return slot0:getConfig("name")
end

function slot0.GetShipGroupId(slot0)
	return slot0:getConfig("char_id")
end

function slot0.GetWatchCameraName(slot0)
	return slot0:getConfig("watch_camera")
end

function slot0.GetRegularAnimIDList(slot0)
	return slot0:getConfig("regular_anim") or {}
end

function slot0.GetRegularAnims(slot0)
	return slot0.regulaAnims
end

function slot0.GetSpecialFurnitureIDList(slot0)
	return slot0:getConfig("special_furniture") or {}
end

function slot0.GetSpecialAnimIDListByFurnitureID(slot0, slot1)
	return pg.dorm3d_camera_anim_template.get_id_list_by_furniture_id[slot1] or {}
end

function slot0.GetSpecialAnims(slot0)
	return slot0.specialAnims
end

function slot0.GetAnimSpeeds(slot0)
	return slot0:getConfig("anim_speeds")
end

function slot0.Get(slot0)
	return slot0:getConfig("")
end

function slot0.GetRecordTime(slot0)
	return slot0:getConfig("record_time")
end

function slot0.GetFocusDistanceRange(slot0)
	return slot0:getConfig("focus_distance")
end

function slot0.GetDepthOfFieldBlurRange(slot0)
	return slot0:getConfig("blur_strength")
end

function slot0.GetExposureRange(slot0)
	return slot0:getConfig("exposure")
end

function slot0.GetContrastRange(slot0)
	return slot0:getConfig("contrast")
end

function slot0.GetSaturationRange(slot0)
	return slot0:getConfig("saturation")
end

return slot0
