local var_0_0 = class("ShipFashionView", import("...base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "ShipFashionView"
end

function var_0_0.OnInit(arg_2_0)
	arg_2_0:InitFashion()
end

function var_0_0.InitFashion(arg_3_0)
	arg_3_0.mainPanel = arg_3_0._parentTf.parent
	arg_3_0.stylePanel = arg_3_0._tf
	arg_3_0.styleScroll = arg_3_0:findTF("style_scroll", arg_3_0.stylePanel)
	arg_3_0.styleContainer = arg_3_0:findTF("view_port", arg_3_0.styleScroll)
	arg_3_0.styleCard = arg_3_0._tf:GetComponent(typeof(ItemList)).prefabItem[0]
	arg_3_0.hideObjToggleTF = findTF(arg_3_0._tf, "btns/hideObjToggle")

	setActive(arg_3_0.hideObjToggleTF, false)

	arg_3_0.hideObjToggle = GetComponent(arg_3_0.hideObjToggleTF, typeof(Toggle))

	setText(findTF(arg_3_0.hideObjToggleTF, "Label"), i18n("paint_hide_other_obj_tip"))

	arg_3_0.shareBtn = findTF(arg_3_0._tf, "share_btn")

	setActive(arg_3_0.stylePanel, true)
	setActive(arg_3_0.styleCard, false)

	arg_3_0.fashionSkins = {}
	arg_3_0.fashionCellMap = {}
	arg_3_0.fashionGroup = 0
	arg_3_0.fashionSkinId = 0
	arg_3_0.onSelected = false
	arg_3_0.isShareSkinFlag = false

	arg_3_0:RegisterShareToggle()
	arg_3_0:bind(ShipMainMediator.ON_NEXTSHIP_PREPARE, function(arg_4_0, arg_4_1)
		arg_3_0._lastSelectCard = nil

		if arg_3_0.isShareSkinFlag and arg_4_1 and #arg_3_0:GetShareSkins(arg_4_1) <= 0 then
			arg_3_0.isShareSkinFlag = false
		end
	end)
end

function var_0_0.SetShareData(arg_5_0, arg_5_1)
	arg_5_0.shareData = arg_5_1
end

function var_0_0.GetShipVO(arg_6_0)
	if arg_6_0.shareData and arg_6_0.shareData.shipVO then
		return arg_6_0.shareData.shipVO
	end

	return nil
end

function var_0_0.SetSkinList(arg_7_0, arg_7_1)
	arg_7_0.skinList = arg_7_1
end

function var_0_0.UpdateUI(arg_8_0)
	triggerToggle(arg_8_0.shareBtn, arg_8_0.isShareSkinFlag)

	local var_8_0 = arg_8_0:GetShareSkins(arg_8_0:GetShipVO())

	setActive(arg_8_0.shareBtn, #var_8_0 > 0)
end

function var_0_0.OnSelected(arg_9_0, arg_9_1)
	local var_9_0 = pg.UIMgr.GetInstance()

	if arg_9_1 then
		var_9_0:OverlayPanelPB(arg_9_0._parentTf, {
			pbList = {
				arg_9_0.stylePanel:Find("style_desc"),
				arg_9_0.stylePanel:Find("frame")
			},
			groupName = LayerWeightConst.GROUP_SHIPINFOUI,
			overlayType = LayerWeightConst.OVERLAY_UI_ADAPT
		})
	else
		var_9_0:UnOverlayPanel(arg_9_0._parentTf, arg_9_0.mainPanel)
	end

	arg_9_0.onSelected = arg_9_1
end

function var_0_0.GetShareSkins(arg_10_0, arg_10_1)
	local var_10_0 = getProxy(ShipSkinProxy):GetShareSkinsForShip(arg_10_1)

	return (_.map(var_10_0, function(arg_11_0)
		return pg.ship_skin_template[arg_11_0.id]
	end))
end

function var_0_0.UpdateAllFashion(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_0:GetShipVO()
	local var_12_1 = var_12_0.groupId

	arg_12_0.fashionSkins = arg_12_0.isShareSkinFlag and arg_12_0:GetShareSkins(var_12_0) or arg_12_0.shareData:GetGroupSkinList(var_12_1)

	if arg_12_0.fashionGroup ~= var_12_1 or arg_12_1 then
		arg_12_0.fashionGroup = var_12_1

		arg_12_0:ResetFashion()

		for iter_12_0 = arg_12_0.styleContainer.childCount, #arg_12_0.fashionSkins - 1 do
			cloneTplTo(arg_12_0.styleCard, arg_12_0.styleContainer)
		end

		for iter_12_1 = #arg_12_0.fashionSkins, arg_12_0.styleContainer.childCount - 1 do
			local var_12_2 = arg_12_0.styleContainer:GetChild(iter_12_1)

			if arg_12_0.fashionCellMap[var_12_2] then
				arg_12_0.fashionCellMap[var_12_2]:clear()
			end

			setActive(var_12_2, false)
		end

		for iter_12_2, iter_12_3 in ipairs(arg_12_0.fashionSkins) do
			local var_12_3 = iter_12_2
			local var_12_4 = arg_12_0.fashionSkins[iter_12_2]
			local var_12_5 = arg_12_0.styleContainer:GetChild(iter_12_2 - 1)
			local var_12_6 = arg_12_0.fashionCellMap[var_12_5]

			if not var_12_6 then
				var_12_6 = ShipSkinCard.New(var_12_5.gameObject)
				arg_12_0.fashionCellMap[var_12_5] = var_12_6
			end

			local var_12_7 = arg_12_0:GetShipVO():getRemouldSkinId() == var_12_4.id and arg_12_0:GetShipVO():isRemoulded()
			local var_12_8 = arg_12_0:GetShipVO():proposeSkinOwned(var_12_4) or table.contains(arg_12_0.skinList, var_12_4.id) or var_12_7 or var_12_4.skin_type == ShipSkin.SKIN_TYPE_OLD or getProxy(ShipSkinProxy):hasSkin(var_12_4.id)

			var_12_6:updateData(arg_12_0:GetShipVO(), var_12_4, var_12_8)

			local var_12_9 = arg_12_0:GetShipVO():useSkin(var_12_4.id)

			var_12_6:updateUsing(var_12_9)
			onButton(arg_12_0, var_12_6.changeSkinTF, function(arg_13_0)
				local var_13_0 = ShipGroup.GetChangeSkinNextId(var_12_4.id)
				local var_13_1 = ShipGroup.GetChangeSkinGroupId(var_12_4.id)
				local var_13_2 = arg_12_0:GetShipVO().id

				if var_12_9 then
					ShipGroup.SetShipChangeSkin(var_13_2, var_13_1, var_13_0, true)
				else
					ShipGroup.SetShipChangeSkin(var_13_2, var_13_1, var_13_0, false)
				end
			end, SFX_PANEL)
			onButton(arg_12_0, var_12_5, function()
				arg_12_0:clickCell(var_12_6, var_12_4)

				arg_12_0._lastSelectCard = var_12_3
			end)
			setActive(var_12_5, true)
		end
	else
		for iter_12_4, iter_12_5 in ipairs(arg_12_0.fashionSkins) do
			local var_12_10 = arg_12_0.styleContainer:GetChild(iter_12_4 - 1)
			local var_12_11 = arg_12_0.fashionCellMap[var_12_10]
			local var_12_12 = arg_12_0:GetShipVO():getRemouldSkinId() == iter_12_5.id and arg_12_0:GetShipVO():isRemoulded()
			local var_12_13 = arg_12_0:GetShipVO():proposeSkinOwned(iter_12_5) or table.contains(arg_12_0.skinList, iter_12_5.id) or var_12_12 or iter_12_5.skin_type == ShipSkin.SKIN_TYPE_OLD

			var_12_11:updateData(arg_12_0:GetShipVO(), iter_12_5, var_12_13)
		end
	end

	arg_12_0.fashionSkinId = arg_12_0:GetShipVO().skinId

	local var_12_14 = arg_12_0.styleContainer:GetChild(0)

	for iter_12_6, iter_12_7 in ipairs(arg_12_0.fashionSkins) do
		if iter_12_7.id == arg_12_0.fashionSkinId then
			var_12_14 = arg_12_0.styleContainer:GetChild(iter_12_6 - 1)

			break
		end
	end

	if arg_12_0._lastSelectCard then
		var_12_14 = arg_12_0.styleContainer:GetChild(arg_12_0._lastSelectCard - 1)
		arg_12_0._lastSelectCard = nil
	end

	triggerButton(var_12_14)
end

function var_0_0.clickCell(arg_15_0, arg_15_1, arg_15_2)
	if ShipViewConst.currentPage ~= ShipViewConst.PAGE.FASHION then
		return
	end

	arg_15_0.clickCellTime = Time.realtimeSinceStartup
	arg_15_0.fashionSkinId = arg_15_2.id

	arg_15_0:UpdateFashionDetail(arg_15_2)
	arg_15_0:emit(ShipViewConst.LOAD_PAINTING, arg_15_2.painting)
	arg_15_0:emit(ShipViewConst.LOAD_PAINTING_BG, arg_15_0:GetShipVO():rarity2bgPrintForGet(), arg_15_0:GetShipVO():isBluePrintShip(), arg_15_0:GetShipVO():isMetaShip())

	for iter_15_0, iter_15_1 in ipairs(arg_15_0.fashionSkins) do
		local var_15_0 = arg_15_0.styleContainer:GetChild(iter_15_0 - 1)
		local var_15_1 = arg_15_0.fashionCellMap[var_15_0]

		var_15_1:updateSelected(iter_15_1.id == arg_15_0.fashionSkinId)
		var_15_1:updateUsing(arg_15_0:GetShipVO().skinId == iter_15_1.id)
	end

	local var_15_2 = arg_15_2.painting
	local var_15_3 = checkABExist("painting/" .. var_15_2 .. "_n")

	setActive(arg_15_0.hideObjToggle, var_15_3)

	if var_15_3 then
		arg_15_0.hideObjToggle.isOn = PlayerPrefs.GetInt("paint_hide_other_obj_" .. var_15_2, 0) ~= 0

		onToggle(arg_15_0, arg_15_0.hideObjToggleTF, function(arg_16_0)
			PlayerPrefs.SetInt("paint_hide_other_obj_" .. var_15_2, arg_16_0 and 1 or 0)
			arg_15_1:flushSkin()
			arg_15_0:emit(ShipViewConst.LOAD_PAINTING, var_15_2, true)
		end, SFX_PANEL)
	end
end

function var_0_0.UpdateFashion(arg_17_0, arg_17_1)
	if ShipViewConst.currentPage ~= ShipViewConst.PAGE.FASHION or not arg_17_0.shareData:HasFashion() then
		return
	end

	arg_17_0:UpdateAllFashion(arg_17_1)
end

function var_0_0.ResetFashion(arg_18_0)
	arg_18_0.fashionSkinId = 0
end

function var_0_0.UpdateFashionDetail(arg_19_0, arg_19_1)
	local var_19_0 = arg_19_0.fashionDetailWrapper

	if not var_19_0 then
		var_19_0 = {
			name = findTF(arg_19_0.stylePanel, "style_desc/name_bg/name"),
			descTxt = findTF(arg_19_0.stylePanel, "style_desc/desc_frame/desc/Text"),
			character = findTF(arg_19_0.stylePanel, "style_desc/character"),
			confirm = findTF(arg_19_0.stylePanel, "confirm_button"),
			cancel = findTF(arg_19_0.stylePanel, "cancel_button")
		}
		var_19_0.diamond = findTF(var_19_0.confirm, "diamond")
		var_19_0.using = findTF(var_19_0.confirm, "using")
		var_19_0.experience = findTF(var_19_0.confirm, "experience")
		var_19_0.change = findTF(var_19_0.confirm, "change")
		var_19_0.buy = findTF(var_19_0.confirm, "buy")
		var_19_0.activity = findTF(var_19_0.confirm, "activity")
		var_19_0.cantbuy = findTF(var_19_0.confirm, "cantbuy")
		var_19_0.prefab = "unknown"
		arg_19_0.fashionDetailWrapper = var_19_0
	end

	setText(var_19_0.name, arg_19_1.name)
	setText(var_19_0.descTxt, SwitchSpecialChar(arg_19_1.desc, true))

	local var_19_1 = var_19_0.descTxt:GetComponent(typeof(Text))

	if #var_19_1.text > 50 then
		var_19_1.alignment = TextAnchor.MiddleLeft
	else
		var_19_1.alignment = TextAnchor.MiddleCenter
	end

	if var_19_0.prefab ~= arg_19_1.prefab then
		local var_19_2 = var_19_0.character:Find(var_19_0.prefab)

		if not IsNil(var_19_2) then
			PoolMgr.GetInstance():ReturnSpineChar(var_19_0.prefab, var_19_2.gameObject)
		end

		var_19_0.prefab = arg_19_1.prefab

		local var_19_3 = var_19_0.prefab

		PoolMgr.GetInstance():GetSpineChar(var_19_3, true, function(arg_20_0)
			if var_19_0.prefab ~= var_19_3 then
				PoolMgr.GetInstance():ReturnSpineChar(var_19_3, arg_20_0)
			else
				arg_20_0.name = var_19_3
				arg_20_0.transform.localPosition = Vector3.zero
				arg_20_0.transform.localScale = Vector3(0.5, 0.5, 1)

				arg_20_0.transform:SetParent(var_19_0.character, false)
				arg_20_0:GetComponent(typeof(SpineAnimUI)):SetAction(arg_19_1.show_skin or "stand", 0)
			end
		end)
	end

	local var_19_4 = arg_19_0:GetShipVO():getRemouldSkinId() == arg_19_1.id and arg_19_0:GetShipVO():isRemoulded()
	local var_19_5 = (arg_19_0:GetShipVO():proposeSkinOwned(arg_19_1) or table.contains(arg_19_0.skinList, arg_19_1.id) or var_19_4) and 1 or 0
	local var_19_6 = arg_19_1.shop_id > 0 and pg.shop_template[arg_19_1.shop_id] or nil
	local var_19_7 = var_19_6 and not pg.TimeMgr.GetInstance():inTime(var_19_6.time)
	local var_19_8 = arg_19_1.id == arg_19_0:GetShipVO().skinId
	local var_19_9 = arg_19_1.id == arg_19_0:GetShipVO():getConfig("skin_id") or var_19_5 >= 1 or arg_19_1.skin_type == ShipSkin.SKIN_TYPE_OLD or getProxy(ShipSkinProxy):hasSkin(arg_19_1.id)
	local var_19_10 = getProxy(ShipSkinProxy):getSkinById(arg_19_1.id)
	local var_19_11 = getProxy(ShipSkinProxy):InForbiddenSkinListAndShow(arg_19_1.id)
	local var_19_12 = var_19_8 and var_19_10 and var_19_10:isExpireType()

	setActive(var_19_0.using, false)
	setActive(var_19_0.change, false)
	setActive(var_19_0.buy, false)
	setActive(var_19_0.experience, false)

	if var_19_12 then
		setGray(var_19_0.confirm, false)
		setActive(var_19_0.experience, true)
	elseif var_19_8 then
		setGray(var_19_0.confirm, false)
		setActive(var_19_0.using, true)
	elseif var_19_9 and ShipSkin.IsShareSkin(arg_19_0:GetShipVO(), arg_19_1.id) and not ShipSkin.CanUseShareSkinForShip(arg_19_0:GetShipVO(), arg_19_1.id) then
		setActive(var_19_0.change, true)
		setGray(var_19_0.confirm, true)
	elseif var_19_9 then
		setActive(var_19_0.change, true)
		setGray(var_19_0.confirm, false)
	elseif var_19_6 then
		setActive(var_19_0.buy, true)
		setGray(var_19_0.confirm, var_19_7 or var_19_11)
	else
		setActive(var_19_0.change, true)
		setGray(var_19_0.confirm, true)
	end

	onButton(arg_19_0, var_19_0.confirm, function()
		if var_19_8 then
			if ShipGroup.IsChangeSkin(arg_19_1.id) then
				if arg_19_0.clickCellTime and Time.realtimeSinceStartup - arg_19_0.clickCellTime <= 0.35 then
					return
				end

				arg_19_0:SilentTriggerToggleFalse()
				arg_19_0:emit(ShipViewConst.SWITCH_TO_PAGE, ShipViewConst.PAGE.DETAIL)
			end
		elseif var_19_9 then
			if ShipSkin.IsShareSkin(arg_19_0:GetShipVO(), arg_19_1.id) and not ShipSkin.CanUseShareSkinForShip(arg_19_0:GetShipVO(), arg_19_1.id) then
				-- block empty
			else
				arg_19_0:emit(ShipMainMediator.CHANGE_SKIN, arg_19_0:GetShipVO().id, arg_19_1.id == arg_19_0:GetShipVO():getConfig("skin_id") and 0 or arg_19_1.id)
			end
		elseif var_19_6 then
			if var_19_7 or var_19_11 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_skin_out_of_stock"))
			else
				local var_21_0 = Goods.Create({
					shop_id = var_19_6.id
				}, Goods.TYPE_SKIN)

				if var_21_0:isDisCount() and var_21_0:IsItemDiscountType() then
					arg_19_0:emit(ShipMainMediator.BUY_ITEM_BY_ACT, var_19_6.id, 1)
				else
					local var_21_1 = var_21_0:GetPrice()
					local var_21_2 = i18n("text_buy_fashion_tip", var_21_1, arg_19_1.name)

					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						content = var_21_2,
						onYes = function()
							arg_19_0:emit(ShipMainMediator.BUY_ITEM, var_19_6.id, 1)
						end
					})
				end
			end
		end
	end)
	onButton(arg_19_0, var_19_0.cancel, function()
		if arg_19_0.clickCellTime and Time.realtimeSinceStartup - arg_19_0.clickCellTime <= 0.35 then
			return
		end

		arg_19_0:SilentTriggerToggleFalse()
		arg_19_0:emit(ShipViewConst.SWITCH_TO_PAGE, ShipViewConst.PAGE.DETAIL)
	end)
end

function var_0_0.SilentTriggerToggleFalse(arg_24_0)
	arg_24_0.fashionGroup = false
	arg_24_0.isShareSkinFlag = false

	removeOnToggle(arg_24_0.shareBtn)
	triggerToggle(arg_24_0.shareBtn, false)
	arg_24_0:RegisterShareToggle()
end

function var_0_0.RegisterShareToggle(arg_25_0)
	onToggle(arg_25_0, arg_25_0.shareBtn, function(arg_26_0)
		arg_25_0.fashionGroup = false
		arg_25_0.isShareSkinFlag = arg_26_0

		arg_25_0:UpdateFashion()
	end, SFX_PANEL)
end

function var_0_0.OnDestroy(arg_27_0)
	if arg_27_0.fashionDetailWrapper then
		local var_27_0 = arg_27_0.fashionDetailWrapper
		local var_27_1 = var_27_0.character:Find(var_27_0.prefab)

		if not IsNil(var_27_1) then
			PoolMgr.GetInstance():ReturnSpineChar(var_27_0.prefab, var_27_1.gameObject)
		end
	end

	arg_27_0.fashionDetailWrapper = nil

	for iter_27_0, iter_27_1 in pairs(arg_27_0.fashionCellMap) do
		iter_27_1:clear()
	end

	arg_27_0.fashionCellMap = {}
	arg_27_0.fashionSkins = {}
	arg_27_0.fashionGroup = 0
	arg_27_0.fashionSkinId = 0
	arg_27_0.shareData = nil
end

return var_0_0
