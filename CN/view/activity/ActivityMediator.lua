local var_0_0 = class("ActivityMediator", import("..base.ContextMediator"))

var_0_0.EVENT_GO_SCENE = "event go scene"
var_0_0.EVENT_OPERATION = "event operation"
var_0_0.GO_SHOPS_LAYER = "event go shop layer"
var_0_0.GO_SHOPS_LAYER_STEEET = "event go shop layer in shopstreet"
var_0_0.BATTLE_OPERA = "event difficult sel"
var_0_0.GO_BACKYARD = "event go backyard"
var_0_0.GO_LOTTERY = "event go lottery"
var_0_0.EVENT_COLORING_ACHIEVE = "event coloring achieve"
var_0_0.ON_TASK_SUBMIT = "event on task submit"
var_0_0.ON_TASK_SUBMIT_ONESTEP = "event on task submit one step"
var_0_0.ON_TASK_GO = "event on task go"
var_0_0.OPEN_LAYER = "event OPEN_LAYER"
var_0_0.CLOSE_LAYER = "event CLOSE_LAYER"
var_0_0.EVENT_PT_OPERATION = "event pt op"
var_0_0.BLACKWHITEGRID = "black white grid"
var_0_0.MEMORYBOOK = "memory book"
var_0_0.RETURN_AWARD_OP = "event return award op"
var_0_0.SHOW_AWARD_WINDOW = "event show award window"
var_0_0.GO_DODGEM = "event go dodgem"
var_0_0.GO_SUBMARINE_RUN = "event go sumbarine run"
var_0_0.ON_SIMULATION_COMBAT = "event simulation combat"
var_0_0.ON_AIRFIGHT_COMBAT = "event perform airfight combat"
var_0_0.SPECIAL_BATTLE_OPERA = "special battle opera"
var_0_0.NEXT_DISPLAY_AWARD = "next display awards"
var_0_0.GO_PRAY_POOL = "go pray pool"
var_0_0.SELECT_ACTIVITY = "event select activity"
var_0_0.FETCH_INSTARGRAM = "fetch instagram"
var_0_0.MUSIC_GAME_OPERATOR = "get music game final prize"
var_0_0.SHOW_NEXT_ACTIVITY = "show next activity"
var_0_0.OPEN_RED_PACKET_LAYER = "ActivityMediator:OPEN_RED_PACKET_LAYER"
var_0_0.GO_MINI_GAME = "ActivityMediator.GO_MINI_GAME"
var_0_0.GO_DECODE_MINI_GAME = "ActivityMediator:GO_DECODE_MINI_GAME"
var_0_0.ON_BOBING_RESULT = "on bobing result"
var_0_0.ACTIVITY_PERMANENT = "ActivityMediator.ACTIVITY_PERMANENT"
var_0_0.FINISH_ACTIVITY_PERMANENT = "ActivityMediator.FINISH_ACTIVITY_PERMANENT"
var_0_0.ON_SHAKE_BEADS_RESULT = "on shake beads result"
var_0_0.GO_PERFORM_COMBAT = "ActivityMediator.GO_PERFORM_COMBAT"
var_0_0.ON_AWARD_WINDOW = "ActivityMediator:ON_AWARD_WINDOW"
var_0_0.GO_CARDPUZZLE_COMBAT = "ActivityMediator.GO_CARDPUZZLE_COMBAT"
var_0_0.CHARGE = "ActivityMediator.CHARGE"
var_0_0.BUY_ITEM = "ActivityMediator.BUY_ITEM"
var_0_0.OPEN_CHARGE_ITEM_PANEL = "ActivityMediator.OPEN_CHARGE_ITEM_PANEL"
var_0_0.OPEN_CHARGE_BIRTHDAY = "ActivityMediator.OPEN_CHARGE_BIRTHDAY"
var_0_0.STORE_DATE = "ActivityMediator.STORE_DATE"
var_0_0.ON_ACT_SHOPPING = "ActivityMediator.ON_ACT_SHOPPING"
var_0_0.GO_MONOPOLY2024 = "ActivityMediator:GO_MONOPOLY2024"
var_0_0.ON_ACTIVITY_TASK_SUBMIT = "ActivityMediator.ON_ACTIVITY_TASK_SUBMIT"

