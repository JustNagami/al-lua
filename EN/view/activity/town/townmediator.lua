local var_0_0 = class("TownMediator", import("view.base.ContextMediator"))

var_0_0.OPEN_CHUANWU = "TownMediator:OPEN_CHUANWU"
var_0_0.UPGRADE_TOWN = "TownMediator:UPGRADE_TOWN"
var_0_0.UPGRADE_WORKPLACE = "TownMediator:UPGRADE_WORKPLACE"
var_0_0.CLICK_BUBBLE = "TownMediator:CLICK_BUBBLE"

function var_0_0.register(arg_1_0)
	arg_1_0:bind(var_0_0.OPEN_CHUANWU, function(arg_2_0, arg_2_1, arg_2_2)
		arg_1_0:OnSelShips(arg_2_1, arg_2_2)
	end)
	arg_1_0:bind(var_0_0.UPGRADE_TOWN, function(arg_3_0)
		arg_1_0:sendNotification(GAME.ACTIVITY_TOWN_OP, {
			activity_id = arg_1_0.activity.id,
			cmd = TownActivity.OPERATION.UPGRADE_TOWN
		})
	end)
	arg_1_0:bind(var_0_0.UPGRADE_WORKPLACE, function(arg_4_0, arg_4_1)
		arg_1_0:sendNotification(GAME.ACTIVITY_TOWN_OP, {
			activity_id = arg_1_0.activity.id,
			cmd = TownActivity.OPERATION.UPGRADE_PLACE,
			arg1 = arg_4_1
		})
	end)
	arg_1_0:bind(var_0_0.CLICK_BUBBLE, function(arg_5_0, arg_5_1)
		arg_1_0:sendNotification(GAME.ACTIVITY_TOWN_OP, {
			activity_id = arg_1_0.activity.id,
			cmd = TownActivity.OPERATION.CLICK_BUBBLE,
			arg1 = arg_5_1
		})
	end)

	local var_1_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_TOWN)

	if not var_1_0 or var_1_0:isEnd() then
		assert(nil, "not exist act")

		return
	end

	arg_1_0.activity = var_1_0

	arg_1_0.viewComponent:SetActivity(var_1_0)
end

function var_0_0.ChangeShips(arg_6_0, arg_6_1)
	arg_6_0:sendNotification(GAME.ACTIVITY_TOWN_OP, {
		activity_id = arg_6_0.activity.id,
		cmd = TownActivity.OPERATION.CHANGE_SHIPS,
		kvargs1 = arg_6_1
	})
end

