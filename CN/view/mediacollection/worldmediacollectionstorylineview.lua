local var_0_0 = class("WorldMediaCollectionStoryLineView")

var_0_0.START_GAP = 800
var_0_0.END_GAP = 1000
var_0_0.HRZ_GAP = 467
var_0_0.NATION_LIST = {
	{
		key = -1,
		name = "word_shipNation_all"
	},
	{
		key = 1,
		name = "word_shipNation_baiYing"
	},
	{
		key = 2,
		name = "word_shipNation_huangJia"
	},
	{
		key = 3,
		name = "word_shipNation_chongYing"
	},
	{
		key = 4,
		name = "word_shipNation_tieXue"
	},
	{
		key = 5,
		name = "word_shipNation_dongHuang"
	},
	{
		key = 6,
		name = "word_shipNation_saDing"
	},
	{
		key = 7,
		name = "word_shipNation_beiLian"
	},
	{
		key = 10,
		name = "word_shipNation_yuanwei"
	},
	{
		key = 11,
		name = "word_shipNation_yujinwangguo"
	},
	{
		key = 97,
		name = "word_shipNation_meta_index"
	}
}

function var_0_0.Ctor(arg_1_0, arg_1_1)
	pg.DelegateInfo.New(arg_1_0)

	arg_1_0.tf = arg_1_1

	arg_1_0:init()
	arg_1_0:ConfigData()
	arg_1_0:UpdateView()
end

function var_0_0.init(arg_2_0)
	arg_2_0.contentHeight = 0
	arg_2_0.nodeTpl = arg_2_0.tf:Find("Story/NodeTemplate")
	arg_2_0.nodeContainer = arg_2_0.tf:Find("Story/Nodes/Viewport/Content")
	arg_2_0.scroll = arg_2_0.tf:Find("Story/Nodes")

	arg_2_0.scroll:GetComponent(typeof(ScrollRect)).onValueChanged:AddListener(function()
		arg_2_0:onScroll()
	end)

	arg_2_0.progressMark = arg_2_0.tf:Find("ChapterProgress/bg/progressMark")
	arg_2_0.progressCurrentMark = arg_2_0.tf:Find("ChapterProgress/bg/currentMark")
	arg_2_0.linkHrzTpl = arg_2_0.tf:Find("Story/Horizon")
	arg_2_0.linkVrtTpl = arg_2_0.tf:Find("Story/Vertical")

	arg_2_0:initFilter()

	arg_2_0.detailView = arg_2_0.tf:Find("NodeDetail")
	arg_2_0.gotoBtn = arg_2_0.detailView:Find("goto_btn")
	arg_2_0.filterBtn = arg_2_0.tf:Find("Filter")

	onButton(arg_2_0, arg_2_0.filterBtn, function()
		arg_2_0:showFilter()
	end)
	onButton(arg_2_0, arg_2_0.gotoBtn, function()
		arg_2_0:gotoStory()
	end)
	onButton(arg_2_0, arg_2_0.scroll, function()
		arg_2_0:HideNodeDetail()
	end)
end

function var_0_0.initFilter(arg_7_0)
	arg_7_0.filterDict = {}
	arg_7_0.filter = arg_7_0.tf:Find("NodeFilter")
	arg_7_0.filterCancel = arg_7_0.tf:Find("NodeFilter/cancel")
	arg_7_0.filterConfirm = arg_7_0.tf:Find("NodeFilter/confirm")

	onButton(arg_7_0, arg_7_0.filterCancel, function()
		arg_7_0:cancelFilter()
	end)
	onButton(arg_7_0, arg_7_0.filterConfirm, function()
		arg_7_0:confirmFilter()
	end)
	setText(arg_7_0.tf:Find("NodeFilter/label/cn"), i18n("indexsort_camp"))
	setText(arg_7_0.tf:Find("NodeFilter/label/en"), i18n("indexsort_campeng"))

	arg_7_0.filterTFDict = {}

	local var_7_0 = arg_7_0.tf:Find("NodeFilter/content")
	local var_7_1 = arg_7_0.tf:Find("NodeFilter/content/camp")

	for iter_7_0, iter_7_1 in ipairs(var_0_0.NATION_LIST) do
		local var_7_2 = cloneTplTo(var_7_1, var_7_0)

		arg_7_0.filterTFDict[iter_7_1.key] = var_7_2

		setActive(var_7_2, true)
		onButton(arg_7_0, var_7_2, function()
			arg_7_0:updateFilterList(iter_7_1.key)
		end)
		setText(var_7_2:Find("Text"), i18n(iter_7_1.name))
	end

	arg_7_0:updateFilterList(-1)
