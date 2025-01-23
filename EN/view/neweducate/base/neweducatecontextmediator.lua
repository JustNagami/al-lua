local var_0_0 = class("NewEducateContextMediator", import("view.base.ContextMediator"))

function var_0_0.onRegister(arg_1_0)
	var_0_0.super.onRegister(arg_1_0)
	arg_1_0:bind(NewEducateBaseUI.GO_SCENE, function(arg_2_0, arg_2_1, ...)
		arg_1_0:sendNotification(GAME.GO_SCENE, arg_2_1, ...)
	end)
	arg_1_0:bind(NewEducateBaseUI.CHANGE_SCENE, function(arg_3_0, arg_3_1, ...)
		arg_1_0:sendNotification(GAME.CHANGE_SCENE, arg_3_1, ...)
	end)
	arg_1_0:bind(NewEducateBaseUI.GO_SUBLAYER, function(arg_4_0, arg_4_1, arg_4_2)
		arg_1_0:addSubLayers(arg_4_1, nil, arg_4_2)
	end)
	arg_1_0:bind(NewEducateBaseUI.ON_DROP, function(arg_5_0, arg_5_1)
		arg_1_0:addSubLayers(Context.New({
			mediator = NewEducateDropMediator,
			viewComponent = NewEducateDropLayer,
			data = arg_5_1
		}))
	end)
	arg_1_0:bind(NewEducateBaseUI.ON_ITEM, function(arg_6_0, arg_6_1)
		arg_1_0:addSubLayers(Context.New({
			viewComponent = NewEducateMsgBoxLayer,
			mediator = NewEducateMsgBoxMediator,
			data = setmetatable({
				type = NewEducateMsgBoxLayer.TYPE.ITEM
			}, {
				__index = arg_6_1
			})
		}))
	end)
	arg_1_0:bind(NewEducateBaseUI.ON_BOX, function(arg_7_0, arg_7_1)
		arg_1_0:addSubLayers(Context.New({
			viewComponent = NewEducateMsgBoxLayer,
			mediator = NewEducateMsgBoxMediator,
			data = setmetatable({
				type = NewEducateMsgBoxLayer.TYPE.BOX
			}, {
				__index = arg_7_1
			})
		}))
	end)
	arg_1_0:bind(NewEducateBaseUI.ON_SHOP, function(arg_8_0, arg_8_1)
		arg_1_0:addSubLayers(Context.New({
			viewComponent = NewEducateMsgBoxLayer,
			mediator = NewEducateMsgBoxMediator,
			data = setmetatable({
				type = NewEducateMsgBoxLayer.TYPE.SHOP
			}, {
				__index = arg_8_1
			})
		}))
	end)

	arg_1_0.contextData.char = getProxy(NewEducateProxy):GetCurChar()
end

return var_0_0
