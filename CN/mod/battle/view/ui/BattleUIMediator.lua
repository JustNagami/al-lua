ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleEvent
local var_0_2 = var_0_0.Battle.BattleUnitEvent
local var_0_3 = var_0_0.Battle.BattleConst
local var_0_4 = var_0_0.Battle.BattleVariable
local var_0_5 = var_0_0.Battle.BattleConfig
local var_0_6 = var_0_0.Battle.BattleCardPuzzleEvent
local var_0_7 = class("BattleUIMediator", var_0_0.MVC.Mediator)

var_0_0.Battle.BattleUIMediator = var_0_7
var_0_7.__name = "BattleUIMediator"

function var_0_7.Ctor(arg_1_0)
	var_0_7.super.Ctor(arg_1_0)
end

function var_0_7.SetBattleUI(arg_2_0)
	arg_2_0._ui = arg_2_0._state:GetUI()
end

function var_0_7.Initialize(arg_3_0)
	var_0_7.super.Initialize(arg_3_0)

	arg_3_0._dataProxy = arg_3_0._state:GetProxyByName(var_0_0.Battle.BattleDataProxy.__name)
	arg_3_0._uiMGR = pg.UIMgr.GetInstance()
	arg_3_0._fxPool = var_0_0.Battle.BattleFXPool.GetInstance()
	arg_3_0._updateViewList = {}

	arg_3_0:SetBattleUI()
	arg_3_0:AddUIEvent()
	arg_3_0:InitCamera()
	arg_3_0:InitGuide()
end

function var_0_7.Reinitialize(arg_4_0)
	arg_4_0._skillView:Dispose()
end

function var_0_7.EnableComponent(arg_5_0, arg_5_1)
	arg_5_0._ui:findTF("PauseBtn"):GetComponent(typeof(Button)).enabled = arg_5_1

	arg_5_0._skillView:EnableWeaponButton(arg_5_1)
end

function var_0_7.EnableJoystick(arg_6_0, arg_6_1)
	arg_6_0._stickController.enabled = arg_6_1

	local var_6_0 = arg_6_0._joystick:GetComponent(typeof(Animation))

	if var_6_0 then
		var_6_0.enabled = arg_6_1
	end

	local var_6_1 = arg_6_0._joystick:GetComponent(typeof(Animator))

	if var_6_1 then
		var_6_1.enabled = arg_6_1
	end

	setActive(arg_6_0._joystick, arg_6_1)

	local var_6_2 = arg_6_0._joystick:Find("Area/BG/spine")

	if var_6_2 then
		local var_6_3 = var_6_2:GetComponent(typeof(SpineAnimUI))

		if arg_6_1 then
			var_6_3:SetAction("cut_in", 0)
		end
	end
end

function var_0_7.EnableWeaponButton(arg_7_0, arg_7_1)
	arg_7_0._skillView:EnableWeaponButton(arg_7_1)
end

function var_0_7.EnableSkillFloat(arg_8_0, arg_8_1)
	arg_8_0._ui:EnableSkillFloat(arg_8_1)
end

function var_0_7.GetAppearFX(arg_9_0)
	return arg_9_0._appearEffect
end

function var_0_7.DisableComponent(arg_10_0)
	arg_10_0._ui:findTF("PauseBtn"):GetComponent(typeof(Button)).enabled = false

	arg_10_0._skillView:DisableWeapnButton()
	SetActive(arg_10_0._ui:findTF("HPBarContainer"), false)
	SetActive(arg_10_0._ui:findTF("flagShipMark"), false)

	if arg_10_0._jammingView then
		arg_10_0._jammingView:Eliminate(false)
	end

	if arg_10_0._inkView then
		arg_10_0._inkView:SetActive(false)
	end
end

function var_0_7.ActiveDebugConsole(arg_11_0)
	arg_11_0._debugConsoleView:SetActive(true)
end

function var_0_7.OpeningEffect(arg_12_0, arg_12_1, arg_12_2)
	arg_12_0._uiMGR:SetActive(false)

	if arg_12_2 == SYSTEM_SUBMARINE_RUN then
		arg_12_0._skillView:SubmarineButton()

		local var_12_0 = var_0_5.JOY_STICK_DEFAULT_PREFERENCE

		arg_12_0._joystick.anchorMin = Vector2(var_12_0.x, var_12_0.y)
		arg_12_0._joystick.anchorMax = Vector2(var_12_0.x, var_12_0.y)
	elseif arg_12_2 == SYSTEM_SUB_ROUTINE then
		arg_12_0._skillView:SubRoutineButton()
	elseif arg_12_2 == SYSTEM_AIRFIGHT then
		arg_12_0._skillView:AirFightButton()
	elseif arg_12_2 == SYSTEM_DEBUG then
		arg_12_0._skillView:NormalButton()
	elseif arg_12_2 == SYSTEM_CARDPUZZLE then
		arg_12_0._skillView:CardPuzzleButton()
	else
		local var_12_1 = pg.SeriesGuideMgr.GetInstance()

		if var_12_1.currIndex and var_12_1:isEnd() then
			arg_12_0._skillView:NormalButton()
		else
			local var_12_2 = arg_12_0._dataProxy:GetDungeonData().skill_hide or {}

			arg_12_0._skillView:CustomButton(var_12_2)
		end
	end

	LeanTween.delayedCall(var_0_5.COMBAT_DELAY_ACTIVE, System.Action(function()
		arg_12_0._uiMGR:SetActive(true)
		arg_12_0:EnableComponent(true)

		if arg_12_1 then
			arg_12_1()
		end
	end))
	SetActive(arg_12_0._ui._go, true)
	arg_12_0._skillView:ButtonInitialAnima()
end

function var_0_7.InitScene(arg_14_0)
	arg_14_0._mapId = arg_14_0._dataProxy._mapId
	arg_14_0._seaView = var_0_0.Battle.BattleMap.New(arg_14_0._mapId)
end

function var_0_7.InitJoystick(arg_15_0)
	arg_15_0._joystick = arg_15_0._ui:findTF("Stick")

	local var_15_0 = var_0_5.JOY_STICK_DEFAULT_PREFERENCE
	local var_15_1 = arg_15_0._joystick
	local var_15_2 = 1
	local var_15_3 = PlayerPrefs.GetFloat("joystick_scale", var_15_0.scale)
	local var_15_4 = PlayerPrefs.GetFloat("joystick_anchorX", var_15_0.x)
	local var_15_5 = PlayerPrefs.GetFloat("joystick_anchorY", var_15_0.y)
	local var_15_6 = var_15_2 * var_15_3

	arg_15_0._joystick.localScale = Vector3(var_15_6, var_15_6, 1)

	originalPrint("scale: ", arg_15_0._joystick.localScale)

	var_15_1.anchoredPosition = var_15_1.anchoredPosition * var_15_6
	arg_15_0._joystick.anchorMin = Vector2(var_15_4, var_15_5)
	arg_15_0._joystick.anchorMax = Vector2(var_15_4, var_15_5)
	arg_15_0._stickController = arg_15_0._joystick:GetComponent("StickController")

	arg_15_0._uiMGR:AttachStickOb(arg_15_0._joystick)

	local var_15_7 = arg_15_0._joystick:Find("Area/BG/spine")

	if var_15_7 then
		local var_15_8 = var_15_7:GetComponent(typeof(SpineAnimUI))

		var_15_8:SetActionCallBack(function(arg_16_0)
			if arg_16_0 == "finish" then
				if arg_15_0._stickController.enabled then
					var_15_8:SetAction("normal", 0)
				else
					SetActive(arg_15_0._joystick, false)
				end
			end
		end)
	end
