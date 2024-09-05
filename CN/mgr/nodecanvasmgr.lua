pg = pg or {}

local var_0_0 = pg

var_0_0.NodeCanvasMgr = singletonClass("NodeCanvasMgr")

local var_0_1 = var_0_0.NodeCanvasMgr

function var_0_1.Ctor(arg_1_0)
	arg_1_0:Clear()
end

function var_0_1.Init(arg_2_0, arg_2_1)
	print("initializing NodeCanvas manager...")
	existCall(arg_2_1)
end

function var_0_1.SetOwner(arg_3_0, arg_3_1)
	assert(not arg_3_0.mainOwner)

	arg_3_0.mainOwner = GetComponent(arg_3_1, "GraphOwner")
	arg_3_0.mainBlackboard = GetComponent(arg_3_1, "Blackboard")
end

function var_0_1.SetBlackboradValue(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	arg_4_3 = arg_4_3 or arg_4_0.mainBlackboard

	if arg_4_2 == nil then
		arg_4_3:RemoveVariable(arg_4_1)
	else
		arg_4_3:SetVariableValue(arg_4_1, arg_4_2)
	end
end

function var_0_1.GetBlackboradValue(arg_5_0, arg_5_1, arg_5_2)
	arg_5_2 = arg_5_2 or arg_5_0.mainBlackboard

	return arg_5_2:GetVariable(arg_5_1).value
end

function var_0_1.SendEvent(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	arg_6_3 = arg_6_3 or arg_6_0.mainOwner

	if arg_6_2 == nil then
		arg_6_3:SendEvent(arg_6_1)
	else
		arg_6_3:SendEvent(arg_6_1, arg_6_2, nil)
	end
end

function var_0_1.SendGlobalEvent(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0.mainOwner.graph:SendGlobalEvent(arg_7_1, arg_7_2, nil)
end

function var_0_1.RegisterFunc(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0.functionDic[arg_8_1] = arg_8_2
end

function var_0_1.CallFunc(arg_9_0, arg_9_1, ...)
	assert(arg_9_0.functionDic[arg_9_1], "with out register call:" .. arg_9_1)
	arg_9_0.functionDic[arg_9_1](...)
end

function var_0_1.Clear(arg_10_0)
	arg_10_0.mainOwner = nil
	arg_10_0.functionDic = {}
end

function LuaActionTaskCall(arg_11_0, ...)
	local var_11_0 = var_0_0.NodeCanvasMgr.GetInstance()

	assert(var_11_0 and var_11_0.mainOwner)
	var_11_0:CallFunc(arg_11_0, ...)
end
