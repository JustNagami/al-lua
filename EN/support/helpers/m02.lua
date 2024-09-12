local var_0_0 = UnityEngine

function flog(arg_1_0, arg_1_1)
	if arg_1_0 and arg_1_1 and pg.ConnectionMgr.GetInstance():isConnected() then
		pg.m02:sendNotification(GAME.SEND_CMD, {
			cmd = "log",
			arg1 = arg_1_0,
			arg2 = arg_1_1
		})
	end
end

function throttle(arg_2_0, arg_2_1, arg_2_2)
	local var_2_0
	local var_2_1
	local var_2_2
	local var_2_3 = 0

	local function var_2_4()
		var_2_3 = arg_2_2 and Time.unscaledTime or 0
		var_2_0 = nil
		var_2_2 = arg_2_0(unpackEx(var_2_1))

		if not var_2_0 then
			var_2_1 = nil
		end
	end

	return function(...)
		local var_4_0 = Time.unscaledTime

		if not var_2_3 and not arg_2_2 then
			var_2_3 = var_4_0
		end

		local var_4_1 = arg_2_1 - (var_4_0 - var_2_3)

		var_2_1 = packEx(...)

		if var_4_1 <= 0 or var_4_1 > arg_2_1 then
			if var_2_0 then
				var_2_0:Stop()

				var_2_0 = nil
			end

			var_2_3 = var_4_0
			var_2_2 = arg_2_0(unpackEx(var_2_1))

			if not var_2_0 then
				var_2_1 = nil
			end
		elseif not var_2_0 and arg_2_2 then
			var_2_0 = Timer.New(var_2_4, var_4_1, 1)

			var_2_0:Start()
		end

		return var_2_2
	end
end

function debounce(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0
	local var_5_1
	local var_5_2
	local var_5_3
	local var_5_4

	local function var_5_5()
		local var_6_0 = Time.unscaledTime - var_5_2

		if var_6_0 < arg_5_1 and var_6_0 > 0 then
			var_5_0 = Timer.New(var_5_5, arg_5_1 - var_6_0, 1)

			var_5_0:Start()
		else
			var_5_0 = nil

			if not arg_5_2 then
				var_5_3 = arg_5_0(unpackEx(var_5_1))

				if not var_5_0 then
					var_5_1 = nil
				end
			else
				arg_5_2 = false
			end
		end
	end

	return function(...)
		var_5_1 = packEx(...)
		var_5_2 = Time.unscaledTime

		local var_7_0 = arg_5_2 and not var_5_0

		if not var_5_0 then
			var_5_0 = Timer.New(var_5_5, arg_5_1, 1)

			var_5_0:Start()
		end

		if var_7_0 then
			var_5_3 = arg_5_0(unpackEx(var_5_1))
			var_5_1 = nil
		end

		return var_5_3
	end
end

function createLog(arg_8_0, arg_8_1)
	if LOG and arg_8_1 then
		return function(...)
			print(arg_8_0 .. ": ", ...)
		end
	else
		print(arg_8_0 .. ": log disabled")

		return function()
			return
		end
	end
end

function getProxy(arg_11_0)
	assert(pg.m02, "game is not started")

	return pg.m02:retrieveProxy(arg_11_0.__cname)
end

function LoadAndInstantiateAsync(arg_12_0, arg_12_1, arg_12_2, arg_12_3, arg_12_4)
	arg_12_4 = defaultValue(arg_12_4, true)
	arg_12_3 = defaultValue(arg_12_3, true)
	arg_12_0, arg_12_1 = HXSet.autoHxShift(arg_12_0 .. "/", arg_12_1)

	ResourceMgr.Inst:getAssetAsync(arg_12_0 .. arg_12_1, arg_12_1, var_0_0.Events.UnityAction_UnityEngine_Object(function(arg_13_0)
		local var_13_0 = Instantiate(arg_13_0)

		arg_12_2(var_13_0)
	end), arg_12_3, arg_12_4)
end

function LoadAndInstantiateSync(arg_14_0, arg_14_1, arg_14_2, arg_14_3)
	arg_14_3 = defaultValue(arg_14_3, true)
	arg_14_2 = defaultValue(arg_14_2, true)
	arg_14_0, arg_14_1 = HXSet.autoHxShift(arg_14_0 .. "/", arg_14_1)

	local var_14_0 = ResourceMgr.Inst:getAssetSync(arg_14_0 .. arg_14_1, arg_14_1, arg_14_2, arg_14_3)

	return (Instantiate(var_14_0))
end

local var_0_1 = {}

function LoadSprite(arg_15_0, arg_15_1)
	arg_15_0, arg_15_1 = HXSet.autoHxShiftPath(arg_15_0, arg_15_1)

	return ResourceMgr.Inst:getAssetSync(arg_15_0, arg_15_1 or "", typeof(Sprite), true, false)
end

function LoadSpriteAtlasAsync(arg_16_0, arg_16_1, arg_16_2)
	arg_16_0, arg_16_1 = HXSet.autoHxShiftPath(arg_16_0, arg_16_1)

	ResourceMgr.Inst:getAssetAsync(arg_16_0, arg_16_1 or "", typeof(Sprite), var_0_0.Events.UnityAction_UnityEngine_Object(function(arg_17_0)
		arg_16_2(arg_17_0)
	end), true, false)
end

function LoadSpriteAsync(arg_18_0, arg_18_1)
	LoadSpriteAtlasAsync(arg_18_0, nil, arg_18_1)
end

function LoadAny(arg_19_0, arg_19_1, arg_19_2)
	arg_19_0, arg_19_1 = HXSet.autoHxShiftPath(arg_19_0, arg_19_1)

	return ResourceMgr.Inst:getAssetSync(arg_19_0, arg_19_1, arg_19_2, true, false)
end

function LoadAnyAsync(arg_20_0, arg_20_1, arg_20_2, arg_20_3)
	arg_20_0, arg_20_1 = HXSet.autoHxShiftPath(arg_20_0, arg_20_1)

	return ResourceMgr.Inst:getAssetAsync(arg_20_0, arg_20_1, arg_20_2, arg_20_3, true, false)
end

function LoadImageSpriteAtlasAsync(arg_21_0, arg_21_1, arg_21_2, arg_21_3)
	local var_21_0 = arg_21_2:GetComponent(typeof(Image))

	var_21_0.enabled = false
	var_0_1[var_21_0] = arg_21_0

	LoadSpriteAtlasAsync(arg_21_0, arg_21_1, function(arg_22_0)
		if not IsNil(var_21_0) and var_0_1[var_21_0] == arg_21_0 then
			var_0_1[var_21_0] = nil
			var_21_0.enabled = true
			var_21_0.sprite = arg_22_0

			if arg_21_3 then
				var_21_0:SetNativeSize()
			end
		end
	end)
end

function LoadImageSpriteAsync(arg_23_0, arg_23_1, arg_23_2)
	LoadImageSpriteAtlasAsync(arg_23_0, nil, arg_23_1, arg_23_2)
end

function GetSpriteFromAtlas(arg_24_0, arg_24_1)
	local var_24_0

	arg_24_0, arg_24_1 = HXSet.autoHxShiftPath(arg_24_0, arg_24_1)

	PoolMgr.GetInstance():GetSprite(arg_24_0, arg_24_1, false, function(arg_25_0)
		var_24_0 = arg_25_0
	end)

	return var_24_0
end

function GetSpriteFromAtlasAsync(arg_26_0, arg_26_1, arg_26_2)
	arg_26_0, arg_26_1 = HXSet.autoHxShiftPath(arg_26_0, arg_26_1)

	PoolMgr.GetInstance():GetSprite(arg_26_0, arg_26_1, true, function(arg_27_0)
		arg_26_2(arg_27_0)
	end)
end

function GetImageSpriteFromAtlasAsync(arg_28_0, arg_28_1, arg_28_2, arg_28_3)
	arg_28_0, arg_28_1 = HXSet.autoHxShiftPath(arg_28_0, arg_28_1)

	local var_28_0 = arg_28_2:GetComponent(typeof(Image))

	var_28_0.enabled = false
	var_0_1[var_28_0] = arg_28_0 .. arg_28_1

	GetSpriteFromAtlasAsync(arg_28_0, arg_28_1, function(arg_29_0)
		if not IsNil(var_28_0) and var_0_1[var_28_0] == arg_28_0 .. arg_28_1 then
			var_0_1[var_28_0] = nil
			var_28_0.enabled = true
			var_28_0.sprite = arg_29_0

			if arg_28_3 then
				var_28_0:SetNativeSize()
			end
		end
	end)
end

function SetAction(arg_30_0, arg_30_1, arg_30_2)
	GetComponent(arg_30_0, "SkeletonGraphic").AnimationState:SetAnimation(0, arg_30_1, defaultValue(arg_30_2, true))
end

function SetActionCallback(arg_31_0, arg_31_1)
	GetOrAddComponent(arg_31_0, typeof(SpineAnimUI)):SetActionCallBack(arg_31_1)
end

function emojiText(arg_32_0, arg_32_1)
	local var_32_0 = AssetBundleHelper.loadAssetBundleSync("emojis")
	local var_32_1 = GetComponent(arg_32_0, "TextMesh")
	local var_32_2 = GetComponent(arg_32_0, "MeshRenderer")
	local var_32_3 = Shader.Find("UI/Unlit/Transparent")
	local var_32_4 = var_32_2.materials
	local var_32_5 = {
		var_32_4[0]
	}
	local var_32_6 = {}
	local var_32_7 = 0

	var_32_1.text = string.gsub(arg_32_1, "#(%d+)#", function(arg_33_0)
		if not var_32_6[arg_33_0] then
			var_32_7 = var_32_7 + 1

			local var_33_0 = Material.New(var_32_3)

			var_33_0.mainTexture = var_32_0:LoadAssetSync("emoji" .. arg_33_0, false, false)

			table.insert(var_32_5, var_33_0)

			var_32_6[arg_33_0] = var_32_7

			local var_33_1 = var_32_7
		end

		return "<quad material=" .. var_32_7 .. " />"
	end)
	var_32_2.materials = var_32_5

	ResourceMgr.Inst:ClearBundleRef("emojis", false, false)
end

function setPaintingImg(arg_34_0, arg_34_1)
	local var_34_0 = LoadSprite("painting/" .. arg_34_1) or LoadSprite("painting/unknown")

	setImageSprite(arg_34_0, var_34_0)
	resetAspectRatio(arg_34_0)
end

function setPaintingPrefab(arg_35_0, arg_35_1, arg_35_2, arg_35_3)
	local var_35_0 = findTF(arg_35_0, "fitter")

	assert(var_35_0, "请添加子物体fitter")
	removeAllChildren(var_35_0)

	local var_35_1 = GetOrAddComponent(var_35_0, "PaintingScaler")

	var_35_1.FrameName = arg_35_2 or ""
	var_35_1.Tween = 1

	local var_35_2 = arg_35_1

	if not arg_35_3 and checkABExist("painting/" .. arg_35_1 .. "_n") and PlayerPrefs.GetInt("paint_hide_other_obj_" .. arg_35_1, 0) ~= 0 then
		arg_35_1 = arg_35_1 .. "_n"
	end

	PoolMgr.GetInstance():GetPainting(arg_35_1, false, function(arg_36_0)
		setParent(arg_36_0, var_35_0, false)

		local var_36_0 = findTF(arg_36_0, "Touch")

		if not IsNil(var_36_0) then
			setActive(var_36_0, false)
		end

		local var_36_1 = findTF(arg_36_0, "hx")

		if not IsNil(var_36_1) then
			setActive(var_36_1, HXSet.isHx())
		end

		ShipExpressionHelper.SetExpression(var_35_0:GetChild(0), var_35_2)
	end)
end

local var_0_2 = {}

function setPaintingPrefabAsync(arg_37_0, arg_37_1, arg_37_2, arg_37_3, arg_37_4)
	local var_37_0 = arg_37_1

	if checkABExist("painting/" .. arg_37_1 .. "_n") and PlayerPrefs.GetInt("paint_hide_other_obj_" .. arg_37_1, 0) ~= 0 then
		arg_37_1 = arg_37_1 .. "_n"
	end

	LoadPaintingPrefabAsync(arg_37_0, var_37_0, arg_37_1, arg_37_2, arg_37_3)
end

function LoadPaintingPrefabAsync(arg_38_0, arg_38_1, arg_38_2, arg_38_3, arg_38_4)
	local var_38_0 = findTF(arg_38_0, "fitter")

	assert(var_38_0, "请添加子物体fitter")
	removeAllChildren(var_38_0)

	local var_38_1 = GetOrAddComponent(var_38_0, "PaintingScaler")

	var_38_1.FrameName = arg_38_3 or ""
	var_38_1.Tween = 1
	var_0_2[arg_38_0] = arg_38_2

	PoolMgr.GetInstance():GetPainting(arg_38_2, true, function(arg_39_0)
		if IsNil(arg_38_0) or var_0_2[arg_38_0] ~= arg_38_2 then
			PoolMgr.GetInstance():ReturnPainting(arg_38_2, arg_39_0)

			return
		else
			setParent(arg_39_0, var_38_0, false)

			var_0_2[arg_38_0] = nil

			ShipExpressionHelper.SetExpression(arg_39_0, arg_38_1)
		end

		local var_39_0 = findTF(arg_39_0, "Touch")

		if not IsNil(var_39_0) then
			setActive(var_39_0, false)
		end

		local var_39_1 = findTF(arg_39_0, "Drag")

		if not IsNil(var_39_1) then
			setActive(var_39_1, false)
		end

		local var_39_2 = findTF(arg_39_0, "hx")

		if not IsNil(var_39_2) then
			setActive(var_39_2, HXSet.isHx())
		end

		if arg_38_4 then
			arg_38_4()
		end
	end)
end

function retPaintingPrefab(arg_40_0, arg_40_1, arg_40_2)
	if arg_40_0 and arg_40_1 then
		local var_40_0 = findTF(arg_40_0, "fitter")

		if var_40_0 and var_40_0.childCount > 0 then
			local var_40_1 = var_40_0:GetChild(0)

			if not IsNil(var_40_1) then
				local var_40_2 = findTF(var_40_1, "Touch")

				if not IsNil(var_40_2) then
					eachChild(var_40_2, function(arg_41_0)
						local var_41_0 = arg_41_0:GetComponent(typeof(Button))

						if not IsNil(var_41_0) then
							removeOnButton(arg_41_0)
						end
					end)
				end

				if not arg_40_2 then
					PoolMgr.GetInstance():ReturnPainting(string.gsub(var_40_1.name, "%(Clone%)", ""), var_40_1.gameObject)
				else
					PoolMgr.GetInstance():ReturnPaintingWithPrefix(string.gsub(var_40_1.name, "%(Clone%)", ""), var_40_1.gameObject, arg_40_2)
				end
			end
		end

		var_0_2[arg_40_0] = nil
	end
end

function numberFormat(arg_42_0, arg_42_1)
	local var_42_0 = ""
	local var_42_1 = tostring(arg_42_0)
	local var_42_2 = string.len(var_42_1)

	if arg_42_1 == nil then
		arg_42_1 = ","
	end

	arg_42_1 = tostring(arg_42_1)

	for iter_42_0 = 1, var_42_2 do
		var_42_0 = string.char(string.byte(var_42_1, var_42_2 + 1 - iter_42_0)) .. var_42_0

		if iter_42_0 % 3 == 0 and var_42_2 - iter_42_0 ~= 0 then
			var_42_0 = arg_42_1 .. var_42_0
		end
	end

	return var_42_0
end

function usMoneyFormat(arg_43_0, arg_43_1)
	local var_43_0 = arg_43_0 % 100
	local var_43_1 = math.floor(arg_43_0 / 100)

	if var_43_0 > 0 then
		var_43_0 = var_43_0 > 10 and var_43_0 or "0" .. var_43_0

		if var_43_1 < 1 then
			return "0." .. var_43_0
		else
			return numberFormat(var_43_1, arg_43_1) .. "." .. var_43_0
		end
	else
		return numberFormat(var_43_1, arg_43_1)
	end
end

function checkPaintingPrefab(arg_44_0, arg_44_1, arg_44_2, arg_44_3, arg_44_4)
	local var_44_0 = findTF(arg_44_0, "fitter")

	assert(var_44_0, "请添加子物体fitter")
	removeAllChildren(var_44_0)

	local var_44_1 = GetOrAddComponent(var_44_0, "PaintingScaler")

	var_44_1.FrameName = arg_44_2 or ""
	var_44_1.Tween = 1

	local var_44_2 = arg_44_4 or "painting/"
	local var_44_3 = arg_44_1

	if not arg_44_3 and checkABExist(var_44_2 .. arg_44_1 .. "_n") and PlayerPrefs.GetInt("paint_hide_other_obj_" .. arg_44_1, 0) ~= 0 then
		arg_44_1 = arg_44_1 .. "_n"
	end

	return var_44_0, arg_44_1, var_44_3
end

function onLoadedPaintingPrefab(arg_45_0)
	local var_45_0 = arg_45_0.paintingTF
	local var_45_1 = arg_45_0.fitterTF
	local var_45_2 = arg_45_0.defaultPaintingName

	setParent(var_45_0, var_45_1, false)

	local var_45_3 = findTF(var_45_0, "Touch")

	if not IsNil(var_45_3) then
		setActive(var_45_3, false)
	end

	local var_45_4 = findTF(var_45_0, "hx")

	if not IsNil(var_45_4) then
		setActive(var_45_4, HXSet.isHx())
	end

	ShipExpressionHelper.SetExpression(var_45_1:GetChild(0), var_45_2)
end

function onLoadedPaintingPrefabAsync(arg_46_0)
	local var_46_0 = arg_46_0.paintingTF
	local var_46_1 = arg_46_0.fitterTF
	local var_46_2 = arg_46_0.objectOrTransform
	local var_46_3 = arg_46_0.paintingName
	local var_46_4 = arg_46_0.defaultPaintingName
	local var_46_5 = arg_46_0.callback

	if IsNil(var_46_2) or var_0_2[var_46_2] ~= var_46_3 then
		PoolMgr.GetInstance():ReturnPainting(var_46_3, var_46_0)

		return
	else
		setParent(var_46_0, var_46_1, false)

		var_0_2[var_46_2] = nil

		ShipExpressionHelper.SetExpression(var_46_0, var_46_4)
	end

	local var_46_6 = findTF(var_46_0, "Touch")

	if not IsNil(var_46_6) then
		setActive(var_46_6, false)
	end

	local var_46_7 = findTF(var_46_0, "hx")

	if not IsNil(var_46_7) then
		setActive(var_46_7, HXSet.isHx())
	end

	if var_46_5 then
		var_46_5()
	end
end

function setCommanderPaintingPrefab(arg_47_0, arg_47_1, arg_47_2, arg_47_3)
	local var_47_0, var_47_1, var_47_2 = checkPaintingPrefab(arg_47_0, arg_47_1, arg_47_2, arg_47_3)

	PoolMgr.GetInstance():GetPaintingWithPrefix(var_47_1, false, function(arg_48_0)
		local var_48_0 = {
			paintingTF = arg_48_0,
			fitterTF = var_47_0,
			defaultPaintingName = var_47_2
		}

		onLoadedPaintingPrefab(var_48_0)
	end, "commanderpainting/")
end

function setCommanderPaintingPrefabAsync(arg_49_0, arg_49_1, arg_49_2, arg_49_3, arg_49_4)
	local var_49_0, var_49_1, var_49_2 = checkPaintingPrefab(arg_49_0, arg_49_1, arg_49_2, arg_49_4)

	var_0_2[arg_49_0] = var_49_1

	PoolMgr.GetInstance():GetPaintingWithPrefix(var_49_1, true, function(arg_50_0)
		local var_50_0 = {
			paintingTF = arg_50_0,
			fitterTF = var_49_0,
			objectOrTransform = arg_49_0,
			paintingName = var_49_1,
			defaultPaintingName = var_49_2,
			callback = arg_49_3
		}

		onLoadedPaintingPrefabAsync(var_50_0)
	end, "commanderpainting/")
end

function retCommanderPaintingPrefab(arg_51_0, arg_51_1)
	retPaintingPrefab(arg_51_0, arg_51_1, "commanderpainting/")
end

function setMetaPaintingPrefab(arg_52_0, arg_52_1, arg_52_2, arg_52_3)
	local var_52_0, var_52_1, var_52_2 = checkPaintingPrefab(arg_52_0, arg_52_1, arg_52_2, arg_52_3)

	PoolMgr.GetInstance():GetPaintingWithPrefix(var_52_1, false, function(arg_53_0)
		local var_53_0 = {
			paintingTF = arg_53_0,
			fitterTF = var_52_0,
			defaultPaintingName = var_52_2
		}

		onLoadedPaintingPrefab(var_53_0)
	end, "metapainting/")
end

function setMetaPaintingPrefabAsync(arg_54_0, arg_54_1, arg_54_2, arg_54_3, arg_54_4)
	local var_54_0, var_54_1, var_54_2 = checkPaintingPrefab(arg_54_0, arg_54_1, arg_54_2, arg_54_4)

	var_0_2[arg_54_0] = var_54_1

	PoolMgr.GetInstance():GetPaintingWithPrefix(var_54_1, true, function(arg_55_0)
		local var_55_0 = {
			paintingTF = arg_55_0,
			fitterTF = var_54_0,
			objectOrTransform = arg_54_0,
			paintingName = var_54_1,
			defaultPaintingName = var_54_2,
			callback = arg_54_3
		}

		onLoadedPaintingPrefabAsync(var_55_0)
	end, "metapainting/")
end

function retMetaPaintingPrefab(arg_56_0, arg_56_1)
	retPaintingPrefab(arg_56_0, arg_56_1, "metapainting/")
end

function setGuildPaintingPrefab(arg_57_0, arg_57_1, arg_57_2, arg_57_3)
	local var_57_0, var_57_1, var_57_2 = checkPaintingPrefab(arg_57_0, arg_57_1, arg_57_2, arg_57_3)

	PoolMgr.GetInstance():GetPaintingWithPrefix(var_57_1, false, function(arg_58_0)
		local var_58_0 = {
			paintingTF = arg_58_0,
			fitterTF = var_57_0,
			defaultPaintingName = var_57_2
		}

		onLoadedPaintingPrefab(var_58_0)
	end, "guildpainting/")
end

function setGuildPaintingPrefabAsync(arg_59_0, arg_59_1, arg_59_2, arg_59_3, arg_59_4)
	local var_59_0, var_59_1, var_59_2 = checkPaintingPrefab(arg_59_0, arg_59_1, arg_59_2, arg_59_4)

	var_0_2[arg_59_0] = var_59_1

	PoolMgr.GetInstance():GetPaintingWithPrefix(var_59_1, true, function(arg_60_0)
		local var_60_0 = {
			paintingTF = arg_60_0,
			fitterTF = var_59_0,
			objectOrTransform = arg_59_0,
			paintingName = var_59_1,
			defaultPaintingName = var_59_2,
			callback = arg_59_3
		}

		onLoadedPaintingPrefabAsync(var_60_0)
	end, "guildpainting/")
end

function retGuildPaintingPrefab(arg_61_0, arg_61_1)
	retPaintingPrefab(arg_61_0, arg_61_1, "guildpainting/")
end

function setShopPaintingPrefab(arg_62_0, arg_62_1, arg_62_2, arg_62_3)
	local var_62_0, var_62_1, var_62_2 = checkPaintingPrefab(arg_62_0, arg_62_1, arg_62_2, arg_62_3)

	PoolMgr.GetInstance():GetPaintingWithPrefix(var_62_1, false, function(arg_63_0)
		local var_63_0 = {
			paintingTF = arg_63_0,
			fitterTF = var_62_0,
			defaultPaintingName = var_62_2
		}

		onLoadedPaintingPrefab(var_63_0)
	end, "shoppainting/")
end

function retShopPaintingPrefab(arg_64_0, arg_64_1)
	retPaintingPrefab(arg_64_0, arg_64_1, "shoppainting/")
end

function setBuildPaintingPrefabAsync(arg_65_0, arg_65_1, arg_65_2, arg_65_3, arg_65_4)
	local var_65_0, var_65_1, var_65_2 = checkPaintingPrefab(arg_65_0, arg_65_1, arg_65_2, arg_65_4)

	var_0_2[arg_65_0] = var_65_1

	PoolMgr.GetInstance():GetPaintingWithPrefix(var_65_1, true, function(arg_66_0)
		local var_66_0 = {
			paintingTF = arg_66_0,
			fitterTF = var_65_0,
			objectOrTransform = arg_65_0,
			paintingName = var_65_1,
			defaultPaintingName = var_65_2,
			callback = arg_65_3
		}

		onLoadedPaintingPrefabAsync(var_66_0)
	end, "buildpainting/")
end

function retBuildPaintingPrefab(arg_67_0, arg_67_1)
	retPaintingPrefab(arg_67_0, arg_67_1, "buildpainting/")
end

function setColorCount(arg_68_0, arg_68_1, arg_68_2)
	setText(arg_68_0, string.format(arg_68_1 < arg_68_2 and "<color=" .. COLOR_RED .. ">%d</color>/%d" or "%d/%d", arg_68_1, arg_68_2))
end

function setColorStr(arg_69_0, arg_69_1)
	return "<color=" .. arg_69_1 .. ">" .. arg_69_0 .. "</color>"
end

function setSizeStr(arg_70_0, arg_70_1)
	local var_70_0, var_70_1 = string.gsub(arg_70_0, "[<]size=%d+[>]", "<size=" .. arg_70_1 .. ">")

	if var_70_1 == 0 then
		var_70_0 = "<size=" .. arg_70_1 .. ">" .. var_70_0 .. "</size>"
	end

	return var_70_0
end

function getBgm(arg_71_0)
	local var_71_0 = pg.voice_bgm[arg_71_0]

	if pg.CriMgr.GetInstance():IsDefaultBGM() then
		return var_71_0 and var_71_0.default_bgm or nil
	elseif var_71_0 then
		if var_71_0.special_bgm and type(var_71_0.special_bgm) == "table" and #var_71_0.special_bgm > 0 and _.all(var_71_0.special_bgm, function(arg_72_0)
			return type(arg_72_0) == "table" and #arg_72_0 > 2 and type(arg_72_0[2]) == "number"
		end) then
			local var_71_1 = Clone(var_71_0.special_bgm)

			table.sort(var_71_1, function(arg_73_0, arg_73_1)
				return arg_73_0[2] > arg_73_1[2]
			end)

			local var_71_2 = ""

			_.each(var_71_1, function(arg_74_0)
				if var_71_2 ~= "" then
					return
				end

				local var_74_0 = arg_74_0[1]
				local var_74_1 = arg_74_0[3]

				switch(var_74_0, {
					function()
						local var_75_0 = var_74_1[1]
						local var_75_1 = var_74_1[2]

						if #var_75_0 == 1 then
							if var_75_0[1] ~= "always" then
								return
							end
						elseif not pg.TimeMgr.GetInstance():inTime(var_75_0) then
							return
						end

						_.each(var_75_1, function(arg_76_0)
							if var_71_2 ~= "" then
								return
							end

							if #arg_76_0 == 2 and pg.TimeMgr.GetInstance():inPeriod(arg_76_0[1]) then
								var_71_2 = arg_76_0[2]
							elseif #arg_76_0 == 3 and pg.TimeMgr.GetInstance():inPeriod(arg_76_0[1], arg_76_0[2]) then
								var_71_2 = arg_76_0[3]
							end
						end)
					end,
					function()
						local var_77_0 = false
						local var_77_1 = ""

						_.each(var_74_1, function(arg_78_0)
							if #arg_78_0 ~= 2 or var_77_0 then
								return
							end

							if pg.NewStoryMgr.GetInstance():IsPlayed(arg_78_0[1]) then
								var_71_2 = arg_78_0[2]

								if var_71_2 ~= "" then
									var_77_1 = var_71_2
								else
									var_71_2 = var_77_1
								end
							else
								var_77_0 = true
							end
						end)
					end
				})
			end)

			return var_71_2 ~= "" and var_71_2 or var_71_0.bgm
		else
			return var_71_0 and var_71_0.bgm or nil
		end
	else
		return nil
	end
