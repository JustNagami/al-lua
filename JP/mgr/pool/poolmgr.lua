local var_0_0 = singletonClass("PoolMgr")

pg = pg or {}
pg.PoolMgr = var_0_0
PoolMgr = var_0_0

local var_0_1 = require("Mgr/Pool/PoolPlural")
local var_0_2 = require("Mgr/Pool/PoolSingleton")
local var_0_3 = require("Mgr/Pool/PoolObjPack")
local var_0_4 = require("Mgr/Pool/PoolUtil")
local var_0_5 = ResourceMgr.Inst

function var_0_0.Ctor(arg_1_0)
	arg_1_0.root = GameObject.New("__Pool__").transform
	arg_1_0.pools_plural = {}
	arg_1_0.pools_pack = {}
	arg_1_0.callbacks = {}
	arg_1_0.pluralIndex = 0
	arg_1_0.singleIndex = 0
	arg_1_0.paintingCount = 0
	arg_1_0.commanderPaintingCount = 0
	arg_1_0.preloadDic = {
		shiptype = {},
		shipframe = {},
		shipframeb = {},
		["shipyardicon/unknown"] = {},
		skillframe = {},
		weaponframes = {},
		energy = {},
		custom_builtin = {},
		shipstatus = {},
		channel = {},
		["painting/mat"] = {},
		["ui/commonui_atlas"] = {},
		["ui/share/msgbox_atlas"] = {},
		["ui/share/world_common_atlas"] = {},
		skinicon = {},
		attricon = {}
	}
	arg_1_0.ui_tempCache = {}
end

function var_0_0.Init(arg_2_0, arg_2_1)
	print("initializing pool manager...")

	local var_2_0 = {}

	for iter_2_0, iter_2_1 in pairs(arg_2_0.preloadDic) do
		table.insert(var_2_0, function(arg_3_0)
			AssetBundleHelper.LoadAssetBundle(iter_2_0, true, true, function(arg_4_0)
				arg_2_0:AddPoolsPack(iter_2_0, arg_4_0)
				arg_3_0()
			end)
		end)
	end

	seriesAsync(var_2_0, arg_2_1)
end

