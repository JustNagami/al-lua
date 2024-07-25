local var_0_0 = class("MapBuilderShinano", import(".MapBuilderPermanent"))

function var_0_0.Ctor(arg_1_0, ...)
	var_0_0.super.Ctor(arg_1_0, ...)

	arg_1_0.chapterTFsById = {}
	arg_1_0.chaptersInBackAnimating = {}
end

function var_0_0.GetType(arg_2_0)
	return MapBuilder.TYPESHINANO
end

function var_0_0.getUIName(arg_3_0)
	return "Shinano_levels"
end

function var_0_0.OnInit(arg_4_0)
	arg_4_0.tpl = arg_4_0._tf:Find("level_tpl")

	setActive(arg_4_0.tpl, false)

	arg_4_0.itemHolder = arg_4_0._tf:Find("items")

	local var_4_0 = arg_4_0._tf:Find("preloadResources"):GetComponent(typeof(ItemList))
	local var_4_1 = Instantiate(var_4_0.prefabItem[0])

	setAnchoredPosition(arg_4_0._tf:Find("rumeng"), tf(var_4_1).anchoredPosition)
	setParent(var_4_1, arg_4_0._tf:Find("rumeng"))
	setAnchoredPosition(var_4_1, Vector2.zero)
	arg_4_0:InitTransformMapBtn(arg_4_0._tf:Find("rumeng"), 1, var_4_0.prefabItem[1])

	local var_4_2 = Instantiate(var_4_0.prefabItem[2])

	setAnchoredPosition(arg_4_0._tf:Find("huigui"), tf(var_4_2).anchoredPosition)
	setParent(var_4_2, arg_4_0._tf:Find("huigui"))
	setAnchoredPosition(var_4_2, Vector2.zero)
	arg_4_0:InitTransformMapBtn(arg_4_0._tf:Find("huigui"), -1, var_4_0.prefabItem[3])
end

function var_0_0.OnShow(arg_5_0)
	var_0_0.super.OnShow(arg_5_0)
	setActive(arg_5_0.sceneParent.mainLayer:Find("title_chapter_lines"), true)
	setActive(arg_5_0.sceneParent.topChapter:Find("title_chapter"), true)
	setActive(arg_5_0.sceneParent.topChapter:Find("type_skirmish"), true)
end

function var_0_0.OnHide(arg_6_0)
	setActive(arg_6_0.sceneParent.mainLayer:Find("title_chapter_lines"), false)
	setActive(arg_6_0.sceneParent.topChapter:Find("title_chapter"), false)
	setActive(arg_6_0.sceneParent.topChapter:Find("type_skirmish"), false)
	table.clear(arg_6_0.chaptersInBackAnimating)

	for iter_6_0, iter_6_1 in pairs(arg_6_0.chapterTFsById) do
		local var_6_0 = findTF(iter_6_1, "main/info/bk")

		LeanTween.cancel(rtf(var_6_0))
	end

	var_0_0.super.OnHide(arg_6_0)
end

function var_0_0.TrySwitchNextMap(arg_7_0, arg_7_1)
	local var_7_0 = arg_7_0.contextData.mapIdx + arg_7_1
	local var_7_1 = getProxy(ChapterProxy):getMapById(var_7_0)

	if not var_7_1 then
		return
	end

	if var_7_1:getMapType() == Map.ELITE and not var_7_1:isEliteEnabled() then
		pg.TipsMgr.GetInstance():ShowTips(i18n("elite_disable_unusable"))

		return
	end

	local var_7_2, var_7_3 = var_7_1:isUnlock()

	if not var_7_2 then
		pg.TipsMgr.GetInstance():ShowTips(var_7_3)

		return
	end

	return true
end

