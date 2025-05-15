local var_0_0 = class("AgoraController", import("Mod.Island.Core.controller.IslandController"))

function var_0_0.Init(arg_1_0)
	var_0_0.super.Init(arg_1_0)

	arg_1_0.agora = arg_1_0:CreateAgora(arg_1_0.island)
	arg_1_0.isEidting = false
	arg_1_0.selectedData = nil
	arg_1_0.sample = nil
end

function var_0_0.GetAgora(arg_2_0)
	return arg_2_0.agora
end

function var_0_0.SetUp(arg_3_0)
	var_0_0.super.SetUp(arg_3_0)
	arg_3_0:NotifiyAgora(ISLAND_AGORA_EVT.MAP_SIZE_UPDATE, arg_3_0.agora:GetSize())

	for iter_3_0, iter_3_1 in pairs(arg_3_0.agora:GetPlacedlist()) do
		arg_3_0:PlaceItem(iter_3_1.id, iter_3_1:GetPosition())
	end
end

function var_0_0.EnterEditMode(arg_4_0)
	arg_4_0.isEidting = true

	local var_4_0 = arg_4_0.agora:GetPlacedlist()

	arg_4_0.sample = Clone(var_4_0)

	arg_4_0:NotifiyAgora(ISLAND_AGORA_EVT.ENTER_EDIT)
	arg_4_0:NotifiyIsland(ISLAND_EX_EVT.ENTER_EDIT_AGORA)
end

function var_0_0.ExitEditMode(arg_5_0)
	arg_5_0.isEidting = false
	arg_5_0.sample = nil

	arg_5_0:NotifiyAgora(ISLAND_AGORA_EVT.EXIT_EDIT)
	arg_5_0:NotifiyIsland(ISLAND_EX_EVT.EXIT_EDIT_AGORA)
end

function var_0_0.Save(arg_6_0)
	if arg_6_0:AnySelected() then
		arg_6_0:UnSelectedItem()
	end

	arg_6_0:ExitEditMode()

	local var_6_0 = {}

	for iter_6_0, iter_6_1 in pairs(arg_6_0.agora:GetPlacedlist()) do
		table.insert(var_6_0, iter_6_1:ToPlacementData())
	end

	arg_6_0:NotifiyIsland(ISLAND_EX_EVT.SAVE_AGORA, var_6_0)
end

function var_0_0.ClearAll(arg_7_0)
	for iter_7_0, iter_7_1 in pairs(arg_7_0.agora:GetPlacedlist()) do
		arg_7_0:UnPlaceItem(iter_7_1.id)
	end
end

function var_0_0.Revert(arg_8_0)
	if not arg_8_0:AnyChanged() then
		return
	end

	arg_8_0:ClearAll()

	for iter_8_0, iter_8_1 in pairs(arg_8_0.sample) do
		arg_8_0:PlaceItem(iter_8_1.id, iter_8_1:GetPosition())
	end
end

function var_0_0.RevertAndExit(arg_9_0)
	arg_9_0:Revert()
	arg_9_0:ExitEditMode()
end

function var_0_0.AnyChanged(arg_10_0)
	if not arg_10_0.sample then
		return false
	end

	local var_10_0 = table.getCount(arg_10_0.sample)
	local var_10_1 = arg_10_0.agora:GetPlacedlist()

	if var_10_0 ~= table.getCount(var_10_1) then
		return true
	end

	for iter_10_0, iter_10_1 in pairs(arg_10_0.sample) do
		local var_10_2 = var_10_1[iter_10_0]

		if not var_10_2 or not var_10_2:IsSame(iter_10_1) then
			return true
		end
	end

	for iter_10_2, iter_10_3 in pairs(var_10_1) do
		local var_10_3 = arg_10_0.sample[iter_10_2]

		if not var_10_3 or not var_10_3:IsSame(iter_10_3) then
			return true
		end
	end

	return false
end

function var_0_0.Upgrade(arg_11_0)
	arg_11_0:NotifiyIsland(ISLAND_EX_EVT.UPGRADE_AGORA)
end

