local var_0_0 = class("IslandInteractionUntil")

var_0_0.TYPE_STORY = 1
var_0_0.TYPE_BUBBLE = 2
var_0_0.TYPE_ACTION = 3
var_0_0.TYPE_AGORA = 4
var_0_0.TYPE_AGORA_CANCEL = 5
var_0_0.TYPE_OPEN_PAGE = 6
var_0_0.TYPE_TRANSFER = 7
var_0_0.TYPE_BT_VALUE = 8

function var_0_0.GetInteractionOptions(arg_1_0)
	local var_1_0 = pg.island_interaction.get_id_list_by_groupId[arg_1_0] or {}

	return _.map(var_1_0, function(arg_2_0)
		return pg.island_interaction[arg_2_0]
	end)
end

local function var_0_1(arg_3_0)
	require("nodecanvas.Task.NcPlayStory").New(nil, {}):DoAction(arg_3_0)
end

local function var_0_2(arg_4_0)
	require("nodecanvas.Task.NcPlayChatBubble").New(nil, {}):DoAction(arg_4_0)
end

local function var_0_3(arg_5_0)
	assert(false, "未处理类型:" .. var_0_0.TYPE_ACTION)
end

local function var_0_4(arg_6_0, arg_6_1)
	local var_6_0 = arg_6_1.view.player.id

	arg_6_1:Op("InterAction", arg_6_0, var_6_0)
end

local function var_0_5(arg_7_0, arg_7_1)
	local var_7_0 = arg_7_1.view.player.id

	arg_7_1:Op("InterActionEnd", arg_7_0, var_7_0)
end

local function var_0_6(arg_8_0, arg_8_1, arg_8_2)
	arg_8_1:Op("NotifiyIsland", ISLAND_EX_EVT.OPEN_PAGE, _G[arg_8_0], arg_8_2)
end

local function var_0_7(arg_9_0, arg_9_1)
	arg_9_1:Op("NotifiyIsland", ISLAND_EX_EVT.SWITCH_MAP, tonumber(arg_9_0))
end

local function var_0_8(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = arg_10_2:GetView():GetUnitModule(arg_10_1)

	if var_10_0.behaviourTreeOwner then
		if tonumber(arg_10_0[2]) then
			LuaHelper.NodeCanvasSetIntVariableValue(var_10_0.behaviourTreeOwner, arg_10_0[1], arg_10_0[2])
		else
			var_10_0.behaviourTreeOwner.graph.blackboard:SetVariableValue(arg_10_0[1], arg_10_0[2])
		end
	end
end

function var_0_0.Response(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = pg.island_interaction[arg_11_2]

	if var_11_0.type == var_0_0.TYPE_STORY then
		var_0_1(var_11_0.param)
	elseif var_11_0.type == var_0_0.TYPE_BUBBLE then
		var_0_2(var_11_0.param)
	elseif var_11_0.type == var_0_0.TYPE_ACTION then
		var_0_3(var_11_0.param)
	elseif var_11_0.type == var_0_0.TYPE_AGORA then
		var_0_4(arg_11_1, arg_11_0)
	elseif var_11_0.type == var_0_0.TYPE_AGORA_CANCEL then
		var_0_5(arg_11_1, arg_11_0)
	elseif var_11_0.type == var_0_0.TYPE_OPEN_PAGE then
		var_0_6(var_11_0.param, arg_11_0, arg_11_1)
	elseif var_11_0.type == var_0_0.TYPE_TRANSFER then
		var_0_7(var_11_0.param, arg_11_0)
	elseif var_11_0.type == var_0_0.TYPE_BT_VALUE then
		var_0_8(var_11_0.param, arg_11_1, arg_11_0)
	end
end

return var_0_0
