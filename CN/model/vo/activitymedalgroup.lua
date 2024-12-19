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

function var_0_0.GetMedalGroupStateByID(arg_4_0)
	local var_4_0 = pg.activity_medal_group[arg_4_0]
	local var_4_1 = var_4_0.is_out_of_print

	if var_4_1 == 1 then
		return var_0_0.STATE_EXPIRE
	elseif var_4_1 == 0 then
		local var_4_2 = false

		for iter_4_0, iter_4_1 in ipairs(var_4_0.activity_link) do
			local var_4_3 = iter_4_1[2]
			local var_4_4 = getProxy(ActivityProxy):getActivityById(var_4_3)

			if var_4_4 and not var_4_4:isEnd() then
				var_4_2 = true

				break
			end
		end

		if var_4_2 then
			return var_0_0.STATE_ACTIVE
		else
			return var_0_0.STATE_CLOSE
		end
	end
end

function var_0_0.GetMedalGroupState(arg_5_0)
	local var_5_0 = arg_5_0:getConfig("is_out_of_print")

	if var_5_0 == 1 then
		return var_0_0.STATE_EXPIRE
	elseif var_5_0 == 0 then
		if arg_5_0:GetMedalGroupActivityConfig() then
			return var_0_0.STATE_ACTIVE
		else
			return var_0_0.STATE_CLOSE
		end
	end
end

function var_0_0.GetMedalGroupActivityConfig(arg_6_0)
	for iter_6_0, iter_6_1 in ipairs(arg_6_0:getConfig("activity_link")) do
		local var_6_0 = iter_6_1[2]
		local var_6_1 = getProxy(ActivityProxy):getActivityById(var_6_0)

		if var_6_1 and not var_6_1:isEnd() then
			return iter_6_1
		end
	end
end

function var_0_0.GetMedalList(arg_7_0)
	return arg_7_0.medalList
end

function var_0_0.UpdateMedal(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0.medalList[arg_8_1].timeStamp = arg_8_2
end

function var_0_0.GetGroupIDByMedalID(arg_9_0)
	for iter_9_0, iter_9_1 in pairs(pg.activity_medal_group.all) do
		if table.contains(iter_9_1.activity_medal_ids, arg_9_0) then
			return iter_9_0.id
		end
	end
end

return var_0_0
