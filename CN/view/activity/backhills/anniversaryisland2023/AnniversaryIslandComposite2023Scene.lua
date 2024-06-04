local var_0_0 = class("AnniversaryIslandComposite2023Scene", import("view.base.BaseUI"))

var_0_0.FilterAll = bit.bor(1, 2)

function var_0_0.Ctor(arg_1_0)
	var_0_0.super.Ctor(arg_1_0)

	arg_1_0.loader = AutoLoader.New()
end

function var_0_0.getUIName(arg_2_0)
	return "AnniversaryIslandComposite2023UI"
end

local var_0_1 = "ui/AnniversaryIslandComposite2023UI_atlas"
local var_0_2 = "ui/AtelierCommonUI_atlas"

function var_0_0.preload(arg_3_0, arg_3_1)
	table.ParallelIpairsAsync({
		var_0_1,
		var_0_2
	}, function(arg_4_0, arg_4_1, arg_4_2)
		arg_3_0.loader:LoadBundle(arg_4_1, arg_4_2)
	end, arg_3_1)
end

function var_0_0.init(arg_5_0)
	arg_5_0.layerFormulaList = arg_5_0._tf:Find("Panel/FormulaList")
	arg_5_0.layerFormulaDetail = arg_5_0._tf:Find("Panel/FormulaDetail")
	arg_5_0.top = arg_5_0._tf:Find("Top")
	arg_5_0.formulaRect = arg_5_0.layerFormulaList:Find("ScrollView"):GetComponent("LScrollRect")

	local var_5_0 = arg_5_0.layerFormulaList:Find("Item")

	setActive(var_5_0, false)

	function arg_5_0.formulaRect.onUpdateItem(arg_6_0, arg_6_1)
		arg_5_0:UpdateFormulaListItem(arg_6_0 + 1, arg_6_1)
	end

	arg_5_0.formulaFilterButtons = _.map({
		1,
		2
	}, function(arg_7_0)
		return arg_5_0.layerFormulaList:Find("Tabs"):GetChild(arg_7_0 - 1)
	end)
	arg_5_0.lastEnv = nil
	arg_5_0.env = {}
	arg_5_0.listeners = {}

	setText(arg_5_0.layerFormulaList:Find("Empty"), i18n("workbench_tips5"))
	setText(arg_5_0.layerFormulaList:Find("Tabs/Furniture/UnSelected/Text"), i18n("word_furniture"))
	setText(arg_5_0.layerFormulaList:Find("Tabs/Furniture/Selected/Text"), i18n("word_furniture"))
	setText(arg_5_0.layerFormulaList:Find("Tabs/Item/UnSelected/Text"), i18n("workbench_tips7"))
	setText(arg_5_0.layerFormulaList:Find("Tabs/Item/Selected/Text"), i18n("workbench_tips7"))
	setText(arg_5_0.layerFormulaList:Find("Filter/Text"), i18n("workbench_tips10"))
	setText(arg_5_0.layerFormulaDetail:Find("Counters/Text"), i18n("workbench_tips8"))
	setText(arg_5_0.layerFormulaDetail:Find("MaterialsBG/MaterialsTitle"), i18n("workbench_tips9"))
end

