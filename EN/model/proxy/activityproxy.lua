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
						[ActivityConst.ACTIVITY_TYPE_MANUAL_SIGN] = function()
							arg_11_0:sendNotification(GAME.ACT_MANUAL_SIGN, {
								activity_id = iter_12_1.id,
								cmd = ManualSignActivity.OP_SIGN
							})
						end,
						[ActivityConst.ACTIVITY_TYPE_TURNTABLE] = function()
							local var_25_0 = iter_12_1:getConfig("config_id")
							local var_25_1 = pg.activity_event_turning[var_25_0]

							if var_25_1.total_num <= iter_12_1.data3 then
								return
							end

							local var_25_2 = var_25_1.task_table[iter_12_1.data4]

							if not var_25_2 then
								return
							end

							local var_25_3 = getProxy(TaskProxy)

							for iter_25_0, iter_25_1 in ipairs(var_25_2) do
								if (var_25_3:getTaskById(iter_25_1) or var_25_3:getFinishTaskById(iter_25_1)):getTaskStatus() ~= 2 then
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
							local var_28_0 = iter_12_1.data1KeyValueList[1]
							local var_28_1 = pg.activity_event_worldboss[iter_12_1:getConfig("config_id")]

							if var_28_1 then
								for iter_28_0, iter_28_1 in ipairs(var_28_1.normal_expedition_drop_num or {}) do
									for iter_28_2, iter_28_3 in ipairs(iter_28_1[1]) do
										var_28_0[iter_28_3] = iter_28_1[2] or 0
									end
								end
							end

							arg_11_0:updateActivity(iter_12_1)
						end,
						[ActivityConst.ACTIVITY_TYPE_RANDOM_DAILY_TASK] = function()
							local var_29_0 = pg.TimeMgr.GetInstance():GetServerTime()

							if pg.TimeMgr.GetInstance():IsSameDay(iter_12_1.data1, var_29_0) then
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
		[ProxyRegister.SecondCall] = function(arg_31_0)
			for iter_31_0, iter_31_1 in pairs(arg_11_0.data) do
				if not iter_31_1:isEnd() then
					switch(iter_31_1:getConfig("type"), {
						[ActivityConst.ACTIVITY_TYPE_TOWN] = function()
							iter_31_1:UpdateTime()
						end
					})
				end
			end

			if not arg_11_0.stopList then
				return
			end

			local var_31_0 = pg.TimeMgr.GetInstance():GetServerTime()

			while #arg_11_0.stopList > 0 and var_31_0 >= arg_11_0.stopList[1][1] do
				local var_31_1, var_31_2 = unpack(table.remove(arg_11_0.stopList, 1))

				if arg_11_0.data[var_31_2]:getConfig("type") == ActivityConst.ACTIVITY_TYPE_MILITARY_EXERCISE then
					getProxy(MilitaryExerciseProxy):setSeasonOver()
				end

				pg.ShipFlagMgr.GetInstance():UpdateFlagShips("inActivity")
				arg_11_0:sendNotification(var_0_0.ACTIVITY_END, var_31_2)
			end
		end
	}
end

function var_0_0.getAliveActivityByType(arg_33_0, arg_33_1)
	for iter_33_0, iter_33_1 in pairs(arg_33_0.data) do
		if iter_33_1:getConfig("type") == arg_33_1 and not iter_33_1:isEnd() then
			return iter_33_1
		end
	end
end

function var_0_0.getActivityByType(arg_34_0, arg_34_1)
	for iter_34_0, iter_34_1 in pairs(arg_34_0.data) do
		if iter_34_1:getConfig("type") == arg_34_1 then
			return iter_34_1
		end
	end
end

function var_0_0.getActivitiesByType(arg_35_0, arg_35_1)
	local var_35_0 = {}

	for iter_35_0, iter_35_1 in pairs(arg_35_0.data) do
		if iter_35_1:getConfig("type") == arg_35_1 then
			table.insert(var_35_0, iter_35_1)
		end
	end

	return var_35_0
end

function var_0_0.getActivitiesByTypes(arg_36_0, arg_36_1)
	local var_36_0 = {}

	for iter_36_0, iter_36_1 in pairs(arg_36_0.data) do
		if table.contains(arg_36_1, iter_36_1:getConfig("type")) then
			table.insert(var_36_0, iter_36_1)
		end
	end

	return var_36_0
