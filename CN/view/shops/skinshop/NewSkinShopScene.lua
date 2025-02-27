local var_0_0 = class("NewSkinShopScene", import("view.base.BaseUI"))

var_0_0.MODE_OVERVIEW = 1
var_0_0.MODE_EXPERIENCE = 2
var_0_0.MODE_EXPERIENCE_FOR_ITEM = 3

local var_0_1 = -1
local var_0_2 = -2
local var_0_3 = -3
local var_0_4 = -4
local var_0_5 = 9999
local var_0_6 = 9997
local var_0_7 = 9998

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
		local var_7_3 = var_7_2 == 0 and var_0_5 or var_7_2

		var_7_1[var_7_3] = (var_7_1[var_7_3] or 0) + 1
	end

	local var_7_4 = {}

	for iter_7_2, iter_7_3 in ipairs(arg_7_0:GetReturnSkins()) do
		var_7_4[iter_7_3] = true
	end

	if underscore.any(arg_7_1, function(arg_8_0)
		return var_7_4[arg_8_0.id]
	end) then
		table.insert(var_7_0, var_0_3)
	end

	for iter_7_4, iter_7_5 in ipairs(pg.skin_page_template.all) do
		if iter_7_5 ~= var_0_6 and iter_7_5 ~= var_0_7 and (var_7_1[iter_7_5] or 0) > 0 then
			table.insert(var_7_0, iter_7_5)
		end
	end

	if arg_7_2 == var_0_0.MODE_EXPERIENCE then
		table.insert(var_7_0, 1, var_0_2)
	end

	if arg_7_2 == var_0_0.MODE_EXPERIENCE_FOR_ITEM then
		table.insert(var_7_0, 1, var_0_4)
	end

	table.insert(var_7_0, 1, var_0_1)

	return var_7_0
end

function var_0_0.GetReturnSkins(arg_9_0)
	if not arg_9_0.returnSkins then
		arg_9_0.returnSkins = getProxy(ShipSkinProxy):GetEncoreSkins()
	end

	return arg_9_0.returnSkins
end

function var_0_0.GetReturnSkinMap(arg_10_0)
	if not arg_10_0.encoreSkinMap then
		arg_10_0.encoreSkinMap = {}

		local var_10_0 = arg_10_0:GetReturnSkins()

		for iter_10_0, iter_10_1 in ipairs(var_10_0) do
			arg_10_0.encoreSkinMap[iter_10_1] = true
		end
	end

	return arg_10_0.encoreSkinMap
end

function var_0_0.OnFurnitureUpdate(arg_11_0, arg_11_1)
	if not arg_11_0.mainView.commodity then
		return
	end

	local var_11_0 = arg_11_0.mainView.commodity.id

	if Goods.ExistFurniture(var_11_0) and Goods.Id2FurnitureId(var_11_0) == arg_11_1 then
		arg_11_0.mainView:Flush(arg_11_0.mainView.commodity)
	end
end

function var_0_0.OnShopping(arg_12_0, arg_12_1)
	if not arg_12_0.mainView.commodity then
		return
	end

	arg_12_0.mainView:ClosePurchaseView()

	if arg_12_0.mainView.commodity.id == arg_12_1 then
		local var_12_0 = arg_12_0:GetAllCommodity()
		local var_12_1 = _.detect(var_12_0, function(arg_13_0)
			return arg_13_0.id == arg_12_1
		end)

		if var_12_1 then
			arg_12_0.mainView:Flush(var_12_1)
		end

		arg_12_0:UpdateCouponBtn()
		arg_12_0:UpdateVoucherBtn()
		arg_12_0:UpdateCommodities(var_12_0, false)

		arg_12_0.commodities = var_12_0
	end
end

