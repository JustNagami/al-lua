function tf(arg_1_0)
	return arg_1_0.transform
end

function go(arg_2_0)
	return tf(arg_2_0).gameObject
end

function rtf(arg_3_0)
	return arg_3_0.transform
end

function findGO(arg_4_0, arg_4_1)
	assert(arg_4_0, "object or transform should exist")

	local var_4_0 = tf(arg_4_0):Find(arg_4_1)

	return var_4_0 and var_4_0.gameObject
end

function findTF(arg_5_0, arg_5_1)
	assert(arg_5_0, "object or transform should exist " .. arg_5_1)

	return (tf(arg_5_0):Find(arg_5_1))
end

function Instantiate(arg_6_0)
	return Object.Instantiate(go(arg_6_0))
end

instantiate = Instantiate

function Destroy(arg_7_0)
	Object.Destroy(go(arg_7_0))
end

destroy = Destroy

function SetActive(arg_8_0, arg_8_1)
	LuaHelper.SetActiveForLua(arg_8_0, tobool(arg_8_1))
end

setActive = SetActive

function isActive(arg_9_0)
	return go(arg_9_0).activeSelf
end

function SetName(arg_10_0, arg_10_1)
	arg_10_0.name = arg_10_1
end

setName = SetName

function SetParent(arg_11_0, arg_11_1, arg_11_2)
	LuaHelper.SetParentForLua(arg_11_0, arg_11_1, tobool(arg_11_2))
end

setParent = SetParent

function setText(arg_12_0, arg_12_1)
	if not arg_12_1 then
		return
	end

	arg_12_0:GetComponent(typeof(Text)).text = tostring(arg_12_1)
end

function setScrollText(arg_13_0, arg_13_1)
	if not arg_13_1 then
		return
	end

	arg_13_0:GetComponent("ScrollText"):SetText(tostring(arg_13_1))
end

function setTextEN(arg_14_0, arg_14_1)
	if not arg_14_1 then
		return
	end

	arg_14_1 = splitByWordEN(arg_14_1, arg_14_0)
	arg_14_0:GetComponent(typeof(Text)).text = tostring(arg_14_1)
end

function setBestFitTextEN(arg_15_0, arg_15_1, arg_15_2)
	if not arg_15_1 then
		return
	end

	local var_15_0 = arg_15_0:GetComponent(typeof(RectTransform))
	local var_15_1 = arg_15_0:GetComponent(typeof(Text))
	local var_15_2 = arg_15_2 or 20
	local var_15_3 = var_15_0.rect.width
	local var_15_4 = var_15_0.rect.height

	while var_15_2 > 0 do
		var_15_1.fontSize = var_15_2

		local var_15_5 = splitByWordEN(arg_15_1, arg_15_0)

		var_15_1.text = tostring(var_15_5)

		if var_15_3 >= var_15_1.preferredWidth and var_15_4 >= var_15_1.preferredHeight then
			break
		end

		var_15_2 = var_15_2 - 1
	end
end

function setTextFont(arg_16_0, arg_16_1)
	if not arg_16_1 then
		return
	end

	arg_16_0:GetComponent(typeof(Text)).font = arg_16_1
end

function getText(arg_17_0)
	return arg_17_0:GetComponent(typeof(Text)).text
end

function setInputText(arg_18_0, arg_18_1)
	if not arg_18_1 then
		return
	end

	arg_18_0:GetComponent(typeof(InputField)).text = arg_18_1
end

function getInputText(arg_19_0)
	return arg_19_0:GetComponent(typeof(InputField)).text
end

function onInputEndEdit(arg_20_0, arg_20_1, arg_20_2)
	local var_20_0 = arg_20_1:GetComponent(typeof(InputField)).onEndEdit

	pg.DelegateInfo.Add(arg_20_0, var_20_0)
	var_20_0:RemoveAllListeners()
	var_20_0:AddListener(arg_20_2)
end

function activateInputField(arg_21_0)
	arg_21_0:GetComponent(typeof(InputField)):ActivateInputField()
end

