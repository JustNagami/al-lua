local var_0_0 = class("NewStoryRecordPanel")
local var_0_1 = 0
local var_0_2 = 1
local var_0_3 = 2
local var_0_4 = 3
local var_0_5 = 4
local var_0_6 = 5
local var_0_7 = 10

function var_0_0.Ctor(arg_1_0)
	arg_1_0.state = var_0_1
end

function var_0_0.Load(arg_2_0)
	arg_2_0.state = var_0_2
	arg_2_0.parentTF = pg.NewStoryMgr.GetInstance().frontTr

	ResourceMgr.Inst:getAssetAsync("ui/NewStoryRecordUI", "", UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_3_0)
		local var_3_0 = Object.Instantiate(arg_3_0, arg_2_0.parentTF)

		if arg_2_0:IsLoading() then
			arg_2_0.state = var_0_3

			arg_2_0:Init(var_3_0)
		end
	end), true, true)
end

function var_0_0.IsEmptyOrUnload(arg_4_0)
	return arg_4_0.state == var_0_1 or arg_4_0.state == var_0_6
end

function var_0_0.IsLoading(arg_5_0)
	return arg_5_0.state == var_0_2
end

function var_0_0.IsShowing(arg_6_0)
	return arg_6_0.state == var_0_4
end

function var_0_0.Init(arg_7_0, arg_7_1)
	arg_7_0._go = arg_7_1
	arg_7_0._tf = arg_7_1.transform
	arg_7_0.pageAnim = arg_7_0._tf:GetComponent(typeof(Animation))
	arg_7_0.pageAniEvent = arg_7_0._tf:GetComponent(typeof(DftAniEvent))
	arg_7_0.container = arg_7_0._tf:Find("content")
	arg_7_0.tpl = arg_7_0._tf:Find("content/tpl")
	arg_7_0.cg = GetOrAddComponent(arg_7_0._tf, typeof(CanvasGroup))
	arg_7_0.tplPools = {
		arg_7_0.tpl
	}
	arg_7_0.closeBtn = arg_7_0._tf:Find("close")
	arg_7_0.scrollrect = arg_7_0._tf:GetComponent(typeof(ScrollRect))
	arg_7_0.contentSizeFitter = arg_7_0._tf:Find("content"):GetComponent(typeof(ContentSizeFitter))

	onButton(nil, arg_7_0.closeBtn, function()
		arg_7_0:Hide()
	end, SFX_PANEL)
	arg_7_0.pageAniEvent:SetEndEvent(function()
		arg_7_0:OnHide()
	end)

	arg_7_0.state = var_0_4

	arg_7_0:UpdateAll()
end

function var_0_0.UpdateAll(arg_10_0)
	arg_10_0.cg.blocksRaycasts = false

	seriesAsync({
		function(arg_11_0)
			arg_10_0.cg.alpha = 0

			arg_10_0:UpdateList(arg_11_0)
		end,
		function(arg_12_0)
			onNextTick(arg_12_0)
		end,
		function(arg_13_0)
			arg_10_0.cg.alpha = 1

			arg_10_0:PlayAnimation(arg_13_0)
		end
	}, function()
		arg_10_0.cg.blocksRaycasts = true

		arg_10_0:BlurPanel()
	end)
end

local function var_0_8(arg_15_0)
	setActive(arg_15_0._tf, true)
	arg_15_0.pageAnim:Play("anim_storyrecordUI_record_in")

	arg_15_0.state = var_0_4

	arg_15_0:UpdateAll()
end

function var_0_0.Show(arg_16_0, arg_16_1)
	arg_16_0.displays = arg_16_1:GetContentList()

	if arg_16_0:IsEmptyOrUnload() then
		arg_16_0:Load()
	elseif arg_16_0:IsLoading() then
		-- block empty
	else
		var_0_8(arg_16_0)
	end
end

