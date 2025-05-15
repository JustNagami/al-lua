local var_0_0 = class("IslandShipDressUpPage", import("...base.IslandBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "IslandShipDressUI"
end

var_0_0.Skin = 1
var_0_0.Wing = 2
var_0_0.FollowingObj = 3
var_0_0.Trailing = 4
var_0_0.Footprint = 5

local var_0_1 = {
	Down_up = 1,
	Up_Down = 2
}

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.rightPanel = arg_2_0:findTF("adapt/right_panel")
	arg_2_0.togglePanel = arg_2_0.rightPanel:Find("toggles")
	arg_2_0.saveBtn = arg_2_0:findTF("adapt/save")
	arg_2_0.toggles = {
		[var_0_0.Skin] = arg_2_0.togglePanel:Find("skin"),
		[var_0_0.Wing] = arg_2_0.togglePanel:Find("wing"),
		[var_0_0.FollowingObj] = arg_2_0.togglePanel:Find("followingObj"),
		[var_0_0.Trailing] = arg_2_0.togglePanel:Find("trailing"),
		[var_0_0.Footprint] = arg_2_0.togglePanel:Find("footprint")
	}
	arg_2_0.charContainer = arg_2_0:findTF("adapt/char")
	arg_2_0.dressCards = {}
	arg_2_0.dressRect = arg_2_0:findTF("adapt/right_panel/dress_container/dress"):GetComponent("LScrollRect")
	arg_2_0.dressList = {}

	function arg_2_0.dressRect.onInitItem(arg_3_0)
		arg_2_0:OnInitItem(arg_3_0)
	end

	function arg_2_0.dressRect.onUpdateItem(arg_4_0, arg_4_1)
		arg_2_0:OnUpdateItem(arg_4_0, arg_4_1)
	end
end

function var_0_0.ClickDressCardItem(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_0.pageDressDic[arg_5_0.currentDressPageType]
	local var_5_1 = var_5_0 and var_5_0.currentItemId or nil

	if var_5_1 == arg_5_1 then
		arg_5_0:ClearSelected(arg_5_1)

		if var_5_0.currentItemObj then
			setActive(var_5_0.currentItemObj, false)

			var_5_0.currentItemObj = nil
		end

		var_5_0.currentItemId = nil

		return
	end

	if var_5_1 ~= nil then
		if var_5_0.currentItemObj then
			setActive(var_5_0.currentItemObj, false)

			var_5_0.currentItemObj = nil
		end

		var_5_0.currentItemId = nil
	end

	arg_5_0:LoadDressupPrefab(arg_5_1, arg_5_0.currentDressPageType)

	local var_5_2 = arg_5_0.pageDressDic[arg_5_0.currentDressPageType] or {}

	var_5_2.currentItemId = arg_5_1
	arg_5_0.pageDressDic[arg_5_0.currentDressPageType] = var_5_2

	arg_5_0:ClearSelected(var_5_1)
	arg_5_0:MarkSelected(var_5_2.currentItemId)
end

function var_0_0.CheckIsInDress(arg_6_0, arg_6_1)
	for iter_6_0, iter_6_1 in pairs(arg_6_0.pageDressDic) do
		if iter_6_1.currentItemId == arg_6_1 then
			return true
		end
	end

	return false
end

function var_0_0.LoadDressupPrefab(arg_7_0, arg_7_1, arg_7_2)
	local function var_7_0(arg_8_0)
		local var_8_0 = arg_7_0.pageDressDic[arg_7_2] or {}

		var_8_0.currentItemObj = arg_8_0
		arg_7_0.pageDressDic[arg_7_2] = var_8_0
	end

	local var_7_1 = arg_7_0.dressObjectPool[arg_7_1]

	if var_7_1 then
		setActive(var_7_1, true)
		var_7_0(var_7_1)

		return
	end

	local var_7_2 = pg.island_dress_template[arg_7_1]
	local var_7_3 = var_7_2.model

	ResourceMgr.Inst:getAssetAsync(var_7_3, "", typeof(GameObject), UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_9_0)
		if not arg_7_0:CheckIsInDress(arg_7_1) then
			return
		end

		local var_9_0 = Object.Instantiate(arg_9_0)

		pg.ViewUtils.SetLayer(var_9_0.transform, Layer.UI)

		local var_9_1 = arg_7_0.role.transform

		if var_7_2.attachmentPoint ~= "" then
			local var_9_2 = var_7_2.attachmentPoint

			local function var_9_3(arg_10_0)
				for iter_10_0 = 0, arg_10_0.childCount - 1 do
					local var_10_0 = arg_10_0:GetChild(iter_10_0)

					if var_10_0.name == var_9_2 then
						return var_10_0
					end

					local var_10_1 = var_9_3(var_10_0, var_9_2)

					if var_10_1 then
						return var_10_1
					end
				end

				return nil
			end

			var_9_1 = var_9_3(var_9_1)
		end

		if var_7_2.offset ~= "" then
			local var_9_4 = Vector3(var_7_2.offset[1], var_7_2.offset[2], var_7_2.offset[3])

			var_9_0.transform.position = var_9_4
		end

		setParent(var_9_0, var_9_1)
		var_7_0(var_9_0)

		arg_7_0.dressObjectPool[arg_7_1] = var_9_0
	end), true, true)
end

function var_0_0.MarkSelected(arg_11_0, arg_11_1)
	for iter_11_0, iter_11_1 in pairs(arg_11_0.dressCards) do
		if iter_11_1.configId == arg_11_1 and iter_11_1.configType == arg_11_0.currentDressPageType then
			iter_11_1:UpdateSelected(iter_11_1.configId)

			break
		end
	end
end

function var_0_0.OnInitItem(arg_12_0, arg_12_1)
	local var_12_0 = tf(arg_12_1)
	local var_12_1 = IslandDressCard.New(arg_12_1)

	arg_12_0.dressCards[arg_12_1] = var_12_1
end

function var_0_0.ClearSelected(arg_13_0, arg_13_1)
	for iter_13_0, iter_13_1 in pairs(arg_13_0.dressCards) do
		if iter_13_1.configId == arg_13_1 and iter_13_1.configType == arg_13_0.currentDressPageType then
			iter_13_1:UpdateSelected(nil)

			break
		end
	end
end

function var_0_0.OnUpdateItem(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = arg_14_0.dressCards[arg_14_2]

	if not var_14_0 then
		arg_14_0:OnInitItem(arg_14_2)

		var_14_0 = arg_14_0.dressCards[arg_14_2]
	end

	local var_14_1 = arg_14_0.dressList[arg_14_1 + 1]
	local var_14_2 = tf(arg_14_2)

	onButton(arg_14_0, var_14_2, function()
		arg_14_0:ClickDressCardItem(var_14_1)
	end)

	local var_14_3 = arg_14_0.pageDressDic[arg_14_0.currentDressPageType] and arg_14_0.pageDressDic[arg_14_0.currentDressPageType].currentItemId or nil

	var_14_0:Update(var_14_1, var_14_3)
end

function var_0_0.AddListeners(arg_16_0)
	return
end

function var_0_0.RemoveListeners(arg_17_0)
	return
end

function var_0_0.OnClosePage(arg_18_0, arg_18_1)
	return
end

function var_0_0.LoadCharacter(arg_19_0, arg_19_1, arg_19_2)
	ResourceMgr.Inst:getAssetAsync(arg_19_1, "", typeof(GameObject), UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_20_0)
		arg_19_0.role = Object.Instantiate(arg_20_0)

		setParent(arg_19_0.role, arg_19_0.charContainer)
		GetOrAddComponent(arg_19_0.charContainer, typeof(SmoothRotateChildObject))
		arg_19_2(arg_19_0.role)
	end), true, true)
