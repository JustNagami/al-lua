local var_0_0 = class("Live2D")

var_0_0.STATE_LOADING = 0
var_0_0.STATE_INITED = 1
var_0_0.STATE_DISPOSE = 2

local var_0_1
local var_0_2 = 5
local var_0_3 = 3
local var_0_4 = 0.3

var_0_0.DRAG_TIME_ACTION = 1
var_0_0.DRAG_CLICK_ACTION = 2
var_0_0.DRAG_DOWN_ACTION = 3
var_0_0.DRAG_RELATION_XY = 4
var_0_0.DRAG_RELATION_IDLE = 5
var_0_0.DRAG_CLICK_MANY = 6
var_0_0.DRAG_LISTENER_EVENT = 7
var_0_0.ON_ACTION_PLAY = 1
var_0_0.ON_ACTION_DRAG_CLICK = 2
var_0_0.ON_ACTION_CHANGE_IDLE = 3
var_0_0.ON_ACTION_PARAMETER = 4
var_0_0.ON_ACTION_DOWN = 5
var_0_0.ON_ACTION_XY_TRIGGER = 6
var_0_0.ON_ACTION_DRAG_TRIGGER = 7
var_0_0.NOTICE_ACTION_LIST = {
	var_0_0.ON_ACTION_PLAY,
	var_0_0.ON_ACTION_DRAG_CLICK,
	var_0_0.ON_ACTION_CHANGE_IDLE,
	var_0_0.ON_ACTION_PARAMETER,
	var_0_0.ON_ACTION_DOWN,
	var_0_0.ON_ACTION_XY_TRIGGER,
	var_0_0.ON_ACTION_DRAG_TRIGGER
}

local var_0_5 = {
	[var_0_0.ON_ACTION_PLAY] = "动作播放 1",
	[var_0_0.ON_ACTION_DRAG_CLICK] = "动作点击 2",
	[var_0_0.ON_ACTION_CHANGE_IDLE] = "改变idle 3",
	[var_0_0.ON_ACTION_PARAMETER] = "参数变化 4",
	[var_0_0.ON_ACTION_DOWN] = "按下触发 5",
	[var_0_0.ON_ACTION_XY_TRIGGER] = "xy联动触发 6",
	[var_0_0.ON_ACTION_DRAG_TRIGGER] = "拖拽到达目标值触发 7"
}

var_0_0.EVENT_ACTION_APPLY = "event action apply"
var_0_0.EVENT_ACTION_ABLE = "event action able"
var_0_0.EVENT_ADD_PARAMETER_COM = "event add parameter com "
var_0_0.EVENT_REMOVE_PARAMETER_COM = "event remove parameter com "
var_0_0.EVENT_CHANGE_IDLE_INDEX = "event change idle index"
var_0_0.relation_type_drag_x = 101
var_0_0.relation_type_drag_y = 102
var_0_0.relation_type_action_index = 103
var_0_0.relation_type_idle = 104

local var_0_6 = {
	CubismParameterBlendMode.Override,
	CubismParameterBlendMode.Additive,
	CubismParameterBlendMode.Multiply
}

function var_0_0.GenerateData(arg_1_0)
	local var_1_0 = {
		SetData = function(arg_2_0, arg_2_1)
			arg_2_0.ship = arg_2_1.ship
			arg_2_0.parent = arg_2_1.parent
			arg_2_0.scale = arg_2_1.scale

			local var_2_0 = arg_2_0:GetShipSkinConfig().live2d_offset

			arg_2_0.gyro = arg_2_0:GetShipSkinConfig().gyro or 0
			arg_2_0.shipL2dId = arg_2_0:GetShipSkinConfig().ship_l2d_id
			arg_2_0.skinId = arg_2_0:GetShipSkinConfig().id
			arg_2_0.spineUseLive2d = false

			if arg_2_0.skinId then
				arg_2_0.spineUseLive2d = pg.ship_skin_template[arg_2_0.skinId].spine_use_live2d == 1
			end

			arg_2_0.position = arg_2_1.position + BuildVector3(var_2_0)
			arg_2_0.l2dDragRate = arg_2_0:GetShipSkinConfig().l2d_drag_rate
			arg_2_0.loadPrefs = arg_2_1.loadPrefs
		end,
		GetShipName = function(arg_3_0)
			return arg_3_0.ship:getPainting()
		end,
		GetShipSkinConfig = function(arg_4_0)
			return arg_4_0.ship:GetSkinConfig()
		end,
		isEmpty = function(arg_5_0)
			return arg_5_0.ship == nil
		end,
		Clear = function(arg_6_0)
			arg_6_0.ship = nil
			arg_6_0.parent = nil
			arg_6_0.scale = nil
			arg_6_0.position = nil
		end
	}

	var_1_0:SetData(arg_1_0)

	return var_1_0
end

local function var_0_7(arg_7_0)
	local var_7_0 = arg_7_0.live2dData:GetShipSkinConfig()
	local var_7_1 = var_7_0.lip_sync_gain
	local var_7_2 = var_7_0.lip_smoothing

	if var_7_1 and var_7_1 ~= 0 then
		arg_7_0._go:GetComponent("CubismCriSrcMouthInput").Gain = var_7_1
	end

	if var_7_2 and var_7_2 ~= 0 then
		arg_7_0._go:GetComponent("CubismCriSrcMouthInput").Smoothing = var_7_2
	end
