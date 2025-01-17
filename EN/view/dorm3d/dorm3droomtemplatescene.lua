local var_0_0 = class("Dorm3dRoomTemplateScene", import("view.base.BaseUI"))

var_0_0.CAMERA = {
	GIFT = 8,
	PHOTO_FREE = 11,
	TALK = 4,
	PHOTO = 10,
	POV = 12,
	IK_WATCH = 13,
	ROLE = 3,
	AIM = 1,
	ROLE2 = 9,
	FURNITURE_WATCH = 7,
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
var_0_0.PLAY_EXPRESSION = "Dorm3dRoomTemplateScene.PLAY_EXPRESSION"
var_0_0.MOVE_PLAYER_TO_FURNITURE = "Dorm3dRoomTemplateScene.MOVE_PLAYER_TO_FURNITURE"
var_0_0.SHOW_BLOCK = "Dorm3dRoomTemplateScene.SHOW_BLOCK"
var_0_0.HIDE_BLOCK = "Dorm3dRoomTemplateScene.HIDE_BLOCK"
var_0_0.ON_TOUCH_CHARACTER = "Dorm3dRoomTemplateScene.ON_TOUCH_CHARACTER"
var_0_0.ON_ROLEWATCH_CAMERA_MAX = "Dorm3dRoomTemplateScene.ON_ROLEWATCH_CAMERA_MAX"
var_0_0.ON_STICK_MOVE = "Dorm3dRoomTemplateScene.ON_STICK_MOVE"
var_0_0.ENABLE_SCENEBLOCK = "Dorm3dRoomTemplateScene.ENABLE_SCENEBLOCK"
var_0_0.ON_BEGIN_DRAG_CHARACTER_BODY = "Dorm3dRoomTemplateScene.ON_BEGIN_DRAG_CHARACTER_BODY"
var_0_0.ON_DRAG_CHARACTER_BODY = "Dorm3dRoomTemplateScene.ON_DRAG_CHARACTER_BODY"
var_0_0.ON_RELEASE_CHARACTER_BODY = "Dorm3dRoomTemplateScene.ON_RELEASE_CHARACTER_BODY"
var_0_0.ON_POV_STICK_MOVE_BEGIN = "Dorm3dRoomTemplateScene.ON_POV_STICK_MOVE_BEGIN"
var_0_0.ON_POV_STICK_MOVE = "Dorm3dRoomTemplateScene.ON_POV_STICK_MOVE"
var_0_0.ON_POV_STICK_MOVE_END = "Dorm3dRoomTemplateScene.ON_POV_STICK_MOVE_END"
var_0_0.ON_POV_STICK_VIEW = "Dorm3dRoomTemplateScene.ON_POV_STICK_VIEW"
var_0_0.ON_ENTER_SECTOR = "Dorm3dRoomTemplateScene.ON_ENTER_SECTOR"
var_0_0.ON_CHANGE_DISTANCE = "Dorm3dRoomTemplateScene.ON_CHANGE_DISTANCE"
var_0_0.ON_IK_STATUS_CHANGED = "Dorm3dRoomTemplateScene.ON_IK_STATUS_CHANGED"
var_0_0.CLICK_CHARACTER = "Dorm3dRoomTemplateScene.CLICK_CHARACTER"
var_0_0.CLICK_CONTACT = "Dorm3dRoomTemplateScene.CLICK_CONTACT"
var_0_0.DISTANCE_TRIGGER = "Dorm3dRoomTemplateScene.DISTANCE_TRIGGER"
var_0_0.WALK_DISTANCE_TRIGGER = "Dorm3dRoomTemplateScene.WALK_DISTANCE_TRIGGER"
var_0_0.CHANGE_WATCH = "Dorm3dRoomTemplateScene.CHANGE_WATCH"
var_0_0.PHOTO_CALL = "Dorm3dRoomTemplateScene.PHOTO_CALL"
var_0_0.POV_CLOSE_DISTANCE = 1.5
var_0_0.POV_PENDING_CLOSE_DISTANCE = 2
var_0_0.IK_STATUS_DELTA = 0.5
var_0_0.IK_TIP_WAIT_TIME = 5

local var_0_2 = {
	map_siriushostel_01_base = {},
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
	},
	map_noshirohostel_01_base = {},
	map_beach_02_base = {}
}

var_0_0.IK_STATUS = {
	RELEASE = 3,
	BEGIN = 1,
	TRIGGER = 4,
	DRAG = 2
}

function var_0_0.getUIName(arg_1_0)
	return nil
end

function var_0_0.forceGC(arg_2_0)
	return true
end

function var_0_0.loadingQueue(arg_3_0)
	return function(arg_4_0)
		pg.SceneAnimMgr.GetInstance():Dorm3DSceneChange(function(arg_5_0)
			return arg_4_0(arg_5_0)
		end)
	end
end

function var_0_0.getBGM(arg_6_0)
	local var_6_0 = pg.dorm3d_rooms[arg_6_0.contextData.roomId].room_bgm

	if var_6_0 and var_6_0 ~= "" then
		return var_6_0
	else
		return var_0_0.super.getBGM(arg_6_0)
	end
end

function var_0_0.lowerAdpter(arg_7_0)
	return true
end

function var_0_0.Ctor(arg_8_0, ...)
	var_0_0.super.Ctor(arg_8_0, ...)

	arg_8_0.loader = AutoLoader.New()
	arg_8_0.scene = arg_8_0
end

function var_0_0.SetRoom(arg_9_0, arg_9_1)
	arg_9_0.room = arg_9_1
end

function var_0_0.preload(arg_10_0, arg_10_1)
	tolua.loadassembly("MagicaCloth")
	tolua.loadassembly("ParadoxNotion")

	for iter_10_0, iter_10_1 in pairs({
		_MonoManager = "ParadoxNotion.Services.MonoManager",
		MagicaPhysicsManager = "MagicaCloth.MagicaPhysicsManager"
	}) do
		if not GameObject.Find(iter_10_0) then
			local var_10_0 = GameObject.New(iter_10_0)

			GetOrAddComponent(var_10_0, typeof(iter_10_1))
		end
	end

	arg_10_0.room = getProxy(ApartmentProxy):getRoom(arg_10_0.contextData.roomId)
	arg_10_0.sceneInfo = string.lower(arg_10_0.room:getConfig("scene_info"))
	arg_10_0.artSceneInfo = arg_10_0.sceneInfo
	arg_10_0.subSceneInfo = arg_10_0.sceneInfo

	local var_10_1, var_10_2 = unpack(string.split(arg_10_0.sceneInfo, "|"))
	local var_10_3 = {
		function(arg_11_0)
			SceneOpMgr.Inst:LoadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_10_2 .. "/" .. var_10_1 .. "_scene"), var_10_1, LoadSceneMode.Additive, function(arg_12_0, arg_12_1)
				SceneManager.SetActiveScene(arg_12_0)

				local var_12_0 = getSceneRootTFDic(arg_12_0).MainCamera

				if var_12_0 then
					setActive(var_12_0, false)
				end

				arg_11_0()
			end)
		end,
		function(arg_13_0)
			SceneOpMgr.Inst:LoadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_10_2 .. "/" .. var_10_1 .. "_base_scene"), var_10_1 .. "_base", LoadSceneMode.Additive, arg_13_0)
		end
	}

	table.insert(var_10_3, function(arg_14_0)
		arg_10_0:LoadCharacter(arg_10_0.contextData.groupIds, arg_14_0)
	end)
	seriesAsync(var_10_3, arg_10_1)
end

function var_0_0.init(arg_15_0)
	arg_15_0:BindEvent()
	arg_15_0:InitData()
	arg_15_0:initScene()
	arg_15_0:initNodeCanvas()

	for iter_15_0, iter_15_1 in pairs(arg_15_0.ladyDict) do
		arg_15_0:InitCharacter(iter_15_1, iter_15_0)

		iter_15_1.ladyBaseZone = arg_15_0.contextData.ladyZone[iter_15_0]
		iter_15_1.ladyActiveZone = iter_15_1.ladyBaseZone

		arg_15_0:ChangeCharacterPosition(iter_15_1)
	end

	arg_15_0.retainCount = 0
	arg_15_0.sceneBlockLayer = arg_15_0._tf:Find("SceneBlock")

	setActive(arg_15_0.sceneBlockLayer, false)

	arg_15_0.blockLayer = arg_15_0._tf:Find("Block")

	setActive(arg_15_0.blockLayer, false)

	arg_15_0.blackLayer = arg_15_0._tf:Find("BlackScreen")

	setActive(arg_15_0.blackLayer, false)
	arg_15_0:ChangePlayerPosition()

	arg_15_0.cacheSceneDic = {}
	arg_15_0.sceneGroupDic = {}
	arg_15_0.lastSceneRootDict = {}

	pg.ClickEffectMgr:GetInstance():SetClickEffect("DORM3D")
end

