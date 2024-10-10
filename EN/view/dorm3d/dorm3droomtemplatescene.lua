local var_0_0 = class("Dorm3dRoomTemplateScene", import("view.base.BaseUI"))

var_0_0.CAMERA = {
	GIFT = 8,
	PHOTO = 10,
	POV = 11,
	TALK = 4,
	IK_WATCH = 12,
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
		iter_14_1:InitCharacter(iter_14_0)

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

		if arg_15_0.compPov and go(arg_15_0.compPov).activeInHierarchy then
			var_30_2(arg_15_0.compPov, "m_HorizontalAxis", var_30_0)
			var_30_2(arg_15_0.compPov, "m_VerticalAxis", var_30_1)
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
	arg_33_0.cameraPhoto = var_33_3:Find("Photo Camera"):GetComponent(typeof(Cinemachine.CinemachineFreeLook))
	arg_33_0.cameras = {
		arg_33_0.cameraAim,
		arg_33_0.cameraAim2,
		arg_33_0.cameraRole,
		arg_33_0.cameraTalk,
		arg_33_0.cameraRoleWatch,
		[var_0_0.CAMERA.GIFT] = arg_33_0.cameraGift,
		[var_0_0.CAMERA.ROLE2] = arg_33_0.cameraRole2,
		[var_0_0.CAMERA.PHOTO] = arg_33_0.cameraPhoto,
		[var_0_0.CAMERA.POV] = var_33_3:Find("FP Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))
	}
	arg_33_0.compDolly = arg_33_0.cameraAim:GetCinemachineComponent(Cinemachine.CinemachineCore.Stage.Body)
	arg_33_0.compPov = arg_33_0.cameras[var_0_0.CAMERA.POV]:GetCinemachineComponent(Cinemachine.CinemachineCore.Stage.Aim)
	arg_33_0.cameraRoot = var_33_3
	arg_33_0.POVOriginalFOV = arg_33_0:GetPOVFOV()
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
						local var_55_0 = arg_55_0:GetAllAssetNames()

						table.IpairsCArray(var_55_0, function(arg_56_0, arg_56_1)
							local var_56_0, var_56_1, var_56_2 = string.find(arg_56_1, "material_hx[/\\](.*).mat")

							if var_56_0 then
								arg_53_0.hxMatDict[var_56_2] = {
									arg_55_0,
									arg_56_1
								}
							end
						end)
						arg_54_0()
					end)
				end)
			end
		end

		var_53_1.skinId = var_53_4
		var_53_1.skinIdList = {
			var_53_4
		}

		table.insert(var_53_0, function(arg_57_0)
			local var_57_0 = string.format("dorm3d/character/%s/prefabs/%s", var_53_3, var_53_5)

			arg_53_0.loader:GetPrefab(var_57_0, "", function(arg_58_0)
				var_53_1.ladyGameobject = arg_58_0
				arg_53_0.skinDict[var_53_4] = {
					ladyGameobject = arg_58_0
				}

				arg_57_0()
			end)
		end)

		if arg_53_0.room:isPersonalRoom() then
			local var_53_7 = var_53_2:GetSkinModelID("touch")

			if var_53_7 then
				table.insert(var_53_1.skinIdList, var_53_7)

				local var_53_8 = pg.dorm3d_resource[var_53_7].model_id

				table.insert(var_53_0, function(arg_59_0)
					local var_59_0 = string.format("dorm3d/character/%s/prefabs/%s", var_53_3, var_53_8)

					arg_53_0.loader:GetPrefab(var_59_0, "", function(arg_60_0)
						arg_53_0.skinDict[var_53_7] = {
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

		if arg_53_0.contextData.pendingDic[iter_53_1] then
			local var_53_9 = pg.dorm3d_welcome[arg_53_0.contextData.pendingDic[iter_53_1]]

			if var_53_9.item_prefab ~= "" then
				table.insert(var_53_0, function(arg_62_0)
					local var_62_0 = string.lower("dorm3d/furniture/item/" .. var_53_9.item_prefab)

					arg_53_0.loader:GetPrefab(var_62_0, "", function(arg_63_0)
						var_53_1.tfPendintItem = arg_63_0.transform

						onNextTick(function()
							setActive(arg_63_0, false)
						end)
						arg_62_0()
					end)
				end)
			end
		end
	end

	parallelAsync(var_53_0, arg_53_2)
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

			local var_67_1 = arg_65_0.hxMatDict[var_67_0][1]:LoadAssetSync(arg_65_0.hxMatDict[var_67_0][2], typeof(Material), true, false)

			var_66_0[arg_67_0] = var_67_1

			warning("Replace HX Material", arg_65_0.hxMatDict[var_67_0][2])
		end)

		if var_66_1 then
			arg_66_1.sharedMaterials = var_66_0
		end
	end)
end

function var_0_0.InitCharacter(arg_68_0, arg_68_1)
	arg_68_0.lady = arg_68_0.ladyGameobject.transform

	arg_68_0.lady:SetParent(arg_68_0.mainCameraTF)
	arg_68_0.lady:SetParent(nil)

	arg_68_0.ladyHeadIKComp = arg_68_0.lady:GetComponent(typeof(HeadAimIK))
	arg_68_0.ladyHeadIKComp.AimTarget = arg_68_0.mainCameraTF:Find("AimTarget")
	arg_68_0.ladyHeadIKData = {
		DampTime = arg_68_0.ladyHeadIKComp.DampTime,
		blinkSpeed = arg_68_0.ladyHeadIKComp.blinkSpeed,
		BodyWeight = arg_68_0.ladyHeadIKComp.BodyWeight,
		HeadWeight = arg_68_0.ladyHeadIKComp.HeadWeight
	}

	local var_68_0 = {}

	table.Foreach(var_0_1, function(arg_69_0, arg_69_1)
		var_68_0[arg_69_1] = arg_69_0
	end)

	arg_68_0.ladyAnimator = arg_68_0.lady:GetComponent(typeof(Animator))
	arg_68_0.ladyAnimBaseLayerIndex = arg_68_0.ladyAnimator:GetLayerIndex("Base Layer")
	arg_68_0.ladyAnimFaceLayerIndex = arg_68_0.ladyAnimator:GetLayerIndex("Face")
	arg_68_0.ladyBoneMaps = {}

	local var_68_1 = arg_68_0.lady:GetComponentsInChildren(typeof(Transform), true)

	table.IpairsCArray(var_68_1, function(arg_70_0, arg_70_1)
		if arg_70_1.name == "BodyCollider" then
			arg_68_0.ladyCollider = arg_70_1
		elseif arg_70_1.name == "Interest" then
			arg_68_0.ladyInterestRoot = arg_70_1
		elseif arg_70_1.name == "Head Center" then
			arg_68_0.ladyHeadCenter = arg_70_1
		end

		if var_68_0[arg_70_1.name] then
			arg_68_0.ladyBoneMaps[var_68_0[arg_70_1.name]] = arg_70_1
		end
	end)

	arg_68_0.ladyColliders = {}
	arg_68_0.ladyTouchColliders = {}

	table.IpairsCArray(arg_68_0.lady:GetComponentsInChildren(typeof(UnityEngine.Collider), true), function(arg_71_0, arg_71_1)
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

		arg_68_0.ladyColliders[var_71_2] = child

		if var_71_2 ~= "Body" then
			table.insert(arg_68_0.ladyTouchColliders, child)
			setActive(child, false)
		end
	end)
	arg_68_0:HXCharacter(arg_68_0.lady)
	;(function()
		local var_72_0 = "dorm3d/effect/prefab/function/vfx_function_aixin02"
		local var_72_1 = "vfx_function_aixin02"

		arg_68_0.loader:GetPrefab(var_72_0, var_72_1, function(arg_73_0)
			arg_68_0.effectHeart = arg_73_0

			setActive(arg_73_0, false)
			setParent(arg_68_0.effectHeart, arg_68_0.ladyHeadCenter)
		end)
	end)()

	arg_68_0.clothComps = {}

	table.IpairsCArray(arg_68_0.lady:GetComponentsInChildren(typeof("MagicaCloth.BaseCloth"), true), function(arg_74_0, arg_74_1)
		table.insert(arg_68_0.clothComps, arg_74_1)
	end)

	arg_68_0.clothColliderDict = {}

	table.IpairsCArray(arg_68_0.lady:GetComponentsInChildren(typeof("MagicaCloth.MagicaCapsuleCollider"), true), function(arg_75_0, arg_75_1)
		arg_68_0.clothColliderDict[arg_75_1.name] = arg_75_1
	end)
	arg_68_0:EnableCloth(false)

	arg_68_0.ladyIKRoot = arg_68_0.lady:Find("IKLayers")

	eachChild(arg_68_0.ladyIKRoot, function(arg_76_0)
		setActive(arg_76_0, false)
	end)
	GetComponent(arg_68_0.lady, typeof(EventTriggerListener)):AddPointClickFunc(function(arg_77_0, arg_77_1)
		if arg_77_1.rawPointerPress.transform == arg_68_0.ladyCollider then
			arg_68_0:emit(var_0_0.CLICK_CHARACTER, arg_68_1)
		else
			local var_77_0 = table.keyof(arg_68_0.ladyColliders, arg_77_1.rawPointerPress.transform)

			arg_68_0:emit(var_0_0.ON_TOUCH_CHARACTER, var_0_0.BONE_TO_TOUCH[var_77_0] or arg_77_1.rawPointerPress.name)
		end
	end)
	arg_68_0.ladyAnimator:GetComponent("DftAniEvent"):SetCommonEvent(function(arg_78_0)
		if arg_68_0.nowState and arg_78_0.animatorStateInfo:IsName(arg_68_0.nowState) then
			existCall(arg_68_0.stateCallback)

			return
		end

		local var_78_0 = arg_78_0.animatorStateInfo

		for iter_78_0, iter_78_1 in pairs(arg_68_0.animCallbacks) do
			if var_78_0:IsName(iter_78_0) then
				warning("Active", iter_78_0)

				local var_78_1 = table.removebykey(arg_68_0.animCallbacks, iter_78_0)

				existCall(var_78_1)

				return
			end
		end

		if arg_78_0.stringParameter ~= "" then
			arg_68_0:OnAnimationEvent(arg_78_0)
		end
	end)

	arg_68_0.animEventCallbacks = {}
	arg_68_0.animCallbacks = {}
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

	arg_79_0:InitCharacter(arg_79_1)
	arg_79_0.ladyAnimator:Play(var_79_1, arg_79_0.ladyAnimBaseLayerIndex)
	onNextTick(function()
		arg_79_0.lady:SetPositionAndRotation(var_79_4, var_79_5)
		existCall(arg_79_3)
	end)
end

function var_0_0.SetCameraLady(arg_81_0)
	arg_81_0.cameraAim2.LookAt = arg_81_0.ladyInterestRoot
	arg_81_0.cameraTalk.Follow = arg_81_0.ladyInterestRoot
	arg_81_0.cameraTalk.LookAt = arg_81_0.ladyInterestRoot
	arg_81_0.cameraGift.Follow = arg_81_0.ladyInterest
	arg_81_0.cameraGift.LookAt = arg_81_0.ladyInterest
	arg_81_0.cameraRole2.LookAt = arg_81_0.ladyInterestRoot
	arg_81_0.cameraPhoto.Follow = arg_81_0.ladyInterest
	arg_81_0.cameraPhoto.LookAt = arg_81_0.ladyInterest
end

function var_0_0.initNodeCanvas(arg_82_0)
	local var_82_0 = pg.NodeCanvasMgr.GetInstance()

	var_82_0:Active()
	var_82_0:RegisterFunc("DistanceTrigger", function(arg_83_0)
		arg_82_0:emit(var_0_0.DISTANCE_TRIGGER, arg_83_0, arg_82_0.ladyDict[arg_83_0].dis)
	end)
	var_82_0:RegisterFunc("ShortWaitAction", function(arg_84_0)
		arg_82_0:DoShortWait(arg_84_0)
	end)
	var_82_0:RegisterFunc("WatchShortWaitAction", function(arg_85_0)
		arg_82_0:DoShortWait(arg_85_0)
	end)
	var_82_0:RegisterFunc("WalkDistanceTrigger", function(arg_86_0)
		arg_82_0:emit(var_0_0.WALK_DISTANCE_TRIGGER, arg_86_0, arg_82_0.ladyDict[arg_86_0].dis)
	end)
	var_82_0:RegisterFunc("ChangeWatch", function(arg_87_0)
		arg_82_0:emit(var_0_0.CHANGE_WATCH, arg_87_0)
	end)
end

function var_0_0.SetAllBlackbloardValue(arg_88_0, arg_88_1, arg_88_2)
	arg_88_0[arg_88_1] = arg_88_2

	for iter_88_0, iter_88_1 in pairs(arg_88_0.ladyDict) do
		iter_88_1:SetBlackboardValue(arg_88_1, arg_88_2)
	end
end

function var_0_0.SetBlackboardValue(arg_89_0, arg_89_1, arg_89_2)
	arg_89_0.blackboard = arg_89_0.blackboard or {}
	arg_89_0.blackboard[arg_89_1] = arg_89_2

	pg.NodeCanvasMgr.GetInstance():SetBlackboradValue(arg_89_1, arg_89_2, arg_89_0.ladyBlackboard)
end

function var_0_0.GetBlackboardValue(arg_90_0, arg_90_1)
	arg_90_0.blackboard = arg_90_0.blackboard or {}

	return arg_90_0.blackboard[arg_90_1]
end

function var_0_0.didEnter(arg_91_0)
	local var_91_0 = -21.6 / Screen.height

	arg_91_0.joystickDelta = Vector2.zero
	arg_91_0.joystickTimer = FrameTimer.New(function()
		local var_92_0 = arg_91_0.joystickDelta * var_91_0
		local var_92_1 = var_92_0.x
		local var_92_2 = var_92_0.y

		local function var_92_3(arg_93_0, arg_93_1, arg_93_2)
			local var_93_0 = arg_93_0[arg_93_1]

			var_93_0.m_InputAxisValue = arg_93_2
			arg_93_0[arg_93_1] = var_93_0
		end

		if arg_91_0.surroudCamera and not arg_91_0.pinchMode then
			var_92_3(arg_91_0.surroudCamera, "m_XAxis", var_92_1)
			var_92_3(arg_91_0.surroudCamera, "m_YAxis", var_92_2)

			if arg_91_0.surroudCamera == arg_91_0.cameraRoleWatch then
				if var_92_1 ~= 0 then
					local var_92_4 = arg_91_0.cameraRoleWatch.m_XAxis

					if not var_92_4.m_Wrap then
						local var_92_5 = var_92_1 * (var_92_4.m_InvertInput and -1 or 1)

						if var_92_5 < 0 and var_92_4.Value - 0.01 < var_92_4.m_MinValue then
							arg_91_0:emit(var_0_0.ON_ROLEWATCH_CAMERA_MAX, var_0_0.CAMERA_MAX_OPERATION.RIGHT)
						elseif var_92_5 > 0 and var_92_4.Value + 0.01 > var_92_4.m_MaxValue then
							arg_91_0:emit(var_0_0.ON_ROLEWATCH_CAMERA_MAX, var_0_0.CAMERA_MAX_OPERATION.LEFT)
						end
					end
				end

				if var_92_2 ~= 0 then
					local var_92_6 = arg_91_0.cameraRoleWatch.m_YAxis

					if not var_92_6.m_Wrap then
						if var_92_2 < 0 and var_92_6.Value - 0.01 < var_92_6.m_MinValue then
							arg_91_0:emit(var_0_0.ON_ROLEWATCH_CAMERA_MAX, var_0_0.CAMERA_MAX_OPERATION.DOWN)
						elseif var_92_2 > 0 and var_92_6.Value + 0.01 > var_92_6.m_MaxValue then
							arg_91_0:emit(var_0_0.ON_ROLEWATCH_CAMERA_MAX, var_0_0.CAMERA_MAX_OPERATION.UP)
						end
					end
				end
			end
		end

		arg_91_0.joystickDelta = Vector2.zero
	end, 1, -1)

	arg_91_0.joystickTimer:Start()

	local var_91_1 = 1.75

	arg_91_0.moveStickTimer = FrameTimer.New(function()
		if not arg_91_0.moveStickDraging then
			return
		end

		local var_94_0 = (arg_91_0.moveStickPosition - arg_91_0.moveStickOrigin):ClampMagnitude(200)

		arg_91_0.moveStickPosition = arg_91_0.moveStickOrigin + var_94_0

		local var_94_1 = Vector3.New(var_94_0.x, 0, var_94_0.y)
		local var_94_2 = arg_91_0.mainCameraTF:TransformDirection(var_94_1)

		var_94_2.y = 0

		local var_94_3 = var_94_2:Normalize()

		var_94_3:Mul(var_91_1)
		arg_91_0.playerController:SimpleMove(var_94_3)

		arg_91_0.tweenFOV = true
	end, 1, -1)

	arg_91_0.moveStickTimer:Start()

	arg_91_0.pinchMode = false
	arg_91_0.pinchSize = 0
	arg_91_0.pinchValue = 1
	arg_91_0.pinchNodeOrder = 1

	GlobalClickEventMgr.Inst:AddBeginPinchFunc(function(arg_95_0, arg_95_1)
		if arg_91_0.surroudCamera and isActive(arg_91_0.surroudCamera) then
			arg_91_0.pinchMode = true
			arg_91_0.pinchSize = (arg_95_0 - arg_95_1):Magnitude()
			arg_91_0.pinchNodeOrder = arg_95_1.x < arg_95_0.x and -1 or 1

			return
		end

		if isActive(arg_91_0.cameras[var_0_0.CAMERA.POV]) then
			if (arg_95_0 - arg_95_1):Magnitude() < Screen.height * 0.5 then
				arg_91_0.pinchMode = true
				arg_91_0.pinchSize = (arg_95_0 - arg_95_1):Magnitude()
				arg_91_0.pinchNodeOrder = arg_95_1.x < arg_95_0.x and -1 or 1
			end

			return
		end
	end)

	local var_91_2 = 0.01

	if IsUnityEditor then
		var_91_2 = 0.1
	end

	local var_91_3 = var_91_2 * 1080 / Screen.height

	GlobalClickEventMgr.Inst:AddPinchFunc(function(arg_96_0, arg_96_1)
		if not arg_91_0.pinchMode then
			return
		end

		local var_96_0 = (arg_96_0 - arg_96_1):Magnitude()
		local var_96_1 = arg_91_0.pinchSize - var_96_0
		local var_96_2 = arg_91_0.pinchNodeOrder * (arg_96_1.x < arg_96_0.x and -1 or 1)
		local var_96_3 = var_96_1 * var_91_3 * var_96_2

		if isActive(arg_91_0.cameras[var_0_0.CAMERA.POV]) then
			local var_96_4 = 0.5
			local var_96_5 = 1

			arg_91_0.pinchValue = math.clamp(arg_91_0.pinchValue + var_96_3, var_96_4, var_96_5)
			arg_91_0.pinchSize = var_96_0

			arg_91_0:SetPOVFOV(arg_91_0.POVOriginalFOV * arg_91_0.pinchValue)

			arg_91_0.tweenFOV = nil

			return
		end

		if isActive(arg_91_0.surroudCamera) and arg_91_0.surroudCamera == arg_91_0.cameraPhoto then
			local var_96_6 = 0.5
			local var_96_7 = 1

			arg_91_0:SetPinchValue(math.clamp(arg_91_0.pinchValue + var_96_3, var_96_6, var_96_7))

			arg_91_0.pinchSize = var_96_0

			return
		end
	end)
	GlobalClickEventMgr.Inst:AddEndPinchFunc(function()
		arg_91_0.pinchMode = false
		arg_91_0.pinchSize = 0
	end)

	arg_91_0.cameraBlendCallbacks = {}
	arg_91_0.activeCMCamera = nil

	function arg_91_0.camBrainEvenetHandler.OnBlendStarted(arg_98_0)
		if arg_91_0.activeCMCamera then
			arg_91_0:OnCameraBlendFinished(arg_91_0.activeCMCamera)
		end

		local var_98_0 = arg_91_0.camBrain.ActiveVirtualCamera

		arg_91_0.activeCMCamera = var_98_0
	end

	function arg_91_0.camBrainEvenetHandler.OnBlendFinished(arg_99_0)
		arg_91_0.activeCMCamera = nil

		arg_91_0:OnCameraBlendFinished(arg_99_0)
	end

	for iter_91_0, iter_91_1 in pairs(arg_91_0.ladyDict) do
		(function(arg_100_0, arg_100_1)
			if arg_100_0.tfPendintItem then
				setParent(arg_100_0.tfPendintItem, arg_100_0.lady)
			end

			arg_100_0.ladyOwner = GetComponent(arg_100_0.lady, "GraphOwner")
			arg_100_0.ladyBlackboard = GetComponent(arg_100_0.lady, "Blackboard")

			arg_100_0:SetBlackboardValue("groupId", arg_100_1)
			onNextTick(function()
				arg_100_0.ladyOwner.enabled = true
			end)
		end)(iter_91_1, iter_91_0)
	end

	arg_91_0.expressionDict = {}

	pg.UIMgr.GetInstance():OverlayPanel(arg_91_0.blockLayer, {
		weight = LayerWeightConst.SECOND_LAYER,
		groupName = LayerWeightConst.GROUP_DORM3D
	})
	arg_91_0:ActiveCamera(arg_91_0.cameras[var_0_0.CAMERA.POV])
	arg_91_0:RefreshSlots()

	arg_91_0.updateHandler = UpdateBeat:CreateListener(function()
		xpcall(function()
			arg_91_0:Update()
		end, function(...)
			errorMsg(debug.traceback(...))
		end)
	end)

	UpdateBeat:AddListener(arg_91_0.updateHandler)
end

function var_0_0.InitData(arg_105_0)
	if not arg_105_0.contextData.ladyZone then
		arg_105_0.contextData.ladyZone = {}

		local var_105_0
		local var_105_1 = arg_105_0.room:getConfig("default_zone")

		for iter_105_0, iter_105_1 in ipairs(arg_105_0.contextData.groupIds) do
			for iter_105_2, iter_105_3 in ipairs(var_105_1) do
				if iter_105_3[1] == iter_105_1 then
					arg_105_0.contextData.ladyZone[iter_105_1] = iter_105_3[2]

					break
				end
			end

			assert(arg_105_0.contextData.ladyZone[iter_105_1])

			var_105_0 = var_105_0 or arg_105_0.contextData.ladyZone[iter_105_1]
		end

		arg_105_0.contextData.inFurnitureName = var_105_0 or arg_105_0.room:getConfig("default_zone")[1][2]
	end

	arg_105_0.zoneDatas = _.select(arg_105_0.room:GetZones(), function(arg_106_0)
		return not arg_106_0:IsGlobal()
	end)
	arg_105_0.readyIKLayers = {}
	arg_105_0.activeIKLayers = {}
	arg_105_0.holdingStatus = {}
	arg_105_0.cacheIKInfos = {}
	arg_105_0.activeSectors = {}
	arg_105_0.activeLady = {}
end

function var_0_0.Update(arg_107_0)
	arg_107_0.raycastCamera.fieldOfView = arg_107_0.mainCameraTF:GetComponent(typeof(Camera)).fieldOfView

	if arg_107_0.tweenFOV then
		local var_107_0 = Damp(1, 1, Time.deltaTime)

		arg_107_0.pinchValue = Mathf.Lerp(arg_107_0.pinchValue, 1, var_107_0)

		arg_107_0:SetPOVFOV(arg_107_0.POVOriginalFOV * arg_107_0.pinchValue)

		if arg_107_0.pinchValue > 0.99 then
			arg_107_0.tweenFOV = nil
		end
	end

	if isActive(arg_107_0.cameras[var_0_0.CAMERA.POV]) then
		arg_107_0:TriggerLadyDistance()
	end

	if arg_107_0.contactInRangeDic then
		local var_107_1 = arg_107_0.mainCameraTF.forward
		local var_107_2 = arg_107_0.mainCameraTF.position
		local var_107_3 = UnityEngine.Rect.New(0, 0, Screen.width, Screen.height)

		local function var_107_4(arg_108_0, arg_108_1, arg_108_2)
			local var_108_0 = arg_108_0.position - var_107_2
			local var_108_1 = Clone(var_108_0)

			var_108_1.y = 0

			if arg_108_1 < var_108_1.magnitude then
				return false
			end

			local var_108_2 = var_108_0:Normalize()
			local var_108_3 = math.acos(Vector3.Dot(var_108_2, var_107_1)) * math.rad2Deg

			if arg_108_2 < math.abs(var_108_3) then
				return false
			end

			local var_108_4 = arg_107_0.raycastCamera:WorldToScreenPoint(arg_108_0.position)

			if var_108_4.z < 0 then
				return false
			end

			if not var_107_3:Contains(var_108_4) then
				return false
			end

			return true
		end

		for iter_107_0, iter_107_1 in pairs(arg_107_0.contactInRangeDic) do
			local var_107_5 = pg.dorm3d_collection_template[iter_107_0]
			local var_107_6 = underscore.any(var_107_5.vfx_prefab, function(arg_109_0)
				return arg_107_0.modelRoot:Find(arg_109_0) and var_107_4(arg_107_0.modelRoot:Find(arg_109_0), 2, 60)
			end)

			if tobool(iter_107_1) ~= var_107_6 then
				arg_107_0.contactInRangeDic[iter_107_0] = var_107_6

				arg_107_0:UpdateContactDisplay(iter_107_0, var_107_6 and not arg_107_0.hideConcatFlag and arg_107_0.contactStateDic[iter_107_0] or arg_107_0.hideContactStateDic[iter_107_0])
			end
		end
	end

	if arg_107_0.enableFloatUpdate then
		arg_107_0.ladyDict[arg_107_0.apartment:GetConfigID()]:UpdateFloatPosition()
	end

	arg_107_0:CheckInSector()

	if arg_107_0.apartment then
		(function(arg_110_0)
			(function()
				if not arg_110_0.ikHandler then
					return
				end

				if not arg_110_0.ikHandler.targetScreenOffset then
					return
				end

				local var_111_0 = arg_110_0.ikHandler.rect
				local var_111_1 = var_111_0:PointToNormalized(Vector2.zero)
				local var_111_2 = var_111_0:PointToNormalized(arg_110_0.ikHandler.targetScreenOffset) - var_111_1

				_.each(arg_110_0.ikHandler.subPlanes, function(arg_112_0)
					local var_112_0 = arg_112_0.target
					local var_112_1 = arg_112_0.planeData

					var_112_0.position = var_0_0.GetPostionByRatio(var_112_1, var_111_2)
				end)

				if Time.time > arg_110_0.ikNextCheckStamp then
					arg_110_0.ikNextCheckStamp = arg_110_0.ikNextCheckStamp + var_0_0.IK_STATUS_DELTA

					arg_110_0:emit(var_0_0.ON_IK_STATUS_CHANGED, arg_110_0.ikHandler.ikData:GetConfigID(), var_0_0.IK_STATUS.DRAG)
				end

				arg_110_0:ResetIKTipTimer()
			end)()

			if arg_110_0.enableIKTip then
				local var_110_0 = Time.time > arg_110_0.nextTipIKTime
				local var_110_1 = arg_110_0:GetIKTipsRootTF()

				if var_110_0 then
					UIItemList.StaticAlign(var_110_1, var_110_1:GetChild(0), #arg_110_0.readyIKLayers, function(arg_113_0, arg_113_1, arg_113_2)
						if arg_113_0 ~= UIItemList.EventUpdate then
							return
						end

						local var_113_0 = arg_110_0.readyIKLayers[arg_113_1 + 1].ikData
						local var_113_1 = var_113_0:GetTriggerBoneName()
						local var_113_2 = var_113_1 and arg_110_0.ladyColliders[var_113_1] or nil

						if var_113_2 and not (function()
							local var_114_0 = arg_110_0.raycastCamera:WorldToScreenPoint(var_113_2.position)
							local var_114_1 = CameraMgr.instance:Raycast(arg_110_0.sceneRaycaster, var_114_0)

							if var_114_1.Length == 0 then
								return
							end

							return var_113_2 == var_114_1[0].gameObject.transform
						end)() then
							var_113_2 = nil
						end

						if var_113_2 then
							setLocalPosition(arg_113_2, arg_110_0:GetLocalPosition(arg_110_0:GetScreenPosition(var_113_2.position), var_110_1) + var_113_0:GetIKTipOffset())
						end

						setActive(arg_113_2, var_113_2)
					end)
				end

				setActive(var_110_1, var_110_0)
			end

			if arg_110_0.ikRevertHandler then
				arg_110_0.ikRevertHandler()
			end
		end)(arg_107_0.ladyDict[arg_107_0.apartment:GetConfigID()])
	end
end

function var_0_0.CheckInSector(arg_115_0)
	if not isActive(arg_115_0.cameras[var_0_0.CAMERA.POV]) then
		return
	end

	local var_115_0 = arg_115_0.mainCameraTF.position

	var_115_0.y = 0

	for iter_115_0, iter_115_1 in pairs(arg_115_0.ladyDict) do
		local var_115_1 = tobool(arg_115_0.activeLady[iter_115_0])

		if var_115_1 ~= tobool(var_0_0.IsPointInSector(arg_115_0.activeSectors[iter_115_1.ladyActiveZone], var_115_0)) then
			arg_115_0.activeLady[iter_115_0] = not var_115_1

			arg_115_0:emit(var_0_0.ON_ENTER_SECTOR, iter_115_0)
		end
	end
end

function var_0_0.TriggerLadyDistance(arg_116_0)
	local function var_116_0(arg_117_0, arg_117_1)
		arg_117_0.dis = (arg_117_0.lady.position - arg_117_0.player.position).magnitude

		if (arg_117_0:GetBlackboardValue("inPending") and var_0_0.POV_PENDING_CLOSE_DISTANCE or var_0_0.POV_CLOSE_DISTANCE) > arg_117_0.dis ~= arg_117_0:GetBlackboardValue("inDistance") then
			arg_117_0:SetBlackboardValue("inDistance", arg_117_0.dis < var_0_0.POV_CLOSE_DISTANCE)
			arg_117_0:emit(var_0_0.ON_CHANGE_DISTANCE, arg_117_1, arg_117_0.dis < var_0_0.POV_CLOSE_DISTANCE)
		end
	end

	for iter_116_0, iter_116_1 in pairs(arg_116_0.ladyDict) do
		var_116_0(iter_116_1, iter_116_0)
	end
end

function var_0_0.OnStickMove(arg_118_0, arg_118_1)
	arg_118_0.joystickDelta = arg_118_1
end

function var_0_0.SetPinchValue(arg_119_0, arg_119_1)
	arg_119_0.pinchValue = arg_119_1

	arg_119_0:SetCameraObrits()
end

function var_0_0.GetPOVFOV(arg_120_0)
	local var_120_0 = arg_120_0.cameras[var_0_0.CAMERA.POV].m_Lens

	return ReflectionHelp.RefGetField(typeof("Cinemachine.LensSettings"), "FieldOfView", var_120_0)
end

function var_0_0.SetPOVFOV(arg_121_0, arg_121_1)
	local var_121_0 = arg_121_0.cameras[var_0_0.CAMERA.POV].m_Lens

	ReflectionHelp.RefSetField(typeof("Cinemachine.LensSettings"), "FieldOfView", var_121_0, arg_121_1)

	arg_121_0.cameras[var_0_0.CAMERA.POV].m_Lens = var_121_0
end

function var_0_0.RefreshSlots(arg_122_0, arg_122_1)
	arg_122_1 = arg_122_1 or arg_122_0.room

	local var_122_0 = arg_122_1:GetSlots()
	local var_122_1 = arg_122_1:GetFurnitures()

	arg_122_0:emit(var_0_0.SHOW_BLOCK)
	table.ParallelIpairsAsync(var_122_0, function(arg_123_0, arg_123_1, arg_123_2)
		local var_123_0 = arg_123_1:GetConfigID()
		local var_123_1 = _.detect(var_122_1, function(arg_124_0)
			return arg_124_0:GetSlotID() == var_123_0
		end)
		local var_123_2 = var_123_1 and var_123_1:GetModel() or false
		local var_123_3 = arg_122_0.slotDict[var_123_0].model

		arg_122_0.slotDict[var_123_0].displayModelName = var_123_2

		if var_123_2 == false or var_123_2 == "" then
			arg_122_0.loader:ClearRequest("slot_" .. var_123_0)

			if var_123_3 then
				setActive(var_123_3, var_123_2 == "")
			end

			arg_123_2()

			return
		end

		local var_123_4 = arg_122_0.slotDict[var_123_0].trans

		arg_122_0.loader:GetPrefabBYStopLoading("dorm3d/furniture/prefabs/" .. var_123_2, "", function(arg_125_0)
			arg_123_2()
			assert(arg_125_0)
			setParent(arg_125_0, var_123_4)

			if var_123_3 then
				local var_125_0 = arg_125_0:GetComponentsInChildren(typeof(Renderer), true)

				table.IpairsCArray(var_125_0, function(arg_126_0, arg_126_1)
					LuaHelper.CopyLightMap(arg_126_1.gameObject, arg_125_0)
				end)
				setActive(var_123_3, false)
			end
		end, "slot_" .. var_123_0)
	end, function()
		arg_122_0:emit(var_0_0.HIDE_BLOCK)
	end)
end

function var_0_0.ChangeCharacterPosition(arg_128_0)
	arg_128_0:ResetCharPoint(arg_128_0.ladyActiveZone)
	arg_128_0:SyncInterestTransform()
end

function var_0_0.SyncInterestTransform(arg_129_0)
	arg_129_0.ladyInterest.position = arg_129_0.ladyInterestRoot.position
	arg_129_0.ladyInterest.rotation = arg_129_0.ladyInterestRoot.rotation
end

function var_0_0.ChangePlayerPosition(arg_130_0, arg_130_1)
	arg_130_1 = arg_130_1 or arg_130_0.contextData.inFurnitureName

	local var_130_0 = arg_130_0.furnitures:Find(arg_130_1):Find("PlayerPoint").position

	arg_130_0.player.position = var_130_0
	arg_130_0.cameras[var_0_0.CAMERA.POV].transform.position = arg_130_0.playerEye.position

	local var_130_1 = arg_130_0.ladyInterest.position - arg_130_0.playerEye.position
	local var_130_2 = Quaternion.LookRotation(var_130_1).eulerAngles
	local var_130_3 = var_130_2.y
	local var_130_4 = var_130_2.x
	local var_130_5 = arg_130_0.compPov.m_HorizontalAxis

	var_130_5.Value = arg_130_0:GetNearestAngle(var_130_3, var_130_5.m_MinValue, var_130_5.m_MaxValue)
	arg_130_0.compPov.m_HorizontalAxis = var_130_5

	local var_130_6 = arg_130_0.compPov.m_VerticalAxis

	var_130_6.Value = var_130_4
	arg_130_0.compPov.m_VerticalAxis = var_130_6
end

function var_0_0.GetAttachedFurnitureName(arg_131_0)
	return arg_131_0.contextData.inFurnitureName
end

function var_0_0.GetFurnitureByName(arg_132_0, arg_132_1)
	return underscore.detect(arg_132_0.attachedPoints, function(arg_133_0)
		return arg_133_0.name == arg_132_1
	end)
end

function var_0_0.GetSlotByID(arg_134_0, arg_134_1)
	return arg_134_0.displaySlots[arg_134_1] and arg_134_0.displaySlots[arg_134_1].trans
end

function var_0_0.GetScreenPosition(arg_135_0, arg_135_1)
	local var_135_0 = arg_135_0.raycastCamera:WorldToScreenPoint(arg_135_1)

	if var_135_0.z < 0 then
		var_135_0.x = var_135_0.x + (var_135_0.x < 0 and -1 or 1) * Screen.width
		var_135_0.y = var_135_0.y + (var_135_0.y < 0 and -1 or 1) * Screen.height
		var_135_0.z = -var_135_0.z
	end

	return var_135_0
end

function var_0_0.GetLocalPosition(arg_136_0, arg_136_1, arg_136_2)
	return LuaHelper.ScreenToLocal(arg_136_2, arg_136_1, pg.UIMgr.GetInstance().uiCameraComp)
end

function var_0_0.GetModelRoot(arg_137_0)
	return arg_137_0.modelRoot
end

function var_0_0.ShiftZone(arg_138_0, arg_138_1, arg_138_2)
	local var_138_0 = arg_138_0:GetFurnitureByName(arg_138_1)

	if not var_138_0 then
		errorMsg(arg_138_1 .. " Not Find")
		existCall(arg_138_2)

		return
	end

	seriesAsync({
		function(arg_139_0)
			arg_138_0:emit(var_0_0.SHOW_BLOCK)
			arg_138_0:ShowBlackScreen(true, arg_139_0)
		end,
		function(arg_140_0)
			if arg_138_0.shiftLady or arg_138_0.room:isPersonalRoom() then
				local var_140_0 = arg_138_0.shiftLady or arg_138_0.apartment:GetConfigID()

				arg_138_0.shiftLady = nil
				arg_138_0.contextData.ladyZone[var_140_0] = var_138_0.name

				local var_140_1 = arg_138_0.ladyDict[var_140_0]

				var_140_1.ladyBaseZone = arg_138_0.contextData.ladyZone[var_140_0]
				var_140_1.ladyActiveZone = arg_138_0.contextData.ladyZone[var_140_0]

				if var_140_1:GetBlackboardValue("inPending") then
					var_140_1:SetOutPending()
					var_140_1:SwitchAnim(var_0_0.ANIM.IDLE)
					onNextTick(function()
						var_140_1:ChangeCharacterPosition()
						arg_140_0()
					end)
				else
					var_140_1:ChangeCharacterPosition()
					arg_140_0()
				end
			else
				arg_140_0()
			end
		end,
		function(arg_142_0)
			arg_138_0.contextData.inFurnitureName = var_138_0.name

			arg_138_0:ChangePlayerPosition()
			arg_138_0:TriggerLadyDistance()
			arg_138_0:CheckInSector()
			arg_142_0()
		end,
		function(arg_143_0)
			arg_138_0:UpdateZoneList()
			arg_138_0:ShowBlackScreen(false, arg_143_0)
		end,
		function(arg_144_0)
			arg_138_0:emit(var_0_0.HIDE_BLOCK)
			arg_144_0()
		end
	}, arg_138_2)
end

function var_0_0.WalkByRootMotionLoop(arg_145_0, arg_145_1, arg_145_2)
	if arg_145_1.pathPending then
		arg_145_2:SetFloat("Speed", 0)

		return
	end

	arg_145_2:SetFloat("Speed", 1)

	local var_145_0 = arg_145_1.path.corners

	if var_145_0.Length > 1 then
		local var_145_1 = var_145_0[1] - arg_145_1.transform.position

		var_145_1.y = 0

		local var_145_2 = Quaternion.LookRotation(var_145_1)
		local var_145_3 = arg_145_1.transform.rotation
		local var_145_4 = 1
		local var_145_5 = Damp(1, var_145_4, Time.deltaTime)

		arg_145_1.transform.rotation = Quaternion.Lerp(var_145_3, var_145_2, var_145_5)
	end
end

function var_0_0.ActiveCamera(arg_146_0, arg_146_1)
	if isActive(arg_146_1) then
		arg_146_0:OnCameraBlendFinished(arg_146_1)
	end

	table.Foreach(arg_146_0.cameras, function(arg_147_0, arg_147_1)
		setActive(arg_147_1, arg_147_1 == arg_146_1)
	end)
end

function var_0_0.ShowBlackScreen(arg_148_0, arg_148_1, arg_148_2)
	local var_148_0 = arg_148_0.blackSceneInfo or {
		color = "#000000",
		time = 0.3,
		delay = arg_148_1 and 0 or 0.3
	}

	setImageColor(arg_148_0.blackLayer, Color.NewHex(var_148_0.color))
	setActive(arg_148_0.blackLayer, true)
	setCanvasGroupAlpha(arg_148_0.blackLayer, arg_148_1 and 0 or 1)
	arg_148_0:managedTween(LeanTween.alphaCanvas, function()
		if not arg_148_1 then
			setActive(arg_148_0.blackLayer, false)
		end

		existCall(arg_148_2)
	end, GetComponent(arg_148_0.blackLayer, typeof(CanvasGroup)), arg_148_1 and 1 or 0, var_148_0.time):setDelay(var_148_0.delay)
end

function var_0_0.RegisterOrbits(arg_150_0, arg_150_1)
	arg_150_0 = arg_150_0.scene
	arg_150_0.orbits = {
		original = arg_150_1.m_Orbits
	}
	arg_150_0.orbits.current = _.range(3):map(function(arg_151_0)
		local var_151_0 = arg_150_0.orbits.original[arg_151_0 - 1]

		return Cinemachine.CinemachineFreeLook.Orbit.New(var_151_0.m_Height, var_151_0.m_Radius)
	end)
	arg_150_0.surroudCamera = arg_150_1
end

function var_0_0.SetCameraObrits(arg_152_0)
	local var_152_0 = arg_152_0.surroudCamera

	if not var_152_0 then
		return
	end

	local var_152_1 = arg_152_0.orbits.original[1]

	for iter_152_0 = 0, #arg_152_0.orbits.current - 1 do
		local var_152_2 = arg_152_0.orbits.current[iter_152_0 + 1]
		local var_152_3 = arg_152_0.orbits.original[iter_152_0]

		var_152_2.m_Height = math.lerp(var_152_1.m_Height, var_152_3.m_Height, arg_152_0.pinchValue)
		var_152_2.m_Radius = var_152_3.m_Radius * arg_152_0.pinchValue
	end

	var_152_0.m_Orbits = arg_152_0.orbits.current
end

function var_0_0.RevertCameraOrbit(arg_153_0)
	arg_153_0 = arg_153_0.scene

	local var_153_0 = arg_153_0.surroudCamera

	if not var_153_0 then
		return
	end

	for iter_153_0 = 0, #arg_153_0.orbits.current - 1 do
		local var_153_1 = arg_153_0.orbits.current[iter_153_0 + 1]
		local var_153_2 = arg_153_0.orbits.original[iter_153_0]

		var_153_1.m_Height = var_153_2.m_Height
		var_153_1.m_Radius = var_153_2.m_Radius
	end

	var_153_0.m_Orbits = arg_153_0.orbits.current
	arg_153_0.surroudCamera = nil
end

function var_0_0.ActiveStateCamera(arg_154_0, arg_154_1, arg_154_2)
	local var_154_0 = {
		base = function(arg_155_0)
			arg_154_0:RegisterCameraBlendFinished(arg_154_0.cameras[var_0_0.CAMERA.POV], arg_155_0)
			arg_154_0:ActiveCamera(arg_154_0.cameras[var_0_0.CAMERA.POV])
		end,
		watch = function(arg_156_0)
			assert(arg_154_0.apartment)
			arg_154_0.ladyDict[arg_154_0.apartment:GetConfigID()]:SetCameraLady()
			arg_154_0:RegisterCameraBlendFinished(arg_154_0.cameras[var_0_0.CAMERA.ROLE], arg_156_0)
			arg_154_0:ActiveCamera(arg_154_0.cameras[var_0_0.CAMERA.ROLE])
		end,
		walk = function(arg_157_0)
			arg_154_0:RegisterCameraBlendFinished(arg_154_0.cameras[var_0_0.CAMERA.POV], arg_157_0)
			arg_154_0:ActiveCamera(arg_154_0.cameras[var_0_0.CAMERA.POV])
		end,
		ik = function(arg_158_0)
			arg_158_0()
		end,
		gift = function(arg_159_0)
			assert(arg_154_0.apartment)
			arg_154_0.ladyDict[arg_154_0.apartment:GetConfigID()]:SetCameraLady()
			arg_154_0:RegisterCameraBlendFinished(arg_154_0.cameras[var_0_0.CAMERA.GIFT], arg_159_0)
			arg_154_0:ActiveCamera(arg_154_0.cameras[var_0_0.CAMERA.GIFT])
		end,
		standby = function(arg_160_0)
			assert(arg_154_0.apartment)
			arg_154_0.ladyDict[arg_154_0.apartment:GetConfigID()]:SetCameraLady()

			arg_154_0.cameras[var_0_0.CAMERA.ROLE2].transform.position = arg_154_0.cameraRole.transform.position

			arg_154_0:RegisterCameraBlendFinished(arg_154_0.cameras[var_0_0.CAMERA.ROLE2], arg_160_0)
			arg_154_0:ActiveCamera(arg_154_0.cameras[var_0_0.CAMERA.ROLE2])
		end,
		talk = function(arg_161_0)
			assert(arg_154_0.apartment)
			arg_154_0.ladyDict[arg_154_0.apartment:GetConfigID()]:SetCameraLady()
			arg_154_0:RegisterCameraBlendFinished(arg_154_0.cameras[var_0_0.CAMERA.TALK], arg_161_0)
			arg_154_0:ActiveCamera(arg_154_0.cameras[var_0_0.CAMERA.TALK])
		end
	}
	local var_154_1 = {}

	table.insert(var_154_1, function(arg_162_0)
		switch(arg_154_1, var_154_0, arg_162_0, arg_162_0)
	end)
	seriesAsync(var_154_1, arg_154_2)
end

function var_0_0.SetIKStatus(arg_163_0, arg_163_1, arg_163_2)
	warning("Set IKStatus " .. (arg_163_1.id or "NIL"))

	arg_163_0.enableIKTip = true

	setActive(arg_163_0.ladyCollider, false)
	_.each(arg_163_0.ladyTouchColliders, function(arg_164_0)
		setActive(arg_164_0, true)
	end)
	table.clear(arg_163_0.readyIKLayers)

	arg_163_0.blockIK = nil

	local var_163_0 = _.map(arg_163_1.ik_id, function(arg_165_0)
		return arg_165_0[1]
	end)

	table.Foreach(var_163_0, function(arg_166_0, arg_166_1)
		local var_166_0 = Dorm3dIK.New({
			configId = arg_166_1
		})

		table.insert(arg_163_0.readyIKLayers, {
			ikData = var_166_0
		})

		arg_163_0.cacheIKInfos[var_166_0] = {}

		local var_166_1 = var_166_0:GetControllerPath()
		local var_166_2 = arg_163_0.ladyIKRoot:Find(var_166_1):GetComponent(typeof(RootMotion.FinalIK.IKExecutionOrder))
		local var_166_3 = {}

		table.IpairsCArray(var_166_2.IKComponents, function(arg_167_0, arg_167_1)
			var_166_3[arg_167_0 + 1] = arg_167_1:GetIKSolver()
		end)

		arg_163_0.cacheIKInfos[var_166_0].solvers = var_166_3

		local var_166_4 = _.map(var_166_3, function(arg_168_0)
			return arg_168_0.IKPositionWeight
		end)

		arg_163_0.cacheIKInfos[var_166_0].weights = var_166_4
	end)

	arg_163_0.camBrain.enabled = false

	if arg_163_0.cameras[var_0_0.CAMERA.IK_WATCH] then
		setActive(arg_163_0.cameras[var_0_0.CAMERA.IK_WATCH], false)

		arg_163_0.cameras[var_0_0.CAMERA.IK_WATCH] = nil
	end

	local var_163_1 = arg_163_0.cameraRoot:Find(arg_163_1.ik_camera)

	assert(var_163_1, "Missing IKCamera")

	arg_163_0.cameras[var_0_0.CAMERA.IK_WATCH] = var_163_1

	arg_163_0:ActiveCamera(arg_163_0.cameras[var_0_0.CAMERA.IK_WATCH])

	arg_163_0.camBrain.enabled = true

	local var_163_2 = var_163_1:GetComponent(typeof(Cinemachine.CinemachineFreeLook))

	if var_163_2 then
		arg_163_0:RegisterOrbits(var_163_2)
	end

	arg_163_0:SettingHeadAimIK(arg_163_0, arg_163_0.ikConfig.head_track)
	arg_163_0:ResetIKTipTimer()
	arg_163_0:SwitchAnim(arg_163_1.character_action)
	onNextTick(function()
		local var_169_0 = arg_163_0.furnitures:Find(arg_163_1.character_position)

		arg_163_0.lady.position = var_169_0:Find("StayPoint").position
		arg_163_0.lady.rotation = var_169_0:Find("StayPoint").rotation

		arg_163_0:EnableCloth(false)
		arg_163_0:EnableCloth(arg_163_1.use_cloth, arg_163_1.cloth_colliders)
		existCall(arg_163_2)
	end)
end

function var_0_0.ExitIKStatus(arg_170_0, arg_170_1, arg_170_2)
	arg_170_0.enableIKTip = false

	setActive(arg_170_0.ladyCollider, true)
	_.each(arg_170_0.ladyTouchColliders, function(arg_171_0)
		setActive(arg_171_0, false)
	end)
	arg_170_0:ResetActiveIKs(arg_170_0)
	table.clear(arg_170_0.readyIKLayers)
	table.clear(arg_170_0.cacheIKInfos)
	table.clear(arg_170_0.activeIKLayers)
	table.clear(arg_170_0.holdingStatus)
	eachChild(arg_170_0.ladyIKRoot, function(arg_172_0)
		setActive(arg_172_0, false)
	end)
	setActive(arg_170_0:GetIKTipsRootTF(), false)
	arg_170_0:RevertCameraOrbit()
	setActive(arg_170_0.cameras[var_0_0.CAMERA.IK_WATCH], false)

	arg_170_0.cameras[var_0_0.CAMERA.IK_WATCH] = nil

	arg_170_0:EnableCloth(false)
	arg_170_0:ResetHeadAimIK(arg_170_0)
	arg_170_0:SwitchAnim(arg_170_1.character_action)
	onNextTick(function()
		if arg_170_1.character_position then
			arg_170_0.ladyActiveZone = arg_170_1.character_position
		else
			arg_170_0.ladyActiveZone = arg_170_0.ladyBaseZone
		end

		arg_170_0:ChangeCharacterPosition()
		arg_170_0:TriggerLadyDistance()
		arg_170_0:CheckInSector()
		existCall(arg_170_2)
	end)
end

function var_0_0.EnableIKLayer(arg_174_0, arg_174_1, arg_174_2)
	warning("ENABLEIK", arg_174_2:GetConfigID())

	local var_174_0 = arg_174_2:GetControllerPath()
	local var_174_1 = arg_174_1.ladyIKRoot:Find(var_174_0):GetComponent(typeof(RootMotion.FinalIK.IKExecutionOrder))
	local var_174_2 = tf(var_174_1):Find("Container")
	local var_174_3 = {
		ikData = arg_174_2,
		list = var_174_1
	}

	if not arg_174_1.holdingStatus[arg_174_2] then
		var_174_3.rect = arg_174_2:GetRect()

		local var_174_4 = arg_174_2:GetActionTriggerParams()

		if var_174_4[1] == Dorm3dIK.ACTION_TRIGGER.RELEASE_ON_TARGET or var_174_4[1] == Dorm3dIK.ACTION_TRIGGER.TOUCH_TARGET then
			var_174_3.triggerRect = arg_174_2:GetTriggerRect()
		end

		local var_174_5 = var_174_2:Find("SubTargets")
		local var_174_6 = {}

		assert(var_174_5)

		local var_174_7 = arg_174_2:GetSubTargets()
		local var_174_8 = arg_174_2:GetPlaneRotations()
		local var_174_9 = arg_174_2:GetPlaneScales()

		table.Foreach(var_174_7, function(arg_175_0, arg_175_1)
			local var_175_0 = var_174_5:Find(arg_175_1[1])
			local var_175_1 = var_175_0:Find("Plane")

			if var_174_8[arg_175_0] then
				var_175_1.localRotation = var_174_8[arg_175_0]
				var_175_1.localScale = var_174_9[arg_175_0]
			end

			local var_175_2 = var_175_0:Find("Target")
			local var_175_3 = var_0_0.TransformMesh(var_175_1:GetComponent(typeof(UnityEngine.MeshCollider)))
			local var_175_4 = arg_174_1.ladyBoneMaps[arg_175_1[1]]

			var_175_3.origin = var_175_4.position

			local var_175_5 = var_174_3.rect
			local var_175_6 = Vector2.New(var_175_5.center.x / var_175_5.width, var_175_5.center.y / var_175_5.height)

			var_175_1.position = var_0_0.GetPostionByRatio(var_175_3, var_175_6)
			var_175_2.position = var_175_4.position

			local var_175_7 = {
				planeData = var_175_3,
				target = var_175_2,
				useOffset = tobool(arg_175_1)
			}

			table.insert(var_174_6, var_175_7)
		end)

		var_174_3.subPlanes = var_174_6

		setActive(var_174_1, true)
	else
		var_174_3 = arg_174_1.holdingStatus[arg_174_2].ikHandler
	end

	if #arg_174_2:GetHeadTrackPath() > 0 then
		arg_174_0:SettingHeadAimIK(arg_174_1, {
			2,
			arg_174_2:GetHeadTrackPath()
		}, true)
	end

	local var_174_10 = arg_174_2:GetTriggerFaceAnim()

	if #var_174_10 > 0 then
		arg_174_0:PlayFaceAnim(var_174_10)
	end

	setActive(arg_174_0:GetIKHandTF(), true)
	eachChild(arg_174_0:GetIKHandTF(), function(arg_176_0)
		setActive(arg_176_0, false)
	end)
	arg_174_0:StopIKHandTimer()
	setActive(arg_174_0:GetIKHandTF():Find("Begin"), true)

	arg_174_1.ikHandTimer = Timer.New(function()
		setActive(arg_174_0:GetIKHandTF():Find("Begin"), false)
		setActive(arg_174_0:GetIKHandTF():Find("Normal"), true)
	end, 0.5, 1)

	arg_174_1.ikHandTimer:Start()

	arg_174_1.ikNextCheckStamp = Time.time + var_0_0.IK_STATUS_DELTA

	arg_174_0:emit(var_0_0.ON_IK_STATUS_CHANGED, arg_174_2:GetConfigID(), var_0_0.IK_STATUS.BEGIN)
	pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataTouch(arg_174_0.apartment.configId, arg_174_0.apartment.level, arg_174_1.ikConfig.character_action, arg_174_2:GetTriggerParams()[2], arg_174_0.room:GetConfigID()))

	return var_174_3