end

function var_0_0.GetEarliestActByType(arg_37_0, arg_37_1)
	local var_37_0 = arg_37_0:getActivitiesByType(arg_37_1)
	local var_37_1 = _.select(var_37_0, function(arg_38_0)
		return not arg_38_0:isEnd()
	end)

	table.sort(var_37_1, function(arg_39_0, arg_39_1)
		return arg_39_0.id < arg_39_1.id
	end)

	return var_37_1[1]
end

function var_0_0.getMilitaryExerciseActivity(arg_40_0)
	local var_40_0

	for iter_40_0, iter_40_1 in pairs(arg_40_0.data) do
		if iter_40_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_MILITARY_EXERCISE then
			var_40_0 = iter_40_1

			break
		end
	end

	return Clone(var_40_0)
end

function var_0_0.getPanelActivities(arg_41_0)
	local function var_41_0(arg_42_0)
		local var_42_0 = arg_42_0:getConfig("type")
		local var_42_1 = arg_42_0:isShow() and not arg_42_0:isAfterShow()

		if var_42_1 then
			if var_42_0 == ActivityConst.ACTIVITY_TYPE_CHARGEAWARD then
				var_42_1 = arg_42_0.data2 == 0
			elseif var_42_0 == ActivityConst.ACTIVITY_TYPE_PROGRESSLOGIN then
				var_42_1 = arg_42_0.data1 < 7 or not arg_42_0.achieved
			end
		end

		return var_42_1 and not arg_42_0:isEnd()
	end

	local var_41_1 = {}

	for iter_41_0, iter_41_1 in pairs(arg_41_0.data) do
		if var_41_0(iter_41_1) then
			table.insert(var_41_1, iter_41_1)
		end
	end

	table.sort(var_41_1, CompareFuncs({
		function(arg_43_0)
			return -arg_43_0:getConfig("login_pop")
		end,
		function(arg_44_0)
			return arg_44_0.id
		end
	}))

	return var_41_1
end

function var_0_0.checkHxActivity(arg_45_0, arg_45_1)
	if arg_45_0.hxList and #arg_45_0.hxList > 0 then
		for iter_45_0 = 1, #arg_45_0.hxList do
			if arg_45_0.hxList[iter_45_0] == arg_45_1 then
				return true
			end
		end
	end

	return false
end

function var_0_0.getBannerDisplays(arg_46_0)
	return _(pg.activity_banner.all):chain():map(function(arg_47_0)
		return pg.activity_banner[arg_47_0]
	end):filter(function(arg_48_0)
		return pg.TimeMgr.GetInstance():inTime(arg_48_0.time) and arg_48_0.type ~= GAMEUI_BANNER_9 and arg_48_0.type ~= GAMEUI_BANNER_11 and arg_48_0.type ~= GAMEUI_BANNER_10 and arg_48_0.type ~= GAMEUI_BANNER_12 and arg_48_0.type ~= GAMEUI_BANNER_13
	end):value()
end

function var_0_0.getActiveBannerByType(arg_49_0, arg_49_1)
	local var_49_0 = pg.activity_banner.get_id_list_by_type[arg_49_1]

	if not var_49_0 then
		return nil
	end

	for iter_49_0, iter_49_1 in ipairs(var_49_0) do
		local var_49_1 = pg.activity_banner[iter_49_1]

		if pg.TimeMgr.GetInstance():inTime(var_49_1.time) then
			return var_49_1
		end
	end

	return nil
end

function var_0_0.getNoticeBannerDisplays(arg_50_0)
	return _.map(pg.activity_banner_notice.all, function(arg_51_0)
		return pg.activity_banner_notice[arg_51_0]
	end)
end

