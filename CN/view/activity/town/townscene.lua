local var_0_0 = class("TownScene", import("view.base.BaseUI"))

var_0_0.RANDOM_POS = {
	{
		x = 111.3,
		y = 150
	},
	{
		x = -235.9,
		y = 113.2
	},
	{
		x = 570,
		y = 424.5
	},
	{
		x = -790.3,
		y = 569.9
	},
	{
		x = -440.7,
		y = -26.8
	},
	{
		x = -1206.2,
		y = 2
	},
	{
		x = -705.8,
		y = -379
	},
	{
		x = -1021.7,
		y = -153.9
	},
	{
		x = -385.6,
		y = -479.7
	},
	{
		x = 367.1,
		y = -749
	},
	{
		x = 107.6,
		y = -684.9
	},
	{
		x = 338.7,
		y = 150
	}
}
var_0_0.SDScale = 0.5

function var_0_0.getUIName(arg_1_0)
	return "TownUI"
end

function var_0_0.SetActivity(arg_2_0, arg_2_1)
	arg_2_0.activity = arg_2_1
	arg_2_0.shipIds = arg_2_0.activity:GetShipIds()
end

function var_0_0.init(arg_3_0)
	arg_3_0.mapTF = arg_3_0:findTF("map")
	arg_3_0.bgTFs = arg_3_0:findTF("map/bg")
	arg_3_0.slotTFs = arg_3_0:findTF("map/content")
	arg_3_0.slotTpl = arg_3_0:findTF("map/content/tpl")

	setActive(arg_3_0.slotTpl, false)

	local var_3_0 = arg_3_0:findTF("ui")

	arg_3_0.topUI = arg_3_0:findTF("top", var_3_0)
	arg_3_0.goldText = arg_3_0:findTF("gold/Text", arg_3_0.topUI):GetComponent(typeof(Text))
	arg_3_0.infoPage = TownInfoPage.New(var_3_0, arg_3_0)

	arg_3_0.infoPage:ExecuteAction("Flush")
end

function var_0_0.didEnter(arg_4_0)
	onButton(arg_4_0, arg_4_0:findTF("back", arg_4_0.topUI), function()
		arg_4_0:onBackPressed()
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0:findTF("help", arg_4_0.topUI), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.town_help.tip
		})
	end, SFX_PANEL)
	onScroll(arg_4_0, arg_4_0.mapTF, function(arg_7_0)
		return
	end)

	arg_4_0.timeCfg = arg_4_0.activity:getConfig("config_client").endingtime
	arg_4_0.spineRoles = {}
	arg_4_0.randomPos = arg_4_0:GetRandomPos()

	arg_4_0:UpdateShips()

	arg_4_0.timer = Timer.New(function()
		arg_4_0:OnUpdateTime()
	end, 1, -1)

	arg_4_0.timer:Start()
	arg_4_0:OnUpdateTime()
	seriesAsync({
		function(arg_9_0)
			local var_9_0 = pg.activity_town_level[arg_4_0.activity:GetTownLevel()].unlock_story

			if var_9_0 ~= "" and not pg.NewStoryMgr.GetInstance():IsPlayed(var_9_0) then
				pg.NewStoryMgr.GetInstance():Play(var_9_0, arg_9_0)
			else
				arg_9_0()
			end
		end,
		function(arg_10_0)
			local var_10_0 = arg_4_0.activity:getConfig("config_client").story[1][1]

			if (function()
				return underscore.all(arg_4_0.activity:getConfig("config_client").beforestory, function(arg_12_0)
					return pg.NewStoryMgr.GetInstance():IsPlayed(arg_12_0[1])
				end)
			end)() and not pg.NewStoryMgr.GetInstance():IsPlayed(var_10_0) then
				pg.NewStoryMgr.GetInstance():Play(var_10_0, arg_10_0)
			else
				arg_10_0()
			end
		end,
		function(arg_13_0)
			if not pg.NewStoryMgr.GetInstance():IsPlayed("NG0046") then
				pg.SystemGuideMgr.GetInstance():PlayByGuideId("NG0046")
			end
		end
	}, function()
		return
	end)
	arg_4_0.activity:SetBubbleTipTag(true)
end

function var_0_0.GetRandomPos(arg_15_0)
	local var_15_0 = {}

	for iter_15_0 = 1, #var_0_0.RANDOM_POS do
		table.insert(var_15_0, iter_15_0)
	end

	shuffle(var_15_0)

	local var_15_1 = {}

	for iter_15_1 = 1, 9 do
		table.insert(var_15_1, var_0_0.RANDOM_POS[var_15_0[iter_15_1]])
	end

	return var_15_1
end

function var_0_0.OnUpdateTime(arg_16_0)
	arg_16_0:UpdateBg()
	arg_16_0:UpdateGold()
	arg_16_0:UpdateBubbles()
	arg_16_0.infoPage:ExecuteAction("OnUpdateTime")
end

function var_0_0.GetBgName(arg_17_0, arg_17_1)
	local var_17_0 = pg.TimeMgr.GetInstance():GetServerHour()

	for iter_17_0, iter_17_1 in ipairs(arg_17_0.timeCfg) do
		local var_17_1 = iter_17_1[1]

		if var_17_0 >= var_17_1[1] and var_17_0 < var_17_1[2] then
			return iter_17_1[2]
		end
	end

	return "day"
