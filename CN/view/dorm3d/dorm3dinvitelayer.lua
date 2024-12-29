local var_0_0 = class("Dorm3dInviteLayer", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "Dorm3dInviteWindow"
end

function var_0_0.init(arg_2_0)
	arg_2_0.rtInvitePanel = arg_2_0._tf:Find("invite_panel")

	setText(arg_2_0.rtInvitePanel:Find("window/Text"), i18n("dorm3d_invite_beach_tip"))
	setText(arg_2_0.rtInvitePanel:Find("window/btn_confirm/Text"), i18n("text_confirm"))
	onButton(arg_2_0, arg_2_0.rtInvitePanel:Find("bg"), function()
		arg_2_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_2_0, arg_2_0.rtInvitePanel:Find("window/btn_close"), function()
		arg_2_0:closeView()
	end, SFX_CANCEL)

	arg_2_0.rtSelectPanel = arg_2_0._tf:Find("select_panel")

	setText(arg_2_0.rtSelectPanel:Find("window/character/title"), i18n("dorm3d_select_tip"))
	onButton(arg_2_0, arg_2_0.rtSelectPanel:Find("bg"), function()
		arg_2_0:HideSelectPanel()
		arg_2_0:ShowInvitePanel()
	end, SFX_CANCEL)
	setText(arg_2_0.rtSelectPanel:Find("window/title/Text"), i18n("dorm3d_data_choose"))
	setText(arg_2_0.rtSelectPanel:Find("window/bottom/container/btn_confirm/Text"), i18n("text_confirm"))
end

function var_0_0.ShowInvitePanel(arg_6_0)
	GetImageSpriteFromAtlasAsync("dorm3dselect/room_invite_" .. arg_6_0.room:getConfig("assets_prefix"), "", arg_6_0.rtInvitePanel:Find("window/Image"))
	setText(arg_6_0.rtInvitePanel:Find("window/Text"), i18n("dorm3d_data_go", arg_6_0.room:getRoomName()))

	local var_6_0, var_6_1 = arg_6_0.room:getInteractRange()
	local var_6_2 = arg_6_0.rtInvitePanel:Find("window/container")

	UIItemList.StaticAlign(var_6_2, var_6_2:GetChild(0), var_6_1, function(arg_7_0, arg_7_1, arg_7_2)
		arg_7_1 = arg_7_1 + 1

		if arg_7_0 == UIItemList.EventUpdate then
			local var_7_0 = arg_6_0.selectIds[arg_7_1]

			setActive(arg_7_2:Find("empty"), not var_7_0)
			setActive(arg_7_2:Find("ship"), var_7_0)

			if var_7_0 then
				local var_7_1 = pg.dorm3d_resource.get_id_list_by_ship_group[var_7_0][1]

				GetImageSpriteFromAtlasAsync(pg.dorm3d_resource[var_7_1].head_Icon, "", arg_7_2:Find("ship"), true)
			end

			onButton(arg_6_0, arg_7_2, function()
				arg_6_0:HideInvitePanel()
				arg_6_0:ShowSelectPanel()
			end, SFX_PANEL)
		end
	end)
	onButton(arg_6_0, arg_6_0.rtInvitePanel:Find("window/btn_confirm"), function()
		if #arg_6_0.selectIds < var_6_0 or #arg_6_0.selectIds > var_6_1 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_data_Invite_lack"))

			return
		end

		arg_6_0:emit(Dorm3dInviteMediator.ON_DORM, {
			roomId = arg_6_0.room.id,
			groupIds = underscore.rest(arg_6_0.selectIds, 1)
		})
	end, SFX_CONFIRM)
	pg.UIMgr.GetInstance():OverlayPanel(arg_6_0.rtInvitePanel, {
		force = true,
		weight = LayerWeightConst.SECOND_LAYER
	})
	setActive(arg_6_0.rtInvitePanel, true)
	pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_sidebar")
end

function var_0_0.HideInvitePanel(arg_10_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_10_0.rtInvitePanel, arg_10_0._tf)
	setActive(arg_10_0.rtInvitePanel, false)
end

function var_0_0.ShowSelectPanel(arg_11_0)
	local var_11_0 = arg_11_0.room:getInviteList()
	local var_11_1, var_11_2 = arg_11_0.room:getInteractRange()
	local var_11_3 = {}
	local var_11_4 = {}

	for iter_11_0, iter_11_1 in ipairs(var_11_0) do
		if not arg_11_0.room.unlockCharacter[iter_11_1] then
			var_11_4[iter_11_1] = "lock"
		elseif not getProxy(ApartmentProxy):getApartment(iter_11_1) then
			var_11_4[iter_11_1] = "room"
		elseif Apartment.New({
			ship_group = iter_11_1
		}):needDownload() then
			var_11_4[iter_11_1] = "download"
		else
			var_11_4[iter_11_1] = nil
		end
	end

	local var_11_5 = arg_11_0.rtSelectPanel:Find("window/character/container")

	UIItemList.StaticAlign(var_11_5, var_11_5:GetChild(0), #var_11_0, function(arg_12_0, arg_12_1, arg_12_2)
		arg_12_1 = arg_12_1 + 1

		if arg_12_0 == UIItemList.EventUpdate then
			local var_12_0 = var_11_0[arg_12_1]

			setActive(arg_12_2:Find("base"), var_12_0)
			setActive(arg_12_2:Find("empty"), not var_12_0)

			if not var_12_0 then
				arg_12_2.name = "null"

				setText(arg_12_2:Find("empty/Text"), i18n("dorm3d_waiting"))
			else
				arg_12_2.name = tostring(var_12_0)

				arg_11_0:UpdateSelectableCard(arg_12_2:Find("base"), var_12_0, function(arg_13_0)
					table.removebyvalue(var_11_3, var_12_0, true)

					if arg_13_0 then
						table.insert(var_11_3, var_12_0)
					end

					setText(arg_11_0.rtSelectPanel:Find("window/bottom/title/Text"), i18n("dorm3d_select_tip") .. #var_11_3 .. "/" .. var_11_2)
				end)
				triggerToggle(arg_12_2:Find("base"), table.contains(arg_11_0.selectIds, var_12_0))
				setActive(arg_12_2:Find("base/mask"), var_11_4[var_12_0])
				onButton(arg_11_0, arg_12_2:Find("base/mask"), function()
					if var_11_4[var_12_0] == "lock" then
						arg_11_0:HideSelectPanel()
						arg_11_0:emit(Dorm3dInviteMediator.OPEN_ROOM_UNLOCK_WINDOW, arg_11_0.room:GetConfigID(), var_12_0)
					elseif var_11_4[var_12_0] == "room" then
						pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_role_locked"))
					elseif var_11_4[var_12_0] == "download" then
						pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_guide_beach_tip"))
					end
				end, SFX_PANEL)
				eachChild(arg_12_2:Find("base/operation"), function(arg_15_0)
					setActive(arg_15_0, arg_15_0.name == var_11_4[var_12_0])
				end)
			end
		end
	end)
	onButton(arg_11_0, arg_11_0.rtSelectPanel:Find("window/bottom/container/btn_confirm"), function()
		if #var_11_3 > var_11_2 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_data_Invite_lack"))

			return
		end

		arg_11_0.selectIds = var_11_3

		arg_11_0:HideSelectPanel()
		arg_11_0:ShowInvitePanel()
	end, SFX_CONFIRM)
	pg.UIMgr.GetInstance():OverlayPanelPB(arg_11_0.rtSelectPanel, {
		force = true,
		weight = LayerWeightConst.SECOND_LAYER,
		pbList = {
			arg_11_0.rtSelectPanel:Find("window")
		}
	})
	setActive(arg_11_0.rtSelectPanel, true)
end

function var_0_0.UpdateSelectableCard(arg_17_0, arg_17_1, arg_17_2, arg_17_3)
	local var_17_0 = Apartment.New({
		ship_group = arg_17_2
	}):GetSkinModelID(arg_17_0.room:getConfig("tag"))

	GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/room_card_apartment_%d", var_17_0), "", arg_17_1:Find("Image"))
	GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/room_card_apartment_name_%d", arg_17_2), "", arg_17_1:Find("name"))

	local var_17_1 = getProxy(ApartmentProxy):getApartment(arg_17_2)
	local var_17_2 = not var_17_1 or var_17_1:needDownload()

	setActive(arg_17_1:Find("lock"), var_17_2)
	setActive(arg_17_1:Find("mask"), var_17_2)
	setActive(arg_17_1:Find("unlock"), not var_17_2)
	setActive(arg_17_1:Find("favor_level"), var_17_1)

	if var_17_1 then
		setText(arg_17_1:Find("favor_level/Text"), var_17_1.level)
	end

	onToggle(arg_17_0, arg_17_1, function(arg_18_0)
		arg_17_3(arg_18_0)

		if arg_18_0 then
			if not var_17_1 then
				pg.TipsMgr.GetInstance():ShowTips(string.format("need unlock apartment{%d}", arg_17_2))
				triggerToggle(arg_17_1, false)
			elseif var_17_1:needDownload() then
				pg.TipsMgr.GetInstance():ShowTips(string.format("need download resource{%d}", arg_17_2))
				triggerToggle(arg_17_1, false)
			end
		end
	end, SFX_UI_CLICK)
end

function var_0_0.HideSelectPanel(arg_19_0)
	pg.UIMgr.GetInstance():UnblurPanel(arg_19_0.rtSelectPanel, arg_19_0._tf)
	setActive(arg_19_0.rtSelectPanel, false)
end

function var_0_0.UpdateRoom(arg_20_0, arg_20_1)
	arg_20_0.room = arg_20_1
end

function var_0_0.didEnter(arg_21_0)
	arg_21_0.selectIds = underscore.filter(arg_21_0.contextData.groupIds or {}, function(arg_22_0)
		return arg_21_0.room.unlockCharacter[arg_22_0] and tobool(getProxy(ApartmentProxy):getApartment(arg_22_0)) and not Apartment.New({
			ship_group = arg_22_0
		}):needDownload()
	end)
	arg_21_0.contextData.groupIds = nil

	arg_21_0:ShowInvitePanel()
end

function var_0_0.onBackPressed(arg_23_0)
	if isActive(arg_23_0.rtSelectPanel) then
		arg_23_0:HideSelectPanel()
		arg_23_0:ShowInvitePanel()
	else
		arg_23_0:closeView()
	end
end

function var_0_0.willExit(arg_24_0)
	if isActive(arg_24_0.rtSelectPanel) then
		arg_24_0:HideSelectPanel()
	else
		arg_24_0:HideInvitePanel()
	end
end

return var_0_0