function var_0_0.didEnter(arg_8_0)
	arg_8_0.contextData.filterType = arg_8_0.contextData.filterType or var_0_0.FilterAll

	table.Foreach(arg_8_0.formulaFilterButtons, function(arg_9_0, arg_9_1)
		onButton(arg_8_0, arg_9_1, function()
			local var_10_0 = bit.lshift(1, arg_9_0 - 1)

			if arg_8_0.contextData.filterType == var_0_0.FilterAll then
				arg_8_0.contextData.filterType = var_10_0
			elseif arg_8_0.contextData.filterType == var_10_0 then
				arg_8_0.contextData.filterType = var_0_0.FilterAll
			else
				arg_8_0.contextData.filterType = var_10_0
			end

			arg_8_0:UpdateFilterButtons()
			arg_8_0:FilterFormulas()
			arg_8_0:UpdateView()
		end, SFX_PANEL)
	end)

	arg_8_0.showOnlyComposite = PlayerPrefs.GetInt("workbench_show_composite_avaliable", 0) == 1

	triggerToggle(arg_8_0.layerFormulaList:Find("Filter/Toggle"), arg_8_0.showOnlyComposite)
	onToggle(arg_8_0, arg_8_0.layerFormulaList:Find("Filter/Toggle"), function(arg_11_0)
		arg_8_0.showOnlyComposite = arg_11_0

		PlayerPrefs.SetInt("workbench_show_composite_avaliable", arg_11_0 and 1 or 0)
		PlayerPrefs.Save()
		arg_8_0:FilterFormulas()
		arg_8_0:UpdateView()
	end)
	onButton(arg_8_0, arg_8_0._tf:Find("BG"), function()
		arg_8_0:onBackPressed()
	end)
	onButton(arg_8_0, arg_8_0._tf:Find("Top/Back"), function()
		arg_8_0:onBackPressed()
	end, SFX_CANCEL)
	onButton(arg_8_0, arg_8_0._tf:Find("Top/Home"), function()
		arg_8_0:quickExitFunc()
	end, SFX_CANCEL)
	onButton(arg_8_0, arg_8_0._tf:Find("Top/Help"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("workbench_help")
		})
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0._tf:Find("Top/Upgrade"), function()
		arg_8_0:emit(AnniversaryIslandComposite2023Mediator.OPEN_UPGRADE_PANEL)
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0._tf:Find("Top/StoreHouse"), function()
		arg_8_0:emit(AnniversaryIslandComposite2023Mediator.OPEN_STOREHOUSE)
	end, SFX_PANEL)
	arg_8_0:BindEnv({
		"filterFormulas",
		"formulas",
		"bagAct",
		"formulaId"
	}, function()
		arg_8_0:UpdateFormulaList()
	end)
	arg_8_0:BindEnv({
		"formulaId",
		"formulas",
		"bagAct"
	}, function(arg_19_0, arg_19_1)
		local var_19_0 = arg_19_0[1]

		arg_8_0:UpdateFormulaDetail(var_19_0)
	end)
	arg_8_0:BindEnv({
		"BuildingLv"
	}, function(arg_20_0)
		local var_20_0 = arg_20_0[1]

		arg_8_0.loader:GetSpriteQuiet("ui/AnniversaryIslandComposite2023UI_atlas", "title_" .. var_20_0, arg_8_0.top:Find("Title/Number"))
	end)
	arg_8_0:BindEnv({
		"tip"
	}, function(arg_21_0)
		setActive(arg_8_0._tf:Find("Top/Upgrade/Tip"), arg_21_0[1])
	end)

	arg_8_0.env.formulaId = arg_8_0.contextData.formulaId

	arg_8_0:UpdateFilterButtons()
	arg_8_0:BuildActivityEnv()
	arg_8_0:UpdateView()
end

