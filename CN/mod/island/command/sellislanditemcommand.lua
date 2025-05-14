local var_0_0 = class("SellIslandItemCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.id
	local var_1_2 = var_1_0.count
	local var_1_3 = {
		id = var_1_1,
		num = var_1_2
	}
	local var_1_4 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()

	if var_1_2 > var_1_4:GetOwnCount(var_1_1) then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_resource"))

		return
	end

	pg.ConnectionMgr.GetInstance():Send(21014, {
		type = 1,
		item_list = {
			var_1_3
		}
	}, 21015, function(arg_2_0)
		if arg_2_0.result == 0 then
			var_1_4:RemoveItem(var_1_1, var_1_2)

			local var_2_0 = {}

			for iter_2_0, iter_2_1 in ipairs(arg_2_0.item_list) do
				local var_2_1 = {
					type = DROP_TYPE_ISLAND_ITEM,
					id = iter_2_1.id,
					count = iter_2_1.num
				}

				table.insert(var_2_0, var_2_1)
			end

			local var_2_2 = IslandDropHelper.AddItems({
				drop_list = var_2_0
			})

			arg_1_0:sendNotification(GAME.ISLAND_SELL_ITEM_DONE, {
				dropData = var_2_2
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

return var_0_0
