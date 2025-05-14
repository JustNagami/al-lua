local var_0_0 = class("IslandOrder", import("model.vo.BaseVO"))

var_0_0.TYPE_NORMAL = 1
var_0_0.TYPE_URGENCY = 2
var_0_0.TYPE_FORM = 3

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0:Flush(arg_1_1)
end

function var_0_0.Flush(arg_2_0, arg_2_1)
	arg_2_0.id = arg_2_1.dialog_id
	arg_2_0.configId = arg_2_0.id
	arg_2_0.tendency = arg_2_1.daily_select
	arg_2_0.startTime = arg_2_1.start_time
	arg_2_0.submitTime = arg_2_1.submit_time
	arg_2_0.showFlag = arg_2_1.view_flag
	arg_2_0.consumeList = {}

	for iter_2_0, iter_2_1 in ipairs(arg_2_1.cost or {}) do
		table.insert(arg_2_0.consumeList, {
			type = DROP_TYPE_ISLAND_ITEM,
			id = iter_2_1.id,
			count = iter_2_1.num
		})
	end

	arg_2_0.awardList = {}

	local var_2_0 = arg_2_1.reward or {}

	for iter_2_2, iter_2_3 in ipairs(var_2_0.item_list) do
		table.insert(arg_2_0.awardList, {
			type = DROP_TYPE_ISLAND_ITEM,
			id = iter_2_3.id,
			count = iter_2_3.num
		})
	end

	arg_2_0.dropExp = var_2_0.exp or 0
end

function var_0_0.bindConfigTable(arg_3_0)
	return pg.island_order_publish_random
end

function var_0_0.GetExpValue(arg_4_0)
	return pg.island_set.order_favor.key_value_int
end

function var_0_0.GetTendency(arg_5_0)
	return arg_5_0.tendency
end

function var_0_0.CanFinish(arg_6_0)
	local var_6_0 = arg_6_0:GetConsume()

	return _.all(var_6_0, function(arg_7_0)
		return Drop.New({
			type = arg_7_0.type,
			id = arg_7_0.id
		}):getOwnedCount() >= arg_7_0.count
	end)
end

function var_0_0.GetDesc(arg_8_0)
	return arg_8_0:getConfig("desc")
end

function var_0_0.GetConsume(arg_9_0)
	return arg_9_0.consumeList
end

function var_0_0.GetDisplayAwards(arg_10_0)
	if arg_10_0.dropExp > 0 then
		local var_10_0 = {}

		for iter_10_0, iter_10_1 in ipairs(arg_10_0.awardList) do
			table.insert(var_10_0, iter_10_1)
		end

		table.insert(var_10_0, {
			id = 2,
			type = DROP_TYPE_ISLAND_ITEM,
			count = arg_10_0.dropExp
		})

		return var_10_0
	else
		return arg_10_0.awardList
	end
end

function var_0_0.GetAwardItemAndExp(arg_11_0)
	return arg_11_0.awardList, arg_11_0.dropExp
end

function var_0_0.GetRoleIcon(arg_12_0)
	local var_12_0 = arg_12_0:getConfig("npc_id")

	return IslandShip.StaticGetPrefab(var_12_0)
end

function var_0_0.GetRoleName(arg_13_0)
	local var_13_0 = arg_13_0:getConfig("npc_id")
	local var_13_1 = IslandShip.StaticGetShipGroup(var_13_0)

	return ShipGroup.getDefaultShipConfig(var_13_1).name
end

function var_0_0.IsUrgency(arg_14_0)
	return false
end

function var_0_0.IsFirm(arg_15_0)
	return false
end

function var_0_0.GetTitle(arg_16_0)
	return i18n1("普通订单")
end

function var_0_0.IsEmpty(arg_17_0)
	return arg_17_0.showFlag == IslandOrderSlot.SHOW_FLAG_TOMORROW and arg_17_0:IsLoading()
end

function var_0_0.IsLoading(arg_18_0)
	return pg.TimeMgr.GetInstance():GetServerTime() < arg_18_0.submitTime
end

function var_0_0.CanReplace(arg_19_0)
	return not arg_19_0:IsEmpty() and not arg_19_0:IsLoading()
end

function var_0_0.GetTotalTime(arg_20_0)
	return arg_20_0.submitTime - arg_20_0.startTime
end

function var_0_0.GetDisappearTime(arg_21_0)
	return -1
end

function var_0_0.GetCanSubmitTime(arg_22_0)
	return arg_22_0.submitTime
end

return var_0_0
