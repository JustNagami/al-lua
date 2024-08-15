local var_0_0 = class("GameRoomTowerView", import("..BaseMiniGameView"))

function var_0_0.getUIName(arg_1_0)
	return "GameRoomTowerUI"
end

function var_0_0.GetMGData(arg_2_0)
	local var_2_0 = arg_2_0.contextData.miniGameId

	return getProxy(MiniGameProxy):GetMiniGameData(var_2_0):clone()
end

function var_0_0.GetMGHubData(arg_3_0)
	local var_3_0 = arg_3_0.contextData.miniGameId

	return getProxy(MiniGameProxy):GetHubByGameId(var_3_0)
end

function var_0_0.didEnter(arg_4_0)
	arg_4_0:Start()

	arg_4_0.backBtn = findTF(arg_4_0._tf, "overview/back")

	onButton(arg_4_0, arg_4_0.backBtn, function()
		arg_4_0:emit(var_0_0.ON_BACK)
	end, SFX_PANEL)
end

function var_0_0.Start(arg_6_0)
	arg_6_0.controller = TowerClimbingController.New()

	arg_6_0.controller:setGameStateCallback(function()
		arg_6_0:openCoinLayer(false)
	end, function()
		arg_6_0:openCoinLayer(true)
	end)
	arg_6_0.controller:setRoomTip(arg_6_0:getGameRoomData().game_help)
	arg_6_0.controller.view:SetUI(arg_6_0._go)

	local function var_6_0(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
		arg_6_0.sendSuccessFlag = true

		arg_6_0:SendSuccess(arg_9_0)
	end

	local function var_6_1(arg_10_0, arg_10_1)
		return
	end

	arg_6_0.controller:SetCallBack(var_6_0, var_6_1)

	local var_6_2 = arg_6_0:PackData()

	arg_6_0.controller:SetUp(var_6_2)
end

function var_0_0.updateHighScore(arg_11_0)
	local var_11_0 = getProxy(GameRoomProxy):getRoomScore(arg_11_0:getGameRoomData().id)
	local var_11_1 = {
		var_11_0,
		var_11_0,
		var_11_0
	} or {}

	if arg_11_0.controller then
		arg_11_0.controller:updateHighScore(var_11_1)
	end
end

function var_0_0.OnSendMiniGameOPDone(arg_12_0, arg_12_1)
	arg_12_0.itemNums = getProxy(MiniGameProxy):GetHubByHubId(arg_12_0.hub_id).count or 0

	setText(findTF(arg_12_0._tf, "overview/item/num"), arg_12_0.itemNums)
	arg_12_0:updateHighScore()
end

function var_0_0.getGameTimes(arg_13_0)
	return arg_13_0:GetMGHubData().count
end

function var_0_0.GetTowerClimbingPageAndScore(arg_14_0)
	local var_14_0 = 0
	local var_14_1 = 1
	local var_14_2 = {
		arg_14_0,
		arg_14_0,
		arg_14_0
	}

	return var_14_0, var_14_1, var_14_2
end

function var_0_0.GetAwardScores()
	local var_15_0 = pg.mini_game[MiniGameDataCreator.TowerClimbingGameID].simple_config_data

	return (_.map(var_15_0, function(arg_16_0)
		return arg_16_0[1]
	end))
end

function var_0_0.PackData(arg_17_0)
	local var_17_0 = arg_17_0._tf.rect.width
	local var_17_1 = arg_17_0._tf.rect.height
	local var_17_2, var_17_3, var_17_4 = var_0_0.GetTowerClimbingPageAndScore(getProxy(GameRoomProxy):getRoomScore(arg_17_0:getGameRoomData().id))

	print(var_17_2, "-", var_17_3)

	local var_17_5 = var_0_0.GetAwardScores()

	return {
		shipId = 107031,
		npcName = "TowerClimbingManjuu",
		life = 3,
		screenWidth = var_17_0,
		screenHeight = var_17_1,
		higestscore = var_17_2,
		pageIndex = var_17_3,
		mapScores = var_17_4,
		awards = var_17_5
	}
end

function var_0_0.onBackPressed(arg_18_0)
	if arg_18_0.controller and arg_18_0.controller:onBackPressed() then
		return
	end

	arg_18_0:emit(var_0_0.ON_BACK)
end

function var_0_0.willExit(arg_19_0)
	if arg_19_0.controller then
		arg_19_0.controller:Dispose()
	end
end

return var_0_0
