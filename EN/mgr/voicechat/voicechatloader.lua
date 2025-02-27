local var_0_0 = class("VoiceChatLoader", import("view.base.BaseSubView"))
local var_0_1 = 1
local var_0_2 = 2
local var_0_3 = 3
local var_0_4 = 4

function var_0_0.getUIName(arg_1_0)
	return "VoiceChatUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.stateTxt = arg_2_0:findTF("front/label"):GetComponent(typeof(Text))
	arg_2_0.stateEnTxt = arg_2_0:findTF("front/label/en"):GetComponent(typeof(Text))
	arg_2_0.timeTxt = arg_2_0:findTF("front/label/time"):GetComponent(typeof(Text))
	arg_2_0.respondBtn = arg_2_0:findTF("front/btns/respond")
	arg_2_0.closeBtn = arg_2_0:findTF("front/btns/close_btn")
	arg_2_0.optionPanel = arg_2_0._tf:Find("front/options_panel")
	arg_2_0.bgImg = arg_2_0._tf:Find("back/bg"):GetComponent(typeof(Image))
	arg_2_0.player = VoiceChatPlayer.New(arg_2_0._go)
	arg_2_0.state = var_0_1
end

local var_0_5 = {
	"",
	"JP",
	"KR",
	"US",
	""
}

function var_0_0.LoadScript(arg_3_0, arg_3_1)
	local var_3_0 = var_0_5[PLATFORM_CODE]

	if arg_3_1 == "index" then
		arg_3_1 = arg_3_1 .. var_3_0
	end

	local var_3_1

	if PLATFORM_CODE == PLATFORM_JP then
		var_3_1 = "GameCfg.story" .. var_3_0 .. "." .. arg_3_1
	else
		var_3_1 = "GameCfg.story" .. "." .. arg_3_1
	end

	local var_3_2, var_3_3 = pcall(function()
		return require(var_3_1)
	end)

	assert(var_3_3, "load script failed:" .. arg_3_1)

	return VoiceChat.New(var_3_3)
end

function var_0_0.Play(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = arg_5_0:LoadScript(arg_5_1)
	local var_5_1 = {}

	table.insert(var_5_1, function(arg_6_0)
		arg_5_0:WaitForRespond(var_5_0, arg_6_0)
	end)
	table.insert(var_5_1, function(arg_7_0)
		arg_5_0:StartAction(var_5_0)
		arg_7_0()
	end)

	for iter_5_0, iter_5_1 in ipairs(var_5_0.steps) do
		table.insert(var_5_1, function(arg_8_0)
			arg_5_0.player:Play(var_5_0, iter_5_0, arg_8_0)
		end)
	end

	table.insert(var_5_1, function(arg_9_0)
		arg_5_0:WaitForHangUp(arg_9_0)
	end)

	arg_5_0.script = var_5_0

	arg_5_0:InitAction(var_5_0)
	seriesAsync(var_5_1, function()
		arg_5_0:EndAction()

		if arg_5_2 then
			arg_5_2()
		end
	end)
end

function var_0_0.InitAction(arg_11_0, arg_11_1)
	arg_11_0.state = var_0_2

	removeOnButton(arg_11_0.respondBtn)
	removeOnButton(arg_11_0.closeBtn)
	setActive(arg_11_0.optionPanel, false)
	arg_11_0:Show()

	local var_11_0 = arg_11_1:GetBgName()

	if var_11_0 then
		arg_11_0.bgImg.sprite = LoadSprite("bg/" .. var_11_0)

		arg_11_0.bgImg:SetNativeSize()
	end

	arg_11_0.player:OnStart()
end

function var_0_0.WaitForRespond(arg_12_0, arg_12_1, arg_12_2)
	setActive(arg_12_0.respondBtn, true)
	setActive(arg_12_0.closeBtn, true)

	arg_12_0.stateTxt.text = i18n("dorm3d_VIDEO_CHAT_LABEL", arg_12_1:GetShipName())
	arg_12_0.stateEnTxt.text = "P R I V A T E C H A T"

	onButton(arg_12_0, arg_12_0.respondBtn, arg_12_2, SFX_PANEL)
	onButton(arg_12_0, arg_12_0.closeBtn, function()
		arg_12_0:Stop()
	end, SFX_PANEL)
end

local function var_0_6(arg_14_0)
	local var_14_0 = math.floor(arg_14_0 / 60)
	local var_14_1 = arg_14_0 % 60

	return string.format("%02d:%02d", var_14_0, var_14_1)
end

function var_0_0.StartAction(arg_15_0, arg_15_1)
	arg_15_0.state = var_0_3
	arg_15_0.stateEnTxt.text = "V I D E O  I N V I T E"

	local var_15_0 = 0

	arg_15_0:AddTimer(1, function()
		var_15_0 = var_15_0 + 1
		arg_15_0.timeTxt.text = var_0_6(var_15_0)
	end)
	setActive(arg_15_0.respondBtn, false)
end

function var_0_0.WaitForHangUp(arg_17_0, arg_17_1)
	arg_17_0:RemoveTimer()

	arg_17_0.timeTxt.text = ""

	arg_17_0:AddWaitTimer(2, arg_17_1)
end

function var_0_0.EndAction(arg_18_0)
	arg_18_0:RemoveWaitTimer()
	arg_18_0:RemoveTimer()
	arg_18_0:Hide()
	arg_18_0.player:OnEnd()

	arg_18_0.script = nil
	arg_18_0.state = var_0_4

	removeOnButton(arg_18_0.respondBtn)
	removeOnButton(arg_18_0.closeBtn)
end

function var_0_0.IsRunning(arg_19_0)
	return arg_19_0.state == var_0_3 or arg_19_0.state == var_0_2
end

function var_0_0.Stop(arg_20_0)
	if not arg_20_0:IsRunning() then
		return
	end

	if arg_20_0.state == var_0_3 then
		arg_20_0.script:MarkSkip()
		arg_20_0.player:OnStop()
	elseif arg_20_0.state == var_0_2 then
		arg_20_0:EndAction()
	end
end

function var_0_0.OnDestroy(arg_21_0)
	if arg_21_0:isShowing() then
		arg_21_0:Hide()
	end

	arg_21_0:RemoveWaitTimer()
	arg_21_0:RemoveTimer()
end

function var_0_0.AddTimer(arg_22_0, arg_22_1, arg_22_2)
	arg_22_0:RemoveTimer()

	arg_22_0.timer = Timer.New(arg_22_2, arg_22_1, -1)

	arg_22_0.timer.func()
	arg_22_0.timer:Start()
end

function var_0_0.RemoveTimer(arg_23_0)
	if arg_23_0.timer then
		arg_23_0.timer:Stop()

		arg_23_0.timer = nil
	end
end

function var_0_0.AddWaitTimer(arg_24_0, arg_24_1, arg_24_2)
	arg_24_0:RemoveWaitTimer()

	arg_24_0.waitTimer = Timer.New(arg_24_2, arg_24_1, 1)

	arg_24_0.waitTimer:Start()
end

function var_0_0.RemoveWaitTimer(arg_25_0)
	if arg_25_0.waitTimer then
		arg_25_0.waitTimer:Stop()

		arg_25_0.waitTimer = nil
	end
end

return var_0_0
