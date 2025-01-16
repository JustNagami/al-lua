local var_0_0 = class("Live2dDrag")
local var_0_1 = 4
local var_0_2 = {
	Live2D.DRAG_DOWN_ACTION
}
local var_0_3 = 1
local var_0_4 = 2
local var_0_5 = 3
local var_0_6 = 1
local var_0_7 = 2
local var_0_8 = 1

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.live2dData = arg_1_2
	arg_1_0.frameRate = Application.targetFrameRate or 60

	print("drag id " .. arg_1_1.id .. "初始化")

	arg_1_0.id = arg_1_1.id
	arg_1_0.drawAbleName = arg_1_1.draw_able_name or ""
	arg_1_0.parameterName = arg_1_1.parameter
	arg_1_0.mode = arg_1_1.mode
	arg_1_0.startValue = arg_1_1.start_value or 0
	arg_1_0.range = arg_1_1.range
	arg_1_0.offsetX = arg_1_1.offset_x

	if arg_1_0.offsetX == 0 then
		arg_1_0.offsetX = nil
	end

	arg_1_0.offsetY = arg_1_1.offset_y

	if arg_1_0.offsetY == 0 then
		arg_1_0.offsetY = nil
	end

	arg_1_0.smooth = arg_1_1.smooth / 1000
	arg_1_0.smoothRevert = arg_1_1.revert_smooth / 1000
	arg_1_0.revert = arg_1_1.revert
	arg_1_0.ignoreReact = arg_1_1.ignore_react == 1
	arg_1_0.gyro = arg_1_1.gyro == 1 or nil
	arg_1_0.gyroX = arg_1_1.gyro_x == 1
	arg_1_0.gyroY = arg_1_1.gyro_y == 1
	arg_1_0.gyroZ = arg_1_1.gyro_z == 1
	arg_1_0.ignoreAction = arg_1_1.ignore_action == 1
	arg_1_0.dragDirect = arg_1_1.drag_direct
	arg_1_0.rangeAbs = arg_1_1.range_abs == 1
	arg_1_0.partsData = arg_1_1.parts_data
	arg_1_0.actionTrigger = arg_1_1.action_trigger
	arg_1_0.reactX = arg_1_1.react_pos_x ~= 0 and arg_1_1.react_pos_x or nil
	arg_1_0.reactY = arg_1_1.react_pos_y ~= 0 and arg_1_1.react_pos_y or nil
	arg_1_0.actionTriggerActive = arg_1_1.action_trigger_active
	arg_1_0.relationParameter = arg_1_1.relation_parameter
	arg_1_0.relationParts = arg_1_0.relationParameter.parts
	arg_1_0.limitTime = arg_1_1.limit_time > 0 and arg_1_1.limit_time or var_0_1
	arg_1_0.offsetCircle = arg_1_1.offset_circle or ""
	arg_1_0.offsetCirclePos = arg_1_0.offsetCircle.pos and arg_1_0.offsetCircle.pos or nil
	arg_1_0.offsetCircleStart = arg_1_0.offsetCircle.start and arg_1_0.offsetCircle.start or nil
	arg_1_0.listenerData = arg_1_1.listener_data
	arg_1_0.listenerType = arg_1_0.listenerData.type
	arg_1_0.listenerChange = arg_1_0.listenerData.change
	arg_1_0.listenerApply = arg_1_0.listenerData.apply
	arg_1_0.reactCondition = arg_1_1.react_condition and arg_1_1.react_condition ~= "" and arg_1_1.react_condition or {}
	arg_1_0.idleOn = arg_1_0.reactCondition.idle_on and arg_1_0.reactCondition.idle_on or {}
	arg_1_0.idleOff = arg_1_0.reactCondition.idle_off and arg_1_0.reactCondition.idle_off or {}

	local var_1_0 = false

	if type(arg_1_1.revert_idle_index) == "number" then
		var_1_0 = arg_1_1.revert_idle_index == 1 and true or false
	elseif type(arg_1_1.revert_idle_index) == "table" then
		var_1_0 = arg_1_1.revert_idle_index
	end

	arg_1_0.revertIdleIndex = var_1_0
	arg_1_0.revertActionIndex = arg_1_1.revert_action_index == 1 and true or false
	arg_1_0.saveParameterFlag = true

	if arg_1_1.save_parameter == -1 then
		arg_1_0.saveParameterFlag = false
	end

	arg_1_0.randomAttitudeIndex = L2D_RANDOM_PARAM
	arg_1_0._active = false
	arg_1_0._parameterCom = nil
	arg_1_0.parameterValue = arg_1_0.startValue
	arg_1_0.parameterTargetValue = arg_1_0.startValue
	arg_1_0.parameterSmooth = 0
	arg_1_0.parameterSmoothTime = arg_1_0.smooth
	arg_1_0.mouseInputDown = Vector2(0, 0)
	arg_1_0.nextTriggerTime = 0
	arg_1_0.triggerActionTime = 0
	arg_1_0.sensitive = 4
	arg_1_0.l2dIdleIndex = 0
	arg_1_0.reactPos = Vector2(0, 0)
	arg_1_0.actionListIndex = 1
	arg_1_0._relationParameterList = {}
	arg_1_0.offsetDragX = arg_1_0.startValue
	arg_1_0.offsetDragY = arg_1_0.startValue
	arg_1_0.rangeOffset = arg_1_0.range[2] - arg_1_0.range[1]
	arg_1_0.offsetDragTargetX = arg_1_0.startValue
	arg_1_0.offsetDragTargetY = arg_1_0.startValue
	arg_1_0._relationFlag = false

	if arg_1_0.relationParameter and arg_1_0.relationParameter.list then
		arg_1_0._relationFlag = true
	end

	arg_1_0.extendActionFlag = false
	arg_1_0.parameterComAdd = true
	arg_1_0.reactConditionFlag = false
	arg_1_0.loadL2dStep = true
end

