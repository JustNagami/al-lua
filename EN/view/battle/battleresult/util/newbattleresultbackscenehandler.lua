local var_0_0 = class("NewBattleResultBackSceneHandler", pm.Mediator)

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0)
	pg.m02:registerMediator(arg_1_0)

	arg_1_0.contextData = arg_1_1
end

function var_0_0.Execute(arg_2_0)
	local var_2_0 = arg_2_0.contextData
	local var_2_1 = var_2_0.system

	if var_2_1 == SYSTEM_DUEL then
		arg_2_0:ExitDuelSystem(var_2_0)
	elseif var_2_1 == SYSTEM_ACT_BOSS then
		arg_2_0:ExitActBossSystem(var_2_0)
	elseif var_2_1 == SYSTEM_ROUTINE or var_2_1 == SYSTEM_SUB_ROUTINE then
		arg_2_0:ExitRoutineSystem(var_2_0)
	elseif var_2_1 == SYSTEM_SCENARIO then
		arg_2_0:ExitScenarioSystem(var_2_0)
	elseif var_2_1 == SYSTEM_CHALLENGE then
		arg_2_0:ExitChallengeSystem(var_2_0)
	elseif var_2_1 == SYSTEM_HP_SHARE_ACT_BOSS or var_2_1 == SYSTEM_BOSS_EXPERIMENT or var_2_1 == SYSTEM_ACT_BOSS_SP then
		arg_2_0:ExitShareBossSystem(var_2_0)
	elseif var_2_1 == SYSTEM_WORLD_BOSS then
		arg_2_0:ExitWorldBossSystem(var_2_0)
	elseif var_2_1 == SYSTEM_WORLD then
		arg_2_0:ExitWorldSystem(var_2_0)
	elseif var_2_1 == SYSTEM_BOSS_RUSH or var_2_1 == SYSTEM_BOSS_RUSH_EX then
		if arg_2_0:CheckBossRushSystem(var_2_0) then
			arg_2_0:ResultRushBossSystem(var_2_0)
		end
	elseif var_2_1 == SYSTEM_LIMIT_CHALLENGE then
		arg_2_0:ExitLimitChallengeSystem(var_2_0)
	elseif var_2_1 == SYSTEM_BOSS_SINGLE then
		arg_2_0:ExitBossSingleSystem(var_2_0)
	elseif var_2_1 == SYSTEM_BOSS_SINGLE_VARIABLE then
		arg_2_0:ExitBossSingleVariableSystem(var_2_0)
	else
		arg_2_0:ExitCommonSystem(var_2_0)
	end

	getProxy(MetaCharacterProxy):clearLastMetaSkillExpInfoList()
end

function var_0_0.ExitDuelSystem(arg_3_0, arg_3_1)
	local var_3_0 = getProxy(ContextProxy):getContextByMediator(MilitaryExerciseMediator)

	if var_3_0 then
		local var_3_1 = var_3_0:getContextByMediator(ExercisePreCombatMediator)

		var_3_0:removeChild(var_3_1)
	end

	pg.m02:sendNotification(GAME.GO_BACK)
end

function var_0_0.ExitActBossSystem(arg_4_0, arg_4_1)
	local var_4_0, var_4_1 = getProxy(ContextProxy):getContextByMediator(ActivityBossPreCombatMediator)

	if var_4_0 then
		var_4_1:removeChild(var_4_0)
	end

	if getProxy(ContextProxy):getCurrentContext():getContextByMediator(ContinuousOperationMediator) then
		arg_4_0:CheckActBossSystem(arg_4_1)
	else
		pg.m02:sendNotification(GAME.GO_BACK)
	end
end

function var_0_0.ExitRoutineSystem(arg_5_0, arg_5_1)
	local var_5_0 = getProxy(ContextProxy):getContextByMediator(DailyLevelMediator)

	if var_5_0 then
		local var_5_1 = var_5_0:getContextByMediator(PreCombatMediator)

		var_5_0:removeChild(var_5_1)
	end

	pg.m02:sendNotification(GAME.GO_BACK)
