local var_0_0 = class("CollectionBookMediator", import("..base.ContextMediator"))

var_0_0.ACT_ID = ActivityConst.HOLIDAY_ACT_ID

function var_0_0.register(arg_1_0)
	return
end

function var_0_0.listNotificationInterests(arg_2_0)
	return {
		GAME.SUBMIT_TASK_AWARD_DOWN
	}
end

function var_0_0.handleNotification(arg_3_0, arg_3_1)
	local var_3_0 = arg_3_1:getName()
	local var_3_1 = arg_3_1:getBody()

	if var_3_0 == GAME.SUBMIT_TASK_AWARD_DOWN then
		arg_3_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_3_1.awards, function()
			arg_3_0.viewComponent:updateAwardPanel()
			arg_3_0.viewComponent:updateTag()
		end)
	end
end

function var_0_0.GetCollectionBookTip()
	local var_5_0 = CollectionBookMediator.ACT_ID
	local var_5_1 = getProxy(ActivityProxy):getActivityById(var_5_0):getConfig("config_client").collect_task

	for iter_5_0 = 1, #var_5_1 do
		local var_5_2 = getProxy(TaskProxy):getTaskById(var_5_1[iter_5_0])

		if var_5_2 and var_5_2:getTaskStatus() == 1 then
			return true
		end
	end

	return false
end

return var_0_0
