local var_0_0 = class("MainSkinDiscountItemTipSequence", import(".MainOverDueSkinDiscountItemSequence"))

function var_0_0.Execute(arg_1_0, arg_1_1)
	if not arg_1_0:ShouldTip() then
		arg_1_1()

		return
	end

	local var_1_0, var_1_1 = arg_1_0:CollectExpiredItems()

	if #var_1_0 <= 0 and #var_1_1 <= 0 then
		arg_1_1()

		return
	end

	var_0_0.TipFlag = true

	local var_1_2 = {}

	for iter_1_0, iter_1_1 in ipairs(var_1_0) do
		table.insert(var_1_2, iter_1_1)
	end

	for iter_1_2, iter_1_3 in ipairs(var_1_1) do
		table.insert(var_1_2, iter_1_3)
	end

	arg_1_0:DisplayResults(var_1_2, arg_1_1)
end

function var_0_0.ShouldTip(arg_2_0)
	local var_2_0 = getProxy(PlayerProxy):getRawData().id
	local var_2_1 = PlayerPrefs.GetString("SkinDiscountItemTip" .. var_2_0, "")

	if var_2_1 == "" then
		return not var_0_0.TipFlag
	end

	if pg.TimeMgr.GetInstance():GetServerTime() < tonumber(var_2_1) then
		return false
	else
		return not var_0_0.TipFlag
	end
end

function var_0_0.DisplayResults(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0:Display(MainSkinDiscountItemTipDisplayPage, arg_3_1, arg_3_2)
end

function var_0_0.InTime(arg_4_0, arg_4_1)
	if type(arg_4_1) == "table" then
		local var_4_0 = arg_4_1[2]
		local var_4_1 = pg.TimeMgr.GetInstance():parseTimeFromConfig(var_4_0)
		local var_4_2 = var_4_1 - 86400
		local var_4_3 = pg.TimeMgr.GetInstance():GetServerTime()

		return var_4_2 <= var_4_3 and var_4_3 < var_4_1
	end

	return false
end

return var_0_0
