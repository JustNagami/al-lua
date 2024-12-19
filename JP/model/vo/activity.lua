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
		[ActivityConst.ACTIVITY_TYPE_EVENT_SINGLE] = SingleEventActivity,
		[ActivityConst.ACTIVITY_TYPE_LINER] = LinerActivity,
		[ActivityConst.ACTIVITY_TYPE_TOWN] = TownActivity,
		[ActivityConst.ACTIVITY_TYPE_AIRFIGHT_BATTLE] = AirFightActivity,
		[ActivityConst.ACTIVITY_TYPE_NOT_TRACEABLE] = NotTraceableTaskActivity
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
	arg_3_0.str_data1 = defaultValue(arg_3_1.str_data1, "")
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

	arg_3_0.data4_list = {}

	for iter_3_6, iter_3_7 in ipairs(arg_3_1.data4_list or {}) do
		table.insert(arg_3_0.data4_list, iter_3_7)
	end

	arg_3_0.data1KeyValueList = {}

	for iter_3_8, iter_3_9 in ipairs(arg_3_1.date1_key_value_list or {}) do
		arg_3_0.data1KeyValueList[iter_3_9.key] = {}

		for iter_3_10, iter_3_11 in ipairs(iter_3_9.value_list or {}) do
			arg_3_0.data1KeyValueList[iter_3_9.key][iter_3_11.key] = iter_3_11.value
		end
	end

	arg_3_0.buffList = {}

	for iter_3_12, iter_3_13 in ipairs(arg_3_1.buff_list or {}) do
		table.insert(arg_3_0.buffList, ActivityBuff.New(arg_3_0.id, iter_3_13.id, iter_3_13.timestamp))
	end

	if arg_3_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_NEWSERVER_SHOP then
		arg_3_0.data2KeyValueList = {}

		for iter_3_14, iter_3_15 in ipairs(arg_3_1.date1_key_value_list or {}) do
			local var_3_0 = iter_3_15.key
			local var_3_1 = iter_3_15.value

			arg_3_0.data2KeyValueList[var_3_0] = {}
			arg_3_0.data2KeyValueList[var_3_0].value = var_3_1
			arg_3_0.data2KeyValueList[var_3_0].dataMap = {}

			for iter_3_16, iter_3_17 in ipairs(iter_3_15.value_list or {}) do
				local var_3_2 = iter_3_17.key
				local var_3_3 = iter_3_17.value

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

function var_0_0.getStrData1(arg_13_0)
	return arg_13_0.str_data1
end

function var_0_0.getData3(arg_14_0)
	return arg_14_0.data3
end

function var_0_0.getData1List(arg_15_0)
	return arg_15_0.data1_list
end

function var_0_0.bindConfigTable(arg_16_0)
	return pg.activity_template
end

function var_0_0.getDataConfigTable(arg_17_0)
	local var_17_0 = arg_17_0:getConfig("type")
	local var_17_1 = arg_17_0:getConfig("config_id")

	if var_17_0 == ActivityConst.ACTIVITY_TYPE_MONOPOLY then
		return pg.activity_event_monopoly[tonumber(var_17_1)]
	elseif var_17_0 == ActivityConst.ACTIVITY_TYPE_PIZZA_PT or var_17_0 == ActivityConst.ACTIVITY_TYPE_PT_BUFF then
		return pg.activity_event_pt[tonumber(var_17_1)]
	elseif var_17_0 == ActivityConst.ACTIVITY_TYPE_VOTE then
		return pg.activity_vote[tonumber(var_17_1)]
	end
end

function var_0_0.getDataConfig(arg_18_0, arg_18_1)
	local var_18_0 = arg_18_0:getDataConfigTable()

	assert(var_18_0, "miss config : " .. arg_18_0.id)

	return var_18_0 and var_18_0[arg_18_1]
end

function var_0_0.isEnd(arg_19_0)
	return arg_19_0.stopTime > 0 and pg.TimeMgr.GetInstance():GetServerTime() >= arg_19_0.stopTime
end

function var_0_0.increaseUsedCount(arg_20_0, arg_20_1)
	if arg_20_1 == 1 then
		arg_20_0.data1 = arg_20_0.data1 + 1
	elseif arg_20_1 == 2 then
		arg_20_0.data2 = arg_20_0.data2 + 1
	end
end