end

function var_0_0.updateFilterList(arg_11_0, arg_11_1)
	if arg_11_1 == -1 then
		if arg_11_0.filterDict[-1] then
			return
		else
			arg_11_0.filterDict = {
				[-1] = true
			}
		end
	elseif arg_11_0.filterDict[arg_11_1] then
		arg_11_0.filterDict[arg_11_1] = nil
	else
		arg_11_0.filterDict[arg_11_1] = true
	end

	local var_11_0 = true

	for iter_11_0, iter_11_1 in pairs(arg_11_0.filterDict) do
		if iter_11_0 ~= -1 then
			var_11_0 = false

			break
		end
	end

	arg_11_0.filterDict[-1] = var_11_0 and true or nil

	for iter_11_2, iter_11_3 in ipairs(var_0_0.NATION_LIST) do
		setActive(arg_11_0.filterTFDict[iter_11_3.key]:Find("on"), arg_11_0.filterDict[iter_11_3.key])
		setActive(arg_11_0.filterTFDict[iter_11_3.key]:Find("off"), not arg_11_0.filterDict[iter_11_3.key])
	end
end

function var_0_0.ConfigCallback(arg_12_0, arg_12_1, arg_12_2)
	arg_12_0.storyJumpCallback = arg_12_1
	arg_12_0.recordJumpCallback = arg_12_2
end

function var_0_0.ConfigData(arg_13_0)
	arg_13_0.memoryNodeDict = {}

	local var_13_0 = pg.memory_storyline

	for iter_13_0, iter_13_1 in ipairs(var_13_0.all) do
		local var_13_1 = MemoryStoryLineNode.New({
			configId = iter_13_1
		})
		local var_13_2 = var_13_1:GetColumn()

		arg_13_0.memoryNodeDict[var_13_2] = arg_13_0.memoryNodeDict[var_13_2] or {}

		table.insert(arg_13_0.memoryNodeDict[var_13_2], var_13_1)
	end
end

function var_0_0.UpdateView(arg_14_0)
	arg_14_0:updateNodeTree()
	arg_14_0:updateNodeLine()
	arg_14_0:updateChapterProgress()
	arg_14_0:onScroll()
end

