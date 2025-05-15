local var_0_0 = class("BatchSellIslandItemCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.list
	local var_1_2 = var_1_0.overflow
	local var_1_3 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()

	if var_1_2 then
		arg_1_0:HandleOverflowBatchSell(var_1_3, var_1_1)
	else
		arg_1_0:HandleCommonBatchSell(var_1_3, var_1_1)
	end
end

function var_0_0.HandleOverflowBatchSell(arg_2_0, arg_2_1, arg_2_2)
	pg.ConnectionMgr.GetInstance():Send(21014, {
		type = 2,
		item_list = arg_2_2
	}, 21015, function(arg_3_0)
		if arg_3_0.result == 0 then
			for iter_3_0, iter_3_1 in ipairs(arg_2_2) do
				arg_2_1:RemoveOverflowItem(iter_3_1.id, iter_3_1.num)
			end

			local var_3_0 = {}

			for iter_3_2, iter_3_3 in ipairs(arg_3_0.item_list) do
				table.insert(var_3_0, {
					type = DROP_TYPE_ISLAND_ITEM,
					id = iter_3_3.id,
					number = iter_3_3.num
				})
			end

			local var_3_1 = IslandDropHelper.AddItems({
				drop_list = var_3_0
			})

			arg_2_0:sendNotification(GAME.ISLAND_SELL_ITEM_DONE, {
				dropData = var_3_1
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_3_0.result] .. arg_3_0.ret)
		end
	end)
end

function var_0_0.HandleCommonBatchSell(arg_4_0, arg_4_1, arg_4_2)
	for iter_4_0, iter_4_1 in ipairs(arg_4_2) do
		if arg_4_1:GetOwnCount(iter_4_1.id) < iter_4_1.num then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_resource"))

			return
		end
	end

	pg.ConnectionMgr.GetInstance():Send(21014, {
		type = 1,
		item_list = arg_4_2
	}, 21015, function(arg_5_0)
		if arg_5_0.result == 0 then
			for iter_5_0, iter_5_1 in ipairs(arg_4_2) do
				arg_4_1:RemoveItem(iter_5_1.id, iter_5_1.num)
			end

			local var_5_0 = {}

			for iter_5_2, iter_5_3 in ipairs(arg_5_0.item_list) do
				local var_5_1 = {
					type = DROP_TYPE_ISLAND_ITEM,
					id = iter_5_3.id,
					count = iter_5_3.num
				}

				table.insert(var_5_0, var_5_1)
			end

			local var_5_2 = IslandDropHelper.AddItems({
				drop_list = var_5_0
			})

			arg_4_0:sendNotification(GAME.ISLAND_SELL_ITEM_DONE, {
				dropData = var_5_2
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_5_0.result] .. arg_5_0.ret)
		end
	end)
end

return var_0_0
