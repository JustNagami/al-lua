local var_0_0 = class("BossRushConst")

function var_0_0.GetPassedLayer(arg_1_0)
	return switch(arg_1_0, {
		[ActivityConst.ALVIT_BOSS_RUSH_ID] = function()
			return BossRushAlvitPassedLayer
		end
	}, function()
		return BossRushPassedLayer
	end)
end

function var_0_0.GetEXBattleResultLayer(arg_4_0)
	return switch(arg_4_0, {
		[ActivityConst.ALVIT_BOSS_RUSH_ID] = function()
			return BossRushAlvitEXBattleResultLayer
		end
	}, function()
		return BossRushEXBattleResultLayer
	end)
end

return var_0_0
