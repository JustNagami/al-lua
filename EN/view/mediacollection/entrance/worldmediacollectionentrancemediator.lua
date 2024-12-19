local var_0_0 = class("WorldMediaCollectionEntranceMediator", import("view.base.ContextMediator"))

var_0_0.OPEN_RECALL = "WorldMediaCollectionEntranceMediator:OPEN_RECALL"
var_0_0.OPEN_CRYPTOLALIA = "WorldMediaCollectionEntranceMediator:OPEN_CRYPTOLALIA"
var_0_0.OPEN_ARCHIVE = "WorldMediaCollectionEntranceMediator:OPEN_ARCHIVE"
var_0_0.OPEN_RECORD = "WorldMediaCollectionEntranceMediator:OPEN_RECORD"
var_0_0.OPEN_ALBUM = "WorldMediaCollectionEntranceMediator:OPEN_ALBUM"

function var_0_0.register(arg_1_0)
	arg_1_0:bind(var_0_0.OPEN_CRYPTOLALIA, function(arg_2_0)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.CRYPTOLALIA)
	end)
	arg_1_0:bind(var_0_0.OPEN_RECALL, function(arg_3_0)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.WORLD_COLLECTION, {
			page = WorldMediaCollectionScene.PAGE_MEMORTY
		})
	end)
	arg_1_0:bind(var_0_0.OPEN_ARCHIVE, function(arg_4_0)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.WORLD_COLLECTION, {
			page = WorldMediaCollectionScene.PAGE_RECORD
		})
	end)
	arg_1_0:bind(var_0_0.OPEN_RECORD, function(arg_5_0)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.WORLD_COLLECTION, {
			page = WorldMediaCollectionScene.PAGE_FILE
		})
	end)
	arg_1_0:bind(var_0_0.OPEN_ALBUM, function(arg_6_0)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.WORLD_COLLECTION, {
			page = WorldMediaCollectionScene.PAGE_ALBUM
		})
	end)
end

function var_0_0.listNotificationInterests(arg_7_0)
	return {}
end

function var_0_0.handleNotification(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_1:getName()
	local var_8_1 = arg_8_1:getBody()
end

return var_0_0
