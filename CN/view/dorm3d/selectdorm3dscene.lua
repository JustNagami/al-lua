local var_0_0 = class("SelectDorm3DScene", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "SelectDorm3DUI"
end

function var_0_0.forceGC(arg_2_0)
	return true
end

var_0_0.optionsPath = {
	"Main/option"
}

function var_0_0.init(arg_3_0)
	arg_3_0.rtMap = arg_3_0._tf:Find("Map")
	arg_3_0.rtIconTip = arg_3_0.rtMap:Find("tip")

	setActive(arg_3_0.rtIconTip, false)
	onButton(arg_3_0, arg_3_0.rtIconTip:Find("bg"), function()
		arg_3_0:HideIconTipWindow()
	end, SFX_CANCEL)
	setText(arg_3_0.rtIconTip:Find("window/btn_cancel/Text"), i18n("text_cancel"))
	onButton(arg_3_0, arg_3_0.rtIconTip:Find("window/btn_cancel"), function()
		arg_3_0:HideIconTipWindow()
	end, SFX_CANCEL)
	setText(arg_3_0.rtIconTip:Find("window/btn_confirm/Text"), i18n("text_confirm"))

	arg_3_0.rtMain = arg_3_0._tf:Find("Main")

	setText(arg_3_0.rtMain:Find("title/Text"), i18n("dorm3d_role_choose"))
	onButton(arg_3_0, arg_3_0.rtMain:Find("btn_back"), function()
		arg_3_0.clearSceneCache = true

		arg_3_0:closeView()
	end, SFX_CANCEL)

	arg_3_0.insBtn = Dorm3dInsBtn.New(arg_3_0.rtMain:Find("btn_ins"))

	onButton(arg_3_0, arg_3_0.insBtn.root, function()
		arg_3_0:emit(SelectDorm3DMediator.OPEN_INS_LAYER, arg_3_0.insBtn.IsNewPhoneCall())
	end)

	arg_3_0.rtStamina = arg_3_0.rtMain:Find("stamina")
	arg_3_0.rtRes = arg_3_0.rtMain:Find("res")

	arg_3_0:InitResBar()

	arg_3_0.rtWeekTask = arg_3_0.rtMain:Find("task")

	arg_3_0:UpdateWeekTask()

	arg_3_0.rtLayer = arg_3_0._tf:Find("Layer")
	arg_3_0.rtMgrPanel = arg_3_0.rtLayer:Find("mgr_panel")

	onButton(arg_3_0, arg_3_0.rtMgrPanel:Find("bg"), function()
		arg_3_0:HideMgrPanel()
	end, SFX_CANCEL)
	setText(arg_3_0.rtMgrPanel:Find("window/title/Text"), i18n("dorm3d_role_manage"))

	arg_3_0.rtMgrChar = arg_3_0.rtMgrPanel:Find("window/character")

	setText(arg_3_0.rtMgrChar:Find("title"), i18n("dorm3d_role_manage_role"))

	local var_3_0 = arg_3_0.rtMgrChar:Find("container")

	arg_3_0.charRoomCardItemList = UIItemList.New(var_3_0, var_3_0:Find("tpl"))

	arg_3_0.charRoomCardItemList:make(function(arg_9_0, arg_9_1, arg_9_2)
		arg_9_1 = arg_9_1 + 1

		if arg_9_0 == UIItemList.EventUpdate then
			local var_9_0 = arg_3_0.filterCharRoomIds[arg_9_1]

			setActive(arg_9_2:Find("base"), var_9_0)
			setActive(arg_9_2:Find("empty"), not var_9_0)

			if not var_9_0 then
				arg_9_2.name = "null"

				setText(arg_9_2:Find("empty/Text"), i18n("dorm3d_waiting"))
			else
				arg_9_2.name = tostring(var_9_0)
				arg_3_0.cardDic[var_9_0] = arg_9_2:Find("base")

				arg_3_0:InitCardTrigger(var_9_0)
				arg_3_0:UpdateCardState(var_9_0)

				return
			end
		end
	end)

	arg_3_0.rtMgrPublic = arg_3_0.rtMgrPanel:Find("window/public")

	setText(arg_3_0.rtMgrPublic:Find("title"), i18n("dorm3d_role_manage_public_area"))

	local var_3_1 = arg_3_0.rtMgrPublic:Find("container")

	arg_3_0.publicRoomCardItemList = UIItemList.New(var_3_1, var_3_1:Find("tpl"))

	arg_3_0.publicRoomCardItemList:make(function(arg_10_0, arg_10_1, arg_10_2)
		arg_10_1 = arg_10_1 + 1

		if arg_10_0 == UIItemList.EventUpdate then
			local var_10_0 = arg_3_0.filterPublicRoomIds[arg_10_1]

			arg_3_0.cardDic[var_10_0] = arg_10_2

			arg_3_0:InitCardTrigger(var_10_0)
			arg_3_0:UpdateCardState(var_10_0)
		end
	end)
end

function var_0_0.didEnter(arg_11_0)
	arg_11_0.contextData.floorName = arg_11_0.contextData.floorName or "floor_1"

	arg_11_0:SetFloor(arg_11_0.contextData.floorName)
	arg_11_0:UpdateStamina()
	arg_11_0:CheckGuide("DORM3D_GUIDE_02")
	arg_11_0:FlushInsBtn()
	DormProxy.CheckDeviceRAMEnough()
end

function var_0_0.FlushInsBtn(arg_12_0)
	arg_12_0.insBtn:Flush()
end

function var_0_0.UpdateStamina(arg_13_0)
	setText(arg_13_0.rtStamina:Find("Text"), string.format("%d/%d", getProxy(ApartmentProxy):getStamina()))
	setActive(arg_13_0.rtStamina:Find("vfx_ui_stamina01"), getProxy(ApartmentProxy):getStamina() > 0)
end

function var_0_0.SetFloor(arg_14_0, arg_14_1)
	local var_14_0

	eachChild(arg_14_0.rtMap, function(arg_15_0)
		setActive(arg_15_0, arg_15_0.name == arg_14_1)

		if arg_15_0.name == arg_14_1 then
			var_14_0 = arg_15_0
		end
	end)
	assert(var_14_0)

	arg_14_0.roomDic = {}

	for iter_14_0, iter_14_1 in ipairs(pg.dorm3d_rooms.get_id_list_by_in_map[arg_14_1]) do
		arg_14_0.roomDic[iter_14_1] = var_14_0:Find(pg.dorm3d_rooms[iter_14_1].assets_prefix)

		arg_14_0:InitIconTrigger(iter_14_1)
		arg_14_0:UpdateIconState(iter_14_1)
	end

	arg_14_0:ReplaceSpecialRoomIcon()
end

function var_0_0.InitIconTrigger(arg_16_0, arg_16_1)
	local var_16_0 = arg_16_0.roomDic[arg_16_1]
	local var_16_1 = pg.dorm3d_rooms[arg_16_1].assets_prefix

	GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/room_icon_%s", string.lower(var_16_1)), "", var_16_0:Find("icon"))
	onButton(arg_16_0, var_16_0, function()
		if BLOCK_DORM3D_ROOMS and table.contains(BLOCK_DORM3D_ROOMS, arg_16_1) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_system_switch"))

			return
		end

		if arg_16_1 ~= 1 and (not getProxy(ApartmentProxy):getRoom(1) or not pg.NewStoryMgr.GetInstance():IsPlayed("DORM3D_GUIDE_02")) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_guide_tip"))

			return
		end

		local var_17_0 = getProxy(ApartmentProxy):getRoom(arg_16_1)
		local var_17_1 = pg.dorm3d_rooms[arg_16_1].type

		if var_17_1 == 1 then
			if not var_17_0 then
				arg_16_0:emit(SelectDorm3DMediator.OPEN_ROOM_UNLOCK_WINDOW, arg_16_1)
			else
				arg_16_0:TryDownloadResource({
					click = true,
					roomId = arg_16_1
				}, function()
					local var_18_0 = underscore.map(string.split(PlayerPrefs.GetString(string.format("room%d_invite_list", arg_16_1), ""), "|"), function(arg_19_0)
						return tonumber(arg_19_0)
					end)

					if arg_16_0:CheckGuide("DORM3D_GUIDE_06") then
						var_18_0 = {}
					end

					arg_16_0:emit(SelectDorm3DMediator.OPEN_INVITE_LAYER, arg_16_1, var_18_0)
				end)
			end
		elseif var_17_1 == 2 then
			if not var_17_0 then
				arg_16_0:ShowIconTipWindow(arg_16_1, var_16_0)
			else
				arg_16_0:TryDownloadResource({
					click = true,
					roomId = arg_16_1
				}, function()
					arg_16_0:emit(SelectDorm3DMediator.ON_DORM, {
						roomId = var_17_0.id,
						groupIds = var_17_0:getInviteList()
					})
				end)
			end
		else
			assert(false)
		end
	end, SFX_PANEL)
end

function var_0_0.UpdateIconState(arg_21_0, arg_21_1)
	local var_21_0 = arg_21_0.roomDic[arg_21_1]
	local var_21_1 = getProxy(ApartmentProxy):getRoom(arg_21_1)
	local var_21_2 = var_21_1 and var_21_1:getState() or "lock"

	setActive(var_21_0:Find("icon/mask"), var_21_2 ~= "complete")
	eachChild(var_21_0:Find("front"), function(arg_22_0)
		setActive(arg_22_0, arg_22_0.name == var_21_2)
	end)
	switch(var_21_2, {
		loading = function()
			local var_23_0 = DormGroupConst.DormDownloadLock

			setSlider(var_21_0:Find("front/loading/progress"), 0, var_23_0.totalSize, var_23_0.curSize)
		end,
		complete = function()
			local var_24_0 = var_21_0:Find("front/complete")
			local var_24_1 = var_21_1:isPersonalRoom()

			setActive(var_24_0, var_24_1)

			if var_24_1 then
				local var_24_2 = getProxy(ApartmentProxy):getApartment(var_21_1:getPersonalGroupId())
				local var_24_3 = var_24_2:getIconTip(var_21_1:GetConfigID())

				eachChild(var_24_0:Find("tip"), function(arg_25_0)
					setActive(arg_25_0, arg_25_0.name == var_24_3)
				end)
				setText(var_24_0:Find("favor/Text"), var_24_2.level)
			end
		end
	})
end

function var_0_0.UpdateShowIcon(arg_26_0, arg_26_1, arg_26_2)
	removeOnButton(arg_26_2)
	setActive(arg_26_2:Find("icon/mask"), false)
	eachChild(arg_26_2:Find("front"), function(arg_27_0)
		setActive(arg_27_0, false)
	end)
end

function var_0_0.ReplaceSpecialRoomIcon(arg_28_0)
	local var_28_0 = {}

	for iter_28_0, iter_28_1 in pairs(getProxy(ApartmentProxy):getRawData()) do
		for iter_28_2, iter_28_3 in ipairs(iter_28_1:getSpecialTalking()) do
			local var_28_1 = pg.dorm3d_dialogue_group[iter_28_3].trigger_config[1]

			var_28_0[var_28_1] = var_28_0[var_28_1] or {}

			table.insert(var_28_0[var_28_1], iter_28_3)
		end
	end

	for iter_28_4, iter_28_5 in pairs(var_28_0) do
		setActive(arg_28_0.roomDic[iter_28_4], false)

		local var_28_2 = cloneTplTo(arg_28_0.roomDic[iter_28_4], arg_28_0.roomDic[iter_28_4].parent, arg_28_0.roomDic[iter_28_4].name .. "_special")

		arg_28_0:UpdateShowIcon(iter_28_4, var_28_2)
		GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/room_icon_%s", string.lower(pg.dorm3d_rooms[iter_28_4].assets_prefix)), "", var_28_2:Find("icon"))
		setActive(var_28_2:Find("front/complete"), true)
		setActive(var_28_2:Find("front/complete/favor"), false)
		eachChild(var_28_2:Find("front/complete/tip"), function(arg_29_0)
			setActive(arg_29_0, arg_29_0.name == "main")
		end)
		table.sort(iter_28_5)

		local var_28_3 = iter_28_5[1]
		local var_28_4 = pg.dorm3d_dialogue_group[var_28_3]

		onButton(arg_28_0, var_28_2, function()
			arg_28_0:TryDownloadResource({
				click = true,
				roomId = var_28_4.room_id
			}, function()
				arg_28_0:emit(SelectDorm3DMediator.ON_DORM, {
					roomId = var_28_4.room_id,
					groupIds = {
						var_28_4.char_id
					},
					specialId = var_28_3
				})
			end)
		end, SFX_PANEL)
	end
end

function var_0_0.InitCardTrigger(arg_32_0, arg_32_1)
	local var_32_0 = getProxy(ApartmentProxy):getRoom(arg_32_1)

	assert(var_32_0)

	local var_32_1 = arg_32_0.cardDic[arg_32_1]

	if var_32_0:isPersonalRoom() then
		local var_32_2 = var_32_0:getPersonalGroupId()
		local var_32_3 = Apartment.New({
			ship_group = var_32_2
		}):GetSkinModelID(var_32_0:getConfig("tag"))

		GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/room_card_apartment_%d", var_32_3), "", var_32_1:Find("Image"))
		GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/room_card_apartment_name_%d", var_32_2), "", var_32_1:Find("name"))
	else
		local var_32_4 = var_32_0:getConfig("assets_prefix")

		GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/room_card_%s", string.lower(var_32_4)), "", var_32_1:Find("Image"))
	end

	onButton(arg_32_0, var_32_1, function()
		arg_32_0:TryDownloadResource({
			click = true,
			roomId = arg_32_1
		}, function()
			local var_34_0 = var_32_0:getConfig("room")

			if var_32_0:isPersonalRoom() then
				var_34_0 = ShipGroup.getDefaultShipNameByGroupID(var_32_0:getPersonalGroupId())
			end

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("dorm3d_role_assets_delete", var_34_0),
				onYes = function()
					if IsUnityEditor then
						pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_open"))

						return
					end

					if var_32_0:isPersonalRoom() then
						DormGroupConst.DelRoom(string.lower(var_32_0:getConfig("resource_name")), {
							"room",
							"apartment"
						})
					else
						DormGroupConst.DelRoom(string.lower(var_32_0:getConfig("resource_name")), {
							"room"
						})
					end

					pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_delete_finish"))
					pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataDownload(var_32_0.id, 3))
					arg_32_0:DownloadUpdate(arg_32_1, "delete")
				end
			})
		end)
	end, SFX_PANEL)
