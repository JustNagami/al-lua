local var_0_0 = class("IslandSeekGameView", import("Mod.Island.Core.View.IslandView"))
local var_0_1 = 0

function var_0_0.Init(arg_1_0)
	var_0_0.super.Init(arg_1_0)

	local var_1_0 = arg_1_0:CreateResultView()

	var_1_0:Init()
	table.insert(arg_1_0.views, var_1_0)

	local var_1_1 = IslandSeekGameSystem.New(arg_1_0, var_0_1)

	table.insert(arg_1_0.systems, var_1_1)
	arg_1_0:Op("NotifiyIsland", ISLAND_EX_EVT.SEEK_GAME_START)
end

function var_0_0.CreateResultView(arg_2_0)
	return IslandSeekGameResultView.New(arg_2_0)
end

function var_0_0.OnSceneInited(arg_3_0)
	arg_3_0:DisableOp()
	arg_3_0:GetSystem(var_0_1):OnSceneInitEnd()

	arg_3_0.isInit = true
end

function var_0_0.AddListeners(arg_4_0)
	var_0_0.super.AddListeners(arg_4_0)
	arg_4_0:AddListener(ISLAND_EVT.SEEK_GAME_START, arg_4_0.OnGameStart)
	arg_4_0:AddListener(ISLAND_EVT.SEEK_GAME_FAILED, arg_4_0.OnGameFailed)
	arg_4_0:AddListener(ISLAND_EVT.SEEK_GAME_SUCCESS, arg_4_0.OnGameSuccess)
end

function var_0_0.RemoveListeners(arg_5_0)
	var_0_0.super.RemoveListeners(arg_5_0)
	arg_5_0:RemoveListener(ISLAND_EVT.SEEK_GAME_START, arg_5_0.OnGameStart)
	arg_5_0:RemoveListener(ISLAND_EVT.SEEK_GAME_FAILED, arg_5_0.OnGameFailed)
	arg_5_0:RemoveListener(ISLAND_EVT.SEEK_GAME_SUCCESS, arg_5_0.OnGameSuccess)
end

function var_0_0.OnGameStart(arg_6_0)
	IslandCameraMgr.instance:LookAt(arg_6_0.player._tf)
	arg_6_0:GetSystem(var_0_1):StartGame()
	arg_6_0:EnableOp()
end

function var_0_0.OnGameFailed(arg_7_0)
	arg_7_0:GetSystem(var_0_1):StopGame()
	arg_7_0.player:StopMoveHandle()
	arg_7_0:DisableOp()
	arg_7_0:GetSubView(IslandSeekGameResultView):Show()
end

function var_0_0.OnGameSuccess(arg_8_0)
	arg_8_0:GetSystem(var_0_1):StopGame()
end

function var_0_0.RestartGame(arg_9_0)
	arg_9_0:GetSystem(var_0_1):RestartGame()
	arg_9_0.player:ResetPosition()
	arg_9_0:EnableOp()
end

function var_0_0.OnDispose(arg_10_0)
	var_0_0.super.OnDispose(arg_10_0)
	arg_10_0:Op("NotifiyIsland", ISLAND_EX_EVT.SEEK_GAME_END)
end

return var_0_0
