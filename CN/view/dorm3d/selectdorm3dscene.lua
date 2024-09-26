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
	setText(arg_10_0.rtStamina:Find("Text"), string.format("%d/%d", getProxy(ApartmentProxy):getStamina()))
	arg_10_0:CheckGuide("DORM3D_GUIDE_02")
end

function var_0_0.SetFloor(arg_11_0, arg_11_1)
	local var_11_0

	eachChild(arg_11_0.rtMap, function(arg_12_0)
		setActive(arg_12_0, arg_12_0.name == arg_11_1)

		if arg_12_0.name == arg_11_1 then
			var_11_0 = arg_12_0
		end
	end)
	assert(var_11_0)

	arg_11_0.roomDic = {}

	for iter_11_0, iter_11_1 in ipairs(pg.dorm3d_rooms.get_id_list_by_in_map[arg_11_1]) do
		arg_11_0.roomDic[iter_11_1] = var_11_0:Find(pg.dorm3d_rooms[iter_11_1].assets_prefix)

		arg_11_0:InitIconTrigger(iter_11_1)
		arg_11_0:UpdateIconState(iter_11_1)
	end

	arg_11_0:ReplaceSpecialRoomIcon()
end

function var_0_0.InitIconTrigger(arg_13_0, arg_13_1)
	local var_13_0 = arg_13_0.roomDic[arg_13_1]
	local var_13_1 = pg.dorm3d_rooms[arg_13_1].assets_prefix

	GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/room_icon_%s", string.lower(var_13_1)), "", var_13_0:Find("icon"))
	onButton(arg_13_0, var_13_0, function()
		if BLOCK_DORM3D_ROOMS and table.contains(BLOCK_DORM3D_ROOMS, arg_13_1) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_system_switch"))

			return
		end

		local var_14_0 = getProxy(ApartmentProxy):getRoom(arg_13_1)
		local var_14_1 = pg.dorm3d_rooms[arg_13_1].type

		if var_14_1 == 1 then
			if not var_14_0 then
				arg_13_0:emit(SelectDorm3DMediator.OPEN_ROOM_UNLOCK_WINDOW, arg_13_1)
			else
				arg_13_0:TryDownloadResource({
					click = true,
					roomId = arg_13_1
				}, function()
					local var_15_0 = underscore.map(string.split(PlayerPrefs.GetString(string.format("room%d_invite_list", arg_13_1), ""), "|"), function(arg_16_0)
						return tonumber(arg_16_0)
					end)

					if arg_13_0:CheckGuide("DORM3D_GUIDE_06") then
						var_15_0 = {}
					end

					arg_13_0:emit(SelectDorm3DMediator.OPEN_INVITE_LAYER, arg_13_1, var_15_0)
				end)
			end
		elseif var_14_1 == 2 then
			if not var_14_0 then
				arg_13_0:ShowIconTipWindow(arg_13_1, var_13_0)
			else
				arg_13_0:TryDownloadResource({
					click = true,
					roomId = arg_13_1
				}, function()
					arg_13_0:emit(SelectDorm3DMediator.ON_DORM, {
						roomId = var_14_0.id,
						groupIds = var_14_0:getInviteList()
					})
				end)
			end
		else
			assert(false)
		end
	end, SFX_PANEL)
end

function var_0_0.UpdateIconState(arg_18_0, arg_18_1)
	local var_18_0 = arg_18_0.roomDic[arg_18_1]
	local var_18_1 = getProxy(ApartmentProxy):getRoom(arg_18_1)
	local var_18_2 = var_18_1 and var_18_1:getState() or "lock"

	setActive(var_18_0:Find("icon/mask"), var_18_2 ~= "complete")
	eachChild(var_18_0:Find("front"), function(arg_19_0)
		setActive(arg_19_0, arg_19_0.name == var_18_2)
	end)
	switch(var_18_2, {
		loading = function()
			local var_20_0 = DormGroupConst.DormDownloadLock

			setSlider(var_18_0:Find("front/loading/progress"), 0, var_20_0.totalSize, var_20_0.curSize)
		end,
		complete = function()
			local var_21_0 = var_18_0:Find("front/complete")
			local var_21_1 = var_18_1:isPersonalRoom()

			setActive(var_21_0, var_21_1)

			if var_21_1 then
				local var_21_2 = getProxy(ApartmentProxy):getApartment(var_18_1:getPersonalGroupId())
				local var_21_3 = var_21_2:getIconTip(var_18_1:GetConfigID())

				eachChild(var_21_0:Find("tip"), function(arg_22_0)
					setActive(arg_22_0, arg_22_0.name == var_21_3)
				end)
				setText(var_21_0:Find("favor/Text"), var_21_2.level)
			end
		end
	})