function var_0_0.InitCounter(arg_22_0, arg_22_1, arg_22_2, arg_22_3, arg_22_4)
	arg_22_2[2] = math.max(arg_22_2[1], arg_22_2[2])

	local var_22_0 = arg_22_1
	local var_22_1 = arg_22_0.layerFormulaDetail:Find("Counters")

	assert(var_22_1)

	local function var_22_2()
		local var_23_0 = var_22_0

		if var_22_0 == 0 then
			var_23_0 = setColorStr(var_23_0, "#f9c461")
		end

		setText(var_22_1:Find("Number"), var_23_0)
		arg_22_3(var_22_0)
	end

	var_22_2()
	pressPersistTrigger(var_22_1:Find("Plus"), 0.5, function(arg_24_0)
		local var_24_0 = var_22_0

		var_22_0 = var_22_0 + 1
		var_22_0 = math.clamp(var_22_0, arg_22_2[1], arg_22_2[2])

		if var_24_0 == var_22_0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("workbench_tips3"))
			arg_24_0()

			return
		end

		var_22_2()
	end, nil, true, true, 0.1, SFX_PANEL)
	pressPersistTrigger(var_22_1:Find("Minus"), 0.5, function(arg_25_0)
		local var_25_0 = var_22_0

		var_22_0 = var_22_0 - 1
		var_22_0 = math.clamp(var_22_0, arg_22_2[1], arg_22_2[2])

		if var_25_0 == var_22_0 then
			arg_25_0()

			return
		end

		var_22_2()
	end, nil, true, true, 0.1, SFX_PANEL)
	onButton(arg_22_0, var_22_1:Find("Plus10"), function()
		local var_26_0 = var_22_0

		var_22_0 = var_22_0 + 10
		var_22_0 = math.clamp(var_22_0, arg_22_2[1], arg_22_2[2])

		if var_26_0 == var_22_0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("workbench_tips3"))

			return
		end

		var_22_2()
	end)
	onButton(arg_22_0, var_22_1:Find("Minus10"), function()
		var_22_0 = var_22_0 - 10
		var_22_0 = math.clamp(var_22_0, arg_22_2[1], arg_22_2[2])

		var_22_2()
	end)
	onButton(arg_22_0, arg_22_0.layerFormulaDetail:Find("Composite"), function()
		existCall(arg_22_4, var_22_0)
	end, SFX_PANEL)
end

local var_0_3 = {
	[DROP_TYPE_FURNITURE] = "word_furniture",
	[DROP_TYPE_WORKBENCH_DROP] = "workbench_tips7"
}

function var_0_0.UpdateFormulaListItem(arg_29_0, arg_29_1, arg_29_2)
	local var_29_0 = tf(arg_29_2)
	local var_29_1 = arg_29_0.env.filterFormulas[arg_29_1]
	local var_29_2 = var_29_1:GetProduction()
	local var_29_3 = var_29_0:Find("BG/Icon")

	assert(var_29_3)
	arg_29_0:UpdateActivityDrop(var_29_3, {
		type = var_29_2[1],
		id = var_29_2[2]
	}, true)

	local var_29_4 = var_0_3[var_29_2[1]]
	local var_29_5 = not var_29_1:IsUnlock()

	setActive(var_29_0:Find("Lock"), var_29_5)
	setActive(var_29_0:Find("BG"), not var_29_5)

	if var_29_5 then
		setText(var_29_0:Find("Lock/Text"), var_29_1:GetLockDesc())
	end

	setText(var_29_0:Find("BG/Type"), i18n(var_29_4))
	setScrollText(var_29_0:Find("BG/Name/Text"), var_29_1:GetName())
	setActive(var_29_0:Find("Selected"), var_29_1:GetConfigID() == arg_29_0.env.formulaId)

	local var_29_6 = var_29_1:IsAvaliable()

	setActive(var_29_0:Find("Completed"), not var_29_6)

	local var_29_7

	if var_29_1:GetMaxLimit() > 0 then
		local var_29_8 = var_29_1:GetMaxLimit() - var_29_1:GetUsedCount()

		var_29_7 = (var_29_8 <= 0 and setColorStr(var_29_8, "#bb6754") or var_29_8) .. "/" .. var_29_1:GetMaxLimit()
	else
		var_29_7 = "∞"
	end

	setText(var_29_0:Find("BG/Count"), var_29_7)
	onButton(arg_29_0, var_29_0, function()
		if not var_29_6 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("workbench_tips1"))

			return
		end

		if var_29_5 then
			local var_30_0 = var_29_1:GetLockLimit()

			pg.TipsMgr.GetInstance():ShowTips(i18n("workbench_tips4", var_30_0 and var_30_0[3]))

			return
		end

		arg_29_0.env.formulaId = var_29_1:GetConfigID()

		arg_29_0:UpdateView()
	end, SFX_PANEL)
