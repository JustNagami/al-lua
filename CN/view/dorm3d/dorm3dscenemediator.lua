local var_0_0 = class("Dorm3dSceneMediator", import("view.base.ContextMediator"))

var_0_0.TRIGGER_FAVOR = "Dorm3dSceneMediator.TRIGGER_FAVOR"
var_0_0.FAVOR_LEVEL_UP = "Dorm3dSceneMediator.FAVOR_LEVEL_UP"
var_0_0.TALKING_EVENT_FINISH = "Dorm3dSceneMediator.TALKING_EVENT_FINISH"
var_0_0.DO_TALK = "Dorm3dSceneMediator.DO_TALK"
var_0_0.COLLECTION_ITEM = "Dorm3dSceneMediator.COLLECTION_ITEM"
var_0_0.OPEN_FURNITURE_SELECT = "Dorm3dSceneMediator.OPEN_FURNITURE_SELECT"
var_0_0.OPEN_LEVEL_LAYER = "Dorm3dSceneMediator.OPEN_LEVEL_LAYER"
var_0_0.OPEN_GIFT_LAYER = "Dorm3dSceneMediator.OPEN_GIFT_LAYER"
var_0_0.OPEN_CAMERA_LAYER = "Dorm3dSceneMediator.OPEN_CAMERA_LAYER"
var_0_0.OPEN_DROP_LAYER = "Dorm3dSceneMediator.OPEN_DROP_LAYER"
var_0_0.OPEN_COLLECTION_LAYER = "Dorm3dSceneMediator.OPEN_COLLECTION_LAYER"
var_0_0.ON_LEVEL_UP_FINISH = "Dorm3dSceneMediator.ON_LEVEL_UP_FINISH"
var_0_0.ON_CLICK_FURNITURE_SLOT = "Dorm3dSceneMediator.ON_CLICK_FURNITURE_SLOT"
var_0_0.OTHER_DO_TALK = "Dorm3dSceneMediator.OTHER_DO_TALK"
var_0_0.OTHER_POP_UNLOCK = "Dorm3dSceneMediator.OTHER_POP_UNLOCK"
var_0_0.CHAMGE_TIME_RELOAD_SCENE = "Dorm3dSceneMediator.CHAMGE_TIME_RELOAD_SCENE"
var_0_0.ON_SCENE_EVENT = "Dorm3dSceneMediator:ON_SCENE_EVENT"
var_0_0.GUIDE_CLICK_LADY = "Dorm3dSceneMediator.GUIDE_CLICK_LADY"
var_0_0.GUIDE_CHECK_GUIDE = "Dorm3dSceneMediator.GUIDE_CHECK_GUIDE"
var_0_0.GUIDE_CHECK_LEVEL_UP = "Dorm3dSceneMediator.GUIDE_CHECK_LEVEL_UP"
var_0_0.Camera_Pinch_Value_Change = "Dorm3dSceneMediator.Camera_Pinch_Value_Change"

