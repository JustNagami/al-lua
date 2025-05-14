local var_0_0 = class("IslandSyncMgr")

local function var_0_1(...)
	if false then
		warning(...)
	end
end

var_0_0.INTERACRION_ITEMS = {
	IslandConst.SYNC_TYPE_INTERACTION_TEST
}
var_0_0.ISLAND_SYNC_DATA_UPDATE = "IslandSyncMgr.ISLAND_SYNC_DATA_UPDATE"
var_0_0.ISLAND_SYNC_OBJ_UPDATE = "IslandSyncMgr.ISLAND_SYNC_OBJ_UPDATE"

function var_0_0.Ctor(arg_2_0, arg_2_1)
	arg_2_0.syncUnitDic = {}
	arg_2_0.controlResultDic = {}
	arg_2_0.tid2SyncIdDic = {}
	arg_2_0.controller = arg_2_1
	arg_2_0.island = arg_2_1.island
	arg_2_0.lazyCount = 0
	arg_2_0.playerId = getProxy(PlayerProxy):getPlayerId()
	arg_2_0.syncDataDelayedProcessor = DelayedDataProcessor.New(IslandConst.SYNC_TIME_DELAY, IslandConst.SYNC_TIME_INTERVAL * 1000, function(arg_3_0)
		arg_2_0:UpdateSyncData(arg_3_0)
	end)
	arg_2_0.syncObjDelayedProcessor = DelayedDataProcessor.New(IslandConst.SYNC_TIME_DELAY, IslandConst.SYNC_TIME_INTERVAL * 1000, function(arg_4_0)
		arg_2_0:UpdateSyncObj(arg_4_0)
	end)
	arg_2_0.syncUnitBuilder = SyncUnitBuilder.New(arg_2_0.controller)
end

function var_0_0.Init(arg_5_0)
	local var_5_0 = getProxy(IslandProxy):GetSyncObjInitData()

	for iter_5_0, iter_5_1 in ipairs(var_5_0) do
		if iter_5_1.type ~= IslandConst.SYNC_TYPE_UNIT_MOVE or table.contains(var_0_0.INTERACRION_ITEMS, iter_5_1.tid) then
			arg_5_0:AddSyncUnit(iter_5_1)
		end
	end

	arg_5_0.collectClientStateTimer = Timer.New(function()
		arg_5_0:UpdateMovableClientUnit()
	end, IslandConst.SYNC_TIME_INTERVAL, -1)

	arg_5_0.collectClientStateTimer:Start()

	arg_5_0.heartBeatTimer = Timer.New(function()
		pg.m02:sendNotification(GAME.ISLAND_HEART_BEAT, arg_5_0.island.id)
	end, IslandConst.HEART_BEAT_INTERVAL, -1)

	arg_5_0.heartBeatTimer:Start()
end

