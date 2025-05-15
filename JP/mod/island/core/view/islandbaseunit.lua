local var_0_0 = class("IslandBaseUnit")
local var_0_1 = 1
local var_0_2 = 2
local var_0_3 = 3

function var_0_0.Ctor(arg_1_0, arg_1_1)
	pg.DelegateInfo.New(arg_1_0)

	arg_1_0.__state = var_0_1
	arg_1_0.view = arg_1_1
end

function var_0_0.IsSelfIsland(arg_2_0)
	return arg_2_0.view:IsSelfIsland()
end

function var_0_0.Emit(arg_3_0, arg_3_1, ...)
	arg_3_0.view:Emit(arg_3_1, ...)
end

function var_0_0.Op(arg_4_0, ...)
	arg_4_0:GetView():Op(...)
end

function var_0_0.Init(arg_5_0, ...)
	if arg_5_0:IsEmpty() then
		arg_5_0:OnInit(...)

		arg_5_0.__state = var_0_2
	end
end

function var_0_0.IsEmpty(arg_6_0)
	return arg_6_0.__state == var_0_1
end

function var_0_0.IsLoaded(arg_7_0)
	return arg_7_0.__state == var_0_2
end

function var_0_0.GetView(arg_8_0)
	return arg_8_0.view
end

function var_0_0.Dispose(arg_9_0)
	if arg_9_0:IsLoaded() then
		arg_9_0.__state = var_0_3

		arg_9_0:OnDispose()

		arg_9_0.view = nil
	end

	arg_9_0:OnDestroy()
end

function var_0_0.Update(arg_10_0)
	if not arg_10_0:IsLoaded() then
		return
	end

	arg_10_0:OnUpdate()
end

function var_0_0.LateUpdate(arg_11_0)
	if not arg_11_0:IsLoaded() then
		return
	end

	arg_11_0:OnLateUpdate()
end

function var_0_0.OnInit(arg_12_0, ...)
	return
end

function var_0_0.Start(arg_13_0)
	return
end

function var_0_0.OnUpdate(arg_14_0)
	return
end

function var_0_0.OnLateUpdate(arg_15_0)
	return
end

function var_0_0.OnDispose(arg_16_0)
	return
end

function var_0_0.OnDestroy(arg_17_0)
	return
end

return var_0_0