function var_0_0.register(arg_1_0)
	arg_1_0:bind(var_0_0.TRIGGER_FAVOR, function(arg_2_0, arg_2_1, arg_2_2)
		arg_1_0:sendNotification(GAME.APARTMENT_TRIGGER_FAVOR, {
			groupId = arg_2_1,
			triggerId = arg_2_2
		})
	end)
	arg_1_0:bind(var_0_0.FAVOR_LEVEL_UP, function(arg_3_0, arg_3_1)
		arg_1_0:sendNotification(GAME.APARTMENT_LEVEL_UP, {
			groupId = arg_3_1
		})
	end)
	arg_1_0:bind(var_0_0.TALKING_EVENT_FINISH, function(arg_4_0, arg_4_1, arg_4_2)
		arg_1_0:sendNotification(arg_4_1, arg_4_2)
	end)
	arg_1_0:bind(var_0_0.OPEN_FURNITURE_SELECT, function(arg_5_0)
		arg_1_0:addSubLayers(Context.New({
			mediator = Dorm3dFurnitureSelectMediator,
			viewComponent = Dorm3dFurnitureSelectLayer,
			data = arg_1_0.contextData,
			onRemoved = function()
				arg_1_0.viewComponent:ShowBaseView()
			end
		}), nil, function()
			arg_1_0.viewComponent:HideBaseView()
		end)
	end)
	arg_1_0:bind(var_0_0.ON_CLICK_FURNITURE_SLOT, function(arg_8_0, arg_8_1)
		arg_1_0:sendNotification(arg_8_0, arg_8_1)
	end)
	arg_1_0:bind(var_0_0.OPEN_LEVEL_LAYER, function(arg_9_0, arg_9_1)
		arg_1_0:addSubLayers(Context.New({
			viewComponent = Dorm3dLevelLayer,
			mediator = Dorm3dLevelMediator,
			data = setmetatable({
				groupId = arg_1_0.contextData.groupId,
				timeIndex = arg_1_0.contextData.timeIndex
			}, {
				__index = arg_9_1
			}),
			onRemoved = function()
				arg_1_0.viewComponent.baseView:SetBlackboardValue("inLockLayer", false)
				arg_1_0.viewComponent:ShowBaseView()
			end
		}), nil, function()
			arg_1_0.viewComponent.baseView:SetBlackboardValue("inLockLayer", true)
			arg_1_0.viewComponent:HideBaseView()
		end)
	end)
	arg_1_0:bind(var_0_0.OPEN_GIFT_LAYER, function(arg_12_0, arg_12_1, arg_12_2)
		arg_1_0:addSubLayers(Context.New({
			viewComponent = Dorm3dGiftLayer,
			mediator = Dorm3dGiftMediator,
			data = setmetatable({
				groupId = arg_1_0.contextData.groupId
			}, {
				__index = arg_12_1
			}),
			onRemoved = function()
				arg_1_0.viewComponent.baseView:SetBlackboardValue("inLockLayer", false)
				arg_1_0.viewComponent:ShowBaseView()
			end
		}), nil, function()
			arg_1_0.viewComponent.baseView:SetBlackboardValue("inLockLayer", true)
			arg_1_0.viewComponent:HideBaseView()
			existCall(arg_12_2)
		end)
	end)
	arg_1_0:bind(var_0_0.OPEN_CAMERA_LAYER, function(arg_15_0)
		arg_1_0:addSubLayers(Context.New({
			viewComponent = Dorm3dPhotoLayer,
			mediator = Dorm3dPhotoMediator,
			data = arg_1_0.contextData,
			onRemoved = function()
				arg_1_0.viewComponent:ShowBaseView()
			end
		}), nil, function()
			arg_1_0.viewComponent:HideBaseView()
		end)
	end)
	arg_1_0:bind(var_0_0.OPEN_DROP_LAYER, function(arg_18_0, arg_18_1, arg_18_2)
		arg_1_0:addSubLayers(Context.New({
			viewComponent = Dorm3dAwardInfoLayer,
			mediator = Dorm3dAwardInfoMediator,
			data = {
				items = arg_18_1
			},
			onRemoved = arg_18_2
		}))
	end)
	arg_1_0:bind(var_0_0.OPEN_COLLECTION_LAYER, function(arg_19_0)
		arg_1_0:addSubLayers(Context.New({
			viewComponent = Dorm3dCollectionLayer,
			mediator = Dorm3dCollectionMediator,
			data = arg_1_0.contextData
		}))
	end)
	arg_1_0:bind(var_0_0.DO_TALK, function(arg_20_0, arg_20_1, arg_20_2)
		arg_1_0:sendNotification(GAME.APARTMENT_DO_TALK, {
			talkId = arg_20_1,
			callback = arg_20_2
		})
	end)
	arg_1_0:bind(var_0_0.COLLECTION_ITEM, function(arg_21_0, arg_21_1, arg_21_2)
		arg_1_0:sendNotification(GAME.APARTMENT_COLLECTION_ITEM, {
			groupId = arg_21_1,
			itemId = arg_21_2
		})
	end)
	arg_1_0:bind(var_0_0.Camera_Pinch_Value_Change, function(arg_22_0, arg_22_1)
		arg_1_0:sendNotification(Dorm3dPhotoMediator.Camera_Pinch_Value_Change, {
			value = arg_22_1
		})
	end)
end

