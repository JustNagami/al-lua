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
	arg_7_0.idleName = arg_7_0:getNormalName()
	arg_7_0.shipDragData = SpinePaintingConst.ship_drag_datas[arg_7_0._spinePaintingData:GetShipName()]

	arg_7_0:checkActionShow()
end

function var_0_0.getNormalName(arg_8_0)
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

				arg_10_0._loader:LoadPrefab(var_13_1, var_13_0, function(arg_14_0)
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

		if arg_10_2 then
			arg_10_2(arg_10_0)
		end
	end)
end

function var_0_0.SetVisible(arg_16_0, arg_16_1)
	setActive(arg_16_0._spinePaintingData.effectParent, arg_16_1)
	setActiveViaLayer(arg_16_0._spinePaintingData.effectParent, arg_16_1)

	if not arg_16_1 then
		arg_16_0.mainSpineAnim:SetActionCallBack(nil)

		arg_16_0.inAction = false

		if LeanTween.isTweening(go(arg_16_0._tf)) then
			LeanTween.cancel(go(arg_16_0._tf))
		end

		if arg_16_0._baseShader then
			arg_16_0._skeletonGraphic.material.shader = arg_16_0._baseShader
			arg_16_0._baseShader = nil
		end
	end

	arg_16_0:checkActionShow()
end

function var_0_0.checkActionShow(arg_17_0)
	local var_17_0 = tostring(arg_17_0.mainSpineAnim.name) .. "_" .. tostring(arg_17_0._spinePaintingData.ship.id)
	local var_17_1 = PlayerPrefs.GetString(var_17_0)

	if var_17_1 and #var_17_1 > 0 then
		if PlayerPrefs.GetInt(LIVE2D_STATUS_SAVE, 1) == 1 and arg_17_0.idleName ~= var_17_1 then
			arg_17_0.idleName = var_17_1

			arg_17_0:SetAction(var_17_1, 0)
		elseif PlayerPrefs.GetInt(LIVE2D_STATUS_SAVE, 1) ~= 1 and arg_17_0.idleName ~= arg_17_0:getNormalName() then
			arg_17_0.idleName = arg_17_0:getNormalName()

			arg_17_0:SetAction(arg_17_0.idleName, 0)
		end
	end
end

function var_0_0.DoSpecialTouch(arg_18_0)
	if not arg_18_0.inAction then
		arg_18_0.inAction = true

		arg_18_0:SetActionWithFinishCallback("special", 0, function()
			arg_18_0:SetAction(arg_18_0:getNormalName(), 0)

			arg_18_0.inAction = false
		end)
	end
end

function var_0_0.DoDragClick(arg_20_0)
	if arg_20_0:isDragClickShip() then
		arg_20_0:updateDragClick()
	end
end

function var_0_0.isDragClickShip(arg_21_0)
	if arg_21_0.shipDragData then
		return arg_21_0.shipDragData.drag_click_data and arg_21_0.shipDragData.drag_click_data.type
	end

	return false
end

function var_0_0.updateDragClick(arg_22_0)
	if arg_22_0.inAction then
		return
	else
		arg_22_0.inAction = true
	end

	local var_22_0 = arg_22_0.shipDragData.drag_click_data

	if var_22_0.type == SpinePaintingConst.click_type_list then
		arg_22_0.clickActionList = Clone(var_22_0.list)
		arg_22_0.lockLayer = var_22_0.lock_layer

		arg_22_0:checkListAction()
	end
end

function var_0_0.checkListAction(arg_23_0)
	if #arg_23_0.clickActionList > 0 then
		local var_23_0 = table.remove(arg_23_0.clickActionList, 1)

		arg_23_0.lockLayer = clickData.lock_layer

		arg_23_0:SetActionWithFinishCallback(var_23_0, 0, function()
			arg_23_0:checkListAction()
		end)
	elseif arg_23_0.inAction then
		arg_23_0.inAction = false
		arg_23_0.lockLayer = false
	end
end

function var_0_0.DoDragTouch(arg_25_0)
	if arg_25_0:isDragShip() then
		arg_25_0:updateDragTouch()
	end
end

function var_0_0.isDragShip(arg_26_0)
	if arg_26_0.shipDragData then
		return arg_26_0.shipDragData.drag_data and arg_26_0.shipDragData.drag_data.type
	end

	return false
end

function var_0_0.updateDragTouch(arg_27_0)
	if arg_27_0.inAction then
		return
	else
		arg_27_0.inAction = true
	end

	local var_27_0 = arg_27_0.shipDragData.drag_data

	if not arg_27_0.idleName or arg_27_0.idleName ~= "ex" then
		arg_27_0.idleName = "ex"

		local var_27_1 = var_27_0.type
		local var_27_2 = var_27_0.name

		if var_27_1 == SpinePaintingConst.drag_type_normal then
			arg_27_0:SetActionWithFinishCallback("drag", 0, function()
				arg_27_0:changeSpecialIdle(arg_27_0.idleName)
			end)
		elseif var_27_1 == SpinePaintingConst.drag_type_rgb then
			arg_27_0._baseMaterial = arg_27_0._skeletonGraphic.material

			arg_27_0:getSpineMaterial("SkeletonGraphicDefaultRGBSplit", function(arg_29_0)
				arg_27_0._skeletonGraphic.material = arg_29_0

				LeanTween.delayedCall(go(arg_27_0._tf), 0.5, System.Action(function()
					arg_27_0._skeletonGraphic.material = arg_27_0._baseMaterial

					arg_27_0:changeSpecialIdle(arg_27_0.idleName)
				end))
			end)
		end
	elseif arg_27_0.idleName == "ex" then
		arg_27_0.idleName = "normal"

		local var_27_3 = var_27_0.type
		local var_27_4 = var_27_0.name

		if var_27_3 == SpinePaintingConst.drag_type_normal then
			arg_27_0:SetActionWithFinishCallback("drag_ex", 0, function()
				arg_27_0:changeSpecialIdle(arg_27_0.idleName)
			end)
		elseif var_27_3 == SpinePaintingConst.drag_type_rgb then
			arg_27_0._baseMaterial = arg_27_0._skeletonGraphic.material

			arg_27_0:getSpineMaterial("SkeletonGraphicDefaultRGBSplit", function(arg_32_0)
				arg_27_0._skeletonGraphic.material = arg_32_0

				LeanTween.delayedCall(go(arg_27_0._tf), 0.5, System.Action(function()
					arg_27_0._skeletonGraphic.material = arg_27_0._baseMaterial

					arg_27_0:changeSpecialIdle(arg_27_0.idleName)
				end))
			end)
		end
	end
