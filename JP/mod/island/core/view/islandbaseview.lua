local var_0_0 = class("IslandBaseView")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.core = arg_1_1
	arg_1_0.callbacks = {}
end

function var_0_0.SetUp(arg_2_0)
	arg_2_0:Init()
	arg_2_0:AddListeners()
end

function var_0_0.OnCoreStateChanged(arg_3_0)
	return
end

function var_0_0.Emit(arg_4_0, arg_4_1, ...)
	arg_4_0:Op("NotifiyCore", arg_4_1, unpack({
		...
	}))
end

function var_0_0.Op(arg_5_0, arg_5_1, ...)
	arg_5_0:GetCore():GetController():Receive(arg_5_1, ...)
end

function var_0_0.IsSelfIsland(arg_6_0)
	return arg_6_0:GetCore():GetController():IsSelfIsland()
end

function var_0_0.GetController(arg_7_0)
	return arg_7_0.core:GetController()
end

function var_0_0.GetCore(arg_8_0)
	return arg_8_0.core
end

function var_0_0.InMap(arg_9_0, arg_9_1)
	return arg_9_0:GetCore():GetMapId() == arg_9_1
end

function var_0_0.AddListener(arg_10_0, arg_10_1, arg_10_2)
	local function var_10_0(arg_11_0, ...)
		arg_10_2(arg_10_0, ...)
	end

	arg_10_0.callbacks[arg_10_2] = var_10_0

	arg_10_0.core:AddListener(arg_10_1, var_10_0)
end

function var_0_0.RemoveListener(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = arg_12_0.callbacks[arg_12_2]

	if var_12_0 then
		arg_12_0.core:RemoveListener(arg_12_1, var_12_0)

		arg_12_0.callbacks[var_12_0] = nil
	end
end

function var_0_0.Dispose(arg_13_0)
	arg_13_0:RemoveListeners()
	arg_13_0:OnDispose()

	arg_13_0.callbacks = nil
end

function var_0_0.Init(arg_14_0)
	return
end

function var_0_0.Update(arg_15_0)
	return
end

function var_0_0.LateUpdate(arg_16_0)
	return
end

function var_0_0.AddListeners(arg_17_0)
	return
end

function var_0_0.RemoveListeners(arg_18_0)
	return
end

function var_0_0.OnDispose(arg_19_0)
	return
end

return var_0_0
