local var_0_0 = class("IslandFriendListPage", import("view.friend.subPages.FriendListPage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandFriendListUI"
end

function var_0_0.onInitItem(arg_2_0, arg_2_1)
	var_0_0.super.onInitItem(arg_2_0, arg_2_1)

	local var_2_0 = arg_2_0.friendItems[arg_2_1]

	onButton(arg_2_0, var_2_0.tf:Find("frame/btns/island_btn"), function()
		arg_2_0:emit(IslandFriendMediator.ENTER_ISLAND, var_2_0.friendVO.id)
	end, SFX_PANEL)
end

function var_0_0.onUpdateItem(arg_4_0, arg_4_1, arg_4_2)
	var_0_0.super.onUpdateItem(arg_4_0, arg_4_1, arg_4_2)

	local var_4_0 = arg_4_0.friendItems[arg_4_2]
	local var_4_1 = var_4_0.tf:Find("frame/btns")
	local var_4_2 = var_4_0.tf:Find("frame/access")

	setActive(var_4_1, arg_4_0.contextData.editMode == IslandFriendScene.MODE_VIEW)
	setActive(var_4_2, arg_4_0.contextData.editMode == IslandFriendScene.MODE_EDIT)

	local var_4_3 = var_4_2:Find("Toggle")

	removeOnToggle(var_4_3)

	local var_4_4 = getProxy(IslandProxy):GetIsland():GetAccessAgency()

	triggerToggle(var_4_3, arg_4_0:InWhiteList(var_4_0.friendVO.id))
	onToggle(arg_4_0, var_4_3, function(arg_5_0)
		if arg_5_0 then
			arg_4_0:AddWhiteList(var_4_0.friendVO.id)
		else
			arg_4_0:RemoveWhiteList(var_4_0.friendVO.id)
		end
	end, SFX_PANEL)
end

function var_0_0.InWhiteList(arg_6_0, arg_6_1)
	return table.contains(arg_6_0.contextData.whiteList, arg_6_1)
end

function var_0_0.AddWhiteList(arg_7_0, arg_7_1)
	if not arg_7_0:InWhiteList(arg_7_1) then
		table.insert(arg_7_0.contextData.whiteList, arg_7_1)
	end
end

function var_0_0.RemoveWhiteList(arg_8_0, arg_8_1)
	if arg_8_0:InWhiteList(arg_8_1) then
		table.removebyvalue(arg_8_0.contextData.whiteList, arg_8_1)
	end
end

return var_0_0
