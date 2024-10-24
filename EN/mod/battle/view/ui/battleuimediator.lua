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

	setActive(arg_6_0._joystick, arg_6_1)
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
	local var_15_2 = Screen.dpi / CameraMgr.instance.finalWidth * 5

	if PLATFORM == PLATFORM_WINDOWSEDITOR or var_15_2 <= 0 then
		var_15_2 = 1
	end

	local var_15_3 = PlayerPrefs.GetFloat("joystick_scale", var_15_0.scale)
	local var_15_4 = PlayerPrefs.GetFloat("joystick_anchorX", var_15_0.x)
	local var_15_5 = PlayerPrefs.GetFloat("joystick_anchorY", var_15_0.y)
	local var_15_6 = var_15_2 * var_15_3

	arg_15_0._joystick.localScale = Vector3(var_15_6, var_15_6, 1)
	var_15_1.anchoredPosition = var_15_1.anchoredPosition * var_15_6
	arg_15_0._joystick.anchorMin = Vector2(var_15_4, var_15_5)
	arg_15_0._joystick.anchorMax = Vector2(var_15_4, var_15_5)
	arg_15_0._stickController = arg_15_0._joystick:GetComponent("StickController")

	arg_15_0._uiMGR:AttachStickOb(arg_15_0._joystick)
end

function var_0_7.InitTimer(arg_16_0)
	if arg_16_0._dataProxy:GetInitData().battleType == SYSTEM_DUEL then
		arg_16_0._timerView = var_0_0.Battle.BattleTimerView.New(arg_16_0._ui:findTF("DuelTimer"))
	else
		arg_16_0._timerView = var_0_0.Battle.BattleTimerView.New(arg_16_0._ui:findTF("Timer"))
	end
end

function var_0_7.InitEnemyHpBar(arg_17_0)
	arg_17_0._enemyHpBar = var_0_0.Battle.BattleEnmeyHpBarView.New(arg_17_0._ui:findTF("EnemyHPBar"))
end

function var_0_7.InitAirStrikeIcon(arg_18_0)
	arg_18_0._airStrikeView = var_0_0.Battle.BattleAirStrikeIconView.New(arg_18_0._ui:findTF("AirFighterContainer/AirStrikeIcon"))
	arg_18_0._airSupportTF = arg_18_0._ui:findTF("AirSupportLabel")
end

function var_0_7.InitCommonWarning(arg_19_0)
	arg_19_0._warningView = var_0_0.Battle.BattleCommonWarningView.New(arg_19_0._ui:findTF("WarningView"))
	arg_19_0._updateViewList[arg_19_0._warningView] = true
end

function var_0_7.InitScoreBar(arg_20_0)
	arg_20_0._scoreBarView = var_0_0.Battle.BattleScoreBarView.New(arg_20_0._ui:findTF("DodgemCountBar"))
end

function var_0_7.InitAirFightScoreBar(arg_21_0)
	arg_21_0._scoreBarView = var_0_0.Battle.BattleScoreBarView.New(arg_21_0._ui:findTF("AirFightCountBar"))
end

function var_0_7.InitAutoBtn(arg_22_0)
	arg_22_0._autoBtn = arg_22_0._ui:findTF("AutoBtn")

	local var_22_0 = var_0_5.AUTO_DEFAULT_PREFERENCE
	local var_22_1 = PlayerPrefs.GetFloat("auto_scale", var_22_0.scale)
	local var_22_2 = PlayerPrefs.GetFloat("auto_anchorX", var_22_0.x)
	local var_22_3 = PlayerPrefs.GetFloat("auto_anchorY", var_22_0.y)

	arg_22_0._autoBtn.localScale = Vector3(var_22_1, var_22_1, 1)
	arg_22_0._autoBtn.anchorMin = Vector2(var_22_2, var_22_3)
	arg_22_0._autoBtn.anchorMax = Vector2(var_22_2, var_22_3)
end

function var_0_7.InitDuelRateBar(arg_23_0)
	arg_23_0._duelRateBar = var_0_0.Battle.BattleDuelDamageRateView.New(arg_23_0._ui:findTF("DuelDamageRate"))

	return arg_23_0._duelRateBar
end

function var_0_7.InitSimulationBuffCounting(arg_24_0)
	arg_24_0._simulationBuffCountView = var_0_0.Battle.BattleSimulationBuffCountView.New(arg_24_0._ui:findTF("SimulationWarning"))

	return arg_24_0._simulationBuffCountView
end

function var_0_7.InitMainDamagedView(arg_25_0)
	arg_25_0._mainDamagedView = var_0_0.Battle.BattleMainDamagedView.New(arg_25_0._ui:findTF("HPWarning"))
end

function var_0_7.InitInkView(arg_26_0, arg_26_1)
	arg_26_0._inkView = var_0_0.Battle.BattleInkView.New(arg_26_0._ui:findTF("InkContainer"))

	arg_26_1:RegisterEventListener(arg_26_0, var_0_1.FLEET_HORIZON_UPDATE, arg_26_0.onFleetHorizonUpdate)
end

function var_0_7.InitDebugConsole(arg_27_0)
	arg_27_0._debugConsoleView = arg_27_0._debugConsoleView or var_0_0.Battle.BattleDebugConsole.New(arg_27_0._ui:findTF("Debug_Console"), arg_27_0._state)
end

function var_0_7.InitCameraGestureSlider(arg_28_0)
	arg_28_0._gesture = var_0_0.Battle.BattleCameraSlider.New(arg_28_0._ui:findTF("CameraController"))

	var_0_0.Battle.BattleCameraUtil.GetInstance():SetCameraSilder(arg_28_0._gesture)
	arg_28_0._cameraUtil:SwitchCameraPos("FOLLOW_GESTURE")
end

function var_0_7.InitAlchemistAPView(arg_29_0)
	arg_29_0._alchemistAP = var_0_0.Battle.BattleReisalinAPView.New(arg_29_0._ui:findTF("APPanel"))
end

function var_0_7.InitGuide(arg_30_0)
	return
end

