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

	LoadAndInstantiateAsync("ui", "NewStoryUI", function(arg_22_0)
		arg_21_0.UIOverlay = GameObject.Find("Overlay/UIOverlay")

		arg_22_0.transform:SetParent(arg_21_0.UIOverlay.transform, false)
		arg_21_0:_Init(arg_22_0, arg_21_1)
	end, true, true)
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
		SpAnimStoryPlayer.New(arg_23_1),
		BlinkStoryPlayer.New(arg_23_1)
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

function var_0_0.Play(arg_24_0, arg_24_1, arg_24_2, arg_24_3, arg_24_4, arg_24_5, arg_24_6, arg_24_7)
	table.insert(arg_24_0.playQueue, {
		arg_24_1,
		arg_24_2,
		arg_24_7
	})

	if #arg_24_0.playQueue == 1 then
		local var_24_0

		local function var_24_1()
			if #arg_24_0.playQueue == 0 then
				return
			end

			local var_25_0 = arg_24_0.playQueue[1][1]
			local var_25_1 = arg_24_0.playQueue[1][2]
			local var_25_2 = arg_24_0.playQueue[1][3]

			arg_24_0:SoloPlay(var_25_0, function(arg_26_0, arg_26_1)
				if var_25_1 then
					var_25_1(arg_26_0, arg_26_1)
				end

				table.remove(arg_24_0.playQueue, 1)
				var_24_1()
			end, arg_24_3, arg_24_4, arg_24_5, arg_24_6, var_25_2)
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

	if arg_29_0.currPlayer and arg_29_0.currPlayer:WaitForEvent() then
		return
	end

	arg_29_0.state = var_0_5

	for iter_29_0, iter_29_1 in ipairs(arg_29_0.players) do
		iter_29_1:Stop()
	end
end

function var_0_0.PlayForTb(arg_30_0, arg_30_1, arg_30_2, arg_30_3, arg_30_4)
	arg_30_0:Play(arg_30_1, arg_30_3, arg_30_4, false, false, true, arg_30_2)
end

function var_0_0.PlayForWorld(arg_31_0, arg_31_1, arg_31_2, arg_31_3, arg_31_4, arg_31_5, arg_31_6, arg_31_7, arg_31_8)
	arg_31_0.optionSelCodes = arg_31_2 or {}
	arg_31_0.autoPlayFlag = arg_31_6

	arg_31_0:Play(arg_31_1, arg_31_3, arg_31_4, arg_31_5, arg_31_7, true, arg_31_8)
end

function var_0_0.ForceAutoPlay(arg_32_0, arg_32_1, arg_32_2, arg_32_3, arg_32_4, arg_32_5)
	arg_32_0.autoPlayFlag = true

	local function var_32_0(arg_33_0, arg_33_1)
		arg_32_2(arg_33_0, arg_33_1, arg_32_0.isAutoPlay)
	end

	arg_32_0:Play(arg_32_1, var_32_0, arg_32_3, arg_32_4, true, false, arg_32_5)
end

function var_0_0.ForceManualPlay(arg_34_0, arg_34_1, arg_34_2, arg_34_3, arg_34_4, arg_34_5)
	arg_34_0.banPlayFlag = true

	local function var_34_0(arg_35_0, arg_35_1)
		arg_34_2(arg_35_0, arg_35_1, arg_34_0.isAutoPlay)
	end

	arg_34_0:Play(arg_34_1, var_34_0, arg_34_3, arg_34_4, true, false, arg_34_5)
end

function var_0_0.SeriesPlay(arg_36_0, arg_36_1, arg_36_2, arg_36_3, arg_36_4, arg_36_5, arg_36_6, arg_36_7)
	local var_36_0 = {}

	for iter_36_0, iter_36_1 in ipairs(arg_36_1) do
		table.insert(var_36_0, function(arg_37_0)
			arg_36_0:SoloPlay(iter_36_1, arg_37_0, arg_36_3, arg_36_4, arg_36_5, arg_36_6, arg_36_7)
		end)
	end

	seriesAsync(var_36_0, arg_36_2)
end

