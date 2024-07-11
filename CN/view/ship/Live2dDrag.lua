local var_0_0 = class("Live2dDrag")
local var_0_1 = 4

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
	arg_1_0.limitTime = arg_1_1.limit_time > 0 and arg_1_1.limit_time or var_0_1
	arg_1_0.listenerData = arg_1_1.listener_data
	arg_1_0.listenerType = arg_1_0.listenerData.type
	arg_1_0.listenerChange = arg_1_0.listenerData.change
	arg_1_0.listenerApply = arg_1_0.listenerData.apply
	arg_1_0.reactCondition = arg_1_1.react_condition and arg_1_1.react_condition ~= "" and arg_1_1.react_condition or {}
	arg_1_0.idleOn = arg_1_0.reactCondition.idle_on and arg_1_0.reactCondition.idle_on or {}
	arg_1_0.idleOff = arg_1_0.reactCondition.idleOff and arg_1_0.reactCondition.idleOff or {}
	arg_1_0.revertIdleIndex = arg_1_1.revert_idle_index == 1 and true or false
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
					local var_2_12 = var_2_8[4]

					if table.contains(var_2_10, var_2_7) then
						local var_2_13

						if var_2_9 == 1 then
							var_2_13 = arg_2_0.parameterTargetValue + var_2_11
						elseif var_2_9 == 2 then
							var_2_13 = var_2_11
						end

						if var_2_13 then
							var_2_6 = true

							local var_2_14 = arg_2_0:fixParameterTargetValue(var_2_13, arg_2_0.range, arg_2_0.rangeAbs, arg_2_0.dragDirect)

							arg_2_0:setTargetValue(var_2_14)
							arg_2_0:setParameterValue(var_2_14)
							print("数值变更为" .. arg_2_0.parameterTargetValue)
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

		print("激活，id=" .. arg_4_0.id)

		arg_4_0.mouseInputDown = Input.mousePosition
		arg_4_0.mouseInputDownTime = Time.time
		arg_4_0.triggerActionTime = 0

		if arg_4_0.actionTrigger.type == Live2D.DRAG_DOWN_ACTION then
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

		if type(arg_5_0.partsData) == "table" then
			local var_5_0 = arg_5_0.partsData.parts

			if arg_5_0.offsetX or arg_5_0.offsetY then
				local var_5_1 = arg_5_0.parameterTargetValue
				local var_5_2
				local var_5_3

				for iter_5_0 = 1, #var_5_0 do
					local var_5_4 = var_5_0[iter_5_0]
					local var_5_5 = math.abs(var_5_1 - var_5_4)

					if not var_5_2 or var_5_5 < var_5_2 then
						var_5_2 = var_5_5
						var_5_3 = iter_5_0
					end
				end

				if var_5_3 then
					arg_5_0:setTargetValue(var_5_0[var_5_3])
				end
			end
		end

		arg_5_0.mouseInputUp = Input.mousePosition
		arg_5_0.mouseInputUpTime = Time.time

		arg_5_0:saveData()
	end
end

function var_0_0.getIgnoreReact(arg_6_0)
	return arg_6_0.ignoreReact
end

function var_0_0.setParameterCom(arg_7_0, arg_7_1)
	if not arg_7_1 then
		print("live2dDrag id:" .. tostring(arg_7_0.id) .. "设置了null的组件(该打印非报错)")
	end

	arg_7_0._parameterCom = arg_7_1
end

function var_0_0.getParameterCom(arg_8_0)
	return arg_8_0._parameterCom
end

function var_0_0.addRelationComData(arg_9_0, arg_9_1, arg_9_2)
	table.insert(arg_9_0._relationParameterList, {
		com = arg_9_1,
		data = arg_9_2
	})
end

function var_0_0.getRelationParameterList(arg_10_0)
	return arg_10_0._relationParameterList
end

function var_0_0.getReactCondition(arg_11_0)
	return arg_11_0.reactConditionFlag
end

function var_0_0.getActive(arg_12_0)
	return arg_12_0._active
end

function var_0_0.getParameterUpdateFlag(arg_13_0)
	return arg_13_0._parameterUpdateFlag
end

function var_0_0.setEventCallback(arg_14_0, arg_14_1)
	arg_14_0._eventCallback = arg_14_1