function var_0_0.register(arg_1_0)
	arg_1_0.UIAvalibleCallbacks = {}

	arg_1_0:bind(var_0_0.GO_MONOPOLY2024, function(arg_2_0, arg_2_1, arg_2_2)
		arg_1_0:addSubLayers(Context.New({
			mediator = MonopolyCar2024Mediator,
			viewComponent = MonopolyCar2024Scene,
			data = {
				actId = arg_2_1
			},
			onRemoved = arg_2_2
		}))
	end)
	arg_1_0:bind(var_0_0.ON_AWARD_WINDOW, function(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
		arg_1_0.viewComponent:ShowAwardWindow(arg_3_1, arg_3_2, arg_3_3)
	end)
	arg_1_0:bind(var_0_0.GO_DECODE_MINI_GAME, function(arg_4_0)
		pg.m02:sendNotification(GAME.REQUEST_MINI_GAME, {
			type = MiniGameRequestCommand.REQUEST_HUB_DATA,
			callback = function()
				pg.m02:sendNotification(GAME.GO_MINI_GAME, 11)
			end
		})
	end)
	arg_1_0:bind(var_0_0.GO_MINI_GAME, function(arg_6_0, arg_6_1)
		pg.m02:sendNotification(GAME.GO_MINI_GAME, arg_6_1)
	end)
	arg_1_0:bind(var_0_0.GO_SUBMARINE_RUN, function(arg_7_0, arg_7_1)
		arg_1_0:sendNotification(GAME.BEGIN_STAGE, {
			system = SYSTEM_SUBMARINE_RUN,
			stageId = arg_7_1
		})
	end)
	arg_1_0:bind(var_0_0.GO_DODGEM, function(arg_8_0)
		local var_8_0 = ys.Battle.BattleConfig.BATTLE_DODGEM_STAGES[math.random(#ys.Battle.BattleConfig.BATTLE_DODGEM_STAGES)]

		arg_1_0:sendNotification(GAME.BEGIN_STAGE, {
			system = SYSTEM_DODGEM,
			stageId = var_8_0
		})
	end)
	arg_1_0:bind(var_0_0.ON_SIMULATION_COMBAT, function(arg_9_0, arg_9_1, arg_9_2)
		arg_1_0:sendNotification(GAME.BEGIN_STAGE, {
			system = SYSTEM_SIMULATION,
			stageId = arg_9_1.stageId,
			warnMsg = arg_9_1.warnMsg,
			exitCallback = arg_9_2
		})
	end)
	arg_1_0:bind(var_0_0.ON_AIRFIGHT_COMBAT, function(arg_10_0, arg_10_1, arg_10_2)
		arg_1_0:sendNotification(GAME.BEGIN_STAGE, {
			system = SYSTEM_AIRFIGHT,
			stageId = arg_10_1.stageId,
			exitCallback = arg_10_2
		})
	end)
	arg_1_0:bind(var_0_0.RETURN_AWARD_OP, function(arg_11_0, arg_11_1)
		if arg_11_1.cmd == ActivityConst.RETURN_AWARD_OP_SHOW_AWARD_OVERVIEW then
			arg_1_0.viewComponent:ShowWindow(ReturnerAwardWindow, arg_11_1.arg1)
		elseif arg_11_1.cmd == ActivityConst.RETURN_AWARD_OP_SHOW_RETURNER_AWARD_OVERVIEW then
			arg_1_0.viewComponent:ShowWindow(TaskAwardWindow, arg_11_1.arg1)
		else
			arg_1_0:sendNotification(GAME.RETURN_AWARD_OP, arg_11_1)
		end
	end)
	arg_1_0:bind(var_0_0.SHOW_AWARD_WINDOW, function(arg_12_0, arg_12_1, arg_12_2)
		arg_1_0.viewComponent:ShowWindow(arg_12_1, arg_12_2)
	end)
	arg_1_0:bind(var_0_0.EVENT_PT_OPERATION, function(arg_13_0, arg_13_1)
		arg_1_0:sendNotification(GAME.ACT_NEW_PT, arg_13_1)
	end)
	arg_1_0:bind(var_0_0.OPEN_LAYER, function(arg_14_0, arg_14_1)
		arg_1_0:addSubLayers(arg_14_1)
	end)
	arg_1_0:bind(var_0_0.OPEN_RED_PACKET_LAYER, function(arg_15_0)
		arg_1_0:addSubLayers(Context.New({
			mediator = RedPacketMediator,
			viewComponent = RedPacketLayer
		}))
	end)
	arg_1_0:bind(var_0_0.CLOSE_LAYER, function(arg_16_0, arg_16_1)
		local var_16_0 = getProxy(ContextProxy):getCurrentContext():getContextByMediator(arg_16_1)

		if var_16_0 then
			arg_1_0:sendNotification(GAME.REMOVE_LAYERS, {
				context = var_16_0
			})
		end
	end)
	arg_1_0:bind(var_0_0.EVENT_OPERATION, function(arg_17_0, arg_17_1)
		arg_1_0:sendNotification(GAME.ACTIVITY_OPERATION, arg_17_1)
	end)
	arg_1_0:bind(var_0_0.EVENT_GO_SCENE, function(arg_18_0, arg_18_1, arg_18_2)
		if arg_18_1 == SCENE.SUMMER_FEAST then
			pg.NewStoryMgr.GetInstance():Play("TIANHOUYUYI1", function()
				arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.SUMMER_FEAST)
			end)
		else
			arg_1_0:sendNotification(GAME.GO_SCENE, arg_18_1, arg_18_2)
		end
	end)
	arg_1_0:bind(var_0_0.BLACKWHITEGRID, function()
		if not getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BLACKWHITE) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

			return
		end

		arg_1_0:addSubLayers(Context.New({
			viewComponent = BlackWhiteGridLayer,
			mediator = BlackWhiteGridMediator
		}))
	end)
	arg_1_0:bind(var_0_0.MEMORYBOOK, function()
		if not getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_PUZZLA) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

			return
		end

		arg_1_0:addSubLayers(Context.New({
			viewComponent = MemoryBookLayer,
			mediator = MemoryBookMediator
		}))
	end)
	arg_1_0:bind(var_0_0.GO_SHOPS_LAYER, function(arg_22_0, arg_22_1)
		if not getProxy(ActivityProxy):getActivityById(arg_22_1.actId) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

			return
		end

		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.SHOP, arg_22_1 or {
			warp = NewShopsScene.TYPE_ACTIVITY
		})
	end)
	arg_1_0:bind(var_0_0.GO_SHOPS_LAYER_STEEET, function(arg_23_0, arg_23_1)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.SHOP, arg_23_1 or {
			warp = NewShopsScene.TYPE_SHOP_STREET
		})
	end)
	arg_1_0:bind(var_0_0.BATTLE_OPERA, function()
		local var_24_0 = getProxy(ChapterProxy)
		local var_24_1, var_24_2 = var_24_0:getLastMapForActivity()

		if not var_24_1 or not var_24_0:getMapById(var_24_1):isUnlock() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))
		else
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, {
				chapterId = var_24_2,
				mapIdx = var_24_1
			})
		end
	end)
	arg_1_0:bind(var_0_0.SPECIAL_BATTLE_OPERA, function()
		local var_25_0 = getProxy(ChapterProxy)
		local var_25_1, var_25_2 = var_25_0:getLastMapForActivity()

		if not var_25_1 or not var_25_0:getMapById(var_25_1):isUnlock() then
			local var_25_3 = getProxy(ChapterProxy)
			local var_25_4 = var_25_3:getActiveChapter()

			var_25_1 = var_25_4 and var_25_4:getConfig("map")

			if not var_25_4 then
				var_25_1 = var_25_3:GetLastNormalMap()
			end

			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, {
				chapterId = var_25_4 and var_25_4.id,
				mapIdx = var_25_1
			})
		else
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, {
				chapterId = var_25_2,
				mapIdx = var_25_1
			})
		end
	end)
	arg_1_0:bind(var_0_0.GO_LOTTERY, function(arg_26_0)
		local var_26_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_LOTTERY)

		arg_1_0:addSubLayers(Context.New({
			mediator = LotteryMediator,
			viewComponent = LotteryLayer,
			data = {
				activityId = var_26_0.id
			}
		}))
	end)
	arg_1_0:bind(var_0_0.GO_BACKYARD, function(arg_27_0)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.COURTYARD)
	end)
	arg_1_0:bind(var_0_0.EVENT_COLORING_ACHIEVE, function(arg_28_0, arg_28_1)
		arg_1_0:sendNotification(GAME.COLORING_ACHIEVE, arg_28_1)
	end)
	arg_1_0:bind(var_0_0.ON_TASK_SUBMIT, function(arg_29_0, arg_29_1, arg_29_2)
		arg_1_0:sendNotification(GAME.SUBMIT_TASK, arg_29_1.id, arg_29_2)
	end)
	arg_1_0:bind(var_0_0.ON_TASK_SUBMIT_ONESTEP, function(arg_30_0, arg_30_1)
		arg_1_0:sendNotification(GAME.SUBMIT_TASK_ONESTEP, {
			resultList = arg_30_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_TASK_GO, function(arg_31_0, arg_31_1)
		arg_1_0:sendNotification(GAME.TASK_GO, {
			taskVO = arg_31_1
		})
	end)
	arg_1_0:bind(var_0_0.GO_PRAY_POOL, function(arg_32_0)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.GETBOAT, {
			goToPray = true
		})
	end)
	arg_1_0:bind(var_0_0.FETCH_INSTARGRAM, function(arg_33_0, ...)
		arg_1_0:sendNotification(GAME.ACT_INSTAGRAM_FETCH, ...)
	end)
	arg_1_0:bind(var_0_0.MUSIC_GAME_OPERATOR, function(arg_34_0, ...)
		arg_1_0:sendNotification(GAME.SEND_MINI_GAME_OP, ...)
	end)
	arg_1_0:bind(var_0_0.SELECT_ACTIVITY, function(arg_35_0, arg_35_1)
		arg_1_0.viewComponent:verifyTabs(arg_35_1)
	end)
	arg_1_0:bind(var_0_0.SHOW_NEXT_ACTIVITY, function(arg_36_0)
		arg_1_0:showNextActivity()
	end)
	arg_1_0:bind(var_0_0.ACTIVITY_PERMANENT, function(arg_37_0, arg_37_1)
		if PlayerPrefs.GetString("permanent_time", "") ~= pg.gameset.permanent_mark.description then
			PlayerPrefs.SetString("permanent_time", pg.gameset.permanent_mark.description)
			arg_1_0.viewComponent:updateEntrances()
		end

		local var_37_0 = getProxy(ActivityPermanentProxy):getDoingActivity()

		if var_37_0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("activity_permanent_tips3"))
			arg_1_0.viewComponent:verifyTabs(var_37_0.id)
		else
			arg_1_0:addSubLayers(Context.New({
				mediator = ActivityPermanentMediator,
				viewComponent = ActivityPermanentLayer,
				data = {
					finishId = arg_37_1
				}
			}))
		end
	end)
	arg_1_0:bind(var_0_0.FINISH_ACTIVITY_PERMANENT, function(arg_38_0)
		local var_38_0 = getProxy(ActivityPermanentProxy):getDoingActivity()

		assert(var_38_0:canPermanentFinish(), "error permanent activity finish")
		arg_1_0:sendNotification(GAME.ACTIVITY_PERMANENT_FINISH, {
			activity_id = var_38_0.id
		})
	end)
	arg_1_0:bind(var_0_0.GO_PERFORM_COMBAT, function(arg_39_0, arg_39_1, arg_39_2)
		arg_1_0:sendNotification(GAME.BEGIN_STAGE, {
			system = SYSTEM_PERFORM,
			stageId = arg_39_1.stageId,
			memory = arg_39_1.memory
		})
	end)
	arg_1_0:bind(var_0_0.NEXT_DISPLAY_AWARD, function(arg_40_0, arg_40_1, arg_40_2)
		arg_1_0.nextDisplayAwards = arg_40_1
	end)
	arg_1_0:bind(var_0_0.GO_CARDPUZZLE_COMBAT, function(arg_41_0, arg_41_1)
		arg_1_0:sendNotification(GAME.BEGIN_STAGE, {
			system = SYSTEM_CARDPUZZLE,
			combatID = arg_41_1
		})
	end)
	arg_1_0:bind(var_0_0.CHARGE, function(arg_42_0, arg_42_1)
		arg_1_0:sendNotification(GAME.CHARGE_OPERATION, {
			shopId = arg_42_1
		})
	end)
	arg_1_0:bind(var_0_0.BUY_ITEM, function(arg_43_0, arg_43_1, arg_43_2)
		arg_1_0:sendNotification(GAME.SHOPPING, {
			id = arg_43_1,
			count = arg_43_2
		})
	end)
	arg_1_0:bind(var_0_0.OPEN_CHARGE_ITEM_PANEL, function(arg_44_0, arg_44_1)
		arg_1_0:addSubLayers(Context.New({
			mediator = ChargeItemPanelMediator,
			viewComponent = ChargeItemPanelLayer,
			data = {
				panelConfig = arg_44_1
			}
		}))
	end)
	arg_1_0:bind(var_0_0.OPEN_CHARGE_BIRTHDAY, function(arg_45_0, arg_45_1)
		arg_1_0:addSubLayers(Context.New({
			mediator = ChargeBirthdayMediator,
			viewComponent = ChargeBirthdayLayer,
			data = {}
		}))
	end)
	arg_1_0:bind(var_0_0.STORE_DATE, function(arg_46_0, arg_46_1)
		arg_1_0:sendNotification(GAME.ACTIVITY_STORE_DATE, {
			activity_id = arg_46_1.actId,
			intValue = arg_46_1.intValue or 0,
			strValue = arg_46_1.strValue or "",
			callback = arg_46_1.callback
		})
	end)
	arg_1_0:bind(var_0_0.ON_ACT_SHOPPING, function(arg_47_0, arg_47_1, arg_47_2, arg_47_3, arg_47_4)
		arg_1_0:sendNotification(GAME.ACTIVITY_OPERATION, {
			activity_id = arg_47_1,
			cmd = arg_47_2,
			arg1 = arg_47_3,
			arg2 = arg_47_4
		})
	end)
	arg_1_0:bind(var_0_0.ON_ACTIVITY_TASK_SUBMIT, function(arg_48_0, arg_48_1)
		arg_1_0:sendNotification(GAME.SUBMIT_ACTIVITY_TASK, {
			act_id = arg_48_1.activityId,
			task_ids = {
				arg_48_1.id
			}
		})
	end)

	local var_1_0 = getProxy(ActivityProxy)

	arg_1_0.viewComponent:setActivities(var_1_0:getPanelActivities())

	local var_1_1 = getProxy(PlayerProxy):getRawData()

	arg_1_0.viewComponent:setPlayer(var_1_1)

	local var_1_2 = getProxy(BayProxy):getShipById(var_1_1.character)

	arg_1_0.viewComponent:setFlagShip(var_1_2)
