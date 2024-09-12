local var_0_0 = class("MapBuilderSP", import(".MapBuilder"))
local var_0_1 = import("Mgr/Pool/PoolPlural")

var_0_0.DISPLAY = {
	STORY = 2,
	BATTLE = 1
}
var_0_0.DIFFICULITY = {
	EASY = 1,
	HARD = 2
}

function var_0_0.GetType(arg_1_0)
	return MapBuilder.TYPESP
end

function var_0_0.getUIName(arg_2_0)
	return "LevelSelectSPUI"
end

function var_0_0.OnLoaded(arg_3_0)
	setParent(arg_3_0._tf, arg_3_0._parentTf)
	arg_3_0._tf:SetSiblingIndex(5)
end

function var_0_0.OnInit(arg_4_0)
	arg_4_0.battleLayer = arg_4_0._tf:Find("Battle")
	arg_4_0.storyLayer = arg_4_0._tf:Find("Story")
	arg_4_0.top = arg_4_0._tf:Find("Top")
	arg_4_0.itemHolder = arg_4_0._tf:Find("Battle/Nodes")
	arg_4_0.chapterTpl = arg_4_0.itemHolder:Find("LevelTpl")
	arg_4_0.storyHolder = arg_4_0._tf:Find("Story/Nodes")
	arg_4_0.storyContainer = arg_4_0.storyHolder:Find("Viewport/Content")
	arg_4_0.nodes = {}
	arg_4_0.progressText = arg_4_0._tf:Find("Story/Desc/Text")
	arg_4_0.storyAward = arg_4_0._tf:Find("Story/Award")
	arg_4_0.storyNodeTpl = arg_4_0._tf:Find("Story/NodeTemplate")
	arg_4_0.oneLineTpl = arg_4_0._tf:Find("Story/OneLine")
	arg_4_0.branchHeadTpl = arg_4_0._tf:Find("Story/BranchHead")
	arg_4_0.branchCenterTpl = arg_4_0._tf:Find("Story/BranchCenter")
	arg_4_0.branchUpTpl = arg_4_0._tf:Find("Story/BranchUp")
	arg_4_0.branchDownTpl = arg_4_0._tf:Find("Story/BranchDown")
	arg_4_0.unionTailTpl = arg_4_0._tf:Find("Story/UnionTail")
	arg_4_0.unionCenterTpl = arg_4_0._tf:Find("Story/UnionCenter")
	arg_4_0.unionUpTpl = arg_4_0._tf:Find("Story/UnionUp")
	arg_4_0.unionDownTpl = arg_4_0._tf:Find("Story/UnionDown")

	setActive(arg_4_0.storyNodeTpl, false)
	setActive(arg_4_0.oneLineTpl, false)
	setActive(arg_4_0.branchHeadTpl, false)
	setActive(arg_4_0.branchCenterTpl, false)
	setActive(arg_4_0.branchUpTpl, false)
	setActive(arg_4_0.branchDownTpl, false)
	setActive(arg_4_0.unionTailTpl, false)
	setActive(arg_4_0.unionCenterTpl, false)
	setActive(arg_4_0.unionUpTpl, false)
	setActive(arg_4_0.unionDownTpl, false)

	arg_4_0.pools = {
		[arg_4_0.storyNodeTpl] = var_0_1.New(go(arg_4_0.storyNodeTpl), 0),
		[arg_4_0.oneLineTpl] = var_0_1.New(go(arg_4_0.oneLineTpl), 0),
		[arg_4_0.branchHeadTpl] = var_0_1.New(go(arg_4_0.branchHeadTpl), 0),
		[arg_4_0.branchCenterTpl] = var_0_1.New(go(arg_4_0.branchCenterTpl), 0),
		[arg_4_0.branchUpTpl] = var_0_1.New(go(arg_4_0.branchUpTpl), 0),
		[arg_4_0.branchDownTpl] = var_0_1.New(go(arg_4_0.branchDownTpl), 0),
		[arg_4_0.unionTailTpl] = var_0_1.New(go(arg_4_0.unionTailTpl), 0),
		[arg_4_0.unionCenterTpl] = var_0_1.New(go(arg_4_0.unionCenterTpl), 0),
		[arg_4_0.unionUpTpl] = var_0_1.New(go(arg_4_0.unionUpTpl), 0),
		[arg_4_0.unionDownTpl] = var_0_1.New(go(arg_4_0.unionDownTpl), 0)
	}
	arg_4_0.nodeTplWidth = arg_4_0.storyNodeTpl.rect.width
	arg_4_0.oneLineWidth = arg_4_0.oneLineTpl.rect.width
	arg_4_0.oneLineHeight = arg_4_0.oneLineTpl.rect.height
	arg_4_0.branchHeadWidth = arg_4_0.branchHeadTpl.rect.width
	arg_4_0.branchUpWidth = arg_4_0.branchUpTpl.rect.width
	arg_4_0.branchUpHeight = arg_4_0.branchUpTpl.rect.height
	arg_4_0.UnionTailWidth = arg_4_0.unionTailTpl.rect.width
	arg_4_0.activeItems = {}
	arg_4_0.displayChapterIDs = {}
	arg_4_0.chapterTFsById = {}
	arg_4_0.storyNodeTFsById = {}

	arg_4_0:bind(LevelUIConst.SWITCH_SPCHAPTER_DIFFICULTY, function(arg_5_0, arg_5_1)
		arg_4_0:SwitchChapter(arg_5_1)
	end)
	onButton(arg_4_0, arg_4_0.battleLayer:Find("Story/Switch"), function()
		arg_4_0:SetDisplayMode(var_0_0.DISPLAY.STORY)

		arg_4_0.needFocusStory = true

		arg_4_0:Move2UnlockStory()
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.storyLayer:Find("Battle/Switch"), function()
		arg_4_0:SetDisplayMode(var_0_0.DISPLAY.BATTLE)
	end, SFX_PANEL)
	setText(arg_4_0.storyLayer:Find("Desc/Desc"), i18n("series_enemy_storyreward"))
end

