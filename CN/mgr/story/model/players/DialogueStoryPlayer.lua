local var_0_0 = class("DialogueStoryPlayer", import(".StoryPlayer"))
local var_0_1 = 159
local var_0_2 = 411
local var_0_3 = 250

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0, arg_1_1)

	arg_1_0.actorPanel = arg_1_0:findTF("actor")
	arg_1_0.actorLeft = arg_1_0:findTF("actor_left", arg_1_0.actorPanel)
	arg_1_0.initActorLeftPos = arg_1_0.actorLeft.localPosition
	arg_1_0.actorMiddle = arg_1_0:findTF("actor_middle", arg_1_0.actorPanel)
	arg_1_0.initActorMiddlePos = arg_1_0.actorMiddle.localPosition
	arg_1_0.actorRgiht = arg_1_0:findTF("actor_right", arg_1_0.actorPanel)
	arg_1_0.initActorRgihtPos = arg_1_0.actorRgiht.localPosition
	arg_1_0.sortingOrder = arg_1_0._go:GetComponent(typeof(Canvas)).sortingOrder
	arg_1_0.subActorMiddle = UIItemList.New(arg_1_0:findTF("actor_middle/sub", arg_1_0.actorPanel), arg_1_0:findTF("actor_middle/sub/tpl", arg_1_0.actorPanel))
	arg_1_0.subActorRgiht = UIItemList.New(arg_1_0:findTF("actor_right/sub", arg_1_0.actorPanel), arg_1_0:findTF("actor_right/sub/tpl", arg_1_0.actorPanel))
	arg_1_0.subActorLeft = UIItemList.New(arg_1_0:findTF("actor_left/sub", arg_1_0.actorPanel), arg_1_0:findTF("actor_left/sub/tpl", arg_1_0.actorPanel))
	arg_1_0.glitchArtMaterial = arg_1_0:findTF("resource/material1"):GetComponent(typeof(Image)).material
	arg_1_0.maskMaterial = arg_1_0:findTF("resource/material2"):GetComponent(typeof(Image)).material
	arg_1_0.maskMaterialForWithLayer = arg_1_0:findTF("resource/material5"):GetComponent(typeof(Image)).material
	arg_1_0.glitchArtMaterialForPainting = arg_1_0:findTF("resource/material3"):GetComponent(typeof(Image)).material
	arg_1_0.glitchArtMaterialForPaintingBg = arg_1_0:findTF("resource/material4"):GetComponent(typeof(Image)).material
	arg_1_0.headObjectMat = arg_1_0:findTF("resource/material6"):GetComponent(typeof(Image)).material
	arg_1_0.headMaskMat = arg_1_0:findTF("resource/material7"):GetComponent(typeof(Image)).material
	arg_1_0.typewriterSpeed = 0
	arg_1_0.contentBgAlpha = 1
	arg_1_0.live2dChars = {}
	arg_1_0.spinePainings = {}
end

function var_0_0.OnStart(arg_2_0, arg_2_1)
	arg_2_0.nextTr = arg_2_0:findTF("next", arg_2_0.dialogueWin)
	arg_2_0.conentTr = arg_2_0:findTF("content", arg_2_0.dialogueWin)
	arg_2_0.conentTxt = arg_2_0:findTF("content", arg_2_0.dialogueWin):GetComponent(typeof(Text))
	arg_2_0.typewriter = arg_2_0:findTF("content", arg_2_0.dialogueWin):GetComponent(typeof(Typewriter))
	arg_2_0.nameTr = arg_2_0:findTF("content/name", arg_2_0.dialogueWin)
	arg_2_0.tag4Dialog2 = arg_2_0:findTF("content/tag", arg_2_0.dialogueWin)
	arg_2_0.nameTxt = arg_2_0:findTF("Text", arg_2_0.nameTr):GetComponent(typeof(Text))
	arg_2_0.portraitTr = arg_2_0:findTF("portrait", arg_2_0.dialogueWin)
	arg_2_0.conentLineTr = arg_2_0:findTF("line", arg_2_0.dialogueWin)
	arg_2_0.portraitImg = arg_2_0.portraitTr:GetComponent(typeof(Image))
	arg_2_0.tags = {
		arg_2_0.nameTr:Find("tags/1"),
		arg_2_0.nameTr:Find("tags/2")
	}
	arg_2_0.contentBgs = {
		arg_2_0:findTF("bg", arg_2_0.nameTr),
		arg_2_0:findTF("bg", arg_2_0.dialogueWin)
	}
	arg_2_0.defualtFontSize = arg_2_0.conentTxt.fontSize
end

