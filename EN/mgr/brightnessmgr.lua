pg = pg or {}

local var_0_0 = pg
local var_0_1 = singletonClass("BrightnessMgr")

var_0_0.BrightnessMgr = var_0_1

local var_0_2 = YSNormalTool.BrightnessTool

var_0_1.AutoIntoDarkModeTime = 10
var_0_1.DarkModeBrightness = 0.1
var_0_1.BrightnessMode = {
	AUTO_ANDROID = 1,
	MANUAL_ANDROID = 0,
	MANUAL_IOS = 2
}

function var_0_1.Init(arg_1_0, arg_1_1)
	GlobalClickEventMgr.Inst:AddPointerDownFunc(function()
		if not arg_1_0.manulStatus then
			return
		end

		arg_1_0:AwakeForAWhile()
	end)

	arg_1_0.manulStatus = false
	arg_1_0.originalBrightnessValue = 0
	arg_1_0.originalBrightnessMode = 0
	arg_1_0.sleepTimeOutCounter = 0

	arg_1_1()
end

function var_0_1.AwakeForAWhile(arg_3_0)
	if not arg_3_0:IsPermissionGranted() then
		arg_3_0:ExitManualMode()

		return
	end

	var_0_2.SetBrightnessValue(arg_3_0.originalBrightnessValue)
	arg_3_0:SetDelayTask()
end

function var_0_1.SetDelayTask(arg_4_0)
	arg_4_0:ClearTask()

	arg_4_0.task = Timer.New(function()
		var_0_2.SetBrightnessValue(math.min(var_0_1.DarkModeBrightness, arg_4_0.originalBrightnessValue))
	end, var_0_1.AutoIntoDarkModeTime)

	arg_4_0.task:Start()
end

function var_0_1.ClearTask(arg_6_0)
	if not arg_6_0.task then
		return
	end

	arg_6_0.task:Stop()

	arg_6_0.task = nil
end

function var_0_1.EnterManualMode(arg_7_0)
	if arg_7_0.manulStatus then
		return
	end

	local var_7_0 = var_0_2.GetBrightnessValue()

	arg_7_0.originalBrightnessValue = var_7_0

	var_0_2.SetBrightnessValue(math.min(var_0_1.DarkModeBrightness, var_7_0))

	arg_7_0.manulStatus = true
end

function var_0_1.ExitManualMode(arg_8_0)
	if not arg_8_0.manulStatus then
		return
	end

	var_0_2.SetBrightnessValue(arg_8_0.originalBrightnessValue)
	arg_8_0:ClearTask()

	arg_8_0.manulStatus = false
end

function var_0_1.IsPermissionGranted(arg_9_0)
	return var_0_2.CanWriteSetting()
end

function var_0_1.OpenPermissionSettings(arg_10_0)
	YSNormalTool.OtherTool.OpenAndroidWriteSettings()
end

function var_0_1.RequestPremission(arg_11_0, arg_11_1)
	arg_11_0:OpenPermissionSettings()

	if arg_11_1 then
		FrameTimer.New(function()
			arg_11_1(arg_11_0:IsPermissionGranted())
		end, 2):Start()
	end
end

function var_0_1.SetScreenNeverSleep(arg_13_0, arg_13_1)
	arg_13_1 = tobool(arg_13_1)

	if arg_13_1 then
		if arg_13_0.sleepTimeOutCounter == 0 then
			Screen.sleepTimeout = SleepTimeout.NeverSleep
		end

		arg_13_0.sleepTimeOutCounter = arg_13_0.sleepTimeOutCounter + 1
	else
		arg_13_0.sleepTimeOutCounter = arg_13_0.sleepTimeOutCounter - 1

		assert(arg_13_0.sleepTimeOutCounter >= 0, "InCorrect Call of SetScreenNeverSleep")

		arg_13_0.sleepTimeOutCounter = math.max(0, arg_13_0.sleepTimeOutCounter)

		if arg_13_0.sleepTimeOutCounter == 0 then
			Screen.sleepTimeout = SleepTimeout.SystemSetting
		end
	end
end
