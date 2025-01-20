local var_0_0 = class("ChapterFleet", import(".LevelCellData"))

var_0_0.DUTY_CLEANPATH = 1
var_0_0.DUTY_KILLBOSS = 2
var_0_0.DUTY_KILLALL = 3
var_0_0.DUTY_IDLE = 4

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0:updateNpcShipList(arg_1_2)

	arg_1_0.id = arg_1_1.id
	arg_1_0.name = nil
	arg_1_0.fleetId = arg_1_1.fleet_id

	if arg_1_1.fleet_id then
		local var_1_0 = getProxy(FleetProxy):getFleetById(arg_1_1.fleet_id)

		arg_1_0.name = var_1_0 and var_1_0:GetName() or Fleet.DEFAULT_NAME[arg_1_1.fleet_id]
	end

	arg_1_0.name = arg_1_0.name or Fleet.DEFAULT_NAME[arg_1_0.id]

	local var_1_1 = {}
	local var_1_2 = {}
	local var_1_3 = {}

	_.each(arg_1_1.box_strategy_list, function(arg_2_0)
		var_1_1[arg_2_0.id] = arg_2_0.count
	end)
	_.each(arg_1_1.ship_strategy_list, function(arg_3_0)
		var_1_2[arg_3_0.id] = arg_3_0.count
	end)
	_.each(arg_1_1.strategy_ids, function(arg_4_0)
		if pg.strategy_data_template[arg_4_0] then
			table.insert(var_1_3, arg_4_0)
		end
	end)

	if not _.detect(var_1_3, function(arg_5_0)
		return pg.strategy_data_template[arg_5_0].type == ChapterConst.StgTypeForm
	end) then
		table.insert(var_1_3, arg_1_0:getFormationStg())
	end

	arg_1_0.stgPicked = var_1_1
	arg_1_0.stgUsed = var_1_2
	arg_1_0.stgIds = var_1_3
	arg_1_0.line = {
		row = arg_1_1.pos.row,
		column = arg_1_1.pos.column
	}
	arg_1_0.step = arg_1_1.step_count
	arg_1_0.restAmmo = arg_1_1.bullet
	arg_1_0.startPos = {
		row = arg_1_1.start_pos.row,
		column = arg_1_1.start_pos.column
	}

	arg_1_0:prepareShips(arg_1_1.ship_list)
	arg_1_0:updateShips(arg_1_1.ship_list)

	arg_1_0.baseSpeed = arg_1_0:calcBaseSpeed()
	arg_1_0.rotation = Quaternion.identity
	arg_1_0.slowSpeedFactor = arg_1_1.move_step_down
	arg_1_0.defeatEnemies = arg_1_1.kill_count or 0

	arg_1_0:updateCommanders(arg_1_1.commander_list)

	arg_1_0.skills = {}

	arg_1_0:updateCommanderSkills()
end

function var_0_0.setup(arg_6_0, arg_6_1)
	arg_6_0.chapter = arg_6_1
end

function var_0_0.fetchShipVO(arg_7_0, arg_7_1)
	local var_7_0

	if arg_7_0.npcShipList[arg_7_1] then
		var_7_0 = Clone(arg_7_0.npcShipList[arg_7_1])
	else
		var_7_0 = getProxy(BayProxy):getShipById(arg_7_1)
	end

	if arg_7_0.staticsReady then
		var_7_0.triggers.TeamNumbers = arg_7_0.statics[var_7_0:getTeamType()].count
	end

	return var_7_0
end

function var_0_0.updateNpcShipList(arg_8_0, arg_8_1)
	arg_8_0.npcShipList = {}

	for iter_8_0, iter_8_1 in ipairs(arg_8_1) do
		arg_8_0.npcShipList[iter_8_1.id] = iter_8_1
	end
end

function var_0_0.GetLine(arg_9_0)
	return arg_9_0.line
end

function var_0_0.SetLine(arg_10_0, arg_10_1)
	arg_10_0.line = {
		row = arg_10_1.row,
		column = arg_10_1.column
	}
end

