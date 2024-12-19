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
		if arg_15_0.scene.blockIK then
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

		arg_25_1.scene.blockIK = nil

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
			trans = var_44_2,
			sceneHides = {}
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

			if arg_49_0:CheckSceneItemActive(var_49_2) then
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

			setActive(arg_69_1, true)
		elseif arg_69_1.name == "SafeCollider" then
			arg_67_1.ladySafeCollider = arg_69_1

			setActive(arg_69_1, false)
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

			if arg_111_0.scene.enableIKTip then
				local var_111_0 = Time.time > arg_111_0.nextTipIKTime
				local var_111_1 = arg_111_0:GetIKTipsRootTF()

				if var_111_0 then
					local var_111_2 = arg_111_0
					local var_111_3 = var_111_2.ikConfig
					local var_111_4 = #var_111_2.readyIKLayers + #var_111_3.touch_data

					UIItemList.StaticAlign(var_111_1, var_111_1:GetChild(0), var_111_4, function(arg_114_0, arg_114_1, arg_114_2)
						if arg_114_0 ~= UIItemList.EventUpdate then
							return
						end

						arg_114_1 = arg_114_1 + 1

						local var_114_0
						local var_114_1 = Vector2.zero

						if arg_114_1 > #var_111_2.readyIKLayers then
							local var_114_2 = arg_114_1 - #var_111_2.readyIKLayers
							local var_114_3 = var_111_3.touch_data[var_114_2][1]
							local var_114_4 = pg.dorm3d_ik_touch[var_114_3]

							if #var_114_4.scene_item > 0 then
								var_114_0 = arg_111_0:GetSceneItem(var_114_4.scene_item)
							else
								var_114_0 = arg_111_0.ladyColliders[var_114_4.body]
							end
						else
							local var_114_5 = var_111_2.readyIKLayers[arg_114_1].ikData
							local var_114_6 = var_114_5:GetTriggerBoneName()

							var_114_0 = var_114_6 and arg_111_0.ladyColliders[var_114_6] or nil
							var_114_1 = var_114_5:GetIKTipOffset()
						end

						if var_114_0 then
							local function var_114_7()
								local var_115_0 = arg_111_0.raycastCamera:WorldToScreenPoint(var_114_0.position)
								local var_115_1 = CameraMgr.instance:Raycast(arg_111_0.sceneRaycaster, var_115_0)

								if var_115_1.Length == 0 then
									return
								end

								return var_114_0 == var_115_1[0].gameObject.transform
							end
						end

						if var_114_0 then
							setLocalPosition(arg_114_2, arg_111_0:GetLocalPosition(arg_111_0:GetScreenPosition(var_114_0.position), var_111_1) + var_114_1)
						end

						setActive(arg_114_2, var_114_0)
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
		arg_123_0.slotDict[var_124_0].furnitureId = var_124_1 and var_124_1:GetConfigID()

		local function var_124_4(arg_126_0)
			if var_124_3 then
				setActive(var_124_3, var_124_2 == "")
			end

			table.Foreach(arg_123_0.slotDict[var_124_0].sceneHides or {}, function(arg_127_0, arg_127_1)
				setActive(arg_127_1.trans, arg_127_1.visible)
			end)

			arg_123_0.slotDict[var_124_0].sceneHides = {}

			if arg_126_0 then
				local var_126_0 = arg_126_0:getConfig("scene_hides")

				if #var_126_0 > 0 then
					table.Ipairs(var_126_0, function(arg_128_0, arg_128_1)
						local var_128_0 = arg_123_0.modelRoot:Find(arg_128_1)

						assert(var_128_0, string.format("dorm3d_furniture_template:%d scene_hides missing scene item :%s", arg_126_0:GetConfigID(), arg_128_1))

						local var_128_1 = isActive(var_128_0)

						table.insert(arg_123_0.slotDict[var_124_0].sceneHides, {
							name = arg_128_1,
							trans = var_128_0,
							visible = var_128_1
						})
						setActive(var_128_0, false)
					end)
				end
			end
		end

		if var_124_2 == false or var_124_2 == "" then
			arg_123_0.loader:ClearRequest("slot_" .. var_124_0)
			var_124_4()
			arg_124_2()

			return
		end

		local var_124_5 = arg_123_0.slotDict[var_124_0].trans

		if arg_123_0.loader:GetLoadingRP("slot_" .. var_124_0) then
			arg_123_0:emit(var_0_0.HIDE_BLOCK)
		end

		arg_123_0.loader:GetPrefabBYStopLoading("dorm3d/furniture/prefabs/" .. var_124_2, "", function(arg_129_0)
			arg_124_2()
			assert(arg_129_0)
			setParent(arg_129_0, var_124_5)
			var_124_4(var_124_1)
		end, "slot_" .. var_124_0)
	end, function()
		arg_123_0:emit(var_0_0.HIDE_BLOCK)
	end)
end

function var_0_0.CheckSceneItemActiveByPath(arg_131_0, arg_131_1)
	local var_131_0 = arg_131_0:GetSceneItem(arg_131_1)

	return arg_131_0:CheckSceneItemActive(var_131_0)
end

function var_0_0.CheckSceneItemActive(arg_132_0, arg_132_1)
	local var_132_0 = true
	local var_132_1

	table.Checkout(arg_132_0.slotDict, function(arg_133_0, arg_133_1)
		if underscore.detect(arg_133_1.sceneHides, function(arg_134_0)
			return arg_134_0.trans == arg_132_1
		end) then
			var_132_0 = false
			var_132_1 = arg_133_1.furnitureId

			return false
		end
	end)

	return var_132_0, var_132_1
end

function var_0_0.ChangeCharacterPosition(arg_135_0)
	arg_135_0:ResetCharPoint(arg_135_0.ladyActiveZone)
	arg_135_0:SyncInterestTransform(arg_135_0)
end

function var_0_0.SyncCurrentInterestTransform(arg_136_0)
	local var_136_0 = arg_136_0.ladyDict[arg_136_0.apartment:GetConfigID()]

	arg_136_0:SyncInterestTransform(var_136_0)
end

function var_0_0.SyncInterestTransform(arg_137_0, arg_137_1)
	arg_137_0.ladyInterest.position = arg_137_1.ladyInterestRoot.position
	arg_137_0.ladyInterest.rotation = arg_137_1.ladyInterestRoot.rotation
end

function var_0_0.ChangePlayerPosition(arg_138_0, arg_138_1)
	arg_138_1 = arg_138_1 or arg_138_0.contextData.inFurnitureName

	local var_138_0 = arg_138_0.furnitures:Find(arg_138_1):Find("PlayerPoint").position

	arg_138_0.player.position = var_138_0
	arg_138_0.cameras[var_0_0.CAMERA.POV].transform.position = arg_138_0.playerEye.position

	local var_138_1 = arg_138_0.ladyInterest.position - arg_138_0.playerEye.position
	local var_138_2 = Quaternion.LookRotation(var_138_1).eulerAngles
	local var_138_3 = var_138_2.y
	local var_138_4 = var_138_2.x
	local var_138_5 = arg_138_0.compPovAim.m_HorizontalAxis

	var_138_5.Value = arg_138_0:GetNearestAngle(var_138_3, var_138_5.m_MinValue, var_138_5.m_MaxValue)
	arg_138_0.compPovAim.m_HorizontalAxis = var_138_5

	local var_138_6 = arg_138_0.compPovAim.m_VerticalAxis

	var_138_6.Value = var_138_4
	arg_138_0.compPovAim.m_VerticalAxis = var_138_6
end

function var_0_0.GetAttachedFurnitureName(arg_139_0)
	return arg_139_0.contextData.inFurnitureName
end

function var_0_0.GetFurnitureByName(arg_140_0, arg_140_1)
	return underscore.detect(arg_140_0.attachedPoints, function(arg_141_0)
		return arg_141_0.name == arg_140_1
	end)
end

function var_0_0.GetSlotByID(arg_142_0, arg_142_1)
	return arg_142_0.displaySlots[arg_142_1] and arg_142_0.displaySlots[arg_142_1].trans
end

function var_0_0.GetScreenPosition(arg_143_0, arg_143_1)
	local var_143_0 = arg_143_0.raycastCamera:WorldToScreenPoint(arg_143_1)

	if var_143_0.z < 0 then
		var_143_0.x = var_143_0.x + (var_143_0.x < 0 and -1 or 1) * Screen.width
		var_143_0.y = var_143_0.y + (var_143_0.y < 0 and -1 or 1) * Screen.height
		var_143_0.z = -var_143_0.z
	end

	return var_143_0
end

function var_0_0.GetLocalPosition(arg_144_0, arg_144_1, arg_144_2)
	return LuaHelper.ScreenToLocal(arg_144_2, arg_144_1, pg.UIMgr.GetInstance().uiCameraComp)
end

function var_0_0.GetModelRoot(arg_145_0)
	return arg_145_0.modelRoot
end

function var_0_0.ShiftZone(arg_146_0, arg_146_1, arg_146_2)
	local var_146_0 = arg_146_0:GetFurnitureByName(arg_146_1)

	if not var_146_0 then
		errorMsg(arg_146_1 .. " Not Find")
		existCall(arg_146_2)

		return
	end

	seriesAsync({
		function(arg_147_0)
			arg_146_0:emit(var_0_0.SHOW_BLOCK)
			arg_146_0:ShowBlackScreen(true, arg_147_0)
		end,
		function(arg_148_0)
			if arg_146_0.shiftLady or arg_146_0.room:isPersonalRoom() then
				local var_148_0 = arg_146_0.shiftLady or arg_146_0.apartment:GetConfigID()

				arg_146_0.shiftLady = nil
				arg_146_0.contextData.ladyZone[var_148_0] = var_146_0.name

				local var_148_1 = arg_146_0.ladyDict[var_148_0]

				var_148_1.ladyBaseZone = arg_146_0.contextData.ladyZone[var_148_0]
				var_148_1.ladyActiveZone = arg_146_0.contextData.ladyZone[var_148_0]

				if var_148_1:GetBlackboardValue("inPending") then
					var_148_1:SetOutPending()
					var_148_1:SwitchAnim(var_0_0.ANIM.IDLE)
					onNextTick(function()
						var_148_1:ChangeCharacterPosition()
						arg_148_0()
					end)
				else
					var_148_1:ChangeCharacterPosition()
					arg_148_0()
				end
			else
				arg_148_0()
			end
		end,
		function(arg_150_0)
			arg_146_0.contextData.inFurnitureName = var_146_0.name

			arg_146_0:ChangePlayerPosition()
			arg_146_0:TriggerLadyDistance()
			arg_146_0:CheckInSector()
			arg_150_0()
		end,
		function(arg_151_0)
			arg_146_0:UpdateZoneList()
			arg_146_0:ShowBlackScreen(false, arg_151_0)
		end,
		function(arg_152_0)
			arg_146_0:emit(var_0_0.HIDE_BLOCK)
			arg_152_0()
		end
	}, arg_146_2)
end

function var_0_0.WalkByRootMotionLoop(arg_153_0, arg_153_1, arg_153_2)
	if arg_153_1.pathPending then
		arg_153_2:SetFloat("Speed", 0)

		return
	end

	arg_153_2:SetFloat("Speed", 1)

	local var_153_0 = arg_153_1.path.corners

	if var_153_0.Length > 1 then
		local var_153_1 = var_153_0[1] - arg_153_1.transform.position

		var_153_1.y = 0

		local var_153_2 = Quaternion.LookRotation(var_153_1)
		local var_153_3 = arg_153_1.transform.rotation
		local var_153_4 = 1
		local var_153_5 = Damp(1, var_153_4, Time.deltaTime)

		arg_153_1.transform.rotation = Quaternion.Lerp(var_153_3, var_153_2, var_153_5)
	end
end

function var_0_0.ActiveCamera(arg_154_0, arg_154_1)
	local var_154_0 = isActive(arg_154_1)

	table.Foreach(arg_154_0.cameras, function(arg_155_0, arg_155_1)
		setActive(arg_155_1, arg_155_1 == arg_154_1)
	end)

	if var_154_0 then
		arg_154_0:OnCameraBlendFinished(arg_154_1)
	end
