local var_0_0 = class("SwichSkinLayer", import("..base.BaseUI"))

function var_0_0.setShip(arg_1_0, arg_1_1)
	arg_1_0.shipVO = arg_1_1
end

function var_0_0.setShipSkin(arg_2_0, arg_2_1)
	arg_2_0.shipVO.skinId = arg_2_1
end

function var_0_0.GetShareSkins(arg_3_0)
	local var_3_0 = getProxy(ShipSkinProxy):GetShareSkinsForShip(arg_3_0.shipVO)

	return (_.map(var_3_0, function(arg_4_0)
		return pg.ship_skin_template[arg_4_0.id]
	end))
end

function var_0_0.setSkinList(arg_5_0, arg_5_1)
	arg_5_0.skinList = arg_5_1
	arg_5_0.skins = arg_5_0:getGroupSkinList(arg_5_0.shipVO.groupId)
	arg_5_0.shareSkins = arg_5_0:GetShareSkins()
end

function var_0_0.getUIName(arg_6_0)
	return "SwichSkinLayer"
end

function var_0_0.back(arg_7_0)
	arg_7_0:emit(var_0_0.ON_CLOSE)
end

function var_0_0.init(arg_8_0)
	arg_8_0.shareBtn = arg_8_0:findTF("select_skin/share_btn")
end

