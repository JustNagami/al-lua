local var_0_0 = class("IslandMediator", import(".base.IslandBaseMediator"))

var_0_0.ON_UPGRADE = "IslandMediator:ON_UPGRADE"
var_0_0.SET_NAME = "IslandMediator:SET_NAME"
var_0_0.ON_EDIT_MANIFESTO = "IslandMediator:ON_EDIT_MANIFESTO"
var_0_0.GET_PROSPERITY_AWARD = "IslandMediator:GET_PROSPERITY_AWARD"
var_0_0.ON_UPGRADE_INVENTORY = "IslandMediator:ON_UPGRADE_INVENTORY"
var_0_0.ON_SELL_ITEM = "IslandMediator:ON_SELL_ITEM"
var_0_0.ON_BATCH_SELL_ITEM = "IslandMediator:ON_BATCH_SELL_ITEM"
var_0_0.ON_BATCH_SELL_ITEM_4_OVERFLOW = "IslandMediator:ON_BATCH_SELL_ITEM_4_OVERFLOW"
var_0_0.ON_REPLACE_ORDER = "IslandMediator:ON_REPLACE_ORDER"
var_0_0.ON_SUBMIT_ORDER = "IslandMediator:ON_SUBMIT_ORDER"
var_0_0.ON_GET_ORDER_EXP_AWARD = "IslandMediator:ON_GET_ORDER_EXP_AWARD"
var_0_0.ON_GEN_NEW_ORDER = "IslandMediator:ON_GEN_NEW_ORDER"
var_0_0.ON_USE_ITEM = "IslandMediator:ON_USE_ITEM"
var_0_0.ON_ACCEPT_TASK = "IslandMediator.ON_ACCEPT_TASK"
var_0_0.ON_SUBMIT_TASK = "IslandMediator.ON_SUBMIT_TASK"
var_0_0.ON_CLIENT_UPDATE_TASK = "IslandMediator.ON_CLIENT_UPDATE_TASK"
var_0_0.ON_SET_TRACE_ID = "IslandMediator.ON_SET_TRACE_ID"
var_0_0.OPEN_SHIP_INDEX = "IslandMediator:OPEN_SHIP_INDEX"
var_0_0.UPGRADE_SKILL = "IslandMediator:UPGRADE_SKILL"
var_0_0.GET_EXTRA_AWARD = "IslandMediator:GET_EXTRA_AWARD"
var_0_0.ON_GIVE_GIFT = "IslandMediator:ON_GIVE_GIFT"
var_0_0.ON_UNLOCK_BUILDING = "IslandMediator:ON_UNLOCK_BUILDING"
var_0_0.ON_UPGRADE_BUILDING = "IslandMediator:ON_UPGRADE_BUILDING"
var_0_0.ON_GET_COMMISSION_AWARD = "IslandMediator:ON_GET_COMMISSION_AWARD"
var_0_0.ON_CHANGE_COMMISSION_FORMULA = "IslandMediator:ON_CHANGE_COMMISSION_FORMULA"
var_0_0.ON_CHANGE_COMMISSION_SHIP = "IslandMediator:ON_CHANGE_COMMISSION_SHIP"
var_0_0.ON_KICK_PLAYER = "IslandMediator:ON_KICK_PLAYER"
var_0_0.SWITCH_MAP = "IslandMediator:SWITCH_MAP"
var_0_0.SAVE_AGORA = "IslandMediator:SAVE_AGORA"
var_0_0.UPGRADE_AGORA = "IslandMediator:UPGRADE_AGORA"
var_0_0.OPEN_FRIEND = "IslandMediator:OPEN_FRIEND"
var_0_0.ONE_KEY = "IslandMediator:ONE_KEY"
var_0_0.ON_UNLOCK_TECH = "IslandMediator:ON_UNLOCK_TECH"
var_0_0.ON_FINISH_TECH_IMMD = "IslandMediator:ON_FINISH_TECH_IMMD"
var_0_0.SET_ORDER_TENDENCY = "IslandMediator:SET_ORDER_TENDENCY"
var_0_0.SUBMIT_SHIP_ORDER_ITME = "IslandMediator:SUBMIT_SHIP_ORDER_ITME"
var_0_0.GET_SHIP_ORDER_AWARD = "IslandMediator:GET_SHIP_ORDER_AWARD"
var_0_0.UNLOKC_SHIP_ORDER = "IslandMediator:UNLOKC_SHIP_ORDER"
var_0_0.OPEN_PAGE = "IslandMediator:OPEN_PAGE"
var_0_0.OPEN_SHOP = "IslandMediator:OPEN_SHOP"
var_0_0.GET_SHOP_DATA = "IslandMediator:GET_SHOP_DATA"
var_0_0.BUY_COMMODITY = "IslandMediator:BUY_COMMODITY"
var_0_0.REFRESH_SHOP_BY_PLAYER = "IslandMediator:REFRESH_SHOP_BY_PLAYER"
var_0_0.START_DELEGATION = "IslandMediator:START_DELEGATION"
var_0_0.STOP_DELEGATION = "IslandMediator:STOP_DELEGATION"
var_0_0.GET_DELEGATION_AWARD = "IslandMediator:GET_DELEGATION_AWARD"
var_0_0.USE_SPEEDUPCARD = "IslandMediator:USE_SPEEDUPCARD"

