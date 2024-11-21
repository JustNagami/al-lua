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

	local var_4_2 = {
		{
			depth = 1,
			count = #var_4_0,
			list = {}
		}
	}

	while #var_4_0 > 0 do
		local var_4_3 = table.remove(var_4_0, 1)
		local var_4_4 = underscore.detect(var_4_2, function(arg_5_0)
			return arg_5_0.count > 0
		end).depth

		var_4_2[var_4_4].count = var_4_2[var_4_4].count - 1

		local var_4_5 = var_4_2[var_4_4].list

		table.insert(var_4_5, function(arg_6_0)
			local var_6_0 = var_4_3.parent
			local var_6_1 = arg_4_1:retrieveMediator(var_6_0.mediator.__cname):getViewComponent()

			arg_4_0:prepare(arg_4_1, var_4_3, function(arg_7_0)
				arg_7_0.viewComponent:attach(var_6_1)
				table.insert(var_4_1, arg_7_0)
				arg_6_0()
			end)
		end)

		for iter_4_2, iter_4_3 in ipairs(var_4_3.children) do
			var_4_2[var_4_4 + 1] = var_4_2[var_4_4 + 1] or {
				count = 0,
				depth = var_4_4 + 1,
				list = {}
			}
			var_4_2[var_4_4 + 1].count = var_4_2[var_4_4 + 1].count + 1

			table.insert(var_4_0, iter_4_3)
		end
	end

	seriesAsync(underscore.map(var_4_2, function(arg_8_0)
		return function(arg_9_0)
			parallelAsync(arg_8_0.list, arg_9_0)
		end
	end), function()
		arg_4_4(var_4_1)
	end)
end

function var_0_1.enter(arg_11_0, arg_11_1, arg_11_2)
	if #arg_11_1 == 0 then
		arg_11_2()
	end

	local var_11_0 = #arg_11_1

	for iter_11_0, iter_11_1 in ipairs(arg_11_1) do
		local var_11_1 = iter_11_1.viewComponent

		if var_11_1._isCachedView then
			var_11_1:setVisible(true)
		end

		local var_11_2

		local function var_11_3()
			var_11_1.event:disconnect(BaseUI.AVALIBLE, var_11_3)

			var_11_0 = var_11_0 - 1

			if var_11_0 == 0 then
				arg_11_2()
			end
		end

		var_11_1.event:connect(BaseUI.AVALIBLE, var_11_3)
		var_11_1:enter()
	end
end

function var_0_1.removeLayer(arg_13_0, arg_13_1, arg_13_2, arg_13_3)
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

	if arg_13_2.parent == nil then
		table.remove(var_13_1, 1)
	else
		arg_13_2.parent:removeChild(arg_13_2)
	end

	local var_13_3 = {}

	for iter_13_2 = #var_13_1, 1, -1 do
		local var_13_4 = var_13_1[iter_13_2]
		local var_13_5 = arg_13_1:removeMediator(var_13_4.mediator.__cname)

		table.insert(var_13_3, function(arg_14_0)
			if var_13_5 then
				arg_13_0:clearTempCache(var_13_5)
				arg_13_0:remove(var_13_5, function()
					var_13_4:onContextRemoved()
					arg_14_0()
				end)
			else
				arg_14_0()
			end
		end)
	end

	seriesAsync(var_13_3, arg_13_3)
end

function var_0_1.removeLayerMediator(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
	local var_16_0 = {
		arg_16_2
	}
	local var_16_1 = {}

	while #var_16_0 > 0 do
		local var_16_2 = table.remove(var_16_0, 1)

		if var_16_2.mediator then
			table.insert(var_16_1, var_16_2)
		end

		for iter_16_0, iter_16_1 in ipairs(var_16_2.children) do
			table.insert(var_16_0, iter_16_1)
		end
	end

	if arg_16_2.parent ~= nil then
		arg_16_2.parent:removeChild(arg_16_2)
	end

	local var_16_3 = {}

	for iter_16_2 = #var_16_1, 1, -1 do
		local var_16_4 = var_16_1[iter_16_2]
		local var_16_5 = arg_16_1:removeMediator(var_16_4.mediator.__cname)

		if var_16_5 then
			table.insert(var_16_3, {
				mediator = var_16_5,
				context = var_16_4
			})
		end
	end

	arg_16_3(var_16_3)
end

function var_0_1.clearTempCache(arg_17_0, arg_17_1)
	local var_17_0 = arg_17_1:getViewComponent()

	if var_17_0:tempCache() then
		var_17_0:RemoveTempCache()
	end
end

function var_0_1.remove(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
	local var_18_0 = arg_18_1:getViewComponent()
	local var_18_1 = arg_18_0._cacheUI[arg_18_1.__cname]

	if var_18_1 ~= nil and var_18_1 ~= var_18_0 then
		var_18_1.event:clear()
		arg_18_0:gc(var_18_1)
	end

	if var_18_0 == nil then
		arg_18_2()
	elseif var_18_0:needCache() and not arg_18_3 then
		var_18_0:setVisible(false)

		arg_18_0._cacheUI[arg_18_1.__cname] = var_18_0
		var_18_0._isCachedView = true

		arg_18_2()
	else
		var_18_0._isCachedView = false

		var_18_0.event:connect(BaseUI.DID_EXIT, function()
			var_18_0.event:clear()
			arg_18_0:gc(var_18_0)
			arg_18_2()
		end)
		var_18_0:exit()
	end
end

function var_0_1.gc(arg_20_0, arg_20_1)
	local var_20_0 = arg_20_1:forceGC()

	table.clear(arg_20_1)

	arg_20_1.exited = true

	if var_20_0 or arg_20_0._gcCounter >= arg_20_0._gcLimit then
		arg_20_0._gcCounter = 0

		gcAll(false)
	else
		arg_20_0._gcCounter = arg_20_0._gcCounter + 1

		GCThread.GetInstance():LuaGC(false)
	end
end
