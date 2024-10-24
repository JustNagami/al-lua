local var_0_0 = class("InstagramChatLayer", import("...base.BaseUI"))
local var_0_1 = pg.activity_ins_ship_group_template
local var_0_2 = pg.activity_ins_redpackage
local var_0_3 = pg.emoji_template

function var_0_0.getUIName(arg_1_0)
	return "InstagramChatUI"
end

var_0_0.ReadType = {
	"all",
	"hasReaded",
	"waitingForRead"
}
var_0_0.TypeType = {
	"all",
	"single",
	"multiple"
}
var_0_0.CampIds = {
	0,
	1,
	2,
	3,
	4,
	5,
	6,
	7,
	8,
	9,
	10,
	11
}
var_0_0.CampNames = {
	"word_shipNation_all",
	"word_shipNation_baiYing",
	"word_shipNation_huangJia",
	"word_shipNation_chongYing",
	"word_shipNation_tieXue",
	"word_shipNation_dongHuang",
	"word_shipNation_saDing",
	"word_shipNation_beiLian",
	"word_shipNation_ziyou",
	"word_shipNation_weixi",
	"word_shipNation_mot",
	"word_shipNation_other"
}

function var_0_0.init(arg_2_0)
	arg_2_0.leftPanel = arg_2_0:findTF("main/leftPanel")
	arg_2_0.filterBtn = arg_2_0:findTF("leftTop/filter", arg_2_0.leftPanel)
	arg_2_0.isFiltered = arg_2_0:findTF("isFiltered", arg_2_0.filterBtn)
	arg_2_0.charaList = UIItemList.New(arg_2_0:findTF("charaScroll/Viewport/Content", arg_2_0.leftPanel), arg_2_0:findTF("charaScroll/Viewport/Content/charaMsg", arg_2_0.leftPanel))
	arg_2_0.rightPanel = arg_2_0:findTF("main/rightPanel")
	arg_2_0.characterName = arg_2_0:findTF("rightTop/name", arg_2_0.rightPanel)
	arg_2_0.careBtn = arg_2_0:findTF("rightTop/careBtn", arg_2_0.rightPanel)
	arg_2_0.topicBtn = arg_2_0:findTF("rightTop/topicBtn", arg_2_0.rightPanel)
	arg_2_0.backgroundBtn = arg_2_0:findTF("rightTop/backgroundBtn", arg_2_0.rightPanel)
	arg_2_0.messageList = UIItemList.New(arg_2_0:findTF("messageScroll/Viewport/Content", arg_2_0.rightPanel), arg_2_0:findTF("messageScroll/Viewport/Content/messageCard", arg_2_0.rightPanel))
	arg_2_0.optionPanel = arg_2_0:findTF("optionPanel", arg_2_0.rightPanel)
	arg_2_0.optionList = UIItemList.New(arg_2_0.optionPanel, arg_2_0:findTF("option", arg_2_0.optionPanel))
	arg_2_0.filterUI = arg_2_0:findTF("subPages/InstagramFilterUI")
	arg_2_0.topicUI = arg_2_0:findTF("subPages/InstagramTopicUI")
	arg_2_0.backgroundUI = arg_2_0:findTF("subPages/InstagramBackgroundUI")
	arg_2_0.redPacketUI = arg_2_0:findTF("subPages/InstagramRedPacketUI")

	setText(arg_2_0:findTF("Text", arg_2_0.filterBtn), i18n("juuschat_filter_title"))
	setText(arg_2_0:findTF("panel/filterScroll/Viewport/Content/read/subTitleFrame/subTitle", arg_2_0.filterUI), i18n("juuschat_filter_subtitle1"))
	setText(arg_2_0:findTF("panel/filterScroll/Viewport/Content/type/subTitleFrame/subTitle", arg_2_0.filterUI), i18n("juuschat_filter_subtitle2"))
	setText(arg_2_0:findTF("panel/filterScroll/Viewport/Content/subTitleFrame/subTitle", arg_2_0.filterUI), i18n("juuschat_filter_subtitle3"))
	setText(arg_2_0:findTF("panel/filterScroll/Viewport/Content/read/option/Text", arg_2_0.filterUI), i18n("juuschat_filter_tip1"))
	setText(arg_2_0:findTF("panel/filterScroll/Viewport/Content/read/option_1/Text", arg_2_0.filterUI), i18n("juuschat_filter_tip2"))
	setText(arg_2_0:findTF("panel/filterScroll/Viewport/Content/read/option_2/Text", arg_2_0.filterUI), i18n("juuschat_filter_tip3"))
	setText(arg_2_0:findTF("panel/filterScroll/Viewport/Content/type/option/Text", arg_2_0.filterUI), i18n("juuschat_filter_tip1"))
	setText(arg_2_0:findTF("panel/filterScroll/Viewport/Content/type/option_1/Text", arg_2_0.filterUI), i18n("juuschat_filter_tip4"))
	setText(arg_2_0:findTF("panel/filterScroll/Viewport/Content/type/option_2/Text", arg_2_0.filterUI), i18n("juuschat_filter_tip5"))
	setText(arg_2_0:findTF("panel/topicScroll/Viewport/Content/topic/waiting", arg_2_0.topicUI), i18n("juuschat_chattip3"))
	setText(arg_2_0:findTF("panel/topicScroll/Viewport/Content/topic/selected/Text", arg_2_0.topicUI), i18n("juuschat_label2"))
	setText(arg_2_0:findTF("panel/backgroundScroll/Viewport/Content/background/selected/Text", arg_2_0.backgroundUI), i18n("juuschat_label1"))
	setText(arg_2_0:findTF("panel/detail/title", arg_2_0.redPacketUI), i18n("juuschat_redpacket_detail"))
	setText(arg_2_0:findTF("main/noFilteredMessageBg/Text"), i18n("juuschat_filter_empty"))
	setText(arg_2_0:findTF("panel/backgroundScroll/Viewport/Content/background/lockFrame/Text", arg_2_0.backgroundUI), i18n("juuschat_background_tip1"))

	arg_2_0.redPacketGot = arg_2_0:findTF("panel/got", arg_2_0.redPacketUI)

	pg.UIMgr.GetInstance():BlurPanel(arg_2_0._tf, false, {
		groupName = "Instagram",
		weight = LayerWeightConst.SECOND_LAYER
	})
	SetActive(arg_2_0.filterUI, false)
	SetActive(arg_2_0.isFiltered, false)
	SetActive(arg_2_0.topicUI, false)
	SetActive(arg_2_0.backgroundUI, false)
	SetActive(arg_2_0.redPacketUI, false)
	SetActive(arg_2_0.rightPanel, false)

	arg_2_0.timerList = {}
	arg_2_0.canFresh = false

	local var_2_0 = arg_2_0:findTF("messageScroll/Scrollbar Vertical", arg_2_0.rightPanel):GetComponent(typeof(RectTransform))

	arg_2_0.messageScrollWidth = var_2_0.rect.width
	arg_2_0.messageScrollHeight = var_2_0.rect.height

	arg_2_0:findTF("panel/title", arg_2_0.filterUI):GetComponent(typeof(Image)):SetNativeSize()
	arg_2_0:findTF("panel/title", arg_2_0.topicUI):GetComponent(typeof(Image)):SetNativeSize()
	arg_2_0:findTF("panel/title", arg_2_0.backgroundUI):GetComponent(typeof(Image)):SetNativeSize()
end

function var_0_0.didEnter(arg_3_0)
	arg_3_0:SetData()
	arg_3_0:UpdateCharaList(false, false)
	arg_3_0:SetFilterPanel()
end

