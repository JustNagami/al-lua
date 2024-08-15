local var_0_0 = class("TownInfoPage", import("view.base.BaseSubView"))

var_0_0.SLOT_CNT = 9

function var_0_0.getUIName(arg_1_0)
	return "TownInfoPage"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.togglesTF = arg_2_0:findTF("frame/toggles")

	eachChild(arg_2_0.togglesTF, function(arg_3_0)
		onToggle(arg_2_0, arg_3_0, function(arg_4_0)
			setImageColor(arg_2_0:findTF("name", arg_3_0), Color.NewHex(arg_4_0 and "F5ECDD" or "796464"))
		end, SFX_PANEL)
	end)

	arg_2_0.townTip = arg_2_0:findTF("town/tip", arg_2_0.togglesTF)
	arg_2_0.placeTip = arg_2_0:findTF("place/tip", arg_2_0.togglesTF)
	arg_2_0.shipTip = arg_2_0:findTF("ship/tip", arg_2_0.togglesTF)
	arg_2_0.townPanel = arg_2_0:findTF("frame/panels/town_panel")
	arg_2_0.townLevelNow = arg_2_0:findTF("lvmask/level_now", arg_2_0.townPanel)
	arg_2_0.townLevelNext = arg_2_0:findTF("lvmask/level_next", arg_2_0.townPanel)
	arg_2_0.curExp = arg_2_0:findTF("infos/exp/value/cur", arg_2_0.townPanel)
	arg_2_0.needExp = arg_2_0:findTF("infos/exp/value/need", arg_2_0.townPanel)
	arg_2_0.goldOutput = arg_2_0:findTF("infos/output/value", arg_2_0.townPanel)
	arg_2_0.goldLimit = arg_2_0:findTF("infos/limit/value", arg_2_0.townPanel)
	arg_2_0.townUpgradeTF = arg_2_0:findTF("upgrade_status", arg_2_0.townPanel)
	arg_2_0.shipPanel = arg_2_0:findTF("frame/panels/ship_panel")
	arg_2_0.shipUIList = UIItemList.New(arg_2_0:findTF("content", arg_2_0.shipPanel), arg_2_0:findTF("content/tpl", arg_2_0.shipPanel))

	arg_2_0.shipUIList:make(function(arg_5_0, arg_5_1, arg_5_2)
		if arg_5_0 == UIItemList.EventUpdate then
			arg_2_0:UpdateShip(arg_5_1, arg_5_2)
		end
	end)

	arg_2_0.placePanel = arg_2_0:findTF("frame/panels/place_panel")

	setText(arg_2_0:findTF("view/content/tpl/next/title", arg_2_0.placePanel), i18n("town_place_next_title"))

	arg_2_0.placeUIList = UIItemList.New(arg_2_0:findTF("view/content", arg_2_0.placePanel), arg_2_0:findTF("view/content/tpl", arg_2_0.placePanel))

	arg_2_0.placeUIList:make(function(arg_6_0, arg_6_1, arg_6_2)
		if arg_6_0 == UIItemList.EventUpdate then
			arg_2_0:UpdatePlace(arg_6_1, arg_6_2)
		end
	end)

	arg_2_0.specialWorkGroup = pg.gameset.activity_town_special_work.key_value
end

function var_0_0.SetActivity(arg_7_0, arg_7_1)
	arg_7_0.activity = arg_7_1 or getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_TOWN)

	assert(arg_7_0.activity and not arg_7_0.activity:isEnd(), "not exist town act, type: " .. ActivityConst.ACTIVITY_TYPE_TOWN)
end

function var_0_0.OnInit(arg_8_0)
	arg_8_0:SetActivity()

	arg_8_0.slotUnlockLv = {}

	;(function()
		for iter_9_0, iter_9_1 in ipairs(pg.activity_town_level.all) do
			local var_9_0 = pg.activity_town_level[iter_9_1].unlock_chara

			for iter_9_2 = 1, var_9_0 do
				if not arg_8_0.slotUnlockLv[iter_9_2] then
					arg_8_0.slotUnlockLv[iter_9_2] = iter_9_1
				end

				if arg_8_0.slotUnlockLv[var_0_0.SLOT_CNT] then
					return
				end
			end
		end
	end)()
	triggerToggle(arg_8_0:findTF("town", arg_8_0.togglesTF), true)
end

function var_0_0.Flush(arg_10_0)
	arg_10_0:FlushTownPanel()
	arg_10_0:FlushShipPanel()
	arg_10_0:FlushPlacePanel()
	arg_10_0:Show()
end

function var_0_0.OnExpUpdate(arg_11_0)
	local var_11_0 = arg_11_0.activity:GetExp()
	local var_11_1 = pg.activity_town_level[arg_11_0.townLv].exp

	setText(arg_11_0.curExp, var_11_0)
	setTextColor(arg_11_0.curExp, Color.NewHex(not isMaxLv and var_11_0 < var_11_1 and "CC3A33" or "63423E"))
	setText(arg_11_0.needExp, "/" .. (isMaxLv and 0 or var_11_1))
