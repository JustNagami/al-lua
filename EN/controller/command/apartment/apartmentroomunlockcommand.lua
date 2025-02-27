local var_0_0 = class("ApartmentRoomUnlockCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody().roomId
	local var_1_1 = pg.dorm3d_rooms[var_1_0]
	local var_1_2 = underscore.map(var_1_1.unlock_item, function(arg_2_0)
		return Drop.Create(arg_2_0)
	end)

	if #var_1_2 > 0 and underscore.any(var_1_2, function(arg_3_0)
		return arg_3_0:getOwnedCount() < arg_3_0.count
	end) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("temple_consume_not_enough"))

		return
	end

	local var_1_3 = getProxy(ApartmentProxy)

	if var_1_3:getRoom(var_1_0) then
		pg.TipsMgr.GetInstance():ShowTips("this room already unlock")

		return
	end

	pg.ConnectionMgr.GetInstance():Send(28001, {
		room_id = var_1_0
	}, 28002, function(arg_4_0)
		if arg_4_0.result == 0 then
			for iter_4_0, iter_4_1 in ipairs(var_1_2) do
				reducePlayerOwn(iter_4_1)
			end

			local var_4_0 = ApartmentRoom.New(arg_4_0.room)

			var_1_3:updateRoom(var_4_0)

			if var_4_0:isPersonalRoom() then
				var_1_3:updateApartment(Apartment.New({
					cur_skin = 0,
					daily_favor = 0,
					favor_lv = 1,
					favor_exp = 0,
					ship_group = var_4_0:getPersonalGroupId()
				}))
			end

			;(function()
				local var_5_0 = var_1_1.type == 1
				local var_5_1 = var_5_0 and 4 or 2
				local var_5_2 = ""

				if not var_5_0 then
					var_5_2 = table.concat(var_1_1.character, ",")
				end

				pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataRoom(var_1_0, var_5_1, var_5_2))
			end)()
			getProxy(Dorm3dInsProxy):HandleInsData(arg_4_0.ins)
			arg_1_0:sendNotification(GAME.APARTMENT_ROOM_UNLOCK_DONE, {
				roomId = var_1_0
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_4_0.result] .. arg_4_0.result)
		end
	end)
end

return var_0_0
