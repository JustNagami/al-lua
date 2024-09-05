local var_0_0 = class("Dorm3dIK", import("model.vo.BaseVO"))

var_0_0.TRIGGER = {
	TOUCH_BODY = 2
}
var_0_0.ACTION_TRIGGER = {
	RELEASE = 1,
	TOUCH_TARGET = 3,
	RELEASE_ON_TARGET = 2
}
var_0_0.ACTION = {
	ANIM = 1,
	TIMELINE = 2
}

function var_0_0.bindConfigTable(arg_1_0)
	return pg.dorm3d_ik
end

function var_0_0.GetShipGroupId(arg_2_0)
	return arg_2_0:getConfig("char_id")
end

function var_0_0.GetControllerName(arg_3_0)
	return arg_3_0:getConfig("controller")
end

function var_0_0.GetTriggerParams(arg_4_0)
	return arg_4_0:getConfig("trigger_param")
end

function var_0_0.IsTrigger(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = arg_5_0:GetTriggerParams()

	if var_5_0[1] ~= arg_5_1 then
		return false
	end

	return switch(arg_5_1, {
		[var_0_0.TRIGGER.TOUCH_BODY] = function()
			return arg_5_2 == var_5_0[2]
		end
	})
end

function var_0_0.GetTriggerBoneName(arg_7_0)
	local var_7_0 = arg_7_0:GetTriggerParams()

	if var_7_0[1] ~= var_0_0.TRIGGER.TOUCH_BODY then
		return
	end

	return var_7_0[2]
end

function var_0_0.GetActionTriggerParams(arg_8_0)
	return arg_8_0:getConfig("action_trigger")
end

function var_0_0.GetSubTargets(arg_9_0)
	local var_9_0 = arg_9_0:getConfig("sub_targets")

	if type(var_9_0) ~= "table" then
		return {}
	end

	return var_9_0
end

function var_0_0.GetRect(arg_10_0)
	local var_10_0 = arg_10_0:getConfig("rect")

	return (UnityEngine.Rect.New(unpack(var_10_0)))
end

function var_0_0.GetTriggerRect(arg_11_0)
	local var_11_0 = arg_11_0:getConfig("trigger_rect")

	return (UnityEngine.Rect.New(unpack(var_11_0)))
end

return var_0_0
