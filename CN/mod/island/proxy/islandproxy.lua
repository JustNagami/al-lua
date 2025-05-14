local var_0_0 = class("IslandProxy", import("model.proxy.NetProxy"))

function var_0_0.register(arg_1_0)
	return
end

function var_0_0.SetIsland(arg_2_0, arg_2_1)
	arg_2_0.island = arg_2_1
end

function var_0_0.GetIsland(arg_3_0)
	return arg_3_0.island
end

function var_0_0.remove(arg_4_0)
	arg_4_0.island = nil
end

function var_0_0.CanUpgradeIsland(arg_5_0)
	local var_5_0 = arg_5_0:GetIsland()

	return var_5_0 and var_5_0:CanLevelUp()
end

function var_0_0.AnyProsperityAwardCanGet(arg_6_0)
	local var_6_0 = arg_6_0:GetIsland()

	return var_6_0 and var_6_0:AnyProsperityAwardCanGet()
end

function var_0_0.ShouldTip(arg_7_0)
	return arg_7_0:CanUpgradeIsland() or arg_7_0:AnyProsperityAwardCanGet()
end

function var_0_0.SetSharedIsland(arg_8_0, arg_8_1)
	arg_8_0.sharedIsland = arg_8_1
end

function var_0_0.GetSharedIsland(arg_9_0)
	return arg_9_0.sharedIsland
end

function var_0_0.SetSyncObjInitData(arg_10_0, arg_10_1)
	arg_10_0.syncObjInitData = arg_10_1
end

function var_0_0.GetSyncObjInitData(arg_11_0)
	return arg_11_0.syncObjInitData and arg_11_0.syncObjInitData or {}
end

function var_0_0.timeCall(arg_12_0)
	return {
		[ProxyRegister.SecondCall] = function(arg_13_0)
			if not arg_12_0.island then
				return
			end

			arg_12_0.island:UpdatePerSecond()
		end,
		[ProxyRegister.DayCall] = function(arg_14_0)
			if not arg_12_0.island then
				return
			end

			arg_12_0.island:UpdatePerDay()
		end
	}
end

return var_0_0
