local var_0_0 = class("NewSkinShopScene", import("view.base.BaseUI"))

var_0_0.MODE_OVERVIEW = 1
var_0_0.MODE_EXPERIENCE = 2

local var_0_1 = -1
local var_0_2 = -2
local var_0_3 = -3
local var_0_4 = 9999
local var_0_5 = 9997
local var_0_6 = 9998

var_0_0.PAGE_ALL = var_0_1
var_0_0.optionsPath = {
	"overlay/blur_panel/adapt/top/option"
}

function var_0_0.getUIName(arg_1_0)
	return "NewSkinShopUI"
end

function var_0_0.forceGC(arg_2_0)
	return true
end

function var_0_0.ResUISettings(arg_3_0)
	return {
		anim = true,
		showType = PlayerResUI.TYPE_GEM
	}
end

function var_0_0.GetAllCommodity(arg_4_0)
	return (getProxy(ShipSkinProxy):GetAllSkins())
end

function var_0_0.GetPlayer(arg_5_0)
	return (getProxy(PlayerProxy):getRawData())
end

function var_0_0.GetShopTypeIdBySkinId(arg_6_0, arg_6_1)
	local var_6_0 = pg.ship_skin_template.get_id_list_by_shop_type_id

	if not var_0_0.shopTypeIdList then
		var_0_0.shopTypeIdList = {}
	end

	if var_0_0.shopTypeIdList[arg_6_1] then
		return var_0_0.shopTypeIdList[arg_6_1]
	end

	for iter_6_0, iter_6_1 in pairs(var_6_0) do
		for iter_6_2, iter_6_3 in ipairs(iter_6_1) do
			var_0_0.shopTypeIdList[iter_6_3] = iter_6_0

			if iter_6_3 == arg_6_1 then
				return iter_6_0
			end
		end
	end
end