function var_0_0.findNextAutoActivity(arg_52_0)
	local var_52_0
	local var_52_1 = pg.TimeMgr.GetInstance()
	local var_52_2 = var_52_1:GetServerTime()

	for iter_52_0, iter_52_1 in ipairs(arg_52_0:getPanelActivities()) do
		if iter_52_1:isShow() and not iter_52_1.autoActionForbidden then
			local var_52_3 = iter_52_1:getConfig("type")

			if var_52_3 == ActivityConst.ACTIVITY_TYPE_7DAYSLOGIN then
				local var_52_4 = iter_52_1:getConfig("config_id")
				local var_52_5 = pg.activity_7_day_sign[var_52_4].front_drops

				if iter_52_1.data1 < #var_52_5 and not var_52_1:IsSameDay(var_52_2, iter_52_1.data2) and var_52_2 > iter_52_1.data2 then
					var_52_0 = iter_52_1

					break
				end
			elseif var_52_3 == ActivityConst.ACTIVITY_TYPE_PROGRESSLOGIN then
				local var_52_6 = getProxy(ChapterProxy)

				if iter_52_1.data1 < 7 and not var_52_1:IsSameDay(var_52_2, iter_52_1.data2) or iter_52_1.data1 == 7 and not iter_52_1.achieved and var_52_6:isClear(204) then
					var_52_0 = iter_52_1

					break
				end
			elseif var_52_3 == ActivityConst.ACTIVITY_TYPE_MONTHSIGN then
				local var_52_7 = pg.TimeMgr.GetInstance():STimeDescS(var_52_2, "*t")

				iter_52_1:setSpecialData("reMonthSignDay", nil)

				if var_52_7.year ~= iter_52_1.data1 or var_52_7.month ~= iter_52_1.data2 then
					iter_52_1.data1 = var_52_7.year
					iter_52_1.data2 = var_52_7.month
					iter_52_1.data1_list = {}
					var_52_0 = iter_52_1

					break
				elseif not table.contains(iter_52_1.data1_list, var_52_7.day) then
					var_52_0 = iter_52_1

					break
				elseif var_52_7.day > #iter_52_1.data1_list and pg.activity_month_sign[iter_52_1.data2].resign_count > iter_52_1.data3 then
					for iter_52_2 = var_52_7.day, 1, -1 do
						if not table.contains(iter_52_1.data1_list, iter_52_2) then
							iter_52_1:setSpecialData("reMonthSignDay", iter_52_2)

							break
						end
					end

					var_52_0 = iter_52_1
				end
			elseif iter_52_1.id == ActivityConst.SHADOW_PLAY_ID and iter_52_1.clientData1 == 0 then
				local var_52_8 = iter_52_1:getConfig("config_data")[1]
				local var_52_9 = getProxy(TaskProxy)
				local var_52_10 = var_52_9:getTaskById(var_52_8) or var_52_9:getFinishTaskById(var_52_8)

				if var_52_10 and not var_52_10:isReceive() then
					var_52_0 = iter_52_1

					break
				end
			end
		end
	end

	if not var_52_0 then
		for iter_52_3, iter_52_4 in pairs(arg_52_0.data) do
			if not iter_52_4:isShow() and iter_52_4:getConfig("type") == ActivityConst.ACTIVITY_TYPE_7DAYSLOGIN then
				local var_52_11 = iter_52_4:getConfig("config_id")
				local var_52_12 = pg.activity_7_day_sign[var_52_11].front_drops

				if iter_52_4.data1 < #var_52_12 and not var_52_1:IsSameDay(var_52_2, iter_52_4.data2) and var_52_2 > iter_52_4.data2 then
					var_52_0 = iter_52_4

					break
				end
			end
		end
	end

	return var_52_0
end

function var_0_0.findRefluxAutoActivity(arg_53_0)
	local var_53_0 = arg_53_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX)

	if var_53_0 and not var_53_0:isEnd() and not var_53_0.autoActionForbidden then
		local var_53_1 = pg.TimeMgr.GetInstance()

		if var_53_0.data1_list[2] < #pg.return_sign_template.all and not var_53_1:IsSameDay(var_53_1:GetServerTime(), var_53_0.data1_list[1]) then
			return 1
		end
	end
end

