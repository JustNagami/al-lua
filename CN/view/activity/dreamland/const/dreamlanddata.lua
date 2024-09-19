local var_0_0 = class("DreamlandData")

var_0_0.OP_GET_MAP_AWARD = 1
var_0_0.OP_GET_EXPLORE_AWARD = 2
var_0_0.OP_RECORD_EXPLORE = 3
var_0_0.EXPLORE_TYPE_ONCE = 1
var_0_0.EXPLORE_TYPE_HOLD = 2
var_0_0.EXPLORE_SUBTYPE_4RAN_NORMAL = 1
var_0_0.EXPLORE_SUBTYPE_3SEC = 2
var_0_0.EXPLORE_SUBTYPE_3RAN_ACTION = 3
var_0_0.EXPLORE_SUBTYPE_2RAN_ACTION = 4
var_0_0.EXPLORE_SUBTYPE_EFFECT = 5
var_0_0.EXPLORE_SUBTYPE_UNION = 6

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	local var_1_0 = pg.activity_dreamland_event.all

	arg_1_0.stories = _.map(var_1_0, function(arg_2_0)
		return pg.activity_dreamland_event[arg_2_0]
	end)
	arg_1_0.mapIds = pg.activity_dreamland_map.all
	arg_1_0.exploreGroups = pg.activity_dreamland_explore.get_id_list_by_group
	arg_1_0.exploreIds = pg.activity_dreamland_explore.all
	arg_1_0.exploreRecords = {}
	arg_1_0.mapAwards = {}
	arg_1_0.exploreAwards = {}
	arg_1_0.activityId = nil
	arg_1_0.springShipIds = {}
	arg_1_0.springSlotLockList = {}
	arg_1_0.springMaxCnt = 0
	arg_1_0.springAddition = 0

	arg_1_0:UpdateActivityData(arg_1_1)
	arg_1_0:UpdateSpringActivityData(arg_1_2)
end

function var_0_0.UpdateSpringActivityData(arg_3_0, arg_3_1)
	arg_3_0.springShipIds = _.map(arg_3_1:GetShipIds(), function(arg_4_0)
		if getProxy(BayProxy):RawGetShipById(arg_4_0) then
			return arg_4_0
		else
			return 0
		end
	end)
	arg_3_0.springMaxCnt = arg_3_1:GetSlotCount()
	arg_3_0.springAddition = arg_3_1:GetEnergyRecoverAddition()

	arg_3_0:UpdateSpringSlotLockList()
end

function var_0_0.UpdateSpringSlotLockList(arg_5_0)
	local var_5_0 = arg_5_0:FindUnlockMaps()
	local var_5_1 = 0

	for iter_5_0, iter_5_1 in ipairs(var_5_0) do
		var_5_1 = var_5_1 + iter_5_1.character_num
	end

	for iter_5_2 = 1, arg_5_0.springMaxCnt do
		local var_5_2 = var_5_1 < iter_5_2

		arg_5_0.springSlotLockList[iter_5_2] = var_5_2
	end
end

function var_0_0.GetUnlockSpringCnt(arg_6_0)
	local var_6_0 = 0

	for iter_6_0, iter_6_1 in pairs(arg_6_0.springSlotLockList) do
		if not iter_6_1 then
			var_6_0 = var_6_0 + 1
		end
	end

	return var_6_0
end

function var_0_0.GetHotSpringAddition(arg_7_0)
	return arg_7_0.springAddition * 10
end

function var_0_0.GetHotSpringData(arg_8_0)
	return arg_8_0.springShipIds
end

function var_0_0.GetHotSpringMaxCnt(arg_9_0)
	return arg_9_0.springMaxCnt
end

function var_0_0.IsLockSpringSlot(arg_10_0, arg_10_1)
	return arg_10_0.springSlotLockList[arg_10_1]
end

function var_0_0.GetAllSpringShip(arg_11_0)
	local var_11_0 = {}
	local var_11_1 = getProxy(BayProxy)
	local var_11_2 = arg_11_0:GetHotSpringData()

	for iter_11_0, iter_11_1 in ipairs(var_11_2) do
		if iter_11_1 > 0 then
			local var_11_3 = var_11_1:RawGetShipById(iter_11_1)

			if var_11_3 then
				local var_11_4 = arg_11_0:GetMapIdBySpringSlot(iter_11_0)

				if not var_11_0[var_11_4] then
					var_11_0[var_11_4] = {}
				end

				table.insert(var_11_0[var_11_4], var_11_3)
			end
		end
	end

	return var_11_0
end

