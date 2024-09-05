local var_0_0 = class("SelectDorm3DScene", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "SelectDorm3DUI"
end

var_0_0.optionsPath = {
	"Main/option"
}

function var_0_0.init(arg_2_0)
	arg_2_0.rtMap = arg_2_0._tf:Find("Map")
	arg_2_0.rtIconTip = arg_2_0.rtMap:Find("tip")

	setActive(arg_2_0.rtIconTip, false)
	onButton(arg_2_0, arg_2_0.rtIconTip:Find("bg"), function()
		arg_2_0:HideIconTipWindow()
	end, SFX_CANCEL)
	setText(arg_2_0.rtIconTip:Find("window/btn_cancel/Text"), i18n("text_cancel"))
	onButton(arg_2_0, arg_2_0.rtIconTip:Find("window/btn_cancel"), function()
		arg_2_0:HideIconTipWindow()
	end, SFX_CANCEL)
	setText(arg_2_0.rtIconTip:Find("window/btn_confirm/Text"), i18n("text_confirm"))

	arg_2_0.rtMain = arg_2_0._tf:Find("Main")

	setText(arg_2_0.rtMain:Find("title/Text"), i18n("dorm3d_role_choose"))
	onButton(arg_2_0, arg_2_0.rtMain:Find("btn_back"), function()
		arg_2_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_2_0, arg_2_0.rtMain:Find("btn_mgr"), function()
		arg_2_0:ShowMgrPanel()
	end)

	arg_2_0.rtStamina = arg_2_0.rtMain:Find("stamina")
	arg_2_0.rtRes = arg_2_0.rtMain:Find("res")

	arg_2_0:InitResBar()

	arg_2_0.rtWeekTask = arg_2_0.rtMain:Find("task")

	arg_2_0:UpdateWeekTask()

	arg_2_0.rtLayer = arg_2_0._tf:Find("Layer")
	arg_2_0.rtInvitePanel = arg_2_0.rtLayer:Find("invite_panel")

	setText(arg_2_0.rtInvitePanel:Find("window/Text"), i18n("dorm3d_invite_beach_tip"))
	setText(arg_2_0.rtInvitePanel:Find("window/btn_confirm/Text"), i18n("text_confirm"))
	onButton(arg_2_0, arg_2_0.rtInvitePanel:Find("window/btn_close"), function()
		arg_2_0:HideInvitePanel()
	end, SFX_CANCEL)

	arg_2_0.rtSelectPanel = arg_2_0.rtLayer:Find("select_panel")

	setText(arg_2_0.rtSelectPanel:Find("window/character/title"), i18n("dorm3d_select_tip"))
	onButton(arg_2_0, arg_2_0.rtSelectPanel:Find("bg"), function()
		arg_2_0:HideSelectPanel()
	end, SFX_CANCEL)
	setText(arg_2_0.rtSelectPanel:Find("window/title/Text"), i18n("dorm3d_data_choose"))
	setText(arg_2_0.rtSelectPanel:Find("window/bottom/container/btn_confirm/Text"), i18n("text_confirm"))

	arg_2_0.rtMgrPanel = arg_2_0.rtLayer:Find("mgr_panel")

	onButton(arg_2_0, arg_2_0.rtMgrPanel:Find("bg"), function()
		arg_2_0:HideMgrPanel()
	end, SFX_CANCEL)
	setText(arg_2_0.rtMgrPanel:Find("window/title/Text"), i18n("dorm3d_role_manage"))

	arg_2_0.rtMgrChar = arg_2_0.rtMgrPanel:Find("window/character")

	setText(arg_2_0.rtMgrChar:Find("title"), i18n("dorm3d_role_manage_role"))

	local var_2_0 = arg_2_0.rtMgrChar:Find("container")

	arg_2_0.charRoomCardItemList = UIItemList.New(var_2_0, var_2_0:Find("tpl"))

	arg_2_0.charRoomCardItemList:make(function(arg_10_0, arg_10_1, arg_10_2)
		arg_10_1 = arg_10_1 + 1

		if arg_10_0 == UIItemList.EventUpdate then
			local var_10_0 = arg_2_0.filterCharRoomIds[arg_10_1]

			setActive(arg_10_2:Find("base"), var_10_0)
			setActive(arg_10_2:Find("empty"), not var_10_0)

			if not var_10_0 then
				arg_10_2.name = "null"

				setText(arg_10_2:Find("empty/Text"), i18n("dorm3d_waiting"))
			else
				arg_10_2.name = tostring(var_10_0)
				arg_2_0.cardDic[var_10_0] = arg_10_2:Find("base")

				arg_2_0:InitCardTrigger(var_10_0)
				arg_2_0:UpdateCardState(var_10_0)

				return
			end
		end
	end)

	arg_2_0.rtMgrPublic = arg_2_0.rtMgrPanel:Find("window/public")

	setText(arg_2_0.rtMgrPublic:Find("title"), i18n("dorm3d_role_manage_public_area"))

	local var_2_1 = arg_2_0.rtMgrPublic:Find("container")

	arg_2_0.publicRoomCardItemList = UIItemList.New(var_2_1, var_2_1:Find("tpl"))

	arg_2_0.publicRoomCardItemList:make(function(arg_11_0, arg_11_1, arg_11_2)
		arg_11_1 = arg_11_1 + 1

		if arg_11_0 == UIItemList.EventUpdate then
			local var_11_0 = arg_2_0.filterPublicRoomIds[arg_11_1]

			arg_2_0.cardDic[var_11_0] = arg_11_2

			arg_2_0:InitCardTrigger(var_11_0)
			arg_2_0:UpdateCardState(var_11_0)
		end
	end)
end

function var_0_0.didEnter(arg_12_0)
	arg_12_0.contextData.floorName = arg_12_0.contextData.floorName or "floor_1"

	arg_12_0:SetFloor(arg_12_0.contextData.floorName)
	setText(arg_12_0.rtStamina:Find("Text"), string.format("%d/%d", getProxy(ApartmentProxy):getStamina()))
end

function var_0_0.SetFloor(arg_13_0, arg_13_1)
	local var_13_0

	eachChild(arg_13_0.rtMap, function(arg_14_0)
		setActive(arg_14_0, arg_14_0.name == arg_13_1)

		if arg_14_0.name == arg_13_1 then
			var_13_0 = arg_14_0
		end
	end)
	assert(var_13_0)

	arg_13_0.roomDic = {}

	for iter_13_0, iter_13_1 in ipairs(pg.dorm3d_rooms.get_id_list_by_in_map[arg_13_1]) do
		arg_13_0.roomDic[iter_13_1] = var_13_0:Find(pg.dorm3d_rooms[iter_13_1].assets_prefix)

		arg_13_0:InitIconTrigger(iter_13_1)
		arg_13_0:UpdateIconState(iter_13_1)
	end

	arg_13_0:ReplaceSpecialRoomIcon()
end

function var_0_0.InitIconTrigger(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_0.roomDic[arg_15_1]
	local var_15_1 = pg.dorm3d_rooms[arg_15_1].assets_prefix

	GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/room_icon_%s", string.lower(var_15_1)), "", var_15_0:Find("icon"))
	onButton(arg_15_0, var_15_0, function()
		local var_16_0 = getProxy(ApartmentProxy):getRoom(arg_15_1)
		local var_16_1 = pg.dorm3d_rooms[arg_15_1].type

		if var_16_1 == 1 then
			if not var_16_0 then
				arg_15_0:emit(SelectDorm3DMediator.OPEN_ROOM_UNLOCK_WINDOW, arg_15_1)
			else
				arg_15_0:TryDownloadResource({
					click = true,
					roomId = arg_15_1
				}, function()
					arg_15_0:ShowInvitePanel(var_16_0)
				end)
			end
		elseif var_16_1 == 2 then
			if not var_16_0 then
				arg_15_0:ShowIconTipWindow(arg_15_1, var_15_0)
			else
				arg_15_0:TryDownloadResource({
					click = true,
					roomId = arg_15_1
				}, function()
					arg_15_0:emit(SelectDorm3DMediator.ON_DORM, var_16_1, {
						groupId = var_16_0:getConfig("character")[1]
					})
				end)
			end
		else
			assert(false)
		end
	end, SFX_PANEL)
end

function var_0_0.UpdateIconState(arg_19_0, arg_19_1)
	local var_19_0 = arg_19_0.roomDic[arg_19_1]
	local var_19_1 = getProxy(ApartmentProxy):getRoom(arg_19_1)
	local var_19_2 = var_19_1 and var_19_1:getState() or "lock"

	setActive(var_19_0:Find("icon/mask"), var_19_2 ~= "complete")
	eachChild(var_19_0:Find("front"), function(arg_20_0)
		setActive(arg_20_0, arg_20_0.name == var_19_2)
	end)
	switch(var_19_2, {
		loading = function()
			local var_21_0 = DormGroupConst.DormDownloadLock

			setSlider(var_19_0:Find("front/loading/progress"), 0, var_21_0.totalSize, var_21_0.curSize)
		end,
		complete = function()
			local var_22_0 = var_19_0:Find("front/complete")
			local var_22_1 = var_19_1:getConfig("type") == 2

			eachChild(var_22_0, function(arg_23_0)
				setActive(arg_23_0, var_22_1)
			end)

			if var_22_1 then
				local var_22_2 = var_19_1:getApartment()

				setText(var_22_0:Find("favor/Text"), var_22_2.level)

				local var_22_3 = var_22_2:getIconTip()

				eachChild(var_22_0:Find("tip"), function(arg_24_0)
					setActive(arg_24_0, arg_24_0.name == var_22_3)
				end)
			end
		end
	})
end

function var_0_0.UpdateShowIcon(arg_25_0, arg_25_1, arg_25_2)
	removeOnButton(arg_25_2)
	setActive(arg_25_2:Find("icon/mask"), false)
	eachChild(arg_25_2:Find("front"), function(arg_26_0)
		setActive(arg_26_0, false)
	end)
end

function var_0_0.ReplaceSpecialRoomIcon(arg_27_0)
	local var_27_0 = {}

	for iter_27_0, iter_27_1 in pairs(getProxy(ApartmentProxy):getRawData()) do
		for iter_27_2, iter_27_3 in ipairs(iter_27_1:getSpecialTalking()) do
			local var_27_1 = pg.dorm3d_dialogue_group[iter_27_3].trigger_config[1]

			var_27_0[var_27_1] = var_27_0[var_27_1] or {}

			table.insert(var_27_0[var_27_1], iter_27_3)
		end
	end

	for iter_27_4, iter_27_5 in pairs(var_27_0) do
		setActive(arg_27_0.roomDic[iter_27_4], false)

		local var_27_2 = cloneTplTo(arg_27_0.roomDic[iter_27_4], arg_27_0.roomDic[iter_27_4].parent, arg_27_0.roomDic[iter_27_4].name .. "_special")

		arg_27_0:UpdateShowIcon(iter_27_4, var_27_2)
		GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/room_icon_%s", string.lower(pg.dorm3d_rooms[iter_27_4].assets_prefix)), "", var_27_2:Find("icon"))
		setActive(var_27_2:Find("front/complete"), true)
		setActive(var_27_2:Find("front/complete/favor"), false)
		eachChild(var_27_2:Find("front/complete/tip"), function(arg_28_0)
			setActive(arg_28_0, arg_28_0.name == "main")
		end)
		table.sort(iter_27_5)
		onButton(arg_27_0, var_27_2, function()
			local var_29_0, var_29_1, var_29_2 = unpack(pg.dorm3d_dialogue_group[iter_27_5[1]].trigger_config)
			local var_29_3 = getProxy(ApartmentProxy):getRoom(var_29_1)
			local var_29_4 = var_29_3:getConfig("type")

			arg_27_0:TryDownloadResource({
				click = true,
				roomId = var_29_1
			}, function()
				arg_27_0:emit(SelectDorm3DMediator.ON_DORM, var_29_4, switch(var_29_4, {
					function()
						return {
							groupIds = {}
						}
					end,
					function()
						return {
							groupId = var_29_3:getApartmentId(),
							specialId = iter_27_5[1]
						}
					end
				}))
			end)
		end, SFX_PANEL)
	end
end

function var_0_0.InitCardTrigger(arg_33_0, arg_33_1)
	local var_33_0 = getProxy(ApartmentProxy):getRoom(arg_33_1)

	assert(var_33_0)

	local var_33_1 = arg_33_0.cardDic[arg_33_1]
	local var_33_2 = var_33_0:getConfig("assets_prefix")
	local var_33_3 = var_33_0:getConfig("type")

	if var_33_3 == 1 then
		GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/room_card_%s", string.lower(var_33_2)), "", var_33_1:Find("Image"))
		removeOnButton(var_33_1)
	elseif var_33_3 == 2 then
		local var_33_4 = var_33_0:getApartmentId()

		GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/room_card_apartment_%d", var_33_4), "", var_33_1:Find("Image"))
		GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/room_card_apartment_name_%d", var_33_4), "", var_33_1:Find("name"))
		onButton(arg_33_0, var_33_1, function()
			arg_33_0:TryDownloadResource({
				click = true,
				roomId = arg_33_1
			}, function()
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("dorm3d_role_assets_delete", ShipGroup.getDefaultShipNameByGroupID(var_33_4)),
					onYes = function()
						if IsUnityEditor then
							pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_open"))

							return
						end

						local var_36_0 = var_33_0:getApartment():getConfig("resource_name")

						DormGroupConst.DelDir("dorm3d/character/" .. string.lower(var_36_0))
						pg.TipsMgr.GetInstance():ShowTips("delete finish !")
					end
				})
			end)
		end, SFX_PANEL)
	else
		assert(false)
	end