function var_0_0.updateChapterProgress(arg_15_0)
	arg_15_0.progressDict = {}
	arg_15_0.chapterProgress = arg_15_0.tf:Find("ChapterProgress")
	arg_15_0.chapterProgressContainer = arg_15_0.chapterProgress:Find("bg")
	arg_15_0.chapterProgressSplit = arg_15_0.chapterProgress:Find("bg/splitTpl")
	arg_15_0.chapterProgressLabel = arg_15_0.chapterProgress:Find("bg/chapterLabelTpl")
	arg_15_0.chapterProgressTotalWidth = rtf(arg_15_0.chapterProgressContainer).rect.width

	local var_15_0 = {}
	local var_15_1 = 0
	local var_15_2 = {}

	for iter_15_0, iter_15_1 in pairs(arg_15_0.nodeDataDict) do
		var_15_1 = var_15_1 + 1

		local var_15_3 = iter_15_1.VO:GetChapter()

		var_15_0[var_15_3] = var_15_0[var_15_3] and var_15_0[var_15_3] + 1 or 1
	end

	for iter_15_2, iter_15_3 in pairs(var_15_0) do
		local var_15_4 = iter_15_3 / var_15_1 * arg_15_0.chapterProgressTotalWidth
		local var_15_5 = {
			w = var_15_4
		}

		if iter_15_2 == 0 then
			var_15_5.x = 0
		else
			local var_15_6 = cloneTplTo(arg_15_0.chapterProgressSplit, arg_15_0.chapterProgressContainer)

			setActive(var_15_6, true)

			var_15_5.x = arg_15_0.progressDict[iter_15_2 - 1].x + arg_15_0.progressDict[iter_15_2 - 1].w
			var_15_6.anchoredPosition = Vector2(var_15_5.x, 2.86)
		end

		var_15_5.leftBound = var_15_5.x
		var_15_5.rightBound = var_15_5.x + var_15_5.w

		local var_15_7 = cloneTplTo(arg_15_0.chapterProgressLabel, arg_15_0.chapterProgressContainer)

		var_15_7.anchoredPosition = Vector2(var_15_5.x, 12)
		rtf(var_15_7).sizeDelta = Vector2(var_15_5.w, 32)

		setText(var_15_7, i18n("storyline_chapter" .. iter_15_2))
		setActive(var_15_7, true)

		arg_15_0.progressDict[iter_15_2] = var_15_5
	end
end

function var_0_0.showFilter(arg_16_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_16_0.filter, false, {
		weight = LayerWeightConst.SECOND_LAYER
	})

	for iter_16_0, iter_16_1 in ipairs(var_0_0.NATION_LIST) do
		setActive(arg_16_0.filterTFDict[iter_16_1.key]:Find("on"), arg_16_0.filterDict[iter_16_1.key])
		setActive(arg_16_0.filterTFDict[iter_16_1.key]:Find("off"), not arg_16_0.filterDict[iter_16_1.key])
	end

	setActive(arg_16_0.filter, true)

	arg_16_0.filterSnapShot = Clone(arg_16_0.filterDict)
end

function var_0_0.cancelFilter(arg_17_0)
	arg_17_0.filterDict = arg_17_0.filterSnapShot

	arg_17_0:closeFilter()
end

function var_0_0.confirmFilter(arg_18_0)
	arg_18_0:updateNodes()
	arg_18_0:closeFilter()
end

function var_0_0.closeFilter(arg_19_0)
	pg.UIMgr.GetInstance():UnblurPanel(arg_19_0.filter, arg_19_0.tf)

	arg_19_0.filterSnapShot = nil

	setActive(arg_19_0.filter, false)
end

function var_0_0.refresh(arg_20_0)
	arg_20_0.selectedID = nil

	arg_20_0:closeFilter()
	arg_20_0:HideNodeDetail()
	scrollTo(arg_20_0.scroll, 0)
end

function var_0_0.ShowNodeDetail(arg_21_0, arg_21_1)
	if arg_21_0.selectedID then
		local var_21_0 = arg_21_0.nodeDataDict[arg_21_0.selectedID].nodeTF

		setActive(var_21_0:Find("info/selected"), false)
		setActive(var_21_0:Find("info/selected_multi"), false)
	end

	arg_21_0.selectedID = arg_21_1

	local var_21_1 = arg_21_0.nodeDataDict[arg_21_1].VO

	setActive(arg_21_0.detailView, true)
	quickPlayAnimation(arg_21_0.detailView, "anim_WorldMediaCollectionMemoryGroupUI_NodeDetail_enter")
	setText(arg_21_0.detailView:Find("info/title"), var_21_1:GetName())
	setText(arg_21_0.detailView:Find("info/desc"), var_21_1:GetDesc())
	LoadImageSpriteAsync("memorystoryline/" .. var_21_1:GetIcon(), arg_21_0.detailView:Find("info/icon"), true)
	LoadImageSpriteAtlasAsync("ui/worldmediacollectionmemoryui_atlas", var_21_1:GetMark(), arg_21_0.detailView:Find("info/icon/mark"), true)

	local var_21_2 = arg_21_0.detailView:Find("camp/nations")
	local var_21_3 = var_21_1:GetNations()

	eachChild(var_21_2, function(arg_22_0)
		local var_22_0 = tonumber(arg_22_0.name)

		setActive(arg_22_0, table.contains(var_21_3, var_22_0))
		setActive(arg_22_0:Find("filter"), arg_21_0.filterDict[var_22_0])
	end)

	local var_21_4 = arg_21_0.nodeDataDict[arg_21_1].nodeTF
	local var_21_5 = false

	for iter_21_0, iter_21_1 in pairs(arg_21_0.filterDict) do
		if table.contains(var_21_3, iter_21_0) then
			var_21_5 = true

			break
		end
	end

	if var_21_5 then
		setActive(var_21_4:Find("info/selected_multi"), true)
	else
		setActive(var_21_4:Find("info/selected"), true)
	end

	local var_21_6 = (var_21_4.anchoredPosition.x - var_0_0.START_GAP) / arg_21_0.contentWidth

	scrollTo(arg_21_0.scroll, var_21_6)
	arg_21_0:TryPlayBGM()
