local var_0_0 = class("IslandView", import(".IslandBaseView"))

function var_0_0.Init(arg_1_0)
	arg_1_0.isInit = false
	arg_1_0.unitList = {}
	arg_1_0.systems = {}
	arg_1_0.systemUnitList = {}
	arg_1_0.unitBuilders = {
		[IslandConst.UNIT_TYPE_ITEM] = IslandStaticUnitBuilder.New(arg_1_0),
		[IslandConst.UNIT_TYPE_CHAR] = IslandNpcBuilder.New(arg_1_0),
		[IslandConst.UNIT_TYPE_VISITOR] = IslandNpcBuilder.New(arg_1_0),
		[IslandConst.UNIT_TYPE_PLAYER] = IslandPlayerBuilder.New(arg_1_0),
		[IslandConst.UNIT_TYPE_SYSTEM] = IslandSystemNpcBuilder.New(arg_1_0),
		[IslandConst.UNIT_TYPE_ITEM_INTERACT] = IslandStaticUnitBuilder.New(arg_1_0)
	}
	arg_1_0.detectionSystem = IslandDetectionSystem.New(arg_1_0)
	arg_1_0.views = {
		arg_1_0:CreateOpView(),
		arg_1_0:CreateSlotHudView(),
		arg_1_0:CreateBubbleView()
	}

	for iter_1_0, iter_1_1 in ipairs(arg_1_0.views) do
		iter_1_1:Init()
	end
end

function var_0_0.GetSubView(arg_2_0, arg_2_1)
	for iter_2_0, iter_2_1 in ipairs(arg_2_0.views) do
		if isa(iter_2_1, arg_2_1) then
			return iter_2_1
		end
	end

	return nil
end

function var_0_0.CreateBubbleView(arg_3_0)
	return IslandChatBubbleView.New(arg_3_0)
end

function var_0_0.CreateOpView(arg_4_0)
	return IslandOpView.New(arg_4_0)
end

function var_0_0.CreateSlotHudView(arg_5_0)
	return IslandSlotHudView.New(arg_5_0)
end

function var_0_0.IsLoaded(arg_6_0)
	return _.all(arg_6_0.views, function(arg_7_0)
		return arg_7_0:IsLoaded()
	end) and #arg_6_0.unitList > 0 and _.all(arg_6_0.unitList, function(arg_8_0)
		return arg_8_0:IsLoaded()
	end) and (#arg_6_0.systems == 0 or _.all(arg_6_0.systems, function(arg_9_0)
		return arg_9_0:IsLoaded()
	end)) and (#arg_6_0.systemUnitList == 0 or _.all(arg_6_0.systemUnitList, function(arg_10_0)
		return arg_10_0:IsLoaded()
	end))
end

function var_0_0.Update(arg_11_0)
	if not arg_11_0.isInit then
		return
	end

	for iter_11_0, iter_11_1 in ipairs(arg_11_0.unitList) do
		iter_11_1:Update()
	end

	for iter_11_2, iter_11_3 in ipairs(arg_11_0.views) do
		iter_11_3:Update()
	end

	for iter_11_4, iter_11_5 in ipairs(arg_11_0.systems) do
		iter_11_5:Update()
	end

	for iter_11_6, iter_11_7 in ipairs(arg_11_0.systemUnitList) do
		iter_11_7:Update()
	end
end

function var_0_0.LateUpdate(arg_12_0)
	if not arg_12_0.isInit then
		return
	end

	for iter_12_0, iter_12_1 in ipairs(arg_12_0.unitList) do
		iter_12_1:LateUpdate()
	end

	for iter_12_2, iter_12_3 in ipairs(arg_12_0.views) do
		iter_12_3:LateUpdate()
	end

	for iter_12_4, iter_12_5 in ipairs(arg_12_0.systems) do
		iter_12_5:LateUpdate()
	end

	for iter_12_6, iter_12_7 in ipairs(arg_12_0.systemUnitList) do
		iter_12_7:LateUpdate()
	end
end

