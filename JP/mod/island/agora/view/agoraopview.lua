local var_0_0 = class("AgoraOpView", import("Mod.Island.Core.View.IslandOpView"))

function var_0_0.GetUIName(arg_1_0)
	return "IslandAgoraOpUI"
end

function var_0_0.OnInit(arg_2_0, arg_2_1)
	var_0_0.super.OnInit(arg_2_0, arg_2_1)

	arg_2_0.agoraPanel = arg_2_0._tf:Find("agora_op_btns")
	arg_2_0.agoraOpBtn = arg_2_0.agoraPanel:Find("agora")
	arg_2_0.lookBtn = arg_2_0._tf:Find("look")
	arg_2_0.moveBtn = arg_2_0._tf:Find("move")
	arg_2_0.agoraMoveBtn = arg_2_0.agoraPanel:Find("move")
	arg_2_0.agoraMoveDirTr = arg_2_0._tf:Find("agora_op_btns/move/Area/dir")
	arg_2_0.dragBtn = arg_2_0.agoraPanel:Find("drag")
	arg_2_0.confirmBtn = arg_2_0.dragBtn:Find("ok")
	arg_2_0.removeBtn = arg_2_0.dragBtn:Find("cancel")
	arg_2_0.rotationBtn = arg_2_0.dragBtn:Find("rotation")
	arg_2_0.testBtn = arg_2_0._tf:Find("test")
	arg_2_0.testCancelBtn = arg_2_0._tf:Find("test_1")

	onButton(arg_2_0, arg_2_0.agoraOpBtn, function()
		arg_2_0:Op("EnterEditMode")
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.testBtn, function()
		arg_2_0:Op("InterAction", 6000101, 3)
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.testCancelBtn, function()
		arg_2_0:Op("InterActionEnd", 6000101, 3)
	end, SFX_PANEL)
	setActive(arg_2_0.agoraOpBtn, arg_2_0:IsSelfIsland())

	arg_2_0.isDraging = false
end

function var_0_0.OnUpdate(arg_6_0)
	var_0_0.super.OnUpdate(arg_6_0)

	if arg_6_0.activeMould and not arg_6_0.isDraging then
		arg_6_0:UpdateDragPosition(arg_6_0.activeMould)
	end
end

function var_0_0.ActiveDragBtn(arg_7_0, arg_7_1)
	arg_7_0:UpdateDragPosition(arg_7_1)
	arg_7_0:AddDraglistener(arg_7_1)

	arg_7_0.activeMould = arg_7_1
end

function var_0_0.InActiveDragBtn(arg_8_0)
	arg_8_0.activeMould = nil
	arg_8_0.isDraging = false
	arg_8_0.dragBtn.localPosition = Vector3(10000, 10000, 0)

	arg_8_0:RemoveDraglistener()
end

function var_0_0.UpdateDragPosition(arg_9_0, arg_9_1)
	local var_9_0 = arg_9_1.root.position
	local var_9_1 = AgoraCalc.WorldPosition2ScreenPosition(var_9_0)
	local var_9_2 = AgoraCalc.ScreenPosition2LocalPosition(arg_9_0.dragBtn.parent, var_9_1)

	arg_9_0.dragBtn.localPosition = var_9_2
end

function var_0_0.AddDraglistener(arg_10_0, arg_10_1)
	local var_10_0 = GetOrAddComponent(arg_10_0.dragBtn, typeof(EventTriggerListener))

	var_10_0:AddBeginDragFunc(function(arg_11_0, arg_11_1)
		arg_10_0.isDraging = true

		arg_10_0:Op("BeginDragItem")
	end)
	var_10_0:AddDragFunc(function(arg_12_0, arg_12_1)
		local var_12_0 = AgoraCalc.ScreenPostion2MapPosition(arg_12_1.position)

		arg_10_0:Op("DragItem", var_12_0)
		arg_10_0:UpdateDragPosition(arg_10_1)
	end)
	var_10_0:AddDragEndFunc(function(arg_13_0, arg_13_1)
		local var_13_0 = AgoraCalc.ScreenPostion2MapPosition(arg_13_1.position)

		arg_10_0:Op("EndDragItem", var_13_0)
		arg_10_0:UpdateDragPosition(arg_10_1)

		arg_10_0.isDraging = false
	end)
	onButton(arg_10_0, arg_10_0.confirmBtn, function()
		arg_10_0:Op("ConfirmSelectedItem")
	end, SFX_PANEL)
	onButton(arg_10_0, arg_10_0.removeBtn, function()
		arg_10_0:Op("UnPlaceItem")
	end, SFX_PANEL)
	onButton(arg_10_0, arg_10_0.rotationBtn, function()
		arg_10_0:Op("RotationItem")
	end, SFX_PANEL)
