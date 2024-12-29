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
	arg_10_0.room = getProxy(ApartmentProxy):getRoom(arg_10_0.contextData.roomId)
	arg_10_0.sceneInfo = string.lower(arg_10_0.room:getConfig("scene_info"))
	arg_10_0.artSceneInfo = arg_10_0.sceneInfo
	arg_10_0.subSceneInfo = arg_10_0.sceneInfo

	local var_10_0, var_10_1 = unpack(string.split(arg_10_0.sceneInfo, "|"))
	local var_10_2 = {
		function(arg_11_0)
			SceneOpMgr.Inst:LoadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_10_1 .. "/" .. var_10_0 .. "_scene"), var_10_0, LoadSceneMode.Additive, function(arg_12_0, arg_12_1)
				SceneManager.SetActiveScene(arg_12_0)

				local var_12_0 = getSceneRootTFDic(arg_12_0).MainCamera

				if var_12_0 then
					setActive(var_12_0, false)
				end

				arg_11_0()
			end)
		end,
		function(arg_13_0)
			SceneOpMgr.Inst:LoadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_10_1 .. "/" .. var_10_0 .. "_base_scene"), var_10_0 .. "_base", LoadSceneMode.Additive, arg_13_0)
		end
	}

	table.insert(var_10_2, function(arg_14_0)
		arg_10_0:LoadCharacter(arg_10_0.contextData.groupIds, arg_14_0)
	end)
	seriesAsync(var_10_2, arg_10_1)
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
	tolua.loadassembly("MagicaCloth")

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
	arg_40_0.compDolly = arg_40_0.cameraAim:GetCinemachineComponent(Cinemachine.CinemachineCore.Stage.Body)
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
	arg_87_0.cameras[var_0_0.CAMERA.TALK].Follow = arg_87_1.ladyInterest
	arg_87_0.cameras[var_0_0.CAMERA.TALK].LookAt = arg_87_1.ladyInterest
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

function var_0_0.WalkByRootMotionLoop(arg_158_0, arg_158_1, arg_158_2)
	if arg_158_1.pathPending then
		arg_158_2:SetFloat("Speed", 0)

		return
	end

	arg_158_2:SetFloat("Speed", 1)

	local var_158_0 = arg_158_1.path.corners

	if var_158_0.Length > 1 then
		local var_158_1 = var_158_0[1] - arg_158_1.transform.position

		var_158_1.y = 0

		local var_158_2 = Quaternion.LookRotation(var_158_1)
		local var_158_3 = arg_158_1.transform.rotation
		local var_158_4 = 1
		local var_158_5 = Damp(1, var_158_4, Time.deltaTime)

		arg_158_1.transform.rotation = Quaternion.Lerp(var_158_3, var_158_2, var_158_5)
	end
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

	setActive(arg_199_0:GetIKTipsRootTF(), false)

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

	setActive(arg_210_0:GetIKTipsRootTF(), false)
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
	arg_234_0:HideCharacter()
end

