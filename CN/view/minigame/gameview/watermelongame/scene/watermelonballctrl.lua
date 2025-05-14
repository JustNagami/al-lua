local var_0_0 = class("WatermelonBallCtrl")

var_0_0.ball_data = {
	{
		id = 1,
		size = 35,
		next_id = 2
	},
	{
		id = 2,
		size = 50,
		next_id = 3
	},
	{
		id = 3,
		size = 65,
		next_id = 4
	},
	{
		id = 4,
		size = 80,
		next_id = 5
	},
	{
		id = 5,
		size = 95,
		next_id = 6
	},
	{
		id = 6,
		size = 110,
		next_id = 7
	},
	{
		id = 7,
		size = 125,
		next_id = 8
	},
	{
		id = 8,
		size = 140,
		next_id = 9
	},
	{
		id = 9,
		size = 155,
		next_id = 10
	},
	{
		id = 10,
		size = 170
	}
}
var_0_0.drop_ball_ids = {
	{
		id = 1,
		weight = 30
	},
	{
		id = 2,
		weight = 40
	},
	{
		id = 3,
		weight = 20
	},
	{
		id = 4,
		weight = 10
	}
}
var_0_0.tpl_ball = "ball"
var_0_0.ball_count_id = 0

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0._content = arg_1_1
	arg_1_0._contextData = arg_1_2
	arg_1_0._event = arg_1_3
	arg_1_0._startPos = findTF(arg_1_0._content, "start_pos")
	arg_1_0._rayTf = findTF(arg_1_0._startPos, "ray")
	arg_1_0._left = findTF(arg_1_0._content, "left")
	arg_1_0._right = findTF(arg_1_0._content, "right")
	arg_1_0._container = findTF(arg_1_0._content, "container")
	arg_1_0._tempRect = findTF(arg_1_0._container, "temp_rect")
	arg_1_0.leftPos = arg_1_0._left.anchoredPosition.x
	arg_1_0.rightPos = arg_1_0._right.anchoredPosition.x
	arg_1_0._balls = {}
	arg_1_0._layerMask = LayerMask.GetMask("UI")
end

function var_0_0.setGameVo(arg_2_0, arg_2_1)
	arg_2_0._gameVo = arg_2_1
end

function var_0_0.start(arg_3_0)
	arg_3_0:clear()

	arg_3_0.createBallCd = 0
end