function var_0_0.AddListeners(arg_13_0)
	arg_13_0:AddListener(ISLAND_EVT.GEN_UNIT, arg_13_0.OnGenUnit)
	arg_13_0:AddListener(ISLAND_EVT.RMOVE_UNIT, arg_13_0.OnRemoveUnit)
	arg_13_0:AddListener(ISLAND_EVT.INTERACTION_UNIT_BEGIN, arg_13_0.OnInterActionBegin)
	arg_13_0:AddListener(ISLAND_EVT.INTERACTION_UNIT_END, arg_13_0.OnInterActionEnd)
	arg_13_0:AddListener(ISLAND_EVT.STOP_MOVE_UNIT, arg_13_0.OnStopUnit)
	arg_13_0:AddListener(ISLAND_EVT.MOVE_UNIT, arg_13_0.OnMoveUnit)
	arg_13_0:AddListener(ISLAND_EVT.INIT_FINISH, arg_13_0.OnSceneInited)
	arg_13_0:AddListener(ISLAND_EVT.MOVE_PLAYER, arg_13_0.OnPlayerMove)
	arg_13_0:AddListener(ISLAND_EVT.STOP_MOVE_PLAYER, arg_13_0.OnPlayerStopMove)
	arg_13_0:AddListener(ISLAND_EVT.JUMP_PLAYER, arg_13_0.OnPlayerJump)
	arg_13_0:AddListener(ISLAND_EVT.PLANT, arg_13_0.OnPlayerPlant)
	arg_13_0:AddListener(ISLAND_EVT.APPROACH_UNIT, arg_13_0.OnShowInterActionPanel)
	arg_13_0:AddListener(ISLAND_EVT.LEAVE_UNIT, arg_13_0.OnHideInterActionPanel)
	arg_13_0:AddListener(ISLAND_EVT.TRACKING, arg_13_0.OnTracking)
	arg_13_0:AddListener(ISLAND_EVT.UNTRACKING, arg_13_0.OnUnTracking)
	arg_13_0:AddListener(ISLAND_EVT.AREACHANGE, arg_13_0.OnPlayerAreaChange)
	arg_13_0:AddListener(ISLAND_EVT.PLAYERRUN, arg_13_0.OnPlayerPlayerRun)
	arg_13_0:AddListener(ISLAND_EVT.SPRINT_PLAYER, arg_13_0.OnPlayerPlayerSprint)
	arg_13_0:AddListener(ISLAND_EVT.STOP_SPRINT_PLAYER, arg_13_0.OnStopPlayerSprint)
	arg_13_0:AddListener(ISLAND_EVT.SYNC_INTERACTION, arg_13_0.OnSyncInteraction)
	arg_13_0:AddListener(ISLAND_EVT.CHANGE_DRESS, arg_13_0.OnChangeDress)
	arg_13_0:AddListener(ISLAND_EVT.RESET_UNIT_POS, arg_13_0.OnResetUnitPos)
	arg_13_0:AddListener(ISLAND_EVT.ANY_PAGE_OPENED, arg_13_0.OnAnyPageOpen)
	arg_13_0:AddListener(ISLAND_EVT.ALL_PAGE_CLOSED, arg_13_0.OnAllPageClose)
	arg_13_0:AddListener(ISLAND_EVT.PLAY_BUBBLE, arg_13_0.OnPlayChatBubble)
	arg_13_0:AddListener(ISLAND_EVT.START_STORY, arg_13_0.OnStartStory)
	arg_13_0:AddListener(ISLAND_EVT.END_STORY, arg_13_0.OnEndStory)
	arg_13_0:AddListener(ISLAND_EVT.START_DEGATION, arg_13_0.OnStartDelegation)
	arg_13_0:AddListener(ISLAND_EVT.END_DEGATION, arg_13_0.OnEndDelegation)
	arg_13_0:AddListener(ISLAND_EVT.GEN_SYSTEM, arg_13_0.OnGenSystem)
	arg_13_0:AddListener(ISLAND_EVT.GEN_SYSTEM_UNIT, arg_13_0.OnCreateSystemUnit)
	arg_13_0:AddListener(ISLAND_EVT.RMOVE_TYPE_UNIT, arg_13_0.OnRemoveTypeUnit)
	arg_13_0:AddListener(ISLAND_EVT.REMOVE_SYSTEM_UNIT, arg_13_0.OnRemoveSystemUnit)