end

function var_0_0.ShowBlackScreen(arg_156_0, arg_156_1, arg_156_2)
	local var_156_0 = arg_156_0.blackSceneInfo or {
		color = "#000000",
		time = 0.3,
		delay = arg_156_1 and 0 or 0.3
	}

	setImageColor(arg_156_0.blackLayer, Color.NewHex(var_156_0.color))
	setActive(arg_156_0.blackLayer, true)
	setCanvasGroupAlpha(arg_156_0.blackLayer, arg_156_1 and 0 or 1)
	arg_156_0:managedTween(LeanTween.alphaCanvas, function()
		if not arg_156_1 then
			setActive(arg_156_0.blackLayer, false)
		end

		existCall(arg_156_2)
	end, GetComponent(arg_156_0.blackLayer, typeof(CanvasGroup)), arg_156_1 and 1 or 0, var_156_0.time):setDelay(var_156_0.delay)
end

function var_0_0.RegisterOrbits(arg_158_0, arg_158_1)
	arg_158_0 = arg_158_0.scene
	arg_158_0.orbits = {
		original = arg_158_1.m_Orbits
	}
	arg_158_0.orbits.current = _.range(3):map(function(arg_159_0)
		local var_159_0 = arg_158_0.orbits.original[arg_159_0 - 1]

		return Cinemachine.CinemachineFreeLook.Orbit.New(var_159_0.m_Height, var_159_0.m_Radius)
	end)
	arg_158_0.surroudCamera = arg_158_1
end

function var_0_0.SetCameraObrits(arg_160_0)
	local var_160_0 = arg_160_0.surroudCamera

	if not var_160_0 then
		return
	end

	local var_160_1 = arg_160_0.orbits.original[1]

	for iter_160_0 = 0, #arg_160_0.orbits.current - 1 do
		local var_160_2 = arg_160_0.orbits.current[iter_160_0 + 1]
		local var_160_3 = arg_160_0.orbits.original[iter_160_0]

		var_160_2.m_Height = math.lerp(var_160_1.m_Height, var_160_3.m_Height, arg_160_0.pinchValue)
		var_160_2.m_Radius = var_160_3.m_Radius * arg_160_0.pinchValue
	end

	var_160_0.m_Orbits = arg_160_0.orbits.current
end

function var_0_0.RevertCameraOrbit(arg_161_0)
	arg_161_0 = arg_161_0.scene

	local var_161_0 = arg_161_0.surroudCamera

	if not var_161_0 then
		return
	end

	for iter_161_0 = 0, #arg_161_0.orbits.current - 1 do
		local var_161_1 = arg_161_0.orbits.current[iter_161_0 + 1]
		local var_161_2 = arg_161_0.orbits.original[iter_161_0]

		var_161_1.m_Height = var_161_2.m_Height
		var_161_1.m_Radius = var_161_2.m_Radius
	end

	var_161_0.m_Orbits = arg_161_0.orbits.current
	arg_161_0.surroudCamera = nil
end

function var_0_0.ActiveStateCamera(arg_162_0, arg_162_1, arg_162_2)
	local var_162_0 = {
		base = function(arg_163_0)
			arg_162_0:RegisterCameraBlendFinished(arg_162_0.cameras[var_0_0.CAMERA.POV], arg_163_0)
			arg_162_0:ActiveCamera(arg_162_0.cameras[var_0_0.CAMERA.POV])
		end,
		watch = function(arg_164_0)
			assert(arg_162_0.apartment)
			arg_162_0.ladyDict[arg_162_0.apartment:GetConfigID()]:SetCameraLady()
			arg_162_0:RegisterCameraBlendFinished(arg_162_0.cameras[var_0_0.CAMERA.ROLE], arg_164_0)
			arg_162_0:ActiveCamera(arg_162_0.cameras[var_0_0.CAMERA.ROLE])
		end,
		walk = function(arg_165_0)
			arg_162_0:RegisterCameraBlendFinished(arg_162_0.cameras[var_0_0.CAMERA.POV], arg_165_0)
			arg_162_0:ActiveCamera(arg_162_0.cameras[var_0_0.CAMERA.POV])
		end,
		ik = function(arg_166_0)
			arg_166_0()
		end,
		gift = function(arg_167_0)
			assert(arg_162_0.apartment)
			arg_162_0.ladyDict[arg_162_0.apartment:GetConfigID()]:SetCameraLady()
			arg_162_0:RegisterCameraBlendFinished(arg_162_0.cameras[var_0_0.CAMERA.GIFT], arg_167_0)
			arg_162_0:ActiveCamera(arg_162_0.cameras[var_0_0.CAMERA.GIFT])
		end,
		standby = function(arg_168_0)
			assert(arg_162_0.apartment)
			arg_162_0.ladyDict[arg_162_0.apartment:GetConfigID()]:SetCameraLady()

			arg_162_0.cameras[var_0_0.CAMERA.ROLE2].transform.position = arg_162_0.cameraRole.transform.position

			arg_162_0:RegisterCameraBlendFinished(arg_162_0.cameras[var_0_0.CAMERA.ROLE2], arg_168_0)
			arg_162_0:ActiveCamera(arg_162_0.cameras[var_0_0.CAMERA.ROLE2])
		end,
		talk = function(arg_169_0)
			assert(arg_162_0.apartment)
			arg_162_0.ladyDict[arg_162_0.apartment:GetConfigID()]:SetCameraLady()
			arg_162_0:RegisterCameraBlendFinished(arg_162_0.cameras[var_0_0.CAMERA.TALK], arg_169_0)
			arg_162_0:ActiveCamera(arg_162_0.cameras[var_0_0.CAMERA.TALK])
		end
	}
	local var_162_1 = {}

	table.insert(var_162_1, function(arg_170_0)
		switch(arg_162_1, var_162_0, arg_170_0, arg_170_0)
	end)
	seriesAsync(var_162_1, arg_162_2)
end

function var_0_0.GetSceneItem(arg_171_0, arg_171_1)
	local var_171_0

	if string.find(arg_171_1, "fbx/") == 1 then
		var_171_0 = arg_171_0.modelRoot:Find(arg_171_1)
	elseif string.find(arg_171_1, "FurnitureSlots/") == 1 then
		arg_171_1 = string.gsub(arg_171_1, "^FurnitureSlots/", "", 1)
		var_171_0 = arg_171_0.slotRoot:Find(arg_171_1)
	end

	if not var_171_0 then
		warning(string.format("Missing scene item path: %s", arg_171_1))
	end

	return var_171_0
end

function var_0_0.SetIKStatus(arg_172_0, arg_172_1, arg_172_2)
	local var_172_0 = arg_172_0

	warning("Set IKStatus " .. (arg_172_1.id or "NIL"))

	arg_172_0.scene.enableIKTip = true

	setActive(arg_172_0.ladyCollider, false)
	_.each(arg_172_0.ladyTouchColliders, function(arg_173_0)
		setActive(arg_173_0, true)
	end)
	table.clear(arg_172_0.readyIKLayers)

	arg_172_0.scene.blockIK = nil

	local var_172_1 = _.map(arg_172_1.ik_id, function(arg_174_0)
		return arg_174_0[1]
	end)

	table.Foreach(var_172_1, function(arg_175_0, arg_175_1)
		local var_175_0 = Dorm3dIK.New({
			configId = arg_175_1
		})

		table.insert(arg_172_0.readyIKLayers, {
			ikData = var_175_0
		})

		arg_172_0.cacheIKInfos[var_175_0] = {}

		local var_175_1 = var_175_0:GetControllerPath()
		local var_175_2 = arg_172_0.ladyIKRoot:Find(var_175_1):GetComponent(typeof(RootMotion.FinalIK.IKExecutionOrder))
		local var_175_3 = {}

		table.IpairsCArray(var_175_2.IKComponents, function(arg_176_0, arg_176_1)
			var_175_3[arg_176_0 + 1] = arg_176_1:GetIKSolver()
		end)

		arg_172_0.cacheIKInfos[var_175_0].solvers = var_175_3

		local var_175_4 = _.map(var_175_3, function(arg_177_0)
			return arg_177_0.IKPositionWeight
		end)

		arg_172_0.cacheIKInfos[var_175_0].weights = var_175_4
	end)

	local var_172_2 = _.map(arg_172_1.touch_data, function(arg_178_0)
		return arg_178_0[1]
	end)

	table.Foreach(var_172_2, function(arg_179_0, arg_179_1)
		local var_179_0 = pg.dorm3d_ik_touch[arg_179_1]

		if #var_179_0.scene_item == 0 then
			return
		end

		local var_179_1 = arg_172_0:GetSceneItem(var_179_0.scene_item)

		if not var_179_1 then
			warning(string.format("dorm3d_ik_touch:%d without scene_item:%s", arg_179_1, var_179_0.scene_item))

			return
		end

		if IsNil(GetComponent(var_179_1, typeof(UnityEngine.Collider))) then
			go(var_179_1):AddComponent(typeof(UnityEngine.BoxCollider))
		end

		local var_179_2 = GetOrAddComponent(var_179_1, typeof(EventTriggerListener))

		var_179_2.enabled = true

		var_179_2:AddPointClickFunc(function()
			arg_172_0.scene.blockIK = true

			local var_180_0 = arg_172_1.touch_data[arg_179_0]
			local var_180_1, var_180_2, var_180_3 = unpack(var_180_0)

			arg_172_0:TouchModeAction(var_172_0, unpack(var_180_3))(function()
				arg_172_0.scene.enableIKTip = true

				arg_172_0:ResetIKTipTimer()

				arg_172_0.scene.blockIK = nil
			end)
		end)
	end)

	arg_172_0.camBrain.enabled = false

	if arg_172_0.cameras[var_0_0.CAMERA.IK_WATCH] then
		setActive(arg_172_0.cameras[var_0_0.CAMERA.IK_WATCH], false)

		arg_172_0.cameras[var_0_0.CAMERA.IK_WATCH] = nil
	end

	local var_172_3 = arg_172_0.cameraRoot:Find(arg_172_1.ik_camera)

	assert(var_172_3, "Missing IKCamera")

	arg_172_0.cameras[var_0_0.CAMERA.IK_WATCH] = var_172_3

	arg_172_0:ActiveCamera(arg_172_0.cameras[var_0_0.CAMERA.IK_WATCH])

	arg_172_0.camBrain.enabled = true

	local var_172_4 = var_172_3:GetComponent(typeof(Cinemachine.CinemachineFreeLook))

	if var_172_4 then
		arg_172_0:RegisterOrbits(var_172_4)
	end

	arg_172_0:SettingHeadAimIK(arg_172_0, arg_172_0.ikConfig.head_track)
	arg_172_0:ResetIKTipTimer()
	arg_172_0:SwitchAnim(arg_172_1.character_action)

	local var_172_5 = arg_172_1.enter_scene_anim
	local var_172_6 = {}

	if var_172_5 and #var_172_5 > 0 then
		table.Ipairs(var_172_5, function(arg_182_0, arg_182_1)
			arg_172_0.scene:PlaySceneItemAnim(arg_182_1[1], arg_182_1[2])
			table.insert(var_172_6, arg_182_1[1])
		end)
	end

	arg_172_0.scene:ResetSceneItemAnimators(var_172_6)
	onNextTick(function()
		local var_183_0 = arg_172_0.furnitures:Find(arg_172_1.character_position)

		arg_172_0.lady.position = var_183_0:Find("StayPoint").position
		arg_172_0.lady.rotation = var_183_0:Find("StayPoint").rotation

		arg_172_0:EnableCloth(false)
		arg_172_0:EnableCloth(arg_172_1.use_cloth, arg_172_1.cloth_colliders)
		existCall(arg_172_2)
	end)
end

