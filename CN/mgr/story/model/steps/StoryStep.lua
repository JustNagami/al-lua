local var_0_0 = class("StoryStep")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.flashout = arg_1_1.flashout
	arg_1_0.flashin = arg_1_1.flashin
	arg_1_0.bgName = arg_1_1.bgName
	arg_1_0.bgShadow = arg_1_1.bgShadow
	arg_1_0.blackBg = arg_1_1.blackBg
	arg_1_0.blackFg = arg_1_1.blackFg or 0
	arg_1_0.bgGlitchArt = arg_1_1.bgNoise
	arg_1_0.oldPhoto = arg_1_1.oldPhoto
	arg_1_0.bgm = arg_1_1.bgm
	arg_1_0.bgmDelay = arg_1_1.bgmDelay or 0
	arg_1_0.bgmVolume = arg_1_1.bgmVolume or -1
	arg_1_0.stopbgm = arg_1_1.stopbgm
	arg_1_0.effects = arg_1_1.effects or {}
	arg_1_0.blink = arg_1_1.flash
	arg_1_0.blinkWithColor = arg_1_1.flashN
	arg_1_0.soundeffect = arg_1_1.soundeffect
	arg_1_0.seDelay = arg_1_1.seDelay or 0
	arg_1_0.voice = arg_1_1.voice
	arg_1_0.voiceDelay = arg_1_1.voiceDelay or 0
	arg_1_0.stopVoice = defaultValue(arg_1_1.stopVoice, false)
	arg_1_0.movableNode = arg_1_1.movableNode
	arg_1_0.options = arg_1_1.options
	arg_1_0.important = arg_1_1.important
	arg_1_0.branchCode = arg_1_1.optionFlag
	arg_1_0.recallOption = arg_1_1.recallOption
	arg_1_0.nextScriptName = arg_1_1.jumpto
	arg_1_0.eventDelay = arg_1_1.eventDelay or 0
	arg_1_0.bgColor = arg_1_1.bgColor or {
		0,
		0,
		0
	}
	arg_1_0.location = arg_1_1.location
	arg_1_0.icon = arg_1_1.icon
	arg_1_0.autoShowOption = defaultValue(arg_1_1.autoShowOption, false)
	arg_1_0.dispatcher = arg_1_1.dispatcher
	arg_1_0.selectedBranchCode = 0
	arg_1_0.id = 0
	arg_1_0.placeholderType = 0
	arg_1_0.defaultTb = arg_1_1.defaultTb
end

function var_0_0.SetDefaultTb(arg_2_0, arg_2_1)
	if not arg_2_0.defaultTb or arg_2_0.defaultTb <= 0 then
		arg_2_0.defaultTb = arg_2_1
	end
end

function var_0_0.SetPlaceholderType(arg_3_0, arg_3_1)
	arg_3_0.placeholderType = arg_3_1
end

function var_0_0.ShouldReplacePlayer(arg_4_0)
	return bit.band(arg_4_0.placeholderType, Story.PLAYER) > 0
end

function var_0_0.ShouldReplaceTb(arg_5_0)
	return bit.band(arg_5_0.placeholderType, Story.TB) > 0
end

function var_0_0.ReplacePlayerName(arg_6_0, arg_6_1)
	if not getProxy(PlayerProxy) or not getProxy(PlayerProxy):getRawData() then
		return arg_6_1
	end

	local var_6_0 = getProxy(PlayerProxy):getRawData():GetName()

	arg_6_1 = string.gsub(arg_6_1, "{playername}", var_6_0)

	return arg_6_1
end

function var_0_0.ReplaceTbName(arg_7_0, arg_7_1)
	if pg.NewStoryMgr.GetInstance():IsReView() then
		return string.gsub(arg_7_1, "{tb}", i18n("child_story_name"))
	end

	if not getProxy(EducateProxy) then
		return arg_7_1
	end

	local var_7_0, var_7_1 = getProxy(EducateProxy):GetStoryInfo()

	arg_7_1 = string.gsub(arg_7_1, "{tb}", var_7_1)

	return arg_7_1
end

function var_0_0.ExistDispatcher(arg_8_0)
	return arg_8_0.dispatcher ~= nil
end

function var_0_0.GetDispatcher(arg_9_0)
	return arg_9_0.dispatcher
