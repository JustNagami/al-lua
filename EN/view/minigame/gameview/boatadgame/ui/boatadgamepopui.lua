local var_0_0 = class("BoatAdGamePopUI")
local var_0_1

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._tf = arg_1_1
	arg_1_0._event = arg_1_2
	var_0_1 = BoatAdGameVo

	arg_1_0:initCountUI()
	arg_1_0:initLeavelUI()
	arg_1_0:initPauseUI()
	arg_1_0:initSettlementUI()
	arg_1_0:initAdWindow()
end

function var_0_0.initCountUI(arg_2_0)
	arg_2_0.countUI = findTF(arg_2_0._tf, "pop/CountUI")
	arg_2_0.countAnimator = GetComponent(findTF(arg_2_0.countUI, "count"), typeof(Animator))
	arg_2_0.countDft = GetOrAddComponent(findTF(arg_2_0.countUI, "count"), typeof(DftAniEvent))

	arg_2_0.countDft:SetTriggerEvent(function()
		return
	end)
	arg_2_0.countDft:SetEndEvent(function()
		arg_2_0._event:emit(SimpleMGEvent.COUNT_DOWN)
	end)
end

function var_0_0.initLeavelUI(arg_5_0)
	arg_5_0.leaveUI = findTF(arg_5_0._tf, "pop/LeaveUI")

	GetComponent(findTF(arg_5_0.leaveUI, "ad/desc"), typeof(Image)):SetNativeSize()
	setActive(arg_5_0.leaveUI, false)
	onButton(arg_5_0._event, findTF(arg_5_0.leaveUI, "ad/btnOk"), function()
		arg_5_0:resumeGame()
		arg_5_0._event:emit(SimpleMGEvent.LEVEL_GAME, true)
	end, SFX_CANCEL)
	onButton(arg_5_0._event, findTF(arg_5_0.leaveUI, "ad/btnCancel"), function()
		arg_5_0:resumeGame()
		arg_5_0._event:emit(SimpleMGEvent.LEVEL_GAME, false)
	end, SFX_CANCEL)
end

function var_0_0.initPauseUI(arg_8_0)
	arg_8_0.pauseUI = findTF(arg_8_0._tf, "pop/pauseUI")

	GetComponent(findTF(arg_8_0.pauseUI, "ad/desc"), typeof(Image)):SetNativeSize()
	setActive(arg_8_0.pauseUI, false)
	onButton(arg_8_0._event, findTF(arg_8_0.pauseUI, "ad/btnOk"), function()
		arg_8_0:resumeGame()
		arg_8_0._event:emit(SimpleMGEvent.PAUSE_GAME, false)
	end, SFX_CANCEL)
end

function var_0_0.initSettlementUI(arg_10_0)
	arg_10_0.settlementUI = findTF(arg_10_0._tf, "pop/SettleMentUI")

	setActive(arg_10_0.settlementUI, false)
	onButton(arg_10_0._event, findTF(arg_10_0.settlementUI, "ad/btnOver"), function()
		arg_10_0:clearUI()
		arg_10_0._event:emit(SimpleMGEvent.BACK_MENU)
	end, SFX_CANCEL)
end

local var_0_2

