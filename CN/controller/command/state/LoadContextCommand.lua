local var_0_0 = class("LoadContextCommand", pm.SimpleCommand)

var_0_0.queue = {}

function var_0_0.execute(arg_1_0, arg_1_1)
	arg_1_0:load(arg_1_1:getBody())
end

function var_0_0.load(arg_2_0, arg_2_1)
	table.insert(var_0_0.queue, arg_2_1)

	if #var_0_0.queue == 1 then
		arg_2_0:loadNext()
	end
end

function var_0_0.loadNext(arg_3_0)
	if #var_0_0.queue > 0 then
		local var_3_0 = var_0_0.queue[1]

		local function var_3_1()
			if var_3_0.callback then
				var_3_0.callback()
			end

			table.remove(var_0_0.queue, 1)
			arg_3_0:loadNext()
		end

		if var_3_0.type == LOAD_TYPE_SCENE then
			arg_3_0:loadScene(var_3_0.context, var_3_0.prevContext, var_3_0.isBack, var_3_1)
		elseif var_3_0.type == LOAD_TYPE_LAYER then
			arg_3_0:loadLayer(var_3_0.context, var_3_0.parentContext, var_3_0.removeContexts, var_3_1)
		else
			assert(false, "context load type not support: " .. var_3_0.type)
		end
	end
end

