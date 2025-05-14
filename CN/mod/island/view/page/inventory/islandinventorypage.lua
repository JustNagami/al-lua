local var_0_0 = class("IslandInventoryPage", import("...base.IslandBasePage"))
local var_0_1 = 101
local var_0_2 = 102
local var_0_3 = 103

var_0_0.INVENTORY_TYPE_OVERFLOW = 100
var_0_0.INVENTORY_TYPE_COMMON = 101
var_0_0.MODE_VIEW = 0
var_0_0.MODE_EDIT = 1

function var_0_0.getUIName(arg_1_0)
	return "IslandInventoryUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.closeBtn = arg_2_0:findTF("window/close_btn")
	arg_2_0.filterBtn = arg_2_0:findTF("window/sort_panel/index")
	arg_2_0.orderBtn = arg_2_0:findTF("window/sort_panel/sort")
	arg_2_0.orderTxt = arg_2_0:findTF("window/sort_panel/sort/Text"):GetComponent(typeof(Text))
	arg_2_0.orderArr = arg_2_0:findTF("window/sort_panel/sort/arr")
	arg_2_0.toggles = {
		[var_0_0.INVENTORY_TYPE_OVERFLOW] = arg_2_0:findTF("window/toggles/0"),
		[IslandItem.TYPE_MATERIAL] = arg_2_0:findTF("window/toggles/1"),
		[IslandItem.TYPE_PROP] = arg_2_0:findTF("window/toggles/2"),
		[IslandItem.TYPE_SPECIAL_PROP] = arg_2_0:findTF("window/toggles/3")
	}
	arg_2_0.indexDatas = {
		[var_0_0.INVENTORY_TYPE_OVERFLOW] = IslandInventoryIndexData.New(var_0_1),
		[IslandItem.TYPE_MATERIAL] = IslandInventoryIndexData.New(var_0_1),
		[IslandItem.TYPE_PROP] = IslandInventoryIndexData.New(var_0_2),
		[IslandItem.TYPE_SPECIAL_PROP] = IslandInventoryIndexData.New(var_0_3)
	}
	arg_2_0.capacityTxt = arg_2_0:findTF("window/upgrade/Text"):GetComponent(typeof(Text))
	arg_2_0.upgradeBtn = arg_2_0:findTF("window/upgrade")
	arg_2_0.upgradeProg = arg_2_0:findTF("window/upgrade/bar")
	arg_2_0.batchSellBtn = arg_2_0:findTF("window/batch_sell")
	arg_2_0.sellPanel = arg_2_0:findTF("window/sell_panel")
	arg_2_0.sortPaenl = arg_2_0:findTF("window/sort_panel")
	arg_2_0.sellBtn = arg_2_0:findTF("window/sell_panel/batch_sell_1")
	arg_2_0.sellCancelBtn = arg_2_0:findTF("window/sell_panel/cancel")
	arg_2_0.sellPriceTxt = arg_2_0:findTF("window/sell_panel/price/Text"):GetComponent(typeof(Text))
	arg_2_0.oneKeyPanel = arg_2_0:findTF("window/one_key_panel")
	arg_2_0.onekeyBtn = arg_2_0:findTF("window/one_key_panel/fetch_btn")
	arg_2_0.scrollRect = arg_2_0:findTF("window/item_scrollview"):GetComponent("LScrollRect")

	setText(arg_2_0:findTF("window/title/Text"), i18n1("仓库"))
	setText(arg_2_0:findTF("window/batch_sell/Text"), i18n1("批量出售"))
	setText(arg_2_0:findTF("window/sell_panel/price/label"), i18n1("合计价格:"))
	setText(arg_2_0:findTF("window/sell_panel/cancel/Text"), i18n1("取消"))
	setText(arg_2_0:findTF("window/sell_panel/batch_sell_1/Text"), i18n1("批量出售"))
	setText(arg_2_0:findTF("window/one_key_panel/fetch_btn/Text"), i18n1("一键领取"))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0.closeBtn, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0._tf, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.upgradeBtn, function()
		arg_3_0:OpenPage(IslandInventoryUpgradePage)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.batchSellBtn, function()
		arg_3_0.mode = var_0_0.MODE_EDIT

		arg_3_0:SetTotalCount()
		arg_3_0:UdpateStyle()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.sellCancelBtn, function()
		arg_3_0.mode = var_0_0.MODE_VIEW

		arg_3_0:SetTotalCount()
		arg_3_0:UdpateStyle()

		for iter_8_0, iter_8_1 in ipairs(arg_3_0.values) do
			arg_3_0.values[iter_8_0] = 0
		end
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.sellBtn, function()
		local var_9_0 = arg_3_0:GetSellItems()

		if #var_9_0 <= 0 then
			return
		end

		arg_3_0:ShowMsgBox({
			content = i18n1("确定出售道具？"),
			onYes = function()
				if arg_3_0.tagType == var_0_0.INVENTORY_TYPE_OVERFLOW then
					arg_3_0:emit(IslandMediator.ON_BATCH_SELL_ITEM_4_OVERFLOW, var_9_0)
				else
					arg_3_0:emit(IslandMediator.ON_BATCH_SELL_ITEM, var_9_0)
				end
			end
		})
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.onekeyBtn, function()
		if arg_3_0.tagType ~= var_0_0.INVENTORY_TYPE_OVERFLOW then
			return
		end

		arg_3_0:emit(IslandMediator.ONE_KEY)
	end, SFX_PANEL)
