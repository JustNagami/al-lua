local var_0_0 = class("WatermelonGamePopUI")

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0._tf = arg_1_1
	arg_1_0._event = arg_1_2
	arg_1_0._gameVo = arg_1_3

	arg_1_0:initCountUI()
	arg_1_0:initLeavelUI()
	arg_1_0:initPauseUI()
	arg_1_0:initSettlementUI()
	arg_1_0:initRankUI()
end

function var_0_0.initCountUI(arg_2_0)
	arg_2_0.countUI = findTF(arg_2_0._tf, "pop/CountUI")
	arg_2_0.countAnimator = GetComponent(findTF(arg_2_0.countUI, "count"), typeof(Animator))
	arg_2_0.countDft = GetOrAddComponent(findTF(arg_2_0.countUI, "count"), typeof(DftAniEvent))

	arg_2_0.countDft:SetTriggerEvent(function()
		return
	end)
	arg_2_0.countDft:SetEndEvent(function()
		arg_2_0._event:emit(WatermelonGameEvent.COUNT_DOWN)
	end)
end

function var_0_0.initLeavelUI(arg_5_0)
	arg_5_0.leaveUI = findTF(arg_5_0._tf, "pop/LeaveUI")

	GetComponent(findTF(arg_5_0.leaveUI, "ad/desc"), typeof(Image)):SetNativeSize()
	setActive(arg_5_0.leaveUI, false)
	onButton(arg_5_0._event, findTF(arg_5_0.leaveUI, "ad/btnOk"), function()
		arg_5_0:resumeGame()
		arg_5_0._event:emit(WatermelonGameEvent.LEVEL_GAME, true)
	end, SFX_CANCEL)
	onButton(arg_5_0._event, findTF(arg_5_0.leaveUI, "ad/btnCancel"), function()
		arg_5_0:resumeGame()
		arg_5_0._event:emit(WatermelonGameEvent.LEVEL_GAME, false)
	end, SFX_CANCEL)
end

function var_0_0.initPauseUI(arg_8_0)
	arg_8_0.pauseUI = findTF(arg_8_0._tf, "pop/pauseUI")

	setActive(arg_8_0.pauseUI, false)
	GetComponent(findTF(arg_8_0.pauseUI, "ad/desc"), typeof(Image)):SetNativeSize()
	onButton(arg_8_0._event, findTF(arg_8_0.pauseUI, "ad/btnOk"), function()
		arg_8_0:resumeGame()
		arg_8_0._event:emit(WatermelonGameEvent.PAUSE_GAME, false)
	end, SFX_CANCEL)
end

function var_0_0.initSettlementUI(arg_10_0)
	arg_10_0.settlementUI = findTF(arg_10_0._tf, "pop/SettleMentUI")

	GetComponent(findTF(arg_10_0.settlementUI, "ad/HighImg"), typeof(Image)):SetNativeSize()
	GetComponent(findTF(arg_10_0.settlementUI, "ad/CurImg"), typeof(Image)):SetNativeSize()
	setActive(arg_10_0.settlementUI, false)
	onButton(arg_10_0._event, findTF(arg_10_0.settlementUI, "ad/btnOver"), function()
		arg_10_0:clearUI()
		arg_10_0._event:emit(WatermelonGameEvent.BACK_MENU)
	end, SFX_CANCEL)
end

function var_0_0.initRankUI(arg_12_0)
	arg_12_0.rankUI = findTF(arg_12_0._tf, "pop/RankUI")

	arg_12_0:popRankUI(false)
	GetComponent(findTF(arg_12_0.rankUI, "ad/img/score"), typeof(Image)):SetNativeSize()
	GetComponent(findTF(arg_12_0.rankUI, "ad/img/time"), typeof(Image)):SetNativeSize()

	arg_12_0._rankImg = findTF(arg_12_0.rankUI, "ad/img")
	arg_12_0._rankBtnClose = findTF(arg_12_0.rankUI, "ad/btnClose")
	arg_12_0._rankContent = findTF(arg_12_0.rankUI, "ad/list/content")
	arg_12_0._rankItemTpl = findTF(arg_12_0.rankUI, "ad/list/content/itemTpl")
	arg_12_0._rankEmpty = findTF(arg_12_0.rankUI, "ad/empty")
	arg_12_0._rankDesc = findTF(arg_12_0.rankUI, "ad/desc")
	arg_12_0._rankItems = {}

	setActive(arg_12_0._rankItemTpl, false)
	onButton(arg_12_0._event, findTF(arg_12_0.rankUI, "ad/close"), function()
		arg_12_0:popRankUI(false)
	end, SFX_CANCEL)
	onButton(arg_12_0._event, arg_12_0._rankBtnClose, function()
		arg_12_0:popRankUI(false)
	end, SFX_CANCEL)
	setText(arg_12_0._rankDesc, i18n(WatermelonGameConst.rank_tip))
end