function var_0_0.GetMapIdBySpringSlot(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_0:FindUnlockMaps()
	local var_12_1 = 0
	local var_12_2 = 0

	for iter_12_0, iter_12_1 in ipairs(var_12_0) do
		var_12_2 = var_12_2 + iter_12_1.character_num

		if arg_12_1 >= var_12_1 + 1 and arg_12_1 <= var_12_2 then
			return iter_12_1.id
		end

		var_12_1 = var_12_1 + iter_12_1.character_num
	end

	return -1
end

function var_0_0.MapId2MapGraph(arg_13_0, arg_13_1)
	local var_13_0 = "DreamlandMapGraph" .. arg_13_1

	if not _G[var_13_0] then
		local var_13_1 = pcall(function()
			_G[var_13_0] = import("view.activity.Dreamland.graph." .. var_13_0)
		end)
	end

	return _G[var_13_0]
end

function var_0_0.UpdateActivityData(arg_15_0, arg_15_1)
	arg_15_0.activityId = arg_15_1.id

	for iter_15_0, iter_15_1 in ipairs(arg_15_1.data1_list) do
		arg_15_0.mapAwards[iter_15_1] = true
	end

	for iter_15_2, iter_15_3 in ipairs(arg_15_1.data2_list) do
		arg_15_0.exploreAwards[iter_15_3] = true
	end

	for iter_15_4, iter_15_5 in ipairs(arg_15_1.data3_list) do
		arg_15_0.exploreRecords[iter_15_5] = true
	end
end

function var_0_0.GetActivityId(arg_16_0)
	return arg_16_0.activityId
end

function var_0_0.ShouldShowChatTip(arg_17_0, arg_17_1)
	return not arg_17_0:IsRecordExplore(arg_17_1)
end

function var_0_0.IsRecordExplore(arg_18_0, arg_18_1)
	local var_18_0 = arg_18_0:FindExploreObj(arg_18_1).group
	local var_18_1 = arg_18_0.exploreGroups[var_18_0] or {}

	return #var_18_1 > 0 and _.any(var_18_1, function(arg_19_0)
		return arg_18_0.exploreRecords[arg_19_0] == true
	end)
end

local function var_0_1(arg_20_0)
	local var_20_0 = pg.activity_dreamland_event[arg_20_0].story

	return pg.NewStoryMgr.GetInstance():IsPlayed(var_20_0)
end

function var_0_0.FindPlayableStory(arg_21_0)
	return (_.detect(arg_21_0.stories, function(arg_22_0)
		return not var_0_1(arg_22_0.id)
	end))
end

function var_0_0.GetAllMapId(arg_23_0)
	return arg_23_0.mapIds
end

function var_0_0.IsUnlockMap(arg_24_0, arg_24_1)
	local var_24_0 = arg_24_0:FindUnlockMaps()

	return _.any(var_24_0, function(arg_25_0)
		return arg_25_0.id == arg_24_1
	end)
end

function var_0_0.IsUnlockAll(arg_26_0)
	local var_26_0 = arg_26_0:GetAllMapId()

	return _.all(var_26_0, function(arg_27_0)
		return arg_26_0:IsUnlockMap(arg_27_0)
	end)
end

function var_0_0.IsReceiveMapAward(arg_28_0, arg_28_1)
	return arg_28_0.mapAwards[arg_28_1] == true
end

function var_0_0.FindMap(arg_29_0, arg_29_1)
	return pg.activity_dreamland_map[arg_29_1]
end

function var_0_0.FindUnlockMaps(arg_30_0)
	local var_30_0 = {}

	for iter_30_0, iter_30_1 in pairs(arg_30_0.mapIds) do
		local var_30_1 = pg.activity_dreamland_map[iter_30_1]
		local var_30_2 = var_30_1.unlock_condition

		if var_0_1(var_30_2) then
			table.insert(var_30_0, var_30_1)
		end
	end

	return var_30_0
end

function var_0_0.IsFirstEvent(arg_31_0)
	return _.all(arg_31_0.stories, function(arg_32_0)
		return not var_0_1(arg_32_0.id)
	end)
end

function var_0_0.IsLastEvent(arg_33_0)
	local var_33_0 = 0

	for iter_33_0, iter_33_1 in ipairs(arg_33_0.stories) do
		if not var_0_1(iter_33_1.id) then
			var_33_0 = var_33_0 + 1
		end
	end

	return var_33_0 == 1
end

function var_0_0.IsFinishAllEvent(arg_34_0)
	return _.all(arg_34_0.stories, function(arg_35_0)
		return var_0_1(arg_35_0.id)
	end)
end

function var_0_0.UnlockMap2UnlockExploreObj(arg_36_0, arg_36_1)
	local var_36_0 = {}

	for iter_36_0, iter_36_1 in ipairs(arg_36_1.explore) do
		local var_36_1 = arg_36_0.exploreGroups[iter_36_1] or {}

		for iter_36_2, iter_36_3 in ipairs(var_36_1) do
			local var_36_2 = pg.activity_dreamland_explore[iter_36_3]

			table.insert(var_36_0, var_36_2)
		end
	end

	return var_36_0