function var_0_7.InitCamera(arg_31_0)
	arg_31_0._camera = pg.UIMgr.GetInstance():GetMainCamera():GetComponent(typeof(Camera))
	arg_31_0._uiCamera = GameObject.Find("UICamera"):GetComponent(typeof(Camera))
	arg_31_0._cameraUtil = var_0_0.Battle.BattleCameraUtil.GetInstance()

	arg_31_0._cameraUtil:RegisterEventListener(arg_31_0, var_0_1.CAMERA_FOCUS, arg_31_0.onCameraFocus)
	arg_31_0._cameraUtil:RegisterEventListener(arg_31_0, var_0_1.SHOW_PAINTING, arg_31_0.onShowPainting)
	arg_31_0._cameraUtil:RegisterEventListener(arg_31_0, var_0_1.BULLET_TIME, arg_31_0.onBulletTime)
end

function var_0_7.Update(arg_32_0)
	for iter_32_0, iter_32_1 in pairs(arg_32_0._updateViewList) do
		iter_32_0:Update()
	end
end

function var_0_7.AddUIEvent(arg_33_0)
	arg_33_0._dataProxy:RegisterEventListener(arg_33_0, var_0_1.STAGE_DATA_INIT_FINISH, arg_33_0.onStageInit)
	arg_33_0._dataProxy:RegisterEventListener(arg_33_0, var_0_1.COMMON_DATA_INIT_FINISH, arg_33_0.onCommonInit)
	arg_33_0._dataProxy:RegisterEventListener(arg_33_0, var_0_1.ADD_FLEET, arg_33_0.onAddFleet)
	arg_33_0._dataProxy:RegisterEventListener(arg_33_0, var_0_1.ADD_UNIT, arg_33_0.onAddUnit)
	arg_33_0._dataProxy:RegisterEventListener(arg_33_0, var_0_1.REMOVE_UNIT, arg_33_0.onRemoveUnit)
	arg_33_0._dataProxy:RegisterEventListener(arg_33_0, var_0_1.HIT_ENEMY, arg_33_0.onEnemyHit)
	arg_33_0._dataProxy:RegisterEventListener(arg_33_0, var_0_1.ADD_AIR_FIGHTER_ICON, arg_33_0.onAddAirStrike)
	arg_33_0._dataProxy:RegisterEventListener(arg_33_0, var_0_1.REMOVE_AIR_FIGHTER_ICON, arg_33_0.onRemoveAirStrike)
	arg_33_0._dataProxy:RegisterEventListener(arg_33_0, var_0_1.UPDATE_AIR_SUPPORT_LABEL, arg_33_0.onUpdateAirSupportLabel)
	arg_33_0._dataProxy:RegisterEventListener(arg_33_0, var_0_1.UPDATE_HOSTILE_SUBMARINE, arg_33_0.onUpdateHostileSubmarine)
	arg_33_0._dataProxy:RegisterEventListener(arg_33_0, var_0_1.UPDATE_ENVIRONMENT_WARNING, arg_33_0.onUpdateEnvironmentWarning)
	arg_33_0._dataProxy:RegisterEventListener(arg_33_0, var_0_1.UPDATE_COUNT_DOWN, arg_33_0.onUpdateCountDown)
	arg_33_0._dataProxy:RegisterEventListener(arg_33_0, var_0_1.HIDE_INTERACTABLE_BUTTONS, arg_33_0.OnHideButtons)
	arg_33_0._dataProxy:RegisterEventListener(arg_33_0, var_0_1.ADD_UI_FX, arg_33_0.OnAddUIFX)
	arg_33_0._dataProxy:RegisterEventListener(arg_33_0, var_0_1.EDIT_CUSTOM_WARNING_LABEL, arg_33_0.onEditCustomWarning)
	arg_33_0._dataProxy:RegisterEventListener(arg_33_0, var_0_1.GRIDMAN_SKILL_FLOAT, arg_33_0.onGridmanSkillFloat)
	arg_33_0._dataProxy:RegisterEventListener(arg_33_0, var_0_6.CARD_PUZZLE_INIT, arg_33_0.OnCardPuzzleInit)
end

function var_0_7.RemoveUIEvent(arg_34_0)
	arg_34_0._dataProxy:UnregisterEventListener(arg_34_0, var_0_1.COMMON_DATA_INIT_FINISH)
	arg_34_0._dataProxy:UnregisterEventListener(arg_34_0, var_0_1.STAGE_DATA_INIT_FINISH)
	arg_34_0._dataProxy:UnregisterEventListener(arg_34_0, var_0_1.ADD_FLEET)
	arg_34_0._dataProxy:UnregisterEventListener(arg_34_0, var_0_1.ADD_UNIT)
	arg_34_0._dataProxy:UnregisterEventListener(arg_34_0, var_0_1.REMOVE_UNIT)
	arg_34_0._dataProxy:UnregisterEventListener(arg_34_0, var_0_1.HIT_ENEMY)
	arg_34_0._dataProxy:UnregisterEventListener(arg_34_0, var_0_1.UPDATE_COUNT_DOWN)
	arg_34_0._dataProxy:UnregisterEventListener(arg_34_0, var_0_1.ADD_AIR_FIGHTER_ICON)
	arg_34_0._dataProxy:UnregisterEventListener(arg_34_0, var_0_1.REMOVE_AIR_FIGHTER_ICON)
	arg_34_0._dataProxy:UnregisterEventListener(arg_34_0, var_0_1.UPDATE_AIR_SUPPORT_LABEL)
	arg_34_0._cameraUtil:UnregisterEventListener(arg_34_0, var_0_1.SHOW_PAINTING)
	arg_34_0._cameraUtil:UnregisterEventListener(arg_34_0, var_0_1.CAMERA_FOCUS)
	arg_34_0._cameraUtil:UnregisterEventListener(arg_34_0, var_0_1.BULLET_TIME)
	arg_34_0._dataProxy:UnregisterEventListener(arg_34_0, var_0_1.ADD_SUBMARINE_WARINING)
	arg_34_0._dataProxy:UnregisterEventListener(arg_34_0, var_0_1.REMOVE_SUBMARINE_WARINING)
	arg_34_0._dataProxy:UnregisterEventListener(arg_34_0, var_0_1.UPDATE_DODGEM_SCORE)
	arg_34_0._dataProxy:UnregisterEventListener(arg_34_0, var_0_1.UPDATE_DODGEM_COMBO)
	arg_34_0._userFleet:UnregisterEventListener(arg_34_0, var_0_1.SHOW_BUFFER)
	arg_34_0._userFleet:UnregisterEventListener(arg_34_0, var_0_2.POINT_HIT_CHARGE)
	arg_34_0._userFleet:UnregisterEventListener(arg_34_0, var_0_2.POINT_HIT_CANCEL)
	arg_34_0._userFleet:UnregisterEventListener(arg_34_0, var_0_1.MANUAL_SUBMARINE_SHIFT)
	arg_34_0._userFleet:UnregisterEventListener(arg_34_0, var_0_1.FLEET_BLIND)
	arg_34_0._userFleet:UnregisterEventListener(arg_34_0, var_0_1.FLEET_HORIZON_UPDATE)
	arg_34_0._userFleet:UnregisterEventListener(arg_34_0, var_0_1.UPDATE_FLEET_ATTR)
	arg_34_0._dataProxy:UnregisterEventListener(arg_34_0, var_0_1.UPDATE_HOSTILE_SUBMARINE)
	arg_34_0._dataProxy:UnregisterEventListener(arg_34_0, var_0_1.UPDATE_ENVIRONMENT_WARNING)
	arg_34_0._dataProxy:UnregisterEventListener(arg_34_0, var_0_1.HIDE_INTERACTABLE_BUTTONS)
	arg_34_0._dataProxy:UnregisterEventListener(arg_34_0, var_0_1.ADD_UI_FX)
	arg_34_0._dataProxy:UnregisterEventListener(arg_34_0, var_0_1.EDIT_CUSTOM_WARNING_LABEL)
	arg_34_0._dataProxy:UnregisterEventListener(arg_34_0, var_0_1.GRIDMAN_SKILL_FLOAT)
	arg_34_0._dataProxy:UnregisterEventListener(arg_34_0, var_0_6.CARD_PUZZLE_INIT)
	arg_34_0._dataProxy:UnregisterEventListener(arg_34_0, var_0_6.UPDATE_FLEET_SHIP)
	arg_34_0._dataProxy:UnregisterEventListener(arg_34_0, var_0_6.COMMON_BUTTON_ENABLE)
	arg_34_0._dataProxy:UnregisterEventListener(arg_34_0, var_0_6.LONG_PRESS_BULLET_TIME)
	arg_34_0._dataProxy:UnregisterEventListener(arg_34_0, var_0_6.SHOW_CARD_DETAIL)
