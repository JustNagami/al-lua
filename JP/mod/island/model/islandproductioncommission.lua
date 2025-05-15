local var_0_0 = class("IslandProductionCommission", import("model.vo.BaseVO"))

var_0_0.STATUS_EMPTY = 1
var_0_0.STATUS_WORKING = 2
var_0_0.STATUS_STOP = 3

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.id = arg_1_1.appoint_pos or arg_1_1.id
	arg_1_0.configId = arg_1_0.id
	arg_1_0.shipId = arg_1_1.role_id
	arg_1_0.formulaId = arg_1_1.formula_id
	arg_1_0.startTime = arg_1_1.start_time or 0

	if arg_1_0.startTime > 0 then
		arg_1_0.status = var_0_0.STATUS_WORKING

		local var_1_0 = pg.TimeMgr.GetInstance():GetServerTime()
		local var_1_1 = tonumber(pg.island_formula[arg_1_0.formulaId].production_points)
		local var_1_2 = (var_1_0 - arg_1_0.startTime) * 100 / var_1_1

		arg_1_0.num = math.min(var_1_2, arg_1_0:GetCapacity())
	else
		arg_1_0.status = var_0_0.STATUS_EMPTY
		arg_1_0.num = 0
	end

	arg_1_0.limit = 0
end

function var_0_0.bindConfigTable(arg_2_0)
	return pg.island_production_commission
end

function var_0_0.IsUnlock(arg_3_0)
	return true
end

function var_0_0.GetOccupation(arg_4_0)
	return arg_4_0:getConfig("occupation")
end

function var_0_0.GetCapacity(arg_5_0)
	return arg_5_0:getConfig("commission_temporary_storage")
end

function var_0_0.GetName(arg_6_0)
	return arg_6_0:getConfig("name")
end

function var_0_0.GetShipId(arg_7_0)
	return arg_7_0.shipId
end

function var_0_0.SetShipId(arg_8_0, arg_8_1)
	arg_8_0.shipId = arg_8_1
end

function var_0_0.GetFormulaId(arg_9_0)
	return arg_9_0.formulaId
end

function var_0_0.SetFormulaId(arg_10_0, arg_10_1)
	arg_10_0.formulaId = arg_10_1
end

function var_0_0.CheckStart(arg_11_0, arg_11_1)
	if arg_11_0.shipId and arg_11_0.formulaId then
		pg.m02:sendNotification(GAME.ISLAND_START_COMMISSION, {
			buildingId = arg_11_0:getConfig("place_group"),
			commissionId = arg_11_0.id,
			shipId = arg_11_0.shipId,
			formulaId = arg_11_0.formulaId,
			callback = arg_11_1
		})
	elseif arg_11_1 then
		arg_11_1()
	end
end

function var_0_0.GetStatus(arg_12_0)
	return arg_12_0.status
end

function var_0_0.GetNum(arg_13_0)
	return arg_13_0.num
end

function var_0_0.GetCurTime(arg_14_0)
	return 0
end

function var_0_0.GetOnceTime(arg_15_0)
	return 60
end

function var_0_0.GetNextRemainTime(arg_16_0)
	return arg_16_0:GetOnceTime() - arg_16_0:GetCurTime()
end

function var_0_0.IsLimit(arg_17_0)
	return arg_17_0.limit > 0
end

function var_0_0.SetLimit(arg_18_0, arg_18_1)
	arg_18_0.limit = arg_18_1
end

function var_0_0.GetLimit(arg_19_0, arg_19_1)
	return arg_19_0.limit
end

function var_0_0.Clear(arg_20_0)
	arg_20_0.shipId = 0
	arg_20_0.formulaId = 0
	arg_20_0.startTime = 0
end

return var_0_0
