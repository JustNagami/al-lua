local var_0_0 = class("NewMainScene", import("..base.BaseUI"))

var_0_0.THEME_CLASSIC = 1
var_0_0.THEME_MELLOW = 2
var_0_0.OPEN_LIVEAREA = "NewMainScene:OPEN_LIVEAREA"
var_0_0.UPDATE_COVER = "NewMainScene:UPDATE_COVER"
var_0_0.FOLD = "NewMainScene:FOLD"
var_0_0.CHAT_STATE_CHANGE = "NewMainScene:CHAT_STATE_CHANGE"
var_0_0.ON_CHANGE_SKIN = "NewMainScene:ON_CHANGE_SKIN"
var_0_0.ON_BUFF_DESC = "NewMainScene:ON_BUFF_DESC"
var_0_0.ON_SKIN_FREEUSAGE_DESC = "NewMainScene:ON_SKIN_FREEUSAGE_DESC"
var_0_0.ENABLE_PAITING_MOVE = "NewMainScene:ENABLE_PAITING_MOVE"
var_0_0.ON_ENTER_DONE = "NewMainScene:ON_ENTER_DONE"
var_0_0.ENTER_SILENT_VIEW = "NewMainScene:ENTER_SILENT_VIEW"
var_0_0.EXIT_SILENT_VIEW = "NewMainScene:EXIT_SILENT_VIEW"
var_0_0.RESET_L2D = "NewMainScene:RESET_L2D"

function var_0_0.getUIName(arg_1_0)
	return "NewMainUI"
end

function var_0_0.needCache(arg_2_0)
	return true
end

function var_0_0.GetThemeStyle(arg_3_0)
	return getProxy(SettingsProxy):GetMainSceneThemeStyle()
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

function var_0_0.ResUISettings(arg_7_0)
	return {
		showType = PlayerResUI.TYPE_ALL,
		anim = not arg_7_0.resAnimFlag,
		weight = LayerWeightConst.BASE_LAYER + 1
	}
end

function var_0_0.ShowOrHideResUI(arg_8_0, arg_8_1)
	if not arg_8_0.isInit then
		return
	end

	var_0_0.super.ShowOrHideResUI(arg_8_0, arg_8_1)
end

function var_0_0.init(arg_9_0)
	arg_9_0.mainCG = GetOrAddComponent(arg_9_0._tf, typeof(CanvasGroup))
	arg_9_0.bgView = MainBGView.New(arg_9_0:findTF("Sea/bg"))
	arg_9_0.paintingView = MainPaintingView.New(arg_9_0:findTF("paint"), arg_9_0:findTF("paintBg"), arg_9_0.event)
	arg_9_0.effectView = MainEffectView.New(arg_9_0:findTF("paint/effect"))
	arg_9_0.buffDescPage = MainBuffDescPage.New(arg_9_0._tf, arg_9_0.event)
	arg_9_0.calibrationPage = MainCalibrationPage.New(arg_9_0._tf, arg_9_0.event, arg_9_0.contextData)
	arg_9_0.silentView = MainSilentView.New(arg_9_0._tf, arg_9_0.event, arg_9_0.contextData)
	arg_9_0.silentChecker = MainSilentChecker.New(arg_9_0.event)
	arg_9_0.skinExperienceDisplayPage = SkinExperienceDiplayPage.New(arg_9_0._tf, arg_9_0.event)

	if USE_OLD_MAIN_LIVE_AREA_UI then
		arg_9_0.liveAreaPage = MainLiveAreaOldPage.New(arg_9_0._tf, arg_9_0.event)
	else
		arg_9_0.liveAreaPage = MainLiveAreaPage.New(arg_9_0._tf, arg_9_0.event)
	end

	pg.redDotHelper = MainReddotView.New()
	arg_9_0.sequenceView = MainSequenceView.New()
	arg_9_0.awakeSequenceView = MainAwakeSequenceView.New()
	arg_9_0.themes = {
		[var_0_0.THEME_CLASSIC] = NewMainClassicTheme.New(arg_9_0._tf, arg_9_0.event, arg_9_0.contextData),
		[var_0_0.THEME_MELLOW] = NewMainMellowTheme.New(arg_9_0._tf, arg_9_0.event, arg_9_0.contextData)
	}
end

