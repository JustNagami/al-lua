local var_0_0 = class("TouchCakeItem")

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._tf = arg_1_1
	arg_1_0._cakeTf = findTF(arg_1_0._tf, "cake")
	arg_1_0._cakeAnimUI = GetComponent(arg_1_0._cakeTf, typeof(SpineAnimUI))
	arg_1_0._propLeftSpine = findTF(arg_1_0._tf, "prop_left/spine")
	arg_1_0._propLeftIcon = findTF(arg_1_0._tf, "prop_left/icon")
	arg_1_0._propLeftAnimUI = GetComponent(arg_1_0._propLeftSpine, typeof(SpineAnimUI))
	arg_1_0._propRightSpine = findTF(arg_1_0._tf, "prop_right/spine")
	arg_1_0._propRightIcon = findTF(arg_1_0._tf, "prop_right/icon")
	arg_1_0._propRightAnimUI = GetComponent(arg_1_0._propRightSpine, typeof(SpineAnimUI))
	arg_1_0._props = {
		{
			direct = -1,
			iconTf = arg_1_0._propLeftIcon,
			spineTf = arg_1_0._propLeftSpine,
			anim = arg_1_0._propLeftAnimUI
		},
		{
			direct = 1,
			iconTf = arg_1_0._propRightIcon,
			spineTf = arg_1_0._propRightSpine,
			anim = arg_1_0._propRightAnimUI
		}
	}
	arg_1_0._eventCallback = arg_1_2
end

function var_0_0.setParent(arg_2_0, arg_2_1)
	SetParent(arg_2_0._tf, arg_2_1, true)
end

function var_0_0.setPosition(arg_3_0, arg_3_1)
	arg_3_0._tf.anchoredPosition = arg_3_1
end

