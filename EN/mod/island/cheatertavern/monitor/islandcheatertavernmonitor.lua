local var_0_0 = class("IslandCheaterTavernMonitor", import("...Core.Net.IslandBaseMonitor"))

var_0_0.ADD_CHEATERTAVERN_PLAYER = "IslandCheaterTavernMonitor:ADD_CHEATERTAVERN_PLAYER"
var_0_0.INIT_PLAYER_DATA_DONE = "IslandCheaterTavernMonitor:INIT_PLAYER_DATA_DONE"

function var_0_0.register(arg_1_0)
	arg_1_0.cheaterTavernAgency = arg_1_0:GetIsland():GetCheaterTavernAgency()

	arg_1_0:on(23101, function(arg_2_0)
		arg_1_0.cheaterTavernAgency:SetIsConnecting()

		if IslandCheaterTavernConst.changeSeat then
			local var_2_0

			for iter_2_0, iter_2_1 in ipairs(arg_2_0.player_list) do
				if iter_2_1.user_id == getProxy(PlayerProxy):getRawData().id then
					var_2_0 = iter_2_1.seat
				end
			end

			local function var_2_1(arg_3_0, arg_3_1, arg_3_2)
				return (arg_3_0 - arg_3_1 + arg_3_2 - 1) % 4 + 1
			end

			for iter_2_2, iter_2_3 in ipairs(arg_2_0.player_list) do
				iter_2_3.seat = var_2_1(iter_2_3.seat, var_2_0, IslandCheaterTavernConst.currentMainSeat)
			end
		end

		onNextTick(function()
			arg_1_0:StartCheaterTevernGame(arg_2_0)
			arg_1_0:InitPlayerDate(arg_2_0)
		end)
	end)
	arg_1_0:on(23102, function(arg_5_0)
		if not arg_1_0.cheaterTavernAgency:IsConnecting() then
			return
		end

		arg_1_0:CheaterTevernGameEveryRound(arg_5_0)
	end)
	arg_1_0:on(23105, function(arg_6_0)
		if not arg_1_0.cheaterTavernAgency:IsConnecting() then
			return
		end

		arg_1_0:PlayOperateHandle(arg_6_0)
	end)
	arg_1_0:on(23108, function(arg_7_0)
		if not arg_1_0.cheaterTavernAgency:IsConnecting() then
			return
		end

		local var_7_0 = getProxy(ActivityProxy)
		local var_7_1 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_ISLAND_CHEAT_BAR)
		local var_7_2

		if arg_1_0.cheaterTavernAgency:GetRoomType() == 1 then
			var_7_2 = 0
		else
			var_7_2 = arg_7_0.cur_score - var_7_1.data1
			var_7_1.data1 = arg_7_0.cur_score
			var_7_1.data2 = math.max(arg_7_0.cur_score, var_7_1.data2)

			var_7_0:updateActivity(var_7_1)
		end

		arg_1_0.cheaterTavernAgency:GetMainPlayer():SetGameData(arg_7_0.rank, var_7_2)
		pg.m02:sendNotification(GAME.ISLAND_CHEATER_END_SCORE_NOTIFY, arg_7_0)

		local var_7_3 = getProxy(ActivityTaskProxy):getTaskById(ActivityConst.ISLAND_BAR_SIGN_ACT_ID)

		if var_7_3[1] then
			pg.m02:sendNotification(GAME.MINI_GAME_TASK_PROGRESS_UPDATE, {
				progressAdd = 1,
				actId = ActivityConst.ISLAND_BAR_SIGN_ACT_ID,
				taskId = var_7_3[1].id
			})
		end
	end)
	arg_1_0:on(23116, function(arg_8_0)
		if not arg_1_0.cheaterTavernAgency:IsConnecting() then
			return
		end

		pg.m02:sendNotification(GAME.ISLAND_CHEATER_REAL_END_NOTIFY, arg_8_0)
	end)
	arg_1_0:on(23115, function(arg_9_0)
		if not arg_1_0.cheaterTavernAgency:IsConnecting() then
			return
		end

		arg_1_0.cheaterTavernAgency:UpdatePlayerDelegateState(arg_9_0.user_id, arg_9_0.state)
		pg.m02:sendNotification(GAME.ISLAND_CHEATER_DELEGATE_NOTIFY)
	end)
	arg_1_0:on(23117, function(arg_10_0)
		local var_10_0 = getProxy(ActivityProxy)
		local var_10_1 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_ISLAND_CHEAT_BAR)
		local var_10_2 = arg_10_0.cur_score - var_10_1.data1

		var_10_1.data1 = arg_10_0.cur_score
		var_10_1.data2 = math.max(arg_10_0.cur_score, var_10_1.data2)

		var_10_0:updateActivity(var_10_1)
	end)
