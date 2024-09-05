local var_0_0 = class("Dorm3dScene", import("view.base.BaseUI"))

var_0_0.CAMERA = {
	GIFT = 8,
	PHOTO = 10,
	POV = 11,
	TALK = 4,
	ROLE_WATCH = 5,
	IK_WATCH = 12,
	FURNITURE_WATCH = 7,
	AIM = 1,
	ROLE2 = 9,
	FURNITURE_FREELOOK = 6,
	ROLE = 3,
	AIM2 = 2
}

local var_0_1 = {
	Head = "Bip001 Head",
	LeftUpperArm = "Bip001 L UpperArm",
	RightThigh = "Bip001 R Thigh",
	LeftFoot = "Bip001 L Foot",
	RightFoot = "Bip001 R Foot",
	Spine1 = "Bip001 Spine1",
	RightCalf = "Bip001 R Calf",
	RightHand = "Bip001 R Hand",
	LeftThigh = "Bip001 L Thigh",
	Spine = "Bip001 Spine",
	RightUpperArm = "Bip001 R UpperArm",
	Spine2 = "Bip001 Spine2",
	LeftHand = "Bip001 L Hand",
	Pelvis = "Bip001 Pelvis",
	LeftForeArm = "Bip001 L Forearm",
	RightForeArm = "Bip001 R Forearm",
	LeftCalf = "Bip001 L Calf"
}

var_0_0.BONE_TO_TOUCH = {
	Head = "head",
	LeftUpperArm = "hand",
	RightThigh = "leg",
	LeftFoot = "leg",
	RightUpperArm = "hand",
	RightLowerArm = "hand",
	Chest = "chest",
	Butt = "butt",
	RightHand = "hand",
	LeftLowerArm = "hand",
	LeftThigh = "leg",
	RightCalf = "leg",
	RightFoot = "leg",
	LeftHand = "hand",
	Back = "back",
	LeftCalf = "leg",
	Belly = "belly"
}
var_0_0.CAMERA_MAX_OPERATION = {
	RIGHT = "right",
	DOWN = "donw",
	ZOOMIN = "zoom_in",
	ZOOMOUT = "zoom_out",
	UP = "up",
	LEFT = "left"
}
var_0_0.ANIM = {
	IDLE = "Idle"
}
var_0_0.PLAY_SINGLE_ACTION = "Dorm3dScene.PLAY_SINGLE_ACTION"
var_0_0.SWITCH_ACTION = "Dorm3dScene.SWITCH_ACTION"
var_0_0.PLAY_TIMELINE = "Dorm3dScene.PLAY_TIMELINE"
var_0_0.PLAY_EXPRESSION = "Dorm3dScene.PLAY_EXPRESSION"
var_0_0.MOVE_PLAYER_TO_FURNITURE = "Dorm3dScene.MOVE_PLAYER_TO_FURNITURE"
var_0_0.MOVE_PLAYER_BY_CUT = "Dorm3dScene.MOVE_PLAYER_BY_CUT"
var_0_0.ACTIVE_CAMERA = "Dorm3dScene.ACTIVE_CAMERA"
var_0_0.SHOW_BLOCK = "Dorm3dScene.SHOW_BLOCK"
var_0_0.HIDE_BLOCK = "Dorm3dScene.HIDE_BLOCK"
var_0_0.WATCH_MODE_INTERACTIVE = "Dorm3dScene.WATCH_MODE_INTERACTIVE"
var_0_0.ON_TOUCH_CHARACTER = "Dorm3dScene.ON_TOUCH_CHARACTER"
var_0_0.ON_ROLEWATCH_CAMERA_MAX = "Dorm3dScene.ON_ROLEWATCH_CAMERA_MAX"
var_0_0.ON_STICK_MOVE = "Dorm3dScene.ON_STICK_MOVE"
var_0_0.ENABLE_SCENEBLOCK = "Dorm3dScene.ENABLE_SCENEBLOCK"
var_0_0.ON_BEGIN_DRAG_CHARACTER_BODY = "Dorm3dScene.ON_BEGIN_DRAG_CHARACTER_BODY"
var_0_0.ON_DRAG_CHARACTER_BODY = "Dorm3dScene.ON_DRAG_CHARACTER_BODY"
var_0_0.ON_RELEASE_CHARACTER_BODY = "Dorm3dScene.ON_RELEASE_CHARACTER_BODY"
var_0_0.ON_POV_STICK_MOVE_BEGIN = "Dorm3dScene.ON_POV_STICK_MOVE_BEGIN"
var_0_0.ON_POV_STICK_MOVE = "Dorm3dScene.ON_POV_STICK_MOVE"
var_0_0.ON_POV_STICK_MOVE_END = "Dorm3dScene.ON_POV_STICK_MOVE_END"
var_0_0.ON_POV_STICK_VIEW = "Dorm3dScene.ON_POV_STICK_VIEW"
var_0_0.ON_IK_TRIGGER = "Dorm3dScene.ON_IK_TRIGGER"
var_0_0.ON_ENTER_SECTOR = "Dorm3dScene.ON_ENTER_SECTOR"
var_0_0.ON_IK_STATUS_CHANGED = "Dorm3dScene.ON_IK_STATUS_CHANGED"
var_0_0.POV_CLOSE_DISTANCE = 1.5
var_0_0.IK_STATUS_DELTA = 0.5
var_0_0.IK_TIP_WAIT_TIME = 5

local var_0_2 = {
	map_siriushostel_01_base = {
		Chair = {
			Radius = 2,
			Angle = 120,
			Position = {
				0.3069999,
				0,
				-1.87
			},
			Rotation = {
				0,
				90,
				0
			}
		},
		Table = {
			Radius = 2,
			Angle = 120,
			Position = {
				2.054,
				0,
				1.889
			},
			Rotation = {
				0,
				-180,
				0
			}
		},
		Bed = {
			Radius = 2,
			Angle = 120,
			Position = {
				-1.694,
				0,
				2.485
			},
			Rotation = {
				0,
				180,
				0
			}
		}
	},
	map_dormitorycorridor_01_base = {
		Default = {
			Radius = 2,
			Angle = 120,
			Position = {
				1.571,
				0,
				38.647
			},
			Rotation = {
				0,
				180,
				0
			}
		}
	}
}

var_0_0.IK_STATUS = {
	RELEASE = 3,
	BEGIN = 1,
	TRIGGER = 4,
	DRAG = 2
}

function var_0_0.getUIName(arg_1_0)
	return "Dorm3dMainUI"
end

function var_0_0.Ctor(arg_2_0, ...)
	var_0_0.super.Ctor(arg_2_0, ...)

	arg_2_0.loader = AutoLoader.New()
end

function var_0_0.preload(arg_3_0, arg_3_1)
	local var_3_0 = arg_3_0.contextData.groupId
	local var_3_1 = getProxy(ApartmentProxy):getApartment(var_3_0)

	arg_3_0:SetApartment(var_3_1)

	arg_3_0.sceneRootName = var_3_1:GetSceneRootName()
	arg_3_0.assetRootName = var_3_1:GetAssetName()

	for iter_3_0, iter_3_1 in ipairs({
		"sceneName",
		"baseSceneName",
		"modelName"
	}) do
		arg_3_0[iter_3_1] = arg_3_0.contextData.sceneData[iter_3_1]
	end

	arg_3_0.sceneInfo = string.lower(arg_3_0.sceneName .. "|" .. arg_3_0.sceneRootName)
	arg_3_0.currentSceneInfo = arg_3_0.sceneInfo
	arg_3_0.currentSubSceneInfo = arg_3_0.sceneInfo

	seriesAsync({
		function(arg_4_0)
			SceneOpMgr.Inst:LoadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. arg_3_0.sceneRootName .. "/" .. arg_3_0.sceneName .. "_scene"), arg_3_0.sceneName, LoadSceneMode.Additive, function(arg_5_0, arg_5_1)
				SceneManager.SetActiveScene(arg_5_0)
				setActive(GameObject.Find("Camera"), false)
				arg_4_0()
			end)
		end,
		function(arg_6_0)
			SceneOpMgr.Inst:LoadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. arg_3_0.sceneRootName .. "/" .. arg_3_0.baseSceneName .. "_scene"), arg_3_0.baseSceneName, LoadSceneMode.Additive, arg_6_0)
		end,
		function(arg_7_0)
			arg_3_0:LoadCharacter(arg_7_0)
		end,
		function(arg_8_0)
			arg_3_0:LoadBaseResource(arg_8_0)
		end
	}, arg_3_1)
end

function var_0_0.init(arg_9_0)
	arg_9_0:InitData()
	arg_9_0:initScene()
	arg_9_0:InitCharacter()

	arg_9_0.retainCount = 0
	arg_9_0.sceneBlockLayer = arg_9_0._tf:Find("SceneBlock")

	setActive(arg_9_0.sceneBlockLayer, false)

	arg_9_0.blockLayer = arg_9_0._tf:Find("Block")

	setActive(arg_9_0.blockLayer, false)

	arg_9_0.blackLayer = arg_9_0._tf:Find("BlackScreen")

	setActive(arg_9_0.blackLayer, false)
	arg_9_0:BindEvent()

	arg_9_0.inFurniture = arg_9_0.furnitures:Find(arg_9_0.contextData.inFurnitureName)

	arg_9_0:ChangeCharacterPosition()
	arg_9_0:ChangePlayerPosition()

	arg_9_0.baseView = Dorm3dBaseView.New(nil, arg_9_0.event, arg_9_0.contextData)
	arg_9_0.baseView.sceneView = arg_9_0

	arg_9_0.baseView:SetExtra(arg_9_0._tf)
	arg_9_0.baseView:Load()
	arg_9_0.baseView:BindEvent()
	arg_9_0.baseView:SetApartment(arg_9_0.apartment)
	arg_9_0.baseView:initNodeCanvas(arg_9_0.rtMainAI)
	arg_9_0.baseView:SetBlackboardValue("ladyTransform", arg_9_0.lady)

	arg_9_0.cacheSceneDic = {}
	arg_9_0.lastSceneRootDict = {}

	pg.ClickEffectMgr:GetInstance():SetClickEffect("DORM3D")
end

function var_0_0.BindEvent(arg_10_0)
	arg_10_0:bind(Dorm3dScene.PLAY_SINGLE_ACTION, function(arg_11_0, arg_11_1, arg_11_2)
		arg_10_0:PlaySingleAction(arg_11_1, arg_11_2)
	end)
	arg_10_0:bind(Dorm3dScene.SWITCH_ACTION, function(arg_12_0, arg_12_1, arg_12_2)
		arg_10_0:SwitchAnim(arg_12_1, arg_12_2)
	end)
	arg_10_0:bind(Dorm3dScene.PLAY_TIMELINE, function(arg_13_0, arg_13_1, arg_13_2)
		arg_10_0:PlayTimeline(arg_13_1, arg_13_2)
	end)
	arg_10_0:bind(Dorm3dScene.PLAY_EXPRESSION, function(arg_14_0, arg_14_1)
		arg_10_0:PlayExpression(arg_14_1)
	end)
	arg_10_0:bind(Dorm3dScene.MOVE_PLAYER_TO_FURNITURE, function(arg_15_0, arg_15_1, arg_15_2)
		arg_10_0:PlayerMove(arg_15_1, arg_15_2)
	end)
	arg_10_0:bind(Dorm3dScene.MOVE_PLAYER_BY_CUT, function(arg_16_0, arg_16_1, arg_16_2)
		arg_10_0:ShiftZone(arg_16_1, arg_16_2)
	end)
	arg_10_0:bind(Dorm3dScene.ACTIVE_CAMERA, function(arg_17_0, arg_17_1)
		local var_17_0 = arg_10_0.cameras[arg_17_1]

		arg_10_0:ActiveCamera(var_17_0)
	end)
	arg_10_0:bind(Dorm3dScene.SHOW_BLOCK, function()
		arg_10_0.retainCount = arg_10_0.retainCount + 1

		setActive(arg_10_0.blockLayer, true)
	end)
	arg_10_0:bind(Dorm3dScene.HIDE_BLOCK, function()
		arg_10_0.retainCount = math.max(arg_10_0.retainCount - 1, 0)

		if arg_10_0.retainCount > 0 then
			return
		end

		setActive(arg_10_0.blockLayer, false)
	end)
	arg_10_0:bind(Dorm3dScene.ENABLE_SCENEBLOCK, function(arg_20_0, arg_20_1)
		setActive(arg_10_0.sceneBlockLayer, arg_20_1)
	end)
	arg_10_0:bind(Dorm3dScene.WATCH_MODE_INTERACTIVE, function(arg_21_0)
		arg_10_0:WatchModeInteractive()
	end)
	arg_10_0:bind(Dorm3dScene.ON_STICK_MOVE, function(arg_22_0, arg_22_1)
		arg_10_0:OnStickMove(arg_22_1)
	end)
	arg_10_0:bind(Dorm3dScene.ON_BEGIN_DRAG_CHARACTER_BODY, function(arg_23_0, arg_23_1, arg_23_2)
		if arg_10_0.blockIK then
			return
		end

		if arg_10_0.ikHandler then
			return
		end

		local var_23_0 = _.detect(arg_10_0.activeIKLayers, function(arg_24_0)
			return arg_24_0.ikData:IsTrigger(Dorm3dIK.TRIGGER.TOUCH_BODY, arg_23_1)
		end)

		if not var_23_0 then
			return
		end

		arg_10_0.ikHandler = arg_10_0:EnableIKLayer(var_23_0.ikData)

		local var_23_1 = arg_23_2.position
		local var_23_2 = pg.UIMgr.GetInstance().uiCamera:Find("Canvas").rect
		local var_23_3 = Vector2.New(var_23_1.x / Screen.width * var_23_2.width, var_23_1.y / Screen.height * var_23_2.height)

		arg_10_0.ikHandler.originScreenPosition = var_23_3
	end)
	arg_10_0:bind(Dorm3dScene.ON_DRAG_CHARACTER_BODY, function(arg_25_0, arg_25_1)
		if not arg_10_0.ikHandler then
			return
		end

		local var_25_0 = arg_10_0.ikHandler
		local var_25_1 = arg_25_1.position
		local var_25_2 = pg.UIMgr.GetInstance().uiCamera:Find("Canvas").rect
		local var_25_3 = Vector2.New(var_25_1.x / Screen.width * var_25_2.width, var_25_1.y / Screen.height * var_25_2.height)

		arg_10_0.ikHandler.screenPosition = var_25_3

		local var_25_4 = var_25_3 - arg_10_0.ikHandler.originScreenPosition
		local var_25_5 = var_25_0.ikData
		local var_25_6 = var_25_0.rect
		local var_25_7 = var_25_6:Contains(var_25_4)
		local var_25_8 = var_25_0.triggerRect and var_25_0.triggerRect:Contains(var_25_4)

		if not var_25_7 and var_25_5:GetActionTriggerParams()[1] == Dorm3dIK.ACTION_TRIGGER.TOUCH_TARGET and var_25_8 then
			arg_10_0:DisableIKLayer(var_25_5)

			arg_10_0.ikHandler = nil

			arg_10_0:PlayIKAction(var_25_5)

			return
		end

		local function var_25_9()
			if var_25_7 then
				return var_25_4
			end

			local var_26_0 = var_25_4
			local var_26_1 = var_25_6.center
			local var_26_2 = {
				{
					Vector2.New(var_25_6.xMin, var_25_6.yMin),
					Vector2.New(var_25_6.xMin, var_25_6.yMax)
				},
				{
					Vector2.New(var_25_6.xMin, var_25_6.yMax),
					Vector2.New(var_25_6.xMax, var_25_6.yMax)
				},
				{
					Vector2.New(var_25_6.xMax, var_25_6.yMax),
					Vector2.New(var_25_6.xMax, var_25_6.yMin)
				},
				{
					Vector2.New(var_25_6.xMax, var_25_6.yMin),
					Vector2.New(var_25_6.xMin, var_25_6.yMin)
				}
			}

			for iter_26_0 = 1, 4 do
				local var_26_3, var_26_4 = SegmentUtil.GetCrossPoint(var_26_1, var_26_0, unpack(var_26_2[iter_26_0]))

				if var_26_3 then
					return var_26_4
				end
			end

			assert(false)

			return var_26_0
		end

		arg_10_0.ikHandler.targetScreenOffset = var_25_9()

		local var_25_10 = Vector2.New((var_25_3.x / var_25_2.width - 0.5) * var_25_2.width, (var_25_3.y / var_25_2.height - 0.5) * var_25_2.height)

		setAnchoredPosition(arg_10_0.baseView:GetIKHandTF(), var_25_10)
	end)
	arg_10_0:bind(Dorm3dScene.ON_RELEASE_CHARACTER_BODY, function(arg_27_0)
		if not arg_10_0.ikHandler then
			return
		end

		local var_27_0 = arg_10_0.ikHandler.ikData

		arg_10_0:DisableIKLayer(var_27_0)

		local var_27_1 = arg_10_0.ikHandler

		arg_10_0.ikHandler = nil

		local var_27_2 = var_27_0:GetActionTriggerParams()

		if var_27_2[1] == Dorm3dIK.ACTION_TRIGGER.RELEASE then
			arg_10_0:PlayIKAction(var_27_0)
		elseif var_27_2[1] == Dorm3dIK.ACTION_TRIGGER.RELEASE_ON_TARGET then
			local var_27_3 = var_27_1.screenPosition - var_27_1.originScreenPosition

			if var_27_1.triggerRect and var_27_1.triggerRect:Contains(var_27_3) then
				arg_10_0:PlayIKAction(var_27_0)
			end
		end

		arg_10_0:emit(var_0_0.ON_IK_STATUS_CHANGED, var_27_0:GetConfigID(), var_0_0.IK_STATUS.RELEASE)
	end)
	arg_10_0:bind(Dorm3dScene.ON_POV_STICK_MOVE_BEGIN, function(arg_28_0, arg_28_1)
		if arg_10_0.pinchMode then
			return
		end

		arg_10_0.moveStickOrigin = arg_28_1.position
		arg_10_0.moveStickPosition = arg_10_0.moveStickOrigin
		arg_10_0.moveStickDraging = true
	end)

	local function var_10_0()
		arg_10_0.moveStickOrigin = nil
		arg_10_0.moveStickPosition = nil
		arg_10_0.moveStickDraging = nil
	end

	arg_10_0:bind(Dorm3dScene.ON_POV_STICK_MOVE_END, function(arg_30_0, arg_30_1)
		var_10_0()
	end)
	arg_10_0:bind(Dorm3dScene.ON_POV_STICK_MOVE, function(arg_31_0, arg_31_1)
		if arg_10_0.pinchMode then
			var_10_0()

			return
		end

		if not arg_10_0.moveStickDraging then
			return
		end

		arg_10_0.moveStickPosition = arg_10_0.moveStickPosition + arg_31_1

		if isActive(arg_10_0.baseView.povLayer:Find("Guide")) then
			setActive(arg_10_0.baseView.povLayer:Find("Guide"), false)
		end
	end)

	local var_10_1 = 32.4 / Screen.height

	arg_10_0:bind(Dorm3dScene.ON_POV_STICK_VIEW, function(arg_32_0, arg_32_1)
		if arg_10_0.pinchMode then
			return
		end

		arg_32_1 = arg_32_1 * var_10_1

		local var_32_0 = arg_32_1.x
		local var_32_1 = arg_32_1.y

		local function var_32_2(arg_33_0, arg_33_1, arg_33_2)
			local var_33_0 = arg_33_0[arg_33_1]

			var_33_0.m_InputAxisValue = arg_33_2
			arg_33_0[arg_33_1] = var_33_0
		end

		if arg_10_0.compPov and go(arg_10_0.compPov).activeInHierarchy then
			var_32_2(arg_10_0.compPov, "m_HorizontalAxis", var_32_0)
			var_32_2(arg_10_0.compPov, "m_VerticalAxis", var_32_1)
		end
	end)
