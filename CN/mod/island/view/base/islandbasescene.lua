local var_0_0 = class("IslandBaseScene", import("view.base.BaseUI"))
local var_0_1 = false

var_0_0.CLOSE_PAGE = "IslandBaseScene:CLOSE_PAGE"

function var_0_0.Ctor(arg_1_0)
	var_0_0.super.Ctor(arg_1_0)

	arg_1_0.capacity = 3
	arg_1_0.balance = 0
	arg_1_0.pages = {}
	arg_1_0.subPages = {}
	arg_1_0.__callbacks__ = {}
end

function var_0_0.preload(arg_2_0, arg_2_1)
	AssetBundleHelper.StoreAssetBundle("ui/islandcommonui_atlas", true, false, function(arg_3_0)
		arg_2_1()
	end)
end

function var_0_0.emit(arg_4_0, ...)
	if unpack({
		...
	}) == BaseUI.ON_HOME then
		arg_4_0:ExitIsland()
	else
		var_0_0.super.emit(arg_4_0, ...)
	end
end

function var_0_0.ExitIsland(arg_5_0)
	local var_5_0 = arg_5_0.contextData.id

	seriesAsync({
		function(arg_6_0)
			pg.m02:sendNotification(GAME.ISLAND_EXIT, {
				id = var_5_0,
				callback = arg_6_0
			})
		end
	}, function()
		var_0_0.super.emit(arg_5_0, BaseUI.ON_HOME)
	end)
end

function var_0_0.GetIsland(arg_8_0)
	assert(false, "overwrite me !!!!")
end

function var_0_0.onUILoaded(arg_9_0, arg_9_1)
	var_0_0.super.onUILoaded(arg_9_0, arg_9_1)

	arg_9_0.subViews = {
		IslandMsgBox.New(pg.UIMgr.GetInstance().OverlayMain, arg_9_0.event),
		IslandToast.New(pg.UIMgr.GetInstance().OverlayToast, arg_9_0.event),
		IslandStoryMgr.New(pg.UIMgr.GetInstance().OverlayToast, arg_9_0.event),
		IslandAwardDisplayPage.New(pg.UIMgr.GetInstance().OverlayToast, arg_9_0.event)
	}
	arg_9_0.monitors = {
		IslandPlayerDataMonitor.New(arg_9_0:GetIsland()),
		IslandSyncDataMonitor.New(arg_9_0:GetIsland())
	}

	arg_9_0:AddListeners()
end

function var_0_0.GetSubView(arg_10_0, arg_10_1)
	for iter_10_0, iter_10_1 in ipairs(arg_10_0.subViews) do
		if isa(iter_10_1, arg_10_1) then
			return iter_10_1
		end
	end

	return nil
end

function var_0_0.StartCore(arg_11_0)
	arg_11_0:emit(IslandBaseMediator.SET_UP)
end

function var_0_0.DoOpenPage(arg_12_0, arg_12_1, arg_12_2, ...)
	local var_12_0

	if arg_12_1.__cname == arg_12_0.__cname then
		var_12_0 = arg_12_0:InstancePage(arg_12_2)

		arg_12_0:HideOtherPages(arg_12_0.balance)
		table.insert(arg_12_0.pages, var_12_0)

		if #arg_12_0.pages > arg_12_0.capacity then
			local var_12_1 = table.remove(arg_12_0.pages, 1)

			arg_12_0:DestroyPage(var_12_1)
		end

		if arg_12_0.balance == 0 then
			arg_12_0:OnAnyPageOpen(arg_12_2)
		end

		arg_12_0.balance = arg_12_0.balance + 1
	else
		var_12_0 = arg_12_0:InstanceSubPage(arg_12_1, arg_12_2)

		if not arg_12_0.subPages[arg_12_1.__cname] then
			arg_12_0.subPages[arg_12_1.__cname] = {}
		end

		table.insert(arg_12_0.subPages[arg_12_1.__cname], var_12_0)
	end

	var_12_0:ExecuteAction("Show", ...)
	arg_12_0:Debug()

	return var_12_0
end

function var_0_0.HideOtherPages(arg_13_0, arg_13_1)
	local var_13_0 = #arg_13_0.pages
	local var_13_1 = math.max(0, var_13_0 - arg_13_1 + 1)

	for iter_13_0 = var_13_0, var_13_1, -1 do
		local var_13_2 = arg_13_0.pages[iter_13_0]

		if var_13_2 then
			var_13_2:Disable()
		end
	end
end

