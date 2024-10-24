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
	arg_1_0.dispatcher = arg_1_1.dispatcher
	arg_1_0.shakeTime = defaultValue(arg_1_1.shakeTime, 0)
	arg_1_0.autoShowOption = defaultValue(arg_1_1.autoShowOption, false)
	arg_1_0.selectedBranchCode = 0
	arg_1_0.id = 0
	arg_1_0.placeholderType = 0
	arg_1_0.defaultTb = arg_1_1.defaultTb
	arg_1_0.optionIndex = 0
end

function var_0_0.ShouldShake(arg_2_0)
	return arg_2_0.shakeTime > 0
end

function var_0_0.GetShakeTime(arg_3_0)
	return arg_3_0.shakeTime
end

function var_0_0.SetDefaultTb(arg_4_0, arg_4_1)
	if not arg_4_0.defaultTb or arg_4_0.defaultTb <= 0 then
		arg_4_0.defaultTb = arg_4_1
	end
end

function var_0_0.SetPlaceholderType(arg_5_0, arg_5_1)
	arg_5_0.placeholderType = arg_5_1
end

function var_0_0.ShouldReplacePlayer(arg_6_0)
	return bit.band(arg_6_0.placeholderType, Story.PLAYER) > 0
end

function var_0_0.ShouldReplaceTb(arg_7_0)
	return bit.band(arg_7_0.placeholderType, Story.TB) > 0
end

function var_0_0.ShouldReplaceDorm(arg_8_0)
	return bit.band(arg_8_0.placeholderType, Story.DORM) > 0
end

function var_0_0.ReplacePlayerName(arg_9_0, arg_9_1)
	if not getProxy(PlayerProxy) or not getProxy(PlayerProxy):getRawData() then
		return arg_9_1
	end

	local var_9_0 = getProxy(PlayerProxy):getRawData():GetName()

	arg_9_1 = string.gsub(arg_9_1, "{playername}", var_9_0)

	return arg_9_1
end

function var_0_0.ReplaceTbName(arg_10_0, arg_10_1)
	if pg.NewStoryMgr.GetInstance():IsReView() then
		return string.gsub(arg_10_1, "{tb}", i18n("child_story_name"))
	end

	if not getProxy(EducateProxy) then
		return arg_10_1
	end

	local var_10_0, var_10_1 = getProxy(EducateProxy):GetStoryInfo()

	arg_10_1 = string.gsub(arg_10_1, "{tb}", var_10_1)

	return arg_10_1
end

function var_0_0.ReplaceDormName(arg_11_0, arg_11_1)
	if not arg_11_0.actorName then
		return arg_11_1
	end

	local var_11_0 = getProxy(ApartmentProxy):getApartment(arg_11_0.actorName)
	local var_11_1 = var_11_0 and var_11_0:GetCallName() or arg_11_0.actorName

	arg_11_1 = string.gsub(arg_11_1, "{dorm3d}", var_11_1)

	return arg_11_1
end

function var_0_0.ExistDispatcher(arg_12_0)
	return arg_12_0.dispatcher ~= nil
end

function var_0_0.GetDispatcher(arg_13_0)
	return arg_13_0.dispatcher
end

function var_0_0.IsRecallDispatcher(arg_14_0)
	if not arg_14_0:ExistDispatcher() then
		return false
	end

	local var_14_0 = arg_14_0:GetDispatcher()

	return var_14_0.callbackData ~= nil and var_14_0.callbackData.name ~= nil
end

function var_0_0.GetDispatcherRecallName(arg_15_0)
	if not arg_15_0:IsRecallDispatcher() then
		return nil
	end

	return arg_15_0:GetDispatcher().callbackData.name
end

function var_0_0.ShouldHideUI(arg_16_0)
	if not arg_16_0:IsRecallDispatcher() then
		return false
	end

	return arg_16_0:GetDispatcher().callbackData.hideUI == true
end

function var_0_0.ExistIcon(arg_17_0)
	return arg_17_0.icon ~= nil
end

function var_0_0.GetIconData(arg_18_0)
	return arg_18_0.icon
