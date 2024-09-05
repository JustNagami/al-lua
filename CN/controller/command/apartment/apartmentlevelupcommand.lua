local var_0_0 = class("ApartmentLevelUpCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.groupId
	local var_1_2 = var_1_0.triggerId

	warning("levelupcmd")

	local var_1_3 = getProxy(ApartmentProxy)
	local var_1_4 = var_1_3:getApartment(var_1_1)

	if var_1_4.level >= getDorm3dGameset("favor_level")[1] or var_1_4.favor < var_1_4:getNextExp() then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(28005, {
		ship_group = var_1_1
	}, 28006, function(arg_2_0)
		if arg_2_0.result == 0 then
			warning("levelup")

			var_1_4 = var_1_3:getApartment(var_1_1)

			var_1_4:addLevel()
			var_1_3:updateApartment(var_1_4)
			warning(var_1_4.favor, var_1_4.level, var_1_4:getNextExp())

			local var_2_0 = PlayerConst.addTranDrop(arg_2_0.drop_list)

			arg_1_0:sendNotification(GAME.APARTMENT_LEVEL_UP_DONE, {
				apartment = var_1_4,
				award = var_2_0
			})

			local var_2_1 = var_1_4:getLevel()

			_.each(pg.dorm3d_collection_template.all, function(arg_3_0)
				local var_3_0 = pg.dorm3d_collection_template[arg_3_0].unlock

				if var_3_0[1] ~= 1 then
					return
				end

				if var_3_0[2] ~= var_2_1 then
					return
				end

				pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataCollectionItem(arg_3_0, 1))
			end)
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

return var_0_0