function setButtonText(arg_22_0, arg_22_1, arg_22_2)
	setWidgetText(arg_22_0, arg_22_1, arg_22_2)
end

function setWidgetText(arg_23_0, arg_23_1, arg_23_2)
	arg_23_2 = arg_23_2 or "Text"
	arg_23_2 = findTF(arg_23_0, arg_23_2)

	setText(arg_23_2, arg_23_1)
end

function setWidgetTextEN(arg_24_0, arg_24_1, arg_24_2)
	arg_24_2 = arg_24_2 or "Text"
	arg_24_2 = findTF(arg_24_0, arg_24_2)

	setTextEN(arg_24_2, arg_24_1)
end

local var_0_0
local var_0_1 = true
local var_0_2 = -1

function onButton(arg_25_0, arg_25_1, arg_25_2, arg_25_3, arg_25_4)
	local var_25_0 = GetOrAddComponent(arg_25_1, typeof(Button))

	assert(var_25_0, "could not found Button component on " .. arg_25_1.name)
	assert(arg_25_2, "callback should exist")

	local var_25_1 = var_25_0.onClick

	pg.DelegateInfo.Add(arg_25_0, var_25_1)
	var_25_1:RemoveAllListeners()
	var_25_1:AddListener(function()
		if var_0_2 == Time.frameCount and Input.touchCount > 1 then
			return
		end

		var_0_2 = Time.frameCount

		if arg_25_3 and var_0_1 then
			pg.CriMgr.GetInstance():PlaySoundEffect_V3(arg_25_3)
		end

		arg_25_2()
	end)
end

function removeOnButton(arg_27_0)
	local var_27_0 = arg_27_0:GetComponent(typeof(Button))

	if var_27_0 ~= nil then
		var_27_0.onClick:RemoveAllListeners()
	end
end

function removeAllOnButton(arg_28_0)
	local var_28_0 = arg_28_0:GetComponentsInChildren(typeof(Button))

	for iter_28_0 = 1, var_28_0.Length do
		local var_28_1 = var_28_0[iter_28_0 - 1]

		if var_28_1 ~= nil then
			var_28_1.onClick:RemoveAllListeners()
		end
	end
end

function ClearAllText(arg_29_0)
	local var_29_0 = arg_29_0:GetComponentsInChildren(typeof(Text))

	for iter_29_0 = 1, var_29_0.Length do
		local var_29_1 = var_29_0[iter_29_0 - 1]

		if var_29_1 ~= nil then
			var_29_1.text = ""
		end
	end
end

function onLongPressTrigger(arg_30_0, arg_30_1, arg_30_2, arg_30_3)
	local var_30_0 = GetOrAddComponent(arg_30_1, typeof(UILongPressTrigger))

	assert(var_30_0, "could not found UILongPressTrigger component on " .. arg_30_1.name)
	assert(arg_30_2, "callback should exist")

	local var_30_1 = var_30_0.onLongPressed

	pg.DelegateInfo.Add(arg_30_0, var_30_1)
	var_30_1:RemoveAllListeners()
	var_30_1:AddListener(function()
		if arg_30_3 then
			pg.CriMgr.GetInstance():PlaySoundEffect_V3(arg_30_3)
		end

		arg_30_2()
	end)
end

function removeOnLongPressTrigger(arg_32_0)
	local var_32_0 = arg_32_0:GetComponent(typeof(UILongPressTrigger))

	if var_32_0 ~= nil then
		var_32_0.onLongPressed:RemoveAllListeners()
	end
end

function setButtonEnabled(arg_33_0, arg_33_1)
	GetComponent(arg_33_0, typeof(Button)).interactable = arg_33_1
end

function setToggleEnabled(arg_34_0, arg_34_1)
	GetComponent(arg_34_0, typeof(Toggle)).interactable = arg_34_1
end

function setSliderEnable(arg_35_0, arg_35_1)
	GetComponent(arg_35_0, typeof(Slider)).interactable = arg_35_1
end

