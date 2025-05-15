local var_0_0 = class("IslandMsgBoxForStatusWindow", import(".IslandCommonMsgboxWindow"))

function var_0_0.getUIName(arg_1_0)
	return "IslandCommonMsgBoxForStatus"
end

function var_0_0.OnLoaded(arg_2_0)
	var_0_0.super.OnLoaded(arg_2_0)

	arg_2_0.uiItemList = UIItemList.New(arg_2_0:findTF("list"), arg_2_0:findTF("list/tpl"))
end

function var_0_0.OnShow(arg_3_0)
	var_0_0.super.OnShow(arg_3_0)
	arg_3_0:FlushItems(arg_3_0.settings)
end

function var_0_0.FlushBtn(arg_4_0, arg_4_1)
	setActive(arg_4_0.cancelBtn, false)
end

function var_0_0.FlushItems(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_1.statusList

	assert(var_5_0)
	arg_5_0.uiItemList:make(function(arg_6_0, arg_6_1, arg_6_2)
		if arg_6_0 == UIItemList.EventUpdate then
			local var_6_0 = var_5_0[arg_6_1 + 1]
			local var_6_1 = var_6_0:IsDebuff() and "#ff7e7e" or "#5dcbff"

			setText(arg_6_2:Find("label/Text"), setColorStr(var_6_0:GetName(), var_6_1))
			setText(arg_6_2:Find("Text"), var_6_0:GetDesc())
		end
	end)
	arg_5_0.uiItemList:align(#var_5_0)
end

return var_0_0
