local var_0_0 = class("IslandNavigableUnit", import(".IslandSceneUnit"))

function var_0_0.Init(arg_1_0, arg_1_1)
	var_0_0.super.Init(arg_1_0, arg_1_1)

	arg_1_0.agent = GetOrAddComponent(arg_1_1, typeof(UnityEngine.AI.NavMeshAgent))
	arg_1_0.agent.updatePosition = false
	arg_1_0.agent.updateRotation = false

	arg_1_0:SetNavAgentStopDistance(2)
end

function var_0_0.SetNavAgentStopDistance(arg_2_0, arg_2_1)
	arg_2_0.agent.stoppingDistance = arg_2_1
end

function var_0_0.SetNavAgentDestination(arg_3_0, arg_3_1)
	arg_3_0.agent.isStopped = false
	arg_3_0.agent.destination = arg_3_1
end

function var_0_0.SetNavPosition(arg_4_0, arg_4_1)
	arg_4_0.agent.nextPosition = arg_4_1
end

function var_0_0.CalculateNavPath(arg_5_0, arg_5_1)
	local var_5_0 = UnityEngine.AI.NavMeshPath.New()

	arg_5_0.agent:CalculatePath(arg_5_1, var_5_0)

	return (var_5_0.corners:ToTable())
end

function var_0_0.SetNavAgentSpeed(arg_6_0, arg_6_1)
	arg_6_0.agent.speed = arg_6_1
end

function var_0_0.GetNavAgentSpeed(arg_7_0, arg_7_1)
	return arg_7_0.agent.speed
end

function var_0_0.SetNavAgentVelocity(arg_8_0, arg_8_1)
	arg_8_0.agent.velocity = arg_8_1
end

function var_0_0.GetNavAgentVelocity(arg_9_0)
	return arg_9_0.agent.desiredVelocity * arg_9_0.agent.speed
end

function var_0_0.GetDesiredVelocity(arg_10_0)
	return arg_10_0.agent.desiredVelocity
end

function var_0_0.StopNavAgent(arg_11_0)
	arg_11_0.agent.isStopped = true
end

return var_0_0