end

function playStory(arg_79_0, arg_79_1)
	pg.NewStoryMgr.GetInstance():Play(arg_79_0, arg_79_1)
end

function errorMessage(arg_80_0)
	local var_80_0 = ERROR_MESSAGE[arg_80_0]

	if var_80_0 == nil then
		var_80_0 = ERROR_MESSAGE[9999] .. ":" .. arg_80_0
	end

	return var_80_0
end

function errorTip(arg_81_0, arg_81_1, ...)
	local var_81_0 = pg.gametip[arg_81_0 .. "_error"]
	local var_81_1

	if var_81_0 then
		var_81_1 = var_81_0.tip
	else
		var_81_1 = pg.gametip.common_error.tip
	end

	local var_81_2 = arg_81_0 .. "_error_" .. arg_81_1

	if pg.gametip[var_81_2] then
		local var_81_3 = i18n(var_81_2, ...)

		return var_81_1 .. var_81_3
	else
		local var_81_4 = "common_error_" .. arg_81_1

		if pg.gametip[var_81_4] then
			local var_81_5 = i18n(var_81_4, ...)

			return var_81_1 .. var_81_5
		else
			local var_81_6 = errorMessage(arg_81_1)

			return var_81_1 .. arg_81_1 .. ":" .. var_81_6
		end
	end
end

function colorNumber(arg_82_0, arg_82_1)
	local var_82_0 = "@COLOR_SCOPE"
	local var_82_1 = {}

	arg_82_0 = string.gsub(arg_82_0, "<color=#%x+>", function(arg_83_0)
		table.insert(var_82_1, arg_83_0)

		return var_82_0
	end)
	arg_82_0 = string.gsub(arg_82_0, "%d+%.?%d*%%*", function(arg_84_0)
		return "<color=" .. arg_82_1 .. ">" .. arg_84_0 .. "</color>"
	end)

	if #var_82_1 > 0 then
		local var_82_2 = 0

		return (string.gsub(arg_82_0, var_82_0, function(arg_85_0)
			var_82_2 = var_82_2 + 1

			return var_82_1[var_82_2]
		end))
	else
		return arg_82_0
	end
end

function getBounds(arg_86_0)
	local var_86_0 = LuaHelper.GetWorldCorners(rtf(arg_86_0))
	local var_86_1 = Bounds.New(var_86_0[0], Vector3.zero)

	var_86_1:Encapsulate(var_86_0[2])

	return var_86_1
end

local function var_0_3(arg_87_0, arg_87_1)
	arg_87_0.localScale = Vector3.one
	arg_87_0.anchorMin = Vector2.zero
	arg_87_0.anchorMax = Vector2.one
	arg_87_0.offsetMin = Vector2(arg_87_1[1], arg_87_1[2])
	arg_87_0.offsetMax = Vector2(-arg_87_1[3], -arg_87_1[4])
end

local var_0_4 = {
	frame4_0 = {
		-8,
		-8.5,
		-8,
		-8
	},
	frame5_0 = {
		-8,
		-8.5,
		-8,
		-8
	},
	frame4_1 = {
		-8,
		-8.5,
		-8,
		-8
	},
	frame_design = {
		-16.5,
		-2.5,
		-3.5,
		-16.5
	},
	frame_skin = {
		-16.5,
		-2.5,
		-3.5,
		-16.5
	},
	frame_npc = {
		-4,
		-4,
		-4,
		-4
	},
	frame_store = {
		-17,
		-3,
		-3,
		-18
	},
	frame_prop = {
		-11,
		-12,
		-14,
		-14
	},
	frame_prop_meta = {
		-11,
		-12,
		-14,
		-14
	},
	frame_battle_ui = {
		-16,
		-3.4,
		-2.6,
		-31
	},
	other = {
		-2.5,
		-4.5,
		-3,
		-4.5
	}
}

function setFrame(arg_88_0, arg_88_1, arg_88_2)
	arg_88_1 = tostring(arg_88_1)

	local var_88_0, var_88_1 = unpack((string.split(arg_88_1, "_")))

	if var_88_1 or tonumber(var_88_0) > 5 then
		arg_88_2 = arg_88_2 or "frame" .. arg_88_1
	end

	GetImageSpriteFromAtlasAsync("weaponframes", "frame", arg_88_0)

	local var_88_2 = arg_88_2 and Color.white or Color.NewHex(ItemRarity.Rarity2FrameHexColor(var_88_0 and tonumber(var_88_0) or ItemRarity.Gray))

	setImageColor(arg_88_0, var_88_2)

	local var_88_3 = findTF(arg_88_0, "specialFrame")

	if arg_88_2 then
		if var_88_3 then
			setActive(var_88_3, true)
		else
			var_88_3 = cloneTplTo(arg_88_0, arg_88_0, "specialFrame")

			removeAllChildren(var_88_3)
		end

		var_0_3(var_88_3, var_0_4[arg_88_2] or var_0_4.other)
		GetImageSpriteFromAtlasAsync("weaponframes", arg_88_2, var_88_3)
	elseif var_88_3 then
		setActive(var_88_3, false)
	end
end

function setIconColorful(arg_89_0, arg_89_1, arg_89_2, arg_89_3)
	arg_89_3 = arg_89_3 or {
		[ItemRarity.SSR] = {
			name = "IconColorful",
			active = function(arg_90_0, arg_90_1)
				return not arg_90_1.noIconColorful and arg_90_0 == ItemRarity.SSR
			end
		}
	}

	local var_89_0 = findTF(arg_89_0, "icon_bg/frame")

	for iter_89_0, iter_89_1 in pairs(arg_89_3) do
		local var_89_1 = iter_89_1.name
		local var_89_2 = iter_89_1.active(arg_89_1, arg_89_2)
		local var_89_3 = var_89_0:Find(var_89_1 .. "(Clone)")

		if var_89_3 then
			setActive(var_89_3, var_89_2)
		elseif var_89_2 then
			LoadAndInstantiateAsync("ui", string.lower(var_89_1), function(arg_91_0)
				if IsNil(arg_89_0) or var_89_0:Find(var_89_1 .. "(Clone)") then
					Object.Destroy(arg_91_0)
				else
					setParent(arg_91_0, var_89_0)
					setActive(arg_91_0, var_89_2)
				end
			end)
		end
	end
end

function setIconStars(arg_92_0, arg_92_1, arg_92_2)
	local var_92_0 = findTF(arg_92_0, "icon_bg/startpl")
	local var_92_1 = findTF(arg_92_0, "icon_bg/stars")

	if var_92_1 and var_92_0 then
		setActive(var_92_1, false)
		setActive(var_92_0, false)
	end

	if not var_92_1 or not arg_92_1 then
		return
	end

	for iter_92_0 = 1, math.max(arg_92_2, var_92_1.childCount) do
		setActive(iter_92_0 > var_92_1.childCount and cloneTplTo(var_92_0, var_92_1) or var_92_1:GetChild(iter_92_0 - 1), iter_92_0 <= arg_92_2)
	end

	setActive(var_92_1, true)
end

local function var_0_5(arg_93_0, arg_93_1)
	local var_93_0 = findTF(arg_93_0, "icon_bg/slv")

	if not IsNil(var_93_0) then
		setActive(var_93_0, arg_93_1 > 0)
		setText(findTF(var_93_0, "Text"), arg_93_1)
	end
end

function setIconName(arg_94_0, arg_94_1, arg_94_2)
	local var_94_0 = findTF(arg_94_0, "name")

	if not IsNil(var_94_0) then
		setText(var_94_0, arg_94_1)
		setTextAlpha(var_94_0, (arg_94_2.hideName or arg_94_2.anonymous) and 0 or 1)
	end
end

function setIconCount(arg_95_0, arg_95_1)
	local var_95_0 = findTF(arg_95_0, "icon_bg/count")

	if not IsNil(var_95_0) then
		setText(var_95_0, arg_95_1 and (type(arg_95_1) ~= "number" or arg_95_1 > 0) and arg_95_1 or "")
	end
end

function updateEquipment(arg_96_0, arg_96_1, arg_96_2)
	arg_96_2 = arg_96_2 or {}

	assert(arg_96_1, "equipmentVo can not be nil.")

	local var_96_0 = EquipmentRarity.Rarity2Print(arg_96_1:getConfig("rarity"))

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_96_0, findTF(arg_96_0, "icon_bg"))
	setFrame(findTF(arg_96_0, "icon_bg/frame"), var_96_0)

	local var_96_1 = findTF(arg_96_0, "icon_bg/icon")

	var_0_3(var_96_1, {
		16,
		16,
		16,
		16
	})
	GetImageSpriteFromAtlasAsync("equips/" .. arg_96_1:getConfig("icon"), "", var_96_1)
	setIconStars(arg_96_0, true, arg_96_1:getConfig("rarity"))
	var_0_5(arg_96_0, arg_96_1:getConfig("level") - 1)
	setIconName(arg_96_0, arg_96_1:getConfig("name"), arg_96_2)
	setIconCount(arg_96_0, arg_96_1.count)
	setIconColorful(arg_96_0, arg_96_1:getConfig("rarity") - 1, arg_96_2)
end

function updateItem(arg_97_0, arg_97_1, arg_97_2)
	arg_97_2 = arg_97_2 or {}

	local var_97_0 = ItemRarity.Rarity2Print(arg_97_1:getConfig("rarity"))

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_97_0, findTF(arg_97_0, "icon_bg"))

	local var_97_1

	if arg_97_1:getConfig("type") == 9 then
		var_97_1 = "frame_design"
	elseif arg_97_2.frame then
		var_97_1 = arg_97_2.frame
	end

	setFrame(findTF(arg_97_0, "icon_bg/frame"), var_97_0, var_97_1)

	local var_97_2 = findTF(arg_97_0, "icon_bg/icon")
	local var_97_3 = arg_97_1.icon or arg_97_1:getConfig("icon")

	if arg_97_1:getConfig("type") == Item.LOVE_LETTER_TYPE then
		assert(arg_97_1.extra, "without extra data")

		var_97_3 = "SquareIcon/" .. ShipGroup.getDefaultSkin(arg_97_1.extra).prefab
	end

	GetImageSpriteFromAtlasAsync(var_97_3, "", var_97_2)
	setIconStars(arg_97_0, false)
	setIconName(arg_97_0, arg_97_1:getName(), arg_97_2)
	setIconColorful(arg_97_0, arg_97_1:getConfig("rarity"), arg_97_2)
end

