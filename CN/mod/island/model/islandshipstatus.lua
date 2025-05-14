local var_0_0 = class("IslandShipStatus", import("model.vo.BaseVO"))

var_0_0.TYPE_BUFF = 1
var_0_0.TYPE_DEBUFF = 2

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.id = arg_1_1.id
	arg_1_0.configId = arg_1_1.id
	arg_1_0.time = arg_1_1.end_time or 0
end

function var_0_0.bindConfigTable(arg_2_0)
	return pg.island_ship_state
end

function var_0_0.AddTime(arg_3_0, arg_3_1)
	local var_3_0 = pg.TimeMgr.GetInstance():GetServerTime()

	arg_3_0.time = math.max(arg_3_0.time, var_3_0) + arg_3_1
end

function var_0_0.IsExpiration(arg_4_0)
	return pg.TimeMgr.GetInstance():GetServerTime() >= arg_4_0.time
end

function var_0_0.GetDesc(arg_5_0)
	return arg_5_0:getConfig("desc")
end

function var_0_0.GetIcon(arg_6_0)
	return arg_6_0:getConfig("icon")
end

function var_0_0.GetName(arg_7_0)
	return arg_7_0:getConfig("name")
end

function var_0_0.IsDebuff(arg_8_0)
	return arg_8_0:getConfig("type") == var_0_0.TYPE_DEBUFF
end

return var_0_0
