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

function var_0_0.InitCharacter(arg_67_0, arg_67_1)
	arg_67_0.lady = arg_67_0.ladyGameobject.transform

	arg_67_0.lady:SetParent(arg_67_0.mainCameraTF)
	arg_67_0.lady:SetParent(nil)

	arg_67_0.ladyHeadIKComp = arg_67_0.lady:GetComponent(typeof(HeadAimIK))
	arg_67_0.ladyHeadIKComp.AimTarget = arg_67_0.mainCameraTF:Find("AimTarget")
	arg_67_0.ladyHeadIKData = {
		DampTime = arg_67_0.ladyHeadIKComp.DampTime,
		blinkSpeed = arg_67_0.ladyHeadIKComp.blinkSpeed,
		BodyWeight = arg_67_0.ladyHeadIKComp.BodyWeight,
		HeadWeight = arg_67_0.ladyHeadIKComp.HeadWeight
	}

	local var_67_0 = {}

	table.Foreach(var_0_1, function(arg_68_0, arg_68_1)
		var_67_0[arg_68_1] = arg_68_0
	end)

	arg_67_0.ladyAnimator = arg_67_0.lady:GetComponent(typeof(Animator))
	arg_67_0.ladyAnimBaseLayerIndex = arg_67_0.ladyAnimator:GetLayerIndex("Base Layer")
	arg_67_0.ladyAnimFaceLayerIndex = arg_67_0.ladyAnimator:GetLayerIndex("Face")
	arg_67_0.ladyBoneMaps = {}

	local var_67_1 = arg_67_0.lady:GetComponentsInChildren(typeof(Transform), true)

	table.IpairsCArray(var_67_1, function(arg_69_0, arg_69_1)
		if arg_69_1.name == "BodyCollider" then
			arg_67_0.ladyCollider = arg_69_1
		elseif arg_69_1.name == "Interest" then
			arg_67_0.ladyInterestRoot = arg_69_1
		elseif arg_69_1.name == "Head Center" then
			arg_67_0.ladyHeadCenter = arg_69_1
		end

		if var_67_0[arg_69_1.name] then
			arg_67_0.ladyBoneMaps[var_67_0[arg_69_1.name]] = arg_69_1
		end
	end)

	arg_67_0.ladyColliders = {}
	arg_67_0.ladyTouchColliders = {}

	table.IpairsCArray(arg_67_0.lady:GetComponentsInChildren(typeof(UnityEngine.Collider), true), function(arg_70_0, arg_70_1)
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

		arg_67_0.ladyColliders[var_70_2] = child

		if var_70_2 ~= "Body" then
			table.insert(arg_67_0.ladyTouchColliders, child)
			setActive(child, false)
		end
	end)
	arg_67_0:HXCharacter(arg_67_0.lady)
	;(function()
		local var_71_0 = "dorm3d/effect/prefab/function/vfx_function_aixin02"
		local var_71_1 = "vfx_function_aixin02"

		arg_67_0.loader:GetPrefab(var_71_0, var_71_1, function(arg_72_0)
			arg_67_0.effectHeart = arg_72_0

			setActive(arg_72_0, false)
			onNextTick(function()
				setParent(arg_67_0.effectHeart, arg_67_0.ladyHeadCenter)
			end)
		end)
	end)()

	arg_67_0.clothComps = {}

	table.IpairsCArray(arg_67_0.lady:GetComponentsInChildren(typeof("MagicaCloth.BaseCloth"), true), function(arg_74_0, arg_74_1)
		table.insert(arg_67_0.clothComps, arg_74_1)
	end)

	arg_67_0.clothColliderDict = {}

	table.IpairsCArray(arg_67_0.lady:GetComponentsInChildren(typeof("MagicaCloth.MagicaCapsuleCollider"), true), function(arg_75_0, arg_75_1)
		arg_67_0.clothColliderDict[arg_75_1.name] = arg_75_1
	end)
	arg_67_0:EnableCloth(false)

	arg_67_0.ladyIKRoot = arg_67_0.lady:Find("IKLayers")

	eachChild(arg_67_0.ladyIKRoot, function(arg_76_0)
		setActive(arg_76_0, false)
	end)
	GetComponent(arg_67_0.lady, typeof(EventTriggerListener)):AddPointClickFunc(function(arg_77_0, arg_77_1)
		if arg_77_1.rawPointerPress.transform == arg_67_0.ladyCollider then
			arg_67_0:emit(var_0_0.CLICK_CHARACTER, arg_67_1)
		else
			local var_77_0 = table.keyof(arg_67_0.ladyColliders, arg_77_1.rawPointerPress.transform)

			arg_67_0:emit(var_0_0.ON_TOUCH_CHARACTER, var_0_0.BONE_TO_TOUCH[var_77_0] or arg_77_1.rawPointerPress.name)
		end
	end)
	arg_67_0.ladyAnimator:GetComponent("DftAniEvent"):SetCommonEvent(function(arg_78_0)
		if arg_67_0.nowState and arg_78_0.animatorStateInfo:IsName(arg_67_0.nowState) then
			existCall(arg_67_0.stateCallback)

			return
		end

		local var_78_0 = arg_78_0.animatorStateInfo

		for iter_78_0, iter_78_1 in pairs(arg_67_0.animCallbacks) do
			if var_78_0:IsName(iter_78_0) then
				warning("Active", iter_78_0)

				local var_78_1 = table.removebykey(arg_67_0.animCallbacks, iter_78_0)

				existCall(var_78_1)

				return
			end
		end

		if arg_78_0.stringParameter ~= "" then
			arg_67_0:OnAnimationEvent(arg_78_0)
		end
	end)

	arg_67_0.animEventCallbacks = {}
	arg_67_0.animCallbacks = {}
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
	arg_129_0:SyncInterestTransform()
end

function var_0_0.SyncInterestTransform(arg_130_0)
	arg_130_0.ladyInterest.position = arg_130_0.ladyInterestRoot.position
	arg_130_0.ladyInterest.rotation = arg_130_0.ladyInterestRoot.rotation
end

function var_0_0.ChangePlayerPosition(arg_131_0, arg_131_1)
	arg_131_1 = arg_131_1 or arg_131_0.contextData.inFurnitureName

	local var_131_0 = arg_131_0.furnitures:Find(arg_131_1):Find("PlayerPoint").position

	arg_131_0.player.position = var_131_0
	arg_131_0.cameras[var_0_0.CAMERA.POV].transform.position = arg_131_0.playerEye.position

	local var_131_1 = arg_131_0.ladyInterest.position - arg_131_0.playerEye.position
	local var_131_2 = Quaternion.LookRotation(var_131_1).eulerAngles
	local var_131_3 = var_131_2.y
	local var_131_4 = var_131_2.x
	local var_131_5 = arg_131_0.compPov.m_HorizontalAxis

	var_131_5.Value = arg_131_0:GetNearestAngle(var_131_3, var_131_5.m_MinValue, var_131_5.m_MaxValue)
	arg_131_0.compPov.m_HorizontalAxis = var_131_5

	local var_131_6 = arg_131_0.compPov.m_VerticalAxis

	var_131_6.Value = var_131_4
	arg_131_0.compPov.m_VerticalAxis = var_131_6
end

function var_0_0.GetAttachedFurnitureName(arg_132_0)
	return arg_132_0.contextData.inFurnitureName
end

function var_0_0.GetFurnitureByName(arg_133_0, arg_133_1)
	return underscore.detect(arg_133_0.attachedPoints, function(arg_134_0)
		return arg_134_0.name == arg_133_1
	end)
end

function var_0_0.GetSlotByID(arg_135_0, arg_135_1)
	return arg_135_0.displaySlots[arg_135_1] and arg_135_0.displaySlots[arg_135_1].trans
end

function var_0_0.GetScreenPosition(arg_136_0, arg_136_1)
	local var_136_0 = arg_136_0.raycastCamera:WorldToScreenPoint(arg_136_1)

	if var_136_0.z < 0 then
		var_136_0.x = var_136_0.x + (var_136_0.x < 0 and -1 or 1) * Screen.width
		var_136_0.y = var_136_0.y + (var_136_0.y < 0 and -1 or 1) * Screen.height
		var_136_0.z = -var_136_0.z
	end

	return var_136_0
end

function var_0_0.GetLocalPosition(arg_137_0, arg_137_1, arg_137_2)
	return LuaHelper.ScreenToLocal(arg_137_2, arg_137_1, pg.UIMgr.GetInstance().uiCameraComp)
end

function var_0_0.GetModelRoot(arg_138_0)
	return arg_138_0.modelRoot
end

function var_0_0.ShiftZone(arg_139_0, arg_139_1, arg_139_2)
	local var_139_0 = arg_139_0:GetFurnitureByName(arg_139_1)

	if not var_139_0 then
		errorMsg(arg_139_1 .. " Not Find")
		existCall(arg_139_2)

		return
	end

	seriesAsync({
		function(arg_140_0)
			arg_139_0:emit(var_0_0.SHOW_BLOCK)
			arg_139_0:ShowBlackScreen(true, arg_140_0)
		end,
		function(arg_141_0)
			if arg_139_0.shiftLady or arg_139_0.room:isPersonalRoom() then
				local var_141_0 = arg_139_0.shiftLady or arg_139_0.apartment:GetConfigID()

				arg_139_0.shiftLady = nil
				arg_139_0.contextData.ladyZone[var_141_0] = var_139_0.name

				local var_141_1 = arg_139_0.ladyDict[var_141_0]

				var_141_1.ladyBaseZone = arg_139_0.contextData.ladyZone[var_141_0]
				var_141_1.ladyActiveZone = arg_139_0.contextData.ladyZone[var_141_0]

				if var_141_1:GetBlackboardValue("inPending") then
					var_141_1:SetOutPending()
					var_141_1:SwitchAnim(var_0_0.ANIM.IDLE)
					onNextTick(function()
						var_141_1:ChangeCharacterPosition()
						arg_141_0()
					end)
				else
					var_141_1:ChangeCharacterPosition()
					arg_141_0()
				end
			else
				arg_141_0()
			end
		end,
		function(arg_143_0)
			arg_139_0.contextData.inFurnitureName = var_139_0.name

			arg_139_0:ChangePlayerPosition()
			arg_139_0:TriggerLadyDistance()
			arg_139_0:CheckInSector()
			arg_143_0()
		end,
		function(arg_144_0)
			arg_139_0:UpdateZoneList()
			arg_139_0:ShowBlackScreen(false, arg_144_0)
		end,
		function(arg_145_0)
			arg_139_0:emit(var_0_0.HIDE_BLOCK)
			arg_145_0()
		end
	}, arg_139_2)