function var_0_0.BindEvent(arg_16_0)
	arg_16_0:bind(var_0_0.PLAY_EXPRESSION, function(arg_17_0, arg_17_1)
		arg_16_0:PlayExpression(arg_17_1)
	end)
	arg_16_0:bind(var_0_0.SHOW_BLOCK, function()
		arg_16_0.retainCount = arg_16_0.retainCount + 1

		setActive(arg_16_0.blockLayer, true)
	end)
	arg_16_0:bind(var_0_0.HIDE_BLOCK, function()
		arg_16_0.retainCount = math.max(arg_16_0.retainCount - 1, 0)

		if arg_16_0.retainCount > 0 then
			return
		end

		setActive(arg_16_0.blockLayer, false)
	end)
	arg_16_0:bind(var_0_0.ENABLE_SCENEBLOCK, function(arg_20_0, arg_20_1)
		setActive(arg_16_0.sceneBlockLayer, arg_20_1)
	end)
	arg_16_0:bind(var_0_0.ON_STICK_MOVE, function(arg_21_0, arg_21_1)
		arg_16_0:OnStickMove(arg_21_1)
	end)
	arg_16_0:bind(var_0_0.ON_BEGIN_DRAG_CHARACTER_BODY, function(arg_22_0, arg_22_1, arg_22_2, arg_22_3)
		if arg_16_0.blockIK then
			return
		end

		if arg_16_0.ikHandler then
			return
		end

		pg.IKMgr.GetInstance():OnDragBegin(arg_22_2, arg_22_3)
	end)
	arg_16_0:bind(var_0_0.ON_DRAG_CHARACTER_BODY, function(arg_23_0, arg_23_1, arg_23_2)
		if not arg_16_0.ikHandler then
			return
		end

		pg.IKMgr.GetInstance():HandleBodyDrag(arg_23_2)
	end)
	arg_16_0:bind(var_0_0.ON_RELEASE_CHARACTER_BODY, function(arg_24_0, arg_24_1)
		pg.IKMgr.GetInstance():ReleaseDrag()
	end)
	arg_16_0:bind(var_0_0.ON_POV_STICK_MOVE_BEGIN, function(arg_25_0, arg_25_1)
		if arg_16_0.pinchMode then
			return
		end

		arg_16_0.moveStickOrigin = arg_25_1.position
		arg_16_0.moveStickPosition = arg_16_0.moveStickOrigin
		arg_16_0.moveStickDraging = true
	end)

	local function var_16_0()
		arg_16_0.moveStickOrigin = nil
		arg_16_0.moveStickPosition = nil
		arg_16_0.moveStickDraging = nil

		if isActive(arg_16_0.cameras[var_0_0.CAMERA.PHOTO_FREE]) then
			arg_16_0:emit(Dorm3dPhotoMediator.CAMERA_STICK_MOVE, Vector2.zero)
		end
	end

	arg_16_0:bind(var_0_0.ON_POV_STICK_MOVE_END, function(arg_27_0, arg_27_1)
		var_16_0()
	end)
	arg_16_0:bind(var_0_0.ON_POV_STICK_MOVE, function(arg_28_0, arg_28_1)
		if arg_16_0.pinchMode then
			var_16_0()

			return
		end

		if not arg_16_0.moveStickDraging then
			return
		end

		arg_16_0.moveStickPosition = arg_16_0.moveStickPosition + arg_28_1

		if isActive(arg_16_0.povLayer:Find("Guide")) then
			setActive(arg_16_0.povLayer:Find("Guide"), false)
		end
	end)

	local var_16_1 = 32.4 / Screen.height

	arg_16_0:bind(var_0_0.ON_POV_STICK_VIEW, function(arg_29_0, arg_29_1)
		if arg_16_0.pinchMode then
			return
		end

		arg_29_1 = arg_29_1 * var_16_1

		local var_29_0 = arg_29_1.x
		local var_29_1 = arg_29_1.y

		local function var_29_2(arg_30_0, arg_30_1, arg_30_2)
			local var_30_0 = arg_30_0[arg_30_1]

			var_30_0.m_InputAxisValue = arg_30_2
			arg_30_0[arg_30_1] = var_30_0
		end

		if isActive(arg_16_0.cameras[var_0_0.CAMERA.POV]) then
			var_29_2(arg_16_0.compPovAim, "m_HorizontalAxis", var_29_0)
			var_29_2(arg_16_0.compPovAim, "m_VerticalAxis", var_29_1)
		elseif isActive(arg_16_0.cameras[var_0_0.CAMERA.PHOTO_FREE]) then
			local var_29_3 = arg_16_0.cameras[var_0_0.CAMERA.PHOTO_FREE]:Find("PhotoFree Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera)):GetCinemachineComponent(Cinemachine.CinemachineCore.Stage.Aim)

			var_29_2(var_29_3, "m_HorizontalAxis", var_29_0)
			var_29_2(var_29_3, "m_VerticalAxis", var_29_1)
		end
	end)

	local var_16_2 = {
		HideCharacterBylayer = true,
		EnableHeadIK = true,
		RevertCharacterBylayer = true
	}

	arg_16_0:bind(var_0_0.PHOTO_CALL, function(arg_31_0, arg_31_1, ...)
		if var_16_2[arg_31_1] then
			local var_31_0 = arg_16_0.ladyDict[arg_16_0.apartment:GetConfigID()]

			arg_16_0[arg_31_1](arg_16_0, var_31_0, ...)
		else
			local var_31_1 = arg_16_0.ladyDict[arg_16_0.apartment:GetConfigID()]

			arg_16_0[arg_31_1](var_31_1, ...)
		end
	end)
end

function var_0_0.RegisterIKFunc(arg_32_0)
	pg.IKMgr.GetInstance():RegisterOnIKLayerActive(function(arg_33_0)
		arg_32_0.blockIK = true
		arg_32_0.ikHandler = arg_33_0

		local var_33_0 = arg_32_0.ladyDict[arg_32_0.apartment:GetConfigID()]
		local var_33_1 = _.detect(var_33_0.readyIKLayers, function(arg_34_0)
			return arg_34_0:GetControllerPath() == arg_33_0.ikData:GetControllerPath()
		end)

		arg_32_0:EnableIKLayer(var_33_1)

		arg_32_0.ikNextCheckStamp = Time.time + var_0_0.IK_STATUS_DELTA

		arg_32_0:emit(var_0_0.ON_IK_STATUS_CHANGED, var_33_1:GetConfigID(), var_0_0.IK_STATUS.BEGIN)
	end)
	pg.IKMgr.GetInstance():RegisterOnIKLayerDrag(function(arg_35_0)
		arg_32_0.ikHandler = arg_35_0

		arg_32_0:ResetIKTipTimer()
	end)
	pg.IKMgr.GetInstance():RegisterOnIKLayerDeactive(function(arg_36_0, arg_36_1)
		local var_36_0 = arg_32_0.ladyDict[arg_32_0.apartment:GetConfigID()]
		local var_36_1 = _.detect(var_36_0.readyIKLayers, function(arg_37_0)
			return arg_37_0:GetControllerPath() == arg_36_0.ikData:GetControllerPath()
		end)

		arg_32_0:DeactiveIKLayer(var_36_1)

		arg_32_0.ikHandler = nil
		arg_32_0.blockIK = arg_36_1

		arg_32_0:emit(var_0_0.ON_IK_STATUS_CHANGED, var_36_1:GetConfigID(), var_0_0.IK_STATUS.RELEASE)
	end)
	pg.IKMgr.GetInstance():RegisterOnIKLayerAction(function(arg_38_0)
		arg_32_0.blockIK = nil

		local var_38_0 = arg_32_0.ladyDict[arg_32_0.apartment:GetConfigID()]
		local var_38_1 = _.detect(var_38_0.readyIKLayers, function(arg_39_0)
			return arg_39_0:GetControllerPath() == arg_38_0.ikData:GetControllerPath()
		end)

		arg_32_0:OnTriggerIK(var_38_1)
		arg_32_0:emit(var_0_0.ON_IK_STATUS_CHANGED, var_38_1:GetConfigID(), var_0_0.IK_STATUS.TRIGGER)
	end)
end

function var_0_0.initScene(arg_40_0)
	local var_40_0, var_40_1 = unpack(string.split(arg_40_0.sceneInfo, "|"))
	local var_40_2 = SceneManager.GetSceneByName(var_40_0 .. "_base")

	arg_40_0:ResetSceneStructure(var_40_2)

	arg_40_0.mainCameraTF = GameObject.Find("BackYardMainCamera").transform
	arg_40_0.camBrain = arg_40_0.mainCameraTF:GetComponent(typeof(Cinemachine.CinemachineBrain))
	arg_40_0.camBrainEvenetHandler = arg_40_0.mainCameraTF:GetComponent(typeof(CameraBrainEventsHandler))
	arg_40_0.raycastCamera = arg_40_0.mainCameraTF:Find("CameraForRaycast"):GetComponent(typeof(Camera))
	arg_40_0.sceneRaycaster = arg_40_0.raycastCamera:GetComponent(typeof(UnityEngine.EventSystems.PhysicsRaycaster))
	arg_40_0.player = GameObject.Find("Player").transform
	arg_40_0.playerEye = arg_40_0.player:Find("Eye")
	arg_40_0.playerFoot = arg_40_0.player:Find("Foot")

	setActive(arg_40_0.playerFoot, false)

	arg_40_0.playerController = arg_40_0.player:GetComponent(typeof(UnityEngine.CharacterController))
	arg_40_0.attachedPoints = {}

	eachChild(arg_40_0.furnitures, function(arg_41_0)
		table.insert(arg_40_0.attachedPoints, 1, arg_41_0)
	end)

	arg_40_0.modelRoot = GameObject.Find("scene_root").transform
	arg_40_0.slotRoot = GameObject.Find("FurnitureSlots").transform

	setActive(arg_40_0.slotRoot, true)
	arg_40_0:InitSlots()

	arg_40_0.resTF = GameObject.Find("Res").transform

	tolua.loadassembly("Cinemachine")

	local var_40_3 = GameObject.Find("CM Cameras").transform

	eachChild(var_40_3, function(arg_42_0)
		setActive(arg_42_0, false)
	end)

	arg_40_0.camBrain.enabled = false
	arg_40_0.camBrain.enabled = true
	arg_40_0.cameraAim = var_40_3:Find("Aim Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))
	arg_40_0.cameraAim2 = var_40_3:Find("Aim2 Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))
	arg_40_0.cameraFree = nil
	arg_40_0.cameraFurnitureWatch = nil
	arg_40_0.cameraRole = var_40_3:Find("Role Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))
	arg_40_0.cameraRole2 = var_40_3:Find("Role2 Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))

	local var_40_4 = var_40_3:Find("Talk Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))

	arg_40_0.cameraGift = var_40_3:Find("Gift Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))
	arg_40_0.cameras = {
		arg_40_0.cameraAim,
		arg_40_0.cameraAim2,
		arg_40_0.cameraRole,
		[var_0_0.CAMERA.TALK] = var_40_4,
		[var_0_0.CAMERA.GIFT] = arg_40_0.cameraGift,
		[var_0_0.CAMERA.ROLE2] = arg_40_0.cameraRole2,
		[var_0_0.CAMERA.PHOTO] = var_40_3:Find("Photo Camera"):GetComponent(typeof(Cinemachine.CinemachineFreeLook)),
		[var_0_0.CAMERA.PHOTO_FREE] = var_40_3:Find("PhotoFree Controller"),
		[var_0_0.CAMERA.POV] = var_40_3:Find("FP Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))
	}

	setActive(arg_40_0.cameras[var_0_0.CAMERA.PHOTO_FREE]:Find("PhotoFree Camera"), true)

	arg_40_0.compPovAim = arg_40_0.cameras[var_0_0.CAMERA.POV]:GetCinemachineComponent(Cinemachine.CinemachineCore.Stage.Aim)
	arg_40_0.cameraRoot = var_40_3
	arg_40_0.POVOriginalFOV = arg_40_0:GetPOVFOV()
	arg_40_0.restrictedBox = GameObject.Find("RestrictedArea").transform

	setActive(arg_40_0.restrictedBox, false)

	arg_40_0.restrictedHeightRange = {
		arg_40_0.restrictedBox:Find("Floor").position.y,
		arg_40_0.restrictedBox:Find("Celling").position.y
	}
	arg_40_0.ladyInterest = GameObject.Find("InterestProxy").transform
	arg_40_0.daynightCtrlComp = GameObject.Find("[MainBlock]").transform:GetComponent(typeof(DayNightCtrl))

	arg_40_0:SwitchDayNight(arg_40_0.contextData.timeIndex)

	arg_40_0.tfCutIn = getSceneRootTFDic(SceneManager.GetSceneByName(var_40_0 .. "_base")).CutIn

	if arg_40_0.tfCutIn then
		arg_40_0.modelCutIn = {
			lady = arg_40_0.tfCutIn:Find("lady"):GetChild(0),
			player = arg_40_0.tfCutIn:Find("player"):GetChild(0)
		}

		setActive(arg_40_0.tfCutIn, false)
	end
end

function var_0_0.SwitchDayNight(arg_43_0, arg_43_1)
	if not IsNil(arg_43_0.daynightCtrlComp) then
		arg_43_0.daynightCtrlComp:SwitcherToIndex(arg_43_1 - 1)
	end

	arg_43_0:InitLightSettings()
end

function var_0_0.InitLightSettings(arg_44_0)
	arg_44_0.globalVolume = GameObject.Find("GlobalVolume")

	arg_44_0:RegisterGlobalVolume()

	arg_44_0.characterLight = GameObject.Find("CharacterLight")

	arg_44_0:RecordCharacterLight()

	local var_44_0 = GameObject.Find("[Lighting]").transform

	table.IpairsCArray(var_44_0:GetComponentsInChildren(typeof(Light), true), function(arg_45_0, arg_45_1)
		arg_45_1.shadows = UnityEngine.LightShadows.None
	end)
end

function var_0_0.ResetSceneStructure(arg_46_0, arg_46_1)
	table.IpairsCArray(arg_46_1:GetRootGameObjects(), function(arg_47_0, arg_47_1)
		if arg_47_1.name == "Furnitures" then
			arg_46_0.furnitures = tf(arg_47_1)

			eachChild(arg_46_0.furnitures, function(arg_48_0)
				if arg_48_0:Find("FreeLook Camera") then
					setActive(arg_48_0:Find("FreeLook Camera"), false)
				end

				if arg_48_0:Find("FreeLook Camera") then
					setActive(arg_48_0:Find("RoleWatch Camera"), false)
				end

				if arg_48_0:Find("IKCamera") then
					setActive(arg_48_0:Find("IKCamera"), false)
				end

				local var_48_0 = arg_48_0:GetComponent(typeof(UnityEngine.Collider))

				if not var_48_0 then
					return
				end

				var_48_0.enabled = false
			end)
		end
	end)

	arg_46_0.sectorsDic = arg_46_0.sectorsDic or {}

	if not arg_46_0.sectorsDic[arg_46_1.name] then
		arg_46_0.sectorsDic[arg_46_1.name] = table.shallowCopy(var_0_2[arg_46_1.name]) or {}

		setmetatable(arg_46_0.sectorsDic[arg_46_1.name], {
			__index = function(arg_49_0, arg_49_1)
				local var_49_0 = arg_46_0.furnitures:Find(arg_49_1 .. "/StayPoint")

				if var_49_0 then
					local var_49_1 = var_49_0.position
					local var_49_2 = var_49_0.eulerAngles

					arg_49_0[arg_49_1] = {
						Radius = 2,
						Angle = 120,
						Position = {
							var_49_1.x,
							var_49_1.y,
							var_49_1.z
						},
						Rotation = {
							var_49_2.x,
							var_49_2.y,
							var_49_2.z
						}
					}

					return arg_49_0[arg_49_1]
				else
					return nil
				end
			end
		})
	end

	arg_46_0.activeSectors = arg_46_0.sectorsDic[arg_46_1.name]
end

function var_0_0.InitSlots(arg_50_0)
	local var_50_0 = arg_50_0.room:GetSlots()
	local var_50_1 = arg_50_0.modelRoot:GetComponentsInChildren(typeof(Transform), true)

	arg_50_0.slotDict = {}

	_.each(var_50_0, function(arg_51_0)
		local var_51_0 = arg_51_0:GetFurnitureName()
		local var_51_1 = arg_51_0:GetConfigID()
		local var_51_2 = arg_50_0.slotRoot:Find(tostring(var_51_1))

		assert(var_51_2)

		local var_51_3 = {
			trans = var_51_2,
			sceneHides = {}
		}
		local var_51_4 = var_51_2:Find("Selector")

		if var_51_4 then
			GetOrAddComponent(var_51_4, typeof(EventTriggerListener)):AddPointClickFunc(function(arg_52_0, arg_52_1)
				arg_50_0:emit(Dorm3dRoomMediator.ON_CLICK_FURNITURE_SLOT, var_51_1)
			end)
			setActive(var_51_4, false)
		end

		local var_51_5

		for iter_51_0 = 0, var_50_1.Length - 1 do
			local var_51_6 = var_50_1[iter_51_0]

			if var_51_6.name == var_51_0 then
				var_51_5 = var_51_6

				break
			end
		end

		if var_51_5 then
			var_51_3.model = var_51_5
		end

		arg_50_0.slotDict[var_51_1] = var_51_3
	end)
end

function var_0_0.SetContactStateDic(arg_53_0, arg_53_1)
	arg_53_0.contactStateDic = arg_53_1
	arg_53_0.hideContactStateDic = {}
	arg_53_0.contactInRangeDic = {}

	for iter_53_0, iter_53_1 in pairs(arg_53_0.contactStateDic) do
		arg_53_0.hideContactStateDic[iter_53_0] = math.min(iter_53_1, ApartmentRoom.ITEM_UNLOCK)
		arg_53_0.contactInRangeDic[iter_53_0] = false
	end

	arg_53_0:ActiveContact()
end

function var_0_0.TempHideContact(arg_54_0, arg_54_1)
	arg_54_0.hideConcatFlag = arg_54_1

	arg_54_0:ActiveContact()
end

function var_0_0.ActiveContact(arg_55_0)
	for iter_55_0, iter_55_1 in pairs(arg_55_0.contactInRangeDic) do
		arg_55_0:UpdateContactDisplay(iter_55_0, arg_55_0.contactInRangeDic[iter_55_0] and not arg_55_0.hideConcatFlag and arg_55_0.contactStateDic[iter_55_0] or arg_55_0.hideContactStateDic[iter_55_0])
	end
end

function var_0_0.UpdateContactDisplay(arg_56_0, arg_56_1, arg_56_2)
	local var_56_0 = pg.dorm3d_collection_template[arg_56_1]

	for iter_56_0, iter_56_1 in ipairs(var_56_0.vfx_prefab) do
		local var_56_1 = arg_56_0.modelRoot:Find(iter_56_1)

		if arg_56_0:IsModeInHidePending(iter_56_1) then
			-- block empty
		elseif not arg_56_0.modelRoot:Find(iter_56_1) then
			warning(arg_56_1, iter_56_1)
		else
			setActive(var_56_1, arg_56_2 == ApartmentRoom.ITEM_FIRST)
		end
	end

	for iter_56_2, iter_56_3 in ipairs(var_56_0.model) do
		if arg_56_0:IsModeInHidePending(iter_56_3) then
			-- block empty
		elseif not arg_56_0.modelRoot:Find(iter_56_3) then
			warning(arg_56_1, iter_56_3)
		else
			local var_56_2 = arg_56_0.modelRoot:Find(iter_56_3)

			if arg_56_0:CheckSceneItemActive(var_56_2) then
				local var_56_3 = GetComponent(var_56_2, typeof(EventTriggerListener))

				if arg_56_2 == ApartmentRoom.ITEM_FIRST then
					var_56_3 = var_56_3 or GetOrAddComponent(var_56_2, typeof(EventTriggerListener))

					var_56_3:AddPointClickFunc(function(arg_57_0, arg_57_1)
						arg_56_0:emit(var_0_0.CLICK_CONTACT, arg_56_1)
					end)

					var_56_3.enabled = true
				elseif var_56_3 then
					var_56_3.enabled = false
				end

				setActive(var_56_2, arg_56_2 > ApartmentRoom.ITEM_LOCK)
			end
		end
	end
end

function var_0_0.SetFloatEnable(arg_58_0, arg_58_1)
	arg_58_0.enableFloatUpdate = arg_58_1

	if arg_58_1 then
		arg_58_0.ladyDict[arg_58_0.apartment:GetConfigID()]:UpdateFloatPosition()
	end
end

function var_0_0.UpdateFloatPosition(arg_59_0)
	local var_59_0 = arg_59_0.ladyDict[arg_59_0.apartment:GetConfigID()]
	local var_59_1 = arg_59_0:GetScreenPosition(var_59_0.ladyHeadCenter.position + Vector3(0, 0.2, 0))
	local var_59_2 = arg_59_0:GetLocalPosition(var_59_1, arg_59_0.rtFloatPage)

	setLocalPosition(arg_59_0.rtFloatPage:Find("lady"), var_59_2)
end

function var_0_0.LoadCharacter(arg_60_0, arg_60_1, arg_60_2)
	arg_60_0.hxMatDict = {}
	arg_60_0.ladyDict = {}
	arg_60_0.skinDict = {}

	local var_60_0 = {}

	for iter_60_0, iter_60_1 in ipairs(arg_60_1) do
		local var_60_1 = setmetatable({}, {
			__index = arg_60_0
		})

		arg_60_0.ladyDict[iter_60_1] = var_60_1

		local var_60_2 = getProxy(ApartmentProxy):getApartment(iter_60_1)
		local var_60_3 = var_60_2:getConfig("asset_name")
		local var_60_4 = var_60_2:GetSkinModelID(arg_60_0.room:getConfig("tag"))
		local var_60_5 = pg.dorm3d_resource[var_60_4].model_id

		assert(var_60_5)

		for iter_60_2, iter_60_3 in ipairs({
			"common",
			var_60_5
		}) do
			local var_60_6 = string.format("dorm3d/character/%s/res/%s", var_60_3, iter_60_3)

			if checkABExist(var_60_6) then
				table.insert(var_60_0, function(arg_61_0)
					arg_60_0.loader:LoadBundle(var_60_6, function(arg_62_0)
						for iter_62_0, iter_62_1 in ipairs(arg_62_0:GetAllAssetNames()) do
							local var_62_0, var_62_1, var_62_2 = string.find(iter_62_1, "material_hx[/\\](.*).mat")

							if var_62_0 then
								arg_60_0.hxMatDict[var_62_2] = {
									arg_62_0,
									iter_62_1
								}
							end
						end

						arg_61_0()
					end)
				end)
			end
		end

		var_60_1.skinId = var_60_4
		var_60_1.skinIdList = {
			var_60_4
		}

		table.insert(var_60_0, function(arg_63_0)
			local var_63_0 = string.format("dorm3d/character/%s/prefabs/%s", var_60_3, var_60_5)

			arg_60_0.loader:GetPrefab(var_63_0, "", function(arg_64_0)
				var_60_1.ladyGameobject = arg_64_0
				arg_60_0.skinDict[var_60_4] = {
					ladyGameobject = arg_64_0
				}

				arg_63_0()
			end)
		end)

		if arg_60_0.room:isPersonalRoom() then
			local var_60_7 = var_60_2:GetSkinModelID("touch")

			if var_60_7 then
				local var_60_8 = pg.dorm3d_resource[var_60_7].model_id

				if #var_60_8 > 0 then
					table.insert(var_60_1.skinIdList, var_60_7)
					table.insert(var_60_0, function(arg_65_0)
						local var_65_0 = string.format("dorm3d/character/%s/prefabs/%s", var_60_3, var_60_8)

						arg_60_0.loader:GetPrefab(var_65_0, "", function(arg_66_0)
							arg_60_0.skinDict[var_60_7] = {
								ladyGameobject = arg_66_0
							}
							GetComponent(arg_66_0, "GraphOwner").enabled = false

							onNextTick(function()
								setActive(arg_66_0, false)
							end)
							arg_65_0()
						end)
					end)
				end
			end
		end

		if arg_60_0.contextData.pendingDic[iter_60_1] then
			local var_60_9 = pg.dorm3d_welcome[arg_60_0.contextData.pendingDic[iter_60_1]]

			if var_60_9.item_prefab ~= "" then
				table.insert(var_60_0, function(arg_68_0)
					local var_68_0 = string.lower("dorm3d/furniture/item/" .. var_60_9.item_prefab)

					arg_60_0.loader:GetPrefab(var_68_0, "", function(arg_69_0)
						var_60_1.tfPendintItem = arg_69_0.transform

						onNextTick(function()
							setActive(arg_69_0, false)
						end)
						arg_68_0()
					end)
				end)
			end
		end
	end

	parallelAsync(var_60_0, arg_60_2)
end

function var_0_0.HXCharacter(arg_71_0, arg_71_1)
	if not HXSet.isHx() then
		return
	end

	local var_71_0 = arg_71_1:GetComponentsInChildren(typeof(SkinnedMeshRenderer), true)

	table.IpairsCArray(var_71_0, function(arg_72_0, arg_72_1)
		local var_72_0 = arg_72_1.sharedMaterials
		local var_72_1 = false

		table.IpairsCArray(var_72_0, function(arg_73_0, arg_73_1)
			if arg_73_1 == nil then
				return
			end

			local var_73_0 = arg_73_1.name

			if not arg_71_0.hxMatDict[var_73_0] then
				return
			end

			var_72_1 = true

			local var_73_1, var_73_2 = unpack(arg_71_0.hxMatDict[var_73_0])
			local var_73_3 = var_73_1:LoadAssetSync(var_73_2, typeof(Material), false, false)

			var_72_0[arg_73_0] = var_73_3

			warning("Replace HX Material", arg_71_0.hxMatDict[var_73_0][2])
		end)

		if var_72_1 then
			arg_72_1.sharedMaterials = var_72_0
		end
	end)
end

function var_0_0.InitCharacter(arg_74_0, arg_74_1, arg_74_2)
	arg_74_1.lady = arg_74_1.ladyGameobject.transform

	arg_74_1.lady:SetParent(arg_74_1.mainCameraTF)
	arg_74_1.lady:SetParent(nil)

	arg_74_1.ladyHeadIKComp = arg_74_1.lady:GetComponent(typeof(HeadAimIK))
	arg_74_1.ladyHeadIKComp.AimTarget = arg_74_1.mainCameraTF:Find("AimTarget")
	arg_74_1.ladyHeadIKData = {
		DampTime = arg_74_1.ladyHeadIKComp.DampTime,
		blinkSpeed = arg_74_1.ladyHeadIKComp.blinkSpeed,
		BodyWeight = arg_74_1.ladyHeadIKComp.BodyWeight,
		HeadWeight = arg_74_1.ladyHeadIKComp.HeadWeight
	}

	local var_74_0 = {}

	table.Foreach(var_0_1, function(arg_75_0, arg_75_1)
		var_74_0[arg_75_1] = arg_75_0
	end)

	arg_74_1.ladyAnimator = arg_74_1.lady:GetComponent(typeof(Animator))
	arg_74_1.ladyAnimBaseLayerIndex = arg_74_1.ladyAnimator:GetLayerIndex("Base Layer")
	arg_74_1.ladyAnimFaceLayerIndex = arg_74_1.ladyAnimator:GetLayerIndex("Face")
	arg_74_1.ladyBoneMaps = {}

	local var_74_1 = arg_74_1.lady:GetComponentsInChildren(typeof(Transform), true)

	table.IpairsCArray(var_74_1, function(arg_76_0, arg_76_1)
		if arg_76_1.name == "BodyCollider" then
			arg_74_1.ladyCollider = arg_76_1

			setActive(arg_76_1, true)
		elseif arg_76_1.name == "SafeCollider" then
			arg_74_1.ladySafeCollider = arg_76_1

			setActive(arg_76_1, false)
		elseif arg_76_1.name == "Interest" then
			arg_74_1.ladyInterestRoot = arg_76_1
		elseif arg_76_1.name == "Head Center" then
			arg_74_1.ladyHeadCenter = arg_76_1
		end

		if var_74_0[arg_76_1.name] then
			arg_74_1.ladyBoneMaps[var_74_0[arg_76_1.name]] = arg_76_1
		end
	end)

	arg_74_1.ladyColliders = {}
	arg_74_1.ladyTouchColliders = {}

	table.IpairsCArray(arg_74_1.lady:GetComponentsInChildren(typeof(UnityEngine.Collider), true), function(arg_77_0, arg_77_1)
		if arg_77_1:GetType():Equals(typeof(UnityEngine.MeshCollider)) then
			return
		end

		child = tf(arg_77_1)

		local var_77_0 = child.name
		local var_77_1 = var_77_0 and string.find(var_77_0, "Collider") or -1

		if var_77_1 <= 0 then
			errorMsg("Wrong Name to lady Collider : " .. var_77_0)

			return
		end

		local var_77_2 = string.sub(var_77_0, 1, var_77_1 - 1)

		if var_0_0.BONE_TO_TOUCH[var_77_2] == nil then
			return
		end

		arg_74_1.ladyColliders[var_77_2] = child

		table.insert(arg_74_1.ladyTouchColliders, child)
		setActive(child, false)
	end)
	arg_74_1:HXCharacter(arg_74_1.lady)
	;(function()
		local var_78_0 = "dorm3d/effect/prefab/function/vfx_function_aixin02"
		local var_78_1 = "vfx_function_aixin02"

		arg_74_1.loader:GetPrefab(var_78_0, var_78_1, function(arg_79_0)
			arg_74_1.effectHeart = arg_79_0

			setActive(arg_79_0, false)
			onNextTick(function()
				setParent(arg_74_1.effectHeart, arg_74_1.ladyHeadCenter)
			end)
		end)
	end)()

	arg_74_1.clothComps = {}
	arg_74_1.ladyClothCompSettings = {}

	table.IpairsCArray(arg_74_1.lady:GetComponentsInChildren(typeof("MagicaCloth.BaseCloth"), true), function(arg_81_0, arg_81_1)
		table.insert(arg_74_1.clothComps, arg_81_1)

		arg_74_1.ladyClothCompSettings[arg_81_1] = {
			enabled = arg_81_1.enabled
		}
	end)

	arg_74_1.clothColliderDict = {}
	arg_74_1.ladyClothColliderSettings = {}

	local var_74_2 = typeof("MagicaCloth.MagicaCapsuleCollider")

	table.IpairsCArray(arg_74_1.lady:GetComponentsInChildren(var_74_2, true), function(arg_82_0, arg_82_1)
		arg_74_1.clothColliderDict[arg_82_1.name] = arg_82_1
		arg_74_1.ladyClothColliderSettings[arg_82_1] = {
			enabled = arg_82_1.enabled,
			StartRadius = ReflectionHelp.RefGetProperty(var_74_2, "StartRadius", arg_82_1),
			EndRadius = ReflectionHelp.RefGetProperty(var_74_2, "EndRadius", arg_82_1)
		}
	end)
	arg_74_1:EnableCloth(arg_74_1, false)

	arg_74_1.ladyIKRoot = arg_74_1.lady:Find("IKLayers")

	eachChild(arg_74_1.ladyIKRoot, function(arg_83_0)
		setActive(arg_83_0, false)
	end)
	GetComponent(arg_74_1.lady, typeof(EventTriggerListener)):AddPointClickFunc(function(arg_84_0, arg_84_1)
		if arg_84_1.rawPointerPress.transform == arg_74_1.ladyCollider then
			arg_74_1:emit(var_0_0.CLICK_CHARACTER, arg_74_2)
		else
			local var_84_0 = table.keyof(arg_74_1.IKSettings.Colliders, arg_84_1.rawPointerPress.transform)

			arg_74_1:emit(var_0_0.ON_TOUCH_CHARACTER, var_0_0.BONE_TO_TOUCH[var_84_0] or arg_84_1.rawPointerPress.name)
		end
	end)
	arg_74_1.ladyAnimator:GetComponent("DftAniEvent"):SetCommonEvent(function(arg_85_0)
		if arg_74_1.nowState and arg_85_0.animatorStateInfo:IsName(arg_74_1.nowState) then
			existCall(arg_74_1.stateCallback)

			return
		end

		local var_85_0 = arg_85_0.animatorStateInfo

		for iter_85_0, iter_85_1 in pairs(arg_74_1.animCallbacks) do
			if var_85_0:IsName(iter_85_0) then
				warning("Active", iter_85_0)

				local var_85_1 = table.removebykey(arg_74_1.animCallbacks, iter_85_0)

				existCall(var_85_1)

				return
			end
		end

		if arg_85_0.stringParameter ~= "" then
			arg_74_1:OnAnimationEvent(arg_85_0)
		end
	end)

	arg_74_1.animEventCallbacks = {}
	arg_74_1.animCallbacks = {}
end

function var_0_0.SwitchCharacterSkin(arg_86_0, arg_86_1, arg_86_2, arg_86_3, arg_86_4)
	local var_86_0 = arg_86_1.skinIdList

	assert(table.contains(var_86_0, arg_86_3))

	local var_86_1 = arg_86_0:GetCurrentAnim()
	local var_86_2 = arg_86_1.skinId
	local var_86_3 = arg_86_1.skinDict[var_86_2].ladyGameobject
	local var_86_4 = var_86_3.transform.position
	local var_86_5 = var_86_3.transform.rotation

	setActive(var_86_3, false)

	arg_86_1.skinId = arg_86_3

	setActive(arg_86_1.skinDict[arg_86_3].ladyGameobject, true)

	arg_86_1.ladyGameobject = arg_86_1.skinDict[arg_86_3].ladyGameobject
	arg_86_1.ladyCollider = nil

	arg_86_0:InitCharacter(arg_86_1, arg_86_2)
	arg_86_1.ladyAnimator:Play(var_86_1, arg_86_1.ladyAnimBaseLayerIndex)
	arg_86_1.ladyAnimator:Update(0)
	arg_86_1.lady:SetPositionAndRotation(var_86_4, var_86_5)
	existCall(arg_86_4)
end

function var_0_0.SetCameraLady(arg_87_0, arg_87_1)
	arg_87_0.cameraAim2.LookAt = arg_87_1.ladyInterestRoot
	arg_87_0.cameras[var_0_0.CAMERA.TALK].Follow = arg_87_0.ladyInterest
	arg_87_0.cameras[var_0_0.CAMERA.TALK].LookAt = arg_87_0.ladyInterest
	arg_87_0.cameraGift.Follow = arg_87_0.ladyInterest
	arg_87_0.cameraGift.LookAt = arg_87_0.ladyInterest
	arg_87_0.cameraRole2.LookAt = arg_87_1.ladyInterestRoot
	arg_87_0.cameras[var_0_0.CAMERA.PHOTO].Follow = arg_87_0.ladyInterest
	arg_87_0.cameras[var_0_0.CAMERA.PHOTO].LookAt = arg_87_0.ladyInterest
end

function var_0_0.initNodeCanvas(arg_88_0)
	local var_88_0 = pg.NodeCanvasMgr.GetInstance()

	var_88_0:Active()
	var_88_0:RegisterFunc("DistanceTrigger", function(arg_89_0)
		arg_88_0:emit(var_0_0.DISTANCE_TRIGGER, arg_89_0, arg_88_0.ladyDict[arg_89_0].dis)
	end)
	var_88_0:RegisterFunc("ShortWaitAction", function(arg_90_0)
		arg_88_0:DoShortWait(arg_90_0)
	end)
	var_88_0:RegisterFunc("WatchShortWaitAction", function(arg_91_0)
		arg_88_0:DoShortWait(arg_91_0)
	end)
	var_88_0:RegisterFunc("WalkDistanceTrigger", function(arg_92_0)
		arg_88_0:emit(var_0_0.WALK_DISTANCE_TRIGGER, arg_92_0, arg_88_0.ladyDict[arg_92_0].dis)
	end)
	var_88_0:RegisterFunc("ChangeWatch", function(arg_93_0)
		arg_88_0:emit(var_0_0.CHANGE_WATCH, arg_93_0)
	end)
end

function var_0_0.SetAllBlackbloardValue(arg_94_0, arg_94_1, arg_94_2)
	arg_94_0[arg_94_1] = arg_94_2

	for iter_94_0, iter_94_1 in pairs(arg_94_0.ladyDict) do
		arg_94_0:SetBlackboardValue(iter_94_1, arg_94_1, arg_94_2)
	end
end

function var_0_0.SetBlackboardValue(arg_95_0, arg_95_1, arg_95_2, arg_95_3)
	arg_95_1.blackboard = arg_95_1.blackboard or {}
	arg_95_1.blackboard[arg_95_2] = arg_95_3

	pg.NodeCanvasMgr.GetInstance():SetBlackboradValue(arg_95_2, arg_95_3, arg_95_1.ladyBlackboard)
end

function var_0_0.GetBlackboardValue(arg_96_0, arg_96_1, arg_96_2)
	arg_96_1.blackboard = arg_96_1.blackboard or {}

	return arg_96_1.blackboard[arg_96_2]
end

function var_0_0.didEnter(arg_97_0)
	local var_97_0 = -21.6 / Screen.height

	arg_97_0.joystickDelta = Vector2.zero
	arg_97_0.joystickTimer = FrameTimer.New(function()
		local var_98_0 = arg_97_0.joystickDelta * var_97_0
		local var_98_1 = var_98_0.x
		local var_98_2 = var_98_0.y

		local function var_98_3(arg_99_0, arg_99_1, arg_99_2)
			local var_99_0 = arg_99_0[arg_99_1]

			var_99_0.m_InputAxisValue = arg_99_2
			arg_99_0[arg_99_1] = var_99_0
		end

		if arg_97_0.surroudCamera and not arg_97_0.pinchMode then
			var_98_3(arg_97_0.surroudCamera, "m_XAxis", var_98_1)
			var_98_3(arg_97_0.surroudCamera, "m_YAxis", var_98_2)
		end

		arg_97_0.joystickDelta = Vector2.zero
	end, 1, -1)

	arg_97_0.joystickTimer:Start()

	local var_97_1 = 1.75

	arg_97_0.moveStickTimer = FrameTimer.New(function()
		if not arg_97_0.moveStickDraging then
			return
		end

		local var_100_0 = arg_97_0.moveStickPosition
		local var_100_1 = 200
		local var_100_2 = (var_100_0 - arg_97_0.moveStickOrigin):ClampMagnitude(var_100_1)
		local var_100_3 = var_100_2 / var_100_1

		arg_97_0.moveStickPosition = arg_97_0.moveStickOrigin + var_100_2

		local var_100_4 = Vector3.New(var_100_3.x, 0, var_100_3.y)
		local var_100_5 = arg_97_0.mainCameraTF:TransformDirection(var_100_4)

		var_100_5.y = 0

		local var_100_6 = var_100_5:Normalize()

		var_100_6:Mul(var_97_1)

		if isActive(arg_97_0.cameras[var_0_0.CAMERA.POV]) then
			arg_97_0.playerController:SimpleMove(var_100_6)

			arg_97_0.tweenFOV = true
		elseif isActive(arg_97_0.cameras[var_0_0.CAMERA.PHOTO_FREE]) then
			arg_97_0.cameras[var_0_0.CAMERA.PHOTO_FREE]:GetComponent(typeof(UnityEngine.CharacterController)):Move(var_100_6 * Time.deltaTime)
			arg_97_0:emit(Dorm3dPhotoMediator.CAMERA_STICK_MOVE, var_100_3:Normalize())
			onNextTick(function()
				local var_101_0 = arg_97_0.cameras[var_0_0.CAMERA.PHOTO_FREE]
				local var_101_1 = math.InverseLerp(arg_97_0.restrictedHeightRange[1], arg_97_0.restrictedHeightRange[2], var_101_0.position.y)

				arg_97_0:emit(Dorm3dPhotoMediator.CAMERA_LIFT_CHANGED, var_101_1)
			end)
		end
	end, 1, -1)

	arg_97_0.moveStickTimer:Start()

	arg_97_0.pinchMode = false
	arg_97_0.pinchSize = 0
	arg_97_0.pinchValue = 1
	arg_97_0.pinchNodeOrder = 1

	GlobalClickEventMgr.Inst:AddBeginPinchFunc(function(arg_102_0, arg_102_1)
		if arg_97_0.surroudCamera and isActive(arg_97_0.surroudCamera) then
			arg_97_0.pinchMode = true
			arg_97_0.pinchSize = (arg_102_0 - arg_102_1):Magnitude()
			arg_97_0.pinchNodeOrder = arg_102_1.x < arg_102_0.x and -1 or 1

			return
		end

		if isActive(arg_97_0.cameras[var_0_0.CAMERA.POV]) then
			if (arg_102_0 - arg_102_1):Magnitude() < Screen.height * 0.5 then
				arg_97_0.pinchMode = true
				arg_97_0.pinchSize = (arg_102_0 - arg_102_1):Magnitude()
				arg_97_0.pinchNodeOrder = arg_102_1.x < arg_102_0.x and -1 or 1
			end

			return
		end
	end)

	local var_97_2 = 0.01

	if IsUnityEditor then
		var_97_2 = 0.1
	end

	local var_97_3 = var_97_2 * 1080 / Screen.height

	GlobalClickEventMgr.Inst:AddPinchFunc(function(arg_103_0, arg_103_1)
		if not arg_97_0.pinchMode then
			return
		end

		local var_103_0 = (arg_103_0 - arg_103_1):Magnitude()
		local var_103_1 = arg_97_0.pinchSize - var_103_0
		local var_103_2 = arg_97_0.pinchNodeOrder * (arg_103_1.x < arg_103_0.x and -1 or 1)
		local var_103_3 = var_103_1 * var_97_3 * var_103_2

		if isActive(arg_97_0.cameras[var_0_0.CAMERA.POV]) then
			local var_103_4 = 0.5
			local var_103_5 = 1

			arg_97_0.pinchValue = math.clamp(arg_97_0.pinchValue + var_103_3, var_103_4, var_103_5)
			arg_97_0.pinchSize = var_103_0

			arg_97_0:SetPOVFOV(arg_97_0.POVOriginalFOV * arg_97_0.pinchValue)

			arg_97_0.tweenFOV = nil

			return
		end

		if isActive(arg_97_0.surroudCamera) and arg_97_0.surroudCamera == arg_97_0.cameras[var_0_0.CAMERA.PHOTO] then
			local var_103_6 = 0.5
			local var_103_7 = 1

			arg_97_0:SetPinchValue(math.clamp(arg_97_0.pinchValue + var_103_3, var_103_6, var_103_7))

			arg_97_0.pinchSize = var_103_0

			return
		end
	end)
	GlobalClickEventMgr.Inst:AddEndPinchFunc(function()
		arg_97_0.pinchMode = false
		arg_97_0.pinchSize = 0
	end)

	arg_97_0.cameraBlendCallbacks = {}
	arg_97_0.activeCMCamera = nil

	function arg_97_0.camBrainEvenetHandler.OnBlendStarted(arg_105_0)
		if arg_97_0.activeCMCamera then
			arg_97_0:OnCameraBlendFinished(arg_97_0.activeCMCamera)
		end

		local var_105_0 = arg_97_0.camBrain.ActiveVirtualCamera

		arg_97_0.activeCMCamera = var_105_0
	end

	function arg_97_0.camBrainEvenetHandler.OnBlendFinished(arg_106_0)
		arg_97_0.activeCMCamera = nil

		arg_97_0:OnCameraBlendFinished(arg_106_0)
	end

	for iter_97_0, iter_97_1 in pairs(arg_97_0.ladyDict) do
		if iter_97_1.tfPendintItem then
			onNextTick(function()
				setParent(iter_97_1.tfPendintItem, iter_97_1.lady)
			end)
		end

		iter_97_1.ladyOwner = GetComponent(iter_97_1.lady, "GraphOwner")
		iter_97_1.ladyBlackboard = GetComponent(iter_97_1.lady, "Blackboard")

		arg_97_0:SetBlackboardValue(iter_97_1, "groupId", iter_97_0)
		onNextTick(function()
			iter_97_1.ladyOwner.enabled = true
		end)
	end

	arg_97_0.expressionDict = {}

	pg.UIMgr.GetInstance():OverlayPanel(arg_97_0.blockLayer, {
		weight = LayerWeightConst.SECOND_LAYER,
		groupName = LayerWeightConst.GROUP_DORM3D
	})
	arg_97_0:ActiveCamera(arg_97_0.cameras[var_0_0.CAMERA.POV])
	arg_97_0:RefreshSlots()

	arg_97_0.updateHandler = UpdateBeat:CreateListener(function()
		xpcall(function()
			arg_97_0:Update()
		end, function(...)
			errorMsg(debug.traceback(...))
		end)
	end)

	UpdateBeat:AddListener(arg_97_0.updateHandler)
end

function var_0_0.InitData(arg_112_0)
	if not arg_112_0.contextData.ladyZone then
		arg_112_0.contextData.ladyZone = {}

		local var_112_0
		local var_112_1 = arg_112_0.room:getConfig("default_zone")

		for iter_112_0, iter_112_1 in ipairs(arg_112_0.contextData.groupIds) do
			for iter_112_2, iter_112_3 in ipairs(var_112_1) do
				if iter_112_3[1] == iter_112_1 then
					arg_112_0.contextData.ladyZone[iter_112_1] = iter_112_3[2]

					break
				end
			end

			assert(arg_112_0.contextData.ladyZone[iter_112_1])

			var_112_0 = var_112_0 or arg_112_0.contextData.ladyZone[iter_112_1]
		end

		arg_112_0.contextData.inFurnitureName = var_112_0 or arg_112_0.room:getConfig("default_zone")[1][2]
	end

	arg_112_0.zoneDatas = _.select(arg_112_0.room:GetZones(), function(arg_113_0)
		return not arg_113_0:IsGlobal()
	end)
	arg_112_0.activeSectors = {}
	arg_112_0.activeLady = {}
end

function var_0_0.Update(arg_114_0)
	arg_114_0.raycastCamera.fieldOfView = arg_114_0.mainCameraTF:GetComponent(typeof(Camera)).fieldOfView

	if arg_114_0.tweenFOV then
		local var_114_0 = Damp(1, 1, Time.deltaTime)

		arg_114_0.pinchValue = Mathf.Lerp(arg_114_0.pinchValue, 1, var_114_0)

		arg_114_0:SetPOVFOV(arg_114_0.POVOriginalFOV * arg_114_0.pinchValue)

		if arg_114_0.pinchValue > 0.99 then
			arg_114_0.tweenFOV = nil
		end
	end

	if isActive(arg_114_0.cameras[var_0_0.CAMERA.POV]) then
		arg_114_0:TriggerLadyDistance()
	end

	if arg_114_0.contactInRangeDic then
		local var_114_1 = arg_114_0.mainCameraTF.forward
		local var_114_2 = arg_114_0.mainCameraTF.position
		local var_114_3 = UnityEngine.Rect.New(0, 0, Screen.width, Screen.height)

		local function var_114_4(arg_115_0, arg_115_1, arg_115_2)
			local var_115_0 = arg_115_0.position - var_114_2
			local var_115_1 = Clone(var_115_0)

			var_115_1.y = 0

			if arg_115_1 < var_115_1.magnitude then
				return false
			end

			local var_115_2 = var_115_0:Normalize()
			local var_115_3 = math.acos(Vector3.Dot(var_115_2, var_114_1)) * math.rad2Deg

			if arg_115_2 < math.abs(var_115_3) then
				return false
			end

			local var_115_4 = arg_114_0.raycastCamera:WorldToScreenPoint(arg_115_0.position)

			if var_115_4.z < 0 then
				return false
			end

			if not var_114_3:Contains(var_115_4) then
				return false
			end

			return true
		end

		for iter_114_0, iter_114_1 in pairs(arg_114_0.contactInRangeDic) do
			local var_114_5 = pg.dorm3d_collection_template[iter_114_0]
			local var_114_6 = underscore.any(var_114_5.vfx_prefab, function(arg_116_0)
				return arg_114_0.modelRoot:Find(arg_116_0) and var_114_4(arg_114_0.modelRoot:Find(arg_116_0), 2, 60)
			end)

			if tobool(iter_114_1) ~= var_114_6 then
				arg_114_0.contactInRangeDic[iter_114_0] = var_114_6

				arg_114_0:UpdateContactDisplay(iter_114_0, var_114_6 and not arg_114_0.hideConcatFlag and arg_114_0.contactStateDic[iter_114_0] or arg_114_0.hideContactStateDic[iter_114_0])
			end
		end
	end

	if arg_114_0.enableFloatUpdate then
		arg_114_0.ladyDict[arg_114_0.apartment:GetConfigID()]:UpdateFloatPosition()
	end

	arg_114_0:CheckInSector()

	if arg_114_0.apartment then
		(function(arg_117_0)
			(function()
				if not arg_114_0.ikHandler then
					return
				end

				local var_118_0 = arg_114_0.ikHandler.screenPosition
				local var_118_1 = pg.UIMgr.GetInstance().uiCamera:Find("Canvas").rect
				local var_118_2 = var_118_0 - Vector2.New(var_118_1.width, var_118_1.height) * 0.5

				setAnchoredPosition(arg_114_0:GetIKHandTF(), var_118_2)

				if Time.time > arg_114_0.ikNextCheckStamp then
					arg_114_0.ikNextCheckStamp = arg_114_0.ikNextCheckStamp + var_0_0.IK_STATUS_DELTA

					local var_118_3 = _.detect(arg_117_0.readyIKLayers, function(arg_119_0)
						return arg_119_0:GetControllerPath() == arg_114_0.ikHandler.ikData:GetControllerPath()
					end)

					arg_114_0:emit(var_0_0.ON_IK_STATUS_CHANGED, var_118_3:GetConfigID(), var_0_0.IK_STATUS.DRAG)
				end
			end)()

			if arg_114_0.enableIKTip then
				local var_117_0 = Time.time > arg_114_0.nextTipIKTime
				local var_117_1 = arg_114_0:GetIKTipsRootTF()

				if var_117_0 then
					local var_117_2 = arg_117_0.ikConfig
					local var_117_3 = #arg_117_0.readyIKLayers + #var_117_2.touch_data

					UIItemList.StaticAlign(var_117_1, var_117_1:GetChild(0), var_117_3, function(arg_120_0, arg_120_1, arg_120_2)
						if arg_120_0 ~= UIItemList.EventUpdate then
							return
						end

						arg_120_1 = arg_120_1 + 1

						local var_120_0
						local var_120_1 = Vector2.zero

						if arg_120_1 > #arg_117_0.readyIKLayers then
							local var_120_2 = arg_120_1 - #arg_117_0.readyIKLayers
							local var_120_3 = var_117_2.touch_data[var_120_2][1]
							local var_120_4 = pg.dorm3d_ik_touch[var_120_3]

							if #var_120_4.scene_item > 0 then
								var_120_0 = arg_114_0:GetSceneItem(var_120_4.scene_item)
							else
								var_120_0 = arg_117_0.IKSettings.Colliders[var_120_4.body]
							end
						else
							local var_120_5 = arg_117_0.readyIKLayers[arg_120_1]
							local var_120_6 = var_120_5:GetTriggerBoneName()

							var_120_0 = var_120_6 and arg_117_0.IKSettings.Colliders[var_120_6] or nil
							var_120_1 = var_120_5:GetIKTipOffset()
						end

						if var_120_0 then
							local function var_120_7()
								local var_121_0 = arg_117_0.IKSettings.CameraRaycaster.eventCamera:WorldToScreenPoint(var_120_0.position)
								local var_121_1 = CameraMgr.instance:Raycast(arg_117_0.IKSettings.CameraRaycaster, var_121_0)

								if var_121_1.Length == 0 then
									return
								end

								return var_120_0 == var_121_1[0].gameObject.transform
							end
						end

						if var_120_0 then
							setLocalPosition(arg_120_2, arg_114_0:GetLocalPosition(arg_114_0:GetScreenPosition(var_120_0.position, arg_117_0.IKSettings.CameraRaycaster.eventCamera), var_117_1) + var_120_1)

							local var_120_8 = var_120_0.position
							local var_120_9 = var_120_0:GetComponent(typeof(UnityEngine.Collider))

							if var_120_9 then
								var_120_8 = var_120_9.bounds.center
							end

							setLocalPosition(arg_120_2, arg_114_0:GetLocalPosition(arg_114_0:GetScreenPosition(var_120_8), var_117_1) + var_120_1)
						end

						setActive(arg_120_2, var_120_0)
					end)
				end

				setActive(var_117_1, var_117_0)
				setActive(arg_114_0.ikTextTipsRoot, var_117_0)
			end
		end)(arg_114_0.ladyDict[arg_114_0.apartment:GetConfigID()])
	end
end

function var_0_0.CheckInSector(arg_122_0)
	if not isActive(arg_122_0.cameras[var_0_0.CAMERA.POV]) then
		return
	end

	local var_122_0 = arg_122_0.mainCameraTF.position

	var_122_0.y = 0

	for iter_122_0, iter_122_1 in pairs(arg_122_0.ladyDict) do
		local var_122_1 = tobool(arg_122_0.activeLady[iter_122_0])

		if var_122_1 ~= tobool(var_0_0.IsPointInSector(arg_122_0.activeSectors[iter_122_1.ladyActiveZone], var_122_0)) then
			arg_122_0.activeLady[iter_122_0] = not var_122_1

			arg_122_0:emit(var_0_0.ON_ENTER_SECTOR, iter_122_0)
		end
	end
end

function var_0_0.TriggerLadyDistance(arg_123_0)
	for iter_123_0, iter_123_1 in pairs(arg_123_0.ladyDict) do
		iter_123_1.dis = (iter_123_1.lady.position - arg_123_0.player.position).magnitude

		if (arg_123_0:GetBlackboardValue(iter_123_1, "inPending") and var_0_0.POV_PENDING_CLOSE_DISTANCE or var_0_0.POV_CLOSE_DISTANCE) > iter_123_1.dis ~= arg_123_0:GetBlackboardValue(iter_123_1, "inDistance") then
			arg_123_0:SetBlackboardValue(iter_123_1, "inDistance", iter_123_1.dis < var_0_0.POV_CLOSE_DISTANCE)
			arg_123_0:emit(var_0_0.ON_CHANGE_DISTANCE, iter_123_0, iter_123_1.dis < var_0_0.POV_CLOSE_DISTANCE)
		end
	end
end

function var_0_0.OnStickMove(arg_124_0, arg_124_1)
	arg_124_0.joystickDelta = arg_124_1
end

function var_0_0.SetPinchValue(arg_125_0, arg_125_1)
	arg_125_0.pinchValue = arg_125_1

	arg_125_0:SetCameraObrits()
end

function var_0_0.GetPOVFOV(arg_126_0)
	local var_126_0 = arg_126_0.cameras[var_0_0.CAMERA.POV].m_Lens

	return ReflectionHelp.RefGetField(typeof("Cinemachine.LensSettings"), "FieldOfView", var_126_0)
end

function var_0_0.SetPOVFOV(arg_127_0, arg_127_1)
	local var_127_0 = arg_127_0.cameras[var_0_0.CAMERA.POV].m_Lens

	ReflectionHelp.RefSetField(typeof("Cinemachine.LensSettings"), "FieldOfView", var_127_0, arg_127_1)

	arg_127_0.cameras[var_0_0.CAMERA.POV].m_Lens = var_127_0
end

function var_0_0.RefreshSlots(arg_128_0, arg_128_1)
	arg_128_1 = arg_128_1 or arg_128_0.room

	local var_128_0 = arg_128_1:GetSlots()
	local var_128_1 = arg_128_1:GetFurnitures()

	arg_128_0:emit(var_0_0.SHOW_BLOCK)
	table.ParallelIpairsAsync(var_128_0, function(arg_129_0, arg_129_1, arg_129_2)
		local var_129_0 = arg_129_1:GetConfigID()
		local var_129_1 = _.detect(var_128_1, function(arg_130_0)
			return arg_130_0:GetSlotID() == var_129_0
		end)
		local var_129_2 = var_129_1 and var_129_1:GetModel() or false
		local var_129_3 = arg_128_0.slotDict[var_129_0].model

		arg_128_0.slotDict[var_129_0].displayModelName = var_129_2
		arg_128_0.slotDict[var_129_0].furnitureId = var_129_1 and var_129_1:GetConfigID()

		local function var_129_4(arg_131_0)
			if var_129_3 then
				setActive(var_129_3, var_129_2 == "")
			end

			table.Foreach(arg_128_0.slotDict[var_129_0].sceneHides or {}, function(arg_132_0, arg_132_1)
				setActive(arg_132_1.trans, arg_132_1.visible)
			end)

			arg_128_0.slotDict[var_129_0].sceneHides = {}

			if arg_131_0 then
				local var_131_0 = arg_131_0:getConfig("scene_hides")

				if #var_131_0 > 0 then
					table.Ipairs(var_131_0, function(arg_133_0, arg_133_1)
						local var_133_0 = arg_128_0.modelRoot:Find(arg_133_1)

						assert(var_133_0, string.format("dorm3d_furniture_template:%d scene_hides missing scene item :%s", arg_131_0:GetConfigID(), arg_133_1))

						local var_133_1 = isActive(var_133_0)

						table.insert(arg_128_0.slotDict[var_129_0].sceneHides, {
							name = arg_133_1,
							trans = var_133_0,
							visible = var_133_1
						})
						setActive(var_133_0, false)
					end)
				end
			end
		end

		if var_129_2 == false or var_129_2 == "" then
			arg_128_0.loader:ClearRequest("slot_" .. var_129_0)
			var_129_4()
			arg_129_2()

			return
		end

		local var_129_5 = arg_128_0.slotDict[var_129_0].trans

		if arg_128_0.loader:GetLoadingRP("slot_" .. var_129_0) then
			arg_128_0:emit(var_0_0.HIDE_BLOCK)
		end

		arg_128_0.loader:GetPrefabBYStopLoading("dorm3d/furniture/prefabs/" .. var_129_2, "", function(arg_134_0)
			arg_129_2()
			assert(arg_134_0)
			setParent(arg_134_0, var_129_5)
			var_129_4(var_129_1)
		end, "slot_" .. var_129_0)
	end, function()
		arg_128_0:emit(var_0_0.HIDE_BLOCK)
	end)
end

function var_0_0.CheckSceneItemActiveByPath(arg_136_0, arg_136_1)
	local var_136_0 = arg_136_0:GetSceneItem(arg_136_1)

	return arg_136_0:CheckSceneItemActive(var_136_0)
end

function var_0_0.CheckSceneItemActive(arg_137_0, arg_137_1)
	local var_137_0 = true
	local var_137_1

	table.Checkout(arg_137_0.slotDict, function(arg_138_0, arg_138_1)
		if underscore.detect(arg_138_1.sceneHides, function(arg_139_0)
			return arg_139_0.trans == arg_137_1
		end) then
			var_137_0 = false
			var_137_1 = arg_138_1.furnitureId

			return false
		end
	end)

	return var_137_0, var_137_1
end

function var_0_0.ChangeCharacterPosition(arg_140_0, arg_140_1)
	arg_140_0:ResetCharPoint(arg_140_1, arg_140_1.ladyActiveZone)
	arg_140_0:SyncInterestTransform(arg_140_1)
end

function var_0_0.SyncCurrentInterestTransform(arg_141_0)
	local var_141_0 = arg_141_0.ladyDict[arg_141_0.apartment:GetConfigID()]

	arg_141_0:SyncInterestTransform(var_141_0)
end

function var_0_0.SyncInterestTransform(arg_142_0, arg_142_1)
	arg_142_0.ladyInterest.position = arg_142_1.ladyInterestRoot.position
	arg_142_0.ladyInterest.rotation = arg_142_1.ladyInterestRoot.rotation
end

function var_0_0.ChangePlayerPosition(arg_143_0, arg_143_1)
	arg_143_1 = arg_143_1 or arg_143_0.contextData.inFurnitureName

	local var_143_0 = arg_143_0.furnitures:Find(arg_143_1):Find("PlayerPoint").position

	arg_143_0.player.position = var_143_0
	arg_143_0.cameras[var_0_0.CAMERA.POV].transform.position = arg_143_0.playerEye.position

	local var_143_1 = arg_143_0.ladyInterest.position - arg_143_0.playerEye.position
	local var_143_2 = Quaternion.LookRotation(var_143_1).eulerAngles
	local var_143_3 = var_143_2.y
	local var_143_4 = var_143_2.x
	local var_143_5 = arg_143_0.compPovAim.m_HorizontalAxis

	var_143_5.Value = arg_143_0:GetNearestAngle(var_143_3, var_143_5.m_MinValue, var_143_5.m_MaxValue)
	arg_143_0.compPovAim.m_HorizontalAxis = var_143_5

	local var_143_6 = arg_143_0.compPovAim.m_VerticalAxis

	var_143_6.Value = var_143_4
	arg_143_0.compPovAim.m_VerticalAxis = var_143_6
end

function var_0_0.GetAttachedFurnitureName(arg_144_0)
	return arg_144_0.contextData.inFurnitureName
end

function var_0_0.GetFurnitureByName(arg_145_0, arg_145_1)
	return underscore.detect(arg_145_0.attachedPoints, function(arg_146_0)
		return arg_146_0.name == arg_145_1
	end)
end

function var_0_0.GetSlotByID(arg_147_0, arg_147_1)
	return arg_147_0.displaySlots[arg_147_1] and arg_147_0.displaySlots[arg_147_1].trans
end

function var_0_0.GetScreenPosition(arg_148_0, arg_148_1, arg_148_2)
	arg_148_2 = arg_148_2 or arg_148_0.raycastCamera

	local var_148_0 = arg_148_2:WorldToScreenPoint(arg_148_1)

	if var_148_0.z < 0 then
		var_148_0.x = var_148_0.x + (var_148_0.x < 0 and -1 or 1) * Screen.width
		var_148_0.y = var_148_0.y + (var_148_0.y < 0 and -1 or 1) * Screen.height
		var_148_0.z = -var_148_0.z
	end

	return var_148_0
end

function var_0_0.GetLocalPosition(arg_149_0, arg_149_1, arg_149_2)
	return LuaHelper.ScreenToLocal(arg_149_2, arg_149_1, pg.UIMgr.GetInstance().uiCameraComp)
end

function var_0_0.GetModelRoot(arg_150_0)
	return arg_150_0.modelRoot
end

function var_0_0.ShiftZone(arg_151_0, arg_151_1, arg_151_2)
	local var_151_0 = arg_151_0:GetFurnitureByName(arg_151_1)

	if not var_151_0 then
		errorMsg(arg_151_1 .. " Not Find")
		existCall(arg_151_2)

		return
	end

	seriesAsync({
		function(arg_152_0)
			arg_151_0:emit(var_0_0.SHOW_BLOCK)
			arg_151_0:ShowBlackScreen(true, arg_152_0)
		end,
		function(arg_153_0)
			if arg_151_0.shiftLady or arg_151_0.room:isPersonalRoom() then
				local var_153_0 = arg_151_0.shiftLady or arg_151_0.apartment:GetConfigID()

				arg_151_0.shiftLady = nil
				arg_151_0.contextData.ladyZone[var_153_0] = var_151_0.name

				local var_153_1 = arg_151_0.ladyDict[var_153_0]

				var_153_1.ladyBaseZone = arg_151_0.contextData.ladyZone[var_153_0]
				var_153_1.ladyActiveZone = arg_151_0.contextData.ladyZone[var_153_0]

				if arg_151_0:GetBlackboardValue(var_153_1, "inPending") then
					arg_151_0:SetOutPending(var_153_1)
					arg_151_0:SwitchAnim(var_153_1, var_0_0.ANIM.IDLE)
					onNextTick(function()
						arg_151_0:ChangeCharacterPosition(var_153_1)
						arg_153_0()
					end)
				else
					arg_151_0:ChangeCharacterPosition(var_153_1)
					arg_153_0()
				end
			else
				arg_153_0()
			end
		end,
		function(arg_155_0)
			arg_151_0.contextData.inFurnitureName = var_151_0.name

			if not arg_151_0.apartment then
				for iter_155_0, iter_155_1 in pairs(arg_151_0.ladyDict) do
					if iter_155_1.ladyBaseZone == arg_151_0.contextData.inFurnitureName then
						arg_151_0:SyncInterestTransform(iter_155_1)

						break
					end
				end
			end

			arg_151_0:ChangePlayerPosition()
			arg_151_0:TriggerLadyDistance()
			arg_151_0:CheckInSector()
			arg_155_0()
		end,
		function(arg_156_0)
			arg_151_0:UpdateZoneList()
			arg_151_0:ShowBlackScreen(false, arg_156_0)
		end,
		function(arg_157_0)
			arg_151_0:emit(var_0_0.HIDE_BLOCK)
			arg_157_0()
		end
	}, arg_151_2)
end

function var_0_0.ActiveCamera(arg_158_0, arg_158_1)
	local var_158_0 = isActive(arg_158_1)

	table.Foreach(arg_158_0.cameras, function(arg_159_0, arg_159_1)
		setActive(arg_159_1, arg_159_1 == arg_158_1)
	end)

	if var_158_0 then
		arg_158_0:OnCameraBlendFinished(arg_158_1)
	end
end

function var_0_0.ShowBlackScreen(arg_160_0, arg_160_1, arg_160_2)
	local var_160_0 = arg_160_0.blackSceneInfo or {
		color = "#000000",
		time = 0.3,
		delay = arg_160_1 and 0 or 0.3
	}

	setImageColor(arg_160_0.blackLayer, Color.NewHex(var_160_0.color))
	setActive(arg_160_0.blackLayer, true)
	setCanvasGroupAlpha(arg_160_0.blackLayer, arg_160_1 and 0 or 1)
	arg_160_0:managedTween(LeanTween.alphaCanvas, function()
		if not arg_160_1 then
			setActive(arg_160_0.blackLayer, false)
		end

		existCall(arg_160_2)
	end, GetComponent(arg_160_0.blackLayer, typeof(CanvasGroup)), arg_160_1 and 1 or 0, var_160_0.time):setDelay(var_160_0.delay)
end

function var_0_0.RegisterOrbits(arg_162_0, arg_162_1)
	arg_162_0 = arg_162_0.scene
	arg_162_0.orbits = {
		original = arg_162_1.m_Orbits
	}
	arg_162_0.orbits.current = _.range(3):map(function(arg_163_0)
		local var_163_0 = arg_162_0.orbits.original[arg_163_0 - 1]

		return Cinemachine.CinemachineFreeLook.Orbit.New(var_163_0.m_Height, var_163_0.m_Radius)
	end)
	arg_162_0.surroudCamera = arg_162_1
end

function var_0_0.SetCameraObrits(arg_164_0)
	local var_164_0 = arg_164_0.surroudCamera

	if not var_164_0 then
		return
	end

	local var_164_1 = arg_164_0.orbits.original[1]

	for iter_164_0 = 0, #arg_164_0.orbits.current - 1 do
		local var_164_2 = arg_164_0.orbits.current[iter_164_0 + 1]
		local var_164_3 = arg_164_0.orbits.original[iter_164_0]

		var_164_2.m_Height = math.lerp(var_164_1.m_Height, var_164_3.m_Height, arg_164_0.pinchValue)
		var_164_2.m_Radius = var_164_3.m_Radius * arg_164_0.pinchValue
	end

	var_164_0.m_Orbits = arg_164_0.orbits.current
end

function var_0_0.RevertCameraOrbit(arg_165_0)
	arg_165_0 = arg_165_0.scene

	local var_165_0 = arg_165_0.surroudCamera

	if not var_165_0 then
		return
	end

	for iter_165_0 = 0, #arg_165_0.orbits.current - 1 do
		local var_165_1 = arg_165_0.orbits.current[iter_165_0 + 1]
		local var_165_2 = arg_165_0.orbits.original[iter_165_0]

		var_165_1.m_Height = var_165_2.m_Height
		var_165_1.m_Radius = var_165_2.m_Radius
	end

	var_165_0.m_Orbits = arg_165_0.orbits.current
	arg_165_0.surroudCamera = nil
end

function var_0_0.ActiveStateCamera(arg_166_0, arg_166_1, arg_166_2)
	local var_166_0 = {
		base = function(arg_167_0)
			arg_166_0:RegisterCameraBlendFinished(arg_166_0.cameras[var_0_0.CAMERA.POV], arg_167_0)
			arg_166_0:ActiveCamera(arg_166_0.cameras[var_0_0.CAMERA.POV])
		end,
		watch = function(arg_168_0)
			assert(arg_166_0.apartment)
			arg_166_0:SyncInterestTransform(arg_166_0.ladyDict[arg_166_0.apartment:GetConfigID()])
			arg_166_0:SetCameraLady(arg_166_0.ladyDict[arg_166_0.apartment:GetConfigID()])
			arg_166_0:RegisterCameraBlendFinished(arg_166_0.cameras[var_0_0.CAMERA.ROLE], arg_168_0)
			arg_166_0:ActiveCamera(arg_166_0.cameras[var_0_0.CAMERA.ROLE])
		end,
		walk = function(arg_169_0)
			arg_166_0:RegisterCameraBlendFinished(arg_166_0.cameras[var_0_0.CAMERA.POV], arg_169_0)
			arg_166_0:ActiveCamera(arg_166_0.cameras[var_0_0.CAMERA.POV])
		end,
		ik = function(arg_170_0)
			arg_170_0()
		end,
		gift = function(arg_171_0)
			assert(arg_166_0.apartment)
			arg_166_0:SetCameraLady(arg_166_0.ladyDict[arg_166_0.apartment:GetConfigID()])
			arg_166_0:RegisterCameraBlendFinished(arg_166_0.cameras[var_0_0.CAMERA.GIFT], arg_171_0)
			arg_166_0:ActiveCamera(arg_166_0.cameras[var_0_0.CAMERA.GIFT])
		end,
		standby = function(arg_172_0)
			assert(arg_166_0.apartment)
			arg_166_0:SetCameraLady(arg_166_0.ladyDict[arg_166_0.apartment:GetConfigID()])

			arg_166_0.cameras[var_0_0.CAMERA.ROLE2].transform.position = arg_166_0.cameraRole.transform.position

			arg_166_0:RegisterCameraBlendFinished(arg_166_0.cameras[var_0_0.CAMERA.ROLE2], arg_172_0)
			arg_166_0:ActiveCamera(arg_166_0.cameras[var_0_0.CAMERA.ROLE2])
		end,
		talk = function(arg_173_0)
			assert(arg_166_0.apartment)
			arg_166_0:SetCameraLady(arg_166_0.ladyDict[arg_166_0.apartment:GetConfigID()])
			arg_166_0:SyncInterestTransform(arg_166_0.ladyDict[arg_166_0.apartment:GetConfigID()])
			arg_166_0:RegisterCameraBlendFinished(arg_166_0.cameras[var_0_0.CAMERA.TALK], arg_173_0)
			arg_166_0:ActiveCamera(arg_166_0.cameras[var_0_0.CAMERA.TALK])
		end
	}
	local var_166_1 = {}

	table.insert(var_166_1, function(arg_174_0)
		switch(arg_166_1, var_166_0, arg_174_0, arg_174_0)
	end)
	seriesAsync(var_166_1, arg_166_2)
end

function var_0_0.GetSceneItem(arg_175_0, arg_175_1)
	local var_175_0

	if string.find(arg_175_1, "fbx/") == 1 then
		var_175_0 = arg_175_0.modelRoot:Find(arg_175_1)
	elseif string.find(arg_175_1, "FurnitureSlots/") == 1 then
		arg_175_1 = string.gsub(arg_175_1, "^FurnitureSlots/", "", 1)
		var_175_0 = arg_175_0.slotRoot:Find(arg_175_1)
	end

	if not var_175_0 then
		warning(string.format("Missing scene item path: %s", arg_175_1))
	end

	return var_175_0
end

function var_0_0.SetIKStatus(arg_176_0, arg_176_1, arg_176_2, arg_176_3)
	warning("Set IKStatus " .. (arg_176_2.id or "NIL"))

	arg_176_0.enableIKTip = true

	arg_176_0:ResetIKTipTimer()
	setActive(arg_176_1.ladyCollider, false)
	_.each(arg_176_1.ladyTouchColliders, function(arg_177_0)
		setActive(arg_177_0, true)
	end)

	arg_176_0.blockIK = nil
	arg_176_1.ikActionDict = {}
	arg_176_1.readyIKLayers = {}
	arg_176_1.IKSettings = {
		Colliders = arg_176_1.ladyColliders,
		CameraRaycaster = arg_176_0.sceneRaycaster
	}

	local var_176_0 = _.map(arg_176_2.ik_id, function(arg_178_0)
		local var_178_0 = Dorm3dIK.New({
			configId = arg_178_0[1]
		})
		local var_178_1 = arg_178_0[3]
		local var_178_2 = var_178_1[1]
		local var_178_3 = switch(var_178_2, {
			function(arg_179_0, arg_179_1)
				return 0
			end,
			function()
				return 0
			end,
			function(arg_181_0, arg_181_1)
				return arg_181_0
			end,
			function(arg_182_0, arg_182_1)
				return arg_182_0
			end,
			function(arg_183_0, arg_183_1, arg_183_2, arg_183_3)
				return arg_183_0
			end,
			function(arg_184_0)
				return 0
			end
		}, function(arg_185_0)
			return var_178_2(arg_185_0) == "number" and arg_185_0 or 0
		end, unpack(var_178_1, 2))

		table.insert(arg_176_1.readyIKLayers, var_178_0)

		arg_176_1.ikActionDict[var_178_0:GetControllerPath()] = var_178_1

		local var_178_4 = var_178_0:GetSubTargets()
		local var_178_5 = var_178_0:GetPlaneRotations()
		local var_178_6 = var_178_0:GetPlaneScales()
		local var_178_7 = _.map(_.range(#var_178_4), function(arg_186_0)
			return {
				name = var_178_4[arg_186_0][1],
				planeRot = var_178_5[arg_186_0],
				planeScale = var_178_6[arg_186_0]
			}
		end)

		return Dorm3dIKController.New({
			triggerName = var_178_0:getConfig("trigger_param")[2],
			controllerName = var_178_0:GetControllerPath(),
			subTargets = var_178_7,
			actionType = var_178_0:GetActionTriggerParams()[1],
			controlRect = var_178_0:GetRect(),
			actionRect = var_178_0:GetTriggerRect(),
			backTime = var_178_0:GetRevertTime(),
			actionRevertTime = var_178_3
		})
	end)

	pg.IKMgr.GetInstance():RegisterEnv(arg_176_1.ladyIKRoot, arg_176_1.ladyBoneMaps)
	arg_176_0:RegisterIKFunc()
	pg.IKMgr.GetInstance():SetIKStatus(var_176_0)

	local var_176_1 = _.map(arg_176_2.touch_data, function(arg_187_0)
		return arg_187_0[1]
	end)

	table.Foreach(var_176_1, function(arg_188_0, arg_188_1)
		local var_188_0 = pg.dorm3d_ik_touch[arg_188_1]

		if #var_188_0.scene_item == 0 then
			return
		end

		local var_188_1 = arg_176_0:GetSceneItem(var_188_0.scene_item)

		if not var_188_1 then
			warning(string.format("dorm3d_ik_touch:%d without scene_item:%s", arg_188_1, var_188_0.scene_item))

			return
		end

		if IsNil(GetComponent(var_188_1, typeof(UnityEngine.Collider))) then
			go(var_188_1):AddComponent(typeof(UnityEngine.BoxCollider))
		end

		local var_188_2 = GetOrAddComponent(var_188_1, typeof(EventTriggerListener))

		var_188_2.enabled = true

		var_188_2:AddPointClickFunc(function()
			arg_176_0.blockIK = true

			local var_189_0 = arg_176_2.touch_data[arg_188_0]
			local var_189_1, var_189_2, var_189_3 = unpack(var_189_0)

			arg_176_0:TouchModePointAction(arg_176_1, var_189_1, unpack(var_189_3))(function()
				arg_176_0.enableIKTip = true

				arg_176_0:ResetIKTipTimer()

				arg_176_0.blockIK = nil
			end)
		end)
	end)

	arg_176_0.camBrain.enabled = false

	if arg_176_0.cameras[var_0_0.CAMERA.IK_WATCH] then
		setActive(arg_176_0.cameras[var_0_0.CAMERA.IK_WATCH], false)

		arg_176_0.cameras[var_0_0.CAMERA.IK_WATCH] = nil
	end

	local var_176_2 = arg_176_0.cameraRoot:Find(arg_176_2.ik_camera)

	assert(var_176_2, "Missing IKCamera")

	arg_176_0.cameras[var_0_0.CAMERA.IK_WATCH] = var_176_2

	arg_176_0:ActiveCamera(arg_176_0.cameras[var_0_0.CAMERA.IK_WATCH])

	arg_176_0.camBrain.enabled = true

	local var_176_3 = var_176_2:GetComponent(typeof(Cinemachine.CinemachineFreeLook))

	if var_176_3 then
		arg_176_0:RegisterOrbits(var_176_3)
	end

	arg_176_0:SwitchAnim(arg_176_1, arg_176_2.character_action)
	arg_176_0:SettingHeadAimIK(arg_176_1, arg_176_2.head_track)
	arg_176_0:EnableCloth(arg_176_1, false)
	arg_176_0:EnableCloth(arg_176_1, arg_176_2.use_cloth, arg_176_2.cloth_colliders)
	;(function()
		local var_191_0 = arg_176_2.enter_scene_anim
		local var_191_1 = {}

		if var_191_0 and #var_191_0 > 0 then
			table.Ipairs(var_191_0, function(arg_192_0, arg_192_1)
				arg_176_0:PlaySceneItemAnim(arg_192_1[1], arg_192_1[2])
				table.insert(var_191_1, arg_192_1[1])
			end)
		end

		arg_176_0:ResetSceneItemAnimators(var_191_1)
	end)()
	;(function()
		local var_193_0 = arg_176_2.enter_extra_item
		local var_193_1 = {}

		if var_193_0 and #var_193_0 > 0 then
			table.Ipairs(var_193_0, function(arg_194_0, arg_194_1)
				local var_194_0 = arg_194_1[3] and Vector3.New(unpack(arg_194_1[3]))
				local var_194_1 = arg_194_1[4] and Quaternion.Euler(unpack(arg_194_1[4]))

				arg_176_0:LoadCharacterExtraItem(arg_176_1, arg_194_1[1], arg_194_1[2], var_194_0, var_194_1)
				table.insert(var_193_1, arg_194_1[1])
			end)
		end

		arg_176_0:ResetCharacterExtraItem(arg_176_1, var_193_1)
	end)()
	eachChild(arg_176_0.ikTextTipsRoot, function(arg_195_0)
		setActive(arg_195_0, false)
	end)
	_.each(arg_176_1.readyIKLayers, function(arg_196_0)
		local var_196_0 = arg_196_0:getConfig("tip_text")

		if not var_196_0 or #var_196_0 == 0 then
			return
		end

		local var_196_1 = arg_176_0.ikTextTipsRoot:Find(var_196_0)

		if not IsNil(var_196_1) then
			setActive(var_196_1, true)
		end
	end)
	onNextTick(function()
		local var_197_0 = arg_176_0.furnitures:Find(arg_176_2.character_position)

		arg_176_1.lady.position = var_197_0:Find("StayPoint").position
		arg_176_1.lady.rotation = var_197_0:Find("StayPoint").rotation

		existCall(arg_176_3)
	end)
end

function var_0_0.ExitIKStatus(arg_198_0, arg_198_1, arg_198_2, arg_198_3)
	arg_198_0.enableIKTip = false

	setActive(arg_198_1.ladyCollider, true)
	_.each(arg_198_1.ladyTouchColliders, function(arg_199_0)
		setActive(arg_199_0, false)
	end)

	arg_198_0.blockIK = nil

	pg.IKMgr.GetInstance():UnregisterEnv()

	arg_198_1.ikActionDict = nil
	arg_198_1.readyIKLayers = nil

	setActive(arg_198_0:GetIKTipsRootTF(), false)

	local var_198_0 = _.map(arg_198_2.touch_data or {}, function(arg_200_0)
		return arg_200_0[1]
	end)

	table.Foreach(var_198_0, function(arg_201_0, arg_201_1)
		local var_201_0 = pg.dorm3d_ik_touch[arg_201_1]

		if #var_201_0.scene_item == 0 then
			return
		end

		local var_201_1 = arg_198_0.modelRoot:Find(var_201_0.scene_item)

		if not var_201_1 then
			return
		end

		local var_201_2 = GetOrAddComponent(var_201_1, typeof(EventTriggerListener))

		var_201_2:ClearEvents()

		var_201_2.enabled = false
	end)
	arg_198_0:RevertCameraOrbit()
	setActive(arg_198_0.cameras[var_0_0.CAMERA.IK_WATCH], false)

	arg_198_0.cameras[var_0_0.CAMERA.IK_WATCH] = nil

	arg_198_0:EnableCloth(arg_198_1, false)
	arg_198_0:ResetHeadAimIK(arg_198_1)
	arg_198_0:SwitchAnim(arg_198_1, arg_198_2.character_action)
	arg_198_0:ResetSceneItemAnimators()
	arg_198_0:ResetCharacterExtraItem(arg_198_1)
	onNextTick(function()
		if arg_198_2.character_position then
			arg_198_1.ladyActiveZone = arg_198_2.character_position
		else
			arg_198_1.ladyActiveZone = arg_198_1.ladyBaseZone
		end

		arg_198_0:ChangeCharacterPosition(arg_198_1)
		arg_198_0:TriggerLadyDistance()
		arg_198_0:CheckInSector()
		existCall(arg_198_3)
	end)
end

function var_0_0.SetIKTimelineStatus(arg_203_0, arg_203_1, arg_203_2, arg_203_3, arg_203_4, arg_203_5)
	warning("Set IKStatus " .. (arg_203_3 or "NIL"))

	arg_203_0.enableIKTip = true

	arg_203_0:ResetIKTipTimer()

	arg_203_0.blockIK = nil

	local var_203_0 = pg.dorm3d_ik_timeline_status[arg_203_3]

	arg_203_1.readyIKLayers = {}
	arg_203_1.IKSettings = {
		CameraRaycaster = arg_203_4:GetComponent(typeof(UnityEngine.EventSystems.PhysicsRaycaster))
	}

	assert(arg_203_1.IKSettings.CameraRaycaster)

	local var_203_1 = {}

	table.IpairsCArray(arg_203_2:GetComponentsInChildren(typeof(UnityEngine.Collider), true), function(arg_204_0, arg_204_1)
		if arg_204_1:GetType():Equals(typeof(UnityEngine.MeshCollider)) then
			return
		end

		child = tf(arg_204_1)

		local var_204_0 = child.name
		local var_204_1 = var_204_0 and string.find(var_204_0, "Collider") or -1

		if var_204_1 <= 0 then
			errorMsg("Wrong Name to lady Collider : " .. var_204_0)

			return
		end

		local var_204_2 = string.sub(var_204_0, 1, var_204_1 - 1)

		if var_204_2 == "Body" then
			setActive(child, false)

			return
		end

		if var_0_0.BONE_TO_TOUCH[var_204_2] == nil then
			return
		end

		var_203_1[var_204_2] = child

		setActive(child, true)
	end)

	arg_203_1.IKSettings.Colliders = var_203_1
	arg_203_1.ikTimelineMode = true

	local var_203_2 = _.map(var_203_0.ik_id, function(arg_205_0)
		local var_205_0 = Dorm3dIK.New({
			configId = arg_205_0
		})

		table.insert(arg_203_1.readyIKLayers, var_205_0)

		local var_205_1 = var_205_0:GetSubTargets()
		local var_205_2 = var_205_0:GetPlaneRotations()
		local var_205_3 = var_205_0:GetPlaneScales()
		local var_205_4 = _.map(_.range(#var_205_1), function(arg_206_0)
			return {
				name = var_205_1[arg_206_0][1],
				planeRot = var_205_2[arg_206_0],
				planeScale = var_205_3[arg_206_0]
			}
		end)

		return Dorm3dIKController.New({
			triggerName = var_205_0:getConfig("trigger_param")[2],
			controllerName = var_205_0:GetControllerPath(),
			subTargets = var_205_4,
			actionType = var_205_0:GetActionTriggerParams()[1],
			controlRect = var_205_0:GetRect(),
			actionRect = var_205_0:GetTriggerRect(),
			backTime = var_205_0:GetRevertTime(),
			actionRevertTime = var_205_0:GetActionRevertTime(),
			timelineActionEvent = var_205_0:GetTimelineAction()
		})
	end)
	local var_203_3 = arg_203_2.transform:Find("IKLayers")
	local var_203_4 = {}
	local var_203_5 = {}

	table.Foreach(var_0_1, function(arg_207_0, arg_207_1)
		var_203_5[arg_207_1] = arg_207_0
	end)

	local var_203_6 = arg_203_2.transform:GetComponentsInChildren(typeof(Transform), true)

	table.IpairsCArray(var_203_6, function(arg_208_0, arg_208_1)
		if var_203_5[arg_208_1.name] then
			var_203_4[var_203_5[arg_208_1.name]] = arg_208_1
		end
	end)
	pg.IKMgr.GetInstance():RegisterEnv(var_203_3, var_203_4)
	arg_203_0:RegisterIKFunc()
	pg.IKMgr.GetInstance():SetIKStatus(var_203_2)
	existCall(arg_203_5)
end

function var_0_0.ExitIKTimelineStatus(arg_209_0, arg_209_1, arg_209_2)
	arg_209_0.enableIKTip = false
	arg_209_0.blockIK = nil

	pg.IKMgr.GetInstance():UnregisterEnv()

	arg_209_1.readyIKLayers = nil
	arg_209_1.IKSettings = nil

	setActive(arg_209_0:GetIKTipsRootTF(), false)
	existCall(arg_209_2)
end

function var_0_0.EnableIKLayer(arg_210_0, arg_210_1)
	local var_210_0 = arg_210_0.ladyDict[arg_210_0.apartment:GetConfigID()]

	if #arg_210_1:GetHeadTrackPath() > 0 then
		arg_210_0:SettingHeadAimIK(var_210_0, {
			2,
			arg_210_1:GetHeadTrackPath()
		}, true)
	end

	local var_210_1 = arg_210_1:GetTriggerFaceAnim()

	if #var_210_1 > 0 then
		arg_210_0:PlayFaceAnim(var_210_0, var_210_1)
	end

	setActive(arg_210_0:GetIKHandTF(), true)
	eachChild(arg_210_0:GetIKHandTF(), function(arg_211_0)
		setActive(arg_211_0, false)
	end)
	arg_210_0:StopIKHandTimer()
	setActive(arg_210_0:GetIKHandTF():Find("Begin"), true)

	arg_210_0.ikHandTimer = Timer.New(function()
		setActive(arg_210_0:GetIKHandTF():Find("Begin"), false)
		setActive(arg_210_0:GetIKHandTF():Find("Normal"), true)
	end, 0.5, 1)

	arg_210_0.ikHandTimer:Start()

	if not var_210_0.ikTimelineMode then
		pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataTouch(arg_210_0.apartment.configId, arg_210_0.apartment.level, var_210_0.ikConfig.character_action, arg_210_1:GetTriggerParams()[2], arg_210_0.room:GetConfigID()))
	end
end

function var_0_0.DeactiveIKLayer(arg_213_0, arg_213_1)
	local var_213_0 = arg_213_0.ladyDict[arg_213_0.apartment:GetConfigID()]

	if not var_213_0.ikTimelineMode and #arg_213_1:GetHeadTrackPath() > 0 then
		arg_213_0:SettingHeadAimIK(var_213_0, var_213_0.ikConfig.head_track)
	end

	arg_213_0:StopIKHandTimer()
	setActive(arg_213_0:GetIKHandTF():Find("Begin"), false)
	setActive(arg_213_0:GetIKHandTF():Find("Normal"), false)
	setActive(arg_213_0:GetIKHandTF():Find("End"), true)

	arg_213_0.ikHandTimer = Timer.New(function()
		setActive(arg_213_0:GetIKHandTF():Find("End"), false)
		setActive(arg_213_0:GetIKHandTF(), false)
	end, 0.5, 1)

	arg_213_0.ikHandTimer:Start()
end

function var_0_0.StopIKHandTimer(arg_215_0)
	if not arg_215_0.ikHandTimer then
		return
	end

	arg_215_0.ikHandTimer:Stop()

	arg_215_0.ikHandTimer = nil
end

function var_0_0.PlayIKRevert(arg_216_0, arg_216_1, arg_216_2, arg_216_3)
	local var_216_0 = Time.time

	function arg_216_0.ikRevertHandler()
		local var_217_0 = Time.time - var_216_0

		_.each(arg_216_1.activeIKLayers, function(arg_218_0)
			local var_218_0 = 1

			if arg_216_2 > 0 then
				var_218_0 = var_217_0 / arg_216_2
			end

			local var_218_1 = arg_216_1.cacheIKInfos[arg_218_0].solvers
			local var_218_2 = arg_216_1.cacheIKInfos[arg_218_0].weights

			table.Foreach(var_218_1, function(arg_219_0, arg_219_1)
				arg_219_1.IKPositionWeight = math.lerp(var_218_2[arg_219_0], 0, var_218_0)
			end)
		end)

		if var_217_0 >= arg_216_2 then
			arg_216_0:ResetActiveIKs(arg_216_1)

			arg_216_0.ikRevertHandler = nil

			existCall(arg_216_3)
		end
	end

	arg_216_0.ikRevertHandler()
end

function var_0_0.ResetActiveIKs(arg_220_0, arg_220_1)
	table.insertto(arg_220_0.activeIKLayers, _.keys(arg_220_0.holdingStatus))
	table.clear(arg_220_0.holdingStatus)
	_.each(arg_220_1.activeIKLayers, function(arg_221_0)
		local var_221_0 = arg_221_0:GetControllerPath()
		local var_221_1 = arg_220_1.ladyIKRoot:Find(var_221_0):GetComponent(typeof(RootMotion.FinalIK.IKExecutionOrder))

		setActive(var_221_1, false)

		local var_221_2 = arg_220_1.cacheIKInfos[arg_221_0].solvers
		local var_221_3 = arg_220_1.cacheIKInfos[arg_221_0].weights

		table.Foreach(var_221_2, function(arg_222_0, arg_222_1)
			arg_222_1.IKPositionWeight = var_221_3[arg_222_0]
		end)
	end)
	table.clear(arg_220_1.activeIKLayers)
end

function var_0_0.ResetIKTipTimer(arg_223_0)
	if not arg_223_0.enableIKTip then
		return
	end

	arg_223_0.nextTipIKTime = Time.time + var_0_0.IK_TIP_WAIT_TIME
end

function var_0_0.EnableCurrentHeadIK(arg_224_0, arg_224_1)
	local var_224_0 = arg_224_0.ladyDict[arg_224_0.apartment:GetConfigID()]

	arg_224_0:EnableHeadIK(var_224_0, arg_224_1)
end

function var_0_0.EnableHeadIK(arg_225_0, arg_225_1, arg_225_2)
	arg_225_1.ladyHeadIKComp.enableIk = arg_225_2
end

function var_0_0.SettingHeadAimIK(arg_226_0, arg_226_1, arg_226_2, arg_226_3)
	local var_226_0

	if arg_226_2[1] == 1 then
		var_226_0 = arg_226_0.mainCameraTF:Find("AimTarget")
	elseif arg_226_2[1] == 2 then
		table.IpairsCArray(arg_226_1.lady:GetComponentsInChildren(typeof(Transform), true), function(arg_227_0, arg_227_1)
			if arg_227_1.name ~= arg_226_2[2] then
				return
			end

			var_226_0 = arg_227_1
		end)
	end

	arg_226_1.ladyHeadIKComp.AimTarget = var_226_0

	if not arg_226_3 and arg_226_2[3] then
		arg_226_1.ladyHeadIKComp.BodyWeight = arg_226_2[3]
	end

	if not arg_226_3 and arg_226_2[4] then
		arg_226_1.ladyHeadIKComp.HeadWeight = arg_226_2[4]
	end
end

function var_0_0.ResetHeadAimIK(arg_228_0, arg_228_1)
	arg_228_1.ladyHeadIKComp.AimTarget = arg_228_0.mainCameraTF:Find("AimTarget")
	arg_228_1.ladyHeadIKComp.HeadWeight = arg_228_1.ladyHeadIKData.HeadWeight
	arg_228_1.ladyHeadIKComp.BodyWeight = arg_228_1.ladyHeadIKData.BodyWeight
end

function var_0_0.HideCharacter(arg_229_0, arg_229_1)
	for iter_229_0, iter_229_1 in pairs(arg_229_0.ladyDict) do
		if iter_229_0 ~= arg_229_1 then
			arg_229_0:HideCharacterBylayer(iter_229_1)
		end
	end
end

function var_0_0.RevertCharacter(arg_230_0, arg_230_1)
	for iter_230_0, iter_230_1 in pairs(arg_230_0.ladyDict) do
		if iter_230_0 ~= arg_230_1 then
			arg_230_0:RevertCharacterBylayer(iter_230_1)
		end
	end
end

function var_0_0.HideCharacterBylayer(arg_231_0, arg_231_1)
	local var_231_0 = "Bip001"
	local var_231_1 = arg_231_1.lady:Find("all")

	for iter_231_0 = 0, var_231_1.childCount - 1 do
		local var_231_2 = var_231_1:GetChild(iter_231_0)

		if var_231_2.name ~= var_231_0 then
			pg.ViewUtils.SetLayer(var_231_2, Layer.Environment3D)
		end
	end

	if arg_231_1.tfPendintItem then
		pg.ViewUtils.SetLayer(arg_231_1.tfPendintItem, Layer.Environment3D)
	end

	if arg_231_1.ladyWatchFloat then
		pg.ViewUtils.SetLayer(arg_231_1.ladyWatchFloat, Layer.Environment3D)
	end

	GetComponent(arg_231_1.lady, "BLHXCharacterPropertiesController").enabled = false
end

function var_0_0.RevertCharacterBylayer(arg_232_0, arg_232_1)
	local var_232_0 = "Bip001"
	local var_232_1 = arg_232_1.lady:Find("all")

	for iter_232_0 = 0, var_232_1.childCount - 1 do
		local var_232_2 = var_232_1:GetChild(iter_232_0)

		if var_232_2.name ~= var_232_0 then
			pg.ViewUtils.SetLayer(var_232_2, Layer.Default)
		end
	end

	if arg_232_1.tfPendintItem then
		pg.ViewUtils.SetLayer(arg_232_1.tfPendintItem, Layer.Default)
	end

	if arg_232_1.ladyWatchFloat then
		pg.ViewUtils.SetLayer(arg_232_1.ladyWatchFloat, Layer.Default)
	end

	GetComponent(arg_232_1.lady, "BLHXCharacterPropertiesController").enabled = true
end

function var_0_0.EnterFurnitureWatchMode(arg_233_0)
	arg_233_0:SetAllBlackbloardValue("inLockLayer", true)
	arg_233_0:HideCharacter()
end

function var_0_0.ExitFurnitureWatchMode(arg_234_0)
	arg_234_0:HideFurnitureSlots()

	local var_234_0 = arg_234_0.cameras[var_0_0.CAMERA.POV]

	seriesAsync({
		function(arg_235_0)
			arg_234_0:emit(var_0_0.SHOW_BLOCK)
			arg_234_0:ShowBlackScreen(true, arg_235_0)
		end,
		function(arg_236_0)
			arg_234_0:RevertCharacter()
			arg_234_0:SetAllBlackbloardValue("inLockLayer", false)
			arg_234_0:RegisterCameraBlendFinished(var_234_0, arg_236_0)
			arg_234_0:ActiveCamera(var_234_0)
		end,
		function(arg_237_0)
			arg_234_0:ShowBlackScreen(false, arg_237_0)
		end
	}, function()
		arg_234_0:emit(var_0_0.HIDE_BLOCK)
	end)
	arg_234_0:RefreshSlots()
end

function var_0_0.SwitchFurnitureZone(arg_239_0, arg_239_1)
	local var_239_0 = arg_239_0:GetFurnitureByName(arg_239_1:GetWatchCameraName()):Find("FurnitureWatch Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))

	if arg_239_0.cameraFurnitureWatch and arg_239_0.cameraFurnitureWatch ~= var_239_0 then
		arg_239_0:UnRegisterCameraBlendFinished(arg_239_0.cameraFurnitureWatch)
		setActive(arg_239_0.cameraFurnitureWatch, false)
	end

	arg_239_0.cameraFurnitureWatch = var_239_0
	arg_239_0.cameras[var_0_0.CAMERA.FURNITURE_WATCH] = arg_239_0.cameraFurnitureWatch

	arg_239_0:RegisterCameraBlendFinished(arg_239_0.cameraFurnitureWatch, function()
		arg_239_0:emit(var_0_0.HIDE_BLOCK)
	end)
	arg_239_0:emit(var_0_0.SHOW_BLOCK)
	arg_239_0:ActiveCamera(arg_239_0.cameraFurnitureWatch)
end

function var_0_0.HideFurnitureSlots(arg_241_0)
	if arg_241_0.displaySlots then
		arg_241_0:UpdateDisplaySlots({})
		table.Foreach(arg_241_0.displaySlots, function(arg_242_0, arg_242_1)
			local var_242_0 = arg_242_1.trans

			if IsNil(var_242_0:Find("Selector")) then
				return
			end

			setActive(var_242_0:Find("Selector"), false)
		end)

		arg_241_0.displaySlots = nil
	end
end

function var_0_0.DisplayFurnitureSlots(arg_243_0, arg_243_1)
	arg_243_0:HideFurnitureSlots()

	arg_243_0.displaySlots = {}

	_.each(arg_243_1, function(arg_244_0)
		arg_243_0.displaySlots[arg_244_0] = arg_243_0.slotDict[arg_244_0]

		if not arg_243_0.displaySlots[arg_244_0] then
			errorMsg("Slot " .. arg_244_0 .. " Not Binding Scene Object")

			return
		end

		local var_244_0 = arg_243_0.displaySlots[arg_244_0].trans

		if var_244_0:Find("Selector") then
			setActive(var_244_0:Find("Selector"), true)
		end
	end)
end

function var_0_0.UpdateDisplaySlots(arg_245_0, arg_245_1)
	table.Foreach(arg_245_0.displaySlots, function(arg_246_0, arg_246_1)
		local var_246_0 = arg_246_1.trans

		if not IsNil(var_246_0:Find("Selector")) then
			setActive(var_246_0:Find("Selector/Normal"), arg_245_1[arg_246_0] == 0)
			setActive(var_246_0:Find("Selector/Active"), arg_245_1[arg_246_0] == 1)
			setActive(var_246_0:Find("Selector/Ban"), arg_245_1[arg_246_0] == 2)
		end

		local var_246_1 = arg_245_0.slotDict[arg_246_0].model
		local var_246_2 = arg_245_0.slotDict[arg_246_0].displayModelName

		if var_246_2 and var_246_2 ~= "" then
			var_246_1 = var_246_0:GetChild(var_246_0.childCount - 1)
		end

		local function var_246_3(arg_247_0, arg_247_1)
			local var_247_0 = arg_247_0:GetComponentsInChildren(typeof(Renderer), true)

			table.IpairsCArray(var_247_0, function(arg_248_0, arg_248_1)
				local var_248_0 = arg_248_1.material

				if var_248_0 and var_248_0:HasProperty("_FinalTint") then
					var_248_0:SetColor("_FinalTint", arg_247_1)
				end
			end)
		end

		if var_246_1 then
			if arg_245_1[arg_246_0] == 1 then
				var_246_3(var_246_1, Color.NewHex("3F83AE73"))
			else
				var_246_3(var_246_1, Color.New(0, 0, 0, 0))
			end
		end
	end)
end

function var_0_0.EnterPhotoMode(arg_249_0, arg_249_1, arg_249_2)
	arg_249_0:SetAllBlackbloardValue("inLockLayer", true)
	arg_249_0:emit(var_0_0.ENABLE_SCENEBLOCK, true)
	seriesAsync({
		function(arg_250_0)
			arg_249_0:TempHideUI(true, arg_250_0)
		end,
		function(arg_251_0)
			arg_249_0:ShowBlackScreen(true, arg_251_0)
		end,
		function(arg_252_0)
			local var_252_0 = arg_249_0.apartment:GetConfigID()
			local var_252_1 = arg_249_0.ladyDict[var_252_0]

			arg_249_0:SwitchAnim(var_252_1, arg_249_2)
			var_252_1.ladyAnimator:Update(0)
			var_252_1:ResetCharPoint(var_252_1, arg_249_1:GetWatchCameraName())
			arg_249_0:SyncInterestTransform(var_252_1)
			setActive(var_252_1.ladySafeCollider, true)
			arg_249_0:HideCharacter(var_252_0)

			local var_252_2 = arg_249_0.cameras[var_0_0.CAMERA.PHOTO]
			local var_252_3 = var_252_2.m_XAxis

			var_252_3.Value = 180
			var_252_2.m_XAxis = var_252_3

			local var_252_4 = var_252_2.m_YAxis

			var_252_4.Value = 0.7
			var_252_2.m_YAxis = var_252_4
			arg_249_0.pinchValue = 1

			arg_249_0:RegisterOrbits(arg_249_0.cameras[var_0_0.CAMERA.PHOTO])
			arg_249_0:SetCameraObrits()
			arg_249_0:RegisterCameraBlendFinished(var_252_2, arg_252_0)
			arg_249_0:ActiveCamera(var_252_2)
		end,
		function(arg_253_0)
			arg_249_0:ShowBlackScreen(false, arg_253_0)
		end
	}, function()
		arg_249_0:EnableJoystick(true)
	end)
end

function var_0_0.ExitPhotoMode(arg_255_0)
	arg_255_0:emit(var_0_0.SHOW_BLOCK)
	arg_255_0:EnableJoystick(false)
	seriesAsync({
		function(arg_256_0)
			arg_255_0:ShowBlackScreen(true, arg_256_0)
		end,
		function(arg_257_0)
			arg_255_0:RevertCameraOrbit()

			local var_257_0 = arg_255_0.ladyDict[arg_255_0.apartment:GetConfigID()]

			arg_255_0:SwitchAnim(var_257_0, var_0_0.ANIM.IDLE)
			setActive(var_257_0.ladySafeCollider, false)
			onNextTick(function()
				arg_255_0:ChangeCharacterPosition(var_257_0)
			end)

			if arg_255_0.contextData.photoFreeMode then
				arg_255_0:EnablePOVLayer(false)
				setActive(arg_255_0.restrictedBox, false)

				arg_255_0.contextData.photoFreeMode = nil
			end

			local var_257_1 = arg_255_0.cameras[var_0_0.CAMERA.POV]

			arg_255_0:RegisterCameraBlendFinished(var_257_1, arg_257_0)
			arg_255_0:ActiveCamera(var_257_1)
		end,
		function(arg_259_0)
			arg_255_0:RevertCharacter(arg_255_0.apartment:GetConfigID())
			arg_255_0:ShowBlackScreen(false, arg_259_0)
		end
	}, function()
		arg_255_0:RefreshSlots()
		arg_255_0:SetAllBlackbloardValue("inLockLayer", false)
		arg_255_0:emit(var_0_0.HIDE_BLOCK)
		arg_255_0:emit(var_0_0.ENABLE_SCENEBLOCK, false)
		arg_255_0:TempHideUI(false)
	end)
end

function var_0_0.SwitchCameraZone(arg_261_0, arg_261_1, arg_261_2, arg_261_3)
	arg_261_0:emit(var_0_0.SHOW_BLOCK)
	seriesAsync({
		function(arg_262_0)
			arg_261_0:ShowBlackScreen(true, arg_262_0)
		end,
		function(arg_263_0)
			local var_263_0 = arg_261_0.ladyDict[arg_261_0.apartment:GetConfigID()]

			arg_261_0:SwitchAnim(var_263_0, arg_261_2)
			onNextTick(function()
				arg_261_0:ResetCharPoint(var_263_0, arg_261_1:GetWatchCameraName())
				arg_261_0:SyncInterestTransform(var_263_0)

				if arg_261_0.contextData.photoFreeMode then
					arg_261_0.camBrain.enabled = false

					arg_261_0:SwitchPhotoCamera()

					arg_261_0.camBrain.enabled = true

					onDelayTick(function()
						arg_261_0.camBrain.enabled = false

						arg_261_0:SwitchPhotoCamera()

						arg_261_0.camBrain.enabled = true
					end, 0.1)
				end

				arg_263_0()
			end)
		end,
		function(arg_266_0)
			arg_261_0:ShowBlackScreen(false, arg_266_0)
		end
	}, function()
		arg_261_0:emit(var_0_0.HIDE_BLOCK)
		existCall(arg_261_3)
	end)
end

function var_0_0.SwitchPhotoCamera(arg_268_0)
	if not arg_268_0.contextData.photoFreeMode then
		arg_268_0:EnableJoystick(false)
		arg_268_0:EnablePOVLayer(true)
		setActive(arg_268_0.restrictedBox, true)

		local var_268_0 = arg_268_0.cameras[var_0_0.CAMERA.PHOTO_FREE]

		var_268_0.transform.position = arg_268_0.mainCameraTF.position

		local var_268_1 = arg_268_0.cameras[var_0_0.CAMERA.PHOTO_FREE]:Find("PhotoFree Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera)):GetCinemachineComponent(Cinemachine.CinemachineCore.Stage.Aim)
		local var_268_2 = arg_268_0.mainCameraTF.rotation:ToEulerAngles()
		local var_268_3 = var_268_1.m_HorizontalAxis

		var_268_3.Value = var_268_2.y
		var_268_1.m_HorizontalAxis = var_268_3

		local var_268_4 = var_268_1.m_VerticalAxis

		var_268_4.Value = arg_268_0:GetNearestAngle(var_268_2.x, var_268_4.m_MinValue, var_268_4.m_MaxValue)
		var_268_1.m_VerticalAxis = var_268_4

		local var_268_5 = math.InverseLerp(arg_268_0.restrictedHeightRange[1], arg_268_0.restrictedHeightRange[2], var_268_0.position.y)

		arg_268_0:emit(Dorm3dPhotoMediator.CAMERA_LIFT_CHANGED, var_268_5)
		arg_268_0:ActiveCamera(arg_268_0.cameras[var_0_0.CAMERA.PHOTO_FREE])
	else
		arg_268_0:EnableJoystick(true)
		arg_268_0:EnablePOVLayer(false)
		setActive(arg_268_0.restrictedBox, false)
		arg_268_0:ActiveCamera(arg_268_0.cameras[var_0_0.CAMERA.PHOTO])
	end

	arg_268_0.contextData.photoFreeMode = not arg_268_0.contextData.photoFreeMode
end

function var_0_0.SetPhotoCameraHeight(arg_269_0, arg_269_1)
	local var_269_0 = math.lerp(arg_269_0.restrictedHeightRange[1], arg_269_0.restrictedHeightRange[2], arg_269_1)
	local var_269_1 = arg_269_0.cameras[var_0_0.CAMERA.PHOTO_FREE]

	var_269_1:GetComponent(typeof(UnityEngine.CharacterController)):Move(Vector3.New(0, var_269_0 - var_269_1.position.y, 0))
	onNextTick(function()
		local var_270_0 = math.InverseLerp(arg_269_0.restrictedHeightRange[1], arg_269_0.restrictedHeightRange[2], var_269_1.position.y)

		arg_269_0:emit(Dorm3dPhotoMediator.CAMERA_LIFT_CHANGED, var_270_0)
	end)
end

function var_0_0.ResetPhotoCameraPosition(arg_271_0)
	local var_271_0 = arg_271_0.cameras[var_0_0.CAMERA.PHOTO]
	local var_271_1 = var_271_0.m_XAxis

	var_271_1.Value = 180
	var_271_0.m_XAxis = var_271_1

	local var_271_2 = var_271_0.m_YAxis

	var_271_2.Value = 0.7
	var_271_0.m_YAxis = var_271_2
end

function var_0_0.ResetCurrentCharPoint(arg_272_0, arg_272_1)
	local var_272_0 = arg_272_0.ladyDict[arg_272_0.apartment:GetConfigID()]

	arg_272_0:ResetCharPoint(var_272_0, arg_272_1)
end

function var_0_0.ResetCharPoint(arg_273_0, arg_273_1, arg_273_2)
	local var_273_0 = arg_273_0.furnitures:Find(arg_273_2 .. "/StayPoint")

	arg_273_1.lady.position = var_273_0.position
	arg_273_1.lady.rotation = var_273_0.rotation
end

function var_0_0.GetNearestAngle(arg_274_0, arg_274_1, arg_274_2, arg_274_3)
	if arg_274_3 < arg_274_2 then
		arg_274_3 = arg_274_3 + 360
	end

	if arg_274_2 <= arg_274_1 and arg_274_1 <= arg_274_3 then
		return arg_274_1
	end

	local var_274_0 = (arg_274_2 + arg_274_3) / 2

	arg_274_1 = var_274_0 - Mathf.DeltaAngle(arg_274_1, var_274_0)
	arg_274_1 = math.clamp(arg_274_1, arg_274_2, arg_274_3)

	return arg_274_1
end

function var_0_0.PlayTimeline(arg_275_0, arg_275_1, arg_275_2)
	local var_275_0 = {}

	if arg_275_0.waitForTimeline then
		table.insert(var_275_0, function(arg_276_0)
			local var_276_0 = arg_275_0.waitForTimeline

			arg_275_0.waitForTimeline = nil

			var_276_0()
			arg_276_0()
		end)
	end

	table.insert(var_275_0, function(arg_277_0)
		arg_275_0:LoadTimelineScene(arg_275_1.name, false, arg_277_0)
	end)

	if arg_275_1.scene and arg_275_1.sceneRoot then
		table.insert(var_275_0, function(arg_278_0)
			arg_275_0:ChangeArtScene(arg_275_1.scene .. "|" .. arg_275_1.sceneRoot, arg_278_0)
		end)
	end

	table.insert(var_275_0, function(arg_279_0)
		local var_279_0 = GameObject.Find("[actor]").transform
		local var_279_1 = var_279_0:GetComponentsInChildren(typeof(Animator), true)

		table.IpairsCArray(var_279_1, function(arg_280_0, arg_280_1)
			GetOrAddComponent(arg_280_1.transform, typeof(DftAniEvent))
		end)

		local var_279_2 = var_279_0:GetComponentInChildren(typeof("BLHXCharacterPropertiesController")).transform
		local var_279_3 = GameObject.Find("[camera]").transform:GetComponentInChildren(typeof(Camera)).transform
		local var_279_4 = GameObject.Find("[sequence]").transform

		arg_275_0.nowTimelinePlayer = TimelinePlayer.New(var_279_4)

		arg_275_0.nowTimelinePlayer:Register(arg_275_1.time, function(arg_281_0, arg_281_1, arg_281_2)
			switch(arg_281_1.stringParameter, {
				TimelinePause = function()
					arg_281_0:SetSpeed(0)
				end,
				TimelineResume = function()
					arg_281_0:SetSpeed(1)
				end,
				TimelinePlayOnTime = function()
					if arg_281_1.intParameter == 0 or arg_281_1.intParameter == arg_281_2.selectIndex then
						arg_281_0:SetTime(arg_281_1.floatParameter)
					end
				end,
				TimelineSelectStart = function()
					arg_281_2.selectIndex = nil

					if arg_275_1.options then
						local var_285_0 = arg_275_1.options[arg_281_1.intParameter]

						arg_275_0:DoTimelineOption(var_285_0, function(arg_286_0)
							arg_281_2.selectIndex = arg_286_0
							arg_281_2.optionIndex = var_285_0[arg_286_0].flag

							arg_281_0:Play()
						end)
					end
				end,
				TimelineTouchStart = function()
					arg_281_2.selectIndex = nil

					if arg_275_1.touchs then
						local var_287_0 = arg_275_1.touchs[arg_281_1.intParameter]

						arg_275_0:DoTimelineTouch(arg_275_1.touchs[arg_281_1.intParameter], function(arg_288_0)
							arg_281_2.selectIndex = arg_288_0
							arg_281_2.optionIndex = var_287_0[arg_288_0].flag
						end)
					end
				end,
				TimelineSelectLoop = function()
					if not arg_281_2.selectIndex then
						arg_281_0:RawSetTime(arg_281_1.floatParameter)
					end
				end,
				TimelineSelect = function()
					arg_281_2.selectIndex = arg_281_1.intParameter
				end,
				TimelineAccompanyJump = function()
					if arg_275_0.canTriggerAccompanyPerformance then
						arg_275_0.canTriggerAccompanyPerformance = false

						local var_291_0 = arg_275_1.accompanys[arg_281_1.intParameter]
						local var_291_1 = var_291_0[math.random(#var_291_0)]

						arg_281_0:SetTime(var_291_1)
					end
				end,
				TimelineIKStart = function()
					local var_292_0 = arg_281_1.intParameter
					local var_292_1 = arg_275_0.ladyDict[arg_275_0.apartment:GetConfigID()]

					arg_275_0:SetIKTimelineStatus(var_292_1, var_279_2.gameObject, var_292_0, var_279_3)
				end,
				TimelineEnd = function()
					arg_281_2.finish = true

					arg_281_0:SetSpeed(0)
				end
			}, function()
				warning("other event trigger:" .. arg_281_1.stringParameter)
			end)

			if arg_281_2.finish then
				arg_275_0.timelineMark = arg_281_2
				arg_275_0.timelineFinishCall = nil

				local var_281_0 = arg_275_0.ladyDict[arg_275_0.apartment:GetConfigID()]

				if var_281_0.ikTimelineMode then
					arg_275_0:ExitIKTimelineStatus(var_281_0)
				end

				arg_279_0()
			end
		end)

		function arg_275_0.timelineFinishCall()
			arg_275_0.nowTimelinePlayer:TriggerEvent({
				stringParameter = "TimelineEnd"
			})
		end

		arg_275_0:HideCharacter()
		setActive(arg_275_0.mainCameraTF, false)
		eachChild(arg_275_0.rtTimelineScreen, function(arg_296_0)
			setActive(arg_296_0, false)
		end)
		setActive(arg_275_0.rtTimelineScreen, true)
		setActive(arg_275_0.rtTimelineScreen:Find("btn_skip"), arg_275_0.inReplayTalk)
		arg_275_0.nowTimelinePlayer:Start()
	end)
	table.insert(var_275_0, function(arg_297_0)
		arg_275_0:ShowBlackScreen(true, function()
			arg_275_0.nowTimelinePlayer:Stop()
			arg_275_0.nowTimelinePlayer:Dispose()

			arg_275_0.nowTimelinePlayer = nil

			arg_275_0:UnloadTimelineScene(arg_275_1.name, false, arg_297_0)
		end)
	end)

	local var_275_1 = arg_275_0.artSceneInfo

	table.insert(var_275_0, function(arg_299_0)
		arg_275_0:ChangeArtScene(var_275_1, arg_299_0)
	end)
	seriesAsync(var_275_0, function()
		setActive(arg_275_0.rtTimelineScreen, false)
		arg_275_0:RevertCharacter()
		setActive(arg_275_0.mainCameraTF, true)

		local var_300_0 = arg_275_0.timelineMark

		arg_275_0.timelineMark = nil

		existCall(arg_275_2, var_300_0, function(arg_301_0)
			arg_275_0:ShowBlackScreen(false, arg_301_0)
		end)
	end)
end

function var_0_0.PlayCurrentSingleAction(arg_302_0, ...)
	local var_302_0 = arg_302_0.ladyDict[arg_302_0.apartment:GetConfigID()]

	return arg_302_0:PlaySingleAction(var_302_0, ...)
end

function var_0_0.PlaySingleAction(arg_303_0, arg_303_1, arg_303_2, arg_303_3)
	local var_303_0 = string.find(arg_303_2, "^Face_")

	if tobool(var_303_0) then
		arg_303_0:PlayFaceAnim(arg_303_1, arg_303_2, arg_303_3)

		return
	end

	if arg_303_1.ladyAnimator:GetCurrentAnimatorStateInfo(arg_303_1.ladyAnimBaseLayerIndex):IsName(arg_303_2) then
		return
	end

	existCall(arg_303_1.animExtraItemCallback)

	arg_303_1.animExtraItemCallback = nil
	arg_303_1.animNameMap = arg_303_1.animNameMap or {}
	arg_303_1.animNameMap[arg_303_1.ladyAnimator.StringToHash(arg_303_2)] = arg_303_2

	local var_303_1 = arg_303_0:GetBlackboardValue(arg_303_1, "groupId")
	local var_303_2 = _.detect(pg.dorm3d_anim_extraitem.get_id_list_by_ship_id[var_303_1] or {}, function(arg_304_0)
		return pg.dorm3d_anim_extraitem[arg_304_0].anim == arg_303_2
	end)
	local var_303_3 = var_303_2 and pg.dorm3d_anim_extraitem[var_303_2]
	local var_303_4

	seriesAsync({
		function(arg_305_0)
			if not var_303_3 or var_303_3.item_prefab == "" then
				arg_305_0()

				return
			end

			local var_305_0 = string.lower("dorm3d/furniture/item/" .. var_303_3.item_prefab)

			arg_303_0.loader:GetPrefab(var_305_0, "", function(arg_306_0)
				setParent(arg_306_0, arg_303_1.lady)

				if var_303_3.item_shield ~= "" then
					var_303_4 = {}

					for iter_306_0, iter_306_1 in ipairs(var_303_3.item_shield) do
						local var_306_0 = arg_303_0.modelRoot:Find(iter_306_1)

						if not var_306_0 then
							warning(string.format("dorm3d_anim_extraitem:%d without hide item:%s", var_303_3.id, iter_306_1))
						else
							var_303_4[iter_306_1] = isActive(var_306_0)

							setActive(var_306_0, false)
						end
					end
				end

				function arg_303_1.animExtraItemCallback()
					arg_303_0.loader:ClearRequest("AnimExtraItem")

					if var_303_4 then
						for iter_307_0, iter_307_1 in pairs(var_303_4) do
							setActive(arg_303_0.modelRoot:Find(iter_307_0), iter_307_1)
						end
					end
				end

				arg_305_0()
			end, "AnimExtraItem")
		end,
		function(arg_308_0)
			arg_303_1.nowState = arg_303_2
			arg_303_1.stateCallback = arg_308_0

			arg_303_1.ladyAnimator:CrossFadeInFixedTime(arg_303_2, 0.25, arg_303_1.ladyAnimBaseLayerIndex)
		end,
		function(arg_309_0)
			arg_303_1.nowState = nil
			arg_303_1.stateCallback = nil

			existCall(arg_303_1.animExtraItemCallback)

			arg_303_1.animExtraItemCallback = nil

			arg_309_0()
		end,
		arg_303_3
	})
end

function var_0_0.SwitchCurrentAnim(arg_310_0, ...)
	local var_310_0 = arg_310_0.ladyDict[arg_310_0.apartment:GetConfigID()]

	return arg_310_0:SwitchAnim(var_310_0, ...)
end

function var_0_0.SwitchAnim(arg_311_0, arg_311_1, arg_311_2, arg_311_3)
	local var_311_0 = string.find(arg_311_2, "^Face_")

	if tobool(var_311_0) then
		arg_311_0:PlayFaceAnim(arg_311_1, arg_311_2, arg_311_3)

		return
	end

	existCall(arg_311_1.animExtraItemCallback)

	arg_311_1.animExtraItemCallback = nil
	arg_311_1.animNameMap = arg_311_1.animNameMap or {}
	arg_311_1.animNameMap[arg_311_1.ladyAnimator.StringToHash(arg_311_2)] = arg_311_2

	local var_311_1 = {}

	table.insert(var_311_1, function(arg_312_0)
		arg_311_1.nowState = arg_311_2
		arg_311_1.stateCallback = arg_312_0

		arg_311_1.ladyAnimator:PlayInFixedTime(arg_311_2, arg_311_1.ladyAnimBaseLayerIndex)
	end)
	table.insert(var_311_1, function(arg_313_0)
		arg_311_1.nowState = nil
		arg_311_1.stateCallback = nil

		arg_313_0()
	end)
	seriesAsync(var_311_1, arg_311_3)
end

function var_0_0.PlayFaceAnim(arg_314_0, arg_314_1, arg_314_2, arg_314_3)
	arg_314_1.ladyAnimator:CrossFadeInFixedTime(arg_314_2, 0.2, arg_314_1.ladyAnimFaceLayerIndex)
	existCall(arg_314_3)
end

function var_0_0.GetCurrentAnim(arg_315_0)
	local var_315_0 = arg_315_0.ladyDict[arg_315_0.apartment:GetConfigID()]
	local var_315_1 = var_315_0.ladyAnimator:GetCurrentAnimatorStateInfo(var_315_0.ladyAnimBaseLayerIndex).shortNameHash

	return var_315_0.animNameMap[var_315_1]
end

function var_0_0.RegisterAnimCallback(arg_316_0, arg_316_1, arg_316_2)
	arg_316_0.ladyDict[arg_316_0.apartment:GetConfigID()].animCallbacks[arg_316_1] = arg_316_2
end

function var_0_0.SetCharacterAnimSpeed(arg_317_0, arg_317_1)
	local var_317_0 = arg_317_0.ladyDict[arg_317_0.apartment:GetConfigID()]

	var_317_0.ladyAnimator.speed = arg_317_1
	var_317_0.ladyHeadIKComp.blinkSpeed = var_317_0.ladyHeadIKData.blinkSpeed * arg_317_1

	if arg_317_1 > 0 then
		var_317_0.ladyHeadIKComp.DampTime = var_317_0.ladyHeadIKData.DampTime / arg_317_1
	else
		var_317_0.ladyHeadIKComp.DampTime = var_317_0.ladyHeadIKData.DampTime * math.huge
	end
end

function var_0_0.OnAnimationEvent(arg_318_0, arg_318_1)
	if arg_318_1.animatorClipInfo.weight < 0.5 then
		return
	end

	local var_318_0 = arg_318_1.stringParameter
	local var_318_1 = table.removebykey(arg_318_0.animEventCallbacks, var_318_0)

	existCall(var_318_1)
end

function var_0_0.RegisterAnimEventCallback(arg_319_0, arg_319_1, arg_319_2)
	arg_319_0.animEventCallbacks[arg_319_1] = arg_319_2
end

function var_0_0.PlaySceneItemAnim(arg_320_0, arg_320_1, arg_320_2)
	arg_320_0.sceneAnimatorDict = arg_320_0.sceneAnimatorDict or {}

	if not arg_320_0.sceneAnimatorDict[arg_320_1] then
		local var_320_0 = pg.dorm3d_scene_animator[arg_320_1]
		local var_320_1 = arg_320_0:GetSceneItem(var_320_0.item_name)

		assert(var_320_1, "Missing Scene Animator in pg.dorm3d_scene_animator: " .. arg_320_1 .. " " .. var_320_0.item_name)

		if not var_320_1 then
			return
		end

		local var_320_2 = var_320_1:GetComponent(typeof(Animator))

		if not var_320_2 then
			return
		end

		arg_320_0.sceneAnimatorDict[arg_320_1] = {
			trans = var_320_1,
			animator = var_320_2
		}
	end

	if arg_320_0.sceneAnimatorDict[arg_320_1].animator:GetCurrentAnimatorStateInfo(0):IsName(arg_320_2) then
		return
	end

	arg_320_0.sceneAnimatorDict[arg_320_1].animator:PlayInFixedTime(arg_320_2)
end

function var_0_0.ResetSceneItemAnimators(arg_321_0, arg_321_1)
	if not arg_321_0.sceneAnimatorDict then
		return
	end

	table.Foreach(arg_321_0.sceneAnimatorDict, function(arg_322_0, arg_322_1)
		if arg_321_1 and table.contains(arg_321_1, arg_322_0) then
			return
		end

		setActive(arg_322_1.trans, false)
		setActive(arg_322_1.trans, true)

		arg_321_0.sceneAnimatorDict[arg_322_0] = nil
	end)
end

function var_0_0.LoadCharacterExtraItem(arg_323_0, arg_323_1, arg_323_2, arg_323_3, arg_323_4, arg_323_5)
	arg_323_1.extraItems = arg_323_1.extraItems or {}

	if arg_323_1.extraItems[arg_323_2] then
		return
	end

	local var_323_0

	if arg_323_3 == "" then
		var_323_0 = arg_323_1.lady
	else
		table.IpairsCArray(arg_323_1.lady:GetComponentsInChildren(typeof(Transform), true), function(arg_324_0, arg_324_1)
			if arg_324_1.name == arg_323_3 then
				var_323_0 = arg_324_1
			end
		end)
	end

	if not var_323_0 then
		return
	end

	arg_323_0.loader:GetPrefab(string.lower("dorm3d/" .. arg_323_2), "", function(arg_325_0)
		setParent(arg_325_0, var_323_0)

		if arg_323_4 then
			setLocalPosition(arg_325_0, arg_323_4)
		end

		if arg_323_5 then
			setLocalRotation(arg_325_0, arg_323_5)
		end

		arg_323_1.extraItems[arg_323_2] = {
			trans = arg_325_0.transform,
			handler = var_323_0
		}
	end)
end

function var_0_0.ResetCharacterExtraItem(arg_326_0, arg_326_1, arg_326_2)
	if not arg_326_1.extraItems then
		return
	end

	table.Foreach(arg_326_1.extraItems, function(arg_327_0, arg_327_1)
		if arg_326_2 and table.contains(arg_326_2, arg_327_0) then
			return
		end

		arg_326_0.loader:ReturnPrefab(arg_327_1.trans.gameObject)

		arg_326_1.extraItems[arg_327_0] = nil
	end)
end

function var_0_0.RegisterCameraBlendFinished(arg_328_0, arg_328_1, arg_328_2)
	arg_328_0.cameraBlendCallbacks[arg_328_1] = arg_328_2
end

function var_0_0.UnRegisterCameraBlendFinished(arg_329_0, arg_329_1)
	arg_329_0.cameraBlendCallbacks[arg_329_1] = nil
end

function var_0_0.OnCameraBlendFinished(arg_330_0, arg_330_1)
	if not arg_330_1 then
		return
	end

	local var_330_0 = table.removebykey(arg_330_0.cameraBlendCallbacks, arg_330_1)

	existCall(var_330_0)
end

function var_0_0.PlayHeartFX(arg_331_0, arg_331_1)
	local var_331_0 = arg_331_0.ladyDict[arg_331_1]

	setActive(var_331_0.effectHeart, false)
	setActive(var_331_0.effectHeart, true)
	pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_joyful")
end

function var_0_0.PlayExpression(arg_332_0, arg_332_1)
	local var_332_0 = arg_332_1.name
	local var_332_1 = arg_332_0.expressionDict[var_332_0]
	local var_332_2 = 5

	if var_332_1 then
		local var_332_3 = var_332_1.timer

		var_332_3:Reset(nil, var_332_2)
		var_332_3:Start()

		if var_332_1.instance then
			setActive(var_332_1.instance, false)
			setActive(var_332_1.instance, true)
		end

		return
	end

	local var_332_4 = {
		name = var_332_0,
		timer = Timer.New(function()
			arg_332_0:RemoveExpression(var_332_0)
		end, var_332_2, 1, true)
	}

	arg_332_0.expressionDict[var_332_0] = var_332_4

	arg_332_0.loader:GetPrefab("dorm3D/effect/prefab/expression/" .. var_332_0, var_332_0, function(arg_334_0)
		var_332_4.instance = arg_334_0

		onNextTick(function()
			local var_335_0 = arg_332_0.ladyDict[arg_332_0.apartment:GetConfigID()]

			setParent(arg_334_0, var_335_0.ladyHeadCenter)
		end)
		setLocalPosition(arg_334_0, Vector3(0, 0, -0.2))
		setActive(arg_334_0, false)
		setActive(arg_334_0, true)
	end, var_332_4)
end

function var_0_0.RemoveExpression(arg_336_0, arg_336_1)
	local var_336_0 = arg_336_0.expressionDict[arg_336_1]

	if not var_336_0 then
		return
	end

	arg_336_0.loader:ClearRequest(var_336_0)

	if var_336_0.instance then
		arg_336_0.loader:ReturnPrefab(var_336_0.instance)
	end

	arg_336_0.expressionDict[arg_336_1] = nil
end

function var_0_0.ShowOrHideCanWatchMark(arg_337_0, arg_337_1, arg_337_2)
	arg_337_1.ladyWatchFloat = arg_337_1.ladyWatchFloat or cloneTplTo(arg_337_0.resTF:Find("vfx_talk_mark"), arg_337_1.ladyHeadCenter)

	setActive(arg_337_1.ladyWatchFloat, arg_337_2)
end

function var_0_0.RegisterGlobalVolume(arg_338_0)
	local var_338_0 = arg_338_0.globalVolume
	local var_338_1 = LuaHelper.GetOrAddVolumeComponent(var_338_0, typeof(BLHX.PostEffect.Overrides.DepthOfField))
	local var_338_2 = LuaHelper.GetOrAddVolumeComponent(var_338_0, typeof(BLHX.PostEffect.Overrides.ColorGrading))

	arg_338_0.originalCameraSettings = {
		depthOfField = {
			enabled = var_338_1.enabled.value,
			focusDistance = {
				length = 2,
				min = var_338_1.gaussianStart.min,
				value = var_338_1.gaussianStart.value
			},
			blurRadius = {
				min = var_338_1.blurRadius.min,
				max = var_338_1.blurRadius.max,
				value = var_338_1.blurRadius.value
			}
		},
		postExposure = {
			value = var_338_2.postExposure.value
		},
		contrast = {
			min = var_338_2.contrast.min,
			max = var_338_2.contrast.max,
			value = var_338_2.contrast.value
		},
		saturate = {
			min = var_338_2.saturation.min,
			max = var_338_2.saturation.max,
			value = var_338_2.saturation.value
		}
	}
	arg_338_0.originalCameraSettings.depthOfField.enabled = true

	local var_338_3 = var_338_0:GetComponent(typeof(BLHX.Volume.Volume))

	arg_338_0.originalVolume = {
		profile = var_338_3.sharedProfile,
		weight = var_338_3.weight
	}
end

function var_0_0.SettingCamera(arg_339_0, arg_339_1)
	arg_339_0.activeCameraSettings = arg_339_1

	local var_339_0 = arg_339_0.globalVolume
	local var_339_1 = LuaHelper.GetOrAddVolumeComponent(var_339_0, typeof(BLHX.PostEffect.Overrides.DepthOfField))
	local var_339_2 = LuaHelper.GetOrAddVolumeComponent(var_339_0, typeof(BLHX.PostEffect.Overrides.ColorGrading))

	var_339_1.enabled:Override(arg_339_1.depthOfField.enabled)
	var_339_1.gaussianStart:Override(arg_339_1.depthOfField.focusDistance.value)
	var_339_1.gaussianEnd:Override(arg_339_1.depthOfField.focusDistance.value + arg_339_1.depthOfField.focusDistance.length)
	var_339_1.blurRadius:Override(arg_339_1.depthOfField.blurRadius.value)
	var_339_2.postExposure:Override(arg_339_1.postExposure.value)
	var_339_2.contrast:Override(arg_339_1.contrast.value)
	var_339_2.saturation:Override(arg_339_1.saturate.value)
end

function var_0_0.GetCameraSettings(arg_340_0)
	return arg_340_0.originalCameraSettings
end

function var_0_0.RevertCameraSettings(arg_341_0)
	arg_341_0:SettingCamera(arg_341_0.originalCameraSettings)

	arg_341_0.activeCameraSettings = nil
end

function var_0_0.SetVolumeProfile(arg_342_0, arg_342_1, arg_342_2)
	local var_342_0 = arg_342_0.globalVolume:GetComponent(typeof(BLHX.Volume.Volume))

	arg_342_0.activeProfileWeight = arg_342_2

	if arg_342_0.activeProfileName ~= arg_342_1 then
		arg_342_0.activeProfileName = arg_342_1

		arg_342_0.loader:LoadReference("dorm3d/scenesres/res/common", arg_342_1, nil, function(arg_343_0)
			var_342_0.profile = arg_343_0
			var_342_0.weight = arg_342_0.activeProfileWeight

			if arg_342_0.activeCameraSettings then
				arg_342_0:SettingCamera(arg_342_0.activeCameraSettings)
			end
		end, "VolumeProfile")
	else
		var_342_0.weight = arg_342_0.activeProfileWeight
	end
end

function var_0_0.RevertVolumeProfile(arg_344_0)
	local var_344_0 = arg_344_0.globalVolume:GetComponent(typeof(BLHX.Volume.Volume))

	var_344_0.profile = arg_344_0.originalVolume.profile
	var_344_0.weight = arg_344_0.originalVolume.weight

	if arg_344_0.activeCameraSettings then
		arg_344_0:SettingCamera(arg_344_0.activeCameraSettings)
	end

	arg_344_0.activeProfileName = nil
end

function var_0_0.RecordCharacterLight(arg_345_0)
	local var_345_0 = BLHX.Rendering.PipelineInterface.GetCharacterLightColor()

	arg_345_0.originalCharacterColor = {
		color = var_345_0.color,
		intensity = var_345_0.intensity
	}
end

function var_0_0.SetCharacterLight(arg_346_0, arg_346_1, arg_346_2, arg_346_3)
	local var_346_0 = arg_346_0.characterLight:GetComponent(typeof(Light))
	local var_346_1 = Color.Lerp(arg_346_0.originalCharacterColor.color, arg_346_1, arg_346_3)
	local var_346_2 = math.lerp(arg_346_0.originalCharacterColor.intensity, arg_346_2, arg_346_3)

	BLHX.Rendering.PipelineInterface.SetCharacterLight(var_346_1, var_346_2)
end

function var_0_0.RevertCharacterLight(arg_347_0)
	arg_347_0:SetCharacterLight(arg_347_0.originalCharacterColor.color, arg_347_0.originalCharacterColor.intensity, 1)
end

function var_0_0.EnableCloth(arg_348_0, arg_348_1, arg_348_2, arg_348_3)
	arg_348_2 = arg_348_2 or {}

	table.Foreach(arg_348_1.clothComps, function(arg_349_0, arg_349_1)
		if arg_349_1 == nil then
			return
		end

		setActive(arg_349_1, arg_348_2[arg_349_0] == 1)
	end)
	table.Foreach(arg_348_1.clothColliderDict, function(arg_350_0, arg_350_1)
		if arg_350_1 == nil then
			return
		end

		setActive(arg_350_1, false)
	end)

	if arg_348_3 then
		table.Foreach(arg_348_3, function(arg_351_0, arg_351_1)
			local var_351_0 = arg_348_1.clothColliderDict[arg_351_1[1]]

			if var_351_0 == nil then
				return
			end

			setActive(var_351_0, arg_351_1[2] == 1)

			if arg_351_1[2] ~= 1 then
				return
			end

			var_0_0.SetMagicaCollider(var_351_0, arg_351_1[3], arg_351_1[4])
		end)
	end
end

function var_0_0.RevertClothComps(arg_352_0, arg_352_1)
	table.Foreach(arg_352_1.ladyClothCompSettings, function(arg_353_0, arg_353_1)
		arg_353_0.enabled = arg_353_1.enabled
	end)
	table.Foreach(arg_352_1.ladyClothColliderSettings, function(arg_354_0, arg_354_1)
		arg_354_0.enabled = arg_354_1.enabled

		var_0_0.SetMagicaCollider(arg_354_0, arg_354_1.StartRadius, arg_354_1.EndRadius)
	end)
end

function var_0_0.onBackPressed(arg_355_0)
	if arg_355_0.exited or arg_355_0.retainCount > 0 then
		-- block empty
	else
		arg_355_0:closeView()
	end
end

function var_0_0.EnableSceneDisplay(arg_356_0, arg_356_1, arg_356_2)
	assert(tobool(arg_356_0.lastSceneRootDict[arg_356_1]) == arg_356_2)

	if arg_356_2 then
		table.Foreach(arg_356_0.lastSceneRootDict[arg_356_1], function(arg_357_0, arg_357_1)
			if IsNil(arg_357_0) then
				return
			end

			setActive(arg_357_0, arg_357_1)
		end)

		arg_356_0.lastSceneRootDict[arg_356_1] = nil
	else
		arg_356_0.lastSceneRootDict[arg_356_1] = {}

		local var_356_0 = SceneManager.GetSceneByName(arg_356_1)

		table.IpairsCArray(var_356_0:GetRootGameObjects(), function(arg_358_0, arg_358_1)
			if tostring(arg_358_1.hideFlags) ~= "None" then
				return
			end

			arg_356_0.lastSceneRootDict[arg_356_1][arg_358_1] = isActive(arg_358_1)

			setActive(arg_358_1, false)
		end)
	end
end

function var_0_0.ChangeArtScene(arg_359_0, arg_359_1, arg_359_2)
	arg_359_1 = string.lower(arg_359_1)

	if arg_359_1 == arg_359_0.artSceneInfo then
		if arg_359_1 == arg_359_0.sceneInfo then
			arg_359_0:SwitchDayNight(arg_359_0.contextData.timeIndex)
			onNextTick(function()
				arg_359_0:RefreshSlots()
				existCall(arg_359_2)
			end)
		else
			existCall(arg_359_2)
		end

		return
	end

	local var_359_0 = {}
	local var_359_1 = false
	local var_359_2

	table.insert(var_359_0, function(arg_361_0)
		arg_359_0.artSceneInfo = arg_359_1

		if var_359_1 then
			pg.SceneAnimMgr.GetInstance():Dorm3DSceneChange(function(arg_362_0)
				var_359_2 = arg_362_0

				arg_361_0()
			end)
		else
			arg_361_0()
		end
	end)

	if arg_359_1 == arg_359_0.sceneInfo then
		table.insert(var_359_0, function(arg_363_0)
			setActive(arg_359_0.slotRoot, true)

			local var_363_0, var_363_1 = unpack(string.split(arg_359_0.sceneInfo, "|"))

			SceneManager.SetActiveScene(SceneManager.GetSceneByName(var_363_0))
			arg_359_0:EnableSceneDisplay(var_363_0, true)
			arg_359_0:SwitchDayNight(arg_359_0.contextData.timeIndex)
			onNextTick(function()
				arg_359_0:RefreshSlots()
			end)
			arg_363_0()
		end)
	else
		var_359_1 = true

		local var_359_3, var_359_4 = unpack(string.split(arg_359_1, "|"))

		table.insert(var_359_0, function(arg_365_0)
			setActive(arg_359_0.slotRoot, false)
			SceneOpMgr.Inst:LoadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_359_4 .. "/" .. var_359_3 .. "_scene"), var_359_3, LoadSceneMode.Additive, function(arg_366_0, arg_366_1)
				SceneManager.SetActiveScene(arg_366_0)

				local var_366_0 = getSceneRootTFDic(arg_366_0).MainCamera

				if var_366_0 then
					setActive(var_366_0, false)
				end

				arg_365_0()
			end)
		end)
	end

	if arg_359_0.artSceneInfo == arg_359_0.sceneInfo then
		table.insert(var_359_0, function(arg_367_0)
			local var_367_0, var_367_1 = unpack(string.split(arg_359_0.sceneInfo, "|"))

			arg_359_0:EnableSceneDisplay(var_367_0, false)
			arg_367_0()
		end)
	else
		local var_359_5, var_359_6 = unpack(string.split(arg_359_0.artSceneInfo, "|"))

		table.insert(var_359_0, function(arg_368_0)
			SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_359_6 .. "/" .. var_359_5 .. "_scene"), var_359_5, arg_368_0)
		end)
	end

	table.insert(var_359_0, function(arg_369_0)
		arg_369_0()

		if var_359_1 then
			var_359_2()
		end
	end)
	seriesAsync(var_359_0, arg_359_2)
end

function var_0_0.LoadTimelineScene(arg_370_0, arg_370_1, arg_370_2, arg_370_3)
	arg_370_1 = string.lower(arg_370_1)

	if arg_370_0.cacheSceneDic[arg_370_1] then
		if not arg_370_2 then
			arg_370_0.timelineScene = arg_370_1

			arg_370_0:EnableSceneDisplay(arg_370_1, true)
		end

		return existCall(arg_370_3)
	end

	local var_370_0 = {}
	local var_370_1

	table.insert(var_370_0, function(arg_371_0)
		pg.SceneAnimMgr.GetInstance():Dorm3DSceneChange(function(arg_372_0)
			if arg_370_0.waitForTimeline then
				arg_370_0.waitForTimeline = arg_372_0
				var_370_1 = nil
			else
				var_370_1 = arg_372_0
			end

			arg_371_0()
		end)
	end)
	table.insert(var_370_0, function(arg_373_0)
		local var_373_0 = arg_370_0.apartment:getConfig("asset_name")

		SceneOpMgr.Inst:LoadSceneAsync(string.lower("dorm3d/character/" .. var_373_0 .. "/timeline/" .. arg_370_1 .. "/" .. arg_370_1 .. "_scene"), arg_370_1, LoadSceneMode.Additive, function(arg_374_0, arg_374_1)
			local var_374_0 = GameObject.Find("[actor]").transform

			arg_370_0:HXCharacter(tf(var_374_0))

			local var_374_1 = GameObject.Find("[sequence]").transform:GetComponent(typeof(UnityEngine.Playables.PlayableDirector))

			var_374_1:Stop()
			TimelineSupport.InitTimeline(var_374_1)
			TimelineSupport.InitSubtitle(var_374_1, arg_370_0.apartment:GetCallName())

			arg_370_0.unloadDirector = var_374_1

			arg_373_0()
		end)
	end)
	table.insert(var_370_0, function(arg_375_0)
		arg_370_0.sceneGroupDic[arg_370_1] = arg_370_0.apartment:GetConfigID()

		if arg_370_2 then
			arg_370_0.cacheSceneDic[arg_370_1] = true

			arg_370_0:EnableSceneDisplay(arg_370_1, false)
		else
			arg_370_0.timelineScene = arg_370_1
		end

		arg_375_0()
		existCall(var_370_1)
	end)
	seriesAsync(var_370_0, arg_370_3)
end

function var_0_0.UnloadTimelineScene(arg_376_0, arg_376_1, arg_376_2, arg_376_3)
	arg_376_1 = string.lower(arg_376_1)

	if arg_376_0.timelineScene == arg_376_1 then
		arg_376_0.timelineScene = nil
	end

	if tobool(arg_376_2) == tobool(arg_376_0.cacheSceneDic[arg_376_1]) then
		local var_376_0 = getProxy(ApartmentProxy):getApartment(arg_376_0.sceneGroupDic[arg_376_1]):getConfig("asset_name")

		if arg_376_0.unloadDirector then
			TimelineSupport.UnloadPlayable(arg_376_0.unloadDirector)

			arg_376_0.unloadDirector = nil
		end

		SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/character/scenes/" .. var_376_0 .. "/timeline/" .. arg_376_1 .. "/" .. arg_376_1 .. "_scene"), arg_376_1, function()
			arg_376_0.cacheSceneDic[arg_376_1] = nil
			arg_376_0.sceneGroupDic[arg_376_1] = nil
			arg_376_0.lastSceneRootDict[arg_376_1] = nil

			existCall(arg_376_3)
		end)
	else
		arg_376_0:EnableSceneDisplay(arg_376_1, false)
		existCall(arg_376_3)
	end
end

function var_0_0.ChangeSubScene(arg_378_0, arg_378_1, arg_378_2)
	arg_378_1 = string.lower(arg_378_1)

	warning(arg_378_0.subSceneInfo, "->", arg_378_1, arg_378_1 == arg_378_0.subSceneInfo)

	local var_378_0 = arg_378_0.ladyDict[arg_378_0.apartment:GetConfigID()]

	if arg_378_1 == arg_378_0.subSceneInfo then
		var_378_0.ladyActiveZone = var_378_0.walkBornPoint or var_378_0.ladyBaseZone

		arg_378_0:ChangeCharacterPosition(var_378_0)
		arg_378_0:ChangePlayerPosition(var_378_0.ladyActiveZone)
		arg_378_0:TriggerLadyDistance()
		arg_378_0:CheckInSector()
		existCall(arg_378_2)

		return
	end

	local var_378_1 = {}
	local var_378_2 = false
	local var_378_3

	table.insert(var_378_1, function(arg_379_0)
		arg_378_0.subSceneInfo = arg_378_1

		if var_378_2 then
			pg.SceneAnimMgr.GetInstance():Dorm3DSceneChange(function(arg_380_0)
				var_378_3 = arg_380_0

				arg_379_0()
			end)
		else
			arg_379_0()
		end
	end)

	if arg_378_1 == arg_378_0.sceneInfo then
		table.insert(var_378_1, function(arg_381_0)
			local var_381_0, var_381_1 = unpack(string.split(arg_378_0.sceneInfo, "|"))

			arg_378_0:ResetSceneStructure(SceneManager.GetSceneByName(var_381_0 .. "_base"))
			arg_378_0:RefreshSlots()

			var_378_0.ladyActiveZone = var_378_0.walkBornPoint or var_378_0.ladyBaseZone

			arg_378_0:ChangeCharacterPosition(var_378_0)
			arg_378_0:ChangePlayerPosition(var_378_0.ladyActiveZone)
			arg_378_0:TriggerLadyDistance()
			arg_378_0:CheckInSector()
			arg_381_0()
		end)
	else
		var_378_2 = true

		local var_378_4, var_378_5 = unpack(string.split(arg_378_1, "|"))
		local var_378_6 = var_378_4 .. "_base"

		table.insert(var_378_1, function(arg_382_0)
			SceneOpMgr.Inst:LoadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_378_5 .. "/" .. var_378_6 .. "_scene"), var_378_6, LoadSceneMode.Additive, arg_382_0)
		end)
		table.insert(var_378_1, function(arg_383_0)
			arg_378_0:ResetSceneStructure(SceneManager.GetSceneByName(var_378_6))

			var_378_0.ladyActiveZone = var_378_0.walkBornPoint or "Default"

			arg_378_0:SwitchAnim(var_378_0, var_0_0.ANIM.IDLE)
			onNextTick(function()
				arg_378_0:ChangeCharacterPosition(var_378_0)
				arg_378_0:ChangePlayerPosition(var_378_0.ladyActiveZone)
				arg_378_0:TriggerLadyDistance()
				arg_378_0:CheckInSector()
				arg_383_0()
			end)
		end)
	end

	if arg_378_0.subSceneInfo == arg_378_0.sceneInfo then
		table.insert(var_378_1, function(arg_385_0)
			local var_385_0 = Clone(arg_378_0.room)

			var_385_0.furnitures = {}

			arg_378_0:RefreshSlots(var_385_0)
			arg_385_0()
		end)
	else
		local var_378_7, var_378_8 = unpack(string.split(arg_378_0.subSceneInfo, "|"))
		local var_378_9 = var_378_7 .. "_base"

		table.insert(var_378_1, function(arg_386_0)
			SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_378_8 .. "/" .. var_378_9 .. "_scene"), var_378_9, arg_386_0)
		end)
	end

	table.insert(var_378_1, function(arg_387_0)
		arg_387_0()

		if var_378_2 then
			var_378_3()
		end
	end)
	seriesAsync(var_378_1, arg_378_2)
end

function var_0_0.IsPointInSector(arg_388_0, arg_388_1)
	local var_388_0 = arg_388_1 - Vector3.New(unpack(arg_388_0.Position))

	if var_388_0.magnitude > arg_388_0.Radius then
		return false
	end

	local var_388_1 = Quaternion.Euler(unpack(arg_388_0.Rotation))

	return Vector3.Angle(var_388_1 * Vector3.forward, var_388_0) <= arg_388_0.Angle / 2
end

function var_0_0.willExit(arg_389_0)
	arg_389_0.joystickTimer:Stop()
	arg_389_0.moveStickTimer:Stop()
	UpdateBeat:RemoveListener(arg_389_0.updateHandler)
	arg_389_0:StopIKHandTimer()

	if arg_389_0.moveTimer then
		arg_389_0.moveTimer:Stop()

		arg_389_0.moveTimer = nil
	end

	if arg_389_0.moveWaitTimer then
		arg_389_0.moveWaitTimer:Stop()

		arg_389_0.moveWaitTimer = nil
	end

	GlobalClickEventMgr.Inst:RemoveBeginPinchFunc()
	GlobalClickEventMgr.Inst:RemovePinchFunc()
	GlobalClickEventMgr.Inst:RemoveEndPinchFunc()

	if not IsNil(arg_389_0.furnitures) then
		eachChild(arg_389_0.furnitures, function(arg_390_0)
			local var_390_0 = GetComponent(arg_390_0, typeof(EventTriggerListener))

			if not var_390_0 then
				return
			end

			var_390_0:ClearEvents()
		end)
	end

	pg.IKMgr.GetInstance():ResetActiveIKs()

	for iter_389_0, iter_389_1 in pairs(arg_389_0.ladyDict) do
		GetComponent(iter_389_1.lady, typeof(EventTriggerListener)):ClearEvents()
	end

	arg_389_0.camBrainEvenetHandler.OnBlendStarted = nil
	arg_389_0.camBrainEvenetHandler.OnBlendFinished = nil

	pg.UIMgr.GetInstance():UnOverlayPanel(arg_389_0.blockLayer, arg_389_0._tf)
	table.Foreach(arg_389_0.expressionDict, function(arg_391_0)
		arg_389_0:RemoveExpression(arg_391_0)
	end)
	arg_389_0.loader:Clear()
	pg.ClickEffectMgr:GetInstance():SetClickEffect("NORMAL")
	pg.NodeCanvasMgr.GetInstance():Clear()

	local var_389_0 = {}

	if arg_389_0.timelineScene and not arg_389_0.cacheSceneDic[arg_389_0.timelineScene] then
		local var_389_1 = arg_389_0.timelineScene

		arg_389_0.timelineScene = nil

		local var_389_2 = getProxy(ApartmentProxy):getApartment(arg_389_0.sceneGroupDic[var_389_1]):getConfig("asset_name")

		table.insert(var_389_0, function(arg_392_0)
			SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/character/scenes/" .. var_389_2 .. "/timeline/" .. var_389_1 .. "/" .. var_389_1 .. "_scene"), var_389_1, arg_392_0)
		end)
	end

	for iter_389_2, iter_389_3 in pairs(arg_389_0.cacheSceneDic) do
		if iter_389_3 then
			local var_389_3 = getProxy(ApartmentProxy):getApartment(arg_389_0.sceneGroupDic[iter_389_2]):getConfig("asset_name")

			table.insert(var_389_0, function(arg_393_0)
				SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/character/scenes/" .. var_389_3 .. "/timeline/" .. iter_389_2 .. "/" .. iter_389_2 .. "_scene"), iter_389_2, arg_393_0)
			end)
		end
	end

	for iter_389_4, iter_389_5 in ipairs({
		arg_389_0.sceneInfo,
		arg_389_0.subSceneInfo ~= arg_389_0.sceneInfo and arg_389_0.subSceneInfo or nil
	}) do
		local var_389_4, var_389_5 = unpack(string.split(iter_389_5, "|"))
		local var_389_6 = var_389_4 .. "_base"

		table.insert(var_389_0, function(arg_394_0)
			SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_389_5 .. "/" .. var_389_6 .. "_scene"), var_389_6, arg_394_0)
		end)
	end

	for iter_389_6, iter_389_7 in ipairs({
		arg_389_0.sceneInfo,
		arg_389_0.artSceneInfo ~= arg_389_0.sceneInfo and arg_389_0.artSceneInfo or nil
	}) do
		local var_389_7, var_389_8 = unpack(string.split(iter_389_7, "|"))

		table.insert(var_389_0, function(arg_395_0)
			SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_389_8 .. "/" .. var_389_7 .. "_scene"), var_389_7, arg_395_0)
		end)
	end

	seriesAsync(var_389_0, function()
		ReflectionHelp.RefSetProperty(typeof("UnityEngine.LightmapSettings"), "lightmaps", nil, nil)
	end)
