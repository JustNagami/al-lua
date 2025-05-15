local var_0_0 = require("Framework.toLua.UnityEngine.Vector3")
local var_0_1 = require("Framework.toLua.UnityEngine.Vector2")
local var_0_2 = var_0_0.zero
local var_0_3 = class("IslandPlayerUnit", import(".IslandNavigableUnit"))
local var_0_4 = 5
local var_0_5 = 150
local var_0_6 = var_0_1(1.8, 1.8)
local var_0_7 = var_0_1(0, 2)

function var_0_3.OnInit(arg_1_0)
	arg_1_0.jumpCurve = LoadAny("island/jumpcurve/jumpcurve", "", typeof(JumpCurve)).curve
	arg_1_0.jumpCruveAllTime = arg_1_0.jumpCurve.keys[arg_1_0.jumpCurve.length - 1].time
	arg_1_0.mapId = getProxy(IslandProxy):GetIsland():GetMapId()
	arg_1_0._tf = arg_1_0._go.transform
	arg_1_0.animator = arg_1_0._tf:GetChild(0):GetComponent(typeof(Animator))
	arg_1_0.characterController = arg_1_0._go:GetComponent(typeof(CharacterController))
	arg_1_0.characterHandleController = arg_1_0._go:GetComponent(typeof(CharacterHandleController))

	local var_1_0 = pg.island_set.detection_parameters.key_value_varchar

	var_0_4 = var_1_0[2]
	var_0_5 = var_1_0[1]
	var_0_7 = var_0_1(0, var_1_0[3])

	arg_1_0.characterHandleController:SetDrawParameter(var_0_4, var_0_5, var_1_0[3])
	arg_1_0.characterHandleController:AddStateEnterFunc(function(arg_2_0)
		arg_1_0:StateEnterHandle(arg_2_0)
	end)
	arg_1_0.characterHandleController:AddStateExitFunc(function(arg_3_0)
		arg_1_0:StateExitHandle(arg_3_0)
	end)

	arg_1_0.targetSpeed = 0
	arg_1_0.speed = 0
	arg_1_0.targetRotation = Quaternion.identity
	arg_1_0.gravitySpeed = 0
	arg_1_0.jumpVector = Vector3.zero

	local var_1_1 = pg.island_set.player_movement_parameters.key_value_varchar

	arg_1_0.degreeSpeed = 720
	arg_1_0.maxSpeed = var_1_1[1]
	arg_1_0.sprintSpeed = var_1_1[2]
	arg_1_0.upSpeedDamping = 3
	arg_1_0.downSpeedDamping = 6
	arg_1_0.jumpHeight = var_1_1[3]
	arg_1_0.targetDir = Vector3.zero
	arg_1_0.velocity = Vector3.zero
	arg_1_0.extraVelocity = Vector3.zero
	arg_1_0.isSitting = false
	arg_1_0.prevStandPosition = nil
	arg_1_0.checkInSet = {}
	arg_1_0.orginTargetDir = var_0_2
	arg_1_0.pageDressDic = {}

	arg_1_0:InitMapCheckWorldObject()
end

function var_0_3.OnLateUpdate(arg_4_0)
	if arg_4_0.jumpTrigger then
		arg_4_0.animator:ResetTrigger(IslandConst.JUMP_FLAG)
	end

	if arg_4_0.runTrigger then
		arg_4_0.animator:ResetTrigger(IslandConst.RUN_FLAG)
	end
end

function var_0_3.OnUpdate(arg_5_0)
	arg_5_0:RefreshTemp()

	local var_5_0 = Time.deltaTime

	arg_5_0:PositionTween(var_5_0)
	arg_5_0:Rotation(var_5_0)
	arg_5_0:Move(var_5_0)
	arg_5_0:Detectionobject()
	arg_5_0:Handle()
end

function var_0_3.RefreshTemp(arg_6_0)
	arg_6_0.ignoreStepdown = false
	arg_6_0.gravityAcc = IslandConst.GRAVITYACC

	if arg_6_0.orginTargetDir.x ~= 0 or arg_6_0.orginTargetDir.z ~= 0 then
		local var_6_0 = IslandCameraMgr.instance._mainCamera.transform:TransformVector(arg_6_0.orginTargetDir)

		arg_6_0.targetDir = var_0_0(var_6_0.x, 0, var_6_0.z).normalized
		arg_6_0.targetRotation = Quaternion.LookRotation(arg_6_0.targetDir)
	end
