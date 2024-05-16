local var_0_0 = class("DockyardScene", import("..base.BaseUI"))
local var_0_1 = 2
local var_0_2 = 0.2
local var_0_3 = 1

var_0_0.MODE_OVERVIEW = "overview"
var_0_0.MODE_DESTROY = "destroy"
var_0_0.MODE_SELECT = "select"
var_0_0.MODE_MOD = "modify"
var_0_0.MODE_WORLD = "world"
var_0_0.MODE_REMOULD = "remould"
var_0_0.MODE_UPGRADE = "upgrade"
var_0_0.MODE_GUILD_BOSS = "guildboss"
var_0_0.TITLE_CN_OVERVIEW = i18n("word_dockyard")
var_0_0.TITLE_CN_UPGRADE = i18n("word_dockyardUpgrade")
var_0_0.TITLE_CN_DESTROY = i18n("word_dockyardDestroy")
var_0_0.TITLE_EN_OVERVIEW = "dockyard"
var_0_0.TITLE_EN_UPGRADE = "modernization"
var_0_0.TITLE_EN_DESTROY = "retirement"
var_0_0.PRIOR_MODE_EQUIP_UP = 1
var_0_0.PRIOR_MODE_SHIP_UP = 2

function var_0_0.getUIName(arg_1_0)
	return "DockyardUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0._tf:SetAsLastSibling()

	local var_2_0 = arg_2_0.contextData

	var_2_0.mode = defaultValue(var_2_0.mode, var_0_0.MODE_SELECT)
	var_2_0.otherSelectedIds = defaultValue(var_2_0.otherSelectedIds, {})
	arg_2_0.teamTypeFilter = var_2_0.teamFilter
	arg_2_0.selectedMin = var_2_0.selectedMin or 1
	arg_2_0.leastLimitMsg = var_2_0.leastLimitMsg
	arg_2_0.selectedMax = var_2_0.selectedMax or 0
	var_2_0.selectedIds = var_2_0.selectedIds or {}

	if var_2_0.infoShipId then
		table.insert(var_2_0.selectedIds, var_2_0.infoShipId)

		var_2_0.infoShipId = nil
	end

	arg_2_0.selectedIds = underscore(var_2_0.selectedIds):chain():select(function(arg_3_0)
		return getProxy(BayProxy):RawGetShipById(arg_3_0) ~= nil
	end):first(arg_2_0.selectedMax):value()
	var_2_0.selectedIds = nil
	arg_2_0.checkShip = var_2_0.onShip or function(arg_4_0, arg_4_1, arg_4_2)
		return true
	end
	arg_2_0.onCancelShip = var_2_0.onCancelShip or function(arg_5_0, arg_5_1, arg_5_2)
		return true
	end
	arg_2_0.onClick = var_2_0.onClick or function(arg_6_0, arg_6_1, arg_6_2)
		arg_2_0:emit(DockyardMediator.ON_SHIP_DETAIL, arg_6_0, arg_6_1, arg_6_2)
	end
	arg_2_0.confirmSelect = var_2_0.confirmSelect
	arg_2_0.callbackQuit = var_2_0.callbackQuit
	arg_2_0.onSelected = var_2_0.onSelected or function(arg_7_0, arg_7_1)
		warning("not implemented.")
	end
	arg_2_0.blurPanel = arg_2_0:findTF("blur_panel")
	arg_2_0.settingBtn = arg_2_0.blurPanel:Find("adapt/left_length/frame/setting")
	arg_2_0.settingPanel = DockyardQuickSelectSettingPage.New(arg_2_0._tf, arg_2_0.event)

	arg_2_0.settingPanel:OnSettingChanged(function()
		arg_2_0:unselecteAllShips()
	end)

	arg_2_0.topPanel = arg_2_0.blurPanel:Find("adapt/top")
	arg_2_0.sortBtn = arg_2_0.topPanel:Find("sort_button")
	arg_2_0.sortImgAsc = arg_2_0.sortBtn:Find("asc")
	arg_2_0.sortImgDesc = arg_2_0.sortBtn:Find("desc")
	arg_2_0.leftTipsText = arg_2_0.topPanel:Find("capacity")

	setActive(arg_2_0.leftTipsText, false)

	arg_2_0.indexBtn = arg_2_0.topPanel:Find("index_button")
	arg_2_0.switchPanel = arg_2_0.topPanel:Find("switch")

	triggerToggle(arg_2_0.switchPanel:Find("Image"), true)

	arg_2_0.preferenceBtn = arg_2_0.switchPanel:Find("toggles/preference_toggle")
	arg_2_0.attrBtn = arg_2_0.switchPanel:Find("toggles/attr_toggle")
	arg_2_0.nameSearchInput = arg_2_0.switchPanel:Find("search")

	setText(arg_2_0.nameSearchInput:Find("holder"), i18n("dockyard_search_holder"))
	setInputText(arg_2_0.nameSearchInput, "")
	onInputChanged(arg_2_0, arg_2_0.nameSearchInput, function()
		arg_2_0:filter()
	end)

	arg_2_0.modLockFilter = arg_2_0:findTF("mod_flter_lock", arg_2_0.topPanel)
	arg_2_0.modLeveFilter = arg_2_0:findTF("mod_flter_level", arg_2_0.topPanel)
	arg_2_0.energyDescTF = arg_2_0:findTF("energy_desc")
	arg_2_0.energyDescTextTF = arg_2_0.energyDescTF:Find("Text")
	arg_2_0.selectPanel = arg_2_0.blurPanel:Find("select_panel")
	arg_2_0.bottomTipsText = arg_2_0.selectPanel:Find("tip")
	arg_2_0.bottomTipsWithFrame = arg_2_0.selectPanel:Find("tipwithframe")

	setText(arg_2_0.selectPanel:Find("bottom_info/bg_input/selected"), i18n("disassemble_selected") .. ":")

	arg_2_0.awardTF = arg_2_0.selectPanel:Find("bottom_info/bg_award")

	setText(arg_2_0.awardTF:Find("label"), i18n("disassemble_available") .. ":")

	arg_2_0.modAttrsTF = arg_2_0.selectPanel:Find("bottom_info/bg_mod")
	arg_2_0.viewEquipmentBtn = arg_2_0.selectPanel:Find("view_equipments")
	arg_2_0.tipPanel = arg_2_0.blurPanel:Find("TipPanel")

	setActive(arg_2_0.tipPanel, false)

	arg_2_0.worldPanel = arg_2_0.blurPanel:Find("world_port_panel")

	setActive(arg_2_0.worldPanel, arg_2_0.contextData.mode == var_0_0.MODE_WORLD)

	arg_2_0.assultBtn = arg_2_0.blurPanel:Find("adapt/top/assult_btn")
	arg_2_0.stampBtn = arg_2_0.topPanel:Find("stamp")
	arg_2_0.isRemouldOrUpgradeMode = arg_2_0.contextData.mode == var_0_0.MODE_REMOULD or arg_2_0.contextData.mode == var_0_0.MODE_UPGRADE

	setActive(arg_2_0.switchPanel, not arg_2_0.isRemouldOrUpgradeMode)
	setActive(arg_2_0.indexBtn, not arg_2_0.isRemouldOrUpgradeMode)
	setActive(arg_2_0.sortBtn, not arg_2_0.isRemouldOrUpgradeMode)
	setActive(arg_2_0.modLeveFilter, arg_2_0.isRemouldOrUpgradeMode)
	setActive(arg_2_0.modLockFilter, arg_2_0.isRemouldOrUpgradeMode)
	setActive(arg_2_0.assultBtn, arg_2_0.contextData.mode == var_0_0.MODE_GUILD_BOSS)
	switch(arg_2_0.contextData.mode, {
		[var_0_0.MODE_OVERVIEW] = function()
			arg_2_0.selecteEnabled = false
		end,
		[var_0_0.MODE_DESTROY] = function()
			arg_2_0.selecteEnabled = true
			arg_2_0.blacklist = {}
			arg_2_0.destroyResList = UIItemList.New(arg_2_0.awardTF:Find("res_list"), arg_2_0.awardTF:Find("res_list/res"))
		end,
		[var_0_0.MODE_MOD] = function()
			arg_2_0.selecteEnabled = true

			setText(arg_2_0.modAttrsTF:Find("title/Text"), i18n("word_mod_value"))

			arg_2_0.modAttrContainer = arg_2_0.modAttrsTF:Find("attrs")
		end
	}, function()
		arg_2_0.selecteEnabled = true
	end)
	setActive(arg_2_0.selectPanel, arg_2_0.selecteEnabled and arg_2_0.contextData.mode ~= var_0_0.MODE_WORLD)
	setActive(arg_2_0.worldPanel, arg_2_0.contextData.mode == var_0_0.MODE_WORLD)

	local var_2_1 = arg_2_0.contextData.mode == var_0_0.MODE_DESTROY

	setActive(arg_2_0.settingBtn, var_2_1)
	setActive(arg_2_0.selectPanel:Find("quick_select"), var_2_1)

	if arg_2_0.contextData.priorEquipUpShipIDList and arg_2_0.contextData.priorMode then
		setActive(arg_2_0.tipPanel, true)

		local var_2_2 = arg_2_0:findTF("EquipUP", arg_2_0.tipPanel)
		local var_2_3 = arg_2_0:findTF("ShipUP", arg_2_0.tipPanel)

		setText(var_2_2, i18n("fightfail_choiceequip"))
		setText(var_2_3, i18n("fightfail_choicestrengthen"))
		setActive(var_2_2, arg_2_0.contextData.priorMode == var_0_0.PRIOR_MODE_EQUIP_UP)
		setActive(var_2_3, arg_2_0.contextData.priorMode == var_0_0.PRIOR_MODE_SHIP_UP)
	end

	if arg_2_0.contextData.selectFriend then
		arg_2_0.shipContainer = arg_2_0:findTF("main/friend_container/ships"):GetComponent("LScrollRect")
	else
		arg_2_0.shipContainer = arg_2_0:findTF("main/ship_container/ships"):GetComponent("LScrollRect")
	end

	arg_2_0.shipContainer.enabled = true
	arg_2_0.shipContainer.decelerationRate = 0.07

	setActive(arg_2_0:findTF("main/ship_container"), not arg_2_0.contextData.selectFriend)

	function arg_2_0.shipContainer.onInitItem(arg_14_0)
		arg_2_0:onInitItem(arg_14_0)
	end

	function arg_2_0.shipContainer.onUpdateItem(arg_15_0, arg_15_1)
		arg_2_0:onUpdateItem(arg_15_0, arg_15_1)
	end

	function arg_2_0.shipContainer.onReturnItem(arg_16_0, arg_16_1)
		arg_2_0:onReturnItem(arg_16_0, arg_16_1)
	end

	function arg_2_0.shipContainer.onStart()
		arg_2_0:updateSelected()
	end

	arg_2_0.shipLayout = arg_2_0:findTF("main/ship_container/ships")
	arg_2_0.scrollItems = {}

	local var_2_4 = _G[arg_2_0.contextData.preView]

	if var_2_4 then
		arg_2_0.sortIndex = var_2_4.sortIndex or ShipIndexConst.SortLevel
		arg_2_0.selectAsc = var_2_4.selectAsc or false
		arg_2_0.typeIndex = var_2_4.typeIndex or ShipIndexConst.TypeAll
		arg_2_0.campIndex = var_2_4.campIndex or ShipIndexConst.CampAll
		arg_2_0.rarityIndex = var_2_4.rarityIndex or ShipIndexConst.RarityAll
		arg_2_0.extraIndex = var_2_4.extraIndex or ShipIndexConst.ExtraAll
		arg_2_0.commonTag = var_2_4.commonTag or Ship.PREFERENCE_TAG_NONE
	elseif arg_2_0.contextData.sortData then
		local var_2_5 = arg_2_0.contextData.sortData

		arg_2_0.sortIndex = var_2_5.sort or ShipIndexConst.SortLevel
		arg_2_0.selectAsc = var_2_5.Asc or false
		arg_2_0.typeIndex = var_2_5.typeIndex or ShipIndexConst.TypeAll
		arg_2_0.campIndex = var_2_5.campIndex or ShipIndexConst.CampAll
		arg_2_0.rarityIndex = var_2_5.rarityIndex or ShipIndexConst.RarityAll
		arg_2_0.extraIndex = var_2_5.extraIndex or ShipIndexConst.ExtraAll
		arg_2_0.commonTag = var_2_5.commonTag or Ship.PREFERENCE_TAG_NONE
	else
		arg_2_0.selectAsc = DockyardScene.selectAsc or false
		arg_2_0.sortIndex = DockyardScene.sortIndex or ShipIndexConst.SortLevel
		arg_2_0.typeIndex = DockyardScene.typeIndex or ShipIndexConst.TypeAll
		arg_2_0.campIndex = DockyardScene.campIndex or ShipIndexConst.CampAll
		arg_2_0.rarityIndex = DockyardScene.rarityIndex or ShipIndexConst.RarityAll
		arg_2_0.extraIndex = DockyardScene.extraIndex or ShipIndexConst.ExtraAll
		arg_2_0.commonTag = DockyardScene.commonTag or Ship.PREFERENCE_TAG_NONE
	end

	arg_2_0:updateIndexDatas()
	triggerToggle(arg_2_0.preferenceBtn, arg_2_0.commonTag == Ship.PREFERENCE_TAG_COMMON)
	arg_2_0:initIndexPanel()

	arg_2_0.itemDetailType = -1
	arg_2_0.listEmptyTF = arg_2_0:findTF("empty")

	setActive(arg_2_0.listEmptyTF, false)

	arg_2_0.listEmptyTxt = arg_2_0:findTF("Text", arg_2_0.listEmptyTF)

	setText(arg_2_0.listEmptyTxt, i18n("list_empty_tip_dockyardui"))

	if arg_2_0.contextData.mode == var_0_0.MODE_DESTROY then
		arg_2_0.blacklist = {}
		arg_2_0.selectPanel:GetComponent("HorizontalLayoutGroup").padding.right = 50

		setActive(arg_2_0.selectPanel:Find("quick_select"), true)
		setActive(arg_2_0.settingBtn, true)
	else
		arg_2_0.selectPanel:GetComponent("HorizontalLayoutGroup").padding.right = 250

		setActive(arg_2_0.selectPanel:Find("quick_select"), false)
		setActive(arg_2_0.settingBtn, false)
	end

	arg_2_0.destroyPage = ShipDestroyPage.New(arg_2_0._tf, arg_2_0.event)

	arg_2_0.destroyPage:SetCardClickCallBack(function(arg_18_0)
		arg_2_0.blacklist[arg_18_0.shipVO:getGroupId()] = true

		local var_18_0 = table.indexof(arg_2_0.selectedIds, arg_18_0.shipVO.id)

		if var_18_0 and var_18_0 > 0 then
			table.remove(arg_2_0.selectedIds, var_18_0)
		end

		arg_2_0:updateDestroyRes()
		arg_2_0:updateSelected()
	end)
	arg_2_0.destroyPage:SetConfirmCallBack(function()
		local var_19_0 = {}
		local var_19_1, var_19_2 = arg_2_0:checkDestroyGold()

		if not var_19_2 then
			table.insert(var_19_0, function(arg_20_0)
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("oil_max_tip_title") .. i18n("resource_max_tip_retire_1"),
					onYes = arg_20_0
				})
			end)
		end

		local var_19_3 = underscore.map(arg_2_0.selectedIds, function(arg_21_0)
			return arg_2_0.shipVOsById[arg_21_0]
		end)

		table.insert(var_19_0, function(arg_22_0)
			arg_2_0:checkDestroyShips(var_19_3, arg_22_0)
		end)
		seriesAsync(var_19_0, function()
			arg_2_0:emit(DockyardMediator.ON_DESTROY_SHIPS, arg_2_0.selectedIds)
		end)
	end)

	arg_2_0.destroyConfirmWindow = ShipDestoryConfirmWindow.New(arg_2_0._tf, arg_2_0.event)
