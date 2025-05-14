local var_0_0 = class("AgoraDecorationView", import("Mod.Island.Core.View.IslandBaseSubView"))

function var_0_0.GetUIName(arg_1_0)
	return "IslandAgoraDecorationUI"
end

function var_0_0.OnInit(arg_2_0, arg_2_1)
	arg_2_0._go = arg_2_1
	arg_2_0._tf = arg_2_1.transform

	setParent(arg_2_1, pg.UIMgr.GetInstance().UIMain)

	arg_2_0.cards = {}
	arg_2_0.scrollRect = arg_2_0._tf:Find("panel/scrollrect"):GetComponent("LScrollRect")
	arg_2_0.agoraSaveBtn = arg_2_0._tf:Find("btns/save")
	arg_2_0.agoraUpgradeBtn = arg_2_0._tf:Find("btns/upgrade")
	arg_2_0.agoraClearBtn = arg_2_0._tf:Find("btns/clear")
	arg_2_0.agoraRevertBtn = arg_2_0._tf:Find("btns/revert")
	arg_2_0.agoraShopBtn = arg_2_0._tf:Find("btns/shop")
	arg_2_0.agoraSwitchBtn = arg_2_0._tf:Find("btns/switch")
	arg_2_0.backBtn = arg_2_0._tf:Find("panel/back")

	arg_2_0:RegisterEvent()
	setText(arg_2_0._tf:Find("btns/upgrade/Text"), i18n1("更新"))
	setText(arg_2_0._tf:Find("btns/clear/Text"), i18n1("清空"))
	setText(arg_2_0._tf:Find("btns/revert/Text"), i18n1("还原"))
	setText(arg_2_0._tf:Find("btns/save/Text"), i18n1("保存"))
	setText(arg_2_0._tf:Find("btns/switch/Text"), i18n1("当前:室外"))
	setText(arg_2_0._tf:Find("btns/capacity/Text"), i18n1("容量: 1/1"))
	setText(arg_2_0._tf:Find("panel/title/Text"), i18n1("集会所"))
end

function var_0_0.RegisterEvent(arg_3_0)
	function arg_3_0.scrollRect.onInitItem(arg_4_0)
		arg_3_0:OnInitItem(arg_4_0)
	end

	function arg_3_0.scrollRect.onUpdateItem(arg_5_0, arg_5_1)
		arg_3_0:OnUpdateItem(arg_5_0, arg_5_1)
	end

	onButton(arg_3_0, arg_3_0.agoraSaveBtn, function()
		arg_3_0:Op("Save")
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.agoraUpgradeBtn, function()
		arg_3_0:Op("Upgrade")
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.agoraClearBtn, function()
		arg_3_0:Op("ClearAll")
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.agoraRevertBtn, function()
		arg_3_0:Op("Revert")
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.agoraShopBtn, function()
		pg.TipsMgr.GetInstance():ShowTips(i18n1("尚未开发"))
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.agoraSwitchBtn, function()
		pg.TipsMgr.GetInstance():ShowTips(i18n1("尚未开发"))
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.backBtn, function()
		arg_3_0:Op("RevertAndExit")
	end, SFX_PANEL)
end

function var_0_0.OnInitItem(arg_13_0, arg_13_1)
	local var_13_0 = AgoraDecorationCard.New(arg_13_1)

	onButton(arg_13_0, var_13_0._go, function()
		if var_13_0.isUsing then
			return
		end

		arg_13_0:Op("PlaceItemRandonPosition", var_13_0.item.id)
	end, SFX_PANEL)

	arg_13_0.cards[arg_13_1] = var_13_0
end

function var_0_0.OnUpdateItem(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = arg_15_0.cards[arg_15_2]

	if not var_15_0 then
		arg_15_0:OnInitItem(arg_15_2)

		var_15_0 = arg_15_0.cards[arg_15_2]
	end

	local var_15_1 = arg_15_0.displays[arg_15_1 + 1]
	local var_15_2 = var_15_1.item
	local var_15_3 = var_15_1.isUsing

	var_15_0:Update(var_15_2, var_15_3)
end

function var_0_0.GetDisplays(arg_16_0)
	local var_16_0 = arg_16_0:GetView()
	local var_16_1 = var_16_0.agora:GetPlaceableList()
	local var_16_2 = {}

	for iter_16_0, iter_16_1 in pairs(var_16_1) do
		local var_16_3 = var_16_0.agora:IsUsing(iter_16_1.id)

		table.insert(var_16_2, {
			item = iter_16_1,
			isUsing = var_16_3
		})
	end

	return var_16_2
end

function var_0_0.Flush(arg_17_0)
	arg_17_0:FlushList()
end

function var_0_0.FlushList(arg_18_0)
	arg_18_0.displays = arg_18_0:GetDisplays()

	arg_18_0.scrollRect:SetTotalCount(#arg_18_0.displays)
end

function var_0_0.OnDestroy(arg_19_0)
	for iter_19_0, iter_19_1 in pairs(arg_19_0.cards or {}) do
		iter_19_1:Dispose()
	end

	arg_19_0.cards = {}
end

return var_0_0
