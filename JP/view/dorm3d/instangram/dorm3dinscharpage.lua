local var_0_0 = class("Dorm3dInsCharPage", import("view.base.BaseEventLogic"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	pg.DelegateInfo.New(arg_1_0)
	var_0_0.super.Ctor(arg_1_0, arg_1_2)

	arg_1_0.tf = arg_1_1
	arg_1_0.go = arg_1_1.gameObject

	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	eachChild(arg_2_0.tf:Find("entrance"), function(arg_3_0)
		local var_3_0 = arg_3_0.name

		arg_2_0[var_3_0 .. "Btn"] = arg_3_0
		arg_2_0[var_3_0 .. "Content"] = arg_3_0:Find("content")
		arg_2_0[var_3_0 .. "Tip"] = arg_3_0:Find("tip")

		setText(arg_3_0:Find("label"), i18n("dorm3d_privatechat_" .. var_3_0))
	end)
	onButton(arg_2_0, arg_2_0.insBtn, function()
		arg_2_0:emit(Dorm3dInsMainLayer.OPEN_INS)
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.chatBtn, function()
		arg_2_0:emit(Dorm3dInsMainLayer.OPEN_CHAT)
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.phoneBtn, function()
		arg_2_0:emit(Dorm3dInsMainLayer.OPEN_PHONE)
	end, SFX_PANEL)

	arg_2_0.name = arg_2_0.tf:Find("name/Text")
	arg_2_0.avatar = arg_2_0.tf:Find("avatar/mask/img")
	arg_2_0.likeBtn = arg_2_0.tf:Find("avatar/like_bottom")
	arg_2_0.like = arg_2_0.likeBtn:Find("like")

	onButton(arg_2_0, arg_2_0.likeBtn, function()
		if not arg_2_0.data:IsDownloaded() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("dorm3d_privatechat_room_unlock"))

			return
		end

		setActive(arg_2_0.like, not arg_2_0.data:IsCare())
		arg_2_0.data:SetCare(arg_2_0.data:IsCare() and 0 or 1)
		arg_2_0:emit(Dorm3dInsMainLayer.FLUSH_LEFT)
	end)
	eachChild(arg_2_0.tf:Find("info"), function(arg_8_0)
		local var_8_0 = arg_8_0.name

		setText(arg_8_0:Find("label"), i18n("dorm3d_privatechat_" .. var_8_0))

		arg_2_0[var_8_0 .. "Content"] = arg_8_0:Find("val")
	end)
	setText(arg_2_0.tf:Find("block/Text"), i18n("secretary_closed"))
	setActive(arg_2_0.tf:Find("entrance/phone"), not DORM_LOCK_INS_PHONE)
	setActive(arg_2_0.tf:Find("block"), DORM_LOCK_INS_PHONE)
end

function var_0_0.Flush(arg_9_0, arg_9_1)
	arg_9_0.data = arg_9_1

	setText(arg_9_0.name, arg_9_1:GetName())
	GetImageSpriteFromAtlasAsync(arg_9_1:GetCard(), "", arg_9_0.avatar, true)
	setText(arg_9_0.favorContent, arg_9_1:GetFavorLevel())
	setText(arg_9_0.furnitureContent, arg_9_1:GetFurnitureNum())
	setText(arg_9_0.visitContent, arg_9_1:GetLastVisit())
	setText(arg_9_0.giftContent, arg_9_1:GetGiftNum())

	local function var_9_0(arg_10_0, arg_10_1, arg_10_2)
		setActive(arg_9_0[arg_10_0 .. "Tip"], arg_10_1)
		setText(arg_9_0[arg_10_0 .. "Content"], arg_10_1 and setColorStr(arg_10_2, "#32a6e8") or arg_10_2)
	end

	var_9_0("ins", arg_9_1:GetInsContent())
	var_9_0("chat", arg_9_1:GetChatContent())
	var_9_0("phone", arg_9_1:GetPhoneContent())
	setActive(arg_9_0.like, arg_9_1:IsCare())
end

function var_0_0.Show(arg_11_0)
	setActive(arg_11_0.tf, true)
end

function var_0_0.Hide(arg_12_0)
	setActive(arg_12_0.tf, false)
end

function var_0_0.Destroy(arg_13_0)
	pg.DelegateInfo.Dispose(arg_13_0)
end

return var_0_0