end

function var_0_0.UpdateBg(arg_18_0)
	local var_18_0 = arg_18_0:GetBgName()

	eachChild(arg_18_0.bgTFs, function(arg_19_0)
		setActive(arg_19_0, arg_19_0.name == var_18_0)
	end)
end

function var_0_0.UpdateGold(arg_20_0)
	arg_20_0.gold = arg_20_0.activity:GetTotalGold()
	arg_20_0.goldText.text = TownActivity.GoldToShow(arg_20_0.gold)
end

function var_0_0.UpdateBubbles(arg_21_0)
	for iter_21_0, iter_21_1 in ipairs(arg_21_0.shipIds) do
		if iter_21_1 > 0 then
			local var_21_0 = arg_21_0.activity:GetBubbleCntByPos(iter_21_0)
			local var_21_1 = arg_21_0:findTF(iter_21_0 .. "/bubble", arg_21_0.slotTFs)

			setActive(var_21_1, var_21_0 > 0)

			if var_21_0 > 0 then
				eachChild(var_21_1, function(arg_22_0)
					setActive(arg_22_0, tonumber(arg_22_0.name) == var_21_0)
				end)
			end
		end
	end
end

function var_0_0.UpdateShips(arg_23_0)
	arg_23_0:CleanSpines()

	for iter_23_0, iter_23_1 in ipairs(arg_23_0.shipIds) do
		arg_23_0:UpdateShip(iter_23_0, iter_23_1)
	end

	arg_23_0:UpdateBubbles()
end

function var_0_0.UpdateShip(arg_24_0, arg_24_1, arg_24_2)
	local var_24_0 = arg_24_0:findTF(arg_24_1, arg_24_0.slotTFs)

	if var_24_0 then
		setActive(var_24_0, false)
	end

	local var_24_1 = arg_24_2 > 0 and getProxy(BayProxy):RawGetShipById(arg_24_2)

	if not var_24_1 then
		return
	end

	var_24_0 = var_24_0 or cloneTplTo(arg_24_0.slotTpl, arg_24_0.slotTFs, arg_24_1)

	setAnchoredPosition(var_24_0, arg_24_0.randomPos[arg_24_1])
	onButton(arg_24_0, arg_24_0:findTF("bubble", var_24_0), function()
		if arg_24_0.activity:HasMaxGold() then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("town_gold_tip"),
				onYes = function()
					arg_24_0:emit(TownMediator.CLICK_BUBBLE, arg_24_1)
				end
			})
		else
			arg_24_0:emit(TownMediator.CLICK_BUBBLE, arg_24_1)
		end
	end, SFX_PANEL)

	local var_24_2 = SpineRole.New()

	var_24_2:SetData(var_24_1:getPrefab())
	var_24_2:Load(function()
		local var_27_0 = var_24_2.modelRoot

		var_27_0.name = "model"
		var_27_0.transform.localScale = Vector2.New(var_0_0.SDScale, var_0_0.SDScale)
		rtf(var_27_0).sizeDelta = Vector2.New(200, 500)

		SetParent(var_27_0, var_24_0)
		var_24_2:SetAction("stand")
		var_27_0.transform:SetAsFirstSibling()
		setActive(var_24_0, true)
	end, true)

	arg_24_0.spineRoles[arg_24_1] = var_24_2
end

function var_0_0.CleanSpines(arg_28_0)
	table.Foreach(arg_28_0.spineRoles, function(arg_29_0, arg_29_1)
		arg_29_1:Dispose()
	end)

	arg_28_0.spineRoles = {}
end

function var_0_0.UpdateInfoPage(arg_30_0)
	arg_30_0.infoPage:ExecuteAction("SetActivity", arg_30_0.activity)
	arg_30_0.infoPage:ExecuteAction("Flush")
end

function var_0_0.OnExpUpdate(arg_31_0)
	arg_31_0.infoPage:ExecuteAction("SetActivity", arg_31_0.activity)
	arg_31_0.infoPage:ExecuteAction("OnExpUpdate")
end

function var_0_0.OnTownUpgrade(arg_32_0)
	arg_32_0.infoPage:ExecuteAction("OnTownUpgrade")
end

function var_0_0.willExit(arg_33_0)
	arg_33_0.infoPage:Destroy()

	arg_33_0.infoPage = nil

	if arg_33_0.timer then
		arg_33_0.timer:Stop()

		arg_33_0.timer = nil
	end

	arg_33_0:CleanSpines()
end

function var_0_0.ShowEntranceTip(arg_34_0)
	local var_34_0 = arg_34_0 or getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_TOWN)

	if not var_34_0 or var_34_0:isEnd() then
		return false
	end

	return var_0_0.ShowMainTip(var_34_0) or var_34_0:ShowBubbleTip()
end

function var_0_0.ShowMainTip(arg_35_0)
	local var_35_0 = arg_35_0 or getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_TOWN)

	if not var_35_0 or var_35_0:isEnd() then
		return false
	end

	return var_35_0:CanCostGold() or var_35_0:HasEmptySlot()
end

return var_0_0
