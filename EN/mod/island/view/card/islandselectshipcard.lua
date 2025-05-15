local var_0_0 = class("IslandSelectShipCard")

var_0_0.SKILL_COLOR = {
	Color.NewHex("3DFF00"),
	Color.NewHex("808080")
}

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.go = arg_1_1
	arg_1_0.tf = arg_1_1.transform
	arg_1_0.selectedTF = arg_1_0.tf:Find("selected")
	arg_1_0.iconTF = arg_1_0.tf:Find("icon")
	arg_1_0.triedMaskTF = arg_1_0.tf:Find("mask/tried")

	setText(arg_1_0.triedMaskTF:Find("Text"), i18n1("疲惫"))

	arg_1_0.workingMaskTF = arg_1_0.tf:Find("mask/working")

	setText(arg_1_0.workingMaskTF:Find("Text"), i18n1("工作中"))

	arg_1_0.iconsTF = arg_1_0.tf:Find("icons")
	arg_1_0.skillTF = arg_1_0.iconsTF:Find("skill/tpl")
	arg_1_0.gradeTF = arg_1_0.iconsTF:Find("grade/Text")
	arg_1_0.energySliderTF = arg_1_0.tf:Find("energy_bar")
	arg_1_0.energyTF = arg_1_0.tf:Find("energy_bar/Text")
	arg_1_0.nameTF = arg_1_0.tf:Find("name")
	arg_1_0.levelTF = arg_1_0.tf:Find("level")
end

function var_0_0.Update(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4)
	arg_2_0.ship = arg_2_1
	arg_2_0.id = arg_2_0.ship.id
	arg_2_0.attrType = arg_2_2
	arg_2_0.buildingId = arg_2_3

	arg_2_0:UpdateSelected(arg_2_4)

	local var_2_0 = IslandShip.StaticGetPrefab(arg_2_0.id)

	GetImageSpriteFromAtlasAsync("ShipYardIcon/" .. var_2_0, "", arg_2_0.iconTF)
	setImageColor(arg_2_0.skillTF, arg_2_1:IsMainSkillEffective(arg_2_0.buildingId) and var_0_0.SKILL_COLOR[1] or var_0_0.SKILL_COLOR[2])
	setText(arg_2_0.skillTF:Find("Text"), arg_2_1:GetMainSkill())
	setText(arg_2_0.gradeTF, arg_2_1:GetAttr(IslandShipAttr.ATTRS[arg_2_0.attrType]))

	local var_2_1 = arg_2_0.ship:GetName()

	setText(arg_2_0.nameTF, arg_2_0.ship:GetName())
	setText(arg_2_0.levelTF, arg_2_0.ship:GetLevel())

	local var_2_2 = arg_2_0.ship:GetEnergy()
	local var_2_3 = arg_2_0.ship:GetMaxEnergy()

	setSlider(arg_2_0.energySliderTF, 0, 1, var_2_2 / var_2_3)
	setText(arg_2_0.energyTF, var_2_2 .. "/" .. var_2_3)
	setActive(arg_2_0.triedMaskTF, var_2_2 == 0)
	setActive(arg_2_0.workingMaskTF, arg_2_1:GetState() == IslandShip.STATE_WORKING)
end

function var_0_0.UpdateSelected(arg_3_0, arg_3_1)
	arg_3_0.selectedId = arg_3_1

	setActive(arg_3_0.selectedTF, arg_3_0.id == arg_3_0.selectedId)
end

function var_0_0.Dispose(arg_4_0)
	return
end

return var_0_0
