local var_0_0 = class("UrExchangeTemplatePage", import("view.base.BaseActivityPage"))

var_0_0.SP_FIRST = 1
var_0_0.SP_DAILY = 2
var_0_0.RANDOM_DAILY = 3
var_0_0.CHALLANGE = 4
var_0_0.MINI_GAME = 5
var_0_0.SHOP_BUY = 6

function var_0_0.OnInit(arg_1_0)
	arg_1_0.shopProxy = getProxy(ShopsProxy)
	arg_1_0.playerProxy = getProxy(PlayerProxy)
	arg_1_0.taskProxy = getProxy(TaskProxy)
	arg_1_0.shopProxy = getProxy(ShopsProxy)
	arg_1_0._tasksTF = arg_1_0:findTF("AD/tasks")
	arg_1_0._taskTpl = arg_1_0:findTF("AD/task_tpl")
	arg_1_0._ptTip = arg_1_0:findTF("pt_tip")
	arg_1_0._tipText = arg_1_0:findTF("bg/Text", arg_1_0._ptTip)
	arg_1_0._btnSimulate = arg_1_0:findTF("AD/btn_simulate")
	arg_1_0._btnExchange = arg_1_0:findTF("AD/btn_exchange")
	arg_1_0._btnHelp = arg_1_0:findTF("AD/btn_help")
	arg_1_0._ptText = arg_1_0:findTF("AD/icon/pt")
	arg_1_0._resText = arg_1_0:findTF("AD/icon/text")
	arg_1_0.uilist = UIItemList.New(arg_1_0._tasksTF, arg_1_0._taskTpl)

	setActive(arg_1_0._taskTpl, false)
end

function var_0_0.OnDataSetting(arg_2_0)
	arg_2_0.config = arg_2_0.activity:getConfig("config_client")
	arg_2_0.taskConfig = arg_2_0.config.taskConfig
	arg_2_0.ptId = arg_2_0.config.ptId
	arg_2_0.uPtId = arg_2_0.config.uPtId
	arg_2_0.goodsId = arg_2_0.config.goodsId
	arg_2_0.shopId = arg_2_0.config.shopId
	arg_2_0.length = #arg_2_0.goodsId + 1
	arg_2_0.actShop = arg_2_0.shopProxy:getActivityShopById(arg_2_0.shopId)
end

function var_0_0.OnFirstFlush(arg_3_0)
	setText(arg_3_0._tipText, i18n("UrExchange_Pt_NotEnough"))

	local var_3_0 = getProxy(ActivityProxy):getActivityById(arg_3_0.config.activitytime)

	arg_3_0.isLinkActOpen = var_3_0 and not var_3_0:isEnd()

	setActive(arg_3_0._tasksTF, arg_3_0.isLinkActOpen)
	arg_3_0.uilist:make(function(arg_4_0, arg_4_1, arg_4_2)
		if arg_4_0 == UIItemList.EventUpdate then
			arg_3_0:UpdateTask(arg_4_1, arg_4_2)
		end
	end)
	onButton(arg_3_0, arg_3_0._btnSimulate, function()
		if arg_3_0.config.expedition == 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("tech_simulate_closed"))
		else
			local var_5_0 = i18n("blueprint_simulation_confirm")

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = var_5_0,
				onYes = function()
					arg_3_0:emit(ActivityMediator.ON_SIMULATION_COMBAT, {
						warnMsg = "tech_simulate_quit",
						stageId = arg_3_0.config.expedition
					}, function()
						return
					end, SFX_PANEL)
				end
			})
		end
	end, SFX_CONFIRM)
	onButton(arg_3_0, arg_3_0._btnExchange, function()
		if arg_3_0.canExchange then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				yesText = "text_exchange",
				type = MSGBOX_TYPE_SINGLE_ITEM,
				drop = Drop.Create({
					arg_3_0.curGoods.commodity_type,
					arg_3_0.curGoods.commodity_id,
					1
				}),
				onYes = function()
					arg_3_0:emit(ActivityMediator.ON_ACT_SHOPPING, arg_3_0.shopId, 1, arg_3_0.curGoods.id, 1)
				end
			})
		else
			setActive(arg_3_0._ptTip, true)

			arg_3_0.leantween = LeanTween.delayedCall(1, System.Action(function()
				setActive(arg_3_0._ptTip, false)
			end)).uniqueId
		end
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0._btnHelp, function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("UrExchange_Pt_help")
		})
	end, SFX_PANEL)