function triggerButton(arg_36_0)
	local var_36_0 = GetComponent(arg_36_0, typeof(Button))

	var_0_1 = false
	var_0_2 = -1

	var_36_0.onClick:Invoke()

	var_0_1 = true
end

local var_0_3 = true

function onToggle(arg_37_0, arg_37_1, arg_37_2, arg_37_3, arg_37_4)
	local var_37_0 = GetComponent(arg_37_1, typeof(Toggle))

	assert(arg_37_2, "callback should exist")

	local var_37_1 = var_37_0.onValueChanged

	var_37_1:RemoveAllListeners()
	pg.DelegateInfo.Add(arg_37_0, var_37_1)
	var_37_1:AddListener(function(arg_38_0)
		if var_0_3 then
			if arg_38_0 and arg_37_3 and var_37_0.isOn == arg_38_0 then
				arg_37_3 = SFX_UI_TAG

				pg.CriMgr.GetInstance():PlaySoundEffect_V3(arg_37_3)
			elseif not arg_38_0 and arg_37_4 then
				pg.CriMgr.GetInstance():PlaySoundEffect_V3(arg_37_4)
			end
		end

		arg_37_2(arg_38_0)
	end)

	local var_37_2 = GetComponent(arg_37_1, typeof(UIToggleEvent))

	if not IsNil(var_37_2) then
		var_37_2:Rebind()
	end
end

function removeOnToggle(arg_39_0)
	local var_39_0 = GetComponent(arg_39_0, typeof(Toggle))

	if var_39_0 ~= nil then
		var_39_0.onValueChanged:RemoveAllListeners()
	end
end

function triggerToggle(arg_40_0, arg_40_1)
	local var_40_0 = GetComponent(arg_40_0, typeof(Toggle))

	var_0_3 = false
	arg_40_1 = tobool(arg_40_1)

	if var_40_0.isOn ~= arg_40_1 then
		var_40_0.isOn = arg_40_1
	else
		var_40_0.onValueChanged:Invoke(arg_40_1)
	end

	var_0_3 = true
end

function triggerToggleWithoutNotify(arg_41_0, arg_41_1)
	local var_41_0 = GetComponent(arg_41_0, typeof(Toggle))

	var_0_3 = false
	arg_41_1 = tobool(arg_41_1)

	LuaHelper.ChangeToggleValueWithoutNotify(var_41_0, arg_41_1)

	var_0_3 = true
end

function onSlider(arg_42_0, arg_42_1, arg_42_2)
	local var_42_0 = GetComponent(arg_42_1, typeof(Slider)).onValueChanged

	assert(arg_42_2, "callback should exist")
	var_42_0:RemoveAllListeners()
	pg.DelegateInfo.Add(arg_42_0, var_42_0)
	var_42_0:AddListener(arg_42_2)
end

function setSlider(arg_43_0, arg_43_1, arg_43_2, arg_43_3)
	local var_43_0 = GetComponent(arg_43_0, typeof(Slider))

	assert(var_43_0, "slider should exist")

	var_43_0.minValue = arg_43_1
	var_43_0.maxValue = arg_43_2
	var_43_0.value = arg_43_3
end

function eachChild(arg_44_0, arg_44_1)
	local var_44_0 = tf(arg_44_0)

	for iter_44_0 = var_44_0.childCount - 1, 0, -1 do
		arg_44_1(var_44_0:GetChild(iter_44_0))
	end
end

function removeAllChildren(arg_45_0)
	eachChild(arg_45_0, function(arg_46_0)
		tf(arg_46_0).transform:SetParent(nil, false)
		Destroy(arg_46_0)
	end)
end

function scrollTo(arg_47_0, arg_47_1, arg_47_2)
	Canvas.ForceUpdateCanvases()

	local var_47_0 = GetComponent(arg_47_0, typeof(ScrollRect))
	local var_47_1 = Vector2(arg_47_1 or var_47_0.normalizedPosition.x, arg_47_2 or var_47_0.normalizedPosition.y)

	onNextTick(function()
		if not IsNil(arg_47_0) then
			var_47_0.normalizedPosition = var_47_1

			var_47_0.onValueChanged:Invoke(var_47_1)
		end
	end)