end

function var_0_0.UpdateFilterButtons(arg_31_0)
	table.Foreach(arg_31_0.formulaFilterButtons, function(arg_32_0, arg_32_1)
		local var_32_0 = arg_31_0.contextData.filterType ~= var_0_0.FilterAll

		var_32_0 = var_32_0 and bit.band(arg_31_0.contextData.filterType, bit.lshift(1, arg_32_0 - 1)) > 0

		setActive(arg_32_1:Find("Selected"), var_32_0)
		setActive(arg_32_1:Find("UnSelected"), not var_32_0)
	end)
end

function var_0_0.BuildActivityEnv(arg_33_0)
	arg_33_0.env.formulas = _.map(pg.activity_workbench_recipe.all, function(arg_34_0)
		local var_34_0 = WorkBenchFormula.New({
			configId = arg_34_0
		})

		var_34_0:BuildFromActivity()

		return var_34_0
	end)

	if arg_33_0.env.formulaId then
		local var_33_0 = _.detect(arg_33_0.env.formulas, function(arg_35_0)
			return arg_35_0:GetConfigID() == arg_33_0.env.formulaId
		end)

		if not var_33_0 or not var_33_0:IsAvaliable() then
			arg_33_0.env.formulaId = nil
		end
	end

	local var_33_1 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_VIRTUAL_BAG)

	arg_33_0.env.bagAct = var_33_1

	local var_33_2 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BUILDING_BUFF_2)

	arg_33_0.env.BuildingLv = var_33_2:GetBuildingLevel(table.keyof(AnniversaryIsland2023Scene.Buildings, "craft"))
	arg_33_0.env.tip = AnniversaryIsland2023Scene.UpdateBuildingTip(nil, var_33_2, table.keyof(AnniversaryIsland2023Scene.Buildings, "craft"))

	arg_33_0:FilterFormulas()
end

function var_0_0.FilterFormulas(arg_36_0)
	local var_36_0 = {}
	local var_36_1 = arg_36_0.contextData.filterType

	local function var_36_2(arg_37_0)
		if var_36_1 == var_0_0.FilterAll then
			return true
		end

		return switch(arg_37_0:GetProduction()[1], {
			[DROP_TYPE_WORKBENCH_DROP] = function()
				return bit.band(var_36_1, 1) > 0
			end
		}, function()
			return bit.band(var_36_1, 2) > 0
		end)
	end

	for iter_36_0, iter_36_1 in ipairs(_.values(arg_36_0.env.formulas)) do
		if var_36_2(iter_36_1) and (not arg_36_0.showOnlyComposite or iter_36_1:IsUnlock() and iter_36_1:IsAvaliable() and _.all(iter_36_1:GetMaterials(), function(arg_40_0)
			local var_40_0 = arg_40_0[1]
			local var_40_1 = arg_40_0[2]

			return arg_40_0[3] <= arg_36_0.env.bagAct:getVitemNumber(var_40_1)
		end)) then
			table.insert(var_36_0, iter_36_1)
		end
	end

	local var_36_3 = CompareFuncs({
		function(arg_41_0)
			return arg_41_0:IsAvaliable() and 0 or 1
		end,
		function(arg_42_0)
			return arg_42_0:IsUnlock() and 0 or 1
		end,
		function(arg_43_0)
			return arg_43_0:GetConfigID()
		end
	})

	table.sort(var_36_0, var_36_3)

	arg_36_0.env.filterFormulas = var_36_0
end

