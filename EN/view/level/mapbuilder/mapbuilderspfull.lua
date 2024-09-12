local var_0_0 = class("MapBuilderSPFull", import(".MapBuilderSP"))

function var_0_0.GetType(arg_1_0)
	return MapBuilder.TYPESPFULL
end

function var_0_0.getUIName(arg_2_0)
	return "LevelSelectSPFullUI"
end

function var_0_0.OnInit(arg_3_0)
	var_0_0.super.OnInit(arg_3_0)

	arg_3_0.progressText = arg_3_0._tf:Find("Story/Desc/Digit")
end

function var_0_0.UpdateButtons(arg_4_0)
	var_0_0.super.UpdateButtons(arg_4_0)

	if arg_4_0.contextData.displayMode == var_0_0.DISPLAY.BATTLE then
		arg_4_0.sceneParent:updateDifficultyBtns()
		arg_4_0.sceneParent:updateActivityBtns()
		arg_4_0.sceneParent:UpdateSwitchMapButton()
	else
		arg_4_0.sceneParent:HideBtns()
	end
end

function var_0_0.OnHide(arg_5_0)
	arg_5_0.sceneParent:HideBtns()
	var_0_0.super.OnHide(arg_5_0)
end

function var_0_0.UpdateBattle(arg_6_0)
	local var_6_0 = getProxy(ChapterProxy)
	local var_6_1 = arg_6_0.displayChapterIDs
	local var_6_2 = {}

	for iter_6_0, iter_6_1 in ipairs(var_6_1) do
		local var_6_3 = var_6_0:getChapterById(iter_6_1)

		if var_6_3:isUnlock() or var_6_3:activeAlways() then
			table.insert(var_6_2, var_6_3)
		end
	end

	table.clear(arg_6_0.chapterTFsById)
	UIItemList.StaticAlign(arg_6_0.itemHolder, arg_6_0.chapterTpl, #var_6_2, function(arg_7_0, arg_7_1, arg_7_2)
		if arg_7_0 ~= UIItemList.EventUpdate then
			return
		end

		local var_7_0 = var_6_2[arg_7_1 + 1]

		arg_6_0:UpdateMapItem(arg_7_2, var_7_0)

		arg_7_2.name = "Chapter_" .. var_7_0.id
		arg_6_0.chapterTFsById[var_7_0.id] = arg_7_2
	end)
end