end

function scrollToBottom(arg_49_0)
	scrollTo(arg_49_0, 0, 0)
end

function onScroll(arg_50_0, arg_50_1, arg_50_2)
	local var_50_0 = GetComponent(arg_50_1, typeof(ScrollRect)).onValueChanged

	assert(arg_50_2, "callback should exist")
	var_50_0:RemoveAllListeners()
	pg.DelegateInfo.Add(arg_50_0, var_50_0)
	var_50_0:AddListener(arg_50_2)
end

function ClearEventTrigger(arg_51_0)
	arg_51_0:RemovePointClickFunc()
	arg_51_0:RemovePointDownFunc()
	arg_51_0:RemovePointEnterFunc()
	arg_51_0:RemovePointExitFunc()
	arg_51_0:RemovePointUpFunc()
	arg_51_0:RemoveCheckDragFunc()
	arg_51_0:RemoveBeginDragFunc()
	arg_51_0:RemoveDragFunc()
	arg_51_0:RemoveDragEndFunc()
	arg_51_0:RemoveDropFunc()
	arg_51_0:RemoveScrollFunc()
	arg_51_0:RemoveSelectFunc()
	arg_51_0:RemoveUpdateSelectFunc()
	arg_51_0:RemoveMoveFunc()
end

function ClearLScrollrect(arg_52_0)
	arg_52_0.onStart = nil
	arg_52_0.onInitItem = nil
	arg_52_0.onUpdateItem = nil
	arg_52_0.onReturnItem = nil
end

function GetComponent(arg_53_0, arg_53_1)
	return (arg_53_0:GetComponent(arg_53_1))
end

function GetOrAddComponent(arg_54_0, arg_54_1)
	assert(arg_54_0, "objectOrTransform not found: " .. debug.traceback())

	local var_54_0 = arg_54_1

	if type(arg_54_1) == "string" then
		assert(_G[arg_54_1], arg_54_1 .. " not exist in Global")

		var_54_0 = typeof(_G[arg_54_1])
	end

	return LuaHelper.GetOrAddComponentForLua(arg_54_0, var_54_0)
end

function RemoveComponent(arg_55_0, arg_55_1)
	local var_55_0 = arg_55_0:GetComponent(arg_55_1)

	if var_55_0 then
		Object.Destroy(var_55_0)
	end
end

function SetCompomentEnabled(arg_56_0, arg_56_1, arg_56_2)
	local var_56_0 = arg_56_0:GetComponent(arg_56_1)

	assert(var_56_0, "compoment not found")

	var_56_0.enabled = tobool(arg_56_2)
end

function GetInChildren(arg_57_0, arg_57_1)
	local function var_57_0(arg_58_0, arg_58_1)
		if not arg_58_0 then
			return nil
		end

		if arg_58_0.name == arg_58_1 then
			return arg_58_0
		end

		for iter_58_0 = 0, arg_58_0.childCount - 1 do
			local var_58_0 = arg_58_0:GetChild(iter_58_0)

			if arg_58_1 == var_58_0.name then
				return var_58_0
			end

			local var_58_1 = var_57_0(var_58_0, arg_58_1)

			if var_58_1 then
				return var_58_1
			end
		end

		return nil
	end

	return var_57_0(arg_57_0, arg_57_1)
end

function onNextTick(arg_59_0)
	FrameTimer.New(arg_59_0, 1, 1):Start()
end

function onDelayTick(arg_60_0, arg_60_1)
	Timer.New(arg_60_0, arg_60_1, 1):Start()
end

function seriesAsync(arg_61_0, arg_61_1, ...)
	local var_61_0 = 0
	local var_61_1 = #arg_61_0
	local var_61_2

	local function var_61_3(...)
		var_61_0 = var_61_0 + 1

		if var_61_0 <= var_61_1 then
			arg_61_0[var_61_0](var_61_3, ...)
		elseif var_61_0 == var_61_1 + 1 and arg_61_1 then
			arg_61_1(...)
		end
	end

	var_61_3(...)
