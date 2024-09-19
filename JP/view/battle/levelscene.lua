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
	[var_0_5.TYPESP] = "MapBuilderSP",
	[var_0_5.TYPESPFULL] = "MapBuilderSPFull"
}

function var_0_0.SwitchMapBuilder(arg_113_0, arg_113_1)
	if arg_113_0.mapBuilder and arg_113_0.mapBuilder:GetType() ~= arg_113_1 then
		arg_113_0.mapBuilder.buffer:Hide()
	end

	local var_113_0 = arg_113_0:GetMapBuilderInBuffer(arg_113_1)

	arg_113_0.mapBuilder = var_113_0

	var_113_0.buffer:Show()
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

	arg_115_0:SwitchMapBG(var_115_0, arg_115_1)
	arg_115_0:PlayBGM()

	local var_115_5 = arg_115_0.contextData.map:getConfig("ui_type")

	arg_115_0:SwitchMapBuilder(var_115_5)
	seriesAsync({
		function(arg_116_0)
			arg_115_0.mapBuilder:CallbackInvoke(arg_116_0)
		end,
		function(arg_117_0)
			arg_115_0.mapBuilder:UpdateMapVO(var_115_0)
			arg_115_0.mapBuilder:UpdateView()
			arg_115_0.mapBuilder:UpdateMapItems()
		end
	})
end

function var_0_0.UpdateSwitchMapButton(arg_118_0)
	local var_118_0 = arg_118_0.contextData.map
	local var_118_1 = getProxy(ChapterProxy)
	local var_118_2 = var_118_1:getMapById(var_118_0.id - 1)
	local var_118_3 = var_118_1:getMapById(var_118_0.id + 1)

	setActive(arg_118_0.btnPrev, tobool(var_118_2))
	setActive(arg_118_0.btnNext, tobool(var_118_3))

	local var_118_4 = Color.New(0.5, 0.5, 0.5, 1)

	setImageColor(arg_118_0.btnPrevCol, var_118_2 and Color.white or var_118_4)
	setImageColor(arg_118_0.btnNextCol, var_118_3 and var_118_3:isUnlock() and Color.white or var_118_4)
end

function var_0_0.tryPlayMapStory(arg_119_0)
	if IsUnityEditor and not ENABLE_GUIDE then
		return
	end

	seriesAsync({
		function(arg_120_0)
			local var_120_0 = arg_119_0.contextData.map:getConfig("enter_story")

			if var_120_0 and var_120_0 ~= "" and not pg.NewStoryMgr.GetInstance():IsPlayed(var_120_0) and not arg_119_0.contextData.map:isRemaster() and not pg.SystemOpenMgr.GetInstance().active then
				local var_120_1 = tonumber(var_120_0)

				if var_120_1 and var_120_1 > 0 then
					arg_119_0:emit(LevelMediator2.ON_PERFORM_COMBAT, var_120_1)
				else
					pg.NewStoryMgr.GetInstance():Play(var_120_0, arg_120_0)
				end

				return
			end

			arg_120_0()
		end,
		function(arg_121_0)
			local var_121_0 = arg_119_0.contextData.map:getConfig("guide_id")

			if var_121_0 and var_121_0 ~= "" then
				pg.SystemGuideMgr.GetInstance():PlayByGuideId(var_121_0, nil, arg_121_0)

				return
			end

			arg_121_0()
		end,
		function(arg_122_0)
			if isActive(arg_119_0.actAtelierBuffBtn) and getProxy(ActivityProxy):AtelierActivityAllSlotIsEmpty() and getProxy(ActivityProxy):OwnAtelierActivityItemCnt(34, 1) then
				local var_122_0 = PlayerPrefs.GetInt("first_enter_ryza_buff_" .. getProxy(PlayerProxy):getRawData().id, 0) == 0
				local var_122_1

				if var_122_0 then
					var_122_1 = {
						1,
						2
					}
				else
					var_122_1 = {
						1
					}
				end

				pg.SystemGuideMgr.GetInstance():PlayByGuideId("NG0034", var_122_1)
			else
				arg_122_0()
			end
		end,
		function(arg_123_0)
			if arg_119_0.exited then
				return
			end

			pg.SystemOpenMgr.GetInstance():notification(arg_119_0.player.level)

			if pg.SystemOpenMgr.GetInstance().active then
				getProxy(ChapterProxy):StopAutoFight()
			end
		end
	})
end

function var_0_0.DisplaySPAnim(arg_124_0, arg_124_1, arg_124_2, arg_124_3)
	arg_124_0.uiAnims = arg_124_0.uiAnims or {}

	local var_124_0 = arg_124_0.uiAnims[arg_124_1]

	local function var_124_1()
		arg_124_0.playing = true

		arg_124_0:frozen()
		var_124_0:SetActive(true)

		local var_125_0 = tf(var_124_0)

		pg.UIMgr.GetInstance():OverlayPanel(var_125_0, {
			groupName = LayerWeightConst.GROUP_LEVELUI
		})

		if arg_124_3 then
			arg_124_3(var_124_0)
		end

		var_125_0:GetComponent("DftAniEvent"):SetEndEvent(function(arg_126_0)
			arg_124_0.playing = false

			if arg_124_2 then
				arg_124_2(var_124_0)
			end

			arg_124_0:unfrozen()
		end)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
	end

	if not var_124_0 then
		PoolMgr.GetInstance():GetUI(arg_124_1, true, function(arg_127_0)
			arg_127_0:SetActive(true)

			arg_124_0.uiAnims[arg_124_1] = arg_127_0
			var_124_0 = arg_124_0.uiAnims[arg_124_1]

			var_124_1()
		end)
	else
		var_124_1()
	end
end

function var_0_0.displaySpResult(arg_128_0, arg_128_1, arg_128_2)
	setActive(arg_128_0.spResult, true)
	arg_128_0:DisplaySPAnim(arg_128_1 == 1 and "SpUnitWin" or "SpUnitLose", function(arg_129_0)
		onButton(arg_128_0, arg_129_0, function()
			removeOnButton(arg_129_0)
			setActive(arg_129_0, false)
			pg.UIMgr.GetInstance():UnOverlayPanel(arg_129_0, arg_128_0._tf)
			arg_128_0:hideSpResult()
			arg_128_2()
		end, SFX_PANEL)
	end)
end

function var_0_0.hideSpResult(arg_131_0)
	setActive(arg_131_0.spResult, false)
end

function var_0_0.displayBombResult(arg_132_0, arg_132_1)
	setActive(arg_132_0.spResult, true)
	arg_132_0:DisplaySPAnim("SpBombRet", function(arg_133_0)
		onButton(arg_132_0, arg_133_0, function()
			removeOnButton(arg_133_0)
			setActive(arg_133_0, false)
			pg.UIMgr.GetInstance():UnOverlayPanel(arg_133_0, arg_132_0._tf)
			arg_132_0:hideSpResult()
			arg_132_1()
		end, SFX_PANEL)
	end, function(arg_135_0)
		setText(arg_135_0.transform:Find("right/name_bg/en"), arg_132_0.contextData.chapterVO.modelCount)
	end)
end

function var_0_0.OnLevelInfoPanelConfirm(arg_136_0, arg_136_1, arg_136_2)
	arg_136_0.contextData.chapterLoopFlag = arg_136_2

	local var_136_0 = getProxy(ChapterProxy):getChapterById(arg_136_1, true)

	if var_136_0:getConfig("type") == Chapter.CustomFleet then
		arg_136_0:displayFleetEdit(var_136_0)

		return
	end

	if #var_136_0:getNpcShipByType(1) > 0 then
		arg_136_0:emit(LevelMediator2.ON_TRACKING, arg_136_1)

		return
	end

	arg_136_0:displayFleetSelect(var_136_0)
end

function var_0_0.DisplayLevelInfoPanel(arg_137_0, arg_137_1, arg_137_2)
	seriesAsync({
		function(arg_138_0)
			if not arg_137_0.levelInfoView:GetLoaded() then
				arg_137_0:frozen()
				arg_137_0.levelInfoView:Load()
				arg_137_0.levelInfoView:CallbackInvoke(function()
					arg_137_0:unfrozen()
					arg_138_0()
				end)

				return
			end

			arg_138_0()
		end,
		function(arg_140_0)
			local function var_140_0(arg_141_0, arg_141_1)
				arg_137_0:hideChapterPanel()
				arg_137_0:OnLevelInfoPanelConfirm(arg_141_0, arg_141_1)
			end

			local function var_140_1()
				arg_137_0:hideChapterPanel()
			end

			local var_140_2 = getProxy(ChapterProxy):getChapterById(arg_137_1, true)

			if getProxy(ChapterProxy):getMapById(var_140_2:getConfig("map")):isSkirmish() and #var_140_2:getNpcShipByType(1) > 0 then
				var_140_0(false)

				return
			end

			arg_137_0.levelInfoView:set(arg_137_1, arg_137_2)
			arg_137_0.levelInfoView:setCBFunc(var_140_0, var_140_1)
			arg_137_0.levelInfoView:Show()
		end
	})
end

