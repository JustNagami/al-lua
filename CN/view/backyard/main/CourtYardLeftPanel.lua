slot0 = class("CourtYardLeftPanel", import(".CourtYardBasePanel"))

slot0.GetUIName = function(slot0)
	return "main/leftPanel"
end

slot0.init = function(slot0)
	slot0.trainBtn = slot0:findTF("train_btn")
	slot0.trainBtnTxt = slot0.trainBtn:Find("Text"):GetComponent(typeof(Text))
	slot0.restBtn = slot0:findTF("rest_btn")
	slot0.restBtnTxt = slot0.restBtn:Find("Text"):GetComponent(typeof(Text))
end

slot0.OnRegister = function(slot0)
	onButton(slot0, slot0.trainBtn, function ()
		uv0:emit(CourtYardMediator.SEL_TRAIN_SHIP)
	end, SFX_PANEL)
	onButton(slot0, slot0.restBtn, function ()
		uv0:emit(CourtYardMediator.SEL_REST_SHIP)
	end, SFX_PANEL)
	slot0:UpdateFloor()
end

slot0.UpdateFloor = function(slot0)
	slot0:SetActive(slot0.trainBtn, slot0.contextData.floor == 1)
	slot0:SetActive(slot0.restBtn, slot0.contextData.floor == 2)
end

slot0.OnVisitRegister = function(slot0)
	slot0:SetActive(slot0.trainBtn, false)
	slot0:SetActive(slot0.restBtn, false)
end

slot0.GetMoveX = function(slot0)
	return {
		{
			slot0._tf,
			-1
		}
	}
end

slot0.OnFlush = function(slot0, slot1)
	if bit.band(slot1 or BackYardConst.DORM_UPDATE_TYPE_SHIP, BackYardConst.DORM_UPDATE_TYPE_SHIP) > 0 then
		slot0.trainBtnTxt.text = slot0.dorm:GetStateShipCnt(Ship.STATE_TRAIN) .. "/" .. slot0.dorm.exp_pos
		slot0.restBtnTxt.text = slot0.dorm:GetStateShipCnt(Ship.STATE_REST) .. "/" .. slot0.dorm.rest_pos
	end
end

return slot0
