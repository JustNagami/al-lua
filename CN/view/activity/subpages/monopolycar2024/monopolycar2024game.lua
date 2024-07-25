local var_0_0 = class("MonopolyCar2024Game")
local var_0_1 = 88
local var_0_2 = 43
local var_0_3 = "redcar"
local var_0_4 = MonopolyCar2024Const.map_dic
local var_0_5 = 0.6
local var_0_6 = {
	"sitelasibao_2",
	"u96_4",
	"xiafei_4"
}
local var_0_7 = {
	Vector3(56, 121, 0),
	Vector3(-557, -447, 0),
	Vector3(590, -344, 0)
}
local var_0_8 = "B-stand"
local var_0_9 = "F-stand"
local var_0_10 = "B-walk"
local var_0_11 = "F-walk"

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0._tf = arg_1_2
	arg_1_0._event = arg_1_3

	pg.DelegateInfo.New(arg_1_0)

	arg_1_0.cg = GetOrAddComponent(arg_1_0._tf, typeof(CanvasGroup))
	arg_1_0.pickPage = MonopolyCar2024PickPage.New(arg_1_2, arg_1_3)
	arg_1_0.bubblePage = MonopolyCar2024BubblePage.New(arg_1_2:Find("bubble"), arg_1_3)
	arg_1_0.awardWindow = AwardWindow.New(arg_1_2, arg_1_3)
	arg_1_0.resultPage = MonopolyCar2024TotalRewardPanel.New(arg_1_2, arg_1_3)
	arg_1_0.awardCollector = MonopolyCar2024GameAwardCollector.New()

	arg_1_0:UpdateActData(arg_1_1)
	arg_1_0:Setup()
end

function var_0_0.emit(arg_2_0, ...)
	arg_2_0._event:emit(...)
end

function var_0_0.UpdateActData(arg_3_0, arg_3_1)
	arg_3_0.actId = arg_3_1.id

	local var_3_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_3_1 = arg_3_1.data1

	arg_3_0.totalCnt = math.ceil((var_3_0 - var_3_1) / 86400) * arg_3_1:getDataConfig("daily_time") + (arg_3_1.data1_list[1] or 0)
	arg_3_0.useCount = arg_3_1.data1_list[2] or 0
	arg_3_0.leftCount = arg_3_0.totalCnt - arg_3_0.useCount
	arg_3_0.dialogRecorder = arg_3_1.data4_list
	arg_3_0.pickCharList = arg_3_1.data3_list
	arg_3_0.pos = math.max(arg_3_1.data2, 1)
	arg_3_0.step = arg_3_1.data3 or 0
	arg_3_0.effectId = arg_3_1.data4 or 0
	arg_3_0.turnCnt = arg_3_1.data1_list[3] or 0
	arg_3_0.selectedShipId = arg_3_1.data1_list[4] or 0
	arg_3_0.storys = arg_3_1:getDataConfig("story") or {}
	arg_3_0.lapReward = arg_3_1:getDataConfig("sum_lap_reward_show") or {}
	arg_3_0.titles = {
		i18n("MonopolyCar2024Game_title1"),
		i18n("MonopolyCar2024Game_title2")
	}
	arg_3_0.pickableShipId = _.map(arg_3_1:getDataConfig("ship_reward"), function(arg_4_0)
		return arg_4_0[1]
	end)
	arg_3_0.spEvents = {}

	for iter_3_0, iter_3_1 in ipairs(arg_3_1:getDataConfig("ship_dialog") or {}) do
		arg_3_0.spEvents[iter_3_1[1]] = iter_3_1[2]
	end

	arg_3_0.cacheTurnCnt = arg_3_0.turnCnt
end

function var_0_0.Setup(arg_5_0)
	arg_5_0.cg.blocksRaycasts = false

	seriesAsync({
		function(arg_6_0)
			arg_5_0:InitUI()
			arg_5_0:InitMap()
			arg_5_0:InitCar(arg_6_0)
		end,
		function(arg_7_0)
			arg_5_0:InitCheerLeaders(arg_7_0)
		end,
		function(arg_8_0)
			arg_5_0:RegisterUI()
			arg_5_0:UpdateUI()
			arg_5_0:SetUpMainLoop()
			arg_5_0:CheckEventAndMove(arg_8_0)
		end,
		function(arg_9_0)
			arg_5_0:CheckSpEvent({
				finished = true,
				shipId = arg_5_0.selectedShipId
			}, arg_9_0)
		end,
		function(arg_10_0)
			arg_5_0:CheckPickCharacter(arg_10_0)
		end
	}, function()
		arg_5_0.cg.blocksRaycasts = true
	end)
