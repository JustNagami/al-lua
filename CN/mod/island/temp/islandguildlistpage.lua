local var_0_0 = class("IslandGuildListPage", import(".IslandFriendListPage"))

function var_0_0.UpdateData(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1.memberVOs

	var_0_0.super.UpdateData(arg_1_0, {
		friendVOs = var_1_0
	})
end

return var_0_0
