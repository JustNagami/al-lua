local var_0_0 = class("IslandAccessAgency", import(".IslandBaseAgency"))

function var_0_0.OnInit(arg_1_0, arg_1_1)
	arg_1_0.accessType = arg_1_1.open_flag or IslandConst.ACCESS_TYPE_OPEN
	arg_1_0.whiteList = {}

	for iter_1_0, iter_1_1 in ipairs(arg_1_1.white_list) do
		table.insert(arg_1_0.whiteList, iter_1_1)
	end

	arg_1_0.blackList = {}

	for iter_1_2, iter_1_3 in ipairs(arg_1_1.black_list) do
		table.insert(arg_1_0.blackList, iter_1_3)
	end

	arg_1_0.visitorList = {}

	for iter_1_4, iter_1_5 in ipairs(arg_1_1.visitor_history) do
		table.insert(arg_1_0.visitorList, iter_1_5)
	end
end

function var_0_0.SetWhiteList(arg_2_0, arg_2_1)
	arg_2_0.whiteList = arg_2_1
end

function var_0_0.GetWhiteList(arg_3_0)
	return arg_3_0.whiteList
end

function var_0_0.SetBlackList(arg_4_0, arg_4_1)
	arg_4_0.blackList = arg_4_1
end

function var_0_0.AddBlackList(arg_5_0, arg_5_1)
	for iter_5_0, iter_5_1 in ipairs(arg_5_1) do
		if not arg_5_0:InBlackList(iter_5_1) then
			table.insert(arg_5_0.blackList, iter_5_1)
		end
	end
end

function var_0_0.CanAccess(arg_6_0, arg_6_1)
	if arg_6_0:InWhiteList(arg_6_1) then
		return true
	end

	if arg_6_0:InBlackList(arg_6_1) then
		return false
	end

	return arg_6_0:IsOpenAccess()
end

function var_0_0.IsOpenAccess(arg_7_0)
	return arg_7_0:GetAccessType() == IslandConst.ACCESS_TYPE_OPEN
end

function var_0_0.InWhiteList(arg_8_0, arg_8_1)
	return table.contains(arg_8_0.whiteList, arg_8_1)
end

function var_0_0.InBlackList(arg_9_0, arg_9_1)
	return table.contains(arg_9_0.blackList, arg_9_1)
end

function var_0_0.GetAccessType(arg_10_0)
	return arg_10_0.accessType
end

function var_0_0.SetAccessType(arg_11_0, arg_11_1)
	arg_11_0.accessType = arg_11_1
end

return var_0_0