function var_0_0.SoloPlay(arg_38_0, arg_38_1, arg_38_2, arg_38_3, arg_38_4, arg_38_5, arg_38_6, arg_38_7)
	var_0_11("Play Story:", arg_38_1)

	local var_38_0 = 1

	local function var_38_1(arg_39_0, arg_39_1)
		var_38_0 = var_38_0 - 1

		if arg_38_2 and var_38_0 == 0 then
			onNextTick(function()
				arg_38_2(arg_39_0, arg_39_1)
			end)
		end
	end

	local var_38_2 = var_0_13(arg_38_1)

	if not var_38_2 then
		var_38_1(false)
		var_0_11("not exist story file")

		return nil
	end

	if arg_38_0:IsReView() then
		arg_38_3 = true
	end

	arg_38_0.storyScript = Story.New(var_38_2, arg_38_3, arg_38_0.optionSelCodes, arg_38_5, arg_38_6, arg_38_7)

	if not arg_38_0:CheckState() then
		var_0_11("story state error")
		var_38_1(false)

		return nil
	end

	if not arg_38_0.storyScript:CanPlay() then
		var_0_11("story cant be played")
		var_38_1(false)

		return nil
	end

	arg_38_0:ExecuteScript(var_38_1)
end

function var_0_0.ExecuteScript(arg_41_0, arg_41_1)
	seriesAsync({
		function(arg_42_0)
			arg_41_0:CheckResDownload(arg_41_0.storyScript, arg_42_0)
		end,
		function(arg_43_0)
			originalPrint("start load story window...")
			arg_41_0:CheckAndLoadDialogue(arg_41_0.storyScript, arg_43_0)
		end
	}, function()
		originalPrint("enter story...")
		arg_41_0:OnStart()

		local var_44_0 = {}

		arg_41_0.currPlayer = nil
		arg_41_0.progress = 0

		for iter_44_0, iter_44_1 in ipairs(arg_41_0.storyScript.steps) do
			table.insert(var_44_0, function(arg_45_0)
				arg_41_0.progress = iter_44_0

				arg_41_0:SendNotification(GAME.STORY_NEXT)

				local var_45_0 = arg_41_0.players[iter_44_1:GetMode()]

				arg_41_0.currPlayer = var_45_0

				var_45_0:Play(arg_41_0.storyScript, iter_44_0, arg_45_0)
			end)
		end

		seriesAsync(var_44_0, function()
			arg_41_0:OnEnd(arg_41_1)
		end)
	end)
end

function var_0_0.SendNotification(arg_47_0, arg_47_1, arg_47_2)
	pg.m02:sendNotification(arg_47_1, arg_47_2)
end

function var_0_0.CheckResDownload(arg_48_0, arg_48_1, arg_48_2)
	local var_48_0 = arg_48_0:_GetStoryPaintingsByName(arg_48_1)
	local var_48_1 = table.concat(var_48_0, ",")

	originalPrint("start download res " .. var_48_1)

	local var_48_2 = {}

	for iter_48_0, iter_48_1 in ipairs(var_48_0) do
		PaintingGroupConst.AddPaintingNameWithFilteMap(var_48_2, iter_48_1)
	end

	PaintingGroupConst.PaintingDownload({
		isShowBox = true,
		paintingNameList = var_48_2,
		finishFunc = arg_48_2
	})
end

local function var_0_15(arg_49_0, arg_49_1)
	ResourceMgr.Inst:getAssetAsync("ui/" .. arg_49_0, "", UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_50_0)
		arg_49_1(arg_50_0)
	end), true, true)
end

function var_0_0.CheckAndLoadDialogue(arg_51_0, arg_51_1, arg_51_2)
	local var_51_0 = arg_51_1:GetDialogueStyleName()

	if not arg_51_0.dialogueContainer:Find(var_51_0) then
		var_0_15("NewStoryDialogue" .. var_51_0, function(arg_52_0)
			Object.Instantiate(arg_52_0, arg_51_0.dialogueContainer).name = var_51_0

			arg_51_2()
		end)
	else
		arg_51_2()
	end
end

