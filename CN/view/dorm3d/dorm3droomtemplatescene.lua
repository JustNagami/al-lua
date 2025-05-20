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
	tolua.loadassembly("MagicaClothV2")
	tolua.loadassembly("ParadoxNotion")
	tolua.loadassembly("Yongshi.BLRP.Runtime")

	for iter_10_0, iter_10_1 in pairs({
		_MonoManager = "ParadoxNotion.Services.MonoManager"
	}) do
		if not GameObject.Find(iter_10_0) then
			local var_10_0 = GameObject.New(iter_10_0)

			GetOrAddComponent(var_10_0, typeof(iter_10_1))
		end
	end

	arg_10_0.room = getProxy(ApartmentProxy):getRoom(arg_10_0.contextData.roomId)

	local var_10_1 = {}

	table.insert(var_10_1, function(arg_11_0)
		arg_10_0.dormSceneMgr = Dorm3dSceneMgr.New(arg_10_0.room:getConfig("scene_info"), arg_11_0)
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

	local var_39_5 = arg_39_0.cameras[var_0_0.CAMERA.PHOTO_FREE]:GetComponent(typeof(CharacterController)).radius

	arg_39_0.restrictedHeightRange = {
		arg_39_0.restrictedBox:Find("Floor").position.y + var_39_5,
		arg_39_0.restrictedBox:Find("Celling").position.y - var_39_5
	}
	arg_39_0.ladyInterest = GameObject.Find("InterestProxy").transform
	arg_39_0.daynightCtrlComp = GameObject.Find("[MainBlock]").transform:GetComponent("DayNightCtrl")

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
	local var_49_1 = arg_49_0.modelRoot:GetComponentsInChildren(typeof(Transform), true):ToTable()

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

		for iter_50_0, iter_50_1 in ipairs(var_49_1) do
			if iter_50_1.name == var_50_0 then
				var_50_5 = iter_50_1

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
	arg_52_0.transRangeDic = {
		list = {}
	}
	arg_52_0.transformFilter = arg_52_0.transformFilter or BLHX.Rendering.TransformFilter.New()

	for iter_52_0, iter_52_1 in pairs(arg_52_0.contactStateDic) do
		arg_52_0.hideContactStateDic[iter_52_0] = math.min(iter_52_1, ApartmentRoom.ITEM_UNLOCK)
		arg_52_0.contactInRangeDic[iter_52_0] = false

		local var_52_0 = pg.dorm3d_collection_template[iter_52_0].vfx_prefab

		arg_52_0.transRangeDic[iter_52_0] = {
			#arg_52_0.transRangeDic.list + 1,
			#var_52_0
		}

		table.insertto(arg_52_0.transRangeDic.list, underscore.map(var_52_0, function(arg_53_0)
			return arg_52_0.modelRoot:Find(arg_53_0)
		end))
	end

	arg_52_0.transformFilter:Init(arg_52_0.mainCameraTF, arg_52_0.transRangeDic.list, 2, 60)
	arg_52_0:ActiveContact()
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
				local var_60_9 = string.format("dorm3d/character/%s/prefabs/%s", var_60_3, var_60_8)

				if #var_60_8 > 0 and checkABExist(var_60_9) then
					table.insert(var_60_1.skinIdList, var_60_7)
					table.insert(var_60_0, function(arg_65_0)
						arg_60_0.loader:GetPrefab(var_60_9, "", function(arg_66_0)
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
			local var_60_10 = pg.dorm3d_welcome[arg_60_0.contextData.pendingDic[iter_60_1]]

			if var_60_10.item_prefab ~= "" then
				table.insert(var_60_0, function(arg_68_0)
					local var_68_0 = string.lower("dorm3d/furniture/item/" .. var_60_10.item_prefab)

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

	table.IpairsCArray(arg_74_1.lady:GetComponentsInChildren(typeof("MagicaCloth2.MagicaCloth"), true), function(arg_81_0, arg_81_1)
		table.insert(arg_74_1.clothComps, arg_81_1)

		arg_74_1.ladyClothCompSettings[arg_81_1] = {
			enabled = arg_81_1.enabled
		}
	end)

	arg_74_1.clothColliderDict = {}
	arg_74_1.ladyClothColliderSettings = {}

	local var_74_2 = typeof("MagicaCloth2.MagicaCapsuleCollider")

	table.IpairsCArray(arg_74_1.lady:GetComponentsInChildren(var_74_2, true), function(arg_82_0, arg_82_1)
		local var_82_0 = arg_82_1:GetSize()

		arg_74_1.clothColliderDict[arg_82_1.name] = arg_82_1
		arg_74_1.ladyClothColliderSettings[arg_82_1] = {
			enabled = arg_82_1.enabled,
			StartRadius = var_82_0.x,
			EndRadius = var_82_0.y
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

			arg_74_1:emit(var_0_0.ON_TOUCH_CHARACTER, var_84_0 or arg_84_1.rawPointerPress.name)
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
	arg_87_0.cameras[var_0_0.CAMERA.TALK].Follow = arg_87_1.ladyInterestRoot
	arg_87_0.cameras[var_0_0.CAMERA.TALK].LookAt = arg_87_1.ladyInterestRoot
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
		elseif arg_97_0.furniturePOV and arg_97_0.cameras[var_0_0.CAMERA.FURNITURE_WATCH] and isActive(arg_97_0.cameras[var_0_0.CAMERA.FURNITURE_WATCH]) then
			var_98_3(arg_97_0.furniturePOV, "m_HorizontalAxis", var_98_1)
			var_98_3(arg_97_0.furniturePOV, "m_VerticalAxis", var_98_2)
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

	local var_97_4
	local var_97_5
	local var_97_6 = arg_97_0.resumeCallback

	function arg_97_0.resumeCallback()
		var_97_5 = true

		if var_97_4 then
			existCall(var_97_6)
		end
	end

	arg_97_0:RefreshSlots(nil, function()
		var_97_4 = true

		if var_97_5 then
			existCall(var_97_6)
		end
	end)

	arg_97_0.updateHandler = UpdateBeat:CreateListener(function()
		xpcall(function()
			arg_97_0:Update()
		end, function(...)
			errorMsg(debug.traceback(...))
		end)
	end)

	UpdateBeat:AddListener(arg_97_0.updateHandler)
end

function var_0_0.InitData(arg_114_0)
	if not arg_114_0.contextData.ladyZone then
		arg_114_0.contextData.ladyZone = {}

		local var_114_0
		local var_114_1 = arg_114_0.room:getConfig("default_zone")

		for iter_114_0, iter_114_1 in ipairs(arg_114_0.contextData.groupIds) do
			for iter_114_2, iter_114_3 in ipairs(var_114_1) do
				if iter_114_3[1] == iter_114_1 then
					arg_114_0.contextData.ladyZone[iter_114_1] = iter_114_3[2]

					break
				end
			end

			assert(arg_114_0.contextData.ladyZone[iter_114_1])

			var_114_0 = var_114_0 or arg_114_0.contextData.ladyZone[iter_114_1]
		end

		arg_114_0.contextData.inFurnitureName = var_114_0 or var_114_1[1][2]
	end

	arg_114_0.zoneDatas = _.select(arg_114_0.room:GetZones(), function(arg_115_0)
		return not arg_115_0:IsGlobal()
	end)
	arg_114_0.activeSectors = {}
	arg_114_0.activeLady = {}
end

function var_0_0.Update(arg_116_0)
	arg_116_0.raycastCamera.fieldOfView = arg_116_0.mainCameraTF:GetComponent(typeof(Camera)).fieldOfView

	if arg_116_0.tweenFOV then
		local var_116_0 = Damp(1, 1, Time.deltaTime)

		arg_116_0.pinchValue = Mathf.Lerp(arg_116_0.pinchValue, 1, var_116_0)

		arg_116_0:SetPOVFOV(arg_116_0.POVOriginalFOV * arg_116_0.pinchValue)

		if arg_116_0.pinchValue > 0.99 then
			arg_116_0.tweenFOV = nil
		end
	end

	if isActive(arg_116_0.cameras[var_0_0.CAMERA.POV]) then
		arg_116_0:TriggerLadyDistance()
	end

	if arg_116_0.contactInRangeDic then
		local var_116_1 = arg_116_0.transformFilter:Execute():ToTable()

		for iter_116_0, iter_116_1 in pairs(arg_116_0.contactInRangeDic) do
			local var_116_2 = pg.dorm3d_collection_template[iter_116_0]
			local var_116_3 = arg_116_0.transRangeDic[iter_116_0]
			local var_116_4 = underscore(var_116_1):chain():slice(unpack(var_116_3)):any(function(arg_117_0)
				return arg_117_0
			end):value()

			if tobool(iter_116_1) ~= var_116_4 then
				arg_116_0.contactInRangeDic[iter_116_0] = var_116_4

				arg_116_0:UpdateContactDisplay(iter_116_0, var_116_4 and not arg_116_0.hideConcatFlag and arg_116_0.contactStateDic[iter_116_0] or arg_116_0.hideContactStateDic[iter_116_0])
			end
		end
	end

	if arg_116_0.enableFloatUpdate then
		arg_116_0.ladyDict[arg_116_0.apartment:GetConfigID()]:UpdateFloatPosition()
	end

	arg_116_0:CheckInSector()

	if arg_116_0.apartment then
		(function(arg_118_0)
			(function()
				if not arg_118_0.ikHandler then
					return
				end

				local var_119_0 = arg_118_0.ikHandler.screenPosition
				local var_119_1 = pg.UIMgr.GetInstance().uiCamera:Find("Canvas").rect
				local var_119_2 = var_119_0 - Vector2.New(var_119_1.width, var_119_1.height) * 0.5

				setAnchoredPosition(arg_116_0:GetIKHandTF(), var_119_2)

				if Time.time > arg_116_0.ikNextCheckStamp then
					arg_116_0.ikNextCheckStamp = arg_116_0.ikNextCheckStamp + var_0_0.IK_STATUS_DELTA

					local var_119_3 = _.detect(arg_118_0.readyIKLayers, function(arg_120_0)
						return arg_120_0:GetControllerPath() == arg_118_0.ikHandler.ikData:GetControllerPath()
					end)

					arg_116_0:emit(var_0_0.ON_IK_STATUS_CHANGED, var_119_3:GetConfigID(), var_0_0.IK_STATUS.DRAG)
				end
			end)()

			if arg_116_0.enableIKTip then
				local var_118_0 = not arg_116_0.blockIK and Time.time > arg_116_0.nextTipIKTime

				if var_118_0 then
					local var_118_1 = _.filter(arg_118_0.readyIKLayers, function(arg_121_0)
						return not arg_121_0.ignoreDrag
					end)

					UIItemList.StaticAlign(arg_116_0.ikTipsRoot, arg_116_0.ikTipsRoot:GetChild(0), #var_118_1, function(arg_122_0, arg_122_1, arg_122_2)
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

							local var_122_9 = arg_116_0:GetLocalPosition(arg_116_0:GetScreenPosition(var_122_7, arg_118_0.IKSettings.CameraRaycaster.eventCamera), arg_116_0.ikTipsRoot) + var_122_5

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
					UIItemList.StaticAlign(arg_116_0.ikClickTipsRoot, arg_116_0.ikClickTipsRoot:GetChild(0), #arg_118_0.iKTouchDatas, function(arg_124_0, arg_124_1, arg_124_2)
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
							var_124_0 = arg_116_0:GetSceneItem(var_124_4.scene_item)
						else
							var_124_0 = arg_118_0.IKSettings.Colliders[var_124_4.body]
						end

						if var_124_0 then
							local var_124_5 = var_124_0.position
							local var_124_6 = var_124_0:GetComponent(typeof(UnityEngine.Collider))

							if var_124_6 then
								var_124_5 = var_124_6.bounds.center
							end

							setLocalPosition(arg_124_2, arg_116_0:GetLocalPosition(arg_116_0:GetScreenPosition(var_124_5, arg_118_0.IKSettings.CameraRaycaster.eventCamera), arg_116_0.ikClickTipsRoot) + var_124_1)
						end

						setActive(arg_124_2, var_124_0)
					end)
				end

				setActive(arg_116_0.ikTipsRoot, var_118_0)
				setActive(arg_116_0.ikClickTipsRoot, var_118_0)
				setActive(arg_116_0.ikTextTipsRoot, var_118_0)
			end
		end)(arg_116_0.ladyDict[arg_116_0.apartment:GetConfigID()])
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

function var_0_0.ChangePlayerPosition(arg_146_0, arg_146_1)
	arg_146_1 = arg_146_1 or arg_146_0.contextData.inFurnitureName

	local var_146_0 = arg_146_0.furnitures:Find(arg_146_1):Find("PlayerPoint").position

	arg_146_0.player.position = var_146_0
	arg_146_0.cameras[var_0_0.CAMERA.POV].transform.position = arg_146_0.playerEye.position

	local var_146_1 = arg_146_0.ladyInterest.position - arg_146_0.playerEye.position
	local var_146_2 = Quaternion.LookRotation(var_146_1).eulerAngles
	local var_146_3 = var_146_2.y
	local var_146_4 = var_146_2.x
	local var_146_5 = arg_146_0.compPovAim.m_HorizontalAxis

	var_146_5.Value = arg_146_0:GetNearestAngle(var_146_3, var_146_5.m_MinValue, var_146_5.m_MaxValue)
	arg_146_0.compPovAim.m_HorizontalAxis = var_146_5

	local var_146_6 = arg_146_0.compPovAim.m_VerticalAxis

	var_146_6.Value = var_146_4
	arg_146_0.compPovAim.m_VerticalAxis = var_146_6
end

function var_0_0.GetAttachedFurnitureName(arg_147_0)
	return arg_147_0.contextData.inFurnitureName
end

function var_0_0.GetFurnitureByName(arg_148_0, arg_148_1)
	return underscore.detect(arg_148_0.attachedPoints, function(arg_149_0)
		return arg_149_0.name == arg_148_1
	end)
end

function var_0_0.GetSlotByID(arg_150_0, arg_150_1)
	return arg_150_0.displaySlots[arg_150_1] and arg_150_0.displaySlots[arg_150_1].trans
end

function var_0_0.GetScreenPosition(arg_151_0, arg_151_1, arg_151_2)
	arg_151_2 = arg_151_2 or arg_151_0.raycastCamera

	local var_151_0 = arg_151_2:WorldToScreenPoint(arg_151_1)

	if var_151_0.z < 0 then
		var_151_0.x = var_151_0.x + (var_151_0.x < 0 and -1 or 1) * Screen.width
		var_151_0.y = var_151_0.y + (var_151_0.y < 0 and -1 or 1) * Screen.height
		var_151_0.z = -var_151_0.z
	end

	return var_151_0
end

function var_0_0.GetLocalPosition(arg_152_0, arg_152_1, arg_152_2)
	return LuaHelper.ScreenToLocal(arg_152_2, arg_152_1, pg.UIMgr.GetInstance().uiCameraComp)
end

function var_0_0.GetModelRoot(arg_153_0)
	return arg_153_0.modelRoot
end

function var_0_0.ShiftZone(arg_154_0, arg_154_1, arg_154_2)
	local var_154_0 = arg_154_0:GetFurnitureByName(arg_154_1)

	if not var_154_0 then
		errorMsg(arg_154_1 .. " Not Find")
		existCall(arg_154_2)

		return
	end

	seriesAsync({
		function(arg_155_0)
			arg_154_0:emit(var_0_0.SHOW_BLOCK)
			arg_154_0:ShowBlackScreen(true, arg_155_0)
		end,
		function(arg_156_0)
			if arg_154_0.shiftLady or arg_154_0.room:isPersonalRoom() then
				local var_156_0 = arg_154_0.shiftLady or arg_154_0.apartment:GetConfigID()

				arg_154_0.shiftLady = nil
				arg_154_0.contextData.ladyZone[var_156_0] = var_154_0.name

				local var_156_1 = arg_154_0.ladyDict[var_156_0]

				var_156_1.ladyBaseZone = arg_154_0.contextData.ladyZone[var_156_0]
				var_156_1.ladyActiveZone = arg_154_0.contextData.ladyZone[var_156_0]

				if arg_154_0:GetBlackboardValue(var_156_1, "inPending") then
					arg_154_0:SetOutPending(var_156_1)
					arg_154_0:SwitchAnim(var_156_1, var_0_0.ANIM.IDLE)
					onNextTick(function()
						arg_154_0:ChangeCharacterPosition(var_156_1)
						arg_156_0()
					end)
				else
					arg_154_0:ChangeCharacterPosition(var_156_1)
					arg_156_0()
				end
			else
				arg_156_0()
			end
		end,
		function(arg_158_0)
			arg_154_0.contextData.inFurnitureName = var_154_0.name

			if not arg_154_0.apartment then
				for iter_158_0, iter_158_1 in pairs(arg_154_0.ladyDict) do
					if iter_158_1.ladyBaseZone == arg_154_0.contextData.inFurnitureName then
						arg_154_0:SyncInterestTransform(iter_158_1)

						break
					end
				end
			end

			arg_154_0:ChangePlayerPosition()
			arg_154_0:TriggerLadyDistance()
			arg_154_0:CheckInSector()
			arg_158_0()
		end,
		function(arg_159_0)
			arg_154_0:UpdateZoneList()
			arg_154_0:ShowBlackScreen(false, arg_159_0)
		end,
		function(arg_160_0)
			arg_154_0:emit(var_0_0.HIDE_BLOCK)
			arg_160_0()
		end
	}, arg_154_2)
end

function var_0_0.ActiveCamera(arg_161_0, arg_161_1)
	local var_161_0 = isActive(arg_161_1)

	table.Foreach(arg_161_0.cameras, function(arg_162_0, arg_162_1)
		setActive(arg_162_1, arg_162_1 == arg_161_1)
	end)

	if var_161_0 then
		arg_161_0:OnCameraBlendFinished(arg_161_1)
	end
end

function var_0_0.ShowBlackScreen(arg_163_0, arg_163_1, arg_163_2)
	local var_163_0 = arg_163_0.blackSceneInfo or {
		color = "#000000",
		time = 0.3,
		delay = arg_163_1 and 0 or 0.3
	}

	setImageColor(arg_163_0.blackLayer, Color.NewHex(var_163_0.color))
	setActive(arg_163_0.blackLayer, true)
	setCanvasGroupAlpha(arg_163_0.blackLayer, arg_163_1 and 0 or 1)
	arg_163_0:managedTween(LeanTween.alphaCanvas, function()
		if not arg_163_1 then
			setActive(arg_163_0.blackLayer, false)
		end

		existCall(arg_163_2)
	end, GetComponent(arg_163_0.blackLayer, typeof(CanvasGroup)), arg_163_1 and 1 or 0, var_163_0.time):setDelay(var_163_0.delay)
end

function var_0_0.RegisterOrbits(arg_165_0, arg_165_1)
	arg_165_0 = arg_165_0.scene
	arg_165_0.orbits = {
		original = arg_165_1.m_Orbits
	}
	arg_165_0.orbits.current = _.range(3):map(function(arg_166_0)
		local var_166_0 = arg_165_0.orbits.original[arg_166_0 - 1]

		return Cinemachine.CinemachineFreeLook.Orbit.New(var_166_0.m_Height, var_166_0.m_Radius)
	end)
	arg_165_0.surroudCamera = arg_165_1
end

function var_0_0.SetCameraObrits(arg_167_0)
	arg_167_0 = arg_167_0.scene

	local var_167_0 = arg_167_0.surroudCamera

	if not var_167_0 then
		return
	end

	local var_167_1 = arg_167_0.orbits.original[1]

	for iter_167_0 = 0, #arg_167_0.orbits.current - 1 do
		local var_167_2 = arg_167_0.orbits.current[iter_167_0 + 1]
		local var_167_3 = arg_167_0.orbits.original[iter_167_0]

		var_167_2.m_Height = math.lerp(var_167_1.m_Height, var_167_3.m_Height, arg_167_0.pinchValue)
		var_167_2.m_Radius = var_167_3.m_Radius * arg_167_0.pinchValue
	end

	var_167_0.m_Orbits = arg_167_0.orbits.current
end

function var_0_0.RevertCameraOrbit(arg_168_0)
	arg_168_0 = arg_168_0.scene

	local var_168_0 = arg_168_0.surroudCamera

	if not var_168_0 then
		return
	end

	for iter_168_0 = 0, #arg_168_0.orbits.current - 1 do
		local var_168_1 = arg_168_0.orbits.current[iter_168_0 + 1]
		local var_168_2 = arg_168_0.orbits.original[iter_168_0]

		var_168_1.m_Height = var_168_2.m_Height
		var_168_1.m_Radius = var_168_2.m_Radius
	end

	var_168_0.m_Orbits = arg_168_0.orbits.current
	arg_168_0.surroudCamera = nil
end

function var_0_0.ActiveStateCamera(arg_169_0, arg_169_1, arg_169_2)
	local var_169_0 = {
		base = function(arg_170_0)
			arg_169_0:RegisterCameraBlendFinished(arg_169_0.cameras[var_0_0.CAMERA.POV], arg_170_0)
			arg_169_0:ActiveCamera(arg_169_0.cameras[var_0_0.CAMERA.POV])
		end,
		watch = function(arg_171_0)
			assert(arg_169_0.apartment)
			arg_169_0:SyncInterestTransform(arg_169_0.ladyDict[arg_169_0.apartment:GetConfigID()])
			arg_169_0:SetCameraLady(arg_169_0.ladyDict[arg_169_0.apartment:GetConfigID()])
			arg_169_0:RegisterCameraBlendFinished(arg_169_0.cameras[var_0_0.CAMERA.ROLE], arg_171_0)
			arg_169_0:ActiveCamera(arg_169_0.cameras[var_0_0.CAMERA.ROLE])
		end,
		walk = function(arg_172_0)
			arg_169_0:RegisterCameraBlendFinished(arg_169_0.cameras[var_0_0.CAMERA.POV], arg_172_0)
			arg_169_0:ActiveCamera(arg_169_0.cameras[var_0_0.CAMERA.POV])
		end,
		ik = function(arg_173_0)
			arg_173_0()
		end,
		gift = function(arg_174_0)
			assert(arg_169_0.apartment)
			arg_169_0:SetCameraLady(arg_169_0.ladyDict[arg_169_0.apartment:GetConfigID()])
			arg_169_0:RegisterCameraBlendFinished(arg_169_0.cameras[var_0_0.CAMERA.GIFT], arg_174_0)
			arg_169_0:ActiveCamera(arg_169_0.cameras[var_0_0.CAMERA.GIFT])
		end,
		standby = function(arg_175_0)
			assert(arg_169_0.apartment)
			arg_169_0:SetCameraLady(arg_169_0.ladyDict[arg_169_0.apartment:GetConfigID()])

			arg_169_0.cameras[var_0_0.CAMERA.ROLE2].transform.position = arg_169_0.cameraRole.transform.position

			arg_169_0:RegisterCameraBlendFinished(arg_169_0.cameras[var_0_0.CAMERA.ROLE2], arg_175_0)
			arg_169_0:ActiveCamera(arg_169_0.cameras[var_0_0.CAMERA.ROLE2])
		end,
		talk = function(arg_176_0)
			assert(arg_169_0.apartment)
			arg_169_0:SetCameraLady(arg_169_0.ladyDict[arg_169_0.apartment:GetConfigID()])
			arg_169_0:SyncInterestTransform(arg_169_0.ladyDict[arg_169_0.apartment:GetConfigID()])
			arg_169_0:RegisterCameraBlendFinished(arg_169_0.cameras[var_0_0.CAMERA.TALK], arg_176_0)
			arg_169_0:ActiveCamera(arg_169_0.cameras[var_0_0.CAMERA.TALK])
		end
	}
	local var_169_1 = {}

	table.insert(var_169_1, function(arg_177_0)
		switch(arg_169_1, var_169_0, arg_177_0, arg_177_0)
	end)
	seriesAsync(var_169_1, arg_169_2)
end

function var_0_0.GetSceneItem(arg_178_0, arg_178_1)
	local var_178_0

	if string.find(arg_178_1, "fbx/") == 1 then
		var_178_0 = arg_178_0.modelRoot:Find(arg_178_1)
	elseif string.find(arg_178_1, "FurnitureSlots/") == 1 then
		arg_178_1 = string.gsub(arg_178_1, "^FurnitureSlots/", "", 1)
		var_178_0 = arg_178_0.slotRoot:Find(arg_178_1)
	end

	if not var_178_0 then
		warning(string.format("Missing scene item path: %s", arg_178_1))
	end

	return var_178_0
end

function var_0_0.SetIKStatus(arg_179_0, arg_179_1, arg_179_2, arg_179_3)
	warning("Set IKStatus " .. (arg_179_2.id or "NIL"))

	arg_179_0.enableIKTip = true

	arg_179_0:ResetIKTipTimer()
	setActive(arg_179_1.ladyCollider, false)
	_.each(arg_179_1.ladyTouchColliders, function(arg_180_0)
		setActive(arg_180_0, true)
	end)

	arg_179_0.blockIK = nil
	arg_179_1.ikActionDict = {}
	arg_179_1.readyIKLayers = {}
	arg_179_1.iKTouchDatas = arg_179_2.touch_data or {}
	arg_179_1.IKSettings = {
		Colliders = arg_179_1.ladyColliders,
		CameraRaycaster = arg_179_0.sceneRaycaster
	}

	local var_179_0 = table.shallowCopy(arg_179_2.ik_id)
	local var_179_1 = {}

	_.each(arg_179_1.iKTouchDatas, function(arg_181_0)
		local var_181_0 = arg_181_0[3]

		if var_181_0[1] == 7 then
			local var_181_1 = pg.dorm3d_ik_touch_move[var_181_0[2]]
			local var_181_2 = var_181_1.target_ik

			if not _.detect(var_179_0, function(arg_182_0)
				return arg_182_0[1] == var_181_2
			end) then
				var_179_1[var_181_2] = {
					back_time = var_181_1.back_time
				}

				local var_181_3 = {
					var_181_2,
					0,
					{}
				}

				if var_181_1.trigger_dialogue > 0 then
					var_181_3[3] = {
						4,
						0,
						var_181_1.trigger_dialogue
					}
				end

				table.insert(var_179_0, var_181_3)
			end
		end
	end)

	local var_179_2 = _.map(var_179_0, function(arg_183_0)
		local var_183_0 = Dorm3dIK.New({
			configId = arg_183_0[1]
		})
		local var_183_1 = arg_183_0[3]
		local var_183_2 = var_183_1[1]
		local var_183_3 = switch(var_183_2, {
			function(arg_184_0, arg_184_1)
				return 0
			end,
			function()
				return 0
			end,
			function(arg_186_0, arg_186_1)
				return arg_186_0
			end,
			function(arg_187_0, arg_187_1)
				return arg_187_0
			end,
			function(arg_188_0, arg_188_1, arg_188_2, arg_188_3)
				return arg_188_0
			end,
			function(arg_189_0)
				return 0
			end
		}, function(arg_190_0)
			return type(arg_190_0) == "number" and arg_190_0 or 0
		end, unpack(var_183_1, 2))

		table.insert(arg_179_1.readyIKLayers, var_183_0)

		arg_179_1.ikActionDict[var_183_0:GetControllerPath()] = var_183_1

		local var_183_4 = var_183_0:GetRevertTime()
		local var_183_5 = var_179_1[var_183_0:GetConfigID()]
		local var_183_6 = tobool(var_183_5)

		if var_183_6 then
			var_183_3 = var_183_5.back_time
			var_183_4 = var_183_5.back_time
			var_183_0.ignoreDrag = true
		end

		local var_183_7 = var_183_0:GetSubTargets()
		local var_183_8 = var_183_0:GetPlaneRotations()
		local var_183_9 = var_183_0:GetPlaneScales()
		local var_183_10 = _.map(_.range(#var_183_7), function(arg_191_0)
			return {
				name = var_183_7[arg_191_0][1],
				planeRot = var_183_8[arg_191_0],
				planeScale = var_183_9[arg_191_0]
			}
		end)

		return Dorm3dIKController.New({
			triggerName = var_183_0:getConfig("trigger_param")[2],
			controllerName = var_183_0:GetControllerPath(),
			subTargets = var_183_10,
			actionType = var_183_0:GetActionTriggerParams()[1],
			controlRect = var_183_0:GetRect(),
			actionRect = var_183_0:GetTriggerRect(),
			backTime = var_183_4,
			actionRevertTime = var_183_3,
			ignoreDrag = var_183_6
		})
	end)

	pg.IKMgr.GetInstance():RegisterEnv(arg_179_1.ladyIKRoot, arg_179_1.ladyBoneMaps)
	arg_179_0:RegisterIKFunc()
	pg.IKMgr.GetInstance():SetIKStatus(var_179_2)

	local var_179_3 = _.map(arg_179_1.iKTouchDatas, function(arg_192_0)
		return arg_192_0[1]
	end)

	table.Foreach(var_179_3, function(arg_193_0, arg_193_1)
		local var_193_0 = pg.dorm3d_ik_touch[arg_193_1]

		if #var_193_0.scene_item == 0 then
			return
		end

		local var_193_1 = arg_179_0:GetSceneItem(var_193_0.scene_item)

		if not var_193_1 then
			warning(string.format("dorm3d_ik_touch:%d without scene_item:%s", arg_193_1, var_193_0.scene_item))

			return
		end

		if IsNil(GetComponent(var_193_1, typeof(UnityEngine.Collider))) then
			go(var_193_1):AddComponent(typeof(UnityEngine.BoxCollider))
		end

		local var_193_2 = GetOrAddComponent(var_193_1, typeof(EventTriggerListener))

		var_193_2.enabled = true

		var_193_2:AddPointClickFunc(function()
			arg_179_0.blockIK = true

			local var_194_0 = arg_179_1.iKTouchDatas[arg_193_0]
			local var_194_1, var_194_2, var_194_3 = unpack(var_194_0)

			arg_179_0:TouchModeAction(arg_179_1, var_194_1, unpack(var_194_3))(function()
				arg_179_0.enableIKTip = true

				arg_179_0:ResetIKTipTimer()

				arg_179_0.blockIK = nil
			end)
		end)
	end)

	arg_179_0.camBrain.enabled = false

	if arg_179_0.cameras[var_0_0.CAMERA.IK_WATCH] then
		setActive(arg_179_0.cameras[var_0_0.CAMERA.IK_WATCH], false)

		arg_179_0.cameras[var_0_0.CAMERA.IK_WATCH] = nil
	end

	local var_179_4 = arg_179_0.cameraRoot:Find(arg_179_2.ik_camera)

	assert(var_179_4, "Missing IKCamera")

	arg_179_0.cameras[var_0_0.CAMERA.IK_WATCH] = var_179_4

	arg_179_0:ActiveCamera(arg_179_0.cameras[var_0_0.CAMERA.IK_WATCH])

	arg_179_0.camBrain.enabled = true

	local var_179_5 = var_179_4:GetComponent(typeof(Cinemachine.CinemachineFreeLook))

	if var_179_5 then
		arg_179_0:RegisterOrbits(var_179_5)
	else
		arg_179_0:RevertCameraOrbit()
	end

	arg_179_0:SwitchAnim(arg_179_1, arg_179_2.character_action)
	arg_179_0:SettingHeadAimIK(arg_179_1, arg_179_2.head_track)
	arg_179_0:EnableCloth(arg_179_1, false)
	arg_179_0:EnableCloth(arg_179_1, arg_179_2.use_cloth, arg_179_2.cloth_colliders)
	;(function()
		local var_196_0 = arg_179_2.enter_scene_anim
		local var_196_1 = {}

		if var_196_0 and #var_196_0 > 0 then
			table.Ipairs(var_196_0, function(arg_197_0, arg_197_1)
				arg_179_0:PlaySceneItemAnim(arg_197_1[1], arg_197_1[2])
				table.insert(var_196_1, arg_197_1[1])
			end)
		end

		arg_179_0:ResetSceneItemAnimators(var_196_1)
	end)()
	;(function()
		local var_198_0 = arg_179_2.enter_extra_item
		local var_198_1 = {}

		if var_198_0 and #var_198_0 > 0 then
			table.Ipairs(var_198_0, function(arg_199_0, arg_199_1)
				local var_199_0 = arg_199_1[3] and Vector3.New(unpack(arg_199_1[3]))
				local var_199_1 = arg_199_1[4] and Quaternion.Euler(unpack(arg_199_1[4]))

				arg_179_0:LoadCharacterExtraItem(arg_179_1, arg_199_1[1], arg_199_1[2], var_199_0, var_199_1)
				table.insert(var_198_1, arg_199_1[1])
			end)
		end

		arg_179_0:ResetCharacterExtraItem(arg_179_1, var_198_1)
	end)()
	eachChild(arg_179_0.ikTextTipsRoot, function(arg_200_0)
		setActive(arg_200_0, false)
	end)
	_.each(arg_179_1.readyIKLayers, function(arg_201_0)
		local var_201_0 = arg_201_0:getConfig("tip_text")

		if not var_201_0 or #var_201_0 == 0 then
			return
		end

		local var_201_1 = arg_179_0.ikTextTipsRoot:Find(var_201_0)

		if not IsNil(var_201_1) then
			setActive(var_201_1, true)
		end
	end)
	onNextTick(function()
		local var_202_0 = arg_179_0.furnitures:Find(arg_179_2.character_position)

		arg_179_1.lady.position = var_202_0:Find("StayPoint").position
		arg_179_1.lady.rotation = var_202_0:Find("StayPoint").rotation

		existCall(arg_179_3)
	end)
end

function var_0_0.ExitIKStatus(arg_203_0, arg_203_1, arg_203_2, arg_203_3)
	arg_203_0.enableIKTip = false

	setActive(arg_203_1.ladyCollider, true)
	_.each(arg_203_1.ladyTouchColliders, function(arg_204_0)
		setActive(arg_204_0, false)
	end)

	arg_203_0.blockIK = nil

	pg.IKMgr.GetInstance():UnregisterEnv()
	setActive(arg_203_0.ikTipsRoot, false)
	setActive(arg_203_0.ikClickTipsRoot, false)

	local var_203_0 = _.map(arg_203_1.iKTouchDatas, function(arg_205_0)
		return arg_205_0[1]
	end)

	table.Foreach(var_203_0, function(arg_206_0, arg_206_1)
		local var_206_0 = pg.dorm3d_ik_touch[arg_206_1]

		if #var_206_0.scene_item == 0 then
			return
		end

		local var_206_1 = arg_203_0.modelRoot:Find(var_206_0.scene_item)

		if not var_206_1 then
			return
		end

		local var_206_2 = GetOrAddComponent(var_206_1, typeof(EventTriggerListener))

		var_206_2:ClearEvents()

		var_206_2.enabled = false
	end)

	arg_203_1.ikActionDict = nil
	arg_203_1.readyIKLayers = nil
	arg_203_1.iKTouchDatas = nil

	arg_203_0:RevertCameraOrbit()
	setActive(arg_203_0.cameras[var_0_0.CAMERA.IK_WATCH], false)

	arg_203_0.cameras[var_0_0.CAMERA.IK_WATCH] = nil

	arg_203_0:EnableCloth(arg_203_1, false)
	arg_203_0:ResetHeadAimIK(arg_203_1)
	arg_203_0:SwitchAnim(arg_203_1, arg_203_2.character_action)
	arg_203_0:ResetSceneItemAnimators()
	arg_203_0:ResetCharacterExtraItem(arg_203_1)
	onNextTick(function()
		if arg_203_2.character_position then
			arg_203_1.ladyActiveZone = arg_203_2.character_position
		else
			arg_203_1.ladyActiveZone = arg_203_1.ladyBaseZone
		end

		arg_203_0:ChangeCharacterPosition(arg_203_1)
		arg_203_0:TriggerLadyDistance()
		arg_203_0:CheckInSector()
		existCall(arg_203_3)
	end)
end

function var_0_0.SetIKTimelineStatus(arg_208_0, arg_208_1, arg_208_2, arg_208_3, arg_208_4, arg_208_5)
	warning("Set IKStatus " .. (arg_208_3 or "NIL"))

	arg_208_0.enableIKTip = true

	setActive(arg_208_0.ikControlUI, true)
	arg_208_0:ResetIKTipTimer()

	arg_208_0.blockIK = nil

	local var_208_0 = pg.dorm3d_ik_timeline_status[arg_208_3]

	arg_208_1.readyIKLayers = {}
	arg_208_1.iKTouchDatas = {}
	arg_208_1.IKSettings = {
		CameraRaycaster = GetOrAddComponent(arg_208_4, typeof(UnityEngine.EventSystems.PhysicsRaycaster))
	}

	assert(arg_208_1.IKSettings.CameraRaycaster)

	local var_208_1 = {}

	table.IpairsCArray(arg_208_2:GetComponentsInChildren(typeof(UnityEngine.Collider), true), function(arg_209_0, arg_209_1)
		if arg_209_1.name == "SafeCollider" then
			setActive(arg_209_1, false)

			return
		end

		if arg_209_1:GetType():Equals(typeof(UnityEngine.MeshCollider)) then
			return
		end

		child = tf(arg_209_1)

		local var_209_0 = child.name
		local var_209_1 = var_209_0 and string.find(var_209_0, "Collider") or -1

		if var_209_1 <= 0 then
			errorMsg("Wrong Name to lady Collider : " .. var_209_0)

			return
		end

		local var_209_2 = string.sub(var_209_0, 1, var_209_1 - 1)

		if var_209_2 == "Body" or var_209_2 == "Safe" then
			setActive(child, false)

			return
		end

		if var_0_0.BONE_TO_TOUCH[var_209_2] == nil then
			return
		end

		var_208_1[var_209_2] = child

		setActive(child, true)
	end)

	arg_208_1.IKSettings.Colliders = var_208_1

	local var_208_2 = GetOrAddComponent(arg_208_2, typeof(EventTriggerListener))

	arg_208_1.ikTimelineMode = true

	local var_208_3 = _.map(var_208_0.ik_id, function(arg_210_0)
		local var_210_0 = Dorm3dIK.New({
			configId = arg_210_0
		})

		table.insert(arg_208_1.readyIKLayers, var_210_0)

		local var_210_1 = var_210_0:GetSubTargets()
		local var_210_2 = var_210_0:GetPlaneRotations()
		local var_210_3 = var_210_0:GetPlaneScales()
		local var_210_4 = _.map(_.range(#var_210_1), function(arg_211_0)
			return {
				name = var_210_1[arg_211_0][1],
				planeRot = var_210_2[arg_211_0],
				planeScale = var_210_3[arg_211_0]
			}
		end)

		return Dorm3dIKController.New({
			ignoreDrag = false,
			triggerName = var_210_0:getConfig("trigger_param")[2],
			controllerName = var_210_0:GetControllerPath(),
			subTargets = var_210_4,
			actionType = var_210_0:GetActionTriggerParams()[1],
			controlRect = var_210_0:GetRect(),
			actionRect = var_210_0:GetTriggerRect(),
			backTime = var_210_0:GetRevertTime(),
			actionRevertTime = var_210_0:GetActionRevertTime(),
			timelineActionEvent = var_210_0:GetTimelineAction()
		})
	end)
	local var_208_4 = arg_208_2.transform:Find("IKLayers")
	local var_208_5 = {}
	local var_208_6 = {}

	table.Foreach(var_0_1, function(arg_212_0, arg_212_1)
		var_208_6[arg_212_1] = arg_212_0
	end)

	local var_208_7 = arg_208_2.transform:GetComponentsInChildren(typeof(Transform), true)

	table.IpairsCArray(var_208_7, function(arg_213_0, arg_213_1)
		if var_208_6[arg_213_1.name] then
			var_208_5[var_208_6[arg_213_1.name]] = arg_213_1
		end
	end)
	pg.IKMgr.GetInstance():RegisterEnv(var_208_4, var_208_5)
	arg_208_0:RegisterIKFunc()
	pg.IKMgr.GetInstance():SetIKStatus(var_208_3)
	eachChild(arg_208_0.ikTextTipsRoot, function(arg_214_0)
		setActive(arg_214_0, false)
	end)
	_.each(arg_208_1.readyIKLayers, function(arg_215_0)
		local var_215_0 = arg_215_0:getConfig("tip_text")

		if not var_215_0 or #var_215_0 == 0 then
			return
		end

		local var_215_1 = arg_208_0.ikTextTipsRoot:Find(var_215_0)

		if not IsNil(var_215_1) then
			setActive(var_215_1, true)
		end
	end)
	existCall(arg_208_5)
end

function var_0_0.ExitIKTimelineStatus(arg_216_0, arg_216_1, arg_216_2)
	arg_216_0.enableIKTip = false

	setActive(arg_216_0.ikControlUI, false)

	arg_216_0.blockIK = nil

	pg.IKMgr.GetInstance():UnregisterEnv()

	arg_216_1.readyIKLayers = nil
	arg_216_1.iKTouchDatas = nil
	arg_216_1.IKSettings = nil

	setActive(arg_216_0.ikTipsRoot, false)
	setActive(arg_216_0.ikClickTipsRoot, false)
	existCall(arg_216_2)
end

function var_0_0.EnableIKLayer(arg_217_0, arg_217_1)
	local var_217_0 = arg_217_0.ladyDict[arg_217_0.apartment:GetConfigID()]

	if #arg_217_1:GetHeadTrackPath() > 0 then
		arg_217_0:SettingHeadAimIK(var_217_0, {
			2,
			arg_217_1:GetHeadTrackPath()
		}, true)
	end

	local var_217_1 = arg_217_1:GetTriggerFaceAnim()

	if #var_217_1 > 0 then
		arg_217_0:PlayFaceAnim(var_217_0, var_217_1)
	end

	if not arg_217_1.ignoreDrag then
		setActive(arg_217_0:GetIKHandTF(), true)
		eachChild(arg_217_0:GetIKHandTF(), function(arg_218_0)
			setActive(arg_218_0, false)
		end)
		arg_217_0:StopIKHandTimer()
		setActive(arg_217_0:GetIKHandTF():Find("Begin"), true)

		arg_217_0.ikHandTimer = Timer.New(function()
			setActive(arg_217_0:GetIKHandTF():Find("Begin"), false)
			setActive(arg_217_0:GetIKHandTF():Find("Normal"), true)
		end, 0.5, 1)

		arg_217_0.ikHandTimer:Start()
	end

	if not var_217_0.ikTimelineMode then
		pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataTouch(arg_217_0.apartment.configId, arg_217_0.apartment.level, var_217_0.ikConfig.character_action, arg_217_1:GetTriggerParams()[2], arg_217_0.room:GetConfigID()))
	end
end

function var_0_0.DeactiveIKLayer(arg_220_0, arg_220_1)
	local var_220_0 = arg_220_0.ladyDict[arg_220_0.apartment:GetConfigID()]

	if not var_220_0.ikTimelineMode and #arg_220_1:GetHeadTrackPath() > 0 then
		arg_220_0:SettingHeadAimIK(var_220_0, var_220_0.ikConfig.head_track)
	end

	arg_220_0:StopIKHandTimer()

	if not arg_220_1.ignoreDrag then
		setActive(arg_220_0:GetIKHandTF():Find("Begin"), false)
		setActive(arg_220_0:GetIKHandTF():Find("Normal"), false)
		setActive(arg_220_0:GetIKHandTF():Find("End"), true)

		arg_220_0.ikHandTimer = Timer.New(function()
			setActive(arg_220_0:GetIKHandTF():Find("End"), false)
			setActive(arg_220_0:GetIKHandTF(), false)
		end, 0.5, 1)

		arg_220_0.ikHandTimer:Start()
	end
end

function var_0_0.StopIKHandTimer(arg_222_0)
	if not arg_222_0.ikHandTimer then
		return
	end

	arg_222_0.ikHandTimer:Stop()

	arg_222_0.ikHandTimer = nil
end

function var_0_0.PlayIKRevert(arg_223_0, arg_223_1, arg_223_2, arg_223_3)
	local var_223_0 = Time.time

	function arg_223_0.ikRevertHandler()
		local var_224_0 = Time.time - var_223_0

		_.each(arg_223_1.activeIKLayers, function(arg_225_0)
			local var_225_0 = 1

			if arg_223_2 > 0 then
				var_225_0 = var_224_0 / arg_223_2
			end

			local var_225_1 = arg_223_1.cacheIKInfos[arg_225_0].solvers
			local var_225_2 = arg_223_1.cacheIKInfos[arg_225_0].weights

			table.Foreach(var_225_1, function(arg_226_0, arg_226_1)
				arg_226_1.IKPositionWeight = math.lerp(var_225_2[arg_226_0], 0, var_225_0)
			end)
		end)

		if var_224_0 >= arg_223_2 then
			arg_223_0:ResetActiveIKs(arg_223_1)

			arg_223_0.ikRevertHandler = nil

			existCall(arg_223_3)
		end
	end

	arg_223_0.ikRevertHandler()
end

function var_0_0.ResetActiveIKs(arg_227_0, arg_227_1)
	table.insertto(arg_227_0.activeIKLayers, _.keys(arg_227_0.holdingStatus))
	table.clear(arg_227_0.holdingStatus)
	_.each(arg_227_1.activeIKLayers, function(arg_228_0)
		local var_228_0 = arg_228_0:GetControllerPath()
		local var_228_1 = arg_227_1.ladyIKRoot:Find(var_228_0):GetComponent(typeof(RootMotion.FinalIK.IKExecutionOrder))

		setActive(var_228_1, false)

		local var_228_2 = arg_227_1.cacheIKInfos[arg_228_0].solvers
		local var_228_3 = arg_227_1.cacheIKInfos[arg_228_0].weights

		table.Foreach(var_228_2, function(arg_229_0, arg_229_1)
			arg_229_1.IKPositionWeight = var_228_3[arg_229_0]
		end)
	end)
	table.clear(arg_227_1.activeIKLayers)
end

function var_0_0.ResetIKTipTimer(arg_230_0)
	if not arg_230_0.enableIKTip then
		return
	end

	arg_230_0.nextTipIKTime = Time.time + var_0_0.IK_TIP_WAIT_TIME
end

function var_0_0.EnableCurrentHeadIK(arg_231_0, arg_231_1)
	local var_231_0 = arg_231_0.ladyDict[arg_231_0.apartment:GetConfigID()]

	arg_231_0:EnableHeadIK(var_231_0, arg_231_1)
end

function var_0_0.EnableHeadIK(arg_232_0, arg_232_1, arg_232_2)
	arg_232_1.ladyHeadIKComp.enableIk = arg_232_2
end

function var_0_0.SettingHeadAimIK(arg_233_0, arg_233_1, arg_233_2, arg_233_3)
	local var_233_0

	if arg_233_2[1] == 1 then
		var_233_0 = arg_233_0.mainCameraTF:Find("AimTarget")
	elseif arg_233_2[1] == 2 then
		table.IpairsCArray(arg_233_1.lady:GetComponentsInChildren(typeof(Transform), true), function(arg_234_0, arg_234_1)
			if arg_234_1.name ~= arg_233_2[2] then
				return
			end

			var_233_0 = arg_234_1
		end)
	end

	arg_233_1.ladyHeadIKComp.AimTarget = var_233_0

	if not arg_233_3 and arg_233_2[3] then
		arg_233_1.ladyHeadIKComp.BodyWeight = arg_233_2[3]
	end

	if not arg_233_3 and arg_233_2[4] then
		arg_233_1.ladyHeadIKComp.HeadWeight = arg_233_2[4]
	end
end

function var_0_0.ResetHeadAimIK(arg_235_0, arg_235_1)
	arg_235_1.ladyHeadIKComp.AimTarget = arg_235_0.mainCameraTF:Find("AimTarget")
	arg_235_1.ladyHeadIKComp.HeadWeight = arg_235_1.ladyHeadIKData.HeadWeight
	arg_235_1.ladyHeadIKComp.BodyWeight = arg_235_1.ladyHeadIKData.BodyWeight
end

function var_0_0.HideCharacter(arg_236_0, arg_236_1)
	for iter_236_0, iter_236_1 in pairs(arg_236_0.ladyDict) do
		if iter_236_0 ~= arg_236_1 then
			arg_236_0:HideCharacterBylayer(iter_236_1)
		end
	end
end

function var_0_0.RevertCharacter(arg_237_0, arg_237_1)
	for iter_237_0, iter_237_1 in pairs(arg_237_0.ladyDict) do
		if iter_237_0 ~= arg_237_1 then
			arg_237_0:RevertCharacterBylayer(iter_237_1)
		end
	end
end

function var_0_0.HideCharacterBylayer(arg_238_0, arg_238_1)
	local var_238_0 = "Bip001"
	local var_238_1 = arg_238_1.lady:Find("all")

	for iter_238_0 = 0, var_238_1.childCount - 1 do
		local var_238_2 = var_238_1:GetChild(iter_238_0)

		if var_238_2.name ~= var_238_0 then
			pg.ViewUtils.SetLayer(var_238_2, Layer.Environment3D)
		end
	end

	if arg_238_1.tfPendintItem then
		pg.ViewUtils.SetLayer(arg_238_1.tfPendintItem, Layer.Environment3D)
	end

	if arg_238_1.ladyWatchFloat then
		pg.ViewUtils.SetLayer(arg_238_1.ladyWatchFloat, Layer.Environment3D)
	end

	GetComponent(arg_238_1.lady, "BLHXCharacterPropertiesController").enabled = false
end

function var_0_0.RevertCharacterBylayer(arg_239_0, arg_239_1)
	local var_239_0 = "Bip001"
	local var_239_1 = arg_239_1.lady:Find("all")

	for iter_239_0 = 0, var_239_1.childCount - 1 do
		local var_239_2 = var_239_1:GetChild(iter_239_0)

		if var_239_2.name ~= var_239_0 then
			pg.ViewUtils.SetLayer(var_239_2, Layer.Default)
		end
	end

	if arg_239_1.tfPendintItem then
		pg.ViewUtils.SetLayer(arg_239_1.tfPendintItem, Layer.Default)
	end

	if arg_239_1.ladyWatchFloat then
		pg.ViewUtils.SetLayer(arg_239_1.ladyWatchFloat, Layer.Default)
	end

	GetComponent(arg_239_1.lady, "BLHXCharacterPropertiesController").enabled = true
end

function var_0_0.EnterFurnitureWatchMode(arg_240_0)
	arg_240_0:SetAllBlackbloardValue("inLockLayer", true)
	arg_240_0:EnableJoystick(true)
	arg_240_0:HideCharacter()
end

function var_0_0.ExitFurnitureWatchMode(arg_241_0, arg_241_1)
	arg_241_0:HideFurnitureSlots()

	local var_241_0 = arg_241_0.cameras[var_0_0.CAMERA.POV]

	seriesAsync({
		function(arg_242_0)
			arg_241_0.furniturePOV = nil

			arg_241_0:EnableJoystick(false)
			arg_241_0:emit(var_0_0.SHOW_BLOCK)
			arg_241_0:ShowBlackScreen(true, arg_242_0)
		end,
		function(arg_243_0)
			existCall(arg_241_1)
			arg_241_0:RevertCharacter()
			arg_241_0:SetAllBlackbloardValue("inLockLayer", false)
			arg_241_0:RegisterCameraBlendFinished(var_241_0, arg_243_0)
			arg_241_0:ActiveCamera(var_241_0)
		end,
		function(arg_244_0)
			arg_241_0:ShowBlackScreen(false, arg_244_0)
		end
	}, function()
		arg_241_0:emit(var_0_0.HIDE_BLOCK)
	end)
	arg_241_0:RefreshSlots()
end

function var_0_0.SwitchFurnitureZone(arg_246_0, arg_246_1)
	local var_246_0 = arg_246_0:GetFurnitureByName(arg_246_1:GetWatchCameraName()):Find("FurnitureWatch Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))

	if arg_246_0.cameraFurnitureWatch and arg_246_0.cameraFurnitureWatch ~= var_246_0 then
		arg_246_0:UnRegisterCameraBlendFinished(arg_246_0.cameraFurnitureWatch)
		setActive(arg_246_0.cameraFurnitureWatch, false)
	end

	arg_246_0.cameraFurnitureWatch = var_246_0
	arg_246_0.cameras[var_0_0.CAMERA.FURNITURE_WATCH] = arg_246_0.cameraFurnitureWatch
	arg_246_0.furniturePOV = arg_246_0.cameraFurnitureWatch:GetCinemachineComponent(Cinemachine.CinemachineCore.Stage.Aim)

	arg_246_0:RegisterCameraBlendFinished(arg_246_0.cameraFurnitureWatch, function()
		arg_246_0:emit(var_0_0.HIDE_BLOCK)
	end)
	arg_246_0:emit(var_0_0.SHOW_BLOCK)
	arg_246_0:ActiveCamera(arg_246_0.cameraFurnitureWatch)
end

function var_0_0.HideFurnitureSlots(arg_248_0)
	if arg_248_0.displaySlots then
		arg_248_0:UpdateDisplaySlots({})
		table.Foreach(arg_248_0.displaySlots, function(arg_249_0, arg_249_1)
			local var_249_0 = arg_249_1.trans

			if IsNil(var_249_0:Find("Selector")) then
				return
			end

			setActive(var_249_0:Find("Selector"), false)
		end)

		arg_248_0.displaySlots = nil
	end
end

function var_0_0.DisplayFurnitureSlots(arg_250_0, arg_250_1)
	arg_250_0:HideFurnitureSlots()

	arg_250_0.displaySlots = {}

	_.each(arg_250_1, function(arg_251_0)
		arg_250_0.displaySlots[arg_251_0] = arg_250_0.slotDict[arg_251_0]

		if not arg_250_0.displaySlots[arg_251_0] then
			errorMsg("Slot " .. arg_251_0 .. " Not Binding Scene Object")

			return
		end

		local var_251_0 = arg_250_0.displaySlots[arg_251_0].trans

		if var_251_0:Find("Selector") then
			setActive(var_251_0:Find("Selector"), true)
		end
	end)
end

function var_0_0.UpdateDisplaySlots(arg_252_0, arg_252_1)
	table.Foreach(arg_252_0.displaySlots, function(arg_253_0, arg_253_1)
		local var_253_0 = arg_253_1.trans

		if not IsNil(var_253_0:Find("Selector")) then
			setActive(var_253_0:Find("Selector/Normal"), arg_252_1[arg_253_0] == 0)
			setActive(var_253_0:Find("Selector/Active"), arg_252_1[arg_253_0] == 1)
			setActive(var_253_0:Find("Selector/Ban"), arg_252_1[arg_253_0] == 2)
		end

		local var_253_1 = arg_252_0.slotDict[arg_253_0].model
		local var_253_2 = arg_252_0.slotDict[arg_253_0].displayModelName

		if var_253_2 and var_253_2 ~= "" then
			var_253_1 = var_253_0:GetChild(var_253_0.childCount - 1)
		end

		local function var_253_3(arg_254_0, arg_254_1)
			local var_254_0 = arg_254_0:GetComponentsInChildren(typeof(Renderer), true)

			table.IpairsCArray(var_254_0, function(arg_255_0, arg_255_1)
				local var_255_0 = arg_255_1.material

				if var_255_0 and var_255_0:HasProperty("_FinalTint") then
					var_255_0:SetColor("_FinalTint", arg_254_1)
				end
			end)
		end

		if var_253_1 then
			if arg_252_1[arg_253_0] == 1 then
				var_253_3(var_253_1, Color.NewHex("3F83AE73"))
			else
				var_253_3(var_253_1, Color.New(0, 0, 0, 0))
			end
		end
	end)
end

function var_0_0.EnterPhotoMode(arg_256_0, arg_256_1, arg_256_2)
	arg_256_0:SetAllBlackbloardValue("inLockLayer", true)
	arg_256_0:emit(var_0_0.ENABLE_SCENEBLOCK, true)
	seriesAsync({
		function(arg_257_0)
			arg_256_0:TempHideUI(true, arg_257_0)
		end,
		function(arg_258_0)
			arg_256_0:ShowBlackScreen(true, arg_258_0)
		end,
		function(arg_259_0)
			local var_259_0 = arg_256_0.apartment:GetConfigID()
			local var_259_1 = arg_256_0.ladyDict[var_259_0]

			arg_256_0:SwitchAnim(var_259_1, arg_256_2)
			var_259_1.ladyAnimator:Update(0)
			var_259_1:ResetCharPoint(var_259_1, arg_256_1:GetWatchCameraName())
			arg_256_0:SyncInterestTransform(var_259_1)
			setActive(var_259_1.ladySafeCollider, true)
			arg_256_0:HideCharacter(var_259_0)

			local var_259_2 = arg_256_0.cameras[var_0_0.CAMERA.PHOTO]
			local var_259_3 = var_259_2.m_XAxis

			var_259_3.Value = 180
			var_259_2.m_XAxis = var_259_3

			local var_259_4 = var_259_2.m_YAxis

			var_259_4.Value = 0.7
			var_259_2.m_YAxis = var_259_4
			arg_256_0.pinchValue = 1

			arg_256_0:RegisterOrbits(arg_256_0.cameras[var_0_0.CAMERA.PHOTO])
			arg_256_0:SetCameraObrits()
			setActive(arg_256_0.restrictedBox, true)
			arg_256_0:RegisterCameraBlendFinished(var_259_2, arg_259_0)
			arg_256_0:ActiveCamera(var_259_2)
		end,
		function(arg_260_0)
			arg_256_0:ShowBlackScreen(false, arg_260_0)
		end
	}, function()
		arg_256_0:EnableJoystick(true)
	end)
end

function var_0_0.ExitPhotoMode(arg_262_0)
	arg_262_0:emit(var_0_0.SHOW_BLOCK)
	arg_262_0:EnableJoystick(false)
	seriesAsync({
		function(arg_263_0)
			arg_262_0:ShowBlackScreen(true, arg_263_0)
		end,
		function(arg_264_0)
			arg_262_0:RevertCameraOrbit()

			local var_264_0 = arg_262_0.ladyDict[arg_262_0.apartment:GetConfigID()]

			arg_262_0:SwitchAnim(var_264_0, var_0_0.ANIM.IDLE)
			setActive(var_264_0.ladySafeCollider, false)
			onNextTick(function()
				arg_262_0:ChangeCharacterPosition(var_264_0)
			end)

			if arg_262_0.contextData.photoFreeMode then
				arg_262_0:EnablePOVLayer(false)

				arg_262_0.contextData.photoFreeMode = nil
			end

			setActive(arg_262_0.restrictedBox, false)

			local var_264_1 = arg_262_0.cameras[var_0_0.CAMERA.POV]

			arg_262_0:RegisterCameraBlendFinished(var_264_1, arg_264_0)
			arg_262_0:ActiveCamera(var_264_1)
		end,
		function(arg_266_0)
			arg_262_0:RevertCharacter(arg_262_0.apartment:GetConfigID())
			arg_262_0:ShowBlackScreen(false, arg_266_0)
		end
	}, function()
		arg_262_0:RefreshSlots()
		arg_262_0:SetAllBlackbloardValue("inLockLayer", false)
		arg_262_0:emit(var_0_0.HIDE_BLOCK)
		arg_262_0:emit(var_0_0.ENABLE_SCENEBLOCK, false)
		arg_262_0:TempHideUI(false)
	end)
end

function var_0_0.SwitchCameraZone(arg_268_0, arg_268_1, arg_268_2, arg_268_3)
	arg_268_0:emit(var_0_0.SHOW_BLOCK)
	seriesAsync({
		function(arg_269_0)
			arg_268_0:ShowBlackScreen(true, arg_269_0)
		end,
		function(arg_270_0)
			local var_270_0 = arg_268_0.ladyDict[arg_268_0.apartment:GetConfigID()]

			arg_268_0:SwitchAnim(var_270_0, arg_268_2)
			onNextTick(function()
				arg_268_0:ResetCharPoint(var_270_0, arg_268_1:GetWatchCameraName())
				arg_268_0:SyncInterestTransform(var_270_0)

				if arg_268_0.contextData.photoFreeMode then
					arg_268_0.camBrain.enabled = false

					arg_268_0:SwitchPhotoCamera()

					arg_268_0.camBrain.enabled = true

					onDelayTick(function()
						arg_268_0.camBrain.enabled = false

						arg_268_0:SwitchPhotoCamera()

						arg_268_0.camBrain.enabled = true
					end, 0.1)
				end

				arg_270_0()
			end)
		end,
		function(arg_273_0)
			arg_268_0:ShowBlackScreen(false, arg_273_0)
		end
	}, function()
		arg_268_0:emit(var_0_0.HIDE_BLOCK)
		existCall(arg_268_3)
	end)
end

function var_0_0.SwitchPhotoCamera(arg_275_0)
	if not arg_275_0.contextData.photoFreeMode then
		arg_275_0:EnableJoystick(false)
		arg_275_0:EnablePOVLayer(true)

		local var_275_0 = arg_275_0.cameras[var_0_0.CAMERA.PHOTO_FREE]
		local var_275_1 = arg_275_0.cameras[var_0_0.CAMERA.PHOTO_FREE]:Find("PhotoFree Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera)):GetCinemachineComponent(Cinemachine.CinemachineCore.Stage.Aim)
		local var_275_2 = arg_275_0.mainCameraTF.rotation:ToEulerAngles()
		local var_275_3 = var_275_1.m_HorizontalAxis

		var_275_3.Value = var_275_2.y
		var_275_1.m_HorizontalAxis = var_275_3

		local var_275_4 = var_275_1.m_VerticalAxis

		var_275_4.Value = arg_275_0:GetNearestAngle(var_275_2.x, var_275_4.m_MinValue, var_275_4.m_MaxValue)
		var_275_1.m_VerticalAxis = var_275_4

		local var_275_5 = arg_275_0.mainCameraTF.position
		local var_275_6 = math.InverseLerp(arg_275_0.restrictedHeightRange[1], arg_275_0.restrictedHeightRange[2], var_275_5.y)

		var_275_5.y = math.clamp(var_275_5.y, arg_275_0.restrictedHeightRange[1], arg_275_0.restrictedHeightRange[2])
		var_275_0.transform.position = var_275_5

		arg_275_0:emit(Dorm3dPhotoMediator.CAMERA_LIFT_CHANGED, var_275_6)
		arg_275_0:ActiveCamera(arg_275_0.cameras[var_0_0.CAMERA.PHOTO_FREE])
	else
		arg_275_0:EnableJoystick(true)
		arg_275_0:EnablePOVLayer(false)
		arg_275_0:ActiveCamera(arg_275_0.cameras[var_0_0.CAMERA.PHOTO])
	end

	arg_275_0.contextData.photoFreeMode = not arg_275_0.contextData.photoFreeMode
end

function var_0_0.SetPhotoCameraHeight(arg_276_0, arg_276_1)
	local var_276_0 = math.lerp(arg_276_0.restrictedHeightRange[1], arg_276_0.restrictedHeightRange[2], arg_276_1)
	local var_276_1 = arg_276_0.cameras[var_0_0.CAMERA.PHOTO_FREE]

	var_276_1:GetComponent(typeof(UnityEngine.CharacterController)):Move(Vector3.New(0, var_276_0 - var_276_1.position.y, 0))
	onNextTick(function()
		local var_277_0 = math.InverseLerp(arg_276_0.restrictedHeightRange[1], arg_276_0.restrictedHeightRange[2], var_276_1.position.y)

		arg_276_0:emit(Dorm3dPhotoMediator.CAMERA_LIFT_CHANGED, var_277_0)
	end)
end

function var_0_0.ResetPhotoCameraPosition(arg_278_0)
	local var_278_0 = arg_278_0.cameras[var_0_0.CAMERA.PHOTO]
	local var_278_1 = var_278_0.m_XAxis

	var_278_1.Value = 180
	var_278_0.m_XAxis = var_278_1

	local var_278_2 = var_278_0.m_YAxis

	var_278_2.Value = 0.7
	var_278_0.m_YAxis = var_278_2
end

function var_0_0.ResetCurrentCharPoint(arg_279_0, arg_279_1)
	local var_279_0 = arg_279_0.ladyDict[arg_279_0.apartment:GetConfigID()]

	arg_279_0:ResetCharPoint(var_279_0, arg_279_1)
end

function var_0_0.ResetCharPoint(arg_280_0, arg_280_1, arg_280_2)
	local var_280_0 = arg_280_0.furnitures:Find(arg_280_2 .. "/StayPoint")

	arg_280_1.lady.position = var_280_0.position
	arg_280_1.lady.rotation = var_280_0.rotation
end

function var_0_0.GetNearestAngle(arg_281_0, arg_281_1, arg_281_2, arg_281_3)
	if arg_281_3 < arg_281_2 then
		arg_281_3 = arg_281_3 + 360
	end

	if arg_281_2 <= arg_281_1 and arg_281_1 <= arg_281_3 then
		return arg_281_1
	end

	local var_281_0 = (arg_281_2 + arg_281_3) / 2

	arg_281_1 = var_281_0 - Mathf.DeltaAngle(arg_281_1, var_281_0)
	arg_281_1 = math.clamp(arg_281_1, arg_281_2, arg_281_3)

	return arg_281_1
end

function var_0_0.PlayTimeline(arg_282_0, arg_282_1, arg_282_2)
	local var_282_0 = {}

	if arg_282_0.waitForTimeline then
		table.insert(var_282_0, function(arg_283_0)
			local var_283_0 = arg_282_0.waitForTimeline

			arg_282_0.waitForTimeline = nil

			var_283_0()
			arg_283_0()
		end)
	end

	table.insert(var_282_0, function(arg_284_0)
		arg_282_0:LoadTimelineScene(arg_282_1.name, false, nil, arg_284_0)
	end)

	if arg_282_1.scene and arg_282_1.sceneRoot then
		table.insert(var_282_0, function(arg_285_0)
			arg_282_0:ChangeArtScene(arg_282_1.scene .. "|" .. arg_282_1.sceneRoot, arg_285_0)
		end)
	end

	table.insert(var_282_0, function(arg_286_0)
		local var_286_0 = GameObject.Find("[actor]").transform
		local var_286_1 = var_286_0:GetComponentsInChildren(typeof(Animator), true)

		table.IpairsCArray(var_286_1, function(arg_287_0, arg_287_1)
			GetOrAddComponent(arg_287_1.transform, typeof(DftAniEvent))
		end)

		local var_286_2 = var_286_0:GetComponentInChildren(typeof("BLHXCharacterPropertiesController")).transform
		local var_286_3

		eachChild(GameObject.Find("[camera]").transform, function(arg_288_0)
			if arg_288_0.tag == "MainCamera" then
				var_286_3 = arg_288_0
			end
		end)
		assert(var_286_3, "Missing MainCamera")

		local var_286_4 = GameObject.Find("[sequence]").transform

		arg_282_0.nowTimelinePlayer = TimelinePlayer.New(var_286_4)

		arg_282_0.nowTimelinePlayer:Register(arg_282_1.time, function(arg_289_0, arg_289_1, arg_289_2)
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

					if arg_282_1.options then
						local var_293_0 = arg_282_1.options[arg_289_1.intParameter]

						arg_282_0:DoTimelineOption(var_293_0, function(arg_294_0)
							arg_289_2.selectIndex = arg_294_0
							arg_289_2.optionIndex = var_293_0[arg_294_0].flag

							arg_289_0:Play()
						end)
					end
				end,
				TimelineTouchStart = function()
					arg_289_2.selectIndex = nil

					if arg_282_1.touchs then
						local var_295_0 = arg_282_1.touchs[arg_289_1.intParameter]

						arg_282_0:DoTimelineTouch(arg_282_1.touchs[arg_289_1.intParameter], function(arg_296_0)
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
					if arg_282_0.canTriggerAccompanyPerformance then
						arg_282_0.canTriggerAccompanyPerformance = false

						local var_299_0 = arg_282_1.accompanys[arg_289_1.intParameter]
						local var_299_1 = var_299_0[math.random(#var_299_0)]

						arg_289_0:SetTime(var_299_1)
					end
				end,
				TimelineIKStart = function()
					arg_289_2.selectIndex = nil

					local var_300_0 = arg_289_1.intParameter
					local var_300_1 = arg_282_0.ladyDict[arg_282_0.apartment:GetConfigID()]

					arg_282_0:SetIKTimelineStatus(var_300_1, var_286_2.gameObject, var_300_0, var_286_3)
				end,
				TimelineEnd = function()
					arg_289_2.finish = true

					arg_289_0:SetSpeed(0)
				end
			}, function()
				warning("other event trigger:" .. arg_289_1.stringParameter)
			end)

			if arg_289_2.finish then
				arg_282_0.timelineMark = arg_289_2
				arg_282_0.timelineFinishCall = nil

				local var_289_0 = arg_282_0.ladyDict[arg_282_0.apartment:GetConfigID()]

				if var_289_0.ikTimelineMode then
					arg_282_0:ExitIKTimelineStatus(var_289_0)
				end

				arg_286_0()
			end
		end)

		function arg_282_0.timelineFinishCall()
			arg_282_0.nowTimelinePlayer:TriggerEvent({
				stringParameter = "TimelineEnd"
			})
		end

		arg_282_0:HideCharacter()
		setActive(arg_282_0.mainCameraTF, false)
		setActive(var_286_3, true)
		eachChild(arg_282_0.rtTimelineScreen, function(arg_304_0)
			setActive(arg_304_0, false)
		end)
		setActive(arg_282_0.rtTimelineScreen, true)
		setActive(arg_282_0.rtTimelineScreen:Find("btn_skip"), arg_282_0.inReplayTalk)
		arg_282_0.nowTimelinePlayer:Start()
	end)
	table.insert(var_282_0, function(arg_305_0)
		arg_282_0:ShowBlackScreen(true, function()
			arg_282_0.nowTimelinePlayer:Stop()
			arg_282_0.nowTimelinePlayer:Dispose()

			arg_282_0.nowTimelinePlayer = nil

			arg_282_0:UnloadTimelineScene(arg_282_1.name, false, arg_305_0)
		end)
	end)

	local var_282_1 = arg_282_0.dormSceneMgr.artSceneInfo

	table.insert(var_282_0, function(arg_307_0)
		arg_282_0:ChangeArtScene(var_282_1, arg_307_0)
	end)
	seriesAsync(var_282_0, function()
		setActive(arg_282_0.rtTimelineScreen, false)
		arg_282_0:RevertCharacter()
		setActive(arg_282_0.mainCameraTF, true)

		local var_308_0 = arg_282_0.timelineMark

		arg_282_0.timelineMark = nil

		existCall(arg_282_2, var_308_0, function(arg_309_0)
			arg_282_0:ShowBlackScreen(false, arg_309_0)
		end)
	end)
end

function var_0_0.PlayCurrentSingleAction(arg_310_0, ...)
	local var_310_0 = arg_310_0.ladyDict[arg_310_0.apartment:GetConfigID()]

	return arg_310_0:PlaySingleAction(var_310_0, ...)
end

function var_0_0.PlaySingleAction(arg_311_0, arg_311_1, arg_311_2, arg_311_3)
	warning("Play", arg_311_2)

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
	arg_322_1.ladyAnimator:CrossFadeInFixedTime(arg_322_2, 0, arg_322_1.ladyAnimFaceLayerIndex)
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
	local var_346_1 = LuaHelper.GetOrAddVolumeComponent(var_346_0, typeof(BLHX.Rendering.CustomDepthOfField))
	local var_346_2 = LuaHelper.GetOrAddVolumeComponent(var_346_0, typeof(UnityEngine.Rendering.Universal.ColorAdjustments))

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

	local var_346_3 = var_346_0:GetComponent(typeof(UnityEngine.Rendering.Volume))

	arg_346_0.originalVolume = {
		profile = var_346_3.sharedProfile,
		weight = var_346_3.weight
	}
end

function var_0_0.SettingCamera(arg_347_0, arg_347_1)
	arg_347_0.activeCameraSettings = arg_347_1

	local var_347_0 = arg_347_0.globalVolume
	local var_347_1 = LuaHelper.GetOrAddVolumeComponent(var_347_0, typeof(BLHX.Rendering.CustomDepthOfField))
	local var_347_2 = LuaHelper.GetOrAddVolumeComponent(var_347_0, typeof(UnityEngine.Rendering.Universal.ColorAdjustments))

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
	local var_350_0 = arg_350_0.globalVolume:GetComponent(typeof(UnityEngine.Rendering.Volume))

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
	local var_352_0 = arg_352_0.globalVolume:GetComponent(typeof(UnityEngine.Rendering.Volume))

	var_352_0.profile = arg_352_0.originalVolume.profile
	var_352_0.weight = arg_352_0.originalVolume.weight

	if arg_352_0.activeCameraSettings then
		arg_352_0:SettingCamera(arg_352_0.activeCameraSettings)
	end

	arg_352_0.activeProfileName = nil
end

function var_0_0.RecordCharacterLight(arg_353_0)
	local var_353_0 = arg_353_0.characterLight:GetComponent(typeof("BLHX.Rendering.CharacterLight"))

	arg_353_0.originalCharacterColor = {
		color = ReflectionHelp.RefGetProperty(typeof("BLHX.Rendering.CharacterLight"), "characterLightColor", var_353_0),
		intensity = ReflectionHelp.RefGetProperty(typeof("BLHX.Rendering.CharacterLight"), "characterLightIntensity", var_353_0)
	}
end

function var_0_0.SetCharacterLight(arg_354_0, arg_354_1, arg_354_2, arg_354_3)
	local var_354_0 = arg_354_0.characterLight:GetComponent(typeof(Light))
	local var_354_1 = Color.Lerp(arg_354_0.originalCharacterColor.color, arg_354_1, arg_354_3)
	local var_354_2 = math.lerp(arg_354_0.originalCharacterColor.intensity, arg_354_2, arg_354_3)
	local var_354_3 = arg_354_0.characterLight:GetComponent(typeof("BLHX.Rendering.CharacterLight"))

	ReflectionHelp.RefSetProperty(typeof("BLHX.Rendering.CharacterLight"), "characterLightColor", var_354_3, var_354_1)
	ReflectionHelp.RefSetProperty(typeof("BLHX.Rendering.CharacterLight"), "characterLightIntensity", var_354_3, var_354_2)
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
		name = arg_364_1,
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
	arg_366_0.dormSceneMgr:UnloadTimelineScene(arg_366_1, arg_366_2, arg_366_3)
end

function var_0_0.ChangeArtScene(arg_367_0, arg_367_1, arg_367_2)
	warning(arg_367_0.dormSceneMgr.artSceneInfo, "->", arg_367_1, arg_367_1 == arg_367_0.dormSceneMgr.sceneInfo)

	local var_367_0 = {}

	table.insert(var_367_0, function(arg_368_0)
		arg_367_0.dormSceneMgr:ChangeArtScene(arg_367_1, arg_368_0)
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

	if arg_379_0.transformFilter then
		arg_379_0.transformFilter:Dispose()
	end
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

function var_0_0.SetMagicaCollider(arg_385_0, arg_385_1, arg_385_2)
	local var_385_0 = typeof("MagicaCloth2.MagicaCapsuleCollider")
	local var_385_1 = arg_385_0:GetSize()

	var_385_1.x = arg_385_1
	var_385_1.y = arg_385_2

	arg_385_0:SetSize(var_385_1)
end

return var_0_0
