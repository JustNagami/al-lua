local var_0_0 = class("GuideStep")

var_0_0.TYPE_DOFUNC = 0
var_0_0.TYPE_DONOTHING = 1
var_0_0.TYPE_FINDUI = 2
var_0_0.TYPE_HIDEUI = 3
var_0_0.TYPE_SENDNOTIFIES = 4
var_0_0.TYPE_SHOWSIGN = 5
var_0_0.TYPE_STORY = 6
var_0_0.DIALOGUE_BLUE = 1
var_0_0.DIALOGUE_WHITE = 2
var_0_0.DIALOGUE_WORLD = 3
var_0_0.DIALOGUE_DORM = 4
var_0_0.HIGH_TYPE_LINE = 1
var_0_0.HIGH_TYPE_GAMEOBJECT = 2

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.delay = arg_1_1.delay
	arg_1_0.waitScene = arg_1_1.waitScene
	arg_1_0.code = arg_1_1.code
	arg_1_0.alpha = arg_1_1.alpha
	arg_1_0.isWorld = defaultValue(arg_1_1.isWorld, true)
	arg_1_0.styleData = arg_1_0:GenStyleData(arg_1_1.style)
	arg_1_0.highLightData = arg_1_0:GenHighLightData(arg_1_1.style)
	arg_1_0.baseUI = arg_1_0:GenSearchData(arg_1_1.baseui)
	arg_1_0.spriteUI = arg_1_0:GenSpriteSearchData(arg_1_1.spriteui)
	arg_1_0.sceneName = arg_1_1.style and arg_1_1.style.scene
	arg_1_0.otherTriggerTarget = arg_1_1.style and arg_1_1.style.trigger
end

function var_0_0.UpdateIsWorld(arg_2_0, arg_2_1)
	arg_2_0.isWorld = arg_2_1
end

function var_0_0.IsMatchWithCode(arg_3_0, arg_3_1)
	local var_3_0 = arg_3_0:GetMatchCode()

	if not var_3_0 then
		return true
	end

	if type(var_3_0) == "number" then
		return table.contains(arg_3_1, var_3_0)
	elseif type(var_3_0) == "table" then
		return _.any(arg_3_1, function(arg_4_0)
			return table.contains(var_3_0, arg_4_0)
		end)
	end

	return false
end

function var_0_0.GetMatchCode(arg_5_0)
	return arg_5_0.code
end

function var_0_0.GetDelay(arg_6_0)
	return arg_6_0.delay or 0
end

function var_0_0.GetAlpha(arg_7_0)
	return arg_7_0.alpha or 0.4
end

function var_0_0.ShouldWaitScene(arg_8_0)
	return arg_8_0.waitScene and arg_8_0.waitScene ~= ""
end

function var_0_0.GetWaitScene(arg_9_0)
	return arg_9_0.waitScene
end

function var_0_0.ShouldShowDialogue(arg_10_0)
	return arg_10_0.styleData ~= nil
end

function var_0_0.GetDialogueType(arg_11_0)
	return arg_11_0.styleData.mode
end

local function var_0_1(arg_12_0, arg_12_1)
	local var_12_0 = "char"

	if arg_12_1.char and arg_12_1.char == 1 then
		var_12_0 = arg_12_0.isWorld and "char_world" or "char_world1"
	elseif arg_12_1.char and arg_12_1.char == "amazon" then
		var_12_0 = "char_amazon"
	end

	return var_12_0
end

local function var_0_2(arg_13_0, arg_13_1)
	if arg_13_1.charPos then
		return Vector2(arg_13_1.charPos[1], arg_13_1.charPos[2])
	elseif arg_13_1.dir == 1 then
		return arg_13_1.mode == var_0_0.DIALOGUE_BLUE and Vector2(-400, -170) or Vector2(-350, 0)
	else
		return arg_13_1.mode == var_0_0.DIALOGUE_BLUE and Vector2(400, -170) or Vector2(350, 0)
	end
end

local function var_0_3(arg_14_0)
	local var_14_0

	if arg_14_0.charScale then
		var_14_0 = Vector2(arg_14_0.charScale[1], arg_14_0.charScale[2])
	else
		var_14_0 = Vector2(1, 1)
	end

	return arg_14_0.dir == 1 and var_14_0 or Vector3(-var_14_0.x, var_14_0.y, 1)
end