end

function var_0_0.WalkByRootMotionLoop(arg_146_0, arg_146_1, arg_146_2)
	if arg_146_1.pathPending then
		arg_146_2:SetFloat("Speed", 0)

		return
	end

	arg_146_2:SetFloat("Speed", 1)

	local var_146_0 = arg_146_1.path.corners

	if var_146_0.Length > 1 then
		local var_146_1 = var_146_0[1] - arg_146_1.transform.position

		var_146_1.y = 0

		local var_146_2 = Quaternion.LookRotation(var_146_1)
		local var_146_3 = arg_146_1.transform.rotation
		local var_146_4 = 1
		local var_146_5 = Damp(1, var_146_4, Time.deltaTime)

		arg_146_1.transform.rotation = Quaternion.Lerp(var_146_3, var_146_2, var_146_5)
	end
end

function var_0_0.ActiveCamera(arg_147_0, arg_147_1)
	local var_147_0 = isActive(arg_147_1)

	table.Foreach(arg_147_0.cameras, function(arg_148_0, arg_148_1)
		setActive(arg_148_1, arg_148_1 == arg_147_1)
	end)

	if var_147_0 then
		arg_147_0:OnCameraBlendFinished(arg_147_1)
	end
end

function var_0_0.ShowBlackScreen(arg_149_0, arg_149_1, arg_149_2)
	local var_149_0 = arg_149_0.blackSceneInfo or {
		color = "#000000",
		time = 0.3,
		delay = arg_149_1 and 0 or 0.3
	}

	setImageColor(arg_149_0.blackLayer, Color.NewHex(var_149_0.color))
	setActive(arg_149_0.blackLayer, true)
	setCanvasGroupAlpha(arg_149_0.blackLayer, arg_149_1 and 0 or 1)
	arg_149_0:managedTween(LeanTween.alphaCanvas, function()
		if not arg_149_1 then
			setActive(arg_149_0.blackLayer, false)
		end

		existCall(arg_149_2)
	end, GetComponent(arg_149_0.blackLayer, typeof(CanvasGroup)), arg_149_1 and 1 or 0, var_149_0.time):setDelay(var_149_0.delay)
end

function var_0_0.RegisterOrbits(arg_151_0, arg_151_1)
	arg_151_0 = arg_151_0.scene
	arg_151_0.orbits = {
		original = arg_151_1.m_Orbits
	}
	arg_151_0.orbits.current = _.range(3):map(function(arg_152_0)
		local var_152_0 = arg_151_0.orbits.original[arg_152_0 - 1]

		return Cinemachine.CinemachineFreeLook.Orbit.New(var_152_0.m_Height, var_152_0.m_Radius)
	end)
	arg_151_0.surroudCamera = arg_151_1
end

function var_0_0.SetCameraObrits(arg_153_0)
	local var_153_0 = arg_153_0.surroudCamera

	if not var_153_0 then
		return
	end

	local var_153_1 = arg_153_0.orbits.original[1]

	for iter_153_0 = 0, #arg_153_0.orbits.current - 1 do
		local var_153_2 = arg_153_0.orbits.current[iter_153_0 + 1]
		local var_153_3 = arg_153_0.orbits.original[iter_153_0]

		var_153_2.m_Height = math.lerp(var_153_1.m_Height, var_153_3.m_Height, arg_153_0.pinchValue)
		var_153_2.m_Radius = var_153_3.m_Radius * arg_153_0.pinchValue
	end

	var_153_0.m_Orbits = arg_153_0.orbits.current
end

function var_0_0.RevertCameraOrbit(arg_154_0)
	arg_154_0 = arg_154_0.scene

	local var_154_0 = arg_154_0.surroudCamera

	if not var_154_0 then
		return
	end

	for iter_154_0 = 0, #arg_154_0.orbits.current - 1 do
		local var_154_1 = arg_154_0.orbits.current[iter_154_0 + 1]
		local var_154_2 = arg_154_0.orbits.original[iter_154_0]

		var_154_1.m_Height = var_154_2.m_Height
		var_154_1.m_Radius = var_154_2.m_Radius
	end

	var_154_0.m_Orbits = arg_154_0.orbits.current
	arg_154_0.surroudCamera = nil
end

function var_0_0.ActiveStateCamera(arg_155_0, arg_155_1, arg_155_2)
	local var_155_0 = {
		base = function(arg_156_0)
			arg_155_0:RegisterCameraBlendFinished(arg_155_0.cameras[var_0_0.CAMERA.POV], arg_156_0)
			arg_155_0:ActiveCamera(arg_155_0.cameras[var_0_0.CAMERA.POV])
		end,
		watch = function(arg_157_0)
			assert(arg_155_0.apartment)
			arg_155_0.ladyDict[arg_155_0.apartment:GetConfigID()]:SetCameraLady()
			arg_155_0:RegisterCameraBlendFinished(arg_155_0.cameras[var_0_0.CAMERA.ROLE], arg_157_0)
			arg_155_0:ActiveCamera(arg_155_0.cameras[var_0_0.CAMERA.ROLE])
		end,
		walk = function(arg_158_0)
			arg_155_0:RegisterCameraBlendFinished(arg_155_0.cameras[var_0_0.CAMERA.POV], arg_158_0)
			arg_155_0:ActiveCamera(arg_155_0.cameras[var_0_0.CAMERA.POV])
		end,
		ik = function(arg_159_0)
			arg_159_0()
		end,
		gift = function(arg_160_0)
			assert(arg_155_0.apartment)
			arg_155_0.ladyDict[arg_155_0.apartment:GetConfigID()]:SetCameraLady()
			arg_155_0:RegisterCameraBlendFinished(arg_155_0.cameras[var_0_0.CAMERA.GIFT], arg_160_0)
			arg_155_0:ActiveCamera(arg_155_0.cameras[var_0_0.CAMERA.GIFT])
		end,
		standby = function(arg_161_0)
			assert(arg_155_0.apartment)
			arg_155_0.ladyDict[arg_155_0.apartment:GetConfigID()]:SetCameraLady()

			arg_155_0.cameras[var_0_0.CAMERA.ROLE2].transform.position = arg_155_0.cameraRole.transform.position

			arg_155_0:RegisterCameraBlendFinished(arg_155_0.cameras[var_0_0.CAMERA.ROLE2], arg_161_0)
			arg_155_0:ActiveCamera(arg_155_0.cameras[var_0_0.CAMERA.ROLE2])
		end,
		talk = function(arg_162_0)
			assert(arg_155_0.apartment)
			arg_155_0.ladyDict[arg_155_0.apartment:GetConfigID()]:SetCameraLady()
			arg_155_0:RegisterCameraBlendFinished(arg_155_0.cameras[var_0_0.CAMERA.TALK], arg_162_0)
			arg_155_0:ActiveCamera(arg_155_0.cameras[var_0_0.CAMERA.TALK])
		end
	}
	local var_155_1 = {}

	table.insert(var_155_1, function(arg_163_0)
		switch(arg_155_1, var_155_0, arg_163_0, arg_163_0)
	end)
	seriesAsync(var_155_1, arg_155_2)
end

function var_0_0.SetIKStatus(arg_164_0, arg_164_1, arg_164_2)
	warning("Set IKStatus " .. (arg_164_1.id or "NIL"))

	arg_164_0.enableIKTip = true

	setActive(arg_164_0.ladyCollider, false)
	_.each(arg_164_0.ladyTouchColliders, function(arg_165_0)
		setActive(arg_165_0, true)
	end)
	table.clear(arg_164_0.readyIKLayers)

	arg_164_0.blockIK = nil

	local var_164_0 = _.map(arg_164_1.ik_id, function(arg_166_0)
		return arg_166_0[1]
	end)

	table.Foreach(var_164_0, function(arg_167_0, arg_167_1)
		local var_167_0 = Dorm3dIK.New({
			configId = arg_167_1
		})

		table.insert(arg_164_0.readyIKLayers, {
			ikData = var_167_0
		})

		arg_164_0.cacheIKInfos[var_167_0] = {}

		local var_167_1 = var_167_0:GetControllerPath()
		local var_167_2 = arg_164_0.ladyIKRoot:Find(var_167_1):GetComponent(typeof(RootMotion.FinalIK.IKExecutionOrder))
		local var_167_3 = {}

		table.IpairsCArray(var_167_2.IKComponents, function(arg_168_0, arg_168_1)
			var_167_3[arg_168_0 + 1] = arg_168_1:GetIKSolver()
		end)

		arg_164_0.cacheIKInfos[var_167_0].solvers = var_167_3

		local var_167_4 = _.map(var_167_3, function(arg_169_0)
			return arg_169_0.IKPositionWeight
		end)

		arg_164_0.cacheIKInfos[var_167_0].weights = var_167_4
	end)

	arg_164_0.camBrain.enabled = false

	if arg_164_0.cameras[var_0_0.CAMERA.IK_WATCH] then
		setActive(arg_164_0.cameras[var_0_0.CAMERA.IK_WATCH], false)

		arg_164_0.cameras[var_0_0.CAMERA.IK_WATCH] = nil
	end

	local var_164_1 = arg_164_0.cameraRoot:Find(arg_164_1.ik_camera)

	assert(var_164_1, "Missing IKCamera")

	arg_164_0.cameras[var_0_0.CAMERA.IK_WATCH] = var_164_1

	arg_164_0:ActiveCamera(arg_164_0.cameras[var_0_0.CAMERA.IK_WATCH])

	arg_164_0.camBrain.enabled = true

	local var_164_2 = var_164_1:GetComponent(typeof(Cinemachine.CinemachineFreeLook))

	if var_164_2 then
		arg_164_0:RegisterOrbits(var_164_2)
	end

	arg_164_0:SettingHeadAimIK(arg_164_0, arg_164_0.ikConfig.head_track)
	arg_164_0:ResetIKTipTimer()
	arg_164_0:SwitchAnim(arg_164_1.character_action)
	onNextTick(function()
		local var_170_0 = arg_164_0.furnitures:Find(arg_164_1.character_position)

		arg_164_0.lady.position = var_170_0:Find("StayPoint").position
		arg_164_0.lady.rotation = var_170_0:Find("StayPoint").rotation

		arg_164_0:EnableCloth(false)
		arg_164_0:EnableCloth(arg_164_1.use_cloth, arg_164_1.cloth_colliders)
		existCall(arg_164_2)
	end)