end

function var_0_7.InitTimer(arg_17_0)
	if arg_17_0._dataProxy:GetInitData().battleType == SYSTEM_DUEL then
		arg_17_0._timerView = var_0_0.Battle.BattleTimerView.New(arg_17_0._ui:findTF("DuelTimer"))
	else
		arg_17_0._timerView = var_0_0.Battle.BattleTimerView.New(arg_17_0._ui:findTF("Timer"))
	end
end

function var_0_7.InitEnemyHpBar(arg_18_0)
	arg_18_0._enemyHpBar = var_0_0.Battle.BattleEnmeyHpBarView.New(arg_18_0._ui:findTF("EnemyHPBar"))
end

function var_0_7.InitAirStrikeIcon(arg_19_0)
	arg_19_0._airStrikeView = var_0_0.Battle.BattleAirStrikeIconView.New(arg_19_0._ui:findTF("AirFighterContainer/AirStrikeIcon"))
	arg_19_0._airSupportTF = arg_19_0._ui:findTF("AirSupportLabel")
end

function var_0_7.InitCommonWarning(arg_20_0)
	arg_20_0._warningView = var_0_0.Battle.BattleCommonWarningView.New(arg_20_0._ui:findTF("WarningView"))
	arg_20_0._updateViewList[arg_20_0._warningView] = true
end

function var_0_7.InitScoreBar(arg_21_0)
	arg_21_0._scoreBarView = var_0_0.Battle.BattleScoreBarView.New(arg_21_0._ui:findTF("DodgemCountBar"))
end

function var_0_7.InitAirFightScoreBar(arg_22_0)
	arg_22_0._scoreBarView = var_0_0.Battle.BattleScoreBarView.New(arg_22_0._ui:findTF("AirFightCountBar"))
end

function var_0_7.InitAutoBtn(arg_23_0)
	arg_23_0._autoBtn = arg_23_0._ui:findTF("AutoBtn")

	local var_23_0 = var_0_5.AUTO_DEFAULT_PREFERENCE
	local var_23_1 = PlayerPrefs.GetFloat("auto_scale", var_23_0.scale)
	local var_23_2 = PlayerPrefs.GetFloat("auto_anchorX", var_23_0.x)
	local var_23_3 = PlayerPrefs.GetFloat("auto_anchorY", var_23_0.y)

	arg_23_0._autoBtn.localScale = Vector3(var_23_1, var_23_1, 1)
	arg_23_0._autoBtn.anchorMin = Vector2(var_23_2, var_23_3)
	arg_23_0._autoBtn.anchorMax = Vector2(var_23_2, var_23_3)
end

function var_0_7.InitDuelRateBar(arg_24_0)
	arg_24_0._duelRateBar = var_0_0.Battle.BattleDuelDamageRateView.New(arg_24_0._ui:findTF("DuelDamageRate"))

	return arg_24_0._duelRateBar
end

function var_0_7.InitSimulationBuffCounting(arg_25_0)
	arg_25_0._simulationBuffCountView = var_0_0.Battle.BattleSimulationBuffCountView.New(arg_25_0._ui:findTF("SimulationWarning"))

	return arg_25_0._simulationBuffCountView
end

function var_0_7.InitMainDamagedView(arg_26_0)
	arg_26_0._mainDamagedView = var_0_0.Battle.BattleMainDamagedView.New(arg_26_0._ui:findTF("HPWarning"))
end

function var_0_7.InitInkView(arg_27_0, arg_27_1)
	arg_27_0._inkView = var_0_0.Battle.BattleInkView.New(arg_27_0._ui:findTF("InkContainer"))

	arg_27_1:RegisterEventListener(arg_27_0, var_0_1.FLEET_HORIZON_UPDATE, arg_27_0.onFleetHorizonUpdate)
end

function var_0_7.InitDebugConsole(arg_28_0)
	arg_28_0._debugConsoleView = arg_28_0._debugConsoleView or var_0_0.Battle.BattleDebugConsole.New(arg_28_0._ui:findTF("Debug_Console"), arg_28_0._state)
end

function var_0_7.InitCameraGestureSlider(arg_29_0)
	arg_29_0._gesture = var_0_0.Battle.BattleCameraSlider.New(arg_29_0._ui:findTF("CameraController"))

	var_0_0.Battle.BattleCameraUtil.GetInstance():SetCameraSilder(arg_29_0._gesture)
	arg_29_0._cameraUtil:SwitchCameraPos("FOLLOW_GESTURE")
end

function var_0_7.InitAlchemistAPView(arg_30_0)
	arg_30_0._alchemistAP = var_0_0.Battle.BattleReisalinAPView.New(arg_30_0._ui:findTF("APPanel"))
end

function var_0_7.InitGuide(arg_31_0)
	return
end

function var_0_7.InitCamera(arg_32_0)
	arg_32_0._camera = pg.UIMgr.GetInstance():GetMainCamera():GetComponent(typeof(Camera))
	arg_32_0._uiCamera = GameObject.Find("UICamera"):GetComponent(typeof(Camera))
	arg_32_0._cameraUtil = var_0_0.Battle.BattleCameraUtil.GetInstance()

	arg_32_0._cameraUtil:RegisterEventListener(arg_32_0, var_0_1.CAMERA_FOCUS, arg_32_0.onCameraFocus)
	arg_32_0._cameraUtil:RegisterEventListener(arg_32_0, var_0_1.SHOW_PAINTING, arg_32_0.onShowPainting)
	arg_32_0._cameraUtil:RegisterEventListener(arg_32_0, var_0_1.BULLET_TIME, arg_32_0.onBulletTime)
end

function var_0_7.Update(arg_33_0)
	for iter_33_0, iter_33_1 in pairs(arg_33_0._updateViewList) do
		iter_33_0:Update()
	end
end

