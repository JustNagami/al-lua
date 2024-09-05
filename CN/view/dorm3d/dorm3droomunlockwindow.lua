local var_0_0 = class("Dorm3dRoomUnlockWindow", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "Dorm3dRoomUnlockWindow"
end

function var_0_0.init(arg_2_0)
	return
end

function var_0_0.didEnter(arg_3_0)
	onButton(arg_3_0, arg_3_0._tf:Find("Window/Confirm"), function()
		arg_3_0:emit(Dorm3dRoomUnlockWindowMediator.ON_UNLOCK_DORM_ROOM, arg_3_0.contextData.roomId)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0._tf:Find("Window/Cancel"), function()
		arg_3_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_3_0, arg_3_0._tf:Find("bg"), function()
		arg_3_0:closeView()
	end)

	local var_3_0 = ApartmentRoom.New({
		id = arg_3_0.contextData.roomId
	})

	setText(arg_3_0._tf:Find("Window/Content"), i18n("dorm3d_beach_buy", table.concat(underscore.map(var_3_0:getConfig("unlock_item"), function(arg_7_0)
		local var_7_0 = Drop.Create(arg_7_0)

		return string.format("%s*%d", var_7_0:getName(), var_7_0.count)
	end)), "、"))
	setText(arg_3_0._tf:Find("Window/Tip"), i18n("dorm3d_beach_role", table.concat(underscore.map(var_3_0:getConfig("character"), function(arg_8_0)
		return ShipGroup.getDefaultShipNameByGroupID(arg_8_0)
	end), "、")))
	setText(arg_3_0._tf:Find("Window/Confirm/Text"), i18n("msgbox_text_confirm"))
	setText(arg_3_0._tf:Find("Window/Cancel/Text"), i18n("msgbox_text_cancel"))

	local var_3_1, var_3_2 = var_3_0:getDownloadNameList()
	local var_3_3 = table.mergeArray(var_3_1, var_3_2)
	local var_3_4, var_3_5 = DormGroupConst.CalcDormListSize(var_3_3)

	setText(arg_3_0._tf:Find("Window/Download"), i18n("dorm3d_beach_download", var_3_4))
	GetImageSpriteFromAtlasAsync("dorm3dselect/room_unlock_" .. string.lower(var_3_0:getConfig("assets_prefix")), "", arg_3_0._tf:Find("Window/Preview/Image"))
	pg.UIMgr.GetInstance():OverlayPanel(arg_3_0._tf, {
		weight = LayerWeightConst.THIRD_LAYER
	})
end

function var_0_0.willExit(arg_9_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_9_0._tf)
end

return var_0_0