end

function var_0_0.RemoveDraglistener(arg_17_0)
	local var_17_0 = GetOrAddComponent(arg_17_0.dragBtn, typeof(EventTriggerListener))

	var_17_0:AddBeginDragFunc(nil)
	var_17_0:AddDragFunc(nil)
	var_17_0:AddDragEndFunc(nil)
	removeOnButton(arg_17_0.confirmBtn)
	removeOnButton(arg_17_0.removeBtn)
	removeOnButton(arg_17_0.removeBtn)
end

function var_0_0.OnClick(arg_18_0, arg_18_1)
	local var_18_0 = AgoraCalc.ScreenPostion2MapPosition(arg_18_1)

	arg_18_0:Op("SelectItem", var_18_0)
end

function var_0_0.EnableAgoraOp(arg_19_0)
	setActive(arg_19_0.agoraOpBtn, false)
	setActive(arg_19_0.moveBtn, false)
	setActive(arg_19_0.agoraMoveBtn, true)
	arg_19_0.inputController:ActivePlayerActionMap(IslandConst.AGORA_INPUT_INDEX)
	arg_19_0:AddClickListener()
end

function var_0_0.DisableAgoraOp(arg_20_0)
	setActive(arg_20_0.agoraOpBtn, true)
	setActive(arg_20_0.moveBtn, true)
	setActive(arg_20_0.agoraMoveBtn, false)
	arg_20_0.inputController:ActivePlayerActionMap(IslandConst.PLAYER_INPUT_INDEX)
	arg_20_0:RemoveClickListener()
end

function var_0_0.Disable(arg_21_0)
	setActive(arg_21_0.lookBtn, false)
	setActive(arg_21_0.moveBtn, false)
	setActive(arg_21_0.opPanel, false)
	setActive(arg_21_0.agoraPanel, false)
end

function var_0_0.Enable(arg_22_0)
	setActive(arg_22_0.lookBtn, true)
	setActive(arg_22_0.moveBtn, true)
	setActive(arg_22_0.opPanel, true)
	setActive(arg_22_0.agoraPanel, true)
end

function var_0_0.AddClickListener(arg_23_0)
	local var_23_0 = GetOrAddComponent(arg_23_0.lookBtn, typeof(EventTriggerListener))
	local var_23_1

	var_23_0:AddPointDownFunc(function(arg_24_0, arg_24_1)
		var_23_1 = arg_24_1.position
	end)
	var_23_0:AddPointUpFunc(function(arg_25_0, arg_25_1)
		if not var_23_1 or var_23_1 ~= arg_25_1.position then
			return
		end

		arg_23_0:OnClick(arg_25_1.position)

		var_23_1 = nil
	end)
end

function var_0_0.RemoveClickListener(arg_26_0)
	local var_26_0 = arg_26_0.lookBtn:GetComponent(typeof(EventTriggerListener))

	if var_26_0 then
		var_26_0:AddPointDownFunc(nil)
		var_26_0:AddPointUpFunc(nil)
		RemoveComponent(arg_26_0.lookBtn, "EventTriggerListener")
	end
end

function var_0_0.OnDestroy(arg_27_0)
	var_0_0.super.OnDestroy(arg_27_0)
	arg_27_0:RemoveClickListener()
	arg_27_0:RemoveDraglistener()
end

return var_0_0
