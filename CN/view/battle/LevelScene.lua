local var_0_0 = class("LevelScene", import("..base.BaseUI"))
local var_0_1 = 0.5
local var_0_2 = 1
local var_0_3 = 2
local var_0_4 = 3

function var_0_0.forceGC(arg_1_0)
	return true
end

function var_0_0.getUIName(arg_2_0)
	return "LevelMainScene"
end

function var_0_0.ResUISettings(arg_3_0)
	return {
		showType = PlayerResUI.TYPE_ALL,
		groupName = LayerWeightConst.GROUP_LEVELUI
	}
end

function var_0_0.getBGM(arg_4_0)
	local function var_4_0()
		return checkExist(arg_4_0.contextData.chapterVO, {
			"getConfig",
			{
				"bgm"
			}
		}) or ""
	end

	local function var_4_1()
		if not arg_4_0.contextData.map then
			return
		end

		local var_6_0 = arg_4_0.contextData.map:getConfig("ani_controller")

		if var_6_0 and #var_6_0 > 0 then
			for iter_6_0, iter_6_1 in ipairs(var_6_0) do
				local var_6_1 = _.rest(iter_6_1[2], 2)

				for iter_6_2, iter_6_3 in ipairs(var_6_1) do
					if string.find(iter_6_3, "^bgm_") and iter_6_1[1] == var_0_3 then
						local var_6_2 = iter_6_1[2][1]
						local var_6_3 = getProxy(ChapterProxy):GetChapterItemById(var_6_2)

						if var_6_3 and not var_6_3:isClear() then
							return string.sub(iter_6_3, 5)
						end
					end
				end
			end
		end

		return checkExist(arg_4_0.contextData.map, {
			"getConfig",
			{
				"bgm"
			}
		}) or ""
	end

	for iter_4_0, iter_4_1 in ipairs({
		var_4_0(),
		var_4_1()
	}) do
		if iter_4_1 ~= "" then
			return iter_4_1
		end
	end

	return var_0_0.super.getBGM(arg_4_0)
end

var_0_0.optionsPath = {
	"top/top_chapter/option"
}

function var_0_0.preload(arg_7_0, arg_7_1)
	local var_7_0 = getProxy(ChapterProxy)

	if arg_7_0.contextData.mapIdx and arg_7_0.contextData.chapterId then
		local var_7_1 = var_7_0:getChapterById(arg_7_0.contextData.chapterId)

		if var_7_1:getConfig("map") == arg_7_0.contextData.mapIdx then
			arg_7_0.contextData.chapterVO = var_7_1

			if var_7_1.active then
				assert(not arg_7_0.contextData.openChapterId or arg_7_0.contextData.openChapterId == arg_7_0.contextData.chapterId)

				arg_7_0.contextData.openChapterId = nil
			end
		end
	end

	local var_7_2, var_7_3 = arg_7_0:GetInitializeMap()

	if arg_7_0.contextData.entranceStatus == nil then
		arg_7_0.contextData.entranceStatus = not var_7_3
	end

	if not arg_7_0.contextData.entranceStatus then
		arg_7_0:PreloadLevelMainUI(var_7_2, arg_7_1)
	else
		arg_7_1()
	end
end

function var_0_0.GetInitializeMap(arg_8_0)
	local var_8_0 = (function()
		local var_9_0 = arg_8_0.contextData.chapterVO

		if var_9_0 and var_9_0.active then
			return var_9_0:getConfig("map")
		end

		local var_9_1 = arg_8_0.contextData.mapIdx

		if var_9_1 then
			return var_9_1
		end

		local var_9_2

		if arg_8_0.contextData.targetChapter and arg_8_0.contextData.targetMap then
			arg_8_0.contextData.openChapterId = arg_8_0.contextData.targetChapter
			var_9_2 = arg_8_0.contextData.targetMap.id
			arg_8_0.contextData.targetChapter = nil
			arg_8_0.contextData.targetMap = nil
		elseif arg_8_0.contextData.eliteDefault then
			local var_9_3 = getProxy(ChapterProxy):getUseableMaxEliteMap()

			var_9_2 = var_9_3 and var_9_3.id or nil
			arg_8_0.contextData.eliteDefault = nil
		end

		return var_9_2
	end)()
	local var_8_1 = var_8_0 and getProxy(ChapterProxy):getMapById(var_8_0)

	if var_8_1 then
		local var_8_2, var_8_3 = var_8_1:isUnlock()

		if not var_8_2 then
			pg.TipsMgr.GetInstance():ShowTips(var_8_3)

			var_8_0 = getProxy(ChapterProxy):getLastUnlockMap().id
			arg_8_0.contextData.mapIdx = var_8_0
		end
	else
		var_8_0 = nil
	end

	return var_8_0 or arg_8_0:selectMap(), tobool(var_8_0)
end

function var_0_0.init(arg_10_0)
	arg_10_0:initData()
	arg_10_0:initUI()
	arg_10_0:initEvents()
	arg_10_0:updateClouds()
end

function var_0_0.initData(arg_11_0)
	arg_11_0.tweens = {}
	arg_11_0.mapWidth = 1920
	arg_11_0.mapHeight = 1440
	arg_11_0.levelCamIndices = 1
	arg_11_0.frozenCount = 0
	arg_11_0.currentBG = nil
	arg_11_0.mbDict = {}
	arg_11_0.mapGroup = {}

	if not arg_11_0.contextData.huntingRangeVisibility then
		arg_11_0.contextData.huntingRangeVisibility = 2
	end
end

function var_0_0.initUI(arg_12_0)
	arg_12_0.topPanel = arg_12_0:findTF("top")
	arg_12_0.canvasGroup = arg_12_0.topPanel:GetComponent("CanvasGroup")
	arg_12_0.canvasGroup.blocksRaycasts = not arg_12_0.canvasGroup.blocksRaycasts
	arg_12_0.canvasGroup.blocksRaycasts = not arg_12_0.canvasGroup.blocksRaycasts
	arg_12_0.entranceLayer = arg_12_0:findTF("entrance")
	arg_12_0.ptBonus = EventPtBonus.New(arg_12_0.entranceLayer:Find("btns/btn_task/bonusPt"))
	arg_12_0.entranceBg = arg_12_0:findTF("entrance_bg")
	arg_12_0.topChapter = arg_12_0:findTF("top_chapter", arg_12_0.topPanel)

	setActive(arg_12_0.topChapter:Find("title_chapter"), false)
	setActive(arg_12_0.topChapter:Find("type_chapter"), false)
	setActive(arg_12_0.topChapter:Find("type_escort"), false)
	setActive(arg_12_0.topChapter:Find("type_skirmish"), false)

	arg_12_0.chapterName = arg_12_0:findTF("title_chapter/name", arg_12_0.topChapter)
	arg_12_0.chapterNoTitle = arg_12_0:findTF("title_chapter/chapter", arg_12_0.topChapter)
	arg_12_0.resChapter = arg_12_0:findTF("resources", arg_12_0.topChapter)

	setActive(arg_12_0.topChapter, true)

	arg_12_0._voteBookBtn = arg_12_0.topChapter:Find("vote_book")
	arg_12_0.leftChapter = arg_12_0:findTF("main/left_chapter")

	setActive(arg_12_0.leftChapter, true)

	arg_12_0.leftCanvasGroup = arg_12_0.leftChapter:GetComponent(typeof(CanvasGroup))
	arg_12_0.btnPrev = arg_12_0:findTF("btn_prev", arg_12_0.leftChapter)
	arg_12_0.btnPrevCol = arg_12_0:findTF("btn_prev/prev_image", arg_12_0.leftChapter)
	arg_12_0.eliteBtn = arg_12_0:findTF("buttons/btn_elite", arg_12_0.leftChapter)
	arg_12_0.normalBtn = arg_12_0:findTF("buttons/btn_normal", arg_12_0.leftChapter)
	arg_12_0.actNormalBtn = arg_12_0:findTF("buttons/btn_act_normal", arg_12_0.leftChapter)
	arg_12_0.actEliteBtn = arg_12_0:findTF("buttons/btn_act_elite", arg_12_0.leftChapter)
	arg_12_0.actExtraBtn = arg_12_0:findTF("buttons/btn_act_extra", arg_12_0.leftChapter)
	arg_12_0.actExtraBtnAnim = arg_12_0:findTF("usm", arg_12_0.actExtraBtn)
	arg_12_0.remasterBtn = arg_12_0:findTF("buttons/btn_remaster", arg_12_0.leftChapter)
	arg_12_0.escortBar = arg_12_0:findTF("escort_bar", arg_12_0.leftChapter)
	arg_12_0.eliteQuota = arg_12_0:findTF("elite_quota", arg_12_0.leftChapter)
	arg_12_0.skirmishBar = arg_12_0:findTF("left_times", arg_12_0.leftChapter)
	arg_12_0.mainLayer = arg_12_0:findTF("main")

	setActive(arg_12_0.mainLayer:Find("title_chapter_lines"), false)

	arg_12_0.rightChapter = arg_12_0:findTF("main/right_chapter")
	arg_12_0.rightCanvasGroup = arg_12_0.rightChapter:GetComponent(typeof(CanvasGroup))
	arg_12_0.eventContainer = arg_12_0:findTF("event_btns/event_container", arg_12_0.rightChapter)
	arg_12_0.btnSpecial = arg_12_0:findTF("btn_task", arg_12_0.eventContainer)
	arg_12_0.challengeBtn = arg_12_0:findTF("btn_challenge", arg_12_0.eventContainer)
	arg_12_0.dailyBtn = arg_12_0:findTF("btn_daily", arg_12_0.eventContainer)
	arg_12_0.militaryExerciseBtn = arg_12_0:findTF("btn_pvp", arg_12_0.eventContainer)
	arg_12_0.activityBtn = arg_12_0:findTF("event_btns/activity_btn", arg_12_0.rightChapter)
	arg_12_0.ptTotal = arg_12_0:findTF("event_btns/pt_text", arg_12_0.rightChapter)
	arg_12_0.ticketTxt = arg_12_0:findTF("event_btns/tickets/Text", arg_12_0.rightChapter)
	arg_12_0.remasterAwardBtn = arg_12_0:findTF("btn_remaster_award", arg_12_0.rightChapter)
	arg_12_0.btnNext = arg_12_0:findTF("btn_next", arg_12_0.rightChapter)
	arg_12_0.btnNextCol = arg_12_0:findTF("btn_next/next_image", arg_12_0.rightChapter)
	arg_12_0.countDown = arg_12_0:findTF("event_btns/count_down", arg_12_0.rightChapter)

	setActive(arg_12_0:findTF("event_btns/BottomList", arg_12_0.rightChapter), true)

	arg_12_0.actExchangeShopBtn = arg_12_0:findTF("event_btns/BottomList/btn_exchange", arg_12_0.rightChapter)
	arg_12_0.actAtelierBuffBtn = arg_12_0:findTF("event_btns/BottomList/btn_control_center", arg_12_0.rightChapter)
	arg_12_0.actExtraRank = arg_12_0:findTF("event_btns/BottomList/act_extra_rank", arg_12_0.rightChapter)

	setActive(arg_12_0.rightChapter, true)

	arg_12_0.damageTextTemplate = go(arg_12_0:findTF("damage", arg_12_0.topPanel))

	setActive(arg_12_0.damageTextTemplate, false)

	arg_12_0.damageTextPool = {
		arg_12_0.damageTextTemplate
	}
	arg_12_0.damageTextActive = {}
	arg_12_0.mapHelpBtn = arg_12_0:findTF("help_button", arg_12_0.topPanel)
	arg_12_0.avoidText = arg_12_0:findTF("text_avoid", arg_12_0.topPanel)
	arg_12_0.commanderTinkle = arg_12_0:findTF("neko_tinkle", arg_12_0.topPanel)

	setActive(arg_12_0.commanderTinkle, false)

	arg_12_0.spResult = arg_12_0:findTF("sp_result", arg_12_0.topPanel)

	setActive(arg_12_0.spResult, false)

	arg_12_0.helpPage = arg_12_0:findTF("help_page", arg_12_0.topPanel)
	arg_12_0.helpImage = arg_12_0:findTF("icon", arg_12_0.helpPage)

	setActive(arg_12_0.helpPage, false)

	arg_12_0.curtain = arg_12_0:findTF("curtain", arg_12_0.topPanel)

	setActive(arg_12_0.curtain, false)

	arg_12_0.map = arg_12_0:findTF("maps")
	arg_12_0.mapTFs = {
		arg_12_0:findTF("maps/map1"),
		arg_12_0:findTF("maps/map2")
	}

	for iter_12_0, iter_12_1 in ipairs(arg_12_0.mapTFs) do
		iter_12_1:GetComponent(typeof(Image)).enabled = false
	end

	local var_12_0 = arg_12_0.map:GetComponent(typeof(AspectRatioFitter))

	var_12_0.aspectRatio, var_12_0.aspectRatio = var_12_0.aspectRatio, 1
	arg_12_0.UIFXList = arg_12_0:findTF("maps/UI_FX_list")

	local var_12_1 = arg_12_0.UIFXList:GetComponentsInChildren(typeof(Renderer))

	for iter_12_2 = 0, var_12_1.Length - 1 do
		var_12_1[iter_12_2].sortingOrder = -1
	end

	local var_12_2 = pg.UIMgr.GetInstance()

	arg_12_0.levelCam = var_12_2.levelCamera:GetComponent(typeof(Camera))
	arg_12_0.uiMain = var_12_2.LevelMain

	setActive(arg_12_0.uiMain, false)

	arg_12_0.uiCam = var_12_2.uiCamera:GetComponent(typeof(Camera))
	arg_12_0.levelGrid = arg_12_0.uiMain:Find("LevelGrid")

	setActive(arg_12_0.levelGrid, true)

	arg_12_0.dragLayer = arg_12_0.levelGrid:Find("DragLayer")
	arg_12_0.float = arg_12_0:findTF("float")
	arg_12_0.clouds = arg_12_0:findTF("clouds", arg_12_0.float)

	setActive(arg_12_0.clouds, true)
	setActive(arg_12_0.float:Find("levels"), false)

	arg_12_0.resources = arg_12_0:findTF("resources"):GetComponent("ItemList")
	arg_12_0.arrowTarget = arg_12_0.resources.prefabItem[0]
	arg_12_0.destinationMarkTpl = arg_12_0.resources.prefabItem[1]
	arg_12_0.championTpl = arg_12_0.resources.prefabItem[3]
	arg_12_0.deadTpl = arg_12_0.resources.prefabItem[4]
	arg_12_0.enemyTpl = Instantiate(arg_12_0.resources.prefabItem[5])
	arg_12_0.oniTpl = arg_12_0.resources.prefabItem[6]
	arg_12_0.shipTpl = arg_12_0.resources.prefabItem[8]
	arg_12_0.subTpl = arg_12_0.resources.prefabItem[9]
	arg_12_0.transportTpl = arg_12_0.resources.prefabItem[11]

	setText(arg_12_0:findTF("fighting/Text", arg_12_0.enemyTpl), i18n("ui_word_levelui2_inevent"))
	arg_12_0:HideBtns()
	setAnchoredPosition(arg_12_0.topChapter, {
		y = 0
	})
	setAnchoredPosition(arg_12_0.leftChapter, {
		x = 0
	})
	setAnchoredPosition(arg_12_0.rightChapter, {
		x = 0
	})

	arg_12_0.bubbleMsgBoxes = {}
	arg_12_0.loader = AutoLoader.New()
	arg_12_0.levelFleetView = LevelFleetView.New(arg_12_0.topPanel, arg_12_0.event, arg_12_0.contextData)
	arg_12_0.levelInfoView = LevelInfoView.New(arg_12_0.topPanel, arg_12_0.event, arg_12_0.contextData)

	arg_12_0:buildCommanderPanel()

	arg_12_0.levelRemasterView = LevelRemasterView.New(arg_12_0.topPanel, arg_12_0.event, arg_12_0.contextData)

	arg_12_0:SwitchMapBuilder(MapBuilder.TYPENORMAL)
end

function var_0_0.initEvents(arg_13_0)
	arg_13_0:bind(LevelUIConst.OPEN_COMMANDER_PANEL, function(arg_14_0, arg_14_1, arg_14_2, arg_14_3)
		arg_13_0:openCommanderPanel(arg_14_1, arg_14_2, arg_14_3)
	end)
	arg_13_0:bind(LevelUIConst.HANDLE_SHOW_MSG_BOX, function(arg_15_0, arg_15_1)
		arg_13_0:HandleShowMsgBox(arg_15_1)
	end)
	arg_13_0:bind(LevelUIConst.DO_AMBUSH_WARNING, function(arg_16_0, arg_16_1)
		arg_13_0:doAmbushWarning(arg_16_1)
	end)
	arg_13_0:bind(LevelUIConst.DISPLAY_AMBUSH_INFO, function(arg_17_0, arg_17_1)
		arg_13_0:displayAmbushInfo(arg_17_1)
	end)
	arg_13_0:bind(LevelUIConst.DISPLAY_STRATEGY_INFO, function(arg_18_0, arg_18_1)
		arg_13_0:displayStrategyInfo(arg_18_1)
	end)
	arg_13_0:bind(LevelUIConst.FROZEN, function(arg_19_0)
		arg_13_0:frozen()
	end)
	arg_13_0:bind(LevelUIConst.UN_FROZEN, function(arg_20_0)
		arg_13_0:unfrozen()
	end)
	arg_13_0:bind(LevelUIConst.DO_TRACKING, function(arg_21_0, arg_21_1)
		arg_13_0:doTracking(arg_21_1)
	end)
	arg_13_0:bind(LevelUIConst.SWITCH_TO_MAP, function()
		if arg_13_0:isfrozen() then
			return
		end

		arg_13_0:switchToMap()
	end)
	arg_13_0:bind(LevelUIConst.DISPLAY_REPAIR_WINDOW, function(arg_23_0, arg_23_1)
		arg_13_0:displayRepairWindow(arg_23_1)
	end)
	arg_13_0:bind(LevelUIConst.DO_PLAY_ANIM, function(arg_24_0, arg_24_1)
		arg_13_0:doPlayAnim(arg_24_1.name, arg_24_1.callback, arg_24_1.onStart)
	end)
	arg_13_0:bind(LevelUIConst.HIDE_FLEET_SELECT, function()
		arg_13_0:hideFleetSelect()
	end)
	arg_13_0:bind(LevelUIConst.HIDE_FLEET_EDIT, function(arg_26_0)
		arg_13_0:hideFleetEdit()
	end)
	arg_13_0:bind(LevelUIConst.ADD_MSG_QUEUE, function(arg_27_0, arg_27_1)
		arg_13_0:addbubbleMsgBox(arg_27_1)
	end)
	arg_13_0:bind(LevelUIConst.SET_MAP, function(arg_28_0, arg_28_1)
		arg_13_0:setMap(arg_28_1)
	end)
