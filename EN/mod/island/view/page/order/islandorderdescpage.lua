local var_0_0 = class("IslandOrderDescPage", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandOrderDescUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.infoPanel = arg_2_0:findTF("info")
	arg_2_0.nameTxt = arg_2_0:findTF("info/name/Text"):GetComponent(typeof(Text))
	arg_2_0.consumeUIList = UIItemList.New(arg_2_0:findTF("info/subtitle_item/list"), arg_2_0:findTF("info/subtitle_item/list/tpl"))
	arg_2_0.awardUIList = UIItemList.New(arg_2_0:findTF("info/subtitle_reward/list"), arg_2_0:findTF("info/subtitle_reward/list/tpl"))
	arg_2_0.submitBtn = arg_2_0:findTF("info/btns/submit")
	arg_2_0.submitBtnMark = arg_2_0:findTF("info/btns/submit/mask")
	arg_2_0.replaceBtn = arg_2_0:findTF("info/btns/cancel")
	arg_2_0.loadingPanel = arg_2_0:findTF("loading")
	arg_2_0.loadingTimeTxt = arg_2_0.loadingPanel:Find("Text/time"):GetComponent(typeof(Text))

	setText(arg_2_0:findTF("info/btns/cancel/Text"), i18n1("驳回"))
	setText(arg_2_0:findTF("info/btns/submit/Text"), i18n1("交付"))
	setText(arg_2_0:findTF("loading/Text"), i18n1("订单正在重新准备中\n新的订单预计还需要                      "))
	setText(arg_2_0:findTF("loading/submit/Text"), i18n1("加速"))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0.replaceBtn, function()
		arg_3_0:emit(IslandMediator.ON_REPLACE_ORDER, arg_3_0.slot.id)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.submitBtn, function()
		if not getProxy(IslandProxy):GetIsland():GetOrderAgency():CanSubmitOrder() then
			return
		end

		arg_3_0:emit(IslandMediator.ON_SUBMIT_ORDER, arg_3_0.slot.id)
	end, SFX_PANEL)
end

function var_0_0.AddListeners(arg_6_0)
	arg_6_0:AddListener(GAME.ISLAND_SUBMIT_ORDER_DONE, arg_6_0.OnSubmitOrder)
	arg_6_0:AddListener(GAME.ISLAND_REPLACE_ORDER_DONE, arg_6_0.OnReplaceOrder)
	arg_6_0:AddListener(IslandOrderAgency.GEN_NEW_ORDER, arg_6_0.OnGenNewOrder)
	arg_6_0:AddListener(IslandOrderAgency.UDPATE_ORDER, arg_6_0.OnFlushOrder)
end

function var_0_0.RemoveListener(arg_7_0)
	arg_7_0:RemoveListener(GAME.ISLAND_SUBMIT_ORDER_DONE, arg_7_0.OnSubmitOrder)
	arg_7_0:RemoveListener(GAME.ISLAND_REPLACE_ORDER_DONE, arg_7_0.OnReplaceOrder)
	arg_7_0:RemoveListener(IslandOrderAgency.GEN_NEW_ORDER, arg_7_0.OnGenNewOrder)
	arg_7_0:RemoveListener(IslandOrderAgency.UDPATE_ORDER, arg_7_0.OnFlushOrder)
end

function var_0_0.OnSubmitOrder(arg_8_0, arg_8_1)
	local var_8_0 = getProxy(IslandProxy):GetIsland():GetOrderAgency():GetSlot(arg_8_1.slotId)

	arg_8_0:Flush(var_8_0)
end

function var_0_0.OnReplaceOrder(arg_9_0, arg_9_1)
	local var_9_0 = getProxy(IslandProxy):GetIsland():GetOrderAgency():GetSlot(arg_9_1.slotId)

	arg_9_0:Flush(var_9_0)
end

function var_0_0.OnFlushOrder(arg_10_0, arg_10_1)
	arg_10_0:TryFlushOrderInfo(arg_10_1.slotId)
