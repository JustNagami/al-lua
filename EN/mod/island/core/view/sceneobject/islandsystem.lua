local var_0_0 = class("IslandSystem", import(".IslandSceneUnit"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, arg_1_2)

	local var_1_0 = GameObject.New()

	seriesAsync({
		function(arg_2_0)
			arg_1_0:LoadBehaviourTree(var_1_0, arg_1_0:GetBehaviourTree(), arg_2_0)
		end
	}, function()
		arg_1_0:Init(var_1_0)
	end)
end

function var_0_0.GetBehaviourTree(arg_4_0)
	return arg_4_0.data:GetBehaviourTree()
end

function var_0_0.LoadBehaviourTree(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	if not arg_5_2 or arg_5_2 == "" then
		arg_5_3()

		return
	end

	ResourceMgr.Inst:getAssetAsync(arg_5_2, "", typeof(NodeCanvas.BehaviourTrees.BehaviourTree), UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_6_0)
		assert(arg_6_0, arg_5_2)

		GetOrAddComponent(arg_5_1, typeof(NodeCanvas.BehaviourTrees.BehaviourTreeOwner)).graph = Object.Instantiate(arg_6_0)

		arg_5_3()
	end), true, true)
end

return var_0_0
