local var_0_0 = class("IslandTechTreePage", import("...base.IslandBasePage"))

var_0_0.VIEW_PADDING = 200
var_0_0.ELEMENT_SIZE = {
	x = 410,
	y = 180
}
var_0_0.LINE_TYPE = {
	C2 = 3,
	S = 1,
	C1 = 2
}
var_0_0.DEFAULT_MAX_Y = 10

function var_0_0.getUIName(arg_1_0)
	return "IslandTechTreeUI"
end

function var_0_0.OnLoaded(arg_2_0)
	local var_2_0 = arg_2_0._tf:Find("types/content")

	arg_2_0.typeUIList = UIItemList.New(var_2_0, var_2_0:Find("tpl"))
	arg_2_0.treeView = arg_2_0._tf:Find("view")
	arg_2_0.showContent = arg_2_0.treeView:Find("content")
	arg_2_0.debugContainer = arg_2_0.showContent:Find("debug")
	arg_2_0.itemUIList = UIItemList.New(arg_2_0.showContent:Find("items"), arg_2_0.showContent:Find("items/tpl"))
	arg_2_0.lineContainer = arg_2_0.showContent:Find("lines")
	arg_2_0.lineTpls = {
		[var_0_0.LINE_TYPE.S] = arg_2_0._tf:Find("line_tpls/s"),
		[var_0_0.LINE_TYPE.C1] = arg_2_0._tf:Find("line_tpls/c1"),
		[var_0_0.LINE_TYPE.C2] = arg_2_0._tf:Find("line_tpls/c2")
	}
	arg_2_0.quickPanel = IslandTechQuickPanel.New(arg_2_0._tf, arg_2_0.event, arg_2_0.contextData)
	arg_2_0.detailPanel = IslandTechDetailPanel.New(arg_2_0._tf, arg_2_0.event, setmetatable({
		onSelecteShip = function()
			arg_2_0:OpenPage(IslandShipSelectPage, nil, function(arg_4_0)
				arg_2_0.detailPanel:ExecuteAction("OnShipSelected", arg_4_0)
			end)
		end
	}, {
		__index = arg_2_0.contextData
	}))
end

