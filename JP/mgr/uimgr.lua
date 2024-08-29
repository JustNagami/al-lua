pg = pg or {}

local var_0_0 = singletonClass("UIMgr")

pg.UIMgr = var_0_0

local var_0_1 = pg

var_0_0._loadPanel = nil
var_0_0.CameraUI = 1
var_0_0.CameraLevel = 2
var_0_0.CameraOverlay = 3
var_0_0.OptimizedBlur = 1
var_0_0.StaticBlur = 2
var_0_0.PartialBlur = 3

function var_0_0.Init(arg_1_0, arg_1_1)
	print("initializing ui manager...")

	arg_1_0.mainCamera = GameObject.Find("MainCamera")
	arg_1_0.mainCameraComp = arg_1_0.mainCamera:GetComponent("Camera")
	arg_1_0.uiCamera = tf(GameObject.Find("UICamera"))
	arg_1_0.uiCameraComp = arg_1_0.uiCamera:GetComponent("Camera")
	arg_1_0.uiCameraComp.allowMSAA = false
	arg_1_0.levelCamera = tf(GameObject.Find("LevelCamera"))
	arg_1_0.levelCameraComp = arg_1_0.levelCamera:GetComponent("Camera")
	arg_1_0.levelCameraComp.allowMSAA = false
	arg_1_0.overlayCamera = tf(GameObject.Find("OverlayCamera"))
	arg_1_0.overlayCameraComp = arg_1_0.overlayCamera:GetComponent("Camera")
	arg_1_0.overlayCameraComp.allowMSAA = false
	arg_1_0.UIMain = arg_1_0.uiCamera:Find("Canvas/UIMain")
	arg_1_0.LevelMain = arg_1_0.levelCamera:Find("Canvas/UIMain")
	arg_1_0.OverlayMain = arg_1_0.overlayCamera:Find("Overlay/UIMain")
	arg_1_0.OverlayToast = arg_1_0.overlayCamera:Find("Overlay/UIOverlay")
	arg_1_0.OverlayEffect = arg_1_0.overlayCamera:Find("Overlay/UIEffect")
	arg_1_0._normalUIMain = nil
	arg_1_0._cameraBlurPartial = arg_1_0.uiCamera:GetComponent("UIPartialBlur")
	arg_1_0._levelCameraPartial = arg_1_0.levelCamera:GetComponent("UIPartialBlur")

	ReflectionHelp.RefCallMethod(typeof("UIPartialBlur"), "Cleanup", arg_1_0._levelCameraPartial)

	arg_1_0._levelCameraPartial.blurCam = arg_1_0.levelCameraComp
	arg_1_0.cameraBlurs = {
		[var_0_0.CameraUI] = {
			arg_1_0.uiCamera:GetComponent("BlurOptimized"),
			arg_1_0.uiCamera:GetComponent("UIStaticBlur"),
			arg_1_0._cameraBlurPartial
		},
		[var_0_0.CameraLevel] = {
			arg_1_0.levelCamera:GetComponent("BlurOptimized"),
			arg_1_0.levelCamera:GetComponent("UIStaticBlur"),
			arg_1_0._levelCameraPartial
		},
		[var_0_0.CameraOverlay] = {
			arg_1_0.overlayCamera:GetComponent("BlurOptimized"),
			(arg_1_0.overlayCamera:GetComponent("UIStaticBlur"))
		}
	}
	arg_1_0.camLockStatus = {
		[var_0_0.CameraUI] = false,
		[var_0_0.CameraLevel] = false,
		[var_0_0.CameraOverlay] = false
	}

	local function var_1_0(arg_2_0)
		if arg_2_0 == nil then
			return
		end

		arg_2_0.downsample = 2
		arg_2_0.blurSize = 4
		arg_2_0.blurIterations = 2
	end

	local function var_1_1(arg_3_0)
		if arg_3_0 == nil then
			return
		end

		arg_3_0.downsample = 2
		arg_3_0.blurSize = 1.5
		arg_3_0.blurIteration = 4
	end

	local function var_1_2(arg_4_0)
		if arg_4_0 == nil then
			return
		end

		arg_4_0.downsample = 2
		arg_4_0.blurSize = 4
		arg_4_0.blurIterations = 1
	end

	local function var_1_3(arg_5_0)
		if arg_5_0 == nil then
			return
		end

		arg_5_0.downsample = 2
		arg_5_0.blurSize = 1.5
		arg_5_0.blurIteration = 1
	end

	local var_1_4 = DevicePerformanceUtil.GetDeviceLevel()

	for iter_1_0, iter_1_1 in ipairs(arg_1_0.cameraBlurs) do
		if var_1_4 == DevicePerformanceLevel.Low then
			var_1_2(iter_1_1[var_0_0.OptimizedBlur])
			var_1_3(iter_1_1[var_0_0.PartialBlur])
		else
			var_1_0(iter_1_1[var_0_0.OptimizedBlur])
			var_1_1(iter_1_1[var_0_0.PartialBlur])
		end
	end

	arg_1_0.defaultMaterial = Material.New(Shader.Find("UI/Default"))
	arg_1_0.partialBlurMaterial = Material.New(Shader.Find("UI/PartialBlur"))
	arg_1_0._debugPanel = DebugPanel.New()

	setActive(arg_1_0.uiCamera, false)
	seriesAsync({
		function(arg_6_0)
			setActive(arg_1_0.uiCamera, true)

			arg_1_0._loadPanel = LoadingPanel.New(arg_6_0)
		end,
		function(arg_7_0)
			PoolMgr.GetInstance():GetUI("ClickEffect", true, function(arg_8_0)
				setParent(arg_8_0, arg_1_0.OverlayEffect)

				local var_8_0 = PlayerPrefs.GetInt(SHOW_TOUCH_EFFECT, 1) > 0

				SetActive(arg_1_0.OverlayEffect, var_8_0)
				arg_7_0()
			end)
		end
	}, arg_1_1)
