local var_0_0 = class("MainActivityBtnView", import("view.base.BaseEventLogic"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_0.super.Ctor(arg_1_0, arg_1_2)

	arg_1_0._tf = arg_1_1
	arg_1_0._go = arg_1_1.gameObject
	arg_1_0.initPos = nil
	arg_1_0.isInit = nil

	local var_1_0 = arg_1_1:Find("actBtn")

	arg_1_0.linkBtnTop = arg_1_0._tf.parent:Find("link_top")
	arg_1_0.eventPanel = arg_1_0._tf.parent:Find("eventPanel")
	arg_1_0.checkNotchRatio = NotchAdapt.CheckNotchRatio
	arg_1_0.activityBtns = {
		MainActSummaryBtn.New(var_1_0, arg_1_2),
		MainActEscortBtn.New(var_1_0, arg_1_2),
		MainActMapBtn.New(var_1_0, arg_1_2),
		MainActBossBtn.New(var_1_0, arg_1_2),
		MainActBackHillBtn.New(var_1_0, arg_1_2),
		MainActAtelierBtn.New(var_1_0, arg_1_2),
		MainLanternFestivalBtn.New(var_1_0, arg_1_2),
		MainActBossRushBtn.New(var_1_0, arg_1_2),
		MainActAprilFoolBtn.New(var_1_0, arg_1_2),
		MainActMedalCollectionBtn.New(var_1_0, arg_1_2),
		MainActSenranBtn.New(var_1_0, arg_1_2),
		MainActBossSingleBtn.New(var_1_0, arg_1_2)
	}
	arg_1_0.specailBtns = {
		MainActInsBtn.New(var_1_0.parent, arg_1_2),
		MainActTraingCampBtn.New(arg_1_0.linkBtnTop:Find("layout"), arg_1_2),
		MainActRefluxBtn.New(arg_1_0.linkBtnTop:Find("layout"), arg_1_2),
		MainActNewServerBtn.New(arg_1_0.linkBtnTop:Find("layout"), arg_1_2),
		MainActDelegationBtn.New(arg_1_0.eventPanel, arg_1_2),
		MainIslandActDelegationBtn.New(arg_1_0.eventPanel, arg_1_2),
		MainVoteEntranceBtn.New(arg_1_0.eventPanel, arg_1_2)
	}

	if pg.SdkMgr.GetInstance():CheckAudit() then
		arg_1_0.specailBtns = {
			MainActTraingCampBtn.New(arg_1_0.linkBtnTop:Find("layout"), arg_1_2)
		}
	end

	arg_1_0:Register()
end

function var_0_0.Register(arg_2_0)
	arg_2_0:bind(NewMainScene.ON_REMOVE_LAYER, function(arg_3_0, arg_3_1)
		arg_2_0:OnRemoveLayer(arg_3_1)
	end)
	arg_2_0:bind(NewMainScene.ON_ACT_BTN_UPDATE, function(arg_4_0)
		arg_2_0:Refresh()
	end)
	arg_2_0:bind(NewMainScene.ON_ZERO_HOUR, function(arg_5_0)
		arg_2_0:Refresh()
	end)
end

function var_0_0.GetBtn(arg_6_0, arg_6_1)
	for iter_6_0, iter_6_1 in ipairs(arg_6_0.activityBtns) do
		if isa(iter_6_1, arg_6_1) then
			return iter_6_1
		end
	end

	for iter_6_2, iter_6_3 in ipairs(arg_6_0.specailBtns) do
		if isa(iter_6_3, arg_6_1) then
			return iter_6_3
		end
	end

	return nil
end

function var_0_0.OnRemoveLayer(arg_7_0, arg_7_1)
	local var_7_0

	if arg_7_1.mediator == LotteryMediator then
		var_7_0 = arg_7_0:GetBtn(MainActLotteryBtn)
	elseif arg_7_1.mediator == InstagramMediator then
		var_7_0 = arg_7_0:GetBtn(MainActInsBtn)
	end

	if var_7_0 and var_7_0:InShowTime() then
		var_7_0:OnInit()
	end
end

function var_0_0.Init(arg_8_0)
	arg_8_0:Flush()

	arg_8_0.isInit = true
end

function var_0_0.Flush(arg_9_0)
	if arg_9_0.checkNotchRatio ~= NotchAdapt.CheckNotchRatio then
		arg_9_0.checkNotchRatio = NotchAdapt.CheckNotchRatio
		arg_9_0.initPos = nil
	end

	local var_9_0 = {}
	local var_9_1 = {}

	for iter_9_0, iter_9_1 in ipairs(arg_9_0.activityBtns) do
		if iter_9_1:InShowTime() then
			table.insert(var_9_0, iter_9_1)
		else
			table.insert(var_9_1, iter_9_1)
		end
	end

	table.sort(var_9_0, function(arg_10_0, arg_10_1)
		return arg_10_0.config.group_id < arg_10_1.config.group_id
	end)

	for iter_9_2, iter_9_3 in ipairs(var_9_0) do
		iter_9_3:Init(iter_9_2)
	end

	for iter_9_4, iter_9_5 in ipairs(var_9_1) do
		iter_9_5:Clear()
	end

	local var_9_2 = #var_9_0

	assert(var_9_2 <= 4, "活动按钮不能超过4个")

	local var_9_3 = var_9_2 <= 3
	local var_9_4 = var_9_3 and 1 or 0.85
	local var_9_5 = var_9_3 and 390 or 420

	arg_9_0._tf.localScale = Vector3(var_9_4, var_9_4, 1)
	arg_9_0.initPos = arg_9_0.initPos or arg_9_0._tf.localPosition
	arg_9_0._tf.localPosition = Vector3(arg_9_0.initPos.x, var_9_5, 0)

	for iter_9_6, iter_9_7 in ipairs(arg_9_0.specailBtns) do
		if iter_9_7:InShowTime() then
			iter_9_7:Init(not var_9_3)
		else
			iter_9_7:Clear()
		end
	end
end

function var_0_0.Refresh(arg_11_0)
	if not arg_11_0.isInit then
		return
	end

	arg_11_0:Flush()

	for iter_11_0, iter_11_1 in ipairs(arg_11_0.specailBtns) do
		if iter_11_1:InShowTime() then
			iter_11_1:Refresh()
		end
	end
end

function var_0_0.Disable(arg_12_0)
	arg_12_0.lposX = nil

	for iter_12_0, iter_12_1 in ipairs(arg_12_0.specailBtns) do
		if iter_12_1:InShowTime() then
			iter_12_1:Disable()
		end
	end
end

function var_0_0.Fold(arg_13_0, arg_13_1, arg_13_2)
	arg_13_0.lposX = arg_13_0.lposX or arg_13_0._tf.localPosition.x

	local var_13_0 = arg_13_1 and arg_13_0.lposX + 1200 or arg_13_0.lposX

	if arg_13_2 == 0 then
		local var_13_1 = arg_13_0._go.transform.localPosition

		arg_13_0._go.transform.localPosition = Vector3(var_13_0, var_13_1.y, 0)
	else
		LeanTween.moveLocalX(arg_13_0._go, var_13_0, arg_13_2):setEase(LeanTweenType.easeInOutExpo)
	end

	arg_13_0.lposY = arg_13_0.lposY or arg_13_0.linkBtnTop.localPosition.y

	local var_13_2 = arg_13_1 and arg_13_0.lposY + 200 or arg_13_0.lposY

	if arg_13_2 == 0 then
		arg_13_0.linkBtnTop.localPosition = Vector3(0, var_13_2, 0)
	else
		LeanTween.moveLocalY(arg_13_0.linkBtnTop.gameObject, var_13_2, arg_13_2):setEase(LeanTweenType.easeInOutExpo)
	end
end

function var_0_0.Dispose(arg_14_0)
	arg_14_0:disposeEvent()

	for iter_14_0, iter_14_1 in ipairs(arg_14_0.activityBtns) do
		iter_14_1:Dispose()
	end

	for iter_14_2, iter_14_3 in ipairs(arg_14_0.specailBtns) do
		iter_14_3:Dispose()
	end

	arg_14_0.specailBtns = nil
	arg_14_0.activityBtns = nil
end

return var_0_0
