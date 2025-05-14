local var_0_0 = class("SyncUnitBuilder")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.view = arg_1_1:GetCore().view
	arg_1_0.playerId = getProxy(PlayerProxy):getPlayerId()
end

function var_0_0.Build(arg_2_0, arg_2_1)
	return (switch(arg_2_1.type, {
		[IslandConst.SYNC_TYPE_PLAYER] = function()
			local var_3_0 = arg_2_0.view:GetUnitModule(arg_2_1.tid)

			warning(arg_2_1.id, arg_2_1.tid, var_3_0)

			return SyncUnitPlayer.New(arg_2_1, var_3_0)
		end,
		[IslandConst.SYNC_TYPE_UNIT_MOVE] = function()
			local var_4_0 = arg_2_0.view:GetUnitModule(arg_2_1.tid)

			warning(arg_2_1.id, arg_2_1.tid, var_4_0)

			return SyncUnitInteraction.New(arg_2_1, var_4_0)
		end,
		[IslandConst.SYNC_TYPE_UNIT_STATIC] = function()
			warning(arg_2_1.id, arg_2_1.tid)

			return SyncUnitStatic.New(arg_2_1)
		end,
		[IslandConst.SYNC_TYPE_AGORA] = function()
			warning(arg_2_1.id, arg_2_1.tid)

			return SyncUnitStatic.New(arg_2_1)
		end
	}))
end

return var_0_0