function var_0_0.UpdateCharaList(arg_4_0, arg_4_1, arg_4_2)
	if not arg_4_0.chatList or #arg_4_0.chatList == 0 then
		SetActive(arg_4_0.leftPanel, false)
		SetActive(arg_4_0.rightPanel, false)
		SetActive(arg_4_0:findTF("main/noMessageBg"), true)
		SetActive(arg_4_0:findTF("main/noFilteredMessageBg"), false)
		SetActive(arg_4_0:findTF("main/rightNoMessageBg"), false)

		return
	end

	if not arg_4_0.currentChat then
		SetActive(arg_4_0.rightPanel, false)
		SetActive(arg_4_0:findTF("main/rightNoMessageBg"), true)
	else
		SetActive(arg_4_0.rightPanel, true)
		SetActive(arg_4_0:findTF("main/rightNoMessageBg"), false)
	end

	arg_4_0.charaList:make(function(arg_5_0, arg_5_1, arg_5_2)
		if arg_5_0 == UIItemList.EventUpdate then
			local var_5_0 = arg_4_0.chatList[arg_5_1 + 1]

			setImageSprite(arg_5_2:Find("charaBg/chara"), LoadSprite("qicon/" .. var_5_0.sculpture), false)
			setText(arg_5_2:Find("name"), var_5_0.name)

			local var_5_1 = var_5_0:GetDisplayWord()

			if not arg_4_0.currentChat or arg_4_0.currentChat.characterId ~= var_5_0.characterId or not arg_4_1 then
				setText(arg_5_2:Find("msg"), var_5_1)
			end

			setText(arg_5_2:Find("displayWord"), var_5_1)
			SetActive(arg_5_2:Find("care"), var_5_0.care == 1)

			if var_5_0.care == 1 and arg_4_0.careAniTriggerId and arg_4_0.careAniTriggerId == var_5_0.characterId then
				arg_4_0.careAniTriggerId = nil

				arg_5_2:Find("care"):GetComponent(typeof(Animation)):Play("anim_newinstagram_care")
			end

			if arg_4_0.currentChat then
				SetActive(arg_5_2:Find("frame"), arg_4_0.currentChat == var_5_0)
			end

			SetActive(arg_5_2:Find("tip"), var_5_0:GetCharacterEndFlag() == 0)
			setText(arg_5_2:Find("id"), var_5_0.characterId)
			onButton(arg_4_0, arg_5_2, function()
				if arg_4_0.currentChat and arg_4_0.currentChat.characterId ~= var_5_0.characterId then
					arg_4_0:ResetCharaTextFunc(arg_4_0.currentChat.characterId)
				end

				arg_4_0.currentChat = var_5_0

				SetActive(arg_4_0.rightPanel, true)
				SetActive(arg_4_0:findTF("main/rightNoMessageBg"), false)
				arg_4_0:UpdateChatContent(var_5_0, false, false)
				arg_4_0:SetTopicPanel(var_5_0)
				arg_4_0:SetBackgroundPanel(var_5_0)

				for iter_6_0, iter_6_1 in ipairs(arg_4_0.chatList) do
					SetActive(arg_4_0:findTF("frame", arg_4_0:findTF("main/leftPanel/charaScroll/Viewport/Content"):GetChild(iter_6_0 - 1)), false)
				end

				SetActive(arg_5_2:Find("frame"), true)

				function arg_4_0.cancelFrame()
					SetActive(arg_5_2:Find("frame"), false)
				end

				local var_6_0 = arg_4_0.rightPanel:GetComponent(typeof(Animation))

				var_6_0:Stop()
				var_6_0:Play("anim_newinstagram_chat_right_in")
			end, SFX_PANEL)
		end
	end)
	arg_4_0.charaList:align(#arg_4_0.chatList)
	arg_4_0:SetFilterResult()

	if arg_4_0.currentChat then
		arg_4_0:UpdateChatContent(arg_4_0.currentChat, arg_4_1, arg_4_2)
		arg_4_0:SetTopicPanel(arg_4_0.currentChat)
	end
end

function var_0_0.UpdateChatContent(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	SetActive(arg_8_0.rightPanel, true)
	setText(arg_8_0.characterName, arg_8_1.name)

	local var_8_0 = arg_8_0:findTF("care", arg_8_0.careBtn)

	SetActive(var_8_0, arg_8_1.care == 1)
	onButton(arg_8_0, arg_8_0.careBtn, function()
		local var_9_0 = arg_8_1.care == 0 and 1 or 0

		arg_8_0:emit(InstagramChatMediator.CHANGE_CARE, arg_8_1.characterId, var_9_0)

		arg_8_0.careAniTriggerId = arg_8_1.characterId
	end, SFX_PANEL)

	local var_8_1 = arg_8_0:findTF("paintingMask", arg_8_0.rightPanel)
	local var_8_2 = arg_8_0:findTF("painting", var_8_1)
	local var_8_3 = arg_8_0:findTF("groupBackground", arg_8_0.rightPanel)

	if arg_8_1.type == 1 then
		SetActive(var_8_1, true)
		SetActive(var_8_3, false)

		local var_8_4 = "unknown"

		if arg_8_1.skinId == 0 then
			var_8_4 = arg_8_1:GetPainting()
		else
			for iter_8_0, iter_8_1 in ipairs(arg_8_1.skins) do
				if iter_8_1.id == arg_8_1.skinId then
					var_8_4 = iter_8_1.painting
				end
			end
		end

		if not arg_8_0.paintingName then
			setPaintingPrefabAsync(var_8_2, var_8_4, "pifu")

			arg_8_0.paintingName = var_8_4
		elseif arg_8_0.paintingName and arg_8_0.paintingName ~= var_8_4 then
			retPaintingPrefab(var_8_2, arg_8_0.paintingName)
			setPaintingPrefabAsync(var_8_2, var_8_4, "pifu")

			arg_8_0.paintingName = var_8_4
		end
	else
		SetActive(var_8_1, false)
		SetActive(var_8_3, true)

		if arg_8_0.paintingName then
			retPaintingPrefab(var_8_2, arg_8_0.paintingName)

			arg_8_0.paintingName = nil
		end

		setImageSprite(var_8_3, LoadSprite("ui/" .. arg_8_1.groupBackground), true)
	end

	local var_8_5 = arg_8_1.currentTopic:GetDisplayWordList()

	if not arg_8_3 then
		arg_8_0:UpdateOptionPanel(arg_8_1.currentTopic, var_8_5)
		arg_8_0:UpdateMessageList(arg_8_1.currentTopic, var_8_5, arg_8_2, arg_8_1.characterId, arg_8_1.type)
	end

	if not arg_8_2 and arg_8_1.currentTopic.readFlag == 0 then
		arg_8_0:emit(InstagramChatMediator.SET_READED, {
			arg_8_1.currentTopic.topicId
		})
	end
end

function var_0_0.UpdateMessageList(arg_10_0, arg_10_1, arg_10_2, arg_10_3, arg_10_4, arg_10_5)
	arg_10_0:RemoveAllTimer()

	local var_10_0

	for iter_10_0 = #arg_10_2, 1, -1 do
		if arg_10_2[iter_10_0].ship_group == 0 or arg_10_2[iter_10_0].type == 3 and arg_10_1:RedPacketGotFlag(tonumber(arg_10_2[iter_10_0].param)) then
			var_10_0 = iter_10_0

			break
		end
	end

	local var_10_1 = {}

	if var_10_0 then
		for iter_10_1 = var_10_0, 1, -1 do
			if arg_10_2[iter_10_1].ship_group == 0 then
				table.insert(var_10_1, iter_10_1)
			else
				break
			end
		end
	end

	if arg_10_0.shouldShowOption and arg_10_3 then
		arg_10_0:SetOptionPanelActive(false)
	end

	if arg_10_3 then
		onButton(arg_10_0, arg_10_0:findTF("messageScroll", arg_10_0.rightPanel), function()
			arg_10_0:SpeedUpMessage()
		end, SFX_PANEL)
	end

	local var_10_2 = GetComponent(arg_10_0:findTF("messageScroll", arg_10_0.rightPanel), typeof(ScrollRect))

	local function var_10_3(arg_12_0)
		local var_12_0 = Vector2(0, arg_12_0)

		var_10_2.normalizedPosition = var_12_0
	end

	local var_10_4 = pg.gameset.juuschat_dialogue_trigger_time.key_value / 1000
	local var_10_5 = pg.gameset.juuschat_entering_time.key_value / 1000
	local var_10_6 = var_10_4 - var_10_5

	arg_10_0.messageList:make(function(arg_13_0, arg_13_1, arg_13_2)
		if arg_13_0 == UIItemList.EventUpdate then
			local var_13_0 = arg_10_2[arg_13_1 + 1]

			if var_13_0.ship_group == 0 and var_13_0.type == 0 then
				SetActive(arg_13_2, false)

				return
			end

			local var_13_1 = arg_13_2:Find("charaMessageCard")
			local var_13_2 = arg_13_2:Find("playerReplyCard")

			SetActive(var_13_1, var_13_0.ship_group ~= 0)
			SetActive(var_13_2, var_13_0.ship_group == 0)

			if var_13_0.ship_group ~= 0 and arg_10_5 == 2 and var_13_0.type ~= 5 then
				SetActive(arg_13_2:Find("nameBar"), true)
				setText(arg_13_2:Find("nameBar/Text"), var_0_1[var_13_0.ship_group].name)
			else
				SetActive(arg_13_2:Find("nameBar"), false)
			end

			local var_13_3

			if arg_10_3 and var_10_0 and arg_13_1 + 1 > var_10_0 then
				var_13_3 = (arg_13_1 + 1 - var_10_0) * var_10_4 - var_10_5

				if #var_10_1 > 1 then
					var_13_3 = var_13_3 + (#var_10_1 - 1) * var_10_6
				end
			end

			if var_13_0.ship_group ~= 0 then
				local var_13_4 = "unknown"

				if var_0_1[var_13_0.ship_group] then
					var_13_4 = var_0_1[var_13_0.ship_group].sculpture
				end

				if var_13_0.type ~= 5 then
					setImageSprite(arg_13_2:Find("charaMessageCard/charaBg/chara"), LoadSprite("qicon/" .. var_13_4), false)
				end

				if var_13_0.type == 1 then
					arg_10_0:SetCharaMessageCardActive(var_13_1, {
						3
					})
					setText(arg_13_2:Find("charaMessageCard/msgBox/msg"), var_13_0.param)

					if arg_10_3 and var_10_0 and arg_13_1 + 1 > var_10_0 then
						SetActive(arg_13_2, false)
						arg_10_0:StartTimer(function()
							SetActive(arg_13_2, true)
							arg_13_2:Find("charaMessageCard/charaBg"):GetComponent(typeof(Animation)):Play("anim_newinstagram_charabg")
							SetActive(arg_13_2:Find("charaMessageCard/waiting"), true)
							SetActive(arg_13_2:Find("charaMessageCard/msgBox"), false)
							Canvas.ForceUpdateCanvases()
							LeanTween.value(go(arg_10_0:findTF("messageScroll", arg_10_0.rightPanel)), var_10_2.normalizedPosition.y, 0, 0.5):setOnUpdate(System.Action_float(var_10_3)):setEase(LeanTweenType.easeInOutCubic)
							arg_10_0:StartTimer(function()
								SetActive(arg_13_2:Find("charaMessageCard/waiting"), false)
								SetActive(arg_13_2:Find("charaMessageCard/msgBox"), true)
								arg_13_2:Find("charaMessageCard/msgBox"):GetComponent(typeof(Animation)):Play("anim_newinstagram_chat_common_in")

								if arg_13_1 + 1 ~= #arg_10_2 then
									arg_10_0:ChangeCharaTextFunc(arg_10_4, var_13_0.param)
								else
									arg_10_0:emit(InstagramChatMediator.SET_READED, {
										arg_10_1.topicId
									})
								end

								Canvas.ForceUpdateCanvases()
								LeanTween.value(go(arg_10_0:findTF("messageScroll", arg_10_0.rightPanel)), var_10_2.normalizedPosition.y, 0, 0.5):setOnUpdate(System.Action_float(var_10_3)):setEase(LeanTweenType.easeInOutCubic)
								arg_10_0:SetEndAniEvent(arg_13_2:Find("charaMessageCard/msgBox"), function()
									if arg_10_0.shouldShowOption and arg_13_1 + 1 == #arg_10_2 then
										arg_10_0:SetOptionPanelActive(true)
									end
								end)
							end, var_10_5)
						end, var_13_3)
					end
				elseif var_13_0.type == 2 then
					arg_10_0:SetCharaMessageCardActive(var_13_1, {
						2,
						7
					})
					pg.CriMgr.GetInstance():GetCueInfo("cv-" .. var_13_0.ship_group, var_13_0.param[1], function(arg_17_0)
						setText(arg_13_2:Find("charaMessageCard/voiceBox/time"), tostring(math.ceil(tonumber(tostring(arg_17_0.length)) / 1000)) .. "\"")
					end)
					onButton(arg_10_0, arg_13_2:Find("charaMessageCard/voiceBox"), function()
						pg.CriMgr.GetInstance():PlaySoundEffect_V3("event:/cv/" .. var_13_0.ship_group .. "/" .. var_13_0.param[1])
					end, SFX_PANEL)
					setText(arg_13_2:Find("charaMessageCard/voiceMsgBox/voiceMsg/msg"), var_13_0.param[2])

					if arg_10_3 and var_10_0 and arg_13_1 + 1 > var_10_0 then
						SetActive(arg_13_2, false)
						arg_10_0:StartTimer(function()
							SetActive(arg_13_2, true)
							arg_13_2:Find("charaMessageCard/charaBg"):GetComponent(typeof(Animation)):Play("anim_newinstagram_charabg")
							SetActive(arg_13_2:Find("charaMessageCard/waiting"), true)
							SetActive(arg_13_2:Find("charaMessageCard/voiceBox"), false)
							SetActive(arg_13_2:Find("charaMessageCard/voiceMsgBox"), false)
							Canvas.ForceUpdateCanvases()
							LeanTween.value(go(arg_10_0:findTF("messageScroll", arg_10_0.rightPanel)), var_10_2.normalizedPosition.y, 0, 0.5):setOnUpdate(System.Action_float(var_10_3)):setEase(LeanTweenType.easeInOutCubic)
							arg_10_0:StartTimer(function()
								SetActive(arg_13_2:Find("charaMessageCard/waiting"), false)
								SetActive(arg_13_2:Find("charaMessageCard/voiceBox"), true)
								SetActive(arg_13_2:Find("charaMessageCard/voiceMsgBox"), true)
								arg_13_2:Find("charaMessageCard/voiceBox"):GetComponent(typeof(Animation)):Play("anim_newinstagram_chat_common_in")
								arg_13_2:Find("charaMessageCard/voiceMsgBox"):GetComponent(typeof(Animation)):Play("anim_newinstagram_voicetip_in")

								if arg_13_1 + 1 ~= #arg_10_2 then
									arg_10_0:ChangeCharaTextFunc(arg_10_4, "<color=#ff6666>" .. i18n("juuschat_chattip1") .. "</color>")
								else
									arg_10_0:emit(InstagramChatMediator.SET_READED, {
										arg_10_1.topicId
									})
								end

								Canvas.ForceUpdateCanvases()
								LeanTween.value(go(arg_10_0:findTF("messageScroll", arg_10_0.rightPanel)), var_10_2.normalizedPosition.y, 0, 0.5):setOnUpdate(System.Action_float(var_10_3)):setEase(LeanTweenType.easeInOutCubic)
								arg_10_0:SetEndAniEvent(arg_13_2:Find("charaMessageCard/voiceBox"), function()
									if arg_10_0.shouldShowOption and arg_13_1 + 1 == #arg_10_2 then
										arg_10_0:SetOptionPanelActive(true)
									end
								end)
							end, var_10_5)
						end, var_13_3)
					end
				elseif var_13_0.type == 3 then
					arg_10_0:SetCharaMessageCardActive(var_13_1, {
						5
					})

					local var_13_5 = var_0_2[tonumber(var_13_0.param)]

					setText(arg_13_2:Find("charaMessageCard/redPacket/desc"), var_13_5.desc)

					local var_13_6 = arg_10_1:RedPacketGotFlag(var_13_5.id)

					SetActive(arg_13_2:Find("charaMessageCard/redPacket/got"), var_13_6)
					arg_10_0:SetRedPacketPanel(arg_13_2:Find("charaMessageCard/redPacket"), var_13_5, var_13_6, var_13_4, arg_10_1.topicId, var_13_0.id)

					if arg_10_3 and var_10_0 and arg_13_1 + 1 == var_10_0 then
						arg_10_0:ChangeCharaTextFunc(arg_10_4, "<color=#ff6666>" .. i18n("juuschat_chattip2") .. "</color>" .. pg.activity_ins_redpackage[tonumber(var_13_0.param)].desc)
					end

					if arg_10_3 and var_10_0 and arg_13_1 + 1 > var_10_0 then
						SetActive(arg_13_2, false)
						arg_10_0:StartTimer(function()
							SetActive(arg_13_2, true)
							arg_13_2:Find("charaMessageCard/charaBg"):GetComponent(typeof(Animation)):Play("anim_newinstagram_charabg")
							SetActive(arg_13_2:Find("charaMessageCard/waiting"), true)
							SetActive(arg_13_2:Find("charaMessageCard/redPacket"), false)
							Canvas.ForceUpdateCanvases()
							LeanTween.value(go(arg_10_0:findTF("messageScroll", arg_10_0.rightPanel)), var_10_2.normalizedPosition.y, 0, 0.5):setOnUpdate(System.Action_float(var_10_3)):setEase(LeanTweenType.easeInOutCubic)
							arg_10_0:StartTimer(function()
								SetActive(arg_13_2:Find("charaMessageCard/waiting"), false)
								SetActive(arg_13_2:Find("charaMessageCard/redPacket"), true)
								arg_13_2:Find("charaMessageCard/redPacket"):GetComponent(typeof(Animation)):Play("anim_newinstagram_redpacket_in")

								if arg_13_1 + 1 ~= #arg_10_2 then
									arg_10_0:ChangeCharaTextFunc(arg_10_4, "<color=#ff6666>" .. i18n("juuschat_chattip2") .. "</color>" .. pg.activity_ins_redpackage[tonumber(var_13_0.param)].desc)
								else
									arg_10_0:emit(InstagramChatMediator.SET_READED, {
										arg_10_1.topicId
									})
								end

								Canvas.ForceUpdateCanvases()
								LeanTween.value(go(arg_10_0:findTF("messageScroll", arg_10_0.rightPanel)), var_10_2.normalizedPosition.y, 0, 0.5):setOnUpdate(System.Action_float(var_10_3)):setEase(LeanTweenType.easeInOutCubic)
								arg_10_0:SetEndAniEvent(arg_13_2:Find("charaMessageCard/redPacket"), function()
									if arg_10_0.shouldShowOption and arg_13_1 + 1 == #arg_10_2 then
										arg_10_0:SetOptionPanelActive(true)
									end
								end)
							end, var_10_5)
						end, var_13_3)
					end
				elseif var_13_0.type == 4 then
					arg_10_0:SetCharaMessageCardActive(var_13_1, {
						4
					})
					arg_10_0:SetEmoji(arg_13_2:Find("charaMessageCard/emoji/emoticon"), var_0_3[tonumber(var_13_0.param)].pic)

					if arg_10_3 and var_10_0 and arg_13_1 + 1 > var_10_0 then
						SetActive(arg_13_2, false)
						arg_10_0:StartTimer(function()
							SetActive(arg_13_2, true)
							arg_13_2:Find("charaMessageCard/charaBg"):GetComponent(typeof(Animation)):Play("anim_newinstagram_charabg")
							SetActive(arg_13_2:Find("charaMessageCard/waiting"), true)
							SetActive(arg_13_2:Find("charaMessageCard/emoji"), false)
							Canvas.ForceUpdateCanvases()
							LeanTween.value(go(arg_10_0:findTF("messageScroll", arg_10_0.rightPanel)), var_10_2.normalizedPosition.y, 0, 0.5):setOnUpdate(System.Action_float(var_10_3)):setEase(LeanTweenType.easeInOutCubic)
							arg_10_0:StartTimer(function()
								SetActive(arg_13_2:Find("charaMessageCard/waiting"), false)
								SetActive(arg_13_2:Find("charaMessageCard/emoji"), true)
								arg_13_2:Find("charaMessageCard/emoji"):GetComponent(typeof(Animation)):Play("anim_newinstagram_emoji_in")

								if arg_13_1 + 1 ~= #arg_10_2 then
									local var_26_0 = var_0_3[tonumber(var_13_0.param)].desc
									local var_26_1 = string.gsub(var_26_0, "#%w+>", "#28af6e>")

									arg_10_0:ChangeCharaTextFunc(arg_10_4, var_26_1)
								else
									arg_10_0:emit(InstagramChatMediator.SET_READED, {
										arg_10_1.topicId
									})
								end

								Canvas.ForceUpdateCanvases()
								LeanTween.value(go(arg_10_0:findTF("messageScroll", arg_10_0.rightPanel)), var_10_2.normalizedPosition.y, 0, 0.5):setOnUpdate(System.Action_float(var_10_3)):setEase(LeanTweenType.easeInOutCubic)
								arg_10_0:SetEndAniEvent(arg_13_2:Find("charaMessageCard/emoji"), function()
									if arg_10_0.shouldShowOption and arg_13_1 + 1 == #arg_10_2 then
										arg_10_0:SetOptionPanelActive(true)
									end
								end)
							end, var_10_5)
						end, var_13_3)
					end
				elseif var_13_0.type == 5 then
					arg_10_0:SetCharaMessageCardActive(var_13_1, {
						6
					})

					local var_13_7 = var_13_0.param

					for iter_13_0 in string.gmatch(var_13_0.param, "'%d+'") do
						local var_13_8 = string.sub(iter_13_0, 2, #iter_13_0 - 1)

						var_13_7 = string.gsub(var_13_7, iter_13_0, "<color=#93e9ff>" .. var_0_1[tonumber(var_13_8)].name .. "</color>")
					end

					setText(arg_13_2:Find("charaMessageCard/systemTip/panel/Text"), var_13_7)

					if arg_10_3 and var_10_0 and arg_13_1 + 1 > var_10_0 then
						SetActive(arg_13_2, false)
						arg_10_0:StartTimer(function()
							SetActive(arg_13_2, true)
							arg_13_2:Find("charaMessageCard/systemTip"):GetComponent(typeof(Animation)):Play("anim_newinstagram_tip_in")

							if arg_13_1 + 1 ~= #arg_10_2 then
								arg_10_0:ChangeCharaTextFunc(arg_10_4, var_13_7)
							else
								arg_10_0:emit(InstagramChatMediator.SET_READED, {
									arg_10_1.topicId
								})
							end

							Canvas.ForceUpdateCanvases()
							LeanTween.value(go(arg_10_0:findTF("messageScroll", arg_10_0.rightPanel)), var_10_2.normalizedPosition.y, 0, 0.5):setOnUpdate(System.Action_float(var_10_3)):setEase(LeanTweenType.easeInOutCubic)
							arg_10_0:SetEndAniEvent(arg_13_2:Find("charaMessageCard/systemTip"), function()
								if arg_10_0.shouldShowOption and arg_13_1 + 1 == #arg_10_2 then
									arg_10_0:SetOptionPanelActive(true)
								end
							end)
						end, var_13_3)
					end
				end
			else
				if var_13_0.type == 1 then
					arg_10_0:SetPlayerMessageCardActive(var_13_2, {
						0
					})
					setText(arg_13_2:Find("playerReplyCard/msgBox/msg"), var_13_0.param)
				elseif var_13_0.type == 4 then
					arg_10_0:SetPlayerMessageCardActive(var_13_2, {
						1
					})
					arg_10_0:SetEmoji(arg_13_2:Find("playerReplyCard/emoji/emoticon"), var_0_3[tonumber(var_13_0.param)].pic)
				end

				if arg_10_3 and var_10_0 and _.contains(var_10_1, arg_13_1 + 1) then
					if table.indexof(var_10_1, arg_13_1 + 1) < #var_10_1 then
						SetActive(arg_13_2, false)
						arg_10_0:StartTimer(function()
							SetActive(arg_13_2, true)

							if var_13_0.type == 1 then
								arg_13_2:Find("playerReplyCard/msgBox"):GetComponent(typeof(Animation)):Play("anim_newinstagram_playerchat_common_in")
								arg_10_0:ChangeCharaTextFunc(arg_10_4, var_13_0.param)
							elseif var_13_0.type == 4 then
								arg_13_2:Find("playerReplyCard/emoji"):GetComponent(typeof(Animation)):Play("anim_newinstagram_emoji_in")

								local var_30_0 = var_0_3[tonumber(var_13_0.param)].desc
								local var_30_1 = string.gsub(var_30_0, "#%w+>", "#28af6e>")

								arg_10_0:ChangeCharaTextFunc(arg_10_4, var_30_1)
							end

							Canvas.ForceUpdateCanvases()
							LeanTween.value(go(arg_10_0:findTF("messageScroll", arg_10_0.rightPanel)), var_10_2.normalizedPosition.y, 0, 0.5):setOnUpdate(System.Action_float(var_10_3)):setEase(LeanTweenType.easeInOutCubic)
						end, (#var_10_1 - table.indexof(var_10_1, arg_13_1 + 1)) * var_10_6)
					elseif var_13_0.type == 1 then
						arg_13_2:Find("playerReplyCard/msgBox"):GetComponent(typeof(Animation)):Play("anim_newinstagram_playerchat_common_in")
						arg_10_0:ChangeCharaTextFunc(arg_10_4, var_13_0.param)
					elseif var_13_0.type == 4 then
						arg_13_2:Find("playerReplyCard/emoji"):GetComponent(typeof(Animation)):Play("anim_newinstagram_emoji_in")

						local var_13_9 = var_0_3[tonumber(var_13_0.param)].desc
						local var_13_10 = string.gsub(var_13_9, "#%w+>", "#28af6e>")

						arg_10_0:ChangeCharaTextFunc(arg_10_4, var_13_10)
					end
				end
			end

			if not arg_10_1:isWaiting() and arg_13_1 + 1 == #arg_10_2 then
				if arg_10_3 then
					arg_10_0:StartTimer(function()
						setActive(arg_13_2:Find("end"), true)
					end, var_13_3 + var_10_4)
				else
					setActive(arg_13_2:Find("end"), true)
				end
			else
				setActive(arg_13_2:Find("end"), false)
			end
		end
	end)
	arg_10_0.messageList:align(#arg_10_2)

	if arg_10_3 then
		Canvas.ForceUpdateCanvases()
		LeanTween.value(go(arg_10_0:findTF("messageScroll", arg_10_0.rightPanel)), var_10_2.normalizedPosition.y, 0, 0.5):setOnUpdate(System.Action_float(var_10_3)):setEase(LeanTweenType.easeInOutCubic)
	else
		scrollToBottom(arg_10_0:findTF("messageScroll", arg_10_0.rightPanel))
	end
end

function var_0_0.SetCharaMessageCardActive(arg_32_0, arg_32_1, arg_32_2)
	if _.contains(arg_32_2, 6) then
		SetActive(arg_32_1:GetChild(0), false)
	else
		SetActive(arg_32_1:GetChild(0), true)
	end

	for iter_32_0 = 1, arg_32_1.childCount - 1 do
		if _.contains(arg_32_2, iter_32_0) then
			SetActive(arg_32_1:GetChild(iter_32_0), true)
		else
			SetActive(arg_32_1:GetChild(iter_32_0), false)
		end
	end
end

function var_0_0.SetPlayerMessageCardActive(arg_33_0, arg_33_1, arg_33_2)
	for iter_33_0 = 0, arg_33_1.childCount - 1 do
		if _.contains(arg_33_2, iter_33_0) then
			SetActive(arg_33_1:GetChild(iter_33_0), true)
		else
			SetActive(arg_33_1:GetChild(iter_33_0), false)
		end
	end
end

function var_0_0.SetEmoji(arg_34_0, arg_34_1, arg_34_2)
	PoolMgr.GetInstance():GetPrefab("emoji/" .. arg_34_2, arg_34_2, true, function(arg_35_0)
		if not IsNil(arg_34_1) then
			arg_35_0.name = arg_34_2
			tf(arg_35_0).sizeDelta = arg_34_1.sizeDelta
			tf(arg_35_0).anchoredPosition = Vector2.zero

			local var_35_0 = arg_35_0:GetComponent("Animator")

			if var_35_0 then
				var_35_0.enabled = false
			end

			local var_35_1 = arg_35_0:GetComponent("CriManaEffectUI")

			if var_35_1 then
				var_35_1:Pause(true)
			end

			setParent(arg_35_0, arg_34_1, false)
		else
			PoolMgr.GetInstance():ReturnPrefab("emoji/" .. arg_34_2, arg_34_2, arg_35_0)
		end
	end)
end

function var_0_0.UpdateOptionPanel(arg_36_0, arg_36_1, arg_36_2)
	local var_36_0 = arg_36_2[#arg_36_2].option

	if var_36_0 and type(var_36_0) == "table" then
		arg_36_0.shouldShowOption = true
		arg_36_0.optionCount = #var_36_0

		arg_36_0:SetOptionPanelActive(true)
		arg_36_0.optionList:make(function(arg_37_0, arg_37_1, arg_37_2)
			if arg_37_0 == UIItemList.EventUpdate then
				local var_37_0 = var_36_0[arg_37_1 + 1]

				setText(arg_37_2:Find("Text"), var_37_0[2])
				onButton(arg_36_0, arg_37_2, function()
					arg_36_0:emit(InstagramChatMediator.REPLY, arg_36_1.topicId, arg_36_2[#arg_36_2].id, var_37_0[1])
				end, SFX_PANEL)
			end
		end)
		arg_36_0.optionList:align(#var_36_0)
	else
		arg_36_0:SetOptionPanelActive(false)

		arg_36_0.shouldShowOption = false
	end
end

function var_0_0.SetOptionPanelActive(arg_39_0, arg_39_1)
	SetActive(arg_39_0.optionPanel, arg_39_1)

	local var_39_0 = arg_39_0:findTF("messageScroll/Viewport/Content", arg_39_0.rightPanel):GetComponent(typeof(VerticalLayoutGroup))
	local var_39_1 = UnityEngine.RectOffset.New()

	var_39_1.left = 0
	var_39_1.right = 0
	var_39_1.top = 0

	local var_39_2 = arg_39_0:findTF("messageScroll/Scrollbar Vertical", arg_39_0.rightPanel):GetComponent(typeof(RectTransform))

	if arg_39_1 then
		var_39_1.bottom = 42 + 88 * arg_39_0.optionCount
		var_39_2.sizeDelta = Vector2(arg_39_0.messageScrollWidth, -var_39_1.bottom)
	else
		var_39_1.bottom = 50
		var_39_2.sizeDelta = Vector2(arg_39_0.messageScrollWidth, 0)
	end

	var_39_0.padding = var_39_1

	scrollToBottom(arg_39_0:findTF("messageScroll", arg_39_0.rightPanel))
end

function var_0_0.SetFilterPanel(arg_40_0)
	arg_40_0.readFilter = arg_40_0.readFilter or var_0_0.ReadType[1]
	arg_40_0.typeFilter = arg_40_0.typeFilter or var_0_0.TypeType[1]
	arg_40_0.campFilter = arg_40_0.campFilter or {
		var_0_0.CampIds[1]
	}

	local var_40_0 = arg_40_0:findTF("panel/filterScroll/Viewport/Content/read", arg_40_0.filterUI)
	local var_40_1 = arg_40_0:findTF("panel/filterScroll/Viewport/Content/type", arg_40_0.filterUI)
	local var_40_2 = arg_40_0:findTF("panel/filterScroll/Viewport/Content/camp", arg_40_0.filterUI)
	local var_40_3 = UIItemList.New(var_40_2, arg_40_0:findTF("option", var_40_2))

	onButton(arg_40_0, arg_40_0.filterBtn, function()
		SetActive(arg_40_0.filterUI, true)
		pg.UIMgr.GetInstance():BlurPanel(arg_40_0.filterUI, false, {
			weight = LayerWeightConst.SECOND_LAYER
		})

		for iter_41_0, iter_41_1 in ipairs(var_0_0.ReadType) do
			local var_41_0 = var_40_0:GetChild(iter_41_0)
			local var_41_1 = arg_40_0:findTF("selectedFrame", var_41_0)

			SetActive(var_41_1, arg_40_0.readFilter == iter_41_1)
			onButton(arg_40_0, var_41_0, function()
				for iter_42_0, iter_42_1 in ipairs(var_0_0.ReadType) do
					SetActive(arg_40_0:findTF("selectedFrame", var_40_0:GetChild(iter_42_0)), false)
				end

				SetActive(var_41_1, true)
			end, SFX_PANEL)
		end

		for iter_41_2, iter_41_3 in ipairs(var_0_0.TypeType) do
			local var_41_2 = var_40_1:GetChild(iter_41_2)
			local var_41_3 = arg_40_0:findTF("selectedFrame", var_41_2)

			SetActive(var_41_3, arg_40_0.typeFilter == iter_41_3)
			onButton(arg_40_0, var_41_2, function()
				for iter_43_0, iter_43_1 in ipairs(var_0_0.TypeType) do
					SetActive(arg_40_0:findTF("selectedFrame", var_40_1:GetChild(iter_43_0)), false)
				end

				SetActive(var_41_3, true)
			end, SFX_PANEL)
		end

		var_40_3:make(function(arg_44_0, arg_44_1, arg_44_2)
			if arg_44_0 == UIItemList.EventUpdate then
				setText(arg_44_2:Find("Text"), i18n(var_0_0.CampNames[arg_44_1 + 1]))

				local var_44_0 = arg_44_2:Find("selectedFrame")

				SetActive(var_44_0, _.contains(arg_40_0.campFilter, var_0_0.CampIds[arg_44_1 + 1]))
				onButton(arg_40_0, arg_44_2, function()
					if arg_44_1 == 0 then
						SetActive(var_44_0, true)

						for iter_45_0 = 2, #var_0_0.CampIds do
							SetActive(arg_40_0:findTF("selectedFrame", var_40_2:GetChild(iter_45_0 - 1)), false)
						end
					else
						SetActive(var_44_0, not isActive(var_44_0))

						local var_45_0 = true
						local var_45_1 = true

						for iter_45_1 = 2, #var_0_0.CampIds do
							if not isActive(arg_40_0:findTF("selectedFrame", var_40_2:GetChild(iter_45_1 - 1))) then
								var_45_0 = false
							end

							if isActive(arg_40_0:findTF("selectedFrame", var_40_2:GetChild(iter_45_1 - 1))) then
								var_45_1 = false
							end
						end

						if var_45_0 then
							SetActive(arg_40_0:findTF("selectedFrame", var_40_2:GetChild(0)), true)

							for iter_45_2 = 2, #var_0_0.CampIds do
								SetActive(arg_40_0:findTF("selectedFrame", var_40_2:GetChild(iter_45_2 - 1)), false)
							end
						elseif var_45_1 then
							SetActive(arg_40_0:findTF("selectedFrame", var_40_2:GetChild(0)), true)
						else
							SetActive(arg_40_0:findTF("selectedFrame", var_40_2:GetChild(0)), false)
						end
					end
				end, SFX_PANEL)
			end
		end)
		var_40_3:align(#var_0_0.CampIds)
	end, SFX_PANEL)
	onButton(arg_40_0, arg_40_0:findTF("bg", arg_40_0.filterUI), function()
		arg_40_0:CloseFilterPanel()
	end, SFX_PANEL)
	onButton(arg_40_0, arg_40_0:findTF("panel/bottom/close", arg_40_0.filterUI), function()
		arg_40_0:CloseFilterPanel()
	end, SFX_PANEL)
	onButton(arg_40_0, arg_40_0:findTF("panel/bottom/ok", arg_40_0.filterUI), function()
		for iter_48_0, iter_48_1 in ipairs(var_0_0.ReadType) do
			local var_48_0 = var_40_0:GetChild(iter_48_0)
			local var_48_1 = arg_40_0:findTF("selectedFrame", var_48_0)

			if isActive(var_48_1) then
				arg_40_0.readFilter = iter_48_1
			end
		end

		for iter_48_2, iter_48_3 in ipairs(var_0_0.TypeType) do
			local var_48_2 = var_40_1:GetChild(iter_48_2)
			local var_48_3 = arg_40_0:findTF("selectedFrame", var_48_2)

			if isActive(var_48_3) then
				arg_40_0.typeFilter = iter_48_3
			end
		end

		arg_40_0.campFilter = {}

		for iter_48_4, iter_48_5 in ipairs(var_0_0.CampIds) do
			local var_48_4 = var_40_2:GetChild(iter_48_4 - 1)
			local var_48_5 = arg_40_0:findTF("selectedFrame", var_48_4)

			if isActive(var_48_5) then
				table.insert(arg_40_0.campFilter, iter_48_5)
			end
		end

		arg_40_0:CloseFilterPanel()
		arg_40_0:SetFilterResult()
	end, SFX_PANEL)
end

function var_0_0.SetFilterResult(arg_49_0)
	local var_49_0 = true
	local var_49_1 = false

	if not arg_49_0.readFilter then
		arg_49_0.readFilter = var_0_0.ReadType[1]
		arg_49_0.typeFilter = var_0_0.TypeType[1]
		arg_49_0.campFilter = {
			var_0_0.CampIds[1]
		}
	end

	for iter_49_0, iter_49_1 in ipairs(arg_49_0.chatList) do
		local var_49_2 = true

		if arg_49_0.readFilter ~= "all" then
			local var_49_3 = arg_49_0.readFilter == "hasReaded" and 1 or 0

			if iter_49_1:GetCharacterEndFlag() ~= var_49_3 then
				var_49_2 = false
			end
		end

		if arg_49_0.typeFilter ~= "all" then
			local var_49_4 = arg_49_0.typeFilter == "single" and 1 or 2

			if iter_49_1.type ~= var_49_4 then
				var_49_2 = false
			end
		end

		if not _.contains(arg_49_0.campFilter, 0) and not _.contains(arg_49_0.campFilter, iter_49_1.nationality) then
			var_49_2 = false
		end

		SetActive(arg_49_0:findTF("main/leftPanel/charaScroll/Viewport/Content"):GetChild(iter_49_0 - 1), var_49_2)

		if var_49_2 then
			var_49_0 = false
		end

		if arg_49_0.currentChat and arg_49_0.currentChat.characterId == iter_49_1.characterId and var_49_2 then
			var_49_1 = true
		end
	end

	local var_49_5 = arg_49_0.readFilter == "all" and arg_49_0.typeFilter == "all" and _.contains(arg_49_0.campFilter, 0)

	SetActive(arg_49_0.isFiltered, not var_49_5)

	if var_49_0 then
		SetActive(arg_49_0:findTF("charaScroll", arg_49_0.leftPanel), false)
		SetActive(arg_49_0:findTF("main/noFilteredMessageBg"), true)
		SetActive(arg_49_0.rightPanel, false)
		SetActive(arg_49_0:findTF("main/rightNoMessageBg"), false)
	else
		SetActive(arg_49_0:findTF("charaScroll", arg_49_0.leftPanel), true)
		SetActive(arg_49_0:findTF("main/noFilteredMessageBg"), false)

		if var_49_1 then
			SetActive(arg_49_0.rightPanel, true)
			SetActive(arg_49_0:findTF("main/rightNoMessageBg"), false)
		else
			SetActive(arg_49_0.rightPanel, false)
			SetActive(arg_49_0:findTF("main/rightNoMessageBg"), true)

			arg_49_0.currentChat = nil

			if arg_49_0.cancelFrame then
				arg_49_0.cancelFrame()

				arg_49_0.cancelFrame = nil
			end
		end
	end
end

function var_0_0.CloseFilterPanel(arg_50_0)
	pg.UIMgr.GetInstance():UnblurPanel(arg_50_0.filterUI, arg_50_0:findTF("subPages"))
	SetActive(arg_50_0.filterUI, false)
end

function var_0_0.SetTopicPanel(arg_51_0, arg_51_1)
	SetActive(arg_51_0:findTF("tip", arg_51_0.topicBtn), arg_51_1:GetCharacterEndFlagExceptCurrent() == 0)
	onButton(arg_51_0, arg_51_0.topicBtn, function()
		SetActive(arg_51_0.topicUI, true)
		pg.UIMgr.GetInstance():BlurPanel(arg_51_0.topicUI, false, {
			weight = LayerWeightConst.SECOND_LAYER
		})

		arg_51_0.currentTopic = nil

		local var_52_0 = UIItemList.New(arg_51_0:findTF("panel/topicScroll/Viewport/Content", arg_51_0.topicUI), arg_51_0:findTF("panel/topicScroll/Viewport/Content/topic", arg_51_0.topicUI))

		var_52_0:make(function(arg_53_0, arg_53_1, arg_53_2)
			if arg_53_0 == UIItemList.EventUpdate then
				arg_51_1:SortTopicList()

				local var_53_0 = arg_51_1.topics[arg_53_1 + 1]

				setScrollText(arg_53_2:Find("mask/name"), var_53_0.name)
				SetActive(arg_53_2:Find("lock"), not var_53_0.active)
				SetActive(arg_53_2:Find("waiting"), var_53_0.active and var_53_0:isWaiting())
				SetActive(arg_53_2:Find("complete"), var_53_0.active and var_53_0:IsCompleted())
				SetActive(arg_53_2:Find("selectedFrame"), arg_51_1.currentTopicId == var_53_0.topicId)
				SetActive(arg_53_2:Find("selected"), arg_51_1.currentTopicId == var_53_0.topicId)
				SetActive(arg_53_2:Find("tip"), var_53_0.active and not var_53_0:IsCompleted())

				if arg_51_1.currentTopicId == var_53_0.topicId then
					arg_51_0.currentTopic = var_53_0
				end

				SetActive(arg_53_2, var_53_0.active)

				if var_53_0.active then
					onButton(arg_51_0, arg_53_2, function()
						SetActive(arg_53_2:Find("selectedFrame"), true)

						for iter_54_0 = 1, #arg_51_1.topics do
							if iter_54_0 ~= arg_53_1 + 1 then
								SetActive(arg_51_0:findTF("selectedFrame", arg_51_0:findTF("panel/topicScroll/Viewport/Content", arg_51_0.topicUI):GetChild(iter_54_0 - 1)), false)
							end
						end

						arg_51_0.currentTopic = var_53_0
					end, SFX_PANEL)
				else
					onButton(arg_51_0, arg_53_2, function()
						pg.TipsMgr.GetInstance():ShowTips(var_53_0.unlockDesc)
					end, SFX_PANEL)
				end
			end
		end)
		var_52_0:align(#arg_51_1.topics)
	end, SFX_PANEL)
	onButton(arg_51_0, arg_51_0:findTF("bg", arg_51_0.topicUI), function()
		arg_51_0:CloseTopicPanel()
	end, SFX_PANEL)
	onButton(arg_51_0, arg_51_0:findTF("panel/bottom/close", arg_51_0.topicUI), function()
		arg_51_0:CloseTopicPanel()
	end, SFX_PANEL)
	onButton(arg_51_0, arg_51_0:findTF("panel/bottom/ok", arg_51_0.topicUI), function()
		arg_51_0:emit(InstagramChatMediator.SET_CURRENT_TOPIC, arg_51_0.currentTopic.topicId)
		arg_51_0:CloseTopicPanel()

		local var_58_0 = arg_51_0.rightPanel:GetComponent(typeof(Animation))

		var_58_0:Stop()
		var_58_0:Play("anim_newinstagram_chat_right_in")
	end, SFX_PANEL)
end

function var_0_0.CloseTopicPanel(arg_59_0)
	pg.UIMgr.GetInstance():UnblurPanel(arg_59_0.topicUI, arg_59_0:findTF("subPages"))
	SetActive(arg_59_0.topicUI, false)
end

function var_0_0.SetBackgroundPanel(arg_60_0, arg_60_1)
	if arg_60_1.type == 2 then
		SetActive(arg_60_0.backgroundBtn, false)

		return
	end

	SetActive(arg_60_0.backgroundBtn, true)

	local var_60_0 = arg_60_1:GetPaintingId()

	onButton(arg_60_0, arg_60_0.backgroundBtn, function()
		SetActive(arg_60_0.backgroundUI, true)
		pg.UIMgr.GetInstance():BlurPanel(arg_60_0.backgroundUI, false, {
			weight = LayerWeightConst.SECOND_LAYER
		})

		arg_60_0.currentBgId = nil

		local var_61_0 = UIItemList.New(arg_60_0:findTF("panel/backgroundScroll/Viewport/Content", arg_60_0.backgroundUI), arg_60_0:findTF("panel/backgroundScroll/Viewport/Content/background", arg_60_0.backgroundUI))

		var_61_0:make(function(arg_62_0, arg_62_1, arg_62_2)
			if arg_62_0 == UIItemList.EventUpdate then
				local var_62_0 = arg_60_1.skins[arg_62_1 + 1]
				local var_62_1 = 0

				if var_62_0.id ~= var_60_0 then
					var_62_1 = var_62_0.id
				end

				local var_62_2 = var_62_0.painting

				LoadImageSpriteAsync("herohrzicon/" .. var_62_2, arg_62_2:Find("skinMask/skin"), false)
				setScrollText(arg_62_2:Find("skinMask/Panel/mask/Text"), var_62_0.name)

				local var_62_3 = var_62_0.skin_type ~= ShipSkin.SKIN_TYPE_DEFAULT and not getProxy(ShipSkinProxy):hasSkin(var_62_0.id)

				SetActive(arg_62_2:Find("lockFrame"), var_62_3)
				SetActive(arg_62_2:Find("selectedFrame"), arg_60_1.skinId == var_62_1)
				SetActive(arg_62_2:Find("selected"), arg_60_1.skinId == var_62_1)

				if arg_60_1.skinId == var_62_1 then
					arg_60_0.currentBgId = var_62_1
				end

				onButton(arg_60_0, arg_62_2, function()
					if not var_62_3 then
						SetActive(arg_62_2:Find("selectedFrame"), true)

						for iter_63_0 = 1, #arg_60_1.skins do
							if iter_63_0 ~= arg_62_1 + 1 then
								local var_63_0 = arg_60_0:findTF("panel/backgroundScroll/Viewport/Content", arg_60_0.backgroundUI):GetChild(iter_63_0 - 1)

								SetActive(arg_60_0:findTF("selectedFrame", var_63_0), false)
							end
						end

						arg_60_0.currentBgId = var_62_1
					else
						pg.TipsMgr.GetInstance():ShowTips(i18n("juuschat_background_tip2"))
					end
				end, SFX_PANEL)
			end
		end)
		var_61_0:align(#arg_60_1.skins)
	end, SFX_PANEL)
	onButton(arg_60_0, arg_60_0:findTF("bg", arg_60_0.backgroundUI), function()
		arg_60_0:CloseBackgroundPanel()
	end, SFX_PANEL)
	onButton(arg_60_0, arg_60_0:findTF("panel/bottom/close", arg_60_0.backgroundUI), function()
		arg_60_0:CloseBackgroundPanel()
	end, SFX_PANEL)
	onButton(arg_60_0, arg_60_0:findTF("panel/bottom/ok", arg_60_0.backgroundUI), function()
		arg_60_0:emit(InstagramChatMediator.SET_CURRENT_BACKGROUND, arg_60_1.characterId, arg_60_0.currentBgId)
		arg_60_0:CloseBackgroundPanel()
	end, SFX_PANEL)
end

function var_0_0.CloseBackgroundPanel(arg_67_0)
	pg.UIMgr.GetInstance():UnblurPanel(arg_67_0.backgroundUI, arg_67_0:findTF("subPages"))
	SetActive(arg_67_0.backgroundUI, false)
end

function var_0_0.SetRedPacketPanel(arg_68_0, arg_68_1, arg_68_2, arg_68_3, arg_68_4, arg_68_5, arg_68_6)
	onButton(arg_68_0, arg_68_1, function()
		SetActive(arg_68_0.redPacketUI, true)
		pg.UIMgr.GetInstance():BlurPanel(arg_68_0.redPacketUI, false, {
			weight = LayerWeightConst.SECOND_LAYER
		})
		setImageSprite(arg_68_0:findTF("panel/charaBg/chara", arg_68_0.redPacketUI), LoadSprite("qicon/" .. arg_68_4), false)

		if not arg_68_3 then
			SetActive(arg_68_0:findTF("panel/panelBg", arg_68_0.redPacketUI), true)
			SetActive(arg_68_0:findTF("panel/openImg", arg_68_0.redPacketUI), false)
			SetActive(arg_68_0:findTF("panel/get", arg_68_0.redPacketUI), true)
			SetActive(arg_68_0:findTF("panel/got", arg_68_0.redPacketUI), false)
			SetActive(arg_68_0:findTF("panel/detail", arg_68_0.redPacketUI), false)
			setText(arg_68_0:findTF("panel/get/titleBg/title", arg_68_0.redPacketUI), arg_68_2.desc)
			onButton(arg_68_0, arg_68_0:findTF("panel/get/getBtn", arg_68_0.redPacketUI), function()
				arg_68_0:emit(InstagramChatMediator.GET_REDPACKET, arg_68_5, arg_68_6, arg_68_2.id)
			end, SFX_PANEL)
		else
			arg_68_0:UpdateRedPacketUI(arg_68_2.id)
		end
	end, SFX_PANEL)
	onButton(arg_68_0, arg_68_0:findTF("bg", arg_68_0.redPacketUI), function()
		arg_68_0:CloseRedPacketPanel()

		if arg_68_0.canFresh then
			arg_68_0.canFresh = false

			local var_71_0 = arg_68_0.currentChat.currentTopic:GetDisplayWordList()

			if var_71_0[#var_71_0].type == 0 then
				arg_68_0:UpdateCharaList(false, false)
			else
				arg_68_0:UpdateCharaList(true, false)
			end
		end
	end, SFX_PANEL)
end

function var_0_0.UpdateRedPacketUI(arg_72_0, arg_72_1)
	local var_72_0 = var_0_2[arg_72_1]

	SetActive(arg_72_0:findTF("panel/panelBg", arg_72_0.redPacketUI), true)
	SetActive(arg_72_0:findTF("panel/openImg", arg_72_0.redPacketUI), false)
	SetActive(arg_72_0:findTF("panel/get", arg_72_0.redPacketUI), false)
	SetActive(arg_72_0:findTF("panel/got", arg_72_0.redPacketUI), true)
	SetActive(arg_72_0:findTF("panel/detail", arg_72_0.redPacketUI), false)

	local var_72_1 = Drop.Create(var_72_0.content)

	var_72_1.count = 0

	updateDrop(arg_72_0:findTF("panel/got/item", arg_72_0.redPacketUI), var_72_1)
	onButton(arg_72_0, arg_72_0:findTF("panel/got/item", arg_72_0.redPacketUI), function()
		arg_72_0:emit(BaseUI.ON_DROP, var_72_1)
	end, SFX_PANEL)

	arg_72_0:findTF("panel/got/item/icon_bg", arg_72_0.redPacketUI):GetComponent(typeof(Image)).enabled = false
	arg_72_0:findTF("panel/got/item/icon_bg/frame", arg_72_0.redPacketUI):GetComponent(typeof(Image)).enabled = false

	setText(arg_72_0:findTF("panel/got/awardCount", arg_72_0.redPacketUI), var_72_0.content[3])

	if var_72_0.type == 1 then
		SetActive(arg_72_0:findTF("panel/got/detailBtn", arg_72_0.redPacketUI), false)
	else
		SetActive(arg_72_0:findTF("panel/got/detailBtn", arg_72_0.redPacketUI), true)
		onButton(arg_72_0, arg_72_0:findTF("panel/got/detailBtn", arg_72_0.redPacketUI), function()
			SetActive(arg_72_0:findTF("panel/panelBg", arg_72_0.redPacketUI), false)
			SetActive(arg_72_0:findTF("panel/openImg", arg_72_0.redPacketUI), true)
			SetActive(arg_72_0:findTF("panel/got", arg_72_0.redPacketUI), false)
			SetActive(arg_72_0:findTF("panel/detail", arg_72_0.redPacketUI), true)

			local var_74_0 = 0
			local var_74_1 = 0
			local var_74_2 = UIItemList.New(arg_72_0:findTF("panel/detail/detailScroll/Viewport/Content", arg_72_0.redPacketUI), arg_72_0:findTF("panel/detail/detailScroll/Viewport/Content/charaGetCard", arg_72_0.redPacketUI))

			var_74_2:make(function(arg_75_0, arg_75_1, arg_75_2)
				if arg_75_0 == UIItemList.EventUpdate then
					local var_75_0 = var_72_0.group_receive[arg_75_1 + 1]
					local var_75_1 = var_75_0[1]
					local var_75_2 = {
						var_75_0[2],
						var_75_0[3],
						var_75_0[4]
					}

					if var_75_0[1] ~= 0 then
						local var_75_3 = "unknown"

						if var_0_1[var_75_1] then
							var_75_3 = var_0_1[var_75_1].sculpture
						end

						setImageSprite(arg_75_2:Find("charaBg/chara"), LoadSprite("qicon/" .. var_75_3), false)
					else
						setImageSprite(arg_75_2:Find("charaBg/chara"), GetSpriteFromAtlas("ui/InstagramUI_atlas", "txdi_3"), false)
					end

					local var_75_4 = Drop.Create(var_75_2)

					var_75_4.count = 0

					updateDrop(arg_75_2:Find("item"), var_75_4)
					onButton(arg_72_0, arg_75_2:Find("item"), function()
						arg_72_0:emit(BaseUI.ON_DROP, var_75_4)
					end, SFX_PANEL)

					arg_75_2:Find("item/icon_bg"):GetComponent(typeof(Image)).enabled = false
					arg_75_2:Find("item/icon_bg/frame"):GetComponent(typeof(Image)).enabled = false

					setText(arg_75_2:Find("awardCount"), var_75_0[4])

					if var_75_0[4] > var_74_1 then
						var_74_0 = arg_75_1
						var_74_1 = var_75_0[4]
					end
				end
			end)
			var_74_2:align(#var_72_0.group_receive)

			for iter_74_0 = 1, #var_72_0.group_receive do
				SetActive(arg_72_0:findTF("charaBg/king", arg_72_0:findTF("panel/detail/detailScroll/Viewport/Content", arg_72_0.redPacketUI):GetChild(iter_74_0 - 1)), var_74_0 == iter_74_0 - 1)
			end
		end, SFX_PANEL)
	end
end

function var_0_0.CloseRedPacketPanel(arg_77_0)
	pg.UIMgr.GetInstance():UnblurPanel(arg_77_0.redPacketUI, arg_77_0:findTF("subPages"))
	SetActive(arg_77_0.redPacketUI, false)
end

function var_0_0.SetData(arg_78_0)
	local var_78_0 = getProxy(InstagramChatProxy)

	arg_78_0.chatList = var_78_0:GetChatList()

	var_78_0:SortChatList()
end

function var_0_0.willExit(arg_79_0)
	local var_79_0 = arg_79_0:findTF("paintingMask/painting", arg_79_0.rightPanel)

	if arg_79_0.paintingName then
		retPaintingPrefab(var_79_0, arg_79_0.paintingName)

		arg_79_0.paintingName = nil
	end

	arg_79_0:RemoveAllTimer()
end

function var_0_0.StartTimer(arg_80_0, arg_80_1, arg_80_2)
	local var_80_0 = Timer.New(arg_80_1, arg_80_2, 1)

	var_80_0:Start()
	table.insert(arg_80_0.timerList, var_80_0)
end

function var_0_0.RemoveAllTimer(arg_81_0)
	for iter_81_0, iter_81_1 in ipairs(arg_81_0.timerList) do
		iter_81_1:Stop()
	end

	arg_81_0.timerList = {}
end

function var_0_0.StartTimer2(arg_82_0, arg_82_1, arg_82_2)
	arg_82_0.timer = Timer.New(arg_82_1, arg_82_2, 1)

	arg_82_0.timer:Start()
end

function var_0_0.SpeedUpMessage(arg_83_0)
	local var_83_0 = pg.gameset.juuschat_dialogue_trigger_time.key_value / 1000
	local var_83_1 = pg.gameset.juuschat_entering_time.key_value / 1000

	for iter_83_0, iter_83_1 in ipairs(arg_83_0.timerList) do
		if iter_83_1.running then
			if iter_83_1.duration == var_83_1 then
				iter_83_1.time = 0.05
			elseif iter_83_1.time - var_83_0 < 0.05 then
				iter_83_1.time = 0.05

				arg_83_0:StartTimer2(function()
					arg_83_0:SpeedUpWaiting()
				end, 0.05)
			else
				iter_83_1.time = iter_83_1.time - var_83_0
			end
		end
	end
end

function var_0_0.SpeedUpWaiting(arg_85_0)
	local var_85_0 = pg.gameset.juuschat_entering_time.key_value / 1000

	for iter_85_0, iter_85_1 in ipairs(arg_85_0.timerList) do
		if iter_85_1.running and iter_85_1.duration == var_85_0 then
			iter_85_1.time = 0.05

			break
		end
	end
end

function var_0_0.ChangeFresh(arg_86_0)
	arg_86_0.canFresh = true
end

function var_0_0.ChangeCharaTextFunc(arg_87_0, arg_87_1, arg_87_2)
	local function var_87_0(arg_88_0, arg_88_1)
		if arg_88_1:Find("id"):GetComponent(typeof(Text)).text == tostring(arg_87_1) then
			setText(arg_88_1:Find("msg"), arg_87_2)
		end
	end

	arg_87_0.charaList:each(var_87_0)
end

function var_0_0.ResetCharaTextFunc(arg_89_0, arg_89_1)
	local function var_89_0(arg_90_0, arg_90_1)
		if arg_90_1:Find("id"):GetComponent(typeof(Text)).text == tostring(arg_89_1) then
			setText(arg_90_1:Find("msg"), arg_90_1:Find("displayWord"):GetComponent(typeof(Text)).text)
		end
	end

	arg_89_0.charaList:each(var_89_0)
end

function var_0_0.SetEndAniEvent(arg_91_0, arg_91_1, arg_91_2)
	local var_91_0 = arg_91_1:GetComponent(typeof(DftAniEvent))

	if var_91_0 then
		var_91_0:SetEndEvent(function()
			arg_91_2()
			var_91_0:SetEndEvent(nil)
		end)
	end
end

function var_0_0.onBackPressed(arg_93_0)
	if isActive(arg_93_0.filterUI) then
		arg_93_0:CloseFilterPanel()

		return
	end

	if isActive(arg_93_0.topicUI) then
		arg_93_0:CloseTopicPanel()

		return
	end

	if isActive(arg_93_0.backgroundUI) then
		arg_93_0:CloseBackgroundPanel()

		return
	end

	if isActive(arg_93_0.redPacketUI) then
		arg_93_0:CloseRedPacketPanel()

		return
	end

	arg_93_0:emit(InstagramChatMediator.CLOSE_ALL)
end

return var_0_0
