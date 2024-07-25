pg = pg or {}

local var_0_0 = singletonClass("NewStoryMgr")

pg.NewStoryMgr = var_0_0

local var_0_1 = 1
local var_0_2 = 2
local var_0_3 = 3
local var_0_4 = 4
local var_0_5 = 5
local var_0_6 = 6
local var_0_7 = 7
local var_0_8 = Color.New(1, 0.8705, 0.4196, 1)
local var_0_9 = Color.New(1, 1, 1, 1)

require("Mgr/Story/Include")

local var_0_10 = true

local function var_0_11(...)
	if var_0_10 and IsUnityEditor then
		originalPrint(...)
	end
end

local var_0_12 = {
	"",
	"JP",
	"KR",
	"US",
	""
}

local function var_0_13(arg_2_0)
	local var_2_0 = var_0_12[PLATFORM_CODE]

	if arg_2_0 == "index" then
		arg_2_0 = arg_2_0 .. var_2_0
	end

	local var_2_1

	if PLATFORM_CODE == PLATFORM_JP then
		var_2_1 = "GameCfg.story" .. var_2_0 .. "." .. arg_2_0
	else
		var_2_1 = "GameCfg.story" .. "." .. arg_2_0
	end

	local var_2_2, var_2_3 = pcall(function()
		return require(var_2_1)
	end)

	if not var_2_2 then
		local var_2_4 = true

		if UnGamePlayState then
			local var_2_5 = "GameCfg.dungeon." .. arg_2_0

			if pcall(function()
				return require(var_2_5)
			end) then
				var_2_4 = false
			end
		end

		if var_2_4 then
			errorMsg("不存在剧情ID对应的Lua:" .. arg_2_0)
		end
	end

	return var_2_2 and var_2_3
end

function var_0_0.SetData(arg_5_0, arg_5_1)
	arg_5_0.playedList = {}

	for iter_5_0, iter_5_1 in ipairs(arg_5_1) do
		local var_5_0 = iter_5_1

		if iter_5_1 == 20008 then
			var_5_0 = 1131
		end

		if iter_5_1 == 20009 then
			var_5_0 = 1132
		end

		if iter_5_1 == 20010 then
			var_5_0 = 1133
		end

		if iter_5_1 == 20011 then
			var_5_0 = 1134
		end

		if iter_5_1 == 20012 then
			var_5_0 = 1135
		end

		if iter_5_1 == 20013 then
			var_5_0 = 1136
		end

		if iter_5_1 == 20014 then
			var_5_0 = 1137
		end

		arg_5_0.playedList[var_5_0] = true
	end
end

function var_0_0.SetPlayedFlag(arg_6_0, arg_6_1)
	var_0_11("Update story id", arg_6_1)

	arg_6_0.playedList[arg_6_1] = true
end

function var_0_0.GetPlayedFlag(arg_7_0, arg_7_1)
	return arg_7_0.playedList[arg_7_1]
end

