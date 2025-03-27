local var_0_0 = class("ActivityProxy", import(".NetProxy"))

var_0_0.ACTIVITY_ADDED = "ActivityProxy ACTIVITY_ADDED"
var_0_0.ACTIVITY_UPDATED = "ActivityProxy ACTIVITY_UPDATED"
var_0_0.ACTIVITY_DELETED = "ActivityProxy ACTIVITY_DELETED"
var_0_0.ACTIVITY_END = "ActivityProxy ACTIVITY_END"
var_0_0.ACTIVITY_OPERATION_DONE = "ActivityProxy ACTIVITY_OPERATION_DONE"
var_0_0.ACTIVITY_SHOW_AWARDS = "ActivityProxy ACTIVITY_SHOW_AWARDS"
var_0_0.ACTIVITY_SHOP_SHOW_AWARDS = "ActivityProxy ACTIVITY_SHOP_SHOW_AWARDS"
var_0_0.ACTIVITY_SHOW_BB_RESULT = "ActivityProxy ACTIVITY_SHOW_BB_RESULT"
var_0_0.ACTIVITY_LOTTERY_SHOW_AWARDS = "ActivityProxy ACTIVITY_LOTTERY_SHOW_AWARDS"
var_0_0.ACTIVITY_HITMONSTER_SHOW_AWARDS = "ActivityProxy ACTIVITY_HITMONSTER_SHOW_AWARDS"
var_0_0.ACTIVITY_SHOW_REFLUX_AWARDS = "ActivityProxy ACTIVITY_SHOW_REFLUX_AWARDS"
var_0_0.ACTIVITY_OPERATION_ERRO = "ActivityProxy ACTIVITY_OPERATION_ERRO"
var_0_0.ACTIVITY_SHOW_LOTTERY_AWARD_RESULT = "ActivityProxy ACTIVITY_SHOW_LOTTERY_AWARD_RESULT"
var_0_0.ACTIVITY_SHOW_RED_PACKET_AWARDS = "ActivityProxy ACTIVITY_SHOW_RED_PACKET_AWARDS"
var_0_0.ACTIVITY_SHOW_SHAKE_BEADS_RESULT = "ActivityProxy ACTIVITY_SHOW_SHAKE_BEADS_RESULT"
var_0_0.ACTIVITY_PT_ID = 110

function var_0_0.register(arg_1_0)
	arg_1_0:on(11200, function(arg_2_0)
		arg_1_0.data = {}
		arg_1_0.params = {}
		arg_1_0.hxList = {}
		arg_1_0.buffActs = {}
		arg_1_0.stopList = {}

		if arg_2_0.hx_list then
			for iter_2_0, iter_2_1 in ipairs(arg_2_0.hx_list) do
				table.insert(arg_1_0.hxList, iter_2_1)
			end
		end

		for iter_2_2, iter_2_3 in ipairs(arg_2_0.activity_list) do
			if not pg.activity_template[iter_2_3.id] then
				Debugger.LogError("活动acvitity_template不存在: " .. iter_2_3.id)
			else
				local var_2_0 = Activity.Create(iter_2_3)
				local var_2_1 = var_2_0:getConfig("type")

				if var_2_1 == ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2 then
					if var_2_0:checkBattleTimeInBossAct() then
						arg_1_0:InitActtivityFleet(var_2_0, iter_2_3)
					end
				elseif var_2_1 == ActivityConst.ACTIVITY_TYPE_CHALLENGE then
					arg_1_0:InitActtivityFleet(var_2_0, iter_2_3)
				elseif var_2_1 == ActivityConst.ACTIVITY_TYPE_PARAMETER then
					arg_1_0:addActivityParameter(var_2_0)
				elseif var_2_1 == ActivityConst.ACTIVITY_TYPE_BUFF then
					table.insert(arg_1_0.buffActs, var_2_0.id)
				elseif var_2_1 == ActivityConst.ACTIVITY_TYPE_BOSSRUSH then
					arg_1_0:InitActtivityFleet(var_2_0, iter_2_3)
				elseif var_2_1 == ActivityConst.ACTIVITY_TYPE_BOSSSINGLE then
					arg_1_0:InitActtivityFleet(var_2_0, iter_2_3)
				elseif var_2_1 == ActivityConst.ACTIVITY_TYPE_BOSSSINGLE_VARIABLE then
					arg_1_0:InitActtivityFleet(var_2_0, iter_2_3)
				elseif var_2_1 == ActivityConst.ACTIVITY_TYPE_EVENT_SINGLE then
					arg_1_0:CheckDailyEventRequest(var_2_0)
				end

				arg_1_0.data[iter_2_3.id] = var_2_0
			end
		end

		arg_1_0:refreshActivityBuffs()

		for iter_2_4, iter_2_5 in pairs(arg_1_0.data) do
			arg_1_0:sendNotification(GAME.ACTIVITY_BE_UPDATED, {
				isInit = true,
				activity = iter_2_5
			})
		end

		local var_2_2 = arg_1_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_CHALLENGE)

		if var_2_2 and not var_2_2:isEnd() then
			arg_1_0:sendNotification(GAME.CHALLENGE2_INFO, {})
		end

		local var_2_3 = arg_1_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_TASK_LIST_MONITOR)

		if var_2_3 and not var_2_3:isEnd() and var_2_3.data1 == 0 then
			arg_1_0:monitorTaskList(var_2_3)
		end

		local var_2_4 = arg_1_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2)

		if var_2_4 and not var_2_4:isEnd() then
			local var_2_5 = arg_1_0.data[var_2_4.id]

			arg_1_0:InitActivityBossData(var_2_5)
		end

		pg.ShipFlagMgr.GetInstance():UpdateFlagShips("inElite")
		;(function()
			local var_3_0 = arg_1_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_ATELIER_LINK)

			if not var_3_0 then
				return
			end

			arg_1_0:sendNotification(GAME.REQUEST_ATELIER, var_3_0.id)
		end)()
	end)
	arg_1_0:on(11201, function(arg_4_0)
		local var_4_0 = Activity.Create(arg_4_0.activity_info)

		assert(var_4_0.id, "should exist activity")

		local var_4_1 = var_4_0:getConfig("type")

		if var_4_1 == ActivityConst.ACTIVITY_TYPE_PARAMETER then
			arg_1_0:addActivityParameter(var_4_0)
		end

		if not arg_1_0.data[var_4_0.id] then
			arg_1_0:addActivity(var_4_0)
		else
			arg_1_0:updateActivity(var_4_0)
		end

		if var_4_1 == ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2 then
			arg_1_0:InitActtivityFleet(var_4_0, arg_4_0.activity_info)
			arg_1_0:InitActivityBossData(var_4_0)
		end

		arg_1_0:sendNotification(GAME.ACTIVITY_BE_UPDATED, {
			activity = var_4_0
		})
	end)
	arg_1_0:on(40009, function(arg_5_0)
		local var_5_0 = arg_1_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSSRUSH)
		local var_5_1

		if var_5_0 then
			var_5_1 = var_5_0:GetSeriesData()
		end

		local var_5_2 = BossRushSettlementCommand.ConcludeEXP(arg_5_0, var_5_0, var_5_1 and var_5_1:GetBattleStatistics())

		;(function()
			arg_1_0:GetBossRushRuntime(var_5_0.id).settlementData = var_5_2
		end)()
	end)
	arg_1_0:on(24100, function(arg_7_0)
		(function()
			local var_8_0 = arg_1_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_EXTRA_BOSSRUSH_RANK)

			if not var_8_0 then
				return
			end

			var_8_0:Record(arg_7_0.score)
			arg_1_0:updateActivity(var_8_0)
		end)()

		local var_7_0 = arg_1_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSSRUSH)

		if not var_7_0 then
			return
		end

		local var_7_1 = var_7_0:GetSeriesData()

		if not var_7_1 then
			return
		end

		var_7_1:AddEXScore(arg_7_0)
		arg_1_0:updateActivity(var_7_0)
	end)
	arg_1_0:on(11028, function(arg_9_0)
		print("接受到问卷状态", arg_9_0.result)

		if arg_9_0.result == 0 then
			arg_1_0:setSurveyState(arg_9_0.result)
		elseif arg_9_0.result > 0 then
			arg_1_0:setSurveyState(arg_9_0.result)
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("", arg_9_0.result))
		end
	end)
	arg_1_0:on(26033, function(arg_10_0)
		local var_10_0 = arg_1_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2)

		if not var_10_0 then
			return
		end

		local var_10_1 = arg_10_0.point
		local var_10_2 = var_10_0:UpdateHighestScore(var_10_1)

		arg_1_0:GetActivityBossRuntime(var_10_0.id).spScore = {
			score = var_10_1,
			new = var_10_2
		}

		arg_1_0:updateActivity(var_10_0)
	end)

	arg_1_0.requestTime = {}
	arg_1_0.extraDatas = {}
