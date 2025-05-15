local var_0_0 = class("Dialogue3DStep", import(".IslandBaseStep"))

var_0_0.PLAY_MODE_DIALOGUE = 0
var_0_0.PLAY_MODE_SCENE_TIMELINE = 1
var_0_0.PLAY_MODE_TIMELINE = 2
var_0_0.OPTION_TYPE_TEXT = 0
var_0_0.OPTION_TYPE_PAGE = 1
var_0_0.OPTION_TYPE_TASK = 2
var_0_0.OPTION_TYPE_EXIT = 3

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0, arg_1_1)

	arg_1_0.subName = arg_1_1.subName or arg_1_1.factiontag or ""
	arg_1_0.timeline = arg_1_1.timeline
	arg_1_0.sceneTimeline = arg_1_1.scene_timeline
	arg_1_0.camera = arg_1_1.camera
	arg_1_0.cameraBlend = arg_1_1.camera_blend
	arg_1_0.cameraFade = arg_1_1.camera_fade
	arg_1_0.dialogShake = arg_1_1.dialogShake
	arg_1_0.cameraShake = arg_1_1.camera_shake
	arg_1_0.typewriter = arg_1_1.typewriter
	arg_1_0.branchCode = arg_1_1.optionFlag
	arg_1_0.optionList = {}

	for iter_1_0, iter_1_1 in ipairs(arg_1_1.options or {}) do
		local var_1_0 = arg_1_0:GenOption(iter_1_1)

		table.insert(arg_1_0.optionList, var_1_0)
	end
end

function var_0_0.ShouldCameraShake(arg_2_0)
	return arg_2_0.cameraShake ~= nil
end

function var_0_0.GetCameraShakeSrc(arg_3_0)
	return arg_3_0.cameraShake
end

function var_0_0.ShouldShakeDailogue(arg_4_0)
	return arg_4_0.dialogShake ~= nil
end

function var_0_0.GetShakeDailogueData(arg_5_0)
	return arg_5_0.dialogShake
end

function var_0_0.GenOption(arg_6_0, arg_6_1)
	if arg_6_1.mission then
		return {
			icon = "icon_task",
			content = arg_6_1.content,
			type = var_0_0.OPTION_TYPE_TASK,
			param = arg_6_1.mission
		}
	elseif arg_6_1.page then
		return {
			icon = "icon_shop",
			content = arg_6_1.content,
			type = var_0_0.OPTION_TYPE_PAGE,
			param = arg_6_1.page
		}
	elseif arg_6_1.exit then
		return {
			icon = "icon_exit",
			content = arg_6_1.content,
			type = var_0_0.OPTION_TYPE_EXIT
		}
	else
		return {
			icon = "icon_dialogue",
			content = arg_6_1.content,
			type = var_0_0.OPTION_TYPE_TEXT,
			param = arg_6_1.flag
		}
	end
end

function var_0_0.IsSameBranch(arg_7_0, arg_7_1)
	return not arg_7_0.branchCode or arg_7_0.branchCode == arg_7_1
end

function var_0_0.ExistOption(arg_8_0)
	return #arg_8_0.optionList > 0
end

function var_0_0.GetOptionList(arg_9_0)
	return arg_9_0.optionList
end

function var_0_0.GetTypewriter(arg_10_0)
	return arg_10_0.typewriter
end

function var_0_0.GetName(arg_11_0)
	return arg_11_0:GetActorName()
end

function var_0_0.GetSubName(arg_12_0)
	if not arg_12_0.subName or arg_12_0.subName == "" then
		return ""
	end

	return "/" .. arg_12_0.subName
end

function var_0_0.GetPlayMode(arg_13_0)
	if arg_13_0.sceneTimeline and arg_13_0.sceneTimeline ~= "" then
		return var_0_0.PLAY_MODE_SCENE_TIMELINE
	elseif arg_13_0.timeline and arg_13_0.timeline ~= "" then
		return var_0_0.PLAY_MODE_TIMELINE
	else
		return var_0_0.PLAY_MODE_DIALOGUE
	end
end

function var_0_0.GetTimelinePath(arg_14_0)
	return arg_14_0.timeline
end

function var_0_0.GetActiveCamera(arg_15_0)
	return arg_15_0.camera
end

function var_0_0.ShouldActiveCamera(arg_16_0)
	return arg_16_0.camera and arg_16_0.camera ~= ""
end

function var_0_0.GetSceneTimelineSceneName(arg_17_0)
	local var_17_0 = arg_17_0.sceneTimeline[1]

	if type(var_17_0) == "string" then
		return var_17_0
	elseif type(var_17_0) == "number" then
		return pg.island_map[var_17_0].sceneName
	end
end

function var_0_0.GetSceneTimelinePath(arg_18_0)
	return arg_18_0.sceneTimeline[2]
end

function var_0_0.GetCameraBlendName(arg_19_0)
	return arg_19_0.cameraBlend
end

function var_0_0.SholdBlendCamera(arg_20_0)
	if not arg_20_0.cameraBlend then
		return false
	end

	return true
end

function var_0_0.ShouldFadeCamera(arg_21_0)
	return arg_21_0.cameraFade
end

return var_0_0