function var_0_0.existRefluxAwards(arg_54_0)
	local var_54_0 = arg_54_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX)

	if var_54_0 and not var_54_0:isEnd() then
		local var_54_1 = pg.return_pt_template

		for iter_54_0 = #var_54_1.all, 1, -1 do
			local var_54_2 = var_54_1.all[iter_54_0]
			local var_54_3 = var_54_1[var_54_2]

			if var_54_0.data3 >= var_54_3.pt_require and var_54_2 > var_54_0.data4 then
				return true
			end
		end

		local var_54_4 = getProxy(TaskProxy)
		local var_54_5 = _(var_54_0:getConfig("config_data")[7]):chain():map(function(arg_55_0)
			return arg_55_0[2]
		end):flatten():map(function(arg_56_0)
			return var_54_4:getTaskById(arg_56_0) or var_54_4:getFinishTaskById(arg_56_0) or false
		end):filter(function(arg_57_0)
			return not not arg_57_0
		end):value()

		if _.any(var_54_5, function(arg_58_0)
			return arg_58_0:getTaskStatus() == 1
		end) then
			return true
		end
	end
end

function var_0_0.getActivityById(arg_59_0, arg_59_1)
	return Clone(arg_59_0.data[arg_59_1])
end

function var_0_0.RawGetActivityById(arg_60_0, arg_60_1)
	return arg_60_0.data[arg_60_1]
end

function var_0_0.updateActivity(arg_61_0, arg_61_1)
	assert(arg_61_0.data[arg_61_1.id], "activity should exist" .. arg_61_1.id)
	assert(isa(arg_61_1, Activity), "activity should instance of Activity")

	if arg_61_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_PT_CRUSING then
		local var_61_0 = pg.battlepass_event_pt[arg_61_1.id].target

		if arg_61_0.data[arg_61_1.id].data1 < var_61_0[#var_61_0] and arg_61_1.data1 - arg_61_0.data[arg_61_1.id].data1 > 0 then
			pg.ToastMgr.GetInstance():ShowToast(pg.ToastMgr.TYPE_CRUSING, {
				ptId = pg.battlepass_event_pt[arg_61_1.id].pt,
				ptCount = arg_61_1.data1 - arg_61_0.data[arg_61_1.id].data1
			})
		end
	end

	arg_61_0.data[arg_61_1.id] = arg_61_1

	arg_61_0:sendNotification(var_0_0.ACTIVITY_UPDATED, arg_61_1:clone())
	arg_61_0:sendNotification(GAME.SYN_GRAFTING_ACTIVITY, {
		id = arg_61_1.id
	})
end

function var_0_0.addActivity(arg_62_0, arg_62_1)
	assert(arg_62_0.data[arg_62_1.id] == nil, "activity already exist" .. arg_62_1.id)
	assert(isa(arg_62_1, Activity), "activity should instance of Activity")

	arg_62_0.data[arg_62_1.id] = arg_62_1

	arg_62_0:sendNotification(var_0_0.ACTIVITY_ADDED, arg_62_1:clone())

	if arg_62_1.stopTime > 0 then
		table.insert(arg_62_0.stopList, {
			arg_62_1.stopTime,
			arg_62_1.id
		})
		table.sort(arg_62_0.stopList, CompareFuncs({
			function(arg_63_0)
				return arg_63_0[1]
			end
		}))
	end

	if arg_62_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_BUFF then
		table.insert(arg_62_0.buffActs, arg_62_1.id)
		arg_62_0:refreshActivityBuffs()
	end
end

function var_0_0.deleteActivityById(arg_64_0, arg_64_1)
	assert(arg_64_0.data[arg_64_1], "activity should exist" .. arg_64_1)

	arg_64_0.data[arg_64_1] = nil

	arg_64_0:sendNotification(var_0_0.ACTIVITY_DELETED, arg_64_1)

	local var_64_0 = table.getIndex(arg_64_0.stopList, function(arg_65_0)
		return arg_65_0[2] == arg_64_1
	end)

	if var_64_0 then
		table.remove(arg_64_0.stopList, var_64_0)
	end
end

function var_0_0.IsActivityNotEnd(arg_66_0, arg_66_1)
	return arg_66_0.data[arg_66_1] and not arg_66_0.data[arg_66_1]:isEnd()
end

function var_0_0.readyToAchieveByType(arg_67_0, arg_67_1)
	local var_67_0 = false
	local var_67_1 = arg_67_0:getActivitiesByType(arg_67_1)

	for iter_67_0, iter_67_1 in ipairs(var_67_1) do
		if iter_67_1:readyToAchieve() then
			var_67_0 = true

			break
		end
	end

	return var_67_0
end

function var_0_0.getBuildActivityCfgByID(arg_68_0, arg_68_1)
	local var_68_0 = arg_68_0:getActivitiesByTypes({
		ActivityConst.ACTIVITY_TYPE_BUILDSHIP_1,
		ActivityConst.ACTIVITY_TYPE_NEWSERVER_BUILD
	})

	for iter_68_0, iter_68_1 in ipairs(var_68_0) do
		if not iter_68_1:isEnd() then
			local var_68_1 = iter_68_1:getConfig("config_client")

			if var_68_1 and var_68_1.id == arg_68_1 then
				return var_68_1
			end
		end
	end

	return nil
end

function var_0_0.getNoneActBuildActivityCfgByID(arg_69_0, arg_69_1)
	local var_69_0 = arg_69_0:getActivitiesByTypes({
		ActivityConst.ACTIVITY_TYPE_BUILD
	})

	for iter_69_0, iter_69_1 in ipairs(var_69_0) do
		if not iter_69_1:isEnd() then
			local var_69_1 = iter_69_1:getConfig("config_client")

			if var_69_1 and var_69_1.id == arg_69_1 then
				return var_69_1
			end
		end
	end

	return nil
end

function var_0_0.getBuffShipList(arg_70_0)
	local var_70_0 = {}
	local var_70_1 = arg_70_0:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_SHIP_BUFF)

	_.each(var_70_1, function(arg_71_0)
		if arg_71_0 and not arg_71_0:isEnd() then
			local var_71_0 = arg_71_0:getConfig("config_id")
			local var_71_1 = pg.activity_expup_ship[var_71_0]

			if not var_71_1 then
				return
			end

			local var_71_2 = var_71_1.expup

			for iter_71_0, iter_71_1 in pairs(var_71_2) do
				var_70_0[iter_71_1[1]] = iter_71_1[2]
			end
		end
	end)

	return var_70_0