end

function var_0_0.UpdateShowIcon(arg_23_0, arg_23_1, arg_23_2)
	removeOnButton(arg_23_2)
	setActive(arg_23_2:Find("icon/mask"), false)
	eachChild(arg_23_2:Find("front"), function(arg_24_0)
		setActive(arg_24_0, false)
	end)
end

function var_0_0.ReplaceSpecialRoomIcon(arg_25_0)
	local var_25_0 = {}

	for iter_25_0, iter_25_1 in pairs(getProxy(ApartmentProxy):getRawData()) do
		for iter_25_2, iter_25_3 in ipairs(iter_25_1:getSpecialTalking()) do
			local var_25_1 = pg.dorm3d_dialogue_group[iter_25_3].trigger_config[1]

			var_25_0[var_25_1] = var_25_0[var_25_1] or {}

			table.insert(var_25_0[var_25_1], iter_25_3)
		end
	end

	for iter_25_4, iter_25_5 in pairs(var_25_0) do
		setActive(arg_25_0.roomDic[iter_25_4], false)

		local var_25_2 = cloneTplTo(arg_25_0.roomDic[iter_25_4], arg_25_0.roomDic[iter_25_4].parent, arg_25_0.roomDic[iter_25_4].name .. "_special")

		arg_25_0:UpdateShowIcon(iter_25_4, var_25_2)
		GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/room_icon_%s", string.lower(pg.dorm3d_rooms[iter_25_4].assets_prefix)), "", var_25_2:Find("icon"))
		setActive(var_25_2:Find("front/complete"), true)
		setActive(var_25_2:Find("front/complete/favor"), false)
		eachChild(var_25_2:Find("front/complete/tip"), function(arg_26_0)
			setActive(arg_26_0, arg_26_0.name == "main")
		end)
		table.sort(iter_25_5)

		local var_25_3 = iter_25_5[1]
		local var_25_4 = pg.dorm3d_dialogue_group[var_25_3]

		onButton(arg_25_0, var_25_2, function()
			arg_25_0:TryDownloadResource({
				click = true,
				roomId = var_25_4.room_id
			}, function()
				arg_25_0:emit(SelectDorm3DMediator.ON_DORM, {
					roomId = var_25_4.room_id,
					groupIds = {
						var_25_4.char_id
					},
					specialId = var_25_3
				})
			end)
		end, SFX_PANEL)
	end
end

function var_0_0.InitCardTrigger(arg_29_0, arg_29_1)
	local var_29_0 = getProxy(ApartmentProxy):getRoom(arg_29_1)

	assert(var_29_0)

	local var_29_1 = arg_29_0.cardDic[arg_29_1]
	local var_29_2 = var_29_0:getConfig("assets_prefix")

	if var_29_0:isPersonalRoom() then
		local var_29_3 = var_29_0:getPersonalGroupId()

		GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/room_card_apartment_%d", var_29_3), "", var_29_1:Find("Image"))
		GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/room_card_apartment_name_%d", var_29_3), "", var_29_1:Find("name"))
		onButton(arg_29_0, var_29_1, function()
			arg_29_0:TryDownloadResource({
				click = true,
				roomId = arg_29_1
			}, function()
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("dorm3d_role_assets_delete", ShipGroup.getDefaultShipNameByGroupID(var_29_3)),
					onYes = function()
						if IsUnityEditor then
							pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_open"))

							return
						end

						local var_32_0 = getProxy(ApartmentProxy):getApartment(var_29_0:getPersonalGroupId()):getConfig("resource_name")

						DormGroupConst.DelDir("dorm3d/character/" .. string.lower(var_32_0))
						pg.TipsMgr.GetInstance():ShowTips("delete finish !")
					end
				})
			end)
		end, SFX_PANEL)
	else
		GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/room_card_%s", string.lower(var_29_2)), "", var_29_1:Find("Image"))
		removeOnButton(var_29_1)
	end