end

function var_0_7.ShowSkillPainting(arg_35_0, arg_35_1, arg_35_2, arg_35_3)
	arg_35_3 = arg_35_3 or 1

	local var_35_0

	if arg_35_2 then
		var_35_0 = arg_35_2.cutin_cover
	end

	arg_35_0._ui:CutInPainting(arg_35_1:GetTemplate(), arg_35_3, arg_35_1:GetIFF(), var_35_0)
end

function var_0_7.ShowSkillFloat(arg_36_0, arg_36_1, arg_36_2, arg_36_3)
	arg_36_0._ui:SkillHrzPop(arg_36_2, arg_36_1, arg_36_3)
end

function var_0_7.ShowSkillFloatCover(arg_37_0, arg_37_1, arg_37_2, arg_37_3)
	arg_37_0._ui:SkillHrzPopCover(arg_37_2, arg_37_1, arg_37_3)
end

function var_0_7.SeaSurfaceShift(arg_38_0, arg_38_1, arg_38_2, arg_38_3, arg_38_4)
	local var_38_0 = arg_38_3 or var_0_0.Battle.BattleConfig.calcInterval

	arg_38_0._seaView:ShiftSurface(arg_38_1, arg_38_2, var_38_0, arg_38_4)
end

function var_0_7.ShowAutoBtn(arg_39_0)
	SetActive(arg_39_0._autoBtn.transform, true)

	local var_39_0 = arg_39_0:GetState():GetBattleType()

	triggerToggle(arg_39_0._autoBtn, var_0_0.Battle.BattleState.IsAutoBotActive(var_39_0))
end

function var_0_7.ShowTimer(arg_40_0)
	arg_40_0._timerView:SetActive(true)
end

function var_0_7.ShowDuelBar(arg_41_0)
	arg_41_0._duelRateBar:SetActive(true)
end

function var_0_7.ShowSimulationView(arg_42_0)
	arg_42_0._simulationBuffCountView:SetActive(true)
end

function var_0_7.ShowPauseButton(arg_43_0, arg_43_1)
	setActive(arg_43_0._ui:findTF("PauseBtn"), arg_43_1)
end

function var_0_7.ShowDodgemScoreBar(arg_44_0)
	arg_44_0:InitScoreBar()
	arg_44_0._dataProxy:RegisterEventListener(arg_44_0, var_0_1.UPDATE_DODGEM_SCORE, arg_44_0.onUpdateDodgemScore)
	arg_44_0._dataProxy:RegisterEventListener(arg_44_0, var_0_1.UPDATE_DODGEM_COMBO, arg_44_0.onUpdateDodgemCombo)
	arg_44_0._scoreBarView:UpdateScore(0)
	arg_44_0._scoreBarView:SetActive(true)
end

function var_0_7.ShowAirFightScoreBar(arg_45_0)
	arg_45_0:InitAirFightScoreBar()
	arg_45_0._dataProxy:RegisterEventListener(arg_45_0, var_0_1.UPDATE_DODGEM_SCORE, arg_45_0.onUpdateDodgemScore)
	arg_45_0._dataProxy:RegisterEventListener(arg_45_0, var_0_1.UPDATE_DODGEM_COMBO, arg_45_0.onUpdateDodgemCombo)
	arg_45_0._scoreBarView:UpdateScore(0)
	arg_45_0._scoreBarView:SetActive(true)
end

function var_0_7.ScaleUISpeed(arg_46_0, arg_46_1)
	local var_46_0 = arg_46_0._ui:findTF("AutoBtn/on"):GetComponent(typeof(Animation))

	if var_46_0 then
		var_46_0:get_Item("autobtn_toOn").speed = arg_46_1
	end

	local var_46_1 = arg_46_0._ui:findTF("AutoBtn/off"):GetComponent(typeof(Animation))

	if var_46_1 then
		var_46_1:get_Item("autobtn_toOff").speed = arg_46_1
	end
end

function var_0_7.onStageInit(arg_47_0, arg_47_1)
	arg_47_0:InitJoystick()
	arg_47_0:InitScene()
	arg_47_0:InitTimer()
	arg_47_0:InitEnemyHpBar()
	arg_47_0:InitAirStrikeIcon()
	arg_47_0:InitCommonWarning()
	arg_47_0:InitAutoBtn()
	arg_47_0:InitMainDamagedView()
