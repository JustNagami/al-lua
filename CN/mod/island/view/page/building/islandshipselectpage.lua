local var_0_0 = class("IslandShipSelectPage", import("...base.IslandBasePage"))

var_0_0.TYPE2NAME = {
	energy = i18n1("体力"),
	attr = i18n1("属性"),
	level = i18n1("等级")
}

function var_0_0.getUIName(arg_1_0)
	return "IslandShipSelectUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.backBtn = arg_2_0:findTF("top/back")
	arg_2_0.title = arg_2_0:findTF("top/title/Text")

	setText(arg_2_0.title, i18n1("选择角色"))

	arg_2_0.frameTF = arg_2_0:findTF("frame")
	arg_2_0.shipRectCom = arg_2_0:findTF("ships", arg_2_0.frameTF):GetComponent("LScrollRect")
	arg_2_0.ascToggle = arg_2_0:findTF("sort_toggle", arg_2_0.frameTF)
	arg_2_0.sortBtn = arg_2_0:findTF("sort", arg_2_0.frameTF)
	arg_2_0.sortShow = arg_2_0:findTF("show", arg_2_0.sortBtn)
	arg_2_0.sortDropdownTF = arg_2_0:findTF("dropdown", arg_2_0.sortBtn)

	setActive(arg_2_0.sortDropdownTF, false)

	arg_2_0.infoPanel = arg_2_0:findTF("info")
	arg_2_0.nameTF = arg_2_0:findTF("name", arg_2_0.infoPanel)
	arg_2_0.levelTF = arg_2_0:findTF("level", arg_2_0.infoPanel)
	arg_2_0.attrUIList = UIItemList.New(arg_2_0:findTF("attrs", arg_2_0.infoPanel), arg_2_0:findTF("attrs/tpl", arg_2_0.infoPanel))
	arg_2_0.skillTF = arg_2_0:findTF("skill", arg_2_0.infoPanel)
	arg_2_0.energyTF = arg_2_0:findTF("energy", arg_2_0.infoPanel)
	arg_2_0.statusTF = arg_2_0:findTF("status", arg_2_0.infoPanel)
	arg_2_0.sureBtn = arg_2_0:findTF("sure")
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0.backBtn, function()
		arg_3_0:Hide()
		arg_3_0.cancelFunc()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.sureBtn, function()
		arg_3_0:Hide()
		arg_3_0.confirmFunc(arg_3_0.selectedId)
	end, SFX_PANEL)
	onToggle(arg_3_0, arg_3_0.ascToggle, function(arg_6_0)
		arg_3_0.selectAsc = arg_6_0

		arg_3_0:FlushShips()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.sortBtn, function()
		setActive(arg_3_0.sortDropdownTF, true)
	end, SFX_PANEL)
	eachChild(arg_3_0.sortDropdownTF, function(arg_8_0)
		onButton(arg_3_0, arg_8_0, function()
			arg_3_0.sortType = arg_8_0.name

			arg_3_0:UpdateSortBtn()
			setActive(arg_3_0.sortDropdownTF, false)
			arg_3_0:FlushShips()
		end, SFX_PANEL)
	end)
	arg_3_0.attrUIList:make(function(arg_10_0, arg_10_1, arg_10_2)
		if arg_10_0 == UIItemList.EventUpdate then
			local var_10_0 = IslandShipAttr.ATTRS[arg_10_1 + 1]

			setText(arg_3_0:findTF("content/name", arg_10_2), IslandShipAttr.ToChinese(var_10_0))
			setText(arg_3_0:findTF("content/value", arg_10_2), arg_3_0.selectedShip:GetAttr(var_10_0))
		end
	end)

	function arg_3_0.shipRectCom.onInitItem(arg_11_0)
		arg_3_0:OnInitShip(arg_11_0)
	end

	function arg_3_0.shipRectCom.onUpdateItem(arg_12_0, arg_12_1)
		arg_3_0:OnUpdateShip(arg_12_0, arg_12_1)
	end

	arg_3_0.cards = {}
	arg_3_0.selectAsc = true

	arg_3_0:UpdateSortBtn()
end

function var_0_0.OnShow(arg_13_0, arg_13_1, arg_13_2, arg_13_3)
	arg_13_0.confirmFunc = arg_13_2
	arg_13_0.cancelFunc = arg_13_3
	arg_13_0.showShips = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShips()

	if #arg_13_0.showShips ~= 0 then
		arg_13_0.selectedId = arg_13_0.showShips[1].id
	end

	arg_13_0:FlushShips()
end

function var_0_0.UpdateSortBtn(arg_14_0)
	setText(arg_14_0.sortShow, var_0_0.TYPE2NAME[arg_14_0.sortType])
end

function var_0_0.OnInitShip(arg_15_0, arg_15_1)
	local var_15_0 = IslandSelectShipCard.New(arg_15_1)

	onButton(arg_15_0, var_15_0.go, function()
		arg_15_0.selectedId = var_15_0.id

		for iter_16_0, iter_16_1 in pairs(arg_15_0.cards) do
			iter_16_1:UpdateSelected(arg_15_0.selectedId)
		end

		arg_15_0:FlushInfo()
	end, SFX_PANEL)

	arg_15_0.cards[arg_15_1] = var_15_0
end