function var_0_7.AddUIEvent(arg_34_0)
	arg_34_0._dataProxy:RegisterEventListener(arg_34_0, var_0_1.STAGE_DATA_INIT_FINISH, arg_34_0.onStageInit)
	arg_34_0._dataProxy:RegisterEventListener(arg_34_0, var_0_1.COMMON_DATA_INIT_FINISH, arg_34_0.onCommonInit)
	arg_34_0._dataProxy:RegisterEventListener(arg_34_0, var_0_1.ADD_FLEET, arg_34_0.onAddFleet)
	arg_34_0._dataProxy:RegisterEventListener(arg_34_0, var_0_1.ADD_UNIT, arg_34_0.onAddUnit)
	arg_34_0._dataProxy:RegisterEventListener(arg_34_0, var_0_1.REMOVE_UNIT, arg_34_0.onRemoveUnit)
	arg_34_0._dataProxy:RegisterEventListener(arg_34_0, var_0_1.HIT_ENEMY, arg_34_0.onEnemyHit)
	arg_34_0._dataProxy:RegisterEventListener(arg_34_0, var_0_1.ADD_AIR_FIGHTER_ICON, arg_34_0.onAddAirStrike)
	arg_34_0._dataProxy:RegisterEventListener(arg_34_0, var_0_1.REMOVE_AIR_FIGHTER_ICON, arg_34_0.onRemoveAirStrike)
	arg_34_0._dataProxy:RegisterEventListener(arg_34_0, var_0_1.UPDATE_AIR_SUPPORT_LABEL, arg_34_0.onUpdateAirSupportLabel)
	arg_34_0._dataProxy:RegisterEventListener(arg_34_0, var_0_1.UPDATE_HOSTILE_SUBMARINE, arg_34_0.onUpdateHostileSubmarine)
	arg_34_0._dataProxy:RegisterEventListener(arg_34_0, var_0_1.UPDATE_ENVIRONMENT_WARNING, arg_34_0.onUpdateEnvironmentWarning)
	arg_34_0._dataProxy:RegisterEventListener(arg_34_0, var_0_1.UPDATE_COUNT_DOWN, arg_34_0.onUpdateCountDown)
	arg_34_0._dataProxy:RegisterEventListener(arg_34_0, var_0_1.HIDE_INTERACTABLE_BUTTONS, arg_34_0.OnHideButtons)
	arg_34_0._dataProxy:RegisterEventListener(arg_34_0, var_0_1.ADD_UI_FX, arg_34_0.OnAddUIFX)
	arg_34_0._dataProxy:RegisterEventListener(arg_34_0, var_0_1.EDIT_CUSTOM_WARNING_LABEL, arg_34_0.onEditCustomWarning)
	arg_34_0._dataProxy:RegisterEventListener(arg_34_0, var_0_1.GRIDMAN_SKILL_FLOAT, arg_34_0.onGridmanSkillFloat)
	arg_34_0._dataProxy:RegisterEventListener(arg_34_0, var_0_6.CARD_PUZZLE_INIT, arg_34_0.OnCardPuzzleInit)
end

function var_0_7.RemoveUIEvent(arg_35_0)
	arg_35_0._dataProxy:UnregisterEventListener(arg_35_0, var_0_1.COMMON_DATA_INIT_FINISH)
	arg_35_0._dataProxy:UnregisterEventListener(arg_35_0, var_0_1.STAGE_DATA_INIT_FINISH)
	arg_35_0._dataProxy:UnregisterEventListener(arg_35_0, var_0_1.ADD_FLEET)
	arg_35_0._dataProxy:UnregisterEventListener(arg_35_0, var_0_1.ADD_UNIT)
	arg_35_0._dataProxy:UnregisterEventListener(arg_35_0, var_0_1.REMOVE_UNIT)
	arg_35_0._dataProxy:UnregisterEventListener(arg_35_0, var_0_1.HIT_ENEMY)
	arg_35_0._dataProxy:UnregisterEventListener(arg_35_0, var_0_1.UPDATE_COUNT_DOWN)
	arg_35_0._dataProxy:UnregisterEventListener(arg_35_0, var_0_1.ADD_AIR_FIGHTER_ICON)
	arg_35_0._dataProxy:UnregisterEventListener(arg_35_0, var_0_1.REMOVE_AIR_FIGHTER_ICON)
	arg_35_0._dataProxy:UnregisterEventListener(arg_35_0, var_0_1.UPDATE_AIR_SUPPORT_LABEL)
	arg_35_0._cameraUtil:UnregisterEventListener(arg_35_0, var_0_1.SHOW_PAINTING)
	arg_35_0._cameraUtil:UnregisterEventListener(arg_35_0, var_0_1.CAMERA_FOCUS)
	arg_35_0._cameraUtil:UnregisterEventListener(arg_35_0, var_0_1.BULLET_TIME)
	arg_35_0._dataProxy:UnregisterEventListener(arg_35_0, var_0_1.ADD_SUBMARINE_WARINING)
	arg_35_0._dataProxy:UnregisterEventListener(arg_35_0, var_0_1.REMOVE_SUBMARINE_WARINING)
	arg_35_0._dataProxy:UnregisterEventListener(arg_35_0, var_0_1.UPDATE_DODGEM_SCORE)
	arg_35_0._dataProxy:UnregisterEventListener(arg_35_0, var_0_1.UPDATE_DODGEM_COMBO)
	arg_35_0._userFleet:UnregisterEventListener(arg_35_0, var_0_1.SHOW_BUFFER)
	arg_35_0._userFleet:UnregisterEventListener(arg_35_0, var_0_2.POINT_HIT_CHARGE)
	arg_35_0._userFleet:UnregisterEventListener(arg_35_0, var_0_2.POINT_HIT_CANCEL)
	arg_35_0._userFleet:UnregisterEventListener(arg_35_0, var_0_1.MANUAL_SUBMARINE_SHIFT)
	arg_35_0._userFleet:UnregisterEventListener(arg_35_0, var_0_1.FLEET_BLIND)
	arg_35_0._userFleet:UnregisterEventListener(arg_35_0, var_0_1.FLEET_HORIZON_UPDATE)
	arg_35_0._userFleet:UnregisterEventListener(arg_35_0, var_0_1.UPDATE_FLEET_ATTR)
	arg_35_0._dataProxy:UnregisterEventListener(arg_35_0, var_0_1.UPDATE_HOSTILE_SUBMARINE)
	arg_35_0._dataProxy:UnregisterEventListener(arg_35_0, var_0_1.UPDATE_ENVIRONMENT_WARNING)
	arg_35_0._dataProxy:UnregisterEventListener(arg_35_0, var_0_1.HIDE_INTERACTABLE_BUTTONS)
	arg_35_0._dataProxy:UnregisterEventListener(arg_35_0, var_0_1.ADD_UI_FX)
	arg_35_0._dataProxy:UnregisterEventListener(arg_35_0, var_0_1.EDIT_CUSTOM_WARNING_LABEL)
	arg_35_0._dataProxy:UnregisterEventListener(arg_35_0, var_0_1.GRIDMAN_SKILL_FLOAT)
	arg_35_0._dataProxy:UnregisterEventListener(arg_35_0, var_0_6.CARD_PUZZLE_INIT)
	arg_35_0._dataProxy:UnregisterEventListener(arg_35_0, var_0_6.UPDATE_FLEET_SHIP)
	arg_35_0._dataProxy:UnregisterEventListener(arg_35_0, var_0_6.COMMON_BUTTON_ENABLE)
	arg_35_0._dataProxy:UnregisterEventListener(arg_35_0, var_0_6.LONG_PRESS_BULLET_TIME)
	arg_35_0._dataProxy:UnregisterEventListener(arg_35_0, var_0_6.SHOW_CARD_DETAIL)
end