function var_0_0.IsPlayed(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0, var_8_1 = arg_8_0:StoryName2StoryId(arg_8_1)
	local var_8_2 = arg_8_0:GetPlayedFlag(var_8_0)
	local var_8_3 = true

	if var_8_1 and not arg_8_2 then
		var_8_3 = arg_8_0:GetPlayedFlag(var_8_1)
	end

	return var_8_2 and var_8_3
end

local function var_0_14(arg_9_0)
	local var_9_0 = {}

	for iter_9_0, iter_9_1 in pairs(arg_9_0) do
		var_9_0[iter_9_1] = iter_9_0
	end

	return var_9_0
end

function var_0_0.StoryName2StoryId(arg_10_0, arg_10_1)
	if not var_0_0.indexs then
		var_0_0.indexs = var_0_14(var_0_13("index"))
	end

	if not var_0_0.againIndexs then
		var_0_0.againIndexs = var_0_14(var_0_13("index_again"))
	end

	return var_0_0.indexs[arg_10_1], var_0_0.againIndexs[arg_10_1]
end

function var_0_0.StoryId2StoryName(arg_11_0, arg_11_1)
	if not var_0_0.indexIds then
		var_0_0.indexIds = var_0_13("index")
	end

	if not var_0_0.againIndexIds then
		var_0_0.againIndexIds = var_0_13("index_again")
	end

	return var_0_0.indexIds[arg_11_1], var_0_0.againIndexIds[arg_11_1]
end

function var_0_0.StoryLinkNames(arg_12_0, arg_12_1)
	if not var_0_0.linkNames then
		var_0_0.linkNames = var_0_13("index_link")
	end

	return var_0_0.linkNames[arg_12_1]
end

function var_0_0._GetStoryPaintingsByName(arg_13_0, arg_13_1)
	return arg_13_1:GetUsingPaintingNames()
end

function var_0_0.GetStoryPaintingsByName(arg_14_0, arg_14_1)
	local var_14_0 = var_0_13(arg_14_1)

	if not var_14_0 then
		var_0_11("not exist story file")

		return {}
	end

	local var_14_1 = Story.New(var_14_0, false)

	return arg_14_0:_GetStoryPaintingsByName(var_14_1)
end

function var_0_0.GetStoryPaintingsByNameList(arg_15_0, arg_15_1)
	local var_15_0 = {}
	local var_15_1 = {}

	for iter_15_0, iter_15_1 in ipairs(arg_15_1) do
		for iter_15_2, iter_15_3 in ipairs(arg_15_0:GetStoryPaintingsByName(iter_15_1)) do
			var_15_1[iter_15_3] = true
		end
	end

	for iter_15_4, iter_15_5 in pairs(var_15_1) do
		table.insert(var_15_0, iter_15_4)
	end

	return var_15_0
end

function var_0_0.GetStoryPaintingsById(arg_16_0, arg_16_1)
	return arg_16_0:GetStoryPaintingsByIdList({
		arg_16_1
	})
end

function var_0_0.GetStoryPaintingsByIdList(arg_17_0, arg_17_1)
	local var_17_0 = _.map(arg_17_1, function(arg_18_0)
		return arg_17_0:StoryId2StoryName(arg_18_0)
	end)

	return arg_17_0:GetStoryPaintingsByNameList(var_17_0)
end

function var_0_0.ShouldDownloadRes(arg_19_0, arg_19_1)
	local var_19_0 = arg_19_0:GetStoryPaintingsByName(arg_19_1)

	return _.any(var_19_0, function(arg_20_0)
		return PaintingGroupConst.VerifyPaintingFileName(arg_20_0)
	end)
end

function var_0_0.Init(arg_21_0, arg_21_1)
	arg_21_0.state = var_0_1

	PoolMgr.GetInstance():GetUI("NewStoryUI", true, function(arg_22_0)
		arg_21_0.UIOverlay = GameObject.Find("Overlay/UIOverlay")

		arg_22_0.transform:SetParent(arg_21_0.UIOverlay.transform, false)
		arg_21_0:_Init(arg_22_0, arg_21_1)
	end)
end

function var_0_0._Init(arg_23_0, arg_23_1, arg_23_2)
	arg_23_0.playedList = {}
	arg_23_0.playQueue = {}
	arg_23_0._go = arg_23_1
	arg_23_0._tf = tf(arg_23_0._go)
	arg_23_0.frontTr = findTF(arg_23_0._tf, "front")
	arg_23_0.skipBtn = findTF(arg_23_0._tf, "front/btns/btns/skip_button")
	arg_23_0.autoBtn = findTF(arg_23_0._tf, "front/btns/btns/auto_button")
	arg_23_0.autoBtnImg = findTF(arg_23_0._tf, "front/btns/btns/auto_button/sel"):GetComponent(typeof(Image))
	arg_23_0.alphaImage = arg_23_0._tf:GetComponent(typeof(Image))
	arg_23_0.recordBtn = findTF(arg_23_0._tf, "front/btns/record")
	arg_23_0.dialogueContainer = findTF(arg_23_0._tf, "front/dialogue")
	arg_23_0.players = {
		AsideStoryPlayer.New(arg_23_1),
		DialogueStoryPlayer.New(arg_23_1),
		BgStoryPlayer.New(arg_23_1),
		CarouselPlayer.New(arg_23_1),
		VedioStoryPlayer.New(arg_23_1),
		CastStoryPlayer.New(arg_23_1),
		SpAnimStoryPlayer.New(arg_23_1)
	}
	arg_23_0.setSpeedPanel = StorySetSpeedPanel.New(arg_23_0._tf)
	arg_23_0.recordPanel = NewStoryRecordPanel.New()
	arg_23_0.recorder = StoryRecorder.New()

	setActive(arg_23_0._go, false)

	arg_23_0.state = var_0_2

	if arg_23_2 then
		arg_23_2()
	end
end

function var_0_0.Play(arg_24_0, arg_24_1, arg_24_2, arg_24_3, arg_24_4, arg_24_5, arg_24_6)
	table.insert(arg_24_0.playQueue, {
		arg_24_1,
		arg_24_2
	})

	if #arg_24_0.playQueue == 1 then
		local var_24_0

		local function var_24_1()
			if #arg_24_0.playQueue == 0 then
				return
			end

			local var_25_0 = arg_24_0.playQueue[1][1]
			local var_25_1 = arg_24_0.playQueue[1][2]

			arg_24_0:SoloPlay(var_25_0, function(arg_26_0, arg_26_1)
				if var_25_1 then
					var_25_1(arg_26_0, arg_26_1)
				end

				table.remove(arg_24_0.playQueue, 1)
				var_24_1()
			end, arg_24_3, arg_24_4, arg_24_5, arg_24_6)
		end

		var_24_1()
	end
end

function var_0_0.Puase(arg_27_0)
	if arg_27_0.state ~= var_0_3 then
		var_0_11("state is not 'running'")

		return
	end

	arg_27_0.state = var_0_4

	for iter_27_0, iter_27_1 in ipairs(arg_27_0.players) do
		iter_27_1:Pause()
	end
end

function var_0_0.Resume(arg_28_0)
	if arg_28_0.state ~= var_0_4 then
		var_0_11("state is not 'pause'")

		return
	end

	arg_28_0.state = var_0_3

	for iter_28_0, iter_28_1 in ipairs(arg_28_0.players) do
		iter_28_1:Resume()
	end
end

function var_0_0.Stop(arg_29_0)
	if arg_29_0.state ~= var_0_3 then
		var_0_11("state is not 'running'")

		return
	end

	arg_29_0.state = var_0_5

	for iter_29_0, iter_29_1 in ipairs(arg_29_0.players) do
		iter_29_1:Stop()
	end
end

function var_0_0.PlayForWorld(arg_30_0, arg_30_1, arg_30_2, arg_30_3, arg_30_4, arg_30_5, arg_30_6, arg_30_7)
	arg_30_0.optionSelCodes = arg_30_2 or {}
	arg_30_0.autoPlayFlag = arg_30_6

	arg_30_0:Play(arg_30_1, arg_30_3, arg_30_4, arg_30_5, arg_30_7, true)
end

function var_0_0.ForceAutoPlay(arg_31_0, arg_31_1, arg_31_2, arg_31_3, arg_31_4)
	arg_31_0.autoPlayFlag = true

	local function var_31_0(arg_32_0, arg_32_1)
		arg_31_2(arg_32_0, arg_32_1, arg_31_0.isAutoPlay)
	end

	arg_31_0:Play(arg_31_1, var_31_0, arg_31_3, arg_31_4, true)
end

function var_0_0.ForceManualPlay(arg_33_0, arg_33_1, arg_33_2, arg_33_3, arg_33_4)
	arg_33_0.banPlayFlag = true

	local function var_33_0(arg_34_0, arg_34_1)
		arg_33_2(arg_34_0, arg_34_1, arg_33_0.isAutoPlay)
	end

	arg_33_0:Play(arg_33_1, var_33_0, arg_33_3, arg_33_4, true)
end

function var_0_0.SeriesPlay(arg_35_0, arg_35_1, arg_35_2, arg_35_3, arg_35_4, arg_35_5, arg_35_6)
	local var_35_0 = {}

	for iter_35_0, iter_35_1 in ipairs(arg_35_1) do
		table.insert(var_35_0, function(arg_36_0)
			arg_35_0:SoloPlay(iter_35_1, arg_36_0, arg_35_3, arg_35_4, arg_35_5, arg_35_6)
		end)
	end

	seriesAsync(var_35_0, arg_35_2)
end

function var_0_0.SoloPlay(arg_37_0, arg_37_1, arg_37_2, arg_37_3, arg_37_4, arg_37_5, arg_37_6)
	var_0_11("Play Story:", arg_37_1)

	local var_37_0 = 1

	local function var_37_1(arg_38_0, arg_38_1)
		var_37_0 = var_37_0 - 1

		if arg_37_2 and var_37_0 == 0 then
			onNextTick(function()
				arg_37_2(arg_38_0, arg_38_1)
			end)
		end
	end

	local var_37_2 = var_0_13(arg_37_1)

	if not var_37_2 then
		var_37_1(false)
		var_0_11("not exist story file")

		return nil
	end

	if arg_37_0:IsReView() then
		arg_37_3 = true
	end

	arg_37_0.storyScript = Story.New(var_37_2, arg_37_3, arg_37_0.optionSelCodes, arg_37_5, arg_37_6)

	if not arg_37_0:CheckState() then
		var_0_11("story state error")
		var_37_1(false)

		return nil
	end

	if not arg_37_0.storyScript:CanPlay() then
		var_0_11("story cant be played")
		var_37_1(false)

		return nil
	end

	arg_37_0:ExecuteScript(var_37_1)
end

function var_0_0.ExecuteScript(arg_40_0, arg_40_1)
	seriesAsync({
		function(arg_41_0)
			arg_40_0:CheckResDownload(arg_40_0.storyScript, arg_41_0)
		end,
		function(arg_42_0)
			originalPrint("start load story window...")
			arg_40_0:CheckAndLoadDialogue(arg_40_0.storyScript, arg_42_0)
		end
	}, function()
		originalPrint("enter story...")
		arg_40_0:OnStart()

		local var_43_0 = {}

		arg_40_0.currPlayer = nil
		arg_40_0.progress = 0

		for iter_43_0, iter_43_1 in ipairs(arg_40_0.storyScript.steps) do
			table.insert(var_43_0, function(arg_44_0)
				arg_40_0.progress = iter_43_0

				arg_40_0:SendNotification(GAME.STORY_NEXT)

				local var_44_0 = arg_40_0.players[iter_43_1:GetMode()]

				arg_40_0.currPlayer = var_44_0

				var_44_0:Play(arg_40_0.storyScript, iter_43_0, arg_44_0)
			end)
		end

		seriesAsync(var_43_0, function()
			arg_40_0:OnEnd(arg_40_1)
		end)
	end)
end

function var_0_0.SendNotification(arg_46_0, arg_46_1, arg_46_2)
	pg.m02:sendNotification(arg_46_1, arg_46_2)
end

function var_0_0.CheckResDownload(arg_47_0, arg_47_1, arg_47_2)
	local var_47_0 = arg_47_0:_GetStoryPaintingsByName(arg_47_1)
	local var_47_1 = table.concat(var_47_0, ",")

	originalPrint("start download res " .. var_47_1)

	local var_47_2 = {}

	for iter_47_0, iter_47_1 in ipairs(var_47_0) do
		PaintingGroupConst.AddPaintingNameWithFilteMap(var_47_2, iter_47_1)
	end

	PaintingGroupConst.PaintingDownload({
		isShowBox = true,
		paintingNameList = var_47_2,
		finishFunc = arg_47_2
	})
end

local function var_0_15(arg_48_0, arg_48_1)
	ResourceMgr.Inst:getAssetAsync("ui/" .. arg_48_0, arg_48_0, UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_49_0)
		arg_48_1(arg_49_0)
	end), true, true)
