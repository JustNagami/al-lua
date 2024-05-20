local var_0_0 = class("MainActInsBtn", import(".MainBaseSpcailActBtn"))

function var_0_0.InShowTime(arg_1_0)
	local var_1_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_INSTAGRAM)

	return var_1_0 and not var_1_0:isEnd()
end

function var_0_0.GetUIName(arg_2_0)
	return "MainUIInsBtn"
end

function var_0_0.OnClick(arg_3_0)
	arg_3_0.event:emit(NewMainMediator.SKIP_INS)
end

function var_0_0.OnInit(arg_4_0)
	arg_4_0.animator = arg_4_0._tf:Find("icon"):GetComponent(typeof(Animator))

	local var_4_0 = getProxy(InstagramProxy):ShouldShowTip()

	arg_4_0.animator.enabled = var_4_0

	setActive(arg_4_0._tf:Find("Tip"), var_4_0)

	arg_4_0._tf.localScale = arg_4_0.isScale and Vector3(0.85, 0.85, 1) or Vector3(1, 1, 1)

	setAnchoredPosition(arg_4_0._tf, {
		y = arg_4_0.isScale and -950 or -752.5
	})
end

return var_0_0
