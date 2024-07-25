local var_0_0 = class("ItemInfoLayer", import("..base.BaseUI"))
local var_0_1 = 5
local var_0_2 = 11
local var_0_3 = {
	RESOLVE = 2,
	COMPOSE = 1
}

function var_0_0.getUIName(arg_1_0)
	return "ItemInfoUI"
end

function var_0_0.init(arg_2_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_2_0._tf, false, {
		weight = arg_2_0:getWeightFromData()
	})

	arg_2_0.window = arg_2_0:findTF("window")

	setText(arg_2_0.window:Find("top/bg/infomation/title"), i18n("words_information"))

	arg_2_0.btnContent = arg_2_0.window:Find("actions")

	eachChild(arg_2_0.btnContent, function(arg_3_0)
		setActive(arg_3_0, false)
	end)

	for iter_2_0, iter_2_1 in pairs({
		okBtn = {
			"ok_button",
			i18n("msgbox_text_confirm")
		},
		useBtn = {
			"use_button"
		},
		batchUseBtn = {
			"batch_use_button"
		},
		useOneBtn = {
			"use_one_button"
		},
		composeBtn = {
			"compose_button"
		},
		resolveBtn = {
			"resolve_button",
			i18n("msgbox_text_analyse")
		},
		loveRepairBtn = {
			"love_lettle_repair_button",
			i18n("loveletter_exchange_button")
		},
		metaskillBtn = {
			"metaskill_use_btn",
			i18n("msgbox_text_use")
		},
		blueBtn = {
			"blue_btn"
		},
		yellowBtn = {
			"yellow_btn"
		}
	}) do
		local var_2_0, var_2_1 = unpack(iter_2_1)

		arg_2_0[iter_2_0] = arg_2_0.btnContent:Find(var_2_0)

		if var_2_1 then
			setText(arg_2_0[iter_2_0]:Find("pic"), var_2_1)
		end
	end

	arg_2_0.itemTF = arg_2_0.window:Find("item")
	arg_2_0.operatePanel = arg_2_0:findTF("operate")
	arg_2_0.countTF = arg_2_0.operatePanel:Find("item/left/own/Text"):GetComponent(typeof(Text))
	arg_2_0.keepFateTog = arg_2_0.operatePanel:Find("got/keep_tog")

	setText(arg_2_0.keepFateTog:Find("label"), i18n("keep_fate_tip"))

	arg_2_0.operateBtns = {}
	arg_2_0.operateBtns.Confirm = arg_2_0.operatePanel:Find("actions/confirm_button")
	arg_2_0.operateBtns.Cancel = arg_2_0.operatePanel:Find("actions/cancel_button")
	arg_2_0.operateBtns.Resolve = arg_2_0.operatePanel:Find("actions/resolve_button")

	setText(arg_2_0.operateBtns.Confirm:Find("label"), i18n("msgbox_text_confirm"))
	setText(arg_2_0.operateBtns.Cancel:Find("label"), i18n("msgbox_text_cancel"))
	setText(arg_2_0.operateBtns.Resolve:Find("label"), i18n("msgbox_text_analyse"))
	SetActive(arg_2_0.operatePanel, false)
	SetActive(arg_2_0.window, true)

	arg_2_0.operateMode = nil
	arg_2_0.operateBonusList = arg_2_0.operatePanel:Find("got/panel_bg/list")
	arg_2_0.operateBonusTpl = arg_2_0.operatePanel:Find("got/panel_bg/list/item")
	arg_2_0.operateCountdesc = arg_2_0.operatePanel:Find("count/image_text")
	arg_2_0.operateValue = arg_2_0.operatePanel:Find("count/number_panel/value")
	arg_2_0.operateLeftButton = arg_2_0.operatePanel:Find("count/number_panel/left")
	arg_2_0.operateRightButton = arg_2_0.operatePanel:Find("count/number_panel/right")
	arg_2_0.operateMaxButton = arg_2_0.operatePanel:Find("count/max")
end