function var_0_0.initNotificationHandleDic(arg_23_0)
	arg_23_0.handleDic = {
		[GAME.APARTMENT_TRIGGER_FAVOR_DONE] = function(arg_24_0, arg_24_1)
			local var_24_0 = arg_24_1:getBody()

			arg_24_0.viewComponent.baseView:PopFavorTrigger(var_24_0)
			arg_24_0.viewComponent.baseView:CheckQueue()
		end,
		[GAME.APARTMENT_LEVEL_UP_DONE] = function(arg_25_0, arg_25_1)
			local var_25_0 = arg_25_1:getBody()

			seriesAsync({
				function(arg_26_0)
					arg_25_0.viewComponent.baseView:SetBlackboardValue("inLockLayer", true)
					arg_25_0.viewComponent.baseView:PopFavorLevelUp(var_25_0.apartment, arg_26_0)
				end,
				function(arg_27_0)
					if var_25_0.award and #var_25_0.award > 0 then
						arg_25_0:addSubLayers(Context.New({
							viewComponent = Dorm3dAwardInfoLayer,
							mediator = Dorm3dAwardInfoMediator,
							data = {
								items = var_25_0.award
							},
							onRemoved = arg_27_0
						}))
					else
						arg_27_0()
					end
				end
			}, function()
				arg_25_0.viewComponent.baseView:SetBlackboardValue("inLockLayer", false)
				arg_25_0:sendNotification(var_0_0.ON_LEVEL_UP_FINISH)
			end)
		end,
		[STORY_EVENT.TEST] = function(arg_29_0, arg_29_1)
			local var_29_0 = arg_29_1:getBody()

			arg_29_0.viewComponent.baseView:TalkingEventHandle(var_29_0)
		end,
		[ApartmentProxy.UPDATE_APARTMENT] = function(arg_30_0, arg_30_1)
			arg_30_0.viewComponent:SetApartment(arg_30_1:getBody())
		end,
		[var_0_0.OTHER_DO_TALK] = function(arg_31_0, arg_31_1)
			local var_31_0 = arg_31_1:getBody()

			arg_31_0.viewComponent.baseView:DoTalk(var_31_0.talkId, var_31_0.callback)
		end,
		[var_0_0.OTHER_POP_UNLOCK] = function(arg_32_0, arg_32_1)
			local var_32_0 = arg_32_1:getBody()

			arg_32_0.viewComponent.baseView:AddUnlockDisplay(var_32_0)
		end,
		[GAME.APARTMENT_CHANGE_SKIN_DONE] = function(arg_33_0, arg_33_1)
			arg_33_0:ReloadScene()
		end,
		[GAME.APARTMENT_DO_TALK_DONE] = function(arg_34_0, arg_34_1)
			return
		end,
		[GAME.APARTMENT_COLLECTION_ITEM_DONE] = function(arg_35_0, arg_35_1)
			local var_35_0 = arg_35_1:getBody()

			arg_35_0:addSubLayers(Context.New({
				viewComponent = Dorm3dCollectAwardLayer,
				mediator = Dorm3dCollectAwardMediator,
				data = {
					itemId = var_35_0.itemId,
					isNew = var_35_0.isNew
				}
			}))
		end,
		[var_0_0.CHAMGE_TIME_RELOAD_SCENE] = function(arg_36_0, arg_36_1)
			local var_36_0 = arg_36_1:getBody()

			arg_36_0.contextData.timeIndex = var_36_0.timeIndex

			arg_36_0.viewComponent:SwitchDayNight(arg_36_0.contextData.timeIndex)
		end,
		[GAME.APARTMENT_GIVE_GIFT_DONE] = function(arg_37_0, arg_37_1)
			local var_37_0 = arg_37_1:getBody()

			arg_37_0.viewComponent:PlayHeartFX()
			pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_joyful")
		end,
		[var_0_0.ON_SCENE_EVENT] = function(arg_38_0, arg_38_1)
			local var_38_0 = arg_38_1:getBody()

			arg_38_0.viewComponent:emit(var_38_0[1], unpackEx(_.rest(var_38_0, 1)))
		end,
		[var_0_0.GUIDE_CLICK_LADY] = function(arg_39_0, arg_39_1)
			warning("this.GUIDE_CLICK_LADY")
			arg_39_0.viewComponent.baseView:EnterWatchMode()
		end,
		[var_0_0.GUIDE_CHECK_GUIDE] = function(arg_40_0, arg_40_1)
			arg_40_0.viewComponent.baseView:CheckGuide()
		end,
		[var_0_0.GUIDE_CHECK_LEVEL_UP] = function(arg_41_0, arg_41_1)
			arg_41_0.viewComponent.baseView:CheckLevelUp()
		end
	}
end

function var_0_0.ReloadScene(arg_42_0)
	pg.SceneAnimMgr.GetInstance():Dorm3DSceneChange(function(arg_43_0)
		local var_43_0 = Clone(arg_42_0.contextData)

		var_43_0.resumeCallback = arg_43_0

		arg_42_0:sendNotification(GAME.RELOAD_SCENE, var_43_0)
	end)
end

function var_0_0.remove(arg_44_0)
	return
end

return var_0_0