end

function var_0_0.timeCall(arg_11_0)
	return {
		[ProxyRegister.DayCall] = function(arg_12_0)
			for iter_12_0, iter_12_1 in pairs(arg_11_0.data) do
				if not iter_12_1:isEnd() then
					switch(iter_12_1:getConfig("type"), {
						[ActivityConst.ACTIVITY_TYPE_7DAYSLOGIN] = function()
							iter_12_1.autoActionForbidden = false

							arg_11_0:updateActivity(iter_12_1)
						end,
						[ActivityConst.ACTIVITY_TYPE_PROGRESSLOGIN] = function()
							iter_12_1.autoActionForbidden = false

							arg_11_0:updateActivity(iter_12_1)
						end,
						[ActivityConst.ACTIVITY_TYPE_MONTHSIGN] = function()
							iter_12_1.autoActionForbidden = false

							arg_11_0:updateActivity(iter_12_1)
						end,
						[ActivityConst.ACTIVITY_TYPE_REFLUX] = function()
							iter_12_1.data1KeyValueList = {
								{}
							}
							iter_12_1.autoActionForbidden = false

							arg_11_0:updateActivity(iter_12_1)
						end,
						[ActivityConst.ACTIVITY_TYPE_HITMONSTERNIAN] = function()
							iter_12_1.autoActionForbidden = false

							arg_11_0:updateActivity(iter_12_1)
						end,
						[ActivityConst.ACTIVITY_TYPE_BB] = function()
							iter_12_1.data2 = 0
							iter_12_1.autoActionForbidden = false

							arg_11_0:updateActivity(iter_12_1)
						end,
						[ActivityConst.ACTIVITY_TYPE_LOTTERY_AWARD] = function()
							iter_12_1.data2 = 0
							iter_12_1.autoActionForbidden = false

							arg_11_0:updateActivity(iter_12_1)
						end,
						[ActivityConst.ACTIVITY_TYPE_BOSSRUSH] = function()
							local var_20_0 = iter_12_1:GetUsedBonus()

							table.Foreach(var_20_0, function(arg_21_0, arg_21_1)
								var_20_0[arg_21_0] = 0
							end)
							arg_11_0:updateActivity(iter_12_1)
						end,
						[ActivityConst.ACTIVITY_TYPE_BOSSSINGLE] = function()
							local var_22_0 = iter_12_1:GetDailyCounts()

							table.Foreach(var_22_0, function(arg_23_0, arg_23_1)
								var_22_0[arg_23_0] = 0
							end)
							arg_11_0:updateActivity(iter_12_1)
						end,
						[ActivityConst.ACTIVITY_TYPE_BOSSSINGLE_VARIABLE] = function()
							arg_11_0:updateActivity(iter_12_1)
						end,
						[ActivityConst.ACTIVITY_TYPE_MANUAL_SIGN] = function()
							arg_11_0:sendNotification(GAME.ACT_MANUAL_SIGN, {
								activity_id = iter_12_1.id,
								cmd = ManualSignActivity.OP_SIGN
							})
						end,
						[ActivityConst.ACTIVITY_TYPE_TURNTABLE] = function()
							local var_26_0 = iter_12_1:getConfig("config_id")
							local var_26_1 = pg.activity_event_turning[var_26_0]

							if var_26_1.total_num <= iter_12_1.data3 then
								return
							end

							local var_26_2 = var_26_1.task_table[iter_12_1.data4]

							if not var_26_2 then
								return
							end

							local var_26_3 = getProxy(TaskProxy)

							for iter_26_0, iter_26_1 in ipairs(var_26_2) do
								if (var_26_3:getTaskById(iter_26_1) or var_26_3:getFinishTaskById(iter_26_1)):getTaskStatus() ~= 2 then
									return
								end
							end

							arg_11_0:sendNotification(GAME.ACTIVITY_OPERATION, {
								cmd = 2,
								activity_id = iter_12_1.id
							})
						end,
						[ActivityConst.ACTIVITY_TYPE_MONOPOLY] = function()
							arg_11_0:updateActivity(iter_12_1)
						end,
						[ActivityConst.ACTIVITY_TYPE_CHALLENGE] = function()
							arg_11_0:sendNotification(GAME.CHALLENGE2_INFO, {})
						end,
						[ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2] = function()
							local var_29_0 = iter_12_1.data1KeyValueList[1]
							local var_29_1 = pg.activity_event_worldboss[iter_12_1:getConfig("config_id")]

							if var_29_1 then
								for iter_29_0, iter_29_1 in ipairs(var_29_1.normal_expedition_drop_num or {}) do
									for iter_29_2, iter_29_3 in ipairs(iter_29_1[1]) do
										var_29_0[iter_29_3] = iter_29_1[2] or 0
									end
								end
							end

							arg_11_0:updateActivity(iter_12_1)
						end,
						[ActivityConst.ACTIVITY_TYPE_RANDOM_DAILY_TASK] = function()
							local var_30_0 = pg.TimeMgr.GetInstance():GetServerTime()

							if pg.TimeMgr.GetInstance():IsSameDay(iter_12_1.data1, var_30_0) then
								return
							end

							pg.m02:sendNotification(GAME.ACT_RANDOM_DAILY_TASK, {
								activity_id = iter_12_1.id,
								cmd = ActivityConst.RANDOM_DAILY_TASK_OP_RANDOM
							})
						end,
						[ActivityConst.ACTIVITY_TYPE_EVENT_SINGLE] = function()
							arg_11_0:sendNotification(GAME.SINGLE_EVENT_REFRESH, {
								actId = iter_12_1.id
							})
						end
					})
				end
			end
		end,
		[ProxyRegister.SecondCall] = function(arg_32_0)
			for iter_32_0, iter_32_1 in pairs(arg_11_0.data) do
				if not iter_32_1:isEnd() then
					switch(iter_32_1:getConfig("type"), {
						[ActivityConst.ACTIVITY_TYPE_TOWN] = function()
							iter_32_1:UpdateTime()
						end
					})
				end
			end

			if not arg_11_0.stopList then
				return
			end

			local var_32_0 = pg.TimeMgr.GetInstance():GetServerTime()

			while #arg_11_0.stopList > 0 and var_32_0 >= arg_11_0.stopList[1][1] do
				local var_32_1, var_32_2 = unpack(table.remove(arg_11_0.stopList, 1))

				if arg_11_0.data[var_32_2]:getConfig("type") == ActivityConst.ACTIVITY_TYPE_MILITARY_EXERCISE then
					getProxy(MilitaryExerciseProxy):setSeasonOver()
				end

				pg.ShipFlagMgr.GetInstance():UpdateFlagShips("inActivity")
				arg_11_0:sendNotification(var_0_0.ACTIVITY_END, var_32_2)
			end
		end
	}