end

function var_0_0.UpdateCardState(arg_37_0, arg_37_1)
	local var_37_0 = getProxy(ApartmentProxy):getRoom(arg_37_1)
	local var_37_1 = arg_37_0.cardDic[arg_37_1]
	local var_37_2 = var_37_0:getState()
	local var_37_3 = var_37_0:getConfig("type")

	if var_37_0:getConfig("type") == 2 then
		setActive(var_37_1:Find("lock"), var_37_2 ~= "complete")
		setActive(var_37_1:Find("unlock"), var_37_2 == "complete")

		local var_37_4 = var_37_0:getApartment()

		setText(var_37_1:Find("favor_level/Text"), var_37_4 and var_37_4.level or "?")
	end

	local var_37_5 = var_37_1:Find("operation")

	eachChild(var_37_5, function(arg_38_0)
		setActive(arg_38_0, arg_38_0.name == var_37_2)
	end)

	if DormGroupConst.DormDownloadLock and DormGroupConst.DormDownloadLock.roomId == arg_37_1 then
		arg_37_0:UpdateCardProgess()
	end

	setActive(var_37_1:Find("mask"), var_37_2 ~= "complete")
end

function var_0_0.UpdateCardProgess(arg_39_0)
	local var_39_0 = DormGroupConst.DormDownloadLock
	local var_39_1 = arg_39_0.cardDic[var_39_0.roomId]

	setSlider(var_39_1:Find("operation/loading"), 0, var_39_0.totalSize, var_39_0.curSize)
