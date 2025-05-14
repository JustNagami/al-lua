local var_0_0 = class("IslandTechOverviewPanel", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "IslandTechOverviewPanel"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.toggle = arg_2_0._tf:Find("toggle")
	arg_2_0.panel = arg_2_0._tf:Find("panel")
end

function var_0_0.OnInit(arg_3_0)
	arg_3_0.config = pg.island_technology_template
	arg_3_0.types = underscore.keys(IslandTechBelong.Fields)

	table.sort(arg_3_0.types)

	local var_3_0 = arg_3_0.panel:Find("content")

	arg_3_0.uiList = UIItemList.New(var_3_0, var_3_0:Find("tpl"))

	arg_3_0.uiList:make(function(arg_4_0, arg_4_1, arg_4_2)
		if arg_4_0 == UIItemList.EventInit then
			arg_4_2.name = arg_3_0.types[arg_4_1 + 1]

			arg_3_0:InitItem(arg_4_1, arg_4_2)
		elseif arg_4_0 == UIItemList.EventUpdate then
			arg_3_0:UpdateItem(arg_4_1, arg_4_2)
		end
	end)

	arg_3_0.uiListDic = {}

	arg_3_0:Flush()
	onToggle(arg_3_0, arg_3_0.toggle, function(arg_5_0)
		if arg_5_0 then
			pg.UIMgr.GetInstance():OverlayPanelPB(arg_3_0._tf, {
				pbList = {
					arg_3_0.panel
				},
				groupName = LayerWeightConst.GROUP_DORM3D
			})
		else
			pg.UIMgr.GetInstance():UnOverlayPanel(arg_3_0._tf, arg_3_0._parentTf)
		end
	end, SFX_PANEL)
end

function var_0_0.Flush(arg_6_0)
	arg_6_0.techAgency = getProxy(IslandProxy):GetIsland():GetTechnologyAgency()
	arg_6_0.type2Ids = {}

	for iter_6_0, iter_6_1 in ipairs(arg_6_0.types) do
		local var_6_0 = underscore.select(arg_6_0.config.get_id_list_by_tech_belong[iter_6_1], function(arg_7_0)
			return arg_6_0.techAgency:IsFinishedTech(arg_7_0)
		end)

		arg_6_0.type2Ids[iter_6_1] = var_6_0
	end

	arg_6_0.uiList:align(#arg_6_0.types)
end

function var_0_0.InitItem(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = arg_8_0.types[arg_8_1 + 1]

	arg_8_2.name = var_8_0

	local var_8_1 = arg_8_2:Find("view/content")
	local var_8_2 = UIItemList.New(var_8_1, var_8_1:Find("tpl"))

	var_8_2:make(function(arg_9_0, arg_9_1, arg_9_2)
		if arg_9_0 == UIItemList.EventUpdate then
			arg_8_0:UpdateInfo(arg_9_1, arg_9_2, var_8_0)
		end
	end)

	arg_8_0.uiListDic[var_8_0] = var_8_2
end

function var_0_0.UpdateItem(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = arg_10_0.types[arg_10_1 + 1]
	local var_10_1 = arg_10_0.techAgency:GetPctByType(var_10_0)

	setText(arg_10_2:Find("toggle/content/Text"), string.format("%s %d%%", IslandTechBelong.Names[var_10_0], var_10_1))
	arg_10_0.uiListDic[var_10_0]:align(#arg_10_0.type2Ids[var_10_0])
end

function var_0_0.UpdateInfo(arg_11_0, arg_11_1, arg_11_2, arg_11_3)
	local var_11_0 = arg_11_0.type2Ids[arg_11_3][arg_11_1 + 1]

	setText(arg_11_2:Find("name"), arg_11_0.config[var_11_0].tech_name)
	setText(arg_11_2:Find("lv"), arg_11_0.config[var_11_0].tech_level)
	LoadImageSpriteAsync("islandtechnology/" .. arg_11_0.config[var_11_0].tech_icon, arg_11_2:Find("icon"))
	setActive(arg_11_2:Find("bg"), arg_11_1 % 2 == 0)
end

function var_0_0.OffToggle(arg_12_0)
	triggerToggle(arg_12_0.toggle, false)
end

function var_0_0.Hide(arg_13_0)
	arg_13_0:OffToggle()
	var_0_0.super.Hide(arg_13_0)
end

function var_0_0.OnDestroy(arg_14_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_14_0._tf, arg_14_0._parentTf)
end

return var_0_0
