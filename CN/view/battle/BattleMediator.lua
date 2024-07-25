local var_0_0 = class("BattleMediator", import("..base.ContextMediator"))

var_0_0.ON_BATTLE_RESULT = "BattleMediator:ON_BATTLE_RESULT"
var_0_0.ON_PAUSE = "BattleMediator:ON_PAUSE"
var_0_0.ENTER = "BattleMediator:ENTER"
var_0_0.ON_BACK_PRE_SCENE = "BattleMediator:ON_BACK_PRE_SCENE"
var_0_0.ON_LEAVE = "BattleMediator:ON_LEAVE"
var_0_0.ON_QUIT_BATTLE_MANUALLY = "BattleMediator:ON_QUIT_BATTLE_MANUALLY"
var_0_0.HIDE_ALL_BUTTONS = "BattleMediator:HIDE_ALL_BUTTONS"
var_0_0.ON_CHAT = "BattleMediator:ON_CHAT"
var_0_0.CLOSE_CHAT = "BattleMediator:CLOSE_CHAT"
var_0_0.ON_AUTO = "BattleMediator:ON_AUTO"
var_0_0.UPDATE_AUTO_COUNT = "BattleMediator:UPDATE_AUTO_COUNT"
var_0_0.ON_PUZZLE_RELIC = "BattleMediator.ON_PUZZLE_RELIC"
var_0_0.ON_PUZZLE_CARD = "BattleMediator.ON_PUZZLE_CARD"

function var_0_0.register(arg_1_0)
	pg.BrightnessMgr.GetInstance():SetScreenNeverSleep(true)
	arg_1_0:GenBattleData()

	arg_1_0.contextData.battleData = arg_1_0._battleData

	local var_1_0 = ys.Battle.BattleState.GetInstance()
	local var_1_1 = arg_1_0.contextData.system

	arg_1_0:bind(var_0_0.ON_BATTLE_RESULT, function(arg_2_0, arg_2_1)
		arg_1_0:sendNotification(GAME.FINISH_STAGE, {
			token = arg_1_0.contextData.token,
			mainFleetId = arg_1_0.contextData.mainFleetId,
			stageId = arg_1_0.contextData.stageId,
			rivalId = arg_1_0.contextData.rivalId,
			memory = arg_1_0.contextData.memory,
			bossId = arg_1_0.contextData.bossId,
			exitCallback = arg_1_0.contextData.exitCallback,
			system = var_1_1,
			statistics = arg_2_1,
			actId = arg_1_0.contextData.actId,
			mode = arg_1_0.contextData.mode,
			puzzleCombatID = arg_1_0.contextData.puzzleCombatID
		})
	end)
	arg_1_0:bind(var_0_0.ON_AUTO, function(arg_3_0, arg_3_1)
		arg_1_0:onAutoBtn(arg_3_1)
	end)
	arg_1_0:bind(var_0_0.ON_PAUSE, function(arg_4_0)
		arg_1_0:onPauseBtn()
	end)
	arg_1_0:bind(var_0_0.ON_LEAVE, function(arg_5_0)
		arg_1_0:warnFunc()
	end)
	arg_1_0:bind(var_0_0.ON_CHAT, function(arg_6_0, arg_6_1)
		arg_1_0:addSubLayers(Context.New({
			mediator = NotificationMediator,
			viewComponent = NotificationLayer,
			data = {
				form = NotificationLayer.FORM_BATTLE,
				chatViewParent = arg_6_1
			}
		}))
	end)
	arg_1_0:bind(var_0_0.ENTER, function(arg_7_0)
		var_1_0:EnterBattle(arg_1_0._battleData, arg_1_0.contextData.prePause)
	end)
	arg_1_0:bind(var_0_0.ON_BACK_PRE_SCENE, function()
		local var_8_0 = getProxy(ContextProxy)
		local var_8_1 = var_8_0:getContextByMediator(DailyLevelMediator)
		local var_8_2 = var_8_0:getContextByMediator(LevelMediator2)
		local var_8_3 = var_8_0:getContextByMediator(ChallengeMainMediator)
		local var_8_4 = var_8_0:getContextByMediator(ActivityBossMediatorTemplate)
		local var_8_5 = var_8_0:getContextByMediator(WorldMediator)
		local var_8_6 = var_8_0:getContextByMediator(WorldBossMediator)

		if var_8_6 and arg_1_0.contextData.bossId then
			arg_1_0:sendNotification(GAME.WORLD_BOSS_BATTLE_QUIT, {
				id = arg_1_0.contextData.bossId
			})

			local var_8_7 = var_8_6:getContextByMediator(WorldBossFormationMediator)

			if var_8_7 then
				var_8_6:removeChild(var_8_7)
			end
		elseif var_8_5 then
			local var_8_8 = var_8_5:getContextByMediator(WorldPreCombatMediator) or var_8_5:getContextByMediator(WorldBossInformationMediator)

			if var_8_8 then
				var_8_5:removeChild(var_8_8)
			end
		elseif var_8_1 then
			local var_8_9 = var_8_1:getContextByMediator(PreCombatMediator)

			var_8_1:removeChild(var_8_9)
		elseif var_8_3 then
			arg_1_0:sendNotification(GAME.CHALLENGE2_RESET, {
				mode = arg_1_0.contextData.mode
			})

			local var_8_10 = var_8_3:getContextByMediator(ChallengePreCombatMediator)

			var_8_3:removeChild(var_8_10)
		elseif var_8_2 then
			if var_1_1 == SYSTEM_DUEL then
				-- block empty
			elseif var_1_1 == SYSTEM_SCENARIO then
				local var_8_11 = var_8_2:getContextByMediator(ChapterPreCombatMediator)

				if var_8_11 then
					var_8_2:removeChild(var_8_11)
				end
			elseif var_1_1 ~= SYSTEM_PERFORM and var_1_1 ~= SYSTEM_SIMULATION then
				local var_8_12 = var_8_2:getContextByMediator(PreCombatMediator)

				if var_8_12 then
					var_8_2:removeChild(var_8_12)
				end
			end
		elseif var_8_4 then
			local var_8_13 = var_8_4:getContextByMediator(PreCombatMediator)

			if var_8_13 then
				var_8_4:removeChild(var_8_13)
			end
		end

		arg_1_0:sendNotification(GAME.GO_BACK)
	end)
	arg_1_0:bind(var_0_0.ON_QUIT_BATTLE_MANUALLY, function(arg_9_0)
		if var_1_1 == SYSTEM_SCENARIO then
			getProxy(ChapterProxy):StopAutoFight(ChapterConst.AUTOFIGHT_STOP_REASON.MANUAL)
		elseif var_1_1 == SYSTEM_WORLD then
			nowWorld():TriggerAutoFight(false)
		elseif var_1_1 == SYSTEM_ACT_BOSS then
			if getProxy(ContextProxy):getCurrentContext():getContextByMediator(ContinuousOperationMediator) then
				getProxy(ContextProxy):GetPrevContext(1):addChild(Context.New({
					mediator = ActivityBossTotalRewardPanelMediator,
					viewComponent = ActivityBossTotalRewardPanel,
					data = {
						isAutoFight = false,
						isLayer = true,
						rewards = getProxy(ChapterProxy):PopActBossRewards(),
						continuousBattleTimes = arg_1_0.contextData.continuousBattleTimes,
						totalBattleTimes = arg_1_0.contextData.totalBattleTimes
					}
				}))
			end
		elseif var_1_1 == SYSTEM_BOSS_RUSH then
			if getProxy(ContextProxy):getCurrentContext():getContextByMediator(ContinuousOperationMediator) then
				local var_9_0 = getProxy(ActivityProxy):PopBossRushAwards()

				getProxy(ContextProxy):GetPrevContext(1):addChild(Context.New({
					mediator = BossRushTotalRewardPanelMediator,
					viewComponent = BossRushTotalRewardPanel,
					data = {
						isAutoFight = false,
						isLayer = true,
						rewards = var_9_0
					}
				}))
			end
		elseif var_1_1 == SYSTEM_BOSS_SINGLE and getProxy(ContextProxy):getCurrentContext():getContextByMediator(BossSingleContinuousOperationMediator) then
			getProxy(ContextProxy):GetPrevContext(1):addChild(Context.New({
				mediator = BossSingleTotalRewardPanelMediator,
				viewComponent = BossSingleTotalRewardPanel,
				data = {
					isAutoFight = false,
					isLayer = true,
					rewards = getProxy(ChapterProxy):PopBossSingleRewards(),
					continuousBattleTimes = arg_1_0.contextData.continuousBattleTimes,
					totalBattleTimes = arg_1_0.contextData.totalBattleTimes
				}
			}))
		end
	end)
	arg_1_0:bind(var_0_0.ON_PUZZLE_RELIC, function(arg_10_0, arg_10_1)
		arg_1_0:addSubLayers(Context.New({
			mediator = CardPuzzleRelicDeckMediator,
			viewComponent = CardPuzzleRelicDeckLayerCombat,
			data = arg_10_1
		}))
		var_1_0:Pause()
	end)
	arg_1_0:bind(var_0_0.ON_PUZZLE_CARD, function(arg_11_0, arg_11_1)
		arg_1_0:addSubLayers(Context.New({
			mediator = CardPuzzleCardDeckMediator,
			viewComponent = CardPuzzleCardDeckLayerCombat,
			data = arg_11_1
		}))
		var_1_0:Pause()
	end)

	if arg_1_0.contextData.continuousBattleTimes and arg_1_0.contextData.continuousBattleTimes > 0 then
		if var_1_1 == SYSTEM_BOSS_SINGLE then
			if not getProxy(ContextProxy):getCurrentContext():getContextByMediator(BossSingleContinuousOperationMediator) then
				local var_1_2 = CreateShell(arg_1_0.contextData)

				var_1_2.LayerWeightMgr_weight = LayerWeightConst.BASE_LAYER

				arg_1_0:addSubLayers(Context.New({
					mediator = BossSingleContinuousOperationMediator,
					viewComponent = BossSingleContinuousOperationPanel,
					data = var_1_2
				}))
			end
		elseif not getProxy(ContextProxy):getCurrentContext():getContextByMediator(ContinuousOperationMediator) then
			local var_1_3 = CreateShell(arg_1_0.contextData)

			var_1_3.LayerWeightMgr_weight = LayerWeightConst.BASE_LAYER

			arg_1_0:addSubLayers(Context.New({
				mediator = ContinuousOperationMediator,
				viewComponent = ContinuousOperationPanel,
				data = var_1_3
			}))
		end

		arg_1_0.contextData.battleData.hideAllButtons = true
	end

	local var_1_4 = getProxy(PlayerProxy)

	if var_1_4 then
		arg_1_0.player = var_1_4:getData()

		var_1_4:setFlag("battle", true)
	end