function var_0_0.AddSyncUnit(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_0.syncUnitBuilder:Build(arg_8_1)

	arg_8_0.syncUnitDic[arg_8_1.id] = var_8_0

	if arg_8_0.tid2SyncIdDic[arg_8_1.type] == nil then
		arg_8_0.tid2SyncIdDic[arg_8_1.type] = {}
	end

	arg_8_0.tid2SyncIdDic[arg_8_1.type][arg_8_1.tid] = arg_8_1.id
end

function var_0_0.RemoveSyncUnit(arg_9_0, arg_9_1)
	local var_9_0 = arg_9_0.syncUnitDic[arg_9_1.id]

	arg_9_0.tid2SyncIdDic[arg_9_1.type][arg_9_1.tid] = nil

	var_9_0:Dispose()

	arg_9_0.syncUnitDic[arg_9_1.id] = nil
end

function var_0_0.GetUnitByTid(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = arg_10_0.tid2SyncIdDic[arg_10_2][arg_10_1]
	local var_10_1 = arg_10_0.syncUnitDic[var_10_0]

	assert(var_10_1, "unit不存在 id=" .. var_10_0)

	return var_10_1, var_10_0
end

function var_0_0.HandleSyncObj(arg_11_0, arg_11_1)
	for iter_11_0, iter_11_1 in ipairs(arg_11_1) do
		local var_11_0 = iter_11_1.id

		arg_11_0.syncObjDelayedProcessor:Add(var_11_0, iter_11_1)
	end
end

function var_0_0.UpdateSyncObj(arg_12_0, arg_12_1)
	if arg_12_1.state == 0 then
		local var_12_0 = arg_12_0.syncUnitDic[arg_12_1.id]

		if arg_12_1.type == IslandConst.SYNC_TYPE_AGORA then
			local var_12_1, var_12_2 = var_12_0:UpdateOwner(arg_12_1.slots)

			if var_12_1 then
				arg_12_0.controller:InterAction(var_12_0.tid, var_12_2, true)
			else
				arg_12_0.controller:InterActionEnd(var_12_0.tid, var_12_2, true)
			end
		elseif arg_12_1.type == IslandConst.SYNC_TYPE_UNIT_STATIC then
			-- block empty
		else
			var_12_0:UpdateOwner(arg_12_1.slots)
		end
	elseif arg_12_1.state == 1 then
		arg_12_0:AddSyncUnit(arg_12_1)
	elseif arg_12_1.state == 2 then
		arg_12_0:RemoveSyncUnit(arg_12_1)
	end
end

function var_0_0.HandleSyncData(arg_13_0, arg_13_1)
	_.each(arg_13_1, function(arg_14_0)
		local var_14_0 = arg_14_0.id

		arg_13_0.syncDataDelayedProcessor:Add(var_14_0, arg_14_0)
	end)
end

function var_0_0.UpdateSyncData(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_1.id
	local var_15_1 = arg_15_0.syncUnitDic[var_15_0]

	if not var_15_1 then
		Debugger.LogWarning(string.format("unit 不存在 id=%d", var_15_0))

		return
	end

	var_15_1:UpdateSyncData(arg_15_1)
end

function var_0_0.Update(arg_16_0)
	arg_16_0.syncObjDelayedProcessor:Update()
	arg_16_0.syncDataDelayedProcessor:Update()
	arg_16_0:UpdateMovableServerUnit()
end

function var_0_0.UpdateMovableClientUnit(arg_17_0)
	local var_17_0 = {}

	for iter_17_0, iter_17_1 in pairs(arg_17_0.syncUnitDic) do
		if isa(iter_17_1, SyncUnitMovable) and iter_17_1:IsLoaded() and iter_17_1:IsClient() and (iter_17_1:GetType() ~= IslandConst.SYNC_TYPE_PLAYER or not iter_17_1:InTimeline()) then
			local var_17_1 = iter_17_1:CreateSyncData()

			table.insert(var_17_0, var_17_1)
		end
	end

	if #var_17_0 > 0 then
		pg.m02:sendNotification(GAME.ISLAND_SYNC_DATA, {
			data = var_17_0,
			islandId = arg_17_0.island.id
		})
	end
end

function var_0_0.UpdateMovableServerUnit(arg_18_0)
	for iter_18_0, iter_18_1 in pairs(arg_18_0.syncUnitDic) do
		if isa(iter_18_1, SyncUnitMovable) and iter_18_1:IsLoaded() and iter_18_1:IsServer() then
			iter_18_1:Update()
		end
	end
end

function var_0_0.TryControlUnitAgora(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
	local var_19_0, var_19_1 = arg_19_0:GetUnitByTid(arg_19_1, IslandConst.SYNC_TYPE_AGORA)

	arg_19_0:ControlUnit(var_19_1, 4294967295, function(arg_20_0)
		if arg_20_0 == 0 then
			arg_19_0:GetUnitByTid(arg_19_0.playerId, IslandConst.SYNC_TYPE_PLAYER):SetInTimeline(true)
		end

		arg_19_3(arg_20_0)
	end)
end

function var_0_0.EndControlUnitAgora(arg_21_0, arg_21_1, arg_21_2, arg_21_3)
	local var_21_0, var_21_1 = arg_21_0:GetUnitByTid(arg_21_1, IslandConst.SYNC_TYPE_AGORA)

	arg_21_0:ControlUnit(var_21_1, 0, function(arg_22_0)
		if arg_22_0 == 0 then
			arg_21_0:GetUnitByTid(arg_21_0.playerId, IslandConst.SYNC_TYPE_PLAYER):SetInTimeline(false)
		end

		arg_21_3(arg_22_0)
	end)
end

function var_0_0.TryControlUnitInteraction(arg_23_0, arg_23_1, arg_23_2, arg_23_3)
	local var_23_0 = arg_23_0.syncUnitDic[arg_23_1]

	assert(var_23_0:GetType() == IslandConst.SYNC_TYPE_UNIT_MOVE, "interact with wrong unit" .. arg_23_1)
	var_23_0:SetOwnerType(SyncUnitMovable.OWNER_TYPE_CLIENT)
	arg_23_0:ControlUnit(arg_23_1, arg_23_2, arg_23_3)
end

function var_0_0.ControlUnit(arg_24_0, arg_24_1, arg_24_2, arg_24_3)
	if arg_24_0.controlResultDic[arg_24_1] then
		arg_24_3(false)

		return
	end

	arg_24_0.controlResultDic[arg_24_1] = arg_24_3

	pg.m02:sendNotification(GAME.ISLAND_SYNC_CONTROL, {
		islandId = arg_24_0.island.id,
		objId = arg_24_1,
		mseconds = arg_24_2,
		onResult = function(arg_25_0)
			local var_25_0 = arg_25_0 == 0

			existCall(arg_24_0.controlResultDic[arg_24_1], var_25_0)

			arg_24_0.controlResultDic[arg_24_1] = nil
		end
	})
end

function var_0_0.Dispose(arg_26_0)
	arg_26_0.collectClientStateTimer:Stop()
	arg_26_0.heartBeatTimer:Stop()
end

function var_0_0.TestData(arg_27_0)
	local var_27_0 = getProxy(IslandProxy):GetIsland()

	local function var_27_1(arg_28_0)
		local var_28_0 = tonumber(string.match(arg_28_0, "id=(%d+)"))
		local var_28_1 = string.match(arg_28_0, "pos=%[([%d%.,-]+)%]")
		local var_28_2 = string.match(arg_28_0, "dir=%[([%d%.,-]+)%]")
		local var_28_3 = tonumber(string.match(arg_28_0, "status=(%d+)"))

		local function var_28_4(arg_29_0)
			local var_29_0, var_29_1, var_29_2 = arg_29_0:match("([%d%.%-]+),([%d%.%-]+),([%d%.%-]+)")

			return Vector3(tonumber(var_29_0), tonumber(var_29_1), tonumber(var_29_2))
		end

		local function var_28_5(arg_30_0)
			local var_30_0, var_30_1, var_30_2, var_30_3 = arg_30_0:match("([%d%.%-]+),([%d%.%-]+),([%d%.%-]+),([%d%.%-]+)")

			return Quaternion(tonumber(var_30_0), tonumber(var_30_1), tonumber(var_30_2), tonumber(var_30_3))
		end

		local var_28_6 = var_28_4(var_28_1)
		local var_28_7 = var_28_5(var_28_2)

		return SyncUnitData.New({
			id = var_28_0,
			pos = var_28_6,
			dir = var_28_7,
			status = var_28_3
		})
	end

	local var_27_2 = {}

	for iter_27_0 in io.lines("D:\\Project\\SyncTest.txt") do
		table.insert(var_27_2, iter_27_0)
	end

	local var_27_3 = 1

	Timer.New(function()
		if var_27_3 > #var_27_2 then
			return
		end

		local var_31_0 = var_27_2[var_27_3]

		var_27_3 = var_27_3 + 1

		local var_31_1 = var_27_1(var_31_0)

		var_31_1.id = 100
		var_31_1.type = 1

		local var_31_2 = {}

		table.insert(var_31_2, var_31_1)

		local var_31_3 = math.random(IslandConst.SYNC_TEST_DELAY_L, IslandConst.SYNC_TEST_DELAY_R)

		LeanTween.delayedCall(var_31_3 / 1000, System.Action(function()
			var_27_0:DispatchEvent(IslandSyncMgr.ISLAND_SYNC_DATA_UPDATE, var_31_2)
		end))
	end, IslandConst.SYNC_TIME_INTERVAL, -1):Start()
end

return var_0_0
