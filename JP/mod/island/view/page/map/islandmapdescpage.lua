local var_0_0 = class("IslandMapDescPage", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandMapDescUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.nameTxt = arg_2_0:findTF("frame/title/name/Text"):GetComponent(typeof(Text))
	arg_2_0.descTxt = arg_2_0:findTF("frame/Text"):GetComponent(typeof(Text))
	arg_2_0.goBtn = arg_2_0:findTF("frame/go")
	arg_2_0.uiProductionList = UIItemList.New(arg_2_0:findTF("frame/list"), arg_2_0:findTF("frame/list/tpl"))
	arg_2_0.iconTr = arg_2_0:findTF("frame/icon")
	arg_2_0.fullMark = arg_2_0:findTF("frame/icon/tag")

	setText(arg_2_0:findTF("frame/go/Text"), i18n1("前往"))

	arg_2_0.timers = {}
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0._tf, function()
		arg_3_0:emit(IslandMapPage.HIDE_DESC)
	end, SFX_PANEL)
end

function var_0_0.OnShow(arg_5_0, arg_5_1)
	local var_5_0 = pg.island_map[arg_5_1]

	arg_5_0.nameTxt.text = var_5_0.name
	arg_5_0.descTxt.text = var_5_0.desc

	GetImageSpriteFromAtlasAsync("IslandMapIcon/" .. arg_5_1, "", arg_5_0.iconTr)
	onButton(arg_5_0, arg_5_0.goBtn, function()
		arg_5_0:emit(IslandMediator.SWITCH_MAP, arg_5_1, var_5_0.born_object)
		arg_5_0:ClosePage(IslandMapPage)
	end, SFX_PANEL)
	setActive(arg_5_0.fullMark, false)
	arg_5_0:UpdateProductionList(arg_5_1)
end

function var_0_0.UpdateProductionList(arg_7_0, arg_7_1)
	local var_7_0 = pg.island_production_place.get_id_list_by_map_id[arg_7_1] or {}
	local var_7_1 = {}

	for iter_7_0, iter_7_1 in pairs(var_7_0) do
		local var_7_2 = pg.island_production_place[iter_7_1]

		table.insert(var_7_1, var_7_2)
	end

	arg_7_0.uiProductionList:make(function(arg_8_0, arg_8_1, arg_8_2)
		if arg_8_0 == UIItemList.EventUpdate then
			local var_8_0 = var_7_1[arg_8_1 + 1]

			GetImageSpriteFromAtlasAsync("IslandMapRes", var_8_0.id, arg_8_2)
			setText(arg_8_2:Find("Text"), var_8_0.name)
			arg_7_0:AddTimer(arg_8_2, var_8_0)
		end
	end)
	arg_7_0.uiProductionList:align(#var_7_1)
end

function var_0_0.AddTimer(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = arg_9_1:Find("full")

	setActive(var_9_0, false)
	arg_9_0:RemoveTimer(arg_9_2.id)

	local var_9_1 = getProxy(IslandProxy):GetIsland():GetBuildingAgency():GetBuilding(arg_9_2.id)
	local var_9_2 = var_9_1 and var_9_1:GetMinRoleDeleGationTime() or -1

	if var_9_2 < 0 then
		return
	end

	local var_9_3 = pg.TimeMgr.GetInstance():GetServerTime()

	if var_9_2 <= var_9_3 then
		setActive(var_9_0, true)
		arg_9_0:UpdateAnyFullMark()

		return
	end

	local var_9_4 = var_9_2 - var_9_3

	arg_9_0.timers[arg_9_2.id] = Timer.New(function()
		setActive(var_9_0, true)
		arg_9_0:UpdateAnyFullMark()
		arg_9_0:RemoveTimer(arg_9_2.id)
	end, var_9_4, 1)

	arg_9_0.timers[arg_9_2.id]:Start()
end

function var_0_0.UpdateAnyFullMark(arg_11_0)
	setActive(arg_11_0.fullMark, true)
end

function var_0_0.RemoveTimer(arg_12_0, arg_12_1)
	if arg_12_0.timers[arg_12_1] then
		arg_12_0.timers[arg_12_1]:Stop()

		arg_12_0.timers[arg_12_1] = nil
	end
end

function var_0_0.OnHide(arg_13_0)
	for iter_13_0, iter_13_1 in pairs(arg_13_0.timers) do
		iter_13_1:Stop()
	end

	arg_13_0.timers = {}
end

return var_0_0
