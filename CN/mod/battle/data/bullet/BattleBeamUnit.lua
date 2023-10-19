ys = ys or {}
slot0 = ys
slot1 = slot0.Battle.BattleDataFunction
slot2 = slot0.Battle.BattleVariable
slot0.Battle.BattleBeamUnit = class("BattleBeamUnit")
slot0.Battle.BattleBeamUnit.__name = "BattleBeamUnit"
slot3 = slot0.Battle.BattleBeamUnit
slot3.BEAM_STATE_READY = "ready"
slot3.BEAM_STATE_ATTACK = "attack"
slot3.BEAM_STATE_FINISH = "finish"

slot3.Ctor = function(slot0, slot1, slot2)
	slot0._bulletID = slot1
	slot0._beamInfoID = slot2
	slot0._cldList = {}
	slot0._beamState = uv0.BEAM_STATE_READY
end

slot3.IsBeamActive = function(slot0)
	return slot0._aoe:GetActiveFlag()
end

slot3.ClearBeam = function(slot0)
	slot0._beamState = uv0.BEAM_STATE_FINISH
	slot0._aoe = nil
	slot0._cldList = {}
	slot0._nextDamageTime = nil
end

slot3.SetAoeData = function(slot0, slot1)
	slot0._aoe = slot1
	slot0._beamTemp = uv0.GetBarrageTmpDataFromID(slot0._beamInfoID)
	slot0._bulletTemp = uv0.GetBulletTmpDataFromID(slot0._bulletID)
	slot0._angle = slot0._beamTemp.angle

	slot0._aoe:SetAngle(slot0._angle + slot0._aimAngle)

	if slot0._bulletTemp.extra_param.diveFilter then
		slot0._aoe:SetDiveFilter(slot2)
	end
end

slot3.SetAimAngle = function(slot0, slot1)
	slot0._aimAngle = slot1 or 0
end

slot3.SetAimPosition = function(slot0, slot1, slot2)
	slot0._aimAngle = math.rad2Deg * math.atan2(slot2.z - slot1.z, slot2.x - slot1.x)
end

slot3.getAngleRatio = function(slot0)
	return uv0.GetSpeedRatio(slot0._aoe:GetTimeRationExemptKey(), slot0._aoe:GetIFF())
end

slot3.GetAoeData = function(slot0)
	return slot0._aoe
end

slot3.UpdateBeamPos = function(slot0, slot1)
	slot0._aoe:SetPosition(Vector3(slot1.x + slot0._beamTemp.offset_x, 0, slot1.z + slot0._beamTemp.offset_z))
end

slot3.UpdateBeamAngle = function(slot0)
	slot0._angle = slot0._angle + slot0._beamTemp.delta_angle * slot0:getAngleRatio()

	slot0._aoe:SetAngle(slot0._angle + slot0._aimAngle)
end

slot3.AddCldUnit = function(slot0, slot1)
	slot0._cldList[slot1:GetUniqueID()] = slot1
end

slot3.RemoveCldUnit = function(slot0, slot1)
	slot0._cldList[slot1:GetUniqueID()] = nil
end

slot3.ChangeBeamState = function(slot0, slot1)
	slot0._beamState = slot1
end

slot3.GetBeamState = function(slot0)
	return slot0._beamState
end

slot3.GetCldUnitList = function(slot0)
	return slot0._cldList
end

slot3.BeginFocus = function(slot0)
	slot0._nextDamageTime = pg.TimeMgr.GetInstance():GetCombatTime() + slot0._beamTemp.senior_delay
end

slot3.DealDamage = function(slot0)
	slot0._nextDamageTime = pg.TimeMgr.GetInstance():GetCombatTime() + slot0._beamTemp.delta_delay
end

slot3.CanDealDamage = function(slot0)
	return slot0._nextDamageTime < pg.TimeMgr.GetInstance():GetCombatTime()
end

slot3.GetFXID = function(slot0)
	return slot0._bulletTemp.hit_fx
end

slot3.GetSFXID = function(slot0)
	return slot0._bulletTemp.hit_sfx
end

slot3.GetBulletID = function(slot0)
	return slot0._bulletID
end

slot3.GetBeamInfoID = function(slot0)
	return slot0._beamInfoID
end

slot3.GetBeamExtraParam = function(slot0)
	return slot0._bulletTemp.extra_param
end