function var_0_0.updateRankData(arg_15_0, arg_15_1)
	for iter_15_0 = 1, #arg_15_1 do
		local var_15_0

		if iter_15_0 > #arg_15_0._rankItems then
			local var_15_1 = tf(instantiate(arg_15_0._rankItemTpl))

			setActive(var_15_1, false)
			setParent(var_15_1, arg_15_0._rankContent)
			table.insert(arg_15_0._rankItems, var_15_1)
		end

		local var_15_2 = arg_15_0._rankItems[iter_15_0]

		arg_15_0:setRankItemData(var_15_2, arg_15_1[iter_15_0], iter_15_0)
		setActive(var_15_2, true)
	end

	for iter_15_1 = #arg_15_1 + 1, #arg_15_0._rankItems do
		setActive(arg_15_0._rankItems, false)
	end

	setActive(arg_15_0._rankEmpty, #arg_15_1 == 0)
	setActive(arg_15_0._rankImg, #arg_15_1 > 0)
end

function var_0_0.setRankItemData(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
	local var_16_0 = arg_16_2.name
	local var_16_1 = arg_16_2.player_id
	local var_16_2 = arg_16_2.position
	local var_16_3 = arg_16_2.score
	local var_16_4 = arg_16_2.time_data
	local var_16_5 = getProxy(PlayerProxy):isSelf(var_16_1)

	setText(findTF(arg_16_1, "nameText"), var_16_0)
	arg_16_0:setChildVisible(findTF(arg_16_1, "bg"), false)
	arg_16_0:setChildVisible(findTF(arg_16_1, "rank"), false)

	if arg_16_3 <= 3 then
		setActive(findTF(arg_16_1, "bg/" .. arg_16_3), true)
		setActive(findTF(arg_16_1, "rank/" .. arg_16_3), true)
	elseif var_16_5 then
		setActive(findTF(arg_16_1, "bg/me"), true)
		setActive(findTF(arg_16_1, "rank/count"), true)
	else
		setActive(findTF(arg_16_1, "bg/other"), true)
		setActive(findTF(arg_16_1, "rank/count"), true)
	end

	setText(findTF(arg_16_1, "rank/count"), tostring(arg_16_3))
	setText(findTF(arg_16_1, "score"), tostring(var_16_3))
	setText(findTF(arg_16_1, "time"), tostring(var_16_4))
	setActive(findTF(arg_16_1, "imgMy"), var_16_5)
end

function var_0_0.setChildVisible(arg_17_0, arg_17_1, arg_17_2)
	for iter_17_0 = 1, arg_17_1.childCount do
		local var_17_0 = arg_17_1:GetChild(iter_17_0 - 1)

		setActive(var_17_0, arg_17_2)
	end
end

function var_0_0.updateSettlementUI(arg_18_0)
	GetComponent(findTF(arg_18_0.settlementUI, "ad"), typeof(Animator)):Play("settlement", -1, 0)

	local var_18_0 = arg_18_0._gameVo.mgData:GetRuntimeData("elements")
	local var_18_1 = var_18_0 and #var_18_0 > 0 and var_18_0[1] or 0
	local var_18_2 = arg_18_0._gameVo.scoreNum

	setActive(findTF(arg_18_0.settlementUI, "ad/new"), var_18_1 < var_18_2)

	local var_18_3 = findTF(arg_18_0.settlementUI, "ad/highText")
	local var_18_4 = findTF(arg_18_0.settlementUI, "ad/currentText")

	setText(var_18_4, var_18_2)
	setText(var_18_3, var_18_1)

	local var_18_5 = arg_18_0._gameVo:getGameTimes()

	if var_18_5 and var_18_5 > 0 and not arg_18_0.sendSuccessFlag then
		arg_18_0._event:emit(WatermelonGameEvent.SUBMIT_GAME_SUCCESS)
	end

	arg_18_0._event:emit(WatermelonGameEvent.SUBMIT_GAME_SUCCESS)
end

function var_0_0.backPressed(arg_19_0)
	if isActive(arg_19_0.pauseUI) then
		arg_19_0:resumeGame()
		arg_19_0._event:emit(WatermelonGameEvent.PAUSE_GAME, false)
	elseif isActive(arg_19_0.leaveUI) then
		arg_19_0:resumeGame()
		arg_19_0._event:emit(WatermelonGameEvent.LEVEL_GAME, false)
	elseif not isActive(arg_19_0.pauseUI) and not isActive(arg_19_0.pauseUI) then
		if not arg_19_0._gameVo.startSettlement then
			arg_19_0:popPauseUI()
			arg_19_0._event:emit(WatermelonGameEvent.PAUSE_GAME, true)
		end
	else
		arg_19_0:resumeGame()
	end
end

function var_0_0.resumeGame(arg_20_0)
	setActive(arg_20_0.leaveUI, false)
	setActive(arg_20_0.pauseUI, false)
end

function var_0_0.popLeaveUI(arg_21_0)
	if isActive(arg_21_0.pauseUI) then
		setActive(arg_21_0.pauseUI, false)
	end

	setActive(arg_21_0.leaveUI, true)
end

function var_0_0.popPauseUI(arg_22_0)
	if isActive(arg_22_0.leaveUI) then
		setActive(arg_22_0.leaveUI, false)
	end

	setActive(arg_22_0.pauseUI, true)
end

function var_0_0.updateGameUI(arg_23_0, arg_23_1)
	setText(arg_23_0.scoreTf, arg_23_1.scoreNum)
	setText(arg_23_0.gameTimeS, math.ceil(arg_23_1.gameTime))
end

function var_0_0.readyStart(arg_24_0)
	arg_24_0:popCountUI(true)
	arg_24_0.countAnimator:Play("count")
	pg.CriMgr.GetInstance():PlaySoundEffect_V3(WatermelonGameConst.SFX_COUNT_DOWN)
end

function var_0_0.popCountUI(arg_25_0, arg_25_1)
	setActive(arg_25_0.countUI, arg_25_1)
end

function var_0_0.popSettlementUI(arg_26_0, arg_26_1)
	setActive(arg_26_0.settlementUI, arg_26_1)
end

function var_0_0.popRankUI(arg_27_0, arg_27_1)
	setActive(arg_27_0.rankUI, arg_27_1)
end

function var_0_0.clearUI(arg_28_0)
	setActive(arg_28_0.settlementUI, false)
	setActive(arg_28_0.countUI, false)
end

return var_0_0