end

function var_0_0.SetId(arg_19_0, arg_19_1)
	arg_19_0.id = arg_19_1
end

function var_0_0.GetId(arg_20_0)
	return arg_20_0.id
end

function var_0_0.AutoShowOption(arg_21_0)
	arg_21_0.autoShowOption = true
end

function var_0_0.SkipEventForOption(arg_22_0)
	return arg_22_0:ExistOption() and arg_22_0.autoShowOption
end

function var_0_0.IsRecallOption(arg_23_0)
	if arg_23_0:ExistOption() and arg_23_0:GetOptionCnt() > 1 and arg_23_0.recallOption then
		return true
	end

	return false
end

function var_0_0.SetBranchCode(arg_24_0, arg_24_1)
	arg_24_0.selectedBranchCode = arg_24_1
end

function var_0_0.GetSelectedBranchCode(arg_25_0)
	return arg_25_0.selectedBranchCode
end

function var_0_0.ExistLocation(arg_26_0)
	return arg_26_0.location ~= nil
end

function var_0_0.GetLocation(arg_27_0)
	return {
		text = arg_27_0.location[1] or "",
		time = arg_27_0.location[2] or 999
	}
end

function var_0_0.ExistMovableNode(arg_28_0)
	return arg_28_0.movableNode ~= nil and type(arg_28_0.movableNode) == "table" and #arg_28_0.movableNode > 0
end

function var_0_0.GetPathByString(arg_29_0, arg_29_1, arg_29_2)
	local var_29_0 = {}
	local var_29_1 = pg.NewStoryMgr.GetInstance():GetRectSize()
	local var_29_2 = Vector3(-var_29_1.x * 0.5, var_29_1.y * 0.5, 0)
	local var_29_3 = Vector3(var_29_1.x * 0.5, var_29_1.y * 0.5, 0)
	local var_29_4 = Vector3(-var_29_1.x * 0.5, -var_29_1.y * 0.5, 0)
	local var_29_5 = Vector3(var_29_1.x * 0.5, -var_29_1.y * 0.5, 0)
	local var_29_6 = arg_29_2 or 200

	if arg_29_1 == "LTLB" then
		local var_29_7 = Vector3(var_29_6, 0, 0)

		var_29_0 = {
			var_29_2 + var_29_7,
			var_29_4 + var_29_7
		}
	elseif arg_29_1 == "LBLT" then
		local var_29_8 = Vector3(var_29_6, 0, 0)

		var_29_0 = {
			var_29_4 + var_29_8,
			var_29_2 + var_29_8
		}
	elseif arg_29_1 == "LTRT" then
		local var_29_9 = Vector3(0, -var_29_6, 0)

		var_29_0 = {
			var_29_2 + var_29_9,
			var_29_3 + var_29_9
		}
	elseif arg_29_1 == "RTLT" then
		local var_29_10 = Vector3(0, -var_29_6, 0)

		var_29_0 = {
			var_29_3 + var_29_10,
			var_29_2 + var_29_10
		}
	elseif arg_29_1 == "RTRB" then
		local var_29_11 = Vector3(var_29_6, 0, 0)

		var_29_0 = {
			var_29_3 + var_29_11,
			var_29_5 + var_29_11
		}
	elseif arg_29_1 == "RBRT" then
		local var_29_12 = Vector3(var_29_6, 0, 0)

		var_29_0 = {
			var_29_5 + var_29_12,
			var_29_3 + var_29_12
		}
	elseif arg_29_1 == "LBRB" then
		local var_29_13 = Vector3(0, -(arg_29_2 or 0), 0)

		var_29_0 = {
			var_29_4 + var_29_13,
			var_29_5 + var_29_13
		}
	elseif arg_29_1 == "RBLB" then
		local var_29_14 = Vector3(0, -(arg_29_2 or 0), 0)

		var_29_0 = {
			var_29_5 + var_29_14,
			var_29_4 + var_29_14
		}
	end

	return var_29_0
end

