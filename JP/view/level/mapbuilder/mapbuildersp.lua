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
		[arg_4_0.storyNodeTpl] = var_0_1.New(go(arg_4_0.storyNodeTpl), 16),
		[arg_4_0.oneLineTpl] = var_0_1.New(go(arg_4_0.oneLineTpl), 16),
		[arg_4_0.branchHeadTpl] = var_0_1.New(go(arg_4_0.branchHeadTpl), 16),
		[arg_4_0.branchCenterTpl] = var_0_1.New(go(arg_4_0.branchCenterTpl), 16),
		[arg_4_0.branchUpTpl] = var_0_1.New(go(arg_4_0.branchUpTpl), 16),
		[arg_4_0.branchDownTpl] = var_0_1.New(go(arg_4_0.branchDownTpl), 16),
		[arg_4_0.unionTailTpl] = var_0_1.New(go(arg_4_0.unionTailTpl), 16),
		[arg_4_0.unionCenterTpl] = var_0_1.New(go(arg_4_0.unionCenterTpl), 16),
		[arg_4_0.unionUpTpl] = var_0_1.New(go(arg_4_0.unionUpTpl), 16),
		[arg_4_0.unionDownTpl] = var_0_1.New(go(arg_4_0.unionDownTpl), 16)
	}
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

	_.each(arg_16_0.spStoryIDs, function(arg_17_0)
		arg_16_0.spStoryNodeDict[arg_17_0] = ActivitySpStoryNode.New({
			configId = arg_17_0
		})

		table.insert(arg_16_0.spStoryNodes, arg_16_0.spStoryNodeDict[arg_17_0])
	end)

	local var_16_0 = {}
	local var_16_1

	_.each(arg_16_0.spStoryNodes, function(arg_18_0)
		local var_18_0 = arg_18_0:GetPreNodes()

		if #var_18_0 == 0 then
			var_16_1 = arg_18_0

			return
		end

		_.each(var_18_0, function(arg_19_0)
			var_16_0[arg_19_0] = var_16_0[arg_19_0] or {}

			table.insert(var_16_0[arg_19_0], arg_18_0)
		end)
	end)

	arg_16_0.storyTree = {
		root = var_16_1,
		childDict = var_16_0
	}
end

function var_0_0.SetDisplayMode(arg_20_0, arg_20_1)
	if arg_20_1 == arg_20_0.contextData.displayMode then
		return
	end

	arg_20_0.contextData.displayMode = arg_20_1

	arg_20_0:UpdateView()
end

function var_0_0.UpdateView(arg_21_0)
	local var_21_0 = string.split(arg_21_0.contextData.map:getConfig("name"), "||")

	setText(arg_21_0.sceneParent.chapterName, var_21_0[1])

	local var_21_1 = arg_21_0.contextData.map:getMapTitleNumber()

	arg_21_0.sceneParent.loader:GetSpriteQuiet("chapterno", "chapter" .. var_21_1, arg_21_0.sceneParent.chapterNoTitle, true)

	arg_21_0.contextData.displayMode = arg_21_0.contextData.displayMode or var_0_0.DISPLAY.BATTLE

	var_0_0.super.UpdateView(arg_21_0)

	local var_21_2 = arg_21_0.contextData.displayMode == var_0_0.DISPLAY.BATTLE

	setActive(arg_21_0._tf:Find("Battle"), var_21_2)
	setActive(arg_21_0._tf:Find("Story"), not var_21_2)

	local var_21_3 = getProxy(ChapterProxy):IsActivitySPChapterActive() and SettingsProxy.IsShowActivityMapSPTip()

	setActive(arg_21_0.battleLayer:Find("Story/BattleTip"), var_21_3)
	setActive(arg_21_0.storyLayer:Find("Battle/BattleTip"), var_21_3)
	arg_21_0:UpdateStoryTask()

	if var_21_2 then
		arg_21_0:UpdateBattle()
		arg_21_0.sceneParent:SwitchMapBG(arg_21_0.contextData.map)
		arg_21_0.sceneParent:PlayBGM()
	else
		arg_21_0:UpdateStoryNodeStatus()
		arg_21_0:UpdateStory()
		arg_21_0:Move2UnlockStory()
		arg_21_0:SwitchStoryMapAndBGM()
	end

	arg_21_0:TrySubmitTask()
end

