local var_0_0 = class("NewMainScene", import("..base.BaseUI"))

var_0_0.OPEN_LIVEAREA = "NewMainScene:OPEN_LIVEAREA"
var_0_0.FOLD = "NewMainScene:FOLD"
var_0_0.CHAT_STATE_CHANGE = "NewMainScene:CHAT_STATE_CHANGE"
var_0_0.ON_CHANGE_SKIN = "NewMainScene:ON_CHANGE_SKIN"
var_0_0.ON_BUFF_DESC = "NewMainScene:ON_BUFF_DESC"
var_0_0.ON_SKIN_FREEUSAGE_DESC = "NewMainScene:ON_SKIN_FREEUSAGE_DESC"
var_0_0.ENABLE_PAITING_MOVE = "NewMainScene:ENABLE_PAITING_MOVE"
var_0_0.ON_ENTER_DONE = "NewMainScene:ON_ENTER_DONE"
var_0_0.ON_REMOVE_LAYER = "NewMainScene:ON_REMOVE_LAYER"
var_0_0.ON_PLAYER_UPDATE = "NewMainScene:ON_PLAYER_UPDATE"
var_0_0.ON_CHAT_MSG_UPDATE = "NewMainScene:ON_CHAT_MSG_UPDATE"
var_0_0.ON_STOP_PAITING_VOICE = "NewMainScene:ON_STOP_PAITING_VOICE"
var_0_0.ON_ACT_BTN_UPDATE = "NewMainScene:ON_ACT_BTN_UPDATE"
var_0_0.ON_ZERO_HOUR = "NewMainScene:ON_ZERO_HOUR"
var_0_0.ON_BUFF_UPDATE = "NewMainScene:ON_BUFF_UPDATE"

function var_0_0.getUIName(arg_1_0)
	return "NewMainUI"
end

function var_0_0.ResUISettings(arg_2_0)
	return {
		showType = PlayerResUI.TYPE_ALL,
		anim = not arg_2_0.resAnimFlag,
		weight = LayerWeightConst.BASE_LAYER + 1
	}
end

function var_0_0.needCache(arg_3_0)
	return true
end

function var_0_0.PlayBGM(arg_4_0)
	return
end

function var_0_0.GetFlagShip(arg_5_0)
	return (getProxy(PlayerProxy):getRawData():GetFlagShip())
end

function var_0_0.PlayBgm(arg_6_0, arg_6_1)
	local var_6_0

	if arg_6_1:IsBgmSkin() and getProxy(SettingsProxy):IsBGMEnable() then
		var_6_0 = arg_6_1:GetSkinBgm()
	end

	if not var_6_0 then
		local var_6_1, var_6_2 = MainBGView.GetBgAndBgm()

		var_6_0 = var_6_2
	end

	var_6_0 = var_6_0 or var_0_0.super.getBGM(arg_6_0)

	if var_6_0 then
		pg.BgmMgr.GetInstance():Push(arg_6_0.__cname, var_6_0)
	end
end

function var_0_0.ShowOrHideResUI(arg_7_0, arg_7_1)
	if not arg_7_0.isInit then
		return
	end

	var_0_0.super.ShowOrHideResUI(arg_7_0, arg_7_1)
end

