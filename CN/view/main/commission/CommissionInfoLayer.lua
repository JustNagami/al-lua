local var_0_0 = class("CommissionInfoLayer", import("...base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "CommissionInfoUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.frame = arg_2_0:findTF("frame")
	arg_2_0.resourcesTF = arg_2_0:findTF("resources", arg_2_0.frame)
	arg_2_0.oilTF = arg_2_0:findTF("canteen/bubble/Text", arg_2_0.resourcesTF):GetComponent(typeof(Text))
	arg_2_0.goldTF = arg_2_0:findTF("merchant/bubble/Text", arg_2_0.resourcesTF):GetComponent(typeof(Text))
	arg_2_0.classTF = arg_2_0:findTF("class/bubble/Text", arg_2_0.resourcesTF):GetComponent(typeof(Text))
	arg_2_0.oilbubbleTF = arg_2_0:findTF("canteen/bubble", arg_2_0.resourcesTF)
	arg_2_0.goldbubbleTF = arg_2_0:findTF("merchant/bubble", arg_2_0.resourcesTF)
	arg_2_0.classbubbleTF = arg_2_0:findTF("class/bubble", arg_2_0.resourcesTF)

	local var_2_0 = getProxy(NavalAcademyProxy):GetClassVO():GetResourceType()
	local var_2_1 = Item.getConfigData(var_2_0).icon

	arg_2_0.classbubbleTF:Find("icon"):GetComponent(typeof(Image)).sprite = LoadSprite(var_2_1)
	arg_2_0.projectContainer = arg_2_0:findTF("main/content", arg_2_0.frame)
	arg_2_0.items = {
		CommissionInfoEventItem.New(arg_2_0:findTF("frame/main/content/event"), arg_2_0),
		CommissionInfoClassItem.New(arg_2_0:findTF("frame/main/content/class"), arg_2_0),
		CommissionInfoTechnologyItem.New(arg_2_0:findTF("frame/main/content/technology"), arg_2_0)
	}

	pg.UIMgr.GetInstance():BlurPanel(arg_2_0._tf, false, {
		weight = LayerWeightConst.SECOND_LAYER
	})

	arg_2_0.linkBtnPanel = arg_2_0:findTF("frame/link_btns/btns")
	arg_2_0.activityInsBtn = arg_2_0:findTF("frame/link_btns/btns/ins")
	arg_2_0.activtyUrExchangeBtn = arg_2_0:findTF("frame/link_btns/btns/urEx")
	arg_2_0.activtyUrExchangeTxt = arg_2_0:findTF("frame/link_btns/btns/urEx/Text"):GetComponent(typeof(Text))
	arg_2_0.activtyUrExchangeCG = arg_2_0.activtyUrExchangeBtn:GetComponent(typeof(CanvasGroup))
	arg_2_0.activtyUrExchangeTip = arg_2_0:findTF("frame/link_btns/btns/urEx/tip")
	arg_2_0.activityCrusingBtn = arg_2_0:findTF("frame/link_btns/btns/crusing")
	arg_2_0.metaBossBtn = CommissionMetaBossBtn.New(arg_2_0:findTF("frame/link_btns/btns/meta_boss"), arg_2_0.event)
end

function var_0_0.UpdateUrItemEntrance(arg_3_0)
	if not LOCK_UR_SHIP then
		local var_3_0 = pg.gameset.urpt_chapter_max.description
		local var_3_1 = var_3_0[1]
		local var_3_2 = var_3_0[2]
		local var_3_3 = getProxy(BagProxy):GetLimitCntById(var_3_1)

		arg_3_0.activtyUrExchangeTxt.text = var_3_3 .. "/" .. var_3_2

		local var_3_4 = var_3_3 == var_3_2

		arg_3_0.activtyUrExchangeCG.alpha = var_3_4 and 0.6 or 1

		setActive(arg_3_0.activtyUrExchangeTip, NotifyTipHelper.ShouldShowUrTip())
		onButton(arg_3_0, arg_3_0.activtyUrExchangeBtn, function()
			arg_3_0:emit(CommissionInfoMediator.ON_UR_ACTIVITY)
		end, SFX_PANEL)
	else
		setActive(arg_3_0.activtyUrExchangeBtn, false)
	end
end

function var_0_0.updateCrusingEntrance(arg_5_0)
	local var_5_0 = getProxy(ActivityProxy):getAliveActivityByType(ActivityConst.ACTIVITY_TYPE_PT_CRUSING)

	if var_5_0 and not var_5_0:isEnd() then
		setActive(arg_5_0.activityCrusingBtn, true)

		local var_5_1 = var_5_0:GetCrusingInfo()

		setText(arg_5_0.activityCrusingBtn:Find("Text"), var_5_1.phase .. "/" .. #var_5_1.awardList)
		setActive(arg_5_0.activityCrusingBtn:Find("tip"), #var_5_0:GetCrusingUnreceiveAward() > 0)
	else
		setActive(arg_5_0.activityCrusingBtn, false)
	end

	onButton(arg_5_0, arg_5_0.activityCrusingBtn, function()
		arg_5_0:emit(CommissionInfoMediator.ON_CRUSING)
	end, SFX_PANEL)
end

function var_0_0.NotifyIns(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = arg_7_1:ExistMsg() and (not arg_7_2 or arg_7_2:isEnd())

	setActive(arg_7_0.activityInsBtn, var_7_0)

	if var_7_0 then
		onButton(arg_7_0, arg_7_0.activityInsBtn, function()
			arg_7_0:emit(CommissionInfoMediator.ON_INS)
		end, SFX_PANEL)
	end
end

function var_0_0.UpdateLinkPanel(arg_9_0)
	local var_9_0 = false

	for iter_9_0 = 1, arg_9_0.linkBtnPanel.childCount do
		if isActive(arg_9_0.linkBtnPanel:GetChild(iter_9_0 - 1)) then
			var_9_0 = true

			break
		end
	end

	setActive(arg_9_0.linkBtnPanel.parent, var_9_0)
end

function var_0_0.didEnter(arg_10_0)
	onButton(arg_10_0, arg_10_0.oilbubbleTF, function()
		if LeanTween.isTweening(go(arg_10_0.frame)) then
			return
		end

		arg_10_0:emit(CommissionInfoMediator.GET_OIL_RES)
	end, SFX_PANEL)
	onButton(arg_10_0, arg_10_0.goldbubbleTF, function()
		if LeanTween.isTweening(go(arg_10_0.frame)) then
			return
		end

		arg_10_0:emit(CommissionInfoMediator.GET_GOLD_RES)
	end, SFX_PANEL)
	onButton(arg_10_0, arg_10_0._tf, function()
		if LeanTween.isTweening(go(arg_10_0.frame)) then
			return
		end

		if arg_10_0.contextData.inFinished then
			return
		end

		arg_10_0:emit(var_0_0.ON_CLOSE)
	end, SOUND_BACK)
	onButton(arg_10_0, arg_10_0.classbubbleTF, function()
		arg_10_0:emit(CommissionInfoMediator.GET_CLASS_RES)
	end, SFX_PANEL)
	arg_10_0:InitItems()
	arg_10_0:UpdateUrItemEntrance()
	arg_10_0:updateCrusingEntrance()
	arg_10_0.metaBossBtn:Flush()
end

function var_0_0.InitItems(arg_15_0)
	for iter_15_0, iter_15_1 in ipairs(arg_15_0.items) do
		iter_15_1:Init()
	end
end

function var_0_0.OnUpdateEventInfo(arg_16_0)
	arg_16_0.items[1]:Update()
end

function var_0_0.OnUpdateClass(arg_17_0)
	arg_17_0.items[2]:Update()
end

function var_0_0.OnUpdateTechnology(arg_18_0)
	arg_18_0.items[3]:Update()
end

function var_0_0.setPlayer(arg_19_0, arg_19_1)
	arg_19_0.playerVO = arg_19_1

	arg_19_0:updateResource(arg_19_1)
end

function var_0_0.updateResource(arg_20_0, arg_20_1)
	local var_20_0 = getProxy(NavalAcademyProxy):GetClassVO():GetGenResCnt()

	setActive(arg_20_0.oilbubbleTF, arg_20_1.oilField ~= 0)
	setActive(arg_20_0.goldbubbleTF, arg_20_1.goldField ~= 0)
	setActive(arg_20_0.classbubbleTF, var_20_0 > 0)

	arg_20_0.oilTF.text = arg_20_1.oilField
	arg_20_0.goldTF.text = arg_20_1.goldField
	arg_20_0.classTF.text = var_20_0
end

function var_0_0.onBackPressed(arg_21_0)
	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)
	triggerButton(arg_21_0._tf)
end

function var_0_0.willExit(arg_22_0)
	pg.UIMgr.GetInstance():UnblurPanel(arg_22_0._tf)

	for iter_22_0, iter_22_1 in ipairs(arg_22_0.items) do
		iter_22_1:Dispose()
	end

	arg_22_0.items = nil

	arg_22_0.metaBossBtn:Dispose()

	arg_22_0.metaBossBtn = nil
end

return var_0_0
