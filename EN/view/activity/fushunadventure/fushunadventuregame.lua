local var_0_0 = class("FushunAdventureGame")
local var_0_1 = false
local var_0_2 = 0
local var_0_3 = 1
local var_0_4 = 2
local var_0_5 = 3
local var_0_6 = 4

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	pg.DelegateInfo.New(arg_1_0)

	arg_1_0.state = var_0_2
	arg_1_0._go = arg_1_1
	arg_1_0.gameData = arg_1_2
	arg_1_0.highestScore = (arg_1_3:GetRuntimeData("elements") or {})[1] or 0

	arg_1_0:Init()
end

function var_0_0.SetOnShowResult(arg_2_0, arg_2_1)
	arg_2_0.OnShowResult = arg_2_1
end

function var_0_0.SetOnLevelUpdate(arg_3_0, arg_3_1)
	arg_3_0.OnLevelUpdate = arg_3_1
end

function var_0_0.setRoomTip(arg_4_0, arg_4_1)
	arg_4_0.helpTip = arg_4_1
end

function var_0_0.Init(arg_5_0)
	if arg_5_0.state ~= var_0_2 then
		return
	end

	arg_5_0.state = var_0_4

	arg_5_0:InitMainUI()

	arg_5_0.helpTip = pg.gametip.fushun_adventure_help.tip
end

function var_0_0.loadPrefab(arg_6_0, arg_6_1, arg_6_2)
	ResourceMgr.Inst:getAssetAsync(arg_6_1, "", function(arg_7_0)
		arg_6_2(instantiate(arg_7_0))
	end, true, true)
end

function var_0_0.InitMainUI(arg_8_0)
	local var_8_0 = arg_8_0._go

	onButton(arg_8_0, findTF(var_8_0, "btn_help"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = arg_8_0.helpTip
		})
	end, SFX_PANEL)
	onButton(arg_8_0, findTF(var_8_0, "btn_start"), function()
		pg.BgmMgr.GetInstance():StopPlay()
		arg_8_0:StartGame()
	end, SFX_PANEL)

	arg_8_0.levelList = UIItemList.New(findTF(var_8_0, "levels/scrollrect/content"), findTF(var_8_0, "levels/scrollrect/content/level"))
	arg_8_0.arrUp = findTF(var_8_0, "levels/arr_up")
	arg_8_0.arrDown = findTF(var_8_0, "levels/arr_bottom")

	onScroll(arg_8_0, findTF(var_8_0, "levels/scrollrect"), function(arg_11_0)
		setActive(arg_8_0.arrUp, arg_11_0.y < 1)
		setActive(arg_8_0.arrDown, arg_11_0.y > 0)
	end)
	arg_8_0:RefreshLevels()
end

function var_0_0.RefreshLevels(arg_12_0)
	local var_12_0

	arg_12_0.levelList:make(function(arg_13_0, arg_13_1, arg_13_2)
		if arg_13_0 == UIItemList.EventUpdate then
			arg_13_2:Find("Text"):GetComponent(typeof(Image)).sprite = GetSpriteFromAtlas("ui/FushunAdventureGame_atlas", "level_" .. arg_13_1 + 1)

			local var_13_0 = arg_12_0.gameData.count > 0 and 1 or 0
			local var_13_1 = arg_13_1 >= arg_12_0.gameData.usedtime + var_13_0

			setActive(arg_13_2:Find("lock"), var_13_1)

			local var_13_2 = arg_13_1 < arg_12_0.gameData.usedtime

			setActive(arg_13_2:Find("cleared"), var_13_2)
			setActive(arg_13_2:Find("Text"), not var_13_1)

			if not var_13_2 and not var_12_0 then
				var_12_0 = arg_13_1
			end

			arg_13_2:GetComponent(typeof(Image)).enabled = not var_13_1
		end
	end)
	arg_12_0.levelList:align(FushunAdventureGameConst.LEVEL_CNT)
	setActive(findTF(arg_12_0._go, "tip/got"), arg_12_0.gameData.ultimate ~= 0)

	if var_12_0 then
		local var_12_1 = var_12_0 * (arg_12_0.levelList.item.rect.height + 50)
		local var_12_2 = arg_12_0.levelList.container.anchoredPosition

		setAnchoredPosition(arg_12_0.levelList.container, {
			y = var_12_2.y + var_12_1
		})
	end

	if arg_12_0.OnLevelUpdate then
		arg_12_0.OnLevelUpdate()
	end
end

