local var_0_0 = class("AttireCombatUIPanel", import(".AttireFramePanel"))
local var_0_1 = setmetatable

local function var_0_2(arg_1_0)
	local var_1_0 = {}

	local function var_1_1(arg_2_0)
		arg_2_0._go = arg_1_0
		arg_2_0.info = findTF(arg_2_0._go, "info")
		arg_2_0.empty = findTF(arg_2_0._go, "empty")
		arg_2_0.icon = findTF(arg_2_0._go, "info/icon")
		arg_2_0.selected = findTF(arg_2_0._go, "info/selected")
		arg_2_0.nameTxt = findTF(arg_2_0._go, "info/name")
		arg_2_0.descTxt = findTF(arg_2_0._go, "info/desc")
		arg_2_0.conditionTxt = findTF(arg_2_0._go, "info/condition")
		arg_2_0.tags = {
			findTF(arg_2_0._go, "info/tags/new"),
			findTF(arg_2_0._go, "info/tags/e")
		}
		arg_2_0.crossPrint = findTF(arg_2_0._go, "prints/odd")
		arg_2_0.own = findTF(arg_2_0._go, "info/own")
		arg_2_0.notOwn = findTF(arg_2_0._go, "info/notOwn")

		setText(arg_2_0.own, i18n("word_got"))
		setText(arg_2_0.notOwn, i18n("word_not_get"))
	end

	function var_1_0.isEmpty(arg_3_0)
		return not arg_3_0.uiStyle or arg_3_0.uiStyle.id == -1
	end

	function var_1_0.Update(arg_4_0, arg_4_1, arg_4_2, arg_4_3, arg_4_4, arg_4_5)
		arg_4_0.uiStyle = arg_4_1

		if arg_4_0:isEmpty() then
			setActive(arg_4_0.info, false)
			setActive(arg_4_0.empty, true)

			return
		end

		LoadImageSpriteAsync("combatuistyle/" .. arg_4_1:getConfig("icon"), arg_4_0.icon, true)
		setText(arg_4_0.nameTxt, arg_4_1:getConfig("name"))
		setText(arg_4_0.descTxt, arg_4_1:getConfig("desc"))
		setText(arg_4_0.conditionTxt, arg_4_1:getConfig("unlock"))

		local var_4_0 = arg_4_2:getAttireByType(arg_4_1:getType())

		setActive(arg_4_0.tags[2], arg_4_1:isOwned() and var_4_0 == arg_4_1.id)
		setActive(arg_4_0.tags[1], arg_4_1:isNew())
		setActive(arg_4_0.crossPrint, not arg_4_3 and math.fmod(arg_4_4 + 1, arg_4_5) ~= 0)
		setActive(arg_4_0.own, arg_4_1:isOwned())
		setActive(arg_4_0.notOwn, not arg_4_1:isOwned())
	end

	function var_1_0.UpdateSelected(arg_5_0, arg_5_1)
		setActive(arg_5_0.selected, arg_5_1)
	end

	function var_1_0.IsOwned(arg_6_0)
		return arg_6_0.uiStyle:isOwned()
	end

	var_1_1(var_1_0)

	return var_1_0
end

function var_0_0.OnInit(arg_7_0)
	arg_7_0.listPanel = arg_7_0:findTF("list_panel")
	arg_7_0.scolrect = arg_7_0:findTF("scrollrect", arg_7_0.listPanel):GetComponent("LScrollRect")
	arg_7_0.confirmBtn = arg_7_0:findTF("confirm", arg_7_0.listPanel)
	arg_7_0.previewBtn = arg_7_0:findTF("preview", arg_7_0.listPanel)
	arg_7_0.lockBtn = arg_7_0:findTF("lock", arg_7_0.listPanel)

	function arg_7_0.scolrect.onInitItem(arg_8_0)
		arg_7_0:OnInitItem(arg_8_0)
	end

	function arg_7_0.scolrect.onUpdateItem(arg_9_0, arg_9_1)
		arg_7_0:OnUpdateItem(arg_9_0, arg_9_1)
	end

	arg_7_0.cards = {}
	arg_7_0.totalCount = arg_7_0:findTF("total_count/Text"):GetComponent(typeof(Text))
	arg_7_0.preview = arg_7_0:findTF("preview")
	arg_7_0.sea = arg_7_0:findTF("preview/sea")
	arg_7_0.rawImage = arg_7_0.sea:GetComponent("RawImage")
	arg_7_0.uiLayer = arg_7_0:findTF("preview/ui")

	setText(arg_7_0.preview:Find("bg/title/Image"), i18n("word_preview"))
	setText(arg_7_0.confirmBtn:Find("Text"), i18n("attire_combatui_confirm"))
	setText(arg_7_0.previewBtn:Find("Text"), i18n("attire_combatui_preview"))
	setText(arg_7_0.lockBtn:Find("Text"), i18n("index_not_obtained"))
	setActive(arg_7_0.preview, false)
	setActive(arg_7_0.rawImage, false)
	onButton(arg_7_0, arg_7_0.preview, function()
		arg_7_0:onBackPressed()
	end)
end

function var_0_0.getUIName(arg_11_0)
	return "AttireCombatUIUI"
