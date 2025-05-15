local var_0_0 = class("IslandTechCentrePage", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandTechCentreUI"
end

function var_0_0.OnLoaded(arg_2_0)
	local var_2_0 = arg_2_0._tf:Find("left")

	setText(var_2_0:Find("level/name"), i18n1("岛屿等级"))

	arg_2_0.levelTF = var_2_0:Find("level/value")

	local var_2_1 = arg_2_0._tf:Find("right"):Find("view/content")

	arg_2_0.uiList = UIItemList.New(var_2_1, var_2_1:Find("tpl"))
	arg_2_0.detailPanel = IslandTechDetailPanel.New(arg_2_0._tf, arg_2_0.event, arg_2_0.contextData)
	arg_2_0.quickPanel = IslandTechQuickPanel.New(arg_2_0._tf, arg_2_0.event, arg_2_0.contextData)
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0._tf:Find("top/back"), function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0._tf:Find("top/home"), function()
		arg_3_0:emit(BaseUI.ON_HOME)
	end, SFX_PANEL)
	arg_3_0.uiList:make(function(arg_6_0, arg_6_1, arg_6_2)
		if arg_6_0 == UIItemList.EventInit then
			arg_3_0:InitVerticalItem(arg_6_1, arg_6_2)
		elseif arg_6_0 == UIItemList.EventUpdate then
			arg_3_0:UpdateVerticalItem(arg_6_1, arg_6_2)
		end
	end)
	arg_3_0:InifConfigData()
end

function var_0_0.AddListeners(arg_7_0)
	arg_7_0:AddListener(GAME.ISLAND_UNLOCK_TECH_DONE, arg_7_0.Flush)
	arg_7_0:AddListener(GAME.ISLAND_FINISH_TECH_IMMD_DONE, arg_7_0.Flush)
	arg_7_0:AddListener(GAME.ISLAND_FINISH_DELEGATION_DONE, arg_7_0.Flush)
	arg_7_0:AddListener(GAME.ISLAND_GET_DELEGATION_AWARD_DONE, arg_7_0.Flush)
end

function var_0_0.RemoveListeners(arg_8_0)
	arg_8_0:RemoveListener(GAME.ISLAND_UNLOCK_TECH_DONE, arg_8_0.Flush)
	arg_8_0:RemoveListener(GAME.ISLAND_FINISH_TECH_IMMD_DONE, arg_8_0.Flush)
	arg_8_0:RemoveListener(GAME.ISLAND_FINISH_DELEGATION_DONE, arg_8_0.Flush)
	arg_8_0:RemoveListener(GAME.ISLAND_GET_DELEGATION_AWARD_DONE, arg_8_0.Flush)
end

function var_0_0.InifConfigData(arg_9_0)
	arg_9_0.config = pg.island_technology_template
	arg_9_0.level2Ids = {}
	arg_9_0.levels = {}

	for iter_9_0, iter_9_1 in ipairs(arg_9_0.config.get_id_list_by_tech_belong[IslandTechBelong.CENTRE]) do
		local var_9_0 = arg_9_0.config[iter_9_1].island_level

		if not arg_9_0.level2Ids[var_9_0] then
			arg_9_0.level2Ids[var_9_0] = {}

			table.insert(arg_9_0.levels, var_9_0)
		end

		table.insert(arg_9_0.level2Ids[var_9_0], iter_9_1)
	end

	table.sort(arg_9_0.levels)

	arg_9_0.level2UIList = {}
end