end

function var_0_0.addbubbleMsgBox(arg_29_0, arg_29_1)
	table.insert(arg_29_0.bubbleMsgBoxes, arg_29_1)

	if #arg_29_0.bubbleMsgBoxes > 1 then
		return
	end

	local var_29_0

	local function var_29_1()
		local var_30_0 = arg_29_0.bubbleMsgBoxes[1]

		if var_30_0 then
			var_30_0(function()
				table.remove(arg_29_0.bubbleMsgBoxes, 1)
				var_29_1()
			end)
		end
	end

	var_29_1()
end

function var_0_0.CleanBubbleMsgbox(arg_32_0)
	table.clean(arg_32_0.bubbleMsgBoxes)
end

function var_0_0.updatePtActivity(arg_33_0, arg_33_1)
	arg_33_0.ptActivity = arg_33_1

	arg_33_0:updateActivityRes()
end

function var_0_0.updateActivityRes(arg_34_0)
	local var_34_0 = findTF(arg_34_0.ptTotal, "Text")
	local var_34_1 = findTF(arg_34_0.ptTotal, "icon/Image")

	if var_34_0 and var_34_1 and arg_34_0.ptActivity then
		setText(var_34_0, "x" .. arg_34_0.ptActivity.data1)
		GetImageSpriteFromAtlasAsync(Drop.New({
			type = DROP_TYPE_RESOURCE,
			id = tonumber(arg_34_0.ptActivity:getConfig("config_id"))
		}):getIcon(), "", var_34_1, true)
	end
end

function var_0_0.setCommanderPrefabs(arg_35_0, arg_35_1)
	arg_35_0.commanderPrefabs = arg_35_1
end

function var_0_0.didEnter(arg_36_0)
	arg_36_0.openedCommanerSystem = not LOCK_COMMANDER and pg.SystemOpenMgr.GetInstance():isOpenSystem(arg_36_0.player.level, "CommanderCatMediator")

	onButton(arg_36_0, arg_36_0:findTF("back_button", arg_36_0.topChapter), function()
		if arg_36_0:isfrozen() then
			return
		end

		local var_37_0 = arg_36_0.contextData.map

		if var_37_0 and (var_37_0:isActivity() or var_37_0:isEscort()) then
			arg_36_0:emit(LevelMediator2.ON_SWITCH_NORMAL_MAP)

			return
		elseif var_37_0 and var_37_0:isSkirmish() then
			arg_36_0:emit(var_0_0.ON_BACK)
		elseif not arg_36_0.contextData.entranceStatus then
			arg_36_0:ShowEntranceUI(true)
		else
			arg_36_0:emit(var_0_0.ON_BACK)
		end
	end, SFX_CANCEL)
	onButton(arg_36_0, arg_36_0.btnSpecial, function()
		if arg_36_0:isfrozen() then
			return
		end

		arg_36_0:emit(LevelMediator2.ON_OPEN_EVENT_SCENE)
	end, SFX_PANEL)
	onButton(arg_36_0, arg_36_0.dailyBtn, function()
		if arg_36_0:isfrozen() then
			return
		end

		DailyLevelProxy.dailyLevelId = nil

		arg_36_0:updatDailyBtnTip()
		arg_36_0:emit(LevelMediator2.ON_DAILY_LEVEL)
	end, SFX_PANEL)
	onButton(arg_36_0, arg_36_0.challengeBtn, function()
		if arg_36_0:isfrozen() then
			return
		end

		local var_40_0, var_40_1 = arg_36_0:checkChallengeOpen()

		if var_40_0 == false then
			pg.TipsMgr.GetInstance():ShowTips(var_40_1)
		else
			arg_36_0:emit(LevelMediator2.CLICK_CHALLENGE_BTN)
		end
	end, SFX_PANEL)
	onButton(arg_36_0, arg_36_0.militaryExerciseBtn, function()
		if arg_36_0:isfrozen() then
			return
		end

		arg_36_0:emit(LevelMediator2.ON_OPEN_MILITARYEXERCISE)
	end, SFX_PANEL)
	onButton(arg_36_0, arg_36_0.normalBtn, function()
		if arg_36_0:isfrozen() then
			return
		end

		arg_36_0:setMap(arg_36_0.contextData.map:getBindMapId())
	end, SFX_PANEL)
	onButton(arg_36_0, arg_36_0.eliteBtn, function()
		if arg_36_0:isfrozen() then
			return
		end

		if arg_36_0.contextData.map:getBindMapId() == 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("elite_disable_unusable"))

			local var_43_0 = getProxy(ChapterProxy):getUseableMaxEliteMap()

			if var_43_0 then
				arg_36_0:setMap(var_43_0.configId)
				pg.TipsMgr.GetInstance():ShowTips(i18n("elite_warp_to_latest_map"))
			end
		elseif arg_36_0.contextData.map:isEliteEnabled() then
			arg_36_0:setMap(arg_36_0.contextData.map:getBindMapId())
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("elite_disable_unsatisfied"))
		end
	end, SFX_UI_WEIGHANCHOR_HARD)
	onButton(arg_36_0, arg_36_0.remasterBtn, function()
		if arg_36_0:isfrozen() then
			return
		end

		arg_36_0:displayRemasterPanel()
		getProxy(ChapterProxy):setRemasterTip(false)
		arg_36_0:updateRemasterBtnTip()
	end, SFX_PANEL)
	onButton(arg_36_0, arg_36_0.entranceLayer:Find("enters/enter_main"), function()
		if arg_36_0:isfrozen() then
			return
		end

		arg_36_0:ShowSelectedMap(arg_36_0:GetInitializeMap())
	end, SFX_PANEL)
	setText(arg_36_0.entranceLayer:Find("enters/enter_main/Text"), getProxy(ChapterProxy):getLastUnlockMap():getLastUnlockChapterName())
	onButton(arg_36_0, arg_36_0.entranceLayer:Find("enters/enter_world/enter"), function()
		if arg_36_0:isfrozen() then
			return
		end

		arg_36_0:emit(LevelMediator2.ENTER_WORLD)
	end, SFX_PANEL)
	onButton(arg_36_0, arg_36_0.entranceLayer:Find("enters/enter_ready/activity"), function()
		if arg_36_0:isfrozen() then
			return
		end

		local var_47_0 = getProxy(ActivityProxy):getEnterReadyActivity()

		switch(var_47_0:getConfig("type"), {
			[ActivityConst.ACTIVITY_TYPE_ZPROJECT] = function()
				arg_36_0:emit(LevelMediator2.ON_ACTIVITY_MAP)
			end,
			[ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2] = function()
				arg_36_0:emit(LevelMediator2.ON_OPEN_ACT_BOSS_BATTLE)
			end,
			[ActivityConst.ACTIVITY_TYPE_BOSSRUSH] = function()
				arg_36_0:emit(LevelMediator2.ON_BOSSRUSH_MAP)
			end,
			[ActivityConst.ACTIVITY_TYPE_BOSSSINGLE] = function()
				arg_36_0:emit(LevelMediator2.ON_BOSSSINGLE_MAP, {
					mode = OtherworldMapScene.MODE_BATTLE
				})
			end
		})
	end, SFX_PANEL)
	onButton(arg_36_0, arg_36_0.entranceLayer:Find("btns/btn_remaster"), function()
		if arg_36_0:isfrozen() then
			return
		end

		arg_36_0:displayRemasterPanel()
		getProxy(ChapterProxy):setRemasterTip(false)
		arg_36_0:updateRemasterBtnTip()
	end, SFX_PANEL)
	setActive(arg_36_0.entranceLayer:Find("btns/btn_remaster"), OPEN_REMASTER)
	onButton(arg_36_0, arg_36_0.entranceLayer:Find("btns/btn_challenge"), function()
		if arg_36_0:isfrozen() then
			return
		end

		local var_53_0, var_53_1 = arg_36_0:checkChallengeOpen()

		if var_53_0 == false then
			pg.TipsMgr.GetInstance():ShowTips(var_53_1)
		else
			arg_36_0:emit(LevelMediator2.CLICK_CHALLENGE_BTN)
		end
	end, SFX_PANEL)
	onButton(arg_36_0, arg_36_0.entranceLayer:Find("btns/btn_pvp"), function()
		if arg_36_0:isfrozen() then
			return
		end

		arg_36_0:emit(LevelMediator2.ON_OPEN_MILITARYEXERCISE)
	end, SFX_PANEL)
	onButton(arg_36_0, arg_36_0.entranceLayer:Find("btns/btn_daily"), function()
		if arg_36_0:isfrozen() then
			return
		end

		DailyLevelProxy.dailyLevelId = nil

		arg_36_0:updatDailyBtnTip()
		arg_36_0:emit(LevelMediator2.ON_DAILY_LEVEL)
	end, SFX_PANEL)
	onButton(arg_36_0, arg_36_0.entranceLayer:Find("btns/btn_task"), function()
		if arg_36_0:isfrozen() then
			return
		end

		arg_36_0:emit(LevelMediator2.ON_OPEN_EVENT_SCENE)
	end, SFX_PANEL)
	setActive(arg_36_0.entranceLayer:Find("enters/enter_world/enter"), not WORLD_ENTER_LOCK)
	setActive(arg_36_0.entranceLayer:Find("enters/enter_world/nothing"), WORLD_ENTER_LOCK)

	local var_36_0 = getProxy(ActivityProxy):getEnterReadyActivity()

	setActive(arg_36_0.entranceLayer:Find("enters/enter_ready/nothing"), not tobool(var_36_0))
	setActive(arg_36_0.entranceLayer:Find("enters/enter_ready/activity"), tobool(var_36_0))

	if tobool(var_36_0) then
		local var_36_1 = var_36_0:getConfig("config_client").entrance_bg

		if var_36_1 then
			GetImageSpriteFromAtlasAsync(var_36_1, "", arg_36_0.entranceLayer:Find("enters/enter_ready/activity"), true)
		end
	end

	local var_36_2 = pg.SystemOpenMgr.GetInstance():isOpenSystem(arg_36_0.player.level, "EventMediator")

	setActive(arg_36_0.btnSpecial:Find("lock"), not var_36_2)
	setActive(arg_36_0.entranceLayer:Find("btns/btn_task/lock"), not var_36_2)

	local var_36_3 = pg.SystemOpenMgr.GetInstance():isOpenSystem(arg_36_0.player.level, "DailyLevelMediator")

	setActive(arg_36_0.dailyBtn:Find("lock"), not var_36_3)
	setActive(arg_36_0.entranceLayer:Find("btns/btn_daily/lock"), not var_36_3)

	local var_36_4 = pg.SystemOpenMgr.GetInstance():isOpenSystem(arg_36_0.player.level, "MilitaryExerciseMediator")

	setActive(arg_36_0.militaryExerciseBtn:Find("lock"), not var_36_4)
	setActive(arg_36_0.entranceLayer:Find("btns/btn_pvp/lock"), not var_36_4)

	local var_36_5 = LimitChallengeConst.IsOpen()

	setActive(arg_36_0.challengeBtn:Find("lock"), not var_36_5)
	setActive(arg_36_0.entranceLayer:Find("btns/btn_challenge/lock"), not var_36_5)

	local var_36_6 = LimitChallengeConst.IsInAct()

	setActive(arg_36_0.challengeBtn, var_36_6)
	setActive(arg_36_0.entranceLayer:Find("btns/btn_challenge"), var_36_6)

	local var_36_7 = LimitChallengeConst.IsShowRedPoint()

	setActive(arg_36_0.entranceLayer:Find("btns/btn_challenge/tip"), var_36_7)
	arg_36_0:initMapBtn(arg_36_0.btnPrev, -1)
	arg_36_0:initMapBtn(arg_36_0.btnNext, 1)
	arg_36_0:registerActBtn()

	if arg_36_0.contextData.editEliteChapter then
		local var_36_8 = getProxy(ChapterProxy):getChapterById(arg_36_0.contextData.editEliteChapter)

		arg_36_0:displayFleetEdit(var_36_8)

		arg_36_0.contextData.editEliteChapter = nil
	elseif arg_36_0.contextData.selectedChapterVO then
		arg_36_0:displayFleetSelect(arg_36_0.contextData.selectedChapterVO)

		arg_36_0.contextData.selectedChapterVO = nil
	end

	local var_36_9 = arg_36_0.contextData.chapterVO

	if not var_36_9 or not var_36_9.active then
		arg_36_0:tryPlaySubGuide()
	end

	arg_36_0:updateRemasterBtnTip()
	arg_36_0:updatDailyBtnTip()

	if arg_36_0.contextData.open_remaster then
		arg_36_0:displayRemasterPanel(arg_36_0.contextData.isSP)

		arg_36_0.contextData.open_remaster = nil
	end

	arg_36_0:ShowEntranceUI(arg_36_0.contextData.entranceStatus)

	if not arg_36_0.contextData.entranceStatus then
		arg_36_0:emit(LevelMediator2.ON_ENTER_MAINLEVEL, arg_36_0:GetInitializeMap())
	end

	arg_36_0:emit(LevelMediator2.ON_DIDENTER)
end

function var_0_0.checkChallengeOpen(arg_57_0)
	local var_57_0 = getProxy(PlayerProxy):getRawData().level

	return pg.SystemOpenMgr.GetInstance():isOpenSystem(var_57_0, "ChallengeMainMediator")
end

function var_0_0.tryPlaySubGuide(arg_58_0)
	if arg_58_0.contextData.map and arg_58_0.contextData.map:isSkirmish() then
		return
	end

	pg.SystemGuideMgr.GetInstance():Play(arg_58_0)
end

function var_0_0.onBackPressed(arg_59_0)
	if arg_59_0:isfrozen() then
		return
	end

	if arg_59_0.levelAmbushView then
		return
	end

	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)

	if arg_59_0.levelInfoView:isShowing() then
		arg_59_0:hideChapterPanel()

		return
	end

	if arg_59_0.levelInfoSPView and arg_59_0.levelInfoSPView:isShowing() then
		arg_59_0:HideLevelInfoSPPanel()

		return
	end

	if arg_59_0.levelFleetView:isShowing() then
		arg_59_0:hideFleetEdit()

		return
	end

	if arg_59_0.levelStrategyView then
		arg_59_0:hideStrategyInfo()

		return
	end

	if arg_59_0.levelRepairView then
		arg_59_0:hideRepairWindow()

		return
	end

	if arg_59_0.levelRemasterView:isShowing() then
		arg_59_0:hideRemasterPanel()

		return
	end

	if isActive(arg_59_0.helpPage) then
		setActive(arg_59_0.helpPage, false)

		return
	end

	local var_59_0 = arg_59_0.contextData.chapterVO
	local var_59_1 = getProxy(ChapterProxy):getActiveChapter()

	if var_59_0 and var_59_1 then
		arg_59_0:switchToMap()

		return
	end

	triggerButton(arg_59_0:findTF("back_button", arg_59_0.topChapter))
end

function var_0_0.ShowEntranceUI(arg_60_0, arg_60_1)
	setActive(arg_60_0.entranceLayer, arg_60_1)
	setActive(arg_60_0.entranceBg, arg_60_1)
	setActive(arg_60_0.map, not arg_60_1)
	setActive(arg_60_0.float, not arg_60_1)
	setActive(arg_60_0.mainLayer, not arg_60_1)
	setActive(arg_60_0.topChapter:Find("type_entrance"), arg_60_1)

	arg_60_0.contextData.entranceStatus = tobool(arg_60_1)

	if arg_60_1 then
		setActive(arg_60_0.topChapter:Find("title_chapter"), false)
		setActive(arg_60_0.topChapter:Find("type_chapter"), false)
		setActive(arg_60_0.topChapter:Find("type_escort"), false)
		setActive(arg_60_0.topChapter:Find("type_skirmish"), false)

		if arg_60_0.newChapterCDTimer then
			arg_60_0.newChapterCDTimer:Stop()

			arg_60_0.newChapterCDTimer = nil
		end

		arg_60_0:RecordLastMapOnExit()

		arg_60_0.contextData.mapIdx = nil
		arg_60_0.contextData.map = nil
	end

	arg_60_0:PlayBGM()
end