end

function var_0_0.getAliveActivityByType(arg_34_0, arg_34_1)
	for iter_34_0, iter_34_1 in pairs(arg_34_0.data) do
		if iter_34_1:getConfig("type") == arg_34_1 and not iter_34_1:isEnd() then
			return iter_34_1
		end
	end
end

function var_0_0.getActivityByType(arg_35_0, arg_35_1)
	for iter_35_0, iter_35_1 in pairs(arg_35_0.data) do
		if iter_35_1:getConfig("type") == arg_35_1 then
			return iter_35_1
		end
	end
end

function var_0_0.getActivitiesByType(arg_36_0, arg_36_1)
	local var_36_0 = {}

	for iter_36_0, iter_36_1 in pairs(arg_36_0.data) do
		if iter_36_1:getConfig("type") == arg_36_1 then
			table.insert(var_36_0, iter_36_1)
		end
	end

	return var_36_0
end

function var_0_0.getActivitiesByTypes(arg_37_0, arg_37_1)
	local var_37_0 = {}

	for iter_37_0, iter_37_1 in pairs(arg_37_0.data) do
		if table.contains(arg_37_1, iter_37_1:getConfig("type")) then
			table.insert(var_37_0, iter_37_1)
		end
	end

	return var_37_0
end

function var_0_0.getMilitaryExerciseActivity(arg_38_0)
	local var_38_0

	for iter_38_0, iter_38_1 in pairs(arg_38_0.data) do
		if iter_38_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_MILITARY_EXERCISE then
			var_38_0 = iter_38_1

			break
		end
	end

	return Clone(var_38_0)