end

local function var_0_8(arg_8_0)
	local var_8_0 = arg_8_0.live2dData:GetShipSkinConfig().l2d_para_range

	if var_8_0 ~= nil and type(var_8_0) == "table" then
		for iter_8_0, iter_8_1 in pairs(var_8_0) do
			arg_8_0.liveCom:SetParaRange(iter_8_0, iter_8_1)
		end
	end
end

local function var_0_9(arg_9_0)
	return not arg_9_0._readlyToStop
end

local function var_0_10(arg_10_0, arg_10_1)
	if not arg_10_1 or arg_10_1 == "" then
		return false
	end

	if arg_10_0.enablePlayActions and #arg_10_0.enablePlayActions > 0 and not table.contains(arg_10_0.enablePlayActions, arg_10_1) then
		print(tostring(arg_10_1) .. "不在白名单中,不播放该动作")

		return false
	end

	if arg_10_0.ignorePlayActions and #arg_10_0.ignorePlayActions > 0 and table.contains(arg_10_0.ignorePlayActions, arg_10_1) then
		print(tostring(arg_10_1) .. "在黑名单中，不播放该动作")

		return false
	end

	if not var_0_9(arg_10_0) then
		return false
	end

	return true
end

local function var_0_11(arg_11_0, arg_11_1, arg_11_2)
	if not var_0_10(arg_11_0, arg_11_1) then
		return false
	end

	if arg_11_0.updateAtom then
		arg_11_0:AtomSouceFresh()
	end

	if arg_11_0.animationClipNames then
		local var_11_0 = arg_11_0:checkActionExist(arg_11_1)

		if (not var_11_0 or var_11_0 == false) and string.find(arg_11_1, "main_") then
			arg_11_1 = "main_3"
		end
	end

	if not arg_11_0.isPlaying or arg_11_2 then
		local var_11_1 = var_0_1.action2Id[arg_11_1]

		print("action id " .. tostring(arg_11_1) .. " → 开始播放动作" .. tostring(var_11_1))

		if var_11_1 then
			arg_11_0.playActionName = arg_11_1

			arg_11_0.liveCom:SetAction(var_11_1)
			arg_11_0:live2dActionChange(true)

			return true
		else
			print(tostring(arg_11_1) .. " action is not exist")
		end
	end

	return false
end

local function var_0_12(arg_12_0, arg_12_1)
	arg_12_0.liveCom:SetCenterPart("Drawables/TouchHead", Vector3.zero)

	arg_12_0.liveCom.DampingTime = 0.3
end

local function var_0_13(arg_13_0, arg_13_1, arg_13_2)
	if table.contains(Live2D.NOTICE_ACTION_LIST, arg_13_1) then
		arg_13_0:onListenerHandle(arg_13_1, arg_13_2)
	end
end

local function var_0_14(arg_14_0, arg_14_1, arg_14_2)
	if arg_14_1 == Live2D.EVENT_ACTION_APPLY then
		local var_14_0 = arg_14_2.id
		local var_14_1 = arg_14_2.action
		local var_14_2 = arg_14_2.callback
		local var_14_3 = arg_14_2.finishCall
		local var_14_4 = arg_14_2.activeData
		local var_14_5 = arg_14_2.focus
		local var_14_6 = arg_14_2.react
		local var_14_7 = var_14_4.idle_focus

		if (not var_14_1 or var_14_1 == "") and var_14_2 then
			var_14_2(var_0_9(arg_14_0))
		end

		if var_0_9(arg_14_0) then
			if var_14_6 ~= nil then
				arg_14_0:setReactPos(tobool(var_14_6))
			end

			arg_14_0:onListenerHandle(Live2D.ON_ACTION_PLAY, {
				action = var_14_1
			})

			if var_14_7 and var_14_7 == 1 and (not var_14_1 or var_14_1 == "") then
				var_14_1 = "idle"

				arg_14_0:changeIdleIndex(var_14_4.idle and var_14_4.idle or 0)
			end

			local var_14_8 = var_0_11(arg_14_0, var_14_1, var_14_5 or false)

			if var_14_8 then
				arg_14_0:applyActiveData(arg_14_2)
			end

			if var_14_7 and var_14_7 == 1 then
				arg_14_0:live2dActionChange(false)
			end

			if var_14_2 then
				var_14_2(var_14_8)
			end
		end
	elseif arg_14_1 == Live2D.EVENT_ACTION_ABLE then
		if arg_14_0.ableFlag ~= arg_14_2.ableFlag then
			arg_14_0.ableFlag = arg_14_2.ableFlag

			if arg_14_2.ableFlag then
				arg_14_0.tempEnable = arg_14_0.enablePlayActions
				arg_14_0.enablePlayActions = {
					"none action apply"
				}
			else
				arg_14_0.enablePlayActions = arg_14_0.tempEnable
			end
		else
			print("able flag 相同，不执行操作")
		end

		if arg_14_2.callback then
			arg_14_2.callback()
		end
	elseif arg_14_1 == Live2D.EVENT_ADD_PARAMETER_COM then
		arg_14_0.liveCom:AddParameterValue(arg_14_2.com, arg_14_2.start, var_0_6[arg_14_2.mode])
	elseif arg_14_1 == Live2D.EVENT_REMOVE_PARAMETER_COM then
		arg_14_0.liveCom:removeParameterValue(arg_14_2.com)
	elseif arg_14_1 == Live2D.EVENT_CHANGE_IDLE_INDEX then
		arg_14_0:applyActiveData(arg_14_2)
	end