function var_0_0.CheckState(arg_53_0)
	if arg_53_0.state == var_0_3 or arg_53_0.state == var_0_1 or arg_53_0.state == var_0_4 then
		return false
	end

	return true
end

function var_0_0.RegistSkipBtn(arg_54_0)
	local function var_54_0()
		arg_54_0:TrackingSkip()
		arg_54_0.storyScript:SkipAll()
		arg_54_0.currPlayer:NextOneImmediately()
	end

	onButton(arg_54_0, arg_54_0.skipBtn, function()
		if arg_54_0:IsStopping() or arg_54_0:IsPausing() then
			return
		end

		if not arg_54_0.currPlayer:CanSkip() then
			return
		end

		if arg_54_0:IsReView() or arg_54_0.storyScript:IsPlayed() or not arg_54_0.storyScript:ShowSkipTip() then
			var_54_0()

			return
		end

		arg_54_0:Puase()

		arg_54_0.isOpenMsgbox = true

		pg.MsgboxMgr:GetInstance():ShowMsgBox({
			parent = rtf(arg_54_0._tf:Find("front")),
			content = i18n("story_skip_confirm"),
			onYes = function()
				arg_54_0:Resume()
				var_54_0()
			end,
			onNo = function()
				arg_54_0.isOpenMsgbox = false

				arg_54_0:Resume()
			end,
			weight = LayerWeightConst.TOP_LAYER
		})
	end, SFX_PANEL)
end

function var_0_0.RegistAutoBtn(arg_59_0)
	onButton(arg_59_0, arg_59_0.autoBtn, function()
		if arg_59_0:IsStopping() or arg_59_0:IsPausing() then
			return
		end

		if arg_59_0.storyScript:GetAutoPlayFlag() then
			arg_59_0.storyScript:StopAutoPlay()
			arg_59_0.currPlayer:CancelAuto()
		else
			arg_59_0.storyScript:SetAutoPlay()
			arg_59_0.currPlayer:NextOne()
		end

		if arg_59_0.storyScript then
			arg_59_0:UpdateAutoBtn()
		end
	end, SFX_PANEL)

	local var_59_0 = arg_59_0:IsAutoPlay()

	if var_59_0 then
		arg_59_0.storyScript:SetAutoPlay()
		arg_59_0:UpdateAutoBtn()

		arg_59_0.autoPlayFlag = false
	end

	arg_59_0.banPlayFlag = false
	arg_59_0.isAutoPlay = var_59_0
end

function var_0_0.RegistRecordBtn(arg_61_0)
	onButton(arg_61_0, arg_61_0.recordBtn, function()
		if arg_61_0.storyScript:GetAutoPlayFlag() then
			return
		end

		if not arg_61_0.recordPanel:CanOpen() then
			return
		end

		local var_62_0 = "Show"

		arg_61_0.recordPanel[var_62_0](arg_61_0.recordPanel, arg_61_0.recorder)
	end, SFX_PANEL)
end

function var_0_0.TriggerAutoBtn(arg_63_0)
	if not arg_63_0:IsRunning() then
		return
	end

	triggerButton(arg_63_0.autoBtn)
end

function var_0_0.TriggerSkipBtn(arg_64_0)
	if not arg_64_0:IsRunning() then
		return
	end

	triggerButton(arg_64_0.skipBtn)
end

function var_0_0.ForEscPress(arg_65_0)
	if arg_65_0.recordPanel:IsShowing() then
		arg_65_0.recordPanel:Hide()
	elseif arg_65_0.currPlayer and arg_65_0.currPlayer:WaitForEvent() or arg_65_0.currPlayer and arg_65_0.storyScript and arg_65_0.storyScript.hideSkip then
		-- block empty
	else
		arg_65_0:TriggerSkipBtn()
	end
end

function var_0_0.UpdatePlaySpeed(arg_66_0, arg_66_1)
	if arg_66_0:IsRunning() and arg_66_0.storyScript then
		arg_66_0.storyScript:SetPlaySpeed(arg_66_1)
	end
end

