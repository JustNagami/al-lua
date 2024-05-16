ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleConst
local var_0_2 = class("BattleCldComponent")

var_0_0.Battle.BattleCldComponent = var_0_2
var_0_2.__name = "BattleCldComponent"

function var_0_2.Ctor(arg_1_0)
	return
end

function var_0_2.SetActive(arg_2_0, arg_2_1)
	arg_2_0._cldData.Active = arg_2_1
end

function var_0_2.SetCldData(arg_3_0, arg_3_1)
	arg_3_0._cldData = arg_3_1
	arg_3_0._cldData.distList = {}
	arg_3_0._cldData.Active = false
	arg_3_0._cldData.FriendlyCld = false
	arg_3_0._cldData.Surface = var_0_1.OXY_STATE.FLOAT
	arg_3_0._box.data = arg_3_1
end

function var_0_2.ActiveFriendlyCld(arg_4_0)
	arg_4_0._cldData.FriendlyCld = true
end

function var_0_2.GetCldData(arg_5_0)
	return arg_5_0._cldData
end

function var_0_2.GetCldBox(arg_6_0, arg_6_1)
	assert(false, "BattleCldComponent.GetCldBox:重写这个方法啦！")
end

function var_0_2.GetCldBoxSize(arg_7_0)
	assert(false, "BattleCldComponent.GetCldBoxSize:重写这个方法啦！")

	return nil
end

function var_0_2.FixSpeed(arg_8_0, arg_8_1)
	if not arg_8_0._cldData.FriendlyCld then
		return
	end

	if #arg_8_0._cldData.distList == 0 then
		return
	end

	if arg_8_1.x == 0 and arg_8_1.z == 0 then
		arg_8_0:HandleStaticCld(arg_8_1)
	else
		arg_8_0:HandleDynamicCld(arg_8_1)
	end
end

function var_0_2.HandleDynamicCld(arg_9_0, arg_9_1)
	local var_9_0 = false
	local var_9_1 = false

	for iter_9_0, iter_9_1 in ipairs(arg_9_0._cldData.distList) do
		local var_9_2 = iter_9_1.x

		if not var_9_0 and var_9_2 * math.abs(arg_9_1.x) / arg_9_1.x < 0 then
			arg_9_1.x = 0
			var_9_0 = true
		end

		local var_9_3 = iter_9_1.z

		if not var_9_1 and var_9_3 * math.abs(arg_9_1.z) / arg_9_1.z < 0 then
			arg_9_1.z = 0
			var_9_1 = true
		end

		if var_9_0 and var_9_1 then
			return
		end
	end
end

function var_0_2.HandleStaticCld(arg_10_0, arg_10_1)
	local var_10_0 = arg_10_0._cldData.distList[1]
	local var_10_1 = Vector3(var_10_0.x, 0, var_10_0.z).normalized

	arg_10_1.x = var_0_0.Battle.BattleFormulas.ConvertShipSpeed(var_10_1.x)
	arg_10_1.z = var_0_0.Battle.BattleFormulas.ConvertShipSpeed(var_10_1.z)
end
