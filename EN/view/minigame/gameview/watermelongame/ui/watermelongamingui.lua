local var_0_0 = class("WatermelonGamingUI")

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0._tf = arg_1_1
	arg_1_0._event = arg_1_2
	arg_1_0._gameVo = arg_1_3
	arg_1_0._gameUI = findTF(arg_1_0._tf, "ui/gamingUI")
	arg_1_0.btnBack = findTF(arg_1_0._gameUI, "back")
	arg_1_0.btnPause = findTF(arg_1_0._gameUI, "pause")
	arg_1_0.gameTime = findTF(arg_1_0._gameUI, "time")

	onButton(arg_1_0._event, arg_1_0.btnBack, function()
		if not arg_1_0._gameVo.startSettlement then
			arg_1_0._event:emit(WatermelonGameEvent.PAUSE_GAME, true)
			arg_1_0._event:emit(WatermelonGameEvent.OPEN_LEVEL_UI)
		end
	end, SFX_CONFIRM)
	onButton(arg_1_0._event, arg_1_0.btnPause, function()
		if not arg_1_0._gameVo.startSettlement then
			arg_1_0._event:emit(WatermelonGameEvent.PAUSE_GAME, true)
			arg_1_0._event:emit(WatermelonGameEvent.OPEN_PAUSE_UI)
		end
	end, SFX_CONFIRM)

	arg_1_0.direct = Vector2(0, 0)
	arg_1_0.joyStick = MiniGameJoyStick.New(findTF(arg_1_0._gameUI, "joyStick"))

	arg_1_0.joyStick:setActiveCallback(function(arg_4_0)
		return
	end)

	arg_1_0.btnDown = findTF(arg_1_0._gameUI, "down")

	onButton(arg_1_0._event, arg_1_0.btnDown, function()
		arg_1_0._event:emit(WatermelonGameEvent.CLICK_DOWN)
	end, SFX_CONFIRM)
end

function var_0_0.show(arg_6_0, arg_6_1)
	setActive(arg_6_0._gameUI, arg_6_1)
end

function var_0_0.update(arg_7_0)
	return
end

function var_0_0.start(arg_8_0)
	arg_8_0.subGameStepTime = 0

	arg_8_0:show(true)
end

function var_0_0.addScore(arg_9_0, arg_9_1)
	return
end

function var_0_0.step(arg_10_0, arg_10_1)
	local var_10_0 = arg_10_0._gameVo.gameTime

	setText(arg_10_0.gameTime, math.floor(var_10_0))
	arg_10_0.joyStick:step()
	arg_10_0.joyStick:setDirectTarget(arg_10_0.direct)
	arg_10_0._gameVo:setJoyStickData(arg_10_0.joyStick:getValue())
end

function var_0_0.press(arg_11_0, arg_11_1, arg_11_2)
	if arg_11_1 == KeyCode.W then
		if arg_11_2 then
			arg_11_0.direct.y = 1
		elseif arg_11_0.direct.y == 1 then
			arg_11_0.direct.y = 0
		end
	elseif arg_11_1 == KeyCode.S then
		if arg_11_2 then
			arg_11_0.direct.y = -1
		elseif arg_11_0.direct.y == -1 then
			arg_11_0.direct.y = 0
		end
	elseif arg_11_1 == KeyCode.A then
		if arg_11_2 then
			arg_11_0.direct.x = -1
		elseif arg_11_0.direct.x == -1 then
			arg_11_0.direct.x = 0
		end
	elseif arg_11_1 == KeyCode.D then
		if arg_11_2 then
			arg_11_0.direct.x = 1
		elseif arg_11_0.direct.x == 1 then
			arg_11_0.direct.x = 0
		end
	end
end

function var_0_0.press(arg_12_0, arg_12_1, arg_12_2)
	if arg_12_1 == KeyCode.A then
		if arg_12_2 then
			arg_12_0.direct.x = -1
		elseif arg_12_0.direct.x == -1 then
			arg_12_0.direct.x = 0
		end
	elseif arg_12_1 == KeyCode.D then
		if arg_12_2 then
			arg_12_0.direct.x = 1
		elseif arg_12_0.direct.x == 1 then
			arg_12_0.direct.x = 0
		end
	elseif arg_12_1 == KeyCode.J then
		arg_12_0._event:emit(WatermelonGameEvent.CLICK_DOWN)
	end
end

return var_0_0