end

function var_0_0.ExitScenarioSystem(arg_6_0, arg_6_1)
	if arg_6_1.needHelpMessage then
		getProxy(ChapterProxy):StopAutoFight(ChapterConst.AUTOFIGHT_STOP_REASON.BATTLE_FAILED)
	end

	local var_6_0 = getProxy(ContextProxy):getContextByMediator(LevelMediator2)

	if var_6_0 then
		local var_6_1 = var_6_0:getContextByMediator(ChapterPreCombatMediator)

		if var_6_1 then
			var_6_0:removeChild(var_6_1)
		end
	end

	if arg_6_1.score > ys.Battle.BattleConst.BattleScore.C then
		arg_6_0:ShowExtraChapterActSocre(arg_6_1)
	end

	getProxy(ChapterProxy):WriteBackOnExitBattleResult()
	pg.m02:sendNotification(GAME.GO_BACK)
end

function var_0_0.ExitChallengeSystem(arg_7_0, arg_7_1)
	getProxy(ChallengeProxy):WriteBackOnExitBattleResult(arg_7_0.contextData.score, arg_7_0.contextData.mode)

	if not arg_7_1.goToNext then
		arg_7_1.goToNext = nil

		local var_7_0 = getProxy(ContextProxy):getContextByMediator(ChallengeMainMediator)

		if var_7_0 then
			local var_7_1 = var_7_0:getContextByMediator(ChallengePreCombatMediator)

			var_7_0:removeChild(var_7_1)
		end
	end

	pg.m02:sendNotification(GAME.GO_BACK)
end

function var_0_0.ExitShareBossSystem(arg_8_0, arg_8_1)
	local var_8_0, var_8_1 = getProxy(ContextProxy):getContextByMediator(ActivityBossPreCombatMediator)

	if var_8_0 then
		var_8_1:removeChild(var_8_0)
	end

	pg.m02:sendNotification(GAME.GO_BACK)
end

function var_0_0.ExitWorldBossSystem(arg_9_0, arg_9_1)
	local var_9_0 = getProxy(ContextProxy):getContextByMediator(WorldBossMediator)
	local var_9_1 = var_9_0:getContextByMediator(WorldBossFormationMediator)

	if var_9_1 then
		var_9_0:removeChild(var_9_1)
	end

	pg.m02:sendNotification(GAME.WORLD_BOSS_BATTLE_QUIT, {
		id = arg_9_1.bossId
	})
	pg.m02:sendNotification(GAME.GO_BACK)
end

function var_0_0.ExitWorldSystem(arg_10_0, arg_10_1)
	local var_10_0 = getProxy(ContextProxy):getContextByMediator(WorldMediator)
	local var_10_1 = var_10_0:getContextByMediator(WorldPreCombatMediator) or var_10_0:getContextByMediator(WorldBossInformationMediator)

	if var_10_1 then
		var_10_0:removeChild(var_10_1)
	end

	pg.m02:sendNotification(GAME.GO_BACK)
end

function var_0_0.ResultRushBossSystem(arg_11_0, arg_11_1)
	local var_11_0 = getProxy(ContextProxy):GetPrevContext(1)
	local var_11_1 = var_11_0:getContextByMediator(BossRushPreCombatMediator)

	if var_11_1 then
		var_11_0:removeChild(var_11_1)
	end

	local var_11_2 = var_11_0:getContextByMediator(BossRushFleetSelectMediator)

	if var_11_2 then
		var_11_0:removeChild(var_11_2)
	end

	if not (arg_11_1.score > ys.Battle.BattleConst.BattleScore.C) and arg_11_1.system == SYSTEM_BOSS_RUSH_EX then
		arg_11_0:addSubLayers(Context.New({
			mediator = BattleFailTipMediator,
			viewComponent = BattleFailTipLayer,
			data = {
				mainShips = arg_11_1.newMainShips,
				battleSystem = arg_11_1.system
			},
			onRemoved = function()
				pg.m02:sendNotification(GAME.GO_BACK)
			end
		}))

		return
	end

	pg.m02:sendNotification(GAME.BOSSRUSH_SETTLE, {
		actId = arg_11_1.actId
	})