function var_0_0.init(arg_14_0)
	arg_14_0.cgGroup = arg_14_0._tf:GetComponent(typeof(CanvasGroup))
	arg_14_0.backBtn = arg_14_0:findTF("overlay/blur_panel/adapt/top/back_btn")
	arg_14_0.atlasBtn = arg_14_0:findTF("overlay/bottom/bg/atlas")
	arg_14_0.prevBtn = arg_14_0:findTF("overlay/bottom/bg/left_arr")
	arg_14_0.nextBtn = arg_14_0:findTF("overlay/bottom/bg/right_arr")
	arg_14_0.live2dFilter = arg_14_0:findTF("overlay/blur_panel/adapt/top/live2d")
	arg_14_0.live2dFilterSel = arg_14_0.live2dFilter:Find("selected")
	arg_14_0.indexBtn = arg_14_0:findTF("overlay/blur_panel/adapt/top/index_btn")
	arg_14_0.indexBtnSel = arg_14_0.indexBtn:Find("sel")
	arg_14_0.inptuTr = arg_14_0:findTF("overlay/blur_panel/adapt/top/search")
	arg_14_0.changeBtn = arg_14_0:findTF("overlay/blur_panel/adapt/top/change_btn")

	setText(arg_14_0.inptuTr:Find("holder"), i18n("skinatlas_search_holder"))

	arg_14_0.couponTr = arg_14_0:findTF("overlay/blur_panel/adapt/top/discount/coupon")
	arg_14_0.couponSelTr = arg_14_0.couponTr:Find("selected")
	arg_14_0.voucherTr = arg_14_0:findTF("overlay/blur_panel/adapt/top/discount/voucher")
	arg_14_0.voucherSelTr = arg_14_0.voucherTr:Find("selected")
	arg_14_0.rollingCircleRect = RollingCircleRect.New(arg_14_0:findTF("overlay/left/mask/content/0"), arg_14_0:findTF("overlay/left"))

	arg_14_0.rollingCircleRect:SetCallback(arg_14_0, var_0_0.OnSelectSkinPage, var_0_0.OnConfirmSkinPage)

	arg_14_0.rollingCircleMaskTr = arg_14_0:findTF("overlay/left")
	arg_14_0.mainView = NewSkinShopMainView.New(arg_14_0._tf, arg_14_0.event, arg_14_0.contextData)
	arg_14_0.title = arg_14_0:findTF("overlay/blur_panel/adapt/top/title"):GetComponent(typeof(Image))
	arg_14_0.titleEn = arg_14_0:findTF("overlay/blur_panel/adapt/top/title_en"):GetComponent(typeof(Image))
	arg_14_0.scrollrect = arg_14_0:findTF("overlay/bottom/scroll"):GetComponent("LScrollRect")
	arg_14_0.scrollrect.isNewLoadingMethod = true

	function arg_14_0.scrollrect.onInitItem(arg_15_0)
		arg_14_0:OnInitItem(arg_15_0)
	end

	function arg_14_0.scrollrect.onUpdateItem(arg_16_0, arg_16_1)
		arg_14_0:OnUpdateItem(arg_16_0, arg_16_1)
	end

	arg_14_0.emptyTr = arg_14_0:findTF("bgs/empty")
	arg_14_0.defaultIndex = {
		typeIndex = ShipIndexConst.TypeAll,
		campIndex = ShipIndexConst.CampAll,
		rarityIndex = ShipIndexConst.RarityAll,
		extraIndex = SkinIndexLayer.ExtraALL
	}
	Input.multiTouchEnabled = false
end

