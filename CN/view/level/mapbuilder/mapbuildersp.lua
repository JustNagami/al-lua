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

	setActive(arg_4_0.storyNodeTpl, false)
	setActive(arg_4_0.oneLineTpl, false)
	setActive(arg_4_0.branchHeadTpl, false)
	setActive(arg_4_0.branchCenterTpl, false)
	setActive(arg_4_0.branchUpTpl, false)
	setActive(arg_4_0.branchDownTpl, false)

	arg_4_0.pools = {
		[arg_4_0.storyNodeTpl] = var_0_1.New(go(arg_4_0.storyNodeTpl), 16),
		[arg_4_0.oneLineTpl] = var_0_1.New(go(arg_4_0.oneLineTpl), 16),
		[arg_4_0.branchHeadTpl] = var_0_1.New(go(arg_4_0.branchHeadTpl), 16),
		[arg_4_0.branchCenterTpl] = var_0_1.New(go(arg_4_0.branchCenterTpl), 16),
		[arg_4_0.branchUpTpl] = var_0_1.New(go(arg_4_0.branchUpTpl), 16),
		[arg_4_0.branchDownTpl] = var_0_1.New(go(arg_4_0.branchDownTpl), 16)
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

	setActive(arg_9_0.sceneParent.actExchangeShopBtn, not ActivityConst.HIDE_PT_PANELS and var_9_3 and not var_9_2 and var_9_1)
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
	local var_11_1 = arg_11_0.activity:getConfig("config_client").chapterGroups

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
	arg_16_0.spStoryIDs = arg_16_0.activity:getConfig("config_client").story_id
	arg_16_0.spStoryNodes = _.map(arg_16_0.spStoryIDs, function(arg_17_0)
		return ActivitySpStoryNode.New({
			configId = arg_17_0
		})
	end)

	local var_16_0 = {}
	local var_16_1

	_.each(arg_16_0.spStoryNodes, function(arg_18_0)
		local var_18_0 = arg_18_0:GetPreEvent()

		if var_18_0 == 0 then
			var_16_1 = arg_18_0

			return
		end

		var_16_0[var_18_0] = var_16_0[var_18_0] or {}

		table.insert(var_16_0[var_18_0], arg_18_0)
	end)

	arg_16_0.storyTree = {
		root = var_16_1,
		childDict = var_16_0
	}
end

function var_0_0.SetDisplayMode(arg_19_0, arg_19_1)
	if arg_19_1 == arg_19_0.contextData.displayMode then
		return
	end

	arg_19_0.contextData.displayMode = arg_19_1

	arg_19_0:UpdateView()
end

function var_0_0.UpdateView(arg_20_0)
	local var_20_0 = string.split(arg_20_0.contextData.map:getConfig("name"), "||")

	setText(arg_20_0.sceneParent.chapterName, var_20_0[1])

	local var_20_1 = arg_20_0.contextData.map:getMapTitleNumber()

	arg_20_0.sceneParent.loader:GetSpriteQuiet("chapterno", "chapter" .. var_20_1, arg_20_0.sceneParent.chapterNoTitle, true)

	arg_20_0.contextData.displayMode = arg_20_0.contextData.displayMode or var_0_0.DISPLAY.BATTLE

	var_0_0.super.UpdateView(arg_20_0)

	local var_20_2 = arg_20_0.contextData.displayMode == var_0_0.DISPLAY.BATTLE

	setActive(arg_20_0._tf:Find("Battle"), var_20_2)
	setActive(arg_20_0._tf:Find("Story"), not var_20_2)

	local var_20_3 = getProxy(ChapterProxy):IsActivitySPChapterActive() and SettingsProxy.IsShowActivityMapSPTip()

	setActive(arg_20_0.battleLayer:Find("Story/BattleTip"), var_20_3)
	setActive(arg_20_0.storyLayer:Find("Battle/BattleTip"), var_20_3)
	arg_20_0:UpdateStoryTask()

	if var_20_2 then
		arg_20_0:UpdateBattle()
		arg_20_0.sceneParent:SwitchMapBG(arg_20_0.contextData.map)
		arg_20_0.sceneParent:PlayBGM()
	else
		arg_20_0:UpdateStoryNodeStatus()
		arg_20_0:UpdateStory()
		arg_20_0:Move2UnlockStory()
		arg_20_0:SwitchStoryMapAndBGM()
	end

	arg_20_0:TrySubmitTask()
end

function var_0_0.UpdateBattle(arg_21_0)
	local var_21_0 = getProxy(ChapterProxy)
	local var_21_1 = arg_21_0.displayChapterIDs
	local var_21_2 = {}

	for iter_21_0, iter_21_1 in ipairs(var_21_1) do
		local var_21_3 = var_21_0:getChapterById(iter_21_1)

		table.insert(var_21_2, var_21_3)
	end

	table.clear(arg_21_0.chapterTFsById)
	UIItemList.StaticAlign(arg_21_0.itemHolder, arg_21_0.chapterTpl, #var_21_2, function(arg_22_0, arg_22_1, arg_22_2)
		if arg_22_0 ~= UIItemList.EventUpdate then
			return
		end

		local var_22_0 = var_21_2[arg_22_1 + 1]

		arg_21_0:UpdateMapItem(arg_22_2, var_22_0)

		arg_22_2.name = "Chapter_" .. var_22_0.id
		arg_21_0.chapterTFsById[var_22_0.id] = arg_22_2
	end)
end

function var_0_0.HideFloat(arg_23_0)
	var_0_0.super.HideFloat(arg_23_0)
	setActive(arg_23_0.itemHolder, false)
end

function var_0_0.ShowFloat(arg_24_0)
	var_0_0.super.ShowFloat(arg_24_0)
	setActive(arg_24_0.itemHolder, true)
end

function var_0_0.UpdateMapItem(arg_25_0, arg_25_1, arg_25_2)
	local var_25_0 = arg_25_2:getConfigTable()

	setAnchoredPosition(arg_25_1, {
		x = arg_25_0.mapWidth * var_25_0.pos_x,
		y = arg_25_0.mapHeight * var_25_0.pos_y
	})

	local var_25_1 = findTF(arg_25_1, "main")

	setActive(var_25_1, true)

	local var_25_2 = findTF(var_25_1, "circle/fordark")
	local var_25_3 = findTF(var_25_1, "info/bk/fordark")

	setActive(var_25_2, var_25_0.icon_outline == 1)
	setActive(var_25_3, var_25_0.icon_outline == 1)

	local var_25_4 = arg_25_0.chapterGroupDict[arg_25_2.id]

	assert(var_25_4)

	local var_25_5 = {
		"Lock",
		"Normal",
		"Hard"
	}
	local var_25_6 = 1

	if arg_25_2:isUnlock() then
		var_25_6 = 2

		if #var_25_4.list > 1 then
			var_25_6 = table.indexof(var_25_4.list, arg_25_2.id) + 1
		elseif arg_25_2:IsSpChapter() or arg_25_2:IsEXChapter() then
			var_25_6 = 3
		end
	end

	local var_25_7 = findTF(var_25_1, "circle/bk")

	for iter_25_0, iter_25_1 in ipairs(var_25_5) do
		setActive(var_25_7:Find(iter_25_1), iter_25_0 == var_25_6)
	end

	local var_25_8 = findTF(var_25_1, "circle/clear_flag")
	local var_25_9 = findTF(var_25_1, "circle/lock")
	local var_25_10 = findTF(var_25_1, "circle/progress")
	local var_25_11 = findTF(var_25_1, "circle/progress_text")
	local var_25_12 = findTF(var_25_1, "circle/stars")
	local var_25_13 = string.split(var_25_0.name, "|")

	setText(findTF(var_25_1, "info/bk/title_form/title_index"), var_25_0.chapter_name .. "  ")
	setText(findTF(var_25_1, "info/bk/title_form/title"), var_25_13[1])
	setText(findTF(var_25_1, "info/bk/title_form/title_en"), var_25_13[2] or "")
	setFillAmount(var_25_10, arg_25_2.progress / 100)
	setText(var_25_11, string.format("%d%%", arg_25_2.progress))
	setActive(var_25_12, arg_25_2:existAchieve())

	if arg_25_2:existAchieve() then
		for iter_25_2, iter_25_3 in ipairs(arg_25_2.achieves) do
			local var_25_14 = ChapterConst.IsAchieved(iter_25_3)
			local var_25_15 = var_25_12:GetChild(iter_25_2 - 1):Find("light")

			setActive(var_25_15, var_25_14)

			for iter_25_4, iter_25_5 in ipairs(var_25_5) do
				if iter_25_5 ~= "Lock" then
					setActive(var_25_15:Find(iter_25_5), iter_25_4 == var_25_6)
				end
			end
		end
	end

	local var_25_16 = findTF(var_25_1, "info/bk/BG")

	for iter_25_6, iter_25_7 in ipairs(var_25_5) do
		setActive(var_25_16:Find(iter_25_7), iter_25_6 == var_25_6)
	end

	setActive(findTF(var_25_1, "HardEffect"), var_25_6 == 3)

	local var_25_17 = not arg_25_2.active and arg_25_2:isClear()
	local var_25_18 = not arg_25_2.active and not arg_25_2:isUnlock()

	setActive(var_25_8, var_25_17)
	setActive(var_25_9, var_25_18)
	setActive(var_25_11, not var_25_17 and not var_25_18)
	arg_25_0:DeleteTween("fighting" .. arg_25_2.id)

	local var_25_19 = findTF(var_25_1, "circle/fighting")

	setText(findTF(var_25_19, "Text"), i18n("tag_level_fighting"))

	local var_25_20 = findTF(var_25_1, "circle/oni")

	setText(findTF(var_25_20, "Text"), i18n("tag_level_oni"))

	local var_25_21 = findTF(var_25_1, "circle/narrative")

	setText(findTF(var_25_21, "Text"), i18n("tag_level_narrative"))
	setActive(var_25_19, false)
	setActive(var_25_20, false)
	setActive(var_25_21, false)

	local var_25_22
	local var_25_23

	if arg_25_2:getConfig("chapter_tag") == 1 then
		var_25_22 = var_25_21
	end

	if arg_25_2.active then
		var_25_22 = arg_25_2:existOni() and var_25_20 or var_25_19
	end

	if var_25_22 then
		setActive(var_25_22, true)

		local var_25_24 = GetOrAddComponent(var_25_22, "CanvasGroup")

		var_25_24.alpha = 1

		arg_25_0:RecordTween("fighting" .. arg_25_2.id, LeanTween.alphaCanvas(var_25_24, 0, 0.5):setFrom(1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong().uniqueId)
	end

	local var_25_25 = findTF(var_25_1, "triesLimit")
	local var_25_26 = arg_25_2:isTriesLimit()

	setActive(var_25_25, var_25_26)

	if var_25_26 then
		local var_25_27 = arg_25_2:getConfig("count")
		local var_25_28 = var_25_27 - arg_25_2:getTodayDefeatCount() .. "/" .. var_25_27

		setText(var_25_25:Find("label"), i18n("levelScene_chapter_count_tip"))
		setText(var_25_25:Find("Text"), setColorStr(var_25_28, var_25_27 <= arg_25_2:getTodayDefeatCount() and COLOR_RED or COLOR_GREEN))

		local var_25_29 = getProxy(ChapterProxy):IsActivitySPChapterActive() and SettingsProxy.IsShowActivityMapSPTip()

		setActive(var_25_25:Find("TipRect"), var_25_29)
	end

	local var_25_30 = arg_25_2:GetDailyBonusQuota()
	local var_25_31 = findTF(var_25_1, "mark")

	setActive(var_25_31:Find("bonus"), var_25_30)
	setActive(var_25_31, var_25_30)

	if var_25_30 then
		local var_25_32 = var_25_31:GetComponent(typeof(CanvasGroup))
		local var_25_33 = arg_25_0.contextData.map:getConfig("type") == Map.ACTIVITY_HARD and "bonus_us_hard" or "bonus_us"

		arg_25_0.sceneParent.loader:GetSprite("ui/levelmainscene_atlas", var_25_33, var_25_31:Find("bonus"))
		LeanTween.cancel(go(var_25_31), true)

		local var_25_34 = var_25_31.anchoredPosition.y

		var_25_32.alpha = 0

		LeanTween.value(go(var_25_31), 0, 1, 0.2):setOnUpdate(System.Action_float(function(arg_26_0)
			var_25_32.alpha = arg_26_0

			local var_26_0 = var_25_31.anchoredPosition

			var_26_0.y = var_25_34 * arg_26_0
			var_25_31.anchoredPosition = var_26_0
		end)):setOnComplete(System.Action(function()
			var_25_32.alpha = 1

			local var_27_0 = var_25_31.anchoredPosition

			var_27_0.y = var_25_34
			var_25_31.anchoredPosition = var_27_0
		end)):setEase(LeanTweenType.easeOutSine):setDelay(0.7)
	end

	local var_25_35 = arg_25_2.id

	onButton(arg_25_0, var_25_1, function()
		arg_25_0:TryOpenChapterInfo(var_25_35, nil, var_25_4.list)
	end, SFX_UI_WEIGHANCHOR_SELECT)
end

function var_0_0.SwitchChapter(arg_29_0, arg_29_1)
	local var_29_0 = arg_29_0.chapterGroupDict[arg_29_1]

	if not var_29_0 then
		return
	end

	local var_29_1 = var_29_0.list[var_29_0.index]

	if var_29_1 == arg_29_1 then
		return
	end

	local var_29_2 = table.indexof(var_29_0.list, arg_29_1)

	var_29_0.index = var_29_2

	local var_29_3 = var_29_0.list[1]
	local var_29_4 = getProxy(PlayerProxy):getRawData().id

	PlayerPrefs.SetInt("spchapter_selected_" .. var_29_4 .. "_" .. var_29_3, var_29_2)

	local var_29_5 = arg_29_0.chapterTFsById[var_29_1]

	arg_29_0.chapterTFsById[var_29_1] = nil
	arg_29_0.chapterTFsById[arg_29_1] = var_29_5

	arg_29_0:UpdateChapterTF(arg_29_1)
end

function var_0_0.UpdateChapterTF(arg_30_0, arg_30_1)
	if not arg_30_0.chapterGroupDict[arg_30_1] then
		return
	end

	local var_30_0 = arg_30_0.chapterTFsById[arg_30_1]

	if var_30_0 then
		local var_30_1 = getProxy(ChapterProxy):getChapterById(arg_30_1)

		arg_30_0:UpdateMapItem(var_30_0, var_30_1)
	end
end

function var_0_0.RecyclePools(arg_31_0)
	for iter_31_0 = #arg_31_0.activeItems, 1, -1 do
		local var_31_0 = arg_31_0.activeItems[iter_31_0]

		arg_31_0.pools[var_31_0.template]:Enqueue(var_31_0.active)
	end

	table.clean(arg_31_0.activeItems)

	arg_31_0.storyNodeTFsById = {}
end

local var_0_2 = 1
local var_0_3 = 2
local var_0_4 = 3

function var_0_0.UpdateStoryNodeStatus(arg_32_0)
	local var_32_0 = 0
	local var_32_1 = 0
	local var_32_2 = pg.NewStoryMgr.GetInstance()
	local var_32_3 = {}

	table.Foreach(arg_32_0.spStoryIDs, function(arg_33_0)
		var_32_3[arg_33_0] = {}
	end)

	local var_32_4 = {
		arg_32_0.storyTree.root
	}

	while true do
		if not next(var_32_4) then
			break
		end

		local var_32_5 = table.remove(var_32_4, 1)
		local var_32_6 = var_32_5:GetConfigID()
		local var_32_7 = var_32_5:GetPreEvent()
		local var_32_8 = false
		local var_32_9 = var_32_7 == 0 and true or var_32_3[var_32_7].status == var_0_4
		local var_32_10 = var_0_2
		local var_32_11 = var_32_5:GetStoryName()
		local var_32_12 = false

		if var_32_11 and var_32_11 ~= "" then
			var_32_12 = var_32_2:IsPlayed(var_32_11)
			var_32_0 = var_32_0 + (var_32_12 and 1 or 0)
			var_32_1 = var_32_1 + 1
		end

		if not var_32_12 and var_32_9 then
			local var_32_13 = var_32_5:GetUnlockConditions()

			if var_32_13 then
				if var_32_13[1] == ActivitySpStoryNode.CONDITION.TIME then
					var_32_9 = pg.TimeMgr.GetInstance():parseTimeFromConfig(var_32_13[2]) <= pg.TimeMgr.GetInstance():GetServerTime()
				elseif var_32_13[1] == ActivitySpStoryNode.CONDITION.PASSCHAPTER then
					local var_32_14 = var_32_13[2]

					var_32_9 = _.all(var_32_14, function(arg_34_0)
						return getProxy(ChapterProxy):getChapterById(arg_34_0, true):isClear()
					end)
				elseif var_32_13[1] == ActivitySpStoryNode.CONDITION.PT then
					local var_32_15 = var_32_13[2][1]
					local var_32_16 = var_32_13[2][2]
					local var_32_17 = var_32_13[2][3]
					local var_32_18 = 0

					if var_32_15 == DROP_TYPE_RESOURCE then
						var_32_18 = getProxy(PlayerProxy):getRawData():getResource(var_32_13[2])
					elseif var_32_15 == DROP_TYPE_ITEM then
						var_32_18 = getProxy(BagProxy):getItemCountById(var_32_16)
					end

					var_32_9 = var_32_17 <= var_32_18
				end
			end
		end

		if var_32_12 then
			var_32_10 = var_0_4
		elseif var_32_9 then
			var_32_10 = var_0_3
		end

		var_32_3[var_32_6].status = var_32_10

		local var_32_19 = arg_32_0.storyTree.childDict[var_32_6] or {}

		_.each(var_32_19, function(arg_35_0)
			table.insert(var_32_4, arg_35_0)
		end)
	end

	arg_32_0.storyNodeStatus = var_32_3
	arg_32_0.storyReadCount, arg_32_0.storyReadMax = var_32_0, var_32_1
end

function var_0_0.UpdateStory(arg_36_0)
	arg_36_0:RecyclePools()

	local var_36_0 = {
		"162443",
		"ffffff",
		"ffcb5a"
	}
	local var_36_1 = arg_36_0.storyReadCount
	local var_36_2 = arg_36_0.storyReadMax
	local var_36_3 = 0
	local var_36_4 = 150
	local var_36_5 = 150
	local var_36_6 = {
		{
			node = arg_36_0.storyTree.root,
			nodePos = Vector2.New(var_36_4, 0)
		}
	}
	local var_36_7 = arg_36_0.storyNodeTpl.rect.width
	local var_36_8 = arg_36_0.oneLineTpl.rect.width
	local var_36_9 = 75
	local var_36_10 = 32

	while true do
		if not next(var_36_6) then
			break
		end

		local var_36_11 = table.remove(var_36_6, 1)
		local var_36_12 = var_36_11.node
		local var_36_13 = var_36_12:GetConfigID()
		local var_36_14 = arg_36_0.storyNodeStatus[var_36_13].status
		local var_36_15 = arg_36_0.pools[arg_36_0.storyNodeTpl]:Dequeue()

		table.insert(arg_36_0.activeItems, {
			template = arg_36_0.storyNodeTpl,
			active = var_36_15
		})
		setActive(var_36_15, true)
		setParent(var_36_15, arg_36_0.storyContainer)
		setAnchoredPosition(var_36_15, var_36_11.nodePos)

		arg_36_0.storyNodeTFsById[var_36_13] = {
			nodeTF = tf(var_36_15)
		}

		local var_36_16 = arg_36_0.storyTree.childDict[var_36_13] or {}

		table.Ipairs(var_36_16, function(arg_37_0, arg_37_1)
			local var_37_0
			local var_37_1

			if #var_36_16 == 1 then
				local var_37_2 = arg_36_0.pools[arg_36_0.oneLineTpl]:Dequeue()

				table.insert(arg_36_0.activeItems, {
					template = arg_36_0.oneLineTpl,
					active = var_37_2
				})
				setActive(var_37_2, true)
				setParent(var_37_2, arg_36_0.storyContainer)
				setAnchoredPosition(var_37_2, var_36_11.nodePos + Vector2.New(var_36_7 + var_36_10, 0))

				var_37_1 = tf(var_37_2).anchoredPosition + Vector2.New(var_36_8 + var_36_9, 0)

				local var_37_3 = arg_36_0.storyNodeStatus[arg_37_1:GetConfigID()].status

				eachChild(var_37_2, function(arg_38_0)
					setImageColor(arg_38_0, Color.NewHex(var_36_0[var_37_3]))
				end)

				arg_36_0.storyNodeTFsById[var_36_13].lineTF = tf(var_37_2)
			else
				assert(false)
			end

			table.insert(var_36_6, {
				node = arg_37_1,
				nodePos = var_37_1
			})
		end)

		if #var_36_16 == 0 then
			var_36_3 = var_36_11.nodePos.x + var_36_7 + var_36_5
		end

		local var_36_17 = tf(var_36_15)
		local var_36_18 = var_36_17:Find("info/bk/title_form/title")

		if var_36_14 == var_0_2 then
			setScrollText(var_36_18, var_36_12:GetUnlockDesc())
			setTextAlpha(var_36_18, 0.5)
		else
			setScrollText(var_36_18, var_36_12:GetDisplayName())
			setTextAlpha(var_36_18, 1)
		end

		local var_36_19 = var_36_12:GetType()

		setActive(var_36_17:Find("circle/lock"), var_36_14 == var_0_2)

		if var_36_14 == var_0_2 then
			setActive(var_36_17:Find("circle/Story"), false)
			setActive(var_36_17:Find("circle/Battle"), false)
			setText(var_36_17:Find(""))
		elseif var_36_19 == ActivitySpStoryNode.NODE_TYPE.STORY then
			setActive(var_36_17:Find("circle/Story"), var_36_19 == ActivitySpStoryNode.NODE_TYPE.STORY)
			setActive(var_36_17:Find("circle/Battle"), var_36_19 == ActivitySpStoryNode.NODE_TYPE.BATTLE)
			setActive(var_36_17:Find("circle/Story/Done"), var_36_14 == var_0_4)
		elseif var_36_19 == ActivitySpStoryNode.NODE_TYPE.BATTLE then
			setActive(var_36_17:Find("circle/Story"), var_36_19 == ActivitySpStoryNode.NODE_TYPE.STORY)
			setActive(var_36_17:Find("circle/Battle"), var_36_19 == ActivitySpStoryNode.NODE_TYPE.BATTLE)
			setActive(var_36_17:Find("circle/Battle/Done"), var_36_14 == var_0_4)
		end

		local var_36_20 = var_36_14 == var_0_4

		setActive(var_36_17:Find("circle/progress"), var_36_20)
		onButton(arg_36_0, var_36_17, function()
			if var_36_14 == var_0_2 then
				return
			end

			local var_39_0 = var_36_12:GetStoryName()

			arg_36_0:PlayStory(var_39_0, function()
				arg_36_0:UpdateView()

				arg_36_0.needFocusStory = true

				arg_36_0:Move2UnlockStory()
			end, true)
		end)
	end

	setSizeDelta(arg_36_0.storyContainer, {
		x = var_36_3
	})
	setText(arg_36_0.progressText, var_36_1 .. "/" .. var_36_2)
	setActive(arg_36_0.storyAward, tobool(arg_36_0.storyTask))

	if arg_36_0.storyTask then
		local var_36_21 = arg_36_0.storyTask:getConfig("award_display")
		local var_36_22 = Drop.New({
			type = var_36_21[1][1],
			id = var_36_21[1][2],
			count = var_36_21[1][3]
		})

		updateDrop(arg_36_0.storyAward:GetChild(0), var_36_22)

		local var_36_23 = arg_36_0.storyTask:getTaskStatus()

		setActive(arg_36_0.storyAward:Find("get"), var_36_23 == 1)
		setActive(arg_36_0.storyAward:Find("got"), var_36_23 == 2)
		onButton(arg_36_0, arg_36_0.storyAward, function()
			arg_36_0:emit(BaseUI.ON_DROP, var_36_22)
		end)
	end
end

function var_0_0.Move2UnlockStory(arg_42_0)
	if not arg_42_0.needFocusStory then
		return
	end

	arg_42_0.needFocusStory = nil

	local var_42_0 = {
		arg_42_0.storyTree.root
	}
	local var_42_1

	while true do
		if not next(var_42_0) then
			break
		end

		local var_42_2 = table.remove(var_42_0, 1):GetConfigID()

		if arg_42_0.storyNodeStatus[var_42_2].status > var_0_2 then
			var_42_1 = var_42_2

			local var_42_3 = arg_42_0.storyTree.childDict[var_42_2] or {}

			_.each(var_42_3, function(arg_43_0)
				table.insert(var_42_0, arg_43_0)
			end)
		end
	end

	local var_42_4 = arg_42_0.storyNodeTFsById[var_42_1].nodeTF
	local var_42_5 = arg_42_0.storyNodeTpl.rect.width
	local var_42_6 = var_42_4.anchoredPosition.x + var_42_5 * 0.5 - arg_42_0.storyContainer.parent.rect.width * 0.5
	local var_42_7 = math.clamp(var_42_6, 0, math.max(0, arg_42_0.storyContainer.rect.width - arg_42_0.storyContainer.parent.rect.width))

	setAnchoredPosition(arg_42_0.storyContainer, {
		x = -var_42_7
	})
end

function var_0_0.SwitchStoryMapAndBGM(arg_44_0)
	local var_44_0 = {
		arg_44_0.storyTree.root
	}
	local var_44_1 = arg_44_0.activity:getConfig("config_client").default_background
	local var_44_2 = arg_44_0.activity:getConfig("config_client").default_bgm

	while true do
		if not next(var_44_0) then
			break
		end

		local var_44_3 = table.remove(var_44_0, 1)
		local var_44_4 = var_44_3:GetConfigID()

		if arg_44_0.storyNodeStatus[var_44_4].status == var_0_4 then
			var_44_1, var_44_2 = var_44_3:GetCleanBG(), var_44_3:GetCleanBGM()

			local var_44_5 = arg_44_0.storyTree.childDict[var_44_4] or {}

			_.each(var_44_5, function(arg_45_0)
				table.insert(var_44_0, arg_45_0)
			end)
		end
	end

	arg_44_0.sceneParent:SwitchBG({
		{
			bgPrefix = "bg",
			BG = var_44_1
		}
	})
	pg.BgmMgr.GetInstance():Push(arg_44_0.__cname, var_44_2)
end

function var_0_0.TrySubmitTask(arg_46_0)
	local var_46_0 = true

	for iter_46_0, iter_46_1 in ipairs(arg_46_0.spStoryNodes) do
		local var_46_1 = iter_46_1:GetStoryName()

		if var_46_1 and var_46_1 ~= "" then
			var_46_0 = var_46_0 and pg.NewStoryMgr.GetInstance():IsPlayed(var_46_1)
		end

		if not var_46_0 then
			break
		end
	end

	if var_46_0 and arg_46_0.storyTask and arg_46_0.storyTask:getTaskStatus() == 1 then
		arg_46_0:emit(LevelMediator2.ON_SUBMIT_TASK, arg_46_0.storyTask.id)

		return
	end
end

function var_0_0.PlayStory(arg_47_0, arg_47_1, arg_47_2, arg_47_3)
	if not arg_47_1 then
		return existCall(arg_47_2)
	end

	local var_47_0 = pg.NewStoryMgr.GetInstance()
	local var_47_1 = var_47_0:IsPlayed(arg_47_1)

	seriesAsync({
		function(arg_48_0)
			if var_47_1 and not arg_47_3 then
				return arg_48_0()
			end

			local var_48_0 = tonumber(arg_47_1)

			if var_48_0 and var_48_0 > 0 then
				arg_47_0:emit(LevelMediator2.ON_PERFORM_COMBAT, var_48_0)
			else
				var_47_0:Play(arg_47_1, arg_48_0, arg_47_3)
			end
		end,
		function(arg_49_0, ...)
			existCall(arg_47_2, ...)
		end
	})
end

function var_0_0.UpdateStoryTask(arg_50_0)
	local var_50_0 = arg_50_0.activity:getConfig("config_client").task_id

	arg_50_0.storyTask = getProxy(TaskProxy):getTaskVO(var_50_0) or Task.New({
		submit_time = 1,
		id = var_50_0
	})
end

function var_0_0.OnSubmitTaskDone(arg_51_0)
	arg_51_0:UpdateView()
end

function var_0_0.OnDestroy(arg_52_0)
	arg_52_0:RecyclePools()

	for iter_52_0, iter_52_1 in pairs(arg_52_0.pools) do
		iter_52_1:Clear()
	end
end

return var_0_0
