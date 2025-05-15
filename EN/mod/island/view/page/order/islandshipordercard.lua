local var_0_0 = class("IslandShipOrderCard")
local var_0_1 = Color.New(0.2235294117647059, 0.7450980392156863, 1, 1)
local var_0_2 = Color.New(0.8274509803921568, 0.8274509803921568, 0.8274509803921568, 1)
local var_0_3 = Color.New(0.8588235294117647, 0.8588235294117647, 0.8588235294117647, 1)
local var_0_4 = Color.New(1, 0.6823529411764706, 0.13333333333333333, 1)
local var_0_5 = Color.New(1, 1, 1, 1)

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0._tf = arg_1_1
	arg_1_0.bgTr = arg_1_1:Find("bg")
	arg_1_0.bgImg = arg_1_1:Find("bg"):GetComponent(typeof(Image))
	arg_1_0.request = arg_1_1:Find("request")
	arg_1_0.requestCG = GetOrAddComponent(arg_1_0.request, typeof(CanvasGroup))
	arg_1_0.uiRequestList = UIItemList.New(arg_1_1:Find("request"), arg_1_1:Find("request/tpl"))
	arg_1_0.titleTr = arg_1_1:Find("title")
	arg_1_0.titleLineImg = arg_1_1:Find("title/line"):GetComponent(typeof(Image))
	arg_1_0.titleTxt = arg_1_1:Find("title/Text"):GetComponent(typeof(Text))
	arg_1_0.loadingTr = arg_1_1:Find("state_loading")
	arg_1_0.loadingRequest = arg_1_1:Find("loading_request")
	arg_1_0.loadingAward = arg_1_1:Find("loading_award")
	arg_1_0.finishTr = arg_1_1:Find("state_finish")
	arg_1_0.award = arg_1_1:Find("award")
	arg_1_0.uiAwardList = UIItemList.New(arg_1_1:Find("award"), arg_1_1:Find("award/tpl"))
	arg_1_0.lockTr = arg_1_1:Find("state_lock")
	arg_1_0.normalTr = arg_1_1:Find("normal_award")
	arg_1_0.levelLockTr = arg_1_1:Find("state_lock/level")
	arg_1_0.levelLockTxt = arg_1_0.levelLockTr:Find("Text"):GetComponent(typeof(Text))
	arg_1_0.resLockTr = arg_1_1:Find("state_lock/gold")
	arg_1_0.resLockTxt = arg_1_0.resLockTr:Find("content/Text"):GetComponent(typeof(Text))
	arg_1_0.timeTxt = arg_1_1:Find("loading_request/time/content/Text"):GetComponent(typeof(Text))
	arg_1_0.getBtn = arg_1_1:Find("state_finish/get")
	arg_1_0.signTr = arg_1_1:Find("sign")
	arg_1_0.resImg = arg_1_1:Find("state_lock/gold/content/icon")

	setText(arg_1_1:Find("loading_award/state/Text"), i18n1("运输中"))
	setText(arg_1_1:Find("normal_award/state/Text"), i18n1("等待运输"))
	setText(arg_1_0.getBtn:Find("Text"), i18n1("领取奖励"))
end