function var_0_7.ShowSkillPainting(arg_36_0, arg_36_1, arg_36_2, arg_36_3)
	arg_36_3 = arg_36_3 or 1

	local var_36_0

	if arg_36_2 then
		var_36_0 = arg_36_2.cutin_cover
	end

	arg_36_0._ui:CutInPainting(arg_36_1:GetTemplate(), arg_36_3, arg_36_1:GetIFF(), var_36_0)
end

function var_0_7.ShowSkillFloat(arg_37_0, arg_37_1, arg_37_2, arg_37_3)
	arg_37_0._ui:SkillHrzPop(arg_37_2, arg_37_1, arg_37_3)
end

function var_0_7.ShowSkillFloatCover(arg_38_0, arg_38_1, arg_38_2, arg_38_3)
	arg_38_0._ui:SkillHrzPopCover(arg_38_2, arg_38_1, arg_38_3)
end

function var_0_7.SeaSurfaceShift(arg_39_0, arg_39_1, arg_39_2, arg_39_3, arg_39_4)
	local var_39_0 = arg_39_3 or var_0_0.Battle.BattleConfig.calcInterval

	arg_39_0._seaView:ShiftSurface(arg_39_1, arg_39_2, var_39_0, arg_39_4)
end

function var_0_7.ShowAutoBtn(arg_40_0)
	SetActive(arg_40_0._autoBtn.transform, true)

	local var_40_0 = arg_40_0:GetState():GetBattleType()

	triggerToggle(arg_40_0._autoBtn, var_0_0.Battle.BattleState.IsAutoBotActive(var_40_0))
end

function var_0_7.ShowTimer(arg_41_0)
	arg_41_0._timerView:SetActive(true)
end

function var_0_7.ShowDuelBar(arg_42_0)
	arg_42_0._duelRateBar:SetActive(true)
end

function var_0_7.ShowSimulationView(arg_43_0)
	arg_43_0._simulationBuffCountView:SetActive(true)
end

function var_0_7.ShowPauseButton(arg_44_0, arg_44_1)
	setActive(arg_44_0._ui:findTF("PauseBtn"), arg_44_1)
end

function var_0_7.ShowDodgemScoreBar(arg_45_0)
	arg_45_0:InitScoreBar()
	arg_45_0._dataProxy:RegisterEventListener(arg_45_0, var_0_1.UPDATE_DODGEM_SCORE, arg_45_0.onUpdateDodgemScore)
	arg_45_0._dataProxy:RegisterEventListener(arg_45_0, var_0_1.UPDATE_DODGEM_COMBO, arg_45_0.onUpdateDodgemCombo)
	arg_45_0._scoreBarView:UpdateScore(0)
	arg_45_0._scoreBarView:SetActive(true)
end

function var_0_7.ShowAirFightScoreBar(arg_46_0)
	arg_46_0:InitAirFightScoreBar()
	arg_46_0._dataProxy:RegisterEventListener(arg_46_0, var_0_1.UPDATE_DODGEM_SCORE, arg_46_0.onUpdateDodgemScore)
	arg_46_0._dataProxy:RegisterEventListener(arg_46_0, var_0_1.UPDATE_DODGEM_COMBO, arg_46_0.onUpdateDodgemCombo)
	arg_46_0._scoreBarView:UpdateScore(0)
	arg_46_0._scoreBarView:SetActive(true)
end

function var_0_7.ScaleUISpeed(arg_47_0, arg_47_1)
	local var_47_0 = arg_47_0._ui:findTF("AutoBtn/on"):GetComponent(typeof(Animation))

	if var_47_0 then
		var_47_0:get_Item("autobtn_toOn").speed = arg_47_1
	end

	local var_47_1 = arg_47_0._ui:findTF("AutoBtn/off"):GetComponent(typeof(Animation))

	if var_47_1 then
		var_47_1:get_Item("autobtn_toOff").speed = arg_47_1
	end
end

function var_0_7.onStageInit(arg_48_0, arg_48_1)
	arg_48_0:InitJoystick()
	arg_48_0:InitScene()
	arg_48_0:InitTimer()
	arg_48_0:InitEnemyHpBar()
	arg_48_0:InitAirStrikeIcon()
	arg_48_0:InitCommonWarning()
	arg_48_0:InitAutoBtn()
	arg_48_0:InitMainDamagedView()
end

function var_0_7.onEnemyHit(arg_49_0, arg_49_1)
	local var_49_0 = arg_49_1.Data

	if var_49_0:GetDiveInvisible() and not var_49_0:GetDiveDetected() then
		return
	end

	local var_49_1 = arg_49_0._enemyHpBar:GetCurrentTarget()

	if var_49_1 then
		if var_49_1 ~= var_49_0 then
			arg_49_0._enemyHpBar:SwitchTarget(var_49_0, arg_49_0._dataProxy:GetUnitList())
		end
	else
		arg_49_0._enemyHpBar:SwitchTarget(var_49_0, arg_49_0._dataProxy:GetUnitList())
	end
end

function var_0_7.onEnemyHpUpdate(arg_50_0, arg_50_1)
	local var_50_0 = arg_50_1.Dispatcher

	if var_50_0 == arg_50_0._enemyHpBar:GetCurrentTarget() and (not var_50_0:GetDiveInvisible() or var_50_0:GetDiveDetected()) then
		arg_50_0._enemyHpBar:UpdateHpBar()
	end
end

function var_0_7.onPlayerMainUnitHpUpdate(arg_51_0, arg_51_1)
	if arg_51_1.Data.dHP < 0 then
		arg_51_0._mainDamagedView:Play()
	end
end

function var_0_7.onSkillFloat(arg_52_0, arg_52_1)
	local var_52_0 = arg_52_1.Data
	local var_52_1 = var_52_0.coverHrzIcon
	local var_52_2 = var_52_0.commander
	local var_52_3 = var_52_0.skillName
	local var_52_4 = arg_52_1.Dispatcher

	if var_52_1 then
		arg_52_0:ShowSkillFloatCover(var_52_4, var_52_3, var_52_1)
	else
		arg_52_0:ShowSkillFloat(var_52_4, var_52_3, var_52_2)
	end
end