end

function var_0_0.isDefaultStatus(arg_24_0)
	return arg_24_0.sortIndex == ShipIndexConst.SortLevel and (not arg_24_0.typeIndex or arg_24_0.typeIndex == ShipIndexConst.TypeAll) and (not arg_24_0.campIndex or arg_24_0.campIndex == ShipIndexConst.CampAll) and (not arg_24_0.rarityIndex or arg_24_0.rarityIndex == ShipIndexConst.RarityAll) and (not arg_24_0.extraIndex or arg_24_0.extraIndex == ShipIndexConst.ExtraAll)
end

function var_0_0.setShipsCount(arg_25_0, arg_25_1)
	arg_25_0.shipsCount = arg_25_1
end

function var_0_0.GetCard(arg_26_0, arg_26_1)
	local var_26_0

	if arg_26_0.contextData.selectFriend then
		var_26_0 = DockyardFriend.New(arg_26_1)
	else
		var_26_0 = DockyardShipItem.New(arg_26_1, arg_26_0.contextData.hideTagFlags, arg_26_0.contextData.blockTagFlags)
	end

	return var_26_0
end

function var_0_0.OnClickCard(arg_27_0, arg_27_1)
	if arg_27_1.shipVO then
		if not arg_27_0.selecteEnabled then
			pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_CLICK)

			DockyardScene.value = arg_27_0.shipContainer.value

			arg_27_0.onClick(arg_27_1.shipVO, arg_27_0.shipVOs)
		else
			pg.CriMgr.GetInstance():PlaySoundEffect_V3(table.contains(arg_27_0.selectedIds, arg_27_1.shipVO.id) and SFX_UI_CANCEL or SFX_UI_FORMATION_SELECT)
			arg_27_0:selectShip(arg_27_1.shipVO)
		end
	else
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_CLICK)

		if arg_27_0.callbackQuit then
			arg_27_0.onSelected({}, function()
				arg_27_0:back()
			end)
		elseif not arg_27_1.isLoading then
			arg_27_0.onSelected({})
			arg_27_0:back()
		end
	end
end