end

function var_0_0.InitPlayerDate(arg_11_0, arg_11_1)
	for iter_11_0, iter_11_1 in ipairs(arg_11_1.player_list or {}) do
		local var_11_0 = iter_11_1.seat
		local var_11_1 = iter_11_1.player_info
		local var_11_2 = {
			user_view = PlayRoomTools.GetGameViewID(var_11_1.user_view),
			seat = var_11_0,
			id = var_11_1.id
		}

		arg_11_0:GetIsland():DispatchEvent(IslandCheaterTavernMonitor.ADD_CHEATERTAVERN_PLAYER, var_11_2)
	end

	arg_11_0:GetIsland():DispatchEvent(IslandCheaterTavernMonitor.INIT_PLAYER_DATA_DONE)
end

function var_0_0.Init(arg_12_0)
	return
end

function var_0_0.StartCheaterTevernGame(arg_13_0, arg_13_1)
	arg_13_0.cheaterTavernAgency:SetStartGameData(arg_13_1)

	local var_13_0 = {
		user_id = arg_13_1.user_id,
		operationType = IslandCheaterTavernConst.PlayerCurrentOperateType.PutCard,
		auto_time = arg_13_1.auto_time
	}

	pg.m02:sendNotification(GAME.ISLAND_CHEATER_FIRSTROND_START, {
		operation = var_13_0
	})
end

function var_0_0.CheaterTevernGameEveryRound(arg_14_0, arg_14_1)
	arg_14_0.cheaterTavernAgency:UpdateGameDataEveryRound(arg_14_1)

	local var_14_0 = {
		user_id = arg_14_1.user_id,
		operationType = IslandCheaterTavernConst.PlayerCurrentOperateType.PutCard,
		auto_time = arg_14_1.auto_time
	}

	pg.m02:sendNotification(GAME.ISLAND_CHEATER_FIRSTROND_START, {
		operation = var_14_0
	})
end

function var_0_0.PlayOperateHandle(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_1.user_id
	local var_15_1 = arg_15_1.return_list
	local var_15_2 = getProxy(PlayerProxy):getRawData().id
	local var_15_3

	switch(arg_15_1.type, {
		[IslandCheaterTavernConst.PlayerOperateType.PutCard] = function()
			local var_16_0 = var_15_1[1] == 1
			local var_16_1 = var_15_1[2]

			if var_16_0 and var_15_0 == getProxy(PlayerProxy):getRawData().id then
				var_15_3 = arg_15_0.cheaterTavernAgency:GetMainPlayerAutoPutCard(var_16_1)

				arg_15_0.cheaterTavernAgency:MainPlayerPutCard(var_15_3)
			end

			arg_15_0.cheaterTavernAgency:ReducePlayerCardNum(var_15_0, var_16_1)

			if var_15_0 == var_15_2 then
				IslandCheaterTavernRecordTools.AddRoundCnt()
				IslandCheaterTavernRecordTools.StopPutCardTime()
			end
		end,
		[IslandCheaterTavernConst.PlayerOperateType.Query] = function()
			return
		end,
		[IslandCheaterTavernConst.PlayerOperateType.Shoot] = function()
			local var_18_0 = var_15_1[1]
			local var_18_1 = var_15_1[2]

			warning(tostring(var_15_0) .. "PlayOperateHandle" .. tostring(var_18_0))
			arg_15_0.cheaterTavernAgency:UpdatePlayerBombState(var_15_0, var_18_0, var_18_1)
		end
	}, function()
		return
	end)
	pg.m02:sendNotification(GAME.ISLAND_CHEATER_OPERATE_DONE_NOTIFY, {
		data = arg_15_1,
		putCard = var_15_3
	})
end

return var_0_0
