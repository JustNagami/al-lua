local var_0_0 = class("IslandStoryRecorder", import("Mgr.Story.model.Record.StoryRecorder"))
local var_0_1 = "#5ce6ff"
local var_0_2 = "#39BFFF"
local var_0_3 = "#70747F"
local var_0_4 = "#BCBCBC"
local var_0_5 = "#FFFFFF"

function var_0_0.Convert(arg_1_0)
	local var_1_0 = {}

	for iter_1_0, iter_1_1 in ipairs(arg_1_0.recordList) do
		arg_1_0:Collect3DDialogueContent(var_1_0, iter_1_1)
	end

	arg_1_0.recordList = {}

	return var_1_0
end

function var_0_0.Collect3DDialogueContent(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0 = arg_2_2:GetSay()
	local var_2_1 = arg_2_2:IsPlayer()
	local var_2_2 = arg_2_2:GetActorName()
	local var_2_3 = arg_2_2:GetActorIcon()
	local var_2_4 = var_2_1 and var_0_2 or var_0_4

	table.insert(arg_2_1, {
		icon = var_2_3,
		name = var_2_2,
		nameColor = var_2_4,
		list = {
			setColorStr(arg_2_0:FormatContent(var_2_0), var_2_1 and var_0_2 or var_0_5)
		},
		isPlayer = var_2_1
	})
end

return var_0_0
