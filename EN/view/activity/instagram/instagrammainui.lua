local var_0_0 = class("InstagramMainUI", import("...base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "InstagramMainUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.bg = arg_2_0:findTF("bg")
	arg_2_0.helpBtn = arg_2_0:findTF("mainPanel/helpBtn")
	arg_2_0.chatBtn = arg_2_0:findTF("mainPanel/left/chatBtn")
	arg_2_0.juusBtn = arg_2_0:findTF("mainPanel/left/juusBtn")

	arg_2_0:ChangeChatTip()
	arg_2_0:ChangeJuusTip()
	pg.UIMgr.GetInstance():BlurPanel(arg_2_0._tf, false, {
		groupName = "Instagram",
		weight = LayerWeightConst.SECOND_LAYER
	})
end

function var_0_0.didEnter(arg_3_0)
	arg_3_0:SetUp()
	triggerButton(arg_3_0.chatBtn)
end

function var_0_0.SetUp(arg_4_0)
	onButton(arg_4_0, arg_4_0.bg, function()
		arg_4_0:OnClose()
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.helpBtn, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.music_juus.tip
		})
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.chatBtn, function()
		if isActive(arg_4_0:findTF("choose", arg_4_0.juusBtn)) then
			arg_4_0:emit(InstagramMainMediator.CLOSE_JUUS_DETAIL)
		end

		SetActive(arg_4_0:findTF("choose", arg_4_0.chatBtn), true)
		SetActive(arg_4_0:findTF("choose", arg_4_0.juusBtn), false)
		arg_4_0:emit(InstagramMainMediator.OPEN_CHAT)
		arg_4_0:emit(InstagramMainMediator.CLOSE_JUUS)
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.juusBtn, function()
		SetActive(arg_4_0:findTF("choose", arg_4_0.chatBtn), false)
		SetActive(arg_4_0:findTF("choose", arg_4_0.juusBtn), true)
		arg_4_0:emit(InstagramMainMediator.OPEN_JUUS)
		arg_4_0:emit(InstagramMainMediator.CLOSE_CHAT)
	end, SFX_PANEL)
end

function var_0_0.OnClose(arg_9_0)
	if isActive(arg_9_0:findTF("choose", arg_9_0.juusBtn)) then
		arg_9_0:emit(InstagramMainMediator.JUUS_BACK_PRESSED)
	else
		arg_9_0:closeView()
	end
end

function var_0_0.ChangeJuusTip(arg_10_0)
	local var_10_0 = getProxy(InstagramProxy)

	SetActive(arg_10_0:findTF("tip", arg_10_0.juusBtn), var_10_0:ShouldShowTip())
end

function var_0_0.ChangeChatTip(arg_11_0)
	local var_11_0 = getProxy(InstagramChatProxy)

	SetActive(arg_11_0:findTF("tip", arg_11_0.chatBtn), var_11_0:ShouldShowTip())
end

return var_0_0