end

function var_0_0.ExitIKStatus(arg_171_0, arg_171_1, arg_171_2)
	arg_171_0.enableIKTip = false

	setActive(arg_171_0.ladyCollider, true)
	_.each(arg_171_0.ladyTouchColliders, function(arg_172_0)
		setActive(arg_172_0, false)
	end)
	arg_171_0:ResetActiveIKs(arg_171_0)
	table.clear(arg_171_0.readyIKLayers)
	table.clear(arg_171_0.cacheIKInfos)
	table.clear(arg_171_0.activeIKLayers)
	table.clear(arg_171_0.holdingStatus)
	eachChild(arg_171_0.ladyIKRoot, function(arg_173_0)
		setActive(arg_173_0, false)
	end)
	setActive(arg_171_0:GetIKTipsRootTF(), false)
	arg_171_0:RevertCameraOrbit()
	setActive(arg_171_0.cameras[var_0_0.CAMERA.IK_WATCH], false)

	arg_171_0.cameras[var_0_0.CAMERA.IK_WATCH] = nil

	arg_171_0:EnableCloth(false)
	arg_171_0:ResetHeadAimIK(arg_171_0)
	arg_171_0:SwitchAnim(arg_171_1.character_action)
	onNextTick(function()
		if arg_171_1.character_position then
			arg_171_0.ladyActiveZone = arg_171_1.character_position
		else
			arg_171_0.ladyActiveZone = arg_171_0.ladyBaseZone
		end

		arg_171_0:ChangeCharacterPosition()
		arg_171_0:TriggerLadyDistance()
		arg_171_0:CheckInSector()
		existCall(arg_171_2)
	end)
end

function var_0_0.EnableIKLayer(arg_175_0, arg_175_1, arg_175_2)
	warning("ENABLEIK", arg_175_2:GetConfigID())

	local var_175_0 = arg_175_2:GetControllerPath()
	local var_175_1 = arg_175_1.ladyIKRoot:Find(var_175_0):GetComponent(typeof(RootMotion.FinalIK.IKExecutionOrder))
	local var_175_2 = tf(var_175_1):Find("Container")
	local var_175_3 = {
		ikData = arg_175_2,
		list = var_175_1
	}

	if not arg_175_1.holdingStatus[arg_175_2] then
		var_175_3.rect = arg_175_2:GetRect()

		local var_175_4 = arg_175_2:GetActionTriggerParams()

		if var_175_4[1] == Dorm3dIK.ACTION_TRIGGER.RELEASE_ON_TARGET or var_175_4[1] == Dorm3dIK.ACTION_TRIGGER.TOUCH_TARGET then
			var_175_3.triggerRect = arg_175_2:GetTriggerRect()
		end

		local var_175_5 = var_175_2:Find("SubTargets")
		local var_175_6 = {}

		assert(var_175_5)

		local var_175_7 = arg_175_2:GetSubTargets()
		local var_175_8 = arg_175_2:GetPlaneRotations()
		local var_175_9 = arg_175_2:GetPlaneScales()

		table.Foreach(var_175_7, function(arg_176_0, arg_176_1)
			local var_176_0 = var_175_5:Find(arg_176_1[1])
			local var_176_1 = var_176_0:Find("Plane")

			if var_175_8[arg_176_0] then
				var_176_1.localRotation = var_175_8[arg_176_0]
				var_176_1.localScale = var_175_9[arg_176_0]
			end

			local var_176_2 = var_176_0:Find("Target")
			local var_176_3 = var_0_0.TransformMesh(var_176_1:GetComponent(typeof(UnityEngine.MeshCollider)))
			local var_176_4 = arg_175_1.ladyBoneMaps[arg_176_1[1]]

			var_176_3.origin = var_176_4.position

			local var_176_5 = var_175_3.rect
			local var_176_6 = Vector2.New(var_176_5.center.x / var_176_5.width, var_176_5.center.y / var_176_5.height)

			var_176_1.position = var_0_0.GetPostionByRatio(var_176_3, var_176_6)
			var_176_2.position = var_176_4.position

			local var_176_7 = {
				planeData = var_176_3,
				target = var_176_2,
				useOffset = tobool(arg_176_1)
			}

			table.insert(var_175_6, var_176_7)
		end)

		var_175_3.subPlanes = var_175_6

		setActive(var_175_1, true)
	else
		var_175_3 = arg_175_1.holdingStatus[arg_175_2].ikHandler
	end

	if #arg_175_2:GetHeadTrackPath() > 0 then
		arg_175_0:SettingHeadAimIK(arg_175_1, {
			2,
			arg_175_2:GetHeadTrackPath()
		}, true)
	end

	local var_175_10 = arg_175_2:GetTriggerFaceAnim()

	if #var_175_10 > 0 then
		arg_175_0:PlayFaceAnim(var_175_10)
	end

	setActive(arg_175_0:GetIKHandTF(), true)
	eachChild(arg_175_0:GetIKHandTF(), function(arg_177_0)
		setActive(arg_177_0, false)
	end)
	arg_175_0:StopIKHandTimer()
	setActive(arg_175_0:GetIKHandTF():Find("Begin"), true)

	arg_175_1.ikHandTimer = Timer.New(function()
		setActive(arg_175_0:GetIKHandTF():Find("Begin"), false)
		setActive(arg_175_0:GetIKHandTF():Find("Normal"), true)
	end, 0.5, 1)

	arg_175_1.ikHandTimer:Start()

	arg_175_1.ikNextCheckStamp = Time.time + var_0_0.IK_STATUS_DELTA

	arg_175_0:emit(var_0_0.ON_IK_STATUS_CHANGED, arg_175_2:GetConfigID(), var_0_0.IK_STATUS.BEGIN)
	pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataTouch(arg_175_0.apartment.configId, arg_175_0.apartment.level, arg_175_1.ikConfig.character_action, arg_175_2:GetTriggerParams()[2], arg_175_0.room:GetConfigID()))

	return var_175_3
end

function var_0_0.DeactiveIKLayer(arg_179_0, arg_179_1)
	if #arg_179_1:GetHeadTrackPath() > 0 then
		arg_179_0:SettingHeadAimIK(arg_179_0, arg_179_0.ikConfig.head_track)
	end

	arg_179_0:StopIKHandTimer()
	setActive(arg_179_0:GetIKHandTF():Find("Begin"), false)
	setActive(arg_179_0:GetIKHandTF():Find("Normal"), false)
	setActive(arg_179_0:GetIKHandTF():Find("End"), true)

	arg_179_0.ikHandTimer = Timer.New(function()
		setActive(arg_179_0:GetIKHandTF():Find("End"), false)
		setActive(arg_179_0:GetIKHandTF(), false)
	end, 0.5, 1)

	arg_179_0.ikHandTimer:Start()
end

function var_0_0.StopIKHandTimer(arg_181_0)
	if not arg_181_0.ikHandTimer then
		return
	end

	arg_181_0.ikHandTimer:Stop()

	arg_181_0.ikHandTimer = nil
end

function var_0_0.RevertIKLayer(arg_182_0, arg_182_1, arg_182_2)
	seriesAsync({
		function(arg_183_0)
			if arg_182_1 >= 999 then
				return arg_183_0()
			end

			arg_182_0:PlayIKRevert(arg_182_0, arg_182_1, arg_183_0)
		end,
		arg_182_2
	})
end

function var_0_0.RevertAllIKLayer(arg_184_0, arg_184_1, arg_184_2)
	table.insertto(arg_184_0.activeIKLayers, _.keys(arg_184_0.holdingStatus))
	table.clear(arg_184_0.holdingStatus)
	arg_184_0.RevertIKLayer(arg_184_0, arg_184_1, arg_184_2)
end

function var_0_0.PlayIKRevert(arg_185_0, arg_185_1, arg_185_2, arg_185_3)
	local var_185_0 = Time.time

	function arg_185_0.ikRevertHandler()
		local var_186_0 = Time.time - var_185_0

		_.each(arg_185_1.activeIKLayers, function(arg_187_0)
			local var_187_0 = 1

			if arg_185_2 > 0 then
				var_187_0 = var_186_0 / arg_185_2
			end

			local var_187_1 = arg_185_1.cacheIKInfos[arg_187_0].solvers
			local var_187_2 = arg_185_1.cacheIKInfos[arg_187_0].weights

			table.Foreach(var_187_1, function(arg_188_0, arg_188_1)
				arg_188_1.IKPositionWeight = math.lerp(var_187_2[arg_188_0], 0, var_187_0)
			end)
		end)

		if var_186_0 >= arg_185_2 then
			arg_185_0:ResetActiveIKs(arg_185_1)

			arg_185_0.ikRevertHandler = nil

			existCall(arg_185_3)
		end
	end

	arg_185_0.ikRevertHandler()
end

function var_0_0.ResetActiveIKs(arg_189_0, arg_189_1)
	table.insertto(arg_189_0.activeIKLayers, _.keys(arg_189_0.holdingStatus))
	table.clear(arg_189_0.holdingStatus)
	_.each(arg_189_1.activeIKLayers, function(arg_190_0)
		local var_190_0 = arg_190_0:GetControllerPath()
		local var_190_1 = arg_189_1.ladyIKRoot:Find(var_190_0):GetComponent(typeof(RootMotion.FinalIK.IKExecutionOrder))

		setActive(var_190_1, false)

		local var_190_2 = arg_189_1.cacheIKInfos[arg_190_0].solvers
		local var_190_3 = arg_189_1.cacheIKInfos[arg_190_0].weights

		table.Foreach(var_190_2, function(arg_191_0, arg_191_1)
			arg_191_1.IKPositionWeight = var_190_3[arg_191_0]
		end)
	end)
	table.clear(arg_189_1.activeIKLayers)
end

function var_0_0.PlayIKAction(arg_192_0, arg_192_1)
	warning("Trigger IK", arg_192_1:GetConfigID())
	arg_192_0:emit(var_0_0.ON_IK_STATUS_CHANGED, arg_192_1:GetConfigID(), var_0_0.IK_STATUS.TRIGGER)
	arg_192_0:OnTriggerIK(arg_192_1:GetConfigID())
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

