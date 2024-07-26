local var_0_0 = class("MapBuilderAtelier", import(".MapBuilderNormal"))

function var_0_0.GetType(arg_1_0)
	return MapBuilder.TYPEATELIER
end

function var_0_0.OnShow(arg_2_0)
	var_0_0.super.OnShow(arg_2_0)

	local var_2_0 = GetSpriteFromAtlas("ui/levelmainscene_atlas", "btn_lianjin")

	setImageSprite(arg_2_0.sceneParent.actEliteBtn, var_2_0, true)
end

function var_0_0.OnHide(arg_3_0)
	local var_3_0 = GetSpriteFromAtlas("ui/levelmainscene_atlas", "btn_elite")

	setImageSprite(arg_3_0.sceneParent.actEliteBtn, var_3_0, true)
	var_0_0.super.OnHide(arg_3_0)
end

function var_0_0.UpdateButtons(arg_4_0)
	var_0_0.super.UpdateButtons(arg_4_0)

	local var_4_0 = arg_4_0.data:getConfig("type")

	setActive(arg_4_0.sceneParent.actAtelierBuffBtn, var_4_0 > Map.ACTIVITY_EASY)
end

return var_0_0