local function var_0_9(arg_17_0)
	local var_17_0
	local var_17_1 = false

	if #arg_17_0.tplPools <= 0 then
		var_17_0 = Object.Instantiate(arg_17_0.tpl, arg_17_0.tpl.parent)
	else
		var_17_1 = true
		var_17_0 = table.remove(arg_17_0.tplPools, 1)
	end

	GetOrAddComponent(var_17_0, typeof(CanvasGroup)).alpha = 1

	return var_17_0, var_17_1
end

local function var_0_10(arg_18_0, arg_18_1)
	setActive(arg_18_1, false)

	GetOrAddComponent(arg_18_1, typeof(CanvasGroup)).alpha = 1

	if #arg_18_0.tplPools >= 5 and arg_18_1 ~= arg_18_0.tpl then
		Object.Destroy(arg_18_1.gameObject)
	else
		table.insert(arg_18_0.tplPools, arg_18_1)
	end
end

function var_0_0.UpdateList(arg_19_0, arg_19_1)
	if not arg_19_0:IsShowing() then
		return
	end

	local var_19_0 = arg_19_0.displays
	local var_19_1 = {}
	local var_19_2 = 1

	arg_19_0.usingTpls = {}

	local var_19_3 = #var_19_0 < var_0_7 and #var_19_0 or var_0_7

	for iter_19_0, iter_19_1 in ipairs(var_19_0) do
		local var_19_4 = #var_19_0

		table.insert(var_19_1, function(arg_20_0)
			local var_20_0, var_20_1 = var_0_9(arg_19_0)

			if not var_20_1 then
				var_19_2 = var_19_2 + 1
			end

			arg_19_0:UpdateRecord(var_20_0, iter_19_1)
			table.insert(arg_19_0.usingTpls, var_20_0)
			tf(var_20_0):SetAsLastSibling()

			if var_19_2 % 5 == 0 then
				var_19_2 = 1

				onNextTick(arg_20_0)
			else
				arg_20_0()
			end

			local var_20_2 = var_20_0:GetComponent(typeof(Animation))

			if iter_19_0 + var_19_3 <= var_19_4 then
				setActive(var_20_0, true)
				var_20_2:Play("anim_storyrecordUI_tql_reset")
			else
				GetOrAddComponent(var_20_0, typeof(CanvasGroup)).alpha = 0

				setActive(var_20_0, true)
			end
		end)
	end

	table.insert(var_19_1, function(arg_21_0)
		onDelayTick(function()
			arg_19_0.contentSizeFitter.enabled = false
			arg_19_0.contentSizeFitter.enabled = true

			scrollToBottom(arg_19_0._tf)
			arg_21_0()
		end, 0.05)
	end)
	seriesAsync(var_19_1, arg_19_1)
end

function var_0_0.PlayAnimation(arg_23_0, arg_23_1)
	local var_23_0 = arg_23_0.displays
	local var_23_1 = #var_23_0 < var_0_7 and #var_23_0 or var_0_7
	local var_23_2 = {}

	for iter_23_0 = 1, var_23_1 do
		table.insert(var_23_2, function(arg_24_0)
			local var_24_0 = #arg_23_0.usingTpls - var_23_1 + iter_23_0

			arg_23_0.usingTpls[var_24_0]:GetComponent(typeof(Animation)):Play("anim_storyrecordUI_tpl_in")
			onDelayTick(function()
				arg_24_0()
			end, 0.033)
		end)
	end

	seriesAsync(var_23_2)
	arg_23_1()
end