function var_0_0.SettingHeadAimIK(arg_195_0, arg_195_1, arg_195_2, arg_195_3)
	local var_195_0

	if arg_195_2[1] == 1 then
		var_195_0 = arg_195_0.mainCameraTF:Find("AimTarget")
	elseif arg_195_2[1] == 2 then
		table.IpairsCArray(arg_195_1.lady:GetComponentsInChildren(typeof(Transform), true), function(arg_196_0, arg_196_1)
			if arg_196_1.name ~= arg_195_2[2] then
				return
			end

			var_195_0 = arg_196_1
		end)
	end

	arg_195_1.ladyHeadIKComp.AimTarget = var_195_0

	if not arg_195_3 and arg_195_2[3] then
		arg_195_1.ladyHeadIKComp.BodyWeight = arg_195_2[3]
	end

	if not arg_195_3 and arg_195_2[4] then
		arg_195_1.ladyHeadIKComp.HeadWeight = arg_195_2[4]
	end
end

function var_0_0.ResetHeadAimIK(arg_197_0, arg_197_1)
	arg_197_1.ladyHeadIKComp.AimTarget = arg_197_0.mainCameraTF:Find("AimTarget")
	arg_197_1.ladyHeadIKComp.HeadWeight = arg_197_1.ladyHeadIKData.HeadWeight
	arg_197_1.ladyHeadIKComp.BodyWeight = arg_197_1.ladyHeadIKData.BodyWeight
end

function var_0_0.HideCharacter(arg_198_0, arg_198_1)
	local function var_198_0(arg_199_0)
		arg_199_0:HideCharacterBylayer()
	end

	for iter_198_0, iter_198_1 in pairs(arg_198_0.ladyDict) do
		if iter_198_0 ~= arg_198_1 then
			var_198_0(iter_198_1)
		end
	end
end

function var_0_0.RevertCharacter(arg_200_0, arg_200_1)
	local function var_200_0(arg_201_0)
		arg_201_0:RevertCharacterBylayer()
	end

	for iter_200_0, iter_200_1 in pairs(arg_200_0.ladyDict) do
		if iter_200_0 ~= arg_200_1 then
			var_200_0(iter_200_1)
		end
	end
end

function var_0_0.HideCharacterBylayer(arg_202_0)
	local var_202_0 = "Bip001"
	local var_202_1 = arg_202_0.lady:Find("all")

	for iter_202_0 = 0, var_202_1.childCount - 1 do
		local var_202_2 = var_202_1:GetChild(iter_202_0)

		if var_202_2.name ~= var_202_0 then
			pg.ViewUtils.SetLayer(var_202_2, Layer.Environment3D)
		end
	end

	if arg_202_0.tfPendintItem then
		pg.ViewUtils.SetLayer(arg_202_0.tfPendintItem, Layer.Environment3D)
	end

	if arg_202_0.ladyWatchFloat then
		pg.ViewUtils.SetLayer(arg_202_0.ladyWatchFloat, Layer.Environment3D)
	end

	GetComponent(arg_202_0.lady, "BLHXCharacterPropertiesController").enabled = false
end

function var_0_0.RevertCharacterBylayer(arg_203_0)
	local var_203_0 = "Bip001"
	local var_203_1 = arg_203_0.lady:Find("all")

	for iter_203_0 = 0, var_203_1.childCount - 1 do
		local var_203_2 = var_203_1:GetChild(iter_203_0)

		if var_203_2.name ~= var_203_0 then
			pg.ViewUtils.SetLayer(var_203_2, Layer.Default)
		end
	end

	if arg_203_0.tfPendintItem then
		pg.ViewUtils.SetLayer(arg_203_0.tfPendintItem, Layer.Default)
	end

	if arg_203_0.ladyWatchFloat then
		pg.ViewUtils.SetLayer(arg_203_0.ladyWatchFloat, Layer.Default)
	end

	GetComponent(arg_203_0.lady, "BLHXCharacterPropertiesController").enabled = true
end

function var_0_0.EnterFurnitureWatchMode(arg_204_0)
	arg_204_0:SetAllBlackbloardValue("inLockLayer", true)
	arg_204_0:HideCharacter()
end

function var_0_0.ExitFurnitureWatchMode(arg_205_0)
	arg_205_0:HideFurnitureSlots()

	local var_205_0 = arg_205_0.cameras[var_0_0.CAMERA.POV]

	seriesAsync({
		function(arg_206_0)
			arg_205_0:emit(var_0_0.SHOW_BLOCK)
			arg_205_0:ShowBlackScreen(true, arg_206_0)
		end,
		function(arg_207_0)
			arg_205_0:RevertCharacter()
			arg_205_0:SetAllBlackbloardValue("inLockLayer", false)
			arg_205_0:RegisterCameraBlendFinished(var_205_0, arg_207_0)
			arg_205_0:ActiveCamera(var_205_0)
		end,
		function(arg_208_0)
			arg_205_0:ShowBlackScreen(false, arg_208_0)
		end
	}, function()
		arg_205_0:emit(var_0_0.HIDE_BLOCK)
	end)
	arg_205_0:RefreshSlots()
end

function var_0_0.SwitchFurnitureZone(arg_210_0, arg_210_1)
	local var_210_0 = arg_210_0:GetFurnitureByName(arg_210_1:GetWatchCameraName()):Find("FurnitureWatch Camera"):GetComponent(typeof(Cinemachine.CinemachineVirtualCamera))

	if arg_210_0.cameraFurnitureWatch and arg_210_0.cameraFurnitureWatch ~= var_210_0 then
		arg_210_0:UnRegisterCameraBlendFinished(arg_210_0.cameraFurnitureWatch)
		setActive(arg_210_0.cameraFurnitureWatch, false)
	end

	arg_210_0.cameraFurnitureWatch = var_210_0
	arg_210_0.cameras[var_0_0.CAMERA.FURNITURE_WATCH] = arg_210_0.cameraFurnitureWatch

	arg_210_0:RegisterCameraBlendFinished(arg_210_0.cameraFurnitureWatch, function()
		arg_210_0:emit(var_0_0.HIDE_BLOCK)
	end)
	arg_210_0:emit(var_0_0.SHOW_BLOCK)
	arg_210_0:ActiveCamera(arg_210_0.cameraFurnitureWatch)
end

function var_0_0.HideFurnitureSlots(arg_212_0)
	if arg_212_0.displaySlots then
		arg_212_0:UpdateDisplaySlots({})
		table.Foreach(arg_212_0.displaySlots, function(arg_213_0, arg_213_1)
			local var_213_0 = arg_213_1.trans

			if IsNil(var_213_0:Find("Selector")) then
				return
			end

			setActive(var_213_0:Find("Selector"), false)
		end)

		arg_212_0.displaySlots = nil
	end
end

function var_0_0.DisplayFurnitureSlots(arg_214_0, arg_214_1)
	arg_214_0:HideFurnitureSlots()

	arg_214_0.displaySlots = {}

	_.each(arg_214_1, function(arg_215_0)
		arg_214_0.displaySlots[arg_215_0] = arg_214_0.slotDict[arg_215_0]

		if not arg_214_0.displaySlots[arg_215_0] then
			errorMsg("Slot " .. arg_215_0 .. " Not Binding Scene Object")

			return
		end

		local var_215_0 = arg_214_0.displaySlots[arg_215_0].trans

		if var_215_0:Find("Selector") then
			setActive(var_215_0:Find("Selector"), true)
		end
	end)
end

function var_0_0.UpdateDisplaySlots(arg_216_0, arg_216_1)
	table.Foreach(arg_216_0.displaySlots, function(arg_217_0, arg_217_1)
		local var_217_0 = arg_217_1.trans

		if not IsNil(var_217_0:Find("Selector")) then
			setActive(var_217_0:Find("Selector/Normal"), arg_216_1[arg_217_0] == 0)
			setActive(var_217_0:Find("Selector/Active"), arg_216_1[arg_217_0] == 1)
			setActive(var_217_0:Find("Selector/Ban"), arg_216_1[arg_217_0] == 2)
		end

		local var_217_1 = arg_216_0.slotDict[arg_217_0].model
		local var_217_2 = arg_216_0.slotDict[arg_217_0].displayModelName

		if var_217_2 and var_217_2 ~= "" then
			var_217_1 = var_217_0:GetChild(var_217_0.childCount - 1)
		end

		local function var_217_3(arg_218_0, arg_218_1)
			local var_218_0 = arg_218_0:GetComponentsInChildren(typeof(Renderer), true)

			table.IpairsCArray(var_218_0, function(arg_219_0, arg_219_1)
				local var_219_0 = arg_219_1.material

				if var_219_0 and var_219_0:HasProperty("_FinalTint") then
					var_219_0:SetColor("_FinalTint", arg_218_1)
				end
			end)
		end

		if var_217_1 then
			if arg_216_1[arg_217_0] == 1 then
				var_217_3(var_217_1, Color.NewHex("3F83AE73"))
			else
				var_217_3(var_217_1, Color.New(0, 0, 0, 0))
			end
		end
	end)
end

