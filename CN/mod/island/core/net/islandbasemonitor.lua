local var_0_0 = class("IslandBaseMonitor")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.island = arg_1_1

	arg_1_0:onRegister()
end

function var_0_0.GetIsland(arg_2_0)
	return arg_2_0.island
end

function var_0_0.IsSelf(arg_3_0, arg_3_1)
	return arg_3_0.island.id == arg_3_1
end

function var_0_0.onRegister(arg_4_0)
	arg_4_0.event = {}

	arg_4_0:register()
end

function var_0_0.on(arg_5_0, arg_5_1, arg_5_2)
	pg.ConnectionMgr.GetInstance():On(arg_5_1, function(arg_6_0)
		arg_5_2(arg_6_0)
	end)
	table.insert(arg_5_0.event, arg_5_1)
end

function var_0_0.onRemove(arg_7_0)
	arg_7_0:remove()

	for iter_7_0, iter_7_1 in ipairs(arg_7_0.event) do
		pg.ConnectionMgr.GetInstance():Off(iter_7_1)
	end
end

function var_0_0.Dispose(arg_8_0)
	arg_8_0:onRemove()
end

function var_0_0.register(arg_9_0)
	return
end

function var_0_0.remove(arg_10_0)
	return
end

return var_0_0
