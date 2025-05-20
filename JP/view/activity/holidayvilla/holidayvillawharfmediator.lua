local var_0_0 = class("HolidayVillaWharfMediator", import("view.base.ContextMediator"))

var_0_0.ON_TASK_SUBMIT_ONESTEP = "HolidayVillaWharfMediator.ON_TASK_SUBMIT_ONESTEP"

function var_0_0.register(arg_1_0)
	arg_1_0:bind(var_0_0.ON_TASK_SUBMIT_ONESTEP, function(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
		arg_1_0:sendNotification(GAME.SUBMIT_ACTIVITY_TASK, {
			act_id = arg_2_1,
			task_ids = arg_2_2,
			callback = arg_2_3
		})
	end)
end

function var_0_0.listNotificationInterests(arg_3_0)
	return {
		GAME.SUBMIT_ACTIVITY_TASK_DONE
	}
end

function var_0_0.handleNotification(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_1:getName()
	local var_4_1 = arg_4_1:getBody()

	if var_4_0 == GAME.SUBMIT_ACTIVITY_TASK_DONE then
		arg_4_0.viewComponent:SetAwardsShow(var_4_1.awards)
		arg_4_0.viewComponent:RefreshData()
		arg_4_0.viewComponent:Show()
		arg_4_0.viewComponent:ShowCompletePage()
	end
end

return var_0_0
