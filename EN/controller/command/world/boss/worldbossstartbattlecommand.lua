local var_0_0 = class("WorldBossStartBattleCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.bossId
	local var_1_2 = var_1_0.isOther
	local var_1_3 = var_1_0.hpRate
	local var_1_4 = nowWorld():GetBossProxy()
	local var_1_5 = var_1_4:GetBossById(var_1_1)

	if not var_1_5 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("world_joint_boss_not_found"))

		return
	end

	if var_1_2 and var_1_4:GetPt() <= 0 and WorldBossConst._IsCurrBoss(var_1_5) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("world_joint_count_no_enough"))

		return
	end

	local function var_1_6()
		local var_2_0 = var_1_5:GetStageID()
		local var_2_1 = getProxy(ContextProxy):getCurrentContext()

		pg.m02:retrieveMediator(var_2_1.mediator.__cname):addSubLayers(Context.New({
			mediator = WorldBossFormationMediator,
			viewComponent = WorldBossFormationLayer,
			data = {
				actID = 0,
				stageId = var_2_0,
				bossId = var_1_1,
				system = SYSTEM_WORLD_BOSS,
				isOther = var_1_2,
				hpRate = var_1_3
			}
		}))
	end

	local function var_1_7()
		var_1_4:RemoveCacheBoss(var_1_5.id)
	end

	arg_1_0:sendNotification(GAME.CHECK_WORLD_BOSS_STATE, {
		bossId = var_1_1,
		time = var_1_5.lastTime,
		callback = var_1_6,
		failedCallback = var_1_7
	})
end

return var_0_0