function var_0_0.PreloadLevelMainUI(arg_61_0, arg_61_1, arg_61_2)
	if arg_61_0.preloadLevelDone then
		existCall(arg_61_2)

		return
	end

	local var_61_0

	local function var_61_1()
		if not arg_61_0.exited then
			arg_61_0.preloadLevelDone = true

			existCall(arg_61_2)
		end
	end

	local var_61_2 = getProxy(ChapterProxy):getMapById(arg_61_1)
	local var_61_3 = arg_61_0:GetMapBG(var_61_2)

	table.ParallelIpairsAsync(var_61_3, function(arg_63_0, arg_63_1, arg_63_2)
		GetSpriteFromAtlasAsync("levelmap/" .. arg_63_1.BG, "", arg_63_2)
	end, var_61_1)
end

function var_0_0.selectMap(arg_64_0)
	local var_64_0 = arg_64_0.contextData.mapIdx

	if not var_64_0 then
		local var_64_1 = getProxy(ChapterProxy)
		local var_64_2 = Map.lastMap and var_64_1:getMapById(Map.lastMap)

		if var_64_2 and var_64_2:isUnlock() then
			var_64_0 = Map.lastMap
		else
			var_64_0 = var_64_1:getLastUnlockMap().id
		end
	end

	return var_64_0
end

function var_0_0.setShips(arg_65_0, arg_65_1)
	arg_65_0.shipVOs = arg_65_1
end

function var_0_0.updateRes(arg_66_0, arg_66_1)
	if arg_66_0.levelStageView then
		arg_66_0.levelStageView:ActionInvoke("SetPlayer", arg_66_1)
	end

	arg_66_0.player = arg_66_1
end

function var_0_0.setEliteQuota(arg_67_0, arg_67_1, arg_67_2)
	local var_67_0 = arg_67_2 - arg_67_1
	local var_67_1 = arg_67_0:findTF("bg/Text", arg_67_0.eliteQuota):GetComponent(typeof(Text))

	if arg_67_1 == arg_67_2 then
		var_67_1.color = Color.red
	else
		var_67_1.color = Color.New(0.47, 0.89, 0.27)
	end

	var_67_1.text = var_67_0 .. "/" .. arg_67_2
end

function var_0_0.updateEvent(arg_68_0, arg_68_1)
	local var_68_0 = arg_68_1:hasFinishState()

	setActive(arg_68_0.btnSpecial:Find("tip"), var_68_0)
	setActive(arg_68_0.entranceLayer:Find("btns/btn_task/tip"), var_68_0)
end

function var_0_0.updateFleet(arg_69_0, arg_69_1)
	arg_69_0.fleets = arg_69_1
end

function var_0_0.updateChapterVO(arg_70_0, arg_70_1, arg_70_2)
	if arg_70_0.contextData.chapterVO and arg_70_0.contextData.chapterVO.id == arg_70_1.id and arg_70_1.active then
		arg_70_0:setChapter(arg_70_1)
	end

	if arg_70_0.contextData.chapterVO and arg_70_0.contextData.chapterVO.id == arg_70_1.id and arg_70_1.active and arg_70_0.levelStageView and arg_70_0.grid then
		local var_70_0 = false
		local var_70_1 = false
		local var_70_2 = false

		if arg_70_2 < 0 or bit.band(arg_70_2, ChapterConst.DirtyFleet) > 0 then
			arg_70_0.levelStageView:updateStageFleet()
			arg_70_0.levelStageView:updateAmbushRate(arg_70_1.fleet.line, true)

			var_70_2 = true

			if arg_70_0.grid then
				arg_70_0.grid:RefreshFleetCells()
				arg_70_0.grid:UpdateFloor()

				var_70_0 = true
			end
		end

		if arg_70_2 < 0 or bit.band(arg_70_2, ChapterConst.DirtyChampion) > 0 then
			var_70_2 = true

			if arg_70_0.grid then
				arg_70_0.grid:UpdateFleets()
				arg_70_0.grid:clearChampions()
				arg_70_0.grid:initChampions()

				var_70_1 = true
			end
		elseif bit.band(arg_70_2, ChapterConst.DirtyChampionPosition) > 0 then
			var_70_2 = true

			if arg_70_0.grid then
				arg_70_0.grid:UpdateFleets()
				arg_70_0.grid:updateChampions()

				var_70_1 = true
			end
		end

		if arg_70_2 < 0 or bit.band(arg_70_2, ChapterConst.DirtyAchieve) > 0 then
			arg_70_0.levelStageView:updateStageAchieve()
		end

		if arg_70_2 < 0 or bit.band(arg_70_2, ChapterConst.DirtyAttachment) > 0 then
			arg_70_0.levelStageView:updateAmbushRate(arg_70_1.fleet.line, true)

			if arg_70_0.grid then
				if not (arg_70_2 < 0) and not (bit.band(arg_70_2, ChapterConst.DirtyFleet) > 0) then
					arg_70_0.grid:updateFleet(arg_70_1.fleets[arg_70_1.findex].id)
				end

				arg_70_0.grid:updateAttachments()

				if arg_70_2 < 0 or bit.band(arg_70_2, ChapterConst.DirtyAutoAction) > 0 then
					arg_70_0.grid:updateQuadCells(ChapterConst.QuadStateNormal)
				else
					var_70_0 = true
				end
			end
		end

		if arg_70_2 < 0 or bit.band(arg_70_2, ChapterConst.DirtyStrategy) > 0 then
			arg_70_0.levelStageView:updateStageStrategy()

			var_70_2 = true

			arg_70_0.levelStageView:updateStageBarrier()
			arg_70_0.levelStageView:UpdateAutoFightPanel()
		end

		if arg_70_2 < 0 or bit.band(arg_70_2, ChapterConst.DirtyAutoAction) > 0 then
			-- block empty
		elseif var_70_0 then
			arg_70_0.grid:updateQuadCells(ChapterConst.QuadStateNormal)
		elseif var_70_1 then
			arg_70_0.grid:updateQuadCells(ChapterConst.QuadStateFrozen)
		end

		if arg_70_2 < 0 or bit.band(arg_70_2, ChapterConst.DirtyCellFlag) > 0 then
			arg_70_0.grid:UpdateFloor()
		end

		if arg_70_2 < 0 or bit.band(arg_70_2, ChapterConst.DirtyBase) > 0 then
			arg_70_0.levelStageView:UpdateDefenseStatus()
		end

		if arg_70_2 < 0 or bit.band(arg_70_2, ChapterConst.DirtyFloatItems) > 0 then
			arg_70_0.grid:UpdateItemCells()
		end

		if var_70_2 then
			arg_70_0.levelStageView:updateFleetBuff()
		end
	end
end

function var_0_0.updateClouds(arg_71_0)
	arg_71_0.cloudRTFs = {}
	arg_71_0.cloudRects = {}
	arg_71_0.cloudTimer = {}

	for iter_71_0 = 1, 6 do
		local var_71_0 = arg_71_0:findTF("cloud_" .. iter_71_0, arg_71_0.clouds)
		local var_71_1 = rtf(var_71_0)

		table.insert(arg_71_0.cloudRTFs, var_71_1)
		table.insert(arg_71_0.cloudRects, var_71_1.rect.width)
	end

	arg_71_0:initCloudsPos()

	for iter_71_1, iter_71_2 in ipairs(arg_71_0.cloudRTFs) do
		local var_71_2 = arg_71_0.cloudRects[iter_71_1]
		local var_71_3 = arg_71_0.initPositions[iter_71_1] or Vector2(0, 0)
		local var_71_4 = 30 - var_71_3.y / 20
		local var_71_5 = (arg_71_0.mapWidth + var_71_2) / var_71_4
		local var_71_6

		var_71_6 = LeanTween.moveX(iter_71_2, arg_71_0.mapWidth, var_71_5):setRepeat(-1):setOnCompleteOnRepeat(true):setOnComplete(System.Action(function()
			var_71_2 = arg_71_0.cloudRects[iter_71_1]
			iter_71_2.anchoredPosition = Vector2(-var_71_2, var_71_3.y)

			var_71_6:setFrom(-var_71_2):setTime((arg_71_0.mapWidth + var_71_2) / var_71_4)
		end))
		var_71_6.passed = math.random() * var_71_5
		arg_71_0.cloudTimer[iter_71_1] = var_71_6.uniqueId
	end
end

function var_0_0.RefreshMapBG(arg_73_0)
	arg_73_0:PlayBGM()
	arg_73_0:SwitchMapBG(arg_73_0.contextData.map, nil, true)
end

function var_0_0.updateCouldAnimator(arg_74_0, arg_74_1, arg_74_2)
	if not arg_74_1 then
		return
	end

	local var_74_0 = arg_74_0.contextData.map:getConfig("ani_controller")

	local function var_74_1(arg_75_0)
		arg_75_0 = tf(arg_75_0)

		local var_75_0 = Vector3.one

		if arg_75_0.rect.width > 0 and arg_75_0.rect.height > 0 then
			var_75_0.x = arg_75_0.parent.rect.width / arg_75_0.rect.width
			var_75_0.y = arg_75_0.parent.rect.height / arg_75_0.rect.height
		end

		arg_75_0.localScale = var_75_0

		if var_74_0 and #var_74_0 > 0 then
			(function()
				for iter_76_0, iter_76_1 in ipairs(var_74_0) do
					if iter_76_1[1] == var_0_2 then
						local var_76_0 = iter_76_1[2][1]
						local var_76_1 = _.rest(iter_76_1[2], 2)

						for iter_76_2, iter_76_3 in ipairs(var_76_1) do
							local var_76_2 = arg_75_0:Find(iter_76_3)

							if not IsNil(var_76_2) then
								local var_76_3 = getProxy(ChapterProxy):GetChapterItemById(var_76_0)

								if var_76_3 and not var_76_3:isClear() then
									setActive(var_76_2, false)
								end
							end
						end
					elseif iter_76_1[1] == var_0_3 then
						local var_76_4 = iter_76_1[2][1]
						local var_76_5 = _.rest(iter_76_1[2], 2)

						for iter_76_4, iter_76_5 in ipairs(var_76_5) do
							local var_76_6 = arg_75_0:Find(iter_76_5)

							if not IsNil(var_76_6) then
								local var_76_7 = getProxy(ChapterProxy):GetChapterItemById(var_76_4)

								if var_76_7 and not var_76_7:isClear() then
									setActive(var_76_6, true)

									return
								end
							end
						end
					elseif iter_76_1[1] == var_0_4 then
						local var_76_8 = iter_76_1[2][1]
						local var_76_9 = _.rest(iter_76_1[2], 2)

						for iter_76_6, iter_76_7 in ipairs(var_76_9) do
							local var_76_10 = arg_75_0:Find(iter_76_7)

							if not IsNil(var_76_10) then
								local var_76_11 = getProxy(ChapterProxy):GetChapterItemById(var_76_8)

								if var_76_11 and not var_76_11:isClear() then
									setActive(var_76_10, true)
								end
							end
						end
					end
				end
			end)()
		end
	end

	local var_74_2 = arg_74_0.loader:GetPrefab("ui/" .. arg_74_1, arg_74_1, function(arg_77_0)
		arg_77_0:SetActive(true)

		local var_77_0 = arg_74_0.mapTFs[arg_74_2]

		setParent(arg_77_0, var_77_0)
		pg.ViewUtils.SetSortingOrder(arg_77_0, ChapterConst.LayerWeightMap + arg_74_2 * 2 - 1)
		var_74_1(arg_77_0)
	end)

	table.insert(arg_74_0.mapGroup, var_74_2)
end

function var_0_0.HideBtns(arg_78_0)
	setActive(arg_78_0.btnPrev, false)
	setActive(arg_78_0.eliteQuota, false)
	setActive(arg_78_0.escortBar, false)
	setActive(arg_78_0.skirmishBar, false)
	setActive(arg_78_0.normalBtn, false)
	setActive(arg_78_0.actNormalBtn, false)
	setActive(arg_78_0.eliteBtn, false)
	setActive(arg_78_0.actEliteBtn, false)
	setActive(arg_78_0.actExtraBtn, false)
	setActive(arg_78_0.remasterBtn, false)
	setActive(arg_78_0.btnNext, false)
	setActive(arg_78_0.remasterAwardBtn, false)
	setActive(arg_78_0.eventContainer, false)
	setActive(arg_78_0.activityBtn, false)
	setActive(arg_78_0.ptTotal, false)
	setActive(arg_78_0.ticketTxt.parent, false)
	setActive(arg_78_0.countDown, false)
	setActive(arg_78_0.actAtelierBuffBtn, false)
	setActive(arg_78_0.actExtraRank, false)
	setActive(arg_78_0.actExchangeShopBtn, false)
	setActive(arg_78_0.mapHelpBtn, false)
end

function var_0_0.updateDifficultyBtns(arg_79_0)
	local var_79_0 = arg_79_0.contextData.map:getConfig("type")

	setActive(arg_79_0.normalBtn, var_79_0 == Map.ELITE)
	setActive(arg_79_0.eliteQuota, var_79_0 == Map.ELITE)
	setActive(arg_79_0.eliteBtn, var_79_0 == Map.SCENARIO)

	local var_79_1 = getProxy(ActivityProxy):getActivityById(ActivityConst.ELITE_AWARD_ACTIVITY_ID)

	setActive(arg_79_0.eliteBtn:Find("pic_activity"), var_79_1 and not var_79_1:isEnd())
end

function var_0_0.updateActivityBtns(arg_80_0)
	local var_80_0, var_80_1 = arg_80_0.contextData.map:isActivity()
	local var_80_2 = arg_80_0.contextData.map:isRemaster()
	local var_80_3 = arg_80_0.contextData.map:isSkirmish()
	local var_80_4 = arg_80_0.contextData.map:isEscort()
	local var_80_5 = arg_80_0.contextData.map:getConfig("type")
	local var_80_6 = getProxy(ActivityProxy):GetEarliestActByType(ActivityConst.ACTIVITY_TYPE_ZPROJECT)
	local var_80_7 = var_80_6 and not var_80_6:isEnd() and not var_80_0 and not var_80_3 and not var_80_4

	if var_80_7 then
		local var_80_8 = setmetatable({}, MainActMapBtn)

		var_80_8.image = arg_80_0.activityBtn:Find("Image"):GetComponent(typeof(Image))
		var_80_8.subImage = arg_80_0.activityBtn:Find("sub_Image"):GetComponent(typeof(Image))
		var_80_8.tipTr = arg_80_0.activityBtn:Find("Tip"):GetComponent(typeof(Image))
		var_80_8.tipTxt = arg_80_0.activityBtn:Find("Tip/Text"):GetComponent(typeof(Text))
		var_80_7 = var_80_8:InShowTime()

		if var_80_7 then
			var_80_8:InitTipImage()
			var_80_8:InitSubImage()
			var_80_8:InitImage(function()
				return
			end)
			var_80_8:OnInit()
		end
	end

	setActive(arg_80_0.activityBtn, var_80_7)
	arg_80_0:updateRemasterInfo()

	if var_80_0 and var_80_1 then
		local var_80_9 = getProxy(ChapterProxy):getMapsByActivities()
		local var_80_10 = underscore.any(var_80_9, function(arg_82_0)
			return arg_82_0:isActExtra()
		end)

		setActive(arg_80_0.actExtraBtn, var_80_10 and not var_80_2 and var_80_5 ~= Map.ACT_EXTRA)

		if isActive(arg_80_0.actExtraBtn) then
			if underscore.all(underscore.filter(var_80_9, function(arg_83_0)
				local var_83_0 = arg_83_0:getMapType()

				return var_83_0 == Map.ACTIVITY_EASY or var_83_0 == Map.ACTIVITY_HARD
			end), function(arg_84_0)
				return arg_84_0:isAllChaptersClear()
			end) then
				setActive(arg_80_0.actExtraBtnAnim, true)
			else
				setActive(arg_80_0.actExtraBtnAnim, false)
			end

			setActive(arg_80_0.actExtraBtn:Find("Tip"), getProxy(ChapterProxy):IsActivitySPChapterActive() and SettingsProxy.IsShowActivityMapSPTip())
		end

		local var_80_11 = checkExist(arg_80_0.contextData.map:getBindMap(), {
			"isHardMap"
		})

		setActive(arg_80_0.actEliteBtn, var_80_11 and var_80_5 ~= Map.ACTIVITY_HARD)
		setActive(arg_80_0.actNormalBtn, var_80_5 ~= Map.ACTIVITY_EASY)
		setActive(arg_80_0.actExtraRank, var_80_5 == Map.ACT_EXTRA)
		setActive(arg_80_0.actExchangeShopBtn, not ActivityConst.HIDE_PT_PANELS and not var_80_2 and var_80_1 and arg_80_0:IsActShopActive())
		setActive(arg_80_0.ptTotal, not ActivityConst.HIDE_PT_PANELS and not var_80_2 and var_80_1 and arg_80_0.ptActivity and not arg_80_0.ptActivity:isEnd())
		arg_80_0:updateActivityRes()
	else
		setActive(arg_80_0.actExtraBtn, false)
		setActive(arg_80_0.actEliteBtn, false)
		setActive(arg_80_0.actNormalBtn, false)
		setActive(arg_80_0.actExtraRank, false)
		setActive(arg_80_0.actExchangeShopBtn, false)
		setActive(arg_80_0.actAtelierBuffBtn, false)
		setActive(arg_80_0.ptTotal, false)
	end

	setActive(arg_80_0.eventContainer, (not var_80_0 or not var_80_1) and not var_80_4)
	setActive(arg_80_0.remasterBtn, OPEN_REMASTER and (var_80_2 or not var_80_0 and not var_80_4 and not var_80_3))
	setActive(arg_80_0.ticketTxt.parent, var_80_2)
	arg_80_0:updateRemasterTicket()
	arg_80_0:updateCountDown()

	if var_80_0 and var_80_5 ~= Map.ACT_EXTRA then
		Map.lastMapForActivity = arg_80_0.contextData.mapIdx
	end
