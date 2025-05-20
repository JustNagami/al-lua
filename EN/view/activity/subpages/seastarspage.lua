local var_0_0 = class("SeaStarsPage", import(".TemplatePage.NewFrameTemplatePage"))

function var_0_0.OnFirstFlush(arg_1_0)
	SetActive(arg_1_0.switchBtn, false)

	for iter_1_0, iter_1_1 in ipairs(arg_1_0.phases) do
		setActive(iter_1_1, true)

		GetOrAddComponent(iter_1_1, typeof(CanvasGroup)).alpha = 0
	end

	var_0_0.super.OnFirstFlush(arg_1_0)
end

function var_0_0.Switch(arg_2_0, arg_2_1)
	local var_2_0
	local var_2_1
	local var_2_2, var_2_3 = arg_2_0.phases[1], arg_2_0.phases[2]
	local var_2_4 = var_2_2.localPosition
	local var_2_5 = var_2_3.localPosition

	var_2_3:SetAsLastSibling()

	local var_2_6 = {}

	table.insert(var_2_6, function(arg_3_0)
		LeanTween.moveLocal(go(var_2_2), var_2_5, 0.4)
		LeanTween.alphaCanvas(GetOrAddComponent(var_2_2, typeof(CanvasGroup)), 0, 0.4)
		LeanTween.moveLocal(go(var_2_3), var_2_4, 0.4)
		LeanTween.alphaCanvas(GetOrAddComponent(var_2_3, typeof(CanvasGroup)), 1, 0.4):setOnComplete(System.Action(arg_3_0))
	end)
	seriesAsync(var_2_6, function()
		setToggleEnabled(arg_2_0.switchBtn, true)
	end)
end

return var_0_0