end

function var_0_0.CheckAndLoadDialogue(arg_50_0, arg_50_1, arg_50_2)
	local var_50_0 = arg_50_1:GetDialogueStyleName()

	if not arg_50_0.dialogueContainer:Find(var_50_0) then
		var_0_15("NewStoryDialogue" .. var_50_0, function(arg_51_0)
			Object.Instantiate(arg_51_0, arg_50_0.dialogueContainer).name = var_50_0

			arg_50_2()
		end)
	else
		arg_50_2()
	end
end

function var_0_0.CheckState(arg_52_0)
	if arg_52_0.state == var_0_3 or arg_52_0.state == var_0_1 or arg_52_0.state == var_0_4 then
		return false
	end

	return true
end

function var_0_0.RegistSkipBtn(arg_53_0)
	local function var_53_0()
		arg_53_0:TrackingSkip()
		arg_53_0.storyScript:SkipAll()
		arg_53_0.currPlayer:NextOneImmediately()
	end

	onButton(arg_53_0, arg_53_0.skipBtn, function()
		if arg_53_0:IsStopping() or arg_53_0:IsPausing() then
			return
		end

		if not arg_53_0.currPlayer:CanSkip() then
			return
		end

		if arg_53_0:IsReView() or arg_53_0.storyScript:IsPlayed() or not arg_53_0.storyScript:ShowSkipTip() then
			var_53_0()

			return
		end

		arg_53_0:Puase()

		arg_53_0.isOpenMsgbox = true

		pg.MsgboxMgr:GetInstance():ShowMsgBox({
			parent = rtf(arg_53_0._tf:Find("front")),
			content = i18n("story_skip_confirm"),
			onYes = function()
				arg_53_0:Resume()
				var_53_0()
			end,
			onNo = function()
				arg_53_0.isOpenMsgbox = false

				arg_53_0:Resume()
			end,
			weight = LayerWeightConst.TOP_LAYER
		})
	end, SFX_PANEL)
