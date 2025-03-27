local var_0_0 = class("ClueBuffSelectLayer", import("view.base.BaseUI"))

var_0_0.SP_STRA_MIN_RANGE = 201308
var_0_0.SP_STRA_MAX_RANGE = 201320
var_0_0.SP_STRATEGY_ID = 201321
var_0_0.BOOST_ITEM_ID = 65562
var_0_0.PLYAER_PREF_KEY = "ClueBuffSelectedBySingleEnemyID_"

function var_0_0.getUIName(arg_1_0)
	return "ClueBuffSelectUI"
end

function var_0_0.init(arg_2_0)
	arg_2_0.closeBtn = arg_2_0:findTF("Top/BackBtn")

	onButton(arg_2_0, arg_2_0.closeBtn, function()
		arg_2_0:emit(var_0_0.ON_BACK_PRESSED)
	end)
	onButton(arg_2_0, arg_2_0:findTF("mask"), function()
		arg_2_0:emit(var_0_0.ON_BACK_PRESSED)
	end)

	arg_2_0.buffContainer = arg_2_0:findTF("Buff/buff_list")
	arg_2_0.buffTmp = arg_2_0.buffContainer:Find("buff")
	arg_2_0.buffTFs = {}
	arg_2_0.strategyList = {}
	arg_2_0.buffDescList = {}

	for iter_2_0 = 1, 4 do
		local var_2_0 = arg_2_0:findTF("Buff/buff_desc_list/buff_desc_" .. iter_2_0)

		table.insert(arg_2_0.buffDescList, var_2_0)
		setText(var_2_0:Find("unselect"), i18n("clue_buff_unselect"))
	end

	arg_2_0.stageName = arg_2_0:findTF("Stage/stage_name_text")
	arg_2_0.stageLV = arg_2_0:findTF("Stage/stage_level_text")

	setText(arg_2_0:findTF("Stage/text_stage_reserach"), i18n("clue_buff_research"))
	setText(arg_2_0:findTF("Stage/text_stage_loot"), i18n("clue_buff_stage_loot"))

	arg_2_0.awards = arg_2_0:findTF("Loot/awards")
	arg_2_0.awardTpl = arg_2_0:findTF("Loot/awards/award")
	arg_2_0.goBtn = arg_2_0:findTF("Combat/go_btn")

	onButton(arg_2_0, arg_2_0.goBtn, function()
		arg_2_0:emit(ClueBuffSelectMediator.ON_FLEET_SELECT, arg_2_0.singleID)
	end)

	arg_2_0.detailView = arg_2_0:findTF("Detail")
	arg_2_0.detailBtn = arg_2_0:findTF("BuffDetail")

	setActive(arg_2_0.detailBtn, false)

	arg_2_0.detailList = UIItemList.New(arg_2_0.detailView:Find("panel/list"), arg_2_0.detailView:Find("panel/list/item"))

	onButton(arg_2_0, arg_2_0.detailBtn, function()
		arg_2_0:openDetailView()
	end)

	arg_2_0.detailClose = arg_2_0.detailView:Find("btnBack")

	onButton(arg_2_0, arg_2_0.detailClose, function()
		arg_2_0:closeDetailView()
	end)
	onButton(arg_2_0, arg_2_0.detailView:Find("mask"), function()
		arg_2_0:closeDetailView()
	end)

	arg_2_0.ticket = arg_2_0:findTF("Ticket")
	arg_2_0.ticketTips = arg_2_0:findTF("ticketTips")
	arg_2_0.ticketCheckBox = arg_2_0.ticket:Find("checkbox")
	arg_2_0.useTicket = false

	onButton(arg_2_0, arg_2_0.ticket:Find("bg"), function()
		arg_2_0:UpdateTicket()
	end)
	setText(arg_2_0.ticketTips, i18n("clue_buff_ticket_tips"))

	arg_2_0.explore = arg_2_0:findTF("exploreTarget")

	setActive(arg_2_0.explore, true)
	BossSingleBattleFleetSelectViewComponent.AttachFleetSelect(arg_2_0, ClueBuffSelectMediator)
	pg.UIMgr.GetInstance():BlurPanel(arg_2_0._tf)
end

function var_0_0.didEnter(arg_10_0)
	arg_10_0:updateBuffView()
	arg_10_0:UpdateCluePanel()

	arg_10_0.contextData.selectedBuffList = {}

	for iter_10_0, iter_10_1 in ipairs(arg_10_0.preSelectedBuffList) do
		arg_10_0:selectBuff(iter_10_1)
	end

	if arg_10_0.contextData.editFleet then
		arg_10_0:ShowNormalFleet(arg_10_0.singleID)
	end
