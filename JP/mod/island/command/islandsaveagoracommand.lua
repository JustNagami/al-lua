local var_0_0 = class("IslandSaveAgoraCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody().list
	local var_1_1, var_1_2, var_1_3 = arg_1_0:GetChangeList(var_1_0)
	local var_1_4 = arg_1_0:Serialize(var_1_1)
	local var_1_5 = arg_1_0:Serialize(var_1_2)
	local var_1_6 = arg_1_0:Serialize(var_1_3)

	if #var_1_4 == 0 and #var_1_5 == 0 and #var_1_6 == 0 then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(21307, {
		update_list = var_1_4,
		delete_list = var_1_5,
		add_list = var_1_6
	}, 21308, function(arg_2_0)
		if arg_2_0.result == 0 then
			getProxy(IslandProxy):GetIsland():GetAgoraAgency():UpdatePlacedList(var_1_0)
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

function var_0_0.Serialize(arg_3_0, arg_3_1)
	return _.map(arg_3_1, function(arg_4_0)
		return {
			id = arg_4_0.id,
			x = arg_4_0.position.x,
			y = arg_4_0.position.y,
			dir = arg_4_0.dir
		}
	end)
end

function var_0_0.GetChangeList(arg_5_0, arg_5_1)
	local var_5_0 = getProxy(IslandProxy):GetIsland():GetAgoraAgency():GetPlacedList()
	local var_5_1 = _.select(arg_5_1, function(arg_6_0)
		return not arg_5_0:HasItem(arg_6_0, var_5_0)
	end)
	local var_5_2 = _.select(var_5_0, function(arg_7_0)
		return not arg_5_0:HasItem(arg_7_0, arg_5_1)
	end)

	return _.select(arg_5_1, function(arg_8_0)
		return not arg_5_0:HasItem(arg_8_0, var_5_1) and not arg_5_0:HasItem(arg_8_0, var_5_2) and arg_5_0:HasChange(arg_8_0, var_5_0)
	end), var_5_2, var_5_1
end

function var_0_0.HasItem(arg_9_0, arg_9_1, arg_9_2)
	for iter_9_0, iter_9_1 in ipairs(arg_9_2) do
		if iter_9_1.id == arg_9_1.id then
			return true
		end
	end

	return false
end

function var_0_0.HasChange(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0

	for iter_10_0, iter_10_1 in ipairs(arg_10_2) do
		if iter_10_1.id == arg_10_1.id then
			var_10_0 = iter_10_1

			break
		end
	end

	return not arg_10_1:IsSame(var_10_0)
end

return var_0_0
