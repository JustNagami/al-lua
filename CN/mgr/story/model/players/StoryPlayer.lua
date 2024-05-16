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

		return arg_4_0.optionLUIlist, false
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
					arg_8_0:flashin(var_8_0, arg_12_0)
				end
			}, arg_9_0)
		end,
		function(arg_13_0)
			if var_8_2 then
				arg_8_1:StopSkip()
			end

			var_8_2 = false

			arg_13_0()
		end,
		function(arg_14_0)
			if not arg_8_0:NextStage(var_0_3) then
				return
			end

			parallelAsync({
				function(arg_15_0)
					arg_8_0:OnInit(var_8_0, var_8_4, arg_15_0)
				end,
				function(arg_16_0)
					arg_8_0:PlaySoundEffect(var_8_0)
					arg_8_0:StartUIAnimations(var_8_0, arg_16_0)
				end,
				function(arg_17_0)
					arg_8_0:OnEnter(var_8_0, var_8_4, arg_17_0)
				end,
				function(arg_18_0)
					arg_8_0:StartMoveNode(var_8_0, arg_18_0)
				end,
				function(arg_19_0)
					arg_8_0:UpdateIcon(var_8_0, arg_19_0)
				end,
				function(arg_20_0)
					arg_8_0:SetLocation(var_8_0, arg_20_0)
				end,
				function(arg_21_0)
					arg_8_0:DispatcherEvent(var_8_0, arg_21_0)
				end
			}, arg_14_0)
		end,
		function(arg_22_0)
			arg_8_0:ClearCheckDispatcher()

			if not arg_8_0:NextStage(var_0_4) then
				return
			end

			if not var_8_0:ShouldDelayEvent() then
				arg_22_0()

				return
			end

			arg_8_0:DelayCall(var_8_0:GetEventDelayTime(), arg_22_0)
		end,
		function(arg_23_0)
			if not arg_8_0:NextStage(var_0_5) then
				return
			end

			if arg_8_0.skipOption then
				arg_23_0()

				return
			end

			if var_8_0:SkipEventForOption() then
				arg_23_0()

				return
			end

			if arg_8_0:ShouldAutoTrigger() then
				arg_8_0:UnscaleDelayCall(var_8_3, arg_23_0)

				return
			end

			arg_8_0:RegisetEvent(arg_23_0)
			arg_8_0:TriggerEventIfAuto(var_8_3)
		end,
		function(arg_24_0)
			if not arg_8_0:NextStage(var_0_6) then
				return
			end

			if not var_8_0:ExistOption() then
				arg_24_0()

				return
			end

			if arg_8_0.skipOption then
				arg_8_0.skipOption = false

				arg_24_0()

				return
			end

			arg_8_0:InitBranches(arg_8_1, var_8_0, function(arg_25_0)
				arg_24_0()
			end, function()
				arg_8_0:TriggerOptionIfAuto(var_8_3, var_8_0)
			end)
		end,
		function(arg_27_0)
			if not arg_8_0:NextStage(var_0_7) then
				return
			end

			arg_8_0.autoNext = nil

			local var_27_0 = arg_8_1:GetNextStep(arg_8_2)

			seriesAsync({
				function(arg_28_0)
					arg_8_0:ClearAnimation()
					arg_8_0:OnWillExit(var_8_0, var_27_0, arg_28_0)
				end,
				function(arg_29_0)
					parallelAsync({
						function(arg_30_0)
							if not var_27_0 then
								arg_30_0()

								return
							end

							arg_8_0:Flashout(var_27_0, arg_30_0)
						end,
						function(arg_31_0)
							if var_27_0 then
								arg_31_0()

								return
							end

							arg_8_0:FadeOutStory(arg_8_0.script, arg_31_0)
						end
					}, arg_29_0)
				end
			}, arg_27_0)
		end,
		function(arg_32_0)
			if not arg_8_0:NextStage(var_0_8) then
				return
			end

			arg_8_0:OnWillClear(var_8_0)
			arg_8_0:Clear(arg_32_0)
		end
	}, arg_8_3)
end

function var_0_0.NextStage(arg_33_0, arg_33_1)
	if arg_33_0.stage == arg_33_1 - 1 then
		arg_33_0.stage = arg_33_1

		return true
	end

	return false
end

function var_0_0.DispatcherEvent(arg_34_0, arg_34_1, arg_34_2)
	if not arg_34_1:ExistDispatcher() then
		arg_34_2()

		return
	end

	local var_34_0 = arg_34_1:GetDispatcher()

	pg.NewStoryMgr.GetInstance():ClearStoryEvent()
	pg.m02:sendNotification(var_34_0.name, {
		data = var_34_0.data,
		callbackData = var_34_0.callbackData,
		flags = arg_34_0.branchCodeList[arg_34_1:GetId()] or {}
	})

	if arg_34_1:ShouldHideUI() then
		setActive(arg_34_0._tf, false)
	end

	if arg_34_1:IsRecallDispatcher() then
		arg_34_0:CheckDispatcher(arg_34_1, arg_34_2)
	else
		arg_34_2()
	end
end