end

function var_0_0.DeactiveIKLayer(arg_178_0, arg_178_1)
	if #arg_178_1:GetHeadTrackPath() > 0 then
		arg_178_0:SettingHeadAimIK(arg_178_0, arg_178_0.ikConfig.head_track)
	end

	arg_178_0:StopIKHandTimer()
	setActive(arg_178_0:GetIKHandTF():Find("Begin"), false)
	setActive(arg_178_0:GetIKHandTF():Find("Normal"), false)
	setActive(arg_178_0:GetIKHandTF():Find("End"), true)

	arg_178_0.ikHandTimer = Timer.New(function()
		setActive(arg_178_0:GetIKHandTF():Find("End"), false)
		setActive(arg_178_0:GetIKHandTF(), false)
	end, 0.5, 1)

	arg_178_0.ikHandTimer:Start()
end

function var_0_0.StopIKHandTimer(arg_180_0)
	if not arg_180_0.ikHandTimer then
		return
	end

	arg_180_0.ikHandTimer:Stop()

	arg_180_0.ikHandTimer = nil
end

function var_0_0.RevertIKLayer(arg_181_0, arg_181_1, arg_181_2)
	seriesAsync({
		function(arg_182_0)
			if arg_181_1 >= 999 then
				return arg_182_0()
			end

			arg_181_0:PlayIKRevert(arg_181_0, arg_181_1, arg_182_0)
		end,
		arg_181_2
	})