function var_0_0.ExitIKStatus(arg_184_0, arg_184_1, arg_184_2)
	local var_184_0 = arg_184_0

	arg_184_0.scene.enableIKTip = false

	setActive(arg_184_0.ladyCollider, true)
	_.each(arg_184_0.ladyTouchColliders, function(arg_185_0)
		setActive(arg_185_0, false)
	end)
	arg_184_0:ResetActiveIKs(arg_184_0)
	table.clear(arg_184_0.readyIKLayers)
	table.clear(arg_184_0.cacheIKInfos)
	table.clear(arg_184_0.activeIKLayers)
	table.clear(arg_184_0.holdingStatus)
	eachChild(arg_184_0.ladyIKRoot, function(arg_186_0)
		setActive(arg_186_0, false)
	end)
	setActive(arg_184_0:GetIKTipsRootTF(), false)

	local var_184_1 = _.map(arg_184_1.touch_data or {}, function(arg_187_0)
		return arg_187_0[1]
	end)

	table.Foreach(var_184_1, function(arg_188_0, arg_188_1)
		local var_188_0 = pg.dorm3d_ik_touch[arg_188_1]

		if #var_188_0.scene_item == 0 then
			return
		end

		local var_188_1 = arg_184_0.modelRoot:Find(var_188_0.scene_item)

		if not var_188_1 then
			return
		end

		local var_188_2 = GetOrAddComponent(var_188_1, typeof(EventTriggerListener))

		var_188_2:ClearEvents()

		var_188_2.enabled = false
	end)
	arg_184_0:RevertCameraOrbit()
	setActive(arg_184_0.cameras[var_0_0.CAMERA.IK_WATCH], false)

	arg_184_0.cameras[var_0_0.CAMERA.IK_WATCH] = nil

	arg_184_0:EnableCloth(false)
	arg_184_0:ResetHeadAimIK(arg_184_0)
	arg_184_0:SwitchAnim(arg_184_1.character_action)
	arg_184_0.scene:ResetSceneItemAnimators()
	onNextTick(function()
		if arg_184_1.character_position then
			arg_184_0.ladyActiveZone = arg_184_1.character_position
		else
			arg_184_0.ladyActiveZone = arg_184_0.ladyBaseZone
		end

		arg_184_0:ChangeCharacterPosition()
		arg_184_0:TriggerLadyDistance()
		arg_184_0:CheckInSector()
		existCall(arg_184_2)
	end)
end

function var_0_0.EnableIKLayer(arg_190_0, arg_190_1, arg_190_2)
	warning("ENABLEIK", arg_190_2:GetConfigID())

	local var_190_0 = arg_190_2:GetControllerPath()
	local var_190_1 = arg_190_1.ladyIKRoot:Find(var_190_0):GetComponent(typeof(RootMotion.FinalIK.IKExecutionOrder))
	local var_190_2 = tf(var_190_1):Find("Container")
	local var_190_3 = {
		ikData = arg_190_2,
		list = var_190_1
	}

	if not arg_190_1.holdingStatus[arg_190_2] then
		var_190_3.rect = arg_190_2:GetRect()

		local var_190_4 = arg_190_2:GetActionTriggerParams()

		if var_190_4[1] == Dorm3dIK.ACTION_TRIGGER.RELEASE_ON_TARGET or var_190_4[1] == Dorm3dIK.ACTION_TRIGGER.TOUCH_TARGET then
			var_190_3.triggerRect = arg_190_2:GetTriggerRect()
		end

		local var_190_5 = var_190_2:Find("SubTargets")
		local var_190_6 = {}

		assert(var_190_5)

		local var_190_7 = arg_190_2:GetSubTargets()
		local var_190_8 = arg_190_2:GetPlaneRotations()
		local var_190_9 = arg_190_2:GetPlaneScales()

		table.Foreach(var_190_7, function(arg_191_0, arg_191_1)
			local var_191_0 = var_190_5:Find(arg_191_1[1])
			local var_191_1 = var_191_0:Find("Plane")

			if var_190_8[arg_191_0] then
				var_191_1.localRotation = var_190_8[arg_191_0]
				var_191_1.localScale = var_190_9[arg_191_0]
			end

			local var_191_2 = var_191_0:Find("Target")
			local var_191_3 = var_0_0.TransformMesh(var_191_1:GetComponent(typeof(UnityEngine.MeshCollider)))
			local var_191_4 = arg_190_1.ladyBoneMaps[arg_191_1[1]]

			var_191_3.origin = var_191_4.position

			local var_191_5 = var_190_3.rect
			local var_191_6 = Vector2.New(var_191_5.center.x / var_191_5.width, var_191_5.center.y / var_191_5.height)

			var_191_1.position = var_0_0.GetPostionByRatio(var_191_3, var_191_6)
			var_191_2.position = var_191_4.position

			local var_191_7 = {
				planeData = var_191_3,
				target = var_191_2,
				useOffset = tobool(arg_191_1)
			}

			table.insert(var_190_6, var_191_7)
		end)

		var_190_3.subPlanes = var_190_6

		setActive(var_190_1, true)
	else
		var_190_3 = arg_190_1.holdingStatus[arg_190_2].ikHandler
	end

	if #arg_190_2:GetHeadTrackPath() > 0 then
		arg_190_0:SettingHeadAimIK(arg_190_1, {
			2,
			arg_190_2:GetHeadTrackPath()
		}, true)
	end

	local var_190_10 = arg_190_2:GetTriggerFaceAnim()

	if #var_190_10 > 0 then
		arg_190_0:PlayFaceAnim(var_190_10)
	end

	setActive(arg_190_0:GetIKHandTF(), true)
	eachChild(arg_190_0:GetIKHandTF(), function(arg_192_0)
		setActive(arg_192_0, false)
	end)
	arg_190_0:StopIKHandTimer()
	setActive(arg_190_0:GetIKHandTF():Find("Begin"), true)

	arg_190_1.ikHandTimer = Timer.New(function()
		setActive(arg_190_0:GetIKHandTF():Find("Begin"), false)
		setActive(arg_190_0:GetIKHandTF():Find("Normal"), true)
	end, 0.5, 1)

	arg_190_1.ikHandTimer:Start()

	arg_190_1.ikNextCheckStamp = Time.time + var_0_0.IK_STATUS_DELTA

	arg_190_0:emit(var_0_0.ON_IK_STATUS_CHANGED, arg_190_2:GetConfigID(), var_0_0.IK_STATUS.BEGIN)
	pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataTouch(arg_190_0.apartment.configId, arg_190_0.apartment.level, arg_190_1.ikConfig.character_action, arg_190_2:GetTriggerParams()[2], arg_190_0.room:GetConfigID()))

	return var_190_3
end

function var_0_0.DeactiveIKLayer(arg_194_0, arg_194_1)
	if #arg_194_1:GetHeadTrackPath() > 0 then
		arg_194_0:SettingHeadAimIK(arg_194_0, arg_194_0.ikConfig.head_track)
	end

	arg_194_0:StopIKHandTimer()
	setActive(arg_194_0:GetIKHandTF():Find("Begin"), false)
	setActive(arg_194_0:GetIKHandTF():Find("Normal"), false)
	setActive(arg_194_0:GetIKHandTF():Find("End"), true)

	arg_194_0.ikHandTimer = Timer.New(function()
		setActive(arg_194_0:GetIKHandTF():Find("End"), false)
		setActive(arg_194_0:GetIKHandTF(), false)
	end, 0.5, 1)

	arg_194_0.ikHandTimer:Start()
end

function var_0_0.StopIKHandTimer(arg_196_0)
	if not arg_196_0.ikHandTimer then
		return
	end

	arg_196_0.ikHandTimer:Stop()

	arg_196_0.ikHandTimer = nil
end

function var_0_0.RevertIKLayer(arg_197_0, arg_197_1, arg_197_2)
	seriesAsync({
		function(arg_198_0)
			if arg_197_1 >= 999 then
				return arg_198_0()
			end

			arg_197_0:PlayIKRevert(arg_197_0, arg_197_1, arg_198_0)
		end,
		arg_197_2
	})
end

function var_0_0.RevertAllIKLayer(arg_199_0, arg_199_1, arg_199_2)
	table.insertto(arg_199_0.activeIKLayers, _.keys(arg_199_0.holdingStatus))
	table.clear(arg_199_0.holdingStatus)
	arg_199_0.RevertIKLayer(arg_199_0, arg_199_1, arg_199_2)
end

function var_0_0.PlayIKRevert(arg_200_0, arg_200_1, arg_200_2, arg_200_3)
	local var_200_0 = Time.time

	function arg_200_0.ikRevertHandler()
		local var_201_0 = Time.time - var_200_0

		_.each(arg_200_1.activeIKLayers, function(arg_202_0)
			local var_202_0 = 1

			if arg_200_2 > 0 then
				var_202_0 = var_201_0 / arg_200_2
			end

			local var_202_1 = arg_200_1.cacheIKInfos[arg_202_0].solvers
			local var_202_2 = arg_200_1.cacheIKInfos[arg_202_0].weights

			table.Foreach(var_202_1, function(arg_203_0, arg_203_1)
				arg_203_1.IKPositionWeight = math.lerp(var_202_2[arg_203_0], 0, var_202_0)
			end)
		end)

		if var_201_0 >= arg_200_2 then
			arg_200_0:ResetActiveIKs(arg_200_1)

			arg_200_0.ikRevertHandler = nil

			existCall(arg_200_3)
		end
	end

	arg_200_0.ikRevertHandler()
end

function var_0_0.ResetActiveIKs(arg_204_0, arg_204_1)
	table.insertto(arg_204_0.activeIKLayers, _.keys(arg_204_0.holdingStatus))
	table.clear(arg_204_0.holdingStatus)
	_.each(arg_204_1.activeIKLayers, function(arg_205_0)
		local var_205_0 = arg_205_0:GetControllerPath()
		local var_205_1 = arg_204_1.ladyIKRoot:Find(var_205_0):GetComponent(typeof(RootMotion.FinalIK.IKExecutionOrder))

		setActive(var_205_1, false)

		local var_205_2 = arg_204_1.cacheIKInfos[arg_205_0].solvers
		local var_205_3 = arg_204_1.cacheIKInfos[arg_205_0].weights

		table.Foreach(var_205_2, function(arg_206_0, arg_206_1)
			arg_206_1.IKPositionWeight = var_205_3[arg_206_0]
		end)
	end)
	table.clear(arg_204_1.activeIKLayers)
end

function var_0_0.PlayIKAction(arg_207_0, arg_207_1)
	warning("Trigger IK", arg_207_1:GetConfigID())
	arg_207_0:OnTriggerIK(arg_207_1:GetConfigID())
	arg_207_0:emit(var_0_0.ON_IK_STATUS_CHANGED, arg_207_1:GetConfigID(), var_0_0.IK_STATUS.TRIGGER)
end

function var_0_0.ResetIKTipTimer(arg_208_0)
	if not arg_208_0.scene.enableIKTip then
		return
	end

	arg_208_0.nextTipIKTime = Time.time + var_0_0.IK_TIP_WAIT_TIME
end

function var_0_0.EnableHeadIK(arg_209_0, arg_209_1)
	arg_209_0.ladyHeadIKComp.enableIk = arg_209_1
end

function var_0_0.SettingHeadAimIK(arg_210_0, arg_210_1, arg_210_2, arg_210_3)
	local var_210_0

	if arg_210_2[1] == 1 then
		var_210_0 = arg_210_0.mainCameraTF:Find("AimTarget")
	elseif arg_210_2[1] == 2 then
		table.IpairsCArray(arg_210_1.lady:GetComponentsInChildren(typeof(Transform), true), function(arg_211_0, arg_211_1)
			if arg_211_1.name ~= arg_210_2[2] then
				return
			end

			var_210_0 = arg_211_1
		end)
	end

	arg_210_1.ladyHeadIKComp.AimTarget = var_210_0

	if not arg_210_3 and arg_210_2[3] then
		arg_210_1.ladyHeadIKComp.BodyWeight = arg_210_2[3]
	end

	if not arg_210_3 and arg_210_2[4] then
		arg_210_1.ladyHeadIKComp.HeadWeight = arg_210_2[4]
	end
end

function var_0_0.ResetHeadAimIK(arg_212_0, arg_212_1)
	arg_212_1.ladyHeadIKComp.AimTarget = arg_212_0.mainCameraTF:Find("AimTarget")
	arg_212_1.ladyHeadIKComp.HeadWeight = arg_212_1.ladyHeadIKData.HeadWeight
	arg_212_1.ladyHeadIKComp.BodyWeight = arg_212_1.ladyHeadIKData.BodyWeight
