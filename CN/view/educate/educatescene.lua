local var_0_0 = class("EducateScene", import(".base.EducateBaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "EducateUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0:initData()
	arg_2_0:findUI()
	arg_2_0:addListener()
end

function var_0_0.PlayBGM(arg_3_0)
	local var_3_0 = getProxy(EducateProxy):GetCharData():GetBgm()

	if var_3_0 then
		pg.BgmMgr.GetInstance():Push(arg_3_0.__cname, var_3_0)
	end
end

function var_0_0.initData(arg_4_0)
	return
end

function var_0_0.findUI(arg_5_0)
	arg_5_0.mainAnim = arg_5_0:findTF("anim_root"):GetComponent(typeof(Animation))
	arg_5_0.bgTF = arg_5_0:findTF("anim_root/bg")
	arg_5_0.blurPanel = arg_5_0:findTF("anim_root/blur_panel")
	arg_5_0.blurPanelAnim = arg_5_0.blurPanel:GetComponent(typeof(Animation))
	arg_5_0.topTF = arg_5_0:findTF("top", arg_5_0.blurPanel)
	arg_5_0.favorBtn = arg_5_0:findTF("favor", arg_5_0.topTF)
	arg_5_0.favorLvTF = arg_5_0:findTF("anim_root/Text", arg_5_0.favorBtn)
	arg_5_0.favorMaxTF = arg_5_0:findTF("anim_root/max", arg_5_0.favorBtn)
	arg_5_0.favorBtnAnim = arg_5_0:findTF("anim_root", arg_5_0.favorBtn):GetComponent(typeof(Animation))
	arg_5_0.favorBtnAnimEvent = arg_5_0:findTF("anim_root", arg_5_0.favorBtn):GetComponent(typeof(DftAniEvent))

	arg_5_0.favorBtnAnimEvent:SetTriggerEvent(function()
		arg_5_0:updateFavorBtn()
	end)

	arg_5_0.mainTF = arg_5_0:findTF("anim_root/main")
	arg_5_0.paintTF = arg_5_0:findTF("painting", arg_5_0.mainTF)
	arg_5_0.dialogueTF = arg_5_0:findTF("dialogue", arg_5_0.blurPanel)
	arg_5_0.dialogueContent = arg_5_0:findTF("content", arg_5_0.dialogueTF)

	setActive(arg_5_0.dialogueTF, false)

	arg_5_0.bubbleTF = arg_5_0:findTF("anim_root/blur_panel/bubble")

	setActive(arg_5_0.bubbleTF, false)

	arg_5_0.bubbleBtn = arg_5_0:findTF("bubble", arg_5_0.bubbleTF)
	arg_5_0.optionsTF = arg_5_0:findTF("options", arg_5_0.mainTF)
	arg_5_0.chatBtn = arg_5_0:findTF("options/chat", arg_5_0.optionsTF)
	arg_5_0.giftBtn = arg_5_0:findTF("options/gift", arg_5_0.optionsTF)

	setActive(arg_5_0.optionsTF, false)

	arg_5_0.bottomTF = arg_5_0:findTF("bottom", arg_5_0.blurPanel)
	arg_5_0.bookBtn = arg_5_0:findTF("left/btns/book", arg_5_0.bottomTF)

	setText(arg_5_0:findTF("unlock/Text", arg_5_0.bookBtn), i18n("child_btn_collect"))

	arg_5_0.mindBtn = arg_5_0:findTF("left/btns/mind", arg_5_0.bottomTF)

	setText(arg_5_0:findTF("unlock/Text", arg_5_0.mindBtn), i18n("child_btn_mind"))

	arg_5_0.bagBtn = arg_5_0:findTF("left/btns/bag", arg_5_0.bottomTF)

	setText(arg_5_0:findTF("unlock/Text", arg_5_0.bagBtn), i18n("child_btn_bag"))

	arg_5_0.datePanel = EducateDatePanel.New(arg_5_0:findTF("date", arg_5_0.topTF), arg_5_0.event)
	arg_5_0.favorPanel = EducateFavorPanel.New(arg_5_0:findTF("favor_panel", arg_5_0.topTF), arg_5_0.event)
	arg_5_0.resPanel = EducateResPanel.New(arg_5_0:findTF("res", arg_5_0.topTF), arg_5_0.event)
	arg_5_0.topPanel = EducateTopPanel.New(arg_5_0:findTF("top_right", arg_5_0.topTF), arg_5_0.event)
	arg_5_0.targetPanel = EducateTargetPanel.New(arg_5_0:findTF("target", arg_5_0.topTF), arg_5_0.event)
	arg_5_0.bottomPanel = EducateBottomPanel.New(arg_5_0:findTF("right", arg_5_0.bottomTF), arg_5_0.event, {
		isMainEnter = arg_5_0.contextData.isMainEnter
	})
	arg_5_0.archivePanel = EducateArchivePanel.New(arg_5_0:findTF("archive_panel", arg_5_0.mainTF), arg_5_0.event, {
		isShow = true,
		isMainEnter = arg_5_0.contextData.isMainEnter
	})
end

function var_0_0._loadSubViews(arg_7_0)
	arg_7_0.datePanel:Load()
	arg_7_0.favorPanel:Load()
	arg_7_0.resPanel:Load()
	arg_7_0.topPanel:Load()
	arg_7_0.targetPanel:Load()
	arg_7_0.bottomPanel:Load()
	arg_7_0.archivePanel:Load()
	pg.UIMgr.GetInstance():OverlayPanelPB(arg_7_0.blurPanel, {
		pbList = {
			arg_7_0:findTF("bottom/left", arg_7_0.blurPanel)
		},
		groupName = arg_7_0:getGroupNameFromData()
	})

	local var_7_0 = arg_7_0.contextData.isMainEnter and "anim_educate_educateUI_bg_in" or "anim_educate_educateUI_bg_show"

	arg_7_0.mainAnim:Play(var_7_0)

	local var_7_1 = arg_7_0.contextData.isMainEnter and "anim_educate_educateUI_in" or "anim_educate_educateUI_show"

	arg_7_0.blurPanelAnim:Play(var_7_1)
end

function var_0_0.addListener(arg_8_0)
	onButton(arg_8_0, arg_8_0.chatBtn, function()
		pg.TipsMgr.GetInstance():ShowTips("触发对话[待开发]...")
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.giftBtn, function()
		pg.TipsMgr.GetInstance():ShowTips("送礼(?)...")
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.favorBtn, function()
		arg_8_0.favorPanel:Show()
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.bookBtn, function()
		arg_8_0:emit(var_0_0.EDUCATE_GO_SUBLAYER, Context.New({
			mediator = EducateCollectEntranceMediator,
			viewComponent = EducateCollectEntranceLayer
		}))
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.mindBtn, function()
		if isActive(arg_8_0:findTF("lock", arg_8_0.mindBtn)) then
			return
		end

		arg_8_0:emit(var_0_0.EDUCATE_GO_SUBLAYER, Context.New({
			mediator = EducateMindMediator,
			viewComponent = EducateMindLayer,
			data = {
				onExit = function()
					arg_8_0:checkBubbleShow()
				end
			}
		}))
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0.bagBtn, function()
		if isActive(arg_8_0:findTF("lock", arg_8_0.bagBtn)) then
			return
		end

		arg_8_0:emit(var_0_0.EDUCATE_GO_SUBLAYER, Context.New({
			mediator = EducateBagMediator,
			viewComponent = EducateBagLayer
		}))
	end, SFX_PANEL)
	onButton(arg_8_0, arg_8_0:findTF("fitter", arg_8_0.paintTF), function()
		arg_8_0:ShowDialogue()
	end, SFX_PANEL)
end

function var_0_0.didEnter(arg_17_0)
	if arg_17_0.contextData.onEnter then
		arg_17_0.contextData.onEnter()

		arg_17_0.contextData.onEnter = nil
	end

	arg_17_0:updatePaintingUI()
	arg_17_0:updateUnlockBtns()
	arg_17_0:updateNewTips()
	arg_17_0:updateMindTip()
	arg_17_0:updateFavorBtn()
	arg_17_0:SeriesCheck()
end

function var_0_0.SeriesCheck(arg_18_0)
	local var_18_0 = {}

	table.insert(var_18_0, function(arg_19_0)
		arg_18_0:CheckNewChar(arg_19_0)
	end)
	table.insert(var_18_0, function(arg_20_0)
		if getProxy(EducateProxy):GetPlanProxy():CheckExcute() then
			arg_18_0:emit(EducateMediator.ON_EXECTUE_PLANS)
		else
			arg_20_0()
		end
	end)
	table.insert(var_18_0, function(arg_21_0)
		arg_18_0:CheckTips(arg_21_0)
	end)
	table.insert(var_18_0, function(arg_22_0)
		if getProxy(EducateProxy):GetEventProxy():NeedGetHomeEventData() then
			arg_18_0:emit(EducateMediator.ON_GET_EVENT, arg_22_0)
		else
			arg_22_0()
		end
	end)
	arg_18_0:checkBubbleShow()
	table.insert(var_18_0, function(arg_23_0)
		if not arg_18_0.contextData.ingoreGuideCheck then
			EducateGuideSequence.CheckGuide(arg_18_0.__cname, arg_23_0)
		else
			arg_18_0.contextData.ingoreGuideCheck = nil

			arg_23_0()
		end
	end)
	seriesAsync(var_18_0, function()
		return
	end)
end

function var_0_0.OnCheckGuide(arg_25_0)
	EducateGuideSequence.CheckGuide(arg_25_0.__cname, function()
		return
	end)
end

function var_0_0.CheckTips(arg_27_0, arg_27_1)
	local var_27_0 = {}

	for iter_27_0, iter_27_1 in ipairs(EducateTipHelper.GetSystemUnlockTips()) do
		table.insert(var_27_0, function(arg_28_0)
			arg_27_0:emit(var_0_0.EDUCATE_ON_UNLOCK_TIP, {
				type = EducateUnlockTipLayer.UNLOCK_TYPE_SYSTEM,
				single = iter_27_1,
				onExit = arg_28_0
			})
		end)
	end

	seriesAsync(var_27_0, function()
		arg_27_1()
	end)
end

function var_0_0.CheckNewChar(arg_30_0, arg_30_1)
	if getProxy(EducateProxy):GetCharData():GetCallName() == "" then
		setActive(arg_30_0._tf, false)

		local var_30_0 = {}

		table.insert(var_30_0, function(arg_31_0)
			pg.PerformMgr.GetInstance():PlayGroup(EducateConst.FIRST_ENTER_PERFORM_IDS, arg_31_0)
		end)
		table.insert(var_30_0, function(arg_32_0)
			arg_30_0:emit(var_0_0.EDUCATE_GO_SUBLAYER, Context.New({
				mediator = EducateNewCharMediator,
				viewComponent = EducateNewCharLayer,
				data = {
					callback = arg_32_0
				}
			}))
		end)
		table.insert(var_30_0, function(arg_33_0)
			pg.PerformMgr.GetInstance():PlayOne(EducateConst.AFTER_SET_CALLNAME_PERFORM_ID, arg_33_0)
		end)
		seriesAsync(var_30_0, function()
			setActive(arg_30_0._tf, true)
			arg_30_0:_loadSubViews()
			arg_30_1()
		end)
	else
		arg_30_0:_loadSubViews()
		arg_30_1()
	end
end

function var_0_0.showBubble(arg_35_0, arg_35_1)
	setActive(arg_35_0.bubbleTF, true)
	onButton(arg_35_0, arg_35_0.bubbleBtn, function()
		arg_35_1()
		setActive(arg_35_0.bubbleTF, false)
	end, SFX_PANEL)
end

function var_0_0.PlayPerformWithDrops(arg_37_0, arg_37_1, arg_37_2, arg_37_3)
	local var_37_0 = EducateHelper.GetDialogueShowDrops(arg_37_2)
	local var_37_1 = EducateHelper.GetCommonShowDrops(arg_37_2)

	local function var_37_2()
		if #var_37_1 > 0 then
			arg_37_0:emit(var_0_0.EDUCATE_ON_AWARD, {
				items = var_37_1,
				removeFunc = function()
					if arg_37_3 then
						arg_37_3()
					end
				end
			})
		elseif arg_37_3 then
			arg_37_3()
		end
	end

	if #arg_37_1 > 0 then
		pg.PerformMgr.GetInstance():PlayGroup(arg_37_1, var_37_2, var_37_0)
	elseif var_37_2 then
		var_37_2()
	end
end

function var_0_0.ShowFavorUpgrade(arg_40_0, arg_40_1, arg_40_2, arg_40_3)
	arg_40_0:PlayPerformWithDrops(arg_40_2, arg_40_1, function()
		if #arg_40_1 > 0 then
			arg_40_0:emit(var_0_0.EDUCATE_ON_AWARD, {
				items = arg_40_1,
				removeFunc = function()
					arg_40_0.favorBtnAnim:Play("anim_educate_favor_levelup")

					if arg_40_3 then
						arg_40_3()
					end
				end
			})
		else
			arg_40_0.favorBtnAnim:Play("anim_educate_favor_levelup")

			if arg_40_3 then
				arg_40_3()
			end
		end
	end)
end

function var_0_0.ShowSpecialEvent(arg_43_0, arg_43_1, arg_43_2, arg_43_3)
	local var_43_0 = pg.child_event_special[arg_43_1].performance

	arg_43_0:PlayPerformWithDrops(var_43_0, arg_43_2, function()
		if #arg_43_2 > 0 then
			arg_43_0:emit(var_0_0.EDUCATE_ON_AWARD, {
				items = arg_43_2,
				removeFunc = function()
					if arg_43_3 then
						arg_43_3()
					end
				end
			})
		elseif arg_43_3 then
			arg_43_3()
		end
	end)
end

function var_0_0.checkBubbleShow(arg_46_0)
	local var_46_0 = getProxy(EducateProxy):GetEventProxy():GetHomeSpecEvents()
	local var_46_1 = getProxy(EducateProxy):GetCharData()

	if #var_46_0 > 0 then
		setActive(arg_46_0:findTF("Text", arg_46_0.bubbleBtn), true)
		setActive(arg_46_0:findTF("Image", arg_46_0.bubbleBtn), false)
		arg_46_0:showBubble(function()
			arg_46_0:emit(EducateMediator.ON_SPECIAL_EVENT_TRIGGER, {
				id = var_46_0[1].id,
				callback = function()
					arg_46_0:checkBubbleShow()
					EducateGuideSequence.CheckGuide(arg_46_0.__cname, function()
						return
					end)
				end
			})
		end)
	elseif var_46_1:CheckFavor() then
		setActive(arg_46_0:findTF("Text", arg_46_0.bubbleBtn), false)
		setActive(arg_46_0:findTF("Image", arg_46_0.bubbleBtn), true)
		arg_46_0:showBubble(function()
			arg_46_0:emit(EducateMediator.ON_UPGRADE_FAVOR, function()
				arg_46_0:checkBubbleShow()
				EducateGuideSequence.CheckGuide(arg_46_0.__cname, function()
					return
				end)
			end)
		end)
	else
		setActive(arg_46_0.bubbleTF, false)
		removeOnButton(arg_46_0.bubbleTF)
	end
end

function var_0_0.updateResPanel(arg_53_0)
	arg_53_0.resPanel:Flush()
end

function var_0_0.updateArchivePanel(arg_54_0)
	arg_54_0.archivePanel:Flush()
end

function var_0_0.showArchivePanel(arg_55_0)
	arg_55_0.archivePanel:showPanel()
end

function var_0_0.updateDatePanel(arg_56_0)
	arg_56_0.datePanel:Flush()
	arg_56_0:updateUnlockBtns()
end

function var_0_0.updateUnlockBtns(arg_57_0)
	local var_57_0 = EducateHelper.IsSystemUnlock(EducateConst.SYSTEM_MEMORY)

	setActive(arg_57_0:findTF("lock", arg_57_0.bookBtn), not var_57_0)
	setActive(arg_57_0:findTF("unlock", arg_57_0.bookBtn), var_57_0)

	local var_57_1 = EducateHelper.IsSystemUnlock(EducateConst.SYSTEM_BAG)

	setActive(arg_57_0:findTF("lock", arg_57_0.bagBtn), not var_57_1)
	setActive(arg_57_0:findTF("unlock", arg_57_0.bagBtn), var_57_1)

	local var_57_2 = EducateHelper.IsSystemUnlock(EducateConst.SYSTEM_FAVOR_AND_MIND)

	setActive(arg_57_0:findTF("lock", arg_57_0.mindBtn), not var_57_2)
	setActive(arg_57_0:findTF("unlock", arg_57_0.mindBtn), var_57_2)
	setActive(arg_57_0.favorBtn, var_57_2)
end

function var_0_0.updateMindTip(arg_58_0)
	setActive(arg_58_0:findTF("unlock/tip", arg_58_0.mindBtn), getProxy(EducateProxy):GetTaskProxy():IsShowMindTasksTip())
end

function var_0_0.updateWeekDay(arg_59_0, arg_59_1)
	arg_59_0.datePanel:UpdateWeekDay(arg_59_1)
end

function var_0_0.updateFavorBtn(arg_60_0)
	local var_60_0 = getProxy(EducateProxy):GetCharData()
	local var_60_1 = var_60_0:GetFavor()

	setText(arg_60_0.favorLvTF, var_60_1.lv)

	local var_60_2 = var_60_0:GetFavorMaxLv()

	setActive(arg_60_0.favorMaxTF, var_60_1.lv == var_60_2)
end

function var_0_0.updateTargetPanel(arg_61_0)
	arg_61_0.targetPanel:Flush()
end

function var_0_0.updateBottomPanel(arg_62_0)
	arg_62_0.bottomPanel:Flush()
end

function var_0_0.updatePaintingUI(arg_63_0)
	local var_63_0 = getProxy(EducateProxy):GetCharData()

	arg_63_0.bgName = var_63_0:GetBGName()
	arg_63_0.paintingName = var_63_0:GetPaintingName()
	arg_63_0.wordList, arg_63_0.faceList = var_63_0:GetMainDialogueInfo()

	local var_63_1 = LoadSprite("bg/" .. arg_63_0.bgName)

	setImageSprite(arg_63_0.bgTF, var_63_1, false)
	setPaintingPrefab(arg_63_0.paintTF, arg_63_0.paintingName, "yangcheng")
end

function var_0_0.ShowDialogue(arg_64_0)
	if LeanTween.isTweening(arg_64_0.dialogueTF) then
		return
	end

	local var_64_0 = math.random(#arg_64_0.wordList)
	local var_64_1 = pg.child_word[arg_64_0.wordList[var_64_0]].word

	if not arg_64_0.callName then
		arg_64_0.callName = getProxy(EducateProxy):GetCharData():GetCallName()
	end

	local var_64_2 = string.gsub(var_64_1, "$1", arg_64_0.callName)

	setText(arg_64_0.dialogueContent, var_64_2)

	local var_64_3 = GetSpriteFromAtlas("paintingface/" .. arg_64_0.paintingName, arg_64_0.faceList[var_64_0])
	local var_64_4 = arg_64_0:findTF("fitter", arg_64_0.paintTF):GetChild(0):Find("face")

	if var_64_4 and var_64_3 then
		setImageSprite(var_64_4, var_64_3)
		setActive(var_64_4, true)
	end

	arg_64_0.dialogueTF.localScale = Vector3.zero

	setActive(arg_64_0.dialogueTF, true)
	LeanTween.scale(arg_64_0.dialogueTF, Vector3.one, 0.3):setEase(LeanTweenType.easeOutBack):setOnComplete(System.Action(function()
		LeanTween.scale(arg_64_0.dialogueTF, Vector3.zero, 0.3):setEase(LeanTweenType.easeInBack):setDelay(3):setOnComplete(System.Action(function()
			setActive(arg_64_0.dialogueTF, false)

			if var_64_4 then
				setActive(var_64_4, false)
			end
		end))
	end))
end

function var_0_0.updateNewTips(arg_67_0)
	arg_67_0:updateBookNewTip()
	arg_67_0:updateMindNewTip()
end

function var_0_0.updateBookNewTip(arg_68_0)
	local var_68_0 = underscore.any(pg.child_memory.all, function(arg_69_0)
		return EducateTipHelper.IsShowNewTip(EducateTipHelper.NEW_MEMORY, arg_69_0)
	end)
	local var_68_1 = EducateTipHelper.IsShowNewTip(EducateTipHelper.NEW_POLAROID)

	setActive(arg_68_0:findTF("unlock/new", arg_68_0.bookBtn), var_68_0 or var_68_1)
end

function var_0_0.updateMindNewTip(arg_70_0)
	setActive(arg_70_0:findTF("unlock/new", arg_70_0.mindBtn), EducateTipHelper.IsShowNewTip(EducateTipHelper.NEW_MIND_TASK))
end

function var_0_0.FlushView(arg_71_0)
	arg_71_0.datePanel:Flush()
	arg_71_0.favorPanel:Flush()
	arg_71_0.resPanel:Flush()
	arg_71_0.targetPanel:Flush()
	arg_71_0.bottomPanel:Flush()
	arg_71_0.archivePanel:Flush()
	arg_71_0:updatePaintingUI()
	arg_71_0:updateUnlockBtns()
	arg_71_0:updateNewTips()
	arg_71_0:updateMindTip()
	arg_71_0:updateFavorBtn()
	arg_71_0:SeriesCheck()
end

function var_0_0.onBackPressed(arg_72_0)
	arg_72_0:emit(EducateBaseUI.ON_HOME)
end

function var_0_0.willExit(arg_73_0)
	arg_73_0.contextData.isMainEnter = nil

	arg_73_0.datePanel:Destroy()

	arg_73_0.datePanel = nil

	arg_73_0.favorPanel:Destroy()

	arg_73_0.favorPanel = nil

	arg_73_0.resPanel:Destroy()

	arg_73_0.resPanel = nil

	arg_73_0.topPanel:Destroy()

	arg_73_0.topPanel = nil

	arg_73_0.targetPanel:Destroy()

	arg_73_0.targetPanel = nil

	arg_73_0.bottomPanel:Destroy()

	arg_73_0.bottomPanel = nil

	arg_73_0.archivePanel:Destroy()

	arg_73_0.archivePanel = nil

	if LeanTween.isTweening(arg_73_0.dialogueTF) then
		LeanTween.cancel(arg_73_0.dialogueTF)
	end

	pg.UIMgr.GetInstance():UnOverlayPanel(arg_73_0.blurPanel, arg_73_0._tf)
end

return var_0_0