end

function var_0_0.show(arg_11_0)
	setActive(arg_11_0._tf, true)
	pg.UIMgr.GetInstance():BlurPanel(arg_11_0._tf)
end

function var_0_0.hide(arg_12_0)
	setActive(arg_12_0._tf, false)
	pg.UIMgr.GetInstance():UnblurPanel(arg_12_0._tf, arg_12_0._parentTf)
end

function var_0_0.openDetailView(arg_13_0)
	setActive(arg_13_0.detailView, true)
	arg_13_0:updateDetailView()
end

function var_0_0.closeDetailView(arg_14_0)
	setActive(arg_14_0.detailView, false)
end

function var_0_0.updateBuffView(arg_15_0)
	local var_15_0 = pg.activity_single_enemy[arg_15_0.singleID]
	local var_15_1 = var_15_0.strategy_id

	for iter_15_0, iter_15_1 in ipairs(var_15_1) do
		if not table.contains(arg_15_0.strategyList, iter_15_1) then
			setActive(arg_15_0.buffTFs[iter_15_1]:Find("selected"), false)
		end
	end

	local var_15_2 = pg.strategy_data_template

	for iter_15_2, iter_15_3 in ipairs(arg_15_0.buffDescList) do
		local var_15_3 = iter_15_3:Find("mask/desc")
		local var_15_4 = var_15_3:GetComponent("RectTransform")

		if iter_15_2 > var_15_0.strategy_num then
			iter_15_3:Find("bg"):GetComponent(typeof(CanvasGroup)).alpha = 0.05

			setActive(iter_15_3:Find("lock"), true)
			setActive(var_15_3, false)
			setActive(iter_15_3:Find("over_deco"), false)
			setActive(iter_15_3:Find("unselect"), false)
		else
			setActive(iter_15_3:Find("lock"), false)

			if arg_15_0.strategyList[iter_15_2] then
				setActive(var_15_3, true)

				local var_15_5 = var_15_2[arg_15_0.strategyList[iter_15_2]]

				iter_15_3:Find("bg"):GetComponent(typeof(CanvasGroup)).alpha = 1

				setText(var_15_3:Find("index"), iter_15_2)
				setText(var_15_3:Find("name"), var_15_5.name)
				setText(var_15_3:Find("desc"), var_15_5.desc)
				setActive(iter_15_3:Find("lock"), false)
				setActive(iter_15_3:Find("unselect"), false)
				Canvas.ForceUpdateCanvases()
				setActive(iter_15_3:Find("over_deco"), var_15_4.rect.width > 560)
			else
				setActive(var_15_3, false)

				iter_15_3:Find("bg"):GetComponent(typeof(CanvasGroup)).alpha = 0.2

				setActive(iter_15_3:Find("unselect"), true)
				setActive(iter_15_3:Find("lock"), false)
				setActive(iter_15_3:Find("over_deco"), false)
			end
		end
	end

	for iter_15_4, iter_15_5 in pairs(arg_15_0.buffTFs) do
		if table.contains(arg_15_0.strategyList, iter_15_4) then
			setActive(iter_15_5:Find("selected"), true)

			local var_15_6 = table.indexof(arg_15_0.strategyList, iter_15_4)

			setImageSprite(iter_15_5:Find("selected/counter"), LoadSprite("ui/cluebuffselectui_atlas", "buff_n_" .. var_15_6), true)
		else
			setActive(iter_15_5:Find("selected"), false)
		end
	end

	setActive(arg_15_0.detailBtn, #arg_15_0.strategyList > 0)

	if arg_15_0.ptAwardTF then
		setActive(arg_15_0.ptAwardTF:Find("boost"), #arg_15_0.strategyList > 0)
		setText(arg_15_0.ptAwardTF:Find("boost/boost"), "+" .. 5 * #arg_15_0.strategyList .. "%")
	end

	local var_15_7 = table.concat({
		unpack(arg_15_0.strategyList)
	}, "|")

	PlayerPrefs.SetString(var_0_0.PLYAER_PREF_KEY .. arg_15_0.singleID, var_15_7)
	setText(arg_15_0:findTF("Stage/text_stage_buff_count"), "(" .. #arg_15_0.strategyList .. "/" .. var_15_0.strategy_num .. ")")
end

function var_0_0.UpdateCluePanel(arg_16_0)
	local var_16_0 = ActivityConst.Valleyhospital_ACT_ID
	local var_16_1 = getProxy(PlayerProxy):getRawData().id
	local var_16_2 = PlayerPrefs.GetInt("investigatingGroupId_" .. var_16_0 .. "_" .. var_16_1, 0)
	local var_16_3 = true
	local var_16_4
	local var_16_5 = 0
	local var_16_6 = pg.activity_clue

	if var_16_2 ~= 0 then
		local var_16_7 = var_16_6.get_id_list_by_group[var_16_2]

		var_16_4 = {
			var_16_6[var_16_7[1]],
			var_16_6[var_16_7[2]],
			var_16_6[var_16_7[3]]
		}
		var_16_5 = getProxy(TaskProxy):getTaskVO(tonumber(var_16_4[3].task_id)):getProgress()

		for iter_16_0 = 1, 3 do
			if not getProxy(TaskProxy):getFinishTaskById(tonumber(var_16_4[iter_16_0].task_id)) then
				var_16_3 = false

				break
			end
		end
	end

	if var_16_3 then
		setText(arg_16_0:findTF("target/Text", arg_16_0.explore), i18n("clue_unselect_tip"))
	else
		setText(arg_16_0:findTF("target/Text", arg_16_0.explore), var_16_4[1].unlock_desc .. var_16_4[1].unlock_num .. "/" .. var_16_4[2].unlock_num .. "/" .. var_16_4[3].unlock_num .. i18n("clue_task_tip", var_16_5))
	end
end

function var_0_0.updateDetailView(arg_17_0)
	local var_17_0 = pg.activity_single_enemy[arg_17_0.singleID]
	local var_17_1 = {}

	for iter_17_0, iter_17_1 in ipairs(arg_17_0.strategyList) do
		table.insert(var_17_1, iter_17_1)
	end

	for iter_17_2, iter_17_3 in ipairs(arg_17_0.strategyList) do
		if iter_17_3 >= var_0_0.SP_STRA_MIN_RANGE and iter_17_3 <= var_0_0.SP_STRA_MAX_RANGE then
			table.insert(var_17_1, var_0_0.SP_STRATEGY_ID)

			break
		end
	end

	local var_17_2 = pg.strategy_data_template

	arg_17_0.detailList:make(function(arg_18_0, arg_18_1, arg_18_2)
		if arg_18_0 == UIItemList.EventUpdate then
			local var_18_0 = var_17_1[arg_18_1 + 1]
			local var_18_1 = var_17_2[var_18_0]

			GetImageSpriteFromAtlasAsync("strategyicon/" .. var_18_1.icon, "", arg_18_2:Find("icon"))
			setText(arg_18_2:Find("textBG/name"), var_18_1.name)
			setText(arg_18_2:Find("textBG/desc"), var_18_1.desc)
		end
	end)
	arg_17_0.detailList:align(#var_17_1)
end

function var_0_0.SetStageID(arg_19_0, arg_19_1)
	arg_19_0.singleID = arg_19_1

	local var_19_0 = pg.activity_single_enemy[arg_19_0.singleID]
	local var_19_1 = pg.strategy_data_template

	setText(arg_19_0.stageName, var_19_0.name)
	setText(arg_19_0.stageLV, var_19_0.level)
	setText(arg_19_0:findTF("Stage/text_stage_PTBoost"), i18n("clue_buff_pt_boost", var_19_0.strategy_num))

	local var_19_2 = var_19_0.strategy_id

	for iter_19_0, iter_19_1 in ipairs(var_19_2) do
		local var_19_3 = cloneTplTo(arg_19_0.buffTmp, arg_19_0.buffContainer)

		setActive(var_19_3, true)

		local var_19_4 = var_19_1[iter_19_1]

		GetImageSpriteFromAtlasAsync("strategyicon/" .. var_19_4.icon, "", var_19_3:Find("icon"))
		setActive(var_19_3:Find("selected"), false)
		onButton(arg_19_0, var_19_3, function()
			arg_19_0:onStrategyClick(iter_19_1)
		end)

		arg_19_0.buffTFs[iter_19_1] = var_19_3
	end

	setImageSprite(arg_19_0:findTF("Stage/stage_icon"), LoadSprite("ui/cluebuffselectui_atlas", var_19_0.icon), true)

	if var_19_0.type >= BossSingleVariableEnemyData.TYPE.SP then
		setActive(arg_19_0:findTF("Stage/stage_type_icon"), false)
		setActive(arg_19_0.ticket, true)
		setActive(arg_19_0.ticketTips, true)
		GetImageSpriteFromAtlasAsync(pg.item_virtual_data_statistics[var_19_0.enter_cost].icon, "", arg_19_0.ticket:Find("icon"), true)

		local var_19_5 = getProxy(ActivityProxy):getActivityById(ActivityConst.Valleyhospital_ACT_ID)

		setText(arg_19_0.ticket:Find("count"), var_19_5.data1)
	else
		setActive(arg_19_0:findTF("Stage/stage_type_icon"), true)
		setActive(arg_19_0.ticket, false)
		setActive(arg_19_0.ticketTips, false)
		setImageSprite(arg_19_0:findTF("Stage/stage_type_icon"), LoadSprite("ui/cluebuffselectui_atlas", "tier_" .. var_19_0.type), true)

		arg_19_0.useTicket = false

		setActive(arg_19_0.ticketCheckBox, arg_19_0.useTicket)

		arg_19_0.contextData.useTicket = arg_19_0.useTicket
	end

	local var_19_6 = pg.expedition_data_template[var_19_0.expedition_id].award_display

	arg_19_0:updateAwards(var_19_6, arg_19_0.awards, arg_19_0.awardTpl)
end

function var_0_0.UpdateTicket(arg_21_0)
	if getProxy(ActivityProxy):getActivityById(ActivityConst.Valleyhospital_ACT_ID).data1 <= 0 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("clue_buff_empty_ticket"))
	else
		arg_21_0.useTicket = not arg_21_0.useTicket

		setActive(arg_21_0.ticketCheckBox, arg_21_0.useTicket)

		arg_21_0.contextData.useTicket = arg_21_0.useTicket
	end
end

function var_0_0.SetPreSelectedBuff(arg_22_0, arg_22_1)
	arg_22_0.preSelectedBuffList = {}

	for iter_22_0, iter_22_1 in ipairs(arg_22_1) do
		table.insert(arg_22_0.preSelectedBuffList, iter_22_1)
	end
end

function var_0_0.onStrategyClick(arg_23_0, arg_23_1)
	for iter_23_0, iter_23_1 in ipairs(arg_23_0.strategyList) do
		if iter_23_1 == arg_23_1 then
			table.remove(arg_23_0.strategyList, iter_23_0)
			table.remove(arg_23_0.contextData.selectedBuffList, iter_23_0)
			arg_23_0:updateBuffView()

			return
		end
	end

	arg_23_0:selectBuff(arg_23_1)
end

function var_0_0.selectBuff(arg_24_0, arg_24_1)
	local var_24_0 = pg.activity_single_enemy[arg_24_0.singleID]

	if #arg_24_0.strategyList >= var_24_0.strategy_num then
		pg.TipsMgr.GetInstance():ShowTips(i18n("clue_buff_reach_max"))

		return
	end

	table.insert(arg_24_0.strategyList, arg_24_1)
	table.insert(arg_24_0.contextData.selectedBuffList, arg_24_1)
	arg_24_0:updateBuffView()
end

function var_0_0.updateAwards(arg_25_0, arg_25_1, arg_25_2, arg_25_3)
	for iter_25_0 = 1, #arg_25_1 do
		local var_25_0 = cloneTplTo(arg_25_3, arg_25_2)
		local var_25_1 = arg_25_1[iter_25_0]
		local var_25_2 = {
			type = var_25_1[1],
			id = var_25_1[2],
			count = var_25_1[3]
		}

		if var_25_1[2] == var_0_0.BOOST_ITEM_ID then
			arg_25_0.ptAwardTF = var_25_0
		end

		updateDrop(findTF(var_25_0, "mask"), var_25_2)
		onButton(arg_25_0, var_25_0, function()
			local var_26_0 = Item.getConfigData(var_25_1[2])
			local var_26_1 = {
				[99] = true
			}

			if var_26_0 and var_26_1[var_26_0.type] then
				local var_26_2 = var_26_0.display_icon
				local var_26_3 = {}

				for iter_26_0, iter_26_1 in ipairs(var_26_2) do
					local var_26_4 = iter_26_1[1]
					local var_26_5 = iter_26_1[2]

					var_26_3[#var_26_3 + 1] = {
						hideName = true,
						type = var_26_4,
						id = var_26_5
					}
				end

				arg_25_0:emit(var_0_0.ON_DROP_LIST, {
					item2Row = true,
					itemList = var_26_3,
					content = var_26_0.display
				})
			else
				arg_25_0:emit(BaseUI.ON_DROP, var_25_2)
			end
		end, SFX_PANEL)
	end
end

function var_0_0.willExit(arg_27_0)
	pg.UIMgr.GetInstance():UnblurPanel(arg_27_0._tf, arg_27_0._parentTf)
end

function var_0_0.onBackPressed(arg_28_0)
	if isActive(arg_28_0.detailView) then
		arg_28_0:closeDetailView()
	else
		arg_28_0:closeView()
	end
end

return var_0_0