function var_0_0.OnReset(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	arg_3_0:ResetActorTF(arg_3_1, arg_3_2)
	setActive(arg_3_0.nameTr, false)
	setActive(arg_3_0.nameTr, false)
	setActive(arg_3_0.dialoguePanel, true)
	setActive(arg_3_0.actorPanel, true)
	setActive(arg_3_0.nextTr, false)

	arg_3_0.conentTxt.text = ""

	local var_3_0 = arg_3_1:ExistPortrait()
	local var_3_1 = arg_3_2 and arg_3_2:IsDialogueMode() and arg_3_2:ExistPortrait() and var_3_0

	setActive(arg_3_0.portraitTr, var_3_1)

	if not var_3_1 and arg_3_2 and arg_3_2:IsDialogueMode() and arg_3_2:ShouldGlitchArtForPortrait() then
		arg_3_0:ClearGlitchArtForPortrait()
	end

	arg_3_0:UpdateContentPosition(arg_3_1)
	arg_3_0:SetContentBgAlpha(arg_3_1:GetContentBGAlpha())
	arg_3_3()
end

function var_0_0.UpdateContentPosition(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_1:ExistPortrait()
	local var_4_1 = arg_4_1:IsMiniPortrait()
	local var_4_2 = var_4_0 and (var_4_1 and var_0_3 or var_0_2) or var_0_1

	arg_4_0.conentTr.offsetMin = Vector2(var_4_2, arg_4_0.conentTr.offsetMin.y)

	local var_4_3 = var_4_1 and var_0_3 or var_0_1

	arg_4_0.conentLineTr.offsetMin = Vector2(var_4_3, arg_4_0.conentLineTr.offsetMin.y)
end

local function var_0_4(arg_5_0, arg_5_1)
	if not arg_5_1 then
		return false
	end

	local var_5_0

	if arg_5_0:IsLive2dPainting() then
		var_5_0 = arg_5_1:Find("live2d")
	elseif arg_5_0:IsSpinePainting() then
		var_5_0 = arg_5_1:Find("spine")
	else
		var_5_0 = arg_5_1:Find("fitter")
	end

	if var_5_0.childCount <= 0 then
		return false
	end

	return var_5_0:GetChild(0).name == arg_5_0:GetPainting()
end

function var_0_0.GetRecycleActorList(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = arg_6_1:GetSide()
	local var_6_1 = arg_6_0:GetSideTF(var_6_0)
	local var_6_2 = {}

	if arg_6_1:HideOtherPainting() then
		var_6_2 = {
			arg_6_0.actorLeft,
			arg_6_0.actorMiddle,
			arg_6_0.actorRgiht
		}
	else
		if arg_6_2 and arg_6_2:IsDialogueMode() and arg_6_1:IsDialogueMode() and arg_6_1:IsSameSide(arg_6_2) and arg_6_1:IsSamePainting(arg_6_2) or var_0_4(arg_6_1, var_6_1) then
			-- block empty
		else
			table.insert(var_6_2, var_6_1)
		end

		if var_6_0 == DialogueStep.SIDE_MIDDLE then
			table.insert(var_6_2, arg_6_0.actorLeft)
			table.insert(var_6_2, arg_6_0.actorRgiht)
		end
	end

	return var_6_2
end

function var_0_0.ResetActorTF(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = arg_7_1:GetSide()
	local var_7_1 = arg_7_0:GetSideTF(var_7_0)

	if var_7_1 then
		arg_7_0:CancelTween(var_7_1.gameObject)

		var_7_1.localScale = Vector3(1, 1, 1)
		var_7_1.eulerAngles = Vector3(0, 0, 0)

		if var_7_1 == arg_7_0.actorRgiht then
			var_7_1.localPosition = arg_7_0.initActorRgihtPos
		elseif var_7_1 == arg_7_0.actorMiddle then
			var_7_1.localPosition = arg_7_0.initActorMiddlePos
		elseif var_7_1 == arg_7_0.actorLeft then
			var_7_1.localPosition = arg_7_0.initActorLeftPos
		end
	end

	local var_7_2 = arg_7_0:GetRecycleActorList(arg_7_1, arg_7_2)

	if var_7_1 and _.all(var_7_2, function(arg_8_0)
		return arg_8_0 ~= var_7_1
	end) then
		arg_7_0.paintingStay = true

		arg_7_0:ResetMeshPainting(var_7_1)

		if arg_7_1:IsSpinePainting() then
			arg_7_0:HideSpineEffect(var_7_1, arg_7_1)
		end
	end

	arg_7_0:RecyclePaintingList(var_7_2)
	arg_7_0:RecyclesSubPantings(arg_7_0.subActorMiddle)
	arg_7_0:RecyclesSubPantings(arg_7_0.subActorRgiht)
	arg_7_0:RecyclesSubPantings(arg_7_0.subActorLeft)

	for iter_7_0, iter_7_1 in ipairs({
		arg_7_0.actorLeft,
		arg_7_0.actorMiddle,
		arg_7_0.actorRgiht
	}) do
		iter_7_1:GetComponent(typeof(CanvasGroup)).alpha = 1
	end
end

function var_0_0.HideSpineEffect(arg_9_0, arg_9_1)
	arg_9_0.spineEffectOrderCaches = {}

	local function var_9_0(arg_10_0)
		local var_10_0 = arg_10_0:GetComponentsInChildren(typeof("UnityEngine.ParticleSystemRenderer"))

		for iter_10_0 = 1, var_10_0.Length do
			local var_10_1 = var_10_0[iter_10_0 - 1]
			local var_10_2 = ReflectionHelp.RefGetProperty(typeof("UnityEngine.ParticleSystemRenderer"), "sortingOrder", var_10_1)

			ReflectionHelp.RefSetProperty(typeof("UnityEngine.ParticleSystemRenderer"), "sortingOrder", var_10_1, -1)

			arg_9_0.spineEffectOrderCaches[var_10_1] = var_10_2
		end
	end

	local var_9_1 = arg_9_1:Find("spine")
	local var_9_2 = arg_9_1:Find("spinebg")

	var_9_0(var_9_1)
	var_9_0(var_9_2)
end

function var_0_0.RevertSpineEffect(arg_11_0, arg_11_1, arg_11_2)
	if not arg_11_2 then
		return
	end

	local function var_11_0(arg_12_0)
		local var_12_0 = arg_12_0:GetComponentsInChildren(typeof("UnityEngine.ParticleSystemRenderer"))

		for iter_12_0 = 1, var_12_0.Length do
			local var_12_1 = var_12_0[iter_12_0 - 1]
			local var_12_2 = arg_11_2[var_12_1] or 950

			ReflectionHelp.RefSetProperty(typeof("UnityEngine.ParticleSystemRenderer"), "sortingOrder", var_12_1, var_12_2)
		end
	end

	local var_11_1 = arg_11_1:Find("spine")
	local var_11_2 = arg_11_1:Find("spinebg")

	var_11_0(var_11_1)
	var_11_0(var_11_2)
end

function var_0_0.OnInit(arg_13_0, arg_13_1, arg_13_2, arg_13_3)
	local var_13_0 = {
		function(arg_14_0)
			arg_13_0:UpdateContent(arg_13_1, arg_14_0)
		end,
		function(arg_15_0)
			arg_13_0:UpdatePortrait(arg_13_1, arg_15_0)
		end,
		function(arg_16_0)
			arg_13_0:UpdateSubPaintings(arg_13_1, arg_16_0)
		end,
		function(arg_17_0)
			arg_13_0:UpdatePainting(arg_13_1, arg_13_2, arg_17_0)
		end,
		function(arg_18_0)
			arg_13_0:GrayingInPainting(arg_13_1, arg_13_2, arg_18_0)
		end,
		function(arg_19_0)
			arg_13_0:StartMovePrevPaintingToSide(arg_13_1, arg_13_2, arg_19_0)
		end,
		function(arg_20_0)
			arg_13_0:GrayingOutPrevPainting(arg_13_2, arg_13_1, arg_20_0)
		end
	}

	parallelAsync(var_13_0, arg_13_3)
end

function var_0_0.UpdatePortrait(arg_21_0, arg_21_1, arg_21_2)
	if not arg_21_1:ExistPortrait() then
		arg_21_2()

		return
	end

	local var_21_0 = arg_21_1:GetPortrait()

	LoadSpriteAsync("StoryIcon/" .. var_21_0, function(arg_22_0)
		setImageSprite(arg_21_0.portraitTr, arg_22_0, true)
		setActive(arg_21_0.portraitTr, true)
		arg_21_0:AdjustPortraitPosition(arg_21_1)

		if arg_21_1:ShouldGlitchArtForPortrait() then
			arg_21_0:SetGlitchArtForPortrait()
		else
			arg_21_0:ClearGlitchArtForPortrait()
		end

		arg_21_2()
	end)
end

function var_0_0.AdjustPortraitPosition(arg_23_0, arg_23_1)
	if arg_23_1:IsMiniPortrait() then
		setAnchoredPosition3D(arg_23_0.portraitTr, {
			x = 211,
			y = 133
		})
	else
		local var_23_0 = arg_23_0.portraitTr.sizeDelta.x < var_0_2 and var_0_2 or 539

		setAnchoredPosition3D(arg_23_0.portraitTr, {
			y = 0,
			x = var_23_0
		})
	end
end

function var_0_0.SetGlitchArtForPortrait(arg_24_0)
	if arg_24_0.portraitImg.material ~= arg_24_0.glitchArtMaterialForPainting then
		arg_24_0.portraitImg.material = arg_24_0.glitchArtMaterialForPainting
	end
end

function var_0_0.ClearGlitchArtForPortrait(arg_25_0)
	if not arg_25_0.portraitImg then
		return
	end

	if arg_25_0.portraitImg.material ~= arg_25_0.portraitImg.defaultGraphicMaterial then
		arg_25_0.portraitImg.material = arg_25_0.portraitImg.defaultGraphicMaterial
	end
end

function var_0_0.UpdateSubPaintings(arg_26_0, arg_26_1, arg_26_2)
	local var_26_0, var_26_1, var_26_2, var_26_3 = arg_26_0:GetSideTF(arg_26_1:GetSide())

	if not arg_26_1:ExistPainting() then
		arg_26_2()

		return
	end

	arg_26_0:InitSubPainting(var_26_3, arg_26_1:GetSubPaintings(), arg_26_1)

	if arg_26_1:NeedDispppearSubPainting() then
		arg_26_0:DisappearSubPainting(var_26_3, arg_26_1, arg_26_2)
	else
		arg_26_2()
	end
end

function var_0_0.OnStartUIAnimations(arg_27_0, arg_27_1, arg_27_2)
	if not arg_27_1:ShouldShakeDailogue() then
		arg_27_2()

		return
	end

	local var_27_0 = arg_27_1:GetShakeDailogueData()
	local var_27_1 = var_27_0.x
	local var_27_2 = var_27_0.number
	local var_27_3 = var_27_0.delay
	local var_27_4 = var_27_0.speed
	local var_27_5 = arg_27_0.dialogueWin.localPosition.x

	arg_27_0:TweenMovex(arg_27_0.dialogueWin, var_27_1, var_27_5, var_27_4, var_27_3, var_27_2, arg_27_2)
end

function var_0_0.OnEnter(arg_28_0, arg_28_1, arg_28_2, arg_28_3)
	parallelAsync({
		function(arg_29_0)
			arg_28_0:UpdateCanMarkNode(arg_28_1, arg_29_0)
		end,
		function(arg_30_0)
			arg_28_0:UpdateIcon(arg_28_1, arg_30_0)
		end
	}, arg_28_3)
end

local function var_0_5(arg_31_0, arg_31_1)
	ResourceMgr.Inst:getAssetAsync("Story/" .. arg_31_0, arg_31_0, UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_32_0)
		arg_31_1(arg_32_0)
	end), true, true)
end

local function var_0_6(arg_33_0, arg_33_1)
	if not arg_33_1 then
		return false
	end

	return arg_33_0:GetCanMarkNodeData().name == arg_33_1.name
end

function var_0_0.UpdateCanMarkNode(arg_34_0, arg_34_1, arg_34_2)
	local var_34_0 = arg_34_1:ExistCanMarkNode()

	if not var_34_0 or not var_0_6(arg_34_1, arg_34_0.canMarkNode) then
		arg_34_0:ClearCanMarkNode(arg_34_0.canMarkNode)
	end

	if not var_34_0 then
		arg_34_2()

		return
	end

	local var_34_1 = arg_34_1:GetCanMarkNodeData()

	local function var_34_2(arg_35_0)
		eachChild(arg_35_0, function(arg_36_0)
			local var_36_0 = table.contains(var_34_1.marks, arg_36_0.gameObject.name)

			if var_36_0 ~= isActive(arg_36_0) then
				setActive(arg_36_0, var_36_0)
			end
		end)
	end

	if not arg_34_0.canMarkNode then
		var_0_5(var_34_1.name, function(arg_37_0)
			if arg_34_0.stop or not arg_37_0 then
				arg_34_2()

				return
			end

			local var_37_0 = Object.Instantiate(arg_37_0, arg_34_0.backPanel)

			arg_34_0.canMarkNode = {
				name = var_34_1.name,
				go = var_37_0
			}

			var_34_2(var_37_0)
			arg_34_2()
		end)
	else
		var_34_2(arg_34_0.canMarkNode.go)
		arg_34_2()
	end
end

function var_0_0.ClearCanMarkNode(arg_38_0)
	if arg_38_0.canMarkNode then
		Destroy(arg_38_0.canMarkNode.go)

		arg_38_0.canMarkNode = nil
	end
end

function var_0_0.GrayingOutPrevPainting(arg_39_0, arg_39_1, arg_39_2, arg_39_3)
	if not arg_39_1 or not arg_39_1:IsDialogueMode() then
		arg_39_3()

		return
	end

	local var_39_0 = arg_39_0:GetSideTF(arg_39_2:GetPrevSide(arg_39_1))

	if var_39_0 and arg_39_2 and arg_39_2:IsDialogueMode() and arg_39_2:ShouldGrayingOutPainting(arg_39_1) then
		local var_39_1 = arg_39_1:GetPaintingData()
		local var_39_2 = arg_39_1:GetPaintingAlpha() or 1

		arg_39_0:fadeTransform(var_39_0, var_39_2, var_39_1.alpha, var_39_1.time, false, arg_39_3)
	else
		arg_39_3()
	end
end

function var_0_0.GrayingInPainting(arg_40_0, arg_40_1, arg_40_2, arg_40_3)
	if not arg_40_1:ExistPainting() then
		arg_40_3()

		return
	end

	if arg_40_2 and arg_40_2:IsDialogueMode() and arg_40_1:ShouldGrayingPainting(arg_40_2) then
		local var_40_0 = arg_40_0:GetSideTF(arg_40_1:GetSide())
		local var_40_1 = arg_40_1:GetPaintingData()

		if not IsNil(var_40_0) and not arg_40_1:GetPaintingAlpha() then
			arg_40_0:fadeTransform(var_40_0, var_40_1.alpha, 1, var_40_1.time, false)
		end
	end

	arg_40_3()
end

function var_0_0.UpdateTypeWriter(arg_41_0, arg_41_1, arg_41_2)
	local var_41_0 = arg_41_1:GetTypewriter()

	if not var_41_0 then
		arg_41_2()

		return
	end

	function arg_41_0.typewriter.endFunc()
		arg_41_0.typewriterSpeed = 0
		arg_41_0.typewriter.endFunc = nil

		removeOnButton(arg_41_0._tf)
		arg_41_2()
	end

	arg_41_0.typewriterSpeed = math.max((var_41_0.speed or 0.1) * arg_41_0.timeScale, 0.001)

	local var_41_1 = var_41_0.speedUp or arg_41_0.typewriterSpeed

	arg_41_0.typewriter:setSpeed(arg_41_0.typewriterSpeed)
	arg_41_0.typewriter:Play()
	onButton(arg_41_0, arg_41_0._tf, function()
		if arg_41_0.puase or arg_41_0.stop then
			return
		end

		arg_41_0.typewriterSpeed = math.min(arg_41_0.typewriterSpeed, var_41_1)

		arg_41_0.typewriter:setSpeed(arg_41_0.typewriterSpeed)
	end, SFX_PANEL)
end

function var_0_0.UpdatePainting(arg_44_0, arg_44_1, arg_44_2, arg_44_3)
	if not arg_44_1:ExistPainting() then
		arg_44_3()

		return
	end

	local var_44_0 = not arg_44_0.paintingStay

	if arg_44_0.paintingStay and arg_44_0.spineEffectOrderCaches and arg_44_1:IsSpinePainting() then
		local var_44_1 = arg_44_0:GetSideTF(arg_44_1:GetSide())

		arg_44_0:RevertSpineEffect(var_44_1, arg_44_0.spineEffectOrderCaches)
	end

	arg_44_0.spineEffectOrderCaches = nil
	arg_44_0.paintingStay = nil

	local var_44_2, var_44_3, var_44_4, var_44_5 = arg_44_0:GetSideTF(arg_44_1:GetSide())
	local var_44_6 = arg_44_2 and arg_44_2:IsDialogueMode() and (arg_44_1:ShouldGrayingOutPainting(arg_44_2) or arg_44_1:ShouldGrayingPainting(arg_44_2)) or not arg_44_1:ShouldFadeInPainting() or not var_44_0
	local var_44_7 = arg_44_2 and arg_44_2:IsDialogueMode() and arg_44_1:ShouldGrayingPainting(arg_44_2)

	seriesAsync({
		function(arg_45_0)
			if not var_44_6 then
				var_44_2:GetComponent(typeof(CanvasGroup)).alpha = 0
			end

			arg_44_0:LoadPainting(arg_44_1, var_44_0, arg_45_0)

			if var_44_7 then
				local var_45_0 = arg_44_1:GetPaintingData()

				arg_44_0:SetFadeColor(var_44_2, var_45_0.alpha)
			end
		end,
		function(arg_46_0)
			if var_44_6 then
				arg_46_0()

				return
			end

			arg_44_0:FadeInPainting(var_44_2, arg_44_1, arg_46_0)
		end,
		function(arg_47_0)
			arg_44_0:AnimationPainting(arg_44_1, arg_47_0)
		end
	}, arg_44_3)
end

function var_0_0.FadeInPainting(arg_48_0, arg_48_1, arg_48_2, arg_48_3)
	local var_48_0 = arg_48_1:GetComponent(typeof(CanvasGroup))
	local var_48_1 = arg_48_2:GetFadeInPaintingTime()
	local var_48_2 = arg_48_2:ShouldAddHeadMaskWhenFade()

	if var_48_2 then
		arg_48_0:AddHeadMask(arg_48_1)
	end

	arg_48_0:TweenValueForcanvasGroup(var_48_0, 0, 1, var_48_1, 0, function()
		if var_48_2 then
			arg_48_0:ClearHeadMask(arg_48_1)
		end

		arg_48_3()
	end)
end

function var_0_0.AddHeadMask(arg_50_0, arg_50_1)
	local var_50_0 = arg_50_1:Find("fitter")

	if not var_50_0 or var_50_0.childCount <= 0 then
		return
	end

	local var_50_1 = var_50_0:GetChild(0)
	local var_50_2 = var_50_1:Find("face")
	local var_50_3 = cloneTplTo(var_50_2, var_50_2.parent, "head_mask")
	local var_50_4 = var_50_1:Find("layers")
	local var_50_5 = arg_50_1:GetComponentsInChildren(typeof(Image))

	if var_50_4 then
		for iter_50_0 = 0, var_50_5.Length - 1 do
			local var_50_6 = var_50_5[iter_50_0]

			if var_50_6.gameObject.name == "head_mask" then
				var_50_6.material = arg_50_0.headMaskMat
			elseif var_50_6.gameObject.name == "face" then
				-- block empty
			elseif var_50_6.gameObject.transform.parent == var_50_4 then
				var_50_6.material = arg_50_0.headObjectMat
			end
		end
	else
		for iter_50_1 = 0, var_50_5.Length - 1 do
			local var_50_7 = var_50_5[iter_50_1]

			if var_50_7.gameObject.name == "head_mask" then
				var_50_7.material = arg_50_0.headMaskMat
			elseif var_50_7.gameObject.name == "face" then
				-- block empty
			else
				var_50_7.material = arg_50_0.headObjectMat
			end
		end
	end
end

function var_0_0.ClearHeadMask(arg_51_0, arg_51_1)
	local var_51_0 = arg_51_1:Find("fitter")

	if not var_51_0 or var_51_0.childCount <= 0 then
		return
	end

	local var_51_1 = var_51_0:GetChild(0):Find("head_mask")

	Destroy(var_51_1.gameObject)

	local var_51_2 = arg_51_1:GetComponentsInChildren(typeof(Image))

	for iter_51_0 = 0, var_51_2.Length - 1 do
		local var_51_3 = var_51_2[iter_51_0]

		var_51_3.material = var_51_3.defaultGraphicMaterial
	end
end

function var_0_0.AnimationPainting(arg_52_0, arg_52_1, arg_52_2)
	if arg_52_1:IsLive2dPainting() or arg_52_1:IsSpinePainting() then
		arg_52_2()

		return
	end

	local var_52_0, var_52_1, var_52_2, var_52_3 = arg_52_0:GetSideTF(arg_52_1:GetSide())

	arg_52_0:StartPaintingActions(var_52_0, arg_52_1, arg_52_2)
end

function var_0_0.LoadPainting(arg_53_0, arg_53_1, arg_53_2, arg_53_3)
	local var_53_0, var_53_1, var_53_2, var_53_3 = arg_53_0:GetSideTF(arg_53_1:GetSide())
	local var_53_4, var_53_5 = arg_53_1:GetPaintingAndName()

	if arg_53_1:IsLive2dPainting() and checkABExist("live2d/" .. var_53_5) then
		arg_53_0:UpdateLive2dPainting(arg_53_1, var_53_0, arg_53_2, arg_53_3)
	elseif arg_53_1:IsSpinePainting() and checkABExist("spinepainting/" .. var_53_5) then
		arg_53_0:UpdateSpinePainting(arg_53_1, var_53_0, arg_53_2, arg_53_3)
	else
		arg_53_0:UpdateMeshPainting(arg_53_1, var_53_0, var_53_3, arg_53_2, arg_53_3)
	end
end

function var_0_0.UpdateLive2dPainting(arg_54_0, arg_54_1, arg_54_2, arg_54_3, arg_54_4)
	local function var_54_0(arg_55_0)
		local var_55_0 = arg_54_1:GetVirtualShip()
		local var_55_1 = arg_54_1:GetLive2dPos()
		local var_55_2 = Live2D.GenerateData({
			ship = var_55_0,
			scale = Vector3(70, 70, 70),
			position = var_55_1 or Vector3(0, 0, 0),
			parent = arg_54_2:Find("live2d")
		})
		local var_55_3 = GetOrAddComponent(arg_54_0._go, typeof(CanvasGroup))

		var_55_3.blocksRaycasts = false

		local var_55_4 = Live2D.New(var_55_2, function(arg_56_0)
			arg_56_0._go.name = arg_54_1:GetPainting()

			local var_56_0 = arg_56_0._go:GetComponent("Live2D.Cubism.Rendering.CubismRenderController")
			local var_56_1 = arg_54_0.sortingOrder + 1
			local var_56_2 = typeof("Live2D.Cubism.Rendering.CubismRenderController")

			ReflectionHelp.RefSetProperty(var_56_2, "SortingOrder", var_56_0, var_56_1)

			local var_56_3 = ReflectionHelp.RefGetField(typeof("Live2D.Cubism.Rendering.CubismSortingMode"), "BackToFrontOrder")

			ReflectionHelp.RefSetProperty(var_56_2, "SortingMode", var_56_0, var_56_3)

			local var_56_4 = GetOrAddComponent(arg_54_0.front, typeof(Canvas))

			GetOrAddComponent(arg_54_0.front, typeof(GraphicRaycaster))

			var_56_4.overrideSorting = true
			var_56_4.sortingOrder = var_56_1 + arg_56_0._tf:Find("Drawables").childCount
			var_55_3.blocksRaycasts = true

			if arg_55_0 then
				arg_55_0(arg_56_0)
			end
		end)

		arg_54_0.live2dChars[arg_54_2] = var_55_4
	end

	local function var_54_1(arg_57_0)
		if arg_57_0 then
			local var_57_0 = arg_54_1:GetLive2dAction()

			if var_57_0 and var_57_0 ~= "" then
				arg_57_0:TriggerAction(var_57_0)
			end

			local var_57_1 = arg_54_1:GetL2dIdleIndex()

			if var_57_1 and var_57_1 ~= "" and var_57_1 > 0 then
				arg_57_0:changeIdleIndex(var_57_1)
			end
		end

		arg_54_4()
	end

	if not arg_54_3 and arg_54_0.live2dChars[arg_54_2] then
		local var_54_2 = arg_54_0.live2dChars[arg_54_2]

		var_54_1(var_54_2)
	else
		var_54_0(var_54_1)
	end
end

local function var_0_7(arg_58_0, arg_58_1, arg_58_2)
	local var_58_0 = arg_58_0:GetComponentsInChildren(typeof(Canvas))
	local var_58_1

	for iter_58_0 = 1, var_58_0.Length do
		var_58_1 = var_58_0[iter_58_0 - 1].sortingOrder
	end

	local var_58_2 = math.huge
	local var_58_3 = arg_58_1:GetComponentsInChildren(typeof(Canvas))

	if var_58_3.Length == 0 then
		var_58_2 = 0
	else
		for iter_58_1 = 1, var_58_3.Length do
			local var_58_4 = var_58_3[iter_58_1 - 1].sortingOrder - var_58_1

			if var_58_4 < var_58_2 then
				var_58_2 = var_58_4
			end
		end
	end

	local var_58_5 = arg_58_1:GetComponentsInChildren(typeof("UnityEngine.ParticleSystemRenderer"))
	local var_58_6 = {}

	for iter_58_2 = 1, var_58_5.Length do
		local var_58_7 = var_58_5[iter_58_2 - 1]
		local var_58_8 = ReflectionHelp.RefGetProperty(typeof("UnityEngine.ParticleSystemRenderer"), "sortingOrder", var_58_7)

		var_58_6[iter_58_2] = var_58_8

		local var_58_9 = var_58_8 - var_58_1

		if var_58_9 < var_58_2 then
			var_58_2 = var_58_9
		end
	end

	local var_58_10 = arg_58_2 - var_58_2 + 1

	for iter_58_3 = 1, var_58_0.Length do
		var_58_0[iter_58_3 - 1].sortingOrder = var_58_10 + (iter_58_3 - 1)
	end

	local var_58_11 = var_58_10 + 1

	for iter_58_4 = 1, var_58_3.Length do
		local var_58_12 = var_58_3[iter_58_4 - 1]
		local var_58_13 = var_58_10 + (var_58_12.sortingOrder - var_58_1)

		var_58_12.sortingOrder = var_58_13

		if var_58_10 < var_58_13 then
			var_58_11 = var_58_13
		end
	end

	for iter_58_5 = 1, var_58_5.Length do
		local var_58_14 = var_58_5[iter_58_5 - 1]
		local var_58_15 = var_58_10 + (var_58_6[iter_58_5] - var_58_1)

		ReflectionHelp.RefSetProperty(typeof("UnityEngine.ParticleSystemRenderer"), "sortingOrder", var_58_14, var_58_15)

		if var_58_10 < var_58_15 then
			var_58_11 = var_58_15
		end
	end

	return var_58_11
end

local function var_0_8(arg_59_0, arg_59_1, arg_59_2)
	local var_59_0 = arg_59_0:GetComponentsInChildren(typeof(Canvas))
	local var_59_1 = arg_59_0:GetComponentsInChildren(typeof("UnityEngine.ParticleSystemRenderer"))
	local var_59_2 = math.huge

	if var_59_0.Length == 0 then
		var_59_2 = 0
	else
		for iter_59_0 = 1, var_59_0.Length do
			local var_59_3 = var_59_0[iter_59_0 - 1].sortingOrder

			if var_59_3 < var_59_2 then
				var_59_2 = var_59_3
			end
		end
	end

	local var_59_4 = {}

	for iter_59_1 = 1, var_59_1.Length do
		local var_59_5 = var_59_1[iter_59_1 - 1]
		local var_59_6 = ReflectionHelp.RefGetProperty(typeof("UnityEngine.ParticleSystemRenderer"), "sortingOrder", var_59_5)

		var_59_4[iter_59_1] = var_59_6

		if var_59_6 < var_59_2 then
			var_59_2 = var_59_6
		end
	end

	local var_59_7 = arg_59_2 + 1
	local var_59_8 = var_59_7 - var_59_2

	for iter_59_2 = 1, var_59_0.Length do
		local var_59_9 = var_59_0[iter_59_2 - 1]
		local var_59_10 = var_59_8 + var_59_9.sortingOrder

		var_59_9.sortingOrder = var_59_10

		if var_59_7 < var_59_10 then
			var_59_7 = var_59_10
		end
	end

	for iter_59_3 = 1, var_59_1.Length do
		local var_59_11 = var_59_1[iter_59_3 - 1]
		local var_59_12 = var_59_8 + var_59_4[iter_59_3]

		ReflectionHelp.RefSetProperty(typeof("UnityEngine.ParticleSystemRenderer"), "sortingOrder", var_59_11, var_59_12)

		if var_59_12 < var_59_7 then
			var_59_7 = var_59_12
		end
	end

	return var_59_7
end

function var_0_0.UpdateSpinePainting(arg_60_0, arg_60_1, arg_60_2, arg_60_3, arg_60_4)
	local function var_60_0(arg_61_0)
		local var_61_0 = arg_60_2:Find("spine")
		local var_61_1 = arg_60_2:Find("spinebg")
		local var_61_2 = arg_60_1:GetVirtualShip()
		local var_61_3 = SpinePainting.GenerateData({
			ship = var_61_2,
			position = Vector3(0, 0, 0),
			parent = var_61_0,
			effectParent = var_61_1
		})

		setActive(var_61_1, not arg_60_1:IsHideSpineBg())

		local var_61_4 = SpinePainting.New(var_61_3, function(arg_62_0)
			arg_62_0._go.name = arg_60_1:GetPainting()

			local var_62_0 = arg_60_0.sortingOrder
			local var_62_1 = arg_60_1:GetSpineOrderIndex()

			if not var_62_1 then
				var_62_0 = var_0_7(var_61_0, var_61_1, arg_60_0.sortingOrder)
			else
				var_62_0 = var_0_8(var_61_0, var_62_1, arg_60_0.sortingOrder)
			end

			local var_62_2 = GetOrAddComponent(arg_60_0.front, typeof(Canvas))

			GetOrAddComponent(arg_60_0.front, typeof(GraphicRaycaster))

			var_62_2.overrideSorting = true
			var_62_2.sortingOrder = var_62_0 + 1

			arg_60_0:UpdateSpineExpression(arg_62_0, arg_60_1)

			if arg_61_0 then
				arg_61_0()
			end
		end)

		arg_60_0.spinePainings[arg_60_2] = var_61_4
	end

	if not arg_60_3 and arg_60_0.spinePainings[arg_60_2] then
		arg_60_0:UpdateSpineExpression(arg_60_0.spinePainings[arg_60_2], arg_60_1)
		arg_60_4()
	else
		var_60_0(arg_60_4)
	end
end

function var_0_0.UpdateSpineExpression(arg_63_0, arg_63_1, arg_63_2)
	local var_63_0 = arg_63_2:GetSpineExPression()

	if var_63_0 then
		arg_63_1:SetAction(var_63_0, 1)
	else
		arg_63_1:SetEmptyAction(1)
	end
end

function var_0_0.UpdateMeshPainting(arg_64_0, arg_64_1, arg_64_2, arg_64_3, arg_64_4, arg_64_5)
	local var_64_0 = arg_64_1:GetPainting()
	local var_64_1 = false

	local function var_64_2()
		if arg_64_1:IsShowNPainting() and checkABExist("painting/" .. var_64_0 .. "_n") then
			var_64_0 = var_64_0 .. "_n"
		end

		if arg_64_1:IsShowWJZPainting() and checkABExist("painting/" .. var_64_0 .. "_wjz") then
			var_64_0 = var_64_0 .. "_wjz"
		end

		setPaintingPrefab(arg_64_2, var_64_0, "duihua")
	end

	if var_64_0 then
		local var_64_3 = findTF(arg_64_2, "fitter").childCount

		if arg_64_4 or var_64_3 <= 0 then
			var_64_2()
		end

		local var_64_4 = arg_64_1:GetPaintingDir()
		local var_64_5 = math.abs(var_64_4)

		if arg_64_1:ShouldFlipPaintingY() then
			var_64_5 = -var_64_5
		end

		arg_64_2.localScale = Vector3(var_64_4, var_64_5, 1)

		local var_64_6 = findTF(arg_64_2, "fitter"):GetChild(0)

		var_64_6.name = var_64_0

		arg_64_0:UpdateActorPostion(arg_64_2, arg_64_1)
		arg_64_0:UpdateExpression(var_64_6, arg_64_1)
		arg_64_0:AddGlitchArtEffectForPating(arg_64_2, var_64_6, arg_64_1)
		arg_64_2:SetAsLastSibling()

		if arg_64_1:ShouldGrayPainting() then
			setGray(var_64_6, true, true)
		end

		local var_64_7 = findTF(var_64_6, "shadow")

		if var_64_7 then
			setActive(var_64_7, arg_64_1:ShouldFaceBlack())
		end

		local var_64_8 = arg_64_1:GetPaintingAlpha()

		if var_64_8 then
			arg_64_0:setPaintingAlpha(arg_64_2, var_64_8)
		end
	end

	arg_64_5()
end

local function var_0_9(arg_66_0)
	local var_66_0 = arg_66_0.name

	if arg_66_0.showNPainting and checkABExist("painting/" .. var_66_0 .. "_n") then
		var_66_0 = var_66_0 .. "_n"
	end

	return var_66_0
end

function var_0_0.InitSubPainting(arg_67_0, arg_67_1, arg_67_2, arg_67_3)
	local function var_67_0(arg_68_0, arg_68_1)
		local var_68_0 = var_0_9(arg_68_0)

		setPaintingPrefab(arg_68_1, var_68_0, "duihua")

		local var_68_1 = findTF(arg_68_1, "fitter"):GetChild(0)
		local var_68_2 = findTF(var_68_1, "face")
		local var_68_3 = arg_68_0.expression

		if not arg_68_0.expression and arg_68_0.name and ShipExpressionHelper.DefaultFaceless(arg_68_0.name) then
			var_68_3 = ShipExpressionHelper.GetDefaultFace(arg_68_0.name)
		end

		if var_68_3 then
			setActive(var_68_2, true)

			local var_68_4 = GetSpriteFromAtlas("paintingface/" .. arg_68_0.name, arg_68_0.expression)

			setImageSprite(var_68_2, var_68_4)
		end

		if arg_68_0.pos then
			setAnchoredPosition(arg_68_1, arg_68_0.pos)
		end

		if arg_68_0.dir then
			arg_68_1.transform.localScale = Vector3(arg_68_0.dir, 1, 1)
		end

		if arg_68_0.paintingNoise then
			arg_67_0:AddGlitchArtEffectForPating(arg_68_1, var_68_1, arg_67_3)
		end
	end

	arg_67_1:make(function(arg_69_0, arg_69_1, arg_69_2)
		if arg_69_0 == UIItemList.EventUpdate then
			var_67_0(arg_67_2[arg_69_1 + 1], arg_69_2)
		end
	end)
	arg_67_1:align(#arg_67_2)
end

function var_0_0.DisappearSubPainting(arg_70_0, arg_70_1, arg_70_2, arg_70_3)
	local var_70_0 = arg_70_2:GetSubPaintings()
	local var_70_1, var_70_2 = arg_70_2:GetDisappearTime()
	local var_70_3 = arg_70_2:GetDisappearSeq()
	local var_70_4 = {}
	local var_70_5 = {}

	for iter_70_0, iter_70_1 in ipairs(var_70_0) do
		table.insert(var_70_5, iter_70_1)
	end

	for iter_70_2, iter_70_3 in ipairs(var_70_3) do
		local var_70_6 = iter_70_3

		table.insert(var_70_4, function(arg_71_0)
			for iter_71_0, iter_71_1 in ipairs(var_70_5) do
				if iter_71_1.actor == var_70_6 then
					table.remove(var_70_5, iter_71_0)

					break
				end
			end

			arg_70_0:InitSubPainting(arg_70_1, var_70_5, arg_70_2)
			arg_70_0:DelayCall(var_70_2, arg_71_0)
		end)
	end

	arg_70_1.container:SetAsFirstSibling()
	arg_70_0:DelayCall(var_70_1, function()
		seriesAsync(var_70_4, function()
			arg_70_1.container:SetAsLastSibling()
			arg_70_3()
		end)
	end)
end

function var_0_0.UpdateActorPostion(arg_74_0, arg_74_1, arg_74_2)
	local var_74_0 = arg_74_2:GetPaitingOffst()

	if var_74_0 then
		local var_74_1 = arg_74_1.localPosition

		arg_74_1.localPosition = Vector3(var_74_1.x + (var_74_0.x or 0), var_74_1.y + (var_74_0.y or 0), 0)
	end
end

function var_0_0.UpdateExpression(arg_75_0, arg_75_1, arg_75_2)
	local var_75_0 = arg_75_2:GetExPression()
	local var_75_1 = findTF(arg_75_1, "face")

	if var_75_0 then
		local var_75_2 = arg_75_2:GetPainting()
		local var_75_3 = GetSpriteFromAtlas("paintingface/" .. var_75_2, var_75_0)

		setActive(var_75_1, true)
		setImageSprite(var_75_1, var_75_3)
	else
		setActive(var_75_1, false)
	end
end

function var_0_0.StartPaintingActions(arg_76_0, arg_76_1, arg_76_2, arg_76_3)
	local var_76_0 = {
		function(arg_77_0)
			arg_76_0:StartPatiningMoveAction(arg_76_1, arg_76_2, arg_77_0)
		end,
		function(arg_78_0)
			arg_76_0:StartPatiningShakeAction(arg_76_1, arg_76_2, arg_78_0)
		end,
		function(arg_79_0)
			arg_76_0:StartPatiningZoomAction(arg_76_1, arg_76_2, arg_79_0)
		end,
		function(arg_80_0)
			arg_76_0:StartPatiningRotateAction(arg_76_1, arg_76_2, arg_80_0)
		end
	}

	parallelAsync(var_76_0, function()
		if arg_76_3 then
			arg_76_3()
		end
	end)
end

function var_0_0.StartPatiningShakeAction(arg_82_0, arg_82_1, arg_82_2, arg_82_3)
	local var_82_0 = arg_82_2:GetPaintingAction(DialogueStep.PAINTING_ACTION_SHAKE)

	if not var_82_0 then
		arg_82_3()

		return
	end

	local function var_82_1(arg_83_0, arg_83_1)
		local var_83_0 = arg_83_0.x or 0
		local var_83_1 = arg_83_0.y or 10
		local var_83_2 = arg_83_0.dur or 1
		local var_83_3 = arg_83_0.delay or 0
		local var_83_4 = arg_83_0.number or 1
		local var_83_5 = tf(arg_82_1).localPosition

		arg_82_0:TweenMove(arg_82_1, Vector3(var_83_5.x + var_83_0, var_83_5.y + var_83_1, 0), var_83_2, var_83_4, var_83_3, arg_83_1)
	end

	local var_82_2 = {}

	for iter_82_0, iter_82_1 in pairs(var_82_0) do
		table.insert(var_82_2, function(arg_84_0)
			var_82_1(iter_82_1, arg_84_0)
		end)
	end

	parallelAsync(var_82_2, function()
		if arg_82_3 then
			arg_82_3()
		end
	end)
end

function var_0_0.StartPatiningZoomAction(arg_86_0, arg_86_1, arg_86_2, arg_86_3)
	local var_86_0 = arg_86_2:GetPaintingAction(DialogueStep.PAINTING_ACTION_ZOOM)

	if not var_86_0 then
		arg_86_3()

		return
	end

	local function var_86_1(arg_87_0, arg_87_1)
		if not arg_87_0.from then
			local var_87_0 = {
				0,
				0,
				0
			}
		end

		local var_87_1 = arg_87_0.to or {
			1,
			1,
			1
		}
		local var_87_2 = arg_87_0.dur or 0
		local var_87_3 = arg_87_0.delay or 0

		arg_86_0:TweenScale(arg_86_1, Vector3(var_87_1[1], var_87_1[2], var_87_1[3]), var_87_2, var_87_3, arg_87_1)
	end

	local var_86_2 = {}

	for iter_86_0, iter_86_1 in pairs(var_86_0) do
		table.insert(var_86_2, function(arg_88_0)
			var_86_1(iter_86_1, arg_88_0)
		end)
	end

	parallelAsync(var_86_2, function()
		if arg_86_3 then
			arg_86_3()
		end
	end)
end

function var_0_0.StartPatiningRotateAction(arg_90_0, arg_90_1, arg_90_2, arg_90_3)
	local var_90_0 = arg_90_2:GetPaintingAction(DialogueStep.PAINTING_ACTION_ROTATE)

	if not var_90_0 then
		arg_90_3()

		return
	end

	local function var_90_1(arg_91_0, arg_91_1)
		local var_91_0 = arg_91_0.value
		local var_91_1 = arg_91_0.dur or 1
		local var_91_2 = arg_91_0.number or 1
		local var_91_3 = arg_91_0.delay or 0

		arg_90_0:TweenRotate(arg_90_1, var_91_0, var_91_1, var_91_2, var_91_3, arg_91_1)
	end

	local var_90_2 = {}

	for iter_90_0, iter_90_1 in pairs(var_90_0) do
		table.insert(var_90_2, function(arg_92_0)
			var_90_1(iter_90_1, arg_92_0)
		end)
	end

	parallelAsync(var_90_2, function()
		if arg_90_3 then
			arg_90_3()
		end
	end)
end

function var_0_0.StartPatiningMoveAction(arg_94_0, arg_94_1, arg_94_2, arg_94_3)
	local var_94_0 = arg_94_2:GetPaintingAction(DialogueStep.PAINTING_ACTION_MOVE)

	if not var_94_0 then
		arg_94_3()

		return
	end

	local function var_94_1(arg_95_0, arg_95_1)
		local var_95_0 = arg_95_0.x or 0
		local var_95_1 = arg_95_0.y or 0
		local var_95_2 = arg_95_0.dur or 1
		local var_95_3 = arg_95_0.delay or 0
		local var_95_4 = tf(arg_94_1).localPosition

		arg_94_0:TweenMove(arg_94_1, Vector3(var_95_4.x + var_95_0, var_95_4.y + var_95_1, 0), var_95_2, 1, var_95_3, arg_95_1)
	end

	local var_94_2 = {}

	for iter_94_0, iter_94_1 in pairs(var_94_0) do
		table.insert(var_94_2, function(arg_96_0)
			var_94_1(iter_94_1, arg_96_0)
		end)
	end

	parallelAsync(var_94_2, function()
		if arg_94_3 then
			arg_94_3()
		end
	end)
end

function var_0_0.StartMovePrevPaintingToSide(arg_98_0, arg_98_1, arg_98_2, arg_98_3)
	local var_98_0 = arg_98_1:GetPaintingMoveToSide()

	if not var_98_0 or not arg_98_2 then
		arg_98_3()

		return
	end

	local var_98_1 = arg_98_0:GetSideTF(arg_98_2:GetSide())

	if not var_98_1 then
		arg_98_3()

		return
	end

	local var_98_2 = var_98_0.time
	local var_98_3 = var_98_0.side
	local var_98_4 = arg_98_0:GetSideTF(var_98_3)

	if not var_98_4 then
		arg_98_3()

		return
	end

	if arg_98_1.side ~= arg_98_2.side then
		if var_98_1:Find("fitter").childCount > 0 then
			local var_98_5 = var_98_1:Find("fitter"):GetChild(0)

			removeAllChildren(var_98_4:Find("fitter"))
			setParent(var_98_5, var_98_4:Find("fitter"))

			local var_98_6 = arg_98_2:GetPaintingDir()

			var_98_4.localScale = Vector3(var_98_6, math.abs(var_98_6), 1)
		end
	else
		local var_98_7 = arg_98_2:GetPainting()

		if var_98_7 then
			setPaintingPrefab(var_98_4, var_98_7, "duihua")
		end
	end

	local var_98_8 = tf(var_98_4).localPosition

	arg_98_0:TweenValue(var_98_4, var_98_1.localPosition.x, var_98_8.x, var_98_2, 0, function(arg_99_0)
		setAnchoredPosition(var_98_4, {
			x = arg_99_0
		})
	end, arg_98_3)

	var_98_4.localPosition = Vector2(var_98_1.localPosition.x, var_98_4.localPosition.y, 0)
end

local function var_0_10(arg_100_0, arg_100_1, arg_100_2, arg_100_3, arg_100_4)
	local var_100_0 = arg_100_1:GetComponentsInChildren(typeof(Image))

	for iter_100_0 = 0, var_100_0.Length - 1 do
		local var_100_1 = var_100_0[iter_100_0]

		if var_100_1.gameObject.name == "temp_mask" then
			var_100_1.material = arg_100_4 and arg_100_0.maskMaterial or arg_100_0.maskMaterialForWithLayer
		elseif var_100_1.gameObject.name == "face" then
			var_100_1.material = arg_100_0.glitchArtMaterial
		elseif arg_100_3.hasPaintbg and var_100_1.gameObject == arg_100_2.gameObject then
			var_100_1.material = arg_100_0.glitchArtMaterialForPaintingBg
		else
			var_100_1.material = arg_100_0.glitchArtMaterialForPainting
		end
	end
end

local function var_0_11(arg_101_0, arg_101_1, arg_101_2, arg_101_3, arg_101_4)
	local var_101_0 = arg_101_1:GetComponentsInChildren(typeof(Image))
	local var_101_1 = {}
	local var_101_2 = arg_101_2:GetComponent(typeof(Image))

	if var_101_2 then
		table.insert(var_101_1, var_101_2.gameObject)
	end

	for iter_101_0 = 1, arg_101_3 - 1 do
		local var_101_3 = arg_101_4:GetChild(iter_101_0 - 1)

		table.insert(var_101_1, var_101_3.gameObject)
	end

	for iter_101_1 = 0, var_101_0.Length - 1 do
		local var_101_4 = var_101_0[iter_101_1]

		if var_101_4.gameObject.name == "temp_mask" then
			var_101_4.material = arg_101_0.maskMaterial
		elseif var_101_4.gameObject.name == "face" then
			var_101_4.material = arg_101_0.glitchArtMaterial
		elseif table.contains(var_101_1, var_101_4.gameObject) then
			var_101_4.material = arg_101_0.glitchArtMaterialForPaintingBg
		else
			var_101_4.material = arg_101_0.glitchArtMaterialForPainting
		end
	end
end

function var_0_0.AddGlitchArtEffectForPating(arg_102_0, arg_102_1, arg_102_2, arg_102_3)
	local var_102_0 = arg_102_3:ShouldAddGlitchArtEffect()
	local var_102_1 = arg_102_3:IsNoHeadPainting()

	if var_102_0 and arg_102_3:GetExPression() ~= nil and not var_102_1 then
		local var_102_2 = arg_102_2:Find("face")

		cloneTplTo(var_102_2, var_102_2.parent, "temp_mask"):SetAsFirstSibling()

		local var_102_3 = arg_102_2:Find("layers")
		local var_102_4 = IsNil(var_102_3)

		if not var_102_4 and arg_102_3:GetPaintingRwIndex() > 0 then
			var_0_11(arg_102_0, arg_102_1, arg_102_2, arg_102_3:GetPaintingRwIndex(), var_102_3)
		else
			var_0_10(arg_102_0, arg_102_1, arg_102_2, arg_102_3, var_102_4)
		end
	elseif var_102_0 then
		local var_102_5 = arg_102_1:GetComponentsInChildren(typeof(Image))

		for iter_102_0 = 0, var_102_5.Length - 1 do
			var_102_5[iter_102_0].material = arg_102_0.glitchArtMaterial
		end
	end

	if var_102_0 then
		local var_102_6 = GameObject.Find("/OverlayCamera/Overlay/UIMain/AwardInfoUI(Clone)/items/SpriteMask")

		if var_102_6 and var_102_6.activeInHierarchy then
			setActive(var_102_6, false)

			arg_102_0.spriteMask = var_102_6
		end
	end
end

function var_0_0.UpdateContent(arg_103_0, arg_103_1, arg_103_2)
	local function var_103_0()
		setActive(arg_103_0.nextTr, true)
		arg_103_2()
	end

	for iter_103_0, iter_103_1 in ipairs(arg_103_0.tags) do
		setActive(iter_103_1, iter_103_0 == arg_103_1:GetTag())
	end

	arg_103_0.conentTxt.fontSize = arg_103_1:GetFontSize() or arg_103_0.defualtFontSize

	local var_103_1 = arg_103_1:GetContent()

	arg_103_0.conentTxt.text = var_103_1

	local var_103_2 = 999

	if var_103_1 and var_103_1 ~= "" then
		var_103_2 = System.String.New(var_103_1).Length
	end

	if var_103_1 and var_103_1 ~= "" and var_103_1 ~= "…" and #var_103_1 > 1 and var_103_2 > 1 then
		arg_103_0:UpdateTypeWriter(arg_103_1, var_103_0)
	else
		var_103_0()
	end

	local var_103_3 = false
	local var_103_4, var_103_5, var_103_6, var_103_7 = arg_103_0:GetSideTF(arg_103_1:GetSide())

	if var_103_5 then
		local var_103_8 = arg_103_1:GetNameWithColor()
		local var_103_9 = var_103_8 and var_103_8 ~= ""

		var_103_3 = var_103_9

		setActive(var_103_5, var_103_9)

		if var_103_9 then
			local var_103_10 = arg_103_1:GetNameColorCode()

			var_103_5:Find("Text"):GetComponent(typeof(Outline)).effectColor = Color.NewHex(var_103_10)
		end

		var_103_6.text = var_103_8

		setText(var_103_6.gameObject.transform:Find("subText"), arg_103_1:GetSubActorName())
	end

	if arg_103_0.script:IsDialogueStyle2() then
		setActive(arg_103_0.tag4Dialog2, not var_103_3)
	end
end

function var_0_0.SetContentBgAlpha(arg_105_0, arg_105_1)
	if arg_105_0.contentBgAlpha ~= arg_105_1 then
		for iter_105_0, iter_105_1 in ipairs(arg_105_0.contentBgs) do
			GetOrAddComponent(iter_105_1, typeof(CanvasGroup)).alpha = arg_105_1
		end

		arg_105_0.contentBgAlpha = arg_105_1
	end
end

function var_0_0.GetSideTF(arg_106_0, arg_106_1)
	local var_106_0
	local var_106_1
	local var_106_2
	local var_106_3

	if DialogueStep.SIDE_LEFT == arg_106_1 then
		var_106_0, var_106_1, var_106_2, var_106_3 = arg_106_0.actorLeft, arg_106_0.nameTr, arg_106_0.nameTxt, arg_106_0.subActorLeft
	elseif DialogueStep.SIDE_RIGHT == arg_106_1 then
		var_106_0, var_106_1, var_106_2, var_106_3 = arg_106_0.actorRgiht, arg_106_0.nameTr, arg_106_0.nameTxt, arg_106_0.subActorRgiht
	elseif DialogueStep.SIDE_MIDDLE == arg_106_1 then
		var_106_0, var_106_1, var_106_2, var_106_3 = arg_106_0.actorMiddle, arg_106_0.nameTr, arg_106_0.nameTxt, arg_106_0.subActorMiddle
	end

	return var_106_0, var_106_1, var_106_2, var_106_3
end

function var_0_0.RecyclesSubPantings(arg_107_0, arg_107_1)
	arg_107_1:each(function(arg_108_0, arg_108_1)
		arg_107_0:RecyclePainting(arg_108_1)
	end)
end

local function var_0_12(arg_109_0)
	if arg_109_0:Find("fitter").childCount == 0 then
		return
	end

	local var_109_0 = arg_109_0:Find("fitter"):GetChild(0)

	if var_109_0 then
		local var_109_1 = findTF(var_109_0, "shadow")

		if var_109_1 then
			setActive(var_109_1, false)
		end

		local var_109_2 = arg_109_0:GetComponentsInChildren(typeof(Image))

		for iter_109_0 = 0, var_109_2.Length - 1 do
			local var_109_3 = var_109_2[iter_109_0]
			local var_109_4 = Color.white

			if var_109_3.material ~= var_109_3.defaultGraphicMaterial then
				var_109_3.material = var_109_3.defaultGraphicMaterial
			end

			var_109_3.material:SetColor("_Color", var_109_4)
		end

		setGray(var_109_0, false, true)
		retPaintingPrefab(arg_109_0, var_109_0.name)

		local var_109_5 = var_109_0:Find("temp_mask")

		if var_109_5 then
			Destroy(var_109_5.gameObject)
		end
	end
end

function var_0_0.ClearMeshPainting(arg_110_0, arg_110_1)
	arg_110_0:ResetMeshPainting(arg_110_1)

	if arg_110_1:Find("fitter").childCount == 0 then
		return
	end

	local var_110_0 = arg_110_1:Find("fitter"):GetChild(0)

	if var_110_0 then
		retPaintingPrefab(arg_110_1, var_110_0.name)
	end
end

function var_0_0.ResetMeshPainting(arg_111_0, arg_111_1)
	if arg_111_1:Find("fitter").childCount == 0 then
		return
	end

	local var_111_0 = arg_111_1:Find("fitter"):GetChild(0)

	if var_111_0 then
		local var_111_1 = findTF(var_111_0, "shadow")

		if var_111_1 then
			setActive(var_111_1, false)
		end

		local var_111_2 = arg_111_1:GetComponentsInChildren(typeof(Image))

		for iter_111_0 = 0, var_111_2.Length - 1 do
			local var_111_3 = var_111_2[iter_111_0]
			local var_111_4 = Color.white

			if var_111_3.material ~= var_111_3.defaultGraphicMaterial then
				var_111_3.material = var_111_3.defaultGraphicMaterial

				var_111_3.material:SetColor("_Color", var_111_4)
			else
				var_111_3.material = nil
			end
		end

		setGray(var_111_0, false, true)

		local var_111_5 = var_111_0:Find("temp_mask")

		if var_111_5 then
			Destroy(var_111_5.gameObject)
		end
	end
end

local function var_0_13(arg_112_0, arg_112_1)
	local var_112_0 = arg_112_0.live2dChars[arg_112_1]
	local var_112_1 = false

	if var_112_0 and var_112_0._go then
		local var_112_2 = var_112_0._go:GetComponent("Live2D.Cubism.Rendering.CubismRenderController")

		ReflectionHelp.RefSetProperty(typeof("Live2D.Cubism.Rendering.CubismRenderController"), "SortingOrder", var_112_2, 0)
		var_112_0:Dispose()

		arg_112_0.live2dChars[arg_112_1] = nil
		var_112_1 = true
	end

	local var_112_3 = table.getCount(arg_112_0.live2dChars) <= 0

	if var_112_1 and var_112_3 then
		RemoveComponent(arg_112_0.front, "GraphicRaycaster")
		RemoveComponent(arg_112_0.front, "Canvas")
	end
end

local function var_0_14(arg_113_0, arg_113_1)
	local var_113_0 = arg_113_0.spinePainings[arg_113_1]
	local var_113_1 = false

	if var_113_0 then
		var_113_0:Dispose()

		arg_113_0.spinePainings[arg_113_1] = nil
		var_113_1 = true
	end

	local var_113_2 = table.getCount(arg_113_0.spinePainings) <= 0

	if var_113_1 and var_113_2 then
		RemoveComponent(arg_113_0.front, "GraphicRaycaster")
		RemoveComponent(arg_113_0.front, "Canvas")
	end
end

function var_0_0.RecyclePainting(arg_114_0, arg_114_1)
	if type(arg_114_1) == "table" then
		local var_114_0 = _.map(arg_114_1, function(arg_115_0)
			return arg_114_0[arg_115_0]
		end)

		arg_114_0:RecyclePaintingList(var_114_0)
	else
		arg_114_0:ClearMeshPainting(arg_114_1)
		var_0_13(arg_114_0, arg_114_1)
		var_0_14(arg_114_0, arg_114_1)
	end
end

function var_0_0.RecyclePaintingList(arg_116_0, arg_116_1)
	for iter_116_0, iter_116_1 in ipairs(arg_116_1) do
		arg_116_0:ClearMeshPainting(iter_116_1)
		var_0_13(arg_116_0, iter_116_1)
		var_0_14(arg_116_0, iter_116_1)
	end
end

function var_0_0.Resume(arg_117_0)
	var_0_0.super.Resume(arg_117_0)

	if arg_117_0.typewriterSpeed ~= 0 then
		arg_117_0.typewriter:setSpeed(arg_117_0.typewriterSpeed)
	end
end

function var_0_0.Pause(arg_118_0)
	var_0_0.super.Pause(arg_118_0)

	if arg_118_0.typewriterSpeed ~= 0 then
		arg_118_0.typewriter:setSpeed(100000000)
	end
end

function var_0_0.OnClear(arg_119_0)
	if arg_119_0.spriteMask then
		setActive(arg_119_0.spriteMask, true)

		arg_119_0.spriteMask = nil
	end
end

function var_0_0.FadeOutPainting(arg_120_0, arg_120_1, arg_120_2, arg_120_3)
	local var_120_0 = arg_120_2:GetComponent(typeof(CanvasGroup))
	local var_120_1 = arg_120_1:GetFadeOutPaintingTime()

	if var_120_1 <= 0 then
		arg_120_3()

		return
	end

	local var_120_2 = arg_120_1:ShouldAddHeadMaskWhenFade()

	if var_120_2 then
		arg_120_0:AddHeadMask(arg_120_2)
	end

	arg_120_0:TweenValueForcanvasGroup(var_120_0, 1, 0, var_120_1, 0, function()
		if var_120_2 then
			arg_120_0:ClearHeadMask(arg_120_2)
		end

		arg_120_3()
	end)
end

function var_0_0.OnWillExit(arg_122_0, arg_122_1, arg_122_2, arg_122_3)
	if not arg_122_2 or not arg_122_2:IsDialogueMode() then
		arg_122_3()

		return
	end

	local var_122_0 = arg_122_0:GetRecycleActorList(arg_122_2, arg_122_1)
	local var_122_1

	if arg_122_2:ShouldMoveToSide() then
		var_122_1 = arg_122_0:GetSideTF(arg_122_1:GetSide())
	end

	local var_122_2 = {}

	for iter_122_0, iter_122_1 in pairs(var_122_0) do
		if (not var_122_1 or iter_122_1 ~= var_122_1) and iter_122_1:Find("fitter").childCount > 0 then
			table.insert(var_122_2, function(arg_123_0)
				arg_122_0:FadeOutPainting(arg_122_1, iter_122_1, arg_123_0)
			end)
		end
	end

	parallelAsync(var_122_2, arg_122_3)
end

function var_0_0.OnEnd(arg_124_0)
	if arg_124_0.conentTxt then
		arg_124_0.conentTxt.fontSize = arg_124_0.defualtFontSize
		arg_124_0.conentTxt.text = ""
	end

	if arg_124_0.nameTxt then
		arg_124_0.nameTxt.text = ""
	end

	arg_124_0:ClearGlitchArtForPortrait()
	arg_124_0:ClearCanMarkNode()

	local var_124_0 = {
		"actorLeft",
		"actorMiddle",
		"actorRgiht"
	}

	arg_124_0:RecyclePainting(var_124_0)

	for iter_124_0, iter_124_1 in ipairs({
		"actorLeft",
		"actorMiddle",
		"actorRgiht"
	}) do
		arg_124_0[iter_124_1]:GetComponent(typeof(CanvasGroup)).alpha = 1
	end
end

return var_0_0