end

function var_0_0.Loading(arg_9_0, arg_9_1)
	arg_9_0._loadPanel:appendInfo(arg_9_1)
end

function var_0_0.LoadingOn(arg_10_0, arg_10_1)
	arg_10_0._loadPanel:on(arg_10_1)
end

function var_0_0.displayLoadingBG(arg_11_0, arg_11_1)
	arg_11_0._loadPanel:displayBG(arg_11_1)
end

function var_0_0.LoadingOff(arg_12_0)
	arg_12_0._loadPanel:off()
end

function var_0_0.OnLoading(arg_13_0)
	return arg_13_0._loadPanel:onLoading()
end

function var_0_0.LoadingRetainCount(arg_14_0)
	return arg_14_0._loadPanel:getRetainCount()
end

function var_0_0.AddDebugButton(arg_15_0, arg_15_1, arg_15_2)
	arg_15_0._debugPanel:addCustomBtn(arg_15_1, arg_15_2)
end

function var_0_0.AddWorldTestButton(arg_16_0, arg_16_1, arg_16_2)
	arg_16_0._debugPanel:addCustomBtn(arg_16_1, function()
		arg_16_0._debugPanel:hidePanel()
		arg_16_2()
	end)
end

var_0_0._maxbianjie = 50
var_0_0._maxbianjieInv = 0.02
var_0_0._maxbianjieSqr = 2500
var_0_0._followRange = 0
var_0_0._stick = nil
var_0_0._areaImg = nil
var_0_0._stickImg = nil
var_0_0._stickCom = nil
var_0_0._normalColor = Color(255, 255, 255, 1)
var_0_0._darkColor = Color(255, 255, 255, 0.5)
var_0_0._firstPos = Vector3.zero

function var_0_0.AttachStickOb(arg_18_0, arg_18_1)
	arg_18_0.hrz = 0
	arg_18_0.vtc = 0
	arg_18_0.fingerId = -1

	local var_18_0 = arg_18_1:Find("Area")

	arg_18_0._stick = var_18_0:Find("Stick")
	arg_18_0._areaImg = var_18_0:GetComponent(typeof(Image))
	arg_18_0._stickImg = arg_18_0._stick:GetComponent(typeof(Image))
	arg_18_0._stickCom = arg_18_1:GetComponent(typeof(StickController))
	arg_18_0._stickCom.StickBorderRate = 1

	arg_18_0._stickCom:SetStickFunc(function(arg_19_0, arg_19_1)
		arg_18_0:UpdateStick(arg_19_0, arg_19_1)
	end)

	arg_18_0._firstPos = var_18_0.localPosition
	arg_18_0.vtc = 0

	arg_18_0:SetActive(true)
end

function var_0_0.SetActive(arg_20_0, arg_20_1)
	arg_20_0._stickActive = arg_20_1
end

function var_0_0.Marching(arg_21_0)
	local var_21_0 = ys.Battle.BattleConfig

	LeanTween.value(go(arg_21_0._stick), 0, 0.625, 1.8):setOnUpdate(System.Action_float(function(arg_22_0)
		arg_21_0.hrz = var_21_0.START_SPEED_CONST_B * (arg_22_0 - var_21_0.START_SPEED_CONST_A) * (arg_22_0 - var_21_0.START_SPEED_CONST_A)
	end)):setOnComplete(System.Action(function()
		arg_21_0.hrz = 0
	end))
