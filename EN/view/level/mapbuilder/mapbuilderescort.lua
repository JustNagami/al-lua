local var_0_0 = class("MapBuilderEscort", import(".MapBuilderPermanent"))

function var_0_0.GetType(arg_1_0)
	return MapBuilder.TYPEESCORT
end

function var_0_0.getUIName(arg_2_0)
	return "escort_levels"
end

function var_0_0.OnInit(arg_3_0)
	arg_3_0.tpl = arg_3_0._tf:Find("escort_level_tpl")
	arg_3_0.itemHolder = arg_3_0._tf:Find("items")
end

function var_0_0.UpdateView(arg_4_0)
	local var_4_0 = arg_4_0.map.rect.width / arg_4_0.map.rect.height
	local var_4_1 = arg_4_0._parentTf.rect.width / arg_4_0._parentTf.rect.height
	local var_4_2 = 1

	if var_4_0 < var_4_1 then
		var_4_2 = arg_4_0._parentTf.rect.width / 1280
		arg_4_0._tf.localScale = Vector3(var_4_2, var_4_2, 1)
	else
		var_4_2 = arg_4_0._parentTf.rect.height / 720
		arg_4_0._tf.localScale = Vector3(var_4_2, var_4_2, 1)
	end

	arg_4_0.scaleRatio = var_4_2

	local var_4_3 = string.split(arg_4_0.contextData.map:getConfig("name"), "||")

	setText(arg_4_0.sceneParent.chapterName, var_4_3[1])
	arg_4_0.sceneParent.loader:GetSprite("chapterno", "chapterex", arg_4_0.sceneParent.chapterNoTitle, true)
	var_0_0.super.UpdateView(arg_4_0)
end

function var_0_0.UpdateEscortInfo(arg_5_0)
	local var_5_0 = getProxy(ChapterProxy)
	local var_5_1 = var_5_0:getMaxEscortChallengeTimes()

	setText(arg_5_0.sceneParent.escortBar:Find("times/text"), var_5_1 - var_5_0.escortChallengeTimes .. "/" .. var_5_1)
	onButton(arg_5_0.sceneParent, arg_5_0.sceneParent.mapHelpBtn, function()
		arg_5_0.sceneParent:HandleShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("levelScene_escort_help_tip")
		})
	end, SFX_PANEL)
end

function var_0_0.UpdateMapItems(arg_7_0)
	var_0_0.super.UpdateMapItems(arg_7_0)
	arg_7_0:UpdateEscortInfo()

	local var_7_0 = arg_7_0.data
	local var_7_1 = getProxy(ChapterProxy):getEscortChapterIds()
	local var_7_2 = _.filter(var_7_0:getChapters(), function(arg_8_0)
		return table.contains(var_7_1, arg_8_0.id)
	end)

	UIItemList.StaticAlign(arg_7_0.itemHolder, arg_7_0.tpl, #var_7_2, function(arg_9_0, arg_9_1, arg_9_2)
		if arg_9_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_7_0:UpdateEscortItem(arg_9_2, var_7_2[arg_9_1 + 1].id, var_7_2[arg_9_1 + 1])
	end)
end

function var_0_0.UpdateEscortItem(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
	local var_10_0 = pg.escort_template[arg_10_2]

	assert(var_10_0, "escort template not exist: " .. arg_10_2)

	local var_10_1 = getProxy(ChapterProxy):getActiveChapter(true)

	arg_10_1.name = "chapter_" .. arg_10_3.id

	local var_10_2 = arg_10_0.map.rect

	arg_10_1.anchoredPosition = Vector2(var_10_2.width / arg_10_0.scaleRatio * (tonumber(var_10_0.pos_x) - 0.5), var_10_2.height / arg_10_0.scaleRatio * (tonumber(var_10_0.pos_y) - 0.5))

	local var_10_3 = arg_10_1:Find("fighting")
	local var_10_4 = var_10_1 and var_10_1.id == arg_10_3.id

	setActive(var_10_3, var_10_4)
	arg_10_0:DeleteTween("fighting" .. arg_10_3.id)

	if var_10_4 then
		setImageAlpha(var_10_3, 1)
		arg_10_0:RecordTween("fighting" .. arg_10_3.id, LeanTween.alpha(var_10_3, 0, 0.5):setEase(LeanTweenType.easeInOutSine):setLoopPingPong().uniqueId)
	end

	GetImageSpriteFromAtlasAsync("levelmap/mapquad/" .. var_10_0.pic, "", arg_10_1, true)

	local var_10_5 = arg_10_1:Find("anim")
	local var_10_6 = getProxy(ChapterProxy):getEscortChapterIds()
	local var_10_7 = table.indexof(var_10_6, arg_10_2)
	local var_10_8 = ({
		Color.green,
		Color.yellow,
		Color.red
	})[var_10_7 or 1]
	local var_10_9 = var_10_5:GetComponentsInChildren(typeof(Image)):ToTable()

	for iter_10_0, iter_10_1 in ipairs(var_10_9) do
		iter_10_1.color = var_10_8
	end

	setImageColor(arg_10_1, var_10_8)

	local var_10_10 = arg_10_3.id

	onButton(arg_10_0, arg_10_1, function()
		arg_10_0:TryOpenChapterInfo(var_10_10)
	end, SFX_PANEL)
end

function var_0_0.OnShow(arg_12_0)
	var_0_0.super.OnShow(arg_12_0)
	setActive(arg_12_0.sceneParent.mainLayer:Find("title_chapter_lines"), true)
	setActive(arg_12_0.sceneParent.topChapter:Find("title_chapter"), true)
	setActive(arg_12_0.sceneParent.topChapter:Find("type_escort"), true)
	setActive(arg_12_0.sceneParent.escortBar, true)
	setActive(arg_12_0.sceneParent.mapHelpBtn, true)
end

function var_0_0.OnHide(arg_13_0)
	setActive(arg_13_0.sceneParent.mainLayer:Find("title_chapter_lines"), false)
	setActive(arg_13_0.sceneParent.topChapter:Find("title_chapter"), false)
	setActive(arg_13_0.sceneParent.topChapter:Find("type_escort"), false)
	setActive(arg_13_0.sceneParent.escortBar, false)
	setActive(arg_13_0.sceneParent.mapHelpBtn, false)
	var_0_0.super.OnHide(arg_13_0)
end

function var_0_0.HideFloat(arg_14_0)
	setActive(arg_14_0.itemHolder, false)
end

function var_0_0.ShowFloat(arg_15_0)
	setActive(arg_15_0.itemHolder, true)
end

return var_0_0
