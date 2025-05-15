local var_0_0 = class("IslandUpgradeDisplayPage", import("...base.IslandBasePage"))
local var_0_1 = 1
local var_0_2 = 2

function var_0_0.getUIName(arg_1_0)
	return "IslandUpgradeDisplayUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.panels = {
		[var_0_1] = arg_2_0:findTF("single"),
		[var_0_2] = arg_2_0:findTF("multi")
	}
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0._tf, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
end

function var_0_0.GetPanelType(arg_5_0, arg_5_1)
	if #arg_5_1:GetUnlockBuildingList() > 0 then
		return var_0_2
	else
		return var_0_1
	end
end

function var_0_0.Show(arg_6_0, arg_6_1)
	var_0_0.super.Show(arg_6_0)

	local var_6_0 = getProxy(IslandProxy):GetIsland()
	local var_6_1 = arg_6_0:GetPanelType(var_6_0)

	arg_6_0:InitPanel(var_6_0, arg_6_1, var_6_1)
	pg.UIMgr.GetInstance():OverlayPanel(arg_6_0._tf, {
		weight = LayerWeightConst.TOP_LAYER
	})
end

function var_0_0.Hide(arg_7_0)
	var_0_0.super.Hide(arg_7_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_7_0._tf, arg_7_0._parentTf)
end

function var_0_0.InitPanel(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	local var_8_0 = arg_8_0.panels[arg_8_3]

	for iter_8_0, iter_8_1 in pairs(arg_8_0.panels) do
		setActive(iter_8_1, arg_8_3 == iter_8_0)
	end

	if var_0_2 == arg_8_3 then
		arg_8_0:UpdateMultiPanel(arg_8_1, arg_8_2, var_8_0)
	elseif var_0_1 == arg_8_3 then
		arg_8_0:UpdateSinglePanel(arg_8_1, arg_8_2, var_8_0)
	end
end

local function var_0_3(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = arg_9_0:GetLevel()

	setText(arg_9_2:Find("prev"), "Lv.<size=50>" .. var_9_0 - 1 .. "</size>")
	setText(arg_9_2:Find("next"), "Lv.<size=50>" .. var_9_0 .. "</size>")

	local var_9_1 = UIItemList.New(arg_9_2:Find("award/content"), arg_9_2:Find("award/content/tpl"))

	var_9_1:make(function(arg_10_0, arg_10_1, arg_10_2)
		if arg_10_0 == UIItemList.EventUpdate then
			local var_10_0 = arg_9_1[arg_10_1 + 1]

			updateDrop(arg_10_2, var_10_0)
		end
	end)
	var_9_1:align(#arg_9_1)
end

function var_0_0.UpdateMultiPanel(arg_11_0, arg_11_1, arg_11_2, arg_11_3)
	var_0_3(arg_11_1, arg_11_2, arg_11_3)

	local var_11_0 = arg_11_1:GetUnlockBuildingList()
	local var_11_1 = UIItemList.New(arg_11_3:Find("unlock/content"), arg_11_3:Find("award/content/tpl"))

	var_11_1:make(function(arg_12_0, arg_12_1, arg_12_2)
		if arg_12_0 == UIItemList.EventUpdate then
			local var_12_0 = var_11_0[arg_12_1 + 1]
			local var_12_1 = Drop.Create(var_12_0)

			updateDrop(arg_12_2, var_12_1)
		end
	end)
	var_11_1:align(#var_11_0)
end

function var_0_0.UpdateSinglePanel(arg_13_0, arg_13_1, arg_13_2, arg_13_3)
	var_0_3(arg_13_1, arg_13_2, arg_13_3)
end

function var_0_0.OnDestroy(arg_14_0)
	return
end

return var_0_0