end

function var_0_7.onEnemyHit(arg_48_0, arg_48_1)
	local var_48_0 = arg_48_1.Data

	if var_48_0:GetDiveInvisible() and not var_48_0:GetDiveDetected() then
		return
	end

	local var_48_1 = arg_48_0._enemyHpBar:GetCurrentTarget()

	if var_48_1 then
		if var_48_1 ~= var_48_0 then
			arg_48_0._enemyHpBar:SwitchTarget(var_48_0, arg_48_0._dataProxy:GetUnitList())
		end
	else
		arg_48_0._enemyHpBar:SwitchTarget(var_48_0, arg_48_0._dataProxy:GetUnitList())
	end
end

function var_0_7.onEnemyHpUpdate(arg_49_0, arg_49_1)
	local var_49_0 = arg_49_1.Dispatcher

	if var_49_0 == arg_49_0._enemyHpBar:GetCurrentTarget() and (not var_49_0:GetDiveInvisible() or var_49_0:GetDiveDetected()) then
		arg_49_0._enemyHpBar:UpdateHpBar()
	end
end

function var_0_7.onPlayerMainUnitHpUpdate(arg_50_0, arg_50_1)
	if arg_50_1.Data.dHP < 0 then
		arg_50_0._mainDamagedView:Play()
	end
end

function var_0_7.onSkillFloat(arg_51_0, arg_51_1)
	local var_51_0 = arg_51_1.Data
	local var_51_1 = var_51_0.coverHrzIcon
	local var_51_2 = var_51_0.commander
	local var_51_3 = var_51_0.skillName
	local var_51_4 = arg_51_1.Dispatcher

	if var_51_1 then
		arg_51_0:ShowSkillFloatCover(var_51_4, var_51_3, var_51_1)
	else
		arg_51_0:ShowSkillFloat(var_51_4, var_51_3, var_51_2)
	end
end

function var_0_7.onCommonInit(arg_52_0, arg_52_1)
	arg_52_0._skillView = var_0_0.Battle.BattleSkillView.New(arg_52_0, arg_52_1.Data)
	arg_52_0._updateViewList[arg_52_0._skillView] = true
	arg_52_0._userFleet = arg_52_0._dataProxy:GetFleetByIFF(var_0_5.FRIENDLY_CODE)

	arg_52_0._userFleet:RegisterEventListener(arg_52_0, var_0_1.SHOW_BUFFER, arg_52_0.onShowBuffer)
	arg_52_0._userFleet:RegisterEventListener(arg_52_0, var_0_2.POINT_HIT_CHARGE, arg_52_0.onPointHitSight)
	arg_52_0._userFleet:RegisterEventListener(arg_52_0, var_0_2.POINT_HIT_CANCEL, arg_52_0.onPointHitSight)
	arg_52_0._userFleet:RegisterEventListener(arg_52_0, var_0_1.MANUAL_SUBMARINE_SHIFT, arg_52_0.onManualSubShift)
	arg_52_0._userFleet:RegisterEventListener(arg_52_0, var_0_1.FLEET_BLIND, arg_52_0.onFleetBlind)
	arg_52_0._userFleet:RegisterEventListener(arg_52_0, var_0_1.UPDATE_FLEET_ATTR, arg_52_0.onFleetAttrUpdate)

	arg_52_0._sightView = var_0_0.Battle.BattleOpticalSightView.New(arg_52_0._ui:findTF("ChargeAreaContainer"))

	arg_52_0._sightView:SetFleetVO(arg_52_0._userFleet)

	local var_52_0, var_52_1, var_52_2, var_52_3 = arg_52_0._dataProxy:GetTotalBounds()

	arg_52_0._sightView:SetAreaBound(var_52_2, var_52_3)

	local var_52_4
	local var_52_5

	if arg_52_0._dataProxy:GetInitData().ChapterBuffIDs then
		for iter_52_0, iter_52_1 in ipairs(arg_52_0._dataProxy:GetInitData().ChapterBuffIDs) do
			if iter_52_1 == 9727 then
				var_52_4 = true

				break
			end
		end
	end

	if #arg_52_0._dataProxy:GetFleetByIFF(var_0_5.FRIENDLY_CODE):GetSupportUnitList() > 0 then
		var_52_5 = true
	end

	if var_52_5 and not var_52_4 then
		arg_52_0._airAdavantageTF = arg_52_0._airSupportTF:Find("player_advantage")
	elseif var_52_4 and not var_52_5 then
		arg_52_0._airAdavantageTF = arg_52_0._airSupportTF:Find("enemy_advantage")
	elseif var_52_4 and var_52_5 then
		arg_52_0._airAdavantageTF = arg_52_0._airSupportTF:Find("draw")
	end
end

function var_0_7.onAddFleet(arg_53_0, arg_53_1)
	local var_53_0 = arg_53_1.Data.fleetVO

	if PlayerPrefs.GetInt(BATTLE_EXPOSE_LINE, 1) == 1 then
		arg_53_0:SetFleetCloakLine(var_53_0)
	end
end

function var_0_7.SetFleetCloakLine(arg_54_0, arg_54_1)
	if #arg_54_1:GetCloakList() > 0 then
		local var_54_0 = arg_54_1:GetIFF()
		local var_54_1 = arg_54_1:GetFleetVisionLine()
		local var_54_2 = arg_54_1:GetFleetExposeLine()

		arg_54_0._seaView:SetExposeLine(var_54_0, var_54_1, var_54_2)
	end
end

function var_0_7.onAddUnit(arg_55_0, arg_55_1)
	local var_55_0 = arg_55_1.Data.type
	local var_55_1 = arg_55_1.Data.unit

	if var_55_0 == var_0_3.UnitType.PLAYER_UNIT or var_55_0 == var_0_3.UnitType.ENEMY_UNIT or var_55_0 == var_0_3.UnitType.BOSS_UNIT then
		arg_55_0:registerUnitEvent(var_55_1)
	end

	if var_55_1:IsBoss() and arg_55_0._dataProxy:GetActiveBossCount() == 1 then
		arg_55_0:AddBossWarningUI()
	elseif var_55_0 == var_0_3.UnitType.ENEMY_UNIT then
		arg_55_0:registerNPCUnitEvent(var_55_1)
	elseif var_55_0 == var_0_3.UnitType.PLAYER_UNIT and var_55_1:IsMainFleetUnit() and var_55_1:GetIFF() == var_0_5.FRIENDLY_CODE then
		arg_55_0:registerPlayerMainUnitEvent(var_55_1)
	end

	local var_55_2 = var_55_1:GetTemplate().nationality

	if table.contains(var_0_5.ALCHEMIST_AP_UI, var_55_2) and var_55_1:GetIFF() == var_0_5.FRIENDLY_CODE then
		arg_55_0:InitAlchemistAPView()
	end
