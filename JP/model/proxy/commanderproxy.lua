local var_0_0 = class("CommanderProxy", import(".NetProxy"))

var_0_0.COMMANDER_UPDATED = "CommanderProxy:COMMANDER_UPDATED"
var_0_0.COMMANDER_ADDED = "CommanderProxy:COMMANDER_ADDED"
var_0_0.COMMANDER_DELETED = "CommanderProxy:COMMANDER_DELETED"
var_0_0.RESERVE_CNT_UPDATED = "CommanderProxy:RESERVE_CNT_UPDATED"
var_0_0.COMMANDER_BOX_FINISHED = "CommanderProxy:COMMANDER_BOX_FINISHED"
var_0_0.PREFAB_FLEET_UPDATE = "CommanderProxy:PREFAB_FLEET_UPDATE"
var_0_0.MAX_WORK_COUNT = 4
var_0_0.MAX_SLOT = 10
var_0_0.MAX_PREFAB_FLEET = 3

function var_0_0.register(arg_1_0)
	arg_1_0.data = {}
	arg_1_0.boxes = {}
	arg_1_0.prefabFleet = {}
	arg_1_0.openCommanderScene = false

	for iter_1_0 = 1, var_0_0.MAX_PREFAB_FLEET do
		arg_1_0.prefabFleet[iter_1_0] = CommnaderFleet.New({
			id = iter_1_0
		})
	end

	local var_1_0 = pg.gameset.commander_box_count.key_value

	for iter_1_1 = 1, var_1_0 do
		local var_1_1 = CommanderBox.New({
			id = iter_1_1
		})

		arg_1_0:addBox(var_1_1)
	end

	arg_1_0.pools = {}

	for iter_1_2, iter_1_3 in ipairs(pg.commander_data_create_material.all) do
		local var_1_2 = CommanderBuildPool.New({
			id = iter_1_3
		})

		table.insert(arg_1_0.pools, var_1_2)
	end

	arg_1_0.boxUsageCount = 0

	arg_1_0:on(25001, function(arg_2_0)
		for iter_2_0, iter_2_1 in ipairs(arg_2_0.commanders) do
			local var_2_0 = Commander.New(iter_2_1)

			arg_1_0:addCommander(var_2_0)
		end

		for iter_2_2, iter_2_3 in ipairs(arg_2_0.box) do
			local var_2_1 = CommanderBox.New(iter_2_3, iter_2_2)

			arg_1_0:updateBox(var_2_1)
		end

		for iter_2_4, iter_2_5 in ipairs(arg_2_0.presets) do
			local var_2_2 = iter_2_5.id
			local var_2_3 = iter_2_5.commandersid
			local var_2_4 = {}

			for iter_2_6, iter_2_7 in ipairs(var_2_3) do
				local var_2_5 = arg_1_0:getCommanderById(iter_2_7.id)

				if var_2_5 then
					var_2_4[iter_2_7.pos] = var_2_5
				end
			end

			arg_1_0.prefabFleet[var_2_2]:Update({
				id = var_2_2,
				name = arg_2_0.name,
				commanders = var_2_4
			})
		end

		arg_1_0.boxUsageCount = arg_2_0.usage_count or 0

		if not LOCK_CATTERY then
			arg_1_0:sendNotification(GAME.GET_COMMANDER_HOME)
		end
	end)

	arg_1_0.newCommanderList = {}

	arg_1_0:on(25039, function(arg_3_0)
		for iter_3_0, iter_3_1 in ipairs(arg_3_0.commander_list) do
			local var_3_0 = Commander.New(iter_3_1)

			arg_1_0:addCommander(var_3_0)
			table.insert(arg_1_0.newCommanderList, var_3_0)
		end
	end)
end

function var_0_0.timeCall(arg_4_0)
	return {
		[ProxyRegister.DayCall] = function(arg_5_0)
			arg_4_0:resetBoxUseCnt()

			local var_5_0 = arg_4_0:GetCommanderHome()

			if var_5_0 then
				var_5_0:ResetCatteryOP()
				var_5_0:ReduceClean()
			end
		end
	}
end