function var_0_0.didEnter(arg_17_0)
	onButton(arg_17_0, arg_17_0.backBtn, function()
		arg_17_0:emit(var_0_0.ON_BACK)
	end, SFX_CANCEL)
	onButton(arg_17_0, arg_17_0.atlasBtn, function()
		arg_17_0:emit(NewSkinShopMediator.ON_ATLAS)
	end, SFX_PANEL)
	onButton(arg_17_0, arg_17_0.prevBtn, function()
		arg_17_0:OnPrevCommodity()
	end, SFX_PANEL)
	onButton(arg_17_0, arg_17_0.nextBtn, function()
		arg_17_0:OnNextCommodity()
	end, SFX_PANEL)
	onButton(arg_17_0, arg_17_0.indexBtn, function()
		arg_17_0:emit(NewSkinShopMediator.ON_INDEX, {
			OnFilter = function(arg_23_0)
				arg_17_0:OnFilter(arg_23_0)
			end,
			defaultIndex = arg_17_0.defaultIndex
		})
	end, SFX_PANEL)
	onInputChanged(arg_17_0, arg_17_0.inptuTr, function()
		arg_17_0:OnSearch()
	end)
	onToggle(arg_17_0, arg_17_0.changeBtn, function(arg_25_0)
		if arg_25_0 and getInputText(arg_17_0.inptuTr) ~= "" then
			setInputText(arg_17_0.inptuTr, "")
		end
	end, SFX_PANEL)
	onButton(arg_17_0, arg_17_0.live2dFilter, function()
		arg_17_0.defaultIndex.extraIndex = arg_17_0.defaultIndex.extraIndex == SkinIndexLayer.ExtraL2D and SkinIndexLayer.ExtraALL or SkinIndexLayer.ExtraL2D

		arg_17_0:OnFilter(arg_17_0.defaultIndex)
	end, SFX_PANEL)

	arg_17_0.isFilterCoupon = false

	onButton(arg_17_0, arg_17_0.couponTr, function()
		if not SkinCouponActivity.StaticExistActivityAndCoupon() then
			arg_17_0.isFilterCoupon = false

			arg_17_0:UpdateCouponBtn()
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

			return
		end

		arg_17_0.isFilterCoupon = not arg_17_0.isFilterCoupon

		setActive(arg_17_0.couponSelTr, arg_17_0.isFilterCoupon)
		arg_17_0:OnFilter(arg_17_0.defaultIndex)
	end, SFX_PANEL)

	arg_17_0.isFilterVoucher = false

	onButton(arg_17_0, arg_17_0.voucherTr, function()
		arg_17_0.isFilterVoucher = not arg_17_0.isFilterVoucher

		setActive(arg_17_0.voucherSelTr, arg_17_0.isFilterVoucher)
		arg_17_0:OnFilter(arg_17_0.defaultIndex)
	end, SFX_PANEL)
	arg_17_0:SetUp()
end

function var_0_0.UpdateCouponBtn(arg_29_0)
	local var_29_0 = SkinCouponActivity.StaticExistActivityAndCoupon() and (not arg_29_0.contextData.mode or arg_29_0.contextData.mode == var_0_0.MODE_OVERVIEW)

	if arg_29_0.isFilterCoupon and not var_29_0 then
		arg_29_0.isFilterCoupon = false
	end

	arg_29_0.couponTr.localScale = var_29_0 and Vector3(1, 1, 1) or Vector3(0, 0, 0)
end

function var_0_0.UpdateVoucherBtn(arg_30_0)
	local var_30_0 = #getProxy(BagProxy):GetSkinShopDiscountItemList() > 0 and (not arg_30_0.contextData.mode or arg_30_0.contextData.mode == var_0_0.MODE_OVERVIEW)

	if arg_30_0.isFilterVoucher and not var_30_0 then
		arg_30_0.isFilterVoucher = false
	end

	arg_30_0.voucherTr.localScale = var_30_0 and Vector3(1, 1, 1) or Vector3(0, 0, 0)
end

function var_0_0.OnSelectSkinPage(arg_31_0, arg_31_1)
	if arg_31_0.selectedSkinPageItem then
		setActive(arg_31_0.selectedSkinPageItem._tr:Find("selected"), false)
		setActive(arg_31_0.selectedSkinPageItem._tr:Find("name"), true)
	end

	setActive(arg_31_1._tr:Find("selected"), true)
	setActive(arg_31_1._tr:Find("name"), false)

	arg_31_0.selectedSkinPageItem = arg_31_1
end

