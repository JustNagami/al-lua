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

	var_1_1(var_1_0)

	return var_1_0
end

function var_0_0.OnInit(arg_6_0)
	arg_6_0.listPanel = arg_6_0:findTF("list_panel")
	arg_6_0.scolrect = arg_6_0:findTF("scrollrect", arg_6_0.listPanel):GetComponent("LScrollRect")
	arg_6_0.confirmBtn = arg_6_0:findTF("confirm", arg_6_0.listPanel)
	arg_6_0.previewBtn = arg_6_0:findTF("preview", arg_6_0.listPanel)

	function arg_6_0.scolrect.onInitItem(arg_7_0)
		arg_6_0:OnInitItem(arg_7_0)
	end

	function arg_6_0.scolrect.onUpdateItem(arg_8_0, arg_8_1)
		arg_6_0:OnUpdateItem(arg_8_0, arg_8_1)
	end

	arg_6_0.cards = {}
	arg_6_0.totalCount = arg_6_0:findTF("total_count/Text"):GetComponent(typeof(Text))
	arg_6_0.preview = arg_6_0:findTF("preview")
	arg_6_0.sea = arg_6_0:findTF("preview/sea")
	arg_6_0.rawImage = arg_6_0.sea:GetComponent("RawImage")
	arg_6_0.uiLayer = arg_6_0:findTF("preview/ui")

	setText(arg_6_0.preview:Find("bg/title/Image"), i18n("word_preview"))
	setActive(arg_6_0.preview, false)
	setActive(arg_6_0.rawImage, false)
	onButton(arg_6_0, arg_6_0.preview, function()
		arg_6_0:onBackPressed()
	end)
end

function var_0_0.getUIName(arg_10_0)
	return "AttireCombatUIUI"
end

function var_0_0.GetData(arg_11_0)
	return arg_11_0.rawAttireVOs.combatUIStyles
end

function var_0_0.OnInitItem(arg_12_0, arg_12_1)
	local var_12_0 = var_0_2(arg_12_1)

	arg_12_0.cards[arg_12_1] = var_12_0

	onButton(arg_12_0, var_12_0._go, function()
		if not var_12_0:isEmpty() then
			if arg_12_0.card then
				arg_12_0.card:UpdateSelected(false)
			end

			arg_12_0.contextData.iconFrameId = var_12_0.uiStyle.id

			arg_12_0:UpdateDesc(var_12_0)
			var_12_0:UpdateSelected(true)

			arg_12_0.card = var_12_0
		end
	end, SFX_PANEL)
end

function var_0_0.GetColumn(arg_14_0)
	return 2
end

function var_0_0.OnUpdateItem(arg_15_0, arg_15_1, arg_15_2)
	var_0_0.super.OnUpdateItem(arg_15_0, arg_15_1, arg_15_2)

	local var_15_0 = arg_15_0.contextData.iconFrameId or arg_15_0.displayVOs[1].id
	local var_15_1 = arg_15_0.cards[arg_15_2]

	if var_15_1.uiStyle.id == var_15_0 then
		triggerButton(var_15_1._go)
		var_15_1:UpdateSelected(true)
	end
end

function var_0_0.GetDisplayVOs(arg_16_0)
	local var_16_0 = {}
	local var_16_1 = 0

	for iter_16_0, iter_16_1 in pairs(arg_16_0:GetData()) do
		table.insert(var_16_0, iter_16_1)

		if iter_16_1:getState() == AttireFrame.STATE_UNLOCK and iter_16_1.id >= 0 then
			var_16_1 = var_16_1 + 1
		end
	end

	return var_16_0, var_16_1
end

function var_0_0.UpdateDesc(arg_17_0, arg_17_1)
	if arg_17_1:isEmpty() then
		return
	end

	onButton(arg_17_0, arg_17_0.confirmBtn, function()
		local var_18_0 = arg_17_1.uiStyle:getType()

		arg_17_0:emit(AttireMediator.ON_APPLY, var_18_0, arg_17_1.uiStyle.id)
	end, SFX_PANEL)

	local var_17_0 = Ship.New({
		id = 100001,
		configId = 100001,
		skin_id = 100000
	})
	local var_17_1 = Ship.New({
		id = 100011,
		configId = 100011,
		skin_id = 100010
	})
	local var_17_2 = arg_17_1.uiStyle:getConfig("key")

	onButton(arg_17_0, arg_17_0.previewBtn, function()
		local var_19_0 = "CombatUI" .. var_17_2
		local var_19_1 = "CombatHPBar" .. var_17_2
		local var_19_2
		local var_19_3
		local var_19_4

		seriesAsync({
			function(arg_20_0)
				PoolMgr.GetInstance():GetUI(var_19_1, true, function(arg_21_0)
					var_19_3 = arg_21_0

					arg_20_0()
				end)
			end,
			function(arg_22_0)
				PoolMgr.GetInstance():GetUI(var_19_1, true, function(arg_23_0)
					var_19_4 = arg_23_0

					arg_22_0()
				end)
			end,
			function(arg_24_0)
				PoolMgr.GetInstance():GetUI(var_19_0, true, function(arg_25_0)
					var_19_2 = arg_25_0

					arg_24_0()
				end)
			end
		}, function()
			local var_26_0 = pg.UIMgr.GetInstance().UIMain

			var_19_2.transform:SetParent(arg_17_0.uiLayer, false)
			var_19_3.transform:SetParent(arg_17_0.uiLayer, false)
			var_19_4.transform:SetParent(arg_17_0.uiLayer, false)
			setActive(arg_17_0.preview, true)

			local var_26_1 = arg_17_0.sea.rect.width
			local var_26_2 = arg_17_0.sea.rect.height

			var_19_2.transform.localScale = Vector3(var_26_1 / 1920, var_26_2 / 1080, 1)
			arg_17_0.previewer = CombatUIPreviewer.New(arg_17_0.rawImage)

			arg_17_0.previewer:setDisplayWeapon({
				100
			})
			arg_17_0.previewer:setCombatUI(var_19_2, var_19_3, var_19_4, var_17_2)
			arg_17_0.previewer:load(40000, var_17_0, var_17_1, {}, function()
				return
			end)
		end)
	end, SFX_PANEL)
end

function var_0_0.onBackPressed(arg_28_0)
	if arg_28_0.previewer then
		setActive(arg_28_0.preview, false)
		arg_28_0.previewer:clear()

		arg_28_0.previewer = nil

		return true
	end
end

function var_0_0.OnDestroy(arg_29_0)
	if arg_29_0.previewer then
		arg_29_0.previewer:clear()

		arg_29_0.previewer = nil
	end
end

return var_0_0