function var_0_0.OnSelShips(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = arg_7_0:GetSelectedShipIds(arg_7_2)
	local var_7_1 = {
		selectedMin = 0,
		callbackQuit = true,
		selectedMax = arg_7_0.activity:GetUnlockSlotCnt(),
		quitTeam = arg_7_2 ~= nil,
		ignoredIds = pg.ShipFlagMgr.GetInstance():FilterShips({
			isActivityNpc = true
		}),
		selectedIds = Clone(var_7_0),
		preView = arg_7_0.viewComponent.__cname,
		hideTagFlags = ShipStatus.TAG_HIDE_BACKYARD,
		blockTagFlags = ShipStatus.TAG_BLOCK_BACKYARD,
		onSelected = function(arg_8_0, arg_8_1)
			arg_7_0:OnSelected(arg_7_1, arg_8_0, arg_8_1)
		end,
		priorEquipUpShipIDList = _.filter(arg_7_0.activity:GetShipIds(), function(arg_9_0)
			return arg_9_0 > 0
		end),
		leftTopWithFrameInfo = i18n("backyard_longpress_ship_tip")
	}

	var_7_1.isLayer = true
	var_7_1.energyDisplay = true

	arg_7_0:addSubLayers(Context.New({
		viewComponent = DockyardScene,
		mediator = DockyardMediator,
		data = var_7_1
	}))
end

function var_0_0.OnSelected(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
	local var_10_0 = Clone(arg_10_0.activity:GetShipIds())
	local var_10_1 = {}
	local var_10_2 = {}

	if arg_10_2 == nil or #arg_10_2 == 0 then
		for iter_10_0, iter_10_1 in ipairs(var_10_0) do
			if iter_10_1 > 0 then
				table.insert(var_10_2, {
					value = 0,
					key = iter_10_0
				})
			end
		end
	else
		for iter_10_2, iter_10_3 in ipairs(var_10_0) do
			local var_10_3 = arg_10_2[iter_10_2]

			if not var_10_3 then
				table.insert(var_10_2, {
					value = 0,
					key = iter_10_2
				})
			elseif var_10_3 ~= iter_10_3 then
				table.insert(var_10_2, {
					key = iter_10_2,
					value = var_10_3
				})
			end
		end
	end

	if #var_10_2 > 0 then
		arg_10_0:ChangeShips(var_10_2)
	end

	existCall(arg_10_3)
end

function var_0_0.GetSelectedShipIds(arg_11_0, arg_11_1)
	local var_11_0 = arg_11_1 and arg_11_1.id or -1
	local var_11_1 = {}

	for iter_11_0, iter_11_1 in ipairs(arg_11_0.activity:GetShipIds()) do
		local var_11_2 = iter_11_1 > 0 and getProxy(BayProxy):RawGetShipById(iter_11_1)

		if var_11_2 and var_11_2.id ~= var_11_0 then
			table.insert(var_11_1, var_11_2.id)
		end
	end

	return var_11_1
end

function var_0_0.listNotificationInterests(arg_12_0)
	return {
		GAME.ACTIVITY_TOWN_OP_DONE,
		ActivityProxy.ACTIVITY_UPDATED
	}
end

function var_0_0.handleNotification(arg_13_0, arg_13_1)
	local var_13_0 = arg_13_1:getName()
	local var_13_1 = arg_13_1:getBody()

	if var_13_0 == GAME.ACTIVITY_TOWN_OP_DONE then
		switch(var_13_1.cmd, {
			[TownActivity.OPERATION.UPGRADE_TOWN] = function()
				local var_14_0 = pg.activity_town_level[arg_13_0.activity:GetTownLevel()]

				seriesAsync({
					function(arg_15_0)
						local var_15_0 = var_14_0.unlock_story

						if var_15_0 ~= "" then
							pg.NewStoryMgr.GetInstance():Play(var_15_0, arg_15_0)
						else
							arg_15_0()
						end
					end,
					function(arg_16_0)
						local var_16_0 = var_14_0.unlock_work

						if #var_16_0[1] > 0 or #var_16_0[2] > 0 then
							arg_13_0:addSubLayers(Context.New({
								mediator = TownUnlockMediator,
								viewComponent = TownUnlockLayer,
								data = {
									newIds = var_16_0[1],
									limitIds = var_16_0[2],
									removeFunc = arg_16_0
								}
							}))
						else
							arg_16_0()
						end
					end
				}, function()
					return
				end)
				arg_13_0.viewComponent:OnTownUpgrade()
			end,
			[TownActivity.OPERATION.UPGRADE_PLACE] = function()
				arg_13_0.viewComponent:UpdateInfoPage()
			end,
			[TownActivity.OPERATION.CHANGE_SHIPS] = function()
				arg_13_0.viewComponent:UpdateShips()
				arg_13_0.viewComponent:UpdateInfoPage()
			end,
			[TownActivity.OPERATION.CLICK_BUBBLE] = function()
				arg_13_0.viewComponent:UpdateBubbles()
			end
		})
		arg_13_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_13_1.awards)
	elseif var_13_0 == ActivityProxy.ACTIVITY_UPDATED and var_13_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_TOWN then
		arg_13_0.activity = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_TOWN)

		arg_13_0.viewComponent:SetActivity(arg_13_0.activity)
		arg_13_0.viewComponent:UpdateGold()
		arg_13_0.viewComponent:OnExpUpdate()
	end
end

return var_0_0