end

local function var_0_15(arg_15_0, arg_15_1)
	if not arg_15_0._l2dCharEnable then
		return
	end

	if arg_15_0._readlyToStop and not arg_15_1 then
		return
	end

	arg_15_0._listenerParametersValue = {}

	if arg_15_0._listenerStepIndex and arg_15_0._listenerStepIndex == 0 then
		arg_15_0._listenerStepIndex = 5

		for iter_15_0, iter_15_1 in ipairs(arg_15_0._listenerParameters) do
			arg_15_0._listenerParametersValue[iter_15_1.name] = iter_15_1.Value
		end

		arg_15_0:onListenerHandle(Live2D.ON_ACTION_PARAMETER, {
			values = arg_15_0._listenerParametersValue
		})
	else
		arg_15_0._listenerStepIndex = arg_15_0._listenerStepIndex - 1
	end

	local var_15_0 = false
	local var_15_1 = ReflectionHelp.RefGetField(typeof(Live2dChar), "reactPos", arg_15_0.liveCom)

	for iter_15_2 = 1, #arg_15_0.drags do
		arg_15_0.drags[iter_15_2]:changeReactValue(var_15_1)
		arg_15_0.drags[iter_15_2]:stepParameter()

		local var_15_2 = arg_15_0.drags[iter_15_2]:getParameToTargetFlag()
		local var_15_3 = arg_15_0.drags[iter_15_2]:getActive()

		if (var_15_2 or var_15_3) and arg_15_0.drags[iter_15_2]:getIgnoreReact() then
			var_15_0 = true
		elseif arg_15_0.drags[iter_15_2]:getReactCondition() then
			var_15_0 = true
		end

		local var_15_4 = arg_15_0.drags[iter_15_2]:getParameter()
		local var_15_5 = arg_15_0.drags[iter_15_2]:getParameterUpdateFlag()

		if var_15_4 and var_15_5 then
			local var_15_6 = arg_15_0.drags[iter_15_2]:getParameterCom()

			if var_15_6 then
				arg_15_0.liveCom:ChangeParameterData(var_15_6, var_15_4)
			end
		end

		local var_15_7 = arg_15_0.drags[iter_15_2]:getRelationParameterList()

		for iter_15_3, iter_15_4 in ipairs(var_15_7) do
			if iter_15_4.enable then
				arg_15_0.liveCom:ChangeParameterData(iter_15_4.com, iter_15_4.value)
			end
		end
	end

	if var_15_0 == arg_15_0.ignoreReact or not var_15_0 and (arg_15_0.mouseInputDown or arg_15_0.isPlaying) then
		-- block empty
	else
		arg_15_0:setReactPos(var_15_0)
	end
end

