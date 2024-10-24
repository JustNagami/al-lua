local var_0_0 = class("CommissionInfoLayer", import("...base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	if getProxy(SettingsProxy):IsMellowStyle() then
		return "CommissionInfoUI4Mellow"
	else
		return "CommissionInfoUI"
	end
end

function var_0_0.init(arg_2_0)
	arg_2_0.frame = arg_2_0:findTF("frame")
	arg_2_0.parentTr = arg_2_0._tf.parent
	arg_2_0.resourcesTF = arg_2_0:findTF("resources", arg_2_0.frame)
	arg_2_0.oilTF = arg_2_0:findTF("canteen/bubble/Text", arg_2_0.resourcesTF):GetComponent(typeof(Text))
	arg_2_0.goldTF = arg_2_0:findTF("merchant/bubble/Text", arg_2_0.resourcesTF):GetComponent(typeof(Text))
	arg_2_0.classTF = arg_2_0:findTF("class/bubble/Text", arg_2_0.resourcesTF):GetComponent(typeof(Text))
	arg_2_0.oilbubbleTF = arg_2_0:findTF("canteen/bubble", arg_2_0.resourcesTF)
	arg_2_0.goldbubbleTF = arg_2_0:findTF("merchant/bubble", arg_2_0.resourcesTF)
	arg_2_0.classbubbleTF = arg_2_0:findTF("class/bubble", arg_2_0.resourcesTF)
	arg_2_0.oilbubbleCG = GetOrAddComponent(arg_2_0.oilbubbleTF, typeof(CanvasGroup))
	arg_2_0.goldbubbleCG = GetOrAddComponent(arg_2_0.goldbubbleTF, typeof(CanvasGroup))
	arg_2_0.classbubbleCG = GetOrAddComponent(arg_2_0.classbubbleTF, typeof(CanvasGroup))

	local var_2_0 = getProxy(NavalAcademyProxy):GetClassVO():GetResourceType()
	local var_2_1 = Item.getConfigData(var_2_0).icon

	arg_2_0.classbubbleTF:Find("icon"):GetComponent(typeof(Image)).sprite = LoadSprite(var_2_1)
	arg_2_0.projectContainer = arg_2_0:findTF("main/content", arg_2_0.frame)
	arg_2_0.items = {
		CommissionInfoEventItem.New(arg_2_0:findTF("frame/main/content/event"), arg_2_0),
		CommissionInfoClassItem.New(arg_2_0:findTF("frame/main/content/class"), arg_2_0),
		CommissionInfoTechnologyItem.New(arg_2_0:findTF("frame/main/content/technology"), arg_2_0)
	}

	arg_2_0:BlurPanel()

	arg_2_0.linkBtnPanel = arg_2_0:findTF("frame/link_btns/btns")
	arg_2_0.activityInsBtn = arg_2_0:findTF("frame/link_btns/btns/ins")
	arg_2_0.activtyUrExchangeBtn = arg_2_0:findTF("frame/link_btns/btns/urEx")
	arg_2_0.activtyUrExchangeTxt = arg_2_0:findTF("frame/link_btns/btns/urEx/Text"):GetComponent(typeof(Text))
	arg_2_0.activtyUrExchangeCG = arg_2_0.activtyUrExchangeBtn:GetComponent(typeof(CanvasGroup))
	arg_2_0.activtyUrExchangeTip = arg_2_0:findTF("frame/link_btns/btns/urEx/tip")
	arg_2_0.activityCrusingBtn = arg_2_0:findTF("frame/link_btns/btns/crusing")
	arg_2_0.metaBossBtn = CommissionMetaBossBtn.New(arg_2_0:findTF("frame/link_btns/btns/meta_boss"), arg_2_0.event)
end

function var_0_0.BlurPanel(arg_3_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_3_0._tf, false, {
		weight = LayerWeightConst.SECOND_LAYER
	})
end

function var_0_0.UnBlurPanel(arg_4_0)
	pg.UIMgr.GetInstance():UnblurPanel(arg_4_0._tf, arg_4_0.parentTr)
end

function var_0_0.UpdateUrItemEntrance(arg_5_0)
	if not LOCK_UR_SHIP then
		local var_5_0 = pg.gameset.urpt_chapter_max.description
		local var_5_1 = var_5_0[1]
		local var_5_2 = var_5_0[2]
		local var_5_3 = getProxy(BagProxy):GetLimitCntById(var_5_1)

		arg_5_0.activtyUrExchangeTxt.text = var_5_3 .. "/" .. var_5_2

		local var_5_4 = var_5_3 == var_5_2

		arg_5_0.activtyUrExchangeCG.alpha = var_5_4 and 0.6 or 1

		setActive(arg_5_0.activtyUrExchangeTip, NotifyTipHelper.ShouldShowUrTip())
		onButton(arg_5_0, arg_5_0.activtyUrExchangeBtn, function()
			arg_5_0:emit(CommissionInfoMediator.ON_UR_ACTIVITY)
		end, SFX_PANEL)
	else
		setActive(arg_5_0.activtyUrExchangeBtn, false)
	end
end

function var_0_0.updateCrusingEntrance(arg_7_0)
	local var_7_0 = getProxy(ActivityProxy):getAliveActivityByType(ActivityConst.ACTIVITY_TYPE_PT_CRUSING)

	if var_7_0 and not var_7_0:isEnd() then
		setActive(arg_7_0.activityCrusingBtn, true)

		local var_7_1 = var_7_0:GetCrusingInfo()

		setText(arg_7_0.activityCrusingBtn:Find("Text"), var_7_1.phase .. "/" .. #var_7_1.awardList)
		setActive(arg_7_0.activityCrusingBtn:Find("tip"), #var_7_0:GetCrusingUnreceiveAward() > 0)
	else
		setActive(arg_7_0.activityCrusingBtn, false)
	end

	onButton(arg_7_0, arg_7_0.activityCrusingBtn, function()
		arg_7_0:emit(CommissionInfoMediator.ON_CRUSING)
	end, SFX_PANEL)
end

function var_0_0.NotifyIns(arg_9_0)
	setActive(arg_9_0.activityInsBtn, false)
end

function var_0_0.UpdateLinkPanel(arg_10_0)
	local var_10_0 = false

	for iter_10_0 = 1, arg_10_0.linkBtnPanel.childCount do
		if isActive(arg_10_0.linkBtnPanel:GetChild(iter_10_0 - 1)) then
			var_10_0 = true

			break
		end
	end

	setActive(arg_10_0.linkBtnPanel.parent, var_10_0)
end

function var_0_0.didEnter(arg_11_0)
	onButton(arg_11_0, arg_11_0.oilbubbleTF, function()
		if not getProxy(PlayerProxy):getRawData():CanGetResource(PlayerConst.ResOil) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("player_harvestResource_error_fullBag"))

			return
		end

		arg_11_0:PlayGetResAnimation(arg_11_0.oilbubbleTF, function()
			arg_11_0:emit(CommissionInfoMediator.GET_OIL_RES)
		end)
	end, SFX_PANEL)
	onButton(arg_11_0, arg_11_0.goldbubbleTF, function()
		if not getProxy(PlayerProxy):getRawData():CanGetResource(PlayerConst.ResGold) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("player_harvestResource_error_fullBag"))

			return
		end

		arg_11_0:PlayGetResAnimation(arg_11_0.goldbubbleTF, function()
			arg_11_0:emit(CommissionInfoMediator.GET_GOLD_RES)
		end)
	end, SFX_PANEL)
	onButton(arg_11_0, arg_11_0.classbubbleTF, function()
		if not getProxy(NavalAcademyProxy):GetClassVO():CanGetRes() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("player_harvestResource_error_fullBag"))

			return
		end

		arg_11_0:PlayGetResAnimation(arg_11_0.classbubbleTF, function()
			arg_11_0:emit(CommissionInfoMediator.GET_CLASS_RES)
		end)
	end, SFX_PANEL)
	onButton(arg_11_0, arg_11_0._tf, function()
		if arg_11_0.contextData.inFinished then
			return
		end

		arg_11_0.isPaying = true

		arg_11_0:PlayExitAnimation(function()
			arg_11_0:emit(var_0_0.ON_CLOSE)

			arg_11_0.isPaying = false
		end)
	end, SOUND_BACK)
	arg_11_0:InitItems()
	arg_11_0:UpdateUrItemEntrance()
	arg_11_0:updateCrusingEntrance()
	arg_11_0.metaBossBtn:Flush()
end

function var_0_0.PlayGetResAnimation(arg_20_0, arg_20_1, arg_20_2)
	arg_20_0.isPaying = true

	local var_20_0 = arg_20_1:GetComponent(typeof(Animation))
	local var_20_1 = arg_20_1:GetComponent(typeof(DftAniEvent))

	var_20_1:SetEndEvent(nil)
	var_20_1:SetEndEvent(function()
		var_20_1:SetEndEvent(nil)
		arg_20_2()

		arg_20_0.isPaying = false
	end)
	var_20_0:Play("anim_commission_bubble_get")
end

function var_0_0.InitItems(arg_22_0)
	for iter_22_0, iter_22_1 in ipairs(arg_22_0.items) do
		iter_22_1:Init()
	end
end

function var_0_0.OnUpdateEventInfo(arg_23_0)
	arg_23_0.items[1]:Update()
end

function var_0_0.OnUpdateClass(arg_24_0)
	arg_24_0.items[2]:Update()
end

function var_0_0.OnUpdateTechnology(arg_25_0)
	arg_25_0.items[3]:Update()
end

function var_0_0.setPlayer(arg_26_0, arg_26_1)
	arg_26_0.playerVO = arg_26_1

	arg_26_0:UpdateOilRes(arg_26_1)
	arg_26_0:UpdateGoldRes(arg_26_1)
	arg_26_0:UpdateClassRes()
end

function var_0_0.OnPlayerUpdate(arg_27_0, arg_27_1)
	local var_27_0 = arg_27_0.playerVO
	local var_27_1 = arg_27_1

	if var_27_1.oilField ~= var_27_0.oilField then
		arg_27_0:UpdateOilRes(var_27_1)
	end

	if var_27_1.goldField ~= var_27_0.goldField then
		arg_27_0:UpdateGoldRes(var_27_1)
	end

	if var_27_1.expField ~= var_27_0.expField then
		arg_27_0:UpdateClassRes()
	end

	arg_27_0.playerVO = var_27_1
end

function var_0_0.UpdateOilRes(arg_28_0, arg_28_1)
	arg_28_0.oilbubbleCG.alpha = 1
	arg_28_0.oilbubbleTF.localScale = Vector3.one

	setActive(arg_28_0.oilbubbleTF, arg_28_1.oilField ~= 0)

	arg_28_0.oilTF.text = arg_28_1.oilField
end

function var_0_0.UpdateGoldRes(arg_29_0, arg_29_1)
	arg_29_0.goldbubbleCG.alpha = 1
	arg_29_0.goldbubbleTF.localScale = Vector3.one

	setActive(arg_29_0.goldbubbleTF, arg_29_1.goldField ~= 0)

	arg_29_0.goldTF.text = arg_29_1.goldField
end

function var_0_0.UpdateClassRes(arg_30_0)
	local var_30_0 = getProxy(NavalAcademyProxy):GetClassVO():GetGenResCnt()

	arg_30_0.classbubbleCG.alpha = 1
	arg_30_0.classbubbleTF.localScale = Vector3.one

	setActive(arg_30_0.classbubbleTF, var_30_0 > 0)

	arg_30_0.classTF.text = var_30_0
end

function var_0_0.onBackPressed(arg_31_0)
	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)
	triggerButton(arg_31_0._tf)
end

function var_0_0.willExit(arg_32_0)
	arg_32_0:UnBlurPanel()

	for iter_32_0, iter_32_1 in ipairs(arg_32_0.items) do
		iter_32_1:Dispose()
	end

	arg_32_0.items = nil

	arg_32_0.metaBossBtn:Dispose()

	arg_32_0.metaBossBtn = nil
end

return var_0_0
