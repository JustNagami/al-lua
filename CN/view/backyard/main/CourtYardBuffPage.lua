slot0 = class("CourtYardBuffPage", import("...base.BaseSubView"))

slot0.getUIName = function(slot0)
	return "CourtYardBuffListPanel"
end

slot0.OnLoaded = function(slot0)
	slot0.group = slot0:findTF("buff_group")
	slot0.tpl = slot0:findTF("bufftpl", slot0.group)
	slot0.buffTip = slot0:findTF("tip")
	slot0.buffTipTxt = slot0.buffTip:Find("Text"):GetComponent(typeof(Text))
end

slot0.OnInit = function(slot0)
	slot0.buffCards = {}
end

slot0.GetTpl = function(slot0)
	slot1 = nil
	slot2 = true

	for slot6, slot7 in pairs(slot0.buffCards) do
		slot2 = false

		if not slot7:IsUsing() then
			slot1 = slot7._tf

			break
		end
	end

	if not slot1 and not slot2 then
		slot1 = Object.Instantiate(slot0.tpl, slot0.tpl.parent)
	elseif not slot1 and slot2 then
		slot1 = slot0.tpl
	end

	return slot1
end

slot0.Show = function(slot0, slot1)
	uv0.super.Show(slot0)
	slot0:Flush(slot1)
end

slot0.Flush = function(slot0, slot1)
	for slot5, slot6 in pairs(slot0.buffCards) do
		slot6:RemoveTimer()
	end

	for slot5 = 1, #slot1 do
		slot6 = slot0:GetTpl()

		slot0:FlushBuff(slot1[slot5], slot6)

		slot6.anchoredPosition = Vector2(0, -(slot5 - 1) * (slot0.tpl.sizeDelta.y + 30))
	end
end

slot0.FlushBuff = function(slot0, slot1, slot2)
	if not slot0.buffCards[slot2] then
		slot0.buffCards[slot2] = CourtYardBuffCard.New(slot2.gameObject)
	end

	slot3:Flush(slot1)
	onButton(slot0, slot3._tf, function ()
		uv0:DisplayBuffDesc(uv1)
	end, SFX_PANEL)
end

slot0.DisplayBuffDesc = function(slot0, slot1)
	slot2 = slot1.buff
	slot3 = slot0.buffTip

	slot3:SetAsLastSibling()
	LeanTween.cancel(slot0.buffTip.gameObject)

	rtf(slot0.buffTip).anchoredPosition = rtf(slot1._tf).anchoredPosition + Vector2(slot0.tpl.sizeDelta.x * 0.5, slot0.tpl.sizeDelta.y * -0.5)
	slot0.buffTipTxt.text = slot2:getConfig("desc")
	slot4 = LeanTween.scale(rtf(slot0.buffTip), Vector3(1, 1, 1), 0.3)

	slot4:setOnComplete(System.Action(function ()
		if not IsNil(uv0.buffTip) then
			LeanTween.scale(rtf(uv0.buffTip), Vector3(0, 0, 0), 0.3):setDelay(2)
		end
	end))
end

slot0.OnDestroy = function(slot0)
	slot1 = pairs
	slot2 = slot0.buffCards or {}

	for slot4, slot5 in slot1(slot2) do
		slot5:Dispose()
	end

	slot0.buffCards = nil
end

return slot0
