local var_0_0 = class("ActivitySpStoryNode", import("model.vo.BaseVO"))

function var_0_0.bindConfigTable(arg_1_0)
	return pg.activity_sp_story
end

var_0_0.NODE_TYPE = {
	STORY = 1,
	BATTLE = 2
}

function var_0_0.GetType(arg_2_0)
	return arg_2_0:getConfig("story_type")
end

function var_0_0.GetStoryName(arg_3_0)
	return arg_3_0:getConfig("story")
end

function var_0_0.GetDisplayName(arg_4_0)
	return arg_4_0:getConfig("name")
end

function var_0_0.GetPreEvent(arg_5_0)
	return arg_5_0:getConfig("pre_event")
end

var_0_0.CONDITION = {
	TIME = 1,
	PT = 3,
	PASSCHAPTER = 2
}

function var_0_0.GetUnlockConditions(arg_6_0)
	local var_6_0 = arg_6_0:getConfig("lock")

	if type(var_6_0) ~= "table" then
		return
	end

	return var_6_0
end

function var_0_0.GetUnlockDesc(arg_7_0)
	return arg_7_0:getConfig("unlock_conditions")
end

function var_0_0.GetCleanBG(arg_8_0)
	return arg_8_0:getConfig("change_background")
end

function var_0_0.GetCleanBGM(arg_9_0)
	return arg_9_0:getConfig("change_bgm")
end

return var_0_0