end

function var_0_0.SetApartment(arg_34_0, arg_34_1)
	arg_34_0.apartment = arg_34_1

	if arg_34_0.baseView then
		arg_34_0.baseView:SetApartment(arg_34_1)
	end
end

function var_0_0.GetApartment(arg_35_0)
	return arg_35_0.apartment
end

function var_0_0.initScene(arg_36_0)
	arg_36_0:ResetSceneStructure(SceneManager.GetSceneByName(arg_36_0.baseSceneName))

	arg_36_0.mainCameraTF = GameObject.Find("BackYardMainCamera").transform
	arg_36_0.camBrain = arg_36_0.mainCameraTF:GetComponent(typeof(Cinemachine.CinemachineBrain))
	arg_36_0.camBrainEvenetHandler = arg_36_0.mainCameraTF:GetComponent(typeof(CameraBrainEventsHandler))
	arg_36_0.raycastCamera = arg_36_0.mainCameraTF:Find("CameraForRaycast"):GetComponent(typeof(Camera))
	arg_36_0.sceneRaycaster = arg_36_0.raycastCamera:GetComponent(typeof(UnityEngine.EventSystems.PhysicsRaycaster))
	arg_36_0.player = GameObject.Find("Player").transform
	arg_36_0.playerEye = arg_36_0.player:Find("Eye")
	arg_36_0.playerFoot = arg_36_0.player:Find("Foot")

	setActive(arg_36_0.playerFoot, false)

	arg_36_0.playerController = arg_36_0.player:GetComponent(typeof(UnityEngine.CharacterController))
	arg_36_0.attachedPoints = {}

	eachChild(arg_36_0.furnitures, function(arg_37_0)
		table.insert(arg_36_0.attachedPoints, 1, arg_37_0)
	end)

	arg_36_0.dollyParent = GameObject.Find("Dollys").transform
	arg_36_0.modelRoot = GameObject.Find("scene_root").transform
	arg_36_0.slotRoot = GameObject.Find("FurnitureSlots").transform

	setActive(arg_36_0.slotRoot, true)
	arg_36_0:InitSlots()

	arg_36_0.outlineMaterial = GameObject.Find("Res").transform:GetComponent(typeof(MeshRenderer)).materials[0]

	tolua.loadassembly("Cinemachine")
	tolua.loadassembly("MagicaCloth")

	local var_36_0 = GameObject.Find("CM Cameras").transform

	arg_36_0.cameraAim = var_36_0:Find("Aim Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))
	arg_36_0.cameraAim2 = var_36_0:Find("Aim2 Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))
	arg_36_0.cameraFree = nil
	arg_36_0.cameraFurnitureWatch = nil
	arg_36_0.cameraRole = var_36_0:Find("Role Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))
	arg_36_0.cameraRole2 = var_36_0:Find("Role2 Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))
	arg_36_0.cameraTalk = var_36_0:Find("Talk Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))
	arg_36_0.cameraGift = var_36_0:Find("Gift Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))
	arg_36_0.cameraRoleWatch = nil
	arg_36_0.cameraPhoto = var_36_0:Find("Photo Camera"):GetComponent(typeof(Cinemachine.CinemachineFreeLook))
	arg_36_0.cameras = {
		arg_36_0.cameraAim,
		arg_36_0.cameraAim2,
		arg_36_0.cameraRole,
		arg_36_0.cameraTalk,
		arg_36_0.cameraRoleWatch,
		[var_0_0.CAMERA.GIFT] = arg_36_0.cameraGift,
		[var_0_0.CAMERA.ROLE2] = arg_36_0.cameraRole2,
		[var_0_0.CAMERA.PHOTO] = arg_36_0.cameraPhoto,
		[var_0_0.CAMERA.POV] = var_36_0:Find("FP Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))
	}
	arg_36_0.compDolly = arg_36_0.cameraAim:GetCinemachineComponent(Cinemachine.CinemachineCore.Stage.Body)
	arg_36_0.compPov = arg_36_0.cameras[var_0_0.CAMERA.POV]:GetCinemachineComponent(Cinemachine.CinemachineCore.Stage.Aim)
	arg_36_0.POVOriginalFOV = arg_36_0:GetPOVFOV()
	arg_36_0.ladyInterest = GameObject.Find("InterestProxy").transform
	arg_36_0.rtMainAI = GameObject.Find("MainAI").transform
	arg_36_0.daynightCtrlComp = GameObject.Find("[MainBlock]").transform:GetComponent(typeof(DayNightCtrl))

	arg_36_0:SwitchDayNight(arg_36_0.contextData.timeIndex)
end

function var_0_0.SwitchDayNight(arg_38_0, arg_38_1)
	if not IsNil(arg_38_0.daynightCtrlComp) then
		arg_38_0.daynightCtrlComp:SwitcherToIndex(arg_38_1 - 1)
	end

	arg_38_0:InitLightSettings()
end

function var_0_0.InitLightSettings(arg_39_0)
	arg_39_0.globalVolume = GameObject.Find("GlobalVolume")

	arg_39_0:RegisterGlobalVolume()

	arg_39_0.characterLight = GameObject.Find("CharacterLight")

	arg_39_0:RecordCharacterLight()

	local var_39_0 = GameObject.Find("[Lighting]").transform

	table.IpairsCArray(var_39_0:GetComponentsInChildren(typeof(Light)), function(arg_40_0, arg_40_1)
		arg_40_1.shadows = UnityEngine.LightShadows.None
	end)
end

function var_0_0.ResetSceneStructure(arg_41_0, arg_41_1)
	table.IpairsCArray(arg_41_1:GetRootGameObjects(), function(arg_42_0, arg_42_1)
		if arg_42_1.name == "Furnitures" then
			arg_41_0.furnitures = tf(arg_42_1)

			eachChild(arg_41_0.furnitures, function(arg_43_0)
				if arg_43_0:Find("FreeLook Camera") then
					setActive(arg_43_0:Find("FreeLook Camera"), false)
				end

				if arg_43_0:Find("FreeLook Camera") then
					setActive(arg_43_0:Find("RoleWatch Camera"), false)
				end

				if arg_43_0:Find("IKCamera") then
					setActive(arg_43_0:Find("IKCamera"), false)
				end

				local var_43_0 = arg_43_0:GetComponent(typeof(UnityEngine.Collider))

				if not var_43_0 then
					return
				end

				var_43_0.enabled = false
			end)
		end
	end)

	arg_41_0.activeSectors = var_0_2[arg_41_1.name]
end

function var_0_0.InitSlots(arg_44_0)
	local var_44_0 = arg_44_0.apartment:GetSlots()
	local var_44_1 = arg_44_0.modelRoot:GetComponentsInChildren(typeof(Transform))

	arg_44_0.slotDict = {}

	_.each(var_44_0, function(arg_45_0)
		local var_45_0 = arg_45_0:GetFurnitureName()
		local var_45_1 = arg_45_0:GetConfigID()
		local var_45_2 = arg_44_0.slotRoot:Find(tostring(var_45_1))

		assert(var_45_2)

		local var_45_3 = {
			trans = var_45_2
		}
		local var_45_4 = var_45_2:Find("Selector")

		if var_45_4 then
			GetOrAddComponent(var_45_4, typeof(EventTriggerListener)):AddPointClickFunc(function(arg_46_0, arg_46_1)
				arg_44_0:emit(Dorm3dSceneMediator.ON_CLICK_FURNITURE_SLOT, var_45_1)
			end)
			setActive(var_45_4, false)
		end

		local var_45_5

		for iter_45_0 = 0, var_44_1.Length - 1 do
			local var_45_6 = var_44_1[iter_45_0]

			if var_45_6.name == var_45_0 then
				var_45_5 = var_45_6

				break
			end
		end

		if var_45_5 then
			var_45_3.model = var_45_5
		end

		arg_44_0.slotDict[var_45_1] = var_45_3
	end)
end

function var_0_0.SetContactStateDic(arg_47_0, arg_47_1)
	arg_47_0.contactStateDic = arg_47_1
	arg_47_0.hideContactStateDic = {}
	arg_47_0.contactInRangeDic = {}

	for iter_47_0, iter_47_1 in ipairs(arg_47_0.contactStateDic) do
		arg_47_0.hideContactStateDic[iter_47_0] = math.min(iter_47_1, Apartment.ITEM_UNLOCK)
		arg_47_0.contactInRangeDic[iter_47_0] = false
	end

	arg_47_0:ActiveContact()
end

function var_0_0.TempHideContact(arg_48_0, arg_48_1)
	arg_48_0.hideConcatFlag = arg_48_1

	arg_48_0:ActiveContact()
end

function var_0_0.ActiveContact(arg_49_0)
	for iter_49_0, iter_49_1 in ipairs(arg_49_0.contactInRangeDic) do
		arg_49_0:UpdateContactDisplay(iter_49_0, arg_49_0.contactInRangeDic[iter_49_0] and not arg_49_0.hideConcatFlag and arg_49_0.contactStateDic[iter_49_0] or arg_49_0.hideContactStateDic[iter_49_0])
	end
end

function var_0_0.UpdateContactDisplay(arg_50_0, arg_50_1, arg_50_2)
	local var_50_0 = pg.dorm3d_collection_template[arg_50_1]

	for iter_50_0, iter_50_1 in ipairs(var_50_0.vfx_prefab) do
		setActive(arg_50_0.modelRoot:Find(iter_50_1), arg_50_2 == Apartment.ITEM_FIRST)
	end

	for iter_50_2, iter_50_3 in ipairs(var_50_0.model) do
		local var_50_1 = arg_50_0.modelRoot:Find(iter_50_3)
		local var_50_2 = GetComponent(var_50_1, typeof(EventTriggerListener))

		if arg_50_2 == Apartment.ITEM_FIRST then
			var_50_2 = var_50_2 or GetOrAddComponent(var_50_1, typeof(EventTriggerListener))

			var_50_2:AddPointClickFunc(function(arg_51_0, arg_51_1)
				arg_50_0.baseView:SendNodeCanvasEvent("ClickContact", arg_50_1)
			end)

			var_50_2.enabled = true
		elseif var_50_2 then
			var_50_2.enabled = false
		end

		setActive(var_50_1, arg_50_2 > Apartment.ITEM_LOCK)
	end
end

function var_0_0.SetFloatEnable(arg_52_0, arg_52_1)
	arg_52_0.enableFloatUpdate = arg_52_1

	if arg_52_1 then
		arg_52_0:UpdateFloatPosition()
	end
end

function var_0_0.UpdateFloatPosition(arg_53_0)
	local var_53_0 = arg_53_0:GetScreenPosition(arg_53_0.ladyHeadCenter.position + Vector3(0, 0.2, 0))
	local var_53_1 = arg_53_0:GetLocalPosition(var_53_0, arg_53_0.baseView.rtFloatPage)

	setLocalPosition(arg_53_0.baseView.rtFloatPage:Find("lady"), var_53_1)
end

function var_0_0.SetPlayerFootTarget(arg_54_0, arg_54_1)
	arg_54_0.enableFootArrow = arg_54_1

	setActive(arg_54_0.playerFoot, tobool(arg_54_0.enableFootArrow))

	if arg_54_0.enableFootArrow then
		arg_54_0:UpdateFootRotation()
	end
end

function var_0_0.UpdateFootRotation(arg_55_0)
	assert(arg_55_0.enableFootArrow)
	arg_55_0.playerFoot:LookAt(arg_55_0.enableFootArrow)
end

function var_0_0.LoadCharacter(arg_56_0, arg_56_1)
	arg_56_0.hxMatDict = {}

	parallelAsync({
		function(arg_57_0)
			seriesAsync({
				function(arg_58_0)
					arg_56_0.loader:LoadBundle("dorm3d/character/" .. arg_56_0.assetRootName .. "/res/common", function(arg_59_0)
						local var_59_0 = arg_59_0:GetAllAssetNames()

						table.IpairsCArray(var_59_0, function(arg_60_0, arg_60_1)
							local var_60_0, var_60_1, var_60_2 = string.find(arg_60_1, "material_hx[/\\](.*).mat")

							if var_60_0 then
								arg_56_0.hxMatDict[var_60_2] = {
									arg_59_0,
									arg_60_1
								}
							end
						end)
						arg_58_0()
					end)
				end,
				function(arg_61_0)
					arg_56_0.loader:LoadBundle("dorm3d/character/" .. arg_56_0.assetRootName .. "/res/" .. arg_56_0.modelName, function(arg_62_0)
						local var_62_0 = arg_62_0:GetAllAssetNames()

						table.IpairsCArray(var_62_0, function(arg_63_0, arg_63_1)
							local var_63_0, var_63_1, var_63_2 = string.find(arg_63_1, "material_hx[/\\](.*).mat")

							if var_63_0 then
								arg_56_0.hxMatDict[var_63_2] = {
									arg_62_0,
									arg_63_1
								}
							end
						end)
						arg_61_0()
					end)
				end,
				arg_57_0
			})
		end,
		function(arg_64_0)
			arg_56_0.loader:GetPrefab("dorm3d/character/" .. arg_56_0.assetRootName .. "/prefabs/" .. arg_56_0.modelName, "", function(arg_65_0)
				arg_56_0.ladyGameobject = arg_65_0

				existCall(arg_64_0)
			end)
		end
	}, arg_56_1)
end

function var_0_0.LoadBaseResource(arg_66_0, arg_66_1)
	arg_66_0.resDic = {}

	parallelAsync({
		function(arg_67_0)
			arg_66_0.loader:GetPrefab("dorm3d/effect/prefab/scene/vfx_talk_mark", "", function(arg_68_0)
				arg_66_0.canWatchFloat = arg_68_0

				arg_67_0()
			end)
		end
	}, arg_66_1)
end

function var_0_0.HXCharacter(arg_69_0, arg_69_1)
	if not HXSet.isHx() then
		return
	end

	local var_69_0 = arg_69_1:GetComponentsInChildren(typeof(SkinnedMeshRenderer))

	table.IpairsCArray(var_69_0, function(arg_70_0, arg_70_1)
		local var_70_0 = arg_70_1.sharedMaterials
		local var_70_1 = false

		table.IpairsCArray(var_70_0, function(arg_71_0, arg_71_1)
			local var_71_0 = arg_71_1.name

			if not arg_69_0.hxMatDict[var_71_0] then
				return
			end

			var_70_1 = true

			local var_71_1 = arg_69_0.hxMatDict[var_71_0][1]:LoadAssetSync(arg_69_0.hxMatDict[var_71_0][2], typeof(Material), true, false)

			var_70_0[arg_71_0] = var_71_1

			warning("Replace HX Material", arg_69_0.hxMatDict[var_71_0][2])
		end)

		if var_70_1 then
			arg_70_1.sharedMaterials = var_70_0
		end
	end)
end

function var_0_0.InitCharacter(arg_72_0)
	arg_72_0.lady = arg_72_0.ladyGameobject.transform

	arg_72_0.lady:SetParent(arg_72_0.mainCameraTF)
	arg_72_0.lady:SetParent(nil)

	arg_72_0.ladyAgent = arg_72_0.lady:GetComponent(typeof(UnityEngine.AI.NavMeshAgent))
	arg_72_0.ladyAgent.autoRepath = true
	arg_72_0.ladyHeadIKComp = arg_72_0.lady:GetComponent(typeof(HeadAimIK))
	arg_72_0.ladyHeadIKComp.AimTarget = arg_72_0.mainCameraTF:Find("AimTarget")
	arg_72_0.ladyHeadIKData = {
		DampTime = arg_72_0.ladyHeadIKComp.DampTime,
		blinkSpeed = arg_72_0.ladyHeadIKComp.blinkSpeed
	}

	local var_72_0 = {}

	table.Foreach(var_0_1, function(arg_73_0, arg_73_1)
		var_72_0[arg_73_1] = arg_73_0
	end)

	arg_72_0.ladyAnimator = arg_72_0.lady:GetComponent(typeof(Animator))
	arg_72_0.ladyAnimBaseLayerIndex = arg_72_0.ladyAnimator:GetLayerIndex("Base Layer")
	arg_72_0.ladyBoneMaps = {}

	local var_72_1 = arg_72_0.lady:GetComponentsInChildren(typeof(Transform))

	table.IpairsCArray(var_72_1, function(arg_74_0, arg_74_1)
		if arg_74_1.name == "BodyCollider" then
			arg_72_0.ladyCollider = arg_74_1
		elseif arg_74_1.name == "Interest" then
			arg_72_0.ladyInterestRoot = arg_74_1
		elseif arg_74_1.name == "Head Center" then
			arg_72_0.ladyHeadCenter = arg_74_1
		end

		if var_72_0[arg_74_1.name] then
			arg_72_0.ladyBoneMaps[var_72_0[arg_74_1.name]] = arg_74_1
		end
	end)
	setParent(arg_72_0.canWatchFloat, arg_72_0.ladyHeadCenter)

	arg_72_0.ladyColliders = {}
	arg_72_0.ladyTouchColliders = {}

	table.IpairsCArray(arg_72_0.lady:GetComponentsInChildren(typeof(UnityEngine.Collider)), function(arg_75_0, arg_75_1)
		arg_75_1 = tf(arg_75_1)

		local var_75_0 = arg_75_1.name
		local var_75_1 = var_75_0 and string.find(var_75_0, "Collider") or -1

		if var_75_1 <= 0 then
			errorMsg("Wrong Name to lady Collider : " .. var_75_0)

			return
		end

		local var_75_2 = string.sub(var_75_0, 1, var_75_1 - 1)

		arg_72_0.ladyColliders[var_75_2] = arg_75_1

		if var_75_2 ~= "Body" then
			table.insert(arg_72_0.ladyTouchColliders, arg_75_1)
			setActive(arg_75_1, false)
		end
	end)
	arg_72_0:HXCharacter(arg_72_0.lady)
	;(function()
		local var_76_0 = "dorm3d/effect/prefab/function/vfx_function_aixin02"
		local var_76_1 = "vfx_function_aixin02"

		arg_72_0.loader:GetPrefab(var_76_0, var_76_1, function(arg_77_0)
			arg_72_0.effectHeart = arg_77_0

			setActive(arg_77_0, false)
			setParent(arg_72_0.effectHeart, arg_72_0.ladyHeadCenter)
		end)
	end)()

	arg_72_0.lipsyncComps = {
		arg_72_0.lady:GetComponent("uLipSync"),
		arg_72_0.lady:GetComponent("uLipSyncBlendShape"),
		arg_72_0.lady:GetComponent("uLipSyncCriwareAudioSource")
	}

	arg_72_0:EnableLipSync(false)

	arg_72_0.clothComps = {}

	table.IpairsCArray(arg_72_0.lady:GetComponentsInChildren(typeof("MagicaCloth.MagicaBoneCloth")), function(arg_78_0, arg_78_1)
		table.insert(arg_72_0.clothComps, arg_78_1)
	end)
	table.IpairsCArray(arg_72_0.lady:GetComponentsInChildren(typeof("MagicaCloth.MagicaCapsuleCollider")), function(arg_79_0, arg_79_1)
		table.insert(arg_72_0.clothComps, arg_79_1)
	end)
	arg_72_0:EnableCloth(false)

	arg_72_0.ladyIKRoot = arg_72_0.lady:Find("IKLayers")
	arg_72_0.cameraAim2.LookAt = arg_72_0.ladyInterestRoot
	arg_72_0.cameraTalk.Follow = arg_72_0.ladyInterestRoot
	arg_72_0.cameraTalk.LookAt = arg_72_0.ladyInterestRoot
	arg_72_0.cameraGift.Follow = arg_72_0.ladyInterest
	arg_72_0.cameraGift.LookAt = arg_72_0.ladyInterest
	arg_72_0.cameraRole2.LookAt = arg_72_0.ladyInterestRoot
	arg_72_0.cameraPhoto.Follow = arg_72_0.ladyInterest
	arg_72_0.cameraPhoto.LookAt = arg_72_0.ladyInterest
end

function var_0_0.didEnter(arg_80_0)
	local var_80_0 = GetComponent(arg_80_0.lady, typeof(EventTriggerListener))

	var_80_0:AddPointClickFunc(function(arg_81_0, arg_81_1)
		if arg_81_1.rawPointerPress.transform == arg_80_0.ladyCollider then
			arg_80_0.baseView:SendNodeCanvasEvent("ClickCharacter", arg_80_0.lady)
		else
			local var_81_0 = table.keyof(arg_80_0.ladyColliders, arg_81_1.rawPointerPress.transform)

			arg_80_0:emit(var_0_0.ON_TOUCH_CHARACTER, Dorm3dScene.BONE_TO_TOUCH[var_81_0] or arg_81_1.rawPointerPress.name)
		end
	end)
	var_80_0:AddBeginDragFunc(function(arg_82_0, arg_82_1)
		if arg_82_1.rawPointerPress.transform == arg_80_0.ladyCollider then
			return
		else
			local var_82_0 = table.keyof(arg_80_0.ladyColliders, arg_82_1.rawPointerPress.transform)

			arg_80_0:emit(var_0_0.ON_BEGIN_DRAG_CHARACTER_BODY, var_82_0, arg_82_1)
		end
	end)
	var_80_0:AddDragFunc(function(arg_83_0, arg_83_1)
		if arg_83_1.rawPointerPress.transform == arg_80_0.ladyCollider then
			return
		else
			local var_83_0 = table.keyof(arg_80_0.ladyColliders, arg_83_1.rawPointerPress.transform)

			arg_80_0:emit(var_0_0.ON_DRAG_CHARACTER_BODY, arg_83_1)
		end
	end)
	var_80_0:AddDragEndFunc(function(arg_84_0, arg_84_1)
		arg_80_0:emit(var_0_0.ON_RELEASE_CHARACTER_BODY)
	end)
	eachChild(arg_80_0.furnitures, function(arg_85_0)
		local var_85_0 = GetComponent(arg_85_0, typeof(EventTriggerListener))

		if not var_85_0 then
			return
		end

		var_85_0:AddPointClickFunc(function(arg_86_0, arg_86_1)
			arg_80_0.baseView:SendNodeCanvasEvent("ClickFurniture", arg_86_0.transform)
		end)
	end)

	local var_80_1 = -21.6 / Screen.height

	arg_80_0.joystickDelta = Vector2.zero
	arg_80_0.joystickTimer = FrameTimer.New(function()
		local var_87_0 = arg_80_0.joystickDelta * var_80_1
		local var_87_1 = var_87_0.x
		local var_87_2 = var_87_0.y

		local function var_87_3(arg_88_0, arg_88_1, arg_88_2)
			local var_88_0 = arg_88_0[arg_88_1]

			var_88_0.m_InputAxisValue = arg_88_2
			arg_88_0[arg_88_1] = var_88_0
		end

		if arg_80_0.surroudCamera and not arg_80_0.pinchMode then
			var_87_3(arg_80_0.surroudCamera, "m_XAxis", var_87_1)
			var_87_3(arg_80_0.surroudCamera, "m_YAxis", var_87_2)

			if arg_80_0.surroudCamera == arg_80_0.cameraRoleWatch then
				if var_87_1 ~= 0 then
					local var_87_4 = arg_80_0.cameraRoleWatch.m_XAxis

					if not var_87_4.m_Wrap then
						local var_87_5 = var_87_1 * (var_87_4.m_InvertInput and -1 or 1)

						if var_87_5 < 0 and var_87_4.Value - 0.01 < var_87_4.m_MinValue then
							arg_80_0:emit(var_0_0.ON_ROLEWATCH_CAMERA_MAX, var_0_0.CAMERA_MAX_OPERATION.RIGHT)
						elseif var_87_5 > 0 and var_87_4.Value + 0.01 > var_87_4.m_MaxValue then
							arg_80_0:emit(var_0_0.ON_ROLEWATCH_CAMERA_MAX, var_0_0.CAMERA_MAX_OPERATION.LEFT)
						end
					end
				end

				if var_87_2 ~= 0 then
					local var_87_6 = arg_80_0.cameraRoleWatch.m_YAxis

					if not var_87_6.m_Wrap then
						if var_87_2 < 0 and var_87_6.Value - 0.01 < var_87_6.m_MinValue then
							arg_80_0:emit(var_0_0.ON_ROLEWATCH_CAMERA_MAX, var_0_0.CAMERA_MAX_OPERATION.DOWN)
						elseif var_87_2 > 0 and var_87_6.Value + 0.01 > var_87_6.m_MaxValue then
							arg_80_0:emit(var_0_0.ON_ROLEWATCH_CAMERA_MAX, var_0_0.CAMERA_MAX_OPERATION.UP)
						end
					end
				end
			end
		end

		arg_80_0.joystickDelta = Vector2.zero
	end, 1, -1)

	arg_80_0.joystickTimer:Start()

	local var_80_2 = 1.5

	arg_80_0.moveStickTimer = FrameTimer.New(function()
		if not arg_80_0.moveStickDraging then
			return
		end

		local var_89_0 = (arg_80_0.moveStickPosition - arg_80_0.moveStickOrigin):ClampMagnitude(200)

		arg_80_0.moveStickPosition = arg_80_0.moveStickOrigin + var_89_0

		local var_89_1 = Vector3.New(var_89_0.x, 0, var_89_0.y)
		local var_89_2 = arg_80_0.mainCameraTF:TransformDirection(var_89_1)

		var_89_2.y = 0

		local var_89_3 = var_89_2:Normalize()

		var_89_3:Mul(var_80_2)
		arg_80_0.playerController:SimpleMove(var_89_3)

		arg_80_0.tweenFOV = true
	end, 1, -1)

	arg_80_0.moveStickTimer:Start()

	arg_80_0.pinchMode = false
	arg_80_0.pinchSize = 0
	arg_80_0.pinchValue = 1
	arg_80_0.pinchNodeOrder = 1

	GlobalClickEventMgr.Inst:AddBeginPinchFunc(function(arg_90_0, arg_90_1)
		if arg_80_0.surroudCamera and isActive(arg_80_0.surroudCamera) then
			arg_80_0.pinchMode = true
			arg_80_0.pinchSize = (arg_90_0 - arg_90_1):Magnitude()
			arg_80_0.pinchNodeOrder = arg_90_1.x < arg_90_0.x and -1 or 1

			return
		end

		if isActive(arg_80_0.cameras[var_0_0.CAMERA.POV]) then
			if (arg_90_0 - arg_90_1):Magnitude() < Screen.height * 0.5 then
				arg_80_0.pinchMode = true
				arg_80_0.pinchSize = (arg_90_0 - arg_90_1):Magnitude()
				arg_80_0.pinchNodeOrder = arg_90_1.x < arg_90_0.x and -1 or 1
			end

			return
		end
	end)

	local var_80_3 = 0.01

	if IsUnityEditor then
		var_80_3 = 0.1
	end

	local var_80_4 = var_80_3 * 1080 / Screen.height

	GlobalClickEventMgr.Inst:AddPinchFunc(function(arg_91_0, arg_91_1)
		if not arg_80_0.pinchMode then
			return
		end

		local var_91_0 = (arg_91_0 - arg_91_1):Magnitude()
		local var_91_1 = arg_80_0.pinchSize - var_91_0
		local var_91_2 = arg_80_0.pinchNodeOrder * (arg_91_1.x < arg_91_0.x and -1 or 1)
		local var_91_3 = var_91_1 * var_80_4 * var_91_2

		if arg_80_0.surroudCamera == arg_80_0.cameraRoleWatch and isActive(arg_80_0.surroudCamera) then
			local var_91_4 = 0.5
			local var_91_5 = 1

			arg_80_0:SetPinchValue(math.clamp(arg_80_0.pinchValue + var_91_3, var_91_4, var_91_5))

			arg_80_0.pinchSize = var_91_0

			if var_91_3 > 0.01 and arg_80_0.pinchValue == var_91_5 then
				arg_80_0:emit(var_0_0.ON_ROLEWATCH_CAMERA_MAX, var_0_0.CAMERA_MAX_OPERATION.ZOOMOUT)
			elseif var_91_3 < -0.01 and arg_80_0.pinchValue == var_91_4 then
				arg_80_0:emit(var_0_0.ON_ROLEWATCH_CAMERA_MAX, var_0_0.CAMERA_MAX_OPERATION.ZOOMIN)
			end

			arg_80_0:emit(Dorm3dSceneMediator.Camera_Pinch_Value_Change, arg_80_0.pinchValue)

			return
		end

		if isActive(arg_80_0.cameras[var_0_0.CAMERA.POV]) then
			local var_91_6 = 0.5
			local var_91_7 = 1

			arg_80_0.pinchValue = math.clamp(arg_80_0.pinchValue + var_91_3, var_91_6, var_91_7)
			arg_80_0.pinchSize = var_91_0

			arg_80_0:SetPOVFOV(arg_80_0.POVOriginalFOV * arg_80_0.pinchValue)

			arg_80_0.tweenFOV = nil

			return
		end
	end)
	GlobalClickEventMgr.Inst:AddEndPinchFunc(function()
		arg_80_0.pinchMode = false
		arg_80_0.pinchSize = 0
	end)
	arg_80_0.ladyAnimator:GetComponent("DftAniEvent"):SetCommonEvent(function(arg_93_0)
		if arg_80_0.nowState and arg_93_0.animatorStateInfo:IsName(arg_80_0.nowState) then
			existCall(arg_80_0.stateCallback)

			return
		end

		local var_93_0 = arg_93_0.animatorStateInfo

		for iter_93_0, iter_93_1 in pairs(arg_80_0.animCallbacks) do
			if var_93_0:IsName(iter_93_0) then
				warning("Active", iter_93_0)

				local var_93_1 = table.removebykey(arg_80_0.animCallbacks, iter_93_0)

				existCall(var_93_1)

				return
			end
		end

		if arg_93_0.stringParameter ~= "" then
			arg_80_0:OnAnimationEvent(arg_93_0)
		end
	end)

	arg_80_0.animEventCallbacks = {}
	arg_80_0.animCallbacks = {}
	arg_80_0.cameraBlendCallbacks = {}
	arg_80_0.activeCMCamera = nil

	function arg_80_0.camBrainEvenetHandler.OnBlendStarted(arg_94_0)
		if arg_80_0.activeCMCamera then
			arg_80_0:OnCameraBlendFinished(arg_80_0.activeCMCamera)
		end

		local var_94_0 = arg_80_0.camBrain.ActiveVirtualCamera

		arg_80_0.activeCMCamera = var_94_0
	end

	function arg_80_0.camBrainEvenetHandler.OnBlendFinished(arg_95_0)
		arg_80_0.activeCMCamera = nil

		arg_80_0:OnCameraBlendFinished(arg_95_0)
	end

	arg_80_0.expressionDict = {}

	pg.UIMgr.GetInstance():OverlayPanel(arg_80_0.blockLayer, {
		weight = LayerWeightConst.SECOND_LAYER,
		groupName = LayerWeightConst.GROUP_DORM3D
	})
	arg_80_0:OnSwitchStaticPosition()
	arg_80_0:ActiveCamera(arg_80_0.cameras[var_0_0.CAMERA.POV])
	arg_80_0:RefreshSlots(arg_80_0.apartment)
	arg_80_0.baseView:TreeStart()

	arg_80_0.updateHandler = FrameTimer.New(function()
		xpcall(function()
			arg_80_0:Update()
		end, function(...)
			errorMsg(debug.traceback(...))
		end)
	end, 1, -1)

	arg_80_0.updateHandler:Start()
end

function var_0_0.InitData(arg_99_0)
	arg_99_0.contextData.inFurnitureName = arg_99_0.contextData.inFurnitureName or "Default"
	arg_99_0.activeZoneName = arg_99_0.contextData.inFurnitureName
	arg_99_0.zoneDatas = _.select(arg_99_0.apartment:GetZones(), function(arg_100_0)
		return not arg_100_0:IsGlobal()
	end)
	arg_99_0.inFurnitureZone = _.detect(arg_99_0.zoneDatas, function(arg_101_0)
		return arg_101_0:GetWatchCameraName() == arg_99_0.contextData.inFurnitureName
	end)
	arg_99_0.activeIKLayers = {}
	arg_99_0.activeSectors = {}
end

function var_0_0.Update(arg_102_0)
	arg_102_0.raycastCamera.fieldOfView = arg_102_0.mainCameraTF:GetComponent(typeof(Camera)).fieldOfView

	if arg_102_0.tweenFOV then
		local var_102_0 = Damp(1, 1, Time.deltaTime)

		arg_102_0.pinchValue = Mathf.Lerp(arg_102_0.pinchValue, 1, var_102_0)

		arg_102_0:SetPOVFOV(arg_102_0.POVOriginalFOV * arg_102_0.pinchValue)

		if arg_102_0.pinchValue > 0.99 then
			arg_102_0.tweenFOV = nil
		end
	end

	if isActive(arg_102_0.cameras[var_0_0.CAMERA.POV]) then
		arg_102_0:TriggerLadyDistance()
	end

	if arg_102_0.contactInRangeDic then
		local var_102_1 = arg_102_0.mainCameraTF.forward
		local var_102_2 = arg_102_0.mainCameraTF.position
		local var_102_3 = UnityEngine.Rect.New(0, 0, Screen.width, Screen.height)

		local function var_102_4(arg_103_0, arg_103_1, arg_103_2)
			local var_103_0 = arg_103_0.position - var_102_2
			local var_103_1 = Clone(var_103_0)

			var_103_1.y = 0

			if arg_103_1 < var_103_1.magnitude then
				return false
			end

			local var_103_2 = var_103_0:Normalize()
			local var_103_3 = math.acos(Vector3.Dot(var_103_2, var_102_1)) * math.rad2Deg

			if arg_103_2 < math.abs(var_103_3) then
				return false
			end

			local var_103_4 = arg_102_0.raycastCamera:WorldToScreenPoint(arg_103_0.position)

			if var_103_4.z < 0 then
				return false
			end

			if not var_102_3:Contains(var_103_4) then
				return false
			end

			return true
		end

		for iter_102_0, iter_102_1 in pairs(arg_102_0.contactInRangeDic) do
			local var_102_5 = pg.dorm3d_collection_template[iter_102_0]
			local var_102_6 = underscore.any(var_102_5.vfx_prefab, function(arg_104_0)
				return var_102_4(arg_102_0.modelRoot:Find(arg_104_0), 2, 60)
			end)

			if tobool(iter_102_1) ~= var_102_6 then
				arg_102_0.contactInRangeDic[iter_102_0] = var_102_6

				arg_102_0:UpdateContactDisplay(iter_102_0, var_102_6 and not arg_102_0.hideConcatFlag and arg_102_0.contactStateDic[iter_102_0] or arg_102_0.hideContactStateDic[iter_102_0])
			end
		end
	end

	arg_102_0:CheckInSector()
	;(function()
		if not arg_102_0.ikHandler then
			return
		end

		if not arg_102_0.ikHandler.targetScreenOffset then
			return
		end

		local var_105_0 = arg_102_0.ikHandler.rect
		local var_105_1 = var_105_0:PointToNormalized(Vector2.zero)
		local var_105_2 = var_105_0:PointToNormalized(arg_102_0.ikHandler.targetScreenOffset) - var_105_1

		_.each(arg_102_0.ikHandler.subPlanes, function(arg_106_0)
			local var_106_0 = arg_106_0.target
			local var_106_1 = arg_106_0.planeData

			var_106_0.position = var_0_0.GetPostionByRatio(var_106_1, var_105_2)
		end)

		if Time.time > arg_102_0.ikNextCheckStamp then
			arg_102_0.ikNextCheckStamp = arg_102_0.ikNextCheckStamp + var_0_0.IK_STATUS_DELTA

			arg_102_0:emit(var_0_0.ON_IK_STATUS_CHANGED, arg_102_0.ikHandler.ikData:GetConfigID(), var_0_0.IK_STATUS.DRAG)
		end

		arg_102_0:ResetIKTipTimer()
	end)()

	if arg_102_0.enableIKTip then
		local var_102_7 = Time.time > arg_102_0.nextTipIKTime
		local var_102_8 = arg_102_0.baseView:GetIKTipsRootTF()

		if var_102_7 then
			UIItemList.StaticAlign(var_102_8, var_102_8:GetChild(0), #arg_102_0.activeIKLayers, function(arg_107_0, arg_107_1, arg_107_2)
				if arg_107_0 ~= UIItemList.EventUpdate then
					return
				end

				local var_107_0 = arg_102_0.activeIKLayers[arg_107_1 + 1].ikData:GetTriggerBoneName()
				local var_107_1 = var_107_0 and arg_102_0.ladyColliders[var_107_0] or nil

				if var_107_1 then
					setLocalPosition(arg_107_2, arg_102_0:GetLocalPosition(arg_102_0:GetScreenPosition(var_107_1.position), var_102_8))
				end

				setActive(arg_107_2, var_107_1)
			end)
		end

		setActive(var_102_8, var_102_7)
	end

	if arg_102_0.enableFootArrow then
		arg_102_0:UpdateFootRotation()
	end

	if arg_102_0.enableFloatUpdate then
		arg_102_0:UpdateFloatPosition()
	end
end

function var_0_0.CheckInSector(arg_108_0)
	if not isActive(arg_108_0.cameras[var_0_0.CAMERA.POV]) then
		return
	end

	local var_108_0 = tobool(arg_108_0.activeSector)
	local var_108_1 = arg_108_0.mainCameraTF.position

	var_108_1.y = 0

	local var_108_2 = {
		arg_108_0.activeSectors[arg_108_0.activeZoneName]
	}

	if not var_108_0 and _.any(var_108_2, function(arg_109_0)
		local var_109_0 = tobool(var_0_0.IsPointInSector(arg_109_0, var_108_1))

		if var_109_0 then
			arg_108_0.activeSector = arg_109_0
		end

		return var_109_0
	end) then
		arg_108_0:emit(var_0_0.ON_ENTER_SECTOR, not var_108_0)
	elseif var_108_0 and _.all(var_108_2, function(arg_110_0)
		return not tobool(var_0_0.IsPointInSector(arg_110_0, var_108_1))
	end) then
		arg_108_0.activeSector = nil

		arg_108_0:emit(var_0_0.ON_ENTER_SECTOR, not var_108_0)
	end
end

function var_0_0.TriggerLadyDistance(arg_111_0)
	arg_111_0.dis = (arg_111_0.lady.position - arg_111_0.player.position).magnitude

	if arg_111_0.dis < var_0_0.POV_CLOSE_DISTANCE ~= tobool(arg_111_0.baseView:GetBlackboardValue("inDistance")) then
		arg_111_0.baseView:SetBlackboardValue("inDistance", arg_111_0.dis < var_0_0.POV_CLOSE_DISTANCE)
	end
end

function var_0_0.OnStickMove(arg_112_0, arg_112_1)
	arg_112_0.joystickDelta = arg_112_1
end

function var_0_0.SetPinchValue(arg_113_0, arg_113_1)
	arg_113_0.pinchValue = arg_113_1

	arg_113_0:SetCameraObrits()
end

function var_0_0.GetPOVFOV(arg_114_0)
	local var_114_0 = arg_114_0.cameras[var_0_0.CAMERA.POV].m_Lens

	return ReflectionHelp.RefGetField(typeof("Cinemachine.LensSettings"), "FieldOfView", var_114_0)
end

function var_0_0.SetPOVFOV(arg_115_0, arg_115_1)
	local var_115_0 = arg_115_0.cameras[var_0_0.CAMERA.POV].m_Lens

	ReflectionHelp.RefSetField(typeof("Cinemachine.LensSettings"), "FieldOfView", var_115_0, arg_115_1)

	arg_115_0.cameras[var_0_0.CAMERA.POV].m_Lens = var_115_0
end

function var_0_0.ShowBaseView(arg_116_0)
	arg_116_0.baseView:TempHideUI(false)
end

function var_0_0.HideBaseView(arg_117_0)
	arg_117_0.baseView:TempHideUI(true)
end

function var_0_0.RefreshSlots(arg_118_0, arg_118_1)
	local var_118_0 = arg_118_1:GetSlots()
	local var_118_1 = arg_118_1:GetFurnitures()

	arg_118_0:emit(Dorm3dScene.SHOW_BLOCK)
	table.ParallelIpairsAsync(var_118_0, function(arg_119_0, arg_119_1, arg_119_2)
		local var_119_0 = arg_119_1:GetConfigID()
		local var_119_1 = _.detect(var_118_1, function(arg_120_0)
			return arg_120_0:GetSlotID() == var_119_0
		end)
		local var_119_2 = var_119_1 and var_119_1:GetModel() or false

		if arg_118_0.slotDict[var_119_0].displayModelName == var_119_2 then
			arg_119_2()

			return
		end

		local var_119_3 = arg_118_0.slotDict[var_119_0].model

		arg_118_0.slotDict[var_119_0].displayModelName = var_119_2

		if var_119_2 == false or var_119_2 == "" then
			arg_118_0.loader:ClearRequest("slot_" .. var_119_0)

			if var_119_3 then
				setActive(var_119_3, var_119_2 == "")
			end

			arg_119_2()

			return
		end

		local var_119_4 = arg_118_0.slotDict[var_119_0].trans

		arg_118_0.loader:GetPrefab("dorm3d/furniture/prefabs/" .. var_119_2, "", function(arg_121_0)
			arg_119_2()
			assert(arg_121_0)
			setParent(arg_121_0, var_119_4)

			if var_119_3 then
				local var_121_0 = arg_121_0:GetComponentsInChildren(typeof(Renderer))

				table.IpairsCArray(var_121_0, function(arg_122_0, arg_122_1)
					LuaHelper.CopyLightMap(arg_122_1.gameObject, arg_121_0)
				end)
				setActive(var_119_3, false)
			end
		end, "slot_" .. var_119_0)
	end, function()
		arg_118_0:emit(Dorm3dScene.HIDE_BLOCK)
	end)
end

function var_0_0.ChangeCharacterPosition(arg_124_0)
	local var_124_0 = arg_124_0.furnitures:Find(arg_124_0.activeZoneName):Find("StayPoint")

	arg_124_0.lady.position = var_124_0.position
	arg_124_0.lady.rotation = var_124_0.rotation

	arg_124_0:SyncInterestTransform()
end

function var_0_0.SyncInterestTransform(arg_125_0)
	arg_125_0.ladyInterest.position = arg_125_0.ladyInterestRoot.position
	arg_125_0.ladyInterest.rotation = arg_125_0.ladyInterestRoot.rotation
end

function var_0_0.ChangePlayerPosition(arg_126_0)
	local var_126_0 = arg_126_0.furnitures:Find(arg_126_0.activeZoneName):Find("PlayerPoint").position

	arg_126_0.player.position = var_126_0
	arg_126_0.cameras[var_0_0.CAMERA.POV].transform.position = arg_126_0.playerEye.position

	local var_126_1 = arg_126_0.ladyInterest.position - arg_126_0.playerEye.position
	local var_126_2 = Quaternion.LookRotation(var_126_1).eulerAngles
	local var_126_3 = var_126_2.y
	local var_126_4 = var_126_2.x
	local var_126_5 = arg_126_0.compPov.m_HorizontalAxis

	var_126_5.Value = arg_126_0:GetNearestAngle(var_126_3, var_126_5.m_MinValue, var_126_5.m_MaxValue)
	arg_126_0.compPov.m_HorizontalAxis = var_126_5

	local var_126_6 = arg_126_0.compPov.m_VerticalAxis

	var_126_6.Value = var_126_4
	arg_126_0.compPov.m_VerticalAxis = var_126_6
end

function var_0_0.OnSwitchStaticPosition(arg_127_0)
	local var_127_0 = arg_127_0.inFurniture

	if arg_127_0.cameraFree then
		setActive(arg_127_0.cameraFree, false)

		arg_127_0.cameras[var_0_0.CAMERA.FURNITURE_FREELOOK] = nil
	end

	arg_127_0.cameraFree = var_127_0:Find("FreeLook Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))
	arg_127_0.cameras[var_0_0.CAMERA.FURNITURE_FREELOOK] = arg_127_0.cameraFree

	if arg_127_0.cameraRoleWatch then
		arg_127_0:RevertCameraOrbit()
	end

	arg_127_0.cameraRoleWatch = var_127_0:Find("RoleWatch Camera"):GetComponent(typeof(Cinemachine.CinemachineFreeLook))
	arg_127_0.cameras[var_0_0.CAMERA.ROLE_WATCH] = arg_127_0.cameraRoleWatch

	arg_127_0:RegisterOrbits(arg_127_0.cameraRoleWatch)
	arg_127_0.baseView:UpdateZoneList()
end

function var_0_0.GetAttachedFurnitureName(arg_128_0)
	return arg_128_0.contextData.inFurnitureName
end

function var_0_0.GetFurnitureByName(arg_129_0, arg_129_1)
	return underscore.detect(arg_129_0.attachedPoints, function(arg_130_0)
		return arg_130_0.name == arg_129_1
	end)
end

function var_0_0.GetSlotByID(arg_131_0, arg_131_1)
	return arg_131_0.displaySlots[arg_131_1] and arg_131_0.displaySlots[arg_131_1].trans
end

function var_0_0.GetScreenPosition(arg_132_0, arg_132_1)
	local var_132_0 = arg_132_0.raycastCamera:WorldToScreenPoint(arg_132_1)

	if var_132_0.z < 0 then
		var_132_0.x = var_132_0.x + (var_132_0.x < 0 and -1 or 1) * Screen.width
		var_132_0.y = var_132_0.y + (var_132_0.y < 0 and -1 or 1) * Screen.height
		var_132_0.z = -var_132_0.z
	end

	return var_132_0
end

function var_0_0.GetLocalPosition(arg_133_0, arg_133_1, arg_133_2)
	return LuaHelper.ScreenToLocal(arg_133_2, arg_133_1, pg.UIMgr.GetInstance().uiCameraComp)
end

function var_0_0.GetModelRoot(arg_134_0)
	return arg_134_0.modelRoot
end

function var_0_0.PlayerMove(arg_135_0, arg_135_1, arg_135_2)
	local var_135_0 = arg_135_0:GetFurnitureByName(arg_135_1)

	if not var_135_0 then
		errorMsg(arg_135_1 .. " Not Find")
		existCall(arg_135_2)

		return
	end

	if arg_135_1 == arg_135_0.contextData.inFurnitureName then
		existCall(arg_135_2)

		return
	end

	existCall(arg_135_2)

	do return end

	local var_135_1 = arg_135_0.inFurniture:Find("FreeLook Camera")
	local var_135_2 = table.indexof(arg_135_0.attachedPoints, arg_135_0.inFurniture)
	local var_135_3 = table.indexof(arg_135_0.attachedPoints, var_135_0)
	local var_135_4 = false

	if var_135_3 < var_135_2 then
		var_135_4 = true
		var_135_2, var_135_3 = var_135_3, var_135_2
	end

	local var_135_5 = "Dolly" .. var_135_2 .. "_" .. var_135_3
	local var_135_6 = arg_135_0.dollyParent:Find(var_135_5):GetComponent(typeof(Cinemachine.CinemachineSmoothPath))

	arg_135_0.compDolly.m_Path = var_135_6

	local var_135_7 = {
		move_time = 0,
		wait_time = -1
	}
	local var_135_8 = arg_135_0.contextData.groupId

	for iter_135_0, iter_135_1 in ipairs(pg.dorm3D_dolly.get_id_list_by_char_id[var_135_8] or {}) do
		local var_135_9 = pg.dorm3D_dolly[iter_135_1]

		if var_135_9.name == var_135_5 then
			var_135_7 = var_135_9

			break
		end
	end

	local var_135_10 = var_135_0:Find("Interest")
	local var_135_11 = var_135_0:Find("StayPoint")

	seriesAsync({
		function(arg_136_0)
			arg_135_0:emit(Dorm3dScene.SHOW_BLOCK)

			arg_135_0.cameraAim.transform.position = var_135_1.transform.position
			arg_135_0.cameraAim2.transform.position = var_135_1.transform.position

			arg_135_0:ActiveCamera(arg_135_0.cameraAim2)
			arg_136_0()
		end,
		function(arg_137_0)
			local var_137_0 = false

			local function var_137_1()
				if var_137_0 then
					return
				end

				var_137_0 = true

				arg_137_0()
			end

			seriesAsync({
				function(arg_139_0)
					local var_139_0 = arg_135_0.ladyAgent

					var_139_0.enabled = true
					var_139_0.destination = var_135_11.position
					var_139_0.speed = 0
					arg_135_0.moveTimer = waitUntil(function()
						arg_135_0:WalkByRootMotionLoop(var_139_0, arg_135_0.ladyAnimator)

						return var_139_0.remainingDistance < 0.1
					end, function()
						var_139_0.enabled = false

						arg_139_0()
					end)
				end,
				function(arg_142_0)
					local var_142_0 = arg_135_0.lady.rotation
					local var_142_1 = var_135_11.rotation:ToEulerAngles().y - var_142_0:ToEulerAngles().y

					if var_142_1 < -180 then
						var_142_1 = var_142_1 + 360
					elseif var_142_1 > 180 then
						var_142_1 = var_142_1 - 360
					end

					arg_135_0.ladyAnimator:SetFloat("Speed", 0)
					arg_135_0.ladyAnimator:SetBool("Turn", true)
					arg_135_0.ladyAnimator:SetFloat("TurnAngle", var_142_1)
					arg_135_0:RegisterAnimEventCallback("TurnEnd", function()
						arg_135_0.ladyAnimator:SetFloat("TurnAngle", 0)
						arg_135_0.ladyAnimator:SetBool("Turn", false)
						arg_135_0:SyncInterestTransform()
						arg_142_0()
					end)
				end,
				var_137_1
			})

			if arg_135_0.moveWaitTimer then
				arg_135_0.moveWaitTimer:Stop()

				arg_135_0.moveWaitTimer = nil
			end

			local var_137_2 = var_135_7.wait_time

			if var_137_2 > 0 then
				arg_135_0.moveWaitTimer = Timer.New(var_137_1, var_137_2, 1, true)

				arg_135_0.moveWaitTimer:Start()
			elseif var_137_2 == 0 then
				var_137_1()
			end
		end,
		function(arg_144_0)
			arg_135_0:ActiveCamera(arg_135_0.cameraAim)

			arg_135_0.cameraAim.LookAt = var_135_10

			local var_144_0 = var_135_7.move_time
			local var_144_1 = arg_135_0.compDolly.m_Path.PathLength

			if var_144_0 <= 0 then
				var_144_0 = var_144_1 / 1
			end

			arg_135_0:managedTween(LeanTween.value, arg_144_0, go(arg_135_0.cameraAim), 0, 1, var_144_0):setOnUpdate(System.Action_float(function(arg_145_0)
				local var_145_0 = var_135_4 and 1 - arg_145_0 or arg_145_0

				arg_135_0.compDolly.m_PathPosition = var_144_1 * var_145_0
			end))
		end,
		function(arg_146_0)
			arg_135_0.activeZoneName = var_135_0.name
			arg_135_0.contextData.inFurnitureName = arg_135_0.activeZoneName
			arg_135_0.inFurniture = var_135_0
			arg_135_0.inFurnitureZone = _.detect(arg_135_0.zoneDatas, function(arg_147_0)
				return arg_147_0:GetWatchCameraName() == arg_135_0.contextData.inFurnitureName
			end)

			arg_135_0:TriggerLadyDistance()
			arg_135_0:CheckInSector()
			arg_135_0:OnSwitchStaticPosition()
			arg_146_0()
		end,
		function(arg_148_0)
			arg_135_0:emit(Dorm3dScene.HIDE_BLOCK)
			arg_148_0()
		end
	}, arg_135_2)
end

function var_0_0.ShiftZone(arg_149_0, arg_149_1, arg_149_2)
	local var_149_0 = arg_149_0:GetFurnitureByName(arg_149_1)

	if not var_149_0 then
		errorMsg(arg_149_1 .. " Not Find")
		existCall(arg_149_2)

		return
	end

	if arg_149_1 == arg_149_0.contextData.inFurnitureName then
		existCall(arg_149_2)

		return
	end

	seriesAsync({
		function(arg_150_0)
			arg_149_0:emit(Dorm3dScene.SHOW_BLOCK)
			arg_149_0:ShowBlackScreen(true, arg_150_0)
		end,
		function(arg_151_0)
			arg_149_0.activeZoneName = var_149_0.name
			arg_149_0.contextData.inFurnitureName = arg_149_0.activeZoneName
			arg_149_0.inFurniture = var_149_0
			arg_149_0.inFurnitureZone = _.detect(arg_149_0.zoneDatas, function(arg_152_0)
				return arg_152_0:GetWatchCameraName() == arg_149_0.contextData.inFurnitureName
			end)

			arg_149_0:ChangeCharacterPosition()
			arg_149_0:ChangePlayerPosition()
			arg_149_0:TriggerLadyDistance()
			arg_149_0:CheckInSector()
			arg_149_0:OnSwitchStaticPosition()
			arg_151_0()
		end,
		function(arg_153_0)
			arg_149_0:ShowBlackScreen(false, arg_153_0)
		end,
		function(arg_154_0)
			arg_149_0:emit(Dorm3dScene.HIDE_BLOCK)
			arg_154_0()
		end
	}, arg_149_2)
end

function var_0_0.WalkByRootMotionLoop(arg_155_0, arg_155_1, arg_155_2)
	if arg_155_1.pathPending then
		arg_155_2:SetFloat("Speed", 0)

		return
	end

	arg_155_2:SetFloat("Speed", 1)

	local var_155_0 = arg_155_1.path.corners

	if var_155_0.Length > 1 then
		local var_155_1 = var_155_0[1] - arg_155_1.transform.position

		var_155_1.y = 0

		local var_155_2 = Quaternion.LookRotation(var_155_1)
		local var_155_3 = arg_155_1.transform.rotation
		local var_155_4 = 1
		local var_155_5 = Damp(1, var_155_4, Time.deltaTime)

		arg_155_1.transform.rotation = Quaternion.Lerp(var_155_3, var_155_2, var_155_5)
	end
end

function var_0_0.ActiveCamera(arg_156_0, arg_156_1)
	if isActive(arg_156_1) then
		arg_156_0:OnCameraBlendFinished(arg_156_1)
	end

	table.Foreach(arg_156_0.cameras, function(arg_157_0, arg_157_1)
		setActive(arg_157_1, arg_157_1 == arg_156_1)
	end)
end

function var_0_0.ShowBlackScreen(arg_158_0, arg_158_1, arg_158_2)
	local var_158_0 = arg_158_0.blackSceneInfo or {
		color = "#000000",
		time = 0.3,
		delay = arg_158_1 and 0 or 0.3
	}

	setImageColor(arg_158_0.blackLayer, Color.NewHex(var_158_0.color))
	setActive(arg_158_0.blackLayer, true)
	setCanvasGroupAlpha(arg_158_0.blackLayer, arg_158_1 and 0 or 1)
	arg_158_0:managedTween(LeanTween.alphaCanvas, function()
		if not arg_158_1 then
			setActive(arg_158_0.blackLayer, false)
		end

		existCall(arg_158_2)
	end, GetComponent(arg_158_0.blackLayer, typeof(CanvasGroup)), arg_158_1 and 1 or 0, var_158_0.time):setDelay(var_158_0.delay)
end

function var_0_0.RegisterOrbits(arg_160_0, arg_160_1)
	arg_160_0.orbits = {
		original = arg_160_1.m_Orbits
	}
	arg_160_0.orbits.current = _.range(3):map(function(arg_161_0)
		local var_161_0 = arg_160_0.orbits.original[arg_161_0 - 1]

		return Cinemachine.CinemachineFreeLook.Orbit.New(var_161_0.m_Height, var_161_0.m_Radius)
	end)
	arg_160_0.surroudCamera = arg_160_1
end

function var_0_0.SetCameraObrits(arg_162_0)
	local var_162_0 = arg_162_0.surroudCamera

	if not var_162_0 then
		return
	end

	local var_162_1 = arg_162_0.orbits.original[1]

	for iter_162_0 = 0, #arg_162_0.orbits.current - 1 do
		local var_162_2 = arg_162_0.orbits.current[iter_162_0 + 1]
		local var_162_3 = arg_162_0.orbits.original[iter_162_0]

		var_162_2.m_Height = math.lerp(var_162_1.m_Height, var_162_3.m_Height, arg_162_0.pinchValue)
		var_162_2.m_Radius = var_162_3.m_Radius * arg_162_0.pinchValue
	end

	var_162_0.m_Orbits = arg_162_0.orbits.current
end

function var_0_0.RevertCameraOrbit(arg_163_0)
	local var_163_0 = arg_163_0.surroudCamera

	if not var_163_0 then
		return
	end

	for iter_163_0 = 0, #arg_163_0.orbits.current - 1 do
		local var_163_1 = arg_163_0.orbits.current[iter_163_0 + 1]
		local var_163_2 = arg_163_0.orbits.original[iter_163_0]

		var_163_1.m_Height = var_163_2.m_Height
		var_163_1.m_Radius = var_163_2.m_Radius
	end

	var_163_0.m_Orbits = arg_163_0.orbits.current
	arg_163_0.surroudCamera = nil
end

function var_0_0.ActiveStateCamera(arg_164_0, arg_164_1, arg_164_2)
	local var_164_0 = {
		base = function(arg_165_0)
			arg_164_0:RegisterCameraBlendFinished(arg_164_0.cameras[var_0_0.CAMERA.POV], arg_165_0)
			arg_164_0:ActiveCamera(arg_164_0.cameras[var_0_0.CAMERA.POV])
		end,
		watch = function(arg_166_0)
			arg_164_0:RegisterCameraBlendFinished(arg_164_0.cameras[var_0_0.CAMERA.ROLE], arg_166_0)
			arg_164_0:ActiveCamera(arg_164_0.cameras[var_0_0.CAMERA.ROLE])
		end,
		walk = function(arg_167_0)
			arg_164_0:RegisterCameraBlendFinished(arg_164_0.cameras[var_0_0.CAMERA.POV], arg_167_0)
			arg_164_0:ActiveCamera(arg_164_0.cameras[var_0_0.CAMERA.POV])
		end,
		ik = function(arg_168_0)
			arg_168_0()
		end,
		touch = function(arg_169_0)
			arg_164_0.pinchValue = 1

			arg_164_0:SetCameraObrits()

			local var_169_0 = arg_164_0.cameraRoleWatch.m_XAxis

			var_169_0.Value = 180
			arg_164_0.cameraRoleWatch.m_XAxis = var_169_0

			local var_169_1 = arg_164_0.cameraRoleWatch.m_YAxis

			var_169_1.Value = 0.7
			arg_164_0.cameraRoleWatch.m_YAxis = var_169_1

			arg_164_0:SyncInterestTransform()
			arg_164_0:RegisterCameraBlendFinished(arg_164_0.cameraRoleWatch, arg_169_0)
			arg_164_0:ActiveCamera(arg_164_0.cameraRoleWatch)
		end,
		gift = function(arg_170_0)
			arg_164_0:RegisterCameraBlendFinished(arg_164_0.cameras[var_0_0.CAMERA.GIFT], arg_170_0)
			arg_164_0:ActiveCamera(arg_164_0.cameras[var_0_0.CAMERA.GIFT])
		end,
		standby = function(arg_171_0)
			arg_164_0.cameras[var_0_0.CAMERA.ROLE2].transform.position = arg_164_0.cameraRole.transform.position

			arg_164_0:RegisterCameraBlendFinished(arg_164_0.cameras[var_0_0.CAMERA.ROLE2], arg_171_0)
			arg_164_0:ActiveCamera(arg_164_0.cameras[var_0_0.CAMERA.ROLE2])
		end,
		talk = function(arg_172_0)
			arg_164_0:RegisterCameraBlendFinished(arg_164_0.cameras[var_0_0.CAMERA.TALK], arg_172_0)
			arg_164_0:ActiveCamera(arg_164_0.cameras[var_0_0.CAMERA.TALK])
		end
	}
	local var_164_1 = {}

	table.insert(var_164_1, function(arg_173_0)
		switch(arg_164_1, var_164_0, arg_173_0, arg_173_0)
	end)
	seriesAsync(var_164_1, arg_164_2)
end

function var_0_0.WatchModeInteractive(arg_174_0)
	if arg_174_0.inFurniture.name ~= "Bed" then
		arg_174_0:PlaySingleAction("Bow")
	end
end

function var_0_0.SetIKStatus(arg_175_0, arg_175_1, arg_175_2)
	arg_175_0.ikConfig = arg_175_1

	arg_175_0:SwitchAnim(arg_175_1.character_action)

	local var_175_0 = arg_175_0.furnitures:Find(arg_175_1.character_position)
	local var_175_1 = var_175_0:Find("IKCamera")

	assert(var_175_1, "Missing IKCamera in Furniture", var_175_0.name)

	arg_175_0.cameras[var_0_0.CAMERA.IK_WATCH] = var_175_1:GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))

	arg_175_0:ActiveCamera(arg_175_0.cameras[var_0_0.CAMERA.IK_WATCH])

	arg_175_0.lady.position = var_175_0:Find("StayPoint").position
	arg_175_0.lady.rotation = var_175_0:Find("StayPoint").rotation

	arg_175_0:EnableCloth(arg_175_1.use_cloth == 1)
	existCall(arg_175_2)
	arg_175_0:ResetIKTipTimer()
end

function var_0_0.ExitIKStatus(arg_176_0, arg_176_1, arg_176_2)
	setActive(arg_176_0.cameras[var_0_0.CAMERA.IK_WATCH], false)

	arg_176_0.cameras[var_0_0.CAMERA.IK_WATCH] = nil

	arg_176_0:EnableCloth(false)
	arg_176_0:SwitchAnim(arg_176_1.character_action)
	onNextTick(function()
		if arg_176_1.character_position then
			arg_176_0.activeZoneName = arg_176_1.character_position
		end

		arg_176_0:ChangeCharacterPosition()
		arg_176_0:TriggerLadyDistance()
		arg_176_0:CheckInSector()

		arg_176_0.ikConfig = nil

		existCall(arg_176_2)
	end)
end

function var_0_0.EnableTouchIK(arg_178_0, arg_178_1, arg_178_2)
	arg_178_0.enableIKTip = arg_178_1

	if arg_178_1 then
		setActive(arg_178_0.ladyCollider, false)
		_.each(arg_178_0.ladyTouchColliders, function(arg_179_0)
			setActive(arg_179_0, true)
		end)

		arg_178_0.activeIKLayers = {}

		table.Foreach(arg_178_2, function(arg_180_0, arg_180_1)
			local var_180_0 = Dorm3dIK.New({
				configId = arg_180_0
			})

			table.insert(arg_178_0.activeIKLayers, {
				ikData = var_180_0,
				action = arg_180_1
			})
		end)
	else
		setActive(arg_178_0.ladyCollider, true)
		_.each(arg_178_0.ladyTouchColliders, function(arg_181_0)
			setActive(arg_181_0, false)
		end)

		arg_178_0.activeIKLayers = {}

		setActive(arg_178_0.baseView:GetIKTipsRootTF(), false)
	end
end

function var_0_0.EnableIKLayer(arg_182_0, arg_182_1)
	warning("ENABLEIK", arg_182_1:GetConfigID())

	local var_182_0 = arg_182_1:GetControllerName()
	local var_182_1 = arg_182_0.ladyIKRoot:Find(var_182_0):GetComponent(typeof(RootMotion.FinalIK.IKExecutionOrder))
	local var_182_2 = tf(var_182_1):Find("Container")
	local var_182_3
	local var_182_4 = arg_182_1:GetActionTriggerParams()

	if var_182_4[1] == Dorm3dIK.ACTION_TRIGGER.RELEASE_ON_TARGET or var_182_4[1] == Dorm3dIK.ACTION_TRIGGER.TOUCH_TARGET then
		var_182_3 = arg_182_1:GetTriggerRect()
	end

	local var_182_5 = var_182_2:Find("SubTargets")
	local var_182_6 = {}

	assert(var_182_5)

	local var_182_7 = arg_182_1:GetSubTargets()

	_.each(var_182_7, function(arg_183_0)
		local var_183_0 = var_182_5:Find(arg_183_0[1])
		local var_183_1 = var_183_0:Find("Plane")
		local var_183_2 = var_183_0:Find("Target")
		local var_183_3 = var_0_0.TransformMesh(var_183_1:GetComponent(typeof(UnityEngine.MeshCollider)))
		local var_183_4 = arg_182_0.ladyBoneMaps[arg_183_0[1]]

		var_183_3.origin = var_183_4.position
		var_183_2.position = var_183_4.position

		local var_183_5 = {
			planeData = var_183_3,
			target = var_183_2,
			useOffset = tobool(arg_183_0)
		}

		table.insert(var_182_6, var_183_5)
	end)

	arg_182_0.ikNextCheckStamp = Time.time + var_0_0.IK_STATUS_DELTA

	setActive(var_182_1, true)
	setActive(arg_182_0.baseView:GetIKHandTF(), true)
	eachChild(arg_182_0.baseView:GetIKHandTF(), function(arg_184_0)
		setActive(arg_184_0, false)
	end)
	arg_182_0:StopIKHandTimer()
	setActive(arg_182_0.baseView:GetIKHandTF():Find("Begin"), true)

	arg_182_0.ikHandTimer = Timer.New(function()
		setActive(arg_182_0.baseView:GetIKHandTF():Find("Begin"), false)
		setActive(arg_182_0.baseView:GetIKHandTF():Find("Normal"), true)
	end, 0.5, 1)

	arg_182_0.ikHandTimer:Start()
	arg_182_0:emit(var_0_0.ON_IK_STATUS_CHANGED, arg_182_1:GetConfigID(), var_0_0.IK_STATUS.BEGIN)
	pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataTouch(arg_182_0.apartment.configId, arg_182_0.apartment.level, arg_182_0.ikConfig.character_action, arg_182_1:GetTriggerParams()[2]))

	return {
		ikData = arg_182_1,
		list = var_182_1,
		subPlanes = var_182_6,
		rect = arg_182_1:GetRect(),
		triggerRect = var_182_3
	}
end

function var_0_0.DisableIKLayer(arg_186_0, arg_186_1)
	local var_186_0 = arg_186_1:GetControllerName()
	local var_186_1 = arg_186_0.ladyIKRoot:Find(var_186_0):GetComponent(typeof(RootMotion.FinalIK.IKExecutionOrder))

	setActive(var_186_1, false)
	table.IpairsCArray(var_186_1.IKComponents, function(arg_187_0, arg_187_1)
		arg_187_1:GetIKSolver():FixTransforms()
	end)
	arg_186_0:StopIKHandTimer()
	setActive(arg_186_0.baseView:GetIKHandTF():Find("Begin"), false)
	setActive(arg_186_0.baseView:GetIKHandTF():Find("Normal"), false)
	setActive(arg_186_0.baseView:GetIKHandTF():Find("End"), true)

	arg_186_0.ikHandTimer = Timer.New(function()
		setActive(arg_186_0.baseView:GetIKHandTF():Find("End"), false)
		setActive(arg_186_0.baseView:GetIKHandTF(), false)
	end, 0.5, 1)

	arg_186_0.ikHandTimer:Start()
end

function var_0_0.StopIKHandTimer(arg_189_0)
	if not arg_189_0.ikHandTimer then
		return
	end

	arg_189_0.ikHandTimer:Stop()

	arg_189_0.ikHandTimer = nil
end

function var_0_0.PlayIKAction(arg_190_0, arg_190_1)
	local var_190_0 = _.detect(arg_190_0.activeIKLayers, function(arg_191_0)
		return arg_191_0.ikData == arg_190_1
	end)

	if not var_190_0 then
		return
	end

	warning("Trigger IK", arg_190_1:GetConfigID())

	arg_190_0.ikNextCheckStamp = nil
	arg_190_0.enableIKTip = nil

	arg_190_0:emit(var_0_0.ON_IK_STATUS_CHANGED, arg_190_1:GetConfigID(), var_0_0.IK_STATUS.TRIGGER)

	local var_190_1 = var_190_0.action

	if not var_190_1 then
		return
	end

	arg_190_0.blockIK = true

	existCall(var_190_1, function()
		arg_190_0.enableIKTip = true

		arg_190_0:ResetIKTipTimer()

		arg_190_0.blockIK = nil
	end)
end

function var_0_0.ResetIKTipTimer(arg_193_0)
	if not arg_193_0.enableIKTip then
		return
	end

	arg_193_0.nextTipIKTime = Time.time + var_0_0.IK_TIP_WAIT_TIME
end

function var_0_0.EnableHeadIK(arg_194_0, arg_194_1)
	arg_194_0.ladyHeadIKComp.enableIk = arg_194_1
end

function var_0_0.HideCharacter(arg_195_0)
	setActive(arg_195_0.lady, false)
end

function var_0_0.RevertCharacter(arg_196_0)
	setActive(arg_196_0.lady, true)
end

function var_0_0.HideCharacterBylayer(arg_197_0)
	pg.ViewUtils.SetLayer(arg_197_0.lady, Layer.Environment3D)

	GetComponent(arg_197_0.lady, "BLHXCharacterPropertiesController").enabled = false
end

function var_0_0.RevertCharacterBylayer(arg_198_0)
	pg.ViewUtils.SetLayer(arg_198_0.lady, Layer.Character3D)

	GetComponent(arg_198_0.lady, "BLHXCharacterPropertiesController").enabled = true
end

function var_0_0.EnterFurnitureWatchMode(arg_199_0)
	arg_199_0.baseView:SetBlackboardValue("inLockLayer", true)
	arg_199_0:HideCharacter()
end

function var_0_0.ExitFurnitureWatchMode(arg_200_0)
	arg_200_0:HideFurnitureSlots()

	local var_200_0 = arg_200_0.cameras[var_0_0.CAMERA.POV]

	seriesAsync({
		function(arg_201_0)
			arg_200_0:emit(Dorm3dScene.SHOW_BLOCK)
			arg_200_0:ShowBlackScreen(true, arg_201_0)
		end,
		function(arg_202_0)
			arg_200_0:RevertCharacter()
			arg_200_0.baseView:SetBlackboardValue("inLockLayer", false)
			arg_200_0:RegisterCameraBlendFinished(var_200_0, arg_202_0)
			arg_200_0:ActiveCamera(var_200_0)
		end,
		function(arg_203_0)
			arg_200_0:ShowBlackScreen(false, arg_203_0)
		end
	}, function()
		arg_200_0:emit(Dorm3dScene.HIDE_BLOCK)
	end)
	arg_200_0:RefreshSlots(arg_200_0.apartment)
end

function var_0_0.SwitchFurnitureZone(arg_205_0, arg_205_1)
	local var_205_0 = arg_205_0:GetFurnitureByName(arg_205_1:GetWatchCameraName()):Find("FurnitureWatch Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))

	if arg_205_0.cameraFurnitureWatch and arg_205_0.cameraFurnitureWatch ~= var_205_0 then
		arg_205_0:UnRegisterCameraBlendFinished(arg_205_0.cameraFurnitureWatch)
		setActive(arg_205_0.cameraFurnitureWatch, false)
	end

	arg_205_0.cameraFurnitureWatch = var_205_0
	arg_205_0.cameras[var_0_0.CAMERA.FURNITURE_WATCH] = arg_205_0.cameraFurnitureWatch

	arg_205_0:RegisterCameraBlendFinished(arg_205_0.cameraFurnitureWatch, function()
		arg_205_0:emit(Dorm3dScene.HIDE_BLOCK)
	end)
	arg_205_0:emit(Dorm3dScene.SHOW_BLOCK)
	arg_205_0:ActiveCamera(arg_205_0.cameraFurnitureWatch)
end

function var_0_0.HideFurnitureSlots(arg_207_0)
	if arg_207_0.displaySlots then
		arg_207_0:UpdateDisplaySlots({})
		table.Foreach(arg_207_0.displaySlots, function(arg_208_0, arg_208_1)
			local var_208_0 = arg_208_1.trans

			if IsNil(var_208_0:Find("Selector")) then
				return
			end

			setActive(var_208_0:Find("Selector"), false)
		end)

		arg_207_0.displaySlots = nil
	end
end

function var_0_0.DisplayFurnitureSlots(arg_209_0, arg_209_1)
	arg_209_0:HideFurnitureSlots()

	arg_209_0.displaySlots = {}

	_.each(arg_209_1, function(arg_210_0)
		arg_209_0.displaySlots[arg_210_0] = arg_209_0.slotDict[arg_210_0]

		if not arg_209_0.displaySlots[arg_210_0] then
			errorMsg("Slot " .. arg_210_0 .. " Not Binding Scene Object")

			return
		end

		local var_210_0 = arg_209_0.displaySlots[arg_210_0].trans

		if var_210_0:Find("Selector") then
			setActive(var_210_0:Find("Selector"), true)
		end
	end)
end

function var_0_0.UpdateDisplaySlots(arg_211_0, arg_211_1)
	table.Foreach(arg_211_0.displaySlots, function(arg_212_0, arg_212_1)
		local var_212_0 = arg_212_1.trans

		if not IsNil(var_212_0:Find("Selector")) then
			setActive(var_212_0:Find("Selector/Normal"), arg_211_1[arg_212_0] == 0)
			setActive(var_212_0:Find("Selector/Active"), arg_211_1[arg_212_0] == 1)
			setActive(var_212_0:Find("Selector/Ban"), arg_211_1[arg_212_0] == 2)
		end

		local var_212_1 = arg_211_0.slotDict[arg_212_0].model
		local var_212_2 = arg_211_0.slotDict[arg_212_0].displayModelName

		if var_212_2 and var_212_2 ~= "" then
			var_212_1 = var_212_0:GetChild(var_212_0.childCount - 1)
		end

		local function var_212_3(arg_213_0, arg_213_1)
			local var_213_0 = arg_213_0:GetComponentsInChildren(typeof(Renderer))

			table.IpairsCArray(var_213_0, function(arg_214_0, arg_214_1)
				local var_214_0 = arg_214_1.material

				if var_214_0 and var_214_0:HasProperty("_FinalTint") then
					var_214_0:SetColor("_FinalTint", arg_213_1)
				end
			end)
		end

		if var_212_1 then
			if arg_211_1[arg_212_0] == 1 then
				var_212_3(var_212_1, Color.NewHex("3F83AE73"))
			else
				var_212_3(var_212_1, Color.New(0, 0, 0, 0))
			end
		end
	end)
end

function var_0_0.EnterPhotoMode(arg_215_0, arg_215_1, arg_215_2)
	arg_215_0.baseView:SetBlackboardValue("inLockLayer", true)
	arg_215_0:emit(Dorm3dScene.ENABLE_SCENEBLOCK, true)
	seriesAsync({
		function(arg_216_0)
			arg_215_0:ShowBlackScreen(true, arg_216_0)
		end,
		function(arg_217_0)
			arg_215_0:SwitchAnim(arg_215_2)
			onNextTick(function()
				arg_215_0:ResetCharPosByZone(arg_215_1)
				arg_215_0:SyncInterestTransform()
			end)

			local var_217_0 = arg_215_0.cameraPhoto
			local var_217_1 = var_217_0.m_XAxis

			var_217_1.Value = 180
			var_217_0.m_XAxis = var_217_1

			local var_217_2 = var_217_0.m_YAxis

			var_217_2.Value = 0.7
			var_217_0.m_YAxis = var_217_2

			arg_215_0:RegisterOrbits(arg_215_0.cameraPhoto)

			arg_215_0.pinchValue = 1

			arg_215_0:SetCameraObrits()
			arg_215_0:RegisterCameraBlendFinished(var_217_0, arg_217_0)
			arg_215_0:ActiveCamera(var_217_0)
		end,
		function(arg_219_0)
			arg_215_0:ShowBlackScreen(false, arg_219_0)
		end
	}, function()
		arg_215_0.baseView:EnableJoystick(true)
	end)
end

function var_0_0.ExitPhotoMode(arg_221_0)
	arg_221_0:emit(Dorm3dScene.SHOW_BLOCK)
	arg_221_0.baseView:EnableJoystick(false)
	seriesAsync({
		function(arg_222_0)
			arg_221_0:ShowBlackScreen(true, arg_222_0)
		end,
		function(arg_223_0)
			arg_221_0:RevertCameraOrbit()
			arg_221_0:SwitchAnim(var_0_0.ANIM.IDLE)
			onNextTick(function()
				arg_221_0:ChangeCharacterPosition()
			end)

			local var_223_0 = arg_221_0.cameras[var_0_0.CAMERA.POV]

			arg_221_0:RegisterCameraBlendFinished(var_223_0, arg_223_0)
			arg_221_0:ActiveCamera(var_223_0)
		end,
		function(arg_225_0)
			arg_221_0:ShowBlackScreen(false, arg_225_0)
		end
	}, function()
		arg_221_0:RefreshSlots(arg_221_0.apartment)
		arg_221_0.baseView:SetBlackboardValue("inLockLayer", false)
		arg_221_0:emit(Dorm3dScene.HIDE_BLOCK)
		arg_221_0:emit(Dorm3dScene.ENABLE_SCENEBLOCK, false)
	end)
end

function var_0_0.SwitchCameraZone(arg_227_0, arg_227_1, arg_227_2, arg_227_3)
	arg_227_0:emit(var_0_0.SHOW_BLOCK)
	seriesAsync({
		function(arg_228_0)
			arg_227_0:ShowBlackScreen(true, arg_228_0)
		end,
		function(arg_229_0)
			arg_227_0:SwitchAnim(arg_227_2)
			onNextTick(function()
				arg_227_0:ResetCharPosByZone(arg_227_1)
				arg_227_0:SyncInterestTransform()
				arg_229_0()
			end)
		end,
		function(arg_231_0)
			arg_227_0:ShowBlackScreen(false, arg_231_0)
		end
	}, function()
		arg_227_0:emit(var_0_0.HIDE_BLOCK)
		existCall(arg_227_3)
	end)
end

function var_0_0.SwitchPhotoCamera(arg_233_0)
	local var_233_0 = arg_233_0.ladyInterest.position
	local var_233_1 = arg_233_0.ladyInterestRoot.position
	local var_233_2 = (var_233_1 - var_233_0).magnitude * 4

	LeanTween.move(go(arg_233_0.ladyInterest), var_233_1, var_233_2):setEase(LeanTweenType.easeInOutSine)
end

function var_0_0.ResetPhotoCameraPosition(arg_234_0)
	local var_234_0 = arg_234_0.cameraPhoto
	local var_234_1 = var_234_0.m_XAxis

	var_234_1.Value = 180
	var_234_0.m_XAxis = var_234_1

	local var_234_2 = var_234_0.m_YAxis

	var_234_2.Value = 0.7
	var_234_0.m_YAxis = var_234_2
end

function var_0_0.ResetCharPosByZone(arg_235_0, arg_235_1)
	local var_235_0 = arg_235_0:GetFurnitureByName(arg_235_1:GetWatchCameraName()):Find("StayPoint")

	arg_235_0.lady.position = var_235_0.position
	arg_235_0.lady.rotation = var_235_0.rotation
end

function var_0_0.GetNearestAngle(arg_236_0, arg_236_1, arg_236_2, arg_236_3)
	if arg_236_3 < arg_236_2 then
		arg_236_3 = arg_236_3 + 360
	end

	if arg_236_2 <= arg_236_1 and arg_236_1 <= arg_236_3 then
		return arg_236_1
	end

	local var_236_0 = (arg_236_2 + arg_236_3) / 2

	arg_236_1 = var_236_0 - Mathf.DeltaAngle(arg_236_1, var_236_0)
	arg_236_1 = math.clamp(arg_236_1, arg_236_2, arg_236_3)

	return arg_236_1
end

function var_0_0.PlayTimeline(arg_237_0, arg_237_1, arg_237_2)
	local var_237_0 = {}

	if arg_237_0.waitForTimeline then
		table.insert(var_237_0, function(arg_238_0)
			local var_238_0 = arg_237_0.waitForTimeline

			arg_237_0.waitForTimeline = nil

			var_238_0()
			arg_238_0()
		end)
	end

	table.insert(var_237_0, function(arg_239_0)
		arg_237_0:LoadTimelineScene(arg_237_1.name, false, arg_239_0)
	end)

	if arg_237_1.scene and arg_237_1.sceneRoot then
		table.insert(var_237_0, function(arg_240_0)
			arg_237_0:ChangeArtScene(arg_237_1.scene .. "|" .. arg_237_1.sceneRoot, arg_240_0)
		end)
	end

	table.insert(var_237_0, function(arg_241_0)
		local var_241_0 = GameObject.Find("[sequence]").transform
		local var_241_1 = var_241_0:GetComponent(typeof(UnityEngine.Playables.PlayableDirector))
		local var_241_2 = GameObject.Find("[actor]").transform:GetComponentsInChildren(typeof(Animator))

		table.IpairsCArray(var_241_2, function(arg_242_0, arg_242_1)
			GetOrAddComponent(arg_242_1.transform, typeof(DftAniEvent))
		end)
		var_241_1:Stop()

		var_241_1.extrapolationMode = ReflectionHelp.RefGetField(typeof("UnityEngine.Playables.DirectorWrapMode"), "Hold", nil)

		if arg_237_1.time then
			var_241_1.time = math.clamp(arg_237_1.time, 0, var_241_1.duration)
		end

		local var_241_3 = {}

		GetOrAddComponent(var_241_0, "DftCommonSignalReceiver"):SetCommonEvent(function(arg_243_0)
			switch(arg_243_0.stringParameter, {
				TimelinePause = function()
					arg_237_0.timelineSpeed = 0

					setDirectorSpeed(var_241_1, arg_237_0.timelineSpeed)
				end,
				TimelineResume = function()
					arg_237_0.timelineSpeed = 0

					setDirectorSpeed(var_241_1, arg_237_0.timelineSpeed)
				end,
				TimelinePlayOnTime = function()
					if arg_243_0.intParameter == 0 or arg_243_0.intParameter == var_241_3.selectIndex then
						var_241_1.time = arg_243_0.floatParameter
					end
				end,
				TimelineSelectStart = function()
					var_241_3.selectIndex = nil

					if arg_237_1.options then
						local var_247_0 = arg_237_1.options[arg_243_0.intParameter]

						arg_237_0.baseView:DoTimelineOption(var_247_0, function(arg_248_0)
							var_241_3.selectIndex = arg_248_0
							var_241_3.optionIndex = var_247_0[arg_248_0].flag
						end)
					end
				end,
				TimelineTouchStart = function()
					var_241_3.selectIndex = nil

					if arg_237_1.touchs then
						local var_249_0 = arg_237_1.touchs[arg_243_0.intParameter]

						arg_237_0.baseView:DoTimelineTouch(arg_237_1.touchs[arg_243_0.intParameter], function(arg_250_0)
							var_241_3.selectIndex = arg_250_0
							var_241_3.optionIndex = var_249_0[arg_250_0].flag
						end)
					end
				end,
				TimelineSelectLoop = function()
					if not var_241_3.selectIndex then
						var_241_1.time = arg_243_0.floatParameter
					end
				end,
				TimelineEnd = function()
					warning("TimelineEnd")

					var_241_3.finish = true

					var_241_1:Pause()
				end
			}, function()
				warning("other event trigger:" .. arg_243_0.stringParameter)
			end)

			if var_241_3.finish then
				arg_237_0.timelineMark = var_241_3

				arg_241_0()
			end
		end)

		if defaultValue(arg_237_0.timelineSpeed, 1) ~= 1 then
			arg_237_0.timelineSpeed = 1

			setDirectorSpeed(var_241_1, arg_237_0.timelineSpeed)
		end

		arg_237_0:HideCharacter()
		setActive(arg_237_0.mainCameraTF, false)

		arg_237_0.bindingConfig = arg_237_0.bindingConfig or _.reduce(pg.dorm3d_timeline_dynamic_binding, {}, function(arg_254_0, arg_254_1)
			if arg_254_1.track_name then
				arg_254_0[arg_254_1.track_name] = arg_254_1.object_name
			end

			return arg_254_0
		end)

		eachChild(var_241_1, function(arg_255_0)
			local var_255_0 = arg_255_0:GetComponent(typeof(UnityEngine.Playables.PlayableDirector))

			if not var_255_0 then
				return
			end

			table.IpairsCArray(TimelineHelper.GetTimelineTracks(var_255_0), function(arg_256_0, arg_256_1)
				if arg_237_0.bindingConfig[arg_256_1.name] then
					local var_256_0 = GameObject.Find(arg_237_0.bindingConfig[arg_256_1.name])

					if var_256_0 then
						TimelineHelper.SetSceneBinding(var_255_0, arg_256_1, var_256_0)
					else
						warning(string.format("轨道%s需要绑定的物体%s不存在", arg_256_1.name, arg_237_0.bindingConfig[arg_256_1.name]))
					end
				end
			end)
		end)

		local var_241_4 = GameObject.Find("[subtitle]")

		if var_241_4 then
			var_241_4:GetComponent(typeof(Canvas)).worldCamera = pg.UIMgr.GetInstance().overlayCameraComp
		end

		var_241_1:Play()
		var_241_1:Evaluate()
	end)
	table.insert(var_237_0, function(arg_257_0)
		arg_237_0:ShowBlackScreen(true, arg_257_0)
	end)

	if arg_237_1.scene and arg_237_1.sceneRoot then
		local var_237_1 = arg_237_0.currentSceneInfo

		table.insert(var_237_0, function(arg_258_0)
			arg_237_0:ChangeArtScene(var_237_1, arg_258_0)
		end)
	end

	seriesAsync(var_237_0, function()
		arg_237_0:UnloadTimelineScene(arg_237_1.name, false)
		arg_237_0:RevertCharacter()
		setActive(arg_237_0.mainCameraTF, true)

		local var_259_0 = arg_237_0.timelineMark

		arg_237_0.timelineMark = nil

		existCall(arg_237_2, var_259_0, function(arg_260_0)
			arg_237_0:ShowBlackScreen(false, arg_260_0)
		end)
	end)
end

function var_0_0.PlaySingleAction(arg_261_0, arg_261_1, arg_261_2)
	local var_261_0 = {}

	if not arg_261_0.ladyAnimator:GetCurrentAnimatorStateInfo(arg_261_0.ladyAnimBaseLayerIndex):IsName(arg_261_1) then
		table.insert(var_261_0, function(arg_262_0)
			arg_261_0.nowState = arg_261_1
			arg_261_0.stateCallback = arg_262_0

			arg_261_0.ladyAnimator:CrossFadeInFixedTime(arg_261_1, 0.25)
		end)
		table.insert(var_261_0, function(arg_263_0)
			arg_261_0.nowState = nil
			arg_261_0.stateCallback = nil

			arg_263_0()
		end)
	end

	seriesAsync(var_261_0, arg_261_2)
end

function var_0_0.SwitchAnim(arg_264_0, arg_264_1, arg_264_2)
	local var_264_0 = {}

	warning("Switch", arg_264_1)
	table.insert(var_264_0, function(arg_265_0)
		arg_264_0.nowState = arg_264_1
		arg_264_0.stateCallback = arg_265_0

		arg_264_0.ladyAnimator:PlayInFixedTime(arg_264_1)
	end)
	table.insert(var_264_0, function(arg_266_0)
		arg_264_0.nowState = nil
		arg_264_0.stateCallback = nil

		arg_266_0()
	end)
	seriesAsync(var_264_0, arg_264_2)
end

function var_0_0.RegisterAnimCallback(arg_267_0, arg_267_1, arg_267_2)
	arg_267_0.animCallbacks[arg_267_1] = arg_267_2
end

function var_0_0.SetCharacterAnimSpeed(arg_268_0, arg_268_1)
	arg_268_0.ladyAnimator.speed = arg_268_1
	arg_268_0.ladyHeadIKComp.blinkSpeed = arg_268_0.ladyHeadIKData.blinkSpeed * arg_268_1

	if arg_268_1 > 0 then
		arg_268_0.ladyHeadIKComp.DampTime = arg_268_0.ladyHeadIKData.DampTime / arg_268_1
	else
		arg_268_0.ladyHeadIKComp.DampTime = arg_268_0.ladyHeadIKData.DampTime * math.huge
	end
end

function var_0_0.OnAnimationEvent(arg_269_0, arg_269_1)
	if arg_269_1.animatorClipInfo.weight < 0.5 then
		return
	end

	local var_269_0 = arg_269_1.stringParameter
	local var_269_1 = table.removebykey(arg_269_0.animEventCallbacks, var_269_0)

	existCall(var_269_1)
end

function var_0_0.RegisterAnimEventCallback(arg_270_0, arg_270_1, arg_270_2)
	arg_270_0.animEventCallbacks[arg_270_1] = arg_270_2
end

function var_0_0.RegisterCameraBlendFinished(arg_271_0, arg_271_1, arg_271_2)
	arg_271_0.cameraBlendCallbacks[arg_271_1] = arg_271_2
end

function var_0_0.UnRegisterCameraBlendFinished(arg_272_0, arg_272_1)
	arg_272_0.cameraBlendCallbacks[arg_272_1] = nil
end

function var_0_0.OnCameraBlendFinished(arg_273_0, arg_273_1)
	if not arg_273_1 then
		return
	end

	local var_273_0 = table.removebykey(arg_273_0.cameraBlendCallbacks, arg_273_1)

	existCall(var_273_0)
end

function var_0_0.PlayHeartFX(arg_274_0)
	setActive(arg_274_0.effectHeart, false)
	setActive(arg_274_0.effectHeart, true)
end

function var_0_0.PlayExpression(arg_275_0, arg_275_1)
	local var_275_0 = arg_275_1.name
	local var_275_1 = arg_275_0.expressionDict[var_275_0]
	local var_275_2 = 5

	if var_275_1 then
		local var_275_3 = var_275_1.timer

		var_275_3:Reset(nil, var_275_2)
		var_275_3:Start()

		if var_275_1.instance then
			setActive(var_275_1.instance, false)
			setActive(var_275_1.instance, true)
		end

		return
	end

	local var_275_4 = {
		name = var_275_0,
		timer = Timer.New(function()
			arg_275_0:RemoveExpression(var_275_0)
		end, var_275_2, 1, true)
	}

	arg_275_0.expressionDict[var_275_0] = var_275_4

	arg_275_0.loader:GetPrefab("dorm3D/effect/prefab/expression/" .. var_275_0, var_275_0, function(arg_277_0)
		var_275_4.instance = arg_277_0

		setParent(arg_277_0, arg_275_0.ladyHeadCenter)
		setLocalPosition(arg_277_0, Vector3(0, 0, -0.2))
		setActive(arg_277_0, false)
		setActive(arg_277_0, true)
	end, var_275_4)
end

function var_0_0.RemoveExpression(arg_278_0, arg_278_1)
	local var_278_0 = arg_278_0.expressionDict[arg_278_1]

	if not var_278_0 then
		return
	end

	arg_278_0.loader:ClearRequest(var_278_0)

	if var_278_0.instance then
		arg_278_0.loader:ReturnPrefab(var_278_0.instance)
	end

	arg_278_0.expressionDict[arg_278_1] = nil
end

function var_0_0.ShowOrHideCanWatchMark(arg_279_0, arg_279_1)
	setActive(arg_279_0.canWatchFloat, arg_279_1)
end

function var_0_0.RegisterGlobalVolume(arg_280_0)
	local var_280_0 = arg_280_0.globalVolume
	local var_280_1 = LuaHelper.GetOrAddVolumeComponent(var_280_0, typeof(BLHX.PostEffect.Overrides.DepthOfField))
	local var_280_2 = LuaHelper.GetOrAddVolumeComponent(var_280_0, typeof(BLHX.PostEffect.Overrides.ColorGrading))

	arg_280_0.originalCameraSettings = {
		depthOfField = {
			enabled = var_280_1.enabled.value,
			focusDistance = {
				length = 2,
				min = var_280_1.gaussianStart.min,
				value = var_280_1.gaussianStart.value
			},
			blurRadius = {
				min = var_280_1.blurRadius.min,
				max = var_280_1.blurRadius.max,
				value = var_280_1.blurRadius.value
			}
		},
		postExposure = {
			value = var_280_2.postExposure.value
		},
		contrast = {
			min = var_280_2.contrast.min,
			max = var_280_2.contrast.max,
			value = var_280_2.contrast.value
		},
		saturate = {
			min = var_280_2.saturation.min,
			max = var_280_2.saturation.max,
			value = var_280_2.saturation.value
		}
	}
	arg_280_0.originalCameraSettings.depthOfField.enabled = true

	local var_280_3 = var_280_0:GetComponent(typeof(BLHX.Volume.Volume))

	arg_280_0.originalVolume = {
		profile = var_280_3.sharedProfile,
		weight = var_280_3.weight
	}
end

function var_0_0.SettingCamera(arg_281_0, arg_281_1)
	arg_281_0.activeCameraSettings = arg_281_1

	local var_281_0 = arg_281_0.globalVolume
	local var_281_1 = LuaHelper.GetOrAddVolumeComponent(var_281_0, typeof(BLHX.PostEffect.Overrides.DepthOfField))
	local var_281_2 = LuaHelper.GetOrAddVolumeComponent(var_281_0, typeof(BLHX.PostEffect.Overrides.ColorGrading))

	var_281_1.enabled:Override(arg_281_1.depthOfField.enabled)
	var_281_1.gaussianStart:Override(arg_281_1.depthOfField.focusDistance.value)
	var_281_1.gaussianEnd:Override(arg_281_1.depthOfField.focusDistance.value + arg_281_1.depthOfField.focusDistance.length)
	var_281_1.blurRadius:Override(arg_281_1.depthOfField.blurRadius.value)
	var_281_2.postExposure:Override(arg_281_1.postExposure.value)
	var_281_2.contrast:Override(arg_281_1.contrast.value)
	var_281_2.saturation:Override(arg_281_1.saturate.value)
end

function var_0_0.GetCameraSettings(arg_282_0)
	return arg_282_0.originalCameraSettings
end

function var_0_0.RevertCameraSettings(arg_283_0)
	arg_283_0:SettingCamera(arg_283_0.originalCameraSettings)

	arg_283_0.activeCameraSettings = nil
end

function var_0_0.SetVolumeProfile(arg_284_0, arg_284_1, arg_284_2)
	warning(arg_284_1, arg_284_2)

	local var_284_0 = arg_284_0.globalVolume:GetComponent(typeof(BLHX.Volume.Volume))

	arg_284_0.activeProfileWeight = arg_284_2

	if arg_284_0.activeProfileName ~= arg_284_1 then
		arg_284_0.activeProfileName = arg_284_1

		arg_284_0.loader:LoadReference("dorm3d/scenesres/res/common", arg_284_1, nil, function(arg_285_0)
			warning(arg_285_0 and arg_285_0.name or "NIL")

			var_284_0.profile = arg_285_0
			var_284_0.weight = arg_284_0.activeProfileWeight

			if arg_284_0.activeCameraSettings then
				arg_284_0:SettingCamera(arg_284_0.activeCameraSettings)
			end
		end, "VolumeProfile")
	else
		var_284_0.weight = arg_284_0.activeProfileWeight
	end
end

function var_0_0.RevertVolumeProfile(arg_286_0)
	local var_286_0 = arg_286_0.globalVolume:GetComponent(typeof(BLHX.Volume.Volume))

	var_286_0.profile = arg_286_0.originalVolume.profile
	var_286_0.weight = arg_286_0.originalVolume.weight

	if arg_286_0.activeCameraSettings then
		arg_286_0:SettingCamera(arg_286_0.activeCameraSettings)
	end

	arg_286_0.activeProfileName = nil
end

function var_0_0.RecordCharacterLight(arg_287_0)
	local var_287_0 = BLHX.Rendering.PipelineInterface.GetCharacterLightColor()

	arg_287_0.originalCharacterColor = {
		color = var_287_0.color,
		intensity = var_287_0.intensity
	}
end

function var_0_0.SetCharacterLight(arg_288_0, arg_288_1, arg_288_2, arg_288_3)
	local var_288_0 = arg_288_0.characterLight:GetComponent(typeof(Light))
	local var_288_1 = Color.Lerp(arg_288_0.originalCharacterColor.color, arg_288_1, arg_288_3)
	local var_288_2 = math.lerp(arg_288_0.originalCharacterColor.intensity, arg_288_2, arg_288_3)

	BLHX.Rendering.PipelineInterface.SetCharacterLight(var_288_1, var_288_2)
end

function var_0_0.RevertCharacterLight(arg_289_0)
	arg_289_0:SetCharacterLight(arg_289_0.originalCharacterColor.color, arg_289_0.originalCharacterColor.intensity, 1)
end

function var_0_0.EnableLipSync(arg_290_0, arg_290_1)
	table.Foreach(arg_290_0.lipsyncComps, function(arg_291_0, arg_291_1)
		if arg_291_1 == nil then
			return
		end

		arg_291_1.enabled = arg_290_1
	end)
end

function var_0_0.EnableCloth(arg_292_0, arg_292_1)
	table.Foreach(arg_292_0.clothComps, function(arg_293_0, arg_293_1)
		if arg_293_1 == nil then
			return
		end

		setActive(arg_293_1, arg_292_1)
	end)
end

function var_0_0.onBackPressed(arg_294_0)
	if not arg_294_0.baseView or arg_294_0.retainCount > 0 then
		return
	end

	if not arg_294_0.baseView:onBackPressed() then
		arg_294_0:closeView()
	end
end

function var_0_0.EnableSceneDisplay(arg_295_0, arg_295_1, arg_295_2)
	assert(tobool(arg_295_0.lastSceneRootDict[arg_295_1]) == arg_295_2)

	if arg_295_2 then
		table.Foreach(arg_295_0.lastSceneRootDict[arg_295_1], function(arg_296_0, arg_296_1)
			if IsNil(arg_296_0) then
				return
			end

			setActive(arg_296_0, arg_296_1)
		end)

		arg_295_0.lastSceneRootDict[arg_295_1] = nil
	else
		arg_295_0.lastSceneRootDict[arg_295_1] = {}

		local var_295_0 = SceneManager.GetSceneByName(arg_295_1)

		table.IpairsCArray(var_295_0:GetRootGameObjects(), function(arg_297_0, arg_297_1)
			if tostring(arg_297_1.hideFlags) ~= "None" then
				return
			end

			arg_295_0.lastSceneRootDict[arg_295_1][arg_297_1] = isActive(arg_297_1)

			setActive(arg_297_1, false)
		end)
	end
end

function var_0_0.ChangeArtScene(arg_298_0, arg_298_1, arg_298_2)
	arg_298_1 = string.lower(arg_298_1)

	warning(arg_298_1, arg_298_0.sceneInfo, arg_298_1 == arg_298_0.sceneInfo)

	if arg_298_1 == arg_298_0.currentSceneInfo then
		existCall(arg_298_2)

		return
	end

	local var_298_0 = {}
	local var_298_1 = false
	local var_298_2

	table.insert(var_298_0, function(arg_299_0)
		arg_298_0.currentSceneInfo = arg_298_1

		if var_298_1 then
			pg.SceneAnimMgr.GetInstance():Dorm3DSceneChange(function(arg_300_0)
				var_298_2 = arg_300_0

				arg_299_0()
			end)
		else
			arg_299_0()
		end
	end)

	if arg_298_1 == arg_298_0.sceneInfo then
		table.insert(var_298_0, function(arg_301_0)
			setActive(arg_298_0.slotRoot, true)
			SceneManager.SetActiveScene(SceneManager.GetSceneByName(arg_298_0.sceneName))
			arg_298_0:EnableSceneDisplay(arg_298_0.sceneName, true)
			arg_298_0:SwitchDayNight(arg_298_0.contextData.timeIndex)
			arg_301_0()
		end)
	else
		var_298_1 = true

		local var_298_3, var_298_4 = unpack(string.split(arg_298_1, "|"))

		table.insert(var_298_0, function(arg_302_0)
			setActive(arg_298_0.slotRoot, false)
			SceneOpMgr.Inst:LoadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_298_4 .. "/" .. var_298_3 .. "_scene"), var_298_3, LoadSceneMode.Additive, function(arg_303_0, arg_303_1)
				SceneManager.SetActiveScene(arg_303_0)
				arg_302_0()
			end)
		end)
	end

	if arg_298_0.currentSceneInfo == arg_298_0.sceneInfo then
		table.insert(var_298_0, function(arg_304_0)
			arg_298_0:EnableSceneDisplay(arg_298_0.sceneName, false)
			arg_304_0()
		end)
	else
		local var_298_5, var_298_6 = unpack(string.split(arg_298_0.currentSceneInfo, "|"))

		table.insert(var_298_0, function(arg_305_0)
			SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_298_6 .. "/" .. var_298_5 .. "_scene"), var_298_5, arg_305_0)
		end)
	end

	table.insert(var_298_0, function(arg_306_0)
		arg_306_0()

		if var_298_1 then
			var_298_2()
		end
	end)
	seriesAsync(var_298_0, arg_298_2)
end

function var_0_0.LoadTimelineScene(arg_307_0, arg_307_1, arg_307_2, arg_307_3)
	arg_307_1 = string.lower(arg_307_1)

	warning(arg_307_1)

	if arg_307_0.cacheSceneDic[arg_307_1] then
		if not arg_307_2 then
			arg_307_0.timelineScene = arg_307_1

			arg_307_0:EnableSceneDisplay(arg_307_1, true)
		end

		return existCall(arg_307_3)
	end

	local var_307_0 = {}
	local var_307_1

	table.insert(var_307_0, function(arg_308_0)
		pg.SceneAnimMgr.GetInstance():Dorm3DSceneChange(function(arg_309_0)
			if arg_307_0.waitForTimeline then
				arg_307_0.waitForTimeline = arg_309_0
				var_307_1 = nil
			else
				var_307_1 = arg_309_0
			end

			arg_308_0()
		end)
	end)
	table.insert(var_307_0, function(arg_310_0)
		SceneOpMgr.Inst:LoadSceneAsync(string.lower("dorm3d/character/" .. arg_307_0.assetRootName .. "/timeline/" .. arg_307_1 .. "/" .. arg_307_1 .. "_scene"), arg_307_1, LoadSceneMode.Additive, function(arg_311_0, arg_311_1)
			local var_311_0 = GameObject.Find("[actor]").transform

			arg_307_0:HXCharacter(tf(var_311_0))
			GameObject.Find("[sequence]").transform:GetComponent(typeof(UnityEngine.Playables.PlayableDirector)):Stop()
			arg_310_0()
		end)
	end)
	table.insert(var_307_0, function(arg_312_0)
		if arg_307_2 then
			arg_307_0.cacheSceneDic[arg_307_1] = true

			arg_307_0:EnableSceneDisplay(arg_307_1, false)
		else
			arg_307_0.timelineScene = arg_307_1
		end

		arg_312_0()
		existCall(var_307_1)
	end)
	seriesAsync(var_307_0, arg_307_3)
end

function var_0_0.UnloadTimelineScene(arg_313_0, arg_313_1, arg_313_2, arg_313_3)
	arg_313_1 = string.lower(arg_313_1)

	if arg_313_0.timelineScene == arg_313_1 then
		arg_313_0.timelineScene = nil
	end

	if tobool(arg_313_2) == tobool(arg_313_0.cacheSceneDic[arg_313_1]) then
		SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/character/scenes/" .. arg_313_0.assetRootName .. "/timeline/" .. arg_313_1 .. "/" .. arg_313_1 .. "_scene"), arg_313_1, function()
			arg_313_0.cacheSceneDic[arg_313_1] = nil
			arg_313_0.lastSceneRootDict[arg_313_1] = nil

			existCall(arg_313_3)
		end)
	else
		arg_313_0:EnableSceneDisplay(arg_313_1, false)
		existCall(arg_313_3)
	end
end

function var_0_0.ChangeSubScene(arg_315_0, arg_315_1, arg_315_2)
	arg_315_1 = string.lower(arg_315_1)

	warning(arg_315_1, arg_315_0.currentSubSceneInfo, arg_315_1 == arg_315_0.currentSubSceneInfo)

	if arg_315_1 == arg_315_0.currentSubSceneInfo then
		arg_315_0.activeZoneName = arg_315_0.walkBornPoint or arg_315_0.contextData.inFurnitureName

		arg_315_0:ChangeCharacterPosition()
		arg_315_0:ChangePlayerPosition()
		arg_315_0:TriggerLadyDistance()
		arg_315_0:CheckInSector()
		existCall(arg_315_2)

		return
	end

	local var_315_0 = {}
	local var_315_1 = false
	local var_315_2

	table.insert(var_315_0, function(arg_316_0)
		arg_315_0.currentSubSceneInfo = arg_315_1

		if var_315_1 then
			pg.SceneAnimMgr.GetInstance():Dorm3DSceneChange(function(arg_317_0)
				var_315_2 = arg_317_0

				arg_316_0()
			end)
		else
			arg_316_0()
		end
	end)

	if arg_315_1 == arg_315_0.sceneInfo then
		table.insert(var_315_0, function(arg_318_0)
			arg_315_0:ResetSceneStructure(SceneManager.GetSceneByName(arg_315_0.baseSceneName))
			arg_315_0:RefreshSlots(arg_315_0:GetApartment())

			arg_315_0.activeZoneName = arg_315_0.walkBornPoint or arg_315_0.contextData.inFurnitureName

			arg_315_0:ChangeCharacterPosition()
			arg_315_0:ChangePlayerPosition()
			arg_315_0:TriggerLadyDistance()
			arg_315_0:CheckInSector()
			arg_318_0()
		end)
	else
		var_315_1 = true

		local var_315_3, var_315_4 = unpack(string.split(arg_315_1, "|"))
		local var_315_5 = var_315_3 .. "_base"

		table.insert(var_315_0, function(arg_319_0)
			SceneOpMgr.Inst:LoadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_315_4 .. "/" .. var_315_5 .. "_scene"), var_315_5, LoadSceneMode.Additive, arg_319_0)
		end)
		table.insert(var_315_0, function(arg_320_0)
			arg_315_0:ResetSceneStructure(SceneManager.GetSceneByName(var_315_5))

			arg_315_0.activeZoneName = arg_315_0.walkBornPoint or "Default"

			arg_315_0:SwitchAnim(var_0_0.ANIM.IDLE)
			onNextTick(function()
				arg_315_0:ChangeCharacterPosition()
				arg_315_0:ChangePlayerPosition()
				arg_315_0:TriggerLadyDistance()
				arg_315_0:CheckInSector()
				arg_320_0()
			end)
		end)
	end

	if arg_315_0.currentSubSceneInfo == arg_315_0.sceneInfo then
		table.insert(var_315_0, function(arg_322_0)
			local var_322_0 = Clone(arg_315_0:GetApartment())

			var_322_0.furnitures = {}

			arg_315_0:RefreshSlots(var_322_0)
			arg_322_0()
		end)
	else
		local var_315_6, var_315_7 = unpack(string.split(arg_315_0.currentSubSceneInfo, "|"))
		local var_315_8 = var_315_6 .. "_base"

		table.insert(var_315_0, function(arg_323_0)
			SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_315_7 .. "/" .. var_315_8 .. "_scene"), var_315_8, arg_323_0)
		end)
	end

	table.insert(var_315_0, function(arg_324_0)
		arg_324_0()

		if var_315_1 then
			var_315_2()
		end
	end)
	seriesAsync(var_315_0, arg_315_2)
