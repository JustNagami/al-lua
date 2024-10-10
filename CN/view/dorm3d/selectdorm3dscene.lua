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
		arg_2_0.clearSceneCache = true

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
	arg_2_0.rtMgrPanel = arg_2_0.rtLayer:Find("mgr_panel")

	onButton(arg_2_0, arg_2_0.rtMgrPanel:Find("bg"), function()
		arg_2_0:HideMgrPanel()
	end, SFX_CANCEL)
	setText(arg_2_0.rtMgrPanel:Find("window/title/Text"), i18n("dorm3d_role_manage"))

	arg_2_0.rtMgrChar = arg_2_0.rtMgrPanel:Find("window/character")

	setText(arg_2_0.rtMgrChar:Find("title"), i18n("dorm3d_role_manage_role"))

	local var_2_0 = arg_2_0.rtMgrChar:Find("container")

	arg_2_0.charRoomCardItemList = UIItemList.New(var_2_0, var_2_0:Find("tpl"))

	arg_2_0.charRoomCardItemList:make(function(arg_8_0, arg_8_1, arg_8_2)
		arg_8_1 = arg_8_1 + 1

		if arg_8_0 == UIItemList.EventUpdate then
			local var_8_0 = arg_2_0.filterCharRoomIds[arg_8_1]

			setActive(arg_8_2:Find("base"), var_8_0)
			setActive(arg_8_2:Find("empty"), not var_8_0)

			if not var_8_0 then
				arg_8_2.name = "null"

				setText(arg_8_2:Find("empty/Text"), i18n("dorm3d_waiting"))
			else
				arg_8_2.name = tostring(var_8_0)
				arg_2_0.cardDic[var_8_0] = arg_8_2:Find("base")

				arg_2_0:InitCardTrigger(var_8_0)
				arg_2_0:UpdateCardState(var_8_0)

				return
			end
		end
	end)

	arg_2_0.rtMgrPublic = arg_2_0.rtMgrPanel:Find("window/public")

	setText(arg_2_0.rtMgrPublic:Find("title"), i18n("dorm3d_role_manage_public_area"))

	local var_2_1 = arg_2_0.rtMgrPublic:Find("container")

	arg_2_0.publicRoomCardItemList = UIItemList.New(var_2_1, var_2_1:Find("tpl"))

	arg_2_0.publicRoomCardItemList:make(function(arg_9_0, arg_9_1, arg_9_2)
		arg_9_1 = arg_9_1 + 1

		if arg_9_0 == UIItemList.EventUpdate then
			local var_9_0 = arg_2_0.filterPublicRoomIds[arg_9_1]

			arg_2_0.cardDic[var_9_0] = arg_9_2

			arg_2_0:InitCardTrigger(var_9_0)
			arg_2_0:UpdateCardState(var_9_0)
		end
	end)
end

function var_0_0.didEnter(arg_10_0)
	arg_10_0.contextData.floorName = arg_10_0.contextData.floorName or "floor_1"

	arg_10_0:SetFloor(arg_10_0.contextData.floorName)
	arg_10_0:UpdateStamina()
	arg_10_0:CheckGuide("DORM3D_GUIDE_02")
end

function var_0_0.UpdateStamina(arg_11_0)
	setText(arg_11_0.rtStamina:Find("Text"), string.format("%d/%d", getProxy(ApartmentProxy):getStamina()))
end

function var_0_0.SetFloor(arg_12_0, arg_12_1)
	local var_12_0

	eachChild(arg_12_0.rtMap, function(arg_13_0)
		setActive(arg_13_0, arg_13_0.name == arg_12_1)

		if arg_13_0.name == arg_12_1 then
			var_12_0 = arg_13_0
		end
	end)
	assert(var_12_0)

	arg_12_0.roomDic = {}

	for iter_12_0, iter_12_1 in ipairs(pg.dorm3d_rooms.get_id_list_by_in_map[arg_12_1]) do
		arg_12_0.roomDic[iter_12_1] = var_12_0:Find(pg.dorm3d_rooms[iter_12_1].assets_prefix)

		arg_12_0:InitIconTrigger(iter_12_1)
		arg_12_0:UpdateIconState(iter_12_1)
	end

	arg_12_0:ReplaceSpecialRoomIcon()
end