function var_0_0.hideChapterPanel(arg_143_0)
	if arg_143_0.levelInfoView:isShowing() then
		arg_143_0.levelInfoView:Hide()
	end
end

function var_0_0.destroyChapterPanel(arg_144_0)
	arg_144_0.levelInfoView:Destroy()

	arg_144_0.levelInfoView = nil
end

function var_0_0.DisplayLevelInfoSPPanel(arg_145_0, arg_145_1, arg_145_2, arg_145_3)
	seriesAsync({
		function(arg_146_0)
			if not arg_145_0.levelInfoSPView then
				arg_145_0.levelInfoSPView = LevelInfoSPView.New(arg_145_0.topPanel, arg_145_0.event, arg_145_0.contextData)

				arg_145_0:frozen()
				arg_145_0.levelInfoSPView:Load()
				arg_145_0.levelInfoSPView:CallbackInvoke(function()
					arg_145_0:unfrozen()
					arg_146_0()
				end)

				return
			end

			arg_146_0()
		end,
		function(arg_148_0)
			local function var_148_0(arg_149_0, arg_149_1)
				arg_145_0:HideLevelInfoSPPanel()
				arg_145_0:OnLevelInfoPanelConfirm(arg_149_0, arg_149_1)
			end

			local function var_148_1()
				arg_145_0:HideLevelInfoSPPanel()
			end

			arg_145_0.levelInfoSPView:SetChapterGroupInfo(arg_145_2)
			arg_145_0.levelInfoSPView:set(arg_145_1, arg_145_3)
			arg_145_0.levelInfoSPView:setCBFunc(var_148_0, var_148_1)
			arg_145_0.levelInfoSPView:Show()
		end
	})
end

function var_0_0.HideLevelInfoSPPanel(arg_151_0)
	if arg_151_0.levelInfoSPView and arg_151_0.levelInfoSPView:isShowing() then
		arg_151_0.levelInfoSPView:Hide()
	end
end

function var_0_0.DestroyLevelInfoSPPanel(arg_152_0)
	if not arg_152_0.levelInfoSPView then
		return
	end

	arg_152_0.levelInfoSPView:Destroy()

	arg_152_0.levelInfoSPView = nil
end

function var_0_0.displayFleetSelect(arg_153_0, arg_153_1)
	local var_153_0 = arg_153_0.contextData.selectedFleetIDs or arg_153_1:GetDefaultFleetIndex()

	arg_153_1 = Clone(arg_153_1)
	arg_153_1.loopFlag = arg_153_0.contextData.chapterLoopFlag

	arg_153_0.levelFleetView:updateSpecialOperationTickets(arg_153_0.spTickets)
	arg_153_0.levelFleetView:Load()
	arg_153_0.levelFleetView:ActionInvoke("setHardShipVOs", arg_153_0.shipVOs)
	arg_153_0.levelFleetView:ActionInvoke("setOpenCommanderTag", arg_153_0.openedCommanerSystem)
	arg_153_0.levelFleetView:ActionInvoke("set", arg_153_1, arg_153_0.fleets, var_153_0)
	arg_153_0.levelFleetView:ActionInvoke("Show")
end

function var_0_0.hideFleetSelect(arg_154_0)
	if arg_154_0.levelCMDFormationView:isShowing() then
		arg_154_0.levelCMDFormationView:Hide()
	end

	if arg_154_0.levelFleetView then
		arg_154_0.levelFleetView:Hide()
	end
end

function var_0_0.buildCommanderPanel(arg_155_0)
	arg_155_0.levelCMDFormationView = LevelCMDFormationView.New(arg_155_0.topPanel, arg_155_0.event, arg_155_0.contextData)
end

function var_0_0.destroyFleetSelect(arg_156_0)
	if not arg_156_0.levelFleetView then
		return
	end

	arg_156_0.levelFleetView:Destroy()

	arg_156_0.levelFleetView = nil
end

function var_0_0.displayFleetEdit(arg_157_0, arg_157_1)
	arg_157_1 = Clone(arg_157_1)
	arg_157_1.loopFlag = arg_157_0.contextData.chapterLoopFlag

	arg_157_0.levelFleetView:updateSpecialOperationTickets(arg_157_0.spTickets)
	arg_157_0.levelFleetView:Load()
	arg_157_0.levelFleetView:ActionInvoke("setOpenCommanderTag", arg_157_0.openedCommanerSystem)
	arg_157_0.levelFleetView:ActionInvoke("setHardShipVOs", arg_157_0.shipVOs)
	arg_157_0.levelFleetView:ActionInvoke("setOnHard", arg_157_1)
	arg_157_0.levelFleetView:ActionInvoke("Show")
end

function var_0_0.hideFleetEdit(arg_158_0)
	arg_158_0:hideFleetSelect()
end

function var_0_0.destroyFleetEdit(arg_159_0)
	arg_159_0:destroyFleetSelect()
end

function var_0_0.RefreshFleetSelectView(arg_160_0, arg_160_1)
	if not arg_160_0.levelFleetView then
		return
	end

	assert(arg_160_0.levelFleetView:GetLoaded())

	local var_160_0 = arg_160_0.levelFleetView:IsSelectMode()
	local var_160_1

	if var_160_0 then
		arg_160_0.levelFleetView:ActionInvoke("set", arg_160_1 or arg_160_0.levelFleetView.chapter, arg_160_0.fleets, arg_160_0.levelFleetView:getSelectIds())

		if arg_160_0.levelCMDFormationView:isShowing() then
			local var_160_2 = arg_160_0.levelCMDFormationView.fleet.id

			var_160_1 = arg_160_0.fleets[var_160_2]
		end
	else
		arg_160_0.levelFleetView:ActionInvoke("setOnHard", arg_160_1 or arg_160_0.levelFleetView.chapter)

		if arg_160_0.levelCMDFormationView:isShowing() then
			local var_160_3 = arg_160_0.levelCMDFormationView.fleet.id

			var_160_1 = arg_160_1:wrapEliteFleet(var_160_3)
		end
	end

	if var_160_1 then
		arg_160_0.levelCMDFormationView:ActionInvoke("updateFleet", var_160_1)
	end
end

function var_0_0.setChapter(arg_161_0, arg_161_1)
	local var_161_0

	if arg_161_1 then
		var_161_0 = arg_161_1.id
	end

	arg_161_0.contextData.chapterId = var_161_0
	arg_161_0.contextData.chapterVO = arg_161_1
end