function var_0_0.UpdateFormulaList(arg_44_0)
	local var_44_0 = #arg_44_0.env.filterFormulas == 0

	setActive(arg_44_0.layerFormulaList:Find("Empty"), var_44_0)
	setActive(arg_44_0.layerFormulaList:Find("ScrollView"), not var_44_0)
	arg_44_0.formulaRect:SetTotalCount(#arg_44_0.env.filterFormulas)
end

function var_0_0.UpdateFormulaDetail(arg_45_0, arg_45_1)
	arg_45_0.contextData.formulaId = arg_45_1

	setActive(arg_45_0.layerFormulaDetail, arg_45_1)

	if not arg_45_1 then
		return
	end

	local var_45_0 = _.detect(arg_45_0.env.formulas, function(arg_46_0)
		return arg_46_0:GetConfigID() == arg_45_1
	end)

	assert(var_45_0)

	local var_45_1 = var_45_0:GetProduction()
	local var_45_2 = var_45_0:GetMaterials()
	local var_45_3 = 100

	;(function()
		local var_47_0 = {
			type = var_45_1[1],
			id = var_45_1[2],
			count = var_45_1[3]
		}
		local var_47_1 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_WORKBENCH)
		local var_47_2 = var_45_0:GetMaxLimit()

		if var_47_2 > 0 then
			var_45_3 = var_47_2 - var_47_1:GetFormulaUseCount(arg_45_1)
		end

		local var_47_3 = arg_45_0.layerFormulaDetail:Find("Icon")

		assert(var_47_3)
		arg_45_0:UpdateActivityDrop(var_47_3, var_47_0)
		onButton(arg_45_0, var_47_3, function()
			if var_47_0.type == DROP_TYPE_WORKBENCH_DROP then
				arg_45_0:emit(WorkBenchItemDetailMediator.SHOW_DETAIL, WorkBenchItem.New({
					configId = var_47_0.id,
					count = var_47_0.count
				}))
			else
				arg_45_0:emit(BaseUI.ON_DROP, var_47_0)
			end
		end)
		setText(arg_45_0.layerFormulaDetail:Find("Name"), var_47_0:getConfig("name"))
	end)()

	local var_45_4 = var_45_3
	local var_45_5 = arg_45_0.env.bagAct

	UIItemList.StaticAlign(arg_45_0.layerFormulaDetail:Find("Materials"), arg_45_0.layerFormulaDetail:Find("Materials/Item"), #var_45_2, function(arg_49_0, arg_49_1, arg_49_2)
		if arg_49_0 ~= UIItemList.EventUpdate then
			return
		end

		local var_49_0 = var_45_2[arg_49_1 + 1]
		local var_49_1 = {
			type = var_49_0[1],
			id = var_49_0[2],
			count = var_49_0[3]
		}

		arg_45_0:UpdateActivityDrop(arg_49_2:Find("Icon"), var_49_1)
		onButton(arg_45_0, arg_49_2:Find("Icon"), function()
			if var_49_1.type == DROP_TYPE_WORKBENCH_DROP then
				arg_45_0:emit(WorkBenchItemDetailMediator.SHOW_DETAIL, WorkBenchItem.New({
					configId = var_49_1.id,
					count = var_49_1.count
				}))
			else
				arg_45_0:emit(BaseUI.ON_DROP, var_49_1)
			end
		end)

		local var_49_2 = var_49_0[2]
		local var_49_3 = var_49_0[3]
		local var_49_4 = var_45_5:getVitemNumber(var_49_2)

		if var_49_3 > 0 then
			var_45_4 = math.min(var_45_4, math.floor(var_49_4 / var_49_3))
		end
	end)

	local function var_45_6(arg_51_0)
		UIItemList.StaticAlign(arg_45_0.layerFormulaDetail:Find("Materials"), arg_45_0.layerFormulaDetail:Find("Materials/Item"), #var_45_2, function(arg_52_0, arg_52_1, arg_52_2)
			if arg_52_0 ~= UIItemList.EventUpdate then
				return
			end

			local var_52_0 = var_45_2[arg_52_1 + 1]
			local var_52_1 = var_52_0[2]
			local var_52_2 = var_52_0[3]
			local var_52_3 = var_45_5:getVitemNumber(var_52_1)

			arg_51_0 = math.max(arg_51_0, 1)

			local var_52_4 = var_52_2 * arg_51_0
			local var_52_5 = setColorStr(var_52_3, var_52_3 < var_52_4 and "#bb6754" or "#6b5a48")

			setText(arg_52_2:Find("Text"), var_52_5 .. "/" .. var_52_4)
		end)
	end

	local var_45_7 = math.min(1, var_45_4)

	arg_45_0:InitCounter(var_45_7, {
		0,
		var_45_4
	}, var_45_6, function(arg_53_0)
		arg_45_0:emit(GAME.WORKBENCH_COMPOSITE, arg_45_1, arg_53_0)
	end)
	var_45_6(var_45_7)