end

function var_0_0.UpdateCardState(arg_33_0, arg_33_1)
	local var_33_0 = getProxy(ApartmentProxy):getRoom(arg_33_1)
	local var_33_1 = arg_33_0.cardDic[arg_33_1]
	local var_33_2 = var_33_0:getState()

	if var_33_0:isPersonalRoom() then
		setActive(var_33_1:Find("lock"), var_33_2 ~= "complete")
		setActive(var_33_1:Find("unlock"), var_33_2 == "complete")

		local var_33_3 = getProxy(ApartmentProxy):getApartment(var_33_0:getPersonalGroupId())

		setText(var_33_1:Find("favor_level/Text"), var_33_3 and var_33_3.level or "?")
	end

	local var_33_4 = var_33_1:Find("operation")

	eachChild(var_33_4, function(arg_34_0)
		setActive(arg_34_0, arg_34_0.name == var_33_2)
	end)
	setImageAlpha(var_33_4:Find("complete"), var_33_0:isPersonalRoom() and 1 or 0)

	if DormGroupConst.DormDownloadLock and DormGroupConst.DormDownloadLock.roomId == arg_33_1 then
		arg_33_0:UpdateCardProgess()
	end

	setActive(var_33_1:Find("mask"), var_33_2 ~= "complete")
end

function var_0_0.UpdateCardProgess(arg_35_0)
	local var_35_0 = DormGroupConst.DormDownloadLock
	local var_35_1 = arg_35_0.cardDic[var_35_0.roomId]

	setSlider(var_35_1:Find("operation/loading"), 0, var_35_0.totalSize, var_35_0.curSize)
end

function var_0_0.UpdateSelectableCard(arg_36_0, arg_36_1, arg_36_2, arg_36_3)
	GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/room_card_apartment_%d", arg_36_2), "", arg_36_1:Find("Image"))
	GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/room_card_apartment_name_%d", arg_36_2), "", arg_36_1:Find("name"))

	local var_36_0 = getProxy(ApartmentProxy):getApartment(arg_36_2)
	local var_36_1 = not var_36_0 or var_36_0:needDownload()

	setActive(arg_36_1:Find("lock"), var_36_1)
	setActive(arg_36_1:Find("mask"), var_36_1)
	setActive(arg_36_1:Find("unlock"), not var_36_1)
	setActive(arg_36_1:Find("favor_level"), var_36_0)

	if var_36_0 then
		setText(arg_36_1:Find("favor_level/Text"), var_36_0.level)
	end

	onToggle(arg_36_0, arg_36_1, function(arg_37_0)
		arg_36_3(arg_37_0)

		if arg_37_0 then
			if not var_36_0 then
				pg.TipsMgr.GetInstance():ShowTips(string.format("need unlock apartment{%d}", arg_36_2))
				triggerToggle(arg_36_1, false)
			elseif var_36_0:needDownload() then
				pg.TipsMgr.GetInstance():ShowTips(string.format("need download resource{%d}", arg_36_2))
				triggerToggle(arg_36_1, false)
			end
		end
	end, SFX_UI_CLICK)
end