end

function var_0_0.TryPlayBGM(arg_23_0)
	if arg_23_0.selectedID then
		local var_23_0 = arg_23_0.nodeDataDict[arg_23_0.selectedID].VO

		pg.BgmMgr.GetInstance():TempPlay(var_23_0:GetBGM())
	end
end

function var_0_0.HideNodeDetail(arg_24_0)
	if arg_24_0.selectedID then
		local var_24_0 = arg_24_0.nodeDataDict[arg_24_0.selectedID].nodeTF

		setActive(var_24_0:Find("info/selected"), false)
		setActive(var_24_0:Find("info/selected_multi"), false)
		quickPlayAnimation(arg_24_0.detailView, "anim_WorldMediaCollectionMemoryGroupUI_NodeDetail_quit")

		arg_24_0.selectedID = false

		pg.BgmMgr.GetInstance():ContinuePlay()
	end
end

function var_0_0.onScroll(arg_25_0)
	local var_25_0 = Mathf.Clamp(-arg_25_0.nodeContainer.anchoredPosition.x / arg_25_0.contentWidth, 0, 1)
	local var_25_1 = arg_25_0.progressMark.anchoredPosition

	var_25_1.x = var_25_0 * arg_25_0.chapterProgressTotalWidth
	arg_25_0.progressMark.anchoredPosition = var_25_1

	local var_25_2 = 0

	for iter_25_0, iter_25_1 in pairs(arg_25_0.progressDict) do
		if var_25_1.x >= iter_25_1.leftBound and var_25_1.x <= iter_25_1.rightBound then
			var_25_2 = iter_25_0
		end
	end

	arg_25_0:updateCurrentChapterMark(var_25_2)

	local var_25_3 = -math.modf(arg_25_0.nodeContainer.anchoredPosition.x / var_0_0.HRZ_GAP) + 1
	local var_25_4
	local var_25_5

	for iter_25_2 = var_25_3 - 2, var_25_3 + 2 do
		for iter_25_3, iter_25_4 in ipairs(arg_25_0.nodeDataDict) do
			if iter_25_2 == iter_25_4.col then
				if iter_25_4.row == 2 then
					var_25_4 = true
				elseif iter_25_4.row == -1 then
					var_25_5 = true
				end
			end
		end
	end

	local var_25_6

	if var_25_4 and not var_25_5 then
		var_25_6 = 254
	elseif not var_25_4 then
		var_25_6 = 0
	elseif var_25_4 and var_25_5 then
		var_25_6 = 115
	end

	if var_25_6 ~= arg_25_0.contentHeight then
		arg_25_0.contentHeight = var_25_6

		if LeanTween.isTweening(arg_25_0.nodeContainer.gameObject) then
			LeanTween.cancel(arg_25_0.nodeContainer.gameObject)
		end

		LeanTween.moveY(rtf(arg_25_0.nodeContainer), var_25_6, 0.5)
	end
