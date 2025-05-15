local var_0_0 = class("IslandShipMainPage", import("...base.IslandBasePage"))

var_0_0.OPEN_PAGE = "IslandShipMainPage:OPEN_PAGE"
var_0_0.SELECT_SHIP = "IslandShipMainPage:SELECT_SHIP"
var_0_0.PAGE_DRESS = 1
var_0_0.PAGE_INFO = 2
var_0_0.PAGE_SKILL = 3
var_0_0.PAGE_STATUS = 4
var_0_0.PAGE_PROFILE = 5

function var_0_0.getUIName(arg_1_0)
	return "IslandShipMainUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.backBtn = arg_2_0:findTF("adapt/left_panel/back")
	arg_2_0.homeBtn = arg_2_0:findTF("adapt/home")
	arg_2_0.leftPanel = arg_2_0:findTF("adapt/left_panel")
	arg_2_0.charContainer = arg_2_0:findTF("adapt/char")
	arg_2_0.dockBtn = arg_2_0:findTF("adapt/left_panel/dock_btn")
	arg_2_0.giftBtn = arg_2_0:findTF("adapt/propose_btn")
	arg_2_0.togglePanel = arg_2_0:findTF("adapt/toggles")
	arg_2_0.shipRect = arg_2_0:findTF("adapt/left_panel/ships"):GetComponent("LScrollRect")
	arg_2_0.shipContainer = arg_2_0:findTF("adapt/left_panel/ships/content")

	function arg_2_0.shipRect.onInitItem(arg_3_0)
		arg_2_0:OnInitItem(arg_3_0)
	end

	function arg_2_0.shipRect.onUpdateItem(arg_4_0, arg_4_1)
		arg_2_0:OnUpdateItem(arg_4_0, arg_4_1)
	end

	arg_2_0.toggles = {
		[var_0_0.PAGE_DRESS] = arg_2_0:findTF("adapt/toggles/dress"),
		[var_0_0.PAGE_INFO] = arg_2_0:findTF("adapt/toggles/info"),
		[var_0_0.PAGE_SKILL] = arg_2_0:findTF("adapt/toggles/skill"),
		[var_0_0.PAGE_STATUS] = arg_2_0:findTF("adapt/toggles/gift"),
		[var_0_0.PAGE_PROFILE] = arg_2_0:findTF("adapt/toggles/data")
	}
	arg_2_0.pages = {
		[var_0_0.PAGE_DRESS] = IslandShipDressPage,
		[var_0_0.PAGE_INFO] = IslandShipInfoPage,
		[var_0_0.PAGE_SKILL] = IslandShipSkillPage,
		[var_0_0.PAGE_STATUS] = IslandShipStatusPage,
		[var_0_0.PAGE_PROFILE] = IslandShipProfilePage
	}
	arg_2_0.cards = {}

	setActive(arg_2_0.togglePanel, true)
	setActive(arg_2_0.giftBtn, false)
	setText(arg_2_0:findTF("adapt/left_panel/title/Text"), i18n1("角色详情"))
end

function var_0_0.AddListeners(arg_5_0)
	arg_5_0:AddListener(var_0_0.OPEN_PAGE, arg_5_0.OnTriggerPage)
	arg_5_0:AddListener(IslandBaseScene.CLOSE_PAGE, arg_5_0.OnClosePage)
	arg_5_0:AddListener(IslandShipMainPage.SELECT_SHIP, arg_5_0.OnSelectShip)
	arg_5_0:AddListener(IslandCharacterAgency.ADD_SHIP, arg_5_0.OnAddShip)
	arg_5_0:AddListener(GAME.ISLAND_GET_EXTRA_AWARD_DONE, arg_5_0.OnGotExtra)
	arg_5_0:AddListener(GAME.ISLAND_UPGRADE_SKILL_DONE, arg_5_0.OnSkillUpgrade)
end

