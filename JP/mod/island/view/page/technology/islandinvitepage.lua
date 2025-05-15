local var_0_0 = class("IslandInvitePage", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandInviteUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.contentText = arg_2_0._tf:Find("Text")
	arg_2_0.prevBtn = arg_2_0._tf:Find("bottom/left_arr")
	arg_2_0.nextBtn = arg_2_0._tf:Find("bottom/right_arr")
	arg_2_0.scrollrect = arg_2_0._tf:Find("bottom/scroll"):GetComponent("LScrollRect")
	arg_2_0.scrollrect.isNewLoadingMethod = true

	function arg_2_0.scrollrect.onInitItem(arg_3_0)
		arg_2_0:OnInitItem(arg_3_0)
	end

	function arg_2_0.scrollrect.onUpdateItem(arg_4_0, arg_4_1)
		arg_2_0:OnUpdateItem(arg_4_0, arg_4_1)
	end
end

function var_0_0.OnInit(arg_5_0)
	onButton(arg_5_0, arg_5_0._tf:Find("top/back"), function()
		arg_5_0:Hide()
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0._tf:Find("top/home"), function()
		arg_5_0:emit(BaseUI.ON_HOME)
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.prevBtn, function()
		arg_5_0:OnPrev()
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.nextBtn, function()
		arg_5_0:OnNext()
	end, SFX_PANEL)

	arg_5_0.cards = {}

	arg_5_0:Flush()
end

function var_0_0.AddListeners(arg_10_0)
	arg_10_0:AddListener(IslandCharacterAgency.ADD_SHIP, arg_10_0.Flush)
end

function var_0_0.RemoveListeners(arg_11_0)
	arg_11_0:RemoveListener(IslandCharacterAgency.ADD_SHIP, arg_11_0.Flush)
end

function var_0_0.Flush(arg_12_0)
	arg_12_0.triggerFirstCard = true
	arg_12_0.displays = {}

	for iter_12_0, iter_12_1 in ipairs(pg.island_ship.all) do
		if IslandShip.StaticCanUnlock(iter_12_1) then
			table.insert(arg_12_0.displays, iter_12_1)
		end
	end

	arg_12_0.scrollrect:SetTotalCount(#arg_12_0.displays, 0)
end

function var_0_0.OnInitItem(arg_13_0, arg_13_1)
	local var_13_0 = IslandInviteShipCard.New(arg_13_1)

	onButton(arg_13_0, var_13_0.frameTF, function()
		for iter_14_0, iter_14_1 in pairs(arg_13_0.cards) do
			iter_14_1:UpdateSelected(nil)
		end

		arg_13_0.selectedId = var_13_0.configId

		var_13_0:UpdateSelected(arg_13_0.selectedId)
		setText(arg_13_0.contentText, "目前选中的是:" .. pg.island_ship[arg_13_0.selectedId].name)
	end, SFX_PANEL)
	arg_13_0:AddDrag(var_13_0.frameTF, function()
		local var_15_0 = IslandShip.StaticGetUnlockItemId(var_13_0.configId)

		if not var_15_0 then
			return
		end

		local var_15_1 = pg.island_item_data_template[var_15_0].name
		local var_15_2 = pg.island_ship[var_13_0.configId].name

		arg_13_0:ShowMsgBox({
			content = i18n1("消耗" .. var_15_1 .. "X1，邀请" .. var_15_2 .. "\n加入队伍,是否确定？"),
			onYes = function()
				arg_13_0:emit(IslandMediator.ON_USE_ITEM, var_15_0, 1)
			end
		})
	end)

	arg_13_0.cards[arg_13_1] = var_13_0
end

function var_0_0.OnUpdateItem(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = arg_17_0.cards[arg_17_2]

	if not var_17_0 then
		arg_17_0:OnInitItem(arg_17_2)

		var_17_0 = arg_17_0.cards[arg_17_2]
	end

	local var_17_1 = arg_17_0.displays[arg_17_1 + 1]

	var_17_0:Update(var_17_1, arg_17_0.selectedId)

	if arg_17_0.triggerFirstCard and arg_17_1 == 0 then
		arg_17_0.triggerFirstCard = nil

		triggerButton(var_17_0.frameTF)
	end
end

function var_0_0.AddDrag(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
	local var_18_0 = GetOrAddComponent(arg_18_1, "EventTriggerListener")
	local var_18_1
	local var_18_2 = 0
	local var_18_3 = 50
	local var_18_4 = arg_18_1.rect.height / 2

	var_18_0:AddPointDownFunc(function()
		var_18_2 = 0
		var_18_1 = nil
	end)
	var_18_0:AddDragFunc(function(arg_20_0, arg_20_1)
		local var_20_0 = arg_20_1.position

		if not var_18_1 then
			var_18_1 = var_20_0
		end

		var_18_2 = var_20_0.y - var_18_1.y

		if var_18_2 > 0 then
			setLocalPosition(arg_18_1, {
				x = 0,
				y = var_18_2 - var_18_4
			})
		else
			setLocalPosition(arg_18_1, {
				x = 0,
				y = -var_18_4
			})
		end
	end)
	var_18_0:AddPointUpFunc(function(arg_21_0, arg_21_1)
		setLocalPosition(arg_18_1, {
			x = 0,
			y = -var_18_4
		})

		if var_18_2 > var_18_3 then
			existCall(arg_18_2)
		else
			existCall(arg_18_3)
		end
	end)
end

function var_0_0.GetCommodityIndex(arg_22_0, arg_22_1)
	for iter_22_0, iter_22_1 in ipairs(arg_22_0.displays) do
		if iter_22_1 == arg_22_1 then
			return iter_22_0
		end
	end
end

function var_0_0.OnPrev(arg_23_0)
	if not arg_23_0.selectedId then
		return
	end

	local var_23_0 = arg_23_0:GetCommodityIndex(arg_23_0.selectedId)

	if var_23_0 - 1 > 0 then
		arg_23_0:TriggerCommodity(var_23_0, -1)
	end
end

function var_0_0.OnNext(arg_24_0)
	if not arg_24_0.selectedId then
		return
	end

	local var_24_0 = arg_24_0:GetCommodityIndex(arg_24_0.selectedId)

	if var_24_0 + 1 <= #arg_24_0.displays then
		arg_24_0:TriggerCommodity(var_24_0, 1)
	end
end

function var_0_0.TriggerCommodity(arg_25_0, arg_25_1, arg_25_2)
	local var_25_0 = arg_25_0.displays[arg_25_1]
	local var_25_1 = arg_25_0.displays[arg_25_1 + arg_25_2]
	local var_25_2
	local var_25_3

	for iter_25_0, iter_25_1 in pairs(arg_25_0.cards) do
		if iter_25_1._tf.gameObject.name ~= "-1" then
			if iter_25_1.configId == var_25_1 then
				var_25_2 = iter_25_1
			elseif iter_25_1.configId == var_25_0 then
				var_25_3 = iter_25_1
			end
		end
	end

	if var_25_2 then
		triggerButton(var_25_2.frameTF)
	end

	if var_25_2 and var_25_3 then
		arg_25_0:CheckCardBound(var_25_2, var_25_3, arg_25_2 > 0, arg_25_1 + arg_25_2)
	end
end

function var_0_0.CheckCardBound(arg_26_0, arg_26_1, arg_26_2, arg_26_3, arg_26_4)
	local var_26_0 = getBounds(arg_26_0.scrollrect.gameObject.transform)

	if arg_26_3 then
		local var_26_1 = getBounds(arg_26_2._tf)
		local var_26_2 = getBounds(arg_26_1._tf)

		if math.ceil(var_26_2:GetMax().x - var_26_0:GetMax().x) > var_26_1.size.x then
			local var_26_3 = arg_26_0.scrollrect:HeadIndexToValue(arg_26_4 - 1) - arg_26_0.scrollrect:HeadIndexToValue(arg_26_4)
			local var_26_4 = arg_26_0.scrollrect.value - var_26_3

			arg_26_0.scrollrect:SetNormalizedPosition(var_26_4, 0)
		end
	else
		local var_26_5 = getBounds(arg_26_1._tf)

		if getBounds(arg_26_1._tf.parent):GetMin().x < var_26_0:GetMin().x and var_26_5:GetMin().x < var_26_0:GetMin().x then
			local var_26_6 = arg_26_0.scrollrect:HeadIndexToValue(arg_26_4 - 1)

			arg_26_0.scrollrect:SetNormalizedPosition(var_26_6, 0)
		end
	end
end

function var_0_0.OnDestroy(arg_27_0)
	return
end

return var_0_0