function var_0_0.didEnter(arg_10_0)
	arg_10_0:bind(var_0_0.FOLD, function(arg_11_0, arg_11_1)
		arg_10_0:FoldPanels(arg_11_1)

		local var_11_0 = arg_10_0.paintingView.ship

		if not var_11_0 then
			return
		end

		arg_10_0.calibrationPage:ExecuteAction("ShowOrHide", arg_11_1, arg_10_0.bgView.ship, arg_10_0.theme:GetPaintingOffset(var_11_0), arg_10_0.theme:GetCalibrationBG())
	end)
	arg_10_0:bind(var_0_0.ON_CHANGE_SKIN, function(arg_12_0)
		arg_10_0:SwitchToNextShip()
	end)
	arg_10_0:bind(var_0_0.ENTER_SILENT_VIEW, function()
		arg_10_0:ExitCalibrationView()
		arg_10_0:FoldPanels(true)
		arg_10_0.silentView:ExecuteAction("Show")
	end)
	arg_10_0:bind(GAME.WILL_LOGOUT, function()
		arg_10_0:GameLogout()
	end)
	arg_10_0:bind(var_0_0.EXIT_SILENT_VIEW, function()
		arg_10_0:ExitSilentView()
		arg_10_0:SetUpSilentChecker()
		pg.redDotHelper:_Refresh()
	end)
	arg_10_0:bind(var_0_0.ON_SKIN_FREEUSAGE_DESC, function(arg_16_0, arg_16_1)
		arg_10_0.skinExperienceDisplayPage:ExecuteAction("Show", arg_16_1)
	end)
	arg_10_0:bind(NewMainScene.OPEN_LIVEAREA, function(arg_17_0)
		arg_10_0.liveAreaPage:ExecuteAction("Show")
	end)
	arg_10_0:SetUp(false, true)
end

function var_0_0.SetUp(arg_18_0, arg_18_1, arg_18_2)
	arg_18_0.mainCG.blocksRaycasts = false
	arg_18_0.isInit = false
	arg_18_0.resAnimFlag = false

	local var_18_0

	seriesAsync({
		function(arg_19_0)
			arg_18_0.awakeSequenceView:Execute(arg_19_0)
		end,
		function(arg_20_0)
			var_18_0 = arg_18_0:GetFlagShip()

			arg_18_0.bgView:Init(var_18_0)
			onNextTick(arg_20_0)
		end,
		function(arg_21_0)
			arg_18_0.theme = arg_18_0.themes[arg_18_0:GetThemeStyle()]

			arg_18_0.theme:ExecuteAction("Show", arg_21_0)
		end,
		function(arg_22_0)
			onNextTick(arg_22_0)
		end,
		function(arg_23_0)
			arg_18_0.isInit = true

			arg_18_0.theme:PlayEnterAnimation(var_18_0, arg_23_0)

			local var_23_0 = arg_18_0.theme:GetPaintingOffset(var_18_0)

			arg_18_0.paintingView:Init(var_18_0, var_23_0, arg_18_1)

			arg_18_0.resAnimFlag = true
		end,
		function(arg_24_0)
			arg_18_0:PlayBgm(var_18_0)
			arg_18_0.effectView:Init(var_18_0)
			arg_18_0.theme:init(var_18_0)
			onNextTick(arg_24_0)
		end,
		function(arg_25_0)
			arg_18_0:ShowOrHideResUI(arg_18_0.theme:ApplyDefaultResUI())
			arg_18_0.sequenceView:Execute(arg_25_0)
		end
	}, function()
		arg_18_0:SetUpSilentChecker()
		arg_18_0:emit(var_0_0.ON_ENTER_DONE)

		arg_18_0.mainCG.blocksRaycasts = true

		if arg_18_2 then
			gcAll()
		end
	end)
end

function var_0_0.SetUpSilentChecker(arg_27_0)
	local var_27_0 = getProxy(SettingsProxy):GetMainSceneScreenSleepTime()

	arg_27_0.defaultSleepTimeout = Screen.sleepTimeout
	Screen.sleepTimeout = var_27_0

	if SettingsMainScenePanel.IsEnableStandbyMode() then
		arg_27_0.silentChecker:SetUp()
	end
end