function var_0_0.OnUpdateShip(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = arg_17_0.cards[arg_17_2]

	if not var_17_0 then
		arg_17_0:OnInitItem(arg_17_2)

		var_17_0 = arg_17_0.cards[arg_17_2]
	end

	local var_17_1 = arg_17_0.showShips[arg_17_1 + 1]

	var_17_0:Update(var_17_1, arg_17_0.attrType, arg_17_0.buildingId, arg_17_0.selectedId)
end

function var_0_0.FlushShips(arg_18_0)
	switch(arg_18_0.sortType, {
		energy = function()
			arg_18_0:SortByEnergy()
		end,
		attr = function()
			arg_18_0:SortByAttr()
		end,
		level = function()
			arg_18_0:SortByLevel()
		end
	})
	arg_18_0.shipRectCom:SetTotalCount(#arg_18_0.showShips)
	arg_18_0:FlushInfo()
end

function var_0_0.FlushInfo(arg_22_0)
	setActive(arg_22_0.infoPanel, arg_22_0.selectedId)

	if not arg_22_0.selectedId then
		return
	end

	arg_22_0.selectedShip = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(arg_22_0.selectedId)

	setText(arg_22_0.nameTF, arg_22_0.selectedShip:GetName())
	setText(arg_22_0.levelTF, arg_22_0.selectedShip:GetLevel())
	arg_22_0.attrUIList:align(#IslandShipAttr.ATTRS)

	local var_22_0 = pg.island_ship_skill[arg_22_0.selectedShip:GetMainSkill()]

	GetImageSpriteFromAtlasAsync("IslandSkillIcon/" .. var_22_0.icon, "", arg_22_0:findTF("title/icon", arg_22_0.skillTF))
	setText(arg_22_0:findTF("title/name", arg_22_0.skillTF), var_22_0.name)
	setText(arg_22_0:findTF("title/level", arg_22_0.skillTF), var_22_0.level)
	setText(arg_22_0:findTF("mask/desc", arg_22_0.skillTF), var_22_0.desc)

	local var_22_1 = arg_22_0.selectedShip:GetEnergy()
	local var_22_2 = arg_22_0.selectedShip:GetMaxEnergy()

	setText(arg_22_0:findTF("title/name", arg_22_0.energyTF), i18n1("体力"))
	setText(arg_22_0:findTF("title/value", arg_22_0.energyTF), var_22_1 .. "/" .. var_22_2)
	setSlider(arg_22_0:findTF("energy_bar", arg_22_0.energyTF), 0, 1, var_22_1 / var_22_2)
	setActive(arg_22_0:findTF("time", arg_22_0.energyTF), false)

	local var_22_3 = arg_22_0.selectedShip:GetValidStatus()

	setActive(arg_22_0.statusTF, #var_22_3 > 0)

	if #var_22_3 > 0 then
		GetImageSpriteFromAtlasAsync(var_22_3[1]:GetIcon(), "", arg_22_0:findTF("title/icon", arg_22_0.statusTF))
		setText(arg_22_0:findTF("title/name", arg_22_0.statusTF), var_22_3[1]:GetName())
		setText(arg_22_0:findTF("desc", arg_22_0.statusTF), var_22_3[1]:GetDesc())
	end
end

function var_0_0.SortByEnergy(arg_23_0)
	table.sort(arg_23_0.showShips, CompareFuncs({
		function(arg_24_0)
			return arg_24_0:GetEnergy() * (arg_23_0.selectAsc and -1 or 1)
		end,
		function(arg_25_0)
			return arg_25_0:GetAttr(IslandShipAttr.ATTRS[arg_23_0.attrType])
		end,
		function(arg_26_0)
			return arg_26_0:IsMainSkillEffective(arg_23_0.buildingId) and 0 or 1
		end,
		function(arg_27_0)
			return arg_27_0:GetLevel()
		end,
		function(arg_28_0)
			return arg_28_0.id
		end
	}))
end

function var_0_0.SortByAttr(arg_29_0)
	table.sort(arg_29_0.showShips, CompareFuncs({
		function(arg_30_0)
			return arg_30_0:GetAttr(IslandShipAttr.ATTRS[arg_29_0.attrType]) * (arg_29_0.selectAsc and -1 or 1)
		end,
		function(arg_31_0)
			return arg_31_0:GetEnergy()
		end,
		function(arg_32_0)
			return arg_32_0:IsMainSkillEffective(arg_29_0.buildingId) and 0 or 1
		end,
		function(arg_33_0)
			return arg_33_0:GetLevel()
		end,
		function(arg_34_0)
			return arg_34_0.id
		end
	}))
end

function var_0_0.SortByLevel(arg_35_0)
	table.sort(arg_35_0.showShips, CompareFuncs({
		function(arg_36_0)
			return arg_36_0:GetLevel() * (arg_35_0.selectAsc and -1 or 1)
		end,
		function(arg_37_0)
			return arg_37_0:GetAttr(IslandShipAttr.ATTRS[arg_35_0.attrType])
		end,
		function(arg_38_0)
			return arg_38_0:GetEnergy()
		end,
		function(arg_39_0)
			return arg_39_0:IsMainSkillEffective(arg_35_0.buildingId) and 0 or 1
		end,
		function(arg_40_0)
			return arg_40_0.id
		end
	}))
end

function var_0_0.OnDestroy(arg_41_0)
	return
end

return var_0_0