end

function var_0_3.Rotation(arg_7_0, arg_7_1)
	local var_7_0 = Quaternion.RotateTowards(arg_7_0._tf.rotation, arg_7_0.targetRotation, arg_7_0.degreeSpeed * arg_7_1)

	arg_7_0._tf.rotation = var_7_0
end

function var_0_3.Move(arg_8_0, arg_8_1)
	if Mathf.Approximately(arg_8_0.speed, arg_8_0.targetSpeed) then
		arg_8_0.speed = arg_8_0.targetSpeed
	elseif arg_8_0.targetSpeed > arg_8_0.speed then
		arg_8_0.speed = Mathf.Lerp(arg_8_0.speed, arg_8_0.targetSpeed, arg_8_0.upSpeedDamping * arg_8_1)
	else
		arg_8_0.speed = Mathf.Lerp(arg_8_0.speed, arg_8_0.targetSpeed, arg_8_0.downSpeedDamping * arg_8_1)
	end

	arg_8_0.animator:SetFloat(IslandConst.SPEED_FLAG_HASH, arg_8_0.speed)

	arg_8_0.velocity = arg_8_0.targetDir * arg_8_0.speed

	local var_8_0 = arg_8_0.gravityAcc * arg_8_1

	arg_8_0.gravitySpeed = arg_8_0.gravitySpeed + var_8_0
	arg_8_0.onGroud = true

	local var_8_1 = 0

	if arg_8_0.gravitySpeed >= 0 then
		local var_8_2, var_8_3 = arg_8_0:CalcGrounded()

		if var_8_2 then
			arg_8_0.gravitySpeed = 0
			var_8_1 = var_8_3
		else
			local var_8_4, var_8_5 = arg_8_0:CalcNotFalling()

			if var_8_4 then
				arg_8_0.gravitySpeed = 0
				var_8_1 = var_8_5
			else
				arg_8_0.onGroud = false
			end
		end
	else
		arg_8_0.onGroud = false
	end

	arg_8_0.animator:SetBool(IslandConst.GROUD_FLAG, arg_8_0.onGroud)

	local var_8_6 = Vector3(0, IslandConst.GRAVITYDIR.y * var_8_1, 0)

	if arg_8_0.ignoreStepdown then
		var_8_6 = var_0_2
	end

	local var_8_7 = arg_8_0.jumpVector + var_8_6
	local var_8_8 = Vector3(0, IslandConst.GRAVITYDIR.y * arg_8_0.gravitySpeed, 0)

	arg_8_0.characterController:Move((arg_8_0.velocity + var_8_8) * Time.deltaTime + var_8_7 + arg_8_0.extraVelocity * Time.deltaTime)
end

function var_0_3.PositionTween(arg_9_0, arg_9_1)
	if arg_9_0._positionTweenCom ~= nil then
		arg_9_0._positionTweenCom.elapse = arg_9_0._positionTweenCom.elapse + arg_9_1

		local var_9_0 = arg_9_0.jumpCurve:Evaluate(arg_9_0._positionTweenCom.elapse)
		local var_9_1 = var_9_0 - arg_9_0._positionTweenCom.oldPosition

		arg_9_0._positionTweenCom.oldPosition = var_9_0

		local var_9_2 = UnityEngine.Matrix4x4.TRS(arg_9_0._tf.position, arg_9_0._tf.rotation, Vector3.one):MultiplyVector(var_0_0.New(0, var_9_1, 0))

		arg_9_0.gravityAcc = 0
		arg_9_0.ignoreStepdown = true

		if arg_9_0._positionTweenCom.elapse >= arg_9_0._positionTweenCom.duration - 0.001 then
			arg_9_0._positionTweenCom = nil
			arg_9_0.gravitySpeed = Vector3.Dot(Vector3(0, -1, 0), var_9_2) / arg_9_1
			arg_9_0.jumpVector = var_0_2
		else
			arg_9_0.jumpVector = var_9_2
			arg_9_0.gravitySpeed = 0
		end
	end
end

function var_0_3.CalcGrounded(arg_10_0)
	local var_10_0, var_10_1 = Physics.SphereCast(arg_10_0._tf.position + arg_10_0.characterController.center, arg_10_0.characterController.radius, Vector3.down, nil, 2 * arg_10_0.characterController.skinWidth + (0.5 * arg_10_0.characterController.height - arg_10_0.characterController.radius))

	if var_10_0 then
		local var_10_2 = arg_10_0._tf.position.y + arg_10_0.characterController.skinWidth - var_10_1.point.y

		return true, var_10_2
	end

	return false
