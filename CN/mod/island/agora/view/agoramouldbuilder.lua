local var_0_0 = class("AgoraMouldBuilder")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.view = arg_1_1
	arg_1_0.tpl = GameObject.Find("AgoraMainStage/tpl")
	arg_1_0.root = GameObject.Find("AgoraMainStage/furniture")
end

function var_0_0.Build(arg_2_0, arg_2_1)
	local var_2_0 = cloneTplTo(arg_2_0.tpl, arg_2_0.root).gameObject
	local var_2_1 = AgoraFurnitrueMould.New(arg_2_0.view, var_2_0, arg_2_1)
	local var_2_2

	seriesAsync({
		function(arg_3_0)
			arg_2_0:LoadRes(var_2_0, arg_2_1, function(arg_4_0)
				var_2_2 = arg_4_0

				arg_3_0()
			end)
		end,
		function(arg_5_0)
			arg_2_0:LoadBt(var_2_0, arg_2_1, arg_5_0)
		end,
		function(arg_6_0)
			arg_2_0:LoadTimeline(var_2_0, var_2_2, arg_2_1, arg_6_0)
		end
	}, function()
		var_2_1:Init(var_2_2)
	end)

	return var_2_1
end

function var_0_0.LoadRes(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	local var_8_0 = arg_8_2:GetResPath()

	ResourceMgr.Inst:getAssetAsync(var_8_0, "", typeof(GameObject), UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_9_0)
		local var_9_0 = Object.Instantiate(arg_9_0)

		setParent(var_9_0, arg_8_1)
		arg_8_3(var_9_0)
	end), true, true)
end

function var_0_0.LoadBt(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
	if not arg_10_2:HasBt() then
		arg_10_3()

		return
	end

	local var_10_0 = arg_10_2:GetBt()

	ResourceMgr.Inst:getAssetAsync(var_10_0, "", typeof(NodeCanvas.BehaviourTrees.BehaviourTree), UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_11_0)
		GetOrAddComponent(arg_10_1, typeof(NodeCanvas.BehaviourTrees.BehaviourTreeOwner)).graph = Object.Instantiate(arg_11_0)

		arg_10_3()
	end), true, true)
end

function var_0_0.LoadTimeline(arg_12_0, arg_12_1, arg_12_2, arg_12_3, arg_12_4)
	if not arg_12_3:HasTimeline() then
		arg_12_4()

		return
	end

	local var_12_0 = arg_12_3:GetTimeline()

	ResourceMgr.Inst:getAssetAsync(var_12_0, "", typeof(UnityEngine.Playables.PlayableAsset), UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_13_0)
		local var_13_0 = arg_12_1.transform:Find("playable"):GetComponent(typeof(UnityEngine.Playables.PlayableDirector))

		var_13_0.playableAsset = Object.Instantiate(arg_13_0)

		local var_13_1 = TimelineHelper.GetTimelineTracks(var_13_0)

		if var_13_1 and var_13_1.Length > 0 then
			local var_13_2 = var_13_1[0]

			TimelineHelper.SetSceneBinding(var_13_0, var_13_2, arg_12_2)
		end

		arg_12_4()
	end), true, true)
end

return var_0_0