function var_0_0.GenMoveNode(arg_30_0, arg_30_1)
	local var_30_0 = {}

	if type(arg_30_1.path) == "table" then
		for iter_30_0, iter_30_1 in ipairs(arg_30_1.path) do
			table.insert(var_30_0, Vector3(iter_30_1[1], iter_30_1[2], 0))
		end
	elseif type(arg_30_1.path) == "string" then
		var_30_0 = arg_30_0:GetPathByString(arg_30_1.path, arg_30_1.offset)
	else
		var_30_0 = arg_30_0:GetPathByString("LTRT")
	end

	local var_30_1 = type(arg_30_1.spine) == "table" or arg_30_1.spine == true
	local var_30_2

	if arg_30_1.spine == true then
		var_30_2 = {
			action = "walk",
			scale = 0.5
		}
	elseif var_30_1 then
		var_30_2 = {
			action = arg_30_1.spine.action or "walk",
			scale = arg_30_1.spine.scale or 0.5
		}
	end

	return {
		name = arg_30_1.name,
		isSpine = var_30_1,
		spineData = var_30_2,
		path = var_30_0,
		time = arg_30_1.time,
		delay = arg_30_1.delay or 0,
		easeType = arg_30_1.easeType or LeanTweenType.linear
	}
end

function var_0_0.GetMovableNode(arg_31_0)
	if not arg_31_0:ExistMovableNode() then
		return {}
	end

	local var_31_0 = {}

	for iter_31_0, iter_31_1 in pairs(arg_31_0.movableNode or {}) do
		local var_31_1 = arg_31_0:GenMoveNode(iter_31_1)

		table.insert(var_31_0, var_31_1)
	end

	return var_31_0
end

function var_0_0.OldPhotoEffect(arg_32_0)
	return arg_32_0.oldPhoto
end

function var_0_0.ShouldBgGlitchArt(arg_33_0)
	return arg_33_0.bgGlitchArt
end

function var_0_0.IsSameBranch(arg_34_0, arg_34_1)
	return not arg_34_0.branchCode or arg_34_0.branchCode == arg_34_1
end

function var_0_0.GetMode(arg_35_0)
	assert(false, "should override this function")
end

function var_0_0.GetFlashoutData(arg_36_0)
	if arg_36_0.flashout then
		local var_36_0 = arg_36_0.flashout.alpha[1]
		local var_36_1 = arg_36_0.flashout.alpha[2]
		local var_36_2 = arg_36_0.flashout.dur
		local var_36_3 = arg_36_0.flashout.black

		return var_36_0, var_36_1, var_36_2, var_36_3
	end
end

function var_0_0.GetFlashinData(arg_37_0)
	if arg_37_0.flashin then
		local var_37_0 = arg_37_0.flashin.alpha[1]
		local var_37_1 = arg_37_0.flashin.alpha[2]
		local var_37_2 = arg_37_0.flashin.dur
		local var_37_3 = arg_37_0.flashin.black
		local var_37_4 = arg_37_0.flashin.delay

		return var_37_0, var_37_1, var_37_2, var_37_3, var_37_4
	end
end

function var_0_0.GetBgColor(arg_38_0)
	return Color.New(arg_38_0.bgColor[1] or 0, arg_38_0.bgColor[2] or 0, arg_38_0.bgColor[3] or 0)
end

function var_0_0.IsBlackBg(arg_39_0)
	return arg_39_0.blackBg
end

function var_0_0.GetBgName(arg_40_0)
	return arg_40_0.bgName
end

function var_0_0.GetBgShadow(arg_41_0)
	return arg_41_0.bgShadow
end

function var_0_0.IsDialogueMode(arg_42_0)
	return arg_42_0:GetMode() == Story.MODE_DIALOGUE
end

function var_0_0.GetBgmData(arg_43_0)
	return arg_43_0.bgm, arg_43_0.bgmDelay, arg_43_0.bgmVolume
end

function var_0_0.ShoulePlayBgm(arg_44_0)
	return arg_44_0.bgm ~= nil
end

function var_0_0.ShouldStopBgm(arg_45_0)
	return arg_45_0.stopbgm
end