function var_0_0.GetSpineChar(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	local var_5_0 = {}
	local var_5_1 = "char/" .. arg_5_1

	if not arg_5_0.pools_plural[var_5_1] then
		table.insert(var_5_0, function(arg_6_0)
			arg_5_0:GetSpineSkel(arg_5_1, arg_5_2, function(arg_7_0)
				assert(arg_7_0 ~= nil, "Spine角色不存在: " .. arg_5_1)

				if not arg_5_0.pools_plural[var_5_1] then
					arg_7_0 = SpineAnimUI.AnimChar(arg_5_1, arg_7_0)

					arg_7_0:SetActive(false)
					tf(arg_7_0):SetParent(arg_5_0.root, false)

					local var_7_0 = arg_7_0:GetComponent("SkeletonGraphic")

					var_7_0.material = var_7_0.skeletonDataAsset.atlasAssets[0].materials[0]
					arg_5_0.pools_plural[var_5_1] = var_0_1.New(arg_7_0, 1)
				end

				arg_6_0()
			end)
		end)
	end

	seriesAsync(var_5_0, function()
		local var_8_0 = arg_5_0.pools_plural[var_5_1]

		var_8_0.index = arg_5_0.pluralIndex
		arg_5_0.pluralIndex = arg_5_0.pluralIndex + 1

		local var_8_1 = var_8_0:Dequeue()

		var_8_1:SetActive(true)
		arg_5_3(var_8_1)
	end)
end

function var_0_0.ReturnSpineChar(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = "char/" .. arg_9_1

	if IsNil(arg_9_2) then
		Debugger.LogError(debug.traceback("empty go: " .. arg_9_1))
	elseif arg_9_0.pools_plural[var_9_0] then
		if arg_9_2:GetComponent("SkeletonGraphic").allowMultipleCanvasRenderers then
			UIUtil.ClearChildren(arg_9_2, {
				"Renderer"
			})
		else
			UIUtil.ClearChildren(arg_9_2)
		end

		setActiveViaLayer(arg_9_2.transform, true)
		arg_9_2:SetActive(false)
		arg_9_2.transform:SetParent(arg_9_0.root, false)

		arg_9_2.transform.localPosition = Vector3.New(0, 0, 0)
		arg_9_2.transform.localScale = Vector3.New(0.5, 0.5, 1)
		arg_9_2.transform.localRotation = Quaternion.identity

		arg_9_0.pools_plural[var_9_0]:Enqueue(arg_9_2)
		arg_9_0:ExcessSpineChar()
	else
		var_0_4.Destroy(arg_9_2)
	end
end

function var_0_0.ExcessSpineChar(arg_10_0)
	local var_10_0 = 0
	local var_10_1 = 6
	local var_10_2 = {}

	for iter_10_0, iter_10_1 in pairs(arg_10_0.pools_plural) do
		if string.find(iter_10_0, "char/") == 1 then
			table.insert(var_10_2, iter_10_0)
		end
	end

	if var_10_1 < #var_10_2 then
		table.sort(var_10_2, function(arg_11_0, arg_11_1)
			return arg_10_0.pools_plural[arg_11_0].index > arg_10_0.pools_plural[arg_11_1].index
		end)

		for iter_10_2 = var_10_1 + 1, #var_10_2 do
			local var_10_3 = var_10_2[iter_10_2]

			arg_10_0.pools_plural[var_10_3]:Clear()

			arg_10_0.pools_plural[var_10_3] = nil
		end
	end
end

function var_0_0.GetSpineSkel(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
	local var_12_0, var_12_1 = HXSet.autoHxShiftPath("char/" .. arg_12_1, arg_12_1)
	local var_12_2 = var_12_1 .. "_SkeletonData"

	arg_12_0:LoadAsset(var_12_0, "", typeof(Object), arg_12_2, function(arg_13_0)
		arg_12_3(arg_13_0)
	end, true)
end

function var_0_0.IsSpineSkelCached(arg_14_0, arg_14_1)
	local var_14_0 = "char/" .. arg_14_1

	return arg_14_0.pools_plural[var_14_0] ~= nil
end

local var_0_6 = {
	"ResPanel",
	"WorldResPanel"
}
local var_0_7 = {
	"ResPanel",
	"WorldResPanel",
	"NewMainUI",
	"DockyardUI",
	"AwardInfoUI",
	"SkillInfoUI",
	"ItemInfoUI",
	"ShipDetailView",
	"LevelFleetSelectView",
	"Loading",
	"WorldUI"
}
local var_0_8 = {}

function var_0_0.GetUI(arg_15_0, arg_15_1, arg_15_2, arg_15_3)
	local var_15_0 = "ui/" .. arg_15_1
	local var_15_1 = table.contains(var_0_6, arg_15_1) and 3 or 1

	arg_15_0:FromPlural(var_15_0, "", arg_15_2, var_15_1, function(arg_16_0)
		local function var_16_0()
			arg_15_3(arg_16_0)
		end

		if table.indexof(var_0_8, arg_15_1) then
			local var_16_1 = var_15_0

			arg_15_0.pools_plural[var_16_1].prefab:GetComponent(typeof(UIArchiver)):Clear()
			arg_16_0:GetComponent(typeof(UIArchiver)):Load(var_16_0)
		else
			var_16_0()
		end
	end)
end

function var_0_0.ReturnUI(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = "ui/" .. arg_18_1

	if IsNil(arg_18_2) then
		Debugger.LogError(debug.traceback("empty go: " .. arg_18_1))
	elseif arg_18_0.pools_plural[var_18_0] then
		if table.indexof(var_0_6, arg_18_1) then
			arg_18_2.transform:SetParent(arg_18_0.root, false)
		end

		if table.indexof(var_0_7, arg_18_1) or arg_18_0.ui_tempCache[arg_18_1] then
			setActiveViaLayer(arg_18_2.transform, false)
			arg_18_0.pools_plural[var_18_0]:Enqueue(arg_18_2)
		elseif table.indexof(var_0_8, arg_18_1) then
			setActiveViaLayer(arg_18_2.transform, false)
			arg_18_2:GetComponent(typeof(UIArchiver)):Clear()
			arg_18_0.pools_plural[var_18_0]:Enqueue(arg_18_2)
		else
			arg_18_0.pools_plural[var_18_0]:Enqueue(arg_18_2, true)

			if arg_18_0.pools_plural[var_18_0]:AllReturned() and (not arg_18_0.callbacks[var_18_0] or #arg_18_0.callbacks[var_18_0] == 0) then
				arg_18_0.pools_plural[var_18_0]:Clear()

				arg_18_0.pools_plural[var_18_0] = nil
			end
		end
	else
		var_0_4.Destroy(arg_18_2)
	end
end

function var_0_0.HasCacheUI(arg_19_0, arg_19_1)
	local var_19_0 = "ui/" .. arg_19_1

	return arg_19_0.pools_plural[var_19_0] ~= nil
end

function var_0_0.PreloadUI(arg_20_0, arg_20_1, arg_20_2)
	local var_20_0 = {}
	local var_20_1 = "ui/" .. arg_20_1

	if not arg_20_0.pools_plural[var_20_1] then
		table.insert(var_20_0, function(arg_21_0)
			arg_20_0:GetUI(arg_20_1, true, function(arg_22_0)
				arg_20_0.pools_plural[var_20_1]:Enqueue(arg_22_0)
				arg_21_0()
			end)
		end)
	end

	seriesAsync(var_20_0, arg_20_2)
end

function var_0_0.AddTempCache(arg_23_0, arg_23_1)
	arg_23_0.ui_tempCache[arg_23_1] = true
end

function var_0_0.DelTempCache(arg_24_0, arg_24_1)
	arg_24_0.ui_tempCache[arg_24_1] = nil
end

function var_0_0.ClearAllTempCache(arg_25_0)
	for iter_25_0, iter_25_1 in pairs(arg_25_0.ui_tempCache) do
		if iter_25_1 then
			local var_25_0 = "ui/" .. iter_25_0

			if arg_25_0.pools_plural[var_25_0] then
				arg_25_0.pools_plural[var_25_0]:Clear()

				arg_25_0.pools_plural[var_25_0] = nil
			end
		end
	end
end

function var_0_0.PreloadPainting(arg_26_0, arg_26_1, arg_26_2)
	local var_26_0 = {}
	local var_26_1 = "painting/" .. arg_26_1

	if not arg_26_0.pools_plural[var_26_1] then
		table.insert(var_26_0, function(arg_27_0)
			arg_26_0:GetPainting(arg_26_1, true, function(arg_28_0)
				arg_26_0.pools_plural[var_26_1]:Enqueue(arg_28_0)
				arg_27_0()
			end)
		end)
	end

	seriesAsync(var_26_0, arg_26_2)
end

function var_0_0.GetPainting(arg_29_0, arg_29_1, arg_29_2, arg_29_3)
	local var_29_0 = "painting/" .. arg_29_1
	local var_29_1 = var_29_0

	arg_29_0:FromPlural(var_29_0, "", arg_29_2, 1, function(arg_30_0)
		arg_30_0:SetActive(true)

		if ShipExpressionHelper.DefaultFaceless(arg_29_1) then
			setActive(tf(arg_30_0):Find("face"), true)
		end

		arg_29_3(arg_30_0)
	end)
end

function var_0_0.ReturnPainting(arg_31_0, arg_31_1, arg_31_2)
	local var_31_0 = "painting/" .. arg_31_1

	if IsNil(arg_31_2) then
		Debugger.LogError(debug.traceback("empty go: " .. arg_31_1))
	elseif arg_31_0.pools_plural[var_31_0] then
		setActiveViaLayer(arg_31_2, true)

		local var_31_1 = tf(arg_31_2):Find("face")

		if var_31_1 then
			setActive(var_31_1, false)
		end

		arg_31_2:SetActive(false)
		arg_31_2.transform:SetParent(arg_31_0.root, false)
		arg_31_0.pools_plural[var_31_0]:Enqueue(arg_31_2)
		arg_31_0:ExcessPainting()
	else
		var_0_4.Destroy(arg_31_2)
	end
end

function var_0_0.ExcessPainting(arg_32_0, arg_32_1)
	local var_32_0 = 0
	local var_32_1 = 4
	local var_32_2 = {}

	for iter_32_0, iter_32_1 in pairs(arg_32_0.pools_plural) do
		local var_32_3 = string.find(iter_32_0, "painting/")

		if var_32_3 and var_32_3 >= 1 then
			table.insert(var_32_2, iter_32_0)
		end
	end

	if var_32_1 < #var_32_2 then
		table.sort(var_32_2, function(arg_33_0, arg_33_1)
			return arg_32_0.pools_plural[arg_33_0].index > arg_32_0.pools_plural[arg_33_1].index
		end)

		for iter_32_2 = var_32_1 + 1, #var_32_2 do
			local var_32_4 = var_32_2[iter_32_2]

			arg_32_0.pools_plural[var_32_4]:Clear(true)

			arg_32_0.pools_plural[var_32_4] = nil
		end

		arg_32_0.paintingCount = arg_32_0.paintingCount + 1
	end

	if arg_32_1 then
		arg_32_0.paintingCount = 0
	elseif arg_32_0.paintingCount >= 10 then
		arg_32_0.paintingCount = 0

		gcAll(false)
	end
end

function var_0_0.GetPaintingWithPrefix(arg_34_0, arg_34_1, arg_34_2, arg_34_3, arg_34_4)
	local var_34_0 = arg_34_4 .. arg_34_1
	local var_34_1 = var_34_0

	arg_34_0:FromPlural(var_34_0, "", arg_34_2, 1, function(arg_35_0)
		arg_35_0:SetActive(true)

		if ShipExpressionHelper.DefaultFaceless(arg_34_1) then
			setActive(tf(arg_35_0):Find("face"), true)
		end

		arg_34_3(arg_35_0)
	end)
end

function var_0_0.ReturnPaintingWithPrefix(arg_36_0, arg_36_1, arg_36_2, arg_36_3)
	local var_36_0 = arg_36_3 .. arg_36_1

	if IsNil(arg_36_2) then
		Debugger.LogError(debug.traceback("empty go: " .. arg_36_1))
	elseif arg_36_0.pools_plural[var_36_0] then
		setActiveViaLayer(arg_36_2, true)

		local var_36_1 = tf(arg_36_2):Find("face")

		if var_36_1 then
			setActive(var_36_1, false)
		end

		arg_36_2:SetActive(false)
		arg_36_2.transform:SetParent(arg_36_0.root, false)
		arg_36_0.pools_plural[var_36_0]:Enqueue(arg_36_2)
		arg_36_0:ExcessPainting()
	else
		var_0_4.Destroy(arg_36_2)
	end
end

function var_0_0.GetSprite(arg_37_0, arg_37_1, arg_37_2, arg_37_3, arg_37_4)
	arg_37_0:FromObjPack(arg_37_1, tostring(arg_37_2), typeof(Sprite), arg_37_3, function(arg_38_0)
		arg_37_4(arg_38_0)
	end)
end

function var_0_0.DecreasSprite(arg_39_0, arg_39_1, arg_39_2)
	local var_39_0 = arg_39_1

	if arg_39_0.pools_pack[var_39_0] then
		arg_39_0.pools_pack[var_39_0]:Remove(arg_39_2)

		if arg_39_0.pools_pack[var_39_0]:GetAmount() <= 0 then
			arg_39_0:RemovePoolsPack(var_39_0)
		end
	end
end

function var_0_0.DestroySprite(arg_40_0, arg_40_1)
	arg_40_0:RemovePoolsPack(arg_40_1)
end

function var_0_0.DestroyAllSprite(arg_41_0)
	local var_41_0 = arg_41_0:SpriteMemUsage()
	local var_41_1 = 24

	print("cached sprite size: " .. math.ceil(var_41_0 * 10) / 10 .. "/" .. var_41_1 .. "MB")

	for iter_41_0, iter_41_1 in pairs(arg_41_0.pools_pack) do
		arg_41_0:RemovePoolsPack(iter_41_0)
	end

	var_0_5:unloadUnusedAssetBundles()
end

function var_0_0.DisplayPoolPacks(arg_42_0)
	local var_42_0

	for iter_42_0, iter_42_1 in pairs(arg_42_0.pools_pack) do
		table.insert(var_42_0, iter_42_0)

		for iter_42_2, iter_42_3 in pairs(iter_42_1.items) do
			table.insert(var_42_0, string.format("assetName:%s type:%s", iter_42_2, tostring(iter_42_1.type.FullName)))
		end
	end

	warning(table.concat(var_42_0, "\n"))
end

function var_0_0.SpriteMemUsage(arg_43_0)
	local var_43_0 = 0
	local var_43_1 = 9.5367431640625e-07
	local var_43_2 = typeof(Sprite)

	for iter_43_0, iter_43_1 in pairs(arg_43_0.pools_pack) do
		local var_43_3 = {}

		for iter_43_2, iter_43_3 in pairs(iter_43_1.items) do
			if iter_43_1.typeDic[iter_43_2] == var_43_2 then
				local var_43_4 = iter_43_1.items[iter_43_2].texture
				local var_43_5 = var_43_4.name

				if not var_43_3[var_43_5] then
					local var_43_6 = 4
					local var_43_7 = var_43_4.format

					if var_43_7 == TextureFormat.RGB24 then
						var_43_6 = 3
					elseif var_43_7 == TextureFormat.ARGB4444 or var_43_7 == TextureFormat.RGBA4444 then
						var_43_6 = 2
					elseif var_43_7 == TextureFormat.DXT5 or var_43_7 == TextureFormat.ASTC_4x4 or var_43_7 == TextureFormat.ETC2_RGBA8 then
						var_43_6 = 1
					elseif var_43_7 == TextureFormat.PVRTC_RGB4 or var_43_7 == TextureFormat.PVRTC_RGBA4 or var_43_7 == TextureFormat.ETC_RGB4 or var_43_7 == TextureFormat.ETC2_RGB or var_43_7 == TextureFormat.ASTC_6x6 or var_43_7 == TextureFormat.DXT1 then
						var_43_6 = 0.5
					end

					var_43_0 = var_43_0 + var_43_4.width * var_43_4.height * var_43_6 * var_43_1 / 8
					var_43_3[var_43_5] = true
				end
			end
		end
	end

	return var_43_0
end

local var_0_9 = 64
local var_0_10 = {
	"chapter/",
	"emoji/",
	"world/"
}

function var_0_0.GetPrefab(arg_44_0, arg_44_1, arg_44_2, arg_44_3, arg_44_4, arg_44_5)
	local var_44_0 = arg_44_1

	arg_44_0:FromPlural(arg_44_1, "", arg_44_3, arg_44_5 or var_0_9, function(arg_45_0)
		if string.find(arg_44_1, "emoji/") == 1 then
			local var_45_0 = arg_45_0:GetComponent(typeof(CriManaEffectUI))

			if var_45_0 then
				var_45_0:Pause(false)
			end
		end

		arg_45_0:SetActive(true)
		tf(arg_45_0):SetParent(arg_44_0.root, false)
		arg_44_4(arg_45_0)
	end)
end

function var_0_0.ReturnPrefab(arg_46_0, arg_46_1, arg_46_2, arg_46_3, arg_46_4)
	local var_46_0 = arg_46_1

	if IsNil(arg_46_3) then
		Debugger.LogError(debug.traceback("empty go: " .. arg_46_2))
	elseif arg_46_0.pools_plural[var_46_0] then
		if string.find(arg_46_1, "emoji/") == 1 then
			local var_46_1 = arg_46_3:GetComponent(typeof(CriManaEffectUI))

			if var_46_1 then
				var_46_1:Pause(true)
			end
		end

		arg_46_3:SetActive(false)
		arg_46_3.transform:SetParent(arg_46_0.root, false)
		arg_46_0.pools_plural[var_46_0]:Enqueue(arg_46_3)

		if arg_46_4 and arg_46_0.pools_plural[var_46_0].balance <= 0 and (not arg_46_0.callbacks[var_46_0] or #arg_46_0.callbacks[var_46_0] == 0) then
			arg_46_0:DestroyPrefab(arg_46_1, arg_46_2)
		end
	else
		var_0_4.Destroy(arg_46_3)
	end
end

function var_0_0.DestroyPrefab(arg_47_0, arg_47_1, arg_47_2)
	local var_47_0 = arg_47_1

	if arg_47_0.pools_plural[var_47_0] then
		arg_47_0.pools_plural[var_47_0]:Clear()

		arg_47_0.pools_plural[var_47_0] = nil
	end
end

function var_0_0.DestroyAllPrefab(arg_48_0)
	local var_48_0 = {}

	for iter_48_0, iter_48_1 in pairs(arg_48_0.pools_plural) do
		if _.any(var_0_10, function(arg_49_0)
			return string.find(iter_48_0, arg_49_0) == 1
		end) then
			iter_48_1:Clear()
			table.insert(var_48_0, iter_48_0)
		end
	end

	_.each(var_48_0, function(arg_50_0)
		arg_48_0.pools_plural[arg_50_0] = nil
	end)
end

function var_0_0.DisplayPluralPools(arg_51_0)
	local var_51_0 = ""

	for iter_51_0, iter_51_1 in pairs(arg_51_0.pools_plural) do
		if #var_51_0 > 0 then
			var_51_0 = var_51_0 .. "\n"
		end

		local var_51_1 = _.map({
			iter_51_0,
			"balance",
			iter_51_1.balance,
			"currentItmes",
			#iter_51_1.items
		}, function(arg_52_0)
			return tostring(arg_52_0)
		end)

		var_51_0 = var_51_0 .. " " .. table.concat(var_51_1, " ")
	end

	warning(var_51_0)
end

function var_0_0.GetPluralStatus(arg_53_0, arg_53_1)
	if not arg_53_0.pools_plural[arg_53_1] then
		return "NIL"
	end

	local var_53_0 = arg_53_0.pools_plural[arg_53_1]
	local var_53_1 = _.map({
		arg_53_1,
		"balance",
		var_53_0.balance,
		"currentItmes",
		#var_53_0.items
	}, tostring)

	return table.concat(var_53_1, " ")
end

function var_0_0.FromPlural(arg_54_0, arg_54_1, arg_54_2, arg_54_3, arg_54_4, arg_54_5)
	local var_54_0 = arg_54_2 == "" and arg_54_1 or arg_54_1 .. "|" .. arg_54_2

	local function var_54_1()
		local var_55_0 = arg_54_0.pools_plural[var_54_0]

		var_55_0.index = arg_54_0.pluralIndex
		arg_54_0.pluralIndex = arg_54_0.pluralIndex + 1

		arg_54_5(var_55_0:Dequeue())
	end

	if not arg_54_0.pools_plural[var_54_0] then
		arg_54_0:LoadAsset(arg_54_1, arg_54_2, typeof(Object), arg_54_3, function(arg_56_0)
			if arg_56_0 == nil then
				Debugger.LogError("can not find asset: " .. arg_54_1 .. " : " .. arg_54_2)

				return
			end

			if not arg_54_0.pools_plural[var_54_0] then
				arg_54_0.pools_plural[var_54_0] = var_0_1.New(arg_56_0, arg_54_4)
			end

			var_54_1()
		end, true)
	else
		var_54_1()
	end
end

function var_0_0.FromObjPack(arg_57_0, arg_57_1, arg_57_2, arg_57_3, arg_57_4, arg_57_5)
	local var_57_0 = arg_57_1
	local var_57_1 = {}

	if not arg_57_0.pools_pack[var_57_0] then
		table.insert(var_57_1, function(arg_58_0)
			AssetBundleHelper.LoadAssetBundle(arg_57_1, arg_57_4, true, function(arg_59_0)
				arg_57_0:AddPoolsPack(arg_57_1, arg_59_0)
				arg_58_0()
			end)
		end)
	end

	seriesAsync(var_57_1, function()
		arg_57_5(arg_57_0.pools_pack[var_57_0]:Get(arg_57_2, arg_57_3))
	end)
end

function var_0_0.LoadAsset(arg_61_0, arg_61_1, arg_61_2, arg_61_3, arg_61_4, arg_61_5, arg_61_6)
	arg_61_1, arg_61_2 = HXSet.autoHxShiftPath(arg_61_1, arg_61_2)

	local var_61_0 = arg_61_1 .. "|" .. arg_61_2

	if arg_61_0.callbacks[var_61_0] then
		if not arg_61_4 then
			errorMsg("Sync Loading after async operation")
		end

		table.insert(arg_61_0.callbacks[var_61_0], arg_61_5)
	elseif arg_61_4 then
		arg_61_0.callbacks[var_61_0] = {
			arg_61_5
		}

		var_0_5:getAssetAsync(arg_61_1, arg_61_2, arg_61_3, UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_62_0)
			if arg_61_0.callbacks[var_61_0] then
				local var_62_0 = arg_61_0.callbacks[var_61_0]

				arg_61_0.callbacks[var_61_0] = nil

				while next(var_62_0) do
					table.remove(var_62_0)(arg_62_0)
				end
			end
		end), arg_61_6, false)
	else
		arg_61_5(var_0_5:getAssetSync(arg_61_1, arg_61_2, arg_61_3, arg_61_6, false))
	end
end

function var_0_0.AddPoolsPack(arg_63_0, arg_63_1, arg_63_2)
	if arg_63_0.pools_pack[arg_63_1] then
		arg_63_2:Dispose()
	else
		arg_63_0.pools_pack[arg_63_1] = var_0_3.New(arg_63_1, arg_63_2)
	end
end

function var_0_0.RemovePoolsPack(arg_64_0, arg_64_1)
	if not arg_64_0.pools_pack[arg_64_1] or arg_64_0.preloadDic[arg_64_1] then
		return
	end

	arg_64_0.pools_pack[arg_64_1]:Clear()

	arg_64_0.pools_pack[arg_64_1] = nil
end

function var_0_0.PrintPools(arg_65_0)
	local var_65_0 = ""

	for iter_65_0, iter_65_1 in pairs(arg_65_0.pools_plural) do
		var_65_0 = var_65_0 .. "\n" .. iter_65_0
	end

	warning(var_65_0)
end

function var_0_0.PrintObjPack(arg_66_0)
	local var_66_0 = {}

	for iter_66_0, iter_66_1 in pairs(arg_66_0.pools_pack) do
		table.insert(var_66_0, iter_66_0)

		for iter_66_2, iter_66_3 in pairs(iter_66_1.items) do
			table.insert(var_66_0, "    :" .. iter_66_2)
		end
	end

	warning(table.concat(var_66_0, "\n"))
end

return var_0_0
