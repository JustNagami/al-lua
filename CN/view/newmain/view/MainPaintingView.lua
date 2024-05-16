local var_0_0 = class("MainPaintingView", import("view.base.BaseEventLogic"))

var_0_0.STATE_PAINTING = 1
var_0_0.STATE_L2D = 2
var_0_0.STATE_SPINE_PAINTING = 3
var_0_0.STATE_EDUCATE_CHAR = 4
var_0_0.PAINT_DEFAULT_POS_X = -600
var_0_0.DEFAULT_HEIGHT = -10

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	var_0_0.super.Ctor(arg_1_0, arg_1_3)

	arg_1_0._tf = arg_1_1
	arg_1_0._go = arg_1_1.gameObject
	arg_1_0._bgTf = arg_1_2
	arg_1_0._bgGo = arg_1_2.gameObject
	arg_1_0.chatTf = arg_1_1.parent:Find("chat")
	arg_1_0.chatPos = arg_1_0.chatTf.anchoredPosition
	arg_1_0.chatTxt = arg_1_0.chatTf:Find("Text"):GetComponent(typeof(Text))
	arg_1_0.paintings = {
		MainMeshImagePainting.New(arg_1_0._tf, arg_1_0.chatTf),
		MainLive2dPainting.New(arg_1_0._tf, arg_1_0.chatTf),
		MainSpinePainting.New(arg_1_0._tf, arg_1_0.chatTf, arg_1_0._bgGo),
		MainEducateCharPainting.New(arg_1_0._tf, arg_1_0.chatTf)
	}
	arg_1_0.bgOffset = arg_1_0._bgTf.localPosition - arg_1_0._tf.localPosition
	arg_1_0.cg = arg_1_0._tf:GetComponent(typeof(CanvasGroup))

	arg_1_0:Register()
end

function var_0_0.Register(arg_2_0)
	arg_2_0:bind(NewMainScene.ON_STOP_PAITING_VOICE, function(arg_3_0)
		arg_2_0:OnStopVoice()
	end)
	arg_2_0:bind(NewMainScene.CHAT_STATE_CHANGE, function(arg_4_0, arg_4_1)
		arg_2_0:OnChatStateChange(arg_4_1)
	end)
	arg_2_0:bind(NewMainScene.ENABLE_PAITING_MOVE, function(arg_5_0, arg_5_1)
		arg_2_0:EnableOrDisableMove(arg_5_1)
	end)
	arg_2_0:bind(NewMainScene.ON_ENTER_DONE, function(arg_6_0)
		if arg_2_0.painting then
			arg_2_0.painting:TriggerEventAtFirstTime()
		end
	end)
end

function var_0_0.OnChatStateChange(arg_7_0, arg_7_1)
	if not arg_7_1 then
		arg_7_0.painting:StopChatAnimtion()
	end
end

function var_0_0.OnStopVoice(arg_8_0)
	if arg_8_0.painting then
		arg_8_0.painting:OnStopVoice()
	end
end

function var_0_0.IsLive2DState(arg_9_0)
	return var_0_0.STATE_L2D == arg_9_0.state
end

function var_0_0.IsLoading(arg_10_0)
	if arg_10_0.painting and arg_10_0.painting:IsLoading() then
		return true
	end

	return false
end

function var_0_0.Init(arg_11_0, arg_11_1)
	arg_11_0.ship = arg_11_1

	arg_11_0:AdjustPosition(arg_11_1)

	local var_11_0, var_11_1 = var_0_0.GetAssistantStatus(arg_11_1)
	local var_11_2 = arg_11_0.paintings[var_11_0]

	if arg_11_0.painting then
		arg_11_0.painting:Unload()
	end

	var_11_2:Load(arg_11_1)

	arg_11_0.painting = var_11_2
	arg_11_0.state = var_11_0
	arg_11_0.bgToggle = PlayerPrefs.GetInt("paint_hide_other_obj_" .. arg_11_0.painting.paintingName, 0)
end

