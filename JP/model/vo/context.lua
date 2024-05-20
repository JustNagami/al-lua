local var_0_0 = class("Context")

var_0_0.TRANS_TYPE = {
	CROSS = 1,
	ONE_BY_ONE = 2
}

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_1 = arg_1_1 or {}
	arg_1_0.mediator = arg_1_1.mediator
	arg_1_0.viewComponent = arg_1_1.viewComponent
	arg_1_0.scene = arg_1_1.scene
	arg_1_0.onRemoved = arg_1_1.onRemoved
	arg_1_0.cleanStack = defaultValue(arg_1_1.cleanStack, false)
	arg_1_0.data = arg_1_1.data or {}
	arg_1_0.parent = arg_1_1.parent
	arg_1_0.children = {}
	arg_1_0.transType = defaultValue(arg_1_1.transType, var_0_0.TRANS_TYPE.CROSS)
end

function var_0_0.extendData(arg_2_0, arg_2_1)
	if arg_2_1 == nil then
		return
	end

	assert(type(arg_2_1) == "table", "data object should be a table")

	for iter_2_0, iter_2_1 in pairs(arg_2_1) do
		arg_2_0.data[iter_2_0] = iter_2_1
	end
end

function var_0_0.addChild(arg_3_0, arg_3_1)
	assert(isa(arg_3_1, Context), "should be an instance of Context")
	assert(arg_3_1.parent == nil, "context already has parent")

	arg_3_1.parent = arg_3_0

	table.insert(arg_3_0.children, arg_3_1)
end

function var_0_0.addChilds(arg_4_0, arg_4_1)
	_.each(arg_4_1, function(arg_5_0)
		arg_4_0:addChild(arg_5_0)
	end)
end

function var_0_0.removeChild(arg_6_0, arg_6_1)
	assert(isa(arg_6_1, Context), "should be an instance of Context")

	for iter_6_0, iter_6_1 in ipairs(arg_6_0.children) do
		if iter_6_1 == arg_6_1 then
			return table.remove(arg_6_0.children, iter_6_0)
		end
	end

	return nil
end

function var_0_0.retriveLastChild(arg_7_0)
	for iter_7_0 = #arg_7_0.children, 1, -1 do
		if not arg_7_0.children[iter_7_0].data.isSubView then
			return arg_7_0.children[iter_7_0]:retriveLastChild()
		end
	end

	return arg_7_0
end

function var_0_0.GetHierarchy(arg_8_0)
	local var_8_0 = {
		arg_8_0
	}
	local var_8_1 = {}

	while #var_8_0 > 0 do
		local var_8_2 = table.remove(var_8_0, 1)

		for iter_8_0, iter_8_1 in ipairs(var_8_2.children) do
			table.insert(var_8_0, iter_8_1)
		end

		table.insert(var_8_1, var_8_2)
	end

	return var_8_1
end

function var_0_0.getContextByMediator(arg_9_0, arg_9_1)
	local function var_9_0(arg_10_0, arg_10_1)
		if arg_10_0.mediator == arg_10_1 then
			return arg_10_0
		end

		for iter_10_0, iter_10_1 in ipairs(arg_10_0.children) do
			local var_10_0 = var_9_0(iter_10_1, arg_10_1)

			if var_10_0 ~= nil then
				return var_10_0
			end
		end

		return nil
	end

	return var_9_0(arg_9_0, arg_9_1)
end

function var_0_0.onContextRemoved(arg_11_0)
	return arg_11_0.onRemoved and arg_11_0.onRemoved()
end

return var_0_0
