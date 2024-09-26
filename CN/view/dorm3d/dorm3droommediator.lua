local var_0_0 = class("Dorm3dRoomMediator", import("view.base.ContextMediator"))

var_0_0.TRIGGER_FAVOR = "Dorm3dRoomMediator.TRIGGER_FAVOR"
var_0_0.FAVOR_LEVEL_UP = "Dorm3dRoomMediator.FAVOR_LEVEL_UP"
var_0_0.TALKING_EVENT_FINISH = "Dorm3dRoomMediator.TALKING_EVENT_FINISH"
var_0_0.DO_TALK = "Dorm3dRoomMediator.DO_TALK"
var_0_0.COLLECTION_ITEM = "Dorm3dRoomMediator.COLLECTION_ITEM"
var_0_0.OPEN_FURNITURE_SELECT = "Dorm3dRoomMediator.OPEN_FURNITURE_SELECT"
var_0_0.OPEN_LEVEL_LAYER = "Dorm3dRoomMediator.OPEN_LEVEL_LAYER"
var_0_0.OPEN_GIFT_LAYER = "Dorm3dRoomMediator.OPEN_GIFT_LAYER"
var_0_0.OPEN_CAMERA_LAYER = "Dorm3dRoomMediator.OPEN_CAMERA_LAYER"
var_0_0.OPEN_DROP_LAYER = "Dorm3dRoomMediator.OPEN_DROP_LAYER"
var_0_0.OPEN_COLLECTION_LAYER = "Dorm3dRoomMediator.OPEN_COLLECTION_LAYER"
var_0_0.OPEN_INVITE_WINDOW = "Dorm3dRoomMediator.OPEN_INVITE_WINDOW"
var_0_0.OPEN_ACCOMPANY_WINDOW = "Dorm3dRoomMediator.OPEN_ACCOMPANY_WINDOW"
var_0_0.OPEN_MINIGAME_WINDOW = "Dorm3dRoomMediator.OPEN_MINIGAME_WINDOW"
var_0_0.ON_LEVEL_UP_FINISH = "Dorm3dRoomMediator.ON_LEVEL_UP_FINISH"
var_0_0.ON_CLICK_FURNITURE_SLOT = "Dorm3dRoomMediator.ON_CLICK_FURNITURE_SLOT"
var_0_0.OTHER_DO_TALK = "Dorm3dRoomMediator.OTHER_DO_TALK"
var_0_0.OTHER_POP_UNLOCK = "Dorm3dRoomMediator.OTHER_POP_UNLOCK"
var_0_0.CHAMGE_TIME_RELOAD_SCENE = "Dorm3dRoomMediator.CHAMGE_TIME_RELOAD_SCENE"
var_0_0.GUIDE_CLICK_LADY = "Dorm3dRoomMediator.GUIDE_CLICK_LADY"
var_0_0.GUIDE_CHECK_GUIDE = "Dorm3dRoomMediator.GUIDE_CHECK_GUIDE"
var_0_0.GUIDE_CHECK_LEVEL_UP = "Dorm3dRoomMediator.GUIDE_CHECK_LEVEL_UP"
var_0_0.Camera_Pinch_Value_Change = "Dorm3dRoomMediator.Camera_Pinch_Value_Change"
var_0_0.ENTER_VOLLEYBALL = "Dorm3dRoomMediator.ENTER_VOLLEYBALL"
var_0_0.ON_DROP_CLIENT = "Dorm3dRoomMediator.ON_DROP_CLIENT"

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
	arg_1_0:bind(var_0_0.OPEN_FURNITURE_SELECT, function(arg_5_0, arg_5_1, arg_5_2)
		arg_1_0:addSubLayers(Context.New({
			mediator = Dorm3dFurnitureSelectMediator,
			viewComponent = Dorm3dFurnitureSelectLayer,
			data = arg_5_1,
			onRemoved = function()
				arg_1_0.viewComponent:TempHideUI(false, arg_5_2)
			end
		}), nil, function()
			arg_1_0.viewComponent:TempHideUI(true)
		end)
	end)
	arg_1_0:bind(var_0_0.ON_CLICK_FURNITURE_SLOT, function(arg_8_0, arg_8_1)
		arg_1_0:sendNotification(arg_8_0, arg_8_1)
	end)
	arg_1_0:bind(var_0_0.OPEN_LEVEL_LAYER, function(arg_9_0, arg_9_1, arg_9_2)
		arg_1_0:addSubLayers(Context.New({
			viewComponent = Dorm3dLevelLayer,
			mediator = Dorm3dLevelMediator,
			data = arg_9_1,
			onRemoved = function()
				arg_1_0.viewComponent:SetAllBlackbloardValue("inLockLayer", false)
				arg_1_0.viewComponent:TempHideUI(false, arg_9_2)
			end
		}), nil, function()
			arg_1_0.viewComponent:SetAllBlackbloardValue("inLockLayer", true)
			arg_1_0.viewComponent:TempHideUI(true)
		end)
	end)
	arg_1_0:bind(var_0_0.OPEN_GIFT_LAYER, function(arg_12_0, arg_12_1, arg_12_2)
		arg_1_0:addSubLayers(Context.New({
			viewComponent = Dorm3dGiftLayer,
			mediator = Dorm3dGiftMediator,
			data = arg_12_1,
			onRemoved = function()
				arg_1_0.viewComponent:SetAllBlackbloardValue("inLockLayer", false)
				arg_1_0.viewComponent:TempHideUI(false, arg_12_2)
			end
		}), nil, function()
			arg_1_0.viewComponent:SetAllBlackbloardValue("inLockLayer", true)
			arg_1_0.viewComponent:TempHideUI(true)
		end)
	end)
	arg_1_0:bind(var_0_0.OPEN_CAMERA_LAYER, function(arg_15_0, arg_15_1, arg_15_2, arg_15_3)
		arg_1_0:addSubLayers(Context.New({
			viewComponent = Dorm3dPhotoLayer,
			mediator = Dorm3dPhotoMediator,
			data = {
				groupId = arg_15_2,
				view = arg_15_1
			}
		}))
	end)
	arg_1_0:bind(var_0_0.OPEN_DROP_LAYER, function(arg_16_0, arg_16_1, arg_16_2)
		arg_1_0:addSubLayers(Context.New({
			viewComponent = Dorm3dAwardInfoLayer,
			mediator = Dorm3dAwardInfoMediator,
			data = {
				items = arg_16_1
			},
			onRemoved = arg_16_2
		}))
	end)
	arg_1_0:bind(var_0_0.OPEN_COLLECTION_LAYER, function(arg_17_0, arg_17_1)
		arg_1_0:addSubLayers(Context.New({
			viewComponent = Dorm3dCollectionLayer,
			mediator = Dorm3dCollectionMediator,
			data = {
				roomId = arg_17_1
			}
		}))
	end)
	arg_1_0:bind(var_0_0.OPEN_INVITE_WINDOW, function(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
		arg_1_0:addSubLayers(Context.New({
			viewComponent = Dorm3dInviteLayer,
			mediator = Dorm3dInviteMediator,
			data = {
				roomId = arg_18_1,
				groupIds = arg_18_2
			},
			onRemoved = function()
				arg_1_0.viewComponent:SetAllBlackbloardValue("inLockLayer", false)
				arg_1_0.viewComponent:TempHideUI(false, arg_18_3)
			end
		}), nil, function()
			arg_1_0.viewComponent:SetAllBlackbloardValue("inLockLayer", true)
			arg_1_0.viewComponent:TempHideUI(true)
		end)
	end)
	arg_1_0:bind(var_0_0.OPEN_ACCOMPANY_WINDOW, function(arg_21_0, arg_21_1, arg_21_2)
		arg_1_0:addSubLayers(Context.New({
			viewComponent = Dorm3dAccompanyLayer,
			mediator = Dorm3dAccompanyMediator,
			data = arg_21_1,
			onRemoved = function()
				arg_1_0.viewComponent:SetAllBlackbloardValue("inLockLayer", false)
				arg_1_0.viewComponent:TempHideUI(false, arg_21_2)
			end
		}), nil, function()
			arg_1_0.viewComponent:SetAllBlackbloardValue("inLockLayer", true)
			arg_1_0.viewComponent:TempHideUI(true)
		end)
	end)
	arg_1_0:bind(var_0_0.OPEN_MINIGAME_WINDOW, function(arg_24_0, arg_24_1, arg_24_2)
		arg_1_0:addSubLayers(Context.New({
			viewComponent = EatFoodLayer,
			mediator = EatFoodMediator,
			data = arg_24_1,
			onRemoved = arg_24_2
		}))
	end)
	arg_1_0:bind(var_0_0.DO_TALK, function(arg_25_0, arg_25_1, arg_25_2)
		arg_1_0:sendNotification(GAME.APARTMENT_DO_TALK, {
			talkId = arg_25_1,
			callback = arg_25_2
		})
	end)
	arg_1_0:bind(var_0_0.COLLECTION_ITEM, function(arg_26_0, arg_26_1)
		arg_1_0:sendNotification(GAME.APARTMENT_COLLECTION_ITEM, arg_26_1)
	end)
	arg_1_0:bind(var_0_0.Camera_Pinch_Value_Change, function(arg_27_0, arg_27_1)
		arg_1_0:sendNotification(Dorm3dPhotoMediator.Camera_Pinch_Value_Change, {
			value = arg_27_1
		})
	end)
	arg_1_0:bind(var_0_0.ENTER_VOLLEYBALL, function(arg_28_0)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.DORM3D_VOLLEYBALL)
	end)
	arg_1_0:bind(var_0_0.ON_DROP_CLIENT, function(arg_29_0, arg_29_1)
		pg.NewStyleMsgboxMgr.GetInstance():Show(pg.NewStyleMsgboxMgr.TYPE_DROP_CLIENT, arg_29_1)
	end)
	arg_1_0.viewComponent:SetRoom(getProxy(ApartmentProxy):getRoom(arg_1_0.contextData.roomId))

	if arg_1_0.viewComponent.room:isPersonalRoom() then
		local var_1_0 = getProxy(ApartmentProxy):getApartment(arg_1_0.contextData.groupIds[1])

		arg_1_0.viewComponent:SetApartment(var_1_0)
	else
		PlayerPrefs.SetString(string.format("room%d_invite_list", arg_1_0.contextData.roomId), table.concat(arg_1_0.contextData.groupIds, "|"))
	end