end

function var_0_0.FindCanInteractionExploreObj(arg_37_0)
	local var_37_0 = arg_37_0:FindUnlockMaps()
	local var_37_1 = {}

	for iter_37_0, iter_37_1 in ipairs(var_37_0) do
		for iter_37_2, iter_37_3 in ipairs(arg_37_0:UnlockMap2UnlockExploreObj(iter_37_1)) do
			table.insert(var_37_1, iter_37_3)
		end
	end

	return var_37_1
end

function var_0_0.GetExploreSubType(arg_38_0, arg_38_1)
	for iter_38_0, iter_38_1 in ipairs(arg_38_0.exploreIds) do
		local var_38_0 = arg_38_0:FindExploreObj(iter_38_1)

		if var_38_0.pic == arg_38_1 then
			return var_38_0.sub_type[1]
		end
	end

	if arg_38_1 == "mengleyuan_qiqiu" then
		return var_0_0.EXPLORE_SUBTYPE_4RAN_NORMAL
	end

	return 0
end

function var_0_0.IsFinishMapExplore(arg_39_0, arg_39_1)
	local var_39_0 = arg_39_0:FindMap(arg_39_1)

	return _.all(var_39_0.explore, function(arg_40_0)
		local var_40_0 = arg_39_0.exploreGroups[arg_40_0] or {}

		return #var_40_0 > 0 and _.any(var_40_0, function(arg_41_0)
			return arg_39_0.exploreRecords[arg_41_0] == true
		end)
	end)
end

function var_0_0.IsReceiveExploreAward(arg_42_0, arg_42_1)
	return arg_42_0.exploreAwards[arg_42_1] == true
end

function var_0_0.FindExploreObj(arg_43_0, arg_43_1)
	return pg.activity_dreamland_explore[arg_43_1]
end

function var_0_0.FindMapIdByExploreId(arg_44_0, arg_44_1)
	local var_44_0 = arg_44_0:FindUnlockMaps()

	for iter_44_0, iter_44_1 in ipairs(var_44_0) do
		local var_44_1 = arg_44_0:UnlockMap2UnlockExploreObj(iter_44_1)

		if _.any(var_44_1, function(arg_45_0)
			return arg_45_0.id == arg_44_1
		end) then
			return iter_44_1.id
		end
	end

	return nil
end

function var_0_0.GetMainExploreInMap(arg_46_0, arg_46_1)
	local var_46_0 = arg_46_1.explore
	local var_46_1 = {}

	for iter_46_0, iter_46_1 in ipairs(var_46_0) do
		local var_46_2 = arg_46_0.exploreGroups[iter_46_1][1]

		if var_46_2 ~= nil then
			table.insert(var_46_1, var_46_2)
		end
	end

	return var_46_1
end

function var_0_0.ExistAnyMapAward(arg_47_0)
	local var_47_0 = arg_47_0:GetAllMapId()

	return _.any(var_47_0, function(arg_48_0)
		return arg_47_0:IsUnlockMap(arg_48_0) and not arg_47_0:IsReceiveMapAward(arg_48_0)
	end)
end

local var_0_2 = "DREAMLAND_KEY"

function var_0_0.FirstTimeExplore(arg_49_0)
	local var_49_0 = getProxy(PlayerProxy):getRawData().id
	local var_49_1 = PlayerPrefs.GetInt(var_0_2 .. var_49_0, 0) == 0
	local var_49_2 = #arg_49_0:FindUnlockMaps() > 0
	local var_49_3 = table.getCount(arg_49_0.exploreAwards) == 0

	return var_49_1 and var_49_2 and var_49_3
end

function var_0_0.ExistAnyExploreAward(arg_50_0)
	local var_50_0 = arg_50_0:GetAllMapId()

	return _.any(var_50_0, function(arg_51_0)
		return arg_50_0:IsFinishMapExplore(arg_51_0) and not arg_50_0:IsReceiveExploreAward(arg_51_0)
	end) or arg_50_0:FirstTimeExplore()
end

function var_0_0.MarkExploreState(arg_52_0)
	if arg_52_0:FirstTimeExplore() then
		local var_52_0 = getProxy(PlayerProxy):getRawData().id

		PlayerPrefs.SetInt(var_0_2 .. var_52_0, 1)
		PlayerPrefs.Save()

		return true
	end

	return false
end

function var_0_0.ExistAnyMapOrExploreAward(arg_53_0)
	return arg_53_0:ExistAnyMapAward() or arg_53_0:ExistAnyExploreAward() or arg_53_0:IsFirstEvent()
end

return var_0_0