function var_0_0.getButton(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0[arg_4_1] = arg_4_0[arg_4_1] or cloneTplTo(arg_4_2, arg_4_0.btnContent)

	setActive(arg_4_0[arg_4_1], true)

	return arg_4_0[arg_4_1]
end

function var_0_0.setDrop(arg_5_0, arg_5_1)
	if arg_5_1.type == DROP_TYPE_SHIP then
		arg_5_0:setItemInfo(arg_5_1, arg_5_0.itemTF)
	elseif arg_5_1.type == DROP_TYPE_ITEM then
		arg_5_1.count = getProxy(BagProxy):getItemCountById(arg_5_1.id)

		arg_5_0:setItem(arg_5_1)
	else
		assert(false, "do not support current kind of type: " .. arg_5_1.type)
	end
end

function var_0_0.setItemInfo(arg_6_0, arg_6_1, arg_6_2)
	updateDrop(arg_6_2:Find("left/IconTpl"), setmetatable({
		count = 0
	}, {
		__index = arg_6_1
	}))
	UpdateOwnDisplay(arg_6_2:Find("left/own"), arg_6_1)
	RegisterDetailButton(arg_6_0, arg_6_2:Find("left/detail"), arg_6_1)
	setText(arg_6_2:Find("display_panel/name_container/name/Text"), arg_6_1:getConfig("name"))
	setText(arg_6_2:Find("display_panel/desc/Text"), arg_6_1.desc)

	local var_6_0 = arg_6_2:Find("display_panel/name_container/shiptype")

	setActive(var_6_0, arg_6_1.type == DROP_TYPE_SHIP)

	if arg_6_1.type == DROP_TYPE_SHIP then
		GetImageSpriteFromAtlasAsync("shiptype", shipType2print(arg_6_1:getConfig("type")), var_6_0, false)
	end
end

function var_0_0.updateItemCount(arg_7_0, arg_7_1)
	arg_7_0.countTF.text = arg_7_1
end

function var_0_0.setItem(arg_8_0, arg_8_1)
	arg_8_0:setItemInfo(arg_8_1, arg_8_0.itemTF)

	arg_8_0.itemVO = arg_8_1:getSubClass()

	if not Item.CanInBag(arg_8_0.itemVO.id) then
		return
	end

	local var_8_0 = arg_8_0.itemVO:getConfig("compose_number")

	if var_8_0 > 0 and var_8_0 <= arg_8_0.itemVO.count then
		arg_8_0:setItemInfo(arg_8_1, arg_8_0.operatePanel:Find("item"))

		arg_8_0.operateMax = arg_8_0.itemVO.count / var_8_0

		setActive(arg_8_0.composeBtn, true)
	end

	if arg_8_0.itemVO:getConfig("usage") == ItemUsage.SOS then
		setText(arg_8_0.useBtn:Find("text"), 1)
		setActive(arg_8_0.useBtn, true)
	end

	local var_8_1 = arg_8_0.itemVO:getConfig("type")

	if Item.IsLoveLetterCheckItem(arg_8_0.itemVO.id) then
		local var_8_2 = arg_8_0.itemVO.extra or pg.loveletter_2018_2021[arg_8_0.itemVO.id].ship_group_id
		local var_8_3 = arg_8_0:getButton("checkMail", arg_8_0.blueBtn)

		setText(var_8_3:Find("pic"), i18n("loveletter_recover_bottom1"))
		onButton(arg_8_0, var_8_3, function()
			arg_8_0:emit(ItemInfoMediator.CHECK_LOVE_LETTER_MAIL, arg_8_0.itemVO.id, var_8_2)
		end, SFX_CONFIRM)

		local var_8_4 = arg_8_0:getButton("repairMail", arg_8_0.yellowBtn)

		setText(var_8_4:Find("pic"), i18n("loveletter_recover_bottom2"))

		local var_8_5 = getProxy(BagProxy):GetLoveLetterRepairInfo(arg_8_0.itemVO.id .. "_" .. var_8_2)

		onButton(arg_8_0, var_8_4, function()
			if not var_8_5 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("loveletter_recover_tip1"))
			elseif #var_8_5 == 0 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("loveletter_recover_tip3"))
			elseif #var_8_5 == 1 then
				local var_10_0 = var_8_5[1]

				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					delayConfirm = 3,
					content = i18n("loveletter_recover_text1", var_10_0, ShipGroup.New({
						id = var_8_2
					}):getName()),
					onYes = function()
						arg_8_0:emit(ItemInfoMediator.REPAIR_LOVE_LETTER_MAIL, arg_8_0.itemVO.id, var_10_0, var_8_2)
					end
				})
			else
				table.sort(var_8_5)
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					hideYes = true,
					content = i18n("loveletter_recover_text2", ShipGroup.New({
						id = var_8_2
					}):getName()),
					custom = underscore.map(var_8_5, function(arg_12_0)
						return {
							delayButton = 3,
							text = i18n("loveletter_recover_bottom3", arg_12_0),
							sound = SFX_CONFIRM,
							onCallback = function()
								arg_8_0:emit(ItemInfoMediator.REPAIR_LOVE_LETTER_MAIL, arg_8_0.itemVO.id, arg_12_0, var_8_2)
							end,
							btnType = pg.MsgboxMgr.BUTTON_YELLOW
						}
					end)
				})
			end
		end, SFX_PANEL)
		setGray(var_8_4, not var_8_5 or #var_8_5 == 0)
	elseif arg_8_0.itemVO:CanOpen() then
		setText(arg_8_0.useBtn:Find("text"), 1)
		setActive(arg_8_0.useBtn, true)

		if arg_8_0.itemVO.count > 1 then
			setText(arg_8_0.batchUseBtn:Find("text"), math.min(arg_8_0.itemVO.count, 10))
			setActive(arg_8_0.batchUseBtn, true)
		end
	elseif var_8_1 == Item.BLUEPRINT_TYPE then
		local var_8_6 = getProxy(TechnologyProxy)
		local var_8_7 = var_8_6:GetBlueprint4Item(arg_8_0.itemVO.id)

		if not LOCK_FRAGMENT_SHOP and var_8_7 and var_8_6:getBluePrintById(var_8_7):isMaxLevel() then
			setActive(arg_8_0.resolveBtn, true)
			arg_8_0:UpdateBlueprintResolveNum()
		end

		arg_8_0:setItemInfo(arg_8_1, arg_8_0.operatePanel:Find("item"))
		setActive(arg_8_0.okBtn, true)
	elseif var_8_1 == Item.TEC_SPEEDUP_TYPE then
		setActive(arg_8_0.resolveBtn, true)
		arg_8_0:UpdateSpeedUpResolveNum()
		arg_8_0:setItemInfo(arg_8_1, arg_8_0.operatePanel:Find("item"))
		setActive(arg_8_0.okBtn, true)
	elseif var_8_1 == Item.LOVE_LETTER_TYPE then
		local var_8_8 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_LOVE_LETTER)

		setActive(arg_8_0.loveRepairBtn, var_8_8 and not var_8_8:isEnd() and var_8_8.data1 > 0 and arg_8_0.itemVO.extra == 31201)
		onButton(arg_8_0, arg_8_0.loveRepairBtn, function()
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("loveletter_exchange_confirm"),
				onYes = function()
					arg_8_0:emit(ItemInfoMediator.EXCHANGE_LOVE_LETTER_ITEM, var_8_8.id)
				end
			})
		end, SFX_PANEL)
		setActive(arg_8_0.okBtn, true)
	elseif var_8_1 == Item.METALESSON_TYPE then
		setActive(arg_8_0.metaskillBtn, true)
		onButton(arg_8_0, arg_8_0.metaskillBtn, function()
			arg_8_0:closeView()
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.METACHARACTER)
		end, SFX_PANEL)
		setActive(arg_8_0.okBtn, true)
	elseif var_8_1 == Item.SKIN_ASSIGNED_TYPE then
		setActive(arg_8_0.useOneBtn, arg_8_0.contextData.confirmCall)
		onButton(arg_8_0, arg_8_0.useOneBtn, function()
			arg_8_0.contextData.confirmCall()
			arg_8_0:closeView()
		end, SFX_PANEL)
		setActive(arg_8_0.okBtn, true)
	else
		setActive(arg_8_0.okBtn, true)
	end