function var_0_0.readyToAchieve(arg_21_0)
	local var_21_0, var_21_1 = arg_21_0:IsShowTipById()

	if var_21_0 then
		return var_21_1
	end

	var_0_0.readyToAchieveDic = var_0_0.readyToAchieveDic or {
		[ActivityConst.ACTIVITY_TYPE_CARD_PAIRS] = function(arg_22_0)
			local var_22_0 = os.difftime(pg.TimeMgr.GetInstance():GetServerTime(), arg_22_0.data3)

			return math.ceil(var_22_0 / 86400) > arg_22_0.data2 and arg_22_0.data2 < arg_22_0:getConfig("config_data")[4]
		end,
		[ActivityConst.ACTIVITY_TYPE_LEVELAWARD] = function(arg_23_0)
			local var_23_0 = getProxy(PlayerProxy):getRawData()
			local var_23_1 = pg.activity_level_award[arg_23_0:getConfig("config_id")]

			for iter_23_0 = 1, #var_23_1.front_drops do
				local var_23_2 = var_23_1.front_drops[iter_23_0][1]

				if var_23_2 <= var_23_0.level and not _.include(arg_23_0.data1_list, var_23_2) then
					return true
				end
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_STORY_AWARD] = function(arg_24_0)
			local var_24_0 = getProxy(PlayerProxy):getRawData()
			local var_24_1 = pg.activity_event_chapter_award[arg_24_0:getConfig("config_id")]

			for iter_24_0 = 1, #var_24_1.chapter do
				local var_24_2 = var_24_1.chapter[iter_24_0]

				if getProxy(ChapterProxy):isClear(var_24_2) and not _.include(arg_24_0.data1_list, var_24_2) then
					return true
				end
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_TASKS] = function(arg_25_0)
			local var_25_0 = getProxy(TaskProxy)
			local var_25_1 = _.flatten(arg_25_0:getConfig("config_data"))

			if _.any(var_25_1, function(arg_26_0)
				local var_26_0 = var_25_0:getTaskById(arg_26_0)

				return var_26_0 and var_26_0:isFinish() and not var_26_0:isReceive()
			end) then
				return true
			end

			local var_25_2 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_WORLDINPICTURE)

			if var_25_2 and not var_25_2:isEnd() and var_25_2:getConfig("config_client").linkActID == arg_25_0.id and var_25_2:readyToAchieve() then
				return true
			end

			if arg_25_0:getConfig("config_client") and arg_25_0:getConfig("config_client").decodeGameId then
				local var_25_3 = arg_25_0:getConfig("config_client").decodeGameId
				local var_25_4 = getProxy(MiniGameProxy):GetHubByGameId(var_25_3)

				if var_25_4 then
					local var_25_5 = arg_25_0:getConfig("config_data")
					local var_25_6 = var_25_5[#var_25_5]
					local var_25_7 = _.all(var_25_6, function(arg_27_0)
						return getProxy(TaskProxy):getFinishTaskById(arg_27_0) ~= nil
					end)

					if var_25_4.ultimate <= 0 and var_25_7 then
						return true
					end
				end
			end

			if arg_25_0:getConfig("config_client") and arg_25_0:getConfig("config_client").linkTaskPoolAct then
				local var_25_8 = arg_25_0:getConfig("config_client").linkTaskPoolAct
				local var_25_9 = getProxy(ActivityProxy):getActivityById(var_25_8)

				if var_25_9 and var_25_9:readyToAchieve() then
					return true
				end
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_TASK_LIST] = function(...)
			return var_0_0.readyToAchieveDic[ActivityConst.ACTIVITY_TYPE_TASKS](...)
		end,
		[ActivityConst.ACTIVITY_TYPE_HITMONSTERNIAN] = function(arg_29_0)
			local var_29_0 = arg_29_0:GetCountForHitMonster()

			return not (arg_29_0:GetDataConfig("hp") <= arg_29_0.data3) and var_29_0 > 0
		end,
		[ActivityConst.ACTIVITY_TYPE_DODGEM] = function(arg_30_0)
			local var_30_0 = pg.TimeMgr.GetInstance()
			local var_30_1 = var_30_0:DiffDay(arg_30_0.data1, var_30_0:GetServerTime()) + 1
			local var_30_2 = arg_30_0:getConfig("config_id")

			if var_30_2 == 1 then
				return arg_30_0.data4 == 0 and arg_30_0.data2 >= 7 or defaultValue(arg_30_0.data2_list[1], 0) > 0 or defaultValue(arg_30_0.data2_list[2], 0) > 0 or arg_30_0.data2 < math.min(var_30_1, 7) or var_30_1 > arg_30_0.data3
			elseif var_30_2 == 2 then
				return arg_30_0.data4 == 0 and arg_30_0.data2 >= 7 or defaultValue(arg_30_0.data2_list[1], 0) > 0 or defaultValue(arg_30_0.data2_list[2], 0) > 0 or arg_30_0.data2 < math.min(var_30_1, 7)
			end
		end,
		[ActivityConst.ACTIVITY_TYPE_MONOPOLY] = function(arg_31_0)
			local var_31_0 = arg_31_0.data1
			local var_31_1 = arg_31_0.data1_list[1]
			local var_31_2 = arg_31_0.data1_list[2]
			local var_31_3 = arg_31_0.data2_list[1]
			local var_31_4 = arg_31_0.data2_list[2]
			local var_31_5 = pg.TimeMgr.GetInstance():GetServerTime()
			local var_31_6 = math.ceil((var_31_5 - var_31_0) / 86400) * arg_31_0:getDataConfig("daily_time") + var_31_1 - var_31_2
			local var_31_7 = var_31_3 - var_31_4

			return var_31_6 > 0
		end,
		[ActivityConst.ACTIVITY_TYPE_PIZZA_PT] = function(arg_32_0)
			local var_32_0 = ActivityPtData.New(arg_32_0):CanGetAward()
			local var_32_1 = true

			if arg_32_0:getConfig("config_client") then
				local var_32_2 = arg_32_0:getConfig("config_client").task_act_id

				if var_32_2 and var_32_2 ~= 0 and pg.activity_template[var_32_2] then
					local var_32_3 = pg.activity_template[var_32_2]
					local var_32_4 = _.flatten(var_32_3.config_data)

					if var_32_4 and #var_32_4 > 0 then
						local var_32_5 = getProxy(TaskProxy)

						for iter_32_0 = 1, #var_32_4 do
							local var_32_6 = var_32_5:getTaskById(var_32_4[iter_32_0])

							if var_32_6 and var_32_6:isFinish() then
								return true
							end
						end
					end
				end
			end

			local var_32_7 = false
			local var_32_8 = arg_32_0:getConfig("config_client").fireworkActID

			if var_32_8 and var_32_8 ~= 0 then
				local var_32_9 = getProxy(ActivityProxy):getActivityById(var_32_8)

				var_32_7 = var_32_9 and var_32_9:readyToAchieve() or false
			end

			local var_32_10 = arg_32_0:getConfig("config_client")[2]
			local var_32_11 = type(var_32_10) == "number" and ManualSignActivity.IsManualSignActAndAnyAwardCanGet(var_32_10)

			return var_32_0 and var_32_1 or var_32_7 or var_32_11
		end,
		[ActivityConst.ACTIVITY_TYPE_PT_BUFF] = function(...)
			return var_0_0.readyToAchieveDic[ActivityConst.ACTIVITY_TYPE_PIZZA_PT](...)
		end,
		[ActivityConst.ACTIVITY_TYPE_RETURN_AWARD] = function(arg_34_0)
			local var_34_0 = arg_34_0.data1

			if var_34_0 == 1 then
				local var_34_1 = pg.activity_template_headhunting[arg_34_0.id]
				local var_34_2 = var_34_1.target
				local var_34_3 = 0

				for iter_34_0, iter_34_1 in ipairs(arg_34_0:getClientList()) do
					var_34_3 = var_34_3 + iter_34_1:getPt()
				end

				local var_34_4 = 0

				for iter_34_2 = #var_34_2, 1, -1 do
					if table.contains(arg_34_0.data1_list, var_34_2[iter_34_2]) then
						var_34_4 = iter_34_2

						break
					end
				end

				local var_34_5 = var_34_1.drop_client
				local var_34_6 = math.min(var_34_4 + 1, #var_34_5)
				local var_34_7 = _.any(var_34_1.tasklist, function(arg_35_0)
					local var_35_0 = getProxy(TaskProxy):getTaskById(arg_35_0)

					return var_35_0 and var_35_0:isFinish() and not var_35_0:isReceive()
				end)

				return var_34_3 >= var_34_2[var_34_6] and var_34_4 ~= #var_34_5 or var_34_7
			elseif var_34_0 == 2 then
				local var_34_8 = getProxy(TaskProxy)
				local var_34_9 = pg.activity_template_returnner[arg_34_0.id]

				return _.any(_.flatten(var_34_9.task_list), function(arg_36_0)
					local var_36_0 = var_34_8:getTaskById(arg_36_0)

					return var_36_0 and var_36_0:isFinish()
				end)
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_MINIGAME] = function(arg_37_0)
			local var_37_0 = getProxy(MiniGameProxy):GetHubByHubId(arg_37_0:getConfig("config_id"))

			if var_37_0.count > 0 then
				return true
			end

			if var_37_0:getConfig("reward") ~= 0 and var_37_0.usedtime >= var_37_0:getConfig("reward_need") and var_37_0.ultimate == 0 then
				return true
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_TURNTABLE] = function(arg_38_0)
			local var_38_0 = pg.activity_event_turning[arg_38_0:getConfig("config_id")]
			local var_38_1 = arg_38_0.data4

			if var_38_1 ~= 0 then
				local var_38_2 = var_38_0.task_table[var_38_1]
				local var_38_3 = getProxy(TaskProxy)

				for iter_38_0, iter_38_1 in ipairs(var_38_2) do
					if (var_38_3:getTaskById(iter_38_1) or var_38_3:getFinishTaskById(iter_38_1)):getTaskStatus() == 1 then
						return true
					end
				end

				local var_38_4 = pg.TimeMgr.GetInstance():DiffDay(arg_38_0.data1, pg.TimeMgr.GetInstance():GetServerTime()) + 1

				if math.clamp(var_38_4, 1, pg.activity_event_turning[arg_38_0:getConfig("config_id")].total_num) > arg_38_0.data3 then
					for iter_38_2, iter_38_3 in ipairs(var_38_2) do
						if (var_38_3:getTaskById(iter_38_3) or var_38_3:getFinishTaskById(iter_38_3)):getTaskStatus() ~= 2 then
							return false
						end
					end

					return true
				end
			elseif var_38_1 == 0 then
				local var_38_5 = pg.TimeMgr.GetInstance():DiffDay(arg_38_0.data1, pg.TimeMgr.GetInstance():GetServerTime()) + 1

				if math.clamp(var_38_5, 1, pg.activity_event_turning[arg_38_0:getConfig("config_id")].total_num) > arg_38_0.data3 then
					return true
				end
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_LOTTERY_AWARD] = function(arg_39_0)
			return not (arg_39_0.data2 > 0)
		end,
		[ActivityConst.ACTIVITY_TYPE_SHRINE] = function(arg_40_0)
			local var_40_0 = arg_40_0:getConfig("config_client").story
			local var_40_1 = var_40_0 and #var_40_0 or 7
			local var_40_2 = pg.TimeMgr.GetInstance():DiffDay(arg_40_0.data3, pg.TimeMgr.GetInstance():GetServerTime()) + 1
			local var_40_3 = math.clamp(var_40_2, 1, var_40_1)
			local var_40_4 = pg.NewStoryMgr.GetInstance()
			local var_40_5 = math.clamp(arg_40_0.data2, 0, var_40_1)

			for iter_40_0 = 1, var_40_3 do
				local var_40_6 = var_40_0[iter_40_0][1]

				if var_40_6 and iter_40_0 <= var_40_5 and not var_40_4:IsPlayed(var_40_6) then
					return true
				end
			end

			if var_40_1 <= var_40_3 and var_40_1 <= arg_40_0.data2 and not (arg_40_0.data1 > 0) then
				return true
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_LINK_LINK] = function(arg_41_0)
			local var_41_0 = arg_41_0:getConfig("config_client")[3]
			local var_41_1 = pg.TimeMgr.GetInstance()
			local var_41_2 = var_41_1:DiffDay(arg_41_0.data3, var_41_1:GetServerTime()) + 1 - arg_41_0.data2

			return math.clamp(var_41_2, 0, #var_41_0 - arg_41_0.data2) > 0
		end,
		[ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF] = function(arg_42_0)
			local var_42_0 = arg_42_0:GetBuildingIds()

			for iter_42_0, iter_42_1 in ipairs(var_42_0) do
				local var_42_1 = arg_42_0:GetBuildingLevel(iter_42_1)
				local var_42_2 = pg.activity_event_building[iter_42_1]

				if var_42_2 and var_42_1 < #var_42_2.buff then
					local var_42_3 = var_42_2.material[var_42_1]

					if underscore.all(var_42_3, function(arg_43_0)
						local var_43_0 = arg_43_0[1]
						local var_43_1 = arg_43_0[2]
						local var_43_2 = arg_43_0[3]
						local var_43_3 = 0

						if var_43_0 == DROP_TYPE_VITEM then
							local var_43_4 = AcessWithinNull(Item.getConfigData(var_43_1), "link_id")

							assert(var_43_4 == arg_42_0.id)

							var_43_3 = arg_42_0:GetMaterialCount(var_43_1)
						elseif var_43_0 > DROP_TYPE_USE_ACTIVITY_DROP then
							local var_43_5 = AcessWithinNull(pg.activity_drop_type[var_43_0], "activity_id")

							assert(var_43_5)

							bagAct = getProxy(ActivityProxy):getActivityById(var_43_5)
							var_43_3 = bagAct:getVitemNumber(var_43_1)
						end

						return var_43_2 <= var_43_3
					end) then
						return true
					end
				end
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF_2] = function(arg_44_0, ...)
			return var_0_0.readyToAchieveDic[ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF](arg_44_0, ...) or arg_44_0:CanRequest()
		end,
		[ActivityConst.ACTIVITY_TYPE_EXPEDITION] = function(arg_45_0)
			if arg_45_0.data3 > 0 and arg_45_0.data1 ~= 0 then
				return true
			else
				for iter_45_0 = 1, #arg_45_0.data1_list do
					if not bit.band(arg_45_0.data1_list[iter_45_0], ActivityConst.EXPEDITION_TYPE_GOT) ~= 0 then
						if bit.band(arg_45_0.data1_list[iter_45_0], ActivityConst.EXPEDITION_TYPE_OPEN) ~= 0 then
							return true
						elseif bit.band(arg_45_0.data1_list[iter_45_0], ActivityConst.EXPEDITION_TYPE_BAOXIANG) ~= 0 then
							return true
						elseif bit.band(arg_45_0.data1_list[iter_45_0], ActivityConst.EXPEDITION_TYPE_BOSS) ~= 0 then
							return true
						end
					end
				end
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_CLIENT_DISPLAY] = function(arg_46_0)
			local var_46_0 = arg_46_0:getConfig("config_client")

			if var_46_0 and var_46_0.linkGameHubID then
				local var_46_1 = getProxy(MiniGameProxy):GetHubByHubId(var_46_0.linkGameHubID)

				if var_46_1 then
					if var_46_0.trimRed then
						if var_46_1.ultimate == 1 then
							return false
						end

						if var_46_1.usedtime == var_46_1:getConfig("reward_need") then
							return true
						end
					end

					return var_46_1.count > 0
				end
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_BB] = function(arg_47_0)
			return arg_47_0.data2 > 0
		end,
		[ActivityConst.ACTIVITY_TYPE_PUZZLA] = function(arg_48_0)
			local var_48_0 = arg_48_0.data1_list
			local var_48_1 = arg_48_0.data2_list
			local var_48_2 = arg_48_0:GetPicturePuzzleIds()
			local var_48_3 = arg_48_0:getConfig("config_client").linkActID

			if var_48_3 then
				local var_48_4 = getProxy(ActivityProxy):getActivityById(var_48_3)

				if var_48_4 and var_48_4:readyToAchieve() then
					return true
				end
			end

			if _.any(var_48_2, function(arg_49_0)
				local var_49_0 = table.contains(var_48_1, arg_49_0)
				local var_49_1 = table.contains(var_48_0, arg_49_0)

				return not var_49_0 and var_49_1
			end) then
				return true
			end

			local var_48_5 = pg.activity_event_picturepuzzle[arg_48_0.id]

			if var_48_5 and var_48_5.chapter > 0 and arg_48_0.data1 < 1 then
				return true
			end

			if var_48_5 and #var_48_5.auto_finish_args > 0 and arg_48_0.data1 == 1 then
				return true
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_AIRFIGHT_BATTLE] = function(arg_50_0)
			return AirFightActivity.readyToAchieve(arg_50_0)
		end,
		[ActivityConst.ACTIVITY_TYPE_WORLDINPICTURE] = function(arg_51_0)
			local var_51_0 = WorldInPictureActiviyData.New(arg_51_0)

			return not var_51_0:IsTravelAll() and var_51_0:GetTravelPoint() > 0 or var_51_0:GetDrawPoint() > 0 and var_51_0:AnyAreaCanDraw()
		end,
		[ActivityConst.ACTIVITY_TYPE_APRIL_REWARD] = function(arg_52_0)
			if arg_52_0.data1 == 0 then
				local var_52_0 = arg_52_0:getStartTime()
				local var_52_1 = pg.TimeMgr.GetInstance():GetServerTime()

				if arg_52_0:getConfig("config_client").autounlock <= var_52_1 - var_52_0 then
					return true
				end
			elseif arg_52_0.data1 ~= 0 and arg_52_0.data2 == 0 then
				return true
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_TASK_POOL] = function(arg_53_0)
			local var_53_0 = arg_53_0:getConfig("config_data")
			local var_53_1 = getProxy(TaskProxy)

			if arg_53_0.data1 >= #var_53_0 then
				return false
			end

			local var_53_2 = pg.TimeMgr.GetInstance()
			local var_53_3 = (var_53_2:DiffDay(arg_53_0:getStartTime(), var_53_2:GetServerTime()) + 1) * arg_53_0:getConfig("config_id")

			var_53_3 = var_53_3 > #var_53_0 and #var_53_0 or var_53_3

			local var_53_4 = _.any(var_53_0, function(arg_54_0)
				local var_54_0 = var_53_1:getTaskById(arg_54_0)

				return var_54_0 and var_54_0:isFinish()
			end)

			return var_53_3 - arg_53_0.data1 > 0 and var_53_4
		end,
		[ActivityConst.ACTIVITY_TYPE_EVENT] = function(arg_55_0)
			local var_55_0 = getProxy(PlayerProxy):getData().id

			return PlayerPrefs.GetInt("ACTIVITY_TYPE_EVENT_" .. arg_55_0.id .. "_" .. var_55_0) == 0
		end,
		[ActivityConst.ACTIVITY_TYPE_PT_OTHER] = function(arg_56_0)
			if arg_56_0.data2 and arg_56_0.data2 <= 0 and arg_56_0.data1 >= pg.activity_event_avatarframe[arg_56_0:getConfig("config_id")].target then
				return true
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_HOTSPRING] = function(arg_57_0)
			local var_57_0, var_57_1 = arg_57_0:GetUpgradeCost()

			if arg_57_0:GetSlotCount() < arg_57_0:GetTotalSlotCount() and var_57_1 <= arg_57_0:GetCoins() then
				return true
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_FIREWORK] = function(arg_58_0)
			local var_58_0 = arg_58_0:getConfig("config_data")[2][1]
			local var_58_1 = arg_58_0:getConfig("config_data")[2][2]
			local var_58_2 = getProxy(PlayerProxy):getRawData():getResource(var_58_0)

			if arg_58_0.data1 > 0 and var_58_1 <= var_58_2 then
				return true
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_FLOWER_FIELD] = function(arg_59_0)
			local var_59_0 = pg.TimeMgr.GetInstance()

			return var_59_0:GetServerTime() >= var_59_0:GetTimeToNextTime(math.max(arg_59_0.data1, arg_59_0.data2))
		end,
		[ActivityConst.ACTIVITY_TYPE_ISLAND] = function(arg_60_0)
			for iter_60_0, iter_60_1 in pairs(getProxy(IslandProxy):GetNodeDic()) do
				if iter_60_1:IsVisual() and iter_60_1:RedDotHint() then
					return true
				end
			end

			return false
		end,
		[ActivityConst.ACTIVITY_TYPE_HOTSPRING_2] = function(arg_61_0)
			return Spring2Activity.readyToAchieve(arg_61_0)
		end,
		[ActivityConst.ACTIVITY_TYPE_CARD_PUZZLE] = function(arg_62_0)
			local var_62_0 = #arg_62_0.data2_list
			local var_62_1 = arg_62_0:getData1List()
			local var_62_2 = arg_62_0:getConfig("config_data")[2]

			if #var_62_1 == #var_62_2 then
				return false
			end

			local function var_62_3()
				for iter_63_0, iter_63_1 in ipairs(var_62_2) do
					if not table.contains(var_62_1, iter_63_1[1]) and var_62_0 >= iter_63_1[1] then
						return true
					end
				end

				return false
			end

			local function var_62_4()
				local var_64_0 = getProxy(PlayerProxy):getData().id

				return PlayerPrefs.GetInt("DAY_TIP_" .. arg_62_0.id .. "_" .. var_64_0 .. "_" .. arg_62_0:getDayIndex()) == 0
			end

			return var_62_3() or var_62_4()
		end,
		[ActivityConst.ACTIVITY_TYPE_SURVEY] = function(arg_65_0)
			local var_65_0, var_65_1 = getProxy(ActivityProxy):isSurveyOpen()
			local var_65_2 = getProxy(ActivityProxy):isSurveyDone()

			return var_65_0 and not var_65_2 and not SurveyPage.IsEverEnter(var_65_1)
		end,
		[ActivityConst.ACTIVITY_TYPE_ZUMA] = function(arg_66_0)
			return LaunchBallActivityMgr.GetInvitationAble(arg_66_0.id)
		end,
		[ActivityConst.ACTIVITY_TYPE_GIFT_UP] = function(arg_67_0)
			local var_67_0 = arg_67_0:getConfig("config_client").gifts[2]
			local var_67_1 = math.min(#var_67_0, arg_67_0:getNDay())

			return underscore(var_67_0):chain():first(var_67_1):any(function(arg_68_0)
				local var_68_0 = getProxy(ShopsProxy):GetGiftCommodity(arg_68_0, Goods.TYPE_GIFT_PACKAGE)

				return var_68_0:canPurchase() and var_68_0:inTime() and not var_68_0:IsGroupLimit()
			end):value()
		end,
		[ActivityConst.ACTIVITY_TYPE_UR_EXCHANGE] = function(arg_69_0)
			if getProxy(ShopsProxy):getActivityShops() == nil then
				return false
			end

			local var_69_0 = arg_69_0:getConfig("config_client")
			local var_69_1 = getProxy(PlayerProxy):getData():getResource(var_69_0.uPtId)
			local var_69_2 = #var_69_0.goodsId + 1
			local var_69_3 = var_69_2 - _.reduce(var_69_0.goodsId, 0, function(arg_70_0, arg_70_1)
				return arg_70_0 + getProxy(ShopsProxy):getActivityShopById(var_69_0.shopId):GetCommodityById(arg_70_1):GetPurchasableCnt()
			end)
			local var_69_4 = var_69_3 < var_69_2 and pg.activity_shop_template[var_69_0.goodsId[var_69_3]] or nil

			return var_69_3 < var_69_2 and var_69_1 >= var_69_4.resource_num
		end
	}

	return switch(arg_21_0:getConfig("type"), var_0_0.readyToAchieveDic, nil, arg_21_0)
