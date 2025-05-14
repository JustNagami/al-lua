local var_0_0 = class("IslandTechnologyAgency", import(".IslandBaseAgency"))

var_0_0.PLACE_ID = 702

function var_0_0.OnInit(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1.tech.finish_list
	local var_1_1 = {}

	for iter_1_0, iter_1_1 in ipairs(arg_1_1.tech.repeat_finish_list) do
		var_1_1[iter_1_1.id] = iter_1_1.num
	end

	arg_1_0.techData = {}
	arg_1_0.formula2Id = {}

	for iter_1_2, iter_1_3 in ipairs(pg.island_technology_template.all) do
		local var_1_2 = IslandTechnology.New(iter_1_3)

		if var_1_2:IsOnceType() then
			var_1_2:SetFinishedCnt(table.contains(var_1_0, iter_1_3) and 1 or 0)
		else
			var_1_2:SetFinishedCnt(var_1_1[iter_1_3] or 0)
		end

		arg_1_0.techData[var_1_2.id] = var_1_2
		arg_1_0.formula2Id[var_1_2:GetFormulaId()] = var_1_2.id
	end
end

function var_0_0.GetTechnology(arg_2_0, arg_2_1)
	return arg_2_0.techData[arg_2_1]
end

function var_0_0.GetTechnologyByFormulaId(arg_3_0, arg_3_1)
	return arg_3_0.techData[arg_3_0.formula2Id[arg_3_1]]
end

function var_0_0.AddFinishCntByFormulatId(arg_4_0, arg_4_1)
	arg_4_0:GetTechnologyByFormulaId(arg_4_1):AddFinishedCnt()
end

function var_0_0.GetAutoFinishList(arg_5_0)
	local var_5_0 = {}

	for iter_5_0, iter_5_1 in pairs(arg_5_0.techData) do
		if iter_5_1:CheckFinishImmd() then
			table.insert(var_5_0, iter_5_1.id)
		end
	end

	return var_5_0
end

function var_0_0.IsUnlockTech(arg_6_0, arg_6_1)
	return arg_6_0.techData[arg_6_1]:IsUnlock()
end

function var_0_0.IsFinishedTech(arg_7_0, arg_7_1)
	return arg_7_0.techData[arg_7_1]:GetFinishedCnt() > 0
end

function var_0_0.GetPctByType(arg_8_0, arg_8_1)
	local var_8_0 = pg.island_technology_template.get_id_list_by_tech_belong[arg_8_1]
	local var_8_1 = underscore.reduce(var_8_0, 0, function(arg_9_0, arg_9_1)
		return arg_9_0 + (arg_8_0:IsFinishedTech(arg_9_1) and 1 or 0)
	end)

	return math.floor(var_8_1 / #var_8_0 * 100)
end

function var_0_0.GetEmptySlotId(arg_10_0)
	local var_10_0 = getProxy(IslandProxy):GetIsland():GetBuildingAgency():GetBuilding(var_0_0.PLACE_ID)

	for iter_10_0, iter_10_1 in ipairs(var_0_0.GetSlotIds()) do
		local var_10_1 = var_10_0:GetDelegationSlotData(iter_10_1)

		if var_10_1 and var_10_1:CanStartDelegation() then
			return iter_10_1
		end
	end

	return nil
end

function var_0_0.GetSlotIds()
	return pg.island_production_slot.get_id_list_by_place[var_0_0.PLACE_ID]
end

return var_0_0