end

function var_0_0.GetData(arg_12_0)
	return arg_12_0.rawAttireVOs.combatUIStyles
end

function var_0_0.OnInitItem(arg_13_0, arg_13_1)
	local var_13_0 = var_0_2(arg_13_1)

	arg_13_0.cards[arg_13_1] = var_13_0

	onButton(arg_13_0, var_13_0._go, function()
		if not var_13_0:isEmpty() then
			if arg_13_0.card then
				arg_13_0.card:UpdateSelected(false)
			end

			arg_13_0.contextData.iconFrameId = var_13_0.uiStyle.id

			arg_13_0:UpdateDesc(var_13_0)
			var_13_0:UpdateSelected(true)

			arg_13_0.card = var_13_0

			if var_13_0:IsOwned() then
				setActive(arg_13_0.confirmBtn, true)
				setActive(arg_13_0.lockBtn, false)
			else
				setActive(arg_13_0.confirmBtn, false)
				setActive(arg_13_0.lockBtn, true)
			end
		end
	end, SFX_PANEL)
end

function var_0_0.GetColumn(arg_15_0)
	return 2
end

function var_0_0.OnUpdateItem(arg_16_0, arg_16_1, arg_16_2)
	var_0_0.super.OnUpdateItem(arg_16_0, arg_16_1, arg_16_2)

	local var_16_0 = arg_16_0.playerVO:getAttireByType(AttireConst.TYPE_COMBAT_UI_STYLE)
	local var_16_1 = arg_16_0.cards[arg_16_2]

	if var_16_1.uiStyle.id == var_16_0 then
		triggerButton(var_16_1._go)
	end
end

function var_0_0.GetDisplayVOs(arg_17_0)
	local var_17_0 = {}
	local var_17_1 = 0

	for iter_17_0, iter_17_1 in pairs(arg_17_0:GetData()) do
		table.insert(var_17_0, iter_17_1)

		if iter_17_1:getState() == AttireFrame.STATE_UNLOCK and iter_17_1.id >= 0 then
			var_17_1 = var_17_1 + 1
		end
	end

	return var_17_0, var_17_1
end

function var_0_0.UpdateDesc(arg_18_0, arg_18_1)
	if arg_18_1:isEmpty() then
		return
	end

	onButton(arg_18_0, arg_18_0.confirmBtn, function()
		local var_19_0 = arg_18_1.uiStyle:getType()

		arg_18_0:emit(AttireMediator.ON_APPLY, var_19_0, arg_18_1.uiStyle.id)
	end, SFX_PANEL)

	local var_18_0 = Ship.New({
		id = 100001,
		configId = 100001,
		skin_id = 100000
	})
	local var_18_1 = Ship.New({
		id = 100011,
		configId = 100011,
		skin_id = 100010
	})
	local var_18_2 = arg_18_1.uiStyle:getConfig("key")

	onButton(arg_18_0, arg_18_0.previewBtn, function()
		local var_20_0 = "CombatUI" .. var_18_2
		local var_20_1 = "CombatHPBar" .. var_18_2
		local var_20_2
		local var_20_3
		local var_20_4

		seriesAsync({
			function(arg_21_0)
				PoolMgr.GetInstance():GetUI(var_20_1, true, function(arg_22_0)
					var_20_3 = arg_22_0

					arg_21_0()
				end)
			end,
			function(arg_23_0)
				PoolMgr.GetInstance():GetUI(var_20_1, true, function(arg_24_0)
					var_20_4 = arg_24_0

					arg_23_0()
				end)
			end,
			function(arg_25_0)
				PoolMgr.GetInstance():GetUI(var_20_0, true, function(arg_26_0)
					var_20_2 = arg_26_0

					arg_25_0()
				end)
			end
		}, function()
			local var_27_0 = pg.UIMgr.GetInstance().UIMain

			var_20_2.transform:SetParent(arg_18_0.uiLayer, false)
			var_20_3.transform:SetParent(arg_18_0.uiLayer, false)
			var_20_4.transform:SetParent(arg_18_0.uiLayer, false)
			setActive(arg_18_0.preview, true)

			local var_27_1 = arg_18_0.sea.rect.width
			local var_27_2 = arg_18_0.sea.rect.height

			var_20_2.transform.localScale = Vector3(var_27_1 / 1920, var_27_2 / 1080, 1)
			arg_18_0.previewer = CombatUIPreviewer.New(arg_18_0.rawImage)

			arg_18_0.previewer:setDisplayWeapon({
				100
			})
			arg_18_0.previewer:setCombatUI(var_20_2, var_20_3, var_20_4, var_18_2)
			arg_18_0.previewer:load(40000, var_18_0, var_18_1, {}, function()
				return
			end)
		end)
	end, SFX_PANEL)
end

function var_0_0.onBackPressed(arg_29_0)
	if arg_29_0.previewer then
		setActive(arg_29_0.preview, false)
		arg_29_0.previewer:clear()

		arg_29_0.previewer = nil

		return true
	end
end

function var_0_0.OnDestroy(arg_30_0)
	if arg_30_0.previewer then
		arg_30_0.previewer:clear()

		arg_30_0.previewer = nil
	end
end

return var_0_0