function var_0_0.initAdWindow(arg_12_0)
	arg_12_0.adUI = findTF(arg_12_0._tf, "pop/AdUI")

	setActive(arg_12_0.adUI, false)

	arg_12_0.mvContent = findTF(arg_12_0.adUI, "ad/movie/view/content")
	arg_12_0.btnPlay = findTF(arg_12_0.adUI, "ad/movie/btnPlay")
	arg_12_0.btnStop = findTF(arg_12_0.adUI, "ad/movie/btnStop")
	arg_12_0.btnRepeat = findTF(arg_12_0.adUI, "ad/movie/btnRepeat")

	onButton(arg_12_0._event, findTF(arg_12_0.adUI, "ad/bottom"), function()
		if var_0_2 and Time.realtimeSinceStartup - var_0_2 < 1 then
			return
		end

		var_0_2 = Time.realtimeSinceStartup

		if arg_12_0.isLoading then
			return
		end

		if arg_12_0.playHandle then
			arg_12_0.playHandle()

			arg_12_0.playHandle = nil
		end

		setActive(arg_12_0.adUI, false)
		arg_12_0:clearMovie()
		arg_12_0._event:emit(BoatAdGameEvent.CLOSE_AD_UI)
	end, SFX_CANCEL)
	onButton(arg_12_0._event, findTF(arg_12_0.adUI, "ad/bgClose"), function()
		if var_0_2 and Time.realtimeSinceStartup - var_0_2 < 1 then
			return
		end

		var_0_2 = Time.realtimeSinceStartup

		if arg_12_0.isLoading then
			return
		end

		if arg_12_0.playHandle then
			arg_12_0.playHandle()

			arg_12_0.playHandle = nil
		end

		setActive(arg_12_0.adUI, false)
		arg_12_0:clearMovie()
		arg_12_0._event:emit(BoatAdGameEvent.CLOSE_AD_UI)
	end, SFX_CANCEL)
	onButton(arg_12_0._event, arg_12_0.btnPlay, function()
		return
	end)
	onButton(arg_12_0._event, arg_12_0.btnStop, function()
		return
	end)
	onButton(arg_12_0._event, arg_12_0.btnRepeat, function()
		if var_0_2 and Time.realtimeSinceStartup - var_0_2 < 1 then
			return
		end

		var_0_2 = Time.realtimeSinceStartup

		if arg_12_0.mvManaCpkUI and arg_12_0.mvCompleteFlag then
			print("重新播放")
			arg_12_0:loadMv()
		end
	end)
end

function var_0_0.clearMovie(arg_18_0)
	if arg_18_0.mvGo then
		arg_18_0.mvManaCpkUI:SetPlayEndHandler(nil)
		arg_18_0.mvManaCpkUI:StopCpk()
		destroy(arg_18_0.mvGo)

		arg_18_0.mvManaCpkUI = nil
		arg_18_0.mvGo = nil
		arg_18_0.mvName = nil
	end
end

function var_0_0.loadMv(arg_19_0)
	arg_19_0:clearMovie()

	if arg_19_0.isLoading then
		return
	end

	local var_19_0 = "BoatAdMvUI"

	arg_19_0.isLoading = true

	PoolMgr.GetInstance():GetUI(var_19_0, true, function(arg_20_0)
		arg_19_0.mvGo = arg_20_0
		arg_19_0.mvName = var_19_0
		arg_19_0.mvManaCpkUI = GetComponent(findTF(arg_19_0.mvGo, "video/cpk"), typeof(CriManaCpkUI))

		arg_19_0.mvManaCpkUI:SetPlayEndHandler(System.Action(function()
			arg_19_0:mvComplete()

			if arg_19_0.playHandle then
				arg_19_0.playHandle()

				arg_19_0.playHandle = nil
			end
		end))
		arg_19_0.mvManaCpkUI.player:SetVolume(PlayerPrefs.GetFloat("bgm_vol", DEFAULT_BGMVOLUME))
		setActive(arg_19_0.btnPlay, false)
		setActive(arg_19_0.btnStop, true)
		setActive(arg_19_0.btnRepeat, false)

		if arg_19_0.isLoading == false then
			arg_19_0:clearMovie()
		else
			arg_19_0.isLoading = false

			setParent(arg_19_0.mvGo, arg_19_0.mvContent)
			setActive(arg_19_0.mvGo, true)
		end

		arg_19_0.mvCompleteFlag = false

		arg_19_0.mvManaCpkUI:PlayCpk()
	end)
end

function var_0_0.mvComplete(arg_22_0)
	print("播放完成")

	arg_22_0.mvCompleteFlag = true

	arg_22_0:onPlayerEnd()

	if arg_22_0.mvIndex == arg_22_0.nday then
		-- block empty
	end
end

function var_0_0.onPlayerEnd(arg_23_0)
	setActive(arg_23_0.btnPlay, false)
	setActive(arg_23_0.btnStop, false)
	setActive(arg_23_0.btnRepeat, true)
