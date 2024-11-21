local var_0_0 = class("AirFightActivity", import("model.vo.Activity"))

function var_0_0.GetMaxProgress(arg_1_0)
	return arg_1_0:getConfig("config_data")[1]
end

function var_0_0.GetPerDayCount(arg_2_0)
	return arg_2_0:getConfig("config_data")[2]
end

function var_0_0.GetPerLevelProgress(arg_3_0)
	return arg_3_0:getConfig("config_data")[3]
end

function var_0_0.GetLevelCount(arg_4_0)
	return arg_4_0:GetMaxProgress() / arg_4_0:GetPerLevelProgress()
end

function var_0_0.readyToAchieve(arg_5_0)
	if arg_5_0:IsTip() then
		return false
	end

	local var_5_0 = arg_5_0:GetMaxProgress()
	local var_5_1 = arg_5_0:GetPerDayCount()
	local var_5_2 = arg_5_0:GetLevelCount()
	local var_5_3 = 0

	for iter_5_0 = 1, var_5_2 do
		var_5_3 = var_5_3 + (arg_5_0:getKVPList(1, iter_5_0) or 0)
	end

	local var_5_4 = pg.TimeMgr.GetInstance()
	local var_5_5 = var_5_4:DiffDay(arg_5_0.data1, var_5_4:GetServerTime()) + 1

	return var_5_3 < math.min(var_5_5 * var_5_1, var_5_0)
end

function var_0_0.IsTip(arg_6_0)
	local var_6_0 = getProxy(PlayerProxy):getRawData().id

	return PlayerPrefs.GetInt("airfight_tip_" .. arg_6_0.id .. "_" .. var_6_0, 0) > pg.TimeMgr.GetInstance():GetServerTime()
end

function var_0_0.RecordTip(arg_7_0)
	if arg_7_0:IsTip() then
		return
	end

	local var_7_0 = getProxy(PlayerProxy):getRawData().id
	local var_7_1 = pg.TimeMgr.GetInstance():GetTimeToNextTime()

	PlayerPrefs.SetInt("airfight_tip_" .. arg_7_0.id .. "_" .. var_7_0, var_7_1)
end

return var_0_0
