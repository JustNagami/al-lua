local var_0_0 = class("IslandShip", import("model.vo.BaseVO"))

var_0_0.GIFT_OP_SHIP = 1
var_0_0.GIFT_OP_MARRIED = 2
var_0_0.STATE_NORMAL = 1
var_0_0.STATE_WORKING = 2

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.id = arg_1_1.id or 0
	arg_1_0.configId = arg_1_0.id
	arg_1_0.exp = arg_1_1.exp or 0
	arg_1_0.level = arg_1_1.level or 1
	arg_1_0.energy = arg_1_1.energy or 0
	arg_1_0.giftOp = arg_1_1.vow_gift or 0
	arg_1_0.attrs = {}

	arg_1_0:InitAttrs()

	arg_1_0.skills = {}

	for iter_1_0, iter_1_1 in ipairs(arg_1_1.skill_list or {}) do
		table.insert(arg_1_0.skills, iter_1_1)
	end

	if #arg_1_0.skills == 0 then
		local var_1_0 = arg_1_0:getConfig("skill")
		local var_1_1 = pg.island_ship_skill.get_id_list_by_group[var_1_0]

		table.insert(arg_1_0.skills, var_1_1[1])
	end

	arg_1_0.status = {}

	for iter_1_2, iter_1_3 in ipairs(arg_1_1.buff_list or {}) do
		local var_1_2 = IslandShipStatus.New(iter_1_3)

		table.insert(arg_1_0.status, var_1_2)
	end
end

function var_0_0.bindConfigTable(arg_2_0)
	return pg.island_ship
end

function var_0_0.AnyExtraAwardCanGet(arg_3_0)
	return arg_3_0:CanGetOwnShipAward() or arg_3_0:CanGetMarriedShipAward()
end

function var_0_0.CanGetOwnShipAward(arg_4_0)
	return not (bit.band(arg_4_0.giftOp, var_0_0.GIFT_OP_SHIP) > 0) and arg_4_0:OwnShipInGame()
end

function var_0_0.CanGetMarriedShipAward(arg_5_0)
	return not (bit.band(arg_5_0.giftOp, var_0_0.GIFT_OP_MARRIED) > 0) and arg_5_0:IsMarriedInGame()
end

function var_0_0.IsMarriedInGame(arg_6_0)
	local var_6_0 = arg_6_0:OwnShipInGame()

	return var_6_0 and var_6_0:IsMarried()
end

function var_0_0.OwnShipInGame(arg_7_0)
	local var_7_0 = arg_7_0:GetShipGroup()

	return (getProxy(CollectionProxy):getShipGroup(var_7_0))
end

function var_0_0.UpdateExtraAwardValue(arg_8_0, arg_8_1)
	arg_8_0.giftOp = bit.bor(arg_8_0.giftOp, arg_8_1)
end

function var_0_0.GetAllExtraAwardOP(arg_9_0)
	return {
		var_0_0.GIFT_OP_SHIP,
		var_0_0.GIFT_OP_MARRIED
	}
end

function var_0_0.GetExtraAwardList(arg_10_0, arg_10_1)
	local var_10_0 = table.indexof(arg_10_0:GetAllExtraAwardOP(), arg_10_1)
	local var_10_1 = arg_10_0:getConfig("vow_gift")
	local var_10_2 = {}
	local var_10_3 = var_10_1[var_10_0] or {}

	table.insert(var_10_2, var_10_3[1] or 0)

	if var_10_3[2] then
		table.insert(var_10_2, {
			type = DROP_TYPE_ISLAND_ITEM,
			id = var_10_3[2][1],
			count = var_10_3[2][2]
		})
	end

	return var_10_2
end

function var_0_0.GetEnergy(arg_11_0)
	return arg_11_0.energy
end

function var_0_0.AddEnergy(arg_12_0, arg_12_1)
	arg_12_0.energy = arg_12_0.energy + arg_12_1
end

function var_0_0.UpdateEnergy(arg_13_0, arg_13_1)
	arg_13_0.energy = arg_13_1
end

function var_0_0.UpdateEnergyBeginRecoverTime(arg_14_0, arg_14_1)
	arg_14_0.recorverTime = arg_14_1
end

function var_0_0.GetMaxEnergy(arg_15_0)
	return arg_15_0:getConfig("stamina_base") + arg_15_0:getConfig("stamina_upgrade") * (arg_15_0.level - 1)
end

function var_0_0.ExistPotency(arg_16_0)
	return false
end

function var_0_0.AnySkillCanUpgrade(arg_17_0)
	return false
end

function var_0_0.HasStatus(arg_18_0)
	return false
end

function var_0_0.GetCreateTime(arg_19_0)
	return 0
end

function var_0_0.GetPower(arg_20_0)
	return 0
end

function var_0_0.GetName(arg_21_0)
	return arg_21_0:getConfig("name")
end

function var_0_0.GetEnName(arg_22_0)
	local var_22_0 = arg_22_0:GetShipGroup()

	return ShipGroup.getDefaultShipConfig(var_22_0).english_name