function var_0_0.Refresh(arg_12_0, arg_12_1)
	local var_12_0 = var_0_0.GetAssistantStatus(arg_12_1)
	local var_12_1 = PlayerPrefs.GetInt("paint_hide_other_obj_" .. arg_12_0.painting.paintingName, 0)

	if arg_12_1.skinId == arg_12_0.ship.skinId and arg_12_1.id == arg_12_0.ship.id and arg_12_0.state == var_12_0 and arg_12_0.bgToggle == var_12_1 and arg_12_1:GetRecordPosKey() == arg_12_0.ship:GetRecordPosKey() then
		arg_12_0.painting:Resume()
	else
		arg_12_0:Init(arg_12_1)
	end

	setActive(arg_12_0.chatTxt.gameObject, false)
	setActive(arg_12_0.chatTxt.gameObject, true)
end

function var_0_0.Disable(arg_13_0)
	arg_13_0.painting:Puase()
end

function var_0_0.AdjustPosition(arg_14_0, arg_14_1)
	local var_14_0, var_14_1, var_14_2 = getProxy(SettingsProxy):getSkinPosSetting(arg_14_1)

	if var_14_0 then
		arg_14_0._tf.anchoredPosition = Vector2(var_14_0, var_14_1)
		arg_14_0._tf.localScale = Vector3(var_14_2, var_14_2, 1)
		arg_14_0._bgTf.anchoredPosition = Vector2(var_14_0, var_14_1)
		arg_14_0._bgTf.localScale = Vector3(var_14_2, var_14_2, 1)
	else
		arg_14_0._tf.anchoredPosition = Vector2(var_0_0.PAINT_DEFAULT_POS_X, var_0_0.DEFAULT_HEIGHT)
		arg_14_0._tf.localScale = Vector3.one
		arg_14_0._bgTf.anchoredPosition = Vector2(var_0_0.PAINT_DEFAULT_POS_X, var_0_0.DEFAULT_HEIGHT)
		arg_14_0._bgTf.localScale = Vector3.one
	end
end

function var_0_0.GetAssistantStatus(arg_15_0)
	local var_15_0 = arg_15_0:getPainting()
	local var_15_1 = getProxy(SettingsProxy)
	local var_15_2 = HXSet.autoHxShiftPath("spinepainting/" .. var_15_0)
	local var_15_3 = PathMgr.FileExists(PathMgr.getAssetBundle(var_15_2))
	local var_15_4 = HXSet.autoHxShiftPath("live2d/" .. var_15_0)
	local var_15_5 = var_0_0.Live2dIsDownload(var_15_4) and PathMgr.FileExists(PathMgr.getAssetBundle(var_15_4))
	local var_15_6 = var_15_1:getCharacterSetting(arg_15_0.id, SHIP_FLAG_BG)

	if var_15_1:getCharacterSetting(arg_15_0.id, SHIP_FLAG_SP) and var_15_3 then
		return var_0_0.STATE_SPINE_PAINTING, var_15_6
	elseif var_15_1:getCharacterSetting(arg_15_0.id, SHIP_FLAG_L2D) and var_15_5 then
		return var_0_0.STATE_L2D, var_15_6
	elseif isa(arg_15_0, VirtualEducateCharShip) then
		return var_0_0.STATE_EDUCATE_CHAR, var_15_6
	else
		return var_0_0.STATE_PAINTING, var_15_6
	end
end

function var_0_0.Live2dIsDownload(arg_16_0)
	local var_16_0 = GroupHelper.GetGroupMgrByName("L2D"):CheckF(arg_16_0)

	return var_16_0 == DownloadState.None or var_16_0 == DownloadState.UpdateSuccess
end

function var_0_0.Fold(arg_17_0, arg_17_1, arg_17_2)
	if arg_17_1 then
		local var_17_0 = arg_17_0._tf.localPosition - arg_17_0._bgTf.localPosition
		local var_17_1 = Vector3(0 - arg_17_0.painting:GetOffset(), 0, 0)

		LeanTween.moveLocal(arg_17_0._tf.gameObject, var_17_1, arg_17_2):setEase(LeanTweenType.easeInOutExpo)

		local var_17_2 = var_17_1 - var_17_0

		LeanTween.moveLocal(arg_17_0._bgTf.gameObject, var_17_2, arg_17_2):setEase(LeanTweenType.easeInOutExpo)
	else
		LeanTween.cancel(arg_17_0._tf.gameObject)
		LeanTween.cancel(arg_17_0._bgTf.gameObject)

		if arg_17_0.ship then
			arg_17_0:AdjustPosition(arg_17_0.ship)
		end

		arg_17_0.chatTf.anchoredPosition = arg_17_0.chatPos
	end

	arg_17_0.painting:Fold(arg_17_1, arg_17_2)