end

function var_0_0.OnShow(arg_12_0)
	arg_12_0:SetUp()
end

function var_0_0.GetSellItems(arg_13_0)
	local var_13_0 = {}

	for iter_13_0, iter_13_1 in ipairs(arg_13_0.values) do
		local var_13_1 = arg_13_0.displays[iter_13_0]

		var_13_0[var_13_1.id] = (var_13_0[var_13_1.id] or 0) + iter_13_1
	end

	local var_13_2 = {}

	for iter_13_2, iter_13_3 in pairs(var_13_0) do
		if iter_13_3 > 0 then
			table.insert(var_13_2, {
				id = iter_13_2,
				num = iter_13_3
			})
		end
	end

	return var_13_2
end

function var_0_0.UdpateStyle(arg_14_0)
	setActive(arg_14_0.sellPanel, arg_14_0.mode == var_0_0.MODE_EDIT)
	setActive(arg_14_0.sortPaenl, arg_14_0.mode == var_0_0.MODE_VIEW and arg_14_0.tagType ~= var_0_0.INVENTORY_TYPE_OVERFLOW)
	setActive(arg_14_0.oneKeyPanel, arg_14_0.tagType == var_0_0.INVENTORY_TYPE_OVERFLOW and arg_14_0.mode ~= var_0_0.MODE_EDIT)
	setActive(arg_14_0.batchSellBtn, arg_14_0.mode == var_0_0.MODE_VIEW)
end

function var_0_0.AddListeners(arg_15_0)
	arg_15_0:AddListener(IslandScene.ON_INVENTORY_FILTER, arg_15_0.OnInventoryFilter)
	arg_15_0:AddListener(GAME.ISLAND_UPGRADE_INVENTORY_DONE, arg_15_0.OnUpgrade)
	arg_15_0:AddListener(GAME.ISLAND_SELL_ITEM_DONE, arg_15_0.OnSell)
	arg_15_0:AddListener(GAME.ISLAND_GET_OVERFLOW_ITEM_DOME, arg_15_0.OnSell)
end

function var_0_0.RemoveListeners(arg_16_0)
	arg_16_0:RemoveListener(IslandScene.ON_INVENTORY_FILTER, arg_16_0.OnInventoryFilter)
	arg_16_0:RemoveListener(GAME.ISLAND_UPGRADE_INVENTORY_DONE, arg_16_0.OnUpgrade)
	arg_16_0:RemoveListener(GAME.ISLAND_SELL_ITEM_DONE, arg_16_0.OnSell)
	arg_16_0:RemoveListener(GAME.ISLAND_GET_OVERFLOW_ITEM_DOME, arg_16_0.OnSell)
end

function var_0_0.GetIndexData(arg_17_0, arg_17_1)
	assert(arg_17_0.indexDatas[arg_17_1])

	return arg_17_0.indexDatas[arg_17_1]
end