end

function var_0_0.TransformMesh(arg_325_0)
	local var_325_0 = arg_325_0.sharedMesh
	local var_325_1 = {}
	local var_325_2 = arg_325_0.transform:TransformPoint(var_325_0.vertices[0])
	local var_325_3 = arg_325_0.transform:TransformPoint(var_325_0.vertices[1])
	local var_325_4 = arg_325_0.transform:TransformPoint(var_325_0.vertices[2])

	var_325_1.horizontal = var_325_3 - var_325_2
	var_325_1.verticle = var_325_4 - var_325_2
	var_325_1.origin = var_325_2

	return var_325_1
end

function var_0_0.GetRatio(arg_326_0, arg_326_1)
	local var_326_0 = Vector2.zero

	var_326_0.x = Vector3.Dot(arg_326_0.horizontal, arg_326_1) / arg_326_0.horizontal.sqrMagnitude
	var_326_0.y = Vector3.Dot(arg_326_0.verticle, arg_326_1) / arg_326_0.verticle.sqrMagnitude

	return var_326_0
end

function var_0_0.GetPostionByRatio(arg_327_0, arg_327_1)
	return arg_327_0.horizontal * arg_327_1.x + arg_327_0.verticle * arg_327_1.y + arg_327_0.origin
end

function var_0_0.IsPointInSector(arg_328_0, arg_328_1)
	local var_328_0 = arg_328_1 - Vector3.New(unpack(arg_328_0.Position))

	if var_328_0.magnitude > arg_328_0.Radius then
		return false
	end

	local var_328_1 = Quaternion.Euler(unpack(arg_328_0.Rotation))

	return Vector3.Angle(var_328_1 * Vector3.forward, var_328_0) <= arg_328_0.Angle / 2