function var_0_0.OnShow(arg_8_0)
	var_0_0.super.OnShow(arg_8_0)
	setActive(arg_8_0.sceneParent.mainLayer:Find("title_chapter_lines"), true)
	setActive(arg_8_0.sceneParent.topChapter:Find("title_chapter"), true)
	setActive(arg_8_0.sceneParent.topChapter:Find("type_chapter"), true)

	arg_8_0.needFocusStory = true
end

function var_0_0.UpdateButtons(arg_9_0)
	var_0_0.super.UpdateButtons(arg_9_0)

	local var_9_0, var_9_1 = arg_9_0.contextData.map:isActivity()
	local var_9_2 = arg_9_0.contextData.map:isRemaster()
	local var_9_3 = arg_9_0.contextData.displayMode == var_0_0.DISPLAY.BATTLE

	setActive(arg_9_0.sceneParent.actExchangeShopBtn, not ActivityConst.HIDE_PT_PANELS and var_9_3 and not var_9_2 and var_9_1 and arg_9_0.sceneParent:IsActShopActive())
	setActive(arg_9_0.sceneParent.ptTotal, not ActivityConst.HIDE_PT_PANELS and var_9_3 and not var_9_2 and var_9_1 and arg_9_0.sceneParent.ptActivity and not arg_9_0.sceneParent.ptActivity:isEnd())
end

function var_0_0.OnHide(arg_10_0)
	setActive(arg_10_0.sceneParent.mainLayer:Find("title_chapter_lines"), false)
	setActive(arg_10_0.sceneParent.topChapter:Find("title_chapter"), false)
	setActive(arg_10_0.sceneParent.topChapter:Find("type_chapter"), false)
	setActive(arg_10_0.sceneParent.ptTotal, false)
	setActive(arg_10_0.sceneParent.actExchangeShopBtn, false)
	var_0_0.super.OnHide(arg_10_0)
end

function var_0_0.UpdateMapVO(arg_11_0, arg_11_1)
	var_0_0.super.UpdateMapVO(arg_11_0, arg_11_1)

	arg_11_0.activity = getProxy(ActivityProxy):getActivityById(arg_11_1:getConfig("on_activity"))

	local var_11_0 = getProxy(PlayerProxy):getRawData().id
	local var_11_1 = arg_11_1:getConfig("chapterGroups")

	arg_11_0.chapterGroups = _.map(var_11_1, function(arg_12_0)
		local var_12_0 = arg_12_0[1]
		local var_12_1 = PlayerPrefs.GetInt("spchapter_selected_" .. var_11_0 .. "_" .. var_12_0, var_0_0.DIFFICULITY.EASY)

		return {
			list = arg_12_0,
			index = var_12_1
		}
	end)
	arg_11_0.chapterGroupDict = {}

	_.each(arg_11_0.chapterGroups, function(arg_13_0)
		_.each(arg_13_0.list, function(arg_14_0)
			arg_11_0.chapterGroupDict[arg_14_0] = arg_13_0
		end)
	end)

	arg_11_0.displayChapterIDs = _.map(arg_11_0.chapterGroups, function(arg_15_0)
		return arg_15_0.list[arg_15_0.index]
	end)

	arg_11_0:BuildStoryTree()
end

function var_0_0.BuildStoryTree(arg_16_0)
	arg_16_0.spStoryIDs = arg_16_0.data:getConfig("story_id")
	arg_16_0.spStoryNodeDict = {}
	arg_16_0.spStoryNodes = {}

	local var_16_0 = {}

	_.each(arg_16_0.spStoryIDs, function(arg_17_0)
		arg_16_0.spStoryNodeDict[arg_17_0] = ActivitySpStoryNode.New({
			configId = arg_17_0
		})

		local var_17_0 = arg_16_0.spStoryNodeDict[arg_17_0]

		var_16_0[var_17_0:GetPreEvent()] = arg_17_0
	end)

	local var_16_1 = 0

	local function var_16_2()
		if not var_16_0[var_16_1] then
			return
		end

		var_16_1 = var_16_0[var_16_1]

		table.insert(arg_16_0.spStoryNodes, arg_16_0.spStoryNodeDict[var_16_1])

		return true
	end

	while var_16_2() do
		-- block empty
	end

	local var_16_3 = {}
	local var_16_4

	_.each(arg_16_0.spStoryNodes, function(arg_19_0)
		local var_19_0 = arg_19_0:GetPreNodes()

		if #var_19_0 == 0 then
			var_16_4 = arg_19_0

			return
		end

		_.each(var_19_0, function(arg_20_0)
			var_16_3[arg_20_0] = var_16_3[arg_20_0] or {}

			table.insert(var_16_3[arg_20_0], arg_19_0)
		end)
	end)

	arg_16_0.storyTree = {
		root = var_16_4,
		childDict = var_16_3
	}
end

function var_0_0.SetDisplayMode(arg_21_0, arg_21_1)
	if arg_21_1 == arg_21_0.contextData.displayMode then
		return
	end

	arg_21_0.contextData.displayMode = arg_21_1

	arg_21_0:UpdateView()
end

function var_0_0.UpdateView(arg_22_0)
	local var_22_0 = string.split(arg_22_0.contextData.map:getConfig("name"), "||")

	setText(arg_22_0.sceneParent.chapterName, var_22_0[1])

	local var_22_1 = arg_22_0.contextData.map:getMapTitleNumber()

	arg_22_0.sceneParent.loader:GetSpriteQuiet("chapterno", "chapter" .. var_22_1, arg_22_0.sceneParent.chapterNoTitle, true)

	arg_22_0.contextData.displayMode = arg_22_0.contextData.displayMode or var_0_0.DISPLAY.BATTLE

	var_0_0.super.UpdateView(arg_22_0)

	local var_22_2 = arg_22_0.contextData.displayMode == var_0_0.DISPLAY.BATTLE

	setActive(arg_22_0._tf:Find("Battle"), var_22_2)
	setActive(arg_22_0._tf:Find("Story"), not var_22_2)

	local var_22_3 = getProxy(ChapterProxy):IsActivitySPChapterActive() and SettingsProxy.IsShowActivityMapSPTip()

	setActive(arg_22_0.battleLayer:Find("Story/BattleTip"), false)
	setActive(arg_22_0.storyLayer:Find("Battle/BattleTip"), var_22_3)
	arg_22_0:UpdateStoryTask()

	if var_22_2 then
		arg_22_0:UpdateBattle()
		arg_22_0.sceneParent:SwitchMapBG(arg_22_0.contextData.map)
		arg_22_0.sceneParent:PlayBGM()
	else
		arg_22_0:UpdateStoryNodeStatus()
		arg_22_0:UpdateStory()
		arg_22_0:Move2UnlockStory()
		arg_22_0:SwitchStoryMapAndBGM()
	end

	arg_22_0:TrySubmitTask()
