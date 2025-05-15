local var_0_0 = class("IslandFormulaSelectPage", import("...base.IslandBasePage"))
local var_0_1 = 40
local var_0_2 = 5

function var_0_0.getUIName(arg_1_0)
	return "IslandFormulaSelectNewUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.backBtn = arg_2_0:findTF("top/back")
	arg_2_0.title = arg_2_0:findTF("top/title")
	arg_2_0.rightInfo = arg_2_0:findTF("rightInfo")
	arg_2_0.rightInfoEmpty = arg_2_0:findTF("rightInfo_empty")
	arg_2_0.currentformulaIcon = arg_2_0:findTF("rightInfo/formula/currentformula")
	arg_2_0.sureBtn = arg_2_0:findTF("rightInfo/sure")
	arg_2_0.formulaItem = arg_2_0:findTF("rightInfo/formula")
	arg_2_0.curCountTips = arg_2_0.formulaItem:Find("curCount")
	arg_2_0.reduceBtn = arg_2_0.formulaItem:Find("limit/reduce")
	arg_2_0.addBtn = arg_2_0.formulaItem:Find("limit/add")
	arg_2_0.maxBtn = arg_2_0.formulaItem:Find("limit/max")
	arg_2_0.curCountNumSlider = arg_2_0.formulaItem:Find("limit/num_bg")
	arg_2_0.extraProduct = arg_2_0.formulaItem:Find("extra")
	arg_2_0.extraProductIcon = arg_2_0.extraProduct:Find("icon")
	arg_2_0.extraProductName = arg_2_0.extraProduct:Find("Text")
	arg_2_0.needTimeText = arg_2_0.sureBtn:Find("adapt/time/time_text")
	arg_2_0.extraProductList = UIItemList.New(arg_2_0.extraProduct:Find("process"), arg_2_0.extraProduct:Find("process/item"))
	arg_2_0.uiList = UIItemList.New(arg_2_0:findTF("formulaView/content"), arg_2_0:findTF("formulaView/content/tpl"))
	arg_2_0.costuiList = UIItemList.New(arg_2_0:findTF("rightInfo/formula/needItem/content"), arg_2_0:findTF("rightInfo/formula/needItem/content/IslandItemTpl"))

	onSlider(arg_2_0, arg_2_0.curCountNumSlider, function(arg_3_0)
		arg_2_0.curSelectCount = arg_3_0

		arg_2_0:RefreshCurSelectCount()
	end)
	setText(arg_2_0:findTF("top/title/Text"), i18n1("产物选择"))
end

function var_0_0.AddListeners(arg_4_0)
	return
end

function var_0_0.RemoveListeners(arg_5_0)
	return
end

function var_0_0.OnInit(arg_6_0)
	onButton(arg_6_0, arg_6_0.backBtn, function()
		arg_6_0:Hide()
		arg_6_0.cancelFunc()
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.sureBtn, function()
		local var_8_0 = arg_6_0.formulaList[arg_6_0.selectedIdx]

		arg_6_0:emit(IslandMediator.START_DELEGATION, arg_6_0.place_Id, arg_6_0.logicCommissionId, arg_6_0.selectedShip, var_8_0, arg_6_0.curSelectCount)
		arg_6_0:Hide()
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.reduceBtn, function()
		arg_6_0.curSelectCount = arg_6_0.curSelectCount - 1
		arg_6_0.curSelectCount = arg_6_0.curSelectCount < 1 and 1 or arg_6_0.curSelectCount

		arg_6_0:RefreshCurSelectCount()
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.addBtn, function()
		arg_6_0.curSelectCount = arg_6_0.curSelectCount + 1
		arg_6_0.curSelectCount = arg_6_0.curSelectCount > var_0_2 and var_0_2 or arg_6_0.curSelectCount

		arg_6_0:RefreshCurSelectCount()
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.maxBtn, function()
		arg_6_0.curSelectCount = var_0_2

		arg_6_0:RefreshCurSelectCount()
	end, SFX_PANEL)
	arg_6_0.uiList:make(function(arg_12_0, arg_12_1, arg_12_2)
		if arg_12_0 == UIItemList.EventInit then
			arg_6_0:InitFormulaItem(arg_12_1, arg_12_2)
		elseif arg_12_0 == UIItemList.EventUpdate then
			arg_6_0:UpdateFormulaItem(arg_12_1, arg_12_2)
		end
	end)
	arg_6_0.costuiList:make(function(arg_13_0, arg_13_1, arg_13_2)
		if arg_13_0 == UIItemList.EventInit then
			arg_6_0:InitCostItem(arg_13_1, arg_13_2)
		elseif arg_13_0 == UIItemList.EventUpdate then
			arg_6_0:UpdateCostItem(arg_13_1, arg_13_2)
		end
	end)
	arg_6_0.extraProductList:make(function(arg_14_0, arg_14_1, arg_14_2)
		if arg_14_0 == UIItemList.EventInit then
			-- block empty
		elseif arg_14_0 == UIItemList.EventUpdate then
			local var_14_0 = arg_14_1 < arg_6_0.extraProcess

			setActive(arg_14_2:Find("inprocess"), var_14_0)
		end
	end)
