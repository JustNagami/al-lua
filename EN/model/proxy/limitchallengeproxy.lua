local var_0_0 = class("LimitChallengeProxy", import(".NetProxy"))

function var_0_0.register(arg_1_0)
	arg_1_0:initData()
end

function var_0_0.timeCall(arg_2_0)
	return {
		[ProxyRegister.DayCall] = function(arg_3_0)
			LimitChallengeConst.RequestInfo()
		end
	}
end

function var_0_0.initData(arg_4_0)
	arg_4_0.passTimeDict = {}
	arg_4_0.awardedDict = {}
	arg_4_0.curMonthPassedIDList = {}
end

function var_0_0.setTimeDataFromServer(arg_5_0, arg_5_1)
	for iter_5_0, iter_5_1 in ipairs(arg_5_1) do
		local var_5_0 = iter_5_1.key
		local var_5_1 = iter_5_1.value

		arg_5_0.passTimeDict[var_5_0] = var_5_1
	end
end

function var_0_0.setAwardedDataFromServer(arg_6_0, arg_6_1)
	for iter_6_0, iter_6_1 in ipairs(arg_6_1) do
		local var_6_0 = iter_6_1.key
		local var_6_1 = iter_6_1.value > 0

		arg_6_0.awardedDict[var_6_0] = var_6_1
	end
end

function var_0_0.setCurMonthPassedIDList(arg_7_0, arg_7_1)
	for iter_7_0, iter_7_1 in ipairs(arg_7_1) do
		table.insert(arg_7_0.curMonthPassedIDList, iter_7_1)
	end
end

function var_0_0.setPassTime(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = arg_8_0.passTimeDict[arg_8_1]

	if not var_8_0 then
		arg_8_0.passTimeDict[arg_8_1] = arg_8_2
	elseif arg_8_2 < var_8_0 then
		arg_8_0.passTimeDict[arg_8_1] = arg_8_2

		arg_8_0:sendNotification(LimitChallengeConst.UPDATE_PASS_TIME)
	end

	if not table.contains(arg_8_0.curMonthPassedIDList, arg_8_1) then
		table.insert(arg_8_0.curMonthPassedIDList, arg_8_1)
	end
end

function var_0_0.setAwarded(arg_9_0, arg_9_1)
	arg_9_0.awardedDict[arg_9_1] = true
end

function var_0_0.getPassTimeByChallengeID(arg_10_0, arg_10_1)
	return arg_10_0.passTimeDict[arg_10_1]
end

function var_0_0.getMissAwardChallengeIDLIst(arg_11_0)
	local var_11_0 = {}
	local var_11_1 = LimitChallengeConst.GetCurMonthConfig().stage

	for iter_11_0, iter_11_1 in ipairs(var_11_1) do
		local var_11_2 = table.contains(arg_11_0.curMonthPassedIDList, iter_11_1)
		local var_11_3 = arg_11_0:isAwardedByChallengeID(iter_11_1)

		if var_11_2 and not var_11_3 then
			table.insert(var_11_0, iter_11_1)
		end
	end

	return var_11_0
end

function var_0_0.isAwardedByChallengeID(arg_12_0, arg_12_1)
	return arg_12_0.awardedDict[arg_12_1]
end

function var_0_0.isLevelUnlock(arg_13_0, arg_13_1)
	if arg_13_1 == 1 then
		return true
	end

	if arg_13_1 > 1 then
		local var_13_0 = LimitChallengeConst.GetChallengeIDByLevel(arg_13_1 - 1)

		return arg_13_0.awardedDict[var_13_0]
	end
end

return var_0_0