function var_0_0.onInitItem(arg_29_0, arg_29_1)
	local var_29_0 = arg_29_0:GetCard(arg_29_1)

	var_29_0:updateDetail(arg_29_0.itemDetailType)

	var_29_0.isLoading = true

	onButton(arg_29_0, var_29_0.go, function()
		arg_29_0:OnClickCard(var_29_0)
	end)

	local var_29_1 = GetOrAddComponent(var_29_0.go, "UILongPressTrigger").onLongPressed

	if arg_29_0.contextData.preView == NewBackYardShipInfoLayer.__cname then
		var_29_1:RemoveAllListeners()
		var_29_1:AddListener(function()
			if var_29_0.shipVO then
				arg_29_0.contextData.selectedIds = arg_29_0.selectedIds

				arg_29_0.onClick(var_29_0.shipVO, underscore.select(arg_29_0.shipVOs, function(arg_32_0)
					return arg_32_0
				end), arg_29_0.contextData)
			end
		end)
	else
		var_29_1:RemoveAllListeners()
	end

	arg_29_0.scrollItems[arg_29_1] = var_29_0

	return var_29_0
end

function var_0_0.showEnergyDesc(arg_33_0, arg_33_1, arg_33_2)
	if LeanTween.isTweening(go(arg_33_0.energyDescTF)) then
		LeanTween.cancel(go(arg_33_0.energyDescTF))

		arg_33_0.energyDescTF.localScale = Vector3.one
	end

	setText(arg_33_0.energyDescTextTF, i18n(arg_33_2))

	arg_33_0.energyDescTF.position = arg_33_1

	setActive(arg_33_0.energyDescTF, true)
	LeanTween.scale(arg_33_0.energyDescTF, Vector3.zero, 0.2):setDelay(1):setFrom(Vector3.one):setOnComplete(System.Action(function()
		arg_33_0.energyDescTF.localScale = Vector3.one

		setActive(arg_33_0.energyDescTF, false)
	end))
end

function var_0_0.onUpdateItem(arg_35_0, arg_35_1, arg_35_2)
	local var_35_0 = arg_35_0.scrollItems[arg_35_2] or arg_35_0:onInitItem(arg_35_2)
	local var_35_1 = arg_35_0.shipVOs[arg_35_1 + 1]

	if arg_35_0.contextData.selectFriend then
		var_35_0:update(var_35_1, arg_35_0.friends)
	else
		var_35_0:update(var_35_1)
	end

	if arg_35_0.contextData.mode == DockyardScene.MODE_WORLD then
		var_35_0:updateWorld()
	end

	local var_35_2 = false

	if var_35_0.shipVO then
		for iter_35_0, iter_35_1 in ipairs(arg_35_0.selectedIds) do
			if var_35_0.shipVO.id == iter_35_1 then
				var_35_2 = true

				break
			end
		end
	end

	var_35_0:updateSelected(var_35_2)
	arg_35_0:updateItemBlackBlock(var_35_0)

	var_35_0.isLoading = false

	var_35_0:updateIntimacyEnergy(arg_35_0.contextData.energyDisplay or arg_35_0.sortIndex == ShipIndexConst.SortEnergy)

	local var_35_3 = (arg_35_0.sortIndex == ShipIndexConst.SortIntimacy or arg_35_0.extraIndex == ShipIndexConst.ExtraMarry) and arg_35_0.contextData.mode ~= DockyardScene.MODE_UPGRADE

	var_35_0:updateIntimacy(var_35_3)
end

function var_0_0.onReturnItem(arg_36_0, arg_36_1, arg_36_2)
	if arg_36_0.exited then
		return
	end

	local var_36_0 = arg_36_0.scrollItems[arg_36_2]

	if var_36_0 then
		var_36_0:clear()
	end
end

function var_0_0.updateIndexDatas(arg_37_0)
	arg_37_0.contextData.indexDatas = arg_37_0.contextData.indexDatas or {}
	arg_37_0.contextData.indexDatas.sortIndex = arg_37_0.sortIndex
	arg_37_0.contextData.indexDatas.typeIndex = arg_37_0.typeIndex
	arg_37_0.contextData.indexDatas.campIndex = arg_37_0.campIndex
	arg_37_0.contextData.indexDatas.rarityIndex = arg_37_0.rarityIndex
	arg_37_0.contextData.indexDatas.extraIndex = arg_37_0.extraIndex
end

function var_0_0.initIndexPanel(arg_38_0)
	onButton(arg_38_0, arg_38_0.indexBtn, function()
		local var_39_0 = {
			indexDatas = Clone(arg_38_0.contextData.indexDatas),
			customPanels = {
				minHeight = 650,
				sortIndex = {
					isSort = true,
					mode = CustomIndexLayer.Mode.OR,
					options = ShipIndexConst.SortIndexs,
					names = ShipIndexConst.SortNames
				},
				sortPropertyIndex = {
					blueSeleted = true,
					mode = CustomIndexLayer.Mode.OR,
					options = ShipIndexConst.SortPropertyIndexs,
					names = ShipIndexConst.SortPropertyNames
				},
				typeIndex = {
					blueSeleted = true,
					mode = CustomIndexLayer.Mode.AND,
					options = ShipIndexConst.TypeIndexs,
					names = ShipIndexConst.TypeNames
				},
				campIndex = {
					blueSeleted = true,
					mode = CustomIndexLayer.Mode.AND,
					options = ShipIndexConst.CampIndexs,
					names = ShipIndexConst.CampNames
				},
				rarityIndex = {
					blueSeleted = true,
					mode = CustomIndexLayer.Mode.AND,
					options = ShipIndexConst.RarityIndexs,
					names = ShipIndexConst.RarityNames
				},
				extraIndex = {
					blueSeleted = true,
					mode = CustomIndexLayer.Mode.OR,
					options = ShipIndexConst.ExtraIndexs,
					names = ShipIndexConst.ExtraNames
				},
				layoutPos = Vector2(0, -25)
			},
			groupList = {
				{
					dropdown = false,
					titleTxt = "indexsort_sort",
					titleENTxt = "indexsort_sorteng",
					tags = {
						"sortIndex"
					},
					simpleDropdown = {
						"sortPropertyIndex"
					}
				},
				{
					dropdown = false,
					titleTxt = "indexsort_index",
					titleENTxt = "indexsort_indexeng",
					tags = {
						"typeIndex"
					}
				},
				{
					dropdown = false,
					titleTxt = "indexsort_camp",
					titleENTxt = "indexsort_campeng",
					tags = {
						"campIndex"
					}
				},
				{
					dropdown = false,
					titleTxt = "indexsort_rarity",
					titleENTxt = "indexsort_rarityeng",
					tags = {
						"rarityIndex"
					}
				},
				{
					dropdown = false,
					titleTxt = "indexsort_extraindex",
					titleENTxt = "indexsort_indexeng",
					tags = {
						"extraIndex"
					}
				}
			},
			callback = function(arg_40_0)
				arg_38_0.sortIndex = arg_40_0.sortIndex
				arg_38_0.typeIndex = arg_40_0.typeIndex
				arg_38_0.campIndex = arg_40_0.campIndex
				arg_38_0.rarityIndex = arg_40_0.rarityIndex
				arg_38_0.extraIndex = arg_40_0.extraIndex

				arg_38_0:updateIndexDatas()
				arg_38_0:filter()
			end
		}

		arg_38_0:emit(DockyardMediator.OPEN_DOCKYARD_INDEX, var_39_0)
	end, SFX_PANEL)
	onToggle(arg_38_0, arg_38_0.preferenceBtn, function(arg_41_0)
		if arg_41_0 then
			arg_38_0.commonTag = Ship.PREFERENCE_TAG_COMMON
		else
			arg_38_0.commonTag = Ship.PREFERENCE_TAG_NONE
		end

		arg_38_0:filter()
	end)
end

function var_0_0.setShips(arg_42_0, arg_42_1)
	arg_42_0.shipVOsById = arg_42_1
end

function var_0_0.setPlayer(arg_43_0, arg_43_1)
	arg_43_0.player = arg_43_1

	arg_43_0:updateBarInfo()
end

function var_0_0.setFriends(arg_44_0, arg_44_1)
	arg_44_0.friends = {}

	for iter_44_0, iter_44_1 in pairs(arg_44_1) do
		arg_44_0.friends[iter_44_1.id] = iter_44_1
	end
end

function var_0_0.updateBarInfo(arg_45_0)
	setActive(arg_45_0.bottomTipsText, arg_45_0.contextData.leftTopInfo)
	setText(arg_45_0.bottomTipsText, arg_45_0.contextData.leftTopInfo and i18n("dock_yard_left_tips", arg_45_0.contextData.leftTopInfo) or "")
	setActive(arg_45_0.bottomTipsWithFrame, arg_45_0.contextData.leftTopWithFrameInfo)
	setText(arg_45_0.bottomTipsWithFrame:Find("Text"), arg_45_0.contextData.leftTopWithFrameInfo or "")

	if arg_45_0.contextData.mode == var_0_0.MODE_WORLD or arg_45_0.contextData.mode == var_0_0.MODE_GUILD_BOSS or arg_45_0.contextData.mode == var_0_0.MODE_REMOULD then
		setActive(arg_45_0.leftTipsText, false)
	else
		setActive(arg_45_0.leftTipsText, true)
		setText(arg_45_0.leftTipsText:Find("label"), i18n("ship_dockyardScene_capacity"))
		setText(arg_45_0.leftTipsText:Find("Text"), arg_45_0.shipsCount .. "/" .. arg_45_0.player:getMaxShipBag())
	end
end