function var_0_0.RevertSleepTimeout(arg_28_0)
	if arg_28_0.defaultSleepTimeout and Screen.sleepTimeout ~= arg_28_0.defaultSleepTimeout then
		Screen.sleepTimeout = arg_28_0.defaultSleepTimeout
	end

	arg_28_0.defaultSleepTimeout = nil
end

function var_0_0.FoldPanels(arg_29_0, arg_29_1)
	if not arg_29_0.theme then
		return
	end

	arg_29_0.theme:OnFoldPanels(arg_29_1)
	arg_29_0.paintingView:Fold(arg_29_1, 0.5)
	pg.playerResUI:Fold(arg_29_1, 0.5)
end

function var_0_0.SwitchToNextShip(arg_30_0)
	if arg_30_0.paintingView:IsLoading() or arg_30_0.bgView:IsLoading() or not arg_30_0.theme then
		return
	end

	local var_30_0 = getProxy(PlayerProxy):getRawData():GetNextFlagShip()

	if arg_30_0.bgView.ship.skinId ~= var_30_0.skinId or arg_30_0.bgView.ship.id ~= var_30_0.id then
		arg_30_0.bgView:Refresh(var_30_0)
		arg_30_0:PlayBgm(var_30_0)
		arg_30_0.paintingView:Refresh(var_30_0, arg_30_0.theme:GetPaintingOffset(var_30_0))
		arg_30_0.effectView:Refresh(var_30_0)
		arg_30_0.theme:OnSwitchToNextShip(var_30_0)
	end
end

function var_0_0.UpdateFlagShip(arg_31_0, arg_31_1, arg_31_2)
	if arg_31_0.paintingView:IsLoading() or arg_31_0.bgView:IsLoading() or not arg_31_0.theme then
		return
	end

	local var_31_0 = arg_31_2.callback

	arg_31_0.bgView:Refresh(arg_31_1)
	arg_31_0:PlayBgm(arg_31_1)
	arg_31_0.paintingView:SetOnceLoadedCall(var_31_0)
	arg_31_0.paintingView:Refresh(arg_31_1, arg_31_0.theme:GetPaintingOffset(arg_31_1))
	arg_31_0.effectView:Refresh(arg_31_1)
	arg_31_0.theme:OnSwitchToNextShip(arg_31_1)
end

function var_0_0.PlayChangeSkinActionOut(arg_32_0, arg_32_1)
	arg_32_0.paintingView:PlayChangeSkinActionOut(arg_32_1)
end

function var_0_0.PlayChangeSkinActionIn(arg_33_0, arg_33_1)
	arg_33_0.paintingView:PlayChangeSkinActionIn(arg_33_1)
end

function var_0_0.SetEffectPanelVisible(arg_34_0, arg_34_1)
	if arg_34_0.theme then
		arg_34_0.theme:SetEffectPanelVisible(arg_34_1)
	end
end

function var_0_0.OnVisible(arg_35_0)
	local var_35_0 = arg_35_0.themes[arg_35_0:GetThemeStyle()]

	if not (not arg_35_0.theme or var_35_0 ~= arg_35_0.theme) then
		arg_35_0:Refresh()
	else
		arg_35_0:UnloadTheme()
		arg_35_0:SetUp(true)
	end
end

function var_0_0.Refresh(arg_36_0)
	arg_36_0.mainCG.blocksRaycasts = false

	seriesAsync({
		function(arg_37_0)
			arg_36_0.awakeSequenceView:Execute(arg_37_0)
		end,
		function(arg_38_0)
			arg_36_0.isInit = true

			arg_36_0:ShowOrHideResUI(arg_36_0.theme:ApplyDefaultResUI())

			local var_38_0 = arg_36_0:GetFlagShip()

			arg_36_0.bgView:Refresh(var_38_0)
			arg_36_0.paintingView:Refresh(var_38_0, arg_36_0.theme:GetPaintingOffset(var_38_0))
			arg_36_0.effectView:Refresh(var_38_0)
			arg_36_0.theme:Refresh(var_38_0)
			arg_36_0:PlayBgm(var_38_0)
			pg.redDotHelper:Refresh()
			arg_38_0()
		end,
		function(arg_39_0)
			arg_36_0.sequenceView:Execute(arg_39_0)
		end
	}, function()
		arg_36_0:SetUpSilentChecker()
		arg_36_0:emit(var_0_0.ON_ENTER_DONE)

		arg_36_0.mainCG.blocksRaycasts = true
	end)
