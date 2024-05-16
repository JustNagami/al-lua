local var_0_0 = class("MainLeftPanel", import(".MainBasePanel"))

function var_0_0.OnSetUp(arg_1_0)
	arg_1_0.hideBtn = findTF(arg_1_0._tf, "hideButton")
	arg_1_0.cameraBtn = findTF(arg_1_0._tf, "cameraButton")
	arg_1_0.commissionBtn = findTF(arg_1_0._tf, "commissionButton")
	arg_1_0.wordBtn = findTF(arg_1_0._tf, "wordBtn")
	arg_1_0.wordOpen = findTF(arg_1_0.wordBtn, "open"):GetComponent(typeof(CanvasGroup))
	arg_1_0.wordClose = findTF(arg_1_0.wordBtn, "close"):GetComponent(typeof(CanvasGroup))
	arg_1_0.changeSkinBtn = findTF(arg_1_0._tf, "changeBtn")
	arg_1_0.cameraLpos = arg_1_0.cameraBtn.localPosition
	arg_1_0.wordLpos = arg_1_0.wordBtn.localPosition
end

function var_0_0.OnRegist(arg_2_0)
	onButton(arg_2_0, arg_2_0.hideBtn, function()
		arg_2_0:emit(NewMainScene.FOLD, true)
	end, SFX_MAIN)
	onButton(arg_2_0, arg_2_0.cameraBtn, function()
		arg_2_0:OpenCamera()
	end, SFX_MAIN)
	onButton(arg_2_0, arg_2_0.commissionBtn, function()
		if LeanTween.isTweening(arg_2_0.commissionBtn.gameObject) then
			return
		end

		LeanTween.moveX(arg_2_0.commissionBtn, -1 * arg_2_0.commissionBtn.rect.width, 0.2):setOnComplete(System.Action(function()
			arg_2_0:emit(NewMainMediator.OPEN_COMMISION)
		end))
	end, SFX_MAIN)

	local var_2_0 = getProxy(SettingsProxy):ShouldShipMainSceneWord()

	onButton(arg_2_0, arg_2_0.wordBtn, function()
		var_2_0 = not var_2_0

		getProxy(SettingsProxy):SaveMainSceneWordFlag(var_2_0)

		local var_7_0 = var_2_0 and i18n("game_openwords") or i18n("game_stopwords")

		pg.TipsMgr.GetInstance():ShowTips(var_7_0)
		arg_2_0:emit(NewMainScene.CHAT_STATE_CHANGE, var_2_0)
		arg_2_0:UpdateWordBtn(var_2_0)
	end, SFX_MAIN)
	onButton(arg_2_0, arg_2_0.changeSkinBtn, function()
		arg_2_0:emit(NewMainScene.ON_CHANGE_SKIN)
	end, SFX_MAIN)
	arg_2_0:UpdateLayout()
	arg_2_0:ResetCommissionBtn()
	arg_2_0:UpdateWordBtn(var_2_0)
	arg_2_0:UpdateChangeSkinBtn()
end

function var_0_0.UpdateLayout(arg_9_0)
	if pg.SdkMgr.GetInstance():IsAUPackage() then
		setActive(arg_9_0.cameraBtn, false)

		arg_9_0.wordBtn.localPosition = arg_9_0.cameraLpos
		arg_9_0.changeSkinBtn.localPosition = arg_9_0.wordLpos
	end
end

function var_0_0.OnFresh(arg_10_0)
	arg_10_0:UpdateChangeSkinBtn()
	arg_10_0:ResetCommissionBtn()
end

function var_0_0.OnRemoveLayer(arg_11_0, arg_11_1)
	if arg_11_1.mediator == CommissionInfoMediator then
		arg_11_0:ResetCommissionBtn()
	end
end

function var_0_0.OpenCamera(arg_12_0)
	if pg.SdkMgr.GetInstance():IsYunPackage() then
		pg.TipsMgr.GetInstance():ShowTips("指挥官，当前平台不支持该功能哦")

		return
	end

	local var_12_0
	local var_12_1

	local function var_12_2()
		arg_12_0:emit(NewMainMediator.GO_SNAPSHOT)
	end

	local function var_12_3()
		if CameraHelper.IsAndroid() then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("apply_permission_camera_tip3"),
				onYes = function()
					CameraHelper.RequestCamera(var_12_2, var_12_3)
				end
			})
		elseif CameraHelper.IsIOS() then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("apply_permission_camera_tip2")
			})
		end
	end

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		content = i18n("apply_permission_camera_tip1"),
		onYes = function()
			CameraHelper.RequestCamera(var_12_2, var_12_3)
		end
	})
end

function var_0_0.ResetCommissionBtn(arg_17_0)
	local var_17_0 = arg_17_0.commissionBtn.localPosition

	arg_17_0.commissionBtn.localPosition = Vector3(0, var_17_0.y, 0)
end

function var_0_0.UpdateWordBtn(arg_18_0, arg_18_1)
	local var_18_0 = arg_18_1 and 1 or 0

	arg_18_0.wordOpen.alpha = 1 - var_18_0
	arg_18_0.wordClose.alpha = var_18_0
end

function var_0_0.UpdateChangeSkinBtn(arg_19_0)
	local var_19_0

	if getProxy(SettingsProxy):IsOpenRandomFlagShip() then
		var_19_0 = _.select(getProxy(SettingsProxy):GetRandomFlagShipList(), function(arg_20_0)
			return getProxy(BayProxy):RawGetShipById(arg_20_0) ~= nil
		end)
	else
		var_19_0 = getProxy(PlayerProxy):getRawData().characters
	end

	local var_19_1 = getProxy(SettingsProxy):GetFlagShipDisplayMode()
	local var_19_2 = var_19_1 == FlAG_SHIP_DISPLAY_ONLY_EDUCATECHAR and 0 or #var_19_0

	if getProxy(PlayerProxy):getRawData():ExistEducateChar() and var_19_1 ~= FlAG_SHIP_DISPLAY_ONLY_SHIP then
		var_19_2 = var_19_2 + 1
	end

	setActive(arg_19_0.changeSkinBtn, var_19_2 > 1)
end

function var_0_0.GetDirection(arg_21_0)
	return Vector2(-1, 0)
end

return var_0_0