end

function var_0_0.closeView(arg_18_0)
	if arg_18_0.playing then
		return
	end

	var_0_0.super.closeView(arg_18_0)
end

function var_0_0.didEnter(arg_19_0)
	local var_19_0 = arg_19_0:findTF("OpenBox(Clone)")

	if var_19_0 then
		SetActive(var_19_0, false)
	end

	onButton(arg_19_0, arg_19_0._tf:Find("bg"), function()
		arg_19_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_19_0, arg_19_0._tf:Find("window/top/btnBack"), function()
		arg_19_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_19_0, arg_19_0.okBtn, function()
		arg_19_0:closeView()
	end, SFX_CONFIRM)
	onButton(arg_19_0, arg_19_0.useBtn, function()
		arg_19_0:emit(ItemInfoMediator.USE_ITEM, arg_19_0.itemVO.id, 1)
	end, SFX_CONFIRM)
	onButton(arg_19_0, arg_19_0.batchUseBtn, function()
		arg_19_0:emit(ItemInfoMediator.USE_ITEM, arg_19_0.itemVO.id, math.min(arg_19_0.itemVO.count, 10))
	end, SFX_CONFIRM)
	onButton(arg_19_0, arg_19_0.composeBtn, function()
		SetActive(arg_19_0.operatePanel, true)
		SetActive(arg_19_0.window, false)

		arg_19_0.operateMode = var_0_3.COMPOSE

		arg_19_0:SetOperateCount(1)
	end, SFX_CONFIRM)
	onButton(arg_19_0, arg_19_0.resolveBtn, function()
		SetActive(arg_19_0.operatePanel, true)
		SetActive(arg_19_0.window, false)

		arg_19_0.operateMode = var_0_3.RESOLVE

		arg_19_0:SetOperateCount(1)
	end, SFX_PANEL)
	pressPersistTrigger(arg_19_0.operateLeftButton, 0.5, function(arg_27_0)
		if not arg_19_0:UpdateCount(arg_19_0.operateCount - 1) then
			arg_27_0()

			return
		end

		arg_19_0:SetOperateCount(arg_19_0.operateCount - 1)
	end, nil, true, true, 0.1, SFX_PANEL)
	pressPersistTrigger(arg_19_0.operateRightButton, 0.5, function(arg_28_0)
		if not arg_19_0:UpdateCount(arg_19_0.operateCount + 1) then
			arg_28_0()

			return
		end

		arg_19_0:SetOperateCount(arg_19_0.operateCount + 1)
	end, nil, true, true, 0.1, SFX_PANEL)
	onButton(arg_19_0, arg_19_0.operateMaxButton, function()
		arg_19_0:SetOperateCount(arg_19_0.operateMax)
	end, SFX_PANEL)
	onButton(arg_19_0, arg_19_0.operateBtns.Cancel, function()
		SetActive(arg_19_0.operatePanel, false)
		SetActive(arg_19_0.window, true)
	end, SFX_CANCEL)
	onButton(arg_19_0, arg_19_0.operateBtns.Confirm, function()
		arg_19_0:emit(ItemInfoMediator.COMPOSE_ITEM, arg_19_0.itemVO.id, arg_19_0.operateCount)

		local var_31_0 = arg_19_0.itemVO:getConfig("compose_number")

		if var_31_0 > arg_19_0.itemVO.count - arg_19_0.operateCount * var_31_0 then
			triggerButton(arg_19_0.operateBtns.Cancel)
		else
			arg_19_0:SetOperateCount(1)
		end
	end, SFX_CONFIRM)
	onButton(arg_19_0, arg_19_0.operateBtns.Resolve, function()
		arg_19_0:emit(ItemInfoMediator.SELL_BLUEPRINT, Drop.New({
			type = DROP_TYPE_ITEM,
			id = arg_19_0.itemVO.id,
			count = arg_19_0.operateCount
		}))
	end, SFX_CONFIRM)

	local var_19_1 = getProxy(PlayerProxy):getData()
	local var_19_2 = GetComponent(arg_19_0.keepFateTog, typeof(Toggle))

	arg_19_0.keepFateState = not var_19_1:GetCommonFlag(SHOW_DONT_KEEP_FATE_ITEM)
	var_19_2.isOn = arg_19_0.keepFateState

	local function var_19_3()
		arg_19_0:UpdateBlueprintResolveNum()
		arg_19_0:SetOperateCount(1)
	end

	onToggle(arg_19_0, arg_19_0.keepFateTog, function(arg_34_0)
		arg_19_0.keepFateState = arg_34_0

		if arg_34_0 then
			pg.m02:sendNotification(GAME.CANCEL_COMMON_FLAG, {
				flagID = SHOW_DONT_KEEP_FATE_ITEM
			})
		else
			pg.m02:sendNotification(GAME.COMMON_FLAG, {
				flagID = SHOW_DONT_KEEP_FATE_ITEM
			})
		end

		var_19_3()
	end)
	var_19_3()