function updateWorldItem(arg_98_0, arg_98_1, arg_98_2)
	arg_98_2 = arg_98_2 or {}

	local var_98_0 = ItemRarity.Rarity2Print(arg_98_1:getConfig("rarity"))

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_98_0, findTF(arg_98_0, "icon_bg"))
	setFrame(findTF(arg_98_0, "icon_bg/frame"), var_98_0)

	local var_98_1 = findTF(arg_98_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync(arg_98_1.icon or arg_98_1:getConfig("icon"), "", var_98_1)
	setIconStars(arg_98_0, false)
	setIconName(arg_98_0, arg_98_1:getConfig("name"), arg_98_2)
	setIconColorful(arg_98_0, arg_98_1:getConfig("rarity"), arg_98_2)
end

function updateWorldCollection(arg_99_0, arg_99_1, arg_99_2)
	arg_99_2 = arg_99_2 or {}

	assert(arg_99_1:getConfigTable(), "world_collection_file_template 和 world_collection_record_template 表中找不到配置: " .. arg_99_1.id)

	local var_99_0 = arg_99_1:getDropRarity()
	local var_99_1 = ItemRarity.Rarity2Print(var_99_0)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_99_1, findTF(arg_99_0, "icon_bg"))
	setFrame(findTF(arg_99_0, "icon_bg/frame"), var_99_1)

	local var_99_2 = findTF(arg_99_0, "icon_bg/icon")
	local var_99_3 = WorldCollectionProxy.GetCollectionType(arg_99_1.id) == WorldCollectionProxy.WorldCollectionType.FILE and "shoucangguangdie" or "shoucangjiaojuan"

	GetImageSpriteFromAtlasAsync("props/" .. var_99_3, "", var_99_2)
	setIconStars(arg_99_0, false)
	setIconName(arg_99_0, arg_99_1:getName(), arg_99_2)
	setIconColorful(arg_99_0, var_99_0, arg_99_2)
end

function updateWorldBuff(arg_100_0, arg_100_1, arg_100_2)
	arg_100_2 = arg_100_2 or {}

	local var_100_0 = pg.world_SLGbuff_data[arg_100_1]

	assert(var_100_0, "找不到大世界buff配置: " .. arg_100_1)

	local var_100_1 = ItemRarity.Rarity2Print(ItemRarity.Gray)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_100_1, findTF(arg_100_0, "icon_bg"))
	setFrame(findTF(arg_100_0, "icon_bg/frame"), var_100_1)

	local var_100_2 = findTF(arg_100_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("world/buff/" .. var_100_0.icon, "", var_100_2)

	local var_100_3 = arg_100_0:Find("icon_bg/stars")

	if not IsNil(var_100_3) then
		setActive(var_100_3, false)
	end

	local var_100_4 = findTF(arg_100_0, "name")

	if not IsNil(var_100_4) then
		setText(var_100_4, var_100_0.name)
	end

	local var_100_5 = findTF(arg_100_0, "icon_bg/count")

	if not IsNil(var_100_5) then
		SetActive(var_100_5, false)
	end
end

function updateShip(arg_101_0, arg_101_1, arg_101_2)
	arg_101_2 = arg_101_2 or {}

	local var_101_0 = arg_101_1:rarity2bgPrint()
	local var_101_1 = arg_101_1:getPainting()

	if arg_101_2.anonymous then
		var_101_0 = "1"
		var_101_1 = "unknown"
	end

	if arg_101_2.unknown_small then
		var_101_1 = "unknown_small"
	end

	local var_101_2 = findTF(arg_101_0, "icon_bg/new")

	if var_101_2 then
		if arg_101_2.isSkin then
			setActive(var_101_2, not arg_101_2.isTimeLimit and arg_101_2.isNew)
		else
			setActive(var_101_2, arg_101_1.virgin)
		end
	end

	local var_101_3 = findTF(arg_101_0, "icon_bg/timelimit")

	if var_101_3 then
		setActive(var_101_3, arg_101_2.isTimeLimit)
	end

	local var_101_4 = findTF(arg_101_0, "icon_bg")

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. (arg_101_2.isSkin and "_skin" or var_101_0), var_101_4)

	local var_101_5 = findTF(arg_101_0, "icon_bg/frame")
	local var_101_6

	if arg_101_1.isNpc then
		var_101_6 = "frame_npc"
	elseif arg_101_1:ShowPropose() then
		var_101_6 = "frame_prop"

		if arg_101_1:isMetaShip() then
			var_101_6 = var_101_6 .. "_meta"
		end
	elseif arg_101_2.isSkin then
		var_101_6 = "frame_skin"
	end

	setFrame(var_101_5, var_101_0, var_101_6)

	if arg_101_2.gray then
		setGray(var_101_4, true, true)
	end

	local var_101_7 = findTF(arg_101_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync((arg_101_2.Q and "QIcon/" or "SquareIcon/") .. var_101_1, "", var_101_7)

	local var_101_8 = findTF(arg_101_0, "icon_bg/lv")

	if var_101_8 then
		setActive(var_101_8, not arg_101_1.isNpc)

		if not arg_101_1.isNpc then
			local var_101_9 = findTF(var_101_8, "Text")

			if var_101_9 and arg_101_1.level then
				setText(var_101_9, arg_101_1.level)
			end
		end
	end

	local var_101_10 = findTF(arg_101_0, "ship_type")

	if var_101_10 then
		setActive(var_101_10, true)
		setImageSprite(var_101_10, GetSpriteFromAtlas("shiptype", shipType2print(arg_101_1:getShipType())))
	end

	local var_101_11 = var_101_4:Find("npc")

	if not IsNil(var_101_11) then
		if var_101_2 and go(var_101_2).activeSelf then
			setActive(var_101_11, false)
		else
			setActive(var_101_11, arg_101_1:isActivityNpc())
		end
	end

	local var_101_12 = arg_101_0:Find("group_locked")

	if var_101_12 then
		setActive(var_101_12, not arg_101_2.isSkin and not getProxy(CollectionProxy):getShipGroup(arg_101_1.groupId))
	end

	setIconStars(arg_101_0, arg_101_2.initStar, arg_101_1:getStar())
	setIconName(arg_101_0, arg_101_2.isSkin and arg_101_1:GetSkinConfig().name or arg_101_1:getName(), arg_101_2)
	setIconColorful(arg_101_0, arg_101_2.isSkin and ItemRarity.Gold or arg_101_1:getRarity() - 1, arg_101_2)
end

function updateCommander(arg_102_0, arg_102_1, arg_102_2)
	arg_102_2 = arg_102_2 or {}

	local var_102_0 = arg_102_1:getDropRarity()
	local var_102_1 = ItemRarity.Rarity2Print(var_102_0)
	local var_102_2 = arg_102_1:getConfig("painting")

	if arg_102_2.anonymous then
		var_102_1 = 1
		var_102_2 = "unknown"
	end

	local var_102_3 = findTF(arg_102_0, "icon_bg")

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_102_1, var_102_3)

	local var_102_4 = findTF(arg_102_0, "icon_bg/frame")

	setFrame(var_102_4, var_102_1)

	if arg_102_2.gray then
		setGray(var_102_3, true, true)
	end

	local var_102_5 = findTF(arg_102_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("CommanderIcon/" .. var_102_2, "", var_102_5)
	setIconStars(arg_102_0, arg_102_2.initStar, 0)
	setIconName(arg_102_0, arg_102_1:getName(), arg_102_2)
end

function updateStrategy(arg_103_0, arg_103_1, arg_103_2)
	arg_103_2 = arg_103_2 or {}

	local var_103_0 = ItemRarity.Rarity2Print(ItemRarity.Gray)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_103_0, findTF(arg_103_0, "icon_bg"))
	setFrame(findTF(arg_103_0, "icon_bg/frame"), var_103_0)

	local var_103_1 = findTF(arg_103_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync((arg_103_1.isWorldBuff and "world/buff/" or "strategyicon/") .. arg_103_1:getIcon(), "", var_103_1)
	setIconStars(arg_103_0, false)
	setIconName(arg_103_0, arg_103_1:getName(), arg_103_2)
	setIconColorful(arg_103_0, ItemRarity.Gray, arg_103_2)
end

function updateFurniture(arg_104_0, arg_104_1, arg_104_2)
	arg_104_2 = arg_104_2 or {}

	local var_104_0 = arg_104_1:getDropRarity()
	local var_104_1 = ItemRarity.Rarity2Print(var_104_0)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_104_1, findTF(arg_104_0, "icon_bg"))
	setFrame(findTF(arg_104_0, "icon_bg/frame"), var_104_1)

	local var_104_2 = findTF(arg_104_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("furnitureicon/" .. arg_104_1:getIcon(), "", var_104_2)
	setIconStars(arg_104_0, false)
	setIconName(arg_104_0, arg_104_1:getName(), arg_104_2)
	setIconColorful(arg_104_0, var_104_0, arg_104_2)
end

function updateSpWeapon(arg_105_0, arg_105_1, arg_105_2)
	arg_105_2 = arg_105_2 or {}

	assert(arg_105_1, "spWeaponVO can not be nil.")
	assert(isa(arg_105_1, SpWeapon), "spWeaponVO is not Equipment.")

	local var_105_0 = ItemRarity.Rarity2Print(arg_105_1:GetRarity())

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_105_0, findTF(arg_105_0, "icon_bg"))
	setFrame(findTF(arg_105_0, "icon_bg/frame"), var_105_0)

	local var_105_1 = findTF(arg_105_0, "icon_bg/icon")

	var_0_3(var_105_1, {
		16,
		16,
		16,
		16
	})
	GetImageSpriteFromAtlasAsync(arg_105_1:GetIconPath(), "", var_105_1)
	setIconStars(arg_105_0, true, arg_105_1:GetRarity())
	var_0_5(arg_105_0, arg_105_1:GetLevel() - 1)
	setIconName(arg_105_0, arg_105_1:GetName(), arg_105_2)
	setIconCount(arg_105_0, arg_105_1.count)
	setIconColorful(arg_105_0, arg_105_1:GetRarity(), arg_105_2)
end

function UpdateSpWeaponSlot(arg_106_0, arg_106_1, arg_106_2)
	local var_106_0 = ItemRarity.Rarity2Print(arg_106_1:GetRarity())

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_106_0, findTF(arg_106_0, "Icon/Mask/icon_bg"))

	local var_106_1 = findTF(arg_106_0, "Icon/Mask/icon_bg/icon")

	arg_106_2 = arg_106_2 or {
		16,
		16,
		16,
		16
	}

	var_0_3(var_106_1, arg_106_2)
	GetImageSpriteFromAtlasAsync(arg_106_1:GetIconPath(), "", var_106_1)

	local var_106_2 = arg_106_1:GetLevel() - 1
	local var_106_3 = findTF(arg_106_0, "Icon/LV")

	setActive(var_106_3, var_106_2 > 0)
	setText(findTF(var_106_3, "Text"), var_106_2)
end

function updateDorm3dFurniture(arg_107_0, arg_107_1, arg_107_2)
	arg_107_2 = arg_107_2 or {}

	local var_107_0 = arg_107_1:getDropRarity()
	local var_107_1 = ItemRarity.Rarity2Print(var_107_0)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_107_1, findTF(arg_107_0, "icon_bg"))
	setFrame(findTF(arg_107_0, "icon_bg/frame"), var_107_1)

	local var_107_2 = findTF(arg_107_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("furnitureicon/" .. arg_107_1:getIcon(), "", var_107_2)
	setIconStars(arg_107_0, false)
	setIconName(arg_107_0, arg_107_1:getName(), arg_107_2)
	setIconColorful(arg_107_0, var_107_0, arg_107_2)
end

function updateDorm3dGift(arg_108_0, arg_108_1, arg_108_2)
	arg_108_2 = arg_108_2 or {}

	local var_108_0 = arg_108_1:getDropRarity()
	local var_108_1 = ItemRarity.Rarity2Print(var_108_0) or ItemRarity.Gray

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_108_1, arg_108_0:Find("icon_bg"))
	setFrame(arg_108_0:Find("icon_bg/frame"), var_108_1)

	local var_108_2 = arg_108_0:Find("icon_bg/icon")

	GetImageSpriteFromAtlasAsync("furnitureicon/" .. arg_108_1:getIcon(), "", var_108_2)
	setIconStars(arg_108_0, false)
	setIconName(arg_108_0, arg_108_1:getName(), arg_108_2)
	setIconColorful(arg_108_0, var_108_0, arg_108_2)
end

function updateDorm3dSkin(arg_109_0, arg_109_1, arg_109_2)
	arg_109_2 = arg_109_2 or {}

	local var_109_0 = arg_109_1:getDropRarity()
	local var_109_1 = ItemRarity.Rarity2Print(var_109_0) or ItemRarity.Gray

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_109_1, arg_109_0:Find("icon_bg"))
	setFrame(arg_109_0:Find("icon_bg/frame"), var_109_1)

	local var_109_2 = arg_109_0:Find("icon_bg/icon")

	setIconStars(arg_109_0, false)
	setIconName(arg_109_0, arg_109_1:getName(), arg_109_2)
	setIconColorful(arg_109_0, var_109_0, arg_109_2)
end

function updateDorm3dIcon(arg_110_0, arg_110_1)
	local var_110_0 = arg_110_1:getConfig("rarity")

	GetImageSpriteFromAtlasAsync("weaponframes", "dorm3d_" .. ItemRarity.Rarity2Print(var_110_0), arg_110_0)

	local var_110_1 = arg_110_0:Find("icon")

	setText(arg_110_0:Find("count/Text"), "x" .. arg_110_1.count)
	setText(arg_110_0:Find("name/Text"), arg_110_1:getName())
end

local var_0_6

function findCullAndClipWorldRect(arg_111_0)
	if #arg_111_0 == 0 then
		return false
	end

	local var_111_0 = arg_111_0[1].canvasRect

	for iter_111_0 = 1, #arg_111_0 do
		var_111_0 = rectIntersect(var_111_0, arg_111_0[iter_111_0].canvasRect)
	end

	if var_111_0.width <= 0 or var_111_0.height <= 0 then
		return false
	end

	var_0_6 = var_0_6 or GameObject.Find("UICamera/Canvas").transform

	local var_111_1 = var_0_6:TransformPoint(Vector3(var_111_0.x, var_111_0.y, 0))
	local var_111_2 = var_0_6:TransformPoint(Vector3(var_111_0.x + var_111_0.width, var_111_0.y + var_111_0.height, 0))

	return true, Vector4(var_111_1.x, var_111_1.y, var_111_2.x, var_111_2.y)
end

function rectIntersect(arg_112_0, arg_112_1)
	local var_112_0 = math.max(arg_112_0.x, arg_112_1.x)
	local var_112_1 = math.min(arg_112_0.x + arg_112_0.width, arg_112_1.x + arg_112_1.width)
	local var_112_2 = math.max(arg_112_0.y, arg_112_1.y)
	local var_112_3 = math.min(arg_112_0.y + arg_112_0.height, arg_112_1.y + arg_112_1.height)

	if var_112_0 <= var_112_1 and var_112_2 <= var_112_3 then
		return var_0_0.Rect.New(var_112_0, var_112_2, var_112_1 - var_112_0, var_112_3 - var_112_2)
	end

	return var_0_0.Rect.New(0, 0, 0, 0)
end

function getDropInfo(arg_113_0)
	local var_113_0 = {}

	for iter_113_0, iter_113_1 in ipairs(arg_113_0) do
		local var_113_1 = Drop.Create(iter_113_1)

		var_113_1.count = var_113_1.count or 1

		if var_113_1.type == DROP_TYPE_EMOJI then
			table.insert(var_113_0, var_113_1:getName())
		else
			table.insert(var_113_0, var_113_1:getName() .. "x" .. var_113_1.count)
		end
	end

	return table.concat(var_113_0, "、")
end

function updateDrop(arg_114_0, arg_114_1, arg_114_2)
	Drop.Change(arg_114_1)

	arg_114_2 = arg_114_2 or {}

	local var_114_0 = {
		{
			"icon_bg/slv"
		},
		{
			"icon_bg/frame/specialFrame"
		},
		{
			"ship_type",
			DROP_TYPE_SHIP
		},
		{
			"icon_bg/new",
			DROP_TYPE_SHIP
		},
		{
			"icon_bg/npc",
			DROP_TYPE_SHIP
		},
		{
			"group_locked",
			DROP_TYPE_SHIP
		}
	}
	local var_114_1

	for iter_114_0, iter_114_1 in ipairs(var_114_0) do
		local var_114_2 = arg_114_0:Find(iter_114_1[1])

		if arg_114_1.type ~= iter_114_1[2] and not IsNil(var_114_2) then
			setActive(var_114_2, false)
		end
	end

	arg_114_0:Find("icon_bg/frame"):GetComponent(typeof(Image)).enabled = true

	setIconColorful(arg_114_0, arg_114_1:getDropRarity(), arg_114_2, {
		[ItemRarity.Gold] = {
			name = "Item_duang5",
			active = function(arg_115_0, arg_115_1)
				return arg_115_1.fromAwardLayer and arg_115_0 >= ItemRarity.Gold
			end
		}
	})
	var_0_3(findTF(arg_114_0, "icon_bg/icon"), {
		2,
		2,
		2,
		2
	})
	arg_114_1:UpdateDropTpl(arg_114_0, arg_114_2)
	setIconCount(arg_114_0, arg_114_2.count or arg_114_1:getCount())
end

function updateBuff(arg_116_0, arg_116_1, arg_116_2)
	arg_116_2 = arg_116_2 or {}

	local var_116_0 = ItemRarity.Rarity2Print(ItemRarity.Gray)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_116_0, findTF(arg_116_0, "icon_bg"))

	local var_116_1 = pg.benefit_buff_template[arg_116_1]

	setFrame(findTF(arg_116_0, "icon_bg/frame"), var_116_0)
	setText(findTF(arg_116_0, "icon_bg/count"), 1)

	local var_116_2 = findTF(arg_116_0, "icon_bg/icon")
	local var_116_3 = var_116_1.icon

	GetImageSpriteFromAtlasAsync(var_116_3, "", var_116_2)
	setIconStars(arg_116_0, false)
	setIconName(arg_116_0, var_116_1.name, arg_116_2)
	setIconColorful(arg_116_0, ItemRarity.Gold, arg_116_2)
end

function updateAttire(arg_117_0, arg_117_1, arg_117_2, arg_117_3)
	local var_117_0 = 4

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_117_0, findTF(arg_117_0, "icon_bg"))
	setFrame(findTF(arg_117_0, "icon_bg/frame"), var_117_0)

	local var_117_1 = findTF(arg_117_0, "icon_bg/icon")
	local var_117_2

	if arg_117_1 == AttireConst.TYPE_CHAT_FRAME then
		var_117_2 = "chat_frame"
	elseif arg_117_1 == AttireConst.TYPE_ICON_FRAME then
		var_117_2 = "icon_frame"
	end

	GetImageSpriteFromAtlasAsync("Props/" .. var_117_2, "", var_117_1)
	setIconName(arg_117_0, arg_117_2.name, arg_117_3)
end

function updateAttireCombatUI(arg_118_0, arg_118_1, arg_118_2, arg_118_3)
	local var_118_0 = arg_118_2.rare

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_118_0, findTF(arg_118_0, "icon_bg"))
	setFrame(findTF(arg_118_0, "icon_bg/frame"), var_118_0, "frame_battle_ui")

	local var_118_1 = findTF(arg_118_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("Props/" .. arg_118_2.display_icon, "", var_118_1)
	setIconName(arg_118_0, arg_118_2.name, arg_118_3)
end

function updateEmoji(arg_119_0, arg_119_1, arg_119_2)
	local var_119_0 = findTF(arg_119_0, "icon_bg/icon")
	local var_119_1 = "icon_emoji"

	GetImageSpriteFromAtlasAsync("Props/" .. var_119_1, "", var_119_0)

	local var_119_2 = 4

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_119_2, findTF(arg_119_0, "icon_bg"))
	setFrame(findTF(arg_119_0, "icon_bg/frame"), var_119_2)
	setIconName(arg_119_0, arg_119_1.name, arg_119_2)
