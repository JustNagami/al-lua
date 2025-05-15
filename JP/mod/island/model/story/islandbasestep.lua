local var_0_0 = class("IslandBaseStep")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.unitId = 0
	arg_1_0.characterId = arg_1_1.characterId or 0
	arg_1_0.animation = arg_1_1.animation
	arg_1_0.say = arg_1_1.say or ""
end

function var_0_0.IsSameBranch(arg_2_0, arg_2_1)
	return true
end

function var_0_0.IsPlayer(arg_3_0)
	return not arg_3_0.unitId or arg_3_0.unitId == 0
end

function var_0_0.GetActorIcon(arg_4_0)
	if arg_4_0:IsPlayer() then
		return nil
	end

	local var_4_0 = pg.island_unit_character[arg_4_0.characterId]

	if not var_4_0 then
		return nil
	end

	local var_4_1 = var_4_0.shipId
	local var_4_2 = pg.ship_skin_template[var_4_1]

	if not var_4_2 then
		return nil
	end

	return var_4_2.prefab
end

function var_0_0.GetActorName(arg_5_0)
	if arg_5_0:IsPlayer() then
		return i18n1("指挥官")
	end

	local var_5_0 = pg.island_unit_character[arg_5_0.characterId]

	if not var_5_0 then
		return ""
	end

	return var_5_0.name
end

function var_0_0.GetUnitId(arg_6_0)
	return arg_6_0.unitId
end

function var_0_0.GetAnimation(arg_7_0)
	return arg_7_0.animation
end

function var_0_0.ExistAnimation(arg_8_0)
	return arg_8_0.animation ~= nil and arg_8_0.animation ~= ""
end

function var_0_0.GetSay(arg_9_0)
	return arg_9_0.say
end

return var_0_0
