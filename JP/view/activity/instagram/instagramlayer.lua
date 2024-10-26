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
	arg_4_0.closeBtn = arg_4_0:findTF("closeBtn")
	arg_4_0.noMsgTF = arg_4_0:findTF("list/bg/no_msg")
	arg_4_0.scrollBarTF = arg_4_0:findTF("list/bg/scroll_bar")
	arg_4_0.list = arg_4_0:findTF("list/bg/scrollrect"):GetComponent("LScrollRect")
	arg_4_0.imageTF = arg_4_0:findTF("main/left_panel/mask/Image"):GetComponent(typeof(RawImage))
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

	setText(arg_4_0:findTF("closeBtn/Text"), i18n("word_back"))

	arg_4_0.sprites = {}
	arg_4_0.timers = {}
	arg_4_0.toDownloadList = {}

	pg.UIMgr.GetInstance():BlurPanel(arg_4_0._tf, false, {
		groupName = "Instagram",
		weight = LayerWeightConst.SECOND_LAYER
	})
end

function var_0_0.SetImageByUrl(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	if not arg_5_1 or arg_5_1 == "" then
		setActive(arg_5_2.gameObject, false)

		if arg_5_3 then
			arg_5_3()
		end
	else
		setActive(arg_5_2.gameObject, true)

		local var_5_0 = arg_5_0.sprites[arg_5_1]

		if var_5_0 then
			arg_5_2.texture = var_5_0

			if arg_5_3 then
				arg_5_3()
			end
		else
			arg_5_2.enabled = false

			arg_5_0.downloadmgr:GetTexture("ins", "1", arg_5_1, UnityEngine.Events.UnityAction_UnityEngine_Texture(function(arg_6_0)
				if arg_5_0.exited then
					return
				end

				if not arg_5_0.sprites then
					return
				end

				arg_5_0.sprites[arg_5_1] = arg_6_0
				arg_5_2.texture = arg_6_0
				arg_5_2.enabled = true

				if arg_5_3 then
					arg_5_3()
				end
			end))
			table.insert(arg_5_0.toDownloadList, arg_5_1)
		end
	end
end

function var_0_0.didEnter(arg_7_0)
	arg_7_0:SetUp()

	arg_7_0.cards = {}

	function arg_7_0.list.onInitItem(arg_8_0)
		local var_8_0 = InstagramCard.New(arg_8_0, arg_7_0)

		onButton(arg_7_0, var_8_0._go, function()
			arg_7_0:EnterDetail(var_8_0.instagram)
		end, SFX_PANEL)

		arg_7_0.cards[arg_8_0] = var_8_0
	end

	function arg_7_0.list.onUpdateItem(arg_10_0, arg_10_1)
		local var_10_0 = arg_7_0.cards[arg_10_1]

		if not var_10_0 then
			var_10_0 = InstagramCard.New(arg_10_1)
			arg_7_0.cards[arg_10_1] = var_10_0
		end

		local var_10_1 = arg_7_0.display[arg_10_0 + 1]
		local var_10_2 = arg_7_0.instagramVOById[var_10_1.id]

		var_10_0:Update(var_10_2)
	end

	arg_7_0:InitList()
end

function var_0_0.SetUp(arg_11_0)
	setActive(arg_11_0.listTF, true)
	setActive(arg_11_0.mainTF, false)
	setActive(arg_11_0.closeBtn, false)
	onButton(arg_11_0, arg_11_0.closeBtn, function()
		if arg_11_0.inDetail then
			arg_11_0:ExitDetail()
		end
	end, SFX_PANEL)
end

function var_0_0.InitList(arg_13_0)
	arg_13_0.display = _.map(arg_13_0.messages, function(arg_14_0)
		return {
			time = arg_14_0:GetLasterUpdateTime(),
			id = arg_14_0.id,
			order = arg_14_0:GetSortIndex()
		}
	end)

	table.sort(arg_13_0.display, function(arg_15_0, arg_15_1)
		if arg_15_0.order == arg_15_1.order then
			return arg_15_0.id > arg_15_1.id
		else
			return arg_15_0.order > arg_15_1.order
		end
	end)
	arg_13_0.list:SetTotalCount(#arg_13_0.display)
	setActive(arg_13_0.noMsgTF, #arg_13_0.display == 0)
	setActive(arg_13_0.scrollBarTF, not #arg_13_0.display == 0)
end

function var_0_0.UpdateInstagram(arg_16_0, arg_16_1, arg_16_2)
	for iter_16_0, iter_16_1 in pairs(arg_16_0.cards) do
		if iter_16_1.instagram and iter_16_1.instagram.id == arg_16_1 then
			iter_16_1:Update(arg_16_0.instagramVOById[arg_16_1], arg_16_2)
		end
	end
end

function var_0_0.EnterDetail(arg_17_0, arg_17_1)
	arg_17_0.contextData.instagram = arg_17_1

	arg_17_0:InitDetailPage()

	arg_17_0.inDetail = true

	setActive(arg_17_0.listTF, false)
	setActive(arg_17_0.mainTF, true)
	setActive(arg_17_0.closeBtn, true)
	pg.SystemGuideMgr.GetInstance():Play(arg_17_0)
	arg_17_0:RefreshInstagram()
	scrollTo(arg_17_0.scroll, 0, 1)
end

function var_0_0.ExitDetail(arg_18_0)
	local var_18_0 = arg_18_0.contextData.instagram

	if var_18_0 and not var_18_0:IsReaded() then
		arg_18_0:emit(InstagramMediator.ON_READED, var_18_0.id)
	end

	arg_18_0.contextData.instagram = nil
	arg_18_0.inDetail = false

	setActive(arg_18_0.listTF, true)
	setActive(arg_18_0.mainTF, false)
	setActive(arg_18_0.closeBtn, false)
	arg_18_0:CloseCommentPanel()
end

function var_0_0.RefreshInstagram(arg_19_0)
	local var_19_0 = arg_19_0.contextData.instagram
	local var_19_1 = var_19_0:GetFastestRefreshTime()

	if var_19_1 and var_19_1 - pg.TimeMgr.GetInstance():GetServerTime() <= 0 then
		arg_19_0:emit(InstagramMediator.ON_REPLY_UPDATE, var_19_0.id)
	end
end

function var_0_0.InitDetailPage(arg_20_0)
	local var_20_0 = arg_20_0.contextData.instagram

	arg_20_0:SetImageByUrl(var_20_0:GetImage(), arg_20_0.imageTF)
	onButton(arg_20_0, arg_20_0.planeTF, function()
		arg_20_0:emit(InstagramMediator.ON_SHARE, var_20_0.id)
	end, SFX_PANEL)

	arg_20_0.pushTimeTxt.text = var_20_0:GetPushTime()

	setImageSprite(arg_20_0.iconTF, LoadSprite("qicon/" .. var_20_0:GetIcon()), false)

	arg_20_0.nameTxt.text = var_20_0:GetName()
	arg_20_0.contentTxt.text = var_20_0:GetContent()

	onToggle(arg_20_0, arg_20_0.commentPanel, function(arg_22_0)
		if arg_22_0 then
			arg_20_0:OpenCommentPanel()
		else
			arg_20_0:CloseCommentPanel()
		end
	end, SFX_PANEL)
	arg_20_0:UpdateLikeBtn()
	arg_20_0:UpdateCommentList()
end

function var_0_0.UpdateLikeBtn(arg_23_0)
	local var_23_0 = arg_23_0.contextData.instagram
	local var_23_1 = var_23_0:IsLiking()

	if not var_23_1 then
		onButton(arg_23_0, arg_23_0.likeBtn, function()
			arg_23_0:emit(InstagramMediator.ON_LIKE, var_23_0.id)
		end, SFX_PANEL)
	else
		removeOnButton(arg_23_0.likeBtn)
	end

	setActive(arg_23_0.likeBtn:Find("heart"), var_23_1)

	arg_23_0.likeBtn:GetComponent(typeof(Image)).enabled = not var_23_1
	arg_23_0.likeCntTxt.text = i18n("ins_word_like", var_23_0:GetLikeCnt())
end

function var_0_0.UpdateCommentList(arg_25_0)
	local var_25_0 = arg_25_0.contextData.instagram

	if not var_25_0 then
		return
	end

	local var_25_1, var_25_2 = var_25_0:GetCanDisplayComments()

	table.sort(var_25_1, function(arg_26_0, arg_26_1)
		return arg_26_0.time < arg_26_1.time
	end)
	arg_25_0.commentList:make(function(arg_27_0, arg_27_1, arg_27_2)
		if arg_27_0 == UIItemList.EventUpdate then
			local var_27_0 = var_25_1[arg_27_1 + 1]
			local var_27_1 = var_27_0:HasReply()

			setText(arg_27_2:Find("main/reply"), var_27_0:GetReplyBtnTxt())

			local var_27_2 = var_27_0:GetContent()
			local var_27_3 = SwitchSpecialChar(var_27_2)

			setText(arg_27_2:Find("main/content"), HXSet.hxLan(var_27_3))
			setText(arg_27_2:Find("main/bubble/Text"), var_27_0:GetReplyCnt())
			setText(arg_27_2:Find("main/time"), var_27_0:GetTime())

			if var_27_0:GetType() == Instagram.TYPE_PLAYER_COMMENT then
				local var_27_4, var_27_5 = var_27_0:GetIcon()

				setImageSprite(arg_27_2:Find("main/head/icon"), GetSpriteFromAtlas(var_27_4, var_27_5))
			else
				setImageSprite(arg_27_2:Find("main/head/icon"), LoadSprite("qicon/" .. var_27_0:GetIcon()), false)
			end

			if var_27_1 then
				onToggle(arg_25_0, arg_27_2:Find("main/bubble"), function(arg_28_0)
					setActive(arg_27_2:Find("replys"), arg_28_0)
				end, SFX_PANEL)
				arg_25_0:UpdateReplys(arg_27_2, var_27_0)
				triggerToggle(arg_27_2:Find("main/bubble"), true)
			else
				setActive(arg_27_2:Find("replys"), false)
				triggerToggle(arg_27_2:Find("main/bubble"), false)
			end

			arg_27_2:Find("main/bubble"):GetComponent(typeof(Toggle)).enabled = var_27_1
		end
	end)
	setActive(arg_25_0.centerTF, false)
	setActive(arg_25_0.centerTF, true)
	Canvas.ForceUpdateCanvases()
	arg_25_0.commentList:align(#var_25_1)
end

function var_0_0.UpdateReplys(arg_29_0, arg_29_1, arg_29_2)
	local var_29_0, var_29_1 = arg_29_2:GetCanDisplayReply()
	local var_29_2 = UIItemList.New(arg_29_1:Find("replys"), arg_29_1:Find("replys/sub"))

	table.sort(var_29_0, function(arg_30_0, arg_30_1)
		if arg_30_0.level == arg_30_1.level then
			if arg_30_0.time == arg_30_1.time then
				return arg_30_0.id < arg_30_1.id
			else
				return arg_30_0.time < arg_30_1.time
			end
		else
			return arg_30_0.level < arg_30_1.level
		end
	end)
	var_29_2:make(function(arg_31_0, arg_31_1, arg_31_2)
		if arg_31_0 == UIItemList.EventUpdate then
			local var_31_0 = var_29_0[arg_31_1 + 1]

			setImageSprite(arg_31_2:Find("head/icon"), LoadSprite("qicon/" .. var_31_0:GetIcon()), false)

			local var_31_1 = var_31_0:GetContent()
			local var_31_2 = SwitchSpecialChar(var_31_1)

			setText(arg_31_2:Find("content"), HXSet.hxLan(var_31_2))
		end
	end)
	var_29_2:align(#var_29_0)
end

function var_0_0.OpenCommentPanel(arg_32_0)
	local var_32_0 = arg_32_0.contextData.instagram

	if not var_32_0:CanOpenComment() then
		return
	end

	setActive(arg_32_0.optionalPanel, true)

	local var_32_1 = var_32_0:GetOptionComment()

	arg_32_0.commentPanel:GetComponent(typeof(Image)).enabled = true
	arg_32_0.commentPanel.sizeDelta = Vector2(0, #var_32_1 * 142 + 60)

	local var_32_2 = UIItemList.New(arg_32_0.optionalPanel, arg_32_0.optionalPanel:Find("option1"))

	var_32_2:make(function(arg_33_0, arg_33_1, arg_33_2)
		if arg_33_0 == UIItemList.EventUpdate then
			local var_33_0 = arg_33_1 + 1
			local var_33_1 = var_32_1[var_33_0].text
			local var_33_2 = var_32_1[var_33_0].id
			local var_33_3 = var_32_1[var_33_0].index

			setText(arg_33_2:Find("Text"), HXSet.hxLan(var_33_1))
			onButton(arg_32_0, arg_33_2, function()
				arg_32_0:emit(InstagramMediator.ON_COMMENT, var_32_0.id, var_33_3, var_33_2)
				arg_32_0:CloseCommentPanel()
			end, SFX_PANEL)
		end
	end)
	var_32_2:align(#var_32_1)
end

function var_0_0.CloseCommentPanel(arg_35_0)
	arg_35_0.commentPanel:GetComponent(typeof(Image)).enabled = false
	arg_35_0.commentPanel.sizeDelta = Vector2(0, 0)

	setActive(arg_35_0.optionalPanel, false)
end

function var_0_0.onBackPressed(arg_36_0)
	if arg_36_0.inDetail then
		arg_36_0:ExitDetail()

		return
	end

	arg_36_0:emit(InstagramMediator.CLOSE_ALL)
end

function var_0_0.CloseDetail(arg_37_0)
	if arg_37_0.inDetail then
		arg_37_0:ExitDetail()

		return
	end
end

function var_0_0.willExit(arg_38_0)
	for iter_38_0, iter_38_1 in ipairs(arg_38_0.toDownloadList or {}) do
		arg_38_0.downloadmgr:StopLoader(iter_38_1)
	end

	arg_38_0.toDownloadList = {}

	pg.UIMgr.GetInstance():UnblurPanel(arg_38_0._tf, pg.UIMgr.GetInstance()._normalUIMain)
	arg_38_0:ExitDetail()

	for iter_38_2, iter_38_3 in pairs(arg_38_0.sprites) do
		if not IsNil(iter_38_3) then
			Object.Destroy(iter_38_3)
		end
	end

	arg_38_0.sprites = nil

	for iter_38_4, iter_38_5 in pairs(arg_38_0.cards) do
		iter_38_5:Dispose()
	end

	arg_38_0.cards = {}
end

return var_0_0
