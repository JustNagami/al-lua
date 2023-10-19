slot0 = class("GuideEventTrigger")

slot0.Ctor = function(slot0, slot1, slot2, slot3, slot4, slot5)
	pg.DelegateInfo.New(slot0)

	if slot1 == GuideFindUIStep.TRIGGER_TYPE_BUTTON then
		slot0:HandleBtnTrigger(slot2, slot3, slot5)
	elseif slot1 == GuideFindUIStep.TRIGGER_TYPE_TOGGLE then
		slot0:HandleToggleTrigger(slot2, slot3, slot4, slot5)
	elseif slot1 == GuideFindUIStep.EVENT_TYPE_CLICK then
		slot0:HandleClickTrigger(slot2, slot3, slot5)
	elseif slot1 == GuideFindUIStep.EVENT_TYPE_STICK then
		slot0:HandleStickTrigger(slot2, slot3, slot5)
	elseif slot1 == GuideFindUIStep.SHOW_UI then
		slot0:HandleShowUITrigger(slot2, slot3, slot5)
	elseif slot1 == GuideFindUIStep.TRIGGER_TYPE_BUTTONEX then
		slot0:HandleBtnExTrigger(slot2, slot3, slot4, slot5)
	end
end

slot0.HandleBtnTrigger = function(slot0, slot1, slot2, slot3)
	onButton(slot0, slot1, function ()
		if IsNil(uv0) then
			return
		end

		uv1()
		triggerButton(uv0)
	end, SFX_PANEL)
end

slot0.HandleBtnExTrigger = function(slot0, slot1, slot2, slot3, slot4)
	onButton(slot0, slot1, function ()
		if IsNil(uv0) then
			return
		end

		uv1()
		uv2()
	end, SFX_PANEL)
end

slot0.HandleToggleTrigger = function(slot0, slot1, slot2, slot3, slot4)
	onToggle(slot0, slot1, function (slot0)
		if IsNil(uv0) then
			return
		end

		uv1()
		triggerToggle(uv0, slot0)
	end, SFX_PANEL)
end

slot0.HandleClickTrigger = function(slot0, slot1, slot2, slot3)
	slot4 = slot2:GetComponent(typeof(EventTriggerListener))
	slot5 = slot1:GetComponent(typeof(EventTriggerListener))

	slot5:AddPointDownFunc(function (slot0, slot1)
		if not IsNil(uv0) then
			uv1:OnPointerDown(slot1)
		end
	end)
	slot5:AddPointUpFunc(function (slot0, slot1)
		uv0()

		if not IsNil(uv1) then
			uv2:OnPointerUp(slot1)
		end

		if not IsNil(uv1) then
			uv2:OnPointerClick(slot1)
		end
	end)
end

slot0.HandleStickTrigger = function(slot0, slot1, slot2, slot3)
	slot4 = GetOrAddComponent(slot1, typeof(EventTriggerListener))

	slot4:AddPointDownFunc(function (slot0, slot1)
		if IsNil(uv0) then
			return
		end

		uv1()
	end)
end

slot0.HandleShowUITrigger = function(slot0, slot1, slot2, slot3)
	slot4 = GetOrAddComponent(slot1, typeof(EventTriggerListener))

	slot4:AddPointUpFunc(function (slot0, slot1)
		if IsNil(uv0) then
			return
		end

		uv1()
	end)
end

slot0.Clear = function(slot0)
	pg.DelegateInfo.Dispose(slot0)
end

return slot0
