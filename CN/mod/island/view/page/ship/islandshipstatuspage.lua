local var_0_0 = class("IslandShipStatusPage", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandShipStatusUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.scrollRect = arg_2_0:findTF("adapt/attr_panel/srcollrect"):GetComponent("LScrollRect")

	function arg_2_0.scrollRect.onInitItem(arg_3_0)
		arg_2_0:OnInitItem(arg_3_0)
	end

	function arg_2_0.scrollRect.onUpdateItem(arg_4_0, arg_4_1)
		arg_2_0:OnUpdateItem(arg_4_0, arg_4_1)
	end

	arg_2_0.giveBtn = arg_2_0:findTF("adapt/attr_panel/send_panel/give_btn")
	arg_2_0.emptyTr = arg_2_0:findTF("adapt/attr_panel/send_panel/empty")
	arg_2_0.giftEffectList = UIItemList.New(arg_2_0:findTF("adapt/attr_panel/send_panel/list"), arg_2_0:findTF("adapt/attr_panel/send_panel/list/tpl"))
	arg_2_0.statusPanel = IslandShipStatusPanel.New(arg_2_0:findTF("adapt/attr_panel/status"))

	setText(arg_2_0.emptyTr:Find("Text"), i18n1("点击选择赠送的礼物"))
end

function var_0_0.OnInit(arg_5_0)
	arg_5_0.cards = {}

	onButton(arg_5_0, arg_5_0.giveBtn, function()
		if not arg_5_0.selectedId then
			return
		end

		local var_6_0 = "island_energy_overflow" .. getProxy(PlayerProxy):getRawData().id

		if arg_5_0:IsOverflowEnergy(arg_5_0.shipId, arg_5_0.selectedId) and arg_5_0:ShouldTip(var_6_0) then
			arg_5_0:ShowMsgBox({
				type = IslandMsgBox.TYPE_REMIND,
				content = i18n1("赠送该礼物后角色的体力会超上限，超出的\n部分将会消失,是否确定赠送？"),
				key = var_6_0,
				onYes = function()
					arg_5_0:emit(IslandMediator.ON_GIVE_GIFT, arg_5_0.selectedId, 1, arg_5_0.shipId)
				end
			})
		else
			arg_5_0:emit(IslandMediator.ON_GIVE_GIFT, arg_5_0.selectedId, 1, arg_5_0.shipId)
		end
	end, SFX_PANEL)
end

function var_0_0.ShouldTip(arg_8_0, arg_8_1)
	local var_8_0 = PlayerPrefs.GetInt(arg_8_1, 0)

	if var_8_0 == 0 then
		return true
	end

	return var_8_0 <= pg.TimeMgr.GetInstance():GetServerTime()
end

function var_0_0.IsOverflowEnergy(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(arg_9_1)
	local var_9_1 = var_9_0:GetEnergy()
	local var_9_2 = var_9_0:GetMaxEnergy()
	local var_9_3 = IslandItem.StaticGetUsageArg(arg_9_2)

	return var_9_2 < var_9_1 + tonumber(var_9_3)
end

function var_0_0.AddListeners(arg_10_0)
	arg_10_0:AddListener(GAME.ISLAND_USE_ITEM_DONE, arg_10_0.OnUseItem)
end

function var_0_0.RemoveListeners(arg_11_0)
	arg_11_0:RemoveListener(GAME.ISLAND_USE_ITEM_DONE, arg_11_0.OnUseItem)
end

function var_0_0.OnUseItem(arg_12_0)
	arg_12_0:FlushStatus(arg_12_0.ship)
	arg_12_0:FlushGifts()
end

function var_0_0.OnShow(arg_13_0, arg_13_1)
	arg_13_0.selectedId = nil

	local var_13_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipByConfigId(arg_13_1)

	if var_13_0 == nil then
		return
	end

	arg_13_0.ship = var_13_0
	arg_13_0.shipId = arg_13_0.ship.id

	arg_13_0:FlushStatus(var_13_0)
	arg_13_0:FlushGifts()
	arg_13_0:UpdateSelected(arg_13_0.selectedId)
end

function var_0_0.FlushStatus(arg_14_0, arg_14_1)
	arg_14_0.statusPanel:Flush(arg_14_1)

	local var_14_0 = arg_14_1:GetValidStatus()

	onButton(arg_14_0, arg_14_0.statusPanel.viewBtn, function()
		arg_14_0:ShowMsgBox({
			hideNo = true,
			type = IslandMsgBox.TYPE_STATUS,
			title = i18n1("详情"),
			statusList = var_14_0
		})
	end, SFX_PANEL)
end

function var_0_0.OnInitItem(arg_16_0, arg_16_1)
	local var_16_0 = IslandGiftCard.New(arg_16_1)

	onButton(arg_16_0, var_16_0.go, function()
		if var_16_0.item:GetCount() <= 0 then
			arg_16_0:ShowMsgBox({
				title = i18n1("详情"),
				type = IslandMsgBox.TYPE_ITEM_DESC,
				itemId = var_16_0.item.id
			})

			return
		end

		arg_16_0.selectedId = nil

		for iter_17_0, iter_17_1 in pairs(arg_16_0.cards) do
			iter_17_1:UpdateSelected(arg_16_0.selectedId)
		end

		arg_16_0:UpdateSelected(var_16_0.itemId)
		var_16_0:UpdateSelected(arg_16_0.selectedId)
	end, SFX_PANEL)

	arg_16_0.cards[arg_16_1] = var_16_0
end

function var_0_0.OnUpdateItem(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = arg_18_0.cards[arg_18_2]

	if not var_18_0 then
		arg_18_0:OnInitItem(arg_18_2)

		var_18_0 = arg_18_0.cards[arg_18_2]
	end

	var_18_0:Update(arg_18_0.shipId, arg_18_0.displays[arg_18_1 + 1], arg_18_0.selectedId)
end

function var_0_0.FlushGifts(arg_19_0)
	local var_19_0 = getProxy(IslandProxy):GetIsland():GetInventoryAgency():GetGifts()

	arg_19_0.displays = {}

	for iter_19_0, iter_19_1 in pairs(var_19_0) do
		table.insert(arg_19_0.displays, iter_19_1)
	end

	table.sort(arg_19_0.displays, function(arg_20_0, arg_20_1)
		return arg_20_0.id < arg_20_1.id
	end)
	arg_19_0.scrollRect:SetTotalCount(#arg_19_0.displays)
end

function var_0_0.UpdateSelected(arg_21_0, arg_21_1)
	arg_21_0.selectedId = arg_21_1

	setActive(arg_21_0.emptyTr, arg_21_0.selectedId == nil)
	setActive(arg_21_0.giftEffectList.container, arg_21_0.selectedId)

	if arg_21_0.selectedId then
		local var_21_0 = arg_21_0:CollectGiftEffect(arg_21_1)

		arg_21_0.giftEffectList:make(function(arg_22_0, arg_22_1, arg_22_2)
			if arg_22_0 == UIItemList.EventUpdate then
				setText(arg_22_2, var_21_0[arg_22_1 + 1])
			end
		end)
		arg_21_0.giftEffectList:align(#var_21_0)
	end
end

function var_0_0.CollectGiftEffect(arg_23_0, arg_23_1)
	local var_23_0 = {}
	local var_23_1 = IslandItem.StaticGetUsageArg(arg_23_1)

	table.insert(var_23_0, i18n1("角色体力+" .. var_23_1))

	local var_23_2 = arg_23_0.ship:GetFavoriteGift()

	if table.contains(var_23_2, arg_23_1) then
		local var_23_3 = IslandShip.StaticGetGiftStatue()
		local var_23_4 = pg.island_ship_state[var_23_3]

		table.insert(var_23_0, var_23_4.desc)
	end

	return var_23_0
end

function var_0_0.OnDestroy(arg_24_0)
	ClearLScrollrect(arg_24_0.scrollRect)
	arg_24_0.statusPanel:Dispose()

	arg_24_0.statusPanel = nil

	for iter_24_0, iter_24_1 in ipairs(arg_24_0.cards or {}) do
		iter_24_1:Dispose()
	end

	arg_24_0.cards = nil
end

return var_0_0