function var_0_0.GetPlaySpeed(arg_67_0)
	if arg_67_0:IsRunning() and arg_67_0.storyScript then
		return arg_67_0.storyScript:GetPlaySpeed()
	end
end

function var_0_0.OnStart(arg_68_0)
	arg_68_0.recorder:Clear()
	removeOnButton(arg_68_0._go)
	removeOnButton(arg_68_0.skipBtn)
	removeOnButton(arg_68_0.autoBtn)
	removeOnButton(arg_68_0.recordBtn)

	arg_68_0.alphaImage.color = Color(0, 0, 0, arg_68_0.storyScript:GetStoryAlpha())

	setActive(arg_68_0.recordBtn, not arg_68_0.storyScript:ShouldHideRecord())
	arg_68_0:ClearStoryEventTriggerListener()

	local var_68_0 = arg_68_0.storyScript:GetAllStepDispatcherRecallName()

	if #var_68_0 > 0 then
		arg_68_0.storyEventTriggerListener = StoryEventTriggerListener.New(var_68_0)
	end

	arg_68_0.state = var_0_3

	arg_68_0:TrackingStart()
	arg_68_0:SendNotification(GAME.STORY_BEGIN, arg_68_0.storyScript:GetName())

	if not arg_68_0:IsReView() then
		arg_68_0:SendNotification(GAME.STORY_UPDATE, {
			storyId = arg_68_0.storyScript:GetName()
		})
	end

	pg.DelegateInfo.New(arg_68_0)

	for iter_68_0, iter_68_1 in ipairs(arg_68_0.players) do
		iter_68_1:StoryStart(arg_68_0.storyScript)
	end

	setActive(arg_68_0._go, true)
	arg_68_0._tf:SetAsLastSibling()
	setActive(arg_68_0.skipBtn, not arg_68_0.storyScript:ShouldHideSkip())
	setActive(arg_68_0.autoBtn, not arg_68_0.storyScript:ShouldHideAutoBtn())

	arg_68_0.bgmVolumeValue = pg.CriMgr.GetInstance():getBGMVolume()

	arg_68_0:RegistSkipBtn()
	arg_68_0:RegistAutoBtn()
	arg_68_0:RegistRecordBtn()
end

function var_0_0.TrackingStart(arg_69_0)
	if not getProxy(PlayerProxy) or not getProxy(PlayerProxy):getRawData() then
		return
	end

	arg_69_0.trackFlag = false

	if not arg_69_0.storyScript then
		return
	end

	local var_69_0 = arg_69_0:StoryName2StoryId(arg_69_0.storyScript:GetName())

	if var_69_0 and not arg_69_0:GetPlayedFlag(var_69_0) then
		pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildStoryStart(var_69_0, 0))

		arg_69_0.trackFlag = true
	end
end

function var_0_0.TrackingSkip(arg_70_0)
	if not arg_70_0.trackFlag or not arg_70_0.storyScript then
		return
	end

	local var_70_0 = arg_70_0:StoryName2StoryId(arg_70_0.storyScript:GetName())

	if var_70_0 then
		pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildStorySkip(var_70_0, arg_70_0.progress or 0))
	end
end

function var_0_0.TrackingOption(arg_71_0, arg_71_1, arg_71_2)
	if not arg_71_0.storyScript or not arg_71_1 or not arg_71_2 then
		return
	end

	local var_71_0 = arg_71_0:StoryName2StoryId(arg_71_0.storyScript:GetName())

	if var_71_0 then
		pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildStoryOption(var_71_0, arg_71_1 .. "_" .. (arg_71_2 or 0)))
	end
end

function var_0_0.ClearStoryEvent(arg_72_0)
	if arg_72_0.storyEventTriggerListener then
		arg_72_0.storyEventTriggerListener:Clear()
	end
end

function var_0_0.CheckStoryEvent(arg_73_0, arg_73_1)
	if arg_73_0.storyEventTriggerListener then
		return arg_73_0.storyEventTriggerListener:ExistCache(arg_73_1)
	end

	return false
end