function var_0_0.OnConfirmSkinPage(arg_32_0, arg_32_1)
	local var_32_0 = arg_32_1:GetID()

	if arg_32_0.skinPageID ~= var_32_0 then
		arg_32_0.skinPageID = var_32_0

		if arg_32_0.commodities then
			arg_32_0:UpdateCommodities(arg_32_0.commodities, true)
		end
	end
end

function var_0_0.OnFilter(arg_33_0, arg_33_1)
	arg_33_0.defaultIndex = {
		typeIndex = arg_33_1.typeIndex,
		campIndex = arg_33_1.campIndex,
		rarityIndex = arg_33_1.rarityIndex,
		extraIndex = arg_33_1.extraIndex
	}

	setActive(arg_33_0.live2dFilterSel, arg_33_1.extraIndex == SkinIndexLayer.ExtraL2D)

	if arg_33_0.commodities then
		arg_33_0:UpdateCommodities(arg_33_0.commodities, true)
	end

	setActive(arg_33_0.indexBtnSel, arg_33_1.typeIndex ~= ShipIndexConst.TypeAll or arg_33_1.campIndex ~= ShipIndexConst.CampAll or arg_33_1.rarityIndex ~= ShipIndexConst.RarityAll or arg_33_1.extraIndex ~= SkinIndexLayer.ExtraALL)
end

function var_0_0.OnSearch(arg_34_0)
	if arg_34_0.commodities then
		arg_34_0:UpdateCommodities(arg_34_0.commodities, true)
	end
end

local function var_0_8(arg_35_0)
	if arg_35_0 == var_0_0.MODE_EXPERIENCE then
		return var_0_2
	elseif arg_35_0 == var_0_0.MODE_EXPERIENCE_FOR_ITEM then
		return var_0_4
	else
		return var_0_1
	end
end

function var_0_0.SetUp(arg_36_0)
	local var_36_0 = arg_36_0.contextData.mode or var_0_0.MODE_OVERVIEW

	arg_36_0.mode = var_36_0

	local var_36_1 = arg_36_0:GetAllCommodity()

	arg_36_0.cgGroup.blocksRaycasts = false

	arg_36_0:UpdateTitle(var_36_0)
	arg_36_0:UpdateCouponBtn()
	arg_36_0:UpdateVoucherBtn()
	setActive(arg_36_0.rollingCircleMaskTr, var_36_0 == var_0_0.MODE_OVERVIEW)

	if var_36_0 == var_0_0.MODE_EXPERIENCE or var_36_0 == var_0_0.MODE_EXPERIENCE_FOR_ITEM then
		getProxy(SettingsProxy):SetNextTipTimeLimitSkinShop()
	end

	arg_36_0.skinPageID = var_0_8(var_36_0)

	parallelAsync({
		function(arg_37_0)
			arg_36_0:InitSkinClassify(var_36_1, var_36_0, arg_37_0)
		end,
		function(arg_38_0)
			seriesAsync({
				function(arg_39_0)
					onNextTick(arg_39_0)
				end,
				function(arg_40_0)
					if arg_36_0.exited then
						return
					end

					arg_36_0:UpdateCommodities(var_36_1, true, arg_40_0)
				end
			}, arg_38_0)
		end
	}, function()
		arg_36_0.commodities = var_36_1
		arg_36_0.cgGroup.blocksRaycasts = true
	end)
end

function var_0_0.UpdateTitle(arg_42_0, arg_42_1)
	local var_42_0 = {
		"huanzhuangshagndian",
		"title_01",
		"title_01"
	}

	arg_42_0.title.sprite = GetSpriteFromAtlas("ui/SkinShopUI_atlas", var_42_0[arg_42_1])

	arg_42_0.title:SetNativeSize()

	local var_42_1 = {
		"huanzhuangshagndian_en",
		"title_en_01",
		"title_en_01"
	}

	arg_42_0.titleEn.sprite = GetSpriteFromAtlas("ui/SkinShopUI_atlas", var_42_1[arg_42_1])

	arg_42_0.titleEn:SetNativeSize()
end

