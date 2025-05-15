local var_0_0 = class("AgoraView", import(".BaseAgoraView"))
local var_0_1 = false

function var_0_0.Init(arg_1_0)
	var_0_0.super.Init(arg_1_0)

	arg_1_0.moulds = {}

	if var_0_1 then
		arg_1_0.debugMap = AgoraDebugMap.New(arg_1_0)

		arg_1_0.debugMap:Init()
	end

	arg_1_0.decorationView = AgoraDecorationView.New(arg_1_0)
	arg_1_0.mouldBuilder = AgoraMouldBuilder.New(arg_1_0)
	arg_1_0.boards = {
		[2916] = GameObject.Find("[MainBlock]/[Model]/grid/level1_54x54"),
		[4356] = GameObject.Find("[MainBlock]/[Model]/grid/level2_66x66"),
		[6084] = GameObject.Find("[MainBlock]/[Model]/grid/level3_78x78")
	}
	arg_1_0.grids = {
		[2916] = GameObject.Find("[MainBlock]/[Model]/nobake/grid/level1_54x54"),
		[4356] = GameObject.Find("[MainBlock]/[Model]/nobake/grid/level2_66x66"),
		[6084] = GameObject.Find("[MainBlock]/[Model]/nobake/grid/level3_78x78")
	}

	for iter_1_0, iter_1_1 in pairs(arg_1_0.grids) do
		setActive(iter_1_1, false)
	end

	arg_1_0.agoraLookAtObj = GameObject.Find("AgoraMainStage/lookat"):GetComponent("AgoraLookAtObj")
end

function var_0_0.CreateOpView(arg_2_0)
	return AgoraOpView.New(arg_2_0)
end

function var_0_0.IsLoaded(arg_3_0)
	local function var_3_0()
		for iter_4_0, iter_4_1 in pairs(arg_3_0.moulds) do
			if not iter_4_1:IsLoaded() then
				return false
			end
		end

		return true
	end

	return var_0_0.super.IsLoaded(arg_3_0) and var_3_0()
end

function var_0_0.AddAgoraListeners(arg_5_0)
	arg_5_0:AddAgoraListener(ISLAND_AGORA_EVT.GEN_ITEM, arg_5_0.OnGenItem)
	arg_5_0:AddAgoraListener(ISLAND_AGORA_EVT.REMOVE_ITEM, arg_5_0.OnRemoveItem)
	arg_5_0:AddAgoraListener(ISLAND_AGORA_EVT.ENTER_EDIT, arg_5_0.EnterEditMode)
	arg_5_0:AddAgoraListener(ISLAND_AGORA_EVT.EXIT_EDIT, arg_5_0.ExitEditMode)

	if var_0_1 then
		arg_5_0:AddAgoraListener(ISLAND_AGORA_EVT.MAP_STATE_UPDATE, arg_5_0.OnMapStateUpdate)
	end

	arg_5_0:AddAgoraListener(ISLAND_AGORA_EVT.SELECTED_ITEM, arg_5_0.OnSelectedItem)
	arg_5_0:AddAgoraListener(ISLAND_AGORA_EVT.UNSELECTED_ITEM, arg_5_0.OnUnSelectedItem)
	arg_5_0:AddAgoraListener(ISLAND_AGORA_EVT.DRAG_ITEM, arg_5_0.OnDragItem)
	arg_5_0:AddAgoraListener(ISLAND_AGORA_EVT.MAP_SIZE_UPDATE, arg_5_0.OnBoardUpdate)
	arg_5_0:AddAgoraListener(ISLAND_AGORA_EVT.START_INTERACTION, arg_5_0.OnStartInteraction)
	arg_5_0:AddAgoraListener(ISLAND_AGORA_EVT.END_INTERACTION, arg_5_0.OnEndInteraction)
	arg_5_0:AddAgoraListener(ISLAND_AGORA_EVT.ITEM_OCCUPIED, arg_5_0.OnPositionOccupied)
	arg_5_0:AddAgoraListener(ISLAND_AGORA_EVT.ITEM_CLEAR_OCCUPIED, arg_5_0.OnClearPositionOccupied)
end