end

function var_0_0.onEventCallback(arg_15_0, arg_15_1, arg_15_2, arg_15_3)
	if arg_15_1 == Live2D.EVENT_ACTION_APPLY then
		local var_15_0 = {}
		local var_15_1
		local var_15_2 = false
		local var_15_3
		local var_15_4
		local var_15_5

		if arg_15_0.actionTrigger.action then
			var_15_1 = arg_15_0:fillterAction(arg_15_0.actionTrigger.action)
			var_15_0 = arg_15_0.actionTriggerActive
			var_15_2 = arg_15_0.actionTrigger.focus or false
			var_15_3 = arg_15_0.actionTrigger.target or nil

			if (arg_15_0.actionTrigger.circle or nil) and var_15_3 and var_15_3 == arg_15_0.parameterTargetValue then
				var_15_3 = arg_15_0.startValue
			end

			var_15_4 = arg_15_0.actionTrigger.react or nil

			arg_15_0:triggerAction()
			arg_15_0:stopDrag()
		elseif arg_15_0.actionTrigger.action_list then
			local var_15_6 = arg_15_0.actionTrigger.action_list[arg_15_0.actionListIndex]

			var_15_1 = arg_15_0:fillterAction(var_15_6.action)

			if arg_15_0.actionTriggerActive.active_list and arg_15_0.actionListIndex <= #arg_15_0.actionTriggerActive.active_list then
				var_15_0 = arg_15_0.actionTriggerActive.active_list[arg_15_0.actionListIndex]
			end

			var_15_2 = var_15_6.focus or true
			var_15_3 = var_15_6.target or nil
			var_15_4 = var_15_6.react or nil

			if arg_15_0.actionListIndex == #arg_15_0.actionTrigger.action_list then
				arg_15_0:triggerAction()
				arg_15_0:stopDrag()

				arg_15_0.actionListIndex = 1
			else
				arg_15_0.actionListIndex = arg_15_0.actionListIndex + 1
			end

			print("id = " .. arg_15_0.id .. " action list index = " .. arg_15_0.actionListIndex)
		elseif not arg_15_0.actionTrigger.action then
			var_15_1 = arg_15_0:fillterAction(arg_15_0.actionTrigger.action)
			var_15_0 = arg_15_0.actionTriggerActive
			var_15_2 = arg_15_0.actionTrigger.focus or false
			var_15_3 = arg_15_0.actionTrigger.target or nil

			if (arg_15_0.actionTrigger.circle or nil) and var_15_3 and var_15_3 == arg_15_0.parameterTargetValue then
				var_15_3 = arg_15_0.startValue
			end

			var_15_4 = arg_15_0.actionTrigger.react or nil

			arg_15_0:triggerAction()
			arg_15_0:stopDrag()
		end

		if var_15_0.idle then
			if type(var_15_0.idle) == "number" then
				if var_15_0.idle == arg_15_0.l2dIdleIndex and not var_15_0.repeatFlag then
					return
				end
			elseif type(var_15_0.idle) == "table" and #var_15_0.idle == 1 and var_15_0.idle[1] == arg_15_0.l2dIdleIndex and not var_15_0.repeatFlag then
				return
			end
		end

		if var_15_3 then
			arg_15_0:setTargetValue(var_15_3)

			if not var_15_1 then
				arg_15_0.revertResetFlag = true
			end
		end

		arg_15_2 = {
			id = arg_15_0.id,
			action = var_15_1,
			activeData = var_15_0,
			focus = var_15_2,
			react = var_15_4,
			callback = arg_15_3,
			finishCall = function()
				arg_15_0:actionApplyFinish()
			end
		}
	elseif arg_15_1 == Live2D.EVENT_ACTION_ABLE then
		-- block empty
	elseif arg_15_1 == Live2D.EVENT_CHANGE_IDLE_INDEX then
		print("CHANGE idle")
	end

	arg_15_0._eventCallback(arg_15_1, arg_15_2)
end

