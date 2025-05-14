local var_0_0 = class("IslandCore", import("..IslandDispatcher"))

var_0_0.STATE_LOAD = 1
var_0_0.STATE_INIT = 2
var_0_0.STATE_INIT_FINISH = 3
var_0_0.STATE_DISPOSE = 4

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_0.super.Ctor(arg_1_0)

	local var_1_0, var_1_1 = arg_1_0:GetViewAndController(arg_1_1)

	arg_1_0.view = var_1_0
	arg_1_0.controller = var_1_1
	arg_1_0.sceneLoader = (arg_1_2 and IslandSceneSwitcher or IslandSceneLoader).New()

	arg_1_0:UpdateState(var_0_0.STATE_LOAD)

	local var_1_2 = IslandDataConvertor.Island2SceneName(arg_1_1)

	arg_1_0.sceneLoader:Load(var_1_2, function(arg_2_0)
		arg_1_0:Init(arg_2_0)
	end)
end

function var_0_0.UpdateState(arg_3_0, arg_3_1)
	arg_3_0.state = arg_3_1

	arg_3_0.view:OnCoreStateChanged(arg_3_1)
	arg_3_0.controller:OnCoreStateChanged(arg_3_1)
end

function var_0_0.Init(arg_4_0, arg_4_1)
	arg_4_0:UpdateState(var_0_0.STATE_INIT)
	arg_4_0.view:SetUp()
	arg_4_0.controller:SetUp()

	if not arg_4_0.handle then
		arg_4_0.handle = UpdateBeat:CreateListener(arg_4_0.Update, arg_4_0)
	end

	UpdateBeat:AddListener(arg_4_0.handle)

	if not arg_4_0.lateUpdateluHandle then
		arg_4_0.lateUpdateluHandle = LateUpdateBeat:CreateListener(arg_4_0.LateUpdate, arg_4_0)

		LateUpdateBeat:AddListener(arg_4_0.lateUpdateluHandle)
	end

	function arg_4_0.callback()
		arg_4_1()
		arg_4_0:UpdateState(var_0_0.STATE_INIT_FINISH)
	end
end

function var_0_0.GetMapId(arg_6_0)
	return arg_6_0:GetController():GetMapID()
end

function var_0_0.IsInit(arg_7_0)
	return arg_7_0.state == var_0_0.STATE_INIT or arg_7_0.state == var_0_0.STATE_INIT_FINISH
end

function var_0_0.Update(arg_8_0)
	if not arg_8_0:IsInit() then
		return
	end

	arg_8_0.controller:Update()
	arg_8_0.view:Update()

	if arg_8_0.callback and arg_8_0.view:IsLoaded() then
		arg_8_0.callback()

		arg_8_0.callback = nil
	end
end

function var_0_0.LateUpdate(arg_9_0)
	if not arg_9_0:IsInit() then
		return
	end

	arg_9_0.controller:LateUpdate()
	arg_9_0.view:LateUpdate()
end

function var_0_0.GetView(arg_10_0)
	return arg_10_0.view
end

function var_0_0.GetController(arg_11_0)
	return arg_11_0.controller
end

function var_0_0.Link(arg_12_0, arg_12_1, ...)
	arg_12_0:GetController():NotifiyCore(arg_12_1, ...)
end

function var_0_0.Dispose(arg_13_0, arg_13_1)
	arg_13_0:UpdateState(var_0_0.STATE_DISPOSE)

	if arg_13_0.handle then
		UpdateBeat:RemoveListener(arg_13_0.handle)
	end

	if arg_13_0.lateUpdateluHandle then
		LateUpdateBeat:RemoveListener(arg_13_0.lateUpdateluHandle)
	end

	if arg_13_0.controller then
		arg_13_0.controller:Dispose()

		arg_13_0.controller = nil
	end

	if arg_13_0.view then
		arg_13_0.view:Dispose()

		arg_13_0.view = nil
	end

	if arg_13_0.sceneLoader then
		arg_13_0.sceneLoader:Dispose(arg_13_1)

		arg_13_0.sceneLoader = nil
	end
end

function var_0_0.GetViewAndController(arg_14_0, arg_14_1)
	local var_14_0
	local var_14_1
	local var_14_2 = arg_14_1:GetMapId()

	if var_14_2 == IslandConst.AGORA_MAP_ID then
		var_14_1 = AgoraController.New(arg_14_0, arg_14_1)

		local var_14_3 = var_14_1:GetAgora()

		var_14_0 = AgoraView.New(arg_14_0, var_14_3)
	elseif var_14_2 == IslandConst.SEEK_GAME_MAP_ID then
		var_14_0 = IslandSeekGameView.New(arg_14_0)
		var_14_1 = IslandController.New(arg_14_0, arg_14_1)
	else
		var_14_1 = IslandController.New(arg_14_0, arg_14_1)
		var_14_0 = IslandView.New(arg_14_0)
	end

	return var_14_0, var_14_1
end

return var_0_0
