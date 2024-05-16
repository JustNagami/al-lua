pg = pg or {}
slot0 = pg
slot0.NodeCanvasMgr = singletonClass("NodeCanvasMgr")
slot1 = slot0.NodeCanvasMgr

function slot1.Ctor(slot0)
	slot0:Clear()
end

function slot1.Init(slot0, slot1)
	print("initializing NodeCanvas manager...")
	existCall(slot1)
end

function slot1.SetOwner(slot0, slot1)
	assert(not slot0.mainOwner)

	slot0.mainOwner = GetComponent(slot1, "GraphOwner")
	slot0.mainBlackboard = GetComponent(slot1, "Blackboard")
end

function slot1.SetBlackboradValue(slot0, slot1, slot2, slot3)
	if slot2 == nil then
		(slot3 or slot0.mainBlackboard):RemoveVariable(slot1)
	else
		slot3:SetVariableValue(slot1, slot2)
	end
end

function slot1.SendEvent(slot0, slot1, slot2, slot3)
	if slot2 == nil then
		(slot3 or slot0.mainOwner):SendEvent(slot1)
	else
		slot3:SendEvent(slot1, slot2, nil)
	end
end

function slot1.SendGlobalEvent(slot0, slot1, slot2)
	slot0.mainOwner.graph:SendGlobalEvent(slot1, slot2, nil)
end

function slot1.RegisterFunc(slot0, slot1, slot2)
	slot0.functionDic[slot1] = slot2
end

function slot1.CallFunc(slot0, slot1, ...)
	assert(slot0.functionDic[slot1], "with out register call:" .. slot1)
	slot0.functionDic[slot1](...)
end

function slot1.Clear(slot0)
	slot0.mainOwner = nil
	slot0.functionDic = {}
end

function LuaActionTaskCall(slot0, ...)
	assert(uv0.NodeCanvasMgr.GetInstance() and slot1.mainOwner)
	slot1:CallFunc(slot0, ...)
end
