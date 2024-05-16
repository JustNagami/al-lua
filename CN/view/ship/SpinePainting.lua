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

	arg_7_0.idleName = "normal"

	arg_7_0:checkActionShow()
end

local function var_0_3(arg_8_0, arg_8_1)
	arg_8_0._bgEffectGo = arg_8_1
	arg_8_0._bgEffectTf = tf(arg_8_1)

	UIUtil.SetLayerRecursively(arg_8_0._bgEffectGo, LayerMask.NameToLayer("UI"))
	arg_8_0._bgEffectTf:SetParent(arg_8_0._spinePaintingData.effectParent, true)

	arg_8_0._bgEffectTf.localScale = arg_8_0._spinePaintingData.bgEffectScale
	arg_8_0._bgEffectTf.localPosition = arg_8_0._spinePaintingData.bgEffectPos
end

function var_0_0.Ctor(arg_9_0, arg_9_1, arg_9_2)
	arg_9_0._spinePaintingData = arg_9_1
	arg_9_0._loader = AutoLoader.New()

	parallelAsync({
		function(arg_10_0)
			local var_10_0 = arg_9_0._spinePaintingData:GetShipName()
			local var_10_1, var_10_2 = HXSet.autoHxShift("spinepainting/", var_10_0)
			local var_10_3 = var_10_1 .. var_10_2

			arg_9_0._loader:LoadPrefab(var_10_3, nil, function(arg_11_0)
				var_0_2(arg_9_0, arg_11_0)
				arg_10_0()
			end, var_10_3)
		end,
		function(arg_12_0)
			local var_12_0 = arg_9_0._spinePaintingData.bgEffectName

			if var_12_0 ~= nil then
				local var_12_1 = "ui/" .. var_12_0

				arg_9_0._loader:LoadPrefab(var_12_1, var_12_0, function(arg_13_0)
					var_0_3(arg_9_0, arg_13_0)
					arg_12_0()
				end, var_12_1)
			else
				arg_12_0()
			end
		end
	}, function()
		setActive(arg_9_0._spinePaintingData.parent, true)
		setActive(arg_9_0._spinePaintingData.effectParent, true)

		if arg_9_2 then
			arg_9_2(arg_9_0)
		end
	end)
end

function var_0_0.SetVisible(arg_15_0, arg_15_1)
	setActive(arg_15_0._spinePaintingData.effectParent, arg_15_1)
	setActiveViaLayer(arg_15_0._spinePaintingData.effectParent, arg_15_1)
	setActive(arg_15_0._tf, arg_15_1)
	arg_15_0:checkActionShow()
end

function var_0_0.checkActionShow(arg_16_0)
	local var_16_0 = tostring(arg_16_0.mainSpineAnim.name) .. "_" .. tostring(arg_16_0._spinePaintingData.ship.id)
	local var_16_1 = PlayerPrefs.GetString(var_16_0)

	if var_16_1 and #var_16_1 > 0 then
		if PlayerPrefs.GetInt(LIVE2D_STATUS_SAVE, 1) == 1 and arg_16_0.idleName ~= var_16_1 then
			arg_16_0.idleName = var_16_1

			arg_16_0:SetAction(var_16_1, 0)
		elseif PlayerPrefs.GetInt(LIVE2D_STATUS_SAVE, 1) ~= 1 and arg_16_0.idleName ~= "normal" then
			arg_16_0.idleName = "normal"

			arg_16_0:SetAction(arg_16_0.idleName, 0)
		end
	end
end

function var_0_0.DoSpecialTouch(arg_17_0)
	if not arg_17_0.inAction then
		arg_17_0.inAction = true

		arg_17_0:SetActionWithCallback("special", 0, function()
			arg_17_0:SetAction("normal", 0)

			arg_17_0.inAction = false
		end)
	end
end