end

function var_0_0.HideCharacter(arg_213_0, arg_213_1)
	local function var_213_0(arg_214_0)
		arg_214_0:HideCharacterBylayer()
	end

	for iter_213_0, iter_213_1 in pairs(arg_213_0.ladyDict) do
		if iter_213_0 ~= arg_213_1 then
			var_213_0(iter_213_1)
		end
	end
end

function var_0_0.RevertCharacter(arg_215_0, arg_215_1)
	local function var_215_0(arg_216_0)
		arg_216_0:RevertCharacterBylayer()
	end

	for iter_215_0, iter_215_1 in pairs(arg_215_0.ladyDict) do
		if iter_215_0 ~= arg_215_1 then
			var_215_0(iter_215_1)
		end
	end
end

function var_0_0.HideCharacterBylayer(arg_217_0)
	local var_217_0 = "Bip001"
	local var_217_1 = arg_217_0.lady:Find("all")

	for iter_217_0 = 0, var_217_1.childCount - 1 do
		local var_217_2 = var_217_1:GetChild(iter_217_0)

		if var_217_2.name ~= var_217_0 then
			pg.ViewUtils.SetLayer(var_217_2, Layer.Environment3D)
		end
	end

	if arg_217_0.tfPendintItem then
		pg.ViewUtils.SetLayer(arg_217_0.tfPendintItem, Layer.Environment3D)
	end

	if arg_217_0.ladyWatchFloat then
		pg.ViewUtils.SetLayer(arg_217_0.ladyWatchFloat, Layer.Environment3D)
	end

	GetComponent(arg_217_0.lady, "BLHXCharacterPropertiesController").enabled = false
end

function var_0_0.RevertCharacterBylayer(arg_218_0)
	local var_218_0 = "Bip001"
	local var_218_1 = arg_218_0.lady:Find("all")

	for iter_218_0 = 0, var_218_1.childCount - 1 do
		local var_218_2 = var_218_1:GetChild(iter_218_0)

		if var_218_2.name ~= var_218_0 then
			pg.ViewUtils.SetLayer(var_218_2, Layer.Default)
		end
	end

	if arg_218_0.tfPendintItem then
		pg.ViewUtils.SetLayer(arg_218_0.tfPendintItem, Layer.Default)
	end

	if arg_218_0.ladyWatchFloat then
		pg.ViewUtils.SetLayer(arg_218_0.ladyWatchFloat, Layer.Default)
	end

	GetComponent(arg_218_0.lady, "BLHXCharacterPropertiesController").enabled = true
end

function var_0_0.EnterFurnitureWatchMode(arg_219_0)
	arg_219_0:SetAllBlackbloardValue("inLockLayer", true)
	arg_219_0:HideCharacter()
end

function var_0_0.ExitFurnitureWatchMode(arg_220_0)
	arg_220_0:HideFurnitureSlots()

	local var_220_0 = arg_220_0.cameras[var_0_0.CAMERA.POV]

	seriesAsync({
		function(arg_221_0)
			arg_220_0:emit(var_0_0.SHOW_BLOCK)
			arg_220_0:ShowBlackScreen(true, arg_221_0)
		end,
		function(arg_222_0)
			arg_220_0:RevertCharacter()
			arg_220_0:SetAllBlackbloardValue("inLockLayer", false)
			arg_220_0:RegisterCameraBlendFinished(var_220_0, arg_222_0)
			arg_220_0:ActiveCamera(var_220_0)
		end,
		function(arg_223_0)
			arg_220_0:ShowBlackScreen(false, arg_223_0)
		end
	}, function()
		arg_220_0:emit(var_0_0.HIDE_BLOCK)
	end)
	arg_220_0:RefreshSlots()
end