end

function var_0_0.RevertAllIKLayer(arg_183_0, arg_183_1, arg_183_2)
	table.insertto(arg_183_0.activeIKLayers, _.keys(arg_183_0.holdingStatus))
	table.clear(arg_183_0.holdingStatus)
	arg_183_0.RevertIKLayer(arg_183_0, arg_183_1, arg_183_2)
end

function var_0_0.PlayIKRevert(arg_184_0, arg_184_1, arg_184_2, arg_184_3)
	local var_184_0 = Time.time

	function arg_184_0.ikRevertHandler()
		local var_185_0 = Time.time - var_184_0

		_.each(arg_184_1.activeIKLayers, function(arg_186_0)
			local var_186_0 = 1

			if arg_184_2 > 0 then
				var_186_0 = var_185_0 / arg_184_2
			end

			local var_186_1 = arg_184_1.cacheIKInfos[arg_186_0].solvers
			local var_186_2 = arg_184_1.cacheIKInfos[arg_186_0].weights

			table.Foreach(var_186_1, function(arg_187_0, arg_187_1)
				arg_187_1.IKPositionWeight = math.lerp(var_186_2[arg_187_0], 0, var_186_0)
			end)
		end)

		if var_185_0 >= arg_184_2 then
			arg_184_0:ResetActiveIKs(arg_184_1)

			arg_184_0.ikRevertHandler = nil

			existCall(arg_184_3)
		end
	end

	arg_184_0.ikRevertHandler()
