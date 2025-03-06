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
	arg_10_0:FlushInsBtn()

	if not ApartmentProxy.CheckDeviceRAMEnough() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("drom3d_memory_limit_tip"))
	end
end

function var_0_0.FlushInsBtn(arg_11_0)
	arg_11_0.insBtn:Flush()
end

function var_0_0.UpdateStamina(arg_12_0)
	setText(arg_12_0.rtStamina:Find("Text"), string.format("%d/%d", getProxy(ApartmentProxy):getStamina()))
	setActive(arg_12_0.rtStamina:Find("vfx_ui_stamina01"), getProxy(ApartmentProxy):getStamina() > 0)
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
		if BLOCK_DORM3D_ROOMS and table.contains(BLOCK_DORM3D_ROOMS, arg_15_1) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_system_switch"))

			return
		end

		if arg_15_1 ~= 1 and (not getProxy(ApartmentProxy):getRoom(1) or not pg.NewStoryMgr.GetInstance():IsPlayed("DORM3D_GUIDE_02")) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_guide_tip"))

			return
		end

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
					local var_17_0 = underscore.map(string.split(PlayerPrefs.GetString(string.format("room%d_invite_list", arg_15_1), ""), "|"), function(arg_18_0)
						return tonumber(arg_18_0)
					end)

					if arg_15_0:CheckGuide("DORM3D_GUIDE_06") then
						var_17_0 = {}
					end

					arg_15_0:emit(SelectDorm3DMediator.OPEN_INVITE_LAYER, arg_15_1, var_17_0)
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
					arg_15_0:emit(SelectDorm3DMediator.ON_DORM, {
						roomId = var_16_0.id,
						groupIds = var_16_0:getInviteList()
					})
				end)
			end
		else
			assert(false)
		end
	end, SFX_PANEL)
end

function var_0_0.UpdateIconState(arg_20_0, arg_20_1)
	local var_20_0 = arg_20_0.roomDic[arg_20_1]
	local var_20_1 = getProxy(ApartmentProxy):getRoom(arg_20_1)
	local var_20_2 = var_20_1 and var_20_1:getState() or "lock"

	setActive(var_20_0:Find("icon/mask"), var_20_2 ~= "complete")
	eachChild(var_20_0:Find("front"), function(arg_21_0)
		setActive(arg_21_0, arg_21_0.name == var_20_2)
	end)
	switch(var_20_2, {
		loading = function()
			local var_22_0 = DormGroupConst.DormDownloadLock

			setSlider(var_20_0:Find("front/loading/progress"), 0, var_22_0.totalSize, var_22_0.curSize)
		end,
		complete = function()
			local var_23_0 = var_20_0:Find("front/complete")
			local var_23_1 = var_20_1:isPersonalRoom()

			setActive(var_23_0, var_23_1)

			if var_23_1 then
				local var_23_2 = getProxy(ApartmentProxy):getApartment(var_20_1:getPersonalGroupId())
				local var_23_3 = var_23_2:getIconTip(var_20_1:GetConfigID())

				eachChild(var_23_0:Find("tip"), function(arg_24_0)
					setActive(arg_24_0, arg_24_0.name == var_23_3)
				end)
				setText(var_23_0:Find("favor/Text"), var_23_2.level)
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

		local var_27_3 = iter_27_5[1]
		local var_27_4 = pg.dorm3d_dialogue_group[var_27_3]

		onButton(arg_27_0, var_27_2, function()
			arg_27_0:TryDownloadResource({
				click = true,
				roomId = var_27_4.room_id
			}, function()
				arg_27_0:emit(SelectDorm3DMediator.ON_DORM, {
					roomId = var_27_4.room_id,
					groupIds = {
						var_27_4.char_id
					},
					specialId = var_27_3
				})
			end)
		end, SFX_PANEL)
	end
end

function var_0_0.InitCardTrigger(arg_31_0, arg_31_1)
	local var_31_0 = getProxy(ApartmentProxy):getRoom(arg_31_1)

	assert(var_31_0)

	local var_31_1 = arg_31_0.cardDic[arg_31_1]

	if var_31_0:isPersonalRoom() then
		local var_31_2 = var_31_0:getPersonalGroupId()
		local var_31_3 = Apartment.New({
			ship_group = var_31_2
		}):GetSkinModelID(var_31_0:getConfig("tag"))

		GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/room_card_apartment_%d", var_31_3), "", var_31_1:Find("Image"))
		GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/room_card_apartment_name_%d", var_31_2), "", var_31_1:Find("name"))
	else
		local var_31_4 = var_31_0:getConfig("assets_prefix")

		GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/room_card_%s", string.lower(var_31_4)), "", var_31_1:Find("Image"))
	end

	onButton(arg_31_0, var_31_1, function()
		arg_31_0:TryDownloadResource({
			click = true,
			roomId = arg_31_1
		}, function()
			local var_33_0 = var_31_0:getConfig("room")

			if var_31_0:isPersonalRoom() then
				var_33_0 = ShipGroup.getDefaultShipNameByGroupID(var_31_0:getPersonalGroupId())
			end

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("dorm3d_role_assets_delete", var_33_0),
				onYes = function()
					if IsUnityEditor then
						pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_open"))

						return
					end

					if var_31_0:isPersonalRoom() then
						DormGroupConst.DelRoom(string.lower(var_31_0:getConfig("resource_name")), {
							"room",
							"apartment"
						})
					else
						DormGroupConst.DelRoom(string.lower(var_31_0:getConfig("resource_name")), {
							"room"
						})
					end

					pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_delete_finish"))
					pg.m02:sendNotification(GAME.APARTMENT_TRACK, Dorm3dTrackCommand.BuildDataDownload(var_31_0.id, 3))
					arg_31_0:DownloadUpdate(arg_31_1, "delete")
				end
			})
		end)
	end, SFX_PANEL)
