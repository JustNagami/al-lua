slot0 = class("Dorm3dCameraAnim", import("model.vo.BaseVO"))

function slot0.bindConfigTable(slot0)
	return pg.dorm3d_camera_anim_template
end

function slot0.GetName(slot0)
	return slot0:getConfig("desc")
end

function slot0.GetStateName(slot0)
	return slot0:getConfig("state")
end

function slot0.GetAnimTime(slot0)
	return slot0:getConfig("anim_time")
end

function slot0.GetPreAnimID(slot0)
	return slot0:getConfig("pre_anim")
end

function slot0.GetFinishAnimID(slot0)
	return slot0:getConfig("finish_anim")
end

function slot0.GetUnlockRequirment(slot0)
	return slot0:getConfig("unlock")
end

function slot0.GetFurnitureID(slot0)
	return slot0:getConfig("furniture_id")
end

return slot0
