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

	arg_2_0.insBtn = Dorm3dInsBtn.New(arg_2_0.rtMain:Find("btn_ins"))

	onButton(arg_2_0, arg_2_0.insBtn.root, function()
		arg_2_0:emit(SelectDorm3DMediator.OPEN_INS_LAYER, arg_2_0.insBtn.IsNewPhoneCall())
	end)
	setActive(arg_2_0.rtMain:Find("btn_ins"), not DORM_LOCK_INS)

	local var_2_0 = getProxy(PlayerProxy):getRawData().id

	if not pg.TimeMgr.GetInstance():IsSameWeek(pg.TimeMgr.GetInstance():GetServerTime(), PlayerPrefs.GetInt(var_2_0 .. "_dorm3dGiftWeekRefreshTimeStamp", 0)) then
		ApartmentProxy.RefreshGiftDailyTip()
	end

	setActive(arg_2_0.rtMain:Find("btn_shop/tip"), Dorm3dShopUI.ShouldShowAllTip())
	onButton(arg_2_0, arg_2_0.rtMain:Find("btn_shop"), function()
		arg_2_0:emit(SelectDorm3DMediator.OPEN_SHOP_LAYER, function()
			setActive(arg_2_0.rtMain:Find("btn_shop/tip"), Dorm3dShopUI.ShouldShowAllTip())
		end)
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

	local var_2_1 = arg_2_0.rtMgrChar:Find("container")

	arg_2_0.charRoomCardItemList = UIItemList.New(var_2_1, var_2_1:Find("tpl"))

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

	local var_2_2 = arg_2_0.rtMgrPublic:Find("container")

	arg_2_0.publicRoomCardItemList = UIItemList.New(var_2_2, var_2_2:Find("tpl"))

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
	arg_12_0:UpdateStamina()
	arg_12_0:CheckGuide("DORM3D_GUIDE_02")
	arg_12_0:FlushInsBtn()

	if not ApartmentProxy.CheckDeviceRAMEnough() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("drom3d_memory_limit_tip"))
	end
end

function var_0_0.FlushInsBtn(arg_13_0)
	arg_13_0.insBtn:Flush()
end

function var_0_0.UpdateStamina(arg_14_0)
	setText(arg_14_0.rtStamina:Find("Text"), string.format("%d/%d", getProxy(ApartmentProxy):getStamina()))
	setActive(arg_14_0.rtStamina:Find("vfx_ui_stamina01"), getProxy(ApartmentProxy):getStamina() > 0)
end

function var_0_0.SetFloor(arg_15_0, arg_15_1)
	local var_15_0

	eachChild(arg_15_0.rtMap, function(arg_16_0)
		setActive(arg_16_0, arg_16_0.name == arg_15_1)

		if arg_16_0.name == arg_15_1 then
			var_15_0 = arg_16_0
		end
	end)
	assert(var_15_0)

	arg_15_0.roomDic = {}

	for iter_15_0, iter_15_1 in ipairs(pg.dorm3d_rooms.get_id_list_by_in_map[arg_15_1]) do
		arg_15_0.roomDic[iter_15_1] = var_15_0:Find(pg.dorm3d_rooms[iter_15_1].assets_prefix)

		arg_15_0:InitIconTrigger(iter_15_1)
		arg_15_0:UpdateIconState(iter_15_1)
	end

	arg_15_0:ReplaceSpecialRoomIcon()
end

function var_0_0.FlushFloor(arg_17_0)
	arg_17_0:SetFloor(arg_17_0.contextData.floorName)
end