end

function var_0_0.ResetActiveIKs(arg_188_0, arg_188_1)
	table.insertto(arg_188_0.activeIKLayers, _.keys(arg_188_0.holdingStatus))
	table.clear(arg_188_0.holdingStatus)
	_.each(arg_188_1.activeIKLayers, function(arg_189_0)
		local var_189_0 = arg_189_0:GetControllerPath()
		local var_189_1 = arg_188_1.ladyIKRoot:Find(var_189_0):GetComponent(typeof(RootMotion.FinalIK.IKExecutionOrder))

		setActive(var_189_1, false)

		local var_189_2 = arg_188_1.cacheIKInfos[arg_189_0].solvers
		local var_189_3 = arg_188_1.cacheIKInfos[arg_189_0].weights

		table.Foreach(var_189_2, function(arg_190_0, arg_190_1)
			arg_190_1.IKPositionWeight = var_189_3[arg_190_0]
		end)
	end)
	table.clear(arg_188_1.activeIKLayers)
end

function var_0_0.PlayIKAction(arg_191_0, arg_191_1)
	warning("Trigger IK", arg_191_1:GetConfigID())
	arg_191_0:emit(var_0_0.ON_IK_STATUS_CHANGED, arg_191_1:GetConfigID(), var_0_0.IK_STATUS.TRIGGER)
	arg_191_0:OnTriggerIK(arg_191_1:GetConfigID())