end

function var_0_0.RemoveListeners(arg_14_0)
	arg_14_0:RemoveListener(ISLAND_EVT.GEN_UNIT, arg_14_0.OnGenUnit)
	arg_14_0:RemoveListener(ISLAND_EVT.RMOVE_UNIT, arg_14_0.OnRemoveUnit)
	arg_14_0:RemoveListener(ISLAND_EVT.INTERACTION_UNIT_BEGIN, arg_14_0.OnInterActionBegin)
	arg_14_0:RemoveListener(ISLAND_EVT.INTERACTION_UNIT_END, arg_14_0.OnInterActionEnd)
	arg_14_0:RemoveListener(ISLAND_EVT.STOP_MOVE_UNIT, arg_14_0.OnStopUnit)
	arg_14_0:RemoveListener(ISLAND_EVT.MOVE_UNIT, arg_14_0.OnMoveUnit)
	arg_14_0:RemoveListener(ISLAND_EVT.INIT_FINISH, arg_14_0.OnSceneInited)
	arg_14_0:RemoveListener(ISLAND_EVT.MOVE_PLAYER, arg_14_0.OnPlayerMove)
	arg_14_0:RemoveListener(ISLAND_EVT.STOP_MOVE_PLAYER, arg_14_0.OnPlayerStopMove)
	arg_14_0:RemoveListener(ISLAND_EVT.JUMP_PLAYER, arg_14_0.OnPlayerJump)
	arg_14_0:RemoveListener(ISLAND_EVT.PLANT, arg_14_0.OnPlayerPlant)
	arg_14_0:RemoveListener(ISLAND_EVT.APPROACH_UNIT, arg_14_0.OnShowInterActionPanel)
	arg_14_0:RemoveListener(ISLAND_EVT.LEAVE_UNIT, arg_14_0.OnHideInterActionPanel)
	arg_14_0:RemoveListener(ISLAND_EVT.TRACKING, arg_14_0.OnTracking)
	arg_14_0:RemoveListener(ISLAND_EVT.UNTRACKING, arg_14_0.OnUnTracking)
	arg_14_0:RemoveListener(ISLAND_EVT.AREACHANGE, arg_14_0.OnPlayerAreaChange)
	arg_14_0:RemoveListener(ISLAND_EVT.PLAYERRUN, arg_14_0.OnPlayerPlayerRun)
	arg_14_0:RemoveListener(ISLAND_EVT.SPRINT_PLAYER, arg_14_0.OnPlayerPlayerSprint)
	arg_14_0:RemoveListener(ISLAND_EVT.STOP_SPRINT_PLAYER, arg_14_0.OnStopPlayerSprint)
	arg_14_0:RemoveListener(ISLAND_EVT.SYNC_INTERACTION, arg_14_0.OnSyncInteraction)
	arg_14_0:RemoveListener(ISLAND_EVT.CHANGE_DRESS, arg_14_0.OnChangeDress)
	arg_14_0:RemoveListener(ISLAND_EVT.RESET_UNIT_POS, arg_14_0.OnResetUnitPos)
	arg_14_0:RemoveListener(ISLAND_EVT.ANY_PAGE_OPENED, arg_14_0.OnAnyPageOpen)
	arg_14_0:RemoveListener(ISLAND_EVT.ALL_PAGE_CLOSED, arg_14_0.OnAllPageClose)
	arg_14_0:RemoveListener(ISLAND_EVT.PLAY_BUBBLE, arg_14_0.OnPlayChatBubble)
	arg_14_0:RemoveListener(ISLAND_EVT.START_STORY, arg_14_0.OnStartStory)
	arg_14_0:RemoveListener(ISLAND_EVT.END_STORY, arg_14_0.OnEndStory)
	arg_14_0:RemoveListener(ISLAND_EVT.START_DEGATION, arg_14_0.OnStartDelegation)
	arg_14_0:RemoveListener(ISLAND_EVT.END_DEGATION, arg_14_0.OnEndDelegation)
	arg_14_0:RemoveListener(ISLAND_EVT.GEN_SYSTEM, arg_14_0.OnGenSystem)
	arg_14_0:RemoveListener(ISLAND_EVT.GEN_SYSTEM_UNIT, arg_14_0.OnCreateSystemUnit)
	arg_14_0:RemoveListener(ISLAND_EVT.RMOVE_TYPE_UNIT, arg_14_0.OnRemoveTypeUnit)
	arg_14_0:RemoveListener(ISLAND_EVT.REMOVE_SYSTEM_UNIT, arg_14_0.OnRemoveSystemUnit)
