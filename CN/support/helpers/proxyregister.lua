local var_0_0 = class("ProxyRegister")

var_0_0.SecondCall = "sec"
var_0_0.MinuteCall = "min"
var_0_0.HourCall = "hour"
var_0_0.DayCall = "day"

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.data = {}
	arg_1_0.callDic = {
		[var_0_0.SecondCall] = {},
		[var_0_0.MinuteCall] = {},
		[var_0_0.HourCall] = {},
		[var_0_0.DayCall] = {}
	}
	arg_1_0.dateMark = pg.TimeMgr.GetInstance():CurrentSTimeDesc("*t", true)

	for iter_1_0, iter_1_1 in ipairs(arg_1_1) do
		arg_1_0:AddProxy(unpack(iter_1_1))
	end

	arg_1_0.timer = CoTimer.New(function()
		arg_1_0:Dispatcher()
	end, 1, -1)
end

function var_0_0.AddProxy(arg_3_0, arg_3_1, arg_3_2, ...)
	if not arg_3_2 then
		return
	end

	local var_3_0 = arg_3_1.New(...)

	table.insert(arg_3_0.data, var_3_0)

	for iter_3_0, iter_3_1 in pairs(var_3_0:timeCall()) do
		table.insert(arg_3_0.callDic[iter_3_0], iter_3_1)
	end
end

function var_0_0.RgisterProxy(arg_4_0, arg_4_1)
	for iter_4_0, iter_4_1 in ipairs(arg_4_0.data) do
		arg_4_1:registerProxy(iter_4_1)
	end

	arg_4_0.timer:Start()
end

function var_0_0.RemoveProxy(arg_5_0, arg_5_1)
	for iter_5_0, iter_5_1 in ipairs(arg_5_0.data) do
		arg_5_1:removeProxy(iter_5_1.__cname)
	end

	arg_5_0.timer:Stop()
end

function var_0_0.Dispatcher(arg_6_0)
	local var_6_0 = {}
	local var_6_1 = pg.TimeMgr.GetInstance():CurrentSTimeDesc("*t", true)

	for iter_6_0, iter_6_1 in ipairs({
		var_0_0.SecondCall,
		var_0_0.MinuteCall,
		var_0_0.HourCall,
		var_0_0.DayCall
	}) do
		if iter_6_1 == var_0_0.DayCall then
			if arg_6_0.dateMark[iter_6_1] ~= var_6_1[iter_6_1] then
				if arg_6_0.dayProto or arg_6_0.dayCount and arg_6_0.dayCount <= 0 then
					var_6_0[iter_6_1] = var_6_1[iter_6_1]
					arg_6_0.dateMark[iter_6_1] = var_6_1[iter_6_1]
				elseif arg_6_0.dayCount then
					arg_6_0.dayCount = arg_6_0.dayCount - 1
				else
					arg_6_0.dayCount = 30
				end
			else
				arg_6_0.dayProto = nil
				arg_6_0.dayCount = nil
			end
		elseif arg_6_0.dateMark[iter_6_1] ~= var_6_1[iter_6_1] then
			var_6_0[iter_6_1] = var_6_1[iter_6_1]
			arg_6_0.dateMark[iter_6_1] = var_6_1[iter_6_1]
		end
	end

	for iter_6_2, iter_6_3 in pairs(var_6_0) do
		for iter_6_4, iter_6_5 in ipairs(arg_6_0.callDic[iter_6_2]) do
			iter_6_5(iter_6_3)
		end
	end
end

return var_0_0
