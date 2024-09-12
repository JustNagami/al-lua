local var_0_0 = class("ChargeBattleUISellLayer", import("...base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "ChargeBattleUISellLayer"
end

function var_0_0.init(arg_2_0)
	arg_2_0:InitData()
	arg_2_0:InitUI()
	arg_2_0:updateGiftWindow()
	arg_2_0:InitBattleShow()
end

function var_0_0.didEnter(arg_3_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_3_0._tf)
end

function var_0_0.willExit(arg_4_0)
	arg_4_0:ClearPreviewer()
	pg.UIMgr.GetInstance():UnblurPanel(arg_4_0._tf)
end

function var_0_0.InitData(arg_5_0)
	arg_5_0.showGoodVO = arg_5_0.contextData.showGoodVO
	arg_5_0.chargedList = arg_5_0.contextData.chargedList
	arg_5_0.goodVOList = arg_5_0.showGoodVO:getSameLimitGroupTecGoods()
	arg_5_0.normalGoodVO = nil
	arg_5_0.specailGoodVO = nil

	for iter_5_0, iter_5_1 in ipairs(arg_5_0.goodVOList) do
		if iter_5_1:getConfig("limit_arg") == 1 then
			if not arg_5_0.normalGoodVO then
				arg_5_0.normalGoodVO = iter_5_1
			else
				arg_5_0.specailGoodVO = iter_5_1
			end
		end
	end

	arg_5_0.battleSkinId = nil
end

function var_0_0.InitUI(arg_6_0)
	arg_6_0.bg = arg_6_0:findTF("BG")
	arg_6_0.titleText = arg_6_0:findTF("mainPanel/topBar/left/titleText")
	arg_6_0.tipText = arg_6_0:findTF("mainPanel/topBar/left/tipText")
	arg_6_0.middleText = arg_6_0:findTF("mainPanel/topBar/middle/Text")
	arg_6_0.closeBtn = arg_6_0:findTF("mainPanel/topBar/right")
	arg_6_0.startShowBtn = arg_6_0:findTF("mainPanel/main/showWindow")
	arg_6_0.normalWindow = arg_6_0:findTF("mainPanel/main/normalWindow")
	arg_6_0.specialWindow = arg_6_0:findTF("mainPanel/main/specialWindow")
	arg_6_0.normalText = arg_6_0:findTF("title", arg_6_0.normalWindow)
	arg_6_0.specialText = arg_6_0:findTF("title", arg_6_0.specialWindow)
	arg_6_0.buyNormalBtn = arg_6_0:findTF("buyNormalButton", arg_6_0.normalWindow)
	arg_6_0.buySpecialBtn = arg_6_0:findTF("buySpecialButton", arg_6_0.specialWindow)

	local var_6_0 = GetComponent(arg_6_0._tf, "ItemList").prefabItem[0]
	local var_6_1 = Instantiate(var_6_0)

	arg_6_0.itemTpl = arg_6_0:findTF("itemTpl")

	local var_6_2 = arg_6_0:findTF("Container", arg_6_0.itemTpl)

	setParent(var_6_1, var_6_2, false)

	arg_6_0.normalList = UIItemList.New(arg_6_0:findTF("list", arg_6_0.normalWindow), arg_6_0.itemTpl)
	arg_6_0.specialList = UIItemList.New(arg_6_0:findTF("list", arg_6_0.specialWindow), arg_6_0.itemTpl)

	setText(arg_6_0.titleText, "")
	setText(arg_6_0.tipText, i18n("ui_pack_tip1"))
	setText(arg_6_0.normalText, i18n("ui_pack_tip2"))
	setText(arg_6_0.specialText, i18n("ui_pack_tip3"))

	arg_6_0.preview = arg_6_0:findTF("mainPanel/main/preview")
	arg_6_0.sea = arg_6_0:findTF("sea", arg_6_0.preview)
	arg_6_0.rawImage = arg_6_0.sea:GetComponent("RawImage")

	setActive(arg_6_0.preview, false)
	setActive(arg_6_0.rawImage, false)
	onButton(arg_6_0, arg_6_0.closeBtn, function()
		arg_6_0:ClearPreviewer()
		arg_6_0:closeView()
	end, SFX_PANEL)
	onButton(arg_6_0, arg_6_0.bg, function()
		arg_6_0:ClearPreviewer()
		arg_6_0:closeView()
	end, SFX_PANEL)
end

function var_0_0.updateGiftWindow(arg_9_0)
	onButton(arg_9_0, arg_9_0.buyNormalBtn, function()
		pg.m02:sendNotification(GAME.CHARGE_OPERATION, {
			shopId = arg_9_0.normalGoodVO.id
		})
		arg_9_0:ClearPreviewer()
		arg_9_0:closeView()
	end, SFX_PANEL)
	onButton(arg_9_0, arg_9_0.buySpecialBtn, function()
		pg.m02:sendNotification(GAME.CHARGE_OPERATION, {
			shopId = arg_9_0.specailGoodVO.id
		})
		arg_9_0:ClearPreviewer()
		arg_9_0:closeView()
	end, SFX_PANEL)

	local var_9_0 = {}

	for iter_9_0, iter_9_1 in ipairs(arg_9_0.normalGoodVO:GetExtraServiceItem()) do
		table.insert(var_9_0, iter_9_1)

		if not arg_9_0.battleSkinId then
			arg_9_0.battleSkinId = iter_9_1.id
		end
	end

	arg_9_0.normalList:make(function(arg_12_0, arg_12_1, arg_12_2)
		if arg_12_0 == UIItemList.EventUpdate then
			local var_12_0 = arg_9_0:findTF("Container", arg_12_2):GetChild(0)
			local var_12_1 = arg_9_0:findTF("TextMask/Text", arg_12_2)
			local var_12_2 = var_9_0[arg_12_1 + 1]

			updateDrop(var_12_0, var_12_2)
			onButton(arg_9_0, var_12_0, function()
				arg_9_0:emit(BaseUI.ON_DROP, var_12_2)
			end, SFX_PANEL)
			setScrollText(var_12_1, var_12_2:getName())

			if arg_9_0.titleText:GetComponent(typeof(Text)).text == "" then
				setText(arg_9_0.titleText, var_12_2:getName())
			end
		end
	end)
	arg_9_0.normalList:align(#var_9_0)

	var_9_0 = {}

	for iter_9_2, iter_9_3 in ipairs(arg_9_0.specailGoodVO:GetExtraServiceItem()) do
		table.insert(var_9_0, iter_9_3)
	end

	arg_9_0.specialList:make(function(arg_14_0, arg_14_1, arg_14_2)
		if arg_14_0 == UIItemList.EventUpdate then
			local var_14_0 = arg_9_0:findTF("Container", arg_14_2):GetChild(0)
			local var_14_1 = arg_9_0:findTF("TextMask/Text", arg_14_2)
			local var_14_2 = var_9_0[arg_14_1 + 1]

			updateDrop(var_14_0, var_14_2)
			onButton(arg_9_0, var_14_0, function()
				arg_9_0:emit(BaseUI.ON_DROP, var_14_2)
			end, SFX_PANEL)
			setScrollText(var_14_1, var_14_2:getName())
		end
	end)
	arg_9_0.specialList:align(#var_9_0)
end

function var_0_0.InitBattleShow(arg_16_0)
	local var_16_0 = Ship.New({
		id = 100001,
		configId = 100001,
		skin_id = 100000
	})
	local var_16_1 = Ship.New({
		id = 100011,
		configId = 100011,
		skin_id = 100010
	})
	local var_16_2 = pg.item_data_battleui[arg_16_0.battleSkinId].key

	onButton(arg_16_0, arg_16_0.startShowBtn, function()
		local var_17_0 = "CombatUI" .. var_16_2
		local var_17_1 = "CombatHPBar" .. var_16_2
		local var_17_2
		local var_17_3
		local var_17_4

		seriesAsync({
			function(arg_18_0)
				PoolMgr.GetInstance():GetUI(var_17_1, true, function(arg_19_0)
					var_17_3 = arg_19_0

					arg_18_0()
				end)
			end,
			function(arg_20_0)
				PoolMgr.GetInstance():GetUI(var_17_1, true, function(arg_21_0)
					var_17_4 = arg_21_0

					arg_20_0()
				end)
			end,
			function(arg_22_0)
				PoolMgr.GetInstance():GetUI(var_17_0, true, function(arg_23_0)
					var_17_2 = arg_23_0

					arg_22_0()
				end)
			end
		}, function()
			local var_24_0 = pg.UIMgr.GetInstance().UIMain

			var_17_2.transform:SetParent(arg_16_0.preview, false)
			var_17_3.transform:SetParent(arg_16_0.preview, false)
			var_17_4.transform:SetParent(arg_16_0.preview, false)
			setActive(arg_16_0.preview, true)

			local var_24_1 = arg_16_0.sea.rect.width
			local var_24_2 = arg_16_0.sea.rect.height

			var_17_2.transform.localScale = Vector3(var_24_1 / 1920, var_24_2 / 1080, 1)
			arg_16_0.previewer = CombatUIPreviewer.New(arg_16_0.rawImage)

			arg_16_0.previewer:setDisplayWeapon({
				100
			})
			arg_16_0.previewer:setCombatUI(var_17_2, var_17_3, var_17_4, var_16_2)
			arg_16_0.previewer:load(40000, var_16_0, var_16_1, {}, function()
				return
			end)
		end)
	end, SFX_PANEL)
	triggerButton(arg_16_0.startShowBtn)
end

function var_0_0.ClearPreviewer(arg_26_0)
	if arg_26_0.previewer then
		setActive(arg_26_0.preview, false)
		arg_26_0.previewer:clear()

		arg_26_0.previewer = nil
	end
end

function var_0_0.onBackPressed(arg_27_0)
	arg_27_0:ClearPreviewer()
	arg_27_0:emit(var_0_0.ON_BACK_PRESSED)
end

return var_0_0
