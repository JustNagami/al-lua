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

	local var_10_1 = {}

	table.insert(var_10_1, function(arg_11_0)
		arg_10_0.dormSceneMgr = Dorm3dSceneMgr.New(string.lower(arg_10_0.room:getConfig("scene_info")), arg_11_0)
	end)
	table.insert(var_10_1, function(arg_12_0)
		arg_10_0:LoadCharacter(arg_10_0.contextData.groupIds, arg_12_0)
	end)
	seriesAsync(var_10_1, arg_10_1)
end

function var_0_0.init(arg_13_0)
	arg_13_0:BindEvent()
	arg_13_0:InitData()
	arg_13_0:initScene()
	arg_13_0:initNodeCanvas()

	for iter_13_0, iter_13_1 in pairs(arg_13_0.ladyDict) do
		arg_13_0:InitCharacter(iter_13_1, iter_13_0)

		iter_13_1.ladyBaseZone = arg_13_0.contextData.ladyZone[iter_13_0]
		iter_13_1.ladyActiveZone = iter_13_1.ladyBaseZone

		arg_13_0:ChangeCharacterPosition(iter_13_1)
	end

	if not arg_13_0.apartment then
		local var_13_0 = underscore.detect(arg_13_0.contextData.groupIds, function(arg_14_0)
			return arg_13_0.contextData.ladyZone[arg_14_0] == arg_13_0.contextData.inFurnitureName
		end) or arg_13_0.contextData.groupIds[1]

		if var_13_0 then
			arg_13_0:SyncInterestTransform(arg_13_0.ladyDict[var_13_0])
		end
	end

	arg_13_0.retainCount = 0
	arg_13_0.sceneBlockLayer = arg_13_0._tf:Find("SceneBlock")

	setActive(arg_13_0.sceneBlockLayer, false)

	arg_13_0.blockLayer = arg_13_0._tf:Find("Block")

	setActive(arg_13_0.blockLayer, false)

	arg_13_0.blackLayer = arg_13_0._tf:Find("BlackScreen")

	setActive(arg_13_0.blackLayer, false)
	arg_13_0:ChangePlayerPosition()

	arg_13_0.cacheSceneDic = {}
	arg_13_0.sceneGroupDic = {}
	arg_13_0.lastSceneRootDict = {}

	pg.ClickEffectMgr:GetInstance():SetClickEffect("DORM3D")
end