end

function var_0_0.OnGenSystem(arg_15_0, arg_15_1)
	local var_15_0 = IslandCharacterSystem.New(arg_15_0, arg_15_1)

	table.insert(arg_15_0.systems, var_15_0)
end

function var_0_0.OnStartStory(arg_16_0)
	arg_16_0.player:StopMoveHandle()
	arg_16_0:GetSubView(IslandChatBubbleView):Disable()
	arg_16_0:GetSubView(IslandOpView):DisablePlayerOp()
	arg_16_0:GetSubView(IslandOpView):Hide()
end

function var_0_0.OnEndStory(arg_17_0)
	arg_17_0:GetSubView(IslandOpView):EnablePlayerOp()
	arg_17_0:GetSubView(IslandChatBubbleView):Enable()
	arg_17_0:GetSubView(IslandOpView):Show()
end

function var_0_0.OnPlayChatBubble(arg_18_0, arg_18_1)
	local var_18_0 = arg_18_0:GetUnitList()

	arg_18_0:GetSubView(IslandChatBubbleView):Play(arg_18_1.name, var_18_0, arg_18_1.callback)
end

function var_0_0.OnAnyPageOpen(arg_19_0, arg_19_1)
	arg_19_0.player:StopMoveHandle()
	arg_19_0:GetSubView(IslandChatBubbleView):Disable()
	arg_19_0:GetSubView(IslandOpView):DisablePlayerOp()
end

function var_0_0.OnAllPageClose(arg_20_0)
	arg_20_0:GetSubView(IslandChatBubbleView):Enable()
	arg_20_0:GetSubView(IslandOpView):EnablePlayerOp()
end

function var_0_0.OnResetUnitPos(arg_21_0, arg_21_1, arg_21_2)
	arg_21_0:GetUnitModule(arg_21_1)._go.transform.position = AgoraCalc.MapPosition2WorldPosition(arg_21_2)
end

function var_0_0.OnGenUnit(arg_22_0, arg_22_1)
	local var_22_0 = arg_22_0.unitBuilders[arg_22_1:GetType()]:Build(arg_22_1)

	table.insert(arg_22_0.unitList, var_22_0)

	if arg_22_1:IsPlayer() then
		arg_22_0.player = var_22_0
	end
end

function var_0_0.OnRemoveUnit(arg_23_0, arg_23_1)
	local var_23_0 = 0

	for iter_23_0, iter_23_1 in ipairs(arg_23_0.unitList or {}) do
		if iter_23_1.id == arg_23_1 then
			var_23_0 = iter_23_0

			break
		end
	end

	if var_23_0 > 0 then
		local var_23_1 = arg_23_0.unitList[var_23_0]

		table.removebyvalue(arg_23_0.unitList, var_23_1)
		var_23_1:Dispose()
	end
end

function var_0_0.OnRemoveSystemUnit(arg_24_0, arg_24_1)
	local var_24_0 = 0

	for iter_24_0, iter_24_1 in ipairs(arg_24_0.systemUnitList or {}) do
		if iter_24_1.id == arg_24_1 then
			var_24_0 = iter_24_0

			break
		end
	end

	if var_24_0 > 0 then
		local var_24_1 = arg_24_0.systemUnitList[var_24_0]

		table.removebyvalue(arg_24_0.systemUnitList, var_24_1)
		var_24_1:Dispose()
	end
end

function var_0_0.OnRemoveTypeUnit(arg_25_0, arg_25_1, arg_25_2)
	if arg_25_1 then
		arg_25_0:OnRemoveSystemUnit(arg_25_2)
	else
		arg_25_0:OnRemoveUnit(arg_25_2)
	end
end

