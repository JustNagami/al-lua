local var_0_0 = class("IslandAwardDisplayPage", import("view.base.BaseSubView"))

var_0_0.TYPE_COMMON = 1

function var_0_0.getUIName(arg_1_0)
	return "IslandAwardDisplayConatiner"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.windows = {
		[var_0_0.TYPE_COMMON] = IslandAwardDisplayWindow.New(arg_2_0._tf)
	}
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0._tf, function()
		if arg_3_0.callback then
			arg_3_0.callback()

			arg_3_0.callback = nil
		end

		arg_3_0:Hide()
	end, SFX_PANEL)
end

function var_0_0.Show(arg_5_0, arg_5_1)
	var_0_0.super.Show(arg_5_0)
	assert(not arg_5_0:AnyWindowShowing(), "同时只能存在一个奖励界面")
	arg_5_0:HideWindows()

	local var_5_0 = arg_5_1.type or var_0_0.TYPE_COMMON

	arg_5_0.callback = arg_5_1.callback

	arg_5_0.windows[var_5_0]:ExecuteAction("Show", arg_5_1)
end

function var_0_0.AnyWindowShowing(arg_6_0)
	for iter_6_0, iter_6_1 in pairs(arg_6_0.windows) do
		if iter_6_1:GetLoaded() and iter_6_1:isShowing() then
			return true
		end
	end

	return false
end

function var_0_0.HideWindows(arg_7_0)
	for iter_7_0, iter_7_1 in pairs(arg_7_0.windows) do
		arg_7_0:HideWindow(iter_7_1, iter_7_0)
	end
end

function var_0_0.HideWindow(arg_8_0, arg_8_1, arg_8_2)
	if arg_8_1:GetLoaded() and arg_8_1:isShowing() then
		if arg_8_2 == var_0_0.TYPE_COMMON then
			arg_8_1:Hide()
		else
			arg_8_1:Destroy()
			arg_8_1:Reset()
		end
	end
end

function var_0_0.Hide(arg_9_0)
	var_0_0.super.Hide(arg_9_0)
	arg_9_0:HideWindows()

	arg_9_0.callback = nil
end

function var_0_0.OnDestroy(arg_10_0)
	local var_10_0 = arg_10_0.windows[var_0_0.TYPE_COMMON]

	if var_10_0:GetLoaded() and var_10_0:isShowing() then
		var_10_0:Destroy()
		window:Reset()
	end
end

return var_0_0
