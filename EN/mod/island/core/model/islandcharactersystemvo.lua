local var_0_0 = class("IslandCharacterSystemVO", import(".IslandSystemVO"))
local var_0_1 = 0
local var_0_2 = 1

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0, arg_1_1)

	arg_1_0.id = arg_1_1
	arg_1_0.name = "_system_" .. arg_1_0.id
	arg_1_0.slotDic = {}

	arg_1_0:InitCfgData(arg_1_0.id)

	arg_1_0.config = pg.island_production_place[arg_1_0.id]
	arg_1_0.behaviourTree = arg_1_0.config.behaviourTree
	arg_1_0.worker = 0
end

function var_0_0.InitCfgData(arg_2_0, arg_2_1)
	local var_2_0 = pg.island_production_place[arg_2_1].commission_slot

	for iter_2_0, iter_2_1 in ipairs(var_2_0) do
		local var_2_1 = pg.island_production_commission[iter_2_1]

		arg_2_0.slotDic[var_2_1.slot] = iter_2_1
	end
end

function var_0_0.GetUnit(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	local var_3_0 = arg_3_0.slotDic[arg_3_2]
	local var_3_1 = pg.island_production_commission[var_3_0]
	local var_3_2 = pg.island_world_objects[var_3_1.birthplace]

	if not var_3_2 then
		return nil
	end

	local var_3_3

	if arg_3_0.config.interactionType == var_0_1 and not arg_3_3 then
		local var_3_4 = arg_3_0:GetObjId(arg_3_2)
		local var_3_5 = pg.island_world_objects[var_3_4]
		local var_3_6 = IslandCalcUtil.GetRandomPointOnCircle(BuildVector3(var_3_5.param.position), 2)

		var_3_3 = {
			var_3_6.x,
			var_3_6.y,
			var_3_6.z
		}
	else
		var_3_3 = var_3_2.param.position
	end

	return IslandUnitVO.New({
		behaviourTree = "Island/NodeCanvas/System/system_npc",
		id = arg_3_1,
		modelId = arg_3_1,
		type = IslandConst.UNIT_TYPE_SYSTEM,
		name = "system_unit" .. arg_3_1,
		position = var_3_3,
		rotation = Vector3.zero,
		scale = Vector3.one
	})
end

function var_0_0.GetObjId(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_0.slotDic[arg_4_1]

	return pg.island_production_commission[var_4_0].performanceObjid
end

function var_0_0.SetkWorkerCnt(arg_5_0, arg_5_1)
	arg_5_0.worker = arg_5_1
end

function var_0_0.GetWorkerCnt(arg_6_0)
	return arg_6_0.worker
end

function var_0_0.GetBehaviourTree(arg_7_0)
	if arg_7_0.behaviourTree == "" then
		return nil
	end

	return arg_7_0.behaviourTree
end

return var_0_0
