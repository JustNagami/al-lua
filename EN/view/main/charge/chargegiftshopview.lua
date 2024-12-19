local var_0_0 = class("ChargeGiftShopView", import("...base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "ChargeGiftShopUI"
end

function var_0_0.OnInit(arg_2_0)
	arg_2_0:initData()
	arg_2_0:initUI()
	arg_2_0:Show()
end

function var_0_0.OnDestroy(arg_3_0)
	for iter_3_0, iter_3_1 in pairs(arg_3_0.chargeCardTable or {}) do
		iter_3_1:destoryTimer()
	end

	arg_3_0:removeUpdateTimer()
end

function var_0_0.initData(arg_4_0)
	arg_4_0.giftGoodsVOList = {}
	arg_4_0.giftGoodsVOListForShow = {}
	arg_4_0.updateTime = nil
	arg_4_0.updateTimer = nil
	arg_4_0.player = getProxy(PlayerProxy):getData()

	arg_4_0:updateData()
end

function var_0_0.initUI(arg_5_0)
	arg_5_0.lScrollRect = GetComponent(arg_5_0._tf, "LScrollRect")
	arg_5_0.chargeCardTable = {}

	arg_5_0:initScrollRect()
	arg_5_0:updateScrollRect()
end

function var_0_0.initScrollRect(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	arg_6_0.chargeCardTable = {}

	local function var_6_0(arg_7_0)
		local var_7_0 = ChargeCard.New(arg_7_0)

		onButton(arg_6_0, var_7_0.tr, function()
			if var_7_0.goods:isChargeType() then
				switch(var_7_0.goods:getShowType(), {
					[Goods.SHOW_TYPE_TECH] = function()
						arg_6_0:emit(ChargeMediator.OPEN_TEC_SHIP_GIFT_SELL_LAYER, var_7_0.goods, arg_6_0.chargedList)
					end,
					[Goods.SHOW_TYPE_BATTLE_UI] = function()
						arg_6_0:emit(ChargeMediator.OPEN_BATTLE_UI_SELL_LAYER, var_7_0.goods, arg_6_0.chargedList)
					end
				}, function()
					arg_6_0:confirm(var_7_0.goods)
				end)
			else
				arg_6_0:confirm(var_7_0.goods)
			end
		end, SFX_PANEL)
		onButton(arg_6_0, var_7_0.viewBtn, function()
			if not var_7_0.goods:isChargeType() then
				return
			end

			local var_12_0 = var_7_0.goods:GetSkinProbability()
			local var_12_1 = getProxy(ShipSkinProxy):GetProbabilitySkins(var_12_0)

			if #var_12_0 <= 0 or #var_12_0 ~= #var_12_1 then
				local var_12_2 = var_7_0.goods:GetSkinProbabilityItem()

				arg_6_0:emit(BaseUI.ON_DROP, var_12_2)
			else
				arg_6_0:emit(ChargeMediator.VIEW_SKIN_PROBABILITY, var_7_0.goods.id)
			end
		end, SFX_PANEL)

		arg_6_0.chargeCardTable[arg_7_0] = var_7_0
	end

	local function var_6_1(arg_13_0, arg_13_1)
		local var_13_0 = arg_6_0.chargeCardTable[arg_13_1]

		if not var_13_0 then
			var_6_0(arg_13_1)

			var_13_0 = arg_6_0.chargeCardTable[arg_13_1]
		end

		local var_13_1 = arg_6_0.giftGoodsVOListForShow[arg_13_0 + 1]

		if var_13_1 then
			var_13_0:update(var_13_1, arg_6_0.player, arg_6_0.firstChargeIds)
		end
	end

	arg_6_0.lScrollRect.onInitItem = var_6_0
	arg_6_0.lScrollRect.onUpdateItem = var_6_1
end

function var_0_0.updateScrollRect(arg_14_0)
	arg_14_0.lScrollRect:SetTotalCount(#arg_14_0.giftGoodsVOListForShow, arg_14_0.lScrollRect.value)
end

function var_0_0.confirm(arg_15_0, arg_15_1)
	if not arg_15_1 then
		return
	end

	arg_15_1 = Clone(arg_15_1)

	if arg_15_1:isChargeType() then
		local var_15_0 = not table.contains(arg_15_0.firstChargeIds, arg_15_1.id) and arg_15_1:firstPayDouble()
		local var_15_1 = var_15_0 and 4 or arg_15_1:getConfig("tag")

		if arg_15_1:isMonthCard() or arg_15_1:isGiftBox() or arg_15_1:isItemBox() or arg_15_1:isPassItem() then
			local var_15_2 = arg_15_1:GetExtraServiceItem()
			local var_15_3 = arg_15_1:GetExtraDrop()
			local var_15_4 = arg_15_1:GetBonusItem()
			local var_15_5
			local var_15_6

			if arg_15_1:isPassItem() then
				var_15_5 = i18n("battlepass_pay_tip")
			elseif arg_15_1:isMonthCard() then
				var_15_5 = i18n("charge_title_getitem_month")
				var_15_6 = i18n("charge_title_getitem_soon")
			else
				var_15_5 = i18n("charge_title_getitem")
			end

			local var_15_7 = {
				isChargeType = true,
				icon = "chargeicon/" .. arg_15_1:getConfig("picture"),
				name = arg_15_1:getConfig("name_display"),
				tipExtra = var_15_5,
				extraItems = var_15_2,
				price = arg_15_1:getConfig("money"),
				isLocalPrice = arg_15_1:IsLocalPrice(),
				tagType = var_15_1,
				isMonthCard = arg_15_1:isMonthCard(),
				tipBonus = var_15_6,
				bonusItem = var_15_4,
				extraDrop = var_15_3,
				descExtra = arg_15_1:getConfig("descrip_extra"),
				limitArgs = arg_15_1:getConfig("limit_args"),
				onYes = function()
					if ChargeConst.isNeedSetBirth() then
						arg_15_0:emit(ChargeMediator.OPEN_CHARGE_BIRTHDAY)
					else
						arg_15_0:emit(ChargeMediator.CHARGE, arg_15_1.id)
					end
				end
			}

			arg_15_0:emit(ChargeMediator.OPEN_CHARGE_ITEM_PANEL, var_15_7)
		elseif arg_15_1:isGem() then
			local var_15_8 = arg_15_1:getConfig("money")
			local var_15_9 = arg_15_1:getConfig("gem")

			if var_15_0 then
				var_15_9 = var_15_9 + arg_15_1:getConfig("gem")
			else
				var_15_9 = var_15_9 + arg_15_1:getConfig("extra_gem")
			end

			local var_15_10 = {
				isChargeType = true,
				icon = "chargeicon/" .. arg_15_1:getConfig("picture"),
				name = arg_15_1:getConfig("name_display"),
				price = arg_15_1:getConfig("money"),
				isLocalPrice = arg_15_1:IsLocalPrice(),
				tagType = var_15_1,
				normalTip = i18n("charge_start_tip", var_15_8, var_15_9),
				onYes = function()
					if ChargeConst.isNeedSetBirth() then
						arg_15_0:emit(ChargeMediator.OPEN_CHARGE_BIRTHDAY)
					else
						arg_15_0:emit(ChargeMediator.CHARGE, arg_15_1.id)
					end
				end
			}

			arg_15_0:emit(ChargeMediator.OPEN_CHARGE_ITEM_BOX, var_15_10)
		end
	else
		local var_15_11 = {}
		local var_15_12 = arg_15_1:getConfig("effect_args")
		local var_15_13 = Item.getConfigData(var_15_12[1])
		local var_15_14 = var_15_13.display_icon

		if type(var_15_14) == "table" then
			for iter_15_0, iter_15_1 in ipairs(var_15_14) do
				table.insert(var_15_11, Drop.New({
					type = iter_15_1[1],
					id = iter_15_1[2],
					count = iter_15_1[3]
				}))
			end
		end

		local var_15_15 = {
			isMonthCard = false,
			isChargeType = false,
			isLocalPrice = false,
			icon = var_15_13.icon,
			name = var_15_13.name,
			tipExtra = i18n("charge_title_getitem"),
			extraItems = var_15_11,
			price = arg_15_1:getConfig("resource_num"),
			tagType = arg_15_1:getConfig("tag"),
			onYes = function()
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("charge_scene_buy_confirm", arg_15_1:getConfig("resource_num"), var_15_13.name),
					onYes = function()
						arg_15_0:emit(ChargeMediator.BUY_ITEM, arg_15_1.id, 1)
					end
				})
			end
		}

		arg_15_0:emit(ChargeMediator.OPEN_CHARGE_ITEM_PANEL, var_15_15)
	end
end

function var_0_0.updateGiftGoodsVOList(arg_20_0)
	arg_20_0.giftGoodsVOList = {}

	local var_20_0 = RefluxShopView.getAllRefluxPackID()
	local var_20_1 = pg.pay_data_display

	for iter_20_0, iter_20_1 in pairs(var_20_1.all) do
		if not table.contains(var_20_0, iter_20_1) then
			local var_20_2 = var_20_1[iter_20_1].extra_service

			if var_20_2 == Goods.ITEM_BOX or var_20_2 == Goods.PASS_ITEM then
				local var_20_3 = Goods.Create({
					shop_id = iter_20_1
				}, Goods.TYPE_CHARGE)

				if arg_20_0:filterLimitTypeGoods(var_20_3) then
					table.insert(arg_20_0.giftGoodsVOList, var_20_3)
				end
			end
		end
	end

	for iter_20_2, iter_20_3 in pairs(pg.shop_template.get_id_list_by_genre.gift_package) do
		if not table.contains(var_20_0, iter_20_3) then
			local var_20_4 = Goods.Create({
				shop_id = iter_20_3
			}, Goods.TYPE_GIFT_PACKAGE)

			table.insert(arg_20_0.giftGoodsVOList, var_20_4)
		end
	end
end

function var_0_0.sortGiftGoodsVOList(arg_21_0)
	arg_21_0.giftGoodsVOListForShow = {}

	for iter_21_0, iter_21_1 in ipairs(arg_21_0.giftGoodsVOList) do
		if iter_21_1:isChargeType() then
			local var_21_0 = ChargeConst.getBuyCount(arg_21_0.chargedList, iter_21_1.id)

			iter_21_1:updateBuyCount(var_21_0)

			if iter_21_1:canPurchase() and iter_21_1:inTime() then
				table.insert(arg_21_0.giftGoodsVOListForShow, iter_21_1)
			end
		elseif not iter_21_1:isLevelLimit(arg_21_0.player.level, true) then
			local var_21_1 = ChargeConst.getBuyCount(arg_21_0.normalList, iter_21_1.id)

			iter_21_1:updateBuyCount(var_21_1)

			local var_21_2 = iter_21_1:getConfig("group") or 0
			local var_21_3 = false

			if var_21_2 > 0 then
				local var_21_4 = iter_21_1:getConfig("group_limit")
				local var_21_5 = ChargeConst.getGroupLimit(arg_21_0.normalGroupList, var_21_2)

				iter_21_1:updateGroupCount(var_21_5)

				var_21_3 = var_21_4 > 0 and var_21_4 <= var_21_5
			end

			local var_21_6, var_21_7 = pg.TimeMgr.GetInstance():inTime(iter_21_1:getConfig("time"))

			if var_21_7 then
				arg_21_0:addUpdateTimer(var_21_7)
			end

			if var_21_6 and iter_21_1:canPurchase() and not var_21_3 then
				table.insert(arg_21_0.giftGoodsVOListForShow, iter_21_1)
			end
		end
	end

	local function var_21_8(arg_22_0)
		local var_22_0 = arg_22_0:getConfig("time")
		local var_22_1 = 0

		if type(var_22_0) == "string" then
			var_22_1 = var_22_1 + 999999999999
		elseif type(var_22_0) == "table" then
			var_22_1 = pg.TimeMgr.GetInstance():parseTimeFromConfig(var_22_0[2]) - pg.TimeMgr.GetInstance():GetServerTime()
			var_22_1 = var_22_1 > 0 and var_22_1 or 999999999999
		else
			var_22_1 = var_22_1 + 999999999999
		end

		return var_22_1
	end

	local var_21_9 = {}
	local var_21_10 = getProxy(ActivityProxy)

	for iter_21_2, iter_21_3 in ipairs(var_21_10:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_GIFT_UP)) do
		if var_21_10:IsActivityNotEnd(iter_21_3.id) then
			underscore(iter_21_3:getConfig("config_client").gifts):chain():flatten():map(function(arg_23_0)
				var_21_9[arg_23_0] = true
			end)
		end
	end

	table.sort(arg_21_0.giftGoodsVOListForShow, CompareFuncs({
		function(arg_24_0)
			return var_21_9[arg_24_0.id] and 0 or 1
		end,
		function(arg_25_0)
			return (arg_25_0:getConfig("type_order") - 1) % 1000
		end,
		function(arg_26_0)
			return var_21_8(arg_26_0)
		end,
		function(arg_27_0)
			return -arg_27_0:getConfig("tag")
		end,
		function(arg_28_0)
			return arg_28_0:getConfig("order") or 999
		end,
		function(arg_29_0)
			return arg_29_0.id
		end
	}))
end

function var_0_0.updateGoodsData(arg_30_0)
	arg_30_0.firstChargeIds = arg_30_0.contextData.firstChargeIds
	arg_30_0.chargedList = arg_30_0.contextData.chargedList
	arg_30_0.normalList = arg_30_0.contextData.normalList
	arg_30_0.normalGroupList = arg_30_0.contextData.normalGroupList
end

function var_0_0.setGoodData(arg_31_0, arg_31_1, arg_31_2, arg_31_3, arg_31_4)
	arg_31_0.firstChargeIds = arg_31_1
	arg_31_0.chargedList = arg_31_2
	arg_31_0.normalList = arg_31_3
	arg_31_0.normalGroupList = arg_31_4
end

function var_0_0.updateData(arg_32_0)
	arg_32_0.player = getProxy(PlayerProxy):getData()

	arg_32_0:updateGiftGoodsVOList()
	arg_32_0:sortGiftGoodsVOList()
end

function var_0_0.addUpdateTimer(arg_33_0, arg_33_1)
	local var_33_0 = pg.TimeMgr.GetInstance()
	local var_33_1 = var_33_0:Table2ServerTime(arg_33_1)

	if arg_33_0.updateTime and var_33_1 > var_33_0:Table2ServerTime(arg_33_0.updateTime) then
		return
	end

	arg_33_0.updateTime = arg_33_1

	arg_33_0:removeUpdateTimer()

	arg_33_0.updateTimer = Timer.New(function()
		if var_33_0:GetServerTime() > var_33_1 then
			arg_33_0:removeUpdateTimer()
			arg_33_0:reUpdateAll()
		end
	end, 1, -1)

	arg_33_0.updateTimer:Start()
	arg_33_0.updateTimer.func()
end

function var_0_0.removeUpdateTimer(arg_35_0)
	if arg_35_0.updateTimer then
		arg_35_0.updateTimer:Stop()

		arg_35_0.updateTimer = nil
	end
end

function var_0_0.reUpdateAll(arg_36_0)
	arg_36_0:updateData()
	arg_36_0:updateScrollRect()
end

function var_0_0.filterLimitTypeGoods(arg_37_0, arg_37_1)
	local var_37_0 = arg_37_1:getConfig("limit_type")

	return switch(var_37_0, {
		[3] = function()
			if arg_37_1:getConfig("limit_arg") ~= 0 or arg_37_1:isLevelLimit(arg_37_0.player.level, true) then
				return false
			end

			local var_38_0
			local var_38_1
			local var_38_2

			for iter_38_0, iter_38_1 in ipairs(arg_37_1:getSameLimitGroupTecGoods()) do
				if iter_38_1:getConfig("limit_arg") == 1 then
					var_38_1 = iter_38_1
				elseif iter_38_1:getConfig("limit_arg") == 2 then
					var_38_0 = iter_38_1
				elseif iter_38_1:getConfig("limit_arg") == 3 then
					var_38_2 = iter_38_1
				end
			end

			local var_38_3 = ChargeConst.getBuyCount(arg_37_0.chargedList, var_38_0.id)
			local var_38_4 = ChargeConst.getBuyCount(arg_37_0.chargedList, var_38_1.id)
			local var_38_5 = ChargeConst.getBuyCount(arg_37_0.chargedList, var_38_2.id)

			if var_38_4 > 0 then
				return false
			elseif var_38_3 > 0 and var_38_5 > 0 then
				return false
			else
				return true
			end
		end,
		[5] = function()
			if arg_37_1:getConfig("limit_arg") ~= 0 or arg_37_1:isLevelLimit(arg_37_0.player.level, true) then
				return false
			end

			for iter_39_0, iter_39_1 in ipairs(arg_37_1:getSameLimitGroupTecGoods()) do
				if iter_39_1:getConfig("limit_arg") ~= 0 and ChargeConst.getBuyCount(arg_37_0.chargedList, iter_39_1.id) > 0 then
					return false
				end
			end

			return true
		end
	}, function()
		return true
	end)
end

return var_0_0