function var_0_0.InitVerticalItem(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = arg_10_0.levels[arg_10_1 + 1]

	setText(arg_10_2:Find("level/lv"), "LV." .. var_10_0)
	setActive(arg_10_2:Find("line"), arg_10_1 + 1 ~= #arg_10_0.levels)

	local var_10_1 = arg_10_0.level2Ids[var_10_0]
	local var_10_2 = arg_10_2:Find("items_view/content")
	local var_10_3 = UIItemList.New(var_10_2, var_10_2:Find("tpl"))

	var_10_3:make(function(arg_11_0, arg_11_1, arg_11_2)
		if arg_11_0 == UIItemList.EventInit then
			arg_10_0:InitItem(arg_11_1, arg_11_2, var_10_0)
		elseif arg_11_0 == UIItemList.EventUpdate then
			arg_10_0:UpdateItem(arg_11_1, arg_11_2, var_10_0)
		end
	end)

	arg_10_0.level2UIList[var_10_0] = var_10_3
end

function var_0_0.UpdateVerticalItem(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = arg_12_0.levels[arg_12_1 + 1]

	setActive(arg_12_2:Find("lock"), var_12_0 > arg_12_0.islandLevel)
	arg_12_0.level2UIList[var_12_0]:align(#arg_12_0.level2Ids[var_12_0])
end

function var_0_0.InitItem(arg_13_0, arg_13_1, arg_13_2, arg_13_3)
	local var_13_0 = arg_13_0.level2Ids[arg_13_3]
	local var_13_1 = var_13_0[arg_13_1 + 1]
	local var_13_2 = arg_13_0.techAgency:GetTechnology(var_13_0[arg_13_1 + 1])

	setText(arg_13_2:Find("corner/Text"), arg_13_0.config[var_13_1].tech_level)
	LoadImageSpriteAsync("IslandTechnology/" .. arg_13_0.config[var_13_1].tech_icon, arg_13_2:Find("icon"), true)
	setActive(arg_13_2:Find("line"), arg_13_1 + 1 ~= #var_13_0)
end

function var_0_0.UpdateItem(arg_14_0, arg_14_1, arg_14_2, arg_14_3)
	local var_14_0 = arg_14_0.level2Ids[arg_14_3]
	local var_14_1 = var_14_0[arg_14_1 + 1]
	local var_14_2 = arg_14_0.techAgency:GetTechnology(var_14_0[arg_14_1 + 1])

	if not var_14_2:IsUnlock() then
		local var_14_3 = var_14_2:CanUnlock()

		setActive(arg_14_2:Find("unlock"), var_14_3)
		onButton(arg_14_0, arg_14_2, function()
			if var_14_2:CanUnlock() then
				arg_14_0:emit(IslandMediator.ON_UNLOCK_TECH, var_14_2.id)
			else
				pg.TipsMgr.GetInstance():ShowTips("不满足解锁条件")
			end
		end, SFX_PANEL)
	else
		onButton(arg_14_0, arg_14_2, function()
			arg_14_0.detailPanel:ExecuteAction("Show", var_14_2.id)
		end, SFX_PANEL)
		setActive(arg_14_2:Find("unlock"), false)
	end
end

function var_0_0.OnShow(arg_17_0)
	local var_17_0 = getProxy(IslandProxy):GetIsland()

	arg_17_0.islandLevel = var_17_0:GetLevel()

	setText(arg_17_0.levelTF, arg_17_0.islandLevel)

	arg_17_0.techAgency = var_17_0:GetTechnologyAgency()

	arg_17_0.quickPanel:ExecuteAction("Show")
	arg_17_0:Flush()
end

function var_0_0.Flush(arg_18_0)
	arg_18_0.uiList:align(#arg_18_0.levels)
	arg_18_0.quickPanel:ExecuteAction("Flush")
end

function var_0_0.OnHide(arg_19_0)
	arg_19_0.quickPanel:ExecuteAction("OffToggle")
	arg_19_0.quickPanel:ExecuteAction("Hide")
end

function var_0_0.OnDestroy(arg_20_0)
	if arg_20_0.detailPanel then
		arg_20_0.detailPanel:Destroy()

		arg_20_0.detailPanel = nil
	end

	if arg_20_0.quickPanel then
		arg_20_0.quickPanel:Destroy()

		arg_20_0.quickPanel = nil
	end
end

return var_0_0