end

function var_0_0.GetRarity(arg_23_0)
	return arg_23_0:getConfig("rarity")
end

function var_0_0.StaticGetRarity(arg_24_0)
	return pg.island_ship[arg_24_0].rarity
end

function var_0_0.GetPrefab(arg_25_0)
	return var_0_0.StaticGetPrefab(arg_25_0.configId)
end

function var_0_0.GetShipGroup(arg_26_0)
	return var_0_0.StaticGetShipGroup(arg_26_0.configId)
end

function var_0_0.StaticGetShipGroup(arg_27_0)
	return pg.ship_skin_template[arg_27_0].ship_group
end

function var_0_0.StaticGetPrefab(arg_28_0)
	local var_28_0 = pg.ship_skin_template[arg_28_0]

	assert(var_28_0, arg_28_0)

	return var_28_0.prefab
end

function var_0_0.GetLevel(arg_29_0)
	return arg_29_0.level or 1
end

function var_0_0.GetExp(arg_30_0)
	return arg_30_0.exp or 0
end

function var_0_0.AddExp(arg_31_0, arg_31_1)
	if arg_31_0:IsMaxLevel() then
		return
	end

	arg_31_0.exp = arg_31_0.exp + arg_31_1

	if arg_31_0:CanUpgrade() then
		arg_31_0.exp = arg_31_0.exp - arg_31_0:GetTargetExp()
		arg_31_0.level = arg_31_0.level + 1

		arg_31_0:InitAttrs()
	end

	if arg_31_0:IsMaxLevel() then
		arg_31_0.exp = 0
	end
end

function var_0_0.CanUpgrade(arg_32_0)
	return not arg_32_0:IsMaxLevel() and arg_32_0.exp >= arg_32_0:GetTargetExp()
end

function var_0_0.GetTargetExp(arg_33_0)
	if arg_33_0:IsMaxLevel() then
		return 0
	end

	return pg.island_ship_level[arg_33_0.level].exp
end

function var_0_0.IsMaxLevel(arg_34_0)
	return arg_34_0.level >= arg_34_0:getConfig("level_limit")
end

function var_0_0.InitAttrs(arg_35_0)
	local var_35_0 = arg_35_0.level
	local var_35_1 = arg_35_0:getConfig("attribute_base")
	local var_35_2 = arg_35_0:getConfig("attribute_upgrade")

	for iter_35_0, iter_35_1 in ipairs(var_35_1) do
		local var_35_3 = IslandShipAttr.ATTRS[iter_35_0]
		local var_35_4 = arg_35_0:GetAttrGradeValue(var_35_3)

		arg_35_0.attrs[var_35_3] = var_35_1[iter_35_0] + var_35_4 * (var_35_0 - 1)
	end
end

function var_0_0.GetAttrs(arg_36_0)
	return arg_36_0.attrs
end

function var_0_0.GetAttr(arg_37_0, arg_37_1)
	return arg_37_0.attrs[arg_37_1] or 0
end

function var_0_0.GetAttrGrade(arg_38_0, arg_38_1)
	local var_38_0 = table.indexof(IslandShipAttr.ATTRS, arg_38_1)

	return arg_38_0:getConfig("attribute_upgrade")[var_38_0]
end

function var_0_0.GetAttrGradeStr(arg_39_0, arg_39_1)
	return ({
		"S",
		"A",
		"B",
		"C",
		"D"
	})[arg_39_0:GetAttrGrade(arg_39_1)]
end

function var_0_0.GetAttrGradeValue(arg_40_0, arg_40_1)
	local var_40_0 = arg_40_0:GetAttrGrade(arg_40_1)

	return pg.island_set.ship_attribute_value.key_value_varchar[var_40_0]
end

function var_0_0.StaticGetUnlockItemId(arg_41_0)
	local var_41_0 = IslandItem.StaticGetMapUsageList(IslandItemUsage.usage_island_invitation)

	for iter_41_0, iter_41_1 in ipairs(var_41_0) do
		local var_41_1 = IslandItem.StaticGetUsageArg(iter_41_1)

		assert(type(var_41_1) == "string")

		if tonumber(var_41_1) == arg_41_0 then
			return iter_41_1
		end
	end

	return nil
end

function var_0_0.StaticCanUnlock(arg_42_0)
	local var_42_0 = var_0_0.StaticGetUnlockItemId(arg_42_0)

	return var_42_0 and getProxy(IslandProxy):GetIsland():GetInventoryAgency():OwnItem(var_42_0)
end

function var_0_0.UpgradeMainSkill(arg_43_0)
	local var_43_0 = arg_43_0:GetNextLevelMainSkillId()

	if not var_43_0 then
		return
	end

	arg_43_0.skills[1] = var_43_0
end

function var_0_0.GetMainSkill(arg_44_0)
	return arg_44_0.skills[1]
end

