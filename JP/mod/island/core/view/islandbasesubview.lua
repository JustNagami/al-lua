local var_0_0 = class("IslandBaseSubView", import("Mod.Island.Core.View.IslandBaseUnit"))

function var_0_0.Init(arg_1_0, ...)
	local var_1_0 = packEx(...)

	PoolMgr.GetInstance():GetUI(arg_1_0:GetUIName(), true, function(arg_2_0)
		arg_1_0._go = arg_2_0
		arg_1_0._tf = arg_2_0.transform

		var_0_0.super.Init(arg_1_0, arg_2_0)
		setParent(arg_2_0, pg.UIMgr.GetInstance().UIMain)
		arg_2_0.transform:SetAsFirstSibling()
		arg_1_0:FirstFlush()
		arg_1_0:Flush(unpackEx(var_1_0))
	end)
end

function var_0_0.OnDispose(arg_3_0)
	PoolMgr.GetInstance():ReturnUI(arg_3_0:GetUIName(), arg_3_0._go)
end

function var_0_0.Show(arg_4_0, ...)
	if arg_4_0:IsEmpty() then
		arg_4_0:Init(...)
	else
		setActive(arg_4_0._go, true)
		arg_4_0:Flush(...)
	end
end

function var_0_0.Hide(arg_5_0)
	setActive(arg_5_0._go, false)
end

function var_0_0.Disable(arg_6_0)
	setActive(arg_6_0._go, false)
end

function var_0_0.Enable(arg_7_0)
	setActive(arg_7_0._go, true)
end

function var_0_0.GetUIName(arg_8_0)
	assert(false, "overwrite me")
end

function var_0_0.Flush(arg_9_0, ...)
	return
end

function var_0_0.FirstFlush(arg_10_0)
	return
end

return var_0_0