function var_0_0.DoClosePage(arg_14_0, arg_14_1)
	local var_14_0 = false

	for iter_14_0, iter_14_1 in ipairs(arg_14_0.pages) do
		if iter_14_1.__cname == arg_14_1.__cname then
			arg_14_0:CloseSelfAndSub(iter_14_1)

			var_14_0 = true

			break
		end
	end

	if not var_14_0 then
		for iter_14_2, iter_14_3 in pairs(arg_14_0.subPages) do
			for iter_14_4, iter_14_5 in ipairs(iter_14_3) do
				if iter_14_5.__cname == arg_14_1.__cname then
					if iter_14_5:GetLoaded() and iter_14_5:isShowing() then
						iter_14_5:Disable()
					end

					var_14_0 = true

					break
				end
			end
		end
	end

	if var_14_0 then
		arg_14_0:emit(var_0_0.CLOSE_PAGE, arg_14_1)
	end

	arg_14_0:Debug()
end

function var_0_0.InstancePage(arg_15_0, arg_15_1)
	local var_15_0 = 0

	for iter_15_0, iter_15_1 in ipairs(arg_15_0.pages) do
		if iter_15_1.__cname == arg_15_1.__cname then
			var_15_0 = iter_15_0

			break
		end
	end

	if var_15_0 > 0 then
		return (table.remove(arg_15_0.pages, var_15_0))
	else
		return arg_15_1.New(arg_15_0)
	end
end

function var_0_0.InstanceSubPage(arg_16_0, arg_16_1, arg_16_2)
	for iter_16_0, iter_16_1 in ipairs(arg_16_0.subPages[arg_16_1.__cname] or {}) do
		if iter_16_1.__cname == arg_16_2.__cname then
			table.remove(arg_16_0.subPages[arg_16_1.__cname], iter_16_0)

			return iter_16_1
		end
	end

	return arg_16_2.New(arg_16_0)
end

function var_0_0.GetInstancePage(arg_17_0, arg_17_1)
	for iter_17_0, iter_17_1 in pairs(arg_17_0.pages) do
		if isa(iter_17_1, arg_17_1) then
			return iter_17_1
		end
	end

	for iter_17_2, iter_17_3 in pairs(arg_17_0.subPages) do
		if isa(iter_17_3, arg_17_1) then
			return iter_17_3
		end
	end
end

function var_0_0.CloseSelfAndSub(arg_18_0, arg_18_1)
	for iter_18_0, iter_18_1 in ipairs(arg_18_0.subPages[arg_18_1.__cname] or {}) do
		if iter_18_1:GetLoaded() and iter_18_1:isShowing() then
			iter_18_1:Disable()
		end
	end

	if arg_18_1:GetLoaded() and arg_18_1:isShowing() then
		arg_18_1:Disable()

		arg_18_0.balance = arg_18_0.balance - 1

		arg_18_0:ShowOtherPage(arg_18_0.balance)

		if arg_18_0.balance == 0 then
			arg_18_0:OnAllPageClose()
		end

		for iter_18_2, iter_18_3 in ipairs(arg_18_0.subPages[arg_18_1.__cname] or {}) do
			iter_18_3:Destroy()
		end

		arg_18_0.subPages[arg_18_1.__cname] = {}
	end
end

function var_0_0.OnAnyPageOpen(arg_19_0, arg_19_1)
	arg_19_0:setVisible(false)

	if _IslandCore then
		_IslandCore:Link(ISLAND_EVT.ANY_PAGE_OPENED, arg_19_1)
	end
end

function var_0_0.OnAllPageClose(arg_20_0)
	arg_20_0:setVisible(true)

	if _IslandCore then
		_IslandCore:Link(ISLAND_EVT.ALL_PAGE_CLOSED)
	end
end

function var_0_0.setVisible(arg_21_0, arg_21_1)
	arg_21_0:ShowOrHideResUI(arg_21_1)

	if arg_21_1 then
		arg_21_0:OnVisible()
	else
		arg_21_0:OnDisVisible()
	end

	setActive(arg_21_0._tf, arg_21_1)
end

