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

function var_0_0.UpdateDataZone(arg_20_0)
	local var_20_0 = arg_20_0.normalZones[arg_20_0.zoneIndex]
	local var_20_1 = {
		var_20_0,
		unpack(arg_20_0.globalZones)
	}
	local var_20_2 = _.reduce(var_20_1, {}, function(arg_21_0, arg_21_1)
		table.insertto(arg_21_0, arg_21_1:GetSlots())

		return arg_21_0
	end)
	local var_20_3 = {}
	local var_20_4 = 99

	_.each(var_20_2, function(arg_22_0)
		var_20_3[arg_22_0:GetType()] = true
		var_20_4 = math.min(var_20_4, arg_22_0:GetType())
	end)

	arg_20_0.activeFurnitureTypes = _.keys(var_20_3)

	var_20_0:SortTypes(arg_20_0.activeFurnitureTypes)

	arg_20_0.furnitureType = arg_20_0.activeFurnitureTypes[1]

	arg_20_0:UpdateDataDisplayFurnitures()
end

function var_0_0.UpdateDataDisplayFurnitures(arg_23_0)
	local var_23_0 = arg_23_0.room
	local var_23_1 = arg_23_0.furnitureType

	arg_23_0.selectMode = var_0_0.SELECT_MODE.NONE
	arg_23_0.selectFurnitureId = nil
	arg_23_0.selectSlotId = nil

	local var_23_2 = arg_23_0.normalZones[arg_23_0.zoneIndex]
	local var_23_3 = {
		var_23_2,
		unpack(arg_23_0.globalZones)
	}
	local var_23_4 = _.reduce(var_23_3, {}, function(arg_24_0, arg_24_1)
		table.insertto(arg_24_0, arg_24_1:GetSlots())

		return arg_24_0
	end)
	local var_23_5 = var_23_0:GetFurnitureIDList()
	local var_23_6 = var_23_0:GetFurnitures()
	local var_23_7 = {}
	local var_23_8 = {}

	_.each(var_23_5, function(arg_25_0)
		local var_25_0 = Dorm3dFurniture.New({
			configId = arg_25_0
		})

		if var_25_0:GetType() ~= var_23_1 then
			return
		end

		if not _.any(var_23_4, function(arg_26_0)
			return arg_26_0:CanUseFurniture(var_25_0)
		end) then
			return
		end

		table.insert(var_23_8, {
			useable = 0,
			count = 0,
			id = arg_25_0,
			template = var_25_0
		})

		var_23_7[arg_25_0] = #var_23_8
	end)
	_.each(var_23_6, function(arg_27_0)
		if arg_27_0:GetType() ~= var_23_1 then
			return
		end

		if not _.any(var_23_4, function(arg_28_0)
			return arg_28_0:CanUseFurniture(arg_27_0)
		end) then
			return
		end

		local var_27_0 = arg_27_0:GetConfigID()
		local var_27_1 = var_23_8[var_23_7[var_27_0]]

		var_27_1.count = var_27_1.count + 1

		if arg_27_0:GetSlotID() == 0 then
			var_27_1.useable = var_27_1.useable + 1
		end
	end)

	arg_23_0.displayFurnitures = var_23_8

	arg_23_0:FilterDataFurnitures()
end

function var_0_0.FilterDataFurnitures(arg_29_0)
	local var_29_0 = {
		function(arg_30_0)
			return arg_30_0.useable > 0 and 0 or 1
		end,
		function(arg_31_0)
			return -arg_31_0.template:GetRarity()
		end,
		function(arg_32_0)
			return -arg_32_0.id
		end
	}

	if arg_29_0.selectMode == var_0_0.SELECT_MODE.SLOT then
		local var_29_1 = Dorm3dFurnitureSlot.New({
			configId = arg_29_0.selectSlotId
		})

		_.each(arg_29_0.displayFurnitures, function(arg_33_0)
			local var_33_0 = arg_33_0.template

			arg_33_0.fit = var_29_1:CanUseFurniture(var_33_0)
		end)
		table.insert(var_29_0, function(arg_34_0)
			return arg_34_0.fit and 0 or 1
		end)
	end

	table.sort(arg_29_0.displayFurnitures, CompareFuncs(var_29_0))
