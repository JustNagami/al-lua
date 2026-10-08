local var_0_0 = class("StarLightMedalAlbumView", import("view.base.BaseUI"))

var_0_0.ICON_SCALE = 1.35
var_0_0.MEDAL_COUNT = 8

local function var_0_1(arg_1_0)
	local var_1_0 = pg.activity_template[arg_1_0.id].config_data

	return _.any(var_1_0, function(arg_2_0)
		return Task.New({
			id = arg_2_0
		}):HasActMedalAward()
	end)
end

local function var_0_2()
	local var_3_0 = getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_TASKS)

	for iter_3_0, iter_3_1 in ipairs(var_3_0) do
		if var_0_1(iter_3_1) then
			return iter_3_1
		end
	end

	return nil
end

function var_0_0.GetHelpTips(arg_4_0)
	local var_4_0 = var_0_2()

	if not var_4_0 then
		return ""
	end

	local var_4_1 = var_4_0:GetActivityTimeStr()
	local var_4_2 = string.split(var_4_1, "-")
	local var_4_3 = pg.gametip.help_starLightAlbum.tip

	_.each(var_4_3, function(arg_5_0)
		arg_5_0.info = string.gsub(arg_5_0.info, "$1", var_4_2[2])
	end)

	return var_4_3
end

function var_0_0.SetMedalGroupData(arg_6_0, arg_6_1)
	arg_6_0.medalGroupList = arg_6_1
	arg_6_0.currentMedalGroup = arg_6_0.medalGroupList[arg_6_0.GROUP_ID] or ActivityMedalGroup.New(arg_6_0.GROUP_ID)

	if arg_6_0.currentMedalGroup:GetMedalGroupState() == ActivityMedalGroup.STATE_ACTIVE then
		arg_6_0.medalTaskView:SetMedalGroup(arg_6_0.currentMedalGroup)
	end

	arg_6_0.medalDetailView:SetMedalGroup(arg_6_0.currentMedalGroup)

	local var_6_0 = arg_6_0.currentMedalGroup:GetMedalIds()

	for iter_6_0 = 1, arg_6_0.MEDAL_COUNT do
		local var_6_1 = var_6_0[iter_6_0]

		LoadImageSpriteAsync("activitymedal/" .. var_6_1 .. "_l", arg_6_0.slots[iter_6_0].slot, true)
		LoadImageSpriteAsync("activitymedal/" .. var_6_1, arg_6_0.slots[iter_6_0].active, true)
	end
end

function var_0_0.ShowPageBtn(arg_7_0, arg_7_1)
	setActive(arg_7_0.prevBtn, false)
	setActive(arg_7_0.nextBtn, false)
end

function var_0_0.UpdateMedalList(arg_8_0)
	return
end

function var_0_0.init(arg_9_0)
	arg_9_0:FindUI()

	arg_9_0.loader = AutoLoader.New()
end

function var_0_0.FindUI(arg_10_0)
	local var_10_0 = arg_10_0._tf:Find("Top")

	arg_10_0.bg = arg_10_0._tf:Find("mask")
	arg_10_0.backBtn = var_10_0:Find("BackBtn")
	arg_10_0.helpBtn = var_10_0:Find("InfoBtn")
	arg_10_0.taskBtn = arg_10_0._tf:Find("Desk/taskBtn")
	arg_10_0.prevBtn = arg_10_0._tf:Find("Desk/prevBtn")
	arg_10_0.nextBtn = arg_10_0._tf:Find("Desk/nextBtn")
	arg_10_0.slots = {}

	for iter_10_0 = 1, arg_10_0.MEDAL_COUNT do
		arg_10_0.slots[iter_10_0] = {
			slot = arg_10_0._tf:Find("Desk/Slot" .. iter_10_0),
			active = arg_10_0._tf:Find("Desk/Slot" .. iter_10_0 .. "/active"),
			tips = arg_10_0._tf:Find("Desk/Slot" .. iter_10_0 .. "/reddot"),
			click = arg_10_0._tf:Find("Desk/Slot" .. iter_10_0 .. "/Click")
		}
	end

	arg_10_0.medalLock = arg_10_0._tf:Find("Desk/medal")
	arg_10_0.trophyLock = arg_10_0._tf:Find("Desk/trophy")
	arg_10_0.medalDetailView = MedalDetailPanel.New(arg_10_0._tf:Find("DetailView"), arg_10_0)

	arg_10_0.medalDetailView:SetIconScale(arg_10_0.ICON_SCALE)

	arg_10_0.medalTaskView = MedalTaskPanel.New(arg_10_0._tf:Find("TaskView"), arg_10_0)
end

function var_0_0.didEnter(arg_11_0)
	var_0_0.super.didEnter(arg_11_0)
	arg_11_0:AddListener()
	arg_11_0:UpdateView()
	pg.UIMgr.GetInstance():BlurPanel(arg_11_0._tf)