function var_0_0.SwitchFurnitureZone(arg_225_0, arg_225_1)
	local var_225_0 = arg_225_0:GetFurnitureByName(arg_225_1:GetWatchCameraName()):Find("FurnitureWatch Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))

	if arg_225_0.cameraFurnitureWatch and arg_225_0.cameraFurnitureWatch ~= var_225_0 then
		arg_225_0:UnRegisterCameraBlendFinished(arg_225_0.cameraFurnitureWatch)
		setActive(arg_225_0.cameraFurnitureWatch, false)
	end

	arg_225_0.cameraFurnitureWatch = var_225_0
	arg_225_0.cameras[var_0_0.CAMERA.FURNITURE_WATCH] = arg_225_0.cameraFurnitureWatch

	arg_225_0:RegisterCameraBlendFinished(arg_225_0.cameraFurnitureWatch, function()
		arg_225_0:emit(var_0_0.HIDE_BLOCK)
	end)
	arg_225_0:emit(var_0_0.SHOW_BLOCK)
	arg_225_0:ActiveCamera(arg_225_0.cameraFurnitureWatch)
end

function var_0_0.HideFurnitureSlots(arg_227_0)
	if arg_227_0.displaySlots then
		arg_227_0:UpdateDisplaySlots({})
		table.Foreach(arg_227_0.displaySlots, function(arg_228_0, arg_228_1)
			local var_228_0 = arg_228_1.trans

			if IsNil(var_228_0:Find("Selector")) then
				return
			end

			setActive(var_228_0:Find("Selector"), false)
		end)

		arg_227_0.displaySlots = nil
	end
end

function var_0_0.DisplayFurnitureSlots(arg_229_0, arg_229_1)
	arg_229_0:HideFurnitureSlots()

	arg_229_0.displaySlots = {}

	_.each(arg_229_1, function(arg_230_0)
		arg_229_0.displaySlots[arg_230_0] = arg_229_0.slotDict[arg_230_0]

		if not arg_229_0.displaySlots[arg_230_0] then
			errorMsg("Slot " .. arg_230_0 .. " Not Binding Scene Object")

			return
		end

		local var_230_0 = arg_229_0.displaySlots[arg_230_0].trans

		if var_230_0:Find("Selector") then
			setActive(var_230_0:Find("Selector"), true)
		end
	end)
end

function var_0_0.UpdateDisplaySlots(arg_231_0, arg_231_1)
	table.Foreach(arg_231_0.displaySlots, function(arg_232_0, arg_232_1)
		local var_232_0 = arg_232_1.trans

		if not IsNil(var_232_0:Find("Selector")) then
			setActive(var_232_0:Find("Selector/Normal"), arg_231_1[arg_232_0] == 0)
			setActive(var_232_0:Find("Selector/Active"), arg_231_1[arg_232_0] == 1)
			setActive(var_232_0:Find("Selector/Ban"), arg_231_1[arg_232_0] == 2)
		end

		local var_232_1 = arg_231_0.slotDict[arg_232_0].model
		local var_232_2 = arg_231_0.slotDict[arg_232_0].displayModelName

		if var_232_2 and var_232_2 ~= "" then
			var_232_1 = var_232_0:GetChild(var_232_0.childCount - 1)
		end

		local function var_232_3(arg_233_0, arg_233_1)
			local var_233_0 = arg_233_0:GetComponentsInChildren(typeof(Renderer), true)

			table.IpairsCArray(var_233_0, function(arg_234_0, arg_234_1)
				local var_234_0 = arg_234_1.material

				if var_234_0 and var_234_0:HasProperty("_FinalTint") then
					var_234_0:SetColor("_FinalTint", arg_233_1)
				end
			end)
		end

		if var_232_1 then
			if arg_231_1[arg_232_0] == 1 then
				var_232_3(var_232_1, Color.NewHex("3F83AE73"))
			else
				var_232_3(var_232_1, Color.New(0, 0, 0, 0))
			end
		end
	end)
end

function var_0_0.EnterPhotoMode(arg_235_0, arg_235_1, arg_235_2)
	arg_235_0:SetAllBlackbloardValue("inLockLayer", true)
	arg_235_0:emit(var_0_0.ENABLE_SCENEBLOCK, true)
	seriesAsync({
		function(arg_236_0)
			arg_235_0:TempHideUI(true, arg_236_0)
		end,
		function(arg_237_0)
			arg_235_0:ShowBlackScreen(true, arg_237_0)
		end,
		function(arg_238_0)
			local var_238_0 = arg_235_0.ladyDict[arg_235_0.apartment:GetConfigID()]

			arg_235_0:SwitchAnim(arg_235_2)
			var_238_0.ladyAnimator:Update(0)
			var_238_0:ResetCharPoint(arg_235_1:GetWatchCameraName())
			arg_235_0:SyncInterestTransform(var_238_0)
			setActive(var_238_0.ladySafeCollider, true)

			local var_238_1 = arg_235_0.cameras[var_0_0.CAMERA.PHOTO]
			local var_238_2 = var_238_1.m_XAxis

			var_238_2.Value = 180
			var_238_1.m_XAxis = var_238_2

			local var_238_3 = var_238_1.m_YAxis

			var_238_3.Value = 0.7
			var_238_1.m_YAxis = var_238_3
			arg_235_0.pinchValue = 1

			arg_235_0:RegisterOrbits(arg_235_0.cameras[var_0_0.CAMERA.PHOTO])
			arg_235_0:SetCameraObrits()
			arg_235_0:RegisterCameraBlendFinished(var_238_1, arg_238_0)
			arg_235_0:ActiveCamera(var_238_1)
		end,
		function(arg_239_0)
			arg_235_0:ShowBlackScreen(false, arg_239_0)
		end
	}, function()
		arg_235_0:EnableJoystick(true)
	end)
end

function var_0_0.ExitPhotoMode(arg_241_0)
	arg_241_0:emit(var_0_0.SHOW_BLOCK)
	arg_241_0:EnableJoystick(false)
	seriesAsync({
		function(arg_242_0)
			arg_241_0:ShowBlackScreen(true, arg_242_0)
		end,
		function(arg_243_0)
			arg_241_0:RevertCameraOrbit()

			local var_243_0 = arg_241_0.ladyDict[arg_241_0.apartment:GetConfigID()]

			arg_241_0:SwitchAnim(var_0_0.ANIM.IDLE)
			setActive(var_243_0.ladySafeCollider, false)
			onNextTick(function()
				arg_241_0:ChangeCharacterPosition()
			end)

			if arg_241_0.contextData.photoFreeMode then
				arg_241_0:EnablePOVLayer(false)
				setActive(arg_241_0.restrictedBox, false)

				arg_241_0.contextData.photoFreeMode = nil
			end

			local var_243_1 = arg_241_0.cameras[var_0_0.CAMERA.POV]

			arg_241_0:RegisterCameraBlendFinished(var_243_1, arg_243_0)
			arg_241_0:ActiveCamera(var_243_1)
		end,
		function(arg_245_0)
			arg_241_0:ShowBlackScreen(false, arg_245_0)
		end
	}, function()
		arg_241_0:RefreshSlots()
		arg_241_0:SetAllBlackbloardValue("inLockLayer", false)
		arg_241_0:emit(var_0_0.HIDE_BLOCK)
		arg_241_0:emit(var_0_0.ENABLE_SCENEBLOCK, false)
		arg_241_0:TempHideUI(false)
	end)
end

function var_0_0.SwitchCameraZone(arg_247_0, arg_247_1, arg_247_2, arg_247_3)
	arg_247_0:emit(var_0_0.SHOW_BLOCK)
	seriesAsync({
		function(arg_248_0)
			arg_247_0:ShowBlackScreen(true, arg_248_0)
		end,
		function(arg_249_0)
			arg_247_0:SwitchAnim(arg_247_2)
			onNextTick(function()
				arg_247_0:ResetCharPoint(arg_247_1:GetWatchCameraName())
				arg_247_0:SyncInterestTransform(arg_247_0)

				if arg_247_0.contextData.photoFreeMode then
					arg_247_0.camBrain.enabled = false

					arg_247_0:SwitchPhotoCamera()

					arg_247_0.camBrain.enabled = true

					onDelayTick(function()
						arg_247_0.camBrain.enabled = false

						arg_247_0:SwitchPhotoCamera()

						arg_247_0.camBrain.enabled = true
					end, 0.1)
				end

				arg_249_0()
			end)
		end,
		function(arg_252_0)
			arg_247_0:ShowBlackScreen(false, arg_252_0)
		end
	}, function()
		arg_247_0:emit(var_0_0.HIDE_BLOCK)
		existCall(arg_247_3)
	end)
end

function var_0_0.SwitchPhotoCamera(arg_254_0)
	if not arg_254_0.contextData.photoFreeMode then
		arg_254_0:EnableJoystick(false)
		arg_254_0:EnablePOVLayer(true)
		setActive(arg_254_0.restrictedBox, true)

		local var_254_0 = arg_254_0.cameras[var_0_0.CAMERA.PHOTO_FREE]

		var_254_0.transform.position = arg_254_0.mainCameraTF.position

		local var_254_1 = arg_254_0.cameras[var_0_0.CAMERA.PHOTO_FREE]:Find("PhotoFree Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera)):GetCinemachineComponent(Cinemachine.CinemachineCore.Stage.Aim)
		local var_254_2 = arg_254_0.mainCameraTF.rotation:ToEulerAngles()
		local var_254_3 = var_254_1.m_HorizontalAxis

		var_254_3.Value = var_254_2.y
		var_254_1.m_HorizontalAxis = var_254_3

		local var_254_4 = var_254_1.m_VerticalAxis

		var_254_4.Value = arg_254_0:GetNearestAngle(var_254_2.x, var_254_4.m_MinValue, var_254_4.m_MaxValue)
		var_254_1.m_VerticalAxis = var_254_4

		local var_254_5 = math.InverseLerp(arg_254_0.restrictedHeightRange[1], arg_254_0.restrictedHeightRange[2], var_254_0.position.y)

		arg_254_0:emit(Dorm3dPhotoMediator.CAMERA_LIFT_CHANGED, var_254_5)
		arg_254_0:ActiveCamera(arg_254_0.cameras[var_0_0.CAMERA.PHOTO_FREE])
	else
		arg_254_0:EnableJoystick(true)
		arg_254_0:EnablePOVLayer(false)
		setActive(arg_254_0.restrictedBox, false)
		arg_254_0:ActiveCamera(arg_254_0.cameras[var_0_0.CAMERA.PHOTO])
	end

	arg_254_0.contextData.photoFreeMode = not arg_254_0.contextData.photoFreeMode
end

function var_0_0.SetPhotoCameraHeight(arg_255_0, arg_255_1)
	local var_255_0 = math.lerp(arg_255_0.restrictedHeightRange[1], arg_255_0.restrictedHeightRange[2], arg_255_1)
	local var_255_1 = arg_255_0.cameras[var_0_0.CAMERA.PHOTO_FREE]

	var_255_1:GetComponent(typeof(UnityEngine.CharacterController)):Move(Vector3.New(0, var_255_0 - var_255_1.position.y, 0))
	onNextTick(function()
		local var_256_0 = math.InverseLerp(arg_255_0.restrictedHeightRange[1], arg_255_0.restrictedHeightRange[2], var_255_1.position.y)

		arg_255_0:emit(Dorm3dPhotoMediator.CAMERA_LIFT_CHANGED, var_256_0)
	end)
end

function var_0_0.ResetPhotoCameraPosition(arg_257_0)
	local var_257_0 = arg_257_0.cameras[var_0_0.CAMERA.PHOTO]
	local var_257_1 = var_257_0.m_XAxis

	var_257_1.Value = 180
	var_257_0.m_XAxis = var_257_1

	local var_257_2 = var_257_0.m_YAxis

	var_257_2.Value = 0.7
	var_257_0.m_YAxis = var_257_2
end

function var_0_0.ResetCharPoint(arg_258_0, arg_258_1)
	local var_258_0 = arg_258_0.furnitures:Find(arg_258_1 .. "/StayPoint")

	arg_258_0.lady.position = var_258_0.position
	arg_258_0.lady.rotation = var_258_0.rotation
end

function var_0_0.GetNearestAngle(arg_259_0, arg_259_1, arg_259_2, arg_259_3)
	if arg_259_3 < arg_259_2 then
		arg_259_3 = arg_259_3 + 360
	end

	if arg_259_2 <= arg_259_1 and arg_259_1 <= arg_259_3 then
		return arg_259_1
	end

	local var_259_0 = (arg_259_2 + arg_259_3) / 2

	arg_259_1 = var_259_0 - Mathf.DeltaAngle(arg_259_1, var_259_0)
	arg_259_1 = math.clamp(arg_259_1, arg_259_2, arg_259_3)

	return arg_259_1
end

function var_0_0.PlayTimeline(arg_260_0, arg_260_1, arg_260_2)
	local var_260_0 = {}

	if arg_260_0.waitForTimeline then
		table.insert(var_260_0, function(arg_261_0)
			local var_261_0 = arg_260_0.waitForTimeline

			arg_260_0.waitForTimeline = nil

			var_261_0()
			arg_261_0()
		end)
	end

	table.insert(var_260_0, function(arg_262_0)
		arg_260_0:LoadTimelineScene(arg_260_1.name, false, arg_262_0)
	end)

	if arg_260_1.scene and arg_260_1.sceneRoot then
		table.insert(var_260_0, function(arg_263_0)
			arg_260_0:ChangeArtScene(arg_260_1.scene .. "|" .. arg_260_1.sceneRoot, arg_263_0)
		end)
	end

	table.insert(var_260_0, function(arg_264_0)
		local var_264_0 = GameObject.Find("[sequence]").transform
		local var_264_1 = var_264_0:GetComponent(typeof(UnityEngine.Playables.PlayableDirector))

		if GetComponent(var_264_1, "TimelineSpeed") then
			setDirectorSpeed(var_264_1, 1)
		else
			GetOrAddComponent(var_264_0, "TimelineSpeed")
		end

		local var_264_2 = GameObject.Find("[actor]").transform
		local var_264_3 = var_264_2:GetComponentsInChildren(typeof(Animator), true)

		table.IpairsCArray(var_264_3, function(arg_265_0, arg_265_1)
			GetOrAddComponent(arg_265_1.transform, typeof(DftAniEvent))
		end)
		table.IpairsCArray(var_264_2:GetComponentsInChildren(typeof("MagicaCloth.BaseCloth"), true), function(arg_266_0, arg_266_1)
			arg_266_1.enabled, arg_266_1.enabled = arg_266_1.enabled, false
		end)
		var_264_1:Stop()

		var_264_1.extrapolationMode = ReflectionHelp.RefGetField(typeof("UnityEngine.Playables.DirectorWrapMode"), "Hold", nil)

		if arg_260_1.time then
			var_264_1.time = math.clamp(arg_260_1.time, 0, var_264_1.duration)
		end

		local var_264_4 = {}

		local function var_264_5(arg_267_0)
			switch(arg_267_0.stringParameter, {
				TimelinePause = function()
					setDirectorSpeed(var_264_1, 0)
				end,
				TimelineResume = function()
					arg_260_0.timelineSpeed = 1

					setDirectorSpeed(var_264_1, 1)
				end,
				TimelinePlayOnTime = function()
					if arg_267_0.intParameter == 0 or arg_267_0.intParameter == var_264_4.selectIndex then
						var_264_1.time = arg_267_0.floatParameter

						var_264_1:RebuildGraph()
					end
				end,
				TimelineSelectStart = function()
					var_264_4.selectIndex = nil

					if arg_260_1.options then
						local var_271_0 = arg_260_1.options[arg_267_0.intParameter]

						arg_260_0:DoTimelineOption(var_271_0, function(arg_272_0)
							var_264_4.selectIndex = arg_272_0
							var_264_4.optionIndex = var_271_0[arg_272_0].flag
						end)
					end
				end,
				TimelineTouchStart = function()
					var_264_4.selectIndex = nil

					if arg_260_1.touchs then
						local var_273_0 = arg_260_1.touchs[arg_267_0.intParameter]

						arg_260_0:DoTimelineTouch(arg_260_1.touchs[arg_267_0.intParameter], function(arg_274_0)
							var_264_4.selectIndex = arg_274_0
							var_264_4.optionIndex = var_273_0[arg_274_0].flag
						end)
					end
				end,
				TimelineSelectLoop = function()
					if not var_264_4.selectIndex then
						var_264_1.time = arg_267_0.floatParameter

						var_264_1:RebuildGraph()
					end
				end,
				TimelineAccompanyJump = function()
					if arg_260_0.canTriggerAccompanyPerformance then
						arg_260_0.canTriggerAccompanyPerformance = false

						local var_276_0 = arg_260_1.accompanys[arg_267_0.intParameter]
						local var_276_1 = var_276_0[math.random(#var_276_0)]

						var_264_1.time = var_276_1

						var_264_1:RebuildGraph()
					end
				end,
				TimelineEnd = function()
					var_264_4.finish = true

					setDirectorSpeed(var_264_1, 0)
				end
			}, function()
				warning("other event trigger:" .. arg_267_0.stringParameter)
			end)

			if var_264_4.finish then
				arg_260_0.timelineMark = var_264_4
				arg_260_0.timelineFinishCall = nil

				arg_264_0()
			end
		end

		GetOrAddComponent(var_264_0, "DftCommonSignalReceiver"):SetCommonEvent(var_264_5)

		function arg_260_0.timelineFinishCall()
			var_264_5({
				stringParameter = "TimelineEnd"
			})
		end

		arg_260_0:HideCharacter()
		setActive(arg_260_0.mainCameraTF, false)
		eachChild(arg_260_0.rtTimelineScreen, function(arg_280_0)
			setActive(arg_280_0, false)
		end)
		setActive(arg_260_0.rtTimelineScreen, true)
		setActive(arg_260_0.rtTimelineScreen:Find("btn_skip"), arg_260_0.inReplayTalk)
		var_264_1:Play()
		var_264_1:Evaluate()
	end)
	table.insert(var_260_0, function(arg_281_0)
		arg_260_0:ShowBlackScreen(true, function()
			arg_260_0:UnloadTimelineScene(arg_260_1.name, false, arg_281_0)
		end)
	end)

	local var_260_1 = arg_260_0.artSceneInfo

	table.insert(var_260_0, function(arg_283_0)
		arg_260_0:ChangeArtScene(var_260_1, arg_283_0)
	end)
	seriesAsync(var_260_0, function()
		setActive(arg_260_0.rtTimelineScreen, false)
		arg_260_0:RevertCharacter()
		setActive(arg_260_0.mainCameraTF, true)

		local var_284_0 = arg_260_0.timelineMark

		arg_260_0.timelineMark = nil

		existCall(arg_260_2, var_284_0, function(arg_285_0)
			arg_260_0:ShowBlackScreen(false, arg_285_0)
		end)
	end)
end

function var_0_0.PlaySingleAction(arg_286_0, arg_286_1, arg_286_2)
	local var_286_0 = arg_286_0
	local var_286_1 = string.find(arg_286_1, "^Face_")

	if tobool(var_286_1) then
		arg_286_0:PlayFaceAnim(arg_286_1, arg_286_2)

		return
	end

	if var_286_0.ladyAnimator:GetCurrentAnimatorStateInfo(var_286_0.ladyAnimBaseLayerIndex):IsName(arg_286_1) then
		return
	end

	existCall(var_286_0.animExtraItemCallback)

	var_286_0.animExtraItemCallback = nil
	var_286_0.animNameMap = var_286_0.animNameMap or {}
	var_286_0.animNameMap[var_286_0.ladyAnimator.StringToHash(arg_286_1)] = arg_286_1

	local var_286_2 = var_286_0:GetBlackboardValue("groupId")
	local var_286_3 = _.detect(pg.dorm3d_anim_extraitem.get_id_list_by_ship_id[var_286_2] or {}, function(arg_287_0)
		return pg.dorm3d_anim_extraitem[arg_287_0].anim == arg_286_1
	end)
	local var_286_4 = var_286_3 and pg.dorm3d_anim_extraitem[var_286_3]
	local var_286_5

	seriesAsync({
		function(arg_288_0)
			if not var_286_4 or var_286_4.item_prefab == "" then
				arg_288_0()

				return
			end

			local var_288_0 = string.lower("dorm3d/furniture/item/" .. var_286_4.item_prefab)

			arg_286_0.loader:GetPrefab(var_288_0, "", function(arg_289_0)
				setParent(arg_289_0, var_286_0.lady)

				if var_286_4.item_shield ~= "" then
					var_286_5 = {}

					for iter_289_0, iter_289_1 in ipairs(var_286_4.item_shield) do
						local var_289_0 = arg_286_0.modelRoot:Find(iter_289_1)

						if not var_289_0 then
							warning(string.format("dorm3d_anim_extraitem:%d without hide item:%s", var_286_4.id, iter_289_1))
						else
							var_286_5[iter_289_1] = isActive(var_289_0)

							setActive(var_289_0, false)
						end
					end
				end

				function arg_286_0.animExtraItemCallback()
					arg_286_0.loader:ClearRequest("AnimExtraItem")

					if var_286_5 then
						for iter_290_0, iter_290_1 in pairs(var_286_5) do
							setActive(arg_286_0.modelRoot:Find(iter_290_0), iter_290_1)
						end
					end
				end

				arg_288_0()
			end, "AnimExtraItem")
		end,
		function(arg_291_0)
			var_286_0.nowState = arg_286_1
			var_286_0.stateCallback = arg_291_0

			var_286_0.ladyAnimator:CrossFadeInFixedTime(arg_286_1, 0.25, var_286_0.ladyAnimBaseLayerIndex)
		end,
		function(arg_292_0)
			var_286_0.nowState = nil
			var_286_0.stateCallback = nil

			existCall(arg_286_0.animExtraItemCallback)

			arg_286_0.animExtraItemCallback = nil

			arg_292_0()
		end,
		arg_286_2
	})
end

function var_0_0.SwitchAnim(arg_293_0, arg_293_1, arg_293_2)
	local var_293_0 = arg_293_0
	local var_293_1 = string.find(arg_293_1, "^Face_")

	if tobool(var_293_1) then
		arg_293_0:PlayFaceAnim(arg_293_1, arg_293_2)

		return
	end

	existCall(var_293_0.animExtraItemCallback)

	var_293_0.animExtraItemCallback = nil
	arg_293_0.animNameMap = arg_293_0.animNameMap or {}
	arg_293_0.animNameMap[arg_293_0.ladyAnimator.StringToHash(arg_293_1)] = arg_293_1

	local var_293_2 = {}

	table.insert(var_293_2, function(arg_294_0)
		arg_293_0.nowState = arg_293_1
		arg_293_0.stateCallback = arg_294_0

		arg_293_0.ladyAnimator:PlayInFixedTime(arg_293_1, arg_293_0.ladyAnimBaseLayerIndex)
	end)
	table.insert(var_293_2, function(arg_295_0)
		arg_293_0.nowState = nil
		arg_293_0.stateCallback = nil

		arg_295_0()
	end)
	seriesAsync(var_293_2, arg_293_2)
end

function var_0_0.PlayFaceAnim(arg_296_0, arg_296_1, arg_296_2)
	arg_296_0.ladyAnimator:CrossFadeInFixedTime(arg_296_1, 0.2, arg_296_0.ladyAnimFaceLayerIndex)
	existCall(arg_296_2)
end

function var_0_0.GetCurrentAnim(arg_297_0)
	local var_297_0 = arg_297_0.ladyAnimator:GetCurrentAnimatorStateInfo(arg_297_0.ladyAnimBaseLayerIndex).shortNameHash

	return arg_297_0.animNameMap[var_297_0]
end

function var_0_0.RegisterAnimCallback(arg_298_0, arg_298_1, arg_298_2)
	arg_298_0.animCallbacks[arg_298_1] = arg_298_2
end

function var_0_0.SetCharacterAnimSpeed(arg_299_0, arg_299_1)
	arg_299_0.ladyAnimator.speed = arg_299_1
	arg_299_0.ladyHeadIKComp.blinkSpeed = arg_299_0.ladyHeadIKData.blinkSpeed * arg_299_1

	if arg_299_1 > 0 then
		arg_299_0.ladyHeadIKComp.DampTime = arg_299_0.ladyHeadIKData.DampTime / arg_299_1
	else
		arg_299_0.ladyHeadIKComp.DampTime = arg_299_0.ladyHeadIKData.DampTime * math.huge
	end
end

function var_0_0.OnAnimationEvent(arg_300_0, arg_300_1)
	if arg_300_1.animatorClipInfo.weight < 0.5 then
		return
	end

	local var_300_0 = arg_300_1.stringParameter
	local var_300_1 = table.removebykey(arg_300_0.animEventCallbacks, var_300_0)

	existCall(var_300_1)
end

function var_0_0.RegisterAnimEventCallback(arg_301_0, arg_301_1, arg_301_2)
	arg_301_0.animEventCallbacks[arg_301_1] = arg_301_2
end

function var_0_0.PlaySceneItemAnim(arg_302_0, arg_302_1, arg_302_2)
	arg_302_0.sceneAnimatorDict = arg_302_0.sceneAnimatorDict or {}

	if not arg_302_0.sceneAnimatorDict[arg_302_1] then
		local var_302_0 = pg.dorm3d_scene_animator[arg_302_1]
		local var_302_1 = arg_302_0:GetSceneItem(var_302_0.item_name)

		assert(var_302_1, "Missing Scene Animator in pg.dorm3d_scene_animator: " .. arg_302_1 .. " " .. var_302_0.item_name)

		if not var_302_1 then
			return
		end

		local var_302_2 = var_302_1:GetComponent(typeof(Animator))

		if not var_302_2 then
			return
		end

		arg_302_0.sceneAnimatorDict[arg_302_1] = {
			trans = var_302_1,
			animator = var_302_2
		}
	end

	if arg_302_0.sceneAnimatorDict[arg_302_1].animator:GetCurrentAnimatorStateInfo(0):IsName(arg_302_2) then
		return
	end

	arg_302_0.sceneAnimatorDict[arg_302_1].animator:PlayInFixedTime(arg_302_2)
end

function var_0_0.ResetSceneItemAnimators(arg_303_0, arg_303_1)
	if not arg_303_0.sceneAnimatorDict then
		return
	end

	table.Foreach(arg_303_0.sceneAnimatorDict, function(arg_304_0, arg_304_1)
		if arg_303_1 and table.contains(arg_303_1, arg_304_0) then
			return
		end

		setActive(arg_304_1.trans, false)
		setActive(arg_304_1.trans, true)

		arg_303_0.sceneAnimatorDict[arg_304_0] = nil
	end)
end

function var_0_0.RegisterCameraBlendFinished(arg_305_0, arg_305_1, arg_305_2)
	arg_305_0.cameraBlendCallbacks[arg_305_1] = arg_305_2
end

function var_0_0.UnRegisterCameraBlendFinished(arg_306_0, arg_306_1)
	arg_306_0.cameraBlendCallbacks[arg_306_1] = nil
end

function var_0_0.OnCameraBlendFinished(arg_307_0, arg_307_1)
	if not arg_307_1 then
		return
	end

	local var_307_0 = table.removebykey(arg_307_0.cameraBlendCallbacks, arg_307_1)

	existCall(var_307_0)
end

function var_0_0.PlayHeartFX(arg_308_0, arg_308_1)
	local var_308_0 = arg_308_0.ladyDict[arg_308_1]

	setActive(var_308_0.effectHeart, false)
	setActive(var_308_0.effectHeart, true)
	pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_joyful")
end

function var_0_0.PlayExpression(arg_309_0, arg_309_1)
	local var_309_0 = arg_309_1.name
	local var_309_1 = arg_309_0.expressionDict[var_309_0]
	local var_309_2 = 5

	if var_309_1 then
		local var_309_3 = var_309_1.timer

		var_309_3:Reset(nil, var_309_2)
		var_309_3:Start()

		if var_309_1.instance then
			setActive(var_309_1.instance, false)
			setActive(var_309_1.instance, true)
		end

		return
	end

	local var_309_4 = {
		name = var_309_0,
		timer = Timer.New(function()
			arg_309_0:RemoveExpression(var_309_0)
		end, var_309_2, 1, true)
	}

	arg_309_0.expressionDict[var_309_0] = var_309_4

	arg_309_0.loader:GetPrefab("dorm3D/effect/prefab/expression/" .. var_309_0, var_309_0, function(arg_311_0)
		var_309_4.instance = arg_311_0

		onNextTick(function()
			setParent(arg_311_0, arg_309_0.ladyHeadCenter)
		end)
		setLocalPosition(arg_311_0, Vector3(0, 0, -0.2))
		setActive(arg_311_0, false)
		setActive(arg_311_0, true)
	end, var_309_4)
end

function var_0_0.RemoveExpression(arg_313_0, arg_313_1)
	local var_313_0 = arg_313_0.expressionDict[arg_313_1]

	if not var_313_0 then
		return
	end

	arg_313_0.loader:ClearRequest(var_313_0)

	if var_313_0.instance then
		arg_313_0.loader:ReturnPrefab(var_313_0.instance)
	end

	arg_313_0.expressionDict[arg_313_1] = nil
end

function var_0_0.ShowOrHideCanWatchMark(arg_314_0, arg_314_1)
	arg_314_0.ladyWatchFloat = arg_314_0.ladyWatchFloat or cloneTplTo(arg_314_0.resTF:Find("vfx_talk_mark"), arg_314_0.ladyHeadCenter)

	setActive(arg_314_0.ladyWatchFloat, arg_314_1)
end

function var_0_0.RegisterGlobalVolume(arg_315_0)
	local var_315_0 = arg_315_0.globalVolume
	local var_315_1 = LuaHelper.GetOrAddVolumeComponent(var_315_0, typeof(BLHX.PostEffect.Overrides.DepthOfField))
	local var_315_2 = LuaHelper.GetOrAddVolumeComponent(var_315_0, typeof(BLHX.PostEffect.Overrides.ColorGrading))

	arg_315_0.originalCameraSettings = {
		depthOfField = {
			enabled = var_315_1.enabled.value,
			focusDistance = {
				length = 2,
				min = var_315_1.gaussianStart.min,
				value = var_315_1.gaussianStart.value
			},
			blurRadius = {
				min = var_315_1.blurRadius.min,
				max = var_315_1.blurRadius.max,
				value = var_315_1.blurRadius.value
			}
		},
		postExposure = {
			value = var_315_2.postExposure.value
		},
		contrast = {
			min = var_315_2.contrast.min,
			max = var_315_2.contrast.max,
			value = var_315_2.contrast.value
		},
		saturate = {
			min = var_315_2.saturation.min,
			max = var_315_2.saturation.max,
			value = var_315_2.saturation.value
		}
	}
	arg_315_0.originalCameraSettings.depthOfField.enabled = true

	local var_315_3 = var_315_0:GetComponent(typeof(BLHX.Volume.Volume))

	arg_315_0.originalVolume = {
		profile = var_315_3.sharedProfile,
		weight = var_315_3.weight
	}
end

function var_0_0.SettingCamera(arg_316_0, arg_316_1)
	arg_316_0.activeCameraSettings = arg_316_1

	local var_316_0 = arg_316_0.globalVolume
	local var_316_1 = LuaHelper.GetOrAddVolumeComponent(var_316_0, typeof(BLHX.PostEffect.Overrides.DepthOfField))
	local var_316_2 = LuaHelper.GetOrAddVolumeComponent(var_316_0, typeof(BLHX.PostEffect.Overrides.ColorGrading))

	var_316_1.enabled:Override(arg_316_1.depthOfField.enabled)
	var_316_1.gaussianStart:Override(arg_316_1.depthOfField.focusDistance.value)
	var_316_1.gaussianEnd:Override(arg_316_1.depthOfField.focusDistance.value + arg_316_1.depthOfField.focusDistance.length)
	var_316_1.blurRadius:Override(arg_316_1.depthOfField.blurRadius.value)
	var_316_2.postExposure:Override(arg_316_1.postExposure.value)
	var_316_2.contrast:Override(arg_316_1.contrast.value)
	var_316_2.saturation:Override(arg_316_1.saturate.value)
end

function var_0_0.GetCameraSettings(arg_317_0)
	return arg_317_0.originalCameraSettings
end

function var_0_0.RevertCameraSettings(arg_318_0)
	arg_318_0:SettingCamera(arg_318_0.originalCameraSettings)

	arg_318_0.activeCameraSettings = nil
end

function var_0_0.SetVolumeProfile(arg_319_0, arg_319_1, arg_319_2)
	local var_319_0 = arg_319_0.globalVolume:GetComponent(typeof(BLHX.Volume.Volume))

	arg_319_0.activeProfileWeight = arg_319_2

	if arg_319_0.activeProfileName ~= arg_319_1 then
		arg_319_0.activeProfileName = arg_319_1

		arg_319_0.loader:LoadReference("dorm3d/scenesres/res/common", arg_319_1, nil, function(arg_320_0)
			var_319_0.profile = arg_320_0
			var_319_0.weight = arg_319_0.activeProfileWeight

			if arg_319_0.activeCameraSettings then
				arg_319_0:SettingCamera(arg_319_0.activeCameraSettings)
			end
		end, "VolumeProfile")
	else
		var_319_0.weight = arg_319_0.activeProfileWeight
	end
end

function var_0_0.RevertVolumeProfile(arg_321_0)
	local var_321_0 = arg_321_0.globalVolume:GetComponent(typeof(BLHX.Volume.Volume))

	var_321_0.profile = arg_321_0.originalVolume.profile
	var_321_0.weight = arg_321_0.originalVolume.weight

	if arg_321_0.activeCameraSettings then
		arg_321_0:SettingCamera(arg_321_0.activeCameraSettings)
	end

	arg_321_0.activeProfileName = nil
end

function var_0_0.RecordCharacterLight(arg_322_0)
	local var_322_0 = BLHX.Rendering.PipelineInterface.GetCharacterLightColor()

	arg_322_0.originalCharacterColor = {
		color = var_322_0.color,
		intensity = var_322_0.intensity
	}
end

function var_0_0.SetCharacterLight(arg_323_0, arg_323_1, arg_323_2, arg_323_3)
	local var_323_0 = arg_323_0.characterLight:GetComponent(typeof(Light))
	local var_323_1 = Color.Lerp(arg_323_0.originalCharacterColor.color, arg_323_1, arg_323_3)
	local var_323_2 = math.lerp(arg_323_0.originalCharacterColor.intensity, arg_323_2, arg_323_3)

	BLHX.Rendering.PipelineInterface.SetCharacterLight(var_323_1, var_323_2)
end

function var_0_0.RevertCharacterLight(arg_324_0)
	arg_324_0:SetCharacterLight(arg_324_0.originalCharacterColor.color, arg_324_0.originalCharacterColor.intensity, 1)
end

function var_0_0.EnableCloth(arg_325_0, arg_325_1, arg_325_2)
	arg_325_1 = arg_325_1 or {}

	table.Foreach(arg_325_0.clothComps, function(arg_326_0, arg_326_1)
		if arg_326_1 == nil then
			return
		end

		setActive(arg_326_1, arg_325_1[arg_326_0] == 1)
	end)
	table.Foreach(arg_325_0.clothColliderDict, function(arg_327_0, arg_327_1)
		if arg_327_1 == nil then
			return
		end

		setActive(arg_327_1, false)
	end)

	if arg_325_2 then
		table.Foreach(arg_325_2, function(arg_328_0, arg_328_1)
			local var_328_0 = arg_325_0.clothColliderDict[arg_328_1[1]]

			if var_328_0 == nil then
				return
			end

			setActive(var_328_0, arg_328_1[2] == 1)

			if arg_328_1[2] ~= 1 then
				return
			end

			var_0_0.SetMagicaCollider(var_328_0, arg_328_1[3], arg_328_1[4])
		end)
	end
end

function var_0_0.RevertClothComps(arg_329_0, arg_329_1)
	table.Foreach(arg_329_1.ladyClothCompSettings, function(arg_330_0, arg_330_1)
		arg_330_0.enabled = arg_330_1.enabled
	end)
	table.Foreach(arg_329_1.ladyClothColliderSettings, function(arg_331_0, arg_331_1)
		arg_331_0.enabled = arg_331_1.enabled

		var_0_0.SetMagicaCollider(arg_331_0, arg_331_1.StartRadius, arg_331_1.EndRadius)
	end)
end

function var_0_0.onBackPressed(arg_332_0)
	if arg_332_0.exited or arg_332_0.retainCount > 0 then
		-- block empty
	else
		arg_332_0:closeView()
	end
end

function var_0_0.EnableSceneDisplay(arg_333_0, arg_333_1, arg_333_2)
	assert(tobool(arg_333_0.lastSceneRootDict[arg_333_1]) == arg_333_2)

	if arg_333_2 then
		table.Foreach(arg_333_0.lastSceneRootDict[arg_333_1], function(arg_334_0, arg_334_1)
			if IsNil(arg_334_0) then
				return
			end

			setActive(arg_334_0, arg_334_1)
		end)

		arg_333_0.lastSceneRootDict[arg_333_1] = nil
	else
		arg_333_0.lastSceneRootDict[arg_333_1] = {}

		local var_333_0 = SceneManager.GetSceneByName(arg_333_1)

		table.IpairsCArray(var_333_0:GetRootGameObjects(), function(arg_335_0, arg_335_1)
			if tostring(arg_335_1.hideFlags) ~= "None" then
				return
			end

			arg_333_0.lastSceneRootDict[arg_333_1][arg_335_1] = isActive(arg_335_1)

			setActive(arg_335_1, false)
		end)
	end
end

function var_0_0.ChangeArtScene(arg_336_0, arg_336_1, arg_336_2)
	arg_336_1 = string.lower(arg_336_1)

	if arg_336_1 == arg_336_0.artSceneInfo then
		if arg_336_1 == arg_336_0.sceneInfo then
			arg_336_0:SwitchDayNight(arg_336_0.contextData.timeIndex)
			onNextTick(function()
				arg_336_0:RefreshSlots()
				existCall(arg_336_2)
			end)
		else
			existCall(arg_336_2)
		end

		return
	end

	local var_336_0 = {}
	local var_336_1 = false
	local var_336_2

	table.insert(var_336_0, function(arg_338_0)
		arg_336_0.artSceneInfo = arg_336_1

		if var_336_1 then
			pg.SceneAnimMgr.GetInstance():Dorm3DSceneChange(function(arg_339_0)
				var_336_2 = arg_339_0

				arg_338_0()
			end)
		else
			arg_338_0()
		end
	end)

	if arg_336_1 == arg_336_0.sceneInfo then
		table.insert(var_336_0, function(arg_340_0)
			setActive(arg_336_0.slotRoot, true)

			local var_340_0, var_340_1 = unpack(string.split(arg_336_0.sceneInfo, "|"))

			SceneManager.SetActiveScene(SceneManager.GetSceneByName(var_340_0))
			arg_336_0:EnableSceneDisplay(var_340_0, true)
			arg_336_0:SwitchDayNight(arg_336_0.contextData.timeIndex)
			onNextTick(function()
				arg_336_0:RefreshSlots()
			end)
			arg_340_0()
		end)
	else
		var_336_1 = true

		local var_336_3, var_336_4 = unpack(string.split(arg_336_1, "|"))

		table.insert(var_336_0, function(arg_342_0)
			setActive(arg_336_0.slotRoot, false)
			SceneOpMgr.Inst:LoadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_336_4 .. "/" .. var_336_3 .. "_scene"), var_336_3, LoadSceneMode.Additive, function(arg_343_0, arg_343_1)
				SceneManager.SetActiveScene(arg_343_0)

				local var_343_0 = getSceneRootTFDic(arg_343_0).MainCamera

				if var_343_0 then
					setActive(var_343_0, false)
				end

				arg_342_0()
			end)
		end)
	end

	if arg_336_0.artSceneInfo == arg_336_0.sceneInfo then
		table.insert(var_336_0, function(arg_344_0)
			local var_344_0, var_344_1 = unpack(string.split(arg_336_0.sceneInfo, "|"))

			arg_336_0:EnableSceneDisplay(var_344_0, false)
			arg_344_0()
		end)
	else
		local var_336_5, var_336_6 = unpack(string.split(arg_336_0.artSceneInfo, "|"))

		table.insert(var_336_0, function(arg_345_0)
			SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_336_6 .. "/" .. var_336_5 .. "_scene"), var_336_5, arg_345_0)
		end)
	end

	table.insert(var_336_0, function(arg_346_0)
		arg_346_0()

		if var_336_1 then
			var_336_2()
		end
	end)
	seriesAsync(var_336_0, arg_336_2)