function var_0_0.initWorldPanel(arg_46_0)
	onButton(arg_46_0, arg_46_0.worldPanel:Find("btn_repair"), function()
		if #arg_46_0.selectedIds > 0 then
			arg_46_0:repairWorldShip(arg_46_0.shipVOsById[arg_46_0.selectedIds[1]])
		end
	end, SFX_PANEL)
	onButton(arg_46_0, arg_46_0.worldPanel:Find("btn_repair_all"), function()
		local var_48_0 = {}
		local var_48_1 = 0

		for iter_48_0, iter_48_1 in pairs(arg_46_0.shipVOsById) do
			local var_48_2 = WorldConst.FetchWorldShip(iter_48_1.id)

			if var_48_2:IsBroken() or not var_48_2:IsHpFull() then
				table.insert(var_48_0, var_48_2.id)

				var_48_1 = var_48_1 + nowWorld():CalcRepairCost(var_48_2)
			end
		end

		if #var_48_0 == 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("world_ship_repair_no_need"))
		else
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("world_ship_repair_all", var_48_1),
				onYes = function()
					arg_46_0:emit(DockyardMediator.ON_SHIP_REPAIR, var_48_0, var_48_1)
				end
			})
		end
	end, SFX_PANEL)
end

function var_0_0.repairWorldShip(arg_50_0, arg_50_1)
	local var_50_0 = WorldConst.FetchWorldShip(arg_50_1.id)
	local var_50_1 = nowWorld():CalcRepairCost(var_50_0)

	if var_50_0:IsBroken() then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("world_ship_repair_2", arg_50_1:getName(), var_50_1),
			onYes = function()
				arg_50_0:emit(DockyardMediator.ON_SHIP_REPAIR, {
					var_50_0.id
				}, var_50_1)
			end
		})
	elseif not var_50_0:IsHpFull() then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("world_ship_repair_1", arg_50_1:getName(), var_50_1),
			onYes = function()
				arg_50_0:emit(DockyardMediator.ON_SHIP_REPAIR, {
					var_50_0.id
				}, var_50_1)
			end
		})
	else
		pg.TipsMgr.GetInstance():ShowTips(i18n("world_ship_repair_no_need"))
	end
end

function var_0_0.filter(arg_53_0)
	local var_53_0 = arg_53_0:isDefaultStatus() and "shaixuan_off" or "shaixuan_on"

	GetSpriteFromAtlasAsync("ui/dockyardui_atlas", var_53_0, function(arg_54_0)
		setImageSprite(arg_53_0.indexBtn, arg_54_0, true)
	end)

	if arg_53_0.isRemouldOrUpgradeMode then
		arg_53_0:filterForRemouldAndUpgrade()
	else
		arg_53_0:filterCommon()
	end

	local var_53_1 = 0

	if arg_53_0.contextData.quitTeam then
		var_53_1 = var_53_1 + 1

		table.insert(arg_53_0.shipVOs, var_53_1, false)
	end

	if arg_53_0.contextData.priorEquipUpShipIDList then
		local var_53_2 = {}

		for iter_53_0, iter_53_1 in ipairs(arg_53_0.contextData.priorEquipUpShipIDList) do
			var_53_2[iter_53_1] = true
		end

		for iter_53_2 = #arg_53_0.shipVOs, 1, -1 do
			local var_53_3 = type(arg_53_0.shipVOs[iter_53_2]) == "table" and arg_53_0.shipVOs[iter_53_2].id

			if var_53_2[var_53_3] then
				var_53_2[var_53_3] = table.remove(arg_53_0.shipVOs, iter_53_2)
			end
		end

		for iter_53_3, iter_53_4 in ipairs(arg_53_0.contextData.priorEquipUpShipIDList) do
			local var_53_4 = var_53_2[iter_53_4]

			if type(var_53_4) == "table" then
				var_53_1 = var_53_1 + 1

				table.insert(arg_53_0.shipVOs, var_53_1, var_53_4)
			end
		end
	end

	if var_0_0.MODE_OVERVIEW == arg_53_0.contextData.mode and DockyardScene.value then
		arg_53_0:updateShipCount(DockyardScene.value or 0)

		DockyardScene.value = nil
	else
		arg_53_0:updateShipCount(0)
	end
end

function var_0_0.filterForRemouldAndUpgrade(arg_55_0)
	arg_55_0.shipVOs = {}

	local var_55_0 = arg_55_0.isFilterLockForMod
	local var_55_1 = arg_55_0.isFilterLevelForMod

	local function var_55_2(arg_56_0)
		local var_56_0 = true

		if not var_55_0 and arg_56_0.lockState == Ship.LOCK_STATE_LOCK then
			var_56_0 = false
		end

		if not var_55_1 and arg_56_0.level > 1 then
			var_56_0 = false
		end

		return var_56_0
	end

	for iter_55_0, iter_55_1 in pairs(arg_55_0.shipVOsById) do
		if var_55_2(iter_55_1) then
			table.insert(arg_55_0.shipVOs, iter_55_1)
		end
	end

	table.sort(arg_55_0.shipVOs, CompareFuncs({
		function(arg_57_0)
			return arg_57_0.level
		end,
		function(arg_58_0)
			return arg_58_0:isTestShip() and 1 or 0
		end
	}))
end

function var_0_0.filterCommon(arg_59_0)
	arg_59_0.shipVOs = {}

	local var_59_0 = arg_59_0.sortIndex

	local function var_59_1(arg_60_0)
		if arg_59_0.contextData.mode ~= var_0_0.MODE_GUILD_BOSS then
			return true
		end

		if arg_59_0.isShowAssultShips then
			return true
		end

		if not arg_60_0.user then
			return true
		end

		if arg_60_0.user.id == arg_59_0.player.id then
			return true
		end

		return false
	end

	for iter_59_0, iter_59_1 in pairs(arg_59_0.shipVOsById) do
		if arg_59_0.contextData.blockLock and iter_59_1:GetLockState() == Ship.LOCK_STATE_LOCK then
			-- block empty
		elseif arg_59_0.teamTypeFilter and iter_59_1:getTeamType() ~= arg_59_0.teamTypeFilter then
			-- block empty
		elseif ShipIndexConst.filterByType(iter_59_1, arg_59_0.typeIndex) and ShipIndexConst.filterByCamp(iter_59_1, arg_59_0.campIndex) and ShipIndexConst.filterByRarity(iter_59_1, arg_59_0.rarityIndex) and ShipIndexConst.filterByExtra(iter_59_1, arg_59_0.extraIndex) and (arg_59_0.commonTag == Ship.PREFERENCE_TAG_NONE or arg_59_0.commonTag == iter_59_1:GetPreferenceTag()) and var_59_1(iter_59_1) then
			table.insert(arg_59_0.shipVOs, iter_59_1)
		end
	end

	local var_59_2 = getInputText(arg_59_0.nameSearchInput)

	if var_59_2 and var_59_2 ~= "" then
		arg_59_0.shipVOs = underscore.filter(arg_59_0.shipVOs, function(arg_61_0)
			return arg_61_0:IsMatchKey(var_59_2)
		end)
	end

	local var_59_3, var_59_4 = ShipIndexConst.getSortFuncAndName(var_59_0, arg_59_0.selectAsc)

	if (var_59_0 ~= ShipIndexConst.SortIntimacy and true or false) and not defaultValue((arg_59_0.contextData.hideTagFlags or {}).inFleet, ShipStatus.TAG_HIDE_BASE.inFleet) then
		table.insert(var_59_3, 1, function(arg_62_0)
			return arg_62_0:getFlag("inFleet") and 0 or 1
		end)
	end

	if var_59_3 then
		arg_59_0:SortShips(var_59_3)
	end

	arg_59_0:updateSelected()
	setActive(arg_59_0.sortImgAsc, arg_59_0.selectAsc)
	setActive(arg_59_0.sortImgDesc, not arg_59_0.selectAsc)
	setText(arg_59_0:findTF("Image", arg_59_0.sortBtn), i18n(var_59_4))
end

function var_0_0.SortShips(arg_63_0, arg_63_1)
	if pg.NewGuideMgr.GetInstance():IsBusy() then
		local var_63_0 = {
			101171,
			201211,
			401231,
			301051
		}

		arg_63_1 = {
			function(arg_64_0)
				return table.contains(var_63_0, arg_64_0.configId) and 0 or 1
			end
		}
	elseif arg_63_0.isFormTactics then
		table.insert(arg_63_1, 1, function(arg_65_0)
			return arg_65_0:getNation() == Nation.META and 1 or 0
		end)
		table.insert(arg_63_1, 1, function(arg_66_0)
			return arg_66_0:isFullSkillLevel() and 1 or 0
		end)
	elseif arg_63_0.contextData.mode == var_0_0.MODE_OVERVIEW or arg_63_0.contextData.mode == var_0_0.MODE_SELECT then
		table.insert(arg_63_1, 1, function(arg_67_0)
			return -arg_67_0.activityNpc
		end)
	elseif arg_63_0.contextData.mode == var_0_0.MODE_GUILD_BOSS then
		table.insert(arg_63_1, 1, function(arg_68_0)
			return arg_68_0.guildRecommand and 0 or 1
		end)
	end

	table.sort(arg_63_0.shipVOs, CompareFuncs(arg_63_1))
end