function var_0_0.EnterPhotoMode(arg_220_0, arg_220_1, arg_220_2)
	arg_220_0:SetAllBlackbloardValue("inLockLayer", true)
	arg_220_0:emit(var_0_0.ENABLE_SCENEBLOCK, true)
	seriesAsync({
		function(arg_221_0)
			arg_220_0:TempHideUI(true, arg_221_0)
		end,
		function(arg_222_0)
			arg_220_0:ShowBlackScreen(true, arg_222_0)
		end,
		function(arg_223_0)
			arg_220_0:SwitchAnim(arg_220_2)
			onNextTick(function()
				arg_220_0:ResetCharPoint(arg_220_1:GetWatchCameraName())
				arg_220_0:SyncInterestTransform()
			end)

			local var_223_0 = arg_220_0.cameraPhoto
			local var_223_1 = var_223_0.m_XAxis

			var_223_1.Value = 180
			var_223_0.m_XAxis = var_223_1

			local var_223_2 = var_223_0.m_YAxis

			var_223_2.Value = 0.7
			var_223_0.m_YAxis = var_223_2

			arg_220_0:RegisterOrbits(arg_220_0.cameraPhoto)

			arg_220_0.pinchValue = 1

			arg_220_0:SetCameraObrits()
			arg_220_0:RegisterCameraBlendFinished(var_223_0, arg_223_0)
			arg_220_0:ActiveCamera(var_223_0)
		end,
		function(arg_225_0)
			arg_220_0:ShowBlackScreen(false, arg_225_0)
		end
	}, function()
		arg_220_0:EnableJoystick(true)
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
				arg_233_0:SyncInterestTransform()
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
	arg_239_0.ladyInterest.position = arg_239_0.ladyInterestRoot.position
end

function var_0_0.ResetPhotoCameraPosition(arg_240_0)
	local var_240_0 = arg_240_0.cameraPhoto
	local var_240_1 = var_240_0.m_XAxis

	var_240_1.Value = 180
	var_240_0.m_XAxis = var_240_1

	local var_240_2 = var_240_0.m_YAxis

	var_240_2.Value = 0.7
	var_240_0.m_YAxis = var_240_2
end

function var_0_0.ResetCharPoint(arg_241_0, arg_241_1)
	local var_241_0 = arg_241_0.furnitures:Find(arg_241_1 .. "/StayPoint")

	arg_241_0.lady.position = var_241_0.position
	arg_241_0.lady.rotation = var_241_0.rotation
end

function var_0_0.GetNearestAngle(arg_242_0, arg_242_1, arg_242_2, arg_242_3)
	if arg_242_3 < arg_242_2 then
		arg_242_3 = arg_242_3 + 360
	end

	if arg_242_2 <= arg_242_1 and arg_242_1 <= arg_242_3 then
		return arg_242_1
	end

	local var_242_0 = (arg_242_2 + arg_242_3) / 2

	arg_242_1 = var_242_0 - Mathf.DeltaAngle(arg_242_1, var_242_0)
	arg_242_1 = math.clamp(arg_242_1, arg_242_2, arg_242_3)

	return arg_242_1
end

function var_0_0.PlayTimeline(arg_243_0, arg_243_1, arg_243_2)
	local var_243_0 = {}

	if arg_243_0.waitForTimeline then
		table.insert(var_243_0, function(arg_244_0)
			local var_244_0 = arg_243_0.waitForTimeline

			arg_243_0.waitForTimeline = nil

			var_244_0()
			arg_244_0()
		end)
	end

	table.insert(var_243_0, function(arg_245_0)
		arg_243_0:LoadTimelineScene(arg_243_1.name, false, arg_245_0)
	end)

	if arg_243_1.scene and arg_243_1.sceneRoot then
		table.insert(var_243_0, function(arg_246_0)
			arg_243_0:ChangeArtScene(arg_243_1.scene .. "|" .. arg_243_1.sceneRoot, arg_246_0)
		end)
	end

	table.insert(var_243_0, function(arg_247_0)
		local var_247_0 = GameObject.Find("[sequence]").transform
		local var_247_1 = var_247_0:GetComponent(typeof(UnityEngine.Playables.PlayableDirector))

		if GetComponent(var_247_1, "TimelineSpeed") then
			setDirectorSpeed(var_247_1, 1)
		else
			GetOrAddComponent(var_247_0, "TimelineSpeed")
		end

		local var_247_2 = GameObject.Find("[actor]").transform
		local var_247_3 = var_247_2:GetComponentsInChildren(typeof(Animator), true)

		table.IpairsCArray(var_247_3, function(arg_248_0, arg_248_1)
			GetOrAddComponent(arg_248_1.transform, typeof(DftAniEvent))
		end)
		table.IpairsCArray(var_247_2:GetComponentsInChildren(typeof("MagicaCloth.BaseCloth"), true), function(arg_249_0, arg_249_1)
			arg_249_1.enabled, arg_249_1.enabled = arg_249_1.enabled, false
		end)
		var_247_1:Stop()

		var_247_1.extrapolationMode = ReflectionHelp.RefGetField(typeof("UnityEngine.Playables.DirectorWrapMode"), "Hold", nil)

		if arg_243_1.time then
			var_247_1.time = math.clamp(arg_243_1.time, 0, var_247_1.duration)
		end

		local var_247_4 = {}

		local function var_247_5(arg_250_0)
			switch(arg_250_0.stringParameter, {
				TimelinePause = function()
					setDirectorSpeed(var_247_1, 0)
				end,
				TimelineResume = function()
					arg_243_0.timelineSpeed = 1

					setDirectorSpeed(var_247_1, 1)
				end,
				TimelinePlayOnTime = function()
					if arg_250_0.intParameter == 0 or arg_250_0.intParameter == var_247_4.selectIndex then
						var_247_1.time = arg_250_0.floatParameter

						var_247_1:RebuildGraph()
					end
				end,
				TimelineSelectStart = function()
					var_247_4.selectIndex = nil

					if arg_243_1.options then
						local var_254_0 = arg_243_1.options[arg_250_0.intParameter]

						arg_243_0:DoTimelineOption(var_254_0, function(arg_255_0)
							var_247_4.selectIndex = arg_255_0
							var_247_4.optionIndex = var_254_0[arg_255_0].flag
						end)
					end
				end,
				TimelineTouchStart = function()
					var_247_4.selectIndex = nil

					if arg_243_1.touchs then
						local var_256_0 = arg_243_1.touchs[arg_250_0.intParameter]

						arg_243_0:DoTimelineTouch(arg_243_1.touchs[arg_250_0.intParameter], function(arg_257_0)
							var_247_4.selectIndex = arg_257_0
							var_247_4.optionIndex = var_256_0[arg_257_0].flag
						end)
					end
				end,
				TimelineSelectLoop = function()
					if not var_247_4.selectIndex then
						var_247_1.time = arg_250_0.floatParameter

						var_247_1:RebuildGraph()
					end
				end,
				TimelineAccompanyJump = function()
					if arg_243_0.canTriggerAccompanyPerformance then
						arg_243_0.canTriggerAccompanyPerformance = false

						local var_259_0 = arg_243_1.accompanys[arg_250_0.intParameter]
						local var_259_1 = var_259_0[math.random(#var_259_0)]

						var_247_1.time = var_259_1

						var_247_1:RebuildGraph()
					end
				end,
				TimelineEnd = function()
					var_247_4.finish = true

					setDirectorSpeed(var_247_1, 0)
				end
			}, function()
				warning("other event trigger:" .. arg_250_0.stringParameter)
			end)

			if var_247_4.finish then
				arg_243_0.timelineMark = var_247_4
				arg_243_0.timelineFinishCall = nil

				arg_247_0()
			end
		end

		GetOrAddComponent(var_247_0, "DftCommonSignalReceiver"):SetCommonEvent(var_247_5)

		function arg_243_0.timelineFinishCall()
			var_247_5({
				stringParameter = "TimelineEnd"
			})
		end

		arg_243_0:HideCharacter()
		setActive(arg_243_0.mainCameraTF, false)
		eachChild(arg_243_0.rtTimelineScreen, function(arg_263_0)
			setActive(arg_263_0, false)
		end)
		setActive(arg_243_0.rtTimelineScreen, true)
		setActive(arg_243_0.rtTimelineScreen:Find("btn_skip"), arg_243_0.inReplayTalk)
		var_247_1:Play()
		var_247_1:Evaluate()
	end)
	table.insert(var_243_0, function(arg_264_0)
		arg_243_0:ShowBlackScreen(true, function()
			arg_243_0:UnloadTimelineScene(arg_243_1.name, false, arg_264_0)
		end)
	end)

	local var_243_1 = arg_243_0.artSceneInfo

	table.insert(var_243_0, function(arg_266_0)
		arg_243_0:ChangeArtScene(var_243_1, arg_266_0)
	end)
	seriesAsync(var_243_0, function()
		setActive(arg_243_0.rtTimelineScreen, false)
		arg_243_0:RevertCharacter()
		setActive(arg_243_0.mainCameraTF, true)

		local var_267_0 = arg_243_0.timelineMark

		arg_243_0.timelineMark = nil

		existCall(arg_243_2, var_267_0, function(arg_268_0)
			arg_243_0:ShowBlackScreen(false, arg_268_0)
		end)
	end)
end

function var_0_0.PlaySingleAction(arg_269_0, arg_269_1, arg_269_2)
	local var_269_0 = string.find(arg_269_1, "^Face_")

	if tobool(var_269_0) then
		arg_269_0:PlayFaceAnim(arg_269_1, arg_269_2)

		return
	end

	arg_269_0.animNameMap = arg_269_0.animNameMap or {}
	arg_269_0.animNameMap[arg_269_0.ladyAnimator.StringToHash(arg_269_1)] = arg_269_1

	local var_269_1 = {}

	if not arg_269_0.ladyAnimator:GetCurrentAnimatorStateInfo(arg_269_0.ladyAnimBaseLayerIndex):IsName(arg_269_1) then
		table.insert(var_269_1, function(arg_270_0)
			arg_269_0.nowState = arg_269_1
			arg_269_0.stateCallback = arg_270_0

			arg_269_0.ladyAnimator:CrossFadeInFixedTime(arg_269_1, 0.25, arg_269_0.ladyAnimBaseLayerIndex)
		end)
		table.insert(var_269_1, function(arg_271_0)
			arg_269_0.nowState = nil
			arg_269_0.stateCallback = nil

			arg_271_0()
		end)
	end

	seriesAsync(var_269_1, arg_269_2)
end

function var_0_0.SwitchAnim(arg_272_0, arg_272_1, arg_272_2)
	local var_272_0 = string.find(arg_272_1, "^Face_")

	if tobool(var_272_0) then
		arg_272_0:PlayFaceAnim(arg_272_1, arg_272_2)

		return
	end

	arg_272_0.animNameMap = arg_272_0.animNameMap or {}
	arg_272_0.animNameMap[arg_272_0.ladyAnimator.StringToHash(arg_272_1)] = arg_272_1

	local var_272_1 = {}

	table.insert(var_272_1, function(arg_273_0)
		arg_272_0.nowState = arg_272_1
		arg_272_0.stateCallback = arg_273_0

		arg_272_0.ladyAnimator:PlayInFixedTime(arg_272_1, arg_272_0.ladyAnimBaseLayerIndex)
	end)
	table.insert(var_272_1, function(arg_274_0)
		arg_272_0.nowState = nil
		arg_272_0.stateCallback = nil

		arg_274_0()
	end)
	seriesAsync(var_272_1, arg_272_2)
end

function var_0_0.PlayFaceAnim(arg_275_0, arg_275_1, arg_275_2)
	arg_275_0.ladyAnimator:CrossFadeInFixedTime(arg_275_1, 0.2, arg_275_0.ladyAnimFaceLayerIndex)
	existCall(arg_275_2)
end

function var_0_0.GetCurrentAnim(arg_276_0)
	local var_276_0 = arg_276_0.ladyAnimator:GetCurrentAnimatorStateInfo(arg_276_0.ladyAnimBaseLayerIndex).shortNameHash

	return arg_276_0.animNameMap[var_276_0]
end

function var_0_0.RegisterAnimCallback(arg_277_0, arg_277_1, arg_277_2)
	arg_277_0.animCallbacks[arg_277_1] = arg_277_2
end

function var_0_0.SetCharacterAnimSpeed(arg_278_0, arg_278_1)
	arg_278_0.ladyAnimator.speed = arg_278_1
	arg_278_0.ladyHeadIKComp.blinkSpeed = arg_278_0.ladyHeadIKData.blinkSpeed * arg_278_1

	if arg_278_1 > 0 then
		arg_278_0.ladyHeadIKComp.DampTime = arg_278_0.ladyHeadIKData.DampTime / arg_278_1
	else
		arg_278_0.ladyHeadIKComp.DampTime = arg_278_0.ladyHeadIKData.DampTime * math.huge
	end
end

function var_0_0.OnAnimationEvent(arg_279_0, arg_279_1)
	if arg_279_1.animatorClipInfo.weight < 0.5 then
		return
	end

	local var_279_0 = arg_279_1.stringParameter
	local var_279_1 = table.removebykey(arg_279_0.animEventCallbacks, var_279_0)

	existCall(var_279_1)
end

function var_0_0.RegisterAnimEventCallback(arg_280_0, arg_280_1, arg_280_2)
	arg_280_0.animEventCallbacks[arg_280_1] = arg_280_2
end

function var_0_0.RegisterCameraBlendFinished(arg_281_0, arg_281_1, arg_281_2)
	arg_281_0.cameraBlendCallbacks[arg_281_1] = arg_281_2
end

function var_0_0.UnRegisterCameraBlendFinished(arg_282_0, arg_282_1)
	arg_282_0.cameraBlendCallbacks[arg_282_1] = nil
end

function var_0_0.OnCameraBlendFinished(arg_283_0, arg_283_1)
	if not arg_283_1 then
		return
	end

	local var_283_0 = table.removebykey(arg_283_0.cameraBlendCallbacks, arg_283_1)

	existCall(var_283_0)
end

function var_0_0.PlayHeartFX(arg_284_0, arg_284_1)
	local var_284_0 = arg_284_0.ladyDict[arg_284_1]

	setActive(var_284_0.effectHeart, false)
	setActive(var_284_0.effectHeart, true)
	pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_joyful")
end

function var_0_0.PlayExpression(arg_285_0, arg_285_1)
	local var_285_0 = arg_285_1.name
	local var_285_1 = arg_285_0.expressionDict[var_285_0]
	local var_285_2 = 5

	if var_285_1 then
		local var_285_3 = var_285_1.timer

		var_285_3:Reset(nil, var_285_2)
		var_285_3:Start()

		if var_285_1.instance then
			setActive(var_285_1.instance, false)
			setActive(var_285_1.instance, true)
		end

		return
	end

	local var_285_4 = {
		name = var_285_0,
		timer = Timer.New(function()
			arg_285_0:RemoveExpression(var_285_0)
		end, var_285_2, 1, true)
	}

	arg_285_0.expressionDict[var_285_0] = var_285_4

	arg_285_0.loader:GetPrefab("dorm3D/effect/prefab/expression/" .. var_285_0, var_285_0, function(arg_287_0)
		var_285_4.instance = arg_287_0

		onNextTick(function()
			setParent(arg_287_0, arg_285_0.ladyHeadCenter)
		end)
		setLocalPosition(arg_287_0, Vector3(0, 0, -0.2))
		setActive(arg_287_0, false)
		setActive(arg_287_0, true)
	end, var_285_4)
end

function var_0_0.RemoveExpression(arg_289_0, arg_289_1)
	local var_289_0 = arg_289_0.expressionDict[arg_289_1]

	if not var_289_0 then
		return
	end

	arg_289_0.loader:ClearRequest(var_289_0)

	if var_289_0.instance then
		arg_289_0.loader:ReturnPrefab(var_289_0.instance)
	end

	arg_289_0.expressionDict[arg_289_1] = nil
end

function var_0_0.ShowOrHideCanWatchMark(arg_290_0, arg_290_1)
	arg_290_0.ladyWatchFloat = arg_290_0.ladyWatchFloat or cloneTplTo(arg_290_0.resTF:Find("vfx_talk_mark"), arg_290_0.ladyHeadCenter)

	setActive(arg_290_0.ladyWatchFloat, arg_290_1)
end

function var_0_0.RegisterGlobalVolume(arg_291_0)
	local var_291_0 = arg_291_0.globalVolume
	local var_291_1 = LuaHelper.GetOrAddVolumeComponent(var_291_0, typeof(BLHX.PostEffect.Overrides.DepthOfField))
	local var_291_2 = LuaHelper.GetOrAddVolumeComponent(var_291_0, typeof(BLHX.PostEffect.Overrides.ColorGrading))

	arg_291_0.originalCameraSettings = {
		depthOfField = {
			enabled = var_291_1.enabled.value,
			focusDistance = {
				length = 2,
				min = var_291_1.gaussianStart.min,
				value = var_291_1.gaussianStart.value
			},
			blurRadius = {
				min = var_291_1.blurRadius.min,
				max = var_291_1.blurRadius.max,
				value = var_291_1.blurRadius.value
			}
		},
		postExposure = {
			value = var_291_2.postExposure.value
		},
		contrast = {
			min = var_291_2.contrast.min,
			max = var_291_2.contrast.max,
			value = var_291_2.contrast.value
		},
		saturate = {
			min = var_291_2.saturation.min,
			max = var_291_2.saturation.max,
			value = var_291_2.saturation.value
		}
	}
	arg_291_0.originalCameraSettings.depthOfField.enabled = true

	local var_291_3 = var_291_0:GetComponent(typeof(BLHX.Volume.Volume))

	arg_291_0.originalVolume = {
		profile = var_291_3.sharedProfile,
		weight = var_291_3.weight
	}
end

function var_0_0.SettingCamera(arg_292_0, arg_292_1)
	arg_292_0.activeCameraSettings = arg_292_1

	local var_292_0 = arg_292_0.globalVolume
	local var_292_1 = LuaHelper.GetOrAddVolumeComponent(var_292_0, typeof(BLHX.PostEffect.Overrides.DepthOfField))
	local var_292_2 = LuaHelper.GetOrAddVolumeComponent(var_292_0, typeof(BLHX.PostEffect.Overrides.ColorGrading))

	var_292_1.enabled:Override(arg_292_1.depthOfField.enabled)
	var_292_1.gaussianStart:Override(arg_292_1.depthOfField.focusDistance.value)
	var_292_1.gaussianEnd:Override(arg_292_1.depthOfField.focusDistance.value + arg_292_1.depthOfField.focusDistance.length)
	var_292_1.blurRadius:Override(arg_292_1.depthOfField.blurRadius.value)
	var_292_2.postExposure:Override(arg_292_1.postExposure.value)
	var_292_2.contrast:Override(arg_292_1.contrast.value)
	var_292_2.saturation:Override(arg_292_1.saturate.value)
end

function var_0_0.GetCameraSettings(arg_293_0)
	return arg_293_0.originalCameraSettings
end

function var_0_0.RevertCameraSettings(arg_294_0)
	arg_294_0:SettingCamera(arg_294_0.originalCameraSettings)

	arg_294_0.activeCameraSettings = nil
end

function var_0_0.SetVolumeProfile(arg_295_0, arg_295_1, arg_295_2)
	local var_295_0 = arg_295_0.globalVolume:GetComponent(typeof(BLHX.Volume.Volume))

	arg_295_0.activeProfileWeight = arg_295_2

	if arg_295_0.activeProfileName ~= arg_295_1 then
		arg_295_0.activeProfileName = arg_295_1

		arg_295_0.loader:LoadReference("dorm3d/scenesres/res/common", arg_295_1, nil, function(arg_296_0)
			var_295_0.profile = arg_296_0
			var_295_0.weight = arg_295_0.activeProfileWeight

			if arg_295_0.activeCameraSettings then
				arg_295_0:SettingCamera(arg_295_0.activeCameraSettings)
			end
		end, "VolumeProfile")
	else
		var_295_0.weight = arg_295_0.activeProfileWeight
	end
end

function var_0_0.RevertVolumeProfile(arg_297_0)
	local var_297_0 = arg_297_0.globalVolume:GetComponent(typeof(BLHX.Volume.Volume))

	var_297_0.profile = arg_297_0.originalVolume.profile
	var_297_0.weight = arg_297_0.originalVolume.weight

	if arg_297_0.activeCameraSettings then
		arg_297_0:SettingCamera(arg_297_0.activeCameraSettings)
	end

	arg_297_0.activeProfileName = nil
end

function var_0_0.RecordCharacterLight(arg_298_0)
	local var_298_0 = BLHX.Rendering.PipelineInterface.GetCharacterLightColor()

	arg_298_0.originalCharacterColor = {
		color = var_298_0.color,
		intensity = var_298_0.intensity
	}
end

function var_0_0.SetCharacterLight(arg_299_0, arg_299_1, arg_299_2, arg_299_3)
	local var_299_0 = arg_299_0.characterLight:GetComponent(typeof(Light))
	local var_299_1 = Color.Lerp(arg_299_0.originalCharacterColor.color, arg_299_1, arg_299_3)
	local var_299_2 = math.lerp(arg_299_0.originalCharacterColor.intensity, arg_299_2, arg_299_3)

	BLHX.Rendering.PipelineInterface.SetCharacterLight(var_299_1, var_299_2)
end

function var_0_0.RevertCharacterLight(arg_300_0)
	arg_300_0:SetCharacterLight(arg_300_0.originalCharacterColor.color, arg_300_0.originalCharacterColor.intensity, 1)
end

function var_0_0.EnableCloth(arg_301_0, arg_301_1, arg_301_2)
	arg_301_1 = arg_301_1 or {}

	table.Foreach(arg_301_0.clothComps, function(arg_302_0, arg_302_1)
		if arg_302_1 == nil then
			return
		end

		setActive(arg_302_1, arg_301_1[arg_302_0] == 1)
	end)
	table.Foreach(arg_301_0.clothColliderDict, function(arg_303_0, arg_303_1)
		if arg_303_1 == nil then
			return
		end

		setActive(arg_303_1, false)
	end)

	if arg_301_2 then
		table.Foreach(arg_301_2, function(arg_304_0, arg_304_1)
			local var_304_0 = arg_301_0.clothColliderDict[arg_304_1[1]]

			if var_304_0 == nil then
				return
			end

			setActive(var_304_0, arg_304_1[2] == 1)

			if arg_304_1[2] ~= 1 then
				return
			end

			var_0_0.SetMagicaCollider(var_304_0, arg_304_1[3], arg_304_1[4])
		end)
	end
end

function var_0_0.onBackPressed(arg_305_0)
	if arg_305_0.exited or arg_305_0.retainCount > 0 then
		-- block empty
	else
		arg_305_0:closeView()
	end
end

function var_0_0.EnableSceneDisplay(arg_306_0, arg_306_1, arg_306_2)
	assert(tobool(arg_306_0.lastSceneRootDict[arg_306_1]) == arg_306_2)

	if arg_306_2 then
		table.Foreach(arg_306_0.lastSceneRootDict[arg_306_1], function(arg_307_0, arg_307_1)
			if IsNil(arg_307_0) then
				return
			end

			setActive(arg_307_0, arg_307_1)
		end)

		arg_306_0.lastSceneRootDict[arg_306_1] = nil
	else
		arg_306_0.lastSceneRootDict[arg_306_1] = {}

		local var_306_0 = SceneManager.GetSceneByName(arg_306_1)

		table.IpairsCArray(var_306_0:GetRootGameObjects(), function(arg_308_0, arg_308_1)
			if tostring(arg_308_1.hideFlags) ~= "None" then
				return
			end

			arg_306_0.lastSceneRootDict[arg_306_1][arg_308_1] = isActive(arg_308_1)

			setActive(arg_308_1, false)
		end)
	end
end

function var_0_0.ChangeArtScene(arg_309_0, arg_309_1, arg_309_2)
	arg_309_1 = string.lower(arg_309_1)

	if arg_309_1 == arg_309_0.artSceneInfo then
		if arg_309_1 == arg_309_0.sceneInfo then
			arg_309_0:SwitchDayNight(arg_309_0.contextData.timeIndex)
			onNextTick(function()
				arg_309_0:RefreshSlots()
				existCall(arg_309_2)
			end)
		else
			existCall(arg_309_2)
		end

		return
	end

	local var_309_0 = {}
	local var_309_1 = false
	local var_309_2

	table.insert(var_309_0, function(arg_311_0)
		arg_309_0.artSceneInfo = arg_309_1

		if var_309_1 then
			pg.SceneAnimMgr.GetInstance():Dorm3DSceneChange(function(arg_312_0)
				var_309_2 = arg_312_0

				arg_311_0()
			end)
		else
			arg_311_0()
		end
	end)

	if arg_309_1 == arg_309_0.sceneInfo then
		table.insert(var_309_0, function(arg_313_0)
			setActive(arg_309_0.slotRoot, true)

			local var_313_0, var_313_1 = unpack(string.split(arg_309_0.sceneInfo, "|"))

			SceneManager.SetActiveScene(SceneManager.GetSceneByName(var_313_0))
			arg_309_0:EnableSceneDisplay(var_313_0, true)
			arg_309_0:SwitchDayNight(arg_309_0.contextData.timeIndex)
			onNextTick(function()
				arg_309_0:RefreshSlots()
			end)
			arg_313_0()
		end)
	else
		var_309_1 = true

		local var_309_3, var_309_4 = unpack(string.split(arg_309_1, "|"))

		table.insert(var_309_0, function(arg_315_0)
			setActive(arg_309_0.slotRoot, false)
			SceneOpMgr.Inst:LoadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_309_4 .. "/" .. var_309_3 .. "_scene"), var_309_3, LoadSceneMode.Additive, function(arg_316_0, arg_316_1)
				SceneManager.SetActiveScene(arg_316_0)

				local var_316_0 = getSceneRootTFDic(arg_316_0).MainCamera

				if var_316_0 then
					setActive(var_316_0, false)
				end

				arg_315_0()
			end)
		end)
	end

	if arg_309_0.artSceneInfo == arg_309_0.sceneInfo then
		table.insert(var_309_0, function(arg_317_0)
			local var_317_0, var_317_1 = unpack(string.split(arg_309_0.sceneInfo, "|"))

			arg_309_0:EnableSceneDisplay(var_317_0, false)
			arg_317_0()
		end)
	else
		local var_309_5, var_309_6 = unpack(string.split(arg_309_0.artSceneInfo, "|"))

		table.insert(var_309_0, function(arg_318_0)
			SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_309_6 .. "/" .. var_309_5 .. "_scene"), var_309_5, arg_318_0)
		end)
	end

	table.insert(var_309_0, function(arg_319_0)
		arg_319_0()

		if var_309_1 then
			var_309_2()
		end
	end)
	seriesAsync(var_309_0, arg_309_2)