end

function var_0_0.LoadTimelineScene(arg_347_0, arg_347_1, arg_347_2, arg_347_3)
	arg_347_1 = string.lower(arg_347_1)

	if arg_347_0.cacheSceneDic[arg_347_1] then
		if not arg_347_2 then
			arg_347_0.timelineScene = arg_347_1

			arg_347_0:EnableSceneDisplay(arg_347_1, true)
		end

		return existCall(arg_347_3)
	end

	local var_347_0 = {}
	local var_347_1

	table.insert(var_347_0, function(arg_348_0)
		pg.SceneAnimMgr.GetInstance():Dorm3DSceneChange(function(arg_349_0)
			if arg_347_0.waitForTimeline then
				arg_347_0.waitForTimeline = arg_349_0
				var_347_1 = nil
			else
				var_347_1 = arg_349_0
			end

			arg_348_0()
		end)
	end)
	table.insert(var_347_0, function(arg_350_0)
		local var_350_0 = arg_347_0.apartment:getConfig("asset_name")

		SceneOpMgr.Inst:LoadSceneAsync(string.lower("dorm3d/character/" .. var_350_0 .. "/timeline/" .. arg_347_1 .. "/" .. arg_347_1 .. "_scene"), arg_347_1, LoadSceneMode.Additive, function(arg_351_0, arg_351_1)
			local var_351_0 = GameObject.Find("[actor]").transform

			arg_347_0:HXCharacter(tf(var_351_0))

			local var_351_1 = GameObject.Find("[sequence]").transform:GetComponent(typeof(UnityEngine.Playables.PlayableDirector))

			var_351_1:Stop()
			TimelineSupport.InitTimeline(var_351_1)
			TimelineSupport.InitSubtitle(var_351_1, arg_347_0.apartment:GetCallName())

			arg_347_0.unloadDirector = var_351_1

			arg_350_0()
		end)
	end)
	table.insert(var_347_0, function(arg_352_0)
		arg_347_0.sceneGroupDic[arg_347_1] = arg_347_0.apartment:GetConfigID()

		if arg_347_2 then
			arg_347_0.cacheSceneDic[arg_347_1] = true

			arg_347_0:EnableSceneDisplay(arg_347_1, false)
		else
			arg_347_0.timelineScene = arg_347_1
		end

		arg_352_0()
		existCall(var_347_1)
	end)
	seriesAsync(var_347_0, arg_347_3)
