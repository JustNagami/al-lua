local var_0_0 = class("IslandChatBubbleView", import("..IslandBaseSubView"))

function var_0_0.GetUIName(arg_1_0)
	return "IslandChatBubbleUI"
end

function var_0_0.Flush(arg_2_0)
	arg_2_0.pool = {}
	arg_2_0.runningPlayers = {}
end

function var_0_0.Enqueue(arg_3_0, arg_3_1)
	if #arg_3_0.pool >= 5 then
		return
	end

	table.insert(arg_3_0.pool, arg_3_1)
end

function var_0_0.Delqueue(arg_4_0)
	if #arg_4_0.pool == 0 then
		return IslandChatBubblePlayer.New(arg_4_0._go.transform)
	else
		return table.remove(arg_4_0.pool, 1)
	end
end

function var_0_0.Play(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	local var_5_0 = arg_5_0:Delqueue()
	local var_5_1 = pg.NewStoryMgr.GetInstance():GetScript(arg_5_1)
	local var_5_2 = IslandStory.New(var_5_1, arg_5_2, IslandStory.MODE_BUBBLE)

	var_5_0:Play(var_5_2, function()
		table.removebyvalue(arg_5_0.runningPlayers, var_5_0)
		arg_5_0:Enqueue(var_5_0)

		if arg_5_3 then
			arg_5_3()
		end
	end)
	table.insert(arg_5_0.runningPlayers, var_5_0)
end

function var_0_0.Stop(arg_7_0)
	for iter_7_0, iter_7_1 in ipairs(arg_7_0.runningPlayers) do
		iter_7_1:Stop()
	end

	arg_7_0.runningPlayers = {}
end

function var_0_0.OnDestroy(arg_8_0)
	arg_8_0:Stop()

	for iter_8_0, iter_8_1 in ipairs(arg_8_0.pool) do
		iter_8_1:Stop()
	end

	arg_8_0.pool = {}
end

return var_0_0