end

function var_0_0.OnGenNewOrder(arg_11_0, arg_11_1)
	arg_11_0:TryFlushOrderInfo(arg_11_1.slotId)
end

function var_0_0.TryFlushOrderInfo(arg_12_0, arg_12_1)
	local var_12_0 = getProxy(IslandProxy):GetIsland():GetOrderAgency():GetSlot(arg_12_1)

	if not arg_12_0.slot then
		return
	end

	if arg_12_0.slot.id ~= var_12_0.id then
		return
	end

	arg_12_0:Flush(var_12_0)
end

function var_0_0.Show(arg_13_0, arg_13_1)
	var_0_0.super.Show(arg_13_0)
	arg_13_0:Flush(arg_13_1)
end

function var_0_0.Flush(arg_14_0, arg_14_1)
	arg_14_0.slot = arg_14_1

	if not arg_14_1 or arg_14_1:IsEmpty() then
		arg_14_0:Hide()

		return
	end

	local var_14_0 = arg_14_1:IsLoading()

	setActive(arg_14_0.infoPanel, not var_14_0)
	setActive(arg_14_0.loadingPanel, var_14_0)
	arg_14_0:RemoveSubmitCdTimer()
	arg_14_0:RemoveLoadingTimer()
	arg_14_0:RemoveDisappearTimer()

	if var_14_0 then
		arg_14_0:FlushLoadingPanel(arg_14_1)
	else
		arg_14_0:FlusInfoPanel(arg_14_1)
	end

	if arg_14_1:GetOrder():IsUrgency() then
		arg_14_0:AddDisappearTimer(arg_14_1)
	end
end

function var_0_0.AddDisappearTimer(arg_15_0, arg_15_1)
	arg_15_0:RemoveDisappearTimer()

	local var_15_0 = arg_15_1:GetDisappearTime()

	if var_15_0 <= pg.TimeMgr.GetInstance():GetServerTime() then
		arg_15_0:Hide()

		return
	end

	arg_15_0.disappearTimer = Timer.New(function()
		local var_16_0 = pg.TimeMgr.GetInstance():GetServerTime()

		if var_15_0 - var_16_0 < 0 then
			arg_15_0:Hide()
		end
	end, 1, -1)

	arg_15_0.disappearTimer.func()
	arg_15_0.disappearTimer:Start()
end

function var_0_0.RemoveDisappearTimer(arg_17_0)
	if arg_17_0.disappearTimer then
		arg_17_0.disappearTimer:Stop()

		arg_17_0.disappearTimer = nil
	end
end

function var_0_0.FlushLoadingPanel(arg_18_0, arg_18_1)
	local function var_18_0()
		arg_18_0.loadingTimeTxt.text = ""

		arg_18_0:Flush(arg_18_1)
	end

	local var_18_1 = arg_18_1:GetCanSubmitTime()

	if var_18_1 <= pg.TimeMgr.GetInstance():GetServerTime() then
		var_18_0()

		return
	end

	arg_18_0.loadingTimer = Timer.New(function()
		local var_20_0 = pg.TimeMgr.GetInstance():GetServerTime()
		local var_20_1 = var_18_1 - var_20_0

		arg_18_0.loadingTimeTxt.text = pg.TimeMgr.GetInstance():DescCDTime(var_20_1)

		if var_20_1 < 0 then
			arg_18_0:RemoveLoadingTimer()
			var_18_0()
		end
	end, 1, -1)

	arg_18_0.loadingTimer:Start()
	arg_18_0.loadingTimer.func()
end

function var_0_0.RemoveLoadingTimer(arg_21_0)
	if arg_21_0.loadingTimer then
		arg_21_0.loadingTimer:Stop()

		arg_21_0.loadingTimer = nil
	end
end

