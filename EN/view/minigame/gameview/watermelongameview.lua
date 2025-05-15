local var_0_0 = class("WatermelonGameView", import("..BaseMiniGameView"))
local var_0_1
local var_0_2 = 76

function var_0_0.Ctor(arg_1_0)
	var_0_0.super.Ctor(arg_1_0)

	arg_1_0._gameVo = WatermelonGameVo.New(var_0_2)
	var_0_1 = arg_1_0._gameVo
end

function var_0_0.getUIName(arg_2_0)
	return WatermelonGameConst.game_ui
end

function var_0_0.getBGM(arg_3_0)
	return WatermelonGameConst.menu_bgm
end

function var_0_0.didEnter(arg_4_0)
	arg_4_0:initEvent()
	arg_4_0:initUI()
end

function var_0_0.initEvent(arg_5_0)
	if not arg_5_0.handle and IsUnityEditor then
		arg_5_0.handle = UpdateBeat:CreateListener(arg_5_0.OnUpdate, arg_5_0)

		UpdateBeat:AddListener(arg_5_0.handle)
	end

	arg_5_0:bind(WatermelonGameEvent.LEVEL_GAME, function(arg_6_0, arg_6_1, arg_6_2)
		if arg_6_1 then
			arg_5_0:resumeGame()
			arg_5_0:onGameOver()
		else
			arg_5_0:resumeGame()
		end
	end)
	arg_5_0:bind(WatermelonGameEvent.COUNT_DOWN, function(arg_7_0, arg_7_1, arg_7_2)
		arg_5_0:gameStart()
	end)
	arg_5_0:bind(WatermelonGameEvent.ON_HOME, function(arg_8_0, arg_8_1, arg_8_2)
		arg_5_0:emit(BaseUI.ON_HOME)
	end)
	arg_5_0:bind(WatermelonGameEvent.OPEN_PAUSE_UI, function(arg_9_0, arg_9_1, arg_9_2)
		arg_5_0.popUI:popPauseUI()
	end)
	arg_5_0:bind(WatermelonGameEvent.OPEN_LEVEL_UI, function(arg_10_0, arg_10_1, arg_10_2)
		arg_5_0.popUI:popLeaveUI()
	end)
	arg_5_0:bind(WatermelonGameEvent.PAUSE_GAME, function(arg_11_0, arg_11_1, arg_11_2)
		if arg_11_1 then
			arg_5_0:pauseGame()
		else
			arg_5_0:resumeGame()
		end
	end)
	arg_5_0:bind(WatermelonGameEvent.BACK_MENU, function(arg_12_0, arg_12_1, arg_12_2)
		arg_5_0.menuUI:update(arg_5_0:GetMGHubData())
		arg_5_0.menuUI:show(true)
		arg_5_0.gameUI:show(false)
		arg_5_0.gameScene:showContainer(false)
		arg_5_0:changeBgm(PipeGameConst.bgm_type_default)
	end)
	arg_5_0:bind(WatermelonGameEvent.CLOSE_GAME, function(arg_13_0, arg_13_1, arg_13_2)
		arg_5_0:closeView()
	end)
	arg_5_0:bind(WatermelonGameEvent.GAME_OVER, function(arg_14_0, arg_14_1, arg_14_2)
		arg_5_0:onGameOver()
	end)
	arg_5_0:bind(WatermelonGameEvent.SHOW_RULE, function(arg_15_0, arg_15_1, arg_15_2)
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip[WatermelonGameConst.rule_tip].tip
		})
	end)
	arg_5_0:bind(WatermelonGameEvent.SHOW_RANK, function(arg_16_0, arg_16_1, arg_16_2)
		arg_5_0.popUI:showRank(true)
	end)
	arg_5_0:bind(WatermelonGameEvent.READY_START, function(arg_17_0, arg_17_1, arg_17_2)
		arg_5_0:readyStart()
	end)
	arg_5_0:bind(WatermelonGameEvent.STORE_SERVER, function(arg_18_0, arg_18_1, arg_18_2)
		getProxy(MiniGameProxy):UpdataHighScore(var_0_1.gameId, arg_18_1)
	end)
	arg_5_0:bind(WatermelonGameEvent.SUBMIT_GAME_SUCCESS, function(arg_19_0, arg_19_1, arg_19_2)
		if not arg_5_0.sendSuccessFlag then
			arg_5_0.sendSuccessFlag = true

			arg_5_0:SendSuccess(0)
		end
	end)
	arg_5_0:bind(WatermelonGameEvent.ADD_SCORE, function(arg_20_0, arg_20_1, arg_20_2)
		arg_5_0:addScore(arg_20_1.num)
		arg_5_0.gameUI:addScore(arg_20_1)
	end)