function var_0_0.DownloadUpdate(arg_38_0, arg_38_1, arg_38_2)
	switch(arg_38_2, {
		start = function()
			if arg_38_0.roomDic[arg_38_1] then
				arg_38_0:UpdateIconState(arg_38_1)
			end

			if arg_38_0.cardDic and arg_38_0.cardDic[arg_38_1] then
				arg_38_0:UpdateCardState(arg_38_1)
			end
		end,
		loading = function()
			if arg_38_0.roomDic[arg_38_1] then
				local var_40_0 = DormGroupConst.DormDownloadLock

				setSlider(arg_38_0.roomDic[arg_38_1]:Find("front/loading/progress"), 0, var_40_0.totalSize, var_40_0.curSize)
			end

			if arg_38_0.cardDic and arg_38_0.cardDic[arg_38_1] then
				arg_38_0:UpdateCardProgess()
			end
		end,
		finish = function()
			for iter_41_0, iter_41_1 in pairs(arg_38_0.roomDic) do
				if iter_41_0 == arg_38_1 or pg.dorm3d_rooms[iter_41_0].type == 1 then
					arg_38_0:UpdateIconState(iter_41_0)
				end
			end

			if arg_38_0.cardDic then
				for iter_41_2, iter_41_3 in pairs(arg_38_0.cardDic) do
					if iter_41_2 == arg_38_1 or pg.dorm3d_rooms[iter_41_2].type == 1 then
						arg_38_0:UpdateCardState(iter_41_2)
					end
				end
			else
				arg_38_0:CheckGuide("DORM3D_GUIDE_02")
			end
		end
	})
end

function var_0_0.AfterRoomUnlock(arg_42_0, arg_42_1)
	local var_42_0 = arg_42_1.roomId

	if isActive(arg_42_0.rtIconTip) then
		arg_42_0:HideIconTipWindow()
	end

	eachChild(arg_42_0.roomDic[var_42_0]:Find("icon/mask"), function(arg_43_0)
		setActive(arg_43_0, true)
	end)
	quickPlayAnimation(arg_42_0.roomDic[var_42_0], "anim_Dorm3d_selectDorm_icon_unlock")
	pg.UIMgr.GetInstance():LoadingOn(false)
	LeanTween.delayedCall(1.2333333333333334, System.Action(function()
		pg.UIMgr.GetInstance():LoadingOff(false)
		arg_42_0:UpdateIconState(var_42_0)
		arg_42_0:TryDownloadResource(arg_42_1)
		arg_42_0:CheckGuide("DORM3D_GUIDE_02")
	end))
end

function var_0_0.ShowIconTipWindow(arg_45_0, arg_45_1, arg_45_2)
	setLocalPosition(arg_45_0.rtIconTip:Find("window"), arg_45_0.rtIconTip:InverseTransformPoint(arg_45_2.position))
	removeAllChildren(arg_45_0.rtIconTip:Find("window/icon"))

	arg_45_2 = cloneTplTo(arg_45_2, arg_45_0.rtIconTip:Find("window/icon"))

	arg_45_0:UpdateShowIcon(arg_45_1, arg_45_2)
	setAnchoredPosition(arg_45_2, Vector2.zero)

	local var_45_0 = ApartmentRoom.New({
		id = arg_45_1
	})
	local var_45_1, var_45_2 = var_45_0:getDownloadNameList()
	local var_45_3 = table.mergeArray(var_45_1, var_45_2)
	local var_45_4, var_45_5 = DormGroupConst.CalcDormListSize(var_45_3)

	setText(arg_45_0.rtIconTip:Find("window/Text"), i18n("dorm3d_role_assets_download", ShipGroup.getDefaultShipNameByGroupID(var_45_0:getPersonalGroupId()), var_45_5))
	onButton(arg_45_0, arg_45_0.rtIconTip:Find("window/btn_confirm"), function()
		arg_45_0:emit(SelectDorm3DMediator.ON_UNLOCK_DORM_ROOM, arg_45_1)
	end, SFX_CONFIRM)
	setActive(arg_45_0.rtIconTip, true)
end

function var_0_0.HideIconTipWindow(arg_47_0)
	setActive(arg_47_0.rtIconTip, false)
end