end

function var_0_0.ExitRushBossSystem(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = arg_13_1.system
	local var_13_1 = arg_13_1.actId
	local var_13_2 = arg_13_2.seriesData
	local var_13_3 = arg_13_1.score > ys.Battle.BattleConst.BattleScore.C
	local var_13_4 = var_13_0 == SYSTEM_BOSS_RUSH and BossRushBattleResultMediator or BossRushBattleResultMediator
	local var_13_5 = var_13_0 == SYSTEM_BOSS_RUSH and BossRushBattleResultLayer or BossRushConst.GetEXBattleResultLayer(var_13_1)

	arg_13_0:addSubLayers(Context.New({
		mediator = var_13_4,
		viewComponent = var_13_5,
		data = {
			awards = arg_13_2.awards,
			system = var_13_0,
			actId = var_13_1,
			seriesData = var_13_2,
			win = var_13_3,
			isAutoFight = arg_13_0.contextData.isAutoFight
		}
	}), true)
	LoadContextCommand.RemoveLayerByMediator(NewBattleResultMediator)
end

function var_0_0.ExitLimitChallengeSystem(arg_14_0, arg_14_1)
	local var_14_0 = getProxy(ContextProxy):getContextByMediator(LimitChallengeMediator)

	if var_14_0 then
		local var_14_1 = var_14_0:getContextByMediator(LimitChallengePreCombatMediator)

		if var_14_1 then
			var_14_0:removeChild(var_14_1)
		end
	end

	pg.m02:sendNotification(GAME.GO_BACK)
end

function var_0_0.ExitBossSingleSystem(arg_15_0, arg_15_1)
	local var_15_0, var_15_1 = getProxy(ContextProxy):getContextByMediator(BossSinglePreCombatMediator)

	if var_15_0 then
		local var_15_2 = var_15_1:removeChild(var_15_0)
	end

	if getProxy(ContextProxy):getCurrentContext():getContextByMediator(BossSingleContinuousOperationMediator) then
		arg_15_0:CheckBossSingleSystem(arg_15_1)
	else
		pg.m02:sendNotification(GAME.GO_BACK)
	end
end

function var_0_0.ExitBossSingleVariableSystem(arg_16_0, arg_16_1)
	local var_16_0, var_16_1 = getProxy(ContextProxy):getContextByMediator(BossSinglePreCombatMediator)

	if var_16_0 then
		local var_16_2 = var_16_1:removeChild(var_16_0)
	end

	if getProxy(ContextProxy):getCurrentContext():getContextByMediator(BossSingleContinuousOperationMediator) then
		arg_16_0:CheckBossSingleSystem(arg_16_1)
	else
		pg.m02:sendNotification(GAME.GO_BACK)
	end
end

function var_0_0.ExitCommonSystem(arg_17_0, arg_17_1)
	local var_17_0 = getProxy(ContextProxy):getContextByMediator(LevelMediator2)

	if var_17_0 then
		local var_17_1 = var_17_0:getContextByMediator(PreCombatMediator)

		if var_17_1 then
			var_17_0:removeChild(var_17_1)
		end
	end

	pg.m02:sendNotification(GAME.GO_BACK)
end

local function var_0_1()
	local var_18_0 = getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_EXTRA_CHAPTER_RANK)
	local var_18_1 = {}

	for iter_18_0, iter_18_1 in ipairs(var_18_0) do
		if iter_18_1 and not iter_18_1:isEnd() then
			table.insert(var_18_1, iter_18_1)
		end
	end

	return var_18_1
end