function var_0_0.InitGameUI(arg_14_0)
	local var_14_0 = arg_14_0.gameUI

	arg_14_0.btnA = findTF(var_14_0, "UI/A")
	arg_14_0.btnB = findTF(var_14_0, "UI/B")
	arg_14_0.btnAEffect = arg_14_0.btnA:Find("effect")
	arg_14_0.btnBEffect = arg_14_0.btnB:Find("effect")
	arg_14_0.btnAExEffect = arg_14_0.btnA:Find("effect_ex")
	arg_14_0.btnBExEffect = arg_14_0.btnB:Find("effect_ex")
	arg_14_0.keys = {
		findTF(var_14_0, "UI/keys/1"):GetComponent(typeof(Image)),
		findTF(var_14_0, "UI/keys/2"):GetComponent(typeof(Image)),
		findTF(var_14_0, "UI/keys/3"):GetComponent(typeof(Image))
	}
	arg_14_0.btnSprites = {
		arg_14_0.keys[1].sprite,
		arg_14_0.btnA:GetComponent(typeof(Image)).sprite,
		arg_14_0.btnB:GetComponent(typeof(Image)).sprite
	}
	arg_14_0.hearts = {
		findTF(var_14_0, "UI/heart_score/hearts/1/mark"),
		findTF(var_14_0, "UI/heart_score/hearts/2/mark"),
		findTF(var_14_0, "UI/heart_score/hearts/3/mark")
	}
	arg_14_0.numbers = {
		findTF(var_14_0, "UI/countdown_panel/timer/3"),
		findTF(var_14_0, "UI/countdown_panel/timer/2"),
		findTF(var_14_0, "UI/countdown_panel/timer/1")
	}
	arg_14_0.scoreTxt = findTF(var_14_0, "UI/heart_score/score/Text"):GetComponent(typeof(Text))
	arg_14_0.energyBar = findTF(var_14_0, "UI/ex/bar"):GetComponent(typeof(Image))
	arg_14_0.energyIcon = findTF(var_14_0, "UI/ex/icon")
	arg_14_0.energyLight = findTF(var_14_0, "UI/ex/light")
	arg_14_0.exTipPanel = findTF(var_14_0, "UI/ex_tip_panel")
	arg_14_0.comboTxt = findTF(var_14_0, "UI/combo/Text"):GetComponent(typeof(Text))
	arg_14_0.countdownPanel = findTF(var_14_0, "UI/countdown_panel")
	arg_14_0.resultPanel = findTF(var_14_0, "UI/result_panel")
	arg_14_0.resultCloseBtn = findTF(arg_14_0.resultPanel, "frame/close")
	arg_14_0.resultHighestScoreTxt = findTF(arg_14_0.resultPanel, "frame/highest/Text"):GetComponent(typeof(Text))
	arg_14_0.resultScoreTxt = findTF(arg_14_0.resultPanel, "frame/score/Text"):GetComponent(typeof(Text))
	arg_14_0.msgboxPanel = findTF(var_14_0, "UI/msg_panel")
	arg_14_0.exitMsgboxWindow = findTF(arg_14_0.msgboxPanel, "frame/exit_mode")
	arg_14_0.pauseMsgboxWindow = findTF(arg_14_0.msgboxPanel, "frame/pause_mode")
	arg_14_0.helpWindow = findTF(var_14_0, "UI/help")
	arg_14_0.lightTF = findTF(var_14_0, "game/range")
	arg_14_0.lightMark = arg_14_0.lightTF:Find("Image")
	arg_14_0.pauseBtn = findTF(var_14_0, "UI/pause")
	arg_14_0.exitBtn = findTF(var_14_0, "UI/back")
	arg_14_0.energyBar.fillAmount = 0
end

function var_0_0.EnterAnimation(arg_15_0, arg_15_1)
	setActive(arg_15_0.countdownPanel, true)

	local function var_15_0(arg_16_0)
		for iter_16_0, iter_16_1 in ipairs(arg_15_0.numbers) do
			setActive(iter_16_1, iter_16_0 == arg_16_0)
		end
	end

	local var_15_1 = 1

	arg_15_0.countdownTimer = Timer.New(function()
		var_15_1 = var_15_1 + 1

		if var_15_1 > 3 then
			setActive(arg_15_0.countdownPanel, false)
			arg_15_1()
		else
			var_15_0(var_15_1)
		end
	end, 1, 3)

	var_15_0(var_15_1)
	pg.CriMgr.GetInstance():PlaySoundEffect_V3(FushunAdventureGameConst.COUNT_DOWN_VOICE)
	arg_15_0.countdownTimer:Start()
end

