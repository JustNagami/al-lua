local var_0_0 = class("IslandCalcUtil")

function var_0_0.SignedAngle(arg_1_0, arg_1_1)
	local var_1_0 = Vector2.Angle(arg_1_0, arg_1_1)
	local var_1_1 = arg_1_0.x * arg_1_1.y - arg_1_0.y * arg_1_1.x
	local var_1_2 = var_1_0 * math.sign(var_1_1)

	if var_1_2 == -0 then
		var_1_2 = 180
	end

	return var_1_2
end

function var_0_0.WorldPosition2LocalPosition(arg_2_0, arg_2_1)
	local var_2_0 = pg.UIMgr.GetInstance().overlayCameraComp
	local var_2_1 = IslandCameraMgr.instance._mainCamera:WorldToViewportPoint(arg_2_1)
	local var_2_2 = var_2_0:ViewportToScreenPoint(var_2_1)
	local var_2_3 = arg_2_0:GetComponent("RectTransform")

	return (LuaHelper.ScreenToLocal(var_2_3, var_2_2, var_2_0))
end

function var_0_0.IsInViewport(arg_3_0)
	local var_3_0 = IslandCameraMgr.instance._mainCamera:WorldToViewportPoint(arg_3_0)

	if var_3_0.x > 0 and var_3_0.x < 1 and var_3_0.y > 0 and var_3_0.y < 1 and var_3_0.z > 0 then
		return true
	end

	return false
end

function var_0_0.GetNavPath(arg_4_0, arg_4_1)
	local var_4_0 = GetOrAddComponent(arg_4_0, typeof(UnityEngine.AI.NavMeshAgent))

	var_4_0.nextPosition = arg_4_0.transform.position

	local var_4_1 = UnityEngine.AI.NavMeshPath.New()

	var_4_0:CalculatePath(arg_4_1, var_4_1)

	return (var_4_1.corners:ToTable())
end

function var_0_0.GetRandomPointOnCircle(arg_5_0, arg_5_1)
	local var_5_0 = UnityEngine.Random.insideUnitCircle.normalized
	local var_5_1 = arg_5_0 + Vector3(var_5_0.x, 0, var_5_0.y) * arg_5_1

	print(var_5_1)

	return var_5_1
end

return var_0_0