end

function var_0_0.getSpineMaterial(arg_34_0, arg_34_1, arg_34_2)
	if not arg_34_0._materialDic then
		arg_34_0._materialDic = {}
	end

	if arg_34_0._materialDic[arg_34_1] then
		arg_34_2(arg_34_0._materialDic[arg_34_1])
	end

	PoolMgr:GetInstance():LoadAsset("spinematerials", arg_34_1, false, typeof(Material), function(arg_35_0)
		arg_34_0._materialDic[arg_34_1] = arg_35_0

		arg_34_2(arg_34_0._materialDic[arg_34_1])
	end, false)
end

function var_0_0.changeSpecialIdle(arg_36_0, arg_36_1)
	arg_36_0:SetAction(arg_36_1, 0)

	local var_36_0 = tostring(arg_36_0.mainSpineAnim.name) .. "_" .. tostring(arg_36_0._spinePaintingData.ship.id)

	PlayerPrefs.SetString(var_36_0, arg_36_1)

	arg_36_0.inAction = false
end

function var_0_0.SetAction(arg_37_0, arg_37_1, arg_37_2)
	if arg_37_0:getMultipFaceFlag() then
		arg_37_1 = arg_37_0:getMultipFaceAction(arg_37_1, arg_37_2)
	end

	if arg_37_0.lockLayer and arg_37_2 ~= 0 then
		return
	end

	if not arg_37_1 then
		return
	end

	if arg_37_0.idleName and arg_37_1 == arg_37_0:getNormalName() then
		arg_37_1 = arg_37_0.idleName
	end

	for iter_37_0, iter_37_1 in ipairs(arg_37_0.spineAnimList) do
		iter_37_1:SetAction(arg_37_1, arg_37_2)
	end
end

function var_0_0.isInAction(arg_38_0)
	return arg_38_0.inAction
end

function var_0_0.SetActionWithFinishCallback(arg_39_0, arg_39_1, arg_39_2, arg_39_3)
	arg_39_0:SetAction(arg_39_1, arg_39_2)

	if arg_39_0.mainSpineAnim then
		arg_39_0.mainSpineAnim:SetActionCallBack(function(arg_40_0)
			if arg_40_0 == "finish" and arg_39_3 then
				arg_39_0.mainSpineAnim:SetActionCallBack(nil)
				arg_39_3()
			end
		end)
		arg_39_0.mainSpineAnim:SetAction(arg_39_1, 0)
	end
end

function var_0_0.SetEmptyAction(arg_41_0, arg_41_1)
	for iter_41_0, iter_41_1 in ipairs(arg_41_0.spineAnimList) do
		local var_41_0 = iter_41_1:GetAnimationState()

		if var_41_0 then
			var_41_0:SetEmptyAnimation(arg_41_1, 0)
			GetComponent(iter_41_1.transform, "SkeletonGraphic"):Update(Time.deltaTime)
		end
	end
end

function var_0_0.getMultipFaceFlag(arg_42_0)
	if arg_42_0.shipDragData and arg_42_0.shipDragData.multiple_face then
		return table.contains(arg_42_0.shipDragData.multiple_face, arg_42_0.mainSpineAnim.name)
	end

	return false
end

function var_0_0.getMultipFaceAction(arg_43_0, arg_43_1, arg_43_2)
	if arg_43_0:getMultipFaceFlag() and arg_43_0.idleName == "ex" and arg_43_2 == 1 then
		if arg_43_0.inAction then
			return nil
		end

		local var_43_0 = tonumber(arg_43_1)

		if var_43_0 then
			arg_43_1 = tostring(var_43_0 + 5)
		end
	end

	return arg_43_1
end

function var_0_0.Dispose(arg_44_0)
	arg_44_0._materialDic = {}

	if arg_44_0._spinePaintingData then
		arg_44_0._spinePaintingData:Clear()
	end

	arg_44_0._loader:Clear()

	if arg_44_0._go ~= nil then
		var_0_1.Destroy(arg_44_0._go)
	end

	if arg_44_0._bgEffectGo ~= nil then
		var_0_1.Destroy(arg_44_0._bgEffectGo)
	end

	arg_44_0._go = nil
	arg_44_0._tf = nil
	arg_44_0._bgEffectGo = nil
	arg_44_0._bgEffectTf = nil

	if arg_44_0.spineAnim then
		arg_44_0.spineAnim:SetActionCallBack(nil)
	end
end

return var_0_0