end

function var_0_0.AddListener(arg_12_0)
	onButton(arg_12_0, arg_12_0.backBtn, function()
		arg_12_0:closeView()
	end, SFX_CANCEL)

	for iter_12_0 = 1, arg_12_0.MEDAL_COUNT do
		onButton(arg_12_0, arg_12_0.slots[iter_12_0].click, function()
			arg_12_0:showMedalView(iter_12_0)
		end)
	end

	onButton(arg_12_0, arg_12_0.taskBtn, function()
		arg_12_0:showTaskView()
	end)
	onButton(arg_12_0, arg_12_0.bg, function()
		arg_12_0:closeView()
	end, SFX_PANEL)
	onButton(arg_12_0, arg_12_0.helpBtn, function()
		local var_17_0 = arg_12_0:GetHelpTips()

		if not var_17_0 or var_17_0 == "" then
			return
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = var_17_0
		})
	end)
	onButton(arg_12_0, arg_12_0.medalLock, function()
		local var_18_0 = arg_12_0.currentMedalGroup:getConfig("item_show")[2]
		local var_18_1 = {
			type = var_18_0[1],
			id = var_18_0[2],
			count = var_18_0[3]
		}

		arg_12_0:emit(BaseUI.ON_DROP, var_18_1)
	end, SFX_PANEL)

	if arg_12_0.trophyLock then
		onButton(arg_12_0, arg_12_0.trophyLock, function()
			local var_19_0 = arg_12_0.currentMedalGroup:getConfig("item_show")[1]
			local var_19_1 = {
				type = var_19_0[1],
				id = var_19_0[2],
				count = var_19_0[3]
			}

			arg_12_0:emit(BaseUI.ON_DROP, var_19_1)
		end, SFX_PANEL)
	end
end

function var_0_0.showMedalView(arg_20_0, arg_20_1)
	arg_20_0.medalDetailView:SetCurrentIndex(arg_20_1)
	arg_20_0.medalDetailView:UpdateMedal()
	arg_20_0.medalDetailView:SetActive(true)
end

function var_0_0.showTaskView(arg_21_0)
	arg_21_0.medalTaskView:ShowMedalTask()
	arg_21_0.medalTaskView:SetActive(true)
end

function var_0_0.UpdateView(arg_22_0)
	local var_22_0 = arg_22_0.currentMedalGroup:GetMedalIds()
	local var_22_1 = arg_22_0.currentMedalGroup:GetMedalList()

	for iter_22_0 = 1, arg_22_0.MEDAL_COUNT do
		local var_22_2 = var_22_0[iter_22_0]
		local var_22_3 = arg_22_0.slots[iter_22_0]

		if var_22_1[var_22_2].timeStamp then
			setActive(var_22_3.active, true)
		else
			setActive(var_22_3.active, false)
		end
	end

	if arg_22_0.trophyLock then
		arg_22_0.trophyLock:GetComponent(typeof(Image)).enabled = not arg_22_0:OwnTrophy()
	end

	arg_22_0.medalLock:GetComponent(typeof(Image)).enabled = not arg_22_0:OwnMedal()

	setActive(arg_22_0.taskBtn, arg_22_0.currentMedalGroup:GetMedalGroupState() == ActivityMedalGroup.STATE_ACTIVE)
end

function var_0_0.OwnTrophy(arg_23_0)
	local var_23_0 = arg_23_0.currentMedalGroup:getConfig("task_show")
	local var_23_1 = -1

	if var_23_0 and type(var_23_0) == "table" then
		var_23_1 = var_23_0[1]
	end

	if var_23_1 <= 0 then
		return false
	end

	local var_23_2 = pg.task_data_template[var_23_1].award_display[1]

	return Task.OwnSpAward(var_23_2)
end

function var_0_0.OwnMedal(arg_24_0)
	local var_24_0 = arg_24_0.currentMedalGroup:getConfig("task_show")
	local var_24_1 = -1

	if var_24_0 and type(var_24_0) == "table" then
		var_24_1 = var_24_0[2]
	end

	if var_24_1 <= 0 then
		return false
	end

	local var_24_2 = pg.task_data_template[var_24_1].award_display
	local var_24_3 = var_24_2[#var_24_2]

	return Task.OwnSpAward(var_24_3)
end

function var_0_0.FlushTaskPanel(arg_25_0)
	arg_25_0.medalTaskView:SetMedalGroup(arg_25_0.currentMedalGroup)
	arg_25_0.medalTaskView:ShowMedalTask()
end

function var_0_0.willExit(arg_26_0)
	arg_26_0.medalDetailView:SetActive(false)
	arg_26_0.medalTaskView:SetActive(false)
	arg_26_0.medalDetailView:Dispose()
	arg_26_0.medalTaskView:Dispose()
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_26_0._tf)
	arg_26_0.loader:Clear()
end

return var_0_0