function var_0_0.ShowHelpWindow(arg_18_0, arg_18_1)
	setActive(arg_18_0.helpWindow, true)
	onButton(arg_18_0, arg_18_0.helpWindow, function()
		setActive(arg_18_0.helpWindow, false)
		PlayerPrefs.SetInt("FushunAdventureGame" .. getProxy(PlayerProxy):getRawData().id, 1)
		arg_18_1()
	end, SFX_PANEL)
end

function var_0_0.DisplayKey(arg_20_0)
	local function var_20_0(arg_21_0, arg_21_1)
		local var_21_0

		if not arg_21_1 or arg_21_1 == "" then
			var_21_0 = arg_20_0.btnSprites[1]
		elseif arg_21_1 == "A" then
			var_21_0 = arg_20_0.btnSprites[2]
		elseif arg_21_1 == "B" then
			var_21_0 = arg_20_0.btnSprites[3]
		end

		if arg_21_0.sprite ~= var_21_0 then
			arg_21_0.sprite = var_21_0
		end
	end

	for iter_20_0, iter_20_1 in ipairs(arg_20_0.keys) do
		local var_20_1 = string.sub(arg_20_0.key, iter_20_0, iter_20_0) or ""

		var_20_0(iter_20_1, var_20_1)
	end
end

function var_0_0.DisplayeHearts(arg_22_0, arg_22_1)
	for iter_22_0, iter_22_1 in ipairs(arg_22_0.hearts) do
		setActive(iter_22_1, iter_22_0 <= arg_22_1)
	end
end

function var_0_0.DisplayScore(arg_23_0)
	arg_23_0.scoreTxt.text = arg_23_0.score
end

function var_0_0.DisplayeEnergy(arg_24_0, arg_24_1, arg_24_2)
	local var_24_0 = math.min(1, arg_24_1 / arg_24_2)

	arg_24_0.energyBar.fillAmount = var_24_0

	local var_24_1 = arg_24_0.energyIcon.parent.rect.width * var_24_0
	local var_24_2 = var_24_1 - arg_24_0.energyIcon.rect.width

	setAnchoredPosition(arg_24_0.energyIcon, {
		x = math.max(0, var_24_2)
	})

	local var_24_3 = 0

	if var_24_0 >= 1 then
		var_24_3 = tf(arg_24_0.energyBar.gameObject).rect.width
	elseif var_24_1 > 0 then
		var_24_3 = var_24_1
	end

	setActive(arg_24_0.energyLight, var_24_0 >= 0.01)

	arg_24_0.energyLight.sizeDelta = Vector2(var_24_3, arg_24_0.energyLight.sizeDelta.y)
end

function var_0_0.SetGameStateCallback(arg_25_0, arg_25_1, arg_25_2)
	arg_25_0._startCallback = arg_25_1
	arg_25_0._endCallback = arg_25_2
end

function var_0_0.StartGame(arg_26_0)
	if arg_26_0.state ~= var_0_4 then
		return
	end

	if arg_26_0._startCallback then
		arg_26_0._startCallback()
	end

	arg_26_0.enemys = {}
	arg_26_0.hitList = {}
	arg_26_0.missFlags = {}
	arg_26_0.score = 0
	arg_26_0.combo = 0
	arg_26_0.pause = false
	arg_26_0.schedule = FushunSchedule.New()
	arg_26_0.specailSchedule = FushunSchedule.New()

	arg_26_0:LoadScene(function()
		arg_26_0:EnterGame()
		pg.BgmMgr.GetInstance():Push(arg_26_0.__cname, FushunAdventureGameConst.GAME_BGM_NAME)
	end)

	arg_26_0.state = var_0_5
end

function var_0_0.LoadScene(arg_28_0, arg_28_1)
	seriesAsync({
		function(arg_29_0)
			if arg_28_0.gameUI then
				setActive(arg_28_0.gameUI, true)
				arg_29_0()
			else
				arg_28_0:loadPrefab("ui/FushunAdventureGame", function(arg_30_0)
					arg_28_0.gameUI = arg_30_0

					arg_30_0.transform:SetParent(arg_28_0._go.transform, false)
					arg_28_0:InitGameUI()
					arg_29_0()
				end)
			end
		end,
		function(arg_31_0)
			arg_28_0:DisplayeHearts(3)
			arg_28_0:DisplayScore()
			arg_28_0:DisplayeEnergy(0, 1)

			if not (PlayerPrefs.GetInt("FushunAdventureGame" .. getProxy(PlayerProxy):getRawData().id, 0) > 0) then
				arg_28_0:ShowHelpWindow(arg_31_0)
			else
				arg_31_0()
			end
		end,
		function(arg_32_0)
			parallelAsync({
				function(arg_33_0)
					arg_28_0:EnterAnimation(arg_33_0)
				end,
				function(arg_34_0)
					arg_28_0:loadPrefab("FushunAdventure/fushun", function(arg_35_0)
						arg_28_0.fushun = FushunChar.New(arg_35_0)

						arg_28_0.fushun:SetPosition(FushunAdventureGameConst.FUSHUN_INIT_POSITION)
						arg_35_0.transform:SetParent(arg_28_0.gameUI.transform:Find("game"), false)
						arg_34_0()
					end)
				end
			}, arg_32_0)
		end
	}, arg_28_1)
