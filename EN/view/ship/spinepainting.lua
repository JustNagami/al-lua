local var_0_0 = class("SpinePainting")
local var_0_1 = require("Mgr/Pool/PoolUtil")

function var_0_0.GenerateData(arg_1_0)
	local var_1_0 = {
		SetData = function(arg_2_0, arg_2_1)
			arg_2_0.ship = arg_2_1.ship
			arg_2_0.parent = arg_2_1.parent
			arg_2_0.effectParent = arg_2_1.effectParent

			local var_2_0 = arg_2_0:GetShipSkinConfig()

			arg_2_0.pos = arg_2_1.position + BuildVector3(var_2_0.spine_offset[1])

			local var_2_1 = var_2_0.spine_offset[2][1]

			arg_2_0.scale = Vector3(var_2_1, var_2_1, var_2_1)

			if #var_2_0.special_effects > 0 then
				arg_2_0.bgEffectName = var_2_0.special_effects[1]
				arg_2_0.bgEffectPos = arg_2_1.position + BuildVector3(var_2_0.special_effects[2])

				local var_2_2 = var_2_0.special_effects[3][1]

				arg_2_0.bgEffectScale = Vector3(var_2_2, var_2_2, var_2_2)
			end
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
			arg_6_0.pos = nil
			arg_6_0.bgEffectName = nil
			arg_6_0.bgEffectPos = nil
			arg_6_0.bgEffectScale = nil
			arg_6_0.effectParent = nil
		end
	}

	var_1_0:SetData(arg_1_0)

	return var_1_0
end

