local var_0_0 = class("IslandInfoPage", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandInfoUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.backBtn = arg_2_0:findTF("frame/back")
	arg_2_0.levelTxt = arg_2_0:findTF("frame/left/level"):GetComponent(typeof(Text))
	arg_2_0.expTxt = arg_2_0:findTF("frame/left/objective/exp"):GetComponent(typeof(Text))
	arg_2_0.goldTxt = arg_2_0:findTF("frame/left/objective/gold"):GetComponent(typeof(Text))
	arg_2_0.expProgress = arg_2_0:findTF("frame/left/exp/bar")
	arg_2_0.preViewBtn = arg_2_0:findTF("frame/left/preview")
	arg_2_0.upgradeBtn = arg_2_0:findTF("frame/left/upgrade_btn")
	arg_2_0.prosperityLevel = arg_2_0:findTF("frame/right/prosperity/level"):GetComponent(typeof(Text))
	arg_2_0.prosperityExp = arg_2_0:findTF("frame/right/prosperity/exp"):GetComponent(typeof(Text))
	arg_2_0.prosperityIcon = arg_2_0:findTF("frame/right/prosperity/icon")
	arg_2_0.nameTxt = arg_2_0:findTF("frame/left/name/Text"):GetComponent(typeof(Text))
	arg_2_0.editNameBtn = arg_2_0:findTF("frame/left/name")
	arg_2_0.uiShipList = UIItemList.New(arg_2_0:findTF("frame/right/ships/list"), arg_2_0:findTF("frame/right/ships/list/tpl"))
	arg_2_0.upgradePreviewPanel = arg_2_0:findTF("frame/left/upgrade_preview")
	arg_2_0.upgradeAwardList = UIItemList.New(arg_2_0:findTF("frame/left/upgrade_preview/content/awards/list/content"), arg_2_0:findTF("frame/left/upgrade_preview/content/awards/list/content/tpl"))
	arg_2_0.upgradeUnlockList = UIItemList.New(arg_2_0:findTF("frame/left/upgrade_preview/content/unlock/list/content"), arg_2_0:findTF("frame/left/upgrade_preview/content/awards/list/content/tpl"))
	arg_2_0.prosperityLevelList = UIItemList.New(arg_2_0:findTF("frame/right/prosperity/objective/content"), arg_2_0:findTF("frame/right/prosperity/objective/content/tpl"))
	arg_2_0.prosperityAwardList = UIItemList.New(arg_2_0:findTF("frame/right/prosperity/objective/awards"), arg_2_0:findTF("frame/right/prosperity/objective/awards/tpl"))
	arg_2_0.getProsperityBtn = arg_2_0:findTF("frame/right/prosperity/objective/get_btn")
	arg_2_0.goProsperityBtn = arg_2_0:findTF("frame/right/prosperity/objective/go_btn")
	arg_2_0.goProsperityBtnTxt = arg_2_0:findTF("frame/right/prosperity/objective/go_btn/Text"):GetComponent(typeof(Text))

	setText(arg_2_0:findTF("frame/left/preview/Text"), i18n1("升级预览"))
	setText(arg_2_0:findTF("frame/left/objective/label_exp"), i18n1("岛屿经验"))
	setText(arg_2_0:findTF("frame/left/objective/label_gold"), i18n1("需求物资"))
	setText(arg_2_0:findTF("frame/left/upgrade_preview/content/awards/label"), i18n1("奖励"))
	setText(arg_2_0:findTF("frame/left/upgrade_preview/content/unlock/label"), i18n1("解锁"))
	setText(arg_2_0:findTF("frame/right/prosperity/objective/get_btn/Text"), i18n1("领取"))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0.backBtn, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0._tf, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.editNameBtn, function()
		arg_3_0:OpenPage(IslandEditNamePage)
	end, SFX_PANEL)

	arg_3_0.showPreviewPanel = false
	arg_3_0.displayPreviewLevel = -1

	onButton(arg_3_0, arg_3_0.preViewBtn, function()
		local var_7_0 = getProxy(IslandProxy):GetIsland()

		if var_7_0:IsMaxLevel() then
			return
		end

		arg_3_0.showPreviewPanel = not arg_3_0.showPreviewPanel

		setActive(arg_3_0.upgradePreviewPanel, arg_3_0.showPreviewPanel)

		local var_7_1 = var_7_0:GetLevel()

		if arg_3_0.showPreviewPanel and arg_3_0.displayPreviewLevel ~= var_7_1 then
			arg_3_0.displayPreviewLevel = var_7_1

			arg_3_0:InitUpgradeAwards(var_7_0)
		end
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.upgradeBtn, function()
		local var_8_0 = getProxy(IslandProxy):GetIsland()

		if not var_8_0:CanLevelUp() then
			return
		end

		local var_8_1 = "#39bfff"
		local var_8_2 = "#f36c6e"
		local var_8_3 = var_8_0:GetUpgradeConsume()[1]
		local var_8_4 = Drop.New({
			type = var_8_3[1],
			id = var_8_3[2],
			count = var_8_3[3]
		})
		local var_8_5 = var_8_4:getOwnedCount()
		local var_8_6 = _customColorCount(var_8_5, var_8_4.count, var_8_1, var_8_2)

		arg_3_0:ShowMsgBox({
			title = i18n1("确认升级"),
			content = i18n1("<color=#393a3c>是否确认消耗以下资源并升级岛屿</color>\n 物资：" .. var_8_6),
			onYes = function()
				arg_3_0:emit(IslandMediator.ON_UPGRADE)
			end
		})
	end, SFX_PANEL)
