local var_0_0 = class("PlayerInputManager")
local var_0_1 = require("Framework.toLua.UnityEngine.Vector3")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.inputController = IslandCameraMgr.instance.gameObject:GetComponent(typeof(InputController))
	arg_1_0.inputCommandQueue = {}

	function var_0_0.UpdateMoveFunc(arg_2_0)
		local var_2_0 = var_0_1(arg_2_0.x, 0, arg_2_0.y)
		local var_2_1 = arg_2_0.magnitude

		table.insert(arg_1_0.inputCommandQueue, {
			Execute = function()
				arg_1_1:NotifiyCore(ISLAND_EVT.MOVE_PLAYER, {
					targetDir = var_2_0,
					force = var_2_1
				})
			end
		})
	end

	arg_1_0.inputController:AddUpdateMoveFunc(var_0_0.UpdateMoveFunc)

	function var_0_0.CancelMoveFunc(arg_4_0)
		table.insert(arg_1_0.inputCommandQueue, {
			Execute = function()
				arg_1_1:NotifiyCore(ISLAND_EVT.STOP_MOVE_PLAYER)
			end
		})
	end

	arg_1_0.inputController:AddCancelMoveFunc(var_0_0.CancelMoveFunc)

	function var_0_0.UpdateJumpFunc(arg_6_0)
		table.insert(arg_1_0.inputCommandQueue, {
			Execute = function()
				arg_1_1:NotifiyCore(ISLAND_EVT.JUMP_PLAYER)
			end
		})
	end

	arg_1_0.inputController:AddUpdateJumpFunc(var_0_0.UpdateJumpFunc)

	function var_0_0.UpdateSprintFuc(arg_8_0)
		table.insert(arg_1_0.inputCommandQueue, {
			Execute = function()
				arg_1_1:NotifiyCore(ISLAND_EVT.SPRINT_PLAYER)
			end
		})
	end

	arg_1_0.inputController:AddUpdateSprintFunc(var_0_0.UpdateSprintFuc)

	function var_0_0.CancelSprintFuc(arg_10_0)
		table.insert(arg_1_0.inputCommandQueue, {
			Execute = function()
				arg_1_1:NotifiyCore(ISLAND_EVT.STOP_SPRINT_PLAYER)
			end
		})
	end

	arg_1_0.inputController:AddCancelSprintFunc(var_0_0.CancelSprintFuc)
end

function var_0_0.Update(arg_12_0)
	if #arg_12_0.inputCommandQueue == 0 then
		return
	end

	while #arg_12_0.inputCommandQueue > 0 do
		arg_12_0.inputCommandQueue[1]:Execute()
		table.remove(arg_12_0.inputCommandQueue, 1)
	end
end

function var_0_0.Dispose(arg_13_0)
	arg_13_0.inputController:RemoveUpdateMoveFunc(var_0_0.UpdateMoveFunc)
	arg_13_0.inputController:RemoveCancelMoveFunc(var_0_0.CancelMoveFunc)
	arg_13_0.inputController:RemoveUpdateJumpFunc(var_0_0.UpdateJumpFunc)
	arg_13_0.inputController:RemoveUpdateSprintFunc(var_0_0.UpdateSprintFuc)
	arg_13_0.inputController:RemoveCancelSprintFunc(var_0_0.CancelSprintFuc)

	arg_13_0.inputController = nil
end

return var_0_0
