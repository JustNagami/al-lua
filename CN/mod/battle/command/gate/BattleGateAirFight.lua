local var_0_0 = class("BattleGateAirFight")

ys.Battle.BattleGateAirFight = var_0_0
var_0_0.__name = "BattleGateAirFight"

function var_0_0.Entrance(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_0.stageId
	local var_1_1 = pg.expedition_data_template[var_1_0].dungeon_id
	local var_1_2 = ys.Battle.BattleDataFunction.GetDungeonTmpDataByID(var_1_1).fleet_prefab
	local var_1_3 = {
		prefabFleet = var_1_2,
		stageId = var_1_0,
		system = SYSTEM_AIRFIGHT
	}

	arg_1_1:sendNotification(GAME.BEGIN_STAGE_DONE, var_1_3)
end

function var_0_0.Exit(arg_2_0, arg_2_1)
	local var_2_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_AIRFIGHT_BATTLE)

	if arg_2_0.statistics._battleScore >= ys.Battle.BattleConst.BattleScore.B and var_2_0 and not var_2_0:isEnd() then
		local var_2_1 = var_2_0:GetMaxProgress()
		local var_2_2 = var_2_0:GetPerDayCount()
		local var_2_3 = var_2_0:GetPerLevelProgress()
		local var_2_4 = var_2_1 / var_2_3
		local var_2_5 = 0

		for iter_2_0 = 1, var_2_4 do
			var_2_5 = var_2_5 + (var_2_0:getKVPList(1, iter_2_0) or 0)
		end

		local var_2_6 = pg.TimeMgr.GetInstance()
		local var_2_7 = var_2_6:DiffDay(var_2_0.data1, var_2_6:GetServerTime()) + 1

		if var_2_5 < math.min(var_2_7 * var_2_2, var_2_1) then
			local var_2_8 = arg_2_0.stageId
			local var_2_9 = var_2_0:getConfig("config_client").stages
			local var_2_10 = table.indexof(var_2_9, var_2_8)
			local var_2_11 = math.floor((var_2_10 - 1) / math.floor(#var_2_9 / var_2_4)) + 1
			local var_2_12 = var_2_0:getKVPList(1, var_2_11) or 0
			local var_2_13 = var_2_0:getKVPList(2, var_2_11) == 1

			if var_2_12 < var_2_3 and not var_2_13 then
				arg_2_1:sendNotification(GAME.ACTIVITY_OPERATION, {
					cmd = 1,
					activity_id = var_2_0 and var_2_0.id,
					arg1 = var_2_11,
					statistics = arg_2_0.statistics
				})

				return
			end
		end
	end

	arg_2_1:sendNotification(GAME.FINISH_STAGE_DONE, {
		statistics = arg_2_0.statistics,
		score = arg_2_0.statistics._battleScore,
		system = SYSTEM_AIRFIGHT
	})
end

return var_0_0
