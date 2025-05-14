local var_0_0 = class("SharedIslandScene", import("..View.base.IslandBaseScene"))

function var_0_0.getUIName(arg_1_0)
	return "SharedIslandUI"
end

function var_0_0.GetIsland(arg_2_0)
	return getProxy(IslandProxy):GetSharedIsland()
end

function var_0_0.init(arg_3_0)
	arg_3_0.homeBtn = arg_3_0:findTF("top/home")
	arg_3_0.levelTxt = arg_3_0:findTF("top/level_panel/level"):GetComponent(typeof(Text))
	arg_3_0.expTr = arg_3_0:findTF("top/level_panel/exp")
	arg_3_0.nameTxt = arg_3_0:findTF("top/level_panel/name"):GetComponent(typeof(Text))
	arg_3_0.prosperityTxt = arg_3_0:findTF("top/level_panel/prosperity/Text"):GetComponent(typeof(Text))
	arg_3_0.prosperityLabel = arg_3_0:findTF("top/level_panel/prosperity"):GetComponent(typeof(Text))
end

function var_0_0.didEnter(arg_4_0)
	onButton(arg_4_0, arg_4_0.homeBtn, function()
		arg_4_0:emit(BaseUI.ON_HOME)
	end, SFX_PANEL)
	arg_4_0:StartCore()
	arg_4_0:UpdateIslandInfo()
end

function var_0_0.UpdateIslandInfo(arg_6_0)
	local var_6_0 = arg_6_0:GetIsland()

	arg_6_0.levelTxt.text = var_6_0:GetLevel()
	arg_6_0.nameTxt.text = var_6_0:GetName()

	if var_6_0:IsMaxLevel() then
		setFillAmount(arg_6_0.expTr, 1)
	else
		setFillAmount(arg_6_0.expTr, var_6_0:GetExp() / var_6_0:GetTargeExp())
	end

	if var_6_0:CanAddProsperity() then
		arg_6_0.prosperityTxt.text = var_6_0:GetProsperity() .. "/" .. var_6_0:GetTargetProsperity()
	else
		arg_6_0.prosperityTxt.text = "MAX"
	end

	arg_6_0.prosperityLabel.text = i18n1("繁荣度")
end

function var_0_0.willExit(arg_7_0)
	return
end

function var_0_0.onBackPressed(arg_8_0)
	arg_8_0:emit(var_0_0.ON_BACK_PRESSED)
end

return var_0_0
