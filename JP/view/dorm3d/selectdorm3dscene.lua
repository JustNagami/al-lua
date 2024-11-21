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
	onButton(arg_3_0, arg_3_0.rtMain:Find("btn_mgr"), function()
		arg_3_0:ShowMgrPanel()
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
	DormProxy.CheckDeviceRAMEnough()
end

function var_0_0.UpdateStamina(arg_12_0)
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
		if BLOCK_DORM3D_ROOMS and table.contains(BLOCK_DORM3D_ROOMS, arg_15_1) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_system_switch"))

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
	local var_31_2 = var_31_0:getConfig("assets_prefix")

	if var_31_0:isPersonalRoom() then
		local var_31_3 = var_31_0:getPersonalGroupId()

		GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/room_card_apartment_%d", var_31_3), "", var_31_1:Find("Image"))
		GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/room_card_apartment_name_%d", var_31_3), "", var_31_1:Find("name"))
		onButton(arg_31_0, var_31_1, function()
			arg_31_0:TryDownloadResource({
				click = true,
				roomId = arg_31_1
			}, function()
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("dorm3d_role_assets_delete", ShipGroup.getDefaultShipNameByGroupID(var_31_3)),
					onYes = function()
						if IsUnityEditor then
							pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_open"))

							return
						end

						local var_34_0 = var_31_0:getConfig("resource_name")

						DormGroupConst.DelDir("dorm3d/character/" .. string.lower(var_34_0))
						pg.TipsMgr.GetInstance():ShowTips("アセット削除が完了しました!")
					end
				})
			end)
		end, SFX_PANEL)
	else
		GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/room_card_%s", string.lower(var_31_2)), "", var_31_1:Find("Image"))
		removeOnButton(var_31_1)
	end
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
	setImageAlpha(var_35_4:Find("complete"), var_35_0:isPersonalRoom() and 1 or 0)

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

function var_0_0.UpdateSelectableCard(arg_38_0, arg_38_1, arg_38_2, arg_38_3)
	GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/room_card_apartment_%d", arg_38_2), "", arg_38_1:Find("Image"))
	GetImageSpriteFromAtlasAsync(string.format("dorm3dselect/room_card_apartment_name_%d", arg_38_2), "", arg_38_1:Find("name"))

	local var_38_0 = getProxy(ApartmentProxy):getApartment(arg_38_2)
	local var_38_1 = not var_38_0 or var_38_0:needDownload()

	setActive(arg_38_1:Find("lock"), var_38_1)
	setActive(arg_38_1:Find("mask"), var_38_1)
	setActive(arg_38_1:Find("unlock"), not var_38_1)
	setActive(arg_38_1:Find("favor_level"), var_38_0)

	if var_38_0 then
		setText(arg_38_1:Find("favor_level/Text"), var_38_0.level)
	end

	onToggle(arg_38_0, arg_38_1, function(arg_39_0)
		arg_38_3(arg_39_0)

		if arg_39_0 then
			if not var_38_0 then
				pg.TipsMgr.GetInstance():ShowTips(string.format("need unlock apartment{%d}", arg_38_2))
				triggerToggle(arg_38_1, false)
			elseif var_38_0:needDownload() then
				pg.TipsMgr.GetInstance():ShowTips(string.format("need download resource{%d}", arg_38_2))
				triggerToggle(arg_38_1, false)
			end
		end
	end, SFX_UI_CLICK)
end

function var_0_0.DownloadUpdate(arg_40_0, arg_40_1, arg_40_2)
	switch(arg_40_2, {
		start = function()
			if arg_40_0.roomDic[arg_40_1] then
				arg_40_0:UpdateIconState(arg_40_1)
			end

			if arg_40_0.cardDic and arg_40_0.cardDic[arg_40_1] then
				arg_40_0:UpdateCardState(arg_40_1)
			end
		end,
		loading = function()
			if arg_40_0.roomDic[arg_40_1] then
				local var_42_0 = DormGroupConst.DormDownloadLock

				setSlider(arg_40_0.roomDic[arg_40_1]:Find("front/loading/progress"), 0, var_42_0.totalSize, var_42_0.curSize)
			end

			if arg_40_0.cardDic and arg_40_0.cardDic[arg_40_1] then
				arg_40_0:UpdateCardProgess()
			end
		end,
		finish = function()
			for iter_43_0, iter_43_1 in pairs(arg_40_0.roomDic) do
				if iter_43_0 == arg_40_1 or pg.dorm3d_rooms[iter_43_0].type == 1 then
					arg_40_0:UpdateIconState(iter_43_0)
				end
			end

			if arg_40_0.cardDic then
				for iter_43_2, iter_43_3 in pairs(arg_40_0.cardDic) do
					if iter_43_2 == arg_40_1 or pg.dorm3d_rooms[iter_43_2].type == 1 then
						arg_40_0:UpdateCardState(iter_43_2)
					end
				end
			else
				arg_40_0:CheckGuide("DORM3D_GUIDE_02")
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
end

function var_0_0.TryDownloadResource(arg_53_0, arg_53_1, arg_53_2)
	if DormGroupConst.IsDownloading() then
		pg.TipsMgr.GetInstance():ShowTips("アセットダウンロード中です")

		return
	end

	local var_53_0 = getProxy(ApartmentProxy):getRoom(arg_53_1.roomId)
	local var_53_1, var_53_2 = var_53_0:getDownloadNameList()

	if #var_53_1 > 0 or #var_53_2 > 0 then
		local var_53_3 = {
			isShowBox = true,
			fileList = table.mergeArray(var_53_1, var_53_2),
			finishFunc = function(arg_54_0)
				if arg_54_0 then
					pg.TipsMgr.GetInstance():ShowTips("宿舎アセットのダウンロードが完了しました!")
				end

				if arg_53_0.exited then
					return
				end

				if arg_53_0.roomDic[var_53_0.configId] then
					arg_53_0:UpdateIconState(var_53_0.configId)
				end
			end,
			roomId = var_53_0.configId
		}

		DormGroupConst.DormDownload(var_53_3)
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
