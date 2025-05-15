local var_0_0 = class("IslandShipInfoPage", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandShipInfoUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.skillUpgradeBtn = arg_2_0:findTF("adapt/skill_status_panel/skill/upgrade")
	arg_2_0.nameTxt = arg_2_0:findTF("adapt/level_panel/name"):GetComponent(typeof(Text))
	arg_2_0.nameEnTxt = arg_2_0:findTF("adapt/level_panel/en"):GetComponent(typeof(Text))
	arg_2_0.rarityImg = arg_2_0:findTF("adapt/level_panel/rarity"):GetComponent(typeof(Image))
	arg_2_0.levelTxt = arg_2_0:findTF("adapt/level_panel/exp"):GetComponent(typeof(Text))
	arg_2_0.uiAttrList = UIItemList.New(arg_2_0:findTF("adapt/attr_panel/list"), arg_2_0:findTF("adapt/attr_panel/list/tpl"))
	arg_2_0.skillInfoFrame = arg_2_0:findTF("adapt/skill_status_panel/skill/info")
	arg_2_0.skillIconImg = arg_2_0:findTF("adapt/skill_status_panel/skill/icon")
	arg_2_0.skillName = arg_2_0:findTF("adapt/skill_status_panel/skill/info/name"):GetComponent(typeof(Text))
	arg_2_0.skillLevel = arg_2_0:findTF("adapt/skill_status_panel/skill/info/level"):GetComponent(typeof(Text))
	arg_2_0.skillDesc = arg_2_0:findTF("adapt/skill_status_panel/skill/info/desc/Text"):GetComponent(typeof(Text))
	arg_2_0.attrDescPanel = IslandShipAttrDescPanel.New(arg_2_0:findTF("adapt/tip"))
	arg_2_0.statusPanel = IslandShipStatusPanel.New(arg_2_0:findTF("adapt/skill_status_panel/status"))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0.skillUpgradeBtn, function()
		arg_3_0:emit(IslandShipMainPage.OPEN_PAGE, IslandShipMainPage.PAGE_SKILL)
	end, SFX_PANEL)
end

function var_0_0.OnShow(arg_5_0, arg_5_1)
	local var_5_0 = getProxy(IslandProxy):GetIsland():GetCharacterAgency():GetShipByConfigId(arg_5_1)

	if var_5_0 == nil then
		return
	end

	arg_5_0:UpdateMainView(var_5_0)
end

function var_0_0.UpdateMainView(arg_6_0, arg_6_1)
	arg_6_0:UpdateLevelAndExp(arg_6_1)
	arg_6_0:UpdateAttrs(arg_6_1)
	arg_6_0:UpdateSkill(arg_6_1)
	arg_6_0:UpdateStatus(arg_6_1)
end

function var_0_0.UpdateLevelAndExp(arg_7_0, arg_7_1)
	arg_7_0.nameTxt.text = arg_7_1:GetName()
	arg_7_0.nameEnTxt.text = arg_7_1:GetEnName()

	local var_7_0 = arg_7_1:GetRarity()

	arg_7_0.rarityImg.sprite = GetSpriteFromAtlas("ui/IslandShipUI_atlas", "rarity_" .. var_7_0)

	if not arg_7_1:IsMaxLevel() then
		local var_7_1 = arg_7_1:GetExp()
		local var_7_2 = arg_7_1:GetTargetExp()

		arg_7_0.levelTxt.text = "Lv." .. arg_7_1:GetLevel() .. " [" .. var_7_1 .. "/" .. var_7_2 .. "]"
	else
		arg_7_0.levelTxt.text = "Lv." .. arg_7_1:GetLevel() .. "[MAX]"
	end
end

function var_0_0.UpdateAttrs(arg_8_0, arg_8_1)
	local var_8_0 = IslandShipAttr.ATTRS

	arg_8_0.uiAttrList:make(function(arg_9_0, arg_9_1, arg_9_2)
		if arg_9_0 == UIItemList.EventUpdate then
			local var_9_0 = arg_9_1 + 1

			if var_9_0 > #var_8_0 then
				setText(arg_9_2:Find("name"), i18n1("体力"))
				setText(arg_9_2:Find("value"), arg_8_1:GetEnergy() .. "/" .. arg_8_1:GetMaxEnergy())

				arg_9_2:Find("grade"):GetComponent(typeof(Image)).sprite = GetSpriteFromAtlas("ui/IslandShipUI_atlas", "grade_E")
			else
				arg_8_0:UpdateAttr(arg_9_2, var_8_0, var_9_0, arg_8_1)
			end
		end
	end)
	arg_8_0.uiAttrList:align(#var_8_0 + 1)
end

function var_0_0.UpdateAttr(arg_10_0, arg_10_1, arg_10_2, arg_10_3, arg_10_4)
	local var_10_0 = arg_10_2[arg_10_3]
	local var_10_1 = arg_10_4:GetAttr(var_10_0)

	setText(arg_10_1:Find("name"), IslandShipAttr.ToChinese(var_10_0))
	setText(arg_10_1:Find("value"), var_10_1)

	local var_10_2 = arg_10_4:GetAttrGrade(var_10_0)

	arg_10_1:Find("grade"):GetComponent(typeof(Image)).sprite = GetSpriteFromAtlas("ui/IslandShipUI_atlas", "grade_" .. var_10_2)

	local var_10_3 = (var_10_2 == "A" or var_10_2 == "S") and var_10_2 or "B"

	arg_10_1:Find("bg"):GetComponent(typeof(Image)).sprite = GetSpriteFromAtlas("ui/IslandShipUI_atlas", var_10_3 .. "_bg")

	onButton(arg_10_0, arg_10_1, function()
		local var_11_0 = arg_10_1.parent:TransformPoint(arg_10_1.localPosition)
		local var_11_1 = arg_10_0._tf:InverseTransformPoint(var_11_0)

		arg_10_0.attrDescPanel:Show(arg_10_4, var_10_0, var_11_1)
	end, SFX_PANEL)
end

function var_0_0.UpdateSkill(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_1:GetMainSkill()
	local var_12_1 = pg.island_ship_skill[var_12_0]

	assert(var_12_1, var_12_0)
	GetImageSpriteFromAtlasAsync("IslandSkillIcon/" .. var_12_1.icon, "", arg_12_0.skillIconImg)

	arg_12_0.skillName.text = var_12_1.name
	arg_12_0.skillLevel.text = "[Lv." .. var_12_1.level .. "]"
	arg_12_0.skillDesc.text = var_12_1.desc

	local var_12_2 = arg_12_1:CanUpgradeMainSkill()

	setActive(arg_12_0.skillUpgradeBtn, var_12_2)

	arg_12_0.skillInfoFrame.sizeDelta = var_12_2 and Vector2(380, 120) or Vector2(439, 120)
end

function var_0_0.UpdateStatus(arg_13_0, arg_13_1)
	arg_13_0.statusPanel:Flush(arg_13_1)

	local var_13_0 = arg_13_1:GetValidStatus()

	onButton(arg_13_0, arg_13_0.statusPanel.viewBtn, function()
		arg_13_0:ShowMsgBox({
			hideNo = true,
			type = IslandMsgBox.TYPE_STATUS,
			title = i18n1("详情"),
			statusList = var_13_0
		})
	end, SFX_PANEL)
end

function var_0_0.OnDestroy(arg_15_0)
	arg_15_0.shipTrs = nil

	arg_15_0.attrDescPanel:Dispose()

	arg_15_0.attrDescPanel = nil

	arg_15_0.statusPanel:Dispose()

	arg_15_0.statusPanel = nil
end

return var_0_0