end

function var_0_0.IsRecallDispatcher(arg_10_0)
	if not arg_10_0:ExistDispatcher() then
		return false
	end

	local var_10_0 = arg_10_0:GetDispatcher()

	return var_10_0.callbackData ~= nil and var_10_0.callbackData.name ~= nil
end

function var_0_0.GetDispatcherRecallName(arg_11_0)
	if not arg_11_0:IsRecallDispatcher() then
		return nil
	end

	return arg_11_0:GetDispatcher().callbackData.name
end

function var_0_0.ShouldHideUI(arg_12_0)
	if not arg_12_0:IsRecallDispatcher() then
		return false
	end

	return arg_12_0:GetDispatcher().callbackData.hideUI == true
end

function var_0_0.ExistIcon(arg_13_0)
	return arg_13_0.icon ~= nil
end

function var_0_0.GetIconData(arg_14_0)
	return arg_14_0.icon
end

function var_0_0.SetId(arg_15_0, arg_15_1)
	arg_15_0.id = arg_15_1
end

function var_0_0.GetId(arg_16_0)
	return arg_16_0.id
end

function var_0_0.AutoShowOption(arg_17_0)
	arg_17_0.autoShowOption = true
end

function var_0_0.SkipEventForOption(arg_18_0)
	return arg_18_0:ExistOption() and arg_18_0.autoShowOption
end

function var_0_0.IsRecallOption(arg_19_0)
	if arg_19_0:ExistOption() and arg_19_0:GetOptionCnt() > 1 and arg_19_0.recallOption then
		return true
	end

	return false
end

function var_0_0.SetBranchCode(arg_20_0, arg_20_1)
	arg_20_0.selectedBranchCode = arg_20_1
end

function var_0_0.GetSelectedBranchCode(arg_21_0)
	return arg_21_0.selectedBranchCode
end

function var_0_0.ExistLocation(arg_22_0)
	return arg_22_0.location ~= nil
end

function var_0_0.GetLocation(arg_23_0)
	return {
		text = arg_23_0.location[1] or "",
		time = arg_23_0.location[2] or 999
	}
end

function var_0_0.ExistMovableNode(arg_24_0)
	return arg_24_0.movableNode ~= nil and type(arg_24_0.movableNode) == "table" and #arg_24_0.movableNode > 0
end

function var_0_0.GetPathByString(arg_25_0, arg_25_1, arg_25_2)
	local var_25_0 = {}
	local var_25_1 = pg.NewStoryMgr.GetInstance():GetRectSize()
	local var_25_2 = Vector3(-var_25_1.x * 0.5, var_25_1.y * 0.5, 0)
	local var_25_3 = Vector3(var_25_1.x * 0.5, var_25_1.y * 0.5, 0)
	local var_25_4 = Vector3(-var_25_1.x * 0.5, -var_25_1.y * 0.5, 0)
	local var_25_5 = Vector3(var_25_1.x * 0.5, -var_25_1.y * 0.5, 0)
	local var_25_6 = arg_25_2 or 200

	if arg_25_1 == "LTLB" then
		local var_25_7 = Vector3(var_25_6, 0, 0)

		var_25_0 = {
			var_25_2 + var_25_7,
			var_25_4 + var_25_7
		}
	elseif arg_25_1 == "LBLT" then
		local var_25_8 = Vector3(var_25_6, 0, 0)

		var_25_0 = {
			var_25_4 + var_25_8,
			var_25_2 + var_25_8
		}
	elseif arg_25_1 == "LTRT" then
		local var_25_9 = Vector3(0, -var_25_6, 0)

		var_25_0 = {
			var_25_2 + var_25_9,
			var_25_3 + var_25_9
		}
	elseif arg_25_1 == "RTLT" then
		local var_25_10 = Vector3(0, -var_25_6, 0)

		var_25_0 = {
			var_25_3 + var_25_10,
			var_25_2 + var_25_10
		}
	elseif arg_25_1 == "RTRB" then
		local var_25_11 = Vector3(var_25_6, 0, 0)

		var_25_0 = {
			var_25_3 + var_25_11,
			var_25_5 + var_25_11
		}
	elseif arg_25_1 == "RBRT" then
		local var_25_12 = Vector3(var_25_6, 0, 0)

		var_25_0 = {
			var_25_5 + var_25_12,
			var_25_3 + var_25_12
		}
	elseif arg_25_1 == "LBRB" then
		local var_25_13 = Vector3(0, -(arg_25_2 or 0), 0)

		var_25_0 = {
			var_25_4 + var_25_13,
			var_25_5 + var_25_13
		}
	elseif arg_25_1 == "RBLB" then
		local var_25_14 = Vector3(0, -(arg_25_2 or 0), 0)

		var_25_0 = {
			var_25_5 + var_25_14,
			var_25_4 + var_25_14
		}
	end

	return var_25_0