local function var_0_16(arg_16_0)
	arg_16_0.drags = {}
	arg_16_0.dragParts = {}

	for iter_16_0 = 1, #var_0_1.assistantTouchParts do
		table.insert(arg_16_0.dragParts, var_0_1.assistantTouchParts[iter_16_0])
	end

	arg_16_0._l2dCharEnable = true
	arg_16_0._shopPreView = arg_16_0.live2dData.shopPreView
	arg_16_0._listenerParameters = {}
	arg_16_0._listenerStepIndex = 0

	for iter_16_1, iter_16_2 in ipairs(arg_16_0.live2dData.shipL2dId) do
		local var_16_0 = pg.ship_l2d[iter_16_2]

		if var_16_0 and arg_16_0:getDragEnable(var_16_0) then
			local var_16_1 = Live2dDrag.New(var_16_0, arg_16_0.live2dData)
			local var_16_2 = arg_16_0.liveCom:GetCubismParameter(var_16_0.parameter)

			var_16_1:setParameterCom(var_16_2)
			var_16_1:setEventCallback(function(arg_17_0, arg_17_1)
				var_0_14(arg_16_0, arg_17_0, arg_17_1)
				var_0_13(arg_16_0, arg_17_0, arg_17_1)
			end)
			arg_16_0.liveCom:AddParameterValue(var_16_1.parameterName, var_16_1.startValue, var_0_6[var_16_0.mode])

			if var_16_0.relation_parameter and var_16_0.relation_parameter.list then
				local var_16_3 = var_16_0.relation_parameter.list

				for iter_16_3, iter_16_4 in ipairs(var_16_3) do
					local var_16_4 = arg_16_0.liveCom:GetCubismParameter(iter_16_4.name)

					if var_16_4 then
						var_16_1:addRelationComData(var_16_4, iter_16_4)

						local var_16_5 = iter_16_4.mode or var_16_0.mode

						arg_16_0.liveCom:AddParameterValue(iter_16_4.name, iter_16_4.start or var_16_1.startValue or 0, var_0_6[var_16_5])
					end
				end
			end

			table.insert(arg_16_0.drags, var_16_1)

			if not table.contains(arg_16_0._listenerParameters, var_16_2) then
				table.insert(arg_16_0._listenerParameters, var_16_2)
			end

			if var_16_1.drawAbleName and var_16_1.drawAbleName ~= "" and not table.contains(arg_16_0.dragParts, var_16_1.drawAbleName) then
				table.insert(arg_16_0.dragParts, var_16_1.drawAbleName)
			end
		end
	end

	arg_16_0.liveCom:SetDragParts(arg_16_0.dragParts)

	arg_16_0.eventTrigger = GetOrAddComponent(arg_16_0.liveCom.transform.parent, typeof(EventTriggerListener))

	arg_16_0.eventTrigger:AddPointDownFunc(function()
		if arg_16_0.useEventTriggerFlag then
			arg_16_0:onPointDown()
		end
	end)
	arg_16_0.eventTrigger:AddPointUpFunc(function()
		if arg_16_0.useEventTriggerFlag then
			arg_16_0:onPointUp()
		end
	end)
	arg_16_0.liveCom:SetMouseInputActions(System.Action(function()
		if not arg_16_0.useEventTriggerFlag then
			arg_16_0:onPointDown()
		end
	end), System.Action(function()
		if not arg_16_0.useEventTriggerFlag then
			arg_16_0:onPointUp()
		end
	end))

	arg_16_0.paraRanges = ReflectionHelp.RefGetField(typeof(Live2dChar), "paraRanges", arg_16_0.liveCom)
	arg_16_0.destinations = {}

	local var_16_6 = ReflectionHelp.RefGetProperty(typeof(Live2dChar), "Destinations", arg_16_0.liveCom)

	for iter_16_5 = 0, var_16_6.Length - 1 do
		local var_16_7 = var_16_6[iter_16_5]

		table.insert(arg_16_0.destinations, var_16_6[iter_16_5])
	end

	arg_16_0.timer = Timer.New(function()
		var_0_15(arg_16_0)
	end, 0.03333333333333333, -1)

	arg_16_0.timer:Start()
	var_0_15(arg_16_0)
end

function var_0_0.checkActionExist(arg_23_0, arg_23_1)
	return (table.indexof(arg_23_0.animationClipNames, arg_23_1))
end

function var_0_0.onListenerHandle(arg_24_0, arg_24_1, arg_24_2)
	if not arg_24_0.drags or #arg_24_0.drags == 0 then
		return
	end

	if arg_24_1 ~= Live2D.ON_ACTION_PARAMETER then
		-- block empty
	end

	for iter_24_0 = 1, #arg_24_0.drags do
		arg_24_0.drags[iter_24_0]:onListenerEvent(arg_24_1, arg_24_2)
	end
end

function var_0_0.onPointDown(arg_25_0)
	if not arg_25_0._l2dCharEnable then
		return
	end

	arg_25_0.mouseInputDown = true

	if #arg_25_0.drags > 0 and arg_25_0.liveCom:GetDragPart() > 0 then
		local var_25_0 = arg_25_0.liveCom:GetDragPart()
		local var_25_1 = arg_25_0.dragParts[var_25_0]

		if var_25_0 > 0 and var_25_1 then
			for iter_25_0, iter_25_1 in ipairs(arg_25_0.drags) do
				if iter_25_1.drawAbleName == var_25_1 then
					iter_25_1:startDrag()
				end
			end
		end
	end
end

function var_0_0.onPointUp(arg_26_0)
	if not arg_26_0._l2dCharEnable then
		return
	end

	arg_26_0.mouseInputDown = false

	if arg_26_0.drags and #arg_26_0.drags > 0 then
		local var_26_0 = arg_26_0.liveCom:GetDragPart()

		if var_26_0 > 0 then
			local var_26_1 = arg_26_0.dragParts[var_26_0]
		end

		for iter_26_0 = 1, #arg_26_0.drags do
			arg_26_0.drags[iter_26_0]:stopDrag()
		end
	end
end

function var_0_0.changeTriggerFlag(arg_27_0, arg_27_1)
	arg_27_0.useEventTriggerFlag = arg_27_1
end