end

function var_0_0.UpdateCardState(arg_36_0, arg_36_1)
	local var_36_0 = getProxy(ApartmentProxy):getRoom(arg_36_1)
	local var_36_1 = arg_36_0.cardDic[arg_36_1]
	local var_36_2 = var_36_0:getState()

	if var_36_0:isPersonalRoom() then
		setActive(var_36_1:Find("lock"), var_36_2 ~= "complete")
		setActive(var_36_1:Find("unlock"), var_36_2 == "complete")

		local var_36_3 = getProxy(ApartmentProxy):getApartment(var_36_0:getPersonalGroupId())

		setText(var_36_1:Find("favor_level/Text"), var_36_3 and var_36_3.level or "?")
	end

	local var_36_4 = var_36_1:Find("operation")

	eachChild(var_36_4, function(arg_37_0)
		setActive(arg_37_0, arg_37_0.name == var_36_2)
	end)

	if DormGroupConst.DormDownloadLock and DormGroupConst.DormDownloadLock.roomId == arg_36_1 then
		arg_36_0:UpdateCardProgess()
	end

	setActive(var_36_1:Find("mask"), var_36_2 ~= "complete")
end

function var_0_0.UpdateCardProgess(arg_38_0)
	local var_38_0 = DormGroupConst.DormDownloadLock
	local var_38_1 = arg_38_0.cardDic[var_38_0.roomId]

	setSlider(var_38_1:Find("operation/loading"), 0, var_38_0.totalSize, var_38_0.curSize)
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
				arg_39_0:UpdateIconState(iter_42_0)
			end

			if arg_39_0.cardDic then
				for iter_42_2, iter_42_3 in pairs(arg_39_0.cardDic) do
					arg_39_0:UpdateCardState(iter_42_2)
				end
			else
				arg_39_0:CheckGuide("DORM3D_GUIDE_02")
			end
		end,
		delete = function()
			if arg_39_0.roomDic[arg_39_1] then
				arg_39_0:UpdateIconState(arg_39_1)
			end

			if arg_39_0.cardDic and arg_39_0.cardDic[arg_39_1] then
				arg_39_0:UpdateCardState(arg_39_1)
			end
		end
	})
