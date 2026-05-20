pg = pg or {}

local var_0_0 = pg

var_0_0.ShaderMgr = singletonClass("ShaderMgr")

local var_0_1 = var_0_0.ShaderMgr

function var_0_0.ShaderMgr.Init(arg_1_0, arg_1_1)
	print("initializing shader manager...")
	Shader.DisableKeyword("LOW_DEVICE_PERFORMANCE")

	local function var_1_0(arg_2_0)
		ResourceMgr.Inst:LoadShaderAndCached("shader", arg_2_0, false, false)
	end

	local function var_1_1(arg_3_0)
		ResourceMgr.Inst:LoadShaderAndCached("l2dshader", arg_3_0, false, false)
	end

	local function var_1_2(arg_4_0)
		ResourceMgr.Inst:LoadShaderAndCached("spineshader", arg_4_0, false, false)
	end

	local function var_1_3(arg_5_0)
		arg_5_0()
	end

	local function var_1_4(arg_6_0)
		ResourceMgr.Inst:LoadShaderAndCached("custom_builtin", arg_6_0, false, false)
	end

	local var_1_5 = {
		var_1_0,
		var_1_1,
		var_1_2,
		var_1_3
	}

	var_1_4(function()
		parallelAsync(var_1_5, function()
			originalPrint("所有shader加载完成")
			arg_1_1()
		end)
	end)
end

function var_0_1.GetShader(arg_9_0, arg_9_1)
	return (ResourceMgr.Inst:GetShader(arg_9_1))
end

function var_0_1.GetBlurMaterialSync(arg_10_0)
	if arg_10_0.blurMaterial ~= nil then
		return arg_10_0.blurMaterial
	else
		local var_10_0 = arg_10_0:GetShader("Hidden/MobileBlur")

		arg_10_0.blurMaterial = Material.New(var_10_0)

		arg_10_0.blurMaterial:SetVector("_Parameter", Vector4.New(1, -1, 0, 0))

		return arg_10_0.blurMaterial
	end
end

function var_0_1.BlurTexture(arg_11_0, arg_11_1)
	local var_11_0 = ReflectionHelp.RefCallStaticMethod(typeof("UnityEngine.RenderTexture"), "GetTemporary", {
		typeof("System.Int32"),
		typeof("System.Int32"),
		typeof("System.Int32")
	}, {
		Screen.width * 0.25,
		Screen.height * 0.25,
		0
	})
	local var_11_1 = ReflectionHelp.RefCallStaticMethod(typeof("UnityEngine.RenderTexture"), "GetTemporary", {
		typeof("System.Int32"),
		typeof("System.Int32"),
		typeof("System.Int32")
	}, {
		Screen.width * 0.25,
		Screen.height * 0.25,
		0
	})

	var_11_0.filterMode = ReflectionHelp.RefGetField(typeof("UnityEngine.FilterMode"), "Bilinear")

	local var_11_2 = arg_11_0:GetBlurMaterialSync()

	ReflectionHelp.RefCallStaticMethod(typeof("UnityEngine.Graphics"), "Blit", {
		typeof("UnityEngine.RenderTexture"),
		typeof("UnityEngine.RenderTexture"),
		typeof("UnityEngine.Material"),
		typeof("System.Int32")
	}, {
		arg_11_1,
		var_11_0,
		var_11_2,
		0
	})

	for iter_11_0 = 0, 1 do
		var_11_2:SetVector("_Parameter", Vector4.New(1 + iter_11_0, -1 - iter_11_0, 0, 0))
		ReflectionHelp.RefCallStaticMethod(typeof("UnityEngine.Graphics"), "Blit", {
			typeof("UnityEngine.RenderTexture"),
			typeof("UnityEngine.RenderTexture"),
			typeof("UnityEngine.Material"),
			typeof("System.Int32")
		}, {
			var_11_0,
			var_11_1,
			var_11_2,
			1
		})
		ReflectionHelp.RefCallStaticMethod(typeof("UnityEngine.Graphics"), "Blit", {
			typeof("UnityEngine.RenderTexture"),
			typeof("UnityEngine.RenderTexture"),
			typeof("UnityEngine.Material"),
			typeof("System.Int32")
		}, {
			var_11_1,
			var_11_0,
			var_11_2,
			2
		})
	end

	ReflectionHelp.RefCallStaticMethod(typeof("UnityEngine.RenderTexture"), "ReleaseTemporary", {
		typeof("UnityEngine.RenderTexture")
	}, {
		var_11_1
	})

	return var_11_0
end

function var_0_1.SetSpineUIOutline(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = arg_12_0:GetShader("M02/Unlit Colored_Alpha_UI_Outline")
	local var_12_1 = GetComponent(arg_12_1, "SkeletonGraphic")
	local var_12_2 = Material.New(var_12_0)

	var_12_2:SetColor("_OutlineColor", arg_12_2)
	var_12_2:SetFloat("_OutlineWidth", 5.75)
	var_12_2:SetFloat("_ThresholdEnd", 0.2)

	var_12_1.material = var_12_2
end

function var_0_1.DelSpineUIOutline(arg_13_0, arg_13_1)
	GetComponent(arg_13_1, "SkeletonGraphic").material = nil
end
