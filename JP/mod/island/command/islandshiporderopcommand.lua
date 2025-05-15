local var_0_0 = class("IslandShipOrderOpCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.op
	local var_1_2 = var_1_0.slotId
	local var_1_3 = var_1_0.index
	local var_1_4 = getProxy(IslandProxy):GetIsland():GetOrderAgency():GetShipOrderSlot(var_1_2)

	if not var_1_4 then
		return
	end

	if var_1_1 == IslandShipOrder.OP_TYPE_UNLOCK then
		arg_1_0:HandleUnlock(var_1_4)
	elseif var_1_1 == IslandShipOrder.OP_TYPE_GET_AWARD then
		arg_1_0:HandleGetAward(var_1_4)
	elseif var_1_1 == IslandShipOrder.OP_TYPE_LOADUP then
		arg_1_0:HandleLoadUp(var_1_4, var_1_3)
	end
end

function var_0_0.HandleUnlock(arg_2_0, arg_2_1)
	if not arg_2_1:IsLock() then
		return
	end

	if not arg_2_1:CanUnlock() then
		return
	end

	local var_2_0 = arg_2_1:GetUnlockGold()
	local var_2_1 = Drop.New(var_2_0)

	if var_2_1:getOwnedCount() < var_2_1.count then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_resource"))

		return
	end

	pg.ConnectionMgr.GetInstance():Send(21408, {
		type = IslandShipOrder.OP_TYPE_UNLOCK,
		ship_slot_id = arg_2_1.id
	}, 21409, function(arg_3_0)
		if arg_3_0.result == 0 then
			local var_3_0 = IslandDropHelper.AddItems(arg_3_0)

			arg_2_0:sendNotification(GAME.CONSUME_ITEM, var_2_1)
			arg_2_1:Init(arg_3_0.slot, true)
			arg_2_0:sendNotification(GAME.ISLAND_SHIP_ORDER_OP_DONE, {
				op = IslandShipOrder.OP_TYPE_UNLOCK,
				dropData = var_3_0,
				id = arg_2_1.id
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_3_0.result] .. arg_3_0.result)
		end
	end)
end

function var_0_0.HandleGetAward(arg_4_0, arg_4_1)
	if not arg_4_1:IsFinished() then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(21408, {
		type = IslandShipOrder.OP_TYPE_GET_AWARD,
		ship_slot_id = arg_4_1.id
	}, 21409, function(arg_5_0)
		if arg_5_0.result == 0 then
			local var_5_0 = IslandDropHelper.AddItems(arg_5_0)

			arg_4_1:Init(arg_5_0.slot)
			arg_4_0:sendNotification(GAME.ISLAND_SHIP_ORDER_OP_DONE, {
				op = IslandShipOrder.OP_TYPE_GET_AWARD,
				dropData = var_5_0,
				id = arg_4_1.id
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_5_0.result] .. arg_5_0.result)
		end
	end)
end

function var_0_0.HandleLoadUp(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = arg_6_1:GetOrder()
	local var_6_1 = var_6_0:GetComsume(arg_6_2)
	local var_6_2 = Drop.New(var_6_1)
	local var_6_3 = var_6_0:GetConsumeAwards(arg_6_2)

	if var_6_2:getOwnedCount() < var_6_2.count then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_resource"))

		return
	end

	local var_6_4 = var_6_3[2]

	pg.ConnectionMgr.GetInstance():Send(21416, {
		ship_slot_id = arg_6_1.id,
		item_id = var_6_1.id
	}, 21417, function(arg_7_0)
		if arg_7_0.result == 0 then
			local var_7_0 = IslandDropHelper.AddItems(arg_7_0)

			table.insert(var_7_0.awards, Drop.New(var_6_4))
			getProxy(IslandProxy):GetIsland():AddExp(var_6_4.count)
			arg_6_0:sendNotification(GAME.CONSUME_ITEM, var_6_2)
			var_6_0:MarkLoadUp(arg_6_2)

			local var_7_1 = var_6_0:IsLoadUpAll()

			if var_7_1 and arg_7_0.get_time then
				arg_6_1:Submit(arg_7_0.get_time)
			end

			arg_6_0:sendNotification(GAME.ISLAND_SHIP_ORDER_OP_DONE, {
				isLoadUpAll = var_7_1,
				op = IslandShipOrder.OP_TYPE_LOADUP,
				dropData = var_7_0,
				id = arg_6_1.id
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_7_0.result] .. arg_7_0.result)
		end
	end)
end

return var_0_0
