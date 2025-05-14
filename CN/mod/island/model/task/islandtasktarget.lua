local var_0_0 = class("IslandTaskTarget", import("model.vo.BaseVO"))

var_0_0.INTERACTION = 1
var_0_0.APPROACH = 2
var_0_0.ORDER = 3
var_0_0.RECYCLE = 4
var_0_0.OBTAIN = 5
var_0_0.GATHER = 6
var_0_0.PRODUCTION = 7
var_0_0.TECHNOLOGY = 8
var_0_0.LEVEL = 9

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.id = arg_1_1.target_id
	arg_1_0.configId = arg_1_0.id
	arg_1_0.progress = arg_1_1.target_count or 0
end

function var_0_0.bindConfigTable(arg_2_0)
	return pg.island_task_target
end

function var_0_0.GetType(arg_3_0)
	return arg_3_0:getConfig("type")
end

function var_0_0.GetTargetId(arg_4_0)
	return arg_4_0:getConfig("target_id")
end

function var_0_0.GetTargetNum(arg_5_0)
	return arg_5_0:getConfig("target_num")
end

function var_0_0.GetTrackParma(arg_6_0)
	return arg_6_0:getConfig("tips")
end

function var_0_0.GetProgress(arg_7_0)
	local var_7_0 = arg_7_0.progress
	local var_7_1 = arg_7_0:GetType()

	if var_7_1 == var_0_0.RECYCLE then
		var_7_0 = getProxy(IslandProxy):GetIsland():GetInventoryAgency():GetOwnCount(arg_7_0:GetTargetId())
	elseif var_7_1 == var_0_0.LEVEL then
		var_7_0 = getProxy(IslandProxy):GetIsland():GetLevel()
	end

	return var_7_0
end

function var_0_0.UpdateProgress(arg_8_0, arg_8_1)
	arg_8_0.progress = arg_8_1
end

function var_0_0.IsFinish(arg_9_0)
	return arg_9_0:GetProgress() / arg_9_0:GetTargetNum() >= 1
end

function var_0_0.IsInteractionObject(arg_10_0, arg_10_1)
	return arg_10_0:GetType() == var_0_0.INTERACTION and arg_10_0:GetTargetId() == arg_10_1
end

function var_0_0.IsApproachObject(arg_11_0, arg_11_1)
	return arg_11_0:GetType() == var_0_0.APPROACH and arg_11_0:GetTargetId() == arg_11_1
end

return var_0_0
