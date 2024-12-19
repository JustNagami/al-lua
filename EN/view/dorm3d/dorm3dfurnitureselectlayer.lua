local var_0_0 = class("Dorm3dFurnitureSelectLayer", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "Dorm3dFurnitureSelectUI"
end

var_0_0.SELECT_MODE = {
	SLOT = 1,
	FURNITURE = 2,
	NONE = 0
}

function var_0_0.init(arg_2_0)
	arg_2_0.zoneList = arg_2_0._tf:Find("ZoneList")

	setActive(arg_2_0.zoneList, false)

	local var_2_0 = arg_2_0._tf:Find("Right/Panel/Container/Furnitures")

	arg_2_0.furnitureScroll = var_2_0:Find("Scroll/Content"):GetComponent("LScrollRect")
	arg_2_0.furnitureEmpty = var_2_0:Find("Empty")
	arg_2_0.lableTrans = arg_2_0._tf:Find("Main/Label")

	setActive(arg_2_0.lableTrans, false)

	local var_2_1 = arg_2_0.furnitureScroll.prefabItem.transform

	setText(var_2_1:Find("Unfit/Icon/Text"), i18n("dorm3d_furniture_unfit"))
	setText(var_2_1:Find("Lack/Icon/Text"), i18n("ryza_tip_control_buff_not_obtain"))
end

function var_0_0.SetSceneRoot(arg_3_0, arg_3_1)
	arg_3_0.scene = arg_3_1
end

function var_0_0.SetRoom(arg_4_0, arg_4_1)
	arg_4_0.room = arg_4_1:clone()
end

function var_0_0.didEnter(arg_5_0)
	arg_5_0.allZones = arg_5_0.room:GetFurnitureZones()
	arg_5_0.globalZones = _.select(arg_5_0.allZones, function(arg_6_0)
		return arg_6_0:IsGlobal()
	end)
	arg_5_0.normalZones = _.select(arg_5_0.allZones, function(arg_7_0)
		return not arg_7_0:IsGlobal()
	end)

	local var_5_0 = arg_5_0.normalZones

	arg_5_0.zoneIndex = 1

	local var_5_1 = arg_5_0.scene:GetAttachedFurnitureName()

	if var_5_1 then
		table.Ipairs(var_5_0, function(arg_8_0, arg_8_1)
			if arg_8_1:GetWatchCameraName() == var_5_1 then
				arg_5_0.zoneIndex = arg_8_0
			end
		end)
	end

	onButton(arg_5_0, arg_5_0._tf:Find("Right/Panel/Container/Zone/ZoneContainer/Switch"), function()
		setActive(arg_5_0.zoneList, true)
	end, SFX_PANEL)
	setActive(arg_5_0._tf:Find("Right/Panel/Container/Zone/ZoneContainer/Switch/New"), false)
	onButton(arg_5_0, arg_5_0.zoneList:Find("Mask"), function()
		setActive(arg_5_0.zoneList, false)
	end)
	onButton(arg_5_0, arg_5_0._tf:Find("Top/Back"), function()
		arg_5_0:onBackPressed()
	end)
	onButton(arg_5_0, arg_5_0._tf:Find("Right/Save"), function()
		arg_5_0:ShowReplaceWindow()
	end, SFX_PANEL)

	local function var_5_2(arg_13_0)
		arg_5_0._tf:Find("Right/Popup"):GetComponent(typeof(Image)).raycastTarget = not arg_13_0
		arg_5_0._tf:Find("Right/Collapse"):GetComponent(typeof(Image)).raycastTarget = arg_13_0

		if arg_13_0 then
			quickPlayAnimation(arg_5_0._tf, "anim_dorm3d_furniture_in")
		else
			quickPlayAnimation(arg_5_0._tf, "anim_dorm3d_furniture_hide")
		end
	end

	arg_5_0._tf:Find("Right/Popup"):GetComponent(typeof(Image)).raycastTarget = false
	arg_5_0._tf:Find("Right/Collapse"):GetComponent(typeof(Image)).raycastTarget = true

	onButton(arg_5_0, arg_5_0._tf:Find("Right/Popup"), function()
		var_5_2(true)
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0._tf:Find("Right/Collapse"), function()
		var_5_2(false)
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0._tf:Find("Right/Auto"), function()
		arg_5_0:AutoReplaceFurniture()
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.lableTrans, function()
		arg_5_0:CleanSlot()
	end, "ui-dorm_furniture_removal")

	arg_5_0.furnitureItems = {}

	function arg_5_0.furnitureScroll.onUpdateItem(arg_18_0, arg_18_1)
		arg_18_0 = arg_18_0 + 1
		arg_5_0.furnitureItems[arg_18_0] = arg_18_1

		arg_5_0:UpdateViewFurnitureItem(arg_18_0)
	end

	function arg_5_0.furnitureScroll.onReturnItem(arg_19_0, arg_19_1)
		if arg_5_0.exited then
			return
		end

		arg_19_0 = arg_19_0 + 1
		arg_5_0.furnitureItems[arg_19_0] = nil
	end

	arg_5_0.replaceFurnitures = {}

	arg_5_0:UpdateDataZone()
	arg_5_0:InitViewZoneList()
	arg_5_0:InitViewTypeList()
	arg_5_0.scene:EnterFurnitureWatchMode()
	arg_5_0.scene:SwitchFurnitureZone(arg_5_0.normalZones[arg_5_0.zoneIndex])
	onNextTick(function()
		arg_5_0.furnitureScroll.enabled = true

		arg_5_0:UpdateView()
	end)
end

function var_0_0.UpdateDataZone(arg_21_0)
	local var_21_0 = arg_21_0.normalZones[arg_21_0.zoneIndex]
	local var_21_1 = {
		var_21_0,
		unpack(arg_21_0.globalZones)
	}
	local var_21_2 = _.reduce(var_21_1, {}, function(arg_22_0, arg_22_1)
		table.insertto(arg_22_0, arg_22_1:GetSlots())

		return arg_22_0
	end)
	local var_21_3 = {}
	local var_21_4 = 99

	_.each(var_21_2, function(arg_23_0)
		var_21_3[arg_23_0:GetType()] = true
		var_21_4 = math.min(var_21_4, arg_23_0:GetType())
	end)

	arg_21_0.activeFurnitureTypes = _.keys(var_21_3)

	var_21_0:SortTypes(arg_21_0.activeFurnitureTypes)

	arg_21_0.furnitureType = arg_21_0.activeFurnitureTypes[1]

	arg_21_0:UpdateDataDisplayFurnitures()
end

function var_0_0.UpdateDataDisplayFurnitures(arg_24_0)
	local var_24_0 = arg_24_0.room
	local var_24_1 = arg_24_0.furnitureType

	arg_24_0.selectMode = var_0_0.SELECT_MODE.NONE
	arg_24_0.selectFurnitureId = nil
	arg_24_0.selectSlotId = nil

	local var_24_2 = arg_24_0.normalZones[arg_24_0.zoneIndex]
	local var_24_3 = {
		var_24_2,
		unpack(arg_24_0.globalZones)
	}
	local var_24_4 = _.reduce(var_24_3, {}, function(arg_25_0, arg_25_1)
		table.insertto(arg_25_0, arg_25_1:GetSlots())

		return arg_25_0
	end)
	local var_24_5 = var_24_0:GetFurnitureIDList()
	local var_24_6 = var_24_0:GetFurnitures()
	local var_24_7 = {}
	local var_24_8 = {}

	_.each(var_24_5, function(arg_26_0)
		local var_26_0 = Dorm3dFurniture.New({
			configId = arg_26_0
		})

		if var_26_0:GetType() ~= var_24_1 then
			return
		end

		if not _.any(var_24_4, function(arg_27_0)
			return arg_27_0:CanUseFurniture(var_26_0)
		end) then
			return
		end

		table.insert(var_24_8, {
			useable = 0,
			count = 0,
			id = arg_26_0,
			template = var_26_0
		})

		var_24_7[arg_26_0] = #var_24_8
	end)
	_.each(var_24_6, function(arg_28_0)
		if arg_28_0:GetType() ~= var_24_1 then
			return
		end

		if not _.any(var_24_4, function(arg_29_0)
			return arg_29_0:CanUseFurniture(arg_28_0)
		end) then
			return
		end

		local var_28_0 = arg_28_0:GetConfigID()
		local var_28_1 = var_24_8[var_24_7[var_28_0]]

		var_28_1.count = var_28_1.count + 1

		if arg_28_0:GetSlotID() == 0 then
			var_28_1.useable = var_28_1.useable + 1
		end
	end)

	var_24_8 = _.filter(var_24_8, function(arg_30_0)
		return arg_30_0.count > 0 or arg_30_0.template:InShopTime()
	end)
	arg_24_0.displayFurnitures = var_24_8

	arg_24_0:FilterDataFurnitures()
end

function var_0_0.FilterDataFurnitures(arg_31_0)
	local var_31_0 = {
		function(arg_32_0)
			return arg_32_0.useable > 0 and 0 or 1
		end,
		function(arg_33_0)
			return -arg_33_0.template:GetRarity()
		end,
		function(arg_34_0)
			return -arg_34_0.id
		end
	}

	if arg_31_0.selectMode == var_0_0.SELECT_MODE.SLOT then
		local var_31_1 = Dorm3dFurnitureSlot.New({
			configId = arg_31_0.selectSlotId
		})

		_.each(arg_31_0.displayFurnitures, function(arg_35_0)
			local var_35_0 = arg_35_0.template

			arg_35_0.fit = var_31_1:CanUseFurniture(var_35_0)
		end)
		table.insert(var_31_0, function(arg_36_0)
			return arg_36_0.fit and 0 or 1
		end)
	end

	table.sort(arg_31_0.displayFurnitures, CompareFuncs(var_31_0))
end

function var_0_0.InitViewZoneList(arg_37_0)
	local var_37_0 = arg_37_0.normalZones

	UIItemList.StaticAlign(arg_37_0.zoneList:Find("List"), arg_37_0.zoneList:Find("List"):GetChild(0), #var_37_0, function(arg_38_0, arg_38_1, arg_38_2)
		if arg_38_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_38_1 = arg_38_1 + 1

		local var_38_0 = var_37_0[arg_38_1]

		arg_38_2.name = var_38_0:GetWatchCameraName()

		setText(arg_38_2:Find("Name"), var_38_0:GetName())
		onButton(arg_37_0, arg_38_2, function()
			arg_37_0.zoneIndex = arg_38_1

			arg_37_0:UpdateDataZone()
			arg_37_0.scene:SwitchFurnitureZone(var_38_0)
			arg_37_0:InitViewTypeList()
			arg_37_0:UpdateView()
			quickPlayAnimation(arg_37_0._tf, "anim_dorm3d_furniture_change")
			setActive(arg_37_0.zoneList, false)
		end, SFX_PANEL)
		setActive(arg_38_2:Find("Line"), arg_38_1 < #var_37_0)
		setActive(arg_38_2:Find("New"), false)
	end)
end

function var_0_0.InitViewTypeList(arg_40_0)
	UIItemList.StaticAlign(arg_40_0._tf:Find("Right/Panel/Container/Types"), arg_40_0._tf:Find("Right/Panel/Container/Types"):GetChild(0), #arg_40_0.activeFurnitureTypes, function(arg_41_0, arg_41_1, arg_41_2)
		if arg_41_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_41_1 = arg_41_1 + 1

		local var_41_0 = arg_40_0.activeFurnitureTypes[arg_41_1]

		setText(arg_41_2:Find("Name"), i18n(Dorm3dFurniture.TYPE2NAME[var_41_0]))
		onButton(arg_40_0, arg_41_2, function()
			if arg_40_0.furnitureType == var_41_0 then
				return
			end

			arg_40_0.furnitureType = var_41_0

			arg_40_0:UpdateDataDisplayFurnitures()
			arg_40_0:UpdateView()
			quickPlayAnimation(arg_40_0._tf, "anim_dorm3d_furniture_change")
			setActive(arg_40_0.zoneList, false)
		end, SFX_PANEL)
	end)
end

function var_0_0.UpdateView(arg_43_0)
	local var_43_0 = arg_43_0.normalZones
	local var_43_1 = var_43_0[arg_43_0.zoneIndex]

	setText(arg_43_0._tf:Find("Right/Panel/Container/Zone/ZoneContainer/Name"), var_43_1:GetName())
	UIItemList.StaticAlign(arg_43_0.zoneList:Find("List"), arg_43_0.zoneList:Find("List"):GetChild(0), #var_43_0, function(arg_44_0, arg_44_1, arg_44_2)
		if arg_44_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_44_1 = arg_44_1 + 1

		local var_44_0 = arg_44_2:Find("Name"):GetComponent(typeof(Text)).color
		local var_44_1 = arg_43_0.zoneIndex == arg_44_1 and Color.NewHex("39bfff") or Color.white

		var_44_1.a = var_44_0.a

		setTextColor(arg_44_2:Find("Name"), var_44_1)
		setActive(arg_44_2:Find("New"), false)
	end)
	;(function()
		local var_45_0 = arg_43_0.room:GetFurnitures()
		local var_45_1 = false

		table.Ipairs(arg_43_0.normalZones, function(arg_46_0, arg_46_1)
			local var_46_0 = false

			if arg_46_1 ~= var_43_1 then
				var_46_0 = _.any(arg_46_1:GetSlots(), function(arg_47_0)
					return _.any(var_45_0, function(arg_48_0)
						if not arg_47_0:CanUseFurniture(arg_48_0) then
							return
						end

						return Dorm3dFurniture.GetViewedFlag(arg_48_0:GetConfigID()) == 0
					end)
				end)
			end

			setActive(arg_43_0.zoneList:Find("List"):GetChild(arg_46_0 - 1):Find("New"), var_46_0)

			var_45_1 = var_45_1 or var_46_0
		end)
		setActive(arg_43_0._tf:Find("Right/Panel/Container/Zone/ZoneContainer/Switch/New"), var_45_1)
	end)()
	setActive(arg_43_0._tf:Find("Right/Panel/Container/Types"), #arg_43_0.activeFurnitureTypes > 1)
	UIItemList.StaticAlign(arg_43_0._tf:Find("Right/Panel/Container/Types"), arg_43_0._tf:Find("Right/Panel/Container/Types"):GetChild(0), #arg_43_0.activeFurnitureTypes, function(arg_49_0, arg_49_1, arg_49_2)
		if arg_49_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_49_1 = arg_49_1 + 1

		local var_49_0 = arg_43_0.activeFurnitureTypes[arg_49_1]

		setActive(arg_49_2:Find("Selected"), arg_43_0.furnitureType == var_49_0)
	end)

	arg_43_0.furnitureItems = {}

	arg_43_0.furnitureScroll:SetTotalCount(#arg_43_0.displayFurnitures)
	setActive(arg_43_0.furnitureEmpty, #arg_43_0.displayFurnitures == 0)

	if arg_43_0.timerRefreshShop then
		arg_43_0.timerRefreshShop:Stop()
	end

	arg_43_0.timerRefreshShop = Timer.New(function()
		table.Foreach(arg_43_0.furnitureItems, function(arg_51_0, arg_51_1)
			arg_43_0:UpdateViewFurnitureItem(arg_51_0)
		end)
	end, 1, -1)

	arg_43_0.timerRefreshShop:Start()

	local var_43_2 = {}
	local var_43_3 = arg_43_0.furnitureType
	local var_43_4 = {
		var_43_1,
		unpack(arg_43_0.globalZones)
	}
	local var_43_5 = _.reduce(var_43_4, {}, function(arg_52_0, arg_52_1)
		table.insertto(arg_52_0, arg_52_1:GetSlots())

		return arg_52_0
	end)
	local var_43_6 = _.select(var_43_5, function(arg_53_0)
		return arg_53_0:GetType() == var_43_3
	end)

	_.each(var_43_6, function(arg_54_0)
		local var_54_0 = arg_54_0:GetConfigID()

		if arg_43_0.selectMode == var_0_0.SELECT_MODE.NONE then
			var_43_2[var_54_0] = 0
		elseif arg_43_0.selectMode == var_0_0.SELECT_MODE.FURNITURE then
			local var_54_1 = arg_54_0:CanUseFurniture(Dorm3dFurniture.New({
				configId = arg_43_0.selectFurnitureId
			}))

			var_43_2[var_54_0] = var_54_1 and 1 or 2
		elseif arg_43_0.selectMode == var_0_0.SELECT_MODE.SLOT then
			var_43_2[var_54_0] = arg_43_0.selectSlotId == var_54_0 and 1 or 0
		end
	end)

	local var_43_7 = false

	if arg_43_0.selectMode == var_0_0.SELECT_MODE.SLOT then
		local var_43_8 = Dorm3dFurnitureSlot.New({
			configId = arg_43_0.selectSlotId
		})

		if var_43_8:GetType() == Dorm3dFurniture.TYPE.DECORATION then
			local var_43_9 = arg_43_0.room:GetFurnitures()

			if _.detect(var_43_9, function(arg_55_0)
				return arg_55_0:GetSlotID() == var_43_8:GetConfigID()
			end) then
				local var_43_10 = arg_43_0.scene:GetSlotByID(var_43_8:GetConfigID())
				local var_43_11 = arg_43_0.scene:GetScreenPosition(var_43_10.position)
				local var_43_12 = arg_43_0.scene:GetLocalPosition(var_43_11, arg_43_0.lableTrans.parent)

				setLocalPosition(arg_43_0.lableTrans, var_43_12)

				var_43_7 = true
			end
		end
	end

	setActive(arg_43_0.lableTrans, var_43_7)
	arg_43_0.scene:DisplayFurnitureSlots(_.map(var_43_6, function(arg_56_0)
		return arg_56_0:GetConfigID()
	end))
	arg_43_0.scene:UpdateDisplaySlots(var_43_2)
	arg_43_0.scene:RefreshSlots(arg_43_0.room)
end

function var_0_0.UpdateViewFurnitureItem(arg_57_0, arg_57_1)
	local var_57_0 = arg_57_0.furnitureItems[arg_57_1]
	local var_57_1 = arg_57_0.displayFurnitures[arg_57_1]

	if not var_57_0 then
		return
	end

	local var_57_2 = tf(var_57_0)

	var_57_2.name = var_57_1.id

	updateDorm3dIcon(var_57_2:Find("Item/Dorm3dIconTpl"), Drop.New({
		type = DROP_TYPE_DORM3D_FURNITURE,
		id = var_57_1.id,
		count = var_57_1.count
	}))
	setText(var_57_2:Find("Item/Name"), var_57_1.template:GetName())

	local var_57_3 = i18n("dorm3d_furniture_count", var_57_1.useable .. "/" .. var_57_1.count)

	if var_57_1.useable < var_57_1.count then
		var_57_3 = i18n("dorm3d_furniture_used") .. var_57_3
	elseif var_57_1.count == 0 then
		var_57_3 = i18n("dorm3d_furniture_lack") .. var_57_3
	end

	setText(var_57_2:Find("Item/Count"), var_57_3)
	setActive(var_57_2:Find("Selected"), arg_57_0.selectFurnitureId == var_57_1.id)

	local var_57_4 = arg_57_0.selectMode == var_0_0.SELECT_MODE.SLOT and not var_57_1.fit

	setActive(var_57_2:Find("Unfit"), var_57_4)
	setCanvasGroupAlpha(var_57_2:Find("Item"), var_57_4 and 0.4 or 1)

	local var_57_5 = var_57_1.template:IsValuable()
	local var_57_6 = var_57_1.template:IsSpecial()
	local var_57_7 = 0

	if var_57_6 then
		var_57_7 = 2
	elseif var_57_5 then
		var_57_7 = 1
	end

	setActive(var_57_2:Find("Item/BG/Pro"), var_57_7 == 1)
	setActive(var_57_2:Find("Item/LabelPro"), var_57_7 == 1)
	setActive(var_57_2:Find("Item/BG/SP"), var_57_7 == 2)
	setActive(var_57_2:Find("Item/LabelSP"), var_57_7 == 2)
	setActive(var_57_2:Find("Item/Action"), false)

	local var_57_8 = var_57_1.template:GetEndTime()
	local var_57_9 = var_57_8 > 0 and var_57_8 > pg.TimeMgr.GetInstance():GetServerTime()

	setActive(var_57_2:Find("TimeLimit"), var_57_9)

	if var_57_9 then
		setText(var_57_2:Find("TimeLimit/Text"), skinCommdityTimeStamp(var_57_8))
	end

	onButton(arg_57_0, var_57_2:Find("Item/Tip"), function()
		arg_57_0:emit(Dorm3dFurnitureSelectMediator.SHOW_FURNITURE_ACESSES, {
			showGOBtn = true,
			title = i18n("courtyard_label_detail"),
			drop = {
				type = DROP_TYPE_DORM3D_FURNITURE,
				id = var_57_1.id,
				count = var_57_1.count
			},
			list = var_57_1.template:GetAcesses()
		})
	end, SFX_PANEL)
	setActive(var_57_2:Find("Item/New"), var_57_1.count > 0 and Dorm3dFurniture.GetViewedFlag(var_57_1.id) == 0)
	onButton(arg_57_0, var_57_2, function()
		if var_57_1.count > 0 then
			Dorm3dFurniture.SetViewedFlag(var_57_1.id)
			setActive(var_57_2:Find("Item/New"), false)
		end

		local var_59_0 = var_57_1.template:GetType()

		local function var_59_1()
			local var_60_0 = _.detect(arg_57_0.globalZones[1]:GetSlots(), function(arg_61_0)
				return arg_61_0:GetType() == var_59_0
			end)

			if not var_60_0 then
				return
			end

			arg_57_0.room:ReplaceFurniture(var_60_0:GetConfigID(), var_57_1.id)
			table.insert(arg_57_0.replaceFurnitures, {
				slotId = var_60_0:GetConfigID(),
				furnitureId = var_57_1.id
			})
			arg_57_0:UpdateDataDisplayFurnitures()
			pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_furniture_placement")
		end

		if arg_57_0.selectMode == var_0_0.SELECT_MODE.NONE then
			if var_57_1.useable > 0 then
				if var_59_0 == Dorm3dFurniture.TYPE.FLOOR or var_59_0 == Dorm3dFurniture.TYPE.WALLPAPER then
					var_59_1()
				else
					arg_57_0.selectMode = var_0_0.SELECT_MODE.FURNITURE
					arg_57_0.selectFurnitureId = var_57_1.id
				end

				arg_57_0:UpdateView()
			end

			return
		end

		if arg_57_0.selectMode == var_0_0.SELECT_MODE.SLOT then
			if var_57_1.fit and var_57_1.useable > 0 then
				arg_57_0.room:ReplaceFurniture(arg_57_0.selectSlotId, var_57_1.id)
				table.insert(arg_57_0.replaceFurnitures, {
					slotId = arg_57_0.selectSlotId,
					furnitureId = var_57_1.id
				})
				arg_57_0:UpdateDataDisplayFurnitures()
				arg_57_0:UpdateView()
				pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_furniture_placement")
			end

			return
		end

		if arg_57_0.selectMode == var_0_0.SELECT_MODE.FURNITURE then
			if arg_57_0.selectFurnitureId == var_57_1.id then
				arg_57_0.selectMode = var_0_0.SELECT_MODE.NONE
				arg_57_0.selectFurnitureId = nil

				arg_57_0:UpdateView()
			elseif var_57_1.useable > 0 then
				if var_59_0 == Dorm3dFurniture.TYPE.FLOOR or var_59_0 == Dorm3dFurniture.TYPE.WALLPAPER then
					var_59_1()
				else
					arg_57_0.selectFurnitureId = var_57_1.id

					arg_57_0:UpdateView()
				end
			end

			return
		end
	end)

	local var_57_10 = var_57_1.count == 0 and var_57_1.template:GetShopID() or 0

	setActive(var_57_2:Find("GO"), var_57_10 ~= 0)

	if var_57_10 ~= 0 then
		local var_57_11 = CommonCommodity.New({
			id = var_57_10
		}, Goods.TYPE_SHOPSTREET)
		local var_57_12, var_57_13, var_57_14 = var_57_11:GetPrice()
		local var_57_15 = Drop.New({
			type = DROP_TYPE_RESOURCE,
			id = var_57_11:GetResType(),
			count = var_57_12
		})
		local var_57_16 = pg.shop_template[var_57_10]

		onButton(arg_57_0, var_57_2:Find("GO"), function()
			local var_62_0 = var_57_1.template:GetEndTime()

			arg_57_0:emit(Dorm3dFurnitureSelectMediator.SHOW_SHOPPING_CONFIRM_WINDOW, {
				content = {
					icon = "<icon name=" .. var_57_11:GetResIcon() .. " w=1.1 h=1.1/>",
					off = var_57_13,
					cost = "x" .. var_57_15.count,
					old = var_57_14,
					name = var_57_1.template:GetName()
				},
				tip = i18n("dorm3d_shop_gift_tip"),
				drop = var_57_1.template,
				endTime = var_62_0,
				onYes = function()
					if not var_57_1.template:InShopTime() then
						pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_purchase_outtime"))

						return
					end

					arg_57_0:emit(GAME.SHOPPING, {
						silentTip = true,
						count = 1,
						shopId = var_57_10
					})
				end
			})
		end, SFX_PANEL)
	end
end

function var_0_0.OnClickFurnitureSlot(arg_64_0, arg_64_1)
	if arg_64_0.selectMode == var_0_0.SELECT_MODE.FURNITURE then
		local var_64_0 = _.detect(arg_64_0.displayFurnitures, function(arg_65_0)
			return arg_65_0.id == arg_64_0.selectFurnitureId
		end)
		local var_64_1 = Dorm3dFurnitureSlot.New({
			configId = arg_64_1
		})

		if var_64_0 and var_64_0.useable > 0 and var_64_1:CanUseFurniture(var_64_0.template) then
			arg_64_0.room:ReplaceFurniture(arg_64_1, var_64_0.id)
			table.insert(arg_64_0.replaceFurnitures, {
				slotId = arg_64_1,
				furnitureId = var_64_0.id
			})
			arg_64_0:UpdateDataDisplayFurnitures()
			pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_furniture_placement")
		else
			return
		end
	elseif arg_64_0.selectMode == var_0_0.SELECT_MODE.NONE then
		arg_64_0.selectMode = var_0_0.SELECT_MODE.SLOT
		arg_64_0.selectSlotId = arg_64_1

		arg_64_0:FilterDataFurnitures()
	elseif arg_64_0.selectMode == var_0_0.SELECT_MODE.SLOT then
		if arg_64_0.selectSlotId == arg_64_1 then
			arg_64_0.selectMode = var_0_0.SELECT_MODE.NONE
			arg_64_0.selectSlotId = nil
		else
			arg_64_0.selectSlotId = arg_64_1
		end

		arg_64_0:FilterDataFurnitures()
	end

	arg_64_0:UpdateView()
end

function var_0_0.CleanSlot(arg_66_0)
	if arg_66_0.selectMode ~= var_0_0.SELECT_MODE.SLOT then
		return
	end

	local var_66_0 = arg_66_0.selectSlotId

	arg_66_0.room:ReplaceFurniture(var_66_0, 0)
	table.insert(arg_66_0.replaceFurnitures, {
		furnitureId = 0,
		slotId = var_66_0
	})
	arg_66_0:UpdateDataDisplayFurnitures()
	arg_66_0:UpdateView()
end

function var_0_0.OnReplaceFurnitureDone(arg_67_0)
	arg_67_0.replaceFurnitures = {}

	existCall(arg_67_0.replaceFurnitureCallback)

	arg_67_0.replaceFurnitureCallback = nil
end

function var_0_0.OnReplaceFurnitureError(arg_68_0)
	arg_68_0.replaceFurnitureCallback = nil
end

function var_0_0.AutoReplaceFurniture(arg_69_0)
	local var_69_0 = arg_69_0.normalZones[arg_69_0.zoneIndex]:GetSlots()

	_.each(var_69_0, function(arg_70_0)
		if arg_70_0:GetType() == Dorm3dFurniture.TYPE.FLOOR or arg_70_0:GetType() == Dorm3dFurniture.TYPE.WALLPAPER then
			return
		end

		local var_70_0 = arg_69_0.room:GetFurnitures()
		local var_70_1 = _.detect(var_70_0, function(arg_71_0)
			return arg_71_0:GetSlotID() == arg_70_0:GetConfigID()
		end)

		if var_70_1 and var_70_1:GetConfigID() ~= arg_70_0:GetDefaultFurniture() then
			return
		end

		local var_70_2 = table.shallowCopy(var_70_0)
		local var_70_3 = {
			function(arg_72_0)
				return arg_72_0:GetSlotID() == 0 and arg_70_0:CanUseFurniture(arg_72_0) and 0 or 1
			end,
			function(arg_73_0)
				return -arg_73_0:GetRarity()
			end,
			function(arg_74_0)
				return -arg_74_0:GetConfigID()
			end
		}

		table.sort(var_70_2, CompareFuncs(var_70_3))

		local var_70_4 = var_70_2[1]

		if not var_70_4 or var_70_4:GetSlotID() ~= 0 or not arg_70_0:CanUseFurniture(var_70_4) then
			return
		end

		arg_69_0.room:ReplaceFurniture(arg_70_0:GetConfigID(), var_70_4:GetConfigID())
		table.insert(arg_69_0.replaceFurnitures, {
			slotId = arg_70_0:GetConfigID(),
			furnitureId = var_70_4:GetConfigID()
		})
	end)
	arg_69_0:UpdateDataDisplayFurnitures()
	arg_69_0:UpdateView()
end

function var_0_0.ShowReplaceWindow(arg_75_0, arg_75_1, arg_75_2)
	local var_75_0 = arg_75_0.replaceFurnitures

	if #var_75_0 == 0 then
		return existCall(arg_75_1)
	end

	arg_75_0:emit(Dorm3dFurnitureSelectMediator.SHOW_CONFIRM_WINDOW, {
		title = i18n("title_info"),
		content = i18n("dorm3d_furniture_sure_save"),
		onYes = function()
			arg_75_0:emit(GAME.APARTMENT_REPLACE_FURNITURE, {
				roomId = arg_75_0.room:GetConfigID(),
				furnitures = var_75_0
			})

			arg_75_0.replaceFurnitureCallback = arg_75_1
		end,
		onNo = arg_75_2
	})
end

function var_0_0.onBackPressed(arg_77_0)
	seriesAsync({
		function(arg_78_0)
			arg_77_0:ShowReplaceWindow(arg_78_0, arg_78_0)
		end,
		function(arg_79_0)
			var_0_0.super.onBackPressed(arg_77_0)
		end
	})
end

function var_0_0.willExit(arg_80_0)
	arg_80_0.furnitureScroll.enabled = false

	if arg_80_0.timerRefreshShop then
		arg_80_0.timerRefreshShop:Stop()
	end

	arg_80_0.scene:ExitFurnitureWatchMode()
end

return var_0_0