end

function var_0_0.initUI(arg_21_0)
	var_0_1:setGameTpl(findTF(arg_21_0._tf, "tpl"))
	setActive(findTF(arg_21_0._tf, "tpl"), false)

	arg_21_0.clickMask = findTF(arg_21_0._tf, "clickMask")
	arg_21_0.popUI = WatermelonGamePopUI.New(arg_21_0._tf, arg_21_0, arg_21_0._gameVo)

	arg_21_0.popUI:clearUI()

	arg_21_0.gameUI = WatermelonGamingUI.New(arg_21_0._tf, arg_21_0, arg_21_0._gameVo)

	arg_21_0.gameUI:show(false)

	arg_21_0.menuUI = WatermelonGameMenuUI.New(arg_21_0._tf, arg_21_0, arg_21_0._gameVo)

	arg_21_0.menuUI:update(arg_21_0:GetMGHubData())
	arg_21_0.menuUI:show(true)

	arg_21_0.gameScene = WatermelonGameScene.New(arg_21_0._tf, arg_21_0, arg_21_0._gameVo)
end

function var_0_0.changeBgm(arg_22_0, arg_22_1)
	local var_22_0

	if arg_22_1 == PipeGameConst.bgm_type_default then
		var_22_0 = arg_22_0:getBGM()

		if not var_22_0 then
			if pg.CriMgr.GetInstance():IsDefaultBGM() then
				var_22_0 = pg.voice_bgm.NewMainScene.default_bgm
			else
				var_22_0 = pg.voice_bgm.NewMainScene.bgm
			end
		end
	elseif arg_22_1 == PipeGameConst.bgm_type_menu then
		var_22_0 = WatermelonGameConst.menu_bgm
	elseif arg_22_1 == PipeGameConst.bgm_type_game then
		var_22_0 = WatermelonGameConst.game_bgm
	end

	if arg_22_0.bgm ~= var_22_0 then
		arg_22_0.bgm = var_22_0

		pg.BgmMgr.GetInstance():Push(arg_22_0.__cname, var_22_0)
	end
end

function var_0_0.OnUpdate(arg_23_0)
	arg_23_0:gameStep()
end

function var_0_0.readyStart(arg_24_0)
	arg_24_0.readyStartFlag = true

	var_0_1:prepare()
	arg_24_0.popUI:readyStart()
	arg_24_0.menuUI:show(false)
	arg_24_0.gameUI:show(false)
end

function var_0_0.gameStart(arg_25_0)
	arg_25_0.readyStartFlag = false
	arg_25_0.gameStartFlag = true
	arg_25_0.sendSuccessFlag = false

	arg_25_0.popUI:popCountUI(false)
	arg_25_0.gameUI:start()
	arg_25_0.gameUI:show(true)
	arg_25_0.gameScene:start()
	arg_25_0:timerStart()
	arg_25_0:changeBgm(PipeGameConst.bgm_type_game)
end

function var_0_0.changeSpeed(arg_26_0, arg_26_1)
	return
end