end

function var_0_0.GenMoveNode(arg_26_0, arg_26_1)
	local var_26_0 = {}

	if type(arg_26_1.path) == "table" then
		for iter_26_0, iter_26_1 in ipairs(arg_26_1.path) do
			table.insert(var_26_0, Vector3(iter_26_1[1], iter_26_1[2], 0))
		end
	elseif type(arg_26_1.path) == "string" then
		var_26_0 = arg_26_0:GetPathByString(arg_26_1.path, arg_26_1.offset)
	else
		var_26_0 = arg_26_0:GetPathByString("LTRT")
	end

	local var_26_1 = type(arg_26_1.spine) == "table" or arg_26_1.spine == true
	local var_26_2

	if arg_26_1.spine == true then
		var_26_2 = {
			action = "walk",
			scale = 0.5
		}
	elseif var_26_1 then
		var_26_2 = {
			action = arg_26_1.spine.action or "walk",
			scale = arg_26_1.spine.scale or 0.5
		}
	end

	return {
		name = arg_26_1.name,
		isSpine = var_26_1,
		spineData = var_26_2,
		path = var_26_0,
		time = arg_26_1.time,
		delay = arg_26_1.delay or 0,
		easeType = arg_26_1.easeType or LeanTweenType.linear
	}
end

function var_0_0.GetMovableNode(arg_27_0)
	if not arg_27_0:ExistMovableNode() then
		return {}
	end

	local var_27_0 = {}

	for iter_27_0, iter_27_1 in pairs(arg_27_0.movableNode or {}) do
		local var_27_1 = arg_27_0:GenMoveNode(iter_27_1)

		table.insert(var_27_0, var_27_1)
	end

	return var_27_0
end

function var_0_0.OldPhotoEffect(arg_28_0)
	return arg_28_0.oldPhoto
end

function var_0_0.ShouldBgGlitchArt(arg_29_0)
	return arg_29_0.bgGlitchArt
end

function var_0_0.IsSameBranch(arg_30_0, arg_30_1)
	return not arg_30_0.branchCode or arg_30_0.branchCode == arg_30_1
end

function var_0_0.GetMode(arg_31_0)
	assert(false, "should override this function")
end

function var_0_0.GetFlashoutData(arg_32_0)
	if arg_32_0.flashout then
		local var_32_0 = arg_32_0.flashout.alpha[1]
		local var_32_1 = arg_32_0.flashout.alpha[2]
		local var_32_2 = arg_32_0.flashout.dur
		local var_32_3 = arg_32_0.flashout.black

		return var_32_0, var_32_1, var_32_2, var_32_3
	end
end

function var_0_0.GetFlashinData(arg_33_0)
	if arg_33_0.flashin then
		local var_33_0 = arg_33_0.flashin.alpha[1]
		local var_33_1 = arg_33_0.flashin.alpha[2]
		local var_33_2 = arg_33_0.flashin.dur
		local var_33_3 = arg_33_0.flashin.black
		local var_33_4 = arg_33_0.flashin.delay

		return var_33_0, var_33_1, var_33_2, var_33_3, var_33_4
	end
end

function var_0_0.GetBgColor(arg_34_0)
	return Color.New(arg_34_0.bgColor[1] or 0, arg_34_0.bgColor[2] or 0, arg_34_0.bgColor[3] or 0)
end

function var_0_0.IsBlackBg(arg_35_0)
	return arg_35_0.blackBg
end

function var_0_0.GetBgName(arg_36_0)
	return arg_36_0.bgName
end

function var_0_0.GetBgShadow(arg_37_0)
	return arg_37_0.bgShadow