end

function var_0_0.OnDisVisible(arg_41_0)
	arg_41_0:FoldPanels(false)
	arg_41_0.paintingView:Disable()
	arg_41_0.bgView:Disable()
	arg_41_0.sequenceView:Disable()
	arg_41_0.awakeSequenceView:Disable()
	arg_41_0.theme:Disable()
	pg.redDotHelper:Disable()
	arg_41_0.buffDescPage:Disable()
	arg_41_0.silentChecker:Disable()
	arg_41_0.calibrationPage:Destroy()
	arg_41_0.calibrationPage:Reset()
	arg_41_0.skinExperienceDisplayPage:Destroy()
	arg_41_0.skinExperienceDisplayPage:Reset()
	arg_41_0.liveAreaPage:Destroy()
	arg_41_0.liveAreaPage:Reset()

	arg_41_0.isInit = false

	arg_41_0:RevertSleepTimeout()
end

function var_0_0.UnloadTheme(arg_42_0)
	if arg_42_0.theme then
		arg_42_0.theme:Destroy()
		arg_42_0.theme:Reset()

		arg_42_0.theme = nil
	end
end

function var_0_0.ExitCalibrationView(arg_43_0)
	if arg_43_0.calibrationPage and arg_43_0.calibrationPage:GetLoaded() and arg_43_0.calibrationPage:isShowing() then
		triggerButton(arg_43_0.calibrationPage.backBtn)
	end
end

function var_0_0.ExitSilentView(arg_44_0)
	if arg_44_0.silentView and arg_44_0.silentView:GetLoaded() and arg_44_0.silentView:isShowing() then
		arg_44_0:FoldPanels(false)
		arg_44_0.silentView:Destroy()
		arg_44_0.silentView:Reset()
	end
end

function var_0_0.GameLogout(arg_45_0)
	arg_45_0:ExitCalibrationView()
	arg_45_0:ExitSilentView()
end

function var_0_0.onBackPressed(arg_46_0)
	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)

	if arg_46_0.silentView and arg_46_0.silentView:GetLoaded() and arg_46_0.silentView:isShowing() then
		arg_46_0:ExitSilentView()

		return
	end

	if arg_46_0.liveAreaPage and arg_46_0.liveAreaPage:GetLoaded() and arg_46_0.liveAreaPage:isShowing() then
		arg_46_0.liveAreaPage:Hide()

		return
	end

	if arg_46_0.calibrationPage and arg_46_0.calibrationPage:GetLoaded() and arg_46_0.calibrationPage:isShowing() then
		triggerButton(arg_46_0.calibrationPage._parentTf)

		return
	end

	pg.SdkMgr.GetInstance():OnAndoridBackPress()
	pg.PushNotificationMgr.GetInstance():PushAll()
end

function var_0_0.willExit(arg_47_0)
	arg_47_0.bgView:Dispose()

	arg_47_0.bgView = nil

	if arg_47_0.calibrationPage then
		arg_47_0.calibrationPage:Destroy()

		arg_47_0.calibrationPage = nil
	end

	if arg_47_0.silentView then
		arg_47_0.silentView:Destroy()

		arg_47_0.silentView = nil
	end

	arg_47_0.paintingView:Dispose()

	arg_47_0.paintingView = nil

	arg_47_0.liveAreaPage:Destroy()

	arg_47_0.liveAreaPage = nil

	arg_47_0.sequenceView:Dispose()

	arg_47_0.sequenceView = nil

	arg_47_0.awakeSequenceView:Dispose()

	arg_47_0.awakeSequenceView = nil

	arg_47_0.effectView:Dispose()

	arg_47_0.effectView = nil

	pg.redDotHelper:Dispose()

	pg.redDotHelper = nil

	arg_47_0.buffDescPage:Destroy()

	arg_47_0.buffDescPage = nil

	arg_47_0.silentChecker:Dispose()

	arg_47_0.silentChecker = nil

	arg_47_0.skinExperienceDisplayPage:Destroy()

	arg_47_0.skinExperienceDisplayPage = nil

	arg_47_0:UnloadTheme()
	arg_47_0:RevertSleepTimeout()
end

return var_0_0