function var_0_0.ExitFurnitureWatchMode(arg_235_0)
	arg_235_0:HideFurnitureSlots()

	local var_235_0 = arg_235_0.cameras[var_0_0.CAMERA.POV]

	seriesAsync({
		function(arg_236_0)
			arg_235_0:emit(var_0_0.SHOW_BLOCK)
			arg_235_0:ShowBlackScreen(true, arg_236_0)
		end,
		function(arg_237_0)
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
		arg_276_0:LoadTimelineScene(arg_276_1.name, false, arg_278_0)
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

	local var_276_1 = arg_276_0.artSceneInfo

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

				function arg_304_0.animExtraItemCallback()
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

			existCall(arg_304_0.animExtraItemCallback)

			arg_304_0.animExtraItemCallback = nil

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

function var_0_0.EnableSceneDisplay(arg_357_0, arg_357_1, arg_357_2)
	assert(tobool(arg_357_0.lastSceneRootDict[arg_357_1]) == arg_357_2)

	if arg_357_2 then
		table.Foreach(arg_357_0.lastSceneRootDict[arg_357_1], function(arg_358_0, arg_358_1)
			if IsNil(arg_358_0) then
				return
			end

			setActive(arg_358_0, arg_358_1)
		end)

		arg_357_0.lastSceneRootDict[arg_357_1] = nil
	else
		arg_357_0.lastSceneRootDict[arg_357_1] = {}

		local var_357_0 = SceneManager.GetSceneByName(arg_357_1)

		table.IpairsCArray(var_357_0:GetRootGameObjects(), function(arg_359_0, arg_359_1)
			if tostring(arg_359_1.hideFlags) ~= "None" then
				return
			end

			arg_357_0.lastSceneRootDict[arg_357_1][arg_359_1] = isActive(arg_359_1)

			setActive(arg_359_1, false)
		end)
	end
end

function var_0_0.ChangeArtScene(arg_360_0, arg_360_1, arg_360_2)
	arg_360_1 = string.lower(arg_360_1)

	if arg_360_1 == arg_360_0.artSceneInfo then
		if arg_360_1 == arg_360_0.sceneInfo then
			arg_360_0:SwitchDayNight(arg_360_0.contextData.timeIndex)
			onNextTick(function()
				arg_360_0:RefreshSlots()
				existCall(arg_360_2)
			end)
		else
			existCall(arg_360_2)
		end

		return
	end

	local var_360_0 = {}
	local var_360_1 = false
	local var_360_2

	table.insert(var_360_0, function(arg_362_0)
		arg_360_0.artSceneInfo = arg_360_1

		if var_360_1 then
			pg.SceneAnimMgr.GetInstance():Dorm3DSceneChange(function(arg_363_0)
				var_360_2 = arg_363_0

				arg_362_0()
			end)
		else
			arg_362_0()
		end
	end)

	if arg_360_1 == arg_360_0.sceneInfo then
		table.insert(var_360_0, function(arg_364_0)
			setActive(arg_360_0.slotRoot, true)

			local var_364_0, var_364_1 = unpack(string.split(arg_360_0.sceneInfo, "|"))

			SceneManager.SetActiveScene(SceneManager.GetSceneByName(var_364_0))
			arg_360_0:EnableSceneDisplay(var_364_0, true)
			arg_360_0:SwitchDayNight(arg_360_0.contextData.timeIndex)
			onNextTick(function()
				arg_360_0:RefreshSlots()
			end)
			arg_364_0()
		end)
	else
		var_360_1 = true

		local var_360_3, var_360_4 = unpack(string.split(arg_360_1, "|"))

		table.insert(var_360_0, function(arg_366_0)
			setActive(arg_360_0.slotRoot, false)
			SceneOpMgr.Inst:LoadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_360_4 .. "/" .. var_360_3 .. "_scene"), var_360_3, LoadSceneMode.Additive, function(arg_367_0, arg_367_1)
				SceneManager.SetActiveScene(arg_367_0)

				local var_367_0 = getSceneRootTFDic(arg_367_0).MainCamera

				if var_367_0 then
					setActive(var_367_0, false)
				end

				arg_366_0()
			end)
		end)
	end

	if arg_360_0.artSceneInfo == arg_360_0.sceneInfo then
		table.insert(var_360_0, function(arg_368_0)
			local var_368_0, var_368_1 = unpack(string.split(arg_360_0.sceneInfo, "|"))

			arg_360_0:EnableSceneDisplay(var_368_0, false)
			arg_368_0()
		end)
	else
		local var_360_5, var_360_6 = unpack(string.split(arg_360_0.artSceneInfo, "|"))

		table.insert(var_360_0, function(arg_369_0)
			SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_360_6 .. "/" .. var_360_5 .. "_scene"), var_360_5, arg_369_0)
		end)
	end

	table.insert(var_360_0, function(arg_370_0)
		arg_370_0()

		if var_360_1 then
			var_360_2()
		end
	end)
	seriesAsync(var_360_0, arg_360_2)
end