end

function seriesAsyncExtend(arg_63_0, arg_63_1, ...)
	local var_63_0

	local function var_63_1(...)
		if #arg_63_0 > 0 then
			table.remove(arg_63_0, 1)(var_63_1, ...)
		elseif arg_63_1 then
			arg_63_1(...)
		end
	end

	var_63_1(...)
end

function parallelAsync(arg_65_0, arg_65_1)
	local var_65_0 = #arg_65_0

	local function var_65_1()
		var_65_0 = var_65_0 - 1

		if var_65_0 == 0 and arg_65_1 then
			arg_65_1()
		end
	end

	if var_65_0 > 0 then
		for iter_65_0, iter_65_1 in ipairs(arg_65_0) do
			iter_65_1(var_65_1)
		end
	elseif arg_65_1 then
		arg_65_1()
	end
end

function limitedParallelAsync(arg_67_0, arg_67_1, arg_67_2)
	local var_67_0 = #arg_67_0
	local var_67_1 = var_67_0

	if var_67_1 == 0 then
		arg_67_2()

		return
	end

	local var_67_2 = math.min(arg_67_1, var_67_0)
	local var_67_3

	local function var_67_4()
		var_67_1 = var_67_1 - 1

		if var_67_1 == 0 then
			arg_67_2()
		elseif var_67_2 + 1 <= var_67_0 then
			var_67_2 = var_67_2 + 1

			arg_67_0[var_67_2](var_67_4)
		end
	end

	for iter_67_0 = 1, var_67_2 do
		arg_67_0[iter_67_0](var_67_4)
	end
end

function waitUntil(arg_69_0, arg_69_1)
	local var_69_0

	var_69_0 = FrameTimer.New(function()
		if arg_69_0() then
			arg_69_1()
			var_69_0:Stop()

			return
		end
	end, 1, -1)

	var_69_0:Start()

	return var_69_0
end

function setImageSprite(arg_71_0, arg_71_1, arg_71_2)
	if IsNil(arg_71_0) then
		assert(false)

		return
	end

	local var_71_0 = GetComponent(arg_71_0, typeof(Image))

	if IsNil(var_71_0) then
		return
	end

	var_71_0.sprite = arg_71_1

	if arg_71_2 then
		var_71_0:SetNativeSize()
	end
end

function clearImageSprite(arg_72_0)
	GetComponent(arg_72_0, typeof(Image)).sprite = nil
end

function getImageSprite(arg_73_0)
	local var_73_0 = GetComponent(arg_73_0, typeof(Image))

	return var_73_0 and var_73_0.sprite
end

function tex2sprite(arg_74_0)
	return UnityEngine.Sprite.Create(arg_74_0, UnityEngine.Rect.New(0, 0, arg_74_0.width, arg_74_0.height), Vector2(0.5, 0.5), 100)
end

function setFillAmount(arg_75_0, arg_75_1)
	GetComponent(arg_75_0, typeof(Image)).fillAmount = arg_75_1
end

function string2vector3(arg_76_0)
	local var_76_0 = string.split(arg_76_0, ",")

	return Vector3(var_76_0[1], var_76_0[2], var_76_0[3])
end

function getToggleState(arg_77_0)
	return arg_77_0:GetComponent(typeof(Toggle)).isOn
end

function setLocalPosition(arg_78_0, arg_78_1)
	local var_78_0 = tf(arg_78_0).localPosition

	arg_78_1.x = arg_78_1.x or var_78_0.x
	arg_78_1.y = arg_78_1.y or var_78_0.y
	arg_78_1.z = arg_78_1.z or var_78_0.z
	tf(arg_78_0).localPosition = arg_78_1
end

function setAnchoredPosition(arg_79_0, arg_79_1)
	local var_79_0 = rtf(arg_79_0)
	local var_79_1 = var_79_0.anchoredPosition

	arg_79_1.x = arg_79_1.x or var_79_1.x
	arg_79_1.y = arg_79_1.y or var_79_1.y
	var_79_0.anchoredPosition = arg_79_1
