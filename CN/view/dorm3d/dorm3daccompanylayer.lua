local var_0_0 = class("Dorm3dAccompanyLayer", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "Dorm3dAccompanyWindow"
end

function var_0_0.init(arg_2_0)
	arg_2_0.rtPanel = arg_2_0._tf:Find("panel")

	onButton(arg_2_0, arg_2_0.rtPanel:Find("bg"), function()
		arg_2_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_2_0, arg_2_0.rtPanel:Find("window/btn_close"), function()
		arg_2_0:closeView()
	end, SFX_CANCEL)

	arg_2_0.richText = arg_2_0.rtPanel:Find("window/Text"):GetComponent("RichText")

	arg_2_0.richText:AddSprite("stamina", arg_2_0._tf:Find("res/stamina"):GetComponent(typeof(Image)).sprite)
end

function var_0_0.HideInvitePanel(arg_5_0)
	arg_5_0.selectIds = nil

	setActive(arg_5_0.rtPanel, false)
end

function var_0_0.didEnter(arg_6_0)
	arg_6_0.room = getProxy(ApartmentProxy):getRoom(arg_6_0.contextData.roomId)

	local var_6_0 = underscore.filter(pg.dorm3d_accompany.get_id_list_by_ship_id[arg_6_0.contextData.groupId], function(arg_7_0)
		return ApartmentProxy.CheckUnlockConfig(pg.dorm3d_accompany[arg_7_0].unlock)
	end)
	local var_6_1 = arg_6_0.rtPanel:Find("window/content")

	UIItemList.StaticAlign(var_6_1, var_6_1:GetChild(0), 3, function(arg_8_0, arg_8_1, arg_8_2)
		arg_8_1 = arg_8_1 + 1

		if arg_8_0 == UIItemList.EventUpdate then
			local var_8_0 = var_6_0[arg_8_1]

			setActive(arg_8_2:Find("empty"), not var_8_0)
			setActive(arg_8_2:Find("Image"), var_8_0)

			if var_8_0 then
				local var_8_1 = pg.dorm3d_accompany[var_8_0]

				GetImageSpriteFromAtlasAsync("dorm3daccompany/" .. var_8_1.image, "", arg_8_2:Find("Image"))
				onButton(arg_6_0, arg_8_2:Find("Image"), function()
					arg_6_0.contextData.confirmFunc(var_8_0)
					arg_6_0:closeView()
				end, SFX_CONFIRM)
				setText(arg_6_0.rtPanel:Find("window/Text"), i18n("dorm3d_collection_cost_tip"))
			else
				setText(arg_8_2:Find("empty/Image/Text"), i18n("dorm3d_accompany_locked"))
			end
		end
	end)
end

function var_0_0.willExit(arg_10_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_10_0.rtPanel, arg_10_0.rtLayer)
end

return var_0_0