end

function var_0_0.ResetIKTipTimer(arg_192_0)
	if not arg_192_0.enableIKTip then
		return
	end

	arg_192_0.nextTipIKTime = Time.time + var_0_0.IK_TIP_WAIT_TIME
end

function var_0_0.EnableHeadIK(arg_193_0, arg_193_1)
	arg_193_0.ladyHeadIKComp.enableIk = arg_193_1
end

function var_0_0.SettingHeadAimIK(arg_194_0, arg_194_1, arg_194_2, arg_194_3)
	local var_194_0

	if arg_194_2[1] == 1 then
		var_194_0 = arg_194_0.mainCameraTF:Find("AimTarget")
	elseif arg_194_2[1] == 2 then
		table.IpairsCArray(arg_194_1.lady:GetComponentsInChildren(typeof(Transform), true), function(arg_195_0, arg_195_1)
			if arg_195_1.name ~= arg_194_2[2] then
				return
			end

			var_194_0 = arg_195_1
		end)
	end

	arg_194_1.ladyHeadIKComp.AimTarget = var_194_0

	if not arg_194_3 and arg_194_2[3] then
		arg_194_1.ladyHeadIKComp.BodyWeight = arg_194_2[3]
	end

	if not arg_194_3 and arg_194_2[4] then
		arg_194_1.ladyHeadIKComp.HeadWeight = arg_194_2[4]
	end
end

function var_0_0.ResetHeadAimIK(arg_196_0, arg_196_1)
	arg_196_1.ladyHeadIKComp.AimTarget = arg_196_0.mainCameraTF:Find("AimTarget")
	arg_196_1.ladyHeadIKComp.HeadWeight = arg_196_1.ladyHeadIKData.HeadWeight
	arg_196_1.ladyHeadIKComp.BodyWeight = arg_196_1.ladyHeadIKData.BodyWeight
end

function var_0_0.HideCharacter(arg_197_0, arg_197_1)
	local function var_197_0(arg_198_0)
		arg_198_0:HideCharacterBylayer()
	end

	for iter_197_0, iter_197_1 in pairs(arg_197_0.ladyDict) do
		if iter_197_0 ~= arg_197_1 then
			var_197_0(iter_197_1)
		end
	end
end

function var_0_0.RevertCharacter(arg_199_0, arg_199_1)
	local function var_199_0(arg_200_0)
		arg_200_0:RevertCharacterBylayer()
	end

	for iter_199_0, iter_199_1 in pairs(arg_199_0.ladyDict) do
		if iter_199_0 ~= arg_199_1 then
			var_199_0(iter_199_1)
		end
	end
end

function var_0_0.HideCharacterBylayer(arg_201_0)
	local var_201_0 = "Bip001"
	local var_201_1 = arg_201_0.lady:Find("all")

	for iter_201_0 = 0, var_201_1.childCount - 1 do
		local var_201_2 = var_201_1:GetChild(iter_201_0)

		if var_201_2.name ~= var_201_0 then
			pg.ViewUtils.SetLayer(var_201_2, Layer.Environment3D)
		end
	end

	if arg_201_0.tfPendintItem then
		pg.ViewUtils.SetLayer(arg_201_0.tfPendintItem, Layer.Environment3D)
	end

	if arg_201_0.ladyWatchFloat then
		pg.ViewUtils.SetLayer(arg_201_0.ladyWatchFloat, Layer.Environment3D)
	end

	GetComponent(arg_201_0.lady, "BLHXCharacterPropertiesController").enabled = false
end

function var_0_0.RevertCharacterBylayer(arg_202_0)
	local var_202_0 = "Bip001"
	local var_202_1 = arg_202_0.lady:Find("all")

	for iter_202_0 = 0, var_202_1.childCount - 1 do
		local var_202_2 = var_202_1:GetChild(iter_202_0)

		if var_202_2.name ~= var_202_0 then
			pg.ViewUtils.SetLayer(var_202_2, Layer.Default)
		end
	end

	if arg_202_0.tfPendintItem then
		pg.ViewUtils.SetLayer(arg_202_0.tfPendintItem, Layer.Default)
	end

	if arg_202_0.ladyWatchFloat then
		pg.ViewUtils.SetLayer(arg_202_0.ladyWatchFloat, Layer.Default)
	end

	GetComponent(arg_202_0.lady, "BLHXCharacterPropertiesController").enabled = true
end

function var_0_0.EnterFurnitureWatchMode(arg_203_0)
	arg_203_0:SetAllBlackbloardValue("inLockLayer", true)
	arg_203_0:HideCharacter()
end

function var_0_0.ExitFurnitureWatchMode(arg_204_0)
	arg_204_0:HideFurnitureSlots()

	local var_204_0 = arg_204_0.cameras[var_0_0.CAMERA.POV]

	seriesAsync({
		function(arg_205_0)
			arg_204_0:emit(var_0_0.SHOW_BLOCK)
			arg_204_0:ShowBlackScreen(true, arg_205_0)
		end,
		function(arg_206_0)
			arg_204_0:RevertCharacter()
			arg_204_0:SetAllBlackbloardValue("inLockLayer", false)
			arg_204_0:RegisterCameraBlendFinished(var_204_0, arg_206_0)
			arg_204_0:ActiveCamera(var_204_0)
		end,
		function(arg_207_0)
			arg_204_0:ShowBlackScreen(false, arg_207_0)
		end
	}, function()
		arg_204_0:emit(var_0_0.HIDE_BLOCK)
	end)
	arg_204_0:RefreshSlots()
end

