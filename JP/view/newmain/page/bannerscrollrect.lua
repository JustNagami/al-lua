local var_0_0 = class("BannerScrollRect")

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.container = arg_1_1
	arg_1_0.dotContainer = arg_1_2

	local var_1_0 = arg_1_1:Find("item")

	arg_1_0.items = {
		var_1_0
	}

	local var_1_1 = arg_1_2:Find("dot")

	arg_1_0.dots = {
		var_1_1
	}
	arg_1_0.itemWidth = var_1_0.sizeDelta.x
	arg_1_0.dotStartPosX = var_1_1.localPosition.x
	arg_1_0.dotWidth = var_1_1.sizeDelta.x
	arg_1_0.total = 0
	arg_1_0.index = 1
	arg_1_0.dragEvent = arg_1_0.container:GetComponent("EventTriggerListener")
end

function var_0_0.GetItem(arg_2_0, arg_2_1)
	local var_2_0 = arg_2_0.items[arg_2_1]

	if not var_2_0 then
		local var_2_1 = arg_2_0.items[1]

		var_2_0 = Object.Instantiate(var_2_1, var_2_1.transform.parent)
		arg_2_0.items[arg_2_1] = var_2_0
	end

	return var_2_0
end

function var_0_0.GetDot(arg_3_0, arg_3_1)
	local var_3_0 = arg_3_0.dots[arg_3_1]

	if not var_3_0 then
		local var_3_1 = arg_3_0.dots[1]

		var_3_0 = Object.Instantiate(var_3_1, var_3_1.transform.parent)
		arg_3_0.dots[arg_3_1] = var_3_0
	end

	return var_3_0
end

function var_0_0.AddChild(arg_4_0)
	arg_4_0.total = arg_4_0.total + 1

	local var_4_0 = arg_4_0:GetDot(arg_4_0.total)
	local var_4_1 = arg_4_0:GetItem(arg_4_0.total)

	setActive(var_4_1, true)
	setActive(var_4_0, true)
	arg_4_0:UpdateItemPosition(arg_4_0.total, var_4_1)
	arg_4_0:UpdateDotPosition(arg_4_0.total, var_4_0)

	return var_4_1
end

function var_0_0.UpdateItemPosition(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = (arg_5_1 - 1) * arg_5_0.itemWidth

	arg_5_2.localPosition = Vector3(var_5_0, arg_5_2.localPosition.y, 0)
end

function var_0_0.UpdateDotPosition(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = arg_6_0.dotStartPosX + (arg_6_1 - 1) * (arg_6_0.dotWidth + 15)

	arg_6_2.localPosition = Vector3(var_6_0, arg_6_2.localPosition.y, 0)
end

function var_0_0.SetUp(arg_7_0)
	if arg_7_0.total == 0 then
		arg_7_0:Disable()

		return
	end

	arg_7_0.container.localPosition = Vector3(0, 0, 0)

	arg_7_0:ScrollTo(1)
	arg_7_0:AutoScroll()
	arg_7_0:AddDrag()
end

function var_0_0.AutoScroll(arg_8_0)
	arg_8_0:RemoveTimer()

	arg_8_0.timer = Timer.New(function()
		local var_9_0 = (arg_8_0.index + 1) % arg_8_0.total

		if var_9_0 == 0 then
			var_9_0 = arg_8_0.total
		end

		arg_8_0:ScrollTo(var_9_0)
	end, 5, -1, true)

	arg_8_0.timer:Start()
end

function var_0_0.ScrollTo(arg_10_0, arg_10_1)
	local var_10_0 = arg_10_0.index or 1
	local var_10_1 = (arg_10_1 - 1) * arg_10_0.itemWidth

	arg_10_0.animating = true

	LeanTween.moveLocalX(go(arg_10_0.container), -1 * var_10_1, 0.2):setEase(LeanTweenType.easeInOutSine):setOnComplete(System.Action(function()
		arg_10_0.animating = false
	end))

	arg_10_0.dots[var_10_0]:GetComponent(typeof(Image)).color = Color.New(0.4, 0.45, 0.55)
	arg_10_0.dots[arg_10_1]:GetComponent(typeof(Image)).color = Color.New(1, 1, 1, 1)
	arg_10_0.index = arg_10_1
end

function var_0_0.AddDrag(arg_12_0)
	local var_12_0 = 0
	local var_12_1

	arg_12_0.dragEvent:AddBeginDragFunc(function(arg_13_0, arg_13_1)
		if arg_12_0.animating then
			return
		end

		arg_12_0:Puase()

		var_12_0 = arg_13_1.position.x
		var_12_1 = arg_12_0.container.localPosition
	end)
	arg_12_0.dragEvent:AddDragFunc(function(arg_14_0, arg_14_1)
		if arg_12_0.animating then
			return
		end

		local var_14_0 = (arg_14_1.position.x - var_12_0) * 0.5

		arg_12_0.container.localPosition = Vector3(var_12_1.x + var_14_0, var_12_1.y, 0)
	end)
	arg_12_0.dragEvent:AddDragEndFunc(function(arg_15_0, arg_15_1)
		if arg_12_0.animating then
			return
		end

		local var_15_0 = arg_15_1.position.x - var_12_0
		local var_15_1 = math.floor(math.abs(var_15_0 / arg_12_0.itemWidth) + 0.5)
		local var_15_2 = var_15_0 < 0 and arg_12_0.index + var_15_1 or arg_12_0.index - var_15_1
		local var_15_3 = math.clamp(var_15_2, 1, arg_12_0.total)

		arg_12_0:ScrollTo(var_15_3)
		arg_12_0:Resume()
	end)
end

function var_0_0.Reset(arg_16_0)
	arg_16_0:RemoveTimer()
	ClearEventTrigger(arg_16_0.dragEvent)
	LeanTween.cancel(go(arg_16_0.container))

	arg_16_0.total = 0
	arg_16_0.index = 1
	arg_16_0.animating = false

	arg_16_0:Disable()
end

function var_0_0.Disable(arg_17_0)
	for iter_17_0, iter_17_1 in ipairs(arg_17_0.items) do
		setActive(iter_17_1, false)
	end

	for iter_17_2, iter_17_3 in ipairs(arg_17_0.dots) do
		iter_17_3:GetComponent(typeof(Image)).color = Color.New(0.4, 0.45, 0.55)

		setActive(iter_17_3, false)
	end
end

function var_0_0.Puase(arg_18_0)
	arg_18_0:RemoveTimer()
end

function var_0_0.Resume(arg_19_0)
	if arg_19_0.total == 0 then
		return
	end

	arg_19_0:AutoScroll()
end

function var_0_0.RemoveTimer(arg_20_0)
	if arg_20_0.timer then
		arg_20_0.timer:Stop()

		arg_20_0.timer = nil
	end
end

function var_0_0.Dispose(arg_21_0)
	arg_21_0:Reset()

	for iter_21_0, iter_21_1 in ipairs(arg_21_0.items) do
		Object.Destroy(iter_21_1.gameObject)
	end

	for iter_21_2, iter_21_3 in ipairs(arg_21_0.dots) do
		Object.Destroy(iter_21_3.gameObject)
	end

	arg_21_0.items = nil
	arg_21_0.dots = nil
end

return var_0_0