end

function var_0_7.onSubmarineDetected(arg_56_0, arg_56_1)
	local var_56_0 = arg_56_1.Dispatcher

	if arg_56_0._enemyHpBar:GetCurrentTarget() and arg_56_0._enemyHpBar:GetCurrentTarget() == var_56_0 and var_56_0:GetDiveDetected() == false then
		arg_56_0._enemyHpBar:RemoveUnit()
	end
end

function var_0_7.onRemoveUnit(arg_57_0, arg_57_1)
	local var_57_0 = arg_57_1.Data.unit
	local var_57_1 = arg_57_1.Data.type

	if var_57_1 == var_0_3.UnitType.PLAYER_UNIT or var_57_1 == var_0_3.UnitType.ENEMY_UNIT or var_57_1 == var_0_3.UnitType.BOSS_UNIT then
		arg_57_0:unregisterUnitEvent(var_57_0)
	end

	if var_57_1 == var_0_3.UnitType.ENEMY_UNIT and not var_57_0:IsBoss() then
		arg_57_0:unregisterNPCUnitEvent(var_57_0)
	elseif var_57_0:GetIFF() == var_0_5.FRIENDLY_CODE and var_57_0:IsMainFleetUnit() then
		arg_57_0:unregisterPlayerMainUnitEvent(var_57_0)
	end

	if arg_57_1.Data.deadReason == var_0_3.UnitDeathReason.LEAVE and arg_57_0._enemyHpBar:GetCurrentTarget() and arg_57_0._enemyHpBar:GetCurrentTarget() == arg_57_1.Data.unit then
		arg_57_0._enemyHpBar:RemoveUnit(arg_57_1.Data.deadReason)
	end
end

function var_0_7.onUpdateCountDown(arg_58_0, arg_58_1)
	arg_58_0._timerView:SetCountDownText(arg_58_0._dataProxy:GetCountDown())
end

function var_0_7.onUpdateDodgemScore(arg_59_0, arg_59_1)
	local var_59_0 = arg_59_1.Data.totalScore

	arg_59_0._scoreBarView:UpdateScore(var_59_0)
end

function var_0_7.onUpdateDodgemCombo(arg_60_0, arg_60_1)
	local var_60_0 = arg_60_1.Data.combo

	arg_60_0._scoreBarView:UpdateCombo(var_60_0)
end

function var_0_7.onAddAirStrike(arg_61_0, arg_61_1)
	local var_61_0 = arg_61_1.Data.index
	local var_61_1 = arg_61_0._dataProxy:GetAirFighterInfo(var_61_0)

	arg_61_0._airStrikeView:AppendIcon(var_61_0, var_61_1)
end

function var_0_7.onRemoveAirStrike(arg_62_0, arg_62_1)
	local var_62_0 = arg_62_1.Data.index
	local var_62_1 = arg_62_0._dataProxy:GetAirFighterInfo(var_62_0)

	arg_62_0._airStrikeView:RemoveIcon(var_62_0, var_62_1)
end

function var_0_7.onUpdateAirSupportLabel(arg_63_0, arg_63_1)
	local var_63_0 = arg_63_0._dataProxy:GetAirFighterList()
	local var_63_1 = 0

	for iter_63_0, iter_63_1 in ipairs(var_63_0) do
		var_63_1 = var_63_1 + iter_63_1.totalNumber
	end

	if var_63_1 == 0 or arg_63_0._warningView:GetCount() > 0 then
		eachChild(arg_63_0._airSupportTF, function(arg_64_0)
			setActive(arg_64_0, false)
		end)
	elseif arg_63_0._airAdavantageTF then
		setActive(arg_63_0._airAdavantageTF, true)
	end
end

function var_0_7.onUpdateHostileSubmarine(arg_65_0, arg_65_1)
	local var_65_0 = arg_65_0._dataProxy:GetEnemySubmarineCount()

	arg_65_0._warningView:UpdateHostileSubmarineCount(var_65_0)
	arg_65_0:onUpdateAirSupportLabel()
end

function var_0_7.onUpdateEnvironmentWarning(arg_66_0, arg_66_1)
	if arg_66_1.Data.isActive then
		arg_66_0._warningView:ActiveWarning(arg_66_0._warningView.WARNING_TYPE_ARTILLERY)
	else
		arg_66_0._warningView:DeactiveWarning(arg_66_0._warningView.WARNING_TYPE_ARTILLERY)
	end
end

function var_0_7.onCameraFocus(arg_67_0, arg_67_1)
	local var_67_0 = arg_67_1.Data

	if var_67_0.unit ~= nil then
		local var_67_1 = var_67_0.skill or false

		arg_67_0:EnableComponent(false)
		arg_67_0:EnableSkillFloat(var_67_1)
	else
		local var_67_2 = var_67_0.duration + var_67_0.extraBulletTime

		LeanTween.delayedCall(arg_67_0._ui._go, var_67_2, System.Action(function()
			arg_67_0:EnableComponent(true)
			arg_67_0:EnableSkillFloat(true)
		end))
	end
end

function var_0_7.onShowPainting(arg_69_0, arg_69_1)
	local var_69_0 = arg_69_1.Data

	arg_69_0:ShowSkillPainting(var_69_0.caster, var_69_0.skill, var_69_0.speed)
end

function var_0_7.onBulletTime(arg_70_0, arg_70_1)
	local var_70_0 = arg_70_1.Data
	local var_70_1 = var_70_0.key
	local var_70_2 = var_70_0.rate

	if var_70_2 then
		var_0_4.AppendMapFactor(var_70_1, var_70_2)
	else
		var_0_4.RemoveMapFactor(var_70_1)
	end

	arg_70_0._seaView:UpdateSpeedScaler()
end

