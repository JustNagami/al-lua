local var_0_0 = class("IslandShipOrder")

var_0_0.OP_TYPE_UNLOCK = 1
var_0_0.OP_TYPE_GET_AWARD = 2
var_0_0.OP_TYPE_LOADUP = 3

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.consumeList = {}

	for iter_1_0, iter_1_1 in ipairs(arg_1_1.cost or {}) do
		table.insert(arg_1_0.consumeList, {
			type = DROP_TYPE_ISLAND_ITEM,
			id = iter_1_1.id,
			count = iter_1_1.num,
			state = iter_1_1.state
		})
	end

	arg_1_0.awardList = {}

	for iter_1_2, iter_1_3 in ipairs(arg_1_1.reward or {}) do
		table.insert(arg_1_0.awardList, {
			type = DROP_TYPE_ISLAND_ITEM,
			id = iter_1_3.id,
			count = iter_1_3.num
		})
	end
end

function var_0_0.IsLoadUpAll(arg_2_0)
	return _.all(arg_2_0.consumeList, function(arg_3_0)
		return arg_3_0.state == 1
	end)
end

function var_0_0.MarkLoadUp(arg_4_0, arg_4_1)
	arg_4_0:GetComsume(arg_4_1).state = 1
end

function var_0_0.GetConsumeList(arg_5_0)
	return arg_5_0.consumeList
end

function var_0_0.GetComsume(arg_6_0, arg_6_1)
	return arg_6_0.consumeList[arg_6_1] or {}
end

function var_0_0.ItemIsSubmited(arg_7_0, arg_7_1)
	local var_7_0 = arg_7_0.consumeList[arg_7_1]

	return var_7_0 and var_7_0.state == 1
end

function var_0_0.GetConsumeAwards(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_0:GetComsume(arg_8_1)
	local var_8_1 = pg.island_item_data_template[var_8_0.id]
	local var_8_2 = pg.island_set.order_ship_award_coefficient.key_value_varchar
	local var_8_3 = var_8_1.order_price * var_8_0.count

	return {
		{
			type = DROP_TYPE_ISLAND_ITEM,
			id = var_8_2[1],
			count = math.floor(var_8_3 * (var_8_2[2] / 100))
		},
		{
			id = 2,
			type = DROP_TYPE_ISLAND_ITEM,
			count = math.floor(var_8_3 * (var_8_2[3] / 100))
		}
	}
end

function var_0_0.GetAwardList(arg_9_0)
	return arg_9_0.awardList
end

return var_0_0