end

function var_0_0.updateCurrentChapterMark(arg_26_0, arg_26_1)
	if arg_26_0.currentChapter ~= arg_26_1 then
		local var_26_0 = arg_26_0.progressDict[arg_26_1]
		local var_26_1 = rtf(arg_26_0.progressCurrentMark).rect

		arg_26_0.progressCurrentMark.sizeDelta = Vector2(var_26_0.w, var_26_1.height)

		local var_26_2 = arg_26_0.progressCurrentMark.anchoredPosition

		var_26_2.x = var_26_0.x
		arg_26_0.progressCurrentMark.anchoredPosition = var_26_2
	end

	arg_26_0.currentChapter = arg_26_1
end

function var_0_0.gotoStory(arg_27_0)
	pg.BgmMgr.GetInstance():ContinuePlay()

	local var_27_0 = arg_27_0.nodeDataDict[arg_27_0.selectedID].VO
	local var_27_1 = var_27_0:GetMemoryID()
	local var_27_2 = var_27_0:GetWorldID()

	if var_27_1 ~= "" then
		local var_27_3
		local var_27_4

		if var_27_1[1] == 1 then
			var_27_3 = var_27_1[2]
		elseif var_27_1[1] == 2 then
			var_27_4 = var_27_1[2][1]

			for iter_27_0, iter_27_1 in pairs(pg.memory_group) do
				if table.contains(iter_27_1.memories, var_27_4) then
					var_27_3 = iter_27_0

					break
				end
			end
		end

		arg_27_0.storyJumpCallback(pg.memory_group[var_27_3], var_27_4)
	elseif var_27_2 ~= "" then
		local var_27_5
		local var_27_6

		if var_27_2[1] == 1 then
			var_27_5 = var_27_2[2]
		elseif var_27_2[1] == 2 then
			var_27_6 = var_27_2[2][1]

			for iter_27_2, iter_27_3 in pairs(pg.world_collection_record_group) do
				if table.contains(iter_27_3.child, var_27_6) then
					var_27_5 = iter_27_2

					break
				end
			end
		end

		arg_27_0.recordJumpCallback(var_27_5, var_27_6, arg_27_0.selectedID)
	end
end

function var_0_0.updateNodes(arg_28_0)
	for iter_28_0, iter_28_1 in pairs(arg_28_0.nodeDataDict) do
		local var_28_0 = iter_28_1.nodeTF
		local var_28_1 = iter_28_1.VO:GetNations()
		local var_28_2 = false

		for iter_28_2, iter_28_3 in pairs(arg_28_0.filterDict) do
			if table.contains(var_28_1, iter_28_2) then
				var_28_2 = true

				break
			end
		end

		setActive(var_28_0:Find("info/selected_filter"), var_28_2)
	end

	if arg_28_0.selectedID then
		local var_28_3 = arg_28_0.nodeDataDict[arg_28_0.selectedID]
		local var_28_4 = var_28_3.nodeTF
		local var_28_5 = var_28_3.VO:GetNations()
		local var_28_6 = false

		for iter_28_4, iter_28_5 in pairs(arg_28_0.filterDict) do
			if table.contains(var_28_5, iter_28_4) then
				var_28_6 = true

				break
			end
		end

		if var_28_6 then
			setActive(var_28_4:Find("info/selected_multi"), true)
			setActive(var_28_4:Find("info/selected"), false)
		else
			setActive(var_28_4:Find("info/selected_multi"), false)
			setActive(var_28_4:Find("info/selected"), true)
		end

		local var_28_7 = arg_28_0.detailView:Find("camp/nations")

		eachChild(var_28_7, function(arg_29_0)
			local var_29_0 = tonumber(arg_29_0.name)

			setActive(arg_29_0, table.contains(var_28_5, var_29_0))
			setActive(arg_29_0:Find("filter"), arg_28_0.filterDict[var_29_0])
		end)
	end
end

