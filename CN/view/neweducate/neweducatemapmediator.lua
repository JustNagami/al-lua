local var_0_0 = class("NewEducateMapMediator", import("view.newEducate.base.NewEducateContextMediator"))

var_0_0.ON_SITE_NORMAL = "NewEducateMapMediator.ON_SITE_NORMAL"
var_0_0.ON_SITE_EVENT = "NewEducateMapMediator.ON_SITE_EVENT"
var_0_0.ON_SITE_SHIP = "NewEducateMapMediator.ON_SITE_SHIP"
var_0_0.ON_SHOPPING = "NewEducateMapMediator.ON_SHOPPING"
var_0_0.ON_UPGRADE_NORMAL = "NewEducateMapMediator.ON_UPGRADE_NORMAL"
var_0_0.ON_SHIP_UPGRADE_LEVEL = "NewEducateMapMediator.ON_SHIP_UPGRADE_LEVEL"

function var_0_0.register(arg_1_0)
	arg_1_0:bind(var_0_0.ON_SITE_NORMAL, function(arg_2_0, arg_2_1)
		arg_1_0:sendNotification(GAME.NEW_EDUCATE_MAP_NORMAL, {
			id = arg_1_0.contextData.char.id,
			normalId = arg_2_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_SITE_EVENT, function(arg_3_0, arg_3_1)
		arg_1_0:sendNotification(GAME.NEW_EDUCATE_MAP_EVENT, {
			id = arg_1_0.contextData.char.id,
			eventId = arg_3_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_SITE_SHIP, function(arg_4_0, arg_4_1)
		arg_1_0:sendNotification(GAME.NEW_EDUCATE_MAP_SHIP, {
			id = arg_1_0.contextData.char.id,
			shipId = arg_4_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_SHOPPING, function(arg_5_0, arg_5_1, arg_5_2)
		arg_1_0:sendNotification(GAME.NEW_EDUCATE_SHOPPING, {
			id = arg_1_0.contextData.char.id,
			goodId = arg_5_1,
			num = arg_5_2 or 1
		})
	end)
	arg_1_0:bind(var_0_0.ON_UPGRADE_NORMAL, function(arg_6_0, arg_6_1, arg_6_2)
		arg_1_0:sendNotification(GAME.NEW_EDUCATE_UPGRADE_NORMAL_SITE, {
			id = arg_1_0.contextData.char.id,
			normalId = arg_6_1,
			callback = arg_6_2
		})
	end)
end

function var_0_0.listNotificationInterests(arg_7_0)
	return {
		NewEducateProxy.RESOURCE_UPDATED,
		NewEducateProxy.ATTR_UPDATED,
		NewEducateProxy.PERSONALITY_UPDATED,
		NewEducateProxy.TALENT_UPDATED,
		NewEducateProxy.STATUS_UPDATED,
		GAME.NEW_EDUCATE_NODE_START,
		GAME.NEW_EDUCATE_NEXT_NODE,
		GAME.NEW_EDUCATE_SHOPPING_DONE,
		GAME.NEW_EDUCATE_REFRESH_DONE,
		GAME.NEW_EDUCATE_MAP_NORMAL_DONE,
		GAME.NEW_EDUCATE_MAP_EVENT_DONE,
		GAME.NEW_EDUCATE_MAP_SHIP_DONE,
		var_0_0.ON_SHIP_UPGRADE_LEVEL
	}
end

function var_0_0.handleNotification(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_1:getName()
	local var_8_1 = arg_8_1:getBody()

	if var_8_0 == NewEducateProxy.RESOURCE_UPDATED then
		arg_8_0.viewComponent:OnResUpdate()
	elseif var_8_0 == NewEducateProxy.ATTR_UPDATED then
		arg_8_0.viewComponent:OnAttrUpdate()
	elseif var_8_0 == NewEducateProxy.PERSONALITY_UPDATED then
		arg_8_0.viewComponent:OnPersonalityUpdate(var_8_1.number, var_8_1.oldTag)
	elseif var_8_0 == NewEducateProxy.TALENT_UPDATED then
		arg_8_0.viewComponent:OnTalentUpdate()
	elseif var_8_0 == NewEducateProxy.STATUS_UPDATED then
		arg_8_0.viewComponent:OnStatusUpdate()
	elseif var_8_0 == GAME.NEW_EDUCATE_NODE_START then
		arg_8_0.viewComponent:OnNodeStart(var_8_1.node)
	elseif var_8_0 == GAME.NEW_EDUCATE_NEXT_NODE then
		arg_8_0.viewComponent:OnNextNode(var_8_1)
	elseif var_8_0 == GAME.NEW_EDUCATE_SHOPPING_DONE then
		arg_8_0.viewComponent:emit(NewEducateBaseUI.ON_DROP, {
			items = var_8_1.drops,
			removeFunc = function()
				arg_8_0.viewComponent:OnShoppingDone()
			end
		})
	elseif var_8_0 == GAME.NEW_EDUCATE_REFRESH_DONE then
		arg_8_0.viewComponent:emit(NewEducateBaseUI.GO_SCENE, SCENE.NEW_EDUCATE, {
			id = var_8_1.id
		})
	elseif var_8_0 == GAME.NEW_EDUCATE_MAP_NORMAL_DONE then
		arg_8_0:StartNodeWithCheckDrops(var_8_1)
	elseif var_8_0 == GAME.NEW_EDUCATE_MAP_EVENT_DONE then
		arg_8_0:StartNodeWithCheckDrops(var_8_1)
	elseif var_8_0 == GAME.NEW_EDUCATE_MAP_SHIP_DONE then
		arg_8_0:StartNodeWithCheckDrops(var_8_1)
	elseif var_8_0 == var_0_0.ON_SHIP_UPGRADE_LEVEL then
		arg_8_0.viewComponent:UpdateShipLv()
	end
end

function var_0_0.StartNodeWithCheckDrops(arg_10_0, arg_10_1)
	if #arg_10_1.drops == 0 then
		arg_10_0.viewComponent:OnNodeStart(arg_10_1.node)
	else
		arg_10_0.viewComponent:emit(NewEducateBaseUI.ON_DROP, {
			items = arg_10_1.drops,
			removeFunc = function()
				arg_10_0.viewComponent:OnNodeStart(arg_10_1.node)
			end
		})
	end
end

return var_0_0
