local var_0_0 = class("SpinePainting")
local var_0_1 = require("Mgr/Pool/PoolUtil")
local var_0_2 = "spine_painting_idle_init_"

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

local function var_0_3(arg_7_0, arg_7_1)
	arg_7_0._go = arg_7_1
	arg_7_0._tf = tf(arg_7_1)

	UIUtil.SetLayerRecursively(arg_7_0._go, LayerMask.NameToLayer("UI"))
	arg_7_0._tf:SetParent(arg_7_0._spinePaintingData.parent, true)

	arg_7_0._tf.localScale = arg_7_0._spinePaintingData.scale
	arg_7_0._tf.localPosition = arg_7_0._spinePaintingData.pos
	arg_7_0.spineAnimList = {}

	local var_7_0 = arg_7_0._tf:GetComponent(typeof(ItemList)).prefabItem

	for iter_7_0 = 0, var_7_0.Length - 1 do
		arg_7_0.spineAnimList[#arg_7_0.spineAnimList + 1] = GetOrAddComponent(var_7_0[iter_7_0], "SpineAnimUI")
	end

	local var_7_1 = #arg_7_0.spineAnimList

	assert(var_7_1 > 0, "动态立绘至少要保证有一个spine动画，请检查" .. arg_7_0._spinePaintingData:GetShipName())

	if var_7_1 == 1 then
		arg_7_0.mainSpineAnim = arg_7_0.spineAnimList[1]
	else
		arg_7_0.mainSpineAnim = arg_7_0.spineAnimList[#arg_7_0.spineAnimList]
	end

	arg_7_0._skeletonGraphic = arg_7_0.mainSpineAnim:GetComponent("SkeletonGraphic")
	arg_7_0._idleName = arg_7_0:getNormalName()
	arg_7_0.shipDragData = SpinePaintingConst.ship_drag_datas[arg_7_0._spinePaintingData:GetShipName()]
	arg_7_0.shipEffectActionAble = SpinePaintingConst.ship_effect_action_able[arg_7_0._spinePaintingData:GetShipName()]
	arg_7_0._effectsTf = findTF(arg_7_0._tf, "effects")

	arg_7_0:checkActionShow()
end

function var_0_0.getNormalName(arg_8_0)
	return "normal"
end

local function var_0_4(arg_9_0, arg_9_1)
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
				var_0_3(arg_10_0, arg_12_0)
				arg_11_0()
			end, var_11_3)
		end,
		function(arg_13_0)
			local var_13_0 = arg_10_0._spinePaintingData.bgEffectName

			if var_13_0 ~= nil then
				local var_13_1 = "ui/" .. var_13_0

				arg_10_0._loader:LoadPrefab(var_13_1, "", function(arg_14_0)
					var_0_4(arg_10_0, arg_14_0)
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

	arg_16_0:checkActionShow()
end

function var_0_0.getInitFlag(arg_17_0)
	return arg_17_0._initFlag
end

function var_0_0.checkActionShow(arg_18_0)
	local var_18_0 = arg_18_0:getSpinePaintingInitIdle()
	local var_18_1

	if var_18_0 then
		if PlayerPrefs.GetInt(LIVE2D_STATUS_SAVE, 1) == 1 and arg_18_0._idleName ~= var_18_0 then
			var_18_1 = var_18_0
		elseif PlayerPrefs.GetInt(LIVE2D_STATUS_SAVE, 1) ~= 1 and arg_18_0._idleName ~= arg_18_0:getNormalName() then
			var_18_1 = arg_18_0:getNormalName()
		end
	else
		var_18_1 = arg_18_0:getNormalName()
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
end

function var_0_0.DoSpecialTouch(arg_21_0)
	if not arg_21_0.inAction then
		arg_21_0.inAction = true

		arg_21_0:SetActionWithFinishCallback("special", 0, function()
			arg_21_0:SetAction(arg_21_0:getNormalName(), 0)

			arg_21_0.inAction = false
		end)
	end
end

function var_0_0.DoDragClick(arg_23_0)
	if arg_23_0:isDragClickShip() then
		return arg_23_0:updateDragClick()
	end

	return false
end

function var_0_0.isDragClickShip(arg_24_0)
	if arg_24_0.shipDragData then
		return arg_24_0.shipDragData.drag_click_data and arg_24_0.shipDragData.drag_click_data.type
	end

	return false
end

function var_0_0.updateDragClick(arg_25_0)
	if arg_25_0.inAction or arg_25_0._displayWord then
		return false
	else
		arg_25_0.inAction = true
	end

	local var_25_0 = arg_25_0.shipDragData.drag_click_data

	return arg_25_0:checkSpecialDrag(var_25_0)
end

function var_0_0.checkListAction(arg_26_0)
	if #arg_26_0.clickActionList > 0 then
		local var_26_0 = table.remove(arg_26_0.clickActionList, 1)

		arg_26_0:SetActionWithFinishCallback(var_26_0, 0, function()
			arg_26_0:checkListAction()
		end, true)
	else
		arg_26_0.inAction = false
		arg_26_0.lockLayer = false

		arg_26_0:SetAction(arg_26_0:getNormalName(), 0)
	end
end

function var_0_0.displayWord(arg_28_0, arg_28_1)
	arg_28_0._displayWord = arg_28_1
end

function var_0_0.DoDragTouch(arg_29_0)
	if arg_29_0.inAction or arg_29_0._displayWord then
		return false
	else
		arg_29_0.inAction = true
	end

	if arg_29_0:isDragShip() then
		local var_29_0 = arg_29_0.shipDragData.drag_data

		arg_29_0:checkSpecialDrag(var_29_0)
	end
end

function var_0_0.isDragShip(arg_30_0)
	if arg_30_0.shipDragData then
		return arg_30_0.shipDragData.drag_data and arg_30_0.shipDragData.drag_data.type
	end

	return false
end

function var_0_0.checkSpecialDrag(arg_31_0, arg_31_1)
	local var_31_0 = arg_31_1.type

	if var_31_0 == SpinePaintingConst.drag_type_normal or var_31_0 == SpinePaintingConst.drag_type_rgb then
		arg_31_0:doDragChange(arg_31_1)
	elseif var_31_0 == SpinePaintingConst.drag_type_list then
		arg_31_0.clickActionList = Clone(arg_31_1.list)
		arg_31_0.lockLayer = arg_31_1.lock_layer

		arg_31_0:checkListAction()

		return true
	end

	return false
end

function var_0_0.doDragChange(arg_32_0, arg_32_1)
	local var_32_0 = arg_32_0:getIdleName()

	if not var_32_0 or var_32_0 ~= "ex" then
		var_32_0 = "ex"

		arg_32_0:setIdleName(var_32_0)

		local var_32_1 = arg_32_1.type
		local var_32_2 = arg_32_1.name

		if var_32_1 == SpinePaintingConst.drag_type_normal then
			arg_32_0:SetActionWithFinishCallback("drag", 0, function()
				arg_32_0:changeSpecialIdle(var_32_0)
			end)
		elseif var_32_1 == SpinePaintingConst.drag_type_rgb then
			arg_32_0._baseMaterial = arg_32_0._skeletonGraphic.material

			arg_32_0:getSpineMaterial("SkeletonGraphicDefaultRGBSplit", function(arg_34_0)
				arg_32_0._skeletonGraphic.material = arg_34_0

				LeanTween.delayedCall(go(arg_32_0._tf), 0.5, System.Action(function()
					arg_32_0._skeletonGraphic.material = arg_32_0._baseMaterial

					arg_32_0:changeSpecialIdle(var_32_0)
				end))
			end)
		end
	elseif var_32_0 == "ex" then
		var_32_0 = "normal"

		arg_32_0:setIdleName(var_32_0)

		local var_32_3 = arg_32_1.type
		local var_32_4 = arg_32_1.name

		if var_32_3 == SpinePaintingConst.drag_type_normal then
			arg_32_0:SetActionWithFinishCallback("drag_ex", 0, function()
				arg_32_0:changeSpecialIdle(var_32_0)
			end)
		elseif var_32_3 == SpinePaintingConst.drag_type_rgb then
			arg_32_0._baseMaterial = arg_32_0._skeletonGraphic.material

			arg_32_0:getSpineMaterial("SkeletonGraphicDefaultRGBSplit", function(arg_37_0)
				arg_32_0._skeletonGraphic.material = arg_37_0

				LeanTween.delayedCall(go(arg_32_0._tf), 0.5, System.Action(function()
					arg_32_0._skeletonGraphic.material = arg_32_0._baseMaterial

					arg_32_0:changeSpecialIdle(var_32_0)
				end))
			end)
		end
	end
end

function var_0_0.getSpineMaterial(arg_39_0, arg_39_1, arg_39_2)
	if not arg_39_0._materialDic then
		arg_39_0._materialDic = {}
	end

	if arg_39_0._materialDic[arg_39_1] then
		arg_39_2(arg_39_0._materialDic[arg_39_1])
	else
		arg_39_0._materialDic[arg_39_1] = LoadAny("spinematerials", arg_39_1, typeof(Material))

		arg_39_2(arg_39_0._materialDic[arg_39_1])
	end
end

function var_0_0.changeSpecialIdle(arg_40_0, arg_40_1)
	arg_40_0:SetAction(arg_40_1, 0)
	arg_40_0:setSpinePaintingInitIdle(arg_40_1)

	arg_40_0.inAction = false
end

function var_0_0.SetAction(arg_41_0, arg_41_1, arg_41_2, arg_41_3)
	local var_41_0, var_41_1 = arg_41_0:getMultipFaceFlag()

	if var_41_0 then
		arg_41_1 = arg_41_0:getMultipFaceAction(arg_41_1, arg_41_2)
	end

	if arg_41_0.lockLayer and not arg_41_3 then
		return
	end

	if not arg_41_1 then
		return
	end

	arg_41_1 = arg_41_1 == arg_41_0:getNormalName() and arg_41_0._idleName and arg_41_0._idleName or arg_41_1

	if arg_41_0.shipEffectActionAble and arg_41_0._effectsTf then
		if table.contains(arg_41_0.shipEffectActionAble, arg_41_1) then
			if isActive(arg_41_0._effectsTf) then
				setActive(arg_41_0._effectsTf, false)
				print("特效层级隐藏生效")
			end
		elseif not isActive(arg_41_0._effectsTf) then
			setActive(arg_41_0._effectsTf, true)
			print("特效层级显示生效")
		end
	end

	for iter_41_0, iter_41_1 in ipairs(arg_41_0.spineAnimList) do
		iter_41_1:SetAction(arg_41_1, arg_41_2)
	end
end

function var_0_0.isInAction(arg_42_0)
	return arg_42_0.inAction
end

function var_0_0.SetActionWithFinishCallback(arg_43_0, arg_43_1, arg_43_2, arg_43_3, arg_43_4, arg_43_5)
	arg_43_0.inAction = true

	print("播放动作" .. arg_43_1)
	arg_43_0:SetAction(arg_43_1, arg_43_2, arg_43_4)

	if arg_43_0.mainSpineAnim then
		arg_43_0.mainSpineAnim:SetActionCallBack(function(arg_44_0)
			if arg_44_0 == "finish" and arg_43_3 then
				arg_43_0.inAction = false

				arg_43_0.mainSpineAnim:SetActionCallBack(nil)
				arg_43_3()
			elseif arg_44_0 == "action" and arg_43_5 then
				arg_43_5()
			end
		end)
	end
end

function var_0_0.SetOnceAction(arg_45_0, arg_45_1, arg_45_2, arg_45_3, arg_45_4)
	arg_45_0:SetActionWithFinishCallback(arg_45_1, 0, function()
		arg_45_0:SetMainAction(arg_45_0:getIdleName(), 0)

		if arg_45_2 then
			arg_45_2()
		end
	end, arg_45_4, function()
		if arg_45_3 then
			arg_45_3()
		end
	end)
end

function var_0_0.SetMainAction(arg_48_0, arg_48_1, arg_48_2)
	if arg_48_0.mainSpineAnim then
		arg_48_0:SetAction(arg_48_1, 0)
	end
end

function var_0_0.getAnimationExist(arg_49_0, arg_49_1)
	if not arg_49_0._mainAnimationData then
		arg_49_0._mainAnimationData = arg_49_0.mainSpineAnim:GetAnimationState()
	end

	local var_49_0

	if arg_49_0._skeletonGraphic then
		var_49_0 = arg_49_0._skeletonGraphic.SkeletonData:FindAnimation(arg_49_1)
	end

	return var_49_0
end

function var_0_0.SetEmptyAction(arg_50_0, arg_50_1)
	for iter_50_0, iter_50_1 in ipairs(arg_50_0.spineAnimList) do
		local var_50_0 = iter_50_1:GetAnimationState()

		if var_50_0 then
			var_50_0:SetEmptyAnimation(arg_50_1, 0)
			GetComponent(iter_50_1.transform, "SkeletonGraphic"):Update(Time.deltaTime)
		end
	end
end

function var_0_0.getMultipFaceFlag(arg_51_0)
	local var_51_0 = false
	local var_51_1 = 0

	if arg_51_0.shipDragData and arg_51_0.shipDragData.multiple_face then
		var_51_0 = table.contains(arg_51_0.shipDragData.multiple_face, arg_51_0.mainSpineAnim.name)
	end

	if arg_51_0.shipDragData and arg_51_0.shipDragData.multiple_count then
		var_51_1 = arg_51_0.shipDragData.multiple_count
	end

	return var_51_0, var_51_1
end

function var_0_0.getMultipFaceAction(arg_52_0, arg_52_1, arg_52_2)
	local var_52_0, var_52_1 = arg_52_0:getMultipFaceFlag()

	if var_52_0 and arg_52_0._idleName == "ex" and arg_52_2 == 1 then
		if arg_52_0.inAction then
			return nil
		end

		local var_52_2 = tonumber(arg_52_1)

		if var_52_2 then
			arg_52_1 = tostring(var_52_2 + var_52_1)
		end
	end

	return arg_52_1
end

function var_0_0.Dispose(arg_53_0)
	arg_53_0._materialDic = {}

	if arg_53_0._spinePaintingData then
		arg_53_0._spinePaintingData:Clear()
	end

	arg_53_0._loader:Clear()

	if arg_53_0._go ~= nil then
		var_0_1.Destroy(arg_53_0._go)
	end

	if arg_53_0._bgEffectGo ~= nil then
		var_0_1.Destroy(arg_53_0._bgEffectGo)
	end

	arg_53_0._go = nil
	arg_53_0._tf = nil
	arg_53_0._bgEffectGo = nil
	arg_53_0._bgEffectTf = nil

	if arg_53_0.spineAnim then
		arg_53_0.spineAnim:SetActionCallBack(nil)
	end
end

function var_0_0.setSpinePaintingInitIdle(arg_54_0, arg_54_1)
	local var_54_0 = var_0_2 .. tostring(arg_54_0.mainSpineAnim.name) .. tostring(arg_54_0._spinePaintingData.ship.id)

	PlayerPrefs.SetString(var_54_0, arg_54_1)
end

function var_0_0.getSpinePaintingInitIdle(arg_55_0)
	local var_55_0 = var_0_2 .. tostring(arg_55_0.mainSpineAnim.name) .. tostring(arg_55_0._spinePaintingData.ship.id)
	local var_55_1 = PlayerPrefs.GetString(var_55_0)

	if var_55_1 and #var_55_1 > 0 then
		return var_55_1
	end

	return nil
end

function var_0_0.getPaintingName(arg_56_0)
	return arg_56_0._spinePaintingData:GetShipName()
end

return var_0_0
