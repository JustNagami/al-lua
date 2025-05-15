local var_0_0 = class("Dialogue3DPlayer", import("Mgr.Story.model.animation.StoryAnimtion"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0)

	arg_1_0.view = arg_1_1
	arg_1_0._tf = arg_1_1._tf
	arg_1_0.dialoguePanel = arg_1_0._tf:Find("front/dialogue/1")
	arg_1_0.nameTxt = arg_1_0.dialoguePanel:Find("content/name/Text"):GetComponent(typeof(Text))
	arg_1_0.subNameTxt = arg_1_0.dialoguePanel:Find("content/name/Text/subText"):GetComponent(typeof(Text))
	arg_1_0.iconImg = arg_1_0.dialoguePanel:Find("content/name/tags/3/icon")
	arg_1_0.contentTxt = arg_1_0.dialoguePanel:Find("content"):GetComponent(typeof(Text))
	arg_1_0.typewriter = arg_1_0.contentTxt:GetComponent(typeof(Typewriter))
	arg_1_0.blackBg = arg_1_0._tf:Find("black"):GetComponent(typeof(CanvasGroup))
	arg_1_0.optionPanel = arg_1_0.dialoguePanel:Find("options_panel")
	arg_1_0.uiOptionList = UIItemList.New(arg_1_0.dialoguePanel:Find("options_panel/options_l"), arg_1_0.dialoguePanel:Find("options_panel/options_l/option_tpl"))
end

function var_0_0.NextOne(arg_2_0)
	arg_2_0.autoNext = true

	if arg_2_0.isRegisterEvent then
		triggerButton(arg_2_0._tf)
	end
end

function var_0_0.CancelAuto(arg_3_0)
	arg_3_0.autoNext = false

	arg_3_0:ClearTimer(arg_3_0.callback)
end

function var_0_0.OnStart(arg_4_0, arg_4_1)
	arg_4_0:ActiveDefaultCamera(arg_4_1)
	pg.DelegateInfo.New(arg_4_0)
end

function var_0_0.ActiveDefaultCamera(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_1:GetLookGroup()
	local var_5_1 = System.Array.CreateInstance(typeof(Transform), #var_5_0)

	for iter_5_0 = 0, #var_5_0 - 1 do
		var_5_1[iter_5_0] = var_5_0[iter_5_0 + 1].transform
	end

	IslandCameraMgr.instance:LookAtGroup(var_5_1)
end

function var_0_0.Play(arg_6_0, arg_6_1, arg_6_2, arg_6_3, arg_6_4)
	if arg_6_3:IsSkipAll() then
		arg_6_4()

		return
	end

	arg_6_0.playerUnit = arg_6_3:GetPlayerRole()

	local var_6_0 = arg_6_3:GetStepByIndex(arg_6_2)

	if not var_6_0 then
		arg_6_4()

		return
	end

	arg_6_1:Add(var_6_0)

	arg_6_0.script = arg_6_3
	arg_6_0.callback = arg_6_4
	arg_6_0.autoNext = arg_6_3:GetAutoPlayFlag()

	arg_6_0:SetTimeScale(1 - arg_6_3:GetPlaySpeed() * 0.1)

	arg_6_0.isRegisterEvent = false

	arg_6_0:Reset()
	seriesAsync({
		function(arg_7_0)
			arg_6_0:SetCustomCameraBlend(var_6_0, arg_7_0)
		end,
		function(arg_8_0)
			parallelAsync({
				function(arg_9_0)
					arg_6_0:ActiveCamera(var_6_0, arg_9_0)
				end,
				function(arg_10_0)
					arg_6_0:ShakeCamera(var_6_0, arg_10_0)
				end,
				function(arg_11_0)
					arg_6_0:StartAction(var_6_0, arg_11_0)
				end
			}, arg_8_0)
		end,
		function(arg_12_0)
			arg_6_0:Clear()
			arg_12_0()
		end
	}, arg_6_4)
end

function var_0_0.Reset(arg_13_0)
	removeOnButton(arg_13_0._tf)
	arg_13_0.uiOptionList:align(0)

	arg_13_0.isRegisterEvent = false
	arg_13_0.blackBg.alpha = 0
end

function var_0_0.ShowOptions(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = arg_14_1:GetOptionList()

	arg_14_0.uiOptionList:make(function(arg_15_0, arg_15_1, arg_15_2)
		if arg_15_0 == UIItemList.EventUpdate then
			local var_15_0 = var_14_0[arg_15_1 + 1]

			setText(arg_15_2.transform:Find("content/Text"), var_15_0.content)

			local var_15_1

			var_15_1.sprite, var_15_1 = GetSpriteFromAtlas("ui/story_atlas", var_15_0.icon), arg_15_2.transform:Find("icon"):GetComponent(typeof(Image))

			var_15_1:SetNativeSize()
			onButton(arg_14_0, arg_15_2, function()
				arg_14_0:ResponseOption(var_15_0, arg_14_2)
			end, SFX_PANEL)
		end
	end)
	arg_14_0.uiOptionList:align(#var_14_0)
end

function var_0_0.ResponseOption(arg_17_0, arg_17_1, arg_17_2)
	if arg_17_1.type == Dialogue3DStep.OPTION_TYPE_TEXT then
		arg_17_0.script:SetBranchCode(arg_17_1.param)
	elseif arg_17_1.type == Dialogue3DStep.OPTION_TYPE_PAGE then
		arg_17_0.script:MarkSkipAll()
		arg_17_0.view:Op("NotifiyIsland", ISLAND_EX_EVT.OPEN_PAGE, _G[arg_17_1.param])
	elseif arg_17_1.type == Dialogue3DStep.OPTION_TYPE_TASK then
		arg_17_0.script:MarkSkipAll()
		arg_17_0.view:Op("NotifiyIsland", ISLAND_EX_EVT.TRIGGER_TASK, arg_17_1.param)
	elseif arg_17_1.type == Dialogue3DStep.OPTION_TYPE_EXIT then
		arg_17_0.script:MarkSkipAll()
	end

	arg_17_2()
end

function var_0_0.DisactiveDefaultCamera(arg_18_0)
	IslandCameraMgr.instance:LookAt(arg_18_0.playerUnit.transform)
end

function var_0_0.SetCustomCameraBlend(arg_19_0, arg_19_1, arg_19_2)
	if not arg_19_1:SholdBlendCamera() then
		arg_19_2()

		return
	end

	local var_19_0 = arg_19_1:GetCameraBlendName()

	IslandCameraMgr.instance:SetCustomCameraBlend(var_19_0, arg_19_2)
end

function var_0_0.ClearCustomCameraBlend(arg_20_0)
	IslandCameraMgr.instance:ClearCustomCameraBlend()
end

function var_0_0.StartAction(arg_21_0, arg_21_1, arg_21_2)
	local var_21_0 = arg_21_1:GetPlayMode()

	if var_21_0 == Dialogue3DStep.PLAY_MODE_SCENE_TIMELINE then
		arg_21_0:PlaySceneTimeline(arg_21_1, arg_21_2)
	elseif var_21_0 == Dialogue3DStep.PLAY_MODE_TIMELINE then
		arg_21_0:PlayTimeline(arg_21_1:GetTimelinePath(), arg_21_2)
	elseif var_21_0 == Dialogue3DStep.PLAY_MODE_DIALOGUE then
		arg_21_0:UpdateDialogue(arg_21_1, arg_21_2)
	else
		assert(false, "not support play mode")
		arg_21_2()
	end
end

function var_0_0.PlaySceneTimeline(arg_22_0, arg_22_1, arg_22_2)
	local var_22_0 = arg_22_1:GetSceneTimelineSceneName()
	local var_22_1 = IslandSceneSwitcher.New()

	seriesAsync({
		function(arg_23_0)
			arg_22_0:Mask()
			var_22_1:Load(var_22_0, function(arg_24_0)
				arg_24_0()
				arg_23_0()
			end, 2)
		end,
		function(arg_25_0)
			onNextTick(arg_25_0)
		end,
		function(arg_26_0)
			arg_22_0:UnMask()
			arg_22_0:PlayTimeline(arg_22_1:GetSceneTimelinePath(), arg_26_0)
		end,
		function(arg_27_0)
			var_22_1:UnLoad()
			SceneOpMgr.Inst:SetActiveSceneByIndex(1)
			arg_27_0()
		end
	}, arg_22_2)
end

function var_0_0.Mask(arg_28_0)
	arg_28_0.blackBg.alpha = 1
end

function var_0_0.UnMask(arg_29_0)
	arg_29_0.blackBg.alpha = 0
end

function var_0_0.ActiveCamera(arg_30_0, arg_30_1, arg_30_2)
	if not arg_30_1:ShouldActiveCamera() then
		return
	end

	local var_30_0 = arg_30_1:ShouldFadeCamera()
	local var_30_1 = {}

	if var_30_0 then
		table.insert(var_30_1, function(arg_31_0)
			arg_30_0:TweenValueForcanvasGroup(arg_30_0.blackBg, 0, 1, 0.5, 0, arg_31_0)
		end)
		table.insert(var_30_1, function(arg_32_0)
			arg_30_0:UnscaleDelayCall(1, arg_32_0)
		end)
	end

	table.insert(var_30_1, function(arg_33_0)
		local var_33_0 = arg_30_1:GetActiveCamera()

		IslandCameraMgr.instance:ActiveVirtualCamera(var_33_0)
		arg_33_0()
	end)

	if var_30_0 then
		table.insert(var_30_1, function(arg_34_0)
			arg_30_0:TweenValueForcanvasGroup(arg_30_0.blackBg, 1, 0, 0.5, 0, arg_34_0)
		end)
	end

	seriesAsync(var_30_1, arg_30_2)
end

function var_0_0.ShakeCamera(arg_35_0, arg_35_1, arg_35_2)
	if not arg_35_1:ShouldCameraShake() then
		arg_35_2()

		return
	end

	seriesAsync({
		function(arg_36_0)
			arg_35_0:LoadShakeSrc(arg_35_1, arg_36_0)
		end,
		function(arg_37_0)
			if arg_35_0.shakeCameraSrc then
				arg_35_0.shakeCameraSrc:GetComponent("Cinemachine.CinemachineImpulseSource"):GenerateImpulse()
			end

			arg_37_0()
		end
	}, arg_35_2)
end

function var_0_0.LoadShakeSrc(arg_38_0, arg_38_1, arg_38_2)
	local var_38_0 = arg_38_1:GetCameraShakeSrc()

	PoolMgr.GetInstance():GetUI(var_38_0, true, function(arg_39_0)
		arg_38_0.shakeCameraSrc = arg_39_0

		arg_38_2()
	end)
end

function var_0_0.PlayTimeline(arg_40_0, arg_40_1, arg_40_2)
	setActive(arg_40_0._tf, false)

	local var_40_0 = GameObject.Find(arg_40_1)

	assert(var_40_0, arg_40_1)

	if not var_40_0 then
		return
	end

	local var_40_1 = var_40_0:GetComponent(typeof(UnityEngine.Playables.PlayableDirector))
	local var_40_2 = GetOrAddComponent(var_40_0, "DftCommonSignalReceiver")

	var_40_2:SetCommonEvent(function(arg_41_0)
		if arg_41_0.stringParameter == "TimelineEnd" then
			var_40_1:Stop()
			var_40_2:SetCommonEvent(nil)
			setActive(arg_40_0._tf, true)
			arg_40_2()
		end
	end)
	var_40_1:Play()
end

function var_0_0.UpdateDialogue(arg_42_0, arg_42_1, arg_42_2)
	parallelAsync({
		function(arg_43_0)
			arg_42_0:LoadContentAndIcon(arg_42_1, arg_43_0)
		end,
		function(arg_44_0)
			arg_42_0:PlayCharatorAnimation(arg_42_1, arg_44_0)
		end,
		function(arg_45_0)
			arg_42_0:UpdateTypeWriter(arg_42_1, arg_45_0)
		end,
		function(arg_46_0)
			arg_42_0:StartUIAnimations(arg_42_1, arg_46_0)
		end
	}, function()
		arg_42_0:RegisterEvent(arg_42_1, arg_42_2)
	end)
end

function var_0_0.StartUIAnimations(arg_48_0, arg_48_1, arg_48_2)
	if not arg_48_1:ShouldShakeDailogue() then
		arg_48_2()

		return
	end

	local var_48_0 = arg_48_1:GetShakeDailogueData()
	local var_48_1 = var_48_0.x
	local var_48_2 = var_48_0.number
	local var_48_3 = var_48_0.delay
	local var_48_4 = var_48_0.speed
	local var_48_5 = arg_48_0.dialoguePanel.localPosition.x

	arg_48_0:TweenMovex(arg_48_0.dialoguePanel, var_48_1, var_48_5, var_48_4, var_48_3, var_48_2, arg_48_2)
end

function var_0_0.RegisterEvent(arg_49_0, arg_49_1, arg_49_2)
	if not arg_49_0.callback then
		return
	end

	setActive(arg_49_0.optionPanel, arg_49_1:ExistOption())

	if arg_49_1:ExistOption() then
		arg_49_0:ShowOptions(arg_49_1, arg_49_2)
	elseif arg_49_0.autoNext then
		local var_49_0 = arg_49_0.script:GetTriggerDelayTime()

		arg_49_0:UnscaleDelayCall(var_49_0, arg_49_2)
	else
		onButton(arg_49_0, arg_49_0._tf, arg_49_2, SFX_PANEL)
	end

	arg_49_0.isRegisterEvent = true
end

function var_0_0.UpdateTypeWriter(arg_50_0, arg_50_1, arg_50_2)
	local var_50_0 = arg_50_1:GetSay()
	local var_50_1 = 999

	if var_50_0 and var_50_0 ~= "" then
		var_50_1 = System.String.New(var_50_0).Length
	end

	if not var_50_0 or var_50_0 == "" or var_50_0 == "…" or not (#var_50_0 > 1) or not (var_50_1 > 1) then
		arg_50_2()

		return
	end

	local var_50_2 = arg_50_1:GetTypewriter()

	if not var_50_2 then
		arg_50_2()

		return
	end

	function arg_50_0.typewriter.endFunc()
		arg_50_0.typewriterSpeed = 0
		arg_50_0.typewriter.endFunc = nil

		removeOnButton(arg_50_0._tf)
		arg_50_2()
	end

	arg_50_0.typewriterSpeed = math.max((var_50_2.speed or 0.1) * arg_50_0.timeScale, 0.001)

	local var_50_3 = var_50_2.speedUp or arg_50_0.typewriterSpeed

	arg_50_0.typewriter:setSpeed(arg_50_0.typewriterSpeed)
	arg_50_0.typewriter:Play()
	onButton(arg_50_0, arg_50_0._tf, function()
		if arg_50_0.puase or arg_50_0.stop then
			return
		end

		arg_50_0.typewriterSpeed = math.min(arg_50_0.typewriterSpeed, var_50_3)

		arg_50_0.typewriter:setSpeed(arg_50_0.typewriterSpeed)
	end, SFX_PANEL)
end

function var_0_0.LoadContentAndIcon(arg_53_0, arg_53_1, arg_53_2)
	arg_53_0.nameTxt.text = arg_53_1:GetName()
	arg_53_0.subNameTxt.text = arg_53_1:GetSubName()
	arg_53_0.contentTxt.text = arg_53_1:GetSay()

	local var_53_0 = arg_53_1:GetActorIcon()

	LoadSpriteAsync("QIcon/" .. var_53_0, function(arg_54_0)
		setImageSprite(arg_53_0.iconImg, arg_54_0, false)
		arg_53_2()
	end)
end

function var_0_0.PlayCharatorAnimation(arg_55_0, arg_55_1, arg_55_2)
	if not arg_55_1:ExistAnimation() then
		arg_55_2()

		return
	end

	local var_55_0 = arg_55_0.script:GetRole(arg_55_1:GetUnitId())

	if not var_55_0 then
		arg_55_2()
		arg_55_2()

		return
	end

	local var_55_1 = arg_55_1:GetAnimation()
	local var_55_2 = var_55_0:GetComponent(typeof(Animator))

	if not var_55_2:GetCurrentAnimatorStateInfo(0):IsName(var_55_1) then
		local var_55_3 = Animator.StringToHash(var_55_1)

		var_55_2:CrossFadeInFixedTime(var_55_3, 0.2)
	end

	arg_55_2()
end

function var_0_0.Clear(arg_56_0)
	arg_56_0.uiOptionList:align(0)
	removeOnButton(arg_56_0._tf)
	arg_56_0:ClearAnimation()

	arg_56_0.blackBg.alpha = 0

	if arg_56_0.shakeCameraSrc then
		Object.Destroy(arg_56_0.shakeCameraSrc)

		arg_56_0.shakeCameraSrc = nil
	end
end

function var_0_0.OnEnd(arg_57_0)
	arg_57_0:DisactiveDefaultCamera()
	arg_57_0:ClearCustomCameraBlend()
	pg.DelegateInfo.Dispose(arg_57_0)
end

return var_0_0