function var_0_0.InitIconTrigger(arg_18_0, arg_18_1)
	local var_18_0 = arg_18_0.roomDic[arg_18_1]
	local var_18_1 = pg.dorm3d_rooms[arg_18_1].assets_prefix

	GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/room_icon_%s", string.lower(var_18_1)), "", var_18_0:Find("icon"))
	onButton(arg_18_0, var_18_0, function()
		if BLOCK_DORM3D_ROOMS and table.contains(BLOCK_DORM3D_ROOMS, arg_18_1) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_system_switch"))

			return
		end

		if arg_18_1 ~= 1 and (not getProxy(ApartmentProxy):getRoom(1) or not pg.NewStoryMgr.GetInstance():IsPlayed("DORM3D_GUIDE_02")) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_guide_tip"))

			return
		end

		local var_19_0 = getProxy(ApartmentProxy):getRoom(arg_18_1)
		local var_19_1 = pg.dorm3d_rooms[arg_18_1].type

		if var_19_1 == 1 then
			if not var_19_0 then
				arg_18_0:emit(SelectDorm3DMediator.OPEN_ROOM_UNLOCK_WINDOW, arg_18_1)
			else
				arg_18_0:TryDownloadResource({
					click = true,
					roomId = arg_18_1
				}, function()
					local var_20_0 = underscore.map(string.split(PlayerPrefs.GetString(string.format("room%d_invite_list", arg_18_1), ""), "|"), function(arg_21_0)
						return tonumber(arg_21_0)
					end)

					if arg_18_0:CheckGuide("DORM3D_GUIDE_06") then
						var_20_0 = {}
					end

					arg_18_0:emit(SelectDorm3DMediator.OPEN_INVITE_LAYER, arg_18_1, var_20_0, function()
						arg_18_0:FlushFloor()
					end)
				end)
			end
		elseif var_19_1 == 2 then
			if not var_19_0 then
				arg_18_0:ShowIconTipWindow(arg_18_1, var_18_0)
			else
				arg_18_0:TryDownloadResource({
					click = true,
					roomId = arg_18_1
				}, function()
					arg_18_0:emit(SelectDorm3DMediator.ON_DORM, {
						roomId = var_19_0.id,
						groupIds = var_19_0:getInviteList()
					})
				end)
			end
		else
			assert(false)
		end
	end, SFX_PANEL)
end

function var_0_0.UpdateIconState(arg_24_0, arg_24_1)
	local var_24_0 = arg_24_0.roomDic[arg_24_1]
	local var_24_1 = getProxy(ApartmentProxy):getRoom(arg_24_1)
	local var_24_2 = var_24_1 and var_24_1:getState() or "lock"

	setActive(var_24_0:Find("icon/mask"), var_24_2 ~= "complete")
	eachChild(var_24_0:Find("front"), function(arg_25_0)
		setActive(arg_25_0, arg_25_0.name == var_24_2)
	end)
	switch(var_24_2, {
		loading = function()
			local var_26_0 = DormGroupConst.DormDownloadLock

			setSlider(var_24_0:Find("front/loading/progress"), 0, var_26_0.totalSize, var_26_0.curSize)
		end,
		complete = function()
			local var_27_0 = var_24_0:Find("front/complete")
			local var_27_1 = var_24_1:isPersonalRoom()

			setActive(var_27_0, var_27_1)

			if var_27_1 then
				local var_27_2 = getProxy(ApartmentProxy):getApartment(var_24_1:getPersonalGroupId())
				local var_27_3 = var_27_2:getIconTip(var_24_1:GetConfigID())

				eachChild(var_27_0:Find("tip"), function(arg_28_0)
					setActive(arg_28_0, arg_28_0.name == var_27_3)
				end)
				setText(var_27_0:Find("favor/Text"), var_27_2.level)
			end
		end
	})

	local var_24_3 = getProxy(PlayerProxy):getRawData().id

	if var_24_0:Find("tip") then
		setActive(var_24_0:Find("tip"), PlayerPrefs.GetInt(var_24_3 .. "_dorm3dRoomInviteSuccess_" .. arg_24_1, 1) == 0)
	end
end

function var_0_0.UpdateShowIcon(arg_29_0, arg_29_1, arg_29_2)
	removeOnButton(arg_29_2)
	setActive(arg_29_2:Find("icon/mask"), false)
	eachChild(arg_29_2:Find("front"), function(arg_30_0)
		setActive(arg_30_0, false)
	end)
end