function var_0_0.SelectItem(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_0.agora:GetItemInPosition(arg_12_1)

	if not var_12_0 then
		return
	end

	if arg_12_0:AnySelected() then
		arg_12_0:UnSelectedItem()
	end

	arg_12_0:_SelectItem(var_12_0)
end

function var_0_0._SelectItem(arg_13_0, arg_13_1)
	arg_13_0.selectedData = {
		id = arg_13_1.id,
		position = arg_13_1:GetPosition(),
		dir = arg_13_1:GetRotation()
	}

	arg_13_0.agora:RemoveItem(arg_13_1)
	arg_13_0:NotifiyAgora(ISLAND_AGORA_EVT.SELECTED_ITEM, arg_13_0.selectedData.id)
end

function var_0_0.ConfirmSelectedItem(arg_14_0)
	if not arg_14_0:AnySelected() then
		return
	end

	local var_14_0 = arg_14_0.agora:GetPlaceableItem(arg_14_0.selectedData.id)

	if not arg_14_0.agora:IsEmptyArea(var_14_0:GetArea()) then
		pg.TipsMgr.GetInstance():ShowTips(i18n1("该位置已被占用"))

		return
	end

	arg_14_0:UnSelectedItem()
end

function var_0_0.UnSelectedItem(arg_15_0)
	if not arg_15_0:AnySelected() then
		return
	end

	local var_15_0 = arg_15_0.selectedData.id

	arg_15_0:NotifiyAgora(ISLAND_AGORA_EVT.ITEM_CLEAR_OCCUPIED, var_15_0)

	local var_15_1 = arg_15_0.agora:GetPlaceableItem(var_15_0)

	if not arg_15_0.agora:IsEmptyArea(var_15_1:GetArea()) then
		local var_15_2 = arg_15_0.selectedData.position
		local var_15_3 = arg_15_0.selectedData.dir

		var_15_1:UpdatePosition(var_15_2)
		var_15_1:UpdateRotation(var_15_3)
	end

	arg_15_0.agora:AddItem(var_15_1)

	arg_15_0.selectedData = nil

	arg_15_0:NotifiyAgora(ISLAND_AGORA_EVT.UNSELECTED_ITEM, var_15_0)
end

function var_0_0.BeginDragItem(arg_16_0)
	if not arg_16_0:AnySelected() then
		return
	end

	local var_16_0 = arg_16_0.agora:GetPlaceableItem(arg_16_0.selectedData.id)
end

function var_0_0.DragItem(arg_17_0, arg_17_1)
	if not arg_17_0:AnySelected() then
		return
	end

	local var_17_0 = arg_17_0.agora:GetPlaceableItem(arg_17_0.selectedData.id)

	var_17_0:UpdatePosition(arg_17_0.agora:ClampRange(arg_17_1.x, arg_17_1.y, var_17_0))

	local var_17_1 = var_17_0:GetArea()
	local var_17_2 = arg_17_0.agora:IsEmptyArea(var_17_1)

	arg_17_0:NotifiyAgora(ISLAND_AGORA_EVT.DRAG_ITEM, arg_17_0.selectedData.id, var_17_2)

	local var_17_3 = arg_17_0.agora:GetItemInArea(var_17_1)

	if var_17_3 then
		arg_17_0:NotifiyAgora(ISLAND_AGORA_EVT.ITEM_OCCUPIED, var_17_3.id)
	else
		arg_17_0:NotifiyAgora(ISLAND_AGORA_EVT.ITEM_CLEAR_OCCUPIED, var_17_0.id)
	end
end

function var_0_0.RotationItem(arg_18_0)
	if not arg_18_0:AnySelected() then
		return
	end

	arg_18_0.agora:GetPlaceableItem(arg_18_0.selectedData.id):Rotation()
end

function var_0_0.EndDragItem(arg_19_0, arg_19_1)
	arg_19_0:DragItem(arg_19_1)
end

function var_0_0.InterAction(arg_20_0, arg_20_1, arg_20_2, arg_20_3)
	local var_20_0 = arg_20_0.agora:GetPlacedItem(arg_20_1)

	if not var_20_0 then
		return
	end

	local var_20_1 = var_20_0:GetEmptySlot()

	if not var_20_1 then
		return
	end

	local function var_20_2()
		var_20_1:Lock(arg_20_2)
		arg_20_0:NotifiyAgora(ISLAND_AGORA_EVT.START_INTERACTION, var_20_0, var_20_1)
	end

	if arg_20_3 then
		var_20_2()
	else
		arg_20_0.islandSyncMgr:TryControlUnitAgora(arg_20_1, var_20_1.id, function(arg_22_0)
			if arg_22_0 then
				var_20_2()
			end
		end)
	end
end

function var_0_0.InterActionEnd(arg_23_0, arg_23_1, arg_23_2, arg_23_3)
	local var_23_0 = arg_23_0.agora:GetPlacedItem(arg_23_1)

	if not var_23_0 then
		return
	end

	local var_23_1 = var_23_0:GetUsingSlot(arg_23_2)

	if not var_23_1 then
		return
	end

	local function var_23_2()
		local var_24_0 = Clone(var_23_1)

		var_23_1:Release()
		arg_23_0:NotifiyAgora(ISLAND_AGORA_EVT.END_INTERACTION, var_23_0, var_24_0)

		local var_24_1 = arg_23_0.agora:GetPlaceableItem(arg_23_1).position
		local var_24_2 = arg_23_0.agora:FindEmptyArea4Item(var_24_1, AgoraPlaceableItem.New({}))

		if var_24_2 then
			arg_23_0:NotifiyCore(ISLAND_EVT.RESET_UNIT_POS, arg_23_2, var_24_2)
		end
	end

	if arg_23_3 then
		var_23_2()
	else
		arg_23_0.islandSyncMgr:EndControlUnitAgora(arg_23_1, var_23_1.id, function(arg_25_0)
			if arg_25_0 then
				var_23_2()
			end
		end)
	end
end

function var_0_0.PlaceItemRandonPosition(arg_26_0, arg_26_1)
	local var_26_0 = AgoraCalc.GetCenterMapPos()

	if not var_26_0 then
		return
	end

	if arg_26_0:AnySelected() then
		arg_26_0:UnSelectedItem()
	end

	local var_26_1 = arg_26_0.agora:GetPlaceableItem(arg_26_1)

	var_26_1:Clear()

	local var_26_2 = arg_26_0.agora:FindEmptyArea4Item(var_26_0, var_26_1)

	if not var_26_2 then
		return
	end

	arg_26_0:PlaceItem(arg_26_1, var_26_2)
	arg_26_0:_SelectItem(var_26_1)
end

function var_0_0.AnySelected(arg_27_0)
	return arg_27_0.selectedData ~= nil
end

function var_0_0.PlaceItem(arg_28_0, arg_28_1, arg_28_2)
	arg_28_0.agora:PlaceItem(arg_28_1, arg_28_2)
end

function var_0_0.UnPlaceItem(arg_29_0, arg_29_1)
	local var_29_0 = arg_29_1 or arg_29_0.selectedData and arg_29_0.selectedData.id

	if not var_29_0 then
		return
	end

	if arg_29_0:AnySelected() and arg_29_0.selectedData.id == var_29_0 then
		arg_29_0:UnSelectedItem()
	end

	arg_29_0.agora:UnPlaceItem(var_29_0)
end

function var_0_0.NotifiyAgora(arg_30_0, arg_30_1, ...)
	arg_30_0.agora:DispatchEvent(arg_30_1, ...)
end

function var_0_0.AddListeners(arg_31_0)
	var_0_0.super.AddListeners(arg_31_0)
	arg_31_0:AddIslandListener(IslandAgoraAgency.AGORA_UPGRADE, arg_31_0.OnAgoraUpdate)
	arg_31_0:AddIslandListener(IslandAgoraAgency.ADD_PLACEMENT, arg_31_0.OnAddFurniture)
	arg_31_0:AddIslandListener(IslandAgoraAgency.DELETE_PLACEMENT, arg_31_0.OnDeleteFurniture)
end

function var_0_0.RemoveListeners(arg_32_0)
	var_0_0.super.RemoveListeners(arg_32_0)
	arg_32_0:RemoveIslandListener(IslandAgoraAgency.AGORA_UPGRADE, arg_32_0.OnAgoraUpdate)
	arg_32_0:RemoveIslandListener(IslandAgoraAgency.ADD_PLACEMENT, arg_32_0.OnAddFurniture)
	arg_32_0:RemoveIslandListener(IslandAgoraAgency.DELETE_PLACEMENT, arg_32_0.OnDeleteFurniture)
end

function var_0_0.OnAddFurniture(arg_33_0, arg_33_1)
	assert(not arg_33_0.isEidting)

	local var_33_0 = math.floor((arg_33_1.id - 1) * 0.01)
	local var_33_1 = AgoraFurniture.New({
		id = arg_33_1.id,
		configId = var_33_0,
		dir = arg_33_1:GetRotation()
	})

	arg_33_0.agora:AddPlaceableList(var_33_1)
	arg_33_0:PlaceItem(var_33_1.id, arg_33_1:GetPosition())
end

function var_0_0.OnDeleteFurniture(arg_34_0, arg_34_1)
	assert(not arg_34_0.isEidting)
	arg_34_0:UnPlaceItem(arg_34_1)
end

function var_0_0.OnAgoraUpdate(arg_35_0, arg_35_1)
	local var_35_0 = IslandConst.AGORA_LEVEL_2_SIZE[arg_35_1]

	arg_35_0.agora:UpdateSize(Vector2(var_35_0, var_35_0))
end

function var_0_0.CreateAgora(arg_36_0, arg_36_1)
	local var_36_0 = arg_36_1:GetAgoraAgency()
	local var_36_1 = {}

	for iter_36_0, iter_36_1 in ipairs(var_36_0:GetFurnitures()) do
		for iter_36_2 = 1, iter_36_1.count do
			local var_36_2 = iter_36_1.id * 100 + iter_36_2
			local var_36_3 = AgoraFurniture.New({
				id = var_36_2,
				configId = iter_36_1.id
			})

			var_36_1[var_36_3.id] = var_36_3
		end
	end

	local var_36_4 = {}

	for iter_36_3, iter_36_4 in ipairs(var_36_0:GetPlacedList()) do
		local var_36_5 = var_36_1[iter_36_4.id]

		if var_36_5 then
			var_36_5:FlushDataFromPlacementData(iter_36_4)

			var_36_4[iter_36_4.id] = var_36_5
		end
	end

	local var_36_6 = var_36_0:GetLevel()
	local var_36_7 = math.clamp(var_36_6, 1, #IslandConst.AGORA_LEVEL_2_SIZE)
	local var_36_8 = IslandConst.AGORA_LEVEL_2_SIZE[var_36_7]

	return (Agora.New({
		size = Vector2(var_36_8, var_36_8),
		placeableList = var_36_1,
		placedlist = var_36_4
	}))
end

return var_0_0