end

function var_0_0.onAutoBtn(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_1.isOn
	local var_12_1 = arg_12_1.toggle
	local var_12_2 = arg_12_1.system

	arg_12_0:sendNotification(GAME.AUTO_BOT, {
		isActiveBot = var_12_0,
		toggle = var_12_1,
		system = var_12_2
	})
end

function var_0_0.updateAutoCount(arg_13_0, arg_13_1)
	local var_13_0 = ys.Battle.BattleState.GetInstance():GetProxyByName(ys.Battle.BattleDataProxy.__name):AutoStatistics(arg_13_1.isOn)
end

function var_0_0.onPauseBtn(arg_14_0)
	local var_14_0 = ys.Battle.BattleState.GetInstance()

	if arg_14_0.contextData.system == SYSTEM_PROLOGUE or arg_14_0.contextData.system == SYSTEM_PERFORM then
		local var_14_1 = {}

		if EPILOGUE_SKIPPABLE then
			local var_14_2 = {
				text = "关爱胡德",
				btnType = pg.MsgboxMgr.BUTTON_RED,
				onCallback = function()
					var_14_0:Deactive()
					arg_14_0:sendNotification(GAME.CHANGE_SCENE, SCENE.CREATE_PLAYER)
				end
			}

			table.insert(var_14_1, 1, var_14_2)
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("help_battle_rule"),
			onClose = function()
				ys.Battle.BattleState.GetInstance():Resume()
			end,
			onNo = function()
				ys.Battle.BattleState.GetInstance():Resume()
			end,
			custom = var_14_1
		})
		var_14_0:Pause()
	elseif arg_14_0.contextData.system == SYSTEM_DODGEM then
		local var_14_3 = {
			text = "text_cancel_fight",
			btnType = pg.MsgboxMgr.BUTTON_RED,
			onCallback = function()
				arg_14_0:warnFunc(function()
					ys.Battle.BattleState.GetInstance():Resume()
				end)
			end
		}

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("help_battle_warspite"),
			onClose = function()
				ys.Battle.BattleState.GetInstance():Resume()
			end,
			onNo = function()
				ys.Battle.BattleState.GetInstance():Resume()
			end,
			custom = {
				var_14_3
			}
		})
		var_14_0:Pause()
	elseif arg_14_0.contextData.system == SYSTEM_SIMULATION then
		local var_14_4 = {
			text = "text_cancel_fight",
			btnType = pg.MsgboxMgr.BUTTON_RED,
			onCallback = function()
				arg_14_0:warnFunc(function()
					ys.Battle.BattleState.GetInstance():Resume()
				end)
			end
		}

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("help_battle_rule"),
			onClose = function()
				ys.Battle.BattleState.GetInstance():Resume()
			end,
			onNo = function()
				ys.Battle.BattleState.GetInstance():Resume()
			end,
			custom = {
				var_14_4
			}
		})
		var_14_0:Pause()
	elseif arg_14_0.contextData.system == SYSTEM_SUBMARINE_RUN or arg_14_0.contextData.system == SYSTEM_SUB_ROUTINE or arg_14_0.contextData.system == SYSTEM_REWARD_PERFORM or arg_14_0.contextData.system == SYSTEM_AIRFIGHT then
		var_14_0:Pause()
		arg_14_0:warnFunc(function()
			ys.Battle.BattleState.GetInstance():Resume()
		end)
	elseif arg_14_0.contextData.system == SYSTEM_CARDPUZZLE then
		arg_14_0:addSubLayers(Context.New({
			mediator = CardPuzzleCombatPauseMediator,
			viewComponent = CardPuzzleCombatPauseLayer
		}))
		var_14_0:Pause()
	else
		arg_14_0.viewComponent:updatePauseWindow()
		var_14_0:Pause()
	end
end

function var_0_0.warnFunc(arg_27_0, arg_27_1)
	local var_27_0 = ys.Battle.BattleState.GetInstance()
	local var_27_1 = arg_27_0.contextData.system
	local var_27_2
	local var_27_3

	local function var_27_4()
		var_27_0:Stop()
	end

	local var_27_5 = arg_27_0.contextData.warnMsg

	if var_27_5 and #var_27_5 > 0 then
		var_27_3 = i18n(var_27_5)
	elseif var_27_1 == SYSTEM_CHALLENGE then
		var_27_3 = i18n("battle_battleMediator_clear_warning")
	elseif var_27_1 == SYSTEM_SIMULATION then
		var_27_3 = i18n("tech_simulate_quit")
	else
		var_27_3 = i18n("battle_battleMediator_quest_exist")
	end

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		modal = true,
		hideNo = true,
		hideYes = true,
		content = var_27_3,
		onClose = arg_27_1,
		custom = {
			{
				text = "text_cancel",
				onCallback = arg_27_1,
				sound = SFX_CANCEL
			},
			{
				text = "text_exit",
				btnType = pg.MsgboxMgr.BUTTON_RED,
				onCallback = var_27_4,
				sound = SFX_CONFIRM
			}
		}
	})
end

function var_0_0.guideDispatch(arg_29_0)
	return
end