function var_0_0.updateNodeTree(arg_30_0)
	arg_30_0.nodeDataDict = {}
	arg_30_0.nodeMap = {}

	local var_30_0
	local var_30_1
	local var_30_2

	for iter_30_0, iter_30_1 in pairs(arg_30_0.memoryNodeDict) do
		for iter_30_2, iter_30_3 in ipairs(iter_30_1) do
			local var_30_3 = {}
			local var_30_4 = cloneTplTo(arg_30_0.nodeTpl, arg_30_0.nodeContainer)

			setActive(var_30_4, true)
			LoadImageSpriteAsync("memorystoryline/" .. iter_30_3:GetIcon(), var_30_4:Find("info/icon"), true)
			setText(var_30_4:Find("info/name"), iter_30_3:GetName())

			var_30_1 = var_0_0.START_GAP + (iter_30_0 - 1) * var_0_0.HRZ_GAP

			local var_30_5 = iter_30_3:GetRow()
			local var_30_6 = -var_30_5 * 254

			var_30_4.anchoredPosition = Vector2(var_30_1, var_30_6)
			var_30_0 = var_30_1 + var_0_0.END_GAP
			var_30_3.nodeTF = var_30_4
			var_30_3.row = var_30_5
			var_30_3.col = iter_30_0
			var_30_3.linkData = {}
			var_30_3.VO = iter_30_3
			arg_30_0.nodeMap[iter_30_0] = arg_30_0.nodeMap[iter_30_0] or {}
			arg_30_0.nodeMap[iter_30_0][var_30_5] = true

			LoadImageSpriteAtlasAsync("ui/worldmediacollectionmemoryui_atlas", iter_30_3:GetMark(), var_30_4:Find("info/mark"))
			onButton(arg_30_0, var_30_4, function()
				arg_30_0:ShowNodeDetail(iter_30_3:GetConfigID())
			end)

			arg_30_0.nodeDataDict[iter_30_3:GetConfigID()] = var_30_3
		end
	end

	arg_30_0.nodeTail = arg_30_0.tf:Find("Story/NodeTail")

	arg_30_0.nodeTail:SetParent(arg_30_0.nodeContainer, true)

	arg_30_0.nodeTail.anchoredPosition = Vector2(var_30_1 + var_0_0.HRZ_GAP, 0)

	setActive(arg_30_0.nodeTail, true)

	local var_30_7 = tf(Instantiate(arg_30_0.linkHrzTpl))

	setActive(var_30_7, true)
	var_30_7:SetParent(arg_30_0.nodeTail, false)

	var_30_7.anchoredPosition = Vector2(-283.5, 0)

	arg_30_0:sortLinkData()

	local var_30_8 = arg_30_0.nodeContainer.sizeDelta

	var_30_8.x = var_30_0
	arg_30_0.nodeContainer.sizeDelta = var_30_8
	arg_30_0.contentWidth = rtf(arg_30_0.nodeContainer).rect.width - rtf(arg_30_0.scroll).rect.width
end

function var_0_0.sortLinkData(arg_32_0)
	for iter_32_0, iter_32_1 in pairs(arg_32_0.nodeDataDict) do
		if type(iter_32_1.VO:GetLinkEvent()) == "table" then
			for iter_32_2, iter_32_3 in ipairs(iter_32_1.VO:GetLinkEvent()) do
				local var_32_0 = arg_32_0.nodeDataDict[iter_32_3].linkData

				if arg_32_0.nodeDataDict[iter_32_3].col < iter_32_1.col then
					if not table.contains(var_32_0, iter_32_0) then
						table.insert(var_32_0, iter_32_0)
					end
				else
					table.insert(iter_32_1.linkData, iter_32_3)
				end
			end
		end
	end
end