end

function var_0_0.UpdateBattle(arg_23_0)
	local var_23_0 = getProxy(ChapterProxy)
	local var_23_1 = arg_23_0.displayChapterIDs
	local var_23_2 = {}

	for iter_23_0, iter_23_1 in ipairs(var_23_1) do
		local var_23_3 = var_23_0:getChapterById(iter_23_1)

		table.insert(var_23_2, var_23_3)
	end

	table.clear(arg_23_0.chapterTFsById)
	UIItemList.StaticAlign(arg_23_0.itemHolder, arg_23_0.chapterTpl, #var_23_2, function(arg_24_0, arg_24_1, arg_24_2)
		if arg_24_0 ~= UIItemList.EventUpdate then
			return
		end

		local var_24_0 = var_23_2[arg_24_1 + 1]

		arg_23_0:UpdateMapItem(arg_24_2, var_24_0)

		arg_24_2.name = "Chapter_" .. var_24_0.id
		arg_23_0.chapterTFsById[var_24_0.id] = arg_24_2
	end)
end

function var_0_0.HideFloat(arg_25_0)
	var_0_0.super.HideFloat(arg_25_0)
	setActive(arg_25_0.itemHolder, false)
end

function var_0_0.ShowFloat(arg_26_0)
	var_0_0.super.ShowFloat(arg_26_0)
	setActive(arg_26_0.itemHolder, true)
end