end

function var_0_0.EnterGame(arg_36_0)
	if not arg_36_0.handle then
		arg_36_0.handle = UpdateBeat:CreateListener(arg_36_0.UpdateGame, arg_36_0)
	end

	UpdateBeat:AddListener(arg_36_0.handle)

	arg_36_0.lightTF.sizeDelta = Vector2(FushunAdventureGameConst.FUSHUN_ATTACK_RANGE, arg_36_0.lightTF.sizeDelta.y)
	arg_36_0.lightTF.localPosition = Vector2(FushunAdventureGameConst.FUSHUN_ATTACK_DISTANCE + arg_36_0.fushun:GetPosition().x, arg_36_0.lightTF.localPosition.y)

	arg_36_0:SpawnEnemys()
	arg_36_0:RegisterEventListener()

	arg_36_0.key = ""

	arg_36_0.fushun:SetOnAnimEnd(function()
		arg_36_0.key = ""

		arg_36_0:DisplayKey()
	end)
end

function var_0_0.UpdateGame(arg_38_0)
	if arg_38_0.state == var_0_6 then
		arg_38_0:ExitGame(true)

		return
	end

	if not arg_38_0.pause then
		arg_38_0.spawner:Update()
		arg_38_0:AddDebugInput()

		if arg_38_0.fushun:IsDeath() then
			arg_38_0.fushun:Die()

			arg_38_0.state = var_0_6

			return
		elseif arg_38_0.fushun:ShouldInvincible() then
			arg_38_0:EnterInvincibleMode()
		elseif arg_38_0.fushun:ShouldVincible() then
			arg_38_0:ExitInvincibleMode()
		end

		local var_38_0 = false

		for iter_38_0 = #arg_38_0.enemys, 1, -1 do
			local var_38_1 = arg_38_0.enemys[iter_38_0]

			if var_38_1:IsFreeze() then
				-- block empty
			elseif arg_38_0:CheckEnemyDeath(iter_38_0) then
				-- block empty
			else
				var_38_1:Move()
				arg_38_0:CheckCollision(arg_38_0.fushun, var_38_1)

				if arg_38_0:CheckAttackRange(var_38_1) then
					var_38_0 = true
				end
			end
		end

		arg_38_0:RangeLightDisplay(var_38_0)
		arg_38_0:DisplayeEnergy(arg_38_0.fushun:GetEnergy(), arg_38_0.fushun:GetEnergyTarget())
		arg_38_0.specailSchedule:Update()
	else
		for iter_38_1 = #arg_38_0.enemys, 1, -1 do
			arg_38_0:CheckEnemyDeath(iter_38_1)
		end
	end

	arg_38_0.schedule:Update()
end

function var_0_0.RangeLightDisplay(arg_39_0, arg_39_1)
	setActive(arg_39_0.lightMark, arg_39_1)
end

function var_0_0.CheckAttackRange(arg_40_0, arg_40_1)
	local var_40_0 = arg_40_0.fushun

	return arg_40_1:GetPosition().x <= var_40_0:GetAttackPosition().x
end

function var_0_0.CheckEnemyDeath(arg_41_0, arg_41_1)
	local var_41_0 = false
	local var_41_1 = arg_41_0.enemys[arg_41_1]

	if var_41_1:IsDeath() then
		if arg_41_0.hitList[var_41_1.index] and not var_41_1:IsEscape() then
			arg_41_0:AddScore(var_41_1:GetScore())
			arg_41_0:AddEnergy(var_41_1:GetEnergyScore())
		end

		var_41_1:Vanish()
		table.remove(arg_41_0.enemys, arg_41_1)

		var_41_0 = true
	end

	return var_41_0
end

