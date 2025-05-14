local var_0_0 = class("IslandChatBubblePlayer", import("Mgr.Story.model.animation.StoryAnimtion"))

var_0_0.STATE_NONE = 0
var_0_0.STATE_PLAYING = 1
var_0_0.STATE_STOP = 2

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0)

	arg_1_0._tf = arg_1_1
	arg_1_0.bubblePanel = arg_1_0._tf:Find("bubble")
	arg_1_0.chat3dTpl = arg_1_0._tf:GetComponent(typeof(ItemList)).prefabItem[0]
	arg_1_0.chatTpl = arg_1_0._tf:GetComponent(typeof(ItemList)).prefabItem[1]
	arg_1_0.chatTpls = {}
	arg_1_0.timers = {}
	arg_1_0.state = var_0_0.STATE_NONE
end

function var_0_0.Play(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0:StartAction(arg_2_1)

	local var_2_0 = {}

	for iter_2_0, iter_2_1 in ipairs(arg_2_1.steps) do
		table.insert(var_2_0, function(arg_3_0)
			arg_2_0:StartStep(arg_2_1, iter_2_0, arg_3_0)
		end)
	end

	seriesAsync(var_2_0, function()
		arg_2_0:EndAction()

		if arg_2_2 then
			arg_2_2()
		end
	end)
end

function var_0_0.IsRunning(arg_5_0)
	return arg_5_0.state == var_0_0.STATE_PLAYING
end

function var_0_0.StartAction(arg_6_0, arg_6_1)
	arg_6_0.script = arg_6_1
	arg_6_0.isUseUISpace = arg_6_1:IsUseUISpace()
	arg_6_0.playerUnit = arg_6_1:GetPlayerRole()

	if not arg_6_0.handle then
		arg_6_0.handle = UpdateBeat:CreateListener(arg_6_0.Update, arg_6_0)
	end

	UpdateBeat:AddListener(arg_6_0.handle)

	arg_6_0.state = var_0_0.STATE_PLAYING
end

function var_0_0.StartStep(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	if not arg_7_0:IsRunning() then
		arg_7_3()

		return
	end

	local var_7_0 = arg_7_1:GetStepByIndex(arg_7_2)

	if not var_7_0 then
		arg_7_3()

		return
	end

	seriesAsync({
		function(arg_8_0)
			arg_7_0:UpdateBubble(var_7_0, arg_8_0)
		end,
		function(arg_9_0)
			arg_7_0:WaitForNextOne(var_7_0, arg_9_0)
		end,
		function(arg_10_0)
			arg_7_0:EndStep(var_7_0)
			arg_10_0()
		end
	}, arg_7_3)
end

function var_0_0.UpdateBubble(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = arg_11_1:GetSay()

	if var_11_0 == "" then
		if arg_11_2 then
			arg_11_2()
		end

		return
	end

	if arg_11_0.isUseUISpace then
		arg_11_0:UpdateBubbleByUISpace(arg_11_1, var_11_0)
	else
		arg_11_0:UpdateBubbleByWorldSpace(arg_11_1, var_11_0)
	end

	arg_11_0:PlayCharatorAnimation(arg_11_1)
	arg_11_2()
end

function var_0_0.UpdateBubbleByUISpace(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = arg_12_0:GetChatTpl(arg_12_1:GetUnitId())

	if var_12_0 then
		setText(var_12_0.transform:Find("Text"), arg_12_2)
	end
end

function var_0_0.UpdateChatPosition(arg_13_0)
	for iter_13_0, iter_13_1 in pairs(arg_13_0.chatTpls) do
		local var_13_0 = arg_13_0.script:GetRole(iter_13_0)

		if var_13_0 and not IsNil(var_13_0) then
			local var_13_1 = var_13_0.transform.position + Vector3(0, 2.3, 0)
			local var_13_2 = IslandCalcUtil.IsInViewport(var_13_1)

			setActive(iter_13_1, var_13_2)

			if var_13_2 then
				iter_13_1.transform.localPosition = IslandCalcUtil.WorldPosition2LocalPosition(arg_13_0.bubblePanel, var_13_1)
			end
		end
	end
end

function var_0_0.GetChatTpl(arg_14_0, arg_14_1)
	if not arg_14_0.script:GetRole(arg_14_1) then
		return nil
	end

	local var_14_0 = arg_14_0.chatTpls[arg_14_1] or Object.Instantiate(arg_14_0.chatTpl, arg_14_0.bubblePanel)

	arg_14_0.chatTpls[arg_14_1] = var_14_0

	return var_14_0
end

function var_0_0.UpdateUI(arg_15_0)
	arg_15_0:UpdateChatPosition()
end

function var_0_0.UpdateBubbleByWorldSpace(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = arg_16_0:GetChat3dTpl(arg_16_1:GetUnitId())

	setText(var_16_0.transform:Find("chat/Text"), arg_16_2)
end

function var_0_0.GetChat3dTpl(arg_17_0, arg_17_1)
	local var_17_0 = arg_17_0.script:GetRole(arg_17_1)

	if not var_17_0 then
		return nil
	end

	local var_17_1 = arg_17_0.chatTpls[arg_17_1] or Object.Instantiate(arg_17_0.chat3dTpl, var_17_0.transform)

	var_17_1:GetComponent(typeof(Canvas)).worldCamera = IslandCameraMgr.instance._mainCamera
	arg_17_0.chatTpls[arg_17_1] = var_17_1

	return var_17_1
end

function var_0_0.UpdateWorldSpace(arg_18_0)
	for iter_18_0, iter_18_1 in pairs(arg_18_0.chatTpls) do
		if isActive(iter_18_1) then
			iter_18_1.transform:LookAt(IslandCameraMgr.instance._mainCamera.gameObject.transform.position)

			iter_18_1.transform.eulerAngles = Vector3(0, iter_18_1.transform.eulerAngles.y, 0)
		end
	end
end

function var_0_0.WaitForNextOne(arg_19_0, arg_19_1, arg_19_2)
	local var_19_0 = arg_19_1:GetTime()

	arg_19_0:UnscaleDelayCall(var_19_0, arg_19_2)
end

function var_0_0.PlayCharatorAnimation(arg_20_0, arg_20_1)
	if not arg_20_1:ExistAnimation() then
		return
	end

	local var_20_0 = arg_20_0.script:GetRole(arg_20_1:GetUnitId())

	if not var_20_0 then
		callback()

		return
	end

	local var_20_1 = arg_20_1:GetAnimation()
	local var_20_2 = var_20_0:GetComponent(typeof(Animator))

	if not var_20_2:GetCurrentAnimatorStateInfo(0):IsName(var_20_1) then
		local var_20_3 = Animator.StringToHash(var_20_1)

		var_20_2:CrossFadeInFixedTime(var_20_3, 0.2)
	end
end

function var_0_0.EndStep(arg_21_0, arg_21_1)
	local var_21_0 = arg_21_1:GetUnitId()
	local var_21_1 = arg_21_0.chatTpls[var_21_0]

	if not var_21_1 then
		return
	end

	arg_21_0:RemnoveTimer(var_21_0)

	local var_21_2, var_21_3 = arg_21_1:GetHideType()

	if var_21_2 == BubbleStep.HIDE_TYPE_IMMEDIATELY then
		setActive(var_21_1, false)
	elseif var_21_2 == BubbleStep.HIDE_TYPE_NEVER then
		-- block empty
	elseif var_21_2 == BubbleStep.HIDE_TYPE_TIME then
		local var_21_4 = arg_21_0:CreateDelayTimer(var_21_3, function()
			if not IsNil(var_21_1) then
				setActive(var_21_1, false)
			end
		end)

		arg_21_0.timers[var_21_0] = var_21_4
	end

	arg_21_0:ClearAnimation()
end

function var_0_0.RemnoveTimer(arg_23_0, arg_23_1)
	if arg_23_0.timers[arg_23_1] then
		arg_23_0.timers[arg_23_1]:Stop()

		arg_23_0.timers[arg_23_1] = nil
	end
end

function var_0_0.Update(arg_24_0)
	if arg_24_0.isUseUISpace then
		arg_24_0:UpdateUI()
	else
		arg_24_0:UpdateWorldSpace()
	end
end

function var_0_0.EndAction(arg_25_0)
	if arg_25_0.handle then
		UpdateBeat:RemoveListener(arg_25_0.handle)
	end

	arg_25_0.handle = nil

	for iter_25_0, iter_25_1 in pairs(arg_25_0.timers) do
		iter_25_1:Stop()
	end

	arg_25_0.timers = {}

	for iter_25_2, iter_25_3 in pairs(arg_25_0.chatTpls) do
		if not IsNil(iter_25_3) then
			Object.Destroy(iter_25_3.gameObject)
		end
	end

	arg_25_0.chatTpls = {}
	arg_25_0.script = nil
	arg_25_0.state = var_0_0.STATE_STOP
end

function var_0_0.Stop(arg_26_0)
	arg_26_0:EndAction()
end

return var_0_0