end

function var_0_0.IsDialogueMode(arg_38_0)
	return arg_38_0:GetMode() == Story.MODE_DIALOGUE
end

function var_0_0.GetBgmData(arg_39_0)
	return arg_39_0.bgm, arg_39_0.bgmDelay, arg_39_0.bgmVolume
end

function var_0_0.ShoulePlayBgm(arg_40_0)
	return arg_40_0.bgm ~= nil
end

function var_0_0.ShouldStopBgm(arg_41_0)
	return arg_41_0.stopbgm
end

function var_0_0.GetEffects(arg_42_0)
	return arg_42_0.effects
end

function var_0_0.ShouldBlink(arg_43_0)
	return arg_43_0.blink ~= nil
end

function var_0_0.GetBlinkData(arg_44_0)
	return arg_44_0.blink
end

function var_0_0.ShouldBlinkWithColor(arg_45_0)
	return arg_45_0.blinkWithColor ~= nil
end

function var_0_0.GetBlinkWithColorData(arg_46_0)
	return arg_46_0.blinkWithColor
end

function var_0_0.ShouldPlaySoundEffect(arg_47_0)
	return arg_47_0.soundeffect ~= nil
end

function var_0_0.GetSoundeffect(arg_48_0)
	return arg_48_0.soundeffect, arg_48_0.seDelay
end

function var_0_0.ShouldPlayVoice(arg_49_0)
	return arg_49_0.voice ~= nil
end

function var_0_0.ShouldStopVoice(arg_50_0)
	return arg_50_0.stopVoice
end

function var_0_0.GetVoice(arg_51_0)
	return arg_51_0.voice, arg_51_0.voiceDelay
end

function var_0_0.ExistOption(arg_52_0)
	return arg_52_0.options ~= nil and #arg_52_0.options > 0
end

function var_0_0.GetOptionCnt(arg_53_0)
	if arg_53_0:ExistOption() then
		return #arg_53_0.options
	else
		return 0
	end
end

function var_0_0.SetOptionSelCodes(arg_54_0, arg_54_1)
	arg_54_0.optionSelCode = arg_54_1
end

function var_0_0.IsBlackFrontGround(arg_55_0)
	return arg_55_0.blackFg > 0, Mathf.Clamp01(arg_55_0.blackFg)
end

function var_0_0.GetOptionIndexByAutoSel(arg_56_0)
	local var_56_0 = 0
	local var_56_1 = 0

	for iter_56_0, iter_56_1 in ipairs(arg_56_0.options) do
		if arg_56_0.optionSelCode and iter_56_1.flag == arg_56_0.optionSelCode then
			var_56_0 = iter_56_0

			break
		end

		if iter_56_1.autochoice and iter_56_1.autochoice == 1 then
			var_56_1 = iter_56_0
		end
	end

	if var_56_0 > 0 then
		return var_56_0
	end

	if var_56_1 > 0 then
		return var_56_1
	end

	return nil
end

function var_0_0.IsImport(arg_57_0)
	return arg_57_0.important
end

function var_0_0.GetOptions(arg_58_0)
	return _.map(arg_58_0.options or {}, function(arg_59_0)
		local var_59_0 = arg_59_0.content

		if arg_58_0:ShouldReplacePlayer() then
			var_59_0 = arg_58_0:ReplacePlayerName(var_59_0)
		end

		if arg_58_0:ShouldReplaceTb() then
			var_59_0 = arg_58_0:ReplaceTbName(var_59_0)
		end

		local var_59_1 = HXSet.hxLan(var_59_0)

		return {
			var_59_1,
			arg_59_0.flag
		}
	end)
end

function var_0_0.ShouldJumpToNextScript(arg_60_0)
	return arg_60_0.nextScriptName ~= nil
end

function var_0_0.GetNextScriptName(arg_61_0)
	return arg_61_0.nextScriptName
end

function var_0_0.ShouldDelayEvent(arg_62_0)
	return arg_62_0.eventDelay and arg_62_0.eventDelay > 0
end

function var_0_0.GetEventDelayTime(arg_63_0)
	return arg_63_0.eventDelay
end

function var_0_0.GetUsingPaintingNames(arg_64_0)
	return {}
end

return var_0_0