end

function var_0_0.InitCheerLeaders(arg_12_0, arg_12_1)
	local var_12_0 = {}

	arg_12_0.cheerLeaders = {}

	for iter_12_0, iter_12_1 in ipairs(var_0_6) do
		table.insert(var_12_0, function(arg_13_0)
			PoolMgr.GetInstance():GetSpineChar(iter_12_1, true, function(arg_14_0)
				local var_14_0 = arg_14_0

				var_14_0.transform.localScale = Vector3(0.6, 0.6, 1)
				var_14_0.transform.localPosition = var_0_7[iter_12_0]

				var_14_0.transform:SetParent(arg_12_0._tf, false)
				var_14_0:GetComponent(typeof(SpineAnimUI)):SetAction("stand", 0)

				arg_12_0.cheerLeaders[iter_12_1] = arg_14_0

				arg_13_0()
			end)
		end)
	end

	seriesAsync(var_12_0, arg_12_1)
end

function var_0_0.SetUpMainLoop(arg_15_0)
	if not arg_15_0.handle then
		arg_15_0.handle = UpdateBeat:CreateListener(arg_15_0.Update, arg_15_0)
	end

	UpdateBeat:AddListener(arg_15_0.handle)
end

function var_0_0.Update(arg_16_0)
	arg_16_0:MoveCar()
end

function var_0_0.InitUI(arg_17_0)
	arg_17_0.tplMapCell = findTF(arg_17_0._tf, "mapContainer/tplMapCell")
	arg_17_0.mapContainer = findTF(arg_17_0._tf, "mapContainer")
	arg_17_0.car = findTF(arg_17_0._tf, "mapContainer/char")
	arg_17_0.btnStart = findTF(arg_17_0._tf, "btnStart")
	arg_17_0.btnHelp = findTF(arg_17_0._tf, "btnHelp")
	arg_17_0.topTr = arg_17_0._tf.parent:Find("top")
	arg_17_0.btnAuto = findTF(arg_17_0.topTr, "btnAuto")
	arg_17_0.btnAutoImg = findTF(arg_17_0.topTr, "btnAuto"):GetComponent(typeof(Image))
	arg_17_0.btnAutoSel = findTF(arg_17_0.topTr, "btnAuto/Text")
	arg_17_0.btnAutoAct = findTF(arg_17_0.topTr, "btnAuto/actvie")
	arg_17_0.btnBack = findTF(arg_17_0._tf, "btnBack")
	arg_17_0.labelLeftCount = findTF(arg_17_0.btnStart, "Text")
	arg_17_0.register = findTF(arg_17_0._tf, "register")
	arg_17_0.registerTxt = findTF(arg_17_0._tf, "register/Text")
	arg_17_0.rollStep = findTF(arg_17_0._tf, "step")
	arg_17_0.hideList = {
		arg_17_0.btnStart,
		arg_17_0.btnHelp,
		arg_17_0.btnBack,
		arg_17_0.btnAuto,
		arg_17_0.register
	}

	setActive(arg_17_0.rollStep, false)
end

function var_0_0.RegisterUI(arg_18_0)
	onButton(arg_18_0, arg_18_0.btnStart, function()
		if arg_18_0.leftCount and arg_18_0.leftCount <= 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_count_noenough"))

			return
		end

		arg_18_0:Roll()
	end, SFX_PANEL)
	onButton(arg_18_0, arg_18_0.btnHelp, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.help_monopoly_car2024.tip
		})
	end, SFX_PANEL)
	onButton(arg_18_0, arg_18_0.btnAuto, function()
		if arg_18_0.autoFlag then
			arg_18_0:DisableAuto()
		else
			arg_18_0:EnableAuto()
		end
	end, SFX_PANEL)
	onButton(arg_18_0, arg_18_0.btnBack, function()
		arg_18_0:emit(BaseUI.ON_CLOSE)
	end, SFX_BACK)
	onButton(arg_18_0, arg_18_0.register, function()
		local var_23_0 = arg_18_0.turnCnt - 1

		arg_18_0.awardWindow:ExecuteAction("Flush", arg_18_0.lapReward, var_23_0, arg_18_0.titles)
	end, SFX_PANEL)
	arg_18_0:UpdateAutoBtn()