function var_0_0.gameStep(arg_27_0)
	if arg_27_0.gameStartFlag and not arg_27_0.gameStop then
		arg_27_0:stepRunTimeData()
		arg_27_0.gameUI:step(var_0_1.deltaTime)
		arg_27_0.gameScene:step(var_0_1.deltaTime)
		Physics2D.Simulate(var_0_1.deltaTime)
	end

	if IsUnityEditor then
		if Input.GetKeyDown(KeyCode.A) then
			arg_27_0.gameUI:press(KeyCode.A, true)
		end

		if Input.GetKeyUp(KeyCode.A) then
			arg_27_0.gameUI:press(KeyCode.A, false)
		end

		if Input.GetKeyDown(KeyCode.D) then
			arg_27_0.gameUI:press(KeyCode.D, true)
		end

		if Input.GetKeyUp(KeyCode.D) then
			arg_27_0.gameUI:press(KeyCode.D, false)
		end

		if Input.GetKeyDown(KeyCode.J) then
			arg_27_0.gameUI:press(KeyCode.J, true)
		end
	end
end

function var_0_0.timerStart(arg_28_0)
	arg_28_0.gamestop = false
end

function var_0_0.timerResume(arg_29_0)
	arg_29_0.gamestop = false

	arg_29_0.gameScene:resume()
end

function var_0_0.timerStop(arg_30_0)
	arg_30_0.gamestop = true

	arg_30_0.gameScene:stop()
end

function var_0_0.stepRunTimeData(arg_31_0)
	local var_31_0 = Time.deltaTime

	var_0_1.gameTime = var_0_1.gameTime - var_31_0
	var_0_1.gameStepTime = var_0_1.gameStepTime + var_31_0
	var_0_1.deltaTime = var_31_0
end

function var_0_0.addScore(arg_32_0, arg_32_1)
	var_0_1.scoreNum = var_0_1.scoreNum + arg_32_1
end

function var_0_0.onGameOver(arg_33_0)
	if arg_33_0.settlementFlag then
		return
	end

	arg_33_0:timerStop()
	arg_33_0:clearController()

	arg_33_0.settlementFlag = true

	setActive(arg_33_0.clickMask, true)
	LeanTween.delayedCall(go(arg_33_0._tf), 0.1, System.Action(function()
		arg_33_0.settlementFlag = false
		arg_33_0.gameStartFlag = false

		setActive(arg_33_0.clickMask, false)
		arg_33_0.popUI:updateSettlementUI()
		arg_33_0.popUI:popSettlementUI(true)
	end))
end

function var_0_0.OnApplicationPaused(arg_35_0)
	if not arg_35_0.gameStartFlag then
		return
	end

	if arg_35_0.readyStartFlag then
		return
	end

	if arg_35_0.settlementFlag then
		return
	end

	arg_35_0:pauseGame()
	arg_35_0.popUI:popPauseUI()
end

function var_0_0.clearController(arg_36_0)
	arg_36_0.gameScene:clear()
end

function var_0_0.pauseGame(arg_37_0)
	arg_37_0.gameStop = true

	arg_37_0:changeSpeed(0)
	arg_37_0:timerStop()
end

function var_0_0.resumeGame(arg_38_0)
	arg_38_0.gameStop = false

	arg_38_0:changeSpeed(1)
	arg_38_0:timerStart()
end

function var_0_0.onBackPressed(arg_39_0)
	if arg_39_0.readyStartFlag then
		return
	end

	if not arg_39_0.gameStartFlag then
		return
	else
		if arg_39_0.settlementFlag then
			return
		end

		arg_39_0.popUI:backPressed()
	end
end

function var_0_0.OnSendMiniGameOPDone(arg_40_0, arg_40_1)
	return
end

function var_0_0.willExit(arg_41_0)
	if arg_41_0.handle then
		UpdateBeat:RemoveListener(arg_41_0.handle)
	end

	if arg_41_0._tf and LeanTween.isTweening(go(arg_41_0._tf)) then
		LeanTween.cancel(go(arg_41_0._tf))
	end

	Time.timeScale = 1

	var_0_1:clear()
end

return var_0_0