function var_0_0.updateCommanders(arg_11_0, arg_11_1)
	arg_11_0.commanders = {}

	local var_11_0 = getProxy(CommanderProxy)

	for iter_11_0, iter_11_1 in ipairs(arg_11_1) do
		local var_11_1 = iter_11_1.id
		local var_11_2 = var_11_0:getCommanderById(var_11_1)

		if var_11_2 then
			arg_11_0.commanders[iter_11_1.pos] = var_11_2
		end
	end
end

function var_0_0.getCommanders(arg_12_0)
	return arg_12_0.commanders or {}
end

function var_0_0.prepareShips(arg_13_0, arg_13_1)
	arg_13_0.statics = {}
	arg_13_0.statics[TeamType.Vanguard] = {
		count = 0
	}
	arg_13_0.statics[TeamType.Main] = {
		count = 0
	}
	arg_13_0.statics[TeamType.Submarine] = {
		count = 0
	}

	_.each(arg_13_1 or {}, function(arg_14_0)
		local var_14_0 = arg_13_0:fetchShipVO(arg_14_0.id)

		if var_14_0 then
			local var_14_1 = arg_13_0.statics[var_14_0:getTeamType()]

			var_14_1.count = var_14_1.count + 1
		end
	end)

	arg_13_0.staticsReady = true
end

function var_0_0.updateShips(arg_15_0, arg_15_1)
	arg_15_0[TeamType.Vanguard] = {}
	arg_15_0[TeamType.Main] = {}
	arg_15_0[TeamType.Submarine] = {}
	arg_15_0.ships = {}

	_.each(arg_15_1 or {}, function(arg_16_0)
		local var_16_0 = arg_15_0:fetchShipVO(arg_16_0.id)

		if var_16_0 then
			var_16_0.hpRant = arg_16_0.hp_rant
			arg_15_0.ships[var_16_0.id] = var_16_0

			table.insert(arg_15_0[var_16_0:getTeamType()], var_16_0)
		end
	end)
	arg_15_0:ResortShips()
end

function var_0_0.ResortShips(arg_17_0)
	local var_17_0 = {
		TeamType.Vanguard,
		TeamType.Main,
		TeamType.Submarine
	}

	_.each(var_17_0, function(arg_18_0)
		local var_18_0 = arg_17_0[arg_18_0]
		local var_18_1 = {}

		table.Ipairs(var_18_0, function(arg_19_0, arg_19_1)
			var_18_1[arg_19_1] = arg_19_0
		end)
		table.sort(var_18_0, CompareFuncs({
			function(arg_20_0)
				return arg_20_0.hpRant > 0 and 0 or 1
			end,
			function(arg_21_0)
				return var_18_1[arg_21_0]
			end
		}))
	end)
end

function var_0_0.getTeamByName(arg_22_0, arg_22_1)
	local var_22_0 = {}
	local var_22_1 = arg_22_0[arg_22_1]

	for iter_22_0, iter_22_1 in ipairs(var_22_1) do
		table.insert(var_22_0, iter_22_1.id)
	end

	return var_22_0
end

function var_0_0.flushShips(arg_23_0)
	local var_23_0 = getProxy(FleetProxy):getFleetById(arg_23_0.fleetId)

	arg_23_0.name = var_23_0 and var_23_0.name ~= "" and var_23_0.name or Fleet.DEFAULT_NAME[arg_23_0.fleetId] or Fleet.DEFAULT_NAME[arg_23_0.id]

	local var_23_1 = _.keys(arg_23_0.ships)

	for iter_23_0, iter_23_1 in ipairs(var_23_1) do
		local var_23_2 = arg_23_0:fetchShipVO(iter_23_1)

		if var_23_2 then
			var_23_2.hpRant = arg_23_0.ships[iter_23_1].hpRant
		end

		arg_23_0.ships[iter_23_1] = var_23_2
	end

	local var_23_3 = {}

	_.each(arg_23_0[TeamType.Vanguard], function(arg_24_0)
		if arg_23_0.ships[arg_24_0.id] then
			table.insert(var_23_3, arg_23_0.ships[arg_24_0.id])
		end
	end)

	arg_23_0[TeamType.Vanguard] = var_23_3

	local var_23_4 = {}

	_.each(arg_23_0[TeamType.Main], function(arg_25_0)
		if arg_23_0.ships[arg_25_0.id] then
			table.insert(var_23_4, arg_23_0.ships[arg_25_0.id])
		end
	end)

	arg_23_0[TeamType.Main] = var_23_4

	local var_23_5 = {}

	_.each(arg_23_0[TeamType.Submarine], function(arg_26_0)
		if arg_23_0.ships[arg_26_0.id] then
			table.insert(var_23_5, arg_23_0.ships[arg_26_0.id])
		end
	end)

	arg_23_0[TeamType.Submarine] = var_23_5
