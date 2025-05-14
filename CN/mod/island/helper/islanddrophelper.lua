local var_0_0 = class("IslandDropHelper")

function var_0_0.AddItems(arg_1_0)
	local var_1_0 = arg_1_0.drop_list or {}
	local var_1_1 = {}
	local var_1_2 = {}
	local var_1_3 = {}
	local var_1_4 = {}

	for iter_1_0, iter_1_1 in ipairs(var_1_0) do
		if iter_1_1.type == DROP_TYPE_ISLAND_ITEM then
			table.insert(var_1_1, iter_1_1)
		elseif iter_1_1.type == DROP_TYPE_ISLAND_OVERFLOWITEM then
			table.insert(var_1_2, iter_1_1)
		elseif iter_1_1.type == DROP_TYPE_ISLAND_ABILITY then
			table.insert(var_1_3, iter_1_1)
		else
			table.insert(var_1_4, iter_1_1)
		end
	end

	local var_1_5 = var_0_0.AddIslandItems(var_1_1)
	local var_1_6 = var_0_0.AddIslandOverFlowItems(var_1_2)
	local var_1_7 = var_0_0.AddIslandAbility(var_1_3)
	local var_1_8 = var_0_0.AddPlayerItems(var_1_4)

	print(#var_1_5, #var_1_6, #var_1_7, #var_1_8)

	return {
		awards = var_1_5,
		overflowAwards = var_1_6,
		abilitys = var_1_7,
		drops = var_1_8
	}
end

function var_0_0.AddIslandItems(arg_2_0)
	local var_2_0 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()
	local var_2_1 = {}

	for iter_2_0, iter_2_1 in ipairs(arg_2_0) do
		local var_2_2 = IslandItem.New(iter_2_1)

		var_2_0:AddItem(var_2_2)
		table.insert(var_2_1, Drop.New({
			type = DROP_TYPE_ISLAND_ITEM,
			id = iter_2_1.id,
			count = iter_2_1.number or iter_2_1.num or iter_2_1.count
		}))
	end

	return var_2_1
end

function var_0_0.AddIslandOverFlowItems(arg_3_0)
	local var_3_0 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()
	local var_3_1 = {}

	for iter_3_0, iter_3_1 in ipairs(arg_3_0) do
		local var_3_2 = IslandItem.New(iter_3_1)

		var_3_0:AddOverFlowItem(var_3_2)
		table.insert(var_3_1, Drop.New({
			type = DROP_TYPE_ISLAND_ITEM,
			id = iter_3_1.id,
			count = iter_3_1.number or iter_3_1.num or iter_3_1.count
		}))
	end

	return var_3_1
end

function var_0_0.AddIslandAbility(arg_4_0)
	local var_4_0 = getProxy(IslandProxy):GetIsland():GetAblityAgency()
	local var_4_1 = {}

	for iter_4_0, iter_4_1 in ipairs(arg_4_0) do
		if not var_4_0:HasAbility(iter_4_1.id) then
			var_4_0:AddAblity(iter_4_1.id)
			var_0_0.HandleIslandShopAbility(iter_4_1.id)
			var_0_0.HandleIslandAbilityByType(iter_4_1.id)
			table.insert(var_4_1, Drop.New({
				count = 1,
				type = DROP_TYPE_ISLAND_ABILITY,
				id = iter_4_1.id
			}))
		end
	end

	return var_4_1
end

function var_0_0.HandleIslandShopAbility(arg_5_0)
	local var_5_0 = IslandAblityAgency.GetEffect(arg_5_0)

	if IslandAblityAgency.IsShopTypeNormal(arg_5_0) then
		local var_5_1 = pg.island_shop_normal_template[var_5_0]

		if var_5_1 then
			local var_5_2 = var_5_1.unlock
			local var_5_3 = true

			for iter_5_0, iter_5_1 in ipairs(var_5_2) do
				if not getProxy(IslandProxy):GetIsland():GetAblityAgency():HasAbility(iter_5_1) then
					var_5_3 = false

					break
				end
			end

			if var_5_3 then
				getProxy(IslandProxy):GetIsland():GetShopAgency():RefreshShopData(var_5_0)
			end
		end
	elseif IslandAblityAgency.IsShopTypeTemporary(arg_5_0) then
		getProxy(IslandProxy):GetIsland():GetShopAgency():RefreshShopData(var_5_0)
	end
end

function var_0_0.HandleIslandAbilityByType(arg_6_0)
	switch(IslandAblityAgency.GetAblityType(arg_6_0), {
		[IslandAblityAgency.TYPE_SLOT] = function()
			getProxy(IslandProxy):GetIsland():GetBuildingAgency():InitSlotRoleDataByAbility(arg_6_0)
		end
	})
end

function var_0_0.AddPlayerItems(arg_8_0)
	return PlayerConst.addTranDrop(arg_8_0)
end

return var_0_0