function var_0_0.loadScene(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4)
	assert(isa(arg_5_1, Context), "should be an instance of Context")

	local var_5_0 = getProxy(ContextProxy)
	local var_5_1 = pg.SceneMgr.GetInstance()
	local var_5_2
	local var_5_3
	local var_5_4 = {}
	local var_5_5 = arg_5_3 and arg_5_2 or nil
	local var_5_6 = {
		function(arg_6_0)
			if arg_5_2 ~= nil then
				arg_5_1:extendData({
					fromMediatorName = arg_5_2.mediator.__cname
				})
				var_5_1:removeLayerMediator(arg_5_0.facade, arg_5_2, function(arg_7_0)
					var_5_2 = arg_7_0

					arg_6_0()
				end)
			else
				arg_6_0()
			end
		end,
		function(arg_8_0)
			if var_5_2 then
				table.SerialIpairsAsync(var_5_2, function(arg_9_0, arg_9_1, arg_9_2)
					local var_9_0 = false

					if var_5_5 then
						var_9_0 = var_5_5.mediator.__cname == arg_9_1.mediator.__cname

						if var_9_0 then
							var_5_1:clearTempCache(arg_9_1.mediator)
						end
					end

					var_5_1:remove(arg_9_1.mediator, function()
						if arg_9_0 == #var_5_2 then
							arg_9_1.context:onContextRemoved()
						end

						arg_9_2()
					end, var_9_0)
				end, arg_8_0)
			else
				arg_8_0()
			end
		end,
		function(arg_11_0)
			if arg_5_1.cleanStack then
				var_5_0:cleanContext()
			end

			var_5_0:pushContext(arg_5_1)
			arg_11_0()
		end,
		function(arg_12_0)
			if arg_5_1 and arg_5_1.cleanChild then
				arg_5_1.children = {}
				arg_5_1.cleanChild = false
			end

			local var_12_0 = {
				function(arg_13_0)
					local var_13_0 = {}

					for iter_13_0, iter_13_1 in ipairs(arg_5_1:GetHierarchy()) do
						local var_13_1 = iter_13_1.viewComponent.New()

						table.insertto(var_13_0, var_13_1:preloadUIList())
					end

					parallelAsync(underscore.map(var_13_0, function(arg_14_0)
						return function(arg_15_0)
							PoolMgr.GetInstance():PreloadUI(arg_14_0, arg_15_0)
						end
					end), arg_13_0)
				end,
				function(arg_16_0)
					var_5_1:prepare(arg_5_0.facade, arg_5_1, function(arg_17_0)
						arg_5_0:sendNotification(GAME.START_LOAD_SCENE, arg_17_0)

						var_5_3 = arg_17_0

						arg_16_0()
					end)
				end,
				function(arg_18_0)
					var_5_1:prepareLayer(arg_5_0.facade, nil, arg_5_1, function(arg_19_0)
						arg_5_0:sendNotification(GAME.WILL_LOAD_LAYERS, #arg_19_0)

						var_5_4 = arg_19_0

						arg_18_0()
					end)
				end
			}

			seriesAsync(var_12_0, arg_12_0)
		end,
		function(arg_20_0)
			var_5_1:enter(table.mergeArray({
				var_5_3
			}, var_5_4), arg_20_0)
		end
	}

	pg.UIMgr.GetInstance():LoadingOn()

	local var_5_7 = underscore.map(arg_5_1.irregularSequence and {
		1,
		2,
		3,
		4,
		5
	} or {
		1,
		3,
		4,
		2,
		5
	}, function(arg_21_0)
		return var_5_6[arg_21_0]
	end)

	seriesAsync(var_5_7, function()
		existCall(arg_5_4)
		pg.UIMgr.GetInstance():LoadingOff()
		arg_5_0:sendNotification(GAME.LOAD_SCENE_DONE, arg_5_1.scene)
	end)
end

function var_0_0.loadLayer(arg_23_0, arg_23_1, arg_23_2, arg_23_3, arg_23_4)
	assert(isa(arg_23_1, Context), "should be an instance of Context")

	local var_23_0 = pg.SceneMgr.GetInstance()
	local var_23_1 = {}
	local var_23_2

	seriesAsync({
		function(arg_24_0)
			pg.UIMgr.GetInstance():LoadingOn()

			if arg_23_3 ~= nil then
				table.ParallelIpairsAsync(arg_23_3, function(arg_25_0, arg_25_1, arg_25_2)
					var_23_0:removeLayerMediator(arg_23_0.facade, arg_25_1, function(arg_26_0)
						var_23_2 = var_23_2 or {}

						table.insertto(var_23_2, arg_26_0)
						arg_25_2()
					end)
				end, arg_24_0)
			else
				arg_24_0()
			end
		end,
		function(arg_27_0)
			var_23_0:prepareLayer(arg_23_0.facade, arg_23_2, arg_23_1, function(arg_28_0)
				for iter_28_0, iter_28_1 in ipairs(arg_28_0) do
					table.insert(var_23_1, iter_28_1)
				end

				arg_27_0()
			end)
		end,
		function(arg_29_0)
			if var_23_2 then
				table.SerialIpairsAsync(var_23_2, function(arg_30_0, arg_30_1, arg_30_2)
					var_23_0:remove(arg_30_1.mediator, function()
						arg_30_1.context:onContextRemoved()
						arg_30_2()
					end)
				end, arg_29_0)
			else
				arg_29_0()
			end
		end,
		function(arg_32_0)
			arg_23_0:sendNotification(GAME.WILL_LOAD_LAYERS, #var_23_1)
			var_23_0:enter(var_23_1, arg_32_0)
		end,
		function()
			if arg_23_4 then
				arg_23_4()
			end

			pg.UIMgr.GetInstance():LoadingOff()
			arg_23_0:sendNotification(GAME.LOAD_LAYER_DONE, arg_23_1)
		end
	})
end

function var_0_0.LoadLayerOnTopContext(arg_34_0)
	local var_34_0 = getProxy(ContextProxy):getCurrentContext()

	pg.m02:sendNotification(GAME.LOAD_LAYERS, {
		parentContext = var_34_0,
		context = arg_34_0
	})
end

function var_0_0.RemoveLayerByMediator(arg_35_0)
	local var_35_0 = getProxy(ContextProxy):getCurrentContext():getContextByMediator(arg_35_0)

	if var_35_0 then
		pg.m02:sendNotification(GAME.REMOVE_LAYERS, {
			context = var_35_0
		})

		return true
	end
end

return var_0_0