local function var_0_9(arg_43_0, arg_43_1)
	local var_43_0 = pg.skin_page_template
	local var_43_1 = arg_43_1:GetID()
	local var_43_2
	local var_43_3

	if var_43_1 == var_0_1 or var_43_1 == var_0_2 or var_43_1 == var_0_4 then
		var_43_2, var_43_3 = "text_all", "ALL"
	elseif var_43_1 == var_0_3 then
		var_43_2, var_43_3 = "text_fanchang", "RETURN"
	else
		var_43_2, var_43_3 = "text_" .. var_43_0[var_43_1].res, var_43_0[var_43_1].english_name
	end

	LoadSpriteAtlasAsync("SkinClassified", var_43_2 .. "01", function(arg_44_0)
		if arg_43_0.exited then
			return
		end

		local var_44_0 = arg_43_1._tr:Find("name"):GetComponent(typeof(Image))

		var_44_0.sprite = arg_44_0

		var_44_0:SetNativeSize()
	end)
	LoadSpriteAtlasAsync("SkinClassified", var_43_2, function(arg_45_0)
		if arg_43_0.exited then
			return
		end

		local var_45_0 = arg_43_1._tr:Find("selected/Image"):GetComponent(typeof(Image))

		var_45_0.sprite = arg_45_0

		var_45_0:SetNativeSize()
	end)
	setText(arg_43_1._tr:Find("eng"), var_43_3)
end

function var_0_0.InitSkinClassify(arg_46_0, arg_46_1, arg_46_2, arg_46_3)
	local var_46_0 = arg_46_0:GetSkinClassify(arg_46_1, arg_46_2)
	local var_46_1 = {}

	for iter_46_0, iter_46_1 in ipairs(var_46_0) do
		table.insert(var_46_1, function(arg_47_0)
			if arg_46_0.exited then
				return
			end

			local var_47_0 = arg_46_0.rollingCircleRect:AddItem(iter_46_1)

			var_0_9(arg_46_0, var_47_0)

			if (iter_46_0 - 1) % 5 == 0 or iter_46_0 == #var_46_0 then
				onNextTick(arg_47_0)
			else
				arg_47_0()
			end
		end)
	end

	seriesAsync(var_46_1, function()
		if arg_46_0.exited then
			return
		end

		arg_46_0.rollingCircleRect:ScrollTo(arg_46_0.skinPageID)
		arg_46_3()
	end)
end

local function var_0_10(arg_49_0)
	if not var_0_0.cacheSkinExperienceItems then
		var_0_0.cacheSkinExperienceItems = getProxy(BagProxy):GetSkinExperienceItems()
	end

	return _.any(var_0_0.cacheSkinExperienceItems, function(arg_50_0)
		return arg_50_0:CanUseForShop(arg_49_0)
	end)
end

function var_0_0.IsType(arg_51_0, arg_51_1, arg_51_2)
	if arg_51_2:getConfig("genre") == ShopArgs.SkinShopTimeLimit then
		if arg_51_0.mode == var_0_0.MODE_EXPERIENCE_FOR_ITEM then
			return arg_51_1 == var_0_4 and var_0_10(arg_51_2.id)
		else
			return arg_51_1 == var_0_2
		end
	elseif arg_51_1 == var_0_1 then
		return true
	elseif arg_51_1 == var_0_3 and arg_51_0:GetReturnSkinMap()[arg_51_2.id] then
		return true
	else
		local var_51_0 = arg_51_0:GetShopTypeIdBySkinId(arg_51_2:getSkinId())

		return (var_51_0 == 0 and var_0_5 or var_51_0) == arg_51_1
	end

	return false
end

function var_0_0.ToVShip(arg_52_0, arg_52_1)
	if not arg_52_0.vship then
		arg_52_0.vship = {}

		function arg_52_0.vship.getNation()
			return arg_52_0.vship.config.nationality
		end

		function arg_52_0.vship.getShipType()
			return arg_52_0.vship.config.type
		end

		function arg_52_0.vship.getTeamType()
			return TeamType.GetTeamFromShipType(arg_52_0.vship.config.type)
		end

		function arg_52_0.vship.getRarity()
			return arg_52_0.vship.config.rarity
		end
	end

	arg_52_0.vship.config = arg_52_1

	return arg_52_0.vship