end

function var_0_0.RegistAutoBtn(arg_58_0)
	onButton(arg_58_0, arg_58_0.autoBtn, function()
		if arg_58_0:IsStopping() or arg_58_0:IsPausing() then
			return
		end

		if arg_58_0.storyScript:GetAutoPlayFlag() then
			arg_58_0.storyScript:StopAutoPlay()
			arg_58_0.currPlayer:CancelAuto()
		else
			arg_58_0.storyScript:SetAutoPlay()
			arg_58_0.currPlayer:NextOne()
		end

		if arg_58_0.storyScript then
			arg_58_0:UpdateAutoBtn()
		end
	end, SFX_PANEL)

	local var_58_0 = arg_58_0:IsAutoPlay()

	if var_58_0 then
		arg_58_0.storyScript:SetAutoPlay()
		arg_58_0:UpdateAutoBtn()

		arg_58_0.autoPlayFlag = false
	end

	arg_58_0.banPlayFlag = false
	arg_58_0.isAutoPlay = var_58_0
end

function var_0_0.RegistRecordBtn(arg_60_0)
	onButton(arg_60_0, arg_60_0.recordBtn, function()
		if arg_60_0.storyScript:GetAutoPlayFlag() then
			return
		end

		if not arg_60_0.recordPanel:CanOpen() then
			return
		end

		local var_61_0 = "Show"

		arg_60_0.recordPanel[var_61_0](arg_60_0.recordPanel, arg_60_0.recorder)
	end, SFX_PANEL)