function var_0_0.CanUpgradeMainSkill(arg_45_0)
	local function var_45_0(arg_46_0)
		for iter_46_0, iter_46_1 in ipairs(arg_46_0) do
			local var_46_0 = Drop.New({
				type = iter_46_1[1],
				id = iter_46_1[2],
				count = iter_46_1[3]
			})

			if var_46_0:getOwnedCount() < var_46_0.count then
				return false
			end
		end

		return true
	end

	local function var_45_1(arg_47_0)
		if not arg_47_0 then
			return true
		end

		local var_47_0 = pg.island_ship_skill[arg_47_0]

		return arg_45_0.level >= var_47_0.upgrade_unlock
	end

	local var_45_2 = arg_45_0:GetMainSkill()
	local var_45_3 = pg.island_ship_skill[var_45_2]

	return not arg_45_0:IsMaxMainSkillLevel() and var_45_0(var_45_3.upgrade_cost) and var_45_1(arg_45_0:GetNextLevelMainSkillId())
end

function var_0_0.GetUpgradeSkillConsume(arg_48_0)
	local var_48_0 = arg_48_0:GetMainSkill()
	local var_48_1 = pg.island_ship_skill[var_48_0]
	local var_48_2 = {}

	for iter_48_0, iter_48_1 in ipairs(var_48_1.upgrade_cost) do
		table.insert(var_48_2, iter_48_1)
	end

	return var_48_2
end

function var_0_0.IsMaxMainSkillLevel(arg_49_0)
	local var_49_0 = arg_49_0:GetMainSkill()
	local var_49_1 = pg.island_ship_skill[var_49_0]
	local var_49_2 = pg.island_ship_skill.get_id_list_by_group[var_49_1.group]
	local var_49_3 = var_49_2[#var_49_2]

	return var_49_1.level >= pg.island_ship_skill[var_49_3].level
end

function var_0_0.GetMainSkillUpgradeEffectDesc(arg_50_0)
	local var_50_0 = {}
	local var_50_1 = arg_50_0:GetMainSkill()
	local var_50_2 = pg.island_ship_skill[var_50_1].group
	local var_50_3 = pg.island_ship_skill.get_id_list_by_group[var_50_2]

	for iter_50_0, iter_50_1 in pairs(var_50_3) do
		local var_50_4 = pg.island_ship_skill[iter_50_1]
		local var_50_5 = var_50_4.upgrade_desc

		if var_50_5 and var_50_5 ~= "" then
			table.insert(var_50_0, {
				level = var_50_4.level,
				desc = var_50_5
			})
		end
	end

	return var_50_0
end

function var_0_0.GetNextLevelMainSkillId(arg_51_0)
	if arg_51_0:IsMaxMainSkillLevel() then
		return nil
	end

	local var_51_0 = arg_51_0:GetMainSkill()
	local var_51_1 = pg.island_ship_skill[var_51_0]
	local var_51_2 = pg.island_ship_skill.get_id_list_by_group[var_51_1.group]

	return var_51_2[table.indexof(var_51_2, var_51_0) + 1]
end

function var_0_0.IsMainSkillEffective(arg_52_0, arg_52_1)
	local var_52_0 = pg.island_ship_skill[arg_52_0:GetMainSkill()]

	return underscore.any(var_52_0.trigger_type, function(arg_53_0)
		if arg_53_0[2] == 2 then
			return true
		end

		if arg_53_0[1] == 1 and arg_53_0[2] == arg_52_1 then
			return true
		end

		return false
	end)
end

function var_0_0.GetState(arg_54_0)
	return var_0_0.STATE_NORMAL
end

function var_0_0.GetValidStatus(arg_55_0)
	local var_55_0 = {}

	for iter_55_0, iter_55_1 in ipairs(arg_55_0.status) do
		if not iter_55_1:IsExpiration() then
			table.insert(var_55_0, iter_55_1)
		end
	end

	return var_55_0
end

function var_0_0.GetFavoriteGift(arg_56_0)
	return arg_56_0:getConfig("favorite_gift")
end

function var_0_0.StaticGetGiftStatue()
	return pg.island_set.favorite_gifts_state.key_value_int
end

function var_0_0.ExistStatus(arg_58_0, arg_58_1)
	return _.detect(arg_58_0.status, function(arg_59_0)
		return arg_59_0.id == arg_58_1
	end) ~= nil
end

function var_0_0.AddStatus(arg_60_0, arg_60_1, arg_60_2)
	local var_60_0 = _.detect(arg_60_0.status, function(arg_61_0)
		return arg_61_0.id == arg_60_1
	end)

	if var_60_0 then
		var_60_0:AddTime(arg_60_2)
	else
		local var_60_1 = pg.TimeMgr.GetInstance():GetServerTime()
		local var_60_2 = IslandShipStatus.New({
			id = arg_60_1,
			end_time = var_60_1 + arg_60_2
		})

		table.insert(arg_60_0.status, var_60_2)
	end
end

return var_0_0
