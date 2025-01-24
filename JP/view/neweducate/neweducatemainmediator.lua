local var_0_0 = class("NewEducateMainMediator", import("view.newEducate.base.NewEducateContextMediator"))

var_0_0.OPEN_COLLECT_LAYER = "NewEducateMainMediator.OPEN_COLLECT_LAYER"
var_0_0.ON_SELECT_MIND = "NewEducateMainMediator.ON_SELECT_MIND"
var_0_0.ON_UPGRADE_FAVOR = "NewEducateMainMediator.ON_UPGRADE_FAVOR"
var_0_0.ON_TRIGGER_MAIN_EVENT = "NewEducateMainMediator.ON_TRIGGER_MAIN_EVENT"
var_0_0.ON_REQ_TALENTS = "NewEducateMainMediator.ON_REQ_TALENTS"
var_0_0.ON_REQ_TOPICS = "NewEducateMainMediator.ON_REQ_TOPICS"
var_0_0.ON_SELECT_TOPIC = "NewEducateMainMediator.ON_SELECT_TOPIC"
var_0_0.ON_SET_ASSESS_RANK = "NewEducateMainMediator.ON_SET_ASSESS_RANK"
var_0_0.ON_STAGE_CHANGE = "NewEducateMainMediator.ON_STAGE_CHANGE"
var_0_0.ON_NEXT_PLAN = "NewEducateMainMediator.ON_NEXT_PLAN"
var_0_0.ON_REQ_MAP = "NewEducateMainMediator.ON_REQ_MAP"
var_0_0.ON_REQ_ENDINGS = "NewEducateMainMediator.ON_REQ_ENDINGS"
var_0_0.ON_RESET = "NewEducateMainMediator.ON_RESET"
var_0_0.ON_SELECT_ENDING = "NewEducateMainMediator.ON_SELECT_ENDING"
var_0_0.ON_CLEAR_NODE_CHAIN = "NewEducateMainMediator.ON_CLEAR_NODE_CHAIN"

