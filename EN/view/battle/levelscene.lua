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

	return var_8_0 or getProxy(ChapterProxy):GetLastNormalMap(), tobool(var_8_0)
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
			end,
			[ActivityConst.ACTIVITY_TYPE_BOSSSINGLE_VARIABLE] = function()
				arg_36_0:emit(LevelMediator2.ON_CLUE_MAP)
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

		local var_54_0, var_54_1 = arg_36_0:checkChallengeOpen()

		if var_54_0 == false then
			pg.TipsMgr.GetInstance():ShowTips(var_54_1)
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
	setActive(arg_36_0.entranceLayer:Find("enters/enter_ready/activity"), true)

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

function var_0_0.checkChallengeOpen(arg_58_0)
	local var_58_0 = getProxy(PlayerProxy):getRawData().level

	return pg.SystemOpenMgr.GetInstance():isOpenSystem(var_58_0, "ChallengeMainMediator")
end

function var_0_0.tryPlaySubGuide(arg_59_0)
	if arg_59_0.contextData.map and arg_59_0.contextData.map:isSkirmish() then
		return
	end

	pg.SystemGuideMgr.GetInstance():Play(arg_59_0)
end

function var_0_0.onBackPressed(arg_60_0)
	if arg_60_0:isfrozen() then
		return
	end

	if arg_60_0.levelAmbushView then
		return
	end

	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)

	if arg_60_0.levelInfoView:isShowing() then
		arg_60_0:hideChapterPanel()

		return
	end

	if arg_60_0.levelInfoSPView and arg_60_0.levelInfoSPView:isShowing() then
		arg_60_0:HideLevelInfoSPPanel()

		return
	end

	if arg_60_0.levelFleetView:isShowing() then
		arg_60_0:hideFleetEdit()

		return
	end

	if arg_60_0.levelStrategyView then
		arg_60_0:hideStrategyInfo()

		return
	end

	if arg_60_0.levelRepairView then
		arg_60_0:hideRepairWindow()

		return
	end

	if arg_60_0.levelRemasterView:isShowing() then
		arg_60_0:hideRemasterPanel()

		return
	end

	if isActive(arg_60_0.helpPage) then
		setActive(arg_60_0.helpPage, false)

		return
	end

	local var_60_0 = arg_60_0.contextData.chapterVO
	local var_60_1 = getProxy(ChapterProxy):getActiveChapter()

	if var_60_0 and var_60_1 then
		arg_60_0:switchToMap()

		return
	end

	triggerButton(arg_60_0:findTF("back_button", arg_60_0.topChapter))
end

function var_0_0.ShowEntranceUI(arg_61_0, arg_61_1)
	setActive(arg_61_0.entranceLayer, arg_61_1)
	setActive(arg_61_0.entranceBg, arg_61_1)
	setActive(arg_61_0.map, not arg_61_1)
	setActive(arg_61_0.float, not arg_61_1)
	setActive(arg_61_0.mainLayer, not arg_61_1)
	setActive(arg_61_0.topChapter:Find("type_entrance"), arg_61_1)

	arg_61_0.contextData.entranceStatus = tobool(arg_61_1)

	if arg_61_1 then
		setActive(arg_61_0.topChapter:Find("title_chapter"), false)
		setActive(arg_61_0.topChapter:Find("type_chapter"), false)
		setActive(arg_61_0.topChapter:Find("type_escort"), false)
		setActive(arg_61_0.topChapter:Find("type_skirmish"), false)

		if arg_61_0.newChapterCDTimer then
			arg_61_0.newChapterCDTimer:Stop()

			arg_61_0.newChapterCDTimer = nil
		end

		arg_61_0:RecordLastMapOnExit()

		arg_61_0.contextData.mapIdx = nil
		arg_61_0.contextData.map = nil
	end

	arg_61_0:PlayBGM()
end

function var_0_0.PreloadLevelMainUI(arg_62_0, arg_62_1, arg_62_2)
	if arg_62_0.preloadLevelDone then
		existCall(arg_62_2)

		return
	end

	local var_62_0

	local function var_62_1()
		if not arg_62_0.exited then
			arg_62_0.preloadLevelDone = true

			existCall(arg_62_2)
		end
	end

	local var_62_2 = getProxy(ChapterProxy):getMapById(arg_62_1)
	local var_62_3 = arg_62_0:GetMapBG(var_62_2)

	table.ParallelIpairsAsync(var_62_3, function(arg_64_0, arg_64_1, arg_64_2)
		GetSpriteFromAtlasAsync("levelmap/" .. arg_64_1.BG, "", arg_64_2)
	end, var_62_1)
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
	local var_80_0 = arg_80_0.contextData.map
	local var_80_1, var_80_2 = var_80_0:isActivity()
	local var_80_3 = var_80_0:isRemaster()
	local var_80_4 = var_80_0:isSkirmish()
	local var_80_5 = var_80_0:isEscort()
	local var_80_6 = var_80_0:getConfig("type")
	local var_80_7 = getProxy(ActivityProxy)
	local var_80_8 = underscore(var_80_7:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_ZPROJECT)):chain():select(function(arg_81_0)
		return not arg_81_0:isEnd()
	end):sort(function(arg_82_0, arg_82_1)
		return arg_82_0.id < arg_82_1.id
	end):value()[1] and not var_80_1 and not var_80_4 and not var_80_5

	if var_80_8 then
		local var_80_9 = setmetatable({}, MainActMapBtn)

		var_80_9.image = arg_80_0.activityBtn:Find("Image"):GetComponent(typeof(Image))
		var_80_9.subImage = arg_80_0.activityBtn:Find("sub_Image"):GetComponent(typeof(Image))
		var_80_9.tipTr = arg_80_0.activityBtn:Find("Tip"):GetComponent(typeof(Image))
		var_80_9.tipTxt = arg_80_0.activityBtn:Find("Tip/Text"):GetComponent(typeof(Text))
		var_80_8 = var_80_9:InShowTime()

		if var_80_8 then
			var_80_9:InitTipImage()
			var_80_9:InitSubImage()
			var_80_9:InitImage(function()
				return
			end)
			var_80_9:OnInit()
		end
	end

	setActive(arg_80_0.activityBtn, var_80_8)
	arg_80_0:updateRemasterInfo()

	if var_80_1 and var_80_2 then
		local var_80_10

		if var_80_0:isRemaster() then
			var_80_10 = getProxy(ChapterProxy):getRemasterMaps(var_80_0.remasterId)
		else
			var_80_10 = getProxy(ChapterProxy):getMapsByActivities()
		end

		local var_80_11 = underscore.any(var_80_10, function(arg_84_0)
			return arg_84_0:isActExtra()
		end)

		setActive(arg_80_0.actExtraBtn, var_80_11 and var_80_6 ~= Map.ACT_EXTRA)

		if isActive(arg_80_0.actExtraBtn) then
			if underscore.all(underscore.filter(var_80_10, function(arg_85_0)
				local var_85_0 = arg_85_0:getMapType()

				return var_85_0 == Map.ACTIVITY_EASY or var_85_0 == Map.ACTIVITY_HARD
			end), function(arg_86_0)
				return arg_86_0:isAllChaptersClear()
			end) then
				setActive(arg_80_0.actExtraBtnAnim, true)
			else
				setActive(arg_80_0.actExtraBtnAnim, false)
			end

			setActive(arg_80_0.actExtraBtn:Find("Tip"), getProxy(ChapterProxy):IsActivitySPChapterActive() and SettingsProxy.IsShowActivityMapSPTip())
		end

		local var_80_12 = checkExist(var_80_0:getBindMap(), {
			"isHardMap"
		})

		setActive(arg_80_0.actEliteBtn, var_80_12 and var_80_6 ~= Map.ACTIVITY_HARD)
		setActive(arg_80_0.actNormalBtn, var_80_6 ~= Map.ACTIVITY_EASY)
		setActive(arg_80_0.actExtraRank, var_80_6 == Map.ACT_EXTRA and _.any(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_EXTRA_CHAPTER_RANK), function(arg_87_0)
			if not arg_87_0 or arg_87_0:isEnd() then
				return
			end

			local var_87_0 = arg_87_0:getConfig("config_data")[1]

			return _.any(var_80_0:getChapters(), function(arg_88_0)
				if not arg_88_0:IsEXChapter() then
					return false
				end

				return table.contains(arg_88_0:getConfig("boss_expedition_id"), var_87_0)
			end)
		end))
		setActive(arg_80_0.actExchangeShopBtn, not ActivityConst.HIDE_PT_PANELS and not var_80_3 and var_80_2 and arg_80_0:IsActShopActive())
		setActive(arg_80_0.ptTotal, not ActivityConst.HIDE_PT_PANELS and not var_80_3 and var_80_2 and arg_80_0.ptActivity and not arg_80_0.ptActivity:isEnd())
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

	setActive(arg_80_0.eventContainer, (not var_80_1 or not var_80_2) and not var_80_5)
	setActive(arg_80_0.remasterBtn, OPEN_REMASTER and (var_80_3 or not var_80_1 and not var_80_5 and not var_80_4))
	setActive(arg_80_0.ticketTxt.parent, var_80_3)
	arg_80_0:updateRemasterTicket()
	arg_80_0:updateCountDown()
end

function var_0_0.updateRemasterTicket(arg_89_0)
	setText(arg_89_0.ticketTxt, getProxy(ChapterProxy).remasterTickets .. " / " .. pg.gameset.reactivity_ticket_max.key_value)
	arg_89_0:emit(LevelUIConst.FLUSH_REMASTER_TICKET)
end

function var_0_0.updateRemasterBtnTip(arg_90_0)
	local var_90_0 = getProxy(ChapterProxy)
	local var_90_1 = var_90_0:ifShowRemasterTip() or var_90_0:anyRemasterAwardCanReceive()

	SetActive(arg_90_0.remasterBtn:Find("tip"), var_90_1)
	SetActive(arg_90_0.entranceLayer:Find("btns/btn_remaster/tip"), var_90_1)
end

function var_0_0.updatDailyBtnTip(arg_91_0)
	local var_91_0 = getProxy(DailyLevelProxy):ifShowDailyTip()

	SetActive(arg_91_0.dailyBtn:Find("tip"), var_91_0)
	SetActive(arg_91_0.entranceLayer:Find("btns/btn_daily/tip"), var_91_0)
end

function var_0_0.updateRemasterInfo(arg_92_0)
	arg_92_0:emit(LevelUIConst.FLUSH_REMASTER_INFO)

	if not arg_92_0.contextData.map then
		return
	end

	local var_92_0 = getProxy(ChapterProxy)
	local var_92_1
	local var_92_2 = arg_92_0.contextData.map:getRemaster()

	if var_92_2 and #pg.re_map_template[var_92_2].drop_gain > 0 then
		for iter_92_0, iter_92_1 in ipairs(pg.re_map_template[var_92_2].drop_gain) do
			if #iter_92_1 > 0 and var_92_0.remasterInfo[iter_92_1[1]][iter_92_0].receive == false then
				var_92_1 = {
					iter_92_0,
					iter_92_1
				}

				break
			end
		end
	end

	setActive(arg_92_0.remasterAwardBtn, var_92_1)

	if var_92_1 then
		local var_92_3 = var_92_1[1]
		local var_92_4, var_92_5, var_92_6, var_92_7 = unpack(var_92_1[2])
		local var_92_8 = var_92_0.remasterInfo[var_92_4][var_92_3]

		setText(arg_92_0.remasterAwardBtn:Find("Text"), var_92_8.count .. "/" .. var_92_7)
		updateDrop(arg_92_0.remasterAwardBtn:Find("IconTpl"), {
			type = var_92_5,
			id = var_92_6
		})
		setActive(arg_92_0.remasterAwardBtn:Find("tip"), var_92_7 <= var_92_8.count)
		onButton(arg_92_0, arg_92_0.remasterAwardBtn, function()
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				hideYes = true,
				hideNo = true,
				type = MSGBOX_TYPE_SINGLE_ITEM,
				drop = {
					type = var_92_5,
					id = var_92_6
				},
				weight = LayerWeightConst.TOP_LAYER,
				remaster = {
					word = i18n("level_remaster_tip4", pg.chapter_template[var_92_4].chapter_name),
					number = var_92_8.count .. "/" .. var_92_7,
					btn_text = i18n(var_92_8.count < var_92_7 and "level_remaster_tip2" or "level_remaster_tip3"),
					btn_call = function()
						if var_92_8.count < var_92_7 then
							local var_94_0 = pg.chapter_template[var_92_4].map
							local var_94_1, var_94_2 = var_92_0:getMapById(var_94_0):isUnlock()

							if not var_94_1 then
								pg.TipsMgr.GetInstance():ShowTips(var_94_2)
							else
								arg_92_0:ShowSelectedMap(var_94_0)
							end
						else
							arg_92_0:emit(LevelMediator2.ON_CHAPTER_REMASTER_AWARD, var_92_4, var_92_3)
						end
					end
				}
			})
		end, SFX_PANEL)
	end