function var_0_0.CheckDispatcher(arg_35_0, arg_35_1, arg_35_2)
	local var_35_0 = arg_35_1:GetDispatcherRecallName()

	arg_35_0.checkTimer = Timer.New(function()
		if pg.NewStoryMgr.GetInstance():CheckStoryEvent(var_35_0) then
			local var_36_0 = pg.NewStoryMgr.GetInstance():GetStoryEventArg(var_35_0)

			if var_36_0 and var_36_0.optionIndex then
				arg_35_0:SetBranchCode(arg_35_0.script, arg_35_1, var_36_0.optionIndex)

				arg_35_0.skipOption = true
			end

			if arg_35_1:ShouldHideUI() then
				setActive(arg_35_0._tf, true)
			end

			arg_35_0:ClearCheckDispatcher()
			arg_35_2()
		end
	end, 1, -1)

	arg_35_0.checkTimer:Start()
	arg_35_0.checkTimer.func()
end

function var_0_0.ClearCheckDispatcher(arg_37_0)
	if arg_37_0.checkTimer then
		arg_37_0.checkTimer:Stop()

		arg_37_0.checkTimer = nil
	end
end

function var_0_0.TriggerEventIfAuto(arg_38_0, arg_38_1)
	if not arg_38_0:ShouldAutoTrigger() then
		return
	end

	arg_38_0:UnscaleDelayCall(arg_38_1, function()
		if not arg_38_0.autoNext then
			setButtonEnabled(arg_38_0._go, true)

			return
		end

		triggerButton(arg_38_0._go)
	end)
end

function var_0_0.TriggerOptionIfAuto(arg_40_0, arg_40_1, arg_40_2)
	if not arg_40_0:ShouldAutoTrigger() then
		return
	end

	if not arg_40_2 or not arg_40_2:ExistOption() then
		return
	end

	arg_40_0:UnscaleDelayCall(arg_40_1, function()
		if not arg_40_0.autoNext then
			return
		end

		local var_41_0 = arg_40_2:GetOptionIndexByAutoSel()

		if var_41_0 ~= nil then
			local var_41_1 = arg_40_0:GetOptionContainer(arg_40_2).container:GetChild(var_41_0 - 1)

			triggerButton(var_41_1)
		end
	end)
end

function var_0_0.ShouldAutoTrigger(arg_42_0)
	if arg_42_0.pause or arg_42_0.stop then
		return false
	end

	return arg_42_0.autoNext
end

function var_0_0.CanSkip(arg_43_0)
	return arg_43_0.step and not arg_43_0.step:IsImport()
end

function var_0_0.CancelAuto(arg_44_0)
	arg_44_0.autoNext = false
end

function var_0_0.NextOne(arg_45_0)
	arg_45_0.timeScale = 0.0001

	if arg_45_0.stage == var_0_1 then
		arg_45_0.autoNext = true
	elseif arg_45_0.stage == var_0_5 then
		arg_45_0.autoNext = true

		arg_45_0:TriggerEventIfAuto(0)
	elseif arg_45_0.stage == var_0_6 then
		arg_45_0:TriggerOptionIfAuto(0, arg_45_0.step)
	end
end

function var_0_0.NextOneImmediately(arg_46_0)
	local var_46_0 = arg_46_0.callback

	if var_46_0 then
		arg_46_0:ClearAnimation()
		arg_46_0:Clear()
		var_46_0()
	end
end

function var_0_0.SetLocation(arg_47_0, arg_47_1, arg_47_2)
	if not arg_47_1:ExistLocation() then
		arg_47_0.locationAniEvent:SetEndEvent(nil)
		arg_47_2()

		return
	end

	setActive(arg_47_0.locationTr, true)

	local var_47_0 = arg_47_1:GetLocation()

	arg_47_0.locationTxt.text = var_47_0.text

	local function var_47_1()
		arg_47_0:DelayCall(var_47_0.time, function()
			arg_47_0.locationAnim:Play("anim_newstoryUI_iocation_out")

			arg_47_0.locationStatus = var_0_11
		end)
	end

	arg_47_0.locationAniEvent:SetEndEvent(function()
		if arg_47_0.locationStatus == var_0_10 then
			var_47_1()
			arg_47_2()
		elseif arg_47_0.locationStatus == var_0_11 then
			setActive(arg_47_0.locationTr, false)

			arg_47_0.locationStatus = var_0_9
		end
	end)
	arg_47_0.locationAnim:Play("anim_newstoryUI_iocation_in")

	arg_47_0.locationStatus = var_0_10
end

function var_0_0.UpdateIcon(arg_51_0, arg_51_1, arg_51_2)
	if not arg_51_1:ExistIcon() then
		setActive(arg_51_0.iconImage.gameObject, false)
		arg_51_2()

		return
	end

	local var_51_0 = arg_51_1:GetIconData()

	arg_51_0.iconImage.sprite = LoadSprite(var_51_0.image)

	arg_51_0.iconImage:SetNativeSize()

	local var_51_1 = arg_51_0.iconImage.gameObject.transform

	if var_51_0.pos then
		var_51_1.localPosition = Vector3(var_51_0.pos[1], var_51_0.pos[2], 0)
	else
		var_51_1.localPosition = Vector3.one
	end

	var_51_1.localScale = Vector3(var_51_0.scale or 1, var_51_0.scale or 1, 1)

	setActive(arg_51_0.iconImage.gameObject, true)
	arg_51_2()
end

