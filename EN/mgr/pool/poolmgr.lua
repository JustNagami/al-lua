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
	arg_1_0.preloadSprites = {
		shiptype = {
			"battle_hangmu",
			"battle_qingxun",
			"battle_quzhu",
			"battle_weixiu",
			"battle_zhanlie",
			"battle_zhongxun",
			"hangmu",
			"hangxun",
			"hangzhan",
			"leixun",
			"qingxun",
			"quzhu",
			"weixiu",
			"xunyang",
			"zhanlie",
			"zhongxun"
		},
		shipframe = {
			"1",
			"2",
			"3",
			"4",
			"4_0",
			"4_1",
			"5",
			"5_0",
			"5_1",
			"prop",
			"prop4_0",
			"prop4_1",
			"prop5_0"
		},
		shipframeb = {
			"b1",
			"b2",
			"b3",
			"b3_1",
			"b4",
			"b4_0",
			"b4_1",
			"b5",
			"b5_0",
			"b5_1",
			"ba",
			"bl",
			"bprop",
			"bprop4_0",
			"bprop4_1",
			"bprop5_0"
		},
		["shipyardicon/unknown"] = {
			""
		},
		skillframe = {
			"skill_red",
			"skill_blue",
			"skill_yellow"
		},
		weaponframes = {
			"bg1",
			"bg2",
			"bg3",
			"bg3_1",
			"bg4",
			"bg4_0",
			"bg4_1",
			"bg5",
			"bg5_0",
			"bg5_1",
			"bg7",
			"bg8",
			"bg9",
			"bg_skin",
			"frame",
			"frame3_1",
			"frame4_0",
			"frame4_1",
			"frame5_0",
			"frame8",
			"frame9",
			"frame_design",
			"frame_design_owned",
			"frame_npc",
			"frame_prop",
			"frame_prop_meta",
			"frame_skin",
			"frame_dorm"
		},
		energy = {
			"express_1",
			"express_2",
			"express_3",
			"express_4"
		}
	}
	arg_1_0.preloadAbs = {
		"custom_builtin",
		"shipstatus",
		"channel",
		"painting/mat",
		"ui/commonui_atlas",
		"ui/share/msgbox_atlas",
		"ui/share/world_common_atlas",
		"skinicon",
		"attricon"
	}
	arg_1_0.ui_tempCache = {}
end

function var_0_0.Init(arg_2_0, arg_2_1)
	print("initializing pool manager...")

	local var_2_0 = 0
	local var_2_1 = table.getCount(arg_2_0.preloadSprites) + #arg_2_0.preloadAbs

	local function var_2_2()
		var_2_0 = var_2_0 + 1

		if var_2_0 == var_2_1 then
			arg_2_1()
		end
	end

	for iter_2_0, iter_2_1 in pairs(arg_2_0.preloadSprites) do
		AssetBundleHelper.LoadAssetBundle(iter_2_0, true, true, function(arg_4_0)
			arg_2_0:AddPoolsPack(iter_2_0, arg_4_0)

			for iter_4_0, iter_4_1 in ipairs(iter_2_1) do
				arg_2_0.pools_pack[iter_2_0]:Get(iter_4_1, typeof(Sprite))
			end

			var_2_2()
		end)
	end

	for iter_2_2, iter_2_3 in ipairs(arg_2_0.preloadAbs) do
		AssetBundleHelper.LoadAssetBundle(iter_2_3, true, false, function(arg_5_0)
			arg_2_0:AddPoolsPack(iter_2_3, arg_5_0)
			var_2_2()
		end)
	end
end