end

function var_0_0.updateCountDown(arg_95_0)
	local var_95_0 = getProxy(ChapterProxy)

	if arg_95_0.newChapterCDTimer then
		arg_95_0.newChapterCDTimer:Stop()

		arg_95_0.newChapterCDTimer = nil
	end

	local var_95_1 = 0

	if arg_95_0.contextData.map:isActivity() and not arg_95_0.contextData.map:isRemaster() then
		local var_95_2 = var_95_0:getMapsByActivities()

		_.each(var_95_2, function(arg_96_0)
			local var_96_0 = arg_96_0:getChapterTimeLimit()

			if var_95_1 == 0 then
				var_95_1 = var_96_0
			else
				var_95_1 = math.min(var_95_1, var_96_0)
			end
		end)
		setActive(arg_95_0.countDown, var_95_1 > 0)
		setText(arg_95_0.countDown:Find("title"), i18n("levelScene_new_chapter_coming"))
	else
		setActive(arg_95_0.countDown, false)
	end

	if var_95_1 > 0 then
		setText(arg_95_0.countDown:Find("time"), pg.TimeMgr.GetInstance():DescCDTime(var_95_1))

		arg_95_0.newChapterCDTimer = Timer.New(function()
			var_95_1 = var_95_1 - 1

			if var_95_1 <= 0 then
				arg_95_0:updateCountDown()

				if not arg_95_0.contextData.chapterVO then
					arg_95_0:setMap(arg_95_0.contextData.mapIdx)
				end
			else
				setText(arg_95_0.countDown:Find("time"), pg.TimeMgr.GetInstance():DescCDTime(var_95_1))
			end
		end, 1, -1)

		arg_95_0.newChapterCDTimer:Start()
	else
		setText(arg_95_0.countDown:Find("time"), "")
	end
end

function var_0_0.registerActBtn(arg_98_0)
	onButton(arg_98_0, arg_98_0.actExtraRank, function()
		if arg_98_0:isfrozen() then
			return
		end

		arg_98_0:emit(LevelMediator2.ON_EXTRA_RANK)
	end, SFX_PANEL)
	onButton(arg_98_0, arg_98_0.activityBtn, function()
		if arg_98_0:isfrozen() then
			return
		end

		arg_98_0:emit(LevelMediator2.ON_ACTIVITY_MAP)
	end, SFX_UI_CLICK)
	onButton(arg_98_0, arg_98_0.actExchangeShopBtn, function()
		if arg_98_0:isfrozen() then
			return
		end

		arg_98_0:emit(LevelMediator2.GO_ACT_SHOP)
	end, SFX_UI_CLICK)
	onButton(arg_98_0, arg_98_0.actAtelierBuffBtn, function()
		if arg_98_0:isfrozen() then
			return
		end

		arg_98_0:emit(LevelMediator2.SHOW_ATELIER_BUFF)
	end, SFX_UI_CLICK)

	local var_98_0 = getProxy(ChapterProxy)

	local function var_98_1(arg_103_0, arg_103_1, arg_103_2)
		local var_103_0

		if arg_103_0:isRemaster() then
			var_103_0 = var_98_0:getRemasterMaps(arg_103_0.remasterId)
		else
			var_103_0 = var_98_0:getMapsByActivities()
		end

		local var_103_1 = _.select(var_103_0, function(arg_104_0)
			return arg_104_0:getMapType() == arg_103_1
		end)

		table.sort(var_103_1, function(arg_105_0, arg_105_1)
			return arg_105_0.id < arg_105_1.id
		end)

		local var_103_2 = table.indexof(underscore.map(var_103_1, function(arg_106_0)
			return arg_106_0.id
		end), arg_103_2) or #var_103_1

		while not var_103_1[var_103_2]:isUnlock() do
			if var_103_2 > 1 then
				var_103_2 = var_103_2 - 1
			else
				break
			end
		end

		return var_103_1[var_103_2]
	end

	arg_98_0:bind(LevelUIConst.SWITCH_ACT_MAP, function(arg_107_0, arg_107_1, arg_107_2)
		arg_107_2 = arg_107_2 or switch(arg_107_1, {
			[Map.ACTIVITY_EASY] = function()
				return arg_98_0.contextData.map:getBindMapId()
			end,
			[Map.ACTIVITY_HARD] = function()
				return arg_98_0.contextData.map:getBindMapId()
			end,
			[Map.ACT_EXTRA] = function()
				return PlayerPrefs.GetInt("ex_mapId", 0)
			end
		})

		local var_107_0 = var_98_1(arg_98_0.contextData.map, arg_107_1, arg_107_2)
		local var_107_1, var_107_2 = var_107_0:isUnlock()

		if var_107_1 then
			arg_98_0:setMap(var_107_0.id)
		else
			pg.TipsMgr.GetInstance():ShowTips(var_107_2)
		end
	end)
	onButton(arg_98_0, arg_98_0.actNormalBtn, function()
		if arg_98_0:isfrozen() then
			return
		end

		arg_98_0:emit(LevelUIConst.SWITCH_ACT_MAP, Map.ACTIVITY_EASY)
	end, SFX_PANEL)
	onButton(arg_98_0, arg_98_0.actEliteBtn, function()
		if arg_98_0:isfrozen() then
			return
		end

		arg_98_0:emit(LevelUIConst.SWITCH_ACT_MAP, Map.ACTIVITY_HARD)
	end, SFX_PANEL)
	onButton(arg_98_0, arg_98_0.actExtraBtn, function()
		if arg_98_0:isfrozen() then
			return
		end

		arg_98_0:emit(LevelUIConst.SWITCH_ACT_MAP, Map.ACT_EXTRA)
	end, SFX_PANEL)
end

function var_0_0.initCloudsPos(arg_114_0, arg_114_1)
	arg_114_0.initPositions = {}

	local var_114_0 = arg_114_1 or 1
	local var_114_1 = pg.expedition_data_by_map[var_114_0].clouds_pos

	for iter_114_0, iter_114_1 in ipairs(arg_114_0.cloudRTFs) do
		local var_114_2 = var_114_1[iter_114_0]

		if var_114_2 then
			iter_114_1.anchoredPosition = Vector2(var_114_2[1], var_114_2[2])

			table.insert(arg_114_0.initPositions, iter_114_1.anchoredPosition)
		else
			setActive(iter_114_1, false)
		end
	end
end

function var_0_0.initMapBtn(arg_115_0, arg_115_1, arg_115_2)
	onButton(arg_115_0, arg_115_1, function()
		if arg_115_0:isfrozen() then
			return
		end

		local var_116_0 = arg_115_0.contextData.mapIdx + arg_115_2
		local var_116_1 = getProxy(ChapterProxy):getMapById(var_116_0)

		if not var_116_1 then
			return
		end

		if var_116_1:getMapType() == Map.ELITE and not var_116_1:isEliteEnabled() then
			var_116_1 = var_116_1:getBindMap()
			var_116_0 = var_116_1.id

			pg.TipsMgr.GetInstance():ShowTips(i18n("elite_disable_unusable"))
		end

		local var_116_2, var_116_3 = var_116_1:isUnlock()

		if arg_115_2 > 0 and not var_116_2 then
			pg.TipsMgr.GetInstance():ShowTips(var_116_3)

			return
		end

		arg_115_0:setMap(var_116_0)
	end, SFX_PANEL)
end

function var_0_0.ShowSelectedMap(arg_117_0, arg_117_1, arg_117_2)
	seriesAsync({
		function(arg_118_0)
			if arg_117_0.contextData.entranceStatus then
				arg_117_0:frozen()

				arg_117_0.nextPreloadMap = arg_117_1

				arg_117_0:PreloadLevelMainUI(arg_117_1, function()
					arg_117_0:unfrozen()

					if arg_117_0.nextPreloadMap ~= arg_117_1 then
						return
					end

					arg_117_0:ShowEntranceUI(false)
					arg_117_0:emit(LevelMediator2.ON_ENTER_MAINLEVEL, arg_117_1)
					arg_118_0()
				end)
			else
				arg_117_0:setMap(arg_117_1)
				arg_118_0()
			end
		end
	}, arg_117_2)
end

function var_0_0.setMap(arg_120_0, arg_120_1)
	local var_120_0 = arg_120_0.contextData.mapIdx

	arg_120_0.contextData.mapIdx = arg_120_1
	arg_120_0.contextData.map = getProxy(ChapterProxy):getMapById(arg_120_1)

	assert(arg_120_0.contextData.map, "map cannot be nil " .. arg_120_1)

	if arg_120_0.contextData.map:getMapType() == Map.ACT_EXTRA then
		PlayerPrefs.SetInt("ex_mapId", arg_120_0.contextData.map.id)
		PlayerPrefs.Save()
	elseif arg_120_0.contextData.map:isRemaster() then
		PlayerPrefs.SetInt("remaster_lastmap_" .. arg_120_0.contextData.map.remasterId, arg_120_1)
		PlayerPrefs.Save()
	end

	arg_120_0:RecordLastMapOnExit()
	arg_120_0:updateMap(var_120_0)
	arg_120_0:tryPlayMapStory()
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

function var_0_0.SwitchMapBuilder(arg_121_0, arg_121_1)
	if arg_121_0.mapBuilder and arg_121_0.mapBuilder:GetType() ~= arg_121_1 then
		arg_121_0.mapBuilder.buffer:Hide()
	end

	local var_121_0 = arg_121_0:GetMapBuilderInBuffer(arg_121_1)

	arg_121_0.mapBuilder = var_121_0

	var_121_0.buffer:Show()
end

function var_0_0.GetMapBuilderInBuffer(arg_122_0, arg_122_1)
	if not arg_122_0.mbDict[arg_122_1] then
		local var_122_0 = _G[var_0_6[arg_122_1]]

		assert(var_122_0, "Missing MapBuilder of type " .. (arg_122_1 or "NIL"))

		arg_122_0.mbDict[arg_122_1] = var_122_0.New(arg_122_0._tf, arg_122_0)
		arg_122_0.mbDict[arg_122_1].isFrozen = arg_122_0:isfrozen()

		arg_122_0.mbDict[arg_122_1]:Load()
	end

	return arg_122_0.mbDict[arg_122_1]
end

function var_0_0.updateMap(arg_123_0, arg_123_1)
	local var_123_0 = arg_123_0.contextData.map
	local var_123_1 = var_123_0:getConfig("anchor")
	local var_123_2

	if var_123_1 == "" then
		var_123_2 = Vector2.zero
	else
		var_123_2 = Vector2(unpack(var_123_1))
	end

	arg_123_0.map.pivot = var_123_2

	local var_123_3 = var_123_0:getConfig("uifx")

	for iter_123_0 = 1, arg_123_0.UIFXList.childCount do
		local var_123_4 = arg_123_0.UIFXList:GetChild(iter_123_0 - 1)

		setActive(var_123_4, var_123_4.name == var_123_3)
	end

	arg_123_0:SwitchMapBG(var_123_0, arg_123_1)
	arg_123_0:PlayBGM()

	local var_123_5 = arg_123_0.contextData.map:getConfig("ui_type")

	arg_123_0:SwitchMapBuilder(var_123_5)
	seriesAsync({
		function(arg_124_0)
			arg_123_0.mapBuilder:CallbackInvoke(arg_124_0)
		end,
		function(arg_125_0)
			arg_123_0.mapBuilder:UpdateMapVO(var_123_0)
			arg_123_0.mapBuilder:UpdateView()
			arg_123_0.mapBuilder:UpdateMapItems()
			arg_123_0.mapBuilder:PlayEnterAnim()
		end
	})
