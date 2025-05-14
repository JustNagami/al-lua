local var_0_0 = class("IslandMsgBox", import("view.base.BaseSubView"))

var_0_0.TYPE_COMMON = 1
var_0_0.TYPE_ITEM = 2
var_0_0.TYPE_STATUS = 3
var_0_0.TYPE_COMMON_ITEM = 4
var_0_0.TYPE_ITEM_INFO = 5
var_0_0.TYPE_MATERIAL_INFO = 6
var_0_0.TYPE_REMIND = 7

function var_0_0.getUIName(arg_1_0)
	return "IslandMsgboxUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.stack = {}
	arg_2_0.cacheCnt = 3
	arg_2_0.tempWindows = {}
	arg_2_0.residentWindows = {}
	arg_2_0.PAGES = {
		[var_0_0.TYPE_COMMON] = IslandCommonMsgboxWindow,
		[var_0_0.TYPE_ITEM] = IslandItemMsgboxWindow,
		[var_0_0.TYPE_STATUS] = IslandMsgBoxForStatusWindow,
		[var_0_0.TYPE_ITEM_INFO] = IslandMsgBoxSingleItemWindow,
		[var_0_0.TYPE_MATERIAL_INFO] = IslandMsgBoxSingleMaterialWindow,
		[var_0_0.TYPE_REMIND] = IslandRemindMsgboxWindow
	}
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0._tf, function()
		arg_3_0:HideWindow()
	end, SFX_PANEL)
end

function var_0_0.CheckType(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_1.type or var_0_0.TYPE_COMMON

	if var_5_0 == var_0_0.TYPE_COMMON_ITEM then
		var_5_0 = IslandItem.New({
			id = arg_5_1.itemId
		}):IsMaterial() and var_0_0.TYPE_MATERIAL_INFO or var_0_0.TYPE_ITEM_INFO
	end

	return var_5_0
end

function var_0_0.Show(arg_6_0, arg_6_1)
	var_0_0.super.Show(arg_6_0)

	local var_6_0 = arg_6_0:CheckType(arg_6_1)
	local var_6_1 = arg_6_0:CreateWindow(var_6_0)

	var_6_1:ExecuteAction("Show", arg_6_1)
	table.insert(arg_6_0.stack, var_6_1)
end

function var_0_0.CreateWindow(arg_7_0, arg_7_1)
	local var_7_0 = arg_7_1 == var_0_0.TYPE_COMMON and arg_7_0.residentWindows or arg_7_0.tempWindows
	local var_7_1 = arg_7_0:FindOrCreateWindow(arg_7_1, var_7_0)

	table.insert(var_7_0, 1, {
		type = arg_7_1,
		window = var_7_1
	})
	arg_7_0:CheckPoolCnt(var_7_0)

	return var_7_1
end

function var_0_0.FindOrCreateWindow(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = 0

	for iter_8_0, iter_8_1 in ipairs(arg_8_2) do
		if iter_8_1.type == arg_8_1 then
			var_8_0 = iter_8_0

			break
		end
	end

	local var_8_1

	if var_8_0 > 0 then
		var_8_1 = table.remove(arg_8_2, var_8_0).window
	else
		local var_8_2 = arg_8_0.PAGES[arg_8_1]

		assert(var_8_2, arg_8_1)

		var_8_1 = var_8_2.New(arg_8_0, arg_8_0._tf)
	end

	return var_8_1
end

function var_0_0.CheckPoolCnt(arg_9_0, arg_9_1)
	if #arg_9_1 > arg_9_0.cacheCnt then
		local var_9_0 = table.remove(arg_9_1, #arg_9_1)

		if var_9_0:GetLoaded() then
			var_9_0:Destroy()
		end
	end
end

function var_0_0.HideWindow(arg_10_0, arg_10_1)
	local var_10_0 = false

	if arg_10_1 then
		var_10_0 = table.indexof(arg_10_0.stack, arg_10_1)
	end

	var_10_0 = var_10_0 or #arg_10_0.stack

	if var_10_0 > 0 and var_10_0 <= #arg_10_0.stack then
		arg_10_1 = table.remove(arg_10_0.stack, var_10_0)
	end

	if arg_10_1 then
		setActive(arg_10_1._tf, false)
	end

	if #arg_10_0.stack == 0 then
		arg_10_0:Hide()
	end
end

function var_0_0.OnDestroy(arg_11_0)
	for iter_11_0, iter_11_1 in ipairs(arg_11_0.residentWindows) do
		iter_11_1.window:Destroy()
	end

	for iter_11_2, iter_11_3 in ipairs(arg_11_0.tempWindows) do
		iter_11_3.window:Destroy()
	end

	arg_11_0.residentWindows = nil
	arg_11_0.tempWindows = nil
end

return var_0_0
