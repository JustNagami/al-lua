local var_0_0 = class("InstagramLayer", import("...base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "InstagramUI"
end

function var_0_0.SetProxy(arg_2_0, arg_2_1)
	arg_2_0.proxy = arg_2_1
	arg_2_0.instagramVOById = arg_2_1:GetData()
	arg_2_0.messages = arg_2_1:GetMessages()
end

function var_0_0.UpdateSelectedInstagram(arg_3_0, arg_3_1)
	if arg_3_0.contextData.instagram and arg_3_0.contextData.instagram.id == arg_3_1 then
		arg_3_0.contextData.instagram = arg_3_0.instagramVOById[arg_3_1]

		arg_3_0:UpdateCommentList()
	end
end

function var_0_0.init(arg_4_0)
	local var_4_0 = GameObject.Find("MainObject")

	arg_4_0.downloadmgr = BulletinBoardMgr.Inst
	arg_4_0.listTF = arg_4_0:findTF("list")
	arg_4_0.mainTF = arg_4_0:findTF("main")

	setActive(arg_4_0.listTF, true)
	setActive(arg_4_0.mainTF, false)

	arg_4_0.closeBtn = arg_4_0:findTF("close_btn")
	arg_4_0.helpBtn = arg_4_0:findTF("list/bg/help")
	arg_4_0.noMsgTF = arg_4_0:findTF("list/bg/no_msg")
	arg_4_0.list = arg_4_0:findTF("list/bg/scrollrect"):GetComponent("LScrollRect")
	arg_4_0.imageTF = arg_4_0:findTF("main/left_panel/Image")
	arg_4_0.likeBtn = arg_4_0:findTF("main/left_panel/heart")
	arg_4_0.bubbleTF = arg_4_0:findTF("main/left_panel/bubble")
	arg_4_0.planeTF = arg_4_0:findTF("main/left_panel/plane")
	arg_4_0.likeCntTxt = arg_4_0:findTF("main/left_panel/zan"):GetComponent(typeof(Text))
	arg_4_0.pushTimeTxt = arg_4_0:findTF("main/left_panel/time"):GetComponent(typeof(Text))
	arg_4_0.iconTF = arg_4_0:findTF("main/right_panel/top/head/icon")
	arg_4_0.nameTxt = arg_4_0:findTF("main/right_panel/top/name"):GetComponent(typeof(Text))
	arg_4_0.centerTF = arg_4_0:findTF("main/right_panel/center")
	arg_4_0.contentTxt = arg_4_0:findTF("main/right_panel/center/Text/Text"):GetComponent(typeof(Text))
	arg_4_0.commentList = UIItemList.New(arg_4_0:findTF("main/right_panel/center/bottom/scroll/content"), arg_4_0:findTF("main/right_panel/center/bottom/scroll/content/tpl"))
	arg_4_0.commentPanel = arg_4_0:findTF("main/right_panel/last/bg2")
	arg_4_0.optionalPanel = arg_4_0:findTF("main/right_panel/last/bg2/option")
	arg_4_0.scroll = arg_4_0:findTF("main/right_panel/center/bottom/scroll")
	arg_4_0.sprites = {}
	arg_4_0.timers = {}
	arg_4_0.toDownloadList = {}

	pg.UIMgr.GetInstance():BlurPanel(arg_4_0._tf, false, {
		weight = LayerWeightConst.SECOND_LAYER
	})
end

function var_0_0.SetImageByUrl(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	local var_5_0 = arg_5_2:GetComponent(typeof(Image))

	if not arg_5_1 or arg_5_1 == "" then
		var_5_0.sprite = LoadSprite("bg/bg_night")

		if arg_5_3 then
			arg_5_3()
		end
	else
		local var_5_1 = arg_5_0.sprites[arg_5_1]

		if var_5_1 then
			var_5_0.sprite = var_5_1

			if arg_5_3 then
				arg_5_3()
			end
		else
			var_5_0.enabled = false

			arg_5_0.downloadmgr:GetSprite("ins", "1", arg_5_1, UnityEngine.Events.UnityAction_UnityEngine_Sprite(function(arg_6_0)
				if arg_5_0.exited then
					return
				end

				if not arg_5_0.sprites then
					return
				end

				arg_5_0.sprites[arg_5_1] = arg_6_0
				var_5_0.sprite = arg_6_0
				var_5_0.enabled = true

				if arg_5_3 then
					arg_5_3()
				end
			end))
			table.insert(arg_5_0.toDownloadList, arg_5_1)
		end
	end
end

function var_0_0.didEnter(arg_7_0)
	onButton(arg_7_0, arg_7_0.closeBtn, function()
		if arg_7_0.inDetail then
			arg_7_0:ExitDetail()
		else
			arg_7_0:emit(var_0_0.ON_CLOSE)
		end
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.helpBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.music_juus.tip
		})
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0._tf, function()
		if arg_7_0.inDetail then
			arg_7_0:ExitDetail()
		else
			arg_7_0:emit(var_0_0.ON_CLOSE)
		end
	end, SFX_PANEL)

	arg_7_0.cards = {}

	function arg_7_0.list.onInitItem(arg_11_0)
		local var_11_0 = InstagramCard.New(arg_11_0, arg_7_0)

		onButton(arg_7_0, var_11_0._go, function()
			arg_7_0:EnterDetail(var_11_0.instagram)
		end, SFX_PANEL)

		arg_7_0.cards[arg_11_0] = var_11_0
	end

	function arg_7_0.list.onUpdateItem(arg_13_0, arg_13_1)
		local var_13_0 = arg_7_0.cards[arg_13_1]

		if not var_13_0 then
			var_13_0 = InstagramCard.New(arg_13_1)
			arg_7_0.cards[arg_13_1] = var_13_0
		end

		local var_13_1 = arg_7_0.display[arg_13_0 + 1]
		local var_13_2 = arg_7_0.instagramVOById[var_13_1.id]

		var_13_0:Update(var_13_2)
	end

	arg_7_0:InitList()
end

function var_0_0.InitList(arg_14_0)
	arg_14_0.display = _.map(arg_14_0.messages, function(arg_15_0)
		return {
			time = arg_15_0:GetLasterUpdateTime(),
			id = arg_15_0.id,
			order = arg_15_0:GetSortIndex()
		}
	end)

	table.sort(arg_14_0.display, function(arg_16_0, arg_16_1)
		if arg_16_0.order == arg_16_1.order then
			return arg_16_0.id > arg_16_1.id
		else
			return arg_16_0.order > arg_16_1.order
		end
	end)
	arg_14_0.list:SetTotalCount(#arg_14_0.display)
	setActive(arg_14_0.noMsgTF, #arg_14_0.display == 0)
end

function var_0_0.UpdateInstagram(arg_17_0, arg_17_1, arg_17_2)
	for iter_17_0, iter_17_1 in pairs(arg_17_0.cards) do
		if iter_17_1.instagram and iter_17_1.instagram.id == arg_17_1 then
			iter_17_1:Update(arg_17_0.instagramVOById[arg_17_1], arg_17_2)
		end
	end
end

function var_0_0.EnterDetail(arg_18_0, arg_18_1)
	arg_18_0.contextData.instagram = arg_18_1

	setActive(arg_18_0.mainTF, true)

	local var_18_0 = GetOrAddComponent(arg_18_0.listTF, typeof(CanvasGroup))

	var_18_0.alpha = 0
	var_18_0.blocksRaycasts = false

	arg_18_0:InitDetailPage()

	arg_18_0.inDetail = true

	pg.SystemGuideMgr.GetInstance():Play(arg_18_0)
	arg_18_0:RefreshInstagram()
	scrollTo(arg_18_0.scroll, 0, 1)
end

function var_0_0.ExitDetail(arg_19_0)
	local var_19_0 = arg_19_0.contextData.instagram

	if var_19_0 and not var_19_0:IsReaded() then
		arg_19_0:emit(InstagramMediator.ON_READED, var_19_0.id)
	end

	arg_19_0.contextData.instagram = nil

	setActive(arg_19_0.mainTF, false)

	local var_19_1 = GetOrAddComponent(arg_19_0.listTF, typeof(CanvasGroup))

	var_19_1.alpha = 1
	var_19_1.blocksRaycasts = true
	arg_19_0.inDetail = false

	arg_19_0:CloseCommentPanel()
end

function var_0_0.RefreshInstagram(arg_20_0)
	local var_20_0 = arg_20_0.contextData.instagram
	local var_20_1 = var_20_0:GetFastestRefreshTime()

	if var_20_1 and var_20_1 - pg.TimeMgr.GetInstance():GetServerTime() <= 0 then
		arg_20_0:emit(InstagramMediator.ON_REPLY_UPDATE, var_20_0.id)
	end
end

function var_0_0.InitDetailPage(arg_21_0)
	local var_21_0 = arg_21_0.contextData.instagram

	arg_21_0:SetImageByUrl(var_21_0:GetImage(), arg_21_0.imageTF)
	onButton(arg_21_0, arg_21_0.planeTF, function()
		arg_21_0:emit(InstagramMediator.ON_SHARE, var_21_0.id)
	end, SFX_PANEL)

	arg_21_0.pushTimeTxt.text = var_21_0:GetPushTime()

	setImageSprite(arg_21_0.iconTF, LoadSprite("qicon/" .. var_21_0:GetIcon()), false)

	arg_21_0.nameTxt.text = var_21_0:GetName()
	arg_21_0.contentTxt.text = var_21_0:GetContent()

	onToggle(arg_21_0, arg_21_0.commentPanel, function(arg_23_0)
		if arg_23_0 then
			arg_21_0:OpenCommentPanel()
		else
			arg_21_0:CloseCommentPanel()
		end
	end, SFX_PANEL)
	arg_21_0:UpdateLikeBtn()
	arg_21_0:UpdateCommentList()
end

function var_0_0.UpdateLikeBtn(arg_24_0)
	local var_24_0 = arg_24_0.contextData.instagram
	local var_24_1 = var_24_0:IsLiking()

	if not var_24_1 then
		onButton(arg_24_0, arg_24_0.likeBtn, function()
			arg_24_0:emit(InstagramMediator.ON_LIKE, var_24_0.id)
		end, SFX_PANEL)
	else
		removeOnButton(arg_24_0.likeBtn)
	end

	setActive(arg_24_0.likeBtn:Find("heart"), var_24_1)

	arg_24_0.likeBtn:GetComponent(typeof(Image)).enabled = not var_24_1
	arg_24_0.likeCntTxt.text = i18n("ins_word_like", var_24_0:GetLikeCnt())
end

function var_0_0.UpdateCommentList(arg_26_0)
	local var_26_0 = arg_26_0.contextData.instagram

	if not var_26_0 then
		return
	end

	local var_26_1, var_26_2 = var_26_0:GetCanDisplayComments()

	table.sort(var_26_1, function(arg_27_0, arg_27_1)
		return arg_27_0.time < arg_27_1.time
	end)
	arg_26_0.commentList:make(function(arg_28_0, arg_28_1, arg_28_2)
		if arg_28_0 == UIItemList.EventUpdate then
			local var_28_0 = var_26_1[arg_28_1 + 1]
			local var_28_1 = var_28_0:HasReply()

			setText(arg_28_2:Find("main/reply"), var_28_0:GetReplyBtnTxt())

			local var_28_2 = var_28_0:GetContent()
			local var_28_3 = SwitchSpecialChar(var_28_2)

			setText(arg_28_2:Find("main/content"), HXSet.hxLan(var_28_3))
			setText(arg_28_2:Find("main/bubble/Text"), var_28_0:GetReplyCnt())
			setText(arg_28_2:Find("main/time"), var_28_0:GetTime())

			if var_28_0:GetType() == Instagram.TYPE_PLAYER_COMMENT then
				local var_28_4, var_28_5 = var_28_0:GetIcon()

				setImageSprite(arg_28_2:Find("main/head/icon"), GetSpriteFromAtlas(var_28_4, var_28_5))
			else
				setImageSprite(arg_28_2:Find("main/head/icon"), LoadSprite("qicon/" .. var_28_0:GetIcon()), false)
			end

			if var_28_1 then
				onToggle(arg_26_0, arg_28_2:Find("main/bubble"), function(arg_29_0)
					setActive(arg_28_2:Find("replys"), arg_29_0)
				end, SFX_PANEL)
				arg_26_0:UpdateReplys(arg_28_2, var_28_0)
				triggerToggle(arg_28_2:Find("main/bubble"), true)
			else
				setActive(arg_28_2:Find("replys"), false)
				triggerToggle(arg_28_2:Find("main/bubble"), false)
			end

			arg_28_2:Find("main/bubble"):GetComponent(typeof(Toggle)).enabled = var_28_1
		end
	end)
	setActive(arg_26_0.centerTF, false)
	setActive(arg_26_0.centerTF, true)
	Canvas.ForceUpdateCanvases()
	arg_26_0.commentList:align(#var_26_1)
end

function var_0_0.UpdateReplys(arg_30_0, arg_30_1, arg_30_2)
	local var_30_0, var_30_1 = arg_30_2:GetCanDisplayReply()
	local var_30_2 = UIItemList.New(arg_30_1:Find("replys"), arg_30_1:Find("replys/sub"))

	table.sort(var_30_0, function(arg_31_0, arg_31_1)
		if arg_31_0.level == arg_31_1.level then
			if arg_31_0.time == arg_31_1.time then
				return arg_31_0.id < arg_31_1.id
			else
				return arg_31_0.time < arg_31_1.time
			end
		else
			return arg_31_0.level < arg_31_1.level
		end
	end)
	var_30_2:make(function(arg_32_0, arg_32_1, arg_32_2)
		if arg_32_0 == UIItemList.EventUpdate then
			local var_32_0 = var_30_0[arg_32_1 + 1]

			setImageSprite(arg_32_2:Find("head/icon"), LoadSprite("qicon/" .. var_32_0:GetIcon()), false)

			local var_32_1 = var_32_0:GetContent()
			local var_32_2 = SwitchSpecialChar(var_32_1)

			setText(arg_32_2:Find("content"), HXSet.hxLan(var_32_2))
		end
	end)
	var_30_2:align(#var_30_0)
end

function var_0_0.OpenCommentPanel(arg_33_0)
	local var_33_0 = arg_33_0.contextData.instagram

	if not var_33_0:CanOpenComment() then
		return
	end

	setActive(arg_33_0.optionalPanel, true)

	local var_33_1 = var_33_0:GetOptionComment()

	arg_33_0.commentPanel.sizeDelta = Vector2(642.6, (#var_33_1 + 1) * 150)

	local var_33_2 = UIItemList.New(arg_33_0.optionalPanel, arg_33_0.optionalPanel:Find("option1"))

	var_33_2:make(function(arg_34_0, arg_34_1, arg_34_2)
		if arg_34_0 == UIItemList.EventUpdate then
			local var_34_0 = arg_34_1 + 1
			local var_34_1 = var_33_1[var_34_0].text
			local var_34_2 = var_33_1[var_34_0].id
			local var_34_3 = var_33_1[var_34_0].index

			setText(arg_34_2:Find("Text"), HXSet.hxLan(var_34_1))
			onButton(arg_33_0, arg_34_2, function()
				arg_33_0:emit(InstagramMediator.ON_COMMENT, var_33_0.id, var_34_3, var_34_2)
				arg_33_0:CloseCommentPanel()
			end, SFX_PANEL)
		end
	end)
	var_33_2:align(#var_33_1)
end

function var_0_0.CloseCommentPanel(arg_36_0)
	arg_36_0.commentPanel.sizeDelta = Vector2(642.6, 150)

	setActive(arg_36_0.optionalPanel, false)
end

function var_0_0.onBackPressed(arg_37_0)
	if arg_37_0.inDetail then
		arg_37_0:ExitDetail()

		return
	end

	var_0_0.super.onBackPressed(arg_37_0)
end

function var_0_0.willExit(arg_38_0)
	for iter_38_0, iter_38_1 in ipairs(arg_38_0.toDownloadList or {}) do
		arg_38_0.downloadmgr:StopLoader(iter_38_1)
	end

	arg_38_0.toDownloadList = {}

	pg.UIMgr.GetInstance():UnblurPanel(arg_38_0._tf, pg.UIMgr.GetInstance()._normalUIMain)
	arg_38_0:ExitDetail()

	arg_38_0.sprites = nil

	for iter_38_2, iter_38_3 in pairs(arg_38_0.cards) do
		iter_38_3:Dispose()
	end

	arg_38_0.cards = {}
end

return var_0_0
