local var_0_0 = class("IslandStoryMgr", import("view.base.BaseSubView"))
local var_0_1 = 0
local var_0_2 = 1
local var_0_3 = 2
local var_0_4 = Color.New(1, 0.8705, 0.4196, 1)
local var_0_5 = Color.New(1, 1, 1, 1)

function var_0_0.getUIName(arg_1_0)
	return "IslandStoryUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.skipBtn = arg_2_0._tf:Find("front/btns/btns/skip_button")
	arg_2_0.logBtn = arg_2_0._tf:Find("front/btns/record")
	arg_2_0.autoBtn = arg_2_0._tf:Find("front/btns/btns/auto_button")
	arg_2_0.autoBtnImg = findTF(arg_2_0._tf, "front/btns/btns/auto_button/sel"):GetComponent(typeof(Image))
	arg_2_0.player = Dialogue3DPlayer.New(arg_2_0)
	arg_2_0.recordPanel = IslandStoryRecordPanel.New(arg_2_0)
	arg_2_0.recorder = IslandStoryRecorder.New()
	arg_2_0.setSpeedPanel = StorySetSpeedPanel.New(arg_2_0._tf, function(arg_3_0)
		if arg_2_0:IsRunning() and arg_2_0.script then
			arg_2_0.script:SetPlaySpeed(arg_3_0)
		end
	end)

	setActive(arg_2_0._go, false)

	arg_2_0.state = var_0_1
end

function var_0_0.Play(arg_4_0, arg_4_1, arg_4_2)
	if not _IslandCore then
		return
	end

	if arg_4_0:IsRunning() then
		arg_4_2()

		return
	end

	local var_4_0 = _IslandCore:GetView():GetUnitList()

	arg_4_0.state = var_0_2

	local var_4_1 = pg.NewStoryMgr.GetInstance():GetScript(arg_4_1)
	local var_4_2 = IslandStory.New(var_4_1, var_4_0, IslandStory.MODE_DIALOGUE)

	arg_4_0.script = var_4_2

	arg_4_0:StartScript(var_4_2)

	local var_4_3 = {}

	for iter_4_0, iter_4_1 in ipairs(var_4_2.steps) do
		table.insert(var_4_3, function(arg_5_0)
			arg_4_0.player:Play(arg_4_0.recorder, iter_4_0, var_4_2, arg_5_0)
		end)
	end

	seriesAsync(var_4_3, function()
		arg_4_0:EndScript(var_4_2)

		if arg_4_2 then
			arg_4_2()
		end
	end)
end

function var_0_0.StartScript(arg_7_0, arg_7_1)
	arg_7_0.recorder:Clear()
	setActive(arg_7_0._go, true)
	arg_7_0:RegisterSkipBtn()
	arg_7_0:RegisterLogBtn()
	arg_7_0:RegisterAutoBtn()
	arg_7_0.player:OnStart(arg_7_1)

	if _IslandCore then
		_IslandCore:Link(ISLAND_EVT.START_STORY)
	end
end

function var_0_0.RegisterAutoBtn(arg_8_0)
	onButton(arg_8_0, arg_8_0.autoBtn, function()
		if not arg_8_0.script then
			return
		end

		if arg_8_0.script:GetAutoPlayFlag() then
			arg_8_0.script:StopAutoPlay()
			arg_8_0.player:CancelAuto()
		else
			arg_8_0.script:SetAutoPlay()
			arg_8_0.player:NextOne()
		end

		arg_8_0:UpdateAutoBtn()
	end, SFX_PANEL)
	arg_8_0:UpdateAutoBtn()
end

function var_0_0.UpdateAutoBtn(arg_10_0)
	local var_10_0 = arg_10_0.script:GetAutoPlayFlag()

	arg_10_0:ClearAutoBtn(var_10_0)
end

function var_0_0.ClearAutoBtn(arg_11_0, arg_11_1)
	if not arg_11_0.script then
		return
	end

	arg_11_0.autoBtnImg.color = arg_11_1 and var_0_4 or var_0_5

	local var_11_0 = arg_11_1 and "Show" or "Hide"

	arg_11_0.setSpeedPanel[var_11_0](arg_11_0.setSpeedPanel, arg_11_0.script)
end

function var_0_0.RegisterSkipBtn(arg_12_0)
	onButton(arg_12_0, arg_12_0.skipBtn, function()
		arg_12_0.script:MarkSkipAll()
		arg_12_0.player:NextOne()
	end, SFX_PANEL)
end

function var_0_0.RegisterLogBtn(arg_14_0)
	onButton(arg_14_0, arg_14_0.logBtn, function()
		if not arg_14_0.recordPanel:CanOpen() then
			return
		end

		arg_14_0.recordPanel:Show(arg_14_0.recorder)
	end, SFX_PANEL)
end

function var_0_0.EndScript(arg_16_0, arg_16_1)
	setActive(arg_16_0._go, false)
	removeOnButton(arg_16_0.skipBtn)
	removeOnButton(arg_16_0.logBtn)
	arg_16_0:ClearAutoBtn(false)
	arg_16_0.recorder:Clear()
	arg_16_0.recordPanel:Hide()
	arg_16_0.setSpeedPanel:Clear()

	arg_16_0.state = var_0_3
	arg_16_0.script = nil

	arg_16_0.player:OnEnd(arg_16_1)

	if _IslandCore then
		_IslandCore:Link(ISLAND_EVT.END_STORY)
	end
end

function var_0_0.IsRunning(arg_17_0)
	return arg_17_0.state == var_0_2
end

function var_0_0.OnDestroy(arg_18_0)
	arg_18_0.recorder:Dispose()
	arg_18_0.recordPanel:Dispose()
	arg_18_0.setSpeedPanel:Dispose()
end

return var_0_0