end

function var_0_0.updateRemasterTicket(arg_85_0)
	setText(arg_85_0.ticketTxt, getProxy(ChapterProxy).remasterTickets .. " / " .. pg.gameset.reactivity_ticket_max.key_value)
	arg_85_0:emit(LevelUIConst.FLUSH_REMASTER_TICKET)
end

function var_0_0.updateRemasterBtnTip(arg_86_0)
	local var_86_0 = getProxy(ChapterProxy)
	local var_86_1 = var_86_0:ifShowRemasterTip() or var_86_0:anyRemasterAwardCanReceive()

	SetActive(arg_86_0.remasterBtn:Find("tip"), var_86_1)
	SetActive(arg_86_0.entranceLayer:Find("btns/btn_remaster/tip"), var_86_1)
end

function var_0_0.updatDailyBtnTip(arg_87_0)
	local var_87_0 = getProxy(DailyLevelProxy):ifShowDailyTip()

	SetActive(arg_87_0.dailyBtn:Find("tip"), var_87_0)
	SetActive(arg_87_0.entranceLayer:Find("btns/btn_daily/tip"), var_87_0)
end

function var_0_0.updateRemasterInfo(arg_88_0)
	arg_88_0:emit(LevelUIConst.FLUSH_REMASTER_INFO)

	if not arg_88_0.contextData.map then
		return
	end

	local var_88_0 = getProxy(ChapterProxy)
	local var_88_1
	local var_88_2 = arg_88_0.contextData.map:getRemaster()

	if var_88_2 and #pg.re_map_template[var_88_2].drop_gain > 0 then
		for iter_88_0, iter_88_1 in ipairs(pg.re_map_template[var_88_2].drop_gain) do
			if #iter_88_1 > 0 and var_88_0.remasterInfo[iter_88_1[1]][iter_88_0].receive == false then
				var_88_1 = {
					iter_88_0,
					iter_88_1
				}

				break
			end
		end
	end

	setActive(arg_88_0.remasterAwardBtn, var_88_1)

	if var_88_1 then
		local var_88_3 = var_88_1[1]
		local var_88_4, var_88_5, var_88_6, var_88_7 = unpack(var_88_1[2])
		local var_88_8 = var_88_0.remasterInfo[var_88_4][var_88_3]

		setText(arg_88_0.remasterAwardBtn:Find("Text"), var_88_8.count .. "/" .. var_88_7)
		updateDrop(arg_88_0.remasterAwardBtn:Find("IconTpl"), {
			type = var_88_5,
			id = var_88_6
		})
		setActive(arg_88_0.remasterAwardBtn:Find("tip"), var_88_7 <= var_88_8.count)
		onButton(arg_88_0, arg_88_0.remasterAwardBtn, function()
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				hideYes = true,
				hideNo = true,
				type = MSGBOX_TYPE_SINGLE_ITEM,
				drop = {
					type = var_88_5,
					id = var_88_6
				},
				weight = LayerWeightConst.TOP_LAYER,
				remaster = {
					word = i18n("level_remaster_tip4", pg.chapter_template[var_88_4].chapter_name),
					number = var_88_8.count .. "/" .. var_88_7,
					btn_text = i18n(var_88_8.count < var_88_7 and "level_remaster_tip2" or "level_remaster_tip3"),
					btn_call = function()
						if var_88_8.count < var_88_7 then
							local var_90_0 = pg.chapter_template[var_88_4].map
							local var_90_1, var_90_2 = var_88_0:getMapById(var_90_0):isUnlock()

							if not var_90_1 then
								pg.TipsMgr.GetInstance():ShowTips(var_90_2)
							else
								arg_88_0:ShowSelectedMap(var_90_0)
							end
						else
							arg_88_0:emit(LevelMediator2.ON_CHAPTER_REMASTER_AWARD, var_88_4, var_88_3)
						end
					end
				}
			})
		end, SFX_PANEL)
	end
end

function var_0_0.updateCountDown(arg_91_0)
	local var_91_0 = getProxy(ChapterProxy)

	if arg_91_0.newChapterCDTimer then
		arg_91_0.newChapterCDTimer:Stop()

		arg_91_0.newChapterCDTimer = nil
	end

	local var_91_1 = 0

	if arg_91_0.contextData.map:isActivity() and not arg_91_0.contextData.map:isRemaster() then
		local var_91_2 = var_91_0:getMapsByActivities()

		_.each(var_91_2, function(arg_92_0)
			local var_92_0 = arg_92_0:getChapterTimeLimit()

			if var_91_1 == 0 then
				var_91_1 = var_92_0
			else
				var_91_1 = math.min(var_91_1, var_92_0)
			end
		end)
		setActive(arg_91_0.countDown, var_91_1 > 0)
		setText(arg_91_0.countDown:Find("title"), i18n("levelScene_new_chapter_coming"))
	else
		setActive(arg_91_0.countDown, false)
	end

	if var_91_1 > 0 then
		setText(arg_91_0.countDown:Find("time"), pg.TimeMgr.GetInstance():DescCDTime(var_91_1))

		arg_91_0.newChapterCDTimer = Timer.New(function()
			var_91_1 = var_91_1 - 1

			if var_91_1 <= 0 then
				arg_91_0:updateCountDown()

				if not arg_91_0.contextData.chapterVO then
					arg_91_0:setMap(arg_91_0.contextData.mapIdx)
				end
			else
				setText(arg_91_0.countDown:Find("time"), pg.TimeMgr.GetInstance():DescCDTime(var_91_1))
			end
		end, 1, -1)

		arg_91_0.newChapterCDTimer:Start()
	else
		setText(arg_91_0.countDown:Find("time"), "")
	end
end

function var_0_0.registerActBtn(arg_94_0)
	onButton(arg_94_0, arg_94_0.actExtraRank, function()
		if arg_94_0:isfrozen() then
			return
		end

		arg_94_0:emit(LevelMediator2.ON_EXTRA_RANK)
	end, SFX_PANEL)
	onButton(arg_94_0, arg_94_0.activityBtn, function()
		if arg_94_0:isfrozen() then
			return
		end

		arg_94_0:emit(LevelMediator2.ON_ACTIVITY_MAP)
	end, SFX_UI_CLICK)
	onButton(arg_94_0, arg_94_0.actExchangeShopBtn, function()
		if arg_94_0:isfrozen() then
			return
		end

		arg_94_0:emit(LevelMediator2.GO_ACT_SHOP)
	end, SFX_UI_CLICK)
	onButton(arg_94_0, arg_94_0.actAtelierBuffBtn, function()
		if arg_94_0:isfrozen() then
			return
		end

		arg_94_0:emit(LevelMediator2.SHOW_ATELIER_BUFF)
	end, SFX_UI_CLICK)

	local var_94_0 = getProxy(ChapterProxy)

	local function var_94_1(arg_99_0, arg_99_1, arg_99_2)
		local var_99_0

		if arg_99_0:isRemaster() then
			var_99_0 = var_94_0:getRemasterMaps(arg_99_0.remasterId)
		else
			var_99_0 = var_94_0:getMapsByActivities()
		end

		local var_99_1 = _.select(var_99_0, function(arg_100_0)
			return arg_100_0:getMapType() == arg_99_1
		end)

		table.sort(var_99_1, function(arg_101_0, arg_101_1)
			return arg_101_0.id < arg_101_1.id
		end)

		local var_99_2 = table.indexof(underscore.map(var_99_1, function(arg_102_0)
			return arg_102_0.id
		end), arg_99_2) or #var_99_1

		while not var_99_1[var_99_2]:isUnlock() do
			if var_99_2 > 1 then
				var_99_2 = var_99_2 - 1
			else
				break
			end
		end

		return var_99_1[var_99_2]
	end

	local function var_94_2()
		if arg_94_0:isfrozen() then
			return
		end

		local var_103_0 = arg_94_0.contextData.map:getBindMapId()
		local var_103_1 = var_94_1(arg_94_0.contextData.map, Map.ACTIVITY_HARD, var_103_0)
		local var_103_2, var_103_3 = var_103_1:isUnlock()

		if var_103_2 then
			arg_94_0:setMap(var_103_1.id)
		else
			pg.TipsMgr.GetInstance():ShowTips(var_103_3)
		end
	end

	onButton(arg_94_0, arg_94_0.actEliteBtn, var_94_2, SFX_PANEL)
	arg_94_0:bind(LevelUIConst.SWITCH_CHALLENGE_MAP, var_94_2)
	onButton(arg_94_0, arg_94_0.actNormalBtn, function()
		if arg_94_0:isfrozen() then
			return
		end

		local var_104_0 = arg_94_0.contextData.map:getBindMapId()
		local var_104_1 = var_94_1(arg_94_0.contextData.map, Map.ACTIVITY_EASY, var_104_0)
		local var_104_2, var_104_3 = var_104_1:isUnlock()

		if var_104_2 then
			arg_94_0:setMap(var_104_1.id)
		else
			pg.TipsMgr.GetInstance():ShowTips(var_104_3)
		end
	end, SFX_PANEL)
	onButton(arg_94_0, arg_94_0.actExtraBtn, function()
		if arg_94_0:isfrozen() then
			return
		end

		local var_105_0 = PlayerPrefs.HasKey("ex_mapId") and PlayerPrefs.GetInt("ex_mapId", 0) or 0
		local var_105_1 = var_94_1(arg_94_0.contextData.map, Map.ACT_EXTRA, var_105_0)
		local var_105_2, var_105_3 = var_105_1:isUnlock()

		if var_105_2 then
			arg_94_0:setMap(var_105_1.id)
		else
			pg.TipsMgr.GetInstance():ShowTips(var_105_3)
		end
	end, SFX_PANEL)
end

function var_0_0.initCloudsPos(arg_106_0, arg_106_1)
	arg_106_0.initPositions = {}

	local var_106_0 = arg_106_1 or 1
	local var_106_1 = pg.expedition_data_by_map[var_106_0].clouds_pos

	for iter_106_0, iter_106_1 in ipairs(arg_106_0.cloudRTFs) do
		local var_106_2 = var_106_1[iter_106_0]

		if var_106_2 then
			iter_106_1.anchoredPosition = Vector2(var_106_2[1], var_106_2[2])

			table.insert(arg_106_0.initPositions, iter_106_1.anchoredPosition)
		else
			setActive(iter_106_1, false)
		end
	end
end

function var_0_0.initMapBtn(arg_107_0, arg_107_1, arg_107_2)
	onButton(arg_107_0, arg_107_1, function()
		if arg_107_0:isfrozen() then
			return
		end

		local var_108_0 = arg_107_0.contextData.mapIdx + arg_107_2
		local var_108_1 = getProxy(ChapterProxy):getMapById(var_108_0)

		if not var_108_1 then
			return
		end

		if var_108_1:getMapType() == Map.ELITE and not var_108_1:isEliteEnabled() then
			var_108_1 = var_108_1:getBindMap()
			var_108_0 = var_108_1.id

			pg.TipsMgr.GetInstance():ShowTips(i18n("elite_disable_unusable"))
		end

		local var_108_2, var_108_3 = var_108_1:isUnlock()

		if arg_107_2 > 0 and not var_108_2 then
			pg.TipsMgr.GetInstance():ShowTips(var_108_3)

			return
		end

		arg_107_0:setMap(var_108_0)
	end, SFX_PANEL)
end

function var_0_0.ShowSelectedMap(arg_109_0, arg_109_1, arg_109_2)
	seriesAsync({
		function(arg_110_0)
			if arg_109_0.contextData.entranceStatus then
				arg_109_0:frozen()

				arg_109_0.nextPreloadMap = arg_109_1

				arg_109_0:PreloadLevelMainUI(arg_109_1, function()
					arg_109_0:unfrozen()

					if arg_109_0.nextPreloadMap ~= arg_109_1 then
						return
					end

					arg_109_0:ShowEntranceUI(false)
					arg_109_0:emit(LevelMediator2.ON_ENTER_MAINLEVEL, arg_109_1)
					arg_110_0()
				end)
			else
				arg_109_0:setMap(arg_109_1)
				arg_110_0()
			end
		end
	}, arg_109_2)
end

function var_0_0.setMap(arg_112_0, arg_112_1)
	local var_112_0 = arg_112_0.contextData.mapIdx

	arg_112_0.contextData.mapIdx = arg_112_1
	arg_112_0.contextData.map = getProxy(ChapterProxy):getMapById(arg_112_1)

	assert(arg_112_0.contextData.map, "map cannot be nil " .. arg_112_1)

	if arg_112_0.contextData.map:getMapType() == Map.ACT_EXTRA then
		PlayerPrefs.SetInt("ex_mapId", arg_112_0.contextData.map.id)
		PlayerPrefs.Save()
	elseif arg_112_0.contextData.map:isRemaster() then
		PlayerPrefs.SetInt("remaster_lastmap_" .. arg_112_0.contextData.map.remasterId, arg_112_1)
		PlayerPrefs.Save()
	end

	arg_112_0:updateMap(var_112_0)
	arg_112_0:tryPlayMapStory()
end

local var_0_5 = import("view.level.MapBuilder.MapBuilder")
local var_0_6 = {
	[var_0_5.TYPENORMAL] = "MapBuilderNormal",
	[var_0_5.TYPEESCORT] = "MapBuilderEscort",
	[var_0_5.TYPESHINANO] = "MapBuilderShinano",
	[var_0_5.TYPESKIRMISH] = "MapBuilderSkirmish",
	[var_0_5.TYPEBISMARCK] = "MapBuilderBismarck",
	[var_0_5.TYPESSSS] = "MapBuilderSSSS",
	[var_0_5.TYPEATELIER] = "MapBuilderAtelier",
	[var_0_5.TYPESENRANKAGURA] = "MapBuilderSenrankagura",
	[var_0_5.TYPESP] = "MapBuilderSP"
}

function var_0_0.SwitchMapBuilder(arg_113_0, arg_113_1)
	if arg_113_0.mapBuilder and arg_113_0.mapBuilder:GetType() ~= arg_113_1 then
		arg_113_0.mapBuilder:Hide()
	end

	local var_113_0 = arg_113_0:GetMapBuilderInBuffer(arg_113_1)

	arg_113_0.mapBuilder = var_113_0

	var_113_0:Show()
end

function var_0_0.GetMapBuilderInBuffer(arg_114_0, arg_114_1)
	if not arg_114_0.mbDict[arg_114_1] then
		local var_114_0 = _G[var_0_6[arg_114_1]]

		assert(var_114_0, "Missing MapBuilder of type " .. (arg_114_1 or "NIL"))

		arg_114_0.mbDict[arg_114_1] = var_114_0.New(arg_114_0._tf, arg_114_0)
		arg_114_0.mbDict[arg_114_1].isFrozen = arg_114_0:isfrozen()

		arg_114_0.mbDict[arg_114_1]:Load()
	end

	return arg_114_0.mbDict[arg_114_1]
end

function var_0_0.updateMap(arg_115_0, arg_115_1)
	local var_115_0 = arg_115_0.contextData.map
	local var_115_1 = var_115_0:getConfig("anchor")
	local var_115_2

	if var_115_1 == "" then
		var_115_2 = Vector2.zero
	else
		var_115_2 = Vector2(unpack(var_115_1))
	end

	arg_115_0.map.pivot = var_115_2

	local var_115_3 = var_115_0:getConfig("uifx")

	for iter_115_0 = 1, arg_115_0.UIFXList.childCount do
		local var_115_4 = arg_115_0.UIFXList:GetChild(iter_115_0 - 1)

		setActive(var_115_4, var_115_4.name == var_115_3)
	end

	local var_115_5 = arg_115_0.contextData.map:getConfig("ui_type")

	arg_115_0:SwitchMapBuilder(var_115_5)
	arg_115_0.mapBuilder:UpdateMapVO(var_115_0)
	arg_115_0.mapBuilder:UpdateView()
	arg_115_0.mapBuilder:UpdateMapItems()
	arg_115_0:SwitchMapBG(var_115_0, arg_115_1)
	arg_115_0:PlayBGM()
end

function var_0_0.UpdateSwitchMapButton(arg_116_0)
	local var_116_0 = arg_116_0.contextData.map
	local var_116_1 = getProxy(ChapterProxy)
	local var_116_2 = var_116_1:getMapById(var_116_0.id - 1)
	local var_116_3 = var_116_1:getMapById(var_116_0.id + 1)

	setActive(arg_116_0.btnPrev, tobool(var_116_2))
	setActive(arg_116_0.btnNext, tobool(var_116_3))

	local var_116_4 = Color.New(0.5, 0.5, 0.5, 1)

	setImageColor(arg_116_0.btnPrevCol, var_116_2 and Color.white or var_116_4)
	setImageColor(arg_116_0.btnNextCol, var_116_3 and var_116_3:isUnlock() and Color.white or var_116_4)
end