end

function var_0_0.InitViewZoneList(arg_35_0)
	local var_35_0 = arg_35_0.normalZones

	UIItemList.StaticAlign(arg_35_0.zoneList:Find("List"), arg_35_0.zoneList:Find("List"):GetChild(0), #var_35_0, function(arg_36_0, arg_36_1, arg_36_2)
		if arg_36_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_36_1 = arg_36_1 + 1

		local var_36_0 = var_35_0[arg_36_1]

		arg_36_2.name = var_36_0:GetWatchCameraName()

		setText(arg_36_2:Find("Name"), var_36_0:GetName())
		onButton(arg_35_0, arg_36_2, function()
			arg_35_0.zoneIndex = arg_36_1

			arg_35_0:UpdateDataZone()
			arg_35_0.scene:SwitchFurnitureZone(var_36_0)
			arg_35_0:InitViewTypeList()
			arg_35_0:UpdateView()
			quickPlayAnimation(arg_35_0._tf, "anim_dorm3d_furniture_change")
			setActive(arg_35_0.zoneList, false)
		end, SFX_PANEL)
		setActive(arg_36_2:Find("Line"), arg_36_1 < #var_35_0)
		setActive(arg_36_2:Find("New"), false)
	end)
end

function var_0_0.InitViewTypeList(arg_38_0)
	UIItemList.StaticAlign(arg_38_0._tf:Find("Right/Panel/Container/Types"), arg_38_0._tf:Find("Right/Panel/Container/Types"):GetChild(0), #arg_38_0.activeFurnitureTypes, function(arg_39_0, arg_39_1, arg_39_2)
		if arg_39_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_39_1 = arg_39_1 + 1

		local var_39_0 = arg_38_0.activeFurnitureTypes[arg_39_1]

		setText(arg_39_2:Find("Name"), i18n(Dorm3dFurniture.TYPE2NAME[var_39_0]))
		onButton(arg_38_0, arg_39_2, function()
			if arg_38_0.furnitureType == var_39_0 then
				return
			end

			arg_38_0.furnitureType = var_39_0

			arg_38_0:UpdateDataDisplayFurnitures()
			arg_38_0:UpdateView()
			quickPlayAnimation(arg_38_0._tf, "anim_dorm3d_furniture_change")
			setActive(arg_38_0.zoneList, false)
		end, SFX_PANEL)
	end)
end

function var_0_0.UpdateView(arg_41_0)
	local var_41_0 = arg_41_0.normalZones
	local var_41_1 = var_41_0[arg_41_0.zoneIndex]

	setText(arg_41_0._tf:Find("Right/Panel/Container/Zone/ZoneContainer/Name"), var_41_1:GetName())
	UIItemList.StaticAlign(arg_41_0.zoneList:Find("List"), arg_41_0.zoneList:Find("List"):GetChild(0), #var_41_0, function(arg_42_0, arg_42_1, arg_42_2)
		if arg_42_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_42_1 = arg_42_1 + 1

		local var_42_0 = arg_42_2:Find("Name"):GetComponent(typeof(Text)).color
		local var_42_1 = arg_41_0.zoneIndex == arg_42_1 and Color.NewHex("39bfff") or Color.white

		var_42_1.a = var_42_0.a

		setTextColor(arg_42_2:Find("Name"), var_42_1)
		setActive(arg_42_2:Find("New"), false)
	end)
	;(function()
		local var_43_0 = arg_41_0.room:GetFurnitures()
		local var_43_1 = false

		table.Ipairs(arg_41_0.normalZones, function(arg_44_0, arg_44_1)
			local var_44_0 = false

			if arg_44_1 ~= var_41_1 then
				var_44_0 = _.any(arg_44_1:GetSlots(), function(arg_45_0)
					return _.any(var_43_0, function(arg_46_0)
						if not arg_45_0:CanUseFurniture(arg_46_0) then
							return
						end

						return Dorm3dFurniture.GetViewedFlag(arg_46_0:GetConfigID()) == 0
					end)
				end)
			end

			setActive(arg_41_0.zoneList:Find("List"):GetChild(arg_44_0 - 1):Find("New"), var_44_0)

			var_43_1 = var_43_1 or var_44_0
		end)
		setActive(arg_41_0._tf:Find("Right/Panel/Container/Zone/ZoneContainer/Switch/New"), var_43_1)
	end)()
	setActive(arg_41_0._tf:Find("Right/Panel/Container/Types"), #arg_41_0.activeFurnitureTypes > 1)
	UIItemList.StaticAlign(arg_41_0._tf:Find("Right/Panel/Container/Types"), arg_41_0._tf:Find("Right/Panel/Container/Types"):GetChild(0), #arg_41_0.activeFurnitureTypes, function(arg_47_0, arg_47_1, arg_47_2)
		if arg_47_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_47_1 = arg_47_1 + 1

		local var_47_0 = arg_41_0.activeFurnitureTypes[arg_47_1]

		setActive(arg_47_2:Find("Selected"), arg_41_0.furnitureType == var_47_0)
	end)
	arg_41_0.furnitureScroll:SetTotalCount(#arg_41_0.displayFurnitures)
	setActive(arg_41_0.furnitureEmpty, #arg_41_0.displayFurnitures == 0)

	local var_41_2 = {}
	local var_41_3 = arg_41_0.furnitureType
	local var_41_4 = {
		var_41_1,
		unpack(arg_41_0.globalZones)
	}
	local var_41_5 = _.reduce(var_41_4, {}, function(arg_48_0, arg_48_1)
		table.insertto(arg_48_0, arg_48_1:GetSlots())

		return arg_48_0
	end)
	local var_41_6 = _.select(var_41_5, function(arg_49_0)
		return arg_49_0:GetType() == var_41_3
	end)

	_.each(var_41_6, function(arg_50_0)
		local var_50_0 = arg_50_0:GetConfigID()

		if arg_41_0.selectMode == var_0_0.SELECT_MODE.NONE then
			var_41_2[var_50_0] = 0
		elseif arg_41_0.selectMode == var_0_0.SELECT_MODE.FURNITURE then
			local var_50_1 = arg_50_0:CanUseFurniture(Dorm3dFurniture.New({
				configId = arg_41_0.selectFurnitureId
			}))

			var_41_2[var_50_0] = var_50_1 and 1 or 2
		elseif arg_41_0.selectMode == var_0_0.SELECT_MODE.SLOT then
			var_41_2[var_50_0] = arg_41_0.selectSlotId == var_50_0 and 1 or 0
		end
	end)

	local var_41_7 = false

	if arg_41_0.selectMode == var_0_0.SELECT_MODE.SLOT then
		local var_41_8 = Dorm3dFurnitureSlot.New({
			configId = arg_41_0.selectSlotId
		})

		if var_41_8:GetType() == Dorm3dFurniture.TYPE.DECORATION then
			local var_41_9 = arg_41_0.room:GetFurnitures()

			if _.detect(var_41_9, function(arg_51_0)
				return arg_51_0:GetSlotID() == var_41_8:GetConfigID()
			end) then
				local var_41_10 = arg_41_0.scene:GetSlotByID(var_41_8:GetConfigID())
				local var_41_11 = arg_41_0.scene:GetScreenPosition(var_41_10.position)
				local var_41_12 = arg_41_0.scene:GetLocalPosition(var_41_11, arg_41_0.lableTrans.parent)

				setLocalPosition(arg_41_0.lableTrans, var_41_12)

				var_41_7 = true
			end
		end
	end

	setActive(arg_41_0.lableTrans, var_41_7)
	arg_41_0.scene:DisplayFurnitureSlots(_.map(var_41_6, function(arg_52_0)
		return arg_52_0:GetConfigID()
	end))
	arg_41_0.scene:UpdateDisplaySlots(var_41_2)
	arg_41_0.scene:RefreshSlots(arg_41_0.room)
end

function var_0_0.UpdateViewFurnitureItem(arg_53_0, arg_53_1)
	local var_53_0 = arg_53_0.furnitureItems[arg_53_1]
	local var_53_1 = arg_53_0.displayFurnitures[arg_53_1]

	if not var_53_0 then
		return
	end

	local var_53_2 = tf(var_53_0)

	var_53_2.name = var_53_1.id

	updateDorm3dIcon(var_53_2:Find("Item/Dorm3dIconTpl"), Drop.New({
		type = DROP_TYPE_DORM3D_FURNITURE,
		id = var_53_1.id,
		count = var_53_1.count
	}))
	setText(var_53_2:Find("Item/Name"), var_53_1.template:GetName())

	local var_53_3 = i18n("dorm3d_furniture_count", var_53_1.useable .. "/" .. var_53_1.count)

	if var_53_1.useable < var_53_1.count then
		var_53_3 = i18n("dorm3d_furniture_used") .. var_53_3
	end

	setText(var_53_2:Find("Item/Count"), var_53_3)
	setActive(var_53_2:Find("Selected"), arg_53_0.selectFurnitureId == var_53_1.id)

	local var_53_4 = arg_53_0.selectMode == var_0_0.SELECT_MODE.SLOT and not var_53_1.fit

	setActive(var_53_2:Find("Unfit"), var_53_4)

	local var_53_5 = not var_53_4 and var_53_1.count == 0

	setActive(var_53_2:Find("Lack"), var_53_5)
	setCanvasGroupAlpha(var_53_2:Find("Item"), (var_53_4 or var_53_5) and 0.4 or 1)

	local var_53_6 = var_53_1.template:IsValuable()

	setActive(var_53_2:Find("Item/BG/Normal"), not var_53_6)
	setActive(var_53_2:Find("Item/BG/Pro"), var_53_6)
	setActive(var_53_2:Find("Item/LabelPro"), var_53_6)
	setActive(var_53_2:Find("Item/Action"), false)
	onButton(arg_53_0, var_53_2:Find("Item/Tip"), function()
		arg_53_0:emit(Dorm3dFurnitureSelectMediator.SHOW_FURNITURE_ACESSES, {
			showGOBtn = true,
			title = i18n("courtyard_label_detail"),
			drop = {
				type = DROP_TYPE_DORM3D_FURNITURE,
				id = var_53_1.id,
				count = var_53_1.count
			},
			list = var_53_1.template:GetAcesses()
		})
	end, SFX_PANEL)
	setActive(var_53_2:Find("Item/New"), var_53_1.count > 0 and Dorm3dFurniture.GetViewedFlag(var_53_1.id) == 0)
	onButton(arg_53_0, var_53_2, function()
		if var_53_1.count > 0 then
			Dorm3dFurniture.SetViewedFlag(var_53_1.id)
			setActive(var_53_2:Find("Item/New"), false)
		end

		local var_55_0 = var_53_1.template:GetType()

		local function var_55_1()
			local var_56_0 = _.detect(arg_53_0.globalZones[1]:GetSlots(), function(arg_57_0)
				return arg_57_0:GetType() == var_55_0
			end)

			if not var_56_0 then
				return
			end

			arg_53_0.room:ReplaceFurniture(var_56_0:GetConfigID(), var_53_1.id)
			table.insert(arg_53_0.replaceFurnitures, {
				slotId = var_56_0:GetConfigID(),
				furnitureId = var_53_1.id
			})
			arg_53_0:UpdateDataDisplayFurnitures()
			pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_furniture_placement")
		end

		if arg_53_0.selectMode == var_0_0.SELECT_MODE.NONE then
			if var_53_1.useable > 0 then
				if var_55_0 == Dorm3dFurniture.TYPE.FLOOR or var_55_0 == Dorm3dFurniture.TYPE.WALLPAPER then
					var_55_1()
				else
					arg_53_0.selectMode = var_0_0.SELECT_MODE.FURNITURE
					arg_53_0.selectFurnitureId = var_53_1.id
				end

				arg_53_0:UpdateView()
			end

			return
		end

		if arg_53_0.selectMode == var_0_0.SELECT_MODE.SLOT then
			if var_53_1.fit and var_53_1.useable > 0 then
				arg_53_0.room:ReplaceFurniture(arg_53_0.selectSlotId, var_53_1.id)
				table.insert(arg_53_0.replaceFurnitures, {
					slotId = arg_53_0.selectSlotId,
					furnitureId = var_53_1.id
				})
				arg_53_0:UpdateDataDisplayFurnitures()
				arg_53_0:UpdateView()
				pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_furniture_placement")
			end

			return
		end

		if arg_53_0.selectMode == var_0_0.SELECT_MODE.FURNITURE then
			if arg_53_0.selectFurnitureId == var_53_1.id then
				arg_53_0.selectMode = var_0_0.SELECT_MODE.NONE
				arg_53_0.selectFurnitureId = nil

				arg_53_0:UpdateView()
			elseif var_53_1.useable > 0 then
				if var_55_0 == Dorm3dFurniture.TYPE.FLOOR or var_55_0 == Dorm3dFurniture.TYPE.WALLPAPER then
					var_55_1()
				else
					arg_53_0.selectFurnitureId = var_53_1.id

					arg_53_0:UpdateView()
				end
			end

			return
		end
	end)

	local var_53_7 = var_53_1.template:GetShopID()

	setActive(var_53_2:Find("GO"), var_53_7)

	if var_53_7 then
		local var_53_8 = CommonCommodity.New({
			id = var_53_7
		}, Goods.TYPE_SHOPSTREET)
		local var_53_9, var_53_10, var_53_11 = var_53_8:GetPrice()
		local var_53_12 = Drop.New({
			type = DROP_TYPE_RESOURCE,
			id = var_53_8:GetResType(),
			count = var_53_9
		})
		local var_53_13 = pg.shop_template[var_53_7]

		onButton(arg_53_0, var_53_2:Find("GO"), function()
			arg_53_0:emit(Dorm3dFurnitureSelectMediator.SHOW_SHOPPING_CONFIRM_WINDOW, {
				content = {
					icon = "<icon name=" .. var_53_8:GetResIcon() .. " w=1.1 h=1.1/>",
					off = var_53_10,
					cost = "x" .. var_53_12.count,
					old = var_53_11,
					name = var_53_1.template:GetName()
				},
				tip = i18n("dorm3d_shop_gift_tip"),
				drop = var_53_1.template,
				onYes = function()
					arg_53_0:emit(GAME.SHOPPING, {
						silentTip = true,
						count = 1,
						shopId = var_53_7
					})
				end
			})
		end, SFX_PANEL)
	end
end

function var_0_0.OnClickFurnitureSlot(arg_60_0, arg_60_1)
	if arg_60_0.selectMode == var_0_0.SELECT_MODE.FURNITURE then
		local var_60_0 = _.detect(arg_60_0.displayFurnitures, function(arg_61_0)
			return arg_61_0.id == arg_60_0.selectFurnitureId
		end)
		local var_60_1 = Dorm3dFurnitureSlot.New({
			configId = arg_60_1
		})

		if var_60_0 and var_60_0.useable > 0 and var_60_1:CanUseFurniture(var_60_0.template) then
			arg_60_0.room:ReplaceFurniture(arg_60_1, var_60_0.id)
			table.insert(arg_60_0.replaceFurnitures, {
				slotId = arg_60_1,
				furnitureId = var_60_0.id
			})
			arg_60_0:UpdateDataDisplayFurnitures()
			pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_furniture_placement")
		else
			return
		end
	elseif arg_60_0.selectMode == var_0_0.SELECT_MODE.NONE then
		arg_60_0.selectMode = var_0_0.SELECT_MODE.SLOT
		arg_60_0.selectSlotId = arg_60_1

		arg_60_0:FilterDataFurnitures()
	elseif arg_60_0.selectMode == var_0_0.SELECT_MODE.SLOT then
		if arg_60_0.selectSlotId == arg_60_1 then
			arg_60_0.selectMode = var_0_0.SELECT_MODE.NONE
			arg_60_0.selectSlotId = nil
		else
			arg_60_0.selectSlotId = arg_60_1
		end

		arg_60_0:FilterDataFurnitures()
	end

	arg_60_0:UpdateView()
end

function var_0_0.CleanSlot(arg_62_0)
	if arg_62_0.selectMode ~= var_0_0.SELECT_MODE.SLOT then
		return
	end

	local var_62_0 = arg_62_0.selectSlotId

	arg_62_0.room:ReplaceFurniture(var_62_0, 0)
	table.insert(arg_62_0.replaceFurnitures, {
		furnitureId = 0,
		slotId = var_62_0
	})
	arg_62_0:UpdateDataDisplayFurnitures()
	arg_62_0:UpdateView()
end

function var_0_0.OnReplaceFurnitureDone(arg_63_0)
	arg_63_0.replaceFurnitures = {}

	existCall(arg_63_0.replaceFurnitureCallback)

	arg_63_0.replaceFurnitureCallback = nil
end

function var_0_0.OnReplaceFurnitureError(arg_64_0)
	arg_64_0.replaceFurnitureCallback = nil
end

function var_0_0.AutoReplaceFurniture(arg_65_0)
	local var_65_0 = arg_65_0.normalZones[arg_65_0.zoneIndex]:GetSlots()

	_.each(var_65_0, function(arg_66_0)
		if arg_66_0:GetType() == Dorm3dFurniture.TYPE.FLOOR or arg_66_0:GetType() == Dorm3dFurniture.TYPE.WALLPAPER then
			return
		end

		local var_66_0 = arg_65_0.room:GetFurnitures()
		local var_66_1 = _.detect(var_66_0, function(arg_67_0)
			return arg_67_0:GetSlotID() == arg_66_0:GetConfigID()
		end)

		if var_66_1 and var_66_1:GetConfigID() ~= arg_66_0:GetDefaultFurniture() then
			return
		end

		local var_66_2 = table.shallowCopy(var_66_0)
		local var_66_3 = {
			function(arg_68_0)
				return arg_68_0:GetSlotID() == 0 and arg_66_0:CanUseFurniture(arg_68_0) and 0 or 1
			end,
			function(arg_69_0)
				return -arg_69_0:GetRarity()
			end,
			function(arg_70_0)
				return -arg_70_0:GetConfigID()
			end
		}

		table.sort(var_66_2, CompareFuncs(var_66_3))

		local var_66_4 = var_66_2[1]

		if not var_66_4 or var_66_4:GetSlotID() ~= 0 or not arg_66_0:CanUseFurniture(var_66_4) then
			return
		end

		arg_65_0.room:ReplaceFurniture(arg_66_0:GetConfigID(), var_66_4:GetConfigID())
		table.insert(arg_65_0.replaceFurnitures, {
			slotId = arg_66_0:GetConfigID(),
			furnitureId = var_66_4:GetConfigID()
		})
	end)
	arg_65_0:UpdateView()
end

function var_0_0.ShowReplaceWindow(arg_71_0, arg_71_1, arg_71_2)
	local var_71_0 = arg_71_0.replaceFurnitures

	if #var_71_0 == 0 then
		return existCall(arg_71_1)
	end

	arg_71_0:emit(Dorm3dFurnitureSelectMediator.SHOW_CONFIRM_WINDOW, {
		title = i18n("title_info"),
		content = i18n("dorm3d_furniture_sure_save"),
		onYes = function()
			arg_71_0:emit(GAME.APARTMENT_REPLACE_FURNITURE, {
				roomId = arg_71_0.room:GetConfigID(),
				furnitures = var_71_0
			})

			arg_71_0.replaceFurnitureCallback = arg_71_1
		end,
		onNo = arg_71_2
	})
end

function var_0_0.onBackPressed(arg_73_0)
	seriesAsync({
		function(arg_74_0)
			arg_73_0:ShowReplaceWindow(arg_74_0, arg_74_0)
		end,
		function(arg_75_0)
			var_0_0.super.onBackPressed(arg_73_0)
		end
	})
end

function var_0_0.willExit(arg_76_0)
	arg_76_0.scene:ExitFurnitureWatchMode()
end

return var_0_0