end

function updateEquipmentSkin(arg_120_0, arg_120_1, arg_120_2)
	arg_120_2 = arg_120_2 or {}

	local var_120_0 = EquipmentRarity.Rarity2Print(arg_120_1.rarity)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_120_0, findTF(arg_120_0, "icon_bg"))
	setFrame(findTF(arg_120_0, "icon_bg/frame"), var_120_0, "frame_skin")

	local var_120_1 = findTF(arg_120_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("equips/" .. arg_120_1.icon, "", var_120_1)
	setIconStars(arg_120_0, false)
	setIconName(arg_120_0, arg_120_1.name, arg_120_2)
	setIconCount(arg_120_0, arg_120_1.count)
	setIconColorful(arg_120_0, arg_120_1.rarity - 1, arg_120_2)
end

function NoPosMsgBox(arg_121_0, arg_121_1, arg_121_2, arg_121_3)
	local var_121_0
	local var_121_1 = {}

	if arg_121_1 then
		table.insert(var_121_1, {
			text = "text_noPos_clear",
			atuoClose = true,
			onCallback = arg_121_1
		})
	end

	if arg_121_2 then
		table.insert(var_121_1, {
			text = "text_noPos_buy",
			atuoClose = true,
			onCallback = arg_121_2
		})
	end

	if arg_121_3 then
		table.insert(var_121_1, {
			text = "text_noPos_intensify",
			atuoClose = true,
			onCallback = arg_121_3
		})
	end

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		hideYes = true,
		hideNo = true,
		content = arg_121_0,
		custom = var_121_1,
		weight = LayerWeightConst.TOP_LAYER
	})
end

function openDestroyEquip()
	if pg.m02:hasMediator(EquipmentMediator.__cname) then
		local var_122_0 = getProxy(ContextProxy):getCurrentContext():getContextByMediator(EquipmentMediator)

		if var_122_0 and var_122_0.data.shipId then
			pg.m02:sendNotification(GAME.REMOVE_LAYERS, {
				context = var_122_0
			})
		else
			pg.m02:sendNotification(EquipmentMediator.BATCHDESTROY_MODE)

			return
		end
	end

	pg.m02:sendNotification(GAME.GO_SCENE, SCENE.EQUIPSCENE, {
		warp = StoreHouseConst.WARP_TO_WEAPON,
		mode = StoreHouseConst.DESTROY
	})
end

function OpenSpWeaponPage()
	if pg.m02:hasMediator(EquipmentMediator.__cname) then
		local var_123_0 = getProxy(ContextProxy):getCurrentContext():getContextByMediator(EquipmentMediator)

		if var_123_0 and var_123_0.data.shipId then
			pg.m02:sendNotification(GAME.REMOVE_LAYERS, {
				context = var_123_0
			})
		else
			pg.m02:sendNotification(EquipmentMediator.SWITCH_TO_SPWEAPON_PAGE)

			return
		end
	end

	pg.m02:sendNotification(GAME.GO_SCENE, SCENE.EQUIPSCENE, {
		warp = StoreHouseConst.WARP_TO_WEAPON,
		mode = StoreHouseConst.SPWEAPON
	})
end

function openDockyardClear()
	pg.m02:sendNotification(GAME.GO_SCENE, SCENE.DOCKYARD, {
		blockLock = true,
		mode = DockyardScene.MODE_DESTROY,
		leftTopInfo = i18n("word_destroy"),
		selectedMax = getGameset("ship_select_limit")[1],
		onShip = ShipStatus.canDestroyShip,
		ignoredIds = pg.ShipFlagMgr.GetInstance():FilterShips({
			isActivityNpc = true
		})
	})
end

function openDockyardIntensify()
	pg.m02:sendNotification(GAME.GO_SCENE, SCENE.DOCKYARD, {
		mode = DockyardScene.MODE_OVERVIEW,
		onClick = function(arg_126_0, arg_126_1)
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.SHIPINFO, {
				page = 3,
				shipId = arg_126_0.id,
				shipVOs = arg_126_1
			})
		end
	})
end

function GoShoppingMsgBox(arg_127_0, arg_127_1, arg_127_2)
	if arg_127_2 then
		local var_127_0 = ""

		for iter_127_0, iter_127_1 in ipairs(arg_127_2) do
			local var_127_1 = Item.getConfigData(iter_127_1[1])

			var_127_0 = var_127_0 .. i18n(iter_127_1[1] == 59001 and "text_noRes_info_tip" or "text_noRes_info_tip2", var_127_1.name, iter_127_1[2])

			if iter_127_0 < #arg_127_2 then
				var_127_0 = var_127_0 .. i18n("text_noRes_info_tip_link")
			end
		end

		if var_127_0 ~= "" then
			arg_127_0 = arg_127_0 .. "\n" .. i18n("text_noRes_tip", var_127_0)
		end
	end

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		content = arg_127_0,
		weight = LayerWeightConst.SECOND_LAYER,
		onYes = function()
			gotoChargeScene(arg_127_1, arg_127_2)
		end
	})
end

function shoppingBatch(arg_129_0, arg_129_1, arg_129_2, arg_129_3, arg_129_4)
	local var_129_0 = pg.shop_template[arg_129_0]

	assert(var_129_0, "shop_template中找不到商品id：" .. arg_129_0)

	local var_129_1 = getProxy(PlayerProxy):getData()[id2res(var_129_0.resource_type)]
	local var_129_2 = arg_129_1.price or var_129_0.resource_num
	local var_129_3 = math.floor(var_129_1 / var_129_2)

	var_129_3 = var_129_3 <= 0 and 1 or var_129_3
	var_129_3 = arg_129_2 ~= nil and arg_129_2 < var_129_3 and arg_129_2 or var_129_3

	local var_129_4 = true
	local var_129_5 = 1

	if var_129_0 ~= nil and arg_129_1.id then
		print(var_129_3 * var_129_0.num, "--", var_129_3)
		assert(Item.getConfigData(arg_129_1.id), "item config should be existence")

		local var_129_6 = Item.New({
			id = arg_129_1.id
		}):getConfig("name")

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			needCounter = true,
			type = MSGBOX_TYPE_SINGLE_ITEM,
			drop = {
				type = DROP_TYPE_ITEM,
				id = arg_129_1.id
			},
			addNum = var_129_0.num,
			maxNum = var_129_3 * var_129_0.num,
			defaultNum = var_129_0.num,
			numUpdate = function(arg_130_0, arg_130_1)
				var_129_5 = math.floor(arg_130_1 / var_129_0.num)

				local var_130_0 = var_129_5 * var_129_2

				if var_130_0 > var_129_1 then
					setText(arg_130_0, i18n(arg_129_3, var_130_0, arg_130_1, COLOR_RED, var_129_6))

					var_129_4 = false
				else
					setText(arg_130_0, i18n(arg_129_3, var_130_0, arg_130_1, COLOR_GREEN, var_129_6))

					var_129_4 = true
				end
			end,
			onYes = function()
				if var_129_4 then
					pg.m02:sendNotification(GAME.SHOPPING, {
						id = arg_129_0,
						count = var_129_5
					})
				elseif arg_129_4 then
					pg.TipsMgr.GetInstance():ShowTips(i18n(arg_129_4))
				else
					pg.TipsMgr.GetInstance():ShowTips(i18n("main_playerInfoLayer_error_changeNameNoGem"))
				end
			end
		})
	end
end

function gotoChargeScene(arg_132_0, arg_132_1)
	local var_132_0 = getProxy(ContextProxy)
	local var_132_1 = getProxy(ContextProxy):getCurrentContext()

	if instanceof(var_132_1.mediator, ChargeMediator) then
		var_132_1.mediator:getViewComponent():switchSubViewByTogger(arg_132_0)
	else
		pg.m02:sendNotification(GAME.GO_SCENE, SCENE.CHARGE, {
			wrap = arg_132_0 or ChargeScene.TYPE_ITEM,
			noRes = arg_132_1
		})
	end
end

function clearDrop(arg_133_0)
	local var_133_0 = findTF(arg_133_0, "icon_bg")
	local var_133_1 = findTF(arg_133_0, "icon_bg/frame")
	local var_133_2 = findTF(arg_133_0, "icon_bg/icon")
	local var_133_3 = findTF(arg_133_0, "icon_bg/icon/icon")

	clearImageSprite(var_133_0)
	clearImageSprite(var_133_1)
	clearImageSprite(var_133_2)

	if var_133_3 then
		clearImageSprite(var_133_3)
	end
end

local var_0_7 = {
	red = Color.New(1, 0.25, 0.25),
	blue = Color.New(0.11, 0.55, 0.64),
	yellow = Color.New(0.92, 0.52, 0)
}

function updateSkill(arg_134_0, arg_134_1, arg_134_2, arg_134_3)
	local var_134_0 = findTF(arg_134_0, "skill")
	local var_134_1 = findTF(arg_134_0, "lock")
	local var_134_2 = findTF(arg_134_0, "unknown")

	if arg_134_1 then
		setActive(var_134_0, true)
		setActive(var_134_2, false)
		setActive(var_134_1, not arg_134_2)
		LoadImageSpriteAsync("skillicon/" .. arg_134_1.icon, findTF(var_134_0, "icon"))

		local var_134_3 = arg_134_1.color or "blue"

		setText(findTF(var_134_0, "name"), shortenString(getSkillName(arg_134_1.id), arg_134_3 or 8))

		local var_134_4 = findTF(var_134_0, "level")

		setText(var_134_4, "LEVEL: " .. (arg_134_2 and arg_134_2.level or "??"))
		setTextColor(var_134_4, var_0_7[var_134_3])
	else
		setActive(var_134_0, false)
		setActive(var_134_2, true)
		setActive(var_134_1, false)
	end
end

local var_0_8 = true

function onBackButton(arg_135_0, arg_135_1, arg_135_2, arg_135_3)
	local var_135_0 = GetOrAddComponent(arg_135_1, "UILongPressTrigger")

	assert(arg_135_2, "callback should exist")

	var_135_0.longPressThreshold = defaultValue(arg_135_3, 1)

	local function var_135_1(arg_136_0)
		return function()
			if var_0_8 then
				pg.CriMgr.GetInstance():PlaySoundEffect_V3(SOUND_BACK)
			end

			local var_137_0, var_137_1 = arg_135_2()

			if var_137_0 then
				arg_136_0(var_137_1)
			end
		end
	end

	local var_135_2 = var_135_0.onReleased

	pg.DelegateInfo.Add(arg_135_0, var_135_2)
	var_135_2:RemoveAllListeners()
	var_135_2:AddListener(var_135_1(function(arg_138_0)
		arg_138_0:emit(BaseUI.ON_BACK)
	end))

	local var_135_3 = var_135_0.onLongPressed

	pg.DelegateInfo.Add(arg_135_0, var_135_3)
	var_135_3:RemoveAllListeners()
	var_135_3:AddListener(var_135_1(function(arg_139_0)
		arg_139_0:emit(BaseUI.ON_HOME)
	end))
end

function GetZeroTime()
	return pg.TimeMgr.GetInstance():GetNextTime(0, 0, 0)
end

function GetHalfHour()
	return pg.TimeMgr.GetInstance():GetNextTime(0, 0, 0, 1800)
end

function GetNextHour(arg_142_0)
	local var_142_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_142_1, var_142_2 = pg.TimeMgr.GetInstance():parseTimeFrom(var_142_0)

	return var_142_1 * 86400 + (var_142_2 + arg_142_0) * 3600
end

function GetPerceptualSize(arg_143_0)
	local function var_143_0(arg_144_0)
		if not arg_144_0 then
			return 0, 1
		elseif arg_144_0 > 240 then
			return 4, 1
		elseif arg_144_0 > 225 then
			return 3, 1
		elseif arg_144_0 > 192 then
			return 2, 1
		elseif arg_144_0 < 126 then
			return 1, 0.5
		else
			return 1, 1
		end
	end

	if type(arg_143_0) == "number" then
		return var_143_0(arg_143_0)
	end

	local var_143_1 = 1
	local var_143_2 = 0
	local var_143_3 = 0
	local var_143_4 = #arg_143_0

	while var_143_1 <= var_143_4 do
		local var_143_5 = string.byte(arg_143_0, var_143_1)
		local var_143_6, var_143_7 = var_143_0(var_143_5)

		var_143_1 = var_143_1 + var_143_6
		var_143_2 = var_143_2 + var_143_7
	end

	return var_143_2
end

function shortenString(arg_145_0, arg_145_1)
	local var_145_0 = 1
	local var_145_1 = 0
	local var_145_2 = 0
	local var_145_3 = #arg_145_0

	while var_145_0 <= var_145_3 do
		local var_145_4 = string.byte(arg_145_0, var_145_0)
		local var_145_5, var_145_6 = GetPerceptualSize(var_145_4)

		var_145_0 = var_145_0 + var_145_5
		var_145_1 = var_145_1 + var_145_6

		if arg_145_1 <= math.ceil(var_145_1) then
			var_145_2 = var_145_0

			break
		end
	end

	if var_145_2 == 0 or var_145_3 < var_145_2 then
		return arg_145_0
	end

	return string.sub(arg_145_0, 1, var_145_2 - 1) .. ".."
end

function shouldShortenString(arg_146_0, arg_146_1)
	local var_146_0 = 1
	local var_146_1 = 0
	local var_146_2 = 0
	local var_146_3 = #arg_146_0

	while var_146_0 <= var_146_3 do
		local var_146_4 = string.byte(arg_146_0, var_146_0)
		local var_146_5, var_146_6 = GetPerceptualSize(var_146_4)

		var_146_0 = var_146_0 + var_146_5
		var_146_1 = var_146_1 + var_146_6

		if arg_146_1 <= math.ceil(var_146_1) then
			var_146_2 = var_146_0

			break
		end
	end

	if var_146_2 == 0 or var_146_3 < var_146_2 then
		return false
	end

	return true
end

function nameValidityCheck(arg_147_0, arg_147_1, arg_147_2, arg_147_3)
	local var_147_0 = true
	local var_147_1, var_147_2 = utf8_to_unicode(arg_147_0)
	local var_147_3 = filterEgyUnicode(filterSpecChars(arg_147_0))
	local var_147_4 = wordVer(arg_147_0)

	if not checkSpaceValid(arg_147_0) then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_147_3[1]))

		var_147_0 = false
	elseif var_147_4 > 0 or var_147_3 ~= arg_147_0 then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_147_3[4]))

		var_147_0 = false
	elseif var_147_2 < arg_147_1 then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_147_3[2]))

		var_147_0 = false
	elseif arg_147_2 < var_147_2 then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_147_3[3]))

		var_147_0 = false
	end

	return var_147_0
end

function checkSpaceValid(arg_148_0)
	if PLATFORM_CODE == PLATFORM_US then
		return true
	end

	local var_148_0 = string.gsub(arg_148_0, " ", "")

	return arg_148_0 == string.gsub(var_148_0, "　", "")
end

function filterSpecChars(arg_149_0)
	local var_149_0 = {}
	local var_149_1 = 0
	local var_149_2 = 0
	local var_149_3 = 0
	local var_149_4 = 1

	while var_149_4 <= #arg_149_0 do
		local var_149_5 = string.byte(arg_149_0, var_149_4)

		if not var_149_5 then
			break
		end

		if var_149_5 >= 48 and var_149_5 <= 57 or var_149_5 >= 65 and var_149_5 <= 90 or var_149_5 == 95 or var_149_5 >= 97 and var_149_5 <= 122 then
			table.insert(var_149_0, string.char(var_149_5))
		elseif var_149_5 >= 228 and var_149_5 <= 233 then
			local var_149_6 = string.byte(arg_149_0, var_149_4 + 1)
			local var_149_7 = string.byte(arg_149_0, var_149_4 + 2)

			if var_149_6 and var_149_7 and var_149_6 >= 128 and var_149_6 <= 191 and var_149_7 >= 128 and var_149_7 <= 191 then
				var_149_4 = var_149_4 + 2

				table.insert(var_149_0, string.char(var_149_5, var_149_6, var_149_7))

				var_149_1 = var_149_1 + 1
			end
		elseif var_149_5 == 45 or var_149_5 == 40 or var_149_5 == 41 then
			table.insert(var_149_0, string.char(var_149_5))
		elseif var_149_5 == 194 then
			local var_149_8 = string.byte(arg_149_0, var_149_4 + 1)

			if var_149_8 == 183 then
				var_149_4 = var_149_4 + 1

				table.insert(var_149_0, string.char(var_149_5, var_149_8))

				var_149_1 = var_149_1 + 1
			end
		elseif var_149_5 == 239 then
			local var_149_9 = string.byte(arg_149_0, var_149_4 + 1)
			local var_149_10 = string.byte(arg_149_0, var_149_4 + 2)

			if var_149_9 == 188 and (var_149_10 == 136 or var_149_10 == 137) then
				var_149_4 = var_149_4 + 2

				table.insert(var_149_0, string.char(var_149_5, var_149_9, var_149_10))

				var_149_1 = var_149_1 + 1
			end
		elseif var_149_5 == 206 or var_149_5 == 207 then
			local var_149_11 = string.byte(arg_149_0, var_149_4 + 1)

			if var_149_5 == 206 and var_149_11 >= 177 or var_149_5 == 207 and var_149_11 <= 134 then
				var_149_4 = var_149_4 + 1

				table.insert(var_149_0, string.char(var_149_5, var_149_11))

				var_149_1 = var_149_1 + 1
			end
		elseif var_149_5 == 227 and PLATFORM_CODE == PLATFORM_JP then
			local var_149_12 = string.byte(arg_149_0, var_149_4 + 1)
			local var_149_13 = string.byte(arg_149_0, var_149_4 + 2)

			if var_149_12 and var_149_13 and var_149_12 > 128 and var_149_12 <= 191 and var_149_13 >= 128 and var_149_13 <= 191 then
				var_149_4 = var_149_4 + 2

				table.insert(var_149_0, string.char(var_149_5, var_149_12, var_149_13))

				var_149_2 = var_149_2 + 1
			end
		elseif var_149_5 >= 224 and PLATFORM_CODE == PLATFORM_KR then
			local var_149_14 = string.byte(arg_149_0, var_149_4 + 1)
			local var_149_15 = string.byte(arg_149_0, var_149_4 + 2)

			if var_149_14 and var_149_15 and var_149_14 >= 128 and var_149_14 <= 191 and var_149_15 >= 128 and var_149_15 <= 191 then
				var_149_4 = var_149_4 + 2

				table.insert(var_149_0, string.char(var_149_5, var_149_14, var_149_15))

				var_149_3 = var_149_3 + 1
			end
		elseif PLATFORM_CODE == PLATFORM_US then
			if var_149_4 ~= 1 and var_149_5 == 32 and string.byte(arg_149_0, var_149_4 + 1) ~= 32 then
				table.insert(var_149_0, string.char(var_149_5))
			end

			if var_149_5 >= 192 and var_149_5 <= 223 then
				local var_149_16 = string.byte(arg_149_0, var_149_4 + 1)

				var_149_4 = var_149_4 + 1

				if var_149_5 == 194 and var_149_16 and var_149_16 >= 128 then
					table.insert(var_149_0, string.char(var_149_5, var_149_16))
				elseif var_149_5 == 195 and var_149_16 and var_149_16 <= 191 then
					table.insert(var_149_0, string.char(var_149_5, var_149_16))
				end
			end

			if var_149_5 == 195 then
				local var_149_17 = string.byte(arg_149_0, var_149_4 + 1)

				if var_149_17 == 188 then
					table.insert(var_149_0, string.char(var_149_5, var_149_17))
				end
			end
		end

		var_149_4 = var_149_4 + 1
	end

	return table.concat(var_149_0), var_149_1 + var_149_2 + var_149_3
