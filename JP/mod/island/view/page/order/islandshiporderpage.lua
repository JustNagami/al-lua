local var_0_0 = class("IslandShipOrderPage", import("...base.IslandBasePage"))

var_0_0.MODE_REQUEST_VIEW = 0
var_0_0.MODE_AWARD_VIEW = 1

function var_0_0.getUIName(arg_1_0)
	return "IslandShipOrderUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.backBtn = arg_2_0:findTF("back")
	arg_2_0.uiSlots = UIItemList.New(arg_2_0:findTF("frame/list"), arg_2_0:findTF("frame/list/tpl"))
	arg_2_0.switchBtn = arg_2_0:findTF("frame/switch")
	arg_2_0.cards = {}
	arg_2_0.loadUpPage = IslandShipOrderLoadUpPage.New(arg_2_0._tf, arg_2_0.event)

	setText(arg_2_0:findTF("frame/switch/on/Text"), i18n1("查看清单需求"))
	setText(arg_2_0:findTF("frame/switch/off/Text"), i18n1("查看订单奖励"))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0.backBtn, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	triggerToggle(arg_3_0.switchBtn, false)
	onToggle(arg_3_0, arg_3_0.switchBtn, function(arg_5_0)
		arg_3_0:SwitchMode(arg_5_0)
	end, SFX_PANEL)
end

function var_0_0.AddListeners(arg_6_0)
	arg_6_0:AddListener(GAME.ISLAND_SHIP_ORDER_OP_DONE, arg_6_0.OnOrderUpdate)
end

function var_0_0.RemoveListeners(arg_7_0)
	arg_7_0:RemoveListener(GAME.ISLAND_SHIP_ORDER_OP_DONE, arg_7_0.OnOrderUpdate)
end

function var_0_0.OnOrderUpdate(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_1.id
	local var_8_1

	for iter_8_0, iter_8_1 in pairs(arg_8_0.cards) do
		if iter_8_1.slot.id == var_8_0 then
			var_8_1 = iter_8_1

			break
		end
	end

	if not var_8_1 then
		return
	end

	arg_8_0:ClearSelected()
	seriesAsync({
		function(arg_9_0)
			if not arg_8_1.isLoadUpAll then
				arg_9_0()

				return
			end

			var_8_1:PlaySignAnim(arg_9_0)
		end
	}, function()
		var_8_1:Flush(var_8_1.slot, arg_8_0.mode)
	end)
end

function var_0_0.OnShow(arg_11_0)
	arg_11_0.mode = var_0_0.MODE_REQUEST_VIEW

	arg_11_0:FlushSlots()
end

function var_0_0.SwitchMode(arg_12_0, arg_12_1)
	arg_12_0.mode = arg_12_1 and var_0_0.MODE_AWARD_VIEW or var_0_0.MODE_REQUEST_VIEW

	for iter_12_0, iter_12_1 in pairs(arg_12_0.cards) do
		iter_12_1:SwitchMode(iter_12_1.slot, arg_12_0.mode)
	end

	arg_12_0:ClearSelected()
end

function var_0_0.FlushSlots(arg_13_0)
	local var_13_0 = getProxy(IslandProxy):GetIsland():GetOrderAgency():GetShipSlotList()
	local var_13_1 = {}

	for iter_13_0, iter_13_1 in pairs(var_13_0) do
		table.insert(var_13_1, iter_13_1)
	end

	table.sort(var_13_1, function(arg_14_0, arg_14_1)
		return arg_14_0:GetUnlockLevel() < arg_14_1:GetUnlockLevel()
	end)
	arg_13_0.uiSlots:make(function(arg_15_0, arg_15_1, arg_15_2)
		if arg_15_0 == UIItemList.EventUpdate then
			arg_13_0:UpdateSlot(var_13_1[arg_15_1 + 1], arg_15_2)
		end
	end)
	arg_13_0.uiSlots:align(#var_13_1)
end

function var_0_0.UpdateSlot(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = arg_16_0.cards[arg_16_2] or IslandShipOrderCard.New(arg_16_2)

	var_16_0:Flush(arg_16_1, arg_16_0.mode)
	onButton(arg_16_0, var_16_0.getBtn, function()
		arg_16_0:emit(IslandMediator.GET_SHIP_ORDER_AWARD, var_16_0.slot.id)
	end, SFX_PANEL)
	onButton(arg_16_0, var_16_0.lockTr, function()
		arg_16_0:emit(IslandMediator.UNLOKC_SHIP_ORDER, var_16_0.slot.id)
	end, SFX_PANEL)

	local function var_16_1(arg_19_0)
		if arg_16_0.loadUpItem == arg_19_0 then
			arg_16_0:ClearSelected()

			return false
		end

		return true
	end

	local function var_16_2()
		var_16_0.uiRequestList:each(function(arg_21_0, arg_21_1)
			onButton(arg_16_0, arg_21_1, function()
				if not var_16_0.slot:IsWaiting() then
					return
				end

				if var_16_0.slot:GetOrder():ItemIsSubmited(arg_21_0 + 1) then
					return
				end

				if not var_16_1(arg_21_1) then
					return
				end

				arg_16_0:ClearSelected()
				setActive(arg_21_1:Find("loaded_1"), true)
				arg_16_0:LoadUpItem(var_16_0, arg_21_0 + 1, arg_21_1)
			end, SFX_PANEL)
		end)
	end

	onNextTick(var_16_2)

	arg_16_0.cards[arg_16_2] = var_16_0
end

function var_0_0.ClearSelected(arg_23_0)
	if arg_23_0.loadUpItem then
		setActive(arg_23_0.loadUpItem:Find("loaded_1"), false)
	end

	arg_23_0.loadUpItem = nil

	if arg_23_0.loadUpPage and arg_23_0.loadUpPage:GetLoaded() and arg_23_0.loadUpPage:isShowing() then
		arg_23_0.loadUpPage:Hide()
	end
end

function var_0_0.LoadUpItem(arg_24_0, arg_24_1, arg_24_2, arg_24_3)
	local var_24_0 = arg_24_0._tf:InverseTransformPoint(arg_24_3:Find("loaded_1").position)

	arg_24_0.loadUpPage:ExecuteAction("Show", Vector3(var_24_0.x, var_24_0.y - 60, 0), arg_24_1.slot, arg_24_2)

	arg_24_0.loadUpItem = arg_24_3
end

function var_0_0.OnHide(arg_25_0)
	arg_25_0:ClearSelected()

	if arg_25_0.loadUpPage then
		arg_25_0.loadUpPage:Destroy()
		arg_25_0.loadUpPage:Reset()
	end
end

function var_0_0.OnDestroy(arg_26_0)
	for iter_26_0, iter_26_1 in pairs(arg_26_0.cards) do
		iter_26_1:Dispose()
	end

	arg_26_0.cards = {}

	if arg_26_0.loadUpPage then
		arg_26_0.loadUpPage:Destroy()

		arg_26_0.loadUpPage = nil
	end
end

return var_0_0
