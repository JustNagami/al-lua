local var_0_0 = class("Activity", import(".BaseVO"))
local var_0_1

function var_0_0.GetType2Class()
	if var_0_1 then
		return var_0_1
	end

	var_0_1 = {
		[ActivityConst.ACTIVITY_TYPE_INSTAGRAM] = InstagramActivity,
		[ActivityConst.ACTIVITY_TYPE_HITMONSTERNIAN] = BeatMonterNianActivity,
		[ActivityConst.ACTIVITY_TYPE_COLLECTION_EVENT] = CollectionEventActivity,
		[ActivityConst.ACTIVITY_TYPE_RETURN_AWARD] = ReturnerActivity,
		[ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF] = BuildingBuffActivity,
		[ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF_2] = BuildingBuff2Activity,
		[ActivityConst.ACTIVITY_TYPE_ATELIER_LINK] = AtelierActivity,
		[ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2] = ActivityBossActivity,
		[ActivityConst.ACTIVITY_TYPE_BOSSRUSH] = BossRushActivity,
		[ActivityConst.ACTIVITY_TYPE_EXTRA_BOSSRUSH_RANK] = BossRushRankActivity,
		[ActivityConst.ACTIVITY_TYPE_WORKBENCH] = WorkBenchActivity,
		[ActivityConst.ACTIVITY_TYPE_VIRTUAL_BAG] = VirtualBagActivity,
		[ActivityConst.ACTIVITY_TYPE_SCULPTURE] = SculptureActivity,
		[ActivityConst.ACTIVITY_TYPE_HOTSPRING] = SpringActivity,
		[ActivityConst.ACTIVITY_TYPE_HOTSPRING_2] = Spring2Activity,
		[ActivityConst.ACTIVITY_TYPE_TASK_RYZA] = ActivityTaskActivity,
		[ActivityConst.ACTIVITY_TYPE_PUZZLA] = PuzzleActivity,
		[ActivityConst.ACTIVITY_TYPE_SKIN_COUPON] = SkinCouponActivity,
		[ActivityConst.ACTIVITY_TYPE_MANUAL_SIGN] = ManualSignActivity,
		[ActivityConst.ACTIVITY_TYPE_BOSSSINGLE] = BossSingleActivity,
		[ActivityConst.ACTIVITY_TYPE_EVENT_SINGLE] = SingleEventActivity
	}

	return var_0_1
end

function var_0_0.Create(arg_2_0)
	local var_2_0 = pg.activity_template[arg_2_0.id]

	return (var_0_0.GetType2Class()[var_2_0.type] or Activity).New(arg_2_0)
end

function var_0_0.Ctor(arg_3_0, arg_3_1)
	arg_3_0.id = arg_3_1.id
	arg_3_0.configId = arg_3_0.id
	arg_3_0.stopTime = arg_3_1.stop_time
	arg_3_0.data1 = defaultValue(arg_3_1.data1, 0)
	arg_3_0.data2 = defaultValue(arg_3_1.data2, 0)
	arg_3_0.data3 = defaultValue(arg_3_1.data3, 0)
	arg_3_0.data4 = defaultValue(arg_3_1.data4, 0)
	arg_3_0.data1_list = {}

	for iter_3_0, iter_3_1 in ipairs(arg_3_1.data1_list or {}) do
		table.insert(arg_3_0.data1_list, iter_3_1)
	end

	arg_3_0.data2_list = {}

	for iter_3_2, iter_3_3 in ipairs(arg_3_1.data2_list or {}) do
		table.insert(arg_3_0.data2_list, iter_3_3)
	end

	arg_3_0.data3_list = {}

	for iter_3_4, iter_3_5 in ipairs(arg_3_1.data3_list or {}) do
		table.insert(arg_3_0.data3_list, iter_3_5)
	end

	arg_3_0.data1KeyValueList = {}

	for iter_3_6, iter_3_7 in ipairs(arg_3_1.date1_key_value_list or {}) do
		arg_3_0.data1KeyValueList[iter_3_7.key] = {}

		for iter_3_8, iter_3_9 in ipairs(iter_3_7.value_list or {}) do
			arg_3_0.data1KeyValueList[iter_3_7.key][iter_3_9.key] = iter_3_9.value
		end
	end

	arg_3_0.buffList = {}

	for iter_3_10, iter_3_11 in ipairs(arg_3_1.buff_list or {}) do
		table.insert(arg_3_0.buffList, ActivityBuff.New(arg_3_0.id, iter_3_11.id, iter_3_11.timestamp))
	end

	if arg_3_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_NEWSERVER_SHOP then
		arg_3_0.data2KeyValueList = {}

		for iter_3_12, iter_3_13 in ipairs(arg_3_1.date1_key_value_list or {}) do
			local var_3_0 = iter_3_13.key
			local var_3_1 = iter_3_13.value

			arg_3_0.data2KeyValueList[var_3_0] = {}
			arg_3_0.data2KeyValueList[var_3_0].value = var_3_1
			arg_3_0.data2KeyValueList[var_3_0].dataMap = {}

			for iter_3_14, iter_3_15 in ipairs(iter_3_13.value_list or {}) do
				local var_3_2 = iter_3_15.key
				local var_3_3 = iter_3_15.value

				arg_3_0.data2KeyValueList[var_3_0].dataMap[var_3_2] = var_3_3
			end
		end
	end

	arg_3_0.clientData1 = 0
	arg_3_0.clientList = {}
end

function var_0_0.GetBuffList(arg_4_0)
	return arg_4_0.buffList
end

function var_0_0.AddBuff(arg_5_0, arg_5_1)
	assert(isa(arg_5_1, ActivityBuff), "activityBuff should instance of ActivityBuff")
	table.insert(arg_5_0.buffList, arg_5_1)