end

function var_0_0.IsAllFilter(arg_57_0, arg_57_1)
	return arg_57_1.typeIndex == ShipIndexConst.TypeAll and arg_57_1.campIndex == ShipIndexConst.CampAll and arg_57_1.rarityIndex == ShipIndexConst.RarityAll and arg_57_1.extraIndex == SkinIndexLayer.ExtraALL
end

function var_0_0.IsFilterType(arg_58_0, arg_58_1, arg_58_2)
	if arg_58_0:IsAllFilter(arg_58_1) then
		return true
	end

	local var_58_0 = arg_58_2:getSkinId()
	local var_58_1 = ShipSkin.New({
		id = var_58_0
	})
	local var_58_2 = var_58_1:GetDefaultShipConfig()

	if not var_58_2 then
		return false
	end

	local var_58_3 = arg_58_0:ToVShip(var_58_2)
	local var_58_4 = ShipIndexConst.filterByType(var_58_3, arg_58_1.typeIndex)
	local var_58_5 = ShipIndexConst.filterByCamp(var_58_3, arg_58_1.campIndex)
	local var_58_6 = ShipIndexConst.filterByRarity(var_58_3, arg_58_1.rarityIndex)
	local var_58_7 = SkinIndexLayer.filterByExtra(var_58_1, arg_58_1.extraIndex)

	return var_58_4 and var_58_5 and var_58_6 and var_58_7
end

function var_0_0.IsSearchType(arg_59_0, arg_59_1, arg_59_2)
	if not arg_59_1 or arg_59_1 == "" then
		return true
	end

	local var_59_0 = arg_59_2:getSkinId()

	return ShipSkin.New({
		id = var_59_0
	}):IsMatchKey(arg_59_1)
end

local function var_0_11(arg_60_0, arg_60_1, arg_60_2)
	local var_60_0 = arg_60_2[arg_60_0.id]
	local var_60_1 = arg_60_2[arg_60_1.id]

	if var_60_0 == var_60_1 then
		return arg_60_0.id < arg_60_1.id
	else
		return var_60_1 < var_60_0
	end
end

function var_0_0.Sort(arg_61_0, arg_61_1, arg_61_2, arg_61_3)
	local var_61_0 = arg_61_1.buyCount == 0 and 1 or 0
	local var_61_1 = arg_61_2.buyCount == 0 and 1 or 0

	if var_61_0 == var_61_1 then
		local var_61_2 = arg_61_1:getConfig("order")
		local var_61_3 = arg_61_2:getConfig("order")

		if var_61_2 == var_61_3 then
			return var_0_11(arg_61_1, arg_61_2, arg_61_3)
		else
			return var_61_2 < var_61_3
		end
	else
		return var_61_1 < var_61_0
	end
end

function var_0_0.IsCouponType(arg_62_0, arg_62_1, arg_62_2)
	if arg_62_1 and not SkinCouponActivity.StaticIsShop(arg_62_2.id) then
		return false
	end

	return true
end

function var_0_0.IsVoucherType(arg_63_0, arg_63_1, arg_63_2)
	if arg_63_1 and not arg_63_2 then
		return false
	end

	return true
end