function var_0_0.FlusInfoPanel(arg_22_0, arg_22_1)
	local var_22_0 = arg_22_1:GetOrder()

	arg_22_0:FlushAwards(var_22_0)
	arg_22_0:FlushConsume(var_22_0)
	setActive(arg_22_0.replaceBtn, not var_22_0:IsUrgency())

	arg_22_0.nameTxt.text = var_22_0:GetRoleName()

	local var_22_1, var_22_2 = getProxy(IslandProxy):GetIsland():GetOrderAgency():CanSubmitOrder()

	setActive(arg_22_0.submitBtnMark, not var_22_0:CanFinish())

	if var_22_1 then
		arg_22_0:SetMaskFillAmount(arg_22_0.submitBtnMark, 1)

		return
	end

	local var_22_3 = pg.island_set.order_complete_refresh_time.key_value_int

	arg_22_0.submitTimer = Timer.New(function()
		local var_23_0 = pg.TimeMgr.GetInstance():GetServerTime()
		local var_23_1 = (var_22_2 - var_23_0) / var_22_3

		arg_22_0:SetMaskFillAmount(arg_22_0.submitBtnMark, 1 - var_23_1)

		if var_23_1 <= 0 then
			arg_22_0:RemoveSubmitCdTimer()
		end
	end, 1, -1)

	arg_22_0.submitTimer:Start()
	arg_22_0.submitTimer.func()
end

function var_0_0.SetMaskFillAmount(arg_24_0, arg_24_1, arg_24_2)
	local var_24_0 = arg_24_1:GetComponent(typeof(RectMask2D))
	local var_24_1 = arg_24_1.sizeDelta.x * arg_24_2

	var_24_0.padding = Vector4(var_24_1, 0, 0, 0)
end

function var_0_0.FlushAwards(arg_25_0, arg_25_1)
	local var_25_0 = arg_25_1:GetDisplayAwards()

	arg_25_0.awardUIList:make(function(arg_26_0, arg_26_1, arg_26_2)
		if arg_26_0 == UIItemList.EventUpdate then
			local var_26_0 = var_25_0[arg_26_1 + 1]

			updateDrop(arg_26_2, var_26_0)
		end
	end)
	arg_25_0.awardUIList:align(#var_25_0)
end

function var_0_0.FlushConsume(arg_27_0, arg_27_1)
	local var_27_0 = arg_27_1:GetConsume()

	arg_27_0.consumeUIList:make(function(arg_28_0, arg_28_1, arg_28_2)
		if arg_28_0 == UIItemList.EventUpdate then
			local var_28_0 = var_27_0[arg_28_1 + 1]
			local var_28_1 = {
				count = 0,
				type = var_28_0.type,
				id = var_28_0.id
			}

			updateDrop(arg_28_2:Find("tpl"), var_28_1)
			setText(arg_28_2:Find("Text"), var_28_1.cfg.name)

			local var_28_2 = Drop.New({
				type = var_28_1.type,
				id = var_28_1.id
			}):getOwnedCount()
			local var_28_3 = var_28_2 >= var_28_0.count

			if var_28_3 then
				setText(arg_28_2:Find("count"), var_28_2 .. "/" .. var_28_0.count)
			else
				setText(arg_28_2:Find("count"), setColorStr(var_28_2, COLOR_RED) .. "/" .. var_28_0.count)
			end

			setActive(arg_28_2:Find("finish"), var_28_3)
			setActive(arg_28_2:Find("line"), arg_28_1 + 1 ~= #var_27_0)
		end
	end)
	arg_27_0.consumeUIList:align(#var_27_0)
end

function var_0_0.RemoveSubmitCdTimer(arg_29_0)
	if arg_29_0.submitTimer then
		arg_29_0.submitTimer:Stop()

		arg_29_0.submitTimer = nil
	end
end

function var_0_0.OnDestroy(arg_30_0)
	arg_30_0:RemoveSubmitCdTimer()
	arg_30_0:RemoveLoadingTimer()
	arg_30_0:RemoveDisappearTimer()
end

return var_0_0