function var_0_0.step(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_0._gameVo:getJoyStickData()

	if var_4_0 and var_4_0.active and var_4_0.directX and var_4_0.directX ~= 0 then
		arg_4_0:move(var_4_0.directX)
	end

	if not arg_4_0.readyBall then
		if not arg_4_0.createBallCd then
			arg_4_0:setCreateCd()
		end

		if arg_4_0.createBallCd and arg_4_0.createBallCd >= 0 then
			arg_4_0.createBallCd = arg_4_0.createBallCd - arg_4_0._gameVo.deltaTime

			if arg_4_0.createBallCd <= 0 then
				arg_4_0.createBallCd = nil

				arg_4_0:createReadyBall()
			end
		end
	else
		arg_4_0.readyBall.tf.anchoredPosition = arg_4_0._startPos.anchoredPosition

		local var_4_1 = Physics2D.Raycast(arg_4_0._startPos.position, Vector2(0, -1))

		if var_4_1 and var_4_1.transform then
			local var_4_2 = arg_4_0._startPos:InverseTransformPoint(Vector2(var_4_1.point.x, var_4_1.point.y, 0))

			arg_4_0._rayTf.sizeDelta = Vector2(arg_4_0._rayTf.sizeDelta.x, math.abs(var_4_2.y))
		end
	end

	local var_4_3 = arg_4_0.readyBall and true or false

	if isActive(arg_4_0._rayTf) ~= var_4_3 then
		setActive(arg_4_0._rayTf, var_4_3)
	end
end

function var_0_0.clear(arg_5_0)
	arg_5_0.countId = WatermelonBallCtrl.ball_count_id

	arg_5_0:clearBallContainer()
end

function var_0_0.stop(arg_6_0)
	return
end

function var_0_0.resume(arg_7_0)
	return
end

function var_0_0.dispose(arg_8_0)
	return
end

function var_0_0.move(arg_9_0, arg_9_1)
	if not arg_9_0.readyBall then
		return
	end

	local var_9_0 = arg_9_0._startPos.anchoredPosition

	if arg_9_1 > 0 then
		var_9_0.x = var_9_0.x + arg_9_0._gameVo.deltaTime * 200
		arg_9_0._startPos.anchoredPosition = var_9_0
	elseif arg_9_1 < 0 then
		var_9_0.x = var_9_0.x - arg_9_0._gameVo.deltaTime * 200
		arg_9_0._startPos.anchoredPosition = var_9_0
	end
end

function var_0_0.dropBall(arg_10_0)
	if arg_10_0.readyBall then
		arg_10_0:setBallPhysics(arg_10_0.readyBall, true)
		arg_10_0:setBallEvent(arg_10_0.readyBall)
		table.insert(arg_10_0._balls, arg_10_0.readyBall)

		arg_10_0.readyBall = nil
	end
end

function var_0_0.createReadyBall(arg_11_0)
	local var_11_0 = arg_11_0._gameVo:getTplItemFromPool("ball", arg_11_0._container)

	var_11_0.anchoredPosition = arg_11_0._startPos.anchoredPosition
	arg_11_0.readyBall = arg_11_0:initBallData(var_11_0)

	arg_11_0:setBallPhysics(arg_11_0.readyBall, false)
end

function var_0_0.createMegerBall(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = arg_12_0._gameVo:getTplItemFromPool("ball", arg_12_0._container)

	var_12_0.position = Vector3(arg_12_2.x, arg_12_2.y, 0)

	local var_12_1 = arg_12_0:initBallData(var_12_0, arg_12_1)

	table.insert(arg_12_0._balls, var_12_1)
	arg_12_0:setBallEvent(var_12_1)
end

function var_0_0.setBallEvent(arg_13_0, arg_13_1)
	arg_13_0.physicsCollision = GetComponent(arg_13_1.tf, "Physics2dCollisionListener")

	arg_13_0.physicsCollision:Clear()
	arg_13_0.physicsCollision:SetEnterCall(System.Action_UnityEngine_Collision2D(function(arg_14_0)
		local var_14_0 = arg_13_0:getBallByName(arg_14_0.collider.transform.name)
		local var_14_1 = arg_13_0:getBallByName(arg_14_0.otherCollider.transform.name)

		if arg_13_0:checkColliderBall(var_14_0, var_14_1) and var_14_0.next and var_14_1.next then
			arg_13_0:removeBall(var_14_0)
			arg_13_0:removeBall(var_14_1)

			local var_14_2 = var_14_0.next
			local var_14_3 = arg_14_0:GetContact(0)

			arg_13_0:createMegerBall(var_14_2, var_14_3.point)
		end
	end))
end

function var_0_0.setBallPhysics(arg_15_0, arg_15_1, arg_15_2)
	GetComponent(arg_15_1.tf, "Rigidbody2D").simulated = arg_15_2
end

function var_0_0.removeBall(arg_16_0, arg_16_1)
	for iter_16_0 = #arg_16_0._balls, 1, -1 do
		if arg_16_0._balls[iter_16_0] == arg_16_1 then
			local var_16_0 = table.remove(arg_16_0._balls, iter_16_0)

			arg_16_0._gameVo:returnTplItem("ball", var_16_0.tf)

			return true
		end
	end

	print("移除ball失败 name = " .. arg_16_1.name)

	return false
end

function var_0_0.checkColliderBall(arg_17_0, arg_17_1, arg_17_2)
	if arg_17_1 and arg_17_2 and arg_17_1.id == arg_17_2.id and arg_17_1.next and arg_17_2.next then
		return true
	end

	return false
end

function var_0_0.getBallByName(arg_18_0, arg_18_1)
	for iter_18_0 = 1, #arg_18_0._balls do
		local var_18_0 = arg_18_0._balls[iter_18_0]

		if var_18_0.name == arg_18_1 then
			return var_18_0
		end
	end

	return nil
end

function var_0_0.clearBallContainer(arg_19_0)
	for iter_19_0 = 1, #arg_19_0._balls do
		arg_19_0._gameVo:returnTplItem("ball", arg_19_0._balls[iter_19_0].tf)
	end

	arg_19_0._balls = {}
end

function var_0_0.setCreateCd(arg_20_0)
	arg_20_0.createBallCd = arg_20_0._gameVo.createBallCd
end

function var_0_0.initBallData(arg_21_0, arg_21_1, arg_21_2)
	local var_21_0 = arg_21_2 and arg_21_2 or arg_21_0:getRandomIdByWeight()
	local var_21_1 = WatermelonBallCtrl.ball_data[var_21_0]

	GetComponent(arg_21_1, typeof(UnityEngine.CircleCollider2D)).radius = var_21_1.size

	arg_21_0:setChildVisible(findTF(arg_21_1, "size_image"), false)
	setActive(findTF(arg_21_1, "size_image/" .. var_21_0), true)

	arg_21_0.countId = arg_21_0.countId + 1
	arg_21_1.name = "ball_" .. arg_21_0.countId

	setActive(arg_21_1, true)

	return {
		id = var_21_1.id,
		tf = arg_21_1,
		count = arg_21_0.countId,
		name = arg_21_1.name,
		next = var_21_1.next_id
	}
end

function var_0_0.getRandomIdByWeight(arg_22_0)
	if not arg_22_0.weightTotal then
		arg_22_0.weightTotal = 0
		arg_22_0.weightList = {}
		arg_22_0.weightIdList = {}

		for iter_22_0 = 1, #WatermelonBallCtrl.drop_ball_ids do
			arg_22_0.weightTotal = arg_22_0.weightTotal + WatermelonBallCtrl.drop_ball_ids[iter_22_0].weight

			table.insert(arg_22_0.weightList, arg_22_0.weightTotal)
			table.insert(arg_22_0.weightIdList, WatermelonBallCtrl.drop_ball_ids[iter_22_0].id)
		end
	end

	local var_22_0 = math.random(1, arg_22_0.weightTotal)

	for iter_22_1 = 1, #arg_22_0.weightList do
		if var_22_0 <= arg_22_0.weightList[iter_22_1] or iter_22_1 == #arg_22_0.weightList then
			return arg_22_0.weightIdList[iter_22_1]
		end
	end

	return nil
end

function var_0_0.setChildVisible(arg_23_0, arg_23_1, arg_23_2)
	for iter_23_0 = 1, arg_23_1.childCount do
		local var_23_0 = arg_23_1:GetChild(iter_23_0 - 1)

		setActive(var_23_0, arg_23_2)
	end
end

return var_0_0
