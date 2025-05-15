local var_0_0 = class("Island3dTaskAcceptPage", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "Island3dTaskAcceptUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.chapterText = arg_2_0._tf:Find("frame/chapter")
	arg_2_0.nameText = arg_2_0._tf:Find("frame/name")
	arg_2_0.tipText = arg_2_0:findTF("frame/tip/Text")

	setText(arg_2_0.tipText, i18n1("已开启"))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0._tf, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
end

function var_0_0.OnShow(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = getProxy(IslandProxy):GetIsland():GetTaskAgency():GetTask(arg_5_1)

	setText(arg_5_0.chapterText, var_5_0:getConfig("series"))
	setText(arg_5_0.nameText, var_5_0:getConfig("series_name"))

	arg_5_0.onExit = arg_5_2
end

function var_0_0.OnHide(arg_6_0)
	if arg_6_0.onExit then
		arg_6_0.onExit()

		arg_6_0.onExit = nil
	end
end

function var_0_0.OnDestroy(arg_7_0)
	return
end

return var_0_0