function var_0_0.UpdateGuildViewEquipmentsBtn(arg_69_0)
	setActive(arg_69_0.viewEquipmentBtn, arg_69_0.contextData.mode == var_0_0.MODE_GUILD_BOSS and #arg_69_0.selectedIds > 0)
end

function var_0_0.didEnter(arg_70_0)
	pg.UIMgr.GetInstance():OverlayPanel(arg_70_0.blurPanel)
	setActive(arg_70_0.stampBtn, getProxy(TaskProxy):mingshiTouchFlagEnabled() and arg_70_0.contextData.mode ~= var_0_0.MODE_GUILD_BOSS)
	arg_70_0:UpdateGuildViewEquipmentsBtn()
	onButton(arg_70_0, arg_70_0.stampBtn, function()
		getProxy(TaskProxy):dealMingshiTouchFlag(1)
	end, SFX_CONFIRM)
	onButton(arg_70_0, arg_70_0:findTF("back", arg_70_0.topPanel), function()
		arg_70_0:back()
	end, SFX_CANCEL)
	onButton(arg_70_0, arg_70_0.sortBtn, function()
		arg_70_0.selectAsc = not arg_70_0.selectAsc

		arg_70_0:filter()
	end, SFX_UI_CLICK)

	if arg_70_0.contextData.mode == var_0_0.MODE_GUILD_BOSS then
		arg_70_0.isShowAssultShips = false

		onToggle(arg_70_0, arg_70_0.assultBtn, function(arg_74_0)
			arg_70_0.isShowAssultShips = arg_74_0

			arg_70_0:filter()
		end, SFX_PANEL)
		triggerToggle(arg_70_0.assultBtn, true)

		arg_70_0.guildShipEquipmentsPage = GuildShipEquipmentsPage.New(arg_70_0._tf, arg_70_0.event)

		arg_70_0.guildShipEquipmentsPage:SetCallBack(function()
			arg_70_0:TriggerCard(-1)
		end, function()
			arg_70_0:TriggerCard(1)
		end)
		onButton(arg_70_0, arg_70_0.viewEquipmentBtn, function()
			local var_77_0 = arg_70_0.selectedIds[#arg_70_0.selectedIds]

			if not var_77_0 then
				return
			end

			local var_77_1 = arg_70_0.shipVOsById[var_77_0]
			local var_77_2 = var_77_1.user

			arg_70_0.guildShipEquipmentsPage:ExecuteAction("Show", var_77_1, var_77_2)
		end, SFX_PANEL)
	end

	local var_70_0 = arg_70_0.attrBtn:GetComponent("Button")

	eachChild(var_70_0, function(arg_78_0)
		setActive(arg_78_0, false)
	end)

	arg_70_0.isFormTactics = arg_70_0.contextData.prevPage == "NewNavalTacticsMediator"

	local var_70_1 = arg_70_0:findTF("off", var_70_0):GetComponent("Image")
	local var_70_2 = arg_70_0:findTF("on", var_70_0):GetComponent("Image")

	if arg_70_0.isFormTactics then
		GetImageSpriteFromAtlasAsync("ui/dockyardui_atlas", "skill_off", var_70_1)
		GetImageSpriteFromAtlasAsync("ui/dockyardui_atlas", "skill_on", var_70_2)
	else
		GetImageSpriteFromAtlasAsync("ui/dockyardui_atlas", "attr_off", var_70_1)
		GetImageSpriteFromAtlasAsync("ui/dockyardui_atlas", "attr_on", var_70_2)
	end

	if arg_70_0.isRemouldOrUpgradeMode then
		local var_70_3 = getProxy(SettingsProxy)

		arg_70_0.isFilterLevelForMod = var_70_3:GetDockYardLevelBtnFlag()

		arg_70_0:OnSwitch(arg_70_0.modLeveFilter, arg_70_0.isFilterLevelForMod, function(arg_79_0)
			arg_70_0.isFilterLevelForMod = arg_79_0

			arg_70_0:filter()
		end)

		arg_70_0.isFilterLockForMod = var_70_3:GetDockYardLockBtnFlag()

		arg_70_0:OnSwitch(arg_70_0.modLockFilter, arg_70_0.isFilterLockForMod, function(arg_80_0)
			arg_70_0.isFilterLockForMod = arg_80_0

			arg_70_0:filter()
		end)
	end

	onButton(arg_70_0, var_70_0, function()
		if not arg_70_0.isFormTactics then
			arg_70_0.itemDetailType = (arg_70_0.itemDetailType + 1) % 4
		else
			arg_70_0.itemDetailType = arg_70_0.itemDetailType == DockyardShipItem.DetailType0 and DockyardShipItem.DetailType3 or DockyardShipItem.DetailType0
		end

		setActive(var_70_2, arg_70_0.itemDetailType ~= DockyardShipItem.DetailType0)
		setActive(var_70_1, arg_70_0.itemDetailType == DockyardShipItem.DetailType0)

		var_70_0.targetGraphic = arg_70_0.itemDetailType == DockyardShipItem.DetailType0 and var_70_1 or var_70_2

		arg_70_0:updateItemDetailType()
	end, SFX_PANEL)
	triggerButton(var_70_0)
	onButton(arg_70_0, arg_70_0.selectPanel:Find("cancel_button"), function()
		if arg_70_0.animating then
			return
		end

		if arg_70_0.contextData.mode == var_0_0.MODE_DESTROY then
			if #arg_70_0.selectedIds > 0 then
				arg_70_0:unselecteAllShips()
				arg_70_0:back()
			else
				arg_70_0:back()
			end
		else
			arg_70_0:back()

			return
		end
	end, SFX_CANCEL)
	onButton(arg_70_0, arg_70_0.selectPanel:Find("confirm_button"), function()
		if arg_70_0.animating then
			return
		end

		if arg_70_0.contextData.mode == var_0_0.MODE_DESTROY then
			local var_83_0, var_83_1 = arg_70_0:checkDestroyGold()

			if not var_83_0 or not var_83_1 then
				if not var_83_0 then
					pg.TipsMgr.GetInstance():ShowTips(i18n("gold_max_tip_title") .. i18n("resource_max_tip_retire"))
				elseif not var_83_0 then
					pg.TipsMgr.GetInstance():ShowTips(i18n("oil_max_tip_title") .. i18n("resource_max_tip_retire"))
				end

				return
			end
		end

		if #arg_70_0.selectedIds < arg_70_0.selectedMin then
			if arg_70_0.leastLimitMsg then
				pg.TipsMgr.GetInstance():ShowTips(arg_70_0.leastLimitMsg)
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("ship_dockyardScene_error_choiseRoleMore", arg_70_0.selectedMin))
			end

			return
		end

		if arg_70_0.contextData.mode == var_0_0.MODE_DESTROY then
			arg_70_0:displayDestroyPanel()
		else
			local var_83_2 = {}

			if arg_70_0.contextData.destroyCheck then
				local var_83_3 = underscore.map(arg_70_0.selectedIds, function(arg_84_0)
					return arg_70_0.shipVOsById[arg_84_0]
				end)

				table.insert(var_83_2, function(arg_85_0)
					arg_70_0:checkDestroyShips(var_83_3, arg_85_0)
				end)
			end

			seriesAsync(var_83_2, function()
				if arg_70_0.confirmSelect then
					arg_70_0.confirmSelect(arg_70_0.selectedIds, function()
						arg_70_0.onSelected(arg_70_0.selectedIds)
						arg_70_0:back()
					end, function()
						arg_70_0:back()
					end)
				elseif arg_70_0.callbackQuit then
					arg_70_0.onSelected(arg_70_0.selectedIds, function()
						arg_70_0:back()
					end)
				else
					arg_70_0.onSelected(arg_70_0.selectedIds)
					arg_70_0:back()
				end
			end)
		end
	end, SFX_CONFIRM)
	onButton(arg_70_0, arg_70_0.selectPanel:Find("quick_select"), function()
		if arg_70_0.animating then
			return
		end

		local var_90_0 = {
			PlayerPrefs.GetInt("QuickSelectRarity1", 3),
			PlayerPrefs.GetInt("QuickSelectRarity2", 4),
			PlayerPrefs.GetInt("QuickSelectRarity3", 2)
		}
		local var_90_1 = 3
		local var_90_2 = {}

		for iter_90_0, iter_90_1 in pairs(var_90_0) do
			if iter_90_1 ~= 0 then
				var_90_2[iter_90_1] = var_90_2[iter_90_1] or var_90_1
				var_90_1 = var_90_1 - 1
			end
		end

		local var_90_3 = getProxy(BayProxy):getShips()
		local var_90_4 = {}
		local var_90_5 = {}

		for iter_90_2, iter_90_3 in pairs(var_90_3) do
			if iter_90_3:isMaxStar() then
				var_90_4[iter_90_3:getGroupId()] = true
			else
				local var_90_6 = iter_90_3:getMaxStar() - iter_90_3:getStar() + 1

				if iter_90_3:GetLockState() == Ship.LOCK_STATE_UNLOCK then
					var_90_6 = var_90_6 + 1
				end

				local var_90_7 = var_90_5[iter_90_3:getGroupId()]

				var_90_5[iter_90_3:getGroupId()] = var_90_7 and var_90_7 < var_90_6 and var_90_7 or var_90_6
			end
		end

		local var_90_8 = _.select(arg_70_0.shipVOs, function(arg_91_0)
			return arg_91_0.configId ~= 100001 and arg_91_0.configId ~= 100011 and arg_91_0:GetLockState() == Ship.LOCK_STATE_UNLOCK and table.contains(var_90_0, arg_91_0:getRarity()) and arg_91_0.level == 1 and not arg_70_0.blacklist[arg_91_0:getGroupId()] and not table.contains(arg_70_0.selectedIds, arg_91_0.id) and not arg_91_0:hasAnyFlag({
				"inFleet",
				"inChapter",
				"inWorld",
				"inEvent",
				"inBackyard",
				"inClass",
				"inTactics",
				"inExercise",
				"inAdmiral",
				"inElite",
				"inActivity",
				"inGuildEvent",
				"inGuildBossEvent"
			})
		end)

		if not _.all(var_90_8, function(arg_92_0)
			return arg_70_0.blacklist[arg_92_0:getGroupId()]
		end) then
			var_90_8 = _.select(var_90_8, function(arg_93_0)
				return not arg_70_0.blacklist[arg_93_0:getGroupId()]
			end)
		elseif #arg_70_0.selectedIds > 0 then
			var_90_8 = {}
		end

		table.sort(var_90_8, function(arg_94_0, arg_94_1)
			local var_94_0 = var_90_2[arg_94_0:getRarity()] or 0
			local var_94_1 = var_90_2[arg_94_1:getRarity()] or 0

			if var_94_0 == var_94_1 then
				if arg_94_0:getGroupId() == arg_94_1:getGroupId() then
					return arg_94_0.createTime > arg_94_1.createTime
				end

				return arg_94_0.configId > arg_94_1.configId
			else
				return var_94_1 < var_94_0
			end
		end)

		local var_90_9 = PlayerPrefs.GetString("QuickSelectWhenHasAtLeastOneMaxstar", "KeepNone")
		local var_90_10 = PlayerPrefs.GetString("QuickSelectWithoutMaxstar", "KeepAll")
		local var_90_11 = {}
		local var_90_12 = _.select(var_90_8, function(arg_95_0)
			if var_90_4[arg_95_0:getGroupId()] then
				if var_90_9 == "KeepNone" then
					return true
				elseif var_90_9 == "KeepOne" then
					if not var_90_11[arg_95_0:getGroupId()] then
						var_90_11[arg_95_0:getGroupId()] = true

						return false
					end

					return true
				elseif var_90_9 == "KeepAll" then
					return false
				end
			elseif var_90_10 == "KeepNone" then
				return true
			elseif var_90_10 == "KeepNeeded" then
				if var_90_5[arg_95_0:getGroupId()] > 0 then
					var_90_5[arg_95_0:getGroupId()] = var_90_5[arg_95_0:getGroupId()] - 1

					return false
				end

				return true
			elseif var_90_10 == "KeepAll" then
				return false
			end
		end)
		local var_90_13 = 0
		local var_90_14 = false
		local var_90_15 = false
		local var_90_16 = 0
		local var_90_17 = 0

		for iter_90_4, iter_90_5 in ipairs(arg_70_0.selectedIds) do
			local var_90_18, var_90_19 = arg_70_0.shipVOsById[iter_90_5]:calReturnRes()

			var_90_16 = var_90_16 + var_90_18
			var_90_17 = var_90_17 + var_90_19
		end

		for iter_90_6, iter_90_7 in ipairs(var_90_12) do
			if arg_70_0.selectedMax > 0 and arg_70_0.selectedMax <= #arg_70_0.selectedIds then
				break
			end

			local var_90_20, var_90_21 = iter_90_7:calReturnRes()

			var_90_16 = var_90_16 + var_90_20
			var_90_17 = var_90_17 + var_90_21
			var_90_14 = arg_70_0.player:OilMax(var_90_17)
			var_90_15 = arg_70_0.player:GoldMax(var_90_16)

			if var_90_15 then
				break
			end

			var_90_13 = var_90_13 + 1

			arg_70_0:selectShip(iter_90_7, true)
		end

		if var_90_13 == 0 then
			if var_90_15 then
				if #arg_70_0.selectedIds == 0 then
					pg.TipsMgr.GetInstance():ShowTips(i18n("gold_max_tip_title") .. i18n("resource_max_tip_retire"))
				else
					pg.TipsMgr.GetInstance():ShowTips(i18n("gold_max_tip_title"))
				end
			elseif #arg_70_0.selectedIds > 0 then
				arg_70_0:displayDestroyPanel()
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("retire_selectzero"))
			end
		elseif var_90_14 then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("oil_max_tip_title") .. i18n("resource_max_tip_retire_1"),
				onYes = function()
					arg_70_0:displayDestroyPanel()
				end
			})
		else
			arg_70_0:displayDestroyPanel()
		end
	end, SFX_CONFIRM)

	if not arg_70_0.contextData.selectFriend then
		arg_70_0.shipContainer:GetComponentInChildren(typeof(GridLayoutGroup)).constraintCount = 7
	end

	arg_70_0:filter()
	arg_70_0:updateBarInfo()

	if arg_70_0.contextData.mode == var_0_0.MODE_WORLD then
		arg_70_0:initWorldPanel()
	elseif arg_70_0.contextData.mode == var_0_0.MODE_DESTROY and not LOCK_DESTROY_GUIDE then
		pg.SystemGuideMgr.GetInstance():Play(arg_70_0)
	end

	setAnchoredPosition(arg_70_0.topPanel, {
		y = arg_70_0.topPanel.rect.height
	})
	setAnchoredPosition(arg_70_0.selectPanel, {
		y = -1 * arg_70_0.selectPanel.rect.height
	})
	onNextTick(function()
		if arg_70_0.exited then
			return
		end

		arg_70_0:uiStartAnimating()
	end)

	if arg_70_0.contextData.selectShipId then
		arg_70_0.selectedIds = {}

		table.insert(arg_70_0.selectedIds, arg_70_0.contextData.selectShipId)
		arg_70_0:updateSelected()
	end

	arg_70_0.bulinTip = AprilFoolBulinSubView.ShowAprilFoolBulin(arg_70_0)

	onButton(arg_70_0, arg_70_0.settingBtn, function()
		arg_70_0.settingPanel:Load()
		arg_70_0.settingPanel:ActionInvoke("Show")
	end)
	pg.SystemGuideMgr.GetInstance():Play(arg_70_0)
