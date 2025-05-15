local var_0_0 = class("IslandFormula", import("model.vo.BaseVO"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.id = arg_1_1
	arg_1_0.configId = arg_1_0.id
end

function var_0_0.bindConfigTable(arg_2_0)
	return pg.island_formula
end

function var_0_0.GetGroup(arg_3_0)
	return arg_3_0:getConfig("place_group")
end

function var_0_0.GetName(arg_4_0)
	return arg_4_0:getConfig("name")
end

function var_0_0.GetItemId(arg_5_0)
	return arg_5_0:getConfig("item_id")
end

function var_0_0.GetDesc(arg_6_0)
	return arg_6_0:getConfig("desc")
end

function var_0_0.GetPoint(arg_7_0)
	return arg_7_0:getConfig("production_points")
end

function var_0_0.GetMakeCost(arg_8_0)
	return arg_8_0:getConfig("cost")
end

function var_0_0.GetMakeDrop(arg_9_0)
	return arg_9_0:getConfig("drop_product")
end

function var_0_0.GetCommissionCost(arg_10_0)
	local var_10_0 = arg_10_0:getConfig("commission_cost")

	return var_10_0 == "" and {} or var_10_0
end

function var_0_0.GetCommissionDrop(arg_11_0)
	return arg_11_0:getConfig("commission_product")
end

function var_0_0.GetSecondDrop(arg_12_0)
	return arg_12_0:getConfig("second_product")
end

function var_0_0.GetUnlock(arg_13_0)
	return arg_13_0:getConfig("unlock_place_level")
end

function var_0_0.IsEnough(arg_14_0)
	local var_14_0 = arg_14_0:GetMakeCost()

	if var_14_0 == "" then
		return true
	end

	for iter_14_0, iter_14_1 in ipairs(var_14_0) do
		local var_14_1 = Drop.New({
			type = iter_14_1[1],
			id = iter_14_1[2],
			count = iter_14_1[3]
		})

		if var_14_1:getOwnedCount() < var_14_1.count then
			return false
		end
	end

	return true
end

return var_0_0
