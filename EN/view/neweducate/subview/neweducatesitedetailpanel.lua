local var_0_0 = class("NewEducateSiteDetailPanel", import("...base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "NewEducateSiteDetailPanel"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.rootTF = arg_2_0._tf:Find("root")
	arg_2_0.shopTF = arg_2_0.rootTF:Find("shop")

	local var_2_0 = arg_2_0.shopTF:Find("goods/content")

	arg_2_0.goodsUIList = UIItemList.New(var_2_0, var_2_0:Find("tpl"))
	arg_2_0.normalTF = arg_2_0.rootTF:Find("normal")
	arg_2_0.titleTF = arg_2_0.normalTF:Find("title/Text")
	arg_2_0.picTF = arg_2_0.normalTF:Find("content/icon_bg/icon_mask/icon")
	arg_2_0.nameTF = arg_2_0.normalTF:Find("content/name")
	arg_2_0.descTF = arg_2_0.normalTF:Find("content/desc_view/mask/desc")
	arg_2_0.enterTF = arg_2_0.normalTF:Find("options/enter")

	setScrollText(arg_2_0.normalTF:Find("options/exit/mask/Text"), i18n("child2_site_exit"))

	arg_2_0.imageColorTFs = {
		arg_2_0.normalTF:Find("title"),
		arg_2_0.normalTF:Find("line"),
		arg_2_0.normalTF:Find("content/azurlane"),
		arg_2_0.normalTF:Find("content/name/Image")
	}
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0.rootTF:Find("bg"), function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.shopTF:Find("close_btn"), function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.normalTF:Find("close_btn"), function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.normalTF:Find("options/exit"), function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	arg_3_0.goodsUIList:make(function(arg_8_0, arg_8_1, arg_8_2)
		if arg_8_0 == UIItemList.EventUpdate then
			arg_3_0:UpdateGoodsItem(arg_8_1, arg_8_2)
		end
	end)
end

function var_0_0.Show(arg_9_0, arg_9_1)
	var_0_0.super.Show(arg_9_0)

	arg_9_0.siteId = arg_9_1

	arg_9_0:Flush()
end

function var_0_0.Flush(arg_10_0)
	local var_10_0 = pg.child2_site_display[arg_10_0.siteId]

	if var_10_0.type == NewEducateConst.SITE_TYPE.SHOP then
		setText(arg_10_0.shopTF:Find("title"), var_10_0.title)
		arg_10_0:ShowShop()
	else
		arg_10_0:ShowNormal(var_10_0)
	end
end

function var_0_0.UpdateCost(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = NewEducateHelper.GetDropConfig(arg_11_2).icon

	LoadImageSpriteAsync("neweducateicon/" .. var_11_0, arg_11_1:Find("Image"))
	setText(arg_11_1:Find("Text"), "-" .. arg_11_2.number)
end

function var_0_0.ShowNormal(arg_12_0, arg_12_1)
	setActive(arg_12_0.shopTF, false)
	setActive(arg_12_0.normalTF, true)
	setText(arg_12_0.titleTF, arg_12_1.title)
	LoadImageSpriteAsync("neweducateicon/" .. arg_12_1.banner, arg_12_0.picTF, true)
	setText(arg_12_0.nameTF, arg_12_1.title)
	setText(arg_12_0.descTF, arg_12_1.desc)

	local var_12_0, var_12_1 = NewEducateHelper.GetSiteColors(arg_12_1.id)

	setTextColor(arg_12_0.nameTF, var_12_1)
	underscore.each(arg_12_0.imageColorTFs, function(arg_13_0)
		setImageColor(arg_13_0, var_12_0)
	end)

	local var_12_2 = {}
	local var_12_3 = ""

	local function var_12_4()
		return
	end

	switch(arg_12_1.type, {
		[NewEducateConst.SITE_TYPE.WORK] = function()
			local var_15_0 = arg_12_0.contextData.char:GetNormalIdByType(NewEducateConst.SITE_NORMAL_TYPE.WORK)
			local var_15_1 = pg.child2_site_normal[var_15_0]

			var_12_3 = var_15_1.title
			var_12_2 = NewEducateHelper.Config2Drop(var_15_1.cost)

			function var_12_4()
				arg_12_0:emit(NewEducateMapMediator.ON_SITE_NORMAL, var_15_1.id)
			end
		end,
		[NewEducateConst.SITE_TYPE.TRAVEL] = function()
			local var_17_0 = arg_12_0.contextData.char:GetNormalIdByType(NewEducateConst.SITE_NORMAL_TYPE.TRAVEL)
			local var_17_1 = pg.child2_site_normal[var_17_0]

			var_12_3 = var_17_1.title
			var_12_2 = NewEducateHelper.Config2Drop(var_17_1.cost)

			function var_12_4()
				arg_12_0:emit(NewEducateMapMediator.ON_SITE_NORMAL, var_17_1.id)
			end
		end,
		[NewEducateConst.SITE_TYPE.SHIP] = function()
			local var_19_0 = pg.child2_site_character[arg_12_1.param]

			var_12_3 = var_19_0.option_name
			var_12_2 = NewEducateHelper.Config2Drop(var_19_0.cost)

			function var_12_4()
				arg_12_0:emit(NewEducateMapMediator.ON_SITE_SHIP, var_19_0.id)
			end
		end,
		[NewEducateConst.SITE_TYPE.EVENT] = function()
			local var_21_0 = pg.child2_site_event_group[arg_12_1.param]

			var_12_3 = var_21_0.option_word
			var_12_2 = NewEducateHelper.Config2Drop(var_21_0.event_cost)

			function var_12_4()
				arg_12_0:emit(NewEducateMapMediator.ON_SITE_EVENT, var_21_0.id)
			end
		end
	})
	setScrollText(arg_12_0.enterTF:Find("mask/Text"), var_12_3)
	arg_12_0:UpdateCost(arg_12_0.enterTF:Find("cost"), var_12_2)

	var_12_2.operator = ">="

	local var_12_5 = not arg_12_0.contextData.char:IsMatch(var_12_2)

	setImageColor(arg_12_0.enterTF, Color.NewHex(var_12_5 and "C8CAD5" or "FFFFFF"))
	setTextColor(arg_12_0.enterTF:Find("mask/Text"), Color.NewHex(var_12_5 and "717171" or "393A3C"))

	if not var_12_5 then
		onButton(arg_12_0, arg_12_0.enterTF, function()
			var_12_4()
			arg_12_0:Hide(true)
		end, SFX_PANEL)
	else
		removeOnButton(arg_12_0.enterTF)
	end
end

function var_0_0.ShowShop(arg_24_0)
	arg_24_0.discountInfos = arg_24_0.contextData.char:GetGoodsDiscountInfos()
	arg_24_0.goods = arg_24_0.contextData.char:GetFSM():GetState(NewEducateFSM.STYSTEM.MAP):GetGoodList()

	table.sort(arg_24_0.goods, CompareFuncs({
		function(arg_25_0)
			local var_25_0 = pg.child2_shop[arg_25_0.id].limit_num

			return arg_25_0:GetRemainCnt() > 0 and 0 or 1
		end,
		function(arg_26_0)
			return arg_26_0:IsLimitCnt() and 0 or 1
		end,
		function(arg_27_0)
			return arg_27_0.id
		end
	}))
	setActive(arg_24_0.shopTF, true)
	setActive(arg_24_0.normalTF, false)
	arg_24_0.goodsUIList:align(#arg_24_0.goods)
end

function var_0_0.UpdateGoodsItem(arg_28_0, arg_28_1, arg_28_2)
	local var_28_0 = arg_28_0.goods[arg_28_1 + 1]

	arg_28_2.name = var_28_0.id

	LoadImageSpriteAsync("neweducateicon/" .. var_28_0:getConfig("icon"), arg_28_2:Find("frame/icon"))
	setText(arg_28_2:Find("name"), var_28_0:getConfig("name"))
	setText(arg_28_2:Find("frame/count_bg/count"), "x" .. var_28_0:getConfig("goods_num"))
	setText(arg_28_2:Find("desc"), var_28_0:getConfig("desc"))
	setActive(arg_28_2:Find("limit_time"), var_28_0:IsLimitTime())
	setActive(arg_28_2:Find("limit_cnt"), var_28_0:IsLimitCnt())

	if var_28_0:IsLimitCnt() then
		setText(arg_28_2:Find("limit_cnt"), i18n("child2_shop_limit_cnt") .. var_28_0:GetRemainCnt() .. "/" .. var_28_0:GetLimitCnt())
	end

	local var_28_1 = var_28_0:GetRemainCnt() <= 0

	setActive(arg_28_2:Find("sold_out"), var_28_1)

	local var_28_2 = var_28_0:GetCostCondition()
	local var_28_3 = var_28_0:GetCostWithBenefit(arg_28_0.discountInfos)
	local var_28_4 = var_28_3.number ~= var_28_2.number and "(" .. var_28_3.number .. ")" or ""

	setText(arg_28_2:Find("price"), var_28_2.number .. var_28_4)

	if var_28_1 then
		removeOnButton(arg_28_2)
	else
		local var_28_5 = arg_28_0.contextData.char:IsMatch(var_28_3)

		onButton(arg_28_0, arg_28_2, function()
			if var_28_5 then
				arg_28_0:emit(NewEducateBaseUI.ON_SHOP, {
					shopId = var_28_0.id,
					price = var_28_3.number,
					onBuy = function()
						arg_28_0:OnClickBuy(var_28_0)
					end
				})
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_resource"))
			end
		end, SFX_PANEL)
	end
end

function var_0_0.OnClickBuy(arg_31_0, arg_31_1)
	seriesAsync({
		function(arg_32_0)
			local var_32_0, var_32_1, var_32_2 = arg_31_0:CheckBenefit(arg_31_1)

			if var_32_0 then
				arg_31_0:emit(NewEducateBaseUI.ON_BOX, {
					content = i18n(var_32_2, var_32_1),
					onYes = arg_32_0
				})
			else
				arg_32_0()
			end
		end,
		function(arg_33_0)
			if arg_31_0:CheckPoint(arg_31_1) then
				arg_31_0:emit(NewEducateBaseUI.ON_BOX, {
					content = i18n("child2_shop_point_sure"),
					onYes = arg_33_0
				})
			else
				arg_33_0()
			end
		end
	}, function()
		arg_31_0:emit(NewEducateMapMediator.ON_SHOPPING, arg_31_1.id)
	end)
end

function var_0_0.CheckBenefit(arg_35_0, arg_35_1)
	if arg_35_1:IsBenefitType() then
		local var_35_0 = arg_35_0.contextData.char:GetStatus(arg_35_1:getConfig("goods_id"))

		if var_35_0 and var_35_0:getConfig("is_tip") == 0 then
			local var_35_1 = var_35_0:getConfig("during_time") == -1 and "child2_shop_benefit_sure2" or "child2_shop_benefit_sure"

			return true, var_35_0:GetEndRound() - arg_35_0.contextData.char:GetRoundData().round, var_35_1
		else
			return false
		end
	end

	return false
end

function var_0_0.CheckPoint(arg_36_0, arg_36_1)
	if arg_36_1:IsResType() then
		local var_36_0 = arg_36_0.contextData.char:GetResIdByType(NewEducateChar.RES_TYPE.ACTION)

		if arg_36_1:getConfig("goods_id") == var_36_0 then
			if arg_36_0.contextData.char:GetPoint(var_36_0) + arg_36_1:getConfig("goods_num") > pg.child2_resource[var_36_0].max_value then
				return true
			else
				return false
			end
		else
			return false
		end
	end

	return false
end

function var_0_0.FlushShop(arg_37_0)
	arg_37_0:ShowShop()
end

function var_0_0.Hide(arg_38_0, arg_38_1)
	if not arg_38_1 then
		existCall(arg_38_0.contextData.onHide)
	end

	arg_38_0.super.Hide(arg_38_0)
end

function var_0_0.OnDestroy(arg_39_0)
	return
end

return var_0_0
