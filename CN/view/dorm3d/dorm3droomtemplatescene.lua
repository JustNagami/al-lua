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
var_0_0.ON_IK_TRIGGER = "Dorm3dRoomTemplateScene.ON_IK_TRIGGER"
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
	},
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

function var_0_0.lowerAdpter(arg_6_0)
	return true
end

function var_0_0.Ctor(arg_7_0, ...)
	var_0_0.super.Ctor(arg_7_0, ...)

	arg_7_0.loader = AutoLoader.New()
	arg_7_0.scene = arg_7_0
end

function var_0_0.SetRoom(arg_8_0, arg_8_1)
	arg_8_0.room = arg_8_1
end

function var_0_0.preload(arg_9_0, arg_9_1)
	arg_9_0.room = getProxy(ApartmentProxy):getRoom(arg_9_0.contextData.roomId)
	arg_9_0.sceneInfo = string.lower(arg_9_0.room:getConfig("scene_info"))
	arg_9_0.artSceneInfo = arg_9_0.sceneInfo
	arg_9_0.subSceneInfo = arg_9_0.sceneInfo

	local var_9_0, var_9_1 = unpack(string.split(arg_9_0.sceneInfo, "|"))
	local var_9_2 = {
		function(arg_10_0)
			SceneOpMgr.Inst:LoadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_9_1 .. "/" .. var_9_0 .. "_scene"), var_9_0, LoadSceneMode.Additive, function(arg_11_0, arg_11_1)
				SceneManager.SetActiveScene(arg_11_0)

				local var_11_0 = getSceneRootTFDic(arg_11_0).MainCamera

				if var_11_0 then
					setActive(var_11_0, false)
				end

				arg_10_0()
			end)
		end,
		function(arg_12_0)
			SceneOpMgr.Inst:LoadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_9_1 .. "/" .. var_9_0 .. "_base_scene"), var_9_0 .. "_base", LoadSceneMode.Additive, arg_12_0)
		end
	}

	table.insert(var_9_2, function(arg_13_0)
		arg_9_0:LoadCharacter(arg_9_0.contextData.groupIds, arg_13_0)
	end)
	seriesAsync(var_9_2, arg_9_1)
end