local function var_0_1(arg_30_0, arg_30_1, arg_30_2, arg_30_3)
	local var_30_0 = {}

	for iter_30_0, iter_30_1 in ipairs(arg_30_1:getActiveEquipments()) do
		if iter_30_1 then
			var_30_0[#var_30_0 + 1] = {
				id = iter_30_1.configId,
				skin = iter_30_1.skinId,
				equipmentInfo = iter_30_1
			}
		else
			var_30_0[#var_30_0 + 1] = {
				skin = 0,
				id = iter_30_1,
				equipmentInfo = iter_30_1
			}
		end
	end

	local var_30_1 = {}

	local function var_30_2(arg_31_0)
		local var_31_0 = {
			level = arg_31_0.level
		}
		local var_31_1 = arg_31_0.id
		local var_31_2 = arg_30_1:RemapSkillId(var_31_1)

		var_31_0.id = ys.Battle.BattleDataFunction.SkillTranform(arg_30_0, var_31_2)

		return var_31_0
	end

	local var_30_3 = ys.Battle.BattleDataFunction.GenerateHiddenBuff(arg_30_1.configId)

	for iter_30_2, iter_30_3 in pairs(var_30_3) do
		local var_30_4 = var_30_2(iter_30_3)

		var_30_1[var_30_4.id] = var_30_4
	end

	for iter_30_4, iter_30_5 in pairs(arg_30_1.skills) do
		if iter_30_5 and iter_30_5.id == 14900 and not arg_30_1.transforms[16412] then
			-- block empty
		else
			local var_30_5 = var_30_2(iter_30_5)

			var_30_1[var_30_5.id] = var_30_5
		end
	end

	local var_30_6 = ys.Battle.BattleDataFunction.GetEquipSkill(var_30_0)

	for iter_30_6, iter_30_7 in ipairs(var_30_6) do
		local var_30_7 = {}

		var_30_7.level = 1
		var_30_7.id = ys.Battle.BattleDataFunction.SkillTranform(arg_30_0, iter_30_7)
		var_30_1[var_30_7.id] = var_30_7
	end

	local var_30_8

	;(function()
		var_30_8 = arg_30_1:GetSpWeapon()

		if not var_30_8 then
			return
		end

		local var_32_0 = var_30_8:GetEffect()

		if var_32_0 == 0 then
			return
		end

		local var_32_1 = {}

		var_32_1.level = 1
		var_32_1.id = ys.Battle.BattleDataFunction.SkillTranform(arg_30_0, var_32_0)
		var_30_1[var_32_1.id] = var_32_1
	end)()

	for iter_30_8, iter_30_9 in pairs(arg_30_1:getTriggerSkills()) do
		local var_30_9 = {
			level = iter_30_9.level,
			id = ys.Battle.BattleDataFunction.SkillTranform(arg_30_0, iter_30_9.id)
		}

		var_30_1[var_30_9.id] = var_30_9
	end

	local var_30_10 = arg_30_0 == SYSTEM_WORLD
	local var_30_11 = false

	if var_30_10 then
		local var_30_12 = WorldConst.FetchWorldShip(arg_30_1.id)

		if var_30_12 then
			var_30_11 = var_30_12:IsBroken()
		end
	end

	if var_30_11 then
		for iter_30_10, iter_30_11 in pairs(var_30_1) do
			local var_30_13 = pg.skill_data_template[iter_30_10].world_death_mark[1]

			if var_30_13 == ys.Battle.BattleConst.DEATH_MARK_SKILL.DEACTIVE then
				var_30_1[iter_30_10] = nil
			elseif var_30_13 == ys.Battle.BattleConst.DEATH_MARK_SKILL.IGNORE then
				-- block empty
			end
		end
	end

	return {
		id = arg_30_1.id,
		tmpID = arg_30_1.configId,
		skinId = arg_30_1.skinId,
		level = arg_30_1.level,
		equipment = var_30_0,
		properties = arg_30_1:getProperties(arg_30_2, arg_30_3, var_30_10),
		baseProperties = arg_30_1:getShipProperties(),
		proficiency = arg_30_1:getEquipProficiencyList(),
		rarity = arg_30_1:getRarity(),
		intimacy = arg_30_1:getCVIntimacy(),
		shipGS = arg_30_1:getShipCombatPower(),
		skills = var_30_1,
		baseList = arg_30_1:getBaseList(),
		preloasList = arg_30_1:getPreLoadCount(),
		name = arg_30_1:getName(),
		deathMark = var_30_11,
		spWeapon = var_30_8
	}
end

local function var_0_2(arg_33_0, arg_33_1)
	local var_33_0 = arg_33_0:getProperties(arg_33_1)
	local var_33_1 = arg_33_0:getConfig("id")

	return {
		deathMark = false,
		shipGS = 100,
		rarity = 1,
		intimacy = 100,
		id = var_33_1,
		tmpID = var_33_1,
		skinId = arg_33_0:getConfig("skin_id"),
		level = arg_33_0:getConfig("level"),
		equipment = arg_33_0:getConfig("default_equip"),
		properties = var_33_0,
		baseProperties = var_33_0,
		proficiency = {
			1,
			1,
			1
		},
		skills = {},
		baseList = {
			1,
			1,
			1
		},
		preloasList = {
			0,
			0,
			0
		},
		name = var_33_1,
		fleetIndex = arg_33_0:getConfig("location")
	}
end