function var_0_0.register(arg_1_0)
	arg_1_0:bind(var_0_0.OPEN_COLLECT_LAYER, function(arg_2_0)
		arg_1_0:addSubLayers(Context.New({
			mediator = NewEducateCollectEntranceMediator,
			viewComponent = NewEducateCollectEntranceLayer
		}))
	end)
	arg_1_0:bind(var_0_0.ON_SELECT_MIND, function(arg_3_0, arg_3_1)
		arg_1_0:sendNotification(GAME.NEW_EDUCATE_SEL_MIND, {
			id = arg_1_0.contextData.char.id,
			callback = arg_3_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_UPGRADE_FAVOR, function(arg_4_0, arg_4_1)
		arg_1_0:sendNotification(GAME.NEW_EDUCATE_UPGRADE_FAVOR, {
			id = arg_1_0.contextData.char.id,
			callback = arg_4_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_TRIGGER_MAIN_EVENT, function(arg_5_0)
		arg_1_0:sendNotification(GAME.NEW_EDUCATE_MAIN_EVENT, {
			id = arg_1_0.contextData.char.id
		})
	end)
	arg_1_0:bind(var_0_0.ON_REQ_TALENTS, function(arg_6_0, arg_6_1)
		arg_1_0:sendNotification(GAME.NEW_EDUCATE_GET_TALENTS, {
			id = arg_1_0.contextData.char.id,
			callback = arg_6_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_REQ_TOPICS, function(arg_7_0, arg_7_1)
		arg_1_0:sendNotification(GAME.NEW_EDUCATE_GET_TOPICS, {
			id = arg_1_0.contextData.char.id,
			callback = arg_7_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_SELECT_TOPIC, function(arg_8_0, arg_8_1)
		arg_1_0:sendNotification(GAME.NEW_EDUCATE_SEL_TOPIC, {
			id = arg_1_0.contextData.char.id,
			topicId = arg_8_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_NEXT_PLAN, function(arg_9_0, arg_9_1)
		arg_1_0:sendNotification(GAME.NEW_EDUCATE_NEXT_PLAN, {
			rePlay = true,
			id = arg_1_0.contextData.char.id
		})
	end)
	arg_1_0:bind(var_0_0.ON_SET_ASSESS_RANK, function(arg_10_0, arg_10_1, arg_10_2)
		arg_1_0:sendNotification(GAME.NEW_EDUCATE_ASSESS, {
			id = arg_1_0.contextData.char.id,
			rank = arg_10_1,
			callback = arg_10_2
		})
	end)
	arg_1_0:bind(var_0_0.ON_STAGE_CHANGE, function(arg_11_0)
		arg_1_0:sendNotification(GAME.NEW_EDUCATE_CHANGE_PHASE, {
			id = arg_1_0.contextData.char.id
		})
	end)
	arg_1_0:bind(var_0_0.ON_REQ_MAP, function(arg_12_0)
		arg_1_0:sendNotification(GAME.NEW_EDUCATE_GET_MAP, {
			id = arg_1_0.contextData.char.id
		})
	end)
	arg_1_0:bind(var_0_0.ON_REQ_ENDINGS, function(arg_13_0, arg_13_1)
		arg_1_0:sendNotification(GAME.NEW_EDUCATE_GET_ENDINGS, {
			id = arg_1_0.contextData.char.id,
			callback = arg_13_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_RESET, function(arg_14_0, arg_14_1)
		arg_1_0:sendNotification(GAME.NEW_EDUCATE_RESET, {
			id = arg_1_0.contextData.char.id,
			callback = arg_14_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_SELECT_ENDING, function(arg_15_0, arg_15_1)
		arg_1_0:sendNotification(GAME.NEW_EDUCATE_SEL_ENDING, {
			isMain = true,
			id = arg_1_0.contextData.char.id,
			endingId = arg_15_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_CLEAR_NODE_CHAIN, function(arg_16_0)
		arg_1_0:sendNotification(GAME.NEW_EDUCATE_CLEAR_NODE_CHAIN, {
			id = arg_1_0.contextData.char.id
		})
	end)
end

function var_0_0.listNotificationInterests(arg_17_0)
	return {
		NewEducateProxy.RESOURCE_UPDATED,
		NewEducateProxy.ATTR_UPDATED,
		NewEducateProxy.PERSONALITY_UPDATED,
		NewEducateProxy.TALENT_UPDATED,
		NewEducateProxy.STATUS_UPDATED,
		NewEducateProxy.NEXT_ROUND,
		GAME.NEW_EDUCATE_SEL_TOPIC_DONE,
		GAME.NEW_EDUCATE_NODE_START,
		GAME.NEW_EDUCATE_NEXT_NODE,
		GAME.NEW_EDUCATE_CHECK_FSM,
		GAME.NEW_EDUCATE_GET_EXTRA_DROP_DONE,
		GAME.NEW_EDUCATE_UPGRADE_FAVOR_DONE,
		GAME.NEW_EDUCATE_REFRESH_DONE,
		GAME.NEW_EDUCATE_CHANGE_PHASE_DONE,
		GAME.NEW_EDUCATE_NEXT_PLAN_DONE,
		GAME.NEW_EDUCATE_GET_MAP_DONE,
		GAME.NEW_EDUCATE_SEL_MIND_DONE,
		GAME.NEW_EDUCATE_SEL_ENDING_DONE,
		GAME.NEW_EDUCATE_SET_CALL_DONE
	}
end

function var_0_0.handleNotification(arg_18_0, arg_18_1)
	local var_18_0 = arg_18_1:getName()
	local var_18_1 = arg_18_1:getBody()

	if var_18_0 == NewEducateProxy.RESOURCE_UPDATED then
		arg_18_0.viewComponent:OnResUpdate()
	elseif var_18_0 == NewEducateProxy.ATTR_UPDATED then
		arg_18_0.viewComponent:OnAttrUpdate()
	elseif var_18_0 == NewEducateProxy.PERSONALITY_UPDATED then
		arg_18_0.viewComponent:OnPersonalityUpdate(var_18_1.number, var_18_1.oldTag)
	elseif var_18_0 == NewEducateProxy.TALENT_UPDATED then
		arg_18_0.viewComponent:OnTalentUpdate()
	elseif var_18_0 == NewEducateProxy.STATUS_UPDATED then
		arg_18_0.viewComponent:OnStatusUpdate()
	elseif var_18_0 == NewEducateProxy.NEXT_ROUND then
		arg_18_0.viewComponent:OnNextRound()
	elseif var_18_0 == GAME.NEW_EDUCATE_NODE_START then
		arg_18_0.viewComponent:OnNodeStart(var_18_1.node)
	elseif var_18_0 == GAME.NEW_EDUCATE_NEXT_NODE then
		arg_18_0.viewComponent:OnNextNode(var_18_1)
	elseif var_18_0 == GAME.NEW_EDUCATE_CHECK_FSM then
		arg_18_0.viewComponent:CheckFSM()
	elseif var_18_0 == GAME.NEW_EDUCATE_GET_EXTRA_DROP_DONE then
		if #var_18_1.drops == 0 then
			arg_18_0:AddResultLayer(var_18_1)
		else
			arg_18_0.viewComponent:emit(NewEducateBaseUI.ON_DROP, {
				items = var_18_1.drops,
				removeFunc = function()
					arg_18_0:AddResultLayer(var_18_1)
				end
			})
		end
	elseif var_18_0 == GAME.NEW_EDUCATE_UPGRADE_FAVOR_DONE then
		arg_18_0.viewComponent:UpdateFavorInfo()
		arg_18_0.viewComponent:emit(NewEducateBaseUI.ON_DROP, {
			isFavor = true,
			items = var_18_1.drops,
			removeFunc = function()
				arg_18_0.viewComponent:CheckFavorUpgrade(var_18_1.callback)
			end
		})
	elseif var_18_0 == GAME.NEW_EDUCATE_REFRESH_DONE then
		arg_18_0.viewComponent:OnReset()
	elseif var_18_0 == GAME.NEW_EDUCATE_SEL_TOPIC_DONE then
		arg_18_0:StartNodeWithCheckDrops(var_18_1)
	elseif var_18_0 == GAME.NEW_EDUCATE_CHANGE_PHASE_DONE then
		arg_18_0.viewComponent:AddNewRoundDrops(var_18_1.drops)
		arg_18_0:CheckFirstNodeExist(var_18_1.node)
	elseif var_18_0 == GAME.NEW_EDUCATE_NEXT_PLAN_DONE then
		local function var_18_2()
			if var_18_1.isFristNode then
				arg_18_0.viewComponent:OnNodeStart(var_18_1.node)
			else
				arg_18_0.viewComponent:OnNextNode(var_18_1)
			end
		end

		if #var_18_1.drops == 0 then
			var_18_2()
		else
			arg_18_0.viewComponent:emit(NewEducateBaseUI.ON_DROP, {
				items = var_18_1.drops,
				removeFunc = var_18_2
			})
		end
	elseif var_18_0 == GAME.NEW_EDUCATE_GET_MAP_DONE then
		if #var_18_1.drops == 0 then
			arg_18_0.viewComponent:CheckFSM()
		else
			arg_18_0.viewComponent:emit(NewEducateBaseUI.ON_DROP, {
				items = var_18_1.drops,
				removeFunc = function()
					arg_18_0.viewComponent:CheckFSM()
				end
			})
		end
	elseif var_18_0 == GAME.NEW_EDUCATE_SEL_MIND_DONE then
		arg_18_0:StartNodeWithCheckDrops(var_18_1)
	elseif var_18_0 == GAME.NEW_EDUCATE_SEL_ENDING_DONE then
		if var_18_1.isMain then
			arg_18_0.viewComponent:OnSelDone(var_18_1.id)
		end
	elseif var_18_0 == GAME.NEW_EDUCATE_SET_CALL_DONE then
		arg_18_0.viewComponent:UpdateCallName()
	end
end

function var_0_0.CheckFirstNodeExist(arg_23_0, arg_23_1)
	if arg_23_1 == 0 then
		arg_23_0.viewComponent:SeriesCheck()
	else
		arg_23_0.viewComponent:OnNodeStart(arg_23_1)
	end
end

function var_0_0.StartNodeWithCheckDrops(arg_24_0, arg_24_1)
	if #arg_24_1.drops == 0 then
		arg_24_0.viewComponent:OnNodeStart(arg_24_1.node)
	else
		arg_24_0.viewComponent:emit(NewEducateBaseUI.ON_DROP, {
			items = arg_24_1.drops,
			removeFunc = function()
				arg_24_0.viewComponent:OnNodeStart(arg_24_1.node)
			end
		})
	end
end

function var_0_0.AddResultLayer(arg_26_0, arg_26_1)
	if #arg_26_1.scheduleDrops > 0 then
		arg_26_0:addSubLayers(Context.New({
			viewComponent = NewEducateScheduleResultLayer,
			mediator = NewEducateScheduleResultMediator,
			data = {
				drops = arg_26_1.scheduleDrops,
				onExit = function()
					arg_26_0.viewComponent:CheckFSM()
				end
			}
		}))
	else
		arg_26_0.viewComponent:CheckFSM()
	end
end

return var_0_0