function var_0_0.init(arg_14_0)
	arg_14_0:BindEvent()
	arg_14_0:InitData()
	arg_14_0:initScene()
	arg_14_0:initNodeCanvas()

	for iter_14_0, iter_14_1 in pairs(arg_14_0.ladyDict) do
		iter_14_1:InitCharacter(iter_14_1, iter_14_0)

		iter_14_1.ladyBaseZone = arg_14_0.contextData.ladyZone[iter_14_0]
		iter_14_1.ladyActiveZone = iter_14_1.ladyBaseZone

		iter_14_1:ChangeCharacterPosition()
	end

	arg_14_0.retainCount = 0
	arg_14_0.sceneBlockLayer = arg_14_0._tf:Find("SceneBlock")

	setActive(arg_14_0.sceneBlockLayer, false)

	arg_14_0.blockLayer = arg_14_0._tf:Find("Block")

	setActive(arg_14_0.blockLayer, false)

	arg_14_0.blackLayer = arg_14_0._tf:Find("BlackScreen")

	setActive(arg_14_0.blackLayer, false)
	arg_14_0:ChangePlayerPosition()

	arg_14_0.cacheSceneDic = {}
	arg_14_0.sceneGroupDic = {}
	arg_14_0.lastSceneRootDict = {}

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
		if arg_21_1.blockIK then
			return
		end

		if arg_21_1.ikHandler then
			return
		end

		local var_21_0 = _.detect(arg_21_1.readyIKLayers, function(arg_22_0)
			return arg_22_0.ikData:IsTrigger(Dorm3dIK.TRIGGER.TOUCH_BODY, arg_21_2)
		end)

		if not var_21_0 then
			return
		end

		arg_21_1.ikHandler = arg_15_0:EnableIKLayer(arg_21_1, var_21_0.ikData)

		local var_21_1 = pg.UIMgr.GetInstance().uiCamera:Find("Canvas").rect

		arg_21_3 = Vector2.New(arg_21_3.x / Screen.width * var_21_1.width, arg_21_3.y / Screen.height * var_21_1.height)

		if not arg_21_1.holdingStatus[var_21_0.ikData] then
			arg_21_1.ikHandler.originScreenPosition = arg_21_3
		else
			local var_21_2 = arg_21_3 - arg_21_1.ikHandler.screenPosition

			arg_21_1.ikHandler.originScreenPosition = arg_21_1.ikHandler.originScreenPosition + var_21_2
			arg_21_1.holdingStatus[var_21_0.ikData] = nil
		end
	end)
	arg_15_0:bind(var_0_0.ON_DRAG_CHARACTER_BODY, function(arg_23_0, arg_23_1, arg_23_2)
		if not arg_23_1.ikHandler then
			return
		end

		local var_23_0 = arg_23_1.ikHandler
		local var_23_1 = pg.UIMgr.GetInstance().uiCamera:Find("Canvas").rect

		arg_23_2 = Vector2.New(arg_23_2.x / Screen.width * var_23_1.width, arg_23_2.y / Screen.height * var_23_1.height)
		var_23_0.screenPosition = arg_23_2

		local var_23_2 = arg_23_2 - var_23_0.originScreenPosition
		local var_23_3 = var_23_0.ikData
		local var_23_4 = var_23_0.rect
		local var_23_5 = var_23_4:Contains(var_23_2)
		local var_23_6 = var_23_0.triggerRect and var_23_0.triggerRect:Contains(var_23_2)

		if not var_23_5 and var_23_3:GetActionTriggerParams()[1] == Dorm3dIK.ACTION_TRIGGER.TOUCH_TARGET and var_23_6 then
			arg_23_1.ikHandler = nil
			arg_23_1.ikNextCheckStamp = nil

			arg_23_1:DeactiveIKLayer(var_23_3)
			table.insert(arg_23_1.activeIKLayers, var_23_3)
			arg_23_1:PlayIKAction(var_23_3)

			return
		end

		local function var_23_7()
			if var_23_5 then
				return var_23_2
			end

			local var_24_0 = var_23_2
			local var_24_1 = var_23_4.center
			local var_24_2 = {
				{
					Vector2.New(var_23_4.xMin, var_23_4.yMin),
					Vector2.New(var_23_4.xMin, var_23_4.yMax)
				},
				{
					Vector2.New(var_23_4.xMin, var_23_4.yMax),
					Vector2.New(var_23_4.xMax, var_23_4.yMax)
				},
				{
					Vector2.New(var_23_4.xMax, var_23_4.yMax),
					Vector2.New(var_23_4.xMax, var_23_4.yMin)
				},
				{
					Vector2.New(var_23_4.xMax, var_23_4.yMin),
					Vector2.New(var_23_4.xMin, var_23_4.yMin)
				}
			}

			for iter_24_0 = 1, 4 do
				local var_24_3, var_24_4 = SegmentUtil.GetCrossPoint(var_24_1, var_24_0, unpack(var_24_2[iter_24_0]))

				if var_24_3 then
					return var_24_4
				end
			end

			assert(false)

			return var_24_0
		end

		arg_23_1.ikHandler.targetScreenOffset = var_23_7()

		local var_23_8 = Vector2.New((arg_23_2.x / var_23_1.width - 0.5) * var_23_1.width, (arg_23_2.y / var_23_1.height - 0.5) * var_23_1.height)

		setAnchoredPosition(arg_23_1:GetIKHandTF(), var_23_8)
	end)
	arg_15_0:bind(var_0_0.ON_RELEASE_CHARACTER_BODY, function(arg_25_0, arg_25_1)
		if not arg_25_1.ikHandler then
			return
		end

		local var_25_0 = arg_25_1.ikHandler
		local var_25_1 = arg_25_1.ikHandler.ikData

		arg_25_1.ikHandler = nil
		arg_25_1.ikNextCheckStamp = nil

		local var_25_2
		local var_25_3 = var_25_1:GetActionTriggerParams()

		if var_25_3[1] == Dorm3dIK.ACTION_TRIGGER.RELEASE then
			var_25_2 = true
		elseif var_25_3[1] == Dorm3dIK.ACTION_TRIGGER.RELEASE_ON_TARGET then
			local var_25_4 = var_25_0.screenPosition - var_25_0.originScreenPosition

			if var_25_0.triggerRect and var_25_0.triggerRect:Contains(var_25_4) then
				var_25_2 = true
			end
		end

		arg_25_1:DeactiveIKLayer(var_25_1)

		if var_25_2 then
			arg_25_1:PlayIKAction(var_25_1)
		else
			local var_25_5 = var_25_1:GetRevertTime()

			if var_25_5 < 999 then
				table.insert(arg_25_1.activeIKLayers, var_25_1)
				arg_25_1.RevertIKLayer(arg_25_1, var_25_5)
			else
				arg_25_1.holdingStatus[var_25_1] = {
					ikHandler = var_25_0
				}
			end
		end

		arg_25_1:emit(var_0_0.ON_IK_STATUS_CHANGED, var_25_1:GetConfigID(), var_0_0.IK_STATUS.RELEASE)
	end)
	arg_15_0:bind(var_0_0.ON_POV_STICK_MOVE_BEGIN, function(arg_26_0, arg_26_1)
		if arg_15_0.pinchMode then
			return
		end

		arg_15_0.moveStickOrigin = arg_26_1.position
		arg_15_0.moveStickPosition = arg_15_0.moveStickOrigin
		arg_15_0.moveStickDraging = true
	end)

	local function var_15_0()
		arg_15_0.moveStickOrigin = nil
		arg_15_0.moveStickPosition = nil
		arg_15_0.moveStickDraging = nil
	end

	arg_15_0:bind(var_0_0.ON_POV_STICK_MOVE_END, function(arg_28_0, arg_28_1)
		var_15_0()
	end)
	arg_15_0:bind(var_0_0.ON_POV_STICK_MOVE, function(arg_29_0, arg_29_1)
		if arg_15_0.pinchMode then
			var_15_0()

			return
		end

		if not arg_15_0.moveStickDraging then
			return
		end

		arg_15_0.moveStickPosition = arg_15_0.moveStickPosition + arg_29_1

		if isActive(arg_15_0.povLayer:Find("Guide")) then
			setActive(arg_15_0.povLayer:Find("Guide"), false)
		end
	end)

	local var_15_1 = 32.4 / Screen.height

	arg_15_0:bind(var_0_0.ON_POV_STICK_VIEW, function(arg_30_0, arg_30_1)
		if arg_15_0.pinchMode then
			return
		end

		arg_30_1 = arg_30_1 * var_15_1

		local var_30_0 = arg_30_1.x
		local var_30_1 = arg_30_1.y

		local function var_30_2(arg_31_0, arg_31_1, arg_31_2)
			local var_31_0 = arg_31_0[arg_31_1]

			var_31_0.m_InputAxisValue = arg_31_2
			arg_31_0[arg_31_1] = var_31_0
		end

		if isActive(arg_15_0.cameras[var_0_0.CAMERA.POV]) then
			var_30_2(arg_15_0.compPovAim, "m_HorizontalAxis", var_30_0)
			var_30_2(arg_15_0.compPovAim, "m_VerticalAxis", var_30_1)
		elseif isActive(arg_15_0.cameras[var_0_0.CAMERA.PHOTO_FREE]) then
			local var_30_3 = arg_15_0.cameras[var_0_0.CAMERA.PHOTO_FREE]:Find("PhotoFree Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera)):GetCinemachineComponent(Cinemachine.CinemachineCore.Stage.Aim)

			var_30_2(var_30_3, "m_HorizontalAxis", var_30_0)
			var_30_2(var_30_3, "m_VerticalAxis", var_30_1)
			onNextTick(function()
				local var_32_0 = arg_15_0.cameras[var_0_0.CAMERA.PHOTO_FREE]
				local var_32_1 = math.InverseLerp(arg_15_0.restrictedHeightRange[1], arg_15_0.restrictedHeightRange[2], var_32_0.position.y)

				arg_15_0:emit(Dorm3dPhotoMediator.CAMERA_LIFT_CHANGED, var_32_1)
			end)
		end
	end)
	arg_15_0:bind(var_0_0.PHOTO_CALL, function(arg_33_0, arg_33_1, ...)
		local var_33_0 = arg_15_0.ladyDict[arg_15_0.apartment:GetConfigID()]

		arg_15_0[arg_33_1](var_33_0, ...)
	end)
end

function var_0_0.initScene(arg_34_0)
	local var_34_0, var_34_1 = unpack(string.split(arg_34_0.sceneInfo, "|"))
	local var_34_2 = SceneManager.GetSceneByName(var_34_0 .. "_base")

	arg_34_0:ResetSceneStructure(var_34_2)

	arg_34_0.mainCameraTF = GameObject.Find("BackYardMainCamera").transform
	arg_34_0.camBrain = arg_34_0.mainCameraTF:GetComponent(typeof(Cinemachine.CinemachineBrain))
	arg_34_0.camBrainEvenetHandler = arg_34_0.mainCameraTF:GetComponent(typeof(CameraBrainEventsHandler))
	arg_34_0.raycastCamera = arg_34_0.mainCameraTF:Find("CameraForRaycast"):GetComponent(typeof(Camera))
	arg_34_0.sceneRaycaster = arg_34_0.raycastCamera:GetComponent(typeof(UnityEngine.EventSystems.PhysicsRaycaster))
	arg_34_0.player = GameObject.Find("Player").transform
	arg_34_0.playerEye = arg_34_0.player:Find("Eye")
	arg_34_0.playerFoot = arg_34_0.player:Find("Foot")

	setActive(arg_34_0.playerFoot, false)

	arg_34_0.playerController = arg_34_0.player:GetComponent(typeof(UnityEngine.CharacterController))
	arg_34_0.attachedPoints = {}

	eachChild(arg_34_0.furnitures, function(arg_35_0)
		table.insert(arg_34_0.attachedPoints, 1, arg_35_0)
	end)

	arg_34_0.dollyParent = GameObject.Find("Dollys").transform
	arg_34_0.modelRoot = GameObject.Find("scene_root").transform
	arg_34_0.slotRoot = GameObject.Find("FurnitureSlots").transform

	setActive(arg_34_0.slotRoot, true)
	arg_34_0:InitSlots()

	arg_34_0.resTF = GameObject.Find("Res").transform

	tolua.loadassembly("Cinemachine")
	tolua.loadassembly("MagicaCloth")

	local var_34_3 = GameObject.Find("CM Cameras").transform

	eachChild(var_34_3, function(arg_36_0)
		setActive(arg_36_0, false)
	end)

	arg_34_0.camBrain.enabled = false
	arg_34_0.camBrain.enabled = true
	arg_34_0.cameraAim = var_34_3:Find("Aim Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))
	arg_34_0.cameraAim2 = var_34_3:Find("Aim2 Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))
	arg_34_0.cameraFree = nil
	arg_34_0.cameraFurnitureWatch = nil
	arg_34_0.cameraRole = var_34_3:Find("Role Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))
	arg_34_0.cameraRole2 = var_34_3:Find("Role2 Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))
	arg_34_0.cameraTalk = var_34_3:Find("Talk Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))
	arg_34_0.cameraGift = var_34_3:Find("Gift Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))
	arg_34_0.cameraRoleWatch = nil
	arg_34_0.cameras = {
		arg_34_0.cameraAim,
		arg_34_0.cameraAim2,
		arg_34_0.cameraRole,
		arg_34_0.cameraTalk,
		arg_34_0.cameraRoleWatch,
		[var_0_0.CAMERA.GIFT] = arg_34_0.cameraGift,
		[var_0_0.CAMERA.ROLE2] = arg_34_0.cameraRole2,
		[var_0_0.CAMERA.PHOTO] = var_34_3:Find("Photo Camera"):GetComponent(typeof(Cinemachine.CinemachineFreeLook)),
		[var_0_0.CAMERA.PHOTO_FREE] = var_34_3:Find("PhotoFree Controller"),
		[var_0_0.CAMERA.POV] = var_34_3:Find("FP Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))
	}
	arg_34_0.compDolly = arg_34_0.cameraAim:GetCinemachineComponent(Cinemachine.CinemachineCore.Stage.Body)
	arg_34_0.compPovAim = arg_34_0.cameras[var_0_0.CAMERA.POV]:GetCinemachineComponent(Cinemachine.CinemachineCore.Stage.Aim)
	arg_34_0.cameraRoot = var_34_3
	arg_34_0.POVOriginalFOV = arg_34_0:GetPOVFOV()
	arg_34_0.restrictedBox = GameObject.Find("RestrictedArea").transform

	setActive(arg_34_0.restrictedBox, false)

	arg_34_0.restrictedHeightRange = {
		arg_34_0.restrictedBox:Find("Floor").position.y,
		arg_34_0.restrictedBox:Find("Celling").position.y
	}
	arg_34_0.ladyInterest = GameObject.Find("InterestProxy").transform
	arg_34_0.daynightCtrlComp = GameObject.Find("[MainBlock]").transform:GetComponent(typeof(DayNightCtrl))

	arg_34_0:SwitchDayNight(arg_34_0.contextData.timeIndex)

	arg_34_0.tfCutIn = getSceneRootTFDic(SceneManager.GetSceneByName(var_34_0 .. "_base")).CutIn

	if arg_34_0.tfCutIn then
		arg_34_0.modelCutIn = {
			lady = arg_34_0.tfCutIn:Find("lady"):GetChild(0),
			player = arg_34_0.tfCutIn:Find("player"):GetChild(0)
		}

		setActive(arg_34_0.tfCutIn, false)
	end
end

function var_0_0.SwitchDayNight(arg_37_0, arg_37_1)
	if not IsNil(arg_37_0.daynightCtrlComp) then
		arg_37_0.daynightCtrlComp:SwitcherToIndex(arg_37_1 - 1)
	end

	arg_37_0:InitLightSettings()
end

function var_0_0.InitLightSettings(arg_38_0)
	arg_38_0.globalVolume = GameObject.Find("GlobalVolume")

	arg_38_0:RegisterGlobalVolume()

	arg_38_0.characterLight = GameObject.Find("CharacterLight")

	arg_38_0:RecordCharacterLight()

	local var_38_0 = GameObject.Find("[Lighting]").transform

	table.IpairsCArray(var_38_0:GetComponentsInChildren(typeof(Light), true), function(arg_39_0, arg_39_1)
		arg_39_1.shadows = UnityEngine.LightShadows.None
	end)
end

function var_0_0.ResetSceneStructure(arg_40_0, arg_40_1)
	table.IpairsCArray(arg_40_1:GetRootGameObjects(), function(arg_41_0, arg_41_1)
		if arg_41_1.name == "Furnitures" then
			arg_40_0.furnitures = tf(arg_41_1)

			eachChild(arg_40_0.furnitures, function(arg_42_0)
				if arg_42_0:Find("FreeLook Camera") then
					setActive(arg_42_0:Find("FreeLook Camera"), false)
				end

				if arg_42_0:Find("FreeLook Camera") then
					setActive(arg_42_0:Find("RoleWatch Camera"), false)
				end

				if arg_42_0:Find("IKCamera") then
					setActive(arg_42_0:Find("IKCamera"), false)
				end

				local var_42_0 = arg_42_0:GetComponent(typeof(UnityEngine.Collider))

				if not var_42_0 then
					return
				end

				var_42_0.enabled = false
			end)
		end
	end)

	arg_40_0.sectorsDic = arg_40_0.sectorsDic or {}

	if not arg_40_0.sectorsDic[arg_40_1.name] then
		arg_40_0.sectorsDic[arg_40_1.name] = table.shallowCopy(var_0_2[arg_40_1.name])

		setmetatable(arg_40_0.sectorsDic[arg_40_1.name], {
			__index = function(arg_43_0, arg_43_1)
				local var_43_0 = arg_40_0.furnitures:Find(arg_43_1 .. "/StayPoint")

				if var_43_0 then
					local var_43_1 = var_43_0.position
					local var_43_2 = var_43_0.eulerAngles

					arg_43_0[arg_43_1] = {
						Radius = 2,
						Angle = 120,
						Position = {
							var_43_1.x,
							var_43_1.y,
							var_43_1.z
						},
						Rotation = {
							var_43_2.x,
							var_43_2.y,
							var_43_2.z
						}
					}

					return arg_43_0[arg_43_1]
				else
					return nil
				end
			end
		})
	end

	arg_40_0.activeSectors = arg_40_0.sectorsDic[arg_40_1.name]
end

function var_0_0.InitSlots(arg_44_0)
	local var_44_0 = arg_44_0.room:GetSlots()
	local var_44_1 = arg_44_0.modelRoot:GetComponentsInChildren(typeof(Transform), true)

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
				arg_44_0:emit(Dorm3dRoomMediator.ON_CLICK_FURNITURE_SLOT, var_45_1)
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

	for iter_47_0, iter_47_1 in pairs(arg_47_0.contactStateDic) do
		arg_47_0.hideContactStateDic[iter_47_0] = math.min(iter_47_1, ApartmentRoom.ITEM_UNLOCK)
		arg_47_0.contactInRangeDic[iter_47_0] = false
	end

	arg_47_0:ActiveContact()
end

function var_0_0.TempHideContact(arg_48_0, arg_48_1)
	arg_48_0.hideConcatFlag = arg_48_1

	arg_48_0:ActiveContact()
end

function var_0_0.ActiveContact(arg_49_0)
	for iter_49_0, iter_49_1 in pairs(arg_49_0.contactInRangeDic) do
		arg_49_0:UpdateContactDisplay(iter_49_0, arg_49_0.contactInRangeDic[iter_49_0] and not arg_49_0.hideConcatFlag and arg_49_0.contactStateDic[iter_49_0] or arg_49_0.hideContactStateDic[iter_49_0])
	end
end

function var_0_0.UpdateContactDisplay(arg_50_0, arg_50_1, arg_50_2)
	local var_50_0 = pg.dorm3d_collection_template[arg_50_1]

	for iter_50_0, iter_50_1 in ipairs(var_50_0.vfx_prefab) do
		local var_50_1 = arg_50_0.modelRoot:Find(iter_50_1)

		if arg_50_0:IsModeInHidePending(iter_50_1) then
			-- block empty
		elseif not arg_50_0.modelRoot:Find(iter_50_1) then
			warning(arg_50_1, iter_50_1)
		else
			setActive(var_50_1, arg_50_2 == ApartmentRoom.ITEM_FIRST)
		end
	end

	for iter_50_2, iter_50_3 in ipairs(var_50_0.model) do
		if arg_50_0:IsModeInHidePending(iter_50_3) then
			-- block empty
		elseif not arg_50_0.modelRoot:Find(iter_50_3) then
			warning(arg_50_1, iter_50_3)
		else
			local var_50_2 = arg_50_0.modelRoot:Find(iter_50_3)
			local var_50_3 = GetComponent(var_50_2, typeof(EventTriggerListener))

			if arg_50_2 == ApartmentRoom.ITEM_FIRST then
				var_50_3 = var_50_3 or GetOrAddComponent(var_50_2, typeof(EventTriggerListener))

				var_50_3:AddPointClickFunc(function(arg_51_0, arg_51_1)
					arg_50_0:emit(var_0_0.CLICK_CONTACT, arg_50_1)
				end)

				var_50_3.enabled = true
			elseif var_50_3 then
				var_50_3.enabled = false
			end

			setActive(var_50_2, arg_50_2 > ApartmentRoom.ITEM_LOCK)
		end
	end
end

function var_0_0.SetFloatEnable(arg_52_0, arg_52_1)
	arg_52_0.enableFloatUpdate = arg_52_1

	if arg_52_1 then
		arg_52_0.ladyDict[arg_52_0.apartment:GetConfigID()]:UpdateFloatPosition()
	end
end

function var_0_0.UpdateFloatPosition(arg_53_0)
	local var_53_0 = arg_53_0:GetScreenPosition(arg_53_0.ladyHeadCenter.position + Vector3(0, 0.2, 0))
	local var_53_1 = arg_53_0:GetLocalPosition(var_53_0, arg_53_0.rtFloatPage)

	setLocalPosition(arg_53_0.rtFloatPage:Find("lady"), var_53_1)
end

function var_0_0.LoadCharacter(arg_54_0, arg_54_1, arg_54_2)
	arg_54_0.hxMatDict = {}
	arg_54_0.ladyDict = {}
	arg_54_0.skinDict = {}

	local var_54_0 = {}

	for iter_54_0, iter_54_1 in ipairs(arg_54_1) do
		local var_54_1 = setmetatable({}, {
			__index = arg_54_0
		})

		arg_54_0.ladyDict[iter_54_1] = var_54_1

		local var_54_2 = getProxy(ApartmentProxy):getApartment(iter_54_1)
		local var_54_3 = var_54_2:getConfig("asset_name")
		local var_54_4 = var_54_2:GetSkinModelID(arg_54_0.room:getConfig("tag"))
		local var_54_5 = pg.dorm3d_resource[var_54_4].model_id

		assert(var_54_5)

		for iter_54_2, iter_54_3 in ipairs({
			"common",
			var_54_5
		}) do
			local var_54_6 = string.format("dorm3d/character/%s/res/%s", var_54_3, iter_54_3)

			if checkABExist(var_54_6) then
				table.insert(var_54_0, function(arg_55_0)
					arg_54_0.loader:LoadBundle(var_54_6, function(arg_56_0)
						for iter_56_0, iter_56_1 in ipairs(arg_56_0:GetAllAssetNames()) do
							local var_56_0, var_56_1, var_56_2 = string.find(iter_56_1, "material_hx[/\\](.*).mat")

							if var_56_0 then
								arg_54_0.hxMatDict[var_56_2] = {
									arg_56_0,
									iter_56_1
								}
							end
						end

						arg_55_0()
					end)
				end)
			end
		end

		var_54_1.skinId = var_54_4
		var_54_1.skinIdList = {
			var_54_4
		}

		table.insert(var_54_0, function(arg_57_0)
			local var_57_0 = string.format("dorm3d/character/%s/prefabs/%s", var_54_3, var_54_5)

			arg_54_0.loader:GetPrefab(var_57_0, "", function(arg_58_0)
				var_54_1.ladyGameobject = arg_58_0
				arg_54_0.skinDict[var_54_4] = {
					ladyGameobject = arg_58_0
				}

				arg_57_0()
			end)
		end)

		if arg_54_0.room:isPersonalRoom() then
			local var_54_7 = var_54_2:GetSkinModelID("touch")

			if var_54_7 then
				table.insert(var_54_1.skinIdList, var_54_7)

				local var_54_8 = pg.dorm3d_resource[var_54_7].model_id

				table.insert(var_54_0, function(arg_59_0)
					local var_59_0 = string.format("dorm3d/character/%s/prefabs/%s", var_54_3, var_54_8)

					arg_54_0.loader:GetPrefab(var_59_0, "", function(arg_60_0)
						arg_54_0.skinDict[var_54_7] = {
							ladyGameobject = arg_60_0
						}
						GetComponent(arg_60_0, "GraphOwner").enabled = false

						onNextTick(function()
							setActive(arg_60_0, false)
						end)
						arg_59_0()
					end)
				end)
			end
		end

		if arg_54_0.contextData.pendingDic[iter_54_1] then
			local var_54_9 = pg.dorm3d_welcome[arg_54_0.contextData.pendingDic[iter_54_1]]

			if var_54_9.item_prefab ~= "" then
				table.insert(var_54_0, function(arg_62_0)
					local var_62_0 = string.lower("dorm3d/furniture/item/" .. var_54_9.item_prefab)

					arg_54_0.loader:GetPrefab(var_62_0, "", function(arg_63_0)
						var_54_1.tfPendintItem = arg_63_0.transform

						onNextTick(function()
							setActive(arg_63_0, false)
						end)
						arg_62_0()
					end)
				end)
			end
		end
	end

	parallelAsync(var_54_0, arg_54_2)
end

function var_0_0.HXCharacter(arg_65_0, arg_65_1)
	if not HXSet.isHx() then
		return
	end

	local var_65_0 = arg_65_1:GetComponentsInChildren(typeof(SkinnedMeshRenderer), true)

	table.IpairsCArray(var_65_0, function(arg_66_0, arg_66_1)
		local var_66_0 = arg_66_1.sharedMaterials
		local var_66_1 = false

		table.IpairsCArray(var_66_0, function(arg_67_0, arg_67_1)
			local var_67_0 = arg_67_1.name

			if not arg_65_0.hxMatDict[var_67_0] then
				return
			end

			var_66_1 = true

			local var_67_1, var_67_2 = unpack(arg_65_0.hxMatDict[var_67_0])
			local var_67_3 = var_67_1:LoadAssetSync(var_67_2, typeof(Material), false, false)

			var_66_0[arg_67_0] = var_67_3

			warning("Replace HX Material", arg_65_0.hxMatDict[var_67_0][2])
		end)

		if var_66_1 then
			arg_66_1.sharedMaterials = var_66_0
		end
	end)
end

function var_0_0.InitCharacter(arg_68_0, arg_68_1, arg_68_2)
	arg_68_1.lady = arg_68_1.ladyGameobject.transform

	arg_68_1.lady:SetParent(arg_68_0.mainCameraTF)
	arg_68_1.lady:SetParent(nil)

	arg_68_1.ladyHeadIKComp = arg_68_1.lady:GetComponent(typeof(HeadAimIK))
	arg_68_1.ladyHeadIKComp.AimTarget = arg_68_0.mainCameraTF:Find("AimTarget")
	arg_68_1.ladyHeadIKData = {
		DampTime = arg_68_1.ladyHeadIKComp.DampTime,
		blinkSpeed = arg_68_1.ladyHeadIKComp.blinkSpeed,
		BodyWeight = arg_68_1.ladyHeadIKComp.BodyWeight,
		HeadWeight = arg_68_1.ladyHeadIKComp.HeadWeight
	}

	local var_68_0 = {}

	table.Foreach(var_0_1, function(arg_69_0, arg_69_1)
		var_68_0[arg_69_1] = arg_69_0
	end)

	arg_68_1.ladyAnimator = arg_68_1.lady:GetComponent(typeof(Animator))
	arg_68_1.ladyAnimBaseLayerIndex = arg_68_1.ladyAnimator:GetLayerIndex("Base Layer")
	arg_68_1.ladyAnimFaceLayerIndex = arg_68_1.ladyAnimator:GetLayerIndex("Face")
	arg_68_1.ladyBoneMaps = {}

	local var_68_1 = arg_68_1.lady:GetComponentsInChildren(typeof(Transform), true)

	table.IpairsCArray(var_68_1, function(arg_70_0, arg_70_1)
		if arg_70_1.name == "BodyCollider" then
			arg_68_1.ladyCollider = arg_70_1
		elseif arg_70_1.name == "Interest" then
			arg_68_1.ladyInterestRoot = arg_70_1
		elseif arg_70_1.name == "Head Center" then
			arg_68_1.ladyHeadCenter = arg_70_1
		end

		if var_68_0[arg_70_1.name] then
			arg_68_1.ladyBoneMaps[var_68_0[arg_70_1.name]] = arg_70_1
		end
	end)

	arg_68_1.ladyColliders = {}
	arg_68_1.ladyTouchColliders = {}

	table.IpairsCArray(arg_68_1.lady:GetComponentsInChildren(typeof(UnityEngine.Collider), true), function(arg_71_0, arg_71_1)
		if arg_71_1:GetType():Equals(typeof(UnityEngine.MeshCollider)) then
			return
		end

		child = tf(arg_71_1)

		local var_71_0 = child.name
		local var_71_1 = var_71_0 and string.find(var_71_0, "Collider") or -1

		if var_71_1 <= 0 then
			errorMsg("Wrong Name to lady Collider : " .. var_71_0)

			return
		end

		local var_71_2 = string.sub(var_71_0, 1, var_71_1 - 1)

		if var_0_0.BONE_TO_TOUCH[var_71_2] == nil then
			return
		end

		arg_68_1.ladyColliders[var_71_2] = child

		table.insert(arg_68_0.ladyTouchColliders, child)
		setActive(child, false)
	end)
	arg_68_0:HXCharacter(arg_68_1.lady)
	;(function()
		local var_72_0 = "dorm3d/effect/prefab/function/vfx_function_aixin02"
		local var_72_1 = "vfx_function_aixin02"

		arg_68_0.loader:GetPrefab(var_72_0, var_72_1, function(arg_73_0)
			arg_68_1.effectHeart = arg_73_0

			setActive(arg_73_0, false)
			onNextTick(function()
				setParent(arg_68_1.effectHeart, arg_68_1.ladyHeadCenter)
			end)
		end)
	end)()

	arg_68_1.clothComps = {}
	arg_68_1.ladyClothCompSettings = {}

	table.IpairsCArray(arg_68_1.lady:GetComponentsInChildren(typeof("MagicaCloth.BaseCloth"), true), function(arg_75_0, arg_75_1)
		table.insert(arg_68_1.clothComps, arg_75_1)

		arg_68_1.ladyClothCompSettings[arg_75_1] = {
			enabled = arg_75_1.enabled
		}
	end)

	arg_68_1.clothColliderDict = {}
	arg_68_1.ladyClothColliderSettings = {}

	local var_68_2 = typeof("MagicaCloth.MagicaCapsuleCollider")

	table.IpairsCArray(arg_68_1.lady:GetComponentsInChildren(var_68_2, true), function(arg_76_0, arg_76_1)
		arg_68_1.clothColliderDict[arg_76_1.name] = arg_76_1
		arg_68_1.ladyClothColliderSettings[arg_76_1] = {
			enabled = arg_76_1.enabled,
			StartRadius = ReflectionHelp.RefGetProperty(var_68_2, "StartRadius", arg_76_1),
			EndRadius = ReflectionHelp.RefGetProperty(var_68_2, "EndRadius", arg_76_1)
		}
	end)
	arg_68_1:EnableCloth(arg_68_1, false)

	arg_68_1.ladyIKRoot = arg_68_1.lady:Find("IKLayers")

	eachChild(arg_68_1.ladyIKRoot, function(arg_77_0)
		setActive(arg_77_0, false)
	end)
	GetComponent(arg_68_1.lady, typeof(EventTriggerListener)):AddPointClickFunc(function(arg_78_0, arg_78_1)
		if arg_78_1.rawPointerPress.transform == arg_68_1.ladyCollider then
			arg_68_1:emit(var_0_0.CLICK_CHARACTER, arg_68_2)
		else
			local var_78_0 = table.keyof(arg_68_1.ladyColliders, arg_78_1.rawPointerPress.transform)

			arg_68_1:emit(var_0_0.ON_TOUCH_CHARACTER, var_0_0.BONE_TO_TOUCH[var_78_0] or arg_78_1.rawPointerPress.name)
		end
	end)
	arg_68_1.ladyAnimator:GetComponent("DftAniEvent"):SetCommonEvent(function(arg_79_0)
		if arg_68_1.nowState and arg_79_0.animatorStateInfo:IsName(arg_68_1.nowState) then
			existCall(arg_68_1.stateCallback)

			return
		end

		local var_79_0 = arg_79_0.animatorStateInfo

		for iter_79_0, iter_79_1 in pairs(arg_68_1.animCallbacks) do
			if var_79_0:IsName(iter_79_0) then
				warning("Active", iter_79_0)

				local var_79_1 = table.removebykey(arg_68_1.animCallbacks, iter_79_0)

				existCall(var_79_1)

				return
			end
		end

		if arg_79_0.stringParameter ~= "" then
			arg_68_0:OnAnimationEvent(arg_79_0)
		end
	end)

	arg_68_1.animEventCallbacks = {}
	arg_68_1.animCallbacks = {}
end

function var_0_0.SwitchCharacterSkin(arg_80_0, arg_80_1, arg_80_2, arg_80_3)
	local var_80_0 = arg_80_0.skinIdList

	assert(table.contains(var_80_0, arg_80_2))

	local var_80_1 = arg_80_0:GetCurrentAnim()
	local var_80_2 = arg_80_0.skinId
	local var_80_3 = arg_80_0.skinDict[var_80_2].ladyGameobject
	local var_80_4 = var_80_3.transform.position
	local var_80_5 = var_80_3.transform.rotation

	setActive(var_80_3, false)

	arg_80_0.skinId = arg_80_2

	setActive(arg_80_0.skinDict[arg_80_2].ladyGameobject, true)

	arg_80_0.ladyGameobject = arg_80_0.skinDict[arg_80_2].ladyGameobject
	arg_80_0.ladyCollider = nil

	arg_80_0:InitCharacter(arg_80_0, arg_80_1)
	arg_80_0.ladyAnimator:Play(var_80_1, arg_80_0.ladyAnimBaseLayerIndex)
	onNextTick(function()
		arg_80_0.lady:SetPositionAndRotation(var_80_4, var_80_5)
		existCall(arg_80_3)
	end)
end

function var_0_0.SetCameraLady(arg_82_0)
	arg_82_0.cameraAim2.LookAt = arg_82_0.ladyInterestRoot
	arg_82_0.cameraTalk.Follow = arg_82_0.ladyInterestRoot
	arg_82_0.cameraTalk.LookAt = arg_82_0.ladyInterestRoot
	arg_82_0.cameraGift.Follow = arg_82_0.ladyInterest
	arg_82_0.cameraGift.LookAt = arg_82_0.ladyInterest
	arg_82_0.cameraRole2.LookAt = arg_82_0.ladyInterestRoot
	arg_82_0.cameras[var_0_0.CAMERA.PHOTO].Follow = arg_82_0.ladyInterest
	arg_82_0.cameras[var_0_0.CAMERA.PHOTO].LookAt = arg_82_0.ladyInterest
end

function var_0_0.initNodeCanvas(arg_83_0)
	local var_83_0 = pg.NodeCanvasMgr.GetInstance()

	var_83_0:Active()
	var_83_0:RegisterFunc("DistanceTrigger", function(arg_84_0)
		arg_83_0:emit(var_0_0.DISTANCE_TRIGGER, arg_84_0, arg_83_0.ladyDict[arg_84_0].dis)
	end)
	var_83_0:RegisterFunc("ShortWaitAction", function(arg_85_0)
		arg_83_0:DoShortWait(arg_85_0)
	end)
	var_83_0:RegisterFunc("WatchShortWaitAction", function(arg_86_0)
		arg_83_0:DoShortWait(arg_86_0)
	end)
	var_83_0:RegisterFunc("WalkDistanceTrigger", function(arg_87_0)
		arg_83_0:emit(var_0_0.WALK_DISTANCE_TRIGGER, arg_87_0, arg_83_0.ladyDict[arg_87_0].dis)
	end)
	var_83_0:RegisterFunc("ChangeWatch", function(arg_88_0)
		arg_83_0:emit(var_0_0.CHANGE_WATCH, arg_88_0)
	end)
end

function var_0_0.SetAllBlackbloardValue(arg_89_0, arg_89_1, arg_89_2)
	arg_89_0[arg_89_1] = arg_89_2

	for iter_89_0, iter_89_1 in pairs(arg_89_0.ladyDict) do
		iter_89_1:SetBlackboardValue(arg_89_1, arg_89_2)
	end
end

function var_0_0.SetBlackboardValue(arg_90_0, arg_90_1, arg_90_2)
	arg_90_0.blackboard = arg_90_0.blackboard or {}
	arg_90_0.blackboard[arg_90_1] = arg_90_2

	pg.NodeCanvasMgr.GetInstance():SetBlackboradValue(arg_90_1, arg_90_2, arg_90_0.ladyBlackboard)
end

function var_0_0.GetBlackboardValue(arg_91_0, arg_91_1)
	arg_91_0.blackboard = arg_91_0.blackboard or {}

	return arg_91_0.blackboard[arg_91_1]
end

function var_0_0.didEnter(arg_92_0)
	local var_92_0 = -21.6 / Screen.height

	arg_92_0.joystickDelta = Vector2.zero
	arg_92_0.joystickTimer = FrameTimer.New(function()
		local var_93_0 = arg_92_0.joystickDelta * var_92_0
		local var_93_1 = var_93_0.x
		local var_93_2 = var_93_0.y

		local function var_93_3(arg_94_0, arg_94_1, arg_94_2)
			local var_94_0 = arg_94_0[arg_94_1]

			var_94_0.m_InputAxisValue = arg_94_2
			arg_94_0[arg_94_1] = var_94_0
		end

		if arg_92_0.surroudCamera and not arg_92_0.pinchMode then
			var_93_3(arg_92_0.surroudCamera, "m_XAxis", var_93_1)
			var_93_3(arg_92_0.surroudCamera, "m_YAxis", var_93_2)

			if arg_92_0.surroudCamera == arg_92_0.cameraRoleWatch then
				if var_93_1 ~= 0 then
					local var_93_4 = arg_92_0.cameraRoleWatch.m_XAxis

					if not var_93_4.m_Wrap then
						local var_93_5 = var_93_1 * (var_93_4.m_InvertInput and -1 or 1)

						if var_93_5 < 0 and var_93_4.Value - 0.01 < var_93_4.m_MinValue then
							arg_92_0:emit(var_0_0.ON_ROLEWATCH_CAMERA_MAX, var_0_0.CAMERA_MAX_OPERATION.RIGHT)
						elseif var_93_5 > 0 and var_93_4.Value + 0.01 > var_93_4.m_MaxValue then
							arg_92_0:emit(var_0_0.ON_ROLEWATCH_CAMERA_MAX, var_0_0.CAMERA_MAX_OPERATION.LEFT)
						end
					end
				end

				if var_93_2 ~= 0 then
					local var_93_6 = arg_92_0.cameraRoleWatch.m_YAxis

					if not var_93_6.m_Wrap then
						if var_93_2 < 0 and var_93_6.Value - 0.01 < var_93_6.m_MinValue then
							arg_92_0:emit(var_0_0.ON_ROLEWATCH_CAMERA_MAX, var_0_0.CAMERA_MAX_OPERATION.DOWN)
						elseif var_93_2 > 0 and var_93_6.Value + 0.01 > var_93_6.m_MaxValue then
							arg_92_0:emit(var_0_0.ON_ROLEWATCH_CAMERA_MAX, var_0_0.CAMERA_MAX_OPERATION.UP)
						end
					end
				end
			end
		end

		arg_92_0.joystickDelta = Vector2.zero
	end, 1, -1)

	arg_92_0.joystickTimer:Start()

	local var_92_1 = 1.75

	arg_92_0.moveStickTimer = FrameTimer.New(function()
		if not arg_92_0.moveStickDraging then
			return
		end

		local var_95_0 = (arg_92_0.moveStickPosition - arg_92_0.moveStickOrigin):ClampMagnitude(200)

		arg_92_0.moveStickPosition = arg_92_0.moveStickOrigin + var_95_0

		local var_95_1 = Vector3.New(var_95_0.x, 0, var_95_0.y)
		local var_95_2 = arg_92_0.mainCameraTF:TransformDirection(var_95_1)

		var_95_2.y = 0

		local var_95_3 = var_95_2:Normalize()

		var_95_3:Mul(var_92_1)

		if isActive(arg_92_0.cameras[var_0_0.CAMERA.POV]) then
			arg_92_0.playerController:SimpleMove(var_95_3)

			arg_92_0.tweenFOV = true
		elseif isActive(arg_92_0.cameras[var_0_0.CAMERA.PHOTO_FREE]) then
			arg_92_0.cameras[var_0_0.CAMERA.PHOTO_FREE]:GetComponent(typeof(UnityEngine.CharacterController)):Move(var_95_3 * Time.deltaTime)
		end
	end, 1, -1)

	arg_92_0.moveStickTimer:Start()

	arg_92_0.pinchMode = false
	arg_92_0.pinchSize = 0
	arg_92_0.pinchValue = 1
	arg_92_0.pinchNodeOrder = 1

	GlobalClickEventMgr.Inst:AddBeginPinchFunc(function(arg_96_0, arg_96_1)
		if arg_92_0.surroudCamera and isActive(arg_92_0.surroudCamera) then
			arg_92_0.pinchMode = true
			arg_92_0.pinchSize = (arg_96_0 - arg_96_1):Magnitude()
			arg_92_0.pinchNodeOrder = arg_96_1.x < arg_96_0.x and -1 or 1

			return
		end

		if isActive(arg_92_0.cameras[var_0_0.CAMERA.POV]) then
			if (arg_96_0 - arg_96_1):Magnitude() < Screen.height * 0.5 then
				arg_92_0.pinchMode = true
				arg_92_0.pinchSize = (arg_96_0 - arg_96_1):Magnitude()
				arg_92_0.pinchNodeOrder = arg_96_1.x < arg_96_0.x and -1 or 1
			end

			return
		end
	end)

	local var_92_2 = 0.01

	if IsUnityEditor then
		var_92_2 = 0.1
	end

	local var_92_3 = var_92_2 * 1080 / Screen.height

	GlobalClickEventMgr.Inst:AddPinchFunc(function(arg_97_0, arg_97_1)
		if not arg_92_0.pinchMode then
			return
		end

		local var_97_0 = (arg_97_0 - arg_97_1):Magnitude()
		local var_97_1 = arg_92_0.pinchSize - var_97_0
		local var_97_2 = arg_92_0.pinchNodeOrder * (arg_97_1.x < arg_97_0.x and -1 or 1)
		local var_97_3 = var_97_1 * var_92_3 * var_97_2

		if isActive(arg_92_0.cameras[var_0_0.CAMERA.POV]) then
			local var_97_4 = 0.5
			local var_97_5 = 1

			arg_92_0.pinchValue = math.clamp(arg_92_0.pinchValue + var_97_3, var_97_4, var_97_5)
			arg_92_0.pinchSize = var_97_0

			arg_92_0:SetPOVFOV(arg_92_0.POVOriginalFOV * arg_92_0.pinchValue)

			arg_92_0.tweenFOV = nil

			return
		end

		if isActive(arg_92_0.surroudCamera) and arg_92_0.surroudCamera == arg_92_0.cameras[var_0_0.CAMERA.PHOTO] then
			local var_97_6 = 0.5
			local var_97_7 = 1

			arg_92_0:SetPinchValue(math.clamp(arg_92_0.pinchValue + var_97_3, var_97_6, var_97_7))

			arg_92_0.pinchSize = var_97_0

			return
		end
	end)
	GlobalClickEventMgr.Inst:AddEndPinchFunc(function()
		arg_92_0.pinchMode = false
		arg_92_0.pinchSize = 0
	end)

	arg_92_0.cameraBlendCallbacks = {}
	arg_92_0.activeCMCamera = nil

	function arg_92_0.camBrainEvenetHandler.OnBlendStarted(arg_99_0)
		if arg_92_0.activeCMCamera then
			arg_92_0:OnCameraBlendFinished(arg_92_0.activeCMCamera)
		end

		local var_99_0 = arg_92_0.camBrain.ActiveVirtualCamera

		arg_92_0.activeCMCamera = var_99_0
	end

	function arg_92_0.camBrainEvenetHandler.OnBlendFinished(arg_100_0)
		arg_92_0.activeCMCamera = nil

		arg_92_0:OnCameraBlendFinished(arg_100_0)
	end

	for iter_92_0, iter_92_1 in pairs(arg_92_0.ladyDict) do
		(function(arg_101_0, arg_101_1)
			if arg_101_0.tfPendintItem then
				onNextTick(function()
					setParent(arg_101_0.tfPendintItem, arg_101_0.lady)
				end)
			end

			arg_101_0.ladyOwner = GetComponent(arg_101_0.lady, "GraphOwner")
			arg_101_0.ladyBlackboard = GetComponent(arg_101_0.lady, "Blackboard")

			arg_101_0:SetBlackboardValue("groupId", arg_101_1)
			onNextTick(function()
				arg_101_0.ladyOwner.enabled = true
			end)
		end)(iter_92_1, iter_92_0)
	end

	arg_92_0.expressionDict = {}

	pg.UIMgr.GetInstance():OverlayPanel(arg_92_0.blockLayer, {
		weight = LayerWeightConst.SECOND_LAYER,
		groupName = LayerWeightConst.GROUP_DORM3D
	})
	arg_92_0:ActiveCamera(arg_92_0.cameras[var_0_0.CAMERA.POV])
	arg_92_0:RefreshSlots()

	arg_92_0.updateHandler = UpdateBeat:CreateListener(function()
		xpcall(function()
			arg_92_0:Update()
		end, function(...)
			errorMsg(debug.traceback(...))
		end)
	end)

	UpdateBeat:AddListener(arg_92_0.updateHandler)
end

function var_0_0.InitData(arg_107_0)
	if not arg_107_0.contextData.ladyZone then
		arg_107_0.contextData.ladyZone = {}

		local var_107_0
		local var_107_1 = arg_107_0.room:getConfig("default_zone")

		for iter_107_0, iter_107_1 in ipairs(arg_107_0.contextData.groupIds) do
			for iter_107_2, iter_107_3 in ipairs(var_107_1) do
				if iter_107_3[1] == iter_107_1 then
					arg_107_0.contextData.ladyZone[iter_107_1] = iter_107_3[2]

					break
				end
			end

			assert(arg_107_0.contextData.ladyZone[iter_107_1])

			var_107_0 = var_107_0 or arg_107_0.contextData.ladyZone[iter_107_1]
		end

		arg_107_0.contextData.inFurnitureName = var_107_0 or arg_107_0.room:getConfig("default_zone")[1][2]
	end

	arg_107_0.zoneDatas = _.select(arg_107_0.room:GetZones(), function(arg_108_0)
		return not arg_108_0:IsGlobal()
	end)
	arg_107_0.readyIKLayers = {}
	arg_107_0.activeIKLayers = {}
	arg_107_0.holdingStatus = {}
	arg_107_0.cacheIKInfos = {}
	arg_107_0.activeSectors = {}
	arg_107_0.activeLady = {}
end

function var_0_0.Update(arg_109_0)
	arg_109_0.raycastCamera.fieldOfView = arg_109_0.mainCameraTF:GetComponent(typeof(Camera)).fieldOfView

	if arg_109_0.tweenFOV then
		local var_109_0 = Damp(1, 1, Time.deltaTime)

		arg_109_0.pinchValue = Mathf.Lerp(arg_109_0.pinchValue, 1, var_109_0)

		arg_109_0:SetPOVFOV(arg_109_0.POVOriginalFOV * arg_109_0.pinchValue)

		if arg_109_0.pinchValue > 0.99 then
			arg_109_0.tweenFOV = nil
		end
	end

	if isActive(arg_109_0.cameras[var_0_0.CAMERA.POV]) then
		arg_109_0:TriggerLadyDistance()
	end

	if arg_109_0.contactInRangeDic then
		local var_109_1 = arg_109_0.mainCameraTF.forward
		local var_109_2 = arg_109_0.mainCameraTF.position
		local var_109_3 = UnityEngine.Rect.New(0, 0, Screen.width, Screen.height)

		local function var_109_4(arg_110_0, arg_110_1, arg_110_2)
			local var_110_0 = arg_110_0.position - var_109_2
			local var_110_1 = Clone(var_110_0)

			var_110_1.y = 0

			if arg_110_1 < var_110_1.magnitude then
				return false
			end

			local var_110_2 = var_110_0:Normalize()
			local var_110_3 = math.acos(Vector3.Dot(var_110_2, var_109_1)) * math.rad2Deg

			if arg_110_2 < math.abs(var_110_3) then
				return false
			end

			local var_110_4 = arg_109_0.raycastCamera:WorldToScreenPoint(arg_110_0.position)

			if var_110_4.z < 0 then
				return false
			end

			if not var_109_3:Contains(var_110_4) then
				return false
			end

			return true
		end

		for iter_109_0, iter_109_1 in pairs(arg_109_0.contactInRangeDic) do
			local var_109_5 = pg.dorm3d_collection_template[iter_109_0]
			local var_109_6 = underscore.any(var_109_5.vfx_prefab, function(arg_111_0)
				return arg_109_0.modelRoot:Find(arg_111_0) and var_109_4(arg_109_0.modelRoot:Find(arg_111_0), 2, 60)
			end)

			if tobool(iter_109_1) ~= var_109_6 then
				arg_109_0.contactInRangeDic[iter_109_0] = var_109_6

				arg_109_0:UpdateContactDisplay(iter_109_0, var_109_6 and not arg_109_0.hideConcatFlag and arg_109_0.contactStateDic[iter_109_0] or arg_109_0.hideContactStateDic[iter_109_0])
			end
		end
	end

	if arg_109_0.enableFloatUpdate then
		arg_109_0.ladyDict[arg_109_0.apartment:GetConfigID()]:UpdateFloatPosition()
	end

	arg_109_0:CheckInSector()

	if arg_109_0.apartment then
		(function(arg_112_0)
			(function()
				if not arg_112_0.ikHandler then
					return
				end

				if not arg_112_0.ikHandler.targetScreenOffset then
					return
				end

				local var_113_0 = arg_112_0.ikHandler.rect
				local var_113_1 = var_113_0:PointToNormalized(Vector2.zero)
				local var_113_2 = var_113_0:PointToNormalized(arg_112_0.ikHandler.targetScreenOffset) - var_113_1

				_.each(arg_112_0.ikHandler.subPlanes, function(arg_114_0)
					local var_114_0 = arg_114_0.target
					local var_114_1 = arg_114_0.planeData

					var_114_0.position = var_0_0.GetPostionByRatio(var_114_1, var_113_2)
				end)

				if Time.time > arg_112_0.ikNextCheckStamp then
					arg_112_0.ikNextCheckStamp = arg_112_0.ikNextCheckStamp + var_0_0.IK_STATUS_DELTA

					arg_112_0:emit(var_0_0.ON_IK_STATUS_CHANGED, arg_112_0.ikHandler.ikData:GetConfigID(), var_0_0.IK_STATUS.DRAG)
				end

				arg_112_0:ResetIKTipTimer()
			end)()

			if arg_112_0.enableIKTip then
				local var_112_0 = Time.time > arg_112_0.nextTipIKTime
				local var_112_1 = arg_112_0:GetIKTipsRootTF()

				if var_112_0 then
					UIItemList.StaticAlign(var_112_1, var_112_1:GetChild(0), #arg_112_0.readyIKLayers, function(arg_115_0, arg_115_1, arg_115_2)
						if arg_115_0 ~= UIItemList.EventUpdate then
							return
						end

						local var_115_0 = arg_112_0.readyIKLayers[arg_115_1 + 1].ikData
						local var_115_1 = var_115_0:GetTriggerBoneName()
						local var_115_2 = var_115_1 and arg_112_0.ladyColliders[var_115_1] or nil

						if var_115_2 and not (function()
							local var_116_0 = arg_112_0.raycastCamera:WorldToScreenPoint(var_115_2.position)
							local var_116_1 = CameraMgr.instance:Raycast(arg_112_0.sceneRaycaster, var_116_0)

							if var_116_1.Length == 0 then
								return
							end

							return var_115_2 == var_116_1[0].gameObject.transform
						end)() then
							var_115_2 = nil
						end

						if var_115_2 then
							setLocalPosition(arg_115_2, arg_112_0:GetLocalPosition(arg_112_0:GetScreenPosition(var_115_2.position), var_112_1) + var_115_0:GetIKTipOffset())
						end

						setActive(arg_115_2, var_115_2)
					end)
				end

				setActive(var_112_1, var_112_0)
			end

			if arg_112_0.ikRevertHandler then
				arg_112_0.ikRevertHandler()
			end
		end)(arg_109_0.ladyDict[arg_109_0.apartment:GetConfigID()])
	end
end

function var_0_0.CheckInSector(arg_117_0)
	if not isActive(arg_117_0.cameras[var_0_0.CAMERA.POV]) then
		return
	end

	local var_117_0 = arg_117_0.mainCameraTF.position

	var_117_0.y = 0

	for iter_117_0, iter_117_1 in pairs(arg_117_0.ladyDict) do
		local var_117_1 = tobool(arg_117_0.activeLady[iter_117_0])

		if var_117_1 ~= tobool(var_0_0.IsPointInSector(arg_117_0.activeSectors[iter_117_1.ladyActiveZone], var_117_0)) then
			arg_117_0.activeLady[iter_117_0] = not var_117_1

			arg_117_0:emit(var_0_0.ON_ENTER_SECTOR, iter_117_0)
		end
	end
end

function var_0_0.TriggerLadyDistance(arg_118_0)
	local function var_118_0(arg_119_0, arg_119_1)
		arg_119_0.dis = (arg_119_0.lady.position - arg_119_0.player.position).magnitude

		if (arg_119_0:GetBlackboardValue("inPending") and var_0_0.POV_PENDING_CLOSE_DISTANCE or var_0_0.POV_CLOSE_DISTANCE) > arg_119_0.dis ~= arg_119_0:GetBlackboardValue("inDistance") then
			arg_119_0:SetBlackboardValue("inDistance", arg_119_0.dis < var_0_0.POV_CLOSE_DISTANCE)
			arg_119_0:emit(var_0_0.ON_CHANGE_DISTANCE, arg_119_1, arg_119_0.dis < var_0_0.POV_CLOSE_DISTANCE)
		end
	end

	for iter_118_0, iter_118_1 in pairs(arg_118_0.ladyDict) do
		var_118_0(iter_118_1, iter_118_0)
	end
end

function var_0_0.OnStickMove(arg_120_0, arg_120_1)
	arg_120_0.joystickDelta = arg_120_1
end

function var_0_0.SetPinchValue(arg_121_0, arg_121_1)
	arg_121_0.pinchValue = arg_121_1

	arg_121_0:SetCameraObrits()
end

function var_0_0.GetPOVFOV(arg_122_0)
	local var_122_0 = arg_122_0.cameras[var_0_0.CAMERA.POV].m_Lens

	return ReflectionHelp.RefGetField(typeof("Cinemachine.LensSettings"), "FieldOfView", var_122_0)
end

function var_0_0.SetPOVFOV(arg_123_0, arg_123_1)
	local var_123_0 = arg_123_0.cameras[var_0_0.CAMERA.POV].m_Lens

	ReflectionHelp.RefSetField(typeof("Cinemachine.LensSettings"), "FieldOfView", var_123_0, arg_123_1)

	arg_123_0.cameras[var_0_0.CAMERA.POV].m_Lens = var_123_0
end

function var_0_0.RefreshSlots(arg_124_0, arg_124_1)
	arg_124_1 = arg_124_1 or arg_124_0.room

	local var_124_0 = arg_124_1:GetSlots()
	local var_124_1 = arg_124_1:GetFurnitures()

	arg_124_0:emit(var_0_0.SHOW_BLOCK)
	table.ParallelIpairsAsync(var_124_0, function(arg_125_0, arg_125_1, arg_125_2)
		local var_125_0 = arg_125_1:GetConfigID()
		local var_125_1 = _.detect(var_124_1, function(arg_126_0)
			return arg_126_0:GetSlotID() == var_125_0
		end)
		local var_125_2 = var_125_1 and var_125_1:GetModel() or false
		local var_125_3 = arg_124_0.slotDict[var_125_0].model

		arg_124_0.slotDict[var_125_0].displayModelName = var_125_2

		if var_125_2 == false or var_125_2 == "" then
			arg_124_0.loader:ClearRequest("slot_" .. var_125_0)

			if var_125_3 then
				setActive(var_125_3, var_125_2 == "")
			end

			arg_125_2()

			return
		end

		local var_125_4 = arg_124_0.slotDict[var_125_0].trans

		if arg_124_0.loader:GetLoadingRP("slot_" .. var_125_0) then
			arg_124_0:emit(var_0_0.HIDE_BLOCK)
		end

		arg_124_0.loader:GetPrefabBYStopLoading("dorm3d/furniture/prefabs/" .. var_125_2, "", function(arg_127_0)
			arg_125_2()
			assert(arg_127_0)
			setParent(arg_127_0, var_125_4)

			if var_125_3 then
				local var_127_0 = arg_127_0:GetComponentsInChildren(typeof(Renderer), true)

				table.IpairsCArray(var_127_0, function(arg_128_0, arg_128_1)
					LuaHelper.CopyLightMap(arg_128_1.gameObject, arg_127_0)
				end)
				setActive(var_125_3, false)
			end
		end, "slot_" .. var_125_0)
	end, function()
		arg_124_0:emit(var_0_0.HIDE_BLOCK)
	end)
end

function var_0_0.ChangeCharacterPosition(arg_130_0)
	arg_130_0:ResetCharPoint(arg_130_0.ladyActiveZone)
	arg_130_0:SyncInterestTransform(arg_130_0)
end

function var_0_0.SyncCurrentInterestTransform(arg_131_0)
	local var_131_0 = arg_131_0.ladyDict[arg_131_0.apartment:GetConfigID()]

	arg_131_0:SyncInterestTransform(var_131_0)
end

function var_0_0.SyncInterestTransform(arg_132_0, arg_132_1)
	arg_132_0.ladyInterest.position = arg_132_1.ladyInterestRoot.position
	arg_132_0.ladyInterest.rotation = arg_132_1.ladyInterestRoot.rotation
end

function var_0_0.ChangePlayerPosition(arg_133_0, arg_133_1)
	arg_133_1 = arg_133_1 or arg_133_0.contextData.inFurnitureName

	local var_133_0 = arg_133_0.furnitures:Find(arg_133_1):Find("PlayerPoint").position

	arg_133_0.player.position = var_133_0
	arg_133_0.cameras[var_0_0.CAMERA.POV].transform.position = arg_133_0.playerEye.position

	local var_133_1 = arg_133_0.ladyInterest.position - arg_133_0.playerEye.position
	local var_133_2 = Quaternion.LookRotation(var_133_1).eulerAngles
	local var_133_3 = var_133_2.y
	local var_133_4 = var_133_2.x
	local var_133_5 = arg_133_0.compPovAim.m_HorizontalAxis

	var_133_5.Value = arg_133_0:GetNearestAngle(var_133_3, var_133_5.m_MinValue, var_133_5.m_MaxValue)
	arg_133_0.compPovAim.m_HorizontalAxis = var_133_5

	local var_133_6 = arg_133_0.compPovAim.m_VerticalAxis

	var_133_6.Value = var_133_4
	arg_133_0.compPovAim.m_VerticalAxis = var_133_6
end

function var_0_0.GetAttachedFurnitureName(arg_134_0)
	return arg_134_0.contextData.inFurnitureName
end

function var_0_0.GetFurnitureByName(arg_135_0, arg_135_1)
	return underscore.detect(arg_135_0.attachedPoints, function(arg_136_0)
		return arg_136_0.name == arg_135_1
	end)
end

function var_0_0.GetSlotByID(arg_137_0, arg_137_1)
	return arg_137_0.displaySlots[arg_137_1] and arg_137_0.displaySlots[arg_137_1].trans
end

function var_0_0.GetScreenPosition(arg_138_0, arg_138_1)
	local var_138_0 = arg_138_0.raycastCamera:WorldToScreenPoint(arg_138_1)

	if var_138_0.z < 0 then
		var_138_0.x = var_138_0.x + (var_138_0.x < 0 and -1 or 1) * Screen.width
		var_138_0.y = var_138_0.y + (var_138_0.y < 0 and -1 or 1) * Screen.height
		var_138_0.z = -var_138_0.z
	end

	return var_138_0
end

function var_0_0.GetLocalPosition(arg_139_0, arg_139_1, arg_139_2)
	return LuaHelper.ScreenToLocal(arg_139_2, arg_139_1, pg.UIMgr.GetInstance().uiCameraComp)
end

function var_0_0.GetModelRoot(arg_140_0)
	return arg_140_0.modelRoot
end

function var_0_0.ShiftZone(arg_141_0, arg_141_1, arg_141_2)
	local var_141_0 = arg_141_0:GetFurnitureByName(arg_141_1)

	if not var_141_0 then
		errorMsg(arg_141_1 .. " Not Find")
		existCall(arg_141_2)

		return
	end

	seriesAsync({
		function(arg_142_0)
			arg_141_0:emit(var_0_0.SHOW_BLOCK)
			arg_141_0:ShowBlackScreen(true, arg_142_0)
		end,
		function(arg_143_0)
			if arg_141_0.shiftLady or arg_141_0.room:isPersonalRoom() then
				local var_143_0 = arg_141_0.shiftLady or arg_141_0.apartment:GetConfigID()

				arg_141_0.shiftLady = nil
				arg_141_0.contextData.ladyZone[var_143_0] = var_141_0.name

				local var_143_1 = arg_141_0.ladyDict[var_143_0]

				var_143_1.ladyBaseZone = arg_141_0.contextData.ladyZone[var_143_0]
				var_143_1.ladyActiveZone = arg_141_0.contextData.ladyZone[var_143_0]

				if var_143_1:GetBlackboardValue("inPending") then
					var_143_1:SetOutPending()
					var_143_1:SwitchAnim(var_0_0.ANIM.IDLE)
					onNextTick(function()
						var_143_1:ChangeCharacterPosition()
						arg_143_0()
					end)
				else
					var_143_1:ChangeCharacterPosition()
					arg_143_0()
				end
			else
				arg_143_0()
			end
		end,
		function(arg_145_0)
			arg_141_0.contextData.inFurnitureName = var_141_0.name

			arg_141_0:ChangePlayerPosition()
			arg_141_0:TriggerLadyDistance()
			arg_141_0:CheckInSector()
			arg_145_0()
		end,
		function(arg_146_0)
			arg_141_0:UpdateZoneList()
			arg_141_0:ShowBlackScreen(false, arg_146_0)
		end,
		function(arg_147_0)
			arg_141_0:emit(var_0_0.HIDE_BLOCK)
			arg_147_0()
		end
	}, arg_141_2)
end

function var_0_0.WalkByRootMotionLoop(arg_148_0, arg_148_1, arg_148_2)
	if arg_148_1.pathPending then
		arg_148_2:SetFloat("Speed", 0)

		return
	end

	arg_148_2:SetFloat("Speed", 1)

	local var_148_0 = arg_148_1.path.corners

	if var_148_0.Length > 1 then
		local var_148_1 = var_148_0[1] - arg_148_1.transform.position

		var_148_1.y = 0

		local var_148_2 = Quaternion.LookRotation(var_148_1)
		local var_148_3 = arg_148_1.transform.rotation
		local var_148_4 = 1
		local var_148_5 = Damp(1, var_148_4, Time.deltaTime)

		arg_148_1.transform.rotation = Quaternion.Lerp(var_148_3, var_148_2, var_148_5)
	end
end

function var_0_0.ActiveCamera(arg_149_0, arg_149_1)
	local var_149_0 = isActive(arg_149_1)

	table.Foreach(arg_149_0.cameras, function(arg_150_0, arg_150_1)
		setActive(arg_150_1, arg_150_1 == arg_149_1)
	end)

	if var_149_0 then
		arg_149_0:OnCameraBlendFinished(arg_149_1)
	end
end

function var_0_0.ShowBlackScreen(arg_151_0, arg_151_1, arg_151_2)
	local var_151_0 = arg_151_0.blackSceneInfo or {
		color = "#000000",
		time = 0.3,
		delay = arg_151_1 and 0 or 0.3
	}

	setImageColor(arg_151_0.blackLayer, Color.NewHex(var_151_0.color))
	setActive(arg_151_0.blackLayer, true)
	setCanvasGroupAlpha(arg_151_0.blackLayer, arg_151_1 and 0 or 1)
	arg_151_0:managedTween(LeanTween.alphaCanvas, function()
		if not arg_151_1 then
			setActive(arg_151_0.blackLayer, false)
		end

		existCall(arg_151_2)
	end, GetComponent(arg_151_0.blackLayer, typeof(CanvasGroup)), arg_151_1 and 1 or 0, var_151_0.time):setDelay(var_151_0.delay)
end

function var_0_0.RegisterOrbits(arg_153_0, arg_153_1)
	arg_153_0 = arg_153_0.scene
	arg_153_0.orbits = {
		original = arg_153_1.m_Orbits
	}
	arg_153_0.orbits.current = _.range(3):map(function(arg_154_0)
		local var_154_0 = arg_153_0.orbits.original[arg_154_0 - 1]

		return Cinemachine.CinemachineFreeLook.Orbit.New(var_154_0.m_Height, var_154_0.m_Radius)
	end)
	arg_153_0.surroudCamera = arg_153_1
end

function var_0_0.SetCameraObrits(arg_155_0)
	local var_155_0 = arg_155_0.surroudCamera

	if not var_155_0 then
		return
	end

	local var_155_1 = arg_155_0.orbits.original[1]

	for iter_155_0 = 0, #arg_155_0.orbits.current - 1 do
		local var_155_2 = arg_155_0.orbits.current[iter_155_0 + 1]
		local var_155_3 = arg_155_0.orbits.original[iter_155_0]

		var_155_2.m_Height = math.lerp(var_155_1.m_Height, var_155_3.m_Height, arg_155_0.pinchValue)
		var_155_2.m_Radius = var_155_3.m_Radius * arg_155_0.pinchValue
	end

	var_155_0.m_Orbits = arg_155_0.orbits.current
end

function var_0_0.RevertCameraOrbit(arg_156_0)
	arg_156_0 = arg_156_0.scene

	local var_156_0 = arg_156_0.surroudCamera

	if not var_156_0 then
		return
	end

	for iter_156_0 = 0, #arg_156_0.orbits.current - 1 do
		local var_156_1 = arg_156_0.orbits.current[iter_156_0 + 1]
		local var_156_2 = arg_156_0.orbits.original[iter_156_0]

		var_156_1.m_Height = var_156_2.m_Height
		var_156_1.m_Radius = var_156_2.m_Radius
	end

	var_156_0.m_Orbits = arg_156_0.orbits.current
	arg_156_0.surroudCamera = nil
end

function var_0_0.ActiveStateCamera(arg_157_0, arg_157_1, arg_157_2)
	local var_157_0 = {
		base = function(arg_158_0)
			arg_157_0:RegisterCameraBlendFinished(arg_157_0.cameras[var_0_0.CAMERA.POV], arg_158_0)
			arg_157_0:ActiveCamera(arg_157_0.cameras[var_0_0.CAMERA.POV])
		end,
		watch = function(arg_159_0)
			assert(arg_157_0.apartment)
			arg_157_0.ladyDict[arg_157_0.apartment:GetConfigID()]:SetCameraLady()
			arg_157_0:RegisterCameraBlendFinished(arg_157_0.cameras[var_0_0.CAMERA.ROLE], arg_159_0)
			arg_157_0:ActiveCamera(arg_157_0.cameras[var_0_0.CAMERA.ROLE])
		end,
		walk = function(arg_160_0)
			arg_157_0:RegisterCameraBlendFinished(arg_157_0.cameras[var_0_0.CAMERA.POV], arg_160_0)
			arg_157_0:ActiveCamera(arg_157_0.cameras[var_0_0.CAMERA.POV])
		end,
		ik = function(arg_161_0)
			arg_161_0()
		end,
		gift = function(arg_162_0)
			assert(arg_157_0.apartment)
			arg_157_0.ladyDict[arg_157_0.apartment:GetConfigID()]:SetCameraLady()
			arg_157_0:RegisterCameraBlendFinished(arg_157_0.cameras[var_0_0.CAMERA.GIFT], arg_162_0)
			arg_157_0:ActiveCamera(arg_157_0.cameras[var_0_0.CAMERA.GIFT])
		end,
		standby = function(arg_163_0)
			assert(arg_157_0.apartment)
			arg_157_0.ladyDict[arg_157_0.apartment:GetConfigID()]:SetCameraLady()

			arg_157_0.cameras[var_0_0.CAMERA.ROLE2].transform.position = arg_157_0.cameraRole.transform.position

			arg_157_0:RegisterCameraBlendFinished(arg_157_0.cameras[var_0_0.CAMERA.ROLE2], arg_163_0)
			arg_157_0:ActiveCamera(arg_157_0.cameras[var_0_0.CAMERA.ROLE2])
		end,
		talk = function(arg_164_0)
			assert(arg_157_0.apartment)
			arg_157_0.ladyDict[arg_157_0.apartment:GetConfigID()]:SetCameraLady()
			arg_157_0:RegisterCameraBlendFinished(arg_157_0.cameras[var_0_0.CAMERA.TALK], arg_164_0)
			arg_157_0:ActiveCamera(arg_157_0.cameras[var_0_0.CAMERA.TALK])
		end
	}
	local var_157_1 = {}

	table.insert(var_157_1, function(arg_165_0)
		switch(arg_157_1, var_157_0, arg_165_0, arg_165_0)
	end)
	seriesAsync(var_157_1, arg_157_2)
end

function var_0_0.SetIKStatus(arg_166_0, arg_166_1, arg_166_2)
	warning("Set IKStatus " .. (arg_166_1.id or "NIL"))

	arg_166_0.enableIKTip = true

	setActive(arg_166_0.ladyCollider, false)
	_.each(arg_166_0.ladyTouchColliders, function(arg_167_0)
		setActive(arg_167_0, true)
	end)
	table.clear(arg_166_0.readyIKLayers)

	arg_166_0.blockIK = nil

	local var_166_0 = _.map(arg_166_1.ik_id, function(arg_168_0)
		return arg_168_0[1]
	end)

	table.Foreach(var_166_0, function(arg_169_0, arg_169_1)
		local var_169_0 = Dorm3dIK.New({
			configId = arg_169_1
		})

		table.insert(arg_166_0.readyIKLayers, {
			ikData = var_169_0
		})

		arg_166_0.cacheIKInfos[var_169_0] = {}

		local var_169_1 = var_169_0:GetControllerPath()
		local var_169_2 = arg_166_0.ladyIKRoot:Find(var_169_1):GetComponent(typeof(RootMotion.FinalIK.IKExecutionOrder))
		local var_169_3 = {}

		table.IpairsCArray(var_169_2.IKComponents, function(arg_170_0, arg_170_1)
			var_169_3[arg_170_0 + 1] = arg_170_1:GetIKSolver()
		end)

		arg_166_0.cacheIKInfos[var_169_0].solvers = var_169_3

		local var_169_4 = _.map(var_169_3, function(arg_171_0)
			return arg_171_0.IKPositionWeight
		end)

		arg_166_0.cacheIKInfos[var_169_0].weights = var_169_4
	end)

	arg_166_0.camBrain.enabled = false

	if arg_166_0.cameras[var_0_0.CAMERA.IK_WATCH] then
		setActive(arg_166_0.cameras[var_0_0.CAMERA.IK_WATCH], false)

		arg_166_0.cameras[var_0_0.CAMERA.IK_WATCH] = nil
	end

	local var_166_1 = arg_166_0.cameraRoot:Find(arg_166_1.ik_camera)

	assert(var_166_1, "Missing IKCamera")

	arg_166_0.cameras[var_0_0.CAMERA.IK_WATCH] = var_166_1

	arg_166_0:ActiveCamera(arg_166_0.cameras[var_0_0.CAMERA.IK_WATCH])

	arg_166_0.camBrain.enabled = true

	local var_166_2 = var_166_1:GetComponent(typeof(Cinemachine.CinemachineFreeLook))

	if var_166_2 then
		arg_166_0:RegisterOrbits(var_166_2)
	end

	arg_166_0:SettingHeadAimIK(arg_166_0, arg_166_0.ikConfig.head_track)
	arg_166_0:ResetIKTipTimer()
	arg_166_0:SwitchAnim(arg_166_1.character_action)
	onNextTick(function()
		local var_172_0 = arg_166_0.furnitures:Find(arg_166_1.character_position)

		arg_166_0.lady.position = var_172_0:Find("StayPoint").position
		arg_166_0.lady.rotation = var_172_0:Find("StayPoint").rotation

		arg_166_0:EnableCloth(false)
		arg_166_0:EnableCloth(arg_166_1.use_cloth, arg_166_1.cloth_colliders)
		existCall(arg_166_2)
	end)
end

function var_0_0.ExitIKStatus(arg_173_0, arg_173_1, arg_173_2)
	arg_173_0.enableIKTip = false

	setActive(arg_173_0.ladyCollider, true)
	_.each(arg_173_0.ladyTouchColliders, function(arg_174_0)
		setActive(arg_174_0, false)
	end)
	arg_173_0:ResetActiveIKs(arg_173_0)
	table.clear(arg_173_0.readyIKLayers)
	table.clear(arg_173_0.cacheIKInfos)
	table.clear(arg_173_0.activeIKLayers)
	table.clear(arg_173_0.holdingStatus)
	eachChild(arg_173_0.ladyIKRoot, function(arg_175_0)
		setActive(arg_175_0, false)
	end)
	setActive(arg_173_0:GetIKTipsRootTF(), false)
	arg_173_0:RevertCameraOrbit()
	setActive(arg_173_0.cameras[var_0_0.CAMERA.IK_WATCH], false)

	arg_173_0.cameras[var_0_0.CAMERA.IK_WATCH] = nil

	arg_173_0:EnableCloth(false)
	arg_173_0:ResetHeadAimIK(arg_173_0)
	arg_173_0:SwitchAnim(arg_173_1.character_action)
	onNextTick(function()
		if arg_173_1.character_position then
			arg_173_0.ladyActiveZone = arg_173_1.character_position
		else
			arg_173_0.ladyActiveZone = arg_173_0.ladyBaseZone
		end

		arg_173_0:ChangeCharacterPosition()
		arg_173_0:TriggerLadyDistance()
		arg_173_0:CheckInSector()
		existCall(arg_173_2)
	end)
end

function var_0_0.EnableIKLayer(arg_177_0, arg_177_1, arg_177_2)
	warning("ENABLEIK", arg_177_2:GetConfigID())

	local var_177_0 = arg_177_2:GetControllerPath()
	local var_177_1 = arg_177_1.ladyIKRoot:Find(var_177_0):GetComponent(typeof(RootMotion.FinalIK.IKExecutionOrder))
	local var_177_2 = tf(var_177_1):Find("Container")
	local var_177_3 = {
		ikData = arg_177_2,
		list = var_177_1
	}

	if not arg_177_1.holdingStatus[arg_177_2] then
		var_177_3.rect = arg_177_2:GetRect()

		local var_177_4 = arg_177_2:GetActionTriggerParams()

		if var_177_4[1] == Dorm3dIK.ACTION_TRIGGER.RELEASE_ON_TARGET or var_177_4[1] == Dorm3dIK.ACTION_TRIGGER.TOUCH_TARGET then
			var_177_3.triggerRect = arg_177_2:GetTriggerRect()
		end

		local var_177_5 = var_177_2:Find("SubTargets")
		local var_177_6 = {}

		assert(var_177_5)

		local var_177_7 = arg_177_2:GetSubTargets()
		local var_177_8 = arg_177_2:GetPlaneRotations()
		local var_177_9 = arg_177_2:GetPlaneScales()

		table.Foreach(var_177_7, function(arg_178_0, arg_178_1)
			local var_178_0 = var_177_5:Find(arg_178_1[1])
			local var_178_1 = var_178_0:Find("Plane")

			if var_177_8[arg_178_0] then
				var_178_1.localRotation = var_177_8[arg_178_0]
				var_178_1.localScale = var_177_9[arg_178_0]
			end

			local var_178_2 = var_178_0:Find("Target")
			local var_178_3 = var_0_0.TransformMesh(var_178_1:GetComponent(typeof(UnityEngine.MeshCollider)))
			local var_178_4 = arg_177_1.ladyBoneMaps[arg_178_1[1]]

			var_178_3.origin = var_178_4.position

			local var_178_5 = var_177_3.rect
			local var_178_6 = Vector2.New(var_178_5.center.x / var_178_5.width, var_178_5.center.y / var_178_5.height)

			var_178_1.position = var_0_0.GetPostionByRatio(var_178_3, var_178_6)
			var_178_2.position = var_178_4.position

			local var_178_7 = {
				planeData = var_178_3,
				target = var_178_2,
				useOffset = tobool(arg_178_1)
			}

			table.insert(var_177_6, var_178_7)
		end)

		var_177_3.subPlanes = var_177_6

		setActive(var_177_1, true)
	else
		var_177_3 = arg_177_1.holdingStatus[arg_177_2].ikHandler
	end

	if #arg_177_2:GetHeadTrackPath() > 0 then
		arg_177_0:SettingHeadAimIK(arg_177_1, {
			2,
			arg_177_2:GetHeadTrackPath()
		}, true)
	end

	local var_177_10 = arg_177_2:GetTriggerFaceAnim()

	if #var_177_10 > 0 then
		arg_177_0:PlayFaceAnim(var_177_10)
	end

	setActive(arg_177_0:GetIKHandTF(), true)
	eachChild(arg_177_0:GetIKHandTF(), function(arg_179_0)
		setActive(arg_179_0, false)
	end)
	arg_177_0:StopIKHandTimer()
	setActive(arg_177_0:GetIKHandTF():Find("Begin"), true)

	arg_177_1.ikHandTimer = Timer.New(function()
		setActive(arg_177_0:GetIKHandTF():Find("Begin"), false)
		setActive(arg_177_0:GetIKHandTF():Find("Normal"), true)
	end, 0.5, 1)

	arg_177_1.ikHandTimer:Start()

	arg_177_1.ikNextCheckStamp = Time.time + var_0_0.IK_STATUS_DELTA

	arg_177_0:emit(var_0_0.ON_IK_STATUS_CHANGED, arg_177_2:GetConfigID(), var_0_0.IK_STATUS.BEGIN)
	pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataTouch(arg_177_0.apartment.configId, arg_177_0.apartment.level, arg_177_1.ikConfig.character_action, arg_177_2:GetTriggerParams()[2], arg_177_0.room:GetConfigID()))

	return var_177_3
end

function var_0_0.DeactiveIKLayer(arg_181_0, arg_181_1)
	if #arg_181_1:GetHeadTrackPath() > 0 then
		arg_181_0:SettingHeadAimIK(arg_181_0, arg_181_0.ikConfig.head_track)
	end

	arg_181_0:StopIKHandTimer()
	setActive(arg_181_0:GetIKHandTF():Find("Begin"), false)
	setActive(arg_181_0:GetIKHandTF():Find("Normal"), false)
	setActive(arg_181_0:GetIKHandTF():Find("End"), true)

	arg_181_0.ikHandTimer = Timer.New(function()
		setActive(arg_181_0:GetIKHandTF():Find("End"), false)
		setActive(arg_181_0:GetIKHandTF(), false)
	end, 0.5, 1)

	arg_181_0.ikHandTimer:Start()
end

function var_0_0.StopIKHandTimer(arg_183_0)
	if not arg_183_0.ikHandTimer then
		return
	end

	arg_183_0.ikHandTimer:Stop()

	arg_183_0.ikHandTimer = nil
end

function var_0_0.RevertIKLayer(arg_184_0, arg_184_1, arg_184_2)
	seriesAsync({
		function(arg_185_0)
			if arg_184_1 >= 999 then
				return arg_185_0()
			end

			arg_184_0:PlayIKRevert(arg_184_0, arg_184_1, arg_185_0)
		end,
		arg_184_2
	})
end

function var_0_0.RevertAllIKLayer(arg_186_0, arg_186_1, arg_186_2)
	table.insertto(arg_186_0.activeIKLayers, _.keys(arg_186_0.holdingStatus))
	table.clear(arg_186_0.holdingStatus)
	arg_186_0.RevertIKLayer(arg_186_0, arg_186_1, arg_186_2)
end

function var_0_0.PlayIKRevert(arg_187_0, arg_187_1, arg_187_2, arg_187_3)
	local var_187_0 = Time.time

	function arg_187_0.ikRevertHandler()
		local var_188_0 = Time.time - var_187_0

		_.each(arg_187_1.activeIKLayers, function(arg_189_0)
			local var_189_0 = 1

			if arg_187_2 > 0 then
				var_189_0 = var_188_0 / arg_187_2
			end

			local var_189_1 = arg_187_1.cacheIKInfos[arg_189_0].solvers
			local var_189_2 = arg_187_1.cacheIKInfos[arg_189_0].weights

			table.Foreach(var_189_1, function(arg_190_0, arg_190_1)
				arg_190_1.IKPositionWeight = math.lerp(var_189_2[arg_190_0], 0, var_189_0)
			end)
		end)

		if var_188_0 >= arg_187_2 then
			arg_187_0:ResetActiveIKs(arg_187_1)

			arg_187_0.ikRevertHandler = nil

			existCall(arg_187_3)
		end
	end

	arg_187_0.ikRevertHandler()
end

function var_0_0.ResetActiveIKs(arg_191_0, arg_191_1)
	table.insertto(arg_191_0.activeIKLayers, _.keys(arg_191_0.holdingStatus))
	table.clear(arg_191_0.holdingStatus)
	_.each(arg_191_1.activeIKLayers, function(arg_192_0)
		local var_192_0 = arg_192_0:GetControllerPath()
		local var_192_1 = arg_191_1.ladyIKRoot:Find(var_192_0):GetComponent(typeof(RootMotion.FinalIK.IKExecutionOrder))

		setActive(var_192_1, false)

		local var_192_2 = arg_191_1.cacheIKInfos[arg_192_0].solvers
		local var_192_3 = arg_191_1.cacheIKInfos[arg_192_0].weights

		table.Foreach(var_192_2, function(arg_193_0, arg_193_1)
			arg_193_1.IKPositionWeight = var_192_3[arg_193_0]
		end)
	end)
	table.clear(arg_191_1.activeIKLayers)
end

function var_0_0.PlayIKAction(arg_194_0, arg_194_1)
	warning("Trigger IK", arg_194_1:GetConfigID())
	arg_194_0:emit(var_0_0.ON_IK_STATUS_CHANGED, arg_194_1:GetConfigID(), var_0_0.IK_STATUS.TRIGGER)
	arg_194_0:OnTriggerIK(arg_194_1:GetConfigID())
end

function var_0_0.ResetIKTipTimer(arg_195_0)
	if not arg_195_0.enableIKTip then
		return
	end

	arg_195_0.nextTipIKTime = Time.time + var_0_0.IK_TIP_WAIT_TIME
end

function var_0_0.EnableHeadIK(arg_196_0, arg_196_1)
	arg_196_0.ladyHeadIKComp.enableIk = arg_196_1
end

function var_0_0.SettingHeadAimIK(arg_197_0, arg_197_1, arg_197_2, arg_197_3)
	local var_197_0

	if arg_197_2[1] == 1 then
		var_197_0 = arg_197_0.mainCameraTF:Find("AimTarget")
	elseif arg_197_2[1] == 2 then
		table.IpairsCArray(arg_197_1.lady:GetComponentsInChildren(typeof(Transform), true), function(arg_198_0, arg_198_1)
			if arg_198_1.name ~= arg_197_2[2] then
				return
			end

			var_197_0 = arg_198_1
		end)
	end

	arg_197_1.ladyHeadIKComp.AimTarget = var_197_0

	if not arg_197_3 and arg_197_2[3] then
		arg_197_1.ladyHeadIKComp.BodyWeight = arg_197_2[3]
	end

	if not arg_197_3 and arg_197_2[4] then
		arg_197_1.ladyHeadIKComp.HeadWeight = arg_197_2[4]
	end
end

function var_0_0.ResetHeadAimIK(arg_199_0, arg_199_1)
	arg_199_1.ladyHeadIKComp.AimTarget = arg_199_0.mainCameraTF:Find("AimTarget")
	arg_199_1.ladyHeadIKComp.HeadWeight = arg_199_1.ladyHeadIKData.HeadWeight
	arg_199_1.ladyHeadIKComp.BodyWeight = arg_199_1.ladyHeadIKData.BodyWeight
end

function var_0_0.HideCharacter(arg_200_0, arg_200_1)
	local function var_200_0(arg_201_0)
		arg_201_0:HideCharacterBylayer()
	end

	for iter_200_0, iter_200_1 in pairs(arg_200_0.ladyDict) do
		if iter_200_0 ~= arg_200_1 then
			var_200_0(iter_200_1)
		end
	end
end

function var_0_0.RevertCharacter(arg_202_0, arg_202_1)
	local function var_202_0(arg_203_0)
		arg_203_0:RevertCharacterBylayer()
	end

	for iter_202_0, iter_202_1 in pairs(arg_202_0.ladyDict) do
		if iter_202_0 ~= arg_202_1 then
			var_202_0(iter_202_1)
		end
	end
end

function var_0_0.HideCharacterBylayer(arg_204_0)
	local var_204_0 = "Bip001"
	local var_204_1 = arg_204_0.lady:Find("all")

	for iter_204_0 = 0, var_204_1.childCount - 1 do
		local var_204_2 = var_204_1:GetChild(iter_204_0)

		if var_204_2.name ~= var_204_0 then
			pg.ViewUtils.SetLayer(var_204_2, Layer.Environment3D)
		end
	end

	if arg_204_0.tfPendintItem then
		pg.ViewUtils.SetLayer(arg_204_0.tfPendintItem, Layer.Environment3D)
	end

	if arg_204_0.ladyWatchFloat then
		pg.ViewUtils.SetLayer(arg_204_0.ladyWatchFloat, Layer.Environment3D)
	end

	GetComponent(arg_204_0.lady, "BLHXCharacterPropertiesController").enabled = false
end

function var_0_0.RevertCharacterBylayer(arg_205_0)
	local var_205_0 = "Bip001"
	local var_205_1 = arg_205_0.lady:Find("all")

	for iter_205_0 = 0, var_205_1.childCount - 1 do
		local var_205_2 = var_205_1:GetChild(iter_205_0)

		if var_205_2.name ~= var_205_0 then
			pg.ViewUtils.SetLayer(var_205_2, Layer.Default)
		end
	end

	if arg_205_0.tfPendintItem then
		pg.ViewUtils.SetLayer(arg_205_0.tfPendintItem, Layer.Default)
	end

	if arg_205_0.ladyWatchFloat then
		pg.ViewUtils.SetLayer(arg_205_0.ladyWatchFloat, Layer.Default)
	end

	GetComponent(arg_205_0.lady, "BLHXCharacterPropertiesController").enabled = true
end

function var_0_0.EnterFurnitureWatchMode(arg_206_0)
	arg_206_0:SetAllBlackbloardValue("inLockLayer", true)
	arg_206_0:HideCharacter()
end

function var_0_0.ExitFurnitureWatchMode(arg_207_0)
	arg_207_0:HideFurnitureSlots()

	local var_207_0 = arg_207_0.cameras[var_0_0.CAMERA.POV]

	seriesAsync({
		function(arg_208_0)
			arg_207_0:emit(var_0_0.SHOW_BLOCK)
			arg_207_0:ShowBlackScreen(true, arg_208_0)
		end,
		function(arg_209_0)
			arg_207_0:RevertCharacter()
			arg_207_0:SetAllBlackbloardValue("inLockLayer", false)
			arg_207_0:RegisterCameraBlendFinished(var_207_0, arg_209_0)
			arg_207_0:ActiveCamera(var_207_0)
		end,
		function(arg_210_0)
			arg_207_0:ShowBlackScreen(false, arg_210_0)
		end
	}, function()
		arg_207_0:emit(var_0_0.HIDE_BLOCK)
	end)
	arg_207_0:RefreshSlots()
end

function var_0_0.SwitchFurnitureZone(arg_212_0, arg_212_1)
	local var_212_0 = arg_212_0:GetFurnitureByName(arg_212_1:GetWatchCameraName()):Find("FurnitureWatch Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))

	if arg_212_0.cameraFurnitureWatch and arg_212_0.cameraFurnitureWatch ~= var_212_0 then
		arg_212_0:UnRegisterCameraBlendFinished(arg_212_0.cameraFurnitureWatch)
		setActive(arg_212_0.cameraFurnitureWatch, false)
	end

	arg_212_0.cameraFurnitureWatch = var_212_0
	arg_212_0.cameras[var_0_0.CAMERA.FURNITURE_WATCH] = arg_212_0.cameraFurnitureWatch

	arg_212_0:RegisterCameraBlendFinished(arg_212_0.cameraFurnitureWatch, function()
		arg_212_0:emit(var_0_0.HIDE_BLOCK)
	end)
	arg_212_0:emit(var_0_0.SHOW_BLOCK)
	arg_212_0:ActiveCamera(arg_212_0.cameraFurnitureWatch)
end

function var_0_0.HideFurnitureSlots(arg_214_0)
	if arg_214_0.displaySlots then
		arg_214_0:UpdateDisplaySlots({})
		table.Foreach(arg_214_0.displaySlots, function(arg_215_0, arg_215_1)
			local var_215_0 = arg_215_1.trans

			if IsNil(var_215_0:Find("Selector")) then
				return
			end

			setActive(var_215_0:Find("Selector"), false)
		end)

		arg_214_0.displaySlots = nil
	end
end

function var_0_0.DisplayFurnitureSlots(arg_216_0, arg_216_1)
	arg_216_0:HideFurnitureSlots()

	arg_216_0.displaySlots = {}

	_.each(arg_216_1, function(arg_217_0)
		arg_216_0.displaySlots[arg_217_0] = arg_216_0.slotDict[arg_217_0]

		if not arg_216_0.displaySlots[arg_217_0] then
			errorMsg("Slot " .. arg_217_0 .. " Not Binding Scene Object")

			return
		end

		local var_217_0 = arg_216_0.displaySlots[arg_217_0].trans

		if var_217_0:Find("Selector") then
			setActive(var_217_0:Find("Selector"), true)
		end
	end)
end

function var_0_0.UpdateDisplaySlots(arg_218_0, arg_218_1)
	table.Foreach(arg_218_0.displaySlots, function(arg_219_0, arg_219_1)
		local var_219_0 = arg_219_1.trans

		if not IsNil(var_219_0:Find("Selector")) then
			setActive(var_219_0:Find("Selector/Normal"), arg_218_1[arg_219_0] == 0)
			setActive(var_219_0:Find("Selector/Active"), arg_218_1[arg_219_0] == 1)
			setActive(var_219_0:Find("Selector/Ban"), arg_218_1[arg_219_0] == 2)
		end

		local var_219_1 = arg_218_0.slotDict[arg_219_0].model
		local var_219_2 = arg_218_0.slotDict[arg_219_0].displayModelName

		if var_219_2 and var_219_2 ~= "" then
			var_219_1 = var_219_0:GetChild(var_219_0.childCount - 1)
		end

		local function var_219_3(arg_220_0, arg_220_1)
			local var_220_0 = arg_220_0:GetComponentsInChildren(typeof(Renderer), true)

			table.IpairsCArray(var_220_0, function(arg_221_0, arg_221_1)
				local var_221_0 = arg_221_1.material

				if var_221_0 and var_221_0:HasProperty("_FinalTint") then
					var_221_0:SetColor("_FinalTint", arg_220_1)
				end
			end)
		end

		if var_219_1 then
			if arg_218_1[arg_219_0] == 1 then
				var_219_3(var_219_1, Color.NewHex("3F83AE73"))
			else
				var_219_3(var_219_1, Color.New(0, 0, 0, 0))
			end
		end
	end)
end

function var_0_0.EnterPhotoMode(arg_222_0, arg_222_1, arg_222_2)
	arg_222_0:SetAllBlackbloardValue("inLockLayer", true)
	arg_222_0:emit(var_0_0.ENABLE_SCENEBLOCK, true)
	seriesAsync({
		function(arg_223_0)
			arg_222_0:TempHideUI(true, arg_223_0)
		end,
		function(arg_224_0)
			arg_222_0:ShowBlackScreen(true, arg_224_0)
		end,
		function(arg_225_0)
			local var_225_0 = arg_222_0.ladyDict[arg_222_0.apartment:GetConfigID()]

			arg_222_0:SwitchAnim(arg_222_2)
			var_225_0.ladyAnimator:Update(0)
			var_225_0:ResetCharPoint(arg_222_1:GetWatchCameraName())
			arg_222_0:SyncInterestTransform(var_225_0)

			local var_225_1 = arg_222_0.cameras[var_0_0.CAMERA.PHOTO]
			local var_225_2 = var_225_1.m_XAxis

			var_225_2.Value = 180
			var_225_1.m_XAxis = var_225_2

			local var_225_3 = var_225_1.m_YAxis

			var_225_3.Value = 0.7
			var_225_1.m_YAxis = var_225_3
			arg_222_0.pinchValue = 1

			arg_222_0:RegisterOrbits(arg_222_0.cameras[var_0_0.CAMERA.PHOTO])
			arg_222_0:SetCameraObrits()
			arg_222_0:RegisterCameraBlendFinished(var_225_1, arg_225_0)
			arg_222_0:ActiveCamera(var_225_1)
		end,
		function(arg_226_0)
			arg_222_0:ShowBlackScreen(false, arg_226_0)
		end
	}, function()
		arg_222_0:EnableJoystick(true)
	end)
end

function var_0_0.ExitPhotoMode(arg_228_0)
	arg_228_0:emit(var_0_0.SHOW_BLOCK)
	arg_228_0:EnableJoystick(false)
	seriesAsync({
		function(arg_229_0)
			arg_228_0:ShowBlackScreen(true, arg_229_0)
		end,
		function(arg_230_0)
			arg_228_0:RevertCameraOrbit()
			arg_228_0:SwitchAnim(var_0_0.ANIM.IDLE)
			onNextTick(function()
				arg_228_0:ChangeCharacterPosition()
			end)

			if arg_228_0.contextData.photoFreeMode then
				arg_228_0:EnablePOVLayer(false)
				setActive(arg_228_0.restrictedBox, false)

				arg_228_0.contextData.photoFreeMode = nil
			end

			local var_230_0 = arg_228_0.cameras[var_0_0.CAMERA.POV]

			arg_228_0:RegisterCameraBlendFinished(var_230_0, arg_230_0)
			arg_228_0:ActiveCamera(var_230_0)
		end,
		function(arg_232_0)
			arg_228_0:ShowBlackScreen(false, arg_232_0)
		end
	}, function()
		arg_228_0:RefreshSlots()
		arg_228_0:SetAllBlackbloardValue("inLockLayer", false)
		arg_228_0:emit(var_0_0.HIDE_BLOCK)
		arg_228_0:emit(var_0_0.ENABLE_SCENEBLOCK, false)
		arg_228_0:TempHideUI(false)
	end)
end

function var_0_0.SwitchCameraZone(arg_234_0, arg_234_1, arg_234_2, arg_234_3)
	arg_234_0:emit(var_0_0.SHOW_BLOCK)
	seriesAsync({
		function(arg_235_0)
			arg_234_0:ShowBlackScreen(true, arg_235_0)
		end,
		function(arg_236_0)
			arg_234_0:SwitchAnim(arg_234_2)
			onNextTick(function()
				arg_234_0:ResetCharPoint(arg_234_1:GetWatchCameraName())
				arg_234_0:SyncInterestTransform(arg_234_0)
				arg_236_0()
			end)
		end,
		function(arg_238_0)
			arg_234_0:ShowBlackScreen(false, arg_238_0)
		end
	}, function()
		arg_234_0:emit(var_0_0.HIDE_BLOCK)
		existCall(arg_234_3)
	end)
end

function var_0_0.SwitchPhotoCamera(arg_240_0)
	if not arg_240_0.contextData.photoFreeMode then
		arg_240_0:EnableJoystick(false)
		arg_240_0:EnablePOVLayer(true)
		setActive(arg_240_0.restrictedBox, true)

		local var_240_0 = arg_240_0.cameras[var_0_0.CAMERA.PHOTO_FREE]

		var_240_0.transform.position = arg_240_0.mainCameraTF.position

		local var_240_1 = arg_240_0.cameras[var_0_0.CAMERA.PHOTO_FREE]:Find("PhotoFree Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera)):GetCinemachineComponent(Cinemachine.CinemachineCore.Stage.Aim)
		local var_240_2 = arg_240_0.mainCameraTF.rotation:ToEulerAngles()
		local var_240_3 = var_240_1.m_HorizontalAxis

		var_240_3.Value = var_240_2.y
		var_240_1.m_HorizontalAxis = var_240_3

		local var_240_4 = var_240_1.m_VerticalAxis

		var_240_4.Value = arg_240_0:GetNearestAngle(var_240_2.x, var_240_4.m_MinValue, var_240_4.m_MaxValue)
		var_240_1.m_VerticalAxis = var_240_4

		local var_240_5 = math.InverseLerp(arg_240_0.restrictedHeightRange[1], arg_240_0.restrictedHeightRange[2], var_240_0.position.y)

		arg_240_0:emit(Dorm3dPhotoMediator.CAMERA_LIFT_CHANGED, var_240_5)
		arg_240_0:ActiveCamera(arg_240_0.cameras[var_0_0.CAMERA.PHOTO_FREE])
	else
		arg_240_0:EnableJoystick(true)
		arg_240_0:EnablePOVLayer(false)
		setActive(arg_240_0.restrictedBox, false)
		arg_240_0:ActiveCamera(arg_240_0.cameras[var_0_0.CAMERA.PHOTO])
	end

	arg_240_0.contextData.photoFreeMode = not arg_240_0.contextData.photoFreeMode
end

function var_0_0.SetPhotoCameraHeight(arg_241_0, arg_241_1)
	local var_241_0 = math.lerp(arg_241_0.restrictedHeightRange[1], arg_241_0.restrictedHeightRange[2], arg_241_1)
	local var_241_1 = arg_241_0.cameras[var_0_0.CAMERA.PHOTO_FREE]

	var_241_1:GetComponent(typeof(UnityEngine.CharacterController)):Move(Vector3.New(0, var_241_0 - var_241_1.position.y, 0))
	onNextTick(function()
		local var_242_0 = math.InverseLerp(arg_241_0.restrictedHeightRange[1], arg_241_0.restrictedHeightRange[2], var_241_1.position.y)

		arg_241_0:emit(Dorm3dPhotoMediator.CAMERA_LIFT_CHANGED, var_242_0)
	end)
end

function var_0_0.ResetPhotoCameraPosition(arg_243_0)
	local var_243_0 = arg_243_0.cameras[var_0_0.CAMERA.PHOTO]
	local var_243_1 = var_243_0.m_XAxis

	var_243_1.Value = 180
	var_243_0.m_XAxis = var_243_1

	local var_243_2 = var_243_0.m_YAxis

	var_243_2.Value = 0.7
	var_243_0.m_YAxis = var_243_2
end

function var_0_0.ResetCharPoint(arg_244_0, arg_244_1)
	local var_244_0 = arg_244_0.furnitures:Find(arg_244_1 .. "/StayPoint")

	arg_244_0.lady.position = var_244_0.position
	arg_244_0.lady.rotation = var_244_0.rotation
end

function var_0_0.GetNearestAngle(arg_245_0, arg_245_1, arg_245_2, arg_245_3)
	if arg_245_3 < arg_245_2 then
		arg_245_3 = arg_245_3 + 360
	end

	if arg_245_2 <= arg_245_1 and arg_245_1 <= arg_245_3 then
		return arg_245_1
	end

	local var_245_0 = (arg_245_2 + arg_245_3) / 2

	arg_245_1 = var_245_0 - Mathf.DeltaAngle(arg_245_1, var_245_0)
	arg_245_1 = math.clamp(arg_245_1, arg_245_2, arg_245_3)

	return arg_245_1
end

function var_0_0.PlayTimeline(arg_246_0, arg_246_1, arg_246_2)
	local var_246_0 = {}

	if arg_246_0.waitForTimeline then
		table.insert(var_246_0, function(arg_247_0)
			local var_247_0 = arg_246_0.waitForTimeline

			arg_246_0.waitForTimeline = nil

			var_247_0()
			arg_247_0()
		end)
	end

	table.insert(var_246_0, function(arg_248_0)
		arg_246_0:LoadTimelineScene(arg_246_1.name, false, arg_248_0)
	end)

	if arg_246_1.scene and arg_246_1.sceneRoot then
		table.insert(var_246_0, function(arg_249_0)
			arg_246_0:ChangeArtScene(arg_246_1.scene .. "|" .. arg_246_1.sceneRoot, arg_249_0)
		end)
	end

	table.insert(var_246_0, function(arg_250_0)
		local var_250_0 = GameObject.Find("[sequence]").transform
		local var_250_1 = var_250_0:GetComponent(typeof(UnityEngine.Playables.PlayableDirector))

		if GetComponent(var_250_1, "TimelineSpeed") then
			setDirectorSpeed(var_250_1, 1)
		else
			GetOrAddComponent(var_250_0, "TimelineSpeed")
		end

		local var_250_2 = GameObject.Find("[actor]").transform
		local var_250_3 = var_250_2:GetComponentsInChildren(typeof(Animator), true)

		table.IpairsCArray(var_250_3, function(arg_251_0, arg_251_1)
			GetOrAddComponent(arg_251_1.transform, typeof(DftAniEvent))
		end)
		table.IpairsCArray(var_250_2:GetComponentsInChildren(typeof("MagicaCloth.BaseCloth"), true), function(arg_252_0, arg_252_1)
			arg_252_1.enabled, arg_252_1.enabled = arg_252_1.enabled, false
		end)
		var_250_1:Stop()

		var_250_1.extrapolationMode = ReflectionHelp.RefGetField(typeof("UnityEngine.Playables.DirectorWrapMode"), "Hold", nil)

		if arg_246_1.time then
			var_250_1.time = math.clamp(arg_246_1.time, 0, var_250_1.duration)
		end

		local var_250_4 = {}

		local function var_250_5(arg_253_0)
			switch(arg_253_0.stringParameter, {
				TimelinePause = function()
					setDirectorSpeed(var_250_1, 0)
				end,
				TimelineResume = function()
					arg_246_0.timelineSpeed = 1

					setDirectorSpeed(var_250_1, 1)
				end,
				TimelinePlayOnTime = function()
					if arg_253_0.intParameter == 0 or arg_253_0.intParameter == var_250_4.selectIndex then
						var_250_1.time = arg_253_0.floatParameter

						var_250_1:RebuildGraph()
					end
				end,
				TimelineSelectStart = function()
					var_250_4.selectIndex = nil

					if arg_246_1.options then
						local var_257_0 = arg_246_1.options[arg_253_0.intParameter]

						arg_246_0:DoTimelineOption(var_257_0, function(arg_258_0)
							var_250_4.selectIndex = arg_258_0
							var_250_4.optionIndex = var_257_0[arg_258_0].flag
						end)
					end
				end,
				TimelineTouchStart = function()
					var_250_4.selectIndex = nil

					if arg_246_1.touchs then
						local var_259_0 = arg_246_1.touchs[arg_253_0.intParameter]

						arg_246_0:DoTimelineTouch(arg_246_1.touchs[arg_253_0.intParameter], function(arg_260_0)
							var_250_4.selectIndex = arg_260_0
							var_250_4.optionIndex = var_259_0[arg_260_0].flag
						end)
					end
				end,
				TimelineSelectLoop = function()
					if not var_250_4.selectIndex then
						var_250_1.time = arg_253_0.floatParameter

						var_250_1:RebuildGraph()
					end
				end,
				TimelineAccompanyJump = function()
					if arg_246_0.canTriggerAccompanyPerformance then
						arg_246_0.canTriggerAccompanyPerformance = false

						local var_262_0 = arg_246_1.accompanys[arg_253_0.intParameter]
						local var_262_1 = var_262_0[math.random(#var_262_0)]

						var_250_1.time = var_262_1

						var_250_1:RebuildGraph()
					end
				end,
				TimelineEnd = function()
					var_250_4.finish = true

					setDirectorSpeed(var_250_1, 0)
				end
			}, function()
				warning("other event trigger:" .. arg_253_0.stringParameter)
			end)

			if var_250_4.finish then
				arg_246_0.timelineMark = var_250_4
				arg_246_0.timelineFinishCall = nil

				arg_250_0()
			end
		end

		GetOrAddComponent(var_250_0, "DftCommonSignalReceiver"):SetCommonEvent(var_250_5)

		function arg_246_0.timelineFinishCall()
			var_250_5({
				stringParameter = "TimelineEnd"
			})
		end

		arg_246_0:HideCharacter()
		setActive(arg_246_0.mainCameraTF, false)
		eachChild(arg_246_0.rtTimelineScreen, function(arg_266_0)
			setActive(arg_266_0, false)
		end)
		setActive(arg_246_0.rtTimelineScreen, true)
		setActive(arg_246_0.rtTimelineScreen:Find("btn_skip"), arg_246_0.inReplayTalk)
		var_250_1:Play()
		var_250_1:Evaluate()
	end)
	table.insert(var_246_0, function(arg_267_0)
		arg_246_0:ShowBlackScreen(true, function()
			arg_246_0:UnloadTimelineScene(arg_246_1.name, false, arg_267_0)
		end)
	end)

	local var_246_1 = arg_246_0.artSceneInfo

	table.insert(var_246_0, function(arg_269_0)
		arg_246_0:ChangeArtScene(var_246_1, arg_269_0)
	end)
	seriesAsync(var_246_0, function()
		setActive(arg_246_0.rtTimelineScreen, false)
		arg_246_0:RevertCharacter()
		setActive(arg_246_0.mainCameraTF, true)

		local var_270_0 = arg_246_0.timelineMark

		arg_246_0.timelineMark = nil

		existCall(arg_246_2, var_270_0, function(arg_271_0)
			arg_246_0:ShowBlackScreen(false, arg_271_0)
		end)
	end)
end

function var_0_0.PlaySingleAction(arg_272_0, arg_272_1, arg_272_2)
	local var_272_0 = string.find(arg_272_1, "^Face_")

	if tobool(var_272_0) then
		arg_272_0:PlayFaceAnim(arg_272_1, arg_272_2)

		return
	end

	arg_272_0.animNameMap = arg_272_0.animNameMap or {}
	arg_272_0.animNameMap[arg_272_0.ladyAnimator.StringToHash(arg_272_1)] = arg_272_1

	local var_272_1 = {}

	if not arg_272_0.ladyAnimator:GetCurrentAnimatorStateInfo(arg_272_0.ladyAnimBaseLayerIndex):IsName(arg_272_1) then
		table.insert(var_272_1, function(arg_273_0)
			arg_272_0.nowState = arg_272_1
			arg_272_0.stateCallback = arg_273_0

			arg_272_0.ladyAnimator:CrossFadeInFixedTime(arg_272_1, 0.25, arg_272_0.ladyAnimBaseLayerIndex)
		end)
		table.insert(var_272_1, function(arg_274_0)
			arg_272_0.nowState = nil
			arg_272_0.stateCallback = nil

			arg_274_0()
		end)
	end

	seriesAsync(var_272_1, arg_272_2)
end

function var_0_0.SwitchAnim(arg_275_0, arg_275_1, arg_275_2)
	local var_275_0 = string.find(arg_275_1, "^Face_")

	if tobool(var_275_0) then
		arg_275_0:PlayFaceAnim(arg_275_1, arg_275_2)

		return
	end

	arg_275_0.animNameMap = arg_275_0.animNameMap or {}
	arg_275_0.animNameMap[arg_275_0.ladyAnimator.StringToHash(arg_275_1)] = arg_275_1

	local var_275_1 = {}

	table.insert(var_275_1, function(arg_276_0)
		arg_275_0.nowState = arg_275_1
		arg_275_0.stateCallback = arg_276_0

		arg_275_0.ladyAnimator:PlayInFixedTime(arg_275_1, arg_275_0.ladyAnimBaseLayerIndex)
	end)
	table.insert(var_275_1, function(arg_277_0)
		arg_275_0.nowState = nil
		arg_275_0.stateCallback = nil

		arg_277_0()
	end)
	seriesAsync(var_275_1, arg_275_2)
end

function var_0_0.PlayFaceAnim(arg_278_0, arg_278_1, arg_278_2)
	arg_278_0.ladyAnimator:CrossFadeInFixedTime(arg_278_1, 0.2, arg_278_0.ladyAnimFaceLayerIndex)
	existCall(arg_278_2)
end

function var_0_0.GetCurrentAnim(arg_279_0)
	local var_279_0 = arg_279_0.ladyAnimator:GetCurrentAnimatorStateInfo(arg_279_0.ladyAnimBaseLayerIndex).shortNameHash

	return arg_279_0.animNameMap[var_279_0]
end

function var_0_0.RegisterAnimCallback(arg_280_0, arg_280_1, arg_280_2)
	arg_280_0.animCallbacks[arg_280_1] = arg_280_2
end

function var_0_0.SetCharacterAnimSpeed(arg_281_0, arg_281_1)
	arg_281_0.ladyAnimator.speed = arg_281_1
	arg_281_0.ladyHeadIKComp.blinkSpeed = arg_281_0.ladyHeadIKData.blinkSpeed * arg_281_1

	if arg_281_1 > 0 then
		arg_281_0.ladyHeadIKComp.DampTime = arg_281_0.ladyHeadIKData.DampTime / arg_281_1
	else
		arg_281_0.ladyHeadIKComp.DampTime = arg_281_0.ladyHeadIKData.DampTime * math.huge
	end
end

function var_0_0.OnAnimationEvent(arg_282_0, arg_282_1)
	if arg_282_1.animatorClipInfo.weight < 0.5 then
		return
	end

	local var_282_0 = arg_282_1.stringParameter
	local var_282_1 = table.removebykey(arg_282_0.animEventCallbacks, var_282_0)

	existCall(var_282_1)
end

function var_0_0.RegisterAnimEventCallback(arg_283_0, arg_283_1, arg_283_2)
	arg_283_0.animEventCallbacks[arg_283_1] = arg_283_2
end

function var_0_0.RegisterCameraBlendFinished(arg_284_0, arg_284_1, arg_284_2)
	arg_284_0.cameraBlendCallbacks[arg_284_1] = arg_284_2
end

function var_0_0.UnRegisterCameraBlendFinished(arg_285_0, arg_285_1)
	arg_285_0.cameraBlendCallbacks[arg_285_1] = nil
end

function var_0_0.OnCameraBlendFinished(arg_286_0, arg_286_1)
	if not arg_286_1 then
		return
	end

	local var_286_0 = table.removebykey(arg_286_0.cameraBlendCallbacks, arg_286_1)

	existCall(var_286_0)
end

function var_0_0.PlayHeartFX(arg_287_0, arg_287_1)
	local var_287_0 = arg_287_0.ladyDict[arg_287_1]

	setActive(var_287_0.effectHeart, false)
	setActive(var_287_0.effectHeart, true)
	pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_joyful")
end

function var_0_0.PlayExpression(arg_288_0, arg_288_1)
	local var_288_0 = arg_288_1.name
	local var_288_1 = arg_288_0.expressionDict[var_288_0]
	local var_288_2 = 5

	if var_288_1 then
		local var_288_3 = var_288_1.timer

		var_288_3:Reset(nil, var_288_2)
		var_288_3:Start()

		if var_288_1.instance then
			setActive(var_288_1.instance, false)
			setActive(var_288_1.instance, true)
		end

		return
	end

	local var_288_4 = {
		name = var_288_0,
		timer = Timer.New(function()
			arg_288_0:RemoveExpression(var_288_0)
		end, var_288_2, 1, true)
	}

	arg_288_0.expressionDict[var_288_0] = var_288_4

	arg_288_0.loader:GetPrefab("dorm3D/effect/prefab/expression/" .. var_288_0, var_288_0, function(arg_290_0)
		var_288_4.instance = arg_290_0

		onNextTick(function()
			setParent(arg_290_0, arg_288_0.ladyHeadCenter)
		end)
		setLocalPosition(arg_290_0, Vector3(0, 0, -0.2))
		setActive(arg_290_0, false)
		setActive(arg_290_0, true)
	end, var_288_4)
end

function var_0_0.RemoveExpression(arg_292_0, arg_292_1)
	local var_292_0 = arg_292_0.expressionDict[arg_292_1]

	if not var_292_0 then
		return
	end

	arg_292_0.loader:ClearRequest(var_292_0)

	if var_292_0.instance then
		arg_292_0.loader:ReturnPrefab(var_292_0.instance)
	end

	arg_292_0.expressionDict[arg_292_1] = nil
end

function var_0_0.ShowOrHideCanWatchMark(arg_293_0, arg_293_1)
	arg_293_0.ladyWatchFloat = arg_293_0.ladyWatchFloat or cloneTplTo(arg_293_0.resTF:Find("vfx_talk_mark"), arg_293_0.ladyHeadCenter)

	setActive(arg_293_0.ladyWatchFloat, arg_293_1)
end

function var_0_0.RegisterGlobalVolume(arg_294_0)
	local var_294_0 = arg_294_0.globalVolume
	local var_294_1 = LuaHelper.GetOrAddVolumeComponent(var_294_0, typeof(BLHX.PostEffect.Overrides.DepthOfField))
	local var_294_2 = LuaHelper.GetOrAddVolumeComponent(var_294_0, typeof(BLHX.PostEffect.Overrides.ColorGrading))

	arg_294_0.originalCameraSettings = {
		depthOfField = {
			enabled = var_294_1.enabled.value,
			focusDistance = {
				length = 2,
				min = var_294_1.gaussianStart.min,
				value = var_294_1.gaussianStart.value
			},
			blurRadius = {
				min = var_294_1.blurRadius.min,
				max = var_294_1.blurRadius.max,
				value = var_294_1.blurRadius.value
			}
		},
		postExposure = {
			value = var_294_2.postExposure.value
		},
		contrast = {
			min = var_294_2.contrast.min,
			max = var_294_2.contrast.max,
			value = var_294_2.contrast.value
		},
		saturate = {
			min = var_294_2.saturation.min,
			max = var_294_2.saturation.max,
			value = var_294_2.saturation.value
		}
	}
	arg_294_0.originalCameraSettings.depthOfField.enabled = true

	local var_294_3 = var_294_0:GetComponent(typeof(BLHX.Volume.Volume))

	arg_294_0.originalVolume = {
		profile = var_294_3.sharedProfile,
		weight = var_294_3.weight
	}
end

function var_0_0.SettingCamera(arg_295_0, arg_295_1)
	arg_295_0.activeCameraSettings = arg_295_1

	local var_295_0 = arg_295_0.globalVolume
	local var_295_1 = LuaHelper.GetOrAddVolumeComponent(var_295_0, typeof(BLHX.PostEffect.Overrides.DepthOfField))
	local var_295_2 = LuaHelper.GetOrAddVolumeComponent(var_295_0, typeof(BLHX.PostEffect.Overrides.ColorGrading))

	var_295_1.enabled:Override(arg_295_1.depthOfField.enabled)
	var_295_1.gaussianStart:Override(arg_295_1.depthOfField.focusDistance.value)
	var_295_1.gaussianEnd:Override(arg_295_1.depthOfField.focusDistance.value + arg_295_1.depthOfField.focusDistance.length)
	var_295_1.blurRadius:Override(arg_295_1.depthOfField.blurRadius.value)
	var_295_2.postExposure:Override(arg_295_1.postExposure.value)
	var_295_2.contrast:Override(arg_295_1.contrast.value)
	var_295_2.saturation:Override(arg_295_1.saturate.value)
end

function var_0_0.GetCameraSettings(arg_296_0)
	return arg_296_0.originalCameraSettings
end

function var_0_0.RevertCameraSettings(arg_297_0)
	arg_297_0:SettingCamera(arg_297_0.originalCameraSettings)

	arg_297_0.activeCameraSettings = nil
end

function var_0_0.SetVolumeProfile(arg_298_0, arg_298_1, arg_298_2)
	local var_298_0 = arg_298_0.globalVolume:GetComponent(typeof(BLHX.Volume.Volume))

	arg_298_0.activeProfileWeight = arg_298_2

	if arg_298_0.activeProfileName ~= arg_298_1 then
		arg_298_0.activeProfileName = arg_298_1

		arg_298_0.loader:LoadReference("dorm3d/scenesres/res/common", arg_298_1, nil, function(arg_299_0)
			var_298_0.profile = arg_299_0
			var_298_0.weight = arg_298_0.activeProfileWeight

			if arg_298_0.activeCameraSettings then
				arg_298_0:SettingCamera(arg_298_0.activeCameraSettings)
			end
		end, "VolumeProfile")
	else
		var_298_0.weight = arg_298_0.activeProfileWeight
	end
end

function var_0_0.RevertVolumeProfile(arg_300_0)
	local var_300_0 = arg_300_0.globalVolume:GetComponent(typeof(BLHX.Volume.Volume))

	var_300_0.profile = arg_300_0.originalVolume.profile
	var_300_0.weight = arg_300_0.originalVolume.weight

	if arg_300_0.activeCameraSettings then
		arg_300_0:SettingCamera(arg_300_0.activeCameraSettings)
	end

	arg_300_0.activeProfileName = nil
end

function var_0_0.RecordCharacterLight(arg_301_0)
	local var_301_0 = BLHX.Rendering.PipelineInterface.GetCharacterLightColor()

	arg_301_0.originalCharacterColor = {
		color = var_301_0.color,
		intensity = var_301_0.intensity
	}
end

function var_0_0.SetCharacterLight(arg_302_0, arg_302_1, arg_302_2, arg_302_3)
	local var_302_0 = arg_302_0.characterLight:GetComponent(typeof(Light))
	local var_302_1 = Color.Lerp(arg_302_0.originalCharacterColor.color, arg_302_1, arg_302_3)
	local var_302_2 = math.lerp(arg_302_0.originalCharacterColor.intensity, arg_302_2, arg_302_3)

	BLHX.Rendering.PipelineInterface.SetCharacterLight(var_302_1, var_302_2)
end

function var_0_0.RevertCharacterLight(arg_303_0)
	arg_303_0:SetCharacterLight(arg_303_0.originalCharacterColor.color, arg_303_0.originalCharacterColor.intensity, 1)
end

function var_0_0.EnableCloth(arg_304_0, arg_304_1, arg_304_2)
	arg_304_1 = arg_304_1 or {}

	table.Foreach(arg_304_0.clothComps, function(arg_305_0, arg_305_1)
		if arg_305_1 == nil then
			return
		end

		setActive(arg_305_1, arg_304_1[arg_305_0] == 1)
	end)
	table.Foreach(arg_304_0.clothColliderDict, function(arg_306_0, arg_306_1)
		if arg_306_1 == nil then
			return
		end

		setActive(arg_306_1, false)
	end)

	if arg_304_2 then
		table.Foreach(arg_304_2, function(arg_307_0, arg_307_1)
			local var_307_0 = arg_304_0.clothColliderDict[arg_307_1[1]]

			if var_307_0 == nil then
				return
			end

			setActive(var_307_0, arg_307_1[2] == 1)

			if arg_307_1[2] ~= 1 then
				return
			end

			var_0_0.SetMagicaCollider(var_307_0, arg_307_1[3], arg_307_1[4])
		end)
	end
end

function var_0_0.RevertClothComps(arg_308_0, arg_308_1)
	table.Foreach(arg_308_1.ladyClothCompSettings, function(arg_309_0, arg_309_1)
		arg_309_0.enabled = arg_309_1.enabled
	end)
	table.Foreach(arg_308_1.ladyClothColliderSettings, function(arg_310_0, arg_310_1)
		arg_310_0.enabled = arg_310_1.enabled

		var_0_0.SetMagicaCollider(arg_310_0, arg_310_1.StartRadius, arg_310_1.EndRadius)
	end)
end

function var_0_0.onBackPressed(arg_311_0)
	if arg_311_0.exited or arg_311_0.retainCount > 0 then
		-- block empty
	else
		arg_311_0:closeView()
	end
end

function var_0_0.EnableSceneDisplay(arg_312_0, arg_312_1, arg_312_2)
	assert(tobool(arg_312_0.lastSceneRootDict[arg_312_1]) == arg_312_2)

	if arg_312_2 then
		table.Foreach(arg_312_0.lastSceneRootDict[arg_312_1], function(arg_313_0, arg_313_1)
			if IsNil(arg_313_0) then
				return
			end

			setActive(arg_313_0, arg_313_1)
		end)

		arg_312_0.lastSceneRootDict[arg_312_1] = nil
	else
		arg_312_0.lastSceneRootDict[arg_312_1] = {}

		local var_312_0 = SceneManager.GetSceneByName(arg_312_1)

		table.IpairsCArray(var_312_0:GetRootGameObjects(), function(arg_314_0, arg_314_1)
			if tostring(arg_314_1.hideFlags) ~= "None" then
				return
			end

			arg_312_0.lastSceneRootDict[arg_312_1][arg_314_1] = isActive(arg_314_1)

			setActive(arg_314_1, false)
		end)
	end
end

function var_0_0.ChangeArtScene(arg_315_0, arg_315_1, arg_315_2)
	arg_315_1 = string.lower(arg_315_1)

	if arg_315_1 == arg_315_0.artSceneInfo then
		if arg_315_1 == arg_315_0.sceneInfo then
			arg_315_0:SwitchDayNight(arg_315_0.contextData.timeIndex)
			onNextTick(function()
				arg_315_0:RefreshSlots()
				existCall(arg_315_2)
			end)
		else
			existCall(arg_315_2)
		end

		return
	end

	local var_315_0 = {}
	local var_315_1 = false
	local var_315_2

	table.insert(var_315_0, function(arg_317_0)
		arg_315_0.artSceneInfo = arg_315_1

		if var_315_1 then
			pg.SceneAnimMgr.GetInstance():Dorm3DSceneChange(function(arg_318_0)
				var_315_2 = arg_318_0

				arg_317_0()
			end)
		else
			arg_317_0()
		end
	end)

	if arg_315_1 == arg_315_0.sceneInfo then
		table.insert(var_315_0, function(arg_319_0)
			setActive(arg_315_0.slotRoot, true)

			local var_319_0, var_319_1 = unpack(string.split(arg_315_0.sceneInfo, "|"))

			SceneManager.SetActiveScene(SceneManager.GetSceneByName(var_319_0))
			arg_315_0:EnableSceneDisplay(var_319_0, true)
			arg_315_0:SwitchDayNight(arg_315_0.contextData.timeIndex)
			onNextTick(function()
				arg_315_0:RefreshSlots()
			end)
			arg_319_0()
		end)
	else
		var_315_1 = true

		local var_315_3, var_315_4 = unpack(string.split(arg_315_1, "|"))

		table.insert(var_315_0, function(arg_321_0)
			setActive(arg_315_0.slotRoot, false)
			SceneOpMgr.Inst:LoadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_315_4 .. "/" .. var_315_3 .. "_scene"), var_315_3, LoadSceneMode.Additive, function(arg_322_0, arg_322_1)
				SceneManager.SetActiveScene(arg_322_0)

				local var_322_0 = getSceneRootTFDic(arg_322_0).MainCamera

				if var_322_0 then
					setActive(var_322_0, false)
				end

				arg_321_0()
			end)
		end)
	end

	if arg_315_0.artSceneInfo == arg_315_0.sceneInfo then
		table.insert(var_315_0, function(arg_323_0)
			local var_323_0, var_323_1 = unpack(string.split(arg_315_0.sceneInfo, "|"))

			arg_315_0:EnableSceneDisplay(var_323_0, false)
			arg_323_0()
		end)
	else
		local var_315_5, var_315_6 = unpack(string.split(arg_315_0.artSceneInfo, "|"))

		table.insert(var_315_0, function(arg_324_0)
			SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_315_6 .. "/" .. var_315_5 .. "_scene"), var_315_5, arg_324_0)
		end)
	end

	table.insert(var_315_0, function(arg_325_0)
		arg_325_0()

		if var_315_1 then
			var_315_2()
		end
	end)
	seriesAsync(var_315_0, arg_315_2)
end

function var_0_0.LoadTimelineScene(arg_326_0, arg_326_1, arg_326_2, arg_326_3)
	arg_326_1 = string.lower(arg_326_1)

	if arg_326_0.cacheSceneDic[arg_326_1] then
		if not arg_326_2 then
			arg_326_0.timelineScene = arg_326_1

			arg_326_0:EnableSceneDisplay(arg_326_1, true)
		end

		return existCall(arg_326_3)
	end

	local var_326_0 = {}
	local var_326_1

	table.insert(var_326_0, function(arg_327_0)
		pg.SceneAnimMgr.GetInstance():Dorm3DSceneChange(function(arg_328_0)
			if arg_326_0.waitForTimeline then
				arg_326_0.waitForTimeline = arg_328_0
				var_326_1 = nil
			else
				var_326_1 = arg_328_0
			end

			arg_327_0()
		end)
	end)
	table.insert(var_326_0, function(arg_329_0)
		local var_329_0 = arg_326_0.apartment:getConfig("asset_name")

		SceneOpMgr.Inst:LoadSceneAsync(string.lower("dorm3d/character/" .. var_329_0 .. "/timeline/" .. arg_326_1 .. "/" .. arg_326_1 .. "_scene"), arg_326_1, LoadSceneMode.Additive, function(arg_330_0, arg_330_1)
			local var_330_0 = GameObject.Find("[actor]").transform

			arg_326_0:HXCharacter(tf(var_330_0))

			local var_330_1 = GameObject.Find("[sequence]").transform:GetComponent(typeof(UnityEngine.Playables.PlayableDirector))

			var_330_1:Stop()
			TimelineSupport.InitTimeline(var_330_1)
			TimelineSupport.InitSubtitle(var_330_1, arg_326_0.apartment:GetCallName())

			arg_326_0.unloadDirector = var_330_1

			arg_329_0()
		end)
	end)
	table.insert(var_326_0, function(arg_331_0)
		arg_326_0.sceneGroupDic[arg_326_1] = arg_326_0.apartment:GetConfigID()

		if arg_326_2 then
			arg_326_0.cacheSceneDic[arg_326_1] = true

			arg_326_0:EnableSceneDisplay(arg_326_1, false)
		else
			arg_326_0.timelineScene = arg_326_1
		end

		arg_331_0()
		existCall(var_326_1)
	end)
	seriesAsync(var_326_0, arg_326_3)
end

function var_0_0.UnloadTimelineScene(arg_332_0, arg_332_1, arg_332_2, arg_332_3)
	arg_332_1 = string.lower(arg_332_1)

	if arg_332_0.timelineScene == arg_332_1 then
		arg_332_0.timelineScene = nil
	end

	if tobool(arg_332_2) == tobool(arg_332_0.cacheSceneDic[arg_332_1]) then
		local var_332_0 = getProxy(ApartmentProxy):getApartment(arg_332_0.sceneGroupDic[arg_332_1]):getConfig("asset_name")

		if arg_332_0.unloadDirector then
			TimelineSupport.UnloadPlayable(arg_332_0.unloadDirector)

			arg_332_0.unloadDirector = nil
		end

		SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/character/scenes/" .. var_332_0 .. "/timeline/" .. arg_332_1 .. "/" .. arg_332_1 .. "_scene"), arg_332_1, function()
			arg_332_0.cacheSceneDic[arg_332_1] = nil
			arg_332_0.sceneGroupDic[arg_332_1] = nil
			arg_332_0.lastSceneRootDict[arg_332_1] = nil

			existCall(arg_332_3)
		end)
	else
		arg_332_0:EnableSceneDisplay(arg_332_1, false)
		existCall(arg_332_3)
	end
end

function var_0_0.ChangeSubScene(arg_334_0, arg_334_1, arg_334_2)
	arg_334_1 = string.lower(arg_334_1)

	warning(arg_334_0.subSceneInfo, "->", arg_334_1, arg_334_1 == arg_334_0.subSceneInfo)

	if arg_334_1 == arg_334_0.subSceneInfo then
		arg_334_0.ladyActiveZone = arg_334_0.walkBornPoint or arg_334_0.ladyBaseZone

		arg_334_0:ChangeCharacterPosition()
		arg_334_0:ChangePlayerPosition(arg_334_0.ladyActiveZone)
		arg_334_0:TriggerLadyDistance()
		arg_334_0:CheckInSector()
		existCall(arg_334_2)

		return
	end

	local var_334_0 = {}
	local var_334_1 = false
	local var_334_2

	table.insert(var_334_0, function(arg_335_0)
		arg_334_0.subSceneInfo = arg_334_1

		if var_334_1 then
			pg.SceneAnimMgr.GetInstance():Dorm3DSceneChange(function(arg_336_0)
				var_334_2 = arg_336_0

				arg_335_0()
			end)
		else
			arg_335_0()
		end
	end)

	if arg_334_1 == arg_334_0.sceneInfo then
		table.insert(var_334_0, function(arg_337_0)
			local var_337_0, var_337_1 = unpack(string.split(arg_334_0.sceneInfo, "|"))

			arg_334_0:ResetSceneStructure(SceneManager.GetSceneByName(var_337_0 .. "_base"))
			arg_334_0:RefreshSlots()

			arg_334_0.ladyActiveZone = arg_334_0.walkBornPoint or arg_334_0.ladyBaseZone

			arg_334_0:ChangeCharacterPosition()
			arg_334_0:ChangePlayerPosition(arg_334_0.ladyActiveZone)
			arg_334_0:TriggerLadyDistance()
			arg_334_0:CheckInSector()
			arg_337_0()
		end)
	else
		var_334_1 = true

		local var_334_3, var_334_4 = unpack(string.split(arg_334_1, "|"))
		local var_334_5 = var_334_3 .. "_base"

		table.insert(var_334_0, function(arg_338_0)
			SceneOpMgr.Inst:LoadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_334_4 .. "/" .. var_334_5 .. "_scene"), var_334_5, LoadSceneMode.Additive, arg_338_0)
		end)
		table.insert(var_334_0, function(arg_339_0)
			arg_334_0:ResetSceneStructure(SceneManager.GetSceneByName(var_334_5))

			arg_334_0.ladyActiveZone = arg_334_0.walkBornPoint or "Default"

			arg_334_0:SwitchAnim(var_0_0.ANIM.IDLE)
			onNextTick(function()
				arg_334_0:ChangeCharacterPosition()
				arg_334_0:ChangePlayerPosition(arg_334_0.ladyActiveZone)
				arg_334_0:TriggerLadyDistance()
				arg_334_0:CheckInSector()
				arg_339_0()
			end)
		end)
	end

	if arg_334_0.subSceneInfo == arg_334_0.sceneInfo then
		table.insert(var_334_0, function(arg_341_0)
			local var_341_0 = Clone(arg_334_0.room)

			var_341_0.furnitures = {}

			arg_334_0:RefreshSlots(var_341_0)
			arg_341_0()
		end)
	else
		local var_334_6, var_334_7 = unpack(string.split(arg_334_0.subSceneInfo, "|"))
		local var_334_8 = var_334_6 .. "_base"

		table.insert(var_334_0, function(arg_342_0)
			SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_334_7 .. "/" .. var_334_8 .. "_scene"), var_334_8, arg_342_0)
		end)
	end

	table.insert(var_334_0, function(arg_343_0)
		arg_343_0()

		if var_334_1 then
			var_334_2()
		end
	end)
	seriesAsync(var_334_0, arg_334_2)
end

function var_0_0.TransformMesh(arg_344_0)
	local var_344_0 = arg_344_0.sharedMesh
	local var_344_1 = {}
	local var_344_2 = arg_344_0.transform:TransformPoint(var_344_0.vertices[0])
	local var_344_3 = arg_344_0.transform:TransformPoint(var_344_0.vertices[1])
	local var_344_4 = arg_344_0.transform:TransformPoint(var_344_0.vertices[2])

	var_344_1.horizontal = var_344_3 - var_344_2
	var_344_1.verticle = var_344_4 - var_344_2
	var_344_1.origin = var_344_2

	return var_344_1
end

function var_0_0.GetRatio(arg_345_0, arg_345_1)
	local var_345_0 = Vector2.zero

	var_345_0.x = Vector3.Dot(arg_345_0.horizontal, arg_345_1) / arg_345_0.horizontal.sqrMagnitude
	var_345_0.y = Vector3.Dot(arg_345_0.verticle, arg_345_1) / arg_345_0.verticle.sqrMagnitude

	return var_345_0
end

function var_0_0.GetPostionByRatio(arg_346_0, arg_346_1)
	return arg_346_0.horizontal * arg_346_1.x + arg_346_0.verticle * arg_346_1.y + arg_346_0.origin
end

function var_0_0.IsPointInSector(arg_347_0, arg_347_1)
	local var_347_0 = arg_347_1 - Vector3.New(unpack(arg_347_0.Position))

	if var_347_0.magnitude > arg_347_0.Radius then
		return false
	end

	local var_347_1 = Quaternion.Euler(unpack(arg_347_0.Rotation))

	return Vector3.Angle(var_347_1 * Vector3.forward, var_347_0) <= arg_347_0.Angle / 2
end

function var_0_0.willExit(arg_348_0)
	arg_348_0.joystickTimer:Stop()
	arg_348_0.moveStickTimer:Stop()
	UpdateBeat:RemoveListener(arg_348_0.updateHandler)
	arg_348_0:StopIKHandTimer()

	if arg_348_0.moveTimer then
		arg_348_0.moveTimer:Stop()

		arg_348_0.moveTimer = nil
	end

	if arg_348_0.moveWaitTimer then
		arg_348_0.moveWaitTimer:Stop()

		arg_348_0.moveWaitTimer = nil
	end

	GlobalClickEventMgr.Inst:RemoveBeginPinchFunc()
	GlobalClickEventMgr.Inst:RemovePinchFunc()
	GlobalClickEventMgr.Inst:RemoveEndPinchFunc()

	if not IsNil(arg_348_0.furnitures) then
		eachChild(arg_348_0.furnitures, function(arg_349_0)
			local var_349_0 = GetComponent(arg_349_0, typeof(EventTriggerListener))

			if not var_349_0 then
				return
			end

			var_349_0:ClearEvents()
		end)
	end

	for iter_348_0, iter_348_1 in pairs(arg_348_0.ladyDict) do
		arg_348_0:ResetActiveIKs(iter_348_1)
		GetComponent(iter_348_1.lady, typeof(EventTriggerListener)):ClearEvents()
	end

	arg_348_0.camBrainEvenetHandler.OnBlendStarted = nil
	arg_348_0.camBrainEvenetHandler.OnBlendFinished = nil

	pg.UIMgr.GetInstance():UnOverlayPanel(arg_348_0.blockLayer, arg_348_0._tf)
	table.Foreach(arg_348_0.expressionDict, function(arg_350_0)
		arg_348_0:RemoveExpression(arg_350_0)
	end)
	arg_348_0.loader:Clear()
	pg.ClickEffectMgr:GetInstance():SetClickEffect("NORMAL")
	pg.NodeCanvasMgr.GetInstance():Clear()

	local var_348_0 = {}

	if arg_348_0.timelineScene and not arg_348_0.cacheSceneDic[arg_348_0.timelineScene] then
		local var_348_1 = arg_348_0.timelineScene

		arg_348_0.timelineScene = nil

		local var_348_2 = getProxy(ApartmentProxy):getApartment(arg_348_0.sceneGroupDic[var_348_1]):getConfig("asset_name")

		table.insert(var_348_0, function(arg_351_0)
			SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/character/scenes/" .. var_348_2 .. "/timeline/" .. var_348_1 .. "/" .. var_348_1 .. "_scene"), var_348_1, arg_351_0)
		end)
	end

	for iter_348_2, iter_348_3 in pairs(arg_348_0.cacheSceneDic) do
		if iter_348_3 then
			local var_348_3 = getProxy(ApartmentProxy):getApartment(arg_348_0.sceneGroupDic[iter_348_2]):getConfig("asset_name")

			table.insert(var_348_0, function(arg_352_0)
				SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/character/scenes/" .. var_348_3 .. "/timeline/" .. iter_348_2 .. "/" .. iter_348_2 .. "_scene"), iter_348_2, arg_352_0)
			end)
		end
	end

	for iter_348_4, iter_348_5 in ipairs({
		arg_348_0.sceneInfo,
		arg_348_0.subSceneInfo ~= arg_348_0.sceneInfo and arg_348_0.subSceneInfo or nil
	}) do
		local var_348_4, var_348_5 = unpack(string.split(iter_348_5, "|"))
		local var_348_6 = var_348_4 .. "_base"

		table.insert(var_348_0, function(arg_353_0)
			SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_348_5 .. "/" .. var_348_6 .. "_scene"), var_348_6, arg_353_0)
		end)
	end

	for iter_348_6, iter_348_7 in ipairs({
		arg_348_0.sceneInfo,
		arg_348_0.artSceneInfo ~= arg_348_0.sceneInfo and arg_348_0.artSceneInfo or nil
	}) do
		local var_348_7, var_348_8 = unpack(string.split(iter_348_7, "|"))

		table.insert(var_348_0, function(arg_354_0)
			SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_348_8 .. "/" .. var_348_7 .. "_scene"), var_348_7, arg_354_0)
		end)
	end

	seriesAsync(var_348_0, function()
		ReflectionHelp.RefSetProperty(typeof("UnityEngine.LightmapSettings"), "lightmaps", nil, nil)
	end)