function var_0_0.GetSkinClassify(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = {}
	local var_7_1 = {}

	for iter_7_0, iter_7_1 in ipairs(arg_7_1) do
		local var_7_2 = arg_7_0:GetShopTypeIdBySkinId(iter_7_1:getSkinId())
		local var_7_3 = var_7_2 == 0 and var_0_4 or var_7_2

		var_7_1[var_7_3] = (var_7_1[var_7_3] or 0) + 1
	end

	if #arg_7_0:GetReturnSkins() > 0 then
		table.insert(var_7_0, var_0_3)
	end

	for iter_7_2, iter_7_3 in ipairs(pg.skin_page_template.all) do
		if iter_7_3 ~= var_0_5 and iter_7_3 ~= var_0_6 and (var_7_1[iter_7_3] or 0) > 0 then
			table.insert(var_7_0, iter_7_3)
		end
	end

	if arg_7_2 == var_0_0.MODE_EXPERIENCE then
		table.insert(var_7_0, 1, var_0_2)
	end

	table.insert(var_7_0, 1, var_0_1)

	return var_7_0
end

function var_0_0.GetReturnSkins(arg_8_0)
	if not arg_8_0.returnSkins then
		arg_8_0.returnSkins = getProxy(ShipSkinProxy):GetEncoreSkins()
	end

	return arg_8_0.returnSkins
end

function var_0_0.GetReturnSkinMap(arg_9_0)
	if not arg_9_0.encoreSkinMap then
		arg_9_0.encoreSkinMap = {}

		local var_9_0 = arg_9_0:GetReturnSkins()

		for iter_9_0, iter_9_1 in ipairs(var_9_0) do
			arg_9_0.encoreSkinMap[iter_9_1] = true
		end
	end

	return arg_9_0.encoreSkinMap
end

function var_0_0.OnFurnitureUpdate(arg_10_0, arg_10_1)
	if not arg_10_0.mainView.commodity then
		return
	end

	local var_10_0 = arg_10_0.mainView.commodity.id

	if Goods.ExistFurniture(var_10_0) and Goods.Id2FurnitureId(var_10_0) == arg_10_1 then
		arg_10_0.mainView:Flush(arg_10_0.mainView.commodity)
	end
end

function var_0_0.OnShopping(arg_11_0, arg_11_1)
	if not arg_11_0.mainView.commodity then
		return
	end

	arg_11_0.mainView:ClosePurchaseView()

	if arg_11_0.mainView.commodity.id == arg_11_1 then
		local var_11_0 = arg_11_0:GetAllCommodity()
		local var_11_1 = _.detect(var_11_0, function(arg_12_0)
			return arg_12_0.id == arg_11_1
		end)

		if var_11_1 then
			arg_11_0.mainView:Flush(var_11_1)
		end

		arg_11_0:UpdateCouponBtn()
		arg_11_0:UpdateVoucherBtn()
		arg_11_0:UpdateCommodities(var_11_0, false)

		arg_11_0.commodities = var_11_0
	end
end

function var_0_0.init(arg_13_0)
	arg_13_0.cgGroup = arg_13_0._tf:GetComponent(typeof(CanvasGroup))
	arg_13_0.backBtn = arg_13_0:findTF("overlay/blur_panel/adapt/top/back_btn")
	arg_13_0.atlasBtn = arg_13_0:findTF("overlay/bottom/bg/atlas")
	arg_13_0.prevBtn = arg_13_0:findTF("overlay/bottom/bg/left_arr")
	arg_13_0.nextBtn = arg_13_0:findTF("overlay/bottom/bg/right_arr")
	arg_13_0.live2dFilter = arg_13_0:findTF("overlay/blur_panel/adapt/top/live2d")
	arg_13_0.live2dFilterSel = arg_13_0.live2dFilter:Find("selected")
	arg_13_0.indexBtn = arg_13_0:findTF("overlay/blur_panel/adapt/top/index_btn")
	arg_13_0.indexBtnSel = arg_13_0.indexBtn:Find("sel")
	arg_13_0.inptuTr = arg_13_0:findTF("overlay/blur_panel/adapt/top/search")
	arg_13_0.changeBtn = arg_13_0:findTF("overlay/blur_panel/adapt/top/change_btn")

	setText(arg_13_0.inptuTr:Find("holder"), i18n("skinatlas_search_holder"))

	arg_13_0.couponTr = arg_13_0:findTF("overlay/blur_panel/adapt/top/discount/coupon")
	arg_13_0.couponSelTr = arg_13_0.couponTr:Find("selected")
	arg_13_0.voucherTr = arg_13_0:findTF("overlay/blur_panel/adapt/top/discount/voucher")
	arg_13_0.voucherSelTr = arg_13_0.voucherTr:Find("selected")
	arg_13_0.rollingCircleRect = RollingCircleRect.New(arg_13_0:findTF("overlay/left/mask/content/0"), arg_13_0:findTF("overlay/left"))

	arg_13_0.rollingCircleRect:SetCallback(arg_13_0, var_0_0.OnSelectSkinPage, var_0_0.OnConfirmSkinPage)

	arg_13_0.rollingCircleMaskTr = arg_13_0:findTF("overlay/left")
	arg_13_0.mainView = NewSkinShopMainView.New(arg_13_0._tf, arg_13_0.event)
	arg_13_0.title = arg_13_0:findTF("overlay/blur_panel/adapt/top/title"):GetComponent(typeof(Image))
	arg_13_0.titleEn = arg_13_0:findTF("overlay/blur_panel/adapt/top/title_en"):GetComponent(typeof(Image))
	arg_13_0.scrollrect = arg_13_0:findTF("overlay/bottom/scroll"):GetComponent("LScrollRect")
	arg_13_0.scrollrect.isNewLoadingMethod = true

	function arg_13_0.scrollrect.onInitItem(arg_14_0)
		arg_13_0:OnInitItem(arg_14_0)
	end

	function arg_13_0.scrollrect.onUpdateItem(arg_15_0, arg_15_1)
		arg_13_0:OnUpdateItem(arg_15_0, arg_15_1)
	end

	arg_13_0.emptyTr = arg_13_0:findTF("bgs/empty")
	arg_13_0.defaultIndex = {
		typeIndex = ShipIndexConst.TypeAll,
		campIndex = ShipIndexConst.CampAll,
		rarityIndex = ShipIndexConst.RarityAll,
		extraIndex = SkinIndexLayer.ExtraALL
	}
	Input.multiTouchEnabled = false
end

function var_0_0.didEnter(arg_16_0)
	onButton(arg_16_0, arg_16_0.backBtn, function()
		arg_16_0:emit(var_0_0.ON_BACK)
	end, SFX_CANCEL)
	onButton(arg_16_0, arg_16_0.atlasBtn, function()
		arg_16_0:emit(NewSkinShopMediator.ON_ATLAS)
	end, SFX_PANEL)
	onButton(arg_16_0, arg_16_0.prevBtn, function()
		arg_16_0:OnPrevCommodity()
	end, SFX_PANEL)
	onButton(arg_16_0, arg_16_0.nextBtn, function()
		arg_16_0:OnNextCommodity()
	end, SFX_PANEL)
	onButton(arg_16_0, arg_16_0.indexBtn, function()
		arg_16_0:emit(NewSkinShopMediator.ON_INDEX, {
			OnFilter = function(arg_22_0)
				arg_16_0:OnFilter(arg_22_0)
			end,
			defaultIndex = arg_16_0.defaultIndex
		})
	end, SFX_PANEL)
	onInputChanged(arg_16_0, arg_16_0.inptuTr, function()
		arg_16_0:OnSearch()
	end)
	onToggle(arg_16_0, arg_16_0.changeBtn, function(arg_24_0)
		if arg_24_0 and getInputText(arg_16_0.inptuTr) ~= "" then
			setInputText(arg_16_0.inptuTr, "")
		end
	end, SFX_PANEL)
	onButton(arg_16_0, arg_16_0.live2dFilter, function()
		arg_16_0.defaultIndex.extraIndex = arg_16_0.defaultIndex.extraIndex == SkinIndexLayer.ExtraL2D and SkinIndexLayer.ExtraALL or SkinIndexLayer.ExtraL2D

		arg_16_0:OnFilter(arg_16_0.defaultIndex)
	end, SFX_PANEL)

	arg_16_0.isFilterCoupon = false

	onButton(arg_16_0, arg_16_0.couponTr, function()
		if not SkinCouponActivity.StaticExistActivityAndCoupon() then
			arg_16_0.isFilterCoupon = false

			arg_16_0:UpdateCouponBtn()
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

			return
		end

		arg_16_0.isFilterCoupon = not arg_16_0.isFilterCoupon

		setActive(arg_16_0.couponSelTr, arg_16_0.isFilterCoupon)
		arg_16_0:OnFilter(arg_16_0.defaultIndex)
	end, SFX_PANEL)

	arg_16_0.isFilterVoucher = false

	onButton(arg_16_0, arg_16_0.voucherTr, function()
		arg_16_0.isFilterVoucher = not arg_16_0.isFilterVoucher

		setActive(arg_16_0.voucherSelTr, arg_16_0.isFilterVoucher)
		arg_16_0:OnFilter(arg_16_0.defaultIndex)
	end, SFX_PANEL)
	arg_16_0:SetUp()
end

function var_0_0.UpdateCouponBtn(arg_28_0)
	local var_28_0 = SkinCouponActivity.StaticExistActivityAndCoupon() and (not arg_28_0.contextData.mode or arg_28_0.contextData.mode == var_0_0.MODE_OVERVIEW)

	if arg_28_0.isFilterCoupon and not var_28_0 then
		arg_28_0.isFilterCoupon = false
	end

	arg_28_0.couponTr.localScale = var_28_0 and Vector3(1, 1, 1) or Vector3(0, 0, 0)
end

function var_0_0.UpdateVoucherBtn(arg_29_0)
	local var_29_0 = #getProxy(BagProxy):GetSkinShopDiscountItemList() > 0 and (not arg_29_0.contextData.mode or arg_29_0.contextData.mode == var_0_0.MODE_OVERVIEW)

	if arg_29_0.isFilterVoucher and not var_29_0 then
		arg_29_0.isFilterVoucher = false
	end

	arg_29_0.voucherTr.localScale = var_29_0 and Vector3(1, 1, 1) or Vector3(0, 0, 0)
end

function var_0_0.OnSelectSkinPage(arg_30_0, arg_30_1)
	if arg_30_0.selectedSkinPageItem then
		setActive(arg_30_0.selectedSkinPageItem._tr:Find("selected"), false)
		setActive(arg_30_0.selectedSkinPageItem._tr:Find("name"), true)
	end

	setActive(arg_30_1._tr:Find("selected"), true)
	setActive(arg_30_1._tr:Find("name"), false)

	arg_30_0.selectedSkinPageItem = arg_30_1
end

function var_0_0.OnConfirmSkinPage(arg_31_0, arg_31_1)
	local var_31_0 = arg_31_1:GetID()

	if arg_31_0.skinPageID ~= var_31_0 then
		arg_31_0.skinPageID = var_31_0

		if arg_31_0.commodities then
			arg_31_0:UpdateCommodities(arg_31_0.commodities, true)
		end
	end
end

function var_0_0.OnFilter(arg_32_0, arg_32_1)
	arg_32_0.defaultIndex = {
		typeIndex = arg_32_1.typeIndex,
		campIndex = arg_32_1.campIndex,
		rarityIndex = arg_32_1.rarityIndex,
		extraIndex = arg_32_1.extraIndex
	}

	setActive(arg_32_0.live2dFilterSel, arg_32_1.extraIndex == SkinIndexLayer.ExtraL2D)

	if arg_32_0.commodities then
		arg_32_0:UpdateCommodities(arg_32_0.commodities, true)
	end

	setActive(arg_32_0.indexBtnSel, arg_32_1.typeIndex ~= ShipIndexConst.TypeAll or arg_32_1.campIndex ~= ShipIndexConst.CampAll or arg_32_1.rarityIndex ~= ShipIndexConst.RarityAll or arg_32_1.extraIndex ~= SkinIndexLayer.ExtraALL)
end

function var_0_0.OnSearch(arg_33_0)
	if arg_33_0.commodities then
		arg_33_0:UpdateCommodities(arg_33_0.commodities, true)
	end
end

function var_0_0.SetUp(arg_34_0)
	local var_34_0 = arg_34_0.contextData.mode or var_0_0.MODE_OVERVIEW
	local var_34_1 = arg_34_0:GetAllCommodity()

	arg_34_0.cgGroup.blocksRaycasts = false

	arg_34_0:UpdateTitle(var_34_0)
	arg_34_0:UpdateCouponBtn()
	arg_34_0:UpdateVoucherBtn()
	setActive(arg_34_0.rollingCircleMaskTr, var_34_0 == var_0_0.MODE_OVERVIEW)

	if var_34_0 == var_0_0.MODE_EXPERIENCE then
		getProxy(SettingsProxy):SetNextTipTimeLimitSkinShop()
	end

	seriesAsync({
		function(arg_35_0)
			arg_34_0:InitSkinClassify(var_34_1, var_34_0, arg_35_0)
		end,
		function(arg_36_0)
			onNextTick(arg_36_0)
		end,
		function(arg_37_0)
			if arg_34_0.exited then
				return
			end

			arg_34_0:UpdateCommodities(var_34_1, true, arg_37_0)
		end
	}, function()
		arg_34_0.commodities = var_34_1
		arg_34_0.cgGroup.blocksRaycasts = true
	end)
end

function var_0_0.UpdateTitle(arg_39_0, arg_39_1)
	local var_39_0 = {
		"huanzhuangshagndian",
		"title_01"
	}

	arg_39_0.title.sprite = GetSpriteFromAtlas("ui/SkinShopUI_atlas", var_39_0[arg_39_1])

	arg_39_0.title:SetNativeSize()

	local var_39_1 = {
		"huanzhuangshagndian_en",
		"title_en_01"
	}

	arg_39_0.titleEn.sprite = GetSpriteFromAtlas("ui/SkinShopUI_atlas", var_39_1[arg_39_1])

	arg_39_0.titleEn:SetNativeSize()
end

local function var_0_7(arg_40_0, arg_40_1)
	local var_40_0 = pg.skin_page_template
	local var_40_1 = arg_40_1:GetID()
	local var_40_2
	local var_40_3

	if var_40_1 == var_0_1 or var_40_1 == var_0_2 then
		var_40_2, var_40_3 = "text_all", "ALL"
	elseif var_40_1 == var_0_3 then
		var_40_2, var_40_3 = "text_fanchang", "RETURN"
	else
		var_40_2, var_40_3 = "text_" .. var_40_0[var_40_1].res, var_40_0[var_40_1].english_name
	end

	LoadSpriteAtlasAsync("SkinClassified", var_40_2 .. "01", function(arg_41_0)
		if arg_40_0.exited then
			return
		end

		local var_41_0 = arg_40_1._tr:Find("name"):GetComponent(typeof(Image))

		var_41_0.sprite = arg_41_0

		var_41_0:SetNativeSize()
	end)
	LoadSpriteAtlasAsync("SkinClassified", var_40_2, function(arg_42_0)
		if arg_40_0.exited then
			return
		end

		local var_42_0 = arg_40_1._tr:Find("selected/Image"):GetComponent(typeof(Image))

		var_42_0.sprite = arg_42_0

		var_42_0:SetNativeSize()
	end)
	setText(arg_40_1._tr:Find("eng"), var_40_3)
end

function var_0_0.InitSkinClassify(arg_43_0, arg_43_1, arg_43_2, arg_43_3)
	local var_43_0 = arg_43_0:GetSkinClassify(arg_43_1, arg_43_2)
	local var_43_1 = {}

	for iter_43_0, iter_43_1 in ipairs(var_43_0) do
		table.insert(var_43_1, function(arg_44_0)
			if arg_43_0.exited then
				return
			end

			local var_44_0 = arg_43_0.rollingCircleRect:AddItem(iter_43_1)

			var_0_7(arg_43_0, var_44_0)

			if (iter_43_0 - 1) % 3 == 0 or iter_43_0 == #var_43_0 then
				onNextTick(arg_44_0)
			else
				arg_44_0()
			end
		end)
	end

	seriesAsync(var_43_1, function()
		if arg_43_0.exited then
			return
		end

		if arg_43_2 == var_0_0.MODE_EXPERIENCE then
			arg_43_0.rollingCircleRect:ScrollTo(var_0_2)
		else
			arg_43_0.rollingCircleRect:ScrollTo(var_0_1)
		end

		arg_43_3()
	end)
end

function var_0_0.IsType(arg_46_0, arg_46_1, arg_46_2)
	if arg_46_2:getConfig("genre") == ShopArgs.SkinShopTimeLimit then
		return arg_46_1 == var_0_2
	elseif arg_46_1 == var_0_1 then
		return true
	elseif arg_46_1 == var_0_3 and arg_46_0:GetReturnSkinMap()[arg_46_2.id] then
		return true
	else
		local var_46_0 = arg_46_0:GetShopTypeIdBySkinId(arg_46_2:getSkinId())

		return (var_46_0 == 0 and var_0_4 or var_46_0) == arg_46_1
	end

	return false
end

function var_0_0.ToVShip(arg_47_0, arg_47_1)
	if not arg_47_0.vship then
		arg_47_0.vship = {}

		function arg_47_0.vship.getNation()
			return arg_47_0.vship.config.nationality
		end

		function arg_47_0.vship.getShipType()
			return arg_47_0.vship.config.type
		end

		function arg_47_0.vship.getTeamType()
			return TeamType.GetTeamFromShipType(arg_47_0.vship.config.type)
		end

		function arg_47_0.vship.getRarity()
			return arg_47_0.vship.config.rarity
		end
	end

	arg_47_0.vship.config = arg_47_1

	return arg_47_0.vship
end

function var_0_0.IsFilterType(arg_52_0, arg_52_1, arg_52_2)
	local var_52_0 = arg_52_2:getSkinId()
	local var_52_1 = ShipSkin.New({
		id = var_52_0
	})
	local var_52_2 = var_52_1:GetDefaultShipConfig()

	if not var_52_2 then
		return false
	end

	local var_52_3 = arg_52_0:ToVShip(var_52_2)
	local var_52_4 = ShipIndexConst.filterByType(var_52_3, arg_52_1.typeIndex)
	local var_52_5 = ShipIndexConst.filterByCamp(var_52_3, arg_52_1.campIndex)
	local var_52_6 = ShipIndexConst.filterByRarity(var_52_3, arg_52_1.rarityIndex)
	local var_52_7 = SkinIndexLayer.filterByExtra(var_52_1, arg_52_1.extraIndex)

	return var_52_4 and var_52_5 and var_52_6 and var_52_7
end

function var_0_0.IsSearchType(arg_53_0, arg_53_1, arg_53_2)
	local var_53_0 = arg_53_2:getSkinId()

	return ShipSkin.New({
		id = var_53_0
	}):IsMatchKey(arg_53_1)
end

local function var_0_8(arg_54_0, arg_54_1)
	local var_54_0 = (arg_54_0.type == Goods.TYPE_ACTIVITY or arg_54_0.type == Goods.TYPE_ACTIVITY_EXTRA) and 0 or arg_54_0:GetPrice()
	local var_54_1 = (arg_54_1.type == Goods.TYPE_ACTIVITY or arg_54_1.type == Goods.TYPE_ACTIVITY_EXTRA) and 0 or arg_54_1:GetPrice()

	if var_54_0 == var_54_1 then
		return arg_54_0.id < arg_54_1.id
	else
		return var_54_1 < var_54_0
	end
end

function var_0_0.Sort(arg_55_0, arg_55_1, arg_55_2)
	local var_55_0 = arg_55_1.buyCount == 0 and 1 or 0
	local var_55_1 = arg_55_2.buyCount == 0 and 1 or 0

	if var_55_0 == var_55_1 then
		local var_55_2 = arg_55_1:getConfig("order")
		local var_55_3 = arg_55_2:getConfig("order")

		if var_55_2 == var_55_3 then
			return var_0_8(arg_55_1, arg_55_2)
		else
			return var_55_2 < var_55_3
		end
	else
		return var_55_1 < var_55_0
	end
end

function var_0_0.IsCouponType(arg_56_0, arg_56_1, arg_56_2)
	if arg_56_1 and not SkinCouponActivity.StaticIsShop(arg_56_2.id) then
		return false
	end

	return true
end

function var_0_0.IsVoucherType(arg_57_0, arg_57_1, arg_57_2)
	if arg_57_1 and not arg_57_2 then
		return false
	end

	return true
end

function var_0_0.UpdateCommodities(arg_58_0, arg_58_1, arg_58_2, arg_58_3)
	arg_58_0:ClearCards()

	arg_58_0.cards = {}
	arg_58_0.displays = {}
	arg_58_0.canUseVoucherCache = {}

	for iter_58_0, iter_58_1 in ipairs(arg_58_1) do
		local var_58_0 = iter_58_1:CanUseVoucherType()

		if arg_58_0:IsType(arg_58_0.skinPageID, iter_58_1) and arg_58_0:IsFilterType(arg_58_0.defaultIndex, iter_58_1) and arg_58_0:IsSearchType(getInputText(arg_58_0.inptuTr), iter_58_1) and arg_58_0:IsCouponType(arg_58_0.isFilterCoupon, iter_58_1) and arg_58_0:IsVoucherType(arg_58_0.isFilterVoucher, var_58_0) then
			table.insert(arg_58_0.displays, iter_58_1)
		end

		arg_58_0.canUseVoucherCache[iter_58_1.id] = var_58_0
	end

	table.sort(arg_58_0.displays, function(arg_59_0, arg_59_1)
		return arg_58_0:Sort(arg_59_0, arg_59_1)
	end)

	if arg_58_2 then
		arg_58_0.triggerFirstCard = true

		arg_58_0.scrollrect:SetTotalCount(#arg_58_0.displays, 0)
	else
		arg_58_0.scrollrect:SetTotalCount(#arg_58_0.displays)
	end

	local var_58_1 = #arg_58_0.displays <= 0

	setActive(arg_58_0.emptyTr, var_58_1)

	if var_58_1 then
		arg_58_0.mainView:Flush(nil)
	end

	if arg_58_3 then
		arg_58_3()
	end
end

function var_0_0.OnInitItem(arg_60_0, arg_60_1)
	local var_60_0 = NewShopSkinCard.New(arg_60_1)

	onButton(arg_60_0, var_60_0._go, function()
		if not var_60_0.commodity then
			return
		end

		for iter_61_0, iter_61_1 in pairs(arg_60_0.cards) do
			iter_61_1:UpdateSelected(false)
		end

		arg_60_0.selectedId = var_60_0.commodity.id

		var_60_0:UpdateSelected(true)
		arg_60_0:UpdateMainView(var_60_0.commodity)
		arg_60_0:GCHandle()
	end, SFX_PANEL)

	arg_60_0.cards[arg_60_1] = var_60_0
end

function var_0_0.OnUpdateItem(arg_62_0, arg_62_1, arg_62_2)
	local var_62_0 = arg_62_0.cards[arg_62_2]

	if not var_62_0 then
		arg_62_0:OnInitItem(arg_62_2)

		var_62_0 = arg_62_0.cards[arg_62_2]
	end

	local var_62_1 = arg_62_0.displays[arg_62_1 + 1]

	if not var_62_1 then
		return
	end

	local var_62_2 = arg_62_0.selectedId == var_62_1.id
	local var_62_3 = arg_62_0:GetReturnSkinMap()[var_62_1.id]

	var_62_0:Update(var_62_1, var_62_2, var_62_3)

	if arg_62_0.triggerFirstCard and arg_62_1 == 0 then
		arg_62_0.triggerFirstCard = nil

		triggerButton(var_62_0._go)
	end
end

function var_0_0.GCHandle(arg_63_0)
	var_0_0.GCCNT = (var_0_0.GCCNT or 0) + 1

	if var_0_0.GCCNT == 3 then
		gcAll()

		var_0_0.GCCNT = 0
	end
end

function var_0_0.UpdateMainView(arg_64_0, arg_64_1)
	arg_64_0.mainView:Flush(arg_64_1)
end

function var_0_0.GetCommodityIndex(arg_65_0, arg_65_1)
	for iter_65_0, iter_65_1 in ipairs(arg_65_0.displays) do
		if iter_65_1.id == arg_65_1 then
			return iter_65_0
		end
	end
end

function var_0_0.OnPrevCommodity(arg_66_0)
	if not arg_66_0.selectedId then
		return
	end

	local var_66_0 = arg_66_0:GetCommodityIndex(arg_66_0.selectedId)

	if var_66_0 - 1 > 0 then
		arg_66_0:TriggerCommodity(var_66_0, -1)
	end
end

function var_0_0.OnNextCommodity(arg_67_0)
	if not arg_67_0.selectedId then
		return
	end

	local var_67_0 = arg_67_0:GetCommodityIndex(arg_67_0.selectedId)

	if var_67_0 + 1 <= #arg_67_0.displays then
		arg_67_0:TriggerCommodity(var_67_0, 1)
	end
end

function var_0_0.CheckCardBound(arg_68_0, arg_68_1, arg_68_2, arg_68_3, arg_68_4)
	local var_68_0 = getBounds(arg_68_0.scrollrect.gameObject.transform)

	if arg_68_3 then
		local var_68_1 = getBounds(arg_68_2._tf)
		local var_68_2 = getBounds(arg_68_1._tf)

		if math.ceil(var_68_2:GetMax().x - var_68_0:GetMax().x) > var_68_1.size.x then
			local var_68_3 = arg_68_0.scrollrect:HeadIndexToValue(arg_68_4 - 1) - arg_68_0.scrollrect:HeadIndexToValue(arg_68_4)
			local var_68_4 = arg_68_0.scrollrect.value - var_68_3

			arg_68_0.scrollrect:SetNormalizedPosition(var_68_4, 0)
		end
	else
		local var_68_5 = getBounds(arg_68_1._tf)

		if getBounds(arg_68_1._tf.parent):GetMin().x < var_68_0:GetMin().x and var_68_5:GetMin().x < var_68_0:GetMin().x then
			local var_68_6 = arg_68_0.scrollrect:HeadIndexToValue(arg_68_4 - 1)

			arg_68_0.scrollrect:SetNormalizedPosition(var_68_6, 0)
		end
	end
end

function var_0_0.TriggerCommodity(arg_69_0, arg_69_1, arg_69_2)
	local var_69_0 = arg_69_0.displays[arg_69_1]
	local var_69_1 = arg_69_0.displays[arg_69_1 + arg_69_2]
	local var_69_2
	local var_69_3

	for iter_69_0, iter_69_1 in pairs(arg_69_0.cards) do
		if iter_69_1._tf.gameObject.name ~= "-1" then
			if iter_69_1.commodity.id == var_69_1.id then
				var_69_2 = iter_69_1
			elseif iter_69_1.commodity.id == var_69_0.id then
				var_69_3 = iter_69_1
			end
		end
	end

	if var_69_2 then
		triggerButton(var_69_2._tf)
	end

	if var_69_2 and var_69_3 then
		arg_69_0:CheckCardBound(var_69_2, var_69_3, arg_69_2 > 0, arg_69_1 + arg_69_2)
	end
end

function var_0_0.ClearCards(arg_70_0)
	if not arg_70_0.cards then
		return
	end

	for iter_70_0, iter_70_1 in pairs(arg_70_0.cards) do
		iter_70_1:Dispose()
	end

	arg_70_0.cards = nil
end

function var_0_0.willExit(arg_71_0)
	arg_71_0:ClearCards()
	ClearLScrollrect(arg_71_0.scrollrect)

	if arg_71_0.rollingCircleRect then
		arg_71_0.rollingCircleRect:Dispose()

		arg_71_0.rollingCircleRect = nil
	end

	Input.multiTouchEnabled = true

	if arg_71_0.mainView then
		arg_71_0.mainView:Dispose()

		arg_71_0.mainView = nil
	end

	var_0_0.shopTypeIdList = nil
end

return var_0_0