end

function var_0_0.AfterRoomUnlock(arg_44_0, arg_44_1)
	local var_44_0 = arg_44_1.roomId

	if isActive(arg_44_0.rtIconTip) then
		arg_44_0:HideIconTipWindow()
	end

	eachChild(arg_44_0.roomDic[var_44_0]:Find("icon/mask"), function(arg_45_0)
		setActive(arg_45_0, true)
	end)
	quickPlayAnimation(arg_44_0.roomDic[var_44_0], "anim_Dorm3d_selectDorm_icon_unlock")
	pg.UIMgr.GetInstance():LoadingOn(false)
	LeanTween.delayedCall(1.2333333333333334, System.Action(function()
		pg.UIMgr.GetInstance():LoadingOff(false)
		arg_44_0:UpdateIconState(var_44_0)
		arg_44_0:TryDownloadResource(arg_44_1)
		arg_44_0:CheckGuide("DORM3D_GUIDE_02")
	end))
end

function var_0_0.ShowIconTipWindow(arg_47_0, arg_47_1, arg_47_2)
	setLocalPosition(arg_47_0.rtIconTip:Find("window"), arg_47_0.rtIconTip:InverseTransformPoint(arg_47_2.position))
	removeAllChildren(arg_47_0.rtIconTip:Find("window/icon"))

	arg_47_2 = cloneTplTo(arg_47_2, arg_47_0.rtIconTip:Find("window/icon"))

	arg_47_0:UpdateShowIcon(arg_47_1, arg_47_2)
	setAnchoredPosition(arg_47_2, Vector2.zero)

	local var_47_0 = ApartmentRoom.New({
		id = arg_47_1
	})
	local var_47_1, var_47_2 = var_47_0:getDownloadNeedSize()

	setText(arg_47_0.rtIconTip:Find("window/Text"), i18n("dorm3d_role_assets_download", ShipGroup.getDefaultShipNameByGroupID(var_47_0:getPersonalGroupId()), var_47_0:needDownload() and var_47_2 or "0B"))
	onButton(arg_47_0, arg_47_0.rtIconTip:Find("window/btn_confirm"), function()
		arg_47_0:emit(SelectDorm3DMediator.ON_UNLOCK_DORM_ROOM, arg_47_1)
	end, SFX_CONFIRM)
	setActive(arg_47_0.rtIconTip, true)