function var_0_0.UpdateIndexData(arg_18_0, arg_18_1, arg_18_2)
	assert(arg_18_0.indexDatas[arg_18_1])
	arg_18_0.indexDatas[arg_18_1]:SetData(arg_18_2)
end

function var_0_0.OnInventoryFilter(arg_19_0, arg_19_1)
	arg_19_0:UpdateIndexData(arg_19_0.tagType, arg_19_1)
	arg_19_0:FlushSortBtn()
	arg_19_0:SetTotalCount()
end

function var_0_0.OnUpgrade(arg_20_0)
	arg_20_0:SetTotalCount()
	arg_20_0:FlushCapacity()
	arg_20_0:ClosePage(IslandInventoryUpgradePage)
end

function var_0_0.OnSell(arg_21_0)
	arg_21_0:SetTotalCount()
	arg_21_0:FlushCapacity()
	arg_21_0:ClosePage(IslandInventoryItemInfoPage)
end

function var_0_0.SetUp(arg_22_0)
	arg_22_0.tagType = IslandItem.TYPE_MATERIAL
	arg_22_0.mode = var_0_0.MODE_VIEW
	arg_22_0.asc = true
	arg_22_0.cards = {}

	arg_22_0:FlushTags()
	arg_22_0:FlushFilterBtn()
	arg_22_0:FlushSortBtn()
	arg_22_0:FlushList()
	arg_22_0:FlushCapacity()
	arg_22_0:UdpateStyle()
end

function var_0_0.FlushCapacity(arg_23_0)
	if arg_23_0.tagType == IslandItem.TYPE_MATERIAL then
		setActive(arg_23_0.upgradeBtn, true)
		setActive(arg_23_0.batchSellBtn, true)

		local var_23_0 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()
		local var_23_1 = var_23_0:GetLength()
		local var_23_2 = var_23_0:GetCapacity()

		arg_23_0.capacityTxt.text = var_23_1 .. "/" .. var_23_2

		setButtonEnabled(arg_23_0.upgradeBtn, not var_23_0:IsMaxLevel())

		local var_23_3 = var_23_1 / var_23_2

		setFillAmount(arg_23_0.upgradeProg, var_23_3)

		local var_23_4 = var_23_3 > 0.85 and Color.New(0.9529411764705882, 0.4235294117647059, 0.43137254901960786, 1) or Color.New(0.2235294117647059, 0.7450980392156863, 1, 1)

		arg_23_0.upgradeProg:GetComponent(typeof(Image)).color = var_23_4
	elseif arg_23_0.tagType == var_0_0.INVENTORY_TYPE_OVERFLOW then
		setActive(arg_23_0.upgradeBtn, false)
		setActive(arg_23_0.batchSellBtn, true)
	else
		setActive(arg_23_0.upgradeBtn, false)
		setActive(arg_23_0.batchSellBtn, false)
	end
end

function var_0_0.FlushTags(arg_24_0)
	for iter_24_0, iter_24_1 in pairs(arg_24_0.toggles) do
		onToggle(arg_24_0, iter_24_1, function(arg_25_0)
			if arg_25_0 then
				arg_24_0:CheckEditMode(iter_24_0)

				arg_24_0.tagType = iter_24_0

				arg_24_0:FlushCapacity()
				arg_24_0:FlushSortBtn()
				arg_24_0:SetTotalCount()
				arg_24_0:UdpateStyle()
			end
		end, SFX_PANEL)

		if iter_24_0 == var_0_0.INVENTORY_TYPE_OVERFLOW then
			setText(iter_24_1:Find("Text"), i18n1("临时背包"))
		else
			setText(iter_24_1:Find("Text"), IslandItemKind.Type2TagName(iter_24_0))
		end
	end

	arg_24_0:ActiveDefaultTag()
end

function var_0_0.ActiveDefaultTag(arg_26_0)
	local var_26_0 = getProxy(IslandProxy):GetIsland():GetInventoryAgency():ExistAnyOverFlowItem()

	setActive(arg_26_0.toggles[var_0_0.INVENTORY_TYPE_OVERFLOW], var_26_0)

	if var_26_0 then
		triggerToggle(arg_26_0.toggles[var_0_0.INVENTORY_TYPE_OVERFLOW], true)
	else
		triggerToggle(arg_26_0.toggles[IslandItem.TYPE_MATERIAL], true)
	end