end

function var_0_0.InitDefautQuality()
	if PlayerPrefs.GetInt("dorm3d_graphics_settings", 0) == 0 then
		local var_356_0 = DevicePerformanceUtil.GetDevicePerformanceLevel()

		if PLATFORM == PLATFORM_IPHONEPLAYER then
			local var_356_1 = SystemInfo.deviceModel or ""

			local function var_356_2(arg_357_0)
				local var_357_0 = string.match(arg_357_0, "iPad(%d+)")
				local var_357_1 = tonumber(var_357_0)

				if var_357_1 and var_357_1 >= 8 then
					return true
				end

				return false
			end

			local function var_356_3(arg_358_0)
				local var_358_0 = string.match(arg_358_0, "iPhone(%d+)")
				local var_358_1 = tonumber(var_358_0)

				if var_358_1 and var_358_1 >= 13 then
					return true
				end

				return false
			end

			if var_356_2(var_356_1) or var_356_3(var_356_1) then
				var_356_0 = DevicePerformanceLevel.High
			end
		end

		local var_356_4 = var_356_0 == DevicePerformanceLevel.High and 3 or var_356_0 == DevicePerformanceLevel.Mid and 2 or 1

		PlayerPrefs.SetInt("dorm3d_graphics_settings", var_356_4)

		Dorm3dRoomTemplateScene.FirstDefaultSetting = var_356_4
	end
end

function var_0_0.SettingQuality()
	local var_359_0 = GraphicSettingConst.HandleCustomSetting()

	BLHX.Rendering.EngineCore.SetOverrideQualitySettings(var_359_0)
end

function var_0_0.SetMagicaCollider(arg_360_0, arg_360_1, arg_360_2)
	local var_360_0 = typeof("MagicaCloth.MagicaCapsuleCollider")

	ReflectionHelp.RefSetProperty(var_360_0, "StartRadius", arg_360_0, arg_360_1)
	ReflectionHelp.RefSetProperty(var_360_0, "EndRadius", arg_360_0, arg_360_2)
end

return var_0_0