end

function var_0_0.initNotificationHandleDic(arg_30_0)
	arg_30_0.handleDic = {
		[GAME.APARTMENT_TRIGGER_FAVOR_DONE] = function(arg_31_0, arg_31_1)
			local var_31_0 = arg_31_1:getBody()

			arg_31_0.viewComponent:PopFavorTrigger(var_31_0)
		end,
		[GAME.APARTMENT_LEVEL_UP_DONE] = function(arg_32_0, arg_32_1)
			local var_32_0 = arg_32_1:getBody()

			seriesAsync({
				function(arg_33_0)
					arg_32_0.viewComponent:SetAllBlackbloardValue("inLockLayer", true)
					arg_32_0.viewComponent:PopFavorLevelUp(var_32_0.apartment, var_32_0.award, arg_33_0)
				end
			}, function()
				arg_32_0.viewComponent:SetAllBlackbloardValue("inLockLayer", false)
				arg_32_0.viewComponent:CheckQueue()
				arg_32_0:sendNotification(var_0_0.ON_LEVEL_UP_FINISH)
			end)
		end,
		[STORY_EVENT.TEST] = function(arg_35_0, arg_35_1)
			local var_35_0 = arg_35_1:getBody()

			arg_35_0.viewComponent:TalkingEventHandle(var_35_0)
		end,
		[ApartmentProxy.UPDATE_APARTMENT] = function(arg_36_0, arg_36_1)
			local var_36_0 = arg_36_1:getBody()
			local var_36_1 = arg_36_0.viewComponent.apartment

			if var_36_1 and var_36_1:GetConfigID() == var_36_0:GetConfigID() then
				arg_36_0.viewComponent:SetApartment(var_36_0)
			end
		end,
		[var_0_0.OTHER_DO_TALK] = function(arg_37_0, arg_37_1)
			local var_37_0 = arg_37_1:getBody()

			arg_37_0.viewComponent:DoTalk(var_37_0.talkId, var_37_0.callback)
		end,
		[var_0_0.OTHER_POP_UNLOCK] = function(arg_38_0, arg_38_1)
			local var_38_0 = arg_38_1:getBody()

			arg_38_0.viewComponent:AddUnlockDisplay(var_38_0)
		end,
		[GAME.APARTMENT_DO_TALK_DONE] = function(arg_39_0, arg_39_1)
			arg_39_0.viewComponent:UpdateBtnState()
		end,
		[GAME.APARTMENT_COLLECTION_ITEM_DONE] = function(arg_40_0, arg_40_1)
			local var_40_0 = arg_40_1:getBody()

			arg_40_0:addSubLayers(Context.New({
				viewComponent = Dorm3dCollectAwardLayer,
				mediator = Dorm3dCollectAwardMediator,
				data = {
					itemId = var_40_0.itemId,
					isNew = var_40_0.isNew
				}
			}))
			arg_40_0.viewComponent:UpdateBtnState()
		end,
		[var_0_0.CHAMGE_TIME_RELOAD_SCENE] = function(arg_41_0, arg_41_1)
			local var_41_0 = arg_41_1:getBody()

			arg_41_0.contextData.timeIndex = var_41_0.timeIndex

			arg_41_0.viewComponent:SwitchDayNight(arg_41_0.contextData.timeIndex)
			onNextTick(function()
				arg_41_0.viewComponent:RefreshSlots()
			end)
			arg_41_0.viewComponent:UpdateContactState()
		end,
		[GAME.APARTMENT_GIVE_GIFT_DONE] = function(arg_43_0, arg_43_1)
			local var_43_0 = arg_43_1:getBody()

			arg_43_0.viewComponent:PlayHeartFX(var_43_0.groupId)
			arg_43_0.viewComponent:UpdateBtnState()
		end,
		[var_0_0.GUIDE_CLICK_LADY] = function(arg_44_0, arg_44_1)
			warning("this.GUIDE_CLICK_LADY")
			arg_44_0.viewComponent:EnterWatchMode()
		end,
		[var_0_0.GUIDE_CHECK_GUIDE] = function(arg_45_0, arg_45_1)
			arg_45_0.viewComponent:CheckGuide()
		end,
		[var_0_0.GUIDE_CHECK_LEVEL_UP] = function(arg_46_0, arg_46_1)
			arg_46_0.viewComponent:CheckLevelUp()
		end,
		[ApartmentProxy.UPDATE_ROOM] = function(arg_47_0, arg_47_1)
			local var_47_0 = arg_47_1:getBody()

			if var_47_0:GetConfigID() == arg_47_0.viewComponent.room:GetConfigID() then
				arg_47_0.viewComponent:SetRoom(var_47_0)
			end
		end,
		[Dorm3dInviteMediator.ON_DORM] = function(arg_48_0, arg_48_1)
			local var_48_0 = arg_48_1:getBody()

			arg_48_0:sendNotification(GAME.CHANGE_SCENE, SCENE.DORM3D_ROOM, var_48_0)
		end,
		[EatFoodMediator.HIT_AREA] = function(arg_49_0, arg_49_1)
			local var_49_0 = arg_49_1:getBody()

			arg_49_0.viewComponent:HandleGameNotification(EatFoodMediator.HIT_AREA, var_49_0)
		end,
		[EatFoodMediator.RESULT] = function(arg_50_0, arg_50_1)
			local var_50_0 = arg_50_1:getBody()

			arg_50_0.viewComponent:HandleGameNotification(EatFoodMediator.RESULT, var_50_0)
		end,
		[EatFoodMediator.LEAVE_GAME] = function(arg_51_0, arg_51_1)
			local var_51_0 = arg_51_1:getBody()

			arg_51_0.viewComponent:HandleGameNotification(EatFoodMediator.LEAVE_GAME, var_51_0)
		end
	}
end

function var_0_0.remove(arg_52_0)
	return
end

return var_0_0