function var_0_0.Flush(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	arg_2_0.slot = arg_2_1

	arg_2_0:SwitchMode(arg_2_1, arg_2_2)
	arg_2_0:UpdateRequest(arg_2_1)
	arg_2_0:UpdateAward(arg_2_1)
	arg_2_0:UpdateLockTip(arg_2_1)
	arg_2_0:UpdateTitle(arg_2_1)
	arg_2_0:UpdateTimer(arg_2_1)
end

function var_0_0.PlaySignAnim(arg_3_0, arg_3_1)
	arg_3_0:RemoveSignTimer()
	setActive(arg_3_0.signTr, true)

	arg_3_0.signTimer = Timer.New(function()
		arg_3_0:RemoveSignTimer()
		setActive(arg_3_0.signTr, false)
		arg_3_1()
	end, 2, 1)

	arg_3_0.signTimer:Start()
end

function var_0_0.RemoveSignTimer(arg_5_0)
	if arg_5_0.signTimer then
		arg_5_0.signTimer:Stop()

		arg_5_0.signTimer = nil
	end
end

function var_0_0.SwitchMode(arg_6_0, arg_6_1, arg_6_2)
	arg_6_0.mode = arg_6_2

	arg_6_0:UpdateStyle(arg_6_1, arg_6_2)
end

function var_0_0.UpdateTimer(arg_7_0, arg_7_1)
	arg_7_0:RemoveTimer()

	if arg_7_1:IsSubmited() and not arg_7_1:IsFinished() then
		arg_7_0:AddTimer(arg_7_1)
	end
end

function var_0_0.RemoveTimer(arg_8_0)
	if arg_8_0.timer then
		arg_8_0.timer:Stop()

		arg_8_0.timer = nil
	end
end

function var_0_0.AddTimer(arg_9_0, arg_9_1)
	local var_9_0 = arg_9_1:GetEndTime()

	arg_9_0.timer = Timer.New(function(arg_10_0, arg_10_1, arg_10_2)
		local var_10_0 = pg.TimeMgr.GetInstance():GetServerTime()
		local var_10_1 = var_9_0 - var_10_0

		arg_9_0.timeTxt.text = pg.TimeMgr.GetInstance():DescCDTime(var_10_1)

		if var_10_1 <= 0 then
			arg_9_0:RemoveTimer()
			arg_9_0:Flush(arg_9_1, arg_9_0.mode)
		end
	end, 1, -1)

	arg_9_0.timer.func()
	arg_9_0.timer:Start()
end

function var_0_0.UpdateTitle(arg_11_0, arg_11_1)
	if arg_11_1:IsWaiting() then
		local var_11_0 = arg_11_1:GetNeedTime()

		arg_11_0.titleTxt.text = i18n1("运输时间     " .. pg.TimeMgr.GetInstance():DescCDTime(var_11_0))
	elseif arg_11_1:IsSubmited() and not arg_11_1:IsFinished() then
		arg_11_0.titleTxt.text = i18n1("运输中...")
	elseif arg_11_1:IsFinished() then
		arg_11_0.titleTxt.text = i18n1("已完成...")
	end
end

function var_0_0.UpdateLockTip(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_1:GetUnlockLevel()
	local var_12_1 = arg_12_1:GetUnlockGold()

	arg_12_0.levelLockTxt.text = i18n1(string.format("下艘运输船舶将在%d级解锁", var_12_0))
	arg_12_0.resLockTxt.text = i18n1("X" .. var_12_1.count .. "解锁")

	local var_12_2 = pg.island_item_data_template[var_12_1.id].icon

	GetImageSpriteFromAtlasAsync(var_12_2, "", arg_12_0.resImg)
end

function var_0_0.UpdateAward(arg_13_0, arg_13_1)
	local var_13_0 = arg_13_1:GetOrder():GetAwardList()

	arg_13_0.uiAwardList:make(function(arg_14_0, arg_14_1, arg_14_2)
		if arg_14_0 == UIItemList.EventUpdate then
			local var_14_0 = var_13_0[arg_14_1 + 1]

			updateDrop(arg_14_2, Drop.New(var_14_0))
		end
	end)
	arg_13_0.uiAwardList:align(#var_13_0)
end

function var_0_0.UpdateRequest(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_1:GetOrder():GetConsumeList()

	arg_15_0.uiRequestList:make(function(arg_16_0, arg_16_1, arg_16_2)
		if arg_16_0 == UIItemList.EventUpdate then
			local var_16_0 = var_15_0[arg_16_1 + 1]
			local var_16_1 = Drop.New(var_16_0)
			local var_16_2 = var_16_1.icon or var_16_1:getConfig("icon")

			GetImageSpriteFromAtlasAsync(var_16_2, "", arg_16_2:Find("icon"))

			local var_16_3 = var_16_1.state == 1

			setText(arg_16_2:Find("cnt"), setColorStr("x" .. var_16_1.count, (var_16_1:getOwnedCount() >= var_16_1.count or var_16_3) and "#393a3c" or "#f36c6e"))
			setActive(arg_16_2:Find("loaded"), var_16_3)
			setActive(arg_16_2:Find("loaded_1"), false)
		end
	end)
	arg_15_0.uiRequestList:align(#var_15_0)
end

function var_0_0.UpdateStyle(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = arg_17_1:IsLock()
	local var_17_1 = arg_17_1:IsWaiting()
	local var_17_2 = arg_17_1:IsFinished()
	local var_17_3 = arg_17_1:IsSubmited() and not var_17_2
	local var_17_4 = arg_17_1:CanUnlock()
	local var_17_5 = arg_17_2 == IslandShipOrderPage.MODE_REQUEST_VIEW
	local var_17_6 = arg_17_2 == IslandShipOrderPage.MODE_AWARD_VIEW

	setActive(arg_17_0.loadingTr, var_17_3)
	setActive(arg_17_0.loadingRequest, var_17_3 and var_17_5)
	setActive(arg_17_0.loadingAward, var_17_3 and var_17_6)
	setActive(arg_17_0.finishTr, var_17_2)
	setActive(arg_17_0.request, not var_17_0 and var_17_5 and not var_17_2)
	setActive(arg_17_0.award, not var_17_0 and var_17_6 or var_17_2)
	setActive(arg_17_0.lockTr, var_17_0)
	setActive(arg_17_0.normalTr, var_17_1 and var_17_6)
	setActive(arg_17_0.levelLockTr, var_17_0 and not var_17_4)
	setActive(arg_17_0.resLockTr, var_17_0 and var_17_4)
	setActive(arg_17_0.titleTr, not var_17_0)

	arg_17_0.requestCG.alpha = var_17_3 and 0.6 or 1
	arg_17_0.titleTr.sizeDelta = var_17_1 and Vector2(280, 39) or Vector2(155, 39)

	arg_17_0:UpdateBgColor(arg_17_1)
	arg_17_0:UpdateTitleColor(arg_17_1)
end

function var_0_0.UpdateBgColor(arg_18_0, arg_18_1)
	if arg_18_1:IsSubmited() and not arg_18_1:IsFinished() then
		setActive(arg_18_0.bgTr, false)

		return
	end

	setActive(arg_18_0.bgTr, true)

	arg_18_0.bgImg.color = arg_18_1:IsFinished() and var_0_1 or var_0_3
end

function var_0_0.UpdateTitleColor(arg_19_0, arg_19_1)
	if arg_19_1:IsFinished() then
		arg_19_0.titleLineImg.color = var_0_1
	elseif arg_19_1:IsSubmited() and not arg_19_1:IsFinished() then
		arg_19_0.titleLineImg.color = var_0_4
	elseif arg_19_1:IsWaiting() then
		arg_19_0.titleLineImg.color = var_0_2
	end

	arg_19_0.titleTxt.color = arg_19_1:IsWaiting() and var_0_2 or var_0_5
end

function var_0_0.Dispose(arg_20_0)
	arg_20_0:RemoveTimer()
	arg_20_0:RemoveSignTimer()
end

return var_0_0