function var_0_0.didEnter(arg_9_0)
	arg_9_0:initSelectSkinPanel()
	triggerToggle(arg_9_0.shareBtn, false)
	setActive(arg_9_0.shareBtn, #arg_9_0.shareSkins > 0)
end

function var_0_0.initSelectSkinPanel(arg_10_0)
	arg_10_0.skinPanel = arg_10_0._tf

	local var_10_0 = arg_10_0:findTF("select_skin/btnBack", arg_10_0.skinPanel)
	local var_10_1 = arg_10_0:findTF("print", arg_10_0.skinPanel)

	onButton(arg_10_0, var_10_0, function()
		arg_10_0:back()
	end)
	onButton(arg_10_0, var_10_1, function()
		arg_10_0:back()
	end)
	onToggle(arg_10_0, arg_10_0.shareBtn, function(arg_13_0)
		if arg_13_0 then
			arg_10_0:Flush(arg_10_0.shareSkins)
		else
			arg_10_0:Flush(arg_10_0.skins)
		end
	end, SFX_PANEL)

	arg_10_0.skinScroll = arg_10_0:findTF("select_skin/style_scroll", arg_10_0.skinPanel)
	arg_10_0.skinContainer = arg_10_0:findTF("view_port", arg_10_0.skinScroll)
	arg_10_0.skinCard = arg_10_0._go:GetComponent(typeof(ItemList)).prefabItem[0]

	setActive(arg_10_0.skinCard, false)

	arg_10_0.skinCardMap = {}
end

function var_0_0.openSelectSkinPanel(arg_14_0)
	arg_14_0:Flush(arg_14_0.skins)
end

function var_0_0.Flush(arg_15_0, arg_15_1)
	for iter_15_0 = arg_15_0.skinContainer.childCount, #arg_15_1 - 1 do
		cloneTplTo(arg_15_0.skinCard, arg_15_0.skinContainer)
	end

	for iter_15_1 = #arg_15_1, arg_15_0.skinContainer.childCount - 1 do
		setActive(arg_15_0.skinContainer:GetChild(iter_15_1), false)
	end

	local var_15_0 = getProxy(ShipSkinProxy)
	local var_15_1 = arg_15_0.skinContainer.childCount

	for iter_15_2, iter_15_3 in ipairs(arg_15_1) do
		local var_15_2 = arg_15_0.skinContainer:GetChild(iter_15_2 - 1)
		local var_15_3 = arg_15_0.skinCardMap[var_15_2]

		if not var_15_3 then
			var_15_3 = ShipSkinCard.New(var_15_2.gameObject)
			arg_15_0.skinCardMap[var_15_2] = var_15_3
		end

		local var_15_4 = arg_15_0.shipVO:getRemouldSkinId() == iter_15_3.id and arg_15_0.shipVO:isRemoulded()
		local var_15_5 = arg_15_0.shipVO:proposeSkinOwned(iter_15_3) or table.contains(arg_15_0.skinList, iter_15_3.id) or var_15_4 or iter_15_3.skin_type == ShipSkin.SKIN_TYPE_OLD or var_15_0:hasSkin(iter_15_3.id)

		var_15_3:updateData(arg_15_0.shipVO, iter_15_3, var_15_5)

		local var_15_6 = arg_15_0.shipVO:useSkin(iter_15_3.id)

		var_15_3:updateUsing(var_15_6)
		removeOnButton(var_15_2)

		local var_15_7 = arg_15_0.shipVO:getRemouldSkinId() == iter_15_3.id and arg_15_0.shipVO:isRemoulded()
		local var_15_8 = (arg_15_0.shipVO:proposeSkinOwned(iter_15_3) or table.contains(arg_15_0.skinList, iter_15_3.id) or var_15_7) and 1 or 0
		local var_15_9 = iter_15_3.shop_id > 0 and pg.shop_template[iter_15_3.shop_id] or nil
		local var_15_10 = var_15_9 and not pg.TimeMgr.GetInstance():inTime(var_15_9.time)
		local var_15_11 = iter_15_3.id == arg_15_0.shipVO.skinId
		local var_15_12 = iter_15_3.id == arg_15_0.shipVO:getConfig("skin_id") or var_15_8 >= 1 or iter_15_3.skin_type == ShipSkin.SKIN_TYPE_OLD or var_15_0:hasSkin(iter_15_3.id)
		local var_15_13 = getProxy(ShipSkinProxy):InForbiddenSkinListAndShow(iter_15_3.id)

		onToggle(arg_15_0, var_15_3.hideObjToggleTF, function(arg_16_0)
			PlayerPrefs.SetInt("paint_hide_other_obj_" .. var_15_3.paintingName, arg_16_0 and 1 or 0)
			var_15_3:flushSkin()
			arg_15_0:emit(SwichSkinMediator.UPDATE_SKINCONFIG, arg_15_0.shipVO.skinId)
		end, SFX_PANEL)
		onButton(arg_15_0, var_15_3.changeSkinTF, function(arg_17_0)
			local var_17_0 = ShipGroup.GetChangeSkinNextId(iter_15_3.id)
			local var_17_1 = ShipGroup.GetChangeSkinGroupId(iter_15_3.id)

			ShipGroup.SetShipChangeSkin(arg_15_0.shipVO.id, var_17_1, var_17_0, true)
		end, SFX_PANEL)
		onButton(arg_15_0, var_15_2, function()
			if var_15_11 then
				arg_15_0:back()
			elseif ShipSkin.IsShareSkin(arg_15_0.shipVO, iter_15_3.id) and not ShipSkin.CanUseShareSkinForShip(arg_15_0.shipVO, iter_15_3.id) then
				-- block empty
			elseif var_15_12 then
				arg_15_0:emit(SwichSkinMediator.CHANGE_SKIN, arg_15_0.shipVO.id, iter_15_3.id == arg_15_0.shipVO:getConfig("skin_id") and 0 or iter_15_3.id)
				arg_15_0:back()
			elseif var_15_9 then
				if var_15_10 or var_15_13 then
					pg.TipsMgr.GetInstance():ShowTips(i18n("common_skin_out_of_stock"))
				else
					local var_18_0 = Goods.Create({
						shop_id = var_15_9.id
					}, Goods.TYPE_SKIN)

					if var_18_0:isDisCount() and var_18_0:IsItemDiscountType() then
						arg_15_0:emit(SwichSkinMediator.BUY_ITEM_BY_ACT, var_15_9.id, 1)
					else
						local var_18_1 = var_18_0:GetPrice()
						local var_18_2 = i18n("text_buy_fashion_tip", var_18_1, iter_15_3.name)

						pg.MsgboxMgr.GetInstance():ShowMsgBox({
							content = var_18_2,
							onYes = function()
								arg_15_0:emit(SwichSkinMediator.BUY_ITEM, var_15_9.id, 1)
							end
						})
					end
				end
			end
		end)
		setActive(var_15_2, true)
	end
end

function var_0_0.getGroupSkinList(arg_20_0, arg_20_1)
	return getProxy(ShipSkinProxy):GetAllSkinForShip(arg_20_0.shipVO)
end

function var_0_0.willExit(arg_21_0)
	for iter_21_0, iter_21_1 in pairs(arg_21_0.skinCardMap) do
		iter_21_1:clear()
	end
end

return var_0_0