function var_0_0.InitIconTrigger(arg_14_0, arg_14_1)
	local var_14_0 = arg_14_0.roomDic[arg_14_1]
	local var_14_1 = pg.dorm3d_rooms[arg_14_1].assets_prefix

	GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/room_icon_%s", string.lower(var_14_1)), "", var_14_0:Find("icon"))
	onButton(arg_14_0, var_14_0, function()
		if BLOCK_DORM3D_ROOMS and table.contains(BLOCK_DORM3D_ROOMS, arg_14_1) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_system_switch"))

			return
		end

		local var_15_0 = getProxy(ApartmentProxy):getRoom(arg_14_1)
		local var_15_1 = pg.dorm3d_rooms[arg_14_1].type

		if var_15_1 == 1 then
			if not var_15_0 then
				arg_14_0:emit(SelectDorm3DMediator.OPEN_ROOM_UNLOCK_WINDOW, arg_14_1)
			else
				arg_14_0:TryDownloadResource({
					click = true,
					roomId = arg_14_1
				}, function()
					local var_16_0 = underscore.map(string.split(PlayerPrefs.GetString(string.format("room%d_invite_list", arg_14_1), ""), "|"), function(arg_17_0)
						return tonumber(arg_17_0)
					end)

					if arg_14_0:CheckGuide("DORM3D_GUIDE_06") then
						var_16_0 = {}
					end

					arg_14_0:emit(SelectDorm3DMediator.OPEN_INVITE_LAYER, arg_14_1, var_16_0)
				end)
			end
		elseif var_15_1 == 2 then
			if not var_15_0 then
				arg_14_0:ShowIconTipWindow(arg_14_1, var_14_0)
			else
				arg_14_0:TryDownloadResource({
					click = true,
					roomId = arg_14_1
				}, function()
					arg_14_0:emit(SelectDorm3DMediator.ON_DORM, {
						roomId = var_15_0.id,
						groupIds = var_15_0:getInviteList()
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
			local var_22_1 = var_19_1:isPersonalRoom()

			setActive(var_22_0, var_22_1)

			if var_22_1 then
				local var_22_2 = getProxy(ApartmentProxy):getApartment(var_19_1:getPersonalGroupId())
				local var_22_3 = var_22_2:getIconTip(var_19_1:GetConfigID())

				eachChild(var_22_0:Find("tip"), function(arg_23_0)
					setActive(arg_23_0, arg_23_0.name == var_22_3)
				end)
				setText(var_22_0:Find("favor/Text"), var_22_2.level)
			end
		end
	})
end

function var_0_0.UpdateShowIcon(arg_24_0, arg_24_1, arg_24_2)
	removeOnButton(arg_24_2)
	setActive(arg_24_2:Find("icon/mask"), false)
	eachChild(arg_24_2:Find("front"), function(arg_25_0)
		setActive(arg_25_0, false)
	end)
end

function var_0_0.ReplaceSpecialRoomIcon(arg_26_0)
	local var_26_0 = {}

	for iter_26_0, iter_26_1 in pairs(getProxy(ApartmentProxy):getRawData()) do
		for iter_26_2, iter_26_3 in ipairs(iter_26_1:getSpecialTalking()) do
			local var_26_1 = pg.dorm3d_dialogue_group[iter_26_3].trigger_config[1]

			var_26_0[var_26_1] = var_26_0[var_26_1] or {}

			table.insert(var_26_0[var_26_1], iter_26_3)
		end
	end

	for iter_26_4, iter_26_5 in pairs(var_26_0) do
		setActive(arg_26_0.roomDic[iter_26_4], false)

		local var_26_2 = cloneTplTo(arg_26_0.roomDic[iter_26_4], arg_26_0.roomDic[iter_26_4].parent, arg_26_0.roomDic[iter_26_4].name .. "_special")

		arg_26_0:UpdateShowIcon(iter_26_4, var_26_2)
		GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/room_icon_%s", string.lower(pg.dorm3d_rooms[iter_26_4].assets_prefix)), "", var_26_2:Find("icon"))
		setActive(var_26_2:Find("front/complete"), true)
		setActive(var_26_2:Find("front/complete/favor"), false)
		eachChild(var_26_2:Find("front/complete/tip"), function(arg_27_0)
			setActive(arg_27_0, arg_27_0.name == "main")
		end)
		table.sort(iter_26_5)

		local var_26_3 = iter_26_5[1]
		local var_26_4 = pg.dorm3d_dialogue_group[var_26_3]

		onButton(arg_26_0, var_26_2, function()
			arg_26_0:TryDownloadResource({
				click = true,
				roomId = var_26_4.room_id
			}, function()
				arg_26_0:emit(SelectDorm3DMediator.ON_DORM, {
					roomId = var_26_4.room_id,
					groupIds = {
						var_26_4.char_id
					},
					specialId = var_26_3
				})
			end)
		end, SFX_PANEL)
	end
end

function var_0_0.InitCardTrigger(arg_30_0, arg_30_1)
	local var_30_0 = getProxy(ApartmentProxy):getRoom(arg_30_1)

	assert(var_30_0)

	local var_30_1 = arg_30_0.cardDic[arg_30_1]
	local var_30_2 = var_30_0:getConfig("assets_prefix")

	if var_30_0:isPersonalRoom() then
		local var_30_3 = var_30_0:getPersonalGroupId()

		GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/room_card_apartment_%d", var_30_3), "", var_30_1:Find("Image"))
		GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/room_card_apartment_name_%d", var_30_3), "", var_30_1:Find("name"))
		onButton(arg_30_0, var_30_1, function()
			arg_30_0:TryDownloadResource({
				click = true,
				roomId = arg_30_1
			}, function()
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("dorm3d_role_assets_delete", ShipGroup.getDefaultShipNameByGroupID(var_30_3)),
					onYes = function()
						if IsUnityEditor then
							pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_open"))

							return
						end

						local var_33_0 = var_30_0:getConfig("resource_name")

						DormGroupConst.DelDir("dorm3d/character/" .. string.lower(var_33_0))
						pg.TipsMgr.GetInstance():ShowTips("delete finish !")
					end
				})
			end)
		end, SFX_PANEL)
	else
		GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/room_card_%s", string.lower(var_30_2)), "", var_30_1:Find("Image"))
		removeOnButton(var_30_1)
	end
