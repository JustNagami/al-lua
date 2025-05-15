local var_0_0 = class("SyncUnitMovable", import(".SyncUnit"))

var_0_0.OWNER_TYPE_CLIENT = 1
var_0_0.OWNER_TYPE_SERVER = 2
var_0_0.OWNER_TYPE_NONE = 3

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_0.super.Ctor(arg_1_0, arg_1_1)

	arg_1_0.sceneObject = arg_1_2
	arg_1_0.delayTime = 0
	arg_1_0.syncData = nil
end

function var_0_0.UpdateOwner(arg_2_0, arg_2_1)
	return
end

function var_0_0.UpdateSyncData(arg_3_0, arg_3_1)
	arg_3_0.syncData = arg_3_1
	arg_3_0.delayTime = IslandConst.SYNC_TIME_INTERVAL
end

function var_0_0.SetTempSyncData(arg_4_0, arg_4_1)
	arg_4_0.tempSyncData = arg_4_1
end

function var_0_0.RestoreTempSyncData(arg_5_0)
	if not arg_5_0.tempSyncData then
		return
	end

	arg_5_0:UpdateSyncData(arg_5_0.tempSyncData)

	arg_5_0.tempSyncData = nil
end

function var_0_0.CreateSyncData(arg_6_0)
	return (SyncUnitData.New({
		id = arg_6_0.id,
		pos = arg_6_0:GetLocalPosition(),
		dir = arg_6_0:GetRotation(),
		status = arg_6_0:GetStatus()
	}))
end

function var_0_0.GetStatus(arg_7_0)
	return nil
end

function var_0_0.Update(arg_8_0)
	if arg_8_0.delayTime == 0 then
		return
	end

	arg_8_0:MoveHandle()
	arg_8_0:AnimHandle()
end

function var_0_0.MoveHandle(arg_9_0)
	local var_9_0 = arg_9_0.delayTime - Time.deltaTime
	local var_9_1 = Time.deltaTime / arg_9_0.delayTime
	local var_9_2
	local var_9_3

	if var_9_0 > 0 then
		var_9_2 = Vector3.Lerp(arg_9_0:GetLocalPosition(), arg_9_0.syncData.pos, var_9_1)
		var_9_3 = Quaternion.Lerp(arg_9_0:GetRotation(), arg_9_0:GetSyncDataRotation(), var_9_1)
		arg_9_0.delayTime = var_9_0
	else
		var_9_2 = arg_9_0.syncData.pos
		var_9_3 = arg_9_0:GetSyncDataRotation()
		arg_9_0.delayTime = 0
	end

	local var_9_4 = (var_9_2 - arg_9_0:GetLocalPosition()) / Time.deltaTime

	arg_9_0.speed = Vector2(var_9_4.x, var_9_4.z).magnitude

	arg_9_0:SetLocalPosition(var_9_2)
	arg_9_0:SetRotation(var_9_3)
end

function var_0_0.AnimHandle(arg_10_0)
	return
end

function var_0_0.IsClient(arg_11_0)
	return arg_11_0.ownerType == SyncUnitMovable.OWNER_TYPE_CLIENT
end

function var_0_0.IsServer(arg_12_0)
	return arg_12_0.ownerType == SyncUnitMovable.OWNER_TYPE_SERVER
end

function var_0_0.IsLoaded(arg_13_0)
	return arg_13_0.sceneObject and arg_13_0.sceneObject:IsLoaded()
end

function var_0_0.GetSyncDataRotation(arg_14_0)
	return arg_14_0.syncData.dir
end

function var_0_0.GetLocalPosition(arg_15_0)
	return arg_15_0.sceneObject._go.transform.localPosition
end

function var_0_0.GetRotation(arg_16_0)
	return arg_16_0.sceneObject._go.transform.rotation
end

function var_0_0.SetLocalPosition(arg_17_0, arg_17_1)
	arg_17_0.sceneObject._go.transform.localPosition = arg_17_1
end

function var_0_0.SetRotation(arg_18_0, arg_18_1)
	arg_18_0.sceneObject._go.transform.rotation = arg_18_1
end

return var_0_0