end

function var_0_0.OnTownUpgrade(arg_12_0)
	arg_12_0.townPanel:GetComponent(typeof(Animation)):Play("anim_cowboy_info_town_lvup")
	arg_12_0:managedTween(LeanTween.delayedCall, function()
		arg_12_0:FlushTownPanel()
	end, 0.265, nil)
	arg_12_0:managedTween(LeanTween.delayedCall, function()
		arg_12_0:Flush()
	end, 0.56, nil)
end

function var_0_0.UpdateTownStatus(arg_15_0)
	local var_15_0, var_15_1, var_15_2 = arg_15_0.activity:CanUpgradeTown()

	setActive(arg_15_0.townTip, var_15_0)
	eachChild(arg_15_0.townUpgradeTF, function(arg_16_0)
		setActive(arg_16_0, arg_16_0.name == var_15_1)
	end)
	onButton(arg_15_0, arg_15_0:findTF("normal", arg_15_0.townUpgradeTF), function()
		if not var_15_0 then
			return
		end

		arg_15_0:emit(TownMediator.UPGRADE_TOWN)
	end, SFX_PANEL)

	if var_15_1 == "no_story" then
		setText(arg_15_0:findTF("no_story/content/value/cur", arg_15_0.townUpgradeTF), var_15_2[1])
		setText(arg_15_0:findTF("no_story/content/value/need", arg_15_0.townUpgradeTF), "/" .. var_15_2[2])
	elseif var_15_1 == "no_exp_or_gold" then
		setTextColor(arg_15_0:findTF("no_exp_or_gold/cost/Text", arg_15_0.townUpgradeTF), Color.NewHex(var_15_2 == "no_gold" and "FF756E" or "FFEBC9"))
	end
end

function var_0_0.FlushTownPanel(arg_18_0)
	arg_18_0.townLv = arg_18_0.activity:GetTownLevel()

	local var_18_0 = arg_18_0.activity:IsMaxTownLevel()

	setText(arg_18_0.townLevelNow, "LV." .. (var_18_0 and "MAX" or arg_18_0.townLv))
	setText(arg_18_0.townLevelNext, "LV." .. (var_18_0 and "MAX" or arg_18_0.townLv + 1))
	arg_18_0:OnExpUpdate()

	local var_18_1 = arg_18_0.activity:GetGoldOutput()

	setText(arg_18_0.goldOutput, string.format("+%s/H", TownActivity.GoldToShow(var_18_1)))

	local var_18_2 = arg_18_0.activity:GetLimitGold()

	setText(arg_18_0.goldLimit, TownActivity.GoldToShow(var_18_2))

	local var_18_3 = TownActivity.GoldToShow(pg.activity_town_level[arg_18_0.townLv].gold)

	setText(arg_18_0:findTF("normal/cost/Text", arg_18_0.townUpgradeTF), var_18_3)
	setText(arg_18_0:findTF("no_exp_or_gold/cost/Text", arg_18_0.townUpgradeTF), var_18_3)
	arg_18_0:UpdateTownStatus()
end

function var_0_0.FlushShipPanel(arg_19_0)
	arg_19_0.shipIds = arg_19_0.activity:GetShipIds()
	arg_19_0.unlockCnt = arg_19_0.activity:GetUnlockSlotCnt()

	arg_19_0.shipUIList:align(var_0_0.SLOT_CNT)
	setActive(arg_19_0.shipTip, arg_19_0.activity:HasEmptySlot())
end

function var_0_0.UpdateShip(arg_20_0, arg_20_1, arg_20_2)
	local var_20_0 = arg_20_1 + 1
	local var_20_1 = var_20_0 > arg_20_0.unlockCnt

	setActive(arg_20_0:findTF("lock", arg_20_2), var_20_1)

	if var_20_1 then
		setText(arg_20_0:findTF("lock/Text", arg_20_2), i18n("town_lock_level", "LV" .. arg_20_0.slotUnlockLv[var_20_0]))
	end

	local var_20_2 = arg_20_0.shipIds[var_20_0]
	local var_20_3 = not var_20_2 or var_20_2 == 0

	setActive(arg_20_0:findTF("empty", arg_20_2), var_20_3)
	setActive(arg_20_0:findTF("mask", arg_20_2), not var_20_3)

	local var_20_4

	if not var_20_3 then
		local var_20_5 = getProxy(BayProxy):RawGetShipById(var_20_2)

		if var_20_5 then
			local var_20_6 = LoadSprite("qicon/" .. var_20_5:getPainting())

			setImageSprite(arg_20_0:findTF("mask/icon", arg_20_2), var_20_6, true)
		else
			setActive(arg_20_0:findTF("empty", arg_20_2), true)
			setActive(arg_20_0:findTF("mask", arg_20_2), false)
		end
	end

	onButton(arg_20_0, arg_20_2, function()
		if var_20_1 then
			return
		end

		arg_20_0:emit(TownMediator.OPEN_CHUANWU, var_20_0, var_20_4)
	end, SFX_PANEL)
