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

	arg_2_0.furnitureScroll = var_2_0:Find("Scroll"):GetComponent("LScrollRect")
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

function var_0_0.SetApartment(arg_4_0, arg_4_1)
	arg_4_0.apartment = arg_4_1:clone()
end

function var_0_0.didEnter(arg_5_0)
	arg_5_0.allZones = arg_5_0.apartment:GetFurnitureZones()
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
	arg_5_0:UpdateView()
	quickPlayAnimation(arg_5_0._tf, "anim_dorm3d_furniture_change")
end

function var_0_0.UpdateDataZone(arg_19_0)
	local var_19_0 = arg_19_0.normalZones[arg_19_0.zoneIndex]
	local var_19_1 = {
		var_19_0,
		unpack(arg_19_0.globalZones)
	}
	local var_19_2 = _.reduce(var_19_1, {}, function(arg_20_0, arg_20_1)
		table.insertto(arg_20_0, arg_20_1:GetSlots())

		return arg_20_0
	end)
	local var_19_3 = {}
	local var_19_4 = 99

	_.each(var_19_2, function(arg_21_0)
		var_19_3[arg_21_0:GetType()] = true
		var_19_4 = math.min(var_19_4, arg_21_0:GetType())
	end)

	arg_19_0.activeFurnitureTypes = _.keys(var_19_3)

	var_19_0:SortTypes(arg_19_0.activeFurnitureTypes)

	arg_19_0.furnitureType = arg_19_0.activeFurnitureTypes[1]

	arg_19_0:UpdateDataDisplayFurnitures()
end

function var_0_0.UpdateDataDisplayFurnitures(arg_22_0)
	local var_22_0 = arg_22_0.apartment
	local var_22_1 = arg_22_0.furnitureType

	arg_22_0.selectMode = var_0_0.SELECT_MODE.NONE
	arg_22_0.selectFurnitureId = nil
	arg_22_0.selectSlotId = nil

	local var_22_2 = arg_22_0.normalZones[arg_22_0.zoneIndex]
	local var_22_3 = {
		var_22_2,
		unpack(arg_22_0.globalZones)
	}
	local var_22_4 = _.reduce(var_22_3, {}, function(arg_23_0, arg_23_1)
		table.insertto(arg_23_0, arg_23_1:GetSlots())

		return arg_23_0
	end)
	local var_22_5 = var_22_0:GetFurnitureIDList()
	local var_22_6 = var_22_0:GetFurnitures()
	local var_22_7 = {}
	local var_22_8 = {}

	_.each(var_22_5, function(arg_24_0)
		local var_24_0 = Dorm3dFurniture.New({
			configId = arg_24_0
		})

		if var_24_0:GetType() ~= var_22_1 then
			return
		end

		if not _.any(var_22_4, function(arg_25_0)
			return arg_25_0:CanUseFurniture(var_24_0)
		end) then
			return
		end

		table.insert(var_22_8, {
			useable = 0,
			count = 0,
			id = arg_24_0,
			template = var_24_0
		})

		var_22_7[arg_24_0] = #var_22_8
	end)
	_.each(var_22_6, function(arg_26_0)
		if arg_26_0:GetType() ~= var_22_1 then
			return
		end

		if not _.any(var_22_4, function(arg_27_0)
			return arg_27_0:CanUseFurniture(arg_26_0)
		end) then
			return
		end

		local var_26_0 = arg_26_0:GetConfigID()
		local var_26_1 = var_22_8[var_22_7[var_26_0]]

		var_26_1.count = var_26_1.count + 1

		if arg_26_0:GetSlotID() == 0 then
			var_26_1.useable = var_26_1.useable + 1
		end
	end)

	arg_22_0.displayFurnitures = var_22_8

	arg_22_0:FilterDataFurnitures()
end