end

function var_0_0.UpdateSwitchMapButton(arg_126_0)
	local var_126_0 = arg_126_0.contextData.map
	local var_126_1 = getProxy(ChapterProxy)
	local var_126_2 = var_126_1:getMapById(var_126_0.id - 1)
	local var_126_3 = var_126_1:getMapById(var_126_0.id + 1)

	setActive(arg_126_0.btnPrev, tobool(var_126_2))
	setActive(arg_126_0.btnNext, tobool(var_126_3))

	local var_126_4 = Color.New(0.5, 0.5, 0.5, 1)

	setImageColor(arg_126_0.btnPrevCol, var_126_2 and Color.white or var_126_4)
	setImageColor(arg_126_0.btnNextCol, var_126_3 and var_126_3:isUnlock() and Color.white or var_126_4)
end

function var_0_0.tryPlayMapStory(arg_127_0)
	if IsUnityEditor and not ENABLE_GUIDE then
		return
	end

	seriesAsync({
		function(arg_128_0)
			local var_128_0 = arg_127_0.contextData.map:getConfig("enter_story")

			if var_128_0 and var_128_0 ~= "" and not pg.NewStoryMgr.GetInstance():IsPlayed(var_128_0) and not arg_127_0.contextData.map:isRemaster() and not pg.SystemOpenMgr.GetInstance().active then
				local var_128_1 = tonumber(var_128_0)

				if var_128_1 and var_128_1 > 0 then
					arg_127_0:emit(LevelMediator2.ON_PERFORM_COMBAT, var_128_1)
				else
					pg.NewStoryMgr.GetInstance():Play(var_128_0, arg_128_0)
				end

				return
			end

			arg_128_0()
		end,
		function(arg_129_0)
			local var_129_0 = arg_127_0.contextData.map:getConfig("guide_id")

			if var_129_0 and var_129_0 ~= "" then
				pg.SystemGuideMgr.GetInstance():PlayByGuideId(var_129_0, nil, arg_129_0)

				return
			end

			arg_129_0()
		end,
		function(arg_130_0)
			if isActive(arg_127_0.actAtelierBuffBtn) and getProxy(ActivityProxy):AtelierActivityAllSlotIsEmpty() and getProxy(ActivityProxy):OwnAtelierActivityItemCnt(34, 1) then
				local var_130_0 = PlayerPrefs.GetInt("first_enter_ryza_buff_" .. getProxy(PlayerProxy):getRawData().id, 0) == 0
				local var_130_1

				if var_130_0 then
					var_130_1 = {
						1,
						2
					}
				else
					var_130_1 = {
						1
					}
				end

				pg.SystemGuideMgr.GetInstance():PlayByGuideId("NG0034", var_130_1)
			else
				arg_130_0()
			end
		end,
		function(arg_131_0)
			if arg_127_0.exited then
				return
			end

			pg.SystemOpenMgr.GetInstance():notification(arg_127_0.player.level)

			if pg.SystemOpenMgr.GetInstance().active then
				getProxy(ChapterProxy):StopAutoFight()
			end
		end
	})
end

function var_0_0.DisplaySPAnim(arg_132_0, arg_132_1, arg_132_2, arg_132_3)
	arg_132_0.uiAnims = arg_132_0.uiAnims or {}

	local var_132_0 = arg_132_0.uiAnims[arg_132_1]

	local function var_132_1()
		arg_132_0.playing = true

		arg_132_0:frozen()
		var_132_0:SetActive(true)

		local var_133_0 = tf(var_132_0)

		pg.UIMgr.GetInstance():OverlayPanel(var_133_0, {
			groupName = LayerWeightConst.GROUP_LEVELUI
		})

		if arg_132_3 then
			arg_132_3(var_132_0)
		end

		var_133_0:GetComponent("DftAniEvent"):SetEndEvent(function(arg_134_0)
			arg_132_0.playing = false

			if arg_132_2 then
				arg_132_2(var_132_0)
			end

			arg_132_0:unfrozen()
		end)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
	end

	if not var_132_0 then
		PoolMgr.GetInstance():GetUI(arg_132_1, true, function(arg_135_0)
			arg_135_0:SetActive(true)

			arg_132_0.uiAnims[arg_132_1] = arg_135_0
			var_132_0 = arg_132_0.uiAnims[arg_132_1]

			var_132_1()
		end)
	else
		var_132_1()
	end
end

function var_0_0.displaySpResult(arg_136_0, arg_136_1, arg_136_2)
	setActive(arg_136_0.spResult, true)
	arg_136_0:DisplaySPAnim(arg_136_1 == 1 and "SpUnitWin" or "SpUnitLose", function(arg_137_0)
		onButton(arg_136_0, arg_137_0, function()
			removeOnButton(arg_137_0)
			setActive(arg_137_0, false)
			pg.UIMgr.GetInstance():UnOverlayPanel(arg_137_0, arg_136_0._tf)
			arg_136_0:hideSpResult()
			arg_136_2()
		end, SFX_PANEL)
	end)
end

function var_0_0.hideSpResult(arg_139_0)
	setActive(arg_139_0.spResult, false)
end

function var_0_0.displayBombResult(arg_140_0, arg_140_1)
	setActive(arg_140_0.spResult, true)
	arg_140_0:DisplaySPAnim("SpBombRet", function(arg_141_0)
		onButton(arg_140_0, arg_141_0, function()
			removeOnButton(arg_141_0)
			setActive(arg_141_0, false)
			pg.UIMgr.GetInstance():UnOverlayPanel(arg_141_0, arg_140_0._tf)
			arg_140_0:hideSpResult()
			arg_140_1()
		end, SFX_PANEL)
	end, function(arg_143_0)
		setText(arg_143_0.transform:Find("right/name_bg/en"), arg_140_0.contextData.chapterVO.modelCount)
	end)
end

function var_0_0.OnLevelInfoPanelConfirm(arg_144_0, arg_144_1, arg_144_2)
	arg_144_0.contextData.chapterLoopFlag = arg_144_2

	local var_144_0 = getProxy(ChapterProxy):getChapterById(arg_144_1, true)

	if var_144_0:getConfig("type") == Chapter.CustomFleet then
		arg_144_0:displayFleetEdit(var_144_0)

		return
	end

	if #var_144_0:getNpcShipByType(1) > 0 then
		arg_144_0:emit(LevelMediator2.ON_TRACKING, arg_144_1)

		return
	end

	arg_144_0:displayFleetSelect(var_144_0)
end

function var_0_0.DisplayLevelInfoPanel(arg_145_0, arg_145_1, arg_145_2)
	seriesAsync({
		function(arg_146_0)
			if not arg_145_0.levelInfoView:GetLoaded() then
				arg_145_0:frozen()
				arg_145_0.levelInfoView:Load()
				arg_145_0.levelInfoView:CallbackInvoke(function()
					arg_145_0:unfrozen()
					arg_146_0()
				end)

				return
			end

			arg_146_0()
		end,
		function(arg_148_0)
			local function var_148_0(arg_149_0, arg_149_1)
				arg_145_0:hideChapterPanel()
				arg_145_0:OnLevelInfoPanelConfirm(arg_149_0, arg_149_1)
			end

			local function var_148_1()
				arg_145_0:hideChapterPanel()
			end

			local var_148_2 = getProxy(ChapterProxy):getChapterById(arg_145_1, true)

			if getProxy(ChapterProxy):getMapById(var_148_2:getConfig("map")):isSkirmish() and #var_148_2:getNpcShipByType(1) > 0 then
				var_148_0(false)

				return
			end

			arg_145_0.levelInfoView:set(arg_145_1, arg_145_2)
			arg_145_0.levelInfoView:setCBFunc(var_148_0, var_148_1)
			arg_145_0.levelInfoView:Show()
		end
	})
end

function var_0_0.hideChapterPanel(arg_151_0)
	if arg_151_0.levelInfoView:isShowing() then
		arg_151_0.levelInfoView:Hide()
	end
end

function var_0_0.destroyChapterPanel(arg_152_0)
	arg_152_0.levelInfoView:Destroy()

	arg_152_0.levelInfoView = nil
end

function var_0_0.DisplayLevelInfoSPPanel(arg_153_0, arg_153_1, arg_153_2, arg_153_3)
	seriesAsync({
		function(arg_154_0)
			if not arg_153_0.levelInfoSPView then
				arg_153_0.levelInfoSPView = LevelInfoSPView.New(arg_153_0.topPanel, arg_153_0.event, arg_153_0.contextData)

				arg_153_0:frozen()
				arg_153_0.levelInfoSPView:Load()
				arg_153_0.levelInfoSPView:CallbackInvoke(function()
					arg_153_0:unfrozen()
					arg_154_0()
				end)

				return
			end

			arg_154_0()
		end,
		function(arg_156_0)
			local function var_156_0(arg_157_0, arg_157_1)
				arg_153_0:HideLevelInfoSPPanel()
				arg_153_0:OnLevelInfoPanelConfirm(arg_157_0, arg_157_1)
			end

			local function var_156_1()
				arg_153_0:HideLevelInfoSPPanel()
			end

			arg_153_0.levelInfoSPView:SetChapterGroupInfo(arg_153_2)
			arg_153_0.levelInfoSPView:set(arg_153_1, arg_153_3)
			arg_153_0.levelInfoSPView:setCBFunc(var_156_0, var_156_1)
			arg_153_0.levelInfoSPView:Show()
		end
	})
end

function var_0_0.HideLevelInfoSPPanel(arg_159_0)
	if arg_159_0.levelInfoSPView and arg_159_0.levelInfoSPView:isShowing() then
		arg_159_0.levelInfoSPView:Hide()
	end
end

function var_0_0.DestroyLevelInfoSPPanel(arg_160_0)
	if not arg_160_0.levelInfoSPView then
		return
	end

	arg_160_0.levelInfoSPView:Destroy()

	arg_160_0.levelInfoSPView = nil
end

function var_0_0.displayFleetSelect(arg_161_0, arg_161_1)
	local var_161_0 = arg_161_0.contextData.selectedFleetIDs or arg_161_1:GetDefaultFleetIndex()

	arg_161_1 = Clone(arg_161_1)
	arg_161_1.loopFlag = arg_161_0.contextData.chapterLoopFlag

	arg_161_0.levelFleetView:updateSpecialOperationTickets(arg_161_0.spTickets)
	arg_161_0.levelFleetView:Load()
	arg_161_0.levelFleetView:ActionInvoke("setHardShipVOs", arg_161_0.shipVOs)
	arg_161_0.levelFleetView:ActionInvoke("setOpenCommanderTag", arg_161_0.openedCommanerSystem)
	arg_161_0.levelFleetView:ActionInvoke("set", arg_161_1, arg_161_0.fleets, var_161_0)
	arg_161_0.levelFleetView:ActionInvoke("Show")
end

function var_0_0.hideFleetSelect(arg_162_0)
	if arg_162_0.levelCMDFormationView:isShowing() then
		arg_162_0.levelCMDFormationView:Hide()
	end

	if arg_162_0.levelFleetView then
		arg_162_0.levelFleetView:Hide()
	end
end

function var_0_0.buildCommanderPanel(arg_163_0)
	arg_163_0.levelCMDFormationView = LevelCMDFormationView.New(arg_163_0.topPanel, arg_163_0.event, arg_163_0.contextData)
end

function var_0_0.destroyFleetSelect(arg_164_0)
	if not arg_164_0.levelFleetView then
		return
	end

	arg_164_0.levelFleetView:Destroy()

	arg_164_0.levelFleetView = nil