function var_0_0.onListenerEvent(arg_2_0, arg_2_1, arg_2_2)
	if arg_2_0.listenerType == arg_2_1 then
		local var_2_0 = arg_2_2.action
		local var_2_1 = arg_2_2.values
		local var_2_2 = arg_2_2.idle
		local var_2_3 = arg_2_2.idle_change
		local var_2_4 = arg_2_2.draw_able_name
		local var_2_5 = arg_2_2.parameter_name
		local var_2_6 = false

		if arg_2_0.listenerChange and #arg_2_0.listenerChange > 0 then
			local var_2_7 = arg_2_0:getChangeCheckName(arg_2_1, arg_2_2)

			if var_2_7 then
				for iter_2_0 = 1, #arg_2_0.listenerChange do
					local var_2_8 = arg_2_0.listenerChange[iter_2_0]
					local var_2_9 = var_2_8[1]
					local var_2_10 = var_2_8[2]
					local var_2_11 = var_2_8[3]
					local var_2_12 = #var_2_8 >= 4 and var_2_8[4] or 1

					if table.contains(var_2_10, var_2_7) then
						local var_2_13

						if var_2_9 == var_0_6 then
							var_2_13 = arg_2_0.parameterTargetValue + var_2_11
						elseif var_2_9 == var_0_7 then
							var_2_13 = var_2_11
						end

						if var_2_13 then
							var_2_6 = true

							local var_2_14 = arg_2_0:fixParameterTargetValue(var_2_13, arg_2_0.range, arg_2_0.rangeAbs, arg_2_0.dragDirect)

							if arg_2_0.actionTrigger.change_focus == false then
								arg_2_0.prepareTargetValue = var_2_14

								print(arg_2_0.parameterName .. "等待动作结束后的target赋值" .. arg_2_0.parameterTargetValue)
							else
								arg_2_0:setTargetValue(var_2_14)
								print(arg_2_0.parameterName .. "监听 数值变更为" .. arg_2_0.parameterTargetValue)
							end
						end

						if var_2_12 and var_2_12 > 0 then
							var_2_6 = true
							arg_2_0.actionListIndex = var_2_12
						end
					end
				end
			end
		end

		if arg_2_0.listenerApply and #arg_2_0.listenerApply > 0 then
			local var_2_15 = arg_2_0.listenerApply[1]
			local var_2_16 = arg_2_0.listenerApply[2]

			if var_2_15 == var_0_8 and var_2_6 then
				local var_2_17 = arg_2_0.parameterTargetValue

				if arg_2_0.prepareTargetValue ~= nil then
					var_2_17 = arg_2_0.prepareTargetValue
				end

				local var_2_18

				for iter_2_1 = 1, #var_2_16 do
					local var_2_19 = var_2_16[iter_2_1]

					if var_2_17 >= var_2_19[1] and var_2_17 < var_2_19[2] then
						var_2_18 = var_2_19[3]
					end
				end

				if var_2_18 and arg_2_0.l2dIdleIndex ~= var_2_18 then
					arg_2_0:onEventCallback(Live2D.EVENT_CHANGE_IDLE_INDEX, {
						id = arg_2_0.id,
						idle = var_2_18,
						activeData = arg_2_0.actionTriggerActive
					})
				end
			end
		end
	end
end

function var_0_0.getChangeCheckName(arg_3_0, arg_3_1, arg_3_2)
	if arg_3_1 == Live2D.ON_ACTION_PLAY then
		return arg_3_2.action
	elseif arg_3_1 == Live2D.ON_ACTION_DRAG_CLICK then
		return arg_3_2.draw_able_name
	elseif arg_3_1 == Live2D.ON_ACTION_CHANGE_IDLE then
		return arg_3_2.idle
	elseif arg_3_1 == Live2D.ON_ACTION_PARAMETER then
		-- block empty
	elseif arg_3_1 == Live2D.ON_ACTION_DOWN then
		-- block empty
	elseif arg_3_1 == Live2D.ON_ACTION_XY_TRIGGER then
		-- block empty
	elseif arg_3_1 == Live2D.ON_ACTION_DRAG_TRIGGER then
		-- block empty
	end

	return nil
end

function var_0_0.startDrag(arg_4_0, arg_4_1)
	if arg_4_0.ignoreAction and arg_4_0.l2dIsPlaying then
		return
	end

	print(arg_4_0.drawAbleName .. " 按下了")

	if not arg_4_0._active then
		arg_4_0._active = true
		arg_4_0.mouseInputDown = Input.mousePosition
		arg_4_0.mouseInputDownTime = Time.time
		arg_4_0.triggerActionTime = 0

		if table.contains(var_0_2, arg_4_0.actionTrigger.type) then
			arg_4_0.actionListIndex = 1
		end

		arg_4_0.parameterSmoothTime = arg_4_0.smooth
	end
end

function var_0_0.stopDrag(arg_5_0, arg_5_1)
	if arg_5_0._active then
		arg_5_0._active = false

		if arg_5_0.revert > 0 then
			arg_5_0.parameterToStart = arg_5_0.revert / 1000
			arg_5_0.parameterSmoothTime = arg_5_0.smoothRevert
		end

		if arg_5_0.offsetDragX then
			arg_5_0.offsetDragTargetX = arg_5_0:fixParameterTargetValue(arg_5_0.offsetDragX, arg_5_0.range, arg_5_0.rangeAbs, arg_5_0.dragDirect)
		end

		if arg_5_0.offsetDragY then
			arg_5_0.offsetDragTargetY = arg_5_0:fixParameterTargetValue(arg_5_0.offsetDragY, arg_5_0.range, arg_5_0.rangeAbs, arg_5_0.dragDirect)
		end

		arg_5_0:checkResetTriggerTime()

		arg_5_0.mouseInputUp = Input.mousePosition
		arg_5_0.mouseInputUpTime = Time.time
		arg_5_0.mouseWorld = nil
		arg_5_0.circleDragWorld = nil

		arg_5_0:updatePartsParameter()
		arg_5_0:saveData()
	end
end

function var_0_0.onDrag(arg_6_0, arg_6_1)
	arg_6_0.mouseWorld = arg_6_1.pointerCurrentRaycast.worldPosition
end

function var_0_0.checkResetTriggerTime(arg_7_0)
	local var_7_0 = false

	if arg_7_0.actionTrigger.type == Live2D.DRAG_DOWN_ACTION and arg_7_0.actionTrigger.last then
		var_7_0 = true
	end

	if var_7_0 then
		arg_7_0:resetNextTriggerTime()
	end
end

function var_0_0.resetNextTriggerTime(arg_8_0)
	arg_8_0.nextTriggerTime = 0
end

function var_0_0.updatePartsParameter(arg_9_0)
	if type(arg_9_0.partsData) == "table" then
		local var_9_0 = arg_9_0.partsData.parts
		local var_9_1 = arg_9_0.partsData.type
		local var_9_2 = false

		if arg_9_0.offsetX or arg_9_0.offsetY then
			var_9_2 = true
		elseif arg_9_0.actionTrigger and arg_9_0.actionTrigger.type == Live2D.DRAG_DOWN_TOUCH then
			var_9_2 = true
		elseif arg_9_0.offsetCirclePos then
			var_9_2 = true
		end

		if var_9_2 then
			local var_9_3 = arg_9_0.parameterTargetValue
			local var_9_4
			local var_9_5

			for iter_9_0 = 1, #var_9_0 do
				local var_9_6 = var_9_0[iter_9_0]
				local var_9_7 = math.abs(var_9_3 - var_9_6)

				if var_9_1 == var_0_3 or not var_9_1 then
					if not var_9_4 or var_9_7 < var_9_4 then
						var_9_4 = var_9_7
						var_9_5 = iter_9_0
					end
				elseif var_9_1 == var_0_4 then
					if var_9_6 <= var_9_3 and (not var_9_4 or var_9_7 < var_9_4) then
						var_9_4 = var_9_7
						var_9_5 = iter_9_0
					end
				elseif var_9_1 == var_0_5 and var_9_3 <= var_9_6 and (not var_9_4 or var_9_7 < var_9_4) then
					var_9_4 = var_9_7
					var_9_5 = iter_9_0
				end
			end

			if var_9_5 then
				if math.abs(arg_9_0.parameterTargetValue - var_9_0[var_9_5]) >= 0.05 then
					print("吸附数值" .. var_9_0[var_9_5])
				end

				arg_9_0:setTargetValue(var_9_0[var_9_5])
			end
		end
	end
