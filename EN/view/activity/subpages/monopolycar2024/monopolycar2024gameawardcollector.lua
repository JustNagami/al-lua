local var_0_0 = class("MonopolyCar2024GameAwardCollector")

function var_0_0.Ctor(arg_1_0)
	arg_1_0.list = {}
	arg_1_0.isSetUp = false
end

function var_0_0.Add(arg_2_0, arg_2_1)
	if not arg_2_0.isSetUp then
		return
	end

	for iter_2_0, iter_2_1 in ipairs(arg_2_1 or {}) do
		table.insert(arg_2_0.list, iter_2_1)
	end
end

function var_0_0.SetUp(arg_3_0)
	arg_3_0.isSetUp = true

	arg_3_0:Clear()
end

function var_0_0.Disable(arg_4_0)
	arg_4_0.isSetUp = false

	arg_4_0:Clear()
end

function var_0_0.Fetch(arg_5_0)
	local var_5_0 = {}

	for iter_5_0, iter_5_1 in ipairs(arg_5_0.list or {}) do
		table.insert(var_5_0, iter_5_1)
	end

	arg_5_0:Clear()

	return var_5_0
end

function var_0_0.Clear(arg_6_0)
	arg_6_0.list = {}
end

function var_0_0.Dispose(arg_7_0)
	arg_7_0:Clear()
end

return var_0_0