end

function var_0_0.UpdateCardState(arg_34_0, arg_34_1)
	local var_34_0 = getProxy(ApartmentProxy):getRoom(arg_34_1)
	local var_34_1 = arg_34_0.cardDic[arg_34_1]
	local var_34_2 = var_34_0:getState()

	if var_34_0:isPersonalRoom() then
		setActive(var_34_1:Find("lock"), var_34_2 ~= "complete")
		setActive(var_34_1:Find("unlock"), var_34_2 == "complete")

		local var_34_3 = getProxy(ApartmentProxy):getApartment(var_34_0:getPersonalGroupId())

		setText(var_34_1:Find("favor_level/Text"), var_34_3 and var_34_3.level or "?")
	end

	local var_34_4 = var_34_1:Find("operation")

	eachChild(var_34_4, function(arg_35_0)
		setActive(arg_35_0, arg_35_0.name == var_34_2)
	end)
	setImageAlpha(var_34_4:Find("complete"), var_34_0:isPersonalRoom() and 1 or 0)

	if DormGroupConst.DormDownloadLock and DormGroupConst.DormDownloadLock.roomId == arg_34_1 then
		arg_34_0:UpdateCardProgess()
	end

	setActive(var_34_1:Find("mask"), var_34_2 ~= "complete")
end

function var_0_0.UpdateCardProgess(arg_36_0)
	local var_36_0 = DormGroupConst.DormDownloadLock
	local var_36_1 = arg_36_0.cardDic[var_36_0.roomId]

	setSlider(var_36_1:Find("operation/loading"), 0, var_36_0.totalSize, var_36_0.curSize)
end

function var_0_0.UpdateSelectableCard(arg_37_0, arg_37_1, arg_37_2, arg_37_3)
	GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/room_card_apartment_%d", arg_37_2), "", arg_37_1:Find("Image"))
	GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/room_card_apartment_name_%d", arg_37_2), "", arg_37_1:Find("name"))

	local var_37_0 = getProxy(ApartmentProxy):getApartment(arg_37_2)
	local var_37_1 = not var_37_0 or var_37_0:needDownload()

	setActive(arg_37_1:Find("lock"), var_37_1)
	setActive(arg_37_1:Find("mask"), var_37_1)
	setActive(arg_37_1:Find("unlock"), not var_37_1)
	setActive(arg_37_1:Find("favor_level"), var_37_0)

	if var_37_0 then
		setText(arg_37_1:Find("favor_level/Text"), var_37_0.level)
	end

	onToggle(arg_37_0, arg_37_1, function(arg_38_0)
		arg_37_3(arg_38_0)

		if arg_38_0 then
			if not var_37_0 then
				pg.TipsMgr.GetInstance():ShowTips(string.format("need unlock apartment{%d}", arg_37_2))
				triggerToggle(arg_37_1, false)
			elseif var_37_0:needDownload() then
				pg.TipsMgr.GetInstance():ShowTips(string.format("need download resource{%d}", arg_37_2))
				triggerToggle(arg_37_1, false)
			end
		end
	end, SFX_UI_CLICK)