function var_0_0.ShowOtherPage(arg_22_0, arg_22_1)
	local var_22_0 = math.max(0, #arg_22_0.pages - arg_22_1)

	for iter_22_0 = math.max(#arg_22_0.pages - 1, 0), var_22_0, -1 do
		local var_22_1 = arg_22_0.pages[iter_22_0]

		if var_22_1 then
			var_22_1:Enable()
		end
	end
end

function var_0_0.StepCloseSelfAndSub(arg_23_0, arg_23_1)
	for iter_23_0, iter_23_1 in ipairs(arg_23_0.subPages[arg_23_1.__cname] or {}) do
		if iter_23_1:GetLoaded() and iter_23_1:isShowing() then
			iter_23_1:Hide()

			return
		end
	end

	if arg_23_1:GetLoaded() and arg_23_1:isShowing() then
		arg_23_1:Hide()
	end
end

function var_0_0.DestroyPage(arg_24_0, arg_24_1)
	if arg_24_1:GetLoaded() then
		arg_24_1:Destroy()
	end

	for iter_24_0, iter_24_1 in ipairs(arg_24_0.subPages[arg_24_1.__cname] or {}) do
		if iter_24_1:GetLoaded() then
			iter_24_1:Destroy()
		end
	end

	arg_24_0.subPages[arg_24_1.__cname] = {}
end

function var_0_0.OpenPage(arg_25_0, arg_25_1, ...)
	return arg_25_0:DoOpenPage(arg_25_0, arg_25_1, ...)
end

function var_0_0.ClosePage(arg_26_0, arg_26_1)
	arg_26_0:DoClosePage(arg_26_1)
end

function var_0_0.ShowMsgbox(arg_27_0, arg_27_1)
	arg_27_0:GetSubView(IslandMsgBox):ExecuteAction("Show", arg_27_1)
end

function var_0_0.ShowToast(arg_28_0, arg_28_1)
	arg_28_0:GetSubView(IslandToast):ExecuteAction("Show", arg_28_1)
end

function var_0_0.DisplayAward(arg_29_0, arg_29_1)
	arg_29_0:GetSubView(IslandAwardDisplayPage):ExecuteAction("Show", arg_29_1)
end

function var_0_0.PlayStory(arg_30_0, arg_30_1)
	arg_30_0:setVisible(false)
	arg_30_0:GetSubView(IslandStoryMgr):ExecuteAction("Play", arg_30_1.name, function()
		arg_30_0:setVisible(true)

		if arg_30_1.callback then
			arg_30_1.callback()
		end
	end)
end

function var_0_0.AddListener(arg_32_0, arg_32_1, arg_32_2)
	local function var_32_0(arg_33_0, ...)
		arg_32_2(arg_32_0, ...)
	end

	local var_32_1 = arg_32_0:bind(arg_32_1, var_32_0)

	arg_32_0.__callbacks__[arg_32_1] = var_32_1

	arg_32_0:GetIsland():AddListener(arg_32_1, var_32_0)
end

function var_0_0.RemoveListener(arg_34_0, arg_34_1, arg_34_2)
	local var_34_0 = arg_34_0.__callbacks__[arg_34_1]

	if var_34_0 then
		local var_34_1 = arg_34_0.eventStore[var_34_0]

		arg_34_0:GetIsland():RemoveListener(arg_34_1, var_34_1.callback)
		arg_34_0:disconnect(var_34_0)

		arg_34_0.__callbacks__[arg_34_1] = nil
	end
end

function var_0_0.onBackPressed(arg_35_0)
	for iter_35_0, iter_35_1 in ipairs(arg_35_0.subViews) do
		if iter_35_1:GetLoaded() and iter_35_1:isShowing() then
			iter_35_1:Hide()

			return
		end
	end

	for iter_35_2, iter_35_3 in ipairs(arg_35_0.pages) do
		if iter_35_3:GetLoaded() and iter_35_3:isShowing() then
			arg_35_0:StepCloseSelfAndSub(iter_35_3)

			return
		end
	end

	var_0_0.super.onBackPressed(arg_35_0)
end

function var_0_0.exit(arg_36_0)
	arg_36_0:RemoveListeners()
	AssetBundleHelper.UnstoreAssetBundle("ui/islandcommonui_atlas", true)

	for iter_36_0, iter_36_1 in ipairs(arg_36_0.subViews) do
		if iter_36_1:GetLoaded() then
			iter_36_1:Destroy()
		end
	end

	arg_36_0.subViews = nil

	for iter_36_2, iter_36_3 in ipairs(arg_36_0.monitors) do
		iter_36_3:Dispose()
	end

	arg_36_0.monitors = nil

	arg_36_0:GetIsland():ClearListeners()

	for iter_36_4, iter_36_5 in ipairs(arg_36_0.pages) do
		arg_36_0:DestroyPage(iter_36_5)
	end

	arg_36_0.pages = nil
	arg_36_0.subPages = nil

	var_0_0.super.exit(arg_36_0)
end

function var_0_0.AddListeners(arg_37_0)
	return
end

function var_0_0.RemoveListeners(arg_38_0)
	return
end

function var_0_0.OnUnloadScene(arg_39_0)
	return
end

function var_0_0.Debug(arg_40_0)
	if not var_0_1 then
		return
	end

	local function var_40_0(arg_41_0)
		local var_41_0 = arg_40_0.subPages[arg_41_0.__cname] or {}
		local var_41_1 = _.map(var_41_0, function(arg_42_0)
			return arg_42_0.__cname
		end)

		return table.concat(var_41_1, ",")
	end

	local var_40_1 = _.map(arg_40_0.pages, function(arg_43_0)
		return arg_43_0.__cname .. ":" .. var_40_0(arg_43_0)
	end)
	local var_40_2 = table.concat(var_40_1, "\n")

	print("\n" .. var_40_2)
end

return var_0_0
