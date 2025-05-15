local var_0_0 = class("SyncUnitPlayer", import(".SyncUnitMovable"))

var_0_0.ANIM_HASH = {
	IslandConst.ANIM_JUMP_HASH,
	IslandConst.ANIM_MOVE_HASH
}

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_0.super.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0:UpdateOwner(arg_1_1.tid)

	arg_1_0.inTimeline = false
end

function var_0_0.UpdateOwner(arg_2_0, arg_2_1)
	local var_2_0 = getProxy(PlayerProxy):getPlayerId()

	arg_2_0.owner = arg_2_1

	if arg_2_0.owner == var_2_0 then
		arg_2_0.ownerType = SyncUnitMovable.OWNER_TYPE_CLIENT
	else
		arg_2_0.ownerType = SyncUnitMovable.OWNER_TYPE_SERVER
	end
end

function var_0_0.GetStatus(arg_3_0)
	local var_3_0 = arg_3_0.sceneObject.animator:GetCurrentAnimatorStateInfo(0)

	return table.indexof(var_0_0.ANIM_HASH, var_3_0.shortNameHash) or 0
end

function var_0_0.AnimHandle(arg_4_0)
	local var_4_0 = var_0_0.ANIM_HASH[arg_4_0.syncData.status]
	local var_4_1 = arg_4_0.sceneObject.animator:GetCurrentAnimatorStateInfo(0)

	if arg_4_0.speed < 7.5 and arg_4_0.speed > 5 then
		arg_4_0.speed = 5
	end

	arg_4_0.sceneObject.animator:SetFloat(IslandConst.SPEED_FLAG_HASH, arg_4_0.speed)

	if var_4_1.shortNameHash ~= var_4_0 then
		arg_4_0.sceneObject.animator:Play(var_4_0)
	end
end

function var_0_0.SetInTimeline(arg_5_0, arg_5_1)
	arg_5_0.inTimeline = arg_5_1
end

function var_0_0.InTimeline(arg_6_0)
	return arg_6_0.inTimeline
end

return var_0_0