end

function var_0_0.UnloadTimelineScene(arg_353_0, arg_353_1, arg_353_2, arg_353_3)
	arg_353_1 = string.lower(arg_353_1)

	if arg_353_0.timelineScene == arg_353_1 then
		arg_353_0.timelineScene = nil
	end

	if tobool(arg_353_2) == tobool(arg_353_0.cacheSceneDic[arg_353_1]) then
		local var_353_0 = getProxy(ApartmentProxy):getApartment(arg_353_0.sceneGroupDic[arg_353_1]):getConfig("asset_name")

		if arg_353_0.unloadDirector then
			TimelineSupport.UnloadPlayable(arg_353_0.unloadDirector)

			arg_353_0.unloadDirector = nil
		end

		SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/character/scenes/" .. var_353_0 .. "/timeline/" .. arg_353_1 .. "/" .. arg_353_1 .. "_scene"), arg_353_1, function()
			arg_353_0.cacheSceneDic[arg_353_1] = nil
			arg_353_0.sceneGroupDic[arg_353_1] = nil
			arg_353_0.lastSceneRootDict[arg_353_1] = nil

			existCall(arg_353_3)
		end)
	else
		arg_353_0:EnableSceneDisplay(arg_353_1, false)
		existCall(arg_353_3)
	end
