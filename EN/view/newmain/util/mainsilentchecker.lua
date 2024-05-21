local var_0_0 = class("MainSilentChecker", import("view.base.BaseEventLogic"))

function var_0_0.Ctor(arg_1_0, arg_1_1)
	var_0_0.super.Ctor(arg_1_0, arg_1_1)

	arg_1_0.inactivityTimeout = pg.gameset.main_scene_silent_time.key_value
end

function var_0_0.SetUp(arg_2_0)
	arg_2_0:Clear()

	arg_2_0.lastActivityTime = Time.time

	if not arg_2_0.handle then
		arg_2_0.handle = UpdateBeat:CreateListener(arg_2_0.Update, arg_2_0)
	end

	UpdateBeat:AddListener(arg_2_0.handle)
end

function var_0_0.Update(arg_3_0)
	if IsUnityEditor then
		if Input.anyKeyDown then
			arg_3_0.lastActivityTime = Time.time
		end
	elseif Input.touchCount > 0 then
		arg_3_0.lastActivityTime = Time.time
	end

	if Time.time - arg_3_0.lastActivityTime > arg_3_0.inactivityTimeout then
		arg_3_0:EnterState()
	end
end

function var_0_0.EnterState(arg_4_0)
	if arg_4_0:AnyOverlayShowing() then
		arg_4_0.lastActivityTime = Time.time

		return
	end

	arg_4_0:Clear()
	arg_4_0:emit(NewMainScene.ENTER_SILENT_VIEW)
end

function var_0_0.AnyOverlayShowing(arg_5_0)
	local var_5_0 = getProxy(ContextProxy):getCurrentContext()
	local var_5_1 = pg.LayerWeightMgr.GetInstance().uiOrigin

	return pg.NewStoryMgr.GetInstance():IsRunning() or pg.NewGuideMgr.GetInstance():IsBusy() or isActive(pg.MsgboxMgr.GetInstance()._tf) or var_5_0:hasChild() or var_5_1.childCount > 0
end

function var_0_0.Clear(arg_6_0)
	if arg_6_0.handle then
		UpdateBeat:RemoveListener(arg_6_0.handle)

		arg_6_0.handle = nil
	end
end

function var_0_0.Disable(arg_7_0)
	arg_7_0:Clear()
end

function var_0_0.Dispose(arg_8_0)
	arg_8_0:Disable()
	arg_8_0:disposeEvent()
end

return var_0_0
