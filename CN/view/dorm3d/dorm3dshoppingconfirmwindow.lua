local var_0_0 = class("Dorm3dShoppingConfirmWindow", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "Dorm3dShopWindow"
end

function var_0_0.init(arg_2_0)
	return
end

function var_0_0.didEnter(arg_3_0)
	onButton(arg_3_0, arg_3_0._tf:Find("Window/Confirm"), function()
		local var_4_0 = arg_3_0.contextData.onYes

		arg_3_0:closeView()
		existCall(var_4_0)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0._tf:Find("Window/Cancel"), function()
		local var_5_0 = arg_3_0.contextData.onNo

		arg_3_0:closeView()
		existCall(var_5_0)
	end, SFX_CANCEL)
	onButton(arg_3_0, arg_3_0._tf:Find("Mask"), function()
		local var_6_0 = arg_3_0.contextData.onClose

		arg_3_0:closeView()
		existCall(var_6_0)
	end)
	LoadImageSpriteAtlasAsync(arg_3_0.contextData.drop:GetIcon(), "", arg_3_0._tf:Find("Window/Item/Icon"), true)
	setText(arg_3_0._tf:Find("Window/Content"), arg_3_0.contextData.content)
	setText(arg_3_0._tf:Find("Window/Tip"), arg_3_0.contextData.tip)
	setText(arg_3_0._tf:Find("Window/Confirm/Text"), i18n("msgbox_text_confirm"))
	setText(arg_3_0._tf:Find("Window/Cancel/Text"), i18n("msgbox_text_cancel"))
	pg.UIMgr.GetInstance():OverlayPanel(arg_3_0._tf, {
		weight = LayerWeightConst.THIRD_LAYER
	})
end

function var_0_0.willExit(arg_7_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_7_0._tf)
end

return var_0_0