function var_0_7.onShowBuffer(arg_71_0, arg_71_1)
	local var_71_0 = arg_71_1.Data.dist

	arg_71_0._seaView:UpdateBufferAlpha(var_71_0)
end

function var_0_7.onManualSubShift(arg_72_0, arg_72_1)
	local var_72_0 = arg_72_1.Data.state

	arg_72_0._skillView:ShiftSubmarineManualButton(var_72_0)
end

function var_0_7.onPointHitSight(arg_73_0, arg_73_1)
	local var_73_0 = arg_73_1.ID

	if var_73_0 == var_0_2.POINT_HIT_CHARGE then
		arg_73_0._sightView:SetActive(true)

		arg_73_0._updateViewList[arg_73_0._sightView] = true
	elseif var_73_0 == var_0_2.POINT_HIT_CANCEL then
		arg_73_0._sightView:SetActive(false)

		arg_73_0._updateViewList[arg_73_0._sightView] = nil
	end
end

function var_0_7.onFleetBlind(arg_74_0, arg_74_1)
	local var_74_0 = arg_74_1.Data.isBlind
	local var_74_1 = arg_74_1.Dispatcher

	if not arg_74_0._inkView then
		arg_74_0:InitInkView(var_74_1)
	end

	if var_74_0 then
		local var_74_2 = var_74_1:GetUnitList()

		arg_74_0._inkView:SetActive(true, var_74_2)
		arg_74_0._skillView:HideSkillButton(true)

		arg_74_0._updateViewList[arg_74_0._inkView] = true
	else
		arg_74_0._inkView:SetActive(false)
		arg_74_0._skillView:HideSkillButton(false)

		arg_74_0._updateViewList[arg_74_0._inkView] = nil
	end
end

function var_0_7.onFleetHorizonUpdate(arg_75_0, arg_75_1)
	if not arg_75_0._inkView then
		return
	end

	local var_75_0 = arg_75_1.Dispatcher:GetUnitList()

	arg_75_0._inkView:UpdateHollow(var_75_0)
end

function var_0_7.onFleetAttrUpdate(arg_76_0, arg_76_1)
	if arg_76_0._alchemistAP then
		local var_76_0 = arg_76_1.Dispatcher
		local var_76_1 = arg_76_1.Data.attr
		local var_76_2 = arg_76_1.Data.value

		if var_76_1 == arg_76_0._alchemistAP:GetAttrName() then
			arg_76_0._alchemistAP:UpdateAP(var_76_2)
		end
	end
end

function var_0_7.OnAddUIFX(arg_77_0, arg_77_1)
	local var_77_0 = arg_77_1.Data.FXID
	local var_77_1 = arg_77_1.Data.position
	local var_77_2 = arg_77_1.Data.localScale
	local var_77_3 = arg_77_1.Data.orderDiff

	arg_77_0:AddUIFX(var_77_3, var_77_0, var_77_1, var_77_2)
end

function var_0_7.AddUIFX(arg_78_0, arg_78_1, arg_78_2, arg_78_3, arg_78_4)
	local var_78_0 = arg_78_0._fxPool:GetFX(arg_78_2)

	arg_78_1 = arg_78_1 or 1

	local var_78_1

	var_78_1 = arg_78_1 > 0

	local var_78_2 = arg_78_0._ui:AddUIFX(var_78_0, arg_78_1)

	arg_78_4 = arg_78_4 or 1
	var_78_0.transform.localScale = Vector3(arg_78_4 / var_78_2.x, arg_78_4 / var_78_2.y, arg_78_4 / var_78_2.z)

	pg.EffectMgr.GetInstance():PlayBattleEffect(var_78_0, arg_78_3, true)
end

function var_0_7.AddBossWarningUI(arg_79_0)
	arg_79_0._dataProxy:BlockManualCast(true)

	local var_79_0 = var_0_0.Battle.BattleResourceManager.GetInstance()

	arg_79_0._appearEffect = var_79_0:InstBossWarningUI()

	local var_79_1 = arg_79_0._appearEffect:GetComponent(typeof(Animator))
	local var_79_2 = {
		Pause = function()
			var_79_1.speed = 0
		end,
		Resume = function()
			var_79_1.speed = 1
		end
	}

	arg_79_0._state:SetTakeoverProcess(var_79_2)

	var_79_1.speed = 1 / arg_79_0._state:GetTimeScaleRate()

	setParent(arg_79_0._appearEffect, arg_79_0._ui.uiCanvas, false)
	arg_79_0._appearEffect:GetComponent(typeof(DftAniEvent)):SetEndEvent(function(arg_82_0)
		arg_79_0._userFleet:CoupleEncourage()
		arg_79_0._dataProxy:BlockManualCast(false)
		arg_79_0._state:ClearTakeoverProcess()
		var_79_0:DestroyOb(arg_79_0._appearEffect)

		arg_79_0._appearEffect = nil
	end)
	SetActive(arg_79_0._appearEffect, true)
end

function var_0_7.OnHideButtons(arg_83_0, arg_83_1)
	local var_83_0 = arg_83_1.Data.isActive

	arg_83_0._skillView:HideSkillButton(not var_83_0)
	SetActive(arg_83_0._autoBtn.transform, var_83_0)
end

function var_0_7.onEditCustomWarning(arg_84_0, arg_84_1)
	local var_84_0 = arg_84_1.Data.labelData

	arg_84_0._warningView:EditCustomWarning(var_84_0)
end

function var_0_7.onGridmanSkillFloat(arg_85_0, arg_85_1)
	if not arg_85_0._gridmanSkillFloat then
		local var_85_0 = var_0_0.Battle.BattleResourceManager.GetInstance():InstGridmanSkillUI()

		arg_85_0._gridmanSkillFloat = var_0_0.Battle.BattleGridmanSkillFloatView.New(var_85_0)

		setParent(var_85_0, arg_85_0._ui.uiCanvas, false)
	end

	local var_85_1 = arg_85_1.Data
	local var_85_2 = var_85_1.type
	local var_85_3 = var_85_1.IFF

	if var_85_2 == 5 then
		arg_85_0._gridmanSkillFloat:DoFusionFloat(var_85_3)
	else
		arg_85_0._gridmanSkillFloat:DoSkillFloat(var_85_2, var_85_3)
	end
end