function var_0_0.UpdateMapItem(arg_27_0, arg_27_1, arg_27_2)
	local var_27_0 = arg_27_2:getConfigTable()

	setAnchoredPosition(arg_27_1, {
		x = arg_27_0.mapWidth * var_27_0.pos_x,
		y = arg_27_0.mapHeight * var_27_0.pos_y
	})

	local var_27_1 = findTF(arg_27_1, "main")

	setActive(var_27_1, true)

	local var_27_2 = findTF(var_27_1, "circle/fordark")
	local var_27_3 = findTF(var_27_1, "info/bk/fordark")

	setActive(var_27_2, var_27_0.icon_outline == 1)
	setActive(var_27_3, var_27_0.icon_outline == 1)

	local var_27_4 = arg_27_0.chapterGroupDict[arg_27_2.id]

	assert(var_27_4)

	local var_27_5 = {
		"Lock",
		"Normal",
		"Hard"
	}
	local var_27_6 = 1

	if arg_27_2:isUnlock() then
		var_27_6 = 2

		if #var_27_4.list > 1 then
			var_27_6 = table.indexof(var_27_4.list, arg_27_2.id) + 1
		elseif arg_27_2:IsSpChapter() or arg_27_2:IsEXChapter() then
			var_27_6 = 3
		end
	end

	local var_27_7 = findTF(var_27_1, "circle/bk")

	for iter_27_0, iter_27_1 in ipairs(var_27_5) do
		setActive(var_27_7:Find(iter_27_1), iter_27_0 == var_27_6)
	end

	local var_27_8 = findTF(var_27_1, "circle/clear_flag")
	local var_27_9 = findTF(var_27_1, "circle/lock")
	local var_27_10 = findTF(var_27_1, "circle/progress")
	local var_27_11 = findTF(var_27_1, "circle/progress_text")
	local var_27_12 = findTF(var_27_1, "circle/stars")
	local var_27_13 = string.split(var_27_0.name, "|")

	setText(findTF(var_27_1, "info/bk/title_form/title_index"), var_27_0.chapter_name .. "  ")
	setText(findTF(var_27_1, "info/bk/title_form/title"), var_27_13[1])
	setText(findTF(var_27_1, "info/bk/title_form/title_en"), var_27_13[2] or "")
	setFillAmount(var_27_10, arg_27_2.progress / 100)
	setText(var_27_11, string.format("%d%%", arg_27_2.progress))
	setActive(var_27_12, arg_27_2:existAchieve())

	if arg_27_2:existAchieve() then
		for iter_27_2, iter_27_3 in ipairs(arg_27_2.achieves) do
			local var_27_14 = ChapterConst.IsAchieved(iter_27_3)
			local var_27_15 = var_27_12:GetChild(iter_27_2 - 1):Find("light")

			setActive(var_27_15, var_27_14)

			for iter_27_4, iter_27_5 in ipairs(var_27_5) do
				if iter_27_5 ~= "Lock" then
					setActive(var_27_15:Find(iter_27_5), iter_27_4 == var_27_6)
				end
			end
		end
	end

	local var_27_16 = findTF(var_27_1, "info/bk/BG")

	for iter_27_6, iter_27_7 in ipairs(var_27_5) do
		setActive(var_27_16:Find(iter_27_7), iter_27_6 == var_27_6)
	end

	setActive(findTF(var_27_1, "HardEffect"), var_27_6 == 3)

	local var_27_17 = not arg_27_2.active and arg_27_2:isClear()
	local var_27_18 = not arg_27_2.active and not arg_27_2:isUnlock()

	setActive(var_27_8, var_27_17)
	setActive(var_27_9, var_27_18)
	setActive(var_27_11, not var_27_17 and not var_27_18)
	arg_27_0:DeleteTween("fighting" .. arg_27_2.id)

	local var_27_19 = findTF(var_27_1, "circle/fighting")

	setText(findTF(var_27_19, "Text"), i18n("tag_level_fighting"))

	local var_27_20 = findTF(var_27_1, "circle/oni")

	setText(findTF(var_27_20, "Text"), i18n("tag_level_oni"))

	local var_27_21 = findTF(var_27_1, "circle/narrative")

	setText(findTF(var_27_21, "Text"), i18n("tag_level_narrative"))
	setActive(var_27_19, false)
	setActive(var_27_20, false)
	setActive(var_27_21, false)

	local var_27_22
	local var_27_23

	if arg_27_2:getConfig("chapter_tag") == 1 then
		var_27_22 = var_27_21
	end

	if arg_27_2.active then
		var_27_22 = arg_27_2:existOni() and var_27_20 or var_27_19
	end

	if var_27_22 then
		setActive(var_27_22, true)

		local var_27_24 = GetOrAddComponent(var_27_22, "CanvasGroup")

		var_27_24.alpha = 1

		arg_27_0:RecordTween("fighting" .. arg_27_2.id, LeanTween.alphaCanvas(var_27_24, 0, 0.5):setFrom(1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong().uniqueId)
	end

	local var_27_25 = findTF(var_27_1, "triesLimit")
	local var_27_26 = arg_27_2:isTriesLimit()

	setActive(var_27_25, var_27_26)

	if var_27_26 then
		local var_27_27 = arg_27_2:getConfig("count")
		local var_27_28 = var_27_27 - arg_27_2:getTodayDefeatCount() .. "/" .. var_27_27

		setText(var_27_25:Find("label"), i18n("levelScene_chapter_count_tip"))
		setText(var_27_25:Find("Text"), setColorStr(var_27_28, var_27_27 <= arg_27_2:getTodayDefeatCount() and COLOR_RED or COLOR_GREEN))

		local var_27_29 = getProxy(ChapterProxy):IsActivitySPChapterActive() and SettingsProxy.IsShowActivityMapSPTip()

		setActive(var_27_25:Find("TipRect"), var_27_29)
	end

	local var_27_30 = arg_27_2:GetDailyBonusQuota()
	local var_27_31 = findTF(var_27_1, "mark")

	setActive(var_27_31:Find("bonus"), var_27_30)
	setActive(var_27_31, var_27_30)

	if var_27_30 then
		local var_27_32 = var_27_31:GetComponent(typeof(CanvasGroup))
		local var_27_33 = arg_27_0.contextData.map:getConfig("type") == Map.ACTIVITY_HARD and "bonus_us_hard" or "bonus_us"

		arg_27_0.sceneParent.loader:GetSprite("ui/levelmainscene_atlas", var_27_33, var_27_31:Find("bonus"))
		LeanTween.cancel(go(var_27_31), true)

		local var_27_34 = var_27_31.anchoredPosition.y

		var_27_32.alpha = 0

		LeanTween.value(go(var_27_31), 0, 1, 0.2):setOnUpdate(System.Action_float(function(arg_28_0)
			var_27_32.alpha = arg_28_0

			local var_28_0 = var_27_31.anchoredPosition

			var_28_0.y = var_27_34 * arg_28_0
			var_27_31.anchoredPosition = var_28_0
		end)):setOnComplete(System.Action(function()
			var_27_32.alpha = 1

			local var_29_0 = var_27_31.anchoredPosition

			var_29_0.y = var_27_34
			var_27_31.anchoredPosition = var_29_0
		end)):setEase(LeanTweenType.easeOutSine):setDelay(0.7)
	end

	local var_27_35 = arg_27_2.id

	onButton(arg_27_0, var_27_1, function()
		arg_27_0:TryOpenChapterInfo(var_27_35, nil, var_27_4.list)
	end, SFX_UI_WEIGHANCHOR_SELECT)
end

function var_0_0.SwitchChapter(arg_31_0, arg_31_1)
	local var_31_0 = arg_31_0.chapterGroupDict[arg_31_1]

	if not var_31_0 then
		return
	end

	local var_31_1 = var_31_0.list[var_31_0.index]

	if var_31_1 == arg_31_1 then
		return
	end

	local var_31_2 = table.indexof(var_31_0.list, arg_31_1)

	var_31_0.index = var_31_2

	local var_31_3 = var_31_0.list[1]
	local var_31_4 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt("spchapter_selected_" .. var_31_4 .. "_" .. var_31_3, var_31_2)

	local var_31_5 = arg_31_0.chapterTFsById[var_31_1]

	arg_31_0.chapterTFsById[var_31_1] = nil
	arg_31_0.chapterTFsById[arg_31_1] = var_31_5

	arg_31_0:UpdateChapterTF(arg_31_1)
end

function var_0_0.UpdateChapterTF(arg_32_0, arg_32_1)
	if not arg_32_0.chapterGroupDict[arg_32_1] then
		return
	end

	local var_32_0 = arg_32_0.chapterTFsById[arg_32_1]

	if var_32_0 then
		local var_32_1 = getProxy(ChapterProxy):getChapterById(arg_32_1)

		arg_32_0:UpdateMapItem(var_32_0, var_32_1)
	end
end

function var_0_0.RecyclePools(arg_33_0)
	for iter_33_0 = #arg_33_0.activeItems, 1, -1 do
		local var_33_0 = arg_33_0.activeItems[iter_33_0]
		local var_33_1 = arg_33_0.pools[var_33_0.template]

		if var_33_0.template == arg_33_0.oneLineTpl then
			setSizeDelta(var_33_0.active, {
				x = arg_33_0.oneLineWidth,
				y = arg_33_0.oneLineHeight
			})
		end

		var_33_1:Enqueue(var_33_0.active)
	end

	table.clean(arg_33_0.activeItems)

	arg_33_0.storyNodeTFsById = {}
end

local var_0_2 = 1
local var_0_3 = 2
local var_0_4 = 3

function var_0_0.UpdateStoryNodeStatus(arg_34_0)
	local var_34_0 = 0
	local var_34_1 = 0
	local var_34_2 = pg.NewStoryMgr.GetInstance()
	local var_34_3 = {}

	table.Foreach(arg_34_0.spStoryIDs, function(arg_35_0, arg_35_1)
		var_34_3[arg_35_1] = {}
	end)

	local var_34_4 = arg_34_0.spStoryNodes

	for iter_34_0 = 1, #var_34_4 do
		local var_34_5 = var_34_4[iter_34_0]
		local var_34_6 = var_34_5:GetConfigID()
		local var_34_7 = var_34_5:GetPreEvent()
		local var_34_8 = false
		local var_34_9 = var_34_7 == 0 and true or var_34_3[var_34_7].status == var_0_4
		local var_34_10 = var_0_2
		local var_34_11 = var_34_5:GetStoryName()
		local var_34_12 = false

		if var_34_11 and var_34_11 ~= "" then
			var_34_12 = var_34_2:IsPlayed(var_34_11)
			var_34_0 = var_34_0 + (var_34_12 and 1 or 0)
			var_34_1 = var_34_1 + 1
		end

		if not var_34_12 and var_34_9 then
			_.each(var_34_5:GetUnlockConditions(), function(arg_36_0)
				if arg_36_0[1] == ActivitySpStoryNode.CONDITION.TIME then
					local var_36_0 = pg.TimeMgr.GetInstance():parseTimeFromConfig(arg_36_0[2])
					local var_36_1 = pg.TimeMgr.GetInstance():GetServerTime()

					var_34_9 = var_34_9 and var_36_0 <= var_36_1
				elseif arg_36_0[1] == ActivitySpStoryNode.CONDITION.PASSCHAPTER then
					local var_36_2 = arg_36_0[2]

					var_34_9 = var_34_9 and _.all(var_36_2, function(arg_37_0)
						return getProxy(ChapterProxy):getChapterById(arg_37_0, true):isClear()
					end)
				elseif arg_36_0[1] == ActivitySpStoryNode.CONDITION.PT then
					local var_36_3 = arg_36_0[2][1]
					local var_36_4 = arg_36_0[2][2]
					local var_36_5 = arg_36_0[2][3]
					local var_36_6 = 0

					if var_36_3 == DROP_TYPE_RESOURCE then
						var_36_6 = getProxy(PlayerProxy):getRawData():getResource(arg_36_0[2])
					elseif var_36_3 == DROP_TYPE_ITEM then
						var_36_6 = getProxy(BagProxy):getItemCountById(var_36_4)
					end

					var_34_9 = var_34_9 and var_36_5 <= var_36_6
				end
			end)
		end

		if var_34_12 then
			var_34_10 = var_0_4
		elseif var_34_9 then
			var_34_10 = var_0_3
		end

		var_34_3[var_34_6].status = var_34_10
	end

	arg_34_0.storyNodeStatus = var_34_3
	arg_34_0.storyReadCount, arg_34_0.storyReadMax = var_34_0, var_34_1
end

function var_0_0.UpdateStory(arg_38_0)
	arg_38_0:RecyclePools()

	local var_38_0 = {
		"162443",
		"ffffff",
		"ffcb5a"
	}
	local var_38_1 = arg_38_0.data:getConfig("story_inactive_color")

	if var_38_1 and #var_38_1 > 0 then
		var_38_0[1] = var_38_1
	end

	local var_38_2 = 0
	local var_38_3 = 150
	local var_38_4 = 150
	local var_38_5 = {
		{
			node = arg_38_0.storyTree.root,
			nodePos = Vector2.New(var_38_3, 0)
		}
	}
	local var_38_6 = arg_38_0.nodeTplWidth
	local var_38_7 = arg_38_0.oneLineWidth
	local var_38_8 = arg_38_0.branchHeadWidth
	local var_38_9 = arg_38_0.branchUpWidth
	local var_38_10 = arg_38_0.branchUpHeight
	local var_38_11 = arg_38_0.UnionTailWidth
	local var_38_12 = 75
	local var_38_13 = 82
	local var_38_14 = 32

	local function var_38_15()
		local var_39_0 = table.remove(var_38_5, 1)
		local var_39_1 = var_39_0.node:GetConfigID()

		;(function()
			local var_40_0 = arg_38_0:DequeItem(arg_38_0.storyNodeTpl)

			var_40_0.name = var_39_1

			setAnchoredPosition(var_40_0, var_39_0.nodePos)

			arg_38_0.storyNodeTFsById[var_39_1] = {
				nodeTF = tf(var_40_0)
			}
		end)()

		local var_39_2 = arg_38_0.storyTree.childDict[var_39_1] or {}

		if #var_39_2 == 0 then
			var_38_2 = var_39_0.nodePos.x + var_38_6 + var_38_4
		elseif #var_39_2 == 1 then
			local var_39_3 = var_39_2[1]
			local var_39_4 = var_39_3:GetConfigID()
			local var_39_5 = arg_38_0:DequeItem(arg_38_0.oneLineTpl)

			var_39_5.name = string.format("Line%s_%s", var_39_1, var_39_4)

			setAnchoredPosition(var_39_5, var_39_0.nodePos + Vector2.New(var_38_6 + var_38_14, 0))

			nextPos = tf(var_39_5).anchoredPosition + Vector2.New(var_38_7 + var_38_12, 0)

			local var_39_6 = arg_38_0.storyNodeStatus[var_39_4].status

			eachChild(var_39_5, function(arg_41_0)
				setImageColor(arg_41_0, Color.NewHex(var_38_0[var_39_6]))
			end)
			table.insert(var_38_5, {
				node = var_39_3,
				nodePos = nextPos
			})
		elseif #var_39_2 > 1 then
			local var_39_7 = {}
			local var_39_8

			table.Ipairs(var_39_2, function(arg_42_0, arg_42_1)
				local var_42_0 = 0
				local var_42_1 = arg_42_1

				local function var_42_2()
					var_42_0 = var_42_0 + 1

					local var_43_0 = arg_38_0.storyTree.childDict[var_42_1:GetConfigID()]

					assert(#var_43_0 <= 1)

					local var_43_1 = var_43_0[1]

					if var_43_1 and #var_43_1:GetPreNodes() == 1 then
						var_42_1 = var_43_1

						return true
					else
						var_39_8 = var_43_1
					end
				end

				while var_42_2() do
					-- block empty
				end

				var_39_7[arg_42_0] = var_42_0
			end)

			local var_39_9 = _.max(var_39_7)
			local var_39_10 = var_39_9 * (var_38_6 + var_38_12 + var_38_14) + (var_39_9 - 1) * var_38_7
			local var_39_11 = var_39_0.nodePos + Vector2.New(var_38_6 + var_38_14, 0)

			;(function()
				local var_44_0 = arg_38_0:DequeItem(arg_38_0.branchHeadTpl)

				setAnchoredPosition(var_44_0, var_39_11)

				var_39_11 = var_39_11 + Vector2.New(var_38_8, 0)

				local var_44_1 = arg_38_0.storyNodeStatus[var_39_2[1]:GetConfigID()].status

				eachChild(var_44_0, function(arg_45_0)
					setImageColor(arg_45_0, Color.NewHex(var_38_0[var_44_1]))
				end)
			end)()
			table.Ipairs(var_39_2, function(arg_46_0, arg_46_1)
				local var_46_0 = var_38_7

				if var_39_7[arg_46_0] < var_39_9 then
					local var_46_1 = var_39_7[arg_46_0]

					var_46_0 = (var_39_10 - var_46_1 * (var_38_6 + var_38_12 + var_38_14)) / (var_46_1 + 1)
				end

				local var_46_2 = arg_46_1:GetConfigID()
				local var_46_3 = var_39_11

				;(function()
					local var_47_0

					if arg_46_0 == 1 then
						var_47_0 = arg_38_0:DequeItem(arg_38_0.branchUpTpl)

						setAnchoredPosition(var_47_0, var_46_3)

						var_46_3 = var_46_3 + Vector2.New(var_38_9, var_38_10)

						if var_39_7[arg_46_0] < var_39_9 then
							setSizeDelta(var_47_0, {
								x = var_38_9 + var_46_0,
								y = var_38_10
							})

							local var_47_1 = tf(var_47_0):Find("Line_1").sizeDelta

							var_47_1.x = var_47_1.x + var_46_0

							setSizeDelta(tf(var_47_0):Find("Line_1"), var_47_1)

							var_46_3 = var_46_3 + Vector2.New(var_46_0, 0)
						end
					elseif arg_46_0 == 3 or arg_46_0 == 2 and #var_39_2 == 2 then
						var_47_0 = arg_38_0:DequeItem(arg_38_0.branchDownTpl)

						setAnchoredPosition(var_47_0, var_46_3)

						var_46_3 = var_46_3 + Vector2.New(var_38_9, -var_38_10)

						if var_39_7[arg_46_0] < var_39_9 then
							setSizeDelta(var_47_0, {
								x = var_38_9 + var_46_0,
								y = var_38_10
							})

							local var_47_2 = tf(var_47_0):Find("Line_1").sizeDelta

							var_47_2.x = var_47_2.x + var_46_0

							setSizeDelta(tf(var_47_0):Find("Line_1"), var_47_2)

							var_46_3 = var_46_3 + Vector2.New(var_46_0, 0)
						end
					else
						var_47_0 = arg_38_0:DequeItem(arg_38_0.branchCenterTpl)

						setAnchoredPosition(var_47_0, var_46_3)

						var_46_3 = var_46_3 + Vector2.New(var_38_9, 0)

						if var_39_7[arg_46_0] < var_39_9 then
							local var_47_3 = tf(var_47_0).sizeDelta

							var_47_3.x = var_47_3.x + var_46_0

							setSizeDelta(var_47_0, var_47_3)

							var_46_3 = var_46_3 + Vector2.New(var_46_0, 0)
						end
					end

					var_47_0.name = string.format("Branch%s_%s", var_39_1, var_46_2)

					local var_47_4 = arg_38_0.storyNodeStatus[var_46_2].status

					eachChild(var_47_0, function(arg_48_0)
						setImageColor(arg_48_0, Color.NewHex(var_38_0[var_47_4]))
					end)
				end)()

				var_46_3 = var_46_3 + Vector2.New(var_38_12, 0)

				local var_46_4 = arg_38_0:DequeItem(arg_38_0.storyNodeTpl)

				var_46_4.name = var_46_2

				setAnchoredPosition(var_46_4, var_46_3)

				arg_38_0.storyNodeTFsById[var_46_2] = {
					nodeTF = tf(var_46_4)
				}
				var_46_3 = var_46_3 + Vector2.New(var_38_6 + var_38_14, 0)

				local var_46_5 = arg_38_0.storyTree.childDict[var_46_2][1]
				local var_46_6 = arg_46_1

				local function var_46_7()
					if not var_46_5 or var_46_5 == var_39_8 then
						return
					end

					local var_49_0 = arg_38_0:DequeItem(arg_38_0.oneLineTpl)

					var_49_0.name = string.format("Line%s_%s", var_46_6:GetConfigID(), var_46_5:GetConfigID())

					setAnchoredPosition(var_49_0, var_46_3)

					var_46_3 = var_46_3 + Vector2.New(var_46_0 + var_38_12, 0)

					setSizeDelta(var_49_0, {
						x = var_46_0,
						y = arg_38_0.oneLineHeight
					})

					local var_49_1 = arg_38_0.storyNodeStatus[var_46_5:GetConfigID()].status

					eachChild(var_49_0, function(arg_50_0)
						setImageColor(arg_50_0, Color.NewHex(var_38_0[var_49_1]))
					end)

					local var_49_2 = arg_38_0:DequeItem(arg_38_0.storyNodeTpl)

					var_49_2.name = var_46_5:GetConfigID()

					setAnchoredPosition(var_49_2, var_46_3)

					arg_38_0.storyNodeTFsById[var_46_5:GetConfigID()] = {
						nodeTF = tf(var_49_2)
					}
					var_46_3 = var_46_3 + Vector2.New(var_38_6 + var_38_14, 0)
					var_46_5, var_46_6 = arg_38_0.storyTree.childDict[var_46_5:GetConfigID()][1], var_46_5

					return true
				end

				while var_46_7() do
					-- block empty
				end

				if var_39_8 then
					local var_46_8

					if arg_46_0 == 1 then
						var_46_8 = arg_38_0:DequeItem(arg_38_0.unionUpTpl)

						setAnchoredPosition(var_46_8, var_46_3)

						if var_39_7[arg_46_0] < var_39_9 then
							setSizeDelta(var_46_8, {
								x = var_38_9 + var_46_0,
								y = var_38_10
							})

							local var_46_9 = tf(var_46_8):Find("Line_1").sizeDelta

							var_46_9.x = var_46_9.x + var_46_0

							setSizeDelta(tf(var_46_8):Find("Line_1"), var_46_9)

							var_46_3 = var_46_3 + Vector2.New(var_46_0, 0)
						end
					elseif arg_46_0 == 3 or arg_46_0 == 2 and #var_39_2 == 2 then
						var_46_8 = arg_38_0:DequeItem(arg_38_0.unionDownTpl)

						setAnchoredPosition(var_46_8, var_46_3)

						if var_39_7[arg_46_0] < var_39_9 then
							setSizeDelta(var_46_8, {
								x = var_38_9 + var_46_0,
								y = var_38_10
							})

							local var_46_10 = tf(var_46_8):Find("Line_1").sizeDelta

							var_46_10.x = var_46_10.x + var_46_0

							setSizeDelta(tf(var_46_8):Find("Line_1"), var_46_10)

							var_46_3 = var_46_3 + Vector2.New(var_46_0, 0)
						end
					else
						var_46_8 = arg_38_0:DequeItem(arg_38_0.unionCenterTpl)

						setAnchoredPosition(var_46_8, var_46_3)

						if var_39_7[arg_46_0] < var_39_9 then
							local var_46_11 = tf(var_46_8).sizeDelta

							var_46_11.x = var_46_11.x + var_46_0

							setSizeDelta(var_46_8, var_46_11)

							var_46_3 = var_46_3 + Vector2.New(var_46_0, 0)
						end
					end

					var_46_8.name = string.format("Union%s_%s", var_46_6:GetConfigID(), var_39_8:GetConfigID())

					local var_46_12 = arg_38_0.storyNodeStatus[var_39_8:GetConfigID()].status

					eachChild(var_46_8, function(arg_51_0)
						setImageColor(arg_51_0, Color.NewHex(var_38_0[var_46_12]))
					end)
				end
			end)

			var_39_11 = var_39_11 + Vector2.New(var_39_10 + var_38_9, 0)

			if var_39_8 then
				(function()
					var_39_11 = var_39_11 + Vector2.New(var_38_9, 0)

					local var_52_0 = arg_38_0:DequeItem(arg_38_0.unionTailTpl)

					setAnchoredPosition(var_52_0, var_39_11)

					var_39_11 = var_39_11 + Vector2.New(var_38_11 + var_38_13, 0)

					local var_52_1 = arg_38_0.storyNodeStatus[var_39_8:GetConfigID()].status

					eachChild(var_52_0, function(arg_53_0)
						setImageColor(arg_53_0, Color.NewHex(var_38_0[var_52_1]))
					end)
				end)()
				table.insert(var_38_5, {
					node = var_39_8,
					nodePos = var_39_11
				})
			else
				var_38_2 = var_39_11 + var_38_4
			end
		end

		return next(var_38_5)
	end

	while var_38_15() do
		-- block empty
	end

	setSizeDelta(arg_38_0.storyContainer, {
		x = var_38_2
	})

	local var_38_16 = arg_38_0.spStoryNodes

	for iter_38_0 = 1, #var_38_16 do
		local var_38_17 = var_38_16[iter_38_0]
		local var_38_18 = var_38_17:GetConfigID()
		local var_38_19 = arg_38_0.storyNodeStatus[var_38_18].status
		local var_38_20 = arg_38_0.storyNodeTFsById[var_38_18].nodeTF
		local var_38_21 = var_38_20:Find("info/bk/title_form/title")

		if var_38_19 == var_0_2 then
			setScrollText(var_38_21, HXSet.hxLan(var_38_17:GetUnlockDesc()))
			setTextAlpha(var_38_21, 0.5)
		else
			setScrollText(var_38_21, HXSet.hxLan(var_38_17:GetDisplayName()))
			setTextAlpha(var_38_21, 1)
		end

		local var_38_22 = var_38_17:GetType()

		setActive(var_38_20:Find("circle/lock"), var_38_19 == var_0_2)

		if var_38_19 == var_0_2 then
			setActive(var_38_20:Find("circle/Story"), false)
			setActive(var_38_20:Find("circle/Battle"), false)
			setText(var_38_20:Find(""))
		elseif var_38_22 == ActivitySpStoryNode.NODE_TYPE.STORY then
			setActive(var_38_20:Find("circle/Story"), var_38_22 == ActivitySpStoryNode.NODE_TYPE.STORY)
			setActive(var_38_20:Find("circle/Battle"), var_38_22 == ActivitySpStoryNode.NODE_TYPE.BATTLE)
			setActive(var_38_20:Find("circle/Story/Done"), var_38_19 == var_0_4)
		elseif var_38_22 == ActivitySpStoryNode.NODE_TYPE.BATTLE then
			setActive(var_38_20:Find("circle/Story"), var_38_22 == ActivitySpStoryNode.NODE_TYPE.STORY)
			setActive(var_38_20:Find("circle/Battle"), var_38_22 == ActivitySpStoryNode.NODE_TYPE.BATTLE)
			setActive(var_38_20:Find("circle/Battle/Done"), var_38_19 == var_0_4)
		end

		local var_38_23 = var_38_19 == var_0_4

		setActive(var_38_20:Find("circle/progress"), var_38_23)
		onButton(arg_38_0, var_38_20, function()
			if var_38_19 == var_0_2 then
				return
			end

			local var_54_0 = var_38_17:GetStoryName()

			arg_38_0:PlayStory(var_54_0, function()
				arg_38_0:UpdateView()

				arg_38_0.needFocusStory = true

				arg_38_0:Move2UnlockStory()
			end, true)
		end)
	end

	local var_38_24 = arg_38_0.storyReadCount
	local var_38_25 = arg_38_0.storyReadMax

	setText(arg_38_0.progressText, var_38_24 .. "/" .. var_38_25)
	setActive(arg_38_0.storyAward, tobool(arg_38_0.storyTask))

	if arg_38_0.storyTask then
		local var_38_26 = arg_38_0.storyTask:getConfig("award_display")
		local var_38_27 = Drop.New({
			type = var_38_26[1][1],
			id = var_38_26[1][2],
			count = var_38_26[1][3]
		})

		updateDrop(arg_38_0.storyAward:GetChild(0), var_38_27)

		local var_38_28 = arg_38_0.storyTask:getTaskStatus()

		setActive(arg_38_0.storyAward:Find("get"), var_38_28 == 1)
		setActive(arg_38_0.storyAward:Find("got"), var_38_28 == 2)
		onButton(arg_38_0, arg_38_0.storyAward, function()
			arg_38_0:emit(BaseUI.ON_DROP, var_38_27)
		end)
	end
end

function var_0_0.DequeItem(arg_57_0, arg_57_1)
	local var_57_0 = arg_57_0.pools[arg_57_1]:Dequeue()

	table.insert(arg_57_0.activeItems, {
		template = arg_57_1,
		active = var_57_0
	})
	setActive(var_57_0, true)
	setParent(var_57_0, arg_57_0.storyContainer)

	return var_57_0
end

function var_0_0.Move2UnlockStory(arg_58_0)
	if not arg_58_0.needFocusStory then
		return
	end

	arg_58_0.needFocusStory = nil

	local var_58_0 = arg_58_0.spStoryNodes
	local var_58_1

	for iter_58_0 = #var_58_0, 1, -1 do
		local var_58_2 = var_58_0[iter_58_0]:GetConfigID()

		if arg_58_0.storyNodeStatus[var_58_2].status > var_0_2 then
			var_58_1 = var_58_2

			break
		end
	end

	local var_58_3 = arg_58_0.storyNodeTFsById[var_58_1].nodeTF
	local var_58_4 = arg_58_0.storyNodeTpl.rect.width
	local var_58_5 = var_58_3.anchoredPosition.x + var_58_4 * 0.5 - arg_58_0.storyContainer.parent.rect.width * 0.5
	local var_58_6 = math.clamp(var_58_5, 0, math.max(0, arg_58_0.storyContainer.rect.width - arg_58_0.storyContainer.parent.rect.width))

	setAnchoredPosition(arg_58_0.storyContainer, {
		x = -var_58_6
	})
end

function var_0_0.SwitchStoryMapAndBGM(arg_59_0)
	local var_59_0 = arg_59_0.data:getConfig("default_background")
	local var_59_1 = arg_59_0.data:getConfig("default_bgm")
	local var_59_2
	local var_59_3 = arg_59_0.spStoryNodes

	for iter_59_0 = 1, #var_59_3 do
		local var_59_4 = var_59_3[iter_59_0]
		local var_59_5 = var_59_4:GetConfigID()

		if arg_59_0.storyNodeStatus[var_59_5].status == var_0_4 then
			var_59_0, var_59_1 = var_59_4:GetCleanBG(), var_59_4:GetCleanBGM()
			var_59_2 = var_59_4:GetCleanAnimator()
		else
			break
		end
	end

	arg_59_0.sceneParent:SwitchBG({
		{
			bgPrefix = "bg",
			BG = var_59_0,
			Animator = var_59_2
		}
	})
	pg.BgmMgr.GetInstance():Push(arg_59_0.__cname, var_59_1)
end

function var_0_0.TrySubmitTask(arg_60_0)
	local var_60_0 = true

	for iter_60_0, iter_60_1 in ipairs(arg_60_0.spStoryNodes) do
		local var_60_1 = iter_60_1:GetStoryName()

		if var_60_1 and var_60_1 ~= "" then
			var_60_0 = var_60_0 and pg.NewStoryMgr.GetInstance():IsPlayed(var_60_1)
		end

		if not var_60_0 then
			break
		end
	end

	if var_60_0 and arg_60_0.storyTask and arg_60_0.storyTask:getTaskStatus() == 1 then
		arg_60_0:emit(LevelMediator2.ON_SUBMIT_TASK, arg_60_0.storyTask.id)

		return
	end
end

function var_0_0.PlayStory(arg_61_0, arg_61_1, arg_61_2, arg_61_3)
	if not arg_61_1 then
		return existCall(arg_61_2)
	end

	local var_61_0 = pg.NewStoryMgr.GetInstance()
	local var_61_1 = var_61_0:IsPlayed(arg_61_1)

	seriesAsync({
		function(arg_62_0)
			if var_61_1 and not arg_61_3 then
				return arg_62_0()
			end

			local var_62_0 = tonumber(arg_61_1)

			if var_62_0 and var_62_0 > 0 then
				arg_61_0:emit(LevelMediator2.ON_PERFORM_COMBAT, var_62_0, nil, var_61_1)
			else
				var_61_0:Play(arg_61_1, arg_62_0, arg_61_3)
			end
		end,
		function(arg_63_0, ...)
			existCall(arg_61_2, ...)
		end
	})
end

function var_0_0.UpdateStoryTask(arg_64_0)
	local var_64_0 = arg_64_0.activity:getConfig("config_client").task_id
	local var_64_1 = getProxy(TaskProxy):getTaskVO(var_64_0)

	if not var_64_1 then
		errorMsg("Missing Activity Task ID : " .. var_64_0)
	end

	arg_64_0.storyTask = var_64_1 or Task.New({
		id = var_64_0
	})
end

function var_0_0.OnSubmitTaskDone(arg_65_0)
	arg_65_0:UpdateView()
end

function var_0_0.OnDestroy(arg_66_0)
	arg_66_0:RecyclePools()

	for iter_66_0, iter_66_1 in pairs(arg_66_0.pools) do
		iter_66_1:Clear()
	end
end

return var_0_0