end

function setAnchoredPosition3D(arg_80_0, arg_80_1)
	local var_80_0 = rtf(arg_80_0)
	local var_80_1 = var_80_0.anchoredPosition3D

	arg_80_1.x = arg_80_1.x or var_80_1.x
	arg_80_1.y = arg_80_1.y or var_80_1.y
	arg_80_1.z = arg_80_1.y or var_80_1.z
	var_80_0.anchoredPosition3D = arg_80_1
end

function getAnchoredPosition(arg_81_0)
	return rtf(arg_81_0).anchoredPosition
end

function setLocalScale(arg_82_0, arg_82_1)
	local var_82_0 = tf(arg_82_0).localScale

	arg_82_1.x = arg_82_1.x or var_82_0.x
	arg_82_1.y = arg_82_1.y or var_82_0.y
	arg_82_1.z = arg_82_1.z or var_82_0.z
	tf(arg_82_0).localScale = arg_82_1
end

function setLocalRotation(arg_83_0, arg_83_1)
	local var_83_0 = tf(arg_83_0).localRotation

	arg_83_1.x = arg_83_1.x or var_83_0.x
	arg_83_1.y = arg_83_1.y or var_83_0.y
	arg_83_1.z = arg_83_1.z or var_83_0.z
	tf(arg_83_0).localRotation = arg_83_1
end

function setLocalEulerAngles(arg_84_0, arg_84_1)
	local var_84_0 = tf(arg_84_0).localEulerAngles

	arg_84_1.x = arg_84_1.x or var_84_0.x
	arg_84_1.y = arg_84_1.y or var_84_0.y
	arg_84_1.z = arg_84_1.z or var_84_0.z
	tf(arg_84_0).localEulerAngles = arg_84_1
end

function ActivateInputField(arg_85_0)
	GetComponent(arg_85_0, typeof(InputField)):ActivateInputField()
end

function onInputChanged(arg_86_0, arg_86_1, arg_86_2)
	local var_86_0 = GetComponent(arg_86_1, typeof(InputField)).onValueChanged

	var_86_0:RemoveAllListeners()
	pg.DelegateInfo.Add(arg_86_0, var_86_0)
	var_86_0:AddListener(arg_86_2)
end

function getImageColor(arg_87_0)
	return GetComponent(arg_87_0, typeof(Image)).color
end

function setImageColor(arg_88_0, arg_88_1)
	GetComponent(arg_88_0, typeof(Image)).color = arg_88_1
end

function getImageAlpha(arg_89_0)
	return GetComponent(arg_89_0, typeof(Image)).color.a
end

function setImageAlpha(arg_90_0, arg_90_1)
	local var_90_0 = GetComponent(arg_90_0, typeof(Image))
	local var_90_1 = var_90_0.color

	var_90_1.a = arg_90_1
	var_90_0.color = var_90_1
end

function getImageRaycastTarget(arg_91_0)
	return GetComponent(arg_91_0, typeof(Image)).raycastTarget
end

function setImageRaycastTarget(arg_92_0, arg_92_1)
	GetComponent(arg_92_0, typeof(Image)).raycastTarget = tobool(arg_92_1)
end

function getCanvasGroupAlpha(arg_93_0)
	return GetComponent(arg_93_0, typeof(CanvasGroup)).alpha
end

function setCanvasGroupAlpha(arg_94_0, arg_94_1)
	GetComponent(arg_94_0, typeof(CanvasGroup)).alpha = arg_94_1
end

function setActiveViaLayer(arg_95_0, arg_95_1)
	UIUtil.SetUIActiveViaLayer(go(arg_95_0), arg_95_1)
end

function setActiveViaCG(arg_96_0, arg_96_1)
	UIUtil.SetUIActiveViaCG(go(arg_96_0), arg_96_1)
end

function getTextColor(arg_97_0)
	return GetComponent(arg_97_0, typeof(Text)).color
end

function setTextColor(arg_98_0, arg_98_1)
	GetComponent(arg_98_0, typeof(Text)).color = arg_98_1
