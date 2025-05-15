local var_0_0 = class("IslandMapPage", import("...base.IslandBasePage"))

var_0_0.HIDE_DESC = "IslandMapPage:HIDE_DESC"

function var_0_0.getUIName(arg_1_0)
	return "IslandMapUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.maps = {
		[1001] = arg_2_0:findTF("bg/1001"),
		[1002] = arg_2_0:findTF("bg/1002"),
		[1003] = arg_2_0:findTF("bg/1003"),
		[1004] = arg_2_0:findTF("bg/1004"),
		[1005] = arg_2_0:findTF("bg/1005")
	}

	setText(arg_2_0:findTF("adapt/title/Text"), i18n1("岛屿地图"))
end

function var_0_0.OnInit(arg_3_0)
	for iter_3_0, iter_3_1 in pairs(arg_3_0.maps) do
		onButton(arg_3_0, iter_3_1, function()
			if not arg_3_0:CheckUnlock(iter_3_0) then
				return
			end

			arg_3_0:ShowDesc(iter_3_0)
		end, SFX_PANEL)
	end

	onButton(arg_3_0, arg_3_0._tf:Find("bg"), function()
		if arg_3_0.selectedId then
			arg_3_0:HideSelected()
		end
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0._tf:Find("adapt/back"), function()
		arg_3_0:ClosePage(IslandMapPage)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0._tf:Find("adapt/home"), function()
		arg_3_0:emit(BaseUI.ON_HOME)
	end, SFX_PANEL)
	arg_3_0:bind(var_0_0.HIDE_DESC, function()
		arg_3_0:HideSelected()
	end)

	arg_3_0.timers = {}
end

function var_0_0.OnShow(arg_9_0)
	arg_9_0:Flush()
end

function var_0_0.Flush(arg_10_0)
	for iter_10_0, iter_10_1 in pairs(arg_10_0.maps) do
		setActive(iter_10_1:Find("selcted"), false)

		local var_10_0 = arg_10_0:CheckUnlock(iter_10_0)

		setActive(iter_10_1:Find("lock"), not var_10_0)

		if var_10_0 then
			arg_10_0:CheckProductions(iter_10_0)
			arg_10_0:CheckAcceptableTask(iter_10_0)
			arg_10_0:CheckFinishableTask(iter_10_0)
		else
			setActive(iter_10_1:Find("full"), false)
			setActive(iter_10_1:Find("finish"), false)
			setActive(iter_10_1:Find("fetch"), false)
		end
	end
end

function var_0_0.OnHide(arg_11_0)
	arg_11_0:RemoveAllTimer()
end

function var_0_0.CheckUnlock(arg_12_0, arg_12_1)
	return (getProxy(IslandProxy):GetIsland():GetAblityAgency():IsUnlockMap(arg_12_1))
end

function var_0_0.CheckAcceptableTask(arg_13_0, arg_13_1)
	local function var_13_0(arg_14_0)
		local var_14_0 = arg_13_0.maps[arg_13_1]

		SetActive(var_14_0:Find("fetch"), arg_14_0)
	end

	local var_13_1 = getProxy(IslandProxy):GetIsland():GetTaskAgency():GetCanAcceptTasksByMapId(arg_13_1)

	var_13_0(#var_13_1 > 0)
end

function var_0_0.CheckFinishableTask(arg_15_0, arg_15_1)
	local function var_15_0(arg_16_0)
		local var_16_0 = arg_15_0.maps[arg_15_1]

		SetActive(var_16_0:Find("finish"), arg_16_0)
	end

	local var_15_1 = getProxy(IslandProxy):GetIsland():GetTaskAgency():GetCanSubmitTasksByMapId(arg_15_1)

	var_15_0(#var_15_1 > 0)
end

function var_0_0.CheckProductions(arg_17_0, arg_17_1)
	local function var_17_0(arg_18_0)
		local var_18_0 = arg_17_0.maps[arg_17_1]

		SetActive(var_18_0:Find("full"), arg_18_0)
	end

	if arg_17_0.timers[arg_17_1] then
		arg_17_0.timers[arg_17_1]:Stop()

		arg_17_0.timers[arg_17_1] = nil
	end

	local var_17_1 = getProxy(IslandProxy):GetIsland():GetBuildingAgency():GetMinimumDelegationCompletionTimeByMapId(arg_17_1)

	if var_17_1 < 0 then
		var_17_0(false)

		return
	end

	local var_17_2 = var_17_1 - pg.TimeMgr.GetInstance():GetServerTime()

	if var_17_2 <= 0 then
		var_17_0(true)

		return
	end

	arg_17_0.timers[arg_17_1] = Timer.New(function()
		var_17_0(true)
	end, var_17_2, 1)

	arg_17_0.timers[arg_17_1]:Start()
end

function var_0_0.RemoveAllTimer(arg_20_0)
	for iter_20_0, iter_20_1 in pairs(arg_20_0.timers) do
		iter_20_1:Stop()
	end

	arg_20_0.timers = {}
end

function var_0_0.ShowDesc(arg_21_0, arg_21_1)
	if arg_21_0.selectedId then
		arg_21_0:HideSelected(arg_21_0.selectedId)
	end

	local var_21_0 = arg_21_0.maps[arg_21_1]

	setActive(var_21_0:Find("selcted"), true)
	arg_21_0:OpenPage(IslandMapDescPage, arg_21_1)

	arg_21_0.selectedId = arg_21_1
end

function var_0_0.HideSelected(arg_22_0)
	local var_22_0 = arg_22_0.selectedId
	local var_22_1 = arg_22_0.maps[var_22_0]

	setActive(var_22_1:Find("selcted"), false)
	arg_22_0:ClosePage(IslandMapDescPage)

	arg_22_0.selectedId = nil
end

function var_0_0.OnDestroy(arg_23_0)
	arg_23_0:RemoveAllTimer()
end

return var_0_0
