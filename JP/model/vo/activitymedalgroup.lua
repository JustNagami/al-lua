local var_0_0 = class("ActivityMedalGroup", import("model.vo.BaseVO"))

var_0_0.STATE_EXPIRE = -1
var_0_0.STATE_CLOSE = 0
var_0_0.STATE_ACTIVE = 1

function var_0_0.bindConfigTable(arg_1_0)
	return pg.activity_medal_group
end

function var_0_0.GetConfigID(arg_2_0)
	return arg_2_0.configId
end

function var_0_0.Ctor(arg_3_0, arg_3_1)
	arg_3_0.configId = arg_3_1

	local var_3_0 = arg_3_0:getConfig("activity_medal_ids")

	arg_3_0.medalList = {}

	for iter_3_0, iter_3_1 in ipairs(var_3_0) do
		local var_3_1 = {
			id = iter_3_1
		}

		arg_3_0.medalList[iter_3_1] = var_3_1
	end
end

function var_0_0.IsMedalGroupCollectionGrey(arg_4_0)
	player = getProxy(PlayerProxy):getData()

	return not player:getActivityMedalGroup()[arg_4_0]
end

function var_0_0.GetMedalGroupStateByID(arg_5_0)
	local var_5_0 = pg.activity_medal_group[arg_5_0]
	local var_5_1 = var_5_0.is_out_of_print

	if var_5_1 == 1 then
		return var_0_0.STATE_EXPIRE
	elseif var_5_1 == 0 then
		local var_5_2 = false

		for iter_5_0, iter_5_1 in ipairs(var_5_0.activity_link) do
			local var_5_3 = iter_5_1[2]
			local var_5_4 = getProxy(ActivityProxy):getActivityById(var_5_3)

			if var_5_4 and not var_5_4:isEnd() then
				var_5_2 = true

				break
			end
		end

		if var_5_2 then
			return var_0_0.STATE_ACTIVE
		else
			return var_0_0.STATE_CLOSE
		end
	end
end

function var_0_0.GetMedalGroupState(arg_6_0)
	local var_6_0 = arg_6_0:getConfig("is_out_of_print")

	if var_6_0 == 1 then
		return var_0_0.STATE_EXPIRE
	elseif var_6_0 == 0 then
		if arg_6_0:GetMedalGroupActivityConfig() then
			return var_0_0.STATE_ACTIVE
		else
			return var_0_0.STATE_CLOSE
		end
	end
end

function var_0_0.GetMedalGroupActivityConfig(arg_7_0)
	for iter_7_0, iter_7_1 in ipairs(arg_7_0:getConfig("activity_link")) do
		local var_7_0 = iter_7_1[2]
		local var_7_1 = getProxy(ActivityProxy):getActivityById(var_7_0)

		if var_7_1 and not var_7_1:isEnd() then
			return iter_7_1
		end
	end
end

function var_0_0.GetMedalList(arg_8_0)
	return arg_8_0.medalList
end

function var_0_0.UpdateMedal(arg_9_0, arg_9_1, arg_9_2)
	arg_9_0.medalList[arg_9_1].timeStamp = arg_9_2
end

function var_0_0.GetGroupIDByMedalID(arg_10_0)
	for iter_10_0, iter_10_1 in pairs(pg.activity_medal_group.all) do
		if table.contains(iter_10_1.activity_medal_ids, arg_10_0) then
			return iter_10_0.id
		end
	end
end

return var_0_0
