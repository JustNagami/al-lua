local var_0_0 = class("IslandStory")

var_0_0.MODE_BUBBLE = 9
var_0_0.MODE_DIALOGUE = 10

function var_0_0.GetStoryStepCls(arg_1_0)
	return ({
		[var_0_0.MODE_BUBBLE] = BubbleStep,
		[var_0_0.MODE_DIALOGUE] = Dialogue3DStep
	})[arg_1_0]
end

function var_0_0.Ctor(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	arg_2_0.id = arg_2_1.id
	arg_2_0.unitList = arg_2_2 or {}
	arg_2_0.lockOp = defaultValue(arg_2_1.lockOp, false)
	arg_2_0.unitMap = arg_2_1.map or {}

	assert(arg_2_1.map, "请确保配置文件存在map字段" .. arg_2_1.id)

	arg_2_0.useUISpace = defaultValue(arg_2_1.useUISpace, true)
	arg_2_0.steps = {}

	for iter_2_0, iter_2_1 in ipairs(arg_2_1.scripts or {}) do
		local var_2_0 = var_0_0.GetStoryStepCls(arg_2_3).New(iter_2_1)

		table.insert(arg_2_0.steps, var_2_0)
	end

	for iter_2_2, iter_2_3 in ipairs(arg_2_0.steps) do
		iter_2_3.unitId = arg_2_0:GetUnitIdFromCharaId(iter_2_3.characterId)
	end

	arg_2_0.speedData = arg_2_1.speed or getProxy(SettingsProxy):GetStorySpeed() or 0
	arg_2_0.branchCode = nil
	arg_2_0.isAuto = false
	arg_2_0.speed = 0
	arg_2_0.skipFlag = false
end

function var_0_0.SetAutoPlay(arg_3_0)
	arg_3_0.isAuto = true

	arg_3_0:SetPlaySpeed(arg_3_0.speedData)
end

function var_0_0.StopAutoPlay(arg_4_0)
	arg_4_0.isAuto = false

	arg_4_0:ResetSpeed()
end

function var_0_0.GetAutoPlayFlag(arg_5_0)
	return arg_5_0.isAuto
end

function var_0_0.UpdatePlaySpeed(arg_6_0)
	local var_6_0 = getProxy(SettingsProxy):GetStorySpeed() or 0

	arg_6_0:SetPlaySpeed(var_6_0)
end

function var_0_0.GetPlaySpeed(arg_7_0)
	return arg_7_0.speed
end

function var_0_0.SetPlaySpeed(arg_8_0, arg_8_1)
	arg_8_0.speed = arg_8_1
end

function var_0_0.ResetSpeed(arg_9_0)
	arg_9_0.speed = 0
end

function var_0_0.GetTriggerDelayTime(arg_10_0)
	local var_10_0 = table.indexof(Story.STORY_AUTO_SPEED, arg_10_0.speed)

	if var_10_0 then
		return Story.TRIGGER_DELAY_TIME[var_10_0] or 0
	end

	return 0
end

function var_0_0.IsSkipAll(arg_11_0)
	return arg_11_0.skipFlag == true
end

function var_0_0.MarkSkipAll(arg_12_0)
	arg_12_0.skipFlag = true
end

function var_0_0.GetStepByIndex(arg_13_0, arg_13_1)
	local var_13_0 = arg_13_0.steps[arg_13_1]

	if not var_13_0 or arg_13_0.branchCode and not var_13_0:IsSameBranch(arg_13_0.branchCode) then
		return nil
	end

	return var_13_0
end

function var_0_0.SetBranchCode(arg_14_0, arg_14_1)
	arg_14_0.branchCode = arg_14_1
end

function var_0_0.IsUseUISpace(arg_15_0)
	return arg_15_0.useUISpace
end

function var_0_0.GetUnitIdFromCharaId(arg_16_0, arg_16_1)
	if not arg_16_1 then
		return 0
	end

	for iter_16_0, iter_16_1 in ipairs(arg_16_0.unitMap) do
		local var_16_0 = iter_16_1[1]
		local var_16_1 = iter_16_1[2]

		if var_16_0 == arg_16_1 then
			return var_16_1
		end
	end

	return 0
end

function var_0_0.GetLookGroup(arg_17_0)
	local var_17_0 = {}

	for iter_17_0, iter_17_1 in ipairs(arg_17_0.unitMap) do
		local var_17_1 = arg_17_0:GetRole(iter_17_1[2])

		if var_17_1 then
			table.insert(var_17_0, var_17_1)
		end
	end

	local var_17_2 = arg_17_0:GetPlayerRole()

	if not table.contains(var_17_0, var_17_2) then
		table.insert(var_17_0, var_17_2)
	end

	return var_17_0
end

function var_0_0.GetPlayerRole(arg_18_0)
	for iter_18_0, iter_18_1 in ipairs(arg_18_0.unitList) do
		if isa(iter_18_1, IslandPlayerUnit) then
			return iter_18_1._go
		end
	end

	return nil
end

function var_0_0.GetRole(arg_19_0, arg_19_1)
	if not arg_19_1 or arg_19_1 == 0 then
		return arg_19_0:GetPlayerRole()
	end

	for iter_19_0, iter_19_1 in ipairs(arg_19_0.unitList) do
		if arg_19_1 and iter_19_1.id == arg_19_1 then
			return iter_19_1._go
		end
	end

	return nil
end

function var_0_0.GetUnitList(arg_20_0)
	return arg_20_0.unitList
end

function var_0_0.IsFreeOp(arg_21_0)
	return not arg_21_0.lockOp
end

return var_0_0
