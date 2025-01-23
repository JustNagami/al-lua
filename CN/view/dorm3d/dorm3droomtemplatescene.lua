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

function var_0_0.BindEvent(arg_14_0)
	arg_14_0:bind(var_0_0.PLAY_EXPRESSION, function(arg_15_0, arg_15_1)
		arg_14_0:PlayExpression(arg_15_1)
	end)
	arg_14_0:bind(var_0_0.SHOW_BLOCK, function()
		arg_14_0.retainCount = arg_14_0.retainCount + 1

		setActive(arg_14_0.blockLayer, true)
	end)
	arg_14_0:bind(var_0_0.HIDE_BLOCK, function()
		arg_14_0.retainCount = math.max(arg_14_0.retainCount - 1, 0)

		if arg_14_0.retainCount > 0 then
			return
		end

		setActive(arg_14_0.blockLayer, false)
	end)
	arg_14_0:bind(var_0_0.ENABLE_SCENEBLOCK, function(arg_18_0, arg_18_1)
		setActive(arg_14_0.sceneBlockLayer, arg_18_1)
	end)
	arg_14_0:bind(var_0_0.ON_STICK_MOVE, function(arg_19_0, arg_19_1)
		arg_14_0:OnStickMove(arg_19_1)
	end)
	arg_14_0:bind(var_0_0.ON_BEGIN_DRAG_CHARACTER_BODY, function(arg_20_0, arg_20_1, arg_20_2, arg_20_3)
		if arg_14_0.blockIK then
			return
		end

		if arg_14_0.ikHandler then
			return
		end

		pg.IKMgr.GetInstance():OnDragBegin(arg_20_2, arg_20_3)
	end)
	arg_14_0:bind(var_0_0.ON_DRAG_CHARACTER_BODY, function(arg_21_0, arg_21_1, arg_21_2)
		if not arg_14_0.ikHandler then
			return
		end

		pg.IKMgr.GetInstance():HandleBodyDrag(arg_21_2)
	end)
	arg_14_0:bind(var_0_0.ON_RELEASE_CHARACTER_BODY, function(arg_22_0, arg_22_1)
		pg.IKMgr.GetInstance():ReleaseDrag()
	end)
	arg_14_0:bind(var_0_0.ON_POV_STICK_MOVE_BEGIN, function(arg_23_0, arg_23_1)
		if arg_14_0.pinchMode then
			return
		end

		arg_14_0.moveStickOrigin = arg_23_1.position
		arg_14_0.moveStickPosition = arg_14_0.moveStickOrigin
		arg_14_0.moveStickDraging = true
	end)

	local function var_14_0()
		arg_14_0.moveStickOrigin = nil
		arg_14_0.moveStickPosition = nil
		arg_14_0.moveStickDraging = nil

		if isActive(arg_14_0.cameras[var_0_0.CAMERA.PHOTO_FREE]) then
			arg_14_0:emit(Dorm3dPhotoMediator.CAMERA_STICK_MOVE, Vector2.zero)
		end
	end

	arg_14_0:bind(var_0_0.ON_POV_STICK_MOVE_END, function(arg_25_0, arg_25_1)
		var_14_0()
	end)
	arg_14_0:bind(var_0_0.ON_POV_STICK_MOVE, function(arg_26_0, arg_26_1)
		if arg_14_0.pinchMode then
			var_14_0()

			return
		end

		if not arg_14_0.moveStickDraging then
			return
		end

		arg_14_0.moveStickPosition = arg_14_0.moveStickPosition + arg_26_1

		if isActive(arg_14_0.povLayer:Find("Guide")) then
			setActive(arg_14_0.povLayer:Find("Guide"), false)
		end
	end)

	local var_14_1 = 32.4 / Screen.height

	arg_14_0:bind(var_0_0.ON_POV_STICK_VIEW, function(arg_27_0, arg_27_1)
		if arg_14_0.pinchMode then
			return
		end

		arg_27_1 = arg_27_1 * var_14_1

		local var_27_0 = arg_27_1.x
		local var_27_1 = arg_27_1.y

		local function var_27_2(arg_28_0, arg_28_1, arg_28_2)
			local var_28_0 = arg_28_0[arg_28_1]

			var_28_0.m_InputAxisValue = arg_28_2
			arg_28_0[arg_28_1] = var_28_0
		end

		if isActive(arg_14_0.cameras[var_0_0.CAMERA.POV]) then
			var_27_2(arg_14_0.compPovAim, "m_HorizontalAxis", var_27_0)
			var_27_2(arg_14_0.compPovAim, "m_VerticalAxis", var_27_1)
		elseif isActive(arg_14_0.cameras[var_0_0.CAMERA.PHOTO_FREE]) then
			local var_27_3 = arg_14_0.cameras[var_0_0.CAMERA.PHOTO_FREE]:Find("PhotoFree Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera)):GetCinemachineComponent(Cinemachine.CinemachineCore.Stage.Aim)

			var_27_2(var_27_3, "m_HorizontalAxis", var_27_0)
			var_27_2(var_27_3, "m_VerticalAxis", var_27_1)
		end
	end)

	local var_14_2 = {
		HideCharacterBylayer = true,
		EnableHeadIK = true,
		RevertCharacterBylayer = true
	}

	arg_14_0:bind(var_0_0.PHOTO_CALL, function(arg_29_0, arg_29_1, ...)
		if var_14_2[arg_29_1] then
			local var_29_0 = arg_14_0.ladyDict[arg_14_0.apartment:GetConfigID()]

			arg_14_0[arg_29_1](arg_14_0, var_29_0, ...)
		else
			local var_29_1 = arg_14_0.ladyDict[arg_14_0.apartment:GetConfigID()]

			arg_14_0[arg_29_1](var_29_1, ...)
		end
	end)
end

function var_0_0.RegisterIKFunc(arg_30_0)
	pg.IKMgr.GetInstance():RegisterOnIKLayerActive(function(arg_31_0)
		arg_30_0.blockIK = true
		arg_30_0.ikHandler = arg_31_0

		local var_31_0 = arg_30_0.ladyDict[arg_30_0.apartment:GetConfigID()]
		local var_31_1 = _.detect(var_31_0.readyIKLayers, function(arg_32_0)
			return arg_32_0:GetControllerPath() == arg_31_0.ikData:GetControllerPath()
		end)

		arg_30_0:EnableIKLayer(var_31_1)

		arg_30_0.ikNextCheckStamp = Time.time + var_0_0.IK_STATUS_DELTA

		arg_30_0:emit(var_0_0.ON_IK_STATUS_CHANGED, var_31_1:GetConfigID(), var_0_0.IK_STATUS.BEGIN)
	end)
	pg.IKMgr.GetInstance():RegisterOnIKLayerDrag(function(arg_33_0)
		arg_30_0.ikHandler = arg_33_0

		arg_30_0:ResetIKTipTimer()
	end)
	pg.IKMgr.GetInstance():RegisterOnIKLayerDeactive(function(arg_34_0, arg_34_1)
		local var_34_0 = arg_30_0.ladyDict[arg_30_0.apartment:GetConfigID()]
		local var_34_1 = _.detect(var_34_0.readyIKLayers, function(arg_35_0)
			return arg_35_0:GetControllerPath() == arg_34_0.ikData:GetControllerPath()
		end)

		arg_30_0:DeactiveIKLayer(var_34_1)

		arg_30_0.ikHandler = nil
		arg_30_0.blockIK = arg_34_1

		arg_30_0:emit(var_0_0.ON_IK_STATUS_CHANGED, var_34_1:GetConfigID(), var_0_0.IK_STATUS.RELEASE)
	end)
	pg.IKMgr.GetInstance():RegisterOnIKLayerAction(function(arg_36_0)
		arg_30_0.blockIK = nil

		local var_36_0 = arg_30_0.ladyDict[arg_30_0.apartment:GetConfigID()]
		local var_36_1 = _.detect(var_36_0.readyIKLayers, function(arg_37_0)
			return arg_37_0:GetControllerPath() == arg_36_0.ikData:GetControllerPath()
		end)

		arg_30_0:OnTriggerIK(var_36_1)
		arg_30_0:emit(var_0_0.ON_IK_STATUS_CHANGED, var_36_1:GetConfigID(), var_0_0.IK_STATUS.TRIGGER)
	end)
end

function var_0_0.initScene(arg_38_0)
	local var_38_0, var_38_1 = unpack(string.split(arg_38_0.dormSceneMgr.sceneInfo, "|"))
	local var_38_2 = SceneManager.GetSceneByName(var_38_0 .. "_base")

	arg_38_0:ResetSceneStructure(var_38_2)

	arg_38_0.mainCameraTF = GameObject.Find("BackYardMainCamera").transform
	arg_38_0.camBrain = arg_38_0.mainCameraTF:GetComponent(typeof(Cinemachine.CinemachineBrain))
	arg_38_0.camBrainEvenetHandler = arg_38_0.mainCameraTF:GetComponent(typeof(CameraBrainEventsHandler))
	arg_38_0.raycastCamera = arg_38_0.mainCameraTF:Find("CameraForRaycast"):GetComponent(typeof(Camera))
	arg_38_0.sceneRaycaster = arg_38_0.raycastCamera:GetComponent(typeof(UnityEngine.EventSystems.PhysicsRaycaster))
	arg_38_0.player = GameObject.Find("Player").transform
	arg_38_0.playerEye = arg_38_0.player:Find("Eye")
	arg_38_0.playerFoot = arg_38_0.player:Find("Foot")

	setActive(arg_38_0.playerFoot, false)

	arg_38_0.playerController = arg_38_0.player:GetComponent(typeof(UnityEngine.CharacterController))
	arg_38_0.attachedPoints = {}

	eachChild(arg_38_0.furnitures, function(arg_39_0)
		table.insert(arg_38_0.attachedPoints, 1, arg_39_0)
	end)

	arg_38_0.modelRoot = GameObject.Find("scene_root").transform
	arg_38_0.slotRoot = GameObject.Find("FurnitureSlots").transform

	setActive(arg_38_0.slotRoot, true)
	arg_38_0:InitSlots()

	arg_38_0.resTF = GameObject.Find("Res").transform

	tolua.loadassembly("Cinemachine")

	local var_38_3 = GameObject.Find("CM Cameras").transform

	eachChild(var_38_3, function(arg_40_0)
		setActive(arg_40_0, false)
	end)

	arg_38_0.camBrain.enabled = false
	arg_38_0.camBrain.enabled = true
	arg_38_0.cameraAim = var_38_3:Find("Aim Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))
	arg_38_0.cameraAim2 = var_38_3:Find("Aim2 Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))
	arg_38_0.cameraFree = nil
	arg_38_0.cameraFurnitureWatch = nil
	arg_38_0.cameraRole = var_38_3:Find("Role Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))
	arg_38_0.cameraRole2 = var_38_3:Find("Role2 Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))

	local var_38_4 = var_38_3:Find("Talk Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))

	arg_38_0.cameraGift = var_38_3:Find("Gift Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))
	arg_38_0.cameras = {
		arg_38_0.cameraAim,
		arg_38_0.cameraAim2,
		arg_38_0.cameraRole,
		[var_0_0.CAMERA.TALK] = var_38_4,
		[var_0_0.CAMERA.GIFT] = arg_38_0.cameraGift,
		[var_0_0.CAMERA.ROLE2] = arg_38_0.cameraRole2,
		[var_0_0.CAMERA.PHOTO] = var_38_3:Find("Photo Camera"):GetComponent(typeof(Cinemachine.CinemachineFreeLook)),
		[var_0_0.CAMERA.PHOTO_FREE] = var_38_3:Find("PhotoFree Controller"),
		[var_0_0.CAMERA.POV] = var_38_3:Find("FP Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))
	}

	setActive(arg_38_0.cameras[var_0_0.CAMERA.PHOTO_FREE]:Find("PhotoFree Camera"), true)

	arg_38_0.compPovAim = arg_38_0.cameras[var_0_0.CAMERA.POV]:GetCinemachineComponent(Cinemachine.CinemachineCore.Stage.Aim)
	arg_38_0.cameraRoot = var_38_3
	arg_38_0.POVOriginalFOV = arg_38_0:GetPOVFOV()
	arg_38_0.restrictedBox = GameObject.Find("RestrictedArea").transform

	setActive(arg_38_0.restrictedBox, false)

	arg_38_0.restrictedHeightRange = {
		arg_38_0.restrictedBox:Find("Floor").position.y,
		arg_38_0.restrictedBox:Find("Celling").position.y
	}
	arg_38_0.ladyInterest = GameObject.Find("InterestProxy").transform
	arg_38_0.daynightCtrlComp = GameObject.Find("[MainBlock]").transform:GetComponent(typeof(DayNightCtrl))

	arg_38_0:SwitchDayNight(arg_38_0.contextData.timeIndex)

	arg_38_0.tfCutIn = getSceneRootTFDic(SceneManager.GetSceneByName(var_38_0 .. "_base")).CutIn

	if arg_38_0.tfCutIn then
		arg_38_0.modelCutIn = {
			lady = arg_38_0.tfCutIn:Find("lady"):GetChild(0),
			player = arg_38_0.tfCutIn:Find("player"):GetChild(0)
		}

		setActive(arg_38_0.tfCutIn, false)
	end
end

function var_0_0.SwitchDayNight(arg_41_0, arg_41_1)
	if not IsNil(arg_41_0.daynightCtrlComp) then
		arg_41_0.daynightCtrlComp:SwitcherToIndex(arg_41_1 - 1)
	end

	arg_41_0:InitLightSettings()
end

function var_0_0.InitLightSettings(arg_42_0)
	arg_42_0.globalVolume = GameObject.Find("GlobalVolume")

	arg_42_0:RegisterGlobalVolume()

	arg_42_0.characterLight = GameObject.Find("CharacterLight")

	arg_42_0:RecordCharacterLight()

	local var_42_0 = GameObject.Find("[Lighting]").transform

	table.IpairsCArray(var_42_0:GetComponentsInChildren(typeof(Light), true), function(arg_43_0, arg_43_1)
		arg_43_1.shadows = UnityEngine.LightShadows.None
	end)
end

function var_0_0.ResetSceneStructure(arg_44_0, arg_44_1)
	table.IpairsCArray(arg_44_1:GetRootGameObjects(), function(arg_45_0, arg_45_1)
		if arg_45_1.name == "Furnitures" then
			arg_44_0.furnitures = tf(arg_45_1)

			eachChild(arg_44_0.furnitures, function(arg_46_0)
				if arg_46_0:Find("FreeLook Camera") then
					setActive(arg_46_0:Find("FreeLook Camera"), false)
				end

				if arg_46_0:Find("FreeLook Camera") then
					setActive(arg_46_0:Find("RoleWatch Camera"), false)
				end

				if arg_46_0:Find("IKCamera") then
					setActive(arg_46_0:Find("IKCamera"), false)
				end

				local var_46_0 = arg_46_0:GetComponent(typeof(UnityEngine.Collider))

				if not var_46_0 then
					return
				end

				var_46_0.enabled = false
			end)
		end
	end)

	arg_44_0.sectorsDic = arg_44_0.sectorsDic or {}

	if not arg_44_0.sectorsDic[arg_44_1.name] then
		arg_44_0.sectorsDic[arg_44_1.name] = table.shallowCopy(var_0_2[arg_44_1.name]) or {}

		setmetatable(arg_44_0.sectorsDic[arg_44_1.name], {
			__index = function(arg_47_0, arg_47_1)
				local var_47_0 = arg_44_0.furnitures:Find(arg_47_1 .. "/StayPoint")

				if var_47_0 then
					local var_47_1 = var_47_0.position
					local var_47_2 = var_47_0.eulerAngles

					arg_47_0[arg_47_1] = {
						Radius = 2,
						Angle = 120,
						Position = {
							var_47_1.x,
							var_47_1.y,
							var_47_1.z
						},
						Rotation = {
							var_47_2.x,
							var_47_2.y,
							var_47_2.z
						}
					}

					return arg_47_0[arg_47_1]
				else
					return nil
				end
			end
		})
	end

	arg_44_0.activeSectors = arg_44_0.sectorsDic[arg_44_1.name]
end

function var_0_0.InitSlots(arg_48_0)
	local var_48_0 = arg_48_0.room:GetSlots()
	local var_48_1 = arg_48_0.modelRoot:GetComponentsInChildren(typeof(Transform), true)

	arg_48_0.slotDict = {}

	_.each(var_48_0, function(arg_49_0)
		local var_49_0 = arg_49_0:GetFurnitureName()
		local var_49_1 = arg_49_0:GetConfigID()
		local var_49_2 = arg_48_0.slotRoot:Find(tostring(var_49_1))

		assert(var_49_2)

		local var_49_3 = {
			trans = var_49_2,
			sceneHides = {}
		}
		local var_49_4 = var_49_2:Find("Selector")

		if var_49_4 then
			GetOrAddComponent(var_49_4, typeof(EventTriggerListener)):AddPointClickFunc(function(arg_50_0, arg_50_1)
				arg_48_0:emit(Dorm3dRoomMediator.ON_CLICK_FURNITURE_SLOT, var_49_1)
			end)
			setActive(var_49_4, false)
		end

		local var_49_5

		for iter_49_0 = 0, var_48_1.Length - 1 do
			local var_49_6 = var_48_1[iter_49_0]

			if var_49_6.name == var_49_0 then
				var_49_5 = var_49_6

				break
			end
		end

		if var_49_5 then
			var_49_3.model = var_49_5
		end

		arg_48_0.slotDict[var_49_1] = var_49_3
	end)
end

function var_0_0.SetContactStateDic(arg_51_0, arg_51_1)
	arg_51_0.contactStateDic = arg_51_1
	arg_51_0.hideContactStateDic = {}
	arg_51_0.contactInRangeDic = {}

	for iter_51_0, iter_51_1 in pairs(arg_51_0.contactStateDic) do
		arg_51_0.hideContactStateDic[iter_51_0] = math.min(iter_51_1, ApartmentRoom.ITEM_UNLOCK)
		arg_51_0.contactInRangeDic[iter_51_0] = false
	end

	arg_51_0:ActiveContact()
end

function var_0_0.TempHideContact(arg_52_0, arg_52_1)
	arg_52_0.hideConcatFlag = arg_52_1

	arg_52_0:ActiveContact()
end

function var_0_0.ActiveContact(arg_53_0)
	for iter_53_0, iter_53_1 in pairs(arg_53_0.contactInRangeDic) do
		arg_53_0:UpdateContactDisplay(iter_53_0, arg_53_0.contactInRangeDic[iter_53_0] and not arg_53_0.hideConcatFlag and arg_53_0.contactStateDic[iter_53_0] or arg_53_0.hideContactStateDic[iter_53_0])
	end
end

function var_0_0.UpdateContactDisplay(arg_54_0, arg_54_1, arg_54_2)
	local var_54_0 = pg.dorm3d_collection_template[arg_54_1]

	for iter_54_0, iter_54_1 in ipairs(var_54_0.vfx_prefab) do
		local var_54_1 = arg_54_0.modelRoot:Find(iter_54_1)

		if arg_54_0:IsModeInHidePending(iter_54_1) then
			-- block empty
		elseif not arg_54_0.modelRoot:Find(iter_54_1) then
			warning(arg_54_1, iter_54_1)
		else
			setActive(var_54_1, arg_54_2 == ApartmentRoom.ITEM_FIRST)
		end
	end

	for iter_54_2, iter_54_3 in ipairs(var_54_0.model) do
		if arg_54_0:IsModeInHidePending(iter_54_3) then
			-- block empty
		elseif not arg_54_0.modelRoot:Find(iter_54_3) then
			warning(arg_54_1, iter_54_3)
		else
			local var_54_2 = arg_54_0.modelRoot:Find(iter_54_3)

			if arg_54_0:CheckSceneItemActive(var_54_2) then
				local var_54_3 = GetComponent(var_54_2, typeof(EventTriggerListener))

				if arg_54_2 == ApartmentRoom.ITEM_FIRST then
					var_54_3 = var_54_3 or GetOrAddComponent(var_54_2, typeof(EventTriggerListener))

					var_54_3:AddPointClickFunc(function(arg_55_0, arg_55_1)
						arg_54_0:emit(var_0_0.CLICK_CONTACT, arg_54_1)
					end)

					var_54_3.enabled = true
				elseif var_54_3 then
					var_54_3.enabled = false
				end

				setActive(var_54_2, arg_54_2 > ApartmentRoom.ITEM_LOCK)
			end
		end
	end
end

function var_0_0.SetFloatEnable(arg_56_0, arg_56_1)
	arg_56_0.enableFloatUpdate = arg_56_1

	if arg_56_1 then
		arg_56_0.ladyDict[arg_56_0.apartment:GetConfigID()]:UpdateFloatPosition()
	end
end

function var_0_0.UpdateFloatPosition(arg_57_0)
	local var_57_0 = arg_57_0.ladyDict[arg_57_0.apartment:GetConfigID()]
	local var_57_1 = arg_57_0:GetScreenPosition(var_57_0.ladyHeadCenter.position + Vector3(0, 0.2, 0))
	local var_57_2 = arg_57_0:GetLocalPosition(var_57_1, arg_57_0.rtFloatPage)

	setLocalPosition(arg_57_0.rtFloatPage:Find("lady"), var_57_2)
end

function var_0_0.LoadCharacter(arg_58_0, arg_58_1, arg_58_2)
	arg_58_0.hxMatDict = {}
	arg_58_0.ladyDict = {}
	arg_58_0.skinDict = {}

	local var_58_0 = {}

	for iter_58_0, iter_58_1 in ipairs(arg_58_1) do
		local var_58_1 = setmetatable({}, {
			__index = arg_58_0
		})

		arg_58_0.ladyDict[iter_58_1] = var_58_1

		local var_58_2 = getProxy(ApartmentProxy):getApartment(iter_58_1)
		local var_58_3 = var_58_2:getConfig("asset_name")
		local var_58_4 = var_58_2:GetSkinModelID(arg_58_0.room:getConfig("tag"))
		local var_58_5 = pg.dorm3d_resource[var_58_4].model_id

		assert(var_58_5)

		for iter_58_2, iter_58_3 in ipairs({
			"common",
			var_58_5
		}) do
			local var_58_6 = string.format("dorm3d/character/%s/res/%s", var_58_3, iter_58_3)

			if checkABExist(var_58_6) then
				table.insert(var_58_0, function(arg_59_0)
					arg_58_0.loader:LoadBundle(var_58_6, function(arg_60_0)
						for iter_60_0, iter_60_1 in ipairs(arg_60_0:GetAllAssetNames()) do
							local var_60_0, var_60_1, var_60_2 = string.find(iter_60_1, "material_hx[/\\](.*).mat")

							if var_60_0 then
								arg_58_0.hxMatDict[var_60_2] = {
									arg_60_0,
									iter_60_1
								}
							end
						end

						arg_59_0()
					end)
				end)
			end
		end

		var_58_1.skinId = var_58_4
		var_58_1.skinIdList = {
			var_58_4
		}

		table.insert(var_58_0, function(arg_61_0)
			local var_61_0 = string.format("dorm3d/character/%s/prefabs/%s", var_58_3, var_58_5)

			arg_58_0.loader:GetPrefab(var_61_0, "", function(arg_62_0)
				var_58_1.ladyGameobject = arg_62_0
				arg_58_0.skinDict[var_58_4] = {
					ladyGameobject = arg_62_0
				}

				arg_61_0()
			end)
		end)

		if arg_58_0.room:isPersonalRoom() then
			local var_58_7 = var_58_2:GetSkinModelID("touch")

			if var_58_7 then
				local var_58_8 = pg.dorm3d_resource[var_58_7].model_id

				if #var_58_8 > 0 then
					table.insert(var_58_1.skinIdList, var_58_7)
					table.insert(var_58_0, function(arg_63_0)
						local var_63_0 = string.format("dorm3d/character/%s/prefabs/%s", var_58_3, var_58_8)

						arg_58_0.loader:GetPrefab(var_63_0, "", function(arg_64_0)
							arg_58_0.skinDict[var_58_7] = {
								ladyGameobject = arg_64_0
							}
							GetComponent(arg_64_0, "GraphOwner").enabled = false

							onNextTick(function()
								setActive(arg_64_0, false)
							end)
							arg_63_0()
						end)
					end)
				end
			end
		end

		if arg_58_0.contextData.pendingDic[iter_58_1] then
			local var_58_9 = pg.dorm3d_welcome[arg_58_0.contextData.pendingDic[iter_58_1]]

			if var_58_9.item_prefab ~= "" then
				table.insert(var_58_0, function(arg_66_0)
					local var_66_0 = string.lower("dorm3d/furniture/item/" .. var_58_9.item_prefab)

					arg_58_0.loader:GetPrefab(var_66_0, "", function(arg_67_0)
						var_58_1.tfPendintItem = arg_67_0.transform

						onNextTick(function()
							setActive(arg_67_0, false)
						end)
						arg_66_0()
					end)
				end)
			end
		end
	end

	parallelAsync(var_58_0, arg_58_2)
end

function var_0_0.HXCharacter(arg_69_0, arg_69_1)
	if not HXSet.isHx() then
		return
	end

	local var_69_0 = arg_69_1:GetComponentsInChildren(typeof(SkinnedMeshRenderer), true)

	table.IpairsCArray(var_69_0, function(arg_70_0, arg_70_1)
		local var_70_0 = arg_70_1.sharedMaterials
		local var_70_1 = false

		table.IpairsCArray(var_70_0, function(arg_71_0, arg_71_1)
			if arg_71_1 == nil then
				return
			end

			local var_71_0 = arg_71_1.name

			if not arg_69_0.hxMatDict[var_71_0] then
				return
			end

			var_70_1 = true

			local var_71_1, var_71_2 = unpack(arg_69_0.hxMatDict[var_71_0])
			local var_71_3 = var_71_1:LoadAssetSync(var_71_2, typeof(Material), false, false)

			var_70_0[arg_71_0] = var_71_3

			warning("Replace HX Material", arg_69_0.hxMatDict[var_71_0][2])
		end)

		if var_70_1 then
			arg_70_1.sharedMaterials = var_70_0
		end
	end)
end

function var_0_0.InitCharacter(arg_72_0, arg_72_1, arg_72_2)
	arg_72_1.lady = arg_72_1.ladyGameobject.transform

	arg_72_1.lady:SetParent(arg_72_1.mainCameraTF)
	arg_72_1.lady:SetParent(nil)

	arg_72_1.ladyHeadIKComp = arg_72_1.lady:GetComponent(typeof(HeadAimIK))
	arg_72_1.ladyHeadIKComp.AimTarget = arg_72_1.mainCameraTF:Find("AimTarget")
	arg_72_1.ladyHeadIKData = {
		DampTime = arg_72_1.ladyHeadIKComp.DampTime,
		blinkSpeed = arg_72_1.ladyHeadIKComp.blinkSpeed,
		BodyWeight = arg_72_1.ladyHeadIKComp.BodyWeight,
		HeadWeight = arg_72_1.ladyHeadIKComp.HeadWeight
	}

	local var_72_0 = {}

	table.Foreach(var_0_1, function(arg_73_0, arg_73_1)
		var_72_0[arg_73_1] = arg_73_0
	end)

	arg_72_1.ladyAnimator = arg_72_1.lady:GetComponent(typeof(Animator))
	arg_72_1.ladyAnimBaseLayerIndex = arg_72_1.ladyAnimator:GetLayerIndex("Base Layer")
	arg_72_1.ladyAnimFaceLayerIndex = arg_72_1.ladyAnimator:GetLayerIndex("Face")
	arg_72_1.ladyBoneMaps = {}

	local var_72_1 = arg_72_1.lady:GetComponentsInChildren(typeof(Transform), true)

	table.IpairsCArray(var_72_1, function(arg_74_0, arg_74_1)
		if arg_74_1.name == "BodyCollider" then
			arg_72_1.ladyCollider = arg_74_1

			setActive(arg_74_1, true)
		elseif arg_74_1.name == "SafeCollider" then
			arg_72_1.ladySafeCollider = arg_74_1

			setActive(arg_74_1, false)
		elseif arg_74_1.name == "Interest" then
			arg_72_1.ladyInterestRoot = arg_74_1
		elseif arg_74_1.name == "Head Center" then
			arg_72_1.ladyHeadCenter = arg_74_1
		end

		if var_72_0[arg_74_1.name] then
			arg_72_1.ladyBoneMaps[var_72_0[arg_74_1.name]] = arg_74_1
		end
	end)

	arg_72_1.ladyColliders = {}
	arg_72_1.ladyTouchColliders = {}

	table.IpairsCArray(arg_72_1.lady:GetComponentsInChildren(typeof(UnityEngine.Collider), true), function(arg_75_0, arg_75_1)
		if arg_75_1:GetType():Equals(typeof(UnityEngine.MeshCollider)) then
			return
		end

		child = tf(arg_75_1)

		local var_75_0 = child.name
		local var_75_1 = var_75_0 and string.find(var_75_0, "Collider") or -1

		if var_75_1 <= 0 then
			errorMsg("Wrong Name to lady Collider : " .. var_75_0)

			return
		end

		local var_75_2 = string.sub(var_75_0, 1, var_75_1 - 1)

		if var_0_0.BONE_TO_TOUCH[var_75_2] == nil then
			return
		end

		arg_72_1.ladyColliders[var_75_2] = child

		table.insert(arg_72_1.ladyTouchColliders, child)
		setActive(child, false)
	end)
	arg_72_1:HXCharacter(arg_72_1.lady)
	;(function()
		local var_76_0 = "dorm3d/effect/prefab/function/vfx_function_aixin02"
		local var_76_1 = "vfx_function_aixin02"

		arg_72_1.loader:GetPrefab(var_76_0, var_76_1, function(arg_77_0)
			arg_72_1.effectHeart = arg_77_0

			setActive(arg_77_0, false)
			onNextTick(function()
				setParent(arg_72_1.effectHeart, arg_72_1.ladyHeadCenter)
			end)
		end)
	end)()

	arg_72_1.clothComps = {}
	arg_72_1.ladyClothCompSettings = {}

	table.IpairsCArray(arg_72_1.lady:GetComponentsInChildren(typeof("MagicaCloth.BaseCloth"), true), function(arg_79_0, arg_79_1)
		table.insert(arg_72_1.clothComps, arg_79_1)

		arg_72_1.ladyClothCompSettings[arg_79_1] = {
			enabled = arg_79_1.enabled
		}
	end)

	arg_72_1.clothColliderDict = {}
	arg_72_1.ladyClothColliderSettings = {}

	local var_72_2 = typeof("MagicaCloth.MagicaCapsuleCollider")

	table.IpairsCArray(arg_72_1.lady:GetComponentsInChildren(var_72_2, true), function(arg_80_0, arg_80_1)
		arg_72_1.clothColliderDict[arg_80_1.name] = arg_80_1
		arg_72_1.ladyClothColliderSettings[arg_80_1] = {
			enabled = arg_80_1.enabled,
			StartRadius = ReflectionHelp.RefGetProperty(var_72_2, "StartRadius", arg_80_1),
			EndRadius = ReflectionHelp.RefGetProperty(var_72_2, "EndRadius", arg_80_1)
		}
	end)
	arg_72_1:EnableCloth(arg_72_1, false)

	arg_72_1.ladyIKRoot = arg_72_1.lady:Find("IKLayers")

	eachChild(arg_72_1.ladyIKRoot, function(arg_81_0)
		setActive(arg_81_0, false)
	end)
	GetComponent(arg_72_1.lady, typeof(EventTriggerListener)):AddPointClickFunc(function(arg_82_0, arg_82_1)
		if arg_82_1.rawPointerPress.transform == arg_72_1.ladyCollider then
			arg_72_1:emit(var_0_0.CLICK_CHARACTER, arg_72_2)
		else
			local var_82_0 = table.keyof(arg_72_1.IKSettings.Colliders, arg_82_1.rawPointerPress.transform)

			arg_72_1:emit(var_0_0.ON_TOUCH_CHARACTER, var_0_0.BONE_TO_TOUCH[var_82_0] or arg_82_1.rawPointerPress.name)
		end
	end)
	arg_72_1.ladyAnimator:GetComponent("DftAniEvent"):SetCommonEvent(function(arg_83_0)
		if arg_72_1.nowState and arg_83_0.animatorStateInfo:IsName(arg_72_1.nowState) then
			existCall(arg_72_1.stateCallback)

			return
		end

		local var_83_0 = arg_83_0.animatorStateInfo

		for iter_83_0, iter_83_1 in pairs(arg_72_1.animCallbacks) do
			if var_83_0:IsName(iter_83_0) then
				warning("Active", iter_83_0)

				local var_83_1 = table.removebykey(arg_72_1.animCallbacks, iter_83_0)

				existCall(var_83_1)

				return
			end
		end

		if arg_83_0.stringParameter ~= "" then
			arg_72_1:OnAnimationEvent(arg_83_0)
		end
	end)

	arg_72_1.animEventCallbacks = {}
	arg_72_1.animCallbacks = {}
end

function var_0_0.SwitchCharacterSkin(arg_84_0, arg_84_1, arg_84_2, arg_84_3, arg_84_4)
	local var_84_0 = arg_84_1.skinIdList

	assert(table.contains(var_84_0, arg_84_3))

	local var_84_1 = arg_84_0:GetCurrentAnim()
	local var_84_2 = arg_84_1.skinId
	local var_84_3 = arg_84_1.skinDict[var_84_2].ladyGameobject
	local var_84_4 = var_84_3.transform.position
	local var_84_5 = var_84_3.transform.rotation

	setActive(var_84_3, false)

	arg_84_1.skinId = arg_84_3

	setActive(arg_84_1.skinDict[arg_84_3].ladyGameobject, true)

	arg_84_1.ladyGameobject = arg_84_1.skinDict[arg_84_3].ladyGameobject
	arg_84_1.ladyCollider = nil

	arg_84_0:InitCharacter(arg_84_1, arg_84_2)
	arg_84_1.ladyAnimator:Play(var_84_1, arg_84_1.ladyAnimBaseLayerIndex)
	arg_84_1.ladyAnimator:Update(0)
	arg_84_1.lady:SetPositionAndRotation(var_84_4, var_84_5)
	existCall(arg_84_4)
end

function var_0_0.SetCameraLady(arg_85_0, arg_85_1)
	arg_85_0.cameraAim2.LookAt = arg_85_1.ladyInterestRoot
	arg_85_0.cameras[var_0_0.CAMERA.TALK].Follow = arg_85_0.ladyInterest
	arg_85_0.cameras[var_0_0.CAMERA.TALK].LookAt = arg_85_0.ladyInterest
	arg_85_0.cameraGift.Follow = arg_85_0.ladyInterest
	arg_85_0.cameraGift.LookAt = arg_85_0.ladyInterest
	arg_85_0.cameraRole2.LookAt = arg_85_1.ladyInterestRoot
	arg_85_0.cameras[var_0_0.CAMERA.PHOTO].Follow = arg_85_0.ladyInterest
	arg_85_0.cameras[var_0_0.CAMERA.PHOTO].LookAt = arg_85_0.ladyInterest
end

function var_0_0.initNodeCanvas(arg_86_0)
	local var_86_0 = pg.NodeCanvasMgr.GetInstance()

	var_86_0:Active()
	var_86_0:RegisterFunc("DistanceTrigger", function(arg_87_0)
		arg_86_0:emit(var_0_0.DISTANCE_TRIGGER, arg_87_0, arg_86_0.ladyDict[arg_87_0].dis)
	end)
	var_86_0:RegisterFunc("ShortWaitAction", function(arg_88_0)
		arg_86_0:DoShortWait(arg_88_0)
	end)
	var_86_0:RegisterFunc("WatchShortWaitAction", function(arg_89_0)
		arg_86_0:DoShortWait(arg_89_0)
	end)
	var_86_0:RegisterFunc("WalkDistanceTrigger", function(arg_90_0)
		arg_86_0:emit(var_0_0.WALK_DISTANCE_TRIGGER, arg_90_0, arg_86_0.ladyDict[arg_90_0].dis)
	end)
	var_86_0:RegisterFunc("ChangeWatch", function(arg_91_0)
		arg_86_0:emit(var_0_0.CHANGE_WATCH, arg_91_0)
	end)
end

function var_0_0.SetAllBlackbloardValue(arg_92_0, arg_92_1, arg_92_2)
	arg_92_0[arg_92_1] = arg_92_2

	for iter_92_0, iter_92_1 in pairs(arg_92_0.ladyDict) do
		arg_92_0:SetBlackboardValue(iter_92_1, arg_92_1, arg_92_2)
	end
end

function var_0_0.SetBlackboardValue(arg_93_0, arg_93_1, arg_93_2, arg_93_3)
	arg_93_1.blackboard = arg_93_1.blackboard or {}
	arg_93_1.blackboard[arg_93_2] = arg_93_3

	pg.NodeCanvasMgr.GetInstance():SetBlackboradValue(arg_93_2, arg_93_3, arg_93_1.ladyBlackboard)
end

function var_0_0.GetBlackboardValue(arg_94_0, arg_94_1, arg_94_2)
	arg_94_1.blackboard = arg_94_1.blackboard or {}

	return arg_94_1.blackboard[arg_94_2]
end

function var_0_0.didEnter(arg_95_0)
	local var_95_0 = -21.6 / Screen.height

	arg_95_0.joystickDelta = Vector2.zero
	arg_95_0.joystickTimer = FrameTimer.New(function()
		local var_96_0 = arg_95_0.joystickDelta * var_95_0
		local var_96_1 = var_96_0.x
		local var_96_2 = var_96_0.y

		local function var_96_3(arg_97_0, arg_97_1, arg_97_2)
			local var_97_0 = arg_97_0[arg_97_1]

			var_97_0.m_InputAxisValue = arg_97_2
			arg_97_0[arg_97_1] = var_97_0
		end

		if arg_95_0.surroudCamera and not arg_95_0.pinchMode then
			var_96_3(arg_95_0.surroudCamera, "m_XAxis", var_96_1)
			var_96_3(arg_95_0.surroudCamera, "m_YAxis", var_96_2)
		elseif arg_95_0.furniturePOV and arg_95_0.cameras[var_0_0.CAMERA.FURNITURE_WATCH] and isActive(arg_95_0.cameras[var_0_0.CAMERA.FURNITURE_WATCH]) then
			var_96_3(arg_95_0.furniturePOV, "m_HorizontalAxis", var_96_1)
			var_96_3(arg_95_0.furniturePOV, "m_VerticalAxis", var_96_2)
		end

		arg_95_0.joystickDelta = Vector2.zero
	end, 1, -1)

	arg_95_0.joystickTimer:Start()

	local var_95_1 = 1.75

	arg_95_0.moveStickTimer = FrameTimer.New(function()
		if not arg_95_0.moveStickDraging then
			return
		end

		local var_98_0 = arg_95_0.moveStickPosition
		local var_98_1 = 200
		local var_98_2 = (var_98_0 - arg_95_0.moveStickOrigin):ClampMagnitude(var_98_1)
		local var_98_3 = var_98_2 / var_98_1

		arg_95_0.moveStickPosition = arg_95_0.moveStickOrigin + var_98_2

		local var_98_4 = Vector3.New(var_98_3.x, 0, var_98_3.y)
		local var_98_5 = arg_95_0.mainCameraTF:TransformDirection(var_98_4)

		var_98_5.y = 0

		local var_98_6 = var_98_5:Normalize()

		var_98_6:Mul(var_95_1)

		if isActive(arg_95_0.cameras[var_0_0.CAMERA.POV]) then
			arg_95_0.playerController:SimpleMove(var_98_6)

			arg_95_0.tweenFOV = true
		elseif isActive(arg_95_0.cameras[var_0_0.CAMERA.PHOTO_FREE]) then
			arg_95_0.cameras[var_0_0.CAMERA.PHOTO_FREE]:GetComponent(typeof(UnityEngine.CharacterController)):Move(var_98_6 * Time.deltaTime)
			arg_95_0:emit(Dorm3dPhotoMediator.CAMERA_STICK_MOVE, var_98_3:Normalize())
			onNextTick(function()
				local var_99_0 = arg_95_0.cameras[var_0_0.CAMERA.PHOTO_FREE]
				local var_99_1 = math.InverseLerp(arg_95_0.restrictedHeightRange[1], arg_95_0.restrictedHeightRange[2], var_99_0.position.y)

				arg_95_0:emit(Dorm3dPhotoMediator.CAMERA_LIFT_CHANGED, var_99_1)
			end)
		end
	end, 1, -1)

	arg_95_0.moveStickTimer:Start()

	arg_95_0.pinchMode = false
	arg_95_0.pinchSize = 0
	arg_95_0.pinchValue = 1
	arg_95_0.pinchNodeOrder = 1

	GlobalClickEventMgr.Inst:AddBeginPinchFunc(function(arg_100_0, arg_100_1)
		if arg_95_0.surroudCamera and isActive(arg_95_0.surroudCamera) then
			arg_95_0.pinchMode = true
			arg_95_0.pinchSize = (arg_100_0 - arg_100_1):Magnitude()
			arg_95_0.pinchNodeOrder = arg_100_1.x < arg_100_0.x and -1 or 1

			return
		end

		if isActive(arg_95_0.cameras[var_0_0.CAMERA.POV]) then
			if (arg_100_0 - arg_100_1):Magnitude() < Screen.height * 0.5 then
				arg_95_0.pinchMode = true
				arg_95_0.pinchSize = (arg_100_0 - arg_100_1):Magnitude()
				arg_95_0.pinchNodeOrder = arg_100_1.x < arg_100_0.x and -1 or 1
			end

			return
		end
	end)

	local var_95_2 = 0.01

	if IsUnityEditor then
		var_95_2 = 0.1
	end

	local var_95_3 = var_95_2 * 1080 / Screen.height

	GlobalClickEventMgr.Inst:AddPinchFunc(function(arg_101_0, arg_101_1)
		if not arg_95_0.pinchMode then
			return
		end

		local var_101_0 = (arg_101_0 - arg_101_1):Magnitude()
		local var_101_1 = arg_95_0.pinchSize - var_101_0
		local var_101_2 = arg_95_0.pinchNodeOrder * (arg_101_1.x < arg_101_0.x and -1 or 1)
		local var_101_3 = var_101_1 * var_95_3 * var_101_2

		if isActive(arg_95_0.cameras[var_0_0.CAMERA.POV]) then
			local var_101_4 = 0.5
			local var_101_5 = 1

			arg_95_0.pinchValue = math.clamp(arg_95_0.pinchValue + var_101_3, var_101_4, var_101_5)
			arg_95_0.pinchSize = var_101_0

			arg_95_0:SetPOVFOV(arg_95_0.POVOriginalFOV * arg_95_0.pinchValue)

			arg_95_0.tweenFOV = nil

			return
		end

		if isActive(arg_95_0.surroudCamera) and arg_95_0.surroudCamera == arg_95_0.cameras[var_0_0.CAMERA.PHOTO] then
			local var_101_6 = 0.5
			local var_101_7 = 1

			arg_95_0:SetPinchValue(math.clamp(arg_95_0.pinchValue + var_101_3, var_101_6, var_101_7))

			arg_95_0.pinchSize = var_101_0

			return
		end
	end)
	GlobalClickEventMgr.Inst:AddEndPinchFunc(function()
		arg_95_0.pinchMode = false
		arg_95_0.pinchSize = 0
	end)

	arg_95_0.cameraBlendCallbacks = {}
	arg_95_0.activeCMCamera = nil

	function arg_95_0.camBrainEvenetHandler.OnBlendStarted(arg_103_0)
		if arg_95_0.activeCMCamera then
			arg_95_0:OnCameraBlendFinished(arg_95_0.activeCMCamera)
		end

		local var_103_0 = arg_95_0.camBrain.ActiveVirtualCamera

		arg_95_0.activeCMCamera = var_103_0
	end

	function arg_95_0.camBrainEvenetHandler.OnBlendFinished(arg_104_0)
		arg_95_0.activeCMCamera = nil

		arg_95_0:OnCameraBlendFinished(arg_104_0)
	end

	for iter_95_0, iter_95_1 in pairs(arg_95_0.ladyDict) do
		if iter_95_1.tfPendintItem then
			onNextTick(function()
				setParent(iter_95_1.tfPendintItem, iter_95_1.lady)
			end)
		end

		iter_95_1.ladyOwner = GetComponent(iter_95_1.lady, "GraphOwner")
		iter_95_1.ladyBlackboard = GetComponent(iter_95_1.lady, "Blackboard")

		arg_95_0:SetBlackboardValue(iter_95_1, "groupId", iter_95_0)
		onNextTick(function()
			iter_95_1.ladyOwner.enabled = true
		end)
	end

	arg_95_0.expressionDict = {}

	pg.UIMgr.GetInstance():OverlayPanel(arg_95_0.blockLayer, {
		weight = LayerWeightConst.SECOND_LAYER,
		groupName = LayerWeightConst.GROUP_DORM3D
	})
	arg_95_0:ActiveCamera(arg_95_0.cameras[var_0_0.CAMERA.POV])

	local var_95_4
	local var_95_5
	local var_95_6 = arg_95_0.resumeCallback

	function arg_95_0.resumeCallback()
		var_95_5 = true

		if var_95_4 then
			existCall(var_95_6)
		end
	end

	arg_95_0:RefreshSlots(nil, function()
		var_95_4 = true

		if var_95_5 then
			existCall(var_95_6)
		end
	end)

	arg_95_0.updateHandler = UpdateBeat:CreateListener(function()
		xpcall(function()
			arg_95_0:Update()
		end, function(...)
			errorMsg(debug.traceback(...))
		end)
	end)

	UpdateBeat:AddListener(arg_95_0.updateHandler)
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

				if var_117_0 then
					local var_117_1 = arg_117_0.ikConfig

					UIItemList.StaticAlign(arg_114_0.ikTipsRoot, arg_114_0.ikTipsRoot:GetChild(0), #arg_117_0.readyIKLayers, function(arg_120_0, arg_120_1, arg_120_2)
						if arg_120_0 ~= UIItemList.EventUpdate then
							return
						end

						arg_120_1 = arg_120_1 + 1

						local var_120_0
						local var_120_1 = Vector2.zero
						local var_120_2 = arg_117_0.readyIKLayers[arg_120_1]
						local var_120_3 = var_120_2:GetTriggerBoneName()
						local var_120_4 = var_120_3 and arg_117_0.IKSettings.Colliders[var_120_3] or nil
						local var_120_5 = var_120_2:GetIKTipOffset()

						if var_120_4 then
							local function var_120_6()
								local var_121_0 = arg_117_0.IKSettings.CameraRaycaster.eventCamera:WorldToScreenPoint(var_120_4.position)
								local var_121_1 = CameraMgr.instance:Raycast(arg_117_0.IKSettings.CameraRaycaster, var_121_0)

								if var_121_1.Length == 0 then
									return
								end

								return var_120_4 == var_121_1[0].gameObject.transform
							end
						end

						if var_120_4 then
							local var_120_7 = var_120_4.position
							local var_120_8 = var_120_4:GetComponent(typeof(UnityEngine.Collider))

							if var_120_8 then
								var_120_7 = var_120_8.bounds.center
							end

							local var_120_9 = arg_114_0:GetLocalPosition(arg_114_0:GetScreenPosition(var_120_7, arg_117_0.IKSettings.CameraRaycaster.eventCamera), arg_114_0.ikTipsRoot) + var_120_5

							setLocalPosition(arg_120_2, var_120_9)

							local var_120_10 = var_120_2:GetTriggerRect()
							local var_120_11 = var_120_10:PointToNormalized(Vector2.zero)
							local var_120_12 = Vector2.zero

							if var_120_11.x < 0.5 and var_120_11.y < 0.5 then
								var_120_12 = var_120_10.max
							elseif var_120_11.x >= 0.5 and var_120_11.y < 0.5 then
								var_120_12 = Vector2.New(var_120_10.xMin, var_120_10.yMax)
							elseif var_120_11.x < 0.5 and var_120_11.y >= 0.5 then
								var_120_12 = Vector2.New(var_120_10.xMax, var_120_10.yMin)
							elseif var_120_11.x >= 0.5 and var_120_11.y >= 0.5 then
								var_120_12 = var_120_10.min
							end

							if var_120_11.x == 0.5 then
								if var_120_9.x < 0 then
									var_120_12.x = var_120_10.xMax
								else
									var_120_12.x = var_120_10.xMin
								end
							end

							if var_120_11.y == 0.5 then
								if var_120_9.y < 0 then
									var_120_12.y = var_120_10.yMax
								else
									var_120_12.y = var_120_10.yMin
								end
							end

							local var_120_13 = var_120_12 - var_120_10.center

							setLocalRotation(arg_120_2, Quaternion.LookRotation(Vector3.forward, Vector3.New(var_120_13.x, var_120_13.y, 0)))
						end

						setActive(arg_120_2, var_120_4)
					end)
					UIItemList.StaticAlign(arg_114_0.ikClickTipsRoot, arg_114_0.ikClickTipsRoot:GetChild(0), #var_117_1.touch_data, function(arg_122_0, arg_122_1, arg_122_2)
						if arg_122_0 ~= UIItemList.EventUpdate then
							return
						end

						arg_122_1 = arg_122_1 + 1

						local var_122_0
						local var_122_1 = Vector2.zero
						local var_122_2 = arg_122_1
						local var_122_3 = var_117_1.touch_data[var_122_2][1]
						local var_122_4 = pg.dorm3d_ik_touch[var_122_3]

						if #var_122_4.scene_item > 0 then
							var_122_0 = arg_114_0:GetSceneItem(var_122_4.scene_item)
						else
							var_122_0 = arg_117_0.IKSettings.Colliders[var_122_4.body]
						end

						if var_122_0 then
							local var_122_5 = var_122_0.position
							local var_122_6 = var_122_0:GetComponent(typeof(UnityEngine.Collider))

							if var_122_6 then
								var_122_5 = var_122_6.bounds.center
							end

							setLocalPosition(arg_122_2, arg_114_0:GetLocalPosition(arg_114_0:GetScreenPosition(var_122_5, arg_117_0.IKSettings.CameraRaycaster.eventCamera), arg_114_0.ikClickTipsRoot) + var_122_1)
						end

						setActive(arg_122_2, var_122_0)
					end)
				end

				setActive(arg_114_0.ikTipsRoot, var_117_0)
				setActive(arg_114_0.ikClickTipsRoot, var_117_0)
				setActive(arg_114_0.ikTextTipsRoot, var_117_0)
			end
		end)(arg_114_0.ladyDict[arg_114_0.apartment:GetConfigID()])
	end
end

function var_0_0.CheckInSector(arg_123_0)
	if not isActive(arg_123_0.cameras[var_0_0.CAMERA.POV]) then
		return
	end

	local var_123_0 = arg_123_0.mainCameraTF.position

	var_123_0.y = 0

	for iter_123_0, iter_123_1 in pairs(arg_123_0.ladyDict) do
		local var_123_1 = tobool(arg_123_0.activeLady[iter_123_0])

		if var_123_1 ~= tobool(var_0_0.IsPointInSector(arg_123_0.activeSectors[iter_123_1.ladyActiveZone], var_123_0)) then
			arg_123_0.activeLady[iter_123_0] = not var_123_1

			arg_123_0:emit(var_0_0.ON_ENTER_SECTOR, iter_123_0)
		end
	end
end

function var_0_0.TriggerLadyDistance(arg_124_0)
	for iter_124_0, iter_124_1 in pairs(arg_124_0.ladyDict) do
		iter_124_1.dis = (iter_124_1.lady.position - arg_124_0.player.position).magnitude

		if (arg_124_0:GetBlackboardValue(iter_124_1, "inPending") and var_0_0.POV_PENDING_CLOSE_DISTANCE or var_0_0.POV_CLOSE_DISTANCE) > iter_124_1.dis ~= arg_124_0:GetBlackboardValue(iter_124_1, "inDistance") then
			arg_124_0:SetBlackboardValue(iter_124_1, "inDistance", iter_124_1.dis < var_0_0.POV_CLOSE_DISTANCE)
			arg_124_0:emit(var_0_0.ON_CHANGE_DISTANCE, iter_124_0, iter_124_1.dis < var_0_0.POV_CLOSE_DISTANCE)
		end
	end
end

function var_0_0.OnStickMove(arg_125_0, arg_125_1)
	arg_125_0.joystickDelta = arg_125_1
end

function var_0_0.SetPinchValue(arg_126_0, arg_126_1)
	arg_126_0.pinchValue = arg_126_1

	arg_126_0:SetCameraObrits()
end

function var_0_0.GetPOVFOV(arg_127_0)
	local var_127_0 = arg_127_0.cameras[var_0_0.CAMERA.POV].m_Lens

	return ReflectionHelp.RefGetField(typeof("Cinemachine.LensSettings"), "FieldOfView", var_127_0)
end

function var_0_0.SetPOVFOV(arg_128_0, arg_128_1)
	local var_128_0 = arg_128_0.cameras[var_0_0.CAMERA.POV].m_Lens

	ReflectionHelp.RefSetField(typeof("Cinemachine.LensSettings"), "FieldOfView", var_128_0, arg_128_1)

	arg_128_0.cameras[var_0_0.CAMERA.POV].m_Lens = var_128_0
end

function var_0_0.RefreshSlots(arg_129_0, arg_129_1, arg_129_2)
	arg_129_1 = arg_129_1 or arg_129_0.room

	local var_129_0 = arg_129_1:GetSlots()
	local var_129_1 = arg_129_1:GetFurnitures()

	arg_129_0:emit(var_0_0.SHOW_BLOCK)
	table.ParallelIpairsAsync(var_129_0, function(arg_130_0, arg_130_1, arg_130_2)
		local var_130_0 = arg_130_1:GetConfigID()
		local var_130_1 = _.detect(var_129_1, function(arg_131_0)
			return arg_131_0:GetSlotID() == var_130_0
		end)
		local var_130_2 = var_130_1 and var_130_1:GetModel() or false
		local var_130_3 = arg_129_0.slotDict[var_130_0].model

		arg_129_0.slotDict[var_130_0].displayModelName = var_130_2
		arg_129_0.slotDict[var_130_0].furnitureId = var_130_1 and var_130_1:GetConfigID()

		local function var_130_4(arg_132_0)
			if var_130_3 then
				setActive(var_130_3, var_130_2 == "")
			end

			table.Foreach(arg_129_0.slotDict[var_130_0].sceneHides or {}, function(arg_133_0, arg_133_1)
				setActive(arg_133_1.trans, arg_133_1.visible)
			end)

			arg_129_0.slotDict[var_130_0].sceneHides = {}

			if arg_132_0 then
				local var_132_0 = arg_132_0:getConfig("scene_hides")

				if #var_132_0 > 0 then
					table.Ipairs(var_132_0, function(arg_134_0, arg_134_1)
						local var_134_0 = arg_129_0.modelRoot:Find(arg_134_1)

						assert(var_134_0, string.format("dorm3d_furniture_template:%d scene_hides missing scene item :%s", arg_132_0:GetConfigID(), arg_134_1))

						local var_134_1 = isActive(var_134_0)

						table.insert(arg_129_0.slotDict[var_130_0].sceneHides, {
							name = arg_134_1,
							trans = var_134_0,
							visible = var_134_1
						})
						setActive(var_134_0, false)
					end)
				end
			end
		end

		if var_130_2 == false or var_130_2 == "" then
			arg_129_0.loader:ClearRequest("slot_" .. var_130_0)
			var_130_4()
			arg_130_2()

			return
		end

		local var_130_5 = arg_129_0.slotDict[var_130_0].trans

		if arg_129_0.loader:GetLoadingRP("slot_" .. var_130_0) then
			arg_129_0:emit(var_0_0.HIDE_BLOCK)
		end

		arg_129_0.loader:GetPrefabBYStopLoading("dorm3d/furniture/prefabs/" .. var_130_2, "", function(arg_135_0)
			arg_130_2()
			assert(arg_135_0)
			setParent(arg_135_0, var_130_5)
			var_130_4(var_130_1)
		end, "slot_" .. var_130_0)
	end, function()
		arg_129_0:emit(var_0_0.HIDE_BLOCK)
		existCall(arg_129_2)
	end)
end

function var_0_0.CheckSceneItemActiveByPath(arg_137_0, arg_137_1)
	local var_137_0 = arg_137_0:GetSceneItem(arg_137_1)

	return arg_137_0:CheckSceneItemActive(var_137_0)
end

function var_0_0.CheckSceneItemActive(arg_138_0, arg_138_1)
	local var_138_0 = true
	local var_138_1

	table.Checkout(arg_138_0.slotDict, function(arg_139_0, arg_139_1)
		if underscore.detect(arg_139_1.sceneHides, function(arg_140_0)
			return arg_140_0.trans == arg_138_1
		end) then
			var_138_0 = false
			var_138_1 = arg_139_1.furnitureId

			return false
		end
	end)

	return var_138_0, var_138_1
end

function var_0_0.ChangeCharacterPosition(arg_141_0, arg_141_1)
	arg_141_0:ResetCharPoint(arg_141_1, arg_141_1.ladyActiveZone)
	arg_141_0:SyncInterestTransform(arg_141_1)
end

function var_0_0.SyncCurrentInterestTransform(arg_142_0)
	local var_142_0 = arg_142_0.ladyDict[arg_142_0.apartment:GetConfigID()]

	arg_142_0:SyncInterestTransform(var_142_0)
end

function var_0_0.SyncInterestTransform(arg_143_0, arg_143_1)
	arg_143_0.ladyInterest.position = arg_143_1.ladyInterestRoot.position
	arg_143_0.ladyInterest.rotation = arg_143_1.ladyInterestRoot.rotation
end

function var_0_0.ChangePlayerPosition(arg_144_0, arg_144_1)
	arg_144_1 = arg_144_1 or arg_144_0.contextData.inFurnitureName

	local var_144_0 = arg_144_0.furnitures:Find(arg_144_1):Find("PlayerPoint").position

	arg_144_0.player.position = var_144_0
	arg_144_0.cameras[var_0_0.CAMERA.POV].transform.position = arg_144_0.playerEye.position

	local var_144_1 = arg_144_0.ladyInterest.position - arg_144_0.playerEye.position
	local var_144_2 = Quaternion.LookRotation(var_144_1).eulerAngles
	local var_144_3 = var_144_2.y
	local var_144_4 = var_144_2.x
	local var_144_5 = arg_144_0.compPovAim.m_HorizontalAxis

	var_144_5.Value = arg_144_0:GetNearestAngle(var_144_3, var_144_5.m_MinValue, var_144_5.m_MaxValue)
	arg_144_0.compPovAim.m_HorizontalAxis = var_144_5

	local var_144_6 = arg_144_0.compPovAim.m_VerticalAxis

	var_144_6.Value = var_144_4
	arg_144_0.compPovAim.m_VerticalAxis = var_144_6
end

function var_0_0.GetAttachedFurnitureName(arg_145_0)
	return arg_145_0.contextData.inFurnitureName
end

function var_0_0.GetFurnitureByName(arg_146_0, arg_146_1)
	return underscore.detect(arg_146_0.attachedPoints, function(arg_147_0)
		return arg_147_0.name == arg_146_1
	end)
end

function var_0_0.GetSlotByID(arg_148_0, arg_148_1)
	return arg_148_0.displaySlots[arg_148_1] and arg_148_0.displaySlots[arg_148_1].trans
end

function var_0_0.GetScreenPosition(arg_149_0, arg_149_1, arg_149_2)
	arg_149_2 = arg_149_2 or arg_149_0.raycastCamera

	local var_149_0 = arg_149_2:WorldToScreenPoint(arg_149_1)

	if var_149_0.z < 0 then
		var_149_0.x = var_149_0.x + (var_149_0.x < 0 and -1 or 1) * Screen.width
		var_149_0.y = var_149_0.y + (var_149_0.y < 0 and -1 or 1) * Screen.height
		var_149_0.z = -var_149_0.z
	end

	return var_149_0
end

function var_0_0.GetLocalPosition(arg_150_0, arg_150_1, arg_150_2)
	return LuaHelper.ScreenToLocal(arg_150_2, arg_150_1, pg.UIMgr.GetInstance().uiCameraComp)
end

function var_0_0.GetModelRoot(arg_151_0)
	return arg_151_0.modelRoot
end

function var_0_0.ShiftZone(arg_152_0, arg_152_1, arg_152_2)
	local var_152_0 = arg_152_0:GetFurnitureByName(arg_152_1)

	if not var_152_0 then
		errorMsg(arg_152_1 .. " Not Find")
		existCall(arg_152_2)

		return
	end

	seriesAsync({
		function(arg_153_0)
			arg_152_0:emit(var_0_0.SHOW_BLOCK)
			arg_152_0:ShowBlackScreen(true, arg_153_0)
		end,
		function(arg_154_0)
			if arg_152_0.shiftLady or arg_152_0.room:isPersonalRoom() then
				local var_154_0 = arg_152_0.shiftLady or arg_152_0.apartment:GetConfigID()

				arg_152_0.shiftLady = nil
				arg_152_0.contextData.ladyZone[var_154_0] = var_152_0.name

				local var_154_1 = arg_152_0.ladyDict[var_154_0]

				var_154_1.ladyBaseZone = arg_152_0.contextData.ladyZone[var_154_0]
				var_154_1.ladyActiveZone = arg_152_0.contextData.ladyZone[var_154_0]

				if arg_152_0:GetBlackboardValue(var_154_1, "inPending") then
					arg_152_0:SetOutPending(var_154_1)
					arg_152_0:SwitchAnim(var_154_1, var_0_0.ANIM.IDLE)
					onNextTick(function()
						arg_152_0:ChangeCharacterPosition(var_154_1)
						arg_154_0()
					end)
				else
					arg_152_0:ChangeCharacterPosition(var_154_1)
					arg_154_0()
				end
			else
				arg_154_0()
			end
		end,
		function(arg_156_0)
			arg_152_0.contextData.inFurnitureName = var_152_0.name

			if not arg_152_0.apartment then
				for iter_156_0, iter_156_1 in pairs(arg_152_0.ladyDict) do
					if iter_156_1.ladyBaseZone == arg_152_0.contextData.inFurnitureName then
						arg_152_0:SyncInterestTransform(iter_156_1)

						break
					end
				end
			end

			arg_152_0:ChangePlayerPosition()
			arg_152_0:TriggerLadyDistance()
			arg_152_0:CheckInSector()
			arg_156_0()
		end,
		function(arg_157_0)
			arg_152_0:UpdateZoneList()
			arg_152_0:ShowBlackScreen(false, arg_157_0)
		end,
		function(arg_158_0)
			arg_152_0:emit(var_0_0.HIDE_BLOCK)
			arg_158_0()
		end
	}, arg_152_2)
end

function var_0_0.ActiveCamera(arg_159_0, arg_159_1)
	local var_159_0 = isActive(arg_159_1)

	table.Foreach(arg_159_0.cameras, function(arg_160_0, arg_160_1)
		setActive(arg_160_1, arg_160_1 == arg_159_1)
	end)

	if var_159_0 then
		arg_159_0:OnCameraBlendFinished(arg_159_1)
	end
end

function var_0_0.ShowBlackScreen(arg_161_0, arg_161_1, arg_161_2)
	local var_161_0 = arg_161_0.blackSceneInfo or {
		color = "#000000",
		time = 0.3,
		delay = arg_161_1 and 0 or 0.3
	}

	setImageColor(arg_161_0.blackLayer, Color.NewHex(var_161_0.color))
	setActive(arg_161_0.blackLayer, true)
	setCanvasGroupAlpha(arg_161_0.blackLayer, arg_161_1 and 0 or 1)
	arg_161_0:managedTween(LeanTween.alphaCanvas, function()
		if not arg_161_1 then
			setActive(arg_161_0.blackLayer, false)
		end

		existCall(arg_161_2)
	end, GetComponent(arg_161_0.blackLayer, typeof(CanvasGroup)), arg_161_1 and 1 or 0, var_161_0.time):setDelay(var_161_0.delay)
end

function var_0_0.RegisterOrbits(arg_163_0, arg_163_1)
	arg_163_0 = arg_163_0.scene
	arg_163_0.orbits = {
		original = arg_163_1.m_Orbits
	}
	arg_163_0.orbits.current = _.range(3):map(function(arg_164_0)
		local var_164_0 = arg_163_0.orbits.original[arg_164_0 - 1]

		return Cinemachine.CinemachineFreeLook.Orbit.New(var_164_0.m_Height, var_164_0.m_Radius)
	end)
	arg_163_0.surroudCamera = arg_163_1
end

function var_0_0.SetCameraObrits(arg_165_0)
	arg_165_0 = arg_165_0.scene

	local var_165_0 = arg_165_0.surroudCamera

	if not var_165_0 then
		return
	end

	local var_165_1 = arg_165_0.orbits.original[1]

	for iter_165_0 = 0, #arg_165_0.orbits.current - 1 do
		local var_165_2 = arg_165_0.orbits.current[iter_165_0 + 1]
		local var_165_3 = arg_165_0.orbits.original[iter_165_0]

		var_165_2.m_Height = math.lerp(var_165_1.m_Height, var_165_3.m_Height, arg_165_0.pinchValue)
		var_165_2.m_Radius = var_165_3.m_Radius * arg_165_0.pinchValue
	end

	var_165_0.m_Orbits = arg_165_0.orbits.current
end

function var_0_0.RevertCameraOrbit(arg_166_0)
	arg_166_0 = arg_166_0.scene

	local var_166_0 = arg_166_0.surroudCamera

	if not var_166_0 then
		return
	end

	for iter_166_0 = 0, #arg_166_0.orbits.current - 1 do
		local var_166_1 = arg_166_0.orbits.current[iter_166_0 + 1]
		local var_166_2 = arg_166_0.orbits.original[iter_166_0]

		var_166_1.m_Height = var_166_2.m_Height
		var_166_1.m_Radius = var_166_2.m_Radius
	end

	var_166_0.m_Orbits = arg_166_0.orbits.current
	arg_166_0.surroudCamera = nil
end

function var_0_0.ActiveStateCamera(arg_167_0, arg_167_1, arg_167_2)
	local var_167_0 = {
		base = function(arg_168_0)
			arg_167_0:RegisterCameraBlendFinished(arg_167_0.cameras[var_0_0.CAMERA.POV], arg_168_0)
			arg_167_0:ActiveCamera(arg_167_0.cameras[var_0_0.CAMERA.POV])
		end,
		watch = function(arg_169_0)
			assert(arg_167_0.apartment)
			arg_167_0:SyncInterestTransform(arg_167_0.ladyDict[arg_167_0.apartment:GetConfigID()])
			arg_167_0:SetCameraLady(arg_167_0.ladyDict[arg_167_0.apartment:GetConfigID()])
			arg_167_0:RegisterCameraBlendFinished(arg_167_0.cameras[var_0_0.CAMERA.ROLE], arg_169_0)
			arg_167_0:ActiveCamera(arg_167_0.cameras[var_0_0.CAMERA.ROLE])
		end,
		walk = function(arg_170_0)
			arg_167_0:RegisterCameraBlendFinished(arg_167_0.cameras[var_0_0.CAMERA.POV], arg_170_0)
			arg_167_0:ActiveCamera(arg_167_0.cameras[var_0_0.CAMERA.POV])
		end,
		ik = function(arg_171_0)
			arg_171_0()
		end,
		gift = function(arg_172_0)
			assert(arg_167_0.apartment)
			arg_167_0:SetCameraLady(arg_167_0.ladyDict[arg_167_0.apartment:GetConfigID()])
			arg_167_0:RegisterCameraBlendFinished(arg_167_0.cameras[var_0_0.CAMERA.GIFT], arg_172_0)
			arg_167_0:ActiveCamera(arg_167_0.cameras[var_0_0.CAMERA.GIFT])
		end,
		standby = function(arg_173_0)
			assert(arg_167_0.apartment)
			arg_167_0:SetCameraLady(arg_167_0.ladyDict[arg_167_0.apartment:GetConfigID()])

			arg_167_0.cameras[var_0_0.CAMERA.ROLE2].transform.position = arg_167_0.cameraRole.transform.position

			arg_167_0:RegisterCameraBlendFinished(arg_167_0.cameras[var_0_0.CAMERA.ROLE2], arg_173_0)
			arg_167_0:ActiveCamera(arg_167_0.cameras[var_0_0.CAMERA.ROLE2])
		end,
		talk = function(arg_174_0)
			assert(arg_167_0.apartment)
			arg_167_0:SetCameraLady(arg_167_0.ladyDict[arg_167_0.apartment:GetConfigID()])
			arg_167_0:SyncInterestTransform(arg_167_0.ladyDict[arg_167_0.apartment:GetConfigID()])
			arg_167_0:RegisterCameraBlendFinished(arg_167_0.cameras[var_0_0.CAMERA.TALK], arg_174_0)
			arg_167_0:ActiveCamera(arg_167_0.cameras[var_0_0.CAMERA.TALK])
		end
	}
	local var_167_1 = {}

	table.insert(var_167_1, function(arg_175_0)
		switch(arg_167_1, var_167_0, arg_175_0, arg_175_0)
	end)
	seriesAsync(var_167_1, arg_167_2)
end

function var_0_0.GetSceneItem(arg_176_0, arg_176_1)
	local var_176_0

	if string.find(arg_176_1, "fbx/") == 1 then
		var_176_0 = arg_176_0.modelRoot:Find(arg_176_1)
	elseif string.find(arg_176_1, "FurnitureSlots/") == 1 then
		arg_176_1 = string.gsub(arg_176_1, "^FurnitureSlots/", "", 1)
		var_176_0 = arg_176_0.slotRoot:Find(arg_176_1)
	end

	if not var_176_0 then
		warning(string.format("Missing scene item path: %s", arg_176_1))
	end

	return var_176_0
end

function var_0_0.SetIKStatus(arg_177_0, arg_177_1, arg_177_2, arg_177_3)
	warning("Set IKStatus " .. (arg_177_2.id or "NIL"))

	arg_177_0.enableIKTip = true

	arg_177_0:ResetIKTipTimer()
	setActive(arg_177_1.ladyCollider, false)
	_.each(arg_177_1.ladyTouchColliders, function(arg_178_0)
		setActive(arg_178_0, true)
	end)

	arg_177_0.blockIK = nil
	arg_177_1.ikActionDict = {}
	arg_177_1.readyIKLayers = {}
	arg_177_1.IKSettings = {
		Colliders = arg_177_1.ladyColliders,
		CameraRaycaster = arg_177_0.sceneRaycaster
	}

	local var_177_0 = _.map(arg_177_2.ik_id, function(arg_179_0)
		local var_179_0 = Dorm3dIK.New({
			configId = arg_179_0[1]
		})
		local var_179_1 = arg_179_0[3]
		local var_179_2 = var_179_1[1]
		local var_179_3 = switch(var_179_2, {
			function(arg_180_0, arg_180_1)
				return 0
			end,
			function()
				return 0
			end,
			function(arg_182_0, arg_182_1)
				return arg_182_0
			end,
			function(arg_183_0, arg_183_1)
				return arg_183_0
			end,
			function(arg_184_0, arg_184_1, arg_184_2, arg_184_3)
				return arg_184_0
			end,
			function(arg_185_0)
				return 0
			end
		}, function(arg_186_0)
			return var_179_2(arg_186_0) == "number" and arg_186_0 or 0
		end, unpack(var_179_1, 2))

		table.insert(arg_177_1.readyIKLayers, var_179_0)

		arg_177_1.ikActionDict[var_179_0:GetControllerPath()] = var_179_1

		local var_179_4 = var_179_0:GetSubTargets()
		local var_179_5 = var_179_0:GetPlaneRotations()
		local var_179_6 = var_179_0:GetPlaneScales()
		local var_179_7 = _.map(_.range(#var_179_4), function(arg_187_0)
			return {
				name = var_179_4[arg_187_0][1],
				planeRot = var_179_5[arg_187_0],
				planeScale = var_179_6[arg_187_0]
			}
		end)

		return Dorm3dIKController.New({
			triggerName = var_179_0:getConfig("trigger_param")[2],
			controllerName = var_179_0:GetControllerPath(),
			subTargets = var_179_7,
			actionType = var_179_0:GetActionTriggerParams()[1],
			controlRect = var_179_0:GetRect(),
			actionRect = var_179_0:GetTriggerRect(),
			backTime = var_179_0:GetRevertTime(),
			actionRevertTime = var_179_3
		})
	end)

	pg.IKMgr.GetInstance():RegisterEnv(arg_177_1.ladyIKRoot, arg_177_1.ladyBoneMaps)
	arg_177_0:RegisterIKFunc()
	pg.IKMgr.GetInstance():SetIKStatus(var_177_0)

	local var_177_1 = _.map(arg_177_2.touch_data, function(arg_188_0)
		return arg_188_0[1]
	end)

	table.Foreach(var_177_1, function(arg_189_0, arg_189_1)
		local var_189_0 = pg.dorm3d_ik_touch[arg_189_1]

		if #var_189_0.scene_item == 0 then
			return
		end

		local var_189_1 = arg_177_0:GetSceneItem(var_189_0.scene_item)

		if not var_189_1 then
			warning(string.format("dorm3d_ik_touch:%d without scene_item:%s", arg_189_1, var_189_0.scene_item))

			return
		end

		if IsNil(GetComponent(var_189_1, typeof(UnityEngine.Collider))) then
			go(var_189_1):AddComponent(typeof(UnityEngine.BoxCollider))
		end

		local var_189_2 = GetOrAddComponent(var_189_1, typeof(EventTriggerListener))

		var_189_2.enabled = true

		var_189_2:AddPointClickFunc(function()
			arg_177_0.blockIK = true

			local var_190_0 = arg_177_2.touch_data[arg_189_0]
			local var_190_1, var_190_2, var_190_3 = unpack(var_190_0)

			arg_177_0:TouchModePointAction(arg_177_1, var_190_1, unpack(var_190_3))(function()
				arg_177_0.enableIKTip = true

				arg_177_0:ResetIKTipTimer()

				arg_177_0.blockIK = nil
			end)
		end)
	end)

	arg_177_0.camBrain.enabled = false

	if arg_177_0.cameras[var_0_0.CAMERA.IK_WATCH] then
		setActive(arg_177_0.cameras[var_0_0.CAMERA.IK_WATCH], false)

		arg_177_0.cameras[var_0_0.CAMERA.IK_WATCH] = nil
	end

	local var_177_2 = arg_177_0.cameraRoot:Find(arg_177_2.ik_camera)

	assert(var_177_2, "Missing IKCamera")

	arg_177_0.cameras[var_0_0.CAMERA.IK_WATCH] = var_177_2

	arg_177_0:ActiveCamera(arg_177_0.cameras[var_0_0.CAMERA.IK_WATCH])

	arg_177_0.camBrain.enabled = true

	local var_177_3 = var_177_2:GetComponent(typeof(Cinemachine.CinemachineFreeLook))

	if var_177_3 then
		arg_177_0:RegisterOrbits(var_177_3)
	else
		arg_177_0:RevertCameraOrbit()
	end

	arg_177_0:SwitchAnim(arg_177_1, arg_177_2.character_action)
	arg_177_0:SettingHeadAimIK(arg_177_1, arg_177_2.head_track)
	arg_177_0:EnableCloth(arg_177_1, false)
	arg_177_0:EnableCloth(arg_177_1, arg_177_2.use_cloth, arg_177_2.cloth_colliders)
	;(function()
		local var_192_0 = arg_177_2.enter_scene_anim
		local var_192_1 = {}

		if var_192_0 and #var_192_0 > 0 then
			table.Ipairs(var_192_0, function(arg_193_0, arg_193_1)
				arg_177_0:PlaySceneItemAnim(arg_193_1[1], arg_193_1[2])
				table.insert(var_192_1, arg_193_1[1])
			end)
		end

		arg_177_0:ResetSceneItemAnimators(var_192_1)
	end)()
	;(function()
		local var_194_0 = arg_177_2.enter_extra_item
		local var_194_1 = {}

		if var_194_0 and #var_194_0 > 0 then
			table.Ipairs(var_194_0, function(arg_195_0, arg_195_1)
				local var_195_0 = arg_195_1[3] and Vector3.New(unpack(arg_195_1[3]))
				local var_195_1 = arg_195_1[4] and Quaternion.Euler(unpack(arg_195_1[4]))

				arg_177_0:LoadCharacterExtraItem(arg_177_1, arg_195_1[1], arg_195_1[2], var_195_0, var_195_1)
				table.insert(var_194_1, arg_195_1[1])
			end)
		end

		arg_177_0:ResetCharacterExtraItem(arg_177_1, var_194_1)
	end)()
	eachChild(arg_177_0.ikTextTipsRoot, function(arg_196_0)
		setActive(arg_196_0, false)
	end)
	_.each(arg_177_1.readyIKLayers, function(arg_197_0)
		local var_197_0 = arg_197_0:getConfig("tip_text")

		if not var_197_0 or #var_197_0 == 0 then
			return
		end

		local var_197_1 = arg_177_0.ikTextTipsRoot:Find(var_197_0)

		if not IsNil(var_197_1) then
			setActive(var_197_1, true)
		end
	end)
	onNextTick(function()
		local var_198_0 = arg_177_0.furnitures:Find(arg_177_2.character_position)

		arg_177_1.lady.position = var_198_0:Find("StayPoint").position
		arg_177_1.lady.rotation = var_198_0:Find("StayPoint").rotation

		existCall(arg_177_3)
	end)
end

function var_0_0.ExitIKStatus(arg_199_0, arg_199_1, arg_199_2, arg_199_3)
	arg_199_0.enableIKTip = false

	setActive(arg_199_1.ladyCollider, true)
	_.each(arg_199_1.ladyTouchColliders, function(arg_200_0)
		setActive(arg_200_0, false)
	end)

	arg_199_0.blockIK = nil

	pg.IKMgr.GetInstance():UnregisterEnv()

	arg_199_1.ikActionDict = nil
	arg_199_1.readyIKLayers = nil

	setActive(arg_199_0.ikTipsRoot, false)
	setActive(arg_199_0.ikClickTipsRoot, false)

	local var_199_0 = _.map(arg_199_2.touch_data or {}, function(arg_201_0)
		return arg_201_0[1]
	end)

	table.Foreach(var_199_0, function(arg_202_0, arg_202_1)
		local var_202_0 = pg.dorm3d_ik_touch[arg_202_1]

		if #var_202_0.scene_item == 0 then
			return
		end

		local var_202_1 = arg_199_0.modelRoot:Find(var_202_0.scene_item)

		if not var_202_1 then
			return
		end

		local var_202_2 = GetOrAddComponent(var_202_1, typeof(EventTriggerListener))

		var_202_2:ClearEvents()

		var_202_2.enabled = false
	end)
	arg_199_0:RevertCameraOrbit()
	setActive(arg_199_0.cameras[var_0_0.CAMERA.IK_WATCH], false)

	arg_199_0.cameras[var_0_0.CAMERA.IK_WATCH] = nil

	arg_199_0:EnableCloth(arg_199_1, false)
	arg_199_0:ResetHeadAimIK(arg_199_1)
	arg_199_0:SwitchAnim(arg_199_1, arg_199_2.character_action)
	arg_199_0:ResetSceneItemAnimators()
	arg_199_0:ResetCharacterExtraItem(arg_199_1)
	onNextTick(function()
		if arg_199_2.character_position then
			arg_199_1.ladyActiveZone = arg_199_2.character_position
		else
			arg_199_1.ladyActiveZone = arg_199_1.ladyBaseZone
		end

		arg_199_0:ChangeCharacterPosition(arg_199_1)
		arg_199_0:TriggerLadyDistance()
		arg_199_0:CheckInSector()
		existCall(arg_199_3)
	end)
end

function var_0_0.SetIKTimelineStatus(arg_204_0, arg_204_1, arg_204_2, arg_204_3, arg_204_4, arg_204_5)
	warning("Set IKStatus " .. (arg_204_3 or "NIL"))

	arg_204_0.enableIKTip = true

	arg_204_0:ResetIKTipTimer()

	arg_204_0.blockIK = nil

	local var_204_0 = pg.dorm3d_ik_timeline_status[arg_204_3]

	arg_204_1.readyIKLayers = {}
	arg_204_1.IKSettings = {
		CameraRaycaster = arg_204_4:GetComponent(typeof(UnityEngine.EventSystems.PhysicsRaycaster))
	}

	assert(arg_204_1.IKSettings.CameraRaycaster)

	local var_204_1 = {}

	table.IpairsCArray(arg_204_2:GetComponentsInChildren(typeof(UnityEngine.Collider), true), function(arg_205_0, arg_205_1)
		if arg_205_1:GetType():Equals(typeof(UnityEngine.MeshCollider)) then
			return
		end

		child = tf(arg_205_1)

		local var_205_0 = child.name
		local var_205_1 = var_205_0 and string.find(var_205_0, "Collider") or -1

		if var_205_1 <= 0 then
			errorMsg("Wrong Name to lady Collider : " .. var_205_0)

			return
		end

		local var_205_2 = string.sub(var_205_0, 1, var_205_1 - 1)

		if var_205_2 == "Body" then
			setActive(child, false)

			return
		end

		if var_0_0.BONE_TO_TOUCH[var_205_2] == nil then
			return
		end

		var_204_1[var_205_2] = child

		setActive(child, true)
	end)

	arg_204_1.IKSettings.Colliders = var_204_1
	arg_204_1.ikTimelineMode = true

	local var_204_2 = _.map(var_204_0.ik_id, function(arg_206_0)
		local var_206_0 = Dorm3dIK.New({
			configId = arg_206_0
		})

		table.insert(arg_204_1.readyIKLayers, var_206_0)

		local var_206_1 = var_206_0:GetSubTargets()
		local var_206_2 = var_206_0:GetPlaneRotations()
		local var_206_3 = var_206_0:GetPlaneScales()
		local var_206_4 = _.map(_.range(#var_206_1), function(arg_207_0)
			return {
				name = var_206_1[arg_207_0][1],
				planeRot = var_206_2[arg_207_0],
				planeScale = var_206_3[arg_207_0]
			}
		end)

		return Dorm3dIKController.New({
			triggerName = var_206_0:getConfig("trigger_param")[2],
			controllerName = var_206_0:GetControllerPath(),
			subTargets = var_206_4,
			actionType = var_206_0:GetActionTriggerParams()[1],
			controlRect = var_206_0:GetRect(),
			actionRect = var_206_0:GetTriggerRect(),
			backTime = var_206_0:GetRevertTime(),
			actionRevertTime = var_206_0:GetActionRevertTime(),
			timelineActionEvent = var_206_0:GetTimelineAction()
		})
	end)
	local var_204_3 = arg_204_2.transform:Find("IKLayers")
	local var_204_4 = {}
	local var_204_5 = {}

	table.Foreach(var_0_1, function(arg_208_0, arg_208_1)
		var_204_5[arg_208_1] = arg_208_0
	end)

	local var_204_6 = arg_204_2.transform:GetComponentsInChildren(typeof(Transform), true)

	table.IpairsCArray(var_204_6, function(arg_209_0, arg_209_1)
		if var_204_5[arg_209_1.name] then
			var_204_4[var_204_5[arg_209_1.name]] = arg_209_1
		end
	end)
	pg.IKMgr.GetInstance():RegisterEnv(var_204_3, var_204_4)
	arg_204_0:RegisterIKFunc()
	pg.IKMgr.GetInstance():SetIKStatus(var_204_2)
	existCall(arg_204_5)
end

function var_0_0.ExitIKTimelineStatus(arg_210_0, arg_210_1, arg_210_2)
	arg_210_0.enableIKTip = false
	arg_210_0.blockIK = nil

	pg.IKMgr.GetInstance():UnregisterEnv()

	arg_210_1.readyIKLayers = nil
	arg_210_1.IKSettings = nil

	setActive(arg_210_0.ikTipsRoot, false)
	setActive(arg_210_0.ikClickTipsRoot, false)
	existCall(arg_210_2)
end

function var_0_0.EnableIKLayer(arg_211_0, arg_211_1)
	local var_211_0 = arg_211_0.ladyDict[arg_211_0.apartment:GetConfigID()]

	if #arg_211_1:GetHeadTrackPath() > 0 then
		arg_211_0:SettingHeadAimIK(var_211_0, {
			2,
			arg_211_1:GetHeadTrackPath()
		}, true)
	end

	local var_211_1 = arg_211_1:GetTriggerFaceAnim()

	if #var_211_1 > 0 then
		arg_211_0:PlayFaceAnim(var_211_0, var_211_1)
	end

	setActive(arg_211_0:GetIKHandTF(), true)
	eachChild(arg_211_0:GetIKHandTF(), function(arg_212_0)
		setActive(arg_212_0, false)
	end)
	arg_211_0:StopIKHandTimer()
	setActive(arg_211_0:GetIKHandTF():Find("Begin"), true)

	arg_211_0.ikHandTimer = Timer.New(function()
		setActive(arg_211_0:GetIKHandTF():Find("Begin"), false)
		setActive(arg_211_0:GetIKHandTF():Find("Normal"), true)
	end, 0.5, 1)

	arg_211_0.ikHandTimer:Start()

	if not var_211_0.ikTimelineMode then
		pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataTouch(arg_211_0.apartment.configId, arg_211_0.apartment.level, var_211_0.ikConfig.character_action, arg_211_1:GetTriggerParams()[2], arg_211_0.room:GetConfigID()))
	end
end

function var_0_0.DeactiveIKLayer(arg_214_0, arg_214_1)
	local var_214_0 = arg_214_0.ladyDict[arg_214_0.apartment:GetConfigID()]

	if not var_214_0.ikTimelineMode and #arg_214_1:GetHeadTrackPath() > 0 then
		arg_214_0:SettingHeadAimIK(var_214_0, var_214_0.ikConfig.head_track)
	end

	arg_214_0:StopIKHandTimer()
	setActive(arg_214_0:GetIKHandTF():Find("Begin"), false)
	setActive(arg_214_0:GetIKHandTF():Find("Normal"), false)
	setActive(arg_214_0:GetIKHandTF():Find("End"), true)

	arg_214_0.ikHandTimer = Timer.New(function()
		setActive(arg_214_0:GetIKHandTF():Find("End"), false)
		setActive(arg_214_0:GetIKHandTF(), false)
	end, 0.5, 1)

	arg_214_0.ikHandTimer:Start()
end

function var_0_0.StopIKHandTimer(arg_216_0)
	if not arg_216_0.ikHandTimer then
		return
	end

	arg_216_0.ikHandTimer:Stop()

	arg_216_0.ikHandTimer = nil
end

function var_0_0.PlayIKRevert(arg_217_0, arg_217_1, arg_217_2, arg_217_3)
	local var_217_0 = Time.time

	function arg_217_0.ikRevertHandler()
		local var_218_0 = Time.time - var_217_0

		_.each(arg_217_1.activeIKLayers, function(arg_219_0)
			local var_219_0 = 1

			if arg_217_2 > 0 then
				var_219_0 = var_218_0 / arg_217_2
			end

			local var_219_1 = arg_217_1.cacheIKInfos[arg_219_0].solvers
			local var_219_2 = arg_217_1.cacheIKInfos[arg_219_0].weights

			table.Foreach(var_219_1, function(arg_220_0, arg_220_1)
				arg_220_1.IKPositionWeight = math.lerp(var_219_2[arg_220_0], 0, var_219_0)
			end)
		end)

		if var_218_0 >= arg_217_2 then
			arg_217_0:ResetActiveIKs(arg_217_1)

			arg_217_0.ikRevertHandler = nil

			existCall(arg_217_3)
		end
	end

	arg_217_0.ikRevertHandler()
end

function var_0_0.ResetActiveIKs(arg_221_0, arg_221_1)
	table.insertto(arg_221_0.activeIKLayers, _.keys(arg_221_0.holdingStatus))
	table.clear(arg_221_0.holdingStatus)
	_.each(arg_221_1.activeIKLayers, function(arg_222_0)
		local var_222_0 = arg_222_0:GetControllerPath()
		local var_222_1 = arg_221_1.ladyIKRoot:Find(var_222_0):GetComponent(typeof(RootMotion.FinalIK.IKExecutionOrder))

		setActive(var_222_1, false)

		local var_222_2 = arg_221_1.cacheIKInfos[arg_222_0].solvers
		local var_222_3 = arg_221_1.cacheIKInfos[arg_222_0].weights

		table.Foreach(var_222_2, function(arg_223_0, arg_223_1)
			arg_223_1.IKPositionWeight = var_222_3[arg_223_0]
		end)
	end)
	table.clear(arg_221_1.activeIKLayers)
end

function var_0_0.ResetIKTipTimer(arg_224_0)
	if not arg_224_0.enableIKTip then
		return
	end

	arg_224_0.nextTipIKTime = Time.time + var_0_0.IK_TIP_WAIT_TIME
end

function var_0_0.EnableCurrentHeadIK(arg_225_0, arg_225_1)
	local var_225_0 = arg_225_0.ladyDict[arg_225_0.apartment:GetConfigID()]

	arg_225_0:EnableHeadIK(var_225_0, arg_225_1)
end

function var_0_0.EnableHeadIK(arg_226_0, arg_226_1, arg_226_2)
	arg_226_1.ladyHeadIKComp.enableIk = arg_226_2
end

function var_0_0.SettingHeadAimIK(arg_227_0, arg_227_1, arg_227_2, arg_227_3)
	local var_227_0

	if arg_227_2[1] == 1 then
		var_227_0 = arg_227_0.mainCameraTF:Find("AimTarget")
	elseif arg_227_2[1] == 2 then
		table.IpairsCArray(arg_227_1.lady:GetComponentsInChildren(typeof(Transform), true), function(arg_228_0, arg_228_1)
			if arg_228_1.name ~= arg_227_2[2] then
				return
			end

			var_227_0 = arg_228_1
		end)
	end

	arg_227_1.ladyHeadIKComp.AimTarget = var_227_0

	if not arg_227_3 and arg_227_2[3] then
		arg_227_1.ladyHeadIKComp.BodyWeight = arg_227_2[3]
	end

	if not arg_227_3 and arg_227_2[4] then
		arg_227_1.ladyHeadIKComp.HeadWeight = arg_227_2[4]
	end
end

function var_0_0.ResetHeadAimIK(arg_229_0, arg_229_1)
	arg_229_1.ladyHeadIKComp.AimTarget = arg_229_0.mainCameraTF:Find("AimTarget")
	arg_229_1.ladyHeadIKComp.HeadWeight = arg_229_1.ladyHeadIKData.HeadWeight
	arg_229_1.ladyHeadIKComp.BodyWeight = arg_229_1.ladyHeadIKData.BodyWeight
end

function var_0_0.HideCharacter(arg_230_0, arg_230_1)
	for iter_230_0, iter_230_1 in pairs(arg_230_0.ladyDict) do
		if iter_230_0 ~= arg_230_1 then
			arg_230_0:HideCharacterBylayer(iter_230_1)
		end
	end
end

function var_0_0.RevertCharacter(arg_231_0, arg_231_1)
	for iter_231_0, iter_231_1 in pairs(arg_231_0.ladyDict) do
		if iter_231_0 ~= arg_231_1 then
			arg_231_0:RevertCharacterBylayer(iter_231_1)
		end
	end
end

function var_0_0.HideCharacterBylayer(arg_232_0, arg_232_1)
	local var_232_0 = "Bip001"
	local var_232_1 = arg_232_1.lady:Find("all")

	for iter_232_0 = 0, var_232_1.childCount - 1 do
		local var_232_2 = var_232_1:GetChild(iter_232_0)

		if var_232_2.name ~= var_232_0 then
			pg.ViewUtils.SetLayer(var_232_2, Layer.Environment3D)
		end
	end

	if arg_232_1.tfPendintItem then
		pg.ViewUtils.SetLayer(arg_232_1.tfPendintItem, Layer.Environment3D)
	end

	if arg_232_1.ladyWatchFloat then
		pg.ViewUtils.SetLayer(arg_232_1.ladyWatchFloat, Layer.Environment3D)
	end

	GetComponent(arg_232_1.lady, "BLHXCharacterPropertiesController").enabled = false
end

function var_0_0.RevertCharacterBylayer(arg_233_0, arg_233_1)
	local var_233_0 = "Bip001"
	local var_233_1 = arg_233_1.lady:Find("all")

	for iter_233_0 = 0, var_233_1.childCount - 1 do
		local var_233_2 = var_233_1:GetChild(iter_233_0)

		if var_233_2.name ~= var_233_0 then
			pg.ViewUtils.SetLayer(var_233_2, Layer.Default)
		end
	end

	if arg_233_1.tfPendintItem then
		pg.ViewUtils.SetLayer(arg_233_1.tfPendintItem, Layer.Default)
	end

	if arg_233_1.ladyWatchFloat then
		pg.ViewUtils.SetLayer(arg_233_1.ladyWatchFloat, Layer.Default)
	end

	GetComponent(arg_233_1.lady, "BLHXCharacterPropertiesController").enabled = true
end

function var_0_0.EnterFurnitureWatchMode(arg_234_0)
	arg_234_0:SetAllBlackbloardValue("inLockLayer", true)
	arg_234_0:EnableJoystick(true)
	arg_234_0:HideCharacter()
end

function var_0_0.ExitFurnitureWatchMode(arg_235_0, arg_235_1)
	arg_235_0:HideFurnitureSlots()

	local var_235_0 = arg_235_0.cameras[var_0_0.CAMERA.POV]

	seriesAsync({
		function(arg_236_0)
			arg_235_0.furniturePOV = nil

			arg_235_0:EnableJoystick(false)
			arg_235_0:emit(var_0_0.SHOW_BLOCK)
			arg_235_0:ShowBlackScreen(true, arg_236_0)
		end,
		function(arg_237_0)
			existCall(arg_235_1)
			arg_235_0:RevertCharacter()
			arg_235_0:SetAllBlackbloardValue("inLockLayer", false)
			arg_235_0:RegisterCameraBlendFinished(var_235_0, arg_237_0)
			arg_235_0:ActiveCamera(var_235_0)
		end,
		function(arg_238_0)
			arg_235_0:ShowBlackScreen(false, arg_238_0)
		end
	}, function()
		arg_235_0:emit(var_0_0.HIDE_BLOCK)
	end)
	arg_235_0:RefreshSlots()
end

function var_0_0.SwitchFurnitureZone(arg_240_0, arg_240_1)
	local var_240_0 = arg_240_0:GetFurnitureByName(arg_240_1:GetWatchCameraName()):Find("FurnitureWatch Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))

	if arg_240_0.cameraFurnitureWatch and arg_240_0.cameraFurnitureWatch ~= var_240_0 then
		arg_240_0:UnRegisterCameraBlendFinished(arg_240_0.cameraFurnitureWatch)
		setActive(arg_240_0.cameraFurnitureWatch, false)
	end

	arg_240_0.cameraFurnitureWatch = var_240_0
	arg_240_0.cameras[var_0_0.CAMERA.FURNITURE_WATCH] = arg_240_0.cameraFurnitureWatch
	arg_240_0.furniturePOV = arg_240_0.cameraFurnitureWatch:GetCinemachineComponent(Cinemachine.CinemachineCore.Stage.Aim)

	arg_240_0:RegisterCameraBlendFinished(arg_240_0.cameraFurnitureWatch, function()
		arg_240_0:emit(var_0_0.HIDE_BLOCK)
	end)
	arg_240_0:emit(var_0_0.SHOW_BLOCK)
	arg_240_0:ActiveCamera(arg_240_0.cameraFurnitureWatch)
end

function var_0_0.HideFurnitureSlots(arg_242_0)
	if arg_242_0.displaySlots then
		arg_242_0:UpdateDisplaySlots({})
		table.Foreach(arg_242_0.displaySlots, function(arg_243_0, arg_243_1)
			local var_243_0 = arg_243_1.trans

			if IsNil(var_243_0:Find("Selector")) then
				return
			end

			setActive(var_243_0:Find("Selector"), false)
		end)

		arg_242_0.displaySlots = nil
	end
end

function var_0_0.DisplayFurnitureSlots(arg_244_0, arg_244_1)
	arg_244_0:HideFurnitureSlots()

	arg_244_0.displaySlots = {}

	_.each(arg_244_1, function(arg_245_0)
		arg_244_0.displaySlots[arg_245_0] = arg_244_0.slotDict[arg_245_0]

		if not arg_244_0.displaySlots[arg_245_0] then
			errorMsg("Slot " .. arg_245_0 .. " Not Binding Scene Object")

			return
		end

		local var_245_0 = arg_244_0.displaySlots[arg_245_0].trans

		if var_245_0:Find("Selector") then
			setActive(var_245_0:Find("Selector"), true)
		end
	end)
end

function var_0_0.UpdateDisplaySlots(arg_246_0, arg_246_1)
	table.Foreach(arg_246_0.displaySlots, function(arg_247_0, arg_247_1)
		local var_247_0 = arg_247_1.trans

		if not IsNil(var_247_0:Find("Selector")) then
			setActive(var_247_0:Find("Selector/Normal"), arg_246_1[arg_247_0] == 0)
			setActive(var_247_0:Find("Selector/Active"), arg_246_1[arg_247_0] == 1)
			setActive(var_247_0:Find("Selector/Ban"), arg_246_1[arg_247_0] == 2)
		end

		local var_247_1 = arg_246_0.slotDict[arg_247_0].model
		local var_247_2 = arg_246_0.slotDict[arg_247_0].displayModelName

		if var_247_2 and var_247_2 ~= "" then
			var_247_1 = var_247_0:GetChild(var_247_0.childCount - 1)
		end

		local function var_247_3(arg_248_0, arg_248_1)
			local var_248_0 = arg_248_0:GetComponentsInChildren(typeof(Renderer), true)

			table.IpairsCArray(var_248_0, function(arg_249_0, arg_249_1)
				local var_249_0 = arg_249_1.material

				if var_249_0 and var_249_0:HasProperty("_FinalTint") then
					var_249_0:SetColor("_FinalTint", arg_248_1)
				end
			end)
		end

		if var_247_1 then
			if arg_246_1[arg_247_0] == 1 then
				var_247_3(var_247_1, Color.NewHex("3F83AE73"))
			else
				var_247_3(var_247_1, Color.New(0, 0, 0, 0))
			end
		end
	end)
end

function var_0_0.EnterPhotoMode(arg_250_0, arg_250_1, arg_250_2)
	arg_250_0:SetAllBlackbloardValue("inLockLayer", true)
	arg_250_0:emit(var_0_0.ENABLE_SCENEBLOCK, true)
	seriesAsync({
		function(arg_251_0)
			arg_250_0:TempHideUI(true, arg_251_0)
		end,
		function(arg_252_0)
			arg_250_0:ShowBlackScreen(true, arg_252_0)
		end,
		function(arg_253_0)
			local var_253_0 = arg_250_0.apartment:GetConfigID()
			local var_253_1 = arg_250_0.ladyDict[var_253_0]

			arg_250_0:SwitchAnim(var_253_1, arg_250_2)
			var_253_1.ladyAnimator:Update(0)
			var_253_1:ResetCharPoint(var_253_1, arg_250_1:GetWatchCameraName())
			arg_250_0:SyncInterestTransform(var_253_1)
			setActive(var_253_1.ladySafeCollider, true)
			arg_250_0:HideCharacter(var_253_0)

			local var_253_2 = arg_250_0.cameras[var_0_0.CAMERA.PHOTO]
			local var_253_3 = var_253_2.m_XAxis

			var_253_3.Value = 180
			var_253_2.m_XAxis = var_253_3

			local var_253_4 = var_253_2.m_YAxis

			var_253_4.Value = 0.7
			var_253_2.m_YAxis = var_253_4
			arg_250_0.pinchValue = 1

			arg_250_0:RegisterOrbits(arg_250_0.cameras[var_0_0.CAMERA.PHOTO])
			arg_250_0:SetCameraObrits()
			arg_250_0:RegisterCameraBlendFinished(var_253_2, arg_253_0)
			arg_250_0:ActiveCamera(var_253_2)
		end,
		function(arg_254_0)
			arg_250_0:ShowBlackScreen(false, arg_254_0)
		end
	}, function()
		arg_250_0:EnableJoystick(true)
	end)
end

function var_0_0.ExitPhotoMode(arg_256_0)
	arg_256_0:emit(var_0_0.SHOW_BLOCK)
	arg_256_0:EnableJoystick(false)
	seriesAsync({
		function(arg_257_0)
			arg_256_0:ShowBlackScreen(true, arg_257_0)
		end,
		function(arg_258_0)
			arg_256_0:RevertCameraOrbit()

			local var_258_0 = arg_256_0.ladyDict[arg_256_0.apartment:GetConfigID()]

			arg_256_0:SwitchAnim(var_258_0, var_0_0.ANIM.IDLE)
			setActive(var_258_0.ladySafeCollider, false)
			onNextTick(function()
				arg_256_0:ChangeCharacterPosition(var_258_0)
			end)

			if arg_256_0.contextData.photoFreeMode then
				arg_256_0:EnablePOVLayer(false)
				setActive(arg_256_0.restrictedBox, false)

				arg_256_0.contextData.photoFreeMode = nil
			end

			local var_258_1 = arg_256_0.cameras[var_0_0.CAMERA.POV]

			arg_256_0:RegisterCameraBlendFinished(var_258_1, arg_258_0)
			arg_256_0:ActiveCamera(var_258_1)
		end,
		function(arg_260_0)
			arg_256_0:RevertCharacter(arg_256_0.apartment:GetConfigID())
			arg_256_0:ShowBlackScreen(false, arg_260_0)
		end
	}, function()
		arg_256_0:RefreshSlots()
		arg_256_0:SetAllBlackbloardValue("inLockLayer", false)
		arg_256_0:emit(var_0_0.HIDE_BLOCK)
		arg_256_0:emit(var_0_0.ENABLE_SCENEBLOCK, false)
		arg_256_0:TempHideUI(false)
	end)
end

function var_0_0.SwitchCameraZone(arg_262_0, arg_262_1, arg_262_2, arg_262_3)
	arg_262_0:emit(var_0_0.SHOW_BLOCK)
	seriesAsync({
		function(arg_263_0)
			arg_262_0:ShowBlackScreen(true, arg_263_0)
		end,
		function(arg_264_0)
			local var_264_0 = arg_262_0.ladyDict[arg_262_0.apartment:GetConfigID()]

			arg_262_0:SwitchAnim(var_264_0, arg_262_2)
			onNextTick(function()
				arg_262_0:ResetCharPoint(var_264_0, arg_262_1:GetWatchCameraName())
				arg_262_0:SyncInterestTransform(var_264_0)

				if arg_262_0.contextData.photoFreeMode then
					arg_262_0.camBrain.enabled = false

					arg_262_0:SwitchPhotoCamera()

					arg_262_0.camBrain.enabled = true

					onDelayTick(function()
						arg_262_0.camBrain.enabled = false

						arg_262_0:SwitchPhotoCamera()

						arg_262_0.camBrain.enabled = true
					end, 0.1)
				end

				arg_264_0()
			end)
		end,
		function(arg_267_0)
			arg_262_0:ShowBlackScreen(false, arg_267_0)
		end
	}, function()
		arg_262_0:emit(var_0_0.HIDE_BLOCK)
		existCall(arg_262_3)
	end)
end

function var_0_0.SwitchPhotoCamera(arg_269_0)
	if not arg_269_0.contextData.photoFreeMode then
		arg_269_0:EnableJoystick(false)
		arg_269_0:EnablePOVLayer(true)
		setActive(arg_269_0.restrictedBox, true)

		local var_269_0 = arg_269_0.cameras[var_0_0.CAMERA.PHOTO_FREE]

		var_269_0.transform.position = arg_269_0.mainCameraTF.position

		local var_269_1 = arg_269_0.cameras[var_0_0.CAMERA.PHOTO_FREE]:Find("PhotoFree Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera)):GetCinemachineComponent(Cinemachine.CinemachineCore.Stage.Aim)
		local var_269_2 = arg_269_0.mainCameraTF.rotation:ToEulerAngles()
		local var_269_3 = var_269_1.m_HorizontalAxis

		var_269_3.Value = var_269_2.y
		var_269_1.m_HorizontalAxis = var_269_3

		local var_269_4 = var_269_1.m_VerticalAxis

		var_269_4.Value = arg_269_0:GetNearestAngle(var_269_2.x, var_269_4.m_MinValue, var_269_4.m_MaxValue)
		var_269_1.m_VerticalAxis = var_269_4

		local var_269_5 = math.InverseLerp(arg_269_0.restrictedHeightRange[1], arg_269_0.restrictedHeightRange[2], var_269_0.position.y)

		arg_269_0:emit(Dorm3dPhotoMediator.CAMERA_LIFT_CHANGED, var_269_5)
		arg_269_0:ActiveCamera(arg_269_0.cameras[var_0_0.CAMERA.PHOTO_FREE])
	else
		arg_269_0:EnableJoystick(true)
		arg_269_0:EnablePOVLayer(false)
		setActive(arg_269_0.restrictedBox, false)
		arg_269_0:ActiveCamera(arg_269_0.cameras[var_0_0.CAMERA.PHOTO])
	end

	arg_269_0.contextData.photoFreeMode = not arg_269_0.contextData.photoFreeMode
end

function var_0_0.SetPhotoCameraHeight(arg_270_0, arg_270_1)
	local var_270_0 = math.lerp(arg_270_0.restrictedHeightRange[1], arg_270_0.restrictedHeightRange[2], arg_270_1)
	local var_270_1 = arg_270_0.cameras[var_0_0.CAMERA.PHOTO_FREE]

	var_270_1:GetComponent(typeof(UnityEngine.CharacterController)):Move(Vector3.New(0, var_270_0 - var_270_1.position.y, 0))
	onNextTick(function()
		local var_271_0 = math.InverseLerp(arg_270_0.restrictedHeightRange[1], arg_270_0.restrictedHeightRange[2], var_270_1.position.y)

		arg_270_0:emit(Dorm3dPhotoMediator.CAMERA_LIFT_CHANGED, var_271_0)
	end)
end

function var_0_0.ResetPhotoCameraPosition(arg_272_0)
	local var_272_0 = arg_272_0.cameras[var_0_0.CAMERA.PHOTO]
	local var_272_1 = var_272_0.m_XAxis

	var_272_1.Value = 180
	var_272_0.m_XAxis = var_272_1

	local var_272_2 = var_272_0.m_YAxis

	var_272_2.Value = 0.7
	var_272_0.m_YAxis = var_272_2
end

function var_0_0.ResetCurrentCharPoint(arg_273_0, arg_273_1)
	local var_273_0 = arg_273_0.ladyDict[arg_273_0.apartment:GetConfigID()]

	arg_273_0:ResetCharPoint(var_273_0, arg_273_1)
end

function var_0_0.ResetCharPoint(arg_274_0, arg_274_1, arg_274_2)
	local var_274_0 = arg_274_0.furnitures:Find(arg_274_2 .. "/StayPoint")

	arg_274_1.lady.position = var_274_0.position
	arg_274_1.lady.rotation = var_274_0.rotation
end

function var_0_0.GetNearestAngle(arg_275_0, arg_275_1, arg_275_2, arg_275_3)
	if arg_275_3 < arg_275_2 then
		arg_275_3 = arg_275_3 + 360
	end

	if arg_275_2 <= arg_275_1 and arg_275_1 <= arg_275_3 then
		return arg_275_1
	end

	local var_275_0 = (arg_275_2 + arg_275_3) / 2

	arg_275_1 = var_275_0 - Mathf.DeltaAngle(arg_275_1, var_275_0)
	arg_275_1 = math.clamp(arg_275_1, arg_275_2, arg_275_3)

	return arg_275_1
end

function var_0_0.PlayTimeline(arg_276_0, arg_276_1, arg_276_2)
	local var_276_0 = {}

	if arg_276_0.waitForTimeline then
		table.insert(var_276_0, function(arg_277_0)
			local var_277_0 = arg_276_0.waitForTimeline

			arg_276_0.waitForTimeline = nil

			var_277_0()
			arg_277_0()
		end)
	end

	table.insert(var_276_0, function(arg_278_0)
		arg_276_0:LoadTimelineScene(arg_276_1.name, false, nil, arg_278_0)
	end)

	if arg_276_1.scene and arg_276_1.sceneRoot then
		table.insert(var_276_0, function(arg_279_0)
			arg_276_0:ChangeArtScene(arg_276_1.scene .. "|" .. arg_276_1.sceneRoot, arg_279_0)
		end)
	end

	table.insert(var_276_0, function(arg_280_0)
		local var_280_0 = GameObject.Find("[actor]").transform
		local var_280_1 = var_280_0:GetComponentsInChildren(typeof(Animator), true)

		table.IpairsCArray(var_280_1, function(arg_281_0, arg_281_1)
			GetOrAddComponent(arg_281_1.transform, typeof(DftAniEvent))
		end)

		local var_280_2 = var_280_0:GetComponentInChildren(typeof("BLHXCharacterPropertiesController")).transform
		local var_280_3 = GameObject.Find("[camera]").transform:GetComponentInChildren(typeof(Camera)).transform
		local var_280_4 = GameObject.Find("[sequence]").transform

		arg_276_0.nowTimelinePlayer = TimelinePlayer.New(var_280_4)

		arg_276_0.nowTimelinePlayer:Register(arg_276_1.time, function(arg_282_0, arg_282_1, arg_282_2)
			switch(arg_282_1.stringParameter, {
				TimelinePause = function()
					arg_282_0:SetSpeed(0)
				end,
				TimelineResume = function()
					arg_282_0:SetSpeed(1)
				end,
				TimelinePlayOnTime = function()
					if arg_282_1.intParameter == 0 or arg_282_1.intParameter == arg_282_2.selectIndex then
						arg_282_0:SetTime(arg_282_1.floatParameter)
					end
				end,
				TimelineSelectStart = function()
					arg_282_2.selectIndex = nil

					if arg_276_1.options then
						local var_286_0 = arg_276_1.options[arg_282_1.intParameter]

						arg_276_0:DoTimelineOption(var_286_0, function(arg_287_0)
							arg_282_2.selectIndex = arg_287_0
							arg_282_2.optionIndex = var_286_0[arg_287_0].flag

							arg_282_0:Play()
						end)
					end
				end,
				TimelineTouchStart = function()
					arg_282_2.selectIndex = nil

					if arg_276_1.touchs then
						local var_288_0 = arg_276_1.touchs[arg_282_1.intParameter]

						arg_276_0:DoTimelineTouch(arg_276_1.touchs[arg_282_1.intParameter], function(arg_289_0)
							arg_282_2.selectIndex = arg_289_0
							arg_282_2.optionIndex = var_288_0[arg_289_0].flag
						end)
					end
				end,
				TimelineSelectLoop = function()
					if not arg_282_2.selectIndex then
						arg_282_0:RawSetTime(arg_282_1.floatParameter)
					end
				end,
				TimelineSelect = function()
					arg_282_2.selectIndex = arg_282_1.intParameter
				end,
				TimelineAccompanyJump = function()
					if arg_276_0.canTriggerAccompanyPerformance then
						arg_276_0.canTriggerAccompanyPerformance = false

						local var_292_0 = arg_276_1.accompanys[arg_282_1.intParameter]
						local var_292_1 = var_292_0[math.random(#var_292_0)]

						arg_282_0:SetTime(var_292_1)
					end
				end,
				TimelineIKStart = function()
					local var_293_0 = arg_282_1.intParameter
					local var_293_1 = arg_276_0.ladyDict[arg_276_0.apartment:GetConfigID()]

					arg_276_0:SetIKTimelineStatus(var_293_1, var_280_2.gameObject, var_293_0, var_280_3)
				end,
				TimelineEnd = function()
					arg_282_2.finish = true

					arg_282_0:SetSpeed(0)
				end
			}, function()
				warning("other event trigger:" .. arg_282_1.stringParameter)
			end)

			if arg_282_2.finish then
				arg_276_0.timelineMark = arg_282_2
				arg_276_0.timelineFinishCall = nil

				local var_282_0 = arg_276_0.ladyDict[arg_276_0.apartment:GetConfigID()]

				if var_282_0.ikTimelineMode then
					arg_276_0:ExitIKTimelineStatus(var_282_0)
				end

				arg_280_0()
			end
		end)

		function arg_276_0.timelineFinishCall()
			arg_276_0.nowTimelinePlayer:TriggerEvent({
				stringParameter = "TimelineEnd"
			})
		end

		arg_276_0:HideCharacter()
		setActive(arg_276_0.mainCameraTF, false)
		eachChild(arg_276_0.rtTimelineScreen, function(arg_297_0)
			setActive(arg_297_0, false)
		end)
		setActive(arg_276_0.rtTimelineScreen, true)
		setActive(arg_276_0.rtTimelineScreen:Find("btn_skip"), arg_276_0.inReplayTalk)
		arg_276_0.nowTimelinePlayer:Start()
	end)
	table.insert(var_276_0, function(arg_298_0)
		arg_276_0:ShowBlackScreen(true, function()
			arg_276_0.nowTimelinePlayer:Stop()
			arg_276_0.nowTimelinePlayer:Dispose()

			arg_276_0.nowTimelinePlayer = nil

			arg_276_0:UnloadTimelineScene(arg_276_1.name, false, arg_298_0)
		end)
	end)

	local var_276_1 = arg_276_0.dormSceneMgr.artSceneInfo

	table.insert(var_276_0, function(arg_300_0)
		arg_276_0:ChangeArtScene(var_276_1, arg_300_0)
	end)
	seriesAsync(var_276_0, function()
		setActive(arg_276_0.rtTimelineScreen, false)
		arg_276_0:RevertCharacter()
		setActive(arg_276_0.mainCameraTF, true)

		local var_301_0 = arg_276_0.timelineMark

		arg_276_0.timelineMark = nil

		existCall(arg_276_2, var_301_0, function(arg_302_0)
			arg_276_0:ShowBlackScreen(false, arg_302_0)
		end)
	end)
end

function var_0_0.PlayCurrentSingleAction(arg_303_0, ...)
	local var_303_0 = arg_303_0.ladyDict[arg_303_0.apartment:GetConfigID()]

	return arg_303_0:PlaySingleAction(var_303_0, ...)
end

function var_0_0.PlaySingleAction(arg_304_0, arg_304_1, arg_304_2, arg_304_3)
	local var_304_0 = string.find(arg_304_2, "^Face_")

	if tobool(var_304_0) then
		arg_304_0:PlayFaceAnim(arg_304_1, arg_304_2, arg_304_3)

		return
	end

	if arg_304_1.ladyAnimator:GetCurrentAnimatorStateInfo(arg_304_1.ladyAnimBaseLayerIndex):IsName(arg_304_2) then
		return
	end

	existCall(arg_304_1.animExtraItemCallback)

	arg_304_1.animExtraItemCallback = nil
	arg_304_1.animNameMap = arg_304_1.animNameMap or {}
	arg_304_1.animNameMap[arg_304_1.ladyAnimator.StringToHash(arg_304_2)] = arg_304_2

	local var_304_1 = arg_304_0:GetBlackboardValue(arg_304_1, "groupId")
	local var_304_2 = _.detect(pg.dorm3d_anim_extraitem.get_id_list_by_ship_id[var_304_1] or {}, function(arg_305_0)
		return pg.dorm3d_anim_extraitem[arg_305_0].anim == arg_304_2
	end)
	local var_304_3 = var_304_2 and pg.dorm3d_anim_extraitem[var_304_2]
	local var_304_4

	seriesAsync({
		function(arg_306_0)
			if not var_304_3 or var_304_3.item_prefab == "" then
				arg_306_0()

				return
			end

			local var_306_0 = string.lower("dorm3d/furniture/item/" .. var_304_3.item_prefab)

			arg_304_0.loader:GetPrefab(var_306_0, "", function(arg_307_0)
				setParent(arg_307_0, arg_304_1.lady)

				if var_304_3.item_shield ~= "" then
					var_304_4 = {}

					for iter_307_0, iter_307_1 in ipairs(var_304_3.item_shield) do
						local var_307_0 = arg_304_0.modelRoot:Find(iter_307_1)

						if not var_307_0 then
							warning(string.format("dorm3d_anim_extraitem:%d without hide item:%s", var_304_3.id, iter_307_1))
						else
							var_304_4[iter_307_1] = isActive(var_307_0)

							setActive(var_307_0, false)
						end
					end
				end

				function arg_304_1.animExtraItemCallback()
					arg_304_0.loader:ClearRequest("AnimExtraItem")

					if var_304_4 then
						for iter_308_0, iter_308_1 in pairs(var_304_4) do
							setActive(arg_304_0.modelRoot:Find(iter_308_0), iter_308_1)
						end
					end
				end

				arg_306_0()
			end, "AnimExtraItem")
		end,
		function(arg_309_0)
			arg_304_1.nowState = arg_304_2
			arg_304_1.stateCallback = arg_309_0

			arg_304_1.ladyAnimator:CrossFadeInFixedTime(arg_304_2, 0.25, arg_304_1.ladyAnimBaseLayerIndex)
		end,
		function(arg_310_0)
			arg_304_1.nowState = nil
			arg_304_1.stateCallback = nil

			existCall(arg_304_1.animExtraItemCallback)

			arg_304_1.animExtraItemCallback = nil

			arg_310_0()
		end,
		arg_304_3
	})
end

function var_0_0.SwitchCurrentAnim(arg_311_0, ...)
	local var_311_0 = arg_311_0.ladyDict[arg_311_0.apartment:GetConfigID()]

	return arg_311_0:SwitchAnim(var_311_0, ...)
end

function var_0_0.SwitchAnim(arg_312_0, arg_312_1, arg_312_2, arg_312_3)
	local var_312_0 = string.find(arg_312_2, "^Face_")

	if tobool(var_312_0) then
		arg_312_0:PlayFaceAnim(arg_312_1, arg_312_2, arg_312_3)

		return
	end

	existCall(arg_312_1.animExtraItemCallback)

	arg_312_1.animExtraItemCallback = nil
	arg_312_1.animNameMap = arg_312_1.animNameMap or {}
	arg_312_1.animNameMap[arg_312_1.ladyAnimator.StringToHash(arg_312_2)] = arg_312_2

	local var_312_1 = {}

	table.insert(var_312_1, function(arg_313_0)
		arg_312_1.nowState = arg_312_2
		arg_312_1.stateCallback = arg_313_0

		arg_312_1.ladyAnimator:PlayInFixedTime(arg_312_2, arg_312_1.ladyAnimBaseLayerIndex)
	end)
	table.insert(var_312_1, function(arg_314_0)
		arg_312_1.nowState = nil
		arg_312_1.stateCallback = nil

		arg_314_0()
	end)
	seriesAsync(var_312_1, arg_312_3)
end

function var_0_0.PlayFaceAnim(arg_315_0, arg_315_1, arg_315_2, arg_315_3)
	arg_315_1.ladyAnimator:CrossFadeInFixedTime(arg_315_2, 0.2, arg_315_1.ladyAnimFaceLayerIndex)
	existCall(arg_315_3)
end

function var_0_0.GetCurrentAnim(arg_316_0)
	local var_316_0 = arg_316_0.ladyDict[arg_316_0.apartment:GetConfigID()]
	local var_316_1 = var_316_0.ladyAnimator:GetCurrentAnimatorStateInfo(var_316_0.ladyAnimBaseLayerIndex).shortNameHash

	return var_316_0.animNameMap[var_316_1]
end

function var_0_0.RegisterAnimCallback(arg_317_0, arg_317_1, arg_317_2)
	arg_317_0.ladyDict[arg_317_0.apartment:GetConfigID()].animCallbacks[arg_317_1] = arg_317_2
end

function var_0_0.SetCharacterAnimSpeed(arg_318_0, arg_318_1)
	local var_318_0 = arg_318_0.ladyDict[arg_318_0.apartment:GetConfigID()]

	var_318_0.ladyAnimator.speed = arg_318_1
	var_318_0.ladyHeadIKComp.blinkSpeed = var_318_0.ladyHeadIKData.blinkSpeed * arg_318_1

	if arg_318_1 > 0 then
		var_318_0.ladyHeadIKComp.DampTime = var_318_0.ladyHeadIKData.DampTime / arg_318_1
	else
		var_318_0.ladyHeadIKComp.DampTime = var_318_0.ladyHeadIKData.DampTime * math.huge
	end
end

function var_0_0.OnAnimationEvent(arg_319_0, arg_319_1)
	if arg_319_1.animatorClipInfo.weight < 0.5 then
		return
	end

	local var_319_0 = arg_319_1.stringParameter
	local var_319_1 = table.removebykey(arg_319_0.animEventCallbacks, var_319_0)

	existCall(var_319_1)
end

function var_0_0.RegisterAnimEventCallback(arg_320_0, arg_320_1, arg_320_2)
	arg_320_0.animEventCallbacks[arg_320_1] = arg_320_2
end

function var_0_0.PlaySceneItemAnim(arg_321_0, arg_321_1, arg_321_2)
	arg_321_0.sceneAnimatorDict = arg_321_0.sceneAnimatorDict or {}

	if not arg_321_0.sceneAnimatorDict[arg_321_1] then
		local var_321_0 = pg.dorm3d_scene_animator[arg_321_1]
		local var_321_1 = arg_321_0:GetSceneItem(var_321_0.item_name)

		assert(var_321_1, "Missing Scene Animator in pg.dorm3d_scene_animator: " .. arg_321_1 .. " " .. var_321_0.item_name)

		if not var_321_1 then
			return
		end

		local var_321_2 = var_321_1:GetComponent(typeof(Animator))

		if not var_321_2 then
			return
		end

		arg_321_0.sceneAnimatorDict[arg_321_1] = {
			trans = var_321_1,
			animator = var_321_2
		}
	end

	if arg_321_0.sceneAnimatorDict[arg_321_1].animator:GetCurrentAnimatorStateInfo(0):IsName(arg_321_2) then
		return
	end

	arg_321_0.sceneAnimatorDict[arg_321_1].animator:PlayInFixedTime(arg_321_2)
end

function var_0_0.ResetSceneItemAnimators(arg_322_0, arg_322_1)
	if not arg_322_0.sceneAnimatorDict then
		return
	end

	table.Foreach(arg_322_0.sceneAnimatorDict, function(arg_323_0, arg_323_1)
		if arg_322_1 and table.contains(arg_322_1, arg_323_0) then
			return
		end

		setActive(arg_323_1.trans, false)
		setActive(arg_323_1.trans, true)

		arg_322_0.sceneAnimatorDict[arg_323_0] = nil
	end)
end

function var_0_0.LoadCharacterExtraItem(arg_324_0, arg_324_1, arg_324_2, arg_324_3, arg_324_4, arg_324_5)
	arg_324_1.extraItems = arg_324_1.extraItems or {}

	if arg_324_1.extraItems[arg_324_2] then
		return
	end

	local var_324_0

	if arg_324_3 == "" then
		var_324_0 = arg_324_1.lady
	else
		table.IpairsCArray(arg_324_1.lady:GetComponentsInChildren(typeof(Transform), true), function(arg_325_0, arg_325_1)
			if arg_325_1.name == arg_324_3 then
				var_324_0 = arg_325_1
			end
		end)
	end

	if not var_324_0 then
		return
	end

	arg_324_0.loader:GetPrefab(string.lower("dorm3d/" .. arg_324_2), "", function(arg_326_0)
		setParent(arg_326_0, var_324_0)

		if arg_324_4 then
			setLocalPosition(arg_326_0, arg_324_4)
		end

		if arg_324_5 then
			setLocalRotation(arg_326_0, arg_324_5)
		end

		arg_324_1.extraItems[arg_324_2] = {
			trans = arg_326_0.transform,
			handler = var_324_0
		}
	end)
end

function var_0_0.ResetCharacterExtraItem(arg_327_0, arg_327_1, arg_327_2)
	if not arg_327_1.extraItems then
		return
	end

	table.Foreach(arg_327_1.extraItems, function(arg_328_0, arg_328_1)
		if arg_327_2 and table.contains(arg_327_2, arg_328_0) then
			return
		end

		arg_327_0.loader:ReturnPrefab(arg_328_1.trans.gameObject)

		arg_327_1.extraItems[arg_328_0] = nil
	end)
end

function var_0_0.RegisterCameraBlendFinished(arg_329_0, arg_329_1, arg_329_2)
	arg_329_0.cameraBlendCallbacks[arg_329_1] = arg_329_2
end

function var_0_0.UnRegisterCameraBlendFinished(arg_330_0, arg_330_1)
	arg_330_0.cameraBlendCallbacks[arg_330_1] = nil
end

function var_0_0.OnCameraBlendFinished(arg_331_0, arg_331_1)
	if not arg_331_1 then
		return
	end

	local var_331_0 = table.removebykey(arg_331_0.cameraBlendCallbacks, arg_331_1)

	existCall(var_331_0)
end

function var_0_0.PlayHeartFX(arg_332_0, arg_332_1)
	local var_332_0 = arg_332_0.ladyDict[arg_332_1]

	setActive(var_332_0.effectHeart, false)
	setActive(var_332_0.effectHeart, true)
	pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_joyful")
end

function var_0_0.PlayExpression(arg_333_0, arg_333_1)
	local var_333_0 = arg_333_1.name
	local var_333_1 = arg_333_0.expressionDict[var_333_0]
	local var_333_2 = 5

	if var_333_1 then
		local var_333_3 = var_333_1.timer

		var_333_3:Reset(nil, var_333_2)
		var_333_3:Start()

		if var_333_1.instance then
			setActive(var_333_1.instance, false)
			setActive(var_333_1.instance, true)
		end

		return
	end

	local var_333_4 = {
		name = var_333_0,
		timer = Timer.New(function()
			arg_333_0:RemoveExpression(var_333_0)
		end, var_333_2, 1, true)
	}

	arg_333_0.expressionDict[var_333_0] = var_333_4

	arg_333_0.loader:GetPrefab("dorm3D/effect/prefab/expression/" .. var_333_0, var_333_0, function(arg_335_0)
		var_333_4.instance = arg_335_0

		onNextTick(function()
			local var_336_0 = arg_333_0.ladyDict[arg_333_0.apartment:GetConfigID()]

			setParent(arg_335_0, var_336_0.ladyHeadCenter)
		end)
		setLocalPosition(arg_335_0, Vector3(0, 0, -0.2))
		setActive(arg_335_0, false)
		setActive(arg_335_0, true)
	end, var_333_4)
end

function var_0_0.RemoveExpression(arg_337_0, arg_337_1)
	local var_337_0 = arg_337_0.expressionDict[arg_337_1]

	if not var_337_0 then
		return
	end

	arg_337_0.loader:ClearRequest(var_337_0)

	if var_337_0.instance then
		arg_337_0.loader:ReturnPrefab(var_337_0.instance)
	end

	arg_337_0.expressionDict[arg_337_1] = nil
end

function var_0_0.ShowOrHideCanWatchMark(arg_338_0, arg_338_1, arg_338_2)
	arg_338_1.ladyWatchFloat = arg_338_1.ladyWatchFloat or cloneTplTo(arg_338_0.resTF:Find("vfx_talk_mark"), arg_338_1.ladyHeadCenter)

	setActive(arg_338_1.ladyWatchFloat, arg_338_2)
end

function var_0_0.RegisterGlobalVolume(arg_339_0)
	local var_339_0 = arg_339_0.globalVolume
	local var_339_1 = LuaHelper.GetOrAddVolumeComponent(var_339_0, typeof(BLHX.PostEffect.Overrides.DepthOfField))
	local var_339_2 = LuaHelper.GetOrAddVolumeComponent(var_339_0, typeof(BLHX.PostEffect.Overrides.ColorGrading))

	arg_339_0.originalCameraSettings = {
		depthOfField = {
			enabled = var_339_1.enabled.value,
			focusDistance = {
				length = 2,
				min = var_339_1.gaussianStart.min,
				value = var_339_1.gaussianStart.value
			},
			blurRadius = {
				min = var_339_1.blurRadius.min,
				max = var_339_1.blurRadius.max,
				value = var_339_1.blurRadius.value
			}
		},
		postExposure = {
			value = var_339_2.postExposure.value
		},
		contrast = {
			min = var_339_2.contrast.min,
			max = var_339_2.contrast.max,
			value = var_339_2.contrast.value
		},
		saturate = {
			min = var_339_2.saturation.min,
			max = var_339_2.saturation.max,
			value = var_339_2.saturation.value
		}
	}
	arg_339_0.originalCameraSettings.depthOfField.enabled = true

	local var_339_3 = var_339_0:GetComponent(typeof(BLHX.Volume.Volume))

	arg_339_0.originalVolume = {
		profile = var_339_3.sharedProfile,
		weight = var_339_3.weight
	}
end

function var_0_0.SettingCamera(arg_340_0, arg_340_1)
	arg_340_0.activeCameraSettings = arg_340_1

	local var_340_0 = arg_340_0.globalVolume
	local var_340_1 = LuaHelper.GetOrAddVolumeComponent(var_340_0, typeof(BLHX.PostEffect.Overrides.DepthOfField))
	local var_340_2 = LuaHelper.GetOrAddVolumeComponent(var_340_0, typeof(BLHX.PostEffect.Overrides.ColorGrading))

	var_340_1.enabled:Override(arg_340_1.depthOfField.enabled)
	var_340_1.gaussianStart:Override(arg_340_1.depthOfField.focusDistance.value)
	var_340_1.gaussianEnd:Override(arg_340_1.depthOfField.focusDistance.value + arg_340_1.depthOfField.focusDistance.length)
	var_340_1.blurRadius:Override(arg_340_1.depthOfField.blurRadius.value)
	var_340_2.postExposure:Override(arg_340_1.postExposure.value)
	var_340_2.contrast:Override(arg_340_1.contrast.value)
	var_340_2.saturation:Override(arg_340_1.saturate.value)
end

function var_0_0.GetCameraSettings(arg_341_0)
	return arg_341_0.originalCameraSettings
end

function var_0_0.RevertCameraSettings(arg_342_0)
	arg_342_0:SettingCamera(arg_342_0.originalCameraSettings)

	arg_342_0.activeCameraSettings = nil
end

function var_0_0.SetVolumeProfile(arg_343_0, arg_343_1, arg_343_2)
	local var_343_0 = arg_343_0.globalVolume:GetComponent(typeof(BLHX.Volume.Volume))

	arg_343_0.activeProfileWeight = arg_343_2

	if arg_343_0.activeProfileName ~= arg_343_1 then
		arg_343_0.activeProfileName = arg_343_1

		arg_343_0.loader:LoadReference("dorm3d/scenesres/res/common", arg_343_1, nil, function(arg_344_0)
			var_343_0.profile = arg_344_0
			var_343_0.weight = arg_343_0.activeProfileWeight

			if arg_343_0.activeCameraSettings then
				arg_343_0:SettingCamera(arg_343_0.activeCameraSettings)
			end
		end, "VolumeProfile")
	else
		var_343_0.weight = arg_343_0.activeProfileWeight
	end
end

function var_0_0.RevertVolumeProfile(arg_345_0)
	local var_345_0 = arg_345_0.globalVolume:GetComponent(typeof(BLHX.Volume.Volume))

	var_345_0.profile = arg_345_0.originalVolume.profile
	var_345_0.weight = arg_345_0.originalVolume.weight

	if arg_345_0.activeCameraSettings then
		arg_345_0:SettingCamera(arg_345_0.activeCameraSettings)
	end

	arg_345_0.activeProfileName = nil
end

function var_0_0.RecordCharacterLight(arg_346_0)
	local var_346_0 = BLHX.Rendering.PipelineInterface.GetCharacterLightColor()

	arg_346_0.originalCharacterColor = {
		color = var_346_0.color,
		intensity = var_346_0.intensity
	}
end

function var_0_0.SetCharacterLight(arg_347_0, arg_347_1, arg_347_2, arg_347_3)
	local var_347_0 = arg_347_0.characterLight:GetComponent(typeof(Light))
	local var_347_1 = Color.Lerp(arg_347_0.originalCharacterColor.color, arg_347_1, arg_347_3)
	local var_347_2 = math.lerp(arg_347_0.originalCharacterColor.intensity, arg_347_2, arg_347_3)

	BLHX.Rendering.PipelineInterface.SetCharacterLight(var_347_1, var_347_2)
end

function var_0_0.RevertCharacterLight(arg_348_0)
	arg_348_0:SetCharacterLight(arg_348_0.originalCharacterColor.color, arg_348_0.originalCharacterColor.intensity, 1)
end

function var_0_0.EnableCloth(arg_349_0, arg_349_1, arg_349_2, arg_349_3)
	arg_349_2 = arg_349_2 or {}

	table.Foreach(arg_349_1.clothComps, function(arg_350_0, arg_350_1)
		if arg_350_1 == nil then
			return
		end

		setActive(arg_350_1, arg_349_2[arg_350_0] == 1)
	end)
	table.Foreach(arg_349_1.clothColliderDict, function(arg_351_0, arg_351_1)
		if arg_351_1 == nil then
			return
		end

		setActive(arg_351_1, false)
	end)

	if arg_349_3 then
		table.Foreach(arg_349_3, function(arg_352_0, arg_352_1)
			local var_352_0 = arg_349_1.clothColliderDict[arg_352_1[1]]

			if var_352_0 == nil then
				return
			end

			setActive(var_352_0, arg_352_1[2] == 1)

			if arg_352_1[2] ~= 1 then
				return
			end

			var_0_0.SetMagicaCollider(var_352_0, arg_352_1[3], arg_352_1[4])
		end)
	end
end

function var_0_0.RevertClothComps(arg_353_0, arg_353_1)
	table.Foreach(arg_353_1.ladyClothCompSettings, function(arg_354_0, arg_354_1)
		arg_354_0.enabled = arg_354_1.enabled
	end)
	table.Foreach(arg_353_1.ladyClothColliderSettings, function(arg_355_0, arg_355_1)
		arg_355_0.enabled = arg_355_1.enabled

		var_0_0.SetMagicaCollider(arg_355_0, arg_355_1.StartRadius, arg_355_1.EndRadius)
	end)
end

function var_0_0.onBackPressed(arg_356_0)
	if arg_356_0.exited or arg_356_0.retainCount > 0 then
		-- block empty
	else
		arg_356_0:closeView()
	end
end

function var_0_0.LoadTimelineScene(arg_357_0, arg_357_1, arg_357_2, arg_357_3, arg_357_4)
	arg_357_0.dormSceneMgr:LoadTimelineScene({
		name = string.lower(arg_357_1),
		assetRootName = arg_357_0.apartment:getConfig("asset_name"),
		isCache = arg_357_2,
		waitForTimeline = arg_357_3,
		callName = arg_357_0.apartment:GetCallName(),
		loadSceneFunc = function(arg_358_0, arg_358_1)
			local var_358_0 = GameObject.Find("[actor]").transform

			arg_357_0:HXCharacter(tf(var_358_0))
		end
	}, arg_357_4)
end

function var_0_0.UnloadTimelineScene(arg_359_0, arg_359_1, arg_359_2, arg_359_3)
	arg_359_0.dormSceneMgr:UnloadTimelineScene(string.lower(arg_359_1), arg_359_2, arg_359_3)
end

function var_0_0.ChangeArtScene(arg_360_0, arg_360_1, arg_360_2)
	arg_360_1 = string.lower(arg_360_1)

	warning(arg_360_0.dormSceneMgr.artSceneInfo, "->", arg_360_1, arg_360_1 == arg_360_0.dormSceneMgr.sceneInfo)

	local var_360_0 = {}

	table.insert(var_360_0, function(arg_361_0)
		arg_360_0.dormSceneMgr:ChangeArtScene(string.lower(arg_360_1), arg_361_0)
	end)

	if arg_360_1 == arg_360_0.dormSceneMgr.sceneInfo or arg_360_0.dormSceneMgr.artSceneInfo == arg_360_0.dormSceneMgr.sceneInfo then
		table.insert(var_360_0, function(arg_362_0)
			setActive(arg_360_0.slotRoot, arg_360_1 == arg_360_0.dormSceneMgr.sceneInfo)
			arg_362_0()
		end)
	end

	if arg_360_1 == arg_360_0.dormSceneMgr.sceneInfo then
		table.insert(var_360_0, function(arg_363_0)
			arg_360_0:SwitchDayNight(arg_360_0.contextData.timeIndex)
			onNextTick(function()
				arg_360_0:RefreshSlots()
				arg_363_0()
			end)
		end)
	end

	seriesAsync(var_360_0, arg_360_2)
end

function var_0_0.ChangeSubScene(arg_365_0, arg_365_1, arg_365_2)
	arg_365_1 = string.lower(arg_365_1)

	warning(arg_365_0.dormSceneMgr.subSceneInfo, "->", arg_365_1, arg_365_1 == arg_365_0.dormSceneMgr.subSceneInfo)

	local var_365_0 = {}

	table.insert(var_365_0, function(arg_366_0)
		arg_365_0.dormSceneMgr:ChangeSubScene(arg_365_1, arg_366_0)
	end)

	local var_365_1 = arg_365_0.ladyDict[arg_365_0.apartment:GetConfigID()]

	table.insert(var_365_0, function(arg_367_0)
		if arg_365_1 == arg_365_0.dormSceneMgr.sceneInfo then
			var_365_1.ladyActiveZone = var_365_1.walkBornPoint or var_365_1.ladyBaseZone
		else
			var_365_1.ladyActiveZone = var_365_1.walkBornPoint or "Default"
		end

		arg_367_0()
	end)

	if arg_365_1 ~= arg_365_0.dormSceneMgr.subSceneInfo then
		table.insert(var_365_0, function(arg_368_0)
			local var_368_0, var_368_1 = Dorm3dSceneMgr.ParseInfo(arg_365_1)
			local var_368_2 = var_368_0 .. "_base"

			arg_365_0:ResetSceneStructure(SceneManager.GetSceneByName(var_368_2))

			if arg_365_1 == arg_365_0.dormSceneMgr.sceneInfo then
				arg_365_0:RefreshSlots()
			else
				arg_365_0:SwitchAnim(var_365_1, var_0_0.ANIM.IDLE)
			end

			if arg_365_0.dormSceneMgr.subSceneInfo == arg_365_0.dormSceneMgr.sceneInfo then
				local var_368_3 = Clone(arg_365_0.room)

				var_368_3.furnitures = {}

				arg_365_0:RefreshSlots(var_368_3)
			end

			arg_368_0()
		end)
	end

	table.insert(var_365_0, function(arg_369_0)
		onNextTick(function()
			arg_365_0:ChangeCharacterPosition(var_365_1)
			arg_365_0:ChangePlayerPosition(var_365_1.ladyActiveZone)
			arg_365_0:TriggerLadyDistance()
			arg_365_0:CheckInSector()
			arg_369_0()
		end)
	end)
	seriesAsync(var_365_0, arg_365_2)
end

function var_0_0.IsPointInSector(arg_371_0, arg_371_1)
	local var_371_0 = arg_371_1 - Vector3.New(unpack(arg_371_0.Position))

	if var_371_0.magnitude > arg_371_0.Radius then
		return false
	end

	local var_371_1 = Quaternion.Euler(unpack(arg_371_0.Rotation))

	return Vector3.Angle(var_371_1 * Vector3.forward, var_371_0) <= arg_371_0.Angle / 2
end

function var_0_0.willExit(arg_372_0)
	arg_372_0.joystickTimer:Stop()
	arg_372_0.moveStickTimer:Stop()
	UpdateBeat:RemoveListener(arg_372_0.updateHandler)
	arg_372_0:StopIKHandTimer()

	if arg_372_0.moveTimer then
		arg_372_0.moveTimer:Stop()

		arg_372_0.moveTimer = nil
	end

	if arg_372_0.moveWaitTimer then
		arg_372_0.moveWaitTimer:Stop()

		arg_372_0.moveWaitTimer = nil
	end

	GlobalClickEventMgr.Inst:RemoveBeginPinchFunc()
	GlobalClickEventMgr.Inst:RemovePinchFunc()
	GlobalClickEventMgr.Inst:RemoveEndPinchFunc()

	if not IsNil(arg_372_0.furnitures) then
		eachChild(arg_372_0.furnitures, function(arg_373_0)
			local var_373_0 = GetComponent(arg_373_0, typeof(EventTriggerListener))

			if not var_373_0 then
				return
			end

			var_373_0:ClearEvents()
		end)
	end

	pg.IKMgr.GetInstance():ResetActiveIKs()

	for iter_372_0, iter_372_1 in pairs(arg_372_0.ladyDict) do
		GetComponent(iter_372_1.lady, typeof(EventTriggerListener)):ClearEvents()
	end

	arg_372_0.camBrainEvenetHandler.OnBlendStarted = nil
	arg_372_0.camBrainEvenetHandler.OnBlendFinished = nil

	pg.UIMgr.GetInstance():UnOverlayPanel(arg_372_0.blockLayer, arg_372_0._tf)
	table.Foreach(arg_372_0.expressionDict, function(arg_374_0)
		arg_372_0:RemoveExpression(arg_374_0)
	end)
	arg_372_0.loader:Clear()
	pg.ClickEffectMgr:GetInstance():SetClickEffect("NORMAL")
	pg.NodeCanvasMgr.GetInstance():Clear()
	arg_372_0.dormSceneMgr:Dispose()

	arg_372_0.dormSceneMgr = nil

	ReflectionHelp.RefSetProperty(typeof("UnityEngine.LightmapSettings"), "lightmaps", nil, nil)
end

function var_0_0.InitDefautQuality()
	if PlayerPrefs.GetInt("dorm3d_graphics_settings", 0) == 0 then
		local var_375_0 = DevicePerformanceUtil.GetDevicePerformanceLevel()

		if PLATFORM == PLATFORM_IPHONEPLAYER then
			local var_375_1 = SystemInfo.deviceModel or ""

			local function var_375_2(arg_376_0)
				local var_376_0 = string.match(arg_376_0, "iPad(%d+)")
				local var_376_1 = tonumber(var_376_0)

				if var_376_1 and var_376_1 >= 8 then
					return true
				end

				return false
			end

			local function var_375_3(arg_377_0)
				local var_377_0 = string.match(arg_377_0, "iPhone(%d+)")
				local var_377_1 = tonumber(var_377_0)

				if var_377_1 and var_377_1 >= 13 then
					return true
				end

				return false
			end

			if var_375_2(var_375_1) or var_375_3(var_375_1) then
				var_375_0 = DevicePerformanceLevel.High
			end
		end

		local var_375_4 = var_375_0 == DevicePerformanceLevel.High and 3 or var_375_0 == DevicePerformanceLevel.Mid and 2 or 1

		PlayerPrefs.SetInt("dorm3d_graphics_settings", var_375_4)

		Dorm3dRoomTemplateScene.FirstDefaultSetting = var_375_4
	end
end

function var_0_0.SettingQuality()
	local var_378_0 = GraphicSettingConst.HandleCustomSetting()

	BLHX.Rendering.EngineCore.SetOverrideQualitySettings(var_378_0)
end

function var_0_0.SetMagicaCollider(arg_379_0, arg_379_1, arg_379_2)
	local var_379_0 = typeof("MagicaCloth.MagicaCapsuleCollider")

	ReflectionHelp.RefSetProperty(var_379_0, "StartRadius", arg_379_0, arg_379_1)
	ReflectionHelp.RefSetProperty(var_379_0, "EndRadius", arg_379_0, arg_379_2)
end

return var_0_0