end

function var_0_0.updateShipHp(arg_27_0, arg_27_1, arg_27_2)
	local var_27_0 = arg_27_0.ships[arg_27_1]

	if var_27_0 then
		var_27_0.hpChange = arg_27_2 - var_27_0.hpRant
		var_27_0.hpRant = arg_27_2

		arg_27_0:ResortShips()
	end
end

function var_0_0.getShip(arg_28_0, arg_28_1)
	return arg_28_0.ships[arg_28_1]
end

function var_0_0.getShips(arg_29_0, arg_29_1)
	local var_29_0 = {}
	local var_29_1 = arg_29_0:getFleetType()

	if var_29_1 == FleetType.Normal then
		_.each(arg_29_0:getShipsByTeam(TeamType.Main, arg_29_1), function(arg_30_0)
			table.insert(var_29_0, arg_30_0)
		end)
		_.each(arg_29_0:getShipsByTeam(TeamType.Vanguard, arg_29_1), function(arg_31_0)
			table.insert(var_29_0, arg_31_0)
		end)
	elseif var_29_1 == FleetType.Submarine then
		_.each(arg_29_0:getShipsByTeam(TeamType.Submarine, arg_29_1), function(arg_32_0)
			table.insert(var_29_0, arg_32_0)
		end)
	elseif var_29_1 == FleetType.Support then
		_.each(arg_29_0:getShipsByTeam(TeamType.Main, arg_29_1), function(arg_33_0)
			table.insert(var_29_0, arg_33_0)
		end)
	end

	return var_29_0
end