end

function var_0_0.onUIAvalible(arg_49_0)
	arg_49_0.UIAvalible = true

	_.each(arg_49_0.UIAvalibleCallbacks, function(arg_50_0)
		arg_50_0()
	end)
end

function var_0_0.initNotificationHandleDic(arg_51_0)
	arg_51_0.handleDic = {
		[ActivityProxy.ACTIVITY_ADDED] = function(arg_52_0, arg_52_1)
			local var_52_0 = arg_52_1:getBody()

			if var_52_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_LOTTERY then
				return
			end

			arg_52_0.viewComponent:updateActivity(var_52_0)

			if ActivityConst.AOERLIANG_TASK_ID == var_52_0.id then
				arg_52_0.viewComponent:update_task_list_auto_aoerliang(var_52_0)
			end
		end,
		[ActivityProxy.ACTIVITY_UPDATED] = function(...)
			arg_51_0.handleDic[ActivityProxy.ACTIVITY_ADDED](...)
		end,
		[ActivityProxy.ACTIVITY_DELETED] = function(arg_54_0, arg_54_1)
			local var_54_0 = arg_54_1:getBody()

			arg_54_0.viewComponent:removeActivity(var_54_0)
		end,
		[ActivityProxy.ACTIVITY_OPERATION_DONE] = function(arg_55_0, arg_55_1)
			local var_55_0 = arg_55_1:getBody()

			if ActivityConst.AOERLIANG_TASK_ID == var_55_0 then
				return
			end

			if ActivityConst.HOLOLIVE_MORNING_ID == var_55_0 then
				local var_55_1 = arg_55_0.viewComponent.pageDic[ActivityConst.HOLOLIVE_MORNING_ID]
			end

			arg_55_0:showNextActivity()
		end,
		[ActivityProxy.ACTIVITY_SHOW_AWARDS] = function(arg_56_0, arg_56_1)
			local var_56_0 = arg_56_1:getBody()
			local var_56_1 = var_56_0.awards

			if arg_56_0.nextDisplayAwards and #arg_56_0.nextDisplayAwards > 0 then
				for iter_56_0 = 1, #arg_56_0.nextDisplayAwards do
					table.insert(var_56_1, arg_56_0.nextDisplayAwards[iter_56_0])
				end
			end

			arg_56_0.nextDisplayAwards = {}

			arg_56_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_56_1, var_56_0.callback)
		end,
		[ActivityProxy.ACTIVITY_SHOW_BB_RESULT] = function(arg_57_0, arg_57_1)
			local var_57_0 = arg_57_1:getBody()

			arg_57_0.viewComponent:emit(ActivityMediator.ON_BOBING_RESULT, var_57_0)
		end,
		[ActivityProxy.ACTIVITY_SHOW_LOTTERY_AWARD_RESULT] = function(arg_58_0, arg_58_1)
			local var_58_0 = arg_58_1:getBody()
			local var_58_1 = var_58_0.activityID

			arg_58_0.viewComponent.pageDic[var_58_1]:showLotteryAwardResult(var_58_0.awards, var_58_0.number, var_58_0.callback)
		end,
		[ActivityProxy.ACTIVITY_SHOW_SHAKE_BEADS_RESULT] = function(arg_59_0, arg_59_1)
			local var_59_0 = arg_59_1:getBody()

			arg_59_0.viewComponent:emit(ActivityMediator.ON_SHAKE_BEADS_RESULT, var_59_0)
		end,
		[GAME.COLORING_ACHIEVE_DONE] = function(arg_60_0, arg_60_1)
			arg_60_0.viewComponent:playBonusAnim(function()
				local var_61_0 = arg_60_1:getBody()

				arg_60_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_61_0.drops, function()
					arg_60_0.viewComponent:flush_coloring()
				end)
			end)
		end,
		[GAME.SUBMIT_TASK_DONE] = function(arg_63_0, arg_63_1)
			local var_63_0 = arg_63_1:getBody()

			arg_63_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_63_0, function()
				arg_63_0.viewComponent:updateTaskLayers()
			end)
		end,
		[GAME.SUBMIT_ACTIVITY_TASK_DONE] = function(arg_65_0, arg_65_1)
			local var_65_0 = arg_65_1:getBody()

			arg_65_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_65_0.awards, function()
				arg_65_0.viewComponent:checkAutoHideActivity()
				arg_65_0.viewComponent:updateTaskLayers()
				existCall(var_65_0.callback)
			end)
		end,
		[GAME.ACT_NEW_PT_DONE] = function(arg_67_0, arg_67_1)
			local var_67_0 = arg_67_1:getBody()

			arg_67_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_67_0.awards, var_67_0.callback)
		end,
		[GAME.BEGIN_STAGE_DONE] = function(arg_68_0, arg_68_1)
			local var_68_0 = arg_68_1:getBody()

			arg_68_0:sendNotification(GAME.GO_SCENE, SCENE.COMBATLOAD, var_68_0)
		end,
		[GAME.RETURN_AWARD_OP_DONE] = function(arg_69_0, arg_69_1)
			local var_69_0 = arg_69_1:getBody()

			arg_69_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_69_0.awards)
		end,
		[VoteProxy.VOTE_ORDER_BOOK_DELETE] = function(arg_70_0, arg_70_1)
			return
		end,
		[VoteProxy.VOTE_ORDER_BOOK_UPDATE] = function(...)
			arg_51_0.handleDic[VoteProxy.VOTE_ORDER_BOOK_DELETE](...)
		end,
		[GAME.REMOVE_LAYERS] = function(arg_72_0, arg_72_1)
			if arg_72_1:getBody().context.mediator == VoteFameHallMediator then
				arg_72_0.viewComponent:updateEntrances()
			end

			arg_72_0.viewComponent:removeLayers()
		end,
		[GAME.MONOPOLY_AWARD_DONE] = function(arg_73_0, arg_73_1)
			local var_73_0 = arg_73_1:getBody()
			local var_73_1 = arg_73_0.viewComponent.pageDic[arg_73_0.viewComponent.activity.id]

			if var_73_1 and var_73_1.activity:getConfig("type") == ActivityConst.ACTIVITY_TYPE_MONOPOLY and var_73_1.onAward then
				var_73_1:onAward(var_73_0.awards, var_73_0.callback)
			elseif var_73_0.autoFlag then
				arg_73_0.viewComponent:emit(BaseUI.ON_ACHIEVE_AUTO, var_73_0.awards, 1, var_73_0.callback)
			else
				arg_73_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_73_0.awards, var_73_0.callback)
			end
		end,
		[GAME.SEND_MINI_GAME_OP_DONE] = function(arg_74_0, arg_74_1)
			local var_74_0 = arg_74_1:getBody()
			local var_74_1 = {
				function(arg_75_0)
					local var_75_0 = var_74_0.awards

					if #var_75_0 > 0 then
						if arg_74_0.viewComponent then
							arg_74_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_75_0, arg_75_0)
						else
							arg_74_0:emit(BaseUI.ON_ACHIEVE, var_75_0, arg_75_0)
						end
					else
						arg_75_0()
					end
				end
			}

			seriesAsync(var_74_1, function()
				arg_74_0.viewComponent:updateTaskLayers()
			end)
		end,
		[GAME.ACTIVITY_PERMANENT_START_DONE] = function(arg_77_0, arg_77_1)
			local var_77_0 = arg_77_1:getBody()

			arg_77_0.viewComponent:verifyTabs(var_77_0.id)
		end,
		[GAME.ACTIVITY_PERMANENT_FINISH_DONE] = function(arg_78_0, arg_78_1)
			local var_78_0 = arg_78_1:getBody()

			arg_78_0.viewComponent:emit(ActivityMediator.ACTIVITY_PERMANENT, var_78_0.activity_id)
		end,
		[GAME.MEMORYBOOK_UNLOCK_AWARD_DONE] = function(arg_79_0, arg_79_1)
			local var_79_0 = arg_79_1:getBody()

			arg_79_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_79_0.awards)
		end,
		[GAME.LOAD_LAYERS] = function(arg_80_0, arg_80_1)
			local var_80_0 = arg_80_1:getBody()

			arg_80_0.viewComponent:loadLayers()
		end,
		[GAME.CHARGE_SUCCESS] = function(arg_81_0, arg_81_1)
			local var_81_0 = arg_81_1:getBody()

			arg_81_0.viewComponent:updateTaskLayers()

			local var_81_1 = Goods.Create({
				shop_id = var_81_0.shopId
			}, Goods.TYPE_CHARGE)

			arg_81_0.viewComponent:OnChargeSuccess(var_81_1)
		end,
		[GAME.SHOPPING_DONE] = function(arg_82_0, arg_82_1)
			local var_82_0 = arg_82_1:getBody()

			arg_82_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_82_0.awards, function()
				arg_82_0.viewComponent:updateTaskLayers()
			end)
		end,
		[GAME.ACT_MANUAL_SIGN_DONE] = function(arg_84_0, arg_84_1)
			local var_84_0 = arg_84_1:getBody()

			arg_84_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_84_0.awards)
		end,
		[ActivityProxy.ACTIVITY_SHOP_SHOW_AWARDS] = function(arg_85_0, arg_85_1)
			local var_85_0 = arg_85_1:getBody()

			arg_85_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_85_0.awards, function()
				local var_86_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_UR_EXCHANGE)

				if var_86_0 and not var_86_0:isShow() then
					arg_85_0.viewComponent:removeActivity(var_86_0.id)
				end

				arg_85_0.viewComponent:updateTaskLayers()
				existCall(var_85_0.callback)
			end)
		end
	}
