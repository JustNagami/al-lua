local var_0_0 = class("IslandSceneUnit", import("..IslandBaseUnit"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_0.super.Ctor(arg_1_0, arg_1_1)
	assert(arg_1_2.id)

	arg_1_0.id = arg_1_2.id
	arg_1_0.modelId = arg_1_2.modelId or 0
	arg_1_0.name = arg_1_2.name or ""
	arg_1_0.position = arg_1_2.position or Vector3.zero
	arg_1_0.rotation = arg_1_2.rotation or Vector3.zero
	arg_1_0.data = arg_1_2
	arg_1_0.active = true
end

function var_0_0.ResetPosition(arg_2_0)
	arg_2_0._go.transform.position = arg_2_0.position
	arg_2_0._go.transform.eulerAngles = arg_2_0.rotation
end

function var_0_0.Init(arg_3_0, arg_3_1)
	arg_3_0._go = arg_3_1
	arg_3_0._go.name = arg_3_0.name
	arg_3_0._go.transform.position = arg_3_0.position
	arg_3_0._go.transform.eulerAngles = arg_3_0.rotation
	arg_3_0.behaviourTreeOwner = arg_3_0._go:GetComponent(typeof(NodeCanvas.BehaviourTrees.BehaviourTreeOwner))

	var_0_0.super.Init(arg_3_0, arg_3_1)

	if arg_3_0:GetView():IsInit() then
		arg_3_0:Start()
	end
end

function var_0_0.Start(arg_4_0)
	arg_4_0:SetupBt()
	arg_4_0:OnStart()
end

function var_0_0.Dispose(arg_5_0)
	arg_5_0:ClearBt()
	var_0_0.super.Dispose(arg_5_0)
	Object.Destroy(arg_5_0._go)

	arg_5_0._go = nil
end

function var_0_0.SetupBt(arg_6_0)
	if not arg_6_0.behaviourTreeOwner then
		return
	end

	arg_6_0.behaviourTreeOwner.graph.blackboard:AddVariable("id", arg_6_0.id)
	arg_6_0.behaviourTreeOwner.graph.blackboard:AddVariable("_player", arg_6_0.view.player._go)
	arg_6_0.behaviourTreeOwner:StartBehaviour()
end

function var_0_0.RestartBt(arg_7_0)
	if not arg_7_0.behaviourTreeOwner then
		return
	end

	arg_7_0.behaviourTreeOwner:RestartBehaviour()
end

function var_0_0.PauseBt(arg_8_0)
	if not arg_8_0.behaviourTreeOwner then
		return
	end

	arg_8_0.behaviourTreeOwner:PauseBehaviour()
end

function var_0_0.StopBt(arg_9_0)
	if not arg_9_0.behaviourTreeOwner then
		return
	end

	arg_9_0.behaviourTreeOwner:StopBehaviour()
end

function var_0_0.ClearBt(arg_10_0)
	arg_10_0:StopBt()

	arg_10_0.behaviourTreeOwner = nil
end

function var_0_0.Enable(arg_11_0)
	if not arg_11_0:IsLoaded() then
		return
	end

	setActive(arg_11_0._go, true)

	arg_11_0.active = true
end

function var_0_0.Disable(arg_12_0)
	if not arg_12_0:IsLoaded() then
		return
	end

	setActive(arg_12_0._go, false)

	arg_12_0.active = false
end

function var_0_0.Update(arg_13_0)
	if not arg_13_0.active then
		return
	end

	var_0_0.super.Update(arg_13_0)
end

function var_0_0.OnStart(arg_14_0)
	return
end

return var_0_0