end

function var_0_0.UnloadCharacter(arg_21_0)
	local var_21_0 = arg_21_0.charContainer:GetComponent(typeof(SmoothRotateChildObject))

	if var_21_0 then
		Object.Destroy(var_21_0)
	end

	if arg_21_0.role then
		Object.Destroy(arg_21_0.role)

		arg_21_0.role = nil
		arg_21_0.prefab = nil
	end
end

function var_0_0.OnInit(arg_22_0)
	onButton(arg_22_0, arg_22_0.saveBtn, function()
		arg_22_0:SaveDressUpData()
	end, SFX_PANEL)

	for iter_22_0, iter_22_1 in ipairs(arg_22_0.toggles) do
		onToggle(arg_22_0, iter_22_1, function(arg_24_0)
			if arg_24_0 then
				arg_22_0:SwitchPage(iter_22_0)
			end
		end, SFX_PANEL)
	end
end

function var_0_0.SwitchPage(arg_25_0, arg_25_1)
	arg_25_0.currentDressPageType = arg_25_1
	arg_25_0.dressList = pg.island_dress_template.get_id_list_by_type[arg_25_0.currentDressPageType] or {}

	if not arg_25_0.hasInit then
		arg_25_0.hasInit = true

		onNextTick(function()
			arg_25_0:SortDressListByQuality()
		end)
	else
		arg_25_0:SortDressListByQuality()
	end