end

function var_0_0.LoadTimelineScene(arg_320_0, arg_320_1, arg_320_2, arg_320_3)
	arg_320_1 = string.lower(arg_320_1)

	if arg_320_0.cacheSceneDic[arg_320_1] then
		if not arg_320_2 then
			arg_320_0.timelineScene = arg_320_1

			arg_320_0:EnableSceneDisplay(arg_320_1, true)
		end

		return existCall(arg_320_3)
	end

	local var_320_0 = {}
	local var_320_1

	table.insert(var_320_0, function(arg_321_0)
		pg.SceneAnimMgr.GetInstance():Dorm3DSceneChange(function(arg_322_0)
			if arg_320_0.waitForTimeline then
				arg_320_0.waitForTimeline = arg_322_0
				var_320_1 = nil
			else
				var_320_1 = arg_322_0
			end

			arg_321_0()
		end)
	end)
	table.insert(var_320_0, function(arg_323_0)
		local var_323_0 = arg_320_0.apartment:getConfig("asset_name")

		SceneOpMgr.Inst:LoadSceneAsync(string.lower("dorm3d/character/" .. var_323_0 .. "/timeline/" .. arg_320_1 .. "/" .. arg_320_1 .. "_scene"), arg_320_1, LoadSceneMode.Additive, function(arg_324_0, arg_324_1)
			local var_324_0 = GameObject.Find("[actor]").transform

			arg_320_0:HXCharacter(tf(var_324_0))

			local var_324_1 = GameObject.Find("[sequence]").transform:GetComponent(typeof(UnityEngine.Playables.PlayableDirector))

			var_324_1:Stop()
			TimelineSupport.InitTimeline(var_324_1)
			TimelineSupport.InitSubtitle(var_324_1, arg_320_0.apartment:GetCallName())

			arg_320_0.unloadDirector = var_324_1

			arg_323_0()
		end)
	end)
	table.insert(var_320_0, function(arg_325_0)
		arg_320_0.sceneGroupDic[arg_320_1] = arg_320_0.apartment:GetConfigID()

		if arg_320_2 then
			arg_320_0.cacheSceneDic[arg_320_1] = true

			arg_320_0:EnableSceneDisplay(arg_320_1, false)
		else
			arg_320_0.timelineScene = arg_320_1
		end

		arg_325_0()
		existCall(var_320_1)
	end)
	seriesAsync(var_320_0, arg_320_3)
