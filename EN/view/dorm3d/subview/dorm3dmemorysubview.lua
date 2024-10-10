local var_0_0 = class("Dorm3dMemorySubView", import("view.base.BaseSubView"))

function var_0_0.OnLoaded(arg_1_0)
	local var_1_0 = arg_1_0._tf:Find("list/container")

	arg_1_0.itemList = UIItemList.New(var_1_0, var_1_0:Find("tpl"))

	arg_1_0.itemList:make(function(arg_2_0, arg_2_1, arg_2_2)
		arg_2_1 = arg_2_1 + 1

		if arg_2_0 == UIItemList.EventUpdate then
			local var_2_0 = arg_1_0.ids[arg_2_1]
			local var_2_1 = pg.dorm3d_recall[var_2_0]
			local var_2_2 = arg_1_0.unlockDic[var_2_1.story_id]

			setText(arg_2_2:Find("name"), var_2_2 and var_2_1.name or i18n("dorm3d_recall_locked"))
			GetImageSpriteFromAtlasAsync(string.format("dorm3dmemory/%s_list", var_2_1.image), "", arg_2_2:Find("Image"))
			setImageAlpha(arg_2_2:Find("Image"), var_2_2 and 1 or 0.6)
			onToggle(arg_1_0, arg_2_2, function(arg_3_0)
				if arg_3_0 then
					arg_1_0:UpdateDisplay(arg_2_1, var_2_0)
				end
			end, SFX_PANEL)
		end
	end)

	arg_1_0.rtInfo = arg_1_0._tf:Find("info")
end

function var_0_0.OnInit(arg_4_0)
	arg_4_0.ids = getProxy(ApartmentProxy):getRoom(arg_4_0.contextData.roomId):getConfig("recall_list")
	arg_4_0.unlockDic = {}

	local var_4_0 = {}
	local var_4_1 = 0

	for iter_4_0, iter_4_1 in ipairs(arg_4_0.ids) do
		local var_4_2 = pg.dorm3d_recall[iter_4_1].story_id
		local var_4_3 = pg.dorm3d_dialogue_group[var_4_2].char_id

		if var_4_0[var_4_3] == nil then
			var_4_0[var_4_3] = getProxy(ApartmentProxy):getApartment(var_4_3) or false
		end

		arg_4_0.unlockDic[var_4_2] = var_4_0[var_4_3] and var_4_0[var_4_3].talkDic[var_4_2] or false

		if arg_4_0.unlockDic[var_4_2] then
			var_4_1 = var_4_1 + 1
		end
	end

	setText(arg_4_0.rtInfo:Find("count"), string.format("<color=#285cfc>%d</color>/%d", var_4_1, #arg_4_0.ids))
	arg_4_0.itemList:align(#arg_4_0.ids)
	triggerToggle(arg_4_0.itemList.container:GetChild(0), true)
end

function var_0_0.UpdateDisplay(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = arg_5_0.rtInfo:Find("content")
	local var_5_1 = pg.dorm3d_recall[arg_5_2]
	local var_5_2 = arg_5_0.unlockDic[var_5_1.story_id]

	GetImageSpriteFromAtlasAsync(string.format("dorm3dmemory/%s_info", var_5_1.image), "", var_5_0:Find("icon"))
	setImageAlpha(var_5_0:Find("icon"), var_5_2 and 1 or 0.25)
	setText(var_5_0:Find("icon/lock/Text"), i18n("dorm3d_reload_unlock"))
	setActive(var_5_0:Find("icon/lock"), not var_5_2)
	setActive(var_5_0:Find("icon/play"), var_5_2)
	onButton(arg_5_0, var_5_0:Find("icon/play"), function()
		arg_5_0:emit(Dorm3dCollectionMediator.DO_TALK, var_5_1.story_id)
	end, SFX_CONFIRM)
	setText(var_5_0:Find("pro/Text"), "is pro")
	setActive(var_5_0:Find("pro"), var_5_1.type == 2)
	setImageAlpha(var_5_0:Find("name/bg"), var_5_2 and 1 or 0)
	setActive(var_5_0:Find("name"), var_5_2)
	setActive(var_5_0:Find("name_lock"), not var_5_2)

	if var_5_2 then
		setText(var_5_0:Find("name/number"), string.format("%02d.", arg_5_1))
		setText(var_5_0:Find("name/Text"), var_5_1.name)
		setText(var_5_0:Find("name/Text/en"), i18n("dorm3d_collection_title_en"))
		setText(var_5_0:Find("desc"), var_5_1.desc)
	else
		setText(var_5_0:Find("name_lock"), i18n("dorm3d_reload_unlock_name"))
		setText(var_5_0:Find("desc"), var_5_1.unlock_text)
	end
end

function var_0_0.OnDestroy(arg_7_0)
	return
end

return var_0_0
