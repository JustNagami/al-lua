local var_0_0 = class("BoatAdCharControl")
local var_0_1
local var_0_2

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	var_0_1 = BoatAdGameVo
	var_0_2 = BoatAdGameConst
	arg_1_0._bgContent = arg_1_1
	arg_1_0._eventCall = arg_1_2
	arg_1_0._charContent = findTF(arg_1_0._bgContent, "scene/content")

	local var_1_0 = var_0_2.game_char[var_0_1.char_id]
	local var_1_1 = var_0_1.GetGameTplTf(var_1_0.tpl)

	arg_1_0._char = BoatAdChar.New(var_1_1, arg_1_0._eventCall)

	arg_1_0._char:setData(var_1_0)
	arg_1_0._char:setContent(arg_1_0._charContent)
end

function var_0_0.start(arg_2_0)
	var_0_1.SetGameChar(arg_2_0._char)
	arg_2_0._char:start()
end

function var_0_0.step(arg_3_0, arg_3_1)
	local var_3_0 = var_0_1.joyStickData
	local var_3_1 = 0
	local var_3_2 = 0
	local var_3_3 = 0
	local var_3_4 = 0

	if var_3_0 and var_3_0.active then
		local var_3_5, var_3_6 = var_3_0.x, var_3_0.y

		var_3_3 = var_3_0.directX, var_3_0.directY

		if math.abs(var_3_5) < 0.2 then
			var_3_3 = 0
		end

		if math.abs(var_3_6) < 0.2 then
			local var_3_7 = 0
		end
	end

	arg_3_0._char:changeDirect(var_3_3, 0)
	arg_3_0._char:step(arg_3_1)

	if not arg_3_0._char:getLife() then
		arg_3_0._eventCall(BoatAdGameEvent.PLAYER_DEAD, true)
	end
end

function var_0_0.stop(arg_4_0)
	arg_4_0._char:stop()
end

function var_0_0.resume(arg_5_0)
	arg_5_0._char:resume()
end

function var_0_0.clear(arg_6_0)
	arg_6_0._char:clear()
end

function var_0_0.dispose(arg_7_0)
	return
end

function var_0_0.onEventCall(arg_8_0, arg_8_1, arg_8_2)
	if arg_8_1 == BoatAdGameEvent.PLAYER_EVENT_DAMAGE then
		arg_8_0._char:damage(arg_8_2)
	end
end

return var_0_0
