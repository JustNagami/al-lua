slot0 = class("VoteOrderBookRedDotNode", import(".RedDotNode"))

slot0.Ctor = function(slot0, slot1, slot2)
	slot0.timeTxt = findTF(slot1, "tip/Text"):GetComponent(typeof(Text))

	uv0.super.Ctor(slot0, slot1, slot2)
end

slot0.SetData = function(slot0, slot1)
	slot2 = slot1 and not slot1:IsExpired()

	setActive(slot0.gameObject, slot2)
	slot0:RemoveTimer()

	if slot2 then
		slot0:AddTimer(slot1)
	end
end

slot0.AddTimer = function(slot0, slot1)
	slot0.timer = Timer.New(function ()
		uv0.timeTxt.text = uv1:GetCDTime("#9BB8FFFF")
	end, 1, -1)

	slot0.timer:Start()
	slot0.timer.func()
end

slot0.RemoveTimer = function(slot0)
	if slot0.timer then
		slot0.timer:Stop()

		slot0.timer = nil
	end
end

slot0.Remove = function(slot0)
	uv0.super.Remove(slot0)
	slot0:RemoveTimer()
end

return slot0