function var_0_0.ShowExtraChapterActSocre(arg_19_0, arg_19_1)
	local var_19_0 = getProxy(ChapterProxy):getActiveChapter()
	local var_19_1 = var_0_1()

	for iter_19_0, iter_19_1 in ipairs(var_19_1) do
		local var_19_2 = iter_19_1:getConfig("config_data")
		local var_19_3 = arg_19_1.stageId

		if var_19_2[1] == var_19_3 and var_19_0:IsEXChapter() then
			local var_19_4 = math.floor(arg_19_1.statistics._totalTime)
			local var_19_5 = ActivityLevelConst.getShipsPower(arg_19_1.prefabFleet or arg_19_1.oldMainShips)
			local var_19_6, var_19_7 = ActivityLevelConst.getExtraChapterSocre(var_19_3, var_19_4, var_19_5, iter_19_1)
			local var_19_8 = var_19_7 < var_19_6 and i18n("extra_chapter_record_updated") or i18n("extra_chapter_record_not_updated")

			if var_19_7 < var_19_6 then
				iter_19_1.data1 = var_19_6

				getProxy(ActivityProxy):updateActivity(iter_19_1)

				var_19_7 = var_19_6
			end

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				hideNo = true,
				content = i18n("extra_chapter_socre_tip", var_19_6, var_19_7, var_19_8),
				weight = LayerWeightConst.SECOND_LAYER
			})
		end
	end
end

local function var_0_2(arg_20_0)
	local var_20_0 = getProxy(ActivityProxy):getActivityById(arg_20_0.actId)
	local var_20_1 = var_20_0:getConfig("config_id")
	local var_20_2 = pg.activity_event_worldboss[var_20_1]
	local var_20_3 = var_20_0:IsOilLimit(arg_20_0.stageId)
	local var_20_4 = getProxy(FleetProxy):getActivityFleets()[arg_20_0.actId]
	local var_20_5 = 0
	local var_20_6 = var_20_2.use_oil_limit[arg_20_0.mainFleetId]

	local function var_20_7(arg_21_0, arg_21_1)
		local var_21_0 = arg_21_0:GetCostSum().oil

		if arg_21_1 > 0 then
			var_21_0 = math.min(var_21_0, arg_21_1)
		end

		var_20_5 = var_20_5 + var_21_0
	end

	var_20_7(var_20_4[arg_20_0.mainFleetId], var_20_3 and var_20_6[1] or 0)
	var_20_7(var_20_4[arg_20_0.mainFleetId + 10], var_20_3 and var_20_6[2] or 0)

	return var_20_5
end

local function var_0_3(arg_22_0, arg_22_1)
	local var_22_0 = getProxy(ContextProxy):getCurrentContext():getContextByMediator(ContinuousOperationMediator)
	local var_22_1 = var_22_0 and var_22_0.data.autoFlag or nil
	local var_22_2 = getProxy(ChapterProxy):PopActBossRewards()

	LoadContextCommand.LoadLayerOnTopContext(Context.New({
		mediator = ActivityBossTotalRewardPanelMediator,
		viewComponent = ActivityBossTotalRewardPanel,
		data = {
			onClose = function()
				pg.m02:sendNotification(GAME.GO_BACK)
			end,
			stopReason = arg_22_1,
			rewards = var_22_2,
			isAutoFight = var_22_1,
			continuousBattleTimes = arg_22_0.continuousBattleTimes,
			totalBattleTimes = arg_22_0.totalBattleTimes
		}
	}))
end

local function var_0_4(arg_24_0, arg_24_1)
	local var_24_0 = getProxy(ContextProxy):getCurrentContext():getContextByMediator(BossSingleContinuousOperationMediator)
	local var_24_1 = var_24_0 and var_24_0.data.autoFlag or nil
	local var_24_2 = getProxy(ChapterProxy):PopBossSingleRewards()

	LoadContextCommand.LoadLayerOnTopContext(Context.New({
		mediator = BossSingleTotalRewardPanelMediator,
		viewComponent = BossSingleTotalRewardPanel,
		data = {
			onConfirm = function()
				pg.m02:sendNotification(GAME.GO_BACK)
			end,
			onClose = function()
				local var_26_0 = getProxy(ContextProxy):getContextByMediator(ClueMapMediator)

				if var_26_0 then
					var_26_0.cleanChild = true

					warning("ClueMapMediator")
				end

				local var_26_1 = getProxy(ContextProxy):getContextByMediator(BossSinglePreCombatMediator)

				if var_26_1 then
					var_26_1.skipBack = true

					warning("BossSinglePreCombatMediator")
				end

				pg.m02:sendNotification(GAME.GO_BACK)
			end,
			stopReason = arg_24_1,
			rewards = var_24_2,
			isAutoFight = var_24_1,
			continuousBattleTimes = arg_24_0.continuousBattleTimes,
			totalBattleTimes = arg_24_0.totalBattleTimes
		}
	}))