end

function var_0_0.CheckSingleTask(arg_12_0)
	local var_12_0 = getProxy(TaskProxy)
	local var_12_1 = var_12_0:getTaskById(arg_12_0) or var_12_0:getFinishTaskById(arg_12_0)

	return var_12_1 and var_12_1:getTaskStatus() or -1
end

var_0_0.taskTypeDic = {
	[var_0_0.SP_FIRST] = function(arg_13_0, arg_13_1)
		local var_13_0 = var_0_0.CheckSingleTask(arg_13_1[1]) == 2 and 1 or 0
		local var_13_1 = var_13_0 .. "/1"

		local function var_13_2()
			arg_13_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.TASK, {
				page = TaskScene.PAGE_TYPE_ACT,
				targetId = arg_13_1[1]
			})
		end

		return var_13_1, var_13_0 ~= 1 and var_13_2 or nil
	end,
	[var_0_0.SP_DAILY] = function(arg_15_0, arg_15_1)
		local function var_15_0()
			arg_15_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.LEVEL, {
				mapIdx = pg.chapter_template[arg_15_1[1]].map
			})
		end

		local var_15_1 = getProxy(ChapterProxy):getChapterById(arg_15_1[1])
		local var_15_2 = var_15_1:isUnlock() and var_15_1:isPlayerLVUnlock() and not var_15_1:enoughTimes2Start()

		return var_15_2 and "1/1" or "0/1", not var_15_2 and var_15_0 or nil
	end,
	[var_0_0.RANDOM_DAILY] = function(arg_17_0, arg_17_1)
		local var_17_0

		local function var_17_1()
			arg_17_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.TASK, {
				page = TaskScene.PAGE_TYPE_ACT,
				targetId = var_17_0
			})
		end

		local var_17_2 = 0
		local var_17_3 = 0

		for iter_17_0, iter_17_1 in pairs(arg_17_1) do
			local var_17_4 = var_0_0.CheckSingleTask(iter_17_1)

			if var_17_4 == 2 then
				var_17_3 = var_17_3 + 1
			elseif var_17_4 == 1 or var_17_4 == 0 then
				var_17_2 = var_17_2 + 1
				var_17_0 = iter_17_1
			end
		end

		local var_17_5 = var_17_2 + var_17_3

		return var_17_3 .. "/" .. var_17_5, var_17_2 ~= 0 and var_17_1 or nil
	end,
	[var_0_0.CHALLANGE] = function(arg_19_0, arg_19_1)
		local var_19_0 = 0
		local var_19_1

		for iter_19_0, iter_19_1 in pairs(arg_19_1) do
			local var_19_2 = var_0_0.CheckSingleTask(iter_19_1) == 2 and 1 or 0

			var_19_0 = var_19_0 + var_19_2

			if var_19_2 == 0 then
				var_19_1 = var_19_1 or iter_19_1
			end
		end

		local var_19_3 = var_19_0 .. "/" .. #arg_19_1

		local function var_19_4()
			arg_19_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.TASK, {
				page = TaskScene.PAGE_TYPE_ACT,
				targetId = var_19_1
			})
		end

		return var_19_3, var_19_0 ~= #arg_19_1 and var_19_4 or nil
	end,
	[var_0_0.MINI_GAME] = function(arg_21_0, arg_21_1)
		local var_21_0 = arg_21_1[1]
		local var_21_1 = getProxy(MiniGameProxy):GetHubByGameId(var_21_0).count == 0

		local function var_21_2()
			arg_21_0:emit(ActivityMediator.GO_MINI_GAME, var_21_0)
		end

		return var_21_1 and "1/1" or "0/1", not var_21_1 and var_21_2 or nil
	end,
	[var_0_0.SHOP_BUY] = function(arg_23_0, arg_23_1)
		local function var_23_0()
			arg_23_0:emit(ActivityMediator.GO_SHOPS_LAYER, {
				warp = NewShopsScene.TYPE_ACTIVITY,
				actId = arg_23_0.shopId
			})
		end

		local var_23_1 = arg_23_0:GetGoodsResCnt(arg_23_1[1])
		local var_23_2 = pg.activity_shop_template[arg_23_1[1]].num_limit
		local var_23_3 = var_23_1 == 0

		return var_23_2 - var_23_1 .. "/" .. var_23_2, not var_23_3 and var_23_0 or nil
	end
}