end

function var_0_0.TriggerAutoBtn(arg_62_0)
	if not arg_62_0:IsRunning() then
		return
	end

	triggerButton(arg_62_0.autoBtn)
end

function var_0_0.TriggerSkipBtn(arg_63_0)
	if not arg_63_0:IsRunning() then
		return
	end

	triggerButton(arg_63_0.skipBtn)
end

function var_0_0.ForEscPress(arg_64_0)
	if arg_64_0.recordPanel:IsShowing() then
		arg_64_0.recordPanel:Hide()
	else
		arg_64_0:TriggerSkipBtn()
	end
end

function var_0_0.UpdatePlaySpeed(arg_65_0, arg_65_1)
	if arg_65_0:IsRunning() and arg_65_0.storyScript then
		arg_65_0.storyScript:SetPlaySpeed(arg_65_1)
	end
end

function var_0_0.GetPlaySpeed(arg_66_0)
	if arg_66_0:IsRunning() and arg_66_0.storyScript then
		return arg_66_0.storyScript:GetPlaySpeed()
	end
end

function var_0_0.OnStart(arg_67_0)
	arg_67_0.recorder:Clear()
	removeOnButton(arg_67_0._go)
	removeOnButton(arg_67_0.skipBtn)
	removeOnButton(arg_67_0.autoBtn)
	removeOnButton(arg_67_0.recordBtn)

	arg_67_0.alphaImage.color = Color(0, 0, 0, arg_67_0.storyScript:GetStoryAlpha())

	setActive(arg_67_0.recordBtn, not arg_67_0.storyScript:ShouldHideRecord())
	arg_67_0:ClearStoryEventTriggerListener()

	local var_67_0 = arg_67_0.storyScript:GetAllStepDispatcherRecallName()

	if #var_67_0 > 0 then
		arg_67_0.storyEventTriggerListener = StoryEventTriggerListener.New(var_67_0)
	end

	arg_67_0.state = var_0_3

	arg_67_0:TrackingStart()
	arg_67_0:SendNotification(GAME.STORY_BEGIN, arg_67_0.storyScript:GetName())
	arg_67_0:SendNotification(GAME.STORY_UPDATE, {
		storyId = arg_67_0.storyScript:GetName()
	})
	pg.DelegateInfo.New(arg_67_0)

	for iter_67_0, iter_67_1 in ipairs(arg_67_0.players) do
		iter_67_1:StoryStart(arg_67_0.storyScript)
	end

	setActive(arg_67_0._go, true)
	arg_67_0._tf:SetAsLastSibling()
	setActive(arg_67_0.skipBtn, not arg_67_0.storyScript:ShouldHideSkip())
	setActive(arg_67_0.autoBtn, not arg_67_0.storyScript:ShouldHideAutoBtn())

	arg_67_0.bgmVolumeValue = pg.CriMgr.GetInstance():getBGMVolume()

	arg_67_0:RegistSkipBtn()
	arg_67_0:RegistAutoBtn()
	arg_67_0:RegistRecordBtn()
