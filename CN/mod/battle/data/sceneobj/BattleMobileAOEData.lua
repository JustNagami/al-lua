ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleConst
local var_0_2 = class("BattleMobileAOEData", var_0_0.Battle.BattleLastingAOEData)

var_0_0.Battle.BattleMobileAOEData = var_0_2
var_0_2.__name = "BattleMobileAOEData"
var_0_2.STAY = 0
var_0_2.FOLLOW = 1
var_0_2.REFERENCE = 2

function var_0_2.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4, arg_1_5)
	var_0_2.super.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_5)

	arg_1_0.updatePosition = var_0_2.doFollow
end

function var_0_2.SetReferenceUnit(arg_2_0, arg_2_1)
	arg_2_0._referenceUnit = arg_2_1
end

function var_0_2.SetReferenceData(arg_3_0, arg_3_1)
	if arg_3_1 == var_0_2.STAY then
		arg_3_0.updatePosition = var_0_2.doStay
	elseif arg_3_1 == var_0_2.FOLLOW then
		arg_3_0.updatePosition = var_0_2.doFollow
	elseif arg_3_1 == var_0_2.REFERENCE then
		arg_3_0.updatePosition = var_0_2.doReference
	end
end

function var_0_2.Dispose(arg_4_0)
	arg_4_0._host = nil

	var_0_2.super.Dispose(arg_4_0)
end

function var_0_2.doStay(arg_5_0)
	return
end

function var_0_2.doFollow(arg_6_0)
	local var_6_0 = setmetatable({}, {
		__index = arg_6_0._referenceUnit:GetPosition()
	})

	arg_6_0:SetPosition(var_6_0)
end

function var_0_2.doReference(arg_7_0)
	return
end

function var_0_2.Settle(arg_8_0)
	arg_8_0:updatePosition()
	var_0_2.super.Settle(arg_8_0)
end
