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
	arg_1_0.offsetDragTargetX = arg_1_0.startValue
	arg_1_0.offsetDragTargetY = arg_1_0.startValue
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
								print(arg_2_0.parameterName .. " 数值变更为" .. arg_2_0.parameterTargetValue)
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

			if var_2_15 == 1 and var_2_6 then
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

				if var_2_18 then
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
		-- block empty
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

function var_0_0.startDrag(arg_4_0)
	if arg_4_0.ignoreAction and arg_4_0.l2dIsPlaying then
		return
	end

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

function var_0_0.stopDrag(arg_5_0)
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

		arg_5_0:updatePartsParameter()
		arg_5_0:saveData()
	end
end

function var_0_0.checkResetTriggerTime(arg_6_0)
	local var_6_0 = false

	if arg_6_0.actionTrigger.type == Live2D.DRAG_DOWN_ACTION and arg_6_0.actionTrigger.last then
		var_6_0 = true
	end

	if var_6_0 then
		arg_6_0:resetNextTriggerTime()
	end
end

function var_0_0.resetNextTriggerTime(arg_7_0)
	arg_7_0.nextTriggerTime = 0
end

function var_0_0.updatePartsParameter(arg_8_0)
	if type(arg_8_0.partsData) == "table" then
		local var_8_0 = arg_8_0.partsData.parts
		local var_8_1 = arg_8_0.partsData.type
		local var_8_2 = false

		if arg_8_0.offsetX or arg_8_0.offsetY then
			var_8_2 = true
		elseif arg_8_0.actionTrigger and arg_8_0.actionTrigger.type == Live2D.DRAG_DOWN_TOUCH then
			var_8_2 = true
		end

		if var_8_2 then
			local var_8_3 = arg_8_0.parameterTargetValue
			local var_8_4
			local var_8_5

			for iter_8_0 = 1, #var_8_0 do
				local var_8_6 = var_8_0[iter_8_0]
				local var_8_7 = math.abs(var_8_3 - var_8_6)

				if var_8_1 == var_0_3 or not var_8_1 then
					if not var_8_4 or var_8_7 < var_8_4 then
						var_8_4 = var_8_7
						var_8_5 = iter_8_0
					end
				elseif var_8_1 == var_0_4 then
					if var_8_6 <= var_8_3 and (not var_8_4 or var_8_7 < var_8_4) then
						var_8_4 = var_8_7
						var_8_5 = iter_8_0
					end
				elseif var_8_1 == var_0_5 and var_8_3 <= var_8_6 and (not var_8_4 or var_8_7 < var_8_4) then
					var_8_4 = var_8_7
					var_8_5 = iter_8_0
				end
			end

			if var_8_5 then
				if math.abs(arg_8_0.parameterTargetValue - var_8_0[var_8_5]) >= 0.05 then
					print("吸附数值" .. var_8_0[var_8_5])
				end

				arg_8_0:setTargetValue(var_8_0[var_8_5])
			end
		end
	end
end

function var_0_0.getIgnoreReact(arg_9_0)
	return arg_9_0.ignoreReact
end

function var_0_0.setParameterCom(arg_10_0, arg_10_1)
	if not arg_10_1 then
		print("live2dDrag id:" .. tostring(arg_10_0.id) .. "设置了null的组件(该打印非报错)")
	end

	arg_10_0._parameterCom = arg_10_1
end

function var_0_0.getParameterCom(arg_11_0)
	return arg_11_0._parameterCom
end

function var_0_0.addRelationComData(arg_12_0, arg_12_1, arg_12_2)
	table.insert(arg_12_0._relationParameterList, {
		com = arg_12_1,
		data = arg_12_2
	})
end

function var_0_0.getRelationParameterList(arg_13_0)
	return arg_13_0._relationParameterList
end

function var_0_0.getReactCondition(arg_14_0)
	return arg_14_0.reactConditionFlag
end

function var_0_0.getActive(arg_15_0)
	return arg_15_0._active
end

function var_0_0.getParameterUpdateFlag(arg_16_0)
	return arg_16_0._parameterUpdateFlag
end

function var_0_0.setEventCallback(arg_17_0, arg_17_1)
	arg_17_0._eventCallback = arg_17_1
end