function var_0_0.EnterInvincibleMode(arg_42_0)
	local var_42_0 = FushunAdventureGameConst.EX_TIP_TIME
	local var_42_1 = FushunAdventureGameConst.EX_TIME

	arg_42_0.fushun:Invincible()
	setActive(arg_42_0.exTipPanel, true)

	arg_42_0.pause = true

	blinkAni(arg_42_0.energyBar.gameObject, 0.5, -1)
	arg_42_0.schedule:AddSchedule(var_42_0, 1, function()
		setActive(arg_42_0.exTipPanel, false)
		arg_42_0.spawner:CarzyMode()

		arg_42_0.pause = false

		arg_42_0.fushun:StartAction("EX")
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(FushunAdventureGameConst.ENTER_EX_VOICE)

		local var_43_0 = arg_42_0.fushun:GetEnergyTarget() / var_42_1

		arg_42_0.specailSchedule:AddSchedule(1, var_42_1, function()
			arg_42_0.fushun:ReduceEnergy(var_43_0)
		end)
	end)
	setActive(arg_42_0.btnAExEffect, true)
	setActive(arg_42_0.btnBExEffect, true)

	arg_42_0.key = ""

	arg_42_0:DisplayKey()
end

function var_0_0.ExitInvincibleMode(arg_45_0)
	arg_45_0.fushun:Vincible()

	arg_45_0.energyBar.color = Color.New(1, 1, 1, 1)

	LeanTween.cancel(arg_45_0.energyBar.gameObject)

	for iter_45_0, iter_45_1 in ipairs(arg_45_0.enemys) do
		arg_45_0.hitList[iter_45_1.index] = nil

		iter_45_1:Die()
	end

	arg_45_0.spawner:NormalMode()
	setActive(arg_45_0.btnAExEffect, false)
	setActive(arg_45_0.btnBExEffect, false)
end

function var_0_0.CheckCollision(arg_46_0, arg_46_1, arg_46_2)
	if var_0_0.IsCollision(arg_46_2.effectCollider2D, arg_46_1.collider2D) then
		arg_46_1:Hurt()
		arg_46_2:OnHit()
		arg_46_0:DisplayeHearts(arg_46_0.fushun:GetHp())
		arg_46_0:AddCombo(-arg_46_0.combo)
	elseif arg_46_0.fushun:InvincibleState() and not arg_46_2:IsDeath() and arg_46_2:GetPosition().x <= arg_46_1:GetAttackPosition().x then
		arg_46_2:Hurt(1)

		arg_46_0.hitList[arg_46_2.index] = true

		arg_46_0:AddHitEffect(arg_46_2)
	elseif var_0_0.IsNearby(arg_46_1:GetPosition(), arg_46_2:GetAttackPosition()) then
		arg_46_2:Attack()
	end
end

function var_0_0.AddHitEffect(arg_47_0, arg_47_1)
	local var_47_0 = arg_47_0.fushun.effectCollider2D.bounds.center
	local var_47_1 = arg_47_0.gameUI.transform:InverseTransformPoint(var_47_0)
	local var_47_2 = arg_47_1.collider2D.bounds:GetMin()
	local var_47_3 = arg_47_0.gameUI.transform:InverseTransformPoint(var_47_2)
	local var_47_4 = Vector3(var_47_3.x, var_47_1.y, 0)

	arg_47_0:loadPrefab("FushunAdventure/attack_effect", function(arg_48_0)
		arg_48_0.transform:SetParent(arg_47_0.gameUI.transform, false)

		arg_48_0.transform.localPosition = var_47_4

		local var_48_0 = arg_48_0:GetComponent(typeof(DftAniEvent))

		var_48_0:SetEndEvent(function()
			var_48_0:SetEndEvent(nil)

			if arg_48_0 then
				Destroy(arg_48_0)
			end
		end)
	end)
	arg_47_0:ShakeScreen(arg_47_0.gameUI)
end

function var_0_0.ShakeScreen(arg_50_0, arg_50_1)
	if LeanTween.isTweening(arg_50_1) then
		LeanTween.cancel(arg_50_1)
	end

	LeanTween.rotateAroundLocal(arg_50_1, Vector3(0, 0, 1), FushunAdventureGameConst.SHAKE_RANGE, FushunAdventureGameConst.SHAKE_TIME):setLoopPingPong(FushunAdventureGameConst.SHAKE_LOOP_CNT):setFrom(-1 * FushunAdventureGameConst.SHAKE_RANGE):setOnComplete(System.Action(function()
		arg_50_1.transform.localEulerAngles = Vector3(0, 0, 0)
	end))
end