end

function var_0_0.getVirtualItemNumber(arg_72_0, arg_72_1)
	local var_72_0 = arg_72_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_VIRTUAL_BAG)

	if var_72_0 and not var_72_0:isEnd() then
		return var_72_0.data1KeyValueList[1][arg_72_1] and var_72_0.data1KeyValueList[1][arg_72_1] or 0
	end

	return 0
end

function var_0_0.removeVitemById(arg_73_0, arg_73_1, arg_73_2)
	local var_73_0 = arg_73_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_VIRTUAL_BAG)

	assert(var_73_0, "vbagType invalid")

	if var_73_0 and not var_73_0:isEnd() then
		var_73_0.data1KeyValueList[1][arg_73_1] = var_73_0.data1KeyValueList[1][arg_73_1] - arg_73_2
	end

	arg_73_0:updateActivity(var_73_0)
end

function var_0_0.addVitemById(arg_74_0, arg_74_1, arg_74_2)
	local var_74_0 = arg_74_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_VIRTUAL_BAG)

	assert(var_74_0, "vbagType invalid")

	if var_74_0 and not var_74_0:isEnd() then
		if not var_74_0.data1KeyValueList[1][arg_74_1] then
			var_74_0.data1KeyValueList[1][arg_74_1] = 0
		end

		var_74_0.data1KeyValueList[1][arg_74_1] = var_74_0.data1KeyValueList[1][arg_74_1] + arg_74_2
	end

	arg_74_0:updateActivity(var_74_0)

	local var_74_1 = Item.getConfigData(arg_74_1).link_id

	if var_74_1 ~= 0 then
		local var_74_2 = arg_74_0:getActivityById(var_74_1)

		if var_74_2 and not var_74_2:isEnd() then
			PlayerResChangeCommand.UpdateActivity(var_74_2, arg_74_2)
		end
	end
end

function var_0_0.monitorTaskList(arg_75_0, arg_75_1)
	if arg_75_1 and not arg_75_1:isEnd() and arg_75_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_TASK_LIST_MONITOR then
		local var_75_0 = arg_75_1:getConfig("config_data")[1] or {}

		if getProxy(TaskProxy):isReceiveTasks(var_75_0) then
			arg_75_0:sendNotification(GAME.ACTIVITY_OPERATION, {
				cmd = 1,
				activity_id = arg_75_1.id
			})
		end
	end
