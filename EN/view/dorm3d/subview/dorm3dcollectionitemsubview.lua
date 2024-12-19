local var_0_0 = class("Dorm3dCollectionItemSubView", import("view.base.BaseSubView"))

function var_0_0.OnLoaded(arg_1_0)
	local var_1_0 = arg_1_0._tf:Find("list/container")

	arg_1_0.itemList = UIItemList.New(var_1_0, var_1_0:Find("tpl"))

	arg_1_0.itemList:make(function(arg_2_0, arg_2_1, arg_2_2)
		arg_2_1 = arg_2_1 + 1

		if arg_2_0 == UIItemList.EventUpdate then
			local var_2_0 = arg_1_0.ids[arg_2_1]
			local var_2_1 = pg.dorm3d_collection_template[var_2_0]
			local var_2_2 = arg_1_0.unlockDic[var_2_0]
			local var_2_3 = ApartmentProxy.CheckUnlockConfig(var_2_1.unlock)
			local var_2_4 = arg_2_1

			for iter_2_0 = 1, 2 do
				cloneTplTo(arg_1_0.numContainer:Find("num_" .. var_2_4 % 10), arg_2_2:Find("num"))

				var_2_4 = math.floor(var_2_4 / 10)
			end

			setActive(arg_2_2:Find("content/lock"), not var_2_3)
			setActive(arg_2_2:Find("content/mark"), var_2_3 and not var_2_2)
			setText(arg_2_2:Find("content/name"), var_2_2 and var_2_1.name or var_2_3 and i18n("dorm3d_collect_not_found", i18n(var_2_1.text)) or i18n("dorm3d_collect_locked", var_2_1.unlock[2]))

			local function var_2_5(arg_3_0)
				setTextColor(arg_2_2:Find("content/name"), Color.NewHex(not var_2_2 and "a9a9a9" or arg_3_0 and "2d1dfc" or "393a3c"))
				eachChild(arg_2_2:Find("num"), function(arg_4_0)
					setImageColor(arg_4_0, Color.NewHex(arg_3_0 and "2d1dfd" or "393a3c"))
				end)
			end

			onToggle(arg_1_0, arg_2_2, function(arg_5_0)
				if arg_5_0 then
					arg_1_0:UpdateDisplay(arg_2_1, var_2_0)
				end

				var_2_5(arg_5_0)
			end, SFX_PANEL)
			var_2_5()
		end
	end)

	arg_1_0.numContainer = arg_1_0._tf:Find("list/number")
	arg_1_0.rtInfo = arg_1_0._tf:Find("info")
end

function var_0_0.OnInit(arg_6_0)
	arg_6_0.dorm3dmainscene = pg.m02:retrieveMediator(Dorm3dRoomMediator.__cname):getViewComponent()

	local var_6_0 = getProxy(ApartmentProxy):getRoom(arg_6_0.contextData.roomId)

	arg_6_0.unlockDic = var_6_0.collectItemDic
	arg_6_0.ids = Clone(pg.dorm3d_collection_template.get_id_list_by_room_id[var_6_0:GetConfigID()] or {})

	table.sort(arg_6_0.ids, CompareFuncs({
		function(arg_7_0)
			return arg_6_0.unlockDic[arg_7_0] and 0 or 1
		end,
		function(arg_8_0)
			return ApartmentProxy.CheckUnlockConfig(pg.dorm3d_collection_template[arg_8_0].unlock) and 0 or 1
		end,
		function(arg_9_0)
			return arg_9_0
		end
	}))
	setText(arg_6_0.rtInfo:Find("count"), string.format("<color=#2d1dfc>%d</color>/%d", table.getCount(arg_6_0.unlockDic), #arg_6_0.ids))
	arg_6_0.itemList:align(#arg_6_0.ids)
	triggerToggle(arg_6_0.itemList.container:GetChild(0), true)
end

function var_0_0.UpdateDisplay(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = pg.dorm3d_collection_template[arg_10_2]
	local var_10_1 = arg_10_0.unlockDic[arg_10_2]

	setActive(arg_10_0.rtInfo:Find("empty"), not var_10_1)

	if not var_10_1 then
		local var_10_2

		if not _.any(var_10_0.model, function(arg_11_0)
			local var_11_0
			local var_11_1, var_11_2 = arg_10_0.dorm3dmainscene:CheckSceneItemActiveByPath(arg_11_0)

			var_10_2 = var_11_2

			return var_11_1
		end) then
			local var_10_3 = Dorm3dFurniture.New({
				configId = var_10_2
			}):GetName()

			setText(arg_10_0.rtInfo:Find("empty"), i18n("dorm3d_collect_block_by_furniture", var_10_3))
		else
			setText(arg_10_0.rtInfo:Find("empty"), i18n("dorm3d_collect_nothing"))
		end
	end

	local var_10_4 = arg_10_0.rtInfo:Find("content")

	setActive(var_10_4, var_10_1)

	if not var_10_1 then
		return
	end

	GetImageSpriteFromAtlasAsync("dorm3dcollection/" .. var_10_0.icon, "", var_10_4:Find("icon"), true)
	setText(var_10_4:Find("name/Text"), var_10_0.name)
	setText(var_10_4:Find("desc"), var_10_0.desc)
	setActive(var_10_4:Find("favor"), var_10_0.award > 0)

	if var_10_0.award > 0 then
		local var_10_5 = pg.dorm3d_favor_trigger[var_10_0.award].num

		setText(var_10_4:Find("favor/Text"), i18n("dorm3d_collect_favor_plus") .. var_10_5)
	end
end

function var_0_0.OnDestroy(arg_12_0)
	return
end

return var_0_0