function var_0_0.UpdateMapItem(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = arg_8_2:getConfigTable()

	setAnchoredPosition(arg_8_1, {
		x = arg_8_0.mapWidth * var_8_0.pos_x,
		y = arg_8_0.mapHeight * var_8_0.pos_y
	})

	local var_8_1 = findTF(arg_8_1, "main")

	setActive(var_8_1, true)

	local var_8_2 = findTF(var_8_1, "circle/fordark")
	local var_8_3 = findTF(var_8_1, "info/bk/fordark")

	setActive(var_8_2, var_8_0.icon_outline == 1)
	setActive(var_8_3, var_8_0.icon_outline == 1)

	local var_8_4 = arg_8_0.chapterGroupDict[arg_8_2.id]

	assert(var_8_4)

	local var_8_5 = {
		"Lock",
		"Normal",
		"Hard"
	}
	local var_8_6 = 1

	if arg_8_2:isUnlock() then
		var_8_6 = 2

		if #var_8_4.list > 1 then
			var_8_6 = table.indexof(var_8_4.list, arg_8_2.id) + 1
		elseif arg_8_2:IsSpChapter() or arg_8_2:IsEXChapter() then
			var_8_6 = 3
		elseif arg_8_0.contextData.map:isHardMap() then
			var_8_6 = 3
		end
	end

	local var_8_7 = findTF(var_8_1, "circle/bk")

	for iter_8_0, iter_8_1 in ipairs(var_8_5) do
		setActive(var_8_7:Find(iter_8_1), iter_8_0 == var_8_6)
	end

	local var_8_8 = findTF(var_8_1, "circle/clear_flag")
	local var_8_9 = findTF(var_8_1, "circle/lock")
	local var_8_10 = findTF(var_8_1, "circle/progress")
	local var_8_11 = findTF(var_8_1, "circle/progress_text")
	local var_8_12 = findTF(var_8_1, "circle/stars")
	local var_8_13 = string.split(var_8_0.name, "|")

	setText(findTF(var_8_1, "info/bk/title_form/title_index"), var_8_0.chapter_name .. "  ")
	setText(findTF(var_8_1, "info/bk/title_form/title"), var_8_13[1])
	setText(findTF(var_8_1, "info/bk/title_form/title_en"), var_8_13[2] or "")
	setFillAmount(var_8_10, arg_8_2.progress / 100)
	setText(var_8_11, string.format("%d%%", arg_8_2.progress))
	setActive(var_8_12, arg_8_2:existAchieve())

	if arg_8_2:existAchieve() then
		for iter_8_2, iter_8_3 in ipairs(arg_8_2.achieves) do
			local var_8_14 = ChapterConst.IsAchieved(iter_8_3)
			local var_8_15 = var_8_12:GetChild(iter_8_2 - 1):Find("light")

			setActive(var_8_15, var_8_14)

			for iter_8_4, iter_8_5 in ipairs(var_8_5) do
				if iter_8_5 ~= "Lock" then
					setActive(var_8_15:Find(iter_8_5), iter_8_4 == var_8_6)
				end
			end
		end
	end

	local var_8_16 = findTF(var_8_1, "info/bk/BG")

	for iter_8_6, iter_8_7 in ipairs(var_8_5) do
		setActive(var_8_16:Find(iter_8_7), iter_8_6 == var_8_6)
	end

	setActive(findTF(var_8_1, "HardEffect"), var_8_6 == 3)

	local var_8_17 = not arg_8_2.active and arg_8_2:isClear()
	local var_8_18 = not arg_8_2.active and not arg_8_2:isUnlock()

	setActive(var_8_8, var_8_17)
	setActive(var_8_9, var_8_18)
	setActive(var_8_11, not var_8_17 and not var_8_18)
	arg_8_0:DeleteTween("fighting" .. arg_8_2.id)

	local var_8_19 = findTF(var_8_1, "circle/fighting")

	setText(findTF(var_8_19, "Text"), i18n("tag_level_fighting"))

	local var_8_20 = findTF(var_8_1, "circle/oni")

	setText(findTF(var_8_20, "Text"), i18n("tag_level_oni"))

	local var_8_21 = findTF(var_8_1, "circle/narrative")

	setText(findTF(var_8_21, "Text"), i18n("tag_level_narrative"))
	setActive(var_8_19, false)
	setActive(var_8_20, false)
	setActive(var_8_21, false)

	local var_8_22
	local var_8_23

	if arg_8_2:getConfig("chapter_tag") == 1 then
		var_8_22 = var_8_21
	end

	if arg_8_2.active then
		var_8_22 = arg_8_2:existOni() and var_8_20 or var_8_19
	end

	if var_8_22 then
		setActive(var_8_22, true)

		local var_8_24 = GetOrAddComponent(var_8_22, "CanvasGroup")

		var_8_24.alpha = 1

		arg_8_0:RecordTween("fighting" .. arg_8_2.id, LeanTween.alphaCanvas(var_8_24, 0, 0.5):setFrom(1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong().uniqueId)
	end

	local var_8_25 = findTF(var_8_1, "triesLimit")
	local var_8_26 = arg_8_2:isTriesLimit()

	setActive(var_8_25, var_8_26)

	if var_8_26 then
		local var_8_27 = arg_8_2:getConfig("count")
		local var_8_28 = var_8_27 - arg_8_2:getTodayDefeatCount() .. "/" .. var_8_27

		setText(var_8_25:Find("label"), i18n("levelScene_chapter_count_tip"))
		setText(var_8_25:Find("Text"), setColorStr(var_8_28, var_8_27 <= arg_8_2:getTodayDefeatCount() and COLOR_RED or COLOR_GREEN))

		local var_8_29 = getProxy(ChapterProxy):IsActivitySPChapterActive() and SettingsProxy.IsShowActivityMapSPTip()

		setActive(var_8_25:Find("TipRect"), var_8_29)
	end

	local var_8_30 = arg_8_2:GetDailyBonusQuota()
	local var_8_31 = findTF(var_8_1, "mark")

	setActive(var_8_31:Find("bonus"), var_8_30)
	setActive(var_8_31, var_8_30)

	if var_8_30 then
		local var_8_32 = var_8_31:GetComponent(typeof(CanvasGroup))
		local var_8_33 = arg_8_0.contextData.map:getConfig("type") == Map.ACTIVITY_HARD and "bonus_us_hard" or "bonus_us"

		arg_8_0.sceneParent.loader:GetSprite("ui/levelmainscene_atlas", var_8_33, var_8_31:Find("bonus"))
		LeanTween.cancel(go(var_8_31), true)

		local var_8_34 = var_8_31.anchoredPosition.y

		var_8_32.alpha = 0

		LeanTween.value(go(var_8_31), 0, 1, 0.2):setOnUpdate(System.Action_float(function(arg_9_0)
			var_8_32.alpha = arg_9_0

			local var_9_0 = var_8_31.anchoredPosition

			var_9_0.y = var_8_34 * arg_9_0
			var_8_31.anchoredPosition = var_9_0
		end)):setOnComplete(System.Action(function()
			var_8_32.alpha = 1

			local var_10_0 = var_8_31.anchoredPosition

			var_10_0.y = var_8_34
			var_8_31.anchoredPosition = var_10_0
		end)):setEase(LeanTweenType.easeOutSine):setDelay(0.7)
	end

	local var_8_35 = arg_8_2.id

	onButton(arg_8_0, var_8_1, function()
		arg_8_0:TryOpenChapterInfo(var_8_35, nil, var_8_4.list)
	end, SFX_UI_WEIGHANCHOR_SELECT)
end

return var_0_0