function var_0_0.init(arg_8_0)
	arg_8_0:Register()

	arg_8_0.mainCG = GetOrAddComponent(arg_8_0:findTF("main"), typeof(CanvasGroup))
	arg_8_0.mainCG.alpha = 0
	arg_8_0.isInit = false
	arg_8_0.resAnimFlag = false
	arg_8_0.panels = {
		MainTopPanel.New(arg_8_0:findTF("main/frame/top"), arg_8_0.event, arg_8_0.contextData),
		MainRightPanel.New(arg_8_0:findTF("main/frame/right"), arg_8_0.event, arg_8_0.contextData),
		MainLeftPanel.New(arg_8_0:findTF("main/frame/left"), arg_8_0.event, arg_8_0.contextData),
		MainBottomPanel.New(arg_8_0:findTF("main/frame/bottom"), arg_8_0.event, arg_8_0.contextData)
	}
	pg.redDotHelper = MainReddotView.New(arg_8_0._tf)
	arg_8_0.bgView = MainBGView.New(arg_8_0:findTF("Sea/bg"))
	arg_8_0.iconView = MainIconView.New(arg_8_0:findTF("main/frame/char"))
	arg_8_0.paintingView = MainPaintingView.New(arg_8_0:findTF("paint"), arg_8_0:findTF("paintBg"), arg_8_0.event)
	arg_8_0.chatRoomView = MainChatRoomView.New(arg_8_0:findTF("main/frame/chatPreview"), arg_8_0.event)
	arg_8_0.bannerView = MainBannerView.New(arg_8_0:findTF("main/frame/eventPanel"), arg_8_0.event)
	arg_8_0.actBtnView = MainActivityBtnView.New(arg_8_0:findTF("main/frame/linkBtns"), arg_8_0.event)
	arg_8_0.buffView = MainBuffView.New(arg_8_0:findTF("main/frame/buffs"), arg_8_0.event)
	arg_8_0.effectView = MainEffectView.New(arg_8_0:findTF("paint/effect"))
	arg_8_0.buffDescPage = MainBuffDescPage.New(arg_8_0._tf, arg_8_0.event)
	arg_8_0.skinExperiencePage = SkinExperienceDiplayPage.New(arg_8_0._tf, arg_8_0.event)

	if USE_OLD_MAIN_LIVE_AREA_UI then
		arg_8_0.liveAreaPage = MainLiveAreaOldPage.New(arg_8_0._tf, arg_8_0.event)
	else
		arg_8_0.liveAreaPage = MainLiveAreaPage.New(arg_8_0._tf, arg_8_0.event)
	end

	arg_8_0.calibrationPage = MainCalibrationPage.New(arg_8_0._tf, arg_8_0.event)
	arg_8_0.sequenceView = MainSequenceView.New()
	arg_8_0.awakeSequenceView = MainAwakeSequenceView.New()
	arg_8_0.adpterView = MainAdpterView.New(arg_8_0:findTF("main/top_bg"), arg_8_0:findTF("main/bottom_bg"), arg_8_0:findTF("main/bg/right"))
end

function var_0_0.Register(arg_9_0)
	arg_9_0:bind(var_0_0.FOLD, function(arg_10_0, arg_10_1)
		arg_9_0:FoldPanels(arg_10_1)
	end)
	arg_9_0:bind(var_0_0.ON_CHANGE_SKIN, function(arg_11_0)
		arg_9_0:SwitchToNextShip()
	end)
end

function var_0_0.didEnter(arg_12_0)
	arg_12_0.mainCG.blocksRaycasts = false

	local var_12_0

	seriesAsync({
		function(arg_13_0)
			arg_12_0.awakeSequenceView:Execute(arg_13_0)
		end,
		function(arg_14_0)
			onNextTick(arg_14_0)
		end,
		function(arg_15_0)
			arg_12_0.isInit = true
			var_12_0 = arg_12_0:GetFlagShip()

			arg_12_0.bannerView:Init()
			arg_12_0.actBtnView:Init()
			arg_12_0:PlayEnterAnimation(arg_15_0)

			arg_12_0.resAnimFlag = true
		end,
		function(arg_16_0)
			arg_12_0.bgView:Init(var_12_0)
			onNextTick(arg_16_0)
		end,
		function(arg_17_0)
			for iter_17_0, iter_17_1 in ipairs(arg_12_0.panels) do
				iter_17_1:Init()
			end

			arg_12_0:PlayBgm(var_12_0)
			arg_12_0.iconView:Init(var_12_0)
			arg_12_0.paintingView:Init(var_12_0)
			arg_12_0.effectView:Init(var_12_0)
			arg_12_0.chatRoomView:Init()
			arg_12_0.buffView:Init()
			onNextTick(arg_17_0)
		end,
		function(arg_18_0)
			arg_12_0:BlurView()
			arg_12_0.sequenceView:Execute(arg_18_0)
		end
	}, function()
		arg_12_0:emit(var_0_0.ON_ENTER_DONE)

		arg_12_0.mainCG.blocksRaycasts = true
	end)