function var_0_7.registerUnitEvent(arg_86_0, arg_86_1)
	arg_86_1:RegisterEventListener(arg_86_0, var_0_2.SKILL_FLOAT, arg_86_0.onSkillFloat)
	arg_86_1:RegisterEventListener(arg_86_0, var_0_2.CUT_INT, arg_86_0.onShowPainting)
end

function var_0_7.registerNPCUnitEvent(arg_87_0, arg_87_1)
	arg_87_1:RegisterEventListener(arg_87_0, var_0_2.UPDATE_HP, arg_87_0.onEnemyHpUpdate)

	local var_87_0 = arg_87_1:GetTemplate().type

	if table.contains(TeamType.SubShipType, var_87_0) then
		arg_87_1:RegisterEventListener(arg_87_0, var_0_2.SUBMARINE_DETECTED, arg_87_0.onSubmarineDetected)
	end
end

function var_0_7.registerPlayerMainUnitEvent(arg_88_0, arg_88_1)
	arg_88_1:RegisterEventListener(arg_88_0, var_0_2.UPDATE_HP, arg_88_0.onPlayerMainUnitHpUpdate)
end

function var_0_7.unregisterUnitEvent(arg_89_0, arg_89_1)
	arg_89_1:UnregisterEventListener(arg_89_0, var_0_2.SKILL_FLOAT)
	arg_89_1:UnregisterEventListener(arg_89_0, var_0_2.CUT_INT)
end

function var_0_7.unregisterNPCUnitEvent(arg_90_0, arg_90_1)
	arg_90_1:UnregisterEventListener(arg_90_0, var_0_2.SKILL_FLOAT)
	arg_90_1:UnregisterEventListener(arg_90_0, var_0_2.CUT_INT)
	arg_90_1:UnregisterEventListener(arg_90_0, var_0_2.UPDATE_HP)

	local var_90_0 = arg_90_1:GetTemplate().type

	if table.contains(TeamType.SubShipType, var_90_0) then
		arg_90_1:UnregisterEventListener(arg_90_0, var_0_2.SUBMARINE_DETECTED)
	end
end

function var_0_7.unregisterPlayerMainUnitEvent(arg_91_0, arg_91_1)
	arg_91_1:UnregisterEventListener(arg_91_0, var_0_2.UPDATE_HP)
end

function var_0_7.Dispose(arg_92_0)
	LeanTween.cancel(arg_92_0._ui._go)
	arg_92_0._uiMGR:ClearStick()

	arg_92_0._uiMGR = nil

	if arg_92_0._appearEffect then
		Destroy(arg_92_0._appearEffect)
	end

	arg_92_0:RemoveUIEvent()

	arg_92_0._updateViewList = nil

	arg_92_0._timerView:Dispose()
	arg_92_0._enemyHpBar:Dispose()
	arg_92_0._skillView:Dispose()
	arg_92_0._seaView:Dispose()
	arg_92_0._airStrikeView:Dispose()
	arg_92_0._sightView:Dispose()
	arg_92_0._mainDamagedView:Dispose()
	arg_92_0._warningView:Dispose()

	arg_92_0._seaView = nil
	arg_92_0._enemyHpBar = nil
	arg_92_0._skillView = nil
	arg_92_0._timerView = nil
	arg_92_0._joystick = nil
	arg_92_0._airStrikeView = nil
	arg_92_0._warningView = nil
	arg_92_0._mainDamagedView = nil

	if arg_92_0._duelRateBar then
		arg_92_0._duelRateBar:Dispose()

		arg_92_0._duelRateBar = nil
	end

	if arg_92_0._simulationBuffCountView then
		arg_92_0._simulationBuffCountView:Dispose()

		arg_92_0._simulationBuffCountView = nil
	end

	if arg_92_0._jammingView then
		arg_92_0._jammingView:Dispose()

		arg_92_0._jammingView = nil
	end

	if arg_92_0._inkView then
		arg_92_0._inkView:Dispose()

		arg_92_0._inkView = nil
	end

	if arg_92_0._alchemistAP then
		arg_92_0._alchemistAP:Dispose()

		arg_92_0._alchemistAP = nil
	end

	if arg_92_0._gridmanSkillFloat then
		arg_92_0._gridmanSkillFloat:Dispose()
	end

	if go(arg_92_0._ui:findTF("CardPuzzleConsole")).activeSelf then
		arg_92_0:DisposeCardPuzzleComponent()
	end

	var_0_7.super.Dispose(arg_92_0)
end

function var_0_7.OnCardPuzzleInit(arg_93_0, arg_93_1)
	arg_93_0._cardPuzzleComponent = arg_93_0._dataProxy:GetFleetByIFF(var_0_5.FRIENDLY_CODE):GetCardPuzzleComponent()

	arg_93_0:ShowCardPuzzleComponent()
	arg_93_0:RegisterCardPuzzleEvent()
end

function var_0_7.RegisterCardPuzzleEvent(arg_94_0)
	arg_94_0._cardPuzzleComponent:RegisterEventListener(arg_94_0, var_0_6.UPDATE_FLEET_SHIP, arg_94_0.onUpdateFleetShip)
	arg_94_0._cardPuzzleComponent:RegisterEventListener(arg_94_0, var_0_6.COMMON_BUTTON_ENABLE, arg_94_0.onBlockCommonButton)
	arg_94_0._cardPuzzleComponent:RegisterEventListener(arg_94_0, var_0_6.LONG_PRESS_BULLET_TIME, arg_94_0.onLongPressBulletTime)
	arg_94_0._cardPuzzleComponent:RegisterEventListener(arg_94_0, var_0_6.SHOW_CARD_DETAIL, arg_94_0.onShowCardDetail)
end

function var_0_7.ShowCardPuzzleComponent(arg_95_0)
	setActive(arg_95_0._ui:findTF("CardPuzzleConsole"), true)
	arg_95_0:InitCardPuzzleCommonHPBar()
	arg_95_0:InitCardPuzzleEnergyBar()
	arg_95_0:IntCardPuzzleFleetHead()
	arg_95_0:InitCameraCardBoardClicker()
	arg_95_0:InitCardPuzzleMovePile()
	arg_95_0:InitCardPuzzleDeckPile()
	arg_95_0:InitCardPuzzleIconList()
	arg_95_0:InitCardPuzzleHandBoard()
	arg_95_0:InitCardPuzzleCardDetail()
	arg_95_0:InitCardPuzzleGoalRemind()
