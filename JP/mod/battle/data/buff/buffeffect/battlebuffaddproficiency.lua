ys = ys or {}

local var_0_0 = ys
local var_0_1 = class("BattleBuffAddProficiency", var_0_0.Battle.BattleBuffEffect)

var_0_0.Battle.BattleBuffAddProficiency = var_0_1
var_0_1.__name = "BattleBuffAddProficiency"

function var_0_1.Ctor(arg_1_0, arg_1_1)
	var_0_1.super.Ctor(arg_1_0, arg_1_1)
end

function var_0_1.SetArgs(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0._group = arg_2_0._tempData.arg_list.group or arg_2_2:GetID()
	arg_2_0._weaponLabelList = arg_2_0._tempData.arg_list.label or {}
	arg_2_0._weaponIndexList = arg_2_0._tempData.arg_list.index
	arg_2_0._number = arg_2_0._tempData.arg_list.number
	arg_2_0._numberBase = arg_2_0._number
end

function var_0_1.onAttach(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0:calcEnhancement(arg_3_1)
end

function var_0_1.onStack(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0:resetEnhancement(arg_4_1)

	arg_4_0._number = arg_4_0._numberBase * arg_4_2._stack

	arg_4_0:calcEnhancement(arg_4_1)
end

function var_0_1.onRemove(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0:resetEnhancement(arg_5_1)
end

function var_0_1.calcEnhancement(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = arg_6_1:GetAllWeapon()
	local var_6_1 = arg_6_0._number

	for iter_6_0, iter_6_1 in ipairs(var_6_0) do
		local var_6_2 = 1
		local var_6_3 = iter_6_1:GetEquipmentLabel()

		for iter_6_2, iter_6_3 in ipairs(arg_6_0._weaponLabelList) do
			if not table.contains(var_6_3, iter_6_3) then
				var_6_2 = 0

				break
			end
		end

		if arg_6_0._weaponIndexList then
			local var_6_4 = iter_6_1:GetEquipmentIndex()

			if not table.contains(arg_6_0._weaponIndexList, var_6_4) then
				var_6_2 = var_6_2 * 0
			end
		end

		if var_6_2 == 1 then
			local var_6_5 = iter_6_1:GetPotential() + var_6_1

			iter_6_1:SetPotentialFactor(var_6_5)
		end
	end
end

function var_0_1.resetEnhancement(arg_7_0, arg_7_1)
	local var_7_0 = arg_7_0._number * -1
	local var_7_1 = arg_7_1:GetAllWeapon()

	for iter_7_0, iter_7_1 in ipairs(var_7_1) do
		local var_7_2 = 1
		local var_7_3 = iter_7_1:GetEquipmentLabel()

		for iter_7_2, iter_7_3 in ipairs(arg_7_0._weaponLabelList) do
			if not table.contains(var_7_3, iter_7_3) then
				var_7_2 = 0

				break
			end
		end

		if arg_7_0._weaponIndexList then
			local var_7_4 = iter_7_1:GetEquipmentIndex()

			if not table.contains(arg_7_0._weaponIndexList, var_7_4) then
				var_7_2 = var_7_2 * 0
			end
		end

		if var_7_2 == 1 then
			local var_7_5 = iter_7_1:GetPotential() + var_7_0

			iter_7_1:SetPotentialFactor(var_7_5)
		end
	end
end
