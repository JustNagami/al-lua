local var_0_0 = class("EatFoodLayer", import("..base.BaseUI"))
local var_0_1 = {
	"ui-mini_throw",
	"ui-paishou_qing",
	"ui-paishou"
}
local var_0_2 = {
	0,
	0,
	0
}
local var_0_3 = 60
local var_0_4 = "ui/eatfoodgameui_atlas"
local var_0_5 = 67
local var_0_6 = 4
local var_0_7 = 3
local var_0_8 = {
	0,
	630
}
local var_0_9 = {
	150,
	120,
	100,
	120,
	100,
	80,
	150,
	100,
	90,
	150,
	80,
	150,
	80,
	100,
	70
}
local var_0_10 = {
	8,
	10,
	15,
	9,
	12,
	18,
	11,
	13,
	15,
	15,
	8,
	17,
	15,
	10,
	18,
	10,
	18,
	20
}
local var_0_11 = {
	{
		-50,
		50
	},
	{
		-80,
		80
	},
	{
		-50,
		90
	},
	{
		-50,
		50
	},
	{
		-50,
		50
	},
	{
		-50,
		100
	},
	{
		-50,
		80
	},
	{
		-50,
		80
	},
	{
		-50,
		70
	},
	{
		-50,
		80
	},
	{
		-50,
		80
	},
	{
		-50,
		80
	},
	{
		-50,
		50
	},
	{
		-50,
		70
	},
	{
		-50,
		90
	}
}
local var_0_12 = 400
local var_0_13 = 0
local var_0_14 = "event touch"
local var_0_15 = {
	35,
	100
}
local var_0_16 = {
	300,
	10
}
local var_0_17 = {
	"add_1",
	"add_2"
}
local var_0_18 = {
	1000
}
local var_0_19 = {
	-100
}
local var_0_20 = {
	"sub_1"
}
local var_0_21 = {
	{
		126,
		530,
		2
	},
	{
		-100,
		110,
		3
	},
	{
		530,
		1000,
		3
	}
}
local var_0_22 = {
	300,
	10,
	-100
}
local var_0_23 = {
	"add_1",
	"add_2",
	"sub_1"
}
local var_0_24 = 0.8
local var_0_25 = 0.05
local var_0_26 = 1.4
local var_0_27 = 100

