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
	arg_1_0.preloads = {
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
			"bprop5_0",
			"bprop5_1"
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
			"frame_skin"
		},
		energy = {
			"express_1",
			"express_2",
			"express_3",
			"express_4"
		},
		shipstatus = {},
		channel = {},
		["painting/mat"] = {}
	}
	arg_1_0.ui_tempCache = {}
end

function var_0_0.Init(arg_2_0, arg_2_1)
	print("initializing pool manager...")

	local var_2_0 = 0
	local var_2_1 = table.getCount(arg_2_0.preloads)

	local function var_2_2()
		var_2_0 = var_2_0 + 1

		if var_2_0 == var_2_1 then
			arg_2_1()
		end
	end

	for iter_2_0, iter_2_1 in pairs(arg_2_0.preloads) do
		if #iter_2_1 > 0 then
			local var_2_3 = 0

			for iter_2_2, iter_2_3 in ipairs(iter_2_1) do
				arg_2_0:GetSprite(iter_2_0, iter_2_3, true, function(arg_4_0)
					var_2_3 = var_2_3 + 1

					if var_2_3 == #iter_2_1 then
						var_2_2()
					end
				end)
			end
		else
			buildTempAB(iter_2_0, function(arg_5_0)
				var_2_2()
			end)
		end
	end
end