function var_0_0.ReplaceSpecialRoomIcon(arg_31_0)
	local var_31_0 = {}

	for iter_31_0, iter_31_1 in pairs(getProxy(ApartmentProxy):getRawData()) do
		for iter_31_2, iter_31_3 in ipairs(iter_31_1:getSpecialTalking()) do
			local var_31_1 = pg.dorm3d_dialogue_group[iter_31_3].trigger_config[1]

			var_31_0[var_31_1] = var_31_0[var_31_1] or {}

			table.insert(var_31_0[var_31_1], iter_31_3)
		end
	end

	for iter_31_4, iter_31_5 in pairs(var_31_0) do
		setActive(arg_31_0.roomDic[iter_31_4], false)

		local var_31_2 = cloneTplTo(arg_31_0.roomDic[iter_31_4], arg_31_0.roomDic[iter_31_4].parent, arg_31_0.roomDic[iter_31_4].name .. "_special")

		arg_31_0:UpdateShowIcon(iter_31_4, var_31_2)
		GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/room_icon_%s", string.lower(pg.dorm3d_rooms[iter_31_4].assets_prefix)), "", var_31_2:Find("icon"))
		setActive(var_31_2:Find("front/complete"), true)
		setActive(var_31_2:Find("front/complete/favor"), false)
		eachChild(var_31_2:Find("front/complete/tip"), function(arg_32_0)
			setActive(arg_32_0, arg_32_0.name == "main")
		end)
		table.sort(iter_31_5)

		local var_31_3 = iter_31_5[1]
		local var_31_4 = pg.dorm3d_dialogue_group[var_31_3]

		onButton(arg_31_0, var_31_2, function()
			arg_31_0:TryDownloadResource({
				click = true,
				roomId = var_31_4.room_id
			}, function()
				arg_31_0:emit(SelectDorm3DMediator.ON_DORM, {
					roomId = var_31_4.room_id,
					groupIds = {
						var_31_4.char_id
					},
					specialId = var_31_3
				})
			end)
		end, SFX_PANEL)
	end
end

function var_0_0.InitCardTrigger(arg_35_0, arg_35_1)
	local var_35_0 = getProxy(ApartmentProxy):getRoom(arg_35_1)

	assert(var_35_0)

	local var_35_1 = arg_35_0.cardDic[arg_35_1]

	if var_35_0:isPersonalRoom() then
		local var_35_2 = var_35_0:getPersonalGroupId()
		local var_35_3 = Apartment.New({
			ship_group = var_35_2
		}):GetSkinModelID(var_35_0:getConfig("tag"))

		GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/room_card_apartment_%d", var_35_3), "", var_35_1:Find("Image"))
		GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/room_card_apartment_name_%d", var_35_2), "", var_35_1:Find("name"))
	else
		local var_35_4 = var_35_0:getConfig("assets_prefix")

		GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/room_card_%s", string.lower(var_35_4)), "", var_35_1:Find("Image"))
	end

	onButton(arg_35_0, var_35_1, function()
		arg_35_0:TryDownloadResource({
			click = true,
			roomId = arg_35_1
		}, function()
			local var_37_0 = var_35_0:getConfig("room")

			if var_35_0:isPersonalRoom() then
				var_37_0 = ShipGroup.getDefaultShipNameByGroupID(var_35_0:getPersonalGroupId())
			end

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("dorm3d_role_assets_delete", var_37_0),
				onYes = function()
					if IsUnityEditor then
						pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_open"))

						return
					end

					if var_35_0:isPersonalRoom() then
						DormGroupConst.DelRoom(string.lower(var_35_0:getConfig("resource_name")), {
							"room",
							"apartment"
						})
					else
						DormGroupConst.DelRoom(string.lower(var_35_0:getConfig("resource_name")), {
							"room"
						})
					end

					pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_delete_finish"))
					pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataDownload(var_35_0.id, 3))
					arg_35_0:DownloadUpdate(arg_35_1, "delete")
				end
			})
		end)
	end, SFX_PANEL)
end