end

function var_0_0.UnloadTimelineScene(arg_326_0, arg_326_1, arg_326_2, arg_326_3)
	arg_326_1 = string.lower(arg_326_1)

	if arg_326_0.timelineScene == arg_326_1 then
		arg_326_0.timelineScene = nil
	end

	if tobool(arg_326_2) == tobool(arg_326_0.cacheSceneDic[arg_326_1]) then
		local var_326_0 = getProxy(ApartmentProxy):getApartment(arg_326_0.sceneGroupDic[arg_326_1]):getConfig("asset_name")

		if arg_326_0.unloadDirector then
			TimelineSupport.UnloadPlayable(arg_326_0.unloadDirector)

			arg_326_0.unloadDirector = nil
		end

		SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/character/scenes/" .. var_326_0 .. "/timeline/" .. arg_326_1 .. "/" .. arg_326_1 .. "_scene"), arg_326_1, function()
			arg_326_0.cacheSceneDic[arg_326_1] = nil
			arg_326_0.sceneGroupDic[arg_326_1] = nil
			arg_326_0.lastSceneRootDict[arg_326_1] = nil

			existCall(arg_326_3)
		end)
	else
		arg_326_0:EnableSceneDisplay(arg_326_1, false)
		existCall(arg_326_3)
	end
end

