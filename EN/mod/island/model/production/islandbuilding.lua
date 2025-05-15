local var_0_0 = class("IslandBuilding", import("model.vo.BaseVO"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.timer = {}
	arg_1_0.configId = arg_1_1.id
	arg_1_0.level = arg_1_1.lv or 1
	arg_1_0.delegationSlotData = {}

	for iter_1_0, iter_1_1 in ipairs(arg_1_1.appoint_list or {}) do
		arg_1_0.delegationSlotData[iter_1_1.id] = IslandRoleDelegationSlot.New(arg_1_0.configId, iter_1_1)
	end

	for iter_1_2, iter_1_3 in ipairs(arg_1_1.ship_appoint_list or {}) do
		arg_1_0:UpdateDeleationRoleDataBySlotId(iter_1_3.id, iter_1_3)
	end

	for iter_1_4, iter_1_5 in ipairs(arg_1_1.award_list or {}) do
		arg_1_0:UpdateDeleationRewardDataBySlotId(iter_1_5.id, iter_1_5)
	end

	arg_1_0.collectionSlotData = {}

	for iter_1_6, iter_1_7 in ipairs(arg_1_1.collect_list or {}) do
		arg_1_0.collectionSlotData[iter_1_7.id] = IslandCollectSlot.New(arg_1_0.configId, iter_1_7)
	end

	arg_1_0.handSlotData = {}

	for iter_1_8, iter_1_9 in ipairs(arg_1_1.hand_list or {}) do
		arg_1_0.handSlotData[iter_1_9.id] = IslandHandSlot.New(iter_1_9)
	end
end

function var_0_0.bindConfigTable(arg_2_0)
	return pg.island_production_place
end

function var_0_0.GetDelegationSlotData(arg_3_0, arg_3_1)
	return arg_3_0.delegationSlotData[arg_3_1]
end

function var_0_0.GetDelegationSlotDataByFormulaId(arg_4_0, arg_4_1)
	for iter_4_0, iter_4_1 in pairs(arg_4_0.delegationSlotData) do
		if iter_4_1:GetFormulaId() and iter_4_1:GetFormulaId() == arg_4_1 then
			return iter_4_1
		end
	end

	return nil
end

function var_0_0.GetCollectSlotData(arg_5_0, arg_5_1)
	return arg_5_0.collectionSlotData[arg_5_1]
end

function var_0_0.GetHandPlantSlotData(arg_6_0, arg_6_1)
	return arg_6_0.handSlotData[arg_6_1]
end

function var_0_0.InitSlotRoleDataByAbility(arg_7_0, arg_7_1)
	if pg.island_production_slot[arg_7_1].type ~= 9 then
		return
	end

	if arg_7_0.delegationSlotData[arg_7_1] then
		warning("已经存在当前槽位的信息了")

		return
	end

	arg_7_0.delegationSlotData[arg_7_1] = IslandRoleDelegationSlot.New(arg_7_0.id, {
		part_num = 0,
		id = arg_7_1,
		formula_list = {}
	})
end

function var_0_0.UpdateDeleationRoleDataBySlotId(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = arg_8_0:GetDelegationSlotData(arg_8_1)

	if not var_8_0 then
		warning("下发数据有问题,下发的槽位id不是当前区域能委派的槽位,下发的槽位id为" .. arg_8_1)

		return
	end

	var_8_0:UpdateSlotRoleData(arg_8_2)
end

function var_0_0.UpdateDeleationRewardDataBySlotId(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = arg_9_0:GetDelegationSlotData(arg_9_1)

	if not var_9_0 then
		warning("下发数据有问题,下发的槽位id不是当前区域能委派的槽位,下发的槽位id为" .. arg_9_1)

		return
	end

	var_9_0:UpdateSlotRewardData(arg_9_2)
end

function var_0_0.UpdateCollectDataBySlotId(arg_10_0, arg_10_1)
	local var_10_0 = arg_10_0:GetCollectSlotData(arg_10_1.id)

	if not var_10_0 then
		warning("下发数据有问题,下发的槽位id不是当前区域能委派的槽位,下发的槽位id为" .. arg_10_1.id)

		return
	end

	local var_10_1 = getProxy(IslandProxy):GetIsland()
	local var_10_2 = var_10_0.pos

	if arg_10_1.pos ~= var_10_2 then
		if var_10_2 then
			var_10_1:DispatchEvent(IslandBuildingAgency.SLOT_UNIT_REMOVE, {
				unitId = var_10_2
			})
		end

		local var_10_3 = arg_10_0.timer[arg_10_1.pos]

		if var_10_3 then
			var_10_3:Stop()
		end

		arg_10_0.timer[arg_10_1.pos] = Timer.New(function()
			var_10_1:DispatchEvent(IslandBuildingAgency.SLOT_STATE_CHANGE, {
				modelId = 1004,
				unitId = arg_10_1.pos
			})
		end, 60, 0)

		arg_10_0.timer[arg_10_1.pos]:Start()
	end

	var_10_0:UpdateData(arg_10_1)
end

function var_0_0.UpdateHandPlantDataBySlotId(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_0:GetHandPlantSlotData(arg_12_1.id)

	if not var_12_0 then
		warning("下发数据有问题,下发的槽位id不是当前区域能委派的槽位,下发的槽位id为" .. arg_12_1.id)

		return
	end

	var_12_0:UpdateData(arg_12_1)
end

function var_0_0.GetFormulaList(arg_13_0)
	local var_13_0 = {}

	for iter_13_0, iter_13_1 in pairs(arg_13_0.formulaData) do
		table.insert(var_13_0, iter_13_1)
	end

	return var_13_0
end

function var_0_0.GetLevel(arg_14_0)
	return arg_14_0.level
end

function var_0_0.IsMaxLevel(arg_15_0)
	return arg_15_0:GetUpgradeCost() == ""
end

function var_0_0.GetName(arg_16_0)
	return arg_16_0:getConfig("name")
end

function var_0_0.UpdatePerSecond(arg_17_0)
	for iter_17_0, iter_17_1 in pairs(arg_17_0.delegationSlotData) do
		iter_17_1:UpdatePerSecond()
	end
end

function var_0_0.GetSlotUnitDataByModelData(arg_18_0)
	local var_18_0 = {}

	for iter_18_0, iter_18_1 in pairs(arg_18_0.collectionSlotData) do
		table.insert(var_18_0, iter_18_1:GetUnitData())
	end

	return var_18_0
end

function var_0_0.GetCheckWorldIdByModelData(arg_19_0)
	local var_19_0 = {}

	for iter_19_0, iter_19_1 in pairs(arg_19_0.collectionSlotData) do
		table.insert(var_19_0, iter_19_1)
	end

	return var_19_0
end

function var_0_0.GetMinRoleDeleGationTime(arg_20_0)
	local var_20_0

	for iter_20_0, iter_20_1 in pairs(arg_20_0.delegationSlotData) do
		local var_20_1 = iter_20_1:GetRoleDelegateFinishTime()

		if var_20_1 ~= -1 then
			var_20_0 = var_20_0 and math.min(var_20_1, var_20_0) or var_20_1
		end
	end

	return var_20_0 and var_20_0 or -1
end

function var_0_0.GetShipIdAndAreaIdList(arg_21_0)
	local var_21_0 = {}

	for iter_21_0, iter_21_1 in pairs(arg_21_0.delegationSlotData) do
		local var_21_1 = iter_21_1:GetRoleShipData()

		if var_21_1 then
			table.insert(var_21_0, var_21_1)
		end
	end

	return var_21_0
end

return var_0_0