end

function var_0_0.PlayEnterAnimation(arg_20_0, arg_20_1)
	arg_20_0.adpterView:Init()
	arg_20_0:_FoldPanels(true, 0)

	arg_20_0.mainCG.alpha = 1

	arg_20_0:_FoldPanels(false, 0.5)
	onDelayTick(arg_20_1, 0.51)
end

function var_0_0.BlurView(arg_21_0)
	pg.LayerWeightMgr.GetInstance():Add2Overlay(LayerWeightConst.UI_TYPE_OVERLAY_FOREVER, arg_21_0.mainCG.gameObject.transform, {
		pbList = {
			arg_21_0:findTF("main/frame/chatPreview"),
			arg_21_0:findTF("main/frame/eventPanel")
		},
		weight = LayerWeightConst.BASE_LAYER + 1
	})
	arg_21_0:ShowOrHideResUI(true)
end

function var_0_0._FoldPanels(arg_22_0, arg_22_1, arg_22_2)
	for iter_22_0, iter_22_1 in ipairs(arg_22_0.panels) do
		iter_22_1:Fold(arg_22_1, arg_22_2)
	end

	arg_22_0.adpterView:Fold(arg_22_1, arg_22_2)
	arg_22_0.iconView:Fold(arg_22_1, arg_22_2)
	arg_22_0.chatRoomView:Fold(arg_22_1, arg_22_2)
	arg_22_0.bannerView:Fold(arg_22_1, arg_22_2)
	arg_22_0.actBtnView:Fold(arg_22_1, arg_22_2)
	arg_22_0.buffView:Fold(arg_22_1, arg_22_2)
end

function var_0_0.FoldPanels(arg_23_0, arg_23_1)
	if arg_23_1 then
		arg_23_0.mainCG.blocksRaycasts = false
	else
		Timer.New(function()
			if arg_23_0.mainCG then
				arg_23_0.mainCG.blocksRaycasts = true
			end
		end, 0.5, 1):Start()
	end

	arg_23_0:_FoldPanels(arg_23_1, 0.5)
	pg.playerResUI:Fold(arg_23_1, 0.5)
	arg_23_0.paintingView:Fold(arg_23_1, 0.5)
	arg_23_0.calibrationPage:ExecuteAction("ShowOrHide", arg_23_1, arg_23_0.iconView.ship)
end

function var_0_0.SwitchToNextShip(arg_25_0)
	if arg_25_0.paintingView:IsLoading() or arg_25_0.iconView:IsLoading() or arg_25_0.bgView:IsLoading() then
		return
	end

	local var_25_0 = getProxy(PlayerProxy):getRawData():GetNextFlagShip()

	if arg_25_0.iconView.ship.skinId ~= var_25_0.skinId or arg_25_0.iconView.ship.id ~= var_25_0.id then
		arg_25_0.bgView:Refresh(var_25_0)
		arg_25_0:PlayBgm(var_25_0)
		arg_25_0.iconView:Refresh(var_25_0)
		arg_25_0.paintingView:Refresh(var_25_0)
		arg_25_0.effectView:Refresh(var_25_0)
	end
end

function var_0_0.OnVisible(arg_26_0)
	arg_26_0.mainCG.blocksRaycasts = false

	seriesAsync({
		function(arg_27_0)
			arg_26_0.awakeSequenceView:Execute(arg_27_0)
		end,
		function(arg_28_0)
			for iter_28_0, iter_28_1 in ipairs(arg_26_0.panels) do
				iter_28_1:Refresh()
			end

			local var_28_0 = arg_26_0:GetFlagShip()

			arg_26_0.bgView:Refresh(var_28_0)
			arg_26_0.iconView:Refresh(var_28_0)
			arg_26_0.paintingView:Refresh(var_28_0)
			arg_26_0.effectView:Refresh(var_28_0)
			arg_26_0.chatRoomView:Refresh()
			arg_26_0.buffView:Refresh()
			arg_26_0.actBtnView:Refresh()
			arg_26_0.bannerView:Refresh()
			pg.redDotHelper:Refresh()
			arg_26_0:PlayBgm(var_28_0)
			arg_28_0()
		end,
		function(arg_29_0)
			arg_26_0.sequenceView:Execute(arg_29_0)
		end
	}, function()
		arg_26_0:emit(var_0_0.ON_ENTER_DONE)

		arg_26_0.mainCG.blocksRaycasts = true
	end)
	pg.LayerWeightMgr.GetInstance():SetVisibleViaLayer(arg_26_0.mainCG.gameObject.transform, true)