end

function var_0_0.getPanelActivities(arg_39_0)
	local function var_39_0(arg_40_0)
		local var_40_0 = arg_40_0:getConfig("type")
		local var_40_1 = arg_40_0:isShow() and not arg_40_0:isAfterShow()

		if var_40_1 then
			if var_40_0 == ActivityConst.ACTIVITY_TYPE_CHARGEAWARD then
				var_40_1 = arg_40_0.data2 == 0
			elseif var_40_0 == ActivityConst.ACTIVITY_TYPE_PROGRESSLOGIN then
				var_40_1 = arg_40_0.data1 < 7 or not arg_40_0.achieved
			end
		end

		return var_40_1 and not arg_40_0:isEnd()
	end

	local var_39_1 = {}

	for iter_39_0, iter_39_1 in pairs(arg_39_0.data) do
		if var_39_0(iter_39_1) then
			table.insert(var_39_1, iter_39_1)
		end
	end

	table.sort(var_39_1, CompareFuncs({
		function(arg_41_0)
			return -arg_41_0:getConfig("login_pop")
		end,
		function(arg_42_0)
			return arg_42_0.id
		end
	}))

	return var_39_1
end

function var_0_0.checkHxActivity(arg_43_0, arg_43_1)
	if arg_43_0.hxList and #arg_43_0.hxList > 0 then
		for iter_43_0 = 1, #arg_43_0.hxList do
			if arg_43_0.hxList[iter_43_0] == arg_43_1 then
				return true
			end
		end
	end

	return false
end

function var_0_0.getBannerDisplays(arg_44_0)
	return _(pg.activity_banner.all):chain():map(function(arg_45_0)
		return pg.activity_banner[arg_45_0]
	end):filter(function(arg_46_0)
		return pg.TimeMgr.GetInstance():inTime(arg_46_0.time) and arg_46_0.type ~= GAMEUI_BANNER_9 and arg_46_0.type ~= GAMEUI_BANNER_11 and arg_46_0.type ~= GAMEUI_BANNER_10 and arg_46_0.type ~= GAMEUI_BANNER_12 and arg_46_0.type ~= GAMEUI_BANNER_13
	end):value()
end

function var_0_0.getActiveBannerByType(arg_47_0, arg_47_1)
	local var_47_0 = pg.activity_banner.get_id_list_by_type[arg_47_1]

	if not var_47_0 then
		return nil
	end

	for iter_47_0, iter_47_1 in ipairs(var_47_0) do
		local var_47_1 = pg.activity_banner[iter_47_1]

		if pg.TimeMgr.GetInstance():inTime(var_47_1.time) then
			return var_47_1
		end
	end

	return nil
end

function var_0_0.getNoticeBannerDisplays(arg_48_0)
	return _.map(pg.activity_banner_notice.all, function(arg_49_0)
		return pg.activity_banner_notice[arg_49_0]
	end)
end

function var_0_0.findNextAutoActivity(arg_50_0)
	local var_50_0
	local var_50_1 = pg.TimeMgr.GetInstance()
	local var_50_2 = var_50_1:GetServerTime()

	for iter_50_0, iter_50_1 in ipairs(arg_50_0:getPanelActivities()) do
		if iter_50_1:isShow() and not iter_50_1.autoActionForbidden then
			local var_50_3 = iter_50_1:getConfig("type")

			if var_50_3 == ActivityConst.ACTIVITY_TYPE_7DAYSLOGIN then
				local var_50_4 = iter_50_1:getConfig("config_id")
				local var_50_5 = pg.activity_7_day_sign[var_50_4].front_drops

				if iter_50_1.data1 < #var_50_5 and not var_50_1:IsSameDay(var_50_2, iter_50_1.data2) and var_50_2 > iter_50_1.data2 then
					var_50_0 = iter_50_1

					break
				end
			elseif var_50_3 == ActivityConst.ACTIVITY_TYPE_PROGRESSLOGIN then
				local var_50_6 = getProxy(ChapterProxy)

				if iter_50_1.data1 < 7 and not var_50_1:IsSameDay(var_50_2, iter_50_1.data2) or iter_50_1.data1 == 7 and not iter_50_1.achieved and var_50_6:isClear(204) then
					var_50_0 = iter_50_1

					break
				end
			elseif var_50_3 == ActivityConst.ACTIVITY_TYPE_MONTHSIGN then
				local var_50_7 = pg.TimeMgr.GetInstance():STimeDescS(var_50_2, "*t")

				iter_50_1:setSpecialData("reMonthSignDay", nil)

				if var_50_7.year ~= iter_50_1.data1 or var_50_7.month ~= iter_50_1.data2 then
					iter_50_1.data1 = var_50_7.year
					iter_50_1.data2 = var_50_7.month
					iter_50_1.data1_list = {}
					var_50_0 = iter_50_1

					break
				elseif not table.contains(iter_50_1.data1_list, var_50_7.day) then
					var_50_0 = iter_50_1

					break
				elseif var_50_7.day > #iter_50_1.data1_list and pg.activity_month_sign[iter_50_1.data2].resign_count > iter_50_1.data3 then
					for iter_50_2 = var_50_7.day, 1, -1 do
						if not table.contains(iter_50_1.data1_list, iter_50_2) then
							iter_50_1:setSpecialData("reMonthSignDay", iter_50_2)

							break
						end
					end

					var_50_0 = iter_50_1
				end
			elseif iter_50_1.id == ActivityConst.SHADOW_PLAY_ID and iter_50_1.clientData1 == 0 then
				local var_50_8 = iter_50_1:getConfig("config_data")[1]
				local var_50_9 = getProxy(TaskProxy)
				local var_50_10 = var_50_9:getTaskById(var_50_8) or var_50_9:getFinishTaskById(var_50_8)

				if var_50_10 and not var_50_10:isReceive() then
					var_50_0 = iter_50_1

					break
				end
			end
		end
	end

	if not var_50_0 then
		for iter_50_3, iter_50_4 in pairs(arg_50_0.data) do
			if not iter_50_4:isShow() and iter_50_4:getConfig("type") == ActivityConst.ACTIVITY_TYPE_7DAYSLOGIN then
				local var_50_11 = iter_50_4:getConfig("config_id")
				local var_50_12 = pg.activity_7_day_sign[var_50_11].front_drops

				if iter_50_4.data1 < #var_50_12 and not var_50_1:IsSameDay(var_50_2, iter_50_4.data2) and var_50_2 > iter_50_4.data2 then
					var_50_0 = iter_50_4

					break
				end
			end
		end
	end

	return var_50_0
