local var_0_0 = class("MainActLayerBtn", import(".MainBaseActivityBtn"))

function var_0_0.GetEventName(arg_1_0)
	return "event_layer"
end

function var_0_0.OnInit(arg_2_0)
	local var_2_0 = arg_2_0:GetActivityID()
	local var_2_1 = getProxy(ActivityProxy):getActivityById(var_2_0)
	local var_2_2 = Activity.IsActivityReady(var_2_1)

	setActive(arg_2_0.tipTr.gameObject, var_2_2)
end

function var_0_0.GetActivityID(arg_3_0)
	local var_3_0 = checkExist(arg_3_0.config, {
		"time"
	})

	if not var_3_0 then
		return nil
	end

	return var_3_0[1] == "default" and var_3_0[2] or nil
end

return var_0_0
