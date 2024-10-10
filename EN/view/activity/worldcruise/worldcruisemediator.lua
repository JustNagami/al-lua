local var_0_0 = class("WorldCruiseMediator", import("view.base.ContextMediator"))

var_0_0.EVENT_GET_AWARD = "WorldCruiseMediator.EVENT_GET_AWARD"
var_0_0.EVENT_GET_AWARD_PAY = "WorldCruiseMediator.EVENT_GET_AWARD_PAY"
var_0_0.EVENT_GET_AWARD_ALL = "WorldCruiseMediator.EVENT_GET_AWARD_ALL"
var_0_0.EVENT_GO_CHARGE = "WorldCruiseMediator.EVENT_GO_CHARGE"
var_0_0.EVENT_OPEN_BIRTHDAY = "WorldCruiseMediator.EVENT_OPEN_BIRTHDAY"
var_0_0.quickTaskGoodId = 61017
var_0_0.ON_TASK_GO = "WorldCruiseMediator.ON_TASK_GO"
var_0_0.ON_TASK_SUBMIT = "WorldCruiseMediator.ON_TASK_SUBMIT"
var_0_0.ON_TASK_QUICK_SUBMIT = "WorldCruiseMediator.ON_TASK_QUICK_SUBMIT"
var_0_0.ON_BUY_QUICK_TASK_ITEM = "WorldCruiseMediator.ON_BUY_QUICK_TASK_ITEM"
var_0_0.ON_CRUISE_SHOPPING = "WorldCruiseMediator.ON_CRUISE_SHOPPING"
var_0_0.ON_ESKIN_PREVIEW = "NewShopsMediator:ON_ESKIN_PREVIEW"