function var_0_7.onCommonInit(arg_53_0, arg_53_1)
	arg_53_0._skillView = var_0_0.Battle.BattleSkillView.New(arg_53_0, arg_53_1.Data)
	arg_53_0._updateViewList[arg_53_0._skillView] = true
	arg_53_0._userFleet = arg_53_0._dataProxy:GetFleetByIFF(var_0_5.FRIENDLY_CODE)

	arg_53_0._userFleet:RegisterEventListener(arg_53_0, var_0_1.SHOW_BUFFER, arg_53_0.onShowBuffer)
	arg_53_0._userFleet:RegisterEventListener(arg_53_0, var_0_2.POINT_HIT_CHARGE, arg_53_0.onPointHitSight)
	arg_53_0._userFleet:RegisterEventListener(arg_53_0, var_0_2.POINT_HIT_CANCEL, arg_53_0.onPointHitSight)
	arg_53_0._userFleet:RegisterEventListener(arg_53_0, var_0_1.MANUAL_SUBMARINE_SHIFT, arg_53_0.onManualSubShift)
	arg_53_0._userFleet:RegisterEventListener(arg_53_0, var_0_1.FLEET_BLIND, arg_53_0.onFleetBlind)
	arg_53_0._userFleet:RegisterEventListener(arg_53_0, var_0_1.UPDATE_FLEET_ATTR, arg_53_0.onFleetAttrUpdate)

	arg_53_0._sightView = var_0_0.Battle.BattleOpticalSightView.New(arg_53_0._ui:findTF("ChargeAreaContainer"))

	arg_53_0._sightView:SetFleetVO(arg_53_0._userFleet)

	local var_53_0, var_53_1, var_53_2, var_53_3 = arg_53_0._dataProxy:GetTotalBounds()

	arg_53_0._sightView:SetAreaBound(var_53_2, var_53_3)

	local var_53_4
	local var_53_5

	if arg_53_0._dataProxy:GetInitData().ChapterBuffIDs then
		for iter_53_0, iter_53_1 in ipairs(arg_53_0._dataProxy:GetInitData().ChapterBuffIDs) do
			if iter_53_1 == 9727 then
				var_53_4 = true

				break
			end
		end
	end

	if #arg_53_0._dataProxy:GetFleetByIFF(var_0_5.FRIENDLY_CODE):GetSupportUnitList() > 0 then
		var_53_5 = true
	end

	if var_53_5 and not var_53_4 then
		arg_53_0._airAdavantageTF = arg_53_0._airSupportTF:Find("player_advantage")
	elseif var_53_4 and not var_53_5 then
		arg_53_0._airAdavantageTF = arg_53_0._airSupportTF:Find("enemy_advantage")
	elseif var_53_4 and var_53_5 then
		arg_53_0._airAdavantageTF = arg_53_0._airSupportTF:Find("draw")
	end
end

function var_0_7.onAddFleet(arg_54_0, arg_54_1)
	local var_54_0 = arg_54_1.Data.fleetVO

	if PlayerPrefs.GetInt(BATTLE_EXPOSE_LINE, 1) == 1 then
		arg_54_0:SetFleetCloakLine(var_54_0)
	end
end

function var_0_7.SetFleetCloakLine(arg_55_0, arg_55_1)
	if #arg_55_1:GetCloakList() > 0 then
		local var_55_0 = arg_55_1:GetIFF()
		local var_55_1 = arg_55_1:GetFleetVisionLine()
		local var_55_2 = arg_55_1:GetFleetExposeLine()

		arg_55_0._seaView:SetExposeLine(var_55_0, var_55_1, var_55_2)
	end
end

function var_0_7.onAddUnit(arg_56_0, arg_56_1)
	local var_56_0 = arg_56_1.Data.type
	local var_56_1 = arg_56_1.Data.unit

	if var_56_0 == var_0_3.UnitType.PLAYER_UNIT or var_56_0 == var_0_3.UnitType.ENEMY_UNIT or var_56_0 == var_0_3.UnitType.BOSS_UNIT then
		arg_56_0:registerUnitEvent(var_56_1)
	end

	if var_56_1:IsBoss() and arg_56_0._dataProxy:GetActiveBossCount() == 1 then
		arg_56_0:AddBossWarningUI()
	elseif var_56_0 == var_0_3.UnitType.ENEMY_UNIT then
		arg_56_0:registerNPCUnitEvent(var_56_1)
	elseif var_56_0 == var_0_3.UnitType.PLAYER_UNIT and var_56_1:IsMainFleetUnit() and var_56_1:GetIFF() == var_0_5.FRIENDLY_CODE then
		arg_56_0:registerPlayerMainUnitEvent(var_56_1)
	end

	local var_56_2 = var_56_1:GetTemplate().nationality

	if table.contains(var_0_5.ALCHEMIST_AP_UI, var_56_2) and var_56_1:GetIFF() == var_0_5.FRIENDLY_CODE then
		arg_56_0:InitAlchemistAPView()
	end
end

function var_0_7.onSubmarineDetected(arg_57_0, arg_57_1)
	local var_57_0 = arg_57_1.Dispatcher

	if arg_57_0._enemyHpBar:GetCurrentTarget() and arg_57_0._enemyHpBar:GetCurrentTarget() == var_57_0 and var_57_0:GetDiveDetected() == false then
		arg_57_0._enemyHpBar:RemoveUnit()
	end
end

function var_0_7.onRemoveUnit(arg_58_0, arg_58_1)
	local var_58_0 = arg_58_1.Data.unit
	local var_58_1 = arg_58_1.Data.type

	if var_58_1 == var_0_3.UnitType.PLAYER_UNIT or var_58_1 == var_0_3.UnitType.ENEMY_UNIT or var_58_1 == var_0_3.UnitType.BOSS_UNIT then
		arg_58_0:unregisterUnitEvent(var_58_0)
	end

	if var_58_1 == var_0_3.UnitType.ENEMY_UNIT and not var_58_0:IsBoss() then
		arg_58_0:unregisterNPCUnitEvent(var_58_0)
	elseif var_58_0:GetIFF() == var_0_5.FRIENDLY_CODE and var_58_0:IsMainFleetUnit() then
		arg_58_0:unregisterPlayerMainUnitEvent(var_58_0)
	end

	if arg_58_1.Data.deadReason == var_0_3.UnitDeathReason.LEAVE and arg_58_0._enemyHpBar:GetCurrentTarget() and arg_58_0._enemyHpBar:GetCurrentTarget() == arg_58_1.Data.unit then
		arg_58_0._enemyHpBar:RemoveUnit(arg_58_1.Data.deadReason)
	end
end

function var_0_7.onUpdateCountDown(arg_59_0, arg_59_1)
	arg_59_0._timerView:SetCountDownText(arg_59_0._dataProxy:GetCountDown())
end

function var_0_7.onUpdateDodgemScore(arg_60_0, arg_60_1)
	local var_60_0 = arg_60_1.Data.totalScore

	arg_60_0._scoreBarView:UpdateScore(var_60_0)
end

function var_0_7.onUpdateDodgemCombo(arg_61_0, arg_61_1)
	local var_61_0 = arg_61_1.Data.combo

	arg_61_0._scoreBarView:UpdateCombo(var_61_0)
end

function var_0_7.onAddAirStrike(arg_62_0, arg_62_1)
	local var_62_0 = arg_62_1.Data.index
	local var_62_1 = arg_62_0._dataProxy:GetAirFighterInfo(var_62_0)

	arg_62_0._airStrikeView:AppendIcon(var_62_0, var_62_1)
end

function var_0_7.onRemoveAirStrike(arg_63_0, arg_63_1)
	local var_63_0 = arg_63_1.Data.index
	local var_63_1 = arg_63_0._dataProxy:GetAirFighterInfo(var_63_0)

	arg_63_0._airStrikeView:RemoveIcon(var_63_0, var_63_1)
end

function var_0_7.onUpdateAirSupportLabel(arg_64_0, arg_64_1)
	local var_64_0 = arg_64_0._dataProxy:GetAirFighterList()
	local var_64_1 = 0

	for iter_64_0, iter_64_1 in ipairs(var_64_0) do
		var_64_1 = var_64_1 + iter_64_1.totalNumber
	end

	if var_64_1 == 0 or arg_64_0._warningView:GetCount() > 0 then
		eachChild(arg_64_0._airSupportTF, function(arg_65_0)
			setActive(arg_65_0, false)
		end)
	elseif arg_64_0._airAdavantageTF then
		setActive(arg_64_0._airAdavantageTF, true)
	end
