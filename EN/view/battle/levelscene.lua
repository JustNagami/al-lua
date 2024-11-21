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

function var_0_0.setShips(arg_64_0, arg_64_1)
	arg_64_0.shipVOs = arg_64_1
end

function var_0_0.updateRes(arg_65_0, arg_65_1)
	if arg_65_0.levelStageView then
		arg_65_0.levelStageView:ActionInvoke("SetPlayer", arg_65_1)
	end

	arg_65_0.player = arg_65_1
end

function var_0_0.setEliteQuota(arg_66_0, arg_66_1, arg_66_2)
	local var_66_0 = arg_66_2 - arg_66_1
	local var_66_1 = arg_66_0:findTF("bg/Text", arg_66_0.eliteQuota):GetComponent(typeof(Text))

	if arg_66_1 == arg_66_2 then
		var_66_1.color = Color.red
	else
		var_66_1.color = Color.New(0.47, 0.89, 0.27)
	end

	var_66_1.text = var_66_0 .. "/" .. arg_66_2
end

function var_0_0.updateEvent(arg_67_0, arg_67_1)
	local var_67_0 = arg_67_1:hasFinishState()

	setActive(arg_67_0.btnSpecial:Find("tip"), var_67_0)
	setActive(arg_67_0.entranceLayer:Find("btns/btn_task/tip"), var_67_0)
end

function var_0_0.updateFleet(arg_68_0, arg_68_1)
	arg_68_0.fleets = arg_68_1
end

function var_0_0.updateChapterVO(arg_69_0, arg_69_1, arg_69_2)
	if arg_69_0.contextData.chapterVO and arg_69_0.contextData.chapterVO.id == arg_69_1.id and arg_69_1.active then
		arg_69_0:setChapter(arg_69_1)
	end

	if arg_69_0.contextData.chapterVO and arg_69_0.contextData.chapterVO.id == arg_69_1.id and arg_69_1.active and arg_69_0.levelStageView and arg_69_0.grid then
		local var_69_0 = false
		local var_69_1 = false
		local var_69_2 = false

		if arg_69_2 < 0 or bit.band(arg_69_2, ChapterConst.DirtyFleet) > 0 then
			arg_69_0.levelStageView:updateStageFleet()
			arg_69_0.levelStageView:updateAmbushRate(arg_69_1.fleet.line, true)

			var_69_2 = true

			if arg_69_0.grid then
				arg_69_0.grid:RefreshFleetCells()
				arg_69_0.grid:UpdateFloor()

				var_69_0 = true
			end
		end

		if arg_69_2 < 0 or bit.band(arg_69_2, ChapterConst.DirtyChampion) > 0 then
			var_69_2 = true

			if arg_69_0.grid then
				arg_69_0.grid:UpdateFleets()
				arg_69_0.grid:clearChampions()
				arg_69_0.grid:initChampions()

				var_69_1 = true
			end
		elseif bit.band(arg_69_2, ChapterConst.DirtyChampionPosition) > 0 then
			var_69_2 = true

			if arg_69_0.grid then
				arg_69_0.grid:UpdateFleets()
				arg_69_0.grid:updateChampions()

				var_69_1 = true
			end
		end

		if arg_69_2 < 0 or bit.band(arg_69_2, ChapterConst.DirtyAchieve) > 0 then
			arg_69_0.levelStageView:updateStageAchieve()
		end

		if arg_69_2 < 0 or bit.band(arg_69_2, ChapterConst.DirtyAttachment) > 0 then
			arg_69_0.levelStageView:updateAmbushRate(arg_69_1.fleet.line, true)

			if arg_69_0.grid then
				if not (arg_69_2 < 0) and not (bit.band(arg_69_2, ChapterConst.DirtyFleet) > 0) then
					arg_69_0.grid:updateFleet(arg_69_1.fleets[arg_69_1.findex].id)
				end

				arg_69_0.grid:updateAttachments()

				if arg_69_2 < 0 or bit.band(arg_69_2, ChapterConst.DirtyAutoAction) > 0 then
					arg_69_0.grid:updateQuadCells(ChapterConst.QuadStateNormal)
				else
					var_69_0 = true
				end
			end
		end

		if arg_69_2 < 0 or bit.band(arg_69_2, ChapterConst.DirtyStrategy) > 0 then
			arg_69_0.levelStageView:updateStageStrategy()

			var_69_2 = true

			arg_69_0.levelStageView:updateStageBarrier()
			arg_69_0.levelStageView:UpdateAutoFightPanel()
		end

		if arg_69_2 < 0 or bit.band(arg_69_2, ChapterConst.DirtyAutoAction) > 0 then
			-- block empty
		elseif var_69_0 then
			arg_69_0.grid:updateQuadCells(ChapterConst.QuadStateNormal)
		elseif var_69_1 then
			arg_69_0.grid:updateQuadCells(ChapterConst.QuadStateFrozen)
		end

		if arg_69_2 < 0 or bit.band(arg_69_2, ChapterConst.DirtyCellFlag) > 0 then
			arg_69_0.grid:UpdateFloor()
		end

		if arg_69_2 < 0 or bit.band(arg_69_2, ChapterConst.DirtyBase) > 0 then
			arg_69_0.levelStageView:UpdateDefenseStatus()
		end

		if arg_69_2 < 0 or bit.band(arg_69_2, ChapterConst.DirtyFloatItems) > 0 then
			arg_69_0.grid:UpdateItemCells()
		end

		if var_69_2 then
			arg_69_0.levelStageView:updateFleetBuff()
		end
	end
end

function var_0_0.updateClouds(arg_70_0)
	arg_70_0.cloudRTFs = {}
	arg_70_0.cloudRects = {}
	arg_70_0.cloudTimer = {}

	for iter_70_0 = 1, 6 do
		local var_70_0 = arg_70_0:findTF("cloud_" .. iter_70_0, arg_70_0.clouds)
		local var_70_1 = rtf(var_70_0)

		table.insert(arg_70_0.cloudRTFs, var_70_1)
		table.insert(arg_70_0.cloudRects, var_70_1.rect.width)
	end

	arg_70_0:initCloudsPos()

	for iter_70_1, iter_70_2 in ipairs(arg_70_0.cloudRTFs) do
		local var_70_2 = arg_70_0.cloudRects[iter_70_1]
		local var_70_3 = arg_70_0.initPositions[iter_70_1] or Vector2(0, 0)
		local var_70_4 = 30 - var_70_3.y / 20
		local var_70_5 = (arg_70_0.mapWidth + var_70_2) / var_70_4
		local var_70_6

		var_70_6 = LeanTween.moveX(iter_70_2, arg_70_0.mapWidth, var_70_5):setRepeat(-1):setOnCompleteOnRepeat(true):setOnComplete(System.Action(function()
			var_70_2 = arg_70_0.cloudRects[iter_70_1]
			iter_70_2.anchoredPosition = Vector2(-var_70_2, var_70_3.y)

			var_70_6:setFrom(-var_70_2):setTime((arg_70_0.mapWidth + var_70_2) / var_70_4)
		end))
		var_70_6.passed = math.random() * var_70_5
		arg_70_0.cloudTimer[iter_70_1] = var_70_6.uniqueId
	end
end

function var_0_0.RefreshMapBG(arg_72_0)
	arg_72_0:PlayBGM()
	arg_72_0:SwitchMapBG(arg_72_0.contextData.map, nil, true)
end

function var_0_0.updateCouldAnimator(arg_73_0, arg_73_1, arg_73_2)
	if not arg_73_1 then
		return
	end

	local var_73_0 = arg_73_0.contextData.map:getConfig("ani_controller")

	local function var_73_1(arg_74_0)
		arg_74_0 = tf(arg_74_0)

		local var_74_0 = Vector3.one

		if arg_74_0.rect.width > 0 and arg_74_0.rect.height > 0 then
			var_74_0.x = arg_74_0.parent.rect.width / arg_74_0.rect.width
			var_74_0.y = arg_74_0.parent.rect.height / arg_74_0.rect.height
		end

		arg_74_0.localScale = var_74_0

		if var_73_0 and #var_73_0 > 0 then
			(function()
				for iter_75_0, iter_75_1 in ipairs(var_73_0) do
					if iter_75_1[1] == var_0_2 then
						local var_75_0 = iter_75_1[2][1]
						local var_75_1 = _.rest(iter_75_1[2], 2)

						for iter_75_2, iter_75_3 in ipairs(var_75_1) do
							local var_75_2 = arg_74_0:Find(iter_75_3)

							if not IsNil(var_75_2) then
								local var_75_3 = getProxy(ChapterProxy):GetChapterItemById(var_75_0)

								if var_75_3 and not var_75_3:isClear() then
									setActive(var_75_2, false)
								end
							end
						end
					elseif iter_75_1[1] == var_0_3 then
						local var_75_4 = iter_75_1[2][1]
						local var_75_5 = _.rest(iter_75_1[2], 2)

						for iter_75_4, iter_75_5 in ipairs(var_75_5) do
							local var_75_6 = arg_74_0:Find(iter_75_5)

							if not IsNil(var_75_6) then
								local var_75_7 = getProxy(ChapterProxy):GetChapterItemById(var_75_4)

								if var_75_7 and not var_75_7:isClear() then
									setActive(var_75_6, true)

									return
								end
							end
						end
					elseif iter_75_1[1] == var_0_4 then
						local var_75_8 = iter_75_1[2][1]
						local var_75_9 = _.rest(iter_75_1[2], 2)

						for iter_75_6, iter_75_7 in ipairs(var_75_9) do
							local var_75_10 = arg_74_0:Find(iter_75_7)

							if not IsNil(var_75_10) then
								local var_75_11 = getProxy(ChapterProxy):GetChapterItemById(var_75_8)

								if var_75_11 and not var_75_11:isClear() then
									setActive(var_75_10, true)
								end
							end
						end
					end
				end
			end)()
		end
	end

	local var_73_2 = arg_73_0.loader:GetPrefab("ui/" .. arg_73_1, arg_73_1, function(arg_76_0)
		arg_76_0:SetActive(true)

		local var_76_0 = arg_73_0.mapTFs[arg_73_2]

		setParent(arg_76_0, var_76_0)
		pg.ViewUtils.SetSortingOrder(arg_76_0, ChapterConst.LayerWeightMap + arg_73_2 * 2 - 1)
		var_73_1(arg_76_0)
	end)

	table.insert(arg_73_0.mapGroup, var_73_2)
end

function var_0_0.HideBtns(arg_77_0)
	setActive(arg_77_0.btnPrev, false)
	setActive(arg_77_0.eliteQuota, false)
	setActive(arg_77_0.escortBar, false)
	setActive(arg_77_0.skirmishBar, false)
	setActive(arg_77_0.normalBtn, false)
	setActive(arg_77_0.actNormalBtn, false)
	setActive(arg_77_0.eliteBtn, false)
	setActive(arg_77_0.actEliteBtn, false)
	setActive(arg_77_0.actExtraBtn, false)
	setActive(arg_77_0.remasterBtn, false)
	setActive(arg_77_0.btnNext, false)
	setActive(arg_77_0.remasterAwardBtn, false)
	setActive(arg_77_0.eventContainer, false)
	setActive(arg_77_0.activityBtn, false)
	setActive(arg_77_0.ptTotal, false)
	setActive(arg_77_0.ticketTxt.parent, false)
	setActive(arg_77_0.countDown, false)
	setActive(arg_77_0.actAtelierBuffBtn, false)
	setActive(arg_77_0.actExtraRank, false)
	setActive(arg_77_0.actExchangeShopBtn, false)
	setActive(arg_77_0.mapHelpBtn, false)
end

function var_0_0.updateDifficultyBtns(arg_78_0)
	local var_78_0 = arg_78_0.contextData.map:getConfig("type")

	setActive(arg_78_0.normalBtn, var_78_0 == Map.ELITE)
	setActive(arg_78_0.eliteQuota, var_78_0 == Map.ELITE)
	setActive(arg_78_0.eliteBtn, var_78_0 == Map.SCENARIO)

	local var_78_1 = getProxy(ActivityProxy):getActivityById(ActivityConst.ELITE_AWARD_ACTIVITY_ID)

	setActive(arg_78_0.eliteBtn:Find("pic_activity"), var_78_1 and not var_78_1:isEnd())
end