end

function var_0_0.UpdateSelectableCard(arg_40_0, arg_40_1, arg_40_2, arg_40_3)
	GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/room_card_apartment_%d", arg_40_2), "", arg_40_1:Find("Image"))
	GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/room_card_apartment_name_%d", arg_40_2), "", arg_40_1:Find("name"))

	local var_40_0 = getProxy(ApartmentProxy):getApartment(arg_40_2)
	local var_40_1 = not var_40_0 or var_40_0:needDownload()

	setActive(arg_40_1:Find("lock"), var_40_1)
	setActive(arg_40_1:Find("mask"), var_40_1)
	setActive(arg_40_1:Find("unlock"), not var_40_1)
	setActive(arg_40_1:Find("favor_level"), var_40_0)

	if var_40_0 then
		setText(arg_40_1:Find("favor_level/Text"), var_40_0.level)
	end

	onToggle(arg_40_0, arg_40_1, function(arg_41_0)
		arg_40_3(arg_41_0)

		if arg_41_0 then
			if not var_40_0 then
				pg.TipsMgr.GetInstance():ShowTips(string.format("need unlock apartment{%d}", arg_40_2))
				triggerToggle(arg_40_1, false)
			elseif var_40_0:needDownload() then
				pg.TipsMgr.GetInstance():ShowTips(string.format("need download resource{%d}", arg_40_2))
				triggerToggle(arg_40_1, false)
			end
		end
	end, SFX_UI_CLICK)
