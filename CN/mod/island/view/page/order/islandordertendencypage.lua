local var_0_0 = class("IslandOrderTendencyPage", import("Mod.Island.View.page.msgbox.window.IslandCommonMsgboxWindow"))

function var_0_0.getUIName(arg_1_0)
	return "IslandOrderTendencyUI"
end

function var_0_0.OnLoaded(arg_2_0)
	var_0_0.super.OnLoaded(arg_2_0)

	arg_2_0.toggles = {
		[IslandOrderSlot.TENDENCY_TYPE_COMMON] = arg_2_0:findTF("toggle/1"),
		[IslandOrderSlot.TENDENCY_TYPE_EASY] = arg_2_0:findTF("toggle/0"),
		[IslandOrderSlot.TENDENCY_TYPE_HARD] = arg_2_0:findTF("toggle/2")
	}

	setText(arg_2_0:findTF("toggle/0/Text"), i18n1("更易完成"))
	setText(arg_2_0:findTF("toggle/1/Text"), i18n1("标准"))
	setText(arg_2_0:findTF("toggle/2/Text"), i18n1("更具挑战"))
end

function var_0_0.OnInit(arg_3_0)
	var_0_0.super.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0.confirmBtn, function()
		if arg_3_0.onYes then
			arg_3_0.onYes(arg_3_0.selectedIndex)
		end

		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0._tf, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
end

function var_0_0.Show(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = {
		onYes = arg_6_2,
		title = i18n1("订单倾向")
	}

	var_0_0.super.Show(arg_6_0, var_6_0)

	arg_6_0.selectedIndex = arg_6_1 or IslandOrderSlot.TENDENCY_TYPE_COMMON

	arg_6_0:FlushToggles()
end

function var_0_0.Hide(arg_7_0)
	setActive(arg_7_0._tf, false)
	arg_7_0:OnHide()

	arg_7_0.settings = nil
end

function var_0_0.FlushToggles(arg_8_0)
	for iter_8_0, iter_8_1 in pairs(arg_8_0.toggles) do
		onToggle(arg_8_0, iter_8_1, function(arg_9_0)
			if arg_9_0 then
				arg_8_0.selectedIndex = iter_8_0

				arg_8_0:UpdateContent()
			end
		end, SFX_PANEL)
	end

	triggerToggle(arg_8_0.toggles[arg_8_0.selectedIndex], true)
end

function var_0_0.UpdateContent(arg_10_0)
	local var_10_0 = IslandOrderSlot.TENDENCY2TIP(arg_10_0.selectedIndex)

	arg_10_0.contentTxt.text = var_10_0
end

return var_0_0