end

function var_0_0.DownloadUpdate(arg_39_0, arg_39_1, arg_39_2)
	switch(arg_39_2, {
		start = function()
			if arg_39_0.roomDic[arg_39_1] then
				arg_39_0:UpdateIconState(arg_39_1)
			end

			if arg_39_0.cardDic and arg_39_0.cardDic[arg_39_1] then
				arg_39_0:UpdateCardState(arg_39_1)
			end
		end,
		loading = function()
			if arg_39_0.roomDic[arg_39_1] then
				local var_41_0 = DormGroupConst.DormDownloadLock

				setSlider(arg_39_0.roomDic[arg_39_1]:Find("front/loading/progress"), 0, var_41_0.totalSize, var_41_0.curSize)
			end

			if arg_39_0.cardDic and arg_39_0.cardDic[arg_39_1] then
				arg_39_0:UpdateCardProgess()
			end
		end,
		finish = function()
			for iter_42_0, iter_42_1 in pairs(arg_39_0.roomDic) do
				if iter_42_0 == arg_39_1 or pg.dorm3d_rooms[iter_42_0].type == 1 then
					arg_39_0:UpdateIconState(iter_42_0)
				end
			end

			if arg_39_0.cardDic then
				for iter_42_2, iter_42_3 in pairs(arg_39_0.cardDic) do
					if iter_42_2 == arg_39_1 or pg.dorm3d_rooms[iter_42_2].type == 1 then
						arg_39_0:UpdateCardState(iter_42_2)
					end
				end
			else
				arg_39_0:CheckGuide("DORM3D_GUIDE_02")
			end
		end
	})
end

function var_0_0.AfterRoomUnlock(arg_43_0, arg_43_1)
	local var_43_0 = arg_43_1.roomId

	if isActive(arg_43_0.rtIconTip) then
		arg_43_0:HideIconTipWindow()
	end

	eachChild(arg_43_0.roomDic[var_43_0]:Find("icon/mask"), function(arg_44_0)
		setActive(arg_44_0, true)
	end)
	quickPlayAnimation(arg_43_0.roomDic[var_43_0], "anim_Dorm3d_selectDorm_icon_unlock")
	pg.UIMgr.GetInstance():LoadingOn(false)
	LeanTween.delayedCall(1.2333333333333334, System.Action(function()
		pg.UIMgr.GetInstance():LoadingOff(false)
		arg_43_0:UpdateIconState(var_43_0)
		arg_43_0:TryDownloadResource(arg_43_1)
		arg_43_0:CheckGuide("DORM3D_GUIDE_02")
	end))
end

function var_0_0.ShowIconTipWindow(arg_46_0, arg_46_1, arg_46_2)
	setLocalPosition(arg_46_0.rtIconTip:Find("window"), arg_46_0.rtIconTip:InverseTransformPoint(arg_46_2.position))
	removeAllChildren(arg_46_0.rtIconTip:Find("window/icon"))

	arg_46_2 = cloneTplTo(arg_46_2, arg_46_0.rtIconTip:Find("window/icon"))

	arg_46_0:UpdateShowIcon(arg_46_1, arg_46_2)
	setAnchoredPosition(arg_46_2, Vector2.zero)

	local var_46_0 = ApartmentRoom.New({
		id = arg_46_1
	})
	local var_46_1, var_46_2 = var_46_0:getDownloadNeedSize()

	setText(arg_46_0.rtIconTip:Find("window/Text"), i18n("dorm3d_role_assets_download", ShipGroup.getDefaultShipNameByGroupID(var_46_0:getPersonalGroupId()), var_46_0:needDownload() and var_46_2 or "0B"))
	onButton(arg_46_0, arg_46_0.rtIconTip:Find("window/btn_confirm"), function()
		arg_46_0:emit(SelectDorm3DMediator.ON_UNLOCK_DORM_ROOM, arg_46_1)
	end, SFX_CONFIRM)
	setActive(arg_46_0.rtIconTip, true)