local function var_0_2(arg_7_0, arg_7_1)
	arg_7_0._go = arg_7_1
	arg_7_0._tf = tf(arg_7_1)

	UIUtil.SetLayerRecursively(arg_7_0._go, LayerMask.NameToLayer("UI"))
	arg_7_0._tf:SetParent(arg_7_0._spinePaintingData.parent, true)

	arg_7_0._tf.localScale = arg_7_0._spinePaintingData.scale
	arg_7_0._tf.localPosition = arg_7_0._spinePaintingData.pos
	arg_7_0.spineAnimList = {}

	local var_7_0 = arg_7_0._tf:GetComponent(typeof(ItemList)).prefabItem:ToTable()

	for iter_7_0, iter_7_1 in ipairs(var_7_0) do
		arg_7_0.spineAnimList[#arg_7_0.spineAnimList + 1] = GetOrAddComponent(iter_7_1, "SpineAnimUI")
	end

	local var_7_1 = #arg_7_0.spineAnimList

	assert(var_7_1 > 0, "动态立绘至少要保证有一个spine动画，请检查" .. arg_7_0._spinePaintingData:GetShipName())

	if var_7_1 == 1 then
		arg_7_0.mainSpineAnim = arg_7_0.spineAnimList[1]
	else
		arg_7_0.mainSpineAnim = arg_7_0.spineAnimList[#arg_7_0.spineAnimList]
	end

	arg_7_0._skeletonGraphic = arg_7_0.mainSpineAnim:GetComponent("SkeletonGraphic")
	arg_7_0._idleName = arg_7_0:getNormalIdleName()
	arg_7_0.shipDragData = SpinePaintingConst.ship_drag_datas[arg_7_0._spinePaintingData:GetShipName()]
	arg_7_0.dragShipFlag = false

	if arg_7_0.shipDragData then
		arg_7_0.dragShipFlag = arg_7_0.shipDragData.drag_data and arg_7_0.shipDragData.drag_data.type
	end

	arg_7_0.multipleFaceFlag = false

	if arg_7_0.shipDragData and arg_7_0.shipDragData.multiple_face and arg_7_0.shipDragData.multiple_face ~= "" then
		local var_7_2 = arg_7_0.shipDragData.multiple_face.name

		arg_7_0.multipleFaceFlag = table.contains(var_7_2, arg_7_0.mainSpineAnim.name)
		arg_7_0.multipleFaceData = arg_7_0.shipDragData.multiple_face.data
	end

	arg_7_0.shipEffectActionAble = SpinePaintingConst.ship_effect_action_able[arg_7_0._spinePaintingData:GetShipName()]
	arg_7_0._effectsTf = findTF(arg_7_0._tf, "effects")

	arg_7_0:playPaintingInitIdle()
end

function var_0_0.getNormalIdleName(arg_8_0)
	return "normal"
end

local function var_0_3(arg_9_0, arg_9_1)
	arg_9_0._bgEffectGo = arg_9_1
	arg_9_0._bgEffectTf = tf(arg_9_1)

	UIUtil.SetLayerRecursively(arg_9_0._bgEffectGo, LayerMask.NameToLayer("UI"))
	arg_9_0._bgEffectTf:SetParent(arg_9_0._spinePaintingData.effectParent, true)

	arg_9_0._bgEffectTf.localScale = arg_9_0._spinePaintingData.bgEffectScale
	arg_9_0._bgEffectTf.localPosition = arg_9_0._spinePaintingData.bgEffectPos
end

function var_0_0.Ctor(arg_10_0, arg_10_1, arg_10_2)
	arg_10_0._spinePaintingData = arg_10_1
	arg_10_0._loader = AutoLoader.New()

	parallelAsync({
		function(arg_11_0)
			local var_11_0 = arg_10_0._spinePaintingData:GetShipName()
			local var_11_1, var_11_2 = HXSet.autoHxShift("spinepainting/", var_11_0)
			local var_11_3 = var_11_1 .. var_11_2

			arg_10_0._loader:LoadPrefab(var_11_3, nil, function(arg_12_0)
				var_0_2(arg_10_0, arg_12_0)
				arg_11_0()
			end, var_11_3)
		end,
		function(arg_13_0)
			local var_13_0 = arg_10_0._spinePaintingData.bgEffectName

			if var_13_0 ~= nil then
				local var_13_1 = "ui/" .. var_13_0

				arg_10_0._loader:LoadPrefab(var_13_1, "", function(arg_14_0)
					var_0_3(arg_10_0, arg_14_0)
					arg_13_0()
				end, var_13_1)
			else
				arg_13_0()
			end
		end
	}, function()
		setActive(arg_10_0._spinePaintingData.parent, true)
		setActive(arg_10_0._spinePaintingData.effectParent, true)

		arg_10_0._initFlag = true

		if arg_10_2 then
			arg_10_2(arg_10_0)
		end
	end)
end

function var_0_0.SetVisible(arg_16_0, arg_16_1)
	setActive(arg_16_0._spinePaintingData.effectParent, arg_16_1)
	pg.ViewUtils.SetLayer(arg_16_0._tf, arg_16_1 and Layer.UI or Layer.UIHidden)
	setActiveViaLayer(arg_16_0._spinePaintingData.effectParent, arg_16_1)

	if arg_16_0._skeletonGraphic then
		arg_16_0._skeletonGraphic.timeScale = arg_16_1 and 1 or 0
	end

	if not arg_16_1 then
		arg_16_0.mainSpineAnim:SetActionCallBack(nil)

		arg_16_0.inAction = false
		arg_16_0.lockLayer = false
		arg_16_0.clickActionList = {}

		if LeanTween.isTweening(go(arg_16_0._tf)) then
			LeanTween.cancel(go(arg_16_0._tf))
		end

		if arg_16_0._baseShader then
			if arg_16_0._skeletonGraphic then
				arg_16_0._skeletonGraphic.material.shader = arg_16_0._baseShader
			end

			arg_16_0._baseShader = nil
		end

		arg_16_0._displayWord = false
	end

	arg_16_0:playPaintingInitIdle()
end

function var_0_0.getInitFlag(arg_17_0)
	return arg_17_0._initFlag
end

function var_0_0.playPaintingInitIdle(arg_18_0)
	local var_18_0 = SpinePaintingDrag.GetPaintingInitIdle(arg_18_0.mainSpineAnim.name, arg_18_0._spinePaintingData.ship.id)
	local var_18_1 = arg_18_0:getNormalIdleName()

	if var_18_0 then
		local var_18_2 = PlayerPrefs.GetInt(LIVE2D_STATUS_SAVE, 1)

		if PlayerPrefs.GetInt(LIVE2D_STATUS_SAVE, 1) == 1 and arg_18_0._idleName ~= var_18_0 then
			var_18_1 = var_18_0
		elseif PlayerPrefs.GetInt(LIVE2D_STATUS_SAVE, 1) ~= 1 and arg_18_0._idleName ~= arg_18_0:getNormalIdleName() then
			var_18_1 = arg_18_0:getNormalIdleName()
		end
	else
		var_18_1 = arg_18_0:getNormalIdleName()
	end

	if var_18_1 then
		arg_18_0:setIdleName(var_18_1)
		arg_18_0:SetAction(arg_18_0._idleName, 0)
	end
end

function var_0_0.getIdleName(arg_19_0)
	return arg_19_0._idleName
end

function var_0_0.setIdleName(arg_20_0, arg_20_1)
	arg_20_0._idleName = arg_20_1

	arg_20_0:updateHitArea()
end

function var_0_0.updateHitArea(arg_21_0)
	if arg_21_0.dragShipFlag then
		local var_21_0 = arg_21_0.shipDragData.drag_data.type
		local var_21_1 = arg_21_0.shipDragData.drag_data.config_client

		if var_21_0 == SpinePaintingConst.drag_type_normal then
			for iter_21_0 = 1, #var_21_1 do
				local var_21_2 = var_21_1[iter_21_0]
				local var_21_3 = var_21_2.hit

				if var_21_3 then
					setActive(findTF(arg_21_0._tf, "hitArea/" .. var_21_3), var_21_2.idle == arg_21_0._idleName)
				end
			end
		end
	end
end

function var_0_0.checkListAction(arg_22_0)
	if #arg_22_0.clickActionList > 0 then
		local var_22_0 = table.remove(arg_22_0.clickActionList, 1)

		arg_22_0:SetActionWithFinishCallback(var_22_0, 0, function()
			arg_22_0:checkListAction()
		end, true)
	else
		arg_22_0.inAction = false
		arg_22_0.lockLayer = false

		arg_22_0:SetAction(arg_22_0:getNormalIdleName(), 0)
	end
end

function var_0_0.displayWord(arg_24_0, arg_24_1)
	arg_24_0._displayWord = arg_24_1
end

function var_0_0.readyDragAction(arg_25_0, arg_25_1)
	if arg_25_0.inAction or arg_25_0._displayWord then
		return false
	end

	arg_25_0.inAction = true

	if arg_25_0.dragShipFlag then
		local var_25_0 = arg_25_0:startDragAction(arg_25_1)

		arg_25_0.inAction = var_25_0

		return var_25_0
	end

	return false
end

function var_0_0.startDragAction(arg_26_0, arg_26_1)
	local var_26_0 = arg_26_0.shipDragData.drag_data
	local var_26_1 = var_26_0.type

	if var_26_1 == SpinePaintingConst.drag_type_normal or var_26_1 == SpinePaintingConst.drag_type_rgb then
		return arg_26_0:changePaintingNormal(var_26_0, arg_26_1)
	elseif var_26_1 == SpinePaintingConst.drag_type_list then
		arg_26_0.clickActionList = Clone(var_26_0.config_client)
		arg_26_0.lockLayer = var_26_0.lock_layer

		return arg_26_0:checkListAction()
	elseif var_26_1 == SpinePaintingConst.drag_type_once then
		-- block empty
	end

	return false
end

function var_0_0.setEventTriggerCallback(arg_27_0, arg_27_1)
	arg_27_0._eventTriggerCall = arg_27_1
end

function var_0_0.changePaintingNormal(arg_28_0, arg_28_1, arg_28_2)
	local var_28_0 = arg_28_0:getIdleName()
	local var_28_1 = arg_28_1.config_client
	local var_28_2 = arg_28_1.type

	for iter_28_0, iter_28_1 in ipairs(var_28_1) do
		if arg_28_0:matchDragFlag(var_28_0, arg_28_2, iter_28_1) then
			return arg_28_0:doDragAction(var_28_2, arg_28_1, iter_28_1)
		end
	end

	return false
end

function var_0_0.doDragAction(arg_29_0, arg_29_1, arg_29_2, arg_29_3)
	local var_29_0 = arg_29_3.change_idle
	local var_29_1 = arg_29_3.action
	local var_29_2 = arg_29_3.event

	if arg_29_1 == SpinePaintingConst.drag_type_normal then
		if var_29_1 and var_29_1 ~= "" then
			arg_29_0:SetActionWithFinishCallback(var_29_1, 0, function()
				arg_29_0:changePaintingIdle(var_29_0)
			end, false, function()
				if var_29_2 and var_29_2 ~= "" and arg_29_0._eventTriggerCall then
					arg_29_0._eventTriggerCall(var_29_2)
				end
			end)
		else
			if var_29_0 and var_29_0 ~= "" then
				arg_29_0:changePaintingIdle(var_29_0)
			end

			if var_29_2 and var_29_2 ~= "" and arg_29_0._eventTriggerCall then
				arg_29_0._eventTriggerCall(var_29_2)
			end

			return false
		end
	elseif arg_29_1 == SpinePaintingConst.drag_type_rgb then
		arg_29_0._baseMaterial = arg_29_0._skeletonGraphic.material

		local var_29_3 = arg_29_2.material

		arg_29_0:getSpineMaterial(var_29_3, function(arg_32_0)
			arg_29_0._skeletonGraphic.material = arg_32_0

			LeanTween.delayedCall(go(arg_29_0._tf), 0.5, System.Action(function()
				arg_29_0._skeletonGraphic.material = arg_29_0._baseMaterial

				arg_29_0:changePaintingIdle(var_29_0)
			end))
		end)
	end

	return true
end

function var_0_0.matchDragFlag(arg_34_0, arg_34_1, arg_34_2, arg_34_3)
	local var_34_0 = arg_34_3.hit

	if var_34_0 and var_34_0 ~= arg_34_2 then
		return false
	end

	local var_34_1 = arg_34_3.is_default
	local var_34_2 = arg_34_3.idle

	if not arg_34_1 and var_34_1 then
		return true
	elseif arg_34_1 == var_34_2 then
		return true
	end

	return false
end

function var_0_0.getSpineMaterial(arg_35_0, arg_35_1, arg_35_2)
	if not arg_35_0._materialDic then
		arg_35_0._materialDic = {}
	end

	if arg_35_0._materialDic[arg_35_1] then
		arg_35_2(arg_35_0._materialDic[arg_35_1])
	else
		arg_35_0._materialDic[arg_35_1] = LoadAny("spinematerials", arg_35_1, typeof(Material))

		arg_35_2(arg_35_0._materialDic[arg_35_1])
	end
end

function var_0_0.changePaintingIdle(arg_36_0, arg_36_1)
	arg_36_0:setIdleName(arg_36_1)
	arg_36_0:SetAction(arg_36_1, 0)
	SpinePaintingDrag.SetPaintingInitIdle(arg_36_0.mainSpineAnim.name, arg_36_0._spinePaintingData.ship.id, arg_36_1)

	arg_36_0.inAction = false
end

function var_0_0.SetAction(arg_37_0, arg_37_1, arg_37_2, arg_37_3)
	if arg_37_0.lockLayer and not arg_37_3 then
		return
	end

	if arg_37_0._idleName ~= arg_37_0:getNormalIdleName() and arg_37_1 == "login" then
		return
	end

	if arg_37_0.multipleFaceFlag and not arg_37_0.inAction then
		arg_37_1 = arg_37_0:getMultipFaceAction(arg_37_1)
	end

	arg_37_0:updateEffectVisible(arg_37_1)

	for iter_37_0, iter_37_1 in ipairs(arg_37_0.spineAnimList) do
		iter_37_1:SetAction(arg_37_1, arg_37_2)
	end
end

function var_0_0.updateEffectVisible(arg_38_0, arg_38_1)
	if arg_38_0.shipEffectActionAble and arg_38_0._effectsTf then
		if table.contains(arg_38_0.shipEffectActionAble, arg_38_1) then
			if isActive(arg_38_0._effectsTf) then
				setActive(arg_38_0._effectsTf, false)
			end
		elseif not isActive(arg_38_0._effectsTf) then
			setActive(arg_38_0._effectsTf, true)
		end
	end
end

function var_0_0.isInAction(arg_39_0)
	return arg_39_0.inAction
end

function var_0_0.SetActionWithFinishCallback(arg_40_0, arg_40_1, arg_40_2, arg_40_3, arg_40_4, arg_40_5)
	arg_40_0.inAction = true

	arg_40_0:SetAction(arg_40_1, arg_40_2, arg_40_4)

	if arg_40_0.mainSpineAnim then
		arg_40_0.mainSpineAnim:SetActionCallBack(function(arg_41_0)
			if arg_41_0 == "finish" and arg_40_3 then
				arg_40_0.inAction = false

				arg_40_0.mainSpineAnim:SetActionCallBack(nil)
				arg_40_3()
			elseif arg_41_0 == "action" and arg_40_5 then
				arg_40_5()
			end
		end)
	end
end

function var_0_0.SetOnceAction(arg_42_0, arg_42_1, arg_42_2, arg_42_3, arg_42_4)
	arg_42_0:SetActionWithFinishCallback(arg_42_1, 0, function()
		arg_42_0.lockLayer = false

		arg_42_0:SetMainAction(arg_42_0:getIdleName(), 0)

		if arg_42_2 then
			arg_42_2()
		end
	end, arg_42_4, function()
		if arg_42_3 then
			arg_42_3()
		end
	end)

	arg_42_0.lockLayer = true
end

function var_0_0.SetMainAction(arg_45_0, arg_45_1, arg_45_2)
	if arg_45_0.mainSpineAnim then
		arg_45_0:SetAction(arg_45_1, 0)
	end
end

function var_0_0.getAnimationExist(arg_46_0, arg_46_1)
	if not arg_46_0._mainAnimationData then
		arg_46_0._mainAnimationData = arg_46_0.mainSpineAnim:GetAnimationState()
	end

	local var_46_0

	if arg_46_0._skeletonGraphic then
		var_46_0 = arg_46_0._skeletonGraphic.Skeleton.Data:FindAnimation(arg_46_1)
	end

	return var_46_0
end

function var_0_0.SetEmptyAction(arg_47_0, arg_47_1)
	for iter_47_0, iter_47_1 in ipairs(arg_47_0.spineAnimList) do
		local var_47_0 = iter_47_1:GetAnimationState()

		if var_47_0 then
			var_47_0:SetEmptyAnimation(arg_47_1, 0)
			GetComponent(iter_47_1.transform, "SkeletonGraphic"):Update(Time.deltaTime)
		end
	end
end

function var_0_0.getMultipFaceAction(arg_48_0, arg_48_1)
	if arg_48_0.multipleFaceFlag then
		local var_48_0 = tonumber(arg_48_1)

		if var_48_0 and var_48_0 >= 0 then
			for iter_48_0, iter_48_1 in ipairs(arg_48_0.multipleFaceData) do
				if iter_48_1[1] == arg_48_0:getIdleName() then
					return tostring(var_48_0 + iter_48_1[2])
				end
			end
		end
	end

	return arg_48_1
end

function var_0_0.Dispose(arg_49_0)
	arg_49_0._materialDic = {}

	if arg_49_0._spinePaintingData then
		arg_49_0._spinePaintingData:Clear()
	end

	arg_49_0._loader:Clear()

	if arg_49_0._go ~= nil then
		var_0_1.Destroy(arg_49_0._go)
	end

	if arg_49_0._bgEffectGo ~= nil then
		var_0_1.Destroy(arg_49_0._bgEffectGo)
	end

	arg_49_0._go = nil
	arg_49_0._tf = nil
	arg_49_0._bgEffectGo = nil
	arg_49_0._bgEffectTf = nil

	if arg_49_0.spineAnim then
		arg_49_0.spineAnim:SetActionCallBack(nil)
	end
end

function var_0_0.getPaintingName(arg_50_0)
	return arg_50_0._spinePaintingData:GetShipName()
end

return var_0_0