function var_0_0.LoadTimelineScene(arg_371_0, arg_371_1, arg_371_2, arg_371_3)
	arg_371_1 = string.lower(arg_371_1)

	if arg_371_0.cacheSceneDic[arg_371_1] then
		if not arg_371_2 then
			arg_371_0.timelineScene = arg_371_1

			arg_371_0:EnableSceneDisplay(arg_371_1, true)
		end

		return existCall(arg_371_3)
	end

	local var_371_0 = {}
	local var_371_1

	table.insert(var_371_0, function(arg_372_0)
		pg.SceneAnimMgr.GetInstance():Dorm3DSceneChange(function(arg_373_0)
			if arg_371_0.waitForTimeline then
				arg_371_0.waitForTimeline = arg_373_0
				var_371_1 = nil
			else
				var_371_1 = arg_373_0
			end

			arg_372_0()
		end)
	end)
	table.insert(var_371_0, function(arg_374_0)
		local var_374_0 = arg_371_0.apartment:getConfig("asset_name")

		SceneOpMgr.Inst:LoadSceneAsync(string.lower("dorm3d/character/" .. var_374_0 .. "/timeline/" .. arg_371_1 .. "/" .. arg_371_1 .. "_scene"), arg_371_1, LoadSceneMode.Additive, function(arg_375_0, arg_375_1)
			local var_375_0 = GameObject.Find("[actor]").transform

			arg_371_0:HXCharacter(tf(var_375_0))

			local var_375_1 = GameObject.Find("[sequence]").transform:GetComponent(typeof(UnityEngine.Playables.PlayableDirector))

			var_375_1:Stop()
			TimelineSupport.InitTimeline(var_375_1)
			TimelineSupport.InitSubtitle(var_375_1, arg_371_0.apartment:GetCallName())

			arg_371_0.unloadDirector = var_375_1

			arg_374_0()
		end)
	end)
	table.insert(var_371_0, function(arg_376_0)
		arg_371_0.sceneGroupDic[arg_371_1] = arg_371_0.apartment:GetConfigID()

		if arg_371_2 then
			arg_371_0.cacheSceneDic[arg_371_1] = true

			arg_371_0:EnableSceneDisplay(arg_371_1, false)
		else
			arg_371_0.timelineScene = arg_371_1
		end

		arg_376_0()
		existCall(var_371_1)
	end)
	seriesAsync(var_371_0, arg_371_3)
end

function var_0_0.UnloadTimelineScene(arg_377_0, arg_377_1, arg_377_2, arg_377_3)
	arg_377_1 = string.lower(arg_377_1)

	if arg_377_0.timelineScene == arg_377_1 then
		arg_377_0.timelineScene = nil
	end

	if tobool(arg_377_2) == tobool(arg_377_0.cacheSceneDic[arg_377_1]) then
		local var_377_0 = getProxy(ApartmentProxy):getApartment(arg_377_0.sceneGroupDic[arg_377_1]):getConfig("asset_name")

		if arg_377_0.unloadDirector then
			TimelineSupport.UnloadPlayable(arg_377_0.unloadDirector)

			arg_377_0.unloadDirector = nil
		end

		SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/character/scenes/" .. var_377_0 .. "/timeline/" .. arg_377_1 .. "/" .. arg_377_1 .. "_scene"), arg_377_1, function()
			arg_377_0.cacheSceneDic[arg_377_1] = nil
			arg_377_0.sceneGroupDic[arg_377_1] = nil
			arg_377_0.lastSceneRootDict[arg_377_1] = nil

			existCall(arg_377_3)
		end)
	else
		arg_377_0:EnableSceneDisplay(arg_377_1, false)
		existCall(arg_377_3)
	end
end