end

function var_0_0.CheckEditMode(arg_27_0, arg_27_1)
	if arg_27_0.tagType ~= arg_27_1 and arg_27_0.mode == var_0_0.MODE_EDIT then
		triggerButton(arg_27_0.sellCancelBtn)
	end
end

function var_0_0.FlushFilterBtn(arg_28_0)
	onButton(arg_28_0, arg_28_0.filterBtn, function()
		local var_29_0 = arg_28_0:GetIndexData(arg_28_0.tagType)

		arg_28_0:OpenPage(IslandInventoryIndexPage, var_29_0)
	end, SFX_PANEL)
end

function var_0_0.FlushSortBtn(arg_30_0)
	local function var_30_0()
		local var_31_0 = arg_30_0:GetIndexData(arg_30_0.tagType)

		arg_30_0.orderTxt.text = var_31_0:GetSortText()
		arg_30_0.orderArr.localScale = arg_30_0.asc and Vector2(1, -1, 1) or Vector2(1, 1, 1)
	end

	onButton(arg_30_0, arg_30_0.orderBtn, function()
		arg_30_0.asc = not arg_30_0.asc

		var_30_0()
		arg_30_0:SetTotalCount()
	end, SFX_PANEL)
	var_30_0()
end

function var_0_0.FlushList(arg_33_0)
	function arg_33_0.scrollRect.onInitItem(arg_34_0)
		arg_33_0:OnInitItem(arg_34_0)
	end

	function arg_33_0.scrollRect.onUpdateItem(arg_35_0, arg_35_1)
		arg_33_0:OnUpdateItem(arg_35_0, arg_35_1)
	end

	arg_33_0:SetTotalCount()
end