end

function var_0_0.getIgnoreReact(arg_10_0)
	return arg_10_0.ignoreReact
end

function var_0_0.setParameterCom(arg_11_0, arg_11_1)
	if not arg_11_1 then
		print("live2dDrag id:" .. tostring(arg_11_0.id) .. "设置了null的组件(该打印非报错)")
	end

	arg_11_0._parameterCom = arg_11_1
end

function var_0_0.getParameterCom(arg_12_0)
	return arg_12_0._parameterCom
end

function var_0_0.addRelationComData(arg_13_0, arg_13_1, arg_13_2)
	table.insert(arg_13_0._relationParameterList, {
		com = arg_13_1,
		data = arg_13_2
	})
end

function var_0_0.getRelationParameterList(arg_14_0)
	return arg_14_0._relationParameterList
end

function var_0_0.getReactCondition(arg_15_0)
	return arg_15_0.reactConditionFlag
end

function var_0_0.getActive(arg_16_0)
	return arg_16_0._active
end

function var_0_0.getParameterUpdateFlag(arg_17_0)
	return arg_17_0._parameterUpdateFlag
end

function var_0_0.setEventCallback(arg_18_0, arg_18_1)
	arg_18_0._eventCallback = arg_18_1
end

function var_0_0.onEventCallback(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
	if arg_19_1 == Live2D.EVENT_ACTION_APPLY then
		local var_19_0 = {}
		local var_19_1
		local var_19_2 = false
		local var_19_3
		local var_19_4
		local var_19_5
		local var_19_6 = false

		if arg_19_0.actionTrigger.action then
			var_19_1 = arg_19_0:fillterAction(arg_19_0.actionTrigger.action)
			var_19_0 = arg_19_0.actionTriggerActive
			var_19_2 = arg_19_0.actionTrigger.focus or false
			var_19_3 = arg_19_0.actionTrigger.target or nil
			var_19_6 = arg_19_0.actionTrigger.target_focus == 1 and true or false

			if (arg_19_0.actionTrigger.circle or nil) and var_19_3 and var_19_3 == arg_19_0.parameterTargetValue then
				var_19_3 = arg_19_0.startValue
			end

			var_19_4 = arg_19_0.actionTrigger.react or nil

			arg_19_0:triggerAction()
			arg_19_0:stopDrag()
		elseif arg_19_0.actionTrigger.action_list then
			local var_19_7 = arg_19_0.actionTrigger.action_list[arg_19_0.actionListIndex]

			var_19_1 = arg_19_0:fillterAction(var_19_7.action)

			if arg_19_0.actionTriggerActive.active_list and arg_19_0.actionListIndex <= #arg_19_0.actionTriggerActive.active_list then
				var_19_0 = arg_19_0.actionTriggerActive.active_list[arg_19_0.actionListIndex]
			else
				var_19_0 = arg_19_0.actionTriggerActive
			end

			var_19_2 = var_19_7.focus or true
			var_19_3 = var_19_7.target or nil
			var_19_6 = var_19_7.target_focus == 1 and true or false
			var_19_4 = var_19_7.react or nil

			arg_19_0:triggerAction()

			if arg_19_0.actionListIndex == #arg_19_0.actionTrigger.action_list then
				arg_19_0:stopDrag()

				arg_19_0.actionListIndex = 1
			else
				arg_19_0.actionListIndex = arg_19_0.actionListIndex + 1
			end
		elseif not arg_19_0.actionTrigger.action then
			var_19_1 = arg_19_0:fillterAction(arg_19_0.actionTrigger.action)
			var_19_0 = arg_19_0.actionTriggerActive
			var_19_2 = arg_19_0.actionTrigger.focus or false
			var_19_3 = arg_19_0.actionTrigger.target or nil
			var_19_6 = arg_19_0.actionTrigger.target_focus == 1 and true or false

			local var_19_8 = arg_19_0.actionTrigger.circle or nil

			var_19_4 = arg_19_0.actionTrigger.react or nil

			if var_19_8 and var_19_3 and var_19_3 == arg_19_0.parameterTargetValue then
				var_19_3 = arg_19_0.startValue
			end

			arg_19_0:triggerAction()
			arg_19_0:setTriggerActionFlag(false)
			arg_19_0:stopDrag()
		end

		if var_19_0.idle then
			if type(var_19_0.idle) == "number" then
				if var_19_0.idle == arg_19_0.l2dIdleIndex and not var_19_0.repeat_flag then
					return
				end
			elseif type(var_19_0.idle) == "table" and #var_19_0.idle == 1 and var_19_0.idle[1] == arg_19_0.l2dIdleIndex and not var_19_0.repeat_flag then
				return
			end
		end

		print("执行aplly数据 id = " .. arg_19_0.id .. "播放action = " .. tostring(var_19_1) .. " active idle is " .. tostring(var_19_0.idle))

		if var_19_3 then
			arg_19_0:setTargetValue(var_19_3)

			if var_19_6 then
				arg_19_0:setParameterValue(var_19_3)
			end

			if not var_19_1 then
				arg_19_0.revertResetFlag = true
			end
		end

		arg_19_2 = {
			id = arg_19_0.id,
			action = var_19_1,
			activeData = var_19_0,
			focus = var_19_2,
			react = var_19_4,
			callback = arg_19_3,
			finishCall = function()
				arg_19_0:actionApplyFinish()
			end
		}
	elseif arg_19_1 == Live2D.EVENT_ACTION_ABLE then
		-- block empty
	elseif arg_19_1 == Live2D.EVENT_CHANGE_IDLE_INDEX then
		print("change idle")
	elseif arg_19_1 == Live2D.EVENT_GET_PARAMETER then
		arg_19_2.callback = arg_19_3
	elseif arg_19_1 == Live2D.EVENT_GET_DRAG_PARAMETER then
		arg_19_2.callback = arg_19_3
	elseif arg_19_1 == Live2D.EVENT_GET_WORLD_POSITION then
		arg_19_2.callback = arg_19_3
	end

	arg_19_0._eventCallback(arg_19_1, arg_19_2)
end

function var_0_0.fillterAction(arg_21_0, arg_21_1)
	if type(arg_21_1) == "table" then
		return arg_21_1[math.random(1, #arg_21_1)]
	else
		return arg_21_1
	end
end

function var_0_0.onEventNotice(arg_22_0, arg_22_1)
	if arg_22_0._eventCallback then
		local var_22_0 = arg_22_0:getCommonNoticeData()

		arg_22_0._eventCallback(arg_22_1, var_22_0)
	end
end

function var_0_0.getCommonNoticeData(arg_23_0)
	return {
		draw_able_name = arg_23_0.drawAbleName,
		parameter_name = arg_23_0.parameterName,
		parameter_target = arg_23_0.parameterTargetValue
	}
end

function var_0_0.setTargetValue(arg_24_0, arg_24_1)
	arg_24_0.parameterTargetValue = arg_24_1
end

function var_0_0.getParameter(arg_25_0)
	return arg_25_0.parameterValue
end

function var_0_0.getParameToTargetFlag(arg_26_0)
	if arg_26_0.parameterValue ~= arg_26_0.parameterTargetValue then
		return true
	end

	if arg_26_0.parameterToStart and arg_26_0.parameterToStart > 0 then
		return true
	end

	return false
end

function var_0_0.actionApplyFinish(arg_27_0)
	return
end

function var_0_0.stepParameter(arg_28_0, arg_28_1)
	arg_28_0:updateStepData(arg_28_1)
	arg_28_0:updateState()
	arg_28_0:updateTrigger()
	arg_28_0:updateParameterUpdateFlag()
	arg_28_0:updateGyro()
	arg_28_0:updateDrag()
	arg_28_0:updateCircleDrag()
	arg_28_0:updateReactValue()
	arg_28_0:updateParameterValue()
	arg_28_0:updateRelationValue()
	arg_28_0:checkReset()

	arg_28_0.loadL2dStep = false
end

function var_0_0.updateStepData(arg_29_0, arg_29_1)
	arg_29_0.reactPos = arg_29_1.reactPos
	arg_29_0.normalTime = arg_29_1.normalTime
	arg_29_0.stateInfo = arg_29_1.stateInfo
end

function var_0_0.updateParameterUpdateFlag(arg_30_0)
	if arg_30_0.actionTrigger.type == Live2D.DRAG_CLICK_ACTION then
		arg_30_0._parameterUpdateFlag = true
	elseif arg_30_0.actionTrigger.type == Live2D.DRAG_RELATION_IDLE then
		if not arg_30_0._parameterUpdateFlag then
			if not arg_30_0.l2dIsPlaying then
				arg_30_0._parameterUpdateFlag = true

				arg_30_0:changeParameComAble(true)
			elseif not table.contains(arg_30_0.actionTrigger.remove_com_list, arg_30_0.l2dPlayActionName) then
				arg_30_0._parameterUpdateFlag = true

				arg_30_0:changeParameComAble(true)
			end
		elseif arg_30_0._parameterUpdateFlag == true and arg_30_0.l2dIsPlaying and table.contains(arg_30_0.actionTrigger.remove_com_list, arg_30_0.l2dPlayActionName) then
			arg_30_0._parameterUpdateFlag = false

			arg_30_0:changeParameComAble(false)
		end
	elseif arg_30_0.actionTrigger.type == Live2D.DRAG_DOWN_TOUCH then
		arg_30_0._parameterUpdateFlag = true
	elseif arg_30_0.actionTrigger.type == Live2D.DRAG_LISTENER_EVENT then
		arg_30_0._parameterUpdateFlag = true
	else
		arg_30_0._parameterUpdateFlag = false
	end
end

function var_0_0.changeParameComAble(arg_31_0, arg_31_1)
	if arg_31_0.parameterComAdd == arg_31_1 then
		return
	end

	arg_31_0.parameterComAdd = arg_31_1

	if arg_31_1 then
		arg_31_0:onEventCallback(Live2D.EVENT_ADD_PARAMETER_COM, {
			com = arg_31_0._parameterCom,
			start = arg_31_0.startValue,
			mode = arg_31_0.mode
		})
	else
		arg_31_0:onEventCallback(Live2D.EVENT_REMOVE_PARAMETER_COM, {
			com = arg_31_0._parameterCom,
			mode = arg_31_0.mode
		})
	end
end

function var_0_0.updateDrag(arg_32_0)
	if not arg_32_0.offsetX and not arg_32_0.offsetY then
		return
	end

	local var_32_0

	if arg_32_0._active then
		local var_32_1 = Input.mousePosition

		if arg_32_0.offsetX and arg_32_0.offsetX ~= 0 then
			local var_32_2 = var_32_1.x - arg_32_0.mouseInputDown.x

			var_32_0 = arg_32_0.offsetDragTargetX + var_32_2 / arg_32_0.offsetX
			arg_32_0.offsetDragX = var_32_0
		end

		if arg_32_0.offsetY and arg_32_0.offsetY ~= 0 then
			local var_32_3 = var_32_1.y - arg_32_0.mouseInputDown.y

			var_32_0 = arg_32_0.offsetDragTargetY + var_32_3 / arg_32_0.offsetY
			arg_32_0.offsetDragY = var_32_0
		end

		if var_32_0 then
			arg_32_0:setTargetValue(arg_32_0:fixParameterTargetValue(var_32_0, arg_32_0.range, arg_32_0.rangeAbs, arg_32_0.dragDirect))
		end
	end

	arg_32_0._parameterUpdateFlag = true
end

function var_0_0.updateCircleDrag(arg_33_0)
	if not arg_33_0.offsetCirclePos then
		return
	end

	if arg_33_0._active and arg_33_0.mouseWorld ~= nil then
		if not arg_33_0.circleDragWorld then
			arg_33_0:onEventCallback(Live2D.EVENT_GET_WORLD_POSITION, {
				pos = arg_33_0.offsetCirclePos,
				name = arg_33_0.drawAbleName
			}, function(arg_34_0)
				arg_33_0.circleDragWorld = arg_34_0
			end)
		end

		local var_33_0 = (math.atan2(arg_33_0.mouseWorld.x - arg_33_0.circleDragWorld.x, arg_33_0.mouseWorld.y - arg_33_0.circleDragWorld.y) * math.rad2Deg + 360 - arg_33_0.offsetCircleStart) % 360 / 360
		local var_33_1 = arg_33_0.range[2] * var_33_0

		arg_33_0:setTargetValue(var_33_1)

		arg_33_0._parameterUpdateFlag = true
	elseif arg_33_0.parameterTargetValue ~= arg_33_0.parameterValue then
		arg_33_0._parameterUpdateFlag = true
	end
end

function var_0_0.updateGyro(arg_35_0)
	if not arg_35_0.gyro then
		return
	end

	if not Input.gyro.enabled then
		arg_35_0:setTargetValue(0)

		arg_35_0._parameterUpdateFlag = true

		return
	end

	local var_35_0 = Input.gyro and Input.gyro.attitude or Vector3.zero
	local var_35_1 = 0

	if arg_35_0.gyroX and not math.isnan(var_35_0.y) then
		var_35_1 = Mathf.Clamp(var_35_0.y * arg_35_0.sensitive, -0.5, 0.5)
	elseif arg_35_0.gyroY and not math.isnan(var_35_0.x) then
		var_35_1 = Mathf.Clamp(var_35_0.x * arg_35_0.sensitive, -0.5, 0.5)
	elseif arg_35_0.gyroZ and not math.isnan(var_35_0.z) then
		var_35_1 = Mathf.Clamp(var_35_0.z * arg_35_0.sensitive, -0.5, 0.5)
	end

	if IsUnityEditor then
		if L2D_USE_RANDOM_ATTI then
			if arg_35_0.randomAttitudeIndex == 0 then
				var_35_1 = math.random() - 0.5

				local var_35_2 = (var_35_1 + 0.5) * (arg_35_0.range[2] - arg_35_0.range[1]) + arg_35_0.range[1]

				arg_35_0:setTargetValue(var_35_2)

				arg_35_0.randomAttitudeIndex = L2D_RANDOM_PARAM
			elseif arg_35_0.randomAttitudeIndex > 0 then
				arg_35_0.randomAttitudeIndex = arg_35_0.randomAttitudeIndex - 1
			end
		end
	else
		local var_35_3 = (var_35_1 + 0.5) * (arg_35_0.range[2] - arg_35_0.range[1]) + arg_35_0.range[1]

		arg_35_0:setTargetValue(var_35_3)
	end

	arg_35_0._parameterUpdateFlag = true
end

function var_0_0.updateReactValue(arg_36_0)
	if not arg_36_0.reactX and not arg_36_0.reactY then
		return
	end

	local var_36_0
	local var_36_1 = false

	if arg_36_0.l2dIgnoreReact then
		var_36_0 = arg_36_0.parameterTargetValue
	elseif arg_36_0.reactX then
		var_36_0 = arg_36_0.reactPos.x * arg_36_0.reactX
		var_36_1 = true
	else
		var_36_0 = arg_36_0.reactPos.y * arg_36_0.reactY
		var_36_1 = true
	end

	if var_36_1 then
		arg_36_0:setTargetValue(arg_36_0:fixParameterTargetValue(var_36_0, arg_36_0.range, arg_36_0.rangeAbs, arg_36_0.dragDirect))
	end

	arg_36_0._parameterUpdateFlag = true
end

function var_0_0.updateParameterValue(arg_37_0)
	if arg_37_0.prepareTargetValue and not arg_37_0.l2dIsPlaying then
		arg_37_0:setTargetValue(arg_37_0.prepareTargetValue)

		arg_37_0.prepareTargetValue = nil
	end

	if arg_37_0._parameterUpdateFlag and arg_37_0.parameterValue ~= arg_37_0.parameterTargetValue then
		if math.abs(arg_37_0.parameterValue - arg_37_0.parameterTargetValue) < 0.01 then
			arg_37_0:setParameterValue(arg_37_0.parameterTargetValue)
		elseif arg_37_0.parameterSmoothTime and arg_37_0.parameterSmoothTime > 0 then
			local var_37_0 = arg_37_0.parameterValue
			local var_37_1 = arg_37_0.parameterTargetValue
			local var_37_2 = arg_37_0:checkUpdateParameterNum(var_37_1, var_37_0)
			local var_37_3, var_37_4 = Mathf.SmoothDamp(var_37_0, var_37_2, arg_37_0.parameterSmooth, arg_37_0.parameterSmoothTime)

			arg_37_0:setParameterValue(var_37_3, var_37_4)
		else
			arg_37_0:setParameterValue(arg_37_0.parameterTargetValue, 0)
		end
	end
end

function var_0_0.checkUpdateParameterNum(arg_38_0, arg_38_1, arg_38_2)
	if arg_38_0.offsetCirclePos and math.abs(arg_38_1 - arg_38_2) >= arg_38_0.rangeOffset / 2 then
		if arg_38_2 < arg_38_1 then
			arg_38_1 = arg_38_1 - arg_38_0.rangeOffset
		else
			arg_38_1 = arg_38_1 + arg_38_0.rangeOffset
		end
	end

	return arg_38_1
end

function var_0_0.updateRelationValue(arg_39_0)
	for iter_39_0, iter_39_1 in ipairs(arg_39_0._relationParameterList) do
		local var_39_0 = iter_39_1.data
		local var_39_1 = var_39_0.type
		local var_39_2 = var_39_0.relation_value
		local var_39_3 = var_39_0.target
		local var_39_4
		local var_39_5

		if var_39_1 == Live2D.relation_type_drag_x then
			var_39_4 = arg_39_0.offsetDragX or iter_39_1.start or arg_39_0.startValue or 0
			var_39_5 = true
		elseif var_39_1 == Live2D.relation_type_drag_y then
			var_39_4 = arg_39_0.offsetDragY or iter_39_1.start or arg_39_0.startValue or 0
			var_39_5 = true
		elseif var_39_1 == Live2D.relation_type_action_index then
			var_39_4 = var_39_2[arg_39_0.actionListIndex]
			var_39_4 = var_39_4 or 0
			var_39_5 = true
		elseif var_39_1 == Live2D.relation_type_idle then
			if arg_39_0.loadL2dStep and arg_39_0.l2dIdleIndex == var_39_0.idle then
				var_39_5 = true
			end

			if arg_39_0.l2dIsPlaying then
				if arg_39_0.l2dPlayActionName == arg_39_0.actionTrigger.action then
					arg_39_0.relationActive = true
				end
			else
				arg_39_0.relationActive = false
				arg_39_0.relationCountTime = nil
			end

			if not var_39_5 and arg_39_0.relationActive and arg_39_0.l2dIdleIndex == var_39_0.idle then
				if not arg_39_0.relationCountTime then
					arg_39_0.relationCountTime = Time.GetTimestamp() + var_39_0.time
				end

				if arg_39_0.relationCountTime and Time.GetTimestamp() >= arg_39_0.relationCountTime then
					var_39_5 = true
				end
			end
		else
			var_39_4 = arg_39_0.parameterTargetValue
			var_39_5 = false
		end

		local var_39_6
		local var_39_7

		if var_39_3 then
			var_39_6 = var_39_3
		else
			local var_39_8 = arg_39_0:fixRelationParameter(var_39_4, var_39_0)
			local var_39_9 = iter_39_1.value or arg_39_0.startValue
			local var_39_10 = iter_39_1.parameterSmooth or 0
			local var_39_11 = var_39_0.smooth and var_39_0.smooth / 1000 or arg_39_0.smooth

			var_39_6, var_39_7 = Mathf.SmoothDamp(var_39_9, var_39_8, var_39_10, var_39_11)
		end

		iter_39_1.value = var_39_6
		iter_39_1.parameterSmooth = var_39_7
		iter_39_1.enable = var_39_5
		iter_39_1.comId = arg_39_0.id
	end
end

function var_0_0.fixRelationParameter(arg_40_0, arg_40_1, arg_40_2)
	local var_40_0 = arg_40_2.range or arg_40_0.range
	local var_40_1 = arg_40_2.rangeAbs and arg_40_2.rangeAbs == 1 or arg_40_0.rangeAbs
	local var_40_2 = arg_40_2.drag_direct and arg_40_2.drag_direct or arg_40_0.dragDirect

	return arg_40_0:fixParameterTargetValue(arg_40_1, var_40_0, var_40_1, var_40_2)
end

function var_0_0.fixParameterTargetValue(arg_41_0, arg_41_1, arg_41_2, arg_41_3, arg_41_4)
	if arg_41_1 < 0 and arg_41_4 == 1 then
		arg_41_1 = 0
	elseif arg_41_1 > 0 and arg_41_4 == 2 then
		arg_41_1 = 0
	end

	arg_41_1 = arg_41_3 and math.abs(arg_41_1) or arg_41_1

	if arg_41_1 < arg_41_2[1] then
		arg_41_1 = arg_41_2[1]
	elseif arg_41_1 > arg_41_2[2] then
		arg_41_1 = arg_41_2[2]
	end

	return arg_41_1
end

function var_0_0.checkReset(arg_42_0)
	if not arg_42_0._active and arg_42_0.parameterToStart then
		if arg_42_0.parameterToStart > 0 then
			arg_42_0.parameterToStart = arg_42_0.parameterToStart - Time.deltaTime
		end

		if arg_42_0.parameterToStart <= 0 then
			arg_42_0:setTargetValue(arg_42_0.startValue)

			arg_42_0.parameterToStart = nil

			if arg_42_0.revertResetFlag then
				arg_42_0:setTriggerActionFlag(false)

				arg_42_0.revertResetFlag = false
			end

			if arg_42_0.offsetDragX then
				arg_42_0.offsetDragX = arg_42_0.startValue
				arg_42_0.offsetDragTargetX = arg_42_0.startValue
			end

			if arg_42_0.offsetDragY then
				arg_42_0.offsetDragY = arg_42_0.startValue
				arg_42_0.offsetDragTargetY = arg_42_0.startValue
			end
		end
	end
end

function var_0_0.setParameterValue(arg_43_0, arg_43_1, arg_43_2)
	if arg_43_1 then
		arg_43_0.parameterValue = arg_43_1
	end

	if arg_43_2 then
		arg_43_0.parameterSmooth = arg_43_2
	end
end

function var_0_0.updateState(arg_44_0)
	if not arg_44_0.lastFrameActive and arg_44_0._active then
		arg_44_0.firstActive = true
	else
		arg_44_0.firstActive = false
	end

	if arg_44_0.lastFrameActive and not arg_44_0._active then
		arg_44_0.firstStop = true
	else
		arg_44_0.firstStop = false
	end

	arg_44_0.lastFrameActive = arg_44_0._active
end

function var_0_0.updateTrigger(arg_45_0)
	if not arg_45_0:isActionTriggerAble() then
		return
	end

	local var_45_0 = arg_45_0.actionTrigger.type
	local var_45_1 = arg_45_0.actionTrigger.action
	local var_45_2

	if arg_45_0.actionTrigger.time then
		var_45_2 = arg_45_0.actionTrigger.time
	elseif arg_45_0.actionTrigger.action_list and arg_45_0.actionListIndex > 0 then
		var_45_2 = arg_45_0.actionTrigger.action_list[arg_45_0.actionListIndex].time
	end

	local var_45_3

	if arg_45_0.actionTrigger.num then
		var_45_3 = arg_45_0.actionTrigger.num
	elseif arg_45_0.actionTrigger.action_list and arg_45_0.actionTrigger.action_list[arg_45_0.actionListIndex].num and arg_45_0.actionListIndex > 0 then
		var_45_3 = arg_45_0.actionTrigger.action_list[arg_45_0.actionListIndex].num
	end

	if var_45_0 == Live2D.DRAG_TIME_ACTION then
		if arg_45_0._active then
			if math.abs(arg_45_0.parameterValue - var_45_3) < math.abs(var_45_3) * 0.25 then
				arg_45_0.triggerActionTime = arg_45_0.triggerActionTime + Time.deltaTime

				if var_45_2 < arg_45_0.triggerActionTime and not arg_45_0.l2dIsPlaying then
					arg_45_0:onEventCallback(Live2D.EVENT_ACTION_APPLY, {}, function(arg_46_0)
						if arg_46_0 then
							arg_45_0:onEventNotice(Live2D.ON_ACTION_DRAG_TRIGGER)
						end
					end)
				end
			else
				arg_45_0.triggerActionTime = arg_45_0.triggerActionTime + 0
			end
		end
	elseif var_45_0 == Live2D.DRAG_CLICK_ACTION then
		if arg_45_0:checkClickAction() then
			arg_45_0:onEventCallback(Live2D.EVENT_ACTION_APPLY, {}, function(arg_47_0)
				if arg_47_0 then
					arg_45_0:onEventNotice(Live2D.ON_ACTION_DRAG_CLICK)
				end
			end)
		end
	elseif var_45_0 == Live2D.DRAG_CLICK_RANGE then
		if arg_45_0:checkClickAction() then
			local var_45_4 = arg_45_0.actionTrigger.parameter and arg_45_0.actionTrigger.parameter or arg_45_0.parameterName
			local var_45_5 = var_45_3

			arg_45_0:onEventCallback(Live2D.EVENT_GET_PARAMETER, {
				name = var_45_4
			}, function(arg_48_0)
				print("获取到数值 " .. var_45_4 .. " = " .. arg_48_0)

				if arg_48_0 >= var_45_5[1] and arg_48_0 < var_45_5[2] then
					print("数值范围内，开始触发")
					arg_45_0:onEventCallback(Live2D.EVENT_ACTION_APPLY, {}, function(arg_49_0)
						if arg_49_0 then
							arg_45_0:onEventNotice(Live2D.ON_ACTION_DRAG_CLICK)
						end
					end)
				end
			end)
		end
	elseif var_45_0 == Live2D.DRAG_DOWN_ACTION then
		if arg_45_0._active then
			arg_45_0:setAbleWithFlag(true)

			if var_45_2 <= Time.time - arg_45_0.mouseInputDownTime then
				print("触发按压动作")
				arg_45_0:setAbleWithFlag(false)
				arg_45_0:onEventCallback(Live2D.EVENT_ACTION_APPLY, {}, function(arg_50_0)
					if arg_50_0 then
						arg_45_0:onEventNotice(Live2D.ON_ACTION_DOWN)
					end
				end)

				if arg_45_0.actionListIndex ~= 1 then
					arg_45_0:setTriggerActionFlag(false)
				end

				arg_45_0:setAbleWithFlag(true)

				arg_45_0.mouseInputDownTime = Time.time
			end
		elseif arg_45_0.actionTrigger.last and arg_45_0.actionListIndex ~= 1 then
			arg_45_0.actionListIndex = #arg_45_0.actionTrigger.action_list

			arg_45_0:setAbleWithFlag(false)
			arg_45_0:onEventCallback(Live2D.EVENT_ACTION_APPLY, {}, function(arg_51_0)
				return
			end)
			arg_45_0:resetNextTriggerTime()
			arg_45_0:setTriggerActionFlag(false)
		else
			arg_45_0:setAbleWithFlag(false)
		end
	elseif var_45_0 == Live2D.DRAG_RELATION_XY then
		if arg_45_0._active then
			local var_45_6 = arg_45_0:fixParameterTargetValue(arg_45_0.offsetDragX, arg_45_0.range, arg_45_0.rangeAbs, arg_45_0.dragDirect)
			local var_45_7 = arg_45_0:fixParameterTargetValue(arg_45_0.offsetDragY, arg_45_0.range, arg_45_0.rangeAbs, arg_45_0.dragDirect)
			local var_45_8 = var_45_3[1]
			local var_45_9 = var_45_3[2]

			if math.abs(var_45_6 - var_45_8) < math.abs(var_45_8) * 0.25 and math.abs(var_45_7 - var_45_9) < math.abs(var_45_9) * 0.25 then
				arg_45_0.triggerActionTime = arg_45_0.triggerActionTime + Time.deltaTime

				if var_45_2 < arg_45_0.triggerActionTime and not arg_45_0.l2dIsPlaying then
					arg_45_0:onEventCallback(Live2D.EVENT_ACTION_APPLY, {}, function(arg_52_0)
						if arg_52_0 then
							arg_45_0:onEventNotice(Live2D.ON_ACTION_XY_TRIGGER)
						end
					end)
				end
			else
				arg_45_0.triggerActionTime = arg_45_0.triggerActionTime + 0
			end
		end
	elseif var_45_0 == Live2D.DRAG_RELATION_IDLE then
		if arg_45_0.actionTrigger.const_fit then
			for iter_45_0 = 1, #arg_45_0.actionTrigger.const_fit do
				local var_45_10 = arg_45_0.actionTrigger.const_fit[iter_45_0]

				if arg_45_0.l2dIdleIndex == var_45_10.idle and not arg_45_0.l2dIsPlaying then
					arg_45_0:setTargetValue(var_45_10.target)
				end
			end
		end
	elseif var_45_0 == Live2D.DRAG_CLICK_MANY then
		if arg_45_0:checkClickAction() then
			arg_45_0:onEventCallback(Live2D.EVENT_ACTION_APPLY)
		end
	elseif var_45_0 == Live2D.DRAG_LISTENER_EVENT then
		if arg_45_0._listenerTrigger then
			arg_45_0:onEventCallback(Live2D.EVENT_ACTION_APPLY)
		end
	elseif var_45_0 == Live2D.DRAG_DOWN_TOUCH then
		arg_45_0:setAbleWithFlag(arg_45_0._active)

		if arg_45_0._active then
			local var_45_11 = Time.deltaTime / arg_45_0.actionTrigger.delta
			local var_45_12 = arg_45_0.parameterTargetValue + var_45_11
			local var_45_13 = arg_45_0:fixParameterTargetValue(var_45_12, arg_45_0.range, arg_45_0.rangeAbs, arg_45_0.dragDirect)

			arg_45_0:setTargetValue(var_45_13)
		end
	elseif var_45_0 == Live2D.DRAG_CLICK_PARAMETER then
		if arg_45_0:checkClickAction() then
			local var_45_14 = var_45_3
			local var_45_15 = arg_45_0.actionTrigger.parameter

			arg_45_0:onEventCallback(Live2D.EVENT_GET_PARAMETER, {
				name = var_45_15
			}, function(arg_53_0)
				if math.abs(var_45_14 - arg_53_0) <= 0.05 then
					print("数值允许播放，开始执行动作 " .. arg_45_0.actionTrigger.action)
					arg_45_0:onEventCallback(Live2D.EVENT_ACTION_APPLY, {}, function(arg_54_0)
						if arg_54_0 then
							arg_45_0:onEventNotice(Live2D.ON_ACTION_DRAG_CLICK)
						end
					end)
				end
			end)
		end
	elseif var_45_0 == Live2D.DRAG_ANIMATION_PLAY then
		local var_45_16 = arg_45_0.actionTrigger.trigger_name

		if arg_45_0.actionTrigger.trigger_index > 0 and arg_45_0.actionTrigger.trigger_name == "idle" then
			var_45_16 = var_45_16 .. arg_45_0.actionTrigger.trigger_index
		end

		if arg_45_0.stateInfo:IsName(var_45_16) and arg_45_0.l2dIdleIndex == arg_45_0.actionTrigger.trigger_index and arg_45_0.normalTime >= arg_45_0.actionTrigger.trigger_rate then
			arg_45_0:onEventCallback(Live2D.EVENT_ACTION_APPLY, {}, function()
				return
			end)
		end
	elseif var_45_0 == Live2D.DRAG_EXTEND_ACTION_RULE and not arg_45_0.extendActionFlag then
		arg_45_0.extendActionFlag = true
	end
end

function var_0_0.getExtendAction(arg_56_0)
	return arg_56_0.extendActionFlag
end

function var_0_0.checkActionInExtendFlag(arg_57_0, arg_57_1)
	local var_57_0 = false
	local var_57_1 = false

	if not arg_57_0.extendActionFlag then
		return var_57_0, var_57_1
	end

	local var_57_2 = arg_57_0.actionTrigger.parameter
	local var_57_3 = arg_57_0.actionTrigger.num
	local var_57_4 = false

	arg_57_0:onEventCallback(Live2D.EVENT_GET_DRAG_PARAMETER, {
		name = var_57_2
	}, function(arg_58_0)
		if arg_58_0 > var_57_3[1] and arg_58_0 <= var_57_3[2] then
			var_57_4 = true
		end
	end)

	if not var_57_4 then
		return var_57_0, var_57_0
	end

	local var_57_5 = arg_57_0.actionTriggerActive.ignore
	local var_57_6 = arg_57_0.actionTriggerActive.enable

	if var_57_5 and table.contains(var_57_5, arg_57_1) then
		var_57_0 = true
	end

	if var_57_6 and table.contains(var_57_6, arg_57_1) then
		var_57_1 = true
	end

	return var_57_0, var_57_1
end

function var_0_0.setAbleWithFlag(arg_59_0, arg_59_1)
	if arg_59_0.ableFlag ~= arg_59_1 then
		arg_59_0.ableFlag = arg_59_1

		arg_59_0:onEventCallback(Live2D.EVENT_ACTION_ABLE, {
			ableFlag = arg_59_1
		})
	end
end

function var_0_0.triggerAction(arg_60_0)
	arg_60_0.nextTriggerTime = arg_60_0.limitTime

	arg_60_0:setTriggerActionFlag(true)
end

function var_0_0.isActionTriggerAble(arg_61_0)
	if arg_61_0.actionTrigger.type == nil then
		return false
	end

	if not arg_61_0.actionTrigger or arg_61_0.actionTrigger == "" then
		return false
	end

	if arg_61_0.nextTriggerTime - Time.deltaTime >= 0 then
		arg_61_0.nextTriggerTime = arg_61_0.nextTriggerTime - Time.deltaTime

		return false
	end

	if arg_61_0.isTriggerAtion then
		return false
	end

	return true
end

function var_0_0.updateStateData(arg_62_0, arg_62_1)
	if arg_62_0.l2dIdleIndex ~= arg_62_1.idleIndex then
		if type(arg_62_0.revertIdleIndex) == "boolean" and arg_62_0.revertIdleIndex == true then
			arg_62_0:setTargetValue(arg_62_0.startValue)
		elseif type(arg_62_0.revertIdleIndex) == "table" and table.contains(arg_62_0.revertIdleIndex, arg_62_1.idleIndex) then
			arg_62_0:setTargetValue(arg_62_0.startValue)
		end
	end

	arg_62_0.lastActionIndex = arg_62_0.actionListIndex

	if arg_62_1.isPlaying and arg_62_0.actionTrigger.reset_index_action and arg_62_1.actionName and table.contains(arg_62_0.actionTrigger.reset_index_action, arg_62_1.actionName) then
		arg_62_0.actionListIndex = 1
	end

	if arg_62_0.revertActionIndex and arg_62_0.lastActionIndex ~= arg_62_0.actionListIndex then
		arg_62_0:setTargetValue(arg_62_0.startValue)
	end

	arg_62_0.l2dIdleIndex = arg_62_1.idleIndex
	arg_62_0.l2dIsPlaying = arg_62_1.isPlaying
	arg_62_0.l2dIgnoreReact = arg_62_1.ignoreReact
	arg_62_0.l2dPlayActionName = arg_62_1.actionName

	if not arg_62_0.l2dIsPlaying and arg_62_0.isTriggerAtion then
		arg_62_0:setTriggerActionFlag(false)
	end

	if arg_62_0.l2dIdleIndex and arg_62_0.idleOn and #arg_62_0.idleOn > 0 then
		arg_62_0.reactConditionFlag = not table.contains(arg_62_0.idleOn, arg_62_0.l2dIdleIndex)
	end

	if arg_62_0.l2dIdleIndex and arg_62_0.idleOff and #arg_62_0.idleOff > 0 then
		arg_62_0.reactConditionFlag = table.contains(arg_62_0.idleOff, arg_62_0.l2dIdleIndex)
	end
end

function var_0_0.checkClickAction(arg_63_0)
	if arg_63_0.firstActive then
		arg_63_0:setAbleWithFlag(true)
	elseif arg_63_0.firstStop then
		local var_63_0 = math.abs(arg_63_0.mouseInputUp.x - arg_63_0.mouseInputDown.x) < 30 and math.abs(arg_63_0.mouseInputUp.y - arg_63_0.mouseInputDown.y) < 30
		local var_63_1 = arg_63_0.mouseInputUpTime - arg_63_0.mouseInputDownTime < 0.5

		if var_63_0 and var_63_1 and not arg_63_0.l2dIsPlaying then
			arg_63_0.clickTriggerTime = 0.01
			arg_63_0.clickApplyFlag = true
		else
			arg_63_0:setAbleWithFlag(false)
		end
	elseif arg_63_0.clickTriggerTime and arg_63_0.clickTriggerTime > 0 then
		arg_63_0.clickTriggerTime = arg_63_0.clickTriggerTime - Time.deltaTime

		if arg_63_0.clickTriggerTime <= 0 then
			arg_63_0.clickTriggerTime = nil

			arg_63_0:setAbleWithFlag(false)

			if arg_63_0.clickApplyFlag then
				arg_63_0.clickApplyFlag = false

				return true
			end
		end
	end

	return false
end

function var_0_0.saveData(arg_64_0)
	local var_64_0 = arg_64_0.id
	local var_64_1 = arg_64_0.live2dData:GetShipSkinConfig().id
	local var_64_2 = arg_64_0.live2dData.ship.id

	if arg_64_0.revert == -1 and arg_64_0.saveParameterFlag then
		Live2dConst.SaveDragData(var_64_0, var_64_1, var_64_2, arg_64_0.parameterTargetValue)
	end

	if arg_64_0.actionTrigger.type == Live2D.DRAG_CLICK_MANY then
		print("保存actionListIndex" .. arg_64_0.actionListIndex)
		Live2dConst.SetDragActionIndex(var_64_0, var_64_1, var_64_2, arg_64_0.actionListIndex)
	end

	if arg_64_0._relationFlag then
		Live2dConst.SetRelationData(var_64_0, var_64_1, var_64_2, arg_64_0:getRelationSaveData())
	end
end

function var_0_0.loadData(arg_65_0)
	local var_65_0 = arg_65_0.id
	local var_65_1 = arg_65_0.live2dData:GetShipSkinConfig().id
	local var_65_2 = arg_65_0.live2dData.ship.id

	if arg_65_0.revert == -1 and arg_65_0.saveParameterFlag then
		local var_65_3 = Live2dConst.GetDragData(arg_65_0.id, arg_65_0.live2dData:GetShipSkinConfig().id, arg_65_0.live2dData.ship.id)

		if var_65_3 then
			arg_65_0:setParameterValue(var_65_3)
			arg_65_0:setTargetValue(var_65_3)
		end

		if var_65_3 == arg_65_0.startValue and arg_65_0._relationParameterList and #arg_65_0._relationParameterList > 0 then
			arg_65_0:clearRelationValue()
		end
	end

	if arg_65_0.actionTrigger.type == Live2D.DRAG_CLICK_MANY then
		arg_65_0.actionListIndex = Live2dConst.GetDragActionIndex(arg_65_0.id, arg_65_0.live2dData:GetShipSkinConfig().id, arg_65_0.live2dData.ship.id) or 1
	end

	if arg_65_0._relationFlag then
		local var_65_4 = Live2dConst.GetRelationData(var_65_0, var_65_1, var_65_2)

		arg_65_0.offsetDragX = var_65_4.drag_x and var_65_4.drag_x or arg_65_0.startValue
		arg_65_0.offsetDragY = var_65_4.drag_y and var_65_4.drag_y or arg_65_0.startValue
	end
end

function var_0_0.getRelationSaveData(arg_66_0)
	return {
		[Live2dConst.RELATION_DRAG_X] = arg_66_0.offsetDragX,
		[Live2dConst.RELATION_DRAG_Y] = arg_66_0.offsetDragY
	}
end

function var_0_0.clearRelationValue(arg_67_0)
	if arg_67_0._relationParameterList and #arg_67_0._relationParameterList > 0 then
		for iter_67_0 = 1, #arg_67_0._relationParameterList do
			local var_67_0 = arg_67_0._relationParameterList[iter_67_0]

			if var_67_0.data.type == Live2D.relation_type_drag_x or var_67_0.data.type == Live2D.relation_type_drag_y then
				var_67_0.value = var_67_0.start or arg_67_0.startValue or 0
				var_67_0.enable = true
			end

			arg_67_0.offsetDragX, arg_67_0.offsetDragY = arg_67_0.startValue, arg_67_0.startValue
		end
	end
end

function var_0_0.loadL2dFinal(arg_68_0)
	arg_68_0.loadL2dStep = true
end

function var_0_0.clearData(arg_69_0)
	if arg_69_0.revert == -1 then
		arg_69_0.actionListIndex = 1

		arg_69_0:setParameterValue(arg_69_0.startValue)
		arg_69_0:setTargetValue(arg_69_0.startValue)
		arg_69_0:clearRelationValue()
	end
end

function var_0_0.setTriggerActionFlag(arg_70_0, arg_70_1)
	arg_70_0.isTriggerAtion = arg_70_1
end

function var_0_0.dispose(arg_71_0)
	arg_71_0._active = false
	arg_71_0._parameterCom = nil
	arg_71_0.parameterValue = arg_71_0.startValue
	arg_71_0.parameterTargetValue = 0
	arg_71_0.parameterSmooth = 0
	arg_71_0.mouseInputDown = Vector2(0, 0)
	arg_71_0.live2dData = nil
end

return var_0_0
