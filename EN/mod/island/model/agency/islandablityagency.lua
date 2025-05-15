local var_0_0 = class("IslandAblityAgency", import(".IslandBaseAgency"))

var_0_0.UNLCOK_SYSTEM = "IslandAblityAgency:UNLCOK_SYSTEM"
var_0_0.TYPE_SYSTEM = 1
var_0_0.TYPE_PLACE = 2
var_0_0.TYPE_FORMULA = 3
var_0_0.TYPE_SHOP_NORMAL = 4
var_0_0.TYPE_SHOP_TEMPORARY = 7
var_0_0.TYPE_ORDER = 8
var_0_0.TYPE_SLOT = 9
var_0_0.TYPE_MAP = 11

function var_0_0.OnInit(arg_1_0, arg_1_1)
	arg_1_0.abilitys = {}

	for iter_1_0, iter_1_1 in ipairs(arg_1_1.ability_list or {}) do
		table.insert(arg_1_0.abilitys, iter_1_1)
	end
end

function var_0_0.AddAblity(arg_2_0, arg_2_1)
	table.insert(arg_2_0.abilitys, arg_2_1)

	if var_0_0.GetAblityType(arg_2_1) == var_0_0.TYPE_SYSTEM then
		arg_2_0:DispatchEvent(var_0_0.UNLCOK_SYSTEM, arg_2_1)
	end
end

function var_0_0.IsUnlockMap(arg_3_0, arg_3_1)
	return _.any(arg_3_0.abilitys, function(arg_4_0)
		return var_0_0.IsMapType(arg_4_0) and var_0_0.GetEffect(arg_4_0) == arg_3_1
	end)
end

function var_0_0.IsUnlockShipOrder(arg_5_0, arg_5_1)
	return _.any(arg_5_0.abilitys, function(arg_6_0)
		return var_0_0.IsOrderType(arg_6_0) and var_0_0.GetEffect(arg_6_0) == arg_5_1
	end)
end

function var_0_0.IsUnlockFormuate(arg_7_0, arg_7_1)
	return _.any(arg_7_0.abilitys, function(arg_8_0)
		return var_0_0.IsFormuateType(arg_8_0) and var_0_0.GetEffect(arg_8_0) == arg_7_1
	end)
end

function var_0_0.HasAbility(arg_9_0, arg_9_1)
	return _.any(arg_9_0.abilitys, function(arg_10_0)
		return arg_9_1 == arg_10_0
	end)
end

function var_0_0.IsMapType(arg_11_0)
	return pg.island_ability_template[arg_11_0].type == var_0_0.TYPE_MAP
end

function var_0_0.IsOrderType(arg_12_0)
	return pg.island_ability_template[arg_12_0].type == var_0_0.TYPE_ORDER
end

function var_0_0.IsShopTypeNormal(arg_13_0)
	return pg.island_ability_template[arg_13_0].type == var_0_0.TYPE_SHOP_NORMAL
end

function var_0_0.IsShopTypeTemporary(arg_14_0)
	return pg.island_ability_template[arg_14_0].type == var_0_0.TYPE_SHOP_TEMPORARY
end

function var_0_0.IsCommodityType(arg_15_0)
	return pg.island_ability_template[arg_15_0].type == var_0_0.TYPE_COMMODITY
end

function var_0_0.IsFormuateType(arg_16_0)
	return pg.island_ability_template[arg_16_0].type == var_0_0.TYPE_FORMULA
end

function var_0_0.GetAblityType(arg_17_0)
	return pg.island_ability_template[arg_17_0].type
end

function var_0_0.GetEffect(arg_18_0)
	return pg.island_ability_template[arg_18_0].effect
end

return var_0_0
