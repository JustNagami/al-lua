local var_0_0 = class("IslandUnitVO")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.id = arg_1_1.id
	arg_1_0.modelId = arg_1_1.modelId
	arg_1_0.type = arg_1_1.type
	arg_1_0.name = arg_1_1.name
	arg_1_0.position = BuildVector3(arg_1_1.position)
	arg_1_0.rotation = BuildVector3(arg_1_1.rotation)
	arg_1_0.scale = BuildVector3(arg_1_1.scale)
	arg_1_0.behaviourTree = arg_1_1.behaviourTree
end

function var_0_0.GetType(arg_2_0)
	return arg_2_0.type
end

function var_0_0.IsPlayer(arg_3_0)
	return arg_3_0.type == IslandConst.UNIT_TYPE_PLAYER
end

function var_0_0.GetAssetPath(arg_4_0)
	local var_4_0

	if arg_4_0.type == IslandConst.UNIT_TYPE_CHAR then
		var_4_0 = pg.island_unit_character[arg_4_0.modelId].model
	elseif arg_4_0.type == IslandConst.UNIT_TYPE_ITEM or arg_4_0.type == IslandConst.UNIT_TYPE_ITEM_INTERACT then
		var_4_0 = pg.island_unit_item[arg_4_0.modelId].model
	elseif arg_4_0.type == IslandConst.UNIT_TYPE_PLAYER or arg_4_0.type == IslandConst.UNIT_TYPE_VISITOR or arg_4_0.type == IslandConst.UNIT_TYPE_SYSTEM then
		var_4_0 = pg.island_ship[arg_4_0.modelId].model
	end

	assert(var_4_0)

	return string.lower(var_4_0)
end

function var_0_0.GetBehaviourTree(arg_5_0)
	return arg_5_0.behaviourTree
end

return var_0_0