function var_0_0.GetSpineChar(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	local var_6_0 = {}
	local var_6_1 = "char/" .. arg_6_1

	if not arg_6_0.pools_plural[var_6_1] then
		table.insert(var_6_0, function(arg_7_0)
			arg_6_0:GetSpineSkel(arg_6_1, arg_6_2, function(arg_8_0)
				assert(arg_8_0 ~= nil, "Spine角色不存在: " .. arg_6_1)

				if not arg_6_0.pools_plural[var_6_1] then
					arg_8_0 = SpineAnimUI.AnimChar(arg_6_1, arg_8_0)

					arg_8_0:SetActive(false)
					tf(arg_8_0):SetParent(arg_6_0.root, false)

					local var_8_0 = arg_8_0:GetComponent("SkeletonGraphic")

					var_8_0.material = var_8_0.skeletonDataAsset.atlasAssets[0].materials[0]
					arg_6_0.pools_plural[var_6_1] = var_0_1.New(arg_8_0, 1)
				end

				arg_7_0()
			end)
		end)
	end

	seriesAsync(var_6_0, function()
		local var_9_0 = arg_6_0.pools_plural[var_6_1]

		var_9_0.index = arg_6_0.pluralIndex
		arg_6_0.pluralIndex = arg_6_0.pluralIndex + 1

		local var_9_1 = var_9_0:Dequeue()

		var_9_1:SetActive(true)
		arg_6_3(var_9_1)
	end)
end

function var_0_0.ReturnSpineChar(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = "char/" .. arg_10_1

	if IsNil(arg_10_2) then
		Debugger.LogError(debug.traceback("empty go: " .. arg_10_1))
	elseif arg_10_0.pools_plural[var_10_0] then
		if arg_10_2:GetComponent("SkeletonGraphic").allowMultipleCanvasRenderers then
			UIUtil.ClearChildren(arg_10_2, {
				"Renderer"
			})
		else
			UIUtil.ClearChildren(arg_10_2)
		end

		setActiveViaLayer(arg_10_2.transform, true)
		arg_10_2:SetActive(false)
		arg_10_2.transform:SetParent(arg_10_0.root, false)

		arg_10_2.transform.localPosition = Vector3.New(0, 0, 0)
		arg_10_2.transform.localScale = Vector3.New(0.5, 0.5, 1)
		arg_10_2.transform.localRotation = Quaternion.identity

		arg_10_0.pools_plural[var_10_0]:Enqueue(arg_10_2)
		arg_10_0:ExcessSpineChar()
	else
		var_0_4.Destroy(arg_10_2)
	end
end

function var_0_0.ExcessSpineChar(arg_11_0)
	local var_11_0 = 0
	local var_11_1 = 6
	local var_11_2 = {}

	for iter_11_0, iter_11_1 in pairs(arg_11_0.pools_plural) do
		if string.find(iter_11_0, "char/") == 1 then
			table.insert(var_11_2, iter_11_0)
		end
	end

	if var_11_1 < #var_11_2 then
		table.sort(var_11_2, function(arg_12_0, arg_12_1)
			return arg_11_0.pools_plural[arg_12_0].index > arg_11_0.pools_plural[arg_12_1].index
		end)

		for iter_11_2 = var_11_1 + 1, #var_11_2 do
			local var_11_3 = var_11_2[iter_11_2]

			arg_11_0.pools_plural[var_11_3]:Clear()

			arg_11_0.pools_plural[var_11_3] = nil
		end
	end
end

function var_0_0.GetSpineSkel(arg_13_0, arg_13_1, arg_13_2, arg_13_3)
	local var_13_0, var_13_1 = HXSet.autoHxShiftPath("char/" .. arg_13_1, arg_13_1)
	local var_13_2 = var_13_1 .. "_SkeletonData"

	arg_13_0:LoadAsset(var_13_0, "", typeof(Object), arg_13_2, function(arg_14_0)
		arg_13_3(arg_14_0)
	end, true)
end

function var_0_0.IsSpineSkelCached(arg_15_0, arg_15_1)
	local var_15_0 = "char/" .. arg_15_1

	return arg_15_0.pools_plural[var_15_0] ~= nil
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

function var_0_0.GetUI(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
	local var_16_0 = "ui/" .. arg_16_1
	local var_16_1 = table.contains(var_0_6, arg_16_1) and 3 or 1

	arg_16_0:FromPlural(var_16_0, "", arg_16_2, var_16_1, function(arg_17_0)
		local function var_17_0()
			arg_16_3(arg_17_0)
		end

		if table.indexof(var_0_8, arg_16_1) then
			local var_17_1 = var_16_0

			arg_16_0.pools_plural[var_17_1].prefab:GetComponent(typeof(UIArchiver)):Clear()
			arg_17_0:GetComponent(typeof(UIArchiver)):Load(var_17_0)
		else
			var_17_0()
		end
	end, true)
end

function var_0_0.ReturnUI(arg_19_0, arg_19_1, arg_19_2)
	local var_19_0 = "ui/" .. arg_19_1

	if IsNil(arg_19_2) then
		Debugger.LogError(debug.traceback("empty go: " .. arg_19_1))
	elseif arg_19_0.pools_plural[var_19_0] then
		if table.indexof(var_0_6, arg_19_1) then
			arg_19_2.transform:SetParent(arg_19_0.root, false)
		end

		if table.indexof(var_0_7, arg_19_1) or arg_19_0.ui_tempCache[arg_19_1] then
			setActiveViaLayer(arg_19_2.transform, false)
			arg_19_0.pools_plural[var_19_0]:Enqueue(arg_19_2)
		elseif table.indexof(var_0_8, arg_19_1) then
			setActiveViaLayer(arg_19_2.transform, false)
			arg_19_2:GetComponent(typeof(UIArchiver)):Clear()
			arg_19_0.pools_plural[var_19_0]:Enqueue(arg_19_2)
		else
			arg_19_0.pools_plural[var_19_0]:Enqueue(arg_19_2, true)

			if arg_19_0.pools_plural[var_19_0]:AllReturned() and (not arg_19_0.callbacks[var_19_0] or #arg_19_0.callbacks[var_19_0] == 0) then
				arg_19_0.pools_plural[var_19_0]:Clear()

				arg_19_0.pools_plural[var_19_0] = nil
			end
		end
	else
		var_0_4.Destroy(arg_19_2)
	end
end

function var_0_0.HasCacheUI(arg_20_0, arg_20_1)
	local var_20_0 = "ui/" .. arg_20_1

	return arg_20_0.pools_plural[var_20_0] ~= nil
end

function var_0_0.PreloadUI(arg_21_0, arg_21_1, arg_21_2)
	local var_21_0 = {}
	local var_21_1 = "ui/" .. arg_21_1

	if not arg_21_0.pools_plural[var_21_1] then
		table.insert(var_21_0, function(arg_22_0)
			arg_21_0:GetUI(arg_21_1, true, function(arg_23_0)
				arg_21_0.pools_plural[var_21_1]:Enqueue(arg_23_0)
				arg_22_0()
			end)
		end)
	end

	seriesAsync(var_21_0, arg_21_2)
end

function var_0_0.AddTempCache(arg_24_0, arg_24_1)
	arg_24_0.ui_tempCache[arg_24_1] = true
end

function var_0_0.DelTempCache(arg_25_0, arg_25_1)
	arg_25_0.ui_tempCache[arg_25_1] = nil
end

function var_0_0.ClearAllTempCache(arg_26_0)
	for iter_26_0, iter_26_1 in pairs(arg_26_0.ui_tempCache) do
		if iter_26_1 then
			local var_26_0 = "ui/" .. iter_26_0

			if arg_26_0.pools_plural[var_26_0] then
				arg_26_0.pools_plural[var_26_0]:Clear()

				arg_26_0.pools_plural[var_26_0] = nil
			end
		end
	end
end

function var_0_0.PreloadPainting(arg_27_0, arg_27_1, arg_27_2)
	local var_27_0 = {}
	local var_27_1 = "painting/" .. arg_27_1

	if not arg_27_0.pools_plural[var_27_1] then
		table.insert(var_27_0, function(arg_28_0)
			arg_27_0:GetPainting(arg_27_1, true, function(arg_29_0)
				arg_27_0.pools_plural[var_27_1]:Enqueue(arg_29_0)
				arg_28_0()
			end)
		end)
	end

	seriesAsync(var_27_0, arg_27_2)
end

function var_0_0.GetPainting(arg_30_0, arg_30_1, arg_30_2, arg_30_3)
	local var_30_0 = "painting/" .. arg_30_1
	local var_30_1 = var_30_0

	arg_30_0:FromPlural(var_30_0, "", arg_30_2, 1, function(arg_31_0)
		arg_31_0:SetActive(true)

		if ShipExpressionHelper.DefaultFaceless(arg_30_1) then
			setActive(tf(arg_31_0):Find("face"), true)
		end

		arg_30_3(arg_31_0)
	end, true)
end

function var_0_0.ReturnPainting(arg_32_0, arg_32_1, arg_32_2)
	local var_32_0 = "painting/" .. arg_32_1

	if IsNil(arg_32_2) then
		Debugger.LogError(debug.traceback("empty go: " .. arg_32_1))
	elseif arg_32_0.pools_plural[var_32_0] then
		setActiveViaLayer(arg_32_2, true)

		local var_32_1 = tf(arg_32_2):Find("face")

		if var_32_1 then
			setActive(var_32_1, false)
		end

		arg_32_2:SetActive(false)
		arg_32_2.transform:SetParent(arg_32_0.root, false)
		arg_32_0.pools_plural[var_32_0]:Enqueue(arg_32_2)
		arg_32_0:ExcessPainting()
	else
		var_0_4.Destroy(arg_32_2, true)
	end
end

function var_0_0.ExcessPainting(arg_33_0)
	local var_33_0 = 0
	local var_33_1 = 4
	local var_33_2 = {}

	for iter_33_0, iter_33_1 in pairs(arg_33_0.pools_plural) do
		local var_33_3 = string.find(iter_33_0, "painting/")

		if var_33_3 and var_33_3 >= 1 then
			table.insert(var_33_2, iter_33_0)
		end
	end

	if var_33_1 < #var_33_2 then
		table.sort(var_33_2, function(arg_34_0, arg_34_1)
			return arg_33_0.pools_plural[arg_34_0].index > arg_33_0.pools_plural[arg_34_1].index
		end)

		for iter_33_2 = var_33_1 + 1, #var_33_2 do
			local var_33_4 = var_33_2[iter_33_2]

			arg_33_0.pools_plural[var_33_4]:Clear(true)

			arg_33_0.pools_plural[var_33_4] = nil
		end

		var_0_5:unloadUnusedAssetBundles()

		arg_33_0.paintingCount = arg_33_0.paintingCount + 1

		if arg_33_0.paintingCount > 10 then
			arg_33_0.paintingCount = 0

			var_0_5:ResUnloadAsync()
		end
	end
end

function var_0_0.GetPaintingWithPrefix(arg_35_0, arg_35_1, arg_35_2, arg_35_3, arg_35_4)
	local var_35_0 = arg_35_4 .. arg_35_1
	local var_35_1 = var_35_0

	arg_35_0:FromPlural(var_35_0, "", arg_35_2, 1, function(arg_36_0)
		arg_36_0:SetActive(true)

		if ShipExpressionHelper.DefaultFaceless(arg_35_1) then
			setActive(tf(arg_36_0):Find("face"), true)
		end

		arg_35_3(arg_36_0)
	end, true)
end

function var_0_0.ReturnPaintingWithPrefix(arg_37_0, arg_37_1, arg_37_2, arg_37_3)
	local var_37_0 = arg_37_3 .. arg_37_1

	if IsNil(arg_37_2) then
		Debugger.LogError(debug.traceback("empty go: " .. arg_37_1))
	elseif arg_37_0.pools_plural[var_37_0] then
		setActiveViaLayer(arg_37_2, true)

		local var_37_1 = tf(arg_37_2):Find("face")

		if var_37_1 then
			setActive(var_37_1, false)
		end

		arg_37_2:SetActive(false)
		arg_37_2.transform:SetParent(arg_37_0.root, false)
		arg_37_0.pools_plural[var_37_0]:Enqueue(arg_37_2)
		arg_37_0:ExcessPainting()
	else
		var_0_4.Destroy(arg_37_2, true)
	end
end

function var_0_0.GetSprite(arg_38_0, arg_38_1, arg_38_2, arg_38_3, arg_38_4)
	arg_38_0:FromObjPack(arg_38_1, tostring(arg_38_2), typeof(Sprite), arg_38_3, function(arg_39_0)
		arg_38_4(arg_39_0)
	end)
end

function var_0_0.DecreasSprite(arg_40_0, arg_40_1, arg_40_2)
	local var_40_0 = arg_40_1

	if arg_40_0.pools_pack[var_40_0] then
		arg_40_0.pools_pack[var_40_0]:Remove(arg_40_2)

		if arg_40_0.pools_pack[var_40_0]:GetAmount() <= 0 then
			arg_40_0.pools_pack[var_40_0]:Clear()

			arg_40_0.pools_pack[var_40_0] = nil
		end
	end
end

function var_0_0.DestroySprite(arg_41_0, arg_41_1)
	local var_41_0 = arg_41_1

	if arg_41_0.pools_pack[var_41_0] then
		arg_41_0.pools_pack[var_41_0]:Clear()

		arg_41_0.pools_pack[var_41_0] = nil
	end
end

function var_0_0.DestroyAllSprite(arg_42_0)
	local var_42_0 = {}
	local var_42_1 = typeof(Sprite)

	for iter_42_0, iter_42_1 in pairs(arg_42_0.pools_pack) do
		if not arg_42_0.preloadSprites[iter_42_0] and not arg_42_0.preloadAbs[iter_42_0] then
			arg_42_0.pools_pack[iter_42_0]:Clear()

			arg_42_0.pools_pack[iter_42_0] = nil
		end
	end

	var_0_5:unloadUnusedAssetBundles()
end

function var_0_0.DisplayPoolPacks(arg_43_0)
	local var_43_0

	for iter_43_0, iter_43_1 in pairs(arg_43_0.pools_pack) do
		table.insert(var_43_0, iter_43_0)

		for iter_43_2, iter_43_3 in pairs(iter_43_1.items) do
			table.insert(var_43_0, string.format("assetName:%s type:%s", iter_43_2, tostring(iter_43_1.type.FullName)))
		end
	end

	warning(table.concat(var_43_0, "\n"))
end

function var_0_0.SpriteMemUsage(arg_44_0)
	local var_44_0 = 0
	local var_44_1 = 9.5367431640625e-07
	local var_44_2 = typeof(Sprite)

	for iter_44_0, iter_44_1 in pairs(arg_44_0.pools_pack) do
		local var_44_3 = {}

		for iter_44_2, iter_44_3 in pairs(iter_44_1.items) do
			if iter_44_1.typeDic[iter_44_2] == var_44_2 then
				local var_44_4 = iter_44_1.items[iter_44_2].texture
				local var_44_5 = var_44_4.name

				if not var_44_3[var_44_5] then
					local var_44_6 = 4
					local var_44_7 = var_44_4.format

					if var_44_7 == TextureFormat.RGB24 then
						var_44_6 = 3
					elseif var_44_7 == TextureFormat.ARGB4444 or var_44_7 == TextureFormat.RGBA4444 then
						var_44_6 = 2
					elseif var_44_7 == TextureFormat.DXT5 or var_44_7 == TextureFormat.ASTC_4x4 or var_44_7 == TextureFormat.ETC2_RGBA8 then
						var_44_6 = 1
					elseif var_44_7 == TextureFormat.PVRTC_RGB4 or var_44_7 == TextureFormat.PVRTC_RGBA4 or var_44_7 == TextureFormat.ETC_RGB4 or var_44_7 == TextureFormat.ETC2_RGB or var_44_7 == TextureFormat.ASTC_6x6 or var_44_7 == TextureFormat.DXT1 then
						var_44_6 = 0.5
					end

					var_44_0 = var_44_0 + var_44_4.width * var_44_4.height * var_44_6 * var_44_1 / 8
					var_44_3[var_44_5] = true
				end
			end
		end
	end

	return var_44_0
end

local var_0_9 = 64
local var_0_10 = {
	"chapter/",
	"emoji/",
	"world/"
}

function var_0_0.GetPrefab(arg_45_0, arg_45_1, arg_45_2, arg_45_3, arg_45_4, arg_45_5)
	local var_45_0 = arg_45_1

	arg_45_0:FromPlural(arg_45_1, "", arg_45_3, arg_45_5 or var_0_9, function(arg_46_0)
		if string.find(arg_45_1, "emoji/") == 1 then
			local var_46_0 = arg_46_0:GetComponent(typeof(CriManaEffectUI))

			if var_46_0 then
				var_46_0:Pause(false)
			end
		end

		arg_46_0:SetActive(true)
		tf(arg_46_0):SetParent(arg_45_0.root, false)
		arg_45_4(arg_46_0)
	end, true)
end

function var_0_0.ReturnPrefab(arg_47_0, arg_47_1, arg_47_2, arg_47_3, arg_47_4)
	local var_47_0 = arg_47_1

	if IsNil(arg_47_3) then
		Debugger.LogError(debug.traceback("empty go: " .. arg_47_2))
	elseif arg_47_0.pools_plural[var_47_0] then
		if string.find(arg_47_1, "emoji/") == 1 then
			local var_47_1 = arg_47_3:GetComponent(typeof(CriManaEffectUI))

			if var_47_1 then
				var_47_1:Pause(true)
			end
		end

		arg_47_3:SetActive(false)
		arg_47_3.transform:SetParent(arg_47_0.root, false)
		arg_47_0.pools_plural[var_47_0]:Enqueue(arg_47_3)

		if arg_47_4 and arg_47_0.pools_plural[var_47_0].balance <= 0 and (not arg_47_0.callbacks[var_47_0] or #arg_47_0.callbacks[var_47_0] == 0) then
			arg_47_0:DestroyPrefab(arg_47_1, arg_47_2)
		end
	else
		var_0_4.Destroy(arg_47_3)
	end
end

function var_0_0.DestroyPrefab(arg_48_0, arg_48_1, arg_48_2)
	local var_48_0 = arg_48_1

	if arg_48_0.pools_plural[var_48_0] then
		arg_48_0.pools_plural[var_48_0]:Clear()

		arg_48_0.pools_plural[var_48_0] = nil
	end
end

function var_0_0.DestroyAllPrefab(arg_49_0)
	local var_49_0 = {}

	for iter_49_0, iter_49_1 in pairs(arg_49_0.pools_plural) do
		if _.any(var_0_10, function(arg_50_0)
			return string.find(iter_49_0, arg_50_0) == 1
		end) then
			iter_49_1:Clear()
			table.insert(var_49_0, iter_49_0)
		end
	end

	_.each(var_49_0, function(arg_51_0)
		arg_49_0.pools_plural[arg_51_0] = nil
	end)
end

function var_0_0.DisplayPluralPools(arg_52_0)
	local var_52_0 = ""

	for iter_52_0, iter_52_1 in pairs(arg_52_0.pools_plural) do
		if #var_52_0 > 0 then
			var_52_0 = var_52_0 .. "\n"
		end

		local var_52_1 = _.map({
			iter_52_0,
			"balance",
			iter_52_1.balance,
			"currentItmes",
			#iter_52_1.items
		}, function(arg_53_0)
			return tostring(arg_53_0)
		end)

		var_52_0 = var_52_0 .. " " .. table.concat(var_52_1, " ")
	end

	warning(var_52_0)
end

function var_0_0.GetPluralStatus(arg_54_0, arg_54_1)
	if not arg_54_0.pools_plural[arg_54_1] then
		return "NIL"
	end

	local var_54_0 = arg_54_0.pools_plural[arg_54_1]
	local var_54_1 = _.map({
		arg_54_1,
		"balance",
		var_54_0.balance,
		"currentItmes",
		#var_54_0.items
	}, tostring)

	return table.concat(var_54_1, " ")
end

function var_0_0.FromPlural(arg_55_0, arg_55_1, arg_55_2, arg_55_3, arg_55_4, arg_55_5, arg_55_6)
	local var_55_0 = arg_55_2 == "" and arg_55_1 or arg_55_1 .. "|" .. arg_55_2

	local function var_55_1()
		local var_56_0 = arg_55_0.pools_plural[var_55_0]

		var_56_0.index = arg_55_0.pluralIndex
		arg_55_0.pluralIndex = arg_55_0.pluralIndex + 1

		arg_55_5(var_56_0:Dequeue())
	end

	if not arg_55_0.pools_plural[var_55_0] then
		arg_55_0:LoadAsset(arg_55_1, arg_55_2, typeof(Object), arg_55_3, function(arg_57_0)
			if arg_57_0 == nil then
				Debugger.LogError("can not find asset: " .. arg_55_1 .. " : " .. arg_55_2)

				return
			end

			if not arg_55_0.pools_plural[var_55_0] then
				arg_55_0.pools_plural[var_55_0] = var_0_1.New(arg_57_0, arg_55_4)
			end

			var_55_1()
		end, arg_55_6)
	else
		var_55_1()
	end
end

function var_0_0.FromObjPack(arg_58_0, arg_58_1, arg_58_2, arg_58_3, arg_58_4, arg_58_5)
	local var_58_0 = arg_58_1
	local var_58_1 = {}

	if not arg_58_0.pools_pack[var_58_0] then
		table.insert(var_58_1, function(arg_59_0)
			AssetBundleHelper.LoadAssetBundle(arg_58_1, arg_58_4, true, function(arg_60_0)
				arg_58_0:AddPoolsPack(arg_58_1, arg_60_0)
				arg_59_0()
			end)
		end)
	end

	seriesAsync(var_58_1, function()
		arg_58_5(arg_58_0.pools_pack[var_58_0]:Get(arg_58_2, arg_58_3))
	end)
end

function var_0_0.LoadAsset(arg_62_0, arg_62_1, arg_62_2, arg_62_3, arg_62_4, arg_62_5, arg_62_6)
	arg_62_1, arg_62_2 = HXSet.autoHxShiftPath(arg_62_1, arg_62_2)

	local var_62_0 = arg_62_1 .. "|" .. arg_62_2

	if arg_62_0.callbacks[var_62_0] then
		if not arg_62_4 then
			errorMsg("Sync Loading after async operation")
		end

		table.insert(arg_62_0.callbacks[var_62_0], arg_62_5)
	elseif arg_62_4 then
		arg_62_0.callbacks[var_62_0] = {
			arg_62_5
		}

		var_0_5:getAssetAsync(arg_62_1, arg_62_2, arg_62_3, UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_63_0)
			if arg_62_0.callbacks[var_62_0] then
				local var_63_0 = arg_62_0.callbacks[var_62_0]

				arg_62_0.callbacks[var_62_0] = nil

				while next(var_63_0) do
					table.remove(var_63_0)(arg_63_0)
				end
			end
		end), arg_62_6, false)
	else
		arg_62_5(var_0_5:getAssetSync(arg_62_1, arg_62_2, arg_62_3, arg_62_6, false))
	end
end

function var_0_0.AddPoolsPack(arg_64_0, arg_64_1, arg_64_2)
	if arg_64_0.pools_pack[arg_64_1] then
		arg_64_2:Dispose()
	else
		arg_64_0.pools_pack[arg_64_1] = var_0_3.New(arg_64_1, arg_64_2)
	end
end

function var_0_0.PrintPools(arg_65_0)
	local var_65_0 = ""

	for iter_65_0, iter_65_1 in pairs(arg_65_0.pools_plural) do
		var_65_0 = var_65_0 .. "\n" .. iter_65_0
	end

	warning(var_65_0)
end

function var_0_0.PrintObjPack(arg_66_0)
	local var_66_0 = ""

	for iter_66_0, iter_66_1 in pairs(arg_66_0.pools_pack) do
		for iter_66_2, iter_66_3 in pairs(iter_66_1.items) do
			var_66_0 = var_66_0 .. "\n" .. iter_66_0 .. " " .. iter_66_2
		end
	end

	warning(var_66_0)
end

return var_0_0
