pg = pg or {}

local var_0_0 = pg

var_0_0.SceneMgr = singletonClass("SceneMgr")

local var_0_1 = var_0_0.SceneMgr

function var_0_1.Ctor(arg_1_0)
	arg_1_0._cacheUI = {}
	arg_1_0._gcLimit = 7
	arg_1_0._gcCounter = 0
end

function var_0_1.prepare(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	local var_2_0 = arg_2_2.mediator
	local var_2_1 = arg_2_2.viewComponent
	local var_2_2
	local var_2_3

	if arg_2_0._cacheUI[var_2_0.__cname] ~= nil then
		var_2_3 = arg_2_0._cacheUI[var_2_0.__cname]
		arg_2_0._cacheUI[var_2_0.__cname] = nil
		var_2_2 = var_2_0.New(var_2_3)

		var_2_2:setContextData(arg_2_2.data)
		arg_2_1:registerMediator(var_2_2)
		arg_2_3(var_2_2)
	else
		var_2_3 = var_2_1.New()

		assert(isa(var_2_3, BaseUI), "should be an instance of BaseUI: " .. var_2_3.__cname)
		var_2_3:setContextData(arg_2_2.data)

		local var_2_4

		local function var_2_5()
			var_2_3.event:disconnect(BaseUI.LOADED, var_2_5)

			var_2_2 = var_2_0.New(var_2_3)

			var_2_2:setContextData(arg_2_2.data)
			arg_2_1:registerMediator(var_2_2)
			arg_2_3(var_2_2)
		end

		if var_2_3:isLoaded() then
			var_2_5()
		else
			var_2_3.event:connect(BaseUI.LOADED, var_2_5)
			var_2_3:load()
		end
	end
end

function var_0_1.prepareLayer(arg_4_0, arg_4_1, arg_4_2, arg_4_3, arg_4_4)
	local var_4_0 = {}
	local var_4_1 = {}

	if arg_4_2 ~= nil then
		if arg_4_2:getContextByMediator(arg_4_3.mediator) then
			originalPrint("mediator already exist: " .. arg_4_3.mediator.__cname)
			arg_4_4(var_4_1)

			return
		end

		table.insert(var_4_0, arg_4_3)
		arg_4_2:addChild(arg_4_3)
	else
		for iter_4_0, iter_4_1 in ipairs(arg_4_3.children) do
			table.insert(var_4_0, iter_4_1)
		end
	end

	local var_4_2 = {}

	while #var_4_0 > 0 do
		local var_4_3 = table.remove(var_4_0, 1)

		table.insert(var_4_2, function(arg_5_0)
			local var_5_0 = var_4_3.parent
			local var_5_1 = arg_4_1:retrieveMediator(var_5_0.mediator.__cname):getViewComponent()

			arg_4_0:prepare(arg_4_1, var_4_3, function(arg_6_0)
				arg_6_0.viewComponent:attach(var_5_1)
				table.insert(var_4_1, arg_6_0)
				arg_5_0()
			end)
		end)

		for iter_4_2, iter_4_3 in ipairs(var_4_3.children) do
			table.insert(var_4_0, iter_4_3)
		end
	end

	seriesAsync(var_4_2, function()
		arg_4_4(var_4_1)
	end)
end

function var_0_1.enter(arg_8_0, arg_8_1, arg_8_2)
	if #arg_8_1 == 0 then
		arg_8_2()
	end

	local var_8_0 = #arg_8_1

	for iter_8_0, iter_8_1 in ipairs(arg_8_1) do
		local var_8_1 = iter_8_1.viewComponent

		if var_8_1._isCachedView then
			var_8_1:setVisible(true)
		end

		local var_8_2

		local function var_8_3()
			var_8_1.event:disconnect(BaseUI.AVALIBLE, var_8_3)

			var_8_0 = var_8_0 - 1

			if var_8_0 == 0 then
				arg_8_2()
			end
		end

		var_8_1.event:connect(BaseUI.AVALIBLE, var_8_3)
		var_8_1:enter()
	end
end

function var_0_1.removeLayer(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
	local var_10_0 = {
		arg_10_2
	}
	local var_10_1 = {}

	while #var_10_0 > 0 do
		local var_10_2 = table.remove(var_10_0, 1)

		if var_10_2.mediator then
			table.insert(var_10_1, var_10_2)
		end

		for iter_10_0, iter_10_1 in ipairs(var_10_2.children) do
			table.insert(var_10_0, iter_10_1)
		end
	end

	if arg_10_2.parent == nil then
		table.remove(var_10_1, 1)
	else
		arg_10_2.parent:removeChild(arg_10_2)
	end

	local var_10_3 = {}

	for iter_10_2 = #var_10_1, 1, -1 do
		local var_10_4 = var_10_1[iter_10_2]
		local var_10_5 = arg_10_1:removeMediator(var_10_4.mediator.__cname)

		table.insert(var_10_3, function(arg_11_0)
			if var_10_5 then
				arg_10_0:clearTempCache(var_10_5)
				arg_10_0:remove(var_10_5, function()
					var_10_4:onContextRemoved()
					arg_11_0()
				end)
			else
				arg_11_0()
			end
		end)
	end

	seriesAsync(var_10_3, arg_10_3)
end

function var_0_1.removeLayerMediator(arg_13_0, arg_13_1, arg_13_2, arg_13_3)
	local var_13_0 = {
		arg_13_2
	}
	local var_13_1 = {}

	while #var_13_0 > 0 do
		local var_13_2 = table.remove(var_13_0, 1)

		if var_13_2.mediator then
			table.insert(var_13_1, var_13_2)
		end

		for iter_13_0, iter_13_1 in ipairs(var_13_2.children) do
			table.insert(var_13_0, iter_13_1)
		end
	end

	if arg_13_2.parent ~= nil then
		arg_13_2.parent:removeChild(arg_13_2)
	end

	local var_13_3 = {}

	for iter_13_2 = #var_13_1, 1, -1 do
		local var_13_4 = var_13_1[iter_13_2]
		local var_13_5 = arg_13_1:removeMediator(var_13_4.mediator.__cname)

		if var_13_5 then
			table.insert(var_13_3, {
				mediator = var_13_5,
				context = var_13_4
			})
		end
	end

	arg_13_3(var_13_3)
end

function var_0_1.clearTempCache(arg_14_0, arg_14_1)
	local var_14_0 = arg_14_1:getViewComponent()

	if var_14_0:tempCache() then
		var_14_0:RemoveTempCache()
	end
end

function var_0_1.remove(arg_15_0, arg_15_1, arg_15_2, arg_15_3)
	local var_15_0 = arg_15_1:getViewComponent()
	local var_15_1 = arg_15_0._cacheUI[arg_15_1.__cname]

	if var_15_1 ~= nil and var_15_1 ~= var_15_0 then
		var_15_1.event:clear()
		arg_15_0:gc(var_15_1)
	end

	if var_15_0 == nil then
		arg_15_2()
	elseif var_15_0:needCache() and not arg_15_3 then
		var_15_0:setVisible(false)

		arg_15_0._cacheUI[arg_15_1.__cname] = var_15_0
		var_15_0._isCachedView = true

		arg_15_2()
	else
		var_15_0._isCachedView = false

		var_15_0.event:connect(BaseUI.DID_EXIT, function()
			var_15_0.event:clear()
			arg_15_0:gc(var_15_0)
			arg_15_2()
		end)
		var_15_0:exit()
	end
end

function var_0_1.gc(arg_17_0, arg_17_1)
	local var_17_0 = arg_17_1:forceGC()

	table.clear(arg_17_1)

	arg_17_1.exited = true

	if var_17_0 or arg_17_0._gcCounter >= arg_17_0._gcLimit then
		arg_17_0._gcCounter = 0

		gcAll(false)
	else
		arg_17_0._gcCounter = arg_17_0._gcCounter + 1

		GCThread.GetInstance():LuaGC(false)
	end
end