end

function var_0_7.onUpdateHostileSubmarine(arg_66_0, arg_66_1)
	local var_66_0 = arg_66_0._dataProxy:GetEnemySubmarineCount()

	arg_66_0._warningView:UpdateHostileSubmarineCount(var_66_0)
	arg_66_0:onUpdateAirSupportLabel()
end

function var_0_7.onUpdateEnvironmentWarning(arg_67_0, arg_67_1)
	if arg_67_1.Data.isActive then
		arg_67_0._warningView:ActiveWarning(arg_67_0._warningView.WARNING_TYPE_ARTILLERY)
	else
		arg_67_0._warningView:DeactiveWarning(arg_67_0._warningView.WARNING_TYPE_ARTILLERY)
	end
end

function var_0_7.onCameraFocus(arg_68_0, arg_68_1)
	local var_68_0 = arg_68_1.Data

	if var_68_0.unit ~= nil then
		local var_68_1 = var_68_0.skill or false

		arg_68_0:EnableComponent(false)
		arg_68_0:EnableSkillFloat(var_68_1)
	else
		local var_68_2 = var_68_0.duration + var_68_0.extraBulletTime

		LeanTween.delayedCall(arg_68_0._ui._go, var_68_2, System.Action(function()
			arg_68_0:EnableComponent(true)
			arg_68_0:EnableSkillFloat(true)
		end))
	end
end

function var_0_7.onShowPainting(arg_70_0, arg_70_1)
	local var_70_0 = arg_70_1.Data

	arg_70_0:ShowSkillPainting(var_70_0.caster, var_70_0.skill, var_70_0.speed)
end

function var_0_7.onBulletTime(arg_71_0, arg_71_1)
	local var_71_0 = arg_71_1.Data
	local var_71_1 = var_71_0.key
	local var_71_2 = var_71_0.rate

	if var_71_2 then
		var_0_4.AppendMapFactor(var_71_1, var_71_2)
	else
		var_0_4.RemoveMapFactor(var_71_1)
	end

	arg_71_0._seaView:UpdateSpeedScaler()
end

function var_0_7.onShowBuffer(arg_72_0, arg_72_1)
	local var_72_0 = arg_72_1.Data.dist

	arg_72_0._seaView:UpdateBufferAlpha(var_72_0)
end

function var_0_7.onManualSubShift(arg_73_0, arg_73_1)
	local var_73_0 = arg_73_1.Data.state

	arg_73_0._skillView:ShiftSubmarineManualButton(var_73_0)
end

function var_0_7.onPointHitSight(arg_74_0, arg_74_1)
	local var_74_0 = arg_74_1.ID

	if var_74_0 == var_0_2.POINT_HIT_CHARGE then
		arg_74_0._sightView:SetActive(true)

		arg_74_0._updateViewList[arg_74_0._sightView] = true
	elseif var_74_0 == var_0_2.POINT_HIT_CANCEL then
		arg_74_0._sightView:SetActive(false)

		arg_74_0._updateViewList[arg_74_0._sightView] = nil
	end
end

function var_0_7.onFleetBlind(arg_75_0, arg_75_1)
	local var_75_0 = arg_75_1.Data.isBlind
	local var_75_1 = arg_75_1.Dispatcher

	if not arg_75_0._inkView then
		arg_75_0:InitInkView(var_75_1)
	end

	if var_75_0 then
		local var_75_2 = var_75_1:GetUnitList()

		arg_75_0._inkView:SetActive(true, var_75_2)
		arg_75_0._skillView:HideSkillButton(true)

		arg_75_0._updateViewList[arg_75_0._inkView] = true
	else
		arg_75_0._inkView:SetActive(false)
		arg_75_0._skillView:HideSkillButton(false)

		arg_75_0._updateViewList[arg_75_0._inkView] = nil
	end
end

function var_0_7.onFleetHorizonUpdate(arg_76_0, arg_76_1)
	if not arg_76_0._inkView then
		return
	end

	local var_76_0 = arg_76_1.Dispatcher:GetUnitList()

	arg_76_0._inkView:UpdateHollow(var_76_0)
end

function var_0_7.onFleetAttrUpdate(arg_77_0, arg_77_1)
	if arg_77_0._alchemistAP then
		local var_77_0 = arg_77_1.Dispatcher
		local var_77_1 = arg_77_1.Data.attr
		local var_77_2 = arg_77_1.Data.value

		if var_77_1 == arg_77_0._alchemistAP:GetAttrName() then
			arg_77_0._alchemistAP:UpdateAP(var_77_2)
		end
	end
end

function var_0_7.OnAddUIFX(arg_78_0, arg_78_1)
	local var_78_0 = arg_78_1.Data.FXID
	local var_78_1 = arg_78_1.Data.position
	local var_78_2 = arg_78_1.Data.localScale
	local var_78_3 = arg_78_1.Data.orderDiff

	arg_78_0:AddUIFX(var_78_3, var_78_0, var_78_1, var_78_2)
end

function var_0_7.AddUIFX(arg_79_0, arg_79_1, arg_79_2, arg_79_3, arg_79_4)
	local var_79_0 = arg_79_0._fxPool:GetFX(arg_79_2)

	arg_79_1 = arg_79_1 or 1

	local var_79_1

	var_79_1 = arg_79_1 > 0

	local var_79_2 = arg_79_0._ui:AddUIFX(var_79_0, arg_79_1)

	arg_79_4 = arg_79_4 or 1
	var_79_0.transform.localScale = Vector3(arg_79_4 / var_79_2.x, arg_79_4 / var_79_2.y, arg_79_4 / var_79_2.z)

	pg.EffectMgr.GetInstance():PlayBattleEffect(var_79_0, arg_79_3, true)
end

function var_0_7.AddBossWarningUI(arg_80_0)
	arg_80_0._dataProxy:BlockManualCast(true)

	local var_80_0 = var_0_0.Battle.BattleResourceManager.GetInstance()

	arg_80_0._appearEffect = var_80_0:InstBossWarningUI()

	local var_80_1 = arg_80_0._appearEffect:GetComponent(typeof(Animator))
	local var_80_2 = {
		Pause = function()
			var_80_1.speed = 0
		end,
		Resume = function()
			var_80_1.speed = 1
		end
	}

	arg_80_0._state:SetTakeoverProcess(var_80_2)

	var_80_1.speed = 1 / arg_80_0._state:GetTimeScaleRate()

	setParent(arg_80_0._appearEffect, arg_80_0._ui.uiCanvas, false)
	arg_80_0._appearEffect:GetComponent(typeof(DftAniEvent)):SetEndEvent(function(arg_83_0)
		arg_80_0._userFleet:CoupleEncourage()
		arg_80_0._dataProxy:BlockManualCast(false)
		arg_80_0._state:ClearTakeoverProcess()
		var_80_0:DestroyOb(arg_80_0._appearEffect)

		arg_80_0._appearEffect = nil
	end)
	SetActive(arg_80_0._appearEffect, true)