end

function var_0_0.InitDefautQuality()
	if PlayerPrefs.GetInt("dorm3d_graphics_settings", 0) == 0 then
		local var_397_0 = DevicePerformanceUtil.GetDevicePerformanceLevel()

		if PLATFORM == PLATFORM_IPHONEPLAYER then
			local var_397_1 = SystemInfo.deviceModel or ""

			local function var_397_2(arg_398_0)
				local var_398_0 = string.match(arg_398_0, "iPad(%d+)")
				local var_398_1 = tonumber(var_398_0)

				if var_398_1 and var_398_1 >= 8 then
					return true
				end

				return false
			end

			local function var_397_3(arg_399_0)
				local var_399_0 = string.match(arg_399_0, "iPhone(%d+)")
				local var_399_1 = tonumber(var_399_0)

				if var_399_1 and var_399_1 >= 13 then
					return true
				end

				return false
			end

			if var_397_2(var_397_1) or var_397_3(var_397_1) then
				var_397_0 = DevicePerformanceLevel.High
			end
		end

		local var_397_4 = var_397_0 == DevicePerformanceLevel.High and 3 or var_397_0 == DevicePerformanceLevel.Mid and 2 or 1

		PlayerPrefs.SetInt("dorm3d_graphics_settings", var_397_4)

		Dorm3dRoomTemplateScene.FirstDefaultSetting = var_397_4
	end
end

function var_0_0.SettingQuality()
	local var_400_0 = GraphicSettingConst.HandleCustomSetting()

	BLHX.Rendering.EngineCore.SetOverrideQualitySettings(var_400_0)
end

function var_0_0.SetMagicaCollider(arg_401_0, arg_401_1, arg_401_2)
	local var_401_0 = typeof("MagicaCloth.MagicaCapsuleCollider")

	ReflectionHelp.RefSetProperty(var_401_0, "StartRadius", arg_401_0, arg_401_1)
	ReflectionHelp.RefSetProperty(var_401_0, "EndRadius", arg_401_0, arg_401_2)
end

return var_0_0