end

function var_0_0.UpdateCount(arg_35_0, arg_35_1)
	if arg_35_0.operateMode == var_0_3.COMPOSE then
		local var_35_0 = arg_35_0.itemVO:getConfig("target_id")

		if not var_35_0 or var_35_0 <= 0 then
			return false
		end

		arg_35_1 = math.clamp(arg_35_1, 1, math.floor(arg_35_0.itemVO.count / arg_35_0.itemVO:getConfig("compose_number")))

		return arg_35_0.operateCount ~= arg_35_1
	elseif arg_35_0.operateMode == var_0_3.RESOLVE then
		arg_35_1 = math.clamp(arg_35_1, 1, arg_35_0.itemVO.count)

		return arg_35_0.operateCount ~= arg_35_1
	end
end

function var_0_0.SetOperateCount(arg_36_0, arg_36_1)
	if arg_36_0.operateMode == var_0_3.COMPOSE then
		local var_36_0 = arg_36_0.itemVO:getConfig("target_id")

		if not var_36_0 or var_36_0 <= 0 then
			return
		end

		local var_36_1 = arg_36_0.itemVO:getConfig("compose_number")

		arg_36_1 = math.clamp(arg_36_1, 1, math.floor(arg_36_0.itemVO.count / var_36_1))

		if arg_36_0.operateCount ~= arg_36_1 then
			arg_36_0.operateCount = arg_36_1

			arg_36_0:UpdateComposeCount()
		end

		local var_36_2 = arg_36_0.itemVO.count - arg_36_0.operateCount * var_36_1

		arg_36_0:updateItemCount(var_36_2)
	elseif arg_36_0.operateMode == var_0_3.RESOLVE then
		arg_36_1 = math.clamp(arg_36_1, 0, arg_36_0.operateMax)

		if arg_36_0.operateCount ~= arg_36_1 then
			arg_36_0.operateCount = arg_36_1

			arg_36_0:UpdateResolvePanel()
			arg_36_0:updateItemCount(arg_36_0.itemVO.count - arg_36_0.operateCount)
		end
	end