local function var_0_28(arg_1_0, arg_1_1)
	local var_1_0 = {
		ctor = function(arg_2_0)
			arg_2_0._tf = arg_1_0
			arg_2_0._event = arg_1_1

			setActive(arg_2_0._tf, false)

			arg_2_0.sliderTouch = findTF(arg_2_0._tf, "touch")

			setActive(arg_2_0.sliderTouch, true)

			arg_2_0.sliderRange = findTF(arg_2_0._tf, "range")
			arg_2_0.sliderRange.anchoredPosition = Vector2(0, var_0_12)
		end,
		start = function(arg_3_0)
			arg_3_0.sliderIndex = 1
			arg_3_0.nextSliderTime = var_0_7
			arg_3_0.sliderTouchPos = Vector2(var_0_8[1], 0)

			arg_3_0:setSliderBarVisible(false)
		end,
		step = function(arg_4_0)
			if arg_4_0.nextSliderTime then
				arg_4_0.nextSliderTime = arg_4_0.nextSliderTime - Time.deltaTime

				if arg_4_0.nextSliderTime <= 0 then
					arg_4_0:setSliderBarVisible(true)
					arg_4_0:startSliderBar()

					arg_4_0.nextSliderTime = arg_4_0.nextSliderTime + var_0_6
				end
			end

			if arg_4_0.sliderBeginning then
				arg_4_0.sliderTouchPos.y = arg_4_0.sliderTouchPos.y + arg_4_0.speed
				arg_4_0.sliderTouch.anchoredPosition = arg_4_0.sliderTouchPos

				if arg_4_0.sliderTouchPos.y > var_0_8[2] then
					arg_4_0:touch(false)
				end
			end
		end,
		setSliderBarVisible = function(arg_5_0, arg_5_1)
			setActive(arg_5_0._tf, arg_5_1)
		end,
		startSliderBar = function(arg_6_0)
			if arg_6_0.sliderIndex > #var_0_9 then
				arg_6_0.sliderIndex = #var_0_9
			end

			arg_6_0.sliderWidth = var_0_9[arg_6_0.sliderIndex]
			arg_6_0.speed = var_0_10[arg_6_0.sliderIndex]
			arg_6_0.speed = var_0_10[arg_6_0.sliderIndex]
			arg_6_0.sliderTouchPos.y = var_0_8[1]
			arg_6_0.sliderBeginning = true
			arg_6_0.sliderRange.sizeDelta = Vector2(arg_6_0.sliderRange.sizeDelta.x, arg_6_0.sliderWidth)
			arg_6_0.sliderRange.anchoredPosition = Vector2(0, var_0_12 + math.random(var_0_11[arg_6_0.sliderIndex][1], var_0_11[arg_6_0.sliderIndex][2]))
		end,
		touch = function(arg_7_0, arg_7_1)
			if not arg_7_0.sliderBeginning then
				return
			end

			arg_7_0.sliderBeginning = false

			arg_7_0:setSliderBarVisible(false)

			local var_7_0 = false
			local var_7_1 = 0
			local var_7_2 = 1
			local var_7_3 = 1
			local var_7_4 = 1
			local var_7_5 = arg_7_0.sliderTouchPos.y

			if math.abs(arg_7_0.sliderTouchPos.y - arg_7_0.sliderRange.anchoredPosition.y) < arg_7_0.sliderWidth / 2 then
				var_7_1, var_7_2 = var_0_22[1], 1
				arg_7_0.sliderIndex = arg_7_0.sliderIndex + 1
				var_7_0 = true
			else
				for iter_7_0, iter_7_1 in ipairs(var_0_21) do
					if var_7_5 >= iter_7_1[1] and var_7_5 <= iter_7_1[2] then
						var_7_4 = iter_7_1[3]
					end
				end

				var_7_1, var_7_2 = var_0_22[var_7_4], var_7_4
				arg_7_0.nextSliderTime = arg_7_0.nextSliderTime + var_0_13
				var_7_0 = false
			end

			pg.CriMgr.GetInstance():PlaySE_V3(var_0_1[var_7_4])
			arg_7_0._event:emit(var_0_14, {
				flag = var_7_0,
				score = var_7_1,
				hit_index = var_7_2,
				hit_area = var_7_4
			}, function()
				return
			end)
		end,
		getSubScore = function(arg_9_0, arg_9_1)
			local var_9_0 = var_0_19[1]
			local var_9_1 = 1

			for iter_9_0 = #var_0_18, 1, -1 do
				if arg_9_1 < var_0_18[iter_9_0] then
					var_9_0 = var_0_19[iter_9_0]
					var_9_1 = iter_9_0

					return var_9_0, var_9_1
				end
			end

			return var_9_0, var_9_1
		end,
		getScore = function(arg_10_0, arg_10_1)
			local var_10_0 = 0
			local var_10_1 = #var_0_15

			for iter_10_0 = 1, #var_0_15 do
				if arg_10_1 < var_0_15[iter_10_0] then
					var_10_0 = var_0_16[iter_10_0]
					var_10_1 = iter_10_0

					print("hit range" .. arg_10_1)

					return var_10_0, var_10_1
				end
			end

			return var_10_0, var_10_1
		end,
		destroy = function(arg_11_0)
			return
		end
	}

	var_1_0:ctor()

	return var_1_0
end

function var_0_0.getUIName(arg_12_0)
	return "EatFoodLayerUI"
end

function var_0_0.didEnter(arg_13_0)
	arg_13_0:initEvent()
	arg_13_0:initData()
	arg_13_0:initUI()
	arg_13_0:initGameUI()
	arg_13_0:readyStart()
end

function var_0_0.initEvent(arg_14_0)
	arg_14_0:bind(var_0_14, function(arg_15_0, arg_15_1, arg_15_2)
		if arg_15_1.score and arg_15_1.score ~= 0 then
			arg_14_0:addScore(arg_15_1.score, arg_15_1.hit_index, arg_15_1.hit_area)
		end
	end)
end

function var_0_0.initData(arg_16_0)
	local var_16_0 = Application.targetFrameRate or 60

	if var_16_0 > 60 then
		var_16_0 = 60
	end

	arg_16_0.timer = Timer.New(function()
		arg_16_0:onTimer()
	end, 1 / var_16_0, -1)
end

function var_0_0.initUI(arg_18_0)
	arg_18_0.backSceneTf = findTF(arg_18_0._tf, "scene_container/scene_background")
	arg_18_0.sceneTf = findTF(arg_18_0._tf, "scene_container/scene")
	arg_18_0.bgTf = findTF(arg_18_0._tf, "bg")
	arg_18_0.clickMask = findTF(arg_18_0._tf, "clickMask")
	arg_18_0.settlementUI = findTF(arg_18_0._tf, "pop/SettleMentUI")

	onButton(arg_18_0, findTF(arg_18_0.settlementUI, "btnOver"), function()
		arg_18_0:checkGameExit()
	end, SFX_CANCEL)
	SetActive(arg_18_0.settlementUI, false)

	if not arg_18_0.handle then
		arg_18_0.handle = UpdateBeat:CreateListener(arg_18_0.Update, arg_18_0)
	end

	UpdateBeat:AddListener(arg_18_0.handle)