function var_0_0.OnSceneInited(arg_26_0)
	IslandCameraMgr.instance:LookAt(arg_26_0.player._tf)

	for iter_26_0, iter_26_1 in ipairs(arg_26_0.unitList) do
		iter_26_1:Start()
	end

	for iter_26_2, iter_26_3 in ipairs(arg_26_0.systemUnitList) do
		iter_26_3:Start()
	end

	for iter_26_4, iter_26_5 in ipairs(arg_26_0.systems) do
		iter_26_5:Start()
	end

	arg_26_0.isInit = true
end

function var_0_0.IsInit(arg_27_0)
	return arg_27_0.isInit
end

function var_0_0.OnMoveUnit(arg_28_0, arg_28_1)
	if arg_28_1.isSystem then
		local var_28_0 = arg_28_0:GetSystemUnitModule(arg_28_1.id)

		if var_28_0 then
			var_28_0:SetDestination(arg_28_1.position, arg_28_1.speed)
		end
	else
		local var_28_1 = arg_28_0:GetUnitModule(arg_28_1.id)

		if var_28_1 then
			var_28_1:SetDestination(arg_28_1.position, arg_28_1.speed)
		end
	end
end

function var_0_0.OnStopUnit(arg_29_0, arg_29_1)
	if arg_29_1.isSystem then
		local var_29_0 = arg_29_0:GetSystemUnitModule(arg_29_1.id)

		if var_29_0 then
			var_29_0:StopMove()
		end
	else
		local var_29_1 = arg_29_0:GetUnitModule(arg_29_1.id)

		if var_29_1 then
			var_29_1:StopMove()
		end
	end
end

function var_0_0.OnInterActionBegin(arg_30_0)
	arg_30_0.player:StopMoveHandle()
	arg_30_0:GetSubView(IslandOpView):DisablePlayerOp()
end

function var_0_0.OnInterActionEnd(arg_31_0)
	arg_31_0:GetSubView(IslandOpView):EnablePlayerOp()
end

function var_0_0.OnShowInterActionPanel(arg_32_0, arg_32_1)
	arg_32_0.showInterObjId = arg_32_1.id

	arg_32_0.detectionSystem:CrossDetectionHandle(arg_32_1)
	arg_32_0:GetSubView(IslandOpView):ShowInterActionPanel(arg_32_1)
	arg_32_0:GetSubView(IslandSlotHudView):HandleHud(arg_32_1)
end

function var_0_0.OnHideInterActionPanel(arg_33_0, arg_33_1)
	if arg_33_0.showInterObjId ~= arg_33_1.id then
		return
	end

	arg_33_0.showInterObjId = nil

	arg_33_0:GetSubView(IslandOpView):HideInterActionPanel()
end

function var_0_0.OnTracking(arg_34_0, arg_34_1)
	local var_34_0 = arg_34_0:GetUnitModule(tonumber(arg_34_1.id))

	if not var_34_0 then
		return
	end

	arg_34_0:GetSubView(IslandOpView):SetTrackingTarget(arg_34_0.player, var_34_0)
end

function var_0_0.OnUnTracking(arg_35_0)
	arg_35_0:GetSubView(IslandOpView):CancelTracking()
end

function var_0_0.OnPlayerMove(arg_36_0, arg_36_1)
	arg_36_0.player:MoveHandle(arg_36_1.targetDir, arg_36_1.force)
end

function var_0_0.OnPlayerStopMove(arg_37_0)
	arg_37_0.player:StopMoveHandle()
end

function var_0_0.OnPlayerJump(arg_38_0)
	arg_38_0.player:JumpHandle()
end

function var_0_0.OnPlayerPlayerRun(arg_39_0)
	arg_39_0.player:PlayerRunHandle()
end

function var_0_0.OnPlayerPlayerSprint(arg_40_0)
	arg_40_0.player:OnPlayerPlayerSprint()
end

function var_0_0.OnStopPlayerSprint(arg_41_0)
	arg_41_0.player:OnStopPlayerSprint()
end

function var_0_0.DisableOp(arg_42_0)
	arg_42_0:GetSubView(IslandOpView):DisablePlayerOp()
	arg_42_0:GetSubView(IslandOpView):Hide()
end

