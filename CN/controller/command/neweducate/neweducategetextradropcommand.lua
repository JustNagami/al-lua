local var_0_0 = class("NewEducateGetExtraDropCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.id
	local var_1_2 = var_1_0.scheduleDrops

	pg.ConnectionMgr.GetInstance():Send(29048, {
		id = var_1_1
	}, 29049, function(arg_2_0)
		if arg_2_0.result == 0 then
			local var_2_0 = NewEducateHelper.MergeDrops(arg_2_0.drop)

			NewEducateHelper.UpdateDropsData(var_2_0)
			getProxy(NewEducateProxy):UpdateResources(arg_2_0.res.resource)
			getProxy(NewEducateProxy):UpdateAttrs(arg_2_0.res.attrs)
			arg_1_0:sendNotification(GAME.NEW_EDUCATE_GET_EXTRA_DROP_DONE, {
				drops = NewEducateHelper.FilterBenefit(var_2_0),
				scheduleDrops = var_1_2
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("NewEducate_GetExtraDrop: ", arg_2_0.result))
		end
	end)
end

return var_0_0