function var_0_0.GetStoryEventArg(arg_74_0, arg_74_1)
	if not arg_74_0:CheckStoryEvent(arg_74_1) then
		return nil
	end

	if arg_74_0.storyEventTriggerListener and arg_74_0.storyEventTriggerListener:ExistArg(arg_74_1) then
		return arg_74_0.storyEventTriggerListener:GetArg(arg_74_1)
	end

	return nil
end

function var_0_0.UpdateAutoBtn(arg_75_0)
	local var_75_0 = arg_75_0.storyScript:GetAutoPlayFlag()

	arg_75_0:ClearAutoBtn(var_75_0)
end

function var_0_0.ClearAutoBtn(arg_76_0, arg_76_1)
	arg_76_0.autoBtnImg.color = arg_76_1 and var_0_8 or var_0_9
	arg_76_0.isAutoPlay = arg_76_1

	local var_76_0 = arg_76_1 and "Show" or "Hide"

	arg_76_0.setSpeedPanel[var_76_0](arg_76_0.setSpeedPanel)
end

function var_0_0.ClearStoryEventTriggerListener(arg_77_0)
	if arg_77_0.storyEventTriggerListener then
		arg_77_0.storyEventTriggerListener:Dispose()

		arg_77_0.storyEventTriggerListener = nil
	end
end

function var_0_0.Clear(arg_78_0)
	arg_78_0.progress = 0

	arg_78_0:ClearStoryEventTriggerListener()
	arg_78_0.recorder:Clear()
	arg_78_0.recordPanel:Hide()

	arg_78_0.autoPlayFlag = false
	arg_78_0.banPlayFlag = false

	removeOnButton(arg_78_0._go)
	removeOnButton(arg_78_0.skipBtn)
	removeOnButton(arg_78_0.recordBtn)
	removeOnButton(arg_78_0.autoBtn)
	arg_78_0:ClearAutoBtn(false)

	if isActive(arg_78_0._go) then
		pg.DelegateInfo.Dispose(arg_78_0)
	end

	if arg_78_0.setSpeedPanel then
		arg_78_0.setSpeedPanel:Clear()
	end

	setActive(arg_78_0.skipBtn, false)
	setActive(arg_78_0._go, false)

	for iter_78_0, iter_78_1 in ipairs(arg_78_0.players) do
		iter_78_1:StoryEnd(arg_78_0.storyScript)
	end

	arg_78_0.optionSelCodes = nil

	arg_78_0:SendNotification(GAME.STORY_END)

	if arg_78_0.isOpenMsgbox then
		pg.MsgboxMgr:GetInstance():hide()
	end

	arg_78_0:RevertBgmVolumeValue()
end

function var_0_0.RevertBgmVolumeValue(arg_79_0)
	pg.BgmMgr.GetInstance():ContinuePlay()

	local var_79_0 = pg.CriMgr.GetInstance():getBGMVolume()

	if arg_79_0.bgmVolumeValue and arg_79_0.bgmVolumeValue ~= var_79_0 then
		pg.CriMgr.GetInstance():setBGMVolume(arg_79_0.bgmVolumeValue)
	end

	arg_79_0.bgmVolumeValue = nil
end

function var_0_0.OnEnd(arg_80_0, arg_80_1)
	arg_80_0:Clear()

	if arg_80_0.state == var_0_3 or arg_80_0.state == var_0_5 then
		arg_80_0.state = var_0_6

		local var_80_0 = arg_80_0.storyScript:GetNextScriptName()

		if var_80_0 and not arg_80_0:IsReView() then
			arg_80_0.storyScript = nil

			arg_80_0:Play(var_80_0, arg_80_1)
		else
			local var_80_1 = arg_80_0.storyScript:GetBranchCode()

			arg_80_0.storyScript = nil

			if arg_80_1 then
				arg_80_1(true, var_80_1)
			end
		end
	else
		arg_80_0.state = var_0_6

		local var_80_2 = arg_80_0.storyScript:GetBranchCode()

		if arg_80_1 then
			arg_80_1(true, var_80_2)
		end
	end
end

function var_0_0.OnSceneEnter(arg_81_0, arg_81_1)
	if not arg_81_0.scenes then
		arg_81_0.scenes = {}
	end

	arg_81_0.scenes[arg_81_1.view] = true