end

function filterEgyUnicode(arg_150_0)
	arg_150_0 = string.gsub(arg_150_0, "\xF0\x93[\x80-\x8F][\x80-\xBF]", "")
	arg_150_0 = string.gsub(arg_150_0, "\xF0\x93\x90[\x80-\xAF]", "")

	return arg_150_0
end

function shiftPanel(arg_151_0, arg_151_1, arg_151_2, arg_151_3, arg_151_4, arg_151_5, arg_151_6, arg_151_7, arg_151_8)
	arg_151_3 = arg_151_3 or 0.2

	if arg_151_5 then
		LeanTween.cancel(go(arg_151_0))
	end

	local var_151_0 = rtf(arg_151_0)

	arg_151_1 = arg_151_1 or var_151_0.anchoredPosition.x
	arg_151_2 = arg_151_2 or var_151_0.anchoredPosition.y

	local var_151_1 = LeanTween.move(var_151_0, Vector3(arg_151_1, arg_151_2, 0), arg_151_3)

	arg_151_7 = arg_151_7 or LeanTweenType.easeInOutSine

	var_151_1:setEase(arg_151_7)

	if arg_151_4 then
		var_151_1:setDelay(arg_151_4)
	end

	if arg_151_6 then
		GetOrAddComponent(arg_151_0, "CanvasGroup").blocksRaycasts = false
	end

	var_151_1:setOnComplete(System.Action(function()
		if arg_151_8 then
			arg_151_8()
		end

		if arg_151_6 then
			GetOrAddComponent(arg_151_0, "CanvasGroup").blocksRaycasts = true
		end
	end))

	return var_151_1
end

function TweenValue(arg_153_0, arg_153_1, arg_153_2, arg_153_3, arg_153_4, arg_153_5, arg_153_6, arg_153_7)
	local var_153_0 = LeanTween.value(go(arg_153_0), arg_153_1, arg_153_2, arg_153_3):setOnUpdate(System.Action_float(function(arg_154_0)
		if arg_153_5 then
			arg_153_5(arg_154_0)
		end
	end)):setOnComplete(System.Action(function()
		if arg_153_6 then
			arg_153_6()
		end
	end)):setDelay(arg_153_4 or 0)

	if arg_153_7 and arg_153_7 > 0 then
		var_153_0:setRepeat(arg_153_7)
	end

	return var_153_0
end

function rotateAni(arg_156_0, arg_156_1, arg_156_2)
	return LeanTween.rotate(rtf(arg_156_0), 360 * arg_156_1, arg_156_2):setLoopClamp()
end

function blinkAni(arg_157_0, arg_157_1, arg_157_2, arg_157_3)
	return LeanTween.alpha(rtf(arg_157_0), arg_157_3 or 0, arg_157_1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong(arg_157_2 or 0)
end

function scaleAni(arg_158_0, arg_158_1, arg_158_2, arg_158_3)
	return LeanTween.scale(rtf(arg_158_0), arg_158_3 or 0, arg_158_1):setLoopPingPong(arg_158_2 or 0)
end

function floatAni(arg_159_0, arg_159_1, arg_159_2, arg_159_3)
	local var_159_0 = arg_159_0.localPosition.y + arg_159_1

	return LeanTween.moveY(rtf(arg_159_0), var_159_0, arg_159_2):setLoopPingPong(arg_159_3 or 0)
end

local var_0_9 = tostring

function tostring(arg_160_0)
	if arg_160_0 == nil then
		return "nil"
	end

	local var_160_0 = var_0_9(arg_160_0)

	if var_160_0 == nil then
		if type(arg_160_0) == "table" then
			return "{}"
		end

		return " ~nil"
	end

	return var_160_0
end

function wordVer(arg_161_0, arg_161_1)
	if arg_161_0.match(arg_161_0, ChatConst.EmojiCodeMatch) then
		return 0, arg_161_0
	end

	arg_161_1 = arg_161_1 or {}

	local var_161_0 = filterEgyUnicode(arg_161_0)

	if #var_161_0 ~= #arg_161_0 then
		if arg_161_1.isReplace then
			arg_161_0 = var_161_0
		else
			return 1
		end
	end

	local var_161_1 = wordSplit(arg_161_0)
	local var_161_2 = pg.word_template
	local var_161_3 = pg.word_legal_template

	arg_161_1.isReplace = arg_161_1.isReplace or false
	arg_161_1.replaceWord = arg_161_1.replaceWord or "*"

	local var_161_4 = #var_161_1
	local var_161_5 = 1
	local var_161_6 = ""
	local var_161_7 = 0

	while var_161_5 <= var_161_4 do
		local var_161_8, var_161_9, var_161_10 = wordLegalMatch(var_161_1, var_161_3, var_161_5)

		if var_161_8 then
			var_161_5 = var_161_9
			var_161_6 = var_161_6 .. var_161_10
		else
			local var_161_11, var_161_12, var_161_13 = wordVerMatch(var_161_1, var_161_2, arg_161_1, var_161_5, "", false, var_161_5, "")

			if var_161_11 then
				var_161_5 = var_161_12
				var_161_7 = var_161_7 + 1

				if arg_161_1.isReplace then
					var_161_6 = var_161_6 .. var_161_13
				end
			else
				if arg_161_1.isReplace then
					var_161_6 = var_161_6 .. var_161_1[var_161_5]
				end

				var_161_5 = var_161_5 + 1
			end
		end
	end

	if arg_161_1.isReplace then
		return var_161_7, var_161_6
	else
		return var_161_7
	end
end

function wordLegalMatch(arg_162_0, arg_162_1, arg_162_2, arg_162_3, arg_162_4)
	if arg_162_2 > #arg_162_0 then
		return arg_162_3, arg_162_2, arg_162_4
	end

	local var_162_0 = arg_162_0[arg_162_2]
	local var_162_1 = arg_162_1[var_162_0]

	arg_162_4 = arg_162_4 == nil and "" or arg_162_4

	if var_162_1 then
		if var_162_1.this then
			return wordLegalMatch(arg_162_0, var_162_1, arg_162_2 + 1, true, arg_162_4 .. var_162_0)
		else
			return wordLegalMatch(arg_162_0, var_162_1, arg_162_2 + 1, false, arg_162_4 .. var_162_0)
		end
	else
		return arg_162_3, arg_162_2, arg_162_4
	end
end

local var_0_10 = string.byte("a")
local var_0_11 = string.byte("z")
local var_0_12 = string.byte("A")
local var_0_13 = string.byte("Z")

local function var_0_14(arg_163_0)
	if not arg_163_0 then
		return arg_163_0
	end

	local var_163_0 = string.byte(arg_163_0)

	if var_163_0 > 128 then
		return
	end

	if var_163_0 >= var_0_10 and var_163_0 <= var_0_11 then
		return string.char(var_163_0 - 32)
	elseif var_163_0 >= var_0_12 and var_163_0 <= var_0_13 then
		return string.char(var_163_0 + 32)
	else
		return arg_163_0
	end
end

function wordVerMatch(arg_164_0, arg_164_1, arg_164_2, arg_164_3, arg_164_4, arg_164_5, arg_164_6, arg_164_7)
	if arg_164_3 > #arg_164_0 then
		return arg_164_5, arg_164_6, arg_164_7
	end

	local var_164_0 = arg_164_0[arg_164_3]
	local var_164_1 = arg_164_1[var_164_0]

	if var_164_1 then
		local var_164_2, var_164_3, var_164_4 = wordVerMatch(arg_164_0, var_164_1, arg_164_2, arg_164_3 + 1, arg_164_2.isReplace and arg_164_4 .. arg_164_2.replaceWord or arg_164_4, var_164_1.this or arg_164_5, var_164_1.this and arg_164_3 + 1 or arg_164_6, var_164_1.this and (arg_164_2.isReplace and arg_164_4 .. arg_164_2.replaceWord or arg_164_4) or arg_164_7)

		if var_164_2 then
			return var_164_2, var_164_3, var_164_4
		end
	end

	local var_164_5 = var_0_14(var_164_0)
	local var_164_6 = arg_164_1[var_164_5]

	if var_164_5 ~= var_164_0 and var_164_6 then
		local var_164_7, var_164_8, var_164_9 = wordVerMatch(arg_164_0, var_164_6, arg_164_2, arg_164_3 + 1, arg_164_2.isReplace and arg_164_4 .. arg_164_2.replaceWord or arg_164_4, var_164_6.this or arg_164_5, var_164_6.this and arg_164_3 + 1 or arg_164_6, var_164_6.this and (arg_164_2.isReplace and arg_164_4 .. arg_164_2.replaceWord or arg_164_4) or arg_164_7)

		if var_164_7 then
			return var_164_7, var_164_8, var_164_9
		end
	end

	return arg_164_5, arg_164_6, arg_164_7
end

function wordSplit(arg_165_0)
	local var_165_0 = {}

	for iter_165_0 in arg_165_0.gmatch(arg_165_0, "[\x01-\x7F\xC2-\xF4][\x80-\xBF]*") do
		var_165_0[#var_165_0 + 1] = iter_165_0
	end

	return var_165_0
end

function contentWrap(arg_166_0, arg_166_1, arg_166_2)
	local var_166_0 = LuaHelper.WrapContent(arg_166_0, arg_166_1, arg_166_2)

	return #var_166_0 ~= #arg_166_0, var_166_0
end

function cancelRich(arg_167_0)
	local var_167_0

	for iter_167_0 = 1, 20 do
		local var_167_1

		arg_167_0, var_167_1 = string.gsub(arg_167_0, "<([^>]*)>", "%1")

		if var_167_1 <= 0 then
			break
		end
	end

	return arg_167_0
end

function getSkillConfig(arg_168_0)
	local var_168_0 = require("GameCfg.buff.buff_" .. arg_168_0)

	if not var_168_0 then
		warning("找不到技能配置: " .. arg_168_0)

		return
	end

	local var_168_1 = Clone(var_168_0)

	var_168_1.name = getSkillName(arg_168_0)
	var_168_1.desc = HXSet.hxLan(var_168_1.desc)
	var_168_1.desc_get = HXSet.hxLan(var_168_1.desc_get)

	_.each(var_168_1, function(arg_169_0)
		arg_169_0.desc = HXSet.hxLan(arg_169_0.desc)
	end)

	return var_168_1
end

function getSkillName(arg_170_0)
	local var_170_0 = pg.skill_data_template[arg_170_0] or pg.skill_data_display[arg_170_0]

	if var_170_0 then
		return HXSet.hxLan(var_170_0.name)
	else
		return ""
	end
end

function getSkillDescGet(arg_171_0, arg_171_1)
	local var_171_0 = arg_171_1 and pg.skill_world_display[arg_171_0] and setmetatable({}, {
		__index = function(arg_172_0, arg_172_1)
			return pg.skill_world_display[arg_171_0][arg_172_1] or pg.skill_data_template[arg_171_0][arg_172_1]
		end
	}) or pg.skill_data_template[arg_171_0]

	if not var_171_0 then
		return ""
	end

	local var_171_1 = var_171_0.desc_get ~= "" and var_171_0.desc_get or var_171_0.desc

	for iter_171_0, iter_171_1 in pairs(var_171_0.desc_get_add) do
		local var_171_2 = setColorStr(iter_171_1[1], COLOR_GREEN)

		if iter_171_1[2] then
			var_171_2 = var_171_2 .. specialGSub(i18n("word_skill_desc_get"), "$1", setColorStr(iter_171_1[2], COLOR_GREEN))
		end

		var_171_1 = specialGSub(var_171_1, "$" .. iter_171_0, var_171_2)
	end

	return HXSet.hxLan(var_171_1)
end

function getSkillDescLearn(arg_173_0, arg_173_1, arg_173_2)
	local var_173_0 = arg_173_2 and pg.skill_world_display[arg_173_0] and setmetatable({}, {
		__index = function(arg_174_0, arg_174_1)
			return pg.skill_world_display[arg_173_0][arg_174_1] or pg.skill_data_template[arg_173_0][arg_174_1]
		end
	}) or pg.skill_data_template[arg_173_0]

	if not var_173_0 then
		return ""
	end

	local var_173_1 = var_173_0.desc

	if not var_173_0.desc_add then
		return HXSet.hxLan(var_173_1)
	end

	for iter_173_0, iter_173_1 in pairs(var_173_0.desc_add) do
		local var_173_2 = iter_173_1[arg_173_1][1]

		if iter_173_1[arg_173_1][2] then
			var_173_2 = var_173_2 .. specialGSub(i18n("word_skill_desc_learn"), "$1", iter_173_1[arg_173_1][2])
		end

		var_173_1 = specialGSub(var_173_1, "$" .. iter_173_0, setColorStr(var_173_2, COLOR_YELLOW))
	end

	return HXSet.hxLan(var_173_1)
end

function getSkillDesc(arg_175_0, arg_175_1, arg_175_2)
	local var_175_0 = arg_175_2 and pg.skill_world_display[arg_175_0] and setmetatable({}, {
		__index = function(arg_176_0, arg_176_1)
			return pg.skill_world_display[arg_175_0][arg_176_1] or pg.skill_data_template[arg_175_0][arg_176_1]
		end
	}) or pg.skill_data_template[arg_175_0]

	if not var_175_0 then
		return ""
	end

	local var_175_1 = var_175_0.desc

	if not var_175_0.desc_add then
		return HXSet.hxLan(var_175_1)
	end

	for iter_175_0, iter_175_1 in pairs(var_175_0.desc_add) do
		local var_175_2 = setColorStr(iter_175_1[arg_175_1][1], COLOR_GREEN)

		var_175_1 = specialGSub(var_175_1, "$" .. iter_175_0, var_175_2)
	end

	return HXSet.hxLan(var_175_1)
end

function specialGSub(arg_177_0, arg_177_1, arg_177_2)
	arg_177_0 = string.gsub(arg_177_0, "<color=#", "<color=NNN")
	arg_177_0 = string.gsub(arg_177_0, "#", "")
	arg_177_2 = string.gsub(arg_177_2, "%%", "%%%%")
	arg_177_0 = string.gsub(arg_177_0, arg_177_1, arg_177_2)
	arg_177_0 = string.gsub(arg_177_0, "<color=NNN", "<color=#")

	return arg_177_0
end

function topAnimation(arg_178_0, arg_178_1, arg_178_2, arg_178_3, arg_178_4, arg_178_5)
	local var_178_0 = {}

	arg_178_4 = arg_178_4 or 0.27

	local var_178_1 = 0.05

	if arg_178_0 then
		local var_178_2 = arg_178_0.transform.localPosition.x

		setAnchoredPosition(arg_178_0, {
			x = var_178_2 - 500
		})
		shiftPanel(arg_178_0, var_178_2, nil, 0.05, arg_178_4, true, true)
		setActive(arg_178_0, true)
	end

	setActive(arg_178_1, false)
	setActive(arg_178_2, false)
	setActive(arg_178_3, false)

	for iter_178_0 = 1, 3 do
		table.insert(var_178_0, LeanTween.delayedCall(arg_178_4 + 0.13 + var_178_1 * iter_178_0, System.Action(function()
			if arg_178_1 then
				setActive(arg_178_1, not arg_178_1.gameObject.activeSelf)
			end
		end)).uniqueId)
		table.insert(var_178_0, LeanTween.delayedCall(arg_178_4 + 0.02 + var_178_1 * iter_178_0, System.Action(function()
			if arg_178_2 then
				setActive(arg_178_2, not go(arg_178_2).activeSelf)
			end

			if arg_178_2 then
				setActive(arg_178_3, not go(arg_178_3).activeSelf)
			end
		end)).uniqueId)
	end

	if arg_178_5 then
		table.insert(var_178_0, LeanTween.delayedCall(arg_178_4 + 0.13 + var_178_1 * 3 + 0.1, System.Action(function()
			arg_178_5()
		end)).uniqueId)
	end

	return var_178_0
end

function cancelTweens(arg_182_0)
	assert(arg_182_0, "must provide cancel targets, LeanTween.cancelAll is not allow")

	for iter_182_0, iter_182_1 in ipairs(arg_182_0) do
		if iter_182_1 then
			LeanTween.cancel(iter_182_1)
		end
	end
end

function getOfflineTimeStamp(arg_183_0)
	local var_183_0 = pg.TimeMgr.GetInstance():GetServerTime() - arg_183_0
	local var_183_1 = ""

	if var_183_0 <= 59 then
		var_183_1 = i18n("just_now")
	elseif var_183_0 <= 3599 then
		var_183_1 = i18n("several_minutes_before", math.floor(var_183_0 / 60))
	elseif var_183_0 <= 86399 then
		var_183_1 = i18n("several_hours_before", math.floor(var_183_0 / 3600))
	else
		var_183_1 = i18n("several_days_before", math.floor(var_183_0 / 86400))
	end

	return var_183_1
end

function playMovie(arg_184_0, arg_184_1, arg_184_2)
	local var_184_0 = GameObject.Find("OverlayCamera/Overlay/UITop/MoviePanel")

	if not IsNil(var_184_0) then
		pg.UIMgr.GetInstance():LoadingOn()
		WWWLoader.Inst:LoadStreamingAsset(arg_184_0, function(arg_185_0)
			pg.UIMgr.GetInstance():LoadingOff()

			local var_185_0 = GCHandle.Alloc(arg_185_0, GCHandleType.Pinned)

			setActive(var_184_0, true)

			local var_185_1 = var_184_0:AddComponent(typeof(CriManaMovieControllerForUI))

			var_185_1.player:SetData(arg_185_0, arg_185_0.Length)

			var_185_1.target = var_184_0:GetComponent(typeof(Image))
			var_185_1.loop = false
			var_185_1.additiveMode = false
			var_185_1.playOnStart = true

			local var_185_2

			var_185_2 = Timer.New(function()
				if var_185_1.player.status == CriMana.Player.Status.PlayEnd or var_185_1.player.status == CriMana.Player.Status.Stop or var_185_1.player.status == CriMana.Player.Status.Error then
					var_185_2:Stop()
					Object.Destroy(var_185_1)
					GCHandle.Free(var_185_0)
					setActive(var_184_0, false)

					if arg_184_1 then
						arg_184_1()
					end
				end
			end, 0.2, -1)

			var_185_2:Start()
			removeOnButton(var_184_0)

			if arg_184_2 then
				onButton(nil, var_184_0, function()
					var_185_1:Stop()
					GetOrAddComponent(var_184_0, typeof(Button)).onClick:RemoveAllListeners()
				end, SFX_CANCEL)
			end
		end)
	elseif arg_184_1 then
		arg_184_1()
	end
end

PaintCameraAdjustOn = false

function cameraPaintViewAdjust(arg_188_0)
	if PaintCameraAdjustOn ~= arg_188_0 then
		local var_188_0 = GameObject.Find("UICamera/Canvas"):GetComponent(typeof(CanvasScaler))

		if arg_188_0 then
			CameraMgr.instance.AutoAdapt = false

			CameraMgr.instance:Revert()

			var_188_0.screenMatchMode = CanvasScaler.ScreenMatchMode.MatchWidthOrHeight
			var_188_0.matchWidthOrHeight = 1
		else
			CameraMgr.instance.AutoAdapt = true
			CameraMgr.instance.CurrentWidth = 1
			CameraMgr.instance.CurrentHeight = 1
			CameraMgr.instance.AspectRatio = 1.7777777777777777
			var_188_0.screenMatchMode = CanvasScaler.ScreenMatchMode.Expand
		end

		PaintCameraAdjustOn = arg_188_0
	end
end

function ManhattonDist(arg_189_0, arg_189_1)
	return math.abs(arg_189_0.row - arg_189_1.row) + math.abs(arg_189_0.column - arg_189_1.column)
end

function checkFirstHelpShow(arg_190_0)
	local var_190_0 = getProxy(SettingsProxy)

	if not var_190_0:checkReadHelp(arg_190_0) then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip[arg_190_0].tip
		})
		var_190_0:recordReadHelp(arg_190_0)
	end
