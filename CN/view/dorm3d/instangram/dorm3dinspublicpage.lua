local var_0_0 = class("Dorm3dInsCharPage", import("view.base.BaseEventLogic"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	pg.DelegateInfo.New(arg_1_0)
	var_0_0.super.Ctor(arg_1_0, arg_1_2)

	arg_1_0.tf = arg_1_1
	arg_1_0.go = arg_1_1.gameObject

	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	eachChild(arg_2_0.tf:Find("info"), function(arg_3_0)
		local var_3_0 = arg_3_0.name

		setText(arg_3_0:Find("label"), i18n("dorm3d_privatechat_" .. var_3_0))

		arg_2_0[var_3_0 .. "Content"] = arg_3_0:Find("val")
	end)

	arg_2_0.name = arg_2_0.tf:Find("name/Text")
	arg_2_0.avatar = arg_2_0.tf:Find("avatar/img")
	arg_2_0.desc = arg_2_0.tf:Find("invite/desc")

	setText(arg_2_0.tf:Find("invite/hint/Text"), i18n("dorm3d_privatechat_room_character"))

	arg_2_0.inviteListContainer = arg_2_0.tf:Find("invite/list")
	arg_2_0.inviteItemList = UIItemList.New(arg_2_0.inviteListContainer, arg_2_0.inviteListContainer:Find("tpl"))

	arg_2_0.inviteItemList:make(function(arg_4_0, arg_4_1, arg_4_2)
		if arg_4_0 == UIItemList.EventUpdate then
			arg_2_0:UpdateInvite(arg_4_1, arg_4_2)
		end
	end)
end

function var_0_0.Flush(arg_5_0, arg_5_1)
	arg_5_0.data = arg_5_1
	arg_5_0.charIds, arg_5_0.unlockIds, arg_5_0.roomIds = arg_5_1:GetWelcomeCharList()

	setText(arg_5_0.name, arg_5_1:GetConfig("room"))
	GetImageSpriteFromAtlasAsync(arg_5_1:GetCard(), "", arg_5_0.avatar, true)
	setText(arg_5_0.welcomeContent, #arg_5_0.unlockIds)
	setText(arg_5_0.desc, arg_5_1:GetDesc())
	arg_5_0.inviteItemList:align(#arg_5_0.charIds)
end

function var_0_0.UpdateInvite(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = arg_6_0.charIds[arg_6_1 + 1]
	local var_6_1 = arg_6_0.roomIds[arg_6_1 + 1]
	local var_6_2 = getProxy(Dorm3dInsProxy):GetRoomById(var_6_1):GetIcon()
	local var_6_3 = not table.contains(arg_6_0.unlockIds, var_6_0)

	GetImageSpriteFromAtlasAsync(var_6_2, "", arg_6_2:Find("mask/icon"))
	setActive(arg_6_2:Find("lock"), var_6_3)
	onButton(arg_6_0, arg_6_2, function()
		if not var_6_3 then
			return
		end

		if not arg_6_0.data:IsDownloaded() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_privatechat_room_unlock"))

			return
		end

		if not pg.NewStoryMgr.GetInstance():IsPlayed("DORM3D_GUIDE_06") then
			pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_privatechat_room_guide"))

			return
		end

		arg_6_0:emit(Dorm3dInsMainMediator.OPEN_ROOM_UNLOCK_WINDOW, arg_6_0.data.id, var_6_0)
	end)
end

function var_0_0.Show(arg_8_0)
	setActive(arg_8_0.tf, true)
end

function var_0_0.Hide(arg_9_0)
	setActive(arg_9_0.tf, false)
end

function var_0_0.Destroy(arg_10_0)
	pg.DelegateInfo.Dispose(arg_10_0)
end

return var_0_0
