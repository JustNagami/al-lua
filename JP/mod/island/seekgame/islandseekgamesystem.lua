local var_0_0 = class("IslandSeekGameSystem", import("Mod.Island.Core.View.SceneObject.IslandSystem"))
local var_0_1 = 10090002
local var_0_2 = 10090009

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, {
		name = "seekGameSystem",
		id = arg_1_2
	})
end

function var_0_0.GetBehaviourTree(arg_2_0)
	return "island/nodecanvas/seekgame/seekgame"
end

function var_0_0.OnSceneInitEnd(arg_3_0)
	for iter_3_0, iter_3_1 in ipairs(arg_3_0:GetView():GetUnitList()) do
		if iter_3_1.behaviourTreeOwner then
			LuaHelper.NodeCanvasSetIntVariableValue(iter_3_1.behaviourTreeOwner, "systemId", arg_3_0.id)
		end

		if iter_3_1.id == var_0_1 then
			iter_3_1:Start()
		end
	end

	if arg_3_0.behaviourTreeOwner then
		LuaHelper.NodeCanvasSetIntVariableValue(arg_3_0.behaviourTreeOwner, "mingshiId", var_0_1)
		LuaHelper.NodeCanvasSetIntVariableValue(arg_3_0.behaviourTreeOwner, "doorId", var_0_2)
		LuaHelper.NodeCanvasSetIntVariableValue(arg_3_0.behaviourTreeOwner, "step", 1)
	end

	arg_3_0:Start()
end

function var_0_0.StartGame(arg_4_0)
	for iter_4_0, iter_4_1 in ipairs(arg_4_0:GetView():GetUnitList()) do
		if iter_4_1.id ~= var_0_1 then
			iter_4_1:Start()
		end
	end
end

function var_0_0.StopGame(arg_5_0)
	if arg_5_0.behaviourTreeOwner then
		arg_5_0:StopBt()
	end

	local var_5_0 = arg_5_0:GetView():GetUnitList()

	for iter_5_0, iter_5_1 in ipairs(var_5_0) do
		iter_5_1:StopBt()
	end
end

function var_0_0.RestartGame(arg_6_0)
	for iter_6_0, iter_6_1 in ipairs(arg_6_0:GetView():GetUnitList()) do
		if iter_6_1.behaviourTreeOwner then
			LuaHelper.NodeCanvasSetIntVariableValue(iter_6_1.behaviourTreeOwner, "step", 0)
		end

		iter_6_1:RestartBt()
	end

	if arg_6_0.behaviourTreeOwner then
		LuaHelper.NodeCanvasSetIntVariableValue(arg_6_0.behaviourTreeOwner, "step", 0)
		arg_6_0:RestartBt()
	end
end

return var_0_0