end

function var_0_0.UpdateStick(arg_24_0, arg_24_1, arg_24_2)
	if not arg_24_0._stickActive then
		return
	end

	if arg_24_2 == -2 then
		arg_24_0:SetOutput(arg_24_1.x, arg_24_1.y, -2)

		return
	elseif arg_24_2 == -1 then
		arg_24_0:SetOutput(0, 0, arg_24_2)

		return
	end

	local var_24_0 = arg_24_1

	var_24_0.z = 0

	local var_24_1 = var_24_0:SqrMagnitude()

	if var_24_1 > arg_24_0._maxbianjieSqr then
		var_24_0 = var_24_0 / math.sqrt(var_24_1)

		local var_24_2 = var_24_0 * arg_24_0._maxbianjie

		if arg_24_1 - var_24_2 ~= arg_24_0._firstPos then
			local var_24_3 = arg_24_0._firstPos
		end

		arg_24_0._stick.localPosition = var_24_2

		arg_24_0:SetOutput(var_24_0.x, var_24_0.y, arg_24_2)
	else
		arg_24_0._stick.localPosition = arg_24_1

		arg_24_0:SetOutput(var_24_0.x * arg_24_0._maxbianjieInv, var_24_0.y * arg_24_0._maxbianjieInv, arg_24_2)
	end
end

function var_0_0.SetOutput(arg_25_0, arg_25_1, arg_25_2, arg_25_3)
	arg_25_0.hrz = arg_25_1
	arg_25_0.vtc = arg_25_2

	local var_25_0 = (arg_25_3 >= 0 and 1 or 0) - (arg_25_0.fingerId >= 0 and 1 or 0)

	if var_25_0 ~= 0 and arg_25_0._areaImg and arg_25_0._stickImg then
		arg_25_0._areaImg.color = var_25_0 > 0 and var_0_0._normalColor or var_0_0._darkColor
		arg_25_0._stickImg.color = var_25_0 > 0 and var_0_0._normalColor or var_0_0._darkColor
	end

	if arg_25_3 < 0 then
		arg_25_0._stick.localPosition = Vector3.zero
	end

	arg_25_0.fingerId = arg_25_3
end

function var_0_0.ClearStick(arg_26_0)
	arg_26_0._stick.localPosition = Vector3.zero

	arg_26_0._stickCom:ClearStickFunc()

	arg_26_0._stick = nil
	arg_26_0._areaImg = nil
	arg_26_0._stickImg = nil
	arg_26_0._stickCom = nil
end

local var_0_2 = {}
local var_0_3 = false

function var_0_0.OverlayPanel(arg_27_0, arg_27_1, arg_27_2)
	arg_27_2 = arg_27_2 or {}
	arg_27_2.globalBlur = false

	var_0_1.LayerWeightMgr.GetInstance():Add2Overlay(LayerWeightConst.UI_TYPE_SUB, arg_27_1, arg_27_2)
end

function var_0_0.UnOverlayPanel(arg_28_0, arg_28_1, arg_28_2)
	var_0_1.LayerWeightMgr.GetInstance():DelFromOverlay(arg_28_1, arg_28_2 or arg_28_0.UIMain)
end

function var_0_0.BlurPanel(arg_29_0, arg_29_1, arg_29_2, arg_29_3)
	arg_29_3 = arg_29_3 or {}
	arg_29_3.globalBlur = true
	arg_29_3.staticBlur = arg_29_2

	var_0_1.LayerWeightMgr.GetInstance():Add2Overlay(LayerWeightConst.UI_TYPE_SUB, arg_29_1, arg_29_3)
end

function var_0_0.UnblurPanel(arg_30_0, arg_30_1, arg_30_2)
	var_0_1.LayerWeightMgr.GetInstance():DelFromOverlay(arg_30_1, arg_30_2 or arg_30_0.UIMain)
end

function var_0_0.OverlayPanelPB(arg_31_0, arg_31_1, arg_31_2)
	arg_31_2 = arg_31_2 or {}
	arg_31_2.globalBlur = false

	var_0_1.LayerWeightMgr.GetInstance():Add2Overlay(LayerWeightConst.UI_TYPE_SUB, arg_31_1, arg_31_2)
end

function var_0_0.PartialBlurTfs(arg_32_0, arg_32_1)
	var_0_3 = true
	var_0_2 = arg_32_1

	arg_32_0:UpdatePBEnable(true)
end