function var_0_0.RemoveListeners(arg_6_0)
	arg_6_0:RemoveListener(var_0_0.OPEN_PAGE, arg_6_0.OnTriggerPage)
	arg_6_0:RemoveListener(IslandBaseScene.CLOSE_PAGE, arg_6_0.OnClosePage)
	arg_6_0:RemoveListener(IslandShipMainPage.SELECT_SHIP, arg_6_0.OnSelectShip)
	arg_6_0:RemoveListener(IslandCharacterAgency.ADD_SHIP, arg_6_0.OnAddShip)
	arg_6_0:RemoveListener(GAME.ISLAND_GET_EXTRA_AWARD_DONE, arg_6_0.OnGotExtra)
	arg_6_0:RemoveListener(GAME.ISLAND_UPGRADE_SKILL_DONE, arg_6_0.OnSkillUpgrade)
end

function var_0_0.OnSkillUpgrade(arg_7_0)
	for iter_7_0, iter_7_1 in pairs(arg_7_0.cards) do
		iter_7_1:FlushRedDot()
	end
end

function var_0_0.OnGotExtra(arg_8_0)
	if not arg_8_0.contextData.selectedId then
		return
	end

	local var_8_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipByConfigId(arg_8_0.contextData.selectedId)

	arg_8_0:FlushExtraAward(var_8_0)
end

function var_0_0.OnAddShip(arg_9_0)
	arg_9_0:Flush()

	if not arg_9_0.contextData.selectedId then
		-- block empty
	end
end

function var_0_0.OnSelectShip(arg_10_0, arg_10_1)
	local var_10_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipByConfigId(arg_10_1)

	arg_10_0:ClickCard(var_10_0, arg_10_1)
end

function var_0_0.OnTriggerPage(arg_11_0, arg_11_1)
	arg_11_0:TriggerPage(arg_11_1)
end

function var_0_0.OnClosePage(arg_12_0, arg_12_1)
	if isa(arg_12_1, IslandDockPage) then
		arg_12_0:SetVisible(arg_12_0.leftPanel, true)
	end
end

function var_0_0.OnInit(arg_13_0)
	onButton(arg_13_0, arg_13_0.homeBtn, function()
		arg_13_0:emit(BaseUI.ON_HOME)
	end, SFX_PANEL)
	onButton(arg_13_0, arg_13_0.backBtn, function()
		arg_13_0:Hide()
	end, SFX_PANEL)
	onButton(arg_13_0, arg_13_0.dockBtn, function()
		arg_13_0:OpenPage(IslandDockPage)
		arg_13_0:SetVisible(arg_13_0.leftPanel, false)
	end, SFX_PANEL)
	onButton(arg_13_0, arg_13_0.giftBtn, function()
		arg_13_0:GetExtraAward()
	end, SFX_PANEL)

	for iter_13_0, iter_13_1 in ipairs(arg_13_0.toggles) do
		onToggle(arg_13_0, iter_13_1, function(arg_18_0)
			if arg_18_0 then
				arg_13_0:SwitchPage(iter_13_0)
			end
		end, SFX_PANEL)
	end
end

function var_0_0.GetExtraAward(arg_19_0)
	if not arg_19_0.contextData.selectedId then
		return
	end

	local var_19_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipByConfigId(arg_19_0.contextData.selectedId)
	local var_19_1 = var_19_0:CanGetOwnShipAward()
	local var_19_2 = var_19_0:CanGetMarriedShipAward()
	local var_19_3
	local var_19_4

	if var_19_1 then
		var_19_3 = IslandShip.GIFT_OP_SHIP
	elseif var_19_2 then
		var_19_3 = IslandShip.GIFT_OP_MARRIED
	end

	if not var_19_3 then
		return
	end

	local var_19_5 = var_19_0:GetName()
	local var_19_6 = var_19_0:GetExtraAwardList(var_19_3)
	local var_19_7 = var_19_6[1]

	table.remove(var_19_6, 1)

	local var_19_8 = _.map(var_19_6, function(arg_20_0)
		return Drop.New(arg_20_0)
	end)
	local var_19_9 = table.concat(_.map(var_19_8, function(arg_21_0)
		return "[" .. arg_21_0:getConfigTable().name .. "]"
	end), "、")

	if var_19_1 then
		var_19_4 = i18n1(string.format("由于港区拥有该角色，%s获得奇妙的灵感启发,\n获得经验<color=#39BFFF>+%s</color>好感礼物<color=#39BFFF>%s</color>", var_19_5, var_19_7, var_19_9))
	elseif var_19_2 then
		var_19_4 = i18n1(string.format("由于港区婚约过该角色，%s获得奇妙的灵感启发,\n获得经验<color=#39BFFF>+%s</color>好感礼物<color=#39BFFF>%ss</color>", var_19_5, var_19_7, var_19_9))
	end

	arg_19_0:ShowMsgBox({
		hideNo = true,
		title = i18n1("奇妙灵感"),
		type = IslandMsgBox.TYPE_ITEM,
		drops = var_19_8,
		content = var_19_4,
		onYes = function()
			arg_19_0:emit(IslandMediator.GET_EXTRA_AWARD, var_19_0.id, var_19_3)
		end
	})
