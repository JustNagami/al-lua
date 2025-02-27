local var_0_0 = class("VoiceChatPlayer", import("Mgr.Story.model.animation.StoryAnimtion"))
local var_0_1 = 0
local var_0_2 = 1
local var_0_3 = 2
local var_0_4 = 3
local var_0_5 = 4

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0)

	arg_1_0._tf = arg_1_1.transform
	arg_1_0.content = arg_1_0._tf:Find("front/Text"):GetComponent(typeof(Text))
	arg_1_0.optionPanel = arg_1_0._tf:Find("front/options_panel")
	arg_1_0.optionUIList = UIItemList.New(arg_1_0.optionPanel:Find("options_c"), arg_1_0.optionPanel:Find("options_c/option_tpl"))
	arg_1_0.closeBtn = arg_1_0._tf:Find("front/btns/close_btn")
end

function var_0_0.Play(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	if not arg_2_1 then
		arg_2_3()

		return
	end

	local var_2_0 = arg_2_1:GetStepByIndex(arg_2_2)

	if not var_2_0 then
		arg_2_3()

		return
	end

	arg_2_0.callback = arg_2_3

	arg_2_0:Reset(var_2_0)
	seriesAsync({
		function(arg_3_0)
			if not arg_2_0:EnterPhase(var_0_2) then
				return
			end

			arg_2_0:PlayVoice(var_2_0)
			arg_2_0:ReigsetEvent(var_2_0, arg_3_0)
		end,
		function(arg_4_0)
			if not arg_2_0:EnterPhase(var_0_3) then
				return
			end

			arg_2_0:ClearEvent()
			arg_2_0:ClearChatTimer()
			arg_2_0:DelayCall(0.2, arg_4_0)
		end,
		function(arg_5_0)
			if not arg_2_0:EnterPhase(var_0_4) then
				return
			end

			arg_2_0:StopVoice()
			arg_2_0:InitOptionIfNeed(arg_2_1, var_2_0, arg_5_0)
		end,
		function(arg_6_0)
			if not arg_2_0:EnterPhase(var_0_5) then
				return
			end

			arg_2_0:Clear(var_2_0, arg_6_0)
		end
	}, arg_2_3)
end

function var_0_0.EnterPhase(arg_7_0, arg_7_1)
	if arg_7_1 - 1 ~= arg_7_0.phase then
		return false
	end

	arg_7_0.phase = arg_7_1

	return true
end

function var_0_0.Reset(arg_8_0, arg_8_1)
	arg_8_0.phase = var_0_1

	setActive(arg_8_0.optionPanel, false)
	arg_8_0:ClearEvent()
end

function var_0_0.StopVoice(arg_9_0)
	if arg_9_0.currentVoice then
		arg_9_0.currentVoice:Stop(true)

		arg_9_0.currentVoice = nil
	end
end

function var_0_0.PlayVoice(arg_10_0, arg_10_1)
	arg_10_0:StopVoice()

	arg_10_0.content.text = arg_10_1:GetSay()

	local var_10_0 = arg_10_1:GetVoice()

	pg.CriMgr.GetInstance():PlaySoundEffect_V3(var_10_0, function(arg_11_0)
		if arg_11_0 then
			arg_10_0.currentVoice = arg_11_0.playback
		end

		local var_11_0 = arg_11_0:GetLength() * 0.001
		local var_11_1 = arg_10_1:GetWaitForClickTime()

		assert(var_11_1 < var_11_0, "chatShowTime must > wait time")
		arg_10_0:AddTimeTriggerNextOne(var_11_0)
	end)
end

function var_0_0.AddTimeTriggerNextOne(arg_12_0, arg_12_1)
	arg_12_0.chatTimer = arg_12_0:CreateDelayTimer(arg_12_1, function()
		arg_12_0:ClearChatTimer()
		triggerButton(arg_12_0._tf)
	end)
end

function var_0_0.ClearChatTimer(arg_14_0)
	if arg_14_0.chatTimer then
		arg_14_0.chatTimer:Stop()

		arg_14_0.chatTimer = nil
	end
end

function var_0_0.ReigsetEvent(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = arg_15_1:GetWaitForClickTime()

	arg_15_0:DelayCall(var_15_0, function()
		onButton(arg_15_0, arg_15_0._tf, arg_15_2, SFX_PANEL)
	end)
end

function var_0_0.ClearEvent(arg_17_0)
	removeOnButton(arg_17_0._tf)
end

function var_0_0.InitOptionIfNeed(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
	setActive(arg_18_0.optionPanel, arg_18_2:ExistOption())

	if not arg_18_2:ExistOption() then
		arg_18_3()

		return
	end

	setActive(arg_18_0.closeBtn, false)

	local var_18_0 = arg_18_2:GetOptions()

	arg_18_0.optionUIList:make(function(arg_19_0, arg_19_1, arg_19_2)
		if arg_19_0 == UIItemList.EventUpdate then
			local var_19_0 = var_18_0[arg_19_1 + 1]

			arg_19_2:Find("content/Text"):GetComponent(typeof(Text)).text = var_19_0[1]

			onButton(arg_18_0, arg_19_2, function()
				arg_18_1:SetBranchCode(var_19_0[2])
				arg_18_3(var_19_0[2])
				setActive(arg_18_0.closeBtn, true)
			end)
		end
	end)
	arg_18_0.optionUIList:align(#var_18_0)
end

function var_0_0.Clear(arg_21_0, arg_21_1, arg_21_2)
	arg_21_0:ClearAnimation()
	arg_21_0:StopVoice()
	setActive(arg_21_0.optionPanel, false)

	arg_21_0.callback = nil

	arg_21_2()
end

function var_0_0.OnPause(arg_22_0)
	return
end

function var_0_0.OnResume(arg_23_0)
	return
end

function var_0_0.OnStop(arg_24_0)
	arg_24_0:Reset()
	arg_24_0:ClearAnimation()
	arg_24_0:StopVoice()

	if arg_24_0.callback then
		arg_24_0.callback()

		arg_24_0.callback = nil
	end
end

function var_0_0.OnStart(arg_25_0, arg_25_1)
	pg.DelegateInfo.New(arg_25_0)
end

function var_0_0.OnEnd(arg_26_0, arg_26_1)
	pg.DelegateInfo.Dispose(arg_26_0)
end

return var_0_0