end

function var_0_0.InitFormulaItem(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = arg_15_0.formulaList[arg_15_1 + 1]
	local var_15_1 = pg.island_formula[var_15_0]
	local var_15_2 = getProxy(IslandProxy):GetIsland():GetInventoryAgency()
	local var_15_3 = var_15_1.item_id
	local var_15_4 = var_15_2:GetItemById(var_15_3)
	local var_15_5 = var_15_4 and var_15_4:GetCount() or 0

	updateDrop(arg_15_2, Drop.New({
		type = DROP_TYPE_ISLAND_ITEM,
		id = var_15_3,
		count = var_15_5
	}))
	setActive(arg_15_0:findTF("icon_bg/count_bg", arg_15_2), true)
	setText(arg_15_0:findTF("name", arg_15_2), var_15_1.name)
	setText(arg_15_0:findTF("icon_bg/product_count_bg/product_count", arg_15_2), "×" .. var_15_1.commission_product[1][2])
	onButton(arg_15_0, arg_15_2, function()
		arg_15_0:OnSelectFormulaIndex(arg_15_1 + 1)
	end, SFX_PANEL)
end

function var_0_0.OnSelectFormulaIndex(arg_17_0, arg_17_1)
	arg_17_0.curSelectCount = 1
	arg_17_0.selectedIdx = arg_17_1

	arg_17_0.uiList:align(#arg_17_0.formulaList)
end

function var_0_0.UpdateFormulaItem(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = arg_18_1 + 1

	if arg_18_0.selectedIdx == var_18_0 then
		arg_18_0:RefreshCurrentSelect()
	end

	setActive(arg_18_0:findTF("selected", arg_18_2), arg_18_0.selectedIdx == var_18_0)
end

function var_0_0.InitCostItem(arg_19_0, arg_19_1, arg_19_2)
	return
end

function var_0_0.UpdateCostItem(arg_20_0, arg_20_1, arg_20_2)
	local var_20_0 = arg_20_0.commission_productList[arg_20_1 + 1]

	updateDrop(arg_20_2, var_20_0)
end

function var_0_0.RefreshCurrentSelect(arg_21_0)
	local var_21_0 = arg_21_0.formulaList[arg_21_0.selectedIdx]
	local var_21_1 = pg.island_formula[var_21_0]
	local var_21_2 = var_21_1.item_id
	local var_21_3 = Drop.New({
		count = 0,
		type = DROP_TYPE_ISLAND_ITEM,
		id = var_21_2
	})
	local var_21_4 = var_21_3:getConfigTable().rarity
	local var_21_5 = IslandItemRarity.Rarity2FrameName(var_21_4)
	local var_21_6 = var_21_3:getConfigTable().icon

	GetImageSpriteFromAtlasAsync("islandframe", var_21_5, arg_21_0.currentformulaIcon:Find("icon_bg"))
	GetImageSpriteFromAtlasAsync(var_21_6, "", arg_21_0.currentformulaIcon:Find("icon_bg/icon"))

	arg_21_0.commission_productList = {}

	for iter_21_0, iter_21_1 in ipairs(var_21_1.commission_product) do
		local var_21_7 = Drop.New({
			type = DROP_TYPE_ISLAND_ITEM,
			id = iter_21_1[1],
			count = iter_21_1[2]
		})

		table.insert(arg_21_0.commission_productList, var_21_7)
	end

	arg_21_0.costuiList:align(#arg_21_0.commission_productList)
	arg_21_0:RefreshCurSelectCount()
end

function var_0_0.OnShow(arg_22_0, arg_22_1, arg_22_2, arg_22_3, arg_22_4)
	arg_22_0.cancelFunc = arg_22_4
	arg_22_0.place_Id = arg_22_2
	arg_22_0.selectedShip = arg_22_3
	arg_22_0.currentCommissionId = arg_22_1
	arg_22_0.logicCommissionId = pg.island_production_commission[arg_22_0.currentCommissionId].slot

	arg_22_0:InitUnlockedFormulaList()

	if #arg_22_0.formulaList > 0 then
		setActive(arg_22_0.rightInfo, true)
		setActive(arg_22_0.rightInfoEmpty, false)
		arg_22_0:OnSelectFormulaIndex(1)
	else
		arg_22_0.uiList:align(#arg_22_0.formulaList)
		setActive(arg_22_0.rightInfo, false)
		setActive(arg_22_0.rightInfoEmpty, true)
	end
end

function var_0_0.InitUnlockedFormulaList(arg_23_0)
	arg_23_0.formulaList = {}

	for iter_23_0, iter_23_1 in ipairs(pg.island_production_slot[arg_23_0.logicCommissionId].formula or {}) do
		local var_23_0 = getProxy(IslandProxy):GetIsland():GetAblityAgency()

		if pg.island_formula[iter_23_1].unlock_type == 0 or var_23_0:IsUnlockFormuate(iter_23_1) then
			table.insert(arg_23_0.formulaList, iter_23_1)
		end
	end
end

function var_0_0.RefreshCurSelectCount(arg_24_0)
	setText(arg_24_0.curCountTips, tostring(arg_24_0.curSelectCount))
	setSlider(arg_24_0.curCountNumSlider, 0, var_0_2, arg_24_0.curSelectCount)
	arg_24_0:RefreshExtraProduct()

	local var_24_0 = arg_24_0.formulaList[arg_24_0.selectedIdx]
	local var_24_1 = pg.island_formula[var_24_0]

	setText(arg_24_0.currentformulaIcon:Find("icon_bg/product_count_bg/product_count"), "×" .. var_24_1.commission_product[1][2] * arg_24_0.curSelectCount)
	setText(arg_24_0.needTimeText, pg.TimeMgr.GetInstance():DescCDTime(var_24_1.workload * arg_24_0.curSelectCount))
end

function var_0_0.RefreshExtraProduct(arg_25_0)
	local var_25_0 = arg_25_0.formulaList[arg_25_0.selectedIdx]
	local var_25_1 = pg.island_formula[var_25_0]

	if #var_25_1.second_product == 0 then
		setActive(arg_25_0.extraProduct, false)

		return
	end

	setActive(arg_25_0.extraProduct, true)

	local var_25_2 = var_25_1.second_product[2][1]
	local var_25_3 = pg.island_item_data_template[var_25_2]

	GetImageSpriteFromAtlasAsync(var_25_3.icon, "", arg_25_0.currentformulaIcon)

	local var_25_4 = pg.island_production_slot[arg_25_0.logicCommissionId].place
	local var_25_5 = getProxy(IslandProxy):GetIsland():GetBuildingAgency():GetBuilding(var_25_4):GetDelegationSlotData(arg_25_0.logicCommissionId):GetFromulaTatalCount(var_25_1.id)
	local var_25_6 = var_25_1.second_product[1]
	local var_25_7 = math.floor((var_25_5 + arg_25_0.curSelectCount) / var_25_6)

	arg_25_0.extraProcess = (var_25_5 + arg_25_0.curSelectCount) % var_25_6

	setText(arg_25_0.extraProductName, "副产物 × " .. var_25_7)
	arg_25_0.extraProductList:align(var_25_6)
end

function var_0_0.OnDestroy(arg_26_0)
	return
end

return var_0_0
