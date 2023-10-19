slot0 = class("VoteGroupRaceShipPage", import("..PreRace.VotePreRaceShipPage"))

slot0.getUIName = function(slot0)
	return "GroupRaceShips"
end

slot0.onInitItem = function(slot0, slot1)
	uv0.super.onInitItem(slot0, slot1)
	onButton(slot0, slot0.voteItems[slot1].go, function ()
		if uv0.CallBack then
			if uv0.phase == VoteGroup.DISPLAY_STAGE then
				uv0.CallBack(uv1, uv1.voteShip.totalVotes)
			else
				uv0.CallBack(uv1, uv1.voteShip.votes)
			end
		end
	end, SFX_PANEL)
end

slot0.UpdateShip = function(slot0, slot1, slot2, slot3)
	slot2:update(slot3, slot0.voteGroup:GetRank(slot3))

	if slot0.voteGroup:GetRankMark() == 4 and slot4 == 4 then
		slot2.rank.text = string.format("<material=gradient from=#FF8c1c to=#ff0000 x=0 y=-1>%s<size=30>%s</size></material>", slot4, "th")
	elseif slot5 < slot4 then
		slot2.rank.text = ""
	end
end

slot0.UpdateShips = function(slot0, slot1, slot2)
	slot0.scrollRect:SetTotalCount(#slot0.displays)
end

slot0.OnDestroy = function(slot0)
end

return slot0