end

function var_0_0.willExit(arg_329_0)
	SetCompomentEnabled(arg_329_0.baseView.rtMainAI, "BehaviourTreeOwner", false)
	arg_329_0.baseView:Destroy()
	arg_329_0.joystickTimer:Stop()
	arg_329_0.moveStickTimer:Stop()
	arg_329_0.updateHandler:Stop()
	arg_329_0:StopIKHandTimer()

	if arg_329_0.moveTimer then
		arg_329_0.moveTimer:Stop()

		arg_329_0.moveTimer = nil
	end

	if arg_329_0.moveWaitTimer then
		arg_329_0.moveWaitTimer:Stop()

		arg_329_0.moveWaitTimer = nil
	end

	GlobalClickEventMgr.Inst:RemoveBeginPinchFunc()
	GlobalClickEventMgr.Inst:RemovePinchFunc()
	GlobalClickEventMgr.Inst:RemoveEndPinchFunc()

	if not IsNil(arg_329_0.furnitures) then
		eachChild(arg_329_0.furnitures, function(arg_330_0)
			local var_330_0 = GetComponent(arg_330_0, typeof(EventTriggerListener))

			if not var_330_0 then
				return
			end

			var_330_0:ClearEvents()
		end)
	end

	GetComponent(arg_329_0.lady, typeof(EventTriggerListener)):ClearEvents()

	arg_329_0.camBrainEvenetHandler.OnBlendStarted = nil
	arg_329_0.camBrainEvenetHandler.OnBlendFinished = nil

	pg.UIMgr.GetInstance():UnOverlayPanel(arg_329_0.blockLayer, arg_329_0._tf)
	table.Foreach(arg_329_0.expressionDict, function(arg_331_0)
		arg_329_0:RemoveExpression(arg_331_0)
	end)
	arg_329_0.loader:Clear()
	pg.ClickEffectMgr:GetInstance():SetClickEffect("NORMAL")

	local var_329_0 = {}

	if arg_329_0.timelineScene and not arg_329_0.cacheSceneDic[arg_329_0.timelineScene] then
		local var_329_1 = arg_329_0.timelineScene

		arg_329_0.timelineScene = nil

		table.insert(var_329_0, function(arg_332_0)
			SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/character/scenes/" .. arg_329_0.assetRootName .. "/timeline/" .. var_329_1 .. "/" .. var_329_1 .. "_scene"), var_329_1, arg_332_0)
		end)
	end

	for iter_329_0, iter_329_1 in pairs(arg_329_0.cacheSceneDic) do
		if iter_329_1 then
			table.insert(var_329_0, function(arg_333_0)
				SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/character/scenes/" .. arg_329_0.assetRootName .. "/timeline/" .. iter_329_0 .. "/" .. iter_329_0 .. "_scene"), iter_329_0, arg_333_0)
			end)
		end
	end

	for iter_329_2, iter_329_3 in ipairs({
		arg_329_0.sceneInfo,
		arg_329_0.currentSceneInfo ~= arg_329_0.sceneInfo and arg_329_0.currentSceneInfo or nil
	}) do
		local var_329_2, var_329_3 = unpack(string.split(iter_329_3, "|"))

		table.insert(var_329_0, function(arg_334_0)
			SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_329_3 .. "/" .. var_329_2 .. "_scene"), var_329_2, arg_334_0)
		end)
	end

	for iter_329_4, iter_329_5 in ipairs({
		arg_329_0.sceneInfo,
		arg_329_0.currentSubSceneInfo ~= arg_329_0.sceneInfo and arg_329_0.currentSubSceneInfo or nil
	}) do
		local var_329_4, var_329_5 = unpack(string.split(iter_329_5, "|"))
		local var_329_6 = var_329_4 .. "_base"

		table.insert(var_329_0, function(arg_335_0)
			SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_329_5 .. "/" .. var_329_6 .. "_scene"), var_329_6, arg_335_0)
		end)
	end

	seriesAsync(var_329_0, function()
		ReflectionHelp.RefSetProperty(typeof("UnityEngine.LightmapSettings"), "lightmaps", nil, nil)
	end)
end

function var_0_0.SettingQuality()
	local var_337_0 = PlayerPrefs.GetInt("dorm3d_graphics_settings", 2)

	BLHX.Rendering.EngineCore.SetOverrideQualityLevel(var_337_0 - 1)
end

return var_0_0
