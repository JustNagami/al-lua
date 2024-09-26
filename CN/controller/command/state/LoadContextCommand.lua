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
			if arg_5_2 and arg_5_2.cleanChild then
				arg_5_2.children = {}
			end

			if arg_5_1.cleanStack then
				var_5_0:cleanContext()
			end

			var_5_0:pushContext(arg_5_1)
			arg_11_0()
		end,
		function(arg_12_0)
			seriesAsync({
				function(arg_13_0)
					var_5_1:prepare(arg_5_0.facade, arg_5_1, function(arg_14_0)
						arg_5_0:sendNotification(GAME.START_LOAD_SCENE, arg_14_0)

						var_5_3 = arg_14_0

						arg_13_0()
					end)
				end,
				function(arg_15_0)
					var_5_1:prepareLayer(arg_5_0.facade, nil, arg_5_1, function(arg_16_0)
						arg_5_0:sendNotification(GAME.WILL_LOAD_LAYERS, #arg_16_0)

						var_5_4 = arg_16_0

						arg_15_0()
					end)
				end
			}, arg_12_0)
		end,
		function(arg_17_0)
			var_5_1:enter(table.mergeArray({
				var_5_3
			}, var_5_4), arg_17_0)
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
	}, function(arg_18_0)
		return var_5_6[arg_18_0]
	end)

	seriesAsync(var_5_7, function()
		existCall(arg_5_4)
		pg.UIMgr.GetInstance():LoadingOff()
		arg_5_0:sendNotification(GAME.LOAD_SCENE_DONE, arg_5_1.scene)
	end)
end

function var_0_0.loadLayer(arg_20_0, arg_20_1, arg_20_2, arg_20_3, arg_20_4)
	assert(isa(arg_20_1, Context), "should be an instance of Context")

	local var_20_0 = pg.SceneMgr.GetInstance()
	local var_20_1 = {}
	local var_20_2

	seriesAsync({
		function(arg_21_0)
			pg.UIMgr.GetInstance():LoadingOn()

			if arg_20_3 ~= nil then
				table.ParallelIpairsAsync(arg_20_3, function(arg_22_0, arg_22_1, arg_22_2)
					var_20_0:removeLayerMediator(arg_20_0.facade, arg_22_1, function(arg_23_0)
						var_20_2 = var_20_2 or {}

						table.insertto(var_20_2, arg_23_0)
						arg_22_2()
					end)
				end, arg_21_0)
			else
				arg_21_0()
			end
		end,
		function(arg_24_0)
			var_20_0:prepareLayer(arg_20_0.facade, arg_20_2, arg_20_1, function(arg_25_0)
				for iter_25_0, iter_25_1 in ipairs(arg_25_0) do
					table.insert(var_20_1, iter_25_1)
				end

				arg_24_0()
			end)
		end,
		function(arg_26_0)
			if var_20_2 then
				table.SerialIpairsAsync(var_20_2, function(arg_27_0, arg_27_1, arg_27_2)
					var_20_0:remove(arg_27_1.mediator, function()
						arg_27_1.context:onContextRemoved()
						arg_27_2()
					end)
				end, arg_26_0)
			else
				arg_26_0()
			end
		end,
		function(arg_29_0)
			arg_20_0:sendNotification(GAME.WILL_LOAD_LAYERS, #var_20_1)
			var_20_0:enter(var_20_1, arg_29_0)
		end,
		function()
			if arg_20_4 then
				arg_20_4()
			end

			pg.UIMgr.GetInstance():LoadingOff()
			arg_20_0:sendNotification(GAME.LOAD_LAYER_DONE, arg_20_1)
		end
	})
end

function var_0_0.LoadLayerOnTopContext(arg_31_0)
	local var_31_0 = getProxy(ContextProxy):getCurrentContext()

	pg.m02:sendNotification(GAME.LOAD_LAYERS, {
		parentContext = var_31_0,
		context = arg_31_0
	})
end

function var_0_0.RemoveLayerByMediator(arg_32_0)
	local var_32_0 = getProxy(ContextProxy):getCurrentContext():getContextByMediator(arg_32_0)

	if var_32_0 then
		pg.m02:sendNotification(GAME.REMOVE_LAYERS, {
			context = var_32_0
		})

		return true
	end
end

return var_0_0
