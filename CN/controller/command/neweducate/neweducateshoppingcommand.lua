local var_0_0 = class("NewEducateShoppingCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.id
	local var_1_2 = var_1_0.goodId
	local var_1_3 = var_1_0.num

	pg.ConnectionMgr.GetInstance():Send(29066, {
		id = var_1_1,
		shop = var_1_2,
		num = var_1_3
	}, 29067, function(arg_2_0)
		if arg_2_0.result == 0 then
			local var_2_0 = getProxy(NewEducateProxy)
			local var_2_1 = NewEducateGoods.New(var_1_2)
			local var_2_2 = var_2_0:GetCurChar()
			local var_2_3 = var_2_2:GetGoodsDiscountInfos()
			local var_2_4 = var_2_1:GetCostWithBenefit(var_2_3)

			var_2_4.number = var_2_4.number * var_1_3

			var_2_0:Cost(var_2_4)
			var_2_2:GetFSM():GetState(NewEducateFSM.STYSTEM.MAP):AddBuyCnt(var_1_2, var_1_3)

			local var_2_5 = NewEducateHelper.MergeDrops(arg_2_0.drop)

			NewEducateHelper.UpdateDropsData(var_2_5)
			arg_1_0:sendNotification(GAME.NEW_EDUCATE_SHOPPING_DONE, {
				drops = NewEducateHelper.FilterBenefit(var_2_5)
			})
			pg.m02:sendNotification(GAME.NEW_EDUCATE_TRACK, NewEducateTrackCommand.BuildDataSite(var_2_2.id, var_2_2:GetGameCnt(), var_2_2:GetRoundData().round, 4, var_1_2))
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("NewEducate_Shopping: ", arg_2_0.result))
		end
	end)
end

return var_0_0