function var_0_0.UpdateBattle(arg_22_0)
	local var_22_0 = getProxy(ChapterProxy)
	local var_22_1 = arg_22_0.displayChapterIDs
	local var_22_2 = {}

	for iter_22_0, iter_22_1 in ipairs(var_22_1) do
		local var_22_3 = var_22_0:getChapterById(iter_22_1)

		table.insert(var_22_2, var_22_3)
	end

	table.clear(arg_22_0.chapterTFsById)
	UIItemList.StaticAlign(arg_22_0.itemHolder, arg_22_0.chapterTpl, #var_22_2, function(arg_23_0, arg_23_1, arg_23_2)
		if arg_23_0 ~= UIItemList.EventUpdate then
			return
		end

		local var_23_0 = var_22_2[arg_23_1 + 1]

		arg_22_0:UpdateMapItem(arg_23_2, var_23_0)

		arg_23_2.name = "Chapter_" .. var_23_0.id
		arg_22_0.chapterTFsById[var_23_0.id] = arg_23_2
	end)
end

function var_0_0.HideFloat(arg_24_0)
	var_0_0.super.HideFloat(arg_24_0)
	setActive(arg_24_0.itemHolder, false)
end

function var_0_0.ShowFloat(arg_25_0)
	var_0_0.super.ShowFloat(arg_25_0)
	setActive(arg_25_0.itemHolder, true)
end