end

function var_0_0.TriggerCard(arg_99_0, arg_99_1)
	local var_99_0 = arg_99_0.selectedIds[1]

	if not var_99_0 then
		return
	end

	local var_99_1

	for iter_99_0, iter_99_1 in ipairs(arg_99_0.shipVOs) do
		if iter_99_1 and iter_99_1.id == var_99_0 then
			var_99_1 = iter_99_0

			break
		end
	end

	if not var_99_1 then
		return
	end

	local var_99_2 = var_99_1
	local var_99_3

	local function var_99_4()
		var_99_2 = var_99_2 + arg_99_1

		local var_100_0 = arg_99_0.shipVOs[var_99_2]

		if not var_100_0 or arg_99_0.checkShip(var_100_0) then
			return var_100_0
		else
			return var_99_4()
		end
	end

	local var_99_5 = var_99_4()

	if not var_99_5 then
		return
	end

	local function var_99_6()
		local var_101_0

		for iter_101_0, iter_101_1 in pairs(arg_99_0.scrollItems) do
			if iter_101_1.shipVO and iter_101_1.go.name ~= "-1" and iter_101_1.shipVO.id == var_99_5.id then
				var_101_0 = iter_101_1

				break
			end
		end

		return var_101_0
	end

	local var_99_7 = var_99_6()

	if var_99_7 then
		local var_99_8 = getBounds(arg_99_0:findTF("main/ship_container"))
		local var_99_9 = getBounds(var_99_7.tr)

		if not var_99_8:Intersects(var_99_9) then
			local var_99_10 = arg_99_1 * (arg_99_0.shipContainer:HeadIndexToValue(7) - arg_99_0.shipContainer:HeadIndexToValue(1))
			local var_99_11 = arg_99_0.shipContainer.value + var_99_10

			arg_99_0.shipContainer:SetNormalizedPosition(var_99_11, 1)
		end
	end

	if not var_99_7 then
		local var_99_12 = (math.ceil(var_99_2 / 7) - math.ceil(var_99_1 / 7)) * (arg_99_0.shipContainer:HeadIndexToValue(21) - arg_99_0.shipContainer:HeadIndexToValue(1))
		local var_99_13 = arg_99_0.shipContainer.value + var_99_12

		arg_99_0.shipContainer:SetNormalizedPosition(var_99_13, 1)

		var_99_7 = var_99_6()
	end

	if var_99_7 then
		triggerButton(var_99_7.tr)

		local var_99_14 = arg_99_0.shipVOsById[var_99_7.shipVO.id]

		arg_99_0.guildShipEquipmentsPage:Refresh(var_99_14, var_99_14.user)
	end
end

function var_0_0.OnSwitch(arg_102_0, arg_102_1, arg_102_2, arg_102_3)
	local function var_102_0()
		setActive(arg_102_1:Find("off"), not arg_102_2)
		setActive(arg_102_1:Find("on"), arg_102_2)
	end

	onButton(arg_102_0, arg_102_1, function()
		arg_102_2 = not arg_102_2

		if arg_102_3 then
			arg_102_3(arg_102_2)
		end

		var_102_0()
	end, SFX_PANEL)
	var_102_0()
end