function var_0_0.OnInit(arg_5_0)
	onButton(arg_5_0, arg_5_0._tf:Find("top/back"), function()
		arg_5_0:Hide()
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0._tf:Find("top/home"), function()
		arg_5_0:emit(BaseUI.ON_HOME)
	end, SFX_PANEL)

	arg_5_0.types = IslandTechBelong.COMMON_SHOW_TYPES

	arg_5_0.typeUIList:make(function(arg_8_0, arg_8_1, arg_8_2)
		if arg_8_0 == UIItemList.EventInit then
			local var_8_0 = arg_5_0.types[arg_8_1 + 1]

			arg_8_2.name = var_8_0

			local var_8_1 = IslandTechBelong.Names[var_8_0]

			setText(arg_8_2:Find("sel/content/Text"), var_8_1)
			setText(arg_8_2:Find("unsel"), var_8_1)
			onToggle(arg_5_0, arg_8_2, function()
				if arg_5_0.curType and arg_5_0.curType == var_8_0 then
					return
				end

				arg_5_0.curType = var_8_0

				arg_5_0:Flush()
			end, SFX_PANEL)
		end
	end)
	arg_5_0.typeUIList:align(#arg_5_0.types)
	arg_5_0.itemUIList:make(function(arg_10_0, arg_10_1, arg_10_2)
		if arg_10_0 == UIItemList.EventUpdate then
			arg_5_0:UpdateItem(arg_10_1, arg_10_2)
		end
	end)

	arg_5_0.lineDatas = {}
end

function var_0_0.AddListeners(arg_11_0)
	arg_11_0:AddListener(GAME.ISLAND_UNLOCK_TECH_DONE, arg_11_0.Flush)
	arg_11_0:AddListener(GAME.ISLAND_FINISH_TECH_IMMD_DONE, arg_11_0.Flush)
	arg_11_0:AddListener(GAME.ISLAND_START_DELEGATION_DONE, arg_11_0.Flush)
	arg_11_0:AddListener(GAME.ISLAND_FINISH_DELEGATION_DONE, arg_11_0.Flush)
	arg_11_0:AddListener(GAME.ISLAND_GET_DELEGATION_AWARD_DONE, arg_11_0.Flush)
end

function var_0_0.RemoveListeners(arg_12_0)
	arg_12_0:RemoveListener(GAME.ISLAND_UNLOCK_TECH_DONE, arg_12_0.Flush)
	arg_12_0:RemoveListener(GAME.ISLAND_FINISH_TECH_IMMD_DONE, arg_12_0.Flush)
	arg_12_0:RemoveListener(GAME.ISLAND_START_DELEGATION_DONE, arg_12_0.Flush)
	arg_12_0:RemoveListener(GAME.ISLAND_FINISH_DELEGATION_DONE, arg_12_0.Flush)
	arg_12_0:RemoveListener(GAME.ISLAND_GET_DELEGATION_AWARD_DONE, arg_12_0.Flush)
end

function var_0_0.OnShow(arg_13_0, arg_13_1)
	arg_13_0.quickPanel:ExecuteAction("Show")

	arg_13_0.curType = nil

	triggerToggle(arg_13_0.typeUIList.container:Find(tostring(arg_13_1)), true)
end

function var_0_0.UpdateItem(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = arg_14_0.displays[arg_14_1 + 1]

	arg_14_2.name = var_14_0

	local var_14_1 = arg_14_0.techAgency:GetTechnology(var_14_0)

	setAnchoredPosition(arg_14_2, arg_14_0:GetPositionById(var_14_1.id))
	setText(arg_14_2:Find("name"), var_14_1:getConfig("tech_name"))

	local var_14_2 = var_14_1:GetStatus()
	local var_14_3 = var_14_2 == IslandTechnology.STATUS.FINISHED

	setTextColor(arg_14_2:Find("name"), Color.NewHex(var_14_3 and "1b3650" or "ffffff"))
	LoadImageSpriteAsync("IslandTechnology/" .. var_14_1:getConfig("tech_icon"), arg_14_2:Find("icon"), true)
	setImageColor(arg_14_2:Find("icon"), Color.NewHex(var_14_3 and "455a81" or "ffffff"))
	eachChild(arg_14_2:Find("back"), function(arg_15_0)
		setActive(arg_15_0, arg_15_0.name == var_14_2)
	end)
	setActive(arg_14_2:Find("back/normal"), not var_14_3 and var_14_2 ~= IslandTechnology.STATUS.STUDYING)
	eachChild(arg_14_2:Find("front"), function(arg_16_0)
		setActive(arg_16_0, arg_16_0.name == var_14_2)
	end)
	onButton(arg_14_0, arg_14_2, function()
		local var_17_0 = arg_14_0._tf:InverseTransformPoint(arg_14_2.position)

		arg_14_0.detailPanel:ExecuteAction("Show", var_14_0, var_17_0)
	end, SFX_PANEL)
end

function var_0_0.Flush(arg_18_0)
	arg_18_0.techAgency = getProxy(IslandProxy):GetIsland():GetTechnologyAgency()
	arg_18_0.displays = pg.island_technology_template.get_id_list_by_tech_belong[arg_18_0.curType]
	arg_18_0.maxX, arg_18_0.maxY = 0, 0

	for iter_18_0, iter_18_1 in ipairs(arg_18_0.displays) do
		local var_18_0 = pg.island_technology_template[iter_18_1].axis

		arg_18_0.maxX = math.max(arg_18_0.maxX, var_18_0[1])
		arg_18_0.maxY = math.max(arg_18_0.maxY, var_18_0[2])
	end

	arg_18_0.maxX = arg_18_0.maxX + 1
	arg_18_0.maxY = math.max(var_0_0.DEFAULT_MAX_Y, arg_18_0.maxY + 1)

	arg_18_0:InitTreeCS(arg_18_0.maxX, arg_18_0.maxY)
	arg_18_0.itemUIList:align(#arg_18_0.displays)
	arg_18_0:UpdateLines()

	if arg_18_0.detailPanel:isShowing() then
		arg_18_0.detailPanel:ExecuteAction("Flush")
	end

	arg_18_0.quickPanel:ExecuteAction("Flush")
end

function var_0_0.InitTreeCS(arg_19_0, arg_19_1, arg_19_2)
	local var_19_0 = {
		x = var_0_0.ELEMENT_SIZE.x / 2,
		y = var_0_0.ELEMENT_SIZE.y / 2
	}

	setSizeDelta(arg_19_0.treeView, {
		x = var_19_0.x * arg_19_1 + var_0_0.VIEW_PADDING,
		y = var_19_0.y * arg_19_2
	})

	arg_19_0.idx2pos = {}

	for iter_19_0 = 0, arg_19_1 do
		for iter_19_1 = 0, arg_19_2 do
			local var_19_1 = iter_19_0 .. "_" .. iter_19_1

			arg_19_0.idx2pos[var_19_1] = {
				x = var_19_0.x * iter_19_0,
				y = -var_19_0.y * iter_19_1
			}

			local var_19_2 = cloneTplTo(arg_19_0.debugContainer:Find("tpl"), arg_19_0.debugContainer)

			var_19_2.name = var_19_1

			setLocalPosition(var_19_2, arg_19_0.idx2pos[var_19_1])
		end
	end
end

function var_0_0.GetPositionById(arg_20_0, arg_20_1)
	local var_20_0 = pg.island_technology_template[arg_20_1].axis

	return arg_20_0.idx2pos[var_20_0[1] .. "_" .. var_20_0[2]] or {
		x = 0,
		y = 0
	}
end

function var_0_0.UpdateLines(arg_21_0)
	removeAllChildren(arg_21_0.lineContainer)

	for iter_21_0, iter_21_1 in pairs(arg_21_0:GetTechTreeLineData(arg_21_0.curType)) do
		for iter_21_2, iter_21_3 in ipairs(iter_21_1) do
			arg_21_0:UpdateLineTpl(iter_21_0, iter_21_3)
		end
	end
end

function var_0_0.UpdateLineTpl(arg_22_0, arg_22_1, arg_22_2)
	local var_22_0 = arg_22_0:GetPositionById(arg_22_1)
	local var_22_1 = arg_22_0:GetPositionById(arg_22_2)
	local var_22_2 = arg_22_0:GetLineOutPutPos(var_22_0)
	local var_22_3 = arg_22_0:GetLineInPutPos(var_22_1)

	if var_22_0.y == var_22_1.y then
		local var_22_4 = cloneTplTo(arg_22_0.lineTpls[var_0_0.LINE_TYPE.S], arg_22_0.lineContainer)

		setLocalPosition(var_22_4, var_22_2)
		setSizeDelta(var_22_4, {
			x = var_22_3.x - var_22_2.x,
			y = var_22_4.sizeDelta.y
		})
	else
		local var_22_5 = math.abs(var_22_3.y - var_22_2.y) <= var_0_0.ELEMENT_SIZE.y / 2 and var_0_0.LINE_TYPE.C1 or var_0_0.LINE_TYPE.C2
		local var_22_6 = cloneTplTo(arg_22_0.lineTpls[var_22_5], arg_22_0.lineContainer)

		setLocalScale(var_22_6, {
			y = var_22_1.y > var_22_0.y and -1 or 1
		})
		setLocalPosition(var_22_6, var_22_2)
	end
end

function var_0_0.GetLineOutPutPos(arg_23_0, arg_23_1)
	return {
		x = arg_23_1.x + 205,
		y = arg_23_1.y
	}
end

function var_0_0.GetLineInPutPos(arg_24_0, arg_24_1)
	return {
		x = arg_24_1.x - 210,
		y = arg_24_1.y
	}
end

function var_0_0.GetTechTreeLineData(arg_25_0, arg_25_1)
	if arg_25_0.lineDatas[arg_25_1] then
		return arg_25_0.lineDatas[arg_25_1]
	end

	local var_25_0 = pg.island_technology_template
	local var_25_1 = {}

	for iter_25_0, iter_25_1 in ipairs(var_25_0.get_id_list_by_tech_belong[arg_25_1]) do
		local var_25_2 = var_25_0[iter_25_1]

		for iter_25_2, iter_25_3 in ipairs(var_25_2.ex_tech) do
			if not var_25_1[iter_25_3] then
				var_25_1[iter_25_3] = {}
			end

			if not table.contains(var_25_1[iter_25_3], iter_25_1) then
				table.insert(var_25_1[iter_25_3], iter_25_1)
			end
		end

		if not var_25_1[iter_25_1] then
			var_25_1[iter_25_1] = {}
		end

		var_25_1[iter_25_1] = table.mergeArray(var_25_1[iter_25_1], var_25_2.next_tech, true)

		local var_25_3 = var_25_2.axis[1]

		for iter_25_4, iter_25_5 in ipairs(var_25_1[iter_25_1]) do
			local var_25_4 = var_25_0[iter_25_5].axis[1]

			assert(var_25_4 - var_25_3 > 2, string.format("岛屿科技树框体点位间隔过近,请检查配置: %d->%d", iter_25_1, iter_25_5))
		end
	end

	arg_25_0.lineDatas[arg_25_1] = var_25_1

	return arg_25_0.lineDatas[arg_25_1]
end

function var_0_0.OnHide(arg_26_0)
	arg_26_0.quickPanel:ExecuteAction("OffToggle")
	arg_26_0.quickPanel:ExecuteAction("Hide")
end

function var_0_0.OnDestroy(arg_27_0)
	if arg_27_0.detailPanel then
		arg_27_0.detailPanel:Destroy()

		arg_27_0.detailPanel = nil
	end

	if arg_27_0.quickPanel then
		arg_27_0.quickPanel:Destroy()

		arg_27_0.quickPanel = nil
	end
end

return var_0_0