end

function var_0_0.OnDisVisible(arg_31_0)
	for iter_31_0, iter_31_1 in ipairs(arg_31_0.panels) do
		iter_31_1:Disable()
	end

	arg_31_0.iconView:Disable()
	arg_31_0.paintingView:Disable()
	arg_31_0.chatRoomView:Disable()
	arg_31_0.buffView:Disable()
	arg_31_0.actBtnView:Disable()
	arg_31_0.bannerView:Disable()
	pg.redDotHelper:Disable()
	arg_31_0.buffDescPage:Disable()
	arg_31_0.bgView:Disable()
	pg.LayerWeightMgr.GetInstance():SetVisibleViaLayer(arg_31_0.mainCG.gameObject.transform, false)
	arg_31_0.sequenceView:Disable()
	arg_31_0.awakeSequenceView:Disable()
end

function var_0_0.OnLogOut(arg_32_0)
	if arg_32_0.calibrationPage and arg_32_0.calibrationPage:GetLoaded() and arg_32_0.calibrationPage:isShowing() then
		triggerButton(arg_32_0.calibrationPage.backBtn)
	end
end

function var_0_0.onBackPressed(arg_33_0)
	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)

	if arg_33_0.liveAreaPage and arg_33_0.liveAreaPage:GetLoaded() and arg_33_0.liveAreaPage:isShowing() then
		arg_33_0.liveAreaPage:Hide()

		return
	end

	if arg_33_0.calibrationPage and arg_33_0.calibrationPage:GetLoaded() and arg_33_0.calibrationPage:isShowing() then
		triggerButton(arg_33_0.calibrationPage._parentTf)

		return
	end

	pg.SdkMgr.GetInstance():OnAndoridBackPress()
	pg.PushNotificationMgr.GetInstance():PushAll()
end

function var_0_0.willExit(arg_34_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_34_0.mainCG.gameObject.transform, arg_34_0._tf)

	for iter_34_0, iter_34_1 in ipairs(arg_34_0.panels) do
		iter_34_1:Dispose()
	end

	arg_34_0.panels = nil

	arg_34_0.bgView:Dispose()

	arg_34_0.bgView = nil

	arg_34_0.iconView:Dispose()

	arg_34_0.iconView = nil

	arg_34_0.paintingView:Dispose()

	arg_34_0.paintingView = nil

	arg_34_0.chatRoomView:Dispose()

	arg_34_0.chatRoomView = nil

	arg_34_0.bannerView:Dispose()

	arg_34_0.bannerView = nil

	arg_34_0.actBtnView:Dispose()

	arg_34_0.actBtnView = nil

	arg_34_0.buffView:Dispose()

	arg_34_0.buffView = nil

	arg_34_0.buffDescPage:Destroy()

	arg_34_0.buffDescPage = nil

	arg_34_0.skinExperiencePage:Destroy()

	arg_34_0.skinExperiencePage = nil

	arg_34_0.liveAreaPage:Destroy()

	arg_34_0.liveAreaPage = nil

	pg.redDotHelper:Dispose()

	pg.redDotHelper = nil

	arg_34_0.calibrationPage:Destroy()

	arg_34_0.calibrationPage = nil

	arg_34_0.sequenceView:Dispose()

	arg_34_0.sequenceView = nil

	arg_34_0.awakeSequenceView:Dispose()

	arg_34_0.awakeSequenceView = nil

	arg_34_0.effectView:Dispose()

	arg_34_0.effectView = nil

	arg_34_0.adpterView:Dispose()

	arg_34_0.adpterView = nil
end

return var_0_0