end

function var_0_0.InitActtivityFleet(arg_76_0, arg_76_1, arg_76_2)
	getProxy(FleetProxy):addActivityFleet(arg_76_1, arg_76_2.group_list)
end

function var_0_0.InitActivityBossData(arg_77_0, arg_77_1)
	local var_77_0 = pg.activity_event_worldboss[arg_77_1:getConfig("config_id")]

	if not var_77_0 then
		return
	end

	local var_77_1 = arg_77_1.data1KeyValueList

	for iter_77_0, iter_77_1 in pairs(var_77_0.normal_expedition_drop_num or {}) do
		for iter_77_2, iter_77_3 in pairs(iter_77_1[1]) do
			local var_77_2 = iter_77_1[2]
			local var_77_3 = var_77_1[1][iter_77_3] or 0

			var_77_1[1][iter_77_3] = math.max(var_77_2 - var_77_3, 0)
			var_77_1[2][iter_77_3] = var_77_1[2][iter_77_3] or 0
		end
	end
end

function var_0_0.AddInstagramTimer(arg_78_0, arg_78_1)
	arg_78_0:RemoveInstagramTimer()

	local var_78_0, var_78_1 = arg_78_0.data[arg_78_1]:GetNextPushTime()

	if var_78_0 then
		local var_78_2 = var_78_0 - pg.TimeMgr.GetInstance():GetServerTime()

		local function var_78_3()
			arg_78_0:sendNotification(GAME.ACT_INSTAGRAM_OP, {
				arg2 = 0,
				activity_id = arg_78_1,
				cmd = ActivityConst.INSTAGRAM_OP_ACTIVE,
				arg1 = var_78_1
			})
		end

		if var_78_2 <= 0 then
			var_78_3()
		else
			arg_78_0.instagramTimer = Timer.New(function()
				var_78_3()
				arg_78_0:RemoveInstagramTimer()
			end, var_78_2, 1)

			arg_78_0.instagramTimer:Start()
		end
	end
end

function var_0_0.RemoveInstagramTimer(arg_81_0)
	if arg_81_0.instagramTimer then
		arg_81_0.instagramTimer:Stop()

		arg_81_0.instagramTimer = nil
	end
end

function var_0_0.RegisterRequestTime(arg_82_0, arg_82_1, arg_82_2)
	if not arg_82_1 or arg_82_1 <= 0 then
		return
	end

	arg_82_0.requestTime[arg_82_1] = arg_82_2
end

function var_0_0.remove(arg_83_0)
	arg_83_0:RemoveInstagramTimer()
end

function var_0_0.addActivityParameter(arg_84_0, arg_84_1)
	local var_84_0 = arg_84_1:getConfig("config_data")
	local var_84_1 = arg_84_1.stopTime

	for iter_84_0, iter_84_1 in ipairs(var_84_0) do
		arg_84_0.params[iter_84_1[1]] = {
			iter_84_1[2],
			var_84_1
		}
	end
end

function var_0_0.getActivityParameter(arg_85_0, arg_85_1)
	if arg_85_0.params[arg_85_1] then
		local var_85_0, var_85_1 = unpack(arg_85_0.params[arg_85_1])

		if not (var_85_1 > 0) or not (var_85_1 <= pg.TimeMgr.GetInstance():GetServerTime()) then
			return var_85_0
		end
	end
end

function var_0_0.IsShowFreeBuildMark(arg_86_0, arg_86_1)
	for iter_86_0, iter_86_1 in ipairs(arg_86_0:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_BUILD_FREE)) do
		if iter_86_1 and not iter_86_1:isEnd() and iter_86_1.data1 > 0 and iter_86_1.stopTime - pg.TimeMgr.GetInstance():GetServerTime() < 259200 and tobool(arg_86_1) == (PlayerPrefs.GetString("Free_Build_Ticket_" .. iter_86_1.id, "") == pg.TimeMgr.GetInstance():CurrentSTimeDesc("%Y/%m/%d")) then
			return iter_86_1
		end
	end

	return false
end