function var_0_0.UpdateCardState(arg_39_0, arg_39_1)
	local var_39_0 = getProxy(ApartmentProxy):getRoom(arg_39_1)
	local var_39_1 = arg_39_0.cardDic[arg_39_1]
	local var_39_2 = var_39_0:getState()

	if var_39_0:isPersonalRoom() then
		setActive(var_39_1:Find("lock"), var_39_2 ~= "complete")
		setActive(var_39_1:Find("unlock"), var_39_2 == "complete")

		local var_39_3 = getProxy(ApartmentProxy):getApartment(var_39_0:getPersonalGroupId())

		setText(var_39_1:Find("favor_level/Text"), var_39_3 and var_39_3.level or "?")
	end

	local var_39_4 = var_39_1:Find("operation")

	eachChild(var_39_4, function(arg_40_0)
		setActive(arg_40_0, arg_40_0.name == var_39_2)
	end)

	if DormGroupConst.DormDownloadLock and DormGroupConst.DormDownloadLock.roomId == arg_39_1 then
		arg_39_0:UpdateCardProgess()
	end

	setActive(var_39_1:Find("mask"), var_39_2 ~= "complete")
end

function var_0_0.UpdateCardProgess(arg_41_0)
	local var_41_0 = DormGroupConst.DormDownloadLock
	local var_41_1 = arg_41_0.cardDic[var_41_0.roomId]

	setSlider(var_41_1:Find("operation/loading"), 0, var_41_0.totalSize, var_41_0.curSize)
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
				arg_42_0:UpdateIconState(iter_45_0)
			end

			if arg_42_0.cardDic then
				for iter_45_2, iter_45_3 in pairs(arg_42_0.cardDic) do
					arg_42_0:UpdateCardState(iter_45_2)
				end
			else
				arg_42_0:CheckGuide("DORM3D_GUIDE_02")
			end
		end,
		delete = function()
			if arg_42_0.roomDic[arg_42_1] then
				arg_42_0:UpdateIconState(arg_42_1)
			end

			if arg_42_0.cardDic and arg_42_0.cardDic[arg_42_1] then
				arg_42_0:UpdateCardState(arg_42_1)
			end
		end
	})
end

function var_0_0.AfterRoomUnlock(arg_47_0, arg_47_1)
	local var_47_0 = arg_47_1.roomId

	if isActive(arg_47_0.rtIconTip) then
		arg_47_0:HideIconTipWindow()
	end

	eachChild(arg_47_0.roomDic[var_47_0]:Find("icon/mask"), function(arg_48_0)
		setActive(arg_48_0, true)
	end)
	quickPlayAnimation(arg_47_0.roomDic[var_47_0], "anim_Dorm3d_selectDorm_icon_unlock")
	pg.UIMgr.GetInstance():LoadingOn(false)
	LeanTween.delayedCall(1.2333333333333334, System.Action(function()
		pg.UIMgr.GetInstance():LoadingOff(false)
		arg_47_0:UpdateIconState(var_47_0)
		arg_47_0:TryDownloadResource(arg_47_1)
		arg_47_0:CheckGuide("DORM3D_GUIDE_02")
	end))
end

function var_0_0.ShowIconTipWindow(arg_50_0, arg_50_1, arg_50_2)
	setLocalPosition(arg_50_0.rtIconTip:Find("window"), arg_50_0.rtIconTip:InverseTransformPoint(arg_50_2.position))
	removeAllChildren(arg_50_0.rtIconTip:Find("window/icon"))

	arg_50_2 = cloneTplTo(arg_50_2, arg_50_0.rtIconTip:Find("window/icon"))

	arg_50_0:UpdateShowIcon(arg_50_1, arg_50_2)
	setAnchoredPosition(arg_50_2, Vector2.zero)

	local var_50_0 = ApartmentRoom.New({
		id = arg_50_1
	})
	local var_50_1, var_50_2 = var_50_0:getDownloadNeedSize()

	setText(arg_50_0.rtIconTip:Find("window/Text"), i18n("dorm3d_role_assets_download", ShipGroup.getDefaultShipNameByGroupID(var_50_0:getPersonalGroupId()), var_50_0:needDownload() and var_50_2 or "0B"))
	onButton(arg_50_0, arg_50_0.rtIconTip:Find("window/btn_confirm"), function()
		arg_50_0:emit(SelectDorm3DMediator.ON_UNLOCK_DORM_ROOM, arg_50_1)
	end, SFX_CONFIRM)
	setActive(arg_50_0.rtIconTip, true)
