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
		"shipstatus",
		"channel",
		"painting/mat",
		"ui/commonui_atlas",
		"ui/share/msgbox_atlas",
		"ui/share/world_common_atlas",
		"skinicon",
		"attricon",
		"artresource/effect/chuanwukuang/duang_6_mask",
		"artresource/effect/communicationjamming/line5",
		"artresource/effect/communicationjamming/line6",
		"artresource/effect/wupinkuang/iconcolorfulmask",
		"artresource/effect/wupinkuang/iconcolorfulwave01"
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
		if #iter_2_1 > 0 then
			local var_2_3 = typeof(Sprite)
			local var_2_4 = false

			local function var_2_5(arg_4_0)
				return
			end

			AssetBundleHelper.loadAssetBundleAsync(iter_2_0, function(arg_5_0)
				for iter_5_0, iter_5_1 in ipairs(iter_2_1) do
					local var_5_0 = arg_5_0:LoadAssetSync(iter_5_1, var_2_3, var_2_4, false)
					local var_5_1 = iter_2_0
					local var_5_2 = iter_5_1

					if arg_2_0.pools_pack[var_5_1] and arg_2_0.pools_pack[var_5_1]:Get(var_5_2) then
						var_2_5(arg_2_0.pools_pack[var_5_1]:Get(var_5_2))
					else
						if not arg_2_0.pools_pack[var_5_1] then
							arg_2_0.pools_pack[var_5_1] = var_0_3.New(var_2_3)
						end

						if not arg_2_0.pools_pack[var_5_1]:Get(var_5_2) then
							arg_2_0.pools_pack[var_5_1]:Set(var_5_2, var_5_0)
						end

						var_2_5(var_5_0)
					end
				end

				var_2_2()
			end)
		end
	end

	for iter_2_2, iter_2_3 in ipairs(arg_2_0.preloadAbs) do
		AssetBundleHelper.loadAssetBundleAsync(iter_2_3, function(arg_6_0)
			var_2_2()
		end)
	end
end