end

function var_0_0.OnSceneExit(arg_82_0, arg_82_1)
	if not arg_82_0.scenes then
		return
	end

	arg_82_0.scenes[arg_82_1.view] = nil
end

function var_0_0.IsReView(arg_83_0)
	local var_83_0 = getProxy(ContextProxy):GetPrevContext(1)

	return arg_83_0.scenes[WorldMediaCollectionScene.__cname] == true or var_83_0 and var_83_0.mediator == WorldMediaCollectionMediator
end

function var_0_0.IsRunning(arg_84_0)
	return arg_84_0.state == var_0_3
end

function var_0_0.IsStopping(arg_85_0)
	return arg_85_0.state == var_0_5
end

function var_0_0.IsPausing(arg_86_0)
	return arg_86_0.state == var_0_4
end

function var_0_0.IsAutoPlay(arg_87_0)
	if arg_87_0.banPlayFlag then
		return false
	end

	return getProxy(SettingsProxy):GetStoryAutoPlayFlag() or arg_87_0.autoPlayFlag == true
end

function var_0_0.GetRectSize(arg_88_0)
	return Vector2(arg_88_0._tf.rect.width, arg_88_0._tf.rect.height)
end

function var_0_0.AddRecord(arg_89_0, arg_89_1)
	arg_89_0.recorder:Add(arg_89_1)
end

function var_0_0.Quit(arg_90_0)
	arg_90_0.recorder:Dispose()
	arg_90_0.recordPanel:Dispose()
	arg_90_0.setSpeedPanel:Dispose()

	if arg_90_0.currPlayer and arg_90_0.currPlayer:WaitForEvent() then
		arg_90_0:Clear()
	end

	arg_90_0.state = var_0_7
	arg_90_0.storyScript = nil
	arg_90_0.currPlayer = nil
	arg_90_0.playQueue = {}
	arg_90_0.playedList = {}
	arg_90_0.scenes = {}
end

function var_0_0.Fix(arg_91_0)
	local var_91_0 = getProxy(PlayerProxy):getRawData():GetRegisterTime()
	local var_91_1 = pg.TimeMgr.GetInstance():parseTimeFromConfig({
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
	local var_91_2 = {
		10020,
		10021,
		10022,
		10023,
		10024,
		10025,
		10026,
		10027
	}

	if var_91_0 <= var_91_1 then
		_.each(var_91_2, function(arg_92_0)
			arg_91_0.playedList[arg_92_0] = true
		end)
	end

	local var_91_3 = 5001
	local var_91_4 = 5020
	local var_91_5 = getProxy(TaskProxy)
	local var_91_6 = 0

	for iter_91_0 = var_91_3, var_91_4, -1 do
		if var_91_5:getFinishTaskById(iter_91_0) or var_91_5:getTaskById(iter_91_0) then
			var_91_6 = iter_91_0

			break
		end
	end

	for iter_91_1 = var_91_6, var_91_4, -1 do
		local var_91_7 = pg.task_data_template[iter_91_1]

		if var_91_7 then
			local var_91_8 = var_91_7.story_id

			if var_91_8 and #var_91_8 > 0 and not arg_91_0:IsPlayed(var_91_8) then
				arg_91_0.playedList[var_91_8] = true
			end
		end
	end

	local var_91_9 = getProxy(ActivityProxy):getActivityById(ActivityConst.JYHZ_ACTIVITY_ID)

	if var_91_9 and not var_91_9:isEnd() then
		local var_91_10 = _.flatten(var_91_9:getConfig("config_data"))
		local var_91_11

		for iter_91_2 = #var_91_10, 1, -1 do
			local var_91_12 = pg.task_data_template[var_91_10[iter_91_2]].story_id

			if var_91_12 and #var_91_12 > 0 then
				local var_91_13 = arg_91_0:IsPlayed(var_91_12)

				if var_91_11 then
					if not var_91_13 then
						arg_91_0.playedList[var_91_12] = true
					end
				elseif var_91_13 then
					var_91_11 = iter_91_2
				end
			end
		end
	end
end
