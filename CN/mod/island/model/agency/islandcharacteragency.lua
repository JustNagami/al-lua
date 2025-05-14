local var_0_0 = class("IslandCharacterAgency", import(".IslandBaseAgency"))

var_0_0.ADD_SHIP = "IslandCharacterAgency:ADD_SHIP"
var_0_0.SHIP_LEVEL_UP = "IslandCharacterAgency:SHIP_LEVEL_UP"
var_0_0.SHIP_GET_STATE = "IslandCharacterAgency:SHIP_GET_STATE"

function var_0_0.OnInit(arg_1_0, arg_1_1)
	arg_1_0.ships = {}

	for iter_1_0, iter_1_1 in ipairs(arg_1_1.ship_list or {}) do
		local var_1_0 = IslandShip.New(iter_1_1)

		arg_1_0.ships[var_1_0.id] = var_1_0
	end
end

function var_0_0.GetShips(arg_2_0)
	local var_2_0 = {}

	for iter_2_0, iter_2_1 in pairs(arg_2_0.ships) do
		table.insert(var_2_0, iter_2_1)
	end

	return var_2_0
end

function var_0_0.AddShip(arg_3_0, arg_3_1)
	arg_3_0.ships[arg_3_1.id] = arg_3_1

	arg_3_0:DispatchEvent(var_0_0.ADD_SHIP, arg_3_1)
end

function var_0_0.GetShipById(arg_4_0, arg_4_1)
	return arg_4_0.ships[arg_4_1]
end

function var_0_0.GetShipByConfigId(arg_5_0, arg_5_1)
	for iter_5_0, iter_5_1 in ipairs(arg_5_0.ships) do
		if iter_5_1.configId == arg_5_1 then
			return iter_5_1
		end
	end

	return nil
end

function var_0_0.GetUnlockOrCanUnlockShipConfigIds(arg_6_0)
	local var_6_0 = {}
	local var_6_1 = {}

	for iter_6_0, iter_6_1 in pairs(arg_6_0.ships) do
		var_6_1[iter_6_1.configId] = true
	end

	for iter_6_2, iter_6_3 in ipairs(pg.island_ship.all) do
		if var_6_1[iter_6_3] or IslandShip.StaticCanUnlock(iter_6_3) then
			table.insert(var_6_0, iter_6_3)
		end
	end

	table.sort(var_6_0, CompareFuncs({
		function(arg_7_0)
			return var_6_1[arg_7_0] and 0 or 1
		end,
		function(arg_8_0)
			return arg_8_0
		end
	}))

	return var_6_0
end

function var_0_0.ExtraShipAward(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = arg_9_0:GetShipById(arg_9_1)
	local var_9_1 = var_9_0:GetExtraAwardList(arg_9_2)
	local var_9_2 = var_9_0.level

	var_9_0:AddExp(var_9_1[1])

	if var_9_2 < var_9_0.level then
		arg_9_0:DispatchEvent(IslandCharacterAgency.SHIP_LEVEL_UP, var_9_0)
	end

	var_9_0:UpdateExtraAwardValue(arg_9_2)
end

function var_0_0.AddShipState(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = arg_10_0:GetShipById(arg_10_1)

	var_10_0:AddEnergy(arg_10_2)

	local var_10_1 = var_10_0:GetFavoriteGift()

	if table.contains(var_10_1, arg_10_1) then
		local var_10_2 = IslandShip.StaticGetGiftStatue()
		local var_10_3 = pg.island_ship_state[var_10_2].duration

		if not var_10_0:ExistStatus(var_10_2) then
			arg_10_0:DispatchEvent(IslandCharacterAgency.SHIP_GET_STATE, {
				ship = var_10_0,
				status = status
			})
		end

		var_10_0:AddStatus(var_10_2, var_10_3)
	end
end

return var_0_0