function var_0_0.SetTotalCount(arg_36_0)
	arg_36_0.displays = arg_36_0:Filter()
	arg_36_0.values = {}

	for iter_36_0, iter_36_1 in ipairs(arg_36_0.displays) do
		table.insert(arg_36_0.values, 0)
	end

	local var_36_0 = arg_36_0:GetIndexData(arg_36_0.tagType)

	table.sort(arg_36_0.displays, function(arg_37_0, arg_37_1)
		return var_36_0:Sort(arg_37_0, arg_37_1, arg_36_0.asc)
	end)
	arg_36_0.scrollRect:SetTotalCount(#arg_36_0.displays, -1)
end

function var_0_0.OnInitItem(arg_38_0, arg_38_1)
	local var_38_0 = IslandItemCard.New(arg_38_1)

	onButton(arg_38_0, var_38_0._go, function()
		if arg_38_0.mode == var_0_0.MODE_VIEW then
			if arg_38_0.tagType ~= var_0_0.INVENTORY_TYPE_OVERFLOW then
				arg_38_0:OnClickItem(var_38_0)
			end
		elseif arg_38_0.mode == var_0_0.MODE_EDIT then
			arg_38_0:OnClickItemForSell(var_38_0)
		end
	end, SFX_PANEL)
	onButton(arg_38_0, var_38_0.calcPanel, function()
		if arg_38_0.mode == var_0_0.MODE_EDIT then
			arg_38_0:UpdateSellPrice(var_38_0, -1)
		end
	end, SFX_PANEL)
	onInputEndEdit(arg_38_0, var_38_0.valueInput, function(arg_41_0)
		local var_41_0 = table.indexof(arg_38_0.displays, var_38_0.item)

		if not var_41_0 then
			return
		end

		local var_41_1 = 0

		if not arg_41_0 or arg_41_0 == "" or not tonumber(arg_41_0) then
			local var_41_2 = 1
		end

		local var_41_3 = tonumber(arg_41_0) - arg_38_0.values[var_41_0]

		arg_38_0:UpdateSellPrice(var_38_0, var_41_3)
	end)

	arg_38_0.cards[arg_38_1] = var_38_0
end

function var_0_0.OnClickItem(arg_42_0, arg_42_1)
	if arg_42_1.item:IsInvitationLetter() then
		local var_42_0 = arg_42_1.item:GetName()
		local var_42_1 = IslandItem.StaticGetUsageArg(arg_42_1.item.id)
		local var_42_2 = pg.island_ship[tonumber(var_42_1)].name

		arg_42_0:ShowMsgBox({
			content = i18n1("消耗" .. var_42_0 .. "X1，邀请" .. var_42_2 .. "\n加入队伍,是否确定？"),
			onYes = function()
				arg_42_0:emit(IslandMediator.ON_USE_ITEM, arg_42_1.item.id, 1)
			end
		})
	else
		arg_42_0:ShowMsgBox({
			type = IslandMsgBox.TYPE_COMMON_ITEM,
			itemId = arg_42_1.item.id
		})
	end
end

function var_0_0.OnClickItemForSell(arg_44_0, arg_44_1)
	arg_44_0:UpdateSellPrice(arg_44_1, 1)
end

function var_0_0.UpdateSellPrice(arg_45_0, arg_45_1, arg_45_2)
	local var_45_0 = table.indexof(arg_45_0.displays, arg_45_1.item)

	if not var_45_0 then
		return
	end

	local var_45_1 = arg_45_0.values[var_45_0] + arg_45_2

	arg_45_0.values[var_45_0] = math.max(0, math.min(var_45_1, arg_45_1.item:GetCount()))

	arg_45_1:UpdateValue(arg_45_0.values[var_45_0])

	local var_45_2 = 0

	for iter_45_0, iter_45_1 in ipairs(arg_45_0.values) do
		var_45_2 = arg_45_0.displays[iter_45_0]:GetSellingPrice().count * iter_45_1 + var_45_2
	end

	arg_45_0.sellPriceTxt.text = "x" .. var_45_2
end

function var_0_0.OnUpdateItem(arg_46_0, arg_46_1, arg_46_2)
	local var_46_0 = arg_46_0.cards[arg_46_2]

	if not var_46_0 then
		arg_46_0:OnInitItem(arg_46_2)

		var_46_0 = arg_46_0.cards[arg_46_2]
	end

	if arg_46_0.displays[arg_46_1 + 1] then
		var_46_0:Update(arg_46_0.displays[arg_46_1 + 1], arg_46_0.mode, arg_46_0.values[arg_46_1 + 1], arg_46_0.tagType)
	end
end

function var_0_0.Filter(arg_47_0)
	local var_47_0 = {}

	if arg_47_0.tagType == var_0_0.INVENTORY_TYPE_OVERFLOW then
		arg_47_0:CollectOverFlowInventoryItems(var_47_0)
	else
		arg_47_0:CollectCommonInventoryItems(var_47_0)
	end

	return var_47_0
end

function var_0_0.CollectOverFlowInventoryItems(arg_48_0, arg_48_1)
	local var_48_0 = getProxy(IslandProxy):GetIsland():GetInventoryAgency():GetOverflowItemList()

	for iter_48_0, iter_48_1 in pairs(var_48_0) do
		table.insert(arg_48_1, iter_48_1)
	end
end

function var_0_0.CollectCommonInventoryItems(arg_49_0, arg_49_1)
	local var_49_0 = getProxy(IslandProxy):GetIsland():GetInventoryAgency():GetGroupedItemList()

	for iter_49_0, iter_49_1 in ipairs(var_49_0) do
		if arg_49_0.tagType == IslandItem.TYPE_MATERIAL and iter_49_1:IsMaterial() and arg_49_0.indexDatas[IslandItem.TYPE_MATERIAL]:Match(iter_49_1) then
			table.insert(arg_49_1, iter_49_1)
		elseif arg_49_0.tagType == IslandItem.TYPE_PROP and iter_49_1:IsProp() and arg_49_0.indexDatas[IslandItem.TYPE_PROP]:Match(iter_49_1) then
			table.insert(arg_49_1, iter_49_1)
		elseif arg_49_0.tagType == IslandItem.TYPE_SPECIAL_PROP and iter_49_1:IsSpecialProp() and arg_49_0.indexDatas[IslandItem.TYPE_SPECIAL_PROP]:Match(iter_49_1) then
			table.insert(arg_49_1, iter_49_1)
		end
	end
end

function var_0_0.OnDestroy(arg_50_0)
	for iter_50_0, iter_50_1 in pairs(arg_50_0.cards) do
		iter_50_1:Dispose()
	end

	arg_50_0.cards = {}
end

return var_0_0