function var_0_0._register(arg_1_0)
	arg_1_0:bind(var_0_0.OPEN_PAGE, function(arg_2_0, arg_2_1)
		arg_1_0.viewComponent:OpenPage(_G[arg_2_1[1]], arg_2_1[2])
	end)
	arg_1_0:bind(var_0_0.UNLOKC_SHIP_ORDER, function(arg_3_0, arg_3_1)
		arg_1_0:sendNotification(GAME.ISLAND_SHIP_ORDER_OP, {
			op = IslandShipOrder.OP_TYPE_UNLOCK,
			slotId = arg_3_1
		})
	end)
	arg_1_0:bind(var_0_0.GET_SHIP_ORDER_AWARD, function(arg_4_0, arg_4_1)
		arg_1_0:sendNotification(GAME.ISLAND_SHIP_ORDER_OP, {
			op = IslandShipOrder.OP_TYPE_GET_AWARD,
			slotId = arg_4_1
		})
	end)
	arg_1_0:bind(var_0_0.SUBMIT_SHIP_ORDER_ITME, function(arg_5_0, arg_5_1, arg_5_2)
		arg_1_0:sendNotification(GAME.ISLAND_SHIP_ORDER_OP, {
			op = IslandShipOrder.OP_TYPE_LOADUP,
			slotId = arg_5_1,
			index = arg_5_2
		})
	end)
	arg_1_0:bind(var_0_0.SET_ORDER_TENDENCY, function(arg_6_0, arg_6_1)
		arg_1_0:sendNotification(GAME.ISLAND_SET_ORDER_TENDENCY, {
			value = arg_6_1
		})
	end)
	arg_1_0:bind(var_0_0.ONE_KEY, function(arg_7_0)
		arg_1_0:sendNotification(GAME.ISLAND_GET_OVERFLOW_ITEM)
	end)
	arg_1_0:bind(var_0_0.ON_BATCH_SELL_ITEM_4_OVERFLOW, function(arg_8_0, arg_8_1)
		arg_1_0:sendNotification(GAME.ISLAND_BATCH_SELL_ITEM, {
			overflow = true,
			list = arg_8_1
		})
	end)
	arg_1_0:bind(var_0_0.UPGRADE_AGORA, function(arg_9_0)
		arg_1_0:sendNotification(GAME.ISLAND_UPGRADE_AGORA)
	end)
	arg_1_0:bind(var_0_0.SAVE_AGORA, function(arg_10_0, arg_10_1)
		arg_1_0:sendNotification(GAME.ISLAND_SAVE_AGORA, {
			list = arg_10_1
		})
	end)
	arg_1_0:bind(var_0_0.OPEN_FRIEND, function(arg_11_0)
		arg_1_0:addSubLayers(Context.New({
			mediator = IslandFriendMediator,
			viewComponent = IslandFriendScene
		}))
	end)
	arg_1_0:bind(var_0_0.SWITCH_MAP, function(arg_12_0, arg_12_1, arg_12_2)
		local var_12_0 = arg_1_0.viewComponent:GetIsland().id

		arg_1_0:sendNotification(GAME.ISLAND_ENTER_MAP, {
			islandId = var_12_0,
			mapId = arg_12_1,
			callback = function()
				arg_1_0:SwitchScene(arg_12_1, arg_12_2)
			end
		})
	end)
	arg_1_0:bind(var_0_0.ON_KICK_PLAYER, function(arg_14_0, arg_14_1, arg_14_2)
		arg_1_0:sendNotification(GAME.ISLAND_ACCESS_OP, {
			op = arg_14_1,
			list = {
				arg_14_2
			}
		})
	end)
	arg_1_0:bind(var_0_0.ON_GIVE_GIFT, function(arg_15_0, arg_15_1, arg_15_2, arg_15_3)
		arg_1_0:sendNotification(GAME.ISLAND_USE_ITEM, {
			id = arg_15_1,
			count = arg_15_2,
			arg = {
				arg_15_3
			}
		})
	end)
	arg_1_0:bind(var_0_0.GET_EXTRA_AWARD, function(arg_16_0, arg_16_1, arg_16_2)
		arg_1_0:sendNotification(GAME.ISLAND_GET_EXTRA_AWARD, {
			id = arg_16_1,
			op = arg_16_2
		})
	end)
	arg_1_0:bind(var_0_0.UPGRADE_SKILL, function(arg_17_0, arg_17_1)
		arg_1_0:sendNotification(GAME.ISLAND_UPGRADE_SKILL, {
			id = arg_17_1
		})
	end)
	arg_1_0:bind(var_0_0.OPEN_SHIP_INDEX, function(arg_18_0, arg_18_1)
		arg_1_0:addSubLayers(Context.New({
			viewComponent = IslandShipIndexLayer,
			mediator = CustomIndexMediator,
			data = arg_18_1
		}))
	end)
	arg_1_0:bind(var_0_0.ON_USE_ITEM, function(arg_19_0, arg_19_1, arg_19_2)
		arg_1_0:sendNotification(GAME.ISLAND_USE_ITEM, {
			id = arg_19_1,
			count = arg_19_2
		})
	end)
	arg_1_0:bind(var_0_0.ON_GEN_NEW_ORDER, function(arg_20_0, arg_20_1)
		arg_1_0:sendNotification(GAME.ISLAND_GEN_NEW_ORDER, {
			slotId = arg_20_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_GET_ORDER_EXP_AWARD, function(arg_21_0, arg_21_1, arg_21_2)
		arg_1_0:sendNotification(GAME.ISLAND_GET_ORDER_EXP_AWARD, {
			level = arg_21_1,
			callback = arg_21_2
		})
	end)
	arg_1_0:bind(var_0_0.ON_REPLACE_ORDER, function(arg_22_0, arg_22_1)
		arg_1_0:sendNotification(GAME.ISLAND_REPLACE_ORDER, {
			slotId = arg_22_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_SUBMIT_ORDER, function(arg_23_0, arg_23_1)
		arg_1_0:sendNotification(GAME.ISLAND_SUBMIT_ORDER, {
			slotId = arg_23_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_SELL_ITEM, function(arg_24_0, arg_24_1, arg_24_2)
		arg_1_0:sendNotification(GAME.ISLAND_SELL_ITEM, {
			id = arg_24_1,
			count = arg_24_2
		})
	end)
	arg_1_0:bind(var_0_0.ON_BATCH_SELL_ITEM, function(arg_25_0, arg_25_1)
		arg_1_0:sendNotification(GAME.ISLAND_BATCH_SELL_ITEM, {
			list = arg_25_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_UPGRADE_INVENTORY, function(arg_26_0)
		arg_1_0:sendNotification(GAME.ISLAND_UPGRADE_INVENTORY)
	end)
	arg_1_0:bind(var_0_0.GET_PROSPERITY_AWARD, function(arg_27_0, arg_27_1)
		arg_1_0:sendNotification(GAME.ISLAND_PROSPERITY_AWARD, {
			level = arg_27_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_EDIT_MANIFESTO, function(arg_28_0, arg_28_1)
		arg_1_0:sendNotification(GAME.ISLAND_SET_MANIFESTO, {
			manifesto = arg_28_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_UPGRADE, function(arg_29_0)
		arg_1_0:sendNotification(GAME.ISLAND_UPGRADE)
	end)
	arg_1_0:bind(var_0_0.SET_NAME, function(arg_30_0, arg_30_1, arg_30_2)
		arg_1_0:sendNotification(GAME.ISLAND_SET_NAME, {
			name = arg_30_1,
			currency = arg_30_2
		})
	end)
	arg_1_0:bind(var_0_0.ON_ACCEPT_TASK, function(arg_31_0, arg_31_1)
		arg_1_0:sendNotification(GAME.ISLAND_ACCEPT_TASK, {
			taskIds = arg_31_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_SUBMIT_TASK, function(arg_32_0, arg_32_1)
		arg_1_0:sendNotification(GAME.ISLAND_SUBMIT_TASK, {
			taskId = arg_32_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_CLIENT_UPDATE_TASK, function(arg_33_0, arg_33_1)
		arg_1_0:sendNotification(GAME.ISLAND_UPDATE_TASK, {
			taskId = arg_33_1.taskId,
			targetId = arg_33_1.targetId,
			progress = arg_33_1.progress
		})
	end)
	arg_1_0:bind(var_0_0.ON_SET_TRACE_ID, function(arg_34_0, arg_34_1)
		arg_1_0:sendNotification(GAME.ISLAND_SET_TRACE_TASK, {
			traceId = arg_34_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_UNLOCK_BUILDING, function(arg_35_0, arg_35_1)
		arg_1_0:sendNotification(GAME.ISLAND_UNLOCK_BUILDING, {
			buildingId = arg_35_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_UPGRADE_BUILDING, function(arg_36_0, arg_36_1)
		arg_1_0:sendNotification(GAME.ISLAND_UPGRADE_BUILDING, {
			buildingId = arg_36_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_GET_COMMISSION_AWARD, function(arg_37_0, arg_37_1, arg_37_2)
		arg_1_0:sendNotification(GAME.ISLAND_GET_COMMISSION_AWARD, {
			buildingId = arg_37_1,
			commissionId = arg_37_2
		})
	end)
	arg_1_0:bind(var_0_0.ON_CHANGE_COMMISSION_FORMULA, function(arg_38_0, arg_38_1)
		arg_1_0:sendNotification(GAME.ISLAND_CHANGE_COMMISSION_FORMULA, {
			buildingId = arg_38_1.buildingId,
			commissionId = arg_38_1.commissionId,
			formulaId = arg_38_1.formulaId,
			callback = arg_38_1.callback
		})
	end)
	arg_1_0:bind(var_0_0.ON_CHANGE_COMMISSION_SHIP, function(arg_39_0, arg_39_1)
		arg_1_0:sendNotification(GAME.ISLAND_CHANGE_COMMISSION_SHIP, {
			buildingId = arg_39_1.buildingId,
			commissionId = arg_39_1.commissionId,
			shipId = arg_39_1.shipId,
			callback = arg_39_1.callback
		})
	end)
	arg_1_0:bind(var_0_0.ON_UNLOCK_TECH, function(arg_40_0, arg_40_1)
		arg_1_0:sendNotification(GAME.ISLAND_UNLOCK_TECH, {
			techId = arg_40_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_FINISH_TECH_IMMD, function(arg_41_0, arg_41_1, arg_41_2)
		arg_1_0:sendNotification(GAME.ISLAND_FINISH_TECH_IMMD, {
			techId = arg_41_1,
			callback = arg_41_2
		})
	end)
	arg_1_0:bind(var_0_0.START_DELEGATION, function(arg_42_0, arg_42_1, arg_42_2, arg_42_3, arg_42_4, arg_42_5)
		arg_1_0:sendNotification(GAME.ISLAND_START_DELEGATION, {
			build_id = arg_42_1,
			area_id = arg_42_2,
			ship_id = arg_42_3,
			formula_id = arg_42_4,
			num = arg_42_5
		})
	end)
	arg_1_0:bind(var_0_0.STOP_DELEGATION, function(arg_43_0, arg_43_1, arg_43_2)
		arg_1_0:sendNotification(GAME.ISLAND_FINISH_DELEGATION, {
			build_id = arg_43_1,
			area_id = arg_43_2
		})
	end)
	arg_1_0:bind(var_0_0.GET_DELEGATION_AWARD, function(arg_44_0, arg_44_1, arg_44_2, arg_44_3)
		arg_1_0:sendNotification(GAME.ISLAND_GET_DELEGATION_AWARD, {
			build_id = arg_44_1,
			area_id = arg_44_2,
			type = arg_44_3
		})
	end)
	arg_1_0:bind(var_0_0.USE_SPEEDUPCARD, function(arg_45_0, arg_45_1, arg_45_2, arg_45_3, arg_45_4)
		arg_1_0:sendNotification(GAME.ISLAND_USESPEEDUPCARD, {
			build_id = arg_45_1,
			area_id = arg_45_2,
			item_id = arg_45_3,
			num = arg_45_4
		})
	end)
	arg_1_0:bind(var_0_0.GET_SHOP_DATA, function(arg_46_0, arg_46_1, arg_46_2)
		arg_1_0:sendNotification(GAME.ISLAND_SHOP_OP, {
			operation = IslandConst.SHOP_GET_DATA,
			shopId = arg_46_1,
			refreshAll = arg_46_2
		})
	end)
	arg_1_0:bind(var_0_0.BUY_COMMODITY, function(arg_47_0, arg_47_1, arg_47_2, arg_47_3)
		arg_1_0:sendNotification(GAME.ISLAND_SHOP_OP, {
			operation = IslandConst.SHOP_BUY_COMMODITY,
			shopId = arg_47_1,
			commodityId = arg_47_2,
			count = arg_47_3
		})
	end)
	arg_1_0:bind(var_0_0.REFRESH_SHOP_BY_PLAYER, function(arg_48_0, arg_48_1, arg_48_2)
		arg_1_0:sendNotification(GAME.ISLAND_SHOP_OP, {
			operation = IslandConst.SHOP_REFRESH_BY_PLAYER,
			shopId = arg_48_1,
			resource = arg_48_2
		})
	end)
end

function var_0_0._listNotificationInterests(arg_49_0)
	return {
		GAME.ISLAND_SET_NAME_DONE,
		GAME.ISLAND_PROSPERITY_AWARD_DONE,
		GAME.ISLAND_UPGRADE_DONE,
		GAME.ISLAND_SET_MANIFESTO_DONE,
		GAME.ISLAND_UPGRADE_INVENTORY_DONE,
		GAME.ISLAND_SELL_ITEM_DONE,
		GAME.ISLAND_SUBMIT_ORDER_DONE,
		GAME.ISLAND_REPLACE_ORDER_DONE,
		GAME.ISLAND_GET_ORDER_EXP_AWARD_DONE,
		GAME.ISLAND_GET_RANDOM_REFRESH_TASK_DONE,
		GAME.ISLAND_ACCEPT_TASK_DONE,
		GAME.ISLAND_UPDATE_TASK_DONE,
		GAME.ISLAND_SUBMIT_TASK_DONE,
		GAME.ISLAND_SET_TRACE_TASK_DONE,
		GAME.ISLAND_UPGRADE_SKILL_DONE,
		GAME.ISLAND_GET_EXTRA_AWARD_DONE,
		GAME.ISLAND_USE_ITEM_DONE,
		GAME.ISLAND_GET_OVERFLOW_ITEM_DOME,
		GAME.ISLAND_SET_ORDER_TENDENCY_DONE,
		GAME.ISLAND_UNLOCK_TECH_DONE,
		GAME.ISLAND_FINISH_TECH_IMMD_DONE,
		GAME.ISLAND_SHIP_ORDER_OP_DONE,
		GAME.ISLAND_START_DELEGATION_DONE,
		GAME.ISLAND_GET_DELEGATION_AWARD_DONE,
		GAME.ISLAND_FINISH_DELEGATION_DONE,
		GAME.ISLAND_USESPEEDUPCARD_DONE,
		PlayerProxy.UPDATED,
		GAME.ISLAND_SHOP_OP_DONE
	}
end

function var_0_0._handleNotification(arg_50_0, arg_50_1)
	local var_50_0 = arg_50_1:getName()
	local var_50_1 = arg_50_1:getBody()

	if var_50_0 == GAME.ISLAND_PROSPERITY_AWARD_DONE or var_50_0 == GAME.ISLAND_SELL_ITEM_DONE or var_50_0 == GAME.ISLAND_FINISH_TECH_DONE or var_50_0 == GAME.ISLAND_GET_EXTRA_AWARD_DONE or var_50_0 == GAME.ISLAND_FINISH_TECH_IMMD_DONE or var_50_0 == GAME.ISLAND_SHIP_ORDER_OP_DONE then
		arg_50_0:HandleAwardDisplay(var_50_1.dropData, var_50_1.callback)
	elseif var_50_0 == GAME.ISLAND_GET_ORDER_EXP_AWARD_DONE then
		seriesAsync({
			function(arg_51_0)
				arg_50_0.viewComponent:emit(IslandOrderPage.ON_UPDADE, {
					level = var_50_1.level,
					callback = arg_51_0
				})
			end
		}, function()
			arg_50_0:HandleAwardDisplay(var_50_1.dropData, var_50_1.callback)
		end)
	elseif var_50_0 == GAME.ISLAND_GET_OVERFLOW_ITEM_DOME then
		if #var_50_1.awards <= 0 then
			return
		end

		arg_50_0.viewComponent:DisplayAward({
			title = i18n1("以下道具已转移"),
			awards = var_50_1.awards,
			callback = var_50_1.callback
		})
	elseif var_50_0 == GAME.ISLAND_SET_MANIFESTO_DONE then
		pg.TipsMgr.GetInstance():ShowTips(i18n1("修改成功"))
	elseif var_50_0 == GAME.ISLAND_SUBMIT_ORDER_DONE then
		local var_50_2 = {
			function(arg_53_0)
				arg_50_0:HandleAwardDisplay(var_50_1.dropData, arg_53_0)
			end
		}

		seriesAsync(var_50_2, function()
			if var_50_1.callback then
				var_50_1.callback()
			end

			arg_50_0.viewComponent:emit(IslandScene.ON_CHECK_ORDER_EXP_AWARD)
		end)
	elseif var_50_0 == GAME.ISLAND_ACCEPT_TASK_DONE then
		arg_50_0:HandleTaskAccepted(var_50_1)
	elseif var_50_0 == GAME.ISLAND_SUBMIT_TASK_DONE then
		seriesAsync({
			function(arg_55_0)
				local var_55_0 = pg.island_task[var_50_1.taskId].com_perform

				if var_55_0 ~= "" then
					arg_50_0.viewComponent:PlayStory({
						name = var_55_0,
						callback = arg_55_0
					})
				else
					arg_55_0()
				end
			end
		}, function()
			arg_50_0:HandleAwardDisplay(var_50_1.dropData, var_50_1.callback)
		end)
	elseif var_50_0 == GAME.ISLAND_SET_TRACE_TASK_DONE then
		arg_50_0.viewComponent:OnUpdateTrackTask(var_50_1.traceId)
	end
end

function var_0_0.HandleAwardDisplay(arg_57_0, arg_57_1, arg_57_2)
	seriesAsync({
		function(arg_58_0)
			if not arg_57_1.drops or #arg_57_1.drops <= 0 then
				arg_58_0()

				return
			end

			arg_57_0.viewComponent:emit(BaseUI.ON_ACHIEVE, arg_57_1.drops, arg_58_0)
		end,
		function(arg_59_0)
			onNextTick(arg_59_0)
		end,
		function(arg_60_0)
			if not arg_57_1.awards or #arg_57_1.awards <= 0 then
				arg_60_0()

				return
			end

			arg_57_0.viewComponent:DisplayAward({
				title = i18n1("获得道具"),
				awards = arg_57_1.awards,
				callback = arg_60_0
			})
		end,
		function(arg_61_0)
			onNextTick(arg_61_0)
		end,
		function(arg_62_0)
			if not arg_57_1.overflowAwards or #arg_57_1.overflowAwards == 0 then
				arg_62_0()

				return
			end

			arg_57_0.viewComponent:DisplayAward({
				titleColor = "#ab4734",
				title = i18n1("以下道具将存入临时背包"),
				awards = arg_57_1.overflowAwards,
				callback = arg_62_0
			})
		end,
		function(arg_63_0)
			if not arg_57_1.overflowAwards or #arg_57_1.overflowAwards == 0 then
				arg_63_0()

				return
			end

			arg_57_0.viewComponent:OpenPage(IslandInventoryPage)
			arg_63_0()
		end
	}, arg_57_2)
end

function var_0_0.HandleTaskAccepted(arg_64_0, arg_64_1)
	local var_64_0 = {}

	for iter_64_0, iter_64_1 in ipairs(arg_64_1.taskIds) do
		local var_64_1 = pg.island_task[iter_64_1]

		if var_64_1.rec_perform ~= "" then
			table.insert(var_64_0, function(arg_65_0)
				arg_64_0.viewComponent:PlayStory({
					name = var_64_1.rec_perform,
					callback = arg_65_0
				})
			end)
		end

		if var_64_1.trigger_tips == 1 then
			table.insert(var_64_0, function(arg_66_0)
				arg_64_0.viewComponent:OpenPage(Island3dTaskAcceptPage, iter_64_1, arg_66_0)
			end)
		end
	end

	seriesAsync(var_64_0, function()
		existCall(arg_64_1.callback)
	end)
end

return var_0_0