end

function var_0_0.onPlayerStop(arg_24_0)
	setActive(arg_24_0.btnPlay, true)
	setActive(arg_24_0.btnStop, false)
	setActive(arg_24_0.btnRepeat, false)
end

function var_0_0.onPlayerStart(arg_25_0)
	setActive(arg_25_0.btnPlay, false)
	setActive(arg_25_0.btnStop, true)
	setActive(arg_25_0.btnRepeat, false)
end

function var_0_0.oepnAd(arg_26_0)
	setActive(arg_26_0.adUI, true)
	arg_26_0:loadMv()
end

function var_0_0.updateSettlementUI(arg_27_0)
	GetComponent(findTF(arg_27_0.settlementUI, "ad"), typeof(Animator)):Play("settlement", -1, 0)

	local var_27_0 = var_0_1.GetMiniGameData():GetRuntimeData("elements")
	local var_27_1 = var_0_1.scoreNum
	local var_27_2 = var_27_0 and #var_27_0 > 0 and var_27_0[1] or 0

	setActive(findTF(arg_27_0.settlementUI, "ad/new"), var_27_2 < var_27_1)

	if var_27_2 < var_27_1 then
		var_27_2 = var_27_1

		arg_27_0._event:emit(SimpleMGEvent.STORE_SERVER, var_27_2)
	end

	local var_27_3 = findTF(arg_27_0.settlementUI, "ad/highText")
	local var_27_4 = findTF(arg_27_0.settlementUI, "ad/currentText")

	setText(var_27_3, var_27_2)
	setText(var_27_4, var_27_1)
	arg_27_0._event:emit(SimpleMGEvent.SUBMIT_GAME_SUCCESS)
end

function var_0_0.backPressed(arg_28_0)
	if isActive(arg_28_0.pauseUI) then
		arg_28_0:resumeGame()
		arg_28_0._event:emit(SimpleMGEvent.PAUSE_GAME, false)
	elseif isActive(arg_28_0.leaveUI) then
		arg_28_0:resumeGame()
		arg_28_0._event:emit(SimpleMGEvent.LEVEL_GAME, false)
	elseif not isActive(arg_28_0.pauseUI) and not isActive(arg_28_0.pauseUI) then
		arg_28_0:popPauseUI()
		arg_28_0._event:emit(SimpleMGEvent.PAUSE_GAME, true)
	else
		arg_28_0:resumeGame()
	end
end

function var_0_0.resumeGame(arg_29_0)
	setActive(arg_29_0.leaveUI, false)
	setActive(arg_29_0.pauseUI, false)
end

function var_0_0.popLeaveUI(arg_30_0)
	if isActive(arg_30_0.pauseUI) then
		setActive(arg_30_0.pauseUI, false)
	end

	setActive(arg_30_0.leaveUI, true)
end

function var_0_0.popPauseUI(arg_31_0)
	if isActive(arg_31_0.leaveUI) then
		setActive(arg_31_0.leaveUI, false)
	end

	setActive(arg_31_0.pauseUI, true)
end

function var_0_0.updateGameUI(arg_32_0, arg_32_1)
	setText(arg_32_0.scoreTf, arg_32_1.scoreNum)
	setText(arg_32_0.gameTimeS, math.ceil(arg_32_1.gameTime))
end

function var_0_0.readyStart(arg_33_0)
	arg_33_0:popCountUI(true)
	arg_33_0.countAnimator:Play("count")
	pg.CriMgr.GetInstance():PlaySoundEffect_V3(var_0_1.SFX_COUNT_DOWN)
end

function var_0_0.popCountUI(arg_34_0, arg_34_1)
	setActive(arg_34_0.countUI, arg_34_1)
end

function var_0_0.popSettlementUI(arg_35_0, arg_35_1)
	setActive(arg_35_0.settlementUI, arg_35_1)
end

function var_0_0.clearUI(arg_36_0)
	setActive(arg_36_0.settlementUI, false)
	setActive(arg_36_0.countUI, false)
end

return var_0_0
