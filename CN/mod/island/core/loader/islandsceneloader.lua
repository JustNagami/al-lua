local var_0_0 = class("IslandSceneLoader")

function var_0_0.Load(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0.sceneIndex = arg_1_3 or 1

	pg.UIMgr.GetInstance():LoadingOn(false)
	seriesAsync({
		function(arg_2_0)
			arg_1_0:LoadProgressUI(arg_2_0)
		end,
		function(arg_3_0)
			arg_1_0:LoadScene(arg_1_1, arg_3_0)
		end,
		arg_1_2,
		function(arg_4_0)
			arg_1_0:UnloadProgressUI()
			arg_4_0()
		end
	}, function()
		pg.UIMgr.GetInstance():LoadingOff()
	end)
end

function var_0_0.LoadProgressUI(arg_6_0, arg_6_1)
	ResourceMgr.Inst:getAssetAsync("ui/IslandSceneLoader", "", typeof(GameObject), UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_7_0)
		arg_6_0.progressUI = Object.Instantiate(arg_7_0, pg.UIMgr.GetInstance().UIMain)
		arg_6_0.bg = arg_6_0.progressUI.transform:Find("bg")
		arg_6_0.curtain = arg_6_0.progressUI.transform:Find("curtain")

		setActive(arg_6_0.progressUI, true)
		arg_6_1()
	end), true, true)
end

function var_0_0.UnloadProgressUI(arg_8_0)
	if arg_8_0.progressUI then
		Object.Destroy(arg_8_0.progressUI)

		arg_8_0.progressUI = nil
	end
end

function var_0_0.LoadSceneWithProgress(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = string.lower(arg_9_1)
	local var_9_1 = string.match(var_9_0, "[^/]+$")
	local var_9_2 = var_9_0 .. "_scene"

	arg_9_0.scenePath = var_9_2
	arg_9_0.sceneName = var_9_1

	SceneOpMgr.Inst:LoadSceneAsyncWithProgress(var_9_2, var_9_1, LoadSceneMode.Additive, function(arg_10_0)
		arg_9_2(arg_10_0)

		if arg_10_0 == 1 then
			SceneOpMgr.Inst:SetActiveSceneByIndex(arg_9_0.sceneIndex)
		end
	end)
end

function var_0_0.LoadScene(arg_11_0, arg_11_1, arg_11_2)
	setActive(arg_11_0.bg, true)
	setActive(arg_11_0.curtain, false)

	local var_11_0 = arg_11_0.bg:Find("slider/bar"):GetComponent(typeof(Image))

	var_11_0.fillAmount = 0

	arg_11_0:LoadSceneWithProgress(arg_11_1, function(arg_12_0)
		LeanTween.cancel(var_11_0.gameObject)

		local var_12_0 = LeanTween.value(var_11_0.gameObject, var_11_0.fillAmount, arg_12_0, 0.5):setOnUpdate(System.Action_float(function(arg_13_0)
			var_11_0.fillAmount = arg_13_0
		end))

		if arg_12_0 == 1 then
			var_12_0:setOnComplete(System.Action(arg_11_2))
		end
	end)
end

function var_0_0.UnLoad(arg_14_0, arg_14_1)
	arg_14_0:UnloadProgressUI()

	local var_14_0 = arg_14_0.scenePath
	local var_14_1 = arg_14_0.sceneName

	if not var_14_0 or not var_14_1 then
		return
	end

	pg.UIMgr.GetInstance():LoadingOn()
	SceneOpMgr.Inst:UnloadSceneAsync(var_14_0, var_14_1, function()
		pg.UIMgr.GetInstance():LoadingOff()
	end)

	arg_14_0.scenePath = nil
	arg_14_0.sceneName = nil
end

function var_0_0.Dispose(arg_16_0, arg_16_1)
	arg_16_0:UnLoad(arg_16_1)
end

return var_0_0