end

function var_0_0.displayFleetEdit(arg_165_0, arg_165_1)
	arg_165_1 = Clone(arg_165_1)
	arg_165_1.loopFlag = arg_165_0.contextData.chapterLoopFlag

	arg_165_0.levelFleetView:updateSpecialOperationTickets(arg_165_0.spTickets)
	arg_165_0.levelFleetView:Load()
	arg_165_0.levelFleetView:ActionInvoke("setOpenCommanderTag", arg_165_0.openedCommanerSystem)
	arg_165_0.levelFleetView:ActionInvoke("setHardShipVOs", arg_165_0.shipVOs)
	arg_165_0.levelFleetView:ActionInvoke("setOnHard", arg_165_1)
	arg_165_0.levelFleetView:ActionInvoke("Show")
end

function var_0_0.hideFleetEdit(arg_166_0)
	arg_166_0:hideFleetSelect()
end

function var_0_0.destroyFleetEdit(arg_167_0)
	arg_167_0:destroyFleetSelect()
end

function var_0_0.RefreshFleetSelectView(arg_168_0, arg_168_1)
	if not arg_168_0.levelFleetView then
		return
	end

	assert(arg_168_0.levelFleetView:GetLoaded())

	local var_168_0 = arg_168_0.levelFleetView:IsSelectMode()
	local var_168_1

	if var_168_0 then
		arg_168_0.levelFleetView:ActionInvoke("set", arg_168_1 or arg_168_0.levelFleetView.chapter, arg_168_0.fleets, arg_168_0.levelFleetView:getSelectIds())

		if arg_168_0.levelCMDFormationView:isShowing() then
			local var_168_2 = arg_168_0.levelCMDFormationView.fleet.id

			var_168_1 = arg_168_0.fleets[var_168_2]
		end
	else
		arg_168_0.levelFleetView:ActionInvoke("setOnHard", arg_168_1 or arg_168_0.levelFleetView.chapter)

		if arg_168_0.levelCMDFormationView:isShowing() then
			local var_168_3 = arg_168_0.levelCMDFormationView.fleet.id

			var_168_1 = arg_168_1:wrapEliteFleet(var_168_3)
		end
	end

	if var_168_1 then
		arg_168_0.levelCMDFormationView:ActionInvoke("updateFleet", var_168_1)
	end
end

function var_0_0.setChapter(arg_169_0, arg_169_1)
	local var_169_0

	if arg_169_1 then
		var_169_0 = arg_169_1.id
	end

	arg_169_0.contextData.chapterId = var_169_0
	arg_169_0.contextData.chapterVO = arg_169_1
end