function var_0_0.tryPlayMapStory(arg_117_0)
	if IsUnityEditor and not ENABLE_GUIDE then
		return
	end

	seriesAsync({
		function(arg_118_0)
			local var_118_0 = arg_117_0.contextData.map:getConfig("enter_story")

			if var_118_0 and var_118_0 ~= "" and not pg.NewStoryMgr.GetInstance():IsPlayed(var_118_0) and not arg_117_0.contextData.map:isRemaster() and not pg.SystemOpenMgr.GetInstance().active then
				local var_118_1 = tonumber(var_118_0)

				if var_118_1 and var_118_1 > 0 then
					arg_117_0:emit(LevelMediator2.ON_PERFORM_COMBAT, var_118_1)
				else
					pg.NewStoryMgr.GetInstance():Play(var_118_0, arg_118_0)
				end

				return
			end

			arg_118_0()
		end,
		function(arg_119_0)
			local var_119_0 = arg_117_0.contextData.map:getConfig("guide_id")

			if var_119_0 and var_119_0 ~= "" then
				pg.SystemGuideMgr.GetInstance():PlayByGuideId(var_119_0, nil, arg_119_0)

				return
			end

			arg_119_0()
		end,
		function(arg_120_0)
			if isActive(arg_117_0.actAtelierBuffBtn) and getProxy(ActivityProxy):AtelierActivityAllSlotIsEmpty() and getProxy(ActivityProxy):OwnAtelierActivityItemCnt(34, 1) then
				local var_120_0 = PlayerPrefs.GetInt("first_enter_ryza_buff_" .. getProxy(PlayerProxy):getRawData().id, 0) == 0
				local var_120_1

				if var_120_0 then
					var_120_1 = {
						1,
						2
					}
				else
					var_120_1 = {
						1
					}
				end

				pg.SystemGuideMgr.GetInstance():PlayByGuideId("NG0034", var_120_1)
			else
				arg_120_0()
			end
		end,
		function(arg_121_0)
			if arg_117_0.exited then
				return
			end

			pg.SystemOpenMgr.GetInstance():notification(arg_117_0.player.level)

			if pg.SystemOpenMgr.GetInstance().active then
				getProxy(ChapterProxy):StopAutoFight()
			end
		end
	})
end

function var_0_0.DisplaySPAnim(arg_122_0, arg_122_1, arg_122_2, arg_122_3)
	arg_122_0.uiAnims = arg_122_0.uiAnims or {}

	local var_122_0 = arg_122_0.uiAnims[arg_122_1]

	local function var_122_1()
		arg_122_0.playing = true

		arg_122_0:frozen()
		var_122_0:SetActive(true)

		local var_123_0 = tf(var_122_0)

		pg.UIMgr.GetInstance():OverlayPanel(var_123_0, {
			groupName = LayerWeightConst.GROUP_LEVELUI
		})

		if arg_122_3 then
			arg_122_3(var_122_0)
		end

		var_123_0:GetComponent("DftAniEvent"):SetEndEvent(function(arg_124_0)
			arg_122_0.playing = false

			if arg_122_2 then
				arg_122_2(var_122_0)
			end

			arg_122_0:unfrozen()
		end)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
	end

	if not var_122_0 then
		PoolMgr.GetInstance():GetUI(arg_122_1, true, function(arg_125_0)
			arg_125_0:SetActive(true)

			arg_122_0.uiAnims[arg_122_1] = arg_125_0
			var_122_0 = arg_122_0.uiAnims[arg_122_1]

			var_122_1()
		end)
	else
		var_122_1()
	end
end

function var_0_0.displaySpResult(arg_126_0, arg_126_1, arg_126_2)
	setActive(arg_126_0.spResult, true)
	arg_126_0:DisplaySPAnim(arg_126_1 == 1 and "SpUnitWin" or "SpUnitLose", function(arg_127_0)
		onButton(arg_126_0, arg_127_0, function()
			removeOnButton(arg_127_0)
			setActive(arg_127_0, false)
			pg.UIMgr.GetInstance():UnOverlayPanel(arg_127_0, arg_126_0._tf)
			arg_126_0:hideSpResult()
			arg_126_2()
		end, SFX_PANEL)
	end)
end

function var_0_0.hideSpResult(arg_129_0)
	setActive(arg_129_0.spResult, false)
end

function var_0_0.displayBombResult(arg_130_0, arg_130_1)
	setActive(arg_130_0.spResult, true)
	arg_130_0:DisplaySPAnim("SpBombRet", function(arg_131_0)
		onButton(arg_130_0, arg_131_0, function()
			removeOnButton(arg_131_0)
			setActive(arg_131_0, false)
			pg.UIMgr.GetInstance():UnOverlayPanel(arg_131_0, arg_130_0._tf)
			arg_130_0:hideSpResult()
			arg_130_1()
		end, SFX_PANEL)
	end, function(arg_133_0)
		setText(arg_133_0.transform:Find("right/name_bg/en"), arg_130_0.contextData.chapterVO.modelCount)
	end)
end

function var_0_0.OnLevelInfoPanelConfirm(arg_134_0, arg_134_1, arg_134_2)
	arg_134_0.contextData.chapterLoopFlag = arg_134_2

	local var_134_0 = getProxy(ChapterProxy):getChapterById(arg_134_1, true)

	if var_134_0:getConfig("type") == Chapter.CustomFleet then
		arg_134_0:displayFleetEdit(var_134_0)

		return
	end

	if #var_134_0:getNpcShipByType(1) > 0 then
		arg_134_0:emit(LevelMediator2.ON_TRACKING, arg_134_1)

		return
	end

	arg_134_0:displayFleetSelect(var_134_0)
end

function var_0_0.DisplayLevelInfoPanel(arg_135_0, arg_135_1, arg_135_2)
	seriesAsync({
		function(arg_136_0)
			if not arg_135_0.levelInfoView:GetLoaded() then
				arg_135_0:frozen()
				arg_135_0.levelInfoView:Load()
				arg_135_0.levelInfoView:CallbackInvoke(function()
					arg_135_0:unfrozen()
					arg_136_0()
				end)

				return
			end

			arg_136_0()
		end,
		function(arg_138_0)
			local function var_138_0(arg_139_0, arg_139_1)
				arg_135_0:hideChapterPanel()
				arg_135_0:OnLevelInfoPanelConfirm(arg_139_0, arg_139_1)
			end

			local function var_138_1()
				arg_135_0:hideChapterPanel()
			end

			local var_138_2 = getProxy(ChapterProxy):getChapterById(arg_135_1, true)

			if getProxy(ChapterProxy):getMapById(var_138_2:getConfig("map")):isSkirmish() and #var_138_2:getNpcShipByType(1) > 0 then
				var_138_0(false)

				return
			end

			arg_135_0.levelInfoView:set(arg_135_1, arg_135_2)
			arg_135_0.levelInfoView:setCBFunc(var_138_0, var_138_1)
			arg_135_0.levelInfoView:Show()
		end
	})
end

function var_0_0.hideChapterPanel(arg_141_0)
	if arg_141_0.levelInfoView:isShowing() then
		arg_141_0.levelInfoView:Hide()
	end
end

function var_0_0.destroyChapterPanel(arg_142_0)
	arg_142_0.levelInfoView:Destroy()

	arg_142_0.levelInfoView = nil
end

function var_0_0.DisplayLevelInfoSPPanel(arg_143_0, arg_143_1, arg_143_2, arg_143_3)
	seriesAsync({
		function(arg_144_0)
			if not arg_143_0.levelInfoSPView then
				arg_143_0.levelInfoSPView = LevelInfoSPView.New(arg_143_0.topPanel, arg_143_0.event, arg_143_0.contextData)

				arg_143_0:frozen()
				arg_143_0.levelInfoSPView:Load()
				arg_143_0.levelInfoSPView:CallbackInvoke(function()
					arg_143_0:unfrozen()
					arg_144_0()
				end)

				return
			end

			arg_144_0()
		end,
		function(arg_146_0)
			local function var_146_0(arg_147_0, arg_147_1)
				arg_143_0:HideLevelInfoSPPanel()
				arg_143_0:OnLevelInfoPanelConfirm(arg_147_0, arg_147_1)
			end

			local function var_146_1()
				arg_143_0:HideLevelInfoSPPanel()
			end

			arg_143_0.levelInfoSPView:SetChapterGroupInfo(arg_143_2)
			arg_143_0.levelInfoSPView:set(arg_143_1, arg_143_3)
			arg_143_0.levelInfoSPView:setCBFunc(var_146_0, var_146_1)
			arg_143_0.levelInfoSPView:Show()
		end
	})
end

function var_0_0.HideLevelInfoSPPanel(arg_149_0)
	if arg_149_0.levelInfoSPView and arg_149_0.levelInfoSPView:isShowing() then
		arg_149_0.levelInfoSPView:Hide()
	end
end

function var_0_0.DestroyLevelInfoSPPanel(arg_150_0)
	if not arg_150_0.levelInfoSPView then
		return
	end

	arg_150_0.levelInfoSPView:Destroy()

	arg_150_0.levelInfoSPView = nil
end

function var_0_0.displayFleetSelect(arg_151_0, arg_151_1)
	local var_151_0 = arg_151_0.contextData.selectedFleetIDs or arg_151_1:GetDefaultFleetIndex()

	arg_151_1 = Clone(arg_151_1)
	arg_151_1.loopFlag = arg_151_0.contextData.chapterLoopFlag

	arg_151_0.levelFleetView:updateSpecialOperationTickets(arg_151_0.spTickets)
	arg_151_0.levelFleetView:Load()
	arg_151_0.levelFleetView:ActionInvoke("setHardShipVOs", arg_151_0.shipVOs)
	arg_151_0.levelFleetView:ActionInvoke("setOpenCommanderTag", arg_151_0.openedCommanerSystem)
	arg_151_0.levelFleetView:ActionInvoke("set", arg_151_1, arg_151_0.fleets, var_151_0)
	arg_151_0.levelFleetView:ActionInvoke("Show")
end

function var_0_0.hideFleetSelect(arg_152_0)
	if arg_152_0.levelCMDFormationView:isShowing() then
		arg_152_0.levelCMDFormationView:Hide()
	end

	if arg_152_0.levelFleetView then
		arg_152_0.levelFleetView:Hide()
	end
end

function var_0_0.buildCommanderPanel(arg_153_0)
	arg_153_0.levelCMDFormationView = LevelCMDFormationView.New(arg_153_0.topPanel, arg_153_0.event, arg_153_0.contextData)
end

function var_0_0.destroyFleetSelect(arg_154_0)
	if not arg_154_0.levelFleetView then
		return
	end

	arg_154_0.levelFleetView:Destroy()

	arg_154_0.levelFleetView = nil
end

function var_0_0.displayFleetEdit(arg_155_0, arg_155_1)
	arg_155_1 = Clone(arg_155_1)
	arg_155_1.loopFlag = arg_155_0.contextData.chapterLoopFlag

	arg_155_0.levelFleetView:updateSpecialOperationTickets(arg_155_0.spTickets)
	arg_155_0.levelFleetView:Load()
	arg_155_0.levelFleetView:ActionInvoke("setOpenCommanderTag", arg_155_0.openedCommanerSystem)
	arg_155_0.levelFleetView:ActionInvoke("setHardShipVOs", arg_155_0.shipVOs)
	arg_155_0.levelFleetView:ActionInvoke("setOnHard", arg_155_1)
	arg_155_0.levelFleetView:ActionInvoke("Show")
end

function var_0_0.hideFleetEdit(arg_156_0)
	arg_156_0:hideFleetSelect()
end

function var_0_0.destroyFleetEdit(arg_157_0)
	arg_157_0:destroyFleetSelect()
end

function var_0_0.RefreshFleetSelectView(arg_158_0, arg_158_1)
	if not arg_158_0.levelFleetView then
		return
	end

	assert(arg_158_0.levelFleetView:GetLoaded())

	local var_158_0 = arg_158_0.levelFleetView:IsSelectMode()
	local var_158_1

	if var_158_0 then
		arg_158_0.levelFleetView:ActionInvoke("set", arg_158_1 or arg_158_0.levelFleetView.chapter, arg_158_0.fleets, arg_158_0.levelFleetView:getSelectIds())

		if arg_158_0.levelCMDFormationView:isShowing() then
			local var_158_2 = arg_158_0.levelCMDFormationView.fleet.id

			var_158_1 = arg_158_0.fleets[var_158_2]
		end
	else
		arg_158_0.levelFleetView:ActionInvoke("setOnHard", arg_158_1 or arg_158_0.levelFleetView.chapter)

		if arg_158_0.levelCMDFormationView:isShowing() then
			local var_158_3 = arg_158_0.levelCMDFormationView.fleet.id

			var_158_1 = arg_158_1:wrapEliteFleet(var_158_3)
		end
	end

	if var_158_1 then
		arg_158_0.levelCMDFormationView:ActionInvoke("updateFleet", var_158_1)
	end
end

function var_0_0.setChapter(arg_159_0, arg_159_1)
	local var_159_0

	if arg_159_1 then
		var_159_0 = arg_159_1.id
	end

	arg_159_0.contextData.chapterId = var_159_0
	arg_159_0.contextData.chapterVO = arg_159_1
end

