local var_0_0 = class("IslandOpView", import(".IslandBaseSubView"))

function var_0_0.GetUIName(arg_1_0)
	return "IslandOpUI"
end

function var_0_0.OnInit(arg_2_0, arg_2_1)
	arg_2_0.inputController = IslandCameraMgr.instance.gameObject:GetComponent(typeof(InputController))
	arg_2_0._go = arg_2_1
	arg_2_0._tf = arg_2_1.transform
	arg_2_0.interactionPanel = arg_2_0._tf:Find("interaction_btns")
	arg_2_0.interactionUIItemList = UIItemList.New(arg_2_0.interactionPanel, arg_2_0.interactionPanel:Find("interaction"))
	arg_2_0.opPanel = arg_2_0._tf:Find("op_btns")
	arg_2_0.plantBtn = arg_2_0.opPanel:Find("plant")
	arg_2_0.areaChangeBtn = arg_2_0.opPanel:Find("scope")
	arg_2_0.interactionBtnOther = arg_2_0.opPanel:Find("interaction")
	arg_2_0.syncInteractionBtn = arg_2_0.opPanel:Find("sync_interaction")
	arg_2_0.run = arg_2_0.opPanel:Find("run")
	arg_2_0.moveBtn = arg_2_0.opPanel:Find("move")

	setActive(arg_2_0.opPanel, true)

	arg_2_0.targetTracker = IslandTargetTracker.New(arg_2_0._tf)

	arg_2_0:ShowInterActionPanel({
		displayTpye = "normal",
		type = -1
	})
end

function var_0_0.ShowInterActionPanel(arg_3_0, arg_3_1)
	arg_3_0:UpdateInteractionBtns(arg_3_1)

	local var_3_0 = arg_3_1.displayTpye

	if var_3_0 then
		if var_3_0 == "plant" or var_3_0 == "collect" then
			setActive(arg_3_0.plantBtn, true)

			if var_3_0 == "plant" then
				onButton(arg_3_0, arg_3_0.plantBtn, function()
					arg_3_0:Emit(ISLAND_EVT.PLANT)
				end, SFX_PANEL)
				setActive(arg_3_0.areaChangeBtn, true)
			else
				onButton(arg_3_0, arg_3_0.plantBtn, function()
					pg.TipsMgr.GetInstance():ShowTips("开始采集,播放采集动作")
					arg_3_1.nearItem:StartColloct()
				end, SFX_PANEL)
				setActive(arg_3_0.areaChangeBtn, false)
			end

			setActive(arg_3_0.interactionBtnOther, false)
		else
			setActive(arg_3_0.plantBtn, false)
			setActive(arg_3_0.areaChangeBtn, false)
			setActive(arg_3_0.interactionBtnOther, false)
		end
	end

	onButton(arg_3_0, arg_3_0.areaChangeBtn, function()
		arg_3_0:Emit(ISLAND_EVT.AREACHANGE)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.run, function()
		return
	end, SFX_PANEL)
	setActive(arg_3_0.syncInteractionBtn, false)
	onButton(arg_3_0, arg_3_0.syncInteractionBtn, function()
		arg_3_0:Emit(ISLAND_EVT.SYNC_INTERACTION, IslandConst.SYNC_TYPE_INTERACTION_TEST, IslandConst.SYNC_TYPE_INTERACTION_TIME)
	end)
end

function var_0_0.UpdateInteractionBtns(arg_9_0, arg_9_1)
	local var_9_0 = arg_9_1.id
	local var_9_1 = IslandInteractionUntil.GetInteractionOptions(arg_9_1.type)

	arg_9_0.interactionUIItemList:make(function(arg_10_0, arg_10_1, arg_10_2)
		if arg_10_0 == UIItemList.EventUpdate then
			local var_10_0 = var_9_1[arg_10_1 + 1]

			onButton(arg_9_0, arg_10_2, function()
				if arg_9_1.callback then
					arg_9_1.callback()
				end

				IslandInteractionUntil.Response(arg_9_0, var_9_0, var_10_0.id)
			end, SFX_PANEL)
			setText(arg_10_2:Find("Text"), var_10_0.text)
		end
	end)
	arg_9_0.interactionUIItemList:align(#var_9_1)
end

function var_0_0.HideInterActionPanel(arg_12_0)
	arg_12_0.interactionUIItemList:align(0)
	removeOnButton(arg_12_0.plantBtn)
end

function var_0_0.DisablePlayerOp(arg_13_0)
	setActive(arg_13_0.opPanel, false)
	setActive(arg_13_0.interactionPanel, false)
	arg_13_0.inputController:DisablePlayerInput()
end

function var_0_0.EnablePlayerOp(arg_14_0)
	setActive(arg_14_0.opPanel, true)
	setActive(arg_14_0.interactionPanel, true)
	arg_14_0.inputController:EnablePlayerInput()
end

function var_0_0.SetTrackingTarget(arg_15_0, arg_15_1, arg_15_2)
	arg_15_0.targetTracker:Tracking(arg_15_1._go, arg_15_2._go)
end

function var_0_0.CancelTracking(arg_16_0)
	arg_16_0.targetTracker:UnTracking()
end

function var_0_0.OnDestroy(arg_17_0)
	pg.DelegateInfo.Dispose(arg_17_0)

	if arg_17_0.targetTracker then
		arg_17_0.targetTracker:Dispose()

		arg_17_0.targetTracker = nil
	end
end

return var_0_0