function var_0_0.ShutdownPartialBlur(arg_33_0)
	var_0_3 = false
	var_0_2 = {}

	arg_33_0:UpdatePBEnable(false)
end

function var_0_0.RevertPBMaterial(arg_34_0, arg_34_1)
	for iter_34_0, iter_34_1 in ipairs(arg_34_1) do
		local var_34_0 = iter_34_1:GetComponent(typeof(Image))

		assert(var_34_0, "mask should be an image.")

		var_34_0.material = arg_34_0.defaultMaterial
	end
end

function var_0_0.UpdatePBEnable(arg_35_0, arg_35_1)
	if arg_35_1 then
		if var_0_2 ~= nil then
			for iter_35_0, iter_35_1 in ipairs(var_0_2) do
				local var_35_0 = iter_35_1:GetComponent(typeof(Image))

				assert(var_35_0, "mask should be an image.")

				var_35_0.material = arg_35_1 and arg_35_0.partialBlurMaterial or nil
			end
		end

		if arg_35_0.levelCameraComp.enabled then
			arg_35_0.cameraBlurs[var_0_0.CameraLevel][var_0_0.PartialBlur].enabled = true
			arg_35_0.cameraBlurs[var_0_0.CameraUI][var_0_0.PartialBlur].enabled = false
		else
			arg_35_0.cameraBlurs[var_0_0.CameraLevel][var_0_0.PartialBlur].enabled = false
			arg_35_0.cameraBlurs[var_0_0.CameraUI][var_0_0.PartialBlur].enabled = true
		end
	else
		for iter_35_2, iter_35_3 in ipairs(arg_35_0.cameraBlurs) do
			if iter_35_3[var_0_0.PartialBlur] then
				iter_35_3[var_0_0.PartialBlur].enabled = false
			end
		end
	end
end

function var_0_0.BlurCamera(arg_36_0, arg_36_1, arg_36_2, arg_36_3)
	if not arg_36_0.camLockStatus[arg_36_1] or arg_36_3 then
		local var_36_0 = arg_36_0.cameraBlurs[arg_36_1][var_0_0.OptimizedBlur]
		local var_36_1 = arg_36_0.cameraBlurs[arg_36_1][var_0_0.StaticBlur]

		if arg_36_2 then
			var_36_0.enabled = true
			var_36_0.staticBlur = true
			var_36_1.enabled = false
		else
			var_36_0.enabled = true
			var_36_0.staticBlur = false
			var_36_1.enabled = false
		end

		if arg_36_3 then
			arg_36_0.camLockStatus[arg_36_1] = true
		end
	end
end

function var_0_0.UnblurCamera(arg_37_0, arg_37_1, arg_37_2)
	if not arg_37_0.camLockStatus[arg_37_1] or arg_37_2 then
		local var_37_0 = arg_37_0.cameraBlurs[arg_37_1][var_0_0.OptimizedBlur]

		arg_37_0.cameraBlurs[arg_37_1][var_0_0.StaticBlur].enabled = false
		var_37_0.enabled = false

		if arg_37_2 then
			arg_37_0.camLockStatus[arg_37_1] = false
		end
	end
end

function var_0_0.GetStaticRtt(arg_38_0, arg_38_1)
	local var_38_0 = arg_38_0.cameraBlurs[arg_38_1][var_0_0.OptimizedBlur]

	return (ReflectionHelp.RefGetField(typeof("UnityStandardAssets.ImageEffects.BlurOptimized"), "staticRtt", var_38_0))
end

function var_0_0.SetMainCamBlurTexture(arg_39_0, arg_39_1)
	local var_39_0 = arg_39_0.mainCamera:GetComponent(typeof(Camera))
	local var_39_1 = ReflectionHelp.RefCallStaticMethod(typeof("UnityEngine.RenderTexture"), "GetTemporary", {
		typeof("System.Int32"),
		typeof("System.Int32"),
		typeof("System.Int32")
	}, {
		Screen.width,
		Screen.height,
		0
	})

	var_39_0.targetTexture = var_39_1

	var_39_0:Render()

	local var_39_2 = var_0_1.ShaderMgr.GetInstance():BlurTexture(var_39_1)

	var_39_0.targetTexture = nil

	ReflectionHelp.RefCallStaticMethod(typeof("UnityEngine.RenderTexture"), "ReleaseTemporary", {
		typeof("UnityEngine.RenderTexture")
	}, {
		var_39_1
	})

	arg_39_1.uvRect = var_39_0.rect
	arg_39_1.texture = var_39_2

	return var_39_2
end

function var_0_0.GetMainCamera(arg_40_0)
	return arg_40_0.mainCamera
end