end

function var_0_0.DownloadUpdate(arg_42_0, arg_42_1, arg_42_2)
	switch(arg_42_2, {
		start = function()
			if arg_42_0.roomDic[arg_42_1] then
				arg_42_0:UpdateIconState(arg_42_1)
			end

			if arg_42_0.cardDic and arg_42_0.cardDic[arg_42_1] then
				arg_42_0:UpdateCardState(arg_42_1)
			end
		end,
		loading = function()
			if arg_42_0.roomDic[arg_42_1] then
				local var_44_0 = DormGroupConst.DormDownloadLock

				setSlider(arg_42_0.roomDic[arg_42_1]:Find("front/loading/progress"), 0, var_44_0.totalSize, var_44_0.curSize)
			end

			if arg_42_0.cardDic and arg_42_0.cardDic[arg_42_1] then
				arg_42_0:UpdateCardProgess()
			end
		end,
		finish = function()
			for iter_45_0, iter_45_1 in pairs(arg_42_0.roomDic) do
				if iter_45_0 == arg_42_1 or pg.dorm3d_rooms[iter_45_0].type == 1 then
					arg_42_0:UpdateIconState(iter_45_0)
				end
			end

			if arg_42_0.cardDic then
				for iter_45_2, iter_45_3 in pairs(arg_42_0.cardDic) do
					if iter_45_2 == arg_42_1 or pg.dorm3d_rooms[iter_45_2].type == 1 then
						arg_42_0:UpdateCardState(iter_45_2)
					end
				end
			end
		end
	})