end

function getTextAlpha(arg_99_0)
	return GetComponent(arg_99_0, typeof(Text)).color.a
end

function setTextAlpha(arg_100_0, arg_100_1)
	local var_100_0 = GetComponent(arg_100_0, typeof(Text))
	local var_100_1 = var_100_0.color

	var_100_1.a = arg_100_1
	var_100_0.color = var_100_1
end

function setSizeDelta(arg_101_0, arg_101_1)
	local var_101_0 = GetComponent(arg_101_0, typeof(RectTransform))

	if not var_101_0 then
		return
	end

	local var_101_1 = var_101_0.sizeDelta

	var_101_1.x = arg_101_1.x
	var_101_1.y = arg_101_1.y
	var_101_0.sizeDelta = var_101_1
end

function getOutlineColor(arg_102_0)
	return GetComponent(arg_102_0, typeof(Outline)).effectColor
end

function setOutlineColor(arg_103_0, arg_103_1)
	GetComponent(arg_103_0, typeof(Outline)).effectColor = arg_103_1
end

function pressPersistTrigger(arg_104_0, arg_104_1, arg_104_2, arg_104_3, arg_104_4, arg_104_5, arg_104_6, arg_104_7)
	arg_104_6 = defaultValue(arg_104_6, 0.25)

	assert(arg_104_6 > 0, "maxSpeed less than zero")
	assert(arg_104_0, "should exist objectOrTransform")

	local var_104_0 = GetOrAddComponent(arg_104_0, typeof(EventTriggerListener))

	assert(arg_104_2, "should exist callback")

	local var_104_1

	local function var_104_2()
		if var_104_1 then
			var_104_1:Stop()

			var_104_1 = nil

			existCall(arg_104_3)
		end
	end

	var_104_0:AddPointDownFunc(function()
		var_104_1 = Timer.New(function()
			if arg_104_5 then
				local var_107_0 = math.max(var_104_1.duration - arg_104_1 / 10, arg_104_6)

				var_104_1.duration = var_107_0
			end

			existCall(arg_104_2, var_104_2)
		end, arg_104_1, -1)

		var_104_1:Start()

		if arg_104_4 then
			var_104_1.func()
		end

		if arg_104_7 and var_0_1 then
			pg.CriMgr.GetInstance():PlaySoundEffect_V3(arg_104_7)
		end
	end)
	var_104_0:AddPointUpFunc(var_104_2)

	return var_104_0
end

function getSpritePivot(arg_108_0)
	local var_108_0 = arg_108_0.bounds
	local var_108_1 = -var_108_0.center.x / var_108_0.extents.x / 2 + 0.5
	local var_108_2 = -var_108_0.center.y / var_108_0.extents.y / 2 + 0.5

	return Vector2(var_108_1, var_108_2)
end

function resetAspectRatio(arg_109_0)
	local var_109_0 = GetComponent(arg_109_0, "Image")

	GetComponent(arg_109_0, "AspectRatioFitter").aspectRatio = var_109_0.preferredWidth / var_109_0.preferredHeight
end

function cloneTplTo(arg_110_0, arg_110_1, arg_110_2)
	local var_110_0 = tf(Instantiate(arg_110_0))

	var_110_0:SetParent(tf(arg_110_1), false)
	SetActive(var_110_0, true)

	if arg_110_2 then
		var_110_0.name = arg_110_2
	end

	return var_110_0
end

function setGray(arg_111_0, arg_111_1, arg_111_2)
	if arg_111_1 then
		local var_111_0 = GetOrAddComponent(arg_111_0, "UIGrayScale")

		var_111_0.Recursive = defaultValue(arg_111_2, true)
		var_111_0.enabled = true
	else
		RemoveComponent(arg_111_0, "UIGrayScale")
	end
end

