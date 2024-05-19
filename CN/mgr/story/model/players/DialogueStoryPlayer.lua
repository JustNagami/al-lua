local var_0_0 = class("DialogueStoryPlayer", import(".StoryPlayer"))
local var_0_1 = 159
local var_0_2 = 411

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
	arg_2_0.nameTxt = arg_2_0:findTF("Text", arg_2_0.nameTr):GetComponent(typeof(Text))
	arg_2_0.portraitTr = arg_2_0:findTF("portrait", arg_2_0.dialogueWin)
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

	arg_3_0.conentTr.offsetMin = Vector2(var_3_0 and var_0_2 or var_0_1, arg_3_0.conentTr.offsetMin.y)

	arg_3_0:SetContentBgAlpha(arg_3_1:GetContentBGAlpha())
	arg_3_3()
end

local function var_0_3(arg_4_0, arg_4_1)
	if not arg_4_1 then
		return false
	end

	local var_4_0

	if arg_4_0:IsLive2dPainting() then
		var_4_0 = arg_4_1:Find("live2d")
	elseif arg_4_0:IsSpinePainting() then
		var_4_0 = arg_4_1:Find("spine")
	else
		var_4_0 = arg_4_1:Find("fitter")
	end

	if var_4_0.childCount <= 0 then
		return false
	end

	return var_4_0:GetChild(0).name == arg_4_0:GetPainting()
end

