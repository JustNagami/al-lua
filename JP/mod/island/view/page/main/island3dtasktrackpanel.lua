local var_0_0 = class("Island3dTaskTrackPanel", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "Island3dTaskTrackPanel"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.emptyTF = arg_2_0._tf:Find("empty")
	arg_2_0.contentTF = arg_2_0._tf:Find("content")
	arg_2_0.iconTF = arg_2_0.contentTF:Find("title/icon")
	arg_2_0.nameTF = arg_2_0.contentTF:Find("title/name")
	arg_2_0.finishedTF = arg_2_0.contentTF:Find("target/finished")
	arg_2_0.unFinishTF = arg_2_0.contentTF:Find("target/unfinish")
	arg_2_0.targetUIList = UIItemList.New(arg_2_0.unFinishTF, arg_2_0.unFinishTF:Find("tpl"))
end

function var_0_0.OnInit(arg_3_0)
	arg_3_0.targetUIList:make(function(arg_4_0, arg_4_1, arg_4_2)
		if arg_4_0 == UIItemList.EventUpdate then
			arg_3_0:UpdateTargetItem(arg_4_1, arg_4_2)
		end
	end)
	onButton(arg_3_0, arg_3_0.emptyTF, function()
		existCall(arg_3_0.contextData.onClick)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.contentTF, function()
		existCall(arg_3_0.contextData.onClick)
	end, SFX_PANEL)
end

function var_0_0.UpdateTargetItem(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = arg_7_0.trackTask:GetTargetList()[arg_7_1 + 1]

	setText(arg_7_2:Find("content/Text"), var_7_0:getConfig("name"))

	local var_7_1 = var_7_0:GetProgress()
	local var_7_2 = var_7_0:GetTargetNum()

	setText(arg_7_2:Find("content/num"), string.format("(%d/%d)", var_7_1, var_7_2))

	local var_7_3 = var_7_0:IsFinish()

	setActive(arg_7_2:Find("status/unfinish"), not var_7_3)
	setActive(arg_7_2:Find("status/finished"), var_7_3)

	GetOrAddComponent(arg_7_2:Find("content"), "CanvasGroup").alpha = var_7_3 and 0.5 or 1
end

function var_0_0.UpdateTrackTask(arg_8_0, arg_8_1)
	setActive(arg_8_0.emptyTF, arg_8_1 == 0)
	setActive(arg_8_0.contentTF, arg_8_1 ~= 0)

	if arg_8_1 ~= 0 then
		arg_8_0.trackTask = getProxy(IslandProxy):GetIsland():GetTaskAgency():GetTraceTask()

		local var_8_0 = arg_8_0.trackTask:GetShowType()

		LoadImageSpriteAsync("islandtasktype/" .. IslandTaskType.ShowTypeFields[var_8_0], arg_8_0.iconTF)
		setText(arg_8_0.nameTF, arg_8_0.trackTask:GetName())
		arg_8_0:UpdateTarget()

		local var_8_1 = arg_8_0.trackTask:GetTraceParam()
		local var_8_2 = tonumber(var_8_1)

		if var_8_2 then
			_IslandCore:GetController():NotifiyCore(ISLAND_EVT.TRACKING, {
				id = var_8_2
			})
		end
	else
		_IslandCore:GetController():NotifiyCore(ISLAND_EVT.UNTRACKING)
	end
end

function var_0_0.UpdateTarget(arg_9_0)
	local var_9_0 = not arg_9_0.trackTask:IsSubmitImmediately() and arg_9_0.trackTask:IsFinish()

	setActive(arg_9_0.finishedTF, var_9_0)
	setActive(arg_9_0.unFinishTF, not var_9_0)

	if var_9_0 then
		setText(arg_9_0.finishedTF, arg_9_0.trackTask:GetFinishedDesc())
	else
		arg_9_0.targetUIList:align(#arg_9_0.trackTask:GetTargetList())
	end
end

function var_0_0.UpdateTask(arg_10_0, arg_10_1)
	if arg_10_0.trackTask and arg_10_0.trackTask.id == arg_10_1.id then
		arg_10_0.trackTask = getProxy(IslandProxy):GetIsland():GetTaskAgency():GetTask(arg_10_1.id)

		setActive(arg_10_0.emptyTF, not arg_10_0.trackTask)
		setActive(arg_10_0.contentTF, arg_10_0.trackTask)

		if arg_10_0.trackTask then
			arg_10_0:UpdateTarget()
		end
	end
end

function var_0_0.Show(arg_11_0)
	var_0_0.super.Show(arg_11_0)

	local var_11_0 = getProxy(IslandProxy):GetIsland():GetTaskAgency():GetTraceTask()

	arg_11_0:UpdateTrackTask(var_11_0 and var_11_0.id or 0)
end

function var_0_0.OnDestroy(arg_12_0)
	return
end

return var_0_0