end

function var_0_0.findRefluxAutoActivity(arg_51_0)
	local var_51_0 = arg_51_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX)

	if var_51_0 and not var_51_0:isEnd() and not var_51_0.autoActionForbidden then
		local var_51_1 = pg.TimeMgr.GetInstance()

		if var_51_0.data1_list[2] < #pg.return_sign_template.all and not var_51_1:IsSameDay(var_51_1:GetServerTime(), var_51_0.data1_list[1]) then
			return 1
		end
	end
end

function var_0_0.existRefluxAwards(arg_52_0)
	local var_52_0 = arg_52_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX)

	if var_52_0 and not var_52_0:isEnd() then
		local var_52_1 = pg.return_pt_template

		for iter_52_0 = #var_52_1.all, 1, -1 do
			local var_52_2 = var_52_1.all[iter_52_0]
			local var_52_3 = var_52_1[var_52_2]

			if var_52_0.data3 >= var_52_3.pt_require and var_52_2 > var_52_0.data4 then
				return true
			end
		end

		local var_52_4 = getProxy(TaskProxy)
		local var_52_5 = _(var_52_0:getConfig("config_data")[7]):chain():map(function(arg_53_0)
			return arg_53_0[2]
		end):flatten():map(function(arg_54_0)
			return var_52_4:getTaskById(arg_54_0) or var_52_4:getFinishTaskById(arg_54_0) or false
		end):filter(function(arg_55_0)
			return not not arg_55_0
		end):value()

		if _.any(var_52_5, function(arg_56_0)
			return arg_56_0:getTaskStatus() == 1
		end) then
			return true
		end
	end
end

function var_0_0.getActivityById(arg_57_0, arg_57_1)
	return Clone(arg_57_0.data[arg_57_1])
end

function var_0_0.RawGetActivityById(arg_58_0, arg_58_1)
	return arg_58_0.data[arg_58_1]
end

function var_0_0.updateActivity(arg_59_0, arg_59_1)
	assert(arg_59_0.data[arg_59_1.id], "activity should exist" .. arg_59_1.id)
	assert(isa(arg_59_1, Activity), "activity should instance of Activity")

	if arg_59_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_PT_CRUSING then
		local var_59_0 = pg.battlepass_event_pt[arg_59_1.id].target

		if arg_59_0.data[arg_59_1.id].data1 < var_59_0[#var_59_0] and arg_59_1.data1 - arg_59_0.data[arg_59_1.id].data1 > 0 then
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_CRUSING, {
				ptId = pg.battlepass_event_pt[arg_59_1.id].pt,
				ptCount = arg_59_1.data1 - arg_59_0.data[arg_59_1.id].data1
			})
		end
	end

	arg_59_0.data[arg_59_1.id] = arg_59_1

	arg_59_0:sendNotification(var_0_0.ACTIVITY_UPDATED, arg_59_1:clone())
	arg_59_0:sendNotification(GAME.SYN_GRAFTING_ACTIVITY, {
		id = arg_59_1.id
	})
end

function var_0_0.addActivity(arg_60_0, arg_60_1)
	assert(arg_60_0.data[arg_60_1.id] == nil, "activity already exist" .. arg_60_1.id)
	assert(isa(arg_60_1, Activity), "activity should instance of Activity")

	arg_60_0.data[arg_60_1.id] = arg_60_1

	arg_60_0:sendNotification(var_0_0.ACTIVITY_ADDED, arg_60_1:clone())

	if arg_60_1.stopTime > 0 then
		table.insert(arg_60_0.stopList, {
			arg_60_1.stopTime,
			arg_60_1.id
		})
		table.sort(arg_60_0.stopList, CompareFuncs({
			function(arg_61_0)
				return arg_61_0[1]
			end
		}))
	end

	if arg_60_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_BUFF then
		table.insert(arg_60_0.buffActs, arg_60_1.id)
		arg_60_0:refreshActivityBuffs()
	end
end

function var_0_0.deleteActivityById(arg_62_0, arg_62_1)
	assert(arg_62_0.data[arg_62_1], "activity should exist" .. arg_62_1)

	arg_62_0.data[arg_62_1] = nil

	arg_62_0:sendNotification(var_0_0.ACTIVITY_DELETED, arg_62_1)

	local var_62_0 = table.getIndex(arg_62_0.stopList, function(arg_63_0)
		return arg_63_0[2] == arg_62_1
	end)

	if var_62_0 then
		table.remove(arg_62_0.stopList, var_62_0)
	end
end

function var_0_0.IsActivityNotEnd(arg_64_0, arg_64_1)
	return arg_64_0.data[arg_64_1] and not arg_64_0.data[arg_64_1]:isEnd()
end

