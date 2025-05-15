local var_0_0 = class("IslandCharacterSystem", import("Mod.Island.Core.View.SceneObject.IslandSystem"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, arg_1_2)

	arg_1_0.scheduleList = {}
	arg_1_0.workerCnt = arg_1_0.data:GetWorkerCnt()
end

function var_0_0.OnStart(arg_2_0)
	if arg_2_0.behaviourTreeOwner then
		LuaHelper.NodeCanvasSetIntVariableValue(arg_2_0.behaviourTreeOwner, "worker", arg_2_0.workerCnt)
	end
end

function var_0_0.StartDelegation(arg_3_0, arg_3_1)
	if not arg_3_0.behaviourTreeOwner then
		return
	end

	table.insert(arg_3_0.scheduleList, arg_3_1)
end

function var_0_0.ExecuteDelegation(arg_4_0, arg_4_1)
	arg_4_0.workerCnt = arg_4_0.workerCnt + 1

	local var_4_0 = arg_4_0:GetView():GetSystemUnitModule(arg_4_1.ship_id)
	local var_4_1 = arg_4_0.data:GetObjId(arg_4_1.area_id)
	local var_4_2 = arg_4_0:GetView():GetUnitModule(var_4_1)

	if var_4_0 and var_4_0:IsLoaded() and var_4_2 and var_4_2:IsLoaded() and arg_4_0:IsLoaded() then
		local var_4_3 = System.Collections.Generic.List_int()

		var_4_3:Add(arg_4_1.ship_id)
		var_4_3:Add(var_4_1)
		var_4_3:Add(arg_4_0.id)
		arg_4_0.behaviourTreeOwner:SendEvent("system_unit_add", var_4_3, nil)
	end
end

function var_0_0.EndDelegation(arg_5_0, arg_5_1)
	if not arg_5_0.behaviourTreeOwner then
		return
	end

	arg_5_0.workerCnt = arg_5_0.workerCnt - 1

	LuaHelper.NodeCanvasSetIntVariableValue(arg_5_0.behaviourTreeOwner, "worker", arg_5_0.workerCnt)
end

function var_0_0.OnUpdate(arg_6_0)
	if #arg_6_0.scheduleList <= 0 then
		return
	end

	if not arg_6_0:GetView():IsLoaded() then
		return
	end

	local var_6_0 = table.remove(arg_6_0.scheduleList, 1)

	arg_6_0:ExecuteDelegation(var_6_0)
end

function var_0_0.OnDestroy(arg_7_0)
	table.clear(arg_7_0.scheduleList)
end

return var_0_0