end

function var_0_3.CalcNotFalling(arg_11_0)
	local var_11_0, var_11_1 = Physics.SphereCast(arg_11_0._tf.position + arg_11_0.characterController.center, arg_11_0.characterController.radius, Vector3.down, nil, 0.3 + 2 * arg_11_0.characterController.skinWidth + (0.5 * arg_11_0.characterController.height - arg_11_0.characterController.radius))

	if var_11_0 then
		local var_11_2 = arg_11_0._tf.position.y + arg_11_0.characterController.skinWidth - var_11_1.point.y

		return true, var_11_2
	end

	return false
end

function var_0_3.Sit(arg_12_0, arg_12_1, arg_12_2)
	arg_12_0.characterController.enabled = false
	arg_12_0.prevStandPosition = arg_12_0._tf.position
	arg_12_0._tf.position = arg_12_1

	local var_12_0 = arg_12_0._tf:Find("all/foot_l_d_mount")
	local var_12_1 = Quaternion.LookRotation(arg_12_2, Vector3.New(0, 1, 0))

	arg_12_0._tf.rotation = var_12_1

	arg_12_0.animator:SetBool(IslandConst.SIT_HASH, true)

	arg_12_0.isSitting = true
end

function var_0_3.MoveHandle(arg_13_0, arg_13_1, arg_13_2)
	if arg_13_0.isSitting and arg_13_0.prevStandPosition then
		arg_13_0.characterController.enabled = true
		arg_13_0._tf.position = arg_13_0.prevStandPosition

		arg_13_0.animator:SetBool(IslandConst.SIT_HASH, false)

		arg_13_0.isSitting = false

		return
	end

	arg_13_0.orginTargetDir = arg_13_1
	arg_13_0.lastTargetSpeed = arg_13_2 * arg_13_0.maxSpeed
	arg_13_0.targetSpeed = arg_13_0.isSprint and arg_13_0.sprintSpeed or arg_13_0.lastTargetSpeed
end

function var_0_3.StopMoveHandle(arg_14_0)
	arg_14_0.targetSpeed = 0
	arg_14_0.orginTargetDir = var_0_2
	arg_14_0.isSprint = false
end

function var_0_3.JumpHandle(arg_15_0)
	arg_15_0.jumpTrigger = true

	arg_15_0.animator:SetTrigger(IslandConst.JUMP_FLAG)
end

function var_0_3.OnPlayerPlayerSprint(arg_16_0)
	if arg_16_0.targetSpeed ~= 0 then
		arg_16_0.isSprint = true
		arg_16_0.lastTargetSpeed = arg_16_0.targetSpeed
		arg_16_0.targetSpeed = arg_16_0.sprintSpeed
		arg_16_0.speed = arg_16_0.targetSpeed
	end
end

function var_0_3.OnStopPlayerSprint(arg_17_0)
	if arg_17_0.isSprint and arg_17_0.targetSpeed ~= 0 then
		arg_17_0.targetSpeed = arg_17_0.lastTargetSpeed
		arg_17_0.speed = arg_17_0.lastTargetSpeed
		arg_17_0.isSprint = false
	end
end

function var_0_3.StateEnterHandle(arg_18_0, arg_18_1)
	if arg_18_1.shortNameHash == IslandConst.jumpState then
		arg_18_0:OnEnterJumpState()
	end
end

function var_0_3.StateExitHandle(arg_19_0, arg_19_1)
	return
end

function var_0_3.OnEnterJumpState(arg_20_0)
	arg_20_0._positionTweenCom = {
		elapse = 0,
		oldPosition = 0,
		duration = arg_20_0.jumpCruveAllTime
	}
end

local var_0_8 = var_0_1(0, 0)
local var_0_9 = LayerMask.GetMask("IslandDetection")