end

function var_0_0.UpdateComposeCount(arg_37_0)
	local var_37_0 = arg_37_0.operateCount

	setText(arg_37_0.operateValue, var_37_0)

	local var_37_1 = {}

	table.insert(var_37_1, {
		type = DROP_TYPE_ITEM,
		id = arg_37_0.itemVO:getConfig("target_id"),
		count = var_37_0
	})
	UIItemList.StaticAlign(arg_37_0.operateBonusList, arg_37_0.operateBonusTpl, #var_37_1, function(arg_38_0, arg_38_1, arg_38_2)
		arg_38_1 = arg_38_1 + 1

		if arg_38_0 == UIItemList.EventUpdate then
			local var_38_0 = var_37_1[arg_38_1]

			updateDrop(arg_38_2:Find("IconTpl"), var_38_0)
			onButton(arg_37_0, arg_38_2:Find("IconTpl"), function()
				arg_37_0:emit(var_0_0.ON_DROP, var_38_0)
			end, SFX_PANEL)
		end
	end)

	for iter_37_0, iter_37_1 in pairs(arg_37_0.operateBtns) do
		setActive(iter_37_1, iter_37_0 == "Confirm" or iter_37_0 == "Cancel")
	end

	setText(arg_37_0.operateCountdesc, i18n("compose_amount_prefix"))
	setActive(arg_37_0.keepFateTog, false)
end

function var_0_0.UpdateResolvePanel(arg_40_0)
	local var_40_0 = arg_40_0.operateCount

	setText(arg_40_0.operateValue, var_40_0)

	local var_40_1 = arg_40_0.itemVO:getConfig("price")
	local var_40_2 = {}

	table.insert(var_40_2, {
		type = DROP_TYPE_RESOURCE,
		id = var_40_1[1],
		count = var_40_1[2] * var_40_0
	})
	UIItemList.StaticAlign(arg_40_0.operateBonusList, arg_40_0.operateBonusTpl, #var_40_2, function(arg_41_0, arg_41_1, arg_41_2)
		arg_41_1 = arg_41_1 + 1

		if arg_41_0 == UIItemList.EventUpdate then
			local var_41_0 = var_40_2[arg_41_1]

			updateDrop(arg_41_2:Find("IconTpl"), var_41_0)
			onButton(arg_40_0, arg_41_2:Find("IconTpl"), function()
				arg_40_0:emit(var_0_0.ON_DROP, var_41_0)
			end, SFX_PANEL)
		end
	end)

	for iter_40_0, iter_40_1 in pairs(arg_40_0.operateBtns) do
		setActive(iter_40_1, iter_40_0 == "Resolve" or iter_40_0 == "Cancel")
	end

	setText(arg_40_0.operateCountdesc, i18n("resolve_amount_prefix"))

	if arg_40_0.itemVO:getConfig("type") == Item.TEC_SPEEDUP_TYPE then
		setActive(arg_40_0.keepFateTog, false)
	else
		setActive(arg_40_0.keepFateTog, true)
	end

	setButtonEnabled(arg_40_0.operateBtns.Resolve, var_40_0 > 0)
