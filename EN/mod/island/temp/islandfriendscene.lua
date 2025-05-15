local var_0_0 = class("IslandFriendScene", import("view.friend.FriendScene"))
local var_0_1 = 5

var_0_0.MODE_VIEW = 0
var_0_0.MODE_EDIT = 1

function var_0_0.getUIName(arg_1_0)
	return "IslandFriendUI"
end

function var_0_0.GetGuildMemberList(arg_2_0)
	local var_2_0 = {}
	local var_2_1 = getProxy(GuildProxy):getRawData()

	if var_2_1 then
		local var_2_2 = getProxy(PlayerProxy):getRawData().id

		for iter_2_0, iter_2_1 in ipairs(var_2_1:getSortMember()) do
			if iter_2_1.id ~= var_2_2 then
				table.insert(var_2_0, iter_2_1)
			end
		end
	end

	return var_2_0
end

function var_0_0.GetWhiteList(arg_3_0)
	local var_3_0 = {}
	local var_3_1 = getProxy(IslandProxy):GetIsland():GetAccessAgency():GetWhiteList()

	for iter_3_0, iter_3_1 in ipairs(var_3_1) do
		table.insert(var_3_0, iter_3_1)
	end

	return var_3_0
end

function var_0_0.wrapData(arg_4_0)
	local var_4_0 = var_0_0.super.wrapData(arg_4_0)

	var_4_0.memberVOs = arg_4_0:GetGuildMemberList()

	return var_4_0
end

function var_0_0.init(arg_5_0)
	var_0_0.super.init(arg_5_0)

	local var_5_0 = var_0_1

	arg_5_0.pages[1] = IslandFriendListPage.New(arg_5_0:findTF("pages"), arg_5_0.event, arg_5_0.contextData)
	arg_5_0.pages[2] = IslandFriendSearchPage.New(arg_5_0:findTF("pages"), arg_5_0.event, arg_5_0.contextData)

	table.insert(arg_5_0.pages, IslandGuildListPage.New(arg_5_0:findTF("pages"), arg_5_0.event, arg_5_0.contextData))

	local var_5_1 = cloneTplTo(arg_5_0.toggles[1], arg_5_0.togglesTF)

	var_5_1:SetSiblingIndex(1)
	table.insert(arg_5_0.toggles, var_5_1)

	for iter_5_0, iter_5_1 in pairs(arg_5_0.toggles) do
		onToggle(arg_5_0, iter_5_1, function(arg_6_0)
			if arg_6_0 then
				arg_5_0:switchPage(iter_5_0)
			end
		end, SFX_PANEL)
	end

	arg_5_0.accessToggles = {
		[IslandConst.ACCESS_TYPE_OPEN] = arg_5_0:findTF("authority/on"),
		[IslandConst.ACCESS_TYPE_CLOSE] = arg_5_0:findTF("authority/off")
	}
	arg_5_0.modifyBtn = arg_5_0:findTF("authority/manage")
	arg_5_0.confrimBtn = arg_5_0:findTF("authority/confrim")
	arg_5_0.cancelBtn = arg_5_0:findTF("authority/cancel")
end

function var_0_0.didEnter(arg_7_0)
	var_0_0.super.didEnter(arg_7_0)
	onButton(arg_7_0, arg_7_0:findTF("blur_panel/adapt/top/back_btn"), function()
		arg_7_0:closeView()
	end, SOUND_BACK)

	arg_7_0.contextData.editMode = var_0_0.MODE_VIEW

	arg_7_0:UpdateWhiteList()
	onButton(arg_7_0, arg_7_0.modifyBtn, function()
		arg_7_0:SwitchEditMode()
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.cancelBtn, function()
		arg_7_0:SwitchEditMode()
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.confrimBtn, function()
		arg_7_0:emit(IslandFriendMediator.ACCESS_OP, IslandConst.ACCESS_OP_SET_WHITELIST, arg_7_0.contextData.whiteList)
		arg_7_0:SwitchEditMode()
	end, SFX_PANEL)
	arg_7_0:SetUp()
end

function var_0_0.UpdateWhiteList(arg_12_0)
	arg_12_0.contextData.whiteList = arg_12_0:GetWhiteList()
end

function var_0_0.SwitchEditMode(arg_13_0, arg_13_1)
	arg_13_0.contextData.editMode = arg_13_1 or 1 - arg_13_0.contextData.editMode

	setActive(arg_13_0.modifyBtn, arg_13_0.contextData.editMode == var_0_0.MODE_VIEW)
	setActive(arg_13_0.confrimBtn, arg_13_0.contextData.editMode == var_0_0.MODE_EDIT)
	setActive(arg_13_0.cancelBtn, arg_13_0.contextData.editMode == var_0_0.MODE_EDIT)

	local var_13_0 = table.indexof(arg_13_0.pages, arg_13_0.page)

	arg_13_0:switchPage(var_13_0)
end

function var_0_0.UpdateAccessType(arg_14_0, arg_14_1)
	arg_14_0:emit(IslandFriendMediator.MODIFY_ACCESS_TYPE, arg_14_1)
end

function var_0_0.SetUp(arg_15_0)
	arg_15_0:SwitchEditMode(var_0_0.MODE_VIEW)

	local var_15_0 = getProxy(IslandProxy):GetIsland():GetAccessAgency():GetAccessType()

	triggerToggle(arg_15_0.accessToggles[var_15_0], true)

	for iter_15_0, iter_15_1 in pairs(arg_15_0.accessToggles) do
		onToggle(arg_15_0, iter_15_1, function(arg_16_0)
			if arg_16_0 then
				arg_15_0:UpdateAccessType(iter_15_0)
			end
		end, SFX_PANEL)
	end

	arg_15_0:UpdateModifyBtn()
end

function var_0_0.UpdateModifyBtn(arg_17_0)
	return
end

function var_0_0.updateEmpty(arg_18_0, arg_18_1, arg_18_2)
	if arg_18_1 == var_0_1 then
		local var_18_0 = arg_18_2.memberVOs
		local var_18_1 = i18n("list_empty_tip_friendui")

		setActive(arg_18_0.listEmptyTF, not var_18_0 or #var_18_0 <= 0)
		setText(arg_18_0.listEmptyTxt, var_18_1)
	else
		var_0_0.super.updateEmpty(arg_18_0, arg_18_1, arg_18_2)
	end
end

function var_0_0.switchPage(arg_19_0, arg_19_1)
	var_0_0.super.switchPage(arg_19_0, arg_19_1)

	local var_19_0 = arg_19_1 == FriendScene.FRIEND_PAGE or arg_19_1 == var_0_1

	if not var_19_0 and arg_19_0.contextData.editMode == var_0_0.MODE_EDIT then
		triggerButton(arg_19_0.cancelBtn)
	end

	setActive(arg_19_0.modifyBtn, var_19_0)
end

return var_0_0