function var_0_0.GetSpineChar(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
	local var_7_0 = ("char/" .. arg_7_1) .. arg_7_1

	local function var_7_1()
		local var_8_0 = arg_7_0.pools_plural[var_7_0]

		var_8_0.index = arg_7_0.pluralIndex
		arg_7_0.pluralIndex = arg_7_0.pluralIndex + 1

		local var_8_1 = var_8_0:Dequeue()

		var_8_1:SetActive(true)
		arg_7_3(var_8_1)
	end

	if not arg_7_0.pools_plural[var_7_0] then
		arg_7_0:GetSpineSkel(arg_7_1, arg_7_2, function(arg_9_0)
			assert(arg_9_0 ~= nil, "Spine角色不存在: " .. arg_7_1)

			if not arg_7_0.pools_plural[var_7_0] then
				arg_9_0 = SpineAnimUI.AnimChar(arg_7_1, arg_9_0)

				arg_9_0:SetActive(false)
				tf(arg_9_0):SetParent(arg_7_0.root, false)

				local var_9_0 = arg_9_0:GetComponent("SkeletonGraphic")

				var_9_0.material = var_9_0.skeletonDataAsset.atlasAssets[0].materials[0]
				arg_7_0.pools_plural[var_7_0] = var_0_1.New(arg_9_0, 1)
			end

			var_7_1()
		end)
	else
		var_7_1()
	end
end

function var_0_0.ReturnSpineChar(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = ("char/" .. arg_10_1) .. arg_10_1

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

	arg_13_0:LoadAsset(var_13_0, var_13_2, arg_13_2, typeof(Object), function(arg_14_0)
		arg_13_3(arg_14_0)
	end, true)
end

function var_0_0.IsSpineSkelCached(arg_15_0, arg_15_1)
	local var_15_0 = ("char/" .. arg_15_1) .. arg_15_1

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
	local var_16_2 = table.contains(var_0_7, arg_16_1) or table.contains(var_0_8, arg_16_1)

	arg_16_0:FromPlural(var_16_0, arg_16_1, arg_16_2, var_16_1, function(arg_17_0)
		local function var_17_0()
			arg_16_3(arg_17_0)
		end

		if table.indexof(var_0_8, arg_16_1) then
			local var_17_1 = var_16_0 .. arg_16_1

			arg_16_0.pools_plural[var_17_1].prefab:GetComponent(typeof(UIArchiver)):Clear()
			arg_17_0:GetComponent(typeof(UIArchiver)):Load(var_17_0)
		else
			var_17_0()
		end
	end, var_16_2)
end

function var_0_0.ReturnUI(arg_19_0, arg_19_1, arg_19_2)
	local var_19_0 = "ui/" .. arg_19_1
	local var_19_1 = var_19_0 .. arg_19_1

	if IsNil(arg_19_2) then
		Debugger.LogError(debug.traceback("empty go: " .. arg_19_1))
	elseif arg_19_0.pools_plural[var_19_1] then
		if table.indexof(var_0_6, arg_19_1) then
			arg_19_2.transform:SetParent(arg_19_0.root, false)
		end

		if table.indexof(var_0_7, arg_19_1) or arg_19_0.ui_tempCache[arg_19_1] then
			setActiveViaLayer(arg_19_2.transform, false)
			arg_19_0.pools_plural[var_19_1]:Enqueue(arg_19_2)
		elseif table.indexof(var_0_8, arg_19_1) then
			setActiveViaLayer(arg_19_2.transform, false)
			arg_19_2:GetComponent(typeof(UIArchiver)):Clear()
			arg_19_0.pools_plural[var_19_1]:Enqueue(arg_19_2)
		else
			arg_19_0.pools_plural[var_19_1]:Enqueue(arg_19_2, true)

			if arg_19_0.pools_plural[var_19_1]:AllReturned() and (not arg_19_0.callbacks[var_19_1] or #arg_19_0.callbacks[var_19_1] == 0) then
				var_0_5:ClearBundleRef(var_19_0, true, true)
				arg_19_0.pools_plural[var_19_1]:Clear()

				arg_19_0.pools_plural[var_19_1] = nil
			end
		end
	else
		var_0_4.Destroy(arg_19_2)
	end
end

function var_0_0.HasCacheUI(arg_20_0, arg_20_1)
	local var_20_0 = ("ui/" .. arg_20_1) .. arg_20_1

	return arg_20_0.pools_plural[var_20_0] ~= nil
end

function var_0_0.PreloadUI(arg_21_0, arg_21_1, arg_21_2)
	local var_21_0 = {}
	local var_21_1 = ("ui/" .. arg_21_1) .. arg_21_1

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
			local var_26_1 = var_26_0 .. iter_26_0

			if arg_26_0.pools_plural[var_26_1] then
				var_0_5:ClearBundleRef(var_26_0, true, true)
				arg_26_0.pools_plural[var_26_1]:Clear()

				arg_26_0.pools_plural[var_26_1] = nil
			end
		end
	end
end

function var_0_0.PreloadPainting(arg_27_0, arg_27_1, arg_27_2)
	local var_27_0 = {}
	local var_27_1 = ("painting/" .. arg_27_1) .. arg_27_1

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
	local var_30_1 = var_30_0 .. arg_30_1

	arg_30_0:FromPlural(var_30_0, arg_30_1, arg_30_2, 1, function(arg_31_0)
		arg_31_0:SetActive(true)

		if ShipExpressionHelper.DefaultFaceless(arg_30_1) then
			setActive(tf(arg_31_0):Find("face"), true)
		end

		arg_30_3(arg_31_0)
	end, true)
end

function var_0_0.ReturnPainting(arg_32_0, arg_32_1, arg_32_2)
	local var_32_0 = ("painting/" .. arg_32_1) .. arg_32_1

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

			var_0_5.Inst:ResUnloadAsync()
		end
	end
end

function var_0_0.GetPaintingWithPrefix(arg_35_0, arg_35_1, arg_35_2, arg_35_3, arg_35_4)
	local var_35_0 = arg_35_4 .. arg_35_1
	local var_35_1 = var_35_0 .. arg_35_1

	arg_35_0:FromPlural(var_35_0, arg_35_1, arg_35_2, 1, function(arg_36_0)
		arg_36_0:SetActive(true)

		if ShipExpressionHelper.DefaultFaceless(arg_35_1) then
			setActive(tf(arg_36_0):Find("face"), true)
		end

		arg_35_3(arg_36_0)
	end, true)
end

function var_0_0.ReturnPaintingWithPrefix(arg_37_0, arg_37_1, arg_37_2, arg_37_3)
	local var_37_0 = (arg_37_3 .. arg_37_1) .. arg_37_1

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
	arg_38_0:FromObjPack(arg_38_1, tostring(arg_38_2), arg_38_3, typeof(Sprite), function(arg_39_0)
		arg_38_4(arg_39_0)
	end)
end

function var_0_0.DecreasSprite(arg_40_0, arg_40_1, arg_40_2)
	local var_40_0 = arg_40_1
	local var_40_1 = typeof(Sprite)

	if arg_40_0.pools_pack[var_40_0] and arg_40_0.pools_pack[var_40_0].type == var_40_1 then
		if arg_40_0.pools_pack[var_40_0]:Remove(arg_40_2) then
			var_0_5:ClearBundleRef(var_40_0, false, false)
		end

		if arg_40_0.pools_pack[var_40_0]:GetAmount() <= 0 then
			arg_40_0.pools_pack[var_40_0]:Clear()

			arg_40_0.pools_pack[var_40_0] = nil
		end
	end
end

function var_0_0.DestroySprite(arg_41_0, arg_41_1)
	local var_41_0 = arg_41_1
	local var_41_1 = typeof(Sprite)

	if arg_41_0.pools_pack[var_41_0] and arg_41_0.pools_pack[var_41_0].type == var_41_1 then
		local var_41_2 = arg_41_0.pools_pack[var_41_0]:GetAmount()

		arg_41_0.pools_pack[var_41_0]:Clear()

		arg_41_0.pools_pack[var_41_0] = nil

		for iter_41_0 = 1, var_41_2 do
			var_0_5:ClearBundleRef(var_41_0, false, false)
		end
	end
end

function var_0_0.DestroyAllSprite(arg_42_0)
	local var_42_0 = {}
	local var_42_1 = typeof(Sprite)

	for iter_42_0, iter_42_1 in pairs(arg_42_0.pools_pack) do
		if iter_42_1.type == var_42_1 and not arg_42_0.preloadSprites[iter_42_0] then
			var_42_0[iter_42_0] = iter_42_1
		end
	end

	for iter_42_2, iter_42_3 in pairs(var_42_0) do
		local var_42_2 = arg_42_0.pools_pack[iter_42_2]:GetAmount()

		arg_42_0.pools_pack[iter_42_2]:Clear()

		arg_42_0.pools_pack[iter_42_2] = nil

		for iter_42_4 = 1, var_42_2 do
			var_0_5:ClearBundleRef(iter_42_2, false, false)
		end
	end

	var_0_5:unloadUnusedAssetBundles()
end

function var_0_0.DisplayPoolPacks(arg_43_0)
	local var_43_0 = ""

	for iter_43_0, iter_43_1 in pairs(arg_43_0.pools_pack) do
		for iter_43_2, iter_43_3 in pairs(iter_43_1.items) do
			if #var_43_0 > 0 then
				var_43_0 = var_43_0 .. "\n"
			end

			local var_43_1 = _.map({
				iter_43_0,
				"assetName:",
				iter_43_2,
				"type:",
				iter_43_1.type.FullName
			}, function(arg_44_0)
				return tostring(arg_44_0)
			end)

			var_43_0 = var_43_0 .. " " .. table.concat(var_43_1, " ")
		end
	end

	warning(var_43_0)
end

function var_0_0.SpriteMemUsage(arg_45_0)
	local var_45_0 = 0
	local var_45_1 = 9.5367431640625e-07
	local var_45_2 = typeof(Sprite)

	for iter_45_0, iter_45_1 in pairs(arg_45_0.pools_pack) do
		if iter_45_1.type == var_45_2 then
			local var_45_3 = {}

			for iter_45_2, iter_45_3 in pairs(iter_45_1.items) do
				local var_45_4 = iter_45_3.texture
				local var_45_5 = var_45_4.name

				if not var_45_3[var_45_5] then
					local var_45_6 = 4
					local var_45_7 = var_45_4.format

					if var_45_7 == TextureFormat.RGB24 then
						var_45_6 = 3
					elseif var_45_7 == TextureFormat.ARGB4444 or var_45_7 == TextureFormat.RGBA4444 then
						var_45_6 = 2
					elseif var_45_7 == TextureFormat.DXT5 or var_45_7 == TextureFormat.ETC2_RGBA8 then
						var_45_6 = 1
					elseif var_45_7 == TextureFormat.PVRTC_RGB4 or var_45_7 == TextureFormat.PVRTC_RGBA4 or var_45_7 == TextureFormat.ETC_RGB4 or var_45_7 == TextureFormat.ETC2_RGB or var_45_7 == TextureFormat.DXT1 then
						var_45_6 = 0.5
					end

					var_45_0 = var_45_0 + var_45_4.width * var_45_4.height * var_45_6 * var_45_1
					var_45_3[var_45_5] = true
				end
			end
		end
	end

	return var_45_0
end

local var_0_9 = 64
local var_0_10 = {
	"chapter/",
	"emoji/",
	"world/"
}

function var_0_0.GetPrefab(arg_46_0, arg_46_1, arg_46_2, arg_46_3, arg_46_4, arg_46_5)
	local var_46_0 = arg_46_1 .. arg_46_2

	arg_46_0:FromPlural(arg_46_1, arg_46_2, arg_46_3, arg_46_5 or var_0_9, function(arg_47_0)
		if string.find(arg_46_1, "emoji/") == 1 then
			local var_47_0 = arg_47_0:GetComponent(typeof(CriManaEffectUI))

			if var_47_0 then
				var_47_0:Pause(false)
			end
		end

		arg_47_0:SetActive(true)
		tf(arg_47_0):SetParent(arg_46_0.root, false)
		arg_46_4(arg_47_0)
	end, true)
end

function var_0_0.ReturnPrefab(arg_48_0, arg_48_1, arg_48_2, arg_48_3, arg_48_4)
	local var_48_0 = arg_48_1 .. arg_48_2

	if IsNil(arg_48_3) then
		Debugger.LogError(debug.traceback("empty go: " .. arg_48_2))
	elseif arg_48_0.pools_plural[var_48_0] then
		if string.find(arg_48_1, "emoji/") == 1 then
			local var_48_1 = arg_48_3:GetComponent(typeof(CriManaEffectUI))

			if var_48_1 then
				var_48_1:Pause(true)
			end
		end

		arg_48_3:SetActive(false)
		arg_48_3.transform:SetParent(arg_48_0.root, false)
		arg_48_0.pools_plural[var_48_0]:Enqueue(arg_48_3)

		if arg_48_4 and arg_48_0.pools_plural[var_48_0].balance <= 0 and (not arg_48_0.callbacks[var_48_0] or #arg_48_0.callbacks[var_48_0] == 0) then
			arg_48_0:DestroyPrefab(arg_48_1, arg_48_2)
		end
	else
		var_0_4.Destroy(arg_48_3)
	end
end

function var_0_0.DestroyPrefab(arg_49_0, arg_49_1, arg_49_2)
	local var_49_0 = arg_49_1 .. arg_49_2

	if arg_49_0.pools_plural[var_49_0] then
		arg_49_0.pools_plural[var_49_0]:Clear()

		arg_49_0.pools_plural[var_49_0] = nil

		var_0_5:ClearBundleRef(arg_49_1, true, false)
	end
end

function var_0_0.DestroyAllPrefab(arg_50_0)
	local var_50_0 = {}

	for iter_50_0, iter_50_1 in pairs(arg_50_0.pools_plural) do
		if _.any(var_0_10, function(arg_51_0)
			return string.find(iter_50_0, arg_51_0) == 1
		end) then
			iter_50_1:Clear()
			var_0_5:ClearBundleRef(iter_50_0, true, false)
			table.insert(var_50_0, iter_50_0)
		end
	end

	_.each(var_50_0, function(arg_52_0)
		arg_50_0.pools_plural[arg_52_0] = nil
	end)
end

function var_0_0.DisplayPluralPools(arg_53_0)
	local var_53_0 = ""

	for iter_53_0, iter_53_1 in pairs(arg_53_0.pools_plural) do
		if #var_53_0 > 0 then
			var_53_0 = var_53_0 .. "\n"
		end

		local var_53_1 = _.map({
			iter_53_0,
			"balance",
			iter_53_1.balance,
			"currentItmes",
			#iter_53_1.items
		}, function(arg_54_0)
			return tostring(arg_54_0)
		end)

		var_53_0 = var_53_0 .. " " .. table.concat(var_53_1, " ")
	end

	warning(var_53_0)
end

function var_0_0.GetPluralStatus(arg_55_0, arg_55_1)
	if not arg_55_0.pools_plural[arg_55_1] then
		return "NIL"
	end

	local var_55_0 = arg_55_0.pools_plural[arg_55_1]
	local var_55_1 = _.map({
		arg_55_1,
		"balance",
		var_55_0.balance,
		"currentItmes",
		#var_55_0.items
	}, tostring)

	return table.concat(var_55_1, " ")
end

function var_0_0.FromPlural(arg_56_0, arg_56_1, arg_56_2, arg_56_3, arg_56_4, arg_56_5, arg_56_6)
	local var_56_0 = arg_56_1 .. arg_56_2

	local function var_56_1()
		local var_57_0 = arg_56_0.pools_plural[var_56_0]

		var_57_0.index = arg_56_0.pluralIndex
		arg_56_0.pluralIndex = arg_56_0.pluralIndex + 1

		arg_56_5(var_57_0:Dequeue())
	end

	if not arg_56_0.pools_plural[var_56_0] then
		arg_56_0:LoadAsset(arg_56_1, arg_56_2, arg_56_3, typeof(Object), function(arg_58_0)
			if arg_58_0 == nil then
				Debugger.LogError("can not find asset: " .. arg_56_1 .. " : " .. arg_56_2)

				return
			end

			if not arg_56_0.pools_plural[var_56_0] then
				arg_56_0.pools_plural[var_56_0] = var_0_1.New(arg_58_0, arg_56_4)
			end

			var_56_1()
		end, arg_56_6)
	else
		var_56_1()
	end
end

function var_0_0.FromObjPack(arg_59_0, arg_59_1, arg_59_2, arg_59_3, arg_59_4, arg_59_5)
	local var_59_0 = arg_59_1

	if not arg_59_0.pools_pack[var_59_0] or not arg_59_0.pools_pack[var_59_0]:Get(arg_59_2) then
		arg_59_0:LoadAsset(arg_59_1, arg_59_2, arg_59_3, arg_59_4, function(arg_60_0)
			if arg_60_0 == nil then
				Debugger.LogError("can not find asset: " .. arg_59_1 .. " : " .. arg_59_2)

				return
			end

			if not arg_59_0.pools_pack[var_59_0] then
				arg_59_0.pools_pack[var_59_0] = var_0_3.New(arg_59_4)
			end

			if not arg_59_0.pools_pack[var_59_0]:Get(arg_59_2) then
				arg_59_0.pools_pack[var_59_0]:Set(arg_59_2, arg_60_0)
			end

			arg_59_5(arg_60_0)
		end, false)
	else
		arg_59_5(arg_59_0.pools_pack[var_59_0]:Get(arg_59_2))
	end
end

function var_0_0.LoadAsset(arg_61_0, arg_61_1, arg_61_2, arg_61_3, arg_61_4, arg_61_5, arg_61_6)
	arg_61_1, arg_61_2 = HXSet.autoHxShiftPath(arg_61_1, arg_61_2)

	local var_61_0 = arg_61_1 .. arg_61_2

	if arg_61_0.callbacks[var_61_0] then
		if not arg_61_3 then
			errorMsg("Sync Loading after async operation")
		end

		table.insert(arg_61_0.callbacks[var_61_0], arg_61_5)
	elseif arg_61_3 then
		arg_61_0.callbacks[var_61_0] = {
			arg_61_5
		}

		var_0_5:getAssetAsync(arg_61_1, arg_61_2, arg_61_4, UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_62_0)
			if arg_61_0.callbacks[var_61_0] then
				local var_62_0 = arg_61_0.callbacks[var_61_0]

				arg_61_0.callbacks[var_61_0] = nil

				while next(var_62_0) do
					table.remove(var_62_0)(arg_62_0)
				end
			end
		end), arg_61_6, false)
	else
		arg_61_5(var_0_5:getAssetSync(arg_61_1, arg_61_2, arg_61_4, arg_61_6, false))
	end
end

function var_0_0.PrintPools(arg_63_0)
	local var_63_0 = ""

	for iter_63_0, iter_63_1 in pairs(arg_63_0.pools_plural) do
		var_63_0 = var_63_0 .. "\n" .. iter_63_0
	end

	warning(var_63_0)
end

function var_0_0.PrintObjPack(arg_64_0)
	local var_64_0 = ""

	for iter_64_0, iter_64_1 in pairs(arg_64_0.pools_pack) do
		for iter_64_2, iter_64_3 in pairs(iter_64_1.items) do
			var_64_0 = var_64_0 .. "\n" .. iter_64_0 .. " " .. iter_64_2
		end
	end

	warning(var_64_0)
end

return var_0_0
