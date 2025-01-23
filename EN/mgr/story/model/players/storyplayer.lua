local var_0_0 = class("StoryPlayer", import("..animation.StoryAnimtion"))
local var_0_1 = 0
local var_0_2 = 1
local var_0_3 = 2
local var_0_4 = 3
local var_0_5 = 4
local var_0_6 = 5
local var_0_7 = 6
local var_0_8 = 7
local var_0_9 = 0
local var_0_10 = 1
local var_0_11 = 2

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0)
	pg.DelegateInfo.New(arg_1_0)

	arg_1_0._go = arg_1_1
	arg_1_0._tf = arg_1_1.transform
	arg_1_0.animationPlayer = arg_1_0._tf:GetComponent(typeof(Animation))
	arg_1_0.front = arg_1_0:findTF("front")
	arg_1_0.actorTr = arg_1_0._tf:Find("actor")
	arg_1_0.frontTr = arg_1_0._tf:Find("front")
	arg_1_0.backPanel = arg_1_0:findTF("back")
	arg_1_0.goCG = GetOrAddComponent(arg_1_0._tf, typeof(CanvasGroup))
	arg_1_0.asidePanel = arg_1_0:findTF("front/aside_panel")
	arg_1_0.bgGlitch = arg_1_0:findTF("back/bg_glitch")
	arg_1_0.oldPhoto = arg_1_0:findTF("front/oldphoto"):GetComponent(typeof(Image))
	arg_1_0.bgPanel = arg_1_0:findTF("back/bg")
	arg_1_0.bgPanelCg = arg_1_0.bgPanel:GetComponent(typeof(CanvasGroup))
	arg_1_0.bgImage = arg_1_0:findTF("image", arg_1_0.bgPanel):GetComponent(typeof(Image))
	arg_1_0.mainImg = arg_1_0._tf:GetComponent(typeof(Image))
	arg_1_0.castPanel = arg_1_0:findTF("front/cast_panel")
	arg_1_0.spAnimPanel = arg_1_0:findTF("front/sp_anim_panel")
	arg_1_0.centerPanel = arg_1_0._tf:Find("center")
	arg_1_0.actorPanel = arg_1_0:findTF("actor")
	arg_1_0.dialoguePanel = arg_1_0:findTF("front/dialogue")
	arg_1_0.effectPanel = arg_1_0:findTF("front/effect")
	arg_1_0.movePanel = arg_1_0:findTF("front/move_layer")
	arg_1_0.curtain = arg_1_0:findTF("back/curtain")
	arg_1_0.curtainCg = arg_1_0.curtain:GetComponent(typeof(CanvasGroup))
	arg_1_0.flash = arg_1_0:findTF("front/flash")
	arg_1_0.flashImg = arg_1_0.flash:GetComponent(typeof(Image))
	arg_1_0.flashCg = arg_1_0.flash:GetComponent(typeof(CanvasGroup))
	arg_1_0.curtainF = arg_1_0:findTF("back/curtain_front")
	arg_1_0.curtainFCg = arg_1_0.curtainF:GetComponent(typeof(CanvasGroup))
	arg_1_0.locationTr = arg_1_0:findTF("front/location")
	arg_1_0.locationTxt = arg_1_0:findTF("front/location/Text"):GetComponent(typeof(Text))
	arg_1_0.locationTrPos = arg_1_0.locationTr.localPosition
	arg_1_0.locationAnim = arg_1_0.locationTr:GetComponent(typeof(Animation))
	arg_1_0.locationAniEvent = arg_1_0.locationTr:GetComponent(typeof(DftAniEvent))
	arg_1_0.iconImage = arg_1_0:findTF("front/icon"):GetComponent(typeof(Image))
	arg_1_0.topEffectTr = arg_1_0:findTF("top/effect")
	arg_1_0.dialogueWin = nil
	arg_1_0.bgs = {}
	arg_1_0.branchCodeList = {}
	arg_1_0.stop = false
	arg_1_0.pause = false
end

function var_0_0.StoryStart(arg_2_0, arg_2_1)
	arg_2_0.branchCodeList = {}

	eachChild(arg_2_0.dialoguePanel, function(arg_3_0)
		setActive(arg_3_0, false)
	end)

	arg_2_0.dialogueWin = arg_2_0.dialoguePanel:Find(arg_2_1:GetDialogueStyleName())

	setActive(arg_2_0.dialogueWin, true)

	arg_2_0.optionLUIlist = UIItemList.New(arg_2_0.dialogueWin:Find("options_panel/options_l"), arg_2_0.dialogueWin:Find("options_panel/options_l/option_tpl"))
	arg_2_0.optionCUIlist = UIItemList.New(arg_2_0.dialogueWin:Find("options_panel/options_c"), arg_2_0.dialogueWin:Find("options_panel/options_c/option_tpl"))
	arg_2_0.optionsCg = arg_2_0.dialogueWin:Find("options_panel"):GetComponent(typeof(CanvasGroup))

	arg_2_0:OnStart(arg_2_1)
end