function var_0_0.GetEffects(arg_46_0)
	return arg_46_0.effects
end

function var_0_0.ShouldBlink(arg_47_0)
	return arg_47_0.blink ~= nil
end

function var_0_0.GetBlinkData(arg_48_0)
	return arg_48_0.blink
end

function var_0_0.ShouldBlinkWithColor(arg_49_0)
	return arg_49_0.blinkWithColor ~= nil
end

function var_0_0.GetBlinkWithColorData(arg_50_0)
	return arg_50_0.blinkWithColor
end

function var_0_0.ShouldPlaySoundEffect(arg_51_0)
	return arg_51_0.soundeffect ~= nil
end

function var_0_0.GetSoundeffect(arg_52_0)
	return arg_52_0.soundeffect, arg_52_0.seDelay
end

function var_0_0.ShouldPlayVoice(arg_53_0)
	return arg_53_0.voice ~= nil
end

function var_0_0.ShouldStopVoice(arg_54_0)
	return arg_54_0.stopVoice
end

function var_0_0.GetVoice(arg_55_0)
	return arg_55_0.voice, arg_55_0.voiceDelay
end

function var_0_0.ExistOption(arg_56_0)
	return arg_56_0.options ~= nil and #arg_56_0.options > 0
end

function var_0_0.GetOptionCnt(arg_57_0)
	if arg_57_0:ExistOption() then
		return #arg_57_0.options
	else
		return 0
	end
end

function var_0_0.SetOptionSelCodes(arg_58_0, arg_58_1)
	arg_58_0.optionSelCode = arg_58_1
end

function var_0_0.IsBlackFrontGround(arg_59_0)
	return arg_59_0.blackFg > 0, Mathf.Clamp01(arg_59_0.blackFg)
end

function var_0_0.GetOptionIndexByAutoSel(arg_60_0)
	local var_60_0 = 0
	local var_60_1 = 0

	for iter_60_0, iter_60_1 in ipairs(arg_60_0.options) do
		if arg_60_0.optionSelCode and iter_60_1.flag == arg_60_0.optionSelCode then
			var_60_0 = iter_60_0

			break
		end

		if iter_60_1.autochoice and iter_60_1.autochoice == 1 then
			var_60_1 = iter_60_0
		end
	end

	if var_60_0 > 0 then
		return var_60_0
	end

	if var_60_1 > 0 then
		return var_60_1
	end

	return nil
end

function var_0_0.IsImport(arg_61_0)
	return arg_61_0.important
end

function var_0_0.SetOptionIndex(arg_62_0, arg_62_1)
	arg_62_0.optionIndex = arg_62_1
end

function var_0_0.GetOptionIndex(arg_63_0)
	return arg_63_0.optionIndex
end

function var_0_0.GetOptions(arg_64_0)
	return _.map(arg_64_0.options or {}, function(arg_65_0)
		local var_65_0 = arg_65_0.content

		if arg_64_0:ShouldReplacePlayer() then
			var_65_0 = arg_64_0:ReplacePlayerName(var_65_0)
		end

		if arg_64_0:ShouldReplaceTb() then
			var_65_0 = arg_64_0:ReplaceTbName(var_65_0)
		end

		if arg_64_0:ShouldReplaceDorm() then
			var_65_0 = arg_64_0:ReplaceDormName(var_65_0)
		end

		local var_65_1 = HXSet.hxLan(var_65_0)

		return {
			var_65_1,
			arg_65_0.flag
		}
	end)
end

function var_0_0.ShouldJumpToNextScript(arg_66_0)
	return arg_66_0.nextScriptName ~= nil
end

function var_0_0.GetNextScriptName(arg_67_0)
	return arg_67_0.nextScriptName
end

function var_0_0.ShouldDelayEvent(arg_68_0)
	return arg_68_0.eventDelay and arg_68_0.eventDelay > 0
end

function var_0_0.GetEventDelayTime(arg_69_0)
	return arg_69_0.eventDelay
end

function var_0_0.GetUsingPaintingNames(arg_70_0)
	return {}
end

return var_0_0
