local var_0_0 = class("IslandTask", import("model.vo.BaseVO"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.id = arg_1_1.id
	arg_1_0.configId = arg_1_0.id

	arg_1_0:InitEndTime()
	arg_1_0:UpdateTargetData(arg_1_1.process_list)
end

function var_0_0.bindConfigTable(arg_2_0)
	return pg.island_task
end

function var_0_0.InitEndTime(arg_3_0)
	local var_3_0 = arg_3_0:getConfig("unlock_condition")

	if var_3_0 == "" or #var_3_0 == 0 then
		arg_3_0.endTime = 0
	end

	local var_3_1 = underscore.detect(var_3_0, function(arg_4_0)
		return arg_4_0[1] == IslandFutureTask.CONDITION_TYPE.IN_TIME
	end)

	if not var_3_1 then
		arg_3_0.endTime = 0
	else
		arg_3_0.endTime = pg.TimeMgr.GetInstance():parseTimeFromConfig(var_3_1[2][2])
	end
end

function var_0_0.SetEndTime(arg_5_0, arg_5_1)
	arg_5_0.endTime = arg_5_1
end

function var_0_0.UpdateTargetData(arg_6_0, arg_6_1)
	local var_6_0 = {}

	for iter_6_0, iter_6_1 in ipairs(arg_6_1) do
		var_6_0[iter_6_1.target_id] = iter_6_1
	end

	arg_6_0.targetList = {}

	for iter_6_2, iter_6_3 in ipairs(arg_6_0:getConfig("target_id")) do
		table.insert(arg_6_0.targetList, IslandTaskTarget.New(var_6_0[iter_6_3] or {
			target_id = iter_6_3
		}))
	end
end

function var_0_0.GetTargetList(arg_7_0)
	return arg_7_0.targetList
end

function var_0_0.GetRecycleItemInfos(arg_8_0)
	local var_8_0 = {}

	underscore.each(arg_8_0.targetList, function(arg_9_0)
		if arg_9_0:GetType() == IslandTaskTarget.RECYCLE then
			table.insert(var_8_0, Drop.New({
				type = DROP_TYPE_ISLAND_ITEM,
				id = arg_9_0:GetTargetId(),
				count = arg_9_0:GetTargetNum()
			}))
		end
	end)

	return var_8_0
end

function var_0_0.ExistInteractionTarget(arg_10_0, arg_10_1)
	for iter_10_0, iter_10_1 in ipairs(arg_10_0.targetList) do
		if not iter_10_1:IsFinish() and iter_10_1:IsInteractionObject(arg_10_1) then
			return true, iter_10_1
		end
	end

	return false
end

function var_0_0.ExistApproachTarget(arg_11_0, arg_11_1)
	for iter_11_0, iter_11_1 in ipairs(arg_11_0.targetList) do
		if not iter_11_1:IsFinish() and iter_11_1:IsApproachObject(arg_11_1) then
			return true, iter_11_1
		end
	end

	return false
end

function var_0_0.GetRemainTimeStr(arg_12_0)
	local var_12_0 = arg_12_0.endTime - pg.TimeMgr.GetInstance():GetServerTime()
	local var_12_1 = math.floor(var_12_0 / 86400)
	local var_12_2 = math.floor(var_12_0 % 86400 / 3600)

	return i18n1(var_12_1 .. "天" .. var_12_2 .. "小时")
end

function var_0_0.IsFinish(arg_13_0)
	return underscore.all(arg_13_0.targetList, function(arg_14_0)
		return arg_14_0:IsFinish()
	end)
end

function var_0_0.IsSubmitImmediately(arg_15_0)
	return arg_15_0:getConfig("complete_type") == 2 and arg_15_0:getConfig("complete_data") == 0
end

function var_0_0.GetFinishedDesc(arg_16_0)
	return arg_16_0:getConfig("complete_tips")
end

function var_0_0.InTime(arg_17_0)
	if arg_17_0.endTime == 0 then
		return true
	end

	return pg.TimeMgr.GetInstance():GetServerTime() < arg_17_0.endTime
end

function var_0_0.GetType(arg_18_0)
	return arg_18_0:getConfig("type")
end

function var_0_0.GetShowType(arg_19_0)
	return IslandTaskType.Type2ShowType[arg_19_0:getConfig("type")]
end

function var_0_0.GetName(arg_20_0)
	return arg_20_0:getConfig("name")
end

function var_0_0.GetDesc(arg_21_0)
	return arg_21_0:getConfig("task_desc")
end

function var_0_0.IsSeries(arg_22_0)
	return arg_22_0:getConfig("series") ~= ""
end

function var_0_0.GetSeriesTitle(arg_23_0)
	return arg_23_0:getConfig("series") .. " " .. arg_23_0:getConfig("series_name")
end

function var_0_0.GetAddedStory(arg_24_0)
	return arg_24_0:getConfig("rec_perform")
end

function var_0_0.GetSubmitStory(arg_25_0)
	return arg_25_0:getConfig("com_perform")
end

function var_0_0.GetTraceId(arg_26_0)
	return arg_26_0:getConfig("navigation")
end

function var_0_0.GetTraceParam(arg_27_0)
	for iter_27_0, iter_27_1 in ipairs(arg_27_0.targetList) do
		if not iter_27_1:IsFinish() then
			return iter_27_1:GetTrackParma(), iter_27_0
		end
	end

	return ""
end

function var_0_0.GetAwards(arg_28_0)
	return underscore.map(arg_28_0:getConfig("reward"), function(arg_29_0)
		return Drop.Create(arg_29_0)
	end)
end

return var_0_0
