local var_0_0 = class("VoiceChat")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.bgName = arg_1_1.bgName
	arg_1_0.shipGroup = arg_1_1.shipGroup
	arg_1_0.steps = {}

	for iter_1_0, iter_1_1 in ipairs(arg_1_1.scripts or {}) do
		local var_1_0 = VoiceChatStep.New(iter_1_1)

		table.insert(arg_1_0.steps, var_1_0)
	end

	arg_1_0.branchCode = nil
	arg_1_0.skipAll = false
end

function var_0_0.GetBgName(arg_2_0)
	return arg_2_0.bgName
end

function var_0_0.GetShipName(arg_3_0)
	local var_3_0 = ShipGroup.getDefaultShipConfig(arg_3_0.shipGroup)

	assert(var_3_0, "shipGroup not found:" .. arg_3_0.shipGroup)

	return var_3_0.name
end

function var_0_0.MarkSkip(arg_4_0)
	arg_4_0.skipAll = true
end

function var_0_0.IsSkipAll(arg_5_0)
	return arg_5_0.skipAll == true
end

function var_0_0.SetBranchCode(arg_6_0, arg_6_1)
	arg_6_0.branchCode = arg_6_1
end

function var_0_0.GetStepByIndex(arg_7_0, arg_7_1)
	if arg_7_0:IsSkipAll() then
		return nil
	end

	local var_7_0 = arg_7_0.steps[arg_7_1]

	if not var_7_0 or arg_7_0.branchCode and not var_7_0:IsSameBranch(arg_7_0.branchCode) then
		return nil
	end

	return var_7_0
end

return var_0_0