end

function var_0_0.TrackingStart(arg_68_0)
	arg_68_0.trackFlag = false

	if not arg_68_0.storyScript then
		return
	end

	local var_68_0 = arg_68_0:StoryName2StoryId(arg_68_0.storyScript:GetName())

	if not arg_68_0:GetPlayedFlag(var_68_0) then
		TrackConst.StoryStart(var_68_0)

		arg_68_0.trackFlag = true
	end
end

function var_0_0.TrackingSkip(arg_69_0)
	if not arg_69_0.trackFlag or not arg_69_0.storyScript then
		return
	end

	local var_69_0 = arg_69_0:StoryName2StoryId(arg_69_0.storyScript:GetName())

	TrackConst.StorySkip(var_69_0, arg_69_0.progress or 0)
end

function var_0_0.TrackingOption(arg_70_0, arg_70_1, arg_70_2)
	if not arg_70_0.storyScript or not arg_70_1 or not arg_70_2 then
		return
	end

	local var_70_0 = arg_70_0:StoryName2StoryId(arg_70_0.storyScript:GetName())

	TrackConst.StoryOption(var_70_0, arg_70_1 .. "_" .. (arg_70_2 or 0))
end

function var_0_0.ClearStoryEvent(arg_71_0)
	if arg_71_0.storyEventTriggerListener then
		arg_71_0.storyEventTriggerListener:Clear()
	end
end

function var_0_0.CheckStoryEvent(arg_72_0, arg_72_1)
	if arg_72_0.storyEventTriggerListener then
		return arg_72_0.storyEventTriggerListener:ExistCache(arg_72_1)
	end

	return false
end