end

function var_0_0.setClientList(arg_6_0, arg_6_1)
	arg_6_0.clientList = arg_6_1
end

function var_0_0.getClientList(arg_7_0)
	return arg_7_0.clientList
end

function var_0_0.updateDataList(arg_8_0, arg_8_1)
	table.insert(arg_8_0.data1_list, arg_8_1)
end

function var_0_0.setDataList(arg_9_0, arg_9_1)
	arg_9_0.data1_list = arg_9_1
end

function var_0_0.updateKVPList(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
	if not arg_10_0.data1KeyValueList[arg_10_1] then
		arg_10_0.data1KeyValueList[arg_10_1] = {}
	end

	arg_10_0.data1KeyValueList[arg_10_1][arg_10_2] = arg_10_3
end

function var_0_0.getKVPList(arg_11_0, arg_11_1, arg_11_2)
	if not arg_11_0.data1KeyValueList[arg_11_1] then
		arg_11_0.data1KeyValueList[arg_11_1] = {}
	end

	return arg_11_0.data1KeyValueList[arg_11_1][arg_11_2] or 0
end

function var_0_0.getData1(arg_12_0)
	return arg_12_0.data1
end

function var_0_0.getData3(arg_13_0)
	return arg_13_0.data3
end

function var_0_0.getData1List(arg_14_0)
	return arg_14_0.data1_list
end

function var_0_0.bindConfigTable(arg_15_0)
	return pg.activity_template
end

function var_0_0.getDataConfigTable(arg_16_0)
	local var_16_0 = arg_16_0:getConfig("type")
	local var_16_1 = arg_16_0:getConfig("config_id")

	if var_16_0 == ActivityConst.ACTIVITY_TYPE_MONOPOLY then
		return pg.activity_event_monopoly[tonumber(var_16_1)]
	elseif var_16_0 == ActivityConst.ACTIVITY_TYPE_PIZZA_PT or var_16_0 == ActivityConst.ACTIVITY_TYPE_PT_BUFF then
		return pg.activity_event_pt[tonumber(var_16_1)]
	elseif var_16_0 == ActivityConst.ACTIVITY_TYPE_VOTE then
		return pg.activity_vote[tonumber(var_16_1)]
	end
end

function var_0_0.getDataConfig(arg_17_0, arg_17_1)
	local var_17_0 = arg_17_0:getDataConfigTable()

	assert(var_17_0, "miss config : " .. arg_17_0.id)

	return var_17_0 and var_17_0[arg_17_1]
end

function var_0_0.isEnd(arg_18_0)
	return arg_18_0.stopTime > 0 and pg.TimeMgr.GetInstance():GetServerTime() >= arg_18_0.stopTime
end

function var_0_0.increaseUsedCount(arg_19_0, arg_19_1)
	if arg_19_1 == 1 then
		arg_19_0.data1 = arg_19_0.data1 + 1
	elseif arg_19_1 == 2 then
		arg_19_0.data2 = arg_19_0.data2 + 1
	end
end

function var_0_0.readyToAchieve(arg_20_0)
	local var_20_0, var_20_1 = arg_20_0:IsShowTipById()

	if var_20_0 then
		return var_20_1
	end

	var_0_0.readyToAchieveDic = var_0_0.readyToAchieveDic or {
		[ActivityConst.ACTIVITY_TYPE_CARD_PAIRS] = function(arg_21_0)
			local var_21_0 = os.difftime(pg.TimeMgr.GetInstance():GetServerTime(), arg_21_0.data3)

			return math.ceil(var_21_0 / 86400) > arg_21_0.data2 and arg_21_0.data2 < arg_21_0:getConfig("config_data")[4]
		end,
		[ActivityConst.ACTIVITY_TYPE_LEVELAWARD] = function(arg_22_0)
			local var_22_0 = getProxy(PlayerProxy):getRawData()
			local var_22_1 = pg.activity_level_award[arg_22_0:getConfig("config_id")]

			for iter_22_0 = 1, #var_22_1.front_drops do
				local var_22_2 = var_22_1.front_drops[iter_22_0][1]

				if var_22_2 <= var_22_0.level and not _.include(arg_22_0.data1_list, var_22_2) then
					return true
				end
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_STORY_AWARD] = function(arg_23_0)
			local var_23_0 = getProxy(PlayerProxy):getRawData()
			local var_23_1 = pg.activity_event_chapter_award[arg_23_0:getConfig("config_id")]

			for iter_23_0 = 1, #var_23_1.chapter do
				local var_23_2 = var_23_1.chapter[iter_23_0]

				if getProxy(ChapterProxy):isClear(var_23_2) and not _.include(arg_23_0.data1_list, var_23_2) then
					return true
				end
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_TASKS] = function(arg_24_0)
			local var_24_0 = getProxy(TaskProxy)
			local var_24_1 = _.flatten(arg_24_0:getConfig("config_data"))

			if _.any(var_24_1, function(arg_25_0)
				local var_25_0 = var_24_0:getTaskById(arg_25_0)

				return var_25_0 and var_25_0:isFinish() and not var_25_0:isReceive()
			end) then
				return true
			end

			local var_24_2 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_WORLDINPICTURE)

			if var_24_2 and not var_24_2:isEnd() and var_24_2:getConfig("config_client").linkActID == arg_24_0.id and var_24_2:readyToAchieve() then
				return true
			end

			if arg_24_0:getConfig("config_client") and arg_24_0:getConfig("config_client").decodeGameId then
				local var_24_3 = arg_24_0:getConfig("config_client").decodeGameId
				local var_24_4 = getProxy(MiniGameProxy):GetHubByGameId(var_24_3)

				if var_24_4 then
					local var_24_5 = arg_24_0:getConfig("config_data")
					local var_24_6 = var_24_5[#var_24_5]
					local var_24_7 = _.all(var_24_6, function(arg_26_0)
						return getProxy(TaskProxy):getFinishTaskById(arg_26_0) ~= nil
					end)

					if var_24_4.ultimate <= 0 and var_24_7 then
						return true
					end
				end
			end

			if arg_24_0:getConfig("config_client") and arg_24_0:getConfig("config_client").linkTaskPoolAct then
				local var_24_8 = arg_24_0:getConfig("config_client").linkTaskPoolAct
				local var_24_9 = getProxy(ActivityProxy):getActivityById(var_24_8)

				if var_24_9 and var_24_9:readyToAchieve() then
					return true
				end
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_TASK_LIST] = function(...)
			return var_0_0.readyToAchieveDic[ActivityConst.ACTIVITY_TYPE_TASKS](...)
		end,
		[ActivityConst.ACTIVITY_TYPE_HITMONSTERNIAN] = function(arg_28_0)
			local var_28_0 = arg_28_0:GetCountForHitMonster()

			return not (arg_28_0:GetDataConfig("hp") <= arg_28_0.data3) and var_28_0 > 0
		end,
		[ActivityConst.ACTIVITY_TYPE_DODGEM] = function(arg_29_0)
			local var_29_0 = pg.TimeMgr.GetInstance()
			local var_29_1 = var_29_0:DiffDay(arg_29_0.data1, var_29_0:GetServerTime()) + 1
			local var_29_2 = arg_29_0:getConfig("config_id")

			if var_29_2 == 1 then
				return arg_29_0.data4 == 0 and arg_29_0.data2 >= 7 or defaultValue(arg_29_0.data2_list[1], 0) > 0 or defaultValue(arg_29_0.data2_list[2], 0) > 0 or arg_29_0.data2 < math.min(var_29_1, 7) or var_29_1 > arg_29_0.data3
			elseif var_29_2 == 2 then
				return arg_29_0.data4 == 0 and arg_29_0.data2 >= 7 or defaultValue(arg_29_0.data2_list[1], 0) > 0 or defaultValue(arg_29_0.data2_list[2], 0) > 0 or arg_29_0.data2 < math.min(var_29_1, 7)
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_MONOPOLY] = function(arg_30_0)
			local var_30_0 = arg_30_0.data1
			local var_30_1 = arg_30_0.data1_list[1]
			local var_30_2 = arg_30_0.data1_list[2]
			local var_30_3 = arg_30_0.data2_list[1]
			local var_30_4 = arg_30_0.data2_list[2]
			local var_30_5 = pg.TimeMgr.GetInstance():GetServerTime()
			local var_30_6 = math.ceil((var_30_5 - var_30_0) / 86400) * arg_30_0:getDataConfig("daily_time") + var_30_1 - var_30_2
			local var_30_7 = var_30_3 - var_30_4

			return var_30_6 > 0
		end,
		[ActivityConst.ACTIVITY_TYPE_PIZZA_PT] = function(arg_31_0)
			local var_31_0 = ActivityPtData.New(arg_31_0):CanGetAward()
			local var_31_1 = true

			if arg_31_0:getConfig("config_client") then
				local var_31_2 = arg_31_0:getConfig("config_client").task_act_id

				if var_31_2 and var_31_2 ~= 0 and pg.activity_template[var_31_2] then
					local var_31_3 = pg.activity_template[var_31_2]
					local var_31_4 = _.flatten(var_31_3.config_data)

					if var_31_4 and #var_31_4 > 0 then
						local var_31_5 = getProxy(TaskProxy)

						for iter_31_0 = 1, #var_31_4 do
							local var_31_6 = var_31_5:getTaskById(var_31_4[iter_31_0])

							if var_31_6 and var_31_6:isFinish() then
								return true
							end
						end
					end
				end
			end

			local var_31_7 = false
			local var_31_8 = arg_31_0:getConfig("config_client").fireworkActID

			if var_31_8 and var_31_8 ~= 0 then
				local var_31_9 = getProxy(ActivityProxy):getActivityById(var_31_8)

				var_31_7 = var_31_9 and var_31_9:readyToAchieve() or false
			end

			local var_31_10 = arg_31_0:getConfig("config_client")[2]
			local var_31_11 = type(var_31_10) == "number" and ManualSignActivity.IsManualSignActAndAnyAwardCanGet(var_31_10)

			return var_31_0 and var_31_1 or var_31_7 or var_31_11
		end,
		[ActivityConst.ACTIVITY_TYPE_PT_BUFF] = function(...)
			return var_0_0.readyToAchieveDic[ActivityConst.ACTIVITY_TYPE_PIZZA_PT](...)
		end,
		[ActivityConst.ACTIVITY_TYPE_RETURN_AWARD] = function(arg_33_0)
			local var_33_0 = arg_33_0.data1

			if var_33_0 == 1 then
				local var_33_1 = pg.activity_template_headhunting[arg_33_0.id]
				local var_33_2 = var_33_1.target
				local var_33_3 = 0

				for iter_33_0, iter_33_1 in ipairs(arg_33_0:getClientList()) do
					var_33_3 = var_33_3 + iter_33_1:getPt()
				end

				local var_33_4 = 0

				for iter_33_2 = #var_33_2, 1, -1 do
					if table.contains(arg_33_0.data1_list, var_33_2[iter_33_2]) then
						var_33_4 = iter_33_2

						break
					end
				end

				local var_33_5 = var_33_1.drop_client
				local var_33_6 = math.min(var_33_4 + 1, #var_33_5)
				local var_33_7 = _.any(var_33_1.tasklist, function(arg_34_0)
					local var_34_0 = getProxy(TaskProxy):getTaskById(arg_34_0)

					return var_34_0 and var_34_0:isFinish() and not var_34_0:isReceive()
				end)

				return var_33_3 >= var_33_2[var_33_6] and var_33_4 ~= #var_33_5 or var_33_7
			elseif var_33_0 == 2 then
				local var_33_8 = getProxy(TaskProxy)
				local var_33_9 = pg.activity_template_returnner[arg_33_0.id]

				return _.any(_.flatten(var_33_9.task_list), function(arg_35_0)
					local var_35_0 = var_33_8:getTaskById(arg_35_0)

					return var_35_0 and var_35_0:isFinish()
				end)
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_MINIGAME] = function(arg_36_0)
			local var_36_0 = getProxy(MiniGameProxy):GetHubByHubId(arg_36_0:getConfig("config_id"))

			if var_36_0.count > 0 then
				return true
			end

			if var_36_0:getConfig("reward") ~= 0 and var_36_0.usedtime >= var_36_0:getConfig("reward_need") and var_36_0.ultimate == 0 then
				return true
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_TURNTABLE] = function(arg_37_0)
			local var_37_0 = pg.activity_event_turning[arg_37_0:getConfig("config_id")]
			local var_37_1 = arg_37_0.data4

			if var_37_1 ~= 0 then
				local var_37_2 = var_37_0.task_table[var_37_1]
				local var_37_3 = getProxy(TaskProxy)

				for iter_37_0, iter_37_1 in ipairs(var_37_2) do
					if (var_37_3:getTaskById(iter_37_1) or var_37_3:getFinishTaskById(iter_37_1)):getTaskStatus() == 1 then
						return true
					end
				end

				local var_37_4 = pg.TimeMgr.GetInstance():DiffDay(arg_37_0.data1, pg.TimeMgr.GetInstance():GetServerTime()) + 1

				if math.clamp(var_37_4, 1, pg.activity_event_turning[arg_37_0:getConfig("config_id")].total_num) > arg_37_0.data3 then
					for iter_37_2, iter_37_3 in ipairs(var_37_2) do
						if (var_37_3:getTaskById(iter_37_3) or var_37_3:getFinishTaskById(iter_37_3)):getTaskStatus() ~= 2 then
							return false
						end
					end

					return true
				end
			elseif var_37_1 == 0 then
				local var_37_5 = pg.TimeMgr.GetInstance():DiffDay(arg_37_0.data1, pg.TimeMgr.GetInstance():GetServerTime()) + 1

				if math.clamp(var_37_5, 1, pg.activity_event_turning[arg_37_0:getConfig("config_id")].total_num) > arg_37_0.data3 then
					return true
				end
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_LOTTERY_AWARD] = function(arg_38_0)
			return not (arg_38_0.data2 > 0)
		end,
		[ActivityConst.ACTIVITY_TYPE_SHRINE] = function(arg_39_0)
			local var_39_0 = arg_39_0:getConfig("config_client").story
			local var_39_1 = var_39_0 and #var_39_0 or 7
			local var_39_2 = pg.TimeMgr.GetInstance():DiffDay(arg_39_0.data3, pg.TimeMgr.GetInstance():GetServerTime()) + 1
			local var_39_3 = math.clamp(var_39_2, 1, var_39_1)
			local var_39_4 = pg.NewStoryMgr.GetInstance()
			local var_39_5 = math.clamp(arg_39_0.data2, 0, var_39_1)

			for iter_39_0 = 1, var_39_3 do
				local var_39_6 = var_39_0[iter_39_0][1]

				if var_39_6 and iter_39_0 <= var_39_5 and not var_39_4:IsPlayed(var_39_6) then
					return true
				end
			end

			if var_39_1 <= var_39_3 and var_39_1 <= arg_39_0.data2 and not (arg_39_0.data1 > 0) then
				return true
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_LINK_LINK] = function(arg_40_0)
			local var_40_0 = arg_40_0:getConfig("config_client")[3]
			local var_40_1 = pg.TimeMgr.GetInstance()
			local var_40_2 = var_40_1:DiffDay(arg_40_0.data3, var_40_1:GetServerTime()) + 1 - arg_40_0.data2

			return math.clamp(var_40_2, 0, #var_40_0 - arg_40_0.data2) > 0
		end,
		[ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF] = function(arg_41_0)
			local var_41_0 = arg_41_0:GetBuildingIds()

			for iter_41_0, iter_41_1 in ipairs(var_41_0) do
				local var_41_1 = arg_41_0:GetBuildingLevel(iter_41_1)
				local var_41_2 = pg.activity_event_building[iter_41_1]

				if var_41_2 and var_41_1 < #var_41_2.buff then
					local var_41_3 = var_41_2.material[var_41_1]

					if underscore.all(var_41_3, function(arg_42_0)
						local var_42_0 = arg_42_0[1]
						local var_42_1 = arg_42_0[2]
						local var_42_2 = arg_42_0[3]
						local var_42_3 = 0

						if var_42_0 == DROP_TYPE_VITEM then
							local var_42_4 = AcessWithinNull(Item.getConfigData(var_42_1), "link_id")

							assert(var_42_4 == arg_41_0.id)

							var_42_3 = arg_41_0:GetMaterialCount(var_42_1)
						elseif var_42_0 > DROP_TYPE_USE_ACTIVITY_DROP then
							local var_42_5 = AcessWithinNull(pg.activity_drop_type[var_42_0], "activity_id")

							assert(var_42_5)

							bagAct = getProxy(ActivityProxy):getActivityById(var_42_5)
							var_42_3 = bagAct:getVitemNumber(var_42_1)
						end

						return var_42_2 <= var_42_3
					end) then
						return true
					end
				end
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF_2] = function(arg_43_0, ...)
			return var_0_0.readyToAchieveDic[ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF](arg_43_0, ...) or arg_43_0:CanRequest()
		end,
		[ActivityConst.ACTIVITY_TYPE_EXPEDITION] = function(arg_44_0)
			if arg_44_0.data3 > 0 and arg_44_0.data1 ~= 0 then
				return true
			else
				for iter_44_0 = 1, #arg_44_0.data1_list do
					if not bit.band(arg_44_0.data1_list[iter_44_0], ActivityConst.EXPEDITION_TYPE_GOT) ~= 0 then
						if bit.band(arg_44_0.data1_list[iter_44_0], ActivityConst.EXPEDITION_TYPE_OPEN) ~= 0 then
							return true
						elseif bit.band(arg_44_0.data1_list[iter_44_0], ActivityConst.EXPEDITION_TYPE_BAOXIANG) ~= 0 then
							return true
						elseif bit.band(arg_44_0.data1_list[iter_44_0], ActivityConst.EXPEDITION_TYPE_BOSS) ~= 0 then
							return true
						end
					end
				end
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_CLIENT_DISPLAY] = function(arg_45_0)
			local var_45_0 = arg_45_0:getConfig("config_client")

			if var_45_0 and var_45_0.linkGameHubID then
				local var_45_1 = getProxy(MiniGameProxy):GetHubByHubId(var_45_0.linkGameHubID)

				if var_45_1 and var_45_1.count > 0 then
					return true
				end
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_BB] = function(arg_46_0)
			return arg_46_0.data2 > 0
		end,
		[ActivityConst.ACTIVITY_TYPE_PUZZLA] = function(arg_47_0)
			local var_47_0 = arg_47_0.data1_list
			local var_47_1 = arg_47_0.data2_list
			local var_47_2 = arg_47_0:GetPicturePuzzleIds()
			local var_47_3 = arg_47_0:getConfig("config_client").linkActID

			if var_47_3 then
				local var_47_4 = getProxy(ActivityProxy):getActivityById(var_47_3)

				if var_47_4 and var_47_4:readyToAchieve() then
					return true
				end
			end

			if _.any(var_47_2, function(arg_48_0)
				local var_48_0 = table.contains(var_47_1, arg_48_0)
				local var_48_1 = table.contains(var_47_0, arg_48_0)

				return not var_48_0 and var_48_1
			end) then
				return true
			end

			local var_47_5 = pg.activity_event_picturepuzzle[arg_47_0.id]

			if var_47_5 and var_47_5.chapter > 0 and arg_47_0.data1 < 1 then
				return true
			end

			if var_47_5 and #var_47_5.auto_finish_args > 0 and arg_47_0.data1 == 1 then
				return true
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_WORLDINPICTURE] = function(arg_49_0)
			local var_49_0 = WorldInPictureActiviyData.New(arg_49_0)

			return not var_49_0:IsTravelAll() and var_49_0:GetTravelPoint() > 0 or var_49_0:GetDrawPoint() > 0 and var_49_0:AnyAreaCanDraw()
		end,
		[ActivityConst.ACTIVITY_TYPE_APRIL_REWARD] = function(arg_50_0)
			if arg_50_0.data1 == 0 then
				local var_50_0 = arg_50_0:getStartTime()
				local var_50_1 = pg.TimeMgr.GetInstance():GetServerTime()

				if arg_50_0:getConfig("config_client").autounlock <= var_50_1 - var_50_0 then
					return true
				end
			elseif arg_50_0.data1 ~= 0 and arg_50_0.data2 == 0 then
				return true
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_TASK_POOL] = function(arg_51_0)
			local var_51_0 = arg_51_0:getConfig("config_data")
			local var_51_1 = getProxy(TaskProxy)

			if arg_51_0.data1 >= #var_51_0 then
				return false
			end

			local var_51_2 = pg.TimeMgr.GetInstance()
			local var_51_3 = (var_51_2:DiffDay(arg_51_0:getStartTime(), var_51_2:GetServerTime()) + 1) * arg_51_0:getConfig("config_id")

			var_51_3 = var_51_3 > #var_51_0 and #var_51_0 or var_51_3

			local var_51_4 = _.any(var_51_0, function(arg_52_0)
				local var_52_0 = var_51_1:getTaskById(arg_52_0)

				return var_52_0 and var_52_0:isFinish()
			end)

			return var_51_3 - arg_51_0.data1 > 0 and var_51_4
		end,
		[ActivityConst.ACTIVITY_TYPE_EVENT] = function(arg_53_0)
			local var_53_0 = getProxy(PlayerProxy):getData().id

			return PlayerPrefs.GetInt("ACTIVITY_TYPE_EVENT_" .. arg_53_0.id .. "_" .. var_53_0) == 0
		end,
		[ActivityConst.ACTIVITY_TYPE_PT_OTHER] = function(arg_54_0)
			if arg_54_0.data2 and arg_54_0.data2 <= 0 and arg_54_0.data1 >= pg.activity_event_avatarframe[arg_54_0:getConfig("config_id")].target then
				return true
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_HOTSPRING] = function(arg_55_0)
			local var_55_0, var_55_1 = arg_55_0:GetUpgradeCost()

			if arg_55_0:GetSlotCount() < arg_55_0:GetTotalSlotCount() and var_55_1 <= arg_55_0:GetCoins() then
				return true
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_FIREWORK] = function(arg_56_0)
			local var_56_0 = arg_56_0:getConfig("config_data")[2][1]
			local var_56_1 = arg_56_0:getConfig("config_data")[2][2]
			local var_56_2 = getProxy(PlayerProxy):getRawData():getResource(var_56_0)

			if arg_56_0.data1 > 0 and var_56_1 <= var_56_2 then
				return true
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_FLOWER_FIELD] = function(arg_57_0)
			local var_57_0 = pg.TimeMgr.GetInstance()

			return var_57_0:GetServerTime() >= var_57_0:GetTimeToNextTime(math.max(arg_57_0.data1, arg_57_0.data2))
		end,
		[ActivityConst.ACTIVITY_TYPE_ISLAND] = function(arg_58_0)
			for iter_58_0, iter_58_1 in pairs(getProxy(IslandProxy):GetNodeDic()) do
				if iter_58_1:IsVisual() and iter_58_1:RedDotHint() then
					return true
				end
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_HOTSPRING_2] = function(arg_59_0)
			return Spring2Activity.readyToAchieve(arg_59_0)
		end,
		[ActivityConst.ACTIVITY_TYPE_CARD_PUZZLE] = function(arg_60_0)
			local var_60_0 = #arg_60_0.data2_list
			local var_60_1 = arg_60_0:getData1List()
			local var_60_2 = arg_60_0:getConfig("config_data")[2]

			if #var_60_1 == #var_60_2 then
				return false
			end

			local function var_60_3()
				for iter_61_0, iter_61_1 in ipairs(var_60_2) do
					if not table.contains(var_60_1, iter_61_1[1]) and var_60_0 >= iter_61_1[1] then
						return true
					end
				end

				return false
			end

			local function var_60_4()
				local var_62_0 = getProxy(PlayerProxy):getData().id

				return PlayerPrefs.GetInt("DAY_TIP_" .. arg_60_0.id .. "_" .. var_62_0 .. "_" .. arg_60_0:getDayIndex()) == 0
			end

			return var_60_3() or var_60_4()
		end,
		[ActivityConst.ACTIVITY_TYPE_SURVEY] = function(arg_63_0)
			local var_63_0, var_63_1 = getProxy(ActivityProxy):isSurveyOpen()

			return var_63_0 and not SurveyPage.IsEverEnter(var_63_1)
		end,
		[ActivityConst.ACTIVITY_TYPE_ZUMA] = function(arg_64_0)
			return LaunchBallActivityMgr.GetInvitationAble(arg_64_0.id)
		end,
		[ActivityConst.ACTIVITY_TYPE_GIFT_UP] = function(arg_65_0)
			local var_65_0 = arg_65_0:getConfig("config_client").gifts[2]
			local var_65_1 = math.min(#var_65_0, arg_65_0:getNDay())

			return underscore(var_65_0):chain():first(var_65_1):any(function(arg_66_0)
				local var_66_0 = getProxy(ShopsProxy):GetGiftCommodity(arg_66_0, Goods.TYPE_GIFT_PACKAGE)

				return var_66_0:canPurchase() and var_66_0:inTime() and not var_66_0:IsGroupLimit()
			end):value()
		end
	}

	return switch(arg_20_0:getConfig("type"), var_0_0.readyToAchieveDic, nil, arg_20_0)