function var_0_0.getShipsByTeam(arg_34_0, arg_34_1, arg_34_2)
	local var_34_0 = {}

	for iter_34_0, iter_34_1 in ipairs(arg_34_0[arg_34_1]) do
		if iter_34_1.hpRant > 0 then
			var_34_0[#var_34_0 + 1] = iter_34_1
		end
	end

	if arg_34_2 then
		for iter_34_2, iter_34_3 in ipairs(arg_34_0[arg_34_1]) do
			if iter_34_3.hpRant <= 0 then
				var_34_0[#var_34_0 + 1] = iter_34_3
			end
		end
	end

	return var_34_0
end

function var_0_0.containsShip(arg_35_0, arg_35_1)
	return arg_35_0.ships[arg_35_1] and true or false
end

function var_0_0.replaceShip(arg_36_0, arg_36_1, arg_36_2)
	errorMsg("ChapterFleet replaceShip function used")

	if arg_36_0.ships[arg_36_1] and not arg_36_0.ships[arg_36_2.id] then
		local var_36_0 = arg_36_0.ships[arg_36_1]
		local var_36_1 = arg_36_0:fetchShipVO(arg_36_2.id)

		if var_36_1 then
			if var_36_1:getTeamType() == var_36_0:getTeamType() then
				if not var_36_0:isSameKind(var_36_1) and arg_36_0:containsSameKind(var_36_1) then
					arg_36_0:removeShip(arg_36_1)
				else
					var_36_1.hpRant = arg_36_2.hp_rant
					arg_36_0.ships[arg_36_1] = nil
					arg_36_0.ships[var_36_1.id] = var_36_1

					local var_36_2 = arg_36_0[var_36_1:getTeamType()]

					for iter_36_0 = 1, #var_36_2 do
						if var_36_2[iter_36_0].id == arg_36_1 then
							var_36_2[iter_36_0] = var_36_1

							break
						end
					end
				end
			else
				arg_36_0:removeShip(arg_36_1)
			end
		end
	end
end

function var_0_0.addShip(arg_37_0, arg_37_1)
	errorMsg("ChapterFleet addShip function used")

	if not arg_37_0.ships[arg_37_1.id] then
		local var_37_0 = arg_37_0:fetchShipVO(arg_37_1.id)

		if var_37_0 then
			var_37_0.hpRant = arg_37_1.hp_rant

			local var_37_1 = arg_37_0[var_37_0:getTeamType()]

			if #var_37_1 < 3 then
				table.insert(var_37_1, var_37_0)

				arg_37_0.ships[var_37_0.id] = var_37_0

				arg_37_0:ResortShips()
			end
		end
	end
end

function var_0_0.removeShip(arg_38_0, arg_38_1)
	errorMsg("ChapterFleet removeShip function used")

	arg_38_0.ships[arg_38_1] = nil

	local var_38_0 = {
		TeamType.Vanguard,
		TeamType.Main,
		TeamType.Submarine
	}

	for iter_38_0 = 1, #var_38_0 do
		local var_38_1 = arg_38_0[var_38_0[iter_38_0]]

		for iter_38_1 = #var_38_1, 1, -1 do
			if var_38_1[iter_38_1].id == arg_38_1 then
				table.remove(var_38_1, iter_38_1)
			end
		end
	end
end

function var_0_0.switchShip(arg_39_0, arg_39_1, arg_39_2, arg_39_3)
	local var_39_0 = arg_39_0:getShipsByTeam(arg_39_1, false)
	local var_39_1 = var_39_0[arg_39_2].id
	local var_39_2 = var_39_0[arg_39_3].id
	local var_39_3
	local var_39_4
	local var_39_5
	local var_39_6

	for iter_39_0, iter_39_1 in pairs(arg_39_0.ships) do
		if iter_39_0 == var_39_1 then
			var_39_3 = iter_39_1:getTeamType()
			var_39_4 = table.indexof(arg_39_0[var_39_3], iter_39_1)
		end

		if iter_39_0 == var_39_2 then
			var_39_5 = iter_39_1:getTeamType()
			var_39_6 = table.indexof(arg_39_0[var_39_5], iter_39_1)
		end
	end

	assert(var_39_4 and var_39_6)

	if var_39_3 == var_39_5 and var_39_4 ~= var_39_6 then
		arg_39_0[var_39_3][var_39_4], arg_39_0[var_39_5][var_39_6] = arg_39_0[var_39_5][var_39_6], arg_39_0[var_39_3][var_39_4]
	end
end

function var_0_0.synchronousShipIndex(arg_40_0, arg_40_1)
	local var_40_0 = {
		TeamType.Vanguard,
		TeamType.Main,
		TeamType.Submarine
	}

	for iter_40_0, iter_40_1 in ipairs(var_40_0) do
		for iter_40_2 = 1, 3 do
			if arg_40_1[iter_40_1][iter_40_2] then
				local var_40_1 = arg_40_1[iter_40_1][iter_40_2].id

				arg_40_0[iter_40_1][iter_40_2] = arg_40_0.ships[var_40_1]
			else
				arg_40_0[iter_40_1][iter_40_2] = nil
			end
		end
	end
end

function var_0_0.isValid(arg_41_0)
	local var_41_0 = arg_41_0:getFleetType()

	if var_41_0 == FleetType.Normal then
		return _.any(arg_41_0[TeamType.Vanguard], function(arg_42_0)
			return arg_42_0.hpRant > 0
		end) and _.any(arg_41_0[TeamType.Main], function(arg_43_0)
			return arg_43_0.hpRant > 0
		end)
	elseif var_41_0 == FleetType.Submarine then
		return _.any(arg_41_0[TeamType.Submarine], function(arg_44_0)
			return arg_44_0.hpRant > 0
		end)
	elseif var_41_0 == FleetType.Support then
		return true
	end

	return false
end

function var_0_0.getCost(arg_45_0)
	local var_45_0 = {
		gold = 0,
		oil = 0
	}
	local var_45_1 = {
		gold = 0,
		oil = 0
	}
	local var_45_2 = arg_45_0:getShips(false)

	_.each(var_45_2, function(arg_46_0)
		var_45_0.oil = var_45_0.oil + arg_46_0:getStartBattleExpend()
		var_45_1.oil = var_45_1.oil + arg_46_0:getEndBattleExpend()
	end)

	return var_45_0, var_45_1
end

function var_0_0.getInvestSums(arg_47_0, arg_47_1)
	local function var_47_0(arg_48_0, arg_48_1)
		local var_48_0 = arg_48_1:getProperties(arg_47_0:getCommanders())

		return arg_48_0 + var_48_0[AttributeType.Air] + var_48_0[AttributeType.Dodge]
	end

	local var_47_1 = _.reduce(arg_47_0:getShips(arg_47_1), 0, var_47_0)

	return math.pow(var_47_1, 0.6666666666666666)
end

function var_0_0.getDodgeSums(arg_49_0)
	local function var_49_0(arg_50_0, arg_50_1)
		return arg_50_0 + arg_50_1:getProperties(arg_49_0:getCommanders())[AttributeType.Dodge]
	end

	local var_49_1 = _.reduce(arg_49_0:getShips(false), 0, var_49_0)

	return math.pow(var_49_1, 0.6666666666666666)
end

function var_0_0.getAntiAircraftSums(arg_51_0)
	local function var_51_0(arg_52_0, arg_52_1)
		return arg_52_0 + arg_52_1:getProperties(arg_51_0:getCommanders())[AttributeType.AntiAircraft]
	end

	return (_.reduce(arg_51_0:getShips(false), 0, var_51_0))
end

function var_0_0.getShipAmmo(arg_53_0)
	local var_53_0 = 0

	if arg_53_0:getFleetType() == FleetType.Normal then
		for iter_53_0, iter_53_1 in pairs(arg_53_0.ships) do
			var_53_0 = math.max(var_53_0, iter_53_1:getShipAmmo())
		end
	elseif arg_53_0:getFleetType() == FleetType.Submarine then
		for iter_53_2, iter_53_3 in pairs(arg_53_0.ships) do
			var_53_0 = var_53_0 + iter_53_3:getShipAmmo()
		end
	elseif arg_53_0:getFleetType() == FleetType.Support then
		var_53_0 = 0
	end

	return var_53_0
end

function var_0_0.clearShipHpChange(arg_54_0)
	for iter_54_0, iter_54_1 in pairs(arg_54_0.ships) do
		arg_54_0.ships[iter_54_1.id].hpChange = 0
	end
end

function var_0_0.getEquipAmbushRateReduce(arg_55_0)
	local var_55_0 = 0

	for iter_55_0, iter_55_1 in pairs(arg_55_0.ships) do
		for iter_55_2, iter_55_3 in pairs(iter_55_1:getActiveEquipments()) do
			if iter_55_3 then
				var_55_0 = math.max(var_55_0, iter_55_3:getConfig("equip_parameters").ambush_extra or 0)
			end
		end
	end

	return var_55_0 / 10000
end

function var_0_0.getEquipDodgeRateUp(arg_56_0)
	local var_56_0 = 0

	for iter_56_0, iter_56_1 in pairs(arg_56_0.ships) do
		for iter_56_2, iter_56_3 in pairs(iter_56_1:getActiveEquipments()) do
			if iter_56_3 then
				var_56_0 = math.max(var_56_0, iter_56_3:getConfig("equip_parameters").avoid_extra or 0)
			end
		end
	end

	return var_56_0 / 10000
end

function var_0_0.isFormationDiffWith(arg_57_0, arg_57_1)
	local var_57_0 = {
		TeamType.Main,
		TeamType.Vanguard,
		TeamType.Submarine
	}

	for iter_57_0, iter_57_1 in ipairs(var_57_0) do
		local var_57_1 = arg_57_0[iter_57_1]
		local var_57_2 = arg_57_1[iter_57_1]

		for iter_57_2 = 1, math.max(#var_57_1, #var_57_2) do
			if var_57_1[iter_57_2] ~= var_57_2[iter_57_2] and (var_57_1[iter_57_2] == nil or var_57_2[iter_57_2] == nil or var_57_1[iter_57_2].id ~= var_57_2[iter_57_2].id) then
				return true
			end
		end
	end

	return false
end

function var_0_0.getShipIds(arg_58_0)
	local var_58_0 = {}
	local var_58_1 = arg_58_0:getFleetType()

	if var_58_1 == FleetType.Normal then
		_.each(arg_58_0[TeamType.Main], function(arg_59_0)
			table.insert(var_58_0, arg_59_0.id)
		end)
		_.each(arg_58_0[TeamType.Vanguard], function(arg_60_0)
			table.insert(var_58_0, arg_60_0.id)
		end)
	elseif var_58_1 == FleetType.Submarine then
		_.each(arg_58_0[TeamType.Submarine], function(arg_61_0)
			table.insert(var_58_0, arg_61_0.id)
		end)
	elseif var_58_1 == FleetType.Support then
		for iter_58_0, iter_58_1 in pairs(arg_58_0.ships) do
			table.insert(var_58_0, iter_58_1.id)
		end
	end

	return var_58_0
end

function var_0_0.containsSameKind(arg_62_0, arg_62_1)
	return arg_62_1 and _.any(_.values(arg_62_0.ships), function(arg_63_0)
		return arg_62_1:isSameKind(arg_63_0)
	end)
end

function var_0_0.increaseSlowSpeedFactor(arg_64_0)
	arg_64_0.slowSpeedFactor = arg_64_0.slowSpeedFactor + 1
end

function var_0_0.getSpeed(arg_65_0)
	local var_65_0 = arg_65_0:triggerSkill(FleetSkill.TypeMoveSpeed) or 0

	return math.max(arg_65_0.baseSpeed + var_65_0 - arg_65_0.slowSpeedFactor, 1)
end

function var_0_0.calcBaseSpeed(arg_66_0)
	local var_66_0 = arg_66_0:getShips(true)
	local var_66_1 = _.reduce(var_66_0, 0, function(arg_67_0, arg_67_1)
		return arg_67_0 + arg_67_1:getProperties()[AttributeType.Speed]
	end) / #var_66_0 * (1 - 0.02 * (#var_66_0 - 1))
	local var_66_2
	local var_66_3
	local var_66_4 = arg_66_0:getFleetType()

	if var_66_4 == FleetType.Normal then
		var_66_2 = pg.gameset.chapter_move_speed_1.key_value
		var_66_3 = pg.gameset.chapter_move_speed_2.key_value
	elseif var_66_4 == FleetType.Submarine then
		var_66_2 = pg.gameset.submarine_move_speed_1.key_value
		var_66_3 = pg.gameset.submarine_move_speed_2.key_value
	elseif var_66_4 == FleetType.Support then
		var_66_2 = pg.gameset.chapter_move_speed_1.key_value
		var_66_3 = pg.gameset.chapter_move_speed_2.key_value
	end

	if var_66_1 <= var_66_2 then
		return 2
	elseif var_66_3 < var_66_1 then
		return 4
	else
		return 3
	end
end

function var_0_0.getDefeatCount(arg_68_0)
	return arg_68_0.defeatEnemies
end

function var_0_0.getStrategies(arg_69_0)
	local var_69_0 = arg_69_0:getOwnStrategies()

	for iter_69_0, iter_69_1 in pairs(arg_69_0.stgPicked) do
		var_69_0[iter_69_0] = (var_69_0[iter_69_0] or 0) + iter_69_1
	end

	for iter_69_2, iter_69_3 in pairs(arg_69_0.stgUsed) do
		if var_69_0[iter_69_2] then
			var_69_0[iter_69_2] = math.max(0, var_69_0[iter_69_2] - iter_69_3)
		end
	end

	for iter_69_4, iter_69_5 in pairs(ChapterConst.StrategyPresents) do
		var_69_0[iter_69_5] = var_69_0[iter_69_5] or 0
	end

	local var_69_1 = {}

	for iter_69_6, iter_69_7 in pairs(var_69_0) do
		table.insert(var_69_1, {
			id = iter_69_6,
			count = iter_69_7
		})
	end

	return _.sort(var_69_1, function(arg_70_0, arg_70_1)
		return arg_70_0.id < arg_70_1.id
	end)
end

function var_0_0.getOwnStrategies(arg_71_0)
	local var_71_0 = {}
	local var_71_1 = arg_71_0:getShips(true)

	_.each(var_71_1, function(arg_72_0)
		local var_72_0 = arg_72_0:getConfig("strategy_list")

		_.each(var_72_0, function(arg_73_0)
			var_71_0[arg_73_0[1]] = (var_71_0[arg_73_0[1]] or 0) + arg_73_0[2]
		end)
	end)

	local var_71_2 = arg_71_0:triggerSkill(FleetSkill.TypeStrategy)

	if var_71_2 then
		_.each(var_71_2, function(arg_74_0)
			var_71_0[arg_74_0[1]] = (var_71_0[arg_74_0[1]] or 0) + arg_74_0[2]
		end)
	end

	return var_71_0
end

function var_0_0.achievedStrategy(arg_75_0, arg_75_1, arg_75_2)
	arg_75_0.stgPicked[arg_75_1] = (arg_75_0.stgPicked[arg_75_1] or 0) + arg_75_2
end

function var_0_0.consumeOneStrategy(arg_76_0, arg_76_1)
	local var_76_0 = arg_76_0:getOwnStrategies()

	if var_76_0[arg_76_1] and var_76_0[arg_76_1] > 0 then
		local var_76_1 = arg_76_0.stgUsed

		var_76_1[arg_76_1] = (var_76_1[arg_76_1] or 0) + 1
	else
		local var_76_2 = arg_76_0.stgPicked

		if var_76_2[arg_76_1] then
			var_76_2[arg_76_1] = math.max(0, var_76_2[arg_76_1] - 1)
		end
	end
end

function var_0_0.GetStrategyCount(arg_77_0, arg_77_1)
	local var_77_0 = arg_77_0:getStrategies()
	local var_77_1 = _.detect(var_77_0, function(arg_78_0)
		return arg_78_0.id == arg_77_1
	end)

	return var_77_1 and var_77_1.count or 0
end

function var_0_0.getFormationStg(arg_79_0)
	return PlayerPrefs.GetInt("team_formation_" .. arg_79_0.id, 1)
end

function var_0_0.canUseStrategy(arg_80_0, arg_80_1)
	local var_80_0 = pg.strategy_data_template[arg_80_1.id]

	if var_80_0.type == ChapterConst.StgTypeForm then
		if arg_80_0:getFormationStg() == var_80_0.id then
			pg.TipsMgr.GetInstance():ShowTips(i18n("level_scene_formation_active_already"))

			return false
		end
	elseif var_80_0.type == ChapterConst.StgTypeConsume or var_80_0.type == ChapterConst.StgTypeBindSupportConsume then
		if arg_80_1.count <= 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("level_scene_not_enough"))

			return false
		end

		if var_80_0.id == ChapterConst.StrategyRepair and _.all(arg_80_0:getShips(true), function(arg_81_0)
			return arg_81_0.hpRant == 0 or arg_81_0.hpRant == 10000
		end) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("level_scene_full_hp"))

			return false
		end
	end

	return true
end

function var_0_0.getNextStgUser(arg_82_0, arg_82_1)
	return arg_82_0.id
end

function var_0_0.GetStatusStrategy(arg_83_0)
	return arg_83_0.stgIds
end

function var_0_0.getFleetType(arg_84_0)
	local var_84_0 = 0

	for iter_84_0, iter_84_1 in pairs(arg_84_0.ships) do
		local var_84_1 = iter_84_1:getTeamType()

		if var_84_1 == TeamType.Submarine then
			return FleetType.Submarine
		elseif var_84_1 == TeamType.Vanguard then
			var_84_0 = var_84_0 + 1
		end
	end

	if var_84_0 == 0 then
		return FleetType.Support
	else
		return FleetType.Normal
	end
end

function var_0_0.canClearTorpedo(arg_85_0)
	local var_85_0 = arg_85_0:getShipsByTeam(TeamType.Vanguard, true)

	return _.any(var_85_0, function(arg_86_0)
		return ShipType.IsTypeQuZhu(arg_86_0:getShipType())
	end)
end

function var_0_0.getHuntingRange(arg_87_0, arg_87_1)
	if arg_87_0:getFleetType() ~= FleetType.Submarine then
		assert(false)

		return {}
	end

	local var_87_0 = arg_87_1 or arg_87_0.startPos
	local var_87_1 = arg_87_0:getShipsByTeam(TeamType.Submarine, true)[1]
	local var_87_2 = arg_87_0:triggerSkill(FleetSkill.TypeHuntingLv) or 0
	local var_87_3 = var_87_1:getHuntingRange(var_87_1:getHuntingLv() + var_87_2)

	return (_.map(var_87_3, function(arg_88_0)
		return {
			row = var_87_0.row + arg_88_0[1],
			column = var_87_0.column + arg_88_0[2]
		}
	end))
end

function var_0_0.inHuntingRange(arg_89_0, arg_89_1, arg_89_2)
	return _.any(arg_89_0:getHuntingRange(), function(arg_90_0)
		return arg_90_0.row == arg_89_1 and arg_90_0.column == arg_89_2
	end)
end

function var_0_0.getSummonCost(arg_91_0)
	local var_91_0 = arg_91_0:getShips(false)

	return _.reduce(var_91_0, 0, function(arg_92_0, arg_92_1)
		return arg_92_0 + arg_92_1:getEndBattleExpend()
	end)
end

function var_0_0.getMapAura(arg_93_0)
	local var_93_0 = {}

	for iter_93_0, iter_93_1 in pairs(arg_93_0.ships) do
		local var_93_1 = iter_93_1:getMapAuras()

		for iter_93_2, iter_93_3 in ipairs(var_93_1) do
			table.insert(var_93_0, iter_93_3)
		end
	end

	return var_93_0
end

function var_0_0.getMapAid(arg_94_0)
	local var_94_0 = {}

	for iter_94_0, iter_94_1 in pairs(arg_94_0.ships) do
		local var_94_1 = iter_94_1:getMapAids()

		for iter_94_2, iter_94_3 in ipairs(var_94_1) do
			local var_94_2 = var_94_0[iter_94_1] or {}

			table.insert(var_94_2, iter_94_3)

			var_94_0[iter_94_1] = var_94_2
		end
	end

	return var_94_0
end

function var_0_0.updateCommanderSkills(arg_95_0)
	local var_95_0 = arg_95_0:getCommanders()

	for iter_95_0, iter_95_1 in pairs(var_95_0) do
		_.each(iter_95_1:getSkills(), function(arg_96_0)
			_.each(arg_96_0:getTacticSkill(), function(arg_97_0)
				table.insert(arg_95_0.skills, FleetSkill.New(FleetSkill.SystemCommanderNeko, arg_97_0))
			end)
		end)
	end
end

function var_0_0.getSkills(arg_98_0)
	return arg_98_0.skills
end

function var_0_0.getSkill(arg_99_0, arg_99_1)
	return _.detect(arg_99_0:getSkills(), function(arg_100_0)
		return arg_100_0.id == arg_99_1
	end)
end

function var_0_0.findSkills(arg_101_0, arg_101_1)
	return _.filter(arg_101_0:getSkills(), function(arg_102_0)
		return arg_102_0:GetType() == arg_101_1
	end)
end

function var_0_0.triggerSkill(arg_103_0, arg_103_1)
	return arg_103_0.chapter:triggerSkill(arg_103_0, arg_103_1)
end

function var_0_0.findCommanderBySkillId(arg_104_0, arg_104_1)
	local var_104_0 = arg_104_0:getCommanders()

	for iter_104_0, iter_104_1 in pairs(var_104_0) do
		if _.any(iter_104_1:getSkills(), function(arg_105_0)
			return _.any(arg_105_0:getTacticSkill(), function(arg_106_0)
				return arg_106_0 == arg_104_1
			end)
		end) then
			return iter_104_1
		end
	end
end

function var_0_0.getFleetAirDominanceValue(arg_107_0)
	local var_107_0 = 0

	for iter_107_0, iter_107_1 in ipairs(arg_107_0:getShips(false)) do
		var_107_0 = var_107_0 + calcAirDominanceValue(iter_107_1, arg_107_0:getCommanders())
	end

	return var_107_0
end

function var_0_0.StaticTransformChapterFleet2Fleet(arg_108_0, arg_108_1)
	local var_108_0 = _.pluck(arg_108_0:getShipsByTeam(TeamType.Vanguard, arg_108_1), "id")

	table.insertto(var_108_0, _.pluck(arg_108_0:getShipsByTeam(TeamType.Main, arg_108_1), "id"))

	local var_108_1 = {}

	for iter_108_0, iter_108_1 in pairs(arg_108_0.commanders) do
		table.insert(var_108_1, {
			pos = iter_108_0,
			id = iter_108_1 and iter_108_1.id
		})
	end

	return TypedFleet.New({
		fleetType = FleetType.Normal,
		ship_list = var_108_0,
		commanders = var_108_1
	})
end

return var_0_0
