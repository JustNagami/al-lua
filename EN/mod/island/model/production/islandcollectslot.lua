local var_0_0 = class("IslandCollectSlot", import("model.vo.BaseVO"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.placeId = arg_1_1

	arg_1_0:UpdateData(arg_1_2)
end

function var_0_0.bindConfigTable(arg_2_0)
	return pg.island_production_slot
end

function var_0_0.UpdateData(arg_3_0, arg_3_1)
	arg_3_0.configId = arg_3_1.id
	arg_3_0.formula_id = arg_3_1.formula_id
	arg_3_0.pos = arg_3_1.pos
	arg_3_0.get_num = arg_3_1.get_num
	arg_3_0.refresh_time = arg_3_1.refresh_time

	if arg_3_0.pos ~= 0 then
		arg_3_0.unityPos = pg.island_world_objects[arg_3_0.pos].param.position
	end

	local var_3_0 = pg.island_set.mining_recovery_time.key_value_varchar

	for iter_3_0, iter_3_1 in ipairs(var_3_0) do
		if iter_3_1[1] == arg_3_0.configId then
			arg_3_0.cd = iter_3_1[2]
			arg_3_0.maxTimes = iter_3_1[3]
		end
	end
end

function var_0_0.GetUnitData(arg_4_0)
	return {
		arg_4_0.pos,
		1004
	}
end

function var_0_0.GetUnityWorldPos(arg_5_0)
	return arg_5_0.unityPos or {
		0,
		0,
		0
	}
end

function var_0_0.StartColloct(arg_6_0)
	pg.m02:sendNotification(GAME.ISLAND_START_COLLECT, {
		build_id = arg_6_0.placeId,
		area_id = arg_6_0.configId
	})
end

function var_0_0.IsInitUnit(arg_7_0)
	return pg.TimeMgr.GetInstance():GetServerTime() > arg_7_0.refresh_time + arg_7_0.cd
end

function var_0_0.GetCanCollectTime(arg_8_0)
	return
end

return var_0_0