end

function var_0_0.HideIconTipWindow(arg_48_0)
	setActive(arg_48_0.rtIconTip, false)
end

function var_0_0.ShowMgrPanel(arg_49_0)
	arg_49_0.cardDic = {}
	arg_49_0.filterCharRoomIds = {}
	arg_49_0.filterPublicRoomIds = {}

	for iter_49_0, iter_49_1 in ipairs(underscore.filter(pg.dorm3d_rooms.all, function(arg_50_0)
		return tobool(getProxy(ApartmentProxy):getRoom(arg_50_0))
	end)) do
		local var_49_0 = pg.dorm3d_rooms[iter_49_1].type

		if var_49_0 == 1 then
			table.insert(arg_49_0.filterPublicRoomIds, iter_49_1)
		elseif var_49_0 == 2 then
			table.insert(arg_49_0.filterCharRoomIds, iter_49_1)
		else
			assert(false)
		end
	end

	arg_49_0.charRoomCardItemList:align(#arg_49_0.filterCharRoomIds)
	arg_49_0.publicRoomCardItemList:align(#arg_49_0.filterPublicRoomIds)
	pg.UIMgr.GetInstance():OverlayPanelPB(arg_49_0.rtMgrPanel, {
		force = true,
		pbList = {
			arg_49_0.rtMgrPanel:Find("window")
		}
	})
	setActive(arg_49_0.rtMgrPanel, true)
end

function var_0_0.HideMgrPanel(arg_51_0)
	arg_51_0.cardDic = nil

	pg.UIMgr.GetInstance():UnblurPanel(arg_51_0.rtMgrPanel, arg_51_0.rtLayer)
	setActive(arg_51_0.rtMgrPanel, false)
end

function var_0_0.TryDownloadResource(arg_52_0, arg_52_1, arg_52_2)
	if DormGroupConst.IsDownloading() then
		pg.TipsMgr.GetInstance():ShowTips("now is downloading")

		return
	end

	local var_52_0 = getProxy(ApartmentProxy):getRoom(arg_52_1.roomId)
	local var_52_1, var_52_2 = var_52_0:getDownloadNameList()

	if #var_52_1 > 0 or #var_52_2 > 0 then
		local var_52_3 = {
			isShowBox = true,
			fileList = table.mergeArray(var_52_1, var_52_2),
			finishFunc = function(arg_53_0)
				if arg_53_0 then
					pg.TipsMgr.GetInstance():ShowTips("dorm resource download complete !")
				end

				if arg_52_0.exited then
					return
				end

				if arg_52_0.roomDic[var_52_0.configId] then
					arg_52_0:UpdateIconState(var_52_0.configId)
				end
			end,
			roomId = var_52_0.configId
		}

		DormGroupConst.DormDownload(var_52_3)
	else
		existCall(arg_52_2)
	end
end

function var_0_0.InitResBar(arg_54_0)
	arg_54_0.goldMax = arg_54_0.rtRes:Find("gold/max"):GetComponent(typeof(Text))
	arg_54_0.goldValue = arg_54_0.rtRes:Find("gold/Text"):GetComponent(typeof(Text))
	arg_54_0.oilMax = arg_54_0.rtRes:Find("oil/max"):GetComponent(typeof(Text))
	arg_54_0.oilValue = arg_54_0.rtRes:Find("oil/Text"):GetComponent(typeof(Text))
	arg_54_0.gemValue = arg_54_0.rtRes:Find("gem/Text"):GetComponent(typeof(Text))

	onButton(arg_54_0, arg_54_0.rtRes:Find("gold"), function()
		warning("debug test")
		pg.playerResUI:ClickGold()
	end, SFX_PANEL)
	onButton(arg_54_0, arg_54_0.rtRes:Find("oil"), function()
		pg.playerResUI:ClickOil()
	end, SFX_PANEL)
	onButton(arg_54_0, arg_54_0.rtRes:Find("gem"), function()
		pg.playerResUI:ClickGem()
	end, SFX_PANEL)
	arg_54_0:UpdateRes()
end

function var_0_0.UpdateRes(arg_58_0)
	local var_58_0 = getProxy(PlayerProxy):getRawData()

	PlayerResUI.StaticFlush(var_58_0, arg_58_0.goldMax, arg_58_0.goldValue, arg_58_0.oilMax, arg_58_0.oilValue, arg_58_0.gemValue)
end

function var_0_0.UpdateWeekTask(arg_59_0)
	local var_59_0 = getDorm3dGameset("drom3d_weekly_task")[1]
	local var_59_1 = getProxy(TaskProxy):getTaskVO(var_59_0)
	local var_59_2 = var_59_1:isReceive()
	local var_59_3 = var_59_2 and 3 or var_59_1:getProgress()
	local var_59_4 = arg_59_0.rtWeekTask:Find("content")

	for iter_59_0 = 1, 3 do
		triggerToggle(var_59_4:Find("tpl_" .. iter_59_0), iter_59_0 <= var_59_3)
	end

	local var_59_5 = Drop.Create(var_59_1:getConfig("award_display")[1])

	updateDorm3dIcon(var_59_4:Find("Dorm3dIconTpl"), var_59_5)
	onButton(arg_59_0, var_59_4:Find("Dorm3dIconTpl"), function()
		if not var_59_2 and var_59_1:isFinish() then
			arg_59_0:emit(SelectDorm3DMediator.ON_SUBMIT_TASK, var_59_0)
		else
			arg_59_0:emit(BaseUI.ON_NEW_DROP, {
				drop = var_59_5
			})
		end
	end, SFX_CONFIRM)
	setActive(var_59_4:Find("Dorm3dIconTpl/get"), not var_59_2 and var_59_1:isFinish())
	setGray(var_59_4:Find("Dorm3dIconTpl"), var_59_2)
	onButton(arg_59_0, arg_59_0._tf:Find("Main/task_done"), function()
		setActive(arg_59_0.rtWeekTask, true)
		setActive(arg_59_0._tf:Find("Main/task_done"), false)
	end)
	onButton(arg_59_0, arg_59_0.rtWeekTask:Find("title"), function()
		if var_59_2 then
			setActive(arg_59_0.rtWeekTask, false)
			setActive(arg_59_0._tf:Find("Main/task_done"), true)
		end
	end)
end

function var_0_0.CheckGuide(arg_63_0, arg_63_1)
	if pg.NewStoryMgr.GetInstance():IsPlayed(arg_63_1) then
		return
	end

	return switch(arg_63_1, {
		DORM3D_GUIDE_02 = function()
			local var_64_0 = getProxy(ApartmentProxy):getApartment(20220)

			if var_64_0 and not var_64_0:needDownload() then
				pg.m02:sendNotification(GAME.STORY_UPDATE, {
					storyId = arg_63_1
				})
				pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGuide(1, pg.NewStoryMgr.GetInstance():StoryName2StoryId(arg_63_1)))
				pg.NewGuideMgr.GetInstance():Play(arg_63_1, nil, function()
					pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGuide(2, pg.NewStoryMgr.GetInstance():StoryName2StoryId(arg_63_1)))
				end)

				return true
			end
		end,
		DORM3D_GUIDE_06 = function()
			pg.m02:sendNotification(GAME.STORY_UPDATE, {
				storyId = arg_63_1
			})
			pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGuide(1, pg.NewStoryMgr.GetInstance():StoryName2StoryId(arg_63_1)))
			pg.NewGuideMgr.GetInstance():Play(arg_63_1, nil, function()
				pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGuide(2, pg.NewStoryMgr.GetInstance():StoryName2StoryId(arg_63_1)))
			end)

			return true
		end
	}, function()
		return false
	end)
end

function var_0_0.onBackPressed(arg_69_0)
	if isActive(arg_69_0.rtMgrPanel) then
		arg_69_0:HideMgrPanel()
	elseif isActive(arg_69_0.rtIconTip) then
		arg_69_0:HideIconTipWindow()
	else
		var_0_0.super.onBackPressed(arg_69_0)
	end
end

function var_0_0.willExit(arg_70_0)
	if isActive(arg_70_0.rtMgrPanel) then
		arg_70_0:HideMgrPanel()
	end

	if isActive(arg_70_0.rtIconTip) then
		arg_70_0:HideIconTipWindow()
	end

	if arg_70_0.clearSceneCache then
		BLHX.Rendering.EngineCore.TryDispose(true)

		local var_70_0 = typeof("BLHX.Rendering.Executor")
		local var_70_1 = ReflectionHelp.RefGetProperty(var_70_0, "Instance", nil)

		ReflectionHelp.RefCallMethod(var_70_0, "TryHandleWaitLinkList", var_70_1)
	end
end

return var_0_0