function var_0_0.switchToChapter(arg_160_0, arg_160_1)
	if arg_160_0.contextData.mapIdx ~= arg_160_1:getConfig("map") then
		arg_160_0:setMap(arg_160_1:getConfig("map"))
	end

	arg_160_0:setChapter(arg_160_1)
	setActive(arg_160_0.clouds, false)
	arg_160_0.mapBuilder:HideFloat()

	arg_160_0.leftCanvasGroup.blocksRaycasts = false
	arg_160_0.rightCanvasGroup.blocksRaycasts = false

	assert(not arg_160_0.levelStageView, "LevelStageView Exists On SwitchToChapter")
	arg_160_0:DestroyLevelStageView()

	if not arg_160_0.levelStageView then
		arg_160_0.levelStageView = LevelStageView.New(arg_160_0.topPanel, arg_160_0.event, arg_160_0.contextData)

		arg_160_0.levelStageView:Load()

		arg_160_0.levelStageView.isFrozen = arg_160_0:isfrozen()
	end

	arg_160_0:frozen()

	local function var_160_0()
		seriesAsync({
			function(arg_162_0)
				pg.UIMgr.GetInstance():BlurPanel(arg_160_0.topPanel, false, {
					blurCamList = {
						pg.UIMgr.CameraUI
					},
					groupName = LayerWeightConst.GROUP_LEVELUI
				})
				pg.playerResUI:SetActive({
					active = true,
					groupName = LayerWeightConst.GROUP_LEVELUI,
					showType = PlayerResUI.TYPE_ALL
				})
				arg_160_0.levelStageView:updateStageInfo()
				arg_160_0.levelStageView:updateAmbushRate(arg_160_1.fleet.line, true)
				arg_160_0.levelStageView:updateStageAchieve()
				arg_160_0.levelStageView:updateStageBarrier()
				arg_160_0.levelStageView:updateBombPanel()
				arg_160_0.levelStageView:UpdateDefenseStatus()
				onNextTick(arg_162_0)
			end,
			function(arg_163_0)
				if arg_160_0.exited then
					return
				end

				arg_160_0.levelStageView:updateStageStrategy()

				arg_160_0.canvasGroup.blocksRaycasts = arg_160_0.frozenCount == 0

				onNextTick(arg_163_0)
			end,
			function(arg_164_0)
				if arg_160_0.exited then
					return
				end

				arg_160_0.levelStageView:updateStageFleet()
				arg_160_0.levelStageView:updateSupportFleet()
				arg_160_0.levelStageView:updateFleetBuff()
				onNextTick(arg_164_0)
			end,
			function(arg_165_0)
				if arg_160_0.exited then
					return
				end

				parallelAsync({
					function(arg_166_0)
						local var_166_0 = arg_160_1:getConfig("scale")
						local var_166_1 = LeanTween.value(go(arg_160_0.map), arg_160_0.map.localScale, Vector3.New(var_166_0[3], var_166_0[3], 1), var_0_1):setOnUpdateVector3(function(arg_167_0)
							arg_160_0.map.localScale = arg_167_0
							arg_160_0.float.localScale = arg_167_0
						end):setOnComplete(System.Action(function()
							arg_160_0.mapBuilder:ShowFloat()
							arg_160_0.mapBuilder:Hide()
							arg_166_0()
						end)):setEase(LeanTweenType.easeOutSine)

						arg_160_0:RecordTween("mapScale", var_166_1.uniqueId)

						local var_166_2 = LeanTween.value(go(arg_160_0.map), arg_160_0.map.pivot, Vector2.New(math.clamp(var_166_0[1] - 0.5, 0, 1), math.clamp(var_166_0[2] - 0.5, 0, 1)), var_0_1)

						var_166_2:setOnUpdateVector2(function(arg_169_0)
							arg_160_0.map.pivot = arg_169_0
							arg_160_0.float.pivot = arg_169_0
						end):setEase(LeanTweenType.easeOutSine)
						arg_160_0:RecordTween("mapPivot", var_166_2.uniqueId)
						shiftPanel(arg_160_0.leftChapter, -arg_160_0.leftChapter.rect.width - 200, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
						shiftPanel(arg_160_0.rightChapter, arg_160_0.rightChapter.rect.width + 200, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
						shiftPanel(arg_160_0.topChapter, 0, arg_160_0.topChapter.rect.height, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
						arg_160_0.levelStageView:ShiftStagePanelIn()
					end,
					function(arg_170_0)
						arg_160_0:PlayBGM()

						local var_170_0 = {}
						local var_170_1 = arg_160_1:getConfig("bg")

						if var_170_1 and #var_170_1 > 0 then
							var_170_0[1] = {
								BG = var_170_1
							}
						end

						arg_160_0:SwitchBG(var_170_0, arg_170_0)
					end
				}, function()
					onNextTick(arg_165_0)
				end)
			end,
			function(arg_172_0)
				if arg_160_0.exited then
					return
				end

				setActive(arg_160_0.topChapter, false)
				setActive(arg_160_0.leftChapter, false)
				setActive(arg_160_0.rightChapter, false)

				arg_160_0.leftCanvasGroup.blocksRaycasts = true
				arg_160_0.rightCanvasGroup.blocksRaycasts = true

				arg_160_0:initGrid(arg_172_0)
			end,
			function(arg_173_0)
				if arg_160_0.exited then
					return
				end

				arg_160_0.levelStageView:SetGrid(arg_160_0.grid)

				arg_160_0.contextData.huntingRangeVisibility = arg_160_0.contextData.huntingRangeVisibility - 1

				arg_160_0.grid:toggleHuntingRange()

				local var_173_0 = arg_160_1:getConfig("pop_pic")

				if var_173_0 and #var_173_0 > 0 and arg_160_0.FirstEnterChapter == arg_160_1.id then
					arg_160_0:doPlayAnim(var_173_0, function(arg_174_0)
						setActive(arg_174_0, false)

						if arg_160_0.exited then
							return
						end

						arg_173_0()
					end)
				else
					arg_173_0()
				end
			end,
			function(arg_175_0)
				arg_160_0.levelStageView:tryAutoAction(arg_175_0)
			end,
			function(arg_176_0)
				if arg_160_0.exited then
					return
				end

				arg_160_0:unfrozen()

				if arg_160_0.FirstEnterChapter then
					arg_160_0:emit(LevelMediator2.ON_RESUME_SUBSTATE, arg_160_1.subAutoAttack)
				end

				arg_160_0.FirstEnterChapter = nil

				arg_160_0.levelStageView:tryAutoTrigger(true)
			end
		})
	end

	arg_160_0.levelStageView:ActionInvoke("SetSeriesOperation", var_160_0)
	arg_160_0.levelStageView:ActionInvoke("SetPlayer", arg_160_0.player)
	arg_160_0.levelStageView:ActionInvoke("SwitchToChapter", arg_160_1)
end

function var_0_0.switchToMap(arg_177_0, arg_177_1)
	arg_177_0:frozen()
	arg_177_0:destroyGrid()
	arg_177_0:setChapter(nil)
	LeanTween.cancel(go(arg_177_0.map))

	local var_177_0 = LeanTween.value(go(arg_177_0.map), arg_177_0.map.localScale, Vector3.one, var_0_1):setOnUpdateVector3(function(arg_178_0)
		arg_177_0.map.localScale = arg_178_0
		arg_177_0.float.localScale = arg_178_0
	end):setOnComplete(System.Action(function()
		arg_177_0:unfrozen()
		existCall(arg_177_1)
	end)):setEase(LeanTweenType.easeOutSine)

	arg_177_0:RecordTween("mapScale", var_177_0.uniqueId)

	local var_177_1 = arg_177_0.contextData.map:getConfig("anchor")
	local var_177_2

	if var_177_1 == "" then
		var_177_2 = Vector2.zero
	else
		var_177_2 = Vector2(unpack(var_177_1))
	end

	local var_177_3 = LeanTween.value(go(arg_177_0.map), arg_177_0.map.pivot, var_177_2, var_0_1)

	var_177_3:setOnUpdateVector2(function(arg_180_0)
		arg_177_0.map.pivot = arg_180_0
		arg_177_0.float.pivot = arg_180_0
	end):setEase(LeanTweenType.easeOutSine)
	arg_177_0:RecordTween("mapPivot", var_177_3.uniqueId)
	setActive(arg_177_0.topChapter, true)
	setActive(arg_177_0.leftChapter, true)
	setActive(arg_177_0.rightChapter, true)
	shiftPanel(arg_177_0.leftChapter, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(arg_177_0.rightChapter, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(arg_177_0.topChapter, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	assert(arg_177_0.levelStageView, "LevelStageView Doesnt Exist On SwitchToMap")

	if arg_177_0.levelStageView then
		arg_177_0.levelStageView:ActionInvoke("ShiftStagePanelOut", function()
			arg_177_0:DestroyLevelStageView()
		end)
		arg_177_0.levelStageView:ActionInvoke("SwitchToMap")
	end

	arg_177_0:SwitchMapBG(arg_177_0.contextData.map)
	arg_177_0.mapBuilder:Show()
	arg_177_0.mapBuilder:UpdateView()
	arg_177_0.mapBuilder:UpdateMapItems()
	arg_177_0:PlayBGM()
	pg.UIMgr.GetInstance():UnblurPanel(arg_177_0.topPanel, arg_177_0._tf)
	pg.playerResUI:SetActive({
		active = false
	})

	arg_177_0.canvasGroup.blocksRaycasts = arg_177_0.frozenCount == 0
	arg_177_0.canvasGroup.interactable = true

	if arg_177_0.ambushWarning and arg_177_0.ambushWarning.activeSelf then
		arg_177_0.ambushWarning:SetActive(false)
		arg_177_0:unfrozen()
	end
end

function var_0_0.SwitchBG(arg_182_0, arg_182_1, arg_182_2, arg_182_3)
	if not arg_182_1 or #arg_182_1 <= 0 then
		existCall(arg_182_2)

		return
	elseif arg_182_3 then
		-- block empty
	elseif table.equal(arg_182_0.currentBG, arg_182_1) then
		return
	end

	arg_182_0.currentBG = arg_182_1

	for iter_182_0, iter_182_1 in ipairs(arg_182_0.mapGroup) do
		arg_182_0.loader:ClearRequest(iter_182_1)
	end

	table.clear(arg_182_0.mapGroup)

	local var_182_0 = {}

	table.ParallelIpairsAsync(arg_182_1, function(arg_183_0, arg_183_1, arg_183_2)
		local var_183_0 = arg_182_0.mapTFs[arg_183_0]
		local var_183_1 = arg_183_1.bgPrefix and arg_183_1.bgPrefix .. "/" or "levelmap/"
		local var_183_2 = arg_182_0.loader:GetSpriteDirect(var_183_1 .. arg_183_1.BG, "", function(arg_184_0)
			var_182_0[arg_183_0] = arg_184_0

			arg_183_2()
		end, var_183_0)

		table.insert(arg_182_0.mapGroup, var_183_2)
		arg_182_0:updateCouldAnimator(arg_183_1.Animator, arg_183_0)
	end, function()
		for iter_185_0, iter_185_1 in ipairs(arg_182_0.mapTFs) do
			setImageSprite(iter_185_1, var_182_0[iter_185_0])
			setActive(iter_185_1, arg_182_1[iter_185_0])
			SetCompomentEnabled(iter_185_1, typeof(Image), true)
		end

		existCall(arg_182_2)
	end)
end

local var_0_7 = {
	1520001,
	1520002,
	1520011,
	1520012
}
local var_0_8 = {
	{
		1420008,
		"map_1420008",
		1420021,
		"map_1420001"
	},
	{
		1420018,
		"map_1420018",
		1420031,
		"map_1420011"
	}
}
local var_0_9 = {
	1420001,
	1420011
}

function var_0_0.ClearMapTransitions(arg_186_0)
	if not arg_186_0.mapTransitions then
		return
	end

	for iter_186_0, iter_186_1 in pairs(arg_186_0.mapTransitions) do
		if iter_186_1 then
			PoolMgr.GetInstance():ReturnPrefab("ui/" .. iter_186_0, iter_186_0, iter_186_1, true)
		else
			PoolMgr.GetInstance():DestroyPrefab("ui/" .. iter_186_0, iter_186_0)
		end
	end

	arg_186_0.mapTransitions = nil
end

function var_0_0.SwitchMapBG(arg_187_0, arg_187_1, arg_187_2, arg_187_3)
	local var_187_0, var_187_1, var_187_2 = arg_187_0:GetMapBG(arg_187_1, arg_187_2)

	if not var_187_1 then
		arg_187_0:SwitchBG(var_187_0, nil, arg_187_3)

		return
	end

	arg_187_0:PlayMapTransition("LevelMapTransition_" .. var_187_1, var_187_2, function()
		arg_187_0:SwitchBG(var_187_0, nil, arg_187_3)
	end)
end

function var_0_0.GetMapBG(arg_189_0, arg_189_1, arg_189_2)
	if not table.contains(var_0_7, arg_189_1.id) then
		return {
			arg_189_0:GetMapElement(arg_189_1)
		}
	end

	local var_189_0 = arg_189_1.id
	local var_189_1 = table.indexof(var_0_7, var_189_0) - 1
	local var_189_2 = bit.lshift(bit.rshift(var_189_1, 1), 1) + 1
	local var_189_3 = {
		var_0_7[var_189_2],
		var_0_7[var_189_2 + 1]
	}
	local var_189_4 = _.map(var_189_3, function(arg_190_0)
		return getProxy(ChapterProxy):getMapById(arg_190_0)
	end)

	if _.all(var_189_4, function(arg_191_0)
		return arg_191_0:isAllChaptersClear()
	end) then
		local var_189_5 = {
			arg_189_0:GetMapElement(arg_189_1)
		}

		if not arg_189_2 or math.abs(var_189_0 - arg_189_2) ~= 1 then
			return var_189_5
		end

		local var_189_6 = var_0_9[bit.rshift(var_189_2 - 1, 1) + 1]
		local var_189_7 = bit.band(var_189_1, 1) == 1

		return var_189_5, var_189_6, var_189_7
	else
		local var_189_8 = 0

		;(function()
			local var_192_0 = var_189_4[1]:getChapters()

			for iter_192_0, iter_192_1 in ipairs(var_192_0) do
				if not iter_192_1:isClear() then
					return
				end

				var_189_8 = var_189_8 + 1
			end

			if not var_189_4[2]:isAnyChapterUnlocked(true) then
				return
			end

			var_189_8 = var_189_8 + 1

			local var_192_1 = var_189_4[2]:getChapters()

			for iter_192_2, iter_192_3 in ipairs(var_192_1) do
				if not iter_192_3:isClear() then
					return
				end

				var_189_8 = var_189_8 + 1
			end
		end)()

		local var_189_9

		if var_189_8 > 0 then
			local var_189_10 = var_0_8[bit.rshift(var_189_2 - 1, 1) + 1]

			var_189_9 = {
				{
					BG = "map_" .. var_189_10[1],
					Animator = var_189_10[2]
				},
				{
					BG = "map_" .. var_189_10[3] + var_189_8,
					Animator = var_189_10[4]
				}
			}
		else
			var_189_9 = {
				arg_189_0:GetMapElement(arg_189_1)
			}
		end

		return var_189_9
	end
end

function var_0_0.GetMapElement(arg_193_0, arg_193_1)
	local var_193_0 = arg_193_1:getConfig("bg")
	local var_193_1 = arg_193_1:getConfig("ani_controller")

	if var_193_1 and #var_193_1 > 0 then
		(function()
			for iter_194_0, iter_194_1 in ipairs(var_193_1) do
				local var_194_0 = _.rest(iter_194_1[2], 2)

				for iter_194_2, iter_194_3 in ipairs(var_194_0) do
					if string.find(iter_194_3, "^map_") and iter_194_1[1] == var_0_3 then
						local var_194_1 = iter_194_1[2][1]
						local var_194_2 = getProxy(ChapterProxy):GetChapterItemById(var_194_1)

						if var_194_2 and not var_194_2:isClear() then
							var_193_0 = iter_194_3

							return
						end
					end
				end
			end
		end)()
	end

	local var_193_2 = {
		BG = var_193_0
	}

	var_193_2.Animator, var_193_2.AnimatorController = arg_193_0:GetMapAnimator(arg_193_1)

	return var_193_2
end

function var_0_0.GetMapAnimator(arg_195_0, arg_195_1)
	local var_195_0 = arg_195_1:getConfig("ani_name")

	if arg_195_1:getConfig("animtor") == 1 and var_195_0 and #var_195_0 > 0 then
		local var_195_1 = arg_195_1:getConfig("ani_controller")

		if var_195_1 and #var_195_1 > 0 then
			(function()
				for iter_196_0, iter_196_1 in ipairs(var_195_1) do
					local var_196_0 = _.rest(iter_196_1[2], 2)

					for iter_196_2, iter_196_3 in ipairs(var_196_0) do
						if string.find(iter_196_3, "^effect_") and iter_196_1[1] == var_0_3 then
							local var_196_1 = iter_196_1[2][1]
							local var_196_2 = getProxy(ChapterProxy):GetChapterItemById(var_196_1)

							if var_196_2 and not var_196_2:isClear() then
								var_195_0 = "map_" .. string.sub(iter_196_3, 8)

								return
							end
						end
					end
				end
			end)()
		end

		return var_195_0, var_195_1
	end
end

function var_0_0.PlayMapTransition(arg_197_0, arg_197_1, arg_197_2, arg_197_3, arg_197_4)
	arg_197_0.mapTransitions = arg_197_0.mapTransitions or {}

	local var_197_0

	local function var_197_1()
		arg_197_0:frozen()
		existCall(arg_197_3, var_197_0)
		var_197_0:SetActive(true)

		local var_198_0 = tf(var_197_0)

		pg.UIMgr.GetInstance():OverlayPanel(var_198_0, {
			groupName = LayerWeightConst.GROUP_LEVELUI
		})
		var_197_0:GetComponent(typeof(Animator)):Play(arg_197_2 and "Sequence" or "Inverted", -1, 0)
		var_198_0:GetComponent("DftAniEvent"):SetEndEvent(function(arg_199_0)
			pg.UIMgr.GetInstance():UnOverlayPanel(var_198_0, arg_197_0._tf)
			existCall(arg_197_4, var_197_0)
			PoolMgr.GetInstance():ReturnPrefab("ui/" .. arg_197_1, arg_197_1, var_197_0)

			arg_197_0.mapTransitions[arg_197_1] = false

			arg_197_0:unfrozen()
		end)
	end

	PoolMgr.GetInstance():GetPrefab("ui/" .. arg_197_1, arg_197_1, true, function(arg_200_0)
		var_197_0 = arg_200_0
		arg_197_0.mapTransitions[arg_197_1] = arg_200_0

		var_197_1()
	end)
end

function var_0_0.DestroyLevelStageView(arg_201_0)
	if arg_201_0.levelStageView then
		arg_201_0.levelStageView:Destroy()

		arg_201_0.levelStageView = nil
	end
end

function var_0_0.displayAmbushInfo(arg_202_0, arg_202_1)
	arg_202_0.levelAmbushView = LevelAmbushView.New(arg_202_0.topPanel, arg_202_0.event, arg_202_0.contextData)

	arg_202_0.levelAmbushView:Load()
	arg_202_0.levelAmbushView:ActionInvoke("SetFuncOnComplete", arg_202_1)
end

function var_0_0.hideAmbushInfo(arg_203_0)
	if arg_203_0.levelAmbushView then
		arg_203_0.levelAmbushView:Destroy()

		arg_203_0.levelAmbushView = nil
	end
end

function var_0_0.doAmbushWarning(arg_204_0, arg_204_1)
	arg_204_0:frozen()

	local function var_204_0()
		arg_204_0.ambushWarning:SetActive(true)

		local var_205_0 = tf(arg_204_0.ambushWarning)

		var_205_0:SetParent(pg.UIMgr.GetInstance().OverlayMain.transform, false)
		var_205_0:SetSiblingIndex(1)

		local var_205_1 = var_205_0:GetComponent("DftAniEvent")

		var_205_1:SetTriggerEvent(function(arg_206_0)
			arg_204_1()
		end)
		var_205_1:SetEndEvent(function(arg_207_0)
			arg_204_0.ambushWarning:SetActive(false)
			arg_204_0:unfrozen()
		end)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
		Timer.New(function()
			pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
		end, 1, 1):Start()
	end

	if not arg_204_0.ambushWarning then
		PoolMgr.GetInstance():GetUI("ambushwarnui", true, function(arg_209_0)
			arg_209_0:SetActive(true)

			arg_204_0.ambushWarning = arg_209_0

			var_204_0()
		end)
	else
		var_204_0()
	end
end

function var_0_0.destroyAmbushWarn(arg_210_0)
	if arg_210_0.ambushWarning then
		PoolMgr.GetInstance():ReturnUI("ambushwarnui", arg_210_0.ambushWarning)

		arg_210_0.ambushWarning = nil
	end
end

function var_0_0.displayStrategyInfo(arg_211_0, arg_211_1)
	arg_211_0.levelStrategyView = LevelStrategyView.New(arg_211_0.topPanel, arg_211_0.event, arg_211_0.contextData)

	arg_211_0.levelStrategyView:Load()
	arg_211_0.levelStrategyView:ActionInvoke("set", arg_211_1)

	local function var_211_0()
		local var_212_0 = arg_211_0.contextData.chapterVO.fleet
		local var_212_1 = pg.strategy_data_template[arg_211_1.id]

		if not var_212_0:canUseStrategy(arg_211_1) then
			return
		end

		local var_212_2 = var_212_0:getNextStgUser(arg_211_1.id)

		if var_212_1.type == ChapterConst.StgTypeForm then
			arg_211_0:emit(LevelMediator2.ON_OP, {
				type = ChapterConst.OpStrategy,
				id = var_212_2,
				arg1 = arg_211_1.id
			})
		elseif var_212_1.type == ChapterConst.StgTypeConsume then
			arg_211_0:emit(LevelMediator2.ON_OP, {
				type = ChapterConst.OpStrategy,
				id = var_212_2,
				arg1 = arg_211_1.id
			})
		end

		arg_211_0:hideStrategyInfo()
	end

	local function var_211_1()
		arg_211_0:hideStrategyInfo()
	end

	arg_211_0.levelStrategyView:ActionInvoke("setCBFunc", var_211_0, var_211_1)
end

function var_0_0.hideStrategyInfo(arg_214_0)
	if arg_214_0.levelStrategyView then
		arg_214_0.levelStrategyView:Destroy()

		arg_214_0.levelStrategyView = nil
	end
end

function var_0_0.displayRepairWindow(arg_215_0, arg_215_1)
	local var_215_0 = arg_215_0.contextData.chapterVO
	local var_215_1 = getProxy(ChapterProxy)
	local var_215_2
	local var_215_3
	local var_215_4
	local var_215_5
	local var_215_6 = var_215_1.repairTimes
	local var_215_7, var_215_8, var_215_9 = ChapterConst.GetRepairParams()

	arg_215_0.levelRepairView = LevelRepairView.New(arg_215_0.topPanel, arg_215_0.event, arg_215_0.contextData)

	arg_215_0.levelRepairView:Load()
	arg_215_0.levelRepairView:ActionInvoke("set", var_215_6, var_215_7, var_215_8, var_215_9)

	local function var_215_10()
		if var_215_7 - math.min(var_215_6, var_215_7) == 0 and arg_215_0.player:getTotalGem() < var_215_9 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_rmb"))

			return
		end

		arg_215_0:emit(LevelMediator2.ON_OP, {
			type = ChapterConst.OpRepair,
			id = var_215_0.fleet.id,
			arg1 = arg_215_1.id
		})
		arg_215_0:hideRepairWindow()
	end

	local function var_215_11()
		arg_215_0:hideRepairWindow()
	end

	arg_215_0.levelRepairView:ActionInvoke("setCBFunc", var_215_10, var_215_11)
end

function var_0_0.hideRepairWindow(arg_218_0)
	if arg_218_0.levelRepairView then
		arg_218_0.levelRepairView:Destroy()

		arg_218_0.levelRepairView = nil
	end
end

function var_0_0.displayRemasterPanel(arg_219_0, arg_219_1)
	arg_219_0.levelRemasterView:Load()

	local function var_219_0(arg_220_0)
		arg_219_0:ShowSelectedMap(arg_220_0)
	end

	arg_219_0.levelRemasterView:ActionInvoke("Show")
	arg_219_0.levelRemasterView:ActionInvoke("set", var_219_0, arg_219_1)
end

function var_0_0.hideRemasterPanel(arg_221_0)
	if arg_221_0.levelRemasterView:isShowing() then
		arg_221_0.levelRemasterView:ActionInvoke("Hide")
	end
end

function var_0_0.initGrid(arg_222_0, arg_222_1)
	local var_222_0 = arg_222_0.contextData.chapterVO

	if not var_222_0 then
		return
	end

	arg_222_0:enableLevelCamera()
	setActive(arg_222_0.uiMain, true)

	arg_222_0.levelGrid.localEulerAngles = Vector3(var_222_0.theme.angle, 0, 0)
	arg_222_0.grid = LevelGrid.New(arg_222_0.dragLayer)

	arg_222_0.grid:attach(arg_222_0)
	arg_222_0.grid:ExtendItem("shipTpl", arg_222_0.shipTpl)
	arg_222_0.grid:ExtendItem("subTpl", arg_222_0.subTpl)
	arg_222_0.grid:ExtendItem("transportTpl", arg_222_0.transportTpl)
	arg_222_0.grid:ExtendItem("enemyTpl", arg_222_0.enemyTpl)
	arg_222_0.grid:ExtendItem("championTpl", arg_222_0.championTpl)
	arg_222_0.grid:ExtendItem("oniTpl", arg_222_0.oniTpl)
	arg_222_0.grid:ExtendItem("arrowTpl", arg_222_0.arrowTarget)
	arg_222_0.grid:ExtendItem("destinationMarkTpl", arg_222_0.destinationMarkTpl)

	function arg_222_0.grid.onShipStepChange(arg_223_0)
		arg_222_0.levelStageView:updateAmbushRate(arg_223_0)
	end

	arg_222_0.grid:initAll(arg_222_1)
end

function var_0_0.destroyGrid(arg_224_0)
	if arg_224_0.grid then
		arg_224_0.grid:detach()

		arg_224_0.grid = nil

		arg_224_0:disableLevelCamera()
		setActive(arg_224_0.dragLayer, true)
		setActive(arg_224_0.uiMain, false)
	end
end

function var_0_0.doTracking(arg_225_0, arg_225_1)
	arg_225_0:frozen()

	local function var_225_0()
		arg_225_0.radar:SetActive(true)

		local var_226_0 = tf(arg_225_0.radar)

		var_226_0:SetParent(arg_225_0.topPanel, false)
		var_226_0:SetSiblingIndex(1)
		var_226_0:GetComponent("DftAniEvent"):SetEndEvent(function(arg_227_0)
			arg_225_0.radar:SetActive(false)
			arg_225_0:unfrozen()
			arg_225_1()
		end)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WEIGHANCHOR_SEARCH)
	end

	if not arg_225_0.radar then
		PoolMgr.GetInstance():GetUI("RadarEffectUI", true, function(arg_228_0)
			arg_228_0:SetActive(true)

			arg_225_0.radar = arg_228_0

			var_225_0()
		end)
	else
		var_225_0()
	end
end

function var_0_0.destroyTracking(arg_229_0)
	if arg_229_0.radar then
		PoolMgr.GetInstance():ReturnUI("RadarEffectUI", arg_229_0.radar)

		arg_229_0.radar = nil
	end
end

function var_0_0.doPlayAirStrike(arg_230_0, arg_230_1, arg_230_2, arg_230_3)
	local function var_230_0()
		arg_230_0.playing = true

		arg_230_0:frozen()
		arg_230_0.airStrike:SetActive(true)

		local var_231_0 = tf(arg_230_0.airStrike)

		var_231_0:SetParent(pg.UIMgr.GetInstance().OverlayMain.transform, false)
		var_231_0:SetAsLastSibling()
		setActive(var_231_0:Find("words/be_striked"), arg_230_1 == ChapterConst.SubjectChampion)
		setActive(var_231_0:Find("words/strike_enemy"), arg_230_1 == ChapterConst.SubjectPlayer)

		local function var_231_1()
			arg_230_0.playing = false

			SetActive(arg_230_0.airStrike, false)

			if arg_230_3 then
				arg_230_3()
			end

			arg_230_0:unfrozen()
		end

		var_231_0:GetComponent("DftAniEvent"):SetEndEvent(var_231_1)

		if arg_230_2 then
			onButton(arg_230_0, var_231_0, var_231_1, SFX_PANEL)
		else
			removeOnButton(var_231_0)
		end

		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
	end

	if not arg_230_0.airStrike then
		PoolMgr.GetInstance():GetUI("AirStrike", true, function(arg_233_0)
			arg_233_0:SetActive(true)

			arg_230_0.airStrike = arg_233_0

			var_230_0()
		end)
	else
		var_230_0()
	end
end

function var_0_0.destroyAirStrike(arg_234_0)
	if arg_234_0.airStrike then
		arg_234_0.airStrike:GetComponent("DftAniEvent"):SetEndEvent(nil)
		PoolMgr.GetInstance():ReturnUI("AirStrike", arg_234_0.airStrike)

		arg_234_0.airStrike = nil
	end
end

function var_0_0.doPlayAnim(arg_235_0, arg_235_1, arg_235_2, arg_235_3)
	arg_235_0.uiAnims = arg_235_0.uiAnims or {}

	local var_235_0 = arg_235_0.uiAnims[arg_235_1]

	local function var_235_1()
		arg_235_0.playing = true

		arg_235_0:frozen()
		var_235_0:SetActive(true)

		local var_236_0 = tf(var_235_0)

		pg.UIMgr.GetInstance():OverlayPanel(var_236_0, {
			groupName = LayerWeightConst.GROUP_LEVELUI
		})

		if arg_235_3 then
			arg_235_3(var_235_0)
		end

		var_236_0:GetComponent("DftAniEvent"):SetEndEvent(function(arg_237_0)
			arg_235_0.playing = false

			pg.UIMgr.GetInstance():UnOverlayPanel(var_236_0, arg_235_0._tf)

			if arg_235_2 then
				arg_235_2(var_235_0)
			end

			arg_235_0:unfrozen()
		end)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
	end

	if not var_235_0 then
		PoolMgr.GetInstance():GetUI(arg_235_1, true, function(arg_238_0)
			arg_238_0:SetActive(true)

			arg_235_0.uiAnims[arg_235_1] = arg_238_0
			var_235_0 = arg_235_0.uiAnims[arg_235_1]

			var_235_1()
		end)
	else
		var_235_1()
	end
end

function var_0_0.destroyUIAnims(arg_239_0)
	if arg_239_0.uiAnims then
		for iter_239_0, iter_239_1 in pairs(arg_239_0.uiAnims) do
			pg.UIMgr.GetInstance():UnOverlayPanel(tf(iter_239_1), arg_239_0._tf)
			iter_239_1:GetComponent("DftAniEvent"):SetEndEvent(nil)
			PoolMgr.GetInstance():ReturnUI(iter_239_0, iter_239_1)
		end

		arg_239_0.uiAnims = nil
	end
end

function var_0_0.doPlayTorpedo(arg_240_0, arg_240_1)
	local function var_240_0()
		arg_240_0.playing = true

		arg_240_0:frozen()
		arg_240_0.torpetoAni:SetActive(true)

		local var_241_0 = tf(arg_240_0.torpetoAni)

		var_241_0:SetParent(arg_240_0.topPanel, false)
		var_241_0:SetAsLastSibling()
		var_241_0:GetComponent("DftAniEvent"):SetEndEvent(function(arg_242_0)
			arg_240_0.playing = false

			SetActive(arg_240_0.torpetoAni, false)

			if arg_240_1 then
				arg_240_1()
			end

			arg_240_0:unfrozen()
		end)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
	end

	if not arg_240_0.torpetoAni then
		PoolMgr.GetInstance():GetUI("Torpeto", true, function(arg_243_0)
			arg_243_0:SetActive(true)

			arg_240_0.torpetoAni = arg_243_0

			var_240_0()
		end)
	else
		var_240_0()
	end
end

function var_0_0.destroyTorpedo(arg_244_0)
	if arg_244_0.torpetoAni then
		arg_244_0.torpetoAni:GetComponent("DftAniEvent"):SetEndEvent(nil)
		PoolMgr.GetInstance():ReturnUI("Torpeto", arg_244_0.torpetoAni)

		arg_244_0.torpetoAni = nil
	end
end

function var_0_0.doPlayStrikeAnim(arg_245_0, arg_245_1, arg_245_2, arg_245_3)
	arg_245_0.strikeAnims = arg_245_0.strikeAnims or {}

	local var_245_0
	local var_245_1
	local var_245_2

	local function var_245_3()
		if coroutine.status(var_245_2) == "suspended" then
			local var_246_0, var_246_1 = coroutine.resume(var_245_2)

			assert(var_246_0, debug.traceback(var_245_2, var_246_1))
		end
	end

	var_245_2 = coroutine.create(function()
		arg_245_0.playing = true

		arg_245_0:frozen()

		local var_247_0 = arg_245_0.strikeAnims[arg_245_2]

		setActive(var_247_0, true)

		local var_247_1 = tf(var_247_0)
		local var_247_2 = findTF(var_247_1, "torpedo")
		local var_247_3 = findTF(var_247_1, "mask/painting")
		local var_247_4 = findTF(var_247_1, "ship")

		setParent(var_245_0, var_247_3:Find("fitter"), false)
		setParent(var_245_1, var_247_4, false)
		setActive(var_247_4, false)
		setActive(var_247_2, false)
		var_247_1:SetParent(pg.UIMgr.GetInstance().OverlayMain.transform, false)
		var_247_1:SetAsLastSibling()

		local var_247_5 = var_247_1:GetComponent("DftAniEvent")
		local var_247_6 = var_245_1:GetComponent("SpineAnimUI")
		local var_247_7 = var_247_6:GetComponent("SkeletonGraphic")

		var_247_5:SetStartEvent(function(arg_248_0)
			var_247_6:SetAction("attack", 0)

			var_247_7.freeze = true
		end)
		var_247_5:SetTriggerEvent(function(arg_249_0)
			var_247_7.freeze = false

			var_247_6:SetActionCallBack(function(arg_250_0)
				if arg_250_0 == "action" then
					-- block empty
				elseif arg_250_0 == "finish" then
					var_247_7.freeze = true
				end
			end)
		end)
		var_247_5:SetEndEvent(function(arg_251_0)
			var_247_7.freeze = false

			var_245_3()
		end)
		onButton(arg_245_0, var_247_1, var_245_3, SFX_CANCEL)
		coroutine.yield()
		retPaintingPrefab(var_247_3, arg_245_1:getPainting())
		var_247_6:SetActionCallBack(nil)

		var_247_7.freeze = false

		PoolMgr.GetInstance():ReturnSpineChar(arg_245_1:getPrefab(), var_245_1)
		setActive(var_247_0, false)

		arg_245_0.playing = false

		arg_245_0:unfrozen()

		if arg_245_3 then
			arg_245_3()
		end
	end)

	local function var_245_4()
		if arg_245_0.strikeAnims[arg_245_2] and var_245_0 and var_245_1 then
			var_245_3()
		end
	end

	PoolMgr.GetInstance():GetPainting(arg_245_1:getPainting(), true, function(arg_253_0)
		var_245_0 = arg_253_0

		ShipExpressionHelper.SetExpression(var_245_0, arg_245_1:getPainting())
		var_245_4()
	end)
	PoolMgr.GetInstance():GetSpineChar(arg_245_1:getPrefab(), true, function(arg_254_0)
		var_245_1 = arg_254_0
		var_245_1.transform.localScale = Vector3.one

		var_245_4()
	end)

	if not arg_245_0.strikeAnims[arg_245_2] then
		PoolMgr.GetInstance():GetUI(arg_245_2, true, function(arg_255_0)
			arg_245_0.strikeAnims[arg_245_2] = arg_255_0

			var_245_4()
		end)
	end
end

function var_0_0.destroyStrikeAnim(arg_256_0)
	if arg_256_0.strikeAnims then
		for iter_256_0, iter_256_1 in pairs(arg_256_0.strikeAnims) do
			iter_256_1:GetComponent("DftAniEvent"):SetEndEvent(nil)
			PoolMgr.GetInstance():ReturnUI(iter_256_0, iter_256_1)
		end

		arg_256_0.strikeAnims = nil
	end
end

function var_0_0.doPlayEnemyAnim(arg_257_0, arg_257_1, arg_257_2, arg_257_3)
	arg_257_0.strikeAnims = arg_257_0.strikeAnims or {}

	local var_257_0
	local var_257_1

	local function var_257_2()
		if coroutine.status(var_257_1) == "suspended" then
			local var_258_0, var_258_1 = coroutine.resume(var_257_1)

			assert(var_258_0, debug.traceback(var_257_1, var_258_1))
		end
	end

	var_257_1 = coroutine.create(function()
		arg_257_0.playing = true

		arg_257_0:frozen()

		local var_259_0 = arg_257_0.strikeAnims[arg_257_2]

		setActive(var_259_0, true)

		local var_259_1 = tf(var_259_0)
		local var_259_2 = findTF(var_259_1, "torpedo")
		local var_259_3 = findTF(var_259_1, "ship")

		setParent(var_257_0, var_259_3, false)
		setActive(var_259_3, false)
		setActive(var_259_2, false)
		var_259_1:SetParent(pg.UIMgr.GetInstance().OverlayMain.transform, false)
		var_259_1:SetAsLastSibling()

		local var_259_4 = var_259_1:GetComponent("DftAniEvent")
		local var_259_5 = var_257_0:GetComponent("SpineAnimUI")
		local var_259_6 = var_259_5:GetComponent("SkeletonGraphic")

		var_259_4:SetStartEvent(function(arg_260_0)
			var_259_5:SetAction("attack", 0)

			var_259_6.freeze = true
		end)
		var_259_4:SetTriggerEvent(function(arg_261_0)
			var_259_6.freeze = false

			var_259_5:SetActionCallBack(function(arg_262_0)
				if arg_262_0 == "action" then
					-- block empty
				elseif arg_262_0 == "finish" then
					var_259_6.freeze = true
				end
			end)
		end)
		var_259_4:SetEndEvent(function(arg_263_0)
			var_259_6.freeze = false

			var_257_2()
		end)
		onButton(arg_257_0, var_259_1, var_257_2, SFX_CANCEL)
		coroutine.yield()
		var_259_5:SetActionCallBack(nil)

		var_259_6.freeze = false

		PoolMgr.GetInstance():ReturnSpineChar(arg_257_1:getPrefab(), var_257_0)
		setActive(var_259_0, false)

		arg_257_0.playing = false

		arg_257_0:unfrozen()

		if arg_257_3 then
			arg_257_3()
		end
	end)

	local function var_257_3()
		if arg_257_0.strikeAnims[arg_257_2] and var_257_0 then
			var_257_2()
		end
	end

	PoolMgr.GetInstance():GetSpineChar(arg_257_1:getPrefab(), true, function(arg_265_0)
		var_257_0 = arg_265_0
		var_257_0.transform.localScale = Vector3.one

		var_257_3()
	end)

	if not arg_257_0.strikeAnims[arg_257_2] then
		PoolMgr.GetInstance():GetUI(arg_257_2, true, function(arg_266_0)
			arg_257_0.strikeAnims[arg_257_2] = arg_266_0

			var_257_3()
		end)
	end
end

function var_0_0.doPlayCommander(arg_267_0, arg_267_1, arg_267_2)
	arg_267_0:frozen()
	setActive(arg_267_0.commanderTinkle, true)

	local var_267_0 = arg_267_1:getSkills()

	setText(arg_267_0.commanderTinkle:Find("name"), #var_267_0 > 0 and var_267_0[1]:getConfig("name") or "")
	setImageSprite(arg_267_0.commanderTinkle:Find("icon"), GetSpriteFromAtlas("commanderhrz/" .. arg_267_1:getConfig("painting"), ""))

	local var_267_1 = arg_267_0.commanderTinkle:GetComponent(typeof(CanvasGroup))

	var_267_1.alpha = 0

	local var_267_2 = Vector2(248, 237)

	LeanTween.value(go(arg_267_0.commanderTinkle), 0, 1, 0.5):setOnUpdate(System.Action_float(function(arg_268_0)
		local var_268_0 = arg_267_0.commanderTinkle.localPosition

		var_268_0.x = var_267_2.x + -100 * (1 - arg_268_0)
		arg_267_0.commanderTinkle.localPosition = var_268_0
		var_267_1.alpha = arg_268_0
	end)):setEase(LeanTweenType.easeOutSine)
	LeanTween.value(go(arg_267_0.commanderTinkle), 0, 1, 0.3):setDelay(0.7):setOnUpdate(System.Action_float(function(arg_269_0)
		local var_269_0 = arg_267_0.commanderTinkle.localPosition

		var_269_0.x = var_267_2.x + 100 * arg_269_0
		arg_267_0.commanderTinkle.localPosition = var_269_0
		var_267_1.alpha = 1 - arg_269_0
	end)):setOnComplete(System.Action(function()
		if arg_267_2 then
			arg_267_2()
		end

		arg_267_0:unfrozen()
	end))
end

function var_0_0.strikeEnemy(arg_271_0, arg_271_1, arg_271_2, arg_271_3)
	local var_271_0 = arg_271_0.grid:shakeCell(arg_271_1)

	if not var_271_0 then
		arg_271_3()

		return
	end

	arg_271_0:easeDamage(var_271_0, arg_271_2, function()
		arg_271_3()
	end)
end

function var_0_0.easeDamage(arg_273_0, arg_273_1, arg_273_2, arg_273_3)
	arg_273_0:frozen()

	local var_273_0 = arg_273_0.levelCam:WorldToScreenPoint(arg_273_1.position)
	local var_273_1 = tf(arg_273_0:GetDamageText())

	var_273_1.position = arg_273_0.uiCam:ScreenToWorldPoint(var_273_0)

	local var_273_2 = var_273_1.localPosition

	var_273_2.y = var_273_2.y + 40
	var_273_2.z = 0

	setText(var_273_1, arg_273_2)

	var_273_1.localPosition = var_273_2

	LeanTween.value(go(var_273_1), 0, 1, 1):setOnUpdate(System.Action_float(function(arg_274_0)
		local var_274_0 = var_273_1.localPosition

		var_274_0.y = var_273_2.y + 60 * arg_274_0
		var_273_1.localPosition = var_274_0

		setTextAlpha(var_273_1, 1 - arg_274_0)
	end)):setOnComplete(System.Action(function()
		arg_273_0:ReturnDamageText(var_273_1)
		arg_273_0:unfrozen()

		if arg_273_3 then
			arg_273_3()
		end
	end))
end

function var_0_0.easeAvoid(arg_276_0, arg_276_1, arg_276_2)
	arg_276_0:frozen()

	local var_276_0 = arg_276_0.levelCam:WorldToScreenPoint(arg_276_1)

	arg_276_0.avoidText.position = arg_276_0.uiCam:ScreenToWorldPoint(var_276_0)

	local var_276_1 = arg_276_0.avoidText.localPosition

	var_276_1.z = 0
	arg_276_0.avoidText.localPosition = var_276_1

	setActive(arg_276_0.avoidText, true)

	local var_276_2 = arg_276_0.avoidText:Find("avoid")

	LeanTween.value(go(arg_276_0.avoidText), 0, 1, 1):setOnUpdate(System.Action_float(function(arg_277_0)
		local var_277_0 = arg_276_0.avoidText.localPosition

		var_277_0.y = var_276_1.y + 100 * arg_277_0
		arg_276_0.avoidText.localPosition = var_277_0

		setImageAlpha(arg_276_0.avoidText, 1 - arg_277_0)
		setImageAlpha(var_276_2, 1 - arg_277_0)
	end)):setOnComplete(System.Action(function()
		setActive(arg_276_0.avoidText, false)
		arg_276_0:unfrozen()

		if arg_276_2 then
			arg_276_2()
		end
	end))
end

function var_0_0.GetDamageText(arg_279_0)
	local var_279_0 = table.remove(arg_279_0.damageTextPool)

	if not var_279_0 then
		var_279_0 = Instantiate(arg_279_0.damageTextTemplate)

		local var_279_1 = tf(arg_279_0.damageTextTemplate):GetSiblingIndex()

		setParent(var_279_0, tf(arg_279_0.damageTextTemplate).parent)
		tf(var_279_0):SetSiblingIndex(var_279_1 + 1)
	end

	table.insert(arg_279_0.damageTextActive, var_279_0)
	setActive(var_279_0, true)

	return var_279_0
end

function var_0_0.ReturnDamageText(arg_280_0, arg_280_1)
	assert(arg_280_1)

	if not arg_280_1 then
		return
	end

	arg_280_1 = go(arg_280_1)

	table.removebyvalue(arg_280_0.damageTextActive, arg_280_1)
	table.insert(arg_280_0.damageTextPool, arg_280_1)
	setActive(arg_280_1, false)
end

function var_0_0.resetLevelGrid(arg_281_0)
	arg_281_0.dragLayer.localPosition = Vector3.zero
end

function var_0_0.ShowCurtains(arg_282_0, arg_282_1)
	setActive(arg_282_0.curtain, arg_282_1)
end

function var_0_0.frozen(arg_283_0)
	local var_283_0 = arg_283_0.frozenCount

	arg_283_0.frozenCount = arg_283_0.frozenCount + 1
	arg_283_0.canvasGroup.blocksRaycasts = arg_283_0.frozenCount == 0

	if var_283_0 == 0 and arg_283_0.frozenCount ~= 0 then
		arg_283_0:emit(LevelUIConst.ON_FROZEN)
	end
end

function var_0_0.unfrozen(arg_284_0, arg_284_1)
	if arg_284_0.exited then
		return
	end

	local var_284_0 = arg_284_0.frozenCount
	local var_284_1 = arg_284_1 == -1 and arg_284_0.frozenCount or arg_284_1 or 1

	arg_284_0.frozenCount = arg_284_0.frozenCount - var_284_1
	arg_284_0.canvasGroup.blocksRaycasts = arg_284_0.frozenCount == 0

	if var_284_0 ~= 0 and arg_284_0.frozenCount == 0 then
		arg_284_0:emit(LevelUIConst.ON_UNFROZEN)
	end
end

function var_0_0.isfrozen(arg_285_0)
	return arg_285_0.frozenCount > 0
end

function var_0_0.enableLevelCamera(arg_286_0)
	arg_286_0.levelCamIndices = math.max(arg_286_0.levelCamIndices - 1, 0)

	if arg_286_0.levelCamIndices == 0 then
		arg_286_0.levelCam.enabled = true

		pg.LayerWeightMgr.GetInstance():switchOriginParent()
	end
end

function var_0_0.disableLevelCamera(arg_287_0)
	arg_287_0.levelCamIndices = arg_287_0.levelCamIndices + 1

	if arg_287_0.levelCamIndices > 0 then
		arg_287_0.levelCam.enabled = false

		pg.LayerWeightMgr.GetInstance():switchOriginParent()
	end
end

function var_0_0.RecordTween(arg_288_0, arg_288_1, arg_288_2)
	arg_288_0.tweens[arg_288_1] = arg_288_2
end

function var_0_0.DeleteTween(arg_289_0, arg_289_1)
	local var_289_0 = arg_289_0.tweens[arg_289_1]

	if var_289_0 then
		LeanTween.cancel(var_289_0)

		arg_289_0.tweens[arg_289_1] = nil
	end
end

function var_0_0.openCommanderPanel(arg_290_0, arg_290_1, arg_290_2, arg_290_3)
	local var_290_0 = arg_290_2.id

	arg_290_0.levelCMDFormationView:setCallback(function(arg_291_0)
		if not arg_290_3 then
			if arg_291_0.type == LevelUIConst.COMMANDER_OP_SHOW_SKILL then
				arg_290_0:emit(LevelMediator2.ON_COMMANDER_SKILL, arg_291_0.skill)
			elseif arg_291_0.type == LevelUIConst.COMMANDER_OP_ADD then
				arg_290_0.contextData.commanderSelected = {
					chapterId = var_290_0,
					fleetId = arg_290_1.id
				}

				arg_290_0:emit(LevelMediator2.ON_SELECT_COMMANDER, arg_291_0.pos, arg_290_1.id, arg_290_2)
				arg_290_0:closeCommanderPanel()
			else
				arg_290_0:emit(LevelMediator2.ON_COMMANDER_OP, {
					FleetType = LevelUIConst.FLEET_TYPE_SELECT,
					data = arg_291_0,
					fleetId = arg_290_1.id,
					chapterId = var_290_0
				}, arg_290_2)
			end
		elseif arg_291_0.type == LevelUIConst.COMMANDER_OP_SHOW_SKILL then
			arg_290_0:emit(LevelMediator2.ON_COMMANDER_SKILL, arg_291_0.skill)
		elseif arg_291_0.type == LevelUIConst.COMMANDER_OP_ADD then
			arg_290_0.contextData.eliteCommanderSelected = {
				index = arg_290_3,
				pos = arg_291_0.pos,
				chapterId = var_290_0
			}

			arg_290_0:emit(LevelMediator2.ON_SELECT_ELITE_COMMANDER, arg_290_3, arg_291_0.pos, arg_290_2)
			arg_290_0:closeCommanderPanel()
		else
			arg_290_0:emit(LevelMediator2.ON_COMMANDER_OP, {
				FleetType = LevelUIConst.FLEET_TYPE_EDIT,
				data = arg_291_0,
				index = arg_290_3,
				chapterId = var_290_0
			}, arg_290_2)
		end
	end)
	arg_290_0.levelCMDFormationView:Load()
	arg_290_0.levelCMDFormationView:ActionInvoke("update", arg_290_1, arg_290_0.commanderPrefabs)
	arg_290_0.levelCMDFormationView:ActionInvoke("Show")
end

function var_0_0.updateCommanderPrefab(arg_292_0)
	if arg_292_0.levelCMDFormationView:isShowing() then
		arg_292_0.levelCMDFormationView:ActionInvoke("updatePrefabs", arg_292_0.commanderPrefabs)
	end
end

function var_0_0.closeCommanderPanel(arg_293_0)
	arg_293_0.levelCMDFormationView:ActionInvoke("Hide")
end

function var_0_0.destroyCommanderPanel(arg_294_0)
	arg_294_0.levelCMDFormationView:Destroy()

	arg_294_0.levelCMDFormationView = nil
end

function var_0_0.setSpecialOperationTickets(arg_295_0, arg_295_1)
	arg_295_0.spTickets = arg_295_1
end

function var_0_0.HandleShowMsgBox(arg_296_0, arg_296_1)
	pg.MsgboxMgr.GetInstance():ShowMsgBox(arg_296_1)
end

function var_0_0.updatePoisonAreaTip(arg_297_0)
	local var_297_0 = arg_297_0.contextData.chapterVO
	local var_297_1 = (function(arg_298_0)
		local var_298_0 = {}
		local var_298_1 = pg.map_event_list[var_297_0.id] or {}
		local var_298_2

		if var_297_0:isLoop() then
			var_298_2 = var_298_1.event_list_loop or {}
		else
			var_298_2 = var_298_1.event_list or {}
		end

		for iter_298_0, iter_298_1 in ipairs(var_298_2) do
			local var_298_3 = pg.map_event_template[iter_298_1]

			if var_298_3.c_type == arg_298_0 then
				table.insert(var_298_0, var_298_3)
			end
		end

		return var_298_0
	end)(ChapterConst.EvtType_Poison)

	if var_297_1 then
		for iter_297_0, iter_297_1 in ipairs(var_297_1) do
			local var_297_2 = iter_297_1.round_gametip

			if var_297_2 ~= nil and var_297_2 ~= "" and var_297_0:getRoundNum() == var_297_2[1] then
				pg.TipsMgr.GetInstance():ShowTips(i18n(var_297_2[2]))
			end
		end
	end
end

function var_0_0.updateVoteBookBtn(arg_299_0)
	setActive(arg_299_0._voteBookBtn, false)
end

function var_0_0.RecordLastMapOnExit(arg_300_0)
	local var_300_0 = getProxy(ChapterProxy)

	if var_300_0 and not arg_300_0.contextData.noRecord then
		local var_300_1 = arg_300_0.contextData.map

		if not var_300_1 then
			return
		end

		if var_300_1 and var_300_1:NeedRecordMap() then
			var_300_0:recordLastMap(ChapterProxy.LAST_MAP, var_300_1.id)
		end

		if Map.lastMapForActivity then
			var_300_0:recordLastMap(ChapterProxy.LAST_MAP_FOR_ACTIVITY, Map.lastMapForActivity)
		end
	end
end

function var_0_0.IsActShopActive(arg_301_0)
	local var_301_0 = pg.gameset.activity_res_id.key_value
	local var_301_1 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_LOTTERY)

	if var_301_1 and not var_301_1:isEnd() and var_301_1:getConfig("config_client").resId == var_301_0 then
		return true
	end

	if _.detect(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_SHOP), function(arg_302_0)
		return not arg_302_0:isEnd() and arg_302_0:getConfig("config_client").pt_id == var_301_0
	end) then
		return true
	end
end

function var_0_0.willExit(arg_303_0)
	arg_303_0:ClearMapTransitions()
	arg_303_0.loader:Clear()

	if arg_303_0.contextData.chapterVO then
		pg.UIMgr.GetInstance():UnblurPanel(arg_303_0.topPanel, arg_303_0._tf)
		pg.playerResUI:SetActive({
			active = false
		})
	end

	if arg_303_0.levelFleetView and arg_303_0.levelFleetView.selectIds then
		arg_303_0.contextData.selectedFleetIDs = {}

		for iter_303_0, iter_303_1 in pairs(arg_303_0.levelFleetView.selectIds) do
			for iter_303_2, iter_303_3 in pairs(iter_303_1) do
				arg_303_0.contextData.selectedFleetIDs[#arg_303_0.contextData.selectedFleetIDs + 1] = iter_303_3
			end
		end
	end

	arg_303_0:destroyChapterPanel()
	arg_303_0:DestroyLevelInfoSPPanel()
	arg_303_0:destroyFleetEdit()
	arg_303_0:destroyCommanderPanel()
	arg_303_0:DestroyLevelStageView()
	arg_303_0:hideRepairWindow()
	arg_303_0:hideStrategyInfo()
	arg_303_0:hideRemasterPanel()
	arg_303_0:hideSpResult()
	arg_303_0:destroyGrid()
	arg_303_0:destroyAmbushWarn()
	arg_303_0:destroyAirStrike()
	arg_303_0:destroyTorpedo()
	arg_303_0:destroyStrikeAnim()
	arg_303_0:destroyTracking()
	arg_303_0:destroyUIAnims()
	PoolMgr.GetInstance():DestroyPrefab("chapter/cell_quad_mark", "")
	PoolMgr.GetInstance():DestroyPrefab("chapter/cell_quad", "")
	PoolMgr.GetInstance():DestroyPrefab("chapter/cell", "")
	PoolMgr.GetInstance():DestroyPrefab("chapter/plane", "")

	for iter_303_4, iter_303_5 in pairs(arg_303_0.mbDict) do
		iter_303_5:Destroy()
	end

	arg_303_0.mbDict = nil

	for iter_303_6, iter_303_7 in pairs(arg_303_0.tweens) do
		LeanTween.cancel(iter_303_7)
	end

	arg_303_0.tweens = nil

	if arg_303_0.cloudTimer then
		_.each(arg_303_0.cloudTimer, function(arg_304_0)
			LeanTween.cancel(arg_304_0)
		end)

		arg_303_0.cloudTimer = nil
	end

	if arg_303_0.newChapterCDTimer then
		arg_303_0.newChapterCDTimer:Stop()

		arg_303_0.newChapterCDTimer = nil
	end

	for iter_303_8, iter_303_9 in ipairs(arg_303_0.damageTextActive) do
		LeanTween.cancel(iter_303_9)
	end

	LeanTween.cancel(go(arg_303_0.avoidText))

	arg_303_0.map.localScale = Vector3.one
	arg_303_0.map.pivot = Vector2(0.5, 0.5)
	arg_303_0.float.localScale = Vector3.one
	arg_303_0.float.pivot = Vector2(0.5, 0.5)

	for iter_303_10, iter_303_11 in ipairs(arg_303_0.mapTFs) do
		clearImageSprite(iter_303_11)
	end

	_.each(arg_303_0.cloudRTFs, function(arg_305_0)
		clearImageSprite(arg_305_0)
	end)
	PoolMgr.GetInstance():DestroyAllSprite()
	Destroy(arg_303_0.enemyTpl)
	arg_303_0:RecordLastMapOnExit()
	arg_303_0.levelRemasterView:Destroy()
end

return var_0_0