end

function var_0_0.showNextActivity(arg_87_0)
	local var_87_0 = getProxy(ActivityProxy)

	if not var_87_0 then
		return
	end

	local var_87_1 = var_87_0:findNextAutoActivity()

	if var_87_1 then
		if var_87_1.id == ActivityConst.BLACK_FRIDAY_SIGNIN_ACT_ID then
			arg_87_0.contextData.showByNextAct = true

			arg_87_0.viewComponent:verifyTabs(ActivityConst.BLACK_FRIDAY_ACT_ID)
		else
			arg_87_0.viewComponent:verifyTabs(var_87_1.id)
		end

		local var_87_2 = var_87_1:getConfig("type")

		if var_87_2 == ActivityConst.ACTIVITY_TYPE_7DAYSLOGIN then
			arg_87_0:sendNotification(GAME.ACTIVITY_OPERATION, {
				cmd = 1,
				activity_id = var_87_1.id
			})
		elseif var_87_2 == ActivityConst.ACTIVITY_TYPE_MONTHSIGN then
			local var_87_3 = var_87_1:getSpecialData("reMonthSignDay") ~= nil and 3 or 1

			arg_87_0:sendNotification(GAME.ACTIVITY_OPERATION, {
				activity_id = var_87_1.id,
				cmd = var_87_3,
				arg1 = var_87_1:getSpecialData("reMonthSignDay")
			})
		elseif var_87_2 == ActivityConst.ACTIVITY_TYPE_PROGRESSLOGIN then
			arg_87_0:sendNotification(GAME.ACTIVITY_OPERATION, {
				activity_id = var_87_1.id,
				cmd = var_87_1.data1 < 7 and 1 or 2
			})
		elseif var_87_1.id == ActivityConst.SHADOW_PLAY_ID then
			var_87_1.clientData1 = 1

			arg_87_0:showNextActivity()
		end
	elseif not arg_87_0.viewComponent.activity then
		local var_87_4 = var_87_0:getPanelActivities()
		local var_87_5 = arg_87_0.contextData.id or arg_87_0.contextData.type and checkExist(_.detect(var_87_4, function(arg_88_0)
			return arg_88_0:getConfig("type") == arg_87_0.contextData.type
		end), {
			"id"
		}) or 0

		arg_87_0.viewComponent:verifyTabs(var_87_5)
	end
end

return var_0_0
