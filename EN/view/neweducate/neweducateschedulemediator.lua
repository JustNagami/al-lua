local var_0_0 = class("NewEducateScheduleMediator", import("view.newEducate.base.NewEducateContextMediator"))

var_0_0.ON_SELECTED_PLANS = "NewEducateScheduleMediator.ON_SELECTED_PLANS"
var_0_0.ON_UPGRADE_PLANS = "NewEducateScheduleMediator.ON_UPGRADE_PLANS"

function var_0_0.register(arg_1_0)
	arg_1_0:bind(var_0_0.ON_SELECTED_PLANS, function(arg_2_0, arg_2_1, arg_2_2)
		local var_2_0 = {}

		for iter_2_0, iter_2_1 in ipairs(arg_2_2) do
			if iter_2_1.plan then
				table.insert(var_2_0, {
					key = iter_2_0,
					value = iter_2_1.plan.id
				})
			end
		end

		arg_1_0:sendNotification(GAME.NEW_EDUCATE_SCHEDULE, {
			id = arg_1_0.contextData.char.id,
			planKVs = var_2_0,
			isSkip = arg_2_1
		})
	end)
	arg_1_0:bind(var_0_0.ON_UPGRADE_PLANS, function(arg_3_0, arg_3_1)
		arg_1_0:sendNotification(GAME.NEW_EDUCATE_UPGRADE_PLAN, {
			id = arg_1_0.contextData.char.id,
			planIds = arg_3_1
		})
	end)
end

function var_0_0.listNotificationInterests(arg_4_0)
	return {
		GAME.NEW_EDUCATE_UPGRADE_PLAN_DONE,
		GAME.NEW_EDUCATE_SCHEDULE_DONE
	}
end

function var_0_0.handleNotification(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_1:getName()
	local var_5_1 = arg_5_1:getBody()

	if var_5_0 == GAME.NEW_EDUCATE_UPGRADE_PLAN_DONE then
		arg_5_0.viewComponent:OnUpgradePlans()
	elseif var_5_0 == GAME.NEW_EDUCATE_SCHEDULE_DONE then
		arg_5_0.viewComponent:SetScheduleData(var_5_1)
		arg_5_0.viewComponent:closeView()
	end
end

return var_0_0