end

function var_0_7.OnHideButtons(arg_84_0, arg_84_1)
	local var_84_0 = arg_84_1.Data.isActive

	arg_84_0._skillView:HideSkillButton(not var_84_0)
	SetActive(arg_84_0._autoBtn.transform, var_84_0)
end

function var_0_7.onEditCustomWarning(arg_85_0, arg_85_1)
	local var_85_0 = arg_85_1.Data.labelData

	arg_85_0._warningView:EditCustomWarning(var_85_0)
end

function var_0_7.onGridmanSkillFloat(arg_86_0, arg_86_1)
	if not arg_86_0._gridmanSkillFloat then
		local var_86_0 = var_0_0.Battle.BattleResourceManager.GetInstance():InstGridmanSkillUI()

		arg_86_0._gridmanSkillFloat = var_0_0.Battle.BattleGridmanSkillFloatView.New(var_86_0)

		setParent(var_86_0, arg_86_0._ui.uiCanvas, false)
	end

	local var_86_1 = arg_86_1.Data
	local var_86_2 = var_86_1.type
	local var_86_3 = var_86_1.IFF

	if var_86_2 == 5 then
		arg_86_0._gridmanSkillFloat:DoFusionFloat(var_86_3)
	else
		arg_86_0._gridmanSkillFloat:DoSkillFloat(var_86_2, var_86_3)
	end
end

function var_0_7.registerUnitEvent(arg_87_0, arg_87_1)
	arg_87_1:RegisterEventListener(arg_87_0, var_0_2.SKILL_FLOAT, arg_87_0.onSkillFloat)
	arg_87_1:RegisterEventListener(arg_87_0, var_0_2.CUT_INT, arg_87_0.onShowPainting)
end

function var_0_7.registerNPCUnitEvent(arg_88_0, arg_88_1)
	arg_88_1:RegisterEventListener(arg_88_0, var_0_2.UPDATE_HP, arg_88_0.onEnemyHpUpdate)

	local var_88_0 = arg_88_1:GetTemplate().type

	if table.contains(TeamType.SubShipType, var_88_0) then
		arg_88_1:RegisterEventListener(arg_88_0, var_0_2.SUBMARINE_DETECTED, arg_88_0.onSubmarineDetected)
	end
end

function var_0_7.registerPlayerMainUnitEvent(arg_89_0, arg_89_1)
	arg_89_1:RegisterEventListener(arg_89_0, var_0_2.UPDATE_HP, arg_89_0.onPlayerMainUnitHpUpdate)
end

function var_0_7.unregisterUnitEvent(arg_90_0, arg_90_1)
	arg_90_1:UnregisterEventListener(arg_90_0, var_0_2.SKILL_FLOAT)
	arg_90_1:UnregisterEventListener(arg_90_0, var_0_2.CUT_INT)
end

function var_0_7.unregisterNPCUnitEvent(arg_91_0, arg_91_1)
	arg_91_1:UnregisterEventListener(arg_91_0, var_0_2.SKILL_FLOAT)
	arg_91_1:UnregisterEventListener(arg_91_0, var_0_2.CUT_INT)
	arg_91_1:UnregisterEventListener(arg_91_0, var_0_2.UPDATE_HP)

	local var_91_0 = arg_91_1:GetTemplate().type

	if table.contains(TeamType.SubShipType, var_91_0) then
		arg_91_1:UnregisterEventListener(arg_91_0, var_0_2.SUBMARINE_DETECTED)
	end
end

function var_0_7.unregisterPlayerMainUnitEvent(arg_92_0, arg_92_1)
	arg_92_1:UnregisterEventListener(arg_92_0, var_0_2.UPDATE_HP)
end

function var_0_7.Dispose(arg_93_0)
	LeanTween.cancel(arg_93_0._ui._go)
	arg_93_0._uiMGR:ClearStick()

	arg_93_0._uiMGR = nil

	if arg_93_0._appearEffect then
		Destroy(arg_93_0._appearEffect)
	end

	arg_93_0:RemoveUIEvent()

	arg_93_0._updateViewList = nil

	arg_93_0._timerView:Dispose()
	arg_93_0._enemyHpBar:Dispose()
	arg_93_0._skillView:Dispose()
	arg_93_0._seaView:Dispose()
	arg_93_0._airStrikeView:Dispose()
	arg_93_0._sightView:Dispose()
	arg_93_0._mainDamagedView:Dispose()
	arg_93_0._warningView:Dispose()

	arg_93_0._seaView = nil
	arg_93_0._enemyHpBar = nil
	arg_93_0._skillView = nil
	arg_93_0._timerView = nil
	arg_93_0._joystick = nil
	arg_93_0._airStrikeView = nil
	arg_93_0._warningView = nil
	arg_93_0._mainDamagedView = nil

	if arg_93_0._duelRateBar then
		arg_93_0._duelRateBar:Dispose()

		arg_93_0._duelRateBar = nil
	end

	if arg_93_0._simulationBuffCountView then
		arg_93_0._simulationBuffCountView:Dispose()

		arg_93_0._simulationBuffCountView = nil
	end

	if arg_93_0._jammingView then
		arg_93_0._jammingView:Dispose()

		arg_93_0._jammingView = nil
	end

	if arg_93_0._inkView then
		arg_93_0._inkView:Dispose()

		arg_93_0._inkView = nil
	end

	if arg_93_0._alchemistAP then
		arg_93_0._alchemistAP:Dispose()

		arg_93_0._alchemistAP = nil
	end

	if arg_93_0._gridmanSkillFloat then
		arg_93_0._gridmanSkillFloat:Dispose()
	end

	if go(arg_93_0._ui:findTF("CardPuzzleConsole")).activeSelf then
		arg_93_0:DisposeCardPuzzleComponent()
	end

	var_0_7.super.Dispose(arg_93_0)
end

function var_0_7.OnCardPuzzleInit(arg_94_0, arg_94_1)
	arg_94_0._cardPuzzleComponent = arg_94_0._dataProxy:GetFleetByIFF(var_0_5.FRIENDLY_CODE):GetCardPuzzleComponent()

	arg_94_0:ShowCardPuzzleComponent()
	arg_94_0:RegisterCardPuzzleEvent()
end

function var_0_7.RegisterCardPuzzleEvent(arg_95_0)
	arg_95_0._cardPuzzleComponent:RegisterEventListener(arg_95_0, var_0_6.UPDATE_FLEET_SHIP, arg_95_0.onUpdateFleetShip)
	arg_95_0._cardPuzzleComponent:RegisterEventListener(arg_95_0, var_0_6.COMMON_BUTTON_ENABLE, arg_95_0.onBlockCommonButton)
	arg_95_0._cardPuzzleComponent:RegisterEventListener(arg_95_0, var_0_6.LONG_PRESS_BULLET_TIME, arg_95_0.onLongPressBulletTime)
	arg_95_0._cardPuzzleComponent:RegisterEventListener(arg_95_0, var_0_6.SHOW_CARD_DETAIL, arg_95_0.onShowCardDetail)
