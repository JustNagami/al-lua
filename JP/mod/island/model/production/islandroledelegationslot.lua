local var_0_0 = class("IslandRoleDelegationSlot", import("model.vo.BaseVO"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.buildId = arg_1_1
	arg_1_0.id = arg_1_2.id
	arg_1_0.part_num = arg_1_2.part_num
	arg_1_0.formula_dic = {}

	for iter_1_0, iter_1_1 in ipairs(arg_1_2.formula_list or {}) do
		arg_1_0.formula_dic[iter_1_1.id] = iter_1_1.num
	end
end

function var_0_0.GetFormulaId(arg_2_0)
	return arg_2_0.islandRoleDelegationData and arg_2_0.islandRoleDelegationData.formula_id or arg_2_0.islandRoleDelegationReward and arg_2_0.islandRoleDelegationReward.formula_id
end

function var_0_0.ResetFormulaNum(arg_3_0, arg_3_1)
	arg_3_0.formula_dic[arg_3_1.formula_id] = arg_3_1.num
end

function var_0_0.GetFromulaTatalCount(arg_4_0, arg_4_1)
	return arg_4_0.formula_dic[arg_4_1] or 0
end

function var_0_0.bindConfigTable(arg_5_0)
	return pg.island_production_slot
end

function var_0_0.UpdateSlotRoleData(arg_6_0, arg_6_1)
	if arg_6_1 then
		if arg_6_0.islandRoleDelegationData then
			arg_6_0.islandRoleDelegationData:UpdateData(arg_6_1)
		else
			arg_6_0.islandRoleDelegationData = IslandRoleDelegationData.New(arg_6_1)
		end
	else
		arg_6_0.islandRoleDelegationData = nil
	end
end

function var_0_0.UpdateSlotRewardData(arg_7_0, arg_7_1)
	if arg_7_1 then
		if arg_7_0.islandRoleDelegationReward then
			arg_7_0.islandRoleDelegationReward:UpdateData(arg_7_1)
		else
			arg_7_0.islandRoleDelegationReward = IslandRoleDelegationReward.New(arg_7_1)
		end
	else
		arg_7_0.islandRoleDelegationReward = nil
	end
end

function var_0_0.GetSlotRoleData(arg_8_0)
	return arg_8_0.islandRoleDelegationData
end

function var_0_0.GetSlotRewardData(arg_9_0)
	return arg_9_0.islandRoleDelegationReward
end

function var_0_0.CanStartDelegation(arg_10_0)
	return arg_10_0.islandRoleDelegationData == nil and arg_10_0.islandRoleDelegationReward == nil
end

function var_0_0.Clear(arg_11_0)
	return
end

function var_0_0.UpdatePerSecond(arg_12_0)
	if not arg_12_0.islandRoleDelegationData then
		return
	end

	if arg_12_0.islandRoleDelegationData:CheckDelegationIsEnd() then
		pg.m02:sendNotification(GAME.ISLAND_FINISH_DELEGATION, {
			build_id = arg_12_0.buildId,
			area_id = arg_12_0.id
		})
		arg_12_0.islandRoleDelegationData:SetIsSend(true)
	end
end

function var_0_0.GetRoleDelegateFinishTime(arg_13_0)
	if arg_13_0.islandRoleDelegationReward then
		return 0
	end

	if arg_13_0.islandRoleDelegationData then
		return arg_13_0.islandRoleDelegationData:GetFinishTime()
	end

	return -1
end

function var_0_0.GetRoleShipData(arg_14_0)
	if arg_14_0.islandRoleDelegationData then
		return {
			ship_id = arg_14_0.islandRoleDelegationData.ship_id,
			area_id = arg_14_0.id
		}
	end

	return nil
end

return var_0_0