function var_0_0.RemoveAgoraListeners(arg_6_0)
	arg_6_0:RemoveAgoraListener(ISLAND_AGORA_EVT.GEN_ITEM, arg_6_0.OnGenItem)
	arg_6_0:RemoveAgoraListener(ISLAND_AGORA_EVT.REMOVE_ITEM, arg_6_0.OnRemoveItem)
	arg_6_0:RemoveAgoraListener(ISLAND_AGORA_EVT.ENTER_EDIT, arg_6_0.EnterEditMode)
	arg_6_0:RemoveAgoraListener(ISLAND_AGORA_EVT.EXIT_EDIT, arg_6_0.ExitEditMode)

	if var_0_1 then
		arg_6_0:RemoveAgoraListener(ISLAND_AGORA_EVT.MAP_STATE_UPDATE, arg_6_0.OnMapStateUpdate)
	end

	arg_6_0:RemoveAgoraListener(ISLAND_AGORA_EVT.SELECTED_ITEM, arg_6_0.OnSelectedItem)
	arg_6_0:RemoveAgoraListener(ISLAND_AGORA_EVT.UNSELECTED_ITEM, arg_6_0.OnUnSelectedItem)
	arg_6_0:RemoveAgoraListener(ISLAND_AGORA_EVT.DRAG_ITEM, arg_6_0.OnDragItem)
	arg_6_0:RemoveAgoraListener(ISLAND_AGORA_EVT.MAP_SIZE_UPDATE, arg_6_0.OnBoardUpdate)
	arg_6_0:RemoveAgoraListener(ISLAND_AGORA_EVT.START_INTERACTION, arg_6_0.OnStartInteraction)
	arg_6_0:RemoveAgoraListener(ISLAND_AGORA_EVT.END_INTERACTION, arg_6_0.OnEndInteraction)
	arg_6_0:RemoveAgoraListener(ISLAND_AGORA_EVT.ITEM_OCCUPIED, arg_6_0.OnPositionOccupied)
	arg_6_0:RemoveAgoraListener(ISLAND_AGORA_EVT.ITEM_CLEAR_OCCUPIED, arg_6_0.OnClearPositionOccupied)
end

function var_0_0.OnSceneInited(arg_7_0)
	var_0_0.super.OnSceneInited(arg_7_0)

	for iter_7_0, iter_7_1 in pairs(arg_7_0.moulds) do
		iter_7_1:Start()
	end
end

function var_0_0.OnGenItem(arg_8_0, arg_8_1)
	arg_8_0.moulds[arg_8_1.id] = arg_8_0.mouldBuilder:Build(arg_8_1)

	if arg_8_0.decorationView:IsLoaded() then
		arg_8_0.decorationView:Flush()
	end

	local var_8_0 = AgoraCalc.GetCenterMapPos()
	local var_8_1 = arg_8_1:GetPosition()

	if var_8_0 ~= var_8_1 then
		local var_8_2 = AgoraCalc.MapPosition2WorldPosition(var_8_1)

		arg_8_0.agoraLookAtObj:SetTargetPosition(var_8_2)
	end
end

function var_0_0.OnRemoveItem(arg_9_0, arg_9_1)
	arg_9_0.moulds[arg_9_1.id]:Dispose()

	arg_9_0.moulds[arg_9_1.id] = nil

	if arg_9_0.decorationView:IsLoaded() then
		arg_9_0.decorationView:Flush()
	end
end

function var_0_0.OnBoardUpdate(arg_10_0, arg_10_1)
	local var_10_0 = arg_10_1.x * arg_10_1.y

	for iter_10_0, iter_10_1 in pairs(arg_10_0.boards) do
		setActive(iter_10_1, iter_10_0 <= var_10_0)
	end

	if arg_10_0.isEditing then
		for iter_10_2, iter_10_3 in pairs(arg_10_0.grids) do
			setActive(iter_10_3, iter_10_2 <= var_10_0)
		end
	end

	local var_10_1 = AgoraCalc.GetSizeCoord(arg_10_1)

	arg_10_0.agoraLookAtObj:SetRange(var_10_1)
end

function var_0_0.OnSelectedItem(arg_11_0, arg_11_1)
	local var_11_0 = arg_11_0.moulds[arg_11_1]

	var_11_0:ShowOrHideArea(true)
	arg_11_0.opView:ActiveDragBtn(var_11_0)
end

