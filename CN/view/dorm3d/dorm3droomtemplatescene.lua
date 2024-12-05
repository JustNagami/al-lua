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

		if isActive(arg_15_0.cameras[var_0_0.CAMERA.PHOTO_FREE]) then
			arg_15_0:emit(Dorm3dPhotoMediator.CAMERA_STICK_MOVE, Vector2.zero)
		end
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
		end
	end)
	arg_15_0:bind(var_0_0.PHOTO_CALL, function(arg_32_0, arg_32_1, ...)
		local var_32_0 = arg_15_0.ladyDict[arg_15_0.apartment:GetConfigID()]

		arg_15_0[arg_32_1](var_32_0, ...)
	end)
end

function var_0_0.initScene(arg_33_0)
	local var_33_0, var_33_1 = unpack(string.split(arg_33_0.sceneInfo, "|"))
	local var_33_2 = SceneManager.GetSceneByName(var_33_0 .. "_base")

	arg_33_0:ResetSceneStructure(var_33_2)

	arg_33_0.mainCameraTF = GameObject.Find("BackYardMainCamera").transform
	arg_33_0.camBrain = arg_33_0.mainCameraTF:GetComponent(typeof(Cinemachine.CinemachineBrain))
	arg_33_0.camBrainEvenetHandler = arg_33_0.mainCameraTF:GetComponent(typeof(CameraBrainEventsHandler))
	arg_33_0.raycastCamera = arg_33_0.mainCameraTF:Find("CameraForRaycast"):GetComponent(typeof(Camera))
	arg_33_0.sceneRaycaster = arg_33_0.raycastCamera:GetComponent(typeof(UnityEngine.EventSystems.PhysicsRaycaster))
	arg_33_0.player = GameObject.Find("Player").transform
	arg_33_0.playerEye = arg_33_0.player:Find("Eye")
	arg_33_0.playerFoot = arg_33_0.player:Find("Foot")

	setActive(arg_33_0.playerFoot, false)

	arg_33_0.playerController = arg_33_0.player:GetComponent(typeof(UnityEngine.CharacterController))
	arg_33_0.attachedPoints = {}

	eachChild(arg_33_0.furnitures, function(arg_34_0)
		table.insert(arg_33_0.attachedPoints, 1, arg_34_0)
	end)

	arg_33_0.dollyParent = GameObject.Find("Dollys").transform
	arg_33_0.modelRoot = GameObject.Find("scene_root").transform
	arg_33_0.slotRoot = GameObject.Find("FurnitureSlots").transform

	setActive(arg_33_0.slotRoot, true)
	arg_33_0:InitSlots()

	arg_33_0.resTF = GameObject.Find("Res").transform

	tolua.loadassembly("Cinemachine")
	tolua.loadassembly("MagicaCloth")

	local var_33_3 = GameObject.Find("CM Cameras").transform

	eachChild(var_33_3, function(arg_35_0)
		setActive(arg_35_0, false)
	end)

	arg_33_0.camBrain.enabled = false
	arg_33_0.camBrain.enabled = true
	arg_33_0.cameraAim = var_33_3:Find("Aim Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))
	arg_33_0.cameraAim2 = var_33_3:Find("Aim2 Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))
	arg_33_0.cameraFree = nil
	arg_33_0.cameraFurnitureWatch = nil
	arg_33_0.cameraRole = var_33_3:Find("Role Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))
	arg_33_0.cameraRole2 = var_33_3:Find("Role2 Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))
	arg_33_0.cameraTalk = var_33_3:Find("Talk Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))
	arg_33_0.cameraGift = var_33_3:Find("Gift Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))
	arg_33_0.cameraRoleWatch = nil
	arg_33_0.cameras = {
		arg_33_0.cameraAim,
		arg_33_0.cameraAim2,
		arg_33_0.cameraRole,
		arg_33_0.cameraTalk,
		arg_33_0.cameraRoleWatch,
		[var_0_0.CAMERA.GIFT] = arg_33_0.cameraGift,
		[var_0_0.CAMERA.ROLE2] = arg_33_0.cameraRole2,
		[var_0_0.CAMERA.PHOTO] = var_33_3:Find("Photo Camera"):GetComponent(typeof(Cinemachine.CinemachineFreeLook)),
		[var_0_0.CAMERA.PHOTO_FREE] = var_33_3:Find("PhotoFree Controller"),
		[var_0_0.CAMERA.POV] = var_33_3:Find("FP Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))
	}
	arg_33_0.compDolly = arg_33_0.cameraAim:GetCinemachineComponent(Cinemachine.CinemachineCore.Stage.Body)
	arg_33_0.compPovAim = arg_33_0.cameras[var_0_0.CAMERA.POV]:GetCinemachineComponent(Cinemachine.CinemachineCore.Stage.Aim)
	arg_33_0.cameraRoot = var_33_3
	arg_33_0.POVOriginalFOV = arg_33_0:GetPOVFOV()
	arg_33_0.restrictedBox = GameObject.Find("RestrictedArea").transform

	setActive(arg_33_0.restrictedBox, false)

	arg_33_0.restrictedHeightRange = {
		arg_33_0.restrictedBox:Find("Floor").position.y,
		arg_33_0.restrictedBox:Find("Celling").position.y
	}
	arg_33_0.ladyInterest = GameObject.Find("InterestProxy").transform
	arg_33_0.daynightCtrlComp = GameObject.Find("[MainBlock]").transform:GetComponent(typeof(DayNightCtrl))

	arg_33_0:SwitchDayNight(arg_33_0.contextData.timeIndex)

	arg_33_0.tfCutIn = getSceneRootTFDic(SceneManager.GetSceneByName(var_33_0 .. "_base")).CutIn

	if arg_33_0.tfCutIn then
		arg_33_0.modelCutIn = {
			lady = arg_33_0.tfCutIn:Find("lady"):GetChild(0),
			player = arg_33_0.tfCutIn:Find("player"):GetChild(0)
		}

		setActive(arg_33_0.tfCutIn, false)
	end
end

function var_0_0.SwitchDayNight(arg_36_0, arg_36_1)
	if not IsNil(arg_36_0.daynightCtrlComp) then
		arg_36_0.daynightCtrlComp:SwitcherToIndex(arg_36_1 - 1)
	end

	arg_36_0:InitLightSettings()
end

function var_0_0.InitLightSettings(arg_37_0)
	arg_37_0.globalVolume = GameObject.Find("GlobalVolume")

	arg_37_0:RegisterGlobalVolume()

	arg_37_0.characterLight = GameObject.Find("CharacterLight")

	arg_37_0:RecordCharacterLight()

	local var_37_0 = GameObject.Find("[Lighting]").transform

	table.IpairsCArray(var_37_0:GetComponentsInChildren(typeof(Light), true), function(arg_38_0, arg_38_1)
		arg_38_1.shadows = UnityEngine.LightShadows.None
	end)
end

function var_0_0.ResetSceneStructure(arg_39_0, arg_39_1)
	table.IpairsCArray(arg_39_1:GetRootGameObjects(), function(arg_40_0, arg_40_1)
		if arg_40_1.name == "Furnitures" then
			arg_39_0.furnitures = tf(arg_40_1)

			eachChild(arg_39_0.furnitures, function(arg_41_0)
				if arg_41_0:Find("FreeLook Camera") then
					setActive(arg_41_0:Find("FreeLook Camera"), false)
				end

				if arg_41_0:Find("FreeLook Camera") then
					setActive(arg_41_0:Find("RoleWatch Camera"), false)
				end

				if arg_41_0:Find("IKCamera") then
					setActive(arg_41_0:Find("IKCamera"), false)
				end

				local var_41_0 = arg_41_0:GetComponent(typeof(UnityEngine.Collider))

				if not var_41_0 then
					return
				end

				var_41_0.enabled = false
			end)
		end
	end)

	arg_39_0.sectorsDic = arg_39_0.sectorsDic or {}

	if not arg_39_0.sectorsDic[arg_39_1.name] then
		arg_39_0.sectorsDic[arg_39_1.name] = table.shallowCopy(var_0_2[arg_39_1.name])

		setmetatable(arg_39_0.sectorsDic[arg_39_1.name], {
			__index = function(arg_42_0, arg_42_1)
				local var_42_0 = arg_39_0.furnitures:Find(arg_42_1 .. "/StayPoint")

				if var_42_0 then
					local var_42_1 = var_42_0.position
					local var_42_2 = var_42_0.eulerAngles

					arg_42_0[arg_42_1] = {
						Radius = 2,
						Angle = 120,
						Position = {
							var_42_1.x,
							var_42_1.y,
							var_42_1.z
						},
						Rotation = {
							var_42_2.x,
							var_42_2.y,
							var_42_2.z
						}
					}

					return arg_42_0[arg_42_1]
				else
					return nil
				end
			end
		})
	end

	arg_39_0.activeSectors = arg_39_0.sectorsDic[arg_39_1.name]
end

function var_0_0.InitSlots(arg_43_0)
	local var_43_0 = arg_43_0.room:GetSlots()
	local var_43_1 = arg_43_0.modelRoot:GetComponentsInChildren(typeof(Transform), true)

	arg_43_0.slotDict = {}

	_.each(var_43_0, function(arg_44_0)
		local var_44_0 = arg_44_0:GetFurnitureName()
		local var_44_1 = arg_44_0:GetConfigID()
		local var_44_2 = arg_43_0.slotRoot:Find(tostring(var_44_1))

		assert(var_44_2)

		local var_44_3 = {
			trans = var_44_2
		}
		local var_44_4 = var_44_2:Find("Selector")

		if var_44_4 then
			GetOrAddComponent(var_44_4, typeof(EventTriggerListener)):AddPointClickFunc(function(arg_45_0, arg_45_1)
				arg_43_0:emit(Dorm3dRoomMediator.ON_CLICK_FURNITURE_SLOT, var_44_1)
			end)
			setActive(var_44_4, false)
		end

		local var_44_5

		for iter_44_0 = 0, var_43_1.Length - 1 do
			local var_44_6 = var_43_1[iter_44_0]

			if var_44_6.name == var_44_0 then
				var_44_5 = var_44_6

				break
			end
		end

		if var_44_5 then
			var_44_3.model = var_44_5
		end

		arg_43_0.slotDict[var_44_1] = var_44_3
	end)
end

function var_0_0.SetContactStateDic(arg_46_0, arg_46_1)
	arg_46_0.contactStateDic = arg_46_1
	arg_46_0.hideContactStateDic = {}
	arg_46_0.contactInRangeDic = {}

	for iter_46_0, iter_46_1 in pairs(arg_46_0.contactStateDic) do
		arg_46_0.hideContactStateDic[iter_46_0] = math.min(iter_46_1, ApartmentRoom.ITEM_UNLOCK)
		arg_46_0.contactInRangeDic[iter_46_0] = false
	end

	arg_46_0:ActiveContact()
end

function var_0_0.TempHideContact(arg_47_0, arg_47_1)
	arg_47_0.hideConcatFlag = arg_47_1

	arg_47_0:ActiveContact()
end

function var_0_0.ActiveContact(arg_48_0)
	for iter_48_0, iter_48_1 in pairs(arg_48_0.contactInRangeDic) do
		arg_48_0:UpdateContactDisplay(iter_48_0, arg_48_0.contactInRangeDic[iter_48_0] and not arg_48_0.hideConcatFlag and arg_48_0.contactStateDic[iter_48_0] or arg_48_0.hideContactStateDic[iter_48_0])
	end
end

function var_0_0.UpdateContactDisplay(arg_49_0, arg_49_1, arg_49_2)
	local var_49_0 = pg.dorm3d_collection_template[arg_49_1]

	for iter_49_0, iter_49_1 in ipairs(var_49_0.vfx_prefab) do
		local var_49_1 = arg_49_0.modelRoot:Find(iter_49_1)

		if arg_49_0:IsModeInHidePending(iter_49_1) then
			-- block empty
		elseif not arg_49_0.modelRoot:Find(iter_49_1) then
			warning(arg_49_1, iter_49_1)
		else
			setActive(var_49_1, arg_49_2 == ApartmentRoom.ITEM_FIRST)
		end
	end

	for iter_49_2, iter_49_3 in ipairs(var_49_0.model) do
		if arg_49_0:IsModeInHidePending(iter_49_3) then
			-- block empty
		elseif not arg_49_0.modelRoot:Find(iter_49_3) then
			warning(arg_49_1, iter_49_3)
		else
			local var_49_2 = arg_49_0.modelRoot:Find(iter_49_3)
			local var_49_3 = GetComponent(var_49_2, typeof(EventTriggerListener))

			if arg_49_2 == ApartmentRoom.ITEM_FIRST then
				var_49_3 = var_49_3 or GetOrAddComponent(var_49_2, typeof(EventTriggerListener))

				var_49_3:AddPointClickFunc(function(arg_50_0, arg_50_1)
					arg_49_0:emit(var_0_0.CLICK_CONTACT, arg_49_1)
				end)

				var_49_3.enabled = true
			elseif var_49_3 then
				var_49_3.enabled = false
			end

			setActive(var_49_2, arg_49_2 > ApartmentRoom.ITEM_LOCK)
		end
	end
end

function var_0_0.SetFloatEnable(arg_51_0, arg_51_1)
	arg_51_0.enableFloatUpdate = arg_51_1

	if arg_51_1 then
		arg_51_0.ladyDict[arg_51_0.apartment:GetConfigID()]:UpdateFloatPosition()
	end
end

function var_0_0.UpdateFloatPosition(arg_52_0)
	local var_52_0 = arg_52_0:GetScreenPosition(arg_52_0.ladyHeadCenter.position + Vector3(0, 0.2, 0))
	local var_52_1 = arg_52_0:GetLocalPosition(var_52_0, arg_52_0.rtFloatPage)

	setLocalPosition(arg_52_0.rtFloatPage:Find("lady"), var_52_1)
end

function var_0_0.LoadCharacter(arg_53_0, arg_53_1, arg_53_2)
	arg_53_0.hxMatDict = {}
	arg_53_0.ladyDict = {}
	arg_53_0.skinDict = {}

	local var_53_0 = {}

	for iter_53_0, iter_53_1 in ipairs(arg_53_1) do
		local var_53_1 = setmetatable({}, {
			__index = arg_53_0
		})

		arg_53_0.ladyDict[iter_53_1] = var_53_1

		local var_53_2 = getProxy(ApartmentProxy):getApartment(iter_53_1)
		local var_53_3 = var_53_2:getConfig("asset_name")
		local var_53_4 = var_53_2:GetSkinModelID(arg_53_0.room:getConfig("tag"))
		local var_53_5 = pg.dorm3d_resource[var_53_4].model_id

		assert(var_53_5)

		for iter_53_2, iter_53_3 in ipairs({
			"common",
			var_53_5
		}) do
			local var_53_6 = string.format("dorm3d/character/%s/res/%s", var_53_3, iter_53_3)

			if checkABExist(var_53_6) then
				table.insert(var_53_0, function(arg_54_0)
					arg_53_0.loader:LoadBundle(var_53_6, function(arg_55_0)
						for iter_55_0, iter_55_1 in ipairs(arg_55_0:GetAllAssetNames()) do
							local var_55_0, var_55_1, var_55_2 = string.find(iter_55_1, "material_hx[/\\](.*).mat")

							if var_55_0 then
								arg_53_0.hxMatDict[var_55_2] = {
									arg_55_0,
									iter_55_1
								}
							end
						end

						arg_54_0()
					end)
				end)
			end
		end

		var_53_1.skinId = var_53_4
		var_53_1.skinIdList = {
			var_53_4
		}

		table.insert(var_53_0, function(arg_56_0)
			local var_56_0 = string.format("dorm3d/character/%s/prefabs/%s", var_53_3, var_53_5)

			arg_53_0.loader:GetPrefab(var_56_0, "", function(arg_57_0)
				var_53_1.ladyGameobject = arg_57_0
				arg_53_0.skinDict[var_53_4] = {
					ladyGameobject = arg_57_0
				}

				arg_56_0()
			end)
		end)

		if arg_53_0.room:isPersonalRoom() then
			local var_53_7 = var_53_2:GetSkinModelID("touch")

			if var_53_7 then
				table.insert(var_53_1.skinIdList, var_53_7)

				local var_53_8 = pg.dorm3d_resource[var_53_7].model_id

				table.insert(var_53_0, function(arg_58_0)
					local var_58_0 = string.format("dorm3d/character/%s/prefabs/%s", var_53_3, var_53_8)

					arg_53_0.loader:GetPrefab(var_58_0, "", function(arg_59_0)
						arg_53_0.skinDict[var_53_7] = {
							ladyGameobject = arg_59_0
						}
						GetComponent(arg_59_0, "GraphOwner").enabled = false

						onNextTick(function()
							setActive(arg_59_0, false)
						end)
						arg_58_0()
					end)
				end)
			end
		end

		if arg_53_0.contextData.pendingDic[iter_53_1] then
			local var_53_9 = pg.dorm3d_welcome[arg_53_0.contextData.pendingDic[iter_53_1]]

			if var_53_9.item_prefab ~= "" then
				table.insert(var_53_0, function(arg_61_0)
					local var_61_0 = string.lower("dorm3d/furniture/item/" .. var_53_9.item_prefab)

					arg_53_0.loader:GetPrefab(var_61_0, "", function(arg_62_0)
						var_53_1.tfPendintItem = arg_62_0.transform

						onNextTick(function()
							setActive(arg_62_0, false)
						end)
						arg_61_0()
					end)
				end)
			end
		end
	end

	parallelAsync(var_53_0, arg_53_2)
end

function var_0_0.HXCharacter(arg_64_0, arg_64_1)
	if not HXSet.isHx() then
		return
	end

	local var_64_0 = arg_64_1:GetComponentsInChildren(typeof(SkinnedMeshRenderer), true)

	table.IpairsCArray(var_64_0, function(arg_65_0, arg_65_1)
		local var_65_0 = arg_65_1.sharedMaterials
		local var_65_1 = false

		table.IpairsCArray(var_65_0, function(arg_66_0, arg_66_1)
			local var_66_0 = arg_66_1.name

			if not arg_64_0.hxMatDict[var_66_0] then
				return
			end

			var_65_1 = true

			local var_66_1, var_66_2 = unpack(arg_64_0.hxMatDict[var_66_0])
			local var_66_3 = var_66_1:LoadAssetSync(var_66_2, typeof(Material), false, false)

			var_65_0[arg_66_0] = var_66_3

			warning("Replace HX Material", arg_64_0.hxMatDict[var_66_0][2])
		end)

		if var_65_1 then
			arg_65_1.sharedMaterials = var_65_0
		end
	end)
end

function var_0_0.InitCharacter(arg_67_0, arg_67_1, arg_67_2)
	arg_67_1.lady = arg_67_1.ladyGameobject.transform

	arg_67_1.lady:SetParent(arg_67_0.mainCameraTF)
	arg_67_1.lady:SetParent(nil)

	arg_67_1.ladyHeadIKComp = arg_67_1.lady:GetComponent(typeof(HeadAimIK))
	arg_67_1.ladyHeadIKComp.AimTarget = arg_67_0.mainCameraTF:Find("AimTarget")
	arg_67_1.ladyHeadIKData = {
		DampTime = arg_67_1.ladyHeadIKComp.DampTime,
		blinkSpeed = arg_67_1.ladyHeadIKComp.blinkSpeed,
		BodyWeight = arg_67_1.ladyHeadIKComp.BodyWeight,
		HeadWeight = arg_67_1.ladyHeadIKComp.HeadWeight
	}

	local var_67_0 = {}

	table.Foreach(var_0_1, function(arg_68_0, arg_68_1)
		var_67_0[arg_68_1] = arg_68_0
	end)

	arg_67_1.ladyAnimator = arg_67_1.lady:GetComponent(typeof(Animator))
	arg_67_1.ladyAnimBaseLayerIndex = arg_67_1.ladyAnimator:GetLayerIndex("Base Layer")
	arg_67_1.ladyAnimFaceLayerIndex = arg_67_1.ladyAnimator:GetLayerIndex("Face")
	arg_67_1.ladyBoneMaps = {}

	local var_67_1 = arg_67_1.lady:GetComponentsInChildren(typeof(Transform), true)

	table.IpairsCArray(var_67_1, function(arg_69_0, arg_69_1)
		if arg_69_1.name == "BodyCollider" then
			arg_67_1.ladyCollider = arg_69_1
		elseif arg_69_1.name == "Interest" then
			arg_67_1.ladyInterestRoot = arg_69_1
		elseif arg_69_1.name == "Head Center" then
			arg_67_1.ladyHeadCenter = arg_69_1
		end

		if var_67_0[arg_69_1.name] then
			arg_67_1.ladyBoneMaps[var_67_0[arg_69_1.name]] = arg_69_1
		end
	end)

	arg_67_1.ladyColliders = {}
	arg_67_1.ladyTouchColliders = {}

	table.IpairsCArray(arg_67_1.lady:GetComponentsInChildren(typeof(UnityEngine.Collider), true), function(arg_70_0, arg_70_1)
		if arg_70_1:GetType():Equals(typeof(UnityEngine.MeshCollider)) then
			return
		end

		child = tf(arg_70_1)

		local var_70_0 = child.name
		local var_70_1 = var_70_0 and string.find(var_70_0, "Collider") or -1

		if var_70_1 <= 0 then
			errorMsg("Wrong Name to lady Collider : " .. var_70_0)

			return
		end

		local var_70_2 = string.sub(var_70_0, 1, var_70_1 - 1)

		if var_0_0.BONE_TO_TOUCH[var_70_2] == nil then
			return
		end

		arg_67_1.ladyColliders[var_70_2] = child

		table.insert(arg_67_0.ladyTouchColliders, child)
		setActive(child, false)
	end)
	arg_67_0:HXCharacter(arg_67_1.lady)
	;(function()
		local var_71_0 = "dorm3d/effect/prefab/function/vfx_function_aixin02"
		local var_71_1 = "vfx_function_aixin02"

		arg_67_0.loader:GetPrefab(var_71_0, var_71_1, function(arg_72_0)
			arg_67_1.effectHeart = arg_72_0

			setActive(arg_72_0, false)
			onNextTick(function()
				setParent(arg_67_1.effectHeart, arg_67_1.ladyHeadCenter)
			end)
		end)
	end)()

	arg_67_1.clothComps = {}
	arg_67_1.ladyClothCompSettings = {}

	table.IpairsCArray(arg_67_1.lady:GetComponentsInChildren(typeof("MagicaCloth.BaseCloth"), true), function(arg_74_0, arg_74_1)
		table.insert(arg_67_1.clothComps, arg_74_1)

		arg_67_1.ladyClothCompSettings[arg_74_1] = {
			enabled = arg_74_1.enabled
		}
	end)

	arg_67_1.clothColliderDict = {}
	arg_67_1.ladyClothColliderSettings = {}

	local var_67_2 = typeof("MagicaCloth.MagicaCapsuleCollider")

	table.IpairsCArray(arg_67_1.lady:GetComponentsInChildren(var_67_2, true), function(arg_75_0, arg_75_1)
		arg_67_1.clothColliderDict[arg_75_1.name] = arg_75_1
		arg_67_1.ladyClothColliderSettings[arg_75_1] = {
			enabled = arg_75_1.enabled,
			StartRadius = ReflectionHelp.RefGetProperty(var_67_2, "StartRadius", arg_75_1),
			EndRadius = ReflectionHelp.RefGetProperty(var_67_2, "EndRadius", arg_75_1)
		}
	end)
	arg_67_1:EnableCloth(arg_67_1, false)

	arg_67_1.ladyIKRoot = arg_67_1.lady:Find("IKLayers")

	eachChild(arg_67_1.ladyIKRoot, function(arg_76_0)
		setActive(arg_76_0, false)
	end)
	GetComponent(arg_67_1.lady, typeof(EventTriggerListener)):AddPointClickFunc(function(arg_77_0, arg_77_1)
		if arg_77_1.rawPointerPress.transform == arg_67_1.ladyCollider then
			arg_67_1:emit(var_0_0.CLICK_CHARACTER, arg_67_2)
		else
			local var_77_0 = table.keyof(arg_67_1.ladyColliders, arg_77_1.rawPointerPress.transform)

			arg_67_1:emit(var_0_0.ON_TOUCH_CHARACTER, var_0_0.BONE_TO_TOUCH[var_77_0] or arg_77_1.rawPointerPress.name)
		end
	end)
	arg_67_1.ladyAnimator:GetComponent("DftAniEvent"):SetCommonEvent(function(arg_78_0)
		if arg_67_1.nowState and arg_78_0.animatorStateInfo:IsName(arg_67_1.nowState) then
			existCall(arg_67_1.stateCallback)

			return
		end

		local var_78_0 = arg_78_0.animatorStateInfo

		for iter_78_0, iter_78_1 in pairs(arg_67_1.animCallbacks) do
			if var_78_0:IsName(iter_78_0) then
				warning("Active", iter_78_0)

				local var_78_1 = table.removebykey(arg_67_1.animCallbacks, iter_78_0)

				existCall(var_78_1)

				return
			end
		end

		if arg_78_0.stringParameter ~= "" then
			arg_67_0:OnAnimationEvent(arg_78_0)
		end
	end)

	arg_67_1.animEventCallbacks = {}
	arg_67_1.animCallbacks = {}
end

function var_0_0.SwitchCharacterSkin(arg_79_0, arg_79_1, arg_79_2, arg_79_3)
	local var_79_0 = arg_79_0.skinIdList

	assert(table.contains(var_79_0, arg_79_2))

	local var_79_1 = arg_79_0:GetCurrentAnim()
	local var_79_2 = arg_79_0.skinId
	local var_79_3 = arg_79_0.skinDict[var_79_2].ladyGameobject
	local var_79_4 = var_79_3.transform.position
	local var_79_5 = var_79_3.transform.rotation

	setActive(var_79_3, false)

	arg_79_0.skinId = arg_79_2

	setActive(arg_79_0.skinDict[arg_79_2].ladyGameobject, true)

	arg_79_0.ladyGameobject = arg_79_0.skinDict[arg_79_2].ladyGameobject
	arg_79_0.ladyCollider = nil

	arg_79_0:InitCharacter(arg_79_0, arg_79_1)
	arg_79_0.ladyAnimator:Play(var_79_1, arg_79_0.ladyAnimBaseLayerIndex)
	arg_79_0.ladyAnimator:Update(0)
	arg_79_0.lady:SetPositionAndRotation(var_79_4, var_79_5)
	existCall(arg_79_3)
end

function var_0_0.SetCameraLady(arg_80_0)
	arg_80_0.cameraAim2.LookAt = arg_80_0.ladyInterestRoot
	arg_80_0.cameraTalk.Follow = arg_80_0.ladyInterestRoot
	arg_80_0.cameraTalk.LookAt = arg_80_0.ladyInterestRoot
	arg_80_0.cameraGift.Follow = arg_80_0.ladyInterest
	arg_80_0.cameraGift.LookAt = arg_80_0.ladyInterest
	arg_80_0.cameraRole2.LookAt = arg_80_0.ladyInterestRoot
	arg_80_0.cameras[var_0_0.CAMERA.PHOTO].Follow = arg_80_0.ladyInterest
	arg_80_0.cameras[var_0_0.CAMERA.PHOTO].LookAt = arg_80_0.ladyInterest
end

function var_0_0.initNodeCanvas(arg_81_0)
	local var_81_0 = pg.NodeCanvasMgr.GetInstance()

	var_81_0:Active()
	var_81_0:RegisterFunc("DistanceTrigger", function(arg_82_0)
		arg_81_0:emit(var_0_0.DISTANCE_TRIGGER, arg_82_0, arg_81_0.ladyDict[arg_82_0].dis)
	end)
	var_81_0:RegisterFunc("ShortWaitAction", function(arg_83_0)
		arg_81_0:DoShortWait(arg_83_0)
	end)
	var_81_0:RegisterFunc("WatchShortWaitAction", function(arg_84_0)
		arg_81_0:DoShortWait(arg_84_0)
	end)
	var_81_0:RegisterFunc("WalkDistanceTrigger", function(arg_85_0)
		arg_81_0:emit(var_0_0.WALK_DISTANCE_TRIGGER, arg_85_0, arg_81_0.ladyDict[arg_85_0].dis)
	end)
	var_81_0:RegisterFunc("ChangeWatch", function(arg_86_0)
		arg_81_0:emit(var_0_0.CHANGE_WATCH, arg_86_0)
	end)
end

function var_0_0.SetAllBlackbloardValue(arg_87_0, arg_87_1, arg_87_2)
	arg_87_0[arg_87_1] = arg_87_2

	for iter_87_0, iter_87_1 in pairs(arg_87_0.ladyDict) do
		iter_87_1:SetBlackboardValue(arg_87_1, arg_87_2)
	end
end

function var_0_0.SetBlackboardValue(arg_88_0, arg_88_1, arg_88_2)
	arg_88_0.blackboard = arg_88_0.blackboard or {}
	arg_88_0.blackboard[arg_88_1] = arg_88_2

	pg.NodeCanvasMgr.GetInstance():SetBlackboradValue(arg_88_1, arg_88_2, arg_88_0.ladyBlackboard)
end

function var_0_0.GetBlackboardValue(arg_89_0, arg_89_1)
	arg_89_0.blackboard = arg_89_0.blackboard or {}

	return arg_89_0.blackboard[arg_89_1]
end

function var_0_0.didEnter(arg_90_0)
	local var_90_0 = -21.6 / Screen.height

	arg_90_0.joystickDelta = Vector2.zero
	arg_90_0.joystickTimer = FrameTimer.New(function()
		local var_91_0 = arg_90_0.joystickDelta * var_90_0
		local var_91_1 = var_91_0.x
		local var_91_2 = var_91_0.y

		local function var_91_3(arg_92_0, arg_92_1, arg_92_2)
			local var_92_0 = arg_92_0[arg_92_1]

			var_92_0.m_InputAxisValue = arg_92_2
			arg_92_0[arg_92_1] = var_92_0
		end

		if arg_90_0.surroudCamera and not arg_90_0.pinchMode then
			var_91_3(arg_90_0.surroudCamera, "m_XAxis", var_91_1)
			var_91_3(arg_90_0.surroudCamera, "m_YAxis", var_91_2)

			if arg_90_0.surroudCamera == arg_90_0.cameraRoleWatch then
				if var_91_1 ~= 0 then
					local var_91_4 = arg_90_0.cameraRoleWatch.m_XAxis

					if not var_91_4.m_Wrap then
						local var_91_5 = var_91_1 * (var_91_4.m_InvertInput and -1 or 1)

						if var_91_5 < 0 and var_91_4.Value - 0.01 < var_91_4.m_MinValue then
							arg_90_0:emit(var_0_0.ON_ROLEWATCH_CAMERA_MAX, var_0_0.CAMERA_MAX_OPERATION.RIGHT)
						elseif var_91_5 > 0 and var_91_4.Value + 0.01 > var_91_4.m_MaxValue then
							arg_90_0:emit(var_0_0.ON_ROLEWATCH_CAMERA_MAX, var_0_0.CAMERA_MAX_OPERATION.LEFT)
						end
					end
				end

				if var_91_2 ~= 0 then
					local var_91_6 = arg_90_0.cameraRoleWatch.m_YAxis

					if not var_91_6.m_Wrap then
						if var_91_2 < 0 and var_91_6.Value - 0.01 < var_91_6.m_MinValue then
							arg_90_0:emit(var_0_0.ON_ROLEWATCH_CAMERA_MAX, var_0_0.CAMERA_MAX_OPERATION.DOWN)
						elseif var_91_2 > 0 and var_91_6.Value + 0.01 > var_91_6.m_MaxValue then
							arg_90_0:emit(var_0_0.ON_ROLEWATCH_CAMERA_MAX, var_0_0.CAMERA_MAX_OPERATION.UP)
						end
					end
				end
			end
		end

		arg_90_0.joystickDelta = Vector2.zero
	end, 1, -1)

	arg_90_0.joystickTimer:Start()

	local var_90_1 = 1.75

	arg_90_0.moveStickTimer = FrameTimer.New(function()
		if not arg_90_0.moveStickDraging then
			return
		end

		local var_93_0 = arg_90_0.moveStickPosition
		local var_93_1 = 200
		local var_93_2 = (var_93_0 - arg_90_0.moveStickOrigin):ClampMagnitude(var_93_1)
		local var_93_3 = var_93_2 / var_93_1

		arg_90_0.moveStickPosition = arg_90_0.moveStickOrigin + var_93_2

		local var_93_4 = Vector3.New(var_93_3.x, 0, var_93_3.y)
		local var_93_5 = arg_90_0.mainCameraTF:TransformDirection(var_93_4)

		var_93_5.y = 0

		local var_93_6 = var_93_5:Normalize()

		var_93_6:Mul(var_90_1)

		if isActive(arg_90_0.cameras[var_0_0.CAMERA.POV]) then
			arg_90_0.playerController:SimpleMove(var_93_6)

			arg_90_0.tweenFOV = true
		elseif isActive(arg_90_0.cameras[var_0_0.CAMERA.PHOTO_FREE]) then
			arg_90_0.cameras[var_0_0.CAMERA.PHOTO_FREE]:GetComponent(typeof(UnityEngine.CharacterController)):Move(var_93_6 * Time.deltaTime)
			arg_90_0:emit(Dorm3dPhotoMediator.CAMERA_STICK_MOVE, var_93_3:Normalize())
			onNextTick(function()
				local var_94_0 = arg_90_0.cameras[var_0_0.CAMERA.PHOTO_FREE]
				local var_94_1 = math.InverseLerp(arg_90_0.restrictedHeightRange[1], arg_90_0.restrictedHeightRange[2], var_94_0.position.y)

				arg_90_0:emit(Dorm3dPhotoMediator.CAMERA_LIFT_CHANGED, var_94_1)
			end)
		end
	end, 1, -1)

	arg_90_0.moveStickTimer:Start()

	arg_90_0.pinchMode = false
	arg_90_0.pinchSize = 0
	arg_90_0.pinchValue = 1
	arg_90_0.pinchNodeOrder = 1

	GlobalClickEventMgr.Inst:AddBeginPinchFunc(function(arg_95_0, arg_95_1)
		if arg_90_0.surroudCamera and isActive(arg_90_0.surroudCamera) then
			arg_90_0.pinchMode = true
			arg_90_0.pinchSize = (arg_95_0 - arg_95_1):Magnitude()
			arg_90_0.pinchNodeOrder = arg_95_1.x < arg_95_0.x and -1 or 1

			return
		end

		if isActive(arg_90_0.cameras[var_0_0.CAMERA.POV]) then
			if (arg_95_0 - arg_95_1):Magnitude() < Screen.height * 0.5 then
				arg_90_0.pinchMode = true
				arg_90_0.pinchSize = (arg_95_0 - arg_95_1):Magnitude()
				arg_90_0.pinchNodeOrder = arg_95_1.x < arg_95_0.x and -1 or 1
			end

			return
		end
	end)

	local var_90_2 = 0.01

	if IsUnityEditor then
		var_90_2 = 0.1
	end

	local var_90_3 = var_90_2 * 1080 / Screen.height

	GlobalClickEventMgr.Inst:AddPinchFunc(function(arg_96_0, arg_96_1)
		if not arg_90_0.pinchMode then
			return
		end

		local var_96_0 = (arg_96_0 - arg_96_1):Magnitude()
		local var_96_1 = arg_90_0.pinchSize - var_96_0
		local var_96_2 = arg_90_0.pinchNodeOrder * (arg_96_1.x < arg_96_0.x and -1 or 1)
		local var_96_3 = var_96_1 * var_90_3 * var_96_2

		if isActive(arg_90_0.cameras[var_0_0.CAMERA.POV]) then
			local var_96_4 = 0.5
			local var_96_5 = 1

			arg_90_0.pinchValue = math.clamp(arg_90_0.pinchValue + var_96_3, var_96_4, var_96_5)
			arg_90_0.pinchSize = var_96_0

			arg_90_0:SetPOVFOV(arg_90_0.POVOriginalFOV * arg_90_0.pinchValue)

			arg_90_0.tweenFOV = nil

			return
		end

		if isActive(arg_90_0.surroudCamera) and arg_90_0.surroudCamera == arg_90_0.cameras[var_0_0.CAMERA.PHOTO] then
			local var_96_6 = 0.5
			local var_96_7 = 1

			arg_90_0:SetPinchValue(math.clamp(arg_90_0.pinchValue + var_96_3, var_96_6, var_96_7))

			arg_90_0.pinchSize = var_96_0

			return
		end
	end)
	GlobalClickEventMgr.Inst:AddEndPinchFunc(function()
		arg_90_0.pinchMode = false
		arg_90_0.pinchSize = 0
	end)

	arg_90_0.cameraBlendCallbacks = {}
	arg_90_0.activeCMCamera = nil

	function arg_90_0.camBrainEvenetHandler.OnBlendStarted(arg_98_0)
		if arg_90_0.activeCMCamera then
			arg_90_0:OnCameraBlendFinished(arg_90_0.activeCMCamera)
		end

		local var_98_0 = arg_90_0.camBrain.ActiveVirtualCamera

		arg_90_0.activeCMCamera = var_98_0
	end

	function arg_90_0.camBrainEvenetHandler.OnBlendFinished(arg_99_0)
		arg_90_0.activeCMCamera = nil

		arg_90_0:OnCameraBlendFinished(arg_99_0)
	end

	for iter_90_0, iter_90_1 in pairs(arg_90_0.ladyDict) do
		(function(arg_100_0, arg_100_1)
			if arg_100_0.tfPendintItem then
				onNextTick(function()
					setParent(arg_100_0.tfPendintItem, arg_100_0.lady)
				end)
			end

			arg_100_0.ladyOwner = GetComponent(arg_100_0.lady, "GraphOwner")
			arg_100_0.ladyBlackboard = GetComponent(arg_100_0.lady, "Blackboard")

			arg_100_0:SetBlackboardValue("groupId", arg_100_1)
			onNextTick(function()
				arg_100_0.ladyOwner.enabled = true
			end)
		end)(iter_90_1, iter_90_0)
	end

	arg_90_0.expressionDict = {}

	pg.UIMgr.GetInstance():OverlayPanel(arg_90_0.blockLayer, {
		weight = LayerWeightConst.SECOND_LAYER,
		groupName = LayerWeightConst.GROUP_DORM3D
	})
	arg_90_0:ActiveCamera(arg_90_0.cameras[var_0_0.CAMERA.POV])
	arg_90_0:RefreshSlots()

	arg_90_0.updateHandler = UpdateBeat:CreateListener(function()
		xpcall(function()
			arg_90_0:Update()
		end, function(...)
			errorMsg(debug.traceback(...))
		end)
	end)

	UpdateBeat:AddListener(arg_90_0.updateHandler)
end

function var_0_0.InitData(arg_106_0)
	if not arg_106_0.contextData.ladyZone then
		arg_106_0.contextData.ladyZone = {}

		local var_106_0
		local var_106_1 = arg_106_0.room:getConfig("default_zone")

		for iter_106_0, iter_106_1 in ipairs(arg_106_0.contextData.groupIds) do
			for iter_106_2, iter_106_3 in ipairs(var_106_1) do
				if iter_106_3[1] == iter_106_1 then
					arg_106_0.contextData.ladyZone[iter_106_1] = iter_106_3[2]

					break
				end
			end

			assert(arg_106_0.contextData.ladyZone[iter_106_1])

			var_106_0 = var_106_0 or arg_106_0.contextData.ladyZone[iter_106_1]
		end

		arg_106_0.contextData.inFurnitureName = var_106_0 or arg_106_0.room:getConfig("default_zone")[1][2]
	end

	arg_106_0.zoneDatas = _.select(arg_106_0.room:GetZones(), function(arg_107_0)
		return not arg_107_0:IsGlobal()
	end)
	arg_106_0.readyIKLayers = {}
	arg_106_0.activeIKLayers = {}
	arg_106_0.holdingStatus = {}
	arg_106_0.cacheIKInfos = {}
	arg_106_0.activeSectors = {}
	arg_106_0.activeLady = {}
end

function var_0_0.Update(arg_108_0)
	arg_108_0.raycastCamera.fieldOfView = arg_108_0.mainCameraTF:GetComponent(typeof(Camera)).fieldOfView

	if arg_108_0.tweenFOV then
		local var_108_0 = Damp(1, 1, Time.deltaTime)

		arg_108_0.pinchValue = Mathf.Lerp(arg_108_0.pinchValue, 1, var_108_0)

		arg_108_0:SetPOVFOV(arg_108_0.POVOriginalFOV * arg_108_0.pinchValue)

		if arg_108_0.pinchValue > 0.99 then
			arg_108_0.tweenFOV = nil
		end
	end

	if isActive(arg_108_0.cameras[var_0_0.CAMERA.POV]) then
		arg_108_0:TriggerLadyDistance()
	end

	if arg_108_0.contactInRangeDic then
		local var_108_1 = arg_108_0.mainCameraTF.forward
		local var_108_2 = arg_108_0.mainCameraTF.position
		local var_108_3 = UnityEngine.Rect.New(0, 0, Screen.width, Screen.height)

		local function var_108_4(arg_109_0, arg_109_1, arg_109_2)
			local var_109_0 = arg_109_0.position - var_108_2
			local var_109_1 = Clone(var_109_0)

			var_109_1.y = 0

			if arg_109_1 < var_109_1.magnitude then
				return false
			end

			local var_109_2 = var_109_0:Normalize()
			local var_109_3 = math.acos(Vector3.Dot(var_109_2, var_108_1)) * math.rad2Deg

			if arg_109_2 < math.abs(var_109_3) then
				return false
			end

			local var_109_4 = arg_108_0.raycastCamera:WorldToScreenPoint(arg_109_0.position)

			if var_109_4.z < 0 then
				return false
			end

			if not var_108_3:Contains(var_109_4) then
				return false
			end

			return true
		end

		for iter_108_0, iter_108_1 in pairs(arg_108_0.contactInRangeDic) do
			local var_108_5 = pg.dorm3d_collection_template[iter_108_0]
			local var_108_6 = underscore.any(var_108_5.vfx_prefab, function(arg_110_0)
				return arg_108_0.modelRoot:Find(arg_110_0) and var_108_4(arg_108_0.modelRoot:Find(arg_110_0), 2, 60)
			end)

			if tobool(iter_108_1) ~= var_108_6 then
				arg_108_0.contactInRangeDic[iter_108_0] = var_108_6

				arg_108_0:UpdateContactDisplay(iter_108_0, var_108_6 and not arg_108_0.hideConcatFlag and arg_108_0.contactStateDic[iter_108_0] or arg_108_0.hideContactStateDic[iter_108_0])
			end
		end
	end

	if arg_108_0.enableFloatUpdate then
		arg_108_0.ladyDict[arg_108_0.apartment:GetConfigID()]:UpdateFloatPosition()
	end

	arg_108_0:CheckInSector()

	if arg_108_0.apartment then
		(function(arg_111_0)
			(function()
				if not arg_111_0.ikHandler then
					return
				end

				if not arg_111_0.ikHandler.targetScreenOffset then
					return
				end

				local var_112_0 = arg_111_0.ikHandler.rect
				local var_112_1 = var_112_0:PointToNormalized(Vector2.zero)
				local var_112_2 = var_112_0:PointToNormalized(arg_111_0.ikHandler.targetScreenOffset) - var_112_1

				_.each(arg_111_0.ikHandler.subPlanes, function(arg_113_0)
					local var_113_0 = arg_113_0.target
					local var_113_1 = arg_113_0.planeData

					var_113_0.position = var_0_0.GetPostionByRatio(var_113_1, var_112_2)
				end)

				if Time.time > arg_111_0.ikNextCheckStamp then
					arg_111_0.ikNextCheckStamp = arg_111_0.ikNextCheckStamp + var_0_0.IK_STATUS_DELTA

					arg_111_0:emit(var_0_0.ON_IK_STATUS_CHANGED, arg_111_0.ikHandler.ikData:GetConfigID(), var_0_0.IK_STATUS.DRAG)
				end

				arg_111_0:ResetIKTipTimer()
			end)()

			if arg_111_0.enableIKTip then
				local var_111_0 = Time.time > arg_111_0.nextTipIKTime
				local var_111_1 = arg_111_0:GetIKTipsRootTF()

				if var_111_0 then
					UIItemList.StaticAlign(var_111_1, var_111_1:GetChild(0), #arg_111_0.readyIKLayers, function(arg_114_0, arg_114_1, arg_114_2)
						if arg_114_0 ~= UIItemList.EventUpdate then
							return
						end

						local var_114_0 = arg_111_0.readyIKLayers[arg_114_1 + 1].ikData
						local var_114_1 = var_114_0:GetTriggerBoneName()
						local var_114_2 = var_114_1 and arg_111_0.ladyColliders[var_114_1] or nil

						if var_114_2 and not (function()
							local var_115_0 = arg_111_0.raycastCamera:WorldToScreenPoint(var_114_2.position)
							local var_115_1 = CameraMgr.instance:Raycast(arg_111_0.sceneRaycaster, var_115_0)

							if var_115_1.Length == 0 then
								return
							end

							return var_114_2 == var_115_1[0].gameObject.transform
						end)() then
							var_114_2 = nil
						end

						if var_114_2 then
							setLocalPosition(arg_114_2, arg_111_0:GetLocalPosition(arg_111_0:GetScreenPosition(var_114_2.position), var_111_1) + var_114_0:GetIKTipOffset())
						end

						setActive(arg_114_2, var_114_2)
					end)
				end

				setActive(var_111_1, var_111_0)
			end

			if arg_111_0.ikRevertHandler then
				arg_111_0.ikRevertHandler()
			end
		end)(arg_108_0.ladyDict[arg_108_0.apartment:GetConfigID()])
	end
end

function var_0_0.CheckInSector(arg_116_0)
	if not isActive(arg_116_0.cameras[var_0_0.CAMERA.POV]) then
		return
	end

	local var_116_0 = arg_116_0.mainCameraTF.position

	var_116_0.y = 0

	for iter_116_0, iter_116_1 in pairs(arg_116_0.ladyDict) do
		local var_116_1 = tobool(arg_116_0.activeLady[iter_116_0])

		if var_116_1 ~= tobool(var_0_0.IsPointInSector(arg_116_0.activeSectors[iter_116_1.ladyActiveZone], var_116_0)) then
			arg_116_0.activeLady[iter_116_0] = not var_116_1

			arg_116_0:emit(var_0_0.ON_ENTER_SECTOR, iter_116_0)
		end
	end
end

function var_0_0.TriggerLadyDistance(arg_117_0)
	local function var_117_0(arg_118_0, arg_118_1)
		arg_118_0.dis = (arg_118_0.lady.position - arg_118_0.player.position).magnitude

		if (arg_118_0:GetBlackboardValue("inPending") and var_0_0.POV_PENDING_CLOSE_DISTANCE or var_0_0.POV_CLOSE_DISTANCE) > arg_118_0.dis ~= arg_118_0:GetBlackboardValue("inDistance") then
			arg_118_0:SetBlackboardValue("inDistance", arg_118_0.dis < var_0_0.POV_CLOSE_DISTANCE)
			arg_118_0:emit(var_0_0.ON_CHANGE_DISTANCE, arg_118_1, arg_118_0.dis < var_0_0.POV_CLOSE_DISTANCE)
		end
	end

	for iter_117_0, iter_117_1 in pairs(arg_117_0.ladyDict) do
		var_117_0(iter_117_1, iter_117_0)
	end
end

function var_0_0.OnStickMove(arg_119_0, arg_119_1)
	arg_119_0.joystickDelta = arg_119_1
end

function var_0_0.SetPinchValue(arg_120_0, arg_120_1)
	arg_120_0.pinchValue = arg_120_1

	arg_120_0:SetCameraObrits()
end

function var_0_0.GetPOVFOV(arg_121_0)
	local var_121_0 = arg_121_0.cameras[var_0_0.CAMERA.POV].m_Lens

	return ReflectionHelp.RefGetField(typeof("Cinemachine.LensSettings"), "FieldOfView", var_121_0)
end

function var_0_0.SetPOVFOV(arg_122_0, arg_122_1)
	local var_122_0 = arg_122_0.cameras[var_0_0.CAMERA.POV].m_Lens

	ReflectionHelp.RefSetField(typeof("Cinemachine.LensSettings"), "FieldOfView", var_122_0, arg_122_1)

	arg_122_0.cameras[var_0_0.CAMERA.POV].m_Lens = var_122_0
end

function var_0_0.RefreshSlots(arg_123_0, arg_123_1)
	arg_123_1 = arg_123_1 or arg_123_0.room

	local var_123_0 = arg_123_1:GetSlots()
	local var_123_1 = arg_123_1:GetFurnitures()

	arg_123_0:emit(var_0_0.SHOW_BLOCK)
	table.ParallelIpairsAsync(var_123_0, function(arg_124_0, arg_124_1, arg_124_2)
		local var_124_0 = arg_124_1:GetConfigID()
		local var_124_1 = _.detect(var_123_1, function(arg_125_0)
			return arg_125_0:GetSlotID() == var_124_0
		end)
		local var_124_2 = var_124_1 and var_124_1:GetModel() or false
		local var_124_3 = arg_123_0.slotDict[var_124_0].model

		arg_123_0.slotDict[var_124_0].displayModelName = var_124_2

		if var_124_2 == false or var_124_2 == "" then
			arg_123_0.loader:ClearRequest("slot_" .. var_124_0)

			if var_124_3 then
				setActive(var_124_3, var_124_2 == "")
			end

			arg_124_2()

			return
		end

		local var_124_4 = arg_123_0.slotDict[var_124_0].trans

		if arg_123_0.loader:GetLoadingRP("slot_" .. var_124_0) then
			arg_123_0:emit(var_0_0.HIDE_BLOCK)
		end

		arg_123_0.loader:GetPrefabBYStopLoading("dorm3d/furniture/prefabs/" .. var_124_2, "", function(arg_126_0)
			arg_124_2()
			assert(arg_126_0)
			setParent(arg_126_0, var_124_4)

			if var_124_3 then
				local var_126_0 = arg_126_0:GetComponentsInChildren(typeof(Renderer), true)

				table.IpairsCArray(var_126_0, function(arg_127_0, arg_127_1)
					LuaHelper.CopyLightMap(arg_127_1.gameObject, arg_126_0)
				end)
				setActive(var_124_3, false)
			end
		end, "slot_" .. var_124_0)
	end, function()
		arg_123_0:emit(var_0_0.HIDE_BLOCK)
	end)
end

function var_0_0.ChangeCharacterPosition(arg_129_0)
	arg_129_0:ResetCharPoint(arg_129_0.ladyActiveZone)
	arg_129_0:SyncInterestTransform(arg_129_0)
end

function var_0_0.SyncCurrentInterestTransform(arg_130_0)
	local var_130_0 = arg_130_0.ladyDict[arg_130_0.apartment:GetConfigID()]

	arg_130_0:SyncInterestTransform(var_130_0)
end

function var_0_0.SyncInterestTransform(arg_131_0, arg_131_1)
	arg_131_0.ladyInterest.position = arg_131_1.ladyInterestRoot.position
	arg_131_0.ladyInterest.rotation = arg_131_1.ladyInterestRoot.rotation
end

function var_0_0.ChangePlayerPosition(arg_132_0, arg_132_1)
	arg_132_1 = arg_132_1 or arg_132_0.contextData.inFurnitureName

	local var_132_0 = arg_132_0.furnitures:Find(arg_132_1):Find("PlayerPoint").position

	arg_132_0.player.position = var_132_0
	arg_132_0.cameras[var_0_0.CAMERA.POV].transform.position = arg_132_0.playerEye.position

	local var_132_1 = arg_132_0.ladyInterest.position - arg_132_0.playerEye.position
	local var_132_2 = Quaternion.LookRotation(var_132_1).eulerAngles
	local var_132_3 = var_132_2.y
	local var_132_4 = var_132_2.x
	local var_132_5 = arg_132_0.compPovAim.m_HorizontalAxis

	var_132_5.Value = arg_132_0:GetNearestAngle(var_132_3, var_132_5.m_MinValue, var_132_5.m_MaxValue)
	arg_132_0.compPovAim.m_HorizontalAxis = var_132_5

	local var_132_6 = arg_132_0.compPovAim.m_VerticalAxis

	var_132_6.Value = var_132_4
	arg_132_0.compPovAim.m_VerticalAxis = var_132_6
end

function var_0_0.GetAttachedFurnitureName(arg_133_0)
	return arg_133_0.contextData.inFurnitureName
end

function var_0_0.GetFurnitureByName(arg_134_0, arg_134_1)
	return underscore.detect(arg_134_0.attachedPoints, function(arg_135_0)
		return arg_135_0.name == arg_134_1
	end)
end

function var_0_0.GetSlotByID(arg_136_0, arg_136_1)
	return arg_136_0.displaySlots[arg_136_1] and arg_136_0.displaySlots[arg_136_1].trans
end

function var_0_0.GetScreenPosition(arg_137_0, arg_137_1)
	local var_137_0 = arg_137_0.raycastCamera:WorldToScreenPoint(arg_137_1)

	if var_137_0.z < 0 then
		var_137_0.x = var_137_0.x + (var_137_0.x < 0 and -1 or 1) * Screen.width
		var_137_0.y = var_137_0.y + (var_137_0.y < 0 and -1 or 1) * Screen.height
		var_137_0.z = -var_137_0.z
	end

	return var_137_0
end

function var_0_0.GetLocalPosition(arg_138_0, arg_138_1, arg_138_2)
	return LuaHelper.ScreenToLocal(arg_138_2, arg_138_1, pg.UIMgr.GetInstance().uiCameraComp)
end

function var_0_0.GetModelRoot(arg_139_0)
	return arg_139_0.modelRoot
end

function var_0_0.ShiftZone(arg_140_0, arg_140_1, arg_140_2)
	local var_140_0 = arg_140_0:GetFurnitureByName(arg_140_1)

	if not var_140_0 then
		errorMsg(arg_140_1 .. " Not Find")
		existCall(arg_140_2)

		return
	end

	seriesAsync({
		function(arg_141_0)
			arg_140_0:emit(var_0_0.SHOW_BLOCK)
			arg_140_0:ShowBlackScreen(true, arg_141_0)
		end,
		function(arg_142_0)
			if arg_140_0.shiftLady or arg_140_0.room:isPersonalRoom() then
				local var_142_0 = arg_140_0.shiftLady or arg_140_0.apartment:GetConfigID()

				arg_140_0.shiftLady = nil
				arg_140_0.contextData.ladyZone[var_142_0] = var_140_0.name

				local var_142_1 = arg_140_0.ladyDict[var_142_0]

				var_142_1.ladyBaseZone = arg_140_0.contextData.ladyZone[var_142_0]
				var_142_1.ladyActiveZone = arg_140_0.contextData.ladyZone[var_142_0]

				if var_142_1:GetBlackboardValue("inPending") then
					var_142_1:SetOutPending()
					var_142_1:SwitchAnim(var_0_0.ANIM.IDLE)
					onNextTick(function()
						var_142_1:ChangeCharacterPosition()
						arg_142_0()
					end)
				else
					var_142_1:ChangeCharacterPosition()
					arg_142_0()
				end
			else
				arg_142_0()
			end
		end,
		function(arg_144_0)
			arg_140_0.contextData.inFurnitureName = var_140_0.name

			arg_140_0:ChangePlayerPosition()
			arg_140_0:TriggerLadyDistance()
			arg_140_0:CheckInSector()
			arg_144_0()
		end,
		function(arg_145_0)
			arg_140_0:UpdateZoneList()
			arg_140_0:ShowBlackScreen(false, arg_145_0)
		end,
		function(arg_146_0)
			arg_140_0:emit(var_0_0.HIDE_BLOCK)
			arg_146_0()
		end
	}, arg_140_2)
end

function var_0_0.WalkByRootMotionLoop(arg_147_0, arg_147_1, arg_147_2)
	if arg_147_1.pathPending then
		arg_147_2:SetFloat("Speed", 0)

		return
	end

	arg_147_2:SetFloat("Speed", 1)

	local var_147_0 = arg_147_1.path.corners

	if var_147_0.Length > 1 then
		local var_147_1 = var_147_0[1] - arg_147_1.transform.position

		var_147_1.y = 0

		local var_147_2 = Quaternion.LookRotation(var_147_1)
		local var_147_3 = arg_147_1.transform.rotation
		local var_147_4 = 1
		local var_147_5 = Damp(1, var_147_4, Time.deltaTime)

		arg_147_1.transform.rotation = Quaternion.Lerp(var_147_3, var_147_2, var_147_5)
	end
end

function var_0_0.ActiveCamera(arg_148_0, arg_148_1)
	local var_148_0 = isActive(arg_148_1)

	table.Foreach(arg_148_0.cameras, function(arg_149_0, arg_149_1)
		setActive(arg_149_1, arg_149_1 == arg_148_1)
	end)

	if var_148_0 then
		arg_148_0:OnCameraBlendFinished(arg_148_1)
	end
end

function var_0_0.ShowBlackScreen(arg_150_0, arg_150_1, arg_150_2)
	local var_150_0 = arg_150_0.blackSceneInfo or {
		color = "#000000",
		time = 0.3,
		delay = arg_150_1 and 0 or 0.3
	}

	setImageColor(arg_150_0.blackLayer, Color.NewHex(var_150_0.color))
	setActive(arg_150_0.blackLayer, true)
	setCanvasGroupAlpha(arg_150_0.blackLayer, arg_150_1 and 0 or 1)
	arg_150_0:managedTween(LeanTween.alphaCanvas, function()
		if not arg_150_1 then
			setActive(arg_150_0.blackLayer, false)
		end

		existCall(arg_150_2)
	end, GetComponent(arg_150_0.blackLayer, typeof(CanvasGroup)), arg_150_1 and 1 or 0, var_150_0.time):setDelay(var_150_0.delay)
end

function var_0_0.RegisterOrbits(arg_152_0, arg_152_1)
	arg_152_0 = arg_152_0.scene
	arg_152_0.orbits = {
		original = arg_152_1.m_Orbits
	}
	arg_152_0.orbits.current = _.range(3):map(function(arg_153_0)
		local var_153_0 = arg_152_0.orbits.original[arg_153_0 - 1]

		return Cinemachine.CinemachineFreeLook.Orbit.New(var_153_0.m_Height, var_153_0.m_Radius)
	end)
	arg_152_0.surroudCamera = arg_152_1
end

function var_0_0.SetCameraObrits(arg_154_0)
	local var_154_0 = arg_154_0.surroudCamera

	if not var_154_0 then
		return
	end

	local var_154_1 = arg_154_0.orbits.original[1]

	for iter_154_0 = 0, #arg_154_0.orbits.current - 1 do
		local var_154_2 = arg_154_0.orbits.current[iter_154_0 + 1]
		local var_154_3 = arg_154_0.orbits.original[iter_154_0]

		var_154_2.m_Height = math.lerp(var_154_1.m_Height, var_154_3.m_Height, arg_154_0.pinchValue)
		var_154_2.m_Radius = var_154_3.m_Radius * arg_154_0.pinchValue
	end

	var_154_0.m_Orbits = arg_154_0.orbits.current
end

function var_0_0.RevertCameraOrbit(arg_155_0)
	arg_155_0 = arg_155_0.scene

	local var_155_0 = arg_155_0.surroudCamera

	if not var_155_0 then
		return
	end

	for iter_155_0 = 0, #arg_155_0.orbits.current - 1 do
		local var_155_1 = arg_155_0.orbits.current[iter_155_0 + 1]
		local var_155_2 = arg_155_0.orbits.original[iter_155_0]

		var_155_1.m_Height = var_155_2.m_Height
		var_155_1.m_Radius = var_155_2.m_Radius
	end

	var_155_0.m_Orbits = arg_155_0.orbits.current
	arg_155_0.surroudCamera = nil
end

function var_0_0.ActiveStateCamera(arg_156_0, arg_156_1, arg_156_2)
	local var_156_0 = {
		base = function(arg_157_0)
			arg_156_0:RegisterCameraBlendFinished(arg_156_0.cameras[var_0_0.CAMERA.POV], arg_157_0)
			arg_156_0:ActiveCamera(arg_156_0.cameras[var_0_0.CAMERA.POV])
		end,
		watch = function(arg_158_0)
			assert(arg_156_0.apartment)
			arg_156_0.ladyDict[arg_156_0.apartment:GetConfigID()]:SetCameraLady()
			arg_156_0:RegisterCameraBlendFinished(arg_156_0.cameras[var_0_0.CAMERA.ROLE], arg_158_0)
			arg_156_0:ActiveCamera(arg_156_0.cameras[var_0_0.CAMERA.ROLE])
		end,
		walk = function(arg_159_0)
			arg_156_0:RegisterCameraBlendFinished(arg_156_0.cameras[var_0_0.CAMERA.POV], arg_159_0)
			arg_156_0:ActiveCamera(arg_156_0.cameras[var_0_0.CAMERA.POV])
		end,
		ik = function(arg_160_0)
			arg_160_0()
		end,
		gift = function(arg_161_0)
			assert(arg_156_0.apartment)
			arg_156_0.ladyDict[arg_156_0.apartment:GetConfigID()]:SetCameraLady()
			arg_156_0:RegisterCameraBlendFinished(arg_156_0.cameras[var_0_0.CAMERA.GIFT], arg_161_0)
			arg_156_0:ActiveCamera(arg_156_0.cameras[var_0_0.CAMERA.GIFT])
		end,
		standby = function(arg_162_0)
			assert(arg_156_0.apartment)
			arg_156_0.ladyDict[arg_156_0.apartment:GetConfigID()]:SetCameraLady()

			arg_156_0.cameras[var_0_0.CAMERA.ROLE2].transform.position = arg_156_0.cameraRole.transform.position

			arg_156_0:RegisterCameraBlendFinished(arg_156_0.cameras[var_0_0.CAMERA.ROLE2], arg_162_0)
			arg_156_0:ActiveCamera(arg_156_0.cameras[var_0_0.CAMERA.ROLE2])
		end,
		talk = function(arg_163_0)
			assert(arg_156_0.apartment)
			arg_156_0.ladyDict[arg_156_0.apartment:GetConfigID()]:SetCameraLady()
			arg_156_0:RegisterCameraBlendFinished(arg_156_0.cameras[var_0_0.CAMERA.TALK], arg_163_0)
			arg_156_0:ActiveCamera(arg_156_0.cameras[var_0_0.CAMERA.TALK])
		end
	}
	local var_156_1 = {}

	table.insert(var_156_1, function(arg_164_0)
		switch(arg_156_1, var_156_0, arg_164_0, arg_164_0)
	end)
	seriesAsync(var_156_1, arg_156_2)
end

function var_0_0.SetIKStatus(arg_165_0, arg_165_1, arg_165_2)
	warning("Set IKStatus " .. (arg_165_1.id or "NIL"))

	arg_165_0.enableIKTip = true

	setActive(arg_165_0.ladyCollider, false)
	_.each(arg_165_0.ladyTouchColliders, function(arg_166_0)
		setActive(arg_166_0, true)
	end)
	table.clear(arg_165_0.readyIKLayers)

	arg_165_0.blockIK = nil

	local var_165_0 = _.map(arg_165_1.ik_id, function(arg_167_0)
		return arg_167_0[1]
	end)

	table.Foreach(var_165_0, function(arg_168_0, arg_168_1)
		local var_168_0 = Dorm3dIK.New({
			configId = arg_168_1
		})

		table.insert(arg_165_0.readyIKLayers, {
			ikData = var_168_0
		})

		arg_165_0.cacheIKInfos[var_168_0] = {}

		local var_168_1 = var_168_0:GetControllerPath()
		local var_168_2 = arg_165_0.ladyIKRoot:Find(var_168_1):GetComponent(typeof(RootMotion.FinalIK.IKExecutionOrder))
		local var_168_3 = {}

		table.IpairsCArray(var_168_2.IKComponents, function(arg_169_0, arg_169_1)
			var_168_3[arg_169_0 + 1] = arg_169_1:GetIKSolver()
		end)

		arg_165_0.cacheIKInfos[var_168_0].solvers = var_168_3

		local var_168_4 = _.map(var_168_3, function(arg_170_0)
			return arg_170_0.IKPositionWeight
		end)

		arg_165_0.cacheIKInfos[var_168_0].weights = var_168_4
	end)

	arg_165_0.camBrain.enabled = false

	if arg_165_0.cameras[var_0_0.CAMERA.IK_WATCH] then
		setActive(arg_165_0.cameras[var_0_0.CAMERA.IK_WATCH], false)

		arg_165_0.cameras[var_0_0.CAMERA.IK_WATCH] = nil
	end

	local var_165_1 = arg_165_0.cameraRoot:Find(arg_165_1.ik_camera)

	assert(var_165_1, "Missing IKCamera")

	arg_165_0.cameras[var_0_0.CAMERA.IK_WATCH] = var_165_1

	arg_165_0:ActiveCamera(arg_165_0.cameras[var_0_0.CAMERA.IK_WATCH])

	arg_165_0.camBrain.enabled = true

	local var_165_2 = var_165_1:GetComponent(typeof(Cinemachine.CinemachineFreeLook))

	if var_165_2 then
		arg_165_0:RegisterOrbits(var_165_2)
	end

	arg_165_0:SettingHeadAimIK(arg_165_0, arg_165_0.ikConfig.head_track)
	arg_165_0:ResetIKTipTimer()
	arg_165_0:SwitchAnim(arg_165_1.character_action)
	onNextTick(function()
		local var_171_0 = arg_165_0.furnitures:Find(arg_165_1.character_position)

		arg_165_0.lady.position = var_171_0:Find("StayPoint").position
		arg_165_0.lady.rotation = var_171_0:Find("StayPoint").rotation

		arg_165_0:EnableCloth(false)
		arg_165_0:EnableCloth(arg_165_1.use_cloth, arg_165_1.cloth_colliders)
		existCall(arg_165_2)
	end)
end

function var_0_0.ExitIKStatus(arg_172_0, arg_172_1, arg_172_2)
	arg_172_0.enableIKTip = false

	setActive(arg_172_0.ladyCollider, true)
	_.each(arg_172_0.ladyTouchColliders, function(arg_173_0)
		setActive(arg_173_0, false)
	end)
	arg_172_0:ResetActiveIKs(arg_172_0)
	table.clear(arg_172_0.readyIKLayers)
	table.clear(arg_172_0.cacheIKInfos)
	table.clear(arg_172_0.activeIKLayers)
	table.clear(arg_172_0.holdingStatus)
	eachChild(arg_172_0.ladyIKRoot, function(arg_174_0)
		setActive(arg_174_0, false)
	end)
	setActive(arg_172_0:GetIKTipsRootTF(), false)
	arg_172_0:RevertCameraOrbit()
	setActive(arg_172_0.cameras[var_0_0.CAMERA.IK_WATCH], false)

	arg_172_0.cameras[var_0_0.CAMERA.IK_WATCH] = nil

	arg_172_0:EnableCloth(false)
	arg_172_0:ResetHeadAimIK(arg_172_0)
	arg_172_0:SwitchAnim(arg_172_1.character_action)
	onNextTick(function()
		if arg_172_1.character_position then
			arg_172_0.ladyActiveZone = arg_172_1.character_position
		else
			arg_172_0.ladyActiveZone = arg_172_0.ladyBaseZone
		end

		arg_172_0:ChangeCharacterPosition()
		arg_172_0:TriggerLadyDistance()
		arg_172_0:CheckInSector()
		existCall(arg_172_2)
	end)
end

function var_0_0.EnableIKLayer(arg_176_0, arg_176_1, arg_176_2)
	warning("ENABLEIK", arg_176_2:GetConfigID())

	local var_176_0 = arg_176_2:GetControllerPath()
	local var_176_1 = arg_176_1.ladyIKRoot:Find(var_176_0):GetComponent(typeof(RootMotion.FinalIK.IKExecutionOrder))
	local var_176_2 = tf(var_176_1):Find("Container")
	local var_176_3 = {
		ikData = arg_176_2,
		list = var_176_1
	}

	if not arg_176_1.holdingStatus[arg_176_2] then
		var_176_3.rect = arg_176_2:GetRect()

		local var_176_4 = arg_176_2:GetActionTriggerParams()

		if var_176_4[1] == Dorm3dIK.ACTION_TRIGGER.RELEASE_ON_TARGET or var_176_4[1] == Dorm3dIK.ACTION_TRIGGER.TOUCH_TARGET then
			var_176_3.triggerRect = arg_176_2:GetTriggerRect()
		end

		local var_176_5 = var_176_2:Find("SubTargets")
		local var_176_6 = {}

		assert(var_176_5)

		local var_176_7 = arg_176_2:GetSubTargets()
		local var_176_8 = arg_176_2:GetPlaneRotations()
		local var_176_9 = arg_176_2:GetPlaneScales()

		table.Foreach(var_176_7, function(arg_177_0, arg_177_1)
			local var_177_0 = var_176_5:Find(arg_177_1[1])
			local var_177_1 = var_177_0:Find("Plane")

			if var_176_8[arg_177_0] then
				var_177_1.localRotation = var_176_8[arg_177_0]
				var_177_1.localScale = var_176_9[arg_177_0]
			end

			local var_177_2 = var_177_0:Find("Target")
			local var_177_3 = var_0_0.TransformMesh(var_177_1:GetComponent(typeof(UnityEngine.MeshCollider)))
			local var_177_4 = arg_176_1.ladyBoneMaps[arg_177_1[1]]

			var_177_3.origin = var_177_4.position

			local var_177_5 = var_176_3.rect
			local var_177_6 = Vector2.New(var_177_5.center.x / var_177_5.width, var_177_5.center.y / var_177_5.height)

			var_177_1.position = var_0_0.GetPostionByRatio(var_177_3, var_177_6)
			var_177_2.position = var_177_4.position

			local var_177_7 = {
				planeData = var_177_3,
				target = var_177_2,
				useOffset = tobool(arg_177_1)
			}

			table.insert(var_176_6, var_177_7)
		end)

		var_176_3.subPlanes = var_176_6

		setActive(var_176_1, true)
	else
		var_176_3 = arg_176_1.holdingStatus[arg_176_2].ikHandler
	end

	if #arg_176_2:GetHeadTrackPath() > 0 then
		arg_176_0:SettingHeadAimIK(arg_176_1, {
			2,
			arg_176_2:GetHeadTrackPath()
		}, true)
	end

	local var_176_10 = arg_176_2:GetTriggerFaceAnim()

	if #var_176_10 > 0 then
		arg_176_0:PlayFaceAnim(var_176_10)
	end

	setActive(arg_176_0:GetIKHandTF(), true)
	eachChild(arg_176_0:GetIKHandTF(), function(arg_178_0)
		setActive(arg_178_0, false)
	end)
	arg_176_0:StopIKHandTimer()
	setActive(arg_176_0:GetIKHandTF():Find("Begin"), true)

	arg_176_1.ikHandTimer = Timer.New(function()
		setActive(arg_176_0:GetIKHandTF():Find("Begin"), false)
		setActive(arg_176_0:GetIKHandTF():Find("Normal"), true)
	end, 0.5, 1)

	arg_176_1.ikHandTimer:Start()

	arg_176_1.ikNextCheckStamp = Time.time + var_0_0.IK_STATUS_DELTA

	arg_176_0:emit(var_0_0.ON_IK_STATUS_CHANGED, arg_176_2:GetConfigID(), var_0_0.IK_STATUS.BEGIN)
	pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataTouch(arg_176_0.apartment.configId, arg_176_0.apartment.level, arg_176_1.ikConfig.character_action, arg_176_2:GetTriggerParams()[2], arg_176_0.room:GetConfigID()))

	return var_176_3
end

function var_0_0.DeactiveIKLayer(arg_180_0, arg_180_1)
	if #arg_180_1:GetHeadTrackPath() > 0 then
		arg_180_0:SettingHeadAimIK(arg_180_0, arg_180_0.ikConfig.head_track)
	end

	arg_180_0:StopIKHandTimer()
	setActive(arg_180_0:GetIKHandTF():Find("Begin"), false)
	setActive(arg_180_0:GetIKHandTF():Find("Normal"), false)
	setActive(arg_180_0:GetIKHandTF():Find("End"), true)

	arg_180_0.ikHandTimer = Timer.New(function()
		setActive(arg_180_0:GetIKHandTF():Find("End"), false)
		setActive(arg_180_0:GetIKHandTF(), false)
	end, 0.5, 1)

	arg_180_0.ikHandTimer:Start()
end

function var_0_0.StopIKHandTimer(arg_182_0)
	if not arg_182_0.ikHandTimer then
		return
	end

	arg_182_0.ikHandTimer:Stop()

	arg_182_0.ikHandTimer = nil
end

function var_0_0.RevertIKLayer(arg_183_0, arg_183_1, arg_183_2)
	seriesAsync({
		function(arg_184_0)
			if arg_183_1 >= 999 then
				return arg_184_0()
			end

			arg_183_0:PlayIKRevert(arg_183_0, arg_183_1, arg_184_0)
		end,
		arg_183_2
	})
end

function var_0_0.RevertAllIKLayer(arg_185_0, arg_185_1, arg_185_2)
	table.insertto(arg_185_0.activeIKLayers, _.keys(arg_185_0.holdingStatus))
	table.clear(arg_185_0.holdingStatus)
	arg_185_0.RevertIKLayer(arg_185_0, arg_185_1, arg_185_2)
end

function var_0_0.PlayIKRevert(arg_186_0, arg_186_1, arg_186_2, arg_186_3)
	local var_186_0 = Time.time

	function arg_186_0.ikRevertHandler()
		local var_187_0 = Time.time - var_186_0

		_.each(arg_186_1.activeIKLayers, function(arg_188_0)
			local var_188_0 = 1

			if arg_186_2 > 0 then
				var_188_0 = var_187_0 / arg_186_2
			end

			local var_188_1 = arg_186_1.cacheIKInfos[arg_188_0].solvers
			local var_188_2 = arg_186_1.cacheIKInfos[arg_188_0].weights

			table.Foreach(var_188_1, function(arg_189_0, arg_189_1)
				arg_189_1.IKPositionWeight = math.lerp(var_188_2[arg_189_0], 0, var_188_0)
			end)
		end)

		if var_187_0 >= arg_186_2 then
			arg_186_0:ResetActiveIKs(arg_186_1)

			arg_186_0.ikRevertHandler = nil

			existCall(arg_186_3)
		end
	end

	arg_186_0.ikRevertHandler()
end

function var_0_0.ResetActiveIKs(arg_190_0, arg_190_1)
	table.insertto(arg_190_0.activeIKLayers, _.keys(arg_190_0.holdingStatus))
	table.clear(arg_190_0.holdingStatus)
	_.each(arg_190_1.activeIKLayers, function(arg_191_0)
		local var_191_0 = arg_191_0:GetControllerPath()
		local var_191_1 = arg_190_1.ladyIKRoot:Find(var_191_0):GetComponent(typeof(RootMotion.FinalIK.IKExecutionOrder))

		setActive(var_191_1, false)

		local var_191_2 = arg_190_1.cacheIKInfos[arg_191_0].solvers
		local var_191_3 = arg_190_1.cacheIKInfos[arg_191_0].weights

		table.Foreach(var_191_2, function(arg_192_0, arg_192_1)
			arg_192_1.IKPositionWeight = var_191_3[arg_192_0]
		end)
	end)
	table.clear(arg_190_1.activeIKLayers)
end

function var_0_0.PlayIKAction(arg_193_0, arg_193_1)
	warning("Trigger IK", arg_193_1:GetConfigID())
	arg_193_0:emit(var_0_0.ON_IK_STATUS_CHANGED, arg_193_1:GetConfigID(), var_0_0.IK_STATUS.TRIGGER)
	arg_193_0:OnTriggerIK(arg_193_1:GetConfigID())
end

function var_0_0.ResetIKTipTimer(arg_194_0)
	if not arg_194_0.enableIKTip then
		return
	end

	arg_194_0.nextTipIKTime = Time.time + var_0_0.IK_TIP_WAIT_TIME
end

function var_0_0.EnableHeadIK(arg_195_0, arg_195_1)
	arg_195_0.ladyHeadIKComp.enableIk = arg_195_1
end

function var_0_0.SettingHeadAimIK(arg_196_0, arg_196_1, arg_196_2, arg_196_3)
	local var_196_0

	if arg_196_2[1] == 1 then
		var_196_0 = arg_196_0.mainCameraTF:Find("AimTarget")
	elseif arg_196_2[1] == 2 then
		table.IpairsCArray(arg_196_1.lady:GetComponentsInChildren(typeof(Transform), true), function(arg_197_0, arg_197_1)
			if arg_197_1.name ~= arg_196_2[2] then
				return
			end

			var_196_0 = arg_197_1
		end)
	end

	arg_196_1.ladyHeadIKComp.AimTarget = var_196_0

	if not arg_196_3 and arg_196_2[3] then
		arg_196_1.ladyHeadIKComp.BodyWeight = arg_196_2[3]
	end

	if not arg_196_3 and arg_196_2[4] then
		arg_196_1.ladyHeadIKComp.HeadWeight = arg_196_2[4]
	end
end

function var_0_0.ResetHeadAimIK(arg_198_0, arg_198_1)
	arg_198_1.ladyHeadIKComp.AimTarget = arg_198_0.mainCameraTF:Find("AimTarget")
	arg_198_1.ladyHeadIKComp.HeadWeight = arg_198_1.ladyHeadIKData.HeadWeight
	arg_198_1.ladyHeadIKComp.BodyWeight = arg_198_1.ladyHeadIKData.BodyWeight
end

function var_0_0.HideCharacter(arg_199_0, arg_199_1)
	local function var_199_0(arg_200_0)
		arg_200_0:HideCharacterBylayer()
	end

	for iter_199_0, iter_199_1 in pairs(arg_199_0.ladyDict) do
		if iter_199_0 ~= arg_199_1 then
			var_199_0(iter_199_1)
		end
	end
end

function var_0_0.RevertCharacter(arg_201_0, arg_201_1)
	local function var_201_0(arg_202_0)
		arg_202_0:RevertCharacterBylayer()
	end

	for iter_201_0, iter_201_1 in pairs(arg_201_0.ladyDict) do
		if iter_201_0 ~= arg_201_1 then
			var_201_0(iter_201_1)
		end
	end
end

function var_0_0.HideCharacterBylayer(arg_203_0)
	local var_203_0 = "Bip001"
	local var_203_1 = arg_203_0.lady:Find("all")

	for iter_203_0 = 0, var_203_1.childCount - 1 do
		local var_203_2 = var_203_1:GetChild(iter_203_0)

		if var_203_2.name ~= var_203_0 then
			pg.ViewUtils.SetLayer(var_203_2, Layer.Environment3D)
		end
	end

	if arg_203_0.tfPendintItem then
		pg.ViewUtils.SetLayer(arg_203_0.tfPendintItem, Layer.Environment3D)
	end

	if arg_203_0.ladyWatchFloat then
		pg.ViewUtils.SetLayer(arg_203_0.ladyWatchFloat, Layer.Environment3D)
	end

	GetComponent(arg_203_0.lady, "BLHXCharacterPropertiesController").enabled = false
end

function var_0_0.RevertCharacterBylayer(arg_204_0)
	local var_204_0 = "Bip001"
	local var_204_1 = arg_204_0.lady:Find("all")

	for iter_204_0 = 0, var_204_1.childCount - 1 do
		local var_204_2 = var_204_1:GetChild(iter_204_0)

		if var_204_2.name ~= var_204_0 then
			pg.ViewUtils.SetLayer(var_204_2, Layer.Default)
		end
	end

	if arg_204_0.tfPendintItem then
		pg.ViewUtils.SetLayer(arg_204_0.tfPendintItem, Layer.Default)
	end

	if arg_204_0.ladyWatchFloat then
		pg.ViewUtils.SetLayer(arg_204_0.ladyWatchFloat, Layer.Default)
	end

	GetComponent(arg_204_0.lady, "BLHXCharacterPropertiesController").enabled = true
end

function var_0_0.EnterFurnitureWatchMode(arg_205_0)
	arg_205_0:SetAllBlackbloardValue("inLockLayer", true)
	arg_205_0:HideCharacter()
end

function var_0_0.ExitFurnitureWatchMode(arg_206_0)
	arg_206_0:HideFurnitureSlots()

	local var_206_0 = arg_206_0.cameras[var_0_0.CAMERA.POV]

	seriesAsync({
		function(arg_207_0)
			arg_206_0:emit(var_0_0.SHOW_BLOCK)
			arg_206_0:ShowBlackScreen(true, arg_207_0)
		end,
		function(arg_208_0)
			arg_206_0:RevertCharacter()
			arg_206_0:SetAllBlackbloardValue("inLockLayer", false)
			arg_206_0:RegisterCameraBlendFinished(var_206_0, arg_208_0)
			arg_206_0:ActiveCamera(var_206_0)
		end,
		function(arg_209_0)
			arg_206_0:ShowBlackScreen(false, arg_209_0)
		end
	}, function()
		arg_206_0:emit(var_0_0.HIDE_BLOCK)
	end)
	arg_206_0:RefreshSlots()
end

function var_0_0.SwitchFurnitureZone(arg_211_0, arg_211_1)
	local var_211_0 = arg_211_0:GetFurnitureByName(arg_211_1:GetWatchCameraName()):Find("FurnitureWatch Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))

	if arg_211_0.cameraFurnitureWatch and arg_211_0.cameraFurnitureWatch ~= var_211_0 then
		arg_211_0:UnRegisterCameraBlendFinished(arg_211_0.cameraFurnitureWatch)
		setActive(arg_211_0.cameraFurnitureWatch, false)
	end

	arg_211_0.cameraFurnitureWatch = var_211_0
	arg_211_0.cameras[var_0_0.CAMERA.FURNITURE_WATCH] = arg_211_0.cameraFurnitureWatch

	arg_211_0:RegisterCameraBlendFinished(arg_211_0.cameraFurnitureWatch, function()
		arg_211_0:emit(var_0_0.HIDE_BLOCK)
	end)
	arg_211_0:emit(var_0_0.SHOW_BLOCK)
	arg_211_0:ActiveCamera(arg_211_0.cameraFurnitureWatch)
end

function var_0_0.HideFurnitureSlots(arg_213_0)
	if arg_213_0.displaySlots then
		arg_213_0:UpdateDisplaySlots({})
		table.Foreach(arg_213_0.displaySlots, function(arg_214_0, arg_214_1)
			local var_214_0 = arg_214_1.trans

			if IsNil(var_214_0:Find("Selector")) then
				return
			end

			setActive(var_214_0:Find("Selector"), false)
		end)

		arg_213_0.displaySlots = nil
	end
end

function var_0_0.DisplayFurnitureSlots(arg_215_0, arg_215_1)
	arg_215_0:HideFurnitureSlots()

	arg_215_0.displaySlots = {}

	_.each(arg_215_1, function(arg_216_0)
		arg_215_0.displaySlots[arg_216_0] = arg_215_0.slotDict[arg_216_0]

		if not arg_215_0.displaySlots[arg_216_0] then
			errorMsg("Slot " .. arg_216_0 .. " Not Binding Scene Object")

			return
		end

		local var_216_0 = arg_215_0.displaySlots[arg_216_0].trans

		if var_216_0:Find("Selector") then
			setActive(var_216_0:Find("Selector"), true)
		end
	end)
end

function var_0_0.UpdateDisplaySlots(arg_217_0, arg_217_1)
	table.Foreach(arg_217_0.displaySlots, function(arg_218_0, arg_218_1)
		local var_218_0 = arg_218_1.trans

		if not IsNil(var_218_0:Find("Selector")) then
			setActive(var_218_0:Find("Selector/Normal"), arg_217_1[arg_218_0] == 0)
			setActive(var_218_0:Find("Selector/Active"), arg_217_1[arg_218_0] == 1)
			setActive(var_218_0:Find("Selector/Ban"), arg_217_1[arg_218_0] == 2)
		end

		local var_218_1 = arg_217_0.slotDict[arg_218_0].model
		local var_218_2 = arg_217_0.slotDict[arg_218_0].displayModelName

		if var_218_2 and var_218_2 ~= "" then
			var_218_1 = var_218_0:GetChild(var_218_0.childCount - 1)
		end

		local function var_218_3(arg_219_0, arg_219_1)
			local var_219_0 = arg_219_0:GetComponentsInChildren(typeof(Renderer), true)

			table.IpairsCArray(var_219_0, function(arg_220_0, arg_220_1)
				local var_220_0 = arg_220_1.material

				if var_220_0 and var_220_0:HasProperty("_FinalTint") then
					var_220_0:SetColor("_FinalTint", arg_219_1)
				end
			end)
		end

		if var_218_1 then
			if arg_217_1[arg_218_0] == 1 then
				var_218_3(var_218_1, Color.NewHex("3F83AE73"))
			else
				var_218_3(var_218_1, Color.New(0, 0, 0, 0))
			end
		end
	end)
end

function var_0_0.EnterPhotoMode(arg_221_0, arg_221_1, arg_221_2)
	arg_221_0:SetAllBlackbloardValue("inLockLayer", true)
	arg_221_0:emit(var_0_0.ENABLE_SCENEBLOCK, true)
	seriesAsync({
		function(arg_222_0)
			arg_221_0:TempHideUI(true, arg_222_0)
		end,
		function(arg_223_0)
			arg_221_0:ShowBlackScreen(true, arg_223_0)
		end,
		function(arg_224_0)
			local var_224_0 = arg_221_0.ladyDict[arg_221_0.apartment:GetConfigID()]

			arg_221_0:SwitchAnim(arg_221_2)
			var_224_0.ladyAnimator:Update(0)
			var_224_0:ResetCharPoint(arg_221_1:GetWatchCameraName())
			arg_221_0:SyncInterestTransform(var_224_0)

			local var_224_1 = arg_221_0.cameras[var_0_0.CAMERA.PHOTO]
			local var_224_2 = var_224_1.m_XAxis

			var_224_2.Value = 180
			var_224_1.m_XAxis = var_224_2

			local var_224_3 = var_224_1.m_YAxis

			var_224_3.Value = 0.7
			var_224_1.m_YAxis = var_224_3
			arg_221_0.pinchValue = 1

			arg_221_0:RegisterOrbits(arg_221_0.cameras[var_0_0.CAMERA.PHOTO])
			arg_221_0:SetCameraObrits()
			arg_221_0:RegisterCameraBlendFinished(var_224_1, arg_224_0)
			arg_221_0:ActiveCamera(var_224_1)
		end,
		function(arg_225_0)
			arg_221_0:ShowBlackScreen(false, arg_225_0)
		end
	}, function()
		arg_221_0:EnableJoystick(true)
	end)
end

function var_0_0.ExitPhotoMode(arg_227_0)
	arg_227_0:emit(var_0_0.SHOW_BLOCK)
	arg_227_0:EnableJoystick(false)
	seriesAsync({
		function(arg_228_0)
			arg_227_0:ShowBlackScreen(true, arg_228_0)
		end,
		function(arg_229_0)
			arg_227_0:RevertCameraOrbit()
			arg_227_0:SwitchAnim(var_0_0.ANIM.IDLE)
			onNextTick(function()
				arg_227_0:ChangeCharacterPosition()
			end)

			if arg_227_0.contextData.photoFreeMode then
				arg_227_0:EnablePOVLayer(false)
				setActive(arg_227_0.restrictedBox, false)

				arg_227_0.contextData.photoFreeMode = nil
			end

			local var_229_0 = arg_227_0.cameras[var_0_0.CAMERA.POV]

			arg_227_0:RegisterCameraBlendFinished(var_229_0, arg_229_0)
			arg_227_0:ActiveCamera(var_229_0)
		end,
		function(arg_231_0)
			arg_227_0:ShowBlackScreen(false, arg_231_0)
		end
	}, function()
		arg_227_0:RefreshSlots()
		arg_227_0:SetAllBlackbloardValue("inLockLayer", false)
		arg_227_0:emit(var_0_0.HIDE_BLOCK)
		arg_227_0:emit(var_0_0.ENABLE_SCENEBLOCK, false)
		arg_227_0:TempHideUI(false)
	end)
end

function var_0_0.SwitchCameraZone(arg_233_0, arg_233_1, arg_233_2, arg_233_3)
	arg_233_0:emit(var_0_0.SHOW_BLOCK)
	seriesAsync({
		function(arg_234_0)
			arg_233_0:ShowBlackScreen(true, arg_234_0)
		end,
		function(arg_235_0)
			arg_233_0:SwitchAnim(arg_233_2)
			onNextTick(function()
				arg_233_0:ResetCharPoint(arg_233_1:GetWatchCameraName())
				arg_233_0:SyncInterestTransform(arg_233_0)
				arg_235_0()
			end)
		end,
		function(arg_237_0)
			arg_233_0:ShowBlackScreen(false, arg_237_0)
		end
	}, function()
		arg_233_0:emit(var_0_0.HIDE_BLOCK)
		existCall(arg_233_3)
	end)
end

function var_0_0.SwitchPhotoCamera(arg_239_0)
	if not arg_239_0.contextData.photoFreeMode then
		arg_239_0:EnableJoystick(false)
		arg_239_0:EnablePOVLayer(true)
		setActive(arg_239_0.restrictedBox, true)

		local var_239_0 = arg_239_0.cameras[var_0_0.CAMERA.PHOTO_FREE]

		var_239_0.transform.position = arg_239_0.mainCameraTF.position

		local var_239_1 = arg_239_0.cameras[var_0_0.CAMERA.PHOTO_FREE]:Find("PhotoFree Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera)):GetCinemachineComponent(Cinemachine.CinemachineCore.Stage.Aim)
		local var_239_2 = arg_239_0.mainCameraTF.rotation:ToEulerAngles()
		local var_239_3 = var_239_1.m_HorizontalAxis

		var_239_3.Value = var_239_2.y
		var_239_1.m_HorizontalAxis = var_239_3

		local var_239_4 = var_239_1.m_VerticalAxis

		var_239_4.Value = arg_239_0:GetNearestAngle(var_239_2.x, var_239_4.m_MinValue, var_239_4.m_MaxValue)
		var_239_1.m_VerticalAxis = var_239_4

		local var_239_5 = math.InverseLerp(arg_239_0.restrictedHeightRange[1], arg_239_0.restrictedHeightRange[2], var_239_0.position.y)

		arg_239_0:emit(Dorm3dPhotoMediator.CAMERA_LIFT_CHANGED, var_239_5)
		arg_239_0:ActiveCamera(arg_239_0.cameras[var_0_0.CAMERA.PHOTO_FREE])
	else
		arg_239_0:EnableJoystick(true)
		arg_239_0:EnablePOVLayer(false)
		setActive(arg_239_0.restrictedBox, false)
		arg_239_0:ActiveCamera(arg_239_0.cameras[var_0_0.CAMERA.PHOTO])
	end

	arg_239_0.contextData.photoFreeMode = not arg_239_0.contextData.photoFreeMode
end

function var_0_0.SetPhotoCameraHeight(arg_240_0, arg_240_1)
	local var_240_0 = math.lerp(arg_240_0.restrictedHeightRange[1], arg_240_0.restrictedHeightRange[2], arg_240_1)
	local var_240_1 = arg_240_0.cameras[var_0_0.CAMERA.PHOTO_FREE]

	var_240_1:GetComponent(typeof(UnityEngine.CharacterController)):Move(Vector3.New(0, var_240_0 - var_240_1.position.y, 0))
	onNextTick(function()
		local var_241_0 = math.InverseLerp(arg_240_0.restrictedHeightRange[1], arg_240_0.restrictedHeightRange[2], var_240_1.position.y)

		arg_240_0:emit(Dorm3dPhotoMediator.CAMERA_LIFT_CHANGED, var_241_0)
	end)
end

function var_0_0.ResetPhotoCameraPosition(arg_242_0)
	local var_242_0 = arg_242_0.cameras[var_0_0.CAMERA.PHOTO]
	local var_242_1 = var_242_0.m_XAxis

	var_242_1.Value = 180
	var_242_0.m_XAxis = var_242_1

	local var_242_2 = var_242_0.m_YAxis

	var_242_2.Value = 0.7
	var_242_0.m_YAxis = var_242_2
end

function var_0_0.ResetCharPoint(arg_243_0, arg_243_1)
	local var_243_0 = arg_243_0.furnitures:Find(arg_243_1 .. "/StayPoint")

	arg_243_0.lady.position = var_243_0.position
	arg_243_0.lady.rotation = var_243_0.rotation
end

function var_0_0.GetNearestAngle(arg_244_0, arg_244_1, arg_244_2, arg_244_3)
	if arg_244_3 < arg_244_2 then
		arg_244_3 = arg_244_3 + 360
	end

	if arg_244_2 <= arg_244_1 and arg_244_1 <= arg_244_3 then
		return arg_244_1
	end

	local var_244_0 = (arg_244_2 + arg_244_3) / 2

	arg_244_1 = var_244_0 - Mathf.DeltaAngle(arg_244_1, var_244_0)
	arg_244_1 = math.clamp(arg_244_1, arg_244_2, arg_244_3)

	return arg_244_1
end

function var_0_0.PlayTimeline(arg_245_0, arg_245_1, arg_245_2)
	local var_245_0 = {}

	if arg_245_0.waitForTimeline then
		table.insert(var_245_0, function(arg_246_0)
			local var_246_0 = arg_245_0.waitForTimeline

			arg_245_0.waitForTimeline = nil

			var_246_0()
			arg_246_0()
		end)
	end

	table.insert(var_245_0, function(arg_247_0)
		arg_245_0:LoadTimelineScene(arg_245_1.name, false, arg_247_0)
	end)

	if arg_245_1.scene and arg_245_1.sceneRoot then
		table.insert(var_245_0, function(arg_248_0)
			arg_245_0:ChangeArtScene(arg_245_1.scene .. "|" .. arg_245_1.sceneRoot, arg_248_0)
		end)
	end

	table.insert(var_245_0, function(arg_249_0)
		local var_249_0 = GameObject.Find("[sequence]").transform
		local var_249_1 = var_249_0:GetComponent(typeof(UnityEngine.Playables.PlayableDirector))

		if GetComponent(var_249_1, "TimelineSpeed") then
			setDirectorSpeed(var_249_1, 1)
		else
			GetOrAddComponent(var_249_0, "TimelineSpeed")
		end

		local var_249_2 = GameObject.Find("[actor]").transform
		local var_249_3 = var_249_2:GetComponentsInChildren(typeof(Animator), true)

		table.IpairsCArray(var_249_3, function(arg_250_0, arg_250_1)
			GetOrAddComponent(arg_250_1.transform, typeof(DftAniEvent))
		end)
		table.IpairsCArray(var_249_2:GetComponentsInChildren(typeof("MagicaCloth.BaseCloth"), true), function(arg_251_0, arg_251_1)
			arg_251_1.enabled, arg_251_1.enabled = arg_251_1.enabled, false
		end)
		var_249_1:Stop()

		var_249_1.extrapolationMode = ReflectionHelp.RefGetField(typeof("UnityEngine.Playables.DirectorWrapMode"), "Hold", nil)

		if arg_245_1.time then
			var_249_1.time = math.clamp(arg_245_1.time, 0, var_249_1.duration)
		end

		local var_249_4 = {}

		local function var_249_5(arg_252_0)
			switch(arg_252_0.stringParameter, {
				TimelinePause = function()
					setDirectorSpeed(var_249_1, 0)
				end,
				TimelineResume = function()
					arg_245_0.timelineSpeed = 1

					setDirectorSpeed(var_249_1, 1)
				end,
				TimelinePlayOnTime = function()
					if arg_252_0.intParameter == 0 or arg_252_0.intParameter == var_249_4.selectIndex then
						var_249_1.time = arg_252_0.floatParameter

						var_249_1:RebuildGraph()
					end
				end,
				TimelineSelectStart = function()
					var_249_4.selectIndex = nil

					if arg_245_1.options then
						local var_256_0 = arg_245_1.options[arg_252_0.intParameter]

						arg_245_0:DoTimelineOption(var_256_0, function(arg_257_0)
							var_249_4.selectIndex = arg_257_0
							var_249_4.optionIndex = var_256_0[arg_257_0].flag
						end)
					end
				end,
				TimelineTouchStart = function()
					var_249_4.selectIndex = nil

					if arg_245_1.touchs then
						local var_258_0 = arg_245_1.touchs[arg_252_0.intParameter]

						arg_245_0:DoTimelineTouch(arg_245_1.touchs[arg_252_0.intParameter], function(arg_259_0)
							var_249_4.selectIndex = arg_259_0
							var_249_4.optionIndex = var_258_0[arg_259_0].flag
						end)
					end
				end,
				TimelineSelectLoop = function()
					if not var_249_4.selectIndex then
						var_249_1.time = arg_252_0.floatParameter

						var_249_1:RebuildGraph()
					end
				end,
				TimelineAccompanyJump = function()
					if arg_245_0.canTriggerAccompanyPerformance then
						arg_245_0.canTriggerAccompanyPerformance = false

						local var_261_0 = arg_245_1.accompanys[arg_252_0.intParameter]
						local var_261_1 = var_261_0[math.random(#var_261_0)]

						var_249_1.time = var_261_1

						var_249_1:RebuildGraph()
					end
				end,
				TimelineEnd = function()
					var_249_4.finish = true

					setDirectorSpeed(var_249_1, 0)
				end
			}, function()
				warning("other event trigger:" .. arg_252_0.stringParameter)
			end)

			if var_249_4.finish then
				arg_245_0.timelineMark = var_249_4
				arg_245_0.timelineFinishCall = nil

				arg_249_0()
			end
		end

		GetOrAddComponent(var_249_0, "DftCommonSignalReceiver"):SetCommonEvent(var_249_5)

		function arg_245_0.timelineFinishCall()
			var_249_5({
				stringParameter = "TimelineEnd"
			})
		end

		arg_245_0:HideCharacter()
		setActive(arg_245_0.mainCameraTF, false)
		eachChild(arg_245_0.rtTimelineScreen, function(arg_265_0)
			setActive(arg_265_0, false)
		end)
		setActive(arg_245_0.rtTimelineScreen, true)
		setActive(arg_245_0.rtTimelineScreen:Find("btn_skip"), arg_245_0.inReplayTalk)
		var_249_1:Play()
		var_249_1:Evaluate()
	end)
	table.insert(var_245_0, function(arg_266_0)
		arg_245_0:ShowBlackScreen(true, function()
			arg_245_0:UnloadTimelineScene(arg_245_1.name, false, arg_266_0)
		end)
	end)

	local var_245_1 = arg_245_0.artSceneInfo

	table.insert(var_245_0, function(arg_268_0)
		arg_245_0:ChangeArtScene(var_245_1, arg_268_0)
	end)
	seriesAsync(var_245_0, function()
		setActive(arg_245_0.rtTimelineScreen, false)
		arg_245_0:RevertCharacter()
		setActive(arg_245_0.mainCameraTF, true)

		local var_269_0 = arg_245_0.timelineMark

		arg_245_0.timelineMark = nil

		existCall(arg_245_2, var_269_0, function(arg_270_0)
			arg_245_0:ShowBlackScreen(false, arg_270_0)
		end)
	end)
end

function var_0_0.PlaySingleAction(arg_271_0, arg_271_1, arg_271_2)
	local var_271_0 = string.find(arg_271_1, "^Face_")

	if tobool(var_271_0) then
		arg_271_0:PlayFaceAnim(arg_271_1, arg_271_2)

		return
	end

	arg_271_0.animNameMap = arg_271_0.animNameMap or {}
	arg_271_0.animNameMap[arg_271_0.ladyAnimator.StringToHash(arg_271_1)] = arg_271_1

	local var_271_1 = {}

	if not arg_271_0.ladyAnimator:GetCurrentAnimatorStateInfo(arg_271_0.ladyAnimBaseLayerIndex):IsName(arg_271_1) then
		table.insert(var_271_1, function(arg_272_0)
			arg_271_0.nowState = arg_271_1
			arg_271_0.stateCallback = arg_272_0

			arg_271_0.ladyAnimator:CrossFadeInFixedTime(arg_271_1, 0.25, arg_271_0.ladyAnimBaseLayerIndex)
		end)
		table.insert(var_271_1, function(arg_273_0)
			arg_271_0.nowState = nil
			arg_271_0.stateCallback = nil

			arg_273_0()
		end)
	end

	seriesAsync(var_271_1, arg_271_2)
end

function var_0_0.SwitchAnim(arg_274_0, arg_274_1, arg_274_2)
	local var_274_0 = string.find(arg_274_1, "^Face_")

	if tobool(var_274_0) then
		arg_274_0:PlayFaceAnim(arg_274_1, arg_274_2)

		return
	end

	arg_274_0.animNameMap = arg_274_0.animNameMap or {}
	arg_274_0.animNameMap[arg_274_0.ladyAnimator.StringToHash(arg_274_1)] = arg_274_1

	local var_274_1 = {}

	table.insert(var_274_1, function(arg_275_0)
		arg_274_0.nowState = arg_274_1
		arg_274_0.stateCallback = arg_275_0

		arg_274_0.ladyAnimator:PlayInFixedTime(arg_274_1, arg_274_0.ladyAnimBaseLayerIndex)
	end)
	table.insert(var_274_1, function(arg_276_0)
		arg_274_0.nowState = nil
		arg_274_0.stateCallback = nil

		arg_276_0()
	end)
	seriesAsync(var_274_1, arg_274_2)
end

function var_0_0.PlayFaceAnim(arg_277_0, arg_277_1, arg_277_2)
	arg_277_0.ladyAnimator:CrossFadeInFixedTime(arg_277_1, 0.2, arg_277_0.ladyAnimFaceLayerIndex)
	existCall(arg_277_2)
end

function var_0_0.GetCurrentAnim(arg_278_0)
	local var_278_0 = arg_278_0.ladyAnimator:GetCurrentAnimatorStateInfo(arg_278_0.ladyAnimBaseLayerIndex).shortNameHash

	return arg_278_0.animNameMap[var_278_0]
end

function var_0_0.RegisterAnimCallback(arg_279_0, arg_279_1, arg_279_2)
	arg_279_0.animCallbacks[arg_279_1] = arg_279_2
end

function var_0_0.SetCharacterAnimSpeed(arg_280_0, arg_280_1)
	arg_280_0.ladyAnimator.speed = arg_280_1
	arg_280_0.ladyHeadIKComp.blinkSpeed = arg_280_0.ladyHeadIKData.blinkSpeed * arg_280_1

	if arg_280_1 > 0 then
		arg_280_0.ladyHeadIKComp.DampTime = arg_280_0.ladyHeadIKData.DampTime / arg_280_1
	else
		arg_280_0.ladyHeadIKComp.DampTime = arg_280_0.ladyHeadIKData.DampTime * math.huge
	end
end

function var_0_0.OnAnimationEvent(arg_281_0, arg_281_1)
	if arg_281_1.animatorClipInfo.weight < 0.5 then
		return
	end

	local var_281_0 = arg_281_1.stringParameter
	local var_281_1 = table.removebykey(arg_281_0.animEventCallbacks, var_281_0)

	existCall(var_281_1)
end

function var_0_0.RegisterAnimEventCallback(arg_282_0, arg_282_1, arg_282_2)
	arg_282_0.animEventCallbacks[arg_282_1] = arg_282_2
end

function var_0_0.RegisterCameraBlendFinished(arg_283_0, arg_283_1, arg_283_2)
	arg_283_0.cameraBlendCallbacks[arg_283_1] = arg_283_2
end

function var_0_0.UnRegisterCameraBlendFinished(arg_284_0, arg_284_1)
	arg_284_0.cameraBlendCallbacks[arg_284_1] = nil
end

function var_0_0.OnCameraBlendFinished(arg_285_0, arg_285_1)
	if not arg_285_1 then
		return
	end

	local var_285_0 = table.removebykey(arg_285_0.cameraBlendCallbacks, arg_285_1)

	existCall(var_285_0)
end

function var_0_0.PlayHeartFX(arg_286_0, arg_286_1)
	local var_286_0 = arg_286_0.ladyDict[arg_286_1]

	setActive(var_286_0.effectHeart, false)
	setActive(var_286_0.effectHeart, true)
	pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_joyful")
end

function var_0_0.PlayExpression(arg_287_0, arg_287_1)
	local var_287_0 = arg_287_1.name
	local var_287_1 = arg_287_0.expressionDict[var_287_0]
	local var_287_2 = 5

	if var_287_1 then
		local var_287_3 = var_287_1.timer

		var_287_3:Reset(nil, var_287_2)
		var_287_3:Start()

		if var_287_1.instance then
			setActive(var_287_1.instance, false)
			setActive(var_287_1.instance, true)
		end

		return
	end

	local var_287_4 = {
		name = var_287_0,
		timer = Timer.New(function()
			arg_287_0:RemoveExpression(var_287_0)
		end, var_287_2, 1, true)
	}

	arg_287_0.expressionDict[var_287_0] = var_287_4

	arg_287_0.loader:GetPrefab("dorm3D/effect/prefab/expression/" .. var_287_0, var_287_0, function(arg_289_0)
		var_287_4.instance = arg_289_0

		onNextTick(function()
			setParent(arg_289_0, arg_287_0.ladyHeadCenter)
		end)
		setLocalPosition(arg_289_0, Vector3(0, 0, -0.2))
		setActive(arg_289_0, false)
		setActive(arg_289_0, true)
	end, var_287_4)
end

function var_0_0.RemoveExpression(arg_291_0, arg_291_1)
	local var_291_0 = arg_291_0.expressionDict[arg_291_1]

	if not var_291_0 then
		return
	end

	arg_291_0.loader:ClearRequest(var_291_0)

	if var_291_0.instance then
		arg_291_0.loader:ReturnPrefab(var_291_0.instance)
	end

	arg_291_0.expressionDict[arg_291_1] = nil
end

function var_0_0.ShowOrHideCanWatchMark(arg_292_0, arg_292_1)
	arg_292_0.ladyWatchFloat = arg_292_0.ladyWatchFloat or cloneTplTo(arg_292_0.resTF:Find("vfx_talk_mark"), arg_292_0.ladyHeadCenter)

	setActive(arg_292_0.ladyWatchFloat, arg_292_1)
end

function var_0_0.RegisterGlobalVolume(arg_293_0)
	local var_293_0 = arg_293_0.globalVolume
	local var_293_1 = LuaHelper.GetOrAddVolumeComponent(var_293_0, typeof(BLHX.PostEffect.Overrides.DepthOfField))
	local var_293_2 = LuaHelper.GetOrAddVolumeComponent(var_293_0, typeof(BLHX.PostEffect.Overrides.ColorGrading))

	arg_293_0.originalCameraSettings = {
		depthOfField = {
			enabled = var_293_1.enabled.value,
			focusDistance = {
				length = 2,
				min = var_293_1.gaussianStart.min,
				value = var_293_1.gaussianStart.value
			},
			blurRadius = {
				min = var_293_1.blurRadius.min,
				max = var_293_1.blurRadius.max,
				value = var_293_1.blurRadius.value
			}
		},
		postExposure = {
			value = var_293_2.postExposure.value
		},
		contrast = {
			min = var_293_2.contrast.min,
			max = var_293_2.contrast.max,
			value = var_293_2.contrast.value
		},
		saturate = {
			min = var_293_2.saturation.min,
			max = var_293_2.saturation.max,
			value = var_293_2.saturation.value
		}
	}
	arg_293_0.originalCameraSettings.depthOfField.enabled = true

	local var_293_3 = var_293_0:GetComponent(typeof(BLHX.Volume.Volume))

	arg_293_0.originalVolume = {
		profile = var_293_3.sharedProfile,
		weight = var_293_3.weight
	}
end

function var_0_0.SettingCamera(arg_294_0, arg_294_1)
	arg_294_0.activeCameraSettings = arg_294_1

	local var_294_0 = arg_294_0.globalVolume
	local var_294_1 = LuaHelper.GetOrAddVolumeComponent(var_294_0, typeof(BLHX.PostEffect.Overrides.DepthOfField))
	local var_294_2 = LuaHelper.GetOrAddVolumeComponent(var_294_0, typeof(BLHX.PostEffect.Overrides.ColorGrading))

	var_294_1.enabled:Override(arg_294_1.depthOfField.enabled)
	var_294_1.gaussianStart:Override(arg_294_1.depthOfField.focusDistance.value)
	var_294_1.gaussianEnd:Override(arg_294_1.depthOfField.focusDistance.value + arg_294_1.depthOfField.focusDistance.length)
	var_294_1.blurRadius:Override(arg_294_1.depthOfField.blurRadius.value)
	var_294_2.postExposure:Override(arg_294_1.postExposure.value)
	var_294_2.contrast:Override(arg_294_1.contrast.value)
	var_294_2.saturation:Override(arg_294_1.saturate.value)
end

function var_0_0.GetCameraSettings(arg_295_0)
	return arg_295_0.originalCameraSettings
end

function var_0_0.RevertCameraSettings(arg_296_0)
	arg_296_0:SettingCamera(arg_296_0.originalCameraSettings)

	arg_296_0.activeCameraSettings = nil
end

function var_0_0.SetVolumeProfile(arg_297_0, arg_297_1, arg_297_2)
	local var_297_0 = arg_297_0.globalVolume:GetComponent(typeof(BLHX.Volume.Volume))

	arg_297_0.activeProfileWeight = arg_297_2

	if arg_297_0.activeProfileName ~= arg_297_1 then
		arg_297_0.activeProfileName = arg_297_1

		arg_297_0.loader:LoadReference("dorm3d/scenesres/res/common", arg_297_1, nil, function(arg_298_0)
			var_297_0.profile = arg_298_0
			var_297_0.weight = arg_297_0.activeProfileWeight

			if arg_297_0.activeCameraSettings then
				arg_297_0:SettingCamera(arg_297_0.activeCameraSettings)
			end
		end, "VolumeProfile")
	else
		var_297_0.weight = arg_297_0.activeProfileWeight
	end
end

function var_0_0.RevertVolumeProfile(arg_299_0)
	local var_299_0 = arg_299_0.globalVolume:GetComponent(typeof(BLHX.Volume.Volume))

	var_299_0.profile = arg_299_0.originalVolume.profile
	var_299_0.weight = arg_299_0.originalVolume.weight

	if arg_299_0.activeCameraSettings then
		arg_299_0:SettingCamera(arg_299_0.activeCameraSettings)
	end

	arg_299_0.activeProfileName = nil
end

function var_0_0.RecordCharacterLight(arg_300_0)
	local var_300_0 = BLHX.Rendering.PipelineInterface.GetCharacterLightColor()

	arg_300_0.originalCharacterColor = {
		color = var_300_0.color,
		intensity = var_300_0.intensity
	}
end

function var_0_0.SetCharacterLight(arg_301_0, arg_301_1, arg_301_2, arg_301_3)
	local var_301_0 = arg_301_0.characterLight:GetComponent(typeof(Light))
	local var_301_1 = Color.Lerp(arg_301_0.originalCharacterColor.color, arg_301_1, arg_301_3)
	local var_301_2 = math.lerp(arg_301_0.originalCharacterColor.intensity, arg_301_2, arg_301_3)

	BLHX.Rendering.PipelineInterface.SetCharacterLight(var_301_1, var_301_2)
end

function var_0_0.RevertCharacterLight(arg_302_0)
	arg_302_0:SetCharacterLight(arg_302_0.originalCharacterColor.color, arg_302_0.originalCharacterColor.intensity, 1)
end

function var_0_0.EnableCloth(arg_303_0, arg_303_1, arg_303_2)
	arg_303_1 = arg_303_1 or {}

	table.Foreach(arg_303_0.clothComps, function(arg_304_0, arg_304_1)
		if arg_304_1 == nil then
			return
		end

		setActive(arg_304_1, arg_303_1[arg_304_0] == 1)
	end)
	table.Foreach(arg_303_0.clothColliderDict, function(arg_305_0, arg_305_1)
		if arg_305_1 == nil then
			return
		end

		setActive(arg_305_1, false)
	end)

	if arg_303_2 then
		table.Foreach(arg_303_2, function(arg_306_0, arg_306_1)
			local var_306_0 = arg_303_0.clothColliderDict[arg_306_1[1]]

			if var_306_0 == nil then
				return
			end

			setActive(var_306_0, arg_306_1[2] == 1)

			if arg_306_1[2] ~= 1 then
				return
			end

			var_0_0.SetMagicaCollider(var_306_0, arg_306_1[3], arg_306_1[4])
		end)
	end
end

function var_0_0.RevertClothComps(arg_307_0, arg_307_1)
	table.Foreach(arg_307_1.ladyClothCompSettings, function(arg_308_0, arg_308_1)
		arg_308_0.enabled = arg_308_1.enabled
	end)
	table.Foreach(arg_307_1.ladyClothColliderSettings, function(arg_309_0, arg_309_1)
		arg_309_0.enabled = arg_309_1.enabled

		var_0_0.SetMagicaCollider(arg_309_0, arg_309_1.StartRadius, arg_309_1.EndRadius)
	end)
end

function var_0_0.onBackPressed(arg_310_0)
	if arg_310_0.exited or arg_310_0.retainCount > 0 then
		-- block empty
	else
		arg_310_0:closeView()
	end
end

function var_0_0.EnableSceneDisplay(arg_311_0, arg_311_1, arg_311_2)
	assert(tobool(arg_311_0.lastSceneRootDict[arg_311_1]) == arg_311_2)

	if arg_311_2 then
		table.Foreach(arg_311_0.lastSceneRootDict[arg_311_1], function(arg_312_0, arg_312_1)
			if IsNil(arg_312_0) then
				return
			end

			setActive(arg_312_0, arg_312_1)
		end)

		arg_311_0.lastSceneRootDict[arg_311_1] = nil
	else
		arg_311_0.lastSceneRootDict[arg_311_1] = {}

		local var_311_0 = SceneManager.GetSceneByName(arg_311_1)

		table.IpairsCArray(var_311_0:GetRootGameObjects(), function(arg_313_0, arg_313_1)
			if tostring(arg_313_1.hideFlags) ~= "None" then
				return
			end

			arg_311_0.lastSceneRootDict[arg_311_1][arg_313_1] = isActive(arg_313_1)

			setActive(arg_313_1, false)
		end)
	end
end

function var_0_0.ChangeArtScene(arg_314_0, arg_314_1, arg_314_2)
	arg_314_1 = string.lower(arg_314_1)

	if arg_314_1 == arg_314_0.artSceneInfo then
		if arg_314_1 == arg_314_0.sceneInfo then
			arg_314_0:SwitchDayNight(arg_314_0.contextData.timeIndex)
			onNextTick(function()
				arg_314_0:RefreshSlots()
				existCall(arg_314_2)
			end)
		else
			existCall(arg_314_2)
		end

		return
	end

	local var_314_0 = {}
	local var_314_1 = false
	local var_314_2

	table.insert(var_314_0, function(arg_316_0)
		arg_314_0.artSceneInfo = arg_314_1

		if var_314_1 then
			pg.SceneAnimMgr.GetInstance():Dorm3DSceneChange(function(arg_317_0)
				var_314_2 = arg_317_0

				arg_316_0()
			end)
		else
			arg_316_0()
		end
	end)

	if arg_314_1 == arg_314_0.sceneInfo then
		table.insert(var_314_0, function(arg_318_0)
			setActive(arg_314_0.slotRoot, true)

			local var_318_0, var_318_1 = unpack(string.split(arg_314_0.sceneInfo, "|"))

			SceneManager.SetActiveScene(SceneManager.GetSceneByName(var_318_0))
			arg_314_0:EnableSceneDisplay(var_318_0, true)
			arg_314_0:SwitchDayNight(arg_314_0.contextData.timeIndex)
			onNextTick(function()
				arg_314_0:RefreshSlots()
			end)
			arg_318_0()
		end)
	else
		var_314_1 = true

		local var_314_3, var_314_4 = unpack(string.split(arg_314_1, "|"))

		table.insert(var_314_0, function(arg_320_0)
			setActive(arg_314_0.slotRoot, false)
			SceneOpMgr.Inst:LoadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_314_4 .. "/" .. var_314_3 .. "_scene"), var_314_3, LoadSceneMode.Additive, function(arg_321_0, arg_321_1)
				SceneManager.SetActiveScene(arg_321_0)

				local var_321_0 = getSceneRootTFDic(arg_321_0).MainCamera

				if var_321_0 then
					setActive(var_321_0, false)
				end

				arg_320_0()
			end)
		end)
	end

	if arg_314_0.artSceneInfo == arg_314_0.sceneInfo then
		table.insert(var_314_0, function(arg_322_0)
			local var_322_0, var_322_1 = unpack(string.split(arg_314_0.sceneInfo, "|"))

			arg_314_0:EnableSceneDisplay(var_322_0, false)
			arg_322_0()
		end)
	else
		local var_314_5, var_314_6 = unpack(string.split(arg_314_0.artSceneInfo, "|"))

		table.insert(var_314_0, function(arg_323_0)
			SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_314_6 .. "/" .. var_314_5 .. "_scene"), var_314_5, arg_323_0)
		end)
	end

	table.insert(var_314_0, function(arg_324_0)
		arg_324_0()

		if var_314_1 then
			var_314_2()
		end
	end)
	seriesAsync(var_314_0, arg_314_2)
end

function var_0_0.LoadTimelineScene(arg_325_0, arg_325_1, arg_325_2, arg_325_3)
	arg_325_1 = string.lower(arg_325_1)

	if arg_325_0.cacheSceneDic[arg_325_1] then
		if not arg_325_2 then
			arg_325_0.timelineScene = arg_325_1

			arg_325_0:EnableSceneDisplay(arg_325_1, true)
		end

		return existCall(arg_325_3)
	end

	local var_325_0 = {}
	local var_325_1

	table.insert(var_325_0, function(arg_326_0)
		pg.SceneAnimMgr.GetInstance():Dorm3DSceneChange(function(arg_327_0)
			if arg_325_0.waitForTimeline then
				arg_325_0.waitForTimeline = arg_327_0
				var_325_1 = nil
			else
				var_325_1 = arg_327_0
			end

			arg_326_0()
		end)
	end)
	table.insert(var_325_0, function(arg_328_0)
		local var_328_0 = arg_325_0.apartment:getConfig("asset_name")

		SceneOpMgr.Inst:LoadSceneAsync(string.lower("dorm3d/character/" .. var_328_0 .. "/timeline/" .. arg_325_1 .. "/" .. arg_325_1 .. "_scene"), arg_325_1, LoadSceneMode.Additive, function(arg_329_0, arg_329_1)
			local var_329_0 = GameObject.Find("[actor]").transform

			arg_325_0:HXCharacter(tf(var_329_0))

			local var_329_1 = GameObject.Find("[sequence]").transform:GetComponent(typeof(UnityEngine.Playables.PlayableDirector))

			var_329_1:Stop()
			TimelineSupport.InitTimeline(var_329_1)
			TimelineSupport.InitSubtitle(var_329_1, arg_325_0.apartment:GetCallName())

			arg_325_0.unloadDirector = var_329_1

			arg_328_0()
		end)
	end)
	table.insert(var_325_0, function(arg_330_0)
		arg_325_0.sceneGroupDic[arg_325_1] = arg_325_0.apartment:GetConfigID()

		if arg_325_2 then
			arg_325_0.cacheSceneDic[arg_325_1] = true

			arg_325_0:EnableSceneDisplay(arg_325_1, false)
		else
			arg_325_0.timelineScene = arg_325_1
		end

		arg_330_0()
		existCall(var_325_1)
	end)
	seriesAsync(var_325_0, arg_325_3)
end

function var_0_0.UnloadTimelineScene(arg_331_0, arg_331_1, arg_331_2, arg_331_3)
	arg_331_1 = string.lower(arg_331_1)

	if arg_331_0.timelineScene == arg_331_1 then
		arg_331_0.timelineScene = nil
	end

	if tobool(arg_331_2) == tobool(arg_331_0.cacheSceneDic[arg_331_1]) then
		local var_331_0 = getProxy(ApartmentProxy):getApartment(arg_331_0.sceneGroupDic[arg_331_1]):getConfig("asset_name")

		if arg_331_0.unloadDirector then
			TimelineSupport.UnloadPlayable(arg_331_0.unloadDirector)

			arg_331_0.unloadDirector = nil
		end

		SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/character/scenes/" .. var_331_0 .. "/timeline/" .. arg_331_1 .. "/" .. arg_331_1 .. "_scene"), arg_331_1, function()
			arg_331_0.cacheSceneDic[arg_331_1] = nil
			arg_331_0.sceneGroupDic[arg_331_1] = nil
			arg_331_0.lastSceneRootDict[arg_331_1] = nil

			existCall(arg_331_3)
		end)
	else
		arg_331_0:EnableSceneDisplay(arg_331_1, false)
		existCall(arg_331_3)
	end
end

function var_0_0.ChangeSubScene(arg_333_0, arg_333_1, arg_333_2)
	arg_333_1 = string.lower(arg_333_1)

	warning(arg_333_0.subSceneInfo, "->", arg_333_1, arg_333_1 == arg_333_0.subSceneInfo)

	if arg_333_1 == arg_333_0.subSceneInfo then
		arg_333_0.ladyActiveZone = arg_333_0.walkBornPoint or arg_333_0.ladyBaseZone

		arg_333_0:ChangeCharacterPosition()
		arg_333_0:ChangePlayerPosition(arg_333_0.ladyActiveZone)
		arg_333_0:TriggerLadyDistance()
		arg_333_0:CheckInSector()
		existCall(arg_333_2)

		return
	end

	local var_333_0 = {}
	local var_333_1 = false
	local var_333_2

	table.insert(var_333_0, function(arg_334_0)
		arg_333_0.subSceneInfo = arg_333_1

		if var_333_1 then
			pg.SceneAnimMgr.GetInstance():Dorm3DSceneChange(function(arg_335_0)
				var_333_2 = arg_335_0

				arg_334_0()
			end)
		else
			arg_334_0()
		end
	end)

	if arg_333_1 == arg_333_0.sceneInfo then
		table.insert(var_333_0, function(arg_336_0)
			local var_336_0, var_336_1 = unpack(string.split(arg_333_0.sceneInfo, "|"))

			arg_333_0:ResetSceneStructure(SceneManager.GetSceneByName(var_336_0 .. "_base"))
			arg_333_0:RefreshSlots()

			arg_333_0.ladyActiveZone = arg_333_0.walkBornPoint or arg_333_0.ladyBaseZone

			arg_333_0:ChangeCharacterPosition()
			arg_333_0:ChangePlayerPosition(arg_333_0.ladyActiveZone)
			arg_333_0:TriggerLadyDistance()
			arg_333_0:CheckInSector()
			arg_336_0()
		end)
	else
		var_333_1 = true

		local var_333_3, var_333_4 = unpack(string.split(arg_333_1, "|"))
		local var_333_5 = var_333_3 .. "_base"

		table.insert(var_333_0, function(arg_337_0)
			SceneOpMgr.Inst:LoadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_333_4 .. "/" .. var_333_5 .. "_scene"), var_333_5, LoadSceneMode.Additive, arg_337_0)
		end)
		table.insert(var_333_0, function(arg_338_0)
			arg_333_0:ResetSceneStructure(SceneManager.GetSceneByName(var_333_5))

			arg_333_0.ladyActiveZone = arg_333_0.walkBornPoint or "Default"

			arg_333_0:SwitchAnim(var_0_0.ANIM.IDLE)
			onNextTick(function()
				arg_333_0:ChangeCharacterPosition()
				arg_333_0:ChangePlayerPosition(arg_333_0.ladyActiveZone)
				arg_333_0:TriggerLadyDistance()
				arg_333_0:CheckInSector()
				arg_338_0()
			end)
		end)
	end

	if arg_333_0.subSceneInfo == arg_333_0.sceneInfo then
		table.insert(var_333_0, function(arg_340_0)
			local var_340_0 = Clone(arg_333_0.room)

			var_340_0.furnitures = {}

			arg_333_0:RefreshSlots(var_340_0)
			arg_340_0()
		end)
	else
		local var_333_6, var_333_7 = unpack(string.split(arg_333_0.subSceneInfo, "|"))
		local var_333_8 = var_333_6 .. "_base"

		table.insert(var_333_0, function(arg_341_0)
			SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_333_7 .. "/" .. var_333_8 .. "_scene"), var_333_8, arg_341_0)
		end)
	end

	table.insert(var_333_0, function(arg_342_0)
		arg_342_0()

		if var_333_1 then
			var_333_2()
		end
	end)
	seriesAsync(var_333_0, arg_333_2)
end

function var_0_0.TransformMesh(arg_343_0)
	local var_343_0 = arg_343_0.sharedMesh
	local var_343_1 = {}
	local var_343_2 = arg_343_0.transform:TransformPoint(var_343_0.vertices[0])
	local var_343_3 = arg_343_0.transform:TransformPoint(var_343_0.vertices[1])
	local var_343_4 = arg_343_0.transform:TransformPoint(var_343_0.vertices[2])

	var_343_1.horizontal = var_343_3 - var_343_2
	var_343_1.verticle = var_343_4 - var_343_2
	var_343_1.origin = var_343_2

	return var_343_1
end

function var_0_0.GetRatio(arg_344_0, arg_344_1)
	local var_344_0 = Vector2.zero

	var_344_0.x = Vector3.Dot(arg_344_0.horizontal, arg_344_1) / arg_344_0.horizontal.sqrMagnitude
	var_344_0.y = Vector3.Dot(arg_344_0.verticle, arg_344_1) / arg_344_0.verticle.sqrMagnitude

	return var_344_0
end

function var_0_0.GetPostionByRatio(arg_345_0, arg_345_1)
	return arg_345_0.horizontal * arg_345_1.x + arg_345_0.verticle * arg_345_1.y + arg_345_0.origin
end

function var_0_0.IsPointInSector(arg_346_0, arg_346_1)
	local var_346_0 = arg_346_1 - Vector3.New(unpack(arg_346_0.Position))

	if var_346_0.magnitude > arg_346_0.Radius then
		return false
	end

	local var_346_1 = Quaternion.Euler(unpack(arg_346_0.Rotation))

	return Vector3.Angle(var_346_1 * Vector3.forward, var_346_0) <= arg_346_0.Angle / 2
end

function var_0_0.willExit(arg_347_0)
	arg_347_0.joystickTimer:Stop()
	arg_347_0.moveStickTimer:Stop()
	UpdateBeat:RemoveListener(arg_347_0.updateHandler)
	arg_347_0:StopIKHandTimer()

	if arg_347_0.moveTimer then
		arg_347_0.moveTimer:Stop()

		arg_347_0.moveTimer = nil
	end

	if arg_347_0.moveWaitTimer then
		arg_347_0.moveWaitTimer:Stop()

		arg_347_0.moveWaitTimer = nil
	end

	GlobalClickEventMgr.Inst:RemoveBeginPinchFunc()
	GlobalClickEventMgr.Inst:RemovePinchFunc()
	GlobalClickEventMgr.Inst:RemoveEndPinchFunc()

	if not IsNil(arg_347_0.furnitures) then
		eachChild(arg_347_0.furnitures, function(arg_348_0)
			local var_348_0 = GetComponent(arg_348_0, typeof(EventTriggerListener))

			if not var_348_0 then
				return
			end

			var_348_0:ClearEvents()
		end)
	end

	for iter_347_0, iter_347_1 in pairs(arg_347_0.ladyDict) do
		arg_347_0:ResetActiveIKs(iter_347_1)
		GetComponent(iter_347_1.lady, typeof(EventTriggerListener)):ClearEvents()
	end

	arg_347_0.camBrainEvenetHandler.OnBlendStarted = nil
	arg_347_0.camBrainEvenetHandler.OnBlendFinished = nil

	pg.UIMgr.GetInstance():UnOverlayPanel(arg_347_0.blockLayer, arg_347_0._tf)
	table.Foreach(arg_347_0.expressionDict, function(arg_349_0)
		arg_347_0:RemoveExpression(arg_349_0)
	end)
	arg_347_0.loader:Clear()
	pg.ClickEffectMgr:GetInstance():SetClickEffect("NORMAL")
	pg.NodeCanvasMgr.GetInstance():Clear()

	local var_347_0 = {}

	if arg_347_0.timelineScene and not arg_347_0.cacheSceneDic[arg_347_0.timelineScene] then
		local var_347_1 = arg_347_0.timelineScene

		arg_347_0.timelineScene = nil

		local var_347_2 = getProxy(ApartmentProxy):getApartment(arg_347_0.sceneGroupDic[var_347_1]):getConfig("asset_name")

		table.insert(var_347_0, function(arg_350_0)
			SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/character/scenes/" .. var_347_2 .. "/timeline/" .. var_347_1 .. "/" .. var_347_1 .. "_scene"), var_347_1, arg_350_0)
		end)
	end

	for iter_347_2, iter_347_3 in pairs(arg_347_0.cacheSceneDic) do
		if iter_347_3 then
			local var_347_3 = getProxy(ApartmentProxy):getApartment(arg_347_0.sceneGroupDic[iter_347_2]):getConfig("asset_name")

			table.insert(var_347_0, function(arg_351_0)
				SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/character/scenes/" .. var_347_3 .. "/timeline/" .. iter_347_2 .. "/" .. iter_347_2 .. "_scene"), iter_347_2, arg_351_0)
			end)
		end
	end

	for iter_347_4, iter_347_5 in ipairs({
		arg_347_0.sceneInfo,
		arg_347_0.subSceneInfo ~= arg_347_0.sceneInfo and arg_347_0.subSceneInfo or nil
	}) do
		local var_347_4, var_347_5 = unpack(string.split(iter_347_5, "|"))
		local var_347_6 = var_347_4 .. "_base"

		table.insert(var_347_0, function(arg_352_0)
			SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_347_5 .. "/" .. var_347_6 .. "_scene"), var_347_6, arg_352_0)
		end)
	end

	for iter_347_6, iter_347_7 in ipairs({
		arg_347_0.sceneInfo,
		arg_347_0.artSceneInfo ~= arg_347_0.sceneInfo and arg_347_0.artSceneInfo or nil
	}) do
		local var_347_7, var_347_8 = unpack(string.split(iter_347_7, "|"))

		table.insert(var_347_0, function(arg_353_0)
			SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_347_8 .. "/" .. var_347_7 .. "_scene"), var_347_7, arg_353_0)
		end)
	end

	seriesAsync(var_347_0, function()
		ReflectionHelp.RefSetProperty(typeof("UnityEngine.LightmapSettings"), "lightmaps", nil, nil)
	end)
