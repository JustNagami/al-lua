slot0 = class("MainIconView")

slot0.Ctor = function(slot0, slot1)
	slot0._tf = slot1
	slot0._go = slot1.gameObject
	slot0.name = ""
	slot0.isloading = false
end

slot0.Init = function(slot0, slot1)
	slot2 = slot1:getPainting()
	slot0.ship = slot1

	slot0:Unload()
	slot0:Load(slot2)

	slot0.name = slot2
	slot0.propose = slot1.propose
end

slot0.Refresh = function(slot0, slot1)
	if slot0.name ~= slot1:getPainting() then
		slot0:Init(slot1)
	else
		slot0.ship = slot1

		if slot0.spineAnim then
			slot0.spineAnim:Resume()
		end
	end

	slot0.propose = slot1.propose
end

slot0.Disable = function(slot0)
	if not IsNil(slot0.spineAnim) then
		slot0.spineAnim:Pause()
	end

	slot0.lpos = nil
end

slot0.Load = function(slot0, slot1)
	slot0.isloading = true
	slot2 = PoolMgr.GetInstance()

	slot2:GetSpineChar(slot1, true, function (slot0)
		if uv0.exited then
			return
		end

		LeanTween.cancel(slot0)

		uv0.isloading = false
		uv0.shipModel = slot0
		tf(slot0).localScale = Vector3(0.75, 0.75, 1)

		setParent(slot0, uv0._tf)

		tf(slot0).localPosition = Vector3(pg.ship_spine_shift[uv1] and slot1.mainui_shift[1] or 0, -130 + (slot1 and slot1.mainui_shift[2] or 0), 0)
		slot4 = slot0:GetComponent("SpineAnimUI")

		slot4:SetAction("normal", 0)

		uv0.spineAnim = slot4

		onNextTick(function ()
			if uv0.spineAnim then
				uv0.spineAnim:Resume()
			end
		end)
	end)
end

slot0.Unload = function(slot0)
	if slot0.name and slot0.shipModel then
		PoolMgr.GetInstance():ReturnSpineChar(slot0.name, slot0.shipModel)

		slot0.spineAnim = nil
	end
end

slot0.IsLoading = function(slot0)
	return slot0.isloading
end

slot0.Fold = function(slot0, slot1, slot2)
	slot0.lpos = slot0.lpos or slot0._tf.localPosition
	slot3 = slot1 and slot0.lpos.y + 200 or slot0.lpos.y

	if slot2 == 0 then
		slot0._go.transform.localPosition = Vector3(slot0._go.transform.localPosition.x, slot3, 0)
	else
		LeanTween.moveLocalY(slot0._go, slot3, slot2):setEase(LeanTweenType.easeInOutExpo)
	end
end

slot0.Dispose = function(slot0)
	slot0.exited = true

	slot0:Unload()
end

return slot0