function var_0_0.getBuildFreeActivityByBuildId(arg_87_0, arg_87_1)
	for iter_87_0, iter_87_1 in ipairs(arg_87_0:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_BUILD_FREE)) do
		if underscore.any(iter_87_1:getConfig("config_data"), function(arg_88_0)
			return arg_88_0 == arg_87_1
		end) then
			return iter_87_1
		end
	end
end

function var_0_0.getBuildPoolActivity(arg_89_0, arg_89_1)
	if arg_89_1:IsActivity() then
		return arg_89_0:getActivityById(arg_89_1.activityId)
	end
end

function var_0_0.getEnterReadyActivity(arg_90_0)
	local var_90_0 = {
		[ActivityConst.ACTIVITY_TYPE_ZPROJECT] = false,
		[ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2] = function(arg_91_0)
			return not arg_91_0:checkBattleTimeInBossAct()
		end,
		[ActivityConst.ACTIVITY_TYPE_BOSSRUSH] = false,
		[ActivityConst.ACTIVITY_TYPE_BOSSSINGLE] = false
	}
	local var_90_1 = _.keys(var_90_0)
	local var_90_2 = {}

	for iter_90_0, iter_90_1 in ipairs(var_90_1) do
		var_90_2[iter_90_1] = 0
	end

	for iter_90_2, iter_90_3 in pairs(arg_90_0.data) do
		local var_90_3 = iter_90_3:getConfig("type")

		if var_90_2[var_90_3] and not iter_90_3:isEnd() and not existCall(var_90_0[var_90_3], iter_90_3) then
			var_90_2[var_90_3] = math.max(var_90_2[var_90_3], iter_90_2)
		end
	end

	table.sort(var_90_1)

	for iter_90_4, iter_90_5 in ipairs(var_90_1) do
		if var_90_2[iter_90_5] > 0 then
			return arg_90_0.data[var_90_2[iter_90_5]]
		end
	end
end

function var_0_0.AtelierActivityAllSlotIsEmpty(arg_92_0)
	local var_92_0 = arg_92_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_ATELIER_LINK)

	if not var_92_0 or var_92_0:isEnd() then
		return false
	end

	local var_92_1 = var_92_0:GetSlots()

	for iter_92_0, iter_92_1 in pairs(var_92_1) do
		if iter_92_1[1] ~= 0 then
			return false
		end
	end

	return true
end

function var_0_0.OwnAtelierActivityItemCnt(arg_93_0, arg_93_1, arg_93_2)
	local var_93_0 = arg_93_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_ATELIER_LINK)

	if not var_93_0 or var_93_0:isEnd() then
		return false
	end

	local var_93_1 = var_93_0:GetItems()[arg_93_1]

	return var_93_1 and arg_93_2 <= var_93_1.count
end

function var_0_0.refreshActivityBuffs(arg_94_0)
	arg_94_0.actBuffs = {}

	local var_94_0 = 1

	while var_94_0 <= #arg_94_0.buffActs do
		local var_94_1 = arg_94_0.data[arg_94_0.buffActs[var_94_0]]

		if not var_94_1 or var_94_1:isEnd() then
			table.remove(arg_94_0.buffActs, var_94_0)
		else
			var_94_0 = var_94_0 + 1

			local var_94_2 = {
				var_94_1:getConfig("config_id")
			}

			if var_94_2[1] == 0 then
				var_94_2 = var_94_1:getConfig("config_data")
			end

			for iter_94_0, iter_94_1 in ipairs(var_94_2) do
				local var_94_3 = ActivityBuff.New(var_94_1.id, iter_94_1)

				if var_94_3:isActivate() then
					table.insert(arg_94_0.actBuffs, var_94_3)
				end
			end
		end
	end
end

function var_0_0.getActivityBuffs(arg_95_0)
	if underscore.any(arg_95_0.buffActs, function(arg_96_0)
		return not arg_95_0.data[arg_96_0] or arg_95_0.data[arg_96_0]:isEnd()
	end) or underscore.any(arg_95_0.actBuffs, function(arg_97_0)
		return not arg_97_0:isActivate()
	end) then
		arg_95_0:refreshActivityBuffs()
	end

	return arg_95_0.actBuffs
end

function var_0_0.getShipModExpActivity(arg_98_0)
	return underscore.select(arg_98_0:getActivityBuffs(), function(arg_99_0)
		return arg_99_0:ShipModExpUsage()
	end)
