local var_0_0 = class("AgoraMould", import("Mod.Island.Core.View.SceneObject.IslandSceneUnit"))
local var_0_1 = Vector3(-0.5, 0, -0.5)

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, arg_1_3)

	arg_1_0.callbacks = {}
	arg_1_0.root = arg_1_2.transform
	arg_1_0.areaTr = arg_1_2.transform:Find("area")
	arg_1_0.areaMaterial = arg_1_0.areaTr:GetComponent("MeshRenderer").material

	arg_1_0:InitArea()
end

function var_0_0.InitArea(arg_2_0)
	local var_2_0 = arg_2_0.data:GetSize()

	arg_2_0.areaTr.localScale = Vector3(var_2_0.x, 0.01, var_2_0.y)

	setActive(arg_2_0.areaTr, false)
	arg_2_0:UpdateAreaState(true)
end

function var_0_0.ShowOrHideArea(arg_3_0, arg_3_1)
	setActive(arg_3_0.areaTr, arg_3_1)
end

function var_0_0.UpdateAreaState(arg_4_0, arg_4_1)
	arg_4_0.areaMaterial:SetColor("_Color", arg_4_1 and Color.green or Color.red)
end

function var_0_0.IsFullLoaded(arg_5_0)
	return arg_5_0:IsLoaded()
end

function var_0_0.Init(arg_6_0, arg_6_1)
	arg_6_0._go = arg_6_1
	arg_6_0.root.name = arg_6_0.data.id

	arg_6_0:UpdatePosition(arg_6_0.data:GetArea())
	arg_6_0:UpdateRotation(arg_6_0.data:GetRotation())
	arg_6_0:OnInit(arg_6_1)
	arg_6_0:AddListeners()

	arg_6_0.behaviourTreeOwner = arg_6_0.root:GetComponent(typeof(NodeCanvas.BehaviourTrees.BehaviourTreeOwner))

	var_0_0.super.super.Init(arg_6_0, arg_6_1)
end

function var_0_0.AddListeners(arg_7_0)
	arg_7_0:AddListener(ISLAND_AGORA_EVT.ITEM_POSITION_UPDATE, arg_7_0.UpdatePosition)
	arg_7_0:AddListener(ISLAND_AGORA_EVT.ITEM_DIR_UPDATE, arg_7_0.UpdateRotation)
end

function var_0_0.RemoveListeners(arg_8_0)
	arg_8_0:RemoveListener(ISLAND_AGORA_EVT.ITEM_POSITION_UPDATE, arg_8_0.UpdatePosition)
	arg_8_0:RemoveListener(ISLAND_AGORA_EVT.ITEM_DIR_UPDATE, arg_8_0.UpdateRotation)
end

function var_0_0.UpdatePosition(arg_9_0, arg_9_1)
	local var_9_0 = AgoraCalc.GetAreaCenterPos(arg_9_1)

	arg_9_0.root.position = var_9_0 + var_0_1
end

function var_0_0.UpdateRotation(arg_10_0, arg_10_1)
	arg_10_0.root.eulerAngles = arg_10_1
end

function var_0_0.AddListener(arg_11_0, arg_11_1, arg_11_2)
	local function var_11_0(arg_12_0, ...)
		arg_11_2(arg_11_0, ...)
	end

	arg_11_0.callbacks[arg_11_2] = var_11_0

	arg_11_0.data:AddListener(arg_11_1, var_11_0)
end

function var_0_0.RemoveListener(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = arg_13_0.callbacks[arg_13_2]

	if var_13_0 then
		arg_13_0.data:RemoveListener(arg_13_1, var_13_0)

		arg_13_0.callbacks[var_13_0] = nil
	end
end

function var_0_0.Enable(arg_14_0)
	if not arg_14_0:IsLoaded() then
		return
	end

	arg_14_0:SetupBt()
end

function var_0_0.Disable(arg_15_0)
	if not arg_15_0:IsLoaded() then
		return
	end

	arg_15_0:PauseBt()
end

function var_0_0.Dispose(arg_16_0)
	var_0_0.super.Dispose(arg_16_0)
	arg_16_0:RemoveListeners()

	arg_16_0.callbacks = {}
end

function var_0_0.OnDestroy(arg_17_0)
	Object.Destroy(arg_17_0.root.gameObject)

	arg_17_0.root = nil
end

return var_0_0