function var_0_0.setData(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	arg_4_0._cakeData = arg_4_1

	for iter_4_0, iter_4_1 in ipairs(arg_4_0._props) do
		iter_4_1.data = nil
	end

	if arg_4_2 then
		local var_4_0

		if not arg_4_3 then
			var_4_0 = arg_4_0._props[math.random(1, #arg_4_0._props)]
		else
			for iter_4_2, iter_4_3 in ipairs(arg_4_0._props) do
				if iter_4_3.direct == arg_4_3 then
					var_4_0 = iter_4_3
				end
			end
		end

		var_4_0.data = arg_4_2
	end

	arg_4_0:updateItem()
end

function var_0_0.updateItem(arg_5_0)
	local var_5_0 = arg_5_0:getCakeAnimName(TouchCakeGameConst.cake_anim_normal)

	arg_5_0:setAniamtion(arg_5_0._cakeAnimUI, var_5_0)

	for iter_5_0, iter_5_1 in ipairs(arg_5_0._props) do
		setActive(iter_5_1.spineTf, false)
		setActive(iter_5_1.iconTf, false)

		if iter_5_1.data then
			setActive(iter_5_1.spineTf, iter_5_1.data.spine and true or false)
			setActive(iter_5_1.iconTf, iter_5_1.data.icon and true or false)

			if iter_5_1.data.spine then
				local var_5_1
				local var_5_2
				local var_5_3, var_5_4 = arg_5_0:getPropAnimName(TouchCakeGameConst.prop_anim_normal, iter_5_1.data)

				iter_5_1.spineTf.localScale = Vector3(var_5_4, 1, 1)

				arg_5_0:setAniamtion(iter_5_1.anim, var_5_3)
			elseif iter_5_1.data.icon then
				arg_5_0:setIconVisible(iter_5_1.iconTf, iter_5_1.data.icon)
			end
		end
	end
end

function var_0_0.setIconVisible(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = arg_6_1.childCount

	for iter_6_0 = 1, var_6_0 do
		local var_6_1 = arg_6_1:GetChild(iter_6_0 - 1)

		setActive(var_6_1, var_6_1.name == arg_6_2)
	end
end

function var_0_0.touchAction(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = arg_7_0:getCakeAnimName(TouchCakeGameConst.cake_anim_action, arg_7_1)

	arg_7_0:setAniamtion(arg_7_0._cakeAnimUI, var_7_0, arg_7_2)
	arg_7_0._eventCallback(TouchCakeScene.EVENT_ACTION_CAKE, {
		cake = Clone(arg_7_0._cakeData)
	})
end

function var_0_0.getCakeAnimName(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = arg_8_0:getCakeConfig("type")

	if arg_8_1 == TouchCakeGameConst.cake_anim_normal then
		return "normal" .. var_8_0
	elseif arg_8_1 == TouchCakeGameConst.cake_anim_action then
		local var_8_1 = arg_8_2

		if var_8_1 == 1 then
			return "action_left_" .. var_8_0
		elseif var_8_1 == -1 then
			return "action_right_" .. var_8_0
		end
	end
end

function var_0_0.getPropAnimName(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
	local var_9_0 = arg_9_2.type

	if arg_9_1 == TouchCakeGameConst.prop_anim_normal then
		return "normal" .. var_9_0, 1
	elseif arg_9_1 == TouchCakeGameConst.prop_anim_action then
		if var_9_0 == 4 then
			if arg_9_3 == 1 then
				return "action" .. var_9_0, 1
			else
				return "action" .. var_9_0 .. "_left", -1
			end
		end

		return "action" .. var_9_0, 1
	end
end

function var_0_0.getCakeConfig(arg_10_0, arg_10_1)
	return arg_10_0._cakeData[arg_10_1]
end

function var_0_0.getPropConfig(arg_11_0, arg_11_1)
	return arg_11_0._propData[arg_11_1]
end

function var_0_0.getTopPos(arg_12_0)
	local var_12_0 = arg_12_0._tf.anchoredPosition

	var_12_0.y = var_12_0.y + arg_12_0:getCakeConfig("height")

	return var_12_0
end

function var_0_0.setLayerLast(arg_13_0)
	arg_13_0._tf:SetAsLastSibling()
end

function var_0_0.setLayerFirst(arg_14_0)
	arg_14_0._tf:SetAsFirstSibling()
end

function var_0_0.getPropDirect(arg_15_0)
	for iter_15_0, iter_15_1 in ipairs(arg_15_0._props) do
		if iter_15_1.data ~= nil then
			return iter_15_1.direct
		end
	end

	return nil
end

function var_0_0.setAniamtion(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
	arg_16_1:SetActionCallBack(nil)
	arg_16_1:SetAction(arg_16_2, 0)
	arg_16_1:SetActionCallBack(function(arg_17_0)
		if arg_17_0 == "finish" then
			arg_16_1:SetActionCallBack(nil)

			if arg_16_3 then
				arg_16_3()
			end
		end
	end)
end

function var_0_0.stop(arg_18_0)
	if isActive(arg_18_0._cakeTf) then
		arg_18_0._cakeAnimUI:Pause()
	end

	for iter_18_0, iter_18_1 in ipairs(arg_18_0._props) do
		if iter_18_1.spineTf and isActive(iter_18_1.spineTf) and iter_18_1.anim then
			iter_18_1.anim:Pause()
		end
	end
end

function var_0_0.resume(arg_19_0)
	if isActive(arg_19_0._cakeTf) then
		arg_19_0._cakeAnimUI:Resume()
	end

	for iter_19_0, iter_19_1 in ipairs(arg_19_0._props) do
		if iter_19_1.spineTf and isActive(iter_19_1.spineTf) and iter_19_1.anim then
			iter_19_1.anim:Resume()
		end
	end
end

function var_0_0.propAction(arg_20_0)
	for iter_20_0, iter_20_1 in ipairs(arg_20_0._props) do
		if iter_20_1.data then
			arg_20_0._eventCallback(TouchCakeScene.EVENT_ACTION_PROP, {
				prop = Clone(iter_20_1)
			}, function(arg_21_0)
				if iter_20_1.data.spine then
					local var_21_0
					local var_21_1
					local var_21_2, var_21_3 = arg_20_0:getPropAnimName(TouchCakeGameConst.prop_anim_action, iter_20_1.data, iter_20_1.direct)

					iter_20_1.spineTf.localScale = Vector3(var_21_3, 1, 1)

					arg_20_0:setAniamtion(iter_20_1.anim, var_21_2, function()
						setActive(iter_20_1.spineTf, false)
					end)
				elseif iter_20_1.data.icon then
					setActive(iter_20_1.iconTf, false)
				end
			end)
		end
	end
end

function var_0_0.clear(arg_23_0)
	return
end

return var_0_0
