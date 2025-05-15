local var_0_0 = class("IslandUpgradeShipSkillCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody().id
	local var_1_1 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipById(var_1_0)

	if not var_1_1 then
		return
	end

	local var_1_2 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()
	local var_1_3 = var_1_1:GetUpgradeSkillConsume()

	if _.any(var_1_3, function(arg_2_0)
		local var_2_0 = Drop.New({
			type = arg_2_0[1],
			id = arg_2_0[2],
			count = arg_2_0[3]
		})

		return var_2_0:getOwnedCount() < var_2_0.count
	end) then
		pg.TipsMgr.GetInstance():ShowTips(i18n1("资源不足"))

		return
	end

	if not var_1_1:CanUpgradeMainSkill() then
		return
	end

	local var_1_4 = var_1_1:GetMainSkill()

	pg.ConnectionMgr.GetInstance():Send(21028, {
		shipid = var_1_0,
		skilltid = var_1_4
	}, 21029, function(arg_3_0)
		if arg_3_0.ret == 0 then
			for iter_3_0, iter_3_1 in pairs(var_1_3) do
				local var_3_0 = Drop.New({
					type = iter_3_1[1],
					id = iter_3_1[2],
					count = iter_3_1[3]
				})

				arg_1_0:sendNotification(GAME.CONSUME_ITEM, var_3_0)
			end

			var_1_1:UpgradeMainSkill()
			arg_1_0:sendNotification(GAME.ISLAND_UPGRADE_SKILL_DONE)
			pg.TipsMgr.GetInstance():ShowTips(i18n1("升级成功"))
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_3_0.ret] .. arg_3_0.ret)
		end
	end)
end

return var_0_0
