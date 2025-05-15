local var_0_0 = class("BlinkStoryPlayer", import(".StoryPlayer"))

function var_0_0.UpdateBg(arg_1_0, arg_1_1)
	var_0_0.super.UpdateBg(arg_1_0, arg_1_1)

	arg_1_0.blurOptimized = pg.UIMgr.GetInstance().cameraBlurs[pg.UIMgr.CameraOverlay][1]
	arg_1_0.blurFlag = false

	local var_1_0 = arg_1_0.blurOptimized.downsample
	local var_1_1 = arg_1_0.blurOptimized.blurSize
	local var_1_2 = arg_1_0.blurOptimized.blurIteration

	arg_1_0.defaultBlueValues = {
		downsample = var_1_0,
		blurSize = var_1_1,
		blurIteration = var_1_2
	}
end

function var_0_0.LoadEffects(arg_2_0, arg_2_1, arg_2_2)
	parallelAsync({
		function(arg_3_0)
			arg_2_0:PlayOpenEyeEffect(arg_2_1, arg_3_0)
		end,
		function(arg_4_0)
			var_0_0.super.LoadEffects(arg_2_0, arg_2_1, arg_4_0)
		end
	}, arg_2_2)
end

function var_0_0.PlayOpenEyeEffect(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = arg_5_1:GetOpenEyeData()

	seriesAsync({
		function(arg_6_0)
			arg_5_0:LoadOpenEyeEffect(function(arg_7_0)
				arg_5_0.targetGo = arg_7_0

				arg_6_0()
			end)
		end,
		function(arg_8_0)
			arg_5_0:ApplyOpenEyeEffect(arg_5_1, var_5_0, arg_5_0.targetGo, arg_8_0)
		end,
		function(arg_9_0)
			arg_5_0:ClearTarget()
			arg_9_0()
		end
	}, arg_5_2)
end

function var_0_0.ClearTarget(arg_10_0)
	if arg_10_0.targetGo then
		arg_10_0.targetGo:GetComponent(typeof(Image)).material:SetFloat("_EyeClose", 1)
		Object.Destroy(arg_10_0.targetGo)

		arg_10_0.targetGo = nil
	end
end

function var_0_0.LoadOpenEyeEffect(arg_11_0, arg_11_1)
	LoadAndInstantiateAsync("effect", "openEye", function(arg_12_0)
		setParent(arg_12_0, arg_11_0.topEffectTr)

		arg_12_0.transform.localScale = Vector3.one

		setActive(arg_12_0, true)
		arg_11_1(arg_12_0)
	end)
end

local function var_0_1(arg_13_0, arg_13_1, arg_13_2, arg_13_3, arg_13_4)
	arg_13_0:TweenValueWithEase(arg_13_0._go, arg_13_2.x, arg_13_2.y, arg_13_2.z, 0, arg_13_3, function(arg_14_0)
		arg_13_1:SetFloat("_EyeClose", arg_14_0)
	end, arg_13_4)
end

function var_0_0.ApplyOpenEyeEffect(arg_15_0, arg_15_1, arg_15_2, arg_15_3, arg_15_4)
	setActive(arg_15_0.bgPanel, true)

	local var_15_0 = arg_15_2.open
	local var_15_1 = arg_15_2.close
	local var_15_2 = arg_15_2.hold
	local var_15_3 = arg_15_2.ease
	local var_15_4 = arg_15_3:GetComponent(typeof(Image)).material

	seriesAsync({
		function(arg_16_0)
			parallelAsync({
				function(arg_17_0)
					var_0_1(arg_15_0, var_15_4, var_15_1, var_15_3, arg_17_0)
				end,
				function(arg_18_0)
					arg_15_0:ClearToBlur(arg_15_1, arg_18_0)
				end
			}, arg_16_0)
		end,
		function(arg_19_0)
			parallelAsync({
				function(arg_20_0)
					arg_15_0:UpdateNextBg(arg_15_1, arg_20_0)
				end,
				function(arg_21_0)
					var_0_1(arg_15_0, var_15_4, var_15_2, var_15_3, arg_21_0)
				end
			}, arg_19_0)
		end,
		function(arg_22_0)
			parallelAsync({
				function(arg_23_0)
					var_0_1(arg_15_0, var_15_4, var_15_0, var_15_3, arg_23_0)
				end,
				function(arg_24_0)
					arg_15_0:BlurToClear(arg_15_1, arg_24_0)
				end
			}, arg_22_0)
		end
	}, arg_15_4)
end

function var_0_0.ClearToBlur(arg_25_0, arg_25_1, arg_25_2)
	arg_25_0.blurFlag = true
	arg_25_0.blurOptimized.downsample = 0
	arg_25_0.blurOptimized.blurSize = 0
	arg_25_0.blurOptimized.blurIteration = 0
	arg_25_0.blurOptimized.enabled = true

	local var_25_0 = arg_25_1.closeTime
	local var_25_1 = arg_25_1.ease
	local var_25_2 = arg_25_1.blurTimeFactor[1]

	arg_25_0:TweenValueWithEase(arg_25_0._go, 0, 3, var_25_0 * var_25_2, 0, var_25_1, function(arg_26_0)
		arg_25_0.blurOptimized.blurSize = arg_26_0
		arg_25_0.blurOptimized.blurIteration = arg_26_0
	end, arg_25_2)
end

function var_0_0.BlurToClear(arg_27_0, arg_27_1, arg_27_2)
	local var_27_0 = arg_27_1.openTime
	local var_27_1 = arg_27_1.ease
	local var_27_2 = arg_27_1.blurTimeFactor[2]

	arg_27_0:TweenValueWithEase(arg_27_0._go, 3, 0, var_27_0 * var_27_2, 0, var_27_1, function(arg_28_0)
		arg_27_0.blurOptimized.blurSize = arg_28_0
		arg_27_0.blurOptimized.blurIteration = arg_28_0
	end, function()
		arg_27_0:ClearBlur()
		arg_27_2()
	end)
end

function var_0_0.ClearBlur(arg_30_0)
	if arg_30_0.blurFlag then
		arg_30_0.blurOptimized.enabled = false
		arg_30_0.blurOptimized.downsample = arg_30_0.defaultBlueValues.downsample
		arg_30_0.blurOptimized.blurSize = arg_30_0.defaultBlueValues.blurSize
		arg_30_0.blurOptimized.blurIteration = arg_30_0.defaultBlueValues.blurIteration
		arg_30_0.blurFlag = false
	end
end

function var_0_0.UpdateNextBg(arg_31_0, arg_31_1, arg_31_2)
	local var_31_0 = arg_31_1:GetNextBgName()

	if not var_31_0 then
		arg_31_2()

		return
	end

	setActive(arg_31_0.bgPanel, true)

	arg_31_0.bgPanelCg.alpha = 1

	local var_31_1 = arg_31_0.bgImage

	var_31_1.color = Color.New(1, 1, 1)
	var_31_1.sprite = arg_31_0:GetBg(var_31_0)

	arg_31_2()
end

function var_0_0.RegisetEvent(arg_32_0, arg_32_1, arg_32_2)
	arg_32_2()
end

function var_0_0.OnClear(arg_33_0)
	arg_33_0:ClearTarget()
	arg_33_0:ClearBlur()
end

function var_0_0.OnEnd(arg_34_0)
	arg_34_0:ClearTarget()
	arg_34_0:ClearBlur()
end

return var_0_0