function setBlackMask(arg_112_0, arg_112_1, arg_112_2)
	if arg_112_1 then
		arg_112_2 = arg_112_2 or {}

		local var_112_0 = GetOrAddComponent(arg_112_0, "UIMaterialAdjuster")

		var_112_0.Recursive = tobool(defaultValue(arg_112_2.recursive, true))

		local var_112_1 = Material.New(pg.ShaderMgr.GetInstance():GetShader("M02/Unlit Colored_Alpha_UI"))

		var_112_1:SetColor("_Color", arg_112_2.color or Color(0, 0, 0, 0.2))

		var_112_0.adjusterMaterial = var_112_1
		var_112_0.enabled = true
	else
		RemoveComponent(arg_112_0, "UIMaterialAdjuster")
	end
end

function blockBlackMask(arg_113_0, arg_113_1, arg_113_2)
	if arg_113_1 then
		local var_113_0 = GetOrAddComponent(arg_113_0, "UIMaterialAdjuster")

		var_113_0.Recursive = tobool(defaultValue(arg_113_2, true))
		var_113_0.enabled = false
	else
		RemoveComponent(arg_113_0, "UIMaterialAdjuster")
	end
end

function long2int(arg_114_0)
	local var_114_0, var_114_1 = int64.tonum2(arg_114_0)

	return var_114_0
end

function OnSliderWithButton(arg_115_0, arg_115_1, arg_115_2)
	local var_115_0 = arg_115_1:GetComponent("Slider")

	var_115_0.onValueChanged:RemoveAllListeners()
	pg.DelegateInfo.Add(arg_115_0, var_115_0.onValueChanged)
	var_115_0.onValueChanged:AddListener(arg_115_2)

	local var_115_1 = (var_115_0.maxValue - var_115_0.minValue) * 0.1

	onButton(arg_115_0, arg_115_1:Find("up"), function()
		var_115_0.value = math.clamp(var_115_0.value + var_115_1, var_115_0.minValue, var_115_0.maxValue)
	end, SFX_PANEL)
	onButton(arg_115_0, arg_115_1:Find("down"), function()
		var_115_0.value = math.clamp(var_115_0.value - var_115_1, var_115_0.minValue, var_115_0.maxValue)
	end, SFX_PANEL)
end

function addSlip(arg_118_0, arg_118_1, arg_118_2, arg_118_3, arg_118_4)
	local var_118_0 = GetOrAddComponent(arg_118_1, "EventTriggerListener")
	local var_118_1
	local var_118_2 = 0
	local var_118_3 = 50

	var_118_0:AddPointDownFunc(function()
		var_118_2 = 0
		var_118_1 = nil
	end)
	var_118_0:AddDragFunc(function(arg_120_0, arg_120_1)
		local var_120_0 = arg_120_1.position

		if not var_118_1 then
			var_118_1 = var_120_0
		end

		if arg_118_0 == SLIP_TYPE_HRZ then
			var_118_2 = var_120_0.x - var_118_1.x
		elseif arg_118_0 == SLIP_TYPE_VERT then
			var_118_2 = var_120_0.y - var_118_1.y
		end
	end)
	var_118_0:AddPointUpFunc(function(arg_121_0, arg_121_1)
		if var_118_2 < -var_118_3 then
			if arg_118_3 then
				arg_118_3()
			end
		elseif var_118_2 > var_118_3 then
			if arg_118_2 then
				arg_118_2()
			end
		elseif arg_118_4 then
			arg_118_4()
		end
	end)
end

function getSizeRate()
	local var_122_0 = pg.UIMgr.GetInstance().LevelMain.transform.rect
	local var_122_1 = UnityEngine.Screen

	return Vector2.New(var_122_0.width / var_122_1.width, var_122_0.height / var_122_1.height), var_122_0.width, var_122_0.height
end

function IsUsingWifi()
	return Application.internetReachability == UnityEngine.NetworkReachability.ReachableViaLocalAreaNetwork
end

function getSceneRootTFDic(arg_124_0)
	local var_124_0 = {}

	table.IpairsCArray(arg_124_0:GetRootGameObjects(), function(arg_125_0, arg_125_1)
		var_124_0[arg_125_1.name] = arg_125_1.transform
	end)

	return var_124_0
end