end

function var_0_0.BindEnv(arg_54_0, arg_54_1, arg_54_2)
	table.insert(arg_54_0.listeners, {
		keys = arg_54_1,
		func = arg_54_2
	})
end

function var_0_0.RefreshData(arg_55_0)
	arg_55_0.lastEnv = arg_55_0.lastEnv or {}

	local var_55_0 = {}
	local var_55_1

	local function var_55_2(arg_56_0, arg_56_1)
		if var_55_0[arg_56_0] then
			return
		end

		var_55_0[arg_56_0] = arg_56_1
		var_55_1 = var_55_1 or {}

		local var_56_0 = _.select(arg_55_0.listeners, function(arg_57_0)
			return table.contains(arg_57_0.keys, arg_56_0)
		end)

		_.each(var_56_0, function(arg_58_0)
			var_55_1[arg_58_0] = true
		end)
	end

	for iter_55_0, iter_55_1 in pairs(arg_55_0.env) do
		if iter_55_1 ~= arg_55_0.lastEnv[iter_55_0] then
			var_55_2(iter_55_0, iter_55_1)
		end
	end

	for iter_55_2, iter_55_3 in pairs(arg_55_0.lastEnv) do
		local var_55_3 = arg_55_0.env[iter_55_2]

		if iter_55_3 ~= var_55_3 then
			var_55_2(iter_55_2, var_55_3)
		end
	end

	if var_55_1 then
		table.Foreach(var_55_1, function(arg_59_0)
			local var_59_0 = table.map(arg_59_0.keys, function(arg_60_0)
				return arg_55_0.env[arg_60_0]
			end)
			local var_59_1 = table.map(arg_59_0.keys, function(arg_61_0)
				return arg_55_0.lastEnv[arg_61_0]
			end)

			arg_59_0.func(var_59_0, var_59_1)
		end)
	end

	arg_55_0.lastEnv = table.shallowCopy(arg_55_0.env)
end

function var_0_0.UpdateView(arg_62_0)
	arg_62_0:RefreshData()
	AnniversaryIsland2023Scene.PlayStory()
end

function var_0_0.OnReceiveFormualRequest(arg_63_0, arg_63_1)
	arg_63_0.env.formulaId = arg_63_1

	arg_63_0:UpdateView()
end

function var_0_0.UpdateActivityDrop(arg_64_0, arg_64_1, arg_64_2, arg_64_3)
	updateDrop(arg_64_1, arg_64_2)
	SetCompomentEnabled(arg_64_1:Find("icon_bg"), typeof(Image), false)
	setActive(arg_64_1:Find("bg"), false)
	setActive(arg_64_1:Find("icon_bg/frame"), false)
	setActive(arg_64_1:Find("icon_bg/stars"), false)

	local var_64_0 = arg_64_2:getConfig("rarity")

	if arg_64_2.type == DROP_TYPE_EQUIP or arg_64_2.type == DROP_TYPE_EQUIPMENT_SKIN then
		var_64_0 = var_64_0 - 1
	end

	local var_64_1 = "icon_frame_" .. var_64_0

	if arg_64_3 then
		var_64_1 = var_64_1 .. "_small"
	end

	arg_64_0.loader:GetSpriteQuiet(var_0_2, var_64_1, arg_64_1)
end

function var_0_0.willExit(arg_65_0)
	arg_65_0.loader:Clear()
end

return var_0_0