function var_0_0.GetStoryEventArg(arg_73_0, arg_73_1)
	if not arg_73_0:CheckStoryEvent(arg_73_1) then
		return nil
	end

	if arg_73_0.storyEventTriggerListener and arg_73_0.storyEventTriggerListener:ExistArg(arg_73_1) then
		return arg_73_0.storyEventTriggerListener:GetArg(arg_73_1)
	end

	return nil
end

function var_0_0.UpdateAutoBtn(arg_74_0)
	local var_74_0 = arg_74_0.storyScript:GetAutoPlayFlag()

	arg_74_0:ClearAutoBtn(var_74_0)
end

function var_0_0.ClearAutoBtn(arg_75_0, arg_75_1)
	arg_75_0.autoBtnImg.color = arg_75_1 and var_0_8 or var_0_9
	arg_75_0.isAutoPlay = arg_75_1

	local var_75_0 = arg_75_1 and "Show" or "Hide"

	arg_75_0.setSpeedPanel[var_75_0](arg_75_0.setSpeedPanel)
end

function var_0_0.ClearStoryEventTriggerListener(arg_76_0)
	if arg_76_0.storyEventTriggerListener then
		arg_76_0.storyEventTriggerListener:Dispose()

		arg_76_0.storyEventTriggerListener = nil
	end
end

function var_0_0.Clear(arg_77_0)
	arg_77_0.progress = 0

	arg_77_0:ClearStoryEventTriggerListener()
	arg_77_0.recorder:Clear()
	arg_77_0.recordPanel:Hide()

	arg_77_0.autoPlayFlag = false
	arg_77_0.banPlayFlag = false

	removeOnButton(arg_77_0._go)
	removeOnButton(arg_77_0.skipBtn)
	removeOnButton(arg_77_0.recordBtn)
	removeOnButton(arg_77_0.autoBtn)
	arg_77_0:ClearAutoBtn(false)

	if isActive(arg_77_0._go) then
		pg.DelegateInfo.Dispose(arg_77_0)
	end

	if arg_77_0.setSpeedPanel then
		arg_77_0.setSpeedPanel:Clear()
	end

	setActive(arg_77_0.skipBtn, false)
	setActive(arg_77_0._go, false)

	for iter_77_0, iter_77_1 in ipairs(arg_77_0.players) do
		iter_77_1:StoryEnd(arg_77_0.storyScript)
	end

	arg_77_0.optionSelCodes = nil

	arg_77_0:SendNotification(GAME.STORY_END)

	if arg_77_0.isOpenMsgbox then
		pg.MsgboxMgr:GetInstance():hide()
	end

	arg_77_0:RevertBgmVolumeValue()
end

function var_0_0.RevertBgmVolumeValue(arg_78_0)
	pg.BgmMgr.GetInstance():ContinuePlay()

	local var_78_0 = pg.CriMgr.GetInstance():getBGMVolume()

	if arg_78_0.bgmVolumeValue and arg_78_0.bgmVolumeValue ~= var_78_0 then
		pg.CriMgr.GetInstance():setBGMVolume(arg_78_0.bgmVolumeValue)
	end

	arg_78_0.bgmVolumeValue = nil
end

function var_0_0.OnEnd(arg_79_0, arg_79_1)
	arg_79_0:Clear()

	if arg_79_0.state == var_0_3 or arg_79_0.state == var_0_5 then
		arg_79_0.state = var_0_6

		local var_79_0 = arg_79_0.storyScript:GetNextScriptName()

		if var_79_0 and not arg_79_0:IsReView() then
			arg_79_0.storyScript = nil

			arg_79_0:Play(var_79_0, arg_79_1)
		else
			local var_79_1 = arg_79_0.storyScript:GetBranchCode()

			arg_79_0.storyScript = nil

			if arg_79_1 then
				arg_79_1(true, var_79_1)
			end
		end
	else
		arg_79_0.state = var_0_6

		local var_79_2 = arg_79_0.storyScript:GetBranchCode()

		if arg_79_1 then
			arg_79_1(true, var_79_2)
		end
	end
end

function var_0_0.OnSceneEnter(arg_80_0, arg_80_1)
	if not arg_80_0.scenes then
		arg_80_0.scenes = {}
	end

	arg_80_0.scenes[arg_80_1.view] = true
