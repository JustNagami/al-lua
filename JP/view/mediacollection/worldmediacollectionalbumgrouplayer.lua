local var_0_0 = class("WorldMediaCollectionAlbumGroupLayer", import(".WorldMediaCollectionSubLayer"))

function var_0_0.getUIName(arg_1_0)
	return "WorldMediaCollectionAlbumGroupUI"
end

function var_0_0.OnInit(arg_2_0)
	var_0_0.super.OnInit(arg_2_0)
	assert(arg_2_0.viewParent, "Need assign ViewParent for " .. arg_2_0.__cname)

	arg_2_0.albumGroups = _.map(pg.activity_medal_group.all, function(arg_3_0)
		return pg.activity_medal_group[arg_3_0]
	end)
	arg_2_0.albumGroupList = arg_2_0:findTF("GroupRect"):GetComponent("LScrollRect")

	function arg_2_0.albumGroupList.onInitItem(arg_4_0)
		arg_2_0:onInitAlbumGroup(arg_4_0)
	end

	function arg_2_0.albumGroupList.onUpdateItem(arg_5_0, arg_5_1)
		arg_2_0:onUpdateAlbumGroup(arg_5_0 + 1, arg_5_1)
	end

	arg_2_0.albumGroupInfos = {}

	local var_2_0 = arg_2_0:findTF("GroupItem", arg_2_0.albumGroupList)

	setActive(var_2_0, false)

	arg_2_0.albumGroupViewport = arg_2_0:findTF("Viewport", arg_2_0.albumGroupList)
	arg_2_0.albumGroupsGrid = arg_2_0:findTF("Viewport/Content", arg_2_0.albumGroupList):GetComponent(typeof(GridLayoutGroup))
	arg_2_0.loader = AutoLoader.New()

	setText(arg_2_0:findTF("top/title/text"), i18n("word_limited_activity"))
	setText(arg_2_0:findTF("top/expireCheckBox/text"), i18n("word_show_expire_content"))

	arg_2_0.hideExpireBtn = arg_2_0:findTF("top/expireCheckBox/click")
	arg_2_0.hideExpireCheckBox = arg_2_0:findTF("top/expireCheckBox/checkBox/check")
	arg_2_0.hideExpire = false

	onButton(arg_2_0, arg_2_0.hideExpireBtn, function()
		arg_2_0.hideExpire = not arg_2_0.hideExpire

		setActive(arg_2_0.hideExpireCheckBox, arg_2_0.hideExpire)
	end)

	arg_2_0.rectAnchorX = arg_2_0:findTF("GroupRect").anchoredPosition.x

	arg_2_0:UpdateView()
end

function var_0_0.onInitAlbumGroup(arg_7_0, arg_7_1)
	if arg_7_0.exited then
		return
	end

	onButton(arg_7_0, arg_7_1, function()
		local var_8_0 = arg_7_0.albumGroupInfos[arg_7_1]

		if var_8_0 then
			arg_7_0.viewParent:ShowAlbum(var_8_0)
		end
	end, SOUND_BACK)
end

function var_0_0.onUpdateAlbumGroup(arg_9_0, arg_9_1, arg_9_2)
	if arg_9_0.exited then
		return
	end

	local var_9_0 = arg_9_0.albumGroups[arg_9_1]

	arg_9_0.albumGroupInfos[arg_9_2] = var_9_0

	setActive(tf(arg_9_2):Find("expireMask"), ActivityMedalGroup.GetMedalGroupStateByID(var_9_0.id) < 1)
end

function var_0_0.Return2MemoryGroup(arg_10_0)
	local var_10_0 = 0
	local var_10_1 = arg_10_0:GetIndexRatio(var_10_0)

	arg_10_0.albumGroupList:SetTotalCount(#arg_10_0.albumGroups, var_10_1)
end

function var_0_0.SwitchReddotMemory(arg_11_0)
	local var_11_0 = 0
	local var_11_1 = getProxy(PlayerProxy):getRawData().id

	for iter_11_0, iter_11_1 in ipairs(arg_11_0.albumGroups) do
		if PlayerPrefs.GetInt("ALBUM_GROUP_NOTIFICATION" .. var_11_1 .. " " .. iter_11_1.id, 0) == 1 then
			var_11_0 = iter_11_0

			break
		end
	end

	if var_11_0 == 0 then
		return
	end

	local var_11_2 = arg_11_0:GetIndexRatio(var_11_0)

	arg_11_0.albumGroupList:SetTotalCount(#arg_11_0.albumGroups, var_11_2)
end

function var_0_0.GetIndexRatio(arg_12_0, arg_12_1)
	local var_12_0 = 0

	if arg_12_1 > 0 then
		local var_12_1 = arg_12_0.albumGroupList
		local var_12_2 = arg_12_0.albumGroupsGrid.cellSize.y + arg_12_0.albumGroupsGrid.spacing.y
		local var_12_3 = arg_12_0.albumGroupsGrid.constraintCount
		local var_12_4 = var_12_2 * math.ceil(#arg_12_0.albumGroups / var_12_3)

		var_12_0 = (var_12_2 * math.floor((arg_12_1 - 1) / var_12_3) + var_12_1.paddingFront) / (var_12_4 - arg_12_0.albumGroupViewport.rect.height)
		var_12_0 = Mathf.Clamp01(var_12_0)
	end

	return var_12_0
end

function var_0_0.UpdateView(arg_13_0)
	local var_13_0 = WorldMediaCollectionScene.WorldRecordLock()

	setAnchoredPosition(arg_13_0:findTF("GroupRect"), {
		x = var_13_0 and 0 or arg_13_0.rectAnchorX
	})
	arg_13_0.albumGroupList:SetTotalCount(#arg_13_0.albumGroups, 0)
end

return var_0_0