end

function var_0_0.IsShowTipById(arg_71_0)
	var_0_0.ShowTipTableById = var_0_0.ShowTipTableById or {
		[ActivityConst.ACTIVITY_ID_US_SKIRMISH_RE] = function()
			local var_72_0 = getProxy(SkirmishProxy)

			var_72_0:UpdateSkirmishProgress()

			local var_72_1 = var_72_0:getRawData()
			local var_72_2 = 0
			local var_72_3 = 0

			for iter_72_0, iter_72_1 in ipairs(var_72_1) do
				local var_72_4 = iter_72_1:GetState()

				var_72_2 = var_72_4 > SkirmishVO.StateInactive and var_72_2 + 1 or var_72_2
				var_72_3 = var_72_4 == SkirmishVO.StateClear and var_72_3 + 1 or var_72_3
			end

			return var_72_3 < var_72_2
		end,
		[ActivityConst.POCKY_SKIN_LOGIN] = function()
			local var_73_0 = arg_71_0:getConfig("config_client").linkids
			local var_73_1 = getProxy(TaskProxy)
			local var_73_2 = getProxy(ActivityProxy)
			local var_73_3 = var_73_2:getActivityById(var_73_0[1])
			local var_73_4 = var_73_2:getActivityById(var_73_0[2])
			local var_73_5 = var_73_2:getActivityById(var_73_0[3])

			assert(var_73_3 and var_73_4 and var_73_5)

			local function var_73_6()
				return var_73_3 and var_73_3:readyToAchieve()
			end

			local function var_73_7()
				return var_73_4 and var_73_4:readyToAchieve()
			end

			local function var_73_8()
				local var_76_0 = _.flatten(arg_71_0:getConfig("config_data"))

				for iter_76_0 = 1, math.min(#var_76_0, var_73_4.data3) do
					local var_76_1 = var_76_0[iter_76_0]
					local var_76_2 = var_73_1:getTaskById(var_76_1)

					if var_76_2 and var_76_2:isFinish() and not var_76_2:isReceive() then
						return true
					end
				end
			end

			local function var_73_9()
				if not (var_73_5 and var_73_5:readyToAchieve()) or not var_73_3 then
					return false
				end

				local var_77_0 = ActivityPtData.New(var_73_3)

				return var_77_0.level >= #var_77_0.targets
			end

			return var_73_8() or var_73_6() or var_73_7() or var_73_9()
		end,
		[ActivityConst.TOWERCLIMBING_SIGN] = function()
			local var_78_0 = getProxy(MiniGameProxy):GetHubByHubId(9)
			local var_78_1 = var_78_0.ultimate
			local var_78_2 = var_78_0:getConfig("reward_need")
			local var_78_3 = var_78_0.usedtime

			return var_78_1 == 0 and var_78_2 <= var_78_3
		end,
		[pg.activity_const.NEWYEAR_SNACK_PAGE_ID.act_id] = NewYearSnackPage.IsTip,
		[ActivityConst.WWF_TASK_ID] = WWFPtPage.IsShowRed,
		[ActivityConst.NEWMEIXIV4_SKIRMISH_ID] = NewMeixiV4SkirmishPage.IsShowRed,
		[ActivityConst.JIUJIU_YOYO_ID] = JiujiuYoyoPage.IsShowRed,
		[ActivityConst.SENRANKAGURA_TRAIN_ACT_ID] = SenrankaguraTrainScene.IsShowRed,
		[ActivityConst.DORM_SIGN_ID] = DormSignPage.IsShowRed,
		[ActivityConst.GOASTSTORYACTIVITY_ID] = GhostSkinPageLayer.IsShowRed
	}

	local var_71_0 = var_0_0.ShowTipTableById[arg_71_0.id]

	return tobool(var_71_0), var_71_0 and var_71_0()
end

function var_0_0.isShow(arg_79_0)
	local var_79_0 = arg_79_0:getConfig("page_info")

	if arg_79_0:getConfig("is_show") <= 0 then
		return false
	elseif underscore.any({
		var_79_0.ui_name,
		var_79_0.ui_name2
	}, function(arg_80_0)
		return not checkABExist(string.format("ui/%s", arg_80_0))
	end) then
		warning(string.format("activity:%d without ui:%s", arg_79_0.id, table.concat({
			var_79_0.ui_name,
			var_79_0.ui_name2
		}, " or ")))

		return false
	end

	if arg_79_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_RETURN_AWARD then
		return arg_79_0.data1 ~= 0
	elseif arg_79_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_CLIENT_DISPLAY then
		local var_79_1 = arg_79_0:getConfig("config_client").display_link

		if var_79_1 then
			return underscore.any(var_79_1, function(arg_81_0)
				return arg_81_0[2] == 0 or pg.TimeMgr.GetInstance():inTime(pg.shop_template[arg_81_0[2]].time)
			end)
		end
	elseif arg_79_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_SURVEY then
		local var_79_2 = getProxy(ActivityProxy)
		local var_79_3 = var_79_2:isSurveyOpen()
		local var_79_4 = var_79_2:isSurveyDone()

		return var_79_3 and not var_79_4
	elseif arg_79_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_UR_EXCHANGE then
		if getProxy(ShopsProxy):getActivityShops() == nil then
			return false
		end

		local var_79_5 = arg_79_0:getConfig("config_client")
		local var_79_6 = getProxy(PlayerProxy):getData():getResource(var_79_5.uPtId)
		local var_79_7 = #var_79_5.goodsId + 1

		return var_79_7 > var_79_7 - _.reduce(var_79_5.goodsId, 0, function(arg_82_0, arg_82_1)
			return arg_82_0 + getProxy(ShopsProxy):getActivityShopById(var_79_5.shopId):GetCommodityById(arg_82_1):GetPurchasableCnt()
		end)
	elseif arg_79_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_TASK_RYZA and table.contains({
		ActivityConst.DORM_SIGN_ID
	}, arg_79_0:getConfig("id")) then
		return #getProxy(ActivityProxy):getActivityById(arg_79_0:getConfig("id")):getConfig("config_data") ~= #getProxy(ActivityTaskProxy):getFinishTaskById(arg_79_0:getConfig("id"))
	end

	return true
end

function var_0_0.isAfterShow(arg_83_0)
	if arg_83_0.configId == ActivityConst.UR_TASK_ACT_ID or arg_83_0.configId == ActivityConst.SPECIAL_WEAPON_ACT_ID then
		local var_83_0 = getProxy(TaskProxy)

		return underscore.all(arg_83_0:getConfig("config_data")[1], function(arg_84_0)
			local var_84_0 = var_83_0:getTaskVO(arg_84_0)

			return var_84_0 and var_84_0:isReceive()
		end)
	end

	return false
end

function var_0_0.getShowPriority(arg_85_0)
	return arg_85_0:getConfig("is_show")
end

function var_0_0.left4Day(arg_86_0)
	if arg_86_0.stopTime - pg.TimeMgr.GetInstance():GetServerTime() < 345600 then
		return true
	end

	return false
end

function var_0_0.getAwardInfos(arg_87_0)
	return arg_87_0.data1KeyValueList or {}
end

function var_0_0.updateData(arg_88_0, arg_88_1, arg_88_2)
	if arg_88_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_LOTTERY then
		if not arg_88_0:getAwardInfos()[arg_88_1] then
			arg_88_0.data1KeyValueList[arg_88_1] = {}
		end

		for iter_88_0, iter_88_1 in ipairs(arg_88_2) do
			if arg_88_0.data1KeyValueList[arg_88_1][iter_88_1] then
				arg_88_0.data1KeyValueList[arg_88_1][iter_88_1] = arg_88_0.data1KeyValueList[arg_88_1][iter_88_1] + 1
			else
				arg_88_0.data1KeyValueList[arg_88_1][iter_88_1] = 1
			end
		end
	end
end

function var_0_0.getTaskShip(arg_89_0)
	return arg_89_0:getConfig("config_client")[1]
end

function var_0_0.getNotificationMsg(arg_90_0)
	local var_90_0 = arg_90_0:getConfig("type")
	local var_90_1 = ActivityProxy.ACTIVITY_SHOW_AWARDS

	if var_90_0 == ActivityConst.ACTIVITY_TYPE_SHOP then
		var_90_1 = ActivityProxy.ACTIVITY_SHOP_SHOW_AWARDS
	elseif var_90_0 == ActivityConst.ACTIVITY_TYPE_LOTTERY then
		var_90_1 = ActivityProxy.ACTIVITY_LOTTERY_SHOW_AWARDS
	elseif var_90_0 == ActivityConst.ACTIVITY_TYPE_REFLUX then
		var_90_1 = ActivityProxy.ACTIVITY_SHOW_REFLUX_AWARDS
	elseif var_90_0 == ActivityConst.ACTIVITY_TYPE_RED_PACKETS or var_90_0 == ActivityConst.ACTIVITY_TYPE_RED_PACKET_LOTTER then
		var_90_1 = ActivityProxy.ACTIVITY_SHOW_RED_PACKET_AWARDS
	end

	return var_90_1
end

function var_0_0.getDayIndex(arg_91_0)
	local var_91_0 = arg_91_0:getStartTime()
	local var_91_1 = pg.TimeMgr.GetInstance()
	local var_91_2 = var_91_1:GetServerTime()

	return var_91_1:DiffDay(var_91_0, var_91_2) + 1
end

function var_0_0.getStartTime(arg_92_0)
	local var_92_0, var_92_1 = parseTimeConfig(arg_92_0:getConfig("time"))

	if var_92_1 and var_92_1[1] == "newuser" then
		return arg_92_0.stopTime - var_92_1[3] * 86400
	else
		return pg.TimeMgr.GetInstance():parseTimeFromConfig(var_92_0[2])
	end
end

function var_0_0.getNDay(arg_93_0, arg_93_1)
	arg_93_1 = arg_93_1 or arg_93_0:getStartTime()

	local var_93_0 = pg.TimeMgr.GetInstance()

	return var_93_0:DiffDay(arg_93_1, var_93_0:GetServerTime()) + 1
end

function var_0_0.isVariableTime(arg_94_0)
	local var_94_0, var_94_1 = parseTimeConfig(arg_94_0:getConfig("time"))

	return var_94_1 and var_94_1[1] == "newuser"
end

function var_0_0.setSpecialData(arg_95_0, arg_95_1, arg_95_2)
	arg_95_0.speciaData = arg_95_0.speciaData and arg_95_0.speciaData or {}
	arg_95_0.speciaData[arg_95_1] = arg_95_2
end

function var_0_0.getSpecialData(arg_96_0, arg_96_1)
	return arg_96_0.speciaData and arg_96_0.speciaData[arg_96_1] and arg_96_0.speciaData[arg_96_1] or nil
end

function var_0_0.canPermanentFinish(arg_97_0)
	local var_97_0 = arg_97_0:getConfig("type")

	if var_97_0 == ActivityConst.ACTIVITY_TYPE_TASK_LIST then
		local var_97_1 = arg_97_0:getConfig("config_data")
		local var_97_2 = getProxy(TaskProxy)

		return underscore.all(underscore.flatten({
			var_97_1[#var_97_1]
		}), function(arg_98_0)
			return var_97_2:getFinishTaskById(arg_98_0) ~= nil
		end)
	elseif var_97_0 == ActivityConst.ACTIVITY_TYPE_PT_BUFF then
		local var_97_3 = ActivityPtData.New(arg_97_0)

		return var_97_3.level >= #var_97_3.targets
	end

	return false
end

function var_0_0.GetShopTime(arg_99_0)
	local var_99_0 = pg.TimeMgr.GetInstance()
	local var_99_1 = arg_99_0:getStartTime()
	local var_99_2 = arg_99_0.stopTime

	return var_99_0:STimeDescS(var_99_1, "%y.%m.%d") .. " - " .. var_99_0:STimeDescS(var_99_2, "%y.%m.%d")
end

function var_0_0.GetCrusingUnreceiveAward(arg_100_0)
	assert(arg_100_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_PT_CRUSING, "type error")

	local var_100_0 = pg.battlepass_event_pt[arg_100_0.id]
	local var_100_1 = {}
	local var_100_2 = {}

	for iter_100_0, iter_100_1 in ipairs(arg_100_0.data1_list) do
		var_100_2[iter_100_1] = true
	end

	for iter_100_2, iter_100_3 in ipairs(var_100_0.target) do
		if iter_100_3 > arg_100_0.data1 then
			break
		elseif not var_100_2[iter_100_3] then
			table.insert(var_100_1, Drop.Create(pg.battlepass_event_award[var_100_0.award[iter_100_2]].drop_client))
		end
	end

	if arg_100_0.data2 ~= 1 then
		return PlayerConst.MergePassItemDrop(var_100_1)
	end

	local var_100_3 = {}

	for iter_100_4, iter_100_5 in ipairs(arg_100_0.data2_list) do
		var_100_3[iter_100_5] = true
	end

	for iter_100_6, iter_100_7 in ipairs(var_100_0.target) do
		if iter_100_7 > arg_100_0.data1 then
			break
		elseif not var_100_3[iter_100_7] then
			table.insert(var_100_1, Drop.Create(pg.battlepass_event_award[var_100_0.award_pay[iter_100_6]].drop_client))
		end
	end

	return PlayerConst.MergePassItemDrop(var_100_1)
end

function var_0_0.GetCrusingInfo(arg_101_0)
	assert(arg_101_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_PT_CRUSING, "type error")

	local var_101_0 = pg.battlepass_event_pt[arg_101_0.id]
	local var_101_1 = var_101_0.pt
	local var_101_2 = {}
	local var_101_3 = {}

	for iter_101_0, iter_101_1 in ipairs(var_101_0.key_point_display) do
		var_101_3[iter_101_1] = true
	end

	for iter_101_2, iter_101_3 in ipairs(var_101_0.target) do
		table.insert(var_101_2, {
			id = iter_101_2,
			pt = iter_101_3,
			award = pg.battlepass_event_award[var_101_0.award[iter_101_2]].drop_client,
			award_pay = pg.battlepass_event_award[var_101_0.award_pay[iter_101_2]].drop_client,
			isImportent = var_101_3[iter_101_2]
		})
	end

	local var_101_4 = arg_101_0.data1
	local var_101_5 = arg_101_0.data2 == 1
	local var_101_6 = {}

	for iter_101_4, iter_101_5 in ipairs(arg_101_0.data1_list) do
		var_101_6[iter_101_5] = true
	end

	local var_101_7 = {}

	for iter_101_6, iter_101_7 in ipairs(arg_101_0.data2_list) do
		var_101_7[iter_101_7] = true
	end

	local var_101_8 = 0

	for iter_101_8, iter_101_9 in ipairs(var_101_2) do
		if var_101_4 < iter_101_9.pt then
			break
		else
			var_101_8 = iter_101_8
		end
	end

	return {
		ptId = var_101_1,
		awardList = var_101_2,
		pt = var_101_4,
		isPay = var_101_5,
		awardDic = var_101_6,
		awardPayDic = var_101_7,
		phase = var_101_8
	}
end

function var_0_0.IsActivityReady(arg_102_0)
	return arg_102_0 and not arg_102_0:isEnd() and arg_102_0:readyToAchieve()
end

return var_0_0