end

preOrientation = nil
preNotchFitterEnabled = false

function openPortrait(arg_191_0)
	enableNotch(arg_191_0, true)

	preOrientation = Input.deviceOrientation:ToString()

	originalPrint("Begining Orientation:" .. preOrientation)

	Screen.autorotateToPortrait = true
	Screen.autorotateToPortraitUpsideDown = true

	cameraPaintViewAdjust(true)
end

function closePortrait(arg_192_0)
	enableNotch(arg_192_0, false)

	Screen.autorotateToPortrait = false
	Screen.autorotateToPortraitUpsideDown = false

	originalPrint("Closing Orientation:" .. preOrientation)

	Screen.orientation = ScreenOrientation.LandscapeLeft

	local var_192_0 = Timer.New(function()
		Screen.orientation = ScreenOrientation.AutoRotation
	end, 0.2, 1):Start()

	cameraPaintViewAdjust(false)
end

function enableNotch(arg_194_0, arg_194_1)
	if arg_194_0 == nil then
		return
	end

	local var_194_0 = arg_194_0:GetComponent("NotchAdapt")
	local var_194_1 = arg_194_0:GetComponent("AspectRatioFitter")

	var_194_0.enabled = arg_194_1

	if var_194_1 then
		if arg_194_1 then
			var_194_1.enabled = preNotchFitterEnabled
		else
			preNotchFitterEnabled = var_194_1.enabled
			var_194_1.enabled = false
		end
	end
end

function comma_value(arg_195_0)
	local var_195_0 = arg_195_0
	local var_195_1 = 0

	repeat
		local var_195_2

		var_195_0, var_195_2 = string.gsub(var_195_0, "^(-?%d+)(%d%d%d)", "%1,%2")
	until var_195_2 == 0

	return var_195_0
end

local var_0_15 = 0.2

function SwitchPanel(arg_196_0, arg_196_1, arg_196_2, arg_196_3, arg_196_4, arg_196_5)
	arg_196_3 = defaultValue(arg_196_3, var_0_15)

	if arg_196_5 then
		LeanTween.cancel(go(arg_196_0))
	end

	local var_196_0 = Vector3.New(tf(arg_196_0).localPosition.x, tf(arg_196_0).localPosition.y, tf(arg_196_0).localPosition.z)

	if arg_196_1 then
		var_196_0.x = arg_196_1
	end

	if arg_196_2 then
		var_196_0.y = arg_196_2
	end

	local var_196_1 = LeanTween.move(rtf(arg_196_0), var_196_0, arg_196_3):setEase(LeanTweenType.easeInOutSine)

	if arg_196_4 then
		var_196_1:setDelay(arg_196_4)
	end

	return var_196_1
end

function updateActivityTaskStatus(arg_197_0)
	local var_197_0 = arg_197_0:getConfig("config_id")
	local var_197_1, var_197_2 = getActivityTask(arg_197_0, true)

	if not var_197_2 then
		pg.m02:sendNotification(GAME.ACTIVITY_OPERATION, {
			cmd = 1,
			activity_id = arg_197_0.id
		})

		return true
	end

	return false
end

function updateCrusingActivityTask(arg_198_0)
	local var_198_0 = getProxy(TaskProxy)
	local var_198_1 = arg_198_0:getNDay()

	for iter_198_0, iter_198_1 in ipairs(arg_198_0:getConfig("config_data")) do
		local var_198_2 = pg.battlepass_task_group[iter_198_1]

		if var_198_1 >= var_198_2.time and underscore.any(underscore.flatten(var_198_2.task_group), function(arg_199_0)
			return var_198_0:getTaskVO(arg_199_0) == nil
		end) then
			pg.m02:sendNotification(GAME.CRUSING_CMD, {
				cmd = 1,
				activity_id = arg_198_0.id
			})

			return true
		end
	end

	return false
end

function setShipCardFrame(arg_200_0, arg_200_1, arg_200_2)
	arg_200_0.localScale = Vector3.one
	arg_200_0.anchorMin = Vector2.zero
	arg_200_0.anchorMax = Vector2.one

	local var_200_0 = arg_200_2 or arg_200_1

	GetImageSpriteFromAtlasAsync("shipframe", var_200_0, arg_200_0)

	local var_200_1 = pg.frame_resource[var_200_0]

	if var_200_1 then
		local var_200_2 = var_200_1.param

		arg_200_0.offsetMin = Vector2(var_200_2[1], var_200_2[2])
		arg_200_0.offsetMax = Vector2(var_200_2[3], var_200_2[4])
	else
		arg_200_0.offsetMin = Vector2.zero
		arg_200_0.offsetMax = Vector2.zero
	end
end

function setRectShipCardFrame(arg_201_0, arg_201_1, arg_201_2)
	arg_201_0.localScale = Vector3.one
	arg_201_0.anchorMin = Vector2.zero
	arg_201_0.anchorMax = Vector2.one

	setImageSprite(arg_201_0, GetSpriteFromAtlas("shipframeb", "b" .. (arg_201_2 or arg_201_1)))

	local var_201_0 = "b" .. (arg_201_2 or arg_201_1)
	local var_201_1 = pg.frame_resource[var_201_0]

	if var_201_1 then
		local var_201_2 = var_201_1.param

		arg_201_0.offsetMin = Vector2(var_201_2[1], var_201_2[2])
		arg_201_0.offsetMax = Vector2(var_201_2[3], var_201_2[4])
	else
		arg_201_0.offsetMin = Vector2.zero
		arg_201_0.offsetMax = Vector2.zero
	end
end

function setFrameEffect(arg_202_0, arg_202_1)
	if arg_202_1 then
		local var_202_0 = arg_202_1 .. "(Clone)"
		local var_202_1 = false

		eachChild(arg_202_0, function(arg_203_0)
			setActive(arg_203_0, arg_203_0.name == var_202_0)

			var_202_1 = var_202_1 or arg_203_0.name == var_202_0
		end)

		if not var_202_1 then
			LoadAndInstantiateAsync("effect", arg_202_1, function(arg_204_0)
				if IsNil(arg_202_0) or findTF(arg_202_0, var_202_0) then
					Object.Destroy(arg_204_0)
				else
					setParent(arg_204_0, arg_202_0)
					setActive(arg_204_0, true)
				end
			end)
		end
	end

	setActive(arg_202_0, arg_202_1)
end

function setProposeMarkIcon(arg_205_0, arg_205_1)
	local var_205_0 = arg_205_0:Find("proposeShipCard(Clone)")
	local var_205_1 = arg_205_1.propose and not arg_205_1:ShowPropose()

	if var_205_0 then
		setActive(var_205_0, var_205_1)
	elseif var_205_1 then
		pg.PoolMgr.GetInstance():GetUI("proposeShipCard", true, function(arg_206_0)
			if IsNil(arg_205_0) or arg_205_0:Find("proposeShipCard(Clone)") then
				pg.PoolMgr.GetInstance():ReturnUI("proposeShipCard", arg_206_0)
			else
				setParent(arg_206_0, arg_205_0, false)
			end
		end)
	end
end

function flushShipCard(arg_207_0, arg_207_1)
	local var_207_0 = arg_207_1:rarity2bgPrint()
	local var_207_1 = findTF(arg_207_0, "content/bg")

	GetImageSpriteFromAtlasAsync("bg/star_level_card_" .. var_207_0, "", var_207_1)

	local var_207_2 = findTF(arg_207_0, "content/ship_icon")
	local var_207_3 = arg_207_1 and {
		"shipYardIcon/" .. arg_207_1:getPainting(),
		arg_207_1:getPainting()
	} or {
		"shipYardIcon/unknown",
		""
	}

	GetImageSpriteFromAtlasAsync(var_207_3[1], var_207_3[2], var_207_2)

	local var_207_4 = arg_207_1:getShipType()
	local var_207_5 = findTF(arg_207_0, "content/info/top/type")

	GetImageSpriteFromAtlasAsync("shiptype", shipType2print(var_207_4), var_207_5)
	setText(findTF(arg_207_0, "content/dockyard/lv/Text"), defaultValue(arg_207_1.level, 1))

	local var_207_6 = arg_207_1:getStar()
	local var_207_7 = arg_207_1:getMaxStar()
	local var_207_8 = findTF(arg_207_0, "content/front/stars")

	setActive(var_207_8, true)

	local var_207_9 = findTF(var_207_8, "star_tpl")
	local var_207_10 = var_207_8.childCount

	for iter_207_0 = 1, Ship.CONFIG_MAX_STAR do
		local var_207_11 = var_207_10 < iter_207_0 and cloneTplTo(var_207_9, var_207_8) or var_207_8:GetChild(iter_207_0 - 1)

		setActive(var_207_11, iter_207_0 <= var_207_7)
		triggerToggle(var_207_11, iter_207_0 <= var_207_6)
	end

	local var_207_12 = findTF(arg_207_0, "content/front/frame")
	local var_207_13, var_207_14 = arg_207_1:GetFrameAndEffect()

	setShipCardFrame(var_207_12, var_207_0, var_207_13)
	setFrameEffect(findTF(arg_207_0, "content/front/bg_other"), var_207_14)
	setProposeMarkIcon(arg_207_0:Find("content/dockyard/propose"), arg_207_1)
end

function TweenItemAlphaAndWhite(arg_208_0)
	LeanTween.cancel(arg_208_0)

	local var_208_0 = GetOrAddComponent(arg_208_0, "CanvasGroup")

	var_208_0.alpha = 0

	LeanTween.alphaCanvas(var_208_0, 1, 0.2):setUseEstimatedTime(true)

	local var_208_1 = findTF(arg_208_0.transform, "white_mask")

	if var_208_1 then
		setActive(var_208_1, false)
	end
end

function ClearTweenItemAlphaAndWhite(arg_209_0)
	LeanTween.cancel(arg_209_0)

	GetOrAddComponent(arg_209_0, "CanvasGroup").alpha = 0
end

function getGroupOwnSkins(arg_210_0)
	local var_210_0 = {}
	local var_210_1 = getProxy(ShipSkinProxy):getSkinList()
	local var_210_2 = getProxy(CollectionProxy):getShipGroup(arg_210_0)

	if var_210_2 then
		local var_210_3 = ShipGroup.getSkinList(arg_210_0)

		for iter_210_0, iter_210_1 in ipairs(var_210_3) do
			if iter_210_1.skin_type == ShipSkin.SKIN_TYPE_DEFAULT or table.contains(var_210_1, iter_210_1.id) or iter_210_1.skin_type == ShipSkin.SKIN_TYPE_REMAKE and var_210_2.trans or iter_210_1.skin_type == ShipSkin.SKIN_TYPE_PROPOSE and var_210_2.married == 1 then
				var_210_0[iter_210_1.id] = true
			end
		end
	end

	return var_210_0
end

function split(arg_211_0, arg_211_1)
	local var_211_0 = {}

	if not arg_211_0 then
		return nil
	end

	local var_211_1 = #arg_211_0
	local var_211_2 = 1

	while var_211_2 <= var_211_1 do
		local var_211_3 = string.find(arg_211_0, arg_211_1, var_211_2)

		if var_211_3 == nil then
			table.insert(var_211_0, string.sub(arg_211_0, var_211_2, var_211_1))

			break
		end

		table.insert(var_211_0, string.sub(arg_211_0, var_211_2, var_211_3 - 1))

		if var_211_3 == var_211_1 then
			table.insert(var_211_0, "")

			break
		end

		var_211_2 = var_211_3 + 1
	end

	return var_211_0
end

function NumberToChinese(arg_212_0, arg_212_1)
	local var_212_0 = ""
	local var_212_1 = #arg_212_0

	for iter_212_0 = 1, var_212_1 do
		local var_212_2 = string.sub(arg_212_0, iter_212_0, iter_212_0)

		if var_212_2 ~= "0" or var_212_2 == "0" and not arg_212_1 then
			if arg_212_1 then
				if var_212_1 >= 2 then
					if iter_212_0 == 1 then
						if var_212_2 == "1" then
							var_212_0 = i18n("number_" .. 10)
						else
							var_212_0 = i18n("number_" .. var_212_2) .. i18n("number_" .. 10)
						end
					else
						var_212_0 = var_212_0 .. i18n("number_" .. var_212_2)
					end
				else
					var_212_0 = var_212_0 .. i18n("number_" .. var_212_2)
				end
			else
				var_212_0 = var_212_0 .. i18n("number_" .. var_212_2)
			end
		end
	end

	return var_212_0
end

function getActivityTask(arg_213_0, arg_213_1)
	local var_213_0 = getProxy(TaskProxy)
	local var_213_1 = arg_213_0:getConfig("config_data")
	local var_213_2 = arg_213_0:getNDay(arg_213_0.data1)
	local var_213_3
	local var_213_4
	local var_213_5

	for iter_213_0 = math.max(arg_213_0.data3, 1), math.min(var_213_2, #var_213_1) do
		local var_213_6 = _.flatten({
			var_213_1[iter_213_0]
		})

		for iter_213_1, iter_213_2 in ipairs(var_213_6) do
			local var_213_7 = var_213_0:getTaskById(iter_213_2)

			if var_213_7 then
				return var_213_7.id, var_213_7
			end

			if var_213_4 then
				var_213_5 = var_213_0:getFinishTaskById(iter_213_2)

				if var_213_5 then
					var_213_4 = var_213_5
				elseif arg_213_1 then
					return iter_213_2
				else
					return var_213_4.id, var_213_4
				end
			else
				var_213_4 = var_213_0:getFinishTaskById(iter_213_2)
				var_213_5 = var_213_5 or iter_213_2
			end
		end
	end

	if var_213_4 then
		return var_213_4.id, var_213_4
	else
		return var_213_5
	end
end

function setImageFromImage(arg_214_0, arg_214_1, arg_214_2)
	local var_214_0 = GetComponent(arg_214_0, "Image")

	var_214_0.sprite = GetComponent(arg_214_1, "Image").sprite

	if arg_214_2 then
		var_214_0:SetNativeSize()
	end
end

function skinTimeStamp(arg_215_0)
	local var_215_0, var_215_1, var_215_2, var_215_3 = pg.TimeMgr.GetInstance():parseTimeFrom(arg_215_0)

	if var_215_0 >= 1 then
		return i18n("limit_skin_time_day", var_215_0)
	elseif var_215_0 <= 0 and var_215_1 > 0 then
		return i18n("limit_skin_time_day_min", var_215_1, var_215_2)
	elseif var_215_0 <= 0 and var_215_1 <= 0 and (var_215_2 > 0 or var_215_3 > 0) then
		return i18n("limit_skin_time_min", math.max(var_215_2, 1))
	elseif var_215_0 <= 0 and var_215_1 <= 0 and var_215_2 <= 0 and var_215_3 <= 0 then
		return i18n("limit_skin_time_overtime")
	end
end

function skinCommdityTimeStamp(arg_216_0)
	local var_216_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_216_1 = math.max(arg_216_0 - var_216_0, 0)
	local var_216_2 = math.floor(var_216_1 / 86400)

	if var_216_2 > 0 then
		return i18n("time_remaining_tip") .. var_216_2 .. i18n("word_date")
	else
		local var_216_3 = math.floor(var_216_1 / 3600)

		if var_216_3 > 0 then
			return i18n("time_remaining_tip") .. var_216_3 .. i18n("word_hour")
		else
			local var_216_4 = math.floor(var_216_1 / 60)

			if var_216_4 > 0 then
				return i18n("time_remaining_tip") .. var_216_4 .. i18n("word_minute")
			else
				return i18n("time_remaining_tip") .. var_216_1 .. i18n("word_second")
			end
		end
	end
end

function InstagramTimeStamp(arg_217_0)
	local var_217_0 = pg.TimeMgr.GetInstance():GetServerTime() - arg_217_0
	local var_217_1 = var_217_0 / 86400

	if var_217_1 > 1 then
		return i18n("ins_word_day", math.floor(var_217_1))
	else
		local var_217_2 = var_217_0 / 3600

		if var_217_2 > 1 then
			return i18n("ins_word_hour", math.floor(var_217_2))
		else
			local var_217_3 = var_217_0 / 60

			if var_217_3 > 1 then
				return i18n("ins_word_minu", math.floor(var_217_3))
			else
				return i18n("ins_word_minu", 1)
			end
		end
	end
end

function InstagramReplyTimeStamp(arg_218_0)
	local var_218_0 = pg.TimeMgr.GetInstance():GetServerTime() - arg_218_0
	local var_218_1 = var_218_0 / 86400

	if var_218_1 > 1 then
		return i18n1(math.floor(var_218_1) .. "d")
	else
		local var_218_2 = var_218_0 / 3600

		if var_218_2 > 1 then
			return i18n1(math.floor(var_218_2) .. "h")
		else
			local var_218_3 = var_218_0 / 60

			if var_218_3 > 1 then
				return i18n1(math.floor(var_218_3) .. "min")
			else
				return i18n1("1min")
			end
		end
	end
end

function attireTimeStamp(arg_219_0)
	local var_219_0, var_219_1, var_219_2, var_219_3 = pg.TimeMgr.GetInstance():parseTimeFrom(arg_219_0)

	if var_219_0 <= 0 and var_219_1 <= 0 and var_219_2 <= 0 and var_219_3 <= 0 then
		return i18n("limit_skin_time_overtime")
	else
		return i18n("attire_time_stamp", var_219_0, var_219_1, var_219_2)
	end
end

function checkExist(arg_220_0, ...)
	local var_220_0 = {
		...
	}

	for iter_220_0, iter_220_1 in ipairs(var_220_0) do
		if arg_220_0 == nil then
			break
		end

		assert(type(arg_220_0) == "table", "type error : intermediate target should be table")
		assert(type(iter_220_1) == "table", "type error : param should be table")

		if type(arg_220_0[iter_220_1[1]]) == "function" then
			arg_220_0 = arg_220_0[iter_220_1[1]](arg_220_0, unpack(iter_220_1[2] or {}))
		else
			arg_220_0 = arg_220_0[iter_220_1[1]]
		end
	end

	return arg_220_0
end

function AcessWithinNull(arg_221_0, arg_221_1)
	if arg_221_0 == nil then
		return
	end

	assert(type(arg_221_0) == "table")

	return arg_221_0[arg_221_1]
end

function showRepairMsgbox()
	local var_222_0 = {
		text = i18n("msgbox_repair"),
		onCallback = function()
			if PathMgr.FileExists(Application.persistentDataPath .. "/hashes.csv") then
				BundleWizard.Inst:GetGroupMgr("DEFAULT_RES"):StartVerifyForLua()
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("word_no_cache"))
			end
		end
	}
	local var_222_1 = {
		text = i18n("msgbox_repair_l2d"),
		onCallback = function()
			if PathMgr.FileExists(Application.persistentDataPath .. "/hashes-live2d.csv") then
				BundleWizard.Inst:GetGroupMgr("L2D"):StartVerifyForLua()
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("word_no_cache"))
			end
		end
	}
	local var_222_2 = {
		text = i18n("msgbox_repair_painting"),
		onCallback = function()
			if PathMgr.FileExists(Application.persistentDataPath .. "/hashes-painting.csv") then
				BundleWizard.Inst:GetGroupMgr("PAINTING"):StartVerifyForLua()
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("word_no_cache"))
			end
		end
	}

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		hideYes = true,
		hideNo = true,
		content = i18n("resource_verify_warn"),
		custom = {
			var_222_2,
			var_222_1,
			var_222_0
		}
	})