function var_0_0.ChangeSubScene(arg_379_0, arg_379_1, arg_379_2)
	arg_379_1 = string.lower(arg_379_1)

	warning(arg_379_0.subSceneInfo, "->", arg_379_1, arg_379_1 == arg_379_0.subSceneInfo)

	local var_379_0 = arg_379_0.ladyDict[arg_379_0.apartment:GetConfigID()]

	if arg_379_1 == arg_379_0.subSceneInfo then
		var_379_0.ladyActiveZone = var_379_0.walkBornPoint or var_379_0.ladyBaseZone

		arg_379_0:ChangeCharacterPosition(var_379_0)
		arg_379_0:ChangePlayerPosition(var_379_0.ladyActiveZone)
		arg_379_0:TriggerLadyDistance()
		arg_379_0:CheckInSector()
		existCall(arg_379_2)

		return
	end

	local var_379_1 = {}
	local var_379_2 = false
	local var_379_3

	table.insert(var_379_1, function(arg_380_0)
		arg_379_0.subSceneInfo = arg_379_1

		if var_379_2 then
			pg.SceneAnimMgr.GetInstance():Dorm3DSceneChange(function(arg_381_0)
				var_379_3 = arg_381_0

				arg_380_0()
			end)
		else
			arg_380_0()
		end
	end)

	if arg_379_1 == arg_379_0.sceneInfo then
		table.insert(var_379_1, function(arg_382_0)
			local var_382_0, var_382_1 = unpack(string.split(arg_379_0.sceneInfo, "|"))

			arg_379_0:ResetSceneStructure(SceneManager.GetSceneByName(var_382_0 .. "_base"))
			arg_379_0:RefreshSlots()

			var_379_0.ladyActiveZone = var_379_0.walkBornPoint or var_379_0.ladyBaseZone

			arg_379_0:ChangeCharacterPosition(var_379_0)
			arg_379_0:ChangePlayerPosition(var_379_0.ladyActiveZone)
			arg_379_0:TriggerLadyDistance()
			arg_379_0:CheckInSector()
			arg_382_0()
		end)
	else
		var_379_2 = true

		local var_379_4, var_379_5 = unpack(string.split(arg_379_1, "|"))
		local var_379_6 = var_379_4 .. "_base"

		table.insert(var_379_1, function(arg_383_0)
			SceneOpMgr.Inst:LoadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_379_5 .. "/" .. var_379_6 .. "_scene"), var_379_6, LoadSceneMode.Additive, arg_383_0)
		end)
		table.insert(var_379_1, function(arg_384_0)
			arg_379_0:ResetSceneStructure(SceneManager.GetSceneByName(var_379_6))

			var_379_0.ladyActiveZone = var_379_0.walkBornPoint or "Default"

			arg_379_0:SwitchAnim(var_379_0, var_0_0.ANIM.IDLE)
			onNextTick(function()
				arg_379_0:ChangeCharacterPosition(var_379_0)
				arg_379_0:ChangePlayerPosition(var_379_0.ladyActiveZone)
				arg_379_0:TriggerLadyDistance()
				arg_379_0:CheckInSector()
				arg_384_0()
			end)
		end)
	end

	if arg_379_0.subSceneInfo == arg_379_0.sceneInfo then
		table.insert(var_379_1, function(arg_386_0)
			local var_386_0 = Clone(arg_379_0.room)

			var_386_0.furnitures = {}

			arg_379_0:RefreshSlots(var_386_0)
			arg_386_0()
		end)
	else
		local var_379_7, var_379_8 = unpack(string.split(arg_379_0.subSceneInfo, "|"))
		local var_379_9 = var_379_7 .. "_base"

		table.insert(var_379_1, function(arg_387_0)
			SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_379_8 .. "/" .. var_379_9 .. "_scene"), var_379_9, arg_387_0)
		end)
	end

	table.insert(var_379_1, function(arg_388_0)
		arg_388_0()

		if var_379_2 then
			var_379_3()
		end
	end)
	seriesAsync(var_379_1, arg_379_2)
end

function var_0_0.IsPointInSector(arg_389_0, arg_389_1)
	local var_389_0 = arg_389_1 - Vector3.New(unpack(arg_389_0.Position))

	if var_389_0.magnitude > arg_389_0.Radius then
		return false
	end

	local var_389_1 = Quaternion.Euler(unpack(arg_389_0.Rotation))

	return Vector3.Angle(var_389_1 * Vector3.forward, var_389_0) <= arg_389_0.Angle / 2
end

