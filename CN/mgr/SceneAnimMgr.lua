pg = pg or {}
pg.SceneAnimMgr = singletonClass("SceneAnimMgr")

local var_0_0 = pg.SceneAnimMgr

function var_0_0.Ctor(arg_1_0)
	arg_1_0.dormCallbackList = {}
end

function var_0_0.Init(arg_2_0, arg_2_1)
	print("initializing sceneanim manager...")
	LoadAndInstantiateAsync("ui", "SceneAnimUI", function(arg_3_0)
		arg_2_0._go = arg_3_0

		arg_2_0._go:SetActive(false)

		arg_2_0._tf = arg_2_0._go.transform

		arg_2_0._tf:SetParent(pg.UIMgr.GetInstance().OverlayToast, false)

		arg_2_0.container = arg_2_0._tf:Find("container")

		if arg_2_1 then
			arg_2_1()
		end
	end, true, true)
end

function var_0_0.SixthAnniversaryJPCoverGoScene(arg_4_0, arg_4_1)
	arg_4_0.playing = true

	setActive(arg_4_0._tf, true)

	local var_4_0 = "SixthAnniversaryJPCoverUI"

	PoolMgr.GetInstance():GetUI(var_4_0, true, function(arg_5_0)
		local var_5_0 = arg_5_0.transform

		setParent(var_5_0, arg_4_0.container, false)
		setActive(var_5_0, true)

		local var_5_1 = var_5_0:Find("houshanyunwu"):GetComponent(typeof(SpineAnimUI))

		var_5_1:SetActionCallBack(function(arg_6_0)
			if arg_6_0 == "finish" then
				PoolMgr.GetInstance():ReturnUI(var_4_0, arg_5_0)

				arg_4_0.playing = nil

				setActive(var_5_0, false)
				setActive(arg_4_0._tf, false)
			elseif arg_6_0 == "action" then
				pg.m02:sendNotification(GAME.GO_SCENE, arg_4_1)
			end
		end)
		var_5_1:SetAction("action", 0)
	end)
end

function var_0_0.OtherWorldCoverGoScene(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0.playing = true

	setActive(arg_7_0._tf, true)

	local var_7_0 = "OtherworldCoverUI"

	PoolMgr.GetInstance():GetUI(var_7_0, true, function(arg_8_0)
		local var_8_0 = arg_8_0.transform

		setParent(var_8_0, arg_7_0.container, false)
		setActive(var_8_0, true)

		local var_8_1 = var_8_0:Find("yuncaizhuanchang"):GetComponent(typeof(SpineAnimUI))

		var_8_1:SetActionCallBack(function(arg_9_0)
			if arg_9_0 == "finish" then
				PoolMgr.GetInstance():ReturnUI(var_7_0, arg_8_0)

				arg_7_0.playing = nil

				setActive(var_8_0, false)
				setActive(arg_7_0._tf, false)
			elseif arg_9_0 == "action" then
				pg.m02:sendNotification(GAME.GO_SCENE, arg_7_1, arg_7_2)
			end
		end)
		var_8_1:SetAction("action", 0)
	end)
end

function var_0_0.RegisterDormNextCall(arg_10_0, arg_10_1)
	function arg_10_0.dormNextCall()
		arg_10_0.dormNextCall = nil

		return arg_10_1()
	end
end

function var_0_0.Dorm3DSceneChange(arg_12_0, arg_12_1)
	table.insert(arg_12_0.dormCallbackList, arg_12_1)

	if not arg_12_0.playing then
		pg.UIMgr.GetInstance():LoadingOn(false)
		arg_12_0:DoDorm3DSceneChange()
	end

	existCall(arg_12_0.dormNextCall)
end

function var_0_0.DoDorm3DSceneChange(arg_13_0, arg_13_1)
	arg_13_0.playing = true

	setActive(arg_13_0._tf, true)

	local var_13_0 = "Dorm3DLoading"
	local var_13_1 = {}

	if not arg_13_1 then
		table.insert(var_13_1, function(arg_14_0)
			PoolMgr.GetInstance():GetUI(var_13_0, true, function(arg_15_0)
				arg_13_1 = arg_15_0.transform

				setParent(arg_13_1, arg_13_0.container, false)
				arg_14_0()
			end)
		end)
	end

	seriesAsync(var_13_1, function()
		local var_16_0 = arg_13_1:Find("bg"):GetComponent(typeof(Image)).material
		local var_16_1 = arg_13_1:GetComponent("DftAniEvent")

		var_16_1:SetTriggerEvent(function(arg_17_0)
			local var_17_0

			local function var_17_1()
				if #arg_13_0.dormCallbackList > 0 then
					table.remove(arg_13_0.dormCallbackList, 1)(var_17_1)
				else
					GetComponent(arg_13_1, typeof(Animator)):SetBool("Finish", true)
					var_16_0:SetInt("_DissolveTexFlip", 0)
					LeanTween.value(0, 1, 0.6):setOnUpdate(System.Action_float(function(arg_19_0)
						var_16_0:SetFloat("_Dissolve", arg_19_0)
					end)):setEase(LeanTweenType.easeInOutCubic)
				end
			end

			var_17_1()
			pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_loading_loop")
		end)
		var_16_1:SetEndEvent(function(arg_20_0)
			if #arg_13_0.dormCallbackList > 0 then
				quickPlayAnimator(arg_13_1, "anim_dorm3d_loading_in")
				arg_13_0:DoDorm3DSceneChange(arg_13_1)
			else
				PoolMgr.GetInstance():ReturnUI(var_13_0, arg_13_1.gameObject)

				arg_13_0.playing = nil

				setActive(arg_13_0._tf, false)
				pg.UIMgr.GetInstance():LoadingOff()
			end
		end)
		GetComponent(arg_13_1, typeof(Animator)):SetBool("Finish", false)
		var_16_0:SetInt("_DissolveTexFlip", 1)
		LeanTween.value(1, 0, 0.6):setOnUpdate(System.Action_float(function(arg_21_0)
			var_16_0:SetFloat("_Dissolve", arg_21_0)
		end)):setEase(LeanTweenType.easeOutCubic)
	end)
end

function var_0_0.IsPlaying(arg_22_0)
	return arg_22_0.playing
end

function var_0_0.Dispose(arg_23_0)
	setActive(arg_23_0._tf, false)

	arg_23_0.playing = nil
end