end

function var_0_0.initGameUI(arg_20_0)
	arg_20_0.gameUI = findTF(arg_20_0._tf, "ui/gameUI")

	onButton(arg_20_0, findTF(arg_20_0.gameUI, "btnLeave"), function()
		arg_20_0:checkGameExit()
	end)

	arg_20_0.dragDelegate = GetOrAddComponent(arg_20_0.sceneTf, "EventTriggerListener")
	arg_20_0.dragDelegate.enabled = true

	arg_20_0.dragDelegate:AddPointDownFunc(function(arg_22_0, arg_22_1)
		if arg_20_0.sliderController then
			arg_20_0.sliderController:touch(true)
		end
	end)

	arg_20_0.gameTimeS = findTF(arg_20_0.gameUI, "top/time/s")
	arg_20_0.scoreTf = findTF(arg_20_0.gameUI, "top/score")
	arg_20_0.scoreTextTf = findTF(arg_20_0.scoreTf, "text")
	arg_20_0.sceneScoreTf = findTF(arg_20_0.sceneTf, "score")

	setActive(arg_20_0.sceneScoreTf, false)

	arg_20_0.sliderController = var_0_28(findTF(arg_20_0.sceneTf, "collider"), arg_20_0)
end

function var_0_0.Update(arg_23_0)
	arg_23_0:AddDebugInput()
end

function var_0_0.AddDebugInput(arg_24_0)
	if arg_24_0.gameStop or arg_24_0.settlementFlag then
		return
	end

	if IsUnityEditor then
		-- block empty
	end
end

function var_0_0.clearUI(arg_25_0)
	setActive(arg_25_0.sceneTf, false)
	setActive(arg_25_0.settlementUI, false)
	setActive(arg_25_0.gameUI, false)
end

function var_0_0.readyStart(arg_26_0)
	arg_26_0:gameStart()
end

function var_0_0.gameStart(arg_27_0)
	setActive(findTF(arg_27_0._tf, "scene_container"), true)
	setActive(findTF(arg_27_0.bgTf, "on"), false)
	setActive(arg_27_0.gameUI, true)

	arg_27_0.gameStartFlag = true
	arg_27_0.scoreNum = 0
	arg_27_0.playerPosIndex = 2
	arg_27_0.gameStepTime = 0
	arg_27_0.gameTime = var_0_3

	if arg_27_0.sliderController then
		arg_27_0.sliderController:start()
	end

	arg_27_0:updateGameUI()
	arg_27_0:timerStart()
end

function var_0_0.transformColor(arg_28_0, arg_28_1)
	local var_28_0 = tonumber(string.sub(arg_28_1, 1, 2), 16)
	local var_28_1 = tonumber(string.sub(arg_28_1, 3, 4), 16)
	local var_28_2 = tonumber(string.sub(arg_28_1, 5, 6), 16)

	return Color.New(var_28_0 / 255, var_28_1 / 255, var_28_2 / 255)
end

function var_0_0.addScore(arg_29_0, arg_29_1, arg_29_2, arg_29_3)
	setActive(arg_29_0.sceneScoreTf, false)

	if arg_29_1 then
		arg_29_0.scoreNum = arg_29_0.scoreNum + arg_29_1

		local var_29_0 = 1

		setActive(findTF(arg_29_0.sceneScoreTf, "anim/add_1"), false)
		setActive(findTF(arg_29_0.sceneScoreTf, "anim/add_2"), false)
		setActive(findTF(arg_29_0.sceneScoreTf, "anim/sub_1"), false)

		local var_29_1

		if arg_29_1 >= 0 then
			setActive(findTF(arg_29_0.sceneScoreTf, "anim/" .. var_0_23[arg_29_3]), true)

			var_29_1 = true
		else
			setActive(findTF(arg_29_0.sceneScoreTf, "anim/" .. var_0_23[arg_29_3]), true)

			var_29_1 = false
		end

		arg_29_0:emit(EatFoodMediator.GAME_HIT_AREA, {
			success = var_29_1,
			index = arg_29_3
		})
		setActive(arg_29_0.sceneScoreTf, true)
	end

	arg_29_0:updateGameUI()
end

function var_0_0.onTimer(arg_30_0)
	arg_30_0:gameStep()
end

function var_0_0.gameStep(arg_31_0)
	arg_31_0.gameTime = arg_31_0.gameTime - Time.deltaTime
	arg_31_0.gameStepTime = arg_31_0.gameStepTime + Time.deltaTime

	if arg_31_0.gameTime < 0 then
		arg_31_0.gameTime = 0
	end

	arg_31_0:updateGameUI()

	if arg_31_0.sliderController then
		arg_31_0.sliderController:step()
	end

	if arg_31_0.gameTime <= 0 then
		arg_31_0:onGameOver(0)

		return
	end
