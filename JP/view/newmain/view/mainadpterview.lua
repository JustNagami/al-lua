local var_0_0 = class("MainAdpterView")

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0.topBg = arg_1_1
	arg_1_0.bottomBg = arg_1_2
	arg_1_0.rightBg = arg_1_3
end

function var_0_0.Init(arg_2_0)
	arg_2_0.topBgY = arg_2_0.topBg.localPosition.y
	arg_2_0.bottomBgY = arg_2_0.bottomBg.localPosition.y
	arg_2_0.rightBgX = arg_2_0.rightBg.localPosition.x
end

function var_0_0.Fold(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = arg_3_1 and arg_3_0.topBgY + 200 or arg_3_0.topBgY

	if arg_3_2 <= 0 then
		arg_3_0.topBg.localPosition = Vector3(arg_3_0.topBg.localPosition.x, var_3_0, 0)
	else
		LeanTween.moveLocalY(arg_3_0.topBg.gameObject, var_3_0, arg_3_2):setEase(LeanTweenType.easeInOutExpo)
	end

	local var_3_1 = arg_3_1 and arg_3_0.bottomBgY - 200 or arg_3_0.bottomBgY

	if arg_3_2 <= 0 then
		arg_3_0.bottomBg.localPosition = Vector3(arg_3_0.bottomBg.localPosition.x, var_3_1, 0)
	else
		LeanTween.moveLocalY(arg_3_0.bottomBg.gameObject, var_3_1, arg_3_2):setEase(LeanTweenType.easeInOutExpo)
	end

	local var_3_2 = arg_3_1 and arg_3_0.rightBgX + 1200 or arg_3_0.rightBgX

	if arg_3_2 <= 0 then
		arg_3_0.rightBg.localPosition = Vector3(var_3_2, arg_3_0.rightBg.localPosition.y, 0)
	else
		LeanTween.moveLocalX(arg_3_0.rightBg.gameObject, var_3_2, arg_3_2):setEase(LeanTweenType.easeInOutExpo)
	end
end

function var_0_0.Dispose(arg_4_0)
	return
end

return var_0_0
