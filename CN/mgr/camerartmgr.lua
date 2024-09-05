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
	rotZ = 90,
	id = 1,
	width = 500
}

function var_0_0.Init(arg_1_0, arg_1_1)
	print("initializing camera rt manager...")

	arg_1_0.mainTransform = pg.UIMgr.GetInstance().UIMain.transform
	arg_1_0.uiList = {}

	arg_1_1()
end

function var_0_0.Create(arg_2_0, arg_2_1)
	local var_2_0 = GameObject.Find(arg_2_1.camera)

	if not var_2_0 then
		warning("不存在相机" .. arg_2_1.camera)

		return nil
	end

	local var_2_1 = "CameraRTUI" .. arg_2_1.id
	local var_2_2 = GameObject(var_2_1)
	local var_2_3 = GetOrAddComponent(var_2_2, "CameraRTUI")

	setParent(var_2_2, arg_2_0.mainTransform, false)
	setSizeDelta(var_2_2, {
		x = arg_2_1.width,
		y = arg_2_1.height
	})
	setLocalEulerAngles(var_2_2, {
		x = arg_2_1.rotX,
		y = arg_2_1.rotY,
		z = arg_2_1.rotZ
	})
	setAnchoredPosition(var_2_2, {
		x = arg_2_1.posX,
		y = arg_2_1.posY
	})

	var_2_3.autoResize = arg_2_1.autoResize
	var_2_3.RenderCamera = var_2_0:GetComponent(typeof(Camera))
	arg_2_0.uiList[var_2_1] = var_2_2

	return var_2_2
end

function var_0_0.ShowOrHide(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = "CameraRTUI" .. arg_3_1
	local var_3_1 = arg_3_0.uiList[var_3_0]

	if not var_3_1 then
		warning("不存在CameraRTUI id=" .. arg_3_1)

		return
	end

	setActive(var_3_1:GetComponent("CameraRTUI").renderCamera, arg_3_2)
	setActive(var_3_1, arg_3_2)
end

function var_0_0.Destroy(arg_4_0, arg_4_1)
	local var_4_0 = "CameraRTUI" .. arg_4_1
	local var_4_1 = arg_4_0.uiList[var_4_0]

	if not var_4_1 then
		warning("不存在CameraRTUI id=" .. arg_4_1)

		return
	end

	setActive(var_4_1:GetComponent("CameraRTUI").renderCamera, false)
	Destory(var_4_1)

	arg_4_0.uiList[var_4_0] = nil
end