end

function var_0_0.IsShowTipById(arg_67_0)
	var_0_0.ShowTipTableById = var_0_0.ShowTipTableById or {
		[ActivityConst.ACTIVITY_ID_US_SKIRMISH_RE] = function()
			local var_68_0 = getProxy(SkirmishProxy)

			var_68_0:UpdateSkirmishProgress()

			local var_68_1 = var_68_0:getRawData()
			local var_68_2 = 0
			local var_68_3 = 0

			for iter_68_0, iter_68_1 in ipairs(var_68_1) do
				local var_68_4 = iter_68_1:GetState()

				var_68_2 = var_68_4 > SkirmishVO.StateInactive and var_68_2 + 1 or var_68_2
				var_68_3 = var_68_4 == SkirmishVO.StateClear and var_68_3 + 1 or var_68_3
			end

			return var_68_3 < var_68_2
		end,
		[ActivityConst.POCKY_SKIN_LOGIN] = function()
			local var_69_0 = arg_67_0:getConfig("config_client").linkids
			local var_69_1 = getProxy(TaskProxy)
			local var_69_2 = getProxy(ActivityProxy)
			local var_69_3 = var_69_2:getActivityById(var_69_0[1])
			local var_69_4 = var_69_2:getActivityById(var_69_0[2])
			local var_69_5 = var_69_2:getActivityById(var_69_0[3])

			assert(var_69_3 and var_69_4 and var_69_5)

			local function var_69_6()
				return var_69_3 and var_69_3:readyToAchieve()
			end

			local function var_69_7()
				return var_69_4 and var_69_4:readyToAchieve()
			end

			local function var_69_8()
				local var_72_0 = _.flatten(arg_67_0:getConfig("config_data"))

				for iter_72_0 = 1, math.min(#var_72_0, var_69_4.data3) do
					local var_72_1 = var_72_0[iter_72_0]
					local var_72_2 = var_69_1:getTaskById(var_72_1)

					if var_72_2 and var_72_2:isFinish() and not var_72_2:isReceive() then
						return true
					end
				end
			end

			local function var_69_9()
				if not (var_69_5 and var_69_5:readyToAchieve()) or not var_69_3 then
					return false
				end

				local var_73_0 = ActivityPtData.New(var_69_3)

				return var_73_0.level >= #var_73_0.targets
			end

			return var_69_8() or var_69_6() or var_69_7() or var_69_9()
		end,
		[ActivityConst.TOWERCLIMBING_SIGN] = function()
			local var_74_0 = getProxy(MiniGameProxy):GetHubByHubId(9)
			local var_74_1 = var_74_0.ultimate
			local var_74_2 = var_74_0:getConfig("reward_need")
			local var_74_3 = var_74_0.usedtime

			return var_74_1 == 0 and var_74_2 <= var_74_3
		end,
		[pg.activity_const.NEWYEAR_SNACK_PAGE_ID.act_id] = NewYearSnackPage.IsTip,
		[ActivityConst.WWF_TASK_ID] = WWFPtPage.IsShowRed,
		[ActivityConst.NEWMEIXIV4_SKIRMISH_ID] = NewMeixiV4SkirmishPage.IsShowRed,
		[ActivityConst.JIUJIU_YOYO_ID] = JiujiuYoyoPage.IsShowRed,
		[ActivityConst.SENRANKAGURA_TRAIN_ACT_ID] = SenrankaguraTrainScene.IsShowRed
	}

	local var_67_0 = var_0_0.ShowTipTableById[arg_67_0.id]

	return tobool(var_67_0), var_67_0 and var_67_0()
end

function var_0_0.isShow(arg_75_0)
	if arg_75_0:getConfig("is_show") <= 0 then
		return false
	end

	if arg_75_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_RETURN_AWARD then
		return arg_75_0.data1 ~= 0
	elseif arg_75_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_CLIENT_DISPLAY then
		local var_75_0 = arg_75_0:getConfig("config_client").display_link

		if var_75_0 then
			return underscore.any(var_75_0, function(arg_76_0)
				return arg_76_0[2] == 0 or pg.TimeMgr.GetInstance():inTime(pg.shop_template[arg_76_0[2]].time)
			end)
		end
	elseif arg_75_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_SURVEY then
		local var_75_1 = getProxy(ActivityProxy)
		local var_75_2 = var_75_1:isSurveyOpen()
		local var_75_3 = var_75_1:isSurveyDone()

		return var_75_2 and not var_75_3
	end

	return true
end

function var_0_0.isAfterShow(arg_77_0)
	if arg_77_0.configId == ActivityConst.UR_TASK_ACT_ID or arg_77_0.configId == ActivityConst.SPECIAL_WEAPON_ACT_ID then
		local var_77_0 = getProxy(TaskProxy)

		return underscore.all(arg_77_0:getConfig("config_data")[1], function(arg_78_0)
			local var_78_0 = var_77_0:getTaskVO(arg_78_0)

			return var_78_0 and var_78_0:isReceive()
		end)
	end

	return false
end

function var_0_0.getShowPriority(arg_79_0)
	return arg_79_0:getConfig("is_show")
end

function var_0_0.left4Day(arg_80_0)
	if arg_80_0.stopTime - pg.TimeMgr.GetInstance():GetServerTime() < 345600 then
		return true
	end

	return false
end

function var_0_0.getAwardInfos(arg_81_0)
	return arg_81_0.data1KeyValueList or {}
end

function var_0_0.updateData(arg_82_0, arg_82_1, arg_82_2)
	if arg_82_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_LOTTERY then
		if not arg_82_0:getAwardInfos()[arg_82_1] then
			arg_82_0.data1KeyValueList[arg_82_1] = {}
		end

		for iter_82_0, iter_82_1 in ipairs(arg_82_2) do
			if arg_82_0.data1KeyValueList[arg_82_1][iter_82_1] then
				arg_82_0.data1KeyValueList[arg_82_1][iter_82_1] = arg_82_0.data1KeyValueList[arg_82_1][iter_82_1] + 1
			else
				arg_82_0.data1KeyValueList[arg_82_1][iter_82_1] = 1
			end
		end
	end
end

function var_0_0.getTaskShip(arg_83_0)
	return arg_83_0:getConfig("config_client")[1]
end

function var_0_0.getNotificationMsg(arg_84_0)
	local var_84_0 = arg_84_0:getConfig("type")
	local var_84_1 = ActivityProxy.ACTIVITY_SHOW_AWARDS

	if var_84_0 == ActivityConst.ACTIVITY_TYPE_SHOP then
		var_84_1 = ActivityProxy.ACTIVITY_SHOP_SHOW_AWARDS
	elseif var_84_0 == ActivityConst.ACTIVITY_TYPE_LOTTERY then
		var_84_1 = ActivityProxy.ACTIVITY_LOTTERY_SHOW_AWARDS
	elseif var_84_0 == ActivityConst.ACTIVITY_TYPE_REFLUX then
		var_84_1 = ActivityProxy.ACTIVITY_SHOW_REFLUX_AWARDS
	elseif var_84_0 == ActivityConst.ACTIVITY_TYPE_RED_PACKETS or var_84_0 == ActivityConst.ACTIVITY_TYPE_RED_PACKET_LOTTER then
		var_84_1 = ActivityProxy.ACTIVITY_SHOW_RED_PACKET_AWARDS
	end

	return var_84_1
end

function var_0_0.getDayIndex(arg_85_0)
	local var_85_0 = arg_85_0:getStartTime()
	local var_85_1 = pg.TimeMgr.GetInstance()
	local var_85_2 = var_85_1:GetServerTime()

	return var_85_1:DiffDay(var_85_0, var_85_2) + 1
end

function var_0_0.getStartTime(arg_86_0)
	local var_86_0, var_86_1 = parseTimeConfig(arg_86_0:getConfig("time"))

	if var_86_1 and var_86_1[1] == "newuser" then
		return arg_86_0.stopTime - var_86_1[3] * 86400
	else
		return pg.TimeMgr.GetInstance():parseTimeFromConfig(var_86_0[2])
	end
end

function var_0_0.getNDay(arg_87_0, arg_87_1)
	arg_87_1 = arg_87_1 or arg_87_0:getStartTime()

	local var_87_0 = pg.TimeMgr.GetInstance()

	return var_87_0:DiffDay(arg_87_1, var_87_0:GetServerTime()) + 1
end

function var_0_0.isVariableTime(arg_88_0)
	local var_88_0, var_88_1 = parseTimeConfig(arg_88_0:getConfig("time"))

	return var_88_1 and var_88_1[1] == "newuser"
end

function var_0_0.setSpecialData(arg_89_0, arg_89_1, arg_89_2)
	arg_89_0.speciaData = arg_89_0.speciaData and arg_89_0.speciaData or {}
	arg_89_0.speciaData[arg_89_1] = arg_89_2
end

function var_0_0.getSpecialData(arg_90_0, arg_90_1)
	return arg_90_0.speciaData and arg_90_0.speciaData[arg_90_1] and arg_90_0.speciaData[arg_90_1] or nil
end

function var_0_0.canPermanentFinish(arg_91_0)
	local var_91_0 = arg_91_0:getConfig("type")

	if var_91_0 == ActivityConst.ACTIVITY_TYPE_TASK_LIST then
		local var_91_1 = arg_91_0:getConfig("config_data")
		local var_91_2 = getProxy(TaskProxy)

		return underscore.all(underscore.flatten({
			var_91_1[#var_91_1]
		}), function(arg_92_0)
			return var_91_2:getFinishTaskById(arg_92_0) ~= nil
		end)
	elseif var_91_0 == ActivityConst.ACTIVITY_TYPE_PT_BUFF then
		local var_91_3 = ActivityPtData.New(arg_91_0)

		return var_91_3.level >= #var_91_3.targets
	end

	return false
end

function var_0_0.GetShopTime(arg_93_0)
	local var_93_0 = pg.TimeMgr.GetInstance()
	local var_93_1 = arg_93_0:getStartTime()
	local var_93_2 = arg_93_0.stopTime

	return var_93_0:STimeDescS(var_93_1, "%y.%m.%d") .. " - " .. var_93_0:STimeDescS(var_93_2, "%y.%m.%d")
end

function var_0_0.GetCrusingUnreceiveAward(arg_94_0)
	assert(arg_94_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_PT_CRUSING, "type error")

	local var_94_0 = pg.battlepass_event_pt[arg_94_0.id]
	local var_94_1 = {}
	local var_94_2 = {}

	for iter_94_0, iter_94_1 in ipairs(arg_94_0.data1_list) do
		var_94_2[iter_94_1] = true
	end

	for iter_94_2, iter_94_3 in ipairs(var_94_0.target) do
		if iter_94_3 > arg_94_0.data1 then
			break
		elseif not var_94_2[iter_94_3] then
			table.insert(var_94_1, Drop.Create(var_94_0.drop_client[iter_94_2]))
		end
	end

	if arg_94_0.data2 ~= 1 then
		return PlayerConst.MergePassItemDrop(var_94_1)
	end

	local var_94_3 = {}

	for iter_94_4, iter_94_5 in ipairs(arg_94_0.data2_list) do
		var_94_3[iter_94_5] = true
	end

	for iter_94_6, iter_94_7 in ipairs(var_94_0.target) do
		if iter_94_7 > arg_94_0.data1 then
			break
		elseif not var_94_3[iter_94_7] then
			table.insert(var_94_1, Drop.Create(var_94_0.drop_client_pay[iter_94_6]))
		end
	end

	return PlayerConst.MergePassItemDrop(var_94_1)
end

function var_0_0.GetCrusingInfo(arg_95_0)
	assert(arg_95_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_PT_CRUSING, "type error")

	local var_95_0 = pg.battlepass_event_pt[arg_95_0.id]
	local var_95_1 = var_95_0.pt
	local var_95_2 = {}
	local var_95_3 = {}

	for iter_95_0, iter_95_1 in ipairs(var_95_0.key_point_display) do
		var_95_3[iter_95_1] = true
	end

	for iter_95_2, iter_95_3 in ipairs(var_95_0.target) do
		table.insert(var_95_2, {
			id = iter_95_2,
			pt = iter_95_3,
			award = var_95_0.drop_client[iter_95_2],
			award_pay = var_95_0.drop_client_pay[iter_95_2],
			isImportent = var_95_3[iter_95_2]
		})
	end

	local var_95_4 = arg_95_0.data1
	local var_95_5 = arg_95_0.data2 == 1
	local var_95_6 = {}

	for iter_95_4, iter_95_5 in ipairs(arg_95_0.data1_list) do
		var_95_6[iter_95_5] = true
	end

	local var_95_7 = {}

	for iter_95_6, iter_95_7 in ipairs(arg_95_0.data2_list) do
		var_95_7[iter_95_7] = true
	end

	local var_95_8 = 0

	for iter_95_8, iter_95_9 in ipairs(var_95_2) do
		if var_95_4 < iter_95_9.pt then
			break
		else
			var_95_8 = iter_95_8
		end
	end

	return {
		ptId = var_95_1,
		awardList = var_95_2,
		pt = var_95_4,
		isPay = var_95_5,
		awardDic = var_95_6,
		awardPayDic = var_95_7,
		phase = var_95_8
	}
end

function var_0_0.IsActivityReady(arg_96_0)
	return arg_96_0 and not arg_96_0:isEnd() and arg_96_0:readyToAchieve()
end

return var_0_0
