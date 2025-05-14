local var_0_0 = class("IslandFriendSearchPage", import("view.friend.subPages.FriendSearchPage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandFriendSearchUI"
end

function var_0_0.onInitItem(arg_2_0, arg_2_1)
	var_0_0.super.onInitItem(arg_2_0, arg_2_1)

	local var_2_0 = arg_2_0.searchItems[arg_2_1]

	onButton(arg_2_0, var_2_0.tf:Find("frame/island_btn"), function()
		arg_2_0:emit(IslandFriendMediator.ENTER_ISLAND, friendItem.friendVO.id)
	end, SFX_PANEL)
end

return var_0_0
