local var_0_0 = class("Story")

var_0_0.MODE_ASIDE = 1
var_0_0.MODE_DIALOGUE = 2
var_0_0.MODE_BG = 3
var_0_0.MODE_CAROUSE = 4
var_0_0.MODE_VEDIO = 5
var_0_0.MODE_CAST = 6
var_0_0.MODE_SPANIM = 7
var_0_0.MODE_BLINK = 8
var_0_0.STORY_AUTO_SPEED = {
	-9,
	0,
	5,
	9
}
var_0_0.TRIGGER_DELAY_TIME = {
	4,
	3,
	1.5,
	0
}

function var_0_0.GetStoryStepCls(arg_1_0)
	return ({
		AsideStep,
		DialogueStep,
		BgStep,
		CarouselStep,
		VedioStep,
		CastStep,
		SpAnimStep,
		BlinkStep
	})[arg_1_0]
end

var_0_0.PLAYER = 2
var_0_0.TB = 4
var_0_0.DORM = 8
var_0_0.PlaceholderMap = {
	playername = var_0_0.PLAYER,
	tb = var_0_0.TB,
	dorm3d = var_0_0.DORM
}

function var_0_0.Ctor(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4, arg_2_5)
	arg_2_0.name = arg_2_1.id
	arg_2_0.mode = arg_2_1.mode
	arg_2_0.once = arg_2_1.once
	arg_2_0.fadeOut = arg_2_1.fadeOut
	arg_2_0.hideSkip = defaultValue(arg_2_1.hideSkip, false)
	arg_2_0.skipTip = defaultValue(arg_2_1.skipTip, true)
	arg_2_0.noWaitFade = defaultValue(arg_2_1.noWaitFade, false)
	arg_2_0.dialogueBox = arg_2_1.dialogbox or 1
	arg_2_0.defaultTb = arg_2_1.defaultTb
	arg_2_0.placeholder = 0

	for iter_2_0, iter_2_1 in ipairs(arg_2_1.placeholder or {}) do
		local var_2_0 = var_0_0.PlaceholderMap[iter_2_1] or 0

		warning(var_2_0)
		assert(var_2_0 > 0, iter_2_1)

		arg_2_0.placeholder = bit.bor(arg_2_0.placeholder, var_2_0)
	end

	arg_2_0.hideRecord = defaultValue(arg_2_1.hideRecord, false)
	arg_2_0.hideAutoBtn = defaultValue(arg_2_1.hideAuto, false)
	arg_2_0.storyAlpha = defaultValue(arg_2_1.alpha, 0.568)

	if UnGamePlayState then
		arg_2_0.speedData = arg_2_1.speed or 0
	else
		arg_2_0.speedData = arg_2_1.speed or getProxy(SettingsProxy):GetStorySpeed() or 0
	end

	arg_2_0.steps = {}

	local var_2_1 = 0
	local var_2_2 = arg_2_3 or {}
	local var_2_3 = {}

	for iter_2_2, iter_2_3 in ipairs(arg_2_1.scripts or {}) do
		local var_2_4 = iter_2_3.mode or arg_2_0.mode
		local var_2_5 = var_0_0.GetStoryStepCls(var_2_4).New(iter_2_3)

		if var_2_5:IsDialogueMode() and arg_2_0:IsDialogueStyle2() then
			var_2_5:SetDefaultSide()
		end

		var_2_5:SetId(iter_2_2)
		var_2_5:SetPlaceholderType(arg_2_0:GetPlaceholder())
		var_2_5:SetDefaultTb(arg_2_0.defaultTb)

		if var_2_5:ExistOption() then
			var_2_1 = var_2_1 + 1

			var_2_5:SetOptionIndex(var_2_1)

			if var_2_2[var_2_1] then
				var_2_5:SetOptionSelCodes(var_2_2[var_2_1])
			end

			if arg_2_4 then
				var_2_5.important = true
			end

			table.insert(var_2_3, iter_2_2)

			if arg_2_5 then
				var_2_5:AutoShowOption()
			end
		end

		table.insert(arg_2_0.steps, var_2_5)
	end

	if #arg_2_0.steps > 0 then
		table.insert(var_2_3, #arg_2_0.steps)
	end

	arg_2_0:HandleRecallOptions(var_2_3)

	arg_2_0.branchCode = nil
	arg_2_0.force = arg_2_2

	if UnGamePlayState then
		arg_2_0.isPlayed = false
	else
		arg_2_0.isPlayed = pg.NewStoryMgr:GetInstance():IsPlayed(arg_2_0.name)
	end

	arg_2_0.nextScriptName = nil
	arg_2_0.skipAll = false
	arg_2_0.isAuto = false
	arg_2_0.speed = 0
end

function var_0_0.HandleRecallOptions(arg_3_0, arg_3_1)
	local function var_3_0(arg_4_0, arg_4_1)
		local var_4_0 = arg_3_0.steps[arg_4_0]
		local var_4_1 = {}

		for iter_4_0 = arg_4_0, arg_4_1 do
			local var_4_2 = arg_3_0.steps[iter_4_0]

			table.insert(var_4_1, var_4_2)
		end

		local var_4_3 = var_4_0:GetOptionCnt()

		return {
			var_4_1,
			var_4_3,
			arg_4_1,
			arg_4_0
		}
	end

	local function var_3_1(arg_5_0)
		for iter_5_0 = arg_5_0, 1, -1 do
			local var_5_0 = arg_3_0.steps[iter_5_0]

			if var_5_0 and var_5_0.branchCode ~= nil then
				return iter_5_0
			end
		end

		assert(false)
	end

	local var_3_2 = {}

	for iter_3_0, iter_3_1 in ipairs(arg_3_1) do
		if arg_3_0.steps[iter_3_1]:IsRecallOption() then
			local var_3_3 = iter_3_1
			local var_3_4 = arg_3_1[iter_3_0 + 1]

			if var_3_3 and var_3_4 then
				local var_3_5 = var_3_1(var_3_4)

				table.insert(var_3_2, var_3_0(var_3_3, var_3_5))
			end
		end
	end

	local var_3_6 = 0

	for iter_3_2, iter_3_3 in ipairs(var_3_2) do
		local var_3_7 = iter_3_3[1]
		local var_3_8 = iter_3_3[2]
		local var_3_9 = iter_3_3[3]
		local var_3_10 = iter_3_3[4]

		for iter_3_4 = 1, var_3_8 - 1 do
			local var_3_11 = var_3_9 + var_3_6

			for iter_3_5, iter_3_6 in ipairs(var_3_7) do
				local var_3_12 = Clone(iter_3_6)

				var_3_12:SetId(var_3_10)
				table.insert(arg_3_0.steps, var_3_11 + iter_3_5, var_3_12)
			end
		end

		var_3_6 = var_3_6 + (var_3_8 - 1) * #var_3_7
	end
end

function var_0_0.GetPlaceholder(arg_6_0)
	return arg_6_0.placeholder
end

function var_0_0.ShouldReplaceContent(arg_7_0)
	return arg_7_0.placeholder > 0
end

function var_0_0.GetStoryAlpha(arg_8_0)
	return arg_8_0.storyAlpha
end

function var_0_0.ShouldHideAutoBtn(arg_9_0)
	return arg_9_0.hideAutoBtn
end

function var_0_0.ShouldHideRecord(arg_10_0)
	return arg_10_0.hideRecord
end

function var_0_0.GetDialogueStyleName(arg_11_0)
	return arg_11_0.dialogueBox
end

function var_0_0.IsDialogueStyle2(arg_12_0)
	return arg_12_0:GetDialogueStyleName() == 2
end

function var_0_0.GetAnimPrefix(arg_13_0)
	return switch(arg_13_0:GetDialogueStyleName(), {
		function()
			return "anim_storydialogue_optiontpl_"
		end,
		function()
			return "anim_newstory_dialogue2_"
		end
	})
end

function var_0_0.GetTriggerDelayTime(arg_16_0)
	local var_16_0 = table.indexof(var_0_0.STORY_AUTO_SPEED, arg_16_0.speed)

	if var_16_0 then
		return var_0_0.TRIGGER_DELAY_TIME[var_16_0] or 0
	end

	return 0
end

function var_0_0.SetAutoPlay(arg_17_0)
	arg_17_0.isAuto = true

	arg_17_0:SetPlaySpeed(arg_17_0.speedData)
end

function var_0_0.UpdatePlaySpeed(arg_18_0)
	local var_18_0 = getProxy(SettingsProxy):GetStorySpeed() or 0

	arg_18_0:SetPlaySpeed(var_18_0)
end

function var_0_0.GetPlaySpeed(arg_19_0)
	return arg_19_0.speed
end

function var_0_0.StopAutoPlay(arg_20_0)
	arg_20_0.isAuto = false

	arg_20_0:ResetSpeed()
end

function var_0_0.SetPlaySpeed(arg_21_0, arg_21_1)
	arg_21_0.speed = arg_21_1
end

function var_0_0.ResetSpeed(arg_22_0)
	arg_22_0.speed = 0
end

function var_0_0.GetPlaySpeed(arg_23_0)
	return arg_23_0.speed
end

function var_0_0.GetAutoPlayFlag(arg_24_0)
	return arg_24_0.isAuto
end

function var_0_0.ShowSkipTip(arg_25_0)
	return arg_25_0.skipTip
end

function var_0_0.ShouldWaitFadeout(arg_26_0)
	return not arg_26_0.noWaitFade
end

function var_0_0.ShouldHideSkip(arg_27_0)
	return arg_27_0.hideSkip
end

function var_0_0.CanPlay(arg_28_0)
	return arg_28_0.force or not arg_28_0.isPlayed
end

function var_0_0.GetId(arg_29_0)
	return arg_29_0.name
end

function var_0_0.GetName(arg_30_0)
	return arg_30_0.name
end

function var_0_0.GetStepByIndex(arg_31_0, arg_31_1)
	local var_31_0 = arg_31_0.steps[arg_31_1]

	if not var_31_0 or arg_31_0.branchCode and not var_31_0:IsSameBranch(arg_31_0.branchCode) then
		return nil
	end

	return var_31_0
end

function var_0_0.GetNextStep(arg_32_0, arg_32_1)
	if arg_32_1 >= #arg_32_0.steps then
		return nil
	end

	local var_32_0 = arg_32_1 + 1
	local var_32_1 = arg_32_0:GetStepByIndex(var_32_0)

	if not var_32_1 and var_32_0 < #arg_32_0.steps then
		return arg_32_0:GetNextStep(var_32_0)
	else
		return var_32_1
	end
end

function var_0_0.GetPrevStep(arg_33_0, arg_33_1)
	if arg_33_1 <= 1 then
		return nil
	end

	local var_33_0 = arg_33_1 - 1
	local var_33_1 = arg_33_0:GetStepByIndex(var_33_0)

	if not var_33_1 and var_33_0 > 1 then
		return arg_33_0:GetPrevStep(var_33_0)
	else
		return var_33_1
	end
end

function var_0_0.ShouldFadeout(arg_34_0)
	return arg_34_0.fadeOut ~= nil
end

function var_0_0.GetFadeoutTime(arg_35_0)
	return arg_35_0.fadeOut
end

function var_0_0.IsPlayed(arg_36_0)
	return arg_36_0.isPlayed
end

function var_0_0.SetBranchCode(arg_37_0, arg_37_1)
	arg_37_0.branchCode = arg_37_1
end

function var_0_0.GetBranchCode(arg_38_0)
	return arg_38_0.branchCode
end

function var_0_0.GetNextScriptName(arg_39_0)
	return arg_39_0.nextScriptName
end

function var_0_0.SetNextScriptName(arg_40_0, arg_40_1)
	arg_40_0.nextScriptName = arg_40_1
end

function var_0_0.SkipAll(arg_41_0)
	arg_41_0.skipAll = true
end

function var_0_0.StopSkip(arg_42_0)
	arg_42_0.skipAll = false
end

function var_0_0.ShouldSkipAll(arg_43_0)
	return arg_43_0.skipAll
end

function var_0_0.GetUsingPaintingNames(arg_44_0)
	local var_44_0 = {}

	for iter_44_0, iter_44_1 in ipairs(arg_44_0.steps) do
		local var_44_1 = iter_44_1:GetUsingPaintingNames()

		for iter_44_2, iter_44_3 in ipairs(var_44_1) do
			var_44_0[iter_44_3] = true
		end
	end

	local var_44_2 = {}

	for iter_44_4, iter_44_5 in pairs(var_44_0) do
		table.insert(var_44_2, iter_44_4)
	end

	return var_44_2
end

function var_0_0.GetAllStepDispatcherRecallName(arg_45_0)
	local var_45_0 = {}

	for iter_45_0, iter_45_1 in ipairs(arg_45_0.steps) do
		local var_45_1 = iter_45_1:GetDispatcherRecallName()

		if var_45_1 then
			var_45_0[var_45_1] = true
		end
	end

	local var_45_2 = {}

	for iter_45_2, iter_45_3 in pairs(var_45_0) do
		table.insert(var_45_2, iter_45_2)
	end

	return var_45_2
end

return var_0_0