function var_0_0.register(arg_1_0)
	arg_1_0:bind(var_0_0.ON_ESKIN_PREVIEW, function(arg_2_0, arg_2_1)
		local var_2_0 = pg.equip_skin_template[arg_2_1]
		local var_2_1 = Ship.New({
			id = var_2_0.ship_config_id,
			configId = var_2_0.ship_config_id,
			skin_id = var_2_0.ship_skin_id
		})
		local var_2_2 = {}

		if var_2_0.ship_skin_id ~= 0 then
			var_2_2 = {
				equipSkinId = 0,
				shipVO = var_2_1,
				weaponIds = {},
				weight = arg_1_0.contextData.weight and arg_1_0.contextData.weight + 1
			}
		else
			var_2_2 = {
				shipVO = var_2_1,
				weaponIds = Clone(var_2_0.weapon_ids),
				equipSkinId = arg_2_1,
				weight = arg_1_0.contextData.weight and arg_1_0.contextData.weight + 1
			}
		end

		arg_1_0:addSubLayers(Context.New({
			viewComponent = ShipPreviewLayer,
			mediator = ShipPreviewMediator,
			data = var_2_2
		}))
	end)
	arg_1_0:bind(var_0_0.EVENT_GET_AWARD, function(arg_3_0, arg_3_1)
		arg_1_0:sendNotification(GAME.CRUSING_CMD, {
			cmd = 2,
			activity_id = arg_1_0.viewComponent.activity.id,
			arg1 = arg_3_1
		})
	end)
	arg_1_0:bind(var_0_0.EVENT_GET_AWARD_PAY, function(arg_4_0, arg_4_1)
		arg_1_0:sendNotification(GAME.CRUSING_CMD, {
			cmd = 3,
			activity_id = arg_1_0.viewComponent.activity.id,
			arg1 = arg_4_1
		})
	end)
	arg_1_0:bind(var_0_0.EVENT_GET_AWARD_ALL, function(arg_5_0)
		arg_1_0:sendNotification(GAME.CRUSING_CMD, {
			cmd = 4,
			activity_id = arg_1_0.viewComponent.activity.id
		})
	end)
	arg_1_0:bind(var_0_0.EVENT_GO_CHARGE, function(arg_6_0, arg_6_1)
		arg_1_0:addSubLayers(Context.New({
			mediator = ChargeItemPanelMediator,
			viewComponent = ChargeItemPanelLayer,
			data = {
				panelConfig = arg_6_1
			}
		}))
	end)
	arg_1_0:bind(var_0_0.EVENT_OPEN_BIRTHDAY, function(arg_7_0, arg_7_1)
		arg_1_0:addSubLayers(Context.New({
			mediator = ChargeBirthdayMediator,
			viewComponent = ChargeBirthdayLayer,
			data = {}
		}))
	end)
	arg_1_0:bind(var_0_0.ON_TASK_GO, function(arg_8_0, arg_8_1)
		arg_1_0:sendNotification(GAME.TASK_GO, {
			taskVO = arg_8_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_TASK_SUBMIT, function(arg_9_0, arg_9_1)
		arg_1_0:sendNotification(GAME.SUBMIT_TASK, arg_9_1.id)
	end)
	arg_1_0:bind(var_0_0.ON_TASK_QUICK_SUBMIT, function(arg_10_0, arg_10_1)
		arg_1_0:sendNotification(GAME.QUICK_TASK, arg_10_1.id)
	end)
	arg_1_0:bind(var_0_0.ON_BUY_QUICK_TASK_ITEM, function(arg_11_0, arg_11_1)
		arg_1_0:sendNotification(GAME.SHOPPING, {
			id = var_0_0.quickTaskGoodId,
			count = arg_11_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_CRUISE_SHOPPING, function(arg_12_0, arg_12_1, arg_12_2)
		arg_1_0:sendNotification(GAME.SHOPPING, {
			id = arg_12_1,
			count = arg_12_2
		})
	end)

	local var_1_0 = getProxy(ActivityProxy):getAliveActivityByType(ActivityConst.ACTIVITY_TYPE_PT_CRUSING)

	arg_1_0.viewComponent:setActivity(var_1_0)
	arg_1_0.viewComponent:setPlayer(getProxy(PlayerProxy):getData())
end

function var_0_0.listNotificationInterests(arg_13_0)
	return {
		ActivityProxy.ACTIVITY_UPDATED,
		GAME.CRUSING_CMD_DONE,
		PlayerProxy.UPDATED,
		GAME.CHARGE_SUCCESS,
		BagProxy.ITEM_UPDATED,
		GAME.SUBMIT_TASK_DONE,
		GAME.SUBMIT_ACTIVITY_TASK_DONE,
		GAME.SHOPPING_DONE,
		ShopsProxy.CRUISE_SHOP_UPDATED
	}
end

function var_0_0.handleNotification(arg_14_0, arg_14_1)
	local var_14_0 = arg_14_1:getName()
	local var_14_1 = arg_14_1:getBody()

	if var_14_0 == ActivityProxy.ACTIVITY_UPDATED then
		if var_14_1.id == arg_14_0.viewComponent.activity.id then
			arg_14_0.viewComponent:setActivity(var_14_1)
			arg_14_0.viewComponent:UpdatePhase()
			arg_14_0.viewComponent:UpdateAwardPage()
		end
	elseif var_14_0 == GAME.CRUSING_CMD_DONE then
		arg_14_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_14_1.awards)
		arg_14_0.viewComponent:UpdateAwardPage()
	elseif var_14_0 == PlayerProxy.UPDATED then
		arg_14_0.viewComponent:setPlayer(var_14_1)
		arg_14_0.viewComponent:UpdateRes()
	elseif var_14_0 == GAME.CHARGE_SUCCESS then
		local var_14_2 = Goods.Create({
			shop_id = var_14_1.shopId
		}, Goods.TYPE_CHARGE)

		arg_14_0.viewComponent:OnChargeSuccess(var_14_2)
		arg_14_0.viewComponent:UpdateRes()
	elseif var_14_0 == BagProxy.ITEM_UPDATED then
		if var_14_1.id == Item.QUICK_TASK_PASS_TICKET_ID then
			arg_14_0.viewComponent:UpdateRes()
		end
	elseif var_14_0 == GAME.SUBMIT_TASK_DONE or var_14_0 == GAME.SUBMIT_ACTIVITY_TASK_DONE then
		arg_14_0.viewComponent:UpdateTaskPage()
	elseif var_14_0 == GAME.SHOPPING_DONE then
		arg_14_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_14_1.awards)
	elseif var_14_0 == ShopsProxy.CRUISE_SHOP_UPDATED then
		arg_14_0.viewComponent:setShop(var_14_1.shop)
		arg_14_0.viewComponent:UpdateShopPage()
	end
end

return var_0_0
