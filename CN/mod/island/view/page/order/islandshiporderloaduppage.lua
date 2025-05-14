local var_0_0 = class("IslandShipOrderLoadUpPage", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "IslandShipOrderLoadUpUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.itemTr = arg_2_0:findTF("award")
	arg_2_0.cntTxt = arg_2_0:findTF("count/Text"):GetComponent(typeof(Text))
	arg_2_0.uiAwardList = UIItemList.New(arg_2_0:findTF("list"), arg_2_0:findTF("list/tpl"))
	arg_2_0.submitBtn = arg_2_0:findTF("btn")

	setText(arg_2_0:findTF("title/Text"), i18n1("装载奖励"))
	setText(arg_2_0:findTF("btn/Text"), i18n1("装载"))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0.submitBtn, function()
		if not arg_3_0.slot or not arg_3_0.index then
			return
		end

		arg_3_0:emit(IslandMediator.SUBMIT_SHIP_ORDER_ITME, arg_3_0.slot.id, arg_3_0.index)
	end, SFX_PANEL)
end

function var_0_0.Show(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	var_0_0.super.Show(arg_5_0)

	arg_5_0.slot = arg_5_2
	arg_5_0.index = arg_5_3
	arg_5_0._tf.localPosition = arg_5_1

	local var_5_0 = arg_5_2:GetOrder():GetComsume(arg_5_3)
	local var_5_1 = Drop.New(var_5_0)

	updateDrop(arg_5_0.itemTr, var_5_1)

	arg_5_0.cntTxt.text = var_5_1:getOwnedCount() .. "/" .. var_5_1.count

	arg_5_0:UpdateAwards(arg_5_2, arg_5_3)
end

function var_0_0.UpdateAwards(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = arg_6_1:GetOrder():GetConsumeAwards(arg_6_2)

	arg_6_0.uiAwardList:make(function(arg_7_0, arg_7_1, arg_7_2)
		if arg_7_0 == UIItemList.EventUpdate then
			local var_7_0 = Drop.New(var_6_0[arg_7_1 + 1])

			GetImageSpriteFromAtlasAsync(var_7_0.cfg.icon, "", arg_7_2:Find("icon"))
			setText(arg_7_2:Find("Text"), "X" .. var_7_0.count)
		end
	end)
	arg_6_0.uiAwardList:align(#var_6_0)
end

function var_0_0.OnDestroy(arg_8_0)
	return
end

return var_0_0