end

local function var_0_5()
	local var_27_0 = pg.GuildMsgBoxMgr.GetInstance()

	if var_27_0:GetShouldShowBattleTip() then
		local var_27_1 = getProxy(GuildProxy):getRawData()
		local var_27_2 = var_27_1 and var_27_1:getWeeklyTask()

		if var_27_2 and var_27_2.id ~= 0 then
			var_27_0:SubmitTask(function(arg_28_0, arg_28_1)
				if arg_28_1 then
					var_27_0:CancelShouldShowBattleTip()
				end
			end)
		end
	end
end

function var_0_0.CheckActBossSystem(arg_29_0, arg_29_1)
	pg.m02:sendNotification(ContinuousOperationMediator.CONTINUE_OPERATION)

	if var_0_2(arg_29_1) > getProxy(PlayerProxy):getRawData().oil then
		var_0_3(arg_29_1, i18n("multiple_sorties_stop_reason1"))

		return
	end

	if getProxy(BayProxy):getShipCount() >= getProxy(PlayerProxy):getRawData():getMaxShipBag() then
		var_0_3(arg_29_1, i18n("multiple_sorties_stop_reason3"))

		return
	end

	local var_29_0 = getProxy(FleetProxy):getActivityFleets()[arg_29_1.actId][arg_29_1.mainFleetId]
	local var_29_1 = _.map(_.values(var_29_0.ships), function(arg_30_0)
		local var_30_0 = getProxy(BayProxy):getShipById(arg_30_0)

		if var_30_0 and var_30_0.energy == Ship.ENERGY_LOW then
			return var_30_0
		end
	end)

	if #var_29_1 > 0 then
		local var_29_2 = Fleet.DEFAULT_NAME_BOSS_ACT[arg_29_1.mainFleetId]
		local var_29_3 = _.map(var_29_1, function(arg_31_0)
			return "「" .. arg_31_0:getConfig("name") .. "」"
		end)

		var_0_3(arg_29_1, i18n("multiple_sorties_stop_reason2", var_29_2, table.concat(var_29_3, "")))

		return
	end

	if arg_29_1.statistics._battleScore <= ys.Battle.BattleConst.BattleScore.C then
		var_0_3(arg_29_1, i18n("multiple_sorties_stop_reason4"))

		return
	end

	var_0_5()

	local var_29_4 = getProxy(ContextProxy)
	local var_29_5 = getProxy(ContextProxy):getCurrentContext():getContextByMediator(ContinuousOperationMediator)

	if var_29_5 and not var_29_5.data.autoFlag then
		var_0_3(arg_29_1)

		return
	end

	if arg_29_1.continuousBattleTimes < 1 then
		var_0_3(arg_29_1)

		return
	end

	pg.m02:sendNotification(NewBattleResultMediator.ON_COMPLETE_BATTLE_RESULT)
end

function var_0_0.ContinuousBossRush(arg_32_0, arg_32_1, arg_32_2, arg_32_3, arg_32_4, arg_32_5, arg_32_6)
	seriesAsync({
		function(arg_33_0)
			arg_32_0:addSubLayers(Context.New({
				mediator = ChallengePassedMediator,
				viewComponent = BossRushConst.GetPassedLayer(arg_32_2),
				data = {
					curIndex = arg_32_3 - 1,
					maxIndex = #arg_32_4
				},
				onRemoved = arg_33_0
			}))
		end,
		function(arg_34_0)
			pg.m02:sendNotification(GAME.BEGIN_STAGE, {
				system = arg_32_1,
				actId = arg_32_2,
				continuousBattleTimes = arg_32_5,
				totalBattleTimes = arg_32_6
			})
		end
	})