function var_0_0.updateActivityBtns(arg_79_0)
	local var_79_0 = arg_79_0.contextData.map
	local var_79_1, var_79_2 = var_79_0:isActivity()
	local var_79_3 = var_79_0:isRemaster()
	local var_79_4 = var_79_0:isSkirmish()
	local var_79_5 = var_79_0:isEscort()
	local var_79_6 = var_79_0:getConfig("type")
	local var_79_7 = getProxy(ActivityProxy)
	local var_79_8 = underscore(var_79_7:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_ZPROJECT)):chain():select(function(arg_80_0)
		return not arg_80_0:isEnd()
	end):sort(function(arg_81_0, arg_81_1)
		return arg_81_0.id < arg_81_1.id
	end):value()[1] and not var_79_1 and not var_79_4 and not var_79_5

	if var_79_8 then
		local var_79_9 = setmetatable({}, MainActMapBtn)

		var_79_9.image = arg_79_0.activityBtn:Find("Image"):GetComponent(typeof(Image))
		var_79_9.subImage = arg_79_0.activityBtn:Find("sub_Image"):GetComponent(typeof(Image))
		var_79_9.tipTr = arg_79_0.activityBtn:Find("Tip"):GetComponent(typeof(Image))
		var_79_9.tipTxt = arg_79_0.activityBtn:Find("Tip/Text"):GetComponent(typeof(Text))
		var_79_8 = var_79_9:InShowTime()

		if var_79_8 then
			var_79_9:InitTipImage()
			var_79_9:InitSubImage()
			var_79_9:InitImage(function()
				return
			end)
			var_79_9:OnInit()
		end
	end

	setActive(arg_79_0.activityBtn, var_79_8)
	arg_79_0:updateRemasterInfo()

	if var_79_1 and var_79_2 then
		local var_79_10

		if var_79_0:isRemaster() then
			var_79_10 = getProxy(ChapterProxy):getRemasterMaps(var_79_0.remasterId)
		else
			var_79_10 = getProxy(ChapterProxy):getMapsByActivities()
		end

		local var_79_11 = underscore.any(var_79_10, function(arg_83_0)
			return arg_83_0:isActExtra()
		end)

		setActive(arg_79_0.actExtraBtn, var_79_11 and var_79_6 ~= Map.ACT_EXTRA)

		if isActive(arg_79_0.actExtraBtn) then
			if underscore.all(underscore.filter(var_79_10, function(arg_84_0)
				local var_84_0 = arg_84_0:getMapType()

				return var_84_0 == Map.ACTIVITY_EASY or var_84_0 == Map.ACTIVITY_HARD
			end), function(arg_85_0)
				return arg_85_0:isAllChaptersClear()
			end) then
				setActive(arg_79_0.actExtraBtnAnim, true)
			else
				setActive(arg_79_0.actExtraBtnAnim, false)
			end

			setActive(arg_79_0.actExtraBtn:Find("Tip"), getProxy(ChapterProxy):IsActivitySPChapterActive() and SettingsProxy.IsShowActivityMapSPTip())
		end

		local var_79_12 = checkExist(var_79_0:getBindMap(), {
			"isHardMap"
		})

		setActive(arg_79_0.actEliteBtn, var_79_12 and var_79_6 ~= Map.ACTIVITY_HARD)
		setActive(arg_79_0.actNormalBtn, var_79_6 ~= Map.ACTIVITY_EASY)
		setActive(arg_79_0.actExtraRank, var_79_6 == Map.ACT_EXTRA and _.any(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_EXTRA_CHAPTER_RANK), function(arg_86_0)
			if not arg_86_0 or arg_86_0:isEnd() then
				return
			end

			local var_86_0 = arg_86_0:getConfig("config_data")[1]

			return _.any(var_79_0:getChapters(), function(arg_87_0)
				if not arg_87_0:IsEXChapter() then
					return false
				end

				return table.contains(arg_87_0:getConfig("boss_expedition_id"), var_86_0)
			end)
		end))
		setActive(arg_79_0.actExchangeShopBtn, not ActivityConst.HIDE_PT_PANELS and not var_79_3 and var_79_2 and arg_79_0:IsActShopActive())
		setActive(arg_79_0.ptTotal, not ActivityConst.HIDE_PT_PANELS and not var_79_3 and var_79_2 and arg_79_0.ptActivity and not arg_79_0.ptActivity:isEnd())
		arg_79_0:updateActivityRes()
	else
		setActive(arg_79_0.actExtraBtn, false)
		setActive(arg_79_0.actEliteBtn, false)
		setActive(arg_79_0.actNormalBtn, false)
		setActive(arg_79_0.actExtraRank, false)
		setActive(arg_79_0.actExchangeShopBtn, false)
		setActive(arg_79_0.actAtelierBuffBtn, false)
		setActive(arg_79_0.ptTotal, false)
	end

	setActive(arg_79_0.eventContainer, (not var_79_1 or not var_79_2) and not var_79_5)
	setActive(arg_79_0.remasterBtn, OPEN_REMASTER and (var_79_3 or not var_79_1 and not var_79_5 and not var_79_4))
	setActive(arg_79_0.ticketTxt.parent, var_79_3)
	arg_79_0:updateRemasterTicket()
	arg_79_0:updateCountDown()
end

function var_0_0.updateRemasterTicket(arg_88_0)
	setText(arg_88_0.ticketTxt, getProxy(ChapterProxy).remasterTickets .. " / " .. pg.gameset.reactivity_ticket_max.key_value)
	arg_88_0:emit(LevelUIConst.FLUSH_REMASTER_TICKET)
end

function var_0_0.updateRemasterBtnTip(arg_89_0)
	local var_89_0 = getProxy(ChapterProxy)
	local var_89_1 = var_89_0:ifShowRemasterTip() or var_89_0:anyRemasterAwardCanReceive()

	SetActive(arg_89_0.remasterBtn:Find("tip"), var_89_1)
	SetActive(arg_89_0.entranceLayer:Find("btns/btn_remaster/tip"), var_89_1)
end

function var_0_0.updatDailyBtnTip(arg_90_0)
	local var_90_0 = getProxy(DailyLevelProxy):ifShowDailyTip()

	SetActive(arg_90_0.dailyBtn:Find("tip"), var_90_0)
	SetActive(arg_90_0.entranceLayer:Find("btns/btn_daily/tip"), var_90_0)
end

function var_0_0.updateRemasterInfo(arg_91_0)
	arg_91_0:emit(LevelUIConst.FLUSH_REMASTER_INFO)

	if not arg_91_0.contextData.map then
		return
	end

	local var_91_0 = getProxy(ChapterProxy)
	local var_91_1
	local var_91_2 = arg_91_0.contextData.map:getRemaster()

	if var_91_2 and #pg.re_map_template[var_91_2].drop_gain > 0 then
		for iter_91_0, iter_91_1 in ipairs(pg.re_map_template[var_91_2].drop_gain) do
			if #iter_91_1 > 0 and var_91_0.remasterInfo[iter_91_1[1]][iter_91_0].receive == false then
				var_91_1 = {
					iter_91_0,
					iter_91_1
				}

				break
			end
		end
	end

	setActive(arg_91_0.remasterAwardBtn, var_91_1)

	if var_91_1 then
		local var_91_3 = var_91_1[1]
		local var_91_4, var_91_5, var_91_6, var_91_7 = unpack(var_91_1[2])
		local var_91_8 = var_91_0.remasterInfo[var_91_4][var_91_3]

		setText(arg_91_0.remasterAwardBtn:Find("Text"), var_91_8.count .. "/" .. var_91_7)
		updateDrop(arg_91_0.remasterAwardBtn:Find("IconTpl"), {
			type = var_91_5,
			id = var_91_6
		})
		setActive(arg_91_0.remasterAwardBtn:Find("tip"), var_91_7 <= var_91_8.count)
		onButton(arg_91_0, arg_91_0.remasterAwardBtn, function()
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				hideYes = true,
				hideNo = true,
				type = MSGBOX_TYPE_SINGLE_ITEM,
				drop = {
					type = var_91_5,
					id = var_91_6
				},
				weight = LayerWeightConst.TOP_LAYER,
				remaster = {
					word = i18n("level_remaster_tip4", pg.chapter_template[var_91_4].chapter_name),
					number = var_91_8.count .. "/" .. var_91_7,
					btn_text = i18n(var_91_8.count < var_91_7 and "level_remaster_tip2" or "level_remaster_tip3"),
					btn_call = function()
						if var_91_8.count < var_91_7 then
							local var_93_0 = pg.chapter_template[var_91_4].map
							local var_93_1, var_93_2 = var_91_0:getMapById(var_93_0):isUnlock()

							if not var_93_1 then
								pg.TipsMgr.GetInstance():ShowTips(var_93_2)
							else
								arg_91_0:ShowSelectedMap(var_93_0)
							end
						else
							arg_91_0:emit(LevelMediator2.ON_CHAPTER_REMASTER_AWARD, var_91_4, var_91_3)
						end
					end
				}
			})
		end, SFX_PANEL)
	end
end

function var_0_0.updateCountDown(arg_94_0)
	local var_94_0 = getProxy(ChapterProxy)

	if arg_94_0.newChapterCDTimer then
		arg_94_0.newChapterCDTimer:Stop()

		arg_94_0.newChapterCDTimer = nil
	end

	local var_94_1 = 0

	if arg_94_0.contextData.map:isActivity() and not arg_94_0.contextData.map:isRemaster() then
		local var_94_2 = var_94_0:getMapsByActivities()

		_.each(var_94_2, function(arg_95_0)
			local var_95_0 = arg_95_0:getChapterTimeLimit()

			if var_94_1 == 0 then
				var_94_1 = var_95_0
			else
				var_94_1 = math.min(var_94_1, var_95_0)
			end
		end)
		setActive(arg_94_0.countDown, var_94_1 > 0)
		setText(arg_94_0.countDown:Find("title"), i18n("levelScene_new_chapter_coming"))
	else
		setActive(arg_94_0.countDown, false)
	end

	if var_94_1 > 0 then
		setText(arg_94_0.countDown:Find("time"), pg.TimeMgr.GetInstance():DescCDTime(var_94_1))

		arg_94_0.newChapterCDTimer = Timer.New(function()
			var_94_1 = var_94_1 - 1

			if var_94_1 <= 0 then
				arg_94_0:updateCountDown()

				if not arg_94_0.contextData.chapterVO then
					arg_94_0:setMap(arg_94_0.contextData.mapIdx)
				end
			else
				setText(arg_94_0.countDown:Find("time"), pg.TimeMgr.GetInstance():DescCDTime(var_94_1))
			end
		end, 1, -1)

		arg_94_0.newChapterCDTimer:Start()
	else
		setText(arg_94_0.countDown:Find("time"), "")
	end
end

function var_0_0.registerActBtn(arg_97_0)
	onButton(arg_97_0, arg_97_0.actExtraRank, function()
		if arg_97_0:isfrozen() then
			return
		end

		arg_97_0:emit(LevelMediator2.ON_EXTRA_RANK)
	end, SFX_PANEL)
	onButton(arg_97_0, arg_97_0.activityBtn, function()
		if arg_97_0:isfrozen() then
			return
		end

		arg_97_0:emit(LevelMediator2.ON_ACTIVITY_MAP)
	end, SFX_UI_CLICK)
	onButton(arg_97_0, arg_97_0.actExchangeShopBtn, function()
		if arg_97_0:isfrozen() then
			return
		end

		arg_97_0:emit(LevelMediator2.GO_ACT_SHOP)
	end, SFX_UI_CLICK)
	onButton(arg_97_0, arg_97_0.actAtelierBuffBtn, function()
		if arg_97_0:isfrozen() then
			return
		end

		arg_97_0:emit(LevelMediator2.SHOW_ATELIER_BUFF)
	end, SFX_UI_CLICK)

	local var_97_0 = getProxy(ChapterProxy)

	local function var_97_1(arg_102_0, arg_102_1, arg_102_2)
		local var_102_0

		if arg_102_0:isRemaster() then
			var_102_0 = var_97_0:getRemasterMaps(arg_102_0.remasterId)
		else
			var_102_0 = var_97_0:getMapsByActivities()
		end

		local var_102_1 = _.select(var_102_0, function(arg_103_0)
			return arg_103_0:getMapType() == arg_102_1
		end)

		table.sort(var_102_1, function(arg_104_0, arg_104_1)
			return arg_104_0.id < arg_104_1.id
		end)

		local var_102_2 = table.indexof(underscore.map(var_102_1, function(arg_105_0)
			return arg_105_0.id
		end), arg_102_2) or #var_102_1

		while not var_102_1[var_102_2]:isUnlock() do
			if var_102_2 > 1 then
				var_102_2 = var_102_2 - 1
			else
				break
			end
		end

		return var_102_1[var_102_2]
	end

	arg_97_0:bind(LevelUIConst.SWITCH_ACT_MAP, function(arg_106_0, arg_106_1, arg_106_2)
		arg_106_2 = arg_106_2 or switch(arg_106_1, {
			[Map.ACTIVITY_EASY] = function()
				return arg_97_0.contextData.map:getBindMapId()
			end,
			[Map.ACTIVITY_HARD] = function()
				return arg_97_0.contextData.map:getBindMapId()
			end,
			[Map.ACT_EXTRA] = function()
				return PlayerPrefs.GetInt("ex_mapId", 0)
			end
		})

		local var_106_0 = var_97_1(arg_97_0.contextData.map, arg_106_1, arg_106_2)
		local var_106_1, var_106_2 = var_106_0:isUnlock()

		if var_106_1 then
			arg_97_0:setMap(var_106_0.id)
		else
			pg.TipsMgr.GetInstance():ShowTips(var_106_2)
		end
	end)
	onButton(arg_97_0, arg_97_0.actNormalBtn, function()
		if arg_97_0:isfrozen() then
			return
		end

		arg_97_0:emit(LevelUIConst.SWITCH_ACT_MAP, Map.ACTIVITY_EASY)
	end, SFX_PANEL)
	onButton(arg_97_0, arg_97_0.actEliteBtn, function()
		if arg_97_0:isfrozen() then
			return
		end

		arg_97_0:emit(LevelUIConst.SWITCH_ACT_MAP, Map.ACTIVITY_HARD)
	end, SFX_PANEL)
	onButton(arg_97_0, arg_97_0.actExtraBtn, function()
		if arg_97_0:isfrozen() then
			return
		end

		arg_97_0:emit(LevelUIConst.SWITCH_ACT_MAP, Map.ACT_EXTRA)
	end, SFX_PANEL)
