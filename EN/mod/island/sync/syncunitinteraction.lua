local var_0_0 = class("SyncUnitInteraction", import(".SyncUnitMovable"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0:UpdateOwner(arg_1_1.slots)
end

function var_0_0.UpdateOwner(arg_2_0, arg_2_1)
	local var_2_0 = getProxy(PlayerProxy):getPlayerId()

	arg_2_0.owner = arg_2_1 and #arg_2_1 > 0 and arg_2_1[1].owner_id or 0

	if arg_2_0.owner == 0 then
		arg_2_0.ownerType = SyncUnitMovable.OWNER_TYPE_NONE
	elseif arg_2_0.owner == var_2_0 then
		arg_2_0.ownerType = SyncUnitMovable.OWNER_TYPE_CLIENT
	else
		arg_2_0.ownerType = SyncUnitMovable.OWNER_TYPE_SERVER
	end
end

function var_0_0.SetOwnerType(arg_3_0, arg_3_1)
	arg_3_0.ownerType = arg_3_1
end

function var_0_0.GetStatus(arg_4_0)
	return 0
end

return var_0_0