function var_0_0.InitTransformMapBtn(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	onButton(arg_8_0, arg_8_1, function()
		if arg_8_0:isfrozen() then
			return
		end

		local var_9_0

		seriesAsync({
			function(arg_10_0)
				if not arg_8_0:TrySwitchNextMap(arg_8_2) then
					return
				end

				pg.CriMgr.GetInstance():StopBGM()
				pg.CriMgr.GetInstance():PlaySE_V3("ui-qiehuan")

				var_9_0 = arg_8_0._tf:Find(arg_8_3.name .. "(Clone)") or Instantiate(arg_8_3)

				setParent(var_9_0, arg_8_0._tf)
				setAnchoredPosition(var_9_0, rtf(arg_8_1).anchoredPosition)

				local var_10_0 = arg_8_0.contextData.mapIdx + arg_8_2
				local var_10_1 = Map.bindConfigTable(Map)[var_10_0]

				if var_10_1 and #var_10_1.bg > 0 then
					GetSpriteFromAtlasAsync("levelmap/" .. var_10_1.bg, "", function(arg_11_0)
						return
					end)
				end

				arg_8_0.sceneParent:frozen()
				LeanTween.delayedCall(go(arg_8_1), 2.3, System.Action(arg_10_0))
			end,
			function(arg_12_0)
				arg_8_0.sceneParent:setMap(arg_8_0.contextData.mapIdx + arg_8_2)
				LeanTween.delayedCall(go(arg_8_1), 0.5, System.Action(arg_12_0))
			end,
			function(arg_13_0)
				if not IsNil(var_9_0) then
					Destroy(var_9_0)
				end

				arg_8_0.sceneParent:unfrozen()
			end
		})
	end)
end

function var_0_0.UpdateView(arg_14_0)
	local var_14_0 = string.split(arg_14_0.contextData.map:getConfig("name"), "||")

	setText(arg_14_0.sceneParent.chapterName, var_14_0[1])

	local var_14_1 = arg_14_0.contextData.map:getMapTitleNumber()

	arg_14_0.sceneParent.loader:GetSpriteQuiet("chapterno", "chapter" .. var_14_1, arg_14_0.sceneParent.chapterNoTitle, true)
	var_0_0.super.UpdateView(arg_14_0)
end

function var_0_0.UpdateButtons(arg_15_0)
	var_0_0.super.UpdateButtons(arg_15_0)

	local var_15_0 = arg_15_0.contextData.map
	local var_15_1 = var_15_0:getConfig("type") == Map.ACT_EXTRA
	local var_15_2 = arg_15_0._tf:Find("rumeng")
	local var_15_3 = arg_15_0._tf:Find("huigui")

	setActive(var_15_2, false)
	setActive(var_15_3, false)

	if not var_15_1 then
		setActive(arg_15_0.sceneParent.btnPrev, false)
		setActive(arg_15_0.sceneParent.btnNext, false)

		local var_15_4 = getProxy(ChapterProxy):getMapById(var_15_0.id + 1)
		local var_15_5 = getProxy(ChapterProxy):getMapById(var_15_0.id - 1)

		setActive(var_15_2, var_15_4)
		setActive(var_15_3, var_15_5)
		LeanTween.cancel(go(var_15_2), true)
		LeanTween.cancel(go(var_15_3), true)

		if var_15_4 then
			local var_15_6 = tf(var_15_2).localScale
			local var_15_7 = tf(var_15_2):GetChild(0):Find("Quad"):GetComponent(typeof(MeshRenderer)).sharedMaterial
			local var_15_8 = var_15_7:GetColor("_MainColor")
			local var_15_9 = Clone(var_15_8)
			local var_15_10 = LeanTween.value(go(var_15_2), 0, 1, 0.8):setOnUpdate(System.Action_float(function(arg_16_0)
				var_15_9.a = var_15_8.a * arg_16_0

				var_15_7:SetColor("_MainColor", var_15_9)
			end)):setEase(LeanTweenType.easeInCubic):setOnComplete(System.Action(function()
				var_15_7:SetColor("_MainColor", var_15_8)
			end))

			arg_15_0:RecordTween("rumengAlphaTween", var_15_10.id)
		elseif var_15_5 then
			local var_15_11 = tf(var_15_3).localScale
			local var_15_12 = tf(var_15_3):GetChild(0):Find("Quad"):GetComponent(typeof(MeshRenderer)).sharedMaterial
			local var_15_13 = var_15_12:GetColor("_MainColor")
			local var_15_14 = Clone(var_15_13)
			local var_15_15 = LeanTween.value(go(var_15_3), 0, 1, 0.8):setOnUpdate(System.Action_float(function(arg_18_0)
				var_15_14.a = var_15_13.a * arg_18_0

				var_15_12:SetColor("_MainColor", var_15_14)
			end)):setEase(LeanTweenType.easeInCubic):setOnComplete(System.Action(function()
				var_15_12:SetColor("_MainColor", var_15_13)
			end))

			arg_15_0:RecordTween("huiguiAlphaTween", var_15_15.id)
		end
	end
end

function var_0_0.UpdateMapItems(arg_20_0)
	var_0_0.super.UpdateMapItems(arg_20_0)

	local var_20_0 = arg_20_0.data
	local var_20_1 = getProxy(ChapterProxy)

	table.clear(arg_20_0.chapterTFsById)

	local var_20_2 = {}

	for iter_20_0, iter_20_1 in pairs(var_20_0:getChapters()) do
		if (iter_20_1:isUnlock() or iter_20_1:activeAlways()) and (not iter_20_1:ifNeedHide() or var_20_1:GetJustClearChapters(iter_20_1.id)) then
			table.insert(var_20_2, iter_20_1)
		end
	end

	UIItemList.StaticAlign(arg_20_0.itemHolder, arg_20_0.tpl, #var_20_2, function(arg_21_0, arg_21_1, arg_21_2)
		if arg_21_0 == UIItemList.EventUpdate then
			local var_21_0 = var_20_2[arg_21_1 + 1]

			arg_20_0:UpdateMapItem(arg_21_2, var_21_0)

			arg_21_2.name = "Chapter_" .. var_21_0.id
			arg_20_0.chapterTFsById[var_21_0.id] = arg_21_2
		end
	end)

	local var_20_3 = {}

	for iter_20_2, iter_20_3 in pairs(var_20_2) do
		local var_20_4 = iter_20_3:getConfigTable()

		var_20_3[var_20_4.pos_x] = var_20_3[var_20_4.pos_x] or {}

		local var_20_5 = var_20_3[var_20_4.pos_x]

		var_20_5[var_20_4.pos_y] = var_20_5[var_20_4.pos_y] or {}

		local var_20_6 = var_20_5[var_20_4.pos_y]

		table.insert(var_20_6, iter_20_3)
	end

	for iter_20_4, iter_20_5 in pairs(var_20_3) do
		for iter_20_6, iter_20_7 in pairs(iter_20_5) do
			local var_20_7 = {}

			seriesAsync({
				function(arg_22_0)
					local var_22_0 = 0

					for iter_22_0, iter_22_1 in pairs(iter_20_7) do
						if iter_22_1:ifNeedHide() and var_20_1:GetJustClearChapters(iter_22_1.id) and arg_20_0.chapterTFsById[iter_22_1.id] then
							var_22_0 = var_22_0 + 1

							local var_22_1 = arg_20_0.chapterTFsById[iter_22_1.id]

							setActive(var_22_1, true)
							arg_20_0:PlayChapterItemAnimationBackward(var_22_1, iter_22_1, function()
								var_22_0 = var_22_0 - 1

								setActive(var_22_1, false)
								var_20_1:RecordJustClearChapters(iter_22_1.id, nil)

								if var_22_0 <= 0 then
									arg_22_0()
								end
							end)

							var_20_7[iter_22_1.id] = true
						elseif arg_20_0.chapterTFsById[iter_22_1.id] then
							setActive(arg_20_0.chapterTFsById[iter_22_1.id], false)
						end
					end

					if var_22_0 <= 0 then
						arg_22_0()
					end
				end,
				function(arg_24_0)
					local var_24_0 = 0

					for iter_24_0, iter_24_1 in pairs(iter_20_7) do
						if not var_20_7[iter_24_1.id] then
							var_24_0 = var_24_0 + 1

							setActive(arg_20_0.chapterTFsById[iter_24_1.id], true)
							arg_20_0:PlayChapterItemAnimation(arg_20_0.chapterTFsById[iter_24_1.id], iter_24_1, function()
								var_24_0 = var_24_0 - 1

								if var_24_0 <= 0 then
									arg_24_0()
								end
							end)
						end
					end
				end
			})
		end
	end
end

function var_0_0.UpdateMapItem(arg_26_0, arg_26_1, arg_26_2)
	local var_26_0 = arg_26_2:getConfigTable()

	setAnchoredPosition(arg_26_1, {
		x = arg_26_0.mapWidth * var_26_0.pos_x,
		y = arg_26_0.mapHeight * var_26_0.pos_y
	})

	local var_26_1 = findTF(arg_26_1, "main")

	setActive(var_26_1, true)

	local var_26_2 = findTF(var_26_1, "info/bk/fordark")

	setActive(var_26_2, var_26_0.icon_outline == 1)

	local var_26_3 = findTF(var_26_1, "circle/clear_flag")
	local var_26_4 = findTF(var_26_1, "circle/lock")
	local var_26_5 = not arg_26_2.active and not arg_26_2:isUnlock()
	local var_26_6 = findTF(var_26_1, "circle/progress")
	local var_26_7 = findTF(var_26_1, "circle/progress_text")
	local var_26_8 = findTF(var_26_1, "circle/stars")
	local var_26_9 = string.split(var_26_0.name, "|")
	local var_26_10 = var_26_5 and "#737373" or "#FFFFFF"

	setText(findTF(var_26_1, "info/bk/title_form/title_index"), setColorStr(var_26_0.chapter_name .. "  ", var_26_10))
	setText(findTF(var_26_1, "info/bk/title_form/title"), setColorStr(var_26_9[1], var_26_10))
	setText(findTF(var_26_1, "info/bk/title_form/title_en"), setColorStr(var_26_9[2] or "", var_26_10))
	setFillAmount(var_26_6, arg_26_2.progress / 100)
	setText(var_26_7, string.format("%d%%", arg_26_2.progress))
	setActive(var_26_8, arg_26_2:existAchieve())

	if arg_26_2:existAchieve() then
		for iter_26_0, iter_26_1 in ipairs(arg_26_2.achieves) do
			local var_26_11 = ChapterConst.IsAchieved(iter_26_1)
			local var_26_12 = var_26_8:Find("star" .. iter_26_0 .. "/light")

			setActive(var_26_12, var_26_11)
		end
	end

	local var_26_13 = not arg_26_2.active and arg_26_2:isClear()

	setActive(var_26_3, var_26_13)
	setActive(var_26_4, var_26_5)
	setActive(var_26_7, not var_26_13 and not var_26_5)
	arg_26_0:DeleteTween("fighting" .. arg_26_2.id)

	local var_26_14 = findTF(var_26_1, "circle/fighting")

	setText(findTF(var_26_14, "Text"), i18n("tag_level_fighting"))

	local var_26_15 = findTF(var_26_1, "circle/oni")

	setText(findTF(var_26_15, "Text"), i18n("tag_level_oni"))

	local var_26_16 = findTF(var_26_1, "circle/narrative")

	setText(findTF(var_26_16, "Text"), i18n("tag_level_narrative"))
	setActive(var_26_14, false)
	setActive(var_26_15, false)
	setActive(var_26_16, false)

	local var_26_17
	local var_26_18

	if arg_26_2:getConfig("chapter_tag") == 1 then
		var_26_17 = var_26_16
	end

	if arg_26_2.active then
		var_26_17 = arg_26_2:existOni() and var_26_15 or var_26_14
	end

	if var_26_17 then
		setActive(var_26_17, true)

		local var_26_19 = GetOrAddComponent(var_26_17, "CanvasGroup")

		var_26_19.alpha = 1

		arg_26_0:RecordTween("fighting" .. arg_26_2.id, LeanTween.alphaCanvas(var_26_19, 0, 0.5):setFrom(1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong().uniqueId)
	end

	local var_26_20 = findTF(var_26_1, "triesLimit")

	setActive(var_26_20, false)

	if arg_26_2:isTriesLimit() then
		local var_26_21 = arg_26_2:getConfig("count")
		local var_26_22 = var_26_21 - arg_26_2:getTodayDefeatCount() .. "/" .. var_26_21

		setText(var_26_20:Find("label"), i18n("levelScene_chapter_count_tip"))
		setText(var_26_20:Find("Text"), setColorStr(var_26_22, var_26_21 <= arg_26_2:getTodayDefeatCount() and COLOR_RED or COLOR_GREEN))
	end

	local var_26_23 = arg_26_2:GetDailyBonusQuota()
	local var_26_24 = findTF(var_26_1, "mark")

	setActive(var_26_24:Find("bonus"), var_26_23)
	setActive(var_26_24, var_26_23)

	if var_26_23 then
		local var_26_25 = var_26_24:GetComponent(typeof(CanvasGroup))
		local var_26_26 = arg_26_0.contextData.map:getConfig("type") == Map.ACTIVITY_HARD and "bonus_us_hard" or "bonus_us"

		arg_26_0.sceneParent.loader:GetSprite("ui/levelmainscene_atlas", var_26_26, var_26_24:Find("bonus"))
		LeanTween.cancel(go(var_26_24), true)

		local var_26_27 = var_26_24.anchoredPosition.y

		var_26_25.alpha = 0

		LeanTween.value(go(var_26_24), 0, 1, 0.2):setOnUpdate(System.Action_float(function(arg_27_0)
			var_26_25.alpha = arg_27_0

			local var_27_0 = var_26_24.anchoredPosition

			var_27_0.y = var_26_27 * arg_27_0
			var_26_24.anchoredPosition = var_27_0
		end)):setOnComplete(System.Action(function()
			var_26_25.alpha = 1

			local var_28_0 = var_26_24.anchoredPosition

			var_28_0.y = var_26_27
			var_26_24.anchoredPosition = var_28_0
		end)):setEase(LeanTweenType.easeOutSine):setDelay(0.7)
	end

	local var_26_28 = arg_26_2.id

	onButton(arg_26_0, var_26_1, function()
		if arg_26_0.chaptersInBackAnimating[var_26_28] then
			return
		end

		local var_29_0 = arg_26_1.localPosition

		arg_26_0:TryOpenChapterInfo(var_26_28, Vector3(var_29_0.x - 10, var_29_0.y + 150))
	end, SFX_UI_WEIGHANCHOR_SELECT)
end

function var_0_0.PlayChapterItemAnimation(arg_30_0, arg_30_1, arg_30_2, arg_30_3)
	local var_30_0 = findTF(arg_30_1, "main")
	local var_30_1 = var_30_0:Find("info")
	local var_30_2 = findTF(var_30_0, "circle")
	local var_30_3 = findTF(var_30_0, "info/bk")

	LeanTween.cancel(go(var_30_2))

	var_30_2.localScale = Vector3.zero

	local var_30_4 = LeanTween.scale(var_30_2, Vector3.one, 0.3):setDelay(0.3)

	arg_30_0:RecordTween(var_30_4.uniqueId)
	LeanTween.cancel(go(var_30_3))
	setAnchoredPosition(var_30_3, {
		x = -1 * var_30_1.rect.width
	})
	shiftPanel(var_30_3, 0, nil, 0.4, 0.4, true, true, nil, function()
		if arg_30_2:isTriesLimit() then
			setActive(findTF(var_30_0, "triesLimit"), true)
		end

		if arg_30_3 then
			arg_30_3()
		end
	end)
end

function var_0_0.PlayChapterItemAnimationBackward(arg_32_0, arg_32_1, arg_32_2, arg_32_3)
	local var_32_0 = findTF(arg_32_1, "main")
	local var_32_1 = var_32_0:Find("info")
	local var_32_2 = findTF(var_32_0, "circle")
	local var_32_3 = findTF(var_32_0, "info/bk")

	LeanTween.cancel(go(var_32_2))

	var_32_2.localScale = Vector3.one

	local var_32_4 = LeanTween.scale(go(var_32_2), Vector3.zero, 0.3):setDelay(0.3)

	arg_32_0:RecordTween(var_32_4.uniqueId)

	arg_32_0.chaptersInBackAnimating[arg_32_2.id] = true

	LeanTween.cancel(go(var_32_3))
	setAnchoredPosition(var_32_3, {
		x = 0
	})
	shiftPanel(var_32_3, -1 * var_32_1.rect.width, nil, 0.4, 0.4, true, true, nil, function()
		arg_32_0.chaptersInBackAnimating[arg_32_2.id] = nil

		if arg_32_3 then
			arg_32_3()
		end
	end)

	if arg_32_2:isTriesLimit() then
		setActive(findTF(var_32_0, "triesLimit"), false)
	end
end

function var_0_0.UpdateChapterTF(arg_34_0, arg_34_1)
	local var_34_0 = arg_34_0.chapterTFsById[arg_34_1]

	if var_34_0 then
		local var_34_1 = getProxy(ChapterProxy):getChapterById(arg_34_1)

		arg_34_0:UpdateMapItem(var_34_0, var_34_1)
		arg_34_0:PlayChapterItemAnimation(var_34_0, var_34_1)
	end
end

function var_0_0.TryOpenChapter(arg_35_0, arg_35_1)
	local var_35_0 = arg_35_0.chapterTFsById[arg_35_1]

	if var_35_0 then
		local var_35_1 = var_35_0:Find("main")

		triggerButton(var_35_1)
	end
end

function var_0_0.HideFloat(arg_36_0)
	setActive(arg_36_0.itemHolder, false)
end

function var_0_0.ShowFloat(arg_37_0)
	setActive(arg_37_0.itemHolder, true)
end

return var_0_0