function var_0_0.willExit(arg_390_0)
	arg_390_0.joystickTimer:Stop()
	arg_390_0.moveStickTimer:Stop()
	UpdateBeat:RemoveListener(arg_390_0.updateHandler)
	arg_390_0:StopIKHandTimer()

	if arg_390_0.moveTimer then
		arg_390_0.moveTimer:Stop()

		arg_390_0.moveTimer = nil
	end

	if arg_390_0.moveWaitTimer then
		arg_390_0.moveWaitTimer:Stop()

		arg_390_0.moveWaitTimer = nil
	end

	GlobalClickEventMgr.Inst:RemoveBeginPinchFunc()
	GlobalClickEventMgr.Inst:RemovePinchFunc()
	GlobalClickEventMgr.Inst:RemoveEndPinchFunc()

	if not IsNil(arg_390_0.furnitures) then
		eachChild(arg_390_0.furnitures, function(arg_391_0)
			local var_391_0 = GetComponent(arg_391_0, typeof(EventTriggerListener))

			if not var_391_0 then
				return
			end

			var_391_0:ClearEvents()
		end)
	end

	pg.IKMgr.GetInstance():ResetActiveIKs()

	for iter_390_0, iter_390_1 in pairs(arg_390_0.ladyDict) do
		GetComponent(iter_390_1.lady, typeof(EventTriggerListener)):ClearEvents()
	end

	arg_390_0.camBrainEvenetHandler.OnBlendStarted = nil
	arg_390_0.camBrainEvenetHandler.OnBlendFinished = nil

	pg.UIMgr.GetInstance():UnOverlayPanel(arg_390_0.blockLayer, arg_390_0._tf)
	table.Foreach(arg_390_0.expressionDict, function(arg_392_0)
		arg_390_0:RemoveExpression(arg_392_0)
	end)
	arg_390_0.loader:Clear()
	pg.ClickEffectMgr:GetInstance():SetClickEffect("NORMAL")
	pg.NodeCanvasMgr.GetInstance():Clear()

	local var_390_0 = {}

	if arg_390_0.timelineScene and not arg_390_0.cacheSceneDic[arg_390_0.timelineScene] then
		local var_390_1 = arg_390_0.timelineScene

		arg_390_0.timelineScene = nil

		local var_390_2 = getProxy(ApartmentProxy):getApartment(arg_390_0.sceneGroupDic[var_390_1]):getConfig("asset_name")

		table.insert(var_390_0, function(arg_393_0)
			SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/character/scenes/" .. var_390_2 .. "/timeline/" .. var_390_1 .. "/" .. var_390_1 .. "_scene"), var_390_1, arg_393_0)
		end)
	end

	for iter_390_2, iter_390_3 in pairs(arg_390_0.cacheSceneDic) do
		if iter_390_3 then
			local var_390_3 = getProxy(ApartmentProxy):getApartment(arg_390_0.sceneGroupDic[iter_390_2]):getConfig("asset_name")

			table.insert(var_390_0, function(arg_394_0)
				SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/character/scenes/" .. var_390_3 .. "/timeline/" .. iter_390_2 .. "/" .. iter_390_2 .. "_scene"), iter_390_2, arg_394_0)
			end)
		end
	end

	for iter_390_4, iter_390_5 in ipairs({
		arg_390_0.sceneInfo,
		arg_390_0.subSceneInfo ~= arg_390_0.sceneInfo and arg_390_0.subSceneInfo or nil
	}) do
		local var_390_4, var_390_5 = unpack(string.split(iter_390_5, "|"))
		local var_390_6 = var_390_4 .. "_base"

		table.insert(var_390_0, function(arg_395_0)
			SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_390_5 .. "/" .. var_390_6 .. "_scene"), var_390_6, arg_395_0)
		end)
	end

	for iter_390_6, iter_390_7 in ipairs({
		arg_390_0.sceneInfo,
		arg_390_0.artSceneInfo ~= arg_390_0.sceneInfo and arg_390_0.artSceneInfo or nil
	}) do
		local var_390_7, var_390_8 = unpack(string.split(iter_390_7, "|"))

		table.insert(var_390_0, function(arg_396_0)
			SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_390_8 .. "/" .. var_390_7 .. "_scene"), var_390_7, arg_396_0)
		end)
	end

	seriesAsync(var_390_0, function()
		ReflectionHelp.RefSetProperty(typeof("UnityEngine.LightmapSettings"), "lightmaps", nil, nil)
	end)
end

function var_0_0.InitDefautQuality()
	if PlayerPrefs.GetInt("dorm3d_graphics_settings", 0) == 0 then
		local var_398_0 = DevicePerformanceUtil.GetDevicePerformanceLevel()

		if PLATFORM == PLATFORM_IPHONEPLAYER then
			local var_398_1 = SystemInfo.deviceModel or ""

			local function var_398_2(arg_399_0)
				local var_399_0 = string.match(arg_399_0, "iPad(%d+)")
				local var_399_1 = tonumber(var_399_0)

				if var_399_1 and var_399_1 >= 8 then
					return true
				end

				return false
			end

			local function var_398_3(arg_400_0)
				local var_400_0 = string.match(arg_400_0, "iPhone(%d+)")
				local var_400_1 = tonumber(var_400_0)

				if var_400_1 and var_400_1 >= 13 then
					return true
				end

				return false
			end

			if var_398_2(var_398_1) or var_398_3(var_398_1) then
				var_398_0 = DevicePerformanceLevel.High
			end
		end

		local var_398_4 = var_398_0 == DevicePerformanceLevel.High and 3 or var_398_0 == DevicePerformanceLevel.Mid and 2 or 1

		PlayerPrefs.SetInt("dorm3d_graphics_settings", var_398_4)

		Dorm3dRoomTemplateScene.FirstDefaultSetting = var_398_4
	end
end

function var_0_0.SettingQuality()
	local var_401_0 = GraphicSettingConst.HandleCustomSetting()

	BLHX.Rendering.EngineCore.SetOverrideQualitySettings(var_401_0)
end

function var_0_0.SetMagicaCollider(arg_402_0, arg_402_1, arg_402_2)
	local var_402_0 = typeof("MagicaCloth.MagicaCapsuleCollider")

	ReflectionHelp.RefSetProperty(var_402_0, "StartRadius", arg_402_0, arg_402_1)
	ReflectionHelp.RefSetProperty(var_402_0, "EndRadius", arg_402_0, arg_402_2)
end

return var_0_0
