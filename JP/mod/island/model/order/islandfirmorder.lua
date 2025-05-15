local var_0_0 = class("IslandFirmOrder", import(".IslandOrder"))

function var_0_0.IsFirm(arg_1_0)
	return true
end

function var_0_0.IsEmpty(arg_2_0)
	return arg_2_0.showFlag == IslandOrderSlot.SHOW_FLAG_TOMORROW
end

return var_0_0