function var_0_0.ShowMgrPanel(arg_48_0)
	arg_48_0.cardDic = {}
	arg_48_0.filterCharRoomIds = {}
	arg_48_0.filterPublicRoomIds = {}

	for iter_48_0, iter_48_1 in ipairs(underscore.filter(pg.dorm3d_rooms.all, function(arg_49_0)
		return tobool(getProxy(ApartmentProxy):getRoom(arg_49_0))
	end)) do
		local var_48_0 = pg.dorm3d_rooms[iter_48_1].type

		if var_48_0 == 1 then
			table.insert(arg_48_0.filterPublicRoomIds, iter_48_1)
		elseif var_48_0 == 2 then
			table.insert(arg_48_0.filterCharRoomIds, iter_48_1)
		else
			assert(false)
		end
	end

	arg_48_0.charRoomCardItemList:align(#arg_48_0.filterCharRoomIds)
	arg_48_0.publicRoomCardItemList:align(#arg_48_0.filterPublicRoomIds)
	pg.UIMgr.GetInstance():OverlayPanelPB(arg_48_0.rtMgrPanel, {
		force = true,
		pbList = {
			arg_48_0.rtMgrPanel:Find("window")
		}
	})
	setActive(arg_48_0.rtMgrPanel, true)
end

function var_0_0.HideMgrPanel(arg_50_0)
	arg_50_0.cardDic = nil

	pg.UIMgr.GetInstance():UnblurPanel(arg_50_0.rtMgrPanel, arg_50_0.rtLayer)
	setActive(arg_50_0.rtMgrPanel, false)
end

function var_0_0.TryDownloadResource(arg_51_0, arg_51_1, arg_51_2)
	if DormGroupConst.IsDownloading() then
		pg.TipsMgr.GetInstance():ShowTips("now is downloading")

		return
	end

	local var_51_0 = getProxy(ApartmentProxy):getRoom(arg_51_1.roomId)
	local var_51_1, var_51_2 = var_51_0:getDownloadNameList()

	if #var_51_1 > 0 or #var_51_2 > 0 then
		local var_51_3 = {
			isShowBox = true,
			fileList = table.mergeArray(var_51_1, var_51_2),
			finishFunc = function(arg_52_0)
				if arg_52_0 then
					pg.TipsMgr.GetInstance():ShowTips("dorm resource download complete !")
				end

				if arg_51_0.roomDic[var_51_0.configId] then
					arg_51_0:UpdateIconState(var_51_0.configId)
				end
			end,
			roomId = var_51_0.configId
		}

		DormGroupConst.DormDownload(var_51_3)
	else
		existCall(arg_51_2)
	end
end

function var_0_0.InitResBar(arg_53_0)
	arg_53_0.goldMax = arg_53_0.rtRes:Find("gold/max"):GetComponent(typeof(Text))
	arg_53_0.goldValue = arg_53_0.rtRes:Find("gold/Text"):GetComponent(typeof(Text))
	arg_53_0.oilMax = arg_53_0.rtRes:Find("oil/max"):GetComponent(typeof(Text))
	arg_53_0.oilValue = arg_53_0.rtRes:Find("oil/Text"):GetComponent(typeof(Text))
	arg_53_0.gemValue = arg_53_0.rtRes:Find("gem/Text"):GetComponent(typeof(Text))

	onButton(arg_53_0, arg_53_0.rtRes:Find("gold"), function()
		warning("debug test")
		pg.playerResUI:ClickGold()
	end, SFX_PANEL)
	onButton(arg_53_0, arg_53_0.rtRes:Find("oil"), function()
		pg.playerResUI:ClickOil()
	end, SFX_PANEL)
	onButton(arg_53_0, arg_53_0.rtRes:Find("gem"), function()
		pg.playerResUI:ClickGem()
	end, SFX_PANEL)
	arg_53_0:UpdateRes()
end

function var_0_0.UpdateRes(arg_57_0)
	local var_57_0 = getProxy(PlayerProxy):getRawData()

	PlayerResUI.StaticFlush(var_57_0, arg_57_0.goldMax, arg_57_0.goldValue, arg_57_0.oilMax, arg_57_0.oilValue, arg_57_0.gemValue)
end

function var_0_0.UpdateWeekTask(arg_58_0)
	local var_58_0 = getDorm3dGameset("drom3d_weekly_task")[1]
	local var_58_1 = getProxy(TaskProxy):getTaskVO(var_58_0)
	local var_58_2 = var_58_1:isReceive()
	local var_58_3 = var_58_2 and 3 or var_58_1:getProgress()
	local var_58_4 = arg_58_0.rtWeekTask:Find("content")

	for iter_58_0 = 1, 3 do
		triggerToggle(var_58_4:Find("tpl_" .. iter_58_0), iter_58_0 <= var_58_3)
	end

	local var_58_5 = Drop.Create(var_58_1:getConfig("award_display")[1])

	updateDorm3dIcon(var_58_4:Find("Dorm3dIconTpl"), var_58_5)
	onButton(arg_58_0, var_58_4:Find("Dorm3dIconTpl"), function()
		if not var_58_2 and var_58_1:isFinish() then
			arg_58_0:emit(SelectDorm3DMediator.ON_SUBMIT_TASK, var_58_0)
		else
			arg_58_0:emit(BaseUI.ON_NEW_DROP, {
				drop = var_58_5
			})
		end
	end, SFX_CONFIRM)
	setActive(var_58_4:Find("Dorm3dIconTpl/get"), not var_58_2 and var_58_1:isFinish())
	setGray(var_58_4:Find("Dorm3dIconTpl"), var_58_2)
	onButton(arg_58_0, arg_58_0._tf:Find("Main/task_done"), function()
		setActive(arg_58_0.rtWeekTask, true)
		setActive(arg_58_0._tf:Find("Main/task_done"), false)
	end)
	onButton(arg_58_0, arg_58_0.rtWeekTask:Find("title"), function()
		if var_58_2 then
			setActive(arg_58_0.rtWeekTask, false)
			setActive(arg_58_0._tf:Find("Main/task_done"), true)
		end
	end)
end

function var_0_0.CheckGuide(arg_62_0, arg_62_1)
	if pg.NewStoryMgr.GetInstance():IsPlayed(arg_62_1) then
		return
	end

	return switch(arg_62_1, {
		DORM3D_GUIDE_02 = function()
			local var_63_0 = getProxy(ApartmentProxy):getApartment(20220)

			if var_63_0 and not var_63_0:needDownload() then
				pg.m02:sendNotification(GAME.STORY_UPDATE, {
					storyId = arg_62_1
				})
				pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGuide(1, pg.NewStoryMgr.GetInstance():StoryName2StoryId(arg_62_1)))
				pg.NewGuideMgr.GetInstance():Play(arg_62_1, nil, function()
					pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGuide(2, pg.NewStoryMgr.GetInstance():StoryName2StoryId(arg_62_1)))
				end)

				return true
			end
		end,
		DORM3D_GUIDE_06 = function()
			pg.m02:sendNotification(GAME.STORY_UPDATE, {
				storyId = arg_62_1
			})
			pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGuide(1, pg.NewStoryMgr.GetInstance():StoryName2StoryId(arg_62_1)))
			pg.NewGuideMgr.GetInstance():Play(arg_62_1, nil, function()
				pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGuide(2, pg.NewStoryMgr.GetInstance():StoryName2StoryId(arg_62_1)))
			end)

			return true
		end
	}, function()
		return false
	end)
end

function var_0_0.onBackPressed(arg_68_0)
	if isActive(arg_68_0.rtMgrPanel) then
		arg_68_0:HideMgrPanel()
	elseif isActive(arg_68_0.rtIconTip) then
		arg_68_0:HideIconTipWindow()
	else
		var_0_0.super.onBackPressed(arg_68_0)
	end
end

function var_0_0.willExit(arg_69_0)
	if isActive(arg_69_0.rtMgrPanel) then
		arg_69_0:HideMgrPanel()
	end

	if isActive(arg_69_0.rtIconTip) then
		arg_69_0:HideIconTipWindow()
	end

	if arg_69_0.clearSceneCache then
		BLHX.Rendering.EngineCore.TryDispose(true)

		local var_69_0 = typeof("BLHX.Rendering.Executor")
		local var_69_1 = ReflectionHelp.RefGetProperty(var_69_0, "Instance", nil)

		ReflectionHelp.RefCallMethod(var_69_0, "TryHandleWaitLinkList", var_69_1)
	end
end

return var_0_0