function var_0_0.SwitchFurnitureZone(arg_209_0, arg_209_1)
	local var_209_0 = arg_209_0:GetFurnitureByName(arg_209_1:GetWatchCameraName()):Find("FurnitureWatch Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))

	if arg_209_0.cameraFurnitureWatch and arg_209_0.cameraFurnitureWatch ~= var_209_0 then
		arg_209_0:UnRegisterCameraBlendFinished(arg_209_0.cameraFurnitureWatch)
		setActive(arg_209_0.cameraFurnitureWatch, false)
	end

	arg_209_0.cameraFurnitureWatch = var_209_0
	arg_209_0.cameras[var_0_0.CAMERA.FURNITURE_WATCH] = arg_209_0.cameraFurnitureWatch

	arg_209_0:RegisterCameraBlendFinished(arg_209_0.cameraFurnitureWatch, function()
		arg_209_0:emit(var_0_0.HIDE_BLOCK)
	end)
	arg_209_0:emit(var_0_0.SHOW_BLOCK)
	arg_209_0:ActiveCamera(arg_209_0.cameraFurnitureWatch)
end

function var_0_0.HideFurnitureSlots(arg_211_0)
	if arg_211_0.displaySlots then
		arg_211_0:UpdateDisplaySlots({})
		table.Foreach(arg_211_0.displaySlots, function(arg_212_0, arg_212_1)
			local var_212_0 = arg_212_1.trans

			if IsNil(var_212_0:Find("Selector")) then
				return
			end

			setActive(var_212_0:Find("Selector"), false)
		end)

		arg_211_0.displaySlots = nil
	end
end

function var_0_0.DisplayFurnitureSlots(arg_213_0, arg_213_1)
	arg_213_0:HideFurnitureSlots()

	arg_213_0.displaySlots = {}

	_.each(arg_213_1, function(arg_214_0)
		arg_213_0.displaySlots[arg_214_0] = arg_213_0.slotDict[arg_214_0]

		if not arg_213_0.displaySlots[arg_214_0] then
			errorMsg("Slot " .. arg_214_0 .. " Not Binding Scene Object")

			return
		end

		local var_214_0 = arg_213_0.displaySlots[arg_214_0].trans

		if var_214_0:Find("Selector") then
			setActive(var_214_0:Find("Selector"), true)
		end
	end)
end

function var_0_0.UpdateDisplaySlots(arg_215_0, arg_215_1)
	table.Foreach(arg_215_0.displaySlots, function(arg_216_0, arg_216_1)
		local var_216_0 = arg_216_1.trans

		if not IsNil(var_216_0:Find("Selector")) then
			setActive(var_216_0:Find("Selector/Normal"), arg_215_1[arg_216_0] == 0)
			setActive(var_216_0:Find("Selector/Active"), arg_215_1[arg_216_0] == 1)
			setActive(var_216_0:Find("Selector/Ban"), arg_215_1[arg_216_0] == 2)
		end

		local var_216_1 = arg_215_0.slotDict[arg_216_0].model
		local var_216_2 = arg_215_0.slotDict[arg_216_0].displayModelName

		if var_216_2 and var_216_2 ~= "" then
			var_216_1 = var_216_0:GetChild(var_216_0.childCount - 1)
		end

		local function var_216_3(arg_217_0, arg_217_1)
			local var_217_0 = arg_217_0:GetComponentsInChildren(typeof(Renderer), true)

			table.IpairsCArray(var_217_0, function(arg_218_0, arg_218_1)
				local var_218_0 = arg_218_1.material

				if var_218_0 and var_218_0:HasProperty("_FinalTint") then
					var_218_0:SetColor("_FinalTint", arg_217_1)
				end
			end)
		end

		if var_216_1 then
			if arg_215_1[arg_216_0] == 1 then
				var_216_3(var_216_1, Color.NewHex("3F83AE73"))
			else
				var_216_3(var_216_1, Color.New(0, 0, 0, 0))
			end
		end
	end)
end

function var_0_0.EnterPhotoMode(arg_219_0, arg_219_1, arg_219_2)
	arg_219_0:SetAllBlackbloardValue("inLockLayer", true)
	arg_219_0:emit(var_0_0.ENABLE_SCENEBLOCK, true)
	seriesAsync({
		function(arg_220_0)
			arg_219_0:TempHideUI(true, arg_220_0)
		end,
		function(arg_221_0)
			arg_219_0:ShowBlackScreen(true, arg_221_0)
		end,
		function(arg_222_0)
			arg_219_0:SwitchAnim(arg_219_2)
			onNextTick(function()
				arg_219_0:ResetCharPoint(arg_219_1:GetWatchCameraName())
				arg_219_0:SyncInterestTransform()
			end)

			local var_222_0 = arg_219_0.cameraPhoto
			local var_222_1 = var_222_0.m_XAxis

			var_222_1.Value = 180
			var_222_0.m_XAxis = var_222_1

			local var_222_2 = var_222_0.m_YAxis

			var_222_2.Value = 0.7
			var_222_0.m_YAxis = var_222_2

			arg_219_0:RegisterOrbits(arg_219_0.cameraPhoto)

			arg_219_0.pinchValue = 1

			arg_219_0:SetCameraObrits()
			arg_219_0:RegisterCameraBlendFinished(var_222_0, arg_222_0)
			arg_219_0:ActiveCamera(var_222_0)
		end,
		function(arg_224_0)
			arg_219_0:ShowBlackScreen(false, arg_224_0)
		end
	}, function()
		arg_219_0:EnableJoystick(true)
	end)
end

function var_0_0.ExitPhotoMode(arg_226_0)
	arg_226_0:emit(var_0_0.SHOW_BLOCK)
	arg_226_0:EnableJoystick(false)
	seriesAsync({
		function(arg_227_0)
			arg_226_0:ShowBlackScreen(true, arg_227_0)
		end,
		function(arg_228_0)
			arg_226_0:RevertCameraOrbit()
			arg_226_0:SwitchAnim(var_0_0.ANIM.IDLE)
			onNextTick(function()
				arg_226_0:ChangeCharacterPosition()
			end)

			local var_228_0 = arg_226_0.cameras[var_0_0.CAMERA.POV]

			arg_226_0:RegisterCameraBlendFinished(var_228_0, arg_228_0)
			arg_226_0:ActiveCamera(var_228_0)
		end,
		function(arg_230_0)
			arg_226_0:ShowBlackScreen(false, arg_230_0)
		end
	}, function()
		arg_226_0:RefreshSlots()
		arg_226_0:SetAllBlackbloardValue("inLockLayer", false)
		arg_226_0:emit(var_0_0.HIDE_BLOCK)
		arg_226_0:emit(var_0_0.ENABLE_SCENEBLOCK, false)
		arg_226_0:TempHideUI(false)
	end)
end

function var_0_0.SwitchCameraZone(arg_232_0, arg_232_1, arg_232_2, arg_232_3)
	arg_232_0:emit(var_0_0.SHOW_BLOCK)
	seriesAsync({
		function(arg_233_0)
			arg_232_0:ShowBlackScreen(true, arg_233_0)
		end,
		function(arg_234_0)
			arg_232_0:SwitchAnim(arg_232_2)
			onNextTick(function()
				arg_232_0:ResetCharPoint(arg_232_1:GetWatchCameraName())
				arg_232_0:SyncInterestTransform()
				arg_234_0()
			end)
		end,
		function(arg_236_0)
			arg_232_0:ShowBlackScreen(false, arg_236_0)
		end
	}, function()
		arg_232_0:emit(var_0_0.HIDE_BLOCK)
		existCall(arg_232_3)
	end)
end

function var_0_0.SwitchPhotoCamera(arg_238_0)
	arg_238_0.ladyInterest.position = arg_238_0.ladyInterestRoot.position
end

function var_0_0.ResetPhotoCameraPosition(arg_239_0)
	local var_239_0 = arg_239_0.cameraPhoto
	local var_239_1 = var_239_0.m_XAxis

	var_239_1.Value = 180
	var_239_0.m_XAxis = var_239_1

	local var_239_2 = var_239_0.m_YAxis

	var_239_2.Value = 0.7
	var_239_0.m_YAxis = var_239_2
end

function var_0_0.ResetCharPoint(arg_240_0, arg_240_1)
	local var_240_0 = arg_240_0.furnitures:Find(arg_240_1 .. "/StayPoint")

	arg_240_0.lady.position = var_240_0.position
	arg_240_0.lady.rotation = var_240_0.rotation
end

function var_0_0.GetNearestAngle(arg_241_0, arg_241_1, arg_241_2, arg_241_3)
	if arg_241_3 < arg_241_2 then
		arg_241_3 = arg_241_3 + 360
	end

	if arg_241_2 <= arg_241_1 and arg_241_1 <= arg_241_3 then
		return arg_241_1
	end

	local var_241_0 = (arg_241_2 + arg_241_3) / 2

	arg_241_1 = var_241_0 - Mathf.DeltaAngle(arg_241_1, var_241_0)
	arg_241_1 = math.clamp(arg_241_1, arg_241_2, arg_241_3)

	return arg_241_1
end

function var_0_0.PlayTimeline(arg_242_0, arg_242_1, arg_242_2)
	local var_242_0 = {}

	if arg_242_0.waitForTimeline then
		table.insert(var_242_0, function(arg_243_0)
			local var_243_0 = arg_242_0.waitForTimeline

			arg_242_0.waitForTimeline = nil

			var_243_0()
			arg_243_0()
		end)
	end

	table.insert(var_242_0, function(arg_244_0)
		arg_242_0:LoadTimelineScene(arg_242_1.name, false, arg_244_0)
	end)

	if arg_242_1.scene and arg_242_1.sceneRoot then
		table.insert(var_242_0, function(arg_245_0)
			arg_242_0:ChangeArtScene(arg_242_1.scene .. "|" .. arg_242_1.sceneRoot, arg_245_0)
		end)
	end

	table.insert(var_242_0, function(arg_246_0)
		local var_246_0 = GameObject.Find("[sequence]").transform
		local var_246_1 = var_246_0:GetComponent(typeof(UnityEngine.Playables.PlayableDirector))

		if GetComponent(var_246_1, "TimelineSpeed") then
			setDirectorSpeed(var_246_1, 1)
		else
			GetOrAddComponent(var_246_0, "TimelineSpeed")
		end

		local var_246_2 = GameObject.Find("[actor]").transform:GetComponentsInChildren(typeof(Animator), true)

		table.IpairsCArray(var_246_2, function(arg_247_0, arg_247_1)
			GetOrAddComponent(arg_247_1.transform, typeof(DftAniEvent))
		end)
		var_246_1:Stop()

		var_246_1.extrapolationMode = ReflectionHelp.RefGetField(typeof("UnityEngine.Playables.DirectorWrapMode"), "Hold", nil)

		if arg_242_1.time then
			var_246_1.time = math.clamp(arg_242_1.time, 0, var_246_1.duration)
		end

		local var_246_3 = {}

		local function var_246_4(arg_248_0)
			switch(arg_248_0.stringParameter, {
				TimelinePause = function()
					setDirectorSpeed(var_246_1, 0)
				end,
				TimelineResume = function()
					arg_242_0.timelineSpeed = 1

					setDirectorSpeed(var_246_1, 1)
				end,
				TimelinePlayOnTime = function()
					if arg_248_0.intParameter == 0 or arg_248_0.intParameter == var_246_3.selectIndex then
						var_246_1.time = arg_248_0.floatParameter

						var_246_1:RebuildGraph()
					end
				end,
				TimelineSelectStart = function()
					var_246_3.selectIndex = nil

					if arg_242_1.options then
						local var_252_0 = arg_242_1.options[arg_248_0.intParameter]

						arg_242_0:DoTimelineOption(var_252_0, function(arg_253_0)
							var_246_3.selectIndex = arg_253_0
							var_246_3.optionIndex = var_252_0[arg_253_0].flag
						end)
					end
				end,
				TimelineTouchStart = function()
					var_246_3.selectIndex = nil

					if arg_242_1.touchs then
						local var_254_0 = arg_242_1.touchs[arg_248_0.intParameter]

						arg_242_0:DoTimelineTouch(arg_242_1.touchs[arg_248_0.intParameter], function(arg_255_0)
							var_246_3.selectIndex = arg_255_0
							var_246_3.optionIndex = var_254_0[arg_255_0].flag
						end)
					end
				end,
				TimelineSelectLoop = function()
					if not var_246_3.selectIndex then
						var_246_1.time = arg_248_0.floatParameter

						var_246_1:RebuildGraph()
					end
				end,
				TimelineAccompanyJump = function()
					if arg_242_0.canTriggerAccompanyPerformance then
						arg_242_0.canTriggerAccompanyPerformance = false

						local var_257_0 = arg_242_1.accompanys[arg_248_0.intParameter]
						local var_257_1 = var_257_0[math.random(#var_257_0)]

						var_246_1.time = var_257_1

						var_246_1:RebuildGraph()
					end
				end,
				TimelineEnd = function()
					var_246_3.finish = true

					setDirectorSpeed(var_246_1, 0)
				end
			}, function()
				warning("other event trigger:" .. arg_248_0.stringParameter)
			end)

			if var_246_3.finish then
				arg_242_0.timelineMark = var_246_3
				arg_242_0.timelineFinishCall = nil

				arg_246_0()
			end
		end

		GetOrAddComponent(var_246_0, "DftCommonSignalReceiver"):SetCommonEvent(var_246_4)

		function arg_242_0.timelineFinishCall()
			var_246_4({
				stringParameter = "TimelineEnd"
			})
		end

		arg_242_0:HideCharacter()
		setActive(arg_242_0.mainCameraTF, false)
		TimelineSupport.InitTimeline(var_246_1)
		var_246_1:Play()
		var_246_1:Evaluate()
	end)
	table.insert(var_242_0, function(arg_261_0)
		arg_242_0:ShowBlackScreen(true, function()
			arg_242_0:UnloadTimelineScene(arg_242_1.name, false, arg_261_0)
		end)
	end)

	local var_242_1 = arg_242_0.artSceneInfo

	table.insert(var_242_0, function(arg_263_0)
		arg_242_0:ChangeArtScene(var_242_1, arg_263_0)
	end)
	seriesAsync(var_242_0, function()
		arg_242_0:RevertCharacter()
		setActive(arg_242_0.mainCameraTF, true)

		local var_264_0 = arg_242_0.timelineMark

		arg_242_0.timelineMark = nil

		existCall(arg_242_2, var_264_0, function(arg_265_0)
			arg_242_0:ShowBlackScreen(false, arg_265_0)
		end)
	end)
end

function var_0_0.PlaySingleAction(arg_266_0, arg_266_1, arg_266_2)
	local var_266_0 = string.find(arg_266_1, "^Face_")

	if tobool(var_266_0) then
		arg_266_0:PlayFaceAnim(arg_266_1, arg_266_2)

		return
	end

	arg_266_0.animNameMap = arg_266_0.animNameMap or {}
	arg_266_0.animNameMap[arg_266_0.ladyAnimator.StringToHash(arg_266_1)] = arg_266_1

	local var_266_1 = {}

	if not arg_266_0.ladyAnimator:GetCurrentAnimatorStateInfo(arg_266_0.ladyAnimBaseLayerIndex):IsName(arg_266_1) then
		table.insert(var_266_1, function(arg_267_0)
			arg_266_0.nowState = arg_266_1
			arg_266_0.stateCallback = arg_267_0

			arg_266_0.ladyAnimator:CrossFadeInFixedTime(arg_266_1, 0.25, arg_266_0.ladyAnimBaseLayerIndex)
		end)
		table.insert(var_266_1, function(arg_268_0)
			arg_266_0.nowState = nil
			arg_266_0.stateCallback = nil

			arg_268_0()
		end)
	end

	seriesAsync(var_266_1, arg_266_2)
end

function var_0_0.SwitchAnim(arg_269_0, arg_269_1, arg_269_2)
	local var_269_0 = string.find(arg_269_1, "^Face_")

	if tobool(var_269_0) then
		arg_269_0:PlayFaceAnim(arg_269_1, arg_269_2)

		return
	end

	arg_269_0.animNameMap = arg_269_0.animNameMap or {}
	arg_269_0.animNameMap[arg_269_0.ladyAnimator.StringToHash(arg_269_1)] = arg_269_1

	local var_269_1 = {}

	table.insert(var_269_1, function(arg_270_0)
		arg_269_0.nowState = arg_269_1
		arg_269_0.stateCallback = arg_270_0

		arg_269_0.ladyAnimator:PlayInFixedTime(arg_269_1, arg_269_0.ladyAnimBaseLayerIndex)
	end)
	table.insert(var_269_1, function(arg_271_0)
		arg_269_0.nowState = nil
		arg_269_0.stateCallback = nil

		arg_271_0()
	end)
	seriesAsync(var_269_1, arg_269_2)
end

function var_0_0.PlayFaceAnim(arg_272_0, arg_272_1, arg_272_2)
	arg_272_0.ladyAnimator:CrossFadeInFixedTime(arg_272_1, 0.2, arg_272_0.ladyAnimFaceLayerIndex)
	existCall(arg_272_2)
end

function var_0_0.GetCurrentAnim(arg_273_0)
	local var_273_0 = arg_273_0.ladyAnimator:GetCurrentAnimatorStateInfo(arg_273_0.ladyAnimBaseLayerIndex).shortNameHash

	return arg_273_0.animNameMap[var_273_0]
end

function var_0_0.RegisterAnimCallback(arg_274_0, arg_274_1, arg_274_2)
	arg_274_0.animCallbacks[arg_274_1] = arg_274_2
end

function var_0_0.SetCharacterAnimSpeed(arg_275_0, arg_275_1)
	arg_275_0.ladyAnimator.speed = arg_275_1
	arg_275_0.ladyHeadIKComp.blinkSpeed = arg_275_0.ladyHeadIKData.blinkSpeed * arg_275_1

	if arg_275_1 > 0 then
		arg_275_0.ladyHeadIKComp.DampTime = arg_275_0.ladyHeadIKData.DampTime / arg_275_1
	else
		arg_275_0.ladyHeadIKComp.DampTime = arg_275_0.ladyHeadIKData.DampTime * math.huge
	end
end

function var_0_0.OnAnimationEvent(arg_276_0, arg_276_1)
	if arg_276_1.animatorClipInfo.weight < 0.5 then
		return
	end

	local var_276_0 = arg_276_1.stringParameter
	local var_276_1 = table.removebykey(arg_276_0.animEventCallbacks, var_276_0)

	existCall(var_276_1)
end

function var_0_0.RegisterAnimEventCallback(arg_277_0, arg_277_1, arg_277_2)
	arg_277_0.animEventCallbacks[arg_277_1] = arg_277_2
end

function var_0_0.RegisterCameraBlendFinished(arg_278_0, arg_278_1, arg_278_2)
	arg_278_0.cameraBlendCallbacks[arg_278_1] = arg_278_2
end

function var_0_0.UnRegisterCameraBlendFinished(arg_279_0, arg_279_1)
	arg_279_0.cameraBlendCallbacks[arg_279_1] = nil
end

function var_0_0.OnCameraBlendFinished(arg_280_0, arg_280_1)
	if not arg_280_1 then
		return
	end

	local var_280_0 = table.removebykey(arg_280_0.cameraBlendCallbacks, arg_280_1)

	existCall(var_280_0)
end

function var_0_0.PlayHeartFX(arg_281_0, arg_281_1)
	local var_281_0 = arg_281_0.ladyDict[arg_281_1]

	setActive(var_281_0.effectHeart, false)
	setActive(var_281_0.effectHeart, true)
	pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_joyful")
end

function var_0_0.PlayExpression(arg_282_0, arg_282_1)
	local var_282_0 = arg_282_1.name
	local var_282_1 = arg_282_0.expressionDict[var_282_0]
	local var_282_2 = 5

	if var_282_1 then
		local var_282_3 = var_282_1.timer

		var_282_3:Reset(nil, var_282_2)
		var_282_3:Start()

		if var_282_1.instance then
			setActive(var_282_1.instance, false)
			setActive(var_282_1.instance, true)
		end

		return
	end

	local var_282_4 = {
		name = var_282_0,
		timer = Timer.New(function()
			arg_282_0:RemoveExpression(var_282_0)
		end, var_282_2, 1, true)
	}

	arg_282_0.expressionDict[var_282_0] = var_282_4

	arg_282_0.loader:GetPrefab("dorm3D/effect/prefab/expression/" .. var_282_0, var_282_0, function(arg_284_0)
		var_282_4.instance = arg_284_0

		setParent(arg_284_0, arg_282_0.ladyHeadCenter)
		setLocalPosition(arg_284_0, Vector3(0, 0, -0.2))
		setActive(arg_284_0, false)
		setActive(arg_284_0, true)
	end, var_282_4)
end

function var_0_0.RemoveExpression(arg_285_0, arg_285_1)
	local var_285_0 = arg_285_0.expressionDict[arg_285_1]

	if not var_285_0 then
		return
	end

	arg_285_0.loader:ClearRequest(var_285_0)

	if var_285_0.instance then
		arg_285_0.loader:ReturnPrefab(var_285_0.instance)
	end

	arg_285_0.expressionDict[arg_285_1] = nil
end

function var_0_0.ShowOrHideCanWatchMark(arg_286_0, arg_286_1)
	arg_286_0.ladyWatchFloat = arg_286_0.ladyWatchFloat or cloneTplTo(arg_286_0.resTF:Find("vfx_talk_mark"), arg_286_0.ladyHeadCenter)

	setActive(arg_286_0.ladyWatchFloat, arg_286_1)
end

function var_0_0.RegisterGlobalVolume(arg_287_0)
	local var_287_0 = arg_287_0.globalVolume
	local var_287_1 = LuaHelper.GetOrAddVolumeComponent(var_287_0, typeof(BLHX.PostEffect.Overrides.DepthOfField))
	local var_287_2 = LuaHelper.GetOrAddVolumeComponent(var_287_0, typeof(BLHX.PostEffect.Overrides.ColorGrading))

	arg_287_0.originalCameraSettings = {
		depthOfField = {
			enabled = var_287_1.enabled.value,
			focusDistance = {
				length = 2,
				min = var_287_1.gaussianStart.min,
				value = var_287_1.gaussianStart.value
			},
			blurRadius = {
				min = var_287_1.blurRadius.min,
				max = var_287_1.blurRadius.max,
				value = var_287_1.blurRadius.value
			}
		},
		postExposure = {
			value = var_287_2.postExposure.value
		},
		contrast = {
			min = var_287_2.contrast.min,
			max = var_287_2.contrast.max,
			value = var_287_2.contrast.value
		},
		saturate = {
			min = var_287_2.saturation.min,
			max = var_287_2.saturation.max,
			value = var_287_2.saturation.value
		}
	}
	arg_287_0.originalCameraSettings.depthOfField.enabled = true

	local var_287_3 = var_287_0:GetComponent(typeof(BLHX.Volume.Volume))

	arg_287_0.originalVolume = {
		profile = var_287_3.sharedProfile,
		weight = var_287_3.weight
	}
end

function var_0_0.SettingCamera(arg_288_0, arg_288_1)
	arg_288_0.activeCameraSettings = arg_288_1

	local var_288_0 = arg_288_0.globalVolume
	local var_288_1 = LuaHelper.GetOrAddVolumeComponent(var_288_0, typeof(BLHX.PostEffect.Overrides.DepthOfField))
	local var_288_2 = LuaHelper.GetOrAddVolumeComponent(var_288_0, typeof(BLHX.PostEffect.Overrides.ColorGrading))

	var_288_1.enabled:Override(arg_288_1.depthOfField.enabled)
	var_288_1.gaussianStart:Override(arg_288_1.depthOfField.focusDistance.value)
	var_288_1.gaussianEnd:Override(arg_288_1.depthOfField.focusDistance.value + arg_288_1.depthOfField.focusDistance.length)
	var_288_1.blurRadius:Override(arg_288_1.depthOfField.blurRadius.value)
	var_288_2.postExposure:Override(arg_288_1.postExposure.value)
	var_288_2.contrast:Override(arg_288_1.contrast.value)
	var_288_2.saturation:Override(arg_288_1.saturate.value)
end

function var_0_0.GetCameraSettings(arg_289_0)
	return arg_289_0.originalCameraSettings
end

function var_0_0.RevertCameraSettings(arg_290_0)
	arg_290_0:SettingCamera(arg_290_0.originalCameraSettings)

	arg_290_0.activeCameraSettings = nil
end

function var_0_0.SetVolumeProfile(arg_291_0, arg_291_1, arg_291_2)
	local var_291_0 = arg_291_0.globalVolume:GetComponent(typeof(BLHX.Volume.Volume))

	arg_291_0.activeProfileWeight = arg_291_2

	if arg_291_0.activeProfileName ~= arg_291_1 then
		arg_291_0.activeProfileName = arg_291_1

		arg_291_0.loader:LoadReference("dorm3d/scenesres/res/common", arg_291_1, nil, function(arg_292_0)
			var_291_0.profile = arg_292_0
			var_291_0.weight = arg_291_0.activeProfileWeight

			if arg_291_0.activeCameraSettings then
				arg_291_0:SettingCamera(arg_291_0.activeCameraSettings)
			end
		end, "VolumeProfile")
	else
		var_291_0.weight = arg_291_0.activeProfileWeight
	end
end

function var_0_0.RevertVolumeProfile(arg_293_0)
	local var_293_0 = arg_293_0.globalVolume:GetComponent(typeof(BLHX.Volume.Volume))

	var_293_0.profile = arg_293_0.originalVolume.profile
	var_293_0.weight = arg_293_0.originalVolume.weight

	if arg_293_0.activeCameraSettings then
		arg_293_0:SettingCamera(arg_293_0.activeCameraSettings)
	end

	arg_293_0.activeProfileName = nil
end

function var_0_0.RecordCharacterLight(arg_294_0)
	local var_294_0 = BLHX.Rendering.PipelineInterface.GetCharacterLightColor()

	arg_294_0.originalCharacterColor = {
		color = var_294_0.color,
		intensity = var_294_0.intensity
	}
end

function var_0_0.SetCharacterLight(arg_295_0, arg_295_1, arg_295_2, arg_295_3)
	local var_295_0 = arg_295_0.characterLight:GetComponent(typeof(Light))
	local var_295_1 = Color.Lerp(arg_295_0.originalCharacterColor.color, arg_295_1, arg_295_3)
	local var_295_2 = math.lerp(arg_295_0.originalCharacterColor.intensity, arg_295_2, arg_295_3)

	BLHX.Rendering.PipelineInterface.SetCharacterLight(var_295_1, var_295_2)
end

function var_0_0.RevertCharacterLight(arg_296_0)
	arg_296_0:SetCharacterLight(arg_296_0.originalCharacterColor.color, arg_296_0.originalCharacterColor.intensity, 1)
end

function var_0_0.EnableCloth(arg_297_0, arg_297_1, arg_297_2)
	arg_297_1 = arg_297_1 or {}

	table.Foreach(arg_297_0.clothComps, function(arg_298_0, arg_298_1)
		if arg_298_1 == nil then
			return
		end

		setActive(arg_298_1, arg_297_1[arg_298_0] == 1)
	end)
	table.Foreach(arg_297_0.clothColliderDict, function(arg_299_0, arg_299_1)
		if arg_299_1 == nil then
			return
		end

		setActive(arg_299_1, false)
	end)

	if arg_297_2 then
		table.Foreach(arg_297_2, function(arg_300_0, arg_300_1)
			local var_300_0 = arg_297_0.clothColliderDict[arg_300_1[1]]

			if var_300_0 == nil then
				return
			end

			setActive(var_300_0, arg_300_1[2] == 1)

			if arg_300_1[2] ~= 1 then
				return
			end

			var_0_0.SetMagicaCollider(var_300_0, arg_300_1[3], arg_300_1[4])
		end)
	end
end

function var_0_0.onBackPressed(arg_301_0)
	if arg_301_0.exited or arg_301_0.retainCount > 0 then
		-- block empty
	else
		arg_301_0:closeView()
	end
end

function var_0_0.EnableSceneDisplay(arg_302_0, arg_302_1, arg_302_2)
	assert(tobool(arg_302_0.lastSceneRootDict[arg_302_1]) == arg_302_2)

	if arg_302_2 then
		table.Foreach(arg_302_0.lastSceneRootDict[arg_302_1], function(arg_303_0, arg_303_1)
			if IsNil(arg_303_0) then
				return
			end

			setActive(arg_303_0, arg_303_1)
		end)

		arg_302_0.lastSceneRootDict[arg_302_1] = nil
	else
		arg_302_0.lastSceneRootDict[arg_302_1] = {}

		local var_302_0 = SceneManager.GetSceneByName(arg_302_1)

		table.IpairsCArray(var_302_0:GetRootGameObjects(), function(arg_304_0, arg_304_1)
			if tostring(arg_304_1.hideFlags) ~= "None" then
				return
			end

			arg_302_0.lastSceneRootDict[arg_302_1][arg_304_1] = isActive(arg_304_1)

			setActive(arg_304_1, false)
		end)
	end
end

function var_0_0.ChangeArtScene(arg_305_0, arg_305_1, arg_305_2)
	arg_305_1 = string.lower(arg_305_1)

	if arg_305_1 == arg_305_0.artSceneInfo then
		if arg_305_1 == arg_305_0.sceneInfo then
			arg_305_0:SwitchDayNight(arg_305_0.contextData.timeIndex)
			onNextTick(function()
				arg_305_0:RefreshSlots()
				existCall(arg_305_2)
			end)
		else
			existCall(arg_305_2)
		end

		return
	end

	local var_305_0 = {}
	local var_305_1 = false
	local var_305_2

	table.insert(var_305_0, function(arg_307_0)
		arg_305_0.artSceneInfo = arg_305_1

		if var_305_1 then
			pg.SceneAnimMgr.GetInstance():Dorm3DSceneChange(function(arg_308_0)
				var_305_2 = arg_308_0

				arg_307_0()
			end)
		else
			arg_307_0()
		end
	end)

	if arg_305_1 == arg_305_0.sceneInfo then
		table.insert(var_305_0, function(arg_309_0)
			setActive(arg_305_0.slotRoot, true)

			local var_309_0, var_309_1 = unpack(string.split(arg_305_0.sceneInfo, "|"))

			SceneManager.SetActiveScene(SceneManager.GetSceneByName(var_309_0))
			arg_305_0:EnableSceneDisplay(var_309_0, true)
			arg_305_0:SwitchDayNight(arg_305_0.contextData.timeIndex)
			onNextTick(function()
				arg_305_0:RefreshSlots()
			end)
			arg_309_0()
		end)
	else
		var_305_1 = true

		local var_305_3, var_305_4 = unpack(string.split(arg_305_1, "|"))

		table.insert(var_305_0, function(arg_311_0)
			setActive(arg_305_0.slotRoot, false)
			SceneOpMgr.Inst:LoadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_305_4 .. "/" .. var_305_3 .. "_scene"), var_305_3, LoadSceneMode.Additive, function(arg_312_0, arg_312_1)
				SceneManager.SetActiveScene(arg_312_0)

				local var_312_0 = getSceneRootTFDic(arg_312_0).MainCamera

				if var_312_0 then
					setActive(var_312_0, false)
				end

				arg_311_0()
			end)
		end)
	end

	if arg_305_0.artSceneInfo == arg_305_0.sceneInfo then
		table.insert(var_305_0, function(arg_313_0)
			local var_313_0, var_313_1 = unpack(string.split(arg_305_0.sceneInfo, "|"))

			arg_305_0:EnableSceneDisplay(var_313_0, false)
			arg_313_0()
		end)
	else
		local var_305_5, var_305_6 = unpack(string.split(arg_305_0.artSceneInfo, "|"))

		table.insert(var_305_0, function(arg_314_0)
			SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_305_6 .. "/" .. var_305_5 .. "_scene"), var_305_5, arg_314_0)
		end)
	end

	table.insert(var_305_0, function(arg_315_0)
		arg_315_0()

		if var_305_1 then
			var_305_2()
		end
	end)
	seriesAsync(var_305_0, arg_305_2)