end

function var_0_0.SwitchPage(arg_23_0, arg_23_1)
	if arg_23_0.page then
		arg_23_0:ClosePage(arg_23_0.page)

		arg_23_0.page = nil
	end

	local var_23_0 = arg_23_0.pages[arg_23_1]

	arg_23_0:OpenPage(var_23_0, arg_23_0.contextData.selectedId)

	arg_23_0.page = var_23_0
end

function var_0_0.TriggerPage(arg_24_0, arg_24_1)
	local var_24_0 = arg_24_0.toggles[arg_24_1]

	triggerToggle(var_24_0, true)
end

function var_0_0.Show(arg_25_0)
	var_0_0.super.Show(arg_25_0)
	arg_25_0:Flush()
end

function var_0_0.Flush(arg_26_0)
	local var_26_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency()

	arg_26_0:FlushShips(var_26_0)
	arg_26_0:ActiveDefaultCard()
end

function var_0_0.ActiveDefaultCard(arg_27_0)
	if arg_27_0.contextData.selectedId then
		local var_27_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipByConfigId(arg_27_0.contextData.selectedId)

		arg_27_0.contextData.selectedId = nil

		arg_27_0:UpdateMainView(var_27_0)
		setActive(arg_27_0.togglePanel, true)
	end
end

function var_0_0.OnInitItem(arg_28_0, arg_28_1)
	local var_28_0 = IslandMiniShipCard.New(arg_28_1)

	onButton(arg_28_0, var_28_0.go, function()
		arg_28_0:ClickCard(var_28_0.ship, var_28_0.configId)
	end, SFX_PANEL)

	arg_28_0.cards[arg_28_1] = var_28_0
end

function var_0_0.ClickCard(arg_30_0, arg_30_1, arg_30_2)
	if arg_30_1 then
		arg_30_0:ClearSelected(arg_30_0.contextData.selectedId)
		arg_30_0:UpdateMainView(arg_30_1)
		arg_30_0:MarkSelected(arg_30_2)
	else
		arg_30_0:UpdateUnlockView(arg_30_2)
	end
end

function var_0_0.ClearSelected(arg_31_0, arg_31_1)
	for iter_31_0, iter_31_1 in pairs(arg_31_0.cards) do
		if iter_31_1.configId == arg_31_1 then
			iter_31_1:UpdateSelected(nil)

			break
		end
	end
end

function var_0_0.MarkSelected(arg_32_0, arg_32_1)
	for iter_32_0, iter_32_1 in pairs(arg_32_0.cards) do
		if iter_32_1.configId == arg_32_1 then
			iter_32_1:UpdateSelected(iter_32_1.configId)

			break
		end
	end
end

function var_0_0.OnUpdateItem(arg_33_0, arg_33_1, arg_33_2)
	local var_33_0 = arg_33_0.cards[arg_33_2]

	if not var_33_0 then
		arg_33_0:OnInitItem(arg_33_2)

		var_33_0 = arg_33_0.cards[arg_33_2]
	end

	local var_33_1 = arg_33_0.displays[arg_33_1 + 1]

	if not var_33_1 then
		return
	end

	var_33_0:Update(var_33_1, arg_33_0.contextData.selectedId)