end

function var_0_0.initCloudsPos(arg_113_0, arg_113_1)
	arg_113_0.initPositions = {}

	local var_113_0 = arg_113_1 or 1
	local var_113_1 = pg.expedition_data_by_map[var_113_0].clouds_pos

	for iter_113_0, iter_113_1 in ipairs(arg_113_0.cloudRTFs) do
		local var_113_2 = var_113_1[iter_113_0]

		if var_113_2 then
			iter_113_1.anchoredPosition = Vector2(var_113_2[1], var_113_2[2])

			table.insert(arg_113_0.initPositions, iter_113_1.anchoredPosition)
		else
			setActive(iter_113_1, false)
		end
	end
end

function var_0_0.initMapBtn(arg_114_0, arg_114_1, arg_114_2)
	onButton(arg_114_0, arg_114_1, function()
		if arg_114_0:isfrozen() then
			return
		end

		local var_115_0 = arg_114_0.contextData.mapIdx + arg_114_2
		local var_115_1 = getProxy(ChapterProxy):getMapById(var_115_0)

		if not var_115_1 then
			return
		end

		if var_115_1:getMapType() == Map.ELITE and not var_115_1:isEliteEnabled() then
			var_115_1 = var_115_1:getBindMap()
			var_115_0 = var_115_1.id

			pg.TipsMgr.GetInstance():ShowTips(i18n("elite_disable_unusable"))
		end

		local var_115_2, var_115_3 = var_115_1:isUnlock()

		if arg_114_2 > 0 and not var_115_2 then
			pg.TipsMgr.GetInstance():ShowTips(var_115_3)

			return
		end

		arg_114_0:setMap(var_115_0)
	end, SFX_PANEL)
end

function var_0_0.ShowSelectedMap(arg_116_0, arg_116_1, arg_116_2)
	seriesAsync({
		function(arg_117_0)
			if arg_116_0.contextData.entranceStatus then
				arg_116_0:frozen()

				arg_116_0.nextPreloadMap = arg_116_1

				arg_116_0:PreloadLevelMainUI(arg_116_1, function()
					arg_116_0:unfrozen()

					if arg_116_0.nextPreloadMap ~= arg_116_1 then
						return
					end

					arg_116_0:ShowEntranceUI(false)
					arg_116_0:emit(LevelMediator2.ON_ENTER_MAINLEVEL, arg_116_1)
					arg_117_0()
				end)
			else
				arg_116_0:setMap(arg_116_1)
				arg_117_0()
			end
		end
	}, arg_116_2)
end

function var_0_0.setMap(arg_119_0, arg_119_1)
	local var_119_0 = arg_119_0.contextData.mapIdx

	arg_119_0.contextData.mapIdx = arg_119_1
	arg_119_0.contextData.map = getProxy(ChapterProxy):getMapById(arg_119_1)

	assert(arg_119_0.contextData.map, "map cannot be nil " .. arg_119_1)

	if arg_119_0.contextData.map:getMapType() == Map.ACT_EXTRA then
		PlayerPrefs.SetInt("ex_mapId", arg_119_0.contextData.map.id)
		PlayerPrefs.Save()
	elseif arg_119_0.contextData.map:isRemaster() then
		PlayerPrefs.SetInt("remaster_lastmap_" .. arg_119_0.contextData.map.remasterId, arg_119_1)
		PlayerPrefs.Save()
	end

	arg_119_0:RecordLastMapOnExit()
	arg_119_0:updateMap(var_119_0)
	arg_119_0:tryPlayMapStory()
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

function var_0_0.SwitchMapBuilder(arg_120_0, arg_120_1)
	if arg_120_0.mapBuilder and arg_120_0.mapBuilder:GetType() ~= arg_120_1 then
		arg_120_0.mapBuilder.buffer:Hide()
	end

	local var_120_0 = arg_120_0:GetMapBuilderInBuffer(arg_120_1)

	arg_120_0.mapBuilder = var_120_0

	var_120_0.buffer:Show()
end

function var_0_0.GetMapBuilderInBuffer(arg_121_0, arg_121_1)
	if not arg_121_0.mbDict[arg_121_1] then
		local var_121_0 = _G[var_0_6[arg_121_1]]

		assert(var_121_0, "Missing MapBuilder of type " .. (arg_121_1 or "NIL"))

		arg_121_0.mbDict[arg_121_1] = var_121_0.New(arg_121_0._tf, arg_121_0)
		arg_121_0.mbDict[arg_121_1].isFrozen = arg_121_0:isfrozen()

		arg_121_0.mbDict[arg_121_1]:Load()
	end

	return arg_121_0.mbDict[arg_121_1]
end

function var_0_0.updateMap(arg_122_0, arg_122_1)
	local var_122_0 = arg_122_0.contextData.map
	local var_122_1 = var_122_0:getConfig("anchor")
	local var_122_2

	if var_122_1 == "" then
		var_122_2 = Vector2.zero
	else
		var_122_2 = Vector2(unpack(var_122_1))
	end

	arg_122_0.map.pivot = var_122_2

	local var_122_3 = var_122_0:getConfig("uifx")

	for iter_122_0 = 1, arg_122_0.UIFXList.childCount do
		local var_122_4 = arg_122_0.UIFXList:GetChild(iter_122_0 - 1)

		setActive(var_122_4, var_122_4.name == var_122_3)
	end

	arg_122_0:SwitchMapBG(var_122_0, arg_122_1)
	arg_122_0:PlayBGM()

	local var_122_5 = arg_122_0.contextData.map:getConfig("ui_type")

	arg_122_0:SwitchMapBuilder(var_122_5)
	seriesAsync({
		function(arg_123_0)
			arg_122_0.mapBuilder:CallbackInvoke(arg_123_0)
		end,
		function(arg_124_0)
			arg_122_0.mapBuilder:UpdateMapVO(var_122_0)
			arg_122_0.mapBuilder:UpdateView()
			arg_122_0.mapBuilder:UpdateMapItems()
			arg_122_0.mapBuilder:PlayEnterAnim()
		end
	})
end

function var_0_0.UpdateSwitchMapButton(arg_125_0)
	local var_125_0 = arg_125_0.contextData.map
	local var_125_1 = getProxy(ChapterProxy)
	local var_125_2 = var_125_1:getMapById(var_125_0.id - 1)
	local var_125_3 = var_125_1:getMapById(var_125_0.id + 1)

	setActive(arg_125_0.btnPrev, tobool(var_125_2))
	setActive(arg_125_0.btnNext, tobool(var_125_3))

	local var_125_4 = Color.New(0.5, 0.5, 0.5, 1)

	setImageColor(arg_125_0.btnPrevCol, var_125_2 and Color.white or var_125_4)
	setImageColor(arg_125_0.btnNextCol, var_125_3 and var_125_3:isUnlock() and Color.white or var_125_4)
end

function var_0_0.tryPlayMapStory(arg_126_0)
	if IsUnityEditor and not ENABLE_GUIDE then
		return
	end

	seriesAsync({
		function(arg_127_0)
			local var_127_0 = arg_126_0.contextData.map:getConfig("enter_story")

			if var_127_0 and var_127_0 ~= "" and not pg.NewStoryMgr.GetInstance():IsPlayed(var_127_0) and not arg_126_0.contextData.map:isRemaster() and not pg.SystemOpenMgr.GetInstance().active then
				local var_127_1 = tonumber(var_127_0)

				if var_127_1 and var_127_1 > 0 then
					arg_126_0:emit(LevelMediator2.ON_PERFORM_COMBAT, var_127_1)
				else
					pg.NewStoryMgr.GetInstance():Play(var_127_0, arg_127_0)
				end

				return
			end

			arg_127_0()
		end,
		function(arg_128_0)
			local var_128_0 = arg_126_0.contextData.map:getConfig("guide_id")

			if var_128_0 and var_128_0 ~= "" then
				pg.SystemGuideMgr.GetInstance():PlayByGuideId(var_128_0, nil, arg_128_0)

				return
			end

			arg_128_0()
		end,
		function(arg_129_0)
			if isActive(arg_126_0.actAtelierBuffBtn) and getProxy(ActivityProxy):AtelierActivityAllSlotIsEmpty() and getProxy(ActivityProxy):OwnAtelierActivityItemCnt(34, 1) then
				local var_129_0 = PlayerPrefs.GetInt("first_enter_ryza_buff_" .. getProxy(PlayerProxy):getRawData().id, 0) == 0
				local var_129_1

				if var_129_0 then
					var_129_1 = {
						1,
						2
					}
				else
					var_129_1 = {
						1
					}
				end

				pg.SystemGuideMgr.GetInstance():PlayByGuideId("NG0034", var_129_1)
			else
				arg_129_0()
			end
		end,
		function(arg_130_0)
			if arg_126_0.exited then
				return
			end

			pg.SystemOpenMgr.GetInstance():notification(arg_126_0.player.level)

			if pg.SystemOpenMgr.GetInstance().active then
				getProxy(ChapterProxy):StopAutoFight()
			end
		end
	})
end

function var_0_0.DisplaySPAnim(arg_131_0, arg_131_1, arg_131_2, arg_131_3)
	arg_131_0.uiAnims = arg_131_0.uiAnims or {}

	local var_131_0 = arg_131_0.uiAnims[arg_131_1]

	local function var_131_1()
		arg_131_0.playing = true

		arg_131_0:frozen()
		var_131_0:SetActive(true)

		local var_132_0 = tf(var_131_0)

		pg.UIMgr.GetInstance():OverlayPanel(var_132_0, {
			groupName = LayerWeightConst.GROUP_LEVELUI
		})

		if arg_131_3 then
			arg_131_3(var_131_0)
		end

		var_132_0:GetComponent("DftAniEvent"):SetEndEvent(function(arg_133_0)
			arg_131_0.playing = false

			if arg_131_2 then
				arg_131_2(var_131_0)
			end

			arg_131_0:unfrozen()
		end)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
	end

	if not var_131_0 then
		PoolMgr.GetInstance():GetUI(arg_131_1, true, function(arg_134_0)
			arg_134_0:SetActive(true)

			arg_131_0.uiAnims[arg_131_1] = arg_134_0
			var_131_0 = arg_131_0.uiAnims[arg_131_1]

			var_131_1()
		end)
	else
		var_131_1()
	end
end

function var_0_0.displaySpResult(arg_135_0, arg_135_1, arg_135_2)
	setActive(arg_135_0.spResult, true)
	arg_135_0:DisplaySPAnim(arg_135_1 == 1 and "SpUnitWin" or "SpUnitLose", function(arg_136_0)
		onButton(arg_135_0, arg_136_0, function()
			removeOnButton(arg_136_0)
			setActive(arg_136_0, false)
			pg.UIMgr.GetInstance():UnOverlayPanel(arg_136_0, arg_135_0._tf)
			arg_135_0:hideSpResult()
			arg_135_2()
		end, SFX_PANEL)
	end)
end

function var_0_0.hideSpResult(arg_138_0)
	setActive(arg_138_0.spResult, false)
end

function var_0_0.displayBombResult(arg_139_0, arg_139_1)
	setActive(arg_139_0.spResult, true)
	arg_139_0:DisplaySPAnim("SpBombRet", function(arg_140_0)
		onButton(arg_139_0, arg_140_0, function()
			removeOnButton(arg_140_0)
			setActive(arg_140_0, false)
			pg.UIMgr.GetInstance():UnOverlayPanel(arg_140_0, arg_139_0._tf)
			arg_139_0:hideSpResult()
			arg_139_1()
		end, SFX_PANEL)
	end, function(arg_142_0)
		setText(arg_142_0.transform:Find("right/name_bg/en"), arg_139_0.contextData.chapterVO.modelCount)
	end)
end

function var_0_0.OnLevelInfoPanelConfirm(arg_143_0, arg_143_1, arg_143_2)
	arg_143_0.contextData.chapterLoopFlag = arg_143_2

	local var_143_0 = getProxy(ChapterProxy):getChapterById(arg_143_1, true)

	if var_143_0:getConfig("type") == Chapter.CustomFleet then
		arg_143_0:displayFleetEdit(var_143_0)

		return
	end

	if #var_143_0:getNpcShipByType(1) > 0 then
		arg_143_0:emit(LevelMediator2.ON_TRACKING, arg_143_1)

		return
	end

	arg_143_0:displayFleetSelect(var_143_0)