end

function var_0_0.EnableOrDisableMove(arg_18_0, arg_18_1)
	arg_18_0.painting:EnableOrDisableMove(arg_18_1)

	if arg_18_1 then
		arg_18_0:EnableDragAndZoom()
	else
		arg_18_0:DisableDragAndZoom()
	end
end

function var_0_0.EnableDragAndZoom(arg_19_0)
	arg_19_0.isEnableDrag = true

	local var_19_0 = arg_19_0._tf.parent.gameObject
	local var_19_1 = GetOrAddComponent(var_19_0, typeof(PinchZoom))
	local var_19_2 = GetOrAddComponent(var_19_0, typeof(EventTriggerListener))
	local var_19_3 = Vector3(0, 0, 0)

	var_19_2:AddBeginDragFunc(function(arg_20_0, arg_20_1)
		if Application.isEditor and Input.GetMouseButton(2) then
			return
		end

		if var_19_1.processing then
			return
		end

		setButtonEnabled(var_19_0, false)

		if Input.touchCount > 1 then
			return
		end

		local var_20_0 = var_0_0.Screen2Local(var_19_0.transform.parent, arg_20_1.position)

		var_19_3 = arg_19_0._tf.localPosition - var_20_0
	end)
	var_19_2:AddDragFunc(function(arg_21_0, arg_21_1)
		if Application.isEditor and Input.GetMouseButton(2) then
			return
		end

		if var_19_1.processing then
			return
		end

		if Input.touchCount > 1 then
			return
		end

		local var_21_0 = var_0_0.Screen2Local(var_19_0.transform.parent, arg_21_1.position)

		arg_19_0._tf.localPosition = arg_19_0.painting:IslimitYPos() and Vector3(var_21_0.x, var_19_0.transform.localPosition.y, 0) + Vector3(var_19_3.x, 0, 0) or Vector3(var_21_0.x, var_21_0.y, 0) + var_19_3
		arg_19_0._bgTf.localPosition = arg_19_0.bgOffset + arg_19_0._tf.localPosition
	end)
	var_19_2:AddDragEndFunc(function()
		setButtonEnabled(var_19_0, true)
	end)

	if not arg_19_0.painting:IslimitYPos() then
		var_19_1.enabled = true
	end

	var_19_2.enabled = true
	Input.multiTouchEnabled = true
	arg_19_0.cg.blocksRaycasts = false

	arg_19_0:AdjustPosition(arg_19_0.ship)
end

function var_0_0.DisableDragAndZoom(arg_23_0)
	if arg_23_0.isEnableDrag then
		local var_23_0 = arg_23_0._tf.parent:GetComponent(typeof(EventTriggerListener))

		ClearEventTrigger(var_23_0)

		var_23_0.enabled = false
		arg_23_0._tf.parent:GetComponent(typeof(PinchZoom)).enabled = false
		arg_23_0.cg.blocksRaycasts = true
		arg_23_0.isEnableDrag = false
	end
end

function var_0_0.Dispose(arg_24_0)
	arg_24_0:disposeEvent()
	arg_24_0:DisableDragAndZoom()

	if arg_24_0.painting then
		arg_24_0.painting:Unload()
	end

	arg_24_0.painting = nil

	for iter_24_0, iter_24_1 in ipairs(arg_24_0.paintings) do
		iter_24_1:Dispose()
	end

	arg_24_0.paintings = nil
end

function var_0_0.Screen2Local(arg_25_0, arg_25_1)
	local var_25_0 = GameObject.Find("UICamera"):GetComponent("Camera")
	local var_25_1 = arg_25_0:GetComponent("RectTransform")
	local var_25_2 = LuaHelper.ScreenToLocal(var_25_1, arg_25_1, var_25_0)

	return Vector3(var_25_2.x, var_25_2.y, 0)
end

return var_0_0