local function var_0_17(arg_28_0, arg_28_1)
	arg_28_0._go = arg_28_1
	arg_28_0._tf = tf(arg_28_1)

	UIUtil.SetLayerRecursively(arg_28_0._go, LayerMask.NameToLayer("UI"))
	arg_28_0._tf:SetParent(arg_28_0.live2dData.parent, true)

	arg_28_0._tf.localScale = arg_28_0.live2dData.scale
	arg_28_0._tf.localPosition = arg_28_0.live2dData.position
	arg_28_0.liveCom = arg_28_1:GetComponent(typeof(Live2dChar))
	arg_28_0._animator = arg_28_1:GetComponent(typeof(Animator))
	arg_28_0.animationClipNames = {}

	if arg_28_0._animator and arg_28_0._animator.runtimeAnimatorController then
		local var_28_0 = arg_28_0._animator.runtimeAnimatorController.animationClips
		local var_28_1 = var_28_0.Length

		for iter_28_0 = 0, var_28_1 - 1 do
			table.insert(arg_28_0.animationClipNames, var_28_0[iter_28_0].name)
		end
	end

	local var_28_2 = var_0_1.action2Id.idle

	arg_28_0.liveCom:SetReactMotions(var_0_1.idleActions)
	arg_28_0.liveCom:SetAction(var_28_2)

	function arg_28_0.liveCom.FinishAction(arg_29_0)
		arg_28_0:live2dActionChange(false)

		if arg_28_0.finishActionCB then
			arg_28_0.finishActionCB()

			arg_28_0.finishActionCB = nil
		end

		arg_28_0:changeActionIdle()
	end

	function arg_28_0.liveCom.EventAction(arg_30_0)
		if arg_28_0.animEventCB then
			arg_28_0.animEventCB(arg_30_0)

			arg_28_0.animEventCB = nil
		end
	end

	arg_28_0.liveCom:SetTouchParts(var_0_1.assistantTouchParts)

	if arg_28_0.live2dData and arg_28_0.live2dData.ship and arg_28_0.live2dData.ship.propose then
		arg_28_0:changeParamaterValue("Paramring", 1)
	else
		arg_28_0:changeParamaterValue("Paramring", 0)
	end

	if not arg_28_0._physics then
		arg_28_0._physics = GetComponent(arg_28_0._tf, "CubismPhysicsController")
	end

	if arg_28_0._physics then
		arg_28_0._physics.enabled = false
		arg_28_0._physics.enabled = true
	end

	if arg_28_0.live2dData.l2dDragRate and #arg_28_0.live2dData.l2dDragRate > 0 then
		arg_28_0.liveCom.DragRateX = arg_28_0.live2dData.l2dDragRate[1] * var_0_2
		arg_28_0.liveCom.DragRateY = arg_28_0.live2dData.l2dDragRate[2] * var_0_3
		arg_28_0.liveCom.DampingTime = arg_28_0.live2dData.l2dDragRate[3] * var_0_4
	end

	var_0_7(arg_28_0)
	var_0_8(arg_28_0)
	var_0_12(arg_28_0)

	if arg_28_0.live2dData.shipL2dId and #arg_28_0.live2dData.shipL2dId > 0 then
		var_0_16(arg_28_0)
	end

	arg_28_0:addKeyBoard()

	arg_28_0.state = var_0_0.STATE_INITED

	if arg_28_0.delayChangeParamater and #arg_28_0.delayChangeParamater > 0 then
		for iter_28_1 = 1, #arg_28_0.delayChangeParamater do
			local var_28_3 = arg_28_0.delayChangeParamater[iter_28_1]

			arg_28_0:changeParamaterValue(var_28_3[1], var_28_3[2])
		end

		arg_28_0.delayChangeParamater = nil
	end

	arg_28_0.enablePlayActions = {}
	arg_28_0.ignorePlayActions = {}

	arg_28_0:changeIdleIndex(0)
	arg_28_0:loadLive2dData()
end

function var_0_0.Ctor(arg_31_0, arg_31_1, arg_31_2)
	arg_31_0.state = var_0_0.STATE_LOADING
	arg_31_0.live2dData = arg_31_1
	var_0_1 = pg.AssistantInfo

	assert(not arg_31_0.live2dData:isEmpty())

	local var_31_0 = arg_31_0.live2dData:GetShipName()

	local function var_31_1(arg_32_0)
		var_0_17(arg_31_0, arg_32_0)

		if arg_31_2 then
			arg_31_2(arg_31_0)
		end
	end

	arg_31_0.live2dRequestId = pg.Live2DMgr.GetInstance():GetLive2DModelAsync(var_31_0, var_31_1)
	Input.gyro.enabled = arg_31_0.live2dData.gyro == 1 and PlayerPrefs.GetInt(GYRO_ENABLE, 1) == 1
	arg_31_0.useEventTriggerFlag = true
end

function var_0_0.setStopCallback(arg_33_0, arg_33_1)
	arg_33_0._stopCallback = arg_33_1
end

function var_0_0.SetVisible(arg_34_0, arg_34_1)
	if not arg_34_0:IsLoaded() then
		return
	end

	Input.gyro.enabled = PlayerPrefs.GetInt(GYRO_ENABLE, 1) == 1

	arg_34_0:setReactPos(true)
	arg_34_0:Reset()

	if arg_34_1 then
		arg_34_0._readlyToStop = false

		onDelayTick(function()
			if not arg_34_0._readlyToStop then
				if arg_34_0._physics then
					arg_34_0._physics.enabled = false
					arg_34_0._physics.enabled = true
				end

				arg_34_0:setReactPos(false)
			end
		end, 1)
	else
		var_0_11(arg_34_0, "idle", true)

		arg_34_0._readlyToStop = true

		onDelayTick(function()
			if arg_34_0._readlyToStop then
				arg_34_0._animator.speed = 0

				if arg_34_0._stopCallback then
					arg_34_0._stopCallback()
				end
			end
		end, 3)
	end

	if arg_34_1 then
		arg_34_0:loadLive2dData()
	else
		arg_34_0:saveLive2dData()
		arg_34_0:loadLive2dData()
	end

	var_0_15(arg_34_0, true)

	arg_34_0._animator.speed = 1