end

function var_0_0.FlushPlacePanel(arg_22_0)
	arg_22_0.placeList = arg_22_0.activity:GetPlaceList()

	table.sort(arg_22_0.placeList, CompareFuncs({
		function(arg_23_0)
			return arg_23_0:GetNextId() and 0 or 1
		end,
		function(arg_24_0)
			return arg_24_0.id
		end
	}))
	arg_22_0.placeUIList:align(#arg_22_0.placeList)
end

function var_0_0.UpdatePlaceStatus(arg_25_0, arg_25_1, arg_25_2)
	local var_25_0 = arg_25_0:findTF("upgrade_status", arg_25_2)
	local var_25_1 = TownActivity.GoldToShow(arg_25_1:GetCostGold())

	setText(arg_25_0:findTF("normal/cost/Text", var_25_0), var_25_1)
	setText(arg_25_0:findTF("no_gold/cost/Text", var_25_0), var_25_1)

	local var_25_2, var_25_3 = arg_25_0.activity:CanUpgradePlace(arg_25_1.id)

	if var_25_2 then
		arg_25_0.isShowPlaceTip = true
	end

	eachChild(var_25_0, function(arg_26_0)
		setActive(arg_26_0, arg_26_0.name == var_25_3)
	end)
	onButton(arg_25_0, arg_25_0:findTF("normal", var_25_0), function()
		if not var_25_2 then
			return
		end

		arg_25_0.upgradePlaceName = arg_25_2.name

		arg_25_0:emit(TownMediator.UPGRADE_WORKPLACE, arg_25_1.id)
	end, SFX_PANEL)

	if var_25_3 == "no_level" then
		setText(arg_25_0:findTF("no_level/Text", var_25_0), i18n("town_lock_level", "LV" .. arg_25_1:GetNeedTownLv()))
	end
end

function var_0_0.UpdatePlace(arg_28_0, arg_28_1, arg_28_2)
	local var_28_0 = arg_28_0.placeList[arg_28_1 + 1]

	arg_28_2.name = arg_28_1 + 1

	setImageSprite(arg_28_0:findTF("info/icon", arg_28_2), GetSpriteFromAtlas("ui/townui_atlas", var_28_0:GetIcon()), true)
	setText(arg_28_0:findTF("info/name", arg_28_2), var_28_0:GetName())
	setText(arg_28_0:findTF("info/gold/Text", arg_28_2), var_28_0:GetEffectStr())
	seriesAsync({
		function(arg_29_0)
			if arg_28_0.upgradePlaceName and arg_28_2.name == arg_28_0.upgradePlaceName then
				arg_28_2:GetComponent(typeof(Animation)):Play("anim_cowboy_info_place_lvup")
				arg_28_0:managedTween(LeanTween.delayedCall, function()
					arg_29_0()
				end, 0.2, nil)

				arg_28_0.upgradePlaceName = nil
			else
				arg_29_0()
			end
		end,
		function(arg_31_0)
			local var_31_0 = var_28_0:GetNextId()
			local var_31_1 = not var_31_0

			setActive(arg_28_0:findTF("next", arg_28_2), not var_31_1)

			if not var_31_1 then
				setText(arg_28_0:findTF("next/infos/exp/value", arg_28_2), "+" .. var_28_0:GetAddExp())

				local var_31_2 = TownWorkplace.New(var_31_0)

				setText(arg_28_0:findTF("next/infos/gold/value", arg_28_2), var_31_2:GetEffectStr())
			end
		end
	}, function()
		return
	end)
	setActive(arg_28_0:findTF("info/gold", arg_28_2), var_28_0:GetGroup() ~= arg_28_0.specialWorkGroup)
	setActive(arg_28_0:findTF("next/infos/gold", arg_28_2), var_28_0:GetGroup() ~= arg_28_0.specialWorkGroup)
	arg_28_0:UpdatePlaceStatus(var_28_0, arg_28_2)
end

function var_0_0.OnUpdateTime(arg_33_0)
	arg_33_0:UpdateTownStatus()

	arg_33_0.isShowPlaceTip = false

	for iter_33_0, iter_33_1 in ipairs(arg_33_0.placeList) do
		arg_33_0:UpdatePlaceStatus(iter_33_1, arg_33_0:findTF(iter_33_0, arg_33_0.placeUIList.container))
	end

	setActive(arg_33_0.placeTip, arg_33_0.isShowPlaceTip)
end

function var_0_0.OnDestroy(arg_34_0)
	return
end

return var_0_0
