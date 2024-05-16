local var_0_0 = class("LimitChallengeProxy", import(".NetProxy"))

function var_0_0.register(arg_1_0)
	arg_1_0:initData()
end

function var_0_0.initData(arg_2_0)
	arg_2_0.passTimeDict = {}
	arg_2_0.awardedDict = {}
end

function var_0_0.setTimeDataFromServer(arg_3_0, arg_3_1)
	for iter_3_0, iter_3_1 in ipairs(arg_3_1) do
		local var_3_0 = iter_3_1.key
		local var_3_1 = iter_3_1.value

		print("------------------------------id, time", tostring(var_3_0), tostring(var_3_1))

		arg_3_0.passTimeDict[var_3_0] = var_3_1
	end
end

function var_0_0.setAwardedDataFromServer(arg_4_0, arg_4_1)
	for iter_4_0, iter_4_1 in ipairs(arg_4_1) do
		local var_4_0 = iter_4_1.key
		local var_4_1 = iter_4_1.value > 0

		print("------------------------------id, isGot", tostring(var_4_0), tostring(var_4_1))

		arg_4_0.awardedDict[var_4_0] = var_4_1
	end
end

function var_0_0.setPassTime(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = arg_5_0.passTimeDict[arg_5_1]

	if not var_5_0 then
		arg_5_0.passTimeDict[arg_5_1] = arg_5_2
	elseif arg_5_2 < var_5_0 then
		arg_5_0.passTimeDict[arg_5_1] = arg_5_2

		arg_5_0:sendNotification(LimitChallengeConst.UPDATE_PASS_TIME)
	end
end

function var_0_0.setAwarded(arg_6_0, arg_6_1)
	arg_6_0.awardedDict[arg_6_1] = true
end

function var_0_0.getPassTimeByChallengeID(arg_7_0, arg_7_1)
	return arg_7_0.passTimeDict[arg_7_1]
end

function var_0_0.getMissAwardChallengeIDLIst(arg_8_0)
	local var_8_0 = {}
	local var_8_1 = LimitChallengeConst.GetCurMonthConfig().stage

	for iter_8_0, iter_8_1 in ipairs(var_8_1) do
		local var_8_2 = arg_8_0:getPassTimeByChallengeID(iter_8_1)
		local var_8_3 = var_8_2 and var_8_2 > 0
		local var_8_4 = arg_8_0:isAwardedByChallengeID(iter_8_1)

		if var_8_3 and not var_8_4 then
			table.insert(var_8_0, iter_8_1)
		end
	end

	return var_8_0
end

function var_0_0.isAwardedByChallengeID(arg_9_0, arg_9_1)
	return arg_9_0.awardedDict[arg_9_1]
end

function var_0_0.isLevelUnlock(arg_10_0, arg_10_1)
	if arg_10_1 == 1 then
		return true
	end

	if arg_10_1 > 1 then
		local var_10_0 = LimitChallengeConst.GetChallengeIDByLevel(arg_10_1 - 1)

		return arg_10_0.awardedDict[var_10_0]
	end
end

return var_0_0