function var_0_0.onEventCallback(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
	if arg_18_1 == Live2D.EVENT_ACTION_APPLY then
		local var_18_0 = {}
		local var_18_1
		local var_18_2 = false
		local var_18_3
		local var_18_4
		local var_18_5
		local var_18_6 = false

		if arg_18_0.actionTrigger.action then
			var_18_1 = arg_18_0:fillterAction(arg_18_0.actionTrigger.action)
			var_18_0 = arg_18_0.actionTriggerActive
			var_18_2 = arg_18_0.actionTrigger.focus or false
			var_18_3 = arg_18_0.actionTrigger.target or nil
			var_18_6 = arg_18_0.actionTrigger.target_focus == 1 and true or false

			if (arg_18_0.actionTrigger.circle or nil) and var_18_3 and var_18_3 == arg_18_0.parameterTargetValue then
				var_18_3 = arg_18_0.startValue
			end

			var_18_4 = arg_18_0.actionTrigger.react or nil

			arg_18_0:triggerAction()
			arg_18_0:stopDrag()
		elseif arg_18_0.actionTrigger.action_list then
			local var_18_7 = arg_18_0.actionTrigger.action_list[arg_18_0.actionListIndex]

			var_18_1 = arg_18_0:fillterAction(var_18_7.action)

			if arg_18_0.actionTriggerActive.active_list and arg_18_0.actionListIndex <= #arg_18_0.actionTriggerActive.active_list then
				var_18_0 = arg_18_0.actionTriggerActive.active_list[arg_18_0.actionListIndex]
			else
				var_18_0 = arg_18_0.actionTriggerActive
			end

			var_18_2 = var_18_7.focus or true
			var_18_3 = var_18_7.target or nil
			var_18_6 = var_18_7.target_focus == 1 and true or false
			var_18_4 = var_18_7.react or nil

			arg_18_0:triggerAction()

			if arg_18_0.actionListIndex == #arg_18_0.actionTrigger.action_list then
				arg_18_0:stopDrag()

				arg_18_0.actionListIndex = 1
			else
				arg_18_0.actionListIndex = arg_18_0.actionListIndex + 1
			end
		elseif not arg_18_0.actionTrigger.action then
			var_18_1 = arg_18_0:fillterAction(arg_18_0.actionTrigger.action)
			var_18_0 = arg_18_0.actionTriggerActive
			var_18_2 = arg_18_0.actionTrigger.focus or false
			var_18_3 = arg_18_0.actionTrigger.target or nil
			var_18_6 = arg_18_0.actionTrigger.target_focus == 1 and true or false

			local var_18_8 = arg_18_0.actionTrigger.circle or nil

			var_18_4 = arg_18_0.actionTrigger.react or nil

			if var_18_8 and var_18_3 and var_18_3 == arg_18_0.parameterTargetValue then
				var_18_3 = arg_18_0.startValue
			end

			arg_18_0:triggerAction()
			arg_18_0:setTriggerActionFlag(false)
			arg_18_0:stopDrag()
		end

		if var_18_0.idle then
			if type(var_18_0.idle) == "number" then
				if var_18_0.idle == arg_18_0.l2dIdleIndex and not var_18_0.repeat_flag then
					return
				end
			elseif type(var_18_0.idle) == "table" and #var_18_0.idle == 1 and var_18_0.idle[1] == arg_18_0.l2dIdleIndex and not var_18_0.repeat_flag then
				return
			end
		end

		if var_18_3 then
			arg_18_0:setTargetValue(var_18_3)

			if var_18_6 then
				arg_18_0:setParameterValue(var_18_3)
			end

			if not var_18_1 then
				arg_18_0.revertResetFlag = true
			end
		end

		arg_18_2 = {
			id = arg_18_0.id,
			action = var_18_1,
			activeData = var_18_0,
			focus = var_18_2,
			react = var_18_4,
			callback = arg_18_3,
			finishCall = function()
				arg_18_0:actionApplyFinish()
			end
		}
	elseif arg_18_1 == Live2D.EVENT_ACTION_ABLE then
		-- block empty
	elseif arg_18_1 == Live2D.EVENT_CHANGE_IDLE_INDEX then
		print("change idle")
	elseif arg_18_1 == Live2D.EVENT_GET_PARAMETER then
		arg_18_2.callback = arg_18_3
	end

	arg_18_0._eventCallback(arg_18_1, arg_18_2)
end

function var_0_0.fillterAction(arg_20_0, arg_20_1)
	if type(arg_20_1) == "table" then
		return arg_20_1[math.random(1, #arg_20_1)]
	else
		return arg_20_1
	end
end

function var_0_0.onEventNotice(arg_21_0, arg_21_1)
	if arg_21_0._eventCallback then
		local var_21_0 = arg_21_0:getCommonNoticeData()

		arg_21_0._eventCallback(arg_21_1, var_21_0)
	end
end

function var_0_0.getCommonNoticeData(arg_22_0)
	return {
		draw_able_name = arg_22_0.drawAbleName,
		parameter_name = arg_22_0.parameterName,
		parameter_target = arg_22_0.parameterTargetValue
	}
end

function var_0_0.setTargetValue(arg_23_0, arg_23_1)
	arg_23_0.parameterTargetValue = arg_23_1
end

function var_0_0.getParameter(arg_24_0)
	return arg_24_0.parameterValue
end

function var_0_0.getParameToTargetFlag(arg_25_0)
	if arg_25_0.parameterValue ~= arg_25_0.parameterTargetValue then
		return true
	end

	if arg_25_0.parameterToStart and arg_25_0.parameterToStart > 0 then
		return true
	end

	return false
end

function var_0_0.actionApplyFinish(arg_26_0)
	return
end

function var_0_0.stepParameter(arg_27_0)
	arg_27_0:updateState()
	arg_27_0:updateTrigger()
	arg_27_0:updateParameterUpdateFlag()
	arg_27_0:updateGyro()
	arg_27_0:updateDrag()
	arg_27_0:updateReactValue()
	arg_27_0:updateParameterValue()
	arg_27_0:updateRelationValue()
	arg_27_0:checkReset()

	arg_27_0.loadL2dStep = false
end

function var_0_0.updateParameterUpdateFlag(arg_28_0)
	if arg_28_0.actionTrigger.type == Live2D.DRAG_CLICK_ACTION then
		arg_28_0._parameterUpdateFlag = true
	elseif arg_28_0.actionTrigger.type == Live2D.DRAG_RELATION_IDLE then
		if not arg_28_0._parameterUpdateFlag then
			if not arg_28_0.l2dIsPlaying then
				arg_28_0._parameterUpdateFlag = true

				arg_28_0:changeParameComAble(true)
			elseif not table.contains(arg_28_0.actionTrigger.remove_com_list, arg_28_0.l2dPlayActionName) then
				arg_28_0._parameterUpdateFlag = true

				arg_28_0:changeParameComAble(true)
			end
		elseif arg_28_0._parameterUpdateFlag == true and arg_28_0.l2dIsPlaying and table.contains(arg_28_0.actionTrigger.remove_com_list, arg_28_0.l2dPlayActionName) then
			arg_28_0._parameterUpdateFlag = false

			arg_28_0:changeParameComAble(false)
		end
	elseif arg_28_0.actionTrigger.type == Live2D.DRAG_DOWN_TOUCH then
		arg_28_0._parameterUpdateFlag = true
	elseif arg_28_0.actionTrigger.type == Live2D.DRAG_LISTENER_EVENT then
		arg_28_0._parameterUpdateFlag = true
	else
		arg_28_0._parameterUpdateFlag = false
	end
end

function var_0_0.changeParameComAble(arg_29_0, arg_29_1)
	if arg_29_0.parameterComAdd == arg_29_1 then
		return
	end

	arg_29_0.parameterComAdd = arg_29_1

	if arg_29_1 then
		arg_29_0:onEventCallback(Live2D.EVENT_ADD_PARAMETER_COM, {
			com = arg_29_0._parameterCom,
			start = arg_29_0.startValue,
			mode = arg_29_0.mode
		})
	else
		arg_29_0:onEventCallback(Live2D.EVENT_REMOVE_PARAMETER_COM, {
			com = arg_29_0._parameterCom,
			mode = arg_29_0.mode
		})
	end
end

function var_0_0.updateDrag(arg_30_0)
	if not arg_30_0.offsetX and not arg_30_0.offsetY then
		return
	end

	local var_30_0

	if arg_30_0._active then
		local var_30_1 = Input.mousePosition

		if arg_30_0.offsetX and arg_30_0.offsetX ~= 0 then
			local var_30_2 = var_30_1.x - arg_30_0.mouseInputDown.x

			var_30_0 = arg_30_0.offsetDragTargetX + var_30_2 / arg_30_0.offsetX
			arg_30_0.offsetDragX = var_30_0
		end

		if arg_30_0.offsetY and arg_30_0.offsetY ~= 0 then
			local var_30_3 = var_30_1.y - arg_30_0.mouseInputDown.y

			var_30_0 = arg_30_0.offsetDragTargetY + var_30_3 / arg_30_0.offsetY
			arg_30_0.offsetDragY = var_30_0
		end

		if var_30_0 then
			arg_30_0:setTargetValue(arg_30_0:fixParameterTargetValue(var_30_0, arg_30_0.range, arg_30_0.rangeAbs, arg_30_0.dragDirect))
		end
	end

	arg_30_0._parameterUpdateFlag = true
end

function var_0_0.updateGyro(arg_31_0)
	if not arg_31_0.gyro then
		return
	end

	if not Input.gyro.enabled then
		arg_31_0:setTargetValue(0)

		arg_31_0._parameterUpdateFlag = true

		return
	end

	local var_31_0 = Input.gyro and Input.gyro.attitude or Vector3.zero
	local var_31_1 = 0

	if arg_31_0.gyroX and not math.isnan(var_31_0.y) then
		var_31_1 = Mathf.Clamp(var_31_0.y * arg_31_0.sensitive, -0.5, 0.5)
	elseif arg_31_0.gyroY and not math.isnan(var_31_0.x) then
		var_31_1 = Mathf.Clamp(var_31_0.x * arg_31_0.sensitive, -0.5, 0.5)
	elseif arg_31_0.gyroZ and not math.isnan(var_31_0.z) then
		var_31_1 = Mathf.Clamp(var_31_0.z * arg_31_0.sensitive, -0.5, 0.5)
	end

	if IsUnityEditor then
		if L2D_USE_RANDOM_ATTI then
			if arg_31_0.randomAttitudeIndex == 0 then
				var_31_1 = math.random() - 0.5

				local var_31_2 = (var_31_1 + 0.5) * (arg_31_0.range[2] - arg_31_0.range[1]) + arg_31_0.range[1]

				arg_31_0:setTargetValue(var_31_2)

				arg_31_0.randomAttitudeIndex = L2D_RANDOM_PARAM
			elseif arg_31_0.randomAttitudeIndex > 0 then
				arg_31_0.randomAttitudeIndex = arg_31_0.randomAttitudeIndex - 1
			end
		end
	else
		local var_31_3 = (var_31_1 + 0.5) * (arg_31_0.range[2] - arg_31_0.range[1]) + arg_31_0.range[1]

		arg_31_0:setTargetValue(var_31_3)
	end

	arg_31_0._parameterUpdateFlag = true
end

function var_0_0.updateReactValue(arg_32_0)
	if not arg_32_0.reactX and not arg_32_0.reactY then
		return
	end

	local var_32_0
	local var_32_1 = false

	if arg_32_0.l2dIgnoreReact then
		var_32_0 = arg_32_0.parameterTargetValue
	elseif arg_32_0.reactX then
		var_32_0 = arg_32_0.reactPos.x * arg_32_0.reactX
		var_32_1 = true
	else
		var_32_0 = arg_32_0.reactPos.y * arg_32_0.reactY
		var_32_1 = true
	end

	if var_32_1 then
		arg_32_0:setTargetValue(arg_32_0:fixParameterTargetValue(var_32_0, arg_32_0.range, arg_32_0.rangeAbs, arg_32_0.dragDirect))
	end

	arg_32_0._parameterUpdateFlag = true
end

function var_0_0.updateParameterValue(arg_33_0)
	if arg_33_0.prepareTargetValue and not arg_33_0.l2dIsPlaying then
		arg_33_0:setTargetValue(arg_33_0.prepareTargetValue)

		arg_33_0.prepareTargetValue = nil
	end

	if arg_33_0._parameterUpdateFlag and arg_33_0.parameterValue ~= arg_33_0.parameterTargetValue then
		if math.abs(arg_33_0.parameterValue - arg_33_0.parameterTargetValue) < 0.01 then
			arg_33_0:setParameterValue(arg_33_0.parameterTargetValue)
		elseif arg_33_0.parameterSmoothTime and arg_33_0.parameterSmoothTime > 0 then
			local var_33_0, var_33_1 = Mathf.SmoothDamp(arg_33_0.parameterValue, arg_33_0.parameterTargetValue, arg_33_0.parameterSmooth, arg_33_0.parameterSmoothTime)

			arg_33_0:setParameterValue(var_33_0, var_33_1)
		else
			arg_33_0:setParameterValue(arg_33_0.parameterTargetValue, 0)
		end
	end
end

function var_0_0.updateRelationValue(arg_34_0)
	for iter_34_0, iter_34_1 in ipairs(arg_34_0._relationParameterList) do
		local var_34_0 = iter_34_1.data
		local var_34_1 = var_34_0.type
		local var_34_2 = var_34_0.relation_value
		local var_34_3 = var_34_0.target
		local var_34_4
		local var_34_5

		if var_34_1 == Live2D.relation_type_drag_x then
			var_34_4 = arg_34_0.offsetDragX or iter_34_1.start or arg_34_0.startValue or 0
			var_34_5 = true
		elseif var_34_1 == Live2D.relation_type_drag_y then
			var_34_4 = arg_34_0.offsetDragY or iter_34_1.start or arg_34_0.startValue or 0
			var_34_5 = true
		elseif var_34_1 == Live2D.relation_type_action_index then
			var_34_4 = var_34_2[arg_34_0.actionListIndex]
			var_34_4 = var_34_4 or 0
			var_34_5 = true
		elseif var_34_1 == Live2D.relation_type_idle then
			if arg_34_0.loadL2dStep and arg_34_0.l2dIdleIndex == var_34_0.idle then
				var_34_5 = true
			end

			if arg_34_0.l2dIsPlaying then
				if arg_34_0.l2dPlayActionName == arg_34_0.actionTrigger.action then
					arg_34_0.relationActive = true
				end
			else
				arg_34_0.relationActive = false
				arg_34_0.relationCountTime = nil
			end

			if not var_34_5 and arg_34_0.relationActive and arg_34_0.l2dIdleIndex == var_34_0.idle then
				if not arg_34_0.relationCountTime then
					arg_34_0.relationCountTime = Time.GetTimestamp() + var_34_0.time
				end

				if arg_34_0.relationCountTime and Time.GetTimestamp() >= arg_34_0.relationCountTime then
					var_34_5 = true
				end
			end
		else
			var_34_4 = arg_34_0.parameterTargetValue
			var_34_5 = false
		end

		local var_34_6
		local var_34_7

		if var_34_3 then
			var_34_6 = var_34_3
		else
			local var_34_8 = arg_34_0:fixRelationParameter(var_34_4, var_34_0)
			local var_34_9 = iter_34_1.value or arg_34_0.startValue
			local var_34_10 = iter_34_1.parameterSmooth or 0
			local var_34_11 = var_34_0.smooth and var_34_0.smooth / 1000 or arg_34_0.smooth

			var_34_6, var_34_7 = Mathf.SmoothDamp(var_34_9, var_34_8, var_34_10, var_34_11)
		end

		iter_34_1.value = var_34_6
		iter_34_1.parameterSmooth = var_34_7
		iter_34_1.enable = var_34_5
		iter_34_1.comId = arg_34_0.id
	end
end

function var_0_0.fixRelationParameter(arg_35_0, arg_35_1, arg_35_2)
	local var_35_0 = arg_35_2.range or arg_35_0.range
	local var_35_1 = arg_35_2.rangeAbs and arg_35_2.rangeAbs == 1 or arg_35_0.rangeAbs
	local var_35_2 = arg_35_2.drag_direct and arg_35_2.drag_direct or arg_35_0.dragDirect

	return arg_35_0:fixParameterTargetValue(arg_35_1, var_35_0, var_35_1, var_35_2)
end

function var_0_0.fixParameterTargetValue(arg_36_0, arg_36_1, arg_36_2, arg_36_3, arg_36_4)
	if arg_36_1 < 0 and arg_36_4 == 1 then
		arg_36_1 = 0
	elseif arg_36_1 > 0 and arg_36_4 == 2 then
		arg_36_1 = 0
	end

	arg_36_1 = arg_36_3 and math.abs(arg_36_1) or arg_36_1

	if arg_36_1 < arg_36_2[1] then
		arg_36_1 = arg_36_2[1]
	elseif arg_36_1 > arg_36_2[2] then
		arg_36_1 = arg_36_2[2]
	end

	return arg_36_1
end

function var_0_0.checkReset(arg_37_0)
	if not arg_37_0._active and arg_37_0.parameterToStart then
		if arg_37_0.parameterToStart > 0 then
			arg_37_0.parameterToStart = arg_37_0.parameterToStart - Time.deltaTime
		end

		if arg_37_0.parameterToStart <= 0 then
			arg_37_0:setTargetValue(arg_37_0.startValue)

			arg_37_0.parameterToStart = nil

			if arg_37_0.revertResetFlag then
				arg_37_0:setTriggerActionFlag(false)

				arg_37_0.revertResetFlag = false
			end

			if arg_37_0.offsetDragX then
				arg_37_0.offsetDragX = arg_37_0.startValue
				arg_37_0.offsetDragTargetX = arg_37_0.startValue
			end

			if arg_37_0.offsetDragY then
				arg_37_0.offsetDragY = arg_37_0.startValue
				arg_37_0.offsetDragTargetY = arg_37_0.startValue
			end
		end
	end
end

function var_0_0.changeReactValue(arg_38_0, arg_38_1)
	arg_38_0.reactPos = arg_38_1
end

function var_0_0.setParameterValue(arg_39_0, arg_39_1, arg_39_2)
	if arg_39_1 then
		arg_39_0.parameterValue = arg_39_1
	end

	if arg_39_2 then
		arg_39_0.parameterSmooth = arg_39_2
	end
end

function var_0_0.updateState(arg_40_0)
	if not arg_40_0.lastFrameActive and arg_40_0._active then
		arg_40_0.firstActive = true
	else
		arg_40_0.firstActive = false
	end

	if arg_40_0.lastFrameActive and not arg_40_0._active then
		arg_40_0.firstStop = true
	else
		arg_40_0.firstStop = false
	end

	arg_40_0.lastFrameActive = arg_40_0._active
end

function var_0_0.updateTrigger(arg_41_0)
	if not arg_41_0:isActionTriggerAble() then
		return
	end

	local var_41_0 = arg_41_0.actionTrigger.type
	local var_41_1 = arg_41_0.actionTrigger.action
	local var_41_2

	if arg_41_0.actionTrigger.time then
		var_41_2 = arg_41_0.actionTrigger.time
	elseif arg_41_0.actionTrigger.action_list and arg_41_0.actionListIndex > 0 then
		var_41_2 = arg_41_0.actionTrigger.action_list[arg_41_0.actionListIndex].time
	end

	local var_41_3

	if arg_41_0.actionTrigger.num then
		var_41_3 = arg_41_0.actionTrigger.num
	elseif arg_41_0.actionTrigger.action_list and arg_41_0.actionTrigger.action_list[arg_41_0.actionListIndex].num and arg_41_0.actionListIndex > 0 then
		var_41_3 = arg_41_0.actionTrigger.action_list[arg_41_0.actionListIndex].num
	end

	if var_41_0 == Live2D.DRAG_TIME_ACTION then
		if arg_41_0._active then
			if math.abs(arg_41_0.parameterValue - var_41_3) < math.abs(var_41_3) * 0.25 then
				arg_41_0.triggerActionTime = arg_41_0.triggerActionTime + Time.deltaTime

				if var_41_2 < arg_41_0.triggerActionTime and not arg_41_0.l2dIsPlaying then
					arg_41_0:onEventCallback(Live2D.EVENT_ACTION_APPLY, {}, function(arg_42_0)
						if arg_42_0 then
							arg_41_0:onEventNotice(Live2D.ON_ACTION_DRAG_TRIGGER)
						end
					end)
				end
			else
				arg_41_0.triggerActionTime = arg_41_0.triggerActionTime + 0
			end
		end
	elseif var_41_0 == Live2D.DRAG_CLICK_ACTION then
		if arg_41_0:checkClickAction() then
			arg_41_0:onEventCallback(Live2D.EVENT_ACTION_APPLY, {}, function(arg_43_0)
				if arg_43_0 then
					arg_41_0:onEventNotice(Live2D.ON_ACTION_DRAG_CLICK)
				end
			end)
		end
	elseif var_41_0 == Live2D.DRAG_DOWN_ACTION then
		if arg_41_0._active then
			arg_41_0:setAbleWithFlag(true)

			if var_41_2 <= Time.time - arg_41_0.mouseInputDownTime then
				print("触发按压动作")
				arg_41_0:setAbleWithFlag(false)
				arg_41_0:onEventCallback(Live2D.EVENT_ACTION_APPLY, {}, function(arg_44_0)
					if arg_44_0 then
						arg_41_0:onEventNotice(Live2D.ON_ACTION_DOWN)
					end
				end)

				if arg_41_0.actionListIndex ~= 1 then
					arg_41_0:setTriggerActionFlag(false)
				end

				arg_41_0:setAbleWithFlag(true)

				arg_41_0.mouseInputDownTime = Time.time
			end
		elseif arg_41_0.actionTrigger.last and arg_41_0.actionListIndex ~= 1 then
			arg_41_0.actionListIndex = #arg_41_0.actionTrigger.action_list

			arg_41_0:setAbleWithFlag(false)
			arg_41_0:onEventCallback(Live2D.EVENT_ACTION_APPLY, {}, function(arg_45_0)
				return
			end)
			arg_41_0:resetNextTriggerTime()
			arg_41_0:setTriggerActionFlag(false)
		else
			arg_41_0:setAbleWithFlag(false)
		end
	elseif var_41_0 == Live2D.DRAG_RELATION_XY then
		if arg_41_0._active then
			local var_41_4 = arg_41_0:fixParameterTargetValue(arg_41_0.offsetDragX, arg_41_0.range, arg_41_0.rangeAbs, arg_41_0.dragDirect)
			local var_41_5 = arg_41_0:fixParameterTargetValue(arg_41_0.offsetDragY, arg_41_0.range, arg_41_0.rangeAbs, arg_41_0.dragDirect)
			local var_41_6 = var_41_3[1]
			local var_41_7 = var_41_3[2]

			if math.abs(var_41_4 - var_41_6) < math.abs(var_41_6) * 0.25 and math.abs(var_41_5 - var_41_7) < math.abs(var_41_7) * 0.25 then
				arg_41_0.triggerActionTime = arg_41_0.triggerActionTime + Time.deltaTime

				if var_41_2 < arg_41_0.triggerActionTime and not arg_41_0.l2dIsPlaying then
					arg_41_0:onEventCallback(Live2D.EVENT_ACTION_APPLY, {}, function(arg_46_0)
						if arg_46_0 then
							arg_41_0:onEventNotice(Live2D.ON_ACTION_XY_TRIGGER)
						end
					end)
				end
			else
				arg_41_0.triggerActionTime = arg_41_0.triggerActionTime + 0
			end
		end
	elseif var_41_0 == Live2D.DRAG_RELATION_IDLE then
		if arg_41_0.actionTrigger.const_fit then
			for iter_41_0 = 1, #arg_41_0.actionTrigger.const_fit do
				local var_41_8 = arg_41_0.actionTrigger.const_fit[iter_41_0]

				if arg_41_0.l2dIdleIndex == var_41_8.idle and not arg_41_0.l2dIsPlaying then
					arg_41_0:setTargetValue(var_41_8.target)
				end
			end
		end
	elseif var_41_0 == Live2D.DRAG_CLICK_MANY then
		if arg_41_0:checkClickAction() then
			arg_41_0:onEventCallback(Live2D.EVENT_ACTION_APPLY)
		end
	elseif var_41_0 == Live2D.DRAG_LISTENER_EVENT then
		if arg_41_0._listenerTrigger then
			arg_41_0:onEventCallback(Live2D.EVENT_ACTION_APPLY)
		end
	elseif var_41_0 == Live2D.DRAG_DOWN_TOUCH then
		arg_41_0:setAbleWithFlag(arg_41_0._active)

		if arg_41_0._active then
			local var_41_9 = Time.deltaTime / arg_41_0.actionTrigger.delta
			local var_41_10 = arg_41_0.parameterTargetValue + var_41_9
			local var_41_11 = arg_41_0:fixParameterTargetValue(var_41_10, arg_41_0.range, arg_41_0.rangeAbs, arg_41_0.dragDirect)

			arg_41_0:setTargetValue(var_41_11)
		end
	elseif var_41_0 == Live2D.DRAG_CLICK_PARAMETER and arg_41_0:checkClickAction() then
		local var_41_12 = var_41_3
		local var_41_13 = arg_41_0.actionTrigger.parameter

		arg_41_0:onEventCallback(Live2D.EVENT_GET_PARAMETER, {
			name = var_41_13
		}, function(arg_47_0)
			if math.abs(var_41_12 - arg_47_0) <= 0.05 then
				print("数值允许播放，开始执行动作 " .. arg_41_0.actionTrigger.action)
				arg_41_0:onEventCallback(Live2D.EVENT_ACTION_APPLY, {}, function(arg_48_0)
					if arg_48_0 then
						arg_41_0:onEventNotice(Live2D.ON_ACTION_DRAG_CLICK)
					end
				end)
			end
		end)
	end
end

function var_0_0.setAbleWithFlag(arg_49_0, arg_49_1)
	if arg_49_0.ableFlag ~= arg_49_1 then
		arg_49_0.ableFlag = arg_49_1

		arg_49_0:onEventCallback(Live2D.EVENT_ACTION_ABLE, {
			ableFlag = arg_49_1
		})
	end
end

function var_0_0.triggerAction(arg_50_0)
	arg_50_0.nextTriggerTime = arg_50_0.limitTime

	arg_50_0:setTriggerActionFlag(true)
end

function var_0_0.isActionTriggerAble(arg_51_0)
	if arg_51_0.actionTrigger.type == nil then
		return false
	end

	if not arg_51_0.actionTrigger or arg_51_0.actionTrigger == "" then
		return false
	end

	if arg_51_0.nextTriggerTime - Time.deltaTime >= 0 then
		arg_51_0.nextTriggerTime = arg_51_0.nextTriggerTime - Time.deltaTime

		return false
	end

	if arg_51_0.isTriggerAtion then
		return false
	end

	return true
end

function var_0_0.updateStateData(arg_52_0, arg_52_1)
	if arg_52_0.l2dIdleIndex ~= arg_52_1.idleIndex then
		if type(arg_52_0.revertIdleIndex) == "boolean" and arg_52_0.revertIdleIndex == true then
			arg_52_0:setTargetValue(arg_52_0.startValue)
		elseif type(arg_52_0.revertIdleIndex) == "table" and table.contains(arg_52_0.revertIdleIndex, arg_52_1.idleIndex) then
			arg_52_0:setTargetValue(arg_52_0.startValue)
		end
	end

	arg_52_0.lastActionIndex = arg_52_0.actionListIndex

	if arg_52_1.isPlaying and arg_52_0.actionTrigger.reset_index_action and arg_52_1.actionName and table.contains(arg_52_0.actionTrigger.reset_index_action, arg_52_1.actionName) then
		arg_52_0.actionListIndex = 1
	end

	if arg_52_0.revertActionIndex and arg_52_0.lastActionIndex ~= arg_52_0.actionListIndex then
		arg_52_0:setTargetValue(arg_52_0.startValue)
	end

	arg_52_0.l2dIdleIndex = arg_52_1.idleIndex
	arg_52_0.l2dIsPlaying = arg_52_1.isPlaying
	arg_52_0.l2dIgnoreReact = arg_52_1.ignoreReact
	arg_52_0.l2dPlayActionName = arg_52_1.actionName

	if not arg_52_0.l2dIsPlaying and arg_52_0.isTriggerAtion then
		arg_52_0:setTriggerActionFlag(false)
	end

	if arg_52_0.l2dIdleIndex and arg_52_0.idleOn and #arg_52_0.idleOn > 0 then
		arg_52_0.reactConditionFlag = not table.contains(arg_52_0.idleOn, arg_52_0.l2dIdleIndex)
	end

	if arg_52_0.l2dIdleIndex and arg_52_0.idleOff and #arg_52_0.idleOff > 0 then
		arg_52_0.reactConditionFlag = table.contains(arg_52_0.idleOff, arg_52_0.l2dIdleIndex)
	end
end

function var_0_0.checkClickAction(arg_53_0)
	if arg_53_0.firstActive then
		arg_53_0:setAbleWithFlag(true)
	elseif arg_53_0.firstStop then
		local var_53_0 = math.abs(arg_53_0.mouseInputUp.x - arg_53_0.mouseInputDown.x) < 30 and math.abs(arg_53_0.mouseInputUp.y - arg_53_0.mouseInputDown.y) < 30
		local var_53_1 = arg_53_0.mouseInputUpTime - arg_53_0.mouseInputDownTime < 0.5

		if var_53_0 and var_53_1 and not arg_53_0.l2dIsPlaying then
			arg_53_0.clickTriggerTime = 0.01
			arg_53_0.clickApplyFlag = true
		else
			arg_53_0:setAbleWithFlag(false)
		end
	elseif arg_53_0.clickTriggerTime and arg_53_0.clickTriggerTime > 0 then
		arg_53_0.clickTriggerTime = arg_53_0.clickTriggerTime - Time.deltaTime

		if arg_53_0.clickTriggerTime <= 0 then
			arg_53_0.clickTriggerTime = nil

			arg_53_0:setAbleWithFlag(false)

			if arg_53_0.clickApplyFlag then
				arg_53_0.clickApplyFlag = false

				return true
			end
		end
	end

	return false
end

function var_0_0.saveData(arg_54_0)
	if arg_54_0.revert == -1 and arg_54_0.saveParameterFlag then
		Live2dConst.SaveDragData(arg_54_0.id, arg_54_0.live2dData:GetShipSkinConfig().id, arg_54_0.live2dData.ship.id, arg_54_0.parameterTargetValue)
	end

	if arg_54_0.actionTrigger.type == Live2D.DRAG_CLICK_MANY then
		print("保存actionListIndex" .. arg_54_0.actionListIndex)
		Live2dConst.SetDragActionIndex(arg_54_0.id, arg_54_0.live2dData:GetShipSkinConfig().id, arg_54_0.live2dData.ship.id, arg_54_0.actionListIndex)
	end
end

function var_0_0.loadData(arg_55_0)
	if arg_55_0.revert == -1 and arg_55_0.saveParameterFlag then
		local var_55_0 = Live2dConst.GetDragData(arg_55_0.id, arg_55_0.live2dData:GetShipSkinConfig().id, arg_55_0.live2dData.ship.id)

		if var_55_0 then
			arg_55_0:setParameterValue(var_55_0)
			arg_55_0:setTargetValue(var_55_0)
		end
	end

	if arg_55_0.actionTrigger.type == Live2D.DRAG_CLICK_MANY then
		arg_55_0.actionListIndex = Live2dConst.GetDragActionIndex(arg_55_0.id, arg_55_0.live2dData:GetShipSkinConfig().id, arg_55_0.live2dData.ship.id) or 1
	end
end

function var_0_0.loadL2dFinal(arg_56_0)
	arg_56_0.loadL2dStep = true
end

function var_0_0.clearData(arg_57_0)
	if arg_57_0.revert == -1 then
		arg_57_0.actionListIndex = 1

		arg_57_0:setParameterValue(arg_57_0.startValue)
		arg_57_0:setTargetValue(arg_57_0.startValue)
	end
end

function var_0_0.setTriggerActionFlag(arg_58_0, arg_58_1)
	arg_58_0.isTriggerAtion = arg_58_1
end

function var_0_0.dispose(arg_59_0)
	arg_59_0._active = false
	arg_59_0._parameterCom = nil
	arg_59_0.parameterValue = arg_59_0.startValue
	arg_59_0.parameterTargetValue = 0
	arg_59_0.parameterSmooth = 0
	arg_59_0.mouseInputDown = Vector2(0, 0)
	arg_59_0.live2dData = nil
end

return var_0_0