function var_0_0.UpdateCommodities(arg_64_0, arg_64_1, arg_64_2, arg_64_3)
	arg_64_0:ClearCards()

	arg_64_0.cards = {}
	arg_64_0.displays = {}
	arg_64_0.canUseVoucherCache = {}

	local var_64_0 = getInputText(arg_64_0.inptuTr)
	local var_64_1 = getProxy(BagProxy):GetSkinShopDiscountItemList()

	for iter_64_0, iter_64_1 in ipairs(arg_64_1) do
		local var_64_2 = iter_64_1:StaticCanUseVoucherType(var_64_1)

		if arg_64_0:IsType(arg_64_0.skinPageID, iter_64_1) and arg_64_0:IsFilterType(arg_64_0.defaultIndex, iter_64_1) and arg_64_0:IsSearchType(var_64_0, iter_64_1) and arg_64_0:IsCouponType(arg_64_0.isFilterCoupon, iter_64_1) and arg_64_0:IsVoucherType(arg_64_0.isFilterVoucher, var_64_2) then
			table.insert(arg_64_0.displays, iter_64_1)
		end

		arg_64_0.canUseVoucherCache[iter_64_1.id] = var_64_2
	end

	local var_64_3 = {}

	for iter_64_2, iter_64_3 in ipairs(arg_64_0.displays) do
		local var_64_4 = iter_64_3.type == Goods.TYPE_ACTIVITY or iter_64_3.type == Goods.TYPE_ACTIVITY_EXTRA
		local var_64_5 = 0

		if not var_64_4 then
			var_64_5 = iter_64_3:GetPrice()
		end

		var_64_3[iter_64_3.id] = var_64_5
	end

	table.sort(arg_64_0.displays, function(arg_65_0, arg_65_1)
		return arg_64_0:Sort(arg_65_0, arg_65_1, var_64_3)
	end)

	if arg_64_2 then
		arg_64_0.triggerFirstCard = true

		arg_64_0.scrollrect:SetTotalCount(#arg_64_0.displays, 0)
	else
		arg_64_0.scrollrect:SetTotalCount(#arg_64_0.displays)
	end

	local var_64_6 = #arg_64_0.displays <= 0

	setActive(arg_64_0.emptyTr, var_64_6)

	if var_64_6 then
		arg_64_0.mainView:Flush(nil)
	end

	if arg_64_3 then
		arg_64_3()
	end
end

function var_0_0.OnInitItem(arg_66_0, arg_66_1)
	local var_66_0 = NewShopSkinCard.New(arg_66_1)

	onButton(arg_66_0, var_66_0._go, function()
		if not var_66_0.commodity then
			return
		end

		for iter_67_0, iter_67_1 in pairs(arg_66_0.cards) do
			iter_67_1:UpdateSelected(false)
		end

		arg_66_0.selectedId = var_66_0.commodity.id

		var_66_0:UpdateSelected(true)
		arg_66_0:UpdateMainView(var_66_0.commodity)
		arg_66_0:GCHandle()
	end, SFX_PANEL)

	arg_66_0.cards[arg_66_1] = var_66_0
end

function var_0_0.OnUpdateItem(arg_68_0, arg_68_1, arg_68_2)
	local var_68_0 = arg_68_0.cards[arg_68_2]

	if not var_68_0 then
		arg_68_0:OnInitItem(arg_68_2)

		var_68_0 = arg_68_0.cards[arg_68_2]
	end

	local var_68_1 = arg_68_0.displays[arg_68_1 + 1]

	if not var_68_1 then
		return
	end

	local var_68_2 = arg_68_0.selectedId == var_68_1.id
	local var_68_3 = arg_68_0:GetReturnSkinMap()[var_68_1.id]

	var_68_0:Update(var_68_1, var_68_2, var_68_3)

	if arg_68_0.triggerFirstCard and arg_68_1 == 0 then
		arg_68_0.triggerFirstCard = nil

		triggerButton(var_68_0._go)
	end
end

function var_0_0.GCHandle(arg_69_0)
	var_0_0.GCCNT = (var_0_0.GCCNT or 0) + 1

	if var_0_0.GCCNT == 3 then
		gcAll()

		var_0_0.GCCNT = 0
	end
end

function var_0_0.UpdateMainView(arg_70_0, arg_70_1)
	arg_70_0.mainView:Flush(arg_70_1)
end

function var_0_0.GetCommodityIndex(arg_71_0, arg_71_1)
	for iter_71_0, iter_71_1 in ipairs(arg_71_0.displays) do
		if iter_71_1.id == arg_71_1 then
			return iter_71_0
		end
	end
end

function var_0_0.OnPrevCommodity(arg_72_0)
	if not arg_72_0.selectedId then
		return
	end

	local var_72_0 = arg_72_0:GetCommodityIndex(arg_72_0.selectedId)

	if var_72_0 - 1 > 0 then
		arg_72_0:TriggerCommodity(var_72_0, -1)
	end
end

function var_0_0.OnNextCommodity(arg_73_0)
	if not arg_73_0.selectedId then
		return
	end

	local var_73_0 = arg_73_0:GetCommodityIndex(arg_73_0.selectedId)

	if var_73_0 + 1 <= #arg_73_0.displays then
		arg_73_0:TriggerCommodity(var_73_0, 1)
	end
end

function var_0_0.CheckCardBound(arg_74_0, arg_74_1, arg_74_2, arg_74_3, arg_74_4)
	local var_74_0 = getBounds(arg_74_0.scrollrect.gameObject.transform)

	if arg_74_3 then
		local var_74_1 = getBounds(arg_74_2._tf)
		local var_74_2 = getBounds(arg_74_1._tf)

		if math.ceil(var_74_2:GetMax().x - var_74_0:GetMax().x) > var_74_1.size.x then
			local var_74_3 = arg_74_0.scrollrect:HeadIndexToValue(arg_74_4 - 1) - arg_74_0.scrollrect:HeadIndexToValue(arg_74_4)
			local var_74_4 = arg_74_0.scrollrect.value - var_74_3

			arg_74_0.scrollrect:SetNormalizedPosition(var_74_4, 0)
		end
	else
		local var_74_5 = getBounds(arg_74_1._tf)

		if getBounds(arg_74_1._tf.parent):GetMin().x < var_74_0:GetMin().x and var_74_5:GetMin().x < var_74_0:GetMin().x then
			local var_74_6 = arg_74_0.scrollrect:HeadIndexToValue(arg_74_4 - 1)

			arg_74_0.scrollrect:SetNormalizedPosition(var_74_6, 0)
		end
	end
end

function var_0_0.TriggerCommodity(arg_75_0, arg_75_1, arg_75_2)
	local var_75_0 = arg_75_0.displays[arg_75_1]
	local var_75_1 = arg_75_0.displays[arg_75_1 + arg_75_2]
	local var_75_2
	local var_75_3

	for iter_75_0, iter_75_1 in pairs(arg_75_0.cards) do
		if iter_75_1._tf.gameObject.name ~= "-1" then
			if iter_75_1.commodity.id == var_75_1.id then
				var_75_2 = iter_75_1
			elseif iter_75_1.commodity.id == var_75_0.id then
				var_75_3 = iter_75_1
			end
		end
	end

	if var_75_2 then
		triggerButton(var_75_2._tf)
	end

	if var_75_2 and var_75_3 then
		arg_75_0:CheckCardBound(var_75_2, var_75_3, arg_75_2 > 0, arg_75_1 + arg_75_2)
	end
end

function var_0_0.ClearCards(arg_76_0)
	if not arg_76_0.cards then
		return
	end

	for iter_76_0, iter_76_1 in pairs(arg_76_0.cards) do
		iter_76_1:Dispose()
	end

	arg_76_0.cards = nil
end

function var_0_0.willExit(arg_77_0)
	arg_77_0:ClearCards()
	ClearLScrollrect(arg_77_0.scrollrect)

	if arg_77_0.rollingCircleRect then
		arg_77_0.rollingCircleRect:Dispose()

		arg_77_0.rollingCircleRect = nil
	end

	Input.multiTouchEnabled = true

	if arg_77_0.mainView then
		arg_77_0.mainView:Dispose()

		arg_77_0.mainView = nil
	end

	var_0_0.shopTypeIdList = nil
	var_0_0.cacheSkinExperienceItems = nil
end

return var_0_0