function var_0_0.GetOptionContainer(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_1:GetOptionCnt()

	if arg_4_0.script:IsDialogueStyle2() then
		setActive(arg_4_0.optionLUIlist.container, true)
		setActive(arg_4_0.optionCUIlist.container, false)

		return arg_4_0.optionLUIlist, true
	end

	if var_4_0 <= 3 then
		setActive(arg_4_0.optionLUIlist.container, false)
		setActive(arg_4_0.optionCUIlist.container, true)

		return arg_4_0.optionCUIlist, false
	else
		setActive(arg_4_0.optionLUIlist.container, true)
		setActive(arg_4_0.optionCUIlist.container, false)

		return arg_4_0.optionLUIlist, true
	end
end

function var_0_0.Pause(arg_5_0)
	arg_5_0.pause = true

	arg_5_0:PauseAllAnimation()
	pg.ViewUtils.SetLayer(arg_5_0.effectPanel, Layer.UIHidden)
end

function var_0_0.Resume(arg_6_0)
	arg_6_0.pause = false

	arg_6_0:ResumeAllAnimation()
	pg.ViewUtils.SetLayer(arg_6_0.effectPanel, Layer.UI)
end

function var_0_0.Stop(arg_7_0)
	arg_7_0.stop = true

	arg_7_0:NextOneImmediately()
end

function var_0_0.Play(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	if not arg_8_1 then
		arg_8_3()

		return
	end

	if arg_8_1:GetNextScriptName() or arg_8_0.stop then
		arg_8_3()

		return
	end

	local var_8_0 = arg_8_1:GetStepByIndex(arg_8_2)

	if not var_8_0 then
		arg_8_3()

		return
	end

	pg.NewStoryMgr.GetInstance():AddRecord(var_8_0)

	if var_8_0:ShouldJumpToNextScript() then
		arg_8_1:SetNextScriptName(var_8_0:GetNextScriptName())
		arg_8_3()

		return
	end

	local var_8_1 = arg_8_1:ShouldSkipAll()

	if var_8_1 then
		arg_8_0:ClearEffects()
	end

	local var_8_2 = false

	if var_8_1 and var_8_0:IsImport() and not pg.NewStoryMgr.GetInstance():IsReView() then
		var_8_2 = true
	elseif var_8_1 then
		arg_8_3()

		return
	end

	arg_8_0.script = arg_8_1
	arg_8_0.callback = arg_8_3
	arg_8_0.step = var_8_0
	arg_8_0.autoNext = arg_8_1:GetAutoPlayFlag()
	arg_8_0.stage = var_0_1

	local var_8_3 = arg_8_1:GetTriggerDelayTime()

	if arg_8_0.autoNext and var_8_0:IsImport() and not var_8_0.optionSelCode then
		arg_8_0.autoNext = nil
	end

	arg_8_0:SetTimeScale(1 - arg_8_1:GetPlaySpeed() * 0.1)

	local var_8_4 = arg_8_1:GetPrevStep(arg_8_2)

	seriesAsync({
		function(arg_9_0)
			if not arg_8_0:NextStage(var_0_2) then
				return
			end

			parallelAsync({
				function(arg_10_0)
					arg_8_0:Reset(var_8_0, var_8_4, arg_10_0)
					arg_8_0:UpdateBg(var_8_0)
					arg_8_0:PlayBgm(var_8_0)
				end,
				function(arg_11_0)
					arg_8_0:LoadEffects(var_8_0, arg_11_0)
				end,
				function(arg_12_0)
					arg_8_0:ApplyEffects(var_8_0, arg_12_0)
				end,
				function(arg_13_0)
					arg_8_0:flashin(var_8_0, arg_13_0)
				end
			}, arg_9_0)
		end,
		function(arg_14_0)
			if var_8_2 then
				arg_8_1:StopSkip()
			end

			var_8_2 = false

			arg_14_0()
		end,
		function(arg_15_0)
			if not arg_8_0:NextStage(var_0_3) then
				return
			end

			parallelAsync({
				function(arg_16_0)
					arg_8_0:OnInit(var_8_0, var_8_4, arg_16_0)
				end,
				function(arg_17_0)
					arg_8_0:PlaySoundEffect(var_8_0)
					arg_8_0:StartUIAnimations(var_8_0, arg_17_0)
				end,
				function(arg_18_0)
					arg_8_0:OnEnter(var_8_0, var_8_4, arg_18_0)
				end,
				function(arg_19_0)
					arg_8_0:StartMoveNode(var_8_0, arg_19_0)
				end,
				function(arg_20_0)
					arg_8_0:UpdateIcon(var_8_0, arg_20_0)
				end,
				function(arg_21_0)
					arg_8_0:SetLocation(var_8_0, arg_21_0)
				end,
				function(arg_22_0)
					if arg_8_0:DispatcherEvent(var_8_0, arg_22_0) then
						arg_8_0.autoNext = true
						var_8_3 = 0
					end
				end
			}, arg_15_0)
		end,
		function(arg_23_0)
			arg_8_0:ClearCheckDispatcher()

			if not arg_8_0:NextStage(var_0_4) then
				return
			end

			if not var_8_0:ShouldDelayEvent() then
				arg_23_0()

				return
			end

			arg_8_0:DelayCall(var_8_0:GetEventDelayTime(), arg_23_0)
		end,
		function(arg_24_0)
			if not arg_8_0:NextStage(var_0_5) then
				return
			end

			if arg_8_0.skipOption then
				arg_24_0()

				return
			end

			if var_8_0:SkipEventForOption() then
				arg_24_0()

				return
			end

			if arg_8_0:ShouldAutoTrigger() then
				arg_8_0:UnscaleDelayCall(var_8_3, arg_24_0)

				return
			end

			arg_8_0:RegisetEvent(var_8_0, arg_24_0)
			arg_8_0:TriggerEventIfAuto(var_8_3)
		end,
		function(arg_25_0)
			if not arg_8_0:NextStage(var_0_6) then
				return
			end

			if not var_8_0:ExistOption() then
				arg_25_0()

				return
			end

			if arg_8_0.skipOption then
				arg_8_0.skipOption = false

				arg_25_0()

				return
			end

			arg_8_0:InitBranches(arg_8_1, var_8_0, function(arg_26_0)
				arg_25_0()
			end, function()
				arg_8_0:TriggerOptionIfAuto(var_8_3, var_8_0)
			end)
		end,
		function(arg_28_0)
			if not arg_8_0:NextStage(var_0_7) then
				return
			end

			arg_8_0.autoNext = nil

			local var_28_0 = arg_8_1:GetNextStep(arg_8_2)

			seriesAsync({
				function(arg_29_0)
					arg_8_0:ClearAnimation()
					arg_8_0:ClearApplyEffect()
					arg_8_0:OnWillExit(var_8_0, var_28_0, arg_29_0)
				end,
				function(arg_30_0)
					parallelAsync({
						function(arg_31_0)
							if not var_28_0 then
								arg_31_0()

								return
							end

							arg_8_0:Flashout(var_28_0, arg_31_0)
						end,
						function(arg_32_0)
							if var_28_0 then
								arg_32_0()

								return
							end

							arg_8_0:FadeOutStory(arg_8_0.script, arg_32_0)
						end
					}, arg_30_0)
				end
			}, arg_28_0)
		end,
		function(arg_33_0)
			if not arg_8_0:NextStage(var_0_8) then
				return
			end

			arg_8_0:OnWillClear(var_8_0)
			arg_8_0:Clear(arg_33_0)
		end
	}, arg_8_3)
end

function var_0_0.NextStage(arg_34_0, arg_34_1)
	if arg_34_0.stage == arg_34_1 - 1 then
		arg_34_0.stage = arg_34_1

		return true
	end

	return false
end

function var_0_0.ApplyEffects(arg_35_0, arg_35_1, arg_35_2)
	if arg_35_1:ShouldShake() then
		arg_35_0:ApplyShakeEffect(arg_35_1)
	end

	arg_35_2()
end

function var_0_0.ApplyShakeEffect(arg_36_0, arg_36_1)
	if not arg_36_1:ShouldShake() then
		return
	end

	arg_36_0.animationPlayer:Play("anim_storyrecordUI_shake_loop")

	local var_36_0 = arg_36_1:GetShakeTime()

	arg_36_0.playingShakeAnim = true

	arg_36_0:DelayCall(var_36_0, function()
		arg_36_0:ClearShakeEffect()
	end)
end

function var_0_0.ClearShakeEffect(arg_38_0)
	if arg_38_0.playingShakeAnim then
		arg_38_0.animationPlayer:Play("anim_storyrecordUI_shake_reset")

		arg_38_0.playingShakeAnim = nil
	end
end

function var_0_0.ClearApplyEffect(arg_39_0)
	arg_39_0:ClearShakeEffect()
end

function var_0_0.DispatcherEvent(arg_40_0, arg_40_1, arg_40_2)
	if not arg_40_1:ExistDispatcher() then
		arg_40_2()

		return
	end

	local var_40_0 = arg_40_1:GetDispatcher()

	pg.NewStoryMgr.GetInstance():ClearStoryEvent()
	pg.m02:sendNotification(var_40_0.name, {
		data = var_40_0.data,
		callbackData = var_40_0.callbackData,
		flags = arg_40_0.branchCodeList[arg_40_1:GetId()] or {}
	})

	if arg_40_1:ShouldHideUI() then
		setActive(arg_40_0._tf, false)
	end

	if arg_40_1:IsRecallDispatcher() then
		arg_40_0:CheckDispatcher(arg_40_1, arg_40_2)
	else
		arg_40_2()
	end

	return var_40_0.nextOne
end

function var_0_0.WaitForEvent(arg_41_0)
	return arg_41_0.checkTimer ~= nil
end

function var_0_0.CheckDispatcher(arg_42_0, arg_42_1, arg_42_2)
	local var_42_0 = arg_42_1:GetDispatcherRecallName()

	arg_42_0:ClearCheckDispatcher()

	arg_42_0.checkTimer = Timer.New(function()
		if pg.NewStoryMgr.GetInstance():CheckStoryEvent(var_42_0) then
			local var_43_0 = pg.NewStoryMgr.GetInstance():GetStoryEventArg(var_42_0)

			if var_43_0 then
				existCall(var_43_0.notifiCallback)
			end

			if var_43_0 and var_43_0.optionIndex then
				arg_42_0:SetBranchCode(arg_42_0.script, arg_42_1, var_43_0.optionIndex)

				arg_42_0.skipOption = true
			end

			if arg_42_1:ShouldHideUI() then
				setActive(arg_42_0._tf, true)
			end

			arg_42_0:ClearCheckDispatcher()
			arg_42_2()
		end
	end, 1, -1)

	arg_42_0.checkTimer:Start()
	arg_42_0.checkTimer.func()
end

function var_0_0.ClearCheckDispatcher(arg_44_0)
	if arg_44_0.checkTimer then
		arg_44_0.checkTimer:Stop()

		arg_44_0.checkTimer = nil
	end
end

function var_0_0.TriggerEventIfAuto(arg_45_0, arg_45_1)
	if not arg_45_0:ShouldAutoTrigger() then
		return
	end

	arg_45_0:UnscaleDelayCall(arg_45_1, function()
		if not arg_45_0.autoNext then
			setButtonEnabled(arg_45_0._go, true)

			return
		end

		triggerButton(arg_45_0._go)
	end)
end

function var_0_0.TriggerOptionIfAuto(arg_47_0, arg_47_1, arg_47_2)
	if not arg_47_0:ShouldAutoTrigger() then
		return
	end

	if not arg_47_2 or not arg_47_2:ExistOption() then
		return
	end

	arg_47_0:UnscaleDelayCall(arg_47_1, function()
		if not arg_47_0.autoNext then
			return
		end

		local var_48_0 = arg_47_2:GetOptionIndexByAutoSel()

		if var_48_0 ~= nil then
			local var_48_1 = arg_47_0:GetOptionContainer(arg_47_2).container:GetChild(var_48_0 - 1)

			triggerButton(var_48_1)
		end
	end)
end

function var_0_0.ShouldAutoTrigger(arg_49_0)
	if arg_49_0.pause or arg_49_0.stop then
		return false
	end

	return arg_49_0.autoNext
end

function var_0_0.CanSkip(arg_50_0)
	return arg_50_0.step and not arg_50_0.step:IsImport()
end

function var_0_0.CancelAuto(arg_51_0)
	arg_51_0.autoNext = false
end

function var_0_0.NextOne(arg_52_0)
	arg_52_0.timeScale = 0.0001

	if arg_52_0.stage == var_0_1 then
		arg_52_0.autoNext = true
	elseif arg_52_0.stage == var_0_5 then
		arg_52_0.autoNext = true

		arg_52_0:TriggerEventIfAuto(0)
	elseif arg_52_0.stage == var_0_6 then
		arg_52_0:TriggerOptionIfAuto(0, arg_52_0.step)
	end
end

function var_0_0.NextOneImmediately(arg_53_0)
	local var_53_0 = arg_53_0.callback

	if var_53_0 then
		arg_53_0:ClearAnimation()
		arg_53_0:Clear()
		var_53_0()
	end
end

function var_0_0.SetLocation(arg_54_0, arg_54_1, arg_54_2)
	if not arg_54_1:ExistLocation() then
		arg_54_0.locationAniEvent:SetEndEvent(nil)
		arg_54_2()

		return
	end

	setActive(arg_54_0.locationTr, true)

	local var_54_0 = arg_54_1:GetLocation()

	arg_54_0.locationTxt.text = var_54_0.text

	local function var_54_1()
		arg_54_0:DelayCall(var_54_0.time, function()
			arg_54_0.locationAnim:Play("anim_newstoryUI_iocation_out")

			arg_54_0.locationStatus = var_0_11
		end)
	end

	arg_54_0.locationAniEvent:SetEndEvent(function()
		if arg_54_0.locationStatus == var_0_10 then
			var_54_1()
			arg_54_2()
		elseif arg_54_0.locationStatus == var_0_11 then
			setActive(arg_54_0.locationTr, false)

			arg_54_0.locationStatus = var_0_9
		end
	end)
	arg_54_0.locationAnim:Play("anim_newstoryUI_iocation_in")

	arg_54_0.locationStatus = var_0_10
end

function var_0_0.UpdateIcon(arg_58_0, arg_58_1, arg_58_2)
	if not arg_58_1:ExistIcon() then
		setActive(arg_58_0.iconImage.gameObject, false)
		arg_58_2()

		return
	end

	local var_58_0 = arg_58_1:GetIconData()

	arg_58_0.iconImage.sprite = LoadSprite(var_58_0.image)

	arg_58_0.iconImage:SetNativeSize()

	local var_58_1 = arg_58_0.iconImage.gameObject.transform

	if var_58_0.pos then
		var_58_1.localPosition = Vector3(var_58_0.pos[1], var_58_0.pos[2], 0)
	else
		var_58_1.localPosition = Vector3.one
	end

	var_58_1.localScale = Vector3(var_58_0.scale or 1, var_58_0.scale or 1, 1)

	setActive(arg_58_0.iconImage.gameObject, true)
	arg_58_2()
end

function var_0_0.UpdateOptionTxt(arg_59_0, arg_59_1, arg_59_2, arg_59_3, arg_59_4)
	local var_59_0 = arg_59_2:GetComponent(typeof(LayoutElement))
	local var_59_1 = arg_59_2:Find("content")

	if arg_59_1 then
		local var_59_2 = GetPerceptualSize(arg_59_3)
		local var_59_3 = arg_59_2:Find("content_max")
		local var_59_4 = var_59_2 >= 17
		local var_59_5 = var_59_4 and var_59_3 or var_59_1

		setActive(var_59_1, not var_59_4)
		setActive(var_59_3, var_59_4)
		setText(var_59_5:Find("Text"), arg_59_3)

		var_59_0.preferredHeight = var_59_5.rect.height
	else
		setText(var_59_1:Find("Text"), arg_59_3)

		var_59_0.preferredHeight = var_59_1.rect.height
	end

	if var_59_1:Find("type1") then
		setActive(var_59_1:Find("type1"), arg_59_4 and arg_59_4 == 1)
	end

	if var_59_1:Find("type2") then
		setActive(var_59_1:Find("type2"), arg_59_4 and arg_59_4 == 2)
	end
end

function var_0_0.InitBranches(arg_60_0, arg_60_1, arg_60_2, arg_60_3, arg_60_4)
	local var_60_0 = false
	local var_60_1 = arg_60_2:GetOptions()
	local var_60_2, var_60_3 = arg_60_0:GetOptionContainer(arg_60_2)
	local var_60_4 = arg_60_2:GetId()
	local var_60_5 = arg_60_0.branchCodeList[var_60_4] or {}
	local var_60_6 = GetOrAddComponent(var_60_2.container, typeof(CanvasGroup))

	var_60_6.blocksRaycasts = true
	arg_60_0.selectedBranchID = nil

	var_60_2:make(function(arg_61_0, arg_61_1, arg_61_2)
		if arg_61_0 == UIItemList.EventUpdate then
			local var_61_0 = arg_61_2
			local var_61_1 = var_60_1[arg_61_1 + 1][1]
			local var_61_2 = var_60_1[arg_61_1 + 1][2]
			local var_61_3 = var_60_1[arg_61_1 + 1][3]
			local var_61_4 = table.contains(var_60_5, var_61_2)

			onButton(arg_60_0, var_61_0, function()
				if arg_60_0.pause or arg_60_0.stop then
					return
				end

				if not var_60_0 then
					return
				end

				arg_60_0.selectedBranchID = arg_61_1

				arg_60_0:SetBranchCode(arg_60_1, arg_60_2, var_61_2)
				pg.NewStoryMgr.GetInstance():TrackingOption(arg_60_2:GetOptionIndex(), var_61_2)

				local var_62_0 = arg_61_2:GetComponent(typeof(Animation))

				if var_62_0 then
					var_60_6.blocksRaycasts = false

					var_62_0:Play(arg_60_0.script:GetAnimPrefix() .. "confirm")
					arg_61_2:GetComponent(typeof(DftAniEvent)):SetEndEvent(function()
						setActive(arg_60_0.optionsCg.gameObject, false)

						var_60_6.blocksRaycasts = true

						arg_60_3(var_61_1)
					end)
				else
					setActive(arg_60_0.optionsCg.gameObject, false)
					arg_60_3(var_61_1)
				end

				arg_60_0:HideBranchesWithoutSelected(arg_60_2)
			end, SFX_PANEL)
			setButtonEnabled(var_61_0, not var_61_4)

			GetOrAddComponent(arg_61_2, typeof(CanvasGroup)).alpha = var_61_4 and 0.5 or 1

			arg_60_0:UpdateOptionTxt(var_60_3, var_61_0, var_61_1, var_61_3)

			if arg_60_0.script:IsDialogueStyle2() then
				setActive(var_61_0, arg_61_1 == 0)

				if arg_61_1 > 0 then
					LeanTween.delayedCall(0.066 * arg_61_1, System.Action(function()
						setActive(var_61_0, true)
					end))
				end
			end
		end
	end)
	var_60_2:align(#var_60_1)
	arg_60_0:ShowBranches(arg_60_2, function()
		var_60_0 = true

		if arg_60_4 then
			arg_60_4()
		end
	end)
end

function var_0_0.SetBranchCode(arg_66_0, arg_66_1, arg_66_2, arg_66_3)
	arg_66_2:SetBranchCode(arg_66_3)
	arg_66_1:SetBranchCode(arg_66_3)

	local var_66_0 = arg_66_2:GetId()

	if not arg_66_0.branchCodeList[var_66_0] then
		arg_66_0.branchCodeList[var_66_0] = {}
	end

	table.insert(arg_66_0.branchCodeList[var_66_0], arg_66_3)
end

function var_0_0.ShowBranches(arg_67_0, arg_67_1, arg_67_2)
	setActive(arg_67_0.optionsCg.gameObject, true)

	local var_67_0 = arg_67_0:GetOptionContainer(arg_67_1)

	for iter_67_0 = 0, var_67_0.container.childCount - 1 do
		local var_67_1 = var_67_0.container:GetChild(iter_67_0):GetComponent(typeof(Animation))

		if var_67_1 then
			var_67_1:Play(arg_67_0.script:GetAnimPrefix() .. "in")
		end
	end

	arg_67_2()
end

function var_0_0.HideBranchesWithoutSelected(arg_68_0, arg_68_1)
	local var_68_0 = arg_68_0:GetOptionContainer(arg_68_1)

	for iter_68_0 = 0, var_68_0.container.childCount - 1 do
		if iter_68_0 ~= arg_68_0.selectedBranchID then
			local var_68_1 = var_68_0.container:GetChild(iter_68_0):GetComponent(typeof(Animation))

			if var_68_1 then
				var_68_1:Play(arg_68_0.script:GetAnimPrefix() .. "unselected")
			end
		end
	end
end

function var_0_0.StartMoveNode(arg_69_0, arg_69_1, arg_69_2)
	if not arg_69_1:ExistMovableNode() then
		arg_69_2()

		return
	end

	local var_69_0 = arg_69_1:GetMovableNode()
	local var_69_1 = {}
	local var_69_2 = {}

	for iter_69_0, iter_69_1 in pairs(var_69_0) do
		table.insert(var_69_1, function(arg_70_0)
			arg_69_0:LoadMovableNode(iter_69_1, function(arg_71_0)
				var_69_2[iter_69_0] = arg_71_0

				arg_70_0()
			end)
		end)
	end

	parallelAsync(var_69_1, function()
		arg_69_0:MoveAllNode(arg_69_1, var_69_2, var_69_0)
		arg_69_2()
	end)
end

function var_0_0.MoveAllNode(arg_73_0, arg_73_1, arg_73_2, arg_73_3)
	local var_73_0 = {}

	for iter_73_0, iter_73_1 in pairs(arg_73_2) do
		table.insert(var_73_0, function(arg_74_0)
			local var_74_0 = arg_73_3[iter_73_0]
			local var_74_1 = var_74_0.path
			local var_74_2 = var_74_0.time
			local var_74_3 = var_74_0.easeType
			local var_74_4 = var_74_0.delay

			arg_73_0:moveLocalPath(iter_73_1, var_74_1, var_74_2, var_74_4, var_74_3, arg_74_0)
		end)
	end

	arg_73_0.moveTargets = arg_73_2

	parallelAsync(var_73_0, function()
		arg_73_0:ClearMoveNodes(arg_73_1)
	end)
end

local function var_0_12(arg_76_0, arg_76_1, arg_76_2, arg_76_3, arg_76_4)
	PoolMgr.GetInstance():GetSpineChar(arg_76_1, true, function(arg_77_0)
		arg_77_0.transform:SetParent(arg_76_0.movePanel)

		local var_77_0 = arg_76_2.scale

		arg_77_0.transform.localScale = Vector3(var_77_0, var_77_0, 0)
		arg_77_0.transform.localPosition = arg_76_3

		arg_77_0:GetComponent(typeof(SpineAnimUI)):SetAction(arg_76_2.action, 0)

		arg_77_0.name = arg_76_1

		if arg_76_4 then
			arg_76_4(arg_77_0)
		end
	end)
end

local function var_0_13(arg_78_0, arg_78_1, arg_78_2, arg_78_3)
	local var_78_0 = GameObject.New("movable")

	var_78_0.transform:SetParent(arg_78_0.movePanel)

	var_78_0.transform.localScale = Vector3.zero

	local var_78_1 = GetOrAddComponent(var_78_0, typeof(RectTransform))
	local var_78_2 = GetOrAddComponent(var_78_0, typeof(Image))

	LoadSpriteAsync(arg_78_1, function(arg_79_0)
		var_78_2.sprite = arg_79_0

		var_78_2:SetNativeSize()

		var_78_1.localScale = Vector3.one
		var_78_1.localPosition = arg_78_2

		arg_78_3(var_78_1.gameObject)
	end)
end

function var_0_0.LoadMovableNode(arg_80_0, arg_80_1, arg_80_2)
	local var_80_0 = arg_80_1.path[1] or Vector3.zero

	if arg_80_1.isSpine then
		var_0_12(arg_80_0, arg_80_1.name, arg_80_1.spineData, var_80_0, arg_80_2)
	else
		var_0_13(arg_80_0, arg_80_1.name, var_80_0, arg_80_2)
	end
end

function var_0_0.ClearMoveNodes(arg_81_0, arg_81_1)
	if not arg_81_1:ExistMovableNode() then
		return
	end

	if arg_81_0.movePanel.childCount <= 0 then
		return
	end

	for iter_81_0, iter_81_1 in ipairs(arg_81_0.moveTargets or {}) do
		if iter_81_1:GetComponent(typeof(SpineAnimUI)) ~= nil then
			PoolMgr.GetInstance():ReturnSpineChar(iter_81_1.name, iter_81_1.gameObject)
		else
			Destroy(arg_81_0.movePanel:GetChild(iter_81_0 - 1))
		end
	end

	arg_81_0.moveTargets = {}
end

function var_0_0.FadeOutStory(arg_82_0, arg_82_1, arg_82_2)
	if not arg_82_1:ShouldFadeout() then
		arg_82_2()

		return
	end

	local var_82_0 = arg_82_1:GetFadeoutTime()

	if not arg_82_1:ShouldWaitFadeout() then
		arg_82_0:fadeTransform(arg_82_0._go, 1, 0.3, var_82_0, true)
		arg_82_2()
	else
		arg_82_0:fadeTransform(arg_82_0._go, 1, 0.3, var_82_0, true, arg_82_2)
	end
end

function var_0_0.GetFadeColor(arg_83_0, arg_83_1)
	local var_83_0 = {}
	local var_83_1 = {}
	local var_83_2 = arg_83_1:GetComponentsInChildren(typeof(Image))

	for iter_83_0 = 0, var_83_2.Length - 1 do
		local var_83_3 = var_83_2[iter_83_0]
		local var_83_4 = {
			name = "_Color",
			color = Color.white
		}

		if var_83_3.material.shader.name == "UI/GrayScale" then
			var_83_4 = {
				name = "_GrayScale",
				color = Color.New(0.21176470588235294, 0.7137254901960784, 0.07058823529411765)
			}
		elseif var_83_3.material.shader.name == "UI/Line_Add_Blue" then
			var_83_4 = {
				name = "_GrayScale",
				color = Color.New(1, 1, 1, 0.5882352941176471)
			}
		end

		table.insert(var_83_1, var_83_4)

		if var_83_3.material == var_83_3.defaultGraphicMaterial then
			var_83_3.material = Material.Instantiate(var_83_3.defaultGraphicMaterial)
		end

		table.insert(var_83_0, var_83_3.material)
	end

	return var_83_0, var_83_1
end

function var_0_0._SetFadeColor(arg_84_0, arg_84_1, arg_84_2, arg_84_3)
	for iter_84_0, iter_84_1 in ipairs(arg_84_1) do
		if not IsNil(iter_84_1) then
			iter_84_1:SetColor(arg_84_2[iter_84_0].name, arg_84_2[iter_84_0].color * Color.New(arg_84_3, arg_84_3, arg_84_3))
		end
	end
end

function var_0_0.SetFadeColor(arg_85_0, arg_85_1, arg_85_2)
	local var_85_0, var_85_1 = arg_85_0:GetFadeColor(arg_85_1)

	arg_85_0:_SetFadeColor(var_85_0, var_85_1, arg_85_2)
end

function var_0_0._RevertFadeColor(arg_86_0, arg_86_1, arg_86_2)
	arg_86_0:_SetFadeColor(arg_86_1, arg_86_2, 1)
end

function var_0_0.RevertFadeColor(arg_87_0, arg_87_1)
	local var_87_0, var_87_1 = arg_87_0:GetFadeColor(arg_87_1)

	arg_87_0:_RevertFadeColor(var_87_0, var_87_1)
end

function var_0_0.fadeTransform(arg_88_0, arg_88_1, arg_88_2, arg_88_3, arg_88_4, arg_88_5, arg_88_6)
	if arg_88_4 <= 0 then
		if arg_88_6 then
			arg_88_6()
		end

		return
	end

	local var_88_0, var_88_1 = arg_88_0:GetFadeColor(arg_88_1)

	LeanTween.value(go(arg_88_1), arg_88_2, arg_88_3, arg_88_4):setOnUpdate(System.Action_float(function(arg_89_0)
		arg_88_0:_SetFadeColor(var_88_0, var_88_1, arg_89_0)
	end)):setOnComplete(System.Action(function()
		if arg_88_5 then
			arg_88_0:_RevertFadeColor(var_88_0, var_88_1)
		end

		if arg_88_6 then
			arg_88_6()
		end
	end))
end

function var_0_0.setPaintingAlpha(arg_91_0, arg_91_1, arg_91_2)
	local var_91_0 = {}
	local var_91_1 = {}
	local var_91_2 = arg_91_1:GetComponentsInChildren(typeof(Image))

	for iter_91_0 = 0, var_91_2.Length - 1 do
		local var_91_3 = var_91_2[iter_91_0]
		local var_91_4 = {
			name = "_Color",
			color = Color.white
		}

		if var_91_3.material.shader.name == "UI/GrayScale" then
			var_91_4 = {
				name = "_GrayScale",
				color = Color.New(0.21176470588235294, 0.7137254901960784, 0.07058823529411765)
			}
		elseif var_91_3.material.shader.name == "UI/Line_Add_Blue" then
			var_91_4 = {
				name = "_GrayScale",
				color = Color.New(1, 1, 1, 0.5882352941176471)
			}
		end

		table.insert(var_91_1, var_91_4)

		if var_91_3.material == var_91_3.defaultGraphicMaterial then
			var_91_3.material = Material.Instantiate(var_91_3.defaultGraphicMaterial)
		end

		table.insert(var_91_0, var_91_3.material)
	end

	for iter_91_1, iter_91_2 in ipairs(var_91_0) do
		if not IsNil(iter_91_2) then
			iter_91_2:SetColor(var_91_1[iter_91_1].name, var_91_1[iter_91_1].color * Color.New(arg_91_2, arg_91_2, arg_91_2))
		end
	end
end

function var_0_0.RegisetEvent(arg_92_0, arg_92_1, arg_92_2)
	setButtonEnabled(arg_92_0._go, not arg_92_0.autoNext)
	onButton(arg_92_0, arg_92_0._go, function()
		if arg_92_0.pause or arg_92_0.stop then
			return
		end

		removeOnButton(arg_92_0._go)
		arg_92_2()
	end, SFX_PANEL)
end

function var_0_0.flashEffect(arg_94_0, arg_94_1, arg_94_2, arg_94_3, arg_94_4, arg_94_5, arg_94_6)
	arg_94_0.flashImg.color = arg_94_4 and Color(0, 0, 0) or Color(1, 1, 1)
	arg_94_0.flashCg.alpha = arg_94_1

	setActive(arg_94_0.flash, true)
	arg_94_0:TweenValueForcanvasGroup(arg_94_0.flashCg, arg_94_1, arg_94_2, arg_94_3, arg_94_5, arg_94_6)
end

function var_0_0.Flashout(arg_95_0, arg_95_1, arg_95_2)
	local var_95_0, var_95_1, var_95_2, var_95_3 = arg_95_1:GetFlashoutData()

	if not var_95_0 then
		arg_95_2()

		return
	end

	arg_95_0:flashEffect(var_95_0, var_95_1, var_95_2, var_95_3, 0, arg_95_2)
end

function var_0_0.flashin(arg_96_0, arg_96_1, arg_96_2)
	local var_96_0, var_96_1, var_96_2, var_96_3, var_96_4 = arg_96_1:GetFlashinData()

	if not var_96_0 then
		arg_96_2()

		return
	end

	arg_96_0:flashEffect(var_96_0, var_96_1, var_96_2, var_96_3, var_96_4, arg_96_2)
end

function var_0_0.UpdateBg(arg_97_0, arg_97_1)
	if arg_97_1:ShouldBgGlitchArt() then
		arg_97_0:SetBgGlitchArt(arg_97_1)
	else
		local var_97_0 = arg_97_1:GetBgName()

		if var_97_0 then
			setActive(arg_97_0.bgPanel, true)

			arg_97_0.bgPanelCg.alpha = 1

			local var_97_1 = arg_97_0.bgImage

			var_97_1.color = Color.New(1, 1, 1)
			var_97_1.sprite = arg_97_0:GetBg(var_97_0)
		end

		local var_97_2 = arg_97_1:GetBgShadow()

		if var_97_2 then
			local var_97_3 = arg_97_0.bgImage

			arg_97_0:TweenValue(var_97_3, var_97_2[1], var_97_2[2], var_97_2[3], 0, function(arg_98_0)
				var_97_3.color = Color.New(arg_98_0, arg_98_0, arg_98_0)
			end, nil)
		end

		if arg_97_1:IsBlackBg() then
			setActive(arg_97_0.curtain, true)

			arg_97_0.curtainCg.alpha = 1
		end

		local var_97_4, var_97_5 = arg_97_1:IsBlackFrontGround()

		if var_97_4 then
			arg_97_0.curtainFCg.alpha = var_97_5
		end

		setActive(arg_97_0.curtainF, var_97_4)
	end

	arg_97_0:ApplyOldPhotoEffect(arg_97_1)
	arg_97_0:OnBgUpdate(arg_97_1)

	local var_97_6 = arg_97_1:GetBgColor()

	arg_97_0.curtain:GetComponent(typeof(Image)).color = var_97_6
end

function var_0_0.ApplyOldPhotoEffect(arg_99_0, arg_99_1)
	local var_99_0 = arg_99_1:OldPhotoEffect()
	local var_99_1 = var_99_0 ~= nil

	setActive(arg_99_0.oldPhoto.gameObject, var_99_1)

	if var_99_1 then
		if type(var_99_0) == "table" then
			arg_99_0.oldPhoto.color = Color.New(var_99_0[1], var_99_0[2], var_99_0[3], var_99_0[4])
		else
			arg_99_0.oldPhoto.color = Color.New(0.62, 0.58, 0.14, 0.36)
		end
	end
end

function var_0_0.SetBgGlitchArt(arg_100_0, arg_100_1)
	setActive(arg_100_0.bgPanel, false)
	setActive(arg_100_0.bgGlitch, true)
end

function var_0_0.GetBg(arg_101_0, arg_101_1)
	if not arg_101_0.bgs[arg_101_1] then
		arg_101_0.bgs[arg_101_1] = LoadSprite("bg/" .. arg_101_1)
	end

	return arg_101_0.bgs[arg_101_1]
end

function var_0_0.LoadEffects(arg_102_0, arg_102_1, arg_102_2)
	local var_102_0 = arg_102_1:GetEffects()

	if #var_102_0 <= 0 then
		arg_102_2()

		return
	end

	local var_102_1 = {}

	for iter_102_0, iter_102_1 in ipairs(var_102_0) do
		local var_102_2 = iter_102_1.name
		local var_102_3 = iter_102_1.active
		local var_102_4 = iter_102_1.interlayer
		local var_102_5 = iter_102_1.center
		local var_102_6 = iter_102_1.adapt
		local var_102_7 = arg_102_0.effectPanel:Find(var_102_2) or arg_102_0.centerPanel:Find(var_102_2)

		if var_102_7 then
			setActive(var_102_7, var_102_3)
			setParent(var_102_7, var_102_5 and arg_102_0.centerPanel or arg_102_0.effectPanel.transform)

			if var_102_4 then
				arg_102_0:UpdateEffectInterLayer(var_102_2, var_102_7)
			end

			if not var_102_3 then
				arg_102_0:ClearEffectInterlayer(var_102_2)
			elseif isActive(var_102_7) then
				setActive(var_102_7, false)
				setActive(var_102_7, true)
			end

			if var_102_6 then
				arg_102_0:AdaptEffect(var_102_7)
			end
		else
			local var_102_8 = ""

			if checkABExist("ui/" .. var_102_2) then
				var_102_8 = "ui"
			elseif checkABExist("effect/" .. var_102_2) then
				var_102_8 = "effect"
			end

			if var_102_8 and var_102_8 ~= "" then
				table.insert(var_102_1, function(arg_103_0)
					LoadAndInstantiateAsync(var_102_8, var_102_2, function(arg_104_0)
						setParent(arg_104_0, var_102_5 and arg_102_0.centerPanel or arg_102_0.effectPanel.transform)

						arg_104_0.transform.localScale = Vector3.one

						setActive(arg_104_0, var_102_3)

						arg_104_0.name = var_102_2

						if var_102_4 then
							arg_102_0:UpdateEffectInterLayer(var_102_2, arg_104_0)
						end

						if var_102_3 == false then
							arg_102_0:ClearEffectInterlayer(var_102_2)
						end

						if var_102_6 then
							arg_102_0:AdaptEffect(arg_104_0)
						end

						arg_103_0()
					end)
				end)
			else
				originalPrint("not found effect", var_102_2)
			end
		end
	end

	parallelAsync(var_102_1, arg_102_2)
end

function var_0_0.AdaptEffect(arg_105_0, arg_105_1)
	local var_105_0 = 1.7777777777777777
	local var_105_1 = pg.UIMgr.GetInstance().OverlayMain.parent.sizeDelta
	local var_105_2 = var_105_1.x / var_105_1.y
	local var_105_3 = 1

	if var_105_0 < var_105_2 then
		var_105_3 = var_105_2 / var_105_0
	else
		var_105_3 = var_105_0 / var_105_2
	end

	tf(arg_105_1).localScale = Vector3(var_105_3, var_105_3, var_105_3)
end

function var_0_0.UpdateEffectInterLayer(arg_106_0, arg_106_1, arg_106_2)
	local var_106_0 = arg_106_0._go:GetComponent(typeof(Canvas)).sortingOrder
	local var_106_1 = arg_106_2:GetComponentsInChildren(typeof("UnityEngine.ParticleSystemRenderer"))

	for iter_106_0 = 1, var_106_1.Length - 1 do
		local var_106_2 = var_106_1[iter_106_0 - 1]
		local var_106_3 = ReflectionHelp.RefGetProperty(typeof("UnityEngine.ParticleSystemRenderer"), "sortingOrder", var_106_2)

		if var_106_0 < var_106_3 then
			var_106_0 = var_106_3
		end
	end

	local var_106_4 = var_106_0 + 1
	local var_106_5 = GetOrAddComponent(arg_106_0.actorTr, typeof(Canvas))

	var_106_5.overrideSorting = true
	var_106_5.sortingOrder = var_106_4

	local var_106_6 = GetOrAddComponent(arg_106_0.frontTr, typeof(Canvas))

	var_106_6.overrideSorting = true
	var_106_6.sortingOrder = var_106_4 + 1
	arg_106_0.activeInterLayer = arg_106_1

	GetOrAddComponent(arg_106_0.frontTr, typeof(GraphicRaycaster))
end

function var_0_0.ClearEffectInterlayer(arg_107_0, arg_107_1)
	if arg_107_0.activeInterLayer == arg_107_1 then
		RemoveComponent(arg_107_0.actorTr, "Canvas")
		RemoveComponent(arg_107_0.frontTr, "Canvas")
		RemoveComponent(arg_107_0.frontTr, "GraphicRaycaster")

		arg_107_0.activeInterLayer = nil
	end
end

function var_0_0.ClearEffects(arg_108_0)
	removeAllChildren(arg_108_0.effectPanel)
	removeAllChildren(arg_108_0.centerPanel)

	if arg_108_0.activeInterLayer ~= nil then
		arg_108_0:ClearEffectInterlayer(arg_108_0.activeInterLayer)
	end
end

function var_0_0.PlaySoundEffect(arg_109_0, arg_109_1)
	if arg_109_1:ShouldPlaySoundEffect() then
		local var_109_0, var_109_1 = arg_109_1:GetSoundeffect()

		arg_109_0:DelayCall(var_109_1, function()
			pg.CriMgr.GetInstance():PlaySoundEffect_V3(var_109_0)
		end)
	end

	if arg_109_1:ShouldPlayVoice() then
		arg_109_0:PlayVoice(arg_109_1)
	elseif arg_109_1:ShouldStopVoice() then
		arg_109_0:StopVoice()
	end
end

function var_0_0.StopVoice(arg_111_0)
	if arg_111_0.currentVoice then
		arg_111_0.currentVoice:Stop(true)

		arg_111_0.currentVoice = nil
	end
end

function var_0_0.PlayVoice(arg_112_0, arg_112_1)
	if arg_112_0.voiceDelayTimer then
		arg_112_0.voiceDelayTimer:Stop()

		arg_112_0.voiceDelayTimer = nil
	end

	arg_112_0:StopVoice()

	local var_112_0, var_112_1 = arg_112_1:GetVoice()
	local var_112_2

	var_112_2 = arg_112_0:CreateDelayTimer(var_112_1, function()
		if var_112_2 then
			var_112_2:Stop()
		end

		if arg_112_0.voiceDelayTimer then
			arg_112_0.voiceDelayTimer = nil
		end

		pg.CriMgr.GetInstance():PlaySoundEffect_V3(var_112_0, function(arg_114_0)
			if arg_114_0 then
				arg_112_0.currentVoice = arg_114_0.playback
			end
		end)
	end)
	arg_112_0.voiceDelayTimer = var_112_2
end

function var_0_0.Reset(arg_115_0, arg_115_1, arg_115_2, arg_115_3)
	setActive(arg_115_0.spAnimPanel, false)
	setActive(arg_115_0.castPanel, false)
	setActive(arg_115_0.bgPanel, false)

	if arg_115_1 and arg_115_1:IsDialogueMode() and arg_115_2 and arg_115_2:IsDialogueMode() then
		-- block empty
	else
		setActive(arg_115_0.dialoguePanel, false)
	end

	setActive(arg_115_0.asidePanel, false)
	setActive(arg_115_0.curtain, false)
	setActive(arg_115_0.flash, false)
	setActive(arg_115_0.optionsCg.gameObject, false)
	setActive(arg_115_0.bgGlitch, false)
	setActive(arg_115_0.locationTr, false)

	arg_115_0.locationTr.localPosition = arg_115_0.locationTrPos
	arg_115_0.locationStatus = var_0_9
	arg_115_0.flashCg.alpha = 1
	arg_115_0.goCG.alpha = 1

	arg_115_0.animationPlayer:Stop()
	arg_115_0:OnReset(arg_115_1, arg_115_2, arg_115_3)
end

function var_0_0.Clear(arg_116_0, arg_116_1)
	if arg_116_0.step then
		arg_116_0:ClearMoveNodes(arg_116_0.step)
	end

	arg_116_0.bgs = {}
	arg_116_0.skipOption = nil
	arg_116_0.step = nil
	arg_116_0.goCG.alpha = 1
	arg_116_0.callback = nil
	arg_116_0.autoNext = nil
	arg_116_0.script = nil
	arg_116_0.bgImage.sprite = nil

	arg_116_0:OnClear()

	if arg_116_1 then
		arg_116_1()
	end

	pg.DelegateInfo.New(arg_116_0)
end

function var_0_0.StoryEnd(arg_117_0)
	setActive(arg_117_0.iconImage.gameObject, false)

	arg_117_0.iconImage.sprite = nil
	arg_117_0.branchCodeList = {}
	arg_117_0.stop = false
	arg_117_0.pause = false

	if arg_117_0.voiceDelayTimer then
		arg_117_0.voiceDelayTimer:Stop()

		arg_117_0.voiceDelayTimer = nil
	end

	if arg_117_0.currentVoice then
		arg_117_0.currentVoice:Stop(true)

		arg_117_0.currentVoice = nil
	end

	arg_117_0:ClearCheckDispatcher()
	arg_117_0:ClearEffects()
	arg_117_0:Clear()
	arg_117_0:OnEnd()
end

function var_0_0.PlayBgm(arg_118_0, arg_118_1)
	if arg_118_1:ShouldStopBgm() then
		arg_118_0:StopBgm()
	end

	if arg_118_1:ShoulePlayBgm() then
		local var_118_0, var_118_1, var_118_2 = arg_118_1:GetBgmData()

		arg_118_0:DelayCall(var_118_1, function()
			arg_118_0:RevertBgmVolume()
			pg.BgmMgr.GetInstance():TempPlay(var_118_0)
		end)

		if var_118_2 and var_118_2 > 0 then
			arg_118_0.defaultBgmVolume = pg.CriMgr.GetInstance():getBGMVolume()

			pg.CriMgr.GetInstance():setBGMVolume(var_118_2)
		end
	end
end

function var_0_0.StopBgm(arg_120_0, arg_120_1)
	arg_120_0:RevertBgmVolume()
	pg.BgmMgr.GetInstance():StopPlay()
end

function var_0_0.RevertBgmVolume(arg_121_0)
	if arg_121_0.defaultBgmVolume then
		pg.CriMgr.GetInstance():setBGMVolume(arg_121_0.defaultBgmVolume)

		arg_121_0.defaultBgmVolume = nil
	end
end

function var_0_0.StartUIAnimations(arg_122_0, arg_122_1, arg_122_2)
	parallelAsync({
		function(arg_123_0)
			arg_122_0:StartBlinkAnimation(arg_122_1, arg_123_0)
		end,
		function(arg_124_0)
			arg_122_0:StartBlinkWithColorAnimation(arg_122_1, arg_124_0)
		end,
		function(arg_125_0)
			arg_122_0:OnStartUIAnimations(arg_122_1, arg_125_0)
		end
	}, arg_122_2)
end

function var_0_0.StartBlinkAnimation(arg_126_0, arg_126_1, arg_126_2)
	if arg_126_1:ShouldBlink() then
		local var_126_0 = arg_126_1:GetBlinkData()
		local var_126_1 = var_126_0.black
		local var_126_2 = var_126_0.number
		local var_126_3 = var_126_0.dur
		local var_126_4 = var_126_0.delay
		local var_126_5 = var_126_0.alpha[1]
		local var_126_6 = var_126_0.alpha[2]
		local var_126_7 = var_126_0.wait

		arg_126_0.flashImg.color = var_126_1 and Color(0, 0, 0) or Color(1, 1, 1)

		setActive(arg_126_0.flash, true)

		local var_126_8 = {}

		for iter_126_0 = 1, var_126_2 do
			table.insert(var_126_8, function(arg_127_0)
				arg_126_0:TweenAlpha(arg_126_0.flash, var_126_5, var_126_6, var_126_3 / 2, 0, function()
					arg_126_0:TweenAlpha(arg_126_0.flash, var_126_6, var_126_5, var_126_3 / 2, var_126_7, arg_127_0)
				end)
			end)
		end

		seriesAsync(var_126_8, function()
			setActive(arg_126_0.flash, false)
		end)
	end

	arg_126_2()
end

function var_0_0.StartBlinkWithColorAnimation(arg_130_0, arg_130_1, arg_130_2)
	if arg_130_1:ShouldBlinkWithColor() then
		local var_130_0 = arg_130_1:GetBlinkWithColorData()
		local var_130_1 = var_130_0.color
		local var_130_2 = var_130_0.alpha

		arg_130_0.flashImg.color = Color(var_130_1[1], var_130_1[2], var_130_1[3], var_130_1[4])

		setActive(arg_130_0.flash, true)

		local var_130_3 = {}

		for iter_130_0, iter_130_1 in ipairs(var_130_2) do
			local var_130_4 = iter_130_1[1]
			local var_130_5 = iter_130_1[2]
			local var_130_6 = iter_130_1[3]
			local var_130_7 = iter_130_1[4]

			table.insert(var_130_3, function(arg_131_0)
				arg_130_0:TweenValue(arg_130_0.flash, var_130_4, var_130_5, var_130_6, var_130_7, function(arg_132_0)
					arg_130_0.flashCg.alpha = arg_132_0
				end, arg_131_0)
			end)
		end

		parallelAsync(var_130_3, function()
			setActive(arg_130_0.flash, false)
		end)
	end

	arg_130_2()
end

function var_0_0.findTF(arg_134_0, arg_134_1, arg_134_2)
	assert(arg_134_0._tf, "transform should exist")

	return findTF(arg_134_2 or arg_134_0._tf, arg_134_1)
end

function var_0_0.OnStart(arg_135_0, arg_135_1)
	return
end

function var_0_0.OnReset(arg_136_0, arg_136_1, arg_136_2, arg_136_3)
	arg_136_3()
end

function var_0_0.OnBgUpdate(arg_137_0, arg_137_1)
	return
end

function var_0_0.OnInit(arg_138_0, arg_138_1, arg_138_2, arg_138_3)
	if arg_138_3 then
		arg_138_3()
	end
end

function var_0_0.OnStartUIAnimations(arg_139_0, arg_139_1, arg_139_2)
	if arg_139_2 then
		arg_139_2()
	end
end

function var_0_0.OnEnter(arg_140_0, arg_140_1, arg_140_2, arg_140_3)
	if arg_140_3 then
		arg_140_3()
	end
end

function var_0_0.OnWillExit(arg_141_0, arg_141_1, arg_141_2, arg_141_3)
	arg_141_3()
end

function var_0_0.OnWillClear(arg_142_0, arg_142_1)
	return
end

function var_0_0.OnClear(arg_143_0)
	return
end

function var_0_0.OnEnd(arg_144_0)
	return
end

return var_0_0