function var_0_0.GetRecycleActorList(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = arg_5_1:GetSide()
	local var_5_1 = arg_5_0:GetSideTF(var_5_0)
	local var_5_2 = {}

	if arg_5_1:HideOtherPainting() then
		var_5_2 = {
			arg_5_0.actorLeft,
			arg_5_0.actorMiddle,
			arg_5_0.actorRgiht
		}
	else
		if arg_5_2 and arg_5_2:IsDialogueMode() and arg_5_1:IsDialogueMode() and arg_5_1:IsSameSide(arg_5_2) and arg_5_1:IsSamePainting(arg_5_2) or var_0_3(arg_5_1, var_5_1) then
			-- block empty
		else
			table.insert(var_5_2, var_5_1)
		end

		if var_5_0 == DialogueStep.SIDE_MIDDLE then
			table.insert(var_5_2, arg_5_0.actorLeft)
			table.insert(var_5_2, arg_5_0.actorRgiht)
		end
	end

	return var_5_2
end

function var_0_0.ResetActorTF(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = arg_6_1:GetSide()
	local var_6_1 = arg_6_0:GetSideTF(var_6_0)

	if var_6_1 then
		arg_6_0:CancelTween(var_6_1.gameObject)

		var_6_1.localScale = Vector3(1, 1, 1)
		var_6_1.eulerAngles = Vector3(0, 0, 0)

		if var_6_1 == arg_6_0.actorRgiht then
			var_6_1.localPosition = arg_6_0.initActorRgihtPos
		elseif var_6_1 == arg_6_0.actorMiddle then
			var_6_1.localPosition = arg_6_0.initActorMiddlePos
		elseif var_6_1 == arg_6_0.actorLeft then
			var_6_1.localPosition = arg_6_0.initActorLeftPos
		end
	end

	local var_6_2 = arg_6_0:GetRecycleActorList(arg_6_1, arg_6_2)

	if var_6_1 and _.all(var_6_2, function(arg_7_0)
		return arg_7_0 ~= var_6_1
	end) then
		arg_6_0.paintingStay = true

		arg_6_0:ResetMeshPainting(var_6_1)
	end

	arg_6_0:RecyclePaintingList(var_6_2)
	arg_6_0:RecyclesSubPantings(arg_6_0.subActorMiddle)
	arg_6_0:RecyclesSubPantings(arg_6_0.subActorRgiht)
	arg_6_0:RecyclesSubPantings(arg_6_0.subActorLeft)

	for iter_6_0, iter_6_1 in ipairs({
		arg_6_0.actorLeft,
		arg_6_0.actorMiddle,
		arg_6_0.actorRgiht
	}) do
		iter_6_1:GetComponent(typeof(CanvasGroup)).alpha = 1
	end
end

function var_0_0.OnInit(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	local var_8_0 = {
		function(arg_9_0)
			arg_8_0:UpdateContent(arg_8_1, arg_9_0)
		end,
		function(arg_10_0)
			arg_8_0:UpdatePortrait(arg_8_1, arg_10_0)
		end,
		function(arg_11_0)
			arg_8_0:UpdateSubPaintings(arg_8_1, arg_11_0)
		end,
		function(arg_12_0)
			arg_8_0:UpdatePainting(arg_8_1, arg_8_2, arg_12_0)
		end,
		function(arg_13_0)
			arg_8_0:GrayingInPainting(arg_8_1, arg_8_2, arg_13_0)
		end,
		function(arg_14_0)
			arg_8_0:StartMovePrevPaintingToSide(arg_8_1, arg_8_2, arg_14_0)
		end,
		function(arg_15_0)
			arg_8_0:GrayingOutPrevPainting(arg_8_2, arg_8_1, arg_15_0)
		end
	}

	parallelAsync(var_8_0, arg_8_3)
end

function var_0_0.UpdatePortrait(arg_16_0, arg_16_1, arg_16_2)
	if not arg_16_1:ExistPortrait() then
		arg_16_2()

		return
	end

	local var_16_0 = arg_16_1:GetPortrait()

	LoadSpriteAsync("StoryIcon/" .. var_16_0, function(arg_17_0)
		setImageSprite(arg_16_0.portraitTr, arg_17_0, true)
		setActive(arg_16_0.portraitTr, true)
		arg_16_0:AdjustPortraitPosition()

		if arg_16_1:ShouldGlitchArtForPortrait() then
			arg_16_0:SetGlitchArtForPortrait()
		else
			arg_16_0:ClearGlitchArtForPortrait()
		end

		arg_16_2()
	end)
end

function var_0_0.AdjustPortraitPosition(arg_18_0)
	local var_18_0 = arg_18_0.portraitTr.sizeDelta.x < var_0_2 and var_0_2 or 539

	setAnchoredPosition3D(arg_18_0.portraitTr, {
		x = var_18_0
	})
end

function var_0_0.SetGlitchArtForPortrait(arg_19_0)
	if arg_19_0.portraitImg.material ~= arg_19_0.glitchArtMaterialForPainting then
		arg_19_0.portraitImg.material = arg_19_0.glitchArtMaterialForPainting
	end
end

function var_0_0.ClearGlitchArtForPortrait(arg_20_0)
	if arg_20_0.portraitImg.material ~= arg_20_0.portraitImg.defaultGraphicMaterial then
		arg_20_0.portraitImg.material = arg_20_0.portraitImg.defaultGraphicMaterial
	end
end

function var_0_0.UpdateSubPaintings(arg_21_0, arg_21_1, arg_21_2)
	local var_21_0, var_21_1, var_21_2, var_21_3 = arg_21_0:GetSideTF(arg_21_1:GetSide())

	if not arg_21_1:ExistPainting() then
		arg_21_2()

		return
	end

	arg_21_0:InitSubPainting(var_21_3, arg_21_1:GetSubPaintings(), arg_21_1)

	if arg_21_1:NeedDispppearSubPainting() then
		arg_21_0:DisappearSubPainting(var_21_3, arg_21_1, arg_21_2)
	else
		arg_21_2()
	end
end

function var_0_0.OnStartUIAnimations(arg_22_0, arg_22_1, arg_22_2)
	if not arg_22_1:ShouldShakeDailogue() then
		arg_22_2()

		return
	end

	local var_22_0 = arg_22_1:GetShakeDailogueData()
	local var_22_1 = var_22_0.x
	local var_22_2 = var_22_0.number
	local var_22_3 = var_22_0.delay
	local var_22_4 = var_22_0.speed
	local var_22_5 = arg_22_0.dialogueWin.localPosition.x

	arg_22_0:TweenMovex(arg_22_0.dialogueWin, var_22_1, var_22_5, var_22_4, var_22_3, var_22_2, arg_22_2)
end

function var_0_0.OnEnter(arg_23_0, arg_23_1, arg_23_2, arg_23_3)
	parallelAsync({
		function(arg_24_0)
			arg_23_0:UpdateCanMarkNode(arg_23_1, arg_24_0)
		end,
		function(arg_25_0)
			arg_23_0:UpdateIcon(arg_23_1, arg_25_0)
		end
	}, arg_23_3)
end

local function var_0_4(arg_26_0, arg_26_1)
	ResourceMgr.Inst:getAssetAsync("Story/" .. arg_26_0, arg_26_0, UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_27_0)
		arg_26_1(arg_27_0)
	end), true, true)
end

local function var_0_5(arg_28_0, arg_28_1)
	if not arg_28_1 then
		return false
	end

	return arg_28_0:GetCanMarkNodeData().name == arg_28_1.name
end

function var_0_0.UpdateCanMarkNode(arg_29_0, arg_29_1, arg_29_2)
	local var_29_0 = arg_29_1:ExistCanMarkNode()

	if not var_29_0 or not var_0_5(arg_29_1, arg_29_0.canMarkNode) then
		arg_29_0:ClearCanMarkNode(arg_29_0.canMarkNode)
	end

	if not var_29_0 then
		arg_29_2()

		return
	end

	local var_29_1 = arg_29_1:GetCanMarkNodeData()

	local function var_29_2(arg_30_0)
		eachChild(arg_30_0, function(arg_31_0)
			local var_31_0 = table.contains(var_29_1.marks, arg_31_0.gameObject.name)

			if var_31_0 ~= isActive(arg_31_0) then
				setActive(arg_31_0, var_31_0)
			end
		end)
	end

	if not arg_29_0.canMarkNode then
		var_0_4(var_29_1.name, function(arg_32_0)
			if arg_29_0.stop or not arg_32_0 then
				arg_29_2()

				return
			end

			local var_32_0 = Object.Instantiate(arg_32_0, arg_29_0.backPanel)

			arg_29_0.canMarkNode = {
				name = var_29_1.name,
				go = var_32_0
			}

			var_29_2(var_32_0)
			arg_29_2()
		end)
	else
		var_29_2(arg_29_0.canMarkNode.go)
		arg_29_2()
	end
end

function var_0_0.ClearCanMarkNode(arg_33_0)
	if arg_33_0.canMarkNode then
		Object.Destroy(arg_33_0.canMarkNode.go)

		arg_33_0.canMarkNode = nil
	end
end

function var_0_0.GrayingOutPrevPainting(arg_34_0, arg_34_1, arg_34_2, arg_34_3)
	if not arg_34_1 or not arg_34_1:IsDialogueMode() then
		arg_34_3()

		return
	end

	local var_34_0 = arg_34_0:GetSideTF(arg_34_2:GetPrevSide(arg_34_1))

	if var_34_0 and arg_34_2 and arg_34_2:IsDialogueMode() and arg_34_2:ShouldGrayingOutPainting(arg_34_1) then
		local var_34_1 = arg_34_1:GetPaintingData()
		local var_34_2 = arg_34_1:GetPaintingAlpha() or 1

		arg_34_0:fadeTransform(var_34_0, var_34_2, var_34_1.alpha, var_34_1.time, false, arg_34_3)
	else
		arg_34_3()
	end
end

function var_0_0.GrayingInPainting(arg_35_0, arg_35_1, arg_35_2, arg_35_3)
	if not arg_35_1:ExistPainting() then
		arg_35_3()

		return
	end

	if arg_35_2 and arg_35_2:IsDialogueMode() and arg_35_1:ShouldGrayingPainting(arg_35_2) then
		local var_35_0 = arg_35_0:GetSideTF(arg_35_1:GetSide())
		local var_35_1 = arg_35_1:GetPaintingData()

		if not IsNil(var_35_0) and not arg_35_1:GetPaintingAlpha() then
			arg_35_0:fadeTransform(var_35_0, var_35_1.alpha, 1, var_35_1.time, false)
		end
	end

	arg_35_3()
end

function var_0_0.UpdateTypeWriter(arg_36_0, arg_36_1, arg_36_2)
	local var_36_0 = arg_36_1:GetTypewriter()

	if not var_36_0 then
		arg_36_2()

		return
	end

	function arg_36_0.typewriter.endFunc()
		arg_36_0.typewriterSpeed = 0
		arg_36_0.typewriter.endFunc = nil

		removeOnButton(arg_36_0._tf)
		arg_36_2()
	end

	arg_36_0.typewriterSpeed = math.max((var_36_0.speed or 0.1) * arg_36_0.timeScale, 0.001)

	local var_36_1 = var_36_0.speedUp or arg_36_0.typewriterSpeed

	arg_36_0.typewriter:setSpeed(arg_36_0.typewriterSpeed)
	arg_36_0.typewriter:Play()
	onButton(arg_36_0, arg_36_0._tf, function()
		if arg_36_0.puase or arg_36_0.stop then
			return
		end

		arg_36_0.typewriterSpeed = math.min(arg_36_0.typewriterSpeed, var_36_1)

		arg_36_0.typewriter:setSpeed(arg_36_0.typewriterSpeed)
	end, SFX_PANEL)
end

function var_0_0.UpdatePainting(arg_39_0, arg_39_1, arg_39_2, arg_39_3)
	if not arg_39_1:ExistPainting() then
		arg_39_3()

		return
	end

	local var_39_0 = not arg_39_0.paintingStay

	arg_39_0.paintingStay = nil

	local var_39_1, var_39_2, var_39_3, var_39_4 = arg_39_0:GetSideTF(arg_39_1:GetSide())
	local var_39_5 = arg_39_2 and arg_39_2:IsDialogueMode() and (arg_39_1:ShouldGrayingOutPainting(arg_39_2) or arg_39_1:ShouldGrayingPainting(arg_39_2)) or not arg_39_1:ShouldFadeInPainting() or not var_39_0
	local var_39_6 = arg_39_2 and arg_39_2:IsDialogueMode() and arg_39_1:ShouldGrayingPainting(arg_39_2)

	seriesAsync({
		function(arg_40_0)
			if not var_39_5 then
				var_39_1:GetComponent(typeof(CanvasGroup)).alpha = 0
			end

			arg_39_0:LoadPainting(arg_39_1, var_39_0, arg_40_0)

			if var_39_6 then
				local var_40_0 = arg_39_1:GetPaintingData()

				arg_39_0:SetFadeColor(var_39_1, var_40_0.alpha)
			end
		end,
		function(arg_41_0)
			if var_39_5 then
				arg_41_0()

				return
			end

			arg_39_0:FadeInPainting(var_39_1, arg_39_1, arg_41_0)
		end,
		function(arg_42_0)
			arg_39_0:AnimationPainting(arg_39_1, arg_42_0)
		end
	}, arg_39_3)
end

function var_0_0.FadeInPainting(arg_43_0, arg_43_1, arg_43_2, arg_43_3)
	local var_43_0 = arg_43_1:GetComponent(typeof(CanvasGroup))
	local var_43_1 = arg_43_2:GetFadeInPaintingTime()
	local var_43_2 = arg_43_2:ShouldAddHeadMaskWhenFade()

	if var_43_2 then
		arg_43_0:AddHeadMask(arg_43_1)
	end

	arg_43_0:TweenValueForcanvasGroup(var_43_0, 0, 1, var_43_1, 0, function()
		if var_43_2 then
			arg_43_0:ClearHeadMask(arg_43_1)
		end

		arg_43_3()
	end)
end

function var_0_0.AddHeadMask(arg_45_0, arg_45_1)
	local var_45_0 = arg_45_1:Find("fitter")

	if not var_45_0 or var_45_0.childCount <= 0 then
		return
	end

	local var_45_1 = var_45_0:GetChild(0)
	local var_45_2 = var_45_1:Find("face")
	local var_45_3 = cloneTplTo(var_45_2, var_45_2.parent, "head_mask")
	local var_45_4 = var_45_1:Find("layers")
	local var_45_5 = arg_45_1:GetComponentsInChildren(typeof(Image))

	if var_45_4 then
		for iter_45_0 = 0, var_45_5.Length - 1 do
			local var_45_6 = var_45_5[iter_45_0]

			if var_45_6.gameObject.name == "head_mask" then
				var_45_6.material = arg_45_0.headMaskMat
			elseif var_45_6.gameObject.name == "face" then
				-- block empty
			elseif var_45_6.gameObject.transform.parent == var_45_4 then
				var_45_6.material = arg_45_0.headObjectMat
			end
		end
	else
		for iter_45_1 = 0, var_45_5.Length - 1 do
			local var_45_7 = var_45_5[iter_45_1]

			if var_45_7.gameObject.name == "head_mask" then
				var_45_7.material = arg_45_0.headMaskMat
			elseif var_45_7.gameObject.name == "face" then
				-- block empty
			else
				var_45_7.material = arg_45_0.headObjectMat
			end
		end
	end
end

function var_0_0.ClearHeadMask(arg_46_0, arg_46_1)
	local var_46_0 = arg_46_1:Find("fitter")

	if not var_46_0 or var_46_0.childCount <= 0 then
		return
	end

	local var_46_1 = var_46_0:GetChild(0):Find("head_mask")

	Object.Destroy(var_46_1.gameObject)

	local var_46_2 = arg_46_1:GetComponentsInChildren(typeof(Image))

	for iter_46_0 = 0, var_46_2.Length - 1 do
		local var_46_3 = var_46_2[iter_46_0]

		var_46_3.material = var_46_3.defaultGraphicMaterial
	end
end

function var_0_0.AnimationPainting(arg_47_0, arg_47_1, arg_47_2)
	if arg_47_1:IsLive2dPainting() or arg_47_1:IsSpinePainting() then
		arg_47_2()

		return
	end

	local var_47_0, var_47_1, var_47_2, var_47_3 = arg_47_0:GetSideTF(arg_47_1:GetSide())

	arg_47_0:StartPaintingActions(var_47_0, arg_47_1, arg_47_2)
end

function var_0_0.LoadPainting(arg_48_0, arg_48_1, arg_48_2, arg_48_3)
	local var_48_0, var_48_1, var_48_2, var_48_3 = arg_48_0:GetSideTF(arg_48_1:GetSide())
	local var_48_4, var_48_5 = arg_48_1:GetPaintingAndName()

	if arg_48_1:IsLive2dPainting() and PathMgr.FileExists(PathMgr.getAssetBundle("live2d/" .. var_48_5)) then
		arg_48_0:UpdateLive2dPainting(arg_48_1, var_48_0, arg_48_2, arg_48_3)
	elseif arg_48_1:IsSpinePainting() and PathMgr.FileExists(PathMgr.getAssetBundle("spinepainting/" .. var_48_5)) then
		arg_48_0:UpdateSpinePainting(arg_48_1, var_48_0, arg_48_2, arg_48_3)
	else
		arg_48_0:UpdateMeshPainting(arg_48_1, var_48_0, var_48_3, arg_48_2, arg_48_3)
	end
end

function var_0_0.UpdateLive2dPainting(arg_49_0, arg_49_1, arg_49_2, arg_49_3, arg_49_4)
	local function var_49_0(arg_50_0)
		local var_50_0 = arg_49_1:GetVirtualShip()
		local var_50_1 = arg_49_1:GetLive2dPos()
		local var_50_2 = Live2D.GenerateData({
			ship = var_50_0,
			scale = Vector3(70, 70, 70),
			position = var_50_1 or Vector3(0, 0, 0),
			parent = arg_49_2:Find("live2d")
		})
		local var_50_3 = GetOrAddComponent(arg_49_0._go, typeof(CanvasGroup))

		var_50_3.blocksRaycasts = false

		local var_50_4 = Live2D.New(var_50_2, function(arg_51_0)
			arg_51_0._go.name = arg_49_1:GetPainting()

			local var_51_0 = arg_51_0._go:GetComponent("Live2D.Cubism.Rendering.CubismRenderController")
			local var_51_1 = arg_49_0.sortingOrder + 1
			local var_51_2 = typeof("Live2D.Cubism.Rendering.CubismRenderController")

			ReflectionHelp.RefSetProperty(var_51_2, "SortingOrder", var_51_0, var_51_1)

			local var_51_3 = ReflectionHelp.RefGetField(typeof("Live2D.Cubism.Rendering.CubismSortingMode"), "BackToFrontOrder")

			ReflectionHelp.RefSetProperty(var_51_2, "SortingMode", var_51_0, var_51_3)

			local var_51_4 = GetOrAddComponent(arg_49_0.front, typeof(Canvas))

			GetOrAddComponent(arg_49_0.front, typeof(GraphicRaycaster))

			var_51_4.overrideSorting = true
			var_51_4.sortingOrder = var_51_1 + arg_51_0._tf:Find("Drawables").childCount
			var_50_3.blocksRaycasts = true

			if arg_50_0 then
				arg_50_0(arg_51_0)
			end
		end)

		arg_49_0.live2dChars[arg_49_2] = var_50_4
	end

	local function var_49_1(arg_52_0)
		if arg_52_0 then
			local var_52_0 = arg_49_1:GetLive2dAction()

			if var_52_0 and var_52_0 ~= "" then
				arg_52_0:TriggerAction(var_52_0)
			end

			local var_52_1 = arg_49_1:GetL2dIdleIndex()

			if var_52_1 and var_52_1 ~= "" and var_52_1 > 0 then
				arg_52_0:changeIdleIndex(var_52_1)
			end
		end

		arg_49_4()
	end

	if not arg_49_3 and arg_49_0.live2dChars[arg_49_2] then
		local var_49_2 = arg_49_0.live2dChars[arg_49_2]

		var_49_1(var_49_2)
	else
		var_49_0(var_49_1)
	end
end

local function var_0_6(arg_53_0, arg_53_1, arg_53_2)
	local var_53_0 = arg_53_0:GetComponentsInChildren(typeof(Canvas))
	local var_53_1

	for iter_53_0 = 1, var_53_0.Length do
		var_53_1 = var_53_0[iter_53_0 - 1].sortingOrder
	end

	local var_53_2 = math.huge
	local var_53_3 = arg_53_1:GetComponentsInChildren(typeof(Canvas))

	if var_53_3.Length == 0 then
		var_53_2 = 0
	else
		for iter_53_1 = 1, var_53_3.Length do
			local var_53_4 = var_53_3[iter_53_1 - 1].sortingOrder - var_53_1

			if var_53_4 < var_53_2 then
				var_53_2 = var_53_4
			end
		end
	end

	local var_53_5 = arg_53_1:GetComponentsInChildren(typeof("UnityEngine.ParticleSystemRenderer"))
	local var_53_6 = {}

	for iter_53_2 = 1, var_53_5.Length do
		local var_53_7 = var_53_5[iter_53_2 - 1]
		local var_53_8 = ReflectionHelp.RefGetProperty(typeof("UnityEngine.ParticleSystemRenderer"), "sortingOrder", var_53_7)

		var_53_6[iter_53_2] = var_53_8

		local var_53_9 = var_53_8 - var_53_1

		if var_53_9 < var_53_2 then
			var_53_2 = var_53_9
		end
	end

	local var_53_10 = arg_53_2 - var_53_2 + 1

	for iter_53_3 = 1, var_53_0.Length do
		var_53_0[iter_53_3 - 1].sortingOrder = var_53_10
	end

	local var_53_11 = var_53_10 + 1

	for iter_53_4 = 1, var_53_3.Length do
		local var_53_12 = var_53_3[iter_53_4 - 1]
		local var_53_13 = var_53_10 + (var_53_12.sortingOrder - var_53_1)

		var_53_12.sortingOrder = var_53_13

		if var_53_10 < var_53_13 then
			var_53_11 = var_53_13
		end
	end

	for iter_53_5 = 1, var_53_5.Length do
		local var_53_14 = var_53_5[iter_53_5 - 1]
		local var_53_15 = var_53_10 + (var_53_6[iter_53_5] - var_53_1)

		ReflectionHelp.RefSetProperty(typeof("UnityEngine.ParticleSystemRenderer"), "sortingOrder", var_53_14, var_53_15)

		if var_53_10 < var_53_15 then
			var_53_11 = var_53_15
		end
	end

	return var_53_11
end

local function var_0_7(arg_54_0, arg_54_1, arg_54_2)
	local var_54_0 = arg_54_0:GetComponentsInChildren(typeof(Canvas))
	local var_54_1

	for iter_54_0 = 1, var_54_0.Length do
		if iter_54_0 - 1 == arg_54_1 then
			var_54_1 = var_54_0[iter_54_0 - 1].sortingOrder
		end
	end

	local var_54_2 = math.huge

	if var_54_0.Length == 0 then
		var_54_2 = 0
	else
		for iter_54_1 = 1, var_54_0.Length do
			if iter_54_1 - 1 ~= arg_54_1 then
				local var_54_3 = var_54_0[iter_54_1 - 1].sortingOrder - var_54_1

				if var_54_3 < var_54_2 then
					var_54_2 = var_54_3
				end
			end
		end
	end

	local var_54_4 = arg_54_0:GetComponentsInChildren(typeof("UnityEngine.ParticleSystemRenderer"))
	local var_54_5 = {}

	for iter_54_2 = 1, var_54_4.Length do
		local var_54_6 = var_54_4[iter_54_2 - 1]
		local var_54_7 = ReflectionHelp.RefGetProperty(typeof("UnityEngine.ParticleSystemRenderer"), "sortingOrder", var_54_6)

		var_54_5[iter_54_2] = var_54_7

		local var_54_8 = var_54_7 - var_54_1

		if var_54_8 < var_54_2 then
			var_54_2 = var_54_8
		end
	end

	local var_54_9 = arg_54_2 - var_54_2 + 1

	for iter_54_3 = 1, var_54_0.Length do
		if iter_54_3 - 1 == arg_54_1 then
			var_54_0[iter_54_3 - 1].sortingOrder = var_54_9
		end
	end

	local var_54_10 = var_54_9 + 1

	for iter_54_4 = 1, var_54_0.Length do
		if iter_54_4 - 1 ~= arg_54_1 then
			local var_54_11 = var_54_0[iter_54_4 - 1]
			local var_54_12 = var_54_9 + (var_54_11.sortingOrder - var_54_1)

			var_54_11.sortingOrder = var_54_12

			if var_54_9 < var_54_12 then
				var_54_10 = var_54_12
			end
		end
	end

	for iter_54_5 = 1, var_54_4.Length do
		local var_54_13 = var_54_4[iter_54_5 - 1]
		local var_54_14 = var_54_9 + (var_54_5[iter_54_5] - var_54_1)

		ReflectionHelp.RefSetProperty(typeof("UnityEngine.ParticleSystemRenderer"), "sortingOrder", var_54_13, var_54_14)

		if var_54_9 < var_54_14 then
			var_54_10 = var_54_14
		end
	end

	return var_54_10
end

function var_0_0.UpdateSpinePainting(arg_55_0, arg_55_1, arg_55_2, arg_55_3, arg_55_4)
	local function var_55_0(arg_56_0)
		local var_56_0 = arg_55_2:Find("spine")
		local var_56_1 = arg_55_2:Find("spinebg")
		local var_56_2 = arg_55_1:GetVirtualShip()
		local var_56_3 = SpinePainting.GenerateData({
			ship = var_56_2,
			position = Vector3(0, 0, 0),
			parent = var_56_0,
			effectParent = var_56_1
		})

		setActive(var_56_1, not arg_55_1:IsHideSpineBg())

		local var_56_4 = SpinePainting.New(var_56_3, function(arg_57_0)
			arg_57_0._go.name = arg_55_1:GetPainting()

			local var_57_0 = arg_55_0.sortingOrder
			local var_57_1 = arg_55_1:GetSpineOrderIndex()

			if not var_57_1 then
				var_57_0 = var_0_6(var_56_0, var_56_1, arg_55_0.sortingOrder)
			else
				var_57_0 = var_0_7(var_56_0, var_57_1, arg_55_0.sortingOrder)
			end

			local var_57_2 = GetOrAddComponent(arg_55_0.front, typeof(Canvas))

			GetOrAddComponent(arg_55_0.front, typeof(GraphicRaycaster))

			var_57_2.overrideSorting = true
			var_57_2.sortingOrder = var_57_0 + 1

			arg_55_0:UpdateSpineExpression(arg_57_0, arg_55_1)

			if arg_56_0 then
				arg_56_0()
			end
		end)

		arg_55_0.spinePainings[arg_55_2] = var_56_4
	end

	if not arg_55_3 and arg_55_0.spinePainings[arg_55_2] then
		arg_55_0:UpdateSpineExpression(arg_55_0.spinePainings[arg_55_2], arg_55_1)
		arg_55_4()
	else
		var_55_0(arg_55_4)
	end
end

function var_0_0.UpdateSpineExpression(arg_58_0, arg_58_1, arg_58_2)
	local var_58_0 = arg_58_2:GetSpineExPression()

	if var_58_0 then
		arg_58_1:SetAction(var_58_0, 1)
	else
		arg_58_1:SetEmptyAction(1)
	end
end

function var_0_0.UpdateMeshPainting(arg_59_0, arg_59_1, arg_59_2, arg_59_3, arg_59_4, arg_59_5)
	local var_59_0 = arg_59_1:GetPainting()
	local var_59_1 = false

	local function var_59_2()
		if arg_59_1:IsShowNPainting() and PathMgr.FileExists(PathMgr.getAssetBundle("painting/" .. var_59_0 .. "_n")) then
			var_59_0 = var_59_0 .. "_n"
		end

		if arg_59_1:IsShowWJZPainting() and PathMgr.FileExists(PathMgr.getAssetBundle("painting/" .. var_59_0 .. "_wjz")) then
			var_59_0 = var_59_0 .. "_wjz"
		end

		setPaintingPrefab(arg_59_2, var_59_0, "duihua")
	end

	if var_59_0 then
		local var_59_3 = findTF(arg_59_2, "fitter").childCount

		if arg_59_4 or var_59_3 <= 0 then
			var_59_2()
		end

		local var_59_4 = arg_59_1:GetPaintingDir()
		local var_59_5 = math.abs(var_59_4)

		arg_59_2.localScale = Vector3(var_59_4, var_59_5, 1)

		local var_59_6 = findTF(arg_59_2, "fitter"):GetChild(0)

		var_59_6.name = var_59_0

		arg_59_0:UpdateActorPostion(arg_59_2, arg_59_1)
		arg_59_0:UpdateExpression(var_59_6, arg_59_1)
		arg_59_0:AddGlitchArtEffectForPating(arg_59_2, var_59_6, arg_59_1)
		arg_59_2:SetAsLastSibling()

		if arg_59_1:ShouldGrayPainting() then
			setGray(var_59_6, true, true)
		end

		local var_59_7 = findTF(var_59_6, "shadow")

		if var_59_7 then
			setActive(var_59_7, arg_59_1:ShouldFaceBlack())
		end

		local var_59_8 = arg_59_1:GetPaintingAlpha()

		if var_59_8 then
			arg_59_0:setPaintingAlpha(arg_59_2, var_59_8)
		end
	end

	arg_59_5()
end

local function var_0_8(arg_61_0)
	local var_61_0 = arg_61_0.name

	if arg_61_0.showNPainting and PathMgr.FileExists(PathMgr.getAssetBundle("painting/" .. var_61_0 .. "_n")) then
		var_61_0 = var_61_0 .. "_n"
	end

	return var_61_0
end

function var_0_0.InitSubPainting(arg_62_0, arg_62_1, arg_62_2, arg_62_3)
	local function var_62_0(arg_63_0, arg_63_1)
		local var_63_0 = var_0_8(arg_63_0)

		setPaintingPrefab(arg_63_1, var_63_0, "duihua")

		local var_63_1 = findTF(arg_63_1, "fitter"):GetChild(0)
		local var_63_2 = findTF(var_63_1, "face")
		local var_63_3 = arg_63_0.expression

		if not arg_63_0.expression and arg_63_0.name and ShipExpressionHelper.DefaultFaceless(arg_63_0.name) then
			var_63_3 = ShipExpressionHelper.GetDefaultFace(arg_63_0.name)
		end

		if var_63_3 then
			setActive(var_63_2, true)

			local var_63_4 = GetSpriteFromAtlas("paintingface/" .. arg_63_0.name, arg_63_0.expression)

			setImageSprite(var_63_2, var_63_4)
		end

		if arg_63_0.pos then
			setAnchoredPosition(arg_63_1, arg_63_0.pos)
		end

		if arg_63_0.dir then
			arg_63_1.transform.localScale = Vector3(arg_63_0.dir, 1, 1)
		end

		if arg_63_0.paintingNoise then
			arg_62_0:AddGlitchArtEffectForPating(arg_63_1, var_63_1, arg_62_3)
		end
	end

	arg_62_1:make(function(arg_64_0, arg_64_1, arg_64_2)
		if arg_64_0 == UIItemList.EventUpdate then
			var_62_0(arg_62_2[arg_64_1 + 1], arg_64_2)
		end
	end)
	arg_62_1:align(#arg_62_2)
end

function var_0_0.DisappearSubPainting(arg_65_0, arg_65_1, arg_65_2, arg_65_3)
	local var_65_0 = arg_65_2:GetSubPaintings()
	local var_65_1, var_65_2 = arg_65_2:GetDisappearTime()
	local var_65_3 = arg_65_2:GetDisappearSeq()
	local var_65_4 = {}
	local var_65_5 = {}

	for iter_65_0, iter_65_1 in ipairs(var_65_0) do
		table.insert(var_65_5, iter_65_1)
	end

	for iter_65_2, iter_65_3 in ipairs(var_65_3) do
		local var_65_6 = iter_65_3

		table.insert(var_65_4, function(arg_66_0)
			for iter_66_0, iter_66_1 in ipairs(var_65_5) do
				if iter_66_1.actor == var_65_6 then
					table.remove(var_65_5, iter_66_0)

					break
				end
			end

			arg_65_0:InitSubPainting(arg_65_1, var_65_5, arg_65_2)
			arg_65_0:DelayCall(var_65_2, arg_66_0)
		end)
	end

	arg_65_1.container:SetAsFirstSibling()
	arg_65_0:DelayCall(var_65_1, function()
		seriesAsync(var_65_4, function()
			arg_65_1.container:SetAsLastSibling()
			arg_65_3()
		end)
	end)
end

function var_0_0.UpdateActorPostion(arg_69_0, arg_69_1, arg_69_2)
	local var_69_0 = arg_69_2:GetPaitingOffst()

	if var_69_0 then
		local var_69_1 = arg_69_1.localPosition

		arg_69_1.localPosition = Vector3(var_69_1.x + (var_69_0.x or 0), var_69_1.y + (var_69_0.y or 0), 0)
	end
end

function var_0_0.UpdateExpression(arg_70_0, arg_70_1, arg_70_2)
	local var_70_0 = arg_70_2:GetExPression()
	local var_70_1 = findTF(arg_70_1, "face")

	if var_70_0 then
		local var_70_2 = arg_70_2:GetPainting()
		local var_70_3 = GetSpriteFromAtlas("paintingface/" .. var_70_2, var_70_0)

		setActive(var_70_1, true)
		setImageSprite(var_70_1, var_70_3)
	else
		setActive(var_70_1, false)
	end
end

function var_0_0.StartPaintingActions(arg_71_0, arg_71_1, arg_71_2, arg_71_3)
	local var_71_0 = {
		function(arg_72_0)
			arg_71_0:StartPatiningMoveAction(arg_71_1, arg_71_2, arg_72_0)
		end,
		function(arg_73_0)
			arg_71_0:StartPatiningShakeAction(arg_71_1, arg_71_2, arg_73_0)
		end,
		function(arg_74_0)
			arg_71_0:StartPatiningZoomAction(arg_71_1, arg_71_2, arg_74_0)
		end,
		function(arg_75_0)
			arg_71_0:StartPatiningRotateAction(arg_71_1, arg_71_2, arg_75_0)
		end
	}

	parallelAsync(var_71_0, function()
		if arg_71_3 then
			arg_71_3()
		end
	end)
end

function var_0_0.StartPatiningShakeAction(arg_77_0, arg_77_1, arg_77_2, arg_77_3)
	local var_77_0 = arg_77_2:GetPaintingAction(DialogueStep.PAINTING_ACTION_SHAKE)

	if not var_77_0 then
		arg_77_3()

		return
	end

	local function var_77_1(arg_78_0, arg_78_1)
		local var_78_0 = arg_78_0.x or 0
		local var_78_1 = arg_78_0.y or 10
		local var_78_2 = arg_78_0.dur or 1
		local var_78_3 = arg_78_0.delay or 0
		local var_78_4 = arg_78_0.number or 1
		local var_78_5 = tf(arg_77_1).localPosition

		arg_77_0:TweenMove(arg_77_1, Vector3(var_78_5.x + var_78_0, var_78_5.y + var_78_1, 0), var_78_2, var_78_4, var_78_3, arg_78_1)
	end

	local var_77_2 = {}

	for iter_77_0, iter_77_1 in pairs(var_77_0) do
		table.insert(var_77_2, function(arg_79_0)
			var_77_1(iter_77_1, arg_79_0)
		end)
	end

	parallelAsync(var_77_2, function()
		if arg_77_3 then
			arg_77_3()
		end
	end)
end

function var_0_0.StartPatiningZoomAction(arg_81_0, arg_81_1, arg_81_2, arg_81_3)
	local var_81_0 = arg_81_2:GetPaintingAction(DialogueStep.PAINTING_ACTION_ZOOM)

	if not var_81_0 then
		arg_81_3()

		return
	end

	local function var_81_1(arg_82_0, arg_82_1)
		if not arg_82_0.from then
			local var_82_0 = {
				0,
				0,
				0
			}
		end

		local var_82_1 = arg_82_0.to or {
			1,
			1,
			1
		}
		local var_82_2 = arg_82_0.dur or 0
		local var_82_3 = arg_82_0.delay or 0

		arg_81_0:TweenScale(arg_81_1, Vector3(var_82_1[1], var_82_1[2], var_82_1[3]), var_82_2, var_82_3, arg_82_1)
	end

	local var_81_2 = {}

	for iter_81_0, iter_81_1 in pairs(var_81_0) do
		table.insert(var_81_2, function(arg_83_0)
			var_81_1(iter_81_1, arg_83_0)
		end)
	end

	parallelAsync(var_81_2, function()
		if arg_81_3 then
			arg_81_3()
		end
	end)
end

function var_0_0.StartPatiningRotateAction(arg_85_0, arg_85_1, arg_85_2, arg_85_3)
	local var_85_0 = arg_85_2:GetPaintingAction(DialogueStep.PAINTING_ACTION_ROTATE)

	if not var_85_0 then
		arg_85_3()

		return
	end

	local function var_85_1(arg_86_0, arg_86_1)
		local var_86_0 = arg_86_0.value
		local var_86_1 = arg_86_0.dur or 1
		local var_86_2 = arg_86_0.number or 1
		local var_86_3 = arg_86_0.delay or 0

		arg_85_0:TweenRotate(arg_85_1, var_86_0, var_86_1, var_86_2, var_86_3, arg_86_1)
	end

	local var_85_2 = {}

	for iter_85_0, iter_85_1 in pairs(var_85_0) do
		table.insert(var_85_2, function(arg_87_0)
			var_85_1(iter_85_1, arg_87_0)
		end)
	end

	parallelAsync(var_85_2, function()
		if arg_85_3 then
			arg_85_3()
		end
	end)
end

function var_0_0.StartPatiningMoveAction(arg_89_0, arg_89_1, arg_89_2, arg_89_3)
	local var_89_0 = arg_89_2:GetPaintingAction(DialogueStep.PAINTING_ACTION_MOVE)

	if not var_89_0 then
		arg_89_3()

		return
	end

	local function var_89_1(arg_90_0, arg_90_1)
		local var_90_0 = arg_90_0.x or 0
		local var_90_1 = arg_90_0.y or 0
		local var_90_2 = arg_90_0.dur or 1
		local var_90_3 = arg_90_0.delay or 0
		local var_90_4 = tf(arg_89_1).localPosition

		arg_89_0:TweenMove(arg_89_1, Vector3(var_90_4.x + var_90_0, var_90_4.y + var_90_1, 0), var_90_2, 1, var_90_3, arg_90_1)
	end

	local var_89_2 = {}

	for iter_89_0, iter_89_1 in pairs(var_89_0) do
		table.insert(var_89_2, function(arg_91_0)
			var_89_1(iter_89_1, arg_91_0)
		end)
	end

	parallelAsync(var_89_2, function()
		if arg_89_3 then
			arg_89_3()
		end
	end)
end

function var_0_0.StartMovePrevPaintingToSide(arg_93_0, arg_93_1, arg_93_2, arg_93_3)
	local var_93_0 = arg_93_1:GetPaintingMoveToSide()

	if not var_93_0 or not arg_93_2 then
		arg_93_3()

		return
	end

	local var_93_1 = arg_93_0:GetSideTF(arg_93_2:GetSide())

	if not var_93_1 then
		arg_93_3()

		return
	end

	local var_93_2 = var_93_0.time
	local var_93_3 = var_93_0.side
	local var_93_4 = arg_93_0:GetSideTF(var_93_3)

	if not var_93_4 then
		arg_93_3()

		return
	end

	if arg_93_1.side ~= arg_93_2.side then
		if var_93_1:Find("fitter").childCount > 0 then
			local var_93_5 = var_93_1:Find("fitter"):GetChild(0)

			removeAllChildren(var_93_4:Find("fitter"))
			setParent(var_93_5, var_93_4:Find("fitter"))

			local var_93_6 = arg_93_2:GetPaintingDir()

			var_93_4.localScale = Vector3(var_93_6, math.abs(var_93_6), 1)
		end
	else
		local var_93_7 = arg_93_2:GetPainting()

		if var_93_7 then
			setPaintingPrefab(var_93_4, var_93_7, "duihua")
		end
	end

	local var_93_8 = tf(var_93_4).localPosition

	arg_93_0:TweenValue(var_93_4, var_93_1.localPosition.x, var_93_8.x, var_93_2, 0, function(arg_94_0)
		setAnchoredPosition(var_93_4, {
			x = arg_94_0
		})
	end, arg_93_3)

	var_93_4.localPosition = Vector2(var_93_1.localPosition.x, var_93_4.localPosition.y, 0)
end

local function var_0_9(arg_95_0, arg_95_1, arg_95_2, arg_95_3, arg_95_4)
	local var_95_0 = arg_95_1:GetComponentsInChildren(typeof(Image))

	for iter_95_0 = 0, var_95_0.Length - 1 do
		local var_95_1 = var_95_0[iter_95_0]

		if var_95_1.gameObject.name == "temp_mask" then
			var_95_1.material = arg_95_4 and arg_95_0.maskMaterial or arg_95_0.maskMaterialForWithLayer
		elseif var_95_1.gameObject.name == "face" then
			var_95_1.material = arg_95_0.glitchArtMaterial
		elseif arg_95_3.hasPaintbg and var_95_1.gameObject == arg_95_2.gameObject then
			var_95_1.material = arg_95_0.glitchArtMaterialForPaintingBg
		else
			var_95_1.material = arg_95_0.glitchArtMaterialForPainting
		end
	end
end

local function var_0_10(arg_96_0, arg_96_1, arg_96_2, arg_96_3, arg_96_4)
	local var_96_0 = arg_96_1:GetComponentsInChildren(typeof(Image))
	local var_96_1 = {}
	local var_96_2 = arg_96_2:GetComponent(typeof(Image))

	if var_96_2 then
		table.insert(var_96_1, var_96_2.gameObject)
	end

	for iter_96_0 = 1, arg_96_3 - 1 do
		local var_96_3 = arg_96_4:GetChild(iter_96_0 - 1)

		table.insert(var_96_1, var_96_3.gameObject)
	end

	for iter_96_1 = 0, var_96_0.Length - 1 do
		local var_96_4 = var_96_0[iter_96_1]

		if var_96_4.gameObject.name == "temp_mask" then
			var_96_4.material = arg_96_0.maskMaterial
		elseif var_96_4.gameObject.name == "face" then
			var_96_4.material = arg_96_0.glitchArtMaterial
		elseif table.contains(var_96_1, var_96_4.gameObject) then
			var_96_4.material = arg_96_0.glitchArtMaterialForPaintingBg
		else
			var_96_4.material = arg_96_0.glitchArtMaterialForPainting
		end
	end
end

function var_0_0.AddGlitchArtEffectForPating(arg_97_0, arg_97_1, arg_97_2, arg_97_3)
	local var_97_0 = arg_97_3:ShouldAddGlitchArtEffect()
	local var_97_1 = arg_97_3:IsNoHeadPainting()

	if var_97_0 and arg_97_3:GetExPression() ~= nil and not var_97_1 then
		local var_97_2 = arg_97_2:Find("face")

		cloneTplTo(var_97_2, var_97_2.parent, "temp_mask"):SetAsFirstSibling()

		local var_97_3 = arg_97_2:Find("layers")
		local var_97_4 = IsNil(var_97_3)

		if not var_97_4 and arg_97_3:GetPaintingRwIndex() > 0 then
			var_0_10(arg_97_0, arg_97_1, arg_97_2, arg_97_3:GetPaintingRwIndex(), var_97_3)
		else
			var_0_9(arg_97_0, arg_97_1, arg_97_2, arg_97_3, var_97_4)
		end
	elseif var_97_0 then
		local var_97_5 = arg_97_1:GetComponentsInChildren(typeof(Image))

		for iter_97_0 = 0, var_97_5.Length - 1 do
			var_97_5[iter_97_0].material = arg_97_0.glitchArtMaterial
		end
	end

	if var_97_0 then
		local var_97_6 = GameObject.Find("/OverlayCamera/Overlay/UIMain/AwardInfoUI(Clone)/items/SpriteMask")

		if var_97_6 and var_97_6.activeInHierarchy then
			setActive(var_97_6, false)

			arg_97_0.spriteMask = var_97_6
		end
	end
end

function var_0_0.UpdateContent(arg_98_0, arg_98_1, arg_98_2)
	local function var_98_0()
		setActive(arg_98_0.nextTr, true)
		arg_98_2()
	end

	for iter_98_0, iter_98_1 in ipairs(arg_98_0.tags) do
		setActive(iter_98_1, iter_98_0 == arg_98_1:GetTag())
	end

	arg_98_0.conentTxt.fontSize = arg_98_1:GetFontSize() or arg_98_0.defualtFontSize

	local var_98_1 = arg_98_1:GetContent()

	arg_98_0.conentTxt.text = var_98_1

	local var_98_2 = 999

	if var_98_1 and var_98_1 ~= "" then
		var_98_2 = System.String.New(var_98_1).Length
	end

	if var_98_1 and var_98_1 ~= "" and var_98_1 ~= "…" and #var_98_1 > 1 and var_98_2 > 1 then
		arg_98_0:UpdateTypeWriter(arg_98_1, var_98_0)
	else
		var_98_0()
	end

	local var_98_3, var_98_4, var_98_5, var_98_6 = arg_98_0:GetSideTF(arg_98_1:GetSide())

	if var_98_4 then
		local var_98_7 = arg_98_1:GetNameWithColor()
		local var_98_8 = var_98_7 and var_98_7 ~= ""

		setActive(var_98_4, var_98_8)

		if var_98_8 then
			local var_98_9 = arg_98_1:GetNameColorCode()

			var_98_4:Find("Text"):GetComponent(typeof(Outline)).effectColor = Color.NewHex(var_98_9)
		end

		var_98_5.text = var_98_7

		setText(var_98_5.gameObject.transform:Find("subText"), arg_98_1:GetSubActorName())
	end
end

function var_0_0.SetContentBgAlpha(arg_100_0, arg_100_1)
	if arg_100_0.contentBgAlpha ~= arg_100_1 then
		for iter_100_0, iter_100_1 in ipairs(arg_100_0.contentBgs) do
			GetOrAddComponent(iter_100_1, typeof(CanvasGroup)).alpha = arg_100_1
		end

		arg_100_0.contentBgAlpha = arg_100_1
	end
end

function var_0_0.GetSideTF(arg_101_0, arg_101_1)
	local var_101_0
	local var_101_1
	local var_101_2
	local var_101_3

	if DialogueStep.SIDE_LEFT == arg_101_1 then
		var_101_0, var_101_1, var_101_2, var_101_3 = arg_101_0.actorLeft, arg_101_0.nameTr, arg_101_0.nameTxt, arg_101_0.subActorLeft
	elseif DialogueStep.SIDE_RIGHT == arg_101_1 then
		var_101_0, var_101_1, var_101_2, var_101_3 = arg_101_0.actorRgiht, arg_101_0.nameTr, arg_101_0.nameTxt, arg_101_0.subActorRgiht
	elseif DialogueStep.SIDE_MIDDLE == arg_101_1 then
		var_101_0, var_101_1, var_101_2, var_101_3 = arg_101_0.actorMiddle, arg_101_0.nameTr, arg_101_0.nameTxt, arg_101_0.subActorMiddle
	end

	return var_101_0, var_101_1, var_101_2, var_101_3
end

function var_0_0.RecyclesSubPantings(arg_102_0, arg_102_1)
	arg_102_1:each(function(arg_103_0, arg_103_1)
		arg_102_0:RecyclePainting(arg_103_1)
	end)
end

local function var_0_11(arg_104_0)
	if arg_104_0:Find("fitter").childCount == 0 then
		return
	end

	local var_104_0 = arg_104_0:Find("fitter"):GetChild(0)

	if var_104_0 then
		local var_104_1 = findTF(var_104_0, "shadow")

		if var_104_1 then
			setActive(var_104_1, false)
		end

		local var_104_2 = arg_104_0:GetComponentsInChildren(typeof(Image))

		for iter_104_0 = 0, var_104_2.Length - 1 do
			local var_104_3 = var_104_2[iter_104_0]
			local var_104_4 = Color.white

			if var_104_3.material ~= var_104_3.defaultGraphicMaterial then
				var_104_3.material = var_104_3.defaultGraphicMaterial
			end

			var_104_3.material:SetColor("_Color", var_104_4)
		end

		setGray(arg_104_0, false, true)
		retPaintingPrefab(arg_104_0, var_104_0.name)

		local var_104_5 = var_104_0:Find("temp_mask")

		if var_104_5 then
			Destroy(var_104_5)
		end
	end
end

function var_0_0.ClearMeshPainting(arg_105_0, arg_105_1)
	arg_105_0:ResetMeshPainting(arg_105_1)

	if arg_105_1:Find("fitter").childCount == 0 then
		return
	end

	local var_105_0 = arg_105_1:Find("fitter"):GetChild(0)

	if var_105_0 then
		retPaintingPrefab(arg_105_1, var_105_0.name)
	end
end

function var_0_0.ResetMeshPainting(arg_106_0, arg_106_1)
	if arg_106_1:Find("fitter").childCount == 0 then
		return
	end

	local var_106_0 = arg_106_1:Find("fitter"):GetChild(0)

	if var_106_0 then
		local var_106_1 = findTF(var_106_0, "shadow")

		if var_106_1 then
			setActive(var_106_1, false)
		end

		local var_106_2 = arg_106_1:GetComponentsInChildren(typeof(Image))

		for iter_106_0 = 0, var_106_2.Length - 1 do
			local var_106_3 = var_106_2[iter_106_0]
			local var_106_4 = Color.white

			if var_106_3.material ~= var_106_3.defaultGraphicMaterial then
				var_106_3.material = var_106_3.defaultGraphicMaterial

				var_106_3.material:SetColor("_Color", var_106_4)
			else
				var_106_3.material = nil
			end
		end

		setGray(arg_106_1, false, true)

		local var_106_5 = var_106_0:Find("temp_mask")

		if var_106_5 then
			Destroy(var_106_5)
		end
	end
end

local function var_0_12(arg_107_0, arg_107_1)
	local var_107_0 = arg_107_0.live2dChars[arg_107_1]
	local var_107_1 = false

	if var_107_0 then
		local var_107_2 = var_107_0._go:GetComponent("Live2D.Cubism.Rendering.CubismRenderController")

		ReflectionHelp.RefSetProperty(typeof("Live2D.Cubism.Rendering.CubismRenderController"), "SortingOrder", var_107_2, 0)
		var_107_0:Dispose()

		arg_107_0.live2dChars[arg_107_1] = nil
		var_107_1 = true
	end

	local var_107_3 = table.getCount(arg_107_0.live2dChars) <= 0

	if var_107_1 and var_107_3 then
		local var_107_4 = arg_107_0.front:GetComponent(typeof(GraphicRaycaster))

		if var_107_4 then
			Object.Destroy(var_107_4)
		end

		local var_107_5 = arg_107_0.front:GetComponent(typeof(Canvas))

		if var_107_5 then
			Object.Destroy(var_107_5)
		end
	end
end

local function var_0_13(arg_108_0, arg_108_1)
	local var_108_0 = arg_108_0.spinePainings[arg_108_1]
	local var_108_1 = false

	if var_108_0 then
		var_108_0:Dispose()

		arg_108_0.spinePainings[arg_108_1] = nil
		var_108_1 = true
	end

	local var_108_2 = table.getCount(arg_108_0.spinePainings) <= 0

	if var_108_1 and var_108_2 then
		local var_108_3 = arg_108_0.front:GetComponent(typeof(GraphicRaycaster))

		if var_108_3 then
			Object.Destroy(var_108_3)
		end

		local var_108_4 = arg_108_0.front:GetComponent(typeof(Canvas))

		if var_108_4 then
			Object.Destroy(var_108_4)
		end
	end
end

function var_0_0.RecyclePainting(arg_109_0, arg_109_1)
	if type(arg_109_1) == "table" then
		local var_109_0 = _.map(arg_109_1, function(arg_110_0)
			return arg_109_0[arg_110_0]
		end)

		arg_109_0:RecyclePaintingList(var_109_0)
	else
		arg_109_0:ClearMeshPainting(arg_109_1)
		var_0_12(arg_109_0, arg_109_1)
		var_0_13(arg_109_0, arg_109_1)
	end
end

function var_0_0.RecyclePaintingList(arg_111_0, arg_111_1)
	for iter_111_0, iter_111_1 in ipairs(arg_111_1) do
		arg_111_0:ClearMeshPainting(iter_111_1)
		var_0_12(arg_111_0, iter_111_1)
		var_0_13(arg_111_0, iter_111_1)
	end
end

function var_0_0.Resume(arg_112_0)
	var_0_0.super.Resume(arg_112_0)

	if arg_112_0.typewriterSpeed ~= 0 then
		arg_112_0.typewriter:setSpeed(arg_112_0.typewriterSpeed)
	end
end

function var_0_0.Pause(arg_113_0)
	var_0_0.super.Pause(arg_113_0)

	if arg_113_0.typewriterSpeed ~= 0 then
		arg_113_0.typewriter:setSpeed(100000000)
	end
end

function var_0_0.OnClear(arg_114_0)
	if arg_114_0.spriteMask then
		setActive(arg_114_0.spriteMask, true)

		arg_114_0.spriteMask = nil
	end
end

function var_0_0.FadeOutPainting(arg_115_0, arg_115_1, arg_115_2, arg_115_3)
	local var_115_0 = arg_115_2:GetComponent(typeof(CanvasGroup))
	local var_115_1 = arg_115_1:GetFadeOutPaintingTime()

	if var_115_1 <= 0 then
		arg_115_3()

		return
	end

	local var_115_2 = arg_115_1:ShouldAddHeadMaskWhenFade()

	if var_115_2 then
		arg_115_0:AddHeadMask(arg_115_2)
	end

	arg_115_0:TweenValueForcanvasGroup(var_115_0, 1, 0, var_115_1, 0, function()
		if var_115_2 then
			arg_115_0:ClearHeadMask(arg_115_2)
		end

		arg_115_3()
	end)
end

function var_0_0.OnWillExit(arg_117_0, arg_117_1, arg_117_2, arg_117_3)
	if not arg_117_2 or not arg_117_2:IsDialogueMode() then
		arg_117_3()

		return
	end

	local var_117_0 = arg_117_0:GetRecycleActorList(arg_117_2, arg_117_1)
	local var_117_1

	if arg_117_2:ShouldMoveToSide() then
		var_117_1 = arg_117_0:GetSideTF(arg_117_1:GetSide())
	end

	local var_117_2 = {}

	for iter_117_0, iter_117_1 in pairs(var_117_0) do
		if (not var_117_1 or iter_117_1 ~= var_117_1) and iter_117_1:Find("fitter").childCount > 0 then
			table.insert(var_117_2, function(arg_118_0)
				arg_117_0:FadeOutPainting(arg_117_1, iter_117_1, arg_118_0)
			end)
		end
	end

	parallelAsync(var_117_2, arg_117_3)
end

function var_0_0.OnEnd(arg_119_0)
	arg_119_0.conentTxt.fontSize = arg_119_0.defualtFontSize

	arg_119_0:ClearGlitchArtForPortrait()
	arg_119_0:ClearCanMarkNode()

	local var_119_0 = {
		"actorLeft",
		"actorMiddle",
		"actorRgiht"
	}

	arg_119_0:RecyclePainting(var_119_0)

	arg_119_0.conentTxt.text = ""
	arg_119_0.nameTxt.text = ""

	for iter_119_0, iter_119_1 in ipairs({
		"actorLeft",
		"actorMiddle",
		"actorRgiht"
	}) do
		arg_119_0[iter_119_1]:GetComponent(typeof(CanvasGroup)).alpha = 1
	end
end

return var_0_0