function var_0_0.readyToAchieveByType(arg_65_0, arg_65_1)
	local var_65_0 = false
	local var_65_1 = arg_65_0:getActivitiesByType(arg_65_1)

	for iter_65_0, iter_65_1 in ipairs(var_65_1) do
		if iter_65_1:readyToAchieve() then
			var_65_0 = true

			break
		end
	end

	return var_65_0
end

function var_0_0.getBuildActivityCfgByID(arg_66_0, arg_66_1)
	local var_66_0 = arg_66_0:getActivitiesByTypes({
		ActivityConst.ACTIVITY_TYPE_BUILDSHIP_1,
		ActivityConst.ACTIVITY_TYPE_NEWSERVER_BUILD
	})

	for iter_66_0, iter_66_1 in ipairs(var_66_0) do
		if not iter_66_1:isEnd() then
			local var_66_1 = iter_66_1:getConfig("config_client")

			if var_66_1 and var_66_1.id == arg_66_1 then
				return var_66_1
			end
		end
	end

	return nil
end

function var_0_0.getNoneActBuildActivityCfgByID(arg_67_0, arg_67_1)
	local var_67_0 = arg_67_0:getActivitiesByTypes({
		ActivityConst.ACTIVITY_TYPE_BUILD
	})

	for iter_67_0, iter_67_1 in ipairs(var_67_0) do
		if not iter_67_1:isEnd() then
			local var_67_1 = iter_67_1:getConfig("config_client")

			if var_67_1 and var_67_1.id == arg_67_1 then
				return var_67_1
			end
		end
	end

	return nil
end

function var_0_0.getBuffShipList(arg_68_0)
	local var_68_0 = {}
	local var_68_1 = arg_68_0:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_SHIP_BUFF)

	_.each(var_68_1, function(arg_69_0)
		if arg_69_0 and not arg_69_0:isEnd() then
			local var_69_0 = arg_69_0:getConfig("config_id")
			local var_69_1 = pg.activity_expup_ship[var_69_0]

			if not var_69_1 then
				return
			end

			local var_69_2 = var_69_1.expup

			for iter_69_0, iter_69_1 in pairs(var_69_2) do
				var_68_0[iter_69_1[1]] = iter_69_1[2]
			end
		end
	end)

	return var_68_0
end

function var_0_0.getVirtualItemNumber(arg_70_0, arg_70_1)
	local var_70_0 = arg_70_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_VIRTUAL_BAG)

	if var_70_0 and not var_70_0:isEnd() then
		return var_70_0.data1KeyValueList[1][arg_70_1] and var_70_0.data1KeyValueList[1][arg_70_1] or 0
	end

	return 0
end

function var_0_0.removeVitemById(arg_71_0, arg_71_1, arg_71_2)
	local var_71_0 = arg_71_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_VIRTUAL_BAG)

	assert(var_71_0, "vbagType invalid")

	if var_71_0 and not var_71_0:isEnd() then
		var_71_0.data1KeyValueList[1][arg_71_1] = var_71_0.data1KeyValueList[1][arg_71_1] - arg_71_2
	end

	arg_71_0:updateActivity(var_71_0)
end

function var_0_0.addVitemById(arg_72_0, arg_72_1, arg_72_2)
	local var_72_0 = arg_72_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_VIRTUAL_BAG)

	assert(var_72_0, "vbagType invalid")

	if var_72_0 and not var_72_0:isEnd() then
		if not var_72_0.data1KeyValueList[1][arg_72_1] then
			var_72_0.data1KeyValueList[1][arg_72_1] = 0
		end

		var_72_0.data1KeyValueList[1][arg_72_1] = var_72_0.data1KeyValueList[1][arg_72_1] + arg_72_2
	end

	arg_72_0:updateActivity(var_72_0)

	local var_72_1 = Item.getConfigData(arg_72_1).link_id

	if var_72_1 ~= 0 then
		local var_72_2 = arg_72_0:getActivityById(var_72_1)

		if var_72_2 and not var_72_2:isEnd() then
			PlayerResChangeCommand.UpdateActivity(var_72_2, arg_72_2)
		end
	end
end

function var_0_0.monitorTaskList(arg_73_0, arg_73_1)
	if arg_73_1 and not arg_73_1:isEnd() and arg_73_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_TASK_LIST_MONITOR then
		local var_73_0 = arg_73_1:getConfig("config_data")[1] or {}

		if getProxy(TaskProxy):isReceiveTasks(var_73_0) then
			arg_73_0:sendNotification(GAME.ACTIVITY_OPERATION, {
				cmd = 1,
				activity_id = arg_73_1.id
			})
		end
	end
end

function var_0_0.InitActtivityFleet(arg_74_0, arg_74_1, arg_74_2)
	getProxy(FleetProxy):addActivityFleet(arg_74_1, arg_74_2.group_list)
end

function var_0_0.InitActivityBossData(arg_75_0, arg_75_1)
	local var_75_0 = pg.activity_event_worldboss[arg_75_1:getConfig("config_id")]

	if not var_75_0 then
		return
	end

	local var_75_1 = arg_75_1.data1KeyValueList

	for iter_75_0, iter_75_1 in pairs(var_75_0.normal_expedition_drop_num or {}) do
		for iter_75_2, iter_75_3 in pairs(iter_75_1[1]) do
			local var_75_2 = iter_75_1[2]
			local var_75_3 = var_75_1[1][iter_75_3] or 0

			var_75_1[1][iter_75_3] = math.max(var_75_2 - var_75_3, 0)
			var_75_1[2][iter_75_3] = var_75_1[2][iter_75_3] or 0
		end
	end
end

