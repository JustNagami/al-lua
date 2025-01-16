local var_0_0 = class("SetShipSkinCommand", pm.SimpleCommand)

var_0_0.SKIN_UPDATED = "skin updated"

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.shipId
	local var_1_2 = var_1_0.skinId
	local var_1_3 = var_1_0.hideTip
	local var_1_4 = ShipGroup.GetChangeSkinMainId(var_1_2)

	pg.ConnectionMgr.GetInstance():Send(12202, {
		ship_id = var_1_1,
		skin_id = var_1_4
	}, 12203, function(arg_2_0)
		if arg_2_0.result == 0 then
			local var_2_0 = getProxy(BayProxy)
			local var_2_1 = var_2_0:getShipById(var_1_1)
			local var_2_2 = var_1_4 or 0

			if var_2_2 == 0 then
				var_2_2 = var_2_1:getConfig("skin_id")
			end

			if not var_2_2 or var_2_2 == 0 then
				var_2_2 = var_2_1:getConfig("skin_id")
			end

			var_2_1:updateSkinId(var_2_2)
			var_2_0:updateShip(var_2_1)

			local var_2_3 = getProxy(PlayerProxy)
			local var_2_4 = var_2_3:getData()

			if var_2_4.character == var_1_1 then
				var_2_4.skinId = var_2_1:getSkinId()

				var_2_3:updatePlayer(var_2_4)
			end

			arg_1_0:sendNotification(var_0_0.SKIN_UPDATED, {
				ship = var_2_1
			})

			if not var_1_3 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("ship_set_skin_success"))
			end
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("ship_set_skin_error", arg_2_0.result))
		end
	end)
end

return var_0_0
