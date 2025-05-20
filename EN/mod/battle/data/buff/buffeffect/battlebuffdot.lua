ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleAttr
local var_0_2 = var_0_0.Battle.BattleFormulas
local var_0_3 = var_0_0.Battle.BattleConfig

var_0_0.Battle.BattleBuffDOT = class("BattleBuffDOT", var_0_0.Battle.BattleBuffEffect)
var_0_0.Battle.BattleBuffDOT.__name = "BattleBuffDOT"

local var_0_4 = var_0_0.Battle.BattleBuffDOT

var_0_4.FX_TYPE = var_0_0.Battle.BattleBuffEffect.FX_TYPE_DOT

function var_0_4.Ctor(arg_1_0, arg_1_1)
	var_0_4.super.Ctor(arg_1_0, arg_1_1)
end

function var_0_4.GetEffectType(arg_2_0)
	return var_0_0.Battle.BattleBuffEffect.FX_TYPE_DOT
end

function var_0_4.SetArgs(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0._number = arg_3_0._tempData.arg_list.number or 0
	arg_3_0._time = arg_3_0._tempData.arg_list.time or 0
	arg_3_0._nextEffectTime = pg.TimeMgr.GetInstance():GetCombatTime() + arg_3_0._time
	arg_3_0._maxHPRatio = arg_3_0._tempData.arg_list.maxHPRatio or 0
	arg_3_0._currentHPRatio = arg_3_0._tempData.arg_list.currentHPRatio or 0
	arg_3_0._minRestHPRatio = arg_3_0._tempData.arg_list.minRestHPRatio or 0
	arg_3_0._randExtraRange = arg_3_0._tempData.arg_list.randExtraRange or 0
	arg_3_0._cloakExpose = arg_3_0._tempData.arg_list.cloakExpose or 0
	arg_3_0._exposeGroup = arg_3_0._tempData.arg_list._exposeGroup or arg_3_2:GetID()
	arg_3_0._level = arg_3_0._level or 0
	arg_3_0._metaDot = arg_3_0._tempData.arg_list.metaDot

	local var_3_0 = 0

	if not arg_3_0._metaDot then
		var_3_0 = var_0_2.CaclulateDOTDuration(arg_3_0._tempData, arg_3_0._orb, arg_3_1)
	end

	arg_3_2:SetOrbDuration(var_3_0)

	if arg_3_0._tempData.arg_list.WorldBossDotDamage then
		local var_3_1 = arg_3_0._tempData.arg_list.WorldBossDotDamage

		arg_3_0._igniteDMG = (var_0_0.Battle.BattleDataProxy.GetInstance():GetInitData()[var_3_1.useGlobalAttr] or pg.bfConsts.NUM0) * (var_3_1.paramA or pg.bfConsts.NUM1)
	elseif arg_3_0._orb then
		arg_3_0._igniteAttr = arg_3_0._tempData.arg_list.attr
		arg_3_0._igniteCoefficient = arg_3_0._tempData.arg_list.k
		arg_3_0._igniteDMG = var_0_2.CalculateIgniteDamage(arg_3_0._orb, arg_3_0._igniteAttr, arg_3_0._igniteCoefficient)
	elseif arg_3_0._infection then
		arg_3_0._igniteDMG = arg_3_0._infection
	else
		arg_3_0._igniteDMG = 0
	end

	if arg_3_0._cloakExpose and arg_3_0._cloakExpose > 0 then
		arg_3_1:CloakExpose(arg_3_0._cloakExpose)
	end

	arg_3_0._infective = arg_3_0._tempData.arg_list.infective
	arg_3_0._proxy = var_0_0.Battle.BattleDataProxy.GetInstance()
end

function var_0_4.onStack(arg_4_0, arg_4_1, arg_4_2)
	return
end

function var_0_4.onUpdate(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	if arg_5_3.timeStamp >= arg_5_0._nextEffectTime then
		arg_5_0:doDamage(arg_5_1, arg_5_2)

		if arg_5_1:IsAlive() then
			arg_5_0._nextEffectTime = arg_5_0._nextEffectTime + arg_5_0._time
		end
	end
end

function var_0_4.onSink(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	arg_6_0:handleInfect(arg_6_1, arg_6_2)
end

function var_0_4.onRemove(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0:doDamage(arg_7_1, arg_7_2)
end

function var_0_4.doDamage(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = arg_8_1:IsAlive()
	local var_8_1 = arg_8_0:CalcNumber(arg_8_1, arg_8_2)

	arg_8_0._proxy:HandleDirectDamage(arg_8_1, var_8_1)

	if not arg_8_1:IsAlive() and var_8_0 then
		arg_8_0:handleInfect(arg_8_1, arg_8_2)
	end
end

function var_0_4.handleInfect(arg_9_0, arg_9_1, arg_9_2)
	if not arg_9_0._infective then
		return
	end

	local var_9_0 = arg_9_0._infective.target_choise
	local var_9_1 = arg_9_0._infective.arg_list
	local var_9_2 = arg_9_0:getTargetList(arg_9_1, var_9_0, var_9_1, {})

	for iter_9_0, iter_9_1 in ipairs(var_9_2) do
		local var_9_3 = var_0_0.Battle.BattleBuffUnit.New(arg_9_2:GetID(), arg_9_2:GetLv())

		var_9_3:SetInfection(arg_9_0._igniteDMG)
		iter_9_1:AddBuff(var_9_3)
	end
end

function var_0_4.CalcNumber(arg_10_0, arg_10_1, arg_10_2)
	if arg_10_0._metaDot then
		local var_10_0 = var_0_0.Battle.BattleDataProxy.GetInstance():GetInitData()

		return (var_0_2.CaclulateMetaDotaDamage(var_10_0.bossConfigId, var_10_0.bossLevel))
	else
		local var_10_1 = var_0_2.CaclulateDOTDamageEnhanceRate(arg_10_0._tempData, arg_10_0._orb, arg_10_1)
		local var_10_2, var_10_3 = arg_10_1:GetHP()
		local var_10_4 = var_10_2 * arg_10_0._currentHPRatio + var_10_3 * arg_10_0._maxHPRatio + arg_10_0._number + arg_10_0._igniteDMG

		if arg_10_0._randExtraRange > 0 then
			var_10_4 = var_10_4 + math.random(0, arg_10_0._randExtraRange)
		end

		local var_10_5 = var_10_4 * (1 + var_10_1)

		return math.max(0, math.floor(math.min(var_10_2 - var_10_3 * arg_10_0._minRestHPRatio, var_10_5 * arg_10_2._stack * var_0_1.GetCurrent(arg_10_1, "repressReduce"))))
	end
end

function var_0_4.SetOrb(arg_11_0, arg_11_1, arg_11_2, arg_11_3)
	arg_11_0._orb = arg_11_2
	arg_11_0._level = arg_11_3

	arg_11_1:SetOrbLevel(arg_11_0._level)
end

function var_0_4.SetInfection(arg_12_0, arg_12_1)
	arg_12_0._infection = arg_12_1
end

function var_0_4.UpdateCloakLock(arg_13_0)
	local var_13_0 = arg_13_0:GetBuffList()
	local var_13_1 = 0
	local var_13_2 = {}

	for iter_13_0, iter_13_1 in pairs(var_13_0) do
		for iter_13_2, iter_13_3 in ipairs(iter_13_1._effectList) do
			if iter_13_3:GetEffectType() == var_0_4.FX_TYPE then
				local var_13_3 = iter_13_3._cloakExpose
				local var_13_4 = iter_13_3._exposeGroup
				local var_13_5 = var_13_2[var_13_4] or 0

				if var_13_5 < var_13_3 then
					var_13_1 = var_13_1 + var_13_3 - var_13_5
					var_13_5 = var_13_3
				end

				var_13_2[var_13_4] = var_13_5
			end
		end
	end

	arg_13_0:CloakOnFire(var_13_1)
end