function var_0_3.Detectionobject(arg_21_0)
	if arg_21_0.mapId ~= 1001 then
		return
	end

	local var_21_0 = Physics.OverlapSphere(arg_21_0._tf.position, var_0_4, var_0_9)
	local var_21_1 = {}

	table.IpairsCArray(var_21_0, function(arg_22_0, arg_22_1)
		table.insert(var_21_1, arg_22_1)
	end)

	local function var_21_2(arg_23_0, arg_23_1, arg_23_2)
		return (arg_23_2.x - arg_23_0.x) * (arg_23_1.y - arg_23_0.y) - (arg_23_2.y - arg_23_0.y) * (arg_23_1.x - arg_23_0.x)
	end

	local function var_21_3(arg_24_0, arg_24_1, arg_24_2)
		return Mathf.Min(arg_24_0.x, arg_24_1.x) <= arg_24_2.x and arg_24_2.x <= Mathf.Max(arg_24_0.x, arg_24_1.x) and Mathf.Min(arg_24_0.y, arg_24_1.y) <= arg_24_2.y and arg_24_2.y <= Mathf.Max(arg_24_0.y, arg_24_1.y)
	end

	local function var_21_4(arg_25_0, arg_25_1)
		local var_25_0 = #arg_25_1

		for iter_25_0 = 0, var_25_0 do
			local var_25_1 = arg_25_1[iter_25_0]
			local var_25_2 = arg_25_1[(iter_25_0 + 1) % var_25_0] - var_25_1
			local var_25_3 = arg_25_0 - var_25_1

			if var_0_1.Dot(var_25_2.normalized, var_25_3) > 0 then
				return false
			end
		end

		return true
	end

	local function var_21_5(arg_26_0, arg_26_1, arg_26_2, arg_26_3)
		local var_26_0 = var_21_2(arg_26_2, arg_26_3, arg_26_0)
		local var_26_1 = var_21_2(arg_26_2, arg_26_3, arg_26_1)
		local var_26_2 = var_21_2(arg_26_0, arg_26_1, arg_26_2)
		local var_26_3 = var_21_2(arg_26_0, arg_26_1, arg_26_3)

		if (var_26_0 > 0 and var_26_1 < 0 or var_26_0 < 0 and var_26_1 > 0) and (var_26_2 > 0 and var_26_3 < 0 or var_26_2 < 0 and var_26_3 > 0) then
			return true
		end

		if var_26_0 == 0 and var_21_3(arg_26_2, arg_26_3, arg_26_0) then
			return true
		end

		if var_26_1 == 0 and var_21_3(arg_26_2, arg_26_3, arg_26_1) then
			return true
		end

		if var_26_2 == 0 and var_21_3(arg_26_0, arg_26_1, arg_26_2) then
			return true
		end

		if var_26_3 == 0 and var_21_3(arg_26_0, arg_26_1, arg_26_3) then
			return true
		end

		return false
	end

	local function var_21_6(arg_27_0, arg_27_1)
		local var_27_0 = {}
		local var_27_1 = arg_27_1 * Mathf.Deg2Rad
		local var_27_2 = Mathf.Cos(var_27_1)
		local var_27_3 = Mathf.Sin(var_27_1)
		local var_27_4 = var_0_6 * 0.5

		var_27_0[0] = arg_27_0 + var_0_1(-var_27_4.x * var_27_2 - var_27_4.y * var_27_3, -var_27_4.x * var_27_3 + var_27_4.y * var_27_2)
		var_27_0[1] = arg_27_0 + var_0_1(var_27_4.x * var_27_2 - var_27_4.y * var_27_3, var_27_4.x * var_27_3 + var_27_4.y * var_27_2)
		var_27_0[2] = arg_27_0 + var_0_1(var_27_4.x * var_27_2 + var_27_4.y * var_27_3, var_27_4.x * var_27_3 - var_27_4.y * var_27_2)
		var_27_0[3] = arg_27_0 + var_0_1(-var_27_4.x * var_27_2 + var_27_4.y * var_27_3, -var_27_4.x * var_27_3 - var_27_4.y * var_27_2)

		return var_27_0
	end

	local function var_21_7(arg_28_0, arg_28_1, arg_28_2, arg_28_3)
		local var_28_0 = var_21_6(arg_28_0, arg_28_1)

		for iter_28_0 = 0, 3 do
			local var_28_1 = var_28_0[iter_28_0]
			local var_28_2 = var_28_0[(iter_28_0 + 1) % 4]

			if var_21_5(arg_28_2, arg_28_3, var_28_1, var_28_2) then
				return true
			end
		end

		if var_21_4(arg_28_2, var_28_0) or var_21_4(arg_28_3, var_28_0) then
			return true
		end

		return false
	end

	local function var_21_8(arg_29_0, arg_29_1, arg_29_2)
		local var_29_0 = arg_29_0 - arg_29_2
		local var_29_1 = var_0_1.Dot(var_29_0, arg_29_1)
		local var_29_2 = var_0_1.Dot(var_29_0, var_0_1(-arg_29_1.y, arg_29_1.x))
		local var_29_3 = var_0_1(var_29_1, var_29_2)
		local var_29_4 = var_0_6 * 0.5
		local var_29_5 = var_0_1.Max(var_29_3 - var_0_1.zero, var_0_1.zero - var_29_3)
		local var_29_6 = var_0_1.Max(var_29_5 - var_29_4, var_0_1.zero)
		local var_29_7 = var_0_1.Angle(var_29_6, var_0_1.right)
		local var_29_8 = (180 - var_0_5) / 2
		local var_29_9 = var_21_7(var_29_5, 0, var_0_1.zero, var_0_1(var_0_4 * Mathf.Cos(15 * Mathf.Deg2Rad), var_0_4 * Mathf.Sin(15 * Mathf.Deg2Rad)))

		return var_29_8 <= var_29_7 or var_29_9
	end

	local function var_21_9(arg_30_0)
		if var_0_0.Dot(arg_30_0.transform.position - arg_21_0._tf.position, arg_21_0._tf.forward) < 0 then
			return
		end

		local var_30_0 = arg_21_0:Vector3ToVector2(arg_30_0.transform.position)
		local var_30_1 = arg_21_0:Vector3ToVector2(arg_21_0._tf.position) + var_0_8

		return var_21_8(var_30_0, arg_21_0:Vector3ToVector2(arg_21_0._tf.right), var_30_1)
	end

	local var_21_10 = {}

	for iter_21_0, iter_21_1 in ipairs(var_21_1) do
		if var_21_9(iter_21_1) then
			table.insert(var_21_10, iter_21_1)
		end
	end

	local var_21_11 = #var_21_10
	local var_21_12 = false

	if var_21_11 ~= 0 then
		local var_21_13
		local var_21_14 = arg_21_0:Vector3ToVector2(arg_21_0._tf.position) + var_0_8 + arg_21_0:Vector3ToVector2(arg_21_0._tf.forward) * 2
		local var_21_15 = 10
		local var_21_16 = {}

		for iter_21_2, iter_21_3 in ipairs(var_21_10) do
			local var_21_17 = (arg_21_0:Vector3ToVector2(iter_21_3.transform.position) - var_21_14):Magnitude()

			if var_21_17 < var_21_15 then
				var_21_15 = var_21_17
				var_21_13 = iter_21_3
			end
		end

		local var_21_18 = var_21_13.transform.parent

		if var_21_18 then
			local var_21_19 = var_21_18:GetComponent(typeof(WorldObjectItem)):GetItemId()

			if var_21_19 ~= arg_21_0.nearId then
				arg_21_0.nearId = var_21_19
				arg_21_0.nearItem = var_21_18
				var_21_12 = true
			end
		end
	end

	if var_21_11 ~= arg_21_0.lastCount or var_21_12 then
		arg_21_0.lastCount = var_21_11

		if var_21_11 == 0 then
			arg_21_0.nearId = 0

			arg_21_0:Emit(ISLAND_EVT.APPROACH_UNIT, {
				displayTpye = "normal",
				type = -1,
				id = arg_21_0.id
			})
		else
			arg_21_0:Emit(ISLAND_EVT.APPROACH_UNIT, {
				displayTpye = "plant",
				type = -1,
				id = arg_21_0.id,
				targetNearId = arg_21_0.nearId
			})
		end
	end