end

function var_0_0.loadLive2dData(arg_37_0)
	if not arg_37_0.live2dData.loadPrefs then
		return
	end

	if PlayerPrefs.GetInt(LIVE2D_STATUS_SAVE, 1) ~= 1 and not arg_37_0.live2dData.spineUseLive2d then
		if arg_37_0.drags then
			for iter_37_0 = 1, #arg_37_0.drags do
				arg_37_0.drags[iter_37_0]:clearData()
				arg_37_0.drags[iter_37_0]:loadL2dFinal()
			end
		end

		arg_37_0:changeIdleIndex(0)
		arg_37_0._animator:Play("idle")

		arg_37_0.saveActionAbleId = nil

		return
	end

	local var_37_0, var_37_1 = Live2dConst.GetL2dSaveData(arg_37_0.live2dData:GetShipSkinConfig().id, arg_37_0.live2dData.ship.id)
	local var_37_2 = Live2dConst.GetDragActionIndex(var_37_1, arg_37_0.live2dData:GetShipSkinConfig().id, arg_37_0.live2dData.ship.id) or 1

	if var_37_0 then
		arg_37_0:changeIdleIndex(var_37_0)

		if var_37_0 == 0 then
			arg_37_0._animator:Play("idle")
		else
			arg_37_0._animator:Play("idle" .. var_37_0)
		end
	end

	arg_37_0.saveActionAbleId = var_37_1

	if var_37_1 and var_37_1 > 0 then
		if pg.ship_l2d[var_37_1] then
			local var_37_3 = pg.ship_l2d[var_37_1].action_trigger_active

			if var_37_0 and var_37_3.idle_enable and #var_37_3.idle_enable > 0 then
				for iter_37_1, iter_37_2 in ipairs(var_37_3.idle_enable) do
					if iter_37_2[1] == var_37_0 then
						arg_37_0.enablePlayActions = iter_37_2[2]
					end
				end
			elseif var_37_2 and var_37_2 >= 1 and var_37_3.active_list then
				arg_37_0.enablePlayActions = var_37_3.active_list[var_37_2].enable and var_37_3.active_list[var_37_2].enable or {}
			else
				arg_37_0.enablePlayActions = var_37_3.enable and var_37_3.enable or {}
			end

			if var_37_0 and var_37_3.idle_ignore and #var_37_3.idle_ignore > 0 then
				for iter_37_3, iter_37_4 in ipairs(var_37_3.idle_ignore) do
					if iter_37_4[1] == var_37_0 then
						arg_37_0.ignorePlayActions = iter_37_4[2]
					end
				end
			elseif var_37_2 and var_37_2 >= 1 and var_37_3.active_list then
				arg_37_0.ignorePlayActions = var_37_3.active_list[var_37_2].ignore and var_37_3.active_list[var_37_2].ignore or {}
			else
				arg_37_0.ignorePlayActions = var_37_3.ignore and var_37_3.ignore or {}
			end
		end
	else
		arg_37_0.enablePlayActions = {}
		arg_37_0.ignorePlayActions = {}
	end

	if arg_37_0.drags then
		for iter_37_5 = 1, #arg_37_0.drags do
			arg_37_0.drags[iter_37_5]:loadData()
			arg_37_0.drags[iter_37_5]:loadL2dFinal()
		end
	end
end

function var_0_0.saveLive2dData(arg_38_0)
	if not arg_38_0.live2dData.loadPrefs then
		return
	end

	if PlayerPrefs.GetInt(LIVE2D_STATUS_SAVE, 1) ~= 1 and not arg_38_0.live2dData.spineUseLive2d then
		return
	end

	if arg_38_0.idleIndex then
		Live2dConst.SaveL2dIdle(arg_38_0.live2dData:GetShipSkinConfig().id, arg_38_0.live2dData.ship.id, arg_38_0.idleIndex)
	end

	if arg_38_0.saveActionAbleId then
		if arg_38_0.idleIndex == 0 then
			Live2dConst.SaveL2dAction(arg_38_0.live2dData:GetShipSkinConfig().id, arg_38_0.live2dData.ship.id, 0)
		else
			Live2dConst.SaveL2dAction(arg_38_0.live2dData:GetShipSkinConfig().id, arg_38_0.live2dData.ship.id, arg_38_0.saveActionAbleId)
		end
	end

	if arg_38_0.drags then
		for iter_38_0 = 1, #arg_38_0.drags do
			arg_38_0.drags[iter_38_0]:saveData()
		end
	end
end