function var_0_0.onBackPressed(arg_105_0)
	if arg_105_0.destroyConfirmWindow:isShowing() then
		arg_105_0.destroyConfirmWindow:Hide()

		return
	end

	if arg_105_0.destroyPage:isShowing() then
		arg_105_0.destroyPage:Hide()

		return
	end

	if arg_105_0.settingPanel:isShowing() then
		arg_105_0.settingPanel:Hide()

		return
	end

	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)
	arg_105_0:back()
end

function var_0_0.updateShipStatusById(arg_106_0, arg_106_1)
	for iter_106_0, iter_106_1 in pairs(arg_106_0.scrollItems) do
		if iter_106_1.shipVO and iter_106_1.shipVO.id == arg_106_1 then
			iter_106_1:flush(arg_106_0.selectedIds)

			if arg_106_0.contextData.mode == DockyardScene.MODE_WORLD then
				iter_106_1:updateWorld()
			end
		end
	end
end

function var_0_0.checkDestroyGold(arg_107_0, arg_107_1)
	local var_107_0 = 0
	local var_107_1 = 0

	for iter_107_0, iter_107_1 in ipairs(arg_107_0.selectedIds) do
		local var_107_2, var_107_3 = arg_107_0.shipVOsById[iter_107_1]:calReturnRes()

		var_107_0 = var_107_0 + var_107_2
		var_107_1 = var_107_1 + var_107_3
	end

	if arg_107_1 then
		local var_107_4, var_107_5 = arg_107_1:calReturnRes()

		var_107_0 = var_107_0 + var_107_4
		var_107_1 = var_107_1 + var_107_5
	end

	local var_107_6 = arg_107_0.player:OilMax(var_107_1)

	if arg_107_0.player:GoldMax(var_107_0) then
		return false, not var_107_6
	end

	return true, not var_107_6
end

function var_0_0.selectShip(arg_108_0, arg_108_1, arg_108_2)
	local var_108_0 = false
	local var_108_1

	for iter_108_0, iter_108_1 in ipairs(arg_108_0.selectedIds) do
		if iter_108_1 == arg_108_1.id then
			var_108_0 = true
			var_108_1 = iter_108_0

			break
		end
	end

	if not var_108_0 then
		local var_108_2, var_108_3 = arg_108_0.checkShip(arg_108_1, function()
			if not arg_108_0.exited then
				arg_108_0:selectShip(arg_108_1)
			end
		end, arg_108_0.selectedMax == 1 and {} or arg_108_0.selectedIds)

		if not var_108_2 then
			if var_108_3 then
				pg.TipsMgr.GetInstance():ShowTips(var_108_3)
			end

			return
		end

		if arg_108_0.selectedMax == 1 then
			local var_108_4 = arg_108_0.selectedIds[1]

			arg_108_0.selectedIds[1] = arg_108_1.id
		elseif arg_108_0.selectedMax == 0 or #arg_108_0.selectedIds < arg_108_0.selectedMax then
			table.insert(arg_108_0.selectedIds, arg_108_1.id)
			arg_108_0:updateBlackBlocks(arg_108_1)
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("ship_dockyardScene_error_choiseRoleLess", arg_108_0.selectedMax))

			return
		end
	else
		local var_108_5, var_108_6 = arg_108_0.onCancelShip(arg_108_1, function()
			if not arg_108_0.exited then
				arg_108_0:selectShip(arg_108_1)
			end
		end, arg_108_0.selectedIds)

		if not var_108_5 then
			if var_108_6 then
				pg.TipsMgr.GetInstance():ShowTips(var_108_6)
			end

			return
		end

		table.remove(arg_108_0.selectedIds, var_108_1)

		if arg_108_0.selectedMax ~= 1 then
			arg_108_0:updateBlackBlocks(arg_108_1)
		end
	end

	arg_108_0:updateSelected()

	if arg_108_0.contextData.mode == var_0_0.MODE_DESTROY then
		arg_108_0:updateDestroyRes()
	elseif arg_108_0.contextData.mode == var_0_0.MODE_MOD then
		arg_108_0:updateModAttr()
	end

	arg_108_0:UpdateGuildViewEquipmentsBtn()
end

function var_0_0.updateBlackBlocks(arg_111_0, arg_111_1)
	if not arg_111_0.contextData.useBlackBlock or not arg_111_1 then
		return
	end

	for iter_111_0, iter_111_1 in pairs(arg_111_0.scrollItems) do
		arg_111_0:updateItemBlackBlock(iter_111_1)
	end
end

function var_0_0.updateItemBlackBlock(arg_112_0, arg_112_1)
	if arg_112_0.contextData.useBlackBlock then
		if arg_112_0.selectedMax == 1 then
			arg_112_1:updateBlackBlock(arg_112_0.contextData.otherSelectedIds)
		else
			arg_112_1:updateBlackBlock(arg_112_0.selectedIds)
		end
	else
		arg_112_1:updateBlackBlock()
	end
end

function var_0_0.unselecteAllShips(arg_113_0)
	arg_113_0.selectedIds = {}

	arg_113_0:updateSelected()
	arg_113_0:updateDestroyRes()
end