end

function var_0_0.AddListeners(arg_10_0)
	arg_10_0:AddListener(GAME.ISLAND_UPGRADE_DONE, arg_10_0.OnUpgrade)
	arg_10_0:AddListener(GAME.ISLAND_PROSPERITY_AWARD_DONE, arg_10_0.OnGetAward)
	arg_10_0:AddListener(GAME.ISLAND_SET_NAME_DONE, arg_10_0.OnModifyName)
end

function var_0_0.RemoveListeners(arg_11_0)
	arg_11_0:RemoveListener(GAME.ISLAND_UPGRADE_DONE, arg_11_0.OnUpgrade)
	arg_11_0:RemoveListener(GAME.ISLAND_PROSPERITY_AWARD_DONE, arg_11_0.OnGetAward)
	arg_11_0:RemoveListener(GAME.ISLAND_SET_NAME_DONE, arg_11_0.OnModifyName)
end

function var_0_0.OnUpgrade(arg_12_0)
	local var_12_0 = getProxy(IslandProxy):GetIsland()

	arg_12_0:UpdateLevel(var_12_0)
end

function var_0_0.OnGetAward(arg_13_0)
	local var_13_0 = getProxy(IslandProxy):GetIsland()

	arg_13_0:UpdateProsperity(var_13_0)
end

function var_0_0.OnModifyName(arg_14_0)
	local var_14_0 = getProxy(IslandProxy):GetIsland()

	arg_14_0:UpdateName(var_14_0)
end

function var_0_0.Show(arg_15_0)
	var_0_0.super.Show(arg_15_0)

	local var_15_0 = getProxy(IslandProxy):GetIsland()

	arg_15_0:UpdateLevel(var_15_0)
	arg_15_0:UpdateProsperity(var_15_0)
	arg_15_0:UpdateName(var_15_0)
	arg_15_0:UpdateShips(var_15_0)
	pg.UIMgr.GetInstance():OverlayPanel(arg_15_0._tf, {
		pbList = {
			arg_15_0:findTF("frame/right")
		},
		weight = LayerWeightConst.SECOND_LAYER
	})
end

function var_0_0.Hide(arg_16_0)
	var_0_0.super.Hide(arg_16_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_16_0._tf, arg_16_0._parentTf)
end