end

function var_0_0.CheckBossRushSystem(arg_35_0, arg_35_1)
	local var_35_0 = getProxy(ContextProxy)
	local var_35_1 = arg_35_1.score > ys.Battle.BattleConst.BattleScore.C
	local var_35_2 = arg_35_1.actId
	local var_35_3 = getProxy(ActivityProxy):getActivityById(var_35_2):GetSeriesData()

	assert(var_35_3)

	local var_35_4 = var_35_3:GetStaegLevel() + 1
	local var_35_5 = var_35_3:GetExpeditionIds()

	if var_35_0:getCurrentContext():getContextByMediator(ContinuousOperationMediator) then
		var_0_5()
	end

	local var_35_6 = var_35_0:getCurrentContext():getContextByMediator(ContinuousOperationMediator)
	local var_35_7 = not var_35_6 or var_35_6.data.autoFlag
	local var_35_8 = not var_35_1 or var_35_4 > #var_35_5 or not var_35_7

	arg_35_0.contextData.isAutoFight = var_35_7

	if not var_35_8 then
		arg_35_0:ContinuousBossRush(arg_35_1.system, var_35_2, var_35_4, var_35_5, arg_35_1.continuousBattleTimes, arg_35_1.totalBattleTimes)
	end

	return var_35_8
end

local function var_0_6(arg_36_0)
	local var_36_0 = getProxy(ActivityProxy):getActivityById(arg_36_0.actId)
	local var_36_1 = var_36_0:GetEnemyDataByStageId(arg_36_0.stageId):GetOilLimit()
	local var_36_2 = getProxy(FleetProxy):getActivityFleets()[arg_36_0.actId]
	local var_36_3 = 0

	local function var_36_4(arg_37_0, arg_37_1)
		local var_37_0 = arg_37_0:GetCostSum().oil

		if arg_37_1 > 0 then
			var_37_0 = math.min(var_37_0, arg_37_1)
		end

		var_36_3 = var_36_3 + var_37_0
	end

	var_36_4(var_36_2[arg_36_0.mainFleetId], var_36_1[1] or 0)

	local var_36_5 = var_36_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_BOSSSINGLE_VARIABLE and Fleet.MEGA_SUBMARINE_FLEET_OFFSET or 10

	var_36_4(var_36_2[arg_36_0.mainFleetId + var_36_5], var_36_1[2] or 0)

	return var_36_3
end

function var_0_0.CheckBossSingleSystem(arg_38_0, arg_38_1)
	pg.m02:sendNotification(BossSingleContinuousOperationMediator.CONTINUE_OPERATION)

	if var_0_6(arg_38_1) > getProxy(PlayerProxy):getRawData().oil then
		var_0_4(arg_38_1, i18n("multiple_sorties_stop_reason1"))

		return
	end

	if getProxy(BayProxy):getShipCount() >= getProxy(PlayerProxy):getRawData():getMaxShipBag() then
		var_0_4(arg_38_1, i18n("multiple_sorties_stop_reason3"))

		return
	end

	local var_38_0 = getProxy(FleetProxy):getActivityFleets()[arg_38_1.actId][arg_38_1.mainFleetId]
	local var_38_1 = _.map(_.values(var_38_0.ships), function(arg_39_0)
		local var_39_0 = getProxy(BayProxy):getShipById(arg_39_0)

		if var_39_0 and var_39_0.energy == Ship.ENERGY_LOW then
			return var_39_0
		end
	end)

	if #var_38_1 > 0 then
		local var_38_2 = Fleet.DEFAULT_NAME_BOSS_ACT[arg_38_1.mainFleetId]
		local var_38_3 = _.map(var_38_1, function(arg_40_0)
			return "「" .. arg_40_0:getConfig("name") .. "」"
		end)

		var_0_4(arg_38_1, i18n("multiple_sorties_stop_reason2", var_38_2, table.concat(var_38_3, "")))

		return
	end

	if arg_38_1.statistics._battleScore <= ys.Battle.BattleConst.BattleScore.C then
		var_0_4(arg_38_1, i18n("multiple_sorties_stop_reason4"))

		return
	end

	var_0_5()

	local var_38_4 = getProxy(ContextProxy)
	local var_38_5 = getProxy(ContextProxy):getCurrentContext():getContextByMediator(BossSingleContinuousOperationMediator)

	if var_38_5 and not var_38_5.data.autoFlag then
		var_0_4(arg_38_1)

		return
	end

	if arg_38_1.continuousBattleTimes < 1 then
		var_0_4(arg_38_1)

		return
	end

	pg.m02:sendNotification(NewBattleResultMediator.ON_COMPLETE_BATTLE_RESULT)