end

function var_0_0.timerStart(arg_32_0)
	if not arg_32_0.timer.running then
		arg_32_0.timer:Start()
	end
end

function var_0_0.timerStop(arg_33_0)
	if arg_33_0.timer.running then
		arg_33_0.timer:Stop()
	end
end

function var_0_0.updateGameUI(arg_34_0)
	setText(arg_34_0.scoreTextTf, arg_34_0.scoreNum)
	setText(arg_34_0.gameTimeS, math.ceil(arg_34_0.gameTime))
end

function var_0_0.onGameOver(arg_35_0, arg_35_1)
	if arg_35_0.settlementFlag then
		return
	end

	arg_35_0:timerStop()

	arg_35_0.settlementFlag = true

	setActive(arg_35_0.clickMask, true)
	setActive(findTF(arg_35_0._tf, "scene_container"), false)
	setActive(arg_35_0.gameUI, false)
	LeanTween.delayedCall(go(arg_35_0._tf), arg_35_1, System.Action(function()
		arg_35_0.settlementFlag = false
		arg_35_0.gameStartFlag = false

		setActive(arg_35_0.clickMask, false)
		arg_35_0:showSettlement()
	end))
end

function var_0_0.showSettlement(arg_37_0)
	arg_37_0:emit(EatFoodMediator.GAME_RESULT, {
		win = arg_37_0.scoreNum >= var_0_27,
		score = arg_37_0.scoreNum
	})
	setActive(arg_37_0.settlementUI, true)

	local var_37_0 = arg_37_0.scoreNum
	local var_37_1 = getProxy(PlayerProxy):getPlayerId()
	local var_37_2 = PlayerPrefs.GetInt("mg_score_" .. tostring(var_37_1) .. "_" .. var_0_5) or 0

	setActive(findTF(arg_37_0.settlementUI, "ad/new"), var_37_2 < var_37_0)

	if var_37_2 <= var_37_0 then
		var_37_2 = var_37_0

		PlayerPrefs.SetInt("mg_score_" .. tostring(var_37_1) .. "_" .. var_0_5, var_37_2)
	end

	local var_37_3 = findTF(arg_37_0.settlementUI, "ad/highText")
	local var_37_4 = findTF(arg_37_0.settlementUI, "ad/currentText")

	setText(var_37_3, var_37_2)
	setText(var_37_4, var_37_0)
end

function var_0_0.resumeGame(arg_38_0)
	arg_38_0.gameStop = false

	arg_38_0:timerStart()
end

function var_0_0.stopGame(arg_39_0)
	arg_39_0.gameStop = true

	arg_39_0:timerStop()
end

function var_0_0.getMiniGameData(arg_40_0)
	if not arg_40_0._mgData then
		arg_40_0._mgData = getProxy(MiniGameProxy):GetMiniGameData(var_0_5)
	end

	return arg_40_0._mgData
end

function var_0_0.onBackPressed(arg_41_0)
	arg_41_0:checkGameExit()
end

function var_0_0.checkGameExit(arg_42_0)
	if not arg_42_0.gameStartFlag then
		arg_42_0:emit(EatFoodMediator.GAME_CLOSE, true)
		arg_42_0:emit(var_0_0.ON_BACK_PRESSED)
	else
		if arg_42_0.gameStop then
			return
		end

		arg_42_0:stopGame()

		if arg_42_0.contextData.isDorm3d then
			pg.NewStyleMsgboxMgr.GetInstance():Show(pg.NewStyleMsgboxMgr.TYPE_MSGBOX, {
				contentText = i18n("mini_game_leave"),
				onConfirm = function()
					arg_42_0:emit(EatFoodMediator.GAME_CLOSE, false)
					arg_42_0:emit(var_0_0.ON_BACK_PRESSED)
				end,
				onClose = function()
					arg_42_0:resumeGame()
				end
			})
		else
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("mini_game_leave"),
				onYes = function()
					arg_42_0:emit(EatFoodMediator.GAME_CLOSE, false)
					arg_42_0:emit(var_0_0.ON_BACK_PRESSED)
				end,
				onNo = function()
					arg_42_0:resumeGame()
				end
			})
		end
	end
end

function var_0_0.willExit(arg_47_0)
	if arg_47_0.handle then
		UpdateBeat:RemoveListener(arg_47_0.handle)
	end

	if arg_47_0._tf and LeanTween.isTweening(go(arg_47_0._tf)) then
		LeanTween.cancel(go(arg_47_0._tf))
	end

	if arg_47_0.timer and arg_47_0.timer.running then
		arg_47_0.timer:Stop()
	end

	Time.timeScale = 1
	arg_47_0.timer = nil
end

return var_0_0
