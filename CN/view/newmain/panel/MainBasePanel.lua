local var_0_0 = class("MainBasePanel", import("view.base.BaseEventLogic"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	var_0_0.super.Ctor(arg_1_0, arg_1_2)
	pg.DelegateInfo.New(arg_1_0)

	arg_1_0._tf = arg_1_1
	arg_1_0._go = arg_1_1.gameObject
	arg_1_0.event = arg_1_2
	arg_1_0.contextData = arg_1_3

	arg_1_0:OnSetUp()
end

function var_0_0.Init(arg_2_0)
	arg_2_0:Regist()
	arg_2_0:Refresh()
end

function var_0_0.Regist(arg_3_0)
	arg_3_0:bind(NewMainScene.ON_REMOVE_LAYER, function(arg_4_0, arg_4_1)
		arg_3_0:OnRemoveLayer(arg_4_1)
	end)
	arg_3_0:bind(NewMainScene.ON_PLAYER_UPDATE, function(arg_5_0)
		arg_3_0:OnUpdatePlayer()
	end)
	arg_3_0:OnRegist()
end

function var_0_0.emit(arg_6_0, ...)
	if arg_6_0.event then
		arg_6_0.event:emit(...)
	end
end

function var_0_0.Fold(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0.lpos = arg_7_0.lpos or arg_7_0._tf.localPosition

	local var_7_0 = arg_7_0:GetDirection()

	if var_7_0.x ~= 0 and arg_7_1 then
		arg_7_0:FoldHrz(var_7_0.x, arg_7_2)
	elseif var_7_0.x ~= 0 and not arg_7_1 then
		arg_7_0:UnFoldHrz(arg_7_2)
	end

	if var_7_0.y ~= 0 and arg_7_1 then
		arg_7_0:FoldVec(var_7_0.y, arg_7_2)
	elseif var_7_0.y ~= 0 and not arg_7_1 then
		arg_7_0:UnFoldVec(arg_7_2)
	end
end

function var_0_0.FoldHrz(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = arg_8_1 > 0 and 1000 or -1000

	if arg_8_2 == 0 then
		local var_8_1 = arg_8_0._go.transform.localPosition

		arg_8_0._go.transform.localPosition = Vector3(arg_8_0.lpos.x + var_8_0, var_8_1.y, 0)
	else
		LeanTween.moveLocalX(arg_8_0._go, arg_8_0.lpos.x + var_8_0, arg_8_2):setEase(LeanTweenType.easeInOutExpo)
	end
end

function var_0_0.UnFoldHrz(arg_9_0, arg_9_1)
	if arg_9_1 == 0 then
		local var_9_0 = arg_9_0._go.transform.localPosition

		arg_9_0._go.transform.localPosition = Vector3(arg_9_0.lpos.x, var_9_0.y, 0)
	else
		LeanTween.moveLocalX(arg_9_0._go, arg_9_0.lpos.x, arg_9_1):setEase(LeanTweenType.easeInOutExpo)
	end
end

function var_0_0.FoldVec(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = arg_10_1 > 0 and 200 or -200

	if arg_10_2 == 0 then
		local var_10_1 = arg_10_0._go.transform.localPosition

		arg_10_0._go.transform.localPosition = Vector3(var_10_1.x, arg_10_0.lpos.y + var_10_0, 0)
	else
		LeanTween.moveLocalY(arg_10_0._go, arg_10_0.lpos.y + var_10_0, arg_10_2):setEase(LeanTweenType.easeInOutExpo)
	end
end

function var_0_0.UnFoldVec(arg_11_0, arg_11_1)
	if arg_11_1 == 0 then
		local var_11_0 = arg_11_0._go.transform.localPosition

		arg_11_0._go.transform.localPosition = Vector3(var_11_0.x, arg_11_0.lpos.y, 0)
	else
		LeanTween.moveLocalY(arg_11_0._go, arg_11_0.lpos.y, arg_11_1):setEase(LeanTweenType.easeInOutExpo)
	end
end

function var_0_0.Refresh(arg_12_0)
	arg_12_0:OnFresh()
end

function var_0_0.Disable(arg_13_0)
	arg_13_0.lpos = nil
end

function var_0_0.Dispose(arg_14_0)
	arg_14_0:disposeEvent()
	pg.DelegateInfo.Dispose(arg_14_0)
	arg_14_0:OnDispose()
end

function var_0_0.OnRemoveLayer(arg_15_0, arg_15_1)
	return
end

function var_0_0.OnUpdatePlayer(arg_16_0)
	return
end

function var_0_0.OnSetUp(arg_17_0)
	return
end

function var_0_0.OnRegist(arg_18_0)
	return
end

function var_0_0.GetDirection(arg_19_0)
	return Vector2.zero
end

function var_0_0.OnFresh(arg_20_0)
	return
end

function var_0_0.OnDispose(arg_21_0)
	return
end

return var_0_0
