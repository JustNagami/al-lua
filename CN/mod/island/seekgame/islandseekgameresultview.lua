local var_0_0 = class("IslandSeekGameResultView", import("Mod.Island.Core.View.IslandBaseSubView"))

function var_0_0.GetUIName(arg_1_0)
	return "IslandSeekGameUI"
end

function var_0_0.FirstFlush(arg_2_0)
	arg_2_0:Hide()
	onButton(arg_2_0, arg_2_0._tf, function()
		arg_2_0:GetView():RestartGame()
		arg_2_0:Hide()
	end, SFX_PANEL)
end

return var_0_0
