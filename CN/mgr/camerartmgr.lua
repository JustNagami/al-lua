pg = pg or {}
pg.CameraRTMgr = singletonClass("CameraRTMgr")

local var_0_0 = pg.CameraRTMgr

var_0_0.CONFIG = {
	posX = -500,
	height = 500,
	autoResize = false,
	camera = "TestCamera",
	posY = 200,
	rotY = 0,
	rotX = 0,
	rotZ = 0,
	id = 1,
	width = 500
}

function var_0_0.Init(arg_1_0, arg_1_1)
	print("initializing camera rt manager...")

	arg_1_0.mainTransform = pg.UIMgr.GetInstance().UIMain.transform
	arg_1_0.uiList = {}

	arg_1_1()
end

function var_0_0.Bind(arg_2_0, arg_2_1, arg_2_2)
	assert(arg_2_1 and arg_2_2)

	arg_2_1.RenderCamera = arg_2_2

	setActive(arg_2_2, true)
end

function var_0_0.Clean(arg_3_0, arg_3_1)
	assert(arg_3_1)
	arg_3_1:CleanRenderTexture()
	setActive(arg_3_1.RenderCamera, false)

	arg_3_1.RenderCamera = nil
end

function var_0_0.Create(arg_4_0, arg_4_1)
	local var_4_0 = GameObject.Find("[RTCamera]")

	assert(var_4_0, "不存在[RTCamera]")

	local var_4_1 = findTF(var_4_0, arg_4_1.camera)

	assert(var_4_1, "不存在相机" .. arg_4_1.camera)

	local var_4_2 = "CameraRTUI" .. arg_4_1.id
	local var_4_3 = GameObject(var_4_2)
	local var_4_4 = GetOrAddComponent(var_4_3, "CameraRTUI")

	setActive(var_4_1, true)
	setParent(var_4_3, arg_4_0.mainTransform, false)
	setSizeDelta(var_4_3, {
		x = arg_4_1.width,
		y = arg_4_1.height
	})
	setLocalEulerAngles(var_4_3, {
		x = arg_4_1.rotX,
		y = arg_4_1.rotY,
		z = arg_4_1.rotZ
	})
	setAnchoredPosition(var_4_3, {
		x = arg_4_1.posX,
		y = arg_4_1.posY
	})

	var_4_4.autoResize = arg_4_1.autoResize
	var_4_4.RenderCamera = var_4_1:GetComponent(typeof(Camera))
	arg_4_0.uiList[var_4_2] = var_4_3

	return var_4_3
end

function var_0_0.ShowOrHide(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = "CameraRTUI" .. arg_5_1
	local var_5_1 = arg_5_0.uiList[var_5_0]

	if not var_5_1 then
		warning("不存在CameraRTUI id=" .. arg_5_1)

		return
	end

	setActive(var_5_1:GetComponent("CameraRTUI").RenderCamera, arg_5_2)
	setActive(var_5_1, arg_5_2)
end

function var_0_0.Destroy(arg_6_0, arg_6_1)
	local var_6_0 = "CameraRTUI" .. arg_6_1
	local var_6_1 = arg_6_0.uiList[var_6_0]

	if not var_6_1 then
		warning("不存在CameraRTUI id=" .. arg_6_1)

		return
	end

	setActive(var_6_1:GetComponent("CameraRTUI").RenderCamera, false)
	Destroy(var_6_1)

	arg_6_0.uiList[var_6_0] = nil
end