function var_0_0.UpdateTask(arg_25_0, arg_25_1, arg_25_2)
	if not arg_25_0.isLinkActOpen then
		return
	end

	local var_25_0 = arg_25_1 + 1
	local var_25_1, var_25_2, var_25_3 = unpack(arg_25_0.taskConfig[var_25_0])
	local var_25_4, var_25_5 = var_0_0.taskTypeDic[var_25_1](arg_25_0, var_25_3)

	setText(arg_25_0:findTF("name", arg_25_2), var_25_2)
	setText(arg_25_0:findTF("count", arg_25_2), var_25_4)
	setActive(arg_25_0:findTF("complete", arg_25_2), var_25_5 == nil)
	setActive(arg_25_0:findTF("btn_go", arg_25_2), var_25_5 ~= nil)

	if var_25_5 then
		onButton(arg_25_0, arg_25_0:findTF("btn_go", arg_25_2), function()
			var_25_5()
			pg.GameTrackerMgr.GetInstance():Record(GameTrackerBuilder.BuildUrJump(var_25_1))
		end)
	end
end

function var_0_0.OnUpdateFlush(arg_27_0)
	arg_27_0:UpdateExchangeStatus()
	arg_27_0.uilist:align(#arg_27_0.taskConfig)
	arg_27_0:UpdatePtCount()
	setActive(arg_27_0:findTF("red", arg_27_0._btnExchange), arg_27_0.canExchange)
	setGray(arg_27_0._btnExchange, arg_27_0.exchangeState == arg_27_0.length, false)

	arg_27_0._btnExchange:GetComponent("Image").raycastTarget = arg_27_0.exchangeState ~= arg_27_0.length
end

function var_0_0.GetGoodsResCnt(arg_28_0, arg_28_1)
	return arg_28_0.actShop:GetCommodityById(arg_28_1):GetPurchasableCnt()
end

function var_0_0.UpdateExchangeStatus(arg_29_0)
	arg_29_0.player = arg_29_0.playerProxy:getData()
	arg_29_0.ptCount = arg_29_0.player:getResource(arg_29_0.uPtId)
	arg_29_0.restExchange = _.reduce(arg_29_0.goodsId, 0, function(arg_30_0, arg_30_1)
		return arg_30_0 + arg_29_0.actShop:GetCommodityById(arg_30_1):GetPurchasableCnt()
	end)
	arg_29_0.exchangeState = arg_29_0.length - arg_29_0.restExchange
	arg_29_0.curGoods = arg_29_0.exchangeState < arg_29_0.length and pg.activity_shop_template[arg_29_0.goodsId[arg_29_0.exchangeState]] or nil
	arg_29_0.canExchange = arg_29_0.exchangeState < arg_29_0.length and arg_29_0.ptCount >= arg_29_0.curGoods.resource_num
end

function var_0_0.UpdatePtCount(arg_31_0)
	setText(arg_31_0._ptText, arg_31_0.exchangeState < arg_31_0.length and arg_31_0.ptCount < arg_31_0.curGoods.resource_num and setColorStr(arg_31_0.ptCount, COLOR_RED) or arg_31_0.ptCount)
	setText(arg_31_0._resText, "/" .. (arg_31_0.exchangeState == 3 and "--" or arg_31_0.curGoods.resource_num) .. i18n("UrExchange_Pt_charges", arg_31_0.restExchange))
end

function var_0_0.OnDestroy(arg_32_0)
	eachChild(arg_32_0._tasksTF, function(arg_33_0)
		Destroy(arg_33_0)
	end)
end

return var_0_0
