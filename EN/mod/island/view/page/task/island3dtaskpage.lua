local var_0_0 = class("Island3dTaskPage", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "Island3dTaskUI"
end

function var_0_0.OnLoaded(arg_2_0)
	local var_2_0 = arg_2_0._tf:Find("toggles/content")

	arg_2_0.toggleUIList = UIItemList.New(var_2_0, var_2_0:Find("tpl"))

	local var_2_1 = arg_2_0._tf:Find("types/content")

	arg_2_0.typeUIList = UIItemList.New(var_2_1, var_2_1:Find("type_tpl"))
	arg_2_0.emptyTF = arg_2_0._tf:Find("detail/empty")
	arg_2_0.detailTF = arg_2_0._tf:Find("detail/content")
	arg_2_0.titleBg = arg_2_0.detailTF:Find("title")
	arg_2_0.typeIcon = arg_2_0.detailTF:Find("title/icon")
	arg_2_0.nameTF = arg_2_0.detailTF:Find("title/icon/name")
	arg_2_0.timeTF = arg_2_0.detailTF:Find("title/time")
	arg_2_0.descTF = arg_2_0.detailTF:Find("desc")
	arg_2_0.targetTF = arg_2_0.detailTF:Find("targets")

	setText(arg_2_0.targetTF:Find("Text"), i18n1("任务目标："))

	arg_2_0.finishedTargetTF = arg_2_0.targetTF:Find("finished")
	arg_2_0.targetContent = arg_2_0.targetTF:Find("content")
	arg_2_0.targetUIList = UIItemList.New(arg_2_0.targetContent, arg_2_0.targetContent:Find("tpl"))
	arg_2_0.awardsTF = arg_2_0.detailTF:Find("awards")

	setText(arg_2_0.awardsTF:Find("title/Text"), i18n1("任务奖励"))

	local var_2_2 = arg_2_0.awardsTF:Find("view/mask/content")

	arg_2_0.awardUIList = UIItemList.New(var_2_2, var_2_2:Find("tpl"))
	arg_2_0.detailBtns = arg_2_0.detailTF:Find("btns")
	arg_2_0.traceBtn = arg_2_0.detailBtns:Find("trace")

	setText(arg_2_0.traceBtn:Find("Text"), i18n1("追踪任务"))

	arg_2_0.tracedBtn = arg_2_0.detailBtns:Find("traced")

	setText(arg_2_0.tracedBtn:Find("Text"), i18n1("已追踪"))

	arg_2_0.submitBtn = arg_2_0.detailBtns:Find("submit")
	arg_2_0.acceptBtn = arg_2_0._tf:Find("top/accept")
	arg_2_0.acceptPanel = arg_2_0._tf:Find("accept_panel")

	setActive(arg_2_0.acceptPanel, false)

	arg_2_0.acceptUIList = UIItemList.New(arg_2_0.acceptPanel:Find("Viewport/Content"), arg_2_0.acceptPanel:Find("Viewport/Content/tpl"))

	arg_2_0.acceptUIList:make(function(arg_3_0, arg_3_1, arg_3_2)
		if arg_3_0 == UIItemList.EventUpdate then
			local var_3_0 = arg_2_0.canAcceptTask[arg_3_1 + 1]

			setText(arg_3_2:Find("id"), var_3_0.id)
			setText(arg_3_2:Find("name"), var_3_0:getConfig("name"))
			onButton(arg_2_0, arg_3_2:Find("btn"), function()
				arg_2_0:emit(IslandMediator.ON_ACCEPT_TASK, {
					var_3_0.id
				})
				setActive(arg_2_0.acceptPanel, false)
				arg_2_0:Hide()
			end, SFX_PANEL)
		end
	end)
	onButton(arg_2_0, arg_2_0.acceptBtn, function()
		arg_2_0.canAcceptTask = getProxy(IslandProxy):GetIsland():GetTaskAgency():GetCanAcceptTasks()

		arg_2_0.acceptUIList:align(#arg_2_0.canAcceptTask)
		setActive(arg_2_0.acceptPanel, #arg_2_0.canAcceptTask > 0)
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.acceptPanel:Find("close"), function()
		setActive(arg_2_0.acceptPanel, false)
	end, SFX_PANEL)
end

function var_0_0.OnInit(arg_7_0)
	onButton(arg_7_0, arg_7_0._tf:Find("top/back"), function()
		arg_7_0:Hide()
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0._tf:Find("top/home"), function()
		arg_7_0:emit(BaseUI.ON_HOME)
	end, SFX_PANEL)
	arg_7_0.toggleUIList:make(function(arg_10_0, arg_10_1, arg_10_2)
		if arg_10_0 == UIItemList.EventInit then
			arg_7_0:InitToggleItem(arg_10_1, arg_10_2)
		end
	end)

	arg_7_0.toggleList = underscore.keys(IslandTaskType.ShowTypeNames)

	table.sort(arg_7_0.toggleList)
	arg_7_0.toggleUIList:align(#arg_7_0.toggleList)
	arg_7_0.typeUIList:make(function(arg_11_0, arg_11_1, arg_11_2)
		if arg_11_0 == UIItemList.EventUpdate then
			arg_7_0:UpdateTypeItem(arg_11_1, arg_11_2)
		end
	end)
	arg_7_0.targetUIList:make(function(arg_12_0, arg_12_1, arg_12_2)
		if arg_12_0 == UIItemList.EventUpdate then
			arg_7_0:UpdateTargetItem(arg_12_1, arg_12_2)
		end
	end)
	arg_7_0.awardUIList:make(function(arg_13_0, arg_13_1, arg_13_2)
		if arg_13_0 == UIItemList.EventUpdate then
			local var_13_0 = arg_7_0.showAwards[arg_13_1 + 1]

			updateDrop(arg_13_2, var_13_0)
		end
	end)
	triggerToggle(arg_7_0.toggleUIList.container:GetChild(0), true)
end

function var_0_0.AddListeners(arg_14_0)
	arg_14_0:AddListener(GAME.ISLAND_SET_TRACE_TASK_DONE, arg_14_0.Flush)
	arg_14_0:AddListener(GAME.ISLAND_ACCEPT_TASK_DONE, arg_14_0.Flush)
	arg_14_0:AddListener(GAME.ISLAND_SUBMIT_TASK_DONE, arg_14_0.Flush)
	arg_14_0:AddListener(GAME.ISLAND_UPDATE_TASK_DONE, arg_14_0.Flush)
	arg_14_0:AddListener(GAME.ISLAND_GET_RANDOM_REFRESH_TASK_DONE, arg_14_0.Flush)
	arg_14_0:AddListener(IslandTaskAgency.TASK_ADDED, arg_14_0.Flush)
	arg_14_0:AddListener(IslandTaskAgency.TASK_UPDATED, arg_14_0.Flush)
	arg_14_0:AddListener(IslandTaskAgency.TASK_REMOVED, arg_14_0.Flush)
end

function var_0_0.RemoveListener(arg_15_0)
	arg_15_0:RemoveListener(GAME.ISLAND_SET_TRACE_TASK_DONE, arg_15_0.Flush)
	arg_15_0:RemoveListener(GAME.ISLAND_ACCEPT_TASK_DONE, arg_15_0.Flush)
	arg_15_0:RemoveListener(GAME.ISLAND_SUBMIT_TASK_DONE, arg_15_0.Flush)
	arg_15_0:RemoveListener(GAME.ISLAND_UPDATE_TASK_DONE, arg_15_0.Flush)
	arg_15_0:RemoveListener(GAME.ISLAND_GET_RANDOM_REFRESH_TASK_DONE, arg_15_0.Flush)
	arg_15_0:RemoveListener(IslandTaskAgency.TASK_ADDED, arg_15_0.Flush)
	arg_15_0:RemoveListener(IslandTaskAgency.TASK_UPDATED, arg_15_0.Flush)
	arg_15_0:RemoveListener(IslandTaskAgency.TASK_REMOVED, arg_15_0.Flush)
end

function var_0_0.InitToggleItem(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = arg_16_0.toggleList[arg_16_1 + 1]

	arg_16_2.name = var_16_0

	local var_16_1 = IslandTaskType.ShowTypeNames[var_16_0]

	setText(arg_16_2:Find("unsel"), var_16_1)
	setText(arg_16_2:Find("sel/content/Text"), var_16_1)

	if var_16_0 ~= IslandTaskType.SHOW_ALL then
		LoadImageSpriteAsync("islandtasktype/" .. IslandTaskType.ShowTypeFields[var_16_0], arg_16_2:Find("sel/content/Image"))
	end

	onToggle(arg_16_0, arg_16_2, function(arg_17_0)
		if arg_17_0 and (not arg_16_0.selectedType or arg_16_0.selectedType ~= var_16_0) then
			arg_16_0.selectedType = var_16_0

			arg_16_0:Flush()
		end
	end, SFX_PANEL)
end

function var_0_0.UpdateTypeItem(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = arg_18_0.showTypeList[arg_18_1 + 1]

	arg_18_2.name = var_18_0

	local var_18_1 = IslandTaskType.ShowTypeNames[var_18_0]

	setText(arg_18_2:Find("title/Text"), var_18_1)
	setImageColor(arg_18_2:Find("title"), Color.NewHex(IslandTaskType.ShowTypeColors[var_18_0]))
	LoadImageSpriteAsync("islandtasktype/" .. IslandTaskType.ShowTypeFields[var_18_0], arg_18_2:Find("title/Image"))
	setActive(arg_18_2:Find("line"), arg_18_1 + 1 ~= #arg_18_0.showTypeList)

	local var_18_2 = UIItemList.New(arg_18_2:Find("list"), arg_18_2:Find("list"):GetChild(0))

	var_18_2:make(function(arg_19_0, arg_19_1, arg_19_2)
		if arg_19_0 == UIItemList.EventUpdate then
			local var_19_0 = arg_18_0.showTaskDict[var_18_0][arg_19_1 + 1]

			arg_18_0:UpdateTaskItem(arg_19_2, var_19_0)
		end
	end)

	local var_18_3 = arg_18_0.showTaskDict[var_18_0] and arg_18_0.showTaskDict[var_18_0] or {}

	var_18_2:align(#var_18_3)
end

function var_0_0.UpdateTaskItem(arg_20_0, arg_20_1, arg_20_2)
	arg_20_1.name = arg_20_2.id

	local var_20_0 = arg_20_2:GetShowType()

	setImageColor(arg_20_1:Find("main/line"), Color.NewHex(IslandTaskType.ShowTypeColors[var_20_0]))
	setText(arg_20_1:Find("main/desc"), arg_20_2:GetDesc())

	local var_20_1 = arg_20_2:IsSeries()

	setText(arg_20_1:Find("main/name"), var_20_1 and arg_20_2:GetSeriesTitle() or arg_20_2:GetName())
	setActive(arg_20_1:Find("sub"), var_20_1)
	setActive(arg_20_1:Find("main/location"), not var_20_1)
	setActive(arg_20_1:Find("main/desc"), not var_20_1)

	if var_20_1 then
		local var_20_2 = IslandTaskType.ShowTypeFields[var_20_0]

		LoadImageSpriteAtlasAsync("ui/island3dtaskui_atlas", "color_" .. var_20_2, arg_20_1:Find("sub/bg"))
		setText(arg_20_1:Find("sub/name"), arg_20_2:GetName())
		arg_20_0:UpdateLocation(arg_20_1:Find("sub/location"), arg_20_2)
	else
		arg_20_0:UpdateLocation(arg_20_1:Find("main/location"), arg_20_2)
	end

	onToggle(arg_20_0, arg_20_1, function(arg_21_0)
		if arg_21_0 and (not arg_20_0.selectedTaskId or arg_20_0.selectedTaskId ~= arg_20_2.id) then
			arg_20_0.selectedTaskId = arg_20_2.id

			arg_20_0:FlushDetail()
		end
	end, SFX_PANEL)
end

function var_0_0.UpdateLocation(arg_22_0, arg_22_1, arg_22_2)
	setActive(arg_22_1, arg_22_2.id == arg_22_0.trackTaskId)

	if arg_22_2.id == arg_22_0.trackTaskId then
		local var_22_0 = arg_22_2:GetTraceParam()
		local var_22_1 = tonumber(var_22_0)

		setActive(arg_22_1, var_22_1)

		if var_22_1 then
			local var_22_2 = pg.island_world_objects[var_22_1].mapId
			local var_22_3 = var_22_2 == arg_22_0.curMapId and arg_22_0:CalcDistance(var_22_1) .. "m" or pg.island_map[var_22_2].name

			setText(arg_22_1:Find("Text"), var_22_3)
		end
	end
end

function var_0_0.CalcDistance(arg_23_0, arg_23_1)
	local var_23_0 = _IslandCore:GetView():GetPlayerPosition()
	local var_23_1 = _IslandCore:GetView():GetUnitPosition(arg_23_1) or var_23_0
	local var_23_2 = Vector3.Distance(var_23_0, var_23_1)

	return math.ceil(var_23_2)
end

function var_0_0.UpdateTargetItem(arg_24_0, arg_24_1, arg_24_2)
	local var_24_0 = arg_24_0.showTargets[arg_24_1 + 1]

	setText(arg_24_2:Find("content/Text"), var_24_0:getConfig("name"))

	local var_24_1 = var_24_0:GetProgress()
	local var_24_2 = var_24_0:GetTargetNum()

	setText(arg_24_2:Find("content/num"), string.format("(%d/%d)", var_24_1, var_24_2))

	local var_24_3 = var_24_0:IsFinish()

	setActive(arg_24_2:Find("status/unfinish"), not var_24_3)
	setActive(arg_24_2:Find("status/finished"), var_24_3)

	local var_24_4, var_24_5 = arg_24_0.showVO:GetTraceParam()
	local var_24_6 = arg_24_2:Find("content/location")
	local var_24_7 = var_24_5 and var_24_5 == arg_24_1 + 1

	setActive(var_24_6, var_24_7)

	if var_24_7 then
		arg_24_0:UpdateLocation(var_24_6, arg_24_0.showVO)
	end

	onButton(arg_24_0, arg_24_2:Find("content/add_progress"), function()
		arg_24_0:emit(IslandMediator.ON_CLIENT_UPDATE_TASK, {
			progress = 1,
			taskId = arg_24_0.showVO.id,
			targetId = var_24_0.id
		})
	end, SFX_PANEL)
end

function var_0_0.Flush(arg_26_0, arg_26_1)
	local var_26_0 = getProxy(IslandProxy):GetIsland()

	arg_26_0.curMapId = var_26_0:GetMapId()
	arg_26_0.taskAgency = var_26_0:GetTaskAgency()
	arg_26_0.trackTaskId = arg_26_0.taskAgency:GetTraceId()

	local var_26_1 = arg_26_0.taskAgency:GetTasks()

	arg_26_0.showTaskDict = {}

	for iter_26_0, iter_26_1 in pairs(var_26_1) do
		local var_26_2 = iter_26_1:GetShowType()

		if not arg_26_0.showTaskDict[var_26_2] then
			arg_26_0.showTaskDict[var_26_2] = {}
		end

		table.insert(arg_26_0.showTaskDict[var_26_2], iter_26_1)
	end

	arg_26_0.showTypeList = {
		arg_26_0.selectedType
	}

	if arg_26_0.selectedType == IslandTaskType.SHOW_ALL then
		arg_26_0.showTypeList = underscore.keys(IslandTaskType.ShowTypeFields)
	end

	table.sort(arg_26_0.showTypeList)
	arg_26_0.typeUIList:align(#arg_26_0.showTypeList)

	if not arg_26_0.selectedTaskId or not arg_26_0.showVO or not table.contains(arg_26_0.showTypeList, arg_26_0.showVO:GetShowType()) then
		arg_26_0:PingFirstTask()
	else
		arg_26_0:FlushDetail()
	end

	if isActive(arg_26_0.acceptPanel) then
		triggerButton(arg_26_0.acceptBtn)
	end
end

function var_0_0.PingFirstTask(arg_27_0)
	local var_27_0 = underscore.detect(arg_27_0.showTypeList, function(arg_28_0)
		return arg_27_0.showTaskDict[arg_28_0] and #arg_27_0.showTaskDict[arg_28_0] > 0
	end)

	if var_27_0 then
		triggerToggle(arg_27_0.typeUIList.container:Find(var_27_0 .. "/list"):GetChild(0), true)
	else
		arg_27_0.selectedTaskId = nil

		arg_27_0:FlushDetail()
	end
end

function var_0_0.FlushDetail(arg_29_0)
	setActive(arg_29_0.detailTF, arg_29_0.selectedTaskId)
	setActive(arg_29_0.emptyTF, not arg_29_0.selectedTaskId)

	if arg_29_0.selectedTaskId then
		arg_29_0.showVO = arg_29_0.taskAgency:GetTask(arg_29_0.selectedTaskId)

		local var_29_0 = arg_29_0.showVO:GetShowType()
		local var_29_1 = IslandTaskType.ShowTypeFields[var_29_0]

		LoadImageSpriteAtlasAsync("ui/island3dtaskui_atlas", "title_bg_" .. var_29_1, arg_29_0.titleBg)
		LoadImageSpriteAtlasAsync("ui/island3dtaskui_atlas", "title_icon_" .. var_29_1, arg_29_0.typeIcon)
		setText(arg_29_0.nameTF, arg_29_0.showVO:GetName())
		setActive(arg_29_0.timeTF, var_29_0 == IslandTaskType.SHOW_ACTIVITY)

		if var_29_0 == IslandTaskType.SHOW_ACTIVITY then
			setText(arg_29_0.timeTF:Find("Text"), arg_29_0.showVO:GetRemainTimeStr())
		end

		setText(arg_29_0.descTF, arg_29_0.showVO:GetDesc())

		arg_29_0.showTargets = arg_29_0.showVO:GetTargetList()

		local var_29_2 = not arg_29_0.showVO:IsSubmitImmediately() and arg_29_0.showVO:IsFinish()

		setActive(arg_29_0.finishedTargetTF, var_29_2)
		setActive(arg_29_0.targetContent, not var_29_2)

		if var_29_2 then
			setText(arg_29_0.finishedTargetTF, arg_29_0.showVO:GetFinishedDesc())
		else
			arg_29_0.targetUIList:align(#arg_29_0.showTargets)
		end

		arg_29_0.showAwards = arg_29_0.showVO:GetAwards()

		arg_29_0.awardUIList:align(#arg_29_0.showAwards)
		setActive(arg_29_0.traceBtn, arg_29_0.showVO.id ~= arg_29_0.trackTaskId)
		onButton(arg_29_0, arg_29_0.traceBtn, function()
			arg_29_0:emit(IslandMediator.ON_SET_TRACE_ID, arg_29_0.showVO.id)
		end, SFX_PANEL)
		setActive(arg_29_0.tracedBtn, arg_29_0.showVO.id == arg_29_0.trackTaskId)
		onButton(arg_29_0, arg_29_0.tracedBtn, function()
			arg_29_0:emit(IslandMediator.ON_SET_TRACE_ID, 0)
		end, SFX_PANEL)

		local var_29_3 = arg_29_0.showVO:IsFinish()

		setActive(arg_29_0.submitBtn, var_29_3)
		onButton(arg_29_0, arg_29_0.submitBtn, function()
			arg_29_0.selectedTaskId = nil

			arg_29_0:emit(IslandMediator.ON_SUBMIT_TASK, arg_29_0.showVO.id)
			arg_29_0:Hide()
		end, SFX_PANEL)
	end
end

function var_0_0.OnShow(arg_33_0, arg_33_1)
	if arg_33_1 and arg_33_1 ~= 0 then
		triggerToggle(arg_33_0.toggleUIList.container:GetChild(0), true)

		local var_33_0 = IslandTaskType.Type2ShowType[pg.island_task[arg_33_1].type]

		triggerToggle(arg_33_0.typeUIList.container:Find(var_33_0 .. "/list/" .. arg_33_1), true)
	else
		arg_33_0:Flush()
	end

	pg.UIMgr.GetInstance():BlurPanel(arg_33_0._tf)
end

function var_0_0.OnHide(arg_34_0)
	pg.UIMgr.GetInstance():UnblurPanel(arg_34_0._tf)
end

return var_0_0
