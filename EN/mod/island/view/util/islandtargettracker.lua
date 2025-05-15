local var_0_0 = class("IslandTargetTracker")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0._tf = arg_1_1
	arg_1_0.distanceTr = findTF(arg_1_0._tf, "distance")
	arg_1_0.arrTr = findTF(arg_1_0.distanceTr, "arr")
	arg_1_0.distanceTxt = arg_1_0.distanceTr:Find("Text"):GetComponent(typeof(Text))

	setActive(arg_1_0.distanceTr, false)

	arg_1_0.screenSize = Vector2(Screen.width, Screen.height)
	arg_1_0.screenCenter = Vector2(arg_1_0.screenSize.x * 0.5, arg_1_0.screenSize.y * 0.5)
	arg_1_0.radiusOfEllipse = Vector2(200, 180)
	arg_1_0.lines = {}
end

function var_0_0.Tracking(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0:SetUp(arg_2_1, arg_2_2)
end

function var_0_0.UnTracking(arg_3_0)
	arg_3_0:Clear()
end

function var_0_0.SetUp(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0:ShutDown()
	setActive(arg_4_0.distanceTr, true)

	arg_4_0.timer = Timer.New(function()
		local var_5_0 = Vector3.Distance(arg_4_2.transform.position, arg_4_1.transform.position)

		setActive(arg_4_0.distanceTr, true)

		arg_4_0.distanceTxt.text = math.ceil(var_5_0) .. "M"

		local var_5_1 = arg_4_0:CalcPostion(arg_4_2.transform)

		arg_4_0.distanceTr.localPosition = var_5_1

		local var_5_2 = IslandCalcUtil.SignedAngle(Vector2.up, Vector2(var_5_1.x, var_5_1.y))

		arg_4_0.distanceTr.localEulerAngles = Vector3(0, 0, var_5_2)
	end, Time.deltaTime, -1)

	arg_4_0.timer:Start()
end

function var_0_0.CalcPostion(arg_6_0, arg_6_1)
	local var_6_0 = IslandCameraMgr.instance._mainCamera
	local var_6_1 = var_6_0:WorldToScreenPoint(arg_6_1.transform.position)
	local var_6_2 = var_6_0.gameObject.transform.forward
	local var_6_3 = (arg_6_1.transform.position - var_6_0.gameObject.transform.position).normalized

	if Vector3.Dot(var_6_2, var_6_3) <= 0 then
		local var_6_4 = arg_6_0.screenSize.x - var_6_1.x
		local var_6_5 = arg_6_0.screenSize.y - var_6_1.y

		var_6_1 = Vector3(var_6_4, var_6_5, 0)
		inSceneOut = true
	end

	local var_6_6 = Vector2(var_6_1.x, var_6_1.y) - arg_6_0.screenCenter

	if math.pow(var_6_6.x / arg_6_0.radiusOfEllipse.x, 2) + math.pow(var_6_6.y / arg_6_0.radiusOfEllipse.y, 2) > 1 then
		local var_6_7 = var_6_6.y / (var_6_6.x + 1e-07)
		local var_6_8 = Mathf.Pow(arg_6_0.radiusOfEllipse.x * arg_6_0.radiusOfEllipse.y, 2)
		local var_6_9 = Mathf.Pow(arg_6_0.radiusOfEllipse.y, 2) + Mathf.Pow(var_6_7, 2) * Mathf.Pow(arg_6_0.radiusOfEllipse.x, 2)
		local var_6_10 = math.sqrt(var_6_8 / var_6_9)

		if math.sign(var_6_10) ~= math.sign(var_6_6.x) then
			var_6_10 = -1 * var_6_10
		end

		local var_6_11 = var_6_10 * var_6_7

		return Vector2(var_6_10, var_6_11)
	else
		return var_6_6
	end
end

function var_0_0.DrawLine(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = IslandCalcUtil.GetNavPath(arg_7_1, arg_7_2)

	local function var_7_1(arg_8_0, arg_8_1)
		local var_8_0 = 1
		local var_8_1 = var_7_0[arg_8_1 + 1] or arg_7_2
		local var_8_2 = var_7_0[arg_8_1]
		local var_8_3 = (var_8_1 - var_8_2).normalized
		local var_8_4 = Quaternion.FromToRotation(arg_8_0.transform.right * -1, var_8_3)
		local var_8_5 = Vector3.Distance(var_8_1, var_8_2)

		return var_8_4, var_8_5
	end

	for iter_7_0, iter_7_1 in ipairs(var_7_0) do
		local var_7_2 = Object.Instantiate(arg_7_0.lineTpl)
		local var_7_3, var_7_4 = var_7_1(var_7_2, iter_7_0)

		var_7_2.transform.rotation = var_7_2.transform.rotation * var_7_3
		var_7_2.transform.localScale = Vector3(var_7_4, 1, 1)

		local var_7_5 = var_7_2.transform.right * -1 * (var_7_4 * 0.5)

		var_7_2.transform.position = iter_7_1 + var_7_5

		table.insert(arg_7_0.lines, var_7_2)
	end
end

function var_0_0.ClearLine(arg_9_0)
	for iter_9_0, iter_9_1 in pairs(arg_9_0.lines) do
		Object.Destroy(iter_9_1.gameObject)
	end

	arg_9_0.lines = {}
end

function var_0_0.ShutDown(arg_10_0)
	if arg_10_0.timer then
		arg_10_0.timer:Stop()

		arg_10_0.timer = nil
	end

	setActive(arg_10_0.distanceTr, false)
	arg_10_0:ClearLine()
end

function var_0_0.Clear(arg_11_0)
	arg_11_0:ShutDown()
end

function var_0_0.Dispose(arg_12_0)
	arg_12_0:Clear()
end

return var_0_0
