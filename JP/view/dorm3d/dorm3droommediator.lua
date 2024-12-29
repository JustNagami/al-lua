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
var_0_0.UPDATE_FAVOR_DISPLAY = "Dorm3dRoomMediator.UPDATE_FAVOR_DISPLAY"

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
		local var_24_0 = switch(arg_24_1.minigameId, {
			[67] = function()
				return EatFoodLayer
			end,
			[70] = function()
				return NengDaiScheduleGameView
			end
		}, function()
			assert(false, "without dorm minigame config in id:" .. arg_24_1.minigameId)
		end)

		arg_1_0:addSubLayers(Context.New({
			viewComponent = var_24_0,
			mediator = Dorm3dMiniGameMediator,
			data = arg_24_1,
			onRemoved = arg_24_2
		}))
	end)
	arg_1_0:bind(var_0_0.DO_TALK, function(arg_28_0, arg_28_1, arg_28_2)
		arg_1_0:sendNotification(GAME.APARTMENT_DO_TALK, {
			talkId = arg_28_1,
			callback = arg_28_2
		})
	end)
	arg_1_0:bind(var_0_0.COLLECTION_ITEM, function(arg_29_0, arg_29_1)
		arg_1_0:sendNotification(GAME.APARTMENT_COLLECTION_ITEM, arg_29_1)
	end)
	arg_1_0:bind(var_0_0.Camera_Pinch_Value_Change, function(arg_30_0, arg_30_1)
		arg_1_0:sendNotification(Dorm3dPhotoMediator.Camera_Pinch_Value_Change, {
			value = arg_30_1
		})
	end)
	arg_1_0:bind(Dorm3dPhotoMediator.CAMERA_LIFT_CHANGED, function(arg_31_0, arg_31_1)
		arg_1_0:sendNotification(Dorm3dPhotoMediator.CAMERA_LIFT_CHANGED, {
			value = arg_31_1
		})
	end)
	arg_1_0:bind(Dorm3dPhotoMediator.CAMERA_STICK_MOVE, function(arg_32_0, arg_32_1)
		arg_1_0:sendNotification(Dorm3dPhotoMediator.CAMERA_STICK_MOVE, arg_32_1)
	end)
	arg_1_0:bind(var_0_0.ENTER_VOLLEYBALL, function(arg_33_0, arg_33_1)
		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.DORM3D_VOLLEYBALL, {
			groupId = arg_33_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_DROP_CLIENT, function(arg_34_0, arg_34_1)
		pg.NewStyleMsgboxMgr.GetInstance():Show(pg.NewStyleMsgboxMgr.TYPE_DROP_CLIENT, arg_34_1)
	end)
	arg_1_0.viewComponent:SetRoom(getProxy(ApartmentProxy):getRoom(arg_1_0.contextData.roomId))

	if arg_1_0.viewComponent.room:isPersonalRoom() then
		local var_1_0 = getProxy(ApartmentProxy):getApartment(arg_1_0.contextData.groupIds[1])

		arg_1_0.viewComponent:SetApartment(var_1_0)
	else
		PlayerPrefs.SetString(string.format("room%d_invite_list", arg_1_0.contextData.roomId), table.concat(arg_1_0.contextData.groupIds, "|"))
	end

	Dorm3dFurniture.RecordLastTimelimitShopFurniture()
end

function var_0_0.initNotificationHandleDic(arg_35_0)
	arg_35_0.handleDic = {
		[GAME.APARTMENT_TRIGGER_FAVOR_DONE] = function(arg_36_0, arg_36_1)
			local var_36_0 = arg_36_1:getBody()

			arg_36_0.viewComponent:PopFavorTrigger(var_36_0)
		end,
		[GAME.APARTMENT_LEVEL_UP_DONE] = function(arg_37_0, arg_37_1)
			local var_37_0 = arg_37_1:getBody()

			seriesAsync({
				function(arg_38_0)
					arg_37_0.viewComponent:SetAllBlackbloardValue("inLockLayer", true)
					arg_37_0.viewComponent:PopFavorLevelUp(var_37_0.apartment, var_37_0.award, arg_38_0)
				end
			}, function()
				arg_37_0.viewComponent:SetAllBlackbloardValue("inLockLayer", false)
				arg_37_0.viewComponent:CheckQueue()
				arg_37_0:sendNotification(var_0_0.ON_LEVEL_UP_FINISH)
			end)
		end,
		[STORY_EVENT.TEST] = function(arg_40_0, arg_40_1)
			local var_40_0 = arg_40_1:getBody()

			arg_40_0.viewComponent:TalkingEventHandle(var_40_0)
		end,
		[ApartmentProxy.UPDATE_APARTMENT] = function(arg_41_0, arg_41_1)
			local var_41_0 = arg_41_1:getBody()
			local var_41_1 = arg_41_0.viewComponent.apartment

			if var_41_1 and var_41_1:GetConfigID() == var_41_0:GetConfigID() then
				arg_41_0.viewComponent:SetApartment(var_41_0)
			end
		end,
		[var_0_0.OTHER_DO_TALK] = function(arg_42_0, arg_42_1)
			local var_42_0 = arg_42_1:getBody()

			arg_42_0.viewComponent.inReplayTalk = true

			arg_42_0.viewComponent:DoTalk(var_42_0.talkId, function()
				arg_42_0.viewComponent.inReplayTalk = false

				existCall(var_42_0.callback)
			end)
		end,
		[var_0_0.OTHER_POP_UNLOCK] = function(arg_44_0, arg_44_1)
			local var_44_0 = arg_44_1:getBody()

			arg_44_0.viewComponent:AddUnlockDisplay(var_44_0)
		end,
		[GAME.APARTMENT_DO_TALK_DONE] = function(arg_45_0, arg_45_1)
			arg_45_0.viewComponent:UpdateBtnState()
		end,
		[GAME.APARTMENT_COLLECTION_ITEM_DONE] = function(arg_46_0, arg_46_1)
			local var_46_0 = arg_46_1:getBody()

			arg_46_0:addSubLayers(Context.New({
				viewComponent = Dorm3dCollectAwardLayer,
				mediator = Dorm3dCollectAwardMediator,
				data = {
					itemId = var_46_0.itemId,
					isNew = var_46_0.isNew
				}
			}))
			arg_46_0.viewComponent:UpdateBtnState()
		end,
		[var_0_0.CHAMGE_TIME_RELOAD_SCENE] = function(arg_47_0, arg_47_1)
			local var_47_0 = arg_47_1:getBody()

			arg_47_0.contextData.timeIndex = var_47_0.timeIndex

			arg_47_0.viewComponent:SwitchDayNight(arg_47_0.contextData.timeIndex)
			onNextTick(function()
				arg_47_0.viewComponent:RefreshSlots()
			end)
			arg_47_0.viewComponent:UpdateContactState()
		end,
		[GAME.APARTMENT_GIVE_GIFT_DONE] = function(arg_49_0, arg_49_1)
			local var_49_0 = arg_49_1:getBody()

			arg_49_0.viewComponent:PlayHeartFX(var_49_0.groupId)
			arg_49_0.viewComponent:UpdateBtnState()
		end,
		[var_0_0.GUIDE_CLICK_LADY] = function(arg_50_0, arg_50_1)
			warning("this.GUIDE_CLICK_LADY")
			arg_50_0.viewComponent:EnterWatchMode()
		end,
		[var_0_0.GUIDE_CHECK_GUIDE] = function(arg_51_0, arg_51_1)
			arg_51_0.viewComponent:CheckGuide()
		end,
		[var_0_0.GUIDE_CHECK_LEVEL_UP] = function(arg_52_0, arg_52_1)
			arg_52_0.viewComponent:CheckLevelUp()
		end,
		[ApartmentProxy.UPDATE_ROOM] = function(arg_53_0, arg_53_1)
			local var_53_0 = arg_53_1:getBody()

			if var_53_0:GetConfigID() == arg_53_0.viewComponent.room:GetConfigID() then
				arg_53_0.viewComponent:SetRoom(var_53_0)
			end
		end,
		[Dorm3dInviteMediator.ON_DORM] = function(arg_54_0, arg_54_1)
			local var_54_0 = arg_54_1:getBody()

			arg_54_0:sendNotification(GAME.CHANGE_SCENE, SCENE.DORM3D_ROOM, var_54_0)
		end,
		[Dorm3dMiniGameMediator.OPERATION] = function(arg_55_0, arg_55_1)
			local var_55_0 = arg_55_1:getBody()

			arg_55_0.viewComponent:HandleGameNotification(Dorm3dMiniGameMediator.OPERATION, var_55_0)
		end,
		[ApartmentProxy.ZERO_HOUR_REFRESH] = function(arg_56_0, arg_56_1)
			local var_56_0 = arg_56_1:getBody()

			arg_56_0.viewComponent:UpdateFavorDisplay()
		end,
		[var_0_0.UPDATE_FAVOR_DISPLAY] = function(arg_57_0, arg_57_1)
			arg_57_0.viewComponent:UpdateFavorDisplay()
		end
	}
end

function var_0_0.remove(arg_58_0)
	return
end

return var_0_0
