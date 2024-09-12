local var_0_0 = class("MainActDreamlandBtn", import(".MainBaseActivityBtn"))

function var_0_0.InShowTime(arg_1_0)
	local var_1_0 = var_0_0.super.InShowTime(arg_1_0)
	local var_1_1 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_HOTSPRING_2)

	return var_1_0 and var_1_1 and not var_1_1:isEnd()
end

function var_0_0.GetEventName(arg_2_0)
	return "event_dreamland"
end

function var_0_0.OnInit(arg_3_0)
	local var_3_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_DREAMLAND)
	local var_3_1 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_HOTSPRING_2)
	local var_3_2 = DreamlandData.New(var_3_0, var_3_1):ExistAnyMapOrExploreAward()

	setActive(arg_3_0.tipTr.gameObject, var_3_2)
end

return var_0_0