end

function var_0_0.HideIconTipWindow(arg_49_0)
	setActive(arg_49_0.rtIconTip, false)
end

function var_0_0.ShowMgrPanel(arg_50_0)
	arg_50_0.cardDic = {}
	arg_50_0.filterCharRoomIds = {}
	arg_50_0.filterPublicRoomIds = {}

	for iter_50_0, iter_50_1 in ipairs(underscore.filter(pg.dorm3d_rooms.all, function(arg_51_0)
		return tobool(getProxy(ApartmentProxy):getRoom(arg_51_0))
	end)) do
		local var_50_0 = pg.dorm3d_rooms[iter_50_1].type

		if var_50_0 == 1 then
			table.insert(arg_50_0.filterPublicRoomIds, iter_50_1)
		elseif var_50_0 == 2 then
			table.insert(arg_50_0.filterCharRoomIds, iter_50_1)
		else
			assert(false)
		end
	end

	arg_50_0.charRoomCardItemList:align(#arg_50_0.filterCharRoomIds)
	arg_50_0.publicRoomCardItemList:align(#arg_50_0.filterPublicRoomIds)
	pg.UIMgr.GetInstance():OverlayPanelPB(arg_50_0.rtMgrPanel, {
		force = true,
		pbList = {
			arg_50_0.rtMgrPanel:Find("window")
		}
	})
	setActive(arg_50_0.rtMgrPanel, true)
end

function var_0_0.HideMgrPanel(arg_52_0)
	arg_52_0.cardDic = nil

	pg.UIMgr.GetInstance():UnblurPanel(arg_52_0.rtMgrPanel, arg_52_0.rtLayer)
	setActive(arg_52_0.rtMgrPanel, false)
	arg_52_0:CheckGuide("DORM3D_GUIDE_02")
end

function var_0_0.TryDownloadResource(arg_53_0, arg_53_1, arg_53_2)
	if DormGroupConst.IsDownloading() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_now_is_downloading"))

		return
	end

	local var_53_0 = getProxy(ApartmentProxy):getRoom(arg_53_1.roomId)
	local var_53_1 = var_53_0:getDownloadNameList()

	if #var_53_1 > 0 then
		local var_53_2 = {
			isShowBox = true,
			fileList = var_53_1,
			finishFunc = function(arg_54_0)
				if arg_54_0 then
					pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_resource_download_complete"))
				end
			end,
			roomId = var_53_0.configId
		}

		DormGroupConst.DormDownload(var_53_2)
	else
		existCall(arg_53_2)
	end
end

function var_0_0.InitResBar(arg_55_0)
	arg_55_0.goldMax = arg_55_0.rtRes:Find("gold/max"):GetComponent(typeof(Text))
	arg_55_0.goldValue = arg_55_0.rtRes:Find("gold/Text"):GetComponent(typeof(Text))
	arg_55_0.oilMax = arg_55_0.rtRes:Find("oil/max"):GetComponent(typeof(Text))
	arg_55_0.oilValue = arg_55_0.rtRes:Find("oil/Text"):GetComponent(typeof(Text))
	arg_55_0.gemValue = arg_55_0.rtRes:Find("gem/Text"):GetComponent(typeof(Text))

	onButton(arg_55_0, arg_55_0.rtRes:Find("gold"), function()
		warning("debug test")
		pg.playerResUI:ClickGold()
	end, SFX_PANEL)
	onButton(arg_55_0, arg_55_0.rtRes:Find("oil"), function()
		pg.playerResUI:ClickOil()
	end, SFX_PANEL)
	onButton(arg_55_0, arg_55_0.rtRes:Find("gem"), function()
		pg.playerResUI:ClickGem()
	end, SFX_PANEL)
	arg_55_0:UpdateRes()
end

function var_0_0.UpdateRes(arg_59_0)
	local var_59_0 = getProxy(PlayerProxy):getRawData()

	PlayerResUI.StaticFlush(var_59_0, arg_59_0.goldMax, arg_59_0.goldValue, arg_59_0.oilMax, arg_59_0.oilValue, arg_59_0.gemValue)
end

function var_0_0.UpdateWeekTask(arg_60_0)
	local var_60_0 = getDorm3dGameset("drom3d_weekly_task")[1]
	local var_60_1 = getProxy(TaskProxy):getTaskVO(var_60_0)
	local var_60_2 = var_60_1:isReceive()
	local var_60_3 = var_60_2 and 3 or var_60_1:getProgress()
	local var_60_4 = arg_60_0.rtWeekTask:Find("content")

	for iter_60_0 = 1, 3 do
		triggerToggle(var_60_4:Find("tpl_" .. iter_60_0), iter_60_0 <= var_60_3)
	end

	local var_60_5 = Drop.Create(var_60_1:getConfig("award_display")[1])

	updateDorm3dIcon(var_60_4:Find("Dorm3dIconTpl"), var_60_5)
	onButton(arg_60_0, var_60_4:Find("Dorm3dIconTpl"), function()
		if not var_60_2 and var_60_1:isFinish() then
			arg_60_0:emit(SelectDorm3DMediator.ON_SUBMIT_TASK, var_60_0)
		else
			arg_60_0:emit(BaseUI.ON_NEW_DROP, {
				drop = var_60_5
			})
		end
	end, SFX_CONFIRM)
	setActive(var_60_4:Find("Dorm3dIconTpl/get"), not var_60_2 and var_60_1:isFinish())
	setGray(var_60_4:Find("Dorm3dIconTpl"), var_60_2)
	onButton(arg_60_0, arg_60_0._tf:Find("Main/task_done"), function()
		setActive(arg_60_0.rtWeekTask, true)
		setActive(arg_60_0._tf:Find("Main/task_done"), false)
	end)
	onButton(arg_60_0, arg_60_0.rtWeekTask:Find("title"), function()
		if var_60_2 then
			setActive(arg_60_0.rtWeekTask, false)
			setActive(arg_60_0._tf:Find("Main/task_done"), true)
		end
	end)
end

function var_0_0.CheckGuide(arg_64_0, arg_64_1)
	if pg.NewStoryMgr.GetInstance():IsPlayed(arg_64_1) then
		return
	end

	return switch(arg_64_1, {
		DORM3D_GUIDE_02 = function()
			local var_65_0 = getProxy(ApartmentProxy):getApartment(20220)

			if var_65_0 and not var_65_0:needDownload() then
				pg.m02:sendNotification(GAME.STORY_UPDATE, {
					storyId = arg_64_1
				})
				pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGuide(1, pg.NewStoryMgr.GetInstance():StoryName2StoryId(arg_64_1)))
				pg.NewGuideMgr.GetInstance():Play(arg_64_1, nil, function()
					pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGuide(2, pg.NewStoryMgr.GetInstance():StoryName2StoryId(arg_64_1)))
				end)

				return true
			end
		end,
		DORM3D_GUIDE_06 = function()
			pg.m02:sendNotification(GAME.STORY_UPDATE, {
				storyId = arg_64_1
			})
			pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGuide(1, pg.NewStoryMgr.GetInstance():StoryName2StoryId(arg_64_1)))
			pg.NewGuideMgr.GetInstance():Play(arg_64_1, nil, function()
				pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataGuide(2, pg.NewStoryMgr.GetInstance():StoryName2StoryId(arg_64_1)))
			end)

			return true
		end
	}, function()
		return false
	end)
end

function var_0_0.onBackPressed(arg_70_0)
	if isActive(arg_70_0.rtMgrPanel) then
		arg_70_0:HideMgrPanel()
	elseif isActive(arg_70_0.rtIconTip) then
		arg_70_0:HideIconTipWindow()
	else
		var_0_0.super.onBackPressed(arg_70_0)
	end
end

function var_0_0.willExit(arg_71_0)
	if isActive(arg_71_0.rtMgrPanel) then
		arg_71_0:HideMgrPanel()
	end

	if isActive(arg_71_0.rtIconTip) then
		arg_71_0:HideIconTipWindow()
	end

	if arg_71_0.clearSceneCache then
		BLHX.Rendering.EngineCore.TryDispose(true)

		local var_71_0 = typeof("BLHX.Rendering.Executor")
		local var_71_1 = ReflectionHelp.RefGetProperty(var_71_0, "Instance", nil)

		ReflectionHelp.RefCallMethod(var_71_0, "TryHandleWaitLinkList", var_71_1)
	end
end

return var_0_0