function var_0_0.fillterAction(arg_17_0, arg_17_1)
	if type(arg_17_1) == "table" then
		return arg_17_1[math.random(1, #arg_17_0.actionTrigger.action)]
	else
		return arg_17_1
	end
end

function var_0_0.onEventNotice(arg_18_0, arg_18_1)
	if arg_18_0._eventCallback then
		local var_18_0 = arg_18_0:getCommonNoticeData()

		arg_18_0._eventCallback(arg_18_1, var_18_0)
	end
end

function var_0_0.getCommonNoticeData(arg_19_0)
	return {
		draw_able_name = arg_19_0.drawAbleName,
		parameter_name = arg_19_0.parameterName,
		parameter_target = arg_19_0.parameterTargetValue
	}
end

function var_0_0.setTargetValue(arg_20_0, arg_20_1)
	arg_20_0.parameterTargetValue = arg_20_1
end

function var_0_0.getParameter(arg_21_0)
	return arg_21_0.parameterValue
end

function var_0_0.getParameToTargetFlag(arg_22_0)
	if arg_22_0.parameterValue ~= arg_22_0.parameterTargetValue then
		return true
	end

	if arg_22_0.parameterToStart and arg_22_0.parameterToStart > 0 then
		return true
	end

	return false
end

function var_0_0.actionApplyFinish(arg_23_0)
	return
end

function var_0_0.stepParameter(arg_24_0)
	arg_24_0:updateState()
	arg_24_0:updateTrigger()
	arg_24_0:updateParameterUpdateFlag()
	arg_24_0:updateGyro()
	arg_24_0:updateDrag()
	arg_24_0:updateReactValue()
	arg_24_0:updateParameterValue()
	arg_24_0:updateRelationValue()
	arg_24_0:checkReset()
end

function var_0_0.updateParameterUpdateFlag(arg_25_0)
	if arg_25_0.actionTrigger.type == Live2D.DRAG_CLICK_ACTION then
		arg_25_0._parameterUpdateFlag = true
	elseif arg_25_0.actionTrigger.type == Live2D.DRAG_RELATION_IDLE then
		if not arg_25_0._parameterUpdateFlag then
			if not arg_25_0.l2dIsPlaying then
				arg_25_0._parameterUpdateFlag = true

				arg_25_0:changeParameComAble(true)
			elseif not table.contains(arg_25_0.actionTrigger.remove_com_list, arg_25_0.l2dPlayActionName) then
				arg_25_0._parameterUpdateFlag = true

				arg_25_0:changeParameComAble(true)
			end
		elseif arg_25_0._parameterUpdateFlag == true and arg_25_0.l2dIsPlaying and table.contains(arg_25_0.actionTrigger.remove_com_list, arg_25_0.l2dPlayActionName) then
			arg_25_0._parameterUpdateFlag = false

			arg_25_0:changeParameComAble(false)
		end
	else
		arg_25_0._parameterUpdateFlag = false
	end
end

function var_0_0.changeParameComAble(arg_26_0, arg_26_1)
	if arg_26_0.parameterComAdd == arg_26_1 then
		return
	end

	arg_26_0.parameterComAdd = arg_26_1

	if arg_26_1 then
		arg_26_0:onEventCallback(Live2D.EVENT_ADD_PARAMETER_COM, {
			com = arg_26_0._parameterCom,
			start = arg_26_0.startValue,
			mode = arg_26_0.mode
		})
	else
		arg_26_0:onEventCallback(Live2D.EVENT_REMOVE_PARAMETER_COM, {
			com = arg_26_0._parameterCom,
			mode = arg_26_0.mode
		})
	end
end

function var_0_0.updateDrag(arg_27_0)
	if not arg_27_0.offsetX and not arg_27_0.offsetY then
		return
	end

	local var_27_0

	if arg_27_0._active then
		local var_27_1 = Input.mousePosition

		if arg_27_0.offsetX and arg_27_0.offsetX ~= 0 then
			local var_27_2 = var_27_1.x - arg_27_0.mouseInputDown.x

			var_27_0 = arg_27_0.offsetDragTargetX + var_27_2 / arg_27_0.offsetX
			arg_27_0.offsetDragX = var_27_0
		end

		if arg_27_0.offsetY and arg_27_0.offsetY ~= 0 then
			local var_27_3 = var_27_1.y - arg_27_0.mouseInputDown.y

			var_27_0 = arg_27_0.offsetDragTargetY + var_27_3 / arg_27_0.offsetY
			arg_27_0.offsetDragY = var_27_0
		end

		if var_27_0 then
			arg_27_0:setTargetValue(arg_27_0:fixParameterTargetValue(var_27_0, arg_27_0.range, arg_27_0.rangeAbs, arg_27_0.dragDirect))
		end
	end

	arg_27_0._parameterUpdateFlag = true
end

function var_0_0.updateGyro(arg_28_0)
	if not arg_28_0.gyro then
		return
	end

	if not Input.gyro.enabled then
		arg_28_0:setTargetValue(0)

		arg_28_0._parameterUpdateFlag = true

		return
	end

	local var_28_0 = Input.gyro and Input.gyro.attitude or Vector3.zero
	local var_28_1 = 0

	if arg_28_0.gyroX and not math.isnan(var_28_0.y) then
		var_28_1 = Mathf.Clamp(var_28_0.y * arg_28_0.sensitive, -0.5, 0.5)
	elseif arg_28_0.gyroY and not math.isnan(var_28_0.x) then
		var_28_1 = Mathf.Clamp(var_28_0.x * arg_28_0.sensitive, -0.5, 0.5)
	elseif arg_28_0.gyroZ and not math.isnan(var_28_0.z) then
		var_28_1 = Mathf.Clamp(var_28_0.z * arg_28_0.sensitive, -0.5, 0.5)
	end

	if IsUnityEditor then
		if L2D_USE_RANDOM_ATTI then
			if arg_28_0.randomAttitudeIndex == 0 then
				var_28_1 = math.random() - 0.5

				local var_28_2 = (var_28_1 + 0.5) * (arg_28_0.range[2] - arg_28_0.range[1]) + arg_28_0.range[1]

				arg_28_0:setTargetValue(var_28_2)

				arg_28_0.randomAttitudeIndex = L2D_RANDOM_PARAM
			elseif arg_28_0.randomAttitudeIndex > 0 then
				arg_28_0.randomAttitudeIndex = arg_28_0.randomAttitudeIndex - 1
			end
		end
	else
		local var_28_3 = (var_28_1 + 0.5) * (arg_28_0.range[2] - arg_28_0.range[1]) + arg_28_0.range[1]

		arg_28_0:setTargetValue(var_28_3)
	end

	arg_28_0._parameterUpdateFlag = true
end

function var_0_0.updateReactValue(arg_29_0)
	if not arg_29_0.reactX and not arg_29_0.reactY then
		return
	end

	local var_29_0
	local var_29_1 = false

	if arg_29_0.l2dIgnoreReact then
		var_29_0 = arg_29_0.parameterTargetValue
	elseif arg_29_0.reactX then
		var_29_0 = arg_29_0.reactPos.x * arg_29_0.reactX
		var_29_1 = true
	else
		var_29_0 = arg_29_0.reactPos.y * arg_29_0.reactY
		var_29_1 = true
	end

	if var_29_1 then
		arg_29_0:setTargetValue(arg_29_0:fixParameterTargetValue(var_29_0, arg_29_0.range, arg_29_0.rangeAbs, arg_29_0.dragDirect))
	end

	arg_29_0._parameterUpdateFlag = true
end

function var_0_0.updateParameterValue(arg_30_0)
	if arg_30_0._parameterUpdateFlag and arg_30_0.parameterValue ~= arg_30_0.parameterTargetValue then
		if math.abs(arg_30_0.parameterValue - arg_30_0.parameterTargetValue) < 0.01 then
			arg_30_0:setParameterValue(arg_30_0.parameterTargetValue)
		elseif arg_30_0.parameterSmoothTime and arg_30_0.parameterSmoothTime > 0 then
			local var_30_0, var_30_1 = Mathf.SmoothDamp(arg_30_0.parameterValue, arg_30_0.parameterTargetValue, arg_30_0.parameterSmooth, arg_30_0.parameterSmoothTime)

			arg_30_0:setParameterValue(var_30_0, var_30_1)
		else
			arg_30_0:setParameterValue(arg_30_0.parameterTargetValue, 0)
		end
	end
end

function var_0_0.updateRelationValue(arg_31_0)
	for iter_31_0, iter_31_1 in ipairs(arg_31_0._relationParameterList) do
		local var_31_0 = iter_31_1.data
		local var_31_1 = var_31_0.type
		local var_31_2 = var_31_0.relation_value
		local var_31_3
		local var_31_4
		local var_31_5

		if var_31_1 == Live2D.relation_type_drag_x then
			var_31_3 = arg_31_0.offsetDragX or iter_31_1.start or arg_31_0.startValue or 0
			var_31_5 = true
		elseif var_31_1 == Live2D.relation_type_drag_y then
			var_31_3 = arg_31_0.offsetDragY or iter_31_1.start or arg_31_0.startValue or 0
			var_31_5 = true
		elseif var_31_1 == Live2D.relation_type_action_index then
			var_31_3 = var_31_2[arg_31_0.actionListIndex]
			var_31_3 = var_31_3 or 0
			var_31_5 = true
		else
			var_31_3 = arg_31_0.parameterTargetValue
			var_31_5 = false
		end

		local var_31_6 = iter_31_1.value or arg_31_0.startValue
		local var_31_7 = arg_31_0:fixRelationParameter(var_31_3, var_31_0)
		local var_31_8 = iter_31_1.parameterSmooth or 0
		local var_31_9 = var_31_0.smooth and var_31_0.smooth / 1000 or arg_31_0.smooth
		local var_31_10, var_31_11 = Mathf.SmoothDamp(var_31_6, var_31_7, var_31_8, var_31_9)

		iter_31_1.value = var_31_10
		iter_31_1.parameterSmooth = var_31_11
		iter_31_1.enable = var_31_5
		iter_31_1.comId = arg_31_0.id
	end
end

function var_0_0.fixRelationParameter(arg_32_0, arg_32_1, arg_32_2)
	local var_32_0 = arg_32_2.range or arg_32_0.range
	local var_32_1 = arg_32_2.rangeAbs and arg_32_2.rangeAbs == 1 or arg_32_0.rangeAbs
	local var_32_2 = arg_32_2.drag_direct and arg_32_2.drag_direct or arg_32_0.dragDirect

	return arg_32_0:fixParameterTargetValue(arg_32_1, var_32_0, var_32_1, var_32_2)
end

function var_0_0.fixParameterTargetValue(arg_33_0, arg_33_1, arg_33_2, arg_33_3, arg_33_4)
	if arg_33_1 < 0 and arg_33_4 == 1 then
		arg_33_1 = 0
	elseif arg_33_1 > 0 and arg_33_4 == 2 then
		arg_33_1 = 0
	end

	arg_33_1 = arg_33_3 and math.abs(arg_33_1) or arg_33_1

	if arg_33_1 < arg_33_2[1] then
		arg_33_1 = arg_33_2[1]
	elseif arg_33_1 > arg_33_2[2] then
		arg_33_1 = arg_33_2[2]
	end

	return arg_33_1
end

function var_0_0.checkReset(arg_34_0)
	if not arg_34_0._active and arg_34_0.parameterToStart then
		if arg_34_0.parameterToStart > 0 then
			arg_34_0.parameterToStart = arg_34_0.parameterToStart - Time.deltaTime
		end

		if arg_34_0.parameterToStart <= 0 then
			arg_34_0:setTargetValue(arg_34_0.startValue)

			arg_34_0.parameterToStart = nil

			if arg_34_0.revertResetFlag then
				arg_34_0:setTriggerActionFlag(false)

				arg_34_0.revertResetFlag = false
			end

			if arg_34_0.offsetDragX then
				arg_34_0.offsetDragX = arg_34_0.startValue
				arg_34_0.offsetDragTargetX = arg_34_0.startValue
			end

			if arg_34_0.offsetDragY then
				arg_34_0.offsetDragY = arg_34_0.startValue
				arg_34_0.offsetDragTargetY = arg_34_0.startValue
			end
		end
	end
end

function var_0_0.changeReactValue(arg_35_0, arg_35_1)
	arg_35_0.reactPos = arg_35_1
end

function var_0_0.setParameterValue(arg_36_0, arg_36_1, arg_36_2)
	if arg_36_1 then
		arg_36_0.parameterValue = arg_36_1
	end

	if arg_36_2 then
		arg_36_0.parameterSmooth = arg_36_2
	end
end

function var_0_0.updateState(arg_37_0)
	if not arg_37_0.lastFrameActive and arg_37_0._active then
		arg_37_0.firstActive = true
	else
		arg_37_0.firstActive = false
	end

	if arg_37_0.lastFrameActive and not arg_37_0._active then
		arg_37_0.firstStop = true
	else
		arg_37_0.firstStop = false
	end

	arg_37_0.lastFrameActive = arg_37_0._active
end

function var_0_0.updateTrigger(arg_38_0)
	if not arg_38_0:isActionTriggerAble() then
		return
	end

	local var_38_0 = arg_38_0.actionTrigger.type
	local var_38_1 = arg_38_0.actionTrigger.action
	local var_38_2

	if arg_38_0.actionTrigger.time then
		var_38_2 = arg_38_0.actionTrigger.time
	elseif arg_38_0.actionTrigger.action_list and arg_38_0.actionListIndex > 0 then
		var_38_2 = arg_38_0.actionTrigger.action_list[arg_38_0.actionListIndex].time
	end

	local var_38_3

	if arg_38_0.actionTrigger.num then
		var_38_3 = arg_38_0.actionTrigger.num
	elseif arg_38_0.actionTrigger.action_list and arg_38_0.actionTrigger.action_list[arg_38_0.actionListIndex].num and arg_38_0.actionListIndex > 0 then
		var_38_3 = arg_38_0.actionTrigger.action_list[arg_38_0.actionListIndex].num
	end

	if var_38_0 == Live2D.DRAG_TIME_ACTION then
		if arg_38_0._active then
			if math.abs(arg_38_0.parameterValue - var_38_3) < math.abs(var_38_3) * 0.25 then
				arg_38_0.triggerActionTime = arg_38_0.triggerActionTime + Time.deltaTime

				if var_38_2 < arg_38_0.triggerActionTime and not arg_38_0.l2dIsPlaying then
					arg_38_0:onEventCallback(Live2D.EVENT_ACTION_APPLY, {}, function(arg_39_0)
						if arg_39_0 then
							arg_38_0:onEventNotice(Live2D.ON_ACTION_DRAG_TRIGGER)
						end
					end)
				end
			else
				arg_38_0.triggerActionTime = arg_38_0.triggerActionTime + 0
			end
		end
	elseif var_38_0 == Live2D.DRAG_CLICK_ACTION then
		if arg_38_0:checkClickAction() then
			arg_38_0:onEventCallback(Live2D.EVENT_ACTION_APPLY, {}, function(arg_40_0)
				if arg_40_0 then
					arg_38_0:onEventNotice(Live2D.ON_ACTION_DRAG_CLICK)
				end
			end)
		end
	elseif var_38_0 == Live2D.DRAG_DOWN_ACTION then
		if arg_38_0._active then
			if arg_38_0.firstActive then
				arg_38_0.ableFalg = true

				arg_38_0:onEventCallback(Live2D.EVENT_ACTION_ABLE, {
					ableFlag = true
				})
			end

			if var_38_2 <= Time.time - arg_38_0.mouseInputDownTime then
				arg_38_0:onEventCallback(Live2D.EVENT_ACTION_ABLE, {
					ableFlag = false
				})

				arg_38_0.ableFalg = false

				arg_38_0:onEventCallback(Live2D.EVENT_ACTION_APPLY, {}, function(arg_41_0)
					if arg_41_0 then
						arg_38_0:onEventNotice(Live2D.ON_ACTION_DOWN)
					end
				end)

				arg_38_0.mouseInputDownTime = Time.time
			end
		elseif arg_38_0.ableFalg then
			arg_38_0.ableFalg = false

			arg_38_0:onEventCallback(Live2D.EVENT_ACTION_ABLE, {
				ableFlag = false
			})
		end
	elseif var_38_0 == Live2D.DRAG_RELATION_XY then
		if arg_38_0._active then
			local var_38_4 = arg_38_0:fixParameterTargetValue(arg_38_0.offsetDragX, arg_38_0.range, arg_38_0.rangeAbs, arg_38_0.dragDirect)
			local var_38_5 = arg_38_0:fixParameterTargetValue(arg_38_0.offsetDragY, arg_38_0.range, arg_38_0.rangeAbs, arg_38_0.dragDirect)
			local var_38_6 = var_38_3[1]
			local var_38_7 = var_38_3[2]

			if math.abs(var_38_4 - var_38_6) < math.abs(var_38_6) * 0.25 and math.abs(var_38_5 - var_38_7) < math.abs(var_38_7) * 0.25 then
				arg_38_0.triggerActionTime = arg_38_0.triggerActionTime + Time.deltaTime

				if var_38_2 < arg_38_0.triggerActionTime and not arg_38_0.l2dIsPlaying then
					arg_38_0:onEventCallback(Live2D.EVENT_ACTION_APPLY, {}, function(arg_42_0)
						if arg_42_0 then
							arg_38_0:onEventNotice(Live2D.ON_ACTION_XY_TRIGGER)
						end
					end)
				end
			else
				arg_38_0.triggerActionTime = arg_38_0.triggerActionTime + 0
			end
		end
	elseif var_38_0 == Live2D.DRAG_RELATION_IDLE then
		if arg_38_0.actionTrigger.const_fit then
			for iter_38_0 = 1, #arg_38_0.actionTrigger.const_fit do
				local var_38_8 = arg_38_0.actionTrigger.const_fit[iter_38_0]

				if arg_38_0.l2dIdleIndex == var_38_8.idle and not arg_38_0.l2dIsPlaying then
					arg_38_0:setTargetValue(var_38_8.target)
				end
			end
		end
	elseif var_38_0 == Live2D.DRAG_CLICK_MANY then
		if arg_38_0:checkClickAction() then
			arg_38_0:onEventCallback(Live2D.EVENT_ACTION_APPLY)
		end
	elseif var_38_0 == Live2D.DRAG_LISTENER_EVENT and arg_38_0._listenerTrigger then
		arg_38_0:onEventCallback(Live2D.EVENT_ACTION_APPLY)
	end
end

function var_0_0.triggerAction(arg_43_0)
	arg_43_0.nextTriggerTime = arg_43_0.limitTime

	arg_43_0:setTriggerActionFlag(true)
end

function var_0_0.isActionTriggerAble(arg_44_0)
	if arg_44_0.actionTrigger.type == nil then
		return false
	end

	if not arg_44_0.actionTrigger or arg_44_0.actionTrigger == "" then
		return
	end

	if arg_44_0.nextTriggerTime - Time.deltaTime >= 0 then
		arg_44_0.nextTriggerTime = arg_44_0.nextTriggerTime - Time.deltaTime

		return false
	end

	if arg_44_0.isTriggerAtion then
		return false
	end

	return true
end

function var_0_0.updateStateData(arg_45_0, arg_45_1)
	if arg_45_0.revertIdleIndex and arg_45_0.l2dIdleIndex ~= arg_45_1.idleIndex then
		arg_45_0:setTargetValue(arg_45_0.startValue)
	end

	arg_45_0.lastActionIndex = arg_45_0.actionListIndex

	if arg_45_1.isPlaying and arg_45_0.actionTrigger.reset_index_action and arg_45_1.actionName and table.contains(arg_45_0.actionTrigger.reset_index_action, arg_45_1.actionName) then
		arg_45_0.actionListIndex = 1
	end

	if arg_45_0.revertActionIndex and arg_45_0.lastActionIndex ~= arg_45_0.actionListIndex then
		arg_45_0:setTargetValue(arg_45_0.startValue)
	end

	arg_45_0.l2dIdleIndex = arg_45_1.idleIndex
	arg_45_0.l2dIsPlaying = arg_45_1.isPlaying
	arg_45_0.l2dIgnoreReact = arg_45_1.ignoreReact
	arg_45_0.l2dPlayActionName = arg_45_1.actionName

	if not arg_45_0.l2dIsPlaying and arg_45_0.isTriggerAtion then
		arg_45_0:setTriggerActionFlag(false)
	end

	if arg_45_0.l2dIdleIndex and arg_45_0.idleOn and #arg_45_0.idleOn > 0 then
		arg_45_0.reactConditionFlag = table.contains(arg_45_0.idleOn, arg_45_0.l2dIdleIndex)
	end

	if arg_45_0.l2dIdleIndex and arg_45_0.idleOff and #arg_45_0.idleOff > 0 then
		arg_45_0.reactConditionFlag = not table.contains(arg_45_0.idleOff, arg_45_0.l2dIdleIndex)
	end
end

function var_0_0.checkClickAction(arg_46_0)
	if arg_46_0.firstActive then
		arg_46_0:onEventCallback(Live2D.EVENT_ACTION_ABLE, {
			ableFlag = true
		})
	elseif arg_46_0.firstStop then
		local var_46_0 = math.abs(arg_46_0.mouseInputUp.x - arg_46_0.mouseInputDown.x) < 30 and math.abs(arg_46_0.mouseInputUp.y - arg_46_0.mouseInputDown.y) < 30
		local var_46_1 = arg_46_0.mouseInputUpTime - arg_46_0.mouseInputDownTime < 0.5

		if var_46_0 and var_46_1 and not arg_46_0.l2dIsPlaying then
			arg_46_0.clickTriggerTime = 0.01
			arg_46_0.clickApplyFlag = true
		else
			arg_46_0:onEventCallback(Live2D.EVENT_ACTION_ABLE, {
				ableFlag = false
			})
		end
	elseif arg_46_0.clickTriggerTime and arg_46_0.clickTriggerTime > 0 then
		arg_46_0.clickTriggerTime = arg_46_0.clickTriggerTime - Time.deltaTime

		if arg_46_0.clickTriggerTime <= 0 then
			arg_46_0.clickTriggerTime = nil

			arg_46_0:onEventCallback(Live2D.EVENT_ACTION_ABLE, {
				ableFlag = false
			})

			if arg_46_0.clickApplyFlag then
				arg_46_0.clickApplyFlag = false

				return true
			end
		end
	end

	return false
end

function var_0_0.saveData(arg_47_0)
	if arg_47_0.revert == -1 and arg_47_0.saveParameterFlag then
		Live2dConst.SaveDragData(arg_47_0.id, arg_47_0.live2dData:GetShipSkinConfig().id, arg_47_0.live2dData.ship.id, arg_47_0.parameterTargetValue)
	end

	if arg_47_0.actionTrigger.type == Live2D.DRAG_CLICK_MANY then
		Live2dConst.SetDragActionIndex(arg_47_0.id, arg_47_0.live2dData:GetShipSkinConfig().id, arg_47_0.live2dData.ship.id, arg_47_0.actionListIndex)
	end
end

function var_0_0.loadData(arg_48_0)
	if arg_48_0.revert == -1 and arg_48_0.saveParameterFlag then
		local var_48_0 = Live2dConst.GetDragData(arg_48_0.id, arg_48_0.live2dData:GetShipSkinConfig().id, arg_48_0.live2dData.ship.id)

		if var_48_0 then
			arg_48_0:setParameterValue(var_48_0)
			arg_48_0:setTargetValue(var_48_0)
		end
	end

	if arg_48_0.actionTrigger.type == Live2D.DRAG_CLICK_MANY then
		arg_48_0.actionListIndex = Live2dConst.GetDragActionIndex(arg_48_0.id, arg_48_0.live2dData:GetShipSkinConfig().id, arg_48_0.live2dData.ship.id) or 1
	end
end

function var_0_0.clearData(arg_49_0)
	if arg_49_0.revert == -1 then
		arg_49_0.actionListIndex = 1

		arg_49_0:setParameterValue(arg_49_0.startValue)
		arg_49_0:setTargetValue(arg_49_0.startValue)
	end
end

function var_0_0.setTriggerActionFlag(arg_50_0, arg_50_1)
	arg_50_0.isTriggerAtion = arg_50_1
end

function var_0_0.dispose(arg_51_0)
	arg_51_0._active = false
	arg_51_0._parameterCom = nil
	arg_51_0.parameterValue = arg_51_0.startValue
	arg_51_0.parameterTargetValue = 0
	arg_51_0.parameterSmooth = 0
	arg_51_0.mouseInputDown = Vector2(0, 0)
	arg_51_0.live2dData = nil
end

return var_0_0
