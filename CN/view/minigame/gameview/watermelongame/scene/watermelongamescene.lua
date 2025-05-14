local var_0_0 = class("WatermelonGameScene")
local var_0_1 = 1
local var_0_2 = 2
local var_0_3 = 3
local var_0_4 = 4

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0._tf = arg_1_1
	arg_1_0._event = arg_1_2
	arg_1_0._gameVo = arg_1_3
	arg_1_0.sceneMask = findTF(arg_1_0._tf, "sceneMask")
	arg_1_0.sceneContainer = findTF(arg_1_0._tf, "sceneMask/sceneContainer")

	local function var_1_0(arg_2_0, arg_2_1)
		arg_1_0:onSceneEventCallback(arg_2_0, arg_2_1)
	end

	arg_1_0:showContainer(false)

	arg_1_0.physicsCtrl = WatermelonCollisionCtrl.New(arg_1_0.contextData, var_1_0)
	arg_1_0.ballCtrl = WatermelonBallCtrl.New(findTF(arg_1_0.sceneContainer, "scene/content/physics_content"), arg_1_0.contextData, var_1_0)

	arg_1_0.physicsCtrl:setGameVo(arg_1_0._gameVo)
	arg_1_0.ballCtrl:setGameVo(arg_1_0._gameVo)
	arg_1_0._event:bind(WatermelonGameEvent.CLICK_DOWN, function(arg_3_0, arg_3_1, arg_3_2)
		arg_1_0.ballCtrl:dropBall()
	end)
end

function var_0_0.onSceneEventCallback(arg_4_0, arg_4_1, arg_4_2)
	return
end

function var_0_0.start(arg_5_0)
	arg_5_0:showContainer(true)
	arg_5_0.physicsCtrl:start()
	arg_5_0.ballCtrl:start()
end

function var_0_0.step(arg_6_0, arg_6_1)
	arg_6_0.physicsCtrl:step(arg_6_1)
	arg_6_0.ballCtrl:step(arg_6_1)
end

function var_0_0.clear(arg_7_0)
	arg_7_0.physicsCtrl:clear()
	arg_7_0.ballCtrl:clear()
end

function var_0_0.stop(arg_8_0)
	arg_8_0.physicsCtrl:stop()
	arg_8_0.ballCtrl:stop()
end

function var_0_0.resume(arg_9_0)
	arg_9_0.physicsCtrl:resume()
	arg_9_0.ballCtrl:resume()
end

function var_0_0.dispose(arg_10_0)
	arg_10_0.physicsCtrl:dispose()
	arg_10_0.ballCtrl:dispose()
end

function var_0_0.showContainer(arg_11_0, arg_11_1)
	setActive(arg_11_0.sceneMask, arg_11_1)
end

return var_0_0