function var_0_0.GenBattleData(arg_34_0)
	local var_34_0 = {}
	local var_34_1 = arg_34_0.contextData.system

	arg_34_0._battleData = var_34_0
	var_34_0.battleType = arg_34_0.contextData.system
	var_34_0.StageTmpId = arg_34_0.contextData.stageId
	var_34_0.CMDArgs = arg_34_0.contextData.cmdArgs
	var_34_0.MainUnitList = {}
	var_34_0.VanguardUnitList = {}
	var_34_0.SubUnitList = {}
	var_34_0.AidUnitList = {}
	var_34_0.SupportUnitList = {}
	var_34_0.SubFlag = -1
	var_34_0.ActID = arg_34_0.contextData.actId
	var_34_0.bossLevel = arg_34_0.contextData.bossLevel
	var_34_0.bossConfigId = arg_34_0.contextData.bossConfigId

	if pg.battle_cost_template[var_34_1].global_buff_effected > 0 then
		local var_34_2 = BuffHelper.GetBattleBuffs(var_34_1)

		var_34_0.GlobalBuffIDs = _.map(var_34_2, function(arg_35_0)
			return arg_35_0:getConfig("benefit_effect")
		end) or {}
	end

	local var_34_3 = pg.battle_cost_template[var_34_1]
	local var_34_4 = getProxy(BayProxy)
	local var_34_5 = {}

	if var_34_1 == SYSTEM_SCENARIO then
		local var_34_6 = getProxy(ChapterProxy)
		local var_34_7 = var_34_6:getActiveChapter()

		var_34_0.RepressInfo = var_34_7:getRepressInfo()

		arg_34_0.viewComponent:setChapter(var_34_7)

		local var_34_8 = var_34_7.fleet

		var_34_0.KizunaJamming = var_34_7.extraFlagList
		var_34_0.DefeatCount = var_34_8:getDefeatCount()
		var_34_0.ChapterBuffIDs, var_34_0.CommanderList = var_34_7:getFleetBattleBuffs(var_34_8)
		var_34_0.StageWaveFlags = var_34_7:GetStageFlags()
		var_34_0.ChapterWeatherIDS = var_34_7:GetWeather(var_34_8.line.row, var_34_8.line.column)
		var_34_0.MapAuraSkills = var_34_6.GetChapterAuraBuffs(var_34_7)
		var_34_0.MapAidSkills = {}

		local var_34_9 = var_34_6.GetChapterAidBuffs(var_34_7)

		for iter_34_0, iter_34_1 in pairs(var_34_9) do
			local var_34_10 = var_34_7:getFleetByShipVO(iter_34_0)
			local var_34_11 = _.values(var_34_10:getCommanders())
			local var_34_12 = var_0_1(var_34_1, iter_34_0, var_34_11)

			table.insert(var_34_0.AidUnitList, var_34_12)

			for iter_34_2, iter_34_3 in ipairs(iter_34_1) do
				table.insert(var_34_0.MapAidSkills, iter_34_3)
			end
		end

		local var_34_13 = var_34_8:getShipsByTeam(TeamType.Main, false)
		local var_34_14 = var_34_8:getShipsByTeam(TeamType.Vanguard, false)
		local var_34_15 = {}
		local var_34_16 = _.values(var_34_8:getCommanders())
		local var_34_17 = {}
		local var_34_18, var_34_19 = var_34_6.getSubAidFlag(var_34_7, arg_34_0.contextData.stageId)

		if var_34_18 == true or var_34_18 > 0 then
			var_34_0.SubFlag = 1
			var_34_0.TotalSubAmmo = 1
			var_34_15 = var_34_19:getShipsByTeam(TeamType.Submarine, false)
			var_34_17 = _.values(var_34_19:getCommanders())

			local var_34_20, var_34_21 = var_34_7:getFleetBattleBuffs(var_34_19)

			var_34_0.SubCommanderList = var_34_21
		else
			var_34_0.SubFlag = var_34_18

			if var_34_18 ~= ys.Battle.BattleConst.SubAidFlag.AID_EMPTY then
				var_34_0.TotalSubAmmo = 0
			end
		end

		arg_34_0.mainShips = {}

		local function var_34_22(arg_36_0, arg_36_1, arg_36_2)
			local var_36_0 = arg_36_0.id
			local var_36_1 = arg_36_0.hpRant * 0.0001

			if table.contains(var_34_5, var_36_0) then
				BattleVertify.cloneShipVertiry = true
			end

			var_34_5[#var_34_5 + 1] = var_36_0

			local var_36_2 = var_0_1(var_34_1, arg_36_0, arg_36_1)

			var_36_2.initHPRate = var_36_1

			table.insert(arg_34_0.mainShips, arg_36_0)
			table.insert(arg_36_2, var_36_2)
		end

		for iter_34_4, iter_34_5 in ipairs(var_34_13) do
			var_34_22(iter_34_5, var_34_16, var_34_0.MainUnitList)
		end

		for iter_34_6, iter_34_7 in ipairs(var_34_14) do
			var_34_22(iter_34_7, var_34_16, var_34_0.VanguardUnitList)
		end

		for iter_34_8, iter_34_9 in ipairs(var_34_15) do
			var_34_22(iter_34_9, var_34_17, var_34_0.SubUnitList)
		end

		local var_34_23 = var_34_7:getChapterSupportFleet()

		if var_34_23 then
			local var_34_24 = var_34_23:getShips()

			for iter_34_10, iter_34_11 in pairs(var_34_24) do
				var_34_22(iter_34_11, {}, var_34_0.SupportUnitList)
			end
		end

		arg_34_0.viewComponent:setFleet(var_34_13, var_34_14, var_34_15)
	elseif var_34_1 == SYSTEM_CHALLENGE then
		local var_34_25 = arg_34_0.contextData.mode
		local var_34_26 = getProxy(ChallengeProxy):getUserChallengeInfo(var_34_25)

		var_34_0.ChallengeInfo = var_34_26

		arg_34_0.viewComponent:setChapter(var_34_26)

		local var_34_27 = var_34_26:getRegularFleet()

		var_34_0.CommanderList = var_34_27:buildBattleBuffList()

		local var_34_28 = _.values(var_34_27:getCommanders())
		local var_34_29 = {}
		local var_34_30 = var_34_27:getShipsByTeam(TeamType.Main, false)
		local var_34_31 = var_34_27:getShipsByTeam(TeamType.Vanguard, false)
		local var_34_32 = {}
		local var_34_33 = var_34_26:getSubmarineFleet()
		local var_34_34 = var_34_33:getShipsByTeam(TeamType.Submarine, false)

		if #var_34_34 > 0 then
			var_34_0.SubFlag = 1
			var_34_0.TotalSubAmmo = 1
			var_34_29 = _.values(var_34_33:getCommanders())
			var_34_0.SubCommanderList = var_34_33:buildBattleBuffList()
		else
			var_34_0.SubFlag = 0
			var_34_0.TotalSubAmmo = 0
		end

		arg_34_0.mainShips = {}

		local function var_34_35(arg_37_0, arg_37_1, arg_37_2)
			local var_37_0 = arg_37_0.id
			local var_37_1 = arg_37_0.hpRant * 0.0001

			if table.contains(var_34_5, var_37_0) then
				BattleVertify.cloneShipVertiry = true
			end

			var_34_5[#var_34_5 + 1] = var_37_0

			local var_37_2 = var_0_1(var_34_1, arg_37_0, arg_37_1)

			var_37_2.initHPRate = var_37_1

			table.insert(arg_34_0.mainShips, arg_37_0)
			table.insert(arg_37_2, var_37_2)
		end

		for iter_34_12, iter_34_13 in ipairs(var_34_30) do
			var_34_35(iter_34_13, var_34_28, var_34_0.MainUnitList)
		end

		for iter_34_14, iter_34_15 in ipairs(var_34_31) do
			var_34_35(iter_34_15, var_34_28, var_34_0.VanguardUnitList)
		end

		for iter_34_16, iter_34_17 in ipairs(var_34_34) do
			var_34_35(iter_34_17, var_34_29, var_34_0.SubUnitList)
		end

		arg_34_0.viewComponent:setFleet(var_34_30, var_34_31, var_34_34)
	elseif var_34_1 == SYSTEM_WORLD then
		local var_34_36 = nowWorld()
		local var_34_37 = var_34_36:GetActiveMap()
		local var_34_38 = var_34_37:GetFleet()
		local var_34_39 = var_34_37:GetCell(var_34_38.row, var_34_38.column):GetStageEnemy()

		if arg_34_0.contextData.hpRate then
			var_34_0.RepressInfo = {
				repressEnemyHpRant = arg_34_0.contextData.hpRate
			}
		end

		var_34_0.AffixBuffList = table.mergeArray(var_34_39:GetBattleLuaBuffs(), var_34_37:GetBattleLuaBuffs(WorldMap.FactionEnemy, var_34_39))

		local function var_34_40(arg_38_0)
			local var_38_0 = {}

			for iter_38_0, iter_38_1 in ipairs(arg_38_0) do
				local var_38_1 = {
					id = ys.Battle.BattleDataFunction.SkillTranform(var_34_1, iter_38_1.id),
					level = iter_38_1.level
				}

				table.insert(var_38_0, var_38_1)
			end

			return var_38_0
		end

		var_34_0.DefeatCount = var_34_38:getDefeatCount()
		var_34_0.ChapterBuffIDs, var_34_0.CommanderList = var_34_37:getFleetBattleBuffs(var_34_38, true)
		var_34_0.MapAuraSkills = var_34_37:GetChapterAuraBuffs()
		var_34_0.MapAuraSkills = var_34_40(var_34_0.MapAuraSkills)
		var_34_0.MapAidSkills = {}

		local var_34_41 = var_34_37:GetChapterAidBuffs()

		for iter_34_18, iter_34_19 in pairs(var_34_41) do
			local var_34_42 = var_34_37:GetFleet(iter_34_18.fleetId)
			local var_34_43 = _.values(var_34_42:getCommanders(true))
			local var_34_44 = var_0_1(var_34_1, WorldConst.FetchShipVO(iter_34_18.id), var_34_43)

			table.insert(var_34_0.AidUnitList, var_34_44)

			var_34_0.MapAidSkills = table.mergeArray(var_34_0.MapAidSkills, var_34_40(iter_34_19))
		end

		local var_34_45 = var_34_38:GetTeamShipVOs(TeamType.Main, false)
		local var_34_46 = var_34_38:GetTeamShipVOs(TeamType.Vanguard, false)
		local var_34_47 = {}
		local var_34_48 = _.values(var_34_38:getCommanders(true))
		local var_34_49 = {}
		local var_34_50 = var_34_36:GetSubAidFlag()

		if var_34_50 == true then
			local var_34_51 = var_34_37:GetSubmarineFleet()

			var_34_0.SubFlag = 1
			var_34_0.TotalSubAmmo = 1
			var_34_47 = var_34_51:GetTeamShipVOs(TeamType.Submarine, false)
			var_34_49 = _.values(var_34_51:getCommanders(true))

			local var_34_52, var_34_53 = var_34_37:getFleetBattleBuffs(var_34_51, true)

			var_34_0.SubCommanderList = var_34_53
		else
			var_34_0.SubFlag = 0

			if var_34_50 ~= ys.Battle.BattleConst.SubAidFlag.AID_EMPTY then
				var_34_0.TotalSubAmmo = 0
			end
		end

		arg_34_0.mainShips = {}

		for iter_34_20, iter_34_21 in ipairs(var_34_45) do
			local var_34_54 = iter_34_21.id
			local var_34_55 = WorldConst.FetchWorldShip(iter_34_21.id).hpRant * 0.0001

			if table.contains(var_34_5, var_34_54) then
				BattleVertify.cloneShipVertiry = true
			end

			var_34_5[#var_34_5 + 1] = var_34_54

			local var_34_56 = var_0_1(var_34_1, iter_34_21, var_34_48)

			var_34_56.initHPRate = var_34_55

			table.insert(arg_34_0.mainShips, iter_34_21)
			table.insert(var_34_0.MainUnitList, var_34_56)
		end

		for iter_34_22, iter_34_23 in ipairs(var_34_46) do
			local var_34_57 = iter_34_23.id
			local var_34_58 = WorldConst.FetchWorldShip(iter_34_23.id).hpRant * 0.0001

			if table.contains(var_34_5, var_34_57) then
				BattleVertify.cloneShipVertiry = true
			end

			var_34_5[#var_34_5 + 1] = var_34_57

			local var_34_59 = var_0_1(var_34_1, iter_34_23, var_34_48)

			var_34_59.initHPRate = var_34_58

			table.insert(arg_34_0.mainShips, iter_34_23)
			table.insert(var_34_0.VanguardUnitList, var_34_59)
		end

		for iter_34_24, iter_34_25 in ipairs(var_34_47) do
			local var_34_60 = iter_34_25.id
			local var_34_61 = WorldConst.FetchWorldShip(iter_34_25.id).hpRant * 0.0001

			if table.contains(var_34_5, var_34_60) then
				BattleVertify.cloneShipVertiry = true
			end

			var_34_5[#var_34_5 + 1] = var_34_60

			local var_34_62 = var_0_1(var_34_1, iter_34_25, var_34_49)

			var_34_62.initHPRate = var_34_61

			table.insert(arg_34_0.mainShips, iter_34_25)
			table.insert(var_34_0.SubUnitList, var_34_62)
		end

		arg_34_0.viewComponent:setFleet(var_34_45, var_34_46, var_34_47)

		local var_34_63 = pg.expedition_data_template[arg_34_0.contextData.stageId]

		if var_34_63.difficulty == ys.Battle.BattleConst.Difficulty.WORLD then
			var_34_0.WorldMapId = var_34_37.config.expedition_map_id
			var_34_0.WorldLevel = WorldConst.WorldLevelCorrect(var_34_37.config.expedition_level, var_34_63.type)
		end
	elseif var_34_1 == SYSTEM_WORLD_BOSS then
		local var_34_64 = nowWorld():GetBossProxy()
		local var_34_65 = arg_34_0.contextData.bossId
		local var_34_66 = var_34_64:GetFleet(var_34_65)
		local var_34_67 = var_34_64:GetBossById(var_34_65)

		assert(var_34_67, var_34_65)

		if arg_34_0.contextData.hpRate then
			var_34_0.RepressInfo = {
				repressEnemyHpRant = arg_34_0.contextData.hpRate
			}
		end

		local var_34_68 = _.values(var_34_66:getCommanders())

		var_34_0.CommanderList = var_34_66:buildBattleBuffList()
		arg_34_0.mainShips = var_34_4:getShipsByFleet(var_34_66)

		local var_34_69 = {}
		local var_34_70 = {}
		local var_34_71 = {}
		local var_34_72 = var_34_66:getTeamByName(TeamType.Main)

		for iter_34_26, iter_34_27 in ipairs(var_34_72) do
			if table.contains(var_34_5, iter_34_27) then
				BattleVertify.cloneShipVertiry = true
			end

			var_34_5[#var_34_5 + 1] = iter_34_27

			local var_34_73 = var_34_4:getShipById(iter_34_27)
			local var_34_74 = var_0_1(var_34_1, var_34_73, var_34_68)

			table.insert(var_34_69, var_34_73)
			table.insert(var_34_0.MainUnitList, var_34_74)
		end

		local var_34_75 = var_34_66:getTeamByName(TeamType.Vanguard)

		for iter_34_28, iter_34_29 in ipairs(var_34_75) do
			if table.contains(var_34_5, iter_34_29) then
				BattleVertify.cloneShipVertiry = true
			end

			var_34_5[#var_34_5 + 1] = iter_34_29

			local var_34_76 = var_34_4:getShipById(iter_34_29)
			local var_34_77 = var_0_1(var_34_1, var_34_76, var_34_68)

			table.insert(var_34_70, var_34_76)
			table.insert(var_34_0.VanguardUnitList, var_34_77)
		end

		arg_34_0.viewComponent:setFleet(var_34_69, var_34_70, var_34_71)

		var_34_0.MapAidSkills = {}

		if var_34_67:IsSelf() then
			local var_34_78, var_34_79, var_34_80 = var_34_64.GetSupportValue()

			if var_34_78 then
				table.insert(var_34_0.MapAidSkills, {
					level = 1,
					id = var_34_80
				})
			end
		end
	elseif var_34_1 == SYSTEM_HP_SHARE_ACT_BOSS or var_34_1 == SYSTEM_ACT_BOSS or var_34_1 == SYSTEM_ACT_BOSS_SP or var_34_1 == SYSTEM_BOSS_EXPERIMENT then
		if arg_34_0.contextData.mainFleetId then
			local var_34_81 = getProxy(FleetProxy):getActivityFleets()[arg_34_0.contextData.actId]
			local var_34_82 = var_34_81[arg_34_0.contextData.mainFleetId]
			local var_34_83 = _.values(var_34_82:getCommanders())

			var_34_0.CommanderList = var_34_82:buildBattleBuffList()
			arg_34_0.mainShips = {}

			local var_34_84 = {}
			local var_34_85 = {}
			local var_34_86 = {}

			local function var_34_87(arg_39_0, arg_39_1, arg_39_2, arg_39_3)
				if table.contains(var_34_5, arg_39_0) then
					BattleVertify.cloneShipVertiry = true
				end

				var_34_5[#var_34_5 + 1] = arg_39_0

				local var_39_0 = var_34_4:getShipById(arg_39_0)
				local var_39_1 = var_0_1(var_34_1, var_39_0, arg_39_1)

				table.insert(arg_34_0.mainShips, var_39_0)
				table.insert(arg_39_3, var_39_0)
				table.insert(arg_39_2, var_39_1)
			end

			local var_34_88 = var_34_82:getTeamByName(TeamType.Main)
			local var_34_89 = var_34_82:getTeamByName(TeamType.Vanguard)

			for iter_34_30, iter_34_31 in ipairs(var_34_88) do
				var_34_87(iter_34_31, var_34_83, var_34_0.MainUnitList, var_34_84)
			end

			for iter_34_32, iter_34_33 in ipairs(var_34_89) do
				var_34_87(iter_34_33, var_34_83, var_34_0.VanguardUnitList, var_34_85)
			end

			local var_34_90 = var_34_81[arg_34_0.contextData.mainFleetId + 10]
			local var_34_91 = _.values(var_34_90:getCommanders())
			local var_34_92 = var_34_90:getTeamByName(TeamType.Submarine)

			for iter_34_34, iter_34_35 in ipairs(var_34_92) do
				var_34_87(iter_34_35, var_34_91, var_34_0.SubUnitList, var_34_86)
			end

			local var_34_93 = getProxy(PlayerProxy):getRawData()
			local var_34_94 = getProxy(ActivityProxy):getActivityById(arg_34_0.contextData.actId)
			local var_34_95 = var_34_94:getConfig("config_id")
			local var_34_96 = pg.activity_event_worldboss[var_34_95].use_oil_limit[arg_34_0.contextData.mainFleetId]
			local var_34_97 = var_34_94:IsOilLimit(arg_34_0.contextData.stageId)
			local var_34_98 = 0
			local var_34_99 = var_34_3.oil_cost > 0

			local function var_34_100(arg_40_0, arg_40_1)
				if var_34_99 then
					local var_40_0 = arg_40_0:getEndCost().oil

					if arg_40_1 > 0 then
						local var_40_1 = arg_40_0:getStartCost().oil

						cost = math.clamp(arg_40_1 - var_40_1, 0, var_40_0)
					end

					var_34_98 = var_34_98 + var_40_0
				end
			end

			if var_34_1 == SYSTEM_ACT_BOSS_SP then
				local var_34_101 = getProxy(ActivityProxy):GetActivityBossRuntime(arg_34_0.contextData.actId).buffIds
				local var_34_102 = _.map(var_34_101, function(arg_41_0)
					return ActivityBossBuff.New({
						configId = arg_41_0
					})
				end)

				var_34_0.ExtraBuffList = _.map(_.select(var_34_102, function(arg_42_0)
					return arg_42_0:CastOnEnemy()
				end), function(arg_43_0)
					return arg_43_0:GetBuffID()
				end)
				var_34_0.ChapterBuffIDs = _.map(_.select(var_34_102, function(arg_44_0)
					return not arg_44_0:CastOnEnemy()
				end), function(arg_45_0)
					return arg_45_0:GetBuffID()
				end)
			else
				var_34_100(var_34_82, var_34_97 and var_34_96[1] or 0)
				var_34_100(var_34_90, var_34_97 and var_34_96[2] or 0)
			end

			if var_34_90:isLegalToFight() == true and (var_34_1 == SYSTEM_BOSS_EXPERIMENT or var_34_98 <= var_34_93.oil) then
				var_34_0.SubFlag = 1
				var_34_0.TotalSubAmmo = 1
			end

			var_34_0.SubCommanderList = var_34_90:buildBattleBuffList()

			arg_34_0.viewComponent:setFleet(var_34_84, var_34_85, var_34_86)
		end
	elseif var_34_1 == SYSTEM_GUILD then
		local var_34_103 = getProxy(GuildProxy):getRawData():GetActiveEvent():GetBossMission()
		local var_34_104 = var_34_103:GetMainFleet()
		local var_34_105 = _.values(var_34_104:getCommanders())

		var_34_0.CommanderList = var_34_104:BuildBattleBuffList()
		arg_34_0.mainShips = {}

		local var_34_106 = {}
		local var_34_107 = {}
		local var_34_108 = {}

		local function var_34_109(arg_46_0, arg_46_1, arg_46_2, arg_46_3)
			local var_46_0 = var_0_1(var_34_1, arg_46_0, arg_46_1)

			table.insert(arg_34_0.mainShips, arg_46_0)
			table.insert(arg_46_3, arg_46_0)
			table.insert(arg_46_2, var_46_0)
		end

		local var_34_110 = {}
		local var_34_111 = {}
		local var_34_112 = var_34_104:GetShips()

		for iter_34_36, iter_34_37 in pairs(var_34_112) do
			local var_34_113 = iter_34_37.ship

			if var_34_113:getTeamType() == TeamType.Main then
				table.insert(var_34_110, var_34_113)
			elseif var_34_113:getTeamType() == TeamType.Vanguard then
				table.insert(var_34_111, var_34_113)
			end
		end

		for iter_34_38, iter_34_39 in ipairs(var_34_110) do
			var_34_109(iter_34_39, var_34_105, var_34_0.MainUnitList, var_34_106)
		end

		for iter_34_40, iter_34_41 in ipairs(var_34_111) do
			var_34_109(iter_34_41, var_34_105, var_34_0.VanguardUnitList, var_34_107)
		end

		local var_34_114 = var_34_103:GetSubFleet()
		local var_34_115 = _.values(var_34_114:getCommanders())
		local var_34_116 = {}
		local var_34_117 = var_34_114:GetShips()

		for iter_34_42, iter_34_43 in pairs(var_34_117) do
			local var_34_118 = iter_34_43.ship

			if var_34_118:getTeamType() == TeamType.Submarine then
				table.insert(var_34_116, var_34_118)
			end
		end

		for iter_34_44, iter_34_45 in ipairs(var_34_116) do
			var_34_109(iter_34_45, var_34_115, var_34_0.SubUnitList, var_34_108)
		end

		if #var_34_108 > 0 then
			var_34_0.SubFlag = 1
			var_34_0.TotalSubAmmo = 1
		end

		var_34_0.SubCommanderList = var_34_114:BuildBattleBuffList()

		arg_34_0.viewComponent:setFleet(var_34_106, var_34_107, var_34_108)
	elseif var_34_1 == SYSTEM_BOSS_RUSH or var_34_1 == SYSTEM_BOSS_RUSH_EX then
		local var_34_119 = getProxy(ActivityProxy):getActivityById(arg_34_0.contextData.actId):GetSeriesData()

		assert(var_34_119)

		local var_34_120 = var_34_119:GetStaegLevel() + 1
		local var_34_121 = var_34_119:GetFleetIds()
		local var_34_122 = var_34_121[var_34_120]
		local var_34_123 = var_34_121[#var_34_121]

		if var_34_119:GetMode() == BossRushSeriesData.MODE.SINGLE then
			var_34_122 = var_34_121[1]
		end

		local var_34_124 = getProxy(FleetProxy):getActivityFleets()[arg_34_0.contextData.actId]

		arg_34_0.mainShips = {}

		local var_34_125 = {}
		local var_34_126 = {}
		local var_34_127 = {}

		local function var_34_128(arg_47_0, arg_47_1, arg_47_2, arg_47_3)
			if table.contains(var_34_5, arg_47_0) then
				BattleVertify.cloneShipVertiry = true
			end

			var_34_5[#var_34_5 + 1] = arg_47_0

			local var_47_0 = var_34_4:getShipById(arg_47_0)
			local var_47_1 = var_0_1(var_34_1, var_47_0, arg_47_1)

			table.insert(arg_34_0.mainShips, var_47_0)
			table.insert(arg_47_3, var_47_0)
			table.insert(arg_47_2, var_47_1)
		end

		local var_34_129 = var_34_124[var_34_122]
		local var_34_130 = _.values(var_34_129:getCommanders())

		var_34_0.CommanderList = var_34_129:buildBattleBuffList()

		local var_34_131 = var_34_129:getTeamByName(TeamType.Main)
		local var_34_132 = var_34_129:getTeamByName(TeamType.Vanguard)

		for iter_34_46, iter_34_47 in ipairs(var_34_131) do
			var_34_128(iter_34_47, var_34_130, var_34_0.MainUnitList, var_34_125)
		end

		for iter_34_48, iter_34_49 in ipairs(var_34_132) do
			var_34_128(iter_34_49, var_34_130, var_34_0.VanguardUnitList, var_34_126)
		end

		local var_34_133 = var_34_124[var_34_123]
		local var_34_134 = _.values(var_34_133:getCommanders())

		var_34_0.SubCommanderList = var_34_133:buildBattleBuffList()

		local var_34_135 = var_34_133:getTeamByName(TeamType.Submarine)

		for iter_34_50, iter_34_51 in ipairs(var_34_135) do
			var_34_128(iter_34_51, var_34_134, var_34_0.SubUnitList, var_34_127)
		end

		local var_34_136 = getProxy(PlayerProxy):getRawData()
		local var_34_137 = 0
		local var_34_138 = var_34_119:GetOilLimit()
		local var_34_139 = var_34_3.oil_cost > 0

		local function var_34_140(arg_48_0, arg_48_1)
			local var_48_0 = 0

			if var_34_139 then
				local var_48_1 = arg_48_0:getStartCost().oil
				local var_48_2 = arg_48_0:getEndCost().oil

				var_48_0 = var_48_2

				if arg_48_1 > 0 then
					var_48_0 = math.clamp(arg_48_1 - var_48_1, 0, var_48_2)
				end
			end

			return var_48_0
		end

		local var_34_141 = var_34_137 + var_34_140(var_34_129, var_34_138[1]) + var_34_140(var_34_133, var_34_138[2])

		if var_34_133:isLegalToFight() == true and var_34_141 <= var_34_136.oil then
			var_34_0.SubFlag = 1
			var_34_0.TotalSubAmmo = 1
		end

		arg_34_0.viewComponent:setFleet(var_34_125, var_34_126, var_34_127)
	elseif var_34_1 == SYSTEM_LIMIT_CHALLENGE then
		local var_34_142 = LimitChallengeConst.GetChallengeIDByStageID(arg_34_0.contextData.stageId)

		var_34_0.ExtraBuffList = AcessWithinNull(pg.expedition_constellation_challenge_template[var_34_142], "buff_id")

		local var_34_143 = FleetProxy.CHALLENGE_FLEET_ID
		local var_34_144 = FleetProxy.CHALLENGE_SUB_FLEET_ID
		local var_34_145 = getProxy(FleetProxy)
		local var_34_146 = var_34_145:getFleetById(var_34_143)
		local var_34_147 = var_34_145:getFleetById(var_34_144)

		arg_34_0.mainShips = {}

		local var_34_148 = {}
		local var_34_149 = {}
		local var_34_150 = {}

		local function var_34_151(arg_49_0, arg_49_1, arg_49_2, arg_49_3)
			if table.contains(var_34_5, arg_49_0) then
				BattleVertify.cloneShipVertiry = true
			end

			var_34_5[#var_34_5 + 1] = arg_49_0

			local var_49_0 = var_34_4:getShipById(arg_49_0)
			local var_49_1 = var_0_1(var_34_1, var_49_0, arg_49_1)

			table.insert(arg_34_0.mainShips, var_49_0)
			table.insert(arg_49_3, var_49_0)
			table.insert(arg_49_2, var_49_1)
		end

		local var_34_152 = _.values(var_34_146:getCommanders())

		var_34_0.CommanderList = var_34_146:buildBattleBuffList()

		local var_34_153 = var_34_146:getTeamByName(TeamType.Main)
		local var_34_154 = var_34_146:getTeamByName(TeamType.Vanguard)

		for iter_34_52, iter_34_53 in ipairs(var_34_153) do
			var_34_151(iter_34_53, var_34_152, var_34_0.MainUnitList, var_34_148)
		end

		for iter_34_54, iter_34_55 in ipairs(var_34_154) do
			var_34_151(iter_34_55, var_34_152, var_34_0.VanguardUnitList, var_34_149)
		end

		local var_34_155 = _.values(var_34_147:getCommanders())

		var_34_0.SubCommanderList = var_34_147:buildBattleBuffList()

		local var_34_156 = var_34_147:getTeamByName(TeamType.Submarine)

		for iter_34_56, iter_34_57 in ipairs(var_34_156) do
			var_34_151(iter_34_57, var_34_155, var_34_0.SubUnitList, var_34_150)
		end

		local var_34_157 = getProxy(PlayerProxy):getRawData()
		local var_34_158 = 0
		local var_34_159 = var_34_3.oil_cost > 0

		local function var_34_160(arg_50_0, arg_50_1)
			local var_50_0 = 0

			if var_34_159 then
				local var_50_1 = arg_50_0:getStartCost().oil
				local var_50_2 = arg_50_0:getEndCost().oil

				var_50_0 = var_50_2

				if arg_50_1 > 0 then
					var_50_0 = math.clamp(arg_50_1 - var_50_1, 0, var_50_2)
				end
			end

			return var_50_0
		end

		local var_34_161 = var_34_158 + var_34_160(var_34_146, 0) + var_34_160(var_34_147, 0)

		if var_34_147:isLegalToFight() == true and var_34_161 <= var_34_157.oil then
			var_34_0.SubFlag = 1
			var_34_0.TotalSubAmmo = 1
		end

		arg_34_0.viewComponent:setFleet(var_34_148, var_34_149, var_34_150)
	elseif var_34_1 == SYSTEM_CARDPUZZLE then
		local var_34_162 = {}
		local var_34_163 = {}
		local var_34_164 = arg_34_0.contextData.relics

		for iter_34_58, iter_34_59 in ipairs(arg_34_0.contextData.cardPuzzleFleet) do
			local var_34_165 = var_0_2(iter_34_59, var_34_164)
			local var_34_166 = var_34_165.fleetIndex

			if var_34_166 == 1 then
				table.insert(var_34_163, var_34_165)
				table.insert(var_34_0.VanguardUnitList, var_34_165)
			elseif var_34_166 == 2 then
				table.insert(var_34_162, var_34_165)
				table.insert(var_34_0.MainUnitList, var_34_165)
			end
		end

		var_34_0.CardPuzzleCardIDList = arg_34_0.contextData.cards
		var_34_0.CardPuzzleCommonHPValue = arg_34_0.contextData.hp
		var_34_0.CardPuzzleRelicList = var_34_164
		var_34_0.CardPuzzleCombatID = arg_34_0.contextData.puzzleCombatID
	elseif var_34_1 == SYSTEM_BOSS_SINGLE then
		if arg_34_0.contextData.mainFleetId then
			local var_34_167 = getProxy(FleetProxy):getActivityFleets()[arg_34_0.contextData.actId]
			local var_34_168 = var_34_167[arg_34_0.contextData.mainFleetId]
			local var_34_169 = _.values(var_34_168:getCommanders())

			var_34_0.CommanderList = var_34_168:buildBattleBuffList()
			arg_34_0.mainShips = {}

			local var_34_170 = {}
			local var_34_171 = {}
			local var_34_172 = {}

			local function var_34_173(arg_51_0, arg_51_1, arg_51_2, arg_51_3)
				if table.contains(var_34_5, arg_51_0) then
					BattleVertify.cloneShipVertiry = true
				end

				var_34_5[#var_34_5 + 1] = arg_51_0

				local var_51_0 = var_34_4:getShipById(arg_51_0)
				local var_51_1 = var_0_1(var_34_1, var_51_0, arg_51_1)

				table.insert(arg_34_0.mainShips, var_51_0)
				table.insert(arg_51_3, var_51_0)
				table.insert(arg_51_2, var_51_1)
			end

			local var_34_174 = var_34_168:getTeamByName(TeamType.Main)
			local var_34_175 = var_34_168:getTeamByName(TeamType.Vanguard)

			for iter_34_60, iter_34_61 in ipairs(var_34_174) do
				var_34_173(iter_34_61, var_34_169, var_34_0.MainUnitList, var_34_170)
			end

			for iter_34_62, iter_34_63 in ipairs(var_34_175) do
				var_34_173(iter_34_63, var_34_169, var_34_0.VanguardUnitList, var_34_171)
			end

			local var_34_176 = var_34_167[arg_34_0.contextData.mainFleetId + 10]
			local var_34_177 = _.values(var_34_176:getCommanders())
			local var_34_178 = var_34_176:getTeamByName(TeamType.Submarine)

			for iter_34_64, iter_34_65 in ipairs(var_34_178) do
				var_34_173(iter_34_65, var_34_177, var_34_0.SubUnitList, var_34_172)
			end

			local var_34_179 = getProxy(PlayerProxy):getRawData()
			local var_34_180 = getProxy(ActivityProxy):getActivityById(arg_34_0.contextData.actId)

			var_34_0.ChapterBuffIDs = var_34_180:GetBuffIdsByStageId(arg_34_0.contextData.stageId)

			local var_34_181 = var_34_180:GetEnemyDataByStageId(arg_34_0.contextData.stageId):GetOilLimit()
			local var_34_182 = 0
			local var_34_183 = var_34_3.oil_cost > 0

			local function var_34_184(arg_52_0, arg_52_1)
				if var_34_183 then
					local var_52_0 = arg_52_0:getEndCost().oil

					if arg_52_1 > 0 then
						local var_52_1 = arg_52_0:getStartCost().oil

						cost = math.clamp(arg_52_1 - var_52_1, 0, var_52_0)
					end

					var_34_182 = var_34_182 + var_52_0
				end
			end

			var_34_184(var_34_168, var_34_181[1] or 0)
			var_34_184(var_34_176, var_34_181[2] or 0)

			if var_34_176:isLegalToFight() == true and var_34_182 <= var_34_179.oil then
				var_34_0.SubFlag = 1
				var_34_0.TotalSubAmmo = 1
			end

			var_34_0.SubCommanderList = var_34_176:buildBattleBuffList()

			arg_34_0.viewComponent:setFleet(var_34_170, var_34_171, var_34_172)
		end
	elseif arg_34_0.contextData.mainFleetId then
		local var_34_185 = var_34_1 == SYSTEM_DUEL
		local var_34_186 = getProxy(FleetProxy)
		local var_34_187
		local var_34_188
		local var_34_189 = var_34_186:getFleetById(arg_34_0.contextData.mainFleetId)

		arg_34_0.mainShips = var_34_4:getShipsByFleet(var_34_189)

		local var_34_190 = {}
		local var_34_191 = {}
		local var_34_192 = {}

		local function var_34_193(arg_53_0, arg_53_1, arg_53_2)
			for iter_53_0, iter_53_1 in ipairs(arg_53_0) do
				if table.contains(var_34_5, iter_53_1) then
					BattleVertify.cloneShipVertiry = true
				end

				var_34_5[#var_34_5 + 1] = iter_53_1

				local var_53_0 = var_34_4:getShipById(iter_53_1)
				local var_53_1 = var_0_1(var_34_1, var_53_0, nil, var_34_185)

				table.insert(arg_53_1, var_53_0)
				table.insert(arg_53_2, var_53_1)
			end
		end

		local var_34_194 = var_34_189:getTeamByName(TeamType.Main)
		local var_34_195 = var_34_189:getTeamByName(TeamType.Vanguard)
		local var_34_196 = var_34_189:getTeamByName(TeamType.Submarine)

		var_34_193(var_34_194, var_34_190, var_34_0.MainUnitList)
		var_34_193(var_34_195, var_34_191, var_34_0.VanguardUnitList)
		var_34_193(var_34_196, var_34_192, var_34_0.SubUnitList)
		arg_34_0.viewComponent:setFleet(var_34_190, var_34_191, var_34_192)

		if BATTLE_DEBUG and BATTLE_FREE_SUBMARINE then
			local var_34_197 = var_34_186:getFleetById(11)
			local var_34_198 = var_34_197:getTeamByName(TeamType.Submarine)

			if #var_34_198 > 0 then
				var_34_0.SubFlag = 1
				var_34_0.TotalSubAmmo = 1

				local var_34_199 = _.values(var_34_197:getCommanders())

				var_34_0.SubCommanderList = var_34_197:buildBattleBuffList()

				for iter_34_66, iter_34_67 in ipairs(var_34_198) do
					local var_34_200 = var_34_4:getShipById(iter_34_67)
					local var_34_201 = var_0_1(var_34_1, var_34_200, var_34_199, var_34_185)

					table.insert(var_34_192, var_34_200)
					table.insert(var_34_0.SubUnitList, var_34_201)
				end
			end
		end
	end

	if var_34_1 == SYSTEM_WORLD then
		local var_34_202 = nowWorld()
		local var_34_203 = var_34_202:GetActiveMap()
		local var_34_204 = var_34_203:GetFleet()
		local var_34_205 = var_34_203:GetCell(var_34_204.row, var_34_204.column):GetStageEnemy()
		local var_34_206 = pg.world_expedition_data[arg_34_0.contextData.stageId]
		local var_34_207 = var_34_202:GetWorldMapDifficultyBuffLevel()

		var_34_0.EnemyMapRewards = {
			var_34_207[1] * (1 + var_34_206.expedition_sairenvalueA / 10000),
			var_34_207[2] * (1 + var_34_206.expedition_sairenvalueB / 10000),
			var_34_207[3] * (1 + var_34_206.expedition_sairenvalueC / 10000)
		}
		var_34_0.FleetMapRewards = var_34_202:GetWorldMapBuffLevel()
	end

	var_34_0.RivalMainUnitList, var_34_0.RivalVanguardUnitList = {}, {}

	local var_34_208

	if var_34_1 == SYSTEM_DUEL and arg_34_0.contextData.rivalId then
		local var_34_209 = getProxy(MilitaryExerciseProxy)

		var_34_208 = var_34_209:getRivalById(arg_34_0.contextData.rivalId)
		arg_34_0.oldRank = var_34_209:getSeasonInfo()
	end

	if var_34_208 then
		var_34_0.RivalVO = var_34_208

		local var_34_210 = 0

		for iter_34_68, iter_34_69 in ipairs(var_34_208.mainShips) do
			var_34_210 = var_34_210 + iter_34_69.level
		end

		for iter_34_70, iter_34_71 in ipairs(var_34_208.vanguardShips) do
			var_34_210 = var_34_210 + iter_34_71.level
		end

		BattleVertify = BattleVertify or {}
		BattleVertify.rivalLevel = var_34_210

		for iter_34_72, iter_34_73 in ipairs(var_34_208.mainShips) do
			if not iter_34_73.hpRant or iter_34_73.hpRant > 0 then
				local var_34_211 = var_0_1(var_34_1, iter_34_73, nil, true)

				if iter_34_73.hpRant then
					var_34_211.initHPRate = iter_34_73.hpRant * 0.0001
				end

				table.insert(var_34_0.RivalMainUnitList, var_34_211)
			end
		end

		for iter_34_74, iter_34_75 in ipairs(var_34_208.vanguardShips) do
			if not iter_34_75.hpRant or iter_34_75.hpRant > 0 then
				local var_34_212 = var_0_1(var_34_1, iter_34_75, nil, true)

				if iter_34_75.hpRant then
					var_34_212.initHPRate = iter_34_75.hpRant * 0.0001
				end

				table.insert(var_34_0.RivalVanguardUnitList, var_34_212)
			end
		end
	end

	local var_34_213 = arg_34_0.contextData.prefabFleet.main_unitList
	local var_34_214 = arg_34_0.contextData.prefabFleet.vanguard_unitList
	local var_34_215 = arg_34_0.contextData.prefabFleet.submarine_unitList

	if var_34_213 then
		for iter_34_76, iter_34_77 in ipairs(var_34_213) do
			local var_34_216 = {}

			for iter_34_78, iter_34_79 in ipairs(iter_34_77.equipment) do
				var_34_216[#var_34_216 + 1] = {
					skin = 0,
					id = iter_34_79
				}
			end

			local var_34_217 = {
				id = iter_34_77.id,
				tmpID = iter_34_77.configId,
				skinId = iter_34_77.skinId,
				level = iter_34_77.level,
				equipment = var_34_216,
				properties = iter_34_77.properties,
				baseProperties = iter_34_77.properties,
				proficiency = {
					1,
					1,
					1
				},
				skills = iter_34_77.skills
			}

			table.insert(var_34_0.MainUnitList, var_34_217)
		end
	end

	if var_34_214 then
		for iter_34_80, iter_34_81 in ipairs(var_34_214) do
			local var_34_218 = {}

			for iter_34_82, iter_34_83 in ipairs(iter_34_81.equipment) do
				var_34_218[#var_34_218 + 1] = {
					skin = 0,
					id = iter_34_83
				}
			end

			local var_34_219 = {
				id = iter_34_81.id,
				tmpID = iter_34_81.configId,
				skinId = iter_34_81.skinId,
				level = iter_34_81.level,
				equipment = var_34_218,
				properties = iter_34_81.properties,
				baseProperties = iter_34_81.properties,
				proficiency = {
					1,
					1,
					1
				},
				skills = iter_34_81.skills
			}

			table.insert(var_34_0.VanguardUnitList, var_34_219)
		end
	end

	if var_34_215 then
		for iter_34_84, iter_34_85 in ipairs(var_34_215) do
			local var_34_220 = {}

			for iter_34_86, iter_34_87 in ipairs(iter_34_85.equipment) do
				var_34_220[#var_34_220 + 1] = {
					skin = 0,
					id = iter_34_87
				}
			end

			local var_34_221 = {
				id = iter_34_85.id,
				tmpID = iter_34_85.configId,
				skinId = iter_34_85.skinId,
				level = iter_34_85.level,
				equipment = var_34_220,
				properties = iter_34_85.properties,
				baseProperties = iter_34_85.properties,
				proficiency = {
					1,
					1,
					1
				},
				skills = iter_34_85.skills
			}

			table.insert(var_34_0.SubUnitList, var_34_221)

			if var_34_1 == SYSTEM_SIMULATION and #var_34_0.SubUnitList > 0 then
				var_34_0.SubFlag = 1
				var_34_0.TotalSubAmmo = 1
			end
		end
	end
end

function var_0_0.listNotificationInterests(arg_54_0)
	return {
		GAME.FINISH_STAGE_DONE,
		GAME.FINISH_STAGE_ERROR,
		GAME.STORY_BEGIN,
		GAME.STORY_END,
		GAME.END_GUIDE,
		GAME.START_GUIDE,
		GAME.PAUSE_BATTLE,
		GAME.RESUME_BATTLE,
		var_0_0.CLOSE_CHAT,
		GAME.QUIT_BATTLE,
		var_0_0.HIDE_ALL_BUTTONS,
		var_0_0.UPDATE_AUTO_COUNT
	}
end

function var_0_0.handleNotification(arg_55_0, arg_55_1)
	local var_55_0 = arg_55_1:getName()
	local var_55_1 = arg_55_1:getBody()
	local var_55_2 = ys.Battle.BattleState.GetInstance()
	local var_55_3 = arg_55_0.contextData.system

	if var_55_0 == GAME.FINISH_STAGE_DONE then
		pg.MsgboxMgr.GetInstance():hide()

		local var_55_4 = var_55_1.system

		if var_55_4 == SYSTEM_PROLOGUE then
			ys.Battle.BattleState.GetInstance():Deactive()
			arg_55_0:sendNotification(GAME.CHANGE_SCENE, SCENE.CREATE_PLAYER)
		elseif var_55_4 == SYSTEM_PERFORM or var_55_4 == SYSTEM_SIMULATION then
			ys.Battle.BattleState.GetInstance():Deactive()
			arg_55_0.viewComponent:exitBattle()

			if var_55_1.exitCallback then
				var_55_1.exitCallback()
			end
		else
			local var_55_5 = BattleResultMediator.GetResultView(var_55_4)
			local var_55_6 = {}

			if var_55_4 == SYSTEM_SCENARIO then
				var_55_6 = getProxy(ChapterProxy):getActiveChapter().operationBuffList
			end

			arg_55_0:addSubLayers(Context.New({
				mediator = NewBattleResultMediator,
				viewComponent = NewBattleResultScene,
				data = {
					system = var_55_4,
					rivalId = arg_55_0.contextData.rivalId,
					mainFleetId = arg_55_0.contextData.mainFleetId,
					stageId = arg_55_0.contextData.stageId,
					oldMainShips = arg_55_0.mainShips or {},
					oldPlayer = arg_55_0.player,
					oldRank = arg_55_0.oldRank,
					statistics = var_55_1.statistics,
					score = var_55_1.score,
					drops = var_55_1.drops,
					bossId = var_55_1.bossId,
					name = var_55_1.name,
					prefabFleet = var_55_1.prefabFleet,
					commanderExps = var_55_1.commanderExps,
					actId = arg_55_0.contextData.actId,
					result = var_55_1.result,
					extraDrops = var_55_1.extraDrops,
					extraBuffList = var_55_6,
					isLastBonus = var_55_1.isLastBonus,
					continuousBattleTimes = arg_55_0.contextData.continuousBattleTimes,
					totalBattleTimes = arg_55_0.contextData.totalBattleTimes,
					mode = arg_55_0.contextData.mode,
					cmdArgs = arg_55_0.contextData.cmdArgs
				}
			}))
		end
	elseif var_55_0 == GAME.STORY_BEGIN then
		var_55_2:Pause()
	elseif var_55_0 == GAME.STORY_END then
		var_55_2:Resume()
	elseif var_55_0 == GAME.START_GUIDE then
		var_55_2:Pause()
	elseif var_55_0 == GAME.END_GUIDE then
		var_55_2:Resume()
	elseif var_55_0 == GAME.PAUSE_BATTLE then
		if not var_55_2:IsPause() then
			arg_55_0:onPauseBtn()
		end
	elseif var_55_0 == GAME.RESUME_BATTLE then
		var_55_2:Resume()
	elseif var_55_0 == GAME.FINISH_STAGE_ERROR then
		gcAll(true)

		local var_55_7 = getProxy(ContextProxy)
		local var_55_8 = var_55_7:getContextByMediator(DailyLevelMediator)
		local var_55_9 = var_55_7:getContextByMediator(LevelMediator2)
		local var_55_10 = var_55_7:getContextByMediator(ChallengeMainMediator)
		local var_55_11 = var_55_7:getContextByMediator(ActivityBossMediatorTemplate)

		if var_55_8 then
			local var_55_12 = var_55_8:getContextByMediator(PreCombatMediator)

			var_55_8:removeChild(var_55_12)
		elseif var_55_10 then
			local var_55_13 = var_55_10:getContextByMediator(ChallengePreCombatMediator)

			var_55_10:removeChild(var_55_13)
		elseif var_55_9 then
			if var_55_3 == SYSTEM_DUEL then
				-- block empty
			elseif var_55_3 == SYSTEM_SCENARIO then
				local var_55_14 = var_55_9:getContextByMediator(ChapterPreCombatMediator)

				var_55_9:removeChild(var_55_14)
			elseif var_55_3 ~= SYSTEM_PERFORM and var_55_3 ~= SYSTEM_SIMULATION then
				local var_55_15 = var_55_9:getContextByMediator(PreCombatMediator)

				if var_55_15 then
					var_55_9:removeChild(var_55_15)
				end
			end
		elseif var_55_11 then
			local var_55_16 = var_55_11:getContextByMediator(PreCombatMediator)

			if var_55_16 then
				var_55_11:removeChild(var_55_16)
			end
		end

		arg_55_0:sendNotification(GAME.GO_BACK)
	elseif var_55_0 == var_0_0.CLOSE_CHAT then
		arg_55_0.viewComponent:OnCloseChat()
	elseif var_55_0 == var_0_0.HIDE_ALL_BUTTONS then
		ys.Battle.BattleState.GetInstance():GetProxyByName(ys.Battle.BattleDataProxy.__name):DispatchEvent(ys.Event.New(ys.Battle.BattleEvent.HIDE_INTERACTABLE_BUTTONS, {
			isActive = var_55_1
		}))
	elseif var_55_0 == GAME.QUIT_BATTLE then
		var_55_2:Stop()
	elseif var_55_0 == var_0_0.UPDATE_AUTO_COUNT then
		arg_55_0:updateAutoCount(var_55_1)
	end
end

function var_0_0.remove(arg_56_0)
	pg.BrightnessMgr.GetInstance():SetScreenNeverSleep(false)
end

return var_0_0