end

function var_0_7.InitCardPuzzleCommonHPBar(arg_96_0)
	arg_96_0._cardPuzzleHPBar = var_0_0.Battle.CardPuzzleCommonHPBar.New(arg_96_0._ui:findTF("CardPuzzleConsole/commonHP"))

	arg_96_0._cardPuzzleHPBar:SetCardPuzzleComponent(arg_96_0._cardPuzzleComponent)

	arg_96_0._updateViewList[arg_96_0._cardPuzzleHPBar] = true
end

function var_0_7.InitCardPuzzleEnergyBar(arg_97_0)
	arg_97_0._cardPuzzleEnergyBar = var_0_0.Battle.CardPuzzleEnergyBar.New(arg_97_0._ui:findTF("CardPuzzleConsole/energy_block"))

	arg_97_0._cardPuzzleEnergyBar:SetCardPuzzleComponent(arg_97_0._cardPuzzleComponent)

	arg_97_0._updateViewList[arg_97_0._cardPuzzleEnergyBar] = true
end

function var_0_7.InitCameraCardBoardClicker(arg_98_0)
	arg_98_0._cardPuzzleBoardClicker = var_0_0.Battle.CardPuzzleBoardClicker.New(arg_98_0._ui:findTF("CardBoardController"))

	arg_98_0._cardPuzzleBoardClicker:SetCardPuzzleComponent(arg_98_0._cardPuzzleComponent)
end

function var_0_7.IntCardPuzzleFleetHead(arg_99_0)
	arg_99_0._cardPuzzleFleetHead = var_0_0.Battle.CardPuzzleFleetHead.New(arg_99_0._ui:findTF("CardPuzzleConsole/fleet"))

	arg_99_0._cardPuzzleFleetHead:SetCardPuzzleComponent(arg_99_0._cardPuzzleComponent)
end

function var_0_7.InitCardPuzzleMovePile(arg_100_0)
	arg_100_0._cardPuzzleMovePile = var_0_0.Battle.CardPuzzleMovePile.New(arg_100_0._ui:findTF("CardPuzzleConsole/movedeck"))

	arg_100_0._cardPuzzleMovePile:SetCardPuzzleComponent(arg_100_0._cardPuzzleComponent)

	arg_100_0._updateViewList[arg_100_0._cardPuzzleMovePile] = true
end

function var_0_7.InitCardPuzzleDeckPile(arg_101_0)
	arg_101_0._cardPuzzleDeckPile = var_0_0.Battle.CardPuzzleDeckPool.New(arg_101_0._ui:findTF("CardPuzzleConsole/deck"))

	arg_101_0._cardPuzzleDeckPile:SetCardPuzzleComponent(arg_101_0._cardPuzzleComponent)
end

function var_0_7.InitCardPuzzleIconList(arg_102_0)
	arg_102_0._cardPuzzleStatusIcon = var_0_0.Battle.CardPuzzleFleetIconList.New(arg_102_0._ui:findTF("CardPuzzleConsole/statusIcon"))

	arg_102_0._cardPuzzleStatusIcon:SetCardPuzzleComponent(arg_102_0._cardPuzzleComponent)

	arg_102_0._updateViewList[arg_102_0._cardPuzzleStatusIcon] = true
end

function var_0_7.InitCardPuzzleHandBoard(arg_103_0)
	arg_103_0._cardPuzzleHandBoard = var_0_0.Battle.CardPuzzleHandBoard.New(arg_103_0._ui:findTF("CardPuzzleConsole/cardboard"), arg_103_0._ui:findTF("CardPuzzleConsole/hand"))

	arg_103_0._cardPuzzleHandBoard:SetCardPuzzleComponent(arg_103_0._cardPuzzleComponent)

	arg_103_0._updateViewList[arg_103_0._cardPuzzleHandBoard] = true
end

function var_0_7.InitCardPuzzleGoalRemind(arg_104_0)
	arg_104_0._cardPuzzleGoalRemind = var_0_0.Battle.CardPuzzleGoalRemind.New(arg_104_0._ui:findTF("CardPuzzleConsole/goal"))

	arg_104_0._cardPuzzleGoalRemind:SetCardPuzzleComponent(arg_104_0._cardPuzzleComponent)
end

function var_0_7.InitCardPuzzleCardDetail(arg_105_0)
	arg_105_0._cardPuzzleCardDetail = var_0_0.Battle.CardPuzzleCardDetail.New(arg_105_0._ui:findTF("CardPuzzleConsole/cardDetail"))
end

function var_0_7.DisposeCardPuzzleComponent(arg_106_0)
	arg_106_0._cardPuzzleHPBar:Dispose()
	arg_106_0._cardPuzzleEnergyBar:Dispose()
	arg_106_0._cardPuzzleBoardClicker:Dispose()
	arg_106_0._cardPuzzleFleetHead:Dispose()
	arg_106_0._cardPuzzleMovePile:Dispose()
	arg_106_0._cardPuzzleDeckPile:Dispose()
	arg_106_0._cardPuzzleStatusIcon:Dispose()
	arg_106_0._cardPuzzleHandBoard:Dispose()
	arg_106_0._cardPuzzleGoalRemind:Dispose()
	arg_106_0._cardPuzzleCardDetail:Dispose()
end

function var_0_7.onUpdateFleetBuff(arg_107_0)
	return
end

function var_0_7.onUpdateFleetShip(arg_108_0, arg_108_1)
	arg_108_0._cardPuzzleFleetHead:UpdateShipIcon(arg_108_1.Data.teamType)
end

function var_0_7.onBlockCommonButton(arg_109_0, arg_109_1)
	local var_109_0 = arg_109_1.Data.flag

	arg_109_0:EnableComponent(var_109_0)
end

function var_0_7.onLongPressBulletTime(arg_110_0, arg_110_1)
	local var_110_0 = arg_110_1.Data.timeScale

	arg_110_0._state:ScaleTimer(var_110_0)
end

function var_0_7.onShowCardDetail(arg_111_0, arg_111_1)
	local var_111_0 = arg_111_1.Data.card

	if var_111_0 then
		arg_111_0._cardPuzzleCardDetail:Active(true)
		arg_111_0._cardPuzzleCardDetail:SetReferenceCard(var_111_0)
	else
		arg_111_0._cardPuzzleCardDetail:Active(false)
	end
end