function var_0_0.EnableOp(arg_43_0)
	arg_43_0:GetSubView(IslandOpView):EnablePlayerOp()
	arg_43_0:GetSubView(IslandOpView):Show()
end

function var_0_0.GetUnitModule(arg_44_0, arg_44_1)
	for iter_44_0, iter_44_1 in ipairs(arg_44_0.unitList or {}) do
		if iter_44_1.id == arg_44_1 then
			return iter_44_1
		end
	end

	return nil
end

function var_0_0.GetUnitList(arg_45_0)
	return arg_45_0.unitList or {}
end

function var_0_0.GetSystem(arg_46_0, arg_46_1)
	for iter_46_0, iter_46_1 in ipairs(arg_46_0.systems or {}) do
		if iter_46_1.id == arg_46_1 then
			return iter_46_1
		end
	end

	return nil
end

function var_0_0.GetSystemList(arg_47_0)
	return arg_47_0.systems
end

function var_0_0.GetSystemModule(arg_48_0, arg_48_1)
	for iter_48_0, iter_48_1 in ipairs(arg_48_0.systems or {}) do
		if iter_48_1.id == arg_48_1 then
			return iter_48_1
		end
	end

	return nil
end

function var_0_0.GetSystemUnitModule(arg_49_0, arg_49_1)
	for iter_49_0, iter_49_1 in ipairs(arg_49_0.systemUnitList or {}) do
		if iter_49_1.id == arg_49_1 then
			return iter_49_1
		end
	end

	return nil
end

function var_0_0.GetSystemUnitList(arg_50_0)
	return arg_50_0.systemUnitList
end

function var_0_0.OnPlayerPlant(arg_51_0)
	arg_51_0.detectionSystem:OnPlayerPlant()
end

function var_0_0.OnPlayerAreaChange(arg_52_0)
	arg_52_0.detectionSystem:SetAreaDetection()
end

function var_0_0.OnSyncInteraction(arg_53_0, arg_53_1, arg_53_2)
	arg_53_0:Emit(ISLAND_EVT.SYNC_INTERACTION, arg_53_1, arg_53_2)
end

function var_0_0.OnChangeDress(arg_54_0, arg_54_1)
	arg_54_0.player:OnChangeDress(arg_54_1)
end

function var_0_0.OnCreateSystemUnit(arg_55_0, arg_55_1)
	local var_55_0 = arg_55_0.unitBuilders[arg_55_1:GetType()]:Build(arg_55_1)

	table.insert(arg_55_0.systemUnitList, var_55_0)
end

function var_0_0.OnStartDelegation(arg_56_0, arg_56_1)
	local var_56_0 = arg_56_0:GetSystem(arg_56_1.build_id)

	if var_56_0 then
		var_56_0:StartDelegation(arg_56_1)
	end
end

function var_0_0.OnEndDelegation(arg_57_0, arg_57_1)
	local var_57_0 = arg_57_0:GetSystem(arg_57_1.build_id)

	if var_57_0 then
		var_57_0:EndDelegation(arg_57_1)
	end
end

function var_0_0.GetPlayerPosition(arg_58_0)
	return arg_58_0.player:GetCurrentPosition()
end

function var_0_0.GetUnitPosition(arg_59_0, arg_59_1)
	local var_59_0 = arg_59_0:GetUnitModule(arg_59_1)

	return var_59_0 and var_59_0._go.transform.position
end

function var_0_0.OnDispose(arg_60_0)
	for iter_60_0, iter_60_1 in ipairs(arg_60_0.systems or {}) do
		iter_60_1:Dispose()
	end

	arg_60_0.systems = nil

	for iter_60_2, iter_60_3 in ipairs(arg_60_0.systemUnitList or {}) do
		iter_60_3:Dispose()
	end

	arg_60_0.systemUnitList = nil

	for iter_60_4, iter_60_5 in ipairs(arg_60_0.views) do
		iter_60_5:Dispose()

		arg_60_0.views[iter_60_4] = nil
	end

	for iter_60_6, iter_60_7 in ipairs(arg_60_0.unitList or {}) do
		iter_60_7:Dispose()
	end

	arg_60_0.unitList = nil
	arg_60_0.player = nil
end

return var_0_0