function var_0_0.UpdateRecord(arg_26_0, arg_26_1, arg_26_2)
	GetOrAddComponent(arg_26_1, typeof(CanvasGroup)).alpha = 1

	setActive(arg_26_1:Find("icon"), arg_26_2.icon)

	if arg_26_2.icon then
		local var_26_0 = arg_26_2.icon

		GetImageSpriteFromAtlasAsync("SquareIcon/" .. var_26_0, "", arg_26_1:Find("icon/Image"))
	end

	if arg_26_2.name and arg_26_2.nameColor then
		local var_26_1 = string.gsub(arg_26_2.nameColor, "#", "")

		arg_26_1:Find("name"):GetComponent(typeof(Outline)).effectColor = Color.NewHex(var_26_1)

		setText(arg_26_1:Find("name"), setColorStr(arg_26_2.name, arg_26_2.nameColor))
	else
		setText(arg_26_1:Find("name"), arg_26_2.name or "")
	end

	local var_26_2 = arg_26_2.list
	local var_26_3 = UIItemList.New(arg_26_1:Find("content"), arg_26_1:Find("content/Text"))

	var_26_3:make(function(arg_27_0, arg_27_1, arg_27_2)
		if arg_27_0 == UIItemList.EventUpdate then
			setText(arg_27_2, var_26_2[arg_27_1 + 1])
		end
	end)
	var_26_3:align(#var_26_2)
	setActive(arg_26_1:Find("player"), arg_26_2.icon == nil and arg_26_2.isPlayer)

	local var_26_4 = arg_26_2.icon == nil and arg_26_2.name == nil
	local var_26_5 = var_26_3.container:GetComponent(typeof(UnityEngine.UI.HorizontalOrVerticalLayoutGroup))
	local var_26_6 = UnityEngine.RectOffset.New()

	var_26_6.left = 170
	var_26_6.right = 0
	var_26_6.top = var_26_4 and 25 or 90
	var_26_6.bottom = var_26_4 and 25 or 50
	var_26_5.padding = var_26_6
end

function var_0_0.OnHide(arg_28_0)
	arg_28_0:Clear()
	arg_28_0:UnblurPanel()
	setActive(arg_28_0._tf, false)

	arg_28_0.state = var_0_5
end

function var_0_0.Hide(arg_29_0)
	if arg_29_0:IsShowing() then
		arg_29_0.pageAnim:Play("anim_storyrecordUI_record_out")
	end
end

function var_0_0.BlurPanel(arg_30_0)
	setParent(pg.NewStoryMgr.GetInstance()._tf, pg.UIMgr.GetInstance().UIMain)

	local var_30_0 = pg.UIMgr.GetInstance().OverlayMain

	arg_30_0.hideNodes = {}

	for iter_30_0 = 1, var_30_0.childCount do
		local var_30_1 = var_30_0:GetChild(iter_30_0 - 1)

		if isActive(var_30_1) then
			table.insert(arg_30_0.hideNodes, var_30_1)
			setActive(var_30_1, false)
		end
	end

	pg.UIMgr.GetInstance():BlurPanel(arg_30_0._tf, false, {
		weight = LayerWeightConst.TOP_LAYER
	})
end

function var_0_0.UnblurPanel(arg_31_0)
	setParent(pg.NewStoryMgr.GetInstance()._tf, pg.UIMgr.GetInstance().OverlayToast)

	if arg_31_0.hideNodes and #arg_31_0.hideNodes > 0 then
		for iter_31_0, iter_31_1 in ipairs(arg_31_0.hideNodes) do
			setActive(iter_31_1, true)
		end
	end

	arg_31_0.hideNodes = {}

	pg.UIMgr.GetInstance():UnblurPanel(arg_31_0._tf, arg_31_0.parentTF)
end

function var_0_0.Clear(arg_32_0)
	for iter_32_0, iter_32_1 in ipairs(arg_32_0.usingTpls) do
		var_0_10(arg_32_0, iter_32_1)
	end

	arg_32_0.usingTpls = {}
end

function var_0_0.Unload(arg_33_0)
	if arg_33_0.state > var_0_2 then
		arg_33_0.state = var_0_6

		if not IsNil(arg_33_0.closeBtn) then
			removeOnButton(arg_33_0.closeBtn)
		end

		Object.Destroy(arg_33_0._go)

		arg_33_0._go = nil
		arg_33_0._tf = nil
		arg_33_0.container = nil
		arg_33_0.tpl = nil
	end
end

function var_0_0.Dispose(arg_34_0)
	arg_34_0:Hide()
	arg_34_0:Unload()
end

return var_0_0