end

function var_0_0.DisableAuto(arg_24_0)
	arg_24_0.autoFlag = false

	arg_24_0:DisplayResult()
	arg_24_0:UpdateAutoBtn()
end

function var_0_0.EnableAuto(arg_25_0)
	if arg_25_0.rolling then
		return
	end

	if arg_25_0.leftCount <= 0 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_count_noenough"))

		return
	end

	if arg_25_0.useCount < 10 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("MonopolyCar2024Game_lock_auto_tip", arg_25_0.useCount))

		return
	end

	arg_25_0.awardCollector:SetUp()

	arg_25_0.autoFlag = true

	arg_25_0:RollAuto()
	arg_25_0:UpdateAutoBtn()
	pg.TipsMgr.GetInstance():ShowTips(i18n("MonopolyCar2024Game_open_auto_tip"))
end

function var_0_0.UpdateAutoBtn(arg_26_0)
	local var_26_0 = arg_26_0.useCount >= 10

	setActive(arg_26_0.btnAutoSel, var_26_0)

	arg_26_0.btnAutoImg.enabled = not var_26_0

	setActive(arg_26_0.btnAutoAct, arg_26_0.autoFlag)
end

function var_0_0.DisplayResult(arg_27_0)
	local var_27_0 = arg_27_0.awardCollector:Fetch()

	if #var_27_0 <= 0 then
		return
	end

	arg_27_0.resultPage:ExecuteAction("Show", var_27_0)
end

function var_0_0.RollAuto(arg_28_0)
	if not arg_28_0.autoFlag then
		return
	end

	if arg_28_0.leftCount <= 0 then
		arg_28_0.autoFlag = false

		arg_28_0:DisplayResult()

		return
	end

	arg_28_0:Roll(function()
		arg_28_0:RollAuto()
	end)
end

function var_0_0.Roll(arg_30_0, arg_30_1)
	local var_30_0 = 0

	arg_30_0.cg.blocksRaycasts = false
	arg_30_0.rolling = true

	seriesAsync({
		function(arg_31_0)
			arg_30_0:emit(MonopolyCar2024Mediator.ON_START, arg_30_0.actId, function(arg_32_0)
				if arg_32_0 and arg_32_0 > 0 then
					var_30_0 = arg_32_0

					arg_31_0()
				end
			end)
		end,
		function(arg_33_0)
			arg_30_0:PlayRollAnimation(var_30_0, arg_33_0)
		end,
		function(arg_34_0)
			arg_30_0:CheckSpEvent({
				result = var_30_0,
				shipId = arg_30_0.selectedShipId
			}, arg_34_0)
		end,
		function(arg_35_0)
			arg_30_0:CheckEventAndMove(arg_35_0)
		end,
		function(arg_36_0)
			arg_30_0:CheckSpStory(arg_30_0.selectedShipId, arg_36_0)
		end,
		function(arg_37_0)
			arg_30_0:CheckSpEvent({
				finished = true,
				shipId = arg_30_0.selectedShipId
			}, arg_37_0)
		end
	}, function()
		arg_30_0:UpdateAutoBtn()

		arg_30_0.cg.blocksRaycasts = true
		arg_30_0.rolling = false

		if arg_30_1 then
			arg_30_1()
		end
	end)
end

