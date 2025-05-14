local var_0_0 = class("TowerClimbingController")

function var_0_0.Ctor(arg_1_0)
	arg_1_0.view = TowerClimbingView.New(arg_1_0)
end

function var_0_0.SetCallBack(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.OnGameEndCallBack = arg_2_1
	arg_2_0.OnOverMapScore = arg_2_2
end

function var_0_0.setGameStateCallback(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.startGameCalback = arg_3_1
	arg_3_0.endGameCallback = arg_3_2
end

function var_0_0.setRoomTip(arg_4_0, arg_4_1)
	arg_4_0.view:setRoomTip(arg_4_1)
end

function var_0_0.SetUp(arg_5_0, arg_5_1)
	arg_5_0:NetUpdateData(arg_5_1)
	arg_5_0.view:OnEnter()
end

function var_0_0.NetUpdateData(arg_6_0, arg_6_1)
	arg_6_0.data = arg_6_1
end

function var_0_0.StartGame(arg_7_0, arg_7_1)
	if arg_7_0.enterGame then
		return
	end

	arg_7_0.enterGame = true

	seriesAsync({
		function(arg_8_0)
			arg_7_0.map = TowerClimbingMapVO.New(arg_7_1, arg_7_0.view)

			arg_7_0.view:OnCreateMap(arg_7_0.map, arg_8_0)
		end,
		function(arg_9_0)
			arg_7_0.map:Init(arg_7_0.data, arg_9_0)

			if arg_7_0.startGameCalback then
				arg_7_0.startGameCalback()
			end
		end,
		function(arg_10_0)
			arg_7_0.view:DoEnter(arg_10_0)
		end
	}, function()
		arg_7_0.IsStarting = true

		arg_7_0:MainLoop()
		arg_7_0.view:OnStartGame()
	end)
end

function var_0_0.EnterBlock(arg_12_0, arg_12_1, arg_12_2)
	if arg_12_0.map:GetPlayer():IsFatalInjured() then
		return
	end

	if arg_12_0.map:GetPlayer():IsDeath() then
		return
	end

	if arg_12_1.normal == Vector2.up then
		arg_12_0.map:GetPlayer():UpdateStand(true)

		arg_12_0.level = arg_12_2

		arg_12_0.map:SetCurrentLevel(arg_12_2)
	end
end

function var_0_0.StayBlock(arg_13_0, arg_13_1, arg_13_2)
	if arg_13_0.map:GetPlayer():IsFatalInjured() then
		return
	end

	if arg_13_0.map:GetPlayer():IsDeath() then
		return
	end

	if _.any(arg_13_1, function(arg_14_0)
		return arg_14_0.normal == Vector2.up
	end) and not arg_13_0.map:GetPlayer():IsIdle() and arg_13_2 == Vector2(0, 0) then
		arg_13_0.map:GetPlayer():Idle()
	end
end

function var_0_0.ExitBlock(arg_15_0, arg_15_1)
	if arg_15_0.map:GetPlayer():IsFatalInjured() then
		return
	end

	if arg_15_0.map:GetPlayer():IsDeath() then
		return
	end

	if arg_15_0.level == arg_15_1 then
		arg_15_0.map:GetPlayer():UpdateStand(false)
	end
end

function var_0_0.EnterAttacker(arg_16_0)
	if arg_16_0.map:GetPlayer():IsFatalInjured() then
		return
	end

	if arg_16_0.map:GetPlayer():IsDeath() then
		return
	end

	arg_16_0.map:GetPlayer():BeInjured()
	arg_16_0.map:GetPlayer():AddInvincibleEffect(TowerClimbingGameSettings.INVINCEIBLE_TIME)
end

function var_0_0.EnterGround(arg_17_0)
	if arg_17_0.map:GetPlayer():IsFatalInjured() then
		return
	end

	if arg_17_0.map:GetPlayer():IsDeath() then
		return
	end

	arg_17_0.map:GetPlayer():BeFatalInjured(function()
		if not arg_17_0.map:GetPlayer():IsDeath() then
			arg_17_0.map:GetPlayer():AddInvincibleEffect(TowerClimbingGameSettings.INVINCEIBLE_TIME)
			arg_17_0.map:GetPlayer():UpdateStand(true)
			arg_17_0.map:ReBornPlayer()
			arg_17_0.map:GetPlayer():Idle()
		end
	end)

	if not arg_17_0.map:GetPlayer():IsDeath() then
		arg_17_0.map:SetGroundSleep(TowerClimbingGameSettings.GROUND_SLEEP_TIME)
	end
end

function var_0_0.OnStickChange(arg_19_0, arg_19_1)
	if arg_19_0.map:GetPlayer():IsFatalInjured() then
		return
	end

	if arg_19_1 > 0.05 then
		arg_19_0.map:GetPlayer():MoveRight()
	elseif arg_19_1 < -0.05 then
		arg_19_0.map:GetPlayer():MoveLeft()
	end
end

function var_0_0.MainLoop(arg_20_0)
	if not arg_20_0.handle then
		arg_20_0.handle = UpdateBeat:CreateListener(arg_20_0.Update, arg_20_0)
	end

	UpdateBeat:AddListener(arg_20_0.handle)
end

function var_0_0.Update(arg_21_0)
	arg_21_0.view:Update()
	arg_21_0.map:Update()
	Physics2D.Simulate(1 / (Application.targetFrameRate or 60))

	if arg_21_0.IsStarting and arg_21_0.map:GetPlayer():IsDeath() then
		arg_21_0:EndGame()
	end
end

function var_0_0.PlayerJump(arg_22_0)
	arg_22_0.map:GetPlayer():Jump()
end

function var_0_0.PlayerIdle(arg_23_0)
	arg_23_0.map:GetPlayer():Idle()
end

local function var_0_1(arg_24_0)
	arg_24_0.IsStarting = false

	if arg_24_0.handle then
		UpdateBeat:RemoveListener(arg_24_0.handle)
	end
end

function var_0_0.EndGame(arg_25_0)
	var_0_1(arg_25_0)

	local var_25_0 = arg_25_0.map:GetPlayer()

	arg_25_0.view:OnEndGame(var_25_0.score, var_25_0.mapScore, arg_25_0.map.id)

	if arg_25_0.OnGameEndCallBack then
		arg_25_0.OnGameEndCallBack(var_25_0.score, var_25_0.higestscore, var_25_0.pageIndex, arg_25_0.map.id)
	end

	if arg_25_0.OnOverMapScore and var_25_0:IsOverMapScore() then
		arg_25_0.OnOverMapScore(arg_25_0.map.id, var_25_0.score)
	end
end

function var_0_0.updateHighScore(arg_26_0, arg_26_1)
	arg_26_0.highScores = arg_26_1

	arg_26_0.view:SetHighScore(arg_26_1)
end

function var_0_0.ExitGame(arg_27_0)
	var_0_1(arg_27_0)
	arg_27_0.view:OnExitGame()

	if arg_27_0.map then
		arg_27_0.map:Dispose()

		arg_27_0.map = nil
	end

	arg_27_0.enterGame = nil

	if arg_27_0.endGameCallback then
		arg_27_0.endGameCallback()
	end
end

function var_0_0.onBackPressed(arg_28_0)
	return arg_28_0.view:onBackPressed()
end

function var_0_0.Dispose(arg_29_0)
	arg_29_0:ExitGame()
	arg_29_0.view:Dispose()
end

return var_0_0