function var_0_0.FilterDataFurnitures(arg_28_0)
	local var_28_0 = {
		function(arg_29_0)
			return arg_29_0.useable > 0 and 0 or 1
		end,
		function(arg_30_0)
			return -arg_30_0.template:GetRarity()
		end,
		function(arg_31_0)
			return -arg_31_0.id
		end
	}

	if arg_28_0.selectMode == var_0_0.SELECT_MODE.SLOT then
		local var_28_1 = Dorm3dFurnitureSlot.New({
			configId = arg_28_0.selectSlotId
		})

		_.each(arg_28_0.displayFurnitures, function(arg_32_0)
			local var_32_0 = arg_32_0.template

			arg_32_0.fit = var_28_1:CanUseFurniture(var_32_0)
		end)
		table.insert(var_28_0, function(arg_33_0)
			return arg_33_0.fit and 0 or 1
		end)
	end

	table.sort(arg_28_0.displayFurnitures, CompareFuncs(var_28_0))
end

function var_0_0.InitViewZoneList(arg_34_0)
	local var_34_0 = arg_34_0.normalZones

	UIItemList.StaticAlign(arg_34_0.zoneList:Find("List"), arg_34_0.zoneList:Find("List"):GetChild(0), #var_34_0, function(arg_35_0, arg_35_1, arg_35_2)
		if arg_35_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_35_1 = arg_35_1 + 1

		local var_35_0 = var_34_0[arg_35_1]

		arg_35_2.name = var_35_0:GetWatchCameraName()

		setText(arg_35_2:Find("Name"), var_35_0:GetName())
		onButton(arg_34_0, arg_35_2, function()
			arg_34_0.zoneIndex = arg_35_1

			arg_34_0:UpdateDataZone()
			arg_34_0.scene:SwitchFurnitureZone(var_35_0)
			arg_34_0:InitViewTypeList()
			arg_34_0:UpdateView()
			quickPlayAnimation(arg_34_0._tf, "anim_dorm3d_furniture_change")
			setActive(arg_34_0.zoneList, false)
		end, SFX_PANEL)
		setActive(arg_35_2:Find("Line"), arg_35_1 < #var_34_0)
		setActive(arg_35_2:Find("New"), false)
	end)
end

function var_0_0.InitViewTypeList(arg_37_0)
	UIItemList.StaticAlign(arg_37_0._tf:Find("Right/Panel/Container/Types"), arg_37_0._tf:Find("Right/Panel/Container/Types"):GetChild(0), #arg_37_0.activeFurnitureTypes, function(arg_38_0, arg_38_1, arg_38_2)
		if arg_38_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_38_1 = arg_38_1 + 1

		local var_38_0 = arg_37_0.activeFurnitureTypes[arg_38_1]

		setText(arg_38_2:Find("Name"), i18n(Dorm3dFurniture.TYPE2NAME[var_38_0]))
		onButton(arg_37_0, arg_38_2, function()
			if arg_37_0.furnitureType == var_38_0 then
				return
			end

			arg_37_0.furnitureType = var_38_0

			arg_37_0:UpdateDataDisplayFurnitures()
			arg_37_0:UpdateView()
			quickPlayAnimation(arg_37_0._tf, "anim_dorm3d_furniture_change")
			setActive(arg_37_0.zoneList, false)
		end, SFX_PANEL)
	end)
end

function var_0_0.UpdateView(arg_40_0)
	local var_40_0 = arg_40_0.normalZones
	local var_40_1 = var_40_0[arg_40_0.zoneIndex]

	setText(arg_40_0._tf:Find("Right/Panel/Container/Zone/ZoneContainer/Name"), var_40_1:GetName())
	UIItemList.StaticAlign(arg_40_0.zoneList:Find("List"), arg_40_0.zoneList:Find("List"):GetChild(0), #var_40_0, function(arg_41_0, arg_41_1, arg_41_2)
		if arg_41_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_41_1 = arg_41_1 + 1

		local var_41_0 = arg_41_2:Find("Name"):GetComponent(typeof(Text)).color
		local var_41_1 = arg_40_0.zoneIndex == arg_41_1 and Color.NewHex("39bfff") or Color.white

		var_41_1.a = var_41_0.a

		setTextColor(arg_41_2:Find("Name"), var_41_1)
		setActive(arg_41_2:Find("New"), false)
	end)
	;(function()
		local var_42_0 = arg_40_0.apartment:GetFurnitureIDList()
		local var_42_1 = _.map(var_42_0, function(arg_43_0)
			return Dorm3dFurniture.New({
				configId = arg_43_0
			})
		end)
		local var_42_2 = arg_40_0.apartment:GetFurnitures()
		local var_42_3 = false

		table.Ipairs(arg_40_0.normalZones, function(arg_44_0, arg_44_1)
			local var_44_0 = false

			if arg_44_1 ~= var_40_1 then
				var_44_0 = _.any(arg_44_1:GetSlots(), function(arg_45_0)
					return _.any(var_42_1, function(arg_46_0)
						if not arg_46_0:GetShopID() then
							return
						end

						if not arg_45_0:CanUseFurniture(arg_46_0) then
							return
						end

						return not _.detect(var_42_2, function(arg_47_0)
							return arg_47_0:GetConfigID() == arg_46_0:GetConfigID()
						end) and Dorm3dFurniture.GetViewedFlag(arg_46_0:GetConfigID()) == 0
					end)
				end)
			end

			setActive(arg_40_0.zoneList:Find("List"):GetChild(arg_44_0 - 1):Find("New"), var_44_0)

			var_42_3 = var_42_3 or var_44_0
		end)
		setActive(arg_40_0._tf:Find("Right/Panel/Container/Zone/ZoneContainer/Switch/New"), var_42_3)
	end)()
	setActive(arg_40_0._tf:Find("Right/Panel/Container/Types"), #arg_40_0.activeFurnitureTypes > 1)
	UIItemList.StaticAlign(arg_40_0._tf:Find("Right/Panel/Container/Types"), arg_40_0._tf:Find("Right/Panel/Container/Types"):GetChild(0), #arg_40_0.activeFurnitureTypes, function(arg_48_0, arg_48_1, arg_48_2)
		if arg_48_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_48_1 = arg_48_1 + 1

		local var_48_0 = arg_40_0.activeFurnitureTypes[arg_48_1]

		setActive(arg_48_2:Find("Selected"), arg_40_0.furnitureType == var_48_0)
	end)
	arg_40_0.furnitureScroll:SetTotalCount(#arg_40_0.displayFurnitures)
	setActive(arg_40_0.furnitureEmpty, #arg_40_0.displayFurnitures == 0)

	local var_40_2 = {}
	local var_40_3 = arg_40_0.furnitureType
	local var_40_4 = {
		var_40_1,
		unpack(arg_40_0.globalZones)
	}
	local var_40_5 = _.reduce(var_40_4, {}, function(arg_49_0, arg_49_1)
		table.insertto(arg_49_0, arg_49_1:GetSlots())

		return arg_49_0
	end)
	local var_40_6 = _.select(var_40_5, function(arg_50_0)
		return arg_50_0:GetType() == var_40_3
	end)

	_.each(var_40_6, function(arg_51_0)
		local var_51_0 = arg_51_0:GetConfigID()

		if arg_40_0.selectMode == var_0_0.SELECT_MODE.NONE then
			var_40_2[var_51_0] = 0
		elseif arg_40_0.selectMode == var_0_0.SELECT_MODE.FURNITURE then
			local var_51_1 = arg_51_0:CanUseFurniture(Dorm3dFurniture.New({
				configId = arg_40_0.selectFurnitureId
			}))

			var_40_2[var_51_0] = var_51_1 and 1 or 2
		elseif arg_40_0.selectMode == var_0_0.SELECT_MODE.SLOT then
			var_40_2[var_51_0] = arg_40_0.selectSlotId == var_51_0 and 1 or 0
		end
	end)

	local var_40_7 = false

	if arg_40_0.selectMode == var_0_0.SELECT_MODE.SLOT then
		local var_40_8 = Dorm3dFurnitureSlot.New({
			configId = arg_40_0.selectSlotId
		})

		if var_40_8:GetType() == Dorm3dFurniture.TYPE.DECORATION then
			local var_40_9 = arg_40_0.apartment:GetFurnitures()

			if _.detect(var_40_9, function(arg_52_0)
				return arg_52_0:GetSlotID() == var_40_8:GetConfigID()
			end) then
				local var_40_10 = arg_40_0.scene:GetSlotByID(var_40_8:GetConfigID())
				local var_40_11 = arg_40_0.scene:GetScreenPosition(var_40_10.position)
				local var_40_12 = arg_40_0.scene:GetLocalPosition(var_40_11, arg_40_0.lableTrans.parent)

				setLocalPosition(arg_40_0.lableTrans, var_40_12)

				var_40_7 = true
			end
		end
	end

	setActive(arg_40_0.lableTrans, var_40_7)
	arg_40_0.scene:DisplayFurnitureSlots(_.map(var_40_6, function(arg_53_0)
		return arg_53_0:GetConfigID()
	end))
	arg_40_0.scene:UpdateDisplaySlots(var_40_2)
	arg_40_0.scene:RefreshSlots(arg_40_0.apartment)
end

function var_0_0.UpdateViewFurnitureItem(arg_54_0, arg_54_1)
	local var_54_0 = arg_54_0.furnitureItems[arg_54_1]
	local var_54_1 = arg_54_0.displayFurnitures[arg_54_1]

	if not var_54_0 then
		return
	end

	local var_54_2 = tf(var_54_0)

	var_54_2.name = var_54_1.id

	updateDorm3dIcon(var_54_2:Find("Item/Dorm3dIconTpl"), Drop.New({
		type = DROP_TYPE_DORM3D_FURNITURE,
		id = var_54_1.id,
		count = var_54_1.count
	}))
	setText(var_54_2:Find("Item/Name"), var_54_1.template:GetName())

	local var_54_3 = i18n("dorm3d_furniture_count", var_54_1.useable .. "/" .. var_54_1.count)

	if var_54_1.useable < var_54_1.count then
		var_54_3 = i18n("dorm3d_furniture_used") .. var_54_3
	end

	setText(var_54_2:Find("Item/Count"), var_54_3)
	setActive(var_54_2:Find("Selected"), arg_54_0.selectFurnitureId == var_54_1.id)

	local var_54_4 = arg_54_0.selectMode == var_0_0.SELECT_MODE.SLOT and not var_54_1.fit

	setActive(var_54_2:Find("Unfit"), var_54_4)

	local var_54_5 = not var_54_4 and var_54_1.count == 0

	setActive(var_54_2:Find("Lack"), var_54_5)
	setCanvasGroupAlpha(var_54_2:Find("Item"), (var_54_4 or var_54_5) and 0.4 or 1)

	local var_54_6 = var_54_1.template:IsValuable()

	setActive(var_54_2:Find("Item/BG/Normal"), not var_54_6)
	setActive(var_54_2:Find("Item/BG/Pro"), var_54_6)
	setActive(var_54_2:Find("Item/LabelPro"), var_54_6)
	setActive(var_54_2:Find("Item/Action"), false)
	onButton(arg_54_0, var_54_2:Find("Item/Tip"), function()
		arg_54_0:emit(Dorm3dFurnitureSelectMediator.SHOW_FURNITURE_ACESSES, {
			showGOBtn = true,
			title = i18n("courtyard_label_detail"),
			drop = {
				type = DROP_TYPE_DORM3D_FURNITURE,
				id = var_54_1.id,
				count = var_54_1.count
			},
			list = var_54_1.template:GetAcesses()
		})
	end, SFX_PANEL)
	onButton(arg_54_0, var_54_2, function()
		local var_56_0 = var_54_1.template:GetType()

		local function var_56_1()
			local var_57_0 = _.detect(arg_54_0.globalZones[1]:GetSlots(), function(arg_58_0)
				return arg_58_0:GetType() == var_56_0
			end)

			if not var_57_0 then
				return
			end

			arg_54_0.apartment:ReplaceFurniture(var_57_0:GetConfigID(), var_54_1.id)
			table.insert(arg_54_0.replaceFurnitures, {
				slotId = var_57_0:GetConfigID(),
				furnitureId = var_54_1.id
			})
			arg_54_0:UpdateDataDisplayFurnitures()
			pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_furniture_placement")
		end

		if arg_54_0.selectMode == var_0_0.SELECT_MODE.NONE then
			if var_54_1.useable > 0 then
				if var_56_0 == Dorm3dFurniture.TYPE.FLOOR or var_56_0 == Dorm3dFurniture.TYPE.WALLPAPER then
					var_56_1()
				else
					arg_54_0.selectMode = var_0_0.SELECT_MODE.FURNITURE
					arg_54_0.selectFurnitureId = var_54_1.id
				end

				arg_54_0:UpdateView()
			end

			return
		end

		if arg_54_0.selectMode == var_0_0.SELECT_MODE.SLOT then
			if var_54_1.fit and var_54_1.useable > 0 then
				arg_54_0.apartment:ReplaceFurniture(arg_54_0.selectSlotId, var_54_1.id)
				table.insert(arg_54_0.replaceFurnitures, {
					slotId = arg_54_0.selectSlotId,
					furnitureId = var_54_1.id
				})
				arg_54_0:UpdateDataDisplayFurnitures()
				arg_54_0:UpdateView()
				pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_furniture_placement")
			end

			return
		end

		if arg_54_0.selectMode == var_0_0.SELECT_MODE.FURNITURE then
			if arg_54_0.selectFurnitureId == var_54_1.id then
				arg_54_0.selectMode = var_0_0.SELECT_MODE.NONE
				arg_54_0.selectFurnitureId = nil

				arg_54_0:UpdateView()
			elseif var_54_1.useable > 0 then
				if var_56_0 == Dorm3dFurniture.TYPE.FLOOR or var_56_0 == Dorm3dFurniture.TYPE.WALLPAPER then
					var_56_1()
				else
					arg_54_0.selectFurnitureId = var_54_1.id

					arg_54_0:UpdateView()
				end
			end

			return
		end
	end)

	local var_54_7 = var_54_1.template:GetShopID()

	setActive(var_54_2:Find("GO"), var_54_7)
	setActive(var_54_2:Find("GO/New"), var_54_7 and var_54_1.template:GetShipGroupId() > 0 and Dorm3dFurniture.GetViewedFlag(var_54_1.id) == 0 and var_54_1.useable == 0)
	Dorm3dFurniture.SetViewedFlag(var_54_1.id)

	if var_54_7 then
		local var_54_8 = pg.shop_template[var_54_7]

		onButton(arg_54_0, var_54_2:Find("GO"), function()
			local var_59_0 = ""

			if var_54_8.resource_type == 4 or var_54_8.resource_type == 14 then
				var_59_0 = "diamond"
			elseif var_54_8.resource_type == 1 then
				var_59_0 = "gold"
			end

			arg_54_0:emit(Dorm3dFurnitureSelectMediator.SHOW_SHOPPING_CONFIRM_WINDOW, {
				content = i18n("dorm3d_shop_gift", "<icon name=" .. var_59_0 .. " w=1.1 h=1.1/>", setColorStr("x" .. var_54_8.resource_num, "#169fff"), setColorStr(var_54_1.template:GetName(), "#169fff")),
				tip = i18n("dorm3d_shop_gift_tip"),
				drop = var_54_1.template,
				onYes = function()
					arg_54_0:emit(GAME.SHOPPING, {
						silentTip = true,
						count = 1,
						shopId = var_54_7
					})
				end
			})
		end, SFX_PANEL)
	end
end

function var_0_0.OnClickFurnitureSlot(arg_61_0, arg_61_1)
	if arg_61_0.selectMode == var_0_0.SELECT_MODE.FURNITURE then
		local var_61_0 = _.detect(arg_61_0.displayFurnitures, function(arg_62_0)
			return arg_62_0.id == arg_61_0.selectFurnitureId
		end)
		local var_61_1 = Dorm3dFurnitureSlot.New({
			configId = arg_61_1
		})

		if var_61_0 and var_61_0.useable > 0 and var_61_1:CanUseFurniture(var_61_0.template) then
			arg_61_0.apartment:ReplaceFurniture(arg_61_1, var_61_0.id)
			table.insert(arg_61_0.replaceFurnitures, {
				slotId = arg_61_1,
				furnitureId = var_61_0.id
			})
			arg_61_0:UpdateDataDisplayFurnitures()
			pg.CriMgr.GetInstance():PlaySE_V3("ui-dorm_furniture_placement")
		else
			return
		end
	elseif arg_61_0.selectMode == var_0_0.SELECT_MODE.NONE then
		arg_61_0.selectMode = var_0_0.SELECT_MODE.SLOT
		arg_61_0.selectSlotId = arg_61_1

		arg_61_0:FilterDataFurnitures()
	elseif arg_61_0.selectMode == var_0_0.SELECT_MODE.SLOT then
		if arg_61_0.selectSlotId == arg_61_1 then
			arg_61_0.selectMode = var_0_0.SELECT_MODE.NONE
			arg_61_0.selectSlotId = nil
		else
			arg_61_0.selectSlotId = arg_61_1
		end

		arg_61_0:FilterDataFurnitures()
	end

	arg_61_0:UpdateView()
end

function var_0_0.CleanSlot(arg_63_0)
	if arg_63_0.selectMode ~= var_0_0.SELECT_MODE.SLOT then
		return
	end

	local var_63_0 = arg_63_0.selectSlotId

	arg_63_0.apartment:ReplaceFurniture(var_63_0, 0)
	table.insert(arg_63_0.replaceFurnitures, {
		furnitureId = 0,
		slotId = var_63_0
	})
	arg_63_0:UpdateDataDisplayFurnitures()
	arg_63_0:UpdateView()
end

function var_0_0.OnReplaceFurnitureDone(arg_64_0)
	arg_64_0.replaceFurnitures = {}

	existCall(arg_64_0.replaceFurnitureCallback)

	arg_64_0.replaceFurnitureCallback = nil
end

function var_0_0.OnReplaceFurnitureError(arg_65_0)
	arg_65_0.replaceFurnitureCallback = nil
end

function var_0_0.AutoReplaceFurniture(arg_66_0)
	local var_66_0 = arg_66_0.normalZones[arg_66_0.zoneIndex]:GetSlots()

	_.each(var_66_0, function(arg_67_0)
		if arg_67_0:GetType() == Dorm3dFurniture.TYPE.FLOOR or arg_67_0:GetType() == Dorm3dFurniture.TYPE.WALLPAPER then
			return
		end

		local var_67_0 = arg_66_0.apartment:GetFurnitures()
		local var_67_1 = _.detect(var_67_0, function(arg_68_0)
			return arg_68_0:GetSlotID() == arg_67_0:GetConfigID()
		end)

		if var_67_1 and var_67_1:GetConfigID() ~= arg_67_0:GetDefaultFurniture() then
			return
		end

		local var_67_2 = table.shallowCopy(var_67_0)
		local var_67_3 = {
			function(arg_69_0)
				return arg_69_0:GetSlotID() == 0 and arg_67_0:CanUseFurniture(arg_69_0) and 0 or 1
			end,
			function(arg_70_0)
				return -arg_70_0:GetRarity()
			end,
			function(arg_71_0)
				return -arg_71_0:GetConfigID()
			end
		}

		table.sort(var_67_2, CompareFuncs(var_67_3))

		local var_67_4 = var_67_2[1]

		if not var_67_4 or var_67_4:GetSlotID() ~= 0 or not arg_67_0:CanUseFurniture(var_67_4) then
			return
		end

		arg_66_0.apartment:ReplaceFurniture(arg_67_0:GetConfigID(), var_67_4:GetConfigID())
		table.insert(arg_66_0.replaceFurnitures, {
			slotId = arg_67_0:GetConfigID(),
			furnitureId = var_67_4:GetConfigID()
		})
	end)
	arg_66_0:UpdateView()
end

function var_0_0.ShowReplaceWindow(arg_72_0, arg_72_1, arg_72_2)
	local var_72_0 = arg_72_0.replaceFurnitures

	if #var_72_0 == 0 then
		return existCall(arg_72_1)
	end

	arg_72_0:emit(Dorm3dFurnitureSelectMediator.SHOW_CONFIRM_WINDOW, {
		title = i18n("title_info"),
		content = i18n("dorm3d_furniture_sure_save"),
		onYes = function()
			arg_72_0:emit(GAME.APARTMENT_REPLACE_FURNITURE, {
				shipGroupId = arg_72_0.apartment:GetConfigID(),
				furnitures = var_72_0
			})

			arg_72_0.replaceFurnitureCallback = arg_72_1
		end,
		onNo = arg_72_2
	})
end

function var_0_0.onBackPressed(arg_74_0)
	seriesAsync({
		function(arg_75_0)
			arg_74_0:ShowReplaceWindow(arg_75_0, arg_75_0)
		end,
		function(arg_76_0)
			var_0_0.super.onBackPressed(arg_74_0)
		end
	})
end

function var_0_0.willExit(arg_77_0)
	arg_77_0.scene:ExitFurnitureWatchMode()
end

return var_0_0
