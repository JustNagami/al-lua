local var_0_0 = class("NewEducateFSM")

var_0_0.STYSTEM = {
	PLAN = 5,
	MIND = 9,
	TALENT = 2,
	ASSESS = 6,
	MAP = 4,
	INIT = 0,
	ENDING = 8,
	PHASE = 7,
	TOPIC = 3,
	EVENT = 1
}

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.stystemNo = arg_1_2.system_no
	arg_1_0.curNode = arg_1_2.current_node or 0

	local var_1_0 = arg_1_2.cache[1]

	arg_1_0.states = {}
	arg_1_0.states[var_0_0.STYSTEM.INIT] = NewEducateStateBase.New()
	arg_1_0.states[var_0_0.STYSTEM.EVENT] = NewEducateStateBase.New()

	if #var_1_0.cache_talent > 0 then
		arg_1_0.states[var_0_0.STYSTEM.TALENT] = NewEducateTalentState.New(var_1_0.cache_talent[1])
	end

	if #var_1_0.cache_chat > 0 then
		arg_1_0.states[var_0_0.STYSTEM.TOPIC] = NewEducateTopicState.New(var_1_0.cache_chat[1])
	end

	if #var_1_0.cache_site > 0 then
		arg_1_0.states[var_0_0.STYSTEM.MAP] = NewEducateMapState.New(arg_1_1, var_1_0.cache_site[1])
	end

	arg_1_0.states[var_0_0.STYSTEM.PLAN] = NewEducatePlanState.New(#var_1_0.cache_plan > 0 and var_1_0.cache_plan[1] or {})
	arg_1_0.states[var_0_0.STYSTEM.ASSESS] = NewEducateStateBase.New()
	arg_1_0.states[var_0_0.STYSTEM.PHASE] = NewEducateStateBase.New()

	if #var_1_0.cache_end > 0 then
		arg_1_0.states[var_0_0.STYSTEM.ENDING] = NewEducateEndingState.New(var_1_0.cache_end[1])
	end

	if #var_1_0.cache_mind > 0 then
		arg_1_0.states[var_0_0.STYSTEM.MIND] = NewEducateStateBase.New(var_1_0.cache_mind[1])
	end
end

function var_0_0.SetState(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.states[arg_2_1] = arg_2_2
end

function var_0_0.GetCurNode(arg_3_0)
	return arg_3_0.curNode
end

function var_0_0.SetCurNode(arg_4_0, arg_4_1)
	arg_4_0.curNode = arg_4_1
end

function var_0_0.GetStystemNo(arg_5_0)
	return arg_5_0.stystemNo
end

function var_0_0.SetStystemNo(arg_6_0, arg_6_1)
	arg_6_0.stystemNo = arg_6_1
end

function var_0_0.GetState(arg_7_0, arg_7_1)
	return arg_7_0.states[arg_7_1] or nil
end

function var_0_0.GetCurState(arg_8_0)
	return arg_8_0.states[arg_8_0.stystemNo]
end

function var_0_0.CheckStystem(arg_9_0)
	if arg_9_0.curNode ~= 0 then
		return arg_9_0.stystemNo
	end

	if not arg_9_0.states[arg_9_0.stystemNo]:IsFinish() then
		return arg_9_0.stystemNo
	end

	return switch(arg_9_0.stystemNo, {
		[var_0_0.STYSTEM.INIT] = function()
			return var_0_0.STYSTEM.EVENT
		end,
		[var_0_0.STYSTEM.EVENT] = function()
			return var_0_0.STYSTEM.TALENT
		end,
		[var_0_0.STYSTEM.TALENT] = function()
			return var_0_0.STYSTEM.MAP
		end,
		[var_0_0.STYSTEM.TOPIC] = function()
			return var_0_0.STYSTEM.MAP
		end,
		[var_0_0.STYSTEM.MAP] = function()
			return var_0_0.STYSTEM.MAP
		end,
		[var_0_0.STYSTEM.PLAN] = function()
			return var_0_0.STYSTEM.ASSESS
		end,
		[var_0_0.STYSTEM.ASSESS] = function()
			if not getProxy(NewEducateProxy):GetCurChar():GetRoundData():IsEndRound() then
				return var_0_0.STYSTEM.PHASE
			else
				return var_0_0.STYSTEM.ENDING
			end
		end,
		[var_0_0.STYSTEM.PHASE] = function()
			return var_0_0.STYSTEM.EVENT
		end,
		[var_0_0.STYSTEM.ENDING] = function()
			return var_0_0.STYSTEM.ENDING
		end
	}, function()
		return arg_9_0.stystemNo
	end)
end

function var_0_0.Reset(arg_20_0)
	for iter_20_0, iter_20_1 in pairs(arg_20_0.states) do
		iter_20_1:Reset()
	end

	arg_20_0.states[var_0_0.STYSTEM.TALENT] = nil
	arg_20_0.states[var_0_0.STYSTEM.TOPIC] = nil
	arg_20_0.states[var_0_0.STYSTEM.MAP] = nil
	arg_20_0.states[var_0_0.STYSTEM.ENDING] = nil
	arg_20_0.states[var_0_0.STYSTEM.MIND] = nil
end

var_0_0.BENEFIT_PENDING = {
	var_0_0.STYSTEM.PLAN,
	var_0_0.STYSTEM.ASSESS,
	var_0_0.STYSTEM.PHASE
}

function var_0_0.IsImmediateBenefit(arg_21_0)
	return not table.contains(var_0_0.BENEFIT_PENDING, arg_21_0.stystemNo)
end

return var_0_0