function var_0_0.OnUnSelectedItem(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_0.moulds[arg_12_1]

	var_12_0:ShowOrHideArea(false)
	var_12_0:UpdateAreaState(true)
	arg_12_0.opView:InActiveDragBtn(var_12_0)
end

function var_0_0.OnDragItem(arg_13_0, arg_13_1, arg_13_2)
	arg_13_0.moulds[arg_13_1]:UpdateAreaState(arg_13_2)
end

function var_0_0.OnPositionOccupied(arg_14_0, arg_14_1)
	local var_14_0 = arg_14_0.moulds[arg_14_1]

	var_14_0:ShowOrHideArea(true)
	var_14_0:UpdateAreaState(false)
end

function var_0_0.OnClearPositionOccupied(arg_15_0, arg_15_1)
	for iter_15_0, iter_15_1 in pairs(arg_15_0.moulds) do
		if iter_15_0 ~= arg_15_1 then
			iter_15_1:ShowOrHideArea(false)
			iter_15_1:UpdateAreaState(true)
		end
	end
end

function var_0_0.OnStartInteraction(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = arg_16_2:GetHostId()
	local var_16_1 = arg_16_2:GetUserId()
	local var_16_2 = arg_16_0.moulds[var_16_0]
	local var_16_3 = arg_16_0:GetUnitModule(var_16_1)

	if arg_16_0.player == var_16_3 then
		arg_16_0.opView:Disable()
		var_16_2.behaviourTreeOwner.graph.blackboard:SetVariableValue("inProgress", true)
	end

	local var_16_4 = var_16_2.root.transform:Find("playable"):GetComponent(typeof(UnityEngine.Playables.PlayableDirector))

	if arg_16_1:AnySlotUsing() then
		var_16_4:Stop()
	end

	var_16_3._go.transform:SetParent(var_16_2._go.transform)

	local var_16_5 = TimelineHelper.GetTimelineTracks(var_16_4)
	local var_16_6 = arg_16_2.id

	if var_16_5 and var_16_6 < var_16_5.Length then
		local var_16_7 = var_16_5[var_16_6]

		TimelineHelper.SetSceneBinding(var_16_4, var_16_7, var_16_3._go)
	end

	var_16_4.enabled = true

	var_16_4:Play()
end

function var_0_0.OnEndInteraction(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = arg_17_2:GetHostId()
	local var_17_1 = arg_17_2:GetUserId()
	local var_17_2 = arg_17_0.moulds[var_17_0]
	local var_17_3 = arg_17_0:GetUnitModule(var_17_1)
	local var_17_4 = var_17_2.root.transform:Find("playable"):GetComponent(typeof(UnityEngine.Playables.PlayableDirector))

	if not arg_17_1:AnySlotUsing() then
		var_17_4:Stop()

		var_17_4.enabled = true
	end

	local var_17_5 = TimelineHelper.GetTimelineTracks(var_17_4)
	local var_17_6 = arg_17_2.id

	if var_17_5 and var_17_6 < var_17_5.Length then
		local var_17_7 = var_17_5[var_17_6]

		TimelineHelper.SetSceneBinding(var_17_4, var_17_7, nil)
	end

	if arg_17_0.player == var_17_3 then
		arg_17_0.opView:Enable()
		var_17_2.behaviourTreeOwner.graph.blackboard:SetVariableValue("inProgress", false)
	end

	var_17_3._go.transform:SetParent(nil)
end

function var_0_0.OnMapStateUpdate(arg_18_0, arg_18_1)
	if arg_18_0.debugMap then
		arg_18_0.debugMap:UpdateItem(arg_18_1.position, arg_18_1.flag)
	end
end

function var_0_0.EnterEditMode(arg_19_0)
	IslandCameraMgr.instance:ActiveVirtualCamera(IslandConst.AGORA_CAMERA_NAME)
	arg_19_0.opView:DisablePlayerOp()
	arg_19_0.opView:EnableAgoraOp()
	arg_19_0.decorationView:Show()

	for iter_19_0, iter_19_1 in ipairs(arg_19_0:GetUnitList()) do
		iter_19_1:Disable()
	end

	for iter_19_2, iter_19_3 in pairs(arg_19_0.moulds) do
		iter_19_3:Disable()
	end

	local var_19_0 = arg_19_0.agora:GetSize()
	local var_19_1 = var_19_0.x * var_19_0.y

	for iter_19_4, iter_19_5 in pairs(arg_19_0.grids) do
		setActive(iter_19_5, iter_19_4 <= var_19_1)
	end

	arg_19_0.isEditing = true
end

function var_0_0.ExitEditMode(arg_20_0)
	IslandCameraMgr.instance:ActiveVirtualCamera(IslandConst.FOLLOW_CAMERA_NAME)
	arg_20_0.opView:EnablePlayerOp()
	arg_20_0.opView:DisableAgoraOp()
	arg_20_0.decorationView:Hide()

	for iter_20_0, iter_20_1 in ipairs(arg_20_0:GetUnitList()) do
		iter_20_1:Enable()
	end

	for iter_20_2, iter_20_3 in pairs(arg_20_0.moulds) do
		iter_20_3:Enable()
	end

	for iter_20_4, iter_20_5 in pairs(arg_20_0.grids) do
		setActive(iter_20_5, false)
	end

	arg_20_0.isEditing = false
end

function var_0_0.GetAgoraMould(arg_21_0, arg_21_1)
	return arg_21_0.moulds[arg_21_1]
end

function var_0_0.OnDispose(arg_22_0)
	var_0_0.super.OnDispose(arg_22_0)

	if arg_22_0.decorationView then
		arg_22_0.decorationView:Dispose()

		arg_22_0.decorationView = nil
	end

	if var_0_1 and arg_22_0.debugMap then
		arg_22_0.debugMap:Dispose()

		arg_22_0.debugMap = nil
	end
end

return var_0_0