end

function var_0_0.OnSceneExit(arg_81_0, arg_81_1)
	if not arg_81_0.scenes then
		return
	end

	arg_81_0.scenes[arg_81_1.view] = nil
end

function var_0_0.IsReView(arg_82_0)
	local var_82_0 = getProxy(ContextProxy):GetPrevContext(1)

	return arg_82_0.scenes[WorldMediaCollectionScene.__cname] == true or var_82_0 and var_82_0.mediator == WorldMediaCollectionMediator
end

function var_0_0.IsRunning(arg_83_0)
	return arg_83_0.state == var_0_3
end

function var_0_0.IsStopping(arg_84_0)
	return arg_84_0.state == var_0_5
end

function var_0_0.IsPausing(arg_85_0)
	return arg_85_0.state == var_0_4
end

function var_0_0.IsAutoPlay(arg_86_0)
	if arg_86_0.banPlayFlag then
		return false
	end

	return getProxy(SettingsProxy):GetStoryAutoPlayFlag() or arg_86_0.autoPlayFlag == true
end

function var_0_0.GetRectSize(arg_87_0)
	return Vector2(arg_87_0._tf.rect.width, arg_87_0._tf.rect.height)
end

function var_0_0.AddRecord(arg_88_0, arg_88_1)
	arg_88_0.recorder:Add(arg_88_1)
end

function var_0_0.Quit(arg_89_0)
	arg_89_0.recorder:Dispose()
	arg_89_0.recordPanel:Dispose()
	arg_89_0.setSpeedPanel:Dispose()

	arg_89_0.state = var_0_7
	arg_89_0.storyScript = nil
	arg_89_0.playQueue = {}
	arg_89_0.playedList = {}
	arg_89_0.scenes = {}
end

function var_0_0.Fix(arg_90_0)
	local var_90_0 = getProxy(PlayerProxy):getRawData():GetRegisterTime()
	local var_90_1 = pg.TimeMgr.GetInstance():parseTimeFromConfig({
		{
			2021,
			4,
			8
		},
		{
			9,
			0,
			0
		}
	})
	local var_90_2 = {
		10020,
		10021,
		10022,
		10023,
		10024,
		10025,
		10026,
		10027
	}

	if var_90_0 <= var_90_1 then
		_.each(var_90_2, function(arg_91_0)
			arg_90_0.playedList[arg_91_0] = true
		end)
	end

	local var_90_3 = 5001
	local var_90_4 = 5020
	local var_90_5 = getProxy(TaskProxy)
	local var_90_6 = 0

	for iter_90_0 = var_90_3, var_90_4, -1 do
		if var_90_5:getFinishTaskById(iter_90_0) or var_90_5:getTaskById(iter_90_0) then
			var_90_6 = iter_90_0

			break
		end
	end

	for iter_90_1 = var_90_6, var_90_4, -1 do
		local var_90_7 = pg.task_data_template[iter_90_1]

		if var_90_7 then
			local var_90_8 = var_90_7.story_id

			if var_90_8 and #var_90_8 > 0 and not arg_90_0:IsPlayed(var_90_8) then
				arg_90_0.playedList[var_90_8] = true
			end
		end
	end

	local var_90_9 = getProxy(ActivityProxy):getActivityById(ActivityConst.JYHZ_ACTIVITY_ID)

	if var_90_9 and not var_90_9:isEnd() then
		local var_90_10 = _.flatten(var_90_9:getConfig("config_data"))
		local var_90_11

		for iter_90_2 = #var_90_10, 1, -1 do
			local var_90_12 = pg.task_data_template[var_90_10[iter_90_2]].story_id

			if var_90_12 and #var_90_12 > 0 then
				local var_90_13 = arg_90_0:IsPlayed(var_90_12)

				if var_90_11 then
					if not var_90_13 then
						arg_90_0.playedList[var_90_12] = true
					end
				elseif var_90_13 then
					var_90_11 = iter_90_2
				end
			end
		end
	end
end