function var_0_0.DoDragTouch(arg_19_0)
	if string.find(arg_19_0.mainSpineAnim.name, "gaoxiong_6") == 1 and not arg_19_0.inAction then
		arg_19_0.inAction = true

		if not arg_19_0.idleName or arg_19_0.idleName ~= "ex" then
			arg_19_0.idleName = "ex"

			arg_19_0:SetActionWithFinishCallback("drag", 0, function()
				arg_19_0:SetAction("ex", 0)

				local var_20_0 = tostring(arg_19_0.mainSpineAnim.name) .. "_" .. tostring(arg_19_0._spinePaintingData.ship.id)

				PlayerPrefs.SetString(var_20_0, "ex")

				arg_19_0.inAction = false
			end)
		elseif arg_19_0.idleName == "ex" then
			arg_19_0.idleName = "normal"

			arg_19_0:SetActionWithFinishCallback("drag_ex", 0, function()
				local var_21_0 = tostring(arg_19_0.mainSpineAnim.name) .. "_" .. tostring(arg_19_0._spinePaintingData.ship.id)

				PlayerPrefs.SetString(var_21_0, "normal")
				arg_19_0:SetAction("normal", 0)

				arg_19_0.inAction = false
			end)
		end
	end
end

function var_0_0.SetAction(arg_22_0, arg_22_1, arg_22_2)
	if arg_22_2 == 1 and arg_22_0.inAction then
		return
	end

	if arg_22_1 == "normal" and arg_22_0.idleName ~= nil then
		arg_22_1 = arg_22_0.idleName
	end

	for iter_22_0, iter_22_1 in ipairs(arg_22_0.spineAnimList) do
		iter_22_1:SetAction(arg_22_1, arg_22_2)
	end
end

function var_0_0.SetActionWithCallback(arg_23_0, arg_23_1, arg_23_2, arg_23_3)
	arg_23_0:SetAction(arg_23_1, arg_23_2)

	if arg_23_0.mainSpineAnim then
		arg_23_0.mainSpineAnim:SetActionCallBack(function(arg_24_0)
			arg_23_0.mainSpineAnim:SetActionCallBack(nil)

			if arg_24_0 == "finish" and arg_23_3 then
				arg_23_3()
			end
		end)
		arg_23_0.mainSpineAnim:SetAction(arg_23_1, 0)
	end
end

function var_0_0.SetActionWithFinishCallback(arg_25_0, arg_25_1, arg_25_2, arg_25_3)
	arg_25_0:SetAction(arg_25_1, arg_25_2)

	if arg_25_0.mainSpineAnim then
		arg_25_0.mainSpineAnim:SetActionCallBack(function(arg_26_0)
			if arg_26_0 == "finish" and arg_25_3 then
				arg_25_0.mainSpineAnim:SetActionCallBack(nil)
				arg_25_3()
			end
		end)
		arg_25_0.mainSpineAnim:SetAction(arg_25_1, 0)
	end
end

function var_0_0.SetEmptyAction(arg_27_0, arg_27_1)
	for iter_27_0, iter_27_1 in ipairs(arg_27_0.spineAnimList) do
		local var_27_0 = iter_27_1:GetAnimationState()

		if var_27_0 then
			var_27_0:SetEmptyAnimation(arg_27_1, 0)
			GetComponent(iter_27_1.transform, "SkeletonGraphic"):Update(Time.deltaTime)
		end
	end
end

function var_0_0.Dispose(arg_28_0)
	if arg_28_0._spinePaintingData then
		arg_28_0._spinePaintingData:Clear()
	end

	arg_28_0._loader:Clear()

	if arg_28_0._go ~= nil then
		var_0_1.Destroy(arg_28_0._go)
	end

	if arg_28_0._bgEffectGo ~= nil then
		var_0_1.Destroy(arg_28_0._bgEffectGo)
	end

	arg_28_0._go = nil
	arg_28_0._tf = nil
	arg_28_0._bgEffectGo = nil
	arg_28_0._bgEffectTf = nil

	if arg_28_0.spineAnim then
		arg_28_0.spineAnim:SetActionCallBack(nil)
	end
end

return var_0_0