function var_0_0.BindEvent(arg_15_0)
	arg_15_0:bind(var_0_0.PLAY_EXPRESSION, function(arg_16_0, arg_16_1)
		arg_15_0:PlayExpression(arg_16_1)
	end)
	arg_15_0:bind(var_0_0.SHOW_BLOCK, function()
		arg_15_0.retainCount = arg_15_0.retainCount + 1

		setActive(arg_15_0.blockLayer, true)
	end)
	arg_15_0:bind(var_0_0.HIDE_BLOCK, function()
		arg_15_0.retainCount = math.max(arg_15_0.retainCount - 1, 0)

		if arg_15_0.retainCount > 0 then
			return
		end

		setActive(arg_15_0.blockLayer, false)
	end)
	arg_15_0:bind(var_0_0.ENABLE_SCENEBLOCK, function(arg_19_0, arg_19_1)
		setActive(arg_15_0.sceneBlockLayer, arg_19_1)
	end)
	arg_15_0:bind(var_0_0.ON_STICK_MOVE, function(arg_20_0, arg_20_1)
		arg_15_0:OnStickMove(arg_20_1)
	end)
	arg_15_0:bind(var_0_0.ON_BEGIN_DRAG_CHARACTER_BODY, function(arg_21_0, arg_21_1, arg_21_2, arg_21_3)
		if arg_15_0.blockIK then
			return
		end

		if arg_21_1.ikHandler then
			return
		end

		pg.IKMgr.GetInstance():OnDragBegin(arg_21_2, arg_21_3)
	end)
	arg_15_0:bind(var_0_0.ON_DRAG_CHARACTER_BODY, function(arg_22_0, arg_22_1, arg_22_2)
		if not arg_22_1.ikHandler then
			return
		end

		pg.IKMgr.GetInstance():HandleBodyDrag(arg_22_2)
	end)
	arg_15_0:bind(var_0_0.ON_RELEASE_CHARACTER_BODY, function(arg_23_0, arg_23_1)
		pg.IKMgr.GetInstance():ReleaseDrag()
	end)
	arg_15_0:bind(var_0_0.ON_POV_STICK_MOVE_BEGIN, function(arg_24_0, arg_24_1)
		if arg_15_0.pinchMode then
			return
		end

		arg_15_0.moveStickOrigin = arg_24_1.position
		arg_15_0.moveStickPosition = arg_15_0.moveStickOrigin
		arg_15_0.moveStickDraging = true
	end)

	local function var_15_0()
		arg_15_0.moveStickOrigin = nil
		arg_15_0.moveStickPosition = nil
		arg_15_0.moveStickDraging = nil

		if isActive(arg_15_0.cameras[var_0_0.CAMERA.PHOTO_FREE]) then
			arg_15_0:emit(Dorm3dPhotoMediator.CAMERA_STICK_MOVE, Vector2.zero)
		end
	end

	arg_15_0:bind(var_0_0.ON_POV_STICK_MOVE_END, function(arg_26_0, arg_26_1)
		var_15_0()
	end)
	arg_15_0:bind(var_0_0.ON_POV_STICK_MOVE, function(arg_27_0, arg_27_1)
		if arg_15_0.pinchMode then
			var_15_0()

			return
		end

		if not arg_15_0.moveStickDraging then
			return
		end

		arg_15_0.moveStickPosition = arg_15_0.moveStickPosition + arg_27_1

		if isActive(arg_15_0.povLayer:Find("Guide")) then
			setActive(arg_15_0.povLayer:Find("Guide"), false)
		end
	end)

	local var_15_1 = 32.4 / Screen.height

	arg_15_0:bind(var_0_0.ON_POV_STICK_VIEW, function(arg_28_0, arg_28_1)
		if arg_15_0.pinchMode then
			return
		end

		arg_28_1 = arg_28_1 * var_15_1

		local var_28_0 = arg_28_1.x
		local var_28_1 = arg_28_1.y

		local function var_28_2(arg_29_0, arg_29_1, arg_29_2)
			local var_29_0 = arg_29_0[arg_29_1]

			var_29_0.m_InputAxisValue = arg_29_2
			arg_29_0[arg_29_1] = var_29_0
		end

		if isActive(arg_15_0.cameras[var_0_0.CAMERA.POV]) then
			var_28_2(arg_15_0.compPovAim, "m_HorizontalAxis", var_28_0)
			var_28_2(arg_15_0.compPovAim, "m_VerticalAxis", var_28_1)
		elseif isActive(arg_15_0.cameras[var_0_0.CAMERA.PHOTO_FREE]) then
			local var_28_3 = arg_15_0.cameras[var_0_0.CAMERA.PHOTO_FREE]:Find("PhotoFree Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera)):GetCinemachineComponent(Cinemachine.CinemachineCore.Stage.Aim)

			var_28_2(var_28_3, "m_HorizontalAxis", var_28_0)
			var_28_2(var_28_3, "m_VerticalAxis", var_28_1)
		end
	end)

	local var_15_2 = {
		HideCharacterBylayer = true,
		EnableHeadIK = true,
		RevertCharacterBylayer = true
	}

	arg_15_0:bind(var_0_0.PHOTO_CALL, function(arg_30_0, arg_30_1, ...)
		if var_15_2[arg_30_1] then
			local var_30_0 = arg_15_0.ladyDict[arg_15_0.apartment:GetConfigID()]

			arg_15_0[arg_30_1](arg_15_0, var_30_0, ...)
		else
			local var_30_1 = arg_15_0.ladyDict[arg_15_0.apartment:GetConfigID()]

			arg_15_0[arg_30_1](var_30_1, ...)
		end
	end)
end

function var_0_0.RegisterIKFunc(arg_31_0)
	pg.IKMgr.GetInstance():RegisterOnIKLayerActive(function(arg_32_0)
		arg_31_0.blockIK = true

		local var_32_0 = arg_31_0.ladyDict[arg_31_0.apartment:GetConfigID()]

		var_32_0.ikHandler = arg_32_0

		local var_32_1 = _.detect(var_32_0.readyIKLayers, function(arg_33_0)
			return arg_33_0:GetControllerPath() == arg_32_0.ikData:GetControllerPath()
		end)

		arg_31_0:EnableIKLayer(var_32_1)

		arg_31_0.ikNextCheckStamp = Time.time + var_0_0.IK_STATUS_DELTA

		arg_31_0:emit(var_0_0.ON_IK_STATUS_CHANGED, var_32_1:GetConfigID(), var_0_0.IK_STATUS.BEGIN)
	end)
	pg.IKMgr.GetInstance():RegisterOnIKLayerDrag(function(arg_34_0)
		arg_31_0.ladyDict[arg_31_0.apartment:GetConfigID()].ikHandler = arg_34_0

		arg_31_0:ResetIKTipTimer()
	end)
	pg.IKMgr.GetInstance():RegisterOnIKLayerDeactive(function(arg_35_0, arg_35_1)
		local var_35_0 = arg_31_0.ladyDict[arg_31_0.apartment:GetConfigID()]
		local var_35_1 = _.detect(var_35_0.readyIKLayers, function(arg_36_0)
			return arg_36_0:GetControllerPath() == arg_35_0.ikData:GetControllerPath()
		end)

		arg_31_0:DeactiveIKLayer(var_35_1)

		var_35_0.ikHandler = nil
		arg_31_0.blockIK = arg_35_1

		arg_31_0:emit(var_0_0.ON_IK_STATUS_CHANGED, var_35_1:GetConfigID(), var_0_0.IK_STATUS.RELEASE)
	end)
	pg.IKMgr.GetInstance():RegisterOnIKLayerAction(function(arg_37_0)
		local var_37_0 = arg_31_0.ladyDict[arg_31_0.apartment:GetConfigID()]

		arg_31_0.blockIK = nil

		local var_37_1 = _.detect(var_37_0.readyIKLayers, function(arg_38_0)
			return arg_38_0:GetControllerPath() == arg_37_0.ikData:GetControllerPath()
		end)

		arg_31_0:OnTriggerIK(var_37_1)
		arg_31_0:emit(var_0_0.ON_IK_STATUS_CHANGED, var_37_1:GetConfigID(), var_0_0.IK_STATUS.TRIGGER)
	end)
end

function var_0_0.initScene(arg_39_0)
	local var_39_0, var_39_1 = unpack(string.split(arg_39_0.dormSceneMgr.sceneInfo, "|"))
	local var_39_2 = SceneManager.GetSceneByName(var_39_0 .. "_base")

	arg_39_0:ResetSceneStructure(var_39_2)

	arg_39_0.mainCameraTF = GameObject.Find("BackYardMainCamera").transform
	arg_39_0.camBrain = arg_39_0.mainCameraTF:GetComponent(typeof(Cinemachine.CinemachineBrain))
	arg_39_0.camBrainEvenetHandler = arg_39_0.mainCameraTF:GetComponent(typeof(CameraBrainEventsHandler))
	arg_39_0.raycastCamera = arg_39_0.mainCameraTF:Find("CameraForRaycast"):GetComponent(typeof(Camera))
	arg_39_0.sceneRaycaster = arg_39_0.raycastCamera:GetComponent(typeof(UnityEngine.EventSystems.PhysicsRaycaster))
	arg_39_0.player = GameObject.Find("Player").transform
	arg_39_0.playerEye = arg_39_0.player:Find("Eye")
	arg_39_0.playerFoot = arg_39_0.player:Find("Foot")

	setActive(arg_39_0.playerFoot, false)

	arg_39_0.playerController = arg_39_0.player:GetComponent(typeof(UnityEngine.CharacterController))
	arg_39_0.attachedPoints = {}

	eachChild(arg_39_0.furnitures, function(arg_40_0)
		table.insert(arg_39_0.attachedPoints, 1, arg_40_0)
	end)

	arg_39_0.modelRoot = GameObject.Find("scene_root").transform
	arg_39_0.slotRoot = GameObject.Find("FurnitureSlots").transform

	setActive(arg_39_0.slotRoot, true)
	arg_39_0:InitSlots()

	arg_39_0.resTF = GameObject.Find("Res").transform

	tolua.loadassembly("Cinemachine")

	local var_39_3 = GameObject.Find("CM Cameras").transform

	eachChild(var_39_3, function(arg_41_0)
		setActive(arg_41_0, false)
	end)

	arg_39_0.camBrain.enabled = false
	arg_39_0.camBrain.enabled = true
	arg_39_0.cameraAim = var_39_3:Find("Aim Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))
	arg_39_0.cameraAim2 = var_39_3:Find("Aim2 Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))
	arg_39_0.cameraFree = nil
	arg_39_0.cameraFurnitureWatch = nil
	arg_39_0.cameraRole = var_39_3:Find("Role Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))
	arg_39_0.cameraRole2 = var_39_3:Find("Role2 Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))

	local var_39_4 = var_39_3:Find("Talk Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))

	arg_39_0.cameraGift = var_39_3:Find("Gift Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))
	arg_39_0.cameras = {
		arg_39_0.cameraAim,
		arg_39_0.cameraAim2,
		arg_39_0.cameraRole,
		[var_0_0.CAMERA.TALK] = var_39_4,
		[var_0_0.CAMERA.GIFT] = arg_39_0.cameraGift,
		[var_0_0.CAMERA.ROLE2] = arg_39_0.cameraRole2,
		[var_0_0.CAMERA.PHOTO] = var_39_3:Find("Photo Camera"):GetComponent(typeof(Cinemachine.CinemachineFreeLook)),
		[var_0_0.CAMERA.PHOTO_FREE] = var_39_3:Find("PhotoFree Controller"),
		[var_0_0.CAMERA.POV] = var_39_3:Find("FP Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))
	}

	setActive(arg_39_0.cameras[var_0_0.CAMERA.PHOTO_FREE]:Find("PhotoFree Camera"), true)

	arg_39_0.compPovAim = arg_39_0.cameras[var_0_0.CAMERA.POV]:GetCinemachineComponent(Cinemachine.CinemachineCore.Stage.Aim)
	arg_39_0.cameraRoot = var_39_3
	arg_39_0.POVOriginalFOV = arg_39_0:GetPOVFOV()
	arg_39_0.restrictedBox = GameObject.Find("RestrictedArea").transform

	setActive(arg_39_0.restrictedBox, false)

	arg_39_0.restrictedHeightRange = {
		arg_39_0.restrictedBox:Find("Floor").position.y,
		arg_39_0.restrictedBox:Find("Celling").position.y
	}
	arg_39_0.ladyInterest = GameObject.Find("InterestProxy").transform
	arg_39_0.daynightCtrlComp = GameObject.Find("[MainBlock]").transform:GetComponent(typeof(DayNightCtrl))

	arg_39_0:SwitchDayNight(arg_39_0.contextData.timeIndex)

	arg_39_0.tfCutIn = getSceneRootTFDic(SceneManager.GetSceneByName(var_39_0 .. "_base")).CutIn

	if arg_39_0.tfCutIn then
		arg_39_0.modelCutIn = {
			lady = arg_39_0.tfCutIn:Find("lady"):GetChild(0),
			player = arg_39_0.tfCutIn:Find("player"):GetChild(0)
		}

		setActive(arg_39_0.tfCutIn, false)
	end
end

function var_0_0.SwitchDayNight(arg_42_0, arg_42_1)
	if not IsNil(arg_42_0.daynightCtrlComp) then
		arg_42_0.daynightCtrlComp:SwitcherToIndex(arg_42_1 - 1)
	end

	arg_42_0:InitLightSettings()
end

function var_0_0.InitLightSettings(arg_43_0)
	arg_43_0.globalVolume = GameObject.Find("GlobalVolume")

	arg_43_0:RegisterGlobalVolume()

	arg_43_0.characterLight = GameObject.Find("CharacterLight")

	arg_43_0:RecordCharacterLight()

	local var_43_0 = GameObject.Find("[Lighting]").transform

	table.IpairsCArray(var_43_0:GetComponentsInChildren(typeof(Light), true), function(arg_44_0, arg_44_1)
		arg_44_1.shadows = UnityEngine.LightShadows.None
	end)
end

function var_0_0.ResetSceneStructure(arg_45_0, arg_45_1)
	table.IpairsCArray(arg_45_1:GetRootGameObjects(), function(arg_46_0, arg_46_1)
		if arg_46_1.name == "Furnitures" then
			arg_45_0.furnitures = tf(arg_46_1)

			eachChild(arg_45_0.furnitures, function(arg_47_0)
				if arg_47_0:Find("FreeLook Camera") then
					setActive(arg_47_0:Find("FreeLook Camera"), false)
				end

				if arg_47_0:Find("FreeLook Camera") then
					setActive(arg_47_0:Find("RoleWatch Camera"), false)
				end

				if arg_47_0:Find("IKCamera") then
					setActive(arg_47_0:Find("IKCamera"), false)
				end

				local var_47_0 = arg_47_0:GetComponent(typeof(UnityEngine.Collider))

				if not var_47_0 then
					return
				end

				var_47_0.enabled = false
			end)
		end
	end)

	arg_45_0.sectorsDic = arg_45_0.sectorsDic or {}

	if not arg_45_0.sectorsDic[arg_45_1.name] then
		arg_45_0.sectorsDic[arg_45_1.name] = table.shallowCopy(var_0_2[arg_45_1.name]) or {}

		setmetatable(arg_45_0.sectorsDic[arg_45_1.name], {
			__index = function(arg_48_0, arg_48_1)
				local var_48_0 = arg_45_0.furnitures:Find(arg_48_1 .. "/StayPoint")

				if var_48_0 then
					local var_48_1 = var_48_0.position
					local var_48_2 = var_48_0.eulerAngles

					arg_48_0[arg_48_1] = {
						Radius = 2,
						Angle = 120,
						Position = {
							var_48_1.x,
							var_48_1.y,
							var_48_1.z
						},
						Rotation = {
							var_48_2.x,
							var_48_2.y,
							var_48_2.z
						}
					}

					return arg_48_0[arg_48_1]
				else
					return nil
				end
			end
		})
	end

	arg_45_0.activeSectors = arg_45_0.sectorsDic[arg_45_1.name]
end

function var_0_0.InitSlots(arg_49_0)
	local var_49_0 = arg_49_0.room:GetSlots()
	local var_49_1 = arg_49_0.modelRoot:GetComponentsInChildren(typeof(Transform), true)

	arg_49_0.slotDict = {}

	_.each(var_49_0, function(arg_50_0)
		local var_50_0 = arg_50_0:GetFurnitureName()
		local var_50_1 = arg_50_0:GetConfigID()
		local var_50_2 = arg_49_0.slotRoot:Find(tostring(var_50_1))

		if not var_50_2 then
			errorMsg("Not Find Slot: " .. var_50_1)

			return
		end

		local var_50_3 = {
			trans = var_50_2,
			sceneHides = {}
		}
		local var_50_4 = var_50_2:Find("Selector")

		if var_50_4 then
			GetOrAddComponent(var_50_4, typeof(EventTriggerListener)):AddPointClickFunc(function(arg_51_0, arg_51_1)
				arg_49_0:emit(Dorm3dRoomMediator.ON_CLICK_FURNITURE_SLOT, var_50_1)
			end)
			setActive(var_50_4, false)
		end

		local var_50_5

		for iter_50_0 = 0, var_49_1.Length - 1 do
			local var_50_6 = var_49_1[iter_50_0]

			if var_50_6.name == var_50_0 then
				var_50_5 = var_50_6

				break
			end
		end

		if var_50_5 then
			var_50_3.model = var_50_5
		end

		arg_49_0.slotDict[var_50_1] = var_50_3
	end)
end

function var_0_0.SetContactStateDic(arg_52_0, arg_52_1)
	arg_52_0.contactStateDic = arg_52_1
	arg_52_0.hideContactStateDic = {}
	arg_52_0.contactInRangeDic = {}

	for iter_52_0, iter_52_1 in pairs(arg_52_0.contactStateDic) do
		arg_52_0.hideContactStateDic[iter_52_0] = math.min(iter_52_1, ApartmentRoom.ITEM_UNLOCK)
		arg_52_0.contactInRangeDic[iter_52_0] = false
	end

	arg_52_0:ActiveContact()
end

function var_0_0.TempHideContact(arg_53_0, arg_53_1)
	arg_53_0.hideConcatFlag = arg_53_1

	arg_53_0:ActiveContact()
end

function var_0_0.ActiveContact(arg_54_0)
	for iter_54_0, iter_54_1 in pairs(arg_54_0.contactInRangeDic) do
		arg_54_0:UpdateContactDisplay(iter_54_0, arg_54_0.contactInRangeDic[iter_54_0] and not arg_54_0.hideConcatFlag and arg_54_0.contactStateDic[iter_54_0] or arg_54_0.hideContactStateDic[iter_54_0])
	end
end

function var_0_0.UpdateContactDisplay(arg_55_0, arg_55_1, arg_55_2)
	local var_55_0 = pg.dorm3d_collection_template[arg_55_1]

	for iter_55_0, iter_55_1 in ipairs(var_55_0.vfx_prefab) do
		local var_55_1 = arg_55_0.modelRoot:Find(iter_55_1)

		if arg_55_0:IsModeInHidePending(iter_55_1) then
			-- block empty
		elseif not arg_55_0.modelRoot:Find(iter_55_1) then
			warning(arg_55_1, iter_55_1)
		else
			setActive(var_55_1, arg_55_2 == ApartmentRoom.ITEM_FIRST)
		end
	end

	for iter_55_2, iter_55_3 in ipairs(var_55_0.model) do
		if arg_55_0:IsModeInHidePending(iter_55_3) then
			-- block empty
		elseif not arg_55_0.modelRoot:Find(iter_55_3) then
			warning(arg_55_1, iter_55_3)
		else
			local var_55_2 = arg_55_0.modelRoot:Find(iter_55_3)

			if arg_55_0:CheckSceneItemActive(var_55_2) then
				local var_55_3 = GetComponent(var_55_2, typeof(EventTriggerListener))

				if arg_55_2 == ApartmentRoom.ITEM_FIRST then
					var_55_3 = var_55_3 or GetOrAddComponent(var_55_2, typeof(EventTriggerListener))

					var_55_3:AddPointClickFunc(function(arg_56_0, arg_56_1)
						arg_55_0:emit(var_0_0.CLICK_CONTACT, arg_55_1)
					end)

					var_55_3.enabled = true
				elseif var_55_3 then
					var_55_3.enabled = false
				end

				setActive(var_55_2, arg_55_2 > ApartmentRoom.ITEM_LOCK)
			end
		end
	end
end

function var_0_0.SetFloatEnable(arg_57_0, arg_57_1)
	arg_57_0.enableFloatUpdate = arg_57_1

	if arg_57_1 then
		arg_57_0.ladyDict[arg_57_0.apartment:GetConfigID()]:UpdateFloatPosition()
	end
end

function var_0_0.UpdateFloatPosition(arg_58_0)
	local var_58_0 = arg_58_0.ladyDict[arg_58_0.apartment:GetConfigID()]
	local var_58_1 = arg_58_0:GetScreenPosition(var_58_0.ladyHeadCenter.position + Vector3(0, 0.2, 0))
	local var_58_2 = arg_58_0:GetLocalPosition(var_58_1, arg_58_0.rtFloatPage)

	setLocalPosition(arg_58_0.rtFloatPage:Find("lady"), var_58_2)
end

function var_0_0.LoadCharacter(arg_59_0, arg_59_1, arg_59_2)
	arg_59_0.hxMatDict = {}
	arg_59_0.ladyDict = {}
	arg_59_0.skinDict = {}

	local var_59_0 = {}

	for iter_59_0, iter_59_1 in ipairs(arg_59_1) do
		local var_59_1 = setmetatable({}, {
			__index = arg_59_0
		})

		arg_59_0.ladyDict[iter_59_1] = var_59_1

		local var_59_2 = getProxy(ApartmentProxy):getApartment(iter_59_1)
		local var_59_3 = var_59_2:getConfig("asset_name")
		local var_59_4 = var_59_2:GetSkinModelID(arg_59_0.room:getConfig("tag"))
		local var_59_5 = pg.dorm3d_resource[var_59_4].model_id

		assert(var_59_5)

		for iter_59_2, iter_59_3 in ipairs({
			"common",
			var_59_5
		}) do
			local var_59_6 = string.format("dorm3d/character/%s/res/%s", var_59_3, iter_59_3)

			if checkABExist(var_59_6) then
				table.insert(var_59_0, function(arg_60_0)
					arg_59_0.loader:LoadBundle(var_59_6, function(arg_61_0)
						for iter_61_0, iter_61_1 in ipairs(arg_61_0:GetAllAssetNames()) do
							local var_61_0, var_61_1, var_61_2 = string.find(iter_61_1, "material_hx[/\\](.*).mat")

							if var_61_0 then
								arg_59_0.hxMatDict[var_61_2] = {
									arg_61_0,
									iter_61_1
								}
							end
						end

						arg_60_0()
					end)
				end)
			end
		end

		var_59_1.skinId = var_59_4
		var_59_1.skinIdList = {
			var_59_4
		}

		table.insert(var_59_0, function(arg_62_0)
			local var_62_0 = string.format("dorm3d/character/%s/prefabs/%s", var_59_3, var_59_5)

			arg_59_0.loader:GetPrefab(var_62_0, "", function(arg_63_0)
				var_59_1.ladyGameobject = arg_63_0
				arg_59_0.skinDict[var_59_4] = {
					ladyGameobject = arg_63_0
				}

				arg_62_0()
			end)
		end)

		if arg_59_0.room:isPersonalRoom() then
			local var_59_7 = var_59_2:GetSkinModelID("touch")

			if var_59_7 then
				local var_59_8 = pg.dorm3d_resource[var_59_7].model_id
				local var_59_9 = string.format("dorm3d/character/%s/prefabs/%s", var_59_3, var_59_8)

				if #var_59_8 > 0 and checkABExist(var_59_9) then
					table.insert(var_59_1.skinIdList, var_59_7)
					table.insert(var_59_0, function(arg_64_0)
						arg_59_0.loader:GetPrefab(var_59_9, "", function(arg_65_0)
							arg_59_0.skinDict[var_59_7] = {
								ladyGameobject = arg_65_0
							}
							GetComponent(arg_65_0, "GraphOwner").enabled = false

							onNextTick(function()
								setActive(arg_65_0, false)
							end)
							arg_64_0()
						end)
					end)
				end
			end
		end

		if arg_59_0.contextData.pendingDic[iter_59_1] then
			local var_59_10 = pg.dorm3d_welcome[arg_59_0.contextData.pendingDic[iter_59_1]]

			if var_59_10.item_prefab ~= "" then
				table.insert(var_59_0, function(arg_67_0)
					local var_67_0 = string.lower("dorm3d/furniture/item/" .. var_59_10.item_prefab)

					arg_59_0.loader:GetPrefab(var_67_0, "", function(arg_68_0)
						var_59_1.tfPendintItem = arg_68_0.transform

						onNextTick(function()
							setActive(arg_68_0, false)
						end)
						arg_67_0()
					end)
				end)
			end
		end
	end

	parallelAsync(var_59_0, arg_59_2)
end

function var_0_0.HXCharacter(arg_70_0, arg_70_1)
	if not HXSet.isHx() then
		return
	end

	local var_70_0 = arg_70_1:GetComponentsInChildren(typeof(SkinnedMeshRenderer), true)

	table.IpairsCArray(var_70_0, function(arg_71_0, arg_71_1)
		local var_71_0 = arg_71_1.sharedMaterials
		local var_71_1 = false

		table.IpairsCArray(var_71_0, function(arg_72_0, arg_72_1)
			if arg_72_1 == nil then
				return
			end

			local var_72_0 = arg_72_1.name

			if not arg_70_0.hxMatDict[var_72_0] then
				return
			end

			var_71_1 = true

			local var_72_1, var_72_2 = unpack(arg_70_0.hxMatDict[var_72_0])
			local var_72_3 = var_72_1:LoadAssetSync(var_72_2, typeof(Material), false, false)

			var_71_0[arg_72_0] = var_72_3

			warning("Replace HX Material", arg_70_0.hxMatDict[var_72_0][2])
		end)

		if var_71_1 then
			arg_71_1.sharedMaterials = var_71_0
		end
	end)
end

function var_0_0.InitCharacter(arg_73_0, arg_73_1, arg_73_2)
	arg_73_1.lady = arg_73_1.ladyGameobject.transform

	arg_73_1.lady:SetParent(arg_73_1.mainCameraTF)
	arg_73_1.lady:SetParent(nil)

	arg_73_1.ladyHeadIKComp = arg_73_1.lady:GetComponent(typeof(HeadAimIK))
	arg_73_1.ladyHeadIKComp.AimTarget = arg_73_1.mainCameraTF:Find("AimTarget")
	arg_73_1.ladyHeadIKData = {
		DampTime = arg_73_1.ladyHeadIKComp.DampTime,
		blinkSpeed = arg_73_1.ladyHeadIKComp.blinkSpeed,
		BodyWeight = arg_73_1.ladyHeadIKComp.BodyWeight,
		HeadWeight = arg_73_1.ladyHeadIKComp.HeadWeight
	}

	local var_73_0 = {}

	table.Foreach(var_0_1, function(arg_74_0, arg_74_1)
		var_73_0[arg_74_1] = arg_74_0
	end)

	arg_73_1.ladyAnimator = arg_73_1.lady:GetComponent(typeof(Animator))
	arg_73_1.ladyAnimBaseLayerIndex = arg_73_1.ladyAnimator:GetLayerIndex("Base Layer")
	arg_73_1.ladyAnimFaceLayerIndex = arg_73_1.ladyAnimator:GetLayerIndex("Face")
	arg_73_1.ladyBoneMaps = {}

	local var_73_1 = arg_73_1.lady:GetComponentsInChildren(typeof(Transform), true)

	table.IpairsCArray(var_73_1, function(arg_75_0, arg_75_1)
		if arg_75_1.name == "BodyCollider" then
			arg_73_1.ladyCollider = arg_75_1

			setActive(arg_75_1, true)
		elseif arg_75_1.name == "SafeCollider" then
			arg_73_1.ladySafeCollider = arg_75_1

			setActive(arg_75_1, false)
		elseif arg_75_1.name == "Interest" then
			arg_73_1.ladyInterestRoot = arg_75_1
		elseif arg_75_1.name == "Head Center" then
			arg_73_1.ladyHeadCenter = arg_75_1
		end

		if var_73_0[arg_75_1.name] then
			arg_73_1.ladyBoneMaps[var_73_0[arg_75_1.name]] = arg_75_1
		end
	end)

	arg_73_1.ladyColliders = {}
	arg_73_1.ladyTouchColliders = {}

	table.IpairsCArray(arg_73_1.lady:GetComponentsInChildren(typeof(UnityEngine.Collider), true), function(arg_76_0, arg_76_1)
		if arg_76_1:GetType():Equals(typeof(UnityEngine.MeshCollider)) then
			return
		end

		child = tf(arg_76_1)

		local var_76_0 = child.name
		local var_76_1 = var_76_0 and string.find(var_76_0, "Collider") or -1

		if var_76_1 <= 0 then
			errorMsg("Wrong Name to lady Collider : " .. var_76_0)

			return
		end

		local var_76_2 = string.sub(var_76_0, 1, var_76_1 - 1)

		if var_0_0.BONE_TO_TOUCH[var_76_2] == nil then
			return
		end

		arg_73_1.ladyColliders[var_76_2] = child

		table.insert(arg_73_1.ladyTouchColliders, child)
		setActive(child, false)
	end)
	arg_73_1:HXCharacter(arg_73_1.lady)
	;(function()
		local var_77_0 = "dorm3d/effect/prefab/function/vfx_function_aixin02"
		local var_77_1 = "vfx_function_aixin02"

		arg_73_1.loader:GetPrefab(var_77_0, var_77_1, function(arg_78_0)
			arg_73_1.effectHeart = arg_78_0

			setActive(arg_78_0, false)
			onNextTick(function()
				setParent(arg_73_1.effectHeart, arg_73_1.ladyHeadCenter)
			end)
		end)
	end)()

	arg_73_1.clothComps = {}
	arg_73_1.ladyClothCompSettings = {}

	table.IpairsCArray(arg_73_1.lady:GetComponentsInChildren(typeof("MagicaCloth.BaseCloth"), true), function(arg_80_0, arg_80_1)
		table.insert(arg_73_1.clothComps, arg_80_1)

		arg_73_1.ladyClothCompSettings[arg_80_1] = {
			enabled = arg_80_1.enabled
		}
	end)

	arg_73_1.clothColliderDict = {}
	arg_73_1.ladyClothColliderSettings = {}

	local var_73_2 = typeof("MagicaCloth.MagicaCapsuleCollider")

	table.IpairsCArray(arg_73_1.lady:GetComponentsInChildren(var_73_2, true), function(arg_81_0, arg_81_1)
		arg_73_1.clothColliderDict[arg_81_1.name] = arg_81_1
		arg_73_1.ladyClothColliderSettings[arg_81_1] = {
			enabled = arg_81_1.enabled,
			StartRadius = ReflectionHelp.RefGetProperty(var_73_2, "StartRadius", arg_81_1),
			EndRadius = ReflectionHelp.RefGetProperty(var_73_2, "EndRadius", arg_81_1)
		}
	end)
	arg_73_1:EnableCloth(arg_73_1, false)

	arg_73_1.ladyIKRoot = arg_73_1.lady:Find("IKLayers")

	eachChild(arg_73_1.ladyIKRoot, function(arg_82_0)
		setActive(arg_82_0, false)
	end)
	GetComponent(arg_73_1.lady, typeof(EventTriggerListener)):AddPointClickFunc(function(arg_83_0, arg_83_1)
		if arg_83_1.rawPointerPress.transform == arg_73_1.ladyCollider then
			arg_73_1:emit(var_0_0.CLICK_CHARACTER, arg_73_2)
		else
			local var_83_0 = table.keyof(arg_73_1.IKSettings.Colliders, arg_83_1.rawPointerPress.transform)

			arg_73_1:emit(var_0_0.ON_TOUCH_CHARACTER, var_83_0 or arg_83_1.rawPointerPress.name)
		end
	end)
	arg_73_1.ladyAnimator:GetComponent("DftAniEvent"):SetCommonEvent(function(arg_84_0)
		if arg_73_1.nowState and arg_84_0.animatorStateInfo:IsName(arg_73_1.nowState) then
			existCall(arg_73_1.stateCallback)

			return
		end

		local var_84_0 = arg_84_0.animatorStateInfo

		for iter_84_0, iter_84_1 in pairs(arg_73_1.animCallbacks) do
			if var_84_0:IsName(iter_84_0) then
				warning("Active", iter_84_0)

				local var_84_1 = table.removebykey(arg_73_1.animCallbacks, iter_84_0)

				existCall(var_84_1)

				return
			end
		end

		if arg_84_0.stringParameter ~= "" then
			arg_73_1:OnAnimationEvent(arg_84_0)
		end
	end)

	arg_73_1.animEventCallbacks = {}
	arg_73_1.animCallbacks = {}
end

function var_0_0.SwitchCharacterSkin(arg_85_0, arg_85_1, arg_85_2, arg_85_3, arg_85_4)
	local var_85_0 = arg_85_1.skinIdList

	assert(table.contains(var_85_0, arg_85_3))

	local var_85_1 = arg_85_0:GetCurrentAnim()
	local var_85_2 = arg_85_1.skinId
	local var_85_3 = arg_85_1.skinDict[var_85_2].ladyGameobject
	local var_85_4 = var_85_3.transform.position
	local var_85_5 = var_85_3.transform.rotation

	setActive(var_85_3, false)

	arg_85_1.skinId = arg_85_3

	setActive(arg_85_1.skinDict[arg_85_3].ladyGameobject, true)

	arg_85_1.ladyGameobject = arg_85_1.skinDict[arg_85_3].ladyGameobject
	arg_85_1.ladyCollider = nil

	arg_85_0:InitCharacter(arg_85_1, arg_85_2)
	arg_85_1.ladyAnimator:Play(var_85_1, arg_85_1.ladyAnimBaseLayerIndex)
	arg_85_1.ladyAnimator:Update(0)
	arg_85_1.lady:SetPositionAndRotation(var_85_4, var_85_5)
	existCall(arg_85_4)
end

function var_0_0.SetCameraLady(arg_86_0, arg_86_1)
	arg_86_0.cameraAim2.LookAt = arg_86_1.ladyInterestRoot
	arg_86_0.cameras[var_0_0.CAMERA.TALK].Follow = arg_86_1.ladyInterestRoot
	arg_86_0.cameras[var_0_0.CAMERA.TALK].LookAt = arg_86_1.ladyInterestRoot
	arg_86_0.cameraGift.Follow = arg_86_0.ladyInterest
	arg_86_0.cameraGift.LookAt = arg_86_0.ladyInterest
	arg_86_0.cameraRole2.LookAt = arg_86_1.ladyInterestRoot
	arg_86_0.cameras[var_0_0.CAMERA.PHOTO].Follow = arg_86_0.ladyInterest
	arg_86_0.cameras[var_0_0.CAMERA.PHOTO].LookAt = arg_86_0.ladyInterest
end

function var_0_0.initNodeCanvas(arg_87_0)
	local var_87_0 = pg.NodeCanvasMgr.GetInstance()

	var_87_0:Active()
	var_87_0:RegisterFunc("DistanceTrigger", function(arg_88_0)
		arg_87_0:emit(var_0_0.DISTANCE_TRIGGER, arg_88_0, arg_87_0.ladyDict[arg_88_0].dis)
	end)
	var_87_0:RegisterFunc("ShortWaitAction", function(arg_89_0)
		arg_87_0:DoShortWait(arg_89_0)
	end)
	var_87_0:RegisterFunc("WatchShortWaitAction", function(arg_90_0)
		arg_87_0:DoShortWait(arg_90_0)
	end)
	var_87_0:RegisterFunc("WalkDistanceTrigger", function(arg_91_0)
		arg_87_0:emit(var_0_0.WALK_DISTANCE_TRIGGER, arg_91_0, arg_87_0.ladyDict[arg_91_0].dis)
	end)
	var_87_0:RegisterFunc("ChangeWatch", function(arg_92_0)
		arg_87_0:emit(var_0_0.CHANGE_WATCH, arg_92_0)
	end)
end

function var_0_0.SetAllBlackbloardValue(arg_93_0, arg_93_1, arg_93_2)
	arg_93_0[arg_93_1] = arg_93_2

	for iter_93_0, iter_93_1 in pairs(arg_93_0.ladyDict) do
		arg_93_0:SetBlackboardValue(iter_93_1, arg_93_1, arg_93_2)
	end
end

function var_0_0.SetBlackboardValue(arg_94_0, arg_94_1, arg_94_2, arg_94_3)
	arg_94_1.blackboard = arg_94_1.blackboard or {}
	arg_94_1.blackboard[arg_94_2] = arg_94_3

	pg.NodeCanvasMgr.GetInstance():SetBlackboradValue(arg_94_2, arg_94_3, arg_94_1.ladyBlackboard)
end

function var_0_0.GetBlackboardValue(arg_95_0, arg_95_1, arg_95_2)
	arg_95_1.blackboard = arg_95_1.blackboard or {}

	return arg_95_1.blackboard[arg_95_2]
end

function var_0_0.didEnter(arg_96_0)
	local var_96_0 = -21.6 / Screen.height

	arg_96_0.joystickDelta = Vector2.zero
	arg_96_0.joystickTimer = FrameTimer.New(function()
		local var_97_0 = arg_96_0.joystickDelta * var_96_0
		local var_97_1 = var_97_0.x
		local var_97_2 = var_97_0.y

		local function var_97_3(arg_98_0, arg_98_1, arg_98_2)
			local var_98_0 = arg_98_0[arg_98_1]

			var_98_0.m_InputAxisValue = arg_98_2
			arg_98_0[arg_98_1] = var_98_0
		end

		if arg_96_0.surroudCamera and not arg_96_0.pinchMode then
			var_97_3(arg_96_0.surroudCamera, "m_XAxis", var_97_1)
			var_97_3(arg_96_0.surroudCamera, "m_YAxis", var_97_2)
		elseif arg_96_0.furniturePOV and arg_96_0.cameras[var_0_0.CAMERA.FURNITURE_WATCH] and isActive(arg_96_0.cameras[var_0_0.CAMERA.FURNITURE_WATCH]) then
			var_97_3(arg_96_0.furniturePOV, "m_HorizontalAxis", var_97_1)
			var_97_3(arg_96_0.furniturePOV, "m_VerticalAxis", var_97_2)
		end

		arg_96_0.joystickDelta = Vector2.zero
	end, 1, -1)

	arg_96_0.joystickTimer:Start()

	local var_96_1 = 1.75

	arg_96_0.moveStickTimer = FrameTimer.New(function()
		if not arg_96_0.moveStickDraging then
			return
		end

		local var_99_0 = arg_96_0.moveStickPosition
		local var_99_1 = 200
		local var_99_2 = (var_99_0 - arg_96_0.moveStickOrigin):ClampMagnitude(var_99_1)
		local var_99_3 = var_99_2 / var_99_1

		arg_96_0.moveStickPosition = arg_96_0.moveStickOrigin + var_99_2

		local var_99_4 = Vector3.New(var_99_3.x, 0, var_99_3.y)
		local var_99_5 = arg_96_0.mainCameraTF:TransformDirection(var_99_4)

		var_99_5.y = 0

		local var_99_6 = var_99_5:Normalize()

		var_99_6:Mul(var_96_1)

		if isActive(arg_96_0.cameras[var_0_0.CAMERA.POV]) then
			arg_96_0.playerController:SimpleMove(var_99_6)

			arg_96_0.tweenFOV = true
		elseif isActive(arg_96_0.cameras[var_0_0.CAMERA.PHOTO_FREE]) then
			arg_96_0.cameras[var_0_0.CAMERA.PHOTO_FREE]:GetComponent(typeof(UnityEngine.CharacterController)):Move(var_99_6 * Time.deltaTime)
			arg_96_0:emit(Dorm3dPhotoMediator.CAMERA_STICK_MOVE, var_99_3:Normalize())
			onNextTick(function()
				local var_100_0 = arg_96_0.cameras[var_0_0.CAMERA.PHOTO_FREE]
				local var_100_1 = math.InverseLerp(arg_96_0.restrictedHeightRange[1], arg_96_0.restrictedHeightRange[2], var_100_0.position.y)

				arg_96_0:emit(Dorm3dPhotoMediator.CAMERA_LIFT_CHANGED, var_100_1)
			end)
		end
	end, 1, -1)

	arg_96_0.moveStickTimer:Start()

	arg_96_0.pinchMode = false
	arg_96_0.pinchSize = 0
	arg_96_0.pinchValue = 1
	arg_96_0.pinchNodeOrder = 1

	GlobalClickEventMgr.Inst:AddBeginPinchFunc(function(arg_101_0, arg_101_1)
		if arg_96_0.surroudCamera and isActive(arg_96_0.surroudCamera) then
			arg_96_0.pinchMode = true
			arg_96_0.pinchSize = (arg_101_0 - arg_101_1):Magnitude()
			arg_96_0.pinchNodeOrder = arg_101_1.x < arg_101_0.x and -1 or 1

			return
		end

		if isActive(arg_96_0.cameras[var_0_0.CAMERA.POV]) then
			if (arg_101_0 - arg_101_1):Magnitude() < Screen.height * 0.5 then
				arg_96_0.pinchMode = true
				arg_96_0.pinchSize = (arg_101_0 - arg_101_1):Magnitude()
				arg_96_0.pinchNodeOrder = arg_101_1.x < arg_101_0.x and -1 or 1
			end

			return
		end
	end)

	local var_96_2 = 0.01

	if IsUnityEditor then
		var_96_2 = 0.1
	end

	local var_96_3 = var_96_2 * 1080 / Screen.height

	GlobalClickEventMgr.Inst:AddPinchFunc(function(arg_102_0, arg_102_1)
		if not arg_96_0.pinchMode then
			return
		end

		local var_102_0 = (arg_102_0 - arg_102_1):Magnitude()
		local var_102_1 = arg_96_0.pinchSize - var_102_0
		local var_102_2 = arg_96_0.pinchNodeOrder * (arg_102_1.x < arg_102_0.x and -1 or 1)
		local var_102_3 = var_102_1 * var_96_3 * var_102_2

		if isActive(arg_96_0.cameras[var_0_0.CAMERA.POV]) then
			local var_102_4 = 0.5
			local var_102_5 = 1

			arg_96_0.pinchValue = math.clamp(arg_96_0.pinchValue + var_102_3, var_102_4, var_102_5)
			arg_96_0.pinchSize = var_102_0

			arg_96_0:SetPOVFOV(arg_96_0.POVOriginalFOV * arg_96_0.pinchValue)

			arg_96_0.tweenFOV = nil

			return
		end

		if isActive(arg_96_0.surroudCamera) and arg_96_0.surroudCamera == arg_96_0.cameras[var_0_0.CAMERA.PHOTO] then
			local var_102_6 = 0.5
			local var_102_7 = 1

			arg_96_0:SetPinchValue(math.clamp(arg_96_0.pinchValue + var_102_3, var_102_6, var_102_7))

			arg_96_0.pinchSize = var_102_0

			return
		end
	end)
	GlobalClickEventMgr.Inst:AddEndPinchFunc(function()
		arg_96_0.pinchMode = false
		arg_96_0.pinchSize = 0
	end)

	arg_96_0.cameraBlendCallbacks = {}
	arg_96_0.activeCMCamera = nil

	function arg_96_0.camBrainEvenetHandler.OnBlendStarted(arg_104_0)
		if arg_96_0.activeCMCamera then
			arg_96_0:OnCameraBlendFinished(arg_96_0.activeCMCamera)
		end

		local var_104_0 = arg_96_0.camBrain.ActiveVirtualCamera

		arg_96_0.activeCMCamera = var_104_0
	end

	function arg_96_0.camBrainEvenetHandler.OnBlendFinished(arg_105_0)
		arg_96_0.activeCMCamera = nil

		arg_96_0:OnCameraBlendFinished(arg_105_0)
	end

	for iter_96_0, iter_96_1 in pairs(arg_96_0.ladyDict) do
		if iter_96_1.tfPendintItem then
			onNextTick(function()
				setParent(iter_96_1.tfPendintItem, iter_96_1.lady)
			end)
		end

		iter_96_1.ladyOwner = GetComponent(iter_96_1.lady, "GraphOwner")
		iter_96_1.ladyBlackboard = GetComponent(iter_96_1.lady, "Blackboard")

		arg_96_0:SetBlackboardValue(iter_96_1, "groupId", iter_96_0)
		onNextTick(function()
			iter_96_1.ladyOwner.enabled = true
		end)
	end

	arg_96_0.expressionDict = {}

	pg.UIMgr.GetInstance():OverlayPanel(arg_96_0.blockLayer, {
		weight = LayerWeightConst.SECOND_LAYER,
		groupName = LayerWeightConst.GROUP_DORM3D
	})
	arg_96_0:ActiveCamera(arg_96_0.cameras[var_0_0.CAMERA.POV])

	local var_96_4
	local var_96_5
	local var_96_6 = arg_96_0.resumeCallback

	function arg_96_0.resumeCallback()
		var_96_5 = true

		if var_96_4 then
			existCall(var_96_6)
		end
	end

	arg_96_0:RefreshSlots(nil, function()
		var_96_4 = true

		if var_96_5 then
			existCall(var_96_6)
		end
	end)

	arg_96_0.updateHandler = UpdateBeat:CreateListener(function()
		xpcall(function()
			arg_96_0:Update()
		end, function(...)
			errorMsg(debug.traceback(...))
		end)
	end)

	UpdateBeat:AddListener(arg_96_0.updateHandler)
end

function var_0_0.InitData(arg_113_0)
	if not arg_113_0.contextData.ladyZone then
		arg_113_0.contextData.ladyZone = {}

		local var_113_0
		local var_113_1 = arg_113_0.room:getConfig("default_zone")

		for iter_113_0, iter_113_1 in ipairs(arg_113_0.contextData.groupIds) do
			for iter_113_2, iter_113_3 in ipairs(var_113_1) do
				if iter_113_3[1] == iter_113_1 then
					arg_113_0.contextData.ladyZone[iter_113_1] = iter_113_3[2]

					break
				end
			end

			assert(arg_113_0.contextData.ladyZone[iter_113_1])

			var_113_0 = var_113_0 or arg_113_0.contextData.ladyZone[iter_113_1]
		end

		arg_113_0.contextData.inFurnitureName = var_113_0 or var_113_1[1][2]
	end

	arg_113_0.zoneDatas = _.select(arg_113_0.room:GetZones(), function(arg_114_0)
		return not arg_114_0:IsGlobal()
	end)
	arg_113_0.activeSectors = {}
	arg_113_0.activeLady = {}
end

function var_0_0.Update(arg_115_0)
	arg_115_0.raycastCamera.fieldOfView = arg_115_0.mainCameraTF:GetComponent(typeof(Camera)).fieldOfView

	if arg_115_0.tweenFOV then
		local var_115_0 = Damp(1, 1, Time.deltaTime)

		arg_115_0.pinchValue = Mathf.Lerp(arg_115_0.pinchValue, 1, var_115_0)

		arg_115_0:SetPOVFOV(arg_115_0.POVOriginalFOV * arg_115_0.pinchValue)

		if arg_115_0.pinchValue > 0.99 then
			arg_115_0.tweenFOV = nil
		end
	end

	if isActive(arg_115_0.cameras[var_0_0.CAMERA.POV]) then
		arg_115_0:TriggerLadyDistance()
	end

	if arg_115_0.contactInRangeDic then
		local var_115_1 = arg_115_0.mainCameraTF.forward
		local var_115_2 = arg_115_0.mainCameraTF.position
		local var_115_3 = UnityEngine.Rect.New(0, 0, Screen.width, Screen.height)

		local function var_115_4(arg_116_0, arg_116_1, arg_116_2)
			local var_116_0 = arg_116_0.position - var_115_2
			local var_116_1 = Clone(var_116_0)

			var_116_1.y = 0

			if arg_116_1 < var_116_1.magnitude then
				return false
			end

			local var_116_2 = var_116_0:Normalize()
			local var_116_3 = math.acos(Vector3.Dot(var_116_2, var_115_1)) * math.rad2Deg

			if arg_116_2 < math.abs(var_116_3) then
				return false
			end

			local var_116_4 = arg_115_0.raycastCamera:WorldToScreenPoint(arg_116_0.position)

			if var_116_4.z < 0 then
				return false
			end

			if not var_115_3:Contains(var_116_4) then
				return false
			end

			return true
		end

		for iter_115_0, iter_115_1 in pairs(arg_115_0.contactInRangeDic) do
			local var_115_5 = pg.dorm3d_collection_template[iter_115_0]
			local var_115_6 = underscore.any(var_115_5.vfx_prefab, function(arg_117_0)
				return arg_115_0.modelRoot:Find(arg_117_0) and var_115_4(arg_115_0.modelRoot:Find(arg_117_0), 2, 60)
			end)

			if tobool(iter_115_1) ~= var_115_6 then
				arg_115_0.contactInRangeDic[iter_115_0] = var_115_6

				arg_115_0:UpdateContactDisplay(iter_115_0, var_115_6 and not arg_115_0.hideConcatFlag and arg_115_0.contactStateDic[iter_115_0] or arg_115_0.hideContactStateDic[iter_115_0])
			end
		end
	end

	if arg_115_0.enableFloatUpdate then
		arg_115_0.ladyDict[arg_115_0.apartment:GetConfigID()]:UpdateFloatPosition()
	end

	arg_115_0:CheckInSector()

	if arg_115_0.apartment then
		(function(arg_118_0)
			(function()
				if not arg_118_0.ikHandler then
					return
				end

				local var_119_0 = arg_118_0.ikHandler.screenPosition
				local var_119_1 = pg.UIMgr.GetInstance().uiCamera:Find("Canvas").rect
				local var_119_2 = var_119_0 - Vector2.New(var_119_1.width, var_119_1.height) * 0.5

				setAnchoredPosition(arg_115_0:GetIKHandTF(), var_119_2)

				if Time.time > arg_115_0.ikNextCheckStamp then
					arg_115_0.ikNextCheckStamp = arg_115_0.ikNextCheckStamp + var_0_0.IK_STATUS_DELTA

					local var_119_3 = _.detect(arg_118_0.readyIKLayers, function(arg_120_0)
						return arg_120_0:GetControllerPath() == arg_118_0.ikHandler.ikData:GetControllerPath()
					end)

					arg_115_0:emit(var_0_0.ON_IK_STATUS_CHANGED, var_119_3:GetConfigID(), var_0_0.IK_STATUS.DRAG)
				end
			end)()

			if arg_115_0.enableIKTip then
				local var_118_0 = not arg_115_0.blockIK and Time.time > arg_115_0.nextTipIKTime

				if var_118_0 then
					local var_118_1 = _.filter(arg_118_0.readyIKLayers, function(arg_121_0)
						return not arg_121_0.ignoreDrag
					end)

					UIItemList.StaticAlign(arg_115_0.ikTipsRoot, arg_115_0.ikTipsRoot:GetChild(0), #var_118_1, function(arg_122_0, arg_122_1, arg_122_2)
						if arg_122_0 ~= UIItemList.EventUpdate then
							return
						end

						arg_122_1 = arg_122_1 + 1

						local var_122_0
						local var_122_1 = Vector2.zero
						local var_122_2 = var_118_1[arg_122_1]
						local var_122_3 = var_122_2:GetTriggerBoneName()
						local var_122_4 = var_122_3 and arg_118_0.IKSettings.Colliders[var_122_3] or nil
						local var_122_5 = var_122_2:GetIKTipOffset()

						if var_122_4 then
							local function var_122_6()
								local var_123_0 = arg_118_0.IKSettings.CameraRaycaster.eventCamera:WorldToScreenPoint(var_122_4.position)
								local var_123_1 = CameraMgr.instance:Raycast(arg_118_0.IKSettings.CameraRaycaster, var_123_0)

								if var_123_1.Length == 0 then
									return
								end

								return var_122_4 == var_123_1[0].gameObject.transform
							end
						end

						if var_122_4 then
							local var_122_7 = var_122_4.position
							local var_122_8 = var_122_4:GetComponent(typeof(UnityEngine.Collider))

							if var_122_8 then
								var_122_7 = var_122_8.bounds.center
							end

							local var_122_9 = arg_115_0:GetLocalPosition(arg_115_0:GetScreenPosition(var_122_7, arg_118_0.IKSettings.CameraRaycaster.eventCamera), arg_115_0.ikTipsRoot) + var_122_5

							setLocalPosition(arg_122_2, var_122_9)

							local var_122_10 = var_122_2:GetTriggerRect()
							local var_122_11 = var_122_10:PointToNormalized(Vector2.zero)
							local var_122_12 = Vector2.zero

							if var_122_11.x < 0.5 and var_122_11.y < 0.5 then
								var_122_12 = var_122_10.max
							elseif var_122_11.x >= 0.5 and var_122_11.y < 0.5 then
								var_122_12 = Vector2.New(var_122_10.xMin, var_122_10.yMax)
							elseif var_122_11.x < 0.5 and var_122_11.y >= 0.5 then
								var_122_12 = Vector2.New(var_122_10.xMax, var_122_10.yMin)
							elseif var_122_11.x >= 0.5 and var_122_11.y >= 0.5 then
								var_122_12 = var_122_10.min
							end

							if var_122_11.x == 0.5 then
								if var_122_9.x < 0 then
									var_122_12.x = var_122_10.xMax
								else
									var_122_12.x = var_122_10.xMin
								end
							end

							if var_122_11.y == 0.5 then
								if var_122_9.y < 0 then
									var_122_12.y = var_122_10.yMax
								else
									var_122_12.y = var_122_10.yMin
								end
							end

							local var_122_13 = var_122_12 - var_122_10.center

							setLocalRotation(arg_122_2, Quaternion.LookRotation(Vector3.forward, Vector3.New(var_122_13.x, var_122_13.y, 0)))
						end

						setActive(arg_122_2, var_122_4)
					end)
					UIItemList.StaticAlign(arg_115_0.ikClickTipsRoot, arg_115_0.ikClickTipsRoot:GetChild(0), #arg_118_0.iKTouchDatas, function(arg_124_0, arg_124_1, arg_124_2)
						if arg_124_0 ~= UIItemList.EventUpdate then
							return
						end

						arg_124_1 = arg_124_1 + 1

						local var_124_0
						local var_124_1 = Vector2.zero
						local var_124_2 = arg_124_1
						local var_124_3 = arg_118_0.iKTouchDatas[var_124_2][1]
						local var_124_4 = pg.dorm3d_ik_touch[var_124_3]

						if #var_124_4.scene_item > 0 then
							var_124_0 = arg_115_0:GetSceneItem(var_124_4.scene_item)
						else
							var_124_0 = arg_118_0.IKSettings.Colliders[var_124_4.body]
						end

						if var_124_0 then
							local var_124_5 = var_124_0.position
							local var_124_6 = var_124_0:GetComponent(typeof(UnityEngine.Collider))

							if var_124_6 then
								var_124_5 = var_124_6.bounds.center
							end

							setLocalPosition(arg_124_2, arg_115_0:GetLocalPosition(arg_115_0:GetScreenPosition(var_124_5, arg_118_0.IKSettings.CameraRaycaster.eventCamera), arg_115_0.ikClickTipsRoot) + var_124_1)
						end

						setActive(arg_124_2, var_124_0)
					end)
				end

				setActive(arg_115_0.ikTipsRoot, var_118_0)
				setActive(arg_115_0.ikClickTipsRoot, var_118_0)
				setActive(arg_115_0.ikTextTipsRoot, var_118_0)
			end
		end)(arg_115_0.ladyDict[arg_115_0.apartment:GetConfigID()])
	end
end

function var_0_0.CheckInSector(arg_125_0)
	if not isActive(arg_125_0.cameras[var_0_0.CAMERA.POV]) then
		return
	end

	local var_125_0 = arg_125_0.mainCameraTF.position

	var_125_0.y = 0

	for iter_125_0, iter_125_1 in pairs(arg_125_0.ladyDict) do
		local var_125_1 = tobool(arg_125_0.activeLady[iter_125_0])

		if var_125_1 ~= tobool(var_0_0.IsPointInSector(arg_125_0.activeSectors[iter_125_1.ladyActiveZone], var_125_0)) then
			arg_125_0.activeLady[iter_125_0] = not var_125_1

			arg_125_0:emit(var_0_0.ON_ENTER_SECTOR, iter_125_0)
		end
	end
end

function var_0_0.TriggerLadyDistance(arg_126_0)
	for iter_126_0, iter_126_1 in pairs(arg_126_0.ladyDict) do
		iter_126_1.dis = (iter_126_1.lady.position - arg_126_0.player.position).magnitude

		if (arg_126_0:GetBlackboardValue(iter_126_1, "inPending") and var_0_0.POV_PENDING_CLOSE_DISTANCE or var_0_0.POV_CLOSE_DISTANCE) > iter_126_1.dis ~= arg_126_0:GetBlackboardValue(iter_126_1, "inDistance") then
			arg_126_0:SetBlackboardValue(iter_126_1, "inDistance", iter_126_1.dis < var_0_0.POV_CLOSE_DISTANCE)
			arg_126_0:emit(var_0_0.ON_CHANGE_DISTANCE, iter_126_0, iter_126_1.dis < var_0_0.POV_CLOSE_DISTANCE)
		end
	end
end

function var_0_0.OnStickMove(arg_127_0, arg_127_1)
	arg_127_0.joystickDelta = arg_127_1
end

function var_0_0.SetPinchValue(arg_128_0, arg_128_1)
	arg_128_0.pinchValue = arg_128_1

	arg_128_0:SetCameraObrits()
end

function var_0_0.GetPOVFOV(arg_129_0)
	local var_129_0 = arg_129_0.cameras[var_0_0.CAMERA.POV].m_Lens

	return ReflectionHelp.RefGetField(typeof("Cinemachine.LensSettings"), "FieldOfView", var_129_0)
end

function var_0_0.SetPOVFOV(arg_130_0, arg_130_1)
	local var_130_0 = arg_130_0.cameras[var_0_0.CAMERA.POV].m_Lens

	ReflectionHelp.RefSetField(typeof("Cinemachine.LensSettings"), "FieldOfView", var_130_0, arg_130_1)

	arg_130_0.cameras[var_0_0.CAMERA.POV].m_Lens = var_130_0
end

function var_0_0.RefreshSlots(arg_131_0, arg_131_1, arg_131_2)
	arg_131_1 = arg_131_1 or arg_131_0.room

	local var_131_0 = arg_131_1:GetSlots()
	local var_131_1 = arg_131_1:GetFurnitures()

	arg_131_0:emit(var_0_0.SHOW_BLOCK)
	table.ParallelIpairsAsync(var_131_0, function(arg_132_0, arg_132_1, arg_132_2)
		local var_132_0 = arg_132_1:GetConfigID()

		if not arg_131_0.slotDict[var_132_0] then
			return arg_132_2()
		end

		local var_132_1 = _.detect(var_131_1, function(arg_133_0)
			return arg_133_0:GetSlotID() == var_132_0
		end)
		local var_132_2 = var_132_1 and var_132_1:GetModel() or false
		local var_132_3 = arg_131_0.slotDict[var_132_0].model

		arg_131_0.slotDict[var_132_0].displayModelName = var_132_2
		arg_131_0.slotDict[var_132_0].furnitureId = var_132_1 and var_132_1:GetConfigID()

		local function var_132_4(arg_134_0)
			if var_132_3 then
				setActive(var_132_3, var_132_2 == "")
			end

			table.Foreach(arg_131_0.slotDict[var_132_0].sceneHides or {}, function(arg_135_0, arg_135_1)
				setActive(arg_135_1.trans, arg_135_1.visible)
			end)

			arg_131_0.slotDict[var_132_0].sceneHides = {}

			if arg_134_0 then
				local var_134_0 = arg_134_0:getConfig("scene_hides")

				if #var_134_0 > 0 then
					table.Ipairs(var_134_0, function(arg_136_0, arg_136_1)
						local var_136_0 = arg_131_0.modelRoot:Find(arg_136_1)

						assert(var_136_0, string.format("dorm3d_furniture_template:%d scene_hides missing scene item :%s", arg_134_0:GetConfigID(), arg_136_1))

						local var_136_1 = isActive(var_136_0)

						table.insert(arg_131_0.slotDict[var_132_0].sceneHides, {
							name = arg_136_1,
							trans = var_136_0,
							visible = var_136_1
						})
						setActive(var_136_0, false)
					end)
				end
			end
		end

		if var_132_2 == false or var_132_2 == "" then
			arg_131_0.loader:ClearRequest("slot_" .. var_132_0)
			var_132_4()
			arg_132_2()

			return
		end

		local var_132_5 = arg_131_0.slotDict[var_132_0].trans

		if arg_131_0.loader:GetLoadingRP("slot_" .. var_132_0) then
			arg_131_0:emit(var_0_0.HIDE_BLOCK)
		end

		arg_131_0.loader:GetPrefabBYStopLoading("dorm3d/furniture/prefabs/" .. var_132_2, "", function(arg_137_0)
			arg_132_2()
			assert(arg_137_0)
			setParent(arg_137_0, var_132_5)
			var_132_4(var_132_1)
		end, "slot_" .. var_132_0)
	end, function()
		arg_131_0:emit(var_0_0.HIDE_BLOCK)
		existCall(arg_131_2)
	end)
end

function var_0_0.CheckSceneItemActiveByPath(arg_139_0, arg_139_1)
	local var_139_0 = arg_139_0:GetSceneItem(arg_139_1)

	return arg_139_0:CheckSceneItemActive(var_139_0)
end

function var_0_0.CheckSceneItemActive(arg_140_0, arg_140_1)
	local var_140_0 = true
	local var_140_1

	table.Checkout(arg_140_0.slotDict, function(arg_141_0, arg_141_1)
		if underscore.detect(arg_141_1.sceneHides, function(arg_142_0)
			return arg_142_0.trans == arg_140_1
		end) then
			var_140_0 = false
			var_140_1 = arg_141_1.furnitureId

			return false
		end
	end)

	return var_140_0, var_140_1
end

function var_0_0.ChangeCharacterPosition(arg_143_0, arg_143_1)
	arg_143_0:ResetCharPoint(arg_143_1, arg_143_1.ladyActiveZone)
	arg_143_0:SyncInterestTransform(arg_143_1)
end

function var_0_0.SyncCurrentInterestTransform(arg_144_0)
	local var_144_0 = arg_144_0.ladyDict[arg_144_0.apartment:GetConfigID()]

	arg_144_0:SyncInterestTransform(var_144_0)
end

function var_0_0.SyncInterestTransform(arg_145_0, arg_145_1)
	arg_145_0.ladyInterest.position = arg_145_1.ladyInterestRoot.position
	arg_145_0.ladyInterest.rotation = arg_145_1.ladyInterestRoot.rotation
end

function var_0_0.SyncCurrentInterestSmooth(arg_146_0, arg_146_1)
	local var_146_0 = arg_146_0.ladyDict[arg_146_0.apartment:GetConfigID()]

	arg_146_1 = arg_146_1 or 0.5

	arg_146_0:managedTween(LeanTween.move, nil, arg_146_0.ladyInterest.gameObject, var_146_0.ladyInterestRoot.position, arg_146_1)
	arg_146_0:managedTween(LeanTween.rotate, nil, arg_146_0.ladyInterest.gameObject, var_146_0.ladyInterestRoot.rotation:ToEulerAngles(), arg_146_1)
end

function var_0_0.ChangePlayerPosition(arg_147_0, arg_147_1)
	arg_147_1 = arg_147_1 or arg_147_0.contextData.inFurnitureName

	local var_147_0 = arg_147_0.furnitures:Find(arg_147_1):Find("PlayerPoint").position

	arg_147_0.player.position = var_147_0
	arg_147_0.cameras[var_0_0.CAMERA.POV].transform.position = arg_147_0.playerEye.position

	local var_147_1 = arg_147_0.ladyInterest.position - arg_147_0.playerEye.position
	local var_147_2 = Quaternion.LookRotation(var_147_1).eulerAngles
	local var_147_3 = var_147_2.y
	local var_147_4 = var_147_2.x
	local var_147_5 = arg_147_0.compPovAim.m_HorizontalAxis

	var_147_5.Value = arg_147_0:GetNearestAngle(var_147_3, var_147_5.m_MinValue, var_147_5.m_MaxValue)
	arg_147_0.compPovAim.m_HorizontalAxis = var_147_5

	local var_147_6 = arg_147_0.compPovAim.m_VerticalAxis

	var_147_6.Value = var_147_4
	arg_147_0.compPovAim.m_VerticalAxis = var_147_6
end

function var_0_0.GetAttachedFurnitureName(arg_148_0)
	return arg_148_0.contextData.inFurnitureName
end

function var_0_0.GetFurnitureByName(arg_149_0, arg_149_1)
	return underscore.detect(arg_149_0.attachedPoints, function(arg_150_0)
		return arg_150_0.name == arg_149_1
	end)
end

function var_0_0.GetSlotByID(arg_151_0, arg_151_1)
	return arg_151_0.displaySlots[arg_151_1] and arg_151_0.displaySlots[arg_151_1].trans
end

function var_0_0.GetScreenPosition(arg_152_0, arg_152_1, arg_152_2)
	arg_152_2 = arg_152_2 or arg_152_0.raycastCamera

	local var_152_0 = arg_152_2:WorldToScreenPoint(arg_152_1)

	if var_152_0.z < 0 then
		var_152_0.x = var_152_0.x + (var_152_0.x < 0 and -1 or 1) * Screen.width
		var_152_0.y = var_152_0.y + (var_152_0.y < 0 and -1 or 1) * Screen.height
		var_152_0.z = -var_152_0.z
	end

	return var_152_0
end

function var_0_0.GetLocalPosition(arg_153_0, arg_153_1, arg_153_2)
	return LuaHelper.ScreenToLocal(arg_153_2, arg_153_1, pg.UIMgr.GetInstance().uiCameraComp)
end

function var_0_0.GetModelRoot(arg_154_0)
	return arg_154_0.modelRoot
end

function var_0_0.ShiftZone(arg_155_0, arg_155_1, arg_155_2)
	local var_155_0 = arg_155_0:GetFurnitureByName(arg_155_1)

	if not var_155_0 then
		errorMsg(arg_155_1 .. " Not Find")
		existCall(arg_155_2)

		return
	end

	seriesAsync({
		function(arg_156_0)
			arg_155_0:emit(var_0_0.SHOW_BLOCK)
			arg_155_0:ShowBlackScreen(true, arg_156_0)
		end,
		function(arg_157_0)
			if arg_155_0.shiftLady or arg_155_0.room:isPersonalRoom() then
				local var_157_0 = arg_155_0.shiftLady or arg_155_0.apartment:GetConfigID()

				arg_155_0.shiftLady = nil
				arg_155_0.contextData.ladyZone[var_157_0] = var_155_0.name

				local var_157_1 = arg_155_0.ladyDict[var_157_0]

				var_157_1.ladyBaseZone = arg_155_0.contextData.ladyZone[var_157_0]
				var_157_1.ladyActiveZone = arg_155_0.contextData.ladyZone[var_157_0]

				if arg_155_0:GetBlackboardValue(var_157_1, "inPending") then
					arg_155_0:SetOutPending(var_157_1)
					arg_155_0:SwitchAnim(var_157_1, var_0_0.ANIM.IDLE)
					onNextTick(function()
						arg_155_0:ChangeCharacterPosition(var_157_1)
						arg_157_0()
					end)
				else
					arg_155_0:ChangeCharacterPosition(var_157_1)
					arg_157_0()
				end
			else
				arg_157_0()
			end
		end,
		function(arg_159_0)
			arg_155_0.contextData.inFurnitureName = var_155_0.name

			if not arg_155_0.apartment then
				for iter_159_0, iter_159_1 in pairs(arg_155_0.ladyDict) do
					if iter_159_1.ladyBaseZone == arg_155_0.contextData.inFurnitureName then
						arg_155_0:SyncInterestTransform(iter_159_1)

						break
					end
				end
			end

			arg_155_0:ChangePlayerPosition()
			arg_155_0:TriggerLadyDistance()
			arg_155_0:CheckInSector()
			arg_159_0()
		end,
		function(arg_160_0)
			arg_155_0:UpdateZoneList()
			arg_155_0:ShowBlackScreen(false, arg_160_0)
		end,
		function(arg_161_0)
			arg_155_0:emit(var_0_0.HIDE_BLOCK)
			arg_161_0()
		end
	}, arg_155_2)
end

function var_0_0.ActiveCamera(arg_162_0, arg_162_1)
	local var_162_0 = isActive(arg_162_1)

	table.Foreach(arg_162_0.cameras, function(arg_163_0, arg_163_1)
		setActive(arg_163_1, arg_163_1 == arg_162_1)
	end)

	if var_162_0 then
		arg_162_0:OnCameraBlendFinished(arg_162_1)
	end
end

function var_0_0.ShowBlackScreen(arg_164_0, arg_164_1, arg_164_2)
	local var_164_0 = arg_164_0.blackSceneInfo or {
		color = "#000000",
		time = 0.3,
		delay = arg_164_1 and 0 or 0.3
	}

	setImageColor(arg_164_0.blackLayer, Color.NewHex(var_164_0.color))
	setActive(arg_164_0.blackLayer, true)
	setCanvasGroupAlpha(arg_164_0.blackLayer, arg_164_1 and 0 or 1)
	arg_164_0:managedTween(LeanTween.alphaCanvas, function()
		if not arg_164_1 then
			setActive(arg_164_0.blackLayer, false)
		end

		existCall(arg_164_2)
	end, GetComponent(arg_164_0.blackLayer, typeof(CanvasGroup)), arg_164_1 and 1 or 0, var_164_0.time):setDelay(var_164_0.delay)
end

function var_0_0.RegisterOrbits(arg_166_0, arg_166_1)
	arg_166_0 = arg_166_0.scene
	arg_166_0.orbits = {
		original = arg_166_1.m_Orbits
	}
	arg_166_0.orbits.current = _.range(3):map(function(arg_167_0)
		local var_167_0 = arg_166_0.orbits.original[arg_167_0 - 1]

		return Cinemachine.CinemachineFreeLook.Orbit.New(var_167_0.m_Height, var_167_0.m_Radius)
	end)
	arg_166_0.surroudCamera = arg_166_1
end

function var_0_0.SetCameraObrits(arg_168_0)
	arg_168_0 = arg_168_0.scene

	local var_168_0 = arg_168_0.surroudCamera

	if not var_168_0 then
		return
	end

	local var_168_1 = arg_168_0.orbits.original[1]

	for iter_168_0 = 0, #arg_168_0.orbits.current - 1 do
		local var_168_2 = arg_168_0.orbits.current[iter_168_0 + 1]
		local var_168_3 = arg_168_0.orbits.original[iter_168_0]

		var_168_2.m_Height = math.lerp(var_168_1.m_Height, var_168_3.m_Height, arg_168_0.pinchValue)
		var_168_2.m_Radius = var_168_3.m_Radius * arg_168_0.pinchValue
	end

	var_168_0.m_Orbits = arg_168_0.orbits.current
end

function var_0_0.RevertCameraOrbit(arg_169_0)
	arg_169_0 = arg_169_0.scene

	local var_169_0 = arg_169_0.surroudCamera

	if not var_169_0 then
		return
	end

	for iter_169_0 = 0, #arg_169_0.orbits.current - 1 do
		local var_169_1 = arg_169_0.orbits.current[iter_169_0 + 1]
		local var_169_2 = arg_169_0.orbits.original[iter_169_0]

		var_169_1.m_Height = var_169_2.m_Height
		var_169_1.m_Radius = var_169_2.m_Radius
	end

	var_169_0.m_Orbits = arg_169_0.orbits.current
	arg_169_0.surroudCamera = nil
end

function var_0_0.ActiveStateCamera(arg_170_0, arg_170_1, arg_170_2)
	local var_170_0 = {
		base = function(arg_171_0)
			arg_170_0:RegisterCameraBlendFinished(arg_170_0.cameras[var_0_0.CAMERA.POV], arg_171_0)
			arg_170_0:ActiveCamera(arg_170_0.cameras[var_0_0.CAMERA.POV])
		end,
		watch = function(arg_172_0)
			assert(arg_170_0.apartment)
			arg_170_0:SyncInterestTransform(arg_170_0.ladyDict[arg_170_0.apartment:GetConfigID()])
			arg_170_0:SetCameraLady(arg_170_0.ladyDict[arg_170_0.apartment:GetConfigID()])
			arg_170_0:RegisterCameraBlendFinished(arg_170_0.cameras[var_0_0.CAMERA.ROLE], arg_172_0)
			arg_170_0:ActiveCamera(arg_170_0.cameras[var_0_0.CAMERA.ROLE])
		end,
		walk = function(arg_173_0)
			arg_170_0:RegisterCameraBlendFinished(arg_170_0.cameras[var_0_0.CAMERA.POV], arg_173_0)
			arg_170_0:ActiveCamera(arg_170_0.cameras[var_0_0.CAMERA.POV])
		end,
		ik = function(arg_174_0)
			arg_174_0()
		end,
		gift = function(arg_175_0)
			assert(arg_170_0.apartment)
			arg_170_0:SetCameraLady(arg_170_0.ladyDict[arg_170_0.apartment:GetConfigID()])
			arg_170_0:RegisterCameraBlendFinished(arg_170_0.cameras[var_0_0.CAMERA.GIFT], arg_175_0)
			arg_170_0:ActiveCamera(arg_170_0.cameras[var_0_0.CAMERA.GIFT])
		end,
		standby = function(arg_176_0)
			assert(arg_170_0.apartment)
			arg_170_0:SetCameraLady(arg_170_0.ladyDict[arg_170_0.apartment:GetConfigID()])

			arg_170_0.cameras[var_0_0.CAMERA.ROLE2].transform.position = arg_170_0.cameraRole.transform.position

			arg_170_0:RegisterCameraBlendFinished(arg_170_0.cameras[var_0_0.CAMERA.ROLE2], arg_176_0)
			arg_170_0:ActiveCamera(arg_170_0.cameras[var_0_0.CAMERA.ROLE2])
		end,
		talk = function(arg_177_0)
			assert(arg_170_0.apartment)
			arg_170_0:SetCameraLady(arg_170_0.ladyDict[arg_170_0.apartment:GetConfigID()])
			arg_170_0:SyncInterestTransform(arg_170_0.ladyDict[arg_170_0.apartment:GetConfigID()])
			arg_170_0:RegisterCameraBlendFinished(arg_170_0.cameras[var_0_0.CAMERA.TALK], arg_177_0)
			arg_170_0:ActiveCamera(arg_170_0.cameras[var_0_0.CAMERA.TALK])
		end
	}
	local var_170_1 = {}

	table.insert(var_170_1, function(arg_178_0)
		switch(arg_170_1, var_170_0, arg_178_0, arg_178_0)
	end)
	seriesAsync(var_170_1, arg_170_2)
end

function var_0_0.GetSceneItem(arg_179_0, arg_179_1)
	local var_179_0

	if string.find(arg_179_1, "fbx/") == 1 then
		var_179_0 = arg_179_0.modelRoot:Find(arg_179_1)
	elseif string.find(arg_179_1, "FurnitureSlots/") == 1 then
		arg_179_1 = string.gsub(arg_179_1, "^FurnitureSlots/", "", 1)
		var_179_0 = arg_179_0.slotRoot:Find(arg_179_1)
	end

	if not var_179_0 then
		warning(string.format("Missing scene item path: %s", arg_179_1))
	end

	return var_179_0
end

function var_0_0.SetIKStatus(arg_180_0, arg_180_1, arg_180_2, arg_180_3)
	warning("Set IKStatus " .. (arg_180_2.id or "NIL"))

	arg_180_0.enableIKTip = true

	arg_180_0:ResetIKTipTimer()
	setActive(arg_180_1.ladyCollider, false)
	_.each(arg_180_1.ladyTouchColliders, function(arg_181_0)
		setActive(arg_181_0, true)
	end)

	arg_180_0.blockIK = nil
	arg_180_1.ikActionDict = {}
	arg_180_1.readyIKLayers = {}
	arg_180_1.iKTouchDatas = arg_180_2.touch_data or {}
	arg_180_1.IKSettings = {
		Colliders = arg_180_1.ladyColliders,
		CameraRaycaster = arg_180_0.sceneRaycaster
	}

	local var_180_0 = table.shallowCopy(arg_180_2.ik_id)
	local var_180_1 = {}

	_.each(arg_180_1.iKTouchDatas, function(arg_182_0)
		local var_182_0 = arg_182_0[3]

		if var_182_0[1] == 7 then
			local var_182_1 = pg.dorm3d_ik_touch_move[var_182_0[2]]
			local var_182_2 = var_182_1.target_ik

			if not _.detect(var_180_0, function(arg_183_0)
				return arg_183_0[1] == var_182_2
			end) then
				var_180_1[var_182_2] = {
					back_time = var_182_1.back_time
				}

				local var_182_3 = {
					var_182_2,
					0,
					{}
				}

				if var_182_1.trigger_dialogue > 0 then
					var_182_3[3] = {
						4,
						0,
						var_182_1.trigger_dialogue
					}
				end

				table.insert(var_180_0, var_182_3)
			end
		end
	end)

	local var_180_2 = _.map(var_180_0, function(arg_184_0)
		local var_184_0 = Dorm3dIK.New({
			configId = arg_184_0[1]
		})
		local var_184_1 = arg_184_0[3]
		local var_184_2 = var_184_1[1]
		local var_184_3 = switch(var_184_2, {
			function(arg_185_0, arg_185_1)
				return 0
			end,
			function()
				return 0
			end,
			function(arg_187_0, arg_187_1)
				return arg_187_0
			end,
			function(arg_188_0, arg_188_1)
				return arg_188_0
			end,
			function(arg_189_0, arg_189_1, arg_189_2, arg_189_3)
				return arg_189_0
			end,
			function(arg_190_0)
				return 0
			end
		}, function(arg_191_0)
			return type(arg_191_0) == "number" and arg_191_0 or 0
		end, unpack(var_184_1, 2))

		table.insert(arg_180_1.readyIKLayers, var_184_0)

		arg_180_1.ikActionDict[var_184_0:GetControllerPath()] = var_184_1

		local var_184_4 = var_184_0:GetRevertTime()
		local var_184_5 = var_180_1[var_184_0:GetConfigID()]
		local var_184_6 = tobool(var_184_5)

		if var_184_6 then
			var_184_3 = var_184_5.back_time
			var_184_4 = var_184_5.back_time
			var_184_0.ignoreDrag = true
		end

		local var_184_7 = var_184_0:GetSubTargets()
		local var_184_8 = var_184_0:GetPlaneRotations()
		local var_184_9 = var_184_0:GetPlaneScales()
		local var_184_10 = _.map(_.range(#var_184_7), function(arg_192_0)
			return {
				name = var_184_7[arg_192_0][1],
				planeRot = var_184_8[arg_192_0],
				planeScale = var_184_9[arg_192_0]
			}
		end)

		return Dorm3dIKController.New({
			triggerName = var_184_0:getConfig("trigger_param")[2],
			controllerName = var_184_0:GetControllerPath(),
			subTargets = var_184_10,
			actionType = var_184_0:GetActionTriggerParams()[1],
			controlRect = var_184_0:GetRect(),
			actionRect = var_184_0:GetTriggerRect(),
			backTime = var_184_4,
			actionRevertTime = var_184_3,
			ignoreDrag = var_184_6
		})
	end)

	pg.IKMgr.GetInstance():RegisterEnv(arg_180_1.ladyIKRoot, arg_180_1.ladyBoneMaps)
	arg_180_0:RegisterIKFunc()
	pg.IKMgr.GetInstance():SetIKStatus(var_180_2)

	local var_180_3 = _.map(arg_180_1.iKTouchDatas, function(arg_193_0)
		return arg_193_0[1]
	end)

	table.Foreach(var_180_3, function(arg_194_0, arg_194_1)
		local var_194_0 = pg.dorm3d_ik_touch[arg_194_1]

		if #var_194_0.scene_item == 0 then
			return
		end

		local var_194_1 = arg_180_0:GetSceneItem(var_194_0.scene_item)

		if not var_194_1 then
			warning(string.format("dorm3d_ik_touch:%d without scene_item:%s", arg_194_1, var_194_0.scene_item))

			return
		end

		if IsNil(GetComponent(var_194_1, typeof(UnityEngine.Collider))) then
			go(var_194_1):AddComponent(typeof(UnityEngine.BoxCollider))
		end

		local var_194_2 = GetOrAddComponent(var_194_1, typeof(EventTriggerListener))

		var_194_2.enabled = true

		var_194_2:AddPointClickFunc(function()
			arg_180_0.blockIK = true

			local var_195_0 = arg_180_1.iKTouchDatas[arg_194_0]
			local var_195_1, var_195_2, var_195_3 = unpack(var_195_0)

			arg_180_0:TouchModeAction(arg_180_1, var_195_1, unpack(var_195_3))(function()
				arg_180_0.enableIKTip = true

				arg_180_0:ResetIKTipTimer()

				arg_180_0.blockIK = nil
			end)
		end)
	end)

	arg_180_0.camBrain.enabled = false

	if arg_180_0.cameras[var_0_0.CAMERA.IK_WATCH] then
		setActive(arg_180_0.cameras[var_0_0.CAMERA.IK_WATCH], false)

		arg_180_0.cameras[var_0_0.CAMERA.IK_WATCH] = nil
	end

	local var_180_4 = arg_180_0.cameraRoot:Find(arg_180_2.ik_camera)

	assert(var_180_4, "Missing IKCamera")

	arg_180_0.cameras[var_0_0.CAMERA.IK_WATCH] = var_180_4

	arg_180_0:ActiveCamera(arg_180_0.cameras[var_0_0.CAMERA.IK_WATCH])

	arg_180_0.camBrain.enabled = true

	local var_180_5 = var_180_4:GetComponent(typeof(Cinemachine.CinemachineFreeLook))

	if var_180_5 then
		arg_180_0:RegisterOrbits(var_180_5)
	else
		arg_180_0:RevertCameraOrbit()
	end

	arg_180_0:SwitchAnim(arg_180_1, arg_180_2.character_action)
	arg_180_0:SettingHeadAimIK(arg_180_1, arg_180_2.head_track)
	arg_180_0:EnableCloth(arg_180_1, false)
	arg_180_0:EnableCloth(arg_180_1, arg_180_2.use_cloth, arg_180_2.cloth_colliders)
	;(function()
		local var_197_0 = arg_180_2.enter_scene_anim
		local var_197_1 = {}

		if var_197_0 and #var_197_0 > 0 then
			table.Ipairs(var_197_0, function(arg_198_0, arg_198_1)
				arg_180_0:PlaySceneItemAnim(arg_198_1[1], arg_198_1[2])
				table.insert(var_197_1, arg_198_1[1])
			end)
		end

		arg_180_0:ResetSceneItemAnimators(var_197_1)
	end)()
	;(function()
		local var_199_0 = arg_180_2.enter_extra_item
		local var_199_1 = {}

		if var_199_0 and #var_199_0 > 0 then
			table.Ipairs(var_199_0, function(arg_200_0, arg_200_1)
				local var_200_0 = arg_200_1[3] and Vector3.New(unpack(arg_200_1[3]))
				local var_200_1 = arg_200_1[4] and Quaternion.Euler(unpack(arg_200_1[4]))

				arg_180_0:LoadCharacterExtraItem(arg_180_1, arg_200_1[1], arg_200_1[2], var_200_0, var_200_1)
				table.insert(var_199_1, arg_200_1[1])
			end)
		end

		arg_180_0:ResetCharacterExtraItem(arg_180_1, var_199_1)
	end)()
	eachChild(arg_180_0.ikTextTipsRoot, function(arg_201_0)
		setActive(arg_201_0, false)
	end)
	_.each(arg_180_1.readyIKLayers, function(arg_202_0)
		local var_202_0 = arg_202_0:getConfig("tip_text")

		if not var_202_0 or #var_202_0 == 0 then
			return
		end

		local var_202_1 = arg_180_0.ikTextTipsRoot:Find(var_202_0)

		if not IsNil(var_202_1) then
			setActive(var_202_1, true)
		end
	end)
	onNextTick(function()
		local var_203_0 = arg_180_0.furnitures:Find(arg_180_2.character_position)

		arg_180_1.lady.position = var_203_0:Find("StayPoint").position
		arg_180_1.lady.rotation = var_203_0:Find("StayPoint").rotation

		existCall(arg_180_3)
	end)
end

function var_0_0.ExitIKStatus(arg_204_0, arg_204_1, arg_204_2, arg_204_3)
	arg_204_0.enableIKTip = false

	setActive(arg_204_1.ladyCollider, true)
	_.each(arg_204_1.ladyTouchColliders, function(arg_205_0)
		setActive(arg_205_0, false)
	end)

	arg_204_0.blockIK = nil

	pg.IKMgr.GetInstance():UnregisterEnv()
	setActive(arg_204_0.ikTipsRoot, false)
	setActive(arg_204_0.ikClickTipsRoot, false)

	local var_204_0 = _.map(arg_204_1.iKTouchDatas, function(arg_206_0)
		return arg_206_0[1]
	end)

	table.Foreach(var_204_0, function(arg_207_0, arg_207_1)
		local var_207_0 = pg.dorm3d_ik_touch[arg_207_1]

		if #var_207_0.scene_item == 0 then
			return
		end

		local var_207_1 = arg_204_0.modelRoot:Find(var_207_0.scene_item)

		if not var_207_1 then
			return
		end

		local var_207_2 = GetOrAddComponent(var_207_1, typeof(EventTriggerListener))

		var_207_2:ClearEvents()

		var_207_2.enabled = false
	end)

	arg_204_1.ikActionDict = nil
	arg_204_1.readyIKLayers = nil
	arg_204_1.iKTouchDatas = nil

	arg_204_0:RevertCameraOrbit()
	setActive(arg_204_0.cameras[var_0_0.CAMERA.IK_WATCH], false)

	arg_204_0.cameras[var_0_0.CAMERA.IK_WATCH] = nil

	arg_204_0:EnableCloth(arg_204_1, false)
	arg_204_0:ResetHeadAimIK(arg_204_1)
	arg_204_0:SwitchAnim(arg_204_1, arg_204_2.character_action)
	arg_204_0:ResetSceneItemAnimators()
	arg_204_0:ResetCharacterExtraItem(arg_204_1)
	onNextTick(function()
		if arg_204_2.character_position then
			arg_204_1.ladyActiveZone = arg_204_2.character_position
		else
			arg_204_1.ladyActiveZone = arg_204_1.ladyBaseZone
		end

		arg_204_0:ChangeCharacterPosition(arg_204_1)
		arg_204_0:TriggerLadyDistance()
		arg_204_0:CheckInSector()
		existCall(arg_204_3)
	end)
end

function var_0_0.SetIKTimelineStatus(arg_209_0, arg_209_1, arg_209_2, arg_209_3, arg_209_4, arg_209_5)
	warning("Set IKStatus " .. (arg_209_3 or "NIL"))

	arg_209_0.enableIKTip = true

	setActive(arg_209_0.ikControlUI, true)
	arg_209_0:ResetIKTipTimer()

	arg_209_0.blockIK = nil

	local var_209_0 = pg.dorm3d_ik_timeline_status[arg_209_3]

	arg_209_1.readyIKLayers = {}
	arg_209_1.iKTouchDatas = {}
	arg_209_1.IKSettings = {
		CameraRaycaster = GetOrAddComponent(arg_209_4, typeof(UnityEngine.EventSystems.PhysicsRaycaster))
	}

	assert(arg_209_1.IKSettings.CameraRaycaster)

	local var_209_1 = {}

	table.IpairsCArray(arg_209_2:GetComponentsInChildren(typeof(UnityEngine.Collider), true), function(arg_210_0, arg_210_1)
		if arg_210_1.name == "SafeCollider" then
			setActive(arg_210_1, false)

			return
		end

		if arg_210_1:GetType():Equals(typeof(UnityEngine.MeshCollider)) then
			return
		end

		child = tf(arg_210_1)

		local var_210_0 = child.name
		local var_210_1 = var_210_0 and string.find(var_210_0, "Collider") or -1

		if var_210_1 <= 0 then
			errorMsg("Wrong Name to lady Collider : " .. var_210_0)

			return
		end

		local var_210_2 = string.sub(var_210_0, 1, var_210_1 - 1)

		if var_210_2 == "Body" or var_210_2 == "Safe" then
			setActive(child, false)

			return
		end

		if var_0_0.BONE_TO_TOUCH[var_210_2] == nil then
			return
		end

		var_209_1[var_210_2] = child

		setActive(child, true)
	end)

	arg_209_1.IKSettings.Colliders = var_209_1

	local var_209_2 = GetOrAddComponent(arg_209_2, typeof(EventTriggerListener))

	arg_209_1.ikTimelineMode = true

	local var_209_3 = _.map(var_209_0.ik_id, function(arg_211_0)
		local var_211_0 = Dorm3dIK.New({
			configId = arg_211_0
		})

		table.insert(arg_209_1.readyIKLayers, var_211_0)

		local var_211_1 = var_211_0:GetSubTargets()
		local var_211_2 = var_211_0:GetPlaneRotations()
		local var_211_3 = var_211_0:GetPlaneScales()
		local var_211_4 = _.map(_.range(#var_211_1), function(arg_212_0)
			return {
				name = var_211_1[arg_212_0][1],
				planeRot = var_211_2[arg_212_0],
				planeScale = var_211_3[arg_212_0]
			}
		end)

		return Dorm3dIKController.New({
			ignoreDrag = false,
			triggerName = var_211_0:getConfig("trigger_param")[2],
			controllerName = var_211_0:GetControllerPath(),
			subTargets = var_211_4,
			actionType = var_211_0:GetActionTriggerParams()[1],
			controlRect = var_211_0:GetRect(),
			actionRect = var_211_0:GetTriggerRect(),
			backTime = var_211_0:GetRevertTime(),
			actionRevertTime = var_211_0:GetActionRevertTime(),
			timelineActionEvent = var_211_0:GetTimelineAction()
		})
	end)
	local var_209_4 = arg_209_2.transform:Find("IKLayers")
	local var_209_5 = {}
	local var_209_6 = {}

	table.Foreach(var_0_1, function(arg_213_0, arg_213_1)
		var_209_6[arg_213_1] = arg_213_0
	end)

	local var_209_7 = arg_209_2.transform:GetComponentsInChildren(typeof(Transform), true)

	table.IpairsCArray(var_209_7, function(arg_214_0, arg_214_1)
		if var_209_6[arg_214_1.name] then
			var_209_5[var_209_6[arg_214_1.name]] = arg_214_1
		end
	end)
	pg.IKMgr.GetInstance():RegisterEnv(var_209_4, var_209_5)
	arg_209_0:RegisterIKFunc()
	pg.IKMgr.GetInstance():SetIKStatus(var_209_3)
	eachChild(arg_209_0.ikTextTipsRoot, function(arg_215_0)
		setActive(arg_215_0, false)
	end)
	_.each(arg_209_1.readyIKLayers, function(arg_216_0)
		local var_216_0 = arg_216_0:getConfig("tip_text")

		if not var_216_0 or #var_216_0 == 0 then
			return
		end

		local var_216_1 = arg_209_0.ikTextTipsRoot:Find(var_216_0)

		if not IsNil(var_216_1) then
			setActive(var_216_1, true)
		end
	end)
	existCall(arg_209_5)
end

function var_0_0.ExitIKTimelineStatus(arg_217_0, arg_217_1, arg_217_2)
	arg_217_0.enableIKTip = false

	setActive(arg_217_0.ikControlUI, false)

	arg_217_0.blockIK = nil

	pg.IKMgr.GetInstance():UnregisterEnv()

	arg_217_1.readyIKLayers = nil
	arg_217_1.iKTouchDatas = nil
	arg_217_1.IKSettings = nil

	setActive(arg_217_0.ikTipsRoot, false)
	setActive(arg_217_0.ikClickTipsRoot, false)
	existCall(arg_217_2)
end

function var_0_0.EnableIKLayer(arg_218_0, arg_218_1)
	local var_218_0 = arg_218_0.ladyDict[arg_218_0.apartment:GetConfigID()]

	if #arg_218_1:GetHeadTrackPath() > 0 then
		arg_218_0:SettingHeadAimIK(var_218_0, {
			2,
			arg_218_1:GetHeadTrackPath()
		}, true)
	end

	local var_218_1 = arg_218_1:GetTriggerFaceAnim()

	if #var_218_1 > 0 then
		arg_218_0:PlayFaceAnim(var_218_0, var_218_1)
	end

	if not arg_218_1.ignoreDrag then
		setActive(arg_218_0:GetIKHandTF(), true)
		eachChild(arg_218_0:GetIKHandTF(), function(arg_219_0)
			setActive(arg_219_0, false)
		end)
		arg_218_0:StopIKHandTimer()
		setActive(arg_218_0:GetIKHandTF():Find("Begin"), true)

		arg_218_0.ikHandTimer = Timer.New(function()
			setActive(arg_218_0:GetIKHandTF():Find("Begin"), false)
			setActive(arg_218_0:GetIKHandTF():Find("Normal"), true)
		end, 0.5, 1)

		arg_218_0.ikHandTimer:Start()
	end

	if not var_218_0.ikTimelineMode then
		pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataTouch(arg_218_0.apartment.configId, arg_218_0.apartment.level, var_218_0.ikConfig.character_action, arg_218_1:GetTriggerParams()[2], arg_218_0.room:GetConfigID()))
	end
end

function var_0_0.DeactiveIKLayer(arg_221_0, arg_221_1)
	local var_221_0 = arg_221_0.ladyDict[arg_221_0.apartment:GetConfigID()]

	if not var_221_0.ikTimelineMode and #arg_221_1:GetHeadTrackPath() > 0 then
		arg_221_0:SettingHeadAimIK(var_221_0, var_221_0.ikConfig.head_track)
	end

	arg_221_0:StopIKHandTimer()

	if not arg_221_1.ignoreDrag then
		setActive(arg_221_0:GetIKHandTF():Find("Begin"), false)
		setActive(arg_221_0:GetIKHandTF():Find("Normal"), false)
		setActive(arg_221_0:GetIKHandTF():Find("End"), true)

		arg_221_0.ikHandTimer = Timer.New(function()
			setActive(arg_221_0:GetIKHandTF():Find("End"), false)
			setActive(arg_221_0:GetIKHandTF(), false)
		end, 0.5, 1)

		arg_221_0.ikHandTimer:Start()
	end
end

function var_0_0.StopIKHandTimer(arg_223_0)
	if not arg_223_0.ikHandTimer then
		return
	end

	arg_223_0.ikHandTimer:Stop()

	arg_223_0.ikHandTimer = nil
end

function var_0_0.PlayIKRevert(arg_224_0, arg_224_1, arg_224_2, arg_224_3)
	local var_224_0 = Time.time

	function arg_224_0.ikRevertHandler()
		local var_225_0 = Time.time - var_224_0

		_.each(arg_224_1.activeIKLayers, function(arg_226_0)
			local var_226_0 = 1

			if arg_224_2 > 0 then
				var_226_0 = var_225_0 / arg_224_2
			end

			local var_226_1 = arg_224_1.cacheIKInfos[arg_226_0].solvers
			local var_226_2 = arg_224_1.cacheIKInfos[arg_226_0].weights

			table.Foreach(var_226_1, function(arg_227_0, arg_227_1)
				arg_227_1.IKPositionWeight = math.lerp(var_226_2[arg_227_0], 0, var_226_0)
			end)
		end)

		if var_225_0 >= arg_224_2 then
			arg_224_0:ResetActiveIKs(arg_224_1)

			arg_224_0.ikRevertHandler = nil

			existCall(arg_224_3)
		end
	end

	arg_224_0.ikRevertHandler()
end

function var_0_0.ResetActiveIKs(arg_228_0, arg_228_1)
	table.insertto(arg_228_0.activeIKLayers, _.keys(arg_228_0.holdingStatus))
	table.clear(arg_228_0.holdingStatus)
	_.each(arg_228_1.activeIKLayers, function(arg_229_0)
		local var_229_0 = arg_229_0:GetControllerPath()
		local var_229_1 = arg_228_1.ladyIKRoot:Find(var_229_0):GetComponent(typeof(RootMotion.FinalIK.IKExecutionOrder))

		setActive(var_229_1, false)

		local var_229_2 = arg_228_1.cacheIKInfos[arg_229_0].solvers
		local var_229_3 = arg_228_1.cacheIKInfos[arg_229_0].weights

		table.Foreach(var_229_2, function(arg_230_0, arg_230_1)
			arg_230_1.IKPositionWeight = var_229_3[arg_230_0]
		end)
	end)
	table.clear(arg_228_1.activeIKLayers)
end

function var_0_0.ResetIKTipTimer(arg_231_0)
	if not arg_231_0.enableIKTip then
		return
	end

	arg_231_0.nextTipIKTime = Time.time + var_0_0.IK_TIP_WAIT_TIME
end

function var_0_0.EnableCurrentHeadIK(arg_232_0, arg_232_1)
	local var_232_0 = arg_232_0.ladyDict[arg_232_0.apartment:GetConfigID()]

	arg_232_0:EnableHeadIK(var_232_0, arg_232_1)
end

function var_0_0.EnableHeadIK(arg_233_0, arg_233_1, arg_233_2)
	arg_233_1.ladyHeadIKComp.enableIk = arg_233_2
end

function var_0_0.SettingHeadAimIK(arg_234_0, arg_234_1, arg_234_2, arg_234_3)
	local var_234_0

	if arg_234_2[1] == 1 then
		var_234_0 = arg_234_0.mainCameraTF:Find("AimTarget")
	elseif arg_234_2[1] == 2 then
		table.IpairsCArray(arg_234_1.lady:GetComponentsInChildren(typeof(Transform), true), function(arg_235_0, arg_235_1)
			if arg_235_1.name ~= arg_234_2[2] then
				return
			end

			var_234_0 = arg_235_1
		end)
	end

	arg_234_1.ladyHeadIKComp.AimTarget = var_234_0

	if not arg_234_3 and arg_234_2[3] then
		arg_234_1.ladyHeadIKComp.BodyWeight = arg_234_2[3]
	end

	if not arg_234_3 and arg_234_2[4] then
		arg_234_1.ladyHeadIKComp.HeadWeight = arg_234_2[4]
	end
end

function var_0_0.ResetHeadAimIK(arg_236_0, arg_236_1)
	arg_236_1.ladyHeadIKComp.AimTarget = arg_236_0.mainCameraTF:Find("AimTarget")
	arg_236_1.ladyHeadIKComp.HeadWeight = arg_236_1.ladyHeadIKData.HeadWeight
	arg_236_1.ladyHeadIKComp.BodyWeight = arg_236_1.ladyHeadIKData.BodyWeight
end

function var_0_0.HideCharacter(arg_237_0, arg_237_1)
	for iter_237_0, iter_237_1 in pairs(arg_237_0.ladyDict) do
		if iter_237_0 ~= arg_237_1 then
			arg_237_0:HideCharacterBylayer(iter_237_1)
		end
	end
end

function var_0_0.RevertCharacter(arg_238_0, arg_238_1)
	for iter_238_0, iter_238_1 in pairs(arg_238_0.ladyDict) do
		if iter_238_0 ~= arg_238_1 then
			arg_238_0:RevertCharacterBylayer(iter_238_1)
		end
	end
end

function var_0_0.HideCharacterBylayer(arg_239_0, arg_239_1)
	local var_239_0 = "Bip001"
	local var_239_1 = arg_239_1.lady:Find("all")

	for iter_239_0 = 0, var_239_1.childCount - 1 do
		local var_239_2 = var_239_1:GetChild(iter_239_0)

		if var_239_2.name ~= var_239_0 then
			pg.ViewUtils.SetLayer(var_239_2, Layer.Environment3D)
		end
	end

	if arg_239_1.tfPendintItem then
		pg.ViewUtils.SetLayer(arg_239_1.tfPendintItem, Layer.Environment3D)
	end

	if arg_239_1.ladyWatchFloat then
		pg.ViewUtils.SetLayer(arg_239_1.ladyWatchFloat, Layer.Environment3D)
	end

	GetComponent(arg_239_1.lady, "BLHXCharacterPropertiesController").enabled = false
end

function var_0_0.RevertCharacterBylayer(arg_240_0, arg_240_1)
	local var_240_0 = "Bip001"
	local var_240_1 = arg_240_1.lady:Find("all")

	for iter_240_0 = 0, var_240_1.childCount - 1 do
		local var_240_2 = var_240_1:GetChild(iter_240_0)

		if var_240_2.name ~= var_240_0 then
			pg.ViewUtils.SetLayer(var_240_2, Layer.Default)
		end
	end

	if arg_240_1.tfPendintItem then
		pg.ViewUtils.SetLayer(arg_240_1.tfPendintItem, Layer.Default)
	end

	if arg_240_1.ladyWatchFloat then
		pg.ViewUtils.SetLayer(arg_240_1.ladyWatchFloat, Layer.Default)
	end

	GetComponent(arg_240_1.lady, "BLHXCharacterPropertiesController").enabled = true
end

function var_0_0.EnterFurnitureWatchMode(arg_241_0)
	arg_241_0:SetAllBlackbloardValue("inLockLayer", true)
	arg_241_0:EnableJoystick(true)
	arg_241_0:HideCharacter()
end

function var_0_0.ExitFurnitureWatchMode(arg_242_0, arg_242_1)
	arg_242_0:HideFurnitureSlots()

	local var_242_0 = arg_242_0.cameras[var_0_0.CAMERA.POV]

	seriesAsync({
		function(arg_243_0)
			arg_242_0.furniturePOV = nil

			arg_242_0:EnableJoystick(false)
			arg_242_0:emit(var_0_0.SHOW_BLOCK)
			arg_242_0:ShowBlackScreen(true, arg_243_0)
		end,
		function(arg_244_0)
			existCall(arg_242_1)
			arg_242_0:RevertCharacter()
			arg_242_0:SetAllBlackbloardValue("inLockLayer", false)
			arg_242_0:RegisterCameraBlendFinished(var_242_0, arg_244_0)
			arg_242_0:ActiveCamera(var_242_0)
		end,
		function(arg_245_0)
			arg_242_0:ShowBlackScreen(false, arg_245_0)
		end
	}, function()
		arg_242_0:emit(var_0_0.HIDE_BLOCK)
	end)
	arg_242_0:RefreshSlots()
end

function var_0_0.SwitchFurnitureZone(arg_247_0, arg_247_1)
	local var_247_0 = arg_247_0:GetFurnitureByName(arg_247_1:GetWatchCameraName()):Find("FurnitureWatch Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))

	if arg_247_0.cameraFurnitureWatch and arg_247_0.cameraFurnitureWatch ~= var_247_0 then
		arg_247_0:UnRegisterCameraBlendFinished(arg_247_0.cameraFurnitureWatch)
		setActive(arg_247_0.cameraFurnitureWatch, false)
	end

	arg_247_0.cameraFurnitureWatch = var_247_0
	arg_247_0.cameras[var_0_0.CAMERA.FURNITURE_WATCH] = arg_247_0.cameraFurnitureWatch
	arg_247_0.furniturePOV = arg_247_0.cameraFurnitureWatch:GetCinemachineComponent(Cinemachine.CinemachineCore.Stage.Aim)

	arg_247_0:RegisterCameraBlendFinished(arg_247_0.cameraFurnitureWatch, function()
		arg_247_0:emit(var_0_0.HIDE_BLOCK)
	end)
	arg_247_0:emit(var_0_0.SHOW_BLOCK)
	arg_247_0:ActiveCamera(arg_247_0.cameraFurnitureWatch)
end

function var_0_0.HideFurnitureSlots(arg_249_0)
	if arg_249_0.displaySlots then
		arg_249_0:UpdateDisplaySlots({})
		table.Foreach(arg_249_0.displaySlots, function(arg_250_0, arg_250_1)
			local var_250_0 = arg_250_1.trans

			if IsNil(var_250_0:Find("Selector")) then
				return
			end

			setActive(var_250_0:Find("Selector"), false)
		end)

		arg_249_0.displaySlots = nil
	end
end

function var_0_0.DisplayFurnitureSlots(arg_251_0, arg_251_1)
	arg_251_0:HideFurnitureSlots()

	arg_251_0.displaySlots = {}

	_.each(arg_251_1, function(arg_252_0)
		arg_251_0.displaySlots[arg_252_0] = arg_251_0.slotDict[arg_252_0]

		if not arg_251_0.displaySlots[arg_252_0] then
			errorMsg("Slot " .. arg_252_0 .. " Not Binding Scene Object")

			return
		end

		local var_252_0 = arg_251_0.displaySlots[arg_252_0].trans

		if var_252_0:Find("Selector") then
			setActive(var_252_0:Find("Selector"), true)
		end
	end)
end

function var_0_0.UpdateDisplaySlots(arg_253_0, arg_253_1)
	table.Foreach(arg_253_0.displaySlots, function(arg_254_0, arg_254_1)
		local var_254_0 = arg_254_1.trans

		if not IsNil(var_254_0:Find("Selector")) then
			setActive(var_254_0:Find("Selector/Normal"), arg_253_1[arg_254_0] == 0)
			setActive(var_254_0:Find("Selector/Active"), arg_253_1[arg_254_0] == 1)
			setActive(var_254_0:Find("Selector/Ban"), arg_253_1[arg_254_0] == 2)
		end

		local var_254_1 = arg_253_0.slotDict[arg_254_0].model
		local var_254_2 = arg_253_0.slotDict[arg_254_0].displayModelName

		if var_254_2 and var_254_2 ~= "" then
			var_254_1 = var_254_0:GetChild(var_254_0.childCount - 1)
		end

		local function var_254_3(arg_255_0, arg_255_1)
			local var_255_0 = arg_255_0:GetComponentsInChildren(typeof(Renderer), true)

			table.IpairsCArray(var_255_0, function(arg_256_0, arg_256_1)
				local var_256_0 = arg_256_1.material

				if var_256_0 and var_256_0:HasProperty("_FinalTint") then
					var_256_0:SetColor("_FinalTint", arg_255_1)
				end
			end)
		end

		if var_254_1 then
			if arg_253_1[arg_254_0] == 1 then
				var_254_3(var_254_1, Color.NewHex("3F83AE73"))
			else
				var_254_3(var_254_1, Color.New(0, 0, 0, 0))
			end
		end
	end)
end

function var_0_0.EnterPhotoMode(arg_257_0, arg_257_1, arg_257_2)
	arg_257_0:SetAllBlackbloardValue("inLockLayer", true)
	arg_257_0:emit(var_0_0.ENABLE_SCENEBLOCK, true)
	seriesAsync({
		function(arg_258_0)
			arg_257_0:TempHideUI(true, arg_258_0)
		end,
		function(arg_259_0)
			arg_257_0:ShowBlackScreen(true, arg_259_0)
		end,
		function(arg_260_0)
			local var_260_0 = arg_257_0.apartment:GetConfigID()
			local var_260_1 = arg_257_0.ladyDict[var_260_0]

			arg_257_0:SwitchAnim(var_260_1, arg_257_2)
			var_260_1.ladyAnimator:Update(0)
			var_260_1:ResetCharPoint(var_260_1, arg_257_1:GetWatchCameraName())
			arg_257_0:SyncInterestTransform(var_260_1)
			setActive(var_260_1.ladySafeCollider, true)
			arg_257_0:HideCharacter(var_260_0)

			local var_260_2 = arg_257_0.cameras[var_0_0.CAMERA.PHOTO]
			local var_260_3 = var_260_2.m_XAxis

			var_260_3.Value = 180
			var_260_2.m_XAxis = var_260_3

			local var_260_4 = var_260_2.m_YAxis

			var_260_4.Value = 0.7
			var_260_2.m_YAxis = var_260_4
			arg_257_0.pinchValue = 1

			arg_257_0:RegisterOrbits(arg_257_0.cameras[var_0_0.CAMERA.PHOTO])
			arg_257_0:SetCameraObrits()
			arg_257_0:RegisterCameraBlendFinished(var_260_2, arg_260_0)
			arg_257_0:ActiveCamera(var_260_2)
		end,
		function(arg_261_0)
			arg_257_0:ShowBlackScreen(false, arg_261_0)
		end
	}, function()
		arg_257_0:EnableJoystick(true)
	end)
end

function var_0_0.ExitPhotoMode(arg_263_0)
	arg_263_0:emit(var_0_0.SHOW_BLOCK)
	arg_263_0:EnableJoystick(false)
	seriesAsync({
		function(arg_264_0)
			arg_263_0:ShowBlackScreen(true, arg_264_0)
		end,
		function(arg_265_0)
			arg_263_0:RevertCameraOrbit()

			local var_265_0 = arg_263_0.ladyDict[arg_263_0.apartment:GetConfigID()]

			arg_263_0:SwitchAnim(var_265_0, var_0_0.ANIM.IDLE)
			setActive(var_265_0.ladySafeCollider, false)
			onNextTick(function()
				arg_263_0:ChangeCharacterPosition(var_265_0)
			end)

			if arg_263_0.contextData.photoFreeMode then
				arg_263_0:EnablePOVLayer(false)
				setActive(arg_263_0.restrictedBox, false)

				arg_263_0.contextData.photoFreeMode = nil
			end

			local var_265_1 = arg_263_0.cameras[var_0_0.CAMERA.POV]

			arg_263_0:RegisterCameraBlendFinished(var_265_1, arg_265_0)
			arg_263_0:ActiveCamera(var_265_1)
		end,
		function(arg_267_0)
			arg_263_0:RevertCharacter(arg_263_0.apartment:GetConfigID())
			arg_263_0:ShowBlackScreen(false, arg_267_0)
		end
	}, function()
		arg_263_0:RefreshSlots()
		arg_263_0:SetAllBlackbloardValue("inLockLayer", false)
		arg_263_0:emit(var_0_0.HIDE_BLOCK)
		arg_263_0:emit(var_0_0.ENABLE_SCENEBLOCK, false)
		arg_263_0:TempHideUI(false)
	end)
end

function var_0_0.SwitchCameraZone(arg_269_0, arg_269_1, arg_269_2, arg_269_3)
	arg_269_0:emit(var_0_0.SHOW_BLOCK)
	seriesAsync({
		function(arg_270_0)
			arg_269_0:ShowBlackScreen(true, arg_270_0)
		end,
		function(arg_271_0)
			local var_271_0 = arg_269_0.ladyDict[arg_269_0.apartment:GetConfigID()]

			arg_269_0:SwitchAnim(var_271_0, arg_269_2)
			onNextTick(function()
				arg_269_0:ResetCharPoint(var_271_0, arg_269_1:GetWatchCameraName())
				arg_269_0:SyncInterestTransform(var_271_0)

				if arg_269_0.contextData.photoFreeMode then
					arg_269_0.camBrain.enabled = false

					arg_269_0:SwitchPhotoCamera()

					arg_269_0.camBrain.enabled = true

					onDelayTick(function()
						arg_269_0.camBrain.enabled = false

						arg_269_0:SwitchPhotoCamera()

						arg_269_0.camBrain.enabled = true
					end, 0.1)
				end

				arg_271_0()
			end)
		end,
		function(arg_274_0)
			arg_269_0:ShowBlackScreen(false, arg_274_0)
		end
	}, function()
		arg_269_0:emit(var_0_0.HIDE_BLOCK)
		existCall(arg_269_3)
	end)
end

function var_0_0.SwitchPhotoCamera(arg_276_0)
	if not arg_276_0.contextData.photoFreeMode then
		arg_276_0:EnableJoystick(false)
		arg_276_0:EnablePOVLayer(true)
		setActive(arg_276_0.restrictedBox, true)

		local var_276_0 = arg_276_0.cameras[var_0_0.CAMERA.PHOTO_FREE]

		var_276_0.transform.position = arg_276_0.mainCameraTF.position

		local var_276_1 = arg_276_0.cameras[var_0_0.CAMERA.PHOTO_FREE]:Find("PhotoFree Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera)):GetCinemachineComponent(Cinemachine.CinemachineCore.Stage.Aim)
		local var_276_2 = arg_276_0.mainCameraTF.rotation:ToEulerAngles()
		local var_276_3 = var_276_1.m_HorizontalAxis

		var_276_3.Value = var_276_2.y
		var_276_1.m_HorizontalAxis = var_276_3

		local var_276_4 = var_276_1.m_VerticalAxis

		var_276_4.Value = arg_276_0:GetNearestAngle(var_276_2.x, var_276_4.m_MinValue, var_276_4.m_MaxValue)
		var_276_1.m_VerticalAxis = var_276_4

		local var_276_5 = math.InverseLerp(arg_276_0.restrictedHeightRange[1], arg_276_0.restrictedHeightRange[2], var_276_0.position.y)

		arg_276_0:emit(Dorm3dPhotoMediator.CAMERA_LIFT_CHANGED, var_276_5)
		arg_276_0:ActiveCamera(arg_276_0.cameras[var_0_0.CAMERA.PHOTO_FREE])
	else
		arg_276_0:EnableJoystick(true)
		arg_276_0:EnablePOVLayer(false)
		setActive(arg_276_0.restrictedBox, false)
		arg_276_0:ActiveCamera(arg_276_0.cameras[var_0_0.CAMERA.PHOTO])
	end

	arg_276_0.contextData.photoFreeMode = not arg_276_0.contextData.photoFreeMode
end

function var_0_0.SetPhotoCameraHeight(arg_277_0, arg_277_1)
	local var_277_0 = math.lerp(arg_277_0.restrictedHeightRange[1], arg_277_0.restrictedHeightRange[2], arg_277_1)
	local var_277_1 = arg_277_0.cameras[var_0_0.CAMERA.PHOTO_FREE]

	var_277_1:GetComponent(typeof(UnityEngine.CharacterController)):Move(Vector3.New(0, var_277_0 - var_277_1.position.y, 0))
	onNextTick(function()
		local var_278_0 = math.InverseLerp(arg_277_0.restrictedHeightRange[1], arg_277_0.restrictedHeightRange[2], var_277_1.position.y)

		arg_277_0:emit(Dorm3dPhotoMediator.CAMERA_LIFT_CHANGED, var_278_0)
	end)
end

function var_0_0.ResetPhotoCameraPosition(arg_279_0)
	local var_279_0 = arg_279_0.cameras[var_0_0.CAMERA.PHOTO]
	local var_279_1 = var_279_0.m_XAxis

	var_279_1.Value = 180
	var_279_0.m_XAxis = var_279_1

	local var_279_2 = var_279_0.m_YAxis

	var_279_2.Value = 0.7
	var_279_0.m_YAxis = var_279_2
end

function var_0_0.ResetCurrentCharPoint(arg_280_0, arg_280_1)
	local var_280_0 = arg_280_0.ladyDict[arg_280_0.apartment:GetConfigID()]

	arg_280_0:ResetCharPoint(var_280_0, arg_280_1)
end

function var_0_0.ResetCharPoint(arg_281_0, arg_281_1, arg_281_2)
	local var_281_0 = arg_281_0.furnitures:Find(arg_281_2 .. "/StayPoint")

	arg_281_1.lady.position = var_281_0.position
	arg_281_1.lady.rotation = var_281_0.rotation
end

function var_0_0.GetNearestAngle(arg_282_0, arg_282_1, arg_282_2, arg_282_3)
	if arg_282_3 < arg_282_2 then
		arg_282_3 = arg_282_3 + 360
	end

	if arg_282_2 <= arg_282_1 and arg_282_1 <= arg_282_3 then
		return arg_282_1
	end

	local var_282_0 = (arg_282_2 + arg_282_3) / 2

	arg_282_1 = var_282_0 - Mathf.DeltaAngle(arg_282_1, var_282_0)
	arg_282_1 = math.clamp(arg_282_1, arg_282_2, arg_282_3)

	return arg_282_1
end

function var_0_0.PlayTimeline(arg_283_0, arg_283_1, arg_283_2)
	local var_283_0 = {}

	if arg_283_0.waitForTimeline then
		table.insert(var_283_0, function(arg_284_0)
			local var_284_0 = arg_283_0.waitForTimeline

			arg_283_0.waitForTimeline = nil

			var_284_0()
			arg_284_0()
		end)
	end

	table.insert(var_283_0, function(arg_285_0)
		arg_283_0:LoadTimelineScene(arg_283_1.name, false, nil, arg_285_0)
	end)

	if arg_283_1.scene and arg_283_1.sceneRoot then
		table.insert(var_283_0, function(arg_286_0)
			arg_283_0:ChangeArtScene(arg_283_1.scene .. "|" .. arg_283_1.sceneRoot, arg_286_0)
		end)
	end

	table.insert(var_283_0, function(arg_287_0)
		local var_287_0 = GameObject.Find("[actor]").transform
		local var_287_1 = var_287_0:GetComponentsInChildren(typeof(Animator), true)

		table.IpairsCArray(var_287_1, function(arg_288_0, arg_288_1)
			GetOrAddComponent(arg_288_1.transform, typeof(DftAniEvent))
		end)

		local var_287_2 = var_287_0:GetComponentInChildren(typeof("BLHXCharacterPropertiesController")).transform
		local var_287_3 = GameObject.Find("[camera]").transform:GetComponentInChildren(typeof(Camera)).transform
		local var_287_4 = GameObject.Find("[sequence]").transform

		arg_283_0.nowTimelinePlayer = TimelinePlayer.New(var_287_4)

		arg_283_0.nowTimelinePlayer:Register(arg_283_1.time, function(arg_289_0, arg_289_1, arg_289_2)
			switch(arg_289_1.stringParameter, {
				TimelinePause = function()
					arg_289_0:SetSpeed(0)
				end,
				TimelineResume = function()
					arg_289_0:SetSpeed(1)
				end,
				TimelinePlayOnTime = function()
					if arg_289_1.intParameter == 0 or arg_289_1.intParameter == arg_289_2.selectIndex then
						arg_289_0:SetTime(arg_289_1.floatParameter)
					end
				end,
				TimelineSelectStart = function()
					arg_289_2.selectIndex = nil

					if arg_283_1.options then
						local var_293_0 = arg_283_1.options[arg_289_1.intParameter]

						arg_283_0:DoTimelineOption(var_293_0, function(arg_294_0)
							arg_289_2.selectIndex = arg_294_0
							arg_289_2.optionIndex = var_293_0[arg_294_0].flag

							arg_289_0:Play()
						end)
					end
				end,
				TimelineTouchStart = function()
					arg_289_2.selectIndex = nil

					if arg_283_1.touchs then
						local var_295_0 = arg_283_1.touchs[arg_289_1.intParameter]

						arg_283_0:DoTimelineTouch(arg_283_1.touchs[arg_289_1.intParameter], function(arg_296_0)
							arg_289_2.selectIndex = arg_296_0
							arg_289_2.optionIndex = var_295_0[arg_296_0].flag
						end)
					end
				end,
				TimelineSelectLoop = function()
					if not arg_289_2.selectIndex then
						arg_289_0:RawSetTime(arg_289_1.floatParameter)
					end
				end,
				TimelineSelect = function()
					arg_289_2.selectIndex = arg_289_1.intParameter
				end,
				TimelineAccompanyJump = function()
					if arg_283_0.canTriggerAccompanyPerformance then
						arg_283_0.canTriggerAccompanyPerformance = false

						local var_299_0 = arg_283_1.accompanys[arg_289_1.intParameter]
						local var_299_1 = var_299_0[math.random(#var_299_0)]

						arg_289_0:SetTime(var_299_1)
					end
				end,
				TimelineIKStart = function()
					arg_289_2.selectIndex = nil

					local var_300_0 = arg_289_1.intParameter
					local var_300_1 = arg_283_0.ladyDict[arg_283_0.apartment:GetConfigID()]

					arg_283_0:SetIKTimelineStatus(var_300_1, var_287_2.gameObject, var_300_0, var_287_3)
				end,
				TimelineEnd = function()
					arg_289_2.finish = true

					arg_289_0:SetSpeed(0)
				end
			}, function()
				warning("other event trigger:" .. arg_289_1.stringParameter)
			end)

			if arg_289_2.finish then
				arg_283_0.timelineMark = arg_289_2
				arg_283_0.timelineFinishCall = nil

				local var_289_0 = arg_283_0.ladyDict[arg_283_0.apartment:GetConfigID()]

				if var_289_0.ikTimelineMode then
					arg_283_0:ExitIKTimelineStatus(var_289_0)
				end

				arg_287_0()
			end
		end)

		function arg_283_0.timelineFinishCall()
			arg_283_0.nowTimelinePlayer:TriggerEvent({
				stringParameter = "TimelineEnd"
			})
		end

		arg_283_0:HideCharacter()
		setActive(arg_283_0.mainCameraTF, false)
		eachChild(arg_283_0.rtTimelineScreen, function(arg_304_0)
			setActive(arg_304_0, false)
		end)
		setActive(arg_283_0.rtTimelineScreen, true)
		setActive(arg_283_0.rtTimelineScreen:Find("btn_skip"), arg_283_0.inReplayTalk)
		arg_283_0.nowTimelinePlayer:Start()
	end)
	table.insert(var_283_0, function(arg_305_0)
		arg_283_0:ShowBlackScreen(true, function()
			arg_283_0.nowTimelinePlayer:Stop()
			arg_283_0.nowTimelinePlayer:Dispose()

			arg_283_0.nowTimelinePlayer = nil

			arg_283_0:UnloadTimelineScene(arg_283_1.name, false, arg_305_0)
		end)
	end)

	local var_283_1 = arg_283_0.dormSceneMgr.artSceneInfo

	table.insert(var_283_0, function(arg_307_0)
		arg_283_0:ChangeArtScene(var_283_1, arg_307_0)
	end)
	seriesAsync(var_283_0, function()
		setActive(arg_283_0.rtTimelineScreen, false)
		arg_283_0:RevertCharacter()
		setActive(arg_283_0.mainCameraTF, true)

		local var_308_0 = arg_283_0.timelineMark

		arg_283_0.timelineMark = nil

		existCall(arg_283_2, var_308_0, function(arg_309_0)
			arg_283_0:ShowBlackScreen(false, arg_309_0)
		end)
	end)
end

function var_0_0.PlayCurrentSingleAction(arg_310_0, ...)
	local var_310_0 = arg_310_0.ladyDict[arg_310_0.apartment:GetConfigID()]

	return arg_310_0:PlaySingleAction(var_310_0, ...)
end

function var_0_0.PlaySingleAction(arg_311_0, arg_311_1, arg_311_2, arg_311_3)
	local var_311_0 = string.find(arg_311_2, "^Face_")

	if tobool(var_311_0) then
		arg_311_0:PlayFaceAnim(arg_311_1, arg_311_2, arg_311_3)

		return
	end

	if arg_311_1.ladyAnimator:GetCurrentAnimatorStateInfo(arg_311_1.ladyAnimBaseLayerIndex):IsName(arg_311_2) then
		return
	end

	existCall(arg_311_1.animExtraItemCallback)

	arg_311_1.animExtraItemCallback = nil
	arg_311_1.animNameMap = arg_311_1.animNameMap or {}
	arg_311_1.animNameMap[arg_311_1.ladyAnimator.StringToHash(arg_311_2)] = arg_311_2

	local var_311_1 = arg_311_0:GetBlackboardValue(arg_311_1, "groupId")
	local var_311_2 = _.detect(pg.dorm3d_anim_extraitem.get_id_list_by_ship_id[var_311_1] or {}, function(arg_312_0)
		return pg.dorm3d_anim_extraitem[arg_312_0].anim == arg_311_2
	end)
	local var_311_3 = var_311_2 and pg.dorm3d_anim_extraitem[var_311_2]
	local var_311_4

	seriesAsync({
		function(arg_313_0)
			if not var_311_3 or var_311_3.item_prefab == "" then
				arg_313_0()

				return
			end

			local var_313_0 = string.lower("dorm3d/furniture/item/" .. var_311_3.item_prefab)

			arg_311_0.loader:GetPrefab(var_313_0, "", function(arg_314_0)
				setParent(arg_314_0, arg_311_1.lady)

				if var_311_3.item_shield ~= "" then
					var_311_4 = {}

					for iter_314_0, iter_314_1 in ipairs(var_311_3.item_shield) do
						local var_314_0 = arg_311_0.modelRoot:Find(iter_314_1)

						if not var_314_0 then
							warning(string.format("dorm3d_anim_extraitem:%d without hide item:%s", var_311_3.id, iter_314_1))
						else
							var_311_4[iter_314_1] = isActive(var_314_0)

							setActive(var_314_0, false)
						end
					end
				end

				function arg_311_1.animExtraItemCallback()
					arg_311_0.loader:ClearRequest("AnimExtraItem")

					if var_311_4 then
						for iter_315_0, iter_315_1 in pairs(var_311_4) do
							setActive(arg_311_0.modelRoot:Find(iter_315_0), iter_315_1)
						end
					end
				end

				arg_313_0()
			end, "AnimExtraItem")
		end,
		function(arg_316_0)
			arg_311_1.nowState = arg_311_2
			arg_311_1.stateCallback = arg_316_0

			arg_311_1.ladyAnimator:CrossFadeInFixedTime(arg_311_2, 0.25, arg_311_1.ladyAnimBaseLayerIndex)
		end,
		function(arg_317_0)
			arg_311_1.nowState = nil
			arg_311_1.stateCallback = nil

			existCall(arg_311_1.animExtraItemCallback)

			arg_311_1.animExtraItemCallback = nil

			arg_317_0()
		end,
		arg_311_3
	})
end

function var_0_0.SwitchCurrentAnim(arg_318_0, ...)
	local var_318_0 = arg_318_0.ladyDict[arg_318_0.apartment:GetConfigID()]

	return arg_318_0:SwitchAnim(var_318_0, ...)
end

function var_0_0.SwitchAnim(arg_319_0, arg_319_1, arg_319_2, arg_319_3)
	local var_319_0 = string.find(arg_319_2, "^Face_")

	if tobool(var_319_0) then
		arg_319_0:PlayFaceAnim(arg_319_1, arg_319_2, arg_319_3)

		return
	end

	existCall(arg_319_1.animExtraItemCallback)

	arg_319_1.animExtraItemCallback = nil
	arg_319_1.animNameMap = arg_319_1.animNameMap or {}
	arg_319_1.animNameMap[arg_319_1.ladyAnimator.StringToHash(arg_319_2)] = arg_319_2

	local var_319_1 = {}

	table.insert(var_319_1, function(arg_320_0)
		arg_319_1.nowState = arg_319_2
		arg_319_1.stateCallback = arg_320_0

		arg_319_1.ladyAnimator:PlayInFixedTime(arg_319_2, arg_319_1.ladyAnimBaseLayerIndex)
	end)
	table.insert(var_319_1, function(arg_321_0)
		arg_319_1.nowState = nil
		arg_319_1.stateCallback = nil

		arg_321_0()
	end)
	seriesAsync(var_319_1, arg_319_3)
end

function var_0_0.PlayFaceAnim(arg_322_0, arg_322_1, arg_322_2, arg_322_3)
	arg_322_1.ladyAnimator:CrossFadeInFixedTime(arg_322_2, 0.2, arg_322_1.ladyAnimFaceLayerIndex)
	existCall(arg_322_3)
end

function var_0_0.GetCurrentAnim(arg_323_0)
	local var_323_0 = arg_323_0.ladyDict[arg_323_0.apartment:GetConfigID()]
	local var_323_1 = var_323_0.ladyAnimator:GetCurrentAnimatorStateInfo(var_323_0.ladyAnimBaseLayerIndex).shortNameHash

	return var_323_0.animNameMap[var_323_1]
end

function var_0_0.RegisterAnimCallback(arg_324_0, arg_324_1, arg_324_2)
	arg_324_0.ladyDict[arg_324_0.apartment:GetConfigID()].animCallbacks[arg_324_1] = arg_324_2
end

function var_0_0.SetCharacterAnimSpeed(arg_325_0, arg_325_1)
	local var_325_0 = arg_325_0.ladyDict[arg_325_0.apartment:GetConfigID()]

	var_325_0.ladyAnimator.speed = arg_325_1
	var_325_0.ladyHeadIKComp.blinkSpeed = var_325_0.ladyHeadIKData.blinkSpeed * arg_325_1

	if arg_325_1 > 0 then
		var_325_0.ladyHeadIKComp.DampTime = var_325_0.ladyHeadIKData.DampTime / arg_325_1
	else
		var_325_0.ladyHeadIKComp.DampTime = var_325_0.ladyHeadIKData.DampTime * math.huge
	end
end

function var_0_0.OnAnimationEvent(arg_326_0, arg_326_1)
	if arg_326_1.animatorClipInfo.weight < 0.5 then
		return
	end

	local var_326_0 = arg_326_1.stringParameter
	local var_326_1 = table.removebykey(arg_326_0.animEventCallbacks, var_326_0)

	existCall(var_326_1)
end

function var_0_0.RegisterAnimEventCallback(arg_327_0, arg_327_1, arg_327_2)
	arg_327_0.animEventCallbacks[arg_327_1] = arg_327_2
end

function var_0_0.PlaySceneItemAnim(arg_328_0, arg_328_1, arg_328_2)
	arg_328_0.sceneAnimatorDict = arg_328_0.sceneAnimatorDict or {}

	if not arg_328_0.sceneAnimatorDict[arg_328_1] then
		local var_328_0 = pg.dorm3d_scene_animator[arg_328_1]
		local var_328_1 = arg_328_0:GetSceneItem(var_328_0.item_name)

		assert(var_328_1, "Missing Scene Animator in pg.dorm3d_scene_animator: " .. arg_328_1 .. " " .. var_328_0.item_name)

		if not var_328_1 then
			return
		end

		local var_328_2 = var_328_1:GetComponent(typeof(Animator))

		if not var_328_2 then
			return
		end

		arg_328_0.sceneAnimatorDict[arg_328_1] = {
			trans = var_328_1,
			animator = var_328_2
		}
	end

	if arg_328_0.sceneAnimatorDict[arg_328_1].animator:GetCurrentAnimatorStateInfo(0):IsName(arg_328_2) then
		return
	end

	arg_328_0.sceneAnimatorDict[arg_328_1].animator:PlayInFixedTime(arg_328_2)
end

function var_0_0.ResetSceneItemAnimators(arg_329_0, arg_329_1)
	if not arg_329_0.sceneAnimatorDict then
		return
	end

	table.Foreach(arg_329_0.sceneAnimatorDict, function(arg_330_0, arg_330_1)
		if arg_329_1 and table.contains(arg_329_1, arg_330_0) then
			return
		end

		setActive(arg_330_1.trans, false)
		setActive(arg_330_1.trans, true)

		arg_329_0.sceneAnimatorDict[arg_330_0] = nil
	end)
end

function var_0_0.LoadCharacterExtraItem(arg_331_0, arg_331_1, arg_331_2, arg_331_3, arg_331_4, arg_331_5)
	arg_331_1.extraItems = arg_331_1.extraItems or {}

	if arg_331_1.extraItems[arg_331_2] then
		return
	end

	local var_331_0

	if arg_331_3 == "" then
		var_331_0 = arg_331_1.lady
	else
		table.IpairsCArray(arg_331_1.lady:GetComponentsInChildren(typeof(Transform), true), function(arg_332_0, arg_332_1)
			if arg_332_1.name == arg_331_3 then
				var_331_0 = arg_332_1
			end
		end)
	end

	if not var_331_0 then
		return
	end

	arg_331_0.loader:GetPrefab(string.lower("dorm3d/" .. arg_331_2), "", function(arg_333_0)
		setParent(arg_333_0, var_331_0)

		if arg_331_4 then
			setLocalPosition(arg_333_0, arg_331_4)
		end

		if arg_331_5 then
			setLocalRotation(arg_333_0, arg_331_5)
		end

		arg_331_1.extraItems[arg_331_2] = {
			trans = arg_333_0.transform,
			handler = var_331_0
		}
	end)
end

function var_0_0.ResetCharacterExtraItem(arg_334_0, arg_334_1, arg_334_2)
	if not arg_334_1.extraItems then
		return
	end

	table.Foreach(arg_334_1.extraItems, function(arg_335_0, arg_335_1)
		if arg_334_2 and table.contains(arg_334_2, arg_335_0) then
			return
		end

		arg_334_0.loader:ReturnPrefab(arg_335_1.trans.gameObject)

		arg_334_1.extraItems[arg_335_0] = nil
	end)
end

function var_0_0.RegisterCameraBlendFinished(arg_336_0, arg_336_1, arg_336_2)
	arg_336_0.cameraBlendCallbacks[arg_336_1] = arg_336_2
end

function var_0_0.UnRegisterCameraBlendFinished(arg_337_0, arg_337_1)
	arg_337_0.cameraBlendCallbacks[arg_337_1] = nil
end

function var_0_0.OnCameraBlendFinished(arg_338_0, arg_338_1)
	if not arg_338_1 then
		return
	end

	local var_338_0 = table.removebykey(arg_338_0.cameraBlendCallbacks, arg_338_1)

	existCall(var_338_0)
end

function var_0_0.PlayHeartFX(arg_339_0, arg_339_1)
	local var_339_0 = arg_339_0.ladyDict[arg_339_1]

	setActive(var_339_0.effectHeart, false)
	setActive(var_339_0.effectHeart, true)
	pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_joyful")
end

function var_0_0.PlayExpression(arg_340_0, arg_340_1)
	local var_340_0 = arg_340_1.name
	local var_340_1 = arg_340_0.expressionDict[var_340_0]
	local var_340_2 = 5

	if var_340_1 then
		local var_340_3 = var_340_1.timer

		var_340_3:Reset(nil, var_340_2)
		var_340_3:Start()

		if var_340_1.instance then
			setActive(var_340_1.instance, false)
			setActive(var_340_1.instance, true)
		end

		return
	end

	local var_340_4 = {
		name = var_340_0,
		timer = Timer.New(function()
			arg_340_0:RemoveExpression(var_340_0)
		end, var_340_2, 1, true)
	}

	arg_340_0.expressionDict[var_340_0] = var_340_4

	arg_340_0.loader:GetPrefab("dorm3D/effect/prefab/expression/" .. var_340_0, var_340_0, function(arg_342_0)
		var_340_4.instance = arg_342_0

		onNextTick(function()
			local var_343_0 = arg_340_0.ladyDict[arg_340_0.apartment:GetConfigID()]

			setParent(arg_342_0, var_343_0.ladyHeadCenter)
		end)
		setLocalPosition(arg_342_0, Vector3(0, 0, -0.2))
		setActive(arg_342_0, false)
		setActive(arg_342_0, true)
	end, var_340_4)
end

function var_0_0.RemoveExpression(arg_344_0, arg_344_1)
	local var_344_0 = arg_344_0.expressionDict[arg_344_1]

	if not var_344_0 then
		return
	end

	arg_344_0.loader:ClearRequest(var_344_0)

	if var_344_0.instance then
		arg_344_0.loader:ReturnPrefab(var_344_0.instance)
	end

	arg_344_0.expressionDict[arg_344_1] = nil
end

function var_0_0.ShowOrHideCanWatchMark(arg_345_0, arg_345_1, arg_345_2)
	arg_345_1.ladyWatchFloat = arg_345_1.ladyWatchFloat or cloneTplTo(arg_345_0.resTF:Find("vfx_talk_mark"), arg_345_1.ladyHeadCenter)

	setActive(arg_345_1.ladyWatchFloat, arg_345_2)
end

function var_0_0.RegisterGlobalVolume(arg_346_0)
	local var_346_0 = arg_346_0.globalVolume
	local var_346_1 = LuaHelper.GetOrAddVolumeComponent(var_346_0, typeof(BLHX.PostEffect.Overrides.DepthOfField))
	local var_346_2 = LuaHelper.GetOrAddVolumeComponent(var_346_0, typeof(BLHX.PostEffect.Overrides.ColorGrading))

	arg_346_0.originalCameraSettings = {
		depthOfField = {
			enabled = var_346_1.enabled.value,
			focusDistance = {
				length = 2,
				min = var_346_1.gaussianStart.min,
				value = var_346_1.gaussianStart.value
			},
			blurRadius = {
				min = var_346_1.blurRadius.min,
				max = var_346_1.blurRadius.max,
				value = var_346_1.blurRadius.value
			}
		},
		postExposure = {
			value = var_346_2.postExposure.value
		},
		contrast = {
			min = var_346_2.contrast.min,
			max = var_346_2.contrast.max,
			value = var_346_2.contrast.value
		},
		saturate = {
			min = var_346_2.saturation.min,
			max = var_346_2.saturation.max,
			value = var_346_2.saturation.value
		}
	}
	arg_346_0.originalCameraSettings.depthOfField.enabled = true

	local var_346_3 = var_346_0:GetComponent(typeof(BLHX.Volume.Volume))

	arg_346_0.originalVolume = {
		profile = var_346_3.sharedProfile,
		weight = var_346_3.weight
	}
end

function var_0_0.SettingCamera(arg_347_0, arg_347_1)
	arg_347_0.activeCameraSettings = arg_347_1

	local var_347_0 = arg_347_0.globalVolume
	local var_347_1 = LuaHelper.GetOrAddVolumeComponent(var_347_0, typeof(BLHX.PostEffect.Overrides.DepthOfField))
	local var_347_2 = LuaHelper.GetOrAddVolumeComponent(var_347_0, typeof(BLHX.PostEffect.Overrides.ColorGrading))

	var_347_1.enabled:Override(arg_347_1.depthOfField.enabled)
	var_347_1.gaussianStart:Override(arg_347_1.depthOfField.focusDistance.value)
	var_347_1.gaussianEnd:Override(arg_347_1.depthOfField.focusDistance.value + arg_347_1.depthOfField.focusDistance.length)
	var_347_1.blurRadius:Override(arg_347_1.depthOfField.blurRadius.value)
	var_347_2.postExposure:Override(arg_347_1.postExposure.value)
	var_347_2.contrast:Override(arg_347_1.contrast.value)
	var_347_2.saturation:Override(arg_347_1.saturate.value)
end

function var_0_0.GetCameraSettings(arg_348_0)
	return arg_348_0.originalCameraSettings
end

function var_0_0.RevertCameraSettings(arg_349_0)
	arg_349_0:SettingCamera(arg_349_0.originalCameraSettings)

	arg_349_0.activeCameraSettings = nil
end

function var_0_0.SetVolumeProfile(arg_350_0, arg_350_1, arg_350_2)
	local var_350_0 = arg_350_0.globalVolume:GetComponent(typeof(BLHX.Volume.Volume))

	arg_350_0.activeProfileWeight = arg_350_2

	if arg_350_0.activeProfileName ~= arg_350_1 then
		arg_350_0.activeProfileName = arg_350_1

		arg_350_0.loader:LoadReference("dorm3d/scenesres/res/common", arg_350_1, nil, function(arg_351_0)
			var_350_0.profile = arg_351_0
			var_350_0.weight = arg_350_0.activeProfileWeight

			if arg_350_0.activeCameraSettings then
				arg_350_0:SettingCamera(arg_350_0.activeCameraSettings)
			end
		end, "VolumeProfile")
	else
		var_350_0.weight = arg_350_0.activeProfileWeight
	end
end

function var_0_0.RevertVolumeProfile(arg_352_0)
	local var_352_0 = arg_352_0.globalVolume:GetComponent(typeof(BLHX.Volume.Volume))

	var_352_0.profile = arg_352_0.originalVolume.profile
	var_352_0.weight = arg_352_0.originalVolume.weight

	if arg_352_0.activeCameraSettings then
		arg_352_0:SettingCamera(arg_352_0.activeCameraSettings)
	end

	arg_352_0.activeProfileName = nil
end

function var_0_0.RecordCharacterLight(arg_353_0)
	local var_353_0 = BLHX.Rendering.PipelineInterface.GetCharacterLightColor()

	arg_353_0.originalCharacterColor = {
		color = var_353_0.color,
		intensity = var_353_0.intensity
	}
end

function var_0_0.SetCharacterLight(arg_354_0, arg_354_1, arg_354_2, arg_354_3)
	local var_354_0 = arg_354_0.characterLight:GetComponent(typeof(Light))
	local var_354_1 = Color.Lerp(arg_354_0.originalCharacterColor.color, arg_354_1, arg_354_3)
	local var_354_2 = math.lerp(arg_354_0.originalCharacterColor.intensity, arg_354_2, arg_354_3)

	BLHX.Rendering.PipelineInterface.SetCharacterLight(var_354_1, var_354_2)
end

function var_0_0.RevertCharacterLight(arg_355_0)
	arg_355_0:SetCharacterLight(arg_355_0.originalCharacterColor.color, arg_355_0.originalCharacterColor.intensity, 1)
end

function var_0_0.EnableCloth(arg_356_0, arg_356_1, arg_356_2, arg_356_3)
	arg_356_2 = arg_356_2 or {}

	table.Foreach(arg_356_1.clothComps, function(arg_357_0, arg_357_1)
		if arg_357_1 == nil then
			return
		end

		setActive(arg_357_1, arg_356_2[arg_357_0] == 1)
	end)
	table.Foreach(arg_356_1.clothColliderDict, function(arg_358_0, arg_358_1)
		if arg_358_1 == nil then
			return
		end

		setActive(arg_358_1, false)
	end)

	if arg_356_3 then
		table.Foreach(arg_356_3, function(arg_359_0, arg_359_1)
			local var_359_0 = arg_356_1.clothColliderDict[arg_359_1[1]]

			if var_359_0 == nil then
				return
			end

			setActive(var_359_0, arg_359_1[2] == 1)

			if arg_359_1[2] ~= 1 then
				return
			end

			var_0_0.SetMagicaCollider(var_359_0, arg_359_1[3], arg_359_1[4])
		end)
	end
end

function var_0_0.RevertClothComps(arg_360_0, arg_360_1)
	table.Foreach(arg_360_1.ladyClothCompSettings, function(arg_361_0, arg_361_1)
		arg_361_0.enabled = arg_361_1.enabled
	end)
	table.Foreach(arg_360_1.ladyClothColliderSettings, function(arg_362_0, arg_362_1)
		arg_362_0.enabled = arg_362_1.enabled

		var_0_0.SetMagicaCollider(arg_362_0, arg_362_1.StartRadius, arg_362_1.EndRadius)
	end)
end

function var_0_0.onBackPressed(arg_363_0)
	if arg_363_0.exited or arg_363_0.retainCount > 0 then
		-- block empty
	else
		arg_363_0:closeView()
	end
end

function var_0_0.LoadTimelineScene(arg_364_0, arg_364_1, arg_364_2, arg_364_3, arg_364_4)
	arg_364_0.dormSceneMgr:LoadTimelineScene({
		name = string.lower(arg_364_1),
		assetRootName = arg_364_0.apartment:getConfig("asset_name"),
		isCache = arg_364_2,
		waitForTimeline = arg_364_3,
		callName = arg_364_0.apartment:GetCallName(),
		loadSceneFunc = function(arg_365_0, arg_365_1)
			local var_365_0 = GameObject.Find("[actor]").transform

			arg_364_0:HXCharacter(tf(var_365_0))
		end
	}, arg_364_4)
end

function var_0_0.UnloadTimelineScene(arg_366_0, arg_366_1, arg_366_2, arg_366_3)
	arg_366_0.dormSceneMgr:UnloadTimelineScene(string.lower(arg_366_1), arg_366_2, arg_366_3)
end

function var_0_0.ChangeArtScene(arg_367_0, arg_367_1, arg_367_2)
	arg_367_1 = string.lower(arg_367_1)

	warning(arg_367_0.dormSceneMgr.artSceneInfo, "->", arg_367_1, arg_367_1 == arg_367_0.dormSceneMgr.sceneInfo)

	local var_367_0 = {}

	table.insert(var_367_0, function(arg_368_0)
		arg_367_0.dormSceneMgr:ChangeArtScene(string.lower(arg_367_1), arg_368_0)
	end)

	if arg_367_1 == arg_367_0.dormSceneMgr.sceneInfo or arg_367_0.dormSceneMgr.artSceneInfo == arg_367_0.dormSceneMgr.sceneInfo then
		table.insert(var_367_0, function(arg_369_0)
			setActive(arg_367_0.slotRoot, arg_367_1 == arg_367_0.dormSceneMgr.sceneInfo)
			arg_369_0()
		end)
	end

	if arg_367_1 == arg_367_0.dormSceneMgr.sceneInfo then
		table.insert(var_367_0, function(arg_370_0)
			arg_367_0:SwitchDayNight(arg_367_0.contextData.timeIndex)
			onNextTick(function()
				arg_367_0:RefreshSlots()
				arg_370_0()
			end)
		end)
	end

	seriesAsync(var_367_0, arg_367_2)
end

function var_0_0.ChangeSubScene(arg_372_0, arg_372_1, arg_372_2)
	arg_372_1 = string.lower(arg_372_1)

	warning(arg_372_0.dormSceneMgr.subSceneInfo, "->", arg_372_1, arg_372_1 == arg_372_0.dormSceneMgr.subSceneInfo)

	local var_372_0 = {}

	table.insert(var_372_0, function(arg_373_0)
		arg_372_0.dormSceneMgr:ChangeSubScene(arg_372_1, arg_373_0)
	end)

	local var_372_1 = arg_372_0.ladyDict[arg_372_0.apartment:GetConfigID()]

	table.insert(var_372_0, function(arg_374_0)
		if arg_372_1 == arg_372_0.dormSceneMgr.sceneInfo then
			var_372_1.ladyActiveZone = var_372_1.walkBornPoint or var_372_1.ladyBaseZone
		else
			var_372_1.ladyActiveZone = var_372_1.walkBornPoint or "Default"
		end

		arg_374_0()
	end)

	if arg_372_1 ~= arg_372_0.dormSceneMgr.subSceneInfo then
		table.insert(var_372_0, function(arg_375_0)
			local var_375_0, var_375_1 = Dorm3dSceneMgr.ParseInfo(arg_372_1)
			local var_375_2 = var_375_0 .. "_base"

			arg_372_0:ResetSceneStructure(SceneManager.GetSceneByName(var_375_2))

			if arg_372_1 == arg_372_0.dormSceneMgr.sceneInfo then
				arg_372_0:RefreshSlots()
			else
				arg_372_0:SwitchAnim(var_372_1, var_0_0.ANIM.IDLE)
			end

			if arg_372_0.dormSceneMgr.subSceneInfo == arg_372_0.dormSceneMgr.sceneInfo then
				local var_375_3 = Clone(arg_372_0.room)

				var_375_3.furnitures = {}

				arg_372_0:RefreshSlots(var_375_3)
			end

			arg_375_0()
		end)
	end

	table.insert(var_372_0, function(arg_376_0)
		onNextTick(function()
			arg_372_0:ChangeCharacterPosition(var_372_1)
			arg_372_0:ChangePlayerPosition(var_372_1.ladyActiveZone)
			arg_372_0:TriggerLadyDistance()
			arg_372_0:CheckInSector()
			arg_376_0()
		end)
	end)
	seriesAsync(var_372_0, arg_372_2)
end

function var_0_0.IsPointInSector(arg_378_0, arg_378_1)
	local var_378_0 = arg_378_1 - Vector3.New(unpack(arg_378_0.Position))

	if var_378_0.magnitude > arg_378_0.Radius then
		return false
	end

	local var_378_1 = Quaternion.Euler(unpack(arg_378_0.Rotation))

	return Vector3.Angle(var_378_1 * Vector3.forward, var_378_0) <= arg_378_0.Angle / 2
end

function var_0_0.willExit(arg_379_0)
	arg_379_0.joystickTimer:Stop()
	arg_379_0.moveStickTimer:Stop()
	UpdateBeat:RemoveListener(arg_379_0.updateHandler)
	arg_379_0:StopIKHandTimer()

	if arg_379_0.moveTimer then
		arg_379_0.moveTimer:Stop()

		arg_379_0.moveTimer = nil
	end

	if arg_379_0.moveWaitTimer then
		arg_379_0.moveWaitTimer:Stop()

		arg_379_0.moveWaitTimer = nil
	end

	GlobalClickEventMgr.Inst:RemoveBeginPinchFunc()
	GlobalClickEventMgr.Inst:RemovePinchFunc()
	GlobalClickEventMgr.Inst:RemoveEndPinchFunc()

	if not IsNil(arg_379_0.furnitures) then
		eachChild(arg_379_0.furnitures, function(arg_380_0)
			local var_380_0 = GetComponent(arg_380_0, typeof(EventTriggerListener))

			if not var_380_0 then
				return
			end

			var_380_0:ClearEvents()
		end)
	end

	pg.IKMgr.GetInstance():ResetActiveIKs()

	for iter_379_0, iter_379_1 in pairs(arg_379_0.ladyDict) do
		GetComponent(iter_379_1.lady, typeof(EventTriggerListener)):ClearEvents()
	end

	arg_379_0.camBrainEvenetHandler.OnBlendStarted = nil
	arg_379_0.camBrainEvenetHandler.OnBlendFinished = nil

	pg.UIMgr.GetInstance():UnOverlayPanel(arg_379_0.blockLayer, arg_379_0._tf)
	table.Foreach(arg_379_0.expressionDict, function(arg_381_0)
		arg_379_0:RemoveExpression(arg_381_0)
	end)
	arg_379_0.loader:Clear()
	pg.ClickEffectMgr:GetInstance():SetClickEffect("NORMAL")
	pg.NodeCanvasMgr.GetInstance():Clear()
	arg_379_0.dormSceneMgr:Dispose()

	arg_379_0.dormSceneMgr = nil

	ReflectionHelp.RefSetProperty(typeof("UnityEngine.LightmapSettings"), "lightmaps", nil, nil)
end

function var_0_0.InitDefautQuality()
	if PlayerPrefs.GetInt("dorm3d_graphics_settings", 0) == 0 then
		local var_382_0 = DevicePerformanceUtil.GetDevicePerformanceLevel()

		if PLATFORM == PLATFORM_IPHONEPLAYER then
			local var_382_1 = SystemInfo.deviceModel or ""

			local function var_382_2(arg_383_0)
				local var_383_0 = string.match(arg_383_0, "iPad(%d+)")
				local var_383_1 = tonumber(var_383_0)

				if var_383_1 and var_383_1 >= 8 then
					return true
				end

				return false
			end

			local function var_382_3(arg_384_0)
				local var_384_0 = string.match(arg_384_0, "iPhone(%d+)")
				local var_384_1 = tonumber(var_384_0)

				if var_384_1 and var_384_1 >= 13 then
					return true
				end

				return false
			end

			if var_382_2(var_382_1) or var_382_3(var_382_1) then
				var_382_0 = DevicePerformanceLevel.High
			end
		end

		local var_382_4 = var_382_0 == DevicePerformanceLevel.High and 3 or var_382_0 == DevicePerformanceLevel.Mid and 2 or 1

		PlayerPrefs.SetInt("dorm3d_graphics_settings", var_382_4)

		Dorm3dRoomTemplateScene.FirstDefaultSetting = var_382_4
	end
end

function var_0_0.SettingQuality()
	local var_385_0 = GraphicSettingConst.HandleCustomSetting()

	BLHX.Rendering.EngineCore.SetOverrideQualitySettings(var_385_0)
end

function var_0_0.SetMagicaCollider(arg_386_0, arg_386_1, arg_386_2)
	local var_386_0 = typeof("MagicaCloth.MagicaCapsuleCollider")

	ReflectionHelp.RefSetProperty(var_386_0, "StartRadius", arg_386_0, arg_386_1)
	ReflectionHelp.RefSetProperty(var_386_0, "EndRadius", arg_386_0, arg_386_2)
end

return var_0_0