function var_0_0.InitUpgradeAwards(arg_17_0, arg_17_1)
	local var_17_0 = arg_17_1:GetUpgradeAwards()

	arg_17_0.upgradeAwardList:make(function(arg_18_0, arg_18_1, arg_18_2)
		if arg_18_0 == UIItemList.EventUpdate then
			local var_18_0 = var_17_0[arg_18_1 + 1]
			local var_18_1 = Drop.Create(var_18_0)

			updateDrop(arg_18_2, var_18_1)
		end
	end)
	arg_17_0.upgradeAwardList:align(#var_17_0)

	local var_17_1 = arg_17_1:GetUnlockBuildingList()

	arg_17_0.upgradeUnlockList:make(function(arg_19_0, arg_19_1, arg_19_2)
		if arg_19_0 == UIItemList.EventUpdate then
			local var_19_0 = var_17_1[arg_19_1 + 1]
			local var_19_1 = Drop.Create(var_19_0)

			updateDrop(arg_19_2, var_19_1)
		end
	end)
	arg_17_0.upgradeUnlockList:align(#var_17_1)
end

function var_0_0.UpdateLevel(arg_20_0, arg_20_1)
	arg_20_0.levelTxt.text = arg_20_1:GetLevel()

	local var_20_0 = arg_20_1:GetExp()
	local var_20_1 = arg_20_1:GetTargeExp()
	local var_20_2 = "#39bfff"
	local var_20_3 = "#f36c6e"

	customColorCount(arg_20_0.expTxt, var_20_0, var_20_1, var_20_2, var_20_3)
	setFillAmount(arg_20_0.expProgress, Mathf.Clamp01(var_20_0 / var_20_1))

	local var_20_4 = arg_20_1:GetUpgradeConsume()[1]

	if var_20_4 == nil then
		arg_20_0.goldTxt.tetx = ""
	else
		local var_20_5 = Drop.Create(var_20_4)
		local var_20_6 = var_20_5:getOwnedCount()

		customColorCount(arg_20_0.goldTxt, var_20_6, var_20_5.count, var_20_2, var_20_3)
	end

	setGray(arg_20_0.upgradeBtn, not arg_20_1:CanLevelUp(), true)
end

function var_0_0.UpdateProsperity(arg_21_0, arg_21_1)
	local var_21_0 = {}

	arg_21_0.prosperityLevelList:make(function(arg_22_0, arg_22_1, arg_22_2)
		if arg_22_0 == UIItemList.EventUpdate then
			local var_22_0 = pg.island_prosperity.all[arg_22_1 + 1]

			arg_21_0:UpdateProsperityCard(arg_22_2, var_22_0, arg_21_1)

			var_21_0[var_22_0] = arg_22_2
		end
	end)
	arg_21_0.prosperityLevelList:align(#pg.island_prosperity.all)

	local var_21_1 = var_21_0[arg_21_1:GetProsperityLevel()] or var_21_0[1]

	if var_21_1 then
		triggerToggle(var_21_1, true)
	end
end

function var_0_0.UpdateProsperityCard(arg_23_0, arg_23_1, arg_23_2, arg_23_3)
	local var_23_0 = arg_23_3:CanGetProsperityAwards(arg_23_2)
	local var_23_1 = arg_23_3:IsReceiveProsperityAwards(arg_23_2)
	local var_23_2 = arg_23_3:GetProsperityLevel() == arg_23_2
	local var_23_3 = arg_23_3:GetMaxProsperityLevel()

	setActive(arg_23_1:Find("line"), var_23_3 ~= arg_23_2)
	setActive(arg_23_1:Find("got"), var_23_1)
	setActive(arg_23_1:Find("get"), var_23_0)
	setActive(arg_23_1:Find("lock"), not var_23_0 and not var_23_1 and not var_23_2)
	setActive(arg_23_1:Find("curr"), var_23_2 and not var_23_1)
	onToggle(arg_23_0, arg_23_1, function()
		arg_23_0:FlushProsperity(arg_23_3, arg_23_2, var_23_0, var_23_1)
	end, SFX_PANEL)
end

function var_0_0.FlushProsperity(arg_25_0, arg_25_1, arg_25_2, arg_25_3, arg_25_4)
	local var_25_0 = ArabicToRoman(arg_25_2)

	arg_25_0.prosperityLevel.text = var_25_0

	local var_25_1 = arg_25_1:GetProsperity()
	local var_25_2 = arg_25_1:GetTargetProsperityByLevel(arg_25_2)

	arg_25_0.prosperityExp.text = i18n1("小岛当前繁荣度：") .. var_25_1 .. "/" .. var_25_2

	local var_25_3 = arg_25_1:GetProsperityAward(arg_25_2)

	arg_25_0.prosperityAwardList:make(function(arg_26_0, arg_26_1, arg_26_2)
		if arg_26_0 == UIItemList.EventUpdate then
			local var_26_0 = var_25_3[arg_26_1 + 1]
			local var_26_1 = Drop.Create(var_26_0)

			updateDrop(arg_26_2, var_26_1)
		end
	end)
	arg_25_0.prosperityAwardList:align(#var_25_3)
	setActive(arg_25_0.getProsperityBtn, arg_25_3)
	setActive(arg_25_0.goProsperityBtn, not arg_25_4 and not arg_25_3)

	arg_25_0.goProsperityBtnTxt.text = i18n1("繁荣度达到：") .. var_25_2

	onButton(arg_25_0, arg_25_0.getProsperityBtn, function()
		arg_25_0:emit(IslandMediator.GET_PROSPERITY_AWARD, arg_25_2)
	end, SFX_PANEL)
	GetImageSpriteFromAtlasAsync("IslandProsperityIcon/" .. arg_25_2, "", arg_25_0.prosperityIcon)
end

function var_0_0.UpdateName(arg_28_0, arg_28_1)
	arg_28_0.nameTxt.text = arg_28_1:GetName()
end

function var_0_0.UpdateShips(arg_29_0, arg_29_1)
	local var_29_0 = arg_29_1:GetCharacterAgency():GetShips()

	arg_29_0.uiShipList:make(function(arg_30_0, arg_30_1, arg_30_2)
		if arg_30_0 == UIItemList.EventUpdate then
			local var_30_0 = var_29_0[arg_30_1 + 1]

			arg_29_0:UpdateShipCard(arg_30_2, var_30_0)
		end
	end)
	arg_29_0.uiShipList:align(5)
end

function var_0_0.UpdateShipCard(arg_31_0, arg_31_1, arg_31_2)
	local var_31_0 = arg_31_2 == nil

	setActive(arg_31_1:Find("add"), var_31_0)
	setActive(arg_31_1:Find("ship"), not var_31_0)

	if not var_31_0 then
		local var_31_1 = arg_31_2:GetPrefab()

		GetImageSpriteFromAtlasAsync("SquareIcon/" .. var_31_1, "", arg_31_1:Find("ship/mask/icon"))
	end

	onButton(arg_31_0, arg_31_1, function()
		pg.TipsMgr.GetInstance():ShowTips(i18n("word_comingSoon"))
	end, SFX_PANEL)
end

function var_0_0.OnDestroy(arg_33_0)
	return
end

return var_0_0
