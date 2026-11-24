local var_0_0 = class("BossRushVeritasAcademyMediator", import("view.base.ContextMediator"))

var_0_0.ON_FLEET_SELECT = "BossRushVeritasAcademyMediator.ON_FLEET_SELECT"
var_0_0.ON_EXTRA_RANK = "BossRushVeritasAcademyMediator.ON_EXTRA_RANK"
var_0_0.ON_PT_RANK = "BossRushVeritasAcademyMediator.ON_PT_RANK"
var_0_0.ON_TASK_SUBMIT = "BossRushVeritasAcademyMediator.ON_TASK_SUBMIT"
var_0_0.ON_PERFORM_COMBAT = "BossRushVeritasAcademyMediator.ON_PERFORM_COMBAT"
var_0_0.GO_SUBLAYER = "BossRushVeritasAcademyMediator.GO_SUBLAYER"
var_0_0.GO_SCENE = "BossRushVeritasAcademyMediator.GO_SCENE"

function var_0_0.register(arg_1_0)
	arg_1_0:bind(var_0_0.GO_SUBLAYER, function(arg_2_0, arg_2_1, arg_2_2)
		arg_1_0:addSubLayers(arg_2_1, nil, arg_2_2)
	end)
	arg_1_0:bind(var_0_0.GO_SCENE, function(arg_3_0, arg_3_1, ...)
		arg_1_0:sendNotification(GAME.GO_SCENE, arg_3_1, ...)
	end)
	arg_1_0:bind(var_0_0.ON_FLEET_SELECT, function(arg_4_0, arg_4_1)
		local var_4_0 = getProxy(ChapterAutoProxy):GetCommissionDoingType()

		if var_4_0 and var_4_0 ~= ChapterAutoProxy.TYPE.WORLD then
			arg_1_0.viewComponent:CheckChapterAutoOccupied(var_4_0)

			return
		end

		BossRushVeritasAcademyPassedLayer.seriesId = arg_4_1.configId

		arg_1_0:addSubLayers(Context.New({
			mediator = BossRushFleetSelectMediator,
			viewComponent = BossRushVeritasAcademyFleetSelectView,
			data = {
				seriesData = arg_4_1
			}
		}))
	end)
	arg_1_0:bind(var_0_0.ON_EXTRA_RANK, function(arg_5_0)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.BILLBOARD, {
			page = PowerRank.TYPE_BOSSRUSH
		})
	end)
	arg_1_0:bind(var_0_0.ON_PT_RANK, function(arg_6_0)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.BILLBOARD, {
			page = PowerRank.TYPE_PT
		})
	end)
	arg_1_0:bind(var_0_0.ON_PERFORM_COMBAT, function(arg_7_0, arg_7_1, arg_7_2)
		arg_1_0:sendNotification(GAME.BEGIN_STAGE, {
			system = SYSTEM_PERFORM,
			stageId = arg_7_1,
			exitCallback = arg_7_2
		})
	end)
	arg_1_0:bind(var_0_0.ON_TASK_SUBMIT, function(arg_8_0, arg_8_1)
		arg_1_0:sendNotification(GAME.SUBMIT_TASK, arg_8_1.id)
	end)

	local var_1_0 = arg_1_0.contextData.activityID

	assert(var_1_0, "activityID is required by BossRushVeritasAcademyMediator")

	local var_1_1 = getProxy(ActivityProxy):getActivityById(var_1_0)

	arg_1_0.viewComponent:SetActivity(var_1_1)

	local var_1_2 = getProxy(ActivityProxy):getActivityById(ActivityConst.VERITASACADEMY_BOSS_RUSH_PT_ACT_ID)

	arg_1_0.viewComponent:SetPtActivity(var_1_2)
	arg_1_0.viewComponent:addbubbleMsgBox(function(arg_9_0)
		if getProxy(ContextProxy):getCurrentContext():getContextByMediator(BossRushTotalRewardPanelMediator) then
			return
		end

		arg_9_0()
	end)
	arg_1_0.viewComponent:addbubbleMsgBox(function(arg_10_0)
		pg.GuildMsgBoxMgr.GetInstance():NotificationForBattle(arg_10_0)
	end)
end

function var_0_0.listNotificationInterests(arg_11_0)
	return {
		ActivityProxy.ACTIVITY_UPDATED,
		GAME.SUBMIT_TASK_AWARD_DOWN,
		GAME.BEGIN_STAGE_DONE,
		BossRushTotalRewardPanelMediator.ON_WILL_EXIT,
		GAME.START_CHAPTER_AUTO_DONE,
		GAME.END_CHAPTER_AUTO_DONE
	}
end

function var_0_0.handleNotification(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_1:getName()
	local var_12_1 = arg_12_1:getBody()
	local var_12_2 = arg_12_1:getType()

	if var_12_0 == nil then
		-- block empty
	elseif var_12_0 == GAME.BEGIN_STAGE_DONE then
		if not getProxy(ContextProxy):getContextByMediator(BossRushPreCombatMediator) then
			arg_12_0:sendNotification(GAME.GO_SCENE, SCENE.COMBATLOAD, var_12_1)
		end
	elseif var_12_0 == ActivityProxy.ACTIVITY_UPDATED then
		local var_12_3 = var_12_1

		if var_12_3 then
			if var_12_3:getConfig("type") == ActivityConst.ACTIVITY_TYPE_BOSSRUSH then
				arg_12_0.viewComponent:SetActivity(var_12_3)
				arg_12_0.viewComponent:UpdateView()
			elseif var_12_3.id == ActivityConst.VERITASACADEMY_BOSS_RUSH_PT_ACT_ID then
				arg_12_0.viewComponent:SetPtActivity(var_12_3)
				arg_12_0.viewComponent:UpdateView()
			end
		end
	elseif var_12_0 == GAME.SUBMIT_TASK_AWARD_DOWN then
		local var_12_4 = {}

		if #var_12_1.awards > 0 then
			table.insert(var_12_4, function(arg_13_0)
				arg_12_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_12_1.awards, arg_13_0)
			end)
		end

		seriesAsync(var_12_4, function()
			arg_12_0.viewComponent:UpdateView()
		end)
	elseif var_12_0 == BossRushTotalRewardPanelMediator.ON_WILL_EXIT then
		arg_12_0.viewComponent:resumeBubble()
		arg_12_0.viewComponent:UpdateView()
	elseif var_12_0 == GAME.START_CHAPTER_AUTO_DONE then
		arg_12_0.viewComponent:OnStartChapterAuto(var_12_1)
	elseif var_12_0 == GAME.END_CHAPTER_AUTO_DONE then
		arg_12_0.viewComponent:OnEndChapterAuto(var_12_1)
		arg_12_0:addSubLayers(Context.New({
			viewComponent = ChapterAutoTotalRewardLayer,
			mediator = ChapterAutoTotalRewardMediator,
			data = {
				rewards = var_12_1.awards,
				totalTimes = var_12_1.allCnt,
				finishTimes = var_12_1.finishCnt,
				proficiency = var_12_1.proficiency
			}
		}), true)
	end
end

function var_0_0.remove(arg_15_0)
	return
end

return var_0_0