function var_0_0.SpawnEnemys(arg_52_0)
	local var_52_0 = {
		FushunBeastChar,
		FushunEliteBeastChar,
		FushunEliteBeastChar
	}

	local function var_52_1(arg_53_0)
		local var_53_0 = FushunAdventureGameConst.SPEED_ADDITION
		local var_53_1

		for iter_53_0, iter_53_1 in ipairs(var_53_0) do
			local var_53_2 = iter_53_1[1][1]
			local var_53_3 = iter_53_1[1][2]

			if var_53_2 <= arg_53_0 and arg_53_0 <= var_53_3 then
				var_53_1 = iter_53_1

				break
			end
		end

		var_53_1 = var_53_1 or var_53_0[#var_53_0]

		return var_53_1[2]
	end

	local function var_52_2(arg_54_0)
		local var_54_0 = arg_54_0.config
		local var_54_1 = arg_54_0.speed
		local var_54_2 = arg_54_0.index
		local var_54_3 = var_52_0[var_54_0.id].New(arg_54_0.go, var_54_2, var_54_0)
		local var_54_4 = var_54_1 + var_52_1(arg_52_0.score)

		var_0_0.LOG("  顺序 :", var_54_2, " id :", var_54_0.id, " speed :", var_54_4)
		var_54_3:SetSpeed(var_54_4)
		var_54_3:SetPosition(FushunAdventureGameConst.ENEMY_SPAWN_POSITION)
		table.insert(arg_52_0.enemys, var_54_3)
	end

	arg_52_0.spawner = FuShunEnemySpawner.New(arg_52_0.gameUI.transform:Find("game").transform, var_52_2)

	arg_52_0.spawner:NormalMode()
end

function var_0_0.AddScore(arg_55_0, arg_55_1)
	arg_55_0:AddCombo(1)

	local var_55_0 = arg_55_0.combo >= FushunAdventureGameConst.COMBO_SCORE_TARGET and FushunAdventureGameConst.COMBO_EXTRA_SCORE or 0

	arg_55_0.score = arg_55_0.score + arg_55_1 + var_55_0

	arg_55_0:DisplayScore()
	arg_55_0.spawner:UpdateScore(arg_55_0.score)
end

function var_0_0.AddEnergy(arg_56_0, arg_56_1)
	arg_56_0.fushun:AddEnergy(arg_56_1)
end

function var_0_0.AddCombo(arg_57_0, arg_57_1)
	if arg_57_1 > 0 then
		arg_57_0:loadPrefab("UI/fushun_combo", function(arg_58_0)
			arg_58_0.transform:SetParent(arg_57_0.gameUI.transform:Find("UI"), false)

			local var_58_0

			var_58_0 = Timer.New(function()
				if arg_58_0 then
					Destroy(arg_58_0)
				end

				if var_58_0 then
					var_58_0:Stop()

					var_58_0 = nil
				end
			end, 1, 1)

			var_58_0:Start()
		end)
	end

	arg_57_0.combo = arg_57_0.combo + arg_57_1
	arg_57_0.comboTxt.text = arg_57_0.combo

	setActive(arg_57_0.comboTxt.gameObject.transform.parent, arg_57_0.combo > 0)
end

function var_0_0.Action(arg_60_0, arg_60_1)
	if arg_60_0.fushun:InvincibleState() then
		arg_60_0:AddScore(FushunAdventureGameConst.EX_CLICK_SCORE)
	else
		arg_60_0:OnFushunAttack(arg_60_1)
	end
end

function var_0_0.OnFushunAttack(arg_61_0, arg_61_1)
	if #arg_61_0.key == 3 or arg_61_0.fushun:IsMissState() or arg_61_0.fushun:IsDamageState() then
		return
	end

	arg_61_0.key = arg_61_0.key .. arg_61_1

	arg_61_0:DisplayKey()

	local var_61_0 = {}
	local var_61_1 = arg_61_0.fushun

	for iter_61_0, iter_61_1 in ipairs(arg_61_0.enemys) do
		if not iter_61_1:WillDeath() and iter_61_1:GetPosition().x <= var_61_1:GetAttackPosition().x then
			table.insert(var_61_0, iter_61_0)
		end
	end

	arg_61_0.fushun:TriggerAction(arg_61_0.key, function()
		if #var_61_0 == 0 then
			arg_61_0.fushun:Miss()
		end

		arg_61_0.key = ""

		arg_61_0:DisplayKey()
	end)

	if #var_61_0 > 0 then
		for iter_61_2, iter_61_3 in ipairs(var_61_0) do
			local var_61_2 = arg_61_0.enemys[iter_61_3]

			var_61_2:Hurt(1)

			arg_61_0.hitList[var_61_2.index] = true

			arg_61_0:AddHitEffect(var_61_2)
		end
	end
end

function var_0_0.PauseGame(arg_63_0)
	arg_63_0.pause = true
end

function var_0_0.ResumeGame(arg_64_0)
	arg_64_0.pause = false
end

function var_0_0.ExitGame(arg_65_0, arg_65_1)
	local function var_65_0()
		arg_65_0:ClearGameScene()
	end

	if arg_65_0.btnA then
		ClearEventTrigger(arg_65_0.btnA:GetComponent("EventTriggerListener"))
	end

	if arg_65_0.btnB then
		ClearEventTrigger(arg_65_0.btnB:GetComponent("EventTriggerListener"))
	end

	if arg_65_0.handle then
		UpdateBeat:RemoveListener(arg_65_0.handle)

		arg_65_0.handle = nil
	end

	if arg_65_0.schedule then
		arg_65_0.schedule:Dispose()

		arg_65_0.schedule = nil
	end

	if arg_65_0.specailSchedule then
		arg_65_0.specailSchedule:Dispose()

		arg_65_0.specailSchedule = nil
	end

	if arg_65_1 then
		if arg_65_0.OnShowResult then
			arg_65_0.OnShowResult(arg_65_0.score)
		end

		arg_65_0:ShowResultWindow(function()
			var_65_0()
		end)
	else
		var_65_0()
	end
end

function var_0_0.ClearGameScene(arg_68_0)
	if arg_68_0.fushun then
		arg_68_0.fushun:Destory()

		arg_68_0.fushun = nil
	end

	if arg_68_0.spawner then
		arg_68_0.spawner:Dispose()

		arg_68_0.spawner = nil
	end

	if arg_68_0.enemys then
		for iter_68_0, iter_68_1 in ipairs(arg_68_0.enemys) do
			iter_68_1:Dispose()
		end

		arg_68_0.enemys = nil
	end

	arg_68_0.state = var_0_4

	if arg_68_0.gameUI then
		arg_68_0:HideExitMsgbox()
		arg_68_0:HideResultWindow()
		arg_68_0:HidePauseMsgbox()
		setActive(arg_68_0.gameUI, false)
		pg.BgmMgr.GetInstance():Push(arg_68_0.__cname, FushunAdventureGameConst.BGM_NAME)
	end

	if arg_68_0._endCallback then
		arg_68_0._endCallback()
	end
end

function var_0_0.IsStarting(arg_69_0)
	return arg_69_0.state == var_0_5
end

function var_0_0.Dispose(arg_70_0)
	if arg_70_0.countdownTimer then
		arg_70_0.countdownTimer:Stop()

		arg_70_0.countdownTimer = nil
	end

	arg_70_0._startCallback = nil
	arg_70_0._endCallback = nil

	arg_70_0:ExitGame()
	pg.DelegateInfo.Dispose(arg_70_0)

	if arg_70_0.gameUI then
		Destroy(arg_70_0.gameUI)

		arg_70_0.gameUI = nil
	end

	arg_70_0._go = nil
	arg_70_0.btnSprites = nil
	arg_70_0.state = var_0_2
	arg_70_0.OnShowResult = nil
	arg_70_0.OnLevelUpdate = nil
end

function var_0_0.AddDebugInput(arg_71_0)
	if IsUnityEditor then
		if Input.GetKeyDown(KeyCode.A) then
			arg_71_0:OnShowBtnEffect("A", true)
		end

		if Input.GetKeyUp(KeyCode.A) then
			arg_71_0:Action("A")
			arg_71_0:OnShowBtnEffect("A", false)
			pg.CriMgr.GetInstance():PlaySoundEffect_V3(FushunAdventureGameConst.A_BTN_VOICE)
		end

		if Input.GetKeyDown(KeyCode.S) then
			arg_71_0:OnShowBtnEffect("B", true)
		end

		if Input.GetKeyUp(KeyCode.S) then
			arg_71_0:Action("B")
			arg_71_0:OnShowBtnEffect("B", false)
			pg.CriMgr.GetInstance():PlaySoundEffect_V3(FushunAdventureGameConst.B_BTN_VOICE)
		end
	end
end

function var_0_0.RegisterEventListener(arg_72_0)
	local var_72_0 = arg_72_0.btnA:GetComponent("EventTriggerListener")

	var_72_0:AddPointDownFunc(function()
		arg_72_0:OnShowBtnEffect("A", true)
	end)
	var_72_0:AddPointExitFunc(function()
		arg_72_0:OnShowBtnEffect("A", false)
	end)
	var_72_0:AddPointUpFunc(function()
		if arg_72_0.pause then
			return
		end

		arg_72_0:Action("A")
		arg_72_0:OnShowBtnEffect("A", false)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(FushunAdventureGameConst.A_BTN_VOICE)
	end)

	local var_72_1 = arg_72_0.btnB:GetComponent("EventTriggerListener")

	var_72_1:AddPointDownFunc(function()
		arg_72_0:OnShowBtnEffect("B", true)
	end)
	var_72_1:AddPointExitFunc(function()
		arg_72_0:OnShowBtnEffect("B", false)
	end)
	var_72_1:AddPointUpFunc(function()
		if arg_72_0.pause then
			return
		end

		arg_72_0:Action("B")
		arg_72_0:OnShowBtnEffect("B", false)
		pg.CriMgr.GetInstance():PlaySoundEffect_V3(FushunAdventureGameConst.B_BTN_VOICE)
	end)
	onButton(arg_72_0, arg_72_0.pauseBtn, function()
		arg_72_0:ShowPauseMsgbox()
	end, SFX_PANEL)
	onButton(arg_72_0, arg_72_0.exitBtn, function()
		arg_72_0:ShowExitMsgbox()
	end, SFX_PANEL)
end

function var_0_0.OnShowBtnEffect(arg_81_0, arg_81_1, arg_81_2)
	setActive(arg_81_0["btn" .. arg_81_1 .. "Effect"], arg_81_2)
end

function var_0_0.ShowResultWindow(arg_82_0, arg_82_1)
	setActive(arg_82_0.resultPanel, true)
	onButton(arg_82_0, arg_82_0.resultCloseBtn, function()
		arg_82_0:HideResultWindow()

		if arg_82_1 then
			arg_82_1()
		end
	end, SFX_PANEL)

	arg_82_0.resultHighestScoreTxt.text = arg_82_0.highestScore
	arg_82_0.resultScoreTxt.text = arg_82_0.score

	if arg_82_0.score > arg_82_0.highestScore then
		arg_82_0.highestScore = arg_82_0.score
	end
end

function var_0_0.HideResultWindow(arg_84_0)
	setActive(arg_84_0.resultPanel, false)
end

function var_0_0.ShowPauseMsgbox(arg_85_0)
	arg_85_0:PauseGame()
	setActive(arg_85_0.msgboxPanel, true)
	setActive(arg_85_0.pauseMsgboxWindow, true)
	setActive(arg_85_0.exitMsgboxWindow, false)
	onButton(arg_85_0, arg_85_0.pauseMsgboxWindow:Find("continue_btn"), function()
		arg_85_0:ResumeGame()
		arg_85_0:HidePauseMsgbox()
	end, SFX_PANEL)
end

function var_0_0.HidePauseMsgbox(arg_87_0)
	setActive(arg_87_0.msgboxPanel, false)
	setActive(arg_87_0.pauseMsgboxWindow, false)
end

function var_0_0.ShowExitMsgbox(arg_88_0)
	arg_88_0:PauseGame()
	setActive(arg_88_0.msgboxPanel, true)
	setActive(arg_88_0.pauseMsgboxWindow, false)
	setActive(arg_88_0.exitMsgboxWindow, true)
	onButton(arg_88_0, arg_88_0.exitMsgboxWindow:Find("cancel_btn"), function()
		arg_88_0:ResumeGame()
		arg_88_0:HideExitMsgbox()
	end, SFX_PANEL)
	onButton(arg_88_0, arg_88_0.exitMsgboxWindow:Find("confirm_btn"), function()
		arg_88_0:HideExitMsgbox()

		if arg_88_0.OnShowResult then
			arg_88_0.OnShowResult(arg_88_0.score)
		end

		arg_88_0:ExitGame()
	end, SFX_PANEL)
end

function var_0_0.HideExitMsgbox(arg_91_0)
	setActive(arg_91_0.msgboxPanel, false)
	setActive(arg_91_0.exitMsgboxWindow, false)
end

function var_0_0.IsCollision(arg_92_0, arg_92_1)
	return arg_92_0.enabled and arg_92_1.enabled and arg_92_0.gameObject.activeSelf and arg_92_0.bounds:Intersects(arg_92_1.bounds)
end

function var_0_0.IsNearby(arg_93_0, arg_93_1)
	return arg_93_1.x - arg_93_0.x <= 0
end

function var_0_0.LOG(...)
	if var_0_1 then
		print(...)
	end
end

return var_0_0
