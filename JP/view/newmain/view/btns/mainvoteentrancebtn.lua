local var_0_0 = class("MainVoteEntranceBtn", import(".MainBaseSpcailActBtn"))

function var_0_0.InShowTime(arg_1_0)
	local var_1_0 = getProxy(ActivityProxy):getActivityById(ActivityConst.VOTE_ENTRANCE_ACT_ID)

	return var_1_0 and not var_1_0:isEnd()
end

function var_0_0.GetUIName(arg_2_0)
	return "MainUIVoteActBtn"
end

function var_0_0.OnClick(arg_3_0)
	arg_3_0.event:emit(NewMainMediator.GO_SCENE, SCENE.VOTEENTRANCE)
end

function var_0_0.OnInit(arg_4_0)
	setActive(arg_4_0._tf:Find("tip"), arg_4_0:ShouldTipNewRace() or arg_4_0:ShouldTipVotes() or arg_4_0:ShouldTipAward() or arg_4_0:ShouldTipFinalAward())

	local var_4_0 = getProxy(VoteProxy):IsAllRaceEnd()
	local var_4_1 = arg_4_0:AnyVoteActIsOpening()

	setActive(arg_4_0._tf:Find("unopen"), not var_4_0 and var_4_1)
	setActive(arg_4_0._tf:Find("end"), var_4_0)

	arg_4_0._tf:GetComponent(typeof(Image)).enabled = not var_4_0 and not var_4_1
end

function var_0_0.AnyVoteActIsOpening(arg_5_0)
	return getProxy(VoteProxy):AnyVoteActIsOpening()
end

function var_0_0.ShouldTipFinalAward(arg_6_0)
	local var_6_0 = getProxy(ActivityProxy):getActivityById(ActivityConst.VOTE_ENTRANCE_ACT_ID)

	if not var_6_0 or var_6_0:isEnd() then
		return false
	end

	local var_6_1 = var_6_0:getConfig("config_client")[2] or -1
	local var_6_2 = getProxy(TaskProxy):getTaskById(var_6_1) or getProxy(TaskProxy):getFinishTaskById(var_6_1)

	return var_6_2 and var_6_2:isFinish() and not var_6_2:isReceive()
end

function var_0_0.ShouldTipNewRace(arg_7_0)
	local var_7_0 = getProxy(VoteProxy):GetVoteGroupList()
	local var_7_1 = getProxy(PlayerProxy):getRawData().id

	for iter_7_0, iter_7_1 in ipairs(var_7_0) do
		if iter_7_1 and iter_7_1:IsOpening() and getProxy(VoteProxy):IsNewRace(iter_7_1) then
			return true
		end
	end

	return false
end

function var_0_0.ShouldTipVotes(arg_8_0)
	local var_8_0 = getProxy(VoteProxy):GetVoteGroupList()

	for iter_8_0, iter_8_1 in ipairs(var_8_0) do
		if getProxy(VoteProxy):GetVotesByConfigId(iter_8_1.configId) > 0 then
			return true
		end
	end

	return false
end

function var_0_0.ShouldTipAward(arg_9_0)
	return getProxy(VoteProxy):ExistPastVoteAward()
end

return var_0_0