end

function var_0_0.LoadTimelineScene(arg_316_0, arg_316_1, arg_316_2, arg_316_3)
	arg_316_1 = string.lower(arg_316_1)

	if arg_316_0.cacheSceneDic[arg_316_1] then
		if not arg_316_2 then
			arg_316_0.timelineScene = arg_316_1

			arg_316_0:EnableSceneDisplay(arg_316_1, true)
		end

		return existCall(arg_316_3)
	end

	local var_316_0 = {}
	local var_316_1

	table.insert(var_316_0, function(arg_317_0)
		pg.SceneAnimMgr.GetInstance():Dorm3DSceneChange(function(arg_318_0)
			if arg_316_0.waitForTimeline then
				arg_316_0.waitForTimeline = arg_318_0
				var_316_1 = nil
			else
				var_316_1 = arg_318_0
			end

			arg_317_0()
		end)
	end)
	table.insert(var_316_0, function(arg_319_0)
		local var_319_0 = arg_316_0.apartment:getConfig("asset_name")

		SceneOpMgr.Inst:LoadSceneAsync(string.lower("dorm3d/character/" .. var_319_0 .. "/timeline/" .. arg_316_1 .. "/" .. arg_316_1 .. "_scene"), arg_316_1, LoadSceneMode.Additive, function(arg_320_0, arg_320_1)
			local var_320_0 = GameObject.Find("[actor]").transform

			arg_316_0:HXCharacter(tf(var_320_0))
			GameObject.Find("[sequence]").transform:GetComponent(typeof(UnityEngine.Playables.PlayableDirector)):Stop()
			arg_319_0()
		end)
	end)
	table.insert(var_316_0, function(arg_321_0)
		arg_316_0.sceneGroupDic[arg_316_1] = arg_316_0.apartment:GetConfigID()

		if arg_316_2 then
			arg_316_0.cacheSceneDic[arg_316_1] = true

			arg_316_0:EnableSceneDisplay(arg_316_1, false)
		else
			arg_316_0.timelineScene = arg_316_1
		end

		arg_321_0()
		existCall(var_316_1)
	end)
	seriesAsync(var_316_0, arg_316_3)