function var_0_0.UpdateMapItem(arg_26_0, arg_26_1, arg_26_2)
	local var_26_0 = arg_26_2:getConfigTable()

	setAnchoredPosition(arg_26_1, {
		x = arg_26_0.mapWidth * var_26_0.pos_x,
		y = arg_26_0.mapHeight * var_26_0.pos_y
	})

	local var_26_1 = findTF(arg_26_1, "main")

	setActive(var_26_1, true)

	local var_26_2 = findTF(var_26_1, "circle/fordark")
	local var_26_3 = findTF(var_26_1, "info/bk/fordark")

	setActive(var_26_2, var_26_0.icon_outline == 1)
	setActive(var_26_3, var_26_0.icon_outline == 1)

	local var_26_4 = arg_26_0.chapterGroupDict[arg_26_2.id]

	assert(var_26_4)

	local var_26_5 = {
		"Lock",
		"Normal",
		"Hard"
	}
	local var_26_6 = 1

	if arg_26_2:isUnlock() then
		var_26_6 = 2

		if #var_26_4.list > 1 then
			var_26_6 = table.indexof(var_26_4.list, arg_26_2.id) + 1
		elseif arg_26_2:IsSpChapter() or arg_26_2:IsEXChapter() then
			var_26_6 = 3
		end
	end

	local var_26_7 = findTF(var_26_1, "circle/bk")

	for iter_26_0, iter_26_1 in ipairs(var_26_5) do
		setActive(var_26_7:Find(iter_26_1), iter_26_0 == var_26_6)
	end

	local var_26_8 = findTF(var_26_1, "circle/clear_flag")
	local var_26_9 = findTF(var_26_1, "circle/lock")
	local var_26_10 = findTF(var_26_1, "circle/progress")
	local var_26_11 = findTF(var_26_1, "circle/progress_text")
	local var_26_12 = findTF(var_26_1, "circle/stars")
	local var_26_13 = string.split(var_26_0.name, "|")

	setText(findTF(var_26_1, "info/bk/title_form/title_index"), var_26_0.chapter_name .. "  ")
	setText(findTF(var_26_1, "info/bk/title_form/title"), var_26_13[1])
	setText(findTF(var_26_1, "info/bk/title_form/title_en"), var_26_13[2] or "")
	setFillAmount(var_26_10, arg_26_2.progress / 100)
	setText(var_26_11, string.format("%d%%", arg_26_2.progress))
	setActive(var_26_12, arg_26_2:existAchieve())

	if arg_26_2:existAchieve() then
		for iter_26_2, iter_26_3 in ipairs(arg_26_2.achieves) do
			local var_26_14 = ChapterConst.IsAchieved(iter_26_3)
			local var_26_15 = var_26_12:GetChild(iter_26_2 - 1):Find("light")

			setActive(var_26_15, var_26_14)

			for iter_26_4, iter_26_5 in ipairs(var_26_5) do
				if iter_26_5 ~= "Lock" then
					setActive(var_26_15:Find(iter_26_5), iter_26_4 == var_26_6)
				end
			end
		end
	end

	local var_26_16 = findTF(var_26_1, "info/bk/BG")

	for iter_26_6, iter_26_7 in ipairs(var_26_5) do
		setActive(var_26_16:Find(iter_26_7), iter_26_6 == var_26_6)
	end

	setActive(findTF(var_26_1, "HardEffect"), var_26_6 == 3)

	local var_26_17 = not arg_26_2.active and arg_26_2:isClear()
	local var_26_18 = not arg_26_2.active and not arg_26_2:isUnlock()

	setActive(var_26_8, var_26_17)
	setActive(var_26_9, var_26_18)
	setActive(var_26_11, not var_26_17 and not var_26_18)
	arg_26_0:DeleteTween("fighting" .. arg_26_2.id)

	local var_26_19 = findTF(var_26_1, "circle/fighting")

	setText(findTF(var_26_19, "Text"), i18n("tag_level_fighting"))

	local var_26_20 = findTF(var_26_1, "circle/oni")

	setText(findTF(var_26_20, "Text"), i18n("tag_level_oni"))

	local var_26_21 = findTF(var_26_1, "circle/narrative")

	setText(findTF(var_26_21, "Text"), i18n("tag_level_narrative"))
	setActive(var_26_19, false)
	setActive(var_26_20, false)
	setActive(var_26_21, false)

	local var_26_22
	local var_26_23

	if arg_26_2:getConfig("chapter_tag") == 1 then
		var_26_22 = var_26_21
	end

	if arg_26_2.active then
		var_26_22 = arg_26_2:existOni() and var_26_20 or var_26_19
	end

	if var_26_22 then
		setActive(var_26_22, true)

		local var_26_24 = GetOrAddComponent(var_26_22, "CanvasGroup")

		var_26_24.alpha = 1

		arg_26_0:RecordTween("fighting" .. arg_26_2.id, LeanTween.alphaCanvas(var_26_24, 0, 0.5):setFrom(1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong().uniqueId)
	end

	local var_26_25 = findTF(var_26_1, "triesLimit")
	local var_26_26 = arg_26_2:isTriesLimit()

	setActive(var_26_25, var_26_26)

	if var_26_26 then
		local var_26_27 = arg_26_2:getConfig("count")
		local var_26_28 = var_26_27 - arg_26_2:getTodayDefeatCount() .. "/" .. var_26_27

		setText(var_26_25:Find("label"), i18n("levelScene_chapter_count_tip"))
		setText(var_26_25:Find("Text"), setColorStr(var_26_28, var_26_27 <= arg_26_2:getTodayDefeatCount() and COLOR_RED or COLOR_GREEN))

		local var_26_29 = getProxy(ChapterProxy):IsActivitySPChapterActive() and SettingsProxy.IsShowActivityMapSPTip()

		setActive(var_26_25:Find("TipRect"), var_26_29)
	end

	local var_26_30 = arg_26_2:GetDailyBonusQuota()
	local var_26_31 = findTF(var_26_1, "mark")

	setActive(var_26_31:Find("bonus"), var_26_30)
	setActive(var_26_31, var_26_30)

	if var_26_30 then
		local var_26_32 = var_26_31:GetComponent(typeof(CanvasGroup))
		local var_26_33 = arg_26_0.contextData.map:getConfig("type") == Map.ACTIVITY_HARD and "bonus_us_hard" or "bonus_us"

		arg_26_0.sceneParent.loader:GetSprite("ui/levelmainscene_atlas", var_26_33, var_26_31:Find("bonus"))
		LeanTween.cancel(go(var_26_31), true)

		local var_26_34 = var_26_31.anchoredPosition.y

		var_26_32.alpha = 0

		LeanTween.value(go(var_26_31), 0, 1, 0.2):setOnUpdate(System.Action_float(function(arg_27_0)
			var_26_32.alpha = arg_27_0

			local var_27_0 = var_26_31.anchoredPosition

			var_27_0.y = var_26_34 * arg_27_0
			var_26_31.anchoredPosition = var_27_0
		end)):setOnComplete(System.Action(function()
			var_26_32.alpha = 1

			local var_28_0 = var_26_31.anchoredPosition

			var_28_0.y = var_26_34
			var_26_31.anchoredPosition = var_28_0
		end)):setEase(LeanTweenType.easeOutSine):setDelay(0.7)
	end

	local var_26_35 = arg_26_2.id

	onButton(arg_26_0, var_26_1, function()
		arg_26_0:TryOpenChapterInfo(var_26_35, nil, var_26_4.list)
	end, SFX_UI_WEIGHANCHOR_SELECT)
end

function var_0_0.SwitchChapter(arg_30_0, arg_30_1)
	local var_30_0 = arg_30_0.chapterGroupDict[arg_30_1]

	if not var_30_0 then
		return
	end

	local var_30_1 = var_30_0.list[var_30_0.index]

	if var_30_1 == arg_30_1 then
		return
	end

	local var_30_2 = table.indexof(var_30_0.list, arg_30_1)

	var_30_0.index = var_30_2

	local var_30_3 = var_30_0.list[1]
	local var_30_4 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt("spchapter_selected_" .. var_30_4 .. "_" .. var_30_3, var_30_2)

	local var_30_5 = arg_30_0.chapterTFsById[var_30_1]

	arg_30_0.chapterTFsById[var_30_1] = nil
	arg_30_0.chapterTFsById[arg_30_1] = var_30_5

	arg_30_0:UpdateChapterTF(arg_30_1)
end

function var_0_0.UpdateChapterTF(arg_31_0, arg_31_1)
	if not arg_31_0.chapterGroupDict[arg_31_1] then
		return
	end

	local var_31_0 = arg_31_0.chapterTFsById[arg_31_1]

	if var_31_0 then
		local var_31_1 = getProxy(ChapterProxy):getChapterById(arg_31_1)

		arg_31_0:UpdateMapItem(var_31_0, var_31_1)
	end
end

function var_0_0.RecyclePools(arg_32_0)
	for iter_32_0 = #arg_32_0.activeItems, 1, -1 do
		local var_32_0 = arg_32_0.activeItems[iter_32_0]

		arg_32_0.pools[var_32_0.template]:Enqueue(var_32_0.active)
	end

	table.clean(arg_32_0.activeItems)

	arg_32_0.storyNodeTFsById = {}
end

local var_0_2 = 1
local var_0_3 = 2
local var_0_4 = 3

function var_0_0.UpdateStoryNodeStatus(arg_33_0)
	local var_33_0 = 0
	local var_33_1 = 0
	local var_33_2 = pg.NewStoryMgr.GetInstance()
	local var_33_3 = {}

	table.Foreach(arg_33_0.spStoryIDs, function(arg_34_0, arg_34_1)
		var_33_3[arg_34_1] = {}
	end)

	local var_33_4 = arg_33_0.spStoryNodes

	for iter_33_0 = 1, #var_33_4 do
		local var_33_5 = var_33_4[iter_33_0]
		local var_33_6 = var_33_5:GetConfigID()
		local var_33_7 = var_33_5:GetPreEvent()
		local var_33_8 = false
		local var_33_9 = var_33_7 == 0 and true or var_33_3[var_33_7].status == var_0_4
		local var_33_10 = var_0_2
		local var_33_11 = var_33_5:GetStoryName()
		local var_33_12 = false

		if var_33_11 and var_33_11 ~= "" then
			var_33_12 = var_33_2:IsPlayed(var_33_11)
			var_33_0 = var_33_0 + (var_33_12 and 1 or 0)
			var_33_1 = var_33_1 + 1
		end

		if not var_33_12 and var_33_9 then
			_.each(var_33_5:GetUnlockConditions(), function(arg_35_0)
				if arg_35_0[1] == ActivitySpStoryNode.CONDITION.TIME then
					local var_35_0 = pg.TimeMgr.GetInstance():parseTimeFromConfig(arg_35_0[2])
					local var_35_1 = pg.TimeMgr.GetInstance():GetServerTime()

					var_33_9 = var_33_9 and var_35_0 <= var_35_1
				elseif arg_35_0[1] == ActivitySpStoryNode.CONDITION.PASSCHAPTER then
					local var_35_2 = arg_35_0[2]

					var_33_9 = var_33_9 and _.all(var_35_2, function(arg_36_0)
						return getProxy(ChapterProxy):getChapterById(arg_36_0, true):isClear()
					end)
				elseif arg_35_0[1] == ActivitySpStoryNode.CONDITION.PT then
					local var_35_3 = arg_35_0[2][1]
					local var_35_4 = arg_35_0[2][2]
					local var_35_5 = arg_35_0[2][3]
					local var_35_6 = 0

					if var_35_3 == DROP_TYPE_RESOURCE then
						var_35_6 = getProxy(PlayerProxy):getRawData():getResource(arg_35_0[2])
					elseif var_35_3 == DROP_TYPE_ITEM then
						var_35_6 = getProxy(BagProxy):getItemCountById(var_35_4)
					end

					var_33_9 = var_33_9 and var_35_5 <= var_35_6
				end
			end)
		end

		if var_33_12 then
			var_33_10 = var_0_4
		elseif var_33_9 then
			var_33_10 = var_0_3
		end

		var_33_3[var_33_6].status = var_33_10
	end

	arg_33_0.storyNodeStatus = var_33_3
	arg_33_0.storyReadCount, arg_33_0.storyReadMax = var_33_0, var_33_1
end

function var_0_0.UpdateStory(arg_37_0)
	arg_37_0:RecyclePools()

	local var_37_0 = {
		"162443",
		"ffffff",
		"ffcb5a"
	}
	local var_37_1 = arg_37_0.data:getConfig("story_inactive_color")

	if var_37_1 and #var_37_1 > 0 then
		var_37_0[1] = var_37_1
	end

	local var_37_2 = arg_37_0.storyReadCount
	local var_37_3 = arg_37_0.storyReadMax
	local var_37_4 = 0
	local var_37_5 = 150
	local var_37_6 = 150
	local var_37_7 = {
		{
			layer = 0,
			node = arg_37_0.storyTree.root,
			nodePos = Vector2.New(var_37_5, 0)
		}
	}
	local var_37_8 = arg_37_0.storyNodeTpl.rect.width
	local var_37_9 = arg_37_0.oneLineTpl.rect.width
	local var_37_10 = arg_37_0.branchHeadTpl.rect.width
	local var_37_11 = arg_37_0.branchUpTpl.rect.width
	local var_37_12 = arg_37_0.branchUpTpl.rect.height
	local var_37_13 = arg_37_0.unionTailTpl.rect.width
	local var_37_14 = 75
	local var_37_15 = 82
	local var_37_16 = 32

	while true do
		if not next(var_37_7) then
			break
		end

		local var_37_17 = table.remove(var_37_7, 1)
		local var_37_18 = var_37_17.node
		local var_37_19 = var_37_18:GetConfigID()
		local var_37_20 = arg_37_0.storyNodeStatus[var_37_19].status
		local var_37_21 = arg_37_0:DequeItem(arg_37_0.storyNodeTpl)

		setAnchoredPosition(var_37_21, var_37_17.nodePos)

		arg_37_0.storyNodeTFsById[var_37_19] = {
			nodeTF = tf(var_37_21)
		}

		local var_37_22 = arg_37_0.storyTree.childDict[var_37_19] or {}

		table.Ipairs(var_37_22, function(arg_38_0, arg_38_1)
			local var_38_0
			local var_38_1
			local var_38_2 = var_37_17.layer

			if #arg_38_1:GetPreNodes() > 1 then
				local var_38_3 = arg_38_1:GetPreNodes()

				if var_37_19 == var_38_3[1] then
					local var_38_4 = var_37_8 + var_37_16
					local var_38_5 = arg_37_0:DequeItem(arg_37_0.unionUpTpl)

					setAnchoredPosition(var_38_5, var_37_17.nodePos + Vector2.New(var_38_4, 0))

					var_38_2 = var_38_2 - 1

					local var_38_6 = arg_37_0.storyNodeStatus[arg_38_1:GetConfigID()].status

					eachChild(var_38_5, function(arg_39_0)
						setImageColor(arg_39_0, Color.NewHex(var_37_0[var_38_6]))
					end)

					return
				elseif #var_38_3 == 2 or var_37_19 == var_38_3[3] then
					local var_38_7 = var_37_8 + var_37_16
					local var_38_8 = arg_37_0:DequeItem(arg_37_0.unionDownTpl)

					setAnchoredPosition(var_38_8, var_37_17.nodePos + Vector2.New(var_38_7, 0))

					local var_38_9 = var_38_7 + var_37_11
					local var_38_10 = arg_37_0:DequeItem(arg_37_0.unionTailTpl)

					setAnchoredPosition(var_38_10, var_37_17.nodePos + Vector2.New(var_38_9, var_37_12))

					var_38_1 = var_37_17.nodePos + Vector2.New(var_38_9 + var_37_13 + var_37_15, var_37_12)
					var_38_2 = var_38_2 + 1

					local var_38_11 = arg_37_0.storyNodeStatus[arg_38_1:GetConfigID()].status

					eachChild(var_38_8, function(arg_40_0)
						setImageColor(arg_40_0, Color.NewHex(var_37_0[var_38_11]))
					end)
					eachChild(var_38_10, function(arg_41_0)
						setImageColor(arg_41_0, Color.NewHex(var_37_0[var_38_11]))
					end)
				else
					local var_38_12 = var_37_8 + var_37_16
					local var_38_13 = arg_37_0:DequeItem(arg_37_0.unionCenterTpl)

					setAnchoredPosition(var_38_13, var_37_17.nodePos + Vector2.New(var_38_12, 0))

					local var_38_14 = arg_37_0.storyNodeStatus[arg_38_1:GetConfigID()].status

					eachChild(var_38_13, function(arg_42_0)
						setImageColor(arg_42_0, Color.NewHex(var_37_0[var_38_14]))
					end)

					return
				end
			elseif #var_37_22 == 1 then
				local var_38_15 = arg_37_0:DequeItem(arg_37_0.oneLineTpl)

				setAnchoredPosition(var_38_15, var_37_17.nodePos + Vector2.New(var_37_8 + var_37_16, 0))

				var_38_1 = tf(var_38_15).anchoredPosition + Vector2.New(var_37_9 + var_37_14, 0)

				local var_38_16 = arg_37_0.storyNodeStatus[arg_38_1:GetConfigID()].status

				eachChild(var_38_15, function(arg_43_0)
					setImageColor(arg_43_0, Color.NewHex(var_37_0[var_38_16]))
				end)

				arg_37_0.storyNodeTFsById[var_37_19].lineTF = tf(var_38_15)
			elseif arg_38_0 == 1 then
				local var_38_17 = var_37_8 + var_37_16
				local var_38_18 = arg_37_0:DequeItem(arg_37_0.branchHeadTpl)

				setAnchoredPosition(var_38_18, var_37_17.nodePos + Vector2.New(var_38_17, 0))

				local var_38_19 = var_38_17 + var_37_10
				local var_38_20 = arg_37_0:DequeItem(arg_37_0.branchUpTpl)

				setAnchoredPosition(var_38_20, var_37_17.nodePos + Vector2.New(var_38_19, 0))

				var_38_1 = var_37_17.nodePos + Vector2.New(var_38_19 + var_37_11 + var_37_14, var_37_12)
				var_38_2 = var_38_2 + 1

				local var_38_21 = arg_37_0.storyNodeStatus[arg_38_1:GetConfigID()].status

				eachChild(var_38_20, function(arg_44_0)
					setImageColor(arg_44_0, Color.NewHex(var_37_0[var_38_21]))
				end)
				eachChild(var_38_18, function(arg_45_0)
					setImageColor(arg_45_0, Color.NewHex(var_37_0[var_38_21]))
				end)
			elseif arg_38_0 == 3 or arg_38_0 == 2 and #var_37_22 == 2 then
				local var_38_22 = var_37_8 + var_37_16 + var_37_10
				local var_38_23 = arg_37_0:DequeItem(arg_37_0.branchDownTpl)

				setAnchoredPosition(var_38_23, var_37_17.nodePos + Vector2.New(var_38_22, 0))

				var_38_1 = var_37_17.nodePos + Vector2.New(var_38_22 + var_37_11 + var_37_14, -var_37_12)
				var_38_2 = var_38_2 - 1

				local var_38_24 = arg_37_0.storyNodeStatus[arg_38_1:GetConfigID()].status

				eachChild(var_38_23, function(arg_46_0)
					setImageColor(arg_46_0, Color.NewHex(var_37_0[var_38_24]))
				end)
			else
				local var_38_25 = var_37_8 + var_37_16 + var_37_10
				local var_38_26 = arg_37_0:DequeItem(arg_37_0.branchCenterTpl)

				setAnchoredPosition(var_38_26, var_37_17.nodePos + Vector2.New(var_38_25, 0))

				var_38_1 = var_37_17.nodePos + Vector2.New(var_38_25 + var_37_11 + var_37_14, 0)

				local var_38_27 = arg_37_0.storyNodeStatus[arg_38_1:GetConfigID()].status

				eachChild(var_38_26, function(arg_47_0)
					setImageColor(arg_47_0, Color.NewHex(var_37_0[var_38_27]))
				end)
			end

			table.insert(var_37_7, {
				node = arg_38_1,
				nodePos = var_38_1,
				layer = var_38_2
			})
		end)

		if #var_37_22 == 0 then
			var_37_4 = var_37_17.nodePos.x + var_37_8 + var_37_6
		end

		local var_37_23 = tf(var_37_21)
		local var_37_24 = var_37_23:Find("info/bk/title_form/title")

		if var_37_20 == var_0_2 then
			setScrollText(var_37_24, var_37_18:GetUnlockDesc())
			setTextAlpha(var_37_24, 0.5)
		else
			setScrollText(var_37_24, var_37_18:GetDisplayName())
			setTextAlpha(var_37_24, 1)
		end

		local var_37_25 = var_37_18:GetType()

		setActive(var_37_23:Find("circle/lock"), var_37_20 == var_0_2)

		if var_37_20 == var_0_2 then
			setActive(var_37_23:Find("circle/Story"), false)
			setActive(var_37_23:Find("circle/Battle"), false)
			setText(var_37_23:Find(""))
		elseif var_37_25 == ActivitySpStoryNode.NODE_TYPE.STORY then
			setActive(var_37_23:Find("circle/Story"), var_37_25 == ActivitySpStoryNode.NODE_TYPE.STORY)
			setActive(var_37_23:Find("circle/Battle"), var_37_25 == ActivitySpStoryNode.NODE_TYPE.BATTLE)
			setActive(var_37_23:Find("circle/Story/Done"), var_37_20 == var_0_4)
		elseif var_37_25 == ActivitySpStoryNode.NODE_TYPE.BATTLE then
			setActive(var_37_23:Find("circle/Story"), var_37_25 == ActivitySpStoryNode.NODE_TYPE.STORY)
			setActive(var_37_23:Find("circle/Battle"), var_37_25 == ActivitySpStoryNode.NODE_TYPE.BATTLE)
			setActive(var_37_23:Find("circle/Battle/Done"), var_37_20 == var_0_4)
		end

		local var_37_26 = var_37_20 == var_0_4

		setActive(var_37_23:Find("circle/progress"), var_37_26)
		onButton(arg_37_0, var_37_23, function()
			if var_37_20 == var_0_2 then
				return
			end

			local var_48_0 = var_37_18:GetStoryName()

			arg_37_0:PlayStory(var_48_0, function()
				arg_37_0:UpdateView()

				arg_37_0.needFocusStory = true

				arg_37_0:Move2UnlockStory()
			end, true)
		end)
	end

	setSizeDelta(arg_37_0.storyContainer, {
		x = var_37_4
	})
	setText(arg_37_0.progressText, var_37_2 .. "/" .. var_37_3)
	setActive(arg_37_0.storyAward, tobool(arg_37_0.storyTask))

	if arg_37_0.storyTask then
		local var_37_27 = arg_37_0.storyTask:getConfig("award_display")
		local var_37_28 = Drop.New({
			type = var_37_27[1][1],
			id = var_37_27[1][2],
			count = var_37_27[1][3]
		})

		updateDrop(arg_37_0.storyAward:GetChild(0), var_37_28)

		local var_37_29 = arg_37_0.storyTask:getTaskStatus()

		setActive(arg_37_0.storyAward:Find("get"), var_37_29 == 1)
		setActive(arg_37_0.storyAward:Find("got"), var_37_29 == 2)
		onButton(arg_37_0, arg_37_0.storyAward, function()
			arg_37_0:emit(BaseUI.ON_DROP, var_37_28)
		end)
	end
end

function var_0_0.DequeItem(arg_51_0, arg_51_1)
	local var_51_0 = arg_51_0.pools[arg_51_1]:Dequeue()

	table.insert(arg_51_0.activeItems, {
		template = arg_51_1,
		active = var_51_0
	})
	setActive(var_51_0, true)
	setParent(var_51_0, arg_51_0.storyContainer)

	return var_51_0
end

function var_0_0.Move2UnlockStory(arg_52_0)
	if not arg_52_0.needFocusStory then
		return
	end

	arg_52_0.needFocusStory = nil

	local var_52_0 = arg_52_0.spStoryNodes
	local var_52_1

	for iter_52_0 = #var_52_0, 1, -1 do
		local var_52_2 = var_52_0[iter_52_0]:GetConfigID()

		if arg_52_0.storyNodeStatus[var_52_2].status > var_0_2 then
			var_52_1 = var_52_2

			break
		end
	end

	local var_52_3 = arg_52_0.storyNodeTFsById[var_52_1].nodeTF
	local var_52_4 = arg_52_0.storyNodeTpl.rect.width
	local var_52_5 = var_52_3.anchoredPosition.x + var_52_4 * 0.5 - arg_52_0.storyContainer.parent.rect.width * 0.5
	local var_52_6 = math.clamp(var_52_5, 0, math.max(0, arg_52_0.storyContainer.rect.width - arg_52_0.storyContainer.parent.rect.width))

	setAnchoredPosition(arg_52_0.storyContainer, {
		x = -var_52_6
	})
end

function var_0_0.SwitchStoryMapAndBGM(arg_53_0)
	local var_53_0 = arg_53_0.data:getConfig("default_background")
	local var_53_1 = arg_53_0.data:getConfig("default_bgm")
	local var_53_2
	local var_53_3 = arg_53_0.spStoryNodes

	for iter_53_0 = 1, #var_53_3 do
		local var_53_4 = var_53_3[iter_53_0]
		local var_53_5 = var_53_4:GetConfigID()

		if arg_53_0.storyNodeStatus[var_53_5].status == var_0_4 then
			var_53_0, var_53_1 = var_53_4:GetCleanBG(), var_53_4:GetCleanBGM()
			var_53_2 = var_53_4:GetCleanAnimator()
		else
			break
		end
	end

	arg_53_0.sceneParent:SwitchBG({
		{
			bgPrefix = "bg",
			BG = var_53_0,
			Animator = var_53_2
		}
	})
	pg.BgmMgr.GetInstance():Push(arg_53_0.__cname, var_53_1)
end

function var_0_0.TrySubmitTask(arg_54_0)
	local var_54_0 = true

	for iter_54_0, iter_54_1 in ipairs(arg_54_0.spStoryNodes) do
		local var_54_1 = iter_54_1:GetStoryName()

		if var_54_1 and var_54_1 ~= "" then
			var_54_0 = var_54_0 and pg.NewStoryMgr.GetInstance():IsPlayed(var_54_1)
		end

		if not var_54_0 then
			break
		end
	end

	if var_54_0 and arg_54_0.storyTask and arg_54_0.storyTask:getTaskStatus() == 1 then
		arg_54_0:emit(LevelMediator2.ON_SUBMIT_TASK, arg_54_0.storyTask.id)

		return
	end
end

function var_0_0.PlayStory(arg_55_0, arg_55_1, arg_55_2, arg_55_3)
	if not arg_55_1 then
		return existCall(arg_55_2)
	end

	local var_55_0 = pg.NewStoryMgr.GetInstance()
	local var_55_1 = var_55_0:IsPlayed(arg_55_1)

	seriesAsync({
		function(arg_56_0)
			if var_55_1 and not arg_55_3 then
				return arg_56_0()
			end

			local var_56_0 = tonumber(arg_55_1)

			if var_56_0 and var_56_0 > 0 then
				arg_55_0:emit(LevelMediator2.ON_PERFORM_COMBAT, var_56_0)
			else
				var_55_0:Play(arg_55_1, arg_56_0, arg_55_3)
			end
		end,
		function(arg_57_0, ...)
			existCall(arg_55_2, ...)
		end
	})
end

function var_0_0.UpdateStoryTask(arg_58_0)
	local var_58_0 = arg_58_0.activity:getConfig("config_client").task_id
	local var_58_1 = getProxy(TaskProxy):getTaskVO(var_58_0)

	if not var_58_1 then
		errorMsg("Missing Activity Task ID : " .. var_58_0)
	end

	arg_58_0.storyTask = var_58_1 or Task.New({
		id = var_58_0
	})
end

function var_0_0.OnSubmitTaskDone(arg_59_0)
	arg_59_0:UpdateView()
end

function var_0_0.OnDestroy(arg_60_0)
	arg_60_0:RecyclePools()

	for iter_60_0, iter_60_1 in pairs(arg_60_0.pools) do
		iter_60_1:Clear()
	end
end

return var_0_0