function var_0_0.updateSelected(arg_114_0)
	for iter_114_0, iter_114_1 in pairs(arg_114_0.scrollItems) do
		if iter_114_1.shipVO then
			local var_114_0 = false

			for iter_114_2, iter_114_3 in ipairs(arg_114_0.selectedIds) do
				if iter_114_1.shipVO.id == iter_114_3 then
					var_114_0 = true

					break
				end
			end

			iter_114_1:updateSelected(var_114_0)
		end
	end

	if arg_114_0.selectedMax == 0 then
		setText(arg_114_0.selectPanel:Find("bottom_info/bg_input/count"), #arg_114_0.selectedIds)
	else
		local var_114_1 = #arg_114_0.selectedIds

		if arg_114_0.contextData.mode ~= var_0_0.MODE_DESTROY or #arg_114_0.selectedIds == 0 then
			var_114_1 = setColorStr(#arg_114_0.selectedIds, COLOR_WHITE)
		elseif arg_114_0.contextData.mode == var_0_0.MODE_DESTROY then
			var_114_1 = #arg_114_0.selectedIds == 10 and setColorStr(#arg_114_0.selectedIds, COLOR_RED) or setColorStr(#arg_114_0.selectedIds, COLOR_GREEN)
		end

		setText(arg_114_0.selectPanel:Find("bottom_info/bg_input/count"), var_114_1 .. "/" .. arg_114_0.selectedMax)
	end

	if #arg_114_0.selectedIds < arg_114_0.selectedMin then
		setActive(arg_114_0.selectPanel:Find("confirm_button/mask"), true)
	else
		setActive(arg_114_0.selectPanel:Find("confirm_button/mask"), false)
	end

	if arg_114_0.contextData.mode == var_0_0.MODE_MOD then
		arg_114_0:updateModAttr()
	end
end

function var_0_0.updateItemDetailType(arg_115_0)
	for iter_115_0, iter_115_1 in pairs(arg_115_0.scrollItems) do
		iter_115_1:updateDetail(arg_115_0.itemDetailType)
	end

	arg_115_0.shipLayout.anchoredPosition = arg_115_0.shipLayout.anchoredPosition + Vector3(0, 0.001, 0)
end

function var_0_0.closeDestroyMode(arg_116_0)
	setActive(arg_116_0.awardTF, false)
	setActive(arg_116_0.bottomTipsText, true)
end

function var_0_0.updateDestroyRes(arg_117_0)
	if table.getCount(arg_117_0.selectedIds) == 0 then
		arg_117_0:closeDestroyMode()
	else
		setActive(arg_117_0.awardTF, true)
		setActive(arg_117_0.bottomTipsText, false)
	end

	local var_117_0 = _.map(arg_117_0.selectedIds, function(arg_118_0)
		return arg_117_0.shipVOsById[arg_118_0]
	end)
	local var_117_1, var_117_2, var_117_3 = ShipCalcHelper.CalcDestoryRes(var_117_0)
	local var_117_4 = var_117_2 == 0

	if arg_117_0.destroyResList then
		local var_117_5 = (var_117_4 and 1 or 2) + #var_117_3

		arg_117_0.destroyResList:make(function(arg_119_0, arg_119_1, arg_119_2)
			if arg_119_0 == UIItemList.EventUpdate then
				local var_119_0 = ""
				local var_119_1 = 0

				if arg_119_1 == 0 then
					var_119_0, var_119_1 = "Props/gold", var_117_1
				elseif arg_119_1 == 1 then
					if not var_117_4 then
						var_119_0, var_119_1 = "Props/oil", var_117_2
					else
						local var_119_2 = var_117_3[1]

						var_119_0, var_119_1 = Item.getConfigData(var_119_2.id).icon, var_119_2.count
					end
				elseif arg_119_1 > 1 then
					local var_119_3 = var_117_4 and var_117_3[arg_119_1] or var_117_3[arg_119_1 - 1]

					var_119_0, var_119_1 = Item.getConfigData(var_119_3.id).icon, var_119_3.count
				end

				GetImageSpriteFromAtlasAsync(var_119_0, "", arg_119_2:Find("icon"))
				setText(arg_119_2:Find("Text"), "X" .. var_119_1)
			end
		end)
		arg_117_0.destroyResList:align(var_117_5)
	end

	if arg_117_0.destroyPage and arg_117_0.destroyPage:GetLoaded() and arg_117_0.destroyPage:isShowing() then
		arg_117_0.destroyPage:RefreshRes()
	end
end

function var_0_0.setModShip(arg_120_0, arg_120_1)
	arg_120_0.modShip = arg_120_1
end

function var_0_0.updateModAttr(arg_121_0)
	if table.getCount(arg_121_0.selectedIds) == 0 then
		arg_121_0:closeModAttr()
	else
		setActive(arg_121_0.modAttrsTF, true)
		setActive(arg_121_0.bottomTipsText, false)
	end

	local var_121_0 = arg_121_0.contextData.ignoredIds[1]
	local var_121_1 = {}

	for iter_121_0, iter_121_1 in ipairs(arg_121_0.selectedIds) do
		table.insert(var_121_1, arg_121_0.shipVOsById[iter_121_1])
	end

	local var_121_2 = ShipModLayer.getModExpAdditions(arg_121_0.modShip, var_121_1)

	for iter_121_2, iter_121_3 in pairs(ShipModAttr.ID_TO_ATTR) do
		if iter_121_2 ~= ShipModLayer.IGNORE_ID then
			local var_121_3 = arg_121_0.modAttrContainer:Find("attr_" .. iter_121_2)

			setText(var_121_3:Find("value"), var_121_2[iter_121_3])
			setText(var_121_3:Find("name"), ShipModAttr.id2Name(iter_121_2))
		end
	end
end

function var_0_0.closeModAttr(arg_122_0)
	setActive(arg_122_0.modAttrsTF, false)
	setActive(arg_122_0.bottomTipsText, true)
end

function var_0_0.removeShip(arg_123_0, arg_123_1)
	for iter_123_0, iter_123_1 in ipairs(arg_123_0.selectedIds) do
		if iter_123_1 == arg_123_1 then
			table.remove(arg_123_0.selectedIds, iter_123_0)

			break
		end
	end

	for iter_123_2 = #arg_123_0.shipVOs, 1, -1 do
		if arg_123_0.shipVOs[iter_123_2].id == arg_123_1 then
			table.remove(arg_123_0.shipVOs, iter_123_2)

			break
		end
	end

	arg_123_0.shipVOsById[arg_123_1] = nil
end

function var_0_0.updateShipCount(arg_124_0, arg_124_1)
	arg_124_0.shipContainer:SetTotalCount(#arg_124_0.shipVOs, defaultValue(arg_124_1, -1))
	setActive(arg_124_0.listEmptyTF, #arg_124_0.shipVOs <= 0)
end

function var_0_0.ClearShipsBlackBlock(arg_125_0)
	if not arg_125_0.shipVOsById then
		return
	end

	for iter_125_0, iter_125_1 in pairs(arg_125_0.shipVOsById) do
		iter_125_1.blackBlock = false
	end
end

function var_0_0.willExit(arg_126_0)
	arg_126_0:closeDestroyMode()
	arg_126_0:closeModAttr()
	arg_126_0:ClearShipsBlackBlock()

	if arg_126_0.guildShipEquipmentsPage then
		arg_126_0.guildShipEquipmentsPage:Destroy()
	end

	if arg_126_0.settingPanel then
		arg_126_0.settingPanel:Destroy()
	end

	if arg_126_0.destroyPage then
		arg_126_0.destroyPage:Destroy()
	end

	if arg_126_0.destroyConfirmWindow then
		arg_126_0.destroyConfirmWindow:Destroy()
	end

	if arg_126_0.contextData.mode == var_0_0.MODE_MOD then
		-- block empty
	elseif not arg_126_0.contextData.sortData then
		if _G[arg_126_0.contextData.preView] then
			_G[arg_126_0.contextData.preView].sortIndex = arg_126_0.sortIndex
			_G[arg_126_0.contextData.preView].selectAsc = arg_126_0.selectAsc
			_G[arg_126_0.contextData.preView].typeIndex = arg_126_0.typeIndex
			_G[arg_126_0.contextData.preView].campIndex = arg_126_0.campIndex
			_G[arg_126_0.contextData.preView].rarityIndex = arg_126_0.rarityIndex
			_G[arg_126_0.contextData.preView].extraIndex = arg_126_0.extraIndex
			_G[arg_126_0.contextData.preView].commonTag = arg_126_0.commonTag
		else
			DockyardScene.sortIndex = arg_126_0.sortIndex
			DockyardScene.selectAsc = arg_126_0.selectAsc
			DockyardScene.typeIndex = arg_126_0.typeIndex
			DockyardScene.campIndex = arg_126_0.campIndex
			DockyardScene.rarityIndex = arg_126_0.rarityIndex
			DockyardScene.extraIndex = arg_126_0.extraIndex
			DockyardScene.commonTag = arg_126_0.commonTag
		end
	end

	arg_126_0.shipContainer.enabled = false

	for iter_126_0, iter_126_1 in pairs(arg_126_0.scrollItems) do
		iter_126_1:clear()
		GetOrAddComponent(iter_126_1.go, "UILongPressTrigger").onLongPressed:RemoveAllListeners()
	end

	if LeanTween.isTweening(go(arg_126_0.energyDescTF)) then
		setActive(arg_126_0.energyDescTF, false)
		LeanTween.cancel(go(arg_126_0.energyDescTF))
	end

	arg_126_0:cancelAnimating()

	if arg_126_0.isRemouldOrUpgradeMode then
		local var_126_0 = getProxy(SettingsProxy)

		var_126_0:SetDockYardLockBtnFlag(arg_126_0.isFilterLockForMod)
		var_126_0:SetDockYardLevelBtnFlag(arg_126_0.isFilterLevelForMod)
	end

	if arg_126_0.bulinTip then
		arg_126_0.bulinTip:Destroy()

		arg_126_0.bulinTip = nil
	end

	pg.UIMgr.GetInstance():UnOverlayPanel(arg_126_0.blurPanel, arg_126_0._tf)
end

function var_0_0.uiStartAnimating(arg_127_0)
	local var_127_0 = arg_127_0:findTF("back", arg_127_0.topPanel)
	local var_127_1 = 0
	local var_127_2 = 0.3

	if isActive(arg_127_0.selectPanel) then
		shiftPanel(arg_127_0.selectPanel, nil, 0, var_127_2, var_127_1, true, true)
	end
end

function var_0_0.uiExitAnimating(arg_128_0)
	if arg_128_0.contextData.mode == var_0_0.MODE_OVERVIEW then
		-- block empty
	else
		local var_128_0 = 0
		local var_128_1 = 0.3

		shiftPanel(arg_128_0.selectPanel, nil, -1 * arg_128_0.selectPanel.rect.height, var_128_1, var_128_0, true, true)
	end
end

function var_0_0.back(arg_129_0)
	if arg_129_0.exited then
		return
	end

	arg_129_0:closeView()
end

function var_0_0.cancelAnimating(arg_130_0)
	if LeanTween.isTweening(go(arg_130_0.topPanel)) then
		LeanTween.cancel(go(arg_130_0.topPanel))
	end

	if LeanTween.isTweening(go(arg_130_0.selectPanel)) then
		LeanTween.cancel(go(arg_130_0.selectPanel))
	end

	if arg_130_0.tweens then
		cancelTweens(arg_130_0.tweens)
	end
end

function var_0_0.quickExitFunc(arg_131_0)
	seriesAsync({
		function(arg_132_0)
			if arg_131_0.contextData.onQuickHome then
				arg_131_0.contextData.onQuickHome(arg_132_0)
			else
				arg_132_0()
			end
		end,
		function(arg_133_0)
			arg_131_0:emit(var_0_0.ON_HOME)
		end
	})
end

function var_0_0.displayDestroyPanel(arg_134_0)
	arg_134_0.destroyPage:ExecuteAction("Show")
	arg_134_0.destroyPage:ActionInvoke("Refresh", arg_134_0.selectedIds, arg_134_0.shipVOsById)
end

function var_0_0.closeDestroyPanel(arg_135_0)
	if arg_135_0.destroyPage:isShowing() then
		arg_135_0.destroyPage:Hide()
	end
end

function var_0_0.checkDestroyShips(arg_136_0, arg_136_1, arg_136_2)
	local var_136_0 = {}
	local var_136_1, var_136_2 = ShipCalcHelper.GetEliteAndHightLevelShips(arg_136_1)

	if #var_136_1 > 0 or #var_136_2 > 0 then
		table.insert(var_136_0, function(arg_137_0)
			local var_137_0 = false

			if arg_136_0.contextData.mode == var_0_0.MODE_DESTROY then
				var_137_0 = ({
					ShipCalcHelper.CalcDestoryRes(arg_136_1)
				})[4]
			end

			arg_136_0.destroyConfirmWindow:ExecuteAction("Show", var_136_1, var_136_2, var_137_0, arg_137_0)
		end)
	end

	local var_136_3 = underscore.filter(arg_136_1, function(arg_138_0)
		return arg_138_0:getFlag("inElite")
	end)

	if #var_136_3 > 0 then
		table.insert(var_136_0, function(arg_139_0)
			arg_136_0.destroyConfirmWindow:ExecuteAction("ShowEliteTag", var_136_3, arg_139_0)
		end)
	end

	seriesAsync(var_136_0, arg_136_2)
end

return var_0_0