end

function resourceVerify(arg_226_0, arg_226_1)
	if CSharpVersion > 35 then
		BundleWizard.Inst:GetGroupMgr("DEFAULT_RES"):StartVerifyForLua()

		return
	end

	local var_226_0 = Application.persistentDataPath .. "/hashes.csv"
	local var_226_1
	local var_226_2 = PathMgr.ReadAllLines(var_226_0)
	local var_226_3 = {}

	if arg_226_0 then
		setActive(arg_226_0, true)
	else
		pg.UIMgr.GetInstance():LoadingOn()
	end

	local function var_226_4()
		if arg_226_0 then
			setActive(arg_226_0, false)
		else
			pg.UIMgr.GetInstance():LoadingOff()
		end

		print(var_226_1)

		if var_226_1 then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("resource_verify_fail", ""),
				onYes = function()
					VersionMgr.Inst:DeleteCacheFiles()
					Application.Quit()
				end
			})
		else
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("resource_verify_success")
			})
		end
	end

	local var_226_5 = var_226_2.Length
	local var_226_6

	local function var_226_7(arg_229_0)
		if arg_229_0 < 0 then
			var_226_4()

			return
		end

		if arg_226_1 then
			setSlider(arg_226_1, 0, var_226_5, var_226_5 - arg_229_0)
		end

		local var_229_0 = string.split(var_226_2[arg_229_0], ",")
		local var_229_1 = var_229_0[1]
		local var_229_2 = var_229_0[3]
		local var_229_3 = PathMgr.getAssetBundle(var_229_1)

		if PathMgr.FileExists(var_229_3) then
			local var_229_4 = PathMgr.ReadAllBytes(PathMgr.getAssetBundle(var_229_1))

			if var_229_2 == HashUtil.CalcMD5(var_229_4) then
				onNextTick(function()
					var_226_7(arg_229_0 - 1)
				end)

				return
			end
		end

		var_226_1 = var_229_1

		var_226_4()
	end

	var_226_7(var_226_5 - 1)
end

function splitByWordEN(arg_231_0, arg_231_1)
	local var_231_0 = string.split(arg_231_0, " ")
	local var_231_1 = ""
	local var_231_2 = ""
	local var_231_3 = arg_231_1:GetComponent(typeof(RectTransform))
	local var_231_4 = arg_231_1:GetComponent(typeof(Text))
	local var_231_5 = var_231_3.rect.width

	for iter_231_0, iter_231_1 in ipairs(var_231_0) do
		local var_231_6 = var_231_2

		var_231_2 = var_231_2 == "" and iter_231_1 or var_231_2 .. " " .. iter_231_1

		setText(arg_231_1, var_231_2)

		if var_231_5 < var_231_4.preferredWidth then
			var_231_1 = var_231_1 == "" and var_231_6 or var_231_1 .. "\n" .. var_231_6
			var_231_2 = iter_231_1
		end

		if iter_231_0 >= #var_231_0 then
			var_231_1 = var_231_1 == "" and var_231_2 or var_231_1 .. "\n" .. var_231_2
		end
	end

	return var_231_1
end

function checkBirthFormat(arg_232_0)
	if #arg_232_0 ~= 8 then
		return false
	end

	local var_232_0 = 0
	local var_232_1 = #arg_232_0

	while var_232_0 < var_232_1 do
		local var_232_2 = string.byte(arg_232_0, var_232_0 + 1)

		if var_232_2 < 48 or var_232_2 > 57 then
			return false
		end

		var_232_0 = var_232_0 + 1
	end

	return true
end

function isHalfBodyLive2D(arg_233_0)
	local var_233_0 = {
		"biaoqiang",
		"z23",
		"lafei",
		"lingbo",
		"mingshi",
		"xuefeng"
	}

	return _.any(var_233_0, function(arg_234_0)
		return arg_234_0 == arg_233_0
	end)
end

function GetServerState(arg_235_0)
	local var_235_0 = -1
	local var_235_1 = 0
	local var_235_2 = 1
	local var_235_3 = 2
	local var_235_4 = NetConst.GetServerStateUrl()

	if PLATFORM_CODE == PLATFORM_CH then
		var_235_4 = string.gsub(var_235_4, "https", "http")
	end

	VersionMgr.Inst:WebRequest(var_235_4, function(arg_236_0, arg_236_1)
		local var_236_0 = true
		local var_236_1 = false

		for iter_236_0 in string.gmatch(arg_236_1, "\"state\":%d") do
			if iter_236_0 ~= "\"state\":1" then
				var_236_0 = false
			end

			var_236_1 = true
		end

		if not var_236_1 then
			var_236_0 = false
		end

		if arg_235_0 ~= nil then
			arg_235_0(var_236_0 and var_235_2 or var_235_1)
		end
	end)
end

function setScrollText(arg_237_0, arg_237_1)
	GetOrAddComponent(arg_237_0, "ScrollText"):SetText(arg_237_1)
end

function changeToScrollText(arg_238_0, arg_238_1)
	local var_238_0 = GetComponent(arg_238_0, typeof(Text))

	assert(var_238_0, "without component<Text>")

	local var_238_1 = arg_238_0:Find("subText")

	if not var_238_1 then
		var_238_1 = cloneTplTo(arg_238_0, arg_238_0, "subText")

		eachChild(arg_238_0, function(arg_239_0)
			setActive(arg_239_0, arg_239_0 == var_238_1)
		end)

		arg_238_0:GetComponent(typeof(Text)).enabled = false
	end

	setScrollText(var_238_1, arg_238_1)
end

local var_0_16
local var_0_17
local var_0_18
local var_0_19

local function var_0_20(arg_240_0, arg_240_1, arg_240_2)
	local var_240_0 = arg_240_0:Find("base")
	local var_240_1, var_240_2, var_240_3 = Equipment.GetInfoTrans(arg_240_1, arg_240_2)

	if arg_240_1.nextValue then
		local var_240_4 = {
			name = arg_240_1.name,
			type = arg_240_1.type,
			value = arg_240_1.nextValue
		}
		local var_240_5, var_240_6 = Equipment.GetInfoTrans(var_240_4, arg_240_2)

		var_240_2 = var_240_2 .. setColorStr("   >   " .. var_240_6, COLOR_GREEN)
	end

	setText(var_240_0:Find("name"), var_240_1)

	if var_240_3 then
		local var_240_7 = "<color=#afff72>(+" .. ys.Battle.BattleConst.UltimateBonus.AuxBoostValue * 100 .. "%)</color>"

		setText(var_240_0:Find("value"), var_240_2 .. var_240_7)
	else
		setText(var_240_0:Find("value"), var_240_2)
	end

	setActive(var_240_0:Find("value/up"), arg_240_1.compare and arg_240_1.compare > 0)
	setActive(var_240_0:Find("value/down"), arg_240_1.compare and arg_240_1.compare < 0)
	triggerToggle(var_240_0, arg_240_1.lock_open)

	if not arg_240_1.lock_open and arg_240_1.sub and #arg_240_1.sub > 0 then
		GetComponent(var_240_0, typeof(Toggle)).enabled = true
	else
		setActive(var_240_0:Find("name/close"), false)
		setActive(var_240_0:Find("name/open"), false)

		GetComponent(var_240_0, typeof(Toggle)).enabled = false
	end
end

local function var_0_21(arg_241_0, arg_241_1, arg_241_2, arg_241_3)
	var_0_20(arg_241_0, arg_241_2, arg_241_3)

	if not arg_241_2.sub or #arg_241_2.sub == 0 then
		return
	end

	var_0_18(arg_241_0:Find("subs"), arg_241_1, arg_241_2.sub, arg_241_3)
end

function var_0_18(arg_242_0, arg_242_1, arg_242_2, arg_242_3)
	removeAllChildren(arg_242_0)
	var_0_19(arg_242_0, arg_242_1, arg_242_2, arg_242_3)
end

function var_0_19(arg_243_0, arg_243_1, arg_243_2, arg_243_3)
	for iter_243_0, iter_243_1 in ipairs(arg_243_2) do
		local var_243_0 = cloneTplTo(arg_243_1, arg_243_0)

		var_0_21(var_243_0, arg_243_1, iter_243_1, arg_243_3)
	end
end

