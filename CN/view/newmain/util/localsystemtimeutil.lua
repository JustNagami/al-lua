local var_0_0 = class("LocalSystemTimeUtil", import(".SystemTimeUtil"))

function var_0_0.Flush(arg_1_0)
	local var_1_0 = os.date("%H:%M:%S")
	local var_1_1 = string.split(var_1_0, ":")
	local var_1_2 = var_1_1[2]
	local var_1_3 = tonumber(var_1_1[1])
	local var_1_4 = var_1_3 < 12 and "AM" or "PM"

	if arg_1_0.callback then
		arg_1_0.callback(var_1_3, var_1_2, var_1_4)
	end

	local var_1_5 = os.time()
	local var_1_6 = arg_1_0:GetSecondsToNextMinute(var_1_5)

	arg_1_0:AddTimer(var_1_6)
end

return var_0_0