end

local function var_0_7(arg_41_0, arg_41_1)
	local var_41_0 = getProxy(ActivityProxy):getActivityById(arg_41_0)
	local var_41_1 = var_41_0:getConfig("config_id")
	local var_41_2 = pg.activity_event_worldboss[var_41_1].ticket
	local var_41_3 = getProxy(PlayerProxy):getRawData():getResource(var_41_2)

	if var_41_0:GetStageBonus(arg_41_1) == 0 and getProxy(SettingsProxy):isTipActBossExchangeTicket() == 1 and var_41_3 > 0 then
		return true
	end

	return false
end

local function var_0_8(arg_42_0)
	pg.m02:sendNotification(GAME.BEGIN_STAGE, {
		stageId = arg_42_0.stageId,
		mainFleetId = arg_42_0.mainFleetId,
		system = arg_42_0.system,
		actId = arg_42_0.actId,
		rivalId = arg_42_0.rivalId,
		continuousBattleTimes = arg_42_0.continuousBattleTimes,
		variableBuffList = arg_42_0.variableBuffList,
		totalBattleTimes = arg_42_0.totalBattleTimes,
		useVariableTicket = arg_42_0.useVariableTicket
	})
end

function var_0_0.listNotificationInterests(arg_43_0)
	return {
		GAME.BOSSRUSH_SETTLE_DONE,
		ContinuousOperationMediator.ON_REENTER,
		BossSingleContinuousOperationMediator.ON_REENTER
	}
end

function var_0_0.handleNotification(arg_44_0, arg_44_1)
	local var_44_0 = arg_44_1:getName()
	local var_44_1 = arg_44_1:getBody()

	if var_44_0 == GAME.BOSSRUSH_SETTLE_DONE then
		arg_44_0:ExitRushBossSystem(arg_44_0.contextData, var_44_1)
	elseif var_44_0 == ContinuousOperationMediator.ON_REENTER then
		if not var_44_1.autoFlag then
			var_0_3(arg_44_0.contextData)

			return
		end

		if var_0_7(arg_44_0.contextData.actId, arg_44_0.contextData.stageId) then
			pg.m02:sendNotification(GAME.ACT_BOSS_EXCHANGE_TICKET, {
				stageId = arg_44_0.contextData.stageId
			})
		else
			var_0_8(arg_44_0.contextData)
		end
	elseif var_44_0 == BossSingleContinuousOperationMediator.ON_REENTER then
		if not var_44_1.autoFlag then
			var_0_4(arg_44_0.contextData)

			return
		end

		var_0_8(arg_44_0.contextData)
	end
end

function var_0_0.addSubLayers(arg_45_0, arg_45_1, arg_45_2, arg_45_3)
	assert(isa(arg_45_1, Context), "should be an instance of Context")

	local var_45_0 = getProxy(ContextProxy):getCurrentContext():getContextByMediator(NewBattleResultMediator)

	if arg_45_2 then
		while var_45_0.parent do
			var_45_0 = var_45_0.parent
		end
	end

	arg_45_0:sendNotification(GAME.LOAD_LAYERS, {
		parentContext = var_45_0,
		context = arg_45_1,
		callback = arg_45_3
	})
end

function var_0_0.Dispose(arg_46_0)
	pg.m02:removeMediator(arg_46_0.__cname)
end

return var_0_0