end

function var_0_3.Vector3ToVector2(arg_31_0, arg_31_1)
	return var_0_1(arg_31_1.x, arg_31_1.z)
end

function var_0_3.GetNearItemId(arg_32_0)
	return arg_32_0.nearId
end

function var_0_3.CheckIsInDress(arg_33_0, arg_33_1)
	for iter_33_0, iter_33_1 in pairs(arg_33_0.pageDressDic) do
		if iter_33_1.currentItemId == arg_33_1 then
			return true
		end
	end

	return false
end

function var_0_3.ChangeDressOnType(arg_34_0, arg_34_1, arg_34_2)
	local var_34_0 = arg_34_0.pageDressDic[arg_34_1]
	local var_34_1 = var_34_0 and var_34_0.currentItemId or nil

	if var_34_1 == arg_34_2 then
		return
	end

	if var_34_1 ~= nil then
		if var_34_0.currentItemObj then
			Object.Destroy(var_34_0.currentItemObj)

			var_34_0.currentItemObj = nil
		end

		var_34_0.currentItemId = nil
	end

	if arg_34_2 == nil then
		return
	end

	local var_34_2 = pg.island_dress_template[arg_34_2]
	local var_34_3 = var_34_2.model

	ResourceMgr.Inst:getAssetAsync(var_34_3, "", typeof(GameObject), UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_35_0)
		if not arg_34_0:CheckIsInDress(arg_34_2) then
			return
		end

		local var_35_0 = Object.Instantiate(arg_35_0)
		local var_35_1 = arg_34_0._tf

		if var_34_2.attachmentPoint ~= "" then
			local var_35_2 = var_34_2.attachmentPoint

			local function var_35_3(arg_36_0)
				for iter_36_0 = 0, arg_36_0.childCount - 1 do
					local var_36_0 = arg_36_0:GetChild(iter_36_0)

					if var_36_0.name == var_35_2 then
						return var_36_0
					end

					local var_36_1 = var_35_3(var_36_0, var_35_2)

					if var_36_1 then
						return var_36_1
					end
				end

				return nil
			end

			var_35_1 = var_35_3(var_35_1)
		end

		if var_34_2.offset ~= "" then
			local var_35_4 = Vector3(var_34_2.offset[1], var_34_2.offset[2], var_34_2.offset[3])

			var_35_0.transform.position = var_35_4
		end

		setParent(var_35_0, var_35_1)

		local var_35_5 = arg_34_0.pageDressDic[arg_34_1] or {}

		var_35_5.currentItemObj = var_35_0
		arg_34_0.pageDressDic[arg_34_1] = var_35_5
	end), true, true)

	local var_34_4 = arg_34_0.pageDressDic[arg_34_1] or {}

	var_34_4.currentItemId = arg_34_2
	arg_34_0.pageDressDic[arg_34_1] = var_34_4
