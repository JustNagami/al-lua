local var_0_0 = class("MonopolyCar2024BubblePage")

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.event = arg_1_2
	arg_1_0._tf = arg_1_1
	arg_1_0.head = findTF(arg_1_1, "head"):GetComponent(typeof(Image))
	arg_1_0.content = findTF(arg_1_1, "chat/Text"):GetComponent(typeof(Text))
	arg_1_0.anim = arg_1_0._tf:GetComponent(typeof(Animation))
	arg_1_0.animEvent = arg_1_0.anim:GetComponent(typeof(DftAniEvent))

	arg_1_0.animEvent:SetEndEvent(function()
		setActive(arg_1_0._tf, false)
	end)

	arg_1_0.showTime = pg.gameset.monopoly2024_bubble_time.key_value

	setActive(arg_1_0._tf, false)
end

function var_0_0.emit(arg_3_0, ...)
	arg_3_0.event:emit(...)
end

function var_0_0.Show(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	setActive(arg_4_0._tf, true)
	arg_4_0.anim:Play("anim_monopolycar_bubble_show")

	local var_4_0 = GetSpriteFromAtlas("ui/MonopolyCar2024_atlas", arg_4_2)

	arg_4_0.head.sprite = var_4_0

	arg_4_0.head:SetNativeSize()

	local var_4_1 = pg.activity_event_monopoly_dialogue[arg_4_3].dialogue

	arg_4_0.content.text = var_4_1

	arg_4_0:AddTimer()
	arg_4_0:emit(MonopolyCar2024Mediator.ON_DIALOGUE, arg_4_1, arg_4_3)
end

function var_0_0.AddTimer(arg_5_0)
	arg_5_0:RemoveTimer()

	arg_5_0.timer = Timer.New(function()
		arg_5_0:RemoveTimer()
		arg_5_0:Hide()
	end, arg_5_0.showTime, 1)

	arg_5_0.timer:Start()
end

function var_0_0.RemoveTimer(arg_7_0)
	if arg_7_0.timer then
		arg_7_0.timer:Stop()

		arg_7_0.timer = nil
	end
end

function var_0_0.Hide(arg_8_0)
	arg_8_0.anim:Play("anim_monopolycar_bubble_hide")
end

function var_0_0.Dispose(arg_9_0)
	arg_9_0:RemoveTimer()
end

return var_0_0
