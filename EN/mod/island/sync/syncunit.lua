local var_0_0 = class("SyncUnit")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.id = arg_1_1.id
	arg_1_0.syncType = arg_1_1.type
	arg_1_0.tid = arg_1_1.tid
end

function var_0_0.GetType(arg_2_0)
	return arg_2_0.syncType
end

function var_0_0.UpdateOwner(arg_3_0, arg_3_1)
	return
end

function var_0_0.Dispose(arg_4_0)
	return
end

return var_0_0
