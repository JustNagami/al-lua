ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleBuffEvent
local var_0_2 = var_0_0.Battle.BattleConst.BuffEffectType
local var_0_3 = var_0_0.Battle.BattleConfig
local var_0_4 = class("BattleBuffUnit")

var_0_0.Battle.BattleBuffUnit = var_0_4
var_0_4.__name = "BattleBuffUnit"
var_0_4.DEFAULT_ANI_FX_CONFIG = {
	effect = "jineng",
	offset = {
		0,
		-2,
		0
	}
}

function var_0_4.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_2 = arg_1_2 or 1
	arg_1_0._id = arg_1_1

	arg_1_0:SetTemplate(arg_1_1, arg_1_2)

	arg_1_0._time = arg_1_0._tempData.time
	arg_1_0._RemoveTime = 0
	arg_1_0._effectList = {}
	arg_1_0._triggerSearchTable = {}
	arg_1_0._level = arg_1_2
	arg_1_0._caster = arg_1_3
	arg_1_0._forceStack = arg_1_0._tempData.force_stack

	for iter_1_0, iter_1_1 in ipairs(arg_1_0._tempData.effect_list) do
		local var_1_0 = var_0_0.Battle[iter_1_1.type].New(iter_1_1)

		arg_1_0._effectList[iter_1_0] = var_1_0

		local var_1_1 = iter_1_1.trigger

		for iter_1_2, iter_1_3 in ipairs(var_1_1) do
			local var_1_2 = arg_1_0._triggerSearchTable[iter_1_3]

			if var_1_2 == nil then
				var_1_2 = {}
				arg_1_0._triggerSearchTable[iter_1_3] = var_1_2
			end

			var_1_2[#var_1_2 + 1] = var_1_0
		end
	end
end

function var_0_4.GetTriggerPriority(arg_2_0, arg_2_1)
	local var_2_0 = var_0_3.TRIGGER_PRIORITY[arg_2_1]
	local var_2_1 = math.huge

	for iter_2_0, iter_2_1 in ipairs(arg_2_0._tempData.effect_list) do
		local var_2_2 = var_2_0[iter_2_1.type] or var_0_3.TRIGGER_PRIORITY_LOWEST

		var_2_1 = math.min(var_2_1, var_2_2)
	end

	return var_2_1
end

function var_0_4.SetTemplate(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0._tempData = var_0_0.Battle.BattleDataFunction.GetBuffTemplate(arg_3_1, arg_3_2)
end

function var_0_4.Attach(arg_4_0, arg_4_1)
	arg_4_0._owner = arg_4_1
	arg_4_0._stack = 1

	arg_4_0:SetArgs(arg_4_1)
	arg_4_0:onTrigger(var_0_2.ON_ATTACH, arg_4_1)
	arg_4_0:SetRemoveTime()
end

function var_0_4.Stack(arg_5_0, arg_5_1)
	arg_5_0._stack = math.min(arg_5_0._stack + 1, arg_5_0._tempData.stack)

	arg_5_0:onTrigger(var_0_2.ON_STACK, arg_5_1)
	arg_5_0:SetRemoveTime()
end

function var_0_4.SetOrb(arg_6_0, arg_6_1, arg_6_2)
	for iter_6_0, iter_6_1 in ipairs(arg_6_0._effectList) do
		iter_6_1:SetOrb(arg_6_0, arg_6_1, arg_6_2)
	end
end

function var_0_4.SetOrbDuration(arg_7_0, arg_7_1)
	arg_7_0._time = arg_7_1 + arg_7_0._time
end

function var_0_4.SetOrbLevel(arg_8_0, arg_8_1)
	arg_8_0._level = arg_8_1
end

function var_0_4.SetCommander(arg_9_0, arg_9_1)
	arg_9_0._commander = arg_9_1

	for iter_9_0, iter_9_1 in ipairs(arg_9_0._effectList) do
		iter_9_1:SetCommander(arg_9_1)
	end
end

function var_0_4.GetEffectList(arg_10_0)
	return arg_10_0._effectList
end

function var_0_4.GetCommander(arg_11_0)
	return arg_11_0._commander
end

function var_0_4.UpdateStack(arg_12_0, arg_12_1, arg_12_2)
	if arg_12_0._stack == arg_12_2 then
		return
	end

	arg_12_0._stack = math.min(arg_12_2, arg_12_0._tempData.stack)

	arg_12_0:onTrigger(var_0_2.ON_STACK, arg_12_1)
	arg_12_0:SetRemoveTime()

	local var_12_0 = {
		unit_id = arg_12_1:GetUniqueID(),
		buff_id = arg_12_0._id,
		stack_count = arg_12_0._stack
	}

	arg_12_1:DispatchEvent(var_0_0.Event.New(var_0_1.BUFF_STACK, var_12_0))
end

function var_0_4.Remove(arg_13_0, arg_13_1)
	local var_13_0 = arg_13_0._owner
	local var_13_1 = arg_13_0._id
	local var_13_2 = {
		unit_id = var_13_0:GetUniqueID(),
		buff_id = var_13_1
	}

	var_13_0:DispatchEvent(var_0_0.Event.New(var_0_1.BUFF_REMOVE, var_13_2))
	arg_13_0:onTrigger(var_0_2.ON_REMOVE, var_13_0)
	arg_13_0:Clear()

	var_13_0:GetBuffList()[var_13_1] = nil
end

function var_0_4.Update(arg_14_0, arg_14_1, arg_14_2)
	if arg_14_0:IsTimeToRemove(arg_14_2) then
		arg_14_0:Remove(arg_14_2)
	else
		arg_14_0:onTrigger(var_0_2.ON_UPDATE, arg_14_1, {
			timeStamp = arg_14_2
		})
	end
end

function var_0_4.SetArgs(arg_15_0, arg_15_1)
	for iter_15_0, iter_15_1 in ipairs(arg_15_0._effectList) do
		iter_15_1:SetCaster(arg_15_0._caster)
		iter_15_1:SetArgs(arg_15_1, arg_15_0)
	end
end

function var_0_4.Trigger(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = arg_16_0:GetBuffList() or {}
	local var_16_1 = {}

	for iter_16_0, iter_16_1 in pairs(var_16_0) do
		local var_16_2 = iter_16_1._triggerSearchTable[arg_16_1]

		if var_16_2 ~= nil and #var_16_2 > 0 then
			var_16_1[#var_16_1 + 1] = iter_16_1
		end
	end

	var_0_4.sortTriggerBuff(var_16_1, arg_16_1)

	for iter_16_2, iter_16_3 in ipairs(var_16_1) do
		iter_16_3:onTrigger(arg_16_1, arg_16_0, arg_16_2)
	end
end

function var_0_4.sortTriggerBuff(arg_17_0, arg_17_1)
	if not var_0_3.TRIGGER_PRIORITY[arg_17_1] then
		return arg_17_0
	end

	local var_17_0 = var_0_3.TRIGGER_PRIORITY[arg_17_1]

	table.sort(arg_17_0, function(arg_18_0, arg_18_1)
		return arg_18_0:GetTriggerPriority(arg_17_1) < arg_18_1:GetTriggerPriority(arg_17_1)
	end)
end

function var_0_4.DisptachSkillFloat(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
	if arg_19_3.trigger == nil or table.contains(arg_19_3.trigger, arg_19_2) then
		local var_19_0

		if arg_19_3.painting and type(arg_19_3.painting) == "string" then
			var_19_0 = arg_19_3
		end

		local var_19_1 = getSkillName(arg_19_3.displayID or arg_19_0._id)

		arg_19_1:DispatchSkillFloat(var_19_1, nil, var_19_0)

		local var_19_2

		if arg_19_3.castCV ~= false then
			var_19_2 = arg_19_3.castCV or "skill"
		end

		local var_19_3 = type(var_19_2)

		if var_19_3 == "string" then
			arg_19_1:DispatchVoice(var_19_2)
		elseif var_19_3 == "table" then
			local var_19_4, var_19_5, var_19_6 = ShipWordHelper.GetWordAndCV(var_19_2.skinID, var_19_2.key)

			pg.CriMgr.GetInstance():PlaySoundEffect_V3(var_19_5)
		end

		local var_19_7 = arg_19_3.aniEffect or var_0_4.DEFAULT_ANI_FX_CONFIG
		local var_19_8 = {
			effect = var_19_7.effect,
			offset = var_19_7.offset
		}

		arg_19_1:DispatchEvent(var_0_0.Event.New(var_0_0.Battle.BattleUnitEvent.ADD_EFFECT, var_19_8))
	end
end

function var_0_4.IsSubmarineSpecial(arg_20_0)
	local var_20_0 = arg_20_0._triggerSearchTable[var_0_0.Battle.BattleConst.BuffEffectType.ON_SUBMARINE_FREE_SPECIAL] or {}

	for iter_20_0, iter_20_1 in ipairs(var_20_0) do
		if iter_20_1:HaveQuota() then
			return true
		end
	end

	return false
end

function var_0_4.onTrigger(arg_21_0, arg_21_1, arg_21_2, arg_21_3)
	local var_21_0 = arg_21_0._triggerSearchTable[arg_21_1]

	if var_21_0 == nil or #var_21_0 == 0 then
		return
	end

	for iter_21_0, iter_21_1 in ipairs(var_21_0) do
		assert(type(iter_21_1[arg_21_1]) == "function", "buff效果的触发名字和触发函数不相符,buff id:>>" .. arg_21_0._id .. "<<, trigger:>>" .. arg_21_1 .. "<<")

		if iter_21_1:HaveQuota() and iter_21_1:IsActive() then
			iter_21_1:NotActive()
			iter_21_1:Trigger(arg_21_1, arg_21_2, arg_21_0, arg_21_3)

			local var_21_1 = iter_21_1:GetPopConfig()

			if var_21_1 then
				arg_21_0:DisptachSkillFloat(arg_21_2, arg_21_1, var_21_1)
			end

			iter_21_1:SetActive()
		end

		if arg_21_0._isCancel then
			break
		end
	end

	if arg_21_0._isCancel then
		arg_21_0._isCancel = nil

		arg_21_0:Remove()
	end
end

function var_0_4.SetRemoveTime(arg_22_0)
	local var_22_0 = pg.TimeMgr.GetInstance():GetCombatTime()

	arg_22_0._buffStartTimeStamp = var_22_0
	arg_22_0._RemoveTime = var_22_0 + arg_22_0._time
	arg_22_0._cancelTime = nil
end

function var_0_4.IsTimeToRemove(arg_23_0, arg_23_1)
	if arg_23_0._isCancel then
		return true
	elseif arg_23_0._cancelTime and arg_23_1 >= arg_23_0._cancelTime then
		return true
	elseif arg_23_0._time == 0 then
		return false
	else
		return arg_23_1 >= arg_23_0._RemoveTime
	end
end

function var_0_4.GetBuffLifeTime(arg_24_0)
	return arg_24_0._time
end

function var_0_4.GetBuffStartTime(arg_25_0)
	return arg_25_0._buffStartTimeStamp
end

function var_0_4.Interrupt(arg_26_0)
	for iter_26_0, iter_26_1 in ipairs(arg_26_0._effectList) do
		iter_26_1:Interrupt()
	end
end

function var_0_4.Clear(arg_27_0)
	for iter_27_0, iter_27_1 in ipairs(arg_27_0._effectList) do
		iter_27_1:Clear()
	end
end

function var_0_4.GetID(arg_28_0)
	return arg_28_0._id
end

function var_0_4.GetCaster(arg_29_0)
	return arg_29_0._caster
end

function var_0_4.GetLv(arg_30_0)
	return arg_30_0._level or 1
end

function var_0_4.GetDuration(arg_31_0)
	return arg_31_0._time
end

function var_0_4.GetStack(arg_32_0)
	return arg_32_0._stack or 1
end

function var_0_4.IsForceStack(arg_33_0)
	return arg_33_0._forceStack
end

function var_0_4.SetToCancel(arg_34_0, arg_34_1)
	if arg_34_1 then
		if not arg_34_0._cancelTime then
			arg_34_0._cancelTime = pg.TimeMgr.GetInstance():GetCombatTime() + arg_34_1
		end
	else
		arg_34_0._isCancel = true
	end
end

function var_0_4.Dispose(arg_35_0)
	arg_35_0._triggerSearchTable = nil
	arg_35_0._commander = nil
end