end

function var_0_0.UpdateCardState(arg_35_0, arg_35_1)
	local var_35_0 = getProxy(ApartmentProxy):getRoom(arg_35_1)
	local var_35_1 = arg_35_0.cardDic[arg_35_1]
	local var_35_2 = var_35_0:getState()

	if var_35_0:isPersonalRoom() then
		setActive(var_35_1:Find("lock"), var_35_2 ~= "complete")
		setActive(var_35_1:Find("unlock"), var_35_2 == "complete")

		local var_35_3 = getProxy(ApartmentProxy):getApartment(var_35_0:getPersonalGroupId())

		setText(var_35_1:Find("favor_level/Text"), var_35_3 and var_35_3.level or "?")
	end

	local var_35_4 = var_35_1:Find("operation")

	eachChild(var_35_4, function(arg_36_0)
		setActive(arg_36_0, arg_36_0.name == var_35_2)
	end)

	if DormGroupConst.DormDownloadLock and DormGroupConst.DormDownloadLock.roomId == arg_35_1 then
		arg_35_0:UpdateCardProgess()
	end

	setActive(var_35_1:Find("mask"), var_35_2 ~= "complete")
end

function var_0_0.UpdateCardProgess(arg_37_0)
	local var_37_0 = DormGroupConst.DormDownloadLock
	local var_37_1 = arg_37_0.cardDic[var_37_0.roomId]

	setSlider(var_37_1:Find("operation/loading"), 0, var_37_0.totalSize, var_37_0.curSize)
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
				arg_38_0:UpdateIconState(iter_41_0)
			end

			if arg_38_0.cardDic then
				for iter_41_2, iter_41_3 in pairs(arg_38_0.cardDic) do
					arg_38_0:UpdateCardState(iter_41_2)
				end
			else
				arg_38_0:CheckGuide("DORM3D_GUIDE_02")
			end
		end,
		delete = function()
			if arg_38_0.roomDic[arg_38_1] then
				arg_38_0:UpdateIconState(arg_38_1)
			end

			if arg_38_0.cardDic and arg_38_0.cardDic[arg_38_1] then
				arg_38_0:UpdateCardState(arg_38_1)
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
	arg_51_0:CheckGuide("DORM3D_GUIDE_02")
end

function var_0_0.TryDownloadResource(arg_52_0, arg_52_1, arg_52_2)
	if DormGroupConst.IsDownloading() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_now_is_downloading"))

		return
	end

	local var_52_0 = getProxy(ApartmentProxy):getRoom(arg_52_1.roomId)
	local var_52_1 = var_52_0:getDownloadNameList()

	if #var_52_1 > 0 then
		local var_52_2 = {
			isShowBox = true,
			fileList = var_52_1,
			finishFunc = function(arg_53_0)
				if arg_53_0 then
					pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_resource_download_complete"))
				end
			end,
			roomId = var_52_0.configId
		}

		DormGroupConst.DormDownload(var_52_2)
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