end

function var_0_0.FlushShips(arg_34_0, arg_34_1)
	arg_34_0.displays = {}
	arg_34_0.displays = arg_34_1:GetUnlockOrCanUnlockShipConfigIds()

	local var_34_0

	if #arg_34_0.displays > 0 then
		var_34_0 = arg_34_1:GetShipByConfigId(arg_34_0.displays[1])
	end

	arg_34_0.contextData.selectedId = arg_34_0.contextData.selectedId or var_34_0 and var_34_0.configId

	arg_34_0.shipRect:SetTotalCount(#arg_34_0.displays)
	onNextTick(function()
		arg_34_0:CalcShipLayout()
	end)
end

function var_0_0.CalcShipLayout(arg_36_0)
	local var_36_0 = arg_36_0.shipContainer.rect.height
	local var_36_1 = arg_36_0.shipRect.gameObject.transform

	if var_36_0 < var_36_1.rect.height then
		local var_36_2 = (arg_36_0._tf.rect.height - var_36_0) * 0.5

		var_36_1.offsetMax = Vector2(var_36_1.offsetMax.x, -var_36_2)
		var_36_1.offsetMin = Vector2(var_36_1.offsetMin.x, var_36_2)
	end
end

function var_0_0.UpdateMainView(arg_37_0, arg_37_1)
	arg_37_0:FlushExtraAward(arg_37_1)

	if arg_37_0.contextData.selectedId == arg_37_1.configId then
		return
	end

	arg_37_0:UnloadCharacter()
	arg_37_0:LoadCharacter(arg_37_1:GetPrefab() .. "UI")

	arg_37_0.contextData.selectedId = arg_37_1.configId

	arg_37_0:TriggerPage(var_0_0.PAGE_INFO)
end

function var_0_0.FlushExtraAward(arg_38_0, arg_38_1)
	setActive(arg_38_0.giftBtn, arg_38_1:AnyExtraAwardCanGet())
end

function var_0_0.UpdateUnlockView(arg_39_0, arg_39_1)
	local var_39_0 = IslandShip.StaticGetUnlockItemId(arg_39_1)

	if not var_39_0 then
		return
	end

	local var_39_1 = pg.island_item_data_template[var_39_0].name
	local var_39_2 = pg.island_ship[arg_39_1].name

	arg_39_0:ShowMsgBox({
		content = i18n1("消耗" .. var_39_1 .. "X1，邀请" .. var_39_2 .. "\n加入队伍,是否确定？"),
		onYes = function()
			arg_39_0:emit(IslandMediator.ON_USE_ITEM, var_39_0, 1)
		end
	})
end

function var_0_0.LoadCharacter(arg_41_0, arg_41_1)
	ResourceMgr.Inst:getAssetAsync("island/" .. arg_41_1, arg_41_1, typeof(GameObject), UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_42_0)
		arg_41_0.role = Object.Instantiate(arg_42_0)

		setParent(arg_41_0.role, arg_41_0.charContainer)
		GetOrAddComponent(arg_41_0.charContainer, typeof(SmoothRotateChildObject))
	end), true, true)
end

function var_0_0.UnloadCharacter(arg_43_0)
	local var_43_0 = arg_43_0.charContainer:GetComponent(typeof(SmoothRotateChildObject))

	if var_43_0 then
		Object.Destroy(var_43_0)
	end

	if arg_43_0.role then
		Object.Destroy(arg_43_0.role)

		arg_43_0.role = nil
		arg_43_0.prefab = nil
	end
end

function var_0_0.Hide(arg_44_0)
	var_0_0.super.Hide(arg_44_0)
	arg_44_0:UnloadCharacter()
end

function var_0_0.OnDestroy(arg_45_0)
	arg_45_0:UnloadCharacter()

	for iter_45_0, iter_45_1 in pairs(arg_45_0.cards or {}) do
		iter_45_1:Dispose()
	end

	arg_45_0.cards = nil
end

return var_0_0