end

function var_0_0.getBackyardEnergyActivityBuffs(arg_100_0)
	return underscore.select(arg_100_0:getActivityBuffs(), function(arg_101_0)
		return arg_101_0:BackyardEnergyUsage()
	end)
end

function var_0_0.InitContinuousTime(arg_102_0, arg_102_1)
	arg_102_0.continuousOpeartionTime = arg_102_1
	arg_102_0.continuousOpeartionTotalTime = arg_102_1
end

function var_0_0.UseContinuousTime(arg_103_0)
	if not arg_103_0.continuousOpeartionTime then
		return
	end

	arg_103_0.continuousOpeartionTime = arg_103_0.continuousOpeartionTime - 1
end

function var_0_0.GetContinuousTime(arg_104_0)
	return arg_104_0.continuousOpeartionTime, arg_104_0.continuousOpeartionTotalTime
end

function var_0_0.AddBossRushAwards(arg_105_0, arg_105_1)
	arg_105_0.bossrushAwards = arg_105_0.bossrushAwards or {}

	table.insertto(arg_105_0.bossrushAwards, arg_105_1)
end

function var_0_0.PopBossRushAwards(arg_106_0)
	local var_106_0 = arg_106_0.bossrushAwards or {}

	arg_106_0.bossrushAwards = nil

	return var_106_0
end

function var_0_0.GetBossRushRuntime(arg_107_0, arg_107_1)
	if not arg_107_0.extraDatas[arg_107_1] then
		arg_107_0.extraDatas[arg_107_1] = {
			record = 0
		}
	end

	return arg_107_0.extraDatas[arg_107_1]
end

function var_0_0.GetActivityBossRuntime(arg_108_0, arg_108_1)
	if not arg_108_0.extraDatas[arg_108_1] then
		arg_108_0.extraDatas[arg_108_1] = {
			buffIds = {},
			spScore = {
				score = 0
			}
		}
	end

	return arg_108_0.extraDatas[arg_108_1]
end

function var_0_0.GetTaskActivities(arg_109_0)
	local var_109_0 = {}

	table.Foreach(Activity.GetType2Class(), function(arg_110_0, arg_110_1)
		if not isa(arg_110_1, ITaskActivity) then
			return
		end

		table.insertto(var_109_0, arg_109_0:getActivitiesByType(arg_110_0))
	end)

	return var_109_0
end

function var_0_0.setSurveyState(arg_111_0, arg_111_1)
	local var_111_0 = arg_111_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_SURVEY)

	if var_111_0 and not var_111_0:isEnd() then
		arg_111_0.surveyState = arg_111_1
	end
end

function var_0_0.isSurveyDone(arg_112_0)
	local var_112_0 = arg_112_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_SURVEY)

	if var_112_0 and not var_112_0:isEnd() then
		return arg_112_0.surveyState and arg_112_0.surveyState > 0
	end
end

function var_0_0.isSurveyOpen(arg_113_0)
	local var_113_0 = arg_113_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_SURVEY)

	if var_113_0 and not var_113_0:isEnd() then
		local var_113_1 = var_113_0:getConfig("config_data")
		local var_113_2 = var_113_1[1]
		local var_113_3 = var_113_1[2]

		if var_113_2 == 1 then
			local var_113_4 = var_113_3 <= getProxy(PlayerProxy):getData().level
			local var_113_5 = var_113_0:getConfig("config_id")

			return var_113_4, var_113_5
		end
	end
end

function var_0_0.GetActBossLinkPTActID(arg_114_0, arg_114_1)
	local var_114_0 = table.Find(arg_114_0.data, function(arg_115_0, arg_115_1)
		if arg_115_1:getConfig("type") ~= ActivityConst.ACTIVITY_TYPE_PT_BUFF then
			return
		end

		return arg_115_1:getDataConfig("link_id") == arg_114_1
	end)

	return var_114_0 and var_114_0.id
end

function var_0_0.CheckDailyEventRequest(arg_116_0, arg_116_1)
	if arg_116_1:CheckDailyEventRequest() then
		arg_116_0:sendNotification(GAME.SINGLE_EVENT_REFRESH, {
			actId = arg_116_1.id
		})
	end
end

return var_0_0
