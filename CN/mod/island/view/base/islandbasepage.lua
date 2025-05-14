local var_0_0 = class("IslandBasePage", import("view.base.BaseSubView"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.islandScene = arg_1_1

	local var_1_0 = arg_1_1._tf.parent
	local var_1_1 = arg_1_1.event
	local var_1_2 = arg_1_1.contextData

	var_0_0.super.Ctor(arg_1_0, var_1_0, var_1_1, var_1_2)

	arg_1_0.__callbacks__ = {}
end

function var_0_0.GetInstancePage(arg_2_0, arg_2_1)
	return arg_2_0.islandScene:GetInstancePage(arg_2_1)
end

function var_0_0.GetIsland(arg_3_0)
	return arg_3_0.islandScene:GetIsland()
end

function var_0_0.Show(arg_4_0, ...)
	arg_4_0:AddListeners()
	var_0_0.super.Show(arg_4_0)
	arg_4_0:OnShow(...)
end

function var_0_0.Hide(arg_5_0)
	arg_5_0:ClosePage(arg_5_0)
	arg_5_0:RemoveListeners()
	arg_5_0:OnHide()
end

function var_0_0.Enable(arg_6_0)
	var_0_0.super.Show(arg_6_0)
	arg_6_0:OnEnable()
end

function var_0_0.Disable(arg_7_0)
	var_0_0.super.Hide(arg_7_0)
	arg_7_0:OnDisable()
end

function var_0_0.ShowMsgBox(arg_8_0, arg_8_1)
	return arg_8_0.islandScene:ShowMsgbox(arg_8_1)
end

function var_0_0.OpenPage(arg_9_0, arg_9_1, ...)
	return arg_9_0.islandScene:DoOpenPage(arg_9_0, arg_9_1, ...)
end

function var_0_0.ClosePage(arg_10_0, arg_10_1)
	arg_10_0.islandScene:DoClosePage(arg_10_1)
end

function var_0_0.AddListener(arg_11_0, arg_11_1, arg_11_2)
	local function var_11_0(arg_12_0, ...)
		arg_11_2(arg_11_0, ...)
	end

	local var_11_1 = arg_11_0:bind(arg_11_1, var_11_0)

	arg_11_0.__callbacks__[arg_11_1] = var_11_1

	arg_11_0:GetIsland():AddListener(arg_11_1, var_11_0)
end

function var_0_0.RemoveListener(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = arg_13_0.__callbacks__[arg_13_1]

	if var_13_0 then
		local var_13_1 = arg_13_0.eventStore[var_13_0]

		arg_13_0:GetIsland():RemoveListener(arg_13_1, var_13_1.callback)
		arg_13_0:disconnect(var_13_0)

		arg_13_0.__callbacks__[arg_13_1] = nil
	end
end

function var_0_0.Destroy(arg_14_0)
	if arg_14_0:GetLoaded() then
		arg_14_0:Hide()
	end

	arg_14_0.__callbacks__ = {}

	var_0_0.super.Destroy(arg_14_0)
end

function var_0_0.SetVisible(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = GetOrAddComponent(arg_15_1, typeof(CanvasGroup))

	var_15_0.alpha = arg_15_2 and 1 or 0
	var_15_0.blocksRaycasts = arg_15_2
end

function var_0_0.AddListeners(arg_16_0)
	return
end

function var_0_0.RemoveListeners(arg_17_0)
	return
end

function var_0_0.OnShow(arg_18_0)
	return
end

function var_0_0.OnHide(arg_19_0)
	return
end

function var_0_0.OnEnable(arg_20_0)
	return
end

function var_0_0.OnDisable(arg_21_0)
	return
end

return var_0_0
