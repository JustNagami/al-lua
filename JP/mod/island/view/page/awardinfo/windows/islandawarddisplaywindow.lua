local var_0_0 = class("IslandAwardDisplayWindow", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "IslandAwardDisplayUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.title = arg_2_0:findTF("frame/title"):GetComponent("Text")
	arg_2_0.uiitemList = UIItemList.New(arg_2_0:findTF("frame/awards"), arg_2_0:findTF("frame/awards/tpl_1"))

	setText(arg_2_0:findTF("frame/tip"), i18n1("点击空白关闭"))
end

function var_0_0.Show(arg_3_0, arg_3_1)
	arg_3_0.super.Show(arg_3_0)

	arg_3_0.title.text = setColorStr(arg_3_1.title or "", arg_3_1.titleColor or "#393a3c")

	arg_3_0:UpdateAwards(arg_3_1.awards)
end

function var_0_0.UpdateAwards(arg_4_0, arg_4_1)
	arg_4_0.uiitemList:make(function(arg_5_0, arg_5_1, arg_5_2)
		if arg_5_0 == UIItemList.EventUpdate then
			local var_5_0 = arg_4_1[arg_5_1 + 1]

			updateDrop(arg_5_2, var_5_0)
			setText(findTF(arg_5_2, "icon_bg/count_bg/count"), "x" .. var_5_0.count)
		end
	end)
	arg_4_0.uiitemList:align(#arg_4_1)
end

function var_0_0.OnDestroy(arg_6_0)
	return
end

return var_0_0