function var_0_0.GetNewestCommander(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = defaultValue(arg_6_2, true)

	if arg_6_1 >= #arg_6_0.newCommanderList then
		return arg_6_0.newCommanderList
	else
		local var_6_1 = {}

		for iter_6_0 = #arg_6_0.newCommanderList - arg_6_1 + 1, #arg_6_0.newCommanderList do
			table.insert(var_6_1, arg_6_0.newCommanderList[iter_6_0])
		end

		return var_6_1
	end

	if var_6_0 then
		arg_6_0.newCommanderList = {}
	end
end

function var_0_0.getPrefabFleetById(arg_7_0, arg_7_1)
	return arg_7_0.prefabFleet[arg_7_1]
end

function var_0_0.getPrefabFleet(arg_8_0)
	return Clone(arg_8_0.prefabFleet)
end

function var_0_0.updatePrefabFleet(arg_9_0, arg_9_1)
	arg_9_0.prefabFleet[arg_9_1.id] = arg_9_1

	arg_9_0:sendNotification(var_0_0.PREFAB_FLEET_UPDATE)
end

function var_0_0.updatePrefabFleetName(arg_10_0, arg_10_1, arg_10_2)
	arg_10_0.prefabFleet[arg_10_1]:updateName(arg_10_2)
	arg_10_0:sendNotification(var_0_0.PREFAB_FLEET_UPDATE)
end

function var_0_0.getCommanderCnt(arg_11_0)
	return table.getCount(arg_11_0.data)
end

function var_0_0.getPoolById(arg_12_0, arg_12_1)
	return _.detect(arg_12_0:getPools(), function(arg_13_0)
		return arg_13_0.id == arg_12_1
	end)
end

function var_0_0.getPools(arg_14_0)
	return arg_14_0.pools
end

function var_0_0.getBoxUseCnt(arg_15_0)
	return arg_15_0.boxUsageCount
end

function var_0_0.updateBoxUseCnt(arg_16_0, arg_16_1)
	arg_16_0.boxUsageCount = arg_16_0.boxUsageCount + arg_16_1

	arg_16_0:sendNotification(var_0_0.RESERVE_CNT_UPDATED, arg_16_0.boxUsageCount)
end

function var_0_0.resetBoxUseCnt(arg_17_0)
	arg_17_0.boxUsageCount = 0

	arg_17_0:sendNotification(var_0_0.RESERVE_CNT_UPDATED, 0)
end

function var_0_0.updateBox(arg_18_0, arg_18_1)
	arg_18_0.boxes[arg_18_1.id] = arg_18_1
end

function var_0_0.addBox(arg_19_0, arg_19_1)
	arg_19_0.boxes[arg_19_1.id] = arg_19_1
end

function var_0_0.getBoxes(arg_20_0)
	local var_20_0 = {}

	for iter_20_0, iter_20_1 in ipairs(arg_20_0.boxes) do
		table.insert(var_20_0, iter_20_1)
	end

	return var_20_0
end

function var_0_0.getBoxById(arg_21_0, arg_21_1)
	assert(arg_21_0.boxes[arg_21_1], "attemp to get a nil box" .. arg_21_1)

	return arg_21_0.boxes[arg_21_1]
end

function var_0_0.getCommanderById(arg_22_0, arg_22_1)
	local var_22_0 = arg_22_0.data[arg_22_1]

	if var_22_0 then
		return var_22_0:clone()
	end
end

function var_0_0.RawGetCommanderById(arg_23_0, arg_23_1)
	local var_23_0 = arg_23_0.data[arg_23_1]

	if var_23_0 then
		return var_23_0
	end
end

function var_0_0.GetSameConfigIdCommanderCount(arg_24_0, arg_24_1)
	local var_24_0 = 0

	for iter_24_0, iter_24_1 in pairs(arg_24_0.data) do
		if iter_24_1.configId == arg_24_1 then
			var_24_0 = var_24_0 + 1
		end
	end

	return var_24_0
end

function var_0_0.addCommander(arg_25_0, arg_25_1)
	arg_25_0.data[arg_25_1.id] = arg_25_1

	if getProxy(PlayerProxy):getInited() then
		arg_25_0:sendNotification(var_0_0.COMMANDER_ADDED, arg_25_1:clone())
	end
end

function var_0_0.updateCommander(arg_26_0, arg_26_1)
	assert(arg_26_0.data[arg_26_1.id], "commander can not be nil")
	assert(isa(arg_26_1, Commander), "commander should be and instance of Commander")

	arg_26_0.data[arg_26_1.id] = arg_26_1

	arg_26_0:sendNotification(var_0_0.COMMANDER_UPDATED, arg_26_1:clone())
end

function var_0_0.removeCommanderById(arg_27_0, arg_27_1)
	arg_27_0:checkPrefabFleet(arg_27_1)
	assert(arg_27_0.data[arg_27_1], "commander can not be nil")

	arg_27_0.data[arg_27_1] = nil

	arg_27_0:sendNotification(var_0_0.COMMANDER_DELETED, arg_27_1)
end

function var_0_0.checkPrefabFleet(arg_28_0, arg_28_1)
	for iter_28_0, iter_28_1 in pairs(arg_28_0.prefabFleet) do
		if iter_28_1:contains(arg_28_1) then
			iter_28_1:removeCommander(arg_28_1)
		end
	end
end

function var_0_0.haveFinishedBox(arg_29_0)
	for iter_29_0, iter_29_1 in pairs(arg_29_0.boxes) do
		if iter_29_1:getState() == CommanderBox.STATE_FINISHED then
			return true
		end
	end

	return false
end

function var_0_0.IsFinishAllBox(arg_30_0)
	local var_30_0 = 0
	local var_30_1 = 0
	local var_30_2 = 0

	for iter_30_0, iter_30_1 in pairs(arg_30_0.boxes) do
		local var_30_3 = iter_30_1:getState()

		if var_30_3 == CommanderBox.STATE_FINISHED then
			var_30_0 = var_30_0 + 1
		elseif var_30_3 == CommanderBox.STATE_EMPTY then
			var_30_1 = var_30_1 + 1
		end

		var_30_2 = var_30_2 + 1
	end

	return var_30_0 > 0 and var_30_0 + var_30_1 == var_30_2
end

function var_0_0.onRemove(arg_31_0)
	arg_31_0:RemoveCalcExpTimer()
	var_0_0.super.onRemove(arg_31_0)

	arg_31_0.openCommanderScene = false
end

function var_0_0.AddCommanderHome(arg_32_0, arg_32_1)
	arg_32_0.commanderHome = arg_32_1

	local var_32_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_32_1 = GetNextHour(1) - var_32_0

	arg_32_0:StartCalcExpTimer(var_32_1)
end

function var_0_0.GetCommanderHome(arg_33_0)
	return arg_33_0.commanderHome
end

function var_0_0.StartCalcExpTimer(arg_34_0, arg_34_1)
	arg_34_0:RemoveCalcExpTimer()

	arg_34_0.calcExpTimer = Timer.New(function()
		arg_34_0:RemoveCalcExpTimer()
		arg_34_0:sendNotification(GAME.CALC_CATTERY_EXP, {
			isPeriod = arg_34_1 == 3600
		})
		arg_34_0:StartCalcExpTimer(3600)
	end, arg_34_1, 1)

	arg_34_0.calcExpTimer:Start()
end

function var_0_0.RemoveCalcExpTimer(arg_36_0)
	if arg_36_0.calcExpTimer then
		arg_36_0.calcExpTimer:Stop()

		arg_36_0.calcExpTimer = nil
	end
end

function var_0_0.AnyCatteryExistOP(arg_37_0)
	local var_37_0 = arg_37_0:GetCommanderHome()

	if var_37_0 then
		return var_37_0:AnyCatteryExistOP()
	end

	return false
end

function var_0_0.AnyCatteryCanUse(arg_38_0)
	local var_38_0 = arg_38_0:GetCommanderHome()

	if var_38_0 then
		return var_38_0:AnyCatteryCanUse()
	end

	return false
end

function var_0_0.IsHome(arg_39_0, arg_39_1)
	local var_39_0 = arg_39_0:GetCommanderHome()

	if var_39_0 then
		return var_39_0:CommanderInHome(arg_39_1)
	end

	return false
end

function var_0_0.UpdateOpenCommanderScene(arg_40_0, arg_40_1)
	arg_40_0.openCommanderScene = arg_40_1
end

function var_0_0.InCommanderScene(arg_41_0)
	return arg_41_0.openCommanderScene
end

function var_0_0.AnyPoolIsWaiting(arg_42_0)
	local var_42_0 = 0

	for iter_42_0, iter_42_1 in pairs(arg_42_0.boxes) do
		local var_42_1 = iter_42_1:getState()

		if var_42_1 == CommanderBox.STATE_WAITING or var_42_1 == CommanderBox.STATE_STARTING then
			return false
		end

		if var_42_1 == CommanderBox.STATE_FINISHED then
			var_42_0 = var_42_0 + 1
		end
	end

	return var_42_0 > 0
end

function var_0_0.ShouldTipBox(arg_43_0)
	local function var_43_0()
		local var_44_0 = 0

		for iter_44_0, iter_44_1 in pairs(arg_43_0.pools) do
			var_44_0 = var_44_0 + iter_44_1:getItemCount()
		end

		return var_44_0 > 0
	end

	local function var_43_1()
		for iter_45_0, iter_45_1 in pairs(arg_43_0.boxes) do
			if iter_45_1:getState() == CommanderBox.STATE_EMPTY then
				return true
			end
		end

		return false
	end

	if var_43_0() then
		if var_43_1() then
			return true
		else
			return arg_43_0:IsFinishAllBox()
		end
	else
		return arg_43_0:IsFinishAllBox()
	end
end

function var_0_0.CalcQuickItemUsageCnt(arg_46_0)
	local var_46_0 = Item.COMMANDER_QUICKLY_TOOL_ID
	local var_46_1 = Item.getConfigData(var_46_0).usage_arg[1]

	local function var_46_2(arg_47_0, arg_47_1)
		local var_47_0 = arg_47_1 - arg_47_0

		return math.ceil(var_47_0 / var_46_1)
	end

	local var_46_3 = getProxy(BagProxy):getItemCountById(var_46_0)
	local var_46_4 = 0
	local var_46_5 = 0
	local var_46_6 = 0
	local var_46_7 = {}
	local var_46_8 = {}

	for iter_46_0, iter_46_1 in pairs(arg_46_0.boxes) do
		table.insert(var_46_8, iter_46_1)
	end

	table.sort(var_46_8, function(arg_48_0, arg_48_1)
		local var_48_0 = arg_48_0.state
		local var_48_1 = arg_48_1.state

		if var_48_0 == var_48_1 then
			return arg_48_0.index < arg_48_1.index
		else
			return var_48_1 < var_48_0
		end
	end)

	for iter_46_2, iter_46_3 in ipairs(var_46_8) do
		local var_46_9 = var_46_6
		local var_46_10 = iter_46_3:getState()

		if var_46_10 == CommanderBox.STATE_WAITING then
			var_46_4 = var_46_4 + 1
			var_46_6 = var_46_6 + 1

			table.insert(var_46_7, iter_46_3)

			var_46_5 = var_46_5 + var_46_2(iter_46_3.beginTime, iter_46_3.finishTime)
		elseif var_46_10 == CommanderBox.STATE_STARTING then
			var_46_4 = var_46_4 + 1
			var_46_6 = var_46_6 + 1

			table.insert(var_46_7, iter_46_3)

			local var_46_11 = pg.TimeMgr.GetInstance():GetServerTime()

			var_46_5 = var_46_5 + var_46_2(var_46_11, iter_46_3.finishTime)
		end

		if var_46_5 == var_46_3 then
			break
		elseif var_46_3 < var_46_5 then
			var_46_5 = var_46_3
			var_46_6 = var_46_6 - 1

			table.remove(var_46_7, #var_46_7)

			break
		end
	end

	local var_46_12 = {
		0,
		0,
		0
	}

	for iter_46_4, iter_46_5 in ipairs(var_46_7) do
		local var_46_13 = iter_46_5.pool:getRarity()

		var_46_12[var_46_13] = var_46_12[var_46_13] + 1
	end

	return var_46_5, var_46_4, var_46_6, var_46_12
end

return var_0_0
