local var_0_0 = class("Dorm3dGiftMediator", import("view.base.ContextMediator"))

var_0_0.GIVE_GIFT = "Dorm3dGiftMediator.GIVE_GIFT"
var_0_0.DO_TALK = "Dorm3dGiftMediator.DO_TALK"
var_0_0.CHECK_LEVEL_UP = "Dorm3dGiftMediator.CHECK_LEVEL_UP"
var_0_0.OPEN_DROP_LAYER = "Dorm3dGiftMediator.OPEN_DROP_LAYER"
var_0_0.SHOW_SHOPPING_CONFIRM_WINDOW = "Dorm3dGiftMediator.SHOW_SHOPPING_CONFIRM_WINDOW"
var_0_0.FAVOR_LEVEL_UP = "Dorm3dGiftMediator.FAVOR_LEVEL_UP"

function var_0_0.register(arg_1_0)
	arg_1_0:bind(var_0_0.FAVOR_LEVEL_UP, function(arg_2_0, arg_2_1)
		arg_1_0:sendNotification(GAME.APARTMENT_LEVEL_UP, {
			groupId = arg_2_1
		})
	end)
	arg_1_0:bind(var_0_0.GIVE_GIFT, function(arg_3_0, arg_3_1)
		arg_1_0:sendNotification(GAME.APARTMENT_GIVE_GIFT, {
			count = 1,
			groupId = arg_1_0.viewComponent.apartment.configId,
			giftId = arg_3_1
		})
	end)
	arg_1_0:bind(var_0_0.DO_TALK, function(arg_4_0, arg_4_1, arg_4_2)
		arg_1_0:sendNotification(Dorm3dSceneMediator.OTHER_DO_TALK, {
			talkId = arg_4_1,
			callback = arg_4_2
		})
	end)
	arg_1_0:bind(var_0_0.CHECK_LEVEL_UP, function(arg_5_0)
		arg_1_0:sendNotification(Dorm3dSceneMediator.GUIDE_CHECK_LEVEL_UP)
	end)
	arg_1_0:bind(var_0_0.SHOW_SHOPPING_CONFIRM_WINDOW, function(arg_6_0, arg_6_1)
		arg_1_0:addSubLayers(Context.New({
			mediator = Dorm3dShoppingConfirmWindowMediator,
			viewComponent = Dorm3dShoppingConfirmWindow,
			data = arg_6_1
		}))
	end)
	arg_1_0:bind(GAME.SHOPPING, function(arg_7_0, arg_7_1)
		arg_1_0:sendNotification(GAME.SHOPPING, {
			id = arg_7_1.shopId,
			count = arg_7_1.count,
			silentTip = arg_7_1.silentTip
		})
	end)
	arg_1_0:bind(var_0_0.OPEN_DROP_LAYER, function(arg_8_0, arg_8_1, arg_8_2)
		arg_1_0:addSubLayers(Context.New({
			viewComponent = Dorm3dAwardInfoLayer,
			mediator = Dorm3dAwardInfoMediator,
			data = {
				items = arg_8_1
			},
			onRemoved = arg_8_2
		}))
	end)
	arg_1_0:bind(Dorm3dSceneMediator.ON_SCENE_EVENT, function(arg_9_0, ...)
		arg_1_0:sendNotification(Dorm3dSceneMediator.ON_SCENE_EVENT, packEx(...))
	end)
	arg_1_0.viewComponent:SetApartment(getProxy(ApartmentProxy):getApartment(arg_1_0.contextData.groupId))
end

function var_0_0.initNotificationHandleDic(arg_10_0)
	arg_10_0.handleDic = {
		[ApartmentProxy.UPDATE_APARTMENT] = function(arg_11_0, arg_11_1)
			local var_11_0 = arg_11_1:getBody()

			if var_11_0.configId == arg_11_0.contextData.groupId then
				arg_11_0.viewComponent:SetApartment(var_11_0)
			end
		end,
		[ApartmentProxy.UPDATE_GIFT_COUNT] = function(arg_12_0, arg_12_1)
			local var_12_0 = arg_12_1:getBody()

			arg_12_0.viewComponent:SingleUpdateGift(var_12_0)
		end,
		[GAME.APARTMENT_GIVE_GIFT_DONE] = function(arg_13_0, arg_13_1)
			local var_13_0 = arg_13_1:getBody()

			arg_13_0.viewComponent:AfterGiveGift(var_13_0)
		end,
		[GAME.SHOPPING_DONE] = function(arg_14_0, arg_14_1)
			local var_14_0 = arg_14_1:getBody().awards

			if var_14_0 and #var_14_0 > 0 then
				arg_14_0.viewComponent:emit(var_0_0.OPEN_DROP_LAYER, var_14_0, function()
					local var_15_0 = arg_14_1:getBody().id
					local var_15_1 = pg.shop_template[var_15_0]

					arg_14_0.viewComponent:SingleUpdateGift(var_15_1.effect_args[1])
				end)
			end
		end,
		[Dorm3dSceneMediator.ON_LEVEL_UP_FINISH] = function(arg_16_0, arg_16_1)
			arg_16_0.viewComponent:CheckLevelUp()
		end
	}
end

return var_0_0
