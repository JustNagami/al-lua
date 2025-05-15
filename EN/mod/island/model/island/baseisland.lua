local var_0_0 = class("BaseIsland", import("Mod.Island.IslandDispatcher"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0)

	arg_1_0.id = arg_1_1.id
	arg_1_0.level = arg_1_1.level or 1
	arg_1_0.configId = arg_1_0.level
	arg_1_0.exp = arg_1_1.exp or 0
	arg_1_0.name = arg_1_1.name or i18n1("布之岛")
	arg_1_0.prosperity = arg_1_1.prosperity or 0
	arg_1_0.manifesto = arg_1_1.signature or ""
	arg_1_0.prosperityList = {}

	for iter_1_0, iter_1_1 in ipairs(arg_1_1.prosperity_rewarded or {}) do
		arg_1_0.prosperityList[iter_1_1] = true
	end

	arg_1_0.ablityAgency = IslandAblityAgency.New(arg_1_0, arg_1_1)
	arg_1_0.characterAgency = IslandCharacterAgency.New(arg_1_0, arg_1_1)
	arg_1_0.visitorAgency = IslandVisitorAgency.New(arg_1_0, arg_1_1)
	arg_1_0.technologyAgency = IslandTechnologyAgency.New(arg_1_0, arg_1_1)

	local var_1_0 = {}

	for iter_1_2, iter_1_3 in ipairs(pg.island_furniture_template.all) do
		table.insert(var_1_0, {
			count = 1,
			id = iter_1_3
		})
	end

	local var_1_1 = {
		level = arg_1_1.agora_level,
		furniture_list = {},
		placed_list = arg_1_1.placed_list or {}
	}

	arg_1_0.agoraAgency = IslandAgoraAgency.New(arg_1_0, {
		agora = var_1_1
	})
	arg_1_0.mapID = pg.island_set.initial_scene.key_value_int
	arg_1_0.spawnPointId = nil
end

function var_0_0.IsPrivate(arg_2_0)
	return false
end

function var_0_0.GetVisitorAgency(arg_3_0)
	return arg_3_0.visitorAgency
end

function var_0_0.GetAgoraAgency(arg_4_0)
	return arg_4_0.agoraAgency
end

function var_0_0.GetCharacterAgency(arg_5_0)
	return arg_5_0.characterAgency
end

function var_0_0.GetTechnologyAgency(arg_6_0)
	return arg_6_0.technologyAgency
end

function var_0_0.GetAblityAgency(arg_7_0)
	return arg_7_0.ablityAgency
end

function var_0_0.SetSpawnPointId(arg_8_0, arg_8_1)
	arg_8_0.spawnPointId = arg_8_1
end

function var_0_0.GetSpawnPointId(arg_9_0)
	local var_9_0 = arg_9_0.spawnPointId

	arg_9_0.spawnPointId = nil

	return var_9_0
end

function var_0_0.GetMapId(arg_10_0)
	return arg_10_0.mapID
end

function var_0_0.SetMapId(arg_11_0, arg_11_1)
	arg_11_0.mapID = arg_11_1
end

function var_0_0.getConfig(arg_12_0, arg_12_1)
	return pg.island_level[arg_12_0.configId][arg_12_1]
end

function var_0_0.GetUnlockBuildingList(arg_13_0)
	if arg_13_0:IsMaxLevel() then
		return {}
	end

	return pg.island_level[arg_13_0.level].island_level_unlock
end

function var_0_0.IsNew(arg_14_0)
	return arg_14_0.name == ""
end

function var_0_0.CanModifyName(arg_15_0)
	return true
end

function var_0_0.SetName(arg_16_0, arg_16_1)
	arg_16_0.name = arg_16_1
end

function var_0_0.GetName(arg_17_0)
	return arg_17_0.name
end

function var_0_0.SetManifesto(arg_18_0, arg_18_1)
	arg_18_0.manifesto = arg_18_1
end

function var_0_0.GetManifesto(arg_19_0)
	return arg_19_0.manifesto
end

function var_0_0.GetModifyNameConsume(arg_20_0)
	return {
		DROP_TYPE_RESOURCE,
		1,
		1
	}
end

function var_0_0.AddExp(arg_21_0, arg_21_1)
	if arg_21_0:IsMaxLevel() then
		return
	end

	arg_21_0.exp = arg_21_0.exp + arg_21_1
end

function var_0_0.Upgrade(arg_22_0)
	if arg_22_0:IsMaxLevel() then
		return
	end

	if arg_22_0:CanLevelUp() then
		arg_22_0.exp = arg_22_0:IsMaxLevel() and 0 or arg_22_0.exp - arg_22_0:GetTargeExp()

		arg_22_0:LevelUp()
	end
end

function var_0_0.LevelUp(arg_23_0)
	arg_23_0.level = arg_23_0.level + 1
	arg_23_0.configId = arg_23_0.level
end

function var_0_0.GetTargeExp(arg_24_0)
	local var_24_0 = pg.island_level[arg_24_0.level]

	assert(var_24_0)

	return var_24_0.island_exp
end

function var_0_0.CanLevelUp(arg_25_0)
	if arg_25_0:IsMaxLevel() then
		return false
	end

	return arg_25_0:GetTargeExp() <= arg_25_0.exp
end

function var_0_0.IsMaxLevel(arg_26_0)
	local var_26_0 = #pg.island_level.all

	return pg.island_level.all[var_26_0] <= arg_26_0.level
end

function var_0_0.StaticIsMaxLevel(arg_27_0, arg_27_1)
	local var_27_0 = #pg.island_level.all

	return arg_27_1 >= pg.island_level.all[var_27_0]
end

function var_0_0.GetLevel(arg_28_0)
	return arg_28_0.level
end

function var_0_0.GetExp(arg_29_0)
	return arg_29_0.exp
end

function var_0_0.GetUpgradeAwardsByLevel(arg_30_0, arg_30_1)
	if arg_30_0:StaticIsMaxLevel(arg_30_1) then
		return {}
	end

	local var_30_0 = pg.island_level[arg_30_1]

	assert(var_30_0)

	local var_30_1 = {}

	for iter_30_0, iter_30_1 in ipairs(var_30_0.island_level_award) do
		table.insert(var_30_1, {
			DROP_TYPE_ISLAND_ITEM,
			iter_30_1[1],
			iter_30_1[2]
		})
	end

	return var_30_1
end

function var_0_0.GetUpgradeAwards(arg_31_0)
	return (arg_31_0:GetUpgradeAwardsByLevel(arg_31_0.level))
end

function var_0_0.GetUpgradeConsume(arg_32_0)
	if arg_32_0:StaticIsMaxLevel(arg_32_0.level) then
		return {}
	end

	local var_32_0 = pg.island_level[arg_32_0.level + 1]

	assert(var_32_0)

	local var_32_1 = {}

	for iter_32_0, iter_32_1 in ipairs(var_32_0.cost) do
		table.insert(var_32_1, {
			DROP_TYPE_ISLAND_ITEM,
			iter_32_1[1],
			iter_32_1[2]
		})
	end

	return var_32_1
end

function var_0_0.AddProsperity(arg_33_0, arg_33_1)
	if not arg_33_0:CanAddProsperity() then
		return
	end

	arg_33_0.prosperity = arg_33_0.prosperity + arg_33_1
end

function var_0_0.CanAddProsperity(arg_34_0)
	local var_34_0 = arg_34_0:GetMaxProsperityLevel()

	return pg.island_prosperity[var_34_0].prosperity > arg_34_0.prosperity
end

function var_0_0.GetProsperity(arg_35_0)
	return arg_35_0.prosperity
end

function var_0_0.GetMaxProsperityLevel(arg_36_0)
	local var_36_0 = pg.island_prosperity.all

	return var_36_0[#var_36_0]
end

function var_0_0.GetTargetProsperityByLevel(arg_37_0, arg_37_1)
	assert(pg.island_prosperity[arg_37_1])

	return pg.island_prosperity[arg_37_1].prosperity
end

function var_0_0.GetTargetProsperity(arg_38_0)
	local var_38_0 = 0
	local var_38_1 = arg_38_0:GetProsperity()

	for iter_38_0, iter_38_1 in ipairs(pg.island_prosperity.all) do
		local var_38_2 = arg_38_0:GetTargetProsperityByLevel(iter_38_1)

		if var_38_1 < var_38_2 then
			return var_38_2
		end
	end

	return var_38_0
end

function var_0_0.GetProsperityLevel(arg_39_0)
	local var_39_0 = arg_39_0:GetProsperity()

	for iter_39_0, iter_39_1 in ipairs(pg.island_prosperity.all) do
		if var_39_0 < arg_39_0:GetTargetProsperityByLevel(iter_39_1) then
			return iter_39_1
		end
	end

	return arg_39_0:GetMaxProsperityLevel()
end

function var_0_0.CanGetProsperityAwards(arg_40_0, arg_40_1)
	if arg_40_0:IsReceiveProsperityAwards(arg_40_1) then
		return false
	end

	local var_40_0 = pg.island_prosperity[arg_40_1]

	if not var_40_0 then
		return false
	end

	return var_40_0.prosperity <= arg_40_0:GetProsperity()
end

function var_0_0.AnyProsperityAwardCanGet(arg_41_0)
	for iter_41_0, iter_41_1 in ipairs(pg.island_prosperity.all) do
		if arg_41_0:CanGetProsperityAwards(iter_41_1) then
			return true
		end
	end

	return false
end

function var_0_0.IsReceiveProsperityAwards(arg_42_0, arg_42_1)
	return arg_42_0.prosperityList[arg_42_1] == true
end

function var_0_0.ReceiveProsperityAwards(arg_43_0, arg_43_1)
	arg_43_0.prosperityList[arg_43_1] = true
end

function var_0_0.GetProsperityAward(arg_44_0, arg_44_1)
	return pg.island_prosperity[arg_44_1].award_display
end

function var_0_0.UpdatePerDay(arg_45_0)
	return
end

function var_0_0.UpdatePerSecond(arg_46_0)
	return
end

return var_0_0