end

function var_0_0.SortDressListByQuality(arg_27_0)
	table.sort(arg_27_0.dressList, function(arg_28_0, arg_28_1)
		local var_28_0 = pg.island_dress_template[arg_28_0]
		local var_28_1 = pg.island_dress_template[arg_28_1]

		local function var_28_2()
			if arg_27_0.dressSortType == var_0_1.Down_up then
				return var_28_0.quality < var_28_1.quality
			else
				return var_28_0.quality > var_28_1.quality
			end
		end

		if var_28_0.quality ~= var_28_1.quality then
			return var_28_2()
		end

		return var_28_0.id < var_28_1.id
	end)

	local var_27_0 = #arg_27_0.dressList

	arg_27_0.dressRect:SetTotalCount(var_27_0, 0)
end

function var_0_0.InitCharacter(arg_30_0)
	local var_30_0 = pg.island_ship[0].model

	arg_30_0:LoadCharacter(var_30_0, function(arg_31_0)
		arg_31_0.transform.localRotation = Vector3(0, 180, 0)
		arg_31_0.transform.localScale = Vector3(400, 400, 400)
		arg_31_0.transform.localPosition = Vector3(0, 0, -600)

		pg.ViewUtils.SetLayer(arg_31_0.transform, Layer.UI)

		for iter_31_0, iter_31_1 in pairs(arg_30_0.initDressData) do
			arg_30_0:LoadDressupPrefab(iter_31_1, iter_31_0)
		end
	end)

	for iter_30_0, iter_30_1 in pairs(arg_30_0.initDressData) do
		local var_30_1 = arg_30_0.pageDressDic[iter_30_0] or {}

		var_30_1.currentItemId = iter_30_1
		arg_30_0.pageDressDic[iter_30_0] = var_30_1
	end
end

function var_0_0.Flush(arg_32_0)
	return
end

function var_0_0.OnShow(arg_33_0)
	local var_33_0 = arg_33_0.rightPanel:Find("filtrate/filtrate_sort/tag_down")
	local var_33_1 = arg_33_0.rightPanel:Find("filtrate/filtrate_sort/tag_up")

	local function var_33_2()
		setActive(var_33_0, arg_33_0.dressSortType == var_0_1.Down_up)
		setActive(var_33_1, arg_33_0.dressSortType == var_0_1.Up_Down)
	end

	onButton(arg_33_0, var_33_0, function()
		arg_33_0.dressSortType = var_0_1.Up_Down

		var_33_2()
		arg_33_0:SortDressListByQuality()
	end)
	onButton(arg_33_0, var_33_1, function()
		arg_33_0.dressSortType = var_0_1.Down_up

		var_33_2()
		arg_33_0:SortDressListByQuality()
	end)

	arg_33_0.dressObjectPool = {}
	arg_33_0.dressSortType = var_0_1.Down_up

	arg_33_0:GetInitDressData()
	arg_33_0:InitCharacter()
	triggerToggle(arg_33_0.toggles[var_0_0.Footprint], true)
	arg_33_0:Flush()
end

function var_0_0.OnHide(arg_37_0)
	arg_37_0:UnloadCharacter()
end

function var_0_0.GetInitDressData(arg_38_0)
	arg_38_0.pageDressDic = {}
	arg_38_0.initDressData = getProxy(IslandProxy):GetIsland():GetVisitorAgency():GetPlayerDressData()
end

function var_0_0.OnDestroy(arg_39_0)
	arg_39_0:UnloadCharacter()

	for iter_39_0, iter_39_1 in pairs(arg_39_0.dressCards or {}) do
		-- block empty
	end

	arg_39_0.dressCards = nil
end

function var_0_0.SaveDressUpData(arg_40_0)
	getProxy(IslandProxy):GetIsland():GetVisitorAgency():ChangeDress(arg_40_0.pageDressDic)
end

function var_0_0.CheckDressIsDirty(arg_41_0)
	local var_41_0 = getProxy(IslandProxy):GetIsland():GetVisitorAgency():GetPlayerDressData()

	for iter_41_0, iter_41_1 in pairs(arg_41_0.pageDressDic) do
		if var_41_0[iter_41_0] ~= iter_41_1.currentItemId then
			return true
		end
	end

	return false
end

return var_0_0