end

function var_0_0.AfterRoomUnlock(arg_46_0, arg_46_1)
	local var_46_0 = arg_46_1.roomId

	if isActive(arg_46_0.rtIconTip) then
		arg_46_0:HideIconTipWindow()
	end

	eachChild(arg_46_0.roomDic[var_46_0]:Find("icon/mask"), function(arg_47_0)
		setActive(arg_47_0, true)
	end)
	quickPlayAnimation(arg_46_0.roomDic[var_46_0], "anim_Dorm3d_selectDorm_icon_unlock")
	LeanTween.delayedCall(1.2333333333333334, System.Action(function()
		arg_46_0:UpdateIconState(var_46_0)
		arg_46_0:TryDownloadResource(arg_46_1)
	end))
end

function var_0_0.ShowIconTipWindow(arg_49_0, arg_49_1, arg_49_2)
	setLocalPosition(arg_49_0.rtIconTip:Find("window"), arg_49_0.rtIconTip:InverseTransformPoint(arg_49_2.position))
	removeAllChildren(arg_49_0.rtIconTip:Find("window/icon"))

	arg_49_2 = cloneTplTo(arg_49_2, arg_49_0.rtIconTip:Find("window/icon"))

	arg_49_0:UpdateShowIcon(arg_49_1, arg_49_2)
	setAnchoredPosition(arg_49_2, Vector2.zero)

	local var_49_0 = ApartmentRoom.New({
		id = arg_49_1
	})
	local var_49_1, var_49_2 = var_49_0:getDownloadNameList()
	local var_49_3 = table.mergeArray(var_49_1, var_49_2)
	local var_49_4, var_49_5 = DormGroupConst.CalcDormListSize(var_49_3)

	setText(arg_49_0.rtIconTip:Find("window/Text"), i18n("dorm3d_role_assets_download", ShipGroup.getDefaultShipNameByGroupID(var_49_0:getApartmentId()), var_49_5))
	onButton(arg_49_0, arg_49_0.rtIconTip:Find("window/btn_confirm"), function()
		arg_49_0:emit(SelectDorm3DMediator.ON_UNLOCK_DORM_ROOM, arg_49_1)
	end, SFX_CONFIRM)
	setActive(arg_49_0.rtIconTip, true)