function var_0_0.AddInstagramTimer(arg_76_0, arg_76_1)
	arg_76_0:RemoveInstagramTimer()

	local var_76_0, var_76_1 = arg_76_0.data[arg_76_1]:GetNextPushTime()

	if var_76_0 then
		local var_76_2 = var_76_0 - pg.TimeMgr.GetInstance():GetServerTime()

		local function var_76_3()
			arg_76_0:sendNotification(GAME.ACT_INSTAGRAM_OP, {
				arg2 = 0,
				activity_id = arg_76_1,
				cmd = ActivityConst.INSTAGRAM_OP_ACTIVE,
				arg1 = var_76_1
			})
		end

		if var_76_2 <= 0 then
			var_76_3()
		else
			arg_76_0.instagramTimer = Timer.New(function()
				var_76_3()
				arg_76_0:RemoveInstagramTimer()
			end, var_76_2, 1)

			arg_76_0.instagramTimer:Start()
		end
	end
end

function var_0_0.RemoveInstagramTimer(arg_79_0)
	if arg_79_0.instagramTimer then
		arg_79_0.instagramTimer:Stop()

		arg_79_0.instagramTimer = nil
	end
end

function var_0_0.RegisterRequestTime(arg_80_0, arg_80_1, arg_80_2)
	if not arg_80_1 or arg_80_1 <= 0 then
		return
	end

	arg_80_0.requestTime[arg_80_1] = arg_80_2
end

function var_0_0.remove(arg_81_0)
	arg_81_0:RemoveInstagramTimer()
end

function var_0_0.addActivityParameter(arg_82_0, arg_82_1)
	local var_82_0 = arg_82_1:getConfig("config_data")
	local var_82_1 = arg_82_1.stopTime

	for iter_82_0, iter_82_1 in ipairs(var_82_0) do
		arg_82_0.params[iter_82_1[1]] = {
			iter_82_1[2],
			var_82_1
		}
	end
end

function var_0_0.getActivityParameter(arg_83_0, arg_83_1)
	if arg_83_0.params[arg_83_1] then
		local var_83_0, var_83_1 = unpack(arg_83_0.params[arg_83_1])

		if not (var_83_1 > 0) or not (var_83_1 <= pg.TimeMgr.GetInstance():GetServerTime()) then
			return var_83_0
		end
	end
end

function var_0_0.IsShowFreeBuildMark(arg_84_0, arg_84_1)
	for iter_84_0, iter_84_1 in ipairs(arg_84_0:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_BUILD_FREE)) do
		if iter_84_1 and not iter_84_1:isEnd() and iter_84_1.data1 > 0 and iter_84_1.stopTime - pg.TimeMgr.GetInstance():GetServerTime() < 259200 and tobool(arg_84_1) == (PlayerPrefs.GetString("Free_Build_Ticket_" .. iter_84_1.id, "") == pg.TimeMgr.GetInstance():CurrentSTimeDesc("%Y/%m/%d")) then
			return iter_84_1
		end
	end

	return false
end

function var_0_0.getBuildFreeActivityByBuildId(arg_85_0, arg_85_1)
	for iter_85_0, iter_85_1 in ipairs(arg_85_0:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_BUILD_FREE)) do
		if underscore.any(iter_85_1:getConfig("config_data"), function(arg_86_0)
			return arg_86_0 == arg_85_1
		end) then
			return iter_85_1
		end
	end
end

function var_0_0.getBuildPoolActivity(arg_87_0, arg_87_1)
	if arg_87_1:IsActivity() then
		return arg_87_0:getActivityById(arg_87_1.activityId)
	end
end

function var_0_0.getEnterReadyActivity(arg_88_0)
	local var_88_0 = {
		[ActivityConst.ACTIVITY_TYPE_ZPROJECT] = false,
		[ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2] = function(arg_89_0)
			return not arg_89_0:checkBattleTimeInBossAct()
		end,
		[ActivityConst.ACTIVITY_TYPE_BOSSRUSH] = false,
		[ActivityConst.ACTIVITY_TYPE_BOSSSINGLE] = false,
		[ActivityConst.ACTIVITY_TYPE_BOSSSINGLE_VARIABLE] = false
	}
	local var_88_1 = _.keys(var_88_0)
	local var_88_2 = {}

	for iter_88_0, iter_88_1 in ipairs(var_88_1) do
		var_88_2[iter_88_1] = 0
	end

	for iter_88_2, iter_88_3 in pairs(arg_88_0.data) do
		local var_88_3 = iter_88_3:getConfig("type")

		if var_88_2[var_88_3] and not iter_88_3:isEnd() and not existCall(var_88_0[var_88_3], iter_88_3) then
			var_88_2[var_88_3] = math.max(var_88_2[var_88_3], iter_88_2)
		end
	end

	table.sort(var_88_1)

	for iter_88_4, iter_88_5 in ipairs(var_88_1) do
		if var_88_2[iter_88_5] > 0 then
			return arg_88_0.data[var_88_2[iter_88_5]]
		end
	end
end

function var_0_0.AtelierActivityAllSlotIsEmpty(arg_90_0)
	local var_90_0 = arg_90_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_ATELIER_LINK)

	if not var_90_0 or var_90_0:isEnd() then
		return false
	end

	local var_90_1 = var_90_0:GetSlots()

	for iter_90_0, iter_90_1 in pairs(var_90_1) do
		if iter_90_1[1] ~= 0 then
			return false
		end
	end

	return true
end

function var_0_0.OwnAtelierActivityItemCnt(arg_91_0, arg_91_1, arg_91_2)
	local var_91_0 = arg_91_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_ATELIER_LINK)

	if not var_91_0 or var_91_0:isEnd() then
		return false
	end

	local var_91_1 = var_91_0:GetItems()[arg_91_1]

	return var_91_1 and arg_91_2 <= var_91_1.count
end

