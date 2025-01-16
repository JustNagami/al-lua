ys = ys or {}

local var_0_0 = ys

var_0_0.Battle.BattleBuffShiftCLDBox = class("BattleBuffShiftCLDBox", var_0_0.Battle.BattleBuffEffect)
var_0_0.Battle.BattleBuffShiftCLDBox.__name = "BattleBuffShiftCLDBox"

local var_0_1 = var_0_0.Battle.BattleBuffShiftCLDBox

function var_0_1.Ctor(arg_1_0, arg_1_1)
	var_0_1.super.Ctor(arg_1_0, arg_1_1)
end

function var_0_1.SetArgs(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0._cldBox = arg_2_0._tempData.arg_list.cld_box
	arg_2_0._cldOffset = arg_2_0._tempData.arg_list.cld_offset or {
		0,
		0,
		0
	}
end

function var_0_1.GetEffectType(arg_3_0)
	return var_0_1.FX_TYPE
end

function var_0_1.onAttach(arg_4_0, arg_4_1, arg_4_2)
	arg_4_1:ShiftCldComponent(arg_4_0._cldBox, arg_4_0._cldOffset)
end

function var_0_1.onRemove(arg_5_0, arg_5_1, arg_5_2)
	arg_5_1:ResetCldComponent()
end