end

function var_0_0.HideIconTipWindow(arg_51_0)
	setActive(arg_51_0.rtIconTip, false)
end

function var_0_0.ShowMgrPanel(arg_52_0)
	arg_52_0.cardDic = {}
	arg_52_0.filterCharRoomIds = {}
	arg_52_0.filterPublicRoomIds = {}

	for iter_52_0, iter_52_1 in ipairs(underscore.filter(pg.dorm3d_rooms.all, function(arg_53_0)
		return tobool(getProxy(ApartmentProxy):getRoom(arg_53_0))
	end)) do
		local var_52_0 = pg.dorm3d_rooms[iter_52_1].type

		if var_52_0 == 1 then
			table.insert(arg_52_0.filterPublicRoomIds, iter_52_1)
		elseif var_52_0 == 2 then
			table.insert(arg_52_0.filterCharRoomIds, iter_52_1)
		else
			assert(false)
		end
	end

	arg_52_0.charRoomCardItemList:align(#arg_52_0.filterCharRoomIds)
	arg_52_0.publicRoomCardItemList:align(#arg_52_0.filterPublicRoomIds)
	pg.UIMgr.GetInstance():OverlayPanelPB(arg_52_0.rtMgrPanel, {
		force = true,
		pbList = {
			arg_52_0.rtMgrPanel:Find("window")
		}
	})
	setActive(arg_52_0.rtMgrPanel, true)
end

function var_0_0.HideMgrPanel(arg_54_0)
	arg_54_0.cardDic = nil

	pg.UIMgr.GetInstance():UnblurPanel(arg_54_0.rtMgrPanel, arg_54_0.rtLayer)
	setActive(arg_54_0.rtMgrPanel, false)
end

function var_0_0.ShowInvitePanel(arg_55_0, arg_55_1)
	GetImageSpriteFromAtlasAsync("dorm3dselect/room_invite_" .. arg_55_1:getConfig("assets_prefix"), "", arg_55_0.rtInvitePanel:Find("window/Image"))
	setText(arg_55_0.rtInvitePanel:Find("window/Text"), i18n("dorm3d_data_go", arg_55_1:getRoomName()))

	arg_55_0.selectIds = {}

	local var_55_0, var_55_1 = arg_55_1:getInteractRange()
	local var_55_2 = arg_55_0.rtInvitePanel:Find("window/container")
	local var_55_3

	local function var_55_4()
		UIItemList.StaticAlign(var_55_2, var_55_2:GetChild(0), var_55_1, function(arg_57_0, arg_57_1, arg_57_2)
			arg_57_1 = arg_57_1 + 1

			if arg_57_0 == UIItemList.EventUpdate then
				local var_57_0 = arg_55_0.selectIds[arg_57_1]

				setActive(arg_57_2:Find("empty"), not var_57_0)
				setActive(arg_57_2:Find("ship"), var_57_0)

				if var_57_0 then
					local var_57_1 = pg.dorm3d_resource.get_id_list_by_ship_group[var_57_0][1]

					GetImageSpriteFromAtlasAsync(pg.dorm3d_resource[var_57_1].head_Icon, "", arg_57_2:Find("ship"), true)
				end

				onButton(arg_55_0, arg_57_2, function()
					arg_55_0:ShowSelectPanel(arg_55_1, function(arg_59_0)
						arg_55_0.selectIds = arg_59_0

						var_55_4()
					end)
				end, SFX_PANEL)
			end
		end)
	end

	var_55_4()
	onButton(arg_55_0, arg_55_0.rtInvitePanel:Find("window/btn_confirm"), function()
		if #arg_55_0.selectIds < var_55_0 or #arg_55_0.selectIds > var_55_1 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_data_Invite_lack"))

			return
		end

		arg_55_0:emit(SelectDorm3DMediator.ON_DORM, arg_55_1:getConfig("type"), {
			groupIds = underscore.rest(arg_55_0.selectIds, 1),
			roomId = arg_55_1.id
		})
		arg_55_0:HideInvitePanel()
	end, SFX_CONFIRM)
	pg.UIMgr.GetInstance():OverlayPanel(arg_55_0.rtInvitePanel, {
		force = true
	})
	setActive(arg_55_0.rtInvitePanel, true)
	pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_sidebar")
end

function var_0_0.HideInvitePanel(arg_61_0)
	arg_61_0.selectIds = nil

	pg.UIMgr.GetInstance():UnOverlayPanel(arg_61_0.rtInvitePanel, arg_61_0.rtLayer)
	setActive(arg_61_0.rtInvitePanel, false)
end

function var_0_0.ShowSelectPanel(arg_62_0, arg_62_1, arg_62_2)
	local var_62_0 = arg_62_1:getConfig("character")
	local var_62_1, var_62_2 = arg_62_1:getInteractRange()
	local var_62_3 = {}
	local var_62_4 = arg_62_0.rtSelectPanel:Find("window/character/container")

	UIItemList.StaticAlign(var_62_4, var_62_4:GetChild(0), #var_62_0, function(arg_63_0, arg_63_1, arg_63_2)
		arg_63_1 = arg_63_1 + 1

		if arg_63_0 == UIItemList.EventUpdate then
			local var_63_0 = var_62_0[arg_63_1]

			setActive(arg_63_2:Find("base"), var_63_0)
			setActive(arg_63_2:Find("empty"), not var_63_0)

			if not var_63_0 then
				arg_63_2.name = "null"

				setText(arg_63_2:Find("empty/Text"), i18n("dorm3d_waiting"))
			else
				arg_63_2.name = tostring(var_63_0)

				arg_62_0:UpdateSelectableCard(arg_63_2:Find("base"), var_63_0, function(arg_64_0)
					table.removebyvalue(var_62_3, var_63_0, true)

					if arg_64_0 then
						table.insert(var_62_3, var_63_0)
					end

					setText(arg_62_0.rtSelectPanel:Find("window/bottom/title/Text"), i18n("dorm3d_select_tip") .. #var_62_3 .. "/" .. var_62_2)
				end)
				triggerToggle(arg_63_2:Find("base"), table.contains(arg_62_0.selectIds, var_63_0))
			end
		end
	end)
	onButton(arg_62_0, arg_62_0.rtSelectPanel:Find("window/bottom/container/btn_confirm"), function()
		if #var_62_3 > var_62_2 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_data_Invite_lack"))

			return
		end

		arg_62_2(var_62_3)
		arg_62_0:HideSelectPanel()
	end, SFX_CONFIRM)
	pg.UIMgr.GetInstance():OverlayPanelPB(arg_62_0.rtSelectPanel, {
		force = true,
		pbList = {
			arg_62_0.rtSelectPanel:Find("window")
		}
	})
	setActive(arg_62_0.rtSelectPanel, true)
end

function var_0_0.HideSelectPanel(arg_66_0)
	pg.UIMgr.GetInstance():UnblurPanel(arg_66_0.rtSelectPanel, arg_66_0.rtLayer)
	setActive(arg_66_0.rtSelectPanel, false)
end

function var_0_0.TryDownloadResource(arg_67_0, arg_67_1, arg_67_2)
	if DormGroupConst.IsDownloading() then
		pg.TipsMgr.GetInstance():ShowTips("now is downloading")

		return
	end

	local var_67_0 = getProxy(ApartmentProxy):getRoom(arg_67_1.roomId)
	local var_67_1, var_67_2 = var_67_0:getDownloadNameList()

	if #var_67_1 > 0 or #var_67_2 > 0 then
		local var_67_3 = {
			isShowBox = true,
			fileList = table.mergeArray(var_67_1, var_67_2),
			finishFunc = function(arg_68_0)
				if arg_68_0 then
					pg.TipsMgr.GetInstance():ShowTips("dorm resource download complete !")
				end

				if arg_67_0.roomDic[var_67_0.configId] then
					arg_67_0:UpdateIconState(var_67_0.configId)
				end
			end,
			roomId = var_67_0.configId
		}

		DormGroupConst.DormDownload(var_67_3)
	else
		existCall(arg_67_2)
	end
end

function var_0_0.InitResBar(arg_69_0)
	arg_69_0.goldMax = arg_69_0.rtRes:Find("gold/max"):GetComponent(typeof(Text))
	arg_69_0.goldValue = arg_69_0.rtRes:Find("gold/Text"):GetComponent(typeof(Text))
	arg_69_0.oilMax = arg_69_0.rtRes:Find("oil/max"):GetComponent(typeof(Text))
	arg_69_0.oilValue = arg_69_0.rtRes:Find("oil/Text"):GetComponent(typeof(Text))
	arg_69_0.gemValue = arg_69_0.rtRes:Find("gem/Text"):GetComponent(typeof(Text))

	onButton(arg_69_0, arg_69_0.rtRes:Find("gold"), function()
		warning("debug test")
		pg.playerResUI:ClickGold()
	end, SFX_PANEL)
	onButton(arg_69_0, arg_69_0.rtRes:Find("oil"), function()
		pg.playerResUI:ClickOil()
	end, SFX_PANEL)
	onButton(arg_69_0, arg_69_0.rtRes:Find("gem"), function()
		pg.playerResUI:ClickGem()
	end, SFX_PANEL)
	arg_69_0:UpdateRes()
end

function var_0_0.UpdateRes(arg_73_0)
	local var_73_0 = getProxy(PlayerProxy):getRawData()

	PlayerResUI.StaticFlush(var_73_0, arg_73_0.goldMax, arg_73_0.goldValue, arg_73_0.oilMax, arg_73_0.oilValue, arg_73_0.gemValue)
end

function var_0_0.UpdateWeekTask(arg_74_0)
	local var_74_0 = getDorm3dGameset("drom3d_weekly_task")[1]
	local var_74_1 = getProxy(TaskProxy):getTaskVO(var_74_0)
	local var_74_2 = var_74_1:isReceive()
	local var_74_3 = var_74_2 and 3 or var_74_1:getProgress()
	local var_74_4 = arg_74_0.rtWeekTask:Find("content")

	for iter_74_0 = 1, 3 do
		triggerToggle(var_74_4:Find("tpl_" .. iter_74_0), iter_74_0 <= var_74_3)
	end

	local var_74_5 = Drop.Create(var_74_1:getConfig("award_display")[1])

	updateDorm3dIcon(var_74_4:Find("Dorm3dIconTpl"), var_74_5)
	onButton(arg_74_0, var_74_4:Find("Dorm3dIconTpl"), function()
		if not var_74_2 and var_74_1:isFinish() then
			arg_74_0:emit(SelectDorm3DMediator.ON_SUBMIT_TASK, var_74_0)
		else
			arg_74_0:emit(BaseUI.ON_NEW_DROP, {
				drop = var_74_5
			})
		end
	end, SFX_CONFIRM)
	setGray(var_74_4:Find("Dorm3dIconTpl"), var_74_2)
end

function var_0_0.onBackPressed(arg_76_0)
	if isActive(arg_76_0.rtMgrPanel) then
		arg_76_0:HideMgrPanel()
	elseif isActive(arg_76_0.rtSelectPanel) then
		arg_76_0:HideSelectPanel()
	elseif isActive(arg_76_0.rtInvitePanel) then
		arg_76_0:HideInvitePanel()
	elseif isActive(arg_76_0.rtIconTip) then
		arg_76_0:HideIconTipWindow()
	else
		var_0_0.super.onBackPressed(arg_76_0)
	end
end

function var_0_0.willExit(arg_77_0)
	if isActive(arg_77_0.rtMgrPanel) then
		arg_77_0:HideMgrPanel()
	end

	if isActive(arg_77_0.rtSelectPanel) then
		arg_77_0:HideSelectPanel()
	end

	if isActive(arg_77_0.rtInvitePanel) then
		arg_77_0:HideInvitePanel()
	end

	if isActive(arg_77_0.rtIconTip) then
		arg_77_0:HideIconTipWindow()
	end
end

return var_0_0
