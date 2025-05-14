local var_0_0 = class("IslandUnitBuilder")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.view = arg_1_1
end

function var_0_0.Build(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_0:GetModule(arg_2_0.view, arg_2_1)
	local var_2_1

	seriesAsync({
		function(arg_3_0)
			arg_2_0:Load(arg_2_1, function(arg_4_0)
				var_2_1 = arg_4_0

				arg_3_0()
			end)
		end,
		function(arg_5_0)
			arg_2_0:AddComponents(var_2_1, arg_2_1)
			arg_2_0:SetTag(var_2_1)
			arg_2_0:SetupBT(var_2_1, arg_2_1, arg_5_0)
		end
	}, function()
		var_2_0:Init(var_2_1)
	end)

	return var_2_0
end

function var_0_0.Load(arg_7_0, arg_7_1, arg_7_2)
	ResourceMgr.Inst:getAssetAsync(arg_7_1:GetAssetPath(), "", typeof(GameObject), UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_8_0)
		local var_8_0 = Object.Instantiate(arg_8_0)

		arg_7_2(var_8_0)
	end), true, true)
end

function var_0_0.SetupBT(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
	local var_9_0 = arg_9_2:GetBehaviourTree()

	if not var_9_0 or var_9_0 == "" then
		arg_9_3()

		return
	end

	ResourceMgr.Inst:getAssetAsync(var_9_0, "", typeof(NodeCanvas.BehaviourTrees.BehaviourTree), UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_10_0)
		assert(arg_10_0, var_9_0)

		GetOrAddComponent(arg_9_1, typeof(NodeCanvas.BehaviourTrees.BehaviourTreeOwner)).graph = Object.Instantiate(arg_10_0)

		arg_9_3()
	end), true, true)
end

function var_0_0.GetModule(arg_11_0, arg_11_1, arg_11_2)
	assert(false, "overwrite !!!")
end

function var_0_0.SetTag(arg_12_0, arg_12_1)
	return
end

function var_0_0.AddComponents(arg_13_0, arg_13_1)
	return
end

return var_0_0