function var_0_0.switchToChapter(arg_162_0, arg_162_1)
	if arg_162_0.contextData.mapIdx ~= arg_162_1:getConfig("map") then
		arg_162_0:setMap(arg_162_1:getConfig("map"))
	end

	arg_162_0:setChapter(arg_162_1)

	arg_162_0.leftCanvasGroup.blocksRaycasts = false
	arg_162_0.rightCanvasGroup.blocksRaycasts = false

	assert(not arg_162_0.levelStageView, "LevelStageView Exists On SwitchToChapter")
	arg_162_0:DestroyLevelStageView()

	if not arg_162_0.levelStageView then
		arg_162_0.levelStageView = LevelStageView.New(arg_162_0.topPanel, arg_162_0.event, arg_162_0.contextData)

		arg_162_0.levelStageView:Load()

		arg_162_0.levelStageView.isFrozen = arg_162_0:isfrozen()
	end

	arg_162_0:frozen()

	local function var_162_0()
		seriesAsync({
			function(arg_164_0)
				arg_162_0.mapBuilder:CallbackInvoke(arg_164_0)
			end,
			function(arg_165_0)
				setActive(arg_162_0.clouds, false)
				arg_162_0.mapBuilder:HideFloat()
				pg.UIMgr.GetInstance():BlurPanel(arg_162_0.topPanel, false, {
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
				arg_162_0.levelStageView:updateStageInfo()
				arg_162_0.levelStageView:updateAmbushRate(arg_162_1.fleet.line, true)
				arg_162_0.levelStageView:updateStageAchieve()
				arg_162_0.levelStageView:updateStageBarrier()
				arg_162_0.levelStageView:updateBombPanel()
				arg_162_0.levelStageView:UpdateDefenseStatus()
				onNextTick(arg_165_0)
			end,
			function(arg_166_0)
				if arg_162_0.exited then
					return
				end

				arg_162_0.levelStageView:updateStageStrategy()

				arg_162_0.canvasGroup.blocksRaycasts = arg_162_0.frozenCount == 0

				onNextTick(arg_166_0)
			end,
			function(arg_167_0)
				if arg_162_0.exited then
					return
				end

				arg_162_0.levelStageView:updateStageFleet()
				arg_162_0.levelStageView:updateSupportFleet()
				arg_162_0.levelStageView:updateFleetBuff()
				onNextTick(arg_167_0)
			end,
			function(arg_168_0)
				if arg_162_0.exited then
					return
				end

				parallelAsync({
					function(arg_169_0)
						local var_169_0 = arg_162_1:getConfig("scale")
						local var_169_1 = LeanTween.value(go(arg_162_0.map), arg_162_0.map.localScale, Vector3.New(var_169_0[3], var_169_0[3], 1), var_0_1):setOnUpdateVector3(function(arg_170_0)
							arg_162_0.map.localScale = arg_170_0
							arg_162_0.float.localScale = arg_170_0
						end):setOnComplete(System.Action(function()
							arg_162_0.mapBuilder:ShowFloat()
							arg_162_0.mapBuilder:Hide()
							arg_169_0()
						end)):setEase(LeanTweenType.easeOutSine)

						arg_162_0:RecordTween("mapScale", var_169_1.uniqueId)

						local var_169_2 = LeanTween.value(go(arg_162_0.map), arg_162_0.map.pivot, Vector2.New(math.clamp(var_169_0[1] - 0.5, 0, 1), math.clamp(var_169_0[2] - 0.5, 0, 1)), var_0_1)

						var_169_2:setOnUpdateVector2(function(arg_172_0)
							arg_162_0.map.pivot = arg_172_0
							arg_162_0.float.pivot = arg_172_0
						end):setEase(LeanTweenType.easeOutSine)
						arg_162_0:RecordTween("mapPivot", var_169_2.uniqueId)
						shiftPanel(arg_162_0.leftChapter, -arg_162_0.leftChapter.rect.width - 200, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
						shiftPanel(arg_162_0.rightChapter, arg_162_0.rightChapter.rect.width + 200, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
						shiftPanel(arg_162_0.topChapter, 0, arg_162_0.topChapter.rect.height, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
						arg_162_0.levelStageView:ShiftStagePanelIn()
					end,
					function(arg_173_0)
						arg_162_0:PlayBGM()

						local var_173_0 = {}
						local var_173_1 = arg_162_1:getConfig("bg")

						if var_173_1 and #var_173_1 > 0 then
							var_173_0[1] = {
								BG = var_173_1
							}
						end

						arg_162_0:SwitchBG(var_173_0, arg_173_0)
					end
				}, function()
					onNextTick(arg_168_0)
				end)
			end,
			function(arg_175_0)
				if arg_162_0.exited then
					return
				end

				setActive(arg_162_0.topChapter, false)
				setActive(arg_162_0.leftChapter, false)
				setActive(arg_162_0.rightChapter, false)

				arg_162_0.leftCanvasGroup.blocksRaycasts = true
				arg_162_0.rightCanvasGroup.blocksRaycasts = true

				arg_162_0:initGrid(arg_175_0)
			end,
			function(arg_176_0)
				if arg_162_0.exited then
					return
				end

				arg_162_0.levelStageView:SetGrid(arg_162_0.grid)

				arg_162_0.contextData.huntingRangeVisibility = arg_162_0.contextData.huntingRangeVisibility - 1

				arg_162_0.grid:toggleHuntingRange()

				local var_176_0 = arg_162_1:getConfig("pop_pic")

				if var_176_0 and #var_176_0 > 0 and arg_162_0.FirstEnterChapter == arg_162_1.id then
					arg_162_0:doPlayAnim(var_176_0, function(arg_177_0)
						setActive(arg_177_0, false)

						if arg_162_0.exited then
							return
						end

						arg_176_0()
					end)
				else
					arg_176_0()
				end
			end,
			function(arg_178_0)
				arg_162_0.levelStageView:tryAutoAction(arg_178_0)
			end,
			function(arg_179_0)
				if arg_162_0.exited then
					return
				end

				arg_162_0:unfrozen()

				if arg_162_0.FirstEnterChapter then
					arg_162_0:emit(LevelMediator2.ON_RESUME_SUBSTATE, arg_162_1.subAutoAttack)
				end

				arg_162_0.FirstEnterChapter = nil

				arg_162_0.levelStageView:tryAutoTrigger(true)
			end
		})
	end

	arg_162_0.levelStageView:ActionInvoke("SetSeriesOperation", var_162_0)
	arg_162_0.levelStageView:ActionInvoke("SetPlayer", arg_162_0.player)
	arg_162_0.levelStageView:ActionInvoke("SwitchToChapter", arg_162_1)
end

function var_0_0.switchToMap(arg_180_0, arg_180_1)
	arg_180_0:frozen()
	arg_180_0:destroyGrid()
	arg_180_0:setChapter(nil)
	LeanTween.cancel(go(arg_180_0.map))

	local var_180_0 = LeanTween.value(go(arg_180_0.map), arg_180_0.map.localScale, Vector3.one, var_0_1):setOnUpdateVector3(function(arg_181_0)
		arg_180_0.map.localScale = arg_181_0
		arg_180_0.float.localScale = arg_181_0
	end):setOnComplete(System.Action(function()
		arg_180_0:unfrozen()
		existCall(arg_180_1)
	end)):setEase(LeanTweenType.easeOutSine)

	arg_180_0:RecordTween("mapScale", var_180_0.uniqueId)

	local var_180_1 = arg_180_0.contextData.map:getConfig("anchor")
	local var_180_2

	if var_180_1 == "" then
		var_180_2 = Vector2.zero
	else
		var_180_2 = Vector2(unpack(var_180_1))
	end

	local var_180_3 = LeanTween.value(go(arg_180_0.map), arg_180_0.map.pivot, var_180_2, var_0_1)

	var_180_3:setOnUpdateVector2(function(arg_183_0)
		arg_180_0.map.pivot = arg_183_0
		arg_180_0.float.pivot = arg_183_0
	end):setEase(LeanTweenType.easeOutSine)
	arg_180_0:RecordTween("mapPivot", var_180_3.uniqueId)
	setActive(arg_180_0.topChapter, true)
	setActive(arg_180_0.leftChapter, true)
	setActive(arg_180_0.rightChapter, true)
	shiftPanel(arg_180_0.leftChapter, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(arg_180_0.rightChapter, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(arg_180_0.topChapter, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	assert(arg_180_0.levelStageView, "LevelStageView Doesnt Exist On SwitchToMap")

	if arg_180_0.levelStageView then
		arg_180_0.levelStageView:ActionInvoke("ShiftStagePanelOut", function()
			arg_180_0:DestroyLevelStageView()
		end)
		arg_180_0.levelStageView:ActionInvoke("SwitchToMap")
	end

	arg_180_0:SwitchMapBG(arg_180_0.contextData.map)
	arg_180_0:PlayBGM()
	seriesAsync({
		function(arg_185_0)
			arg_180_0.mapBuilder:CallbackInvoke(arg_185_0)
		end,
		function(arg_186_0)
			arg_180_0.mapBuilder:Show()
			arg_180_0.mapBuilder:UpdateView()
			arg_180_0.mapBuilder:UpdateMapItems()
		end
	})
	pg.UIMgr.GetInstance():UnblurPanel(arg_180_0.topPanel, arg_180_0._tf)
	pg.playerResUI:SetActive({
		active = false
	})

	arg_180_0.canvasGroup.blocksRaycasts = arg_180_0.frozenCount == 0
	arg_180_0.canvasGroup.interactable = true

	if arg_180_0.ambushWarning and arg_180_0.ambushWarning.activeSelf then
		arg_180_0.ambushWarning:SetActive(false)
		arg_180_0:unfrozen()
	end
end

function var_0_0.SwitchBG(arg_187_0, arg_187_1, arg_187_2, arg_187_3)
	if not arg_187_1 or #arg_187_1 <= 0 then
		existCall(arg_187_2)

		return
	elseif arg_187_3 then
		-- block empty
	elseif table.equal(arg_187_0.currentBG, arg_187_1) then
		return
	end

	arg_187_0.currentBG = arg_187_1

	for iter_187_0, iter_187_1 in ipairs(arg_187_0.mapGroup) do
		arg_187_0.loader:ClearRequest(iter_187_1)
	end

	table.clear(arg_187_0.mapGroup)

	local var_187_0 = {}

	table.ParallelIpairsAsync(arg_187_1, function(arg_188_0, arg_188_1, arg_188_2)
		local var_188_0 = arg_187_0.mapTFs[arg_188_0]
		local var_188_1 = arg_188_1.bgPrefix and arg_188_1.bgPrefix .. "/" or "levelmap/"
		local var_188_2 = arg_187_0.loader:GetSpriteDirect(var_188_1 .. arg_188_1.BG, "", function(arg_189_0)
			var_187_0[arg_188_0] = arg_189_0

			arg_188_2()
		end, var_188_0)

		table.insert(arg_187_0.mapGroup, var_188_2)
		arg_187_0:updateCouldAnimator(arg_188_1.Animator, arg_188_0)
	end, function()
		for iter_190_0, iter_190_1 in ipairs(arg_187_0.mapTFs) do
			setImageSprite(iter_190_1, var_187_0[iter_190_0])
			setActive(iter_190_1, arg_187_1[iter_190_0])
			SetCompomentEnabled(iter_190_1, typeof(Image), true)
		end

		existCall(arg_187_2)
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

function var_0_0.ClearMapTransitions(arg_191_0)
	if not arg_191_0.mapTransitions then
		return
	end

	for iter_191_0, iter_191_1 in pairs(arg_191_0.mapTransitions) do
		if iter_191_1 then
			PoolMgr.GetInstance():ReturnPrefab("ui/" .. iter_191_0, iter_191_0, iter_191_1, true)
		else
			PoolMgr.GetInstance():DestroyPrefab("ui/" .. iter_191_0, iter_191_0)
		end
	end

	arg_191_0.mapTransitions = nil
end

function var_0_0.SwitchMapBG(arg_192_0, arg_192_1, arg_192_2, arg_192_3)
	local var_192_0, var_192_1, var_192_2 = arg_192_0:GetMapBG(arg_192_1, arg_192_2)

	if not var_192_1 then
		arg_192_0:SwitchBG(var_192_0, nil, arg_192_3)

		return
	end

	arg_192_0:PlayMapTransition("LevelMapTransition_" .. var_192_1, var_192_2, function()
		arg_192_0:SwitchBG(var_192_0, nil, arg_192_3)
	end)
end

function var_0_0.GetMapBG(arg_194_0, arg_194_1, arg_194_2)
	if not table.contains(var_0_7, arg_194_1.id) then
		return {
			arg_194_0:GetMapElement(arg_194_1)
		}
	end

	local var_194_0 = arg_194_1.id
	local var_194_1 = table.indexof(var_0_7, var_194_0) - 1
	local var_194_2 = bit.lshift(bit.rshift(var_194_1, 1), 1) + 1
	local var_194_3 = {
		var_0_7[var_194_2],
		var_0_7[var_194_2 + 1]
	}
	local var_194_4 = _.map(var_194_3, function(arg_195_0)
		return getProxy(ChapterProxy):getMapById(arg_195_0)
	end)

	if _.all(var_194_4, function(arg_196_0)
		return arg_196_0:isAllChaptersClear()
	end) then
		local var_194_5 = {
			arg_194_0:GetMapElement(arg_194_1)
		}

		if not arg_194_2 or math.abs(var_194_0 - arg_194_2) ~= 1 then
			return var_194_5
		end

		local var_194_6 = var_0_9[bit.rshift(var_194_2 - 1, 1) + 1]
		local var_194_7 = bit.band(var_194_1, 1) == 1

		return var_194_5, var_194_6, var_194_7
	else
		local var_194_8 = 0

		;(function()
			local var_197_0 = var_194_4[1]:getChapters()

			for iter_197_0, iter_197_1 in ipairs(var_197_0) do
				if not iter_197_1:isClear() then
					return
				end

				var_194_8 = var_194_8 + 1
			end

			if not var_194_4[2]:isAnyChapterUnlocked(true) then
				return
			end

			var_194_8 = var_194_8 + 1

			local var_197_1 = var_194_4[2]:getChapters()

			for iter_197_2, iter_197_3 in ipairs(var_197_1) do
				if not iter_197_3:isClear() then
					return
				end

				var_194_8 = var_194_8 + 1
			end
		end)()

		local var_194_9

		if var_194_8 > 0 then
			local var_194_10 = var_0_8[bit.rshift(var_194_2 - 1, 1) + 1]

			var_194_9 = {
				{
					BG = "map_" .. var_194_10[1],
					Animator = var_194_10[2]
				},
				{
					BG = "map_" .. var_194_10[3] + var_194_8,
					Animator = var_194_10[4]
				}
			}
		else
			var_194_9 = {
				arg_194_0:GetMapElement(arg_194_1)
			}
		end

		return var_194_9
	end
end

function var_0_0.GetMapElement(arg_198_0, arg_198_1)
	local var_198_0 = arg_198_1:getConfig("bg")
	local var_198_1 = arg_198_1:getConfig("ani_controller")

	if var_198_1 and #var_198_1 > 0 then
		(function()
			for iter_199_0, iter_199_1 in ipairs(var_198_1) do
				local var_199_0 = _.rest(iter_199_1[2], 2)

				for iter_199_2, iter_199_3 in ipairs(var_199_0) do
					if string.find(iter_199_3, "^map_") and iter_199_1[1] == var_0_3 then
						local var_199_1 = iter_199_1[2][1]
						local var_199_2 = getProxy(ChapterProxy):GetChapterItemById(var_199_1)

						if var_199_2 and not var_199_2:isClear() then
							var_198_0 = iter_199_3

							return
						end
					end
				end
			end
		end)()
	end

	local var_198_2 = {
		BG = var_198_0
	}

	var_198_2.Animator, var_198_2.AnimatorController = arg_198_0:GetMapAnimator(arg_198_1)

	return var_198_2
end

function var_0_0.GetMapAnimator(arg_200_0, arg_200_1)
	local var_200_0 = arg_200_1:getConfig("ani_name")

	if arg_200_1:getConfig("animtor") == 1 and var_200_0 and #var_200_0 > 0 then
		local var_200_1 = arg_200_1:getConfig("ani_controller")

		if var_200_1 and #var_200_1 > 0 then
			(function()
				for iter_201_0, iter_201_1 in ipairs(var_200_1) do
					local var_201_0 = _.rest(iter_201_1[2], 2)

					for iter_201_2, iter_201_3 in ipairs(var_201_0) do
						if string.find(iter_201_3, "^effect_") and iter_201_1[1] == var_0_3 then
							local var_201_1 = iter_201_1[2][1]
							local var_201_2 = getProxy(ChapterProxy):GetChapterItemById(var_201_1)

							if var_201_2 and not var_201_2:isClear() then
								var_200_0 = "map_" .. string.sub(iter_201_3, 8)

								return
							end
						end
					end
				end
			end)()
		end

		return var_200_0, var_200_1
	end
end

function var_0_0.PlayMapTransition(arg_202_0, arg_202_1, arg_202_2, arg_202_3, arg_202_4)
	arg_202_0.mapTransitions = arg_202_0.mapTransitions or {}

	local var_202_0

	local function var_202_1()
		arg_202_0:frozen()
		existCall(arg_202_3, var_202_0)
		var_202_0:SetActive(true)

		local var_203_0 = tf(var_202_0)

		pg.UIMgr.GetInstance():OverlayPanel(var_203_0, {
			groupName = LayerWeightConst.GROUP_LEVELUI
		})
		var_202_0:GetComponent(typeof(Animator)):Play(arg_202_2 and "Sequence" or "Inverted", -1, 0)
		var_203_0:GetComponent("DftAniEvent"):SetEndEvent(function(arg_204_0)
			pg.UIMgr.GetInstance():UnOverlayPanel(var_203_0, arg_202_0._tf)
			existCall(arg_202_4, var_202_0)
			PoolMgr.GetInstance():ReturnPrefab("ui/" .. arg_202_1, arg_202_1, var_202_0)

			arg_202_0.mapTransitions[arg_202_1] = false

			arg_202_0:unfrozen()
		end)
	end

	PoolMgr.GetInstance():GetPrefab("ui/" .. arg_202_1, arg_202_1, true, function(arg_205_0)
		var_202_0 = arg_205_0
		arg_202_0.mapTransitions[arg_202_1] = arg_205_0

		var_202_1()
	end)
end

function var_0_0.DestroyLevelStageView(arg_206_0)
	if arg_206_0.levelStageView then
		arg_206_0.levelStageView:Destroy()

		arg_206_0.levelStageView = nil
	end
end

function var_0_0.displayAmbushInfo(arg_207_0, arg_207_1)
	arg_207_0.levelAmbushView = LevelAmbushView.New(arg_207_0.topPanel, arg_207_0.event, arg_207_0.contextData)

	arg_207_0.levelAmbushView:Load()
	arg_207_0.levelAmbushView:ActionInvoke("SetFuncOnComplete", arg_207_1)
end

function var_0_0.hideAmbushInfo(arg_208_0)
	if arg_208_0.levelAmbushView then
		arg_208_0.levelAmbushView:Destroy()

		arg_208_0.levelAmbushView = nil
	end
end

function var_0_0.doAmbushWarning(arg_209_0, arg_209_1)
	arg_209_0:frozen()

	local function var_209_0()
		arg_209_0.ambushWarning:SetActive(true)

		local var_210_0 = tf(arg_209_0.ambushWarning)

		var_210_0:SetParent(pg.UIMgr.GetInstance().OverlayMain.transform, false)
		var_210_0:SetSiblingIndex(1)

		local var_210_1 = var_210_0:GetComponent("DftAniEvent")

		var_210_1:SetTriggerEvent(function(arg_211_0)
			arg_209_1()
		end)
		var_210_1:SetEndEvent(function(arg_212_0)
			arg_209_0.ambushWarning:SetActive(false)
			arg_209_0:unfrozen()
		end)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
		Timer.New(function()
			pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
		end, 1, 1):Start()
	end

	if not arg_209_0.ambushWarning then
		PoolMgr.GetInstance():GetUI("ambushwarnui", true, function(arg_214_0)
			arg_214_0:SetActive(true)

			arg_209_0.ambushWarning = arg_214_0

			var_209_0()
		end)
	else
		var_209_0()
	end
end

function var_0_0.destroyAmbushWarn(arg_215_0)
	if arg_215_0.ambushWarning then
		PoolMgr.GetInstance():ReturnUI("ambushwarnui", arg_215_0.ambushWarning)

		arg_215_0.ambushWarning = nil
	end
end

function var_0_0.displayStrategyInfo(arg_216_0, arg_216_1)
	arg_216_0.levelStrategyView = LevelStrategyView.New(arg_216_0.topPanel, arg_216_0.event, arg_216_0.contextData)

	arg_216_0.levelStrategyView:Load()
	arg_216_0.levelStrategyView:ActionInvoke("set", arg_216_1)

	local function var_216_0()
		local var_217_0 = arg_216_0.contextData.chapterVO.fleet
		local var_217_1 = pg.strategy_data_template[arg_216_1.id]

		if not var_217_0:canUseStrategy(arg_216_1) then
			return
		end

		local var_217_2 = var_217_0:getNextStgUser(arg_216_1.id)

		if var_217_1.type == ChapterConst.StgTypeForm then
			arg_216_0:emit(LevelMediator2.ON_OP, {
				type = ChapterConst.OpStrategy,
				id = var_217_2,
				arg1 = arg_216_1.id
			})
		elseif var_217_1.type == ChapterConst.StgTypeConsume then
			arg_216_0:emit(LevelMediator2.ON_OP, {
				type = ChapterConst.OpStrategy,
				id = var_217_2,
				arg1 = arg_216_1.id
			})
		end

		arg_216_0:hideStrategyInfo()
	end

	local function var_216_1()
		arg_216_0:hideStrategyInfo()
	end

	arg_216_0.levelStrategyView:ActionInvoke("setCBFunc", var_216_0, var_216_1)
end

function var_0_0.hideStrategyInfo(arg_219_0)
	if arg_219_0.levelStrategyView then
		arg_219_0.levelStrategyView:Destroy()

		arg_219_0.levelStrategyView = nil
	end
end

function var_0_0.displayRepairWindow(arg_220_0, arg_220_1)
	local var_220_0 = arg_220_0.contextData.chapterVO
	local var_220_1 = getProxy(ChapterProxy)
	local var_220_2
	local var_220_3
	local var_220_4
	local var_220_5
	local var_220_6 = var_220_1.repairTimes
	local var_220_7, var_220_8, var_220_9 = ChapterConst.GetRepairParams()

	arg_220_0.levelRepairView = LevelRepairView.New(arg_220_0.topPanel, arg_220_0.event, arg_220_0.contextData)

	arg_220_0.levelRepairView:Load()
	arg_220_0.levelRepairView:ActionInvoke("set", var_220_6, var_220_7, var_220_8, var_220_9)

	local function var_220_10()
		if var_220_7 - math.min(var_220_6, var_220_7) == 0 and arg_220_0.player:getTotalGem() < var_220_9 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_rmb"))

			return
		end

		arg_220_0:emit(LevelMediator2.ON_OP, {
			type = ChapterConst.OpRepair,
			id = var_220_0.fleet.id,
			arg1 = arg_220_1.id
		})
		arg_220_0:hideRepairWindow()
	end

	local function var_220_11()
		arg_220_0:hideRepairWindow()
	end

	arg_220_0.levelRepairView:ActionInvoke("setCBFunc", var_220_10, var_220_11)
end

function var_0_0.hideRepairWindow(arg_223_0)
	if arg_223_0.levelRepairView then
		arg_223_0.levelRepairView:Destroy()

		arg_223_0.levelRepairView = nil
	end
end

function var_0_0.displayRemasterPanel(arg_224_0, arg_224_1)
	arg_224_0.levelRemasterView:Load()

	local function var_224_0(arg_225_0)
		arg_224_0:ShowSelectedMap(arg_225_0)
	end

	arg_224_0.levelRemasterView:ActionInvoke("Show")
	arg_224_0.levelRemasterView:ActionInvoke("set", var_224_0, arg_224_1)
end

function var_0_0.hideRemasterPanel(arg_226_0)
	if arg_226_0.levelRemasterView:isShowing() then
		arg_226_0.levelRemasterView:ActionInvoke("Hide")
	end
end

function var_0_0.initGrid(arg_227_0, arg_227_1)
	local var_227_0 = arg_227_0.contextData.chapterVO

	if not var_227_0 then
		return
	end

	arg_227_0:enableLevelCamera()
	setActive(arg_227_0.uiMain, true)

	arg_227_0.levelGrid.localEulerAngles = Vector3(var_227_0.theme.angle, 0, 0)
	arg_227_0.grid = LevelGrid.New(arg_227_0.dragLayer)

	arg_227_0.grid:attach(arg_227_0)
	arg_227_0.grid:ExtendItem("shipTpl", arg_227_0.shipTpl)
	arg_227_0.grid:ExtendItem("subTpl", arg_227_0.subTpl)
	arg_227_0.grid:ExtendItem("transportTpl", arg_227_0.transportTpl)
	arg_227_0.grid:ExtendItem("enemyTpl", arg_227_0.enemyTpl)
	arg_227_0.grid:ExtendItem("championTpl", arg_227_0.championTpl)
	arg_227_0.grid:ExtendItem("oniTpl", arg_227_0.oniTpl)
	arg_227_0.grid:ExtendItem("arrowTpl", arg_227_0.arrowTarget)
	arg_227_0.grid:ExtendItem("destinationMarkTpl", arg_227_0.destinationMarkTpl)

	function arg_227_0.grid.onShipStepChange(arg_228_0)
		arg_227_0.levelStageView:updateAmbushRate(arg_228_0)
	end

	arg_227_0.grid:initAll(arg_227_1)
end

function var_0_0.destroyGrid(arg_229_0)
	if arg_229_0.grid then
		arg_229_0.grid:detach()

		arg_229_0.grid = nil

		arg_229_0:disableLevelCamera()
		setActive(arg_229_0.dragLayer, true)
		setActive(arg_229_0.uiMain, false)
	end
end

function var_0_0.doTracking(arg_230_0, arg_230_1)
	arg_230_0:frozen()

	local function var_230_0()
		arg_230_0.radar:SetActive(true)

		local var_231_0 = tf(arg_230_0.radar)

		var_231_0:SetParent(arg_230_0.topPanel, false)
		var_231_0:SetSiblingIndex(1)
		var_231_0:GetComponent("DftAniEvent"):SetEndEvent(function(arg_232_0)
			arg_230_0.radar:SetActive(false)
			arg_230_0:unfrozen()
			arg_230_1()
		end)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WEIGHANCHOR_SEARCH)
	end

	if not arg_230_0.radar then
		PoolMgr.GetInstance():GetUI("RadarEffectUI", true, function(arg_233_0)
			arg_233_0:SetActive(true)

			arg_230_0.radar = arg_233_0

			var_230_0()
		end)
	else
		var_230_0()
	end
end

function var_0_0.destroyTracking(arg_234_0)
	if arg_234_0.radar then
		PoolMgr.GetInstance():ReturnUI("RadarEffectUI", arg_234_0.radar)

		arg_234_0.radar = nil
	end
end

function var_0_0.doPlayAirStrike(arg_235_0, arg_235_1, arg_235_2, arg_235_3)
	local function var_235_0()
		arg_235_0.playing = true

		arg_235_0:frozen()
		arg_235_0.airStrike:SetActive(true)

		local var_236_0 = tf(arg_235_0.airStrike)

		var_236_0:SetParent(pg.UIMgr.GetInstance().OverlayMain.transform, false)
		var_236_0:SetAsLastSibling()
		setActive(var_236_0:Find("words/be_striked"), arg_235_1 == ChapterConst.SubjectChampion)
		setActive(var_236_0:Find("words/strike_enemy"), arg_235_1 == ChapterConst.SubjectPlayer)

		local function var_236_1()
			arg_235_0.playing = false

			SetActive(arg_235_0.airStrike, false)

			if arg_235_3 then
				arg_235_3()
			end

			arg_235_0:unfrozen()
		end

		var_236_0:GetComponent("DftAniEvent"):SetEndEvent(var_236_1)

		if arg_235_2 then
			onButton(arg_235_0, var_236_0, var_236_1, SFX_PANEL)
		else
			removeOnButton(var_236_0)
		end

		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
	end

	if not arg_235_0.airStrike then
		PoolMgr.GetInstance():GetUI("AirStrike", true, function(arg_238_0)
			arg_238_0:SetActive(true)

			arg_235_0.airStrike = arg_238_0

			var_235_0()
		end)
	else
		var_235_0()
	end
end

function var_0_0.destroyAirStrike(arg_239_0)
	if arg_239_0.airStrike then
		arg_239_0.airStrike:GetComponent("DftAniEvent"):SetEndEvent(nil)
		PoolMgr.GetInstance():ReturnUI("AirStrike", arg_239_0.airStrike)

		arg_239_0.airStrike = nil
	end
end

function var_0_0.doPlayAnim(arg_240_0, arg_240_1, arg_240_2, arg_240_3)
	arg_240_0.uiAnims = arg_240_0.uiAnims or {}

	local var_240_0 = arg_240_0.uiAnims[arg_240_1]

	local function var_240_1()
		arg_240_0.playing = true

		arg_240_0:frozen()
		var_240_0:SetActive(true)

		local var_241_0 = tf(var_240_0)

		pg.UIMgr.GetInstance():OverlayPanel(var_241_0, {
			groupName = LayerWeightConst.GROUP_LEVELUI
		})

		if arg_240_3 then
			arg_240_3(var_240_0)
		end

		var_241_0:GetComponent("DftAniEvent"):SetEndEvent(function(arg_242_0)
			arg_240_0.playing = false

			pg.UIMgr.GetInstance():UnOverlayPanel(var_241_0, arg_240_0._tf)

			if arg_240_2 then
				arg_240_2(var_240_0)
			end

			arg_240_0:unfrozen()
		end)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
	end

	if not var_240_0 then
		PoolMgr.GetInstance():GetUI(arg_240_1, true, function(arg_243_0)
			arg_243_0:SetActive(true)

			arg_240_0.uiAnims[arg_240_1] = arg_243_0
			var_240_0 = arg_240_0.uiAnims[arg_240_1]

			var_240_1()
		end)
	else
		var_240_1()
	end
end

function var_0_0.destroyUIAnims(arg_244_0)
	if arg_244_0.uiAnims then
		for iter_244_0, iter_244_1 in pairs(arg_244_0.uiAnims) do
			pg.UIMgr.GetInstance():UnOverlayPanel(tf(iter_244_1), arg_244_0._tf)
			iter_244_1:GetComponent("DftAniEvent"):SetEndEvent(nil)
			PoolMgr.GetInstance():ReturnUI(iter_244_0, iter_244_1)
		end

		arg_244_0.uiAnims = nil
	end
end

function var_0_0.doPlayTorpedo(arg_245_0, arg_245_1)
	local function var_245_0()
		arg_245_0.playing = true

		arg_245_0:frozen()
		arg_245_0.torpetoAni:SetActive(true)

		local var_246_0 = tf(arg_245_0.torpetoAni)

		var_246_0:SetParent(arg_245_0.topPanel, false)
		var_246_0:SetAsLastSibling()
		var_246_0:GetComponent("DftAniEvent"):SetEndEvent(function(arg_247_0)
			arg_245_0.playing = false

			SetActive(arg_245_0.torpetoAni, false)

			if arg_245_1 then
				arg_245_1()
			end

			arg_245_0:unfrozen()
		end)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
	end

	if not arg_245_0.torpetoAni then
		PoolMgr.GetInstance():GetUI("Torpeto", true, function(arg_248_0)
			arg_248_0:SetActive(true)

			arg_245_0.torpetoAni = arg_248_0

			var_245_0()
		end)
	else
		var_245_0()
	end
end

function var_0_0.destroyTorpedo(arg_249_0)
	if arg_249_0.torpetoAni then
		arg_249_0.torpetoAni:GetComponent("DftAniEvent"):SetEndEvent(nil)
		PoolMgr.GetInstance():ReturnUI("Torpeto", arg_249_0.torpetoAni)

		arg_249_0.torpetoAni = nil
	end
end

function var_0_0.doPlayStrikeAnim(arg_250_0, arg_250_1, arg_250_2, arg_250_3)
	arg_250_0.strikeAnims = arg_250_0.strikeAnims or {}

	local var_250_0
	local var_250_1
	local var_250_2

	local function var_250_3()
		if coroutine.status(var_250_2) == "suspended" then
			local var_251_0, var_251_1 = coroutine.resume(var_250_2)

			assert(var_251_0, debug.traceback(var_250_2, var_251_1))
		end
	end

	var_250_2 = coroutine.create(function()
		arg_250_0.playing = true

		arg_250_0:frozen()

		local var_252_0 = arg_250_0.strikeAnims[arg_250_2]

		setActive(var_252_0, true)

		local var_252_1 = tf(var_252_0)
		local var_252_2 = findTF(var_252_1, "torpedo")
		local var_252_3 = findTF(var_252_1, "mask/painting")
		local var_252_4 = findTF(var_252_1, "ship")

		setParent(var_250_0, var_252_3:Find("fitter"), false)
		setParent(var_250_1, var_252_4, false)
		setActive(var_252_4, false)
		setActive(var_252_2, false)
		var_252_1:SetParent(pg.UIMgr.GetInstance().OverlayMain.transform, false)
		var_252_1:SetAsLastSibling()

		local var_252_5 = var_252_1:GetComponent("DftAniEvent")
		local var_252_6 = var_250_1:GetComponent("SpineAnimUI")
		local var_252_7 = var_252_6:GetComponent("SkeletonGraphic")

		var_252_5:SetStartEvent(function(arg_253_0)
			var_252_6:SetAction("attack", 0)

			var_252_7.freeze = true
		end)
		var_252_5:SetTriggerEvent(function(arg_254_0)
			var_252_7.freeze = false

			var_252_6:SetActionCallBack(function(arg_255_0)
				if arg_255_0 == "action" then
					-- block empty
				elseif arg_255_0 == "finish" then
					var_252_7.freeze = true
				end
			end)
		end)
		var_252_5:SetEndEvent(function(arg_256_0)
			var_252_7.freeze = false

			var_250_3()
		end)
		onButton(arg_250_0, var_252_1, var_250_3, SFX_CANCEL)
		coroutine.yield()
		retPaintingPrefab(var_252_3, arg_250_1:getPainting())
		var_252_6:SetActionCallBack(nil)

		var_252_7.freeze = false

		PoolMgr.GetInstance():ReturnSpineChar(arg_250_1:getPrefab(), var_250_1)
		setActive(var_252_0, false)

		arg_250_0.playing = false

		arg_250_0:unfrozen()

		if arg_250_3 then
			arg_250_3()
		end
	end)

	local function var_250_4()
		if arg_250_0.strikeAnims[arg_250_2] and var_250_0 and var_250_1 then
			var_250_3()
		end
	end

	PoolMgr.GetInstance():GetPainting(arg_250_1:getPainting(), true, function(arg_258_0)
		var_250_0 = arg_258_0

		ShipExpressionHelper.SetExpression(var_250_0, arg_250_1:getPainting())
		var_250_4()
	end)
	PoolMgr.GetInstance():GetSpineChar(arg_250_1:getPrefab(), true, function(arg_259_0)
		var_250_1 = arg_259_0
		var_250_1.transform.localScale = Vector3.one

		var_250_4()
	end)

	if not arg_250_0.strikeAnims[arg_250_2] then
		PoolMgr.GetInstance():GetUI(arg_250_2, true, function(arg_260_0)
			arg_250_0.strikeAnims[arg_250_2] = arg_260_0

			var_250_4()
		end)
	end
end

function var_0_0.destroyStrikeAnim(arg_261_0)
	if arg_261_0.strikeAnims then
		for iter_261_0, iter_261_1 in pairs(arg_261_0.strikeAnims) do
			iter_261_1:GetComponent("DftAniEvent"):SetEndEvent(nil)
			PoolMgr.GetInstance():ReturnUI(iter_261_0, iter_261_1)
		end

		arg_261_0.strikeAnims = nil
	end
end

function var_0_0.doPlayEnemyAnim(arg_262_0, arg_262_1, arg_262_2, arg_262_3)
	arg_262_0.strikeAnims = arg_262_0.strikeAnims or {}

	local var_262_0
	local var_262_1

	local function var_262_2()
		if coroutine.status(var_262_1) == "suspended" then
			local var_263_0, var_263_1 = coroutine.resume(var_262_1)

			assert(var_263_0, debug.traceback(var_262_1, var_263_1))
		end
	end

	var_262_1 = coroutine.create(function()
		arg_262_0.playing = true

		arg_262_0:frozen()

		local var_264_0 = arg_262_0.strikeAnims[arg_262_2]

		setActive(var_264_0, true)

		local var_264_1 = tf(var_264_0)
		local var_264_2 = findTF(var_264_1, "torpedo")
		local var_264_3 = findTF(var_264_1, "ship")

		setParent(var_262_0, var_264_3, false)
		setActive(var_264_3, false)
		setActive(var_264_2, false)
		var_264_1:SetParent(pg.UIMgr.GetInstance().OverlayMain.transform, false)
		var_264_1:SetAsLastSibling()

		local var_264_4 = var_264_1:GetComponent("DftAniEvent")
		local var_264_5 = var_262_0:GetComponent("SpineAnimUI")
		local var_264_6 = var_264_5:GetComponent("SkeletonGraphic")

		var_264_4:SetStartEvent(function(arg_265_0)
			var_264_5:SetAction("attack", 0)

			var_264_6.freeze = true
		end)
		var_264_4:SetTriggerEvent(function(arg_266_0)
			var_264_6.freeze = false

			var_264_5:SetActionCallBack(function(arg_267_0)
				if arg_267_0 == "action" then
					-- block empty
				elseif arg_267_0 == "finish" then
					var_264_6.freeze = true
				end
			end)
		end)
		var_264_4:SetEndEvent(function(arg_268_0)
			var_264_6.freeze = false

			var_262_2()
		end)
		onButton(arg_262_0, var_264_1, var_262_2, SFX_CANCEL)
		coroutine.yield()
		var_264_5:SetActionCallBack(nil)

		var_264_6.freeze = false

		PoolMgr.GetInstance():ReturnSpineChar(arg_262_1:getPrefab(), var_262_0)
		setActive(var_264_0, false)

		arg_262_0.playing = false

		arg_262_0:unfrozen()

		if arg_262_3 then
			arg_262_3()
		end
	end)

	local function var_262_3()
		if arg_262_0.strikeAnims[arg_262_2] and var_262_0 then
			var_262_2()
		end
	end

	PoolMgr.GetInstance():GetSpineChar(arg_262_1:getPrefab(), true, function(arg_270_0)
		var_262_0 = arg_270_0
		var_262_0.transform.localScale = Vector3.one

		var_262_3()
	end)

	if not arg_262_0.strikeAnims[arg_262_2] then
		PoolMgr.GetInstance():GetUI(arg_262_2, true, function(arg_271_0)
			arg_262_0.strikeAnims[arg_262_2] = arg_271_0

			var_262_3()
		end)
	end
end

function var_0_0.doPlayCommander(arg_272_0, arg_272_1, arg_272_2)
	arg_272_0:frozen()
	setActive(arg_272_0.commanderTinkle, true)

	local var_272_0 = arg_272_1:getSkills()

	setText(arg_272_0.commanderTinkle:Find("name"), #var_272_0 > 0 and var_272_0[1]:getConfig("name") or "")
	setImageSprite(arg_272_0.commanderTinkle:Find("icon"), GetSpriteFromAtlas("commanderhrz/" .. arg_272_1:getConfig("painting"), ""))

	local var_272_1 = arg_272_0.commanderTinkle:GetComponent(typeof(CanvasGroup))

	var_272_1.alpha = 0

	local var_272_2 = Vector2(248, 237)

	LeanTween.value(go(arg_272_0.commanderTinkle), 0, 1, 0.5):setOnUpdate(System.Action_float(function(arg_273_0)
		local var_273_0 = arg_272_0.commanderTinkle.localPosition

		var_273_0.x = var_272_2.x + -100 * (1 - arg_273_0)
		arg_272_0.commanderTinkle.localPosition = var_273_0
		var_272_1.alpha = arg_273_0
	end)):setEase(LeanTweenType.easeOutSine)
	LeanTween.value(go(arg_272_0.commanderTinkle), 0, 1, 0.3):setDelay(0.7):setOnUpdate(System.Action_float(function(arg_274_0)
		local var_274_0 = arg_272_0.commanderTinkle.localPosition

		var_274_0.x = var_272_2.x + 100 * arg_274_0
		arg_272_0.commanderTinkle.localPosition = var_274_0
		var_272_1.alpha = 1 - arg_274_0
	end)):setOnComplete(System.Action(function()
		if arg_272_2 then
			arg_272_2()
		end

		arg_272_0:unfrozen()
	end))
end

function var_0_0.strikeEnemy(arg_276_0, arg_276_1, arg_276_2, arg_276_3)
	local var_276_0 = arg_276_0.grid:shakeCell(arg_276_1)

	if not var_276_0 then
		arg_276_3()

		return
	end

	arg_276_0:easeDamage(var_276_0, arg_276_2, function()
		arg_276_3()
	end)
end

function var_0_0.easeDamage(arg_278_0, arg_278_1, arg_278_2, arg_278_3)
	arg_278_0:frozen()

	local var_278_0 = arg_278_0.levelCam:WorldToScreenPoint(arg_278_1.position)
	local var_278_1 = tf(arg_278_0:GetDamageText())

	var_278_1.position = arg_278_0.uiCam:ScreenToWorldPoint(var_278_0)

	local var_278_2 = var_278_1.localPosition

	var_278_2.y = var_278_2.y + 40
	var_278_2.z = 0

	setText(var_278_1, arg_278_2)

	var_278_1.localPosition = var_278_2

	LeanTween.value(go(var_278_1), 0, 1, 1):setOnUpdate(System.Action_float(function(arg_279_0)
		local var_279_0 = var_278_1.localPosition

		var_279_0.y = var_278_2.y + 60 * arg_279_0
		var_278_1.localPosition = var_279_0

		setTextAlpha(var_278_1, 1 - arg_279_0)
	end)):setOnComplete(System.Action(function()
		arg_278_0:ReturnDamageText(var_278_1)
		arg_278_0:unfrozen()

		if arg_278_3 then
			arg_278_3()
		end
	end))
end

function var_0_0.easeAvoid(arg_281_0, arg_281_1, arg_281_2)
	arg_281_0:frozen()

	local var_281_0 = arg_281_0.levelCam:WorldToScreenPoint(arg_281_1)

	arg_281_0.avoidText.position = arg_281_0.uiCam:ScreenToWorldPoint(var_281_0)

	local var_281_1 = arg_281_0.avoidText.localPosition

	var_281_1.z = 0
	arg_281_0.avoidText.localPosition = var_281_1

	setActive(arg_281_0.avoidText, true)

	local var_281_2 = arg_281_0.avoidText:Find("avoid")

	LeanTween.value(go(arg_281_0.avoidText), 0, 1, 1):setOnUpdate(System.Action_float(function(arg_282_0)
		local var_282_0 = arg_281_0.avoidText.localPosition

		var_282_0.y = var_281_1.y + 100 * arg_282_0
		arg_281_0.avoidText.localPosition = var_282_0

		setImageAlpha(arg_281_0.avoidText, 1 - arg_282_0)
		setImageAlpha(var_281_2, 1 - arg_282_0)
	end)):setOnComplete(System.Action(function()
		setActive(arg_281_0.avoidText, false)
		arg_281_0:unfrozen()

		if arg_281_2 then
			arg_281_2()
		end
	end))
end

function var_0_0.GetDamageText(arg_284_0)
	local var_284_0 = table.remove(arg_284_0.damageTextPool)

	if not var_284_0 then
		var_284_0 = Instantiate(arg_284_0.damageTextTemplate)

		local var_284_1 = tf(arg_284_0.damageTextTemplate):GetSiblingIndex()

		setParent(var_284_0, tf(arg_284_0.damageTextTemplate).parent)
		tf(var_284_0):SetSiblingIndex(var_284_1 + 1)
	end

	table.insert(arg_284_0.damageTextActive, var_284_0)
	setActive(var_284_0, true)

	return var_284_0
end

function var_0_0.ReturnDamageText(arg_285_0, arg_285_1)
	assert(arg_285_1)

	if not arg_285_1 then
		return
	end

	arg_285_1 = go(arg_285_1)

	table.removebyvalue(arg_285_0.damageTextActive, arg_285_1)
	table.insert(arg_285_0.damageTextPool, arg_285_1)
	setActive(arg_285_1, false)
end

function var_0_0.resetLevelGrid(arg_286_0)
	arg_286_0.dragLayer.localPosition = Vector3.zero
end

function var_0_0.ShowCurtains(arg_287_0, arg_287_1)
	setActive(arg_287_0.curtain, arg_287_1)
end

function var_0_0.frozen(arg_288_0)
	local var_288_0 = arg_288_0.frozenCount

	arg_288_0.frozenCount = arg_288_0.frozenCount + 1
	arg_288_0.canvasGroup.blocksRaycasts = arg_288_0.frozenCount == 0

	if var_288_0 == 0 and arg_288_0.frozenCount ~= 0 then
		arg_288_0:emit(LevelUIConst.ON_FROZEN)
	end
end

function var_0_0.unfrozen(arg_289_0, arg_289_1)
	if arg_289_0.exited then
		return
	end

	local var_289_0 = arg_289_0.frozenCount
	local var_289_1 = arg_289_1 == -1 and arg_289_0.frozenCount or arg_289_1 or 1

	arg_289_0.frozenCount = arg_289_0.frozenCount - var_289_1
	arg_289_0.canvasGroup.blocksRaycasts = arg_289_0.frozenCount == 0

	if var_289_0 ~= 0 and arg_289_0.frozenCount == 0 then
		arg_289_0:emit(LevelUIConst.ON_UNFROZEN)
	end
end

function var_0_0.isfrozen(arg_290_0)
	return arg_290_0.frozenCount > 0
end

function var_0_0.enableLevelCamera(arg_291_0)
	arg_291_0.levelCamIndices = math.max(arg_291_0.levelCamIndices - 1, 0)

	if arg_291_0.levelCamIndices == 0 then
		arg_291_0.levelCam.enabled = true

		pg.LayerWeightMgr.GetInstance():switchOriginParent()
	end
end

function var_0_0.disableLevelCamera(arg_292_0)
	arg_292_0.levelCamIndices = arg_292_0.levelCamIndices + 1

	if arg_292_0.levelCamIndices > 0 then
		arg_292_0.levelCam.enabled = false

		pg.LayerWeightMgr.GetInstance():switchOriginParent()
	end
end

function var_0_0.RecordTween(arg_293_0, arg_293_1, arg_293_2)
	arg_293_0.tweens[arg_293_1] = arg_293_2
end

function var_0_0.DeleteTween(arg_294_0, arg_294_1)
	local var_294_0 = arg_294_0.tweens[arg_294_1]

	if var_294_0 then
		LeanTween.cancel(var_294_0)

		arg_294_0.tweens[arg_294_1] = nil
	end
end

function var_0_0.openCommanderPanel(arg_295_0, arg_295_1, arg_295_2, arg_295_3)
	local var_295_0 = arg_295_2.id

	arg_295_0.levelCMDFormationView:setCallback(function(arg_296_0)
		if not arg_295_3 then
			if arg_296_0.type == LevelUIConst.COMMANDER_OP_SHOW_SKILL then
				arg_295_0:emit(LevelMediator2.ON_COMMANDER_SKILL, arg_296_0.skill)
			elseif arg_296_0.type == LevelUIConst.COMMANDER_OP_ADD then
				arg_295_0.contextData.commanderSelected = {
					chapterId = var_295_0,
					fleetId = arg_295_1.id
				}

				arg_295_0:emit(LevelMediator2.ON_SELECT_COMMANDER, arg_296_0.pos, arg_295_1.id, arg_295_2)
				arg_295_0:closeCommanderPanel()
			else
				arg_295_0:emit(LevelMediator2.ON_COMMANDER_OP, {
					FleetType = LevelUIConst.FLEET_TYPE_SELECT,
					data = arg_296_0,
					fleetId = arg_295_1.id,
					chapterId = var_295_0
				}, arg_295_2)
			end
		elseif arg_296_0.type == LevelUIConst.COMMANDER_OP_SHOW_SKILL then
			arg_295_0:emit(LevelMediator2.ON_COMMANDER_SKILL, arg_296_0.skill)
		elseif arg_296_0.type == LevelUIConst.COMMANDER_OP_ADD then
			arg_295_0.contextData.eliteCommanderSelected = {
				index = arg_295_3,
				pos = arg_296_0.pos,
				chapterId = var_295_0
			}

			arg_295_0:emit(LevelMediator2.ON_SELECT_ELITE_COMMANDER, arg_295_3, arg_296_0.pos, arg_295_2)
			arg_295_0:closeCommanderPanel()
		else
			arg_295_0:emit(LevelMediator2.ON_COMMANDER_OP, {
				FleetType = LevelUIConst.FLEET_TYPE_EDIT,
				data = arg_296_0,
				index = arg_295_3,
				chapterId = var_295_0
			}, arg_295_2)
		end
	end)
	arg_295_0.levelCMDFormationView:Load()
	arg_295_0.levelCMDFormationView:ActionInvoke("update", arg_295_1, arg_295_0.commanderPrefabs)
	arg_295_0.levelCMDFormationView:ActionInvoke("Show")
end

function var_0_0.updateCommanderPrefab(arg_297_0)
	if arg_297_0.levelCMDFormationView:isShowing() then
		arg_297_0.levelCMDFormationView:ActionInvoke("updatePrefabs", arg_297_0.commanderPrefabs)
	end
end

function var_0_0.closeCommanderPanel(arg_298_0)
	arg_298_0.levelCMDFormationView:ActionInvoke("Hide")
end

function var_0_0.destroyCommanderPanel(arg_299_0)
	arg_299_0.levelCMDFormationView:Destroy()

	arg_299_0.levelCMDFormationView = nil
end

function var_0_0.setSpecialOperationTickets(arg_300_0, arg_300_1)
	arg_300_0.spTickets = arg_300_1
end

function var_0_0.HandleShowMsgBox(arg_301_0, arg_301_1)
	pg.MsgboxMgr.GetInstance():ShowMsgBox(arg_301_1)
end

function var_0_0.updatePoisonAreaTip(arg_302_0)
	local var_302_0 = arg_302_0.contextData.chapterVO
	local var_302_1 = (function(arg_303_0)
		local var_303_0 = {}
		local var_303_1 = pg.map_event_list[var_302_0.id] or {}
		local var_303_2

		if var_302_0:isLoop() then
			var_303_2 = var_303_1.event_list_loop or {}
		else
			var_303_2 = var_303_1.event_list or {}
		end

		for iter_303_0, iter_303_1 in ipairs(var_303_2) do
			local var_303_3 = pg.map_event_template[iter_303_1]

			if var_303_3.c_type == arg_303_0 then
				table.insert(var_303_0, var_303_3)
			end
		end

		return var_303_0
	end)(ChapterConst.EvtType_Poison)

	if var_302_1 then
		for iter_302_0, iter_302_1 in ipairs(var_302_1) do
			local var_302_2 = iter_302_1.round_gametip

			if var_302_2 ~= nil and var_302_2 ~= "" and var_302_0:getRoundNum() == var_302_2[1] then
				pg.TipsMgr.GetInstance():ShowTips(i18n(var_302_2[2]))
			end
		end
	end
end

function var_0_0.updateVoteBookBtn(arg_304_0)
	setActive(arg_304_0._voteBookBtn, false)
end

function var_0_0.RecordLastMapOnExit(arg_305_0)
	local var_305_0 = getProxy(ChapterProxy)

	if var_305_0 and not arg_305_0.contextData.noRecord then
		local var_305_1 = arg_305_0.contextData.map

		if not var_305_1 then
			return
		end

		if var_305_1 and var_305_1:NeedRecordMap() then
			var_305_0:recordLastMap(ChapterProxy.LAST_MAP, var_305_1.id)
		end

		if Map.lastMapForActivity then
			var_305_0:recordLastMap(ChapterProxy.LAST_MAP_FOR_ACTIVITY, Map.lastMapForActivity)
		end
	end
end

function var_0_0.IsActShopActive(arg_306_0)
	local var_306_0 = pg.gameset.activity_res_id.key_value
	local var_306_1 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_LOTTERY)

	if var_306_1 and not var_306_1:isEnd() and var_306_1:getConfig("config_client").resId == var_306_0 then
		return true
	end

	if _.detect(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_SHOP), function(arg_307_0)
		return not arg_307_0:isEnd() and arg_307_0:getConfig("config_client").pt_id == var_306_0
	end) then
		return true
	end
end

function var_0_0.willExit(arg_308_0)
	arg_308_0:ClearMapTransitions()
	arg_308_0.loader:Clear()

	if arg_308_0.contextData.chapterVO then
		pg.UIMgr.GetInstance():UnblurPanel(arg_308_0.topPanel, arg_308_0._tf)
		pg.playerResUI:SetActive({
			active = false
		})
	end

	if arg_308_0.levelFleetView and arg_308_0.levelFleetView.selectIds then
		arg_308_0.contextData.selectedFleetIDs = {}

		for iter_308_0, iter_308_1 in pairs(arg_308_0.levelFleetView.selectIds) do
			for iter_308_2, iter_308_3 in pairs(iter_308_1) do
				arg_308_0.contextData.selectedFleetIDs[#arg_308_0.contextData.selectedFleetIDs + 1] = iter_308_3
			end
		end
	end

	arg_308_0:destroyChapterPanel()
	arg_308_0:DestroyLevelInfoSPPanel()
	arg_308_0:destroyFleetEdit()
	arg_308_0:destroyCommanderPanel()
	arg_308_0:DestroyLevelStageView()
	arg_308_0:hideRepairWindow()
	arg_308_0:hideStrategyInfo()
	arg_308_0:hideRemasterPanel()
	arg_308_0:hideSpResult()
	arg_308_0:destroyGrid()
	arg_308_0:destroyAmbushWarn()
	arg_308_0:destroyAirStrike()
	arg_308_0:destroyTorpedo()
	arg_308_0:destroyStrikeAnim()
	arg_308_0:destroyTracking()
	arg_308_0:destroyUIAnims()
	PoolMgr.GetInstance():DestroyPrefab("chapter/cell_quad_mark", "")
	PoolMgr.GetInstance():DestroyPrefab("chapter/cell_quad", "")
	PoolMgr.GetInstance():DestroyPrefab("chapter/cell", "")
	PoolMgr.GetInstance():DestroyPrefab("chapter/plane", "")

	for iter_308_4, iter_308_5 in pairs(arg_308_0.mbDict) do
		iter_308_5:Destroy()
	end

	arg_308_0.mbDict = nil

	for iter_308_6, iter_308_7 in pairs(arg_308_0.tweens) do
		LeanTween.cancel(iter_308_7)
	end

	arg_308_0.tweens = nil

	if arg_308_0.cloudTimer then
		_.each(arg_308_0.cloudTimer, function(arg_309_0)
			LeanTween.cancel(arg_309_0)
		end)

		arg_308_0.cloudTimer = nil
	end

	if arg_308_0.newChapterCDTimer then
		arg_308_0.newChapterCDTimer:Stop()

		arg_308_0.newChapterCDTimer = nil
	end

	for iter_308_8, iter_308_9 in ipairs(arg_308_0.damageTextActive) do
		LeanTween.cancel(iter_308_9)
	end

	LeanTween.cancel(go(arg_308_0.avoidText))

	arg_308_0.map.localScale = Vector3.one
	arg_308_0.map.pivot = Vector2(0.5, 0.5)
	arg_308_0.float.localScale = Vector3.one
	arg_308_0.float.pivot = Vector2(0.5, 0.5)

	for iter_308_10, iter_308_11 in ipairs(arg_308_0.mapTFs) do
		clearImageSprite(iter_308_11)
	end

	_.each(arg_308_0.cloudRTFs, function(arg_310_0)
		clearImageSprite(arg_310_0)
	end)
	PoolMgr.GetInstance():DestroyAllSprite()
	Destroy(arg_308_0.enemyTpl)
	arg_308_0:RecordLastMapOnExit()
	arg_308_0.levelRemasterView:Destroy()
end

return var_0_0