end

function var_0_0.UpdateBlueprintResolveNum(arg_43_0)
	local var_43_0 = arg_43_0.itemVO.count

	if arg_43_0.itemVO:getConfig("type") == Item.BLUEPRINT_TYPE then
		local var_43_1 = getProxy(TechnologyProxy)
		local var_43_2 = var_43_1:GetBlueprint4Item(arg_43_0.itemVO.id)
		local var_43_3 = var_43_1:getBluePrintById(var_43_2)

		if arg_43_0.keepFateState then
			var_43_0 = arg_43_0.itemVO.count - var_43_3:getFateMaxLeftOver()
			var_43_0 = var_43_0 < 0 and 0 or var_43_0
		end
	end

	arg_43_0.operateMax = var_43_0
end

function var_0_0.UpdateSpeedUpResolveNum(arg_44_0)
	local var_44_0 = arg_44_0.itemVO.count

	if arg_44_0.itemVO:getConfig("type") == Item.TEC_SPEEDUP_TYPE then
		arg_44_0.operateMax = var_44_0
	end
end

function var_0_0.willExit(arg_45_0)
	if arg_45_0.leftEventTrigger then
		ClearEventTrigger(arg_45_0.leftEventTrigger)
	end

	if arg_45_0.rightEventTrigger then
		ClearEventTrigger(arg_45_0.rightEventTrigger)
	end

	pg.UIMgr.GetInstance():UnblurPanel(arg_45_0._tf)
end

function var_0_0.PlayOpenBox(arg_46_0, arg_46_1, arg_46_2)
	if not arg_46_1 or arg_46_1 == "" then
		arg_46_2()

		return
	end

	local var_46_0 = {}
	local var_46_1 = arg_46_0:findTF(arg_46_1 .. "(Clone)")

	if var_46_1 then
		arg_46_0[arg_46_1] = go(var_46_1)
	end

	if not arg_46_0[arg_46_1] then
		table.insert(var_46_0, function(arg_47_0)
			PoolMgr.GetInstance():GetPrefab("ui/" .. string.lower(arg_46_1), "", true, function(arg_48_0)
				arg_48_0:SetActive(true)

				arg_46_0[arg_46_1] = arg_48_0

				arg_47_0()
			end)
		end)
	end

	seriesAsync(var_46_0, function()
		if arg_46_0.playing or not arg_46_0[arg_46_1] then
			return
		end

		arg_46_0.playing = true

		arg_46_0[arg_46_1]:SetActive(true)
		SetActive(arg_46_0.window, false)

		local var_49_0 = tf(arg_46_0[arg_46_1])

		var_49_0:SetParent(arg_46_0._tf, false)
		var_49_0:SetAsLastSibling()

		local var_49_1 = var_49_0:GetComponent("DftAniEvent")

		var_49_1:SetTriggerEvent(function(arg_50_0)
			arg_46_2()
		end)
		var_49_1:SetEndEvent(function(arg_51_0)
			if arg_46_0[arg_46_1] then
				SetActive(arg_46_0[arg_46_1], false)

				arg_46_0.playing = false
			end

			arg_46_0:closeView()
		end)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_EQUIPMENT_OPEN)
	end)
end

function var_0_0.inOutAnim(arg_52_0, arg_52_1, arg_52_2)
	if arg_52_1 then
		local var_52_0 = arg_52_0:findTF("window/bg_decorations"):GetComponent(typeof(Animation))

		var_52_0:Stop()
		var_52_0:Play("anim_window_bg")

		local var_52_1 = arg_52_0:findTF("window/top"):GetComponent(typeof(Animation))

		var_52_1:Stop()
		var_52_1:Play("anim_top")

		local var_52_2 = arg_52_0:findTF("window"):GetComponent(typeof(Animation))

		var_52_2:Stop()
		var_52_2:Play("anim_content")

		local var_52_3 = arg_52_0:findTF("bg"):GetComponent(typeof(Animation))

		var_52_3:Stop()
		var_52_3:Play("anim_bg_plus")
	end

	arg_52_2()
end

return var_0_0