end

function var_0_0.DisplayLevelInfoPanel(arg_144_0, arg_144_1, arg_144_2)
	seriesAsync({
		function(arg_145_0)
			if not arg_144_0.levelInfoView:GetLoaded() then
				arg_144_0:frozen()
				arg_144_0.levelInfoView:Load()
				arg_144_0.levelInfoView:CallbackInvoke(function()
					arg_144_0:unfrozen()
					arg_145_0()
				end)

				return
			end

			arg_145_0()
		end,
		function(arg_147_0)
			local function var_147_0(arg_148_0, arg_148_1)
				arg_144_0:hideChapterPanel()
				arg_144_0:OnLevelInfoPanelConfirm(arg_148_0, arg_148_1)
			end

			local function var_147_1()
				arg_144_0:hideChapterPanel()
			end

			local var_147_2 = getProxy(ChapterProxy):getChapterById(arg_144_1, true)

			if getProxy(ChapterProxy):getMapById(var_147_2:getConfig("map")):isSkirmish() and #var_147_2:getNpcShipByType(1) > 0 then
				var_147_0(false)

				return
			end

			arg_144_0.levelInfoView:set(arg_144_1, arg_144_2)
			arg_144_0.levelInfoView:setCBFunc(var_147_0, var_147_1)
			arg_144_0.levelInfoView:Show()
		end
	})
end

function var_0_0.hideChapterPanel(arg_150_0)
	if arg_150_0.levelInfoView:isShowing() then
		arg_150_0.levelInfoView:Hide()
	end
end

function var_0_0.destroyChapterPanel(arg_151_0)
	arg_151_0.levelInfoView:Destroy()

	arg_151_0.levelInfoView = nil
end

function var_0_0.DisplayLevelInfoSPPanel(arg_152_0, arg_152_1, arg_152_2, arg_152_3)
	seriesAsync({
		function(arg_153_0)
			if not arg_152_0.levelInfoSPView then
				arg_152_0.levelInfoSPView = LevelInfoSPView.New(arg_152_0.topPanel, arg_152_0.event, arg_152_0.contextData)

				arg_152_0:frozen()
				arg_152_0.levelInfoSPView:Load()
				arg_152_0.levelInfoSPView:CallbackInvoke(function()
					arg_152_0:unfrozen()
					arg_153_0()
				end)

				return
			end

			arg_153_0()
		end,
		function(arg_155_0)
			local function var_155_0(arg_156_0, arg_156_1)
				arg_152_0:HideLevelInfoSPPanel()
				arg_152_0:OnLevelInfoPanelConfirm(arg_156_0, arg_156_1)
			end

			local function var_155_1()
				arg_152_0:HideLevelInfoSPPanel()
			end

			arg_152_0.levelInfoSPView:SetChapterGroupInfo(arg_152_2)
			arg_152_0.levelInfoSPView:set(arg_152_1, arg_152_3)
			arg_152_0.levelInfoSPView:setCBFunc(var_155_0, var_155_1)
			arg_152_0.levelInfoSPView:Show()
		end
	})
end

function var_0_0.HideLevelInfoSPPanel(arg_158_0)
	if arg_158_0.levelInfoSPView and arg_158_0.levelInfoSPView:isShowing() then
		arg_158_0.levelInfoSPView:Hide()
	end
end

function var_0_0.DestroyLevelInfoSPPanel(arg_159_0)
	if not arg_159_0.levelInfoSPView then
		return
	end

	arg_159_0.levelInfoSPView:Destroy()

	arg_159_0.levelInfoSPView = nil
end

function var_0_0.displayFleetSelect(arg_160_0, arg_160_1)
	local var_160_0 = arg_160_0.contextData.selectedFleetIDs or arg_160_1:GetDefaultFleetIndex()

	arg_160_1 = Clone(arg_160_1)
	arg_160_1.loopFlag = arg_160_0.contextData.chapterLoopFlag

	arg_160_0.levelFleetView:updateSpecialOperationTickets(arg_160_0.spTickets)
	arg_160_0.levelFleetView:Load()
	arg_160_0.levelFleetView:ActionInvoke("setHardShipVOs", arg_160_0.shipVOs)
	arg_160_0.levelFleetView:ActionInvoke("setOpenCommanderTag", arg_160_0.openedCommanerSystem)
	arg_160_0.levelFleetView:ActionInvoke("set", arg_160_1, arg_160_0.fleets, var_160_0)
	arg_160_0.levelFleetView:ActionInvoke("Show")
end

function var_0_0.hideFleetSelect(arg_161_0)
	if arg_161_0.levelCMDFormationView:isShowing() then
		arg_161_0.levelCMDFormationView:Hide()
	end

	if arg_161_0.levelFleetView then
		arg_161_0.levelFleetView:Hide()
	end
end

function var_0_0.buildCommanderPanel(arg_162_0)
	arg_162_0.levelCMDFormationView = LevelCMDFormationView.New(arg_162_0.topPanel, arg_162_0.event, arg_162_0.contextData)
end

function var_0_0.destroyFleetSelect(arg_163_0)
	if not arg_163_0.levelFleetView then
		return
	end

	arg_163_0.levelFleetView:Destroy()

	arg_163_0.levelFleetView = nil
end

function var_0_0.displayFleetEdit(arg_164_0, arg_164_1)
	arg_164_1 = Clone(arg_164_1)
	arg_164_1.loopFlag = arg_164_0.contextData.chapterLoopFlag

	arg_164_0.levelFleetView:updateSpecialOperationTickets(arg_164_0.spTickets)
	arg_164_0.levelFleetView:Load()
	arg_164_0.levelFleetView:ActionInvoke("setOpenCommanderTag", arg_164_0.openedCommanerSystem)
	arg_164_0.levelFleetView:ActionInvoke("setHardShipVOs", arg_164_0.shipVOs)
	arg_164_0.levelFleetView:ActionInvoke("setOnHard", arg_164_1)
	arg_164_0.levelFleetView:ActionInvoke("Show")
end

function var_0_0.hideFleetEdit(arg_165_0)
	arg_165_0:hideFleetSelect()
end

function var_0_0.destroyFleetEdit(arg_166_0)
	arg_166_0:destroyFleetSelect()
end

function var_0_0.RefreshFleetSelectView(arg_167_0, arg_167_1)
	if not arg_167_0.levelFleetView then
		return
	end

	assert(arg_167_0.levelFleetView:GetLoaded())

	local var_167_0 = arg_167_0.levelFleetView:IsSelectMode()
	local var_167_1

	if var_167_0 then
		arg_167_0.levelFleetView:ActionInvoke("set", arg_167_1 or arg_167_0.levelFleetView.chapter, arg_167_0.fleets, arg_167_0.levelFleetView:getSelectIds())

		if arg_167_0.levelCMDFormationView:isShowing() then
			local var_167_2 = arg_167_0.levelCMDFormationView.fleet.id

			var_167_1 = arg_167_0.fleets[var_167_2]
		end
	else
		arg_167_0.levelFleetView:ActionInvoke("setOnHard", arg_167_1 or arg_167_0.levelFleetView.chapter)

		if arg_167_0.levelCMDFormationView:isShowing() then
			local var_167_3 = arg_167_0.levelCMDFormationView.fleet.id

			var_167_1 = arg_167_1:wrapEliteFleet(var_167_3)
		end
	end

	if var_167_1 then
		arg_167_0.levelCMDFormationView:ActionInvoke("updateFleet", var_167_1)
	end
end

function var_0_0.setChapter(arg_168_0, arg_168_1)
	local var_168_0

	if arg_168_1 then
		var_168_0 = arg_168_1.id
	end

	arg_168_0.contextData.chapterId = var_168_0
	arg_168_0.contextData.chapterVO = arg_168_1
end

