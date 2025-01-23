local var_0_0 = class("NewSkinTBMediator", import("..base.ContextMediator"))

var_0_0.SET_SKIN = "NewSkinTBMediator:SET_SKIN"
var_0_0.ON_EXIT = "NewSkinTBMediator:ON_EXIT"
var_0_0.GO_SET_TB_SKIN = "NewSkinTBMediator:GO_SET_TB_SKIN"

function var_0_0.register(arg_1_0)
	arg_1_0:bind(var_0_0.SET_SKIN, function(arg_2_0, arg_2_1, arg_2_2)
		for iter_2_0, iter_2_1 in ipairs(arg_2_1) do
			arg_1_0:sendNotification(GAME.SET_SHIP_SKIN, {
				shipId = iter_2_1,
				skinId = arg_1_0.contextData.skinId
			})
		end

		getProxy(SettingsProxy):SetFlagShip(arg_2_2)

		if arg_2_2 then
			local var_2_0 = arg_2_1[1]

			arg_1_0:sendNotification(GAME.CHANGE_PLAYER_ICON, {
				skinPage = true,
				characterId = var_2_0
			})
		end

		arg_1_0.viewComponent:emit(BaseUI.ON_CLOSE)
	end)
	arg_1_0:bind(var_0_0.GO_SET_TB_SKIN, function(arg_3_0)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.EDUCATE_DOCK, {
			OnSelected = function(arg_4_0)
				arg_1_0:sendNotification(GAME.CHANGE_EDUCATE, {
					id = arg_4_0
				})
			end,
			tbSkinId = arg_1_0.contextData.skinId
		})
	end)

	arg_1_0.contextData.secId = NewEducateHelper.GetSecIdBySkinId(arg_1_0.contextData.skinId)
	arg_1_0.contextData.isClose = getProxy(PlayerProxy):getRawData():GetEducateCharacter() == arg_1_0.contextData.secId

	arg_1_0.viewComponent:setSkin(arg_1_0.contextData.skinId)
end

function var_0_0.onUIAvalible(arg_5_0)
	return
end

function var_0_0.listNotificationInterests(arg_6_0)
	return {}
end

function var_0_0.handleNotification(arg_7_0, arg_7_1)
	local var_7_0 = arg_7_1:getName()
	local var_7_1 = arg_7_1:getBody()
end

return var_0_0