end

function var_0_0.ChangeSubScene(arg_355_0, arg_355_1, arg_355_2)
	arg_355_1 = string.lower(arg_355_1)

	warning(arg_355_0.subSceneInfo, "->", arg_355_1, arg_355_1 == arg_355_0.subSceneInfo)

	if arg_355_1 == arg_355_0.subSceneInfo then
		arg_355_0.ladyActiveZone = arg_355_0.walkBornPoint or arg_355_0.ladyBaseZone

		arg_355_0:ChangeCharacterPosition()
		arg_355_0:ChangePlayerPosition(arg_355_0.ladyActiveZone)
		arg_355_0:TriggerLadyDistance()
		arg_355_0:CheckInSector()
		existCall(arg_355_2)

		return
	end

	local var_355_0 = {}
	local var_355_1 = false
	local var_355_2

	table.insert(var_355_0, function(arg_356_0)
		arg_355_0.subSceneInfo = arg_355_1

		if var_355_1 then
			pg.SceneAnimMgr.GetInstance():Dorm3DSceneChange(function(arg_357_0)
				var_355_2 = arg_357_0

				arg_356_0()
			end)
		else
			arg_356_0()
		end
	end)

	if arg_355_1 == arg_355_0.sceneInfo then
		table.insert(var_355_0, function(arg_358_0)
			local var_358_0, var_358_1 = unpack(string.split(arg_355_0.sceneInfo, "|"))

			arg_355_0:ResetSceneStructure(SceneManager.GetSceneByName(var_358_0 .. "_base"))
			arg_355_0:RefreshSlots()

			arg_355_0.ladyActiveZone = arg_355_0.walkBornPoint or arg_355_0.ladyBaseZone

			arg_355_0:ChangeCharacterPosition()
			arg_355_0:ChangePlayerPosition(arg_355_0.ladyActiveZone)
			arg_355_0:TriggerLadyDistance()
			arg_355_0:CheckInSector()
			arg_358_0()
		end)
	else
		var_355_1 = true

		local var_355_3, var_355_4 = unpack(string.split(arg_355_1, "|"))
		local var_355_5 = var_355_3 .. "_base"

		table.insert(var_355_0, function(arg_359_0)
			SceneOpMgr.Inst:LoadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_355_4 .. "/" .. var_355_5 .. "_scene"), var_355_5, LoadSceneMode.Additive, arg_359_0)
		end)
		table.insert(var_355_0, function(arg_360_0)
			arg_355_0:ResetSceneStructure(SceneManager.GetSceneByName(var_355_5))

			arg_355_0.ladyActiveZone = arg_355_0.walkBornPoint or "Default"

			arg_355_0:SwitchAnim(var_0_0.ANIM.IDLE)
			onNextTick(function()
				arg_355_0:ChangeCharacterPosition()
				arg_355_0:ChangePlayerPosition(arg_355_0.ladyActiveZone)
				arg_355_0:TriggerLadyDistance()
				arg_355_0:CheckInSector()
				arg_360_0()
			end)
		end)
	end

	if arg_355_0.subSceneInfo == arg_355_0.sceneInfo then
		table.insert(var_355_0, function(arg_362_0)
			local var_362_0 = Clone(arg_355_0.room)

			var_362_0.furnitures = {}

			arg_355_0:RefreshSlots(var_362_0)
			arg_362_0()
		end)
	else
		local var_355_6, var_355_7 = unpack(string.split(arg_355_0.subSceneInfo, "|"))
		local var_355_8 = var_355_6 .. "_base"

		table.insert(var_355_0, function(arg_363_0)
			SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_355_7 .. "/" .. var_355_8 .. "_scene"), var_355_8, arg_363_0)
		end)
	end

	table.insert(var_355_0, function(arg_364_0)
		arg_364_0()

		if var_355_1 then
			var_355_2()
		end
	end)
	seriesAsync(var_355_0, arg_355_2)
end

function var_0_0.TransformMesh(arg_365_0)
	local var_365_0 = arg_365_0.sharedMesh
	local var_365_1 = {}
	local var_365_2 = arg_365_0.transform:TransformPoint(var_365_0.vertices[0])
	local var_365_3 = arg_365_0.transform:TransformPoint(var_365_0.vertices[1])
	local var_365_4 = arg_365_0.transform:TransformPoint(var_365_0.vertices[2])

	var_365_1.horizontal = var_365_3 - var_365_2
	var_365_1.verticle = var_365_4 - var_365_2
	var_365_1.origin = var_365_2

	return var_365_1
end

function var_0_0.GetRatio(arg_366_0, arg_366_1)
	local var_366_0 = Vector2.zero

	var_366_0.x = Vector3.Dot(arg_366_0.horizontal, arg_366_1) / arg_366_0.horizontal.sqrMagnitude
	var_366_0.y = Vector3.Dot(arg_366_0.verticle, arg_366_1) / arg_366_0.verticle.sqrMagnitude

	return var_366_0
end

function var_0_0.GetPostionByRatio(arg_367_0, arg_367_1)
	return arg_367_0.horizontal * arg_367_1.x + arg_367_0.verticle * arg_367_1.y + arg_367_0.origin
end

function var_0_0.IsPointInSector(arg_368_0, arg_368_1)
	local var_368_0 = arg_368_1 - Vector3.New(unpack(arg_368_0.Position))

	if var_368_0.magnitude > arg_368_0.Radius then
		return false
	end

	local var_368_1 = Quaternion.Euler(unpack(arg_368_0.Rotation))

	return Vector3.Angle(var_368_1 * Vector3.forward, var_368_0) <= arg_368_0.Angle / 2
end

function var_0_0.willExit(arg_369_0)
	arg_369_0.joystickTimer:Stop()
	arg_369_0.moveStickTimer:Stop()
	UpdateBeat:RemoveListener(arg_369_0.updateHandler)
	arg_369_0:StopIKHandTimer()

	if arg_369_0.moveTimer then
		arg_369_0.moveTimer:Stop()

		arg_369_0.moveTimer = nil
	end

	if arg_369_0.moveWaitTimer then
		arg_369_0.moveWaitTimer:Stop()

		arg_369_0.moveWaitTimer = nil
	end

	GlobalClickEventMgr.Inst:RemoveBeginPinchFunc()
	GlobalClickEventMgr.Inst:RemovePinchFunc()
	GlobalClickEventMgr.Inst:RemoveEndPinchFunc()

	if not IsNil(arg_369_0.furnitures) then
		eachChild(arg_369_0.furnitures, function(arg_370_0)
			local var_370_0 = GetComponent(arg_370_0, typeof(EventTriggerListener))

			if not var_370_0 then
				return
			end

			var_370_0:ClearEvents()
		end)
	end

	for iter_369_0, iter_369_1 in pairs(arg_369_0.ladyDict) do
		arg_369_0:ResetActiveIKs(iter_369_1)
		GetComponent(iter_369_1.lady, typeof(EventTriggerListener)):ClearEvents()
	end

	arg_369_0.camBrainEvenetHandler.OnBlendStarted = nil
	arg_369_0.camBrainEvenetHandler.OnBlendFinished = nil

	pg.UIMgr.GetInstance():UnOverlayPanel(arg_369_0.blockLayer, arg_369_0._tf)
	table.Foreach(arg_369_0.expressionDict, function(arg_371_0)
		arg_369_0:RemoveExpression(arg_371_0)
	end)
	arg_369_0.loader:Clear()
	pg.ClickEffectMgr:GetInstance():SetClickEffect("NORMAL")
	pg.NodeCanvasMgr.GetInstance():Clear()

	local var_369_0 = {}

	if arg_369_0.timelineScene and not arg_369_0.cacheSceneDic[arg_369_0.timelineScene] then
		local var_369_1 = arg_369_0.timelineScene

		arg_369_0.timelineScene = nil

		local var_369_2 = getProxy(ApartmentProxy):getApartment(arg_369_0.sceneGroupDic[var_369_1]):getConfig("asset_name")

		table.insert(var_369_0, function(arg_372_0)
			SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/character/scenes/" .. var_369_2 .. "/timeline/" .. var_369_1 .. "/" .. var_369_1 .. "_scene"), var_369_1, arg_372_0)
		end)
	end

	for iter_369_2, iter_369_3 in pairs(arg_369_0.cacheSceneDic) do
		if iter_369_3 then
			local var_369_3 = getProxy(ApartmentProxy):getApartment(arg_369_0.sceneGroupDic[iter_369_2]):getConfig("asset_name")

			table.insert(var_369_0, function(arg_373_0)
				SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/character/scenes/" .. var_369_3 .. "/timeline/" .. iter_369_2 .. "/" .. iter_369_2 .. "_scene"), iter_369_2, arg_373_0)
			end)
		end
	end

	for iter_369_4, iter_369_5 in ipairs({
		arg_369_0.sceneInfo,
		arg_369_0.subSceneInfo ~= arg_369_0.sceneInfo and arg_369_0.subSceneInfo or nil
	}) do
		local var_369_4, var_369_5 = unpack(string.split(iter_369_5, "|"))
		local var_369_6 = var_369_4 .. "_base"

		table.insert(var_369_0, function(arg_374_0)
			SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_369_5 .. "/" .. var_369_6 .. "_scene"), var_369_6, arg_374_0)
		end)
	end

	for iter_369_6, iter_369_7 in ipairs({
		arg_369_0.sceneInfo,
		arg_369_0.artSceneInfo ~= arg_369_0.sceneInfo and arg_369_0.artSceneInfo or nil
	}) do
		local var_369_7, var_369_8 = unpack(string.split(iter_369_7, "|"))

		table.insert(var_369_0, function(arg_375_0)
			SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_369_8 .. "/" .. var_369_7 .. "_scene"), var_369_7, arg_375_0)
		end)
	end

	seriesAsync(var_369_0, function()
		ReflectionHelp.RefSetProperty(typeof("UnityEngine.LightmapSettings"), "lightmaps", nil, nil)
	end)
end

function var_0_0.InitDefautQuality()
	if PlayerPrefs.GetInt("dorm3d_graphics_settings", 0) == 0 then
		local var_377_0 = DevicePerformanceUtil.GetDevicePerformanceLevel()

		if PLATFORM == PLATFORM_IPHONEPLAYER then
			local var_377_1 = SystemInfo.deviceModel or ""

			local function var_377_2(arg_378_0)
				local var_378_0 = string.match(arg_378_0, "iPad(%d+)")
				local var_378_1 = tonumber(var_378_0)

				if var_378_1 and var_378_1 >= 8 then
					return true
				end

				return false
			end

			local function var_377_3(arg_379_0)
				local var_379_0 = string.match(arg_379_0, "iPhone(%d+)")
				local var_379_1 = tonumber(var_379_0)

				if var_379_1 and var_379_1 >= 13 then
					return true
				end

				return false
			end

			if var_377_2(var_377_1) or var_377_3(var_377_1) then
				var_377_0 = DevicePerformanceLevel.High
			end
		end

		local var_377_4 = var_377_0 == DevicePerformanceLevel.High and 3 or var_377_0 == DevicePerformanceLevel.Mid and 2 or 1

		PlayerPrefs.SetInt("dorm3d_graphics_settings", var_377_4)

		Dorm3dRoomTemplateScene.FirstDefaultSetting = var_377_4
	end
end

function var_0_0.SettingQuality()
	local var_380_0 = GraphicSettingConst.HandleCustomSetting()

	BLHX.Rendering.EngineCore.SetOverrideQualitySettings(var_380_0)
end

function var_0_0.SetMagicaCollider(arg_381_0, arg_381_1, arg_381_2)
	local var_381_0 = typeof("MagicaCloth.MagicaCapsuleCollider")

	ReflectionHelp.RefSetProperty(var_381_0, "StartRadius", arg_381_0, arg_381_1)
	ReflectionHelp.RefSetProperty(var_381_0, "EndRadius", arg_381_0, arg_381_2)
end

return var_0_0
