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
			"frame_skin"
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
	"ToastUI",
	"MsgBox",
	"TipPanel",
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

function var_0_0.BuildUIPlural(arg_19_0, arg_19_1, arg_19_2)
	local var_19_0 = "ui/" .. arg_19_1
	local var_19_1 = var_19_0 .. arg_19_1

	if arg_19_0.pools_plural[var_19_1] then
		return
	end

	local var_19_2 = table.contains(var_0_6, arg_19_1) and 3 or 1
	local var_19_3 = table.contains(var_0_7, arg_19_1) or table.contains(var_0_8, arg_19_1)

	arg_19_0:LoadAsset(var_19_0, arg_19_1, true, typeof(Object), function(arg_20_0)
		if arg_20_0 == nil then
			Debugger.LogError("can not find asset: " .. var_19_0 .. " : " .. arg_19_1)

			return
		end

		if not arg_19_0.pools_plural[var_19_1] then
			arg_19_0.pools_plural[var_19_1] = var_0_1.New(arg_20_0, var_19_2)
		end

		existCall(arg_19_2)
	end, var_19_3)
end

function var_0_0.ReturnUI(arg_21_0, arg_21_1, arg_21_2)
	local var_21_0 = "ui/" .. arg_21_1
	local var_21_1 = var_21_0 .. arg_21_1

	if IsNil(arg_21_2) then
		Debugger.LogError(debug.traceback("empty go: " .. arg_21_1))
	elseif arg_21_0.pools_plural[var_21_1] then
		if table.indexof(var_0_6, arg_21_1) then
			arg_21_2.transform:SetParent(arg_21_0.root, false)
		end

		if table.indexof(var_0_7, arg_21_1) or arg_21_0.ui_tempCache[arg_21_1] then
			setActiveViaLayer(arg_21_2.transform, false)
			arg_21_0.pools_plural[var_21_1]:Enqueue(arg_21_2)
		elseif table.indexof(var_0_8, arg_21_1) then
			setActiveViaLayer(arg_21_2.transform, false)
			arg_21_2:GetComponent(typeof(UIArchiver)):Clear()
			arg_21_0.pools_plural[var_21_1]:Enqueue(arg_21_2)
		else
			arg_21_0.pools_plural[var_21_1]:Enqueue(arg_21_2, true)

			if arg_21_0.pools_plural[var_21_1]:AllReturned() and (not arg_21_0.callbacks[var_21_1] or #arg_21_0.callbacks[var_21_1] == 0) then
				var_0_5:ClearBundleRef(var_21_0, true, true)
				arg_21_0.pools_plural[var_21_1]:Clear()

				arg_21_0.pools_plural[var_21_1] = nil
			end
		end
	else
		var_0_4.Destroy(arg_21_2)
	end
end

function var_0_0.HasCacheUI(arg_22_0, arg_22_1)
	local var_22_0 = ("ui/" .. arg_22_1) .. arg_22_1

	return arg_22_0.pools_plural[var_22_0] ~= nil
end

function var_0_0.PreloadUI(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = {}
	local var_23_1 = ("ui/" .. arg_23_1) .. arg_23_1

	if not arg_23_0.pools_plural[var_23_1] then
		table.insert(var_23_0, function(arg_24_0)
			arg_23_0:GetUI(arg_23_1, true, function(arg_25_0)
				arg_23_0.pools_plural[var_23_1]:Enqueue(arg_25_0)
				arg_24_0()
			end)
		end)
	end

	seriesAsync(var_23_0, arg_23_2)
end

function var_0_0.AddTempCache(arg_26_0, arg_26_1)
	arg_26_0.ui_tempCache[arg_26_1] = true
end

function var_0_0.DelTempCache(arg_27_0, arg_27_1)
	arg_27_0.ui_tempCache[arg_27_1] = nil
end

function var_0_0.ClearAllTempCache(arg_28_0)
	for iter_28_0, iter_28_1 in pairs(arg_28_0.ui_tempCache) do
		if iter_28_1 then
			local var_28_0 = "ui/" .. iter_28_0
			local var_28_1 = var_28_0 .. iter_28_0

			if arg_28_0.pools_plural[var_28_1] then
				var_0_5:ClearBundleRef(var_28_0, true, true)
				arg_28_0.pools_plural[var_28_1]:Clear()

				arg_28_0.pools_plural[var_28_1] = nil
			end
		end
	end
end

function var_0_0.PreloadPainting(arg_29_0, arg_29_1, arg_29_2)
	local var_29_0 = {}
	local var_29_1 = ("painting/" .. arg_29_1) .. arg_29_1

	if not arg_29_0.pools_plural[var_29_1] then
		table.insert(var_29_0, function(arg_30_0)
			arg_29_0:GetPainting(arg_29_1, true, function(arg_31_0)
				arg_29_0.pools_plural[var_29_1]:Enqueue(arg_31_0)
				arg_30_0()
			end)
		end)
	end

	seriesAsync(var_29_0, arg_29_2)
end

function var_0_0.GetPainting(arg_32_0, arg_32_1, arg_32_2, arg_32_3)
	local var_32_0 = "painting/" .. arg_32_1
	local var_32_1 = var_32_0 .. arg_32_1

	arg_32_0:FromPlural(var_32_0, arg_32_1, arg_32_2, 1, function(arg_33_0)
		arg_33_0:SetActive(true)

		if ShipExpressionHelper.DefaultFaceless(arg_32_1) then
			setActive(tf(arg_33_0):Find("face"), true)
		end

		arg_32_3(arg_33_0)
	end, true)
end

function var_0_0.ReturnPainting(arg_34_0, arg_34_1, arg_34_2)
	local var_34_0 = ("painting/" .. arg_34_1) .. arg_34_1

	if IsNil(arg_34_2) then
		Debugger.LogError(debug.traceback("empty go: " .. arg_34_1))
	elseif arg_34_0.pools_plural[var_34_0] then
		setActiveViaLayer(arg_34_2, true)

		local var_34_1 = tf(arg_34_2):Find("face")

		if var_34_1 then
			setActive(var_34_1, false)
		end

		arg_34_2:SetActive(false)
		arg_34_2.transform:SetParent(arg_34_0.root, false)
		arg_34_0.pools_plural[var_34_0]:Enqueue(arg_34_2)
		arg_34_0:ExcessPainting()
	else
		var_0_4.Destroy(arg_34_2, true)
	end
end

function var_0_0.ExcessPainting(arg_35_0)
	local var_35_0 = 0
	local var_35_1 = 4
	local var_35_2 = {}

	for iter_35_0, iter_35_1 in pairs(arg_35_0.pools_plural) do
		local var_35_3 = string.find(iter_35_0, "painting/")

		if var_35_3 and var_35_3 >= 1 then
			table.insert(var_35_2, iter_35_0)
		end
	end

	if var_35_1 < #var_35_2 then
		table.sort(var_35_2, function(arg_36_0, arg_36_1)
			return arg_35_0.pools_plural[arg_36_0].index > arg_35_0.pools_plural[arg_36_1].index
		end)

		for iter_35_2 = var_35_1 + 1, #var_35_2 do
			local var_35_4 = var_35_2[iter_35_2]

			arg_35_0.pools_plural[var_35_4]:Clear(true)

			arg_35_0.pools_plural[var_35_4] = nil
		end

		var_0_5:unloadUnusedAssetBundles()

		arg_35_0.paintingCount = arg_35_0.paintingCount + 1

		if arg_35_0.paintingCount > 10 then
			arg_35_0.paintingCount = 0

			var_0_5.Inst:ResUnloadAsync()
		end
	end
end

function var_0_0.GetPaintingWithPrefix(arg_37_0, arg_37_1, arg_37_2, arg_37_3, arg_37_4)
	local var_37_0 = arg_37_4 .. arg_37_1
	local var_37_1 = var_37_0 .. arg_37_1

	arg_37_0:FromPlural(var_37_0, arg_37_1, arg_37_2, 1, function(arg_38_0)
		arg_38_0:SetActive(true)

		if ShipExpressionHelper.DefaultFaceless(arg_37_1) then
			setActive(tf(arg_38_0):Find("face"), true)
		end

		arg_37_3(arg_38_0)
	end, true)
end

function var_0_0.ReturnPaintingWithPrefix(arg_39_0, arg_39_1, arg_39_2, arg_39_3)
	local var_39_0 = (arg_39_3 .. arg_39_1) .. arg_39_1

	if IsNil(arg_39_2) then
		Debugger.LogError(debug.traceback("empty go: " .. arg_39_1))
	elseif arg_39_0.pools_plural[var_39_0] then
		setActiveViaLayer(arg_39_2, true)

		local var_39_1 = tf(arg_39_2):Find("face")

		if var_39_1 then
			setActive(var_39_1, false)
		end

		arg_39_2:SetActive(false)
		arg_39_2.transform:SetParent(arg_39_0.root, false)
		arg_39_0.pools_plural[var_39_0]:Enqueue(arg_39_2)
		arg_39_0:ExcessPainting()
	else
		var_0_4.Destroy(arg_39_2, true)
	end
end

function var_0_0.GetSprite(arg_40_0, arg_40_1, arg_40_2, arg_40_3, arg_40_4)
	arg_40_0:FromObjPack(arg_40_1, tostring(arg_40_2), arg_40_3, typeof(Sprite), function(arg_41_0)
		arg_40_4(arg_41_0)
	end)
end

function var_0_0.DecreasSprite(arg_42_0, arg_42_1, arg_42_2)
	local var_42_0 = arg_42_1
	local var_42_1 = typeof(Sprite)

	if arg_42_0.pools_pack[var_42_0] and arg_42_0.pools_pack[var_42_0].type == var_42_1 then
		if arg_42_0.pools_pack[var_42_0]:Remove(arg_42_2) then
			var_0_5:ClearBundleRef(var_42_0, false, false)
		end

		if arg_42_0.pools_pack[var_42_0]:GetAmount() <= 0 then
			arg_42_0.pools_pack[var_42_0]:Clear()

			arg_42_0.pools_pack[var_42_0] = nil
		end
	end
end

function var_0_0.DestroySprite(arg_43_0, arg_43_1)
	local var_43_0 = arg_43_1
	local var_43_1 = typeof(Sprite)

	if arg_43_0.pools_pack[var_43_0] and arg_43_0.pools_pack[var_43_0].type == var_43_1 then
		local var_43_2 = arg_43_0.pools_pack[var_43_0]:GetAmount()

		arg_43_0.pools_pack[var_43_0]:Clear()

		arg_43_0.pools_pack[var_43_0] = nil

		for iter_43_0 = 1, var_43_2 do
			var_0_5:ClearBundleRef(var_43_0, false, false)
		end
	end
end

function var_0_0.DestroyAllSprite(arg_44_0)
	local var_44_0 = {}
	local var_44_1 = typeof(Sprite)

	for iter_44_0, iter_44_1 in pairs(arg_44_0.pools_pack) do
		if iter_44_1.type == var_44_1 and not arg_44_0.preloadSprites[iter_44_0] then
			var_44_0[iter_44_0] = iter_44_1
		end
	end

	for iter_44_2, iter_44_3 in pairs(var_44_0) do
		local var_44_2 = arg_44_0.pools_pack[iter_44_2]:GetAmount()

		arg_44_0.pools_pack[iter_44_2]:Clear()

		arg_44_0.pools_pack[iter_44_2] = nil

		for iter_44_4 = 1, var_44_2 do
			var_0_5:ClearBundleRef(iter_44_2, false, false)
		end
	end

	var_0_5:unloadUnusedAssetBundles()
end

function var_0_0.DisplayPoolPacks(arg_45_0)
	local var_45_0 = ""

	for iter_45_0, iter_45_1 in pairs(arg_45_0.pools_pack) do
		for iter_45_2, iter_45_3 in pairs(iter_45_1.items) do
			if #var_45_0 > 0 then
				var_45_0 = var_45_0 .. "\n"
			end

			local var_45_1 = _.map({
				iter_45_0,
				"assetName:",
				iter_45_2,
				"type:",
				iter_45_1.type.FullName
			}, function(arg_46_0)
				return tostring(arg_46_0)
			end)

			var_45_0 = var_45_0 .. " " .. table.concat(var_45_1, " ")
		end
	end

	warning(var_45_0)
end

function var_0_0.SpriteMemUsage(arg_47_0)
	local var_47_0 = 0
	local var_47_1 = 9.5367431640625e-07
	local var_47_2 = typeof(Sprite)

	for iter_47_0, iter_47_1 in pairs(arg_47_0.pools_pack) do
		if iter_47_1.type == var_47_2 then
			local var_47_3 = {}

			for iter_47_2, iter_47_3 in pairs(iter_47_1.items) do
				local var_47_4 = iter_47_3.texture
				local var_47_5 = var_47_4.name

				if not var_47_3[var_47_5] then
					local var_47_6 = 4
					local var_47_7 = var_47_4.format

					if var_47_7 == TextureFormat.RGB24 then
						var_47_6 = 3
					elseif var_47_7 == TextureFormat.ARGB4444 or var_47_7 == TextureFormat.RGBA4444 then
						var_47_6 = 2
					elseif var_47_7 == TextureFormat.DXT5 or var_47_7 == TextureFormat.ETC2_RGBA8 then
						var_47_6 = 1
					elseif var_47_7 == TextureFormat.PVRTC_RGB4 or var_47_7 == TextureFormat.PVRTC_RGBA4 or var_47_7 == TextureFormat.ETC_RGB4 or var_47_7 == TextureFormat.ETC2_RGB or var_47_7 == TextureFormat.DXT1 then
						var_47_6 = 0.5
					end

					var_47_0 = var_47_0 + var_47_4.width * var_47_4.height * var_47_6 * var_47_1
					var_47_3[var_47_5] = true
				end
			end
		end
	end

	return var_47_0
end

local var_0_9 = 64
local var_0_10 = {
	"chapter/",
	"emoji/",
	"world/"
}

function var_0_0.GetPrefab(arg_48_0, arg_48_1, arg_48_2, arg_48_3, arg_48_4, arg_48_5)
	local var_48_0 = arg_48_1 .. arg_48_2

	arg_48_0:FromPlural(arg_48_1, arg_48_2, arg_48_3, arg_48_5 or var_0_9, function(arg_49_0)
		if string.find(arg_48_1, "emoji/") == 1 then
			local var_49_0 = arg_49_0:GetComponent(typeof(CriManaEffectUI))

			if var_49_0 then
				var_49_0:Pause(false)
			end
		end

		arg_49_0:SetActive(true)
		tf(arg_49_0):SetParent(arg_48_0.root, false)
		arg_48_4(arg_49_0)
	end, true)
end

function var_0_0.ReturnPrefab(arg_50_0, arg_50_1, arg_50_2, arg_50_3, arg_50_4)
	local var_50_0 = arg_50_1 .. arg_50_2

	if IsNil(arg_50_3) then
		Debugger.LogError(debug.traceback("empty go: " .. arg_50_2))
	elseif arg_50_0.pools_plural[var_50_0] then
		if string.find(arg_50_1, "emoji/") == 1 then
			local var_50_1 = arg_50_3:GetComponent(typeof(CriManaEffectUI))

			if var_50_1 then
				var_50_1:Pause(true)
			end
		end

		arg_50_3:SetActive(false)
		arg_50_3.transform:SetParent(arg_50_0.root, false)
		arg_50_0.pools_plural[var_50_0]:Enqueue(arg_50_3)

		if arg_50_4 and arg_50_0.pools_plural[var_50_0].balance <= 0 and (not arg_50_0.callbacks[var_50_0] or #arg_50_0.callbacks[var_50_0] == 0) then
			arg_50_0:DestroyPrefab(arg_50_1, arg_50_2)
		end
	else
		var_0_4.Destroy(arg_50_3)
	end
end

function var_0_0.DestroyPrefab(arg_51_0, arg_51_1, arg_51_2)
	local var_51_0 = arg_51_1 .. arg_51_2

	if arg_51_0.pools_plural[var_51_0] then
		arg_51_0.pools_plural[var_51_0]:Clear()

		arg_51_0.pools_plural[var_51_0] = nil

		var_0_5:ClearBundleRef(arg_51_1, true, false)
	end
end

function var_0_0.DestroyAllPrefab(arg_52_0)
	local var_52_0 = {}

	for iter_52_0, iter_52_1 in pairs(arg_52_0.pools_plural) do
		if _.any(var_0_10, function(arg_53_0)
			return string.find(iter_52_0, arg_53_0) == 1
		end) then
			iter_52_1:Clear()
			var_0_5:ClearBundleRef(iter_52_0, true, false)
			table.insert(var_52_0, iter_52_0)
		end
	end

	_.each(var_52_0, function(arg_54_0)
		arg_52_0.pools_plural[arg_54_0] = nil
	end)
end

function var_0_0.DisplayPluralPools(arg_55_0)
	local var_55_0 = ""

	for iter_55_0, iter_55_1 in pairs(arg_55_0.pools_plural) do
		if #var_55_0 > 0 then
			var_55_0 = var_55_0 .. "\n"
		end

		local var_55_1 = _.map({
			iter_55_0,
			"balance",
			iter_55_1.balance,
			"currentItmes",
			#iter_55_1.items
		}, function(arg_56_0)
			return tostring(arg_56_0)
		end)

		var_55_0 = var_55_0 .. " " .. table.concat(var_55_1, " ")
	end

	warning(var_55_0)
end

function var_0_0.GetPluralStatus(arg_57_0, arg_57_1)
	if not arg_57_0.pools_plural[arg_57_1] then
		return "NIL"
	end

	local var_57_0 = arg_57_0.pools_plural[arg_57_1]
	local var_57_1 = _.map({
		arg_57_1,
		"balance",
		var_57_0.balance,
		"currentItmes",
		#var_57_0.items
	}, tostring)

	return table.concat(var_57_1, " ")
end

function var_0_0.FromPlural(arg_58_0, arg_58_1, arg_58_2, arg_58_3, arg_58_4, arg_58_5, arg_58_6)
	local var_58_0 = arg_58_1 .. arg_58_2

	local function var_58_1()
		local var_59_0 = arg_58_0.pools_plural[var_58_0]

		var_59_0.index = arg_58_0.pluralIndex
		arg_58_0.pluralIndex = arg_58_0.pluralIndex + 1

		arg_58_5(var_59_0:Dequeue())
	end

	if not arg_58_0.pools_plural[var_58_0] then
		arg_58_0:LoadAsset(arg_58_1, arg_58_2, arg_58_3, typeof(Object), function(arg_60_0)
			if arg_60_0 == nil then
				Debugger.LogError("can not find asset: " .. arg_58_1 .. " : " .. arg_58_2)

				return
			end

			if not arg_58_0.pools_plural[var_58_0] then
				arg_58_0.pools_plural[var_58_0] = var_0_1.New(arg_60_0, arg_58_4)
			end

			var_58_1()
		end, arg_58_6)
	else
		var_58_1()
	end
end

function var_0_0.FromObjPack(arg_61_0, arg_61_1, arg_61_2, arg_61_3, arg_61_4, arg_61_5)
	local var_61_0 = arg_61_1

	if not arg_61_0.pools_pack[var_61_0] or not arg_61_0.pools_pack[var_61_0]:Get(arg_61_2) then
		arg_61_0:LoadAsset(arg_61_1, arg_61_2, arg_61_3, arg_61_4, function(arg_62_0)
			if arg_62_0 == nil then
				Debugger.LogError("can not find asset: " .. arg_61_1 .. " : " .. arg_61_2)

				return
			end

			if not arg_61_0.pools_pack[var_61_0] then
				arg_61_0.pools_pack[var_61_0] = var_0_3.New(arg_61_4)
			end

			if not arg_61_0.pools_pack[var_61_0]:Get(arg_61_2) then
				arg_61_0.pools_pack[var_61_0]:Set(arg_61_2, arg_62_0)
			end

			arg_61_5(arg_62_0)
		end, false)
	else
		arg_61_5(arg_61_0.pools_pack[var_61_0]:Get(arg_61_2))
	end
end

function var_0_0.LoadAsset(arg_63_0, arg_63_1, arg_63_2, arg_63_3, arg_63_4, arg_63_5, arg_63_6)
	arg_63_1, arg_63_2 = HXSet.autoHxShiftPath(arg_63_1, arg_63_2)

	local var_63_0 = arg_63_1 .. arg_63_2

	if arg_63_0.callbacks[var_63_0] then
		if not arg_63_3 then
			errorMsg("Sync Loading after async operation")
		end

		table.insert(arg_63_0.callbacks[var_63_0], arg_63_5)
	elseif arg_63_3 then
		arg_63_0.callbacks[var_63_0] = {
			arg_63_5
		}

		var_0_5:getAssetAsync(arg_63_1, arg_63_2, arg_63_4, UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_64_0)
			if arg_63_0.callbacks[var_63_0] then
				local var_64_0 = arg_63_0.callbacks[var_63_0]

				arg_63_0.callbacks[var_63_0] = nil

				while next(var_64_0) do
					table.remove(var_64_0)(arg_64_0)
				end
			end
		end), arg_63_6, false)
	else
		arg_63_5(var_0_5:getAssetSync(arg_63_1, arg_63_2, arg_63_4, arg_63_6, false))
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
