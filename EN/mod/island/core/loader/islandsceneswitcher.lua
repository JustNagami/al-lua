local var_0_0 = class("IslandSceneSwitcher", import(".IslandSceneLoader"))

function var_0_0.LoadProgressUI(arg_1_0, arg_1_1)
	seriesAsync({
		function(arg_2_0)
			var_0_0.super.LoadProgressUI(arg_1_0, arg_2_0)
		end,
		function(arg_3_0)
			arg_1_0:PlayFadeIn(arg_3_0)
		end
	}, arg_1_1)
end

function var_0_0.PlayFadeIn(arg_4_0, arg_4_1)
	setActive(arg_4_0.bg, false)
	setActive(arg_4_0.curtain, true)

	local var_4_0 = GetOrAddComponent(arg_4_0.curtain, typeof(CanvasGroup))

	var_4_0.alpha = 0

	LeanTween.value(go(arg_4_0.curtain), 0, 1, 0.5):setOnUpdate(System.Action_float(function(arg_5_0)
		var_4_0.alpha = arg_5_0
	end)):setOnComplete(System.Action(arg_4_1))
end

function var_0_0.PlayFadeOut(arg_6_0, arg_6_1)
	local var_6_0 = GetOrAddComponent(arg_6_0.curtain, typeof(CanvasGroup))

	var_6_0.alpha = 1

	LeanTween.value(go(arg_6_0.curtain), 1, 0, 0.5):setOnUpdate(System.Action_float(function(arg_7_0)
		var_6_0.alpha = arg_7_0
	end)):setOnComplete(System.Action(arg_6_1))
end

function var_0_0.LoadScene(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0:LoadSceneWithProgress(arg_8_1, function(arg_9_0)
		if arg_9_0 == 1 then
			arg_8_0:PlayFadeOut(arg_8_2)
		end
	end)
end

function var_0_0.UnloadProgressUI(arg_10_0)
	if not arg_10_0.canUnloadProgressUI then
		return
	end

	var_0_0.super.UnloadProgressUI(arg_10_0)
end

function var_0_0.UnLoad(arg_11_0, arg_11_1)
	if arg_11_1 then
		var_0_0.super.UnLoad(arg_11_0)
		arg_11_0:Clear()

		return
	end

	seriesAsync({
		function(arg_12_0)
			arg_11_0:PlayFadeIn(arg_12_0)
		end,
		function(arg_13_0)
			var_0_0.super.UnLoad(arg_11_0)
			arg_13_0()
		end,
		function(arg_14_0)
			arg_11_0:PlayFadeOut(arg_14_0)
		end
	}, function()
		arg_11_0:Clear()
	end)
end

function var_0_0.Clear(arg_16_0)
	arg_16_0.canUnloadProgressUI = true

	if LeanTween.isTweening(go(arg_16_0.curtain)) then
		LeanTween.cancel(go(arg_16_0.curtain))
	end

	arg_16_0:UnloadProgressUI()
end

return var_0_0
