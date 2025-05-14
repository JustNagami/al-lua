local var_0_0 = class("IslandFriendPage", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandFriendUI"
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
	return
end

function var_0_0.RemoveListeners(arg_6_0)
	return
end

function var_0_0.Show(arg_7_0)
	var_0_0.super.Show(arg_7_0)

	local var_7_0 = getProxy(IslandProxy):GetIsland()

	arg_7_0:InitList()
end

function var_0_0.InitList(arg_8_0)
	local var_8_0 = getProxy(FriendProxy):getAllFriends()

	arg_8_0.uiItemList:make(function(arg_9_0, arg_9_1, arg_9_2)
		if arg_9_0 == UIItemList.EventUpdate then
			arg_8_0:UpdateFriendCard(arg_9_2, var_8_0[arg_9_1 + 1])
		end
	end)
	arg_8_0.uiItemList:align(#var_8_0)
end

function var_0_0.UpdateFriendCard(arg_10_0, arg_10_1, arg_10_2)
	setText(arg_10_1:Find("name"), arg_10_2:GetName())
	onButton(arg_10_0, arg_10_1:Find("enter"), function()
		return
	end, SFX_PANEL)
	onButton(arg_10_0, arg_10_1:Find("invite"), function()
		arg_10_0:emit(IslandMediator.ON_INVITE_PLAYER, arg_10_2.id)
	end, SFX_PANEL)
end

function var_0_0.Hide(arg_13_0)
	var_0_0.super.Hide(arg_13_0)
end

function var_0_0.OnDestroy(arg_14_0)
	return
end

return var_0_0
