local var_0_0 = class("IslandShopOpCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = getProxy(IslandProxy):GetIsland():GetShopAgency()
	local var_1_2 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()

	if var_1_0.operation == IslandConst.SHOP_GET_DATA then
		pg.ConnectionMgr.GetInstance():Send(21016, {
			shop_id = var_1_0.shopId
		}, 21017, function(arg_2_0)
			if arg_2_0.result == 0 then
				var_1_1:UpdateShop(var_1_0.shopId, arg_2_0.shop_info)
				arg_1_0:sendNotification(GAME.ISLAND_SHOP_OP_DONE, {
					operation = var_1_0.operation,
					refreshAll = var_1_0.refreshAll
				})

				if var_1_0.callback then
					var_1_0.callback()
				end
			else
				var_1_1:UpdateShop(var_1_0.shopId, nil)
			end
		end)
	elseif var_1_0.operation == IslandConst.SHOP_BUY_COMMODITY then
		local var_1_3 = var_1_1:GetShopCommodity(var_1_0.shopId, var_1_0.commodityId)
		local var_1_4 = getProxy(PlayerProxy):getData()

		if not var_1_3 then
			return
		end

		if var_1_0.count == 0 then
			return
		end

		local var_1_5 = var_1_3:GetResourceConsume()
		local var_1_6 = var_1_5[3] * var_1_0.count
		local var_1_7 = math.ceil((100 - var_1_3:GetDiscount()) / 100 * var_1_6)

		if var_1_5[1] == DROP_TYPE_RESOURCE then
			if var_1_7 > var_1_4[id2res(var_1_5[2])] then
				local var_1_8 = Drop.New({
					type = DROP_TYPE_RESOURCE,
					id = var_1_5[2]
				}):getName()

				if var_1_5[2] == 1 then
					GoShoppingMsgBox(i18n("switch_to_shop_tip_2", i18n("word_gold")), ChargeScene.TYPE_ITEM, {
						{
							59001,
							var_1_7 - var_1_4[id2res(var_1_5[2])],
							var_1_7
						}
					})
				elseif var_1_5[2] == 4 or var_1_5[2] == 14 then
					GoShoppingMsgBox(i18n("switch_to_shop_tip_3", i18n("word_gem")), ChargeScene.TYPE_DIAMOND)
				elseif not ItemTipPanel.ShowItemTip(DROP_TYPE_RESOURCE, var_1_5[2]) then
					pg.TipsMgr.GetInstance():ShowTips(i18n("buyProp_noResource_error", var_1_8))
				end

				return
			end
		elseif var_1_5[1] == DROP_TYPE_ISLAND_ITEM and var_1_7 > var_1_2:GetOwnCount(var_1_5[2]) then
			pg.TipsMgr.GetInstance():ShowTips("岛屿内道具不足")

			local var_1_9 = pg.island_item_data_template[var_1_5[2]].jump_page

			return
		end

		local var_1_10 = {}
		local var_1_11 = var_1_3:GetItems()

		for iter_1_0, iter_1_1 in ipairs(var_1_11) do
			if iter_1_1[1] ~= DROP_TYPE_ISLAND_ITEM then
				local var_1_12 = Drop.New({
					type = iter_1_1[1],
					id = iter_1_1[2],
					count = iter_1_1[3]
				})

				table.insert(var_1_10, var_1_12)
			end
		end

		local var_1_13 = GetItemsOverflowDic(var_1_10)
		local var_1_14, var_1_15 = CheckOverflow(var_1_13)

		if not var_1_14 then
			switch(var_1_15, {
				gold = function()
					pg.TipsMgr.GetInstance():ShowTips(i18n("gold_max_tip_title") .. i18n("resource_max_tip_shop"))
				end,
				oil = function()
					pg.TipsMgr.GetInstance():ShowTips(i18n("oil_max_tip_title") .. i18n("resource_max_tip_shop"))
				end,
				equip = function()
					NoPosMsgBox(i18n("switch_to_shop_tip_noPos"), openDestroyEquip, gotoChargeScene)
				end,
				ship = function()
					NoPosMsgBox(i18n("switch_to_shop_tip_noDockyard"), openDockyardClear, gotoChargeScene, openDockyardIntensify)
				end
			})

			return
		end

		if not CheckShipExpOverflow(var_1_13) then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("player_expResource_mail_fullBag"),
				onYes = next
			})

			return
		end

		if var_1_2:ExistAnyOverFlowItem() then
			pg.TipsMgr.GetInstance():ShowTips("岛屿内背包已满")

			return
		end

		if var_1_3:GetPayId() == 0 then
			pg.ConnectionMgr.GetInstance():Send(21018, {
				shop_id = var_1_0.shopId,
				goods_id = var_1_0.commodityId,
				num = var_1_0.count
			}, 21019, function(arg_7_0)
				if arg_7_0.result == 0 then
					arg_1_0:sendNotification(GAME.CONSUME_ITEM, Drop.New({
						type = var_1_5[1],
						id = var_1_5[2],
						count = var_1_7
					}))
					IslandDropHelper.AddItems(arg_7_0.drop_list)
					var_1_1:UpdateShopCommodity(var_1_0.shopId, var_1_0.commodityId, var_1_0.count)
					arg_1_0:sendNotification(GAME.ISLAND_SHOP_OP_DONE, {
						operation = var_1_0.operation
					})

					if var_1_0.callback then
						var_1_0.callback()
					end
				else
					pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_7_0.result] .. arg_7_0.result)
				end
			end)
		end
	elseif var_1_0.operation == IslandConst.SHOP_REFRESH_BY_PLAYER then
		local var_1_16 = var_1_0.refreshResource
		local var_1_17 = getProxy(PlayerProxy):getData()
		local var_1_18 = var_1_16[3]

		if var_1_18 ~= 0 then
			if var_1_16[1] == DROP_TYPE_RESOURCE then
				if var_1_18 > var_1_17[id2res(var_1_16[2])] then
					local var_1_19 = Drop.New({
						type = DROP_TYPE_RESOURCE,
						id = var_1_16[2]
					}):getName()

					if var_1_16[2] == 1 then
						GoShoppingMsgBox(i18n("switch_to_shop_tip_2", i18n("word_gold")), ChargeScene.TYPE_ITEM, {
							{
								59001,
								var_1_18 - var_1_17[id2res(var_1_16[2])],
								var_1_18
							}
						})
					elseif var_1_16[2] == 4 or var_1_16[2] == 14 then
						GoShoppingMsgBox(i18n("switch_to_shop_tip_3", i18n("word_gem")), ChargeScene.TYPE_DIAMOND)
					elseif not ItemTipPanel.ShowItemTip(DROP_TYPE_RESOURCE, var_1_16[2]) then
						pg.TipsMgr.GetInstance():ShowTips(i18n("buyProp_noResource_error", var_1_19))
					end

					return
				end
			elseif var_1_16[1] == DROP_TYPE_ISLAND_ITEM and var_1_18 > var_1_2:GetOwnCount(var_1_16[2]) then
				local var_1_20 = pg.island_item_data_template[var_1_16[2]].name

				pg.TipsMgr.GetInstance():ShowTips(i18n("buyProp_noResource_error", var_1_20))

				return
			end
		end

		pg.ConnectionMgr.GetInstance():Send(21020, {
			shop_id = var_1_0.shopId
		}, 21021, function(arg_8_0)
			if arg_8_0.result == 0 then
				if var_1_18 ~= 0 then
					arg_1_0:sendNotification(GAME.CONSUME_ITEM, Drop.New({
						type = var_1_16[1],
						id = var_1_16[2],
						count = var_1_18
					}))
				end

				var_1_1:UpdateShop(var_1_0.shopId, arg_8_0.shop_info)
				arg_1_0:sendNotification(GAME.ISLAND_SHOP_OP_DONE, {
					operation = var_1_0.operation
				})

				if var_1_0.callback then
					var_1_0.callback()
				end
			else
				pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_8_0.result] .. arg_8_0.result)
			end
		end)
	end
end

return var_0_0