function var_0_0.ChangeSubScene(arg_328_0, arg_328_1, arg_328_2)
	arg_328_1 = string.lower(arg_328_1)

	warning(arg_328_0.subSceneInfo, "->", arg_328_1, arg_328_1 == arg_328_0.subSceneInfo)

	if arg_328_1 == arg_328_0.subSceneInfo then
		arg_328_0.ladyActiveZone = arg_328_0.walkBornPoint or arg_328_0.ladyBaseZone

		arg_328_0:ChangeCharacterPosition()
		arg_328_0:ChangePlayerPosition(arg_328_0.ladyActiveZone)
		arg_328_0:TriggerLadyDistance()
		arg_328_0:CheckInSector()
		existCall(arg_328_2)

		return
	end

	local var_328_0 = {}
	local var_328_1 = false
	local var_328_2

	table.insert(var_328_0, function(arg_329_0)
		arg_328_0.subSceneInfo = arg_328_1

		if var_328_1 then
			pg.SceneAnimMgr.GetInstance():Dorm3DSceneChange(function(arg_330_0)
				var_328_2 = arg_330_0

				arg_329_0()
			end)
		else
			arg_329_0()
		end
	end)

	if arg_328_1 == arg_328_0.sceneInfo then
		table.insert(var_328_0, function(arg_331_0)
			local var_331_0, var_331_1 = unpack(string.split(arg_328_0.sceneInfo, "|"))

			arg_328_0:ResetSceneStructure(SceneManager.GetSceneByName(var_331_0 .. "_base"))
			arg_328_0:RefreshSlots()

			arg_328_0.ladyActiveZone = arg_328_0.walkBornPoint or arg_328_0.ladyBaseZone

			arg_328_0:ChangeCharacterPosition()
			arg_328_0:ChangePlayerPosition(arg_328_0.ladyActiveZone)
			arg_328_0:TriggerLadyDistance()
			arg_328_0:CheckInSector()
			arg_331_0()
		end)
	else
		var_328_1 = true

		local var_328_3, var_328_4 = unpack(string.split(arg_328_1, "|"))
		local var_328_5 = var_328_3 .. "_base"

		table.insert(var_328_0, function(arg_332_0)
			SceneOpMgr.Inst:LoadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_328_4 .. "/" .. var_328_5 .. "_scene"), var_328_5, LoadSceneMode.Additive, arg_332_0)
		end)
		table.insert(var_328_0, function(arg_333_0)
			arg_328_0:ResetSceneStructure(SceneManager.GetSceneByName(var_328_5))

			arg_328_0.ladyActiveZone = arg_328_0.walkBornPoint or "Default"

			arg_328_0:SwitchAnim(var_0_0.ANIM.IDLE)
			onNextTick(function()
				arg_328_0:ChangeCharacterPosition()
				arg_328_0:ChangePlayerPosition(arg_328_0.ladyActiveZone)
				arg_328_0:TriggerLadyDistance()
				arg_328_0:CheckInSector()
				arg_333_0()
			end)
		end)
	end

	if arg_328_0.subSceneInfo == arg_328_0.sceneInfo then
		table.insert(var_328_0, function(arg_335_0)
			local var_335_0 = Clone(arg_328_0.room)

			var_335_0.furnitures = {}

			arg_328_0:RefreshSlots(var_335_0)
			arg_335_0()
		end)
	else
		local var_328_6, var_328_7 = unpack(string.split(arg_328_0.subSceneInfo, "|"))
		local var_328_8 = var_328_6 .. "_base"

		table.insert(var_328_0, function(arg_336_0)
			SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_328_7 .. "/" .. var_328_8 .. "_scene"), var_328_8, arg_336_0)
		end)
	end

	table.insert(var_328_0, function(arg_337_0)
		arg_337_0()

		if var_328_1 then
			var_328_2()
		end
	end)
	seriesAsync(var_328_0, arg_328_2)
end

function var_0_0.TransformMesh(arg_338_0)
	local var_338_0 = arg_338_0.sharedMesh
	local var_338_1 = {}
	local var_338_2 = arg_338_0.transform:TransformPoint(var_338_0.vertices[0])
	local var_338_3 = arg_338_0.transform:TransformPoint(var_338_0.vertices[1])
	local var_338_4 = arg_338_0.transform:TransformPoint(var_338_0.vertices[2])

	var_338_1.horizontal = var_338_3 - var_338_2
	var_338_1.verticle = var_338_4 - var_338_2
	var_338_1.origin = var_338_2

	return var_338_1
end

function var_0_0.GetRatio(arg_339_0, arg_339_1)
	local var_339_0 = Vector2.zero

	var_339_0.x = Vector3.Dot(arg_339_0.horizontal, arg_339_1) / arg_339_0.horizontal.sqrMagnitude
	var_339_0.y = Vector3.Dot(arg_339_0.verticle, arg_339_1) / arg_339_0.verticle.sqrMagnitude

	return var_339_0
end

function var_0_0.GetPostionByRatio(arg_340_0, arg_340_1)
	return arg_340_0.horizontal * arg_340_1.x + arg_340_0.verticle * arg_340_1.y + arg_340_0.origin
end

function var_0_0.IsPointInSector(arg_341_0, arg_341_1)
	local var_341_0 = arg_341_1 - Vector3.New(unpack(arg_341_0.Position))

	if var_341_0.magnitude > arg_341_0.Radius then
		return false
	end

	local var_341_1 = Quaternion.Euler(unpack(arg_341_0.Rotation))

	return Vector3.Angle(var_341_1 * Vector3.forward, var_341_0) <= arg_341_0.Angle / 2
end

function var_0_0.willExit(arg_342_0)
	arg_342_0.joystickTimer:Stop()
	arg_342_0.moveStickTimer:Stop()
	UpdateBeat:RemoveListener(arg_342_0.updateHandler)
	arg_342_0:StopIKHandTimer()

	if arg_342_0.moveTimer then
		arg_342_0.moveTimer:Stop()

		arg_342_0.moveTimer = nil
	end

	if arg_342_0.moveWaitTimer then
		arg_342_0.moveWaitTimer:Stop()

		arg_342_0.moveWaitTimer = nil
	end

	GlobalClickEventMgr.Inst:RemoveBeginPinchFunc()
	GlobalClickEventMgr.Inst:RemovePinchFunc()
	GlobalClickEventMgr.Inst:RemoveEndPinchFunc()

	if not IsNil(arg_342_0.furnitures) then
		eachChild(arg_342_0.furnitures, function(arg_343_0)
			local var_343_0 = GetComponent(arg_343_0, typeof(EventTriggerListener))

			if not var_343_0 then
				return
			end

			var_343_0:ClearEvents()
		end)
	end

	for iter_342_0, iter_342_1 in pairs(arg_342_0.ladyDict) do
		arg_342_0:ResetActiveIKs(iter_342_1)
		GetComponent(iter_342_1.lady, typeof(EventTriggerListener)):ClearEvents()
	end

	arg_342_0.camBrainEvenetHandler.OnBlendStarted = nil
	arg_342_0.camBrainEvenetHandler.OnBlendFinished = nil

	pg.UIMgr.GetInstance():UnOverlayPanel(arg_342_0.blockLayer, arg_342_0._tf)
	table.Foreach(arg_342_0.expressionDict, function(arg_344_0)
		arg_342_0:RemoveExpression(arg_344_0)
	end)
	arg_342_0.loader:Clear()
	pg.ClickEffectMgr:GetInstance():SetClickEffect("NORMAL")
	pg.NodeCanvasMgr.GetInstance():Clear()

	local var_342_0 = {}

	if arg_342_0.timelineScene and not arg_342_0.cacheSceneDic[arg_342_0.timelineScene] then
		local var_342_1 = arg_342_0.timelineScene

		arg_342_0.timelineScene = nil

		local var_342_2 = getProxy(ApartmentProxy):getApartment(arg_342_0.sceneGroupDic[var_342_1]):getConfig("asset_name")

		table.insert(var_342_0, function(arg_345_0)
			SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/character/scenes/" .. var_342_2 .. "/timeline/" .. var_342_1 .. "/" .. var_342_1 .. "_scene"), var_342_1, arg_345_0)
		end)
	end

	for iter_342_2, iter_342_3 in pairs(arg_342_0.cacheSceneDic) do
		if iter_342_3 then
			local var_342_3 = getProxy(ApartmentProxy):getApartment(arg_342_0.sceneGroupDic[iter_342_2]):getConfig("asset_name")

			table.insert(var_342_0, function(arg_346_0)
				SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/character/scenes/" .. var_342_3 .. "/timeline/" .. iter_342_2 .. "/" .. iter_342_2 .. "_scene"), iter_342_2, arg_346_0)
			end)
		end
	end

	for iter_342_4, iter_342_5 in ipairs({
		arg_342_0.sceneInfo,
		arg_342_0.subSceneInfo ~= arg_342_0.sceneInfo and arg_342_0.subSceneInfo or nil
	}) do
		local var_342_4, var_342_5 = unpack(string.split(iter_342_5, "|"))
		local var_342_6 = var_342_4 .. "_base"

		table.insert(var_342_0, function(arg_347_0)
			SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_342_5 .. "/" .. var_342_6 .. "_scene"), var_342_6, arg_347_0)
		end)
	end

	for iter_342_6, iter_342_7 in ipairs({
		arg_342_0.sceneInfo,
		arg_342_0.artSceneInfo ~= arg_342_0.sceneInfo and arg_342_0.artSceneInfo or nil
	}) do
		local var_342_7, var_342_8 = unpack(string.split(iter_342_7, "|"))

		table.insert(var_342_0, function(arg_348_0)
			SceneOpMgr.Inst:UnloadSceneAsync(string.lower("dorm3d/scenesres/scenes/" .. var_342_8 .. "/" .. var_342_7 .. "_scene"), var_342_7, arg_348_0)
		end)
	end

	seriesAsync(var_342_0, function()
		ReflectionHelp.RefSetProperty(typeof("UnityEngine.LightmapSettings"), "lightmaps", nil, nil)
	end)
end

function var_0_0.InitDefautQuality()
	if PlayerPrefs.GetInt("dorm3d_graphics_settings", 0) == 0 then
		local var_350_0 = DevicePerformanceUtil.GetDevicePerformanceLevel()

		if PLATFORM == PLATFORM_IPHONEPLAYER then
			local var_350_1 = SystemInfo.deviceModel or ""

			local function var_350_2(arg_351_0)
				local var_351_0 = string.match(arg_351_0, "iPad(%d+)")
				local var_351_1 = tonumber(var_351_0)

				if var_351_1 and var_351_1 >= 8 then
					return true
				end

				return false
			end

			local function var_350_3(arg_352_0)
				local var_352_0 = string.match(arg_352_0, "iPhone(%d+)")
				local var_352_1 = tonumber(var_352_0)

				if var_352_1 and var_352_1 >= 13 then
					return true
				end

				return false
			end

			if var_350_2(var_350_1) or var_350_3(var_350_1) then
				var_350_0 = DevicePerformanceLevel.High
			end
		end

		local var_350_4 = var_350_0 == DevicePerformanceLevel.High and 3 or var_350_0 == DevicePerformanceLevel.Mid and 2 or 1

		PlayerPrefs.SetInt("dorm3d_graphics_settings", var_350_4)

		Dorm3dRoomTemplateScene.FirstDefaultSetting = var_350_4
	end
end

function var_0_0.SettingQuality()
	local var_353_0 = GraphicSettingConst.HandleCustomSetting()

	BLHX.Rendering.EngineCore.SetOverrideQualitySettings(var_353_0)
end

function var_0_0.SetMagicaCollider(arg_354_0, arg_354_1, arg_354_2)
	local var_354_0 = typeof("MagicaCloth.MagicaCapsuleCollider")

	ReflectionHelp.RefSetProperty(var_354_0, "StartRadius", arg_354_0, arg_354_1)
	ReflectionHelp.RefSetProperty(var_354_0, "EndRadius", arg_354_0, arg_354_2)
end

return var_0_0
