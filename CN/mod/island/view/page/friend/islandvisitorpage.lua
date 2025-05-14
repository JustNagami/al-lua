local var_0_0 = class("IslandVisitorPage", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandVisitorUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.uiItemList = UIItemList.New(arg_2_0:findTF("scrollrect/content"), arg_2_0:findTF("scrollrect/content/tpl"))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0._tf, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
end

function var_0_0.AddListeners(arg_5_0)
	arg_5_0:AddListener(IslandVisitorAgency.PLAYER_ADD, arg_5_0.OnFlush)
	arg_5_0:AddListener(IslandVisitorAgency.PLAYER_EXIT, arg_5_0.OnFlush)
end

function var_0_0.RemoveListeners(arg_6_0)
	arg_6_0:RemoveListener(IslandVisitorAgency.PLAYER_ADD, arg_6_0.OnFlush)
	arg_6_0:RemoveListener(IslandVisitorAgency.PLAYER_EXIT, arg_6_0.OnFlush)
end

function var_0_0.Show(arg_7_0)
	var_0_0.super.Show(arg_7_0)
	arg_7_0:OnFlush()
end

function var_0_0.OnFlush(arg_8_0)
	local var_8_0 = arg_8_0:GetIsland()

	arg_8_0:InitList(var_8_0)
end

function var_0_0.FilterPlayerList(arg_9_0, arg_9_1)
	local var_9_0 = {}
	local var_9_1 = arg_9_1:GetVisitorAgency():GetPlayerList()

	for iter_9_0, iter_9_1 in pairs(var_9_1) do
		if not iter_9_1:IsSelf() then
			table.insert(var_9_0, iter_9_1)
		end
	end

	return var_9_0
end

function var_0_0.InitList(arg_10_0, arg_10_1)
	local var_10_0 = arg_10_0:FilterPlayerList(arg_10_1)

	arg_10_0.uiItemList:make(function(arg_11_0, arg_11_1, arg_11_2)
		if arg_11_0 == UIItemList.EventUpdate then
			arg_10_0:UpdateFriendCard(arg_11_2, var_10_0[arg_11_1 + 1])
		end
	end)
	arg_10_0.uiItemList:align(#var_10_0)
end

function var_0_0.UpdateFriendCard(arg_12_0, arg_12_1, arg_12_2)
	setText(arg_12_1:Find("name"), arg_12_2:GetName())
	onButton(arg_12_0, arg_12_1:Find("kick"), function()
		arg_12_0:emit(IslandMediator.ON_KICK_PLAYER, IslandConst.ACCESS_OP_KICK, arg_12_2.id)
	end, SFX_PANEL)
end

function var_0_0.Hide(arg_14_0)
	var_0_0.super.Hide(arg_14_0)
end

function var_0_0.OnDestroy(arg_15_0)
	return
end

return var_0_0
