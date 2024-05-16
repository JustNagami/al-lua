slot0 = class("ShipRarity")
slot0.Gray = 2
slot0.Blue = 3
slot0.Purple = 4
slot0.Gold = 5
slot0.SSR = 6

function slot0.Rarity2Print(slot0)
	return ItemRarity.Rarity2Print(slot0 - 1)
end

function slot0.SSRGradient(slot0)
	return "<material=outline c=#00000040 x=1 y=1><material=gradient from=#FF0000 to=#00FF00 x=1 y=1>" .. slot0 .. "</material></material>"
end

function shipRarity2bgPrint(slot0, slot1, slot2)
	table.insert({}, uv0.Rarity2Print(slot0))

	if slot1 then
		table.insert(slot3, "0")
	end

	if slot2 then
		table.insert(slot3, "1")
	end

	return table.concat(slot3, "_")
end

return slot0