function var_0_0.UpdateOptionTxt(arg_52_0, arg_52_1, arg_52_2, arg_52_3)
	local var_52_0 = arg_52_2:GetComponent(typeof(LayoutElement))
	local var_52_1 = arg_52_2:Find("content")

	if arg_52_1 then
		local var_52_2 = GetPerceptualSize(arg_52_3)
		local var_52_3 = arg_52_2:Find("content_max")
		local var_52_4 = var_52_2 >= 17
		local var_52_5 = var_52_4 and var_52_3 or var_52_1

		setActive(var_52_1, not var_52_4)
		setActive(var_52_3, var_52_4)
		setText(var_52_5:Find("Text"), arg_52_3)

		var_52_0.preferredHeight = var_52_5.rect.height
	else
		setText(var_52_1:Find("Text"), arg_52_3)

		var_52_0.preferredHeight = var_52_1.rect.height
	end
end

function var_0_0.InitBranches(arg_53_0, arg_53_1, arg_53_2, arg_53_3, arg_53_4)
	local var_53_0 = false
	local var_53_1 = arg_53_2:GetOptions()
	local var_53_2, var_53_3 = arg_53_0:GetOptionContainer(arg_53_2)
	local var_53_4 = arg_53_2:GetId()
	local var_53_5 = arg_53_0.branchCodeList[var_53_4] or {}

	arg_53_0.selectedBranchID = nil

	var_53_2:make(function(arg_54_0, arg_54_1, arg_54_2)
		if arg_54_0 == UIItemList.EventUpdate then
			local var_54_0 = arg_54_2
			local var_54_1 = var_53_1[arg_54_1 + 1][1]
			local var_54_2 = var_53_1[arg_54_1 + 1][2]
			local var_54_3 = table.contains(var_53_5, var_54_2)

			onButton(arg_53_0, var_54_0, function()
				if arg_53_0.pause or arg_53_0.stop then
					return
				end

				if not var_53_0 then
					return
				end

				arg_53_0.selectedBranchID = arg_54_1

				arg_53_0:SetBranchCode(arg_53_1, arg_53_2, var_54_2)

				local var_55_0 = arg_54_2:GetComponent(typeof(Animation))

				if var_55_0 then
					var_55_0:Play("anim_storydialogue_optiontpl_confirm")
					arg_54_2:GetComponent(typeof(DftAniEvent)):SetEndEvent(function()
						setActive(arg_53_0.optionsCg.gameObject, false)
						arg_53_3(var_54_1)
					end)
				else
					setActive(arg_53_0.optionsCg.gameObject, false)
					arg_53_3(var_54_1)
				end

				arg_53_0:HideBranchesWithoutSelected(arg_53_2)
			end, SFX_PANEL)
			setButtonEnabled(var_54_0, not var_54_3)
			arg_53_0:UpdateOptionTxt(var_53_3, var_54_0, var_54_1)
		end
	end)
	var_53_2:align(#var_53_1)
	arg_53_0:ShowBranches(arg_53_2, function()
		var_53_0 = true

		if arg_53_4 then
			arg_53_4()
		end
	end)
end

function var_0_0.SetBranchCode(arg_58_0, arg_58_1, arg_58_2, arg_58_3)
	arg_58_2:SetBranchCode(arg_58_3)
	arg_58_1:SetBranchCode(arg_58_3)

	local var_58_0 = arg_58_2:GetId()

	if not arg_58_0.branchCodeList[var_58_0] then
		arg_58_0.branchCodeList[var_58_0] = {}
	end

	table.insert(arg_58_0.branchCodeList[var_58_0], arg_58_3)
end

function var_0_0.ShowBranches(arg_59_0, arg_59_1, arg_59_2)
	setActive(arg_59_0.optionsCg.gameObject, true)

	local var_59_0 = arg_59_0:GetOptionContainer(arg_59_1)

	for iter_59_0 = 0, var_59_0.container.childCount - 1 do
		local var_59_1 = var_59_0.container:GetChild(iter_59_0):GetComponent(typeof(Animation))

		if var_59_1 then
			var_59_1:Play("anim_storydialogue_optiontpl_in")
		end
	end

	arg_59_2()
end

function var_0_0.HideBranchesWithoutSelected(arg_60_0, arg_60_1)
	local var_60_0 = arg_60_0:GetOptionContainer(arg_60_1)

	for iter_60_0 = 0, var_60_0.container.childCount - 1 do
		if iter_60_0 ~= arg_60_0.selectedBranchID then
			local var_60_1 = var_60_0.container:GetChild(iter_60_0):GetComponent(typeof(Animation))

			if var_60_1 then
				var_60_1:Play("anim_storydialogue_optiontpl_unselected")
			end
		end
	end
end

function var_0_0.StartMoveNode(arg_61_0, arg_61_1, arg_61_2)
	if not arg_61_1:ExistMovableNode() then
		arg_61_2()

		return
	end

	local var_61_0 = arg_61_1:GetMovableNode()
	local var_61_1 = {}
	local var_61_2 = {}

	for iter_61_0, iter_61_1 in pairs(var_61_0) do
		table.insert(var_61_1, function(arg_62_0)
			arg_61_0:LoadMovableNode(iter_61_1, function(arg_63_0)
				var_61_2[iter_61_0] = arg_63_0

				arg_62_0()
			end)
		end)
	end

	parallelAsync(var_61_1, function()
		arg_61_0:MoveAllNode(arg_61_1, var_61_2, var_61_0)
		arg_61_2()
	end)
end

function var_0_0.MoveAllNode(arg_65_0, arg_65_1, arg_65_2, arg_65_3)
	local var_65_0 = {}

	for iter_65_0, iter_65_1 in pairs(arg_65_2) do
		table.insert(var_65_0, function(arg_66_0)
			local var_66_0 = arg_65_3[iter_65_0]
			local var_66_1 = var_66_0.path
			local var_66_2 = var_66_0.time
			local var_66_3 = var_66_0.easeType
			local var_66_4 = var_66_0.delay

			arg_65_0:moveLocalPath(iter_65_1, var_66_1, var_66_2, var_66_4, var_66_3, arg_66_0)
		end)
	end

	arg_65_0.moveTargets = arg_65_2

	parallelAsync(var_65_0, function()
		arg_65_0:ClearMoveNodes(arg_65_1)
	end)
end

local function var_0_12(arg_68_0, arg_68_1, arg_68_2, arg_68_3, arg_68_4)
	PoolMgr.GetInstance():GetSpineChar(arg_68_1, true, function(arg_69_0)
		arg_69_0.transform:SetParent(arg_68_0.movePanel)

		local var_69_0 = arg_68_2.scale

		arg_69_0.transform.localScale = Vector3(var_69_0, var_69_0, 0)
		arg_69_0.transform.localPosition = arg_68_3

		arg_69_0:GetComponent(typeof(SpineAnimUI)):SetAction(arg_68_2.action, 0)

		arg_69_0.name = arg_68_1

		if arg_68_4 then
			arg_68_4(arg_69_0)
		end
	end)
end

local function var_0_13(arg_70_0, arg_70_1, arg_70_2, arg_70_3)
	local var_70_0 = GameObject.New("movable")

	var_70_0.transform:SetParent(arg_70_0.movePanel)

	var_70_0.transform.localScale = Vector3.zero

	local var_70_1 = GetOrAddComponent(var_70_0, typeof(RectTransform))
	local var_70_2 = GetOrAddComponent(var_70_0, typeof(Image))

	LoadSpriteAsync(arg_70_1, function(arg_71_0)
		var_70_2.sprite = arg_71_0

		var_70_2:SetNativeSize()

		var_70_1.localScale = Vector3.one
		var_70_1.localPosition = arg_70_2

		arg_70_3(var_70_1.gameObject)
	end)
end

function var_0_0.LoadMovableNode(arg_72_0, arg_72_1, arg_72_2)
	local var_72_0 = arg_72_1.path[1] or Vector3.zero

	if arg_72_1.isSpine then
		var_0_12(arg_72_0, arg_72_1.name, arg_72_1.spineData, var_72_0, arg_72_2)
	else
		var_0_13(arg_72_0, arg_72_1.name, var_72_0, arg_72_2)
	end
end

function var_0_0.ClearMoveNodes(arg_73_0, arg_73_1)
	if not arg_73_1:ExistMovableNode() then
		return
	end

	if arg_73_0.movePanel.childCount <= 0 then
		return
	end

	for iter_73_0, iter_73_1 in ipairs(arg_73_0.moveTargets or {}) do
		if iter_73_1:GetComponent(typeof(SpineAnimUI)) ~= nil then
			PoolMgr.GetInstance():ReturnSpineChar(iter_73_1.name, iter_73_1.gameObject)
		else
			Object.Destroy(iter_73_1.gameObject)
		end
	end

	arg_73_0.moveTargets = {}
end

function var_0_0.FadeOutStory(arg_74_0, arg_74_1, arg_74_2)
	if not arg_74_1:ShouldFadeout() then
		arg_74_2()

		return
	end

	local var_74_0 = arg_74_1:GetFadeoutTime()

	if not arg_74_1:ShouldWaitFadeout() then
		arg_74_0:fadeTransform(arg_74_0._go, 1, 0.3, var_74_0, true)
		arg_74_2()
	else
		arg_74_0:fadeTransform(arg_74_0._go, 1, 0.3, var_74_0, true, arg_74_2)
	end
end

function var_0_0.GetFadeColor(arg_75_0, arg_75_1)
	local var_75_0 = {}
	local var_75_1 = {}
	local var_75_2 = arg_75_1:GetComponentsInChildren(typeof(Image))

	for iter_75_0 = 0, var_75_2.Length - 1 do
		local var_75_3 = var_75_2[iter_75_0]
		local var_75_4 = {
			name = "_Color",
			color = Color.white
		}

		if var_75_3.material.shader.name == "UI/GrayScale" then
			var_75_4 = {
				name = "_GrayScale",
				color = Color.New(0.21176470588235294, 0.7137254901960784, 0.07058823529411765)
			}
		elseif var_75_3.material.shader.name == "UI/Line_Add_Blue" then
			var_75_4 = {
				name = "_GrayScale",
				color = Color.New(1, 1, 1, 0.5882352941176471)
			}
		end

		table.insert(var_75_1, var_75_4)

		if var_75_3.material == var_75_3.defaultGraphicMaterial then
			var_75_3.material = Material.Instantiate(var_75_3.defaultGraphicMaterial)
		end

		table.insert(var_75_0, var_75_3.material)
	end

	return var_75_0, var_75_1
end

function var_0_0._SetFadeColor(arg_76_0, arg_76_1, arg_76_2, arg_76_3)
	for iter_76_0, iter_76_1 in ipairs(arg_76_1) do
		if not IsNil(iter_76_1) then
			iter_76_1:SetColor(arg_76_2[iter_76_0].name, arg_76_2[iter_76_0].color * Color.New(arg_76_3, arg_76_3, arg_76_3))
		end
	end
end

function var_0_0.SetFadeColor(arg_77_0, arg_77_1, arg_77_2)
	local var_77_0, var_77_1 = arg_77_0:GetFadeColor(arg_77_1)

	arg_77_0:_SetFadeColor(var_77_0, var_77_1, arg_77_2)
end

function var_0_0._RevertFadeColor(arg_78_0, arg_78_1, arg_78_2)
	arg_78_0:_SetFadeColor(arg_78_1, arg_78_2, 1)
end

function var_0_0.RevertFadeColor(arg_79_0, arg_79_1)
	local var_79_0, var_79_1 = arg_79_0:GetFadeColor(arg_79_1)

	arg_79_0:_RevertFadeColor(var_79_0, var_79_1)
end

function var_0_0.fadeTransform(arg_80_0, arg_80_1, arg_80_2, arg_80_3, arg_80_4, arg_80_5, arg_80_6)
	if arg_80_4 <= 0 then
		if arg_80_6 then
			arg_80_6()
		end

		return
	end

	local var_80_0, var_80_1 = arg_80_0:GetFadeColor(arg_80_1)

	LeanTween.value(go(arg_80_1), arg_80_2, arg_80_3, arg_80_4):setOnUpdate(System.Action_float(function(arg_81_0)
		arg_80_0:_SetFadeColor(var_80_0, var_80_1, arg_81_0)
	end)):setOnComplete(System.Action(function()
		if arg_80_5 then
			arg_80_0:_RevertFadeColor(var_80_0, var_80_1)
		end

		if arg_80_6 then
			arg_80_6()
		end
	end))
end

function var_0_0.setPaintingAlpha(arg_83_0, arg_83_1, arg_83_2)
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

	for iter_83_1, iter_83_2 in ipairs(var_83_0) do
		if not IsNil(iter_83_2) then
			iter_83_2:SetColor(var_83_1[iter_83_1].name, var_83_1[iter_83_1].color * Color.New(arg_83_2, arg_83_2, arg_83_2))
		end
	end
end

function var_0_0.RegisetEvent(arg_84_0, arg_84_1)
	setButtonEnabled(arg_84_0._go, not arg_84_0.autoNext)
	onButton(arg_84_0, arg_84_0._go, function()
		if arg_84_0.pause or arg_84_0.stop then
			return
		end

		removeOnButton(arg_84_0._go)
		arg_84_1()
	end, SFX_PANEL)
end

function var_0_0.flashEffect(arg_86_0, arg_86_1, arg_86_2, arg_86_3, arg_86_4, arg_86_5, arg_86_6)
	arg_86_0.flashImg.color = arg_86_4 and Color(0, 0, 0) or Color(1, 1, 1)
	arg_86_0.flashCg.alpha = arg_86_1

	setActive(arg_86_0.flash, true)
	arg_86_0:TweenValueForcanvasGroup(arg_86_0.flashCg, arg_86_1, arg_86_2, arg_86_3, arg_86_5, arg_86_6)
end

function var_0_0.Flashout(arg_87_0, arg_87_1, arg_87_2)
	local var_87_0, var_87_1, var_87_2, var_87_3 = arg_87_1:GetFlashoutData()

	if not var_87_0 then
		arg_87_2()

		return
	end

	arg_87_0:flashEffect(var_87_0, var_87_1, var_87_2, var_87_3, 0, arg_87_2)
end

function var_0_0.flashin(arg_88_0, arg_88_1, arg_88_2)
	local var_88_0, var_88_1, var_88_2, var_88_3, var_88_4 = arg_88_1:GetFlashinData()

	if not var_88_0 then
		arg_88_2()

		return
	end

	arg_88_0:flashEffect(var_88_0, var_88_1, var_88_2, var_88_3, var_88_4, arg_88_2)
end

function var_0_0.UpdateBg(arg_89_0, arg_89_1)
	if arg_89_1:ShouldBgGlitchArt() then
		arg_89_0:SetBgGlitchArt(arg_89_1)
	else
		local var_89_0 = arg_89_1:GetBgName()

		if var_89_0 then
			setActive(arg_89_0.bgPanel, true)

			arg_89_0.bgPanelCg.alpha = 1

			local var_89_1 = arg_89_0.bgImage

			var_89_1.color = Color.New(1, 1, 1)
			var_89_1.sprite = arg_89_0:GetBg(var_89_0)
		end

		local var_89_2 = arg_89_1:GetBgShadow()

		if var_89_2 then
			local var_89_3 = arg_89_0.bgImage

			arg_89_0:TweenValue(var_89_3, var_89_2[1], var_89_2[2], var_89_2[3], 0, function(arg_90_0)
				var_89_3.color = Color.New(arg_90_0, arg_90_0, arg_90_0)
			end, nil)
		end

		if arg_89_1:IsBlackBg() then
			setActive(arg_89_0.curtain, true)

			arg_89_0.curtainCg.alpha = 1
		end

		local var_89_4, var_89_5 = arg_89_1:IsBlackFrontGround()

		if var_89_4 then
			arg_89_0.curtainFCg.alpha = var_89_5
		end

		setActive(arg_89_0.curtainF, var_89_4)
	end

	arg_89_0:ApplyOldPhotoEffect(arg_89_1)
	arg_89_0:OnBgUpdate(arg_89_1)

	local var_89_6 = arg_89_1:GetBgColor()

	arg_89_0.curtain:GetComponent(typeof(Image)).color = var_89_6
end

function var_0_0.ApplyOldPhotoEffect(arg_91_0, arg_91_1)
	local var_91_0 = arg_91_1:OldPhotoEffect()
	local var_91_1 = var_91_0 ~= nil

	setActive(arg_91_0.oldPhoto.gameObject, var_91_1)

	if var_91_1 then
		if type(var_91_0) == "table" then
			arg_91_0.oldPhoto.color = Color.New(var_91_0[1], var_91_0[2], var_91_0[3], var_91_0[4])
		else
			arg_91_0.oldPhoto.color = Color.New(0.62, 0.58, 0.14, 0.36)
		end
	end
end

function var_0_0.SetBgGlitchArt(arg_92_0, arg_92_1)
	setActive(arg_92_0.bgPanel, false)
	setActive(arg_92_0.bgGlitch, true)
end

function var_0_0.GetBg(arg_93_0, arg_93_1)
	if not arg_93_0.bgs[arg_93_1] then
		arg_93_0.bgs[arg_93_1] = LoadSprite("bg/" .. arg_93_1)
	end

	return arg_93_0.bgs[arg_93_1]
end

function var_0_0.LoadEffects(arg_94_0, arg_94_1, arg_94_2)
	local var_94_0 = arg_94_1:GetEffects()

	if #var_94_0 <= 0 then
		arg_94_2()

		return
	end

	local var_94_1 = {}

	for iter_94_0, iter_94_1 in ipairs(var_94_0) do
		local var_94_2 = iter_94_1.name
		local var_94_3 = iter_94_1.active
		local var_94_4 = iter_94_1.interlayer
		local var_94_5 = iter_94_1.center
		local var_94_6 = iter_94_1.adapt
		local var_94_7 = arg_94_0.effectPanel:Find(var_94_2) or arg_94_0.centerPanel:Find(var_94_2)

		if var_94_7 then
			setActive(var_94_7, var_94_3)
			setParent(var_94_7, var_94_5 and arg_94_0.centerPanel or arg_94_0.effectPanel.transform)

			if var_94_4 then
				arg_94_0:UpdateEffectInterLayer(var_94_2, var_94_7)
			end

			if var_94_3 == false then
				arg_94_0:ClearEffectInterlayer(var_94_2)
			end

			if var_94_6 then
				arg_94_0:AdaptEffect(var_94_7)
			end
		else
			local var_94_8 = ""

			if PathMgr.FileExists(PathMgr.getAssetBundle("ui/" .. var_94_2)) then
				var_94_8 = "ui"
			elseif PathMgr.FileExists(PathMgr.getAssetBundle("effect/" .. var_94_2)) then
				var_94_8 = "effect"
			end

			if var_94_8 and var_94_8 ~= "" then
				table.insert(var_94_1, function(arg_95_0)
					LoadAndInstantiateAsync(var_94_8, var_94_2, function(arg_96_0)
						setParent(arg_96_0, var_94_5 and arg_94_0.centerPanel or arg_94_0.effectPanel.transform)

						arg_96_0.transform.localScale = Vector3.one

						setActive(arg_96_0, var_94_3)

						arg_96_0.name = var_94_2

						if var_94_4 then
							arg_94_0:UpdateEffectInterLayer(var_94_2, arg_96_0)
						end

						if var_94_3 == false then
							arg_94_0:ClearEffectInterlayer(var_94_2)
						end

						if var_94_6 then
							arg_94_0:AdaptEffect(arg_96_0)
						end

						arg_95_0()
					end)
				end)
			else
				originalPrint("not found effect", var_94_2)
			end
		end
	end

	parallelAsync(var_94_1, arg_94_2)
end

function var_0_0.AdaptEffect(arg_97_0, arg_97_1)
	local var_97_0 = 1.7777777777777777
	local var_97_1 = pg.UIMgr.GetInstance().OverlayMain.parent.sizeDelta
	local var_97_2 = var_97_1.x / var_97_1.y
	local var_97_3 = 1

	if var_97_0 < var_97_2 then
		var_97_3 = var_97_2 / var_97_0
	else
		var_97_3 = var_97_0 / var_97_2
	end

	tf(arg_97_1).localScale = Vector3(var_97_3, var_97_3, var_97_3)
end

function var_0_0.UpdateEffectInterLayer(arg_98_0, arg_98_1, arg_98_2)
	local var_98_0 = arg_98_0._go:GetComponent(typeof(Canvas)).sortingOrder
	local var_98_1 = arg_98_2:GetComponentsInChildren(typeof("UnityEngine.ParticleSystemRenderer"))

	for iter_98_0 = 1, var_98_1.Length - 1 do
		local var_98_2 = var_98_1[iter_98_0 - 1]
		local var_98_3 = ReflectionHelp.RefGetProperty(typeof("UnityEngine.ParticleSystemRenderer"), "sortingOrder", var_98_2)

		if var_98_0 < var_98_3 then
			var_98_0 = var_98_3
		end
	end

	local var_98_4 = var_98_0 + 1
	local var_98_5 = GetOrAddComponent(arg_98_0.actorTr, typeof(Canvas))

	var_98_5.overrideSorting = true
	var_98_5.sortingOrder = var_98_4

	local var_98_6 = GetOrAddComponent(arg_98_0.frontTr, typeof(Canvas))

	var_98_6.overrideSorting = true
	var_98_6.sortingOrder = var_98_4 + 1
	arg_98_0.activeInterLayer = arg_98_1

	GetOrAddComponent(arg_98_0.frontTr, typeof(GraphicRaycaster))
end

function var_0_0.ClearEffectInterlayer(arg_99_0, arg_99_1)
	if arg_99_0.activeInterLayer == arg_99_1 then
		local var_99_0 = arg_99_0.actorTr:GetComponent(typeof(Canvas))
		local var_99_1 = arg_99_0.frontTr:GetComponent(typeof(Canvas))
		local var_99_2 = arg_99_0.frontTr:GetComponent(typeof(GraphicRaycaster))

		if var_99_0 then
			Object.Destroy(var_99_0)
		end

		if var_99_2 then
			Object.Destroy(var_99_2)
		end

		if var_99_1 then
			Object.Destroy(var_99_1)
		end

		arg_99_0.activeInterLayer = nil
	end
end

function var_0_0.ClearEffects(arg_100_0)
	removeAllChildren(arg_100_0.effectPanel)
	removeAllChildren(arg_100_0.centerPanel)

	if arg_100_0.activeInterLayer ~= nil then
		arg_100_0:ClearEffectInterlayer(arg_100_0.activeInterLayer)
	end
end

function var_0_0.PlaySoundEffect(arg_101_0, arg_101_1)
	if arg_101_1:ShouldPlaySoundEffect() then
		local var_101_0, var_101_1 = arg_101_1:GetSoundeffect()

		arg_101_0:DelayCall(var_101_1, function()
			pg.CriMgr.GetInstance():PlaySoundEffect_V3(var_101_0)
		end)
	end

	if arg_101_1:ShouldPlayVoice() then
		arg_101_0:PlayVoice(arg_101_1)
	elseif arg_101_1:ShouldStopVoice() then
		arg_101_0:StopVoice()
	end
end

function var_0_0.StopVoice(arg_103_0)
	if arg_103_0.currentVoice then
		arg_103_0.currentVoice:Stop(true)

		arg_103_0.currentVoice = nil
	end
end

function var_0_0.PlayVoice(arg_104_0, arg_104_1)
	if arg_104_0.voiceDelayTimer then
		arg_104_0.voiceDelayTimer:Stop()

		arg_104_0.voiceDelayTimer = nil
	end

	arg_104_0:StopVoice()

	local var_104_0, var_104_1 = arg_104_1:GetVoice()
	local var_104_2

	var_104_2 = arg_104_0:CreateDelayTimer(var_104_1, function()
		if var_104_2 then
			var_104_2:Stop()
		end

		if arg_104_0.voiceDelayTimer then
			arg_104_0.voiceDelayTimer = nil
		end

		pg.CriMgr.GetInstance():PlaySoundEffect_V3(var_104_0, function(arg_106_0)
			if arg_106_0 then
				arg_104_0.currentVoice = arg_106_0.playback
			end
		end)
	end)
	arg_104_0.voiceDelayTimer = var_104_2
end

function var_0_0.Reset(arg_107_0, arg_107_1, arg_107_2, arg_107_3)
	setActive(arg_107_0.castPanel, false)
	setActive(arg_107_0.bgPanel, false)
	setActive(arg_107_0.dialoguePanel, false)
	setActive(arg_107_0.asidePanel, false)
	setActive(arg_107_0.curtain, false)
	setActive(arg_107_0.flash, false)
	setActive(arg_107_0.optionsCg.gameObject, false)
	setActive(arg_107_0.bgGlitch, false)
	setActive(arg_107_0.locationTr, false)

	arg_107_0.locationTr.localPosition = arg_107_0.locationTrPos
	arg_107_0.locationStatus = var_0_9
	arg_107_0.flashCg.alpha = 1
	arg_107_0.goCG.alpha = 1

	arg_107_0:OnReset(arg_107_1, arg_107_2, arg_107_3)
end

function var_0_0.Clear(arg_108_0, arg_108_1)
	if arg_108_0.step then
		arg_108_0:ClearMoveNodes(arg_108_0.step)
	end

	arg_108_0.bgs = {}
	arg_108_0.skipOption = nil
	arg_108_0.step = nil
	arg_108_0.goCG.alpha = 1
	arg_108_0.callback = nil
	arg_108_0.autoNext = nil
	arg_108_0.script = nil
	arg_108_0.bgImage.sprite = nil

	arg_108_0:OnClear()

	if arg_108_1 then
		arg_108_1()
	end

	pg.DelegateInfo.New(arg_108_0)
end

function var_0_0.StoryEnd(arg_109_0)
	setActive(arg_109_0.iconImage.gameObject, false)

	arg_109_0.iconImage.sprite = nil
	arg_109_0.branchCodeList = {}
	arg_109_0.stop = false
	arg_109_0.pause = false

	if arg_109_0.voiceDelayTimer then
		arg_109_0.voiceDelayTimer:Stop()

		arg_109_0.voiceDelayTimer = nil
	end

	if arg_109_0.currentVoice then
		arg_109_0.currentVoice:Stop(true)

		arg_109_0.currentVoice = nil
	end

	arg_109_0:ClearEffects()
	arg_109_0:Clear()
	arg_109_0:OnEnd()
end

function var_0_0.PlayBgm(arg_110_0, arg_110_1)
	if arg_110_1:ShouldStopBgm() then
		arg_110_0:StopBgm()
	end

	if arg_110_1:ShoulePlayBgm() then
		local var_110_0, var_110_1, var_110_2 = arg_110_1:GetBgmData()

		arg_110_0:DelayCall(var_110_1, function()
			arg_110_0:RevertBgmVolume()
			pg.BgmMgr.GetInstance():TempPlay(var_110_0)
		end)

		if var_110_2 and var_110_2 > 0 then
			arg_110_0.defaultBgmVolume = pg.CriMgr.GetInstance():getBGMVolume()

			pg.CriMgr.GetInstance():setBGMVolume(var_110_2)
		end
	end
end

function var_0_0.StopBgm(arg_112_0, arg_112_1)
	arg_112_0:RevertBgmVolume()
	pg.BgmMgr.GetInstance():StopPlay()
end

function var_0_0.RevertBgmVolume(arg_113_0)
	if arg_113_0.defaultBgmVolume then
		pg.CriMgr.GetInstance():setBGMVolume(arg_113_0.defaultBgmVolume)

		arg_113_0.defaultBgmVolume = nil
	end
end

function var_0_0.StartUIAnimations(arg_114_0, arg_114_1, arg_114_2)
	parallelAsync({
		function(arg_115_0)
			arg_114_0:StartBlinkAnimation(arg_114_1, arg_115_0)
		end,
		function(arg_116_0)
			arg_114_0:StartBlinkWithColorAnimation(arg_114_1, arg_116_0)
		end,
		function(arg_117_0)
			arg_114_0:OnStartUIAnimations(arg_114_1, arg_117_0)
		end
	}, arg_114_2)
end

function var_0_0.StartBlinkAnimation(arg_118_0, arg_118_1, arg_118_2)
	if arg_118_1:ShouldBlink() then
		local var_118_0 = arg_118_1:GetBlinkData()
		local var_118_1 = var_118_0.black
		local var_118_2 = var_118_0.number
		local var_118_3 = var_118_0.dur
		local var_118_4 = var_118_0.delay
		local var_118_5 = var_118_0.alpha[1]
		local var_118_6 = var_118_0.alpha[2]
		local var_118_7 = var_118_0.wait

		arg_118_0.flashImg.color = var_118_1 and Color(0, 0, 0) or Color(1, 1, 1)

		setActive(arg_118_0.flash, true)

		local var_118_8 = {}

		for iter_118_0 = 1, var_118_2 do
			table.insert(var_118_8, function(arg_119_0)
				arg_118_0:TweenAlpha(arg_118_0.flash, var_118_5, var_118_6, var_118_3 / 2, 0, function()
					arg_118_0:TweenAlpha(arg_118_0.flash, var_118_6, var_118_5, var_118_3 / 2, var_118_7, arg_119_0)
				end)
			end)
		end

		seriesAsync(var_118_8, function()
			setActive(arg_118_0.flash, false)
		end)
	end

	arg_118_2()
end

function var_0_0.StartBlinkWithColorAnimation(arg_122_0, arg_122_1, arg_122_2)
	if arg_122_1:ShouldBlinkWithColor() then
		local var_122_0 = arg_122_1:GetBlinkWithColorData()
		local var_122_1 = var_122_0.color
		local var_122_2 = var_122_0.alpha

		arg_122_0.flashImg.color = Color(var_122_1[1], var_122_1[2], var_122_1[3], var_122_1[4])

		setActive(arg_122_0.flash, true)

		local var_122_3 = {}

		for iter_122_0, iter_122_1 in ipairs(var_122_2) do
			local var_122_4 = iter_122_1[1]
			local var_122_5 = iter_122_1[2]
			local var_122_6 = iter_122_1[3]
			local var_122_7 = iter_122_1[4]

			table.insert(var_122_3, function(arg_123_0)
				arg_122_0:TweenValue(arg_122_0.flash, var_122_4, var_122_5, var_122_6, var_122_7, function(arg_124_0)
					arg_122_0.flashCg.alpha = arg_124_0
				end, arg_123_0)
			end)
		end

		parallelAsync(var_122_3, function()
			setActive(arg_122_0.flash, false)
		end)
	end

	arg_122_2()
end

function var_0_0.findTF(arg_126_0, arg_126_1, arg_126_2)
	assert(arg_126_0._tf, "transform should exist")

	return findTF(arg_126_2 or arg_126_0._tf, arg_126_1)
end

function var_0_0.OnStart(arg_127_0, arg_127_1)
	return
end

function var_0_0.OnReset(arg_128_0, arg_128_1, arg_128_2, arg_128_3)
	arg_128_3()
end

function var_0_0.OnBgUpdate(arg_129_0, arg_129_1)
	return
end

function var_0_0.OnInit(arg_130_0, arg_130_1, arg_130_2, arg_130_3)
	if arg_130_3 then
		arg_130_3()
	end
end

function var_0_0.OnStartUIAnimations(arg_131_0, arg_131_1, arg_131_2)
	if arg_131_2 then
		arg_131_2()
	end
end

function var_0_0.OnEnter(arg_132_0, arg_132_1, arg_132_2, arg_132_3)
	if arg_132_3 then
		arg_132_3()
	end
end

function var_0_0.OnWillExit(arg_133_0, arg_133_1, arg_133_2, arg_133_3)
	arg_133_3()
end

function var_0_0.OnWillClear(arg_134_0, arg_134_1)
	return
end

function var_0_0.OnClear(arg_135_0)
	return
end

function var_0_0.OnEnd(arg_136_0)
	return
end

return var_0_0