function var_0_0.CheckSpStory(arg_39_0, arg_39_1, arg_39_2)
	local var_39_0 = arg_39_0.mapCells[arg_39_0.pos]

	if not var_39_0 then
		arg_39_2()

		return
	end

	local var_39_1 = var_39_0.mapId
	local var_39_2 = pg.activity_event_monopoly_map[var_39_1].ship_event
	local var_39_3 = _.detect(var_39_2, function(arg_40_0)
		return arg_40_0[1] == arg_39_1
	end)

	if not var_39_3 then
		arg_39_2()

		return
	end

	local var_39_4 = var_39_3[2] or {}

	if #var_39_4 <= 0 then
		arg_39_2()

		return
	end

	local var_39_5 = var_39_4[math.random(1, #var_39_4)]

	arg_39_0:HideOrShowUI(false)

	local function var_39_6()
		arg_39_0:HideOrShowUI(true)
		arg_39_2()
	end

	if arg_39_0.autoFlag then
		pg.NewStoryMgr.GetInstance():ForceAutoPlay(var_39_5, var_39_6, true, true)
	else
		pg.NewStoryMgr.GetInstance():Play(var_39_5, var_39_6, true)
	end
end

function var_0_0.PlayRollAnimation(arg_42_0, arg_42_1, arg_42_2)
	setText(findTF(arg_42_0.rollStep, "animroot/Image/Text"), "00")

	local var_42_0 = arg_42_0.btnStart:GetComponent(typeof(Animation))
	local var_42_1 = var_42_0:GetComponent(typeof(DftAniEvent))
	local var_42_2 = findTF(arg_42_0.rollStep, "animroot"):GetComponent(typeof(Animation))
	local var_42_3 = var_42_2:GetComponent(typeof(DftAniEvent))

	var_42_3:SetTriggerEvent(function()
		setText(findTF(arg_42_0.rollStep, "animroot/Image/Text"), "0" .. arg_42_1)
	end)
	seriesAsync({
		function(arg_44_0)
			var_42_1:SetEndEvent(function()
				setActive(arg_42_0.btnStart, false)
				arg_44_0()
			end)
			var_42_0:Play("anim_monopolycar_mainui_btn_hide")
		end,
		function(arg_46_0)
			setActive(arg_42_0.rollStep, true)
			arg_46_0()
		end,
		function(arg_47_0)
			var_42_3:SetEndEvent(function()
				arg_47_0()
			end)
			var_42_2:Play("anim_monopolycar_mainui_step_0" .. arg_42_1)
		end,
		function(arg_49_0)
			var_42_3:SetEndEvent(function()
				setActive(arg_42_0.rollStep, false)
				arg_49_0()
			end)
			var_42_2:Play("anim_monopolycar_mainui_step_hide")
		end
	}, function()
		setActive(arg_42_0.btnStart, true)
		var_42_0:Play("anim_monopolycar_mainui_btn_show")
		arg_42_2()
	end)
end

function var_0_0.CheckEventAndMove(arg_52_0, arg_52_1)
	local function var_52_0()
		arg_52_0:CheckEventAndMove(arg_52_1)
	end

	if arg_52_0.selectedShipId == 0 then
		arg_52_0:CheckPickCharacter(var_52_0)
	elseif arg_52_0.effectId and arg_52_0.effectId > 0 then
		arg_52_0:CheckEvent(var_52_0)
	elseif arg_52_0.step and arg_52_0.step > 0 then
		arg_52_0:CheckMove(var_52_0)
	else
		arg_52_1()
	end
end

function var_0_0.CheckEvent(arg_54_0, arg_54_1)
	if not arg_54_0.effectId or arg_54_0.effectId <= 0 then
		if arg_54_1 then
			arg_54_1()
		end

		return
	end

	local var_54_0 = arg_54_0.mapCells[arg_54_0.pos]
	local var_54_1 = {}

	seriesAsync({
		function(arg_55_0)
			local var_55_0 = pg.activity_event_monopoly_event[arg_54_0.effectId].story

			if not var_55_0 or tonumber(var_55_0) == 0 then
				arg_55_0()

				return
			end

			arg_54_0:HideOrShowUI(false)

			if arg_54_0.autoFlag then
				pg.NewStoryMgr.GetInstance():ForceAutoPlay(var_55_0, arg_55_0, true, true)
			else
				pg.NewStoryMgr.GetInstance():Play(var_55_0, arg_55_0, true, true)
			end
		end,
		function(arg_56_0)
			arg_54_0:HideOrShowUI(true)
			arg_54_0:TriggerEvent(function(arg_57_0)
				var_54_1 = arg_57_0

				arg_56_0()
			end)
		end,
		function(arg_58_0)
			arg_54_0:ReadyMoveCar(var_54_1, arg_58_0)
		end,
		function(arg_59_0)
			arg_54_0:CheckCountStory(arg_59_0)
		end
	}, arg_54_1)
end

function var_0_0.HideOrShowUI(arg_60_0, arg_60_1)
	for iter_60_0, iter_60_1 in ipairs(arg_60_0.hideList) do
		setActive(iter_60_1, arg_60_1)
	end
end

function var_0_0.TriggerEvent(arg_61_0, arg_61_1)
	arg_61_0:emit(MonopolyCar2024Mediator.ON_TRIGGER, arg_61_0.actId, function(arg_62_0, arg_62_1)
		if arg_62_0 and #arg_62_0 >= 0 then
			arg_61_1(arg_62_0)
		end
	end)
end

function var_0_0.CheckCountStory(arg_63_0, arg_63_1)
	local var_63_0 = arg_63_0.useCount
	local var_63_1 = arg_63_0.storys
	local var_63_2 = _.detect(var_63_1, function(arg_64_0)
		return arg_64_0[1] == var_63_0
	end)

	if var_63_2 then
		pg.NewStoryMgr.GetInstance():Play(var_63_2[2], arg_63_1)
	else
		arg_63_1()
	end
end

function var_0_0.CheckSpEvent(arg_65_0, arg_65_1, arg_65_2)
	if arg_65_1.result and arg_65_1.result > 0 then
		arg_65_0:CheckRollResultForSpEvent(arg_65_1.result, arg_65_1.shipId)

		if arg_65_2 then
			arg_65_2()
		end
	elseif arg_65_1.repeatChat then
		arg_65_0:CheckRepeatCharForSpEvent(arg_65_1.shipId)

		if arg_65_2 then
			arg_65_2()
		end
	elseif arg_65_1.finished then
		arg_65_0:CheckFinishedForSpEvent(arg_65_1.shipId)

		if arg_65_2 then
			arg_65_2()
		end
	elseif arg_65_2 then
		arg_65_2()
	end
end

function var_0_0.CheckFinishedForSpEvent(arg_66_0, arg_66_1)
	if arg_66_0.turnCnt <= arg_66_0.cacheTurnCnt then
		return
	end

	arg_66_0.cacheTurnCnt = arg_66_0.turnCnt

	local var_66_0 = _.select(arg_66_0.spEvents[arg_66_1], function(arg_67_0)
		return arg_67_0[1] == 4
	end)

	if #var_66_0 <= 0 then
		return
	end

	local var_66_1 = var_66_0[1][2] or {}
	local var_66_2 = arg_66_0:GetUnReadDialogue(var_66_1)

	arg_66_0.bubblePage:Show(arg_66_0.actId, arg_66_1, var_66_2)
end

function var_0_0.CheckRepeatCharForSpEvent(arg_68_0, arg_68_1)
	if not table.contains(arg_68_0.pickCharList, arg_68_1) then
		return
	end

	local var_68_0 = _.select(arg_68_0.spEvents[arg_68_1] or {}, function(arg_69_0)
		return arg_69_0[1] == 5
	end)

	if #var_68_0 <= 0 then
		return
	end

	local var_68_1 = var_68_0[1][2] or {}
	local var_68_2 = arg_68_0:GetUnReadDialogue(var_68_1)

	arg_68_0.bubblePage:Show(arg_68_0.actId, arg_68_1, var_68_2)
end

function var_0_0.GetUnReadDialogue(arg_70_0, arg_70_1)
	local var_70_0 = {}

	for iter_70_0, iter_70_1 in ipairs(arg_70_1) do
		if not table.contains(arg_70_0.dialogRecorder, iter_70_1) then
			table.insert(var_70_0, iter_70_1)
		end
	end

	if #var_70_0 <= 0 then
		return arg_70_1[math.random(1, #arg_70_1)]
	end

	return var_70_0[math.random(1, #var_70_0)]
end

function var_0_0.CheckRollResultForSpEvent(arg_71_0, arg_71_1, arg_71_2)
	local var_71_0 = {
		{
			1,
			2
		},
		{
			3,
			4
		},
		{
			5,
			6
		}
	}

	assert(arg_71_0.spEvents[arg_71_2], arg_71_2)

	local var_71_1 = _.select(arg_71_0.spEvents[arg_71_2] or {}, function(arg_72_0)
		local var_72_0 = var_71_0[arg_72_0[1]] or {
			99,
			99
		}

		return arg_71_1 == var_72_0[1] or arg_71_1 == var_72_0[2]
	end)

	if #var_71_1 <= 0 then
		return
	end

	local var_71_2 = var_71_1[1][2] or {}
	local var_71_3 = arg_71_0:GetUnReadDialogue(var_71_2)

	arg_71_0.bubblePage:Show(arg_71_0.actId, arg_71_2, var_71_3)
end

function var_0_0.CheckMove(arg_73_0, arg_73_1)
	local var_73_0 = {}

	seriesAsync({
		function(arg_74_0)
			arg_73_0:emit(MonopolyCar2024Mediator.ON_MOVE, arg_73_0.actId, function(arg_75_0, arg_75_1, arg_75_2)
				var_73_0 = arg_75_1

				arg_74_0()
			end)
		end,
		function(arg_76_0)
			arg_73_0:ReadyMoveCar(var_73_0, arg_76_0)
		end
	}, arg_73_1)
end

function var_0_0.ReadyMoveCar(arg_77_0, arg_77_1, arg_77_2)
	if not arg_77_1 or #arg_77_1 <= 0 then
		if arg_77_2 then
			arg_77_2()
		end

		return
	end

	local var_77_0 = {}
	local var_77_1 = arg_77_0.car.localPosition
	local var_77_2 = {}
	local var_77_3 = {}

	for iter_77_0 = 1, #arg_77_1 do
		if arg_77_0:CheckPathTurn(arg_77_1[iter_77_0]) then
			table.insert(var_77_2, arg_77_0.mapCells[arg_77_1[iter_77_0]].position)
			table.insert(var_77_3, arg_77_1[iter_77_0])
		elseif iter_77_0 == #arg_77_1 then
			table.insert(var_77_2, arg_77_0.mapCells[arg_77_1[iter_77_0]].position)
			table.insert(var_77_3, arg_77_1[iter_77_0])
		end
	end

	arg_77_0.speedX = 0
	arg_77_0.speedY = 0
	arg_77_0.baseSpeed = 6
	arg_77_0.baseASpeed = 0.1

	for iter_77_1 = 1, #var_77_2 do
		table.insert(var_77_0, function(arg_78_0)
			arg_77_0.moveComplete = arg_78_0
			arg_77_0.stopOnEnd = false
			arg_77_0.targetPosition = var_77_2[iter_77_1]
			arg_77_0.targetPosIndex = var_77_3[iter_77_1]
			arg_77_0.moveX = arg_77_0.targetPosition.x - arg_77_0.car.localPosition.x
			arg_77_0.moveY = arg_77_0.targetPosition.y - arg_77_0.car.localPosition.y
			arg_77_0.baseSpeedX = arg_77_0.baseSpeed * (arg_77_0.moveX / math.abs(arg_77_0.moveX))
			arg_77_0.baseASpeedX = arg_77_0.baseASpeed * (arg_77_0.moveX / math.abs(arg_77_0.moveX))
			arg_77_0.baseSpeedY = math.abs(arg_77_0.baseSpeedX) / (math.abs(arg_77_0.moveX) / arg_77_0.moveY)
			arg_77_0.baseASpeedY = math.abs(arg_77_0.baseASpeedX) / (math.abs(arg_77_0.moveX) / arg_77_0.moveY)

			if iter_77_1 == 1 then
				arg_77_0.speedX = 0
				arg_77_0.speedY = 0
			else
				arg_77_0.speedX = arg_77_0.baseSpeedX
				arg_77_0.speedY = arg_77_0.baseSpeedY
			end
		end)
	end

	table.insert(var_77_0, function(arg_79_0)
		arg_77_0.moveComplete = nil

		arg_77_0:UpdateCarPos(arg_77_1[#arg_77_1], false)
		arg_79_0()
	end)
	table.insert(var_77_0, function(arg_80_0)
		LeanTween.value(go(arg_77_0._tf), 1, 0, 0.1):setOnComplete(System.Action(arg_80_0))
	end)
	seriesAsync(var_77_0, arg_77_2)
end

function var_0_0.MoveCar(arg_81_0)
	if not arg_81_0.targetPosition then
		return
	end

	local var_81_0 = math.abs(arg_81_0.targetPosition.x - arg_81_0.car.localPosition.x)
	local var_81_1 = math.abs(arg_81_0.targetPosition.y - arg_81_0.car.localPosition.y)

	if var_81_0 <= 6.5 and var_81_1 <= 6.5 then
		arg_81_0.targetPosition = nil

		if arg_81_0.moveComplete then
			arg_81_0:UpdateCarPos(arg_81_0.targetPosIndex, true)
			arg_81_0.moveComplete()
		end
	end

	arg_81_0.speedX = math.abs(arg_81_0.speedX + arg_81_0.baseASpeedX) > math.abs(arg_81_0.baseSpeedX) and arg_81_0.baseSpeedX or arg_81_0.speedX + arg_81_0.baseASpeedX
	arg_81_0.speedY = math.abs(arg_81_0.speedY + arg_81_0.baseASpeedY) > math.abs(arg_81_0.baseSpeedY) and arg_81_0.baseSpeedY or arg_81_0.speedY + arg_81_0.baseASpeedY

	local var_81_2 = arg_81_0.car.localPosition

	arg_81_0.car.localPosition = Vector3(var_81_2.x + arg_81_0.speedX, var_81_2.y + arg_81_0.speedY, 0)
end

function var_0_0.CheckPathTurn(arg_82_0, arg_82_1)
	local var_82_0 = arg_82_1 + 1 > #arg_82_0.mapCells and 1 or arg_82_1 + 1
	local var_82_1 = arg_82_1 - 1 < 1 and #arg_82_0.mapCells or arg_82_1 - 1

	if arg_82_0.mapCells[var_82_0].col == arg_82_0.mapCells[var_82_1].col or arg_82_0.mapCells[var_82_0].row == arg_82_0.mapCells[var_82_1].row then
		return false
	end

	return true
end

function var_0_0.CheckPickCharacter(arg_83_0, arg_83_1)
	if arg_83_0.selectedShipId == 0 or #arg_83_0.pickCharList == 0 then
		local function var_83_0(arg_84_0)
			local var_84_0 = arg_83_0.pickableShipId[arg_84_0]

			arg_83_0:CheckSpEvent({
				repeatChat = true,
				shipId = var_84_0
			})
			arg_83_0:emit(MonopolyCar2024Mediator.ON_PICK, arg_83_0.actId, var_84_0, function(arg_85_0)
				arg_83_0.pickPage:Hide()
				seriesAsync({
					function(arg_86_0)
						arg_83_0:ReadyMoveCar(arg_85_0, arg_86_0)
					end,
					function(arg_87_0)
						arg_83_0:CheckEventAndMove(arg_87_0)
					end
				}, arg_83_1)
			end)
		end

		local var_83_1 = _.map(arg_83_0.pickCharList, function(arg_88_0)
			return table.indexof(arg_83_0.pickableShipId, arg_88_0)
		end)

		arg_83_0.pickPage:ExecuteAction("Show", arg_83_0.actId, var_83_1, arg_83_0.autoFlag, var_83_0)
	else
		arg_83_1()
	end
end

function var_0_0.InitMap(arg_89_0)
	arg_89_0.mapCells = {}

	for iter_89_0 = 1, #var_0_4 do
		local var_89_0 = iter_89_0 - 1
		local var_89_1 = {
			x = -var_89_0 * var_0_1,
			y = -var_89_0 * var_0_2
		}
		local var_89_2 = var_0_4[iter_89_0]

		for iter_89_1 = 1, #var_89_2 do
			local var_89_3 = iter_89_1 - 1
			local var_89_4 = var_89_2[iter_89_1]

			if var_89_4 > 0 then
				local var_89_5 = cloneTplTo(arg_89_0.tplMapCell, arg_89_0.mapContainer, tostring(var_89_4))
				local var_89_6 = Vector2(var_0_1 * var_89_3 + var_89_1.x, -var_0_2 * var_89_3 + var_89_1.y)

				var_89_5.localPosition = var_89_6

				local var_89_7 = pg.activity_event_monopoly_map[var_89_4].icon
				local var_89_8 = GetSpriteFromAtlas("ui/MonopolyCar2024_atlas", var_89_7)

				var_89_5:GetComponent(typeof(Image)).sprite = var_89_8

				var_89_5:GetComponent(typeof(Image)):SetNativeSize()

				local var_89_9 = {
					col = var_89_3,
					row = var_89_0,
					mapId = var_89_4,
					tf = var_89_5,
					icon = var_89_7,
					position = var_89_6
				}

				table.insert(arg_89_0.mapCells, var_89_9)
			end
		end
	end

	table.sort(arg_89_0.mapCells, function(arg_90_0, arg_90_1)
		return arg_90_0.mapId < arg_90_1.mapId
	end)
end

function var_0_0.InitCar(arg_91_0, arg_91_1)
	PoolMgr.GetInstance():GetSpineChar(var_0_3, true, function(arg_92_0)
		arg_91_0.model = arg_92_0
		arg_91_0.model.transform.localScale = Vector3.one
		arg_91_0.model.transform.localPosition = Vector3.zero

		arg_91_0.model.transform:SetParent(arg_91_0.car, false)

		arg_91_0.anim = arg_91_0.model:GetComponent(typeof(SpineAnimUI))

		if arg_91_0.pos then
			arg_91_0:UpdateCarPos(arg_91_0.pos, false)
		end

		arg_91_1()
	end)
end

function var_0_0.UpdateCarPos(arg_93_0, arg_93_1, arg_93_2)
	if arg_93_0.model then
		assert(arg_93_0.mapCells[arg_93_1], arg_93_1)

		local var_93_0 = arg_93_0.mapCells[arg_93_1].position
		local var_93_1 = arg_93_1 + 1 > #arg_93_0.mapCells and 1 or arg_93_1 + 1
		local var_93_2 = arg_93_0.mapCells[var_93_1]
		local var_93_3, var_93_4 = arg_93_0:GetCarMoveType(arg_93_0.mapCells[arg_93_1].mapId, arg_93_0.mapCells[var_93_1].mapId, arg_93_2)

		arg_93_0.car.localScale = var_93_4

		arg_93_0.anim:SetActionCallBack(nil)
		arg_93_0.anim:SetAction(var_93_3, 0)

		arg_93_0.car.localPosition = var_93_0

		arg_93_0.car:SetAsLastSibling()
	end
end

function var_0_0.GetCarMoveType(arg_94_0, arg_94_1, arg_94_2, arg_94_3)
	local var_94_0 = {}
	local var_94_1 = {}

	for iter_94_0 = 1, #var_0_4 do
		local var_94_2 = var_0_4[iter_94_0]

		for iter_94_1 = 1, #var_94_2 do
			local var_94_3 = var_94_2[iter_94_1]

			if var_94_3 == arg_94_1 then
				var_94_0 = {
					x = iter_94_1,
					y = iter_94_0
				}
			end

			if var_94_3 == arg_94_2 then
				var_94_1 = {
					x = iter_94_1,
					y = iter_94_0
				}
			end
		end
	end

	local var_94_4
	local var_94_5

	if var_94_1.y > var_94_0.y then
		var_94_4 = arg_94_3 and var_0_11 or var_0_9
		var_94_5 = Vector3(var_0_5, var_0_5, var_0_5)
	elseif var_94_1.y < var_94_0.y then
		var_94_4 = arg_94_3 and var_0_10 or var_0_8
		var_94_5 = Vector3(var_0_5, var_0_5, var_0_5)
	elseif var_94_1.x > var_94_0.x then
		var_94_4 = arg_94_3 and var_0_11 or var_0_9
		var_94_5 = Vector3(-var_0_5, var_0_5, var_0_5)
	elseif var_94_1.x < var_94_0.x then
		var_94_4 = arg_94_3 and var_0_10 or var_0_8
		var_94_5 = Vector3(-var_0_5, var_0_5, var_0_5)
	end

	return var_94_4, var_94_5
end

function var_0_0.UpdateUI(arg_95_0)
	setText(arg_95_0.labelLeftCount, arg_95_0.leftCount)
	setText(arg_95_0.registerTxt, arg_95_0.turnCnt - 1)
end

function var_0_0.UpdateActivity(arg_96_0, arg_96_1)
	arg_96_0:UpdateActData(arg_96_1)
	arg_96_0:UpdateUI()
end

function var_0_0.Dispose(arg_97_0)
	for iter_97_0, iter_97_1 in pairs(arg_97_0.cheerLeaders) do
		PoolMgr.GetInstance():ReturnSpineChar(iter_97_0, iter_97_1)
	end

	if arg_97_0.handle then
		UpdateBeat:RemoveListener(arg_97_0.handle)

		arg_97_0.handle = nil
	end

	if arg_97_0.awardWindow then
		arg_97_0.awardWindow:Destroy()

		arg_97_0.awardWindow = nil
	end

	if arg_97_0.pickPage then
		if arg_97_0.pickPage:isShowing() then
			arg_97_0.pickPage:Hide()
		end

		arg_97_0.pickPage:Destroy()

		arg_97_0.pickPage = nil
	end

	if arg_97_0.resultPage then
		arg_97_0.resultPage:Destroy()

		arg_97_0.resultPage = nil
	end

	if arg_97_0.awardCollector then
		arg_97_0.awardCollector:Dispose()

		arg_97_0.awardCollector = nil
	end

	arg_97_0.bubblePage:Dispose()
	pg.DelegateInfo.Dispose(arg_97_0)
	PoolMgr.GetInstance():ReturnSpineChar(var_0_3, arg_97_0.model)
end

return var_0_0