end

function var_0_0.InitDefautQuality()
	if PlayerPrefs.GetInt("dorm3d_graphics_settings", 0) == 0 then
		local var_355_0 = DevicePerformanceUtil.GetDevicePerformanceLevel()

		if PLATFORM == PLATFORM_IPHONEPLAYER then
			local var_355_1 = SystemInfo.deviceModel or ""

			local function var_355_2(arg_356_0)
				local var_356_0 = string.match(arg_356_0, "iPad(%d+)")
				local var_356_1 = tonumber(var_356_0)

				if var_356_1 and var_356_1 >= 8 then
					return true
				end

				return false
			end

			local function var_355_3(arg_357_0)
				local var_357_0 = string.match(arg_357_0, "iPhone(%d+)")
				local var_357_1 = tonumber(var_357_0)

				if var_357_1 and var_357_1 >= 13 then
					return true
				end

				return false
			end

			if var_355_2(var_355_1) or var_355_3(var_355_1) then
				var_355_0 = DevicePerformanceLevel.High
			end
		end

		local var_355_4 = var_355_0 == DevicePerformanceLevel.High and 3 or var_355_0 == DevicePerformanceLevel.Mid and 2 or 1

		PlayerPrefs.SetInt("dorm3d_graphics_settings", var_355_4)

		Dorm3dRoomTemplateScene.FirstDefaultSetting = var_355_4
	end
end

function var_0_0.SettingQuality()
	local var_358_0 = GraphicSettingConst.HandleCustomSetting()

	BLHX.Rendering.EngineCore.SetOverrideQualitySettings(var_358_0)
end

function var_0_0.SetMagicaCollider(arg_359_0, arg_359_1, arg_359_2)
	local var_359_0 = typeof("MagicaCloth.MagicaCapsuleCollider")

	ReflectionHelp.RefSetProperty(var_359_0, "StartRadius", arg_359_0, arg_359_1)
	ReflectionHelp.RefSetProperty(var_359_0, "EndRadius", arg_359_0, arg_359_2)
end

return var_0_0