function var_0_0.GenStyleData(arg_15_0, arg_15_1)
	if not arg_15_1 then
		return nil
	end

	local var_15_0

	if arg_15_1.mode == var_0_0.DIALOGUE_DORM then
		var_15_0 = nil
		arg_15_1.dir = 1
	else
		var_15_0 = {
			name = var_0_1(arg_15_0, arg_15_1),
			position = var_0_2(arg_15_0, arg_15_1),
			scale = var_0_3(arg_15_1)
		}
	end

	return {
		mode = arg_15_1.mode,
		text = HXSet.hxLan(arg_15_1.text or ""),
		counsellor = var_15_0,
		scale = arg_15_1.dir == 1 and Vector3(1, 1, 1) or Vector3(-1, 1, 1),
		position = Vector2(arg_15_1.posX or 0, arg_15_1.posY or 0),
		handPosition = arg_15_1.handPos and Vector3(arg_15_1.handPos.x, arg_15_1.handPos.y, 0) or Vector3(-267, -96, 0),
		handAngle = arg_15_1.handPos and Vector3(0, 0, arg_15_1.handPos.w or 0) or Vector3(0, 0, 0)
	}
end

function var_0_0.GetHighlightName(arg_16_0)
	if arg_16_0:GetDialogueType() == var_0_0.DIALOGUE_DORM then
		return "wShowArea4"
	elseif arg_16_0.isWorld then
		return "wShowArea"
	else
		return "wShowArea1"
	end
end

function var_0_0.GetHighlightLength(arg_17_0)
	if arg_17_0:GetDialogueType() == var_0_0.DIALOGUE_DORM then
		return 50
	elseif arg_17_0.isWorld then
		return 15
	else
		return 55
	end
end

function var_0_0.GetStyleData(arg_18_0)
	return arg_18_0.styleData
end

function var_0_0.GenHighLightData(arg_19_0, arg_19_1)
	local function var_19_0(arg_20_0)
		local var_20_0 = arg_19_0:GenSearchData(arg_20_0)

		var_20_0.type = arg_20_0.lineMode or var_0_0.HIGH_TYPE_GAMEOBJECT

		return var_20_0
	end

	local var_19_1 = {}

	if arg_19_1 and arg_19_1.ui then
		table.insert(var_19_1, var_19_0(arg_19_1.ui))
	elseif arg_19_1 and arg_19_1.uiset then
		for iter_19_0, iter_19_1 in ipairs(arg_19_1.uiset) do
			table.insert(var_19_1, var_19_0(iter_19_1))
		end
	elseif arg_19_1 and arg_19_1.uiFunc then
		local var_19_2 = arg_19_1.uiFunc()

		for iter_19_2, iter_19_3 in ipairs(var_19_2) do
			table.insert(var_19_1, var_19_0(iter_19_3))
		end
	end

	return var_19_1
end

function var_0_0.ShouldHighLightTarget(arg_21_0)
	return #arg_21_0.highLightData > 0
end

function var_0_0.GetHighLightTarget(arg_22_0)
	return arg_22_0.highLightData
end

function var_0_0.ExistTrigger(arg_23_0)
	local var_23_0 = arg_23_0:GetType()

	return var_23_0 == var_0_0.TYPE_FINDUI or var_23_0 == var_0_0.TYPE_STORY
end

function var_0_0.ShouldGoScene(arg_24_0)
	return arg_24_0.sceneName and arg_24_0.sceneName ~= ""
end

function var_0_0.GetSceneName(arg_25_0)
	return arg_25_0.sceneName
end

function var_0_0.ShouldTriggerOtherTarget(arg_26_0)
	return arg_26_0.otherTriggerTarget ~= nil
end

function var_0_0.GetOtherTriggerTarget(arg_27_0)
	local var_27_0 = arg_27_0.otherTriggerTarget

	return arg_27_0:GenSearchData(var_27_0)
end

function var_0_0.GenSearchData(arg_28_0, arg_28_1)
	if not arg_28_1 then
		return nil
	end

	local var_28_0 = arg_28_1.path

	if arg_28_1.dynamicPath then
		var_28_0 = arg_28_1.dynamicPath()
	end

	return {
		path = var_28_0,
		delay = arg_28_1.delay,
		pathIndex = arg_28_1.pathIndex,
		conditionData = arg_28_1.conditionData
	}
end

function var_0_0.GenSpriteSearchData(arg_29_0, arg_29_1)
	if not arg_29_1 then
		return nil
	end

	local var_29_0 = arg_29_0:GenSearchData(arg_29_1)

	var_29_0.defaultName = arg_29_1.defaultName
	var_29_0.childPath = arg_29_1.childPath

	return var_29_0
end

function var_0_0.ShouldCheckBaseUI(arg_30_0)
	return arg_30_0.baseUI ~= nil
end

function var_0_0.GetBaseUI(arg_31_0)
	return arg_31_0.baseUI
end

function var_0_0.ShouldCheckSpriteUI(arg_32_0)
	return arg_32_0.spriteUI ~= nil
end

function var_0_0.GetSpriteUI(arg_33_0)
	return arg_33_0.spriteUI
end

function var_0_0.GetType(arg_34_0)
	assert(false, "overwrite me!!!")
end

return var_0_0
