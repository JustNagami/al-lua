local var_0_0 = class("NewEducateBenefit")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.actives = {}

	for iter_1_0, iter_1_1 in ipairs(arg_1_1.actives) do
		arg_1_0.actives[iter_1_1.id] = NewEducateBuff.New(iter_1_1.id, iter_1_1.round)
	end

	arg_1_0.pendings = arg_1_1.pendings
end

function var_0_0.AddActiveBuff(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.actives[arg_2_1] = NewEducateBuff.New(arg_2_1, arg_2_2)
end

function var_0_0.AddPendingBuff(arg_3_0, arg_3_1)
	if not table.contains(arg_3_0.pendings, arg_3_1) then
		table.insert(arg_3_0.pendings, arg_3_1)
	end
end

function var_0_0.RemoveBuff(arg_4_0, arg_4_1)
	arg_4_0.actives[arg_4_1] = nil
end

function var_0_0.GetBuff(arg_5_0, arg_5_1)
	return arg_5_0.actives[arg_5_1]
end

function var_0_0.GetListByType(arg_6_0, arg_6_1)
	local var_6_0 = {}

	for iter_6_0, iter_6_1 in pairs(arg_6_0.actives) do
		if iter_6_1:getConfig("is_show") == 1 and iter_6_1:getConfig("type") == arg_6_1 then
			table.insert(var_6_0, iter_6_1)
		end
	end

	table.sort(var_6_0, CompareFuncs({
		function(arg_7_0)
			return arg_7_0.round
		end,
		function(arg_8_0)
			return arg_8_0.id
		end
	}))

	return var_6_0
end

function var_0_0.GetAllBuffList(arg_9_0)
	local var_9_0 = {}

	for iter_9_0, iter_9_1 in pairs(arg_9_0.actives) do
		table.insert(var_9_0, iter_9_1)
	end

	return var_9_0
end

function var_0_0.OnNextRound(arg_10_0, arg_10_1)
	for iter_10_0, iter_10_1 in pairs(arg_10_0.actives) do
		if arg_10_1 == iter_10_1:GetEndRound() then
			arg_10_0.actives[iter_10_1.id] = nil
		end
	end

	for iter_10_2, iter_10_3 in ipairs(arg_10_0.pendings) do
		arg_10_0:AddActiveBuff(iter_10_3, arg_10_1)
	end

	arg_10_0.pendings = {}
end

function var_0_0.ExistBuff(arg_11_0, arg_11_1)
	return arg_11_0.actives[arg_11_1] or table.contains(arg_11_0.pendings, arg_11_1)
end

function var_0_0.GetAllIds(arg_12_0)
	local var_12_0 = {}

	for iter_12_0, iter_12_1 in pairs(arg_12_0.actives) do
		table.insert(var_12_0, iter_12_1.id)
	end

	return var_12_0, arg_12_0.pendings
end

function var_0_0.GetActiveEffectsByType(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = {}

	for iter_13_0, iter_13_1 in pairs(arg_13_0.actives) do
		local var_13_1 = iter_13_1:GetBenefitIdsByEffectType(arg_13_2)

		if #var_13_1 > 0 then
			for iter_13_2, iter_13_3 in ipairs(var_13_1) do
				if arg_13_1:IsMatchComplex(pg.child2_benefit[iter_13_3].condition) then
					for iter_13_4, iter_13_5 in ipairs(pg.child2_benefit[iter_13_3].effect) do
						if iter_13_5[1] == arg_13_2 then
							table.insert(var_13_0, iter_13_5)
						end
					end
				end
			end
		end
	end

	return var_13_0
end

function var_0_0.GetExtraPlan(arg_14_0, arg_14_1)
	local var_14_0 = {}
	local var_14_1 = arg_14_0:GetActiveEffectsByType(arg_14_1, NewEducateConst.EFFECT_TYPE.EXTRA_PLAN)

	underscore.each(var_14_1, function(arg_15_0)
		var_14_0 = table.mergeArray(var_14_0, arg_15_0[2], true)
	end)

	return var_14_0
end

function var_0_0.GetGoodsDiscountInfos(arg_16_0, arg_16_1)
	local var_16_0 = arg_16_0:GetActiveEffectsByType(arg_16_1, NewEducateConst.EFFECT_TYPE.REDUCE_GOODS_CSOT)

	return arg_16_0:GetCommonDiscountInfos(var_16_0)
end

function var_0_0.GetActivePlanDiscountEffects(arg_17_0, arg_17_1)
	local var_17_0 = {}

	for iter_17_0, iter_17_1 in pairs(arg_17_0.actives) do
		local var_17_1 = iter_17_1:GetBenefitIdsByEffectType(NewEducateConst.EFFECT_TYPE.REDUCE_PLAN_COST)

		if #var_17_1 > 0 then
			for iter_17_2, iter_17_3 in ipairs(var_17_1) do
				local var_17_2 = pg.child2_benefit[iter_17_3].condition
				local var_17_3 = arg_17_1:GetConditionIdsFromComplex(var_17_2)

				for iter_17_4, iter_17_5 in ipairs(var_17_3) do
					local var_17_4 = pg.child2_condition[iter_17_5]

					if var_17_4.type == 8 or var_17_4.type == 15 then
						local var_17_5 = {}

						for iter_17_6, iter_17_7 in ipairs(pg.child2_benefit[iter_17_3].effect) do
							if iter_17_7[1] == NewEducateConst.EFFECT_TYPE.REDUCE_PLAN_COST then
								table.insert(var_17_5, iter_17_7)
							end
						end

						for iter_17_8, iter_17_9 in ipairs(var_17_4.param[1]) do
							if not var_17_0[iter_17_9] then
								var_17_0[iter_17_9] = {}
							end

							var_17_0[iter_17_9] = table.mergeArray(var_17_0[iter_17_9], var_17_5)
						end
					end
				end
			end
		end
	end

	return var_17_0
end

function var_0_0.GetPlanDiscountInfos(arg_18_0, arg_18_1)
	local var_18_0 = {}
	local var_18_1 = arg_18_0:GetActivePlanDiscountEffects(arg_18_1)

	for iter_18_0, iter_18_1 in pairs(var_18_1) do
		var_18_0[iter_18_0] = arg_18_0:GetCommonDiscountInfos(iter_18_1)
	end

	return var_18_0
end

function var_0_0.GetCommonDiscountInfos(arg_19_0, arg_19_1)
	local var_19_0 = {}

	underscore.each(arg_19_1, function(arg_20_0)
		local var_20_0 = arg_20_0[2][1]
		local var_20_1 = arg_20_0[2][2]
		local var_20_2 = arg_20_0[2][3]
		local var_20_3 = arg_20_0[2][4]

		if not var_19_0[var_20_0] then
			var_19_0[var_20_0] = {}
		end

		if not var_19_0[var_20_0][var_20_1] then
			var_19_0[var_20_0][var_20_1] = {
				value = 0,
				ratio = 0
			}
		end

		if var_20_2 == 1 then
			var_19_0[var_20_0][var_20_1].value = var_19_0[var_20_0][var_20_1].value + var_20_3
		elseif var_20_2 == 2 then
			var_19_0[var_20_0][var_20_1].ratio = var_19_0[var_20_0][var_20_1].ratio + var_20_3
		end
	end)

	return var_19_0
end

return var_0_0
