local var_0_0 = class("IslandProductionUnit", import("model.vo.BaseVO"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.id = arg_1_1.area_id or arg_1_1.id
	arg_1_0.configId = arg_1_0.id
	arg_1_0.status = arg_1_1.status
	arg_1_0.formulaId = arg_1_1.formula_id
	arg_1_0.startTime = arg_1_1.start_time
end

function var_0_0.bindConfigTable(arg_2_0)
	return pg.island_production_point
end

function var_0_0.IsUnlock(arg_3_0)
	return getProxy(IslandProxy):GetIsland():GetBuildingAgency():GetBuilding(arg_3_0:getConfig("place_group")):GetLevel() >= arg_3_0:getConfig("unlock_place_level")
end

function var_0_0.GetFormulaId(arg_4_0)
	return arg_4_0.formulaId
end

function var_0_0.Clear(arg_5_0)
	arg_5_0.formulaId = 0
	arg_5_0.startTime = 0
end

return var_0_0
