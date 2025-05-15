local var_0_0 = class("IslandNpcUnit", import(".IslandNavigableUnit"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0._tf = arg_1_0._go.transform
	arg_1_0.degreeSpeedDamping = 10
	arg_1_0.targetSpeed = 0
	arg_1_0.speed = 0
	arg_1_0.speedDamping = 1
	arg_1_0.walkingMaxSpeed = 1.5
	arg_1_0.runMaxSpeed = 5
	arg_1_0.targetPosition = Vector3.zero
	arg_1_0.velocity = Vector3.zero
	arg_1_0.extraVelocity = Vector3.zero
	arg_1_0.animator = arg_1_0._go:GetComponent(typeof(Animator))
	arg_1_0.characterController = arg_1_0._go:GetComponent(typeof(UnityEngine.CharacterController))
end

function var_0_0.SetDestination(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0:SetNavAgentDestination(arg_2_1)

	arg_2_0.targetSpeed = Mathf.Clamp(arg_2_2 or 0, arg_2_0.walkingMaxSpeed, arg_2_0.runMaxSpeed)
	arg_2_0.targetPosition = arg_2_1
end

function var_0_0.StopMove(arg_3_0)
	arg_3_0:StopNavAgent()

	arg_3_0.targetSpeed = 0
	arg_3_0.targetPosition = Vector3.zero

	arg_3_0.animator:SetFloat(IslandConst.SPEED_FLAG_HASH, 0)
end

function var_0_0.OnUpdate(arg_4_0)
	arg_4_0.speed = Mathf.Lerp(arg_4_0.speed, arg_4_0.targetSpeed, arg_4_0.speedDamping)

	arg_4_0:SetNavAgentSpeed(arg_4_0.speed * 0.5)
	arg_4_0:Move()
	arg_4_0.animator:SetFloat(IslandConst.SPEED_FLAG_HASH, arg_4_0.speed)

	arg_4_0.velocity = arg_4_0:GetNavAgentVelocity()
end

function var_0_0.Move(arg_5_0)
	local var_5_0 = arg_5_0:GetDesiredVelocity() + arg_5_0.extraVelocity

	if var_5_0.magnitude <= 0 or var_5_0.normalized == Vector3.zero then
		return
	end

	local var_5_1 = Quaternion.LookRotation(var_5_0.normalized)

	arg_5_0._tf.rotation = Quaternion.Slerp(arg_5_0._tf.rotation, var_5_1, Time.deltaTime * arg_5_0.degreeSpeedDamping)

	local var_5_2 = Vector3.up * IslandConst.GRAVITY

	if Physics.CheckSphere(arg_5_0._tf.position + Vector3.up * (arg_5_0.characterController.radius - arg_5_0.characterController.skinWidth), arg_5_0.characterController.radius, LayerMask.GetMask("Ground")) then
		var_5_2 = Vector3.zero
	end

	arg_5_0.characterController:Move(var_5_0.normalized * arg_5_0:GetNavAgentSpeed() * Time.deltaTime + var_5_2 * Time.deltaTime)
	arg_5_0:SetNavAgentVelocity(arg_5_0.characterController.velocity)
end

function var_0_0.OnDispose(arg_6_0)
	return
end

return var_0_0