end

function var_0_0.HideIconTipWindow(arg_52_0)
	setActive(arg_52_0.rtIconTip, false)
end

function var_0_0.ShowMgrPanel(arg_53_0)
	arg_53_0.cardDic = {}
	arg_53_0.filterCharRoomIds = {}
	arg_53_0.filterPublicRoomIds = {}

	for iter_53_0, iter_53_1 in ipairs(underscore.filter(pg.dorm3d_rooms.all, function(arg_54_0)
		return tobool(getProxy(ApartmentProxy):getRoom(arg_54_0))
	end)) do
		local var_53_0 = pg.dorm3d_rooms[iter_53_1].type

		if var_53_0 == 1 then
			table.insert(arg_53_0.filterPublicRoomIds, iter_53_1)
		elseif var_53_0 == 2 then
			table.insert(arg_53_0.filterCharRoomIds, iter_53_1)
		else
			assert(false)
		end
	end

	arg_53_0.charRoomCardItemList:align(#arg_53_0.filterCharRoomIds)
	arg_53_0.publicRoomCardItemList:align(#arg_53_0.filterPublicRoomIds)
	pg.UIMgr.GetInstance():OverlayPanelPB(arg_53_0.rtMgrPanel, {
		force = true,
		pbList = {
			arg_53_0.rtMgrPanel:Find("window")
		}
	})
	setActive(arg_53_0.rtMgrPanel, true)
end

function var_0_0.HideMgrPanel(arg_55_0)
	arg_55_0.cardDic = nil

	pg.UIMgr.GetInstance():UnblurPanel(arg_55_0.rtMgrPanel, arg_55_0.rtLayer)
	setActive(arg_55_0.rtMgrPanel, false)
	arg_55_0:CheckGuide("DORM3D_GUIDE_02")
end

function var_0_0.TryDownloadResource(arg_56_0, arg_56_1, arg_56_2)
	if DormGroupConst.IsDownloading() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_now_is_downloading"))

		return
	end

	local var_56_0 = getProxy(ApartmentProxy):getRoom(arg_56_1.roomId)
	local var_56_1 = var_56_0:getDownloadNameList()

	if #var_56_1 > 0 then
		local var_56_2 = {
			isShowBox = true,
			fileList = var_56_1,
			finishFunc = function(arg_57_0)
				if arg_57_0 then
					pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_resource_download_complete"))
				end
			end,
			roomId = var_56_0.configId
		}

		DormGroupConst.DormDownload(var_56_2)
	else
		existCall(arg_56_2)
	end
end

function var_0_0.InitResBar(arg_58_0)
	arg_58_0.goldMax = arg_58_0.rtRes:Find("gold/max"):GetComponent(typeof(Text))
	arg_58_0.goldValue = arg_58_0.rtRes:Find("gold/Text"):GetComponent(typeof(Text))
	arg_58_0.oilMax = arg_58_0.rtRes:Find("oil/max"):GetComponent(typeof(Text))
	arg_58_0.oilValue = arg_58_0.rtRes:Find("oil/Text"):GetComponent(typeof(Text))
	arg_58_0.gemValue = arg_58_0.rtRes:Find("gem/Text"):GetComponent(typeof(Text))

	onButton(arg_58_0, arg_58_0.rtRes:Find("gold"), function()
		warning("debug test")
		pg.playerResUI:ClickGold()
	end, SFX_PANEL)
	onButton(arg_58_0, arg_58_0.rtRes:Find("oil"), function()
		pg.playerResUI:ClickOil()
	end, SFX_PANEL)
	onButton(arg_58_0, arg_58_0.rtRes:Find("gem"), function()
		pg.playerResUI:ClickGem()
	end, SFX_PANEL)
	arg_58_0:UpdateRes()
end

function var_0_0.UpdateRes(arg_62_0)
	local var_62_0 = getProxy(PlayerProxy):getRawData()

	PlayerResUI.StaticFlush(var_62_0, arg_62_0.goldMax, arg_62_0.goldValue, arg_62_0.oilMax, arg_62_0.oilValue, arg_62_0.gemValue)
end

function var_0_0.UpdateWeekTask(arg_63_0)
	local var_63_0 = getDorm3dGameset("drom3d_weekly_task")[1]
	local var_63_1 = getProxy(TaskProxy):getTaskVO(var_63_0)
	local var_63_2 = var_63_1:isReceive()
	local var_63_3 = var_63_2 and 3 or var_63_1:getProgress()
	local var_63_4 = arg_63_0.rtWeekTask:Find("content")

	for iter_63_0 = 1, 3 do
		triggerToggle(var_63_4:Find("tpl_" .. iter_63_0), iter_63_0 <= var_63_3)
	end

	local var_63_5 = Drop.Create(var_63_1:getConfig("award_display")[1])

	updateDorm3dIcon(var_63_4:Find("Dorm3dIconTpl"), var_63_5)
	onButton(arg_63_0, var_63_4:Find("Dorm3dIconTpl"), function()
		if not var_63_2 and var_63_1:isFinish() then
			arg_63_0:emit(SelectDorm3DMediator.ON_SUBMIT_TASK, var_63_0)
		else
			arg_63_0:emit(BaseUI.ON_NEW_DROP, {
				drop = var_63_5
			})
		end
	end, SFX_CONFIRM)
	setActive(var_63_4:Find("Dorm3dIconTpl/get"), not var_63_2 and var_63_1:isFinish())
	setGray(var_63_4:Find("Dorm3dIconTpl"), var_63_2)
	onButton(arg_63_0, arg_63_0._tf:Find("Main/task_done"), function()
		setActive(arg_63_0.rtWeekTask, true)
		setActive(arg_63_0._tf:Find("Main/task_done"), false)
	end)
	onButton(arg_63_0, arg_63_0.rtWeekTask:Find("title"), function()
		if var_63_2 then
			setActive(arg_63_0.rtWeekTask, false)
			setActive(arg_63_0._tf:Find("Main/task_done"), true)
		end
	end)
end

function var_0_0.CheckGuide(arg_67_0, arg_67_1)
	if pg.NewStoryMgr.GetInstance():IsPlayed(arg_67_1) then
		return
	end

	return switch(arg_67_1, {
		DORM3D_GUIDE_02 = function()
			local var_68_0 = getProxy(ApartmentProxy):getApartment(20220)

			if var_68_0 and not var_68_0:needDownload() then
				pg.m02:sendNotification(GAME.STORY_UPDATE, {
					storyId = arg_67_1
				})
				pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGuide(1, pg.NewStoryMgr.GetInstance():StoryName2StoryId(arg_67_1)))
				pg.NewGuideMgr.GetInstance():Play(arg_67_1, nil, function()
					pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGuide(2, pg.NewStoryMgr.GetInstance():StoryName2StoryId(arg_67_1)))
				end)

				return true
			end
		end,
		DORM3D_GUIDE_06 = function()
			pg.m02:sendNotification(GAME.STORY_UPDATE, {
				storyId = arg_67_1
			})
			pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGuide(1, pg.NewStoryMgr.GetInstance():StoryName2StoryId(arg_67_1)))
			pg.NewGuideMgr.GetInstance():Play(arg_67_1, nil, function()
				pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGuide(2, pg.NewStoryMgr.GetInstance():StoryName2StoryId(arg_67_1)))
			end)

			return true
		end
	}, function()
		return false
	end)
end

function var_0_0.onBackPressed(arg_73_0)
	if isActive(arg_73_0.rtMgrPanel) then
		arg_73_0:HideMgrPanel()
	elseif isActive(arg_73_0.rtIconTip) then
		arg_73_0:HideIconTipWindow()
	else
		var_0_0.super.onBackPressed(arg_73_0)
	end
end

function var_0_0.willExit(arg_74_0)
	if isActive(arg_74_0.rtMgrPanel) then
		arg_74_0:HideMgrPanel()
	end

	if isActive(arg_74_0.rtIconTip) then
		arg_74_0:HideIconTipWindow()
	end

	if arg_74_0.clearSceneCache then
		-- block empty
	end
end

return var_0_0