end

function var_0_7.ShowCardPuzzleComponent(arg_96_0)
	setActive(arg_96_0._ui:findTF("CardPuzzleConsole"), true)
	arg_96_0:InitCardPuzzleCommonHPBar()
	arg_96_0:InitCardPuzzleEnergyBar()
	arg_96_0:IntCardPuzzleFleetHead()
	arg_96_0:InitCameraCardBoardClicker()
	arg_96_0:InitCardPuzzleMovePile()
	arg_96_0:InitCardPuzzleDeckPile()
	arg_96_0:InitCardPuzzleIconList()
	arg_96_0:InitCardPuzzleHandBoard()
	arg_96_0:InitCardPuzzleCardDetail()
	arg_96_0:InitCardPuzzleGoalRemind()
end

function var_0_7.InitCardPuzzleCommonHPBar(arg_97_0)
	arg_97_0._cardPuzzleHPBar = var_0_0.Battle.CardPuzzleCommonHPBar.New(arg_97_0._ui:findTF("CardPuzzleConsole/commonHP"))

	arg_97_0._cardPuzzleHPBar:SetCardPuzzleComponent(arg_97_0._cardPuzzleComponent)

	arg_97_0._updateViewList[arg_97_0._cardPuzzleHPBar] = true
end

function var_0_7.InitCardPuzzleEnergyBar(arg_98_0)
	arg_98_0._cardPuzzleEnergyBar = var_0_0.Battle.CardPuzzleEnergyBar.New(arg_98_0._ui:findTF("CardPuzzleConsole/energy_block"))

	arg_98_0._cardPuzzleEnergyBar:SetCardPuzzleComponent(arg_98_0._cardPuzzleComponent)

	arg_98_0._updateViewList[arg_98_0._cardPuzzleEnergyBar] = true
end

function var_0_7.InitCameraCardBoardClicker(arg_99_0)
	arg_99_0._cardPuzzleBoardClicker = var_0_0.Battle.CardPuzzleBoardClicker.New(arg_99_0._ui:findTF("CardBoardController"))

	arg_99_0._cardPuzzleBoardClicker:SetCardPuzzleComponent(arg_99_0._cardPuzzleComponent)
end

function var_0_7.IntCardPuzzleFleetHead(arg_100_0)
	arg_100_0._cardPuzzleFleetHead = var_0_0.Battle.CardPuzzleFleetHead.New(arg_100_0._ui:findTF("CardPuzzleConsole/fleet"))

	arg_100_0._cardPuzzleFleetHead:SetCardPuzzleComponent(arg_100_0._cardPuzzleComponent)
end

function var_0_7.InitCardPuzzleMovePile(arg_101_0)
	arg_101_0._cardPuzzleMovePile = var_0_0.Battle.CardPuzzleMovePile.New(arg_101_0._ui:findTF("CardPuzzleConsole/movedeck"))

	arg_101_0._cardPuzzleMovePile:SetCardPuzzleComponent(arg_101_0._cardPuzzleComponent)

	arg_101_0._updateViewList[arg_101_0._cardPuzzleMovePile] = true
end

function var_0_7.InitCardPuzzleDeckPile(arg_102_0)
	arg_102_0._cardPuzzleDeckPile = var_0_0.Battle.CardPuzzleDeckPool.New(arg_102_0._ui:findTF("CardPuzzleConsole/deck"))

	arg_102_0._cardPuzzleDeckPile:SetCardPuzzleComponent(arg_102_0._cardPuzzleComponent)
end

function var_0_7.InitCardPuzzleIconList(arg_103_0)
	arg_103_0._cardPuzzleStatusIcon = var_0_0.Battle.CardPuzzleFleetIconList.New(arg_103_0._ui:findTF("CardPuzzleConsole/statusIcon"))

	arg_103_0._cardPuzzleStatusIcon:SetCardPuzzleComponent(arg_103_0._cardPuzzleComponent)

	arg_103_0._updateViewList[arg_103_0._cardPuzzleStatusIcon] = true
end

function var_0_7.InitCardPuzzleHandBoard(arg_104_0)
	arg_104_0._cardPuzzleHandBoard = var_0_0.Battle.CardPuzzleHandBoard.New(arg_104_0._ui:findTF("CardPuzzleConsole/cardboard"), arg_104_0._ui:findTF("CardPuzzleConsole/hand"))

	arg_104_0._cardPuzzleHandBoard:SetCardPuzzleComponent(arg_104_0._cardPuzzleComponent)

	arg_104_0._updateViewList[arg_104_0._cardPuzzleHandBoard] = true
end

function var_0_7.InitCardPuzzleGoalRemind(arg_105_0)
	arg_105_0._cardPuzzleGoalRemind = var_0_0.Battle.CardPuzzleGoalRemind.New(arg_105_0._ui:findTF("CardPuzzleConsole/goal"))

	arg_105_0._cardPuzzleGoalRemind:SetCardPuzzleComponent(arg_105_0._cardPuzzleComponent)
end

function var_0_7.InitCardPuzzleCardDetail(arg_106_0)
	arg_106_0._cardPuzzleCardDetail = var_0_0.Battle.CardPuzzleCardDetail.New(arg_106_0._ui:findTF("CardPuzzleConsole/cardDetail"))
end

function var_0_7.DisposeCardPuzzleComponent(arg_107_0)
	arg_107_0._cardPuzzleHPBar:Dispose()
	arg_107_0._cardPuzzleEnergyBar:Dispose()
	arg_107_0._cardPuzzleBoardClicker:Dispose()
	arg_107_0._cardPuzzleFleetHead:Dispose()
	arg_107_0._cardPuzzleMovePile:Dispose()
	arg_107_0._cardPuzzleDeckPile:Dispose()
	arg_107_0._cardPuzzleStatusIcon:Dispose()
	arg_107_0._cardPuzzleHandBoard:Dispose()
	arg_107_0._cardPuzzleGoalRemind:Dispose()
	arg_107_0._cardPuzzleCardDetail:Dispose()
end

function var_0_7.onUpdateFleetBuff(arg_108_0)
	return
end

function var_0_7.onUpdateFleetShip(arg_109_0, arg_109_1)
	arg_109_0._cardPuzzleFleetHead:UpdateShipIcon(arg_109_1.Data.teamType)
end

function var_0_7.onBlockCommonButton(arg_110_0, arg_110_1)
	local var_110_0 = arg_110_1.Data.flag

	arg_110_0:EnableComponent(var_110_0)
end

function var_0_7.onLongPressBulletTime(arg_111_0, arg_111_1)
	local var_111_0 = arg_111_1.Data.timeScale

	arg_111_0._state:ScaleTimer(var_111_0)
end

function var_0_7.onShowCardDetail(arg_112_0, arg_112_1)
	local var_112_0 = arg_112_1.Data.card

	if var_112_0 then
		arg_112_0._cardPuzzleCardDetail:Active(true)
		arg_112_0._cardPuzzleCardDetail:SetReferenceCard(var_112_0)
	else
		arg_112_0._cardPuzzleCardDetail:Active(false)
	end
end