function var_0_0.switchToChapter(arg_169_0, arg_169_1)
	if arg_169_0.contextData.mapIdx ~= arg_169_1:getConfig("map") then
		arg_169_0:setMap(arg_169_1:getConfig("map"))
	end

	arg_169_0:setChapter(arg_169_1)

	arg_169_0.leftCanvasGroup.blocksRaycasts = false
	arg_169_0.rightCanvasGroup.blocksRaycasts = false

	assert(not arg_169_0.levelStageView, "LevelStageView Exists On SwitchToChapter")
	arg_169_0:DestroyLevelStageView()

	if not arg_169_0.levelStageView then
		arg_169_0.levelStageView = LevelStageView.New(arg_169_0.topPanel, arg_169_0.event, arg_169_0.contextData)

		arg_169_0.levelStageView:Load()

		arg_169_0.levelStageView.isFrozen = arg_169_0:isfrozen()
	end

	arg_169_0:frozen()

	local function var_169_0()
		seriesAsync({
			function(arg_171_0)
				arg_169_0.mapBuilder:CallbackInvoke(arg_171_0)
			end,
			function(arg_172_0)
				setActive(arg_169_0.clouds, false)
				arg_169_0.mapBuilder:HideFloat()
				pg.UIMgr.GetInstance():BlurPanel(arg_169_0.topPanel, false, {
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
				arg_169_0.levelStageView:updateStageInfo()
				arg_169_0.levelStageView:updateAmbushRate(arg_169_1.fleet.line, true)
				arg_169_0.levelStageView:updateStageAchieve()
				arg_169_0.levelStageView:updateStageBarrier()
				arg_169_0.levelStageView:updateBombPanel()
				arg_169_0.levelStageView:UpdateDefenseStatus()
				onNextTick(arg_172_0)
			end,
			function(arg_173_0)
				if arg_169_0.exited then
					return
				end

				arg_169_0.levelStageView:updateStageStrategy()

				arg_169_0.canvasGroup.blocksRaycasts = arg_169_0.frozenCount == 0

				onNextTick(arg_173_0)
			end,
			function(arg_174_0)
				if arg_169_0.exited then
					return
				end

				arg_169_0.levelStageView:updateStageFleet()
				arg_169_0.levelStageView:updateSupportFleet()
				arg_169_0.levelStageView:updateFleetBuff()
				onNextTick(arg_174_0)
			end,
			function(arg_175_0)
				if arg_169_0.exited then
					return
				end

				parallelAsync({
					function(arg_176_0)
						local var_176_0 = arg_169_1:getConfig("scale")
						local var_176_1 = LeanTween.value(go(arg_169_0.map), arg_169_0.map.localScale, Vector3.New(var_176_0[3], var_176_0[3], 1), var_0_1):setOnUpdateVector3(function(arg_177_0)
							arg_169_0.map.localScale = arg_177_0
							arg_169_0.float.localScale = arg_177_0
						end):setOnComplete(System.Action(function()
							arg_169_0.mapBuilder:ShowFloat()
							arg_169_0.mapBuilder:Hide()
							arg_176_0()
						end)):setEase(LeanTweenType.easeOutSine)

						arg_169_0:RecordTween("mapScale", var_176_1.uniqueId)

						local var_176_2 = LeanTween.value(go(arg_169_0.map), arg_169_0.map.pivot, Vector2.New(math.clamp(var_176_0[1] - 0.5, 0, 1), math.clamp(var_176_0[2] - 0.5, 0, 1)), var_0_1)

						var_176_2:setOnUpdateVector2(function(arg_179_0)
							arg_169_0.map.pivot = arg_179_0
							arg_169_0.float.pivot = arg_179_0
						end):setEase(LeanTweenType.easeOutSine)
						arg_169_0:RecordTween("mapPivot", var_176_2.uniqueId)
						shiftPanel(arg_169_0.leftChapter, -arg_169_0.leftChapter.rect.width - 200, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
						shiftPanel(arg_169_0.rightChapter, arg_169_0.rightChapter.rect.width + 200, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
						shiftPanel(arg_169_0.topChapter, 0, arg_169_0.topChapter.rect.height, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
						arg_169_0.levelStageView:ShiftStagePanelIn()
					end,
					function(arg_180_0)
						arg_169_0:PlayBGM()

						local var_180_0 = {}
						local var_180_1 = arg_169_1:getConfig("bg")

						if var_180_1 and #var_180_1 > 0 then
							var_180_0[1] = {
								BG = var_180_1
							}
						end

						arg_169_0:SwitchBG(var_180_0, arg_180_0)
					end
				}, function()
					onNextTick(arg_175_0)
				end)
			end,
			function(arg_182_0)
				if arg_169_0.exited then
					return
				end

				setActive(arg_169_0.topChapter, false)
				setActive(arg_169_0.leftChapter, false)
				setActive(arg_169_0.rightChapter, false)

				arg_169_0.leftCanvasGroup.blocksRaycasts = true
				arg_169_0.rightCanvasGroup.blocksRaycasts = true

				arg_169_0:initGrid(arg_182_0)
			end,
			function(arg_183_0)
				if arg_169_0.exited then
					return
				end

				arg_169_0.levelStageView:SetGrid(arg_169_0.grid)

				arg_169_0.contextData.huntingRangeVisibility = arg_169_0.contextData.huntingRangeVisibility - 1

				arg_169_0.grid:toggleHuntingRange()

				local var_183_0 = arg_169_1:getConfig("pop_pic")

				if var_183_0 and #var_183_0 > 0 and arg_169_0.FirstEnterChapter == arg_169_1.id then
					arg_169_0:doPlayAnim(var_183_0, function(arg_184_0)
						setActive(arg_184_0, false)

						if arg_169_0.exited then
							return
						end

						arg_183_0()
					end)
				else
					arg_183_0()
				end
			end,
			function(arg_185_0)
				arg_169_0.levelStageView:tryAutoAction(arg_185_0)
			end,
			function(arg_186_0)
				if arg_169_0.exited then
					return
				end

				arg_169_0:unfrozen()

				if arg_169_0.FirstEnterChapter then
					arg_169_0:emit(LevelMediator2.ON_RESUME_SUBSTATE, arg_169_1.subAutoAttack)
				end

				arg_169_0.FirstEnterChapter = nil

				arg_169_0.levelStageView:tryAutoTrigger(true)
			end
		})
	end

	arg_169_0.levelStageView:ActionInvoke("SetSeriesOperation", var_169_0)
	arg_169_0.levelStageView:ActionInvoke("SetPlayer", arg_169_0.player)
	arg_169_0.levelStageView:ActionInvoke("SwitchToChapter", arg_169_1)
end

function var_0_0.switchToMap(arg_187_0, arg_187_1)
	arg_187_0:frozen()
	arg_187_0:destroyGrid()
	arg_187_0:setChapter(nil)
	LeanTween.cancel(go(arg_187_0.map))

	local var_187_0 = LeanTween.value(go(arg_187_0.map), arg_187_0.map.localScale, Vector3.one, var_0_1):setOnUpdateVector3(function(arg_188_0)
		arg_187_0.map.localScale = arg_188_0
		arg_187_0.float.localScale = arg_188_0
	end):setOnComplete(System.Action(function()
		arg_187_0:unfrozen()
		arg_187_0.mapBuilder:PlayEnterAnim()
		existCall(arg_187_1)
	end)):setEase(LeanTweenType.easeOutSine)

	arg_187_0:RecordTween("mapScale", var_187_0.uniqueId)

	local var_187_1 = arg_187_0.contextData.map:getConfig("anchor")
	local var_187_2

	if var_187_1 == "" then
		var_187_2 = Vector2.zero
	else
		var_187_2 = Vector2(unpack(var_187_1))
	end

	local var_187_3 = LeanTween.value(go(arg_187_0.map), arg_187_0.map.pivot, var_187_2, var_0_1)

	var_187_3:setOnUpdateVector2(function(arg_190_0)
		arg_187_0.map.pivot = arg_190_0
		arg_187_0.float.pivot = arg_190_0
	end):setEase(LeanTweenType.easeOutSine)
	arg_187_0:RecordTween("mapPivot", var_187_3.uniqueId)
	setActive(arg_187_0.topChapter, true)
	setActive(arg_187_0.leftChapter, true)
	setActive(arg_187_0.rightChapter, true)
	shiftPanel(arg_187_0.leftChapter, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(arg_187_0.rightChapter, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(arg_187_0.topChapter, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	assert(arg_187_0.levelStageView, "LevelStageView Doesnt Exist On SwitchToMap")

	if arg_187_0.levelStageView then
		arg_187_0.levelStageView:ActionInvoke("ShiftStagePanelOut", function()
			arg_187_0:DestroyLevelStageView()
		end)
		arg_187_0.levelStageView:ActionInvoke("SwitchToMap")
	end

	arg_187_0:SwitchMapBG(arg_187_0.contextData.map)
	arg_187_0:PlayBGM()
	seriesAsync({
		function(arg_192_0)
			arg_187_0.mapBuilder:CallbackInvoke(arg_192_0)
		end,
		function(arg_193_0)
			arg_187_0.mapBuilder:Show()
			arg_187_0.mapBuilder:UpdateView()
			arg_187_0.mapBuilder:UpdateMapItems()
		end
	})
	pg.UIMgr.GetInstance():UnblurPanel(arg_187_0.topPanel, arg_187_0._tf)
	pg.playerResUI:SetActive({
		active = false
	})

	arg_187_0.canvasGroup.blocksRaycasts = arg_187_0.frozenCount == 0
	arg_187_0.canvasGroup.interactable = true

	if arg_187_0.ambushWarning and arg_187_0.ambushWarning.activeSelf then
		arg_187_0.ambushWarning:SetActive(false)
		arg_187_0:unfrozen()
	end
end

function var_0_0.SwitchBG(arg_194_0, arg_194_1, arg_194_2, arg_194_3)
	if not arg_194_1 or #arg_194_1 <= 0 then
		existCall(arg_194_2)

		return
	elseif arg_194_3 then
		-- block empty
	elseif table.equal(arg_194_0.currentBG, arg_194_1) then
		return
	end

	arg_194_0.currentBG = arg_194_1

	for iter_194_0, iter_194_1 in ipairs(arg_194_0.mapGroup) do
		arg_194_0.loader:ClearRequest(iter_194_1)
	end

	table.clear(arg_194_0.mapGroup)

	local var_194_0 = {}

	table.ParallelIpairsAsync(arg_194_1, function(arg_195_0, arg_195_1, arg_195_2)
		local var_195_0 = arg_194_0.mapTFs[arg_195_0]
		local var_195_1 = arg_195_1.bgPrefix and arg_195_1.bgPrefix .. "/" or "levelmap/"
		local var_195_2 = arg_194_0.loader:GetSpriteDirect(var_195_1 .. arg_195_1.BG, "", function(arg_196_0)
			var_194_0[arg_195_0] = arg_196_0

			arg_195_2()
		end, var_195_0)

		table.insert(arg_194_0.mapGroup, var_195_2)
		arg_194_0:updateCouldAnimator(arg_195_1.Animator, arg_195_0)
	end, function()
		for iter_197_0, iter_197_1 in ipairs(arg_194_0.mapTFs) do
			setImageSprite(iter_197_1, var_194_0[iter_197_0])
			setActive(iter_197_1, arg_194_1[iter_197_0])
			SetCompomentEnabled(iter_197_1, typeof(Image), true)
		end

		existCall(arg_194_2)
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

function var_0_0.ClearMapTransitions(arg_198_0)
	if not arg_198_0.mapTransitions then
		return
	end

	for iter_198_0, iter_198_1 in pairs(arg_198_0.mapTransitions) do
		if iter_198_1 then
			PoolMgr.GetInstance():ReturnPrefab("ui/" .. iter_198_0, iter_198_0, iter_198_1, true)
		else
			PoolMgr.GetInstance():DestroyPrefab("ui/" .. iter_198_0, iter_198_0)
		end
	end

	arg_198_0.mapTransitions = nil
end

function var_0_0.SwitchMapBG(arg_199_0, arg_199_1, arg_199_2, arg_199_3)
	local var_199_0, var_199_1, var_199_2 = arg_199_0:GetMapBG(arg_199_1, arg_199_2)

	if not var_199_1 then
		arg_199_0:SwitchBG(var_199_0, nil, arg_199_3)

		return
	end

	arg_199_0:PlayMapTransition("LevelMapTransition_" .. var_199_1, var_199_2, function()
		arg_199_0:SwitchBG(var_199_0, nil, arg_199_3)
	end)
end

function var_0_0.GetMapBG(arg_201_0, arg_201_1, arg_201_2)
	if not table.contains(var_0_7, arg_201_1.id) then
		return {
			arg_201_0:GetMapElement(arg_201_1)
		}
	end

	local var_201_0 = arg_201_1.id
	local var_201_1 = table.indexof(var_0_7, var_201_0) - 1
	local var_201_2 = bit.lshift(bit.rshift(var_201_1, 1), 1) + 1
	local var_201_3 = {
		var_0_7[var_201_2],
		var_0_7[var_201_2 + 1]
	}
	local var_201_4 = _.map(var_201_3, function(arg_202_0)
		return getProxy(ChapterProxy):getMapById(arg_202_0)
	end)

	if _.all(var_201_4, function(arg_203_0)
		return arg_203_0:isAllChaptersClear()
	end) then
		local var_201_5 = {
			arg_201_0:GetMapElement(arg_201_1)
		}

		if not arg_201_2 or math.abs(var_201_0 - arg_201_2) ~= 1 then
			return var_201_5
		end

		local var_201_6 = var_0_9[bit.rshift(var_201_2 - 1, 1) + 1]
		local var_201_7 = bit.band(var_201_1, 1) == 1

		return var_201_5, var_201_6, var_201_7
	else
		local var_201_8 = 0

		;(function()
			local var_204_0 = var_201_4[1]:getChapters()

			for iter_204_0, iter_204_1 in ipairs(var_204_0) do
				if not iter_204_1:isClear() then
					return
				end

				var_201_8 = var_201_8 + 1
			end

			if not var_201_4[2]:isAnyChapterUnlocked(true) then
				return
			end

			var_201_8 = var_201_8 + 1

			local var_204_1 = var_201_4[2]:getChapters()

			for iter_204_2, iter_204_3 in ipairs(var_204_1) do
				if not iter_204_3:isClear() then
					return
				end

				var_201_8 = var_201_8 + 1
			end
		end)()

		local var_201_9

		if var_201_8 > 0 then
			local var_201_10 = var_0_8[bit.rshift(var_201_2 - 1, 1) + 1]

			var_201_9 = {
				{
					BG = "map_" .. var_201_10[1],
					Animator = var_201_10[2]
				},
				{
					BG = "map_" .. var_201_10[3] + var_201_8,
					Animator = var_201_10[4]
				}
			}
		else
			var_201_9 = {
				arg_201_0:GetMapElement(arg_201_1)
			}
		end

		return var_201_9
	end
end

function var_0_0.GetMapElement(arg_205_0, arg_205_1)
	local var_205_0 = arg_205_1:getConfig("bg")
	local var_205_1 = arg_205_1:getConfig("ani_controller")

	if var_205_1 and #var_205_1 > 0 then
		(function()
			for iter_206_0, iter_206_1 in ipairs(var_205_1) do
				local var_206_0 = _.rest(iter_206_1[2], 2)

				for iter_206_2, iter_206_3 in ipairs(var_206_0) do
					if string.find(iter_206_3, "^map_") and iter_206_1[1] == var_0_3 then
						local var_206_1 = iter_206_1[2][1]
						local var_206_2 = getProxy(ChapterProxy):GetChapterItemById(var_206_1)

						if var_206_2 and not var_206_2:isClear() then
							var_205_0 = iter_206_3

							return
						end
					end
				end
			end
		end)()
	end

	local var_205_2 = {
		BG = var_205_0
	}

	var_205_2.Animator, var_205_2.AnimatorController = arg_205_0:GetMapAnimator(arg_205_1)

	return var_205_2
end

function var_0_0.GetMapAnimator(arg_207_0, arg_207_1)
	local var_207_0 = arg_207_1:getConfig("ani_name")

	if arg_207_1:getConfig("animtor") == 1 and var_207_0 and #var_207_0 > 0 then
		local var_207_1 = arg_207_1:getConfig("ani_controller")

		if var_207_1 and #var_207_1 > 0 then
			(function()
				for iter_208_0, iter_208_1 in ipairs(var_207_1) do
					local var_208_0 = _.rest(iter_208_1[2], 2)

					for iter_208_2, iter_208_3 in ipairs(var_208_0) do
						if string.find(iter_208_3, "^effect_") and iter_208_1[1] == var_0_3 then
							local var_208_1 = iter_208_1[2][1]
							local var_208_2 = getProxy(ChapterProxy):GetChapterItemById(var_208_1)

							if var_208_2 and not var_208_2:isClear() then
								var_207_0 = "map_" .. string.sub(iter_208_3, 8)

								return
							end
						end
					end
				end
			end)()
		end

		return var_207_0, var_207_1
	end
end

function var_0_0.PlayMapTransition(arg_209_0, arg_209_1, arg_209_2, arg_209_3, arg_209_4)
	arg_209_0.mapTransitions = arg_209_0.mapTransitions or {}

	local var_209_0

	local function var_209_1()
		arg_209_0:frozen()
		existCall(arg_209_3, var_209_0)
		var_209_0:SetActive(true)

		local var_210_0 = tf(var_209_0)

		pg.UIMgr.GetInstance():OverlayPanel(var_210_0, {
			groupName = LayerWeightConst.GROUP_LEVELUI
		})
		var_209_0:GetComponent(typeof(Animator)):Play(arg_209_2 and "Sequence" or "Inverted", -1, 0)
		var_210_0:GetComponent("DftAniEvent"):SetEndEvent(function(arg_211_0)
			pg.UIMgr.GetInstance():UnOverlayPanel(var_210_0, arg_209_0._tf)
			existCall(arg_209_4, var_209_0)
			PoolMgr.GetInstance():ReturnPrefab("ui/" .. arg_209_1, arg_209_1, var_209_0)

			arg_209_0.mapTransitions[arg_209_1] = false

			arg_209_0:unfrozen()
		end)
	end

	PoolMgr.GetInstance():GetPrefab("ui/" .. arg_209_1, arg_209_1, true, function(arg_212_0)
		var_209_0 = arg_212_0
		arg_209_0.mapTransitions[arg_209_1] = arg_212_0

		var_209_1()
	end)
end

function var_0_0.DestroyLevelStageView(arg_213_0)
	if arg_213_0.levelStageView then
		arg_213_0.levelStageView:Destroy()

		arg_213_0.levelStageView = nil
	end
end

function var_0_0.displayAmbushInfo(arg_214_0, arg_214_1)
	arg_214_0.levelAmbushView = LevelAmbushView.New(arg_214_0.topPanel, arg_214_0.event, arg_214_0.contextData)

	arg_214_0.levelAmbushView:Load()
	arg_214_0.levelAmbushView:ActionInvoke("SetFuncOnComplete", arg_214_1)
end

function var_0_0.hideAmbushInfo(arg_215_0)
	if arg_215_0.levelAmbushView then
		arg_215_0.levelAmbushView:Destroy()

		arg_215_0.levelAmbushView = nil
	end
end

function var_0_0.doAmbushWarning(arg_216_0, arg_216_1)
	arg_216_0:frozen()

	local function var_216_0()
		arg_216_0.ambushWarning:SetActive(true)

		local var_217_0 = tf(arg_216_0.ambushWarning)

		var_217_0:SetParent(pg.UIMgr.GetInstance().OverlayMain.transform, false)
		var_217_0:SetSiblingIndex(1)

		local var_217_1 = var_217_0:GetComponent("DftAniEvent")

		var_217_1:SetTriggerEvent(function(arg_218_0)
			arg_216_1()
		end)
		var_217_1:SetEndEvent(function(arg_219_0)
			arg_216_0.ambushWarning:SetActive(false)
			arg_216_0:unfrozen()
		end)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
		Timer.New(function()
			pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
		end, 1, 1):Start()
	end

	if not arg_216_0.ambushWarning then
		PoolMgr.GetInstance():GetUI("ambushwarnui", true, function(arg_221_0)
			arg_221_0:SetActive(true)

			arg_216_0.ambushWarning = arg_221_0

			var_216_0()
		end)
	else
		var_216_0()
	end
end

function var_0_0.destroyAmbushWarn(arg_222_0)
	if arg_222_0.ambushWarning then
		PoolMgr.GetInstance():ReturnUI("ambushwarnui", arg_222_0.ambushWarning)

		arg_222_0.ambushWarning = nil
	end
end

function var_0_0.displayStrategyInfo(arg_223_0, arg_223_1)
	arg_223_0.levelStrategyView = LevelStrategyView.New(arg_223_0.topPanel, arg_223_0.event, arg_223_0.contextData)

	arg_223_0.levelStrategyView:Load()
	arg_223_0.levelStrategyView:ActionInvoke("set", arg_223_1)

	local function var_223_0()
		local var_224_0 = arg_223_0.contextData.chapterVO.fleet
		local var_224_1 = pg.strategy_data_template[arg_223_1.id]

		if not var_224_0:canUseStrategy(arg_223_1) then
			return
		end

		local var_224_2 = var_224_0:getNextStgUser(arg_223_1.id)

		if var_224_1.type == ChapterConst.StgTypeForm then
			arg_223_0:emit(LevelMediator2.ON_OP, {
				type = ChapterConst.OpStrategy,
				id = var_224_2,
				arg1 = arg_223_1.id
			})
		elseif var_224_1.type == ChapterConst.StgTypeConsume then
			arg_223_0:emit(LevelMediator2.ON_OP, {
				type = ChapterConst.OpStrategy,
				id = var_224_2,
				arg1 = arg_223_1.id
			})
		end

		arg_223_0:hideStrategyInfo()
	end

	local function var_223_1()
		arg_223_0:hideStrategyInfo()
	end

	arg_223_0.levelStrategyView:ActionInvoke("setCBFunc", var_223_0, var_223_1)
end

function var_0_0.hideStrategyInfo(arg_226_0)
	if arg_226_0.levelStrategyView then
		arg_226_0.levelStrategyView:Destroy()

		arg_226_0.levelStrategyView = nil
	end
end

function var_0_0.displayRepairWindow(arg_227_0, arg_227_1)
	local var_227_0 = arg_227_0.contextData.chapterVO
	local var_227_1 = getProxy(ChapterProxy)
	local var_227_2
	local var_227_3
	local var_227_4
	local var_227_5
	local var_227_6 = var_227_1.repairTimes
	local var_227_7, var_227_8, var_227_9 = ChapterConst.GetRepairParams()

	arg_227_0.levelRepairView = LevelRepairView.New(arg_227_0.topPanel, arg_227_0.event, arg_227_0.contextData)

	arg_227_0.levelRepairView:Load()
	arg_227_0.levelRepairView:ActionInvoke("set", var_227_6, var_227_7, var_227_8, var_227_9)

	local function var_227_10()
		if var_227_7 - math.min(var_227_6, var_227_7) == 0 and arg_227_0.player:getTotalGem() < var_227_9 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_rmb"))

			return
		end

		arg_227_0:emit(LevelMediator2.ON_OP, {
			type = ChapterConst.OpRepair,
			id = var_227_0.fleet.id,
			arg1 = arg_227_1.id
		})
		arg_227_0:hideRepairWindow()
	end

	local function var_227_11()
		arg_227_0:hideRepairWindow()
	end

	arg_227_0.levelRepairView:ActionInvoke("setCBFunc", var_227_10, var_227_11)
end

function var_0_0.hideRepairWindow(arg_230_0)
	if arg_230_0.levelRepairView then
		arg_230_0.levelRepairView:Destroy()

		arg_230_0.levelRepairView = nil
	end
end

function var_0_0.displayRemasterPanel(arg_231_0, arg_231_1)
	arg_231_0.levelRemasterView:Load()

	local function var_231_0(arg_232_0)
		arg_231_0:ShowSelectedMap(arg_232_0)
	end

	arg_231_0.levelRemasterView:ActionInvoke("Show")
	arg_231_0.levelRemasterView:ActionInvoke("set", var_231_0, arg_231_1)
end

function var_0_0.hideRemasterPanel(arg_233_0)
	if arg_233_0.levelRemasterView:isShowing() then
		arg_233_0.levelRemasterView:ActionInvoke("Hide")
	end
end

function var_0_0.initGrid(arg_234_0, arg_234_1)
	local var_234_0 = arg_234_0.contextData.chapterVO

	if not var_234_0 then
		return
	end

	arg_234_0:enableLevelCamera()
	setActive(arg_234_0.uiMain, true)

	arg_234_0.levelGrid.localEulerAngles = Vector3(var_234_0.theme.angle, 0, 0)
	arg_234_0.grid = LevelGrid.New(arg_234_0.dragLayer)

	arg_234_0.grid:attach(arg_234_0)
	arg_234_0.grid:ExtendItem("shipTpl", arg_234_0.shipTpl)
	arg_234_0.grid:ExtendItem("subTpl", arg_234_0.subTpl)
	arg_234_0.grid:ExtendItem("transportTpl", arg_234_0.transportTpl)
	arg_234_0.grid:ExtendItem("enemyTpl", arg_234_0.enemyTpl)
	arg_234_0.grid:ExtendItem("championTpl", arg_234_0.championTpl)
	arg_234_0.grid:ExtendItem("oniTpl", arg_234_0.oniTpl)
	arg_234_0.grid:ExtendItem("arrowTpl", arg_234_0.arrowTarget)
	arg_234_0.grid:ExtendItem("destinationMarkTpl", arg_234_0.destinationMarkTpl)

	function arg_234_0.grid.onShipStepChange(arg_235_0)
		arg_234_0.levelStageView:updateAmbushRate(arg_235_0)
	end

	arg_234_0.grid:initAll(arg_234_1)
end

function var_0_0.destroyGrid(arg_236_0)
	if arg_236_0.grid then
		arg_236_0.grid:detach()

		arg_236_0.grid = nil

		arg_236_0:disableLevelCamera()
		setActive(arg_236_0.dragLayer, true)
		setActive(arg_236_0.uiMain, false)
	end
end

function var_0_0.doTracking(arg_237_0, arg_237_1)
	arg_237_0:frozen()

	local function var_237_0()
		arg_237_0.radar:SetActive(true)

		local var_238_0 = tf(arg_237_0.radar)

		var_238_0:SetParent(arg_237_0.topPanel, false)
		var_238_0:SetSiblingIndex(1)
		var_238_0:GetComponent("DftAniEvent"):SetEndEvent(function(arg_239_0)
			arg_237_0.radar:SetActive(false)
			arg_237_0:unfrozen()
			arg_237_1()
		end)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WEIGHANCHOR_SEARCH)
	end

	if not arg_237_0.radar then
		PoolMgr.GetInstance():GetUI("RadarEffectUI", true, function(arg_240_0)
			arg_240_0:SetActive(true)

			arg_237_0.radar = arg_240_0

			var_237_0()
		end)
	else
		var_237_0()
	end
end

function var_0_0.destroyTracking(arg_241_0)
	if arg_241_0.radar then
		PoolMgr.GetInstance():ReturnUI("RadarEffectUI", arg_241_0.radar)

		arg_241_0.radar = nil
	end
end

function var_0_0.doPlayAirStrike(arg_242_0, arg_242_1, arg_242_2, arg_242_3)
	local function var_242_0()
		arg_242_0.playing = true

		arg_242_0:frozen()
		arg_242_0.airStrike:SetActive(true)

		local var_243_0 = tf(arg_242_0.airStrike)

		var_243_0:SetParent(pg.UIMgr.GetInstance().OverlayMain.transform, false)
		var_243_0:SetAsLastSibling()
		setActive(var_243_0:Find("words/be_striked"), arg_242_1 == ChapterConst.SubjectChampion)
		setActive(var_243_0:Find("words/strike_enemy"), arg_242_1 == ChapterConst.SubjectPlayer)

		local function var_243_1()
			arg_242_0.playing = false

			SetActive(arg_242_0.airStrike, false)

			if arg_242_3 then
				arg_242_3()
			end

			arg_242_0:unfrozen()
		end

		var_243_0:GetComponent("DftAniEvent"):SetEndEvent(var_243_1)

		if arg_242_2 then
			onButton(arg_242_0, var_243_0, var_243_1, SFX_PANEL)
		else
			removeOnButton(var_243_0)
		end

		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
	end

	if not arg_242_0.airStrike then
		PoolMgr.GetInstance():GetUI("AirStrike", true, function(arg_245_0)
			arg_245_0:SetActive(true)

			arg_242_0.airStrike = arg_245_0

			var_242_0()
		end)
	else
		var_242_0()
	end
end

function var_0_0.destroyAirStrike(arg_246_0)
	if arg_246_0.airStrike then
		arg_246_0.airStrike:GetComponent("DftAniEvent"):SetEndEvent(nil)
		PoolMgr.GetInstance():ReturnUI("AirStrike", arg_246_0.airStrike)

		arg_246_0.airStrike = nil
	end
end

function var_0_0.doPlayAnim(arg_247_0, arg_247_1, arg_247_2, arg_247_3)
	arg_247_0.uiAnims = arg_247_0.uiAnims or {}

	local var_247_0 = arg_247_0.uiAnims[arg_247_1]

	local function var_247_1()
		arg_247_0.playing = true

		arg_247_0:frozen()
		var_247_0:SetActive(true)

		local var_248_0 = tf(var_247_0)

		pg.UIMgr.GetInstance():OverlayPanel(var_248_0, {
			groupName = LayerWeightConst.GROUP_LEVELUI
		})

		if arg_247_3 then
			arg_247_3(var_247_0)
		end

		var_248_0:GetComponent("DftAniEvent"):SetEndEvent(function(arg_249_0)
			arg_247_0.playing = false

			pg.UIMgr.GetInstance():UnOverlayPanel(var_248_0, arg_247_0._tf)

			if arg_247_2 then
				arg_247_2(var_247_0)
			end

			arg_247_0:unfrozen()
		end)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
	end

	if not var_247_0 then
		PoolMgr.GetInstance():GetUI(arg_247_1, true, function(arg_250_0)
			arg_250_0:SetActive(true)

			arg_247_0.uiAnims[arg_247_1] = arg_250_0
			var_247_0 = arg_247_0.uiAnims[arg_247_1]

			var_247_1()
		end)
	else
		var_247_1()
	end
end

function var_0_0.destroyUIAnims(arg_251_0)
	if arg_251_0.uiAnims then
		for iter_251_0, iter_251_1 in pairs(arg_251_0.uiAnims) do
			pg.UIMgr.GetInstance():UnOverlayPanel(tf(iter_251_1), arg_251_0._tf)
			iter_251_1:GetComponent("DftAniEvent"):SetEndEvent(nil)
			PoolMgr.GetInstance():ReturnUI(iter_251_0, iter_251_1)
		end

		arg_251_0.uiAnims = nil
	end
end

function var_0_0.doPlayTorpedo(arg_252_0, arg_252_1)
	local function var_252_0()
		arg_252_0.playing = true

		arg_252_0:frozen()
		arg_252_0.torpetoAni:SetActive(true)

		local var_253_0 = tf(arg_252_0.torpetoAni)

		var_253_0:SetParent(arg_252_0.topPanel, false)
		var_253_0:SetAsLastSibling()
		var_253_0:GetComponent("DftAniEvent"):SetEndEvent(function(arg_254_0)
			arg_252_0.playing = false

			SetActive(arg_252_0.torpetoAni, false)

			if arg_252_1 then
				arg_252_1()
			end

			arg_252_0:unfrozen()
		end)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_UI_WARNING)
	end

	if not arg_252_0.torpetoAni then
		PoolMgr.GetInstance():GetUI("Torpeto", true, function(arg_255_0)
			arg_255_0:SetActive(true)

			arg_252_0.torpetoAni = arg_255_0

			var_252_0()
		end)
	else
		var_252_0()
	end
end

function var_0_0.destroyTorpedo(arg_256_0)
	if arg_256_0.torpetoAni then
		arg_256_0.torpetoAni:GetComponent("DftAniEvent"):SetEndEvent(nil)
		PoolMgr.GetInstance():ReturnUI("Torpeto", arg_256_0.torpetoAni)

		arg_256_0.torpetoAni = nil
	end
end

function var_0_0.doPlayStrikeAnim(arg_257_0, arg_257_1, arg_257_2, arg_257_3)
	arg_257_0.strikeAnims = arg_257_0.strikeAnims or {}

	local var_257_0
	local var_257_1
	local var_257_2

	local function var_257_3()
		if coroutine.status(var_257_2) == "suspended" then
			local var_258_0, var_258_1 = coroutine.resume(var_257_2)

			assert(var_258_0, debug.traceback(var_257_2, var_258_1))
		end
	end

	var_257_2 = coroutine.create(function()
		arg_257_0.playing = true

		arg_257_0:frozen()

		local var_259_0 = arg_257_0.strikeAnims[arg_257_2]

		setActive(var_259_0, true)

		local var_259_1 = tf(var_259_0)
		local var_259_2 = findTF(var_259_1, "torpedo")
		local var_259_3 = findTF(var_259_1, "mask/painting")
		local var_259_4 = findTF(var_259_1, "ship")

		setParent(var_257_0, var_259_3:Find("fitter"), false)
		setParent(var_257_1, var_259_4, false)
		setActive(var_259_4, false)
		setActive(var_259_2, false)
		var_259_1:SetParent(pg.UIMgr.GetInstance().OverlayMain.transform, false)
		var_259_1:SetAsLastSibling()

		local var_259_5 = var_259_1:GetComponent("DftAniEvent")
		local var_259_6 = var_257_1:GetComponent("SpineAnimUI")
		local var_259_7 = var_259_6:GetComponent("SkeletonGraphic")

		var_259_5:SetStartEvent(function(arg_260_0)
			var_259_6:SetAction("attack", 0)

			var_259_7.freeze = true
		end)
		var_259_5:SetTriggerEvent(function(arg_261_0)
			var_259_7.freeze = false

			var_259_6:SetActionCallBack(function(arg_262_0)
				if arg_262_0 == "action" then
					-- block empty
				elseif arg_262_0 == "finish" then
					var_259_7.freeze = true
				end
			end)
		end)
		var_259_5:SetEndEvent(function(arg_263_0)
			var_259_7.freeze = false

			var_257_3()
		end)
		onButton(arg_257_0, var_259_1, var_257_3, SFX_CANCEL)
		coroutine.yield()
		retPaintingPrefab(var_259_3, arg_257_1:getPainting())
		var_259_6:SetActionCallBack(nil)

		var_259_7.freeze = false

		PoolMgr.GetInstance():ReturnSpineChar(arg_257_1:getPrefab(), var_257_1)
		setActive(var_259_0, false)

		arg_257_0.playing = false

		arg_257_0:unfrozen()

		if arg_257_3 then
			arg_257_3()
		end
	end)

	local function var_257_4()
		if arg_257_0.strikeAnims[arg_257_2] and var_257_0 and var_257_1 then
			var_257_3()
		end
	end

	PoolMgr.GetInstance():GetPainting(arg_257_1:getPainting(), true, function(arg_265_0)
		var_257_0 = arg_265_0

		ShipExpressionHelper.SetExpression(var_257_0, arg_257_1:getPainting())
		var_257_4()
	end)
	PoolMgr.GetInstance():GetSpineChar(arg_257_1:getPrefab(), true, function(arg_266_0)
		var_257_1 = arg_266_0
		var_257_1.transform.localScale = Vector3.one

		var_257_4()
	end)

	if not arg_257_0.strikeAnims[arg_257_2] then
		PoolMgr.GetInstance():GetUI(arg_257_2, true, function(arg_267_0)
			arg_257_0.strikeAnims[arg_257_2] = arg_267_0

			var_257_4()
		end)
	end
end

function var_0_0.destroyStrikeAnim(arg_268_0)
	if arg_268_0.strikeAnims then
		for iter_268_0, iter_268_1 in pairs(arg_268_0.strikeAnims) do
			iter_268_1:GetComponent("DftAniEvent"):SetEndEvent(nil)
			PoolMgr.GetInstance():ReturnUI(iter_268_0, iter_268_1)
		end

		arg_268_0.strikeAnims = nil
	end
end

function var_0_0.doPlayEnemyAnim(arg_269_0, arg_269_1, arg_269_2, arg_269_3)
	arg_269_0.strikeAnims = arg_269_0.strikeAnims or {}

	local var_269_0
	local var_269_1

	local function var_269_2()
		if coroutine.status(var_269_1) == "suspended" then
			local var_270_0, var_270_1 = coroutine.resume(var_269_1)

			assert(var_270_0, debug.traceback(var_269_1, var_270_1))
		end
	end

	var_269_1 = coroutine.create(function()
		arg_269_0.playing = true

		arg_269_0:frozen()

		local var_271_0 = arg_269_0.strikeAnims[arg_269_2]

		setActive(var_271_0, true)

		local var_271_1 = tf(var_271_0)
		local var_271_2 = findTF(var_271_1, "torpedo")
		local var_271_3 = findTF(var_271_1, "ship")

		setParent(var_269_0, var_271_3, false)
		setActive(var_271_3, false)
		setActive(var_271_2, false)
		var_271_1:SetParent(pg.UIMgr.GetInstance().OverlayMain.transform, false)
		var_271_1:SetAsLastSibling()

		local var_271_4 = var_271_1:GetComponent("DftAniEvent")
		local var_271_5 = var_269_0:GetComponent("SpineAnimUI")
		local var_271_6 = var_271_5:GetComponent("SkeletonGraphic")

		var_271_4:SetStartEvent(function(arg_272_0)
			var_271_5:SetAction("attack", 0)

			var_271_6.freeze = true
		end)
		var_271_4:SetTriggerEvent(function(arg_273_0)
			var_271_6.freeze = false

			var_271_5:SetActionCallBack(function(arg_274_0)
				if arg_274_0 == "action" then
					-- block empty
				elseif arg_274_0 == "finish" then
					var_271_6.freeze = true
				end
			end)
		end)
		var_271_4:SetEndEvent(function(arg_275_0)
			var_271_6.freeze = false

			var_269_2()
		end)
		onButton(arg_269_0, var_271_1, var_269_2, SFX_CANCEL)
		coroutine.yield()
		var_271_5:SetActionCallBack(nil)

		var_271_6.freeze = false

		PoolMgr.GetInstance():ReturnSpineChar(arg_269_1:getPrefab(), var_269_0)
		setActive(var_271_0, false)

		arg_269_0.playing = false

		arg_269_0:unfrozen()

		if arg_269_3 then
			arg_269_3()
		end
	end)

	local function var_269_3()
		if arg_269_0.strikeAnims[arg_269_2] and var_269_0 then
			var_269_2()
		end
	end

	PoolMgr.GetInstance():GetSpineChar(arg_269_1:getPrefab(), true, function(arg_277_0)
		var_269_0 = arg_277_0
		var_269_0.transform.localScale = Vector3.one

		var_269_3()
	end)

	if not arg_269_0.strikeAnims[arg_269_2] then
		PoolMgr.GetInstance():GetUI(arg_269_2, true, function(arg_278_0)
			arg_269_0.strikeAnims[arg_269_2] = arg_278_0

			var_269_3()
		end)
	end
end

function var_0_0.doPlayCommander(arg_279_0, arg_279_1, arg_279_2)
	arg_279_0:frozen()
	setActive(arg_279_0.commanderTinkle, true)

	local var_279_0 = arg_279_1:getSkills()

	setText(arg_279_0.commanderTinkle:Find("name"), #var_279_0 > 0 and var_279_0[1]:getConfig("name") or "")
	setImageSprite(arg_279_0.commanderTinkle:Find("icon"), GetSpriteFromAtlas("commanderhrz/" .. arg_279_1:getConfig("painting"), ""))

	local var_279_1 = arg_279_0.commanderTinkle:GetComponent(typeof(CanvasGroup))

	var_279_1.alpha = 0

	local var_279_2 = Vector2(248, 237)

	LeanTween.value(go(arg_279_0.commanderTinkle), 0, 1, 0.5):setOnUpdate(System.Action_float(function(arg_280_0)
		local var_280_0 = arg_279_0.commanderTinkle.localPosition

		var_280_0.x = var_279_2.x + -100 * (1 - arg_280_0)
		arg_279_0.commanderTinkle.localPosition = var_280_0
		var_279_1.alpha = arg_280_0
	end)):setEase(LeanTweenType.easeOutSine)
	LeanTween.value(go(arg_279_0.commanderTinkle), 0, 1, 0.3):setDelay(0.7):setOnUpdate(System.Action_float(function(arg_281_0)
		local var_281_0 = arg_279_0.commanderTinkle.localPosition

		var_281_0.x = var_279_2.x + 100 * arg_281_0
		arg_279_0.commanderTinkle.localPosition = var_281_0
		var_279_1.alpha = 1 - arg_281_0
	end)):setOnComplete(System.Action(function()
		if arg_279_2 then
			arg_279_2()
		end

		arg_279_0:unfrozen()
	end))
end

function var_0_0.strikeEnemy(arg_283_0, arg_283_1, arg_283_2, arg_283_3)
	local var_283_0 = arg_283_0.grid:shakeCell(arg_283_1)

	if not var_283_0 then
		arg_283_3()

		return
	end

	arg_283_0:easeDamage(var_283_0, arg_283_2, function()
		arg_283_3()
	end)
end

function var_0_0.easeDamage(arg_285_0, arg_285_1, arg_285_2, arg_285_3)
	arg_285_0:frozen()

	local var_285_0 = arg_285_0.levelCam:WorldToScreenPoint(arg_285_1.position)
	local var_285_1 = tf(arg_285_0:GetDamageText())

	var_285_1.position = arg_285_0.uiCam:ScreenToWorldPoint(var_285_0)

	local var_285_2 = var_285_1.localPosition

	var_285_2.y = var_285_2.y + 40
	var_285_2.z = 0

	setText(var_285_1, arg_285_2)

	var_285_1.localPosition = var_285_2

	LeanTween.value(go(var_285_1), 0, 1, 1):setOnUpdate(System.Action_float(function(arg_286_0)
		local var_286_0 = var_285_1.localPosition

		var_286_0.y = var_285_2.y + 60 * arg_286_0
		var_285_1.localPosition = var_286_0

		setTextAlpha(var_285_1, 1 - arg_286_0)
	end)):setOnComplete(System.Action(function()
		arg_285_0:ReturnDamageText(var_285_1)
		arg_285_0:unfrozen()

		if arg_285_3 then
			arg_285_3()
		end
	end))
end

function var_0_0.easeAvoid(arg_288_0, arg_288_1, arg_288_2)
	arg_288_0:frozen()

	local var_288_0 = arg_288_0.levelCam:WorldToScreenPoint(arg_288_1)

	arg_288_0.avoidText.position = arg_288_0.uiCam:ScreenToWorldPoint(var_288_0)

	local var_288_1 = arg_288_0.avoidText.localPosition

	var_288_1.z = 0
	arg_288_0.avoidText.localPosition = var_288_1

	setActive(arg_288_0.avoidText, true)

	local var_288_2 = arg_288_0.avoidText:Find("avoid")

	LeanTween.value(go(arg_288_0.avoidText), 0, 1, 1):setOnUpdate(System.Action_float(function(arg_289_0)
		local var_289_0 = arg_288_0.avoidText.localPosition

		var_289_0.y = var_288_1.y + 100 * arg_289_0
		arg_288_0.avoidText.localPosition = var_289_0

		setImageAlpha(arg_288_0.avoidText, 1 - arg_289_0)
		setImageAlpha(var_288_2, 1 - arg_289_0)
	end)):setOnComplete(System.Action(function()
		setActive(arg_288_0.avoidText, false)
		arg_288_0:unfrozen()

		if arg_288_2 then
			arg_288_2()
		end
	end))
end

function var_0_0.GetDamageText(arg_291_0)
	local var_291_0 = table.remove(arg_291_0.damageTextPool)

	if not var_291_0 then
		var_291_0 = Instantiate(arg_291_0.damageTextTemplate)

		local var_291_1 = tf(arg_291_0.damageTextTemplate):GetSiblingIndex()

		setParent(var_291_0, tf(arg_291_0.damageTextTemplate).parent)
		tf(var_291_0):SetSiblingIndex(var_291_1 + 1)
	end

	table.insert(arg_291_0.damageTextActive, var_291_0)
	setActive(var_291_0, true)

	return var_291_0
end

function var_0_0.ReturnDamageText(arg_292_0, arg_292_1)
	assert(arg_292_1)

	if not arg_292_1 then
		return
	end

	arg_292_1 = go(arg_292_1)

	table.removebyvalue(arg_292_0.damageTextActive, arg_292_1)
	table.insert(arg_292_0.damageTextPool, arg_292_1)
	setActive(arg_292_1, false)
end

function var_0_0.resetLevelGrid(arg_293_0)
	arg_293_0.dragLayer.localPosition = Vector3.zero
end

function var_0_0.ShowCurtains(arg_294_0, arg_294_1)
	setActive(arg_294_0.curtain, arg_294_1)
end

function var_0_0.frozen(arg_295_0)
	local var_295_0 = arg_295_0.frozenCount

	arg_295_0.frozenCount = arg_295_0.frozenCount + 1
	arg_295_0.canvasGroup.blocksRaycasts = arg_295_0.frozenCount == 0

	if var_295_0 == 0 and arg_295_0.frozenCount ~= 0 then
		arg_295_0:emit(LevelUIConst.ON_FROZEN)
	end
end

function var_0_0.unfrozen(arg_296_0, arg_296_1)
	if arg_296_0.exited then
		return
	end

	local var_296_0 = arg_296_0.frozenCount
	local var_296_1 = arg_296_1 == -1 and arg_296_0.frozenCount or arg_296_1 or 1

	arg_296_0.frozenCount = arg_296_0.frozenCount - var_296_1
	arg_296_0.canvasGroup.blocksRaycasts = arg_296_0.frozenCount == 0

	if var_296_0 ~= 0 and arg_296_0.frozenCount == 0 then
		arg_296_0:emit(LevelUIConst.ON_UNFROZEN)
	end
end

function var_0_0.isfrozen(arg_297_0)
	return arg_297_0.frozenCount > 0
end

function var_0_0.enableLevelCamera(arg_298_0)
	arg_298_0.levelCamIndices = math.max(arg_298_0.levelCamIndices - 1, 0)

	if arg_298_0.levelCamIndices == 0 then
		arg_298_0.levelCam.enabled = true

		pg.LayerWeightMgr.GetInstance():switchOriginParent()
	end
end

function var_0_0.disableLevelCamera(arg_299_0)
	arg_299_0.levelCamIndices = arg_299_0.levelCamIndices + 1

	if arg_299_0.levelCamIndices > 0 then
		arg_299_0.levelCam.enabled = false

		pg.LayerWeightMgr.GetInstance():switchOriginParent()
	end
end

function var_0_0.RecordTween(arg_300_0, arg_300_1, arg_300_2)
	arg_300_0.tweens[arg_300_1] = arg_300_2
end

function var_0_0.DeleteTween(arg_301_0, arg_301_1)
	local var_301_0 = arg_301_0.tweens[arg_301_1]

	if var_301_0 then
		LeanTween.cancel(var_301_0)

		arg_301_0.tweens[arg_301_1] = nil
	end
end

function var_0_0.openCommanderPanel(arg_302_0, arg_302_1, arg_302_2, arg_302_3)
	local var_302_0 = arg_302_2.id

	arg_302_0.levelCMDFormationView:setCallback(function(arg_303_0)
		if not arg_302_3 then
			if arg_303_0.type == LevelUIConst.COMMANDER_OP_SHOW_SKILL then
				arg_302_0:emit(LevelMediator2.ON_COMMANDER_SKILL, arg_303_0.skill)
			elseif arg_303_0.type == LevelUIConst.COMMANDER_OP_ADD then
				arg_302_0.contextData.commanderSelected = {
					chapterId = var_302_0,
					fleetId = arg_302_1.id
				}

				arg_302_0:emit(LevelMediator2.ON_SELECT_COMMANDER, arg_303_0.pos, arg_302_1.id, arg_302_2)
				arg_302_0:closeCommanderPanel()
			else
				arg_302_0:emit(LevelMediator2.ON_COMMANDER_OP, {
					FleetType = LevelUIConst.FLEET_TYPE_SELECT,
					data = arg_303_0,
					fleetId = arg_302_1.id,
					chapterId = var_302_0
				}, arg_302_2)
			end
		elseif arg_303_0.type == LevelUIConst.COMMANDER_OP_SHOW_SKILL then
			arg_302_0:emit(LevelMediator2.ON_COMMANDER_SKILL, arg_303_0.skill)
		elseif arg_303_0.type == LevelUIConst.COMMANDER_OP_ADD then
			arg_302_0.contextData.eliteCommanderSelected = {
				index = arg_302_3,
				pos = arg_303_0.pos,
				chapterId = var_302_0
			}

			arg_302_0:emit(LevelMediator2.ON_SELECT_ELITE_COMMANDER, arg_302_3, arg_303_0.pos, arg_302_2)
			arg_302_0:closeCommanderPanel()
		else
			arg_302_0:emit(LevelMediator2.ON_COMMANDER_OP, {
				FleetType = LevelUIConst.FLEET_TYPE_EDIT,
				data = arg_303_0,
				index = arg_302_3,
				chapterId = var_302_0
			}, arg_302_2)
		end
	end)
	arg_302_0.levelCMDFormationView:Load()
	arg_302_0.levelCMDFormationView:ActionInvoke("update", arg_302_1, arg_302_0.commanderPrefabs)
	arg_302_0.levelCMDFormationView:ActionInvoke("Show")
end

function var_0_0.updateCommanderPrefab(arg_304_0)
	if arg_304_0.levelCMDFormationView:isShowing() then
		arg_304_0.levelCMDFormationView:ActionInvoke("updatePrefabs", arg_304_0.commanderPrefabs)
	end
end

function var_0_0.closeCommanderPanel(arg_305_0)
	arg_305_0.levelCMDFormationView:ActionInvoke("Hide")
end

function var_0_0.destroyCommanderPanel(arg_306_0)
	arg_306_0.levelCMDFormationView:Destroy()

	arg_306_0.levelCMDFormationView = nil
end

function var_0_0.setSpecialOperationTickets(arg_307_0, arg_307_1)
	arg_307_0.spTickets = arg_307_1
end

function var_0_0.HandleShowMsgBox(arg_308_0, arg_308_1)
	pg.MsgboxMgr.GetInstance():ShowMsgBox(arg_308_1)
end

function var_0_0.updatePoisonAreaTip(arg_309_0)
	local var_309_0 = arg_309_0.contextData.chapterVO
	local var_309_1 = (function(arg_310_0)
		local var_310_0 = {}
		local var_310_1 = pg.map_event_list[var_309_0.id] or {}
		local var_310_2

		if var_309_0:isLoop() then
			var_310_2 = var_310_1.event_list_loop or {}
		else
			var_310_2 = var_310_1.event_list or {}
		end

		for iter_310_0, iter_310_1 in ipairs(var_310_2) do
			local var_310_3 = pg.map_event_template[iter_310_1]

			if var_310_3.c_type == arg_310_0 then
				table.insert(var_310_0, var_310_3)
			end
		end

		return var_310_0
	end)(ChapterConst.EvtType_Poison)

	if var_309_1 then
		for iter_309_0, iter_309_1 in ipairs(var_309_1) do
			local var_309_2 = iter_309_1.round_gametip

			if var_309_2 ~= nil and var_309_2 ~= "" and var_309_0:getRoundNum() == var_309_2[1] then
				pg.TipsMgr.GetInstance():ShowTips(i18n(var_309_2[2]))
			end
		end
	end
end

function var_0_0.updateVoteBookBtn(arg_311_0)
	setActive(arg_311_0._voteBookBtn, false)
end

function var_0_0.RecordLastMapOnExit(arg_312_0)
	local var_312_0 = getProxy(ChapterProxy)

	if var_312_0 and not arg_312_0.contextData.noRecord then
		local var_312_1 = arg_312_0.contextData.map

		if not var_312_1 then
			return
		end

		if var_312_1:NeedRecordMap() then
			var_312_0:recordLastMap(ChapterProxy.LAST_MAP, var_312_1.id)
		end

		if var_312_1:isActivity() and not var_312_1:isActExtra() then
			var_312_0:recordLastMap(ChapterProxy.LAST_MAP_FOR_ACTIVITY, var_312_1.id)
		end
	end
end

function var_0_0.IsActShopActive(arg_313_0)
	local var_313_0 = pg.gameset.activity_res_id.key_value
	local var_313_1 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_LOTTERY)

	if var_313_1 and not var_313_1:isEnd() and var_313_1:getConfig("config_client").resId == var_313_0 then
		return true
	end

	if _.detect(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_SHOP), function(arg_314_0)
		return not arg_314_0:isEnd() and arg_314_0:getConfig("config_client").pt_id == var_313_0
	end) then
		return true
	end
end

function var_0_0.willExit(arg_315_0)
	arg_315_0:ClearMapTransitions()
	arg_315_0.loader:Clear()

	if arg_315_0.contextData.chapterVO then
		pg.UIMgr.GetInstance():UnblurPanel(arg_315_0.topPanel, arg_315_0._tf)
		pg.playerResUI:SetActive({
			active = false
		})
	end

	if arg_315_0.levelFleetView and arg_315_0.levelFleetView.selectIds then
		arg_315_0.contextData.selectedFleetIDs = {}

		for iter_315_0, iter_315_1 in pairs(arg_315_0.levelFleetView.selectIds) do
			for iter_315_2, iter_315_3 in pairs(iter_315_1) do
				arg_315_0.contextData.selectedFleetIDs[#arg_315_0.contextData.selectedFleetIDs + 1] = iter_315_3
			end
		end
	end

	arg_315_0:destroyChapterPanel()
	arg_315_0:DestroyLevelInfoSPPanel()
	arg_315_0:destroyFleetEdit()
	arg_315_0:destroyCommanderPanel()
	arg_315_0:DestroyLevelStageView()
	arg_315_0:hideRepairWindow()
	arg_315_0:hideStrategyInfo()
	arg_315_0:hideRemasterPanel()
	arg_315_0:hideSpResult()
	arg_315_0:destroyGrid()
	arg_315_0:destroyAmbushWarn()
	arg_315_0:destroyAirStrike()
	arg_315_0:destroyTorpedo()
	arg_315_0:destroyStrikeAnim()
	arg_315_0:destroyTracking()
	arg_315_0:destroyUIAnims()
	PoolMgr.GetInstance():DestroyPrefab("chapter/cell_quad_mark", "")
	PoolMgr.GetInstance():DestroyPrefab("chapter/cell_quad", "")
	PoolMgr.GetInstance():DestroyPrefab("chapter/cell", "")
	PoolMgr.GetInstance():DestroyPrefab("chapter/plane", "")

	for iter_315_4, iter_315_5 in pairs(arg_315_0.mbDict) do
		iter_315_5:Destroy()
	end

	arg_315_0.mbDict = nil

	for iter_315_6, iter_315_7 in pairs(arg_315_0.tweens) do
		LeanTween.cancel(iter_315_7)
	end

	arg_315_0.tweens = nil

	if arg_315_0.cloudTimer then
		_.each(arg_315_0.cloudTimer, function(arg_316_0)
			LeanTween.cancel(arg_316_0)
		end)

		arg_315_0.cloudTimer = nil
	end

	if arg_315_0.newChapterCDTimer then
		arg_315_0.newChapterCDTimer:Stop()

		arg_315_0.newChapterCDTimer = nil
	end

	for iter_315_8, iter_315_9 in ipairs(arg_315_0.damageTextActive) do
		LeanTween.cancel(iter_315_9)
	end

	LeanTween.cancel(go(arg_315_0.avoidText))

	arg_315_0.map.localScale = Vector3.one
	arg_315_0.map.pivot = Vector2(0.5, 0.5)
	arg_315_0.float.localScale = Vector3.one
	arg_315_0.float.pivot = Vector2(0.5, 0.5)

	for iter_315_10, iter_315_11 in ipairs(arg_315_0.mapTFs) do
		clearImageSprite(iter_315_11)
	end

	_.each(arg_315_0.cloudRTFs, function(arg_317_0)
		clearImageSprite(arg_317_0)
	end)
	PoolMgr.GetInstance():DestroyAllSprite()
	Destroy(arg_315_0.enemyTpl)
	arg_315_0:RecordLastMapOnExit()
	arg_315_0.levelRemasterView:Destroy()
end

return var_0_0