function var_0_0.updateNodeLine(arg_33_0)
	for iter_33_0, iter_33_1 in pairs(arg_33_0.nodeDataDict) do
		local var_33_0 = iter_33_1.VO:GetColumn()

		for iter_33_2, iter_33_3 in ipairs(iter_33_1.linkData) do
			local var_33_1 = arg_33_0.nodeDataDict[iter_33_3]

			if var_33_1.VO:GetColumn() == var_33_0 then
				arg_33_0:linkVRTLine(iter_33_1, var_33_1)
			elseif iter_33_1.row == var_33_1.row then
				arg_33_0:linkHRZLine(iter_33_1, var_33_1)
			else
				arg_33_0:linkBranchLine(iter_33_1, var_33_1)
			end
		end
	end
end

var_0_0.VRT_LINE_POS = Vector2(0, -150)

function var_0_0.linkVRTLine(arg_34_0, arg_34_1, arg_34_2)
	local var_34_0 = arg_34_1.row < arg_34_2.row and arg_34_1 or arg_34_2
	local var_34_1

	var_34_1 = var_34_0 == arg_34_1 and arg_34_2 or arg_34_1

	local var_34_2 = tf(Instantiate(arg_34_0.linkVrtTpl))

	setActive(var_34_2, true)
	var_34_2:SetParent(var_34_0.nodeTF, false)

	var_34_2.anchoredPosition = var_0_0.VRT_LINE_POS
end

var_0_0.HRZ_LINE_POS = Vector2(185, 0)

function var_0_0.linkHRZLine(arg_35_0, arg_35_1, arg_35_2)
	local var_35_0 = arg_35_1.VO:GetColumn() < arg_35_2.VO:GetColumn() and arg_35_1 or arg_35_2
	local var_35_1

	var_35_1 = var_35_0 == arg_35_1 and arg_35_2 or arg_35_1

	local var_35_2 = tf(Instantiate(arg_35_0.linkHrzTpl))

	setActive(var_35_2, true)
	var_35_2:SetParent(var_35_0.nodeTF, false)

	var_35_2.anchoredPosition = var_0_0.HRZ_LINE_POS
end

var_0_0.UP_POS = Vector2(-3.5, 100)
var_0_0.DOWN_POS = Vector2(0, -105)
var_0_0.RIGHT_POS = Vector2(185, 0)

function var_0_0.linkBranchLine(arg_36_0, arg_36_1, arg_36_2)
	local var_36_0
	local var_36_1
	local var_36_2
	local var_36_3 = arg_36_1.VO:GetColumn()
	local var_36_4 = arg_36_2.VO:GetColumn()
	local var_36_5 = arg_36_1.row
	local var_36_6 = arg_36_2.row
	local var_36_7 = "Right"
	local var_36_8 = var_36_6 < var_36_5 and "Up" or "Down"

	if not arg_36_0.nodeMap[var_36_3 + 1][var_36_5] then
		var_36_2 = var_36_7 .. var_36_8
		var_36_1 = var_0_0.RIGHT_POS
	elseif var_36_6 < var_36_5 and not arg_36_0.nodeMap[var_36_3][var_36_5 - 1] or var_36_5 < var_36_6 and not arg_36_0.nodeMap[var_36_3][var_36_5 + 1] then
		var_36_2 = var_36_8 .. var_36_7
		var_36_1 = var_36_6 < var_36_5 and var_0_0.UP_POS or var_0_0.DOWN_POS
	else
		var_36_2 = var_36_7 .. var_36_8 .. "Lite"
		var_36_1 = var_0_0.RIGHT_POS
	end

	var_36_2 = math.abs(var_36_5 - var_36_6) == 2 and var_36_2 .. "Extend" or var_36_2

	local var_36_9 = Instantiate(arg_36_0.tf:Find("Story/" .. var_36_2))
	local var_36_10 = tf(var_36_9)

	setActive(var_36_10, true)
	var_36_10:SetParent(arg_36_1.nodeTF, false)

	var_36_10.anchoredPosition = var_36_1
end

function var_0_0.Dispose(arg_37_0)
	pg.DelegateInfo.Dispose(arg_37_0)

	if LeanTween.isTweening(arg_37_0.nodeContainer.gameObject) then
		LeanTween.cancel(arg_37_0.nodeContainer.gameObject)
	end
end

return var_0_0