end

function var_0_0.UnloadTimelineScene(arg_322_0, arg_322_1, arg_322_2, arg_322_3)
	arg_322_1 = string.lower(arg_322_1)

	if arg_322_0.timelineScene == arg_322_1 then
		arg_322_0.timelineScene = nil
	end

	if tobool(arg_322_2) == tobool(arg_322_0.cacheSceneDic[arg_322_1]) then
		local var_322_0 = getProxy(ApartmentProxy):getApartment(arg_322_0.sceneGroupDic[arg_322_1]):getConfig("asset_name")

		SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/character/scenes/" .. var_322_0 .. "/timeline/" .. arg_322_1 .. "/" .. arg_322_1 .. "_scene"), arg_322_1, function()
			arg_322_0.cacheSceneDic[arg_322_1] = nil
			arg_322_0.sceneGroupDic[arg_322_1] = nil
			arg_322_0.lastSceneRootDict[arg_322_1] = nil

			existCall(arg_322_3)
		end)
	else
		arg_322_0:EnableSceneDisplay(arg_322_1, false)
		existCall(arg_322_3)
	end
end

function var_0_0.ChangeSubScene(arg_324_0, arg_324_1, arg_324_2)
	arg_324_1 = string.lower(arg_324_1)

	warning(arg_324_0.subSceneInfo, "->", arg_324_1, arg_324_1 == arg_324_0.subSceneInfo)

	if arg_324_1 == arg_324_0.subSceneInfo then
		arg_324_0.ladyActiveZone = arg_324_0.walkBornPoint or arg_324_0.ladyBaseZone

		arg_324_0:ChangeCharacterPosition()
		arg_324_0:ChangePlayerPosition(arg_324_0.ladyActiveZone)
		arg_324_0:TriggerLadyDistance()
		arg_324_0:CheckInSector()
		existCall(arg_324_2)

		return
	end

	local var_324_0 = {}
	local var_324_1 = false
	local var_324_2

	table.insert(var_324_0, function(arg_325_0)
		arg_324_0.subSceneInfo = arg_324_1

		if var_324_1 then
			pg.SceneAnimMgr.GetInstance():Dorm3DSceneChange(function(arg_326_0)
				var_324_2 = arg_326_0

				arg_325_0()
			end)
		else
			arg_325_0()
		end
	end)

	if arg_324_1 == arg_324_0.sceneInfo then
		table.insert(var_324_0, function(arg_327_0)
			local var_327_0, var_327_1 = unpack(string.split(arg_324_0.sceneInfo, "|"))

			arg_324_0:ResetSceneStructure(SceneManager.GetSceneByName(var_327_0 .. "_base"))
			arg_324_0:RefreshSlots()

			arg_324_0.ladyActiveZone = arg_324_0.walkBornPoint or arg_324_0.ladyBaseZone

			arg_324_0:ChangeCharacterPosition()
			arg_324_0:ChangePlayerPosition(arg_324_0.ladyActiveZone)
			arg_324_0:TriggerLadyDistance()
			arg_324_0:CheckInSector()
			arg_327_0()
		end)
	else
		var_324_1 = true

		local var_324_3, var_324_4 = unpack(string.split(arg_324_1, "|"))
		local var_324_5 = var_324_3 .. "_base"

		table.insert(var_324_0, function(arg_328_0)
			SceneOpMgr.Inst:LoadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_324_4 .. "/" .. var_324_5 .. "_scene"), var_324_5, LoadSceneMode.Additive, arg_328_0)
		end)
		table.insert(var_324_0, function(arg_329_0)
			arg_324_0:ResetSceneStructure(SceneManager.GetSceneByName(var_324_5))

			arg_324_0.ladyActiveZone = arg_324_0.walkBornPoint or "Default"

			arg_324_0:SwitchAnim(var_0_0.ANIM.IDLE)
			onNextTick(function()
				arg_324_0:ChangeCharacterPosition()
				arg_324_0:ChangePlayerPosition(arg_324_0.ladyActiveZone)
				arg_324_0:TriggerLadyDistance()
				arg_324_0:CheckInSector()
				arg_329_0()
			end)
		end)
	end

	if arg_324_0.subSceneInfo == arg_324_0.sceneInfo then
		table.insert(var_324_0, function(arg_331_0)
			local var_331_0 = Clone(arg_324_0.room)

			var_331_0.furnitures = {}

			arg_324_0:RefreshSlots(var_331_0)
			arg_331_0()
		end)
	else
		local var_324_6, var_324_7 = unpack(string.split(arg_324_0.subSceneInfo, "|"))
		local var_324_8 = var_324_6 .. "_base"

		table.insert(var_324_0, function(arg_332_0)
			SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_324_7 .. "/" .. var_324_8 .. "_scene"), var_324_8, arg_332_0)
		end)
	end

	table.insert(var_324_0, function(arg_333_0)
		arg_333_0()

		if var_324_1 then
			var_324_2()
		end
	end)
	seriesAsync(var_324_0, arg_324_2)
end

function var_0_0.TransformMesh(arg_334_0)
	local var_334_0 = arg_334_0.sharedMesh
	local var_334_1 = {}
	local var_334_2 = arg_334_0.transform:TransformPoint(var_334_0.vertices[0])
	local var_334_3 = arg_334_0.transform:TransformPoint(var_334_0.vertices[1])
	local var_334_4 = arg_334_0.transform:TransformPoint(var_334_0.vertices[2])

	var_334_1.horizontal = var_334_3 - var_334_2
	var_334_1.verticle = var_334_4 - var_334_2
	var_334_1.origin = var_334_2

	return var_334_1
end

function var_0_0.GetRatio(arg_335_0, arg_335_1)
	local var_335_0 = Vector2.zero

	var_335_0.x = Vector3.Dot(arg_335_0.horizontal, arg_335_1) / arg_335_0.horizontal.sqrMagnitude
	var_335_0.y = Vector3.Dot(arg_335_0.verticle, arg_335_1) / arg_335_0.verticle.sqrMagnitude

	return var_335_0
end

function var_0_0.GetPostionByRatio(arg_336_0, arg_336_1)
	return arg_336_0.horizontal * arg_336_1.x + arg_336_0.verticle * arg_336_1.y + arg_336_0.origin
end

function var_0_0.IsPointInSector(arg_337_0, arg_337_1)
	local var_337_0 = arg_337_1 - Vector3.New(unpack(arg_337_0.Position))

	if var_337_0.magnitude > arg_337_0.Radius then
		return false
	end

	local var_337_1 = Quaternion.Euler(unpack(arg_337_0.Rotation))

	return Vector3.Angle(var_337_1 * Vector3.forward, var_337_0) <= arg_337_0.Angle / 2
end

function var_0_0.willExit(arg_338_0)
	arg_338_0.joystickTimer:Stop()
	arg_338_0.moveStickTimer:Stop()
	UpdateBeat:RemoveListener(arg_338_0.updateHandler)
	arg_338_0:StopIKHandTimer()

	if arg_338_0.moveTimer then
		arg_338_0.moveTimer:Stop()

		arg_338_0.moveTimer = nil
	end

	if arg_338_0.moveWaitTimer then
		arg_338_0.moveWaitTimer:Stop()

		arg_338_0.moveWaitTimer = nil
	end

	GlobalClickEventMgr.Inst:RemoveBeginPinchFunc()
	GlobalClickEventMgr.Inst:RemovePinchFunc()
	GlobalClickEventMgr.Inst:RemoveEndPinchFunc()

	if not IsNil(arg_338_0.furnitures) then
		eachChild(arg_338_0.furnitures, function(arg_339_0)
			local var_339_0 = GetComponent(arg_339_0, typeof(EventTriggerListener))

			if not var_339_0 then
				return
			end

			var_339_0:ClearEvents()
		end)
	end

	for iter_338_0, iter_338_1 in pairs(arg_338_0.ladyDict) do
		arg_338_0:ResetActiveIKs(iter_338_1)
		GetComponent(iter_338_1.lady, typeof(EventTriggerListener)):ClearEvents()
	end

	arg_338_0.camBrainEvenetHandler.OnBlendStarted = nil
	arg_338_0.camBrainEvenetHandler.OnBlendFinished = nil

	pg.UIMgr.GetInstance():UnOverlayPanel(arg_338_0.blockLayer, arg_338_0._tf)
	table.Foreach(arg_338_0.expressionDict, function(arg_340_0)
		arg_338_0:RemoveExpression(arg_340_0)
	end)
	arg_338_0.loader:Clear()
	pg.ClickEffectMgr:GetInstance():SetClickEffect("NORMAL")
	pg.NodeCanvasMgr.GetInstance():Clear()

	local var_338_0 = {}

	if arg_338_0.timelineScene and not arg_338_0.cacheSceneDic[arg_338_0.timelineScene] then
		local var_338_1 = arg_338_0.timelineScene

		arg_338_0.timelineScene = nil

		local var_338_2 = getProxy(ApartmentProxy):getApartment(arg_338_0.sceneGroupDic[var_338_1]):getConfig("asset_name")

		table.insert(var_338_0, function(arg_341_0)
			SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/character/scenes/" .. var_338_2 .. "/timeline/" .. var_338_1 .. "/" .. var_338_1 .. "_scene"), var_338_1, arg_341_0)
		end)
	end

	for iter_338_2, iter_338_3 in pairs(arg_338_0.cacheSceneDic) do
		if iter_338_3 then
			local var_338_3 = getProxy(ApartmentProxy):getApartment(arg_338_0.sceneGroupDic[iter_338_2]):getConfig("asset_name")

			table.insert(var_338_0, function(arg_342_0)
				SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/character/scenes/" .. var_338_3 .. "/timeline/" .. iter_338_2 .. "/" .. iter_338_2 .. "_scene"), iter_338_2, arg_342_0)
			end)
		end
	end

	for iter_338_4, iter_338_5 in ipairs({
		arg_338_0.sceneInfo,
		arg_338_0.subSceneInfo ~= arg_338_0.sceneInfo and arg_338_0.subSceneInfo or nil
	}) do
		local var_338_4, var_338_5 = unpack(string.split(iter_338_5, "|"))
		local var_338_6 = var_338_4 .. "_base"

		table.insert(var_338_0, function(arg_343_0)
			SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_338_5 .. "/" .. var_338_6 .. "_scene"), var_338_6, arg_343_0)
		end)
	end

	for iter_338_6, iter_338_7 in ipairs({
		arg_338_0.sceneInfo,
		arg_338_0.artSceneInfo ~= arg_338_0.sceneInfo and arg_338_0.artSceneInfo or nil
	}) do
		local var_338_7, var_338_8 = unpack(string.split(iter_338_7, "|"))

		table.insert(var_338_0, function(arg_344_0)
			SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_338_8 .. "/" .. var_338_7 .. "_scene"), var_338_7, arg_344_0)
		end)
	end

	seriesAsync(var_338_0, function()
		ReflectionHelp.RefSetProperty(typeof("UnityEngine.LightmapSettings"), "lightmaps", nil, nil)
	end)
end

function var_0_0.InitDefautQuality()
	if PlayerPrefs.GetInt("dorm3d_graphics_settings", 0) == 0 then
		local var_346_0 = DevicePerformanceUtil.GetDevicePerformanceLevel()

		if PLATFORM == PLATFORM_IPHONEPLAYER then
			local var_346_1 = SystemInfo.deviceModel or ""

			local function var_346_2(arg_347_0)
				local var_347_0 = string.match(arg_347_0, "iPad(%d+)")
				local var_347_1 = tonumber(var_347_0)

				if var_347_1 and var_347_1 >= 8 then
					return true
				end

				return false
			end

			local function var_346_3(arg_348_0)
				local var_348_0 = string.match(arg_348_0, "iPhone(%d+)")
				local var_348_1 = tonumber(var_348_0)

				if var_348_1 and var_348_1 >= 13 then
					return true
				end

				return false
			end

			if var_346_2(var_346_1) or var_346_3(var_346_1) then
				var_346_0 = DevicePerformanceLevel.High
			end
		end

		local var_346_4 = var_346_0 == DevicePerformanceLevel.High and 3 or var_346_0 == DevicePerformanceLevel.Mid and 2 or 1

		PlayerPrefs.SetInt("dorm3d_graphics_settings", var_346_4)

		Dorm3dRoomTemplateScene.FirstDefaultSetting = var_346_4
	end
end

function var_0_0.SettingQuality()
	local var_349_0 = GraphicSettingConst.HandleCustomSetting()

	BLHX.Rendering.EngineCore.SetOverrideQualitySettings(var_349_0)
end

function var_0_0.SetMagicaCollider(arg_350_0, arg_350_1, arg_350_2)
	local var_350_0 = typeof("MagicaCloth.MagicaCapsuleCollider")

	ReflectionHelp.RefSetProperty(var_350_0, "StartRadius", arg_350_0, arg_350_1)
	ReflectionHelp.RefSetProperty(var_350_0, "EndRadius", arg_350_0, arg_350_2)
end

return var_0_0
