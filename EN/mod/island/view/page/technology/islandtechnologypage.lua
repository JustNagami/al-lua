local var_0_0 = class("IslandTechnologyPage", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandTechnologyUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.inviteBtn = arg_2_0._tf:Find("top/invite")
	arg_2_0.centreInfoTF = arg_2_0._tf:Find("left")

	local var_2_0 = arg_2_0._tf:Find("content")

	arg_2_0.typeUIList = UIItemList.New(var_2_0, var_2_0:GetChild(0))
	arg_2_0.quickPanel = IslandTechQuickPanel.New(arg_2_0._tf, arg_2_0.event, arg_2_0.contextData)
	arg_2_0.overviewPanel = IslandTechOverviewPanel.New(arg_2_0._tf, arg_2_0.event, arg_2_0.contextData)
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0._tf:Find("top/back"), function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0._tf:Find("top/home"), function()
		arg_3_0:emit(BaseUI.ON_HOME)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.inviteBtn, function()
		arg_3_0:OpenPage(IslandInvitePage)
		arg_3_0:FoldSubViewPanelPanel()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.centreInfoTF:Find("centre"), function()
		arg_3_0:OpenPage(IslandTechCentrePage)
		arg_3_0:FoldSubViewPanelPanel()
	end, SFX_PANEL)

	arg_3_0.types = IslandTechBelong.COMMON_SHOW_TYPES

	arg_3_0.typeUIList:make(function(arg_8_0, arg_8_1, arg_8_2)
		if arg_8_0 == UIItemList.EventInit then
			arg_3_0:InitTypeItem(arg_8_1, arg_8_2)
		elseif arg_8_0 == UIItemList.EventUpdate then
			arg_3_0:UpdateTypeItem(arg_8_1, arg_8_2)
		end
	end)
end

function var_0_0.AddListeners(arg_9_0)
	arg_9_0:AddListener(GAME.ISLAND_START_DELEGATION_DONE, arg_9_0.Flush)
	arg_9_0:AddListener(GAME.ISLAND_FINISH_TECH_IMMD_DONE, arg_9_0.Flush)
	arg_9_0:AddListener(GAME.ISLAND_FINISH_DELEGATION_DONE, arg_9_0.Flush)
	arg_9_0:AddListener(GAME.ISLAND_GET_DELEGATION_AWARD_DONE, arg_9_0.Flush)
end

function var_0_0.RemoveListeners(arg_10_0)
	arg_10_0:RemoveListener(GAME.ISLAND_START_DELEGATION_DONE, arg_10_0.Flush)
	arg_10_0:RemoveListener(GAME.ISLAND_FINISH_TECH_IMMD_DONE, arg_10_0.Flush)
	arg_10_0:RemoveListener(GAME.ISLAND_FINISH_DELEGATION_DONE, arg_10_0.Flush)
	arg_10_0:RemoveListener(GAME.ISLAND_GET_DELEGATION_AWARD_DONE, arg_10_0.Flush)
end

function var_0_0.OnShow(arg_11_0)
	arg_11_0:Flush()
	arg_11_0:CheckAutoFinish()
	arg_11_0:ShowSubViewPanel()
end

function var_0_0.Flush(arg_12_0)
	arg_12_0.techAgency = getProxy(IslandProxy):GetIsland():GetTechnologyAgency()

	arg_12_0.typeUIList:align(#arg_12_0.types)
	arg_12_0:FlushCentre()
	arg_12_0.quickPanel:ExecuteAction("Flush")
	arg_12_0.overviewPanel:ExecuteAction("Flush")
end

function var_0_0.CheckAutoFinish(arg_13_0)
	local var_13_0 = {}
	local var_13_1 = arg_13_0.techAgency:GetAutoFinishList()

	for iter_13_0, iter_13_1 in ipairs(var_13_1) do
		table.insert(var_13_0, function(arg_14_0)
			arg_13_0:emit(IslandMediator.ON_FINISH_TECH_IMMD, iter_13_1, arg_14_0)
		end)
	end

	seriesAsync(var_13_0, function()
		warning("auto finish end, cnt:", #var_13_1)
	end)
end

function var_0_0.InitTypeItem(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = arg_16_0.types[arg_16_1 + 1]

	setText(arg_16_2:Find("info/name"), IslandTechBelong.Names[var_16_0])
	LoadImageSpriteAsync("islandtechnology/type_" .. IslandTechBelong.Fields[var_16_0], arg_16_2:Find("info/icon"))
	onButton(arg_16_0, arg_16_2, function()
		arg_16_0:OpenPage(IslandTechTreePage, var_16_0)
		arg_16_0:FoldSubViewPanelPanel()
	end, SFX_PANEL)
end

function var_0_0.UpdateTypeItem(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = arg_18_0.types[arg_18_1 + 1]
	local var_18_1 = arg_18_0.techAgency:GetPctByType(var_18_0)

	setText(arg_18_2:Find("info/Text"), var_18_1)
	arg_18_0:UpdateProgress(arg_18_2:Find("info/progress"), var_18_1)
	setActive(arg_18_2:Find("line"), var_18_1 == 100)
end

function var_0_0.UpdateProgress(arg_19_0, arg_19_1, arg_19_2)
	setFillAmount(arg_19_1, arg_19_2 / 100)

	local var_19_0 = arg_19_2 == 0 or arg_19_2 == 100

	setActive(arg_19_1:Find("pointer"), not var_19_0)

	if not var_19_0 then
		local var_19_1 = arg_19_2 / 100 * 360

		setLocalEulerAngles(arg_19_1:Find("pointer"), {
			z = var_19_1
		})
		setLocalEulerAngles(arg_19_1:Find("pointer/mask/ring"), {
			z = 360 - var_19_1
		})
	end
end

function var_0_0.FlushCentre(arg_20_0)
	setText(arg_20_0.centreInfoTF:Find("level"), getProxy(IslandProxy):GetIsland():GetLevel())

	local var_20_0 = arg_20_0.techAgency:GetPctByType(IslandTechBelong.CENTRE)

	arg_20_0:UpdateProgress(arg_20_0.centreInfoTF:Find("progress"), var_20_0)
end

function var_0_0.ShowSubViewPanel(arg_21_0)
	arg_21_0.quickPanel:ExecuteAction("Show")
	arg_21_0.overviewPanel:ExecuteAction("Show")
end

function var_0_0.FoldSubViewPanelPanel(arg_22_0)
	arg_22_0.quickPanel:ExecuteAction("OffToggle")
	arg_22_0.overviewPanel:ExecuteAction("OffToggle")
end

function var_0_0.HideSubViewPanel(arg_23_0)
	arg_23_0:FoldSubViewPanelPanel()
	arg_23_0.quickPanel:ExecuteAction("Hide")
	arg_23_0.overviewPanel:ExecuteAction("Hide")
end

function var_0_0.OnHide(arg_24_0)
	arg_24_0:HideSubViewPanel()
end

function var_0_0.OnDestroy(arg_25_0)
	if arg_25_0.quickPanel then
		arg_25_0.quickPanel:Destroy()

		arg_25_0.quickPanel = nil
	end

	if arg_25_0.overviewPanel then
		arg_25_0.overviewPanel:Destroy()

		arg_25_0.overviewPanel = nil
	end
end

return var_0_0