function updateEquipInfo(arg_244_0, arg_244_1, arg_244_2, arg_244_3)
	local var_244_0 = arg_244_0:Find("attr_tpl")

	var_0_18(arg_244_0:Find("attrs"), var_244_0, arg_244_1.attrs, arg_244_3)
	setActive(arg_244_0:Find("skill"), arg_244_2)

	if arg_244_2 then
		var_0_21(arg_244_0:Find("skill/attr"), var_244_0, {
			name = i18n("skill"),
			value = setColorStr(arg_244_2.name, "#FFDE00FF")
		}, arg_244_3)
		setText(arg_244_0:Find("skill/value/Text"), getSkillDescGet(arg_244_2.id))
	end

	setActive(arg_244_0:Find("weapon"), #arg_244_1.weapon.sub > 0)

	if #arg_244_1.weapon.sub > 0 then
		var_0_18(arg_244_0:Find("weapon"), var_244_0, {
			arg_244_1.weapon
		}, arg_244_3)
	end

	setActive(arg_244_0:Find("equip_info"), #arg_244_1.equipInfo.sub > 0)

	if #arg_244_1.equipInfo.sub > 0 then
		var_0_18(arg_244_0:Find("equip_info"), var_244_0, {
			arg_244_1.equipInfo
		}, arg_244_3)
	end

	var_0_21(arg_244_0:Find("part/attr"), var_244_0, {
		name = i18n("equip_info_23")
	}, arg_244_3)

	local var_244_1 = arg_244_0:Find("part/value")
	local var_244_2 = var_244_1:Find("label")
	local var_244_3 = {}
	local var_244_4 = {}

	if #arg_244_1.part[1] == 0 and #arg_244_1.part[2] == 0 then
		setmetatable(var_244_3, {
			__index = function(arg_245_0, arg_245_1)
				return true
			end
		})
		setmetatable(var_244_4, {
			__index = function(arg_246_0, arg_246_1)
				return true
			end
		})
	else
		for iter_244_0, iter_244_1 in ipairs(arg_244_1.part[1]) do
			var_244_3[iter_244_1] = true
		end

		for iter_244_2, iter_244_3 in ipairs(arg_244_1.part[2]) do
			var_244_4[iter_244_3] = true
		end
	end

	local var_244_5 = ShipType.MergeFengFanType(ShipType.FilterOverQuZhuType(ShipType.AllShipType), var_244_3, var_244_4)

	UIItemList.StaticAlign(var_244_1, var_244_2, #var_244_5, function(arg_247_0, arg_247_1, arg_247_2)
		arg_247_1 = arg_247_1 + 1

		if arg_247_0 == UIItemList.EventUpdate then
			local var_247_0 = var_244_5[arg_247_1]

			GetImageSpriteFromAtlasAsync("shiptype", ShipType.Type2CNLabel(var_247_0), arg_247_2)
			setActive(arg_247_2:Find("main"), var_244_3[var_247_0] and not var_244_4[var_247_0])
			setActive(arg_247_2:Find("sub"), var_244_4[var_247_0] and not var_244_3[var_247_0])
			setImageAlpha(arg_247_2, not var_244_3[var_247_0] and not var_244_4[var_247_0] and 0.3 or 1)
		end
	end)
end

function updateEquipUpgradeInfo(arg_248_0, arg_248_1, arg_248_2)
	local var_248_0 = arg_248_0:Find("attr_tpl")

	var_0_18(arg_248_0:Find("attrs"), var_248_0, arg_248_1.attrs, arg_248_2)
	setActive(arg_248_0:Find("weapon"), #arg_248_1.weapon.sub > 0)

	if #arg_248_1.weapon.sub > 0 then
		var_0_18(arg_248_0:Find("weapon"), var_248_0, {
			arg_248_1.weapon
		}, arg_248_2)
	end

	setActive(arg_248_0:Find("equip_info"), #arg_248_1.equipInfo.sub > 0)

	if #arg_248_1.equipInfo.sub > 0 then
		var_0_18(arg_248_0:Find("equip_info"), var_248_0, {
			arg_248_1.equipInfo
		}, arg_248_2)
	end
end

function setCanvasOverrideSorting(arg_249_0, arg_249_1)
	local var_249_0 = arg_249_0.parent

	arg_249_0:SetParent(pg.LayerWeightMgr.GetInstance().uiOrigin, false)

	if isActive(arg_249_0) then
		GetOrAddComponent(arg_249_0, typeof(Canvas)).overrideSorting = arg_249_1
	else
		setActive(arg_249_0, true)

		GetOrAddComponent(arg_249_0, typeof(Canvas)).overrideSorting = arg_249_1

		setActive(arg_249_0, false)
	end

	arg_249_0:SetParent(var_249_0, false)
end

function createNewGameObject(arg_250_0, arg_250_1)
	local var_250_0 = GameObject.New()

	if arg_250_0 then
		var_250_0.name = "model"
	end

	var_250_0.layer = arg_250_1 or Layer.UI

	return GetOrAddComponent(var_250_0, "RectTransform")
end

function CreateShell(arg_251_0)
	if type(arg_251_0) ~= "table" and type(arg_251_0) ~= "userdata" then
		return arg_251_0
	end

	local var_251_0 = setmetatable({
		__index = arg_251_0
	}, arg_251_0)

	return setmetatable({}, var_251_0)
end

function CameraFittingSettin(arg_252_0)
	local var_252_0 = GetComponent(arg_252_0, typeof(Camera))
	local var_252_1 = 1.7777777777777777
	local var_252_2 = Screen.width / Screen.height

	if var_252_2 < var_252_1 then
		local var_252_3 = var_252_2 / var_252_1

		var_252_0.rect = var_0_0.Rect.New(0, (1 - var_252_3) / 2, 1, var_252_3)
	end
end

function SwitchSpecialChar(arg_253_0, arg_253_1)
	if PLATFORM_CODE ~= PLATFORM_US then
		arg_253_0 = arg_253_0:gsub(" ", " ")
		arg_253_0 = arg_253_0:gsub("\t", "    ")
	end

	if not arg_253_1 then
		arg_253_0 = arg_253_0:gsub("\n", " ")
	end

	return arg_253_0
end

function AfterCheck(arg_254_0, arg_254_1)
	local var_254_0 = {}

	for iter_254_0, iter_254_1 in ipairs(arg_254_0) do
		var_254_0[iter_254_0] = iter_254_1[1]()
	end

	arg_254_1()

	for iter_254_2, iter_254_3 in ipairs(arg_254_0) do
		if var_254_0[iter_254_2] ~= iter_254_3[1]() then
			iter_254_3[2]()
		end

		var_254_0[iter_254_2] = iter_254_3[1]()
	end
end

function CompareFuncs(arg_255_0, arg_255_1)
	local var_255_0 = {}

	local function var_255_1(arg_256_0, arg_256_1)
		var_255_0[arg_256_0] = var_255_0[arg_256_0] or {}
		var_255_0[arg_256_0][arg_256_1] = var_255_0[arg_256_0][arg_256_1] or arg_255_0[arg_256_0](arg_256_1)

		return var_255_0[arg_256_0][arg_256_1]
	end

	return function(arg_257_0, arg_257_1)
		local var_257_0 = 1

		while var_257_0 <= #arg_255_0 do
			local var_257_1 = var_255_1(var_257_0, arg_257_0)
			local var_257_2 = var_255_1(var_257_0, arg_257_1)

			if var_257_1 == var_257_2 then
				var_257_0 = var_257_0 + 1
			else
				return var_257_1 < var_257_2
			end
		end

		return tobool(arg_255_1)
	end
end

function DropResultIntegration(arg_258_0)
	local var_258_0 = {}
	local var_258_1 = 1

	while var_258_1 <= #arg_258_0 do
		local var_258_2 = arg_258_0[var_258_1].type
		local var_258_3 = arg_258_0[var_258_1].id

		var_258_0[var_258_2] = var_258_0[var_258_2] or {}

		if var_258_0[var_258_2][var_258_3] then
			local var_258_4 = arg_258_0[var_258_0[var_258_2][var_258_3]]
			local var_258_5 = table.remove(arg_258_0, var_258_1)

			var_258_4.count = var_258_4.count + var_258_5.count
		else
			var_258_0[var_258_2][var_258_3] = var_258_1
			var_258_1 = var_258_1 + 1
		end
	end

	local var_258_6 = {
		function(arg_259_0)
			local var_259_0 = arg_259_0.type
			local var_259_1 = arg_259_0.id

			if var_259_0 == DROP_TYPE_SHIP then
				return 1
			elseif var_259_0 == DROP_TYPE_RESOURCE then
				if var_259_1 == 1 then
					return 2
				else
					return 3
				end
			elseif var_259_0 == DROP_TYPE_ITEM then
				if var_259_1 == 59010 then
					return 4
				elseif var_259_1 == 59900 then
					return 5
				else
					local var_259_2 = Item.getConfigData(var_259_1)
					local var_259_3 = var_259_2 and var_259_2.type or 0

					if var_259_3 == 9 then
						return 6
					elseif var_259_3 == 5 then
						return 7
					elseif var_259_3 == 4 then
						return 8
					elseif var_259_3 == 7 then
						return 9
					end
				end
			elseif var_259_0 == DROP_TYPE_VITEM and var_259_1 == 59011 then
				return 4
			end

			return 100
		end,
		function(arg_260_0)
			local var_260_0

			if arg_260_0.type == DROP_TYPE_SHIP then
				var_260_0 = pg.ship_data_statistics[arg_260_0.id]
			elseif arg_260_0.type == DROP_TYPE_ITEM then
				var_260_0 = Item.getConfigData(arg_260_0.id)
			end

			return (var_260_0 and var_260_0.rarity or 0) * -1
		end,
		function(arg_261_0)
			return arg_261_0.id
		end
	}

	table.sort(arg_258_0, CompareFuncs(var_258_6))
end

function getLoginConfig()
	local var_262_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_262_1 = 1

	for iter_262_0, iter_262_1 in ipairs(pg.login.all) do
		if pg.login[iter_262_1].date ~= "stop" then
			local var_262_2, var_262_3 = parseTimeConfig(pg.login[iter_262_1].date)

			assert(not var_262_3)

			if pg.TimeMgr.GetInstance():inTime(var_262_2, var_262_0) then
				var_262_1 = iter_262_1

				break
			end
		end
	end

	local var_262_4 = pg.login[var_262_1].login_static

	var_262_4 = var_262_4 ~= "" and var_262_4 or "login"

	local var_262_5 = pg.login[var_262_1].login_cri
	local var_262_6 = var_262_5 ~= "" and true or false
	local var_262_7 = pg.login[var_262_1].op_play == 1 and true or false
	local var_262_8 = pg.login[var_262_1].op_time

	if var_262_8 == "" or not pg.TimeMgr.GetInstance():inTime(var_262_8, var_262_0) then
		var_262_7 = false
	end

	local var_262_9 = var_262_8 == "" and var_262_8 or table.concat(var_262_8[1][1])

	return var_262_6, var_262_6 and var_262_5 or var_262_4, pg.login[var_262_1].bgm, var_262_7, var_262_9
end

function setIntimacyIcon(arg_263_0, arg_263_1, arg_263_2)
	local var_263_0 = {}
	local var_263_1

	seriesAsync({
		function(arg_264_0)
			if arg_263_0.childCount > 0 then
				var_263_1 = arg_263_0:GetChild(0)

				arg_264_0()
			else
				LoadAndInstantiateAsync("template", "intimacytpl", function(arg_265_0)
					var_263_1 = tf(arg_265_0)

					setParent(var_263_1, arg_263_0)
					arg_264_0()
				end)
			end
		end,
		function(arg_266_0)
			setImageAlpha(var_263_1, arg_263_2 and 0 or 1)
			eachChild(var_263_1, function(arg_267_0)
				setActive(arg_267_0, false)
			end)

			if arg_263_2 then
				local var_266_0 = var_263_1:Find(arg_263_2 .. "(Clone)")

				if not var_266_0 then
					LoadAndInstantiateAsync("ui", arg_263_2, function(arg_268_0)
						setParent(arg_268_0, var_263_1)
						setActive(arg_268_0, true)
					end)
				else
					setActive(var_266_0, true)
				end
			elseif arg_263_1 then
				setImageSprite(var_263_1, GetSpriteFromAtlas("energy", arg_263_1), true)
			else
				assert(false, "param error")
			end
		end
	})
end

local var_0_22

function nowWorld()
	var_0_22 = var_0_22 or getProxy(WorldProxy)

	return var_0_22 and var_0_22.world
end

function removeWorld()
	var_0_22.world:Dispose()

	var_0_22.world = nil
	var_0_22 = nil
end

function switch(arg_271_0, arg_271_1, arg_271_2, ...)
	if arg_271_1[arg_271_0] then
		return arg_271_1[arg_271_0](...)
	elseif arg_271_2 then
		return arg_271_2(...)
	end
end

function parseTimeConfig(arg_272_0)
	if type(arg_272_0[1]) == "table" then
		return arg_272_0[2], arg_272_0[1]
	else
		return arg_272_0
	end
end

local var_0_23 = {
	__add = function(arg_273_0, arg_273_1)
		return NewPos(arg_273_0.x + arg_273_1.x, arg_273_0.y + arg_273_1.y)
	end,
	__sub = function(arg_274_0, arg_274_1)
		return NewPos(arg_274_0.x - arg_274_1.x, arg_274_0.y - arg_274_1.y)
	end,
	__mul = function(arg_275_0, arg_275_1)
		if type(arg_275_1) == "number" then
			return NewPos(arg_275_0.x * arg_275_1, arg_275_0.y * arg_275_1)
		else
			return NewPos(arg_275_0.x * arg_275_1.x, arg_275_0.y * arg_275_1.y)
		end
	end,
	__eq = function(arg_276_0, arg_276_1)
		return arg_276_0.x == arg_276_1.x and arg_276_0.y == arg_276_1.y
	end,
	__tostring = function(arg_277_0)
		return arg_277_0.x .. "_" .. arg_277_0.y
	end
}

function NewPos(arg_278_0, arg_278_1)
	assert(arg_278_0 and arg_278_1)

	local var_278_0 = setmetatable({
		x = arg_278_0,
		y = arg_278_1
	}, var_0_23)

	function var_278_0.SqrMagnitude(arg_279_0)
		return arg_279_0.x * arg_279_0.x + arg_279_0.y * arg_279_0.y
	end

	function var_278_0.Normalize(arg_280_0)
		local var_280_0 = arg_280_0:SqrMagnitude()

		if var_280_0 > 1e-05 then
			return arg_280_0 * (1 / math.sqrt(var_280_0))
		else
			return NewPos(0, 0)
		end
	end

	return var_278_0
end

local var_0_24

function Timekeeping()
	warning(Time.realtimeSinceStartup - (var_0_24 or Time.realtimeSinceStartup), Time.realtimeSinceStartup)

	var_0_24 = Time.realtimeSinceStartup
end

function GetRomanDigit(arg_282_0)
	return (string.char(226, 133, 160 + (arg_282_0 - 1)))
end

function quickPlayAnimator(arg_283_0, arg_283_1)
	arg_283_0:GetComponent(typeof(Animator)):Play(arg_283_1, -1, 0)
end

function quickCheckAndPlayAnimator(arg_284_0, arg_284_1)
	local var_284_0 = arg_284_0:GetComponent(typeof(Animator))
	local var_284_1 = Animator.StringToHash(arg_284_1)

	if var_284_0:HasState(0, var_284_1) then
		var_284_0:Play(arg_284_1, -1, 0)
	end
end

function getSurveyUrl(arg_285_0)
	local var_285_0 = pg.survey_data_template[arg_285_0]
	local var_285_1

	if not IsUnityEditor then
		if PLATFORM_CODE == PLATFORM_CH then
			local var_285_2 = getProxy(UserProxy):GetCacheGatewayInServerLogined()

			if var_285_2 == PLATFORM_ANDROID then
				if LuaHelper.GetCHPackageType() == PACKAGE_TYPE_BILI then
					var_285_1 = var_285_0.main_url
				else
					var_285_1 = var_285_0.uo_url
				end
			elseif var_285_2 == PLATFORM_IPHONEPLAYER then
				var_285_1 = var_285_0.ios_url
			end
		elseif PLATFORM_CODE == PLATFORM_US or PLATFORM_CODE == PLATFORM_JP then
			var_285_1 = var_285_0.main_url
		end
	else
		var_285_1 = var_285_0.main_url
	end

	local var_285_3 = getProxy(PlayerProxy):getRawData().id
	local var_285_4 = getProxy(UserProxy):getRawData().arg2 or ""
	local var_285_5
	local var_285_6 = PLATFORM == PLATFORM_ANDROID and 1 or PLATFORM == PLATFORM_IPHONEPLAYER and 2 or 3
	local var_285_7 = getProxy(UserProxy):getRawData()
	local var_285_8 = getProxy(ServerProxy):getRawData()[var_285_7 and var_285_7.server or 0]
	local var_285_9 = var_285_8 and var_285_8.id or ""
	local var_285_10 = getProxy(PlayerProxy):getRawData().level
	local var_285_11 = var_285_3 .. "_" .. arg_285_0
	local var_285_12 = var_285_1
	local var_285_13 = {
		var_285_3,
		var_285_4,
		var_285_6,
		var_285_9,
		var_285_10,
		var_285_11
	}

	if var_285_12 then
		for iter_285_0, iter_285_1 in ipairs(var_285_13) do
			var_285_12 = string.gsub(var_285_12, "$" .. iter_285_0, tostring(iter_285_1))
		end
	end

	warning(var_285_12)

	return var_285_12
end

function GetMoneySymbol()
	if PLATFORM_CH == PLATFORM_CODE then
		return "￥"
	elseif PLATFORM_JP == PLATFORM_CODE then
		return "￥"
	elseif PLATFORM_KR == PLATFORM_CODE then
		return "₩"
	elseif PLATFORM_US == PLATFORM_CODE then
		return "$"
	elseif PLATFORM_CHT == PLATFORM_CODE then
		return "TWD"
	end

	return ""
end

function FilterVarchar(arg_287_0)
	assert(type(arg_287_0) == "string" or type(arg_287_0) == "table")

	if arg_287_0 == "" then
		return nil
	end

	return arg_287_0
end

function getGameset(arg_288_0)
	local var_288_0 = pg.gameset[arg_288_0]

	assert(var_288_0)

	return {
		var_288_0.key_value,
		var_288_0.description
	}
end

function getDorm3dGameset(arg_289_0)
	local var_289_0 = pg.dorm3d_set[arg_289_0]

	assert(var_289_0)

	return {
		var_289_0.key_value_int,
		var_289_0.key_value_varchar
	}
end

function GetItemsOverflowDic(arg_290_0)
	arg_290_0 = arg_290_0 or {}

	local var_290_0 = {
		[DROP_TYPE_ITEM] = {},
		[DROP_TYPE_RESOURCE] = {},
		[DROP_TYPE_EQUIP] = 0,
		[DROP_TYPE_SHIP] = 0,
		[DROP_TYPE_WORLD_ITEM] = 0
	}

	while #arg_290_0 > 0 do
		local var_290_1 = table.remove(arg_290_0)

		switch(var_290_1.type, {
			[DROP_TYPE_ITEM] = function()
				if var_290_1:getConfig("open_directly") == 1 then
					for iter_291_0, iter_291_1 in ipairs(var_290_1:getConfig("display_icon")) do
						local var_291_0 = Drop.Create(iter_291_1)

						var_291_0.count = var_291_0.count * var_290_1.count

						table.insert(arg_290_0, var_291_0)
					end
				elseif var_290_1:getSubClass():IsShipExpType() then
					var_290_0[var_290_1.type][var_290_1.id] = defaultValue(var_290_0[var_290_1.type][var_290_1.id], 0) + var_290_1.count
				end
			end,
			[DROP_TYPE_RESOURCE] = function()
				var_290_0[var_290_1.type][var_290_1.id] = defaultValue(var_290_0[var_290_1.type][var_290_1.id], 0) + var_290_1.count
			end,
			[DROP_TYPE_EQUIP] = function()
				var_290_0[var_290_1.type] = var_290_0[var_290_1.type] + var_290_1.count
			end,
			[DROP_TYPE_SHIP] = function()
				var_290_0[var_290_1.type] = var_290_0[var_290_1.type] + var_290_1.count
			end,
			[DROP_TYPE_WORLD_ITEM] = function()
				var_290_0[var_290_1.type] = var_290_0[var_290_1.type] + var_290_1.count
			end
		})
	end

	return var_290_0
end

function CheckOverflow(arg_296_0, arg_296_1)
	local var_296_0 = {}
	local var_296_1 = arg_296_0[DROP_TYPE_RESOURCE][PlayerConst.ResGold] or 0
	local var_296_2 = arg_296_0[DROP_TYPE_RESOURCE][PlayerConst.ResOil] or 0
	local var_296_3 = arg_296_0[DROP_TYPE_EQUIP]
	local var_296_4 = arg_296_0[DROP_TYPE_SHIP]
	local var_296_5 = getProxy(PlayerProxy):getRawData()
	local var_296_6 = false

	if arg_296_1 then
		local var_296_7 = var_296_5:OverStore(PlayerConst.ResStoreGold, var_296_1)
		local var_296_8 = var_296_5:OverStore(PlayerConst.ResStoreOil, var_296_2)

		if var_296_7 > 0 or var_296_8 > 0 then
			var_296_0.isStoreOverflow = {
				var_296_7,
				var_296_8
			}
		end
	else
		if var_296_1 > 0 and var_296_5:GoldMax(var_296_1) then
			return false, "gold"
		end

		if var_296_2 > 0 and var_296_5:OilMax(var_296_2) then
			return false, "oil"
		end
	end

	var_296_0.isExpBookOverflow = {}

	for iter_296_0, iter_296_1 in pairs(arg_296_0[DROP_TYPE_ITEM]) do
		local var_296_9 = Item.getConfigData(iter_296_0)

		if getProxy(BagProxy):getItemCountById(iter_296_0) + iter_296_1 > var_296_9.max_num then
			table.insert(var_296_0.isExpBookOverflow, iter_296_0)
		end
	end

	local var_296_10 = getProxy(EquipmentProxy):getCapacity()

	if var_296_3 > 0 and var_296_3 + var_296_10 > var_296_5:getMaxEquipmentBag() then
		return false, "equip"
	end

	local var_296_11 = getProxy(BayProxy):getShipCount()

	if var_296_4 > 0 and var_296_4 + var_296_11 > var_296_5:getMaxShipBag() then
		return false, "ship"
	end

	return true, var_296_0
end

function CheckShipExpOverflow(arg_297_0)
	local var_297_0 = getProxy(BagProxy)

	for iter_297_0, iter_297_1 in pairs(arg_297_0[DROP_TYPE_ITEM]) do
		if var_297_0:getItemCountById(iter_297_0) + iter_297_1 > Item.getConfigData(iter_297_0).max_num then
			return false
		end
	end

	return true
end

local var_0_25 = {
	[17] = "item_type17_tip2",
	tech = "techpackage_item_use_confirm",
	[16] = "item_type16_tip2",
	[11] = "equip_skin_detail_tip",
	[13] = "item_type13_tip2"
}

function RegisterDetailButton(arg_298_0, arg_298_1, arg_298_2)
	Drop.Change(arg_298_2)
	switch(arg_298_2.type, {
		[DROP_TYPE_ITEM] = function()
			if arg_298_2:getConfig("type") == Item.SKIN_ASSIGNED_TYPE then
				local var_299_0 = Item.getConfigData(arg_298_2.id).usage_arg
				local var_299_1 = var_299_0[3]

				if Item.InTimeLimitSkinAssigned(arg_298_2.id) then
					var_299_1 = table.mergeArray(var_299_0[2], var_299_1, true)
				end

				local var_299_2 = {}

				for iter_299_0, iter_299_1 in ipairs(var_299_0[2]) do
					var_299_2[iter_299_1] = true
				end

				onButton(arg_298_0, arg_298_1, function()
					arg_298_0:closeView()
					pg.m02:sendNotification(GAME.LOAD_LAYERS, {
						parentContext = getProxy(ContextProxy):getCurrentContext(),
						context = Context.New({
							viewComponent = SelectSkinLayer,
							mediator = SkinAtlasMediator,
							data = {
								mode = SelectSkinLayer.MODE_VIEW,
								itemId = arg_298_2.id,
								selectableSkinList = underscore.map(var_299_1, function(arg_301_0)
									return SelectableSkin.New({
										id = arg_301_0,
										isTimeLimit = var_299_2[arg_301_0] or false
									})
								end)
							}
						})
					})
				end, SFX_PANEL)
				setActive(arg_298_1, true)
			else
				local var_299_3 = getProxy(TechnologyProxy):getItemCanUnlockBluePrint(arg_298_2.id) and "tech" or arg_298_2:getConfig("type")

				if var_0_25[var_299_3] then
					local var_299_4 = {
						item2Row = true,
						content = i18n(var_0_25[var_299_3]),
						itemList = underscore.map(arg_298_2:getConfig("display_icon"), function(arg_302_0)
							return Drop.Create(arg_302_0)
						end)
					}

					if var_299_3 == 11 then
						onButton(arg_298_0, arg_298_1, function()
							arg_298_0:emit(BaseUI.ON_DROP_LIST_OWN, var_299_4)
						end, SFX_PANEL)
					else
						onButton(arg_298_0, arg_298_1, function()
							arg_298_0:emit(BaseUI.ON_DROP_LIST, var_299_4)
						end, SFX_PANEL)
					end
				end

				setActive(arg_298_1, tobool(var_0_25[var_299_3]))
			end
		end,
		[DROP_TYPE_EQUIP] = function()
			onButton(arg_298_0, arg_298_1, function()
				arg_298_0:emit(BaseUI.ON_DROP, arg_298_2)
			end, SFX_PANEL)
			setActive(arg_298_1, true)
		end,
		[DROP_TYPE_SPWEAPON] = function()
			onButton(arg_298_0, arg_298_1, function()
				arg_298_0:emit(BaseUI.ON_DROP, arg_298_2)
			end, SFX_PANEL)
			setActive(arg_298_1, true)
		end
	}, function()
		setActive(arg_298_1, false)
	end)
end

function UpdateOwnDisplay(arg_310_0, arg_310_1)
	local var_310_0, var_310_1 = arg_310_1:getOwnedCount()

	setActive(arg_310_0, var_310_1 and var_310_0 > 0)

	if var_310_1 and var_310_0 > 0 then
		setText(arg_310_0:Find("label"), i18n("word_own1"))
		setText(arg_310_0:Find("Text"), var_310_0)
	end
end

function Damp(arg_311_0, arg_311_1, arg_311_2)
	arg_311_1 = Mathf.Max(1, arg_311_1)

	local var_311_0 = Mathf.Epsilon

	if arg_311_1 < var_311_0 or var_311_0 > Mathf.Abs(arg_311_0) then
		return arg_311_0
	end

	if arg_311_2 < var_311_0 then
		return 0
	end

	local var_311_1 = -4.605170186

	return arg_311_0 * (1 - Mathf.Exp(var_311_1 * arg_311_2 / arg_311_1))
end

function checkCullResume(arg_312_0)
	if not ReflectionHelp.RefCallMethodEx(typeof("UnityEngine.CanvasRenderer"), "GetMaterial", GetComponent(arg_312_0, "CanvasRenderer"), {
		typeof("System.Int32")
	}, {
		0
	}) then
		local var_312_0 = arg_312_0:GetComponentsInChildren(typeof(MeshImage))

		for iter_312_0 = 1, var_312_0.Length do
			var_312_0[iter_312_0 - 1]:SetVerticesDirty()
		end

		return false
	end

	return true
end

function parseEquipCode(arg_313_0)
	local var_313_0 = {}

	if arg_313_0 and arg_313_0 ~= "" then
		local var_313_1 = base64.dec(arg_313_0)

		var_313_0 = string.split(var_313_1, "/")
		var_313_0[5], var_313_0[6] = unpack(string.split(var_313_0[5], "\\"))

		if #var_313_0 < 6 or arg_313_0 ~= base64.enc(table.concat({
			table.concat(underscore.first(var_313_0, 5), "/"),
			var_313_0[6]
		}, "\\")) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("equipcode_illegal"))

			var_313_0 = {}
		end
	end

	for iter_313_0 = 1, 6 do
		var_313_0[iter_313_0] = var_313_0[iter_313_0] and tonumber(var_313_0[iter_313_0], 32) or 0
	end

	return var_313_0
end

function buildEquipCode(arg_314_0)
	local var_314_0 = underscore.map(arg_314_0:getAllEquipments(), function(arg_315_0)
		return ConversionBase(32, arg_315_0 and arg_315_0.id or 0)
	end)
	local var_314_1 = {
		table.concat(var_314_0, "/"),
		ConversionBase(32, checkExist(arg_314_0:GetSpWeapon(), {
			"id"
		}) or 0)
	}

	return base64.enc(table.concat(var_314_1, "\\"))
end

function setDirectorSpeed(arg_316_0, arg_316_1)
	GetComponent(arg_316_0, "TimelineSpeed"):SetTimelineSpeed(arg_316_1)
end

function setDefaultZeroMetatable(arg_317_0)
	return setmetatable(arg_317_0, {
		__index = function(arg_318_0, arg_318_1)
			if rawget(arg_318_0, arg_318_1) == nil then
				arg_318_0[arg_318_1] = 0
			end

			return arg_318_0[arg_318_1]
		end
	})
end

function checkABExist(arg_319_0)
	if EDITOR_TOOL then
		return PathMgr.FileExists(PathMgr.getAssetBundle(arg_319_0)) or ResourceMgr.Inst:AssetExist(arg_319_0)
	else
		return PathMgr.FileExists(PathMgr.getAssetBundle(arg_319_0))
	end
end