function var_0_0.GetSpineChar(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	local var_6_0 = ("char/" .. arg_6_1) .. arg_6_1

	local function var_6_1()
		local var_7_0 = arg_6_0.pools_plural[var_6_0]

		var_7_0.index = arg_6_0.pluralIndex
		arg_6_0.pluralIndex = arg_6_0.pluralIndex + 1

		local var_7_1 = var_7_0:Dequeue()

		var_7_1:SetActive(true)
		arg_6_3(var_7_1)
	end

	if not arg_6_0.pools_plural[var_6_0] then
		arg_6_0:GetSpineSkel(arg_6_1, arg_6_2, function(arg_8_0)
			assert(arg_8_0 ~= nil, "Spine角色不存在: " .. arg_6_1)

			if not arg_6_0.pools_plural[var_6_0] then
				arg_8_0 = SpineAnimUI.AnimChar(arg_6_1, arg_8_0)

				arg_8_0:SetActive(false)
				tf(arg_8_0):SetParent(arg_6_0.root, false)

				local var_8_0 = arg_8_0:GetComponent("SkeletonGraphic")

				var_8_0.material = var_8_0.skeletonDataAsset.atlasAssets[0].materials[0]
				arg_6_0.pools_plural[var_6_0] = var_0_1.New(arg_8_0, 1)
			end

			var_6_1()
		end)
	else
		var_6_1()
	end
end

function var_0_0.ReturnSpineChar(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = ("char/" .. arg_9_1) .. arg_9_1

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

	arg_12_0:LoadAsset(var_12_0, var_12_2, arg_12_2, typeof(Object), function(arg_13_0)
		arg_12_3(arg_13_0)
	end, true)
end

function var_0_0.IsSpineSkelCached(arg_14_0, arg_14_1)
	local var_14_0 = ("char/" .. arg_14_1) .. arg_14_1

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
	"ToastUI",
	"MsgBox",
	"TipPanel",
	"Loading",
	"WorldUI"
}
local var_0_8 = {
	"WorldAllocateUI"
}

function var_0_0.GetUI(arg_15_0, arg_15_1, arg_15_2, arg_15_3)
	local var_15_0 = "ui/" .. arg_15_1
	local var_15_1 = table.contains(var_0_6, arg_15_1) and 3 or 1
	local var_15_2 = table.contains(var_0_7, arg_15_1) or table.contains(var_0_8, arg_15_1)

	arg_15_0:FromPlural(var_15_0, arg_15_1, arg_15_2, var_15_1, function(arg_16_0)
		local function var_16_0()
			arg_15_3(arg_16_0)
		end

		if table.indexof(var_0_8, arg_15_1) then
			local var_16_1 = var_15_0 .. arg_15_1

			arg_15_0.pools_plural[var_16_1].prefab:GetComponent(typeof(UIArchiver)):Clear()
			arg_16_0:GetComponent(typeof(UIArchiver)):Load(var_16_0)
		else
			var_16_0()
		end
	end, var_15_2)
end

function var_0_0.BuildUIPlural(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = "ui/" .. arg_18_1
	local var_18_1 = var_18_0 .. arg_18_1

	if arg_18_0.pools_plural[var_18_1] then
		return
	end

	local var_18_2 = table.contains(var_0_6, arg_18_1) and 3 or 1
	local var_18_3 = table.contains(var_0_7, arg_18_1) or table.contains(var_0_8, arg_18_1)

	arg_18_0:LoadAsset(var_18_0, arg_18_1, true, typeof(Object), function(arg_19_0)
		if arg_19_0 == nil then
			Debugger.LogError("can not find asset: " .. var_18_0 .. " : " .. arg_18_1)

			return
		end

		if not arg_18_0.pools_plural[var_18_1] then
			arg_18_0.pools_plural[var_18_1] = var_0_1.New(arg_19_0, var_18_2)
		end

		existCall(arg_18_2)
	end, var_18_3)
end

function var_0_0.ReturnUI(arg_20_0, arg_20_1, arg_20_2)
	local var_20_0 = "ui/" .. arg_20_1
	local var_20_1 = var_20_0 .. arg_20_1

	if IsNil(arg_20_2) then
		Debugger.LogError(debug.traceback("empty go: " .. arg_20_1))
	elseif arg_20_0.pools_plural[var_20_1] then
		if table.indexof(var_0_6, arg_20_1) then
			arg_20_2.transform:SetParent(arg_20_0.root, false)
		end

		if table.indexof(var_0_7, arg_20_1) or arg_20_0.ui_tempCache[arg_20_1] then
			setActiveViaLayer(arg_20_2.transform, false)
			arg_20_0.pools_plural[var_20_1]:Enqueue(arg_20_2)
		elseif table.indexof(var_0_8, arg_20_1) then
			setActiveViaLayer(arg_20_2.transform, false)
			arg_20_2:GetComponent(typeof(UIArchiver)):Clear()
			arg_20_0.pools_plural[var_20_1]:Enqueue(arg_20_2)
		else
			arg_20_0.pools_plural[var_20_1]:Enqueue(arg_20_2, true)

			if arg_20_0.pools_plural[var_20_1]:AllReturned() and (not arg_20_0.callbacks[var_20_1] or #arg_20_0.callbacks[var_20_1] == 0) then
				var_0_5:ClearBundleRef(var_20_0, true, true)
				arg_20_0.pools_plural[var_20_1]:Clear()

				arg_20_0.pools_plural[var_20_1] = nil
			end
		end
	else
		var_0_4.Destroy(arg_20_2)
	end
end

function var_0_0.HasCacheUI(arg_21_0, arg_21_1)
	local var_21_0 = ("ui/" .. arg_21_1) .. arg_21_1

	return arg_21_0.pools_plural[var_21_0] ~= nil
end

function var_0_0.PreloadUI(arg_22_0, arg_22_1, arg_22_2)
	local var_22_0 = {}
	local var_22_1 = ("ui/" .. arg_22_1) .. arg_22_1

	if not arg_22_0.pools_plural[var_22_1] then
		table.insert(var_22_0, function(arg_23_0)
			arg_22_0:GetUI(arg_22_1, true, function(arg_24_0)
				arg_22_0.pools_plural[var_22_1]:Enqueue(arg_24_0)
				arg_23_0()
			end)
		end)
	end

	seriesAsync(var_22_0, arg_22_2)
end

function var_0_0.AddTempCache(arg_25_0, arg_25_1)
	arg_25_0.ui_tempCache[arg_25_1] = true
end

function var_0_0.DelTempCache(arg_26_0, arg_26_1)
	arg_26_0.ui_tempCache[arg_26_1] = nil
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
			var_0_5:ClearBundleRef(var_40_0, true, false)
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
			var_0_5:ClearBundleRef(var_41_0, true, false)
		end
	end
end

function var_0_0.DestroyAllSprite(arg_42_0)
	local var_42_0 = {}
	local var_42_1 = typeof(Sprite)

	for iter_42_0, iter_42_1 in pairs(arg_42_0.pools_pack) do
		if iter_42_1.type == var_42_1 and not arg_42_0.preloads[iter_42_0] then
			var_42_0[iter_42_0] = iter_42_1
		end
	end

	for iter_42_2, iter_42_3 in pairs(var_42_0) do
		local var_42_2 = arg_42_0.pools_pack[iter_42_2]:GetAmount()

		arg_42_0.pools_pack[iter_42_2]:Clear()

		arg_42_0.pools_pack[iter_42_2] = nil

		for iter_42_4 = 1, var_42_2 do
			var_0_5:ClearBundleRef(iter_42_2, true, false)
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