function var_0_0.refreshActivityBuffs(arg_92_0)
	arg_92_0.actBuffs = {}

	local var_92_0 = 1

	while var_92_0 <= #arg_92_0.buffActs do
		local var_92_1 = arg_92_0.data[arg_92_0.buffActs[var_92_0]]

		if not var_92_1 or var_92_1:isEnd() then
			table.remove(arg_92_0.buffActs, var_92_0)
		else
			var_92_0 = var_92_0 + 1

			local var_92_2 = {
				var_92_1:getConfig("config_id")
			}

			if var_92_2[1] == 0 then
				var_92_2 = var_92_1:getConfig("config_data")
			end

			for iter_92_0, iter_92_1 in ipairs(var_92_2) do
				local var_92_3 = ActivityBuff.New(var_92_1.id, iter_92_1)

				if var_92_3:isActivate() then
					table.insert(arg_92_0.actBuffs, var_92_3)
				end
			end
		end
	end
end

function var_0_0.getActivityBuffs(arg_93_0)
	if underscore.any(arg_93_0.buffActs, function(arg_94_0)
		return not arg_93_0.data[arg_94_0] or arg_93_0.data[arg_94_0]:isEnd()
	end) or underscore.any(arg_93_0.actBuffs, function(arg_95_0)
		return not arg_95_0:isActivate()
	end) then
		arg_93_0:refreshActivityBuffs()
	end

	return arg_93_0.actBuffs
end

function var_0_0.getShipModExpActivity(arg_96_0)
	return underscore.select(arg_96_0:getActivityBuffs(), function(arg_97_0)
		return arg_97_0:ShipModExpUsage()
	end)
end

function var_0_0.getBackyardEnergyActivityBuffs(arg_98_0)
	return underscore.select(arg_98_0:getActivityBuffs(), function(arg_99_0)
		return arg_99_0:BackyardEnergyUsage()
	end)
end

function var_0_0.InitContinuousTime(arg_100_0, arg_100_1)
	arg_100_0.continuousOpeartionTime = arg_100_1
	arg_100_0.continuousOpeartionTotalTime = arg_100_1
end

function var_0_0.UseContinuousTime(arg_101_0)
	if not arg_101_0.continuousOpeartionTime then
		return
	end

	arg_101_0.continuousOpeartionTime = arg_101_0.continuousOpeartionTime - 1
end

function var_0_0.GetContinuousTime(arg_102_0)
	return arg_102_0.continuousOpeartionTime, arg_102_0.continuousOpeartionTotalTime
end

function var_0_0.AddBossRushAwards(arg_103_0, arg_103_1)
	arg_103_0.bossrushAwards = arg_103_0.bossrushAwards or {}

	table.insertto(arg_103_0.bossrushAwards, arg_103_1)
end

function var_0_0.PopBossRushAwards(arg_104_0)
	local var_104_0 = arg_104_0.bossrushAwards or {}

	arg_104_0.bossrushAwards = nil

	return var_104_0
end

function var_0_0.GetBossRushRuntime(arg_105_0, arg_105_1)
	if not arg_105_0.extraDatas[arg_105_1] then
		arg_105_0.extraDatas[arg_105_1] = {
			record = 0
		}
	end

	return arg_105_0.extraDatas[arg_105_1]
end

function var_0_0.GetActivityBossRuntime(arg_106_0, arg_106_1)
	if not arg_106_0.extraDatas[arg_106_1] then
		arg_106_0.extraDatas[arg_106_1] = {
			buffIds = {},
			spScore = {
				score = 0
			}
		}
	end

	return arg_106_0.extraDatas[arg_106_1]
end

function var_0_0.GetTaskActivities(arg_107_0)
	local var_107_0 = {}

	table.Foreach(Activity.GetType2Class(), function(arg_108_0, arg_108_1)
		if not isa(arg_108_1, ITaskActivity) then
			return
		end

		table.insertto(var_107_0, arg_107_0:getActivitiesByType(arg_108_0))
	end)

	return var_107_0
end

function var_0_0.setSurveyState(arg_109_0, arg_109_1)
	local var_109_0 = arg_109_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_SURVEY)

	if var_109_0 and not var_109_0:isEnd() then
		arg_109_0.surveyState = arg_109_1
	end
end

function var_0_0.isSurveyDone(arg_110_0)
	local var_110_0 = arg_110_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_SURVEY)

	if var_110_0 and not var_110_0:isEnd() then
		return arg_110_0.surveyState and arg_110_0.surveyState > 0
	end
end

function var_0_0.isSurveyOpen(arg_111_0)
	local var_111_0 = arg_111_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_SURVEY)

	if var_111_0 and not var_111_0:isEnd() then
		local var_111_1 = var_111_0:getConfig("config_data")
		local var_111_2 = var_111_1[1]
		local var_111_3 = var_111_1[2]

		if var_111_2 == 1 then
			local var_111_4 = var_111_3 <= getProxy(PlayerProxy):getData().level
			local var_111_5 = var_111_0:getConfig("config_id")

			return var_111_4, var_111_5
		end
	end
end

function var_0_0.GetActBossLinkPTActID(arg_112_0, arg_112_1)
	local var_112_0 = table.Find(arg_112_0.data, function(arg_113_0, arg_113_1)
		if arg_113_1:getConfig("type") ~= ActivityConst.ACTIVITY_TYPE_PT_BUFF then
			return
		end

		return arg_113_1:getDataConfig("link_id") == arg_112_1
	end)

	return var_112_0 and var_112_0.id
end

function var_0_0.CheckDailyEventRequest(arg_114_0, arg_114_1)
	if arg_114_1:CheckDailyEventRequest() then
		arg_114_0:sendNotification(GAME.SINGLE_EVENT_REFRESH, {
			actId = arg_114_1.id
		})
	end
end

return var_0_0