end

function var_0_3.OnChangeDress(arg_37_0, arg_37_1)
	for iter_37_0, iter_37_1 in pairs(arg_37_1) do
		arg_37_0:ChangeDressOnType(iter_37_0, iter_37_1.currentItemId)
	end
end

function var_0_3.InitMapCheckWorldObject(arg_38_0)
	arg_38_0.checkList = getProxy(IslandProxy):GetIsland():GetBuildingAgency():GetCurrentMapCheckWorldObjectList()
end

function var_0_3.Handle(arg_39_0)
	local var_39_0 = 1000
	local var_39_1

	for iter_39_0, iter_39_1 in ipairs(arg_39_0.checkList) do
		if iter_39_1:IsInitUnit() then
			local var_39_2 = iter_39_1:GetUnityWorldPos()
			local var_39_3 = Vector3.New(arg_39_0._tf.position.x - var_39_2[1], arg_39_0._tf.position.y - var_39_2[2], arg_39_0._tf.position.z - var_39_2[3]):Magnitude()

			if var_39_3 <= var_39_0 then
				var_39_1 = iter_39_1
				var_39_0 = var_39_3
			end
		else
			print(1)
		end
	end

	local var_39_4

	if var_39_0 <= 3 then
		var_39_4 = var_39_1
	end

	local var_39_5 = var_39_4 and var_39_4.configId or nil

	if arg_39_0.nearTestId ~= var_39_5 then
		arg_39_0.nearTestId = var_39_5

		if arg_39_0.nearTestId then
			arg_39_0:Emit(ISLAND_EVT.APPROACH_UNIT, {
				displayTpye = "collect",
				type = -1,
				nearItem = var_39_1
			})
		else
			arg_39_0:Emit(ISLAND_EVT.APPROACH_UNIT, {
				displayTpye = "normal",
				type = -1
			})
		end
	end
end

function var_0_3.GetCurrentPosition(arg_40_0)
	return arg_40_0._tf.position
end

function var_0_3.OnDispose(arg_41_0)
	arg_41_0.characterHandleController:AddStateEnterFunc(nil)
	arg_41_0.characterHandleController:AddStateExitFunc(nil)
end

return var_0_3