function var_0_0.switchToChapter(arg_170_0, arg_170_1)
	if arg_170_0.contextData.mapIdx ~= arg_170_1:getConfig("map") then
		arg_170_0:setMap(arg_170_1:getConfig("map"))
	end

	arg_170_0:setChapter(arg_170_1)

	arg_170_0.leftCanvasGroup.blocksRaycasts = false
	arg_170_0.rightCanvasGroup.blocksRaycasts = false

	assert(not arg_170_0.levelStageView, "LevelStageView Exists On SwitchToChapter")
	arg_170_0:DestroyLevelStageView()

	if not arg_170_0.levelStageView then
		arg_170_0.levelStageView = LevelStageView.New(arg_170_0.topPanel, arg_170_0.event, arg_170_0.contextData)

		arg_170_0.levelStageView:Load()

		arg_170_0.levelStageView.isFrozen = arg_170_0:isfrozen()
	end

	arg_170_0:frozen()

	local function var_170_0()
		seriesAsync({
			function(arg_172_0)
				arg_170_0.mapBuilder:CallbackInvoke(arg_172_0)
			end,
			function(arg_173_0)
				setActive(arg_170_0.clouds, false)
				arg_170_0.mapBuilder:HideFloat()
				pg.UIMgr.GetInstance():BlurPanel(arg_170_0.topPanel, false, {
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
				arg_170_0.levelStageView:updateStageInfo()
				arg_170_0.levelStageView:updateAmbushRate(arg_170_1.fleet.line, true)
				arg_170_0.levelStageView:updateStageAchieve()
				arg_170_0.levelStageView:updateStageBarrier()
				arg_170_0.levelStageView:updateBombPanel()
				arg_170_0.levelStageView:UpdateDefenseStatus()
				onNextTick(arg_173_0)
			end,
			function(arg_174_0)
				if arg_170_0.exited then
					return
				end

				arg_170_0.levelStageView:updateStageStrategy()

				arg_170_0.canvasGroup.blocksRaycasts = arg_170_0.frozenCount == 0

				onNextTick(arg_174_0)
			end,
			function(arg_175_0)
				if arg_170_0.exited then
					return
				end

				arg_170_0.levelStageView:updateStageFleet()
				arg_170_0.levelStageView:updateSupportFleet()
				arg_170_0.levelStageView:updateFleetBuff()
				onNextTick(arg_175_0)
			end,
			function(arg_176_0)
				if arg_170_0.exited then
					return
				end

				parallelAsync({
					function(arg_177_0)
						local var_177_0 = arg_170_1:getConfig("scale")
						local var_177_1 = LeanTween.value(go(arg_170_0.map), arg_170_0.map.localScale, Vector3.New(var_177_0[3], var_177_0[3], 1), var_0_1):setOnUpdateVector3(function(arg_178_0)
							arg_170_0.map.localScale = arg_178_0
							arg_170_0.float.localScale = arg_178_0
						end):setOnComplete(System.Action(function()
							arg_170_0.mapBuilder:ShowFloat()
							arg_170_0.mapBuilder:Hide()
							arg_177_0()
						end)):setEase(LeanTweenType.easeOutSine)

						arg_170_0:RecordTween("mapScale", var_177_1.uniqueId)

						local var_177_2 = LeanTween.value(go(arg_170_0.map), arg_170_0.map.pivot, Vector2.New(math.clamp(var_177_0[1] - 0.5, 0, 1), math.clamp(var_177_0[2] - 0.5, 0, 1)), var_0_1)

						var_177_2:setOnUpdateVector2(function(arg_180_0)
							arg_170_0.map.pivot = arg_180_0
							arg_170_0.float.pivot = arg_180_0
						end):setEase(LeanTweenType.easeOutSine)
						arg_170_0:RecordTween("mapPivot", var_177_2.uniqueId)
						shiftPanel(arg_170_0.leftChapter, -arg_170_0.leftChapter.rect.width - 200, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
						shiftPanel(arg_170_0.rightChapter, arg_170_0.rightChapter.rect.width + 200, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
						shiftPanel(arg_170_0.topChapter, 0, arg_170_0.topChapter.rect.height, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
						arg_170_0.levelStageView:ShiftStagePanelIn()
					end,
					function(arg_181_0)
						arg_170_0:PlayBGM()

						local var_181_0 = {}
						local var_181_1 = arg_170_1:getConfig("bg")

						if var_181_1 and #var_181_1 > 0 then
							var_181_0[1] = {
								BG = var_181_1
							}
						end

						arg_170_0:SwitchBG(var_181_0, arg_181_0)
					end
				}, function()
					onNextTick(arg_176_0)
				end)
			end,
			function(arg_183_0)
				if arg_170_0.exited then
					return
				end

				setActive(arg_170_0.topChapter, false)
				setActive(arg_170_0.leftChapter, false)
				setActive(arg_170_0.rightChapter, false)

				arg_170_0.leftCanvasGroup.blocksRaycasts = true
				arg_170_0.rightCanvasGroup.blocksRaycasts = true

				arg_170_0:initGrid(arg_183_0)
			end,
			function(arg_184_0)
				if arg_170_0.exited then
					return
				end

				arg_170_0.levelStageView:SetGrid(arg_170_0.grid)

				arg_170_0.contextData.huntingRangeVisibility = arg_170_0.contextData.huntingRangeVisibility - 1

				arg_170_0.grid:toggleHuntingRange()

				local var_184_0 = arg_170_1:getConfig("pop_pic")

				if var_184_0 and #var_184_0 > 0 and arg_170_0.FirstEnterChapter == arg_170_1.id then
					arg_170_0:doPlayAnim(var_184_0, function(arg_185_0)
						setActive(arg_185_0, false)

						if arg_170_0.exited then
							return
						end

						arg_184_0()
					end)
				else
					arg_184_0()
				end
			end,
			function(arg_186_0)
				arg_170_0.levelStageView:tryAutoAction(arg_186_0)
			end,
			function(arg_187_0)
				if arg_170_0.exited then
					return
				end

				arg_170_0:unfrozen()

				if arg_170_0.FirstEnterChapter then
					arg_170_0:emit(LevelMediator2.ON_RESUME_SUBSTATE, arg_170_1.subAutoAttack)
				end

				arg_170_0.FirstEnterChapter = nil

				arg_170_0.levelStageView:tryAutoTrigger(true)
			end
		})
	end

	arg_170_0.levelStageView:ActionInvoke("SetSeriesOperation", var_170_0)
	arg_170_0.levelStageView:ActionInvoke("SetPlayer", arg_170_0.player)
	arg_170_0.levelStageView:ActionInvoke("SwitchToChapter", arg_170_1)
end

function var_0_0.switchToMap(arg_188_0, arg_188_1)
	arg_188_0:frozen()
	arg_188_0:destroyGrid()
	arg_188_0:setChapter(nil)
	LeanTween.cancel(go(arg_188_0.map))

	local var_188_0 = LeanTween.value(go(arg_188_0.map), arg_188_0.map.localScale, Vector3.one, var_0_1):setOnUpdateVector3(function(arg_189_0)
		arg_188_0.map.localScale = arg_189_0
		arg_188_0.float.localScale = arg_189_0
	end):setOnComplete(System.Action(function()
		arg_188_0:unfrozen()
		arg_188_0.mapBuilder:PlayEnterAnim()
		existCall(arg_188_1)
	end)):setEase(LeanTweenType.easeOutSine)

	arg_188_0:RecordTween("mapScale", var_188_0.uniqueId)

	local var_188_1 = arg_188_0.contextData.map:getConfig("anchor")
	local var_188_2

	if var_188_1 == "" then
		var_188_2 = Vector2.zero
	else
		var_188_2 = Vector2(unpack(var_188_1))
	end

	local var_188_3 = LeanTween.value(go(arg_188_0.map), arg_188_0.map.pivot, var_188_2, var_0_1)

	var_188_3:setOnUpdateVector2(function(arg_191_0)
		arg_188_0.map.pivot = arg_191_0
		arg_188_0.float.pivot = arg_191_0
	end):setEase(LeanTweenType.easeOutSine)
	arg_188_0:RecordTween("mapPivot", var_188_3.uniqueId)
	setActive(arg_188_0.topChapter, true)
	setActive(arg_188_0.leftChapter, true)
	setActive(arg_188_0.rightChapter, true)
	shiftPanel(arg_188_0.leftChapter, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(arg_188_0.rightChapter, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(arg_188_0.topChapter, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	assert(arg_188_0.levelStageView, "LevelStageView Doesnt Exist On SwitchToMap")

	if arg_188_0.levelStageView then
		arg_188_0.levelStageView:ActionInvoke("ShiftStagePanelOut", function()
			arg_188_0:DestroyLevelStageView()
		end)
		arg_188_0.levelStageView:ActionInvoke("SwitchToMap")
	end

	arg_188_0:SwitchMapBG(arg_188_0.contextData.map)
	arg_188_0:PlayBGM()
	seriesAsync({
		function(arg_193_0)
			arg_188_0.mapBuilder:CallbackInvoke(arg_193_0)
		end,
		function(arg_194_0)
			arg_188_0.mapBuilder:Show()
			arg_188_0.mapBuilder:UpdateView()
			arg_188_0.mapBuilder:UpdateMapItems()
		end
	})
	pg.UIMgr.GetInstance():UnblurPanel(arg_188_0.topPanel, arg_188_0._tf)
	pg.playerResUI:SetActive({
		active = false
	})

	arg_188_0.canvasGroup.blocksRaycasts = arg_188_0.frozenCount == 0
	arg_188_0.canvasGroup.interactable = true

	if arg_188_0.ambushWarning and arg_188_0.ambushWarning.activeSelf then
		arg_188_0.ambushWarning:SetActive(false)
		arg_188_0:unfrozen()
	end
end

function var_0_0.SwitchBG(arg_195_0, arg_195_1, arg_195_2, arg_195_3)
	if not arg_195_1 or #arg_195_1 <= 0 then
		existCall(arg_195_2)

		return
	elseif arg_195_3 then
		-- block empty
	elseif table.equal(arg_195_0.currentBG, arg_195_1) then
		return
	end

	arg_195_0.currentBG = arg_195_1

	for iter_195_0, iter_195_1 in ipairs(arg_195_0.mapGroup) do
		arg_195_0.loader:ClearRequest(iter_195_1)
	end

	table.clear(arg_195_0.mapGroup)

	local var_195_0 = {}

	table.ParallelIpairsAsync(arg_195_1, function(arg_196_0, arg_196_1, arg_196_2)
		local var_196_0 = arg_195_0.mapTFs[arg_196_0]
		local var_196_1 = arg_196_1.bgPrefix and arg_196_1.bgPrefix .. "/" or "levelmap/"
		local var_196_2 = arg_195_0.loader:GetSpriteDirect(var_196_1 .. arg_196_1.BG, "", function(arg_197_0)
			var_195_0[arg_196_0] = arg_197_0

			arg_196_2()
		end, var_196_0)

		table.insert(arg_195_0.mapGroup, var_196_2)
		arg_195_0:updateCouldAnimator(arg_196_1.Animator, arg_196_0)
	end, function()
		for iter_198_0, iter_198_1 in ipairs(arg_195_0.mapTFs) do
			setImageSprite(iter_198_1, var_195_0[iter_198_0])
			setActive(iter_198_1, arg_195_1[iter_198_0])
			SetCompomentEnabled(iter_198_1, typeof(Image), true)
		end

		existCall(arg_195_2)
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

function var_0_0.ClearMapTransitions(arg_199_0)
	if not arg_199_0.mapTransitions then
		return
	end

	for iter_199_0, iter_199_1 in pairs(arg_199_0.mapTransitions) do
		if iter_199_1 then
			PoolMgr.GetInstance():ReturnPrefab("ui/" .. iter_199_0, iter_199_0, iter_199_1, true)
		else
			PoolMgr.GetInstance():DestroyPrefab("ui/" .. iter_199_0, iter_199_0)
		end
	end

	arg_199_0.mapTransitions = nil
end

function var_0_0.SwitchMapBG(arg_200_0, arg_200_1, arg_200_2, arg_200_3)
	local var_200_0, var_200_1, var_200_2 = arg_200_0:GetMapBG(arg_200_1, arg_200_2)

	if not var_200_1 then
		arg_200_0:SwitchBG(var_200_0, nil, arg_200_3)

		return
	end

	arg_200_0:PlayMapTransition("LevelMapTransition_" .. var_200_1, var_200_2, function()
		arg_200_0:SwitchBG(var_200_0, nil, arg_200_3)
	end)
end

function var_0_0.GetMapBG(arg_202_0, arg_202_1, arg_202_2)
	if not table.contains(var_0_7, arg_202_1.id) then
		return {
			arg_202_0:GetMapElement(arg_202_1)
		}
	end

	local var_202_0 = arg_202_1.id
	local var_202_1 = table.indexof(var_0_7, var_202_0) - 1
	local var_202_2 = bit.lshift(bit.rshift(var_202_1, 1), 1) + 1
	local var_202_3 = {
		var_0_7[var_202_2],
		var_0_7[var_202_2 + 1]
	}
	local var_202_4 = _.map(var_202_3, function(arg_203_0)
		return getProxy(ChapterProxy):getMapById(arg_203_0)
	end)

	if _.all(var_202_4, function(arg_204_0)
		return arg_204_0:isAllChaptersClear()
	end) then
		local var_202_5 = {
			arg_202_0:GetMapElement(arg_202_1)
		}

		if not arg_202_2 or math.abs(var_202_0 - arg_202_2) ~= 1 then
			return var_202_5
		end

		local var_202_6 = var_0_9[bit.rshift(var_202_2 - 1, 1) + 1]
		local var_202_7 = bit.band(var_202_1, 1) == 1

		return var_202_5, var_202_6, var_202_7
	else
		local var_202_8 = 0

		;(function()
			local var_205_0 = var_202_4[1]:getChapters()

			for iter_205_0, iter_205_1 in ipairs(var_205_0) do
				if not iter_205_1:isClear() then
					return
				end

				var_202_8 = var_202_8 + 1
			end

			if not var_202_4[2]:isAnyChapterUnlocked(true) then
				return
			end

			var_202_8 = var_202_8 + 1

			local var_205_1 = var_202_4[2]:getChapters()

			for iter_205_2, iter_205_3 in ipairs(var_205_1) do
				if not iter_205_3:isClear() then
					return
				end

				var_202_8 = var_202_8 + 1
			end
		end)()

		local var_202_9

		if var_202_8 > 0 then
			local var_202_10 = var_0_8[bit.rshift(var_202_2 - 1, 1) + 1]

			var_202_9 = {
				{
					BG = "map_" .. var_202_10[1],
					Animator = var_202_10[2]
				},
				{
					BG = "map_" .. var_202_10[3] + var_202_8,
					Animator = var_202_10[4]
				}
			}
		else
			var_202_9 = {
				arg_202_0:GetMapElement(arg_202_1)
			}
		end

		return var_202_9
	end
end

function var_0_0.GetMapElement(arg_206_0, arg_206_1)
	local var_206_0 = arg_206_1:getConfig("bg")
	local var_206_1 = arg_206_1:getConfig("ani_controller")

	if var_206_1 and #var_206_1 > 0 then
		(function()
			for iter_207_0, iter_207_1 in ipairs(var_206_1) do
				local var_207_0 = _.rest(iter_207_1[2], 2)

				for iter_207_2, iter_207_3 in ipairs(var_207_0) do
					if string.find(iter_207_3, "^map_") and iter_207_1[1] == var_0_3 then
						local var_207_1 = iter_207_1[2][1]
						local var_207_2 = getProxy(ChapterProxy):GetChapterItemById(var_207_1)

						if var_207_2 and not var_207_2:isClear() then
							var_206_0 = iter_207_3

							return
						end
					end
				end
			end
		end)()
	end

	local var_206_2 = {
		BG = var_206_0
	}

	var_206_2.Animator, var_206_2.AnimatorController = arg_206_0:GetMapAnimator(arg_206_1)

	return var_206_2
end

function var_0_0.GetMapAnimator(arg_208_0, arg_208_1)
	local var_208_0 = arg_208_1:getConfig("ani_name")

	if arg_208_1:getConfig("animtor") == 1 and var_208_0 and #var_208_0 > 0 then
		local var_208_1 = arg_208_1:getConfig("ani_controller")

		if var_208_1 and #var_208_1 > 0 then
			(function()
				for iter_209_0, iter_209_1 in ipairs(var_208_1) do
					local var_209_0 = _.rest(iter_209_1[2], 2)

					for iter_209_2, iter_209_3 in ipairs(var_209_0) do
						if string.find(iter_209_3, "^effect_") and iter_209_1[1] == var_0_3 then
							local var_209_1 = iter_209_1[2][1]
							local var_209_2 = getProxy(ChapterProxy):GetChapterItemById(var_209_1)

							if var_209_2 and not var_209_2:isClear() then
								var_208_0 = "map_" .. string.sub(iter_209_3, 8)

								return
							end
						end
					end
				end
			end)()
		end

		return var_208_0, var_208_1
	end
end

function var_0_0.PlayMapTransition(arg_210_0, arg_210_1, arg_210_2, arg_210_3, arg_210_4)
	arg_210_0.mapTransitions = arg_210_0.mapTransitions or {}

	local var_210_0

	local function var_210_1()
		arg_210_0:frozen()
		existCall(arg_210_3, var_210_0)
		var_210_0:SetActive(true)

		local var_211_0 = tf(var_210_0)

		pg.UIMgr.GetInstance():OverlayPanel(var_211_0, {
			groupName = LayerWeightConst.GROUP_LEVELUI
		})
		var_210_0:GetComponent(typeof(Animator)):Play(arg_210_2 and "Sequence" or "Inverted", -1, 0)
		var_211_0:GetComponent("DftAniEvent"):SetEndEvent(function(arg_212_0)
			pg.UIMgr.GetInstance():UnOverlayPanel(var_211_0, arg_210_0._tf)
			existCall(arg_210_4, var_210_0)
			PoolMgr.GetInstance():ReturnPrefab("ui/" .. arg_210_1, arg_210_1, var_210_0)

			arg_210_0.mapTransitions[arg_210_1] = false

			arg_210_0:unfrozen()
		end)
	end

	PoolMgr.GetInstance():GetPrefab("ui/" .. arg_210_1, arg_210_1, true, function(arg_213_0)
		var_210_0 = arg_213_0
		arg_210_0.mapTransitions[arg_210_1] = arg_213_0

		var_210_1()
	end)
end

function var_0_0.DestroyLevelStageView(arg_214_0)
	if arg_214_0.levelStageView then
		arg_214_0.levelStageView:Destroy()

		arg_214_0.levelStageView = nil
	end
end

function var_0_0.displayAmbushInfo(arg_215_0, arg_215_1)
	arg_215_0.levelAmbushView = LevelAmbushView.New(arg_215_0.topPanel, arg_215_0.event, arg_215_0.contextData)

	arg_215_0.levelAmbushView:Load()
	arg_215_0.levelAmbushView:ActionInvoke("SetFuncOnComplete", arg_215_1)
end

function var_0_0.hideAmbushInfo(arg_216_0)
	if arg_216_0.levelAmbushView then
		arg_216_0.levelAmbushView:Destroy()

		arg_216_0.levelAmbushView = nil
	end
end

function var_0_0.doAmbushWarning(arg_217_0, arg_217_1)
	arg_217_0:frozen()

	local function var_217_0()
		arg_217_0.ambushWarning:SetActive(true)

		local var_218_0 = tf(arg_217_0.ambushWarning)

		var_218_0:SetParent(pg.UIMgr.GetInstance().OverlayMain.transform, false)
		var_218_0:SetSiblingIndex(1)

		local var_218_1 = var_218_0:GetComponent("DftAniEvent")

		var_218_1:SetTriggerEvent(function(arg_219_0)
			arg_217_1()
		end)
		var_218_1:SetEndEvent(function(arg_220_0)
			arg_217_0.ambushWarning:SetActive(false)
			arg_217_0:unfrozen()
		end)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
		Timer.New(function()
			pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
		end, 1, 1):Start()
	end

	if not arg_217_0.ambushWarning then
		PoolMgr.GetInstance():GetUI("ambushwarnui", true, function(arg_222_0)
			arg_222_0:SetActive(true)

			arg_217_0.ambushWarning = arg_222_0

			var_217_0()
		end)
	else
		var_217_0()
	end
end

function var_0_0.destroyAmbushWarn(arg_223_0)
	if arg_223_0.ambushWarning then
		PoolMgr.GetInstance():ReturnUI("ambushwarnui", arg_223_0.ambushWarning)

		arg_223_0.ambushWarning = nil
	end
end

function var_0_0.displayStrategyInfo(arg_224_0, arg_224_1)
	arg_224_0.levelStrategyView = LevelStrategyView.New(arg_224_0.topPanel, arg_224_0.event, arg_224_0.contextData)

	arg_224_0.levelStrategyView:Load()
	arg_224_0.levelStrategyView:ActionInvoke("set", arg_224_1)

	local function var_224_0()
		local var_225_0 = arg_224_0.contextData.chapterVO.fleet
		local var_225_1 = pg.strategy_data_template[arg_224_1.id]

		if not var_225_0:canUseStrategy(arg_224_1) then
			return
		end

		local var_225_2 = var_225_0:getNextStgUser(arg_224_1.id)

		if var_225_1.type == ChapterConst.StgTypeForm then
			arg_224_0:emit(LevelMediator2.ON_OP, {
				type = ChapterConst.OpStrategy,
				id = var_225_2,
				arg1 = arg_224_1.id
			})
		elseif var_225_1.type == ChapterConst.StgTypeConsume then
			arg_224_0:emit(LevelMediator2.ON_OP, {
				type = ChapterConst.OpStrategy,
				id = var_225_2,
				arg1 = arg_224_1.id
			})
		end

		arg_224_0:hideStrategyInfo()
	end

	local function var_224_1()
		arg_224_0:hideStrategyInfo()
	end

	arg_224_0.levelStrategyView:ActionInvoke("setCBFunc", var_224_0, var_224_1)
end

function var_0_0.hideStrategyInfo(arg_227_0)
	if arg_227_0.levelStrategyView then
		arg_227_0.levelStrategyView:Destroy()

		arg_227_0.levelStrategyView = nil
	end
end

function var_0_0.displayRepairWindow(arg_228_0, arg_228_1)
	local var_228_0 = arg_228_0.contextData.chapterVO
	local var_228_1 = getProxy(ChapterProxy)
	local var_228_2
	local var_228_3
	local var_228_4
	local var_228_5
	local var_228_6 = var_228_1.repairTimes
	local var_228_7, var_228_8, var_228_9 = ChapterConst.GetRepairParams()

	arg_228_0.levelRepairView = LevelRepairView.New(arg_228_0.topPanel, arg_228_0.event, arg_228_0.contextData)

	arg_228_0.levelRepairView:Load()
	arg_228_0.levelRepairView:ActionInvoke("set", var_228_6, var_228_7, var_228_8, var_228_9)

	local function var_228_10()
		if var_228_7 - math.min(var_228_6, var_228_7) == 0 and arg_228_0.player:getTotalGem() < var_228_9 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_rmb"))

			return
		end

		arg_228_0:emit(LevelMediator2.ON_OP, {
			type = ChapterConst.OpRepair,
			id = var_228_0.fleet.id,
			arg1 = arg_228_1.id
		})
		arg_228_0:hideRepairWindow()
	end

	local function var_228_11()
		arg_228_0:hideRepairWindow()
	end

	arg_228_0.levelRepairView:ActionInvoke("setCBFunc", var_228_10, var_228_11)
end

function var_0_0.hideRepairWindow(arg_231_0)
	if arg_231_0.levelRepairView then
		arg_231_0.levelRepairView:Destroy()

		arg_231_0.levelRepairView = nil
	end
end

function var_0_0.displayRemasterPanel(arg_232_0, arg_232_1)
	arg_232_0.levelRemasterView:Load()

	local function var_232_0(arg_233_0)
		arg_232_0:ShowSelectedMap(arg_233_0)
	end

	arg_232_0.levelRemasterView:ActionInvoke("Show")
	arg_232_0.levelRemasterView:ActionInvoke("set", var_232_0, arg_232_1)
end

function var_0_0.hideRemasterPanel(arg_234_0)
	if arg_234_0.levelRemasterView:isShowing() then
		arg_234_0.levelRemasterView:ActionInvoke("Hide")
	end
end

function var_0_0.initGrid(arg_235_0, arg_235_1)
	local var_235_0 = arg_235_0.contextData.chapterVO

	if not var_235_0 then
		return
	end

	arg_235_0:enableLevelCamera()
	setActive(arg_235_0.uiMain, true)

	arg_235_0.levelGrid.localEulerAngles = Vector3(var_235_0.theme.angle, 0, 0)
	arg_235_0.grid = LevelGrid.New(arg_235_0.dragLayer)

	arg_235_0.grid:attach(arg_235_0)
	arg_235_0.grid:ExtendItem("shipTpl", arg_235_0.shipTpl)
	arg_235_0.grid:ExtendItem("subTpl", arg_235_0.subTpl)
	arg_235_0.grid:ExtendItem("transportTpl", arg_235_0.transportTpl)
	arg_235_0.grid:ExtendItem("enemyTpl", arg_235_0.enemyTpl)
	arg_235_0.grid:ExtendItem("championTpl", arg_235_0.championTpl)
	arg_235_0.grid:ExtendItem("oniTpl", arg_235_0.oniTpl)
	arg_235_0.grid:ExtendItem("arrowTpl", arg_235_0.arrowTarget)
	arg_235_0.grid:ExtendItem("destinationMarkTpl", arg_235_0.destinationMarkTpl)

	function arg_235_0.grid.onShipStepChange(arg_236_0)
		arg_235_0.levelStageView:updateAmbushRate(arg_236_0)
	end

	arg_235_0.grid:initAll(arg_235_1)
end

function var_0_0.destroyGrid(arg_237_0)
	if arg_237_0.grid then
		arg_237_0.grid:detach()

		arg_237_0.grid = nil

		arg_237_0:disableLevelCamera()
		setActive(arg_237_0.dragLayer, true)
		setActive(arg_237_0.uiMain, false)
	end
end

function var_0_0.doTracking(arg_238_0, arg_238_1)
	arg_238_0:frozen()

	local function var_238_0()
		arg_238_0.radar:SetActive(true)

		local var_239_0 = tf(arg_238_0.radar)

		var_239_0:SetParent(arg_238_0.topPanel, false)
		var_239_0:SetSiblingIndex(1)
		var_239_0:GetComponent("DftAniEvent"):SetEndEvent(function(arg_240_0)
			arg_238_0.radar:SetActive(false)
			arg_238_0:unfrozen()
			arg_238_1()
		end)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WEIGHANCHOR_SEARCH)
	end

	if not arg_238_0.radar then
		PoolMgr.GetInstance():GetUI("RadarEffectUI", true, function(arg_241_0)
			arg_241_0:SetActive(true)

			arg_238_0.radar = arg_241_0

			var_238_0()
		end)
	else
		var_238_0()
	end
end

function var_0_0.destroyTracking(arg_242_0)
	if arg_242_0.radar then
		PoolMgr.GetInstance():ReturnUI("RadarEffectUI", arg_242_0.radar)

		arg_242_0.radar = nil
	end
end

function var_0_0.doPlayAirStrike(arg_243_0, arg_243_1, arg_243_2, arg_243_3)
	local function var_243_0()
		arg_243_0.playing = true

		arg_243_0:frozen()
		arg_243_0.airStrike:SetActive(true)

		local var_244_0 = tf(arg_243_0.airStrike)

		var_244_0:SetParent(pg.UIMgr.GetInstance().OverlayMain.transform, false)
		var_244_0:SetAsLastSibling()
		setActive(var_244_0:Find("words/be_striked"), arg_243_1 == ChapterConst.SubjectChampion)
		setActive(var_244_0:Find("words/strike_enemy"), arg_243_1 == ChapterConst.SubjectPlayer)

		local function var_244_1()
			arg_243_0.playing = false

			SetActive(arg_243_0.airStrike, false)

			if arg_243_3 then
				arg_243_3()
			end

			arg_243_0:unfrozen()
		end

		var_244_0:GetComponent("DftAniEvent"):SetEndEvent(var_244_1)

		if arg_243_2 then
			onButton(arg_243_0, var_244_0, var_244_1, SFX_PANEL)
		else
			removeOnButton(var_244_0)
		end

		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
	end

	if not arg_243_0.airStrike then
		PoolMgr.GetInstance():GetUI("AirStrike", true, function(arg_246_0)
			arg_246_0:SetActive(true)

			arg_243_0.airStrike = arg_246_0

			var_243_0()
		end)
	else
		var_243_0()
	end
end

function var_0_0.destroyAirStrike(arg_247_0)
	if arg_247_0.airStrike then
		arg_247_0.airStrike:GetComponent("DftAniEvent"):SetEndEvent(nil)
		PoolMgr.GetInstance():ReturnUI("AirStrike", arg_247_0.airStrike)

		arg_247_0.airStrike = nil
	end
end

function var_0_0.doPlayAnim(arg_248_0, arg_248_1, arg_248_2, arg_248_3)
	arg_248_0.uiAnims = arg_248_0.uiAnims or {}

	local var_248_0 = arg_248_0.uiAnims[arg_248_1]

	local function var_248_1()
		arg_248_0.playing = true

		arg_248_0:frozen()
		var_248_0:SetActive(true)

		local var_249_0 = tf(var_248_0)

		pg.UIMgr.GetInstance():OverlayPanel(var_249_0, {
			groupName = LayerWeightConst.GROUP_LEVELUI
		})

		if arg_248_3 then
			arg_248_3(var_248_0)
		end

		var_249_0:GetComponent("DftAniEvent"):SetEndEvent(function(arg_250_0)
			arg_248_0.playing = false

			pg.UIMgr.GetInstance():UnOverlayPanel(var_249_0, arg_248_0._tf)

			if arg_248_2 then
				arg_248_2(var_248_0)
			end

			arg_248_0:unfrozen()
		end)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
	end

	if not var_248_0 then
		PoolMgr.GetInstance():GetUI(arg_248_1, true, function(arg_251_0)
			arg_251_0:SetActive(true)

			arg_248_0.uiAnims[arg_248_1] = arg_251_0
			var_248_0 = arg_248_0.uiAnims[arg_248_1]

			var_248_1()
		end)
	else
		var_248_1()
	end
end

function var_0_0.destroyUIAnims(arg_252_0)
	if arg_252_0.uiAnims then
		for iter_252_0, iter_252_1 in pairs(arg_252_0.uiAnims) do
			pg.UIMgr.GetInstance():UnOverlayPanel(tf(iter_252_1), arg_252_0._tf)
			iter_252_1:GetComponent("DftAniEvent"):SetEndEvent(nil)
			PoolMgr.GetInstance():ReturnUI(iter_252_0, iter_252_1)
		end

		arg_252_0.uiAnims = nil
	end
end

function var_0_0.doPlayTorpedo(arg_253_0, arg_253_1)
	local function var_253_0()
		arg_253_0.playing = true

		arg_253_0:frozen()
		arg_253_0.torpetoAni:SetActive(true)

		local var_254_0 = tf(arg_253_0.torpetoAni)

		var_254_0:SetParent(arg_253_0.topPanel, false)
		var_254_0:SetAsLastSibling()
		var_254_0:GetComponent("DftAniEvent"):SetEndEvent(function(arg_255_0)
			arg_253_0.playing = false

			SetActive(arg_253_0.torpetoAni, false)

			if arg_253_1 then
				arg_253_1()
			end

			arg_253_0:unfrozen()
		end)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
	end

	if not arg_253_0.torpetoAni then
		PoolMgr.GetInstance():GetUI("Torpeto", true, function(arg_256_0)
			arg_256_0:SetActive(true)

			arg_253_0.torpetoAni = arg_256_0

			var_253_0()
		end)
	else
		var_253_0()
	end
end

function var_0_0.destroyTorpedo(arg_257_0)
	if arg_257_0.torpetoAni then
		arg_257_0.torpetoAni:GetComponent("DftAniEvent"):SetEndEvent(nil)
		PoolMgr.GetInstance():ReturnUI("Torpeto", arg_257_0.torpetoAni)

		arg_257_0.torpetoAni = nil
	end
end

function var_0_0.doPlayStrikeAnim(arg_258_0, arg_258_1, arg_258_2, arg_258_3)
	arg_258_0.strikeAnims = arg_258_0.strikeAnims or {}

	local var_258_0
	local var_258_1
	local var_258_2

	local function var_258_3()
		if coroutine.status(var_258_2) == "suspended" then
			local var_259_0, var_259_1 = coroutine.resume(var_258_2)

			assert(var_259_0, debug.traceback(var_258_2, var_259_1))
		end
	end

	var_258_2 = coroutine.create(function()
		arg_258_0.playing = true

		arg_258_0:frozen()

		local var_260_0 = arg_258_0.strikeAnims[arg_258_2]

		setActive(var_260_0, true)

		local var_260_1 = tf(var_260_0)
		local var_260_2 = findTF(var_260_1, "torpedo")
		local var_260_3 = findTF(var_260_1, "mask/painting")
		local var_260_4 = findTF(var_260_1, "ship")

		setParent(var_258_0, var_260_3:Find("fitter"), false)
		setParent(var_258_1, var_260_4, false)
		setActive(var_260_4, false)
		setActive(var_260_2, false)
		var_260_1:SetParent(pg.UIMgr.GetInstance().OverlayMain.transform, false)
		var_260_1:SetAsLastSibling()

		local var_260_5 = var_260_1:GetComponent("DftAniEvent")
		local var_260_6 = var_258_1:GetComponent("SpineAnimUI")
		local var_260_7 = var_260_6:GetComponent("SkeletonGraphic")

		var_260_5:SetStartEvent(function(arg_261_0)
			var_260_6:SetAction("attack", 0)

			var_260_7.freeze = true
		end)
		var_260_5:SetTriggerEvent(function(arg_262_0)
			var_260_7.freeze = false

			var_260_6:SetActionCallBack(function(arg_263_0)
				if arg_263_0 == "action" then
					-- block empty
				elseif arg_263_0 == "finish" then
					var_260_7.freeze = true
				end
			end)
		end)
		var_260_5:SetEndEvent(function(arg_264_0)
			var_260_7.freeze = false

			var_258_3()
		end)
		onButton(arg_258_0, var_260_1, var_258_3, SFX_CANCEL)
		coroutine.yield()
		retPaintingPrefab(var_260_3, arg_258_1:getPainting())
		var_260_6:SetActionCallBack(nil)

		var_260_7.freeze = false

		PoolMgr.GetInstance():ReturnSpineChar(arg_258_1:getPrefab(), var_258_1)
		setActive(var_260_0, false)

		arg_258_0.playing = false

		arg_258_0:unfrozen()

		if arg_258_3 then
			arg_258_3()
		end
	end)

	local function var_258_4()
		if arg_258_0.strikeAnims[arg_258_2] and var_258_0 and var_258_1 then
			var_258_3()
		end
	end

	PoolMgr.GetInstance():GetPainting(arg_258_1:getPainting(), true, function(arg_266_0)
		var_258_0 = arg_266_0

		ShipExpressionHelper.SetExpression(var_258_0, arg_258_1:getPainting())
		var_258_4()
	end)
	PoolMgr.GetInstance():GetSpineChar(arg_258_1:getPrefab(), true, function(arg_267_0)
		var_258_1 = arg_267_0
		var_258_1.transform.localScale = Vector3.one

		var_258_4()
	end)

	if not arg_258_0.strikeAnims[arg_258_2] then
		PoolMgr.GetInstance():GetUI(arg_258_2, true, function(arg_268_0)
			arg_258_0.strikeAnims[arg_258_2] = arg_268_0

			var_258_4()
		end)
	end
end

function var_0_0.destroyStrikeAnim(arg_269_0)
	if arg_269_0.strikeAnims then
		for iter_269_0, iter_269_1 in pairs(arg_269_0.strikeAnims) do
			iter_269_1:GetComponent("DftAniEvent"):SetEndEvent(nil)
			PoolMgr.GetInstance():ReturnUI(iter_269_0, iter_269_1)
		end

		arg_269_0.strikeAnims = nil
	end
end

function var_0_0.doPlayEnemyAnim(arg_270_0, arg_270_1, arg_270_2, arg_270_3)
	arg_270_0.strikeAnims = arg_270_0.strikeAnims or {}

	local var_270_0
	local var_270_1

	local function var_270_2()
		if coroutine.status(var_270_1) == "suspended" then
			local var_271_0, var_271_1 = coroutine.resume(var_270_1)

			assert(var_271_0, debug.traceback(var_270_1, var_271_1))
		end
	end

	var_270_1 = coroutine.create(function()
		arg_270_0.playing = true

		arg_270_0:frozen()

		local var_272_0 = arg_270_0.strikeAnims[arg_270_2]

		setActive(var_272_0, true)

		local var_272_1 = tf(var_272_0)
		local var_272_2 = findTF(var_272_1, "torpedo")
		local var_272_3 = findTF(var_272_1, "ship")

		setParent(var_270_0, var_272_3, false)
		setActive(var_272_3, false)
		setActive(var_272_2, false)
		var_272_1:SetParent(pg.UIMgr.GetInstance().OverlayMain.transform, false)
		var_272_1:SetAsLastSibling()

		local var_272_4 = var_272_1:GetComponent("DftAniEvent")
		local var_272_5 = var_270_0:GetComponent("SpineAnimUI")
		local var_272_6 = var_272_5:GetComponent("SkeletonGraphic")

		var_272_4:SetStartEvent(function(arg_273_0)
			var_272_5:SetAction("attack", 0)

			var_272_6.freeze = true
		end)
		var_272_4:SetTriggerEvent(function(arg_274_0)
			var_272_6.freeze = false

			var_272_5:SetActionCallBack(function(arg_275_0)
				if arg_275_0 == "action" then
					-- block empty
				elseif arg_275_0 == "finish" then
					var_272_6.freeze = true
				end
			end)
		end)
		var_272_4:SetEndEvent(function(arg_276_0)
			var_272_6.freeze = false

			var_270_2()
		end)
		onButton(arg_270_0, var_272_1, var_270_2, SFX_CANCEL)
		coroutine.yield()
		var_272_5:SetActionCallBack(nil)

		var_272_6.freeze = false

		PoolMgr.GetInstance():ReturnSpineChar(arg_270_1:getPrefab(), var_270_0)
		setActive(var_272_0, false)

		arg_270_0.playing = false

		arg_270_0:unfrozen()

		if arg_270_3 then
			arg_270_3()
		end
	end)

	local function var_270_3()
		if arg_270_0.strikeAnims[arg_270_2] and var_270_0 then
			var_270_2()
		end
	end

	PoolMgr.GetInstance():GetSpineChar(arg_270_1:getPrefab(), true, function(arg_278_0)
		var_270_0 = arg_278_0
		var_270_0.transform.localScale = Vector3.one

		var_270_3()
	end)

	if not arg_270_0.strikeAnims[arg_270_2] then
		PoolMgr.GetInstance():GetUI(arg_270_2, true, function(arg_279_0)
			arg_270_0.strikeAnims[arg_270_2] = arg_279_0

			var_270_3()
		end)
	end
end

function var_0_0.doPlayCommander(arg_280_0, arg_280_1, arg_280_2)
	arg_280_0:frozen()
	setActive(arg_280_0.commanderTinkle, true)

	local var_280_0 = arg_280_1:getSkills()

	setText(arg_280_0.commanderTinkle:Find("name"), #var_280_0 > 0 and var_280_0[1]:getConfig("name") or "")
	setImageSprite(arg_280_0.commanderTinkle:Find("icon"), GetSpriteFromAtlas("commanderhrz/" .. arg_280_1:getConfig("painting"), ""))

	local var_280_1 = arg_280_0.commanderTinkle:GetComponent(typeof(CanvasGroup))

	var_280_1.alpha = 0

	local var_280_2 = Vector2(248, 237)

	LeanTween.value(go(arg_280_0.commanderTinkle), 0, 1, 0.5):setOnUpdate(System.Action_float(function(arg_281_0)
		local var_281_0 = arg_280_0.commanderTinkle.localPosition

		var_281_0.x = var_280_2.x + -100 * (1 - arg_281_0)
		arg_280_0.commanderTinkle.localPosition = var_281_0
		var_280_1.alpha = arg_281_0
	end)):setEase(LeanTweenType.easeOutSine)
	LeanTween.value(go(arg_280_0.commanderTinkle), 0, 1, 0.3):setDelay(0.7):setOnUpdate(System.Action_float(function(arg_282_0)
		local var_282_0 = arg_280_0.commanderTinkle.localPosition

		var_282_0.x = var_280_2.x + 100 * arg_282_0
		arg_280_0.commanderTinkle.localPosition = var_282_0
		var_280_1.alpha = 1 - arg_282_0
	end)):setOnComplete(System.Action(function()
		if arg_280_2 then
			arg_280_2()
		end

		arg_280_0:unfrozen()
	end))
end

function var_0_0.strikeEnemy(arg_284_0, arg_284_1, arg_284_2, arg_284_3)
	local var_284_0 = arg_284_0.grid:shakeCell(arg_284_1)

	if not var_284_0 then
		arg_284_3()

		return
	end

	arg_284_0:easeDamage(var_284_0, arg_284_2, function()
		arg_284_3()
	end)
end

function var_0_0.easeDamage(arg_286_0, arg_286_1, arg_286_2, arg_286_3)
	arg_286_0:frozen()

	local var_286_0 = arg_286_0.levelCam:WorldToScreenPoint(arg_286_1.position)
	local var_286_1 = tf(arg_286_0:GetDamageText())

	var_286_1.position = arg_286_0.uiCam:ScreenToWorldPoint(var_286_0)

	local var_286_2 = var_286_1.localPosition

	var_286_2.y = var_286_2.y + 40
	var_286_2.z = 0

	setText(var_286_1, arg_286_2)

	var_286_1.localPosition = var_286_2

	LeanTween.value(go(var_286_1), 0, 1, 1):setOnUpdate(System.Action_float(function(arg_287_0)
		local var_287_0 = var_286_1.localPosition

		var_287_0.y = var_286_2.y + 60 * arg_287_0
		var_286_1.localPosition = var_287_0

		setTextAlpha(var_286_1, 1 - arg_287_0)
	end)):setOnComplete(System.Action(function()
		arg_286_0:ReturnDamageText(var_286_1)
		arg_286_0:unfrozen()

		if arg_286_3 then
			arg_286_3()
		end
	end))
end

function var_0_0.easeAvoid(arg_289_0, arg_289_1, arg_289_2)
	arg_289_0:frozen()

	local var_289_0 = arg_289_0.levelCam:WorldToScreenPoint(arg_289_1)

	arg_289_0.avoidText.position = arg_289_0.uiCam:ScreenToWorldPoint(var_289_0)

	local var_289_1 = arg_289_0.avoidText.localPosition

	var_289_1.z = 0
	arg_289_0.avoidText.localPosition = var_289_1

	setActive(arg_289_0.avoidText, true)

	local var_289_2 = arg_289_0.avoidText:Find("avoid")

	LeanTween.value(go(arg_289_0.avoidText), 0, 1, 1):setOnUpdate(System.Action_float(function(arg_290_0)
		local var_290_0 = arg_289_0.avoidText.localPosition

		var_290_0.y = var_289_1.y + 100 * arg_290_0
		arg_289_0.avoidText.localPosition = var_290_0

		setImageAlpha(arg_289_0.avoidText, 1 - arg_290_0)
		setImageAlpha(var_289_2, 1 - arg_290_0)
	end)):setOnComplete(System.Action(function()
		setActive(arg_289_0.avoidText, false)
		arg_289_0:unfrozen()

		if arg_289_2 then
			arg_289_2()
		end
	end))
end

function var_0_0.GetDamageText(arg_292_0)
	local var_292_0 = table.remove(arg_292_0.damageTextPool)

	if not var_292_0 then
		var_292_0 = Instantiate(arg_292_0.damageTextTemplate)

		local var_292_1 = tf(arg_292_0.damageTextTemplate):GetSiblingIndex()

		setParent(var_292_0, tf(arg_292_0.damageTextTemplate).parent)
		tf(var_292_0):SetSiblingIndex(var_292_1 + 1)
	end

	table.insert(arg_292_0.damageTextActive, var_292_0)
	setActive(var_292_0, true)

	return var_292_0
end

function var_0_0.ReturnDamageText(arg_293_0, arg_293_1)
	assert(arg_293_1)

	if not arg_293_1 then
		return
	end

	arg_293_1 = go(arg_293_1)

	table.removebyvalue(arg_293_0.damageTextActive, arg_293_1)
	table.insert(arg_293_0.damageTextPool, arg_293_1)
	setActive(arg_293_1, false)
end

function var_0_0.resetLevelGrid(arg_294_0)
	arg_294_0.dragLayer.localPosition = Vector3.zero
end

function var_0_0.ShowCurtains(arg_295_0, arg_295_1)
	setActive(arg_295_0.curtain, arg_295_1)
end

function var_0_0.frozen(arg_296_0)
	local var_296_0 = arg_296_0.frozenCount

	arg_296_0.frozenCount = arg_296_0.frozenCount + 1
	arg_296_0.canvasGroup.blocksRaycasts = arg_296_0.frozenCount == 0

	if var_296_0 == 0 and arg_296_0.frozenCount ~= 0 then
		arg_296_0:emit(LevelUIConst.ON_FROZEN)
	end
end

function var_0_0.unfrozen(arg_297_0, arg_297_1)
	if arg_297_0.exited then
		return
	end

	local var_297_0 = arg_297_0.frozenCount
	local var_297_1 = arg_297_1 == -1 and arg_297_0.frozenCount or arg_297_1 or 1

	arg_297_0.frozenCount = arg_297_0.frozenCount - var_297_1
	arg_297_0.canvasGroup.blocksRaycasts = arg_297_0.frozenCount == 0

	if var_297_0 ~= 0 and arg_297_0.frozenCount == 0 then
		arg_297_0:emit(LevelUIConst.ON_UNFROZEN)
	end
end

function var_0_0.isfrozen(arg_298_0)
	return arg_298_0.frozenCount > 0
end

function var_0_0.enableLevelCamera(arg_299_0)
	arg_299_0.levelCamIndices = math.max(arg_299_0.levelCamIndices - 1, 0)

	if arg_299_0.levelCamIndices == 0 then
		arg_299_0.levelCam.enabled = true

		pg.LayerWeightMgr.GetInstance():switchOriginParent()
	end
end

function var_0_0.disableLevelCamera(arg_300_0)
	arg_300_0.levelCamIndices = arg_300_0.levelCamIndices + 1

	if arg_300_0.levelCamIndices > 0 then
		arg_300_0.levelCam.enabled = false

		pg.LayerWeightMgr.GetInstance():switchOriginParent()
	end
end

function var_0_0.RecordTween(arg_301_0, arg_301_1, arg_301_2)
	arg_301_0.tweens[arg_301_1] = arg_301_2
end

function var_0_0.DeleteTween(arg_302_0, arg_302_1)
	local var_302_0 = arg_302_0.tweens[arg_302_1]

	if var_302_0 then
		LeanTween.cancel(var_302_0)

		arg_302_0.tweens[arg_302_1] = nil
	end
end

function var_0_0.openCommanderPanel(arg_303_0, arg_303_1, arg_303_2, arg_303_3)
	local var_303_0 = arg_303_2.id

	arg_303_0.levelCMDFormationView:setCallback(function(arg_304_0)
		if not arg_303_3 then
			if arg_304_0.type == LevelUIConst.COMMANDER_OP_SHOW_SKILL then
				arg_303_0:emit(LevelMediator2.ON_COMMANDER_SKILL, arg_304_0.skill)
			elseif arg_304_0.type == LevelUIConst.COMMANDER_OP_ADD then
				arg_303_0.contextData.commanderSelected = {
					chapterId = var_303_0,
					fleetId = arg_303_1.id
				}

				arg_303_0:emit(LevelMediator2.ON_SELECT_COMMANDER, arg_304_0.pos, arg_303_1.id, arg_303_2)
				arg_303_0:closeCommanderPanel()
			else
				arg_303_0:emit(LevelMediator2.ON_COMMANDER_OP, {
					FleetType = LevelUIConst.FLEET_TYPE_SELECT,
					data = arg_304_0,
					fleetId = arg_303_1.id,
					chapterId = var_303_0
				}, arg_303_2)
			end
		elseif arg_304_0.type == LevelUIConst.COMMANDER_OP_SHOW_SKILL then
			arg_303_0:emit(LevelMediator2.ON_COMMANDER_SKILL, arg_304_0.skill)
		elseif arg_304_0.type == LevelUIConst.COMMANDER_OP_ADD then
			arg_303_0.contextData.eliteCommanderSelected = {
				index = arg_303_3,
				pos = arg_304_0.pos,
				chapterId = var_303_0
			}

			arg_303_0:emit(LevelMediator2.ON_SELECT_ELITE_COMMANDER, arg_303_3, arg_304_0.pos, arg_303_2)
			arg_303_0:closeCommanderPanel()
		else
			arg_303_0:emit(LevelMediator2.ON_COMMANDER_OP, {
				FleetType = LevelUIConst.FLEET_TYPE_EDIT,
				data = arg_304_0,
				index = arg_303_3,
				chapterId = var_303_0
			}, arg_303_2)
		end
	end)
	arg_303_0.levelCMDFormationView:Load()
	arg_303_0.levelCMDFormationView:ActionInvoke("update", arg_303_1, arg_303_0.commanderPrefabs)
	arg_303_0.levelCMDFormationView:ActionInvoke("Show")
end

function var_0_0.updateCommanderPrefab(arg_305_0)
	if arg_305_0.levelCMDFormationView:isShowing() then
		arg_305_0.levelCMDFormationView:ActionInvoke("updatePrefabs", arg_305_0.commanderPrefabs)
	end
end

function var_0_0.closeCommanderPanel(arg_306_0)
	arg_306_0.levelCMDFormationView:ActionInvoke("Hide")
end

function var_0_0.destroyCommanderPanel(arg_307_0)
	arg_307_0.levelCMDFormationView:Destroy()

	arg_307_0.levelCMDFormationView = nil
end

function var_0_0.setSpecialOperationTickets(arg_308_0, arg_308_1)
	arg_308_0.spTickets = arg_308_1
end

function var_0_0.HandleShowMsgBox(arg_309_0, arg_309_1)
	pg.MsgboxMgr.GetInstance():ShowMsgBox(arg_309_1)
end

function var_0_0.updatePoisonAreaTip(arg_310_0)
	local var_310_0 = arg_310_0.contextData.chapterVO
	local var_310_1 = (function(arg_311_0)
		local var_311_0 = {}
		local var_311_1 = pg.map_event_list[var_310_0.id] or {}
		local var_311_2

		if var_310_0:isLoop() then
			var_311_2 = var_311_1.event_list_loop or {}
		else
			var_311_2 = var_311_1.event_list or {}
		end

		for iter_311_0, iter_311_1 in ipairs(var_311_2) do
			local var_311_3 = pg.map_event_template[iter_311_1]

			if var_311_3.c_type == arg_311_0 then
				table.insert(var_311_0, var_311_3)
			end
		end

		return var_311_0
	end)(ChapterConst.EvtType_Poison)

	if var_310_1 then
		for iter_310_0, iter_310_1 in ipairs(var_310_1) do
			local var_310_2 = iter_310_1.round_gametip

			if var_310_2 ~= nil and var_310_2 ~= "" and var_310_0:getRoundNum() == var_310_2[1] then
				pg.TipsMgr.GetInstance():ShowTips(i18n(var_310_2[2]))
			end
		end
	end
end

function var_0_0.updateVoteBookBtn(arg_312_0)
	setActive(arg_312_0._voteBookBtn, false)
end

function var_0_0.RecordLastMapOnExit(arg_313_0)
	local var_313_0 = getProxy(ChapterProxy)

	if var_313_0 and not arg_313_0.contextData.noRecord then
		local var_313_1 = arg_313_0.contextData.map

		if not var_313_1 then
			return
		end

		if var_313_1:NeedRecordMap() then
			var_313_0:recordLastMap(ChapterProxy.LAST_MAP, var_313_1.id)
		end

		if var_313_1:isActivity() and not var_313_1:isActExtra() then
			var_313_0:recordLastMap(ChapterProxy.LAST_MAP_FOR_ACTIVITY, var_313_1.id)
		end
	end
end

function var_0_0.IsActShopActive(arg_314_0)
	local var_314_0 = pg.gameset.activity_res_id.key_value
	local var_314_1 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_LOTTERY)

	if var_314_1 and not var_314_1:isEnd() and var_314_1:getConfig("config_client").resId == var_314_0 then
		return true
	end

	if _.detect(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_SHOP), function(arg_315_0)
		return not arg_315_0:isEnd() and arg_315_0:getConfig("config_client").pt_id == var_314_0
	end) then
		return true
	end
end

function var_0_0.willExit(arg_316_0)
	arg_316_0:ClearMapTransitions()
	arg_316_0.loader:Clear()

	if arg_316_0.contextData.chapterVO then
		pg.UIMgr.GetInstance():UnblurPanel(arg_316_0.topPanel, arg_316_0._tf)
		pg.playerResUI:SetActive({
			active = false
		})
	end

	if arg_316_0.levelFleetView and arg_316_0.levelFleetView.selectIds then
		arg_316_0.contextData.selectedFleetIDs = {}

		for iter_316_0, iter_316_1 in pairs(arg_316_0.levelFleetView.selectIds) do
			for iter_316_2, iter_316_3 in pairs(iter_316_1) do
				arg_316_0.contextData.selectedFleetIDs[#arg_316_0.contextData.selectedFleetIDs + 1] = iter_316_3
			end
		end
	end

	arg_316_0:destroyChapterPanel()
	arg_316_0:DestroyLevelInfoSPPanel()
	arg_316_0:destroyFleetEdit()
	arg_316_0:destroyCommanderPanel()
	arg_316_0:DestroyLevelStageView()
	arg_316_0:hideRepairWindow()
	arg_316_0:hideStrategyInfo()
	arg_316_0:hideRemasterPanel()
	arg_316_0:hideSpResult()
	arg_316_0:destroyGrid()
	arg_316_0:destroyAmbushWarn()
	arg_316_0:destroyAirStrike()
	arg_316_0:destroyTorpedo()
	arg_316_0:destroyStrikeAnim()
	arg_316_0:destroyTracking()
	arg_316_0:destroyUIAnims()
	PoolMgr.GetInstance():DestroyPrefab("chapter/cell_quad_mark", "")
	PoolMgr.GetInstance():DestroyPrefab("chapter/cell_quad", "")
	PoolMgr.GetInstance():DestroyPrefab("chapter/cell", "")
	PoolMgr.GetInstance():DestroyPrefab("chapter/plane", "")

	for iter_316_4, iter_316_5 in pairs(arg_316_0.mbDict) do
		iter_316_5:Destroy()
	end

	arg_316_0.mbDict = nil

	for iter_316_6, iter_316_7 in pairs(arg_316_0.tweens) do
		LeanTween.cancel(iter_316_7)
	end

	arg_316_0.tweens = nil

	if arg_316_0.cloudTimer then
		_.each(arg_316_0.cloudTimer, function(arg_317_0)
			LeanTween.cancel(arg_317_0)
		end)

		arg_316_0.cloudTimer = nil
	end

	if arg_316_0.newChapterCDTimer then
		arg_316_0.newChapterCDTimer:Stop()

		arg_316_0.newChapterCDTimer = nil
	end

	for iter_316_8, iter_316_9 in ipairs(arg_316_0.damageTextActive) do
		LeanTween.cancel(iter_316_9)
	end

	LeanTween.cancel(go(arg_316_0.avoidText))

	arg_316_0.map.localScale = Vector3.one
	arg_316_0.map.pivot = Vector2(0.5, 0.5)
	arg_316_0.float.localScale = Vector3.one
	arg_316_0.float.pivot = Vector2(0.5, 0.5)

	for iter_316_10, iter_316_11 in ipairs(arg_316_0.mapTFs) do
		clearImageSprite(iter_316_11)
	end

	_.each(arg_316_0.cloudRTFs, function(arg_318_0)
		clearImageSprite(arg_318_0)
	end)
	Destroy(arg_316_0.enemyTpl)
	arg_316_0:RecordLastMapOnExit()
	arg_316_0.levelRemasterView:Destroy()
end

return var_0_0
