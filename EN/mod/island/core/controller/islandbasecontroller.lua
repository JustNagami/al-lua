local var_0_0 = class("IslandBaseController")

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.core = arg_1_1
	arg_1_0.island = arg_1_2
	arg_1_0.__callbacks = {}

	arg_1_0:Init()
end

function var_0_0.IsSelfIsland(arg_2_0)
	return getProxy(IslandProxy):GetIsland().id == arg_2_0.island.id
end

function var_0_0.GetCore(arg_3_0)
	return arg_3_0.core
end

function var_0_0.OnCoreStateChanged(arg_4_0, arg_4_1)
	if arg_4_1 == IslandCore.STATE_INIT_FINISH then
		arg_4_0:AddListeners()
		arg_4_0:OnCoreInitFinish()
	end
end

function var_0_0.Dispose(arg_5_0)
	arg_5_0:RemoveListeners()
	arg_5_0:OnDispose()
end

function var_0_0.AddIslandListener(arg_6_0, arg_6_1, arg_6_2)
	local function var_6_0(arg_7_0, ...)
		arg_6_2(arg_6_0, ...)
	end

	arg_6_0.__callbacks[arg_6_2] = var_6_0

	arg_6_0.island:AddListener(arg_6_1, var_6_0)
end

function var_0_0.RemoveIslandListener(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = arg_8_0.__callbacks[arg_8_2]

	if var_8_0 then
		arg_8_0.island:RemoveListener(arg_8_1, var_8_0)

		arg_8_0.__callbacks[var_8_0] = nil
	end
end

function var_0_0.NotifiyCore(arg_9_0, arg_9_1, ...)
	arg_9_0.core:DispatchEvent(arg_9_1, ...)
end

function var_0_0.NotifiyIsland(arg_10_0, arg_10_1, ...)
	arg_10_0.island:DispatchEvent(arg_10_1, ...)
end

function var_0_0.Receive(arg_11_0, arg_11_1, ...)
	if arg_11_0[arg_11_1] then
		arg_11_0[arg_11_1](arg_11_0, ...)
	end
end

function var_0_0.AddListeners(arg_12_0)
	return
end

function var_0_0.RemoveListeners(arg_13_0)
	return
end

function var_0_0.Init(arg_14_0)
	return
end

function var_0_0.SetUp(arg_15_0)
	return
end

function var_0_0.OnCoreInitFinish(arg_16_0)
	return
end

function var_0_0.Update(arg_17_0)
	return
end

function var_0_0.LateUpdate(arg_18_0)
	return
end

function var_0_0.OnDispose(arg_19_0)
	return
end

return var_0_0