function var_0_0.changeActionIdle(arg_39_0)
	local var_39_0 = var_0_1.idleActions[math.ceil(math.random(#var_0_1.idleActions))]

	arg_39_0.liveCom:SetAction(var_39_0)
end

function var_0_0.enablePlayAction(arg_40_0, arg_40_1)
	return var_0_10(arg_40_0, arg_40_1)
end

function var_0_0.IgonreReactPos(arg_41_0, arg_41_1)
	arg_41_0:setReactPos(arg_41_1)
end

function var_0_0.setReactPos(arg_42_0, arg_42_1)
	if arg_42_0.liveCom then
		arg_42_0.ignoreReact = arg_42_1

		arg_42_0.liveCom:IgonreReactPos(arg_42_1)

		if arg_42_1 then
			ReflectionHelp.RefSetField(typeof(Live2dChar), "inDrag", arg_42_0.liveCom, false)
		end

		ReflectionHelp.RefSetField(typeof(Live2dChar), "reactPos", arg_42_0.liveCom, Vector3(0, 0, 0))
		arg_42_0:updateDragsSateData()
	end
end

function var_0_0.l2dCharEnable(arg_43_0, arg_43_1)
	arg_43_0._l2dCharEnable = arg_43_1
end

function var_0_0.inShopPreView(arg_44_0, arg_44_1)
	arg_44_0._shopPreView = arg_44_1
end

function var_0_0.getDragEnable(arg_45_0, arg_45_1)
	if arg_45_0._shopPreView and arg_45_1.shop_action == 0 then
		return false
	end

	return true
end

function var_0_0.updateShip(arg_46_0, arg_46_1)
	if arg_46_1 and arg_46_0.live2dData and arg_46_0.live2dData.ship then
		arg_46_0.live2dData.ship = arg_46_1

		if arg_46_0.live2dData and arg_46_0.live2dData.ship and arg_46_0.live2dData.ship.propose then
			arg_46_0:changeParamaterValue("Paramring", 1)
		else
			arg_46_0:changeParamaterValue("Paramring", 0)
		end
	end
end

function var_0_0.IsLoaded(arg_47_0)
	return arg_47_0.state == var_0_0.STATE_INITED
end

function var_0_0.GetTouchPart(arg_48_0)
	return arg_48_0.liveCom:GetTouchPart()
end

function var_0_0.TriggerAction(arg_49_0, arg_49_1, arg_49_2, arg_49_3, arg_49_4)
	arg_49_0:CheckStopDrag()

	arg_49_0.finishActionCB = arg_49_2
	arg_49_0.animEventCB = arg_49_4

	return (var_0_11(arg_49_0, arg_49_1, arg_49_3))
end

function var_0_0.Reset(arg_50_0)
	arg_50_0:live2dActionChange(false)

	arg_50_0.enablePlayActions = {}
	arg_50_0.ignorePlayActions = {}
	arg_50_0.ableFlag = nil
end

function var_0_0.resetL2dData(arg_51_0)
	if not arg_51_0._tf then
		return
	end

	if arg_51_0._tf and LeanTween.isTweening(go(arg_51_0._tf)) then
		return
	end

	arg_51_0._l2dPosition = arg_51_0._tf.position
	arg_51_0._tf.position = Vector3(arg_51_0._l2dPosition.x + 100, 0, 0)

	LeanTween.delayedCall(go(arg_51_0._tf), 0.2, System.Action(function()
		if arg_51_0._tf then
			arg_51_0._tf.position = arg_51_0._l2dPosition
		end
	end))
	Live2dConst.ClearLive2dSave(arg_51_0.live2dData.ship.skinId, arg_51_0.live2dData.ship.id)
	arg_51_0:Reset()
	arg_51_0:changeIdleIndex(0)
	arg_51_0:loadLive2dData()
end

function var_0_0.applyActiveData(arg_53_0, arg_53_1)
	local var_53_0 = arg_53_1.activeData
	local var_53_1 = var_53_0.enable
	local var_53_2 = var_53_0.idle_enable
	local var_53_3 = var_53_0.idle_ignore
	local var_53_4 = var_53_0.ignore
	local var_53_5 = var_53_0.idle and var_53_0.idle or arg_53_1.idle

	print("active data idle = " .. tostring(var_53_5))

	local var_53_6 = var_53_0.repeatFlag

	if var_53_1 and #var_53_1 >= 0 then
		arg_53_0.enablePlayActions = var_53_1
	elseif var_53_2 and #var_53_2 > 0 then
		for iter_53_0, iter_53_1 in ipairs(var_53_2) do
			if iter_53_1[1] == var_53_5 then
				arg_53_0.enablePlayActions = iter_53_1[2]
			end
		end
	end

	if var_53_4 and #var_53_4 >= 0 then
		arg_53_0.ignorePlayActions = var_53_4
	elseif var_53_3 and #var_53_3 > 0 then
		for iter_53_2, iter_53_3 in ipairs(var_53_3) do
			if iter_53_3[1] == var_53_5 then
				arg_53_0.ignorePlayActions = iter_53_3[2]
			end
		end
	end

	if var_53_5 and var_53_5 ~= arg_53_0.indexIndex then
		arg_53_0.saveActionAbleId = arg_53_1.id
	end

	if var_53_5 then
		local var_53_7

		if type(var_53_5) == "number" and var_53_5 >= 0 then
			var_53_7 = var_53_5
		elseif type(var_53_5) == "table" then
			local var_53_8 = {}

			for iter_53_4, iter_53_5 in ipairs(var_53_5) do
				if iter_53_5 == arg_53_0.idleIndex then
					if var_53_6 then
						table.insert(var_53_8, iter_53_5)
					end
				else
					table.insert(var_53_8, iter_53_5)
				end
			end

			var_53_7 = var_53_8[math.random(1, #var_53_8)]
		end

		if var_53_7 then
			arg_53_0:changeIdleIndex(var_53_7)
		end

		arg_53_0:saveLive2dData()
	end
end

function var_0_0.changeIdleIndex(arg_54_0, arg_54_1)
	local var_54_0 = false

	if arg_54_0.idleIndex ~= arg_54_1 then
		arg_54_0._animator:SetInteger("idle", arg_54_1)

		var_54_0 = true
	end

	arg_54_0:onListenerHandle(Live2D.ON_ACTION_CHANGE_IDLE, {
		idle = arg_54_0.idleIndex,
		idle_change = var_54_0
	})
	print("now set idle index is " .. arg_54_1)

	arg_54_0.idleIndex = arg_54_1

	arg_54_0:updateDragsSateData()
end

function var_0_0.live2dActionChange(arg_55_0, arg_55_1)
	arg_55_0.isPlaying = arg_55_1

	arg_55_0:updateDragsSateData()
end

function var_0_0.updateDragsSateData(arg_56_0)
	local var_56_0 = {
		idleIndex = arg_56_0.idleIndex,
		isPlaying = arg_56_0.isPlaying,
		ignoreReact = arg_56_0.ignoreReact,
		actionName = arg_56_0.playActionName
	}

	if arg_56_0.drags then
		for iter_56_0 = 1, #arg_56_0.drags do
			arg_56_0.drags[iter_56_0]:updateStateData(var_56_0)
		end
	end
end

function var_0_0.CheckStopDrag(arg_57_0)
	local var_57_0 = arg_57_0.live2dData:GetShipSkinConfig()

	if var_57_0.l2d_ignore_drag and var_57_0.l2d_ignore_drag == 1 then
		arg_57_0.liveCom.ResponseClick = false

		ReflectionHelp.RefSetField(typeof(Live2dChar), "inDrag", arg_57_0.liveCom, false)
	end
end

function var_0_0.changeParamaterValue(arg_58_0, arg_58_1, arg_58_2)
	if arg_58_0:IsLoaded() then
		if not arg_58_1 or string.len(arg_58_1) == 0 then
			return
		end

		local var_58_0 = arg_58_0.liveCom:GetCubismParameter(arg_58_1)

		if not var_58_0 then
			return
		end

		arg_58_0.liveCom:AddParameterValue(var_58_0, arg_58_2, var_0_6[1])
	else
		if not arg_58_0.delayChangeParamater then
			arg_58_0.delayChangeParamater = {}
		end

		table.insert(arg_58_0.delayChangeParamater, {
			arg_58_1,
			arg_58_2
		})
	end
end

function var_0_0.Dispose(arg_59_0)
	if arg_59_0.state == var_0_0.STATE_INITED then
		if arg_59_0._go then
			Destroy(arg_59_0._go)
		end

		arg_59_0.liveCom.FinishAction = nil
		arg_59_0.liveCom.EventAction = nil
	end

	arg_59_0:saveLive2dData()
	arg_59_0.liveCom:SetMouseInputActions(nil, nil)

	arg_59_0._readlyToStop = false
	arg_59_0.state = var_0_0.STATE_DISPOSE

	pg.Live2DMgr.GetInstance():StopLoadingLive2d(arg_59_0.live2dRequestId)

	arg_59_0.live2dRequestId = nil

	if arg_59_0.drags then
		for iter_59_0 = 1, #arg_59_0.drags do
			arg_59_0.drags[iter_59_0]:dispose()
		end

		arg_59_0.drags = {}
	end

	if arg_59_0.live2dData.gyro == 1 then
		Input.gyro.enabled = false
	end

	if arg_59_0.live2dData then
		arg_59_0.live2dData:Clear()

		arg_59_0.live2dData = nil
	end

	arg_59_0:live2dActionChange(false)

	if arg_59_0.timer then
		arg_59_0.timer:Stop()

		arg_59_0.timer = nil
	end
end

function var_0_0.UpdateAtomSource(arg_60_0)
	arg_60_0.updateAtom = true
end

function var_0_0.AtomSouceFresh(arg_61_0)
	local var_61_0 = pg.CriMgr.GetInstance():getAtomSource(pg.CriMgr.C_VOICE)
	local var_61_1 = arg_61_0._go:GetComponent("CubismCriSrcMouthInput")
	local var_61_2 = ReflectionHelp.RefGetField(typeof("Live2D.Cubism.Framework.MouthMovement.CubismCriSrcMouthInput"), "Analyzer", var_61_1)

	var_61_0:AttachToAnalyzer(var_61_2)

	if arg_61_0.updateAtom then
		arg_61_0.updateAtom = false
	end
end

function var_0_0.addKeyBoard(arg_62_0)
	return
end

return var_0_0
