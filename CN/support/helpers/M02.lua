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
	local var_32_0 = buildTempAB("emojis", false)
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

	if not arg_35_3 and PathMgr.FileExists(PathMgr.getAssetBundle("painting/" .. arg_35_1 .. "_n")) and PlayerPrefs.GetInt("paint_hide_other_obj_" .. arg_35_1, 0) ~= 0 then
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

	if PathMgr.FileExists(PathMgr.getAssetBundle("painting/" .. arg_37_1 .. "_n")) and PlayerPrefs.GetInt("paint_hide_other_obj_" .. arg_37_1, 0) ~= 0 then
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

function checkPaintingPrefab(arg_42_0, arg_42_1, arg_42_2, arg_42_3, arg_42_4)
	local var_42_0 = findTF(arg_42_0, "fitter")

	assert(var_42_0, "请添加子物体fitter")
	removeAllChildren(var_42_0)

	local var_42_1 = GetOrAddComponent(var_42_0, "PaintingScaler")

	var_42_1.FrameName = arg_42_2 or ""
	var_42_1.Tween = 1

	local var_42_2 = arg_42_4 or "painting/"
	local var_42_3 = arg_42_1

	if not arg_42_3 and PathMgr.FileExists(PathMgr.getAssetBundle(var_42_2 .. arg_42_1 .. "_n")) and PlayerPrefs.GetInt("paint_hide_other_obj_" .. arg_42_1, 0) ~= 0 then
		arg_42_1 = arg_42_1 .. "_n"
	end

	return var_42_0, arg_42_1, var_42_3
end

function onLoadedPaintingPrefab(arg_43_0)
	local var_43_0 = arg_43_0.paintingTF
	local var_43_1 = arg_43_0.fitterTF
	local var_43_2 = arg_43_0.defaultPaintingName

	setParent(var_43_0, var_43_1, false)

	local var_43_3 = findTF(var_43_0, "Touch")

	if not IsNil(var_43_3) then
		setActive(var_43_3, false)
	end

	local var_43_4 = findTF(var_43_0, "hx")

	if not IsNil(var_43_4) then
		setActive(var_43_4, HXSet.isHx())
	end

	ShipExpressionHelper.SetExpression(var_43_1:GetChild(0), var_43_2)
end

function onLoadedPaintingPrefabAsync(arg_44_0)
	local var_44_0 = arg_44_0.paintingTF
	local var_44_1 = arg_44_0.fitterTF
	local var_44_2 = arg_44_0.objectOrTransform
	local var_44_3 = arg_44_0.paintingName
	local var_44_4 = arg_44_0.defaultPaintingName
	local var_44_5 = arg_44_0.callback

	if IsNil(var_44_2) or var_0_2[var_44_2] ~= var_44_3 then
		PoolMgr.GetInstance():ReturnPainting(var_44_3, var_44_0)

		return
	else
		setParent(var_44_0, var_44_1, false)

		var_0_2[var_44_2] = nil

		ShipExpressionHelper.SetExpression(var_44_0, var_44_4)
	end

	local var_44_6 = findTF(var_44_0, "Touch")

	if not IsNil(var_44_6) then
		setActive(var_44_6, false)
	end

	local var_44_7 = findTF(var_44_0, "hx")

	if not IsNil(var_44_7) then
		setActive(var_44_7, HXSet.isHx())
	end

	if var_44_5 then
		var_44_5()
	end
end

function setCommanderPaintingPrefab(arg_45_0, arg_45_1, arg_45_2, arg_45_3)
	local var_45_0, var_45_1, var_45_2 = checkPaintingPrefab(arg_45_0, arg_45_1, arg_45_2, arg_45_3)

	PoolMgr.GetInstance():GetPaintingWithPrefix(var_45_1, false, function(arg_46_0)
		local var_46_0 = {
			paintingTF = arg_46_0,
			fitterTF = var_45_0,
			defaultPaintingName = var_45_2
		}

		onLoadedPaintingPrefab(var_46_0)
	end, "commanderpainting/")
end

function setCommanderPaintingPrefabAsync(arg_47_0, arg_47_1, arg_47_2, arg_47_3, arg_47_4)
	local var_47_0, var_47_1, var_47_2 = checkPaintingPrefab(arg_47_0, arg_47_1, arg_47_2, arg_47_4)

	var_0_2[arg_47_0] = var_47_1

	PoolMgr.GetInstance():GetPaintingWithPrefix(var_47_1, true, function(arg_48_0)
		local var_48_0 = {
			paintingTF = arg_48_0,
			fitterTF = var_47_0,
			objectOrTransform = arg_47_0,
			paintingName = var_47_1,
			defaultPaintingName = var_47_2,
			callback = arg_47_3
		}

		onLoadedPaintingPrefabAsync(var_48_0)
	end, "commanderpainting/")
end

function retCommanderPaintingPrefab(arg_49_0, arg_49_1)
	retPaintingPrefab(arg_49_0, arg_49_1, "commanderpainting/")
end

function setMetaPaintingPrefab(arg_50_0, arg_50_1, arg_50_2, arg_50_3)
	local var_50_0, var_50_1, var_50_2 = checkPaintingPrefab(arg_50_0, arg_50_1, arg_50_2, arg_50_3)

	PoolMgr.GetInstance():GetPaintingWithPrefix(var_50_1, false, function(arg_51_0)
		local var_51_0 = {
			paintingTF = arg_51_0,
			fitterTF = var_50_0,
			defaultPaintingName = var_50_2
		}

		onLoadedPaintingPrefab(var_51_0)
	end, "metapainting/")
end

function setMetaPaintingPrefabAsync(arg_52_0, arg_52_1, arg_52_2, arg_52_3, arg_52_4)
	local var_52_0, var_52_1, var_52_2 = checkPaintingPrefab(arg_52_0, arg_52_1, arg_52_2, arg_52_4)

	var_0_2[arg_52_0] = var_52_1

	PoolMgr.GetInstance():GetPaintingWithPrefix(var_52_1, true, function(arg_53_0)
		local var_53_0 = {
			paintingTF = arg_53_0,
			fitterTF = var_52_0,
			objectOrTransform = arg_52_0,
			paintingName = var_52_1,
			defaultPaintingName = var_52_2,
			callback = arg_52_3
		}

		onLoadedPaintingPrefabAsync(var_53_0)
	end, "metapainting/")
end

function retMetaPaintingPrefab(arg_54_0, arg_54_1)
	retPaintingPrefab(arg_54_0, arg_54_1, "metapainting/")
end

function setGuildPaintingPrefab(arg_55_0, arg_55_1, arg_55_2, arg_55_3)
	local var_55_0, var_55_1, var_55_2 = checkPaintingPrefab(arg_55_0, arg_55_1, arg_55_2, arg_55_3)

	PoolMgr.GetInstance():GetPaintingWithPrefix(var_55_1, false, function(arg_56_0)
		local var_56_0 = {
			paintingTF = arg_56_0,
			fitterTF = var_55_0,
			defaultPaintingName = var_55_2
		}

		onLoadedPaintingPrefab(var_56_0)
	end, "guildpainting/")
end

function setGuildPaintingPrefabAsync(arg_57_0, arg_57_1, arg_57_2, arg_57_3, arg_57_4)
	local var_57_0, var_57_1, var_57_2 = checkPaintingPrefab(arg_57_0, arg_57_1, arg_57_2, arg_57_4)

	var_0_2[arg_57_0] = var_57_1

	PoolMgr.GetInstance():GetPaintingWithPrefix(var_57_1, true, function(arg_58_0)
		local var_58_0 = {
			paintingTF = arg_58_0,
			fitterTF = var_57_0,
			objectOrTransform = arg_57_0,
			paintingName = var_57_1,
			defaultPaintingName = var_57_2,
			callback = arg_57_3
		}

		onLoadedPaintingPrefabAsync(var_58_0)
	end, "guildpainting/")
end

function retGuildPaintingPrefab(arg_59_0, arg_59_1)
	retPaintingPrefab(arg_59_0, arg_59_1, "guildpainting/")
end

function setShopPaintingPrefab(arg_60_0, arg_60_1, arg_60_2, arg_60_3)
	local var_60_0, var_60_1, var_60_2 = checkPaintingPrefab(arg_60_0, arg_60_1, arg_60_2, arg_60_3)

	PoolMgr.GetInstance():GetPaintingWithPrefix(var_60_1, false, function(arg_61_0)
		local var_61_0 = {
			paintingTF = arg_61_0,
			fitterTF = var_60_0,
			defaultPaintingName = var_60_2
		}

		onLoadedPaintingPrefab(var_61_0)
	end, "shoppainting/")
end

function retShopPaintingPrefab(arg_62_0, arg_62_1)
	retPaintingPrefab(arg_62_0, arg_62_1, "shoppainting/")
end

function setBuildPaintingPrefabAsync(arg_63_0, arg_63_1, arg_63_2, arg_63_3, arg_63_4)
	local var_63_0, var_63_1, var_63_2 = checkPaintingPrefab(arg_63_0, arg_63_1, arg_63_2, arg_63_4)

	var_0_2[arg_63_0] = var_63_1

	PoolMgr.GetInstance():GetPaintingWithPrefix(var_63_1, true, function(arg_64_0)
		local var_64_0 = {
			paintingTF = arg_64_0,
			fitterTF = var_63_0,
			objectOrTransform = arg_63_0,
			paintingName = var_63_1,
			defaultPaintingName = var_63_2,
			callback = arg_63_3
		}

		onLoadedPaintingPrefabAsync(var_64_0)
	end, "buildpainting/")
end

function retBuildPaintingPrefab(arg_65_0, arg_65_1)
	retPaintingPrefab(arg_65_0, arg_65_1, "buildpainting/")
end

function setColorCount(arg_66_0, arg_66_1, arg_66_2)
	setText(arg_66_0, string.format(arg_66_1 < arg_66_2 and "<color=" .. COLOR_RED .. ">%d</color>/%d" or "%d/%d", arg_66_1, arg_66_2))
end

function setColorStr(arg_67_0, arg_67_1)
	return "<color=" .. arg_67_1 .. ">" .. arg_67_0 .. "</color>"
end

function setSizeStr(arg_68_0, arg_68_1)
	local var_68_0, var_68_1 = string.gsub(arg_68_0, "[<]size=%d+[>]", "<size=" .. arg_68_1 .. ">")

	if var_68_1 == 0 then
		var_68_0 = "<size=" .. arg_68_1 .. ">" .. var_68_0 .. "</size>"
	end

	return var_68_0
end

function getBgm(arg_69_0)
	local var_69_0 = pg.voice_bgm[arg_69_0]

	if pg.CriMgr.GetInstance():IsDefaultBGM() then
		return var_69_0 and var_69_0.default_bgm or nil
	elseif var_69_0 then
		local var_69_1 = var_69_0.special_bgm
		local var_69_2 = var_69_0.time

		if var_69_1 and type(var_69_1) == "string" and #var_69_1 > 0 and var_69_2 and type(var_69_2) == "table" then
			local var_69_3 = var_69_0.time
			local var_69_4 = pg.TimeMgr.GetInstance():parseTimeFromConfig(var_69_3[1])
			local var_69_5 = pg.TimeMgr.GetInstance():parseTimeFromConfig(var_69_3[2])
			local var_69_6 = pg.TimeMgr.GetInstance():GetServerTime()

			if var_69_4 <= var_69_6 and var_69_6 <= var_69_5 then
				return var_69_1
			else
				return var_69_0.bgm
			end
		else
			return var_69_0 and var_69_0.bgm or nil
		end
	else
		return nil
	end
end

function playStory(arg_70_0, arg_70_1)
	pg.NewStoryMgr.GetInstance():Play(arg_70_0, arg_70_1)
end

function errorMessage(arg_71_0)
	local var_71_0 = ERROR_MESSAGE[arg_71_0]

	if var_71_0 == nil then
		var_71_0 = ERROR_MESSAGE[9999] .. ":" .. arg_71_0
	end

	return var_71_0
end

function errorTip(arg_72_0, arg_72_1, ...)
	local var_72_0 = pg.gametip[arg_72_0 .. "_error"]
	local var_72_1

	if var_72_0 then
		var_72_1 = var_72_0.tip
	else
		var_72_1 = pg.gametip.common_error.tip
	end

	local var_72_2 = arg_72_0 .. "_error_" .. arg_72_1

	if pg.gametip[var_72_2] then
		local var_72_3 = i18n(var_72_2, ...)

		return var_72_1 .. var_72_3
	else
		local var_72_4 = "common_error_" .. arg_72_1

		if pg.gametip[var_72_4] then
			local var_72_5 = i18n(var_72_4, ...)

			return var_72_1 .. var_72_5
		else
			local var_72_6 = errorMessage(arg_72_1)

			return var_72_1 .. arg_72_1 .. ":" .. var_72_6
		end
	end
end

function colorNumber(arg_73_0, arg_73_1)
	local var_73_0 = "@COLOR_SCOPE"
	local var_73_1 = {}

	arg_73_0 = string.gsub(arg_73_0, "<color=#%x+>", function(arg_74_0)
		table.insert(var_73_1, arg_74_0)

		return var_73_0
	end)
	arg_73_0 = string.gsub(arg_73_0, "%d+%.?%d*%%*", function(arg_75_0)
		return "<color=" .. arg_73_1 .. ">" .. arg_75_0 .. "</color>"
	end)

	if #var_73_1 > 0 then
		local var_73_2 = 0

		return (string.gsub(arg_73_0, var_73_0, function(arg_76_0)
			var_73_2 = var_73_2 + 1

			return var_73_1[var_73_2]
		end))
	else
		return arg_73_0
	end
end

function getBounds(arg_77_0)
	local var_77_0 = LuaHelper.GetWorldCorners(rtf(arg_77_0))
	local var_77_1 = Bounds.New(var_77_0[0], Vector3.zero)

	var_77_1:Encapsulate(var_77_0[2])

	return var_77_1
end

local function var_0_3(arg_78_0, arg_78_1)
	arg_78_0.localScale = Vector3.one
	arg_78_0.anchorMin = Vector2.zero
	arg_78_0.anchorMax = Vector2.one
	arg_78_0.offsetMin = Vector2(arg_78_1[1], arg_78_1[2])
	arg_78_0.offsetMax = Vector2(-arg_78_1[3], -arg_78_1[4])
end

local var_0_4 = {
	frame04 = {
		-8,
		-8.5,
		-8,
		-8
	},
	frame05 = {
		-8,
		-8.5,
		-8,
		-8
	},
	frame14 = {
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
	other = {
		-2.5,
		-4.5,
		-3,
		-4.5
	}
}

function setFrame(arg_79_0, arg_79_1, arg_79_2)
	arg_79_1 = tostring(arg_79_1)

	local var_79_0, var_79_1 = unpack((string.split(arg_79_1, "_")))

	if var_79_1 == "1" then
		arg_79_2 = arg_79_2 or "frame" .. arg_79_1
	end

	GetImageSpriteFromAtlasAsync("weaponframes", "frame", arg_79_0)

	local var_79_2 = arg_79_2 and Color.white or Color.NewHex(ItemRarity.Rarity2FrameHexColor(var_79_0 and tonumber(var_79_0) or ItemRarity.Gray))

	setImageColor(arg_79_0, var_79_2)

	local var_79_3 = findTF(arg_79_0, "specialFrame")

	if arg_79_2 then
		if var_79_3 then
			setActive(var_79_3, true)
		else
			var_79_3 = cloneTplTo(arg_79_0, arg_79_0, "specialFrame")

			removeAllChildren(var_79_3)
		end

		var_0_3(var_79_3, var_0_4[arg_79_2] or var_0_4.other)
		GetImageSpriteFromAtlasAsync("weaponframes", arg_79_2, var_79_3)
	elseif var_79_3 then
		setActive(var_79_3, false)
	end
end

function setIconColorful(arg_80_0, arg_80_1, arg_80_2, arg_80_3)
	arg_80_3 = arg_80_3 or {
		[ItemRarity.SSR] = {
			name = "IconColorful",
			active = function(arg_81_0, arg_81_1)
				return not arg_81_1.noIconColorful and arg_81_0 == ItemRarity.SSR
			end
		}
	}

	local var_80_0 = findTF(arg_80_0, "icon_bg/frame")

	for iter_80_0, iter_80_1 in pairs(arg_80_3) do
		local var_80_1 = iter_80_1.name
		local var_80_2 = iter_80_1.active(arg_80_1, arg_80_2)
		local var_80_3 = var_80_0:Find(var_80_1 .. "(Clone)")

		if var_80_3 then
			setActive(var_80_3, var_80_2)
		elseif var_80_2 then
			LoadAndInstantiateAsync("ui", string.lower(var_80_1), function(arg_82_0)
				if IsNil(arg_80_0) or var_80_0:Find(var_80_1 .. "(Clone)") then
					Object.Destroy(arg_82_0)
				else
					setParent(arg_82_0, var_80_0)
					setActive(arg_82_0, var_80_2)
				end
			end)
		end
	end
end

function setIconStars(arg_83_0, arg_83_1, arg_83_2)
	local var_83_0 = findTF(arg_83_0, "icon_bg/startpl")
	local var_83_1 = findTF(arg_83_0, "icon_bg/stars")

	if var_83_1 and var_83_0 then
		setActive(var_83_1, false)
		setActive(var_83_0, false)
	end

	if not var_83_1 or not arg_83_1 then
		return
	end

	for iter_83_0 = 1, math.max(arg_83_2, var_83_1.childCount) do
		setActive(iter_83_0 > var_83_1.childCount and cloneTplTo(var_83_0, var_83_1) or var_83_1:GetChild(iter_83_0 - 1), iter_83_0 <= arg_83_2)
	end

	setActive(var_83_1, true)
end

local function var_0_5(arg_84_0, arg_84_1)
	local var_84_0 = findTF(arg_84_0, "icon_bg/slv")

	if not IsNil(var_84_0) then
		setActive(var_84_0, arg_84_1 > 0)
		setText(findTF(var_84_0, "Text"), arg_84_1)
	end
end

function setIconName(arg_85_0, arg_85_1, arg_85_2)
	local var_85_0 = findTF(arg_85_0, "name")

	if not IsNil(var_85_0) then
		setText(var_85_0, arg_85_1)
		setTextAlpha(var_85_0, (arg_85_2.hideName or arg_85_2.anonymous) and 0 or 1)
	end
end

function setIconCount(arg_86_0, arg_86_1)
	local var_86_0 = findTF(arg_86_0, "icon_bg/count")

	if not IsNil(var_86_0) then
		setText(var_86_0, arg_86_1 and (type(arg_86_1) ~= "number" or arg_86_1 > 0) and arg_86_1 or "")
	end
end

function updateEquipment(arg_87_0, arg_87_1, arg_87_2)
	arg_87_2 = arg_87_2 or {}

	assert(arg_87_1, "equipmentVo can not be nil.")

	local var_87_0 = EquipmentRarity.Rarity2Print(arg_87_1:getConfig("rarity"))

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_87_0, findTF(arg_87_0, "icon_bg"))
	setFrame(findTF(arg_87_0, "icon_bg/frame"), var_87_0)

	local var_87_1 = findTF(arg_87_0, "icon_bg/icon")

	var_0_3(var_87_1, {
		16,
		16,
		16,
		16
	})
	GetImageSpriteFromAtlasAsync("equips/" .. arg_87_1:getConfig("icon"), "", var_87_1)
	setIconStars(arg_87_0, true, arg_87_1:getConfig("rarity"))
	var_0_5(arg_87_0, arg_87_1:getConfig("level") - 1)
	setIconName(arg_87_0, arg_87_1:getConfig("name"), arg_87_2)
	setIconCount(arg_87_0, arg_87_1.count)
	setIconColorful(arg_87_0, arg_87_1:getConfig("rarity") - 1, arg_87_2)
end

function updateItem(arg_88_0, arg_88_1, arg_88_2)
	arg_88_2 = arg_88_2 or {}

	local var_88_0 = ItemRarity.Rarity2Print(arg_88_1:getConfig("rarity"))

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_88_0, findTF(arg_88_0, "icon_bg"))

	local var_88_1

	if arg_88_1:getConfig("type") == 9 then
		var_88_1 = "frame_design"
	end

	setFrame(findTF(arg_88_0, "icon_bg/frame"), var_88_0, var_88_1)

	local var_88_2 = findTF(arg_88_0, "icon_bg/icon")
	local var_88_3 = arg_88_1.icon or arg_88_1:getConfig("icon")

	if arg_88_1:getConfig("type") == Item.LOVE_LETTER_TYPE then
		assert(arg_88_1.extra, "without extra data")

		var_88_3 = "SquareIcon/" .. ShipGroup.getDefaultSkin(arg_88_1.extra).prefab
	end

	GetImageSpriteFromAtlasAsync(var_88_3, "", var_88_2)
	setIconStars(arg_88_0, false)
	setIconName(arg_88_0, arg_88_1:getName(), arg_88_2)
	setIconColorful(arg_88_0, arg_88_1:getConfig("rarity"), arg_88_2)
end

function updateWorldItem(arg_89_0, arg_89_1, arg_89_2)
	arg_89_2 = arg_89_2 or {}

	local var_89_0 = ItemRarity.Rarity2Print(arg_89_1:getConfig("rarity"))

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_89_0, findTF(arg_89_0, "icon_bg"))
	setFrame(findTF(arg_89_0, "icon_bg/frame"), var_89_0)

	local var_89_1 = findTF(arg_89_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync(arg_89_1.icon or arg_89_1:getConfig("icon"), "", var_89_1)
	setIconStars(arg_89_0, false)
	setIconName(arg_89_0, arg_89_1:getConfig("name"), arg_89_2)
	setIconColorful(arg_89_0, arg_89_1:getConfig("rarity"), arg_89_2)
end

function updateWorldCollection(arg_90_0, arg_90_1, arg_90_2)
	arg_90_2 = arg_90_2 or {}

	assert(arg_90_1:getConfigTable(), "world_collection_file_template 和 world_collection_record_template 表中找不到配置: " .. arg_90_1.id)

	local var_90_0 = arg_90_1:getDropRarity()
	local var_90_1 = ItemRarity.Rarity2Print(var_90_0)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_90_1, findTF(arg_90_0, "icon_bg"))
	setFrame(findTF(arg_90_0, "icon_bg/frame"), var_90_1)

	local var_90_2 = findTF(arg_90_0, "icon_bg/icon")
	local var_90_3 = WorldCollectionProxy.GetCollectionType(arg_90_1.id) == WorldCollectionProxy.WorldCollectionType.FILE and "shoucangguangdie" or "shoucangjiaojuan"

	GetImageSpriteFromAtlasAsync("props/" .. var_90_3, "", var_90_2)
	setIconStars(arg_90_0, false)
	setIconName(arg_90_0, arg_90_1:getName(), arg_90_2)
	setIconColorful(arg_90_0, var_90_0, arg_90_2)
end

function updateWorldBuff(arg_91_0, arg_91_1, arg_91_2)
	arg_91_2 = arg_91_2 or {}

	local var_91_0 = pg.world_SLGbuff_data[arg_91_1]

	assert(var_91_0, "找不到大世界buff配置: " .. arg_91_1)

	local var_91_1 = ItemRarity.Rarity2Print(ItemRarity.Gray)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_91_1, findTF(arg_91_0, "icon_bg"))
	setFrame(findTF(arg_91_0, "icon_bg/frame"), var_91_1)

	local var_91_2 = findTF(arg_91_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("world/buff/" .. var_91_0.icon, "", var_91_2)

	local var_91_3 = arg_91_0:Find("icon_bg/stars")

	if not IsNil(var_91_3) then
		setActive(var_91_3, false)
	end

	local var_91_4 = findTF(arg_91_0, "name")

	if not IsNil(var_91_4) then
		setText(var_91_4, var_91_0.name)
	end

	local var_91_5 = findTF(arg_91_0, "icon_bg/count")

	if not IsNil(var_91_5) then
		SetActive(var_91_5, false)
	end
end

function updateShip(arg_92_0, arg_92_1, arg_92_2)
	arg_92_2 = arg_92_2 or {}

	local var_92_0 = arg_92_1:rarity2bgPrint()
	local var_92_1 = arg_92_1:getPainting()

	if arg_92_2.anonymous then
		var_92_0 = "1"
		var_92_1 = "unknown"
	end

	if arg_92_2.unknown_small then
		var_92_1 = "unknown_small"
	end

	local var_92_2 = findTF(arg_92_0, "icon_bg/new")

	if var_92_2 then
		if arg_92_2.isSkin then
			setActive(var_92_2, not arg_92_2.isTimeLimit and arg_92_2.isNew)
		else
			setActive(var_92_2, arg_92_1.virgin)
		end
	end

	local var_92_3 = findTF(arg_92_0, "icon_bg/timelimit")

	if var_92_3 then
		setActive(var_92_3, arg_92_2.isTimeLimit)
	end

	local var_92_4 = findTF(arg_92_0, "icon_bg")

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. (arg_92_2.isSkin and "_skin" or var_92_0), var_92_4)

	local var_92_5 = findTF(arg_92_0, "icon_bg/frame")
	local var_92_6

	if arg_92_1.isNpc then
		var_92_6 = "frame_npc"
	elseif arg_92_1:ShowPropose() then
		var_92_6 = "frame_prop"

		if arg_92_1:isMetaShip() then
			var_92_6 = var_92_6 .. "_meta"
		end
	elseif arg_92_2.isSkin then
		var_92_6 = "frame_skin"
	end

	setFrame(var_92_5, var_92_0, var_92_6)

	if arg_92_2.gray then
		setGray(var_92_4, true, true)
	end

	local var_92_7 = findTF(arg_92_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync((arg_92_2.Q and "QIcon/" or "SquareIcon/") .. var_92_1, "", var_92_7)

	local var_92_8 = findTF(arg_92_0, "icon_bg/lv")

	if var_92_8 then
		setActive(var_92_8, not arg_92_1.isNpc)

		if not arg_92_1.isNpc then
			local var_92_9 = findTF(var_92_8, "Text")

			if var_92_9 and arg_92_1.level then
				setText(var_92_9, arg_92_1.level)
			end
		end
	end

	local var_92_10 = findTF(arg_92_0, "ship_type")

	if var_92_10 then
		setActive(var_92_10, true)
		setImageSprite(var_92_10, GetSpriteFromAtlas("shiptype", shipType2print(arg_92_1:getShipType())))
	end

	local var_92_11 = var_92_4:Find("npc")

	if not IsNil(var_92_11) then
		if var_92_2 and go(var_92_2).activeSelf then
			setActive(var_92_11, false)
		else
			setActive(var_92_11, arg_92_1:isActivityNpc())
		end
	end

	local var_92_12 = arg_92_0:Find("group_locked")

	if var_92_12 then
		setActive(var_92_12, not arg_92_2.isSkin and not getProxy(CollectionProxy):getShipGroup(arg_92_1.groupId))
	end

	setIconStars(arg_92_0, arg_92_2.initStar, arg_92_1:getStar())
	setIconName(arg_92_0, arg_92_2.isSkin and arg_92_1:GetSkinConfig().name or arg_92_1:getName(), arg_92_2)
	setIconColorful(arg_92_0, arg_92_2.isSkin and ItemRarity.Gold or arg_92_1:getRarity() - 1, arg_92_2)
end

function updateCommander(arg_93_0, arg_93_1, arg_93_2)
	arg_93_2 = arg_93_2 or {}

	local var_93_0 = arg_93_1:getDropRarity()
	local var_93_1 = ShipRarity.Rarity2Print(var_93_0)
	local var_93_2 = arg_93_1:getConfig("painting")

	if arg_93_2.anonymous then
		var_93_1 = 1
		var_93_2 = "unknown"
	end

	local var_93_3 = findTF(arg_93_0, "icon_bg")

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. (arg_93_2.isSkin and "-skin" or var_93_1), var_93_3)

	local var_93_4 = findTF(arg_93_0, "icon_bg/frame")

	setFrame(var_93_4, var_93_1)

	if arg_93_2.gray then
		setGray(var_93_3, true, true)
	end

	local var_93_5 = findTF(arg_93_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("CommanderIcon/" .. var_93_2, "", var_93_5)
	setIconStars(arg_93_0, arg_93_2.initStar, 0)
	setIconName(arg_93_0, arg_93_1:getName(), arg_93_2)
end

function updateStrategy(arg_94_0, arg_94_1, arg_94_2)
	arg_94_2 = arg_94_2 or {}

	local var_94_0 = ItemRarity.Rarity2Print(ItemRarity.Gray)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_94_0, findTF(arg_94_0, "icon_bg"))
	setFrame(findTF(arg_94_0, "icon_bg/frame"), var_94_0)

	local var_94_1 = findTF(arg_94_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync((arg_94_1.isWorldBuff and "world/buff/" or "strategyicon/") .. arg_94_1:getIcon(), "", var_94_1)
	setIconStars(arg_94_0, false)
	setIconName(arg_94_0, arg_94_1:getName(), arg_94_2)
	setIconColorful(arg_94_0, ItemRarity.Gray, arg_94_2)
end

function updateFurniture(arg_95_0, arg_95_1, arg_95_2)
	arg_95_2 = arg_95_2 or {}

	local var_95_0 = arg_95_1:getDropRarity()
	local var_95_1 = ItemRarity.Rarity2Print(var_95_0)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_95_1, findTF(arg_95_0, "icon_bg"))
	setFrame(findTF(arg_95_0, "icon_bg/frame"), var_95_1)

	local var_95_2 = findTF(arg_95_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("furnitureicon/" .. arg_95_1:getIcon(), "", var_95_2)
	setIconStars(arg_95_0, false)
	setIconName(arg_95_0, arg_95_1:getName(), arg_95_2)
	setIconColorful(arg_95_0, var_95_0, arg_95_2)
end

function updateSpWeapon(arg_96_0, arg_96_1, arg_96_2)
	arg_96_2 = arg_96_2 or {}

	assert(arg_96_1, "spWeaponVO can not be nil.")
	assert(isa(arg_96_1, SpWeapon), "spWeaponVO is not Equipment.")

	local var_96_0 = ItemRarity.Rarity2Print(arg_96_1:GetRarity())

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_96_0, findTF(arg_96_0, "icon_bg"))
	setFrame(findTF(arg_96_0, "icon_bg/frame"), var_96_0)

	local var_96_1 = findTF(arg_96_0, "icon_bg/icon")

	var_0_3(var_96_1, {
		16,
		16,
		16,
		16
	})
	GetImageSpriteFromAtlasAsync(arg_96_1:GetIconPath(), "", var_96_1)
	setIconStars(arg_96_0, true, arg_96_1:GetRarity())
	var_0_5(arg_96_0, arg_96_1:GetLevel() - 1)
	setIconName(arg_96_0, arg_96_1:GetName(), arg_96_2)
	setIconCount(arg_96_0, arg_96_1.count)
	setIconColorful(arg_96_0, arg_96_1:GetRarity(), arg_96_2)
end

function UpdateSpWeaponSlot(arg_97_0, arg_97_1, arg_97_2)
	local var_97_0 = ItemRarity.Rarity2Print(arg_97_1:GetRarity())

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_97_0, findTF(arg_97_0, "Icon/Mask/icon_bg"))

	local var_97_1 = findTF(arg_97_0, "Icon/Mask/icon_bg/icon")

	arg_97_2 = arg_97_2 or {
		16,
		16,
		16,
		16
	}

	var_0_3(var_97_1, arg_97_2)
	GetImageSpriteFromAtlasAsync(arg_97_1:GetIconPath(), "", var_97_1)

	local var_97_2 = arg_97_1:GetLevel() - 1
	local var_97_3 = findTF(arg_97_0, "Icon/LV")

	setActive(var_97_3, var_97_2 > 0)
	setText(findTF(var_97_3, "Text"), var_97_2)
end

function updateDorm3dFurniture(arg_98_0, arg_98_1, arg_98_2)
	arg_98_2 = arg_98_2 or {}

	local var_98_0 = arg_98_1:getDropRarity()
	local var_98_1 = ItemRarity.Rarity2Print(var_98_0)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_98_1, findTF(arg_98_0, "icon_bg"))
	setFrame(findTF(arg_98_0, "icon_bg/frame"), var_98_1)

	local var_98_2 = findTF(arg_98_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("furnitureicon/" .. arg_98_1:getIcon(), "", var_98_2)
	setIconStars(arg_98_0, false)
	setIconName(arg_98_0, arg_98_1:getName(), arg_98_2)
	setIconColorful(arg_98_0, var_98_0, arg_98_2)
end

function updateDorm3dGift(arg_99_0, arg_99_1, arg_99_2)
	arg_99_2 = arg_99_2 or {}

	local var_99_0 = arg_99_1:getDropRarity()
	local var_99_1 = ItemRarity.Rarity2Print(var_99_0) or ItemRarity.Gray

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_99_1, arg_99_0:Find("icon_bg"))
	setFrame(arg_99_0:Find("icon_bg/frame"), var_99_1)

	local var_99_2 = arg_99_0:Find("icon_bg/icon")

	GetImageSpriteFromAtlasAsync("furnitureicon/" .. arg_99_1:getIcon(), "", var_99_2)
	setIconStars(arg_99_0, false)
	setIconName(arg_99_0, arg_99_1:getName(), arg_99_2)
	setIconColorful(arg_99_0, var_99_0, arg_99_2)
end

function updateDorm3dSkin(arg_100_0, arg_100_1, arg_100_2)
	arg_100_2 = arg_100_2 or {}

	local var_100_0 = arg_100_1:getDropRarity()
	local var_100_1 = ItemRarity.Rarity2Print(var_100_0) or ItemRarity.Gray

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_100_1, arg_100_0:Find("icon_bg"))
	setFrame(arg_100_0:Find("icon_bg/frame"), var_100_1)

	local var_100_2 = arg_100_0:Find("icon_bg/icon")

	setIconStars(arg_100_0, false)
	setIconName(arg_100_0, arg_100_1:getName(), arg_100_2)
	setIconColorful(arg_100_0, var_100_0, arg_100_2)
end

function updateDorm3dIcon(arg_101_0, arg_101_1)
	local var_101_0 = arg_101_1:getConfig("rarity")

	GetImageSpriteFromAtlasAsync("weaponframes", "dorm3d_" .. ItemRarity.Rarity2Print(var_101_0), arg_101_0)

	local var_101_1 = arg_101_0:Find("icon")

	setText(arg_101_0:Find("count/Text"), "x" .. arg_101_1.count)
	setText(arg_101_0:Find("name/Text"), arg_101_1:getName())
end

local var_0_6

function findCullAndClipWorldRect(arg_102_0)
	if #arg_102_0 == 0 then
		return false
	end

	local var_102_0 = arg_102_0[1].canvasRect

	for iter_102_0 = 1, #arg_102_0 do
		var_102_0 = rectIntersect(var_102_0, arg_102_0[iter_102_0].canvasRect)
	end

	if var_102_0.width <= 0 or var_102_0.height <= 0 then
		return false
	end

	var_0_6 = var_0_6 or GameObject.Find("UICamera/Canvas").transform

	local var_102_1 = var_0_6:TransformPoint(Vector3(var_102_0.x, var_102_0.y, 0))
	local var_102_2 = var_0_6:TransformPoint(Vector3(var_102_0.x + var_102_0.width, var_102_0.y + var_102_0.height, 0))

	return true, Vector4(var_102_1.x, var_102_1.y, var_102_2.x, var_102_2.y)
end

function rectIntersect(arg_103_0, arg_103_1)
	local var_103_0 = math.max(arg_103_0.x, arg_103_1.x)
	local var_103_1 = math.min(arg_103_0.x + arg_103_0.width, arg_103_1.x + arg_103_1.width)
	local var_103_2 = math.max(arg_103_0.y, arg_103_1.y)
	local var_103_3 = math.min(arg_103_0.y + arg_103_0.height, arg_103_1.y + arg_103_1.height)

	if var_103_0 <= var_103_1 and var_103_2 <= var_103_3 then
		return var_0_0.Rect.New(var_103_0, var_103_2, var_103_1 - var_103_0, var_103_3 - var_103_2)
	end

	return var_0_0.Rect.New(0, 0, 0, 0)
end

function getDropInfo(arg_104_0)
	local var_104_0 = {}

	for iter_104_0, iter_104_1 in ipairs(arg_104_0) do
		local var_104_1 = Drop.Create(iter_104_1)

		var_104_1.count = var_104_1.count or 1

		if var_104_1.type == DROP_TYPE_EMOJI then
			table.insert(var_104_0, var_104_1:getName())
		else
			table.insert(var_104_0, var_104_1:getName() .. "x" .. var_104_1.count)
		end
	end

	return table.concat(var_104_0, "、")
end

function updateDrop(arg_105_0, arg_105_1, arg_105_2)
	Drop.Change(arg_105_1)

	arg_105_2 = arg_105_2 or {}

	local var_105_0 = {
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
	local var_105_1

	for iter_105_0, iter_105_1 in ipairs(var_105_0) do
		local var_105_2 = arg_105_0:Find(iter_105_1[1])

		if arg_105_1.type ~= iter_105_1[2] and not IsNil(var_105_2) then
			setActive(var_105_2, false)
		end
	end

	arg_105_0:Find("icon_bg/frame"):GetComponent(typeof(Image)).enabled = true

	setIconColorful(arg_105_0, arg_105_1:getDropRarity(), arg_105_2, {
		[ItemRarity.Gold] = {
			name = "Item_duang5",
			active = function(arg_106_0, arg_106_1)
				return arg_106_1.fromAwardLayer and arg_106_0 >= ItemRarity.Gold
			end
		}
	})
	var_0_3(findTF(arg_105_0, "icon_bg/icon"), {
		2,
		2,
		2,
		2
	})
	arg_105_1:UpdateDropTpl(arg_105_0, arg_105_2)
	setIconCount(arg_105_0, arg_105_2.count or arg_105_1:getCount())
end

function updateBuff(arg_107_0, arg_107_1, arg_107_2)
	arg_107_2 = arg_107_2 or {}

	local var_107_0 = ItemRarity.Rarity2Print(ItemRarity.Gray)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_107_0, findTF(arg_107_0, "icon_bg"))

	local var_107_1 = pg.benefit_buff_template[arg_107_1]

	setFrame(findTF(arg_107_0, "icon_bg/frame"), var_107_0)
	setText(findTF(arg_107_0, "icon_bg/count"), 1)

	local var_107_2 = findTF(arg_107_0, "icon_bg/icon")
	local var_107_3 = var_107_1.icon

	GetImageSpriteFromAtlasAsync(var_107_3, "", var_107_2)
	setIconStars(arg_107_0, false)
	setIconName(arg_107_0, var_107_1.name, arg_107_2)
	setIconColorful(arg_107_0, ItemRarity.Gold, arg_107_2)
end

function updateAttire(arg_108_0, arg_108_1, arg_108_2, arg_108_3)
	local var_108_0 = 4

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_108_0, findTF(arg_108_0, "icon_bg"))
	setFrame(findTF(arg_108_0, "icon_bg/frame"), var_108_0)

	local var_108_1 = findTF(arg_108_0, "icon_bg/icon")
	local var_108_2

	if arg_108_1 == AttireConst.TYPE_CHAT_FRAME then
		var_108_2 = "chat_frame"
	elseif arg_108_1 == AttireConst.TYPE_ICON_FRAME then
		var_108_2 = "icon_frame"
	end

	GetImageSpriteFromAtlasAsync("Props/" .. var_108_2, "", var_108_1)
	setIconName(arg_108_0, arg_108_2.name, arg_108_3)
end

function updateEmoji(arg_109_0, arg_109_1, arg_109_2)
	local var_109_0 = findTF(arg_109_0, "icon_bg/icon")
	local var_109_1 = "icon_emoji"

	GetImageSpriteFromAtlasAsync("Props/" .. var_109_1, "", var_109_0)

	local var_109_2 = 4

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_109_2, findTF(arg_109_0, "icon_bg"))
	setFrame(findTF(arg_109_0, "icon_bg/frame"), var_109_2)
	setIconName(arg_109_0, arg_109_1.name, arg_109_2)
end

function updateEquipmentSkin(arg_110_0, arg_110_1, arg_110_2)
	arg_110_2 = arg_110_2 or {}

	local var_110_0 = EquipmentRarity.Rarity2Print(arg_110_1.rarity)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_110_0, findTF(arg_110_0, "icon_bg"))
	setFrame(findTF(arg_110_0, "icon_bg/frame"), var_110_0, "frame_skin")

	local var_110_1 = findTF(arg_110_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("equips/" .. arg_110_1.icon, "", var_110_1)
	setIconStars(arg_110_0, false)
	setIconName(arg_110_0, arg_110_1.name, arg_110_2)
	setIconCount(arg_110_0, arg_110_1.count)
	setIconColorful(arg_110_0, arg_110_1.rarity - 1, arg_110_2)
end

function NoPosMsgBox(arg_111_0, arg_111_1, arg_111_2, arg_111_3)
	local var_111_0
	local var_111_1 = {}

	if arg_111_1 then
		table.insert(var_111_1, {
			text = "text_noPos_clear",
			atuoClose = true,
			onCallback = arg_111_1
		})
	end

	if arg_111_2 then
		table.insert(var_111_1, {
			text = "text_noPos_buy",
			atuoClose = true,
			onCallback = arg_111_2
		})
	end

	if arg_111_3 then
		table.insert(var_111_1, {
			text = "text_noPos_intensify",
			atuoClose = true,
			onCallback = arg_111_3
		})
	end

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		hideYes = true,
		hideNo = true,
		content = arg_111_0,
		custom = var_111_1,
		weight = LayerWeightConst.TOP_LAYER
	})
end

function openDestroyEquip()
	if pg.m02:hasMediator(EquipmentMediator.__cname) then
		local var_112_0 = getProxy(ContextProxy):getCurrentContext():getContextByMediator(EquipmentMediator)

		if var_112_0 and var_112_0.data.shipId then
			pg.m02:sendNotification(GAME.REMOVE_LAYERS, {
				context = var_112_0
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
		local var_113_0 = getProxy(ContextProxy):getCurrentContext():getContextByMediator(EquipmentMediator)

		if var_113_0 and var_113_0.data.shipId then
			pg.m02:sendNotification(GAME.REMOVE_LAYERS, {
				context = var_113_0
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
		onClick = function(arg_116_0, arg_116_1)
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.SHIPINFO, {
				page = 3,
				shipId = arg_116_0.id,
				shipVOs = arg_116_1
			})
		end
	})
end

function GoShoppingMsgBox(arg_117_0, arg_117_1, arg_117_2)
	if arg_117_2 then
		local var_117_0 = ""

		for iter_117_0, iter_117_1 in ipairs(arg_117_2) do
			local var_117_1 = Item.getConfigData(iter_117_1[1])

			var_117_0 = var_117_0 .. i18n(iter_117_1[1] == 59001 and "text_noRes_info_tip" or "text_noRes_info_tip2", var_117_1.name, iter_117_1[2])

			if iter_117_0 < #arg_117_2 then
				var_117_0 = var_117_0 .. i18n("text_noRes_info_tip_link")
			end
		end

		if var_117_0 ~= "" then
			arg_117_0 = arg_117_0 .. "\n" .. i18n("text_noRes_tip", var_117_0)
		end
	end

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		content = arg_117_0,
		weight = LayerWeightConst.SECOND_LAYER,
		onYes = function()
			gotoChargeScene(arg_117_1, arg_117_2)
		end
	})
end

function shoppingBatch(arg_119_0, arg_119_1, arg_119_2, arg_119_3, arg_119_4)
	local var_119_0 = pg.shop_template[arg_119_0]

	assert(var_119_0, "shop_template中找不到商品id：" .. arg_119_0)

	local var_119_1 = getProxy(PlayerProxy):getData()[id2res(var_119_0.resource_type)]
	local var_119_2 = arg_119_1.price or var_119_0.resource_num
	local var_119_3 = math.floor(var_119_1 / var_119_2)

	var_119_3 = var_119_3 <= 0 and 1 or var_119_3
	var_119_3 = arg_119_2 ~= nil and arg_119_2 < var_119_3 and arg_119_2 or var_119_3

	local var_119_4 = true
	local var_119_5 = 1

	if var_119_0 ~= nil and arg_119_1.id then
		print(var_119_3 * var_119_0.num, "--", var_119_3)
		assert(Item.getConfigData(arg_119_1.id), "item config should be existence")

		local var_119_6 = Item.New({
			id = arg_119_1.id
		}):getConfig("name")

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			needCounter = true,
			type = MSGBOX_TYPE_SINGLE_ITEM,
			drop = {
				type = DROP_TYPE_ITEM,
				id = arg_119_1.id
			},
			addNum = var_119_0.num,
			maxNum = var_119_3 * var_119_0.num,
			defaultNum = var_119_0.num,
			numUpdate = function(arg_120_0, arg_120_1)
				var_119_5 = math.floor(arg_120_1 / var_119_0.num)

				local var_120_0 = var_119_5 * var_119_2

				if var_120_0 > var_119_1 then
					setText(arg_120_0, i18n(arg_119_3, var_120_0, arg_120_1, COLOR_RED, var_119_6))

					var_119_4 = false
				else
					setText(arg_120_0, i18n(arg_119_3, var_120_0, arg_120_1, COLOR_GREEN, var_119_6))

					var_119_4 = true
				end
			end,
			onYes = function()
				if var_119_4 then
					pg.m02:sendNotification(GAME.SHOPPING, {
						id = arg_119_0,
						count = var_119_5
					})
				elseif arg_119_4 then
					pg.TipsMgr.GetInstance():ShowTips(i18n(arg_119_4))
				else
					pg.TipsMgr.GetInstance():ShowTips(i18n("main_playerInfoLayer_error_changeNameNoGem"))
				end
			end
		})
	end
end

function gotoChargeScene(arg_122_0, arg_122_1)
	local var_122_0 = getProxy(ContextProxy)
	local var_122_1 = getProxy(ContextProxy):getCurrentContext()

	if instanceof(var_122_1.mediator, ChargeMediator) then
		var_122_1.mediator:getViewComponent():switchSubViewByTogger(arg_122_0)
	else
		pg.m02:sendNotification(GAME.GO_SCENE, SCENE.CHARGE, {
			wrap = arg_122_0 or ChargeScene.TYPE_ITEM,
			noRes = arg_122_1
		})
	end
end

function clearDrop(arg_123_0)
	local var_123_0 = findTF(arg_123_0, "icon_bg")
	local var_123_1 = findTF(arg_123_0, "icon_bg/frame")
	local var_123_2 = findTF(arg_123_0, "icon_bg/icon")
	local var_123_3 = findTF(arg_123_0, "icon_bg/icon/icon")

	clearImageSprite(var_123_0)
	clearImageSprite(var_123_1)
	clearImageSprite(var_123_2)

	if var_123_3 then
		clearImageSprite(var_123_3)
	end
end

local var_0_7 = {
	red = Color.New(1, 0.25, 0.25),
	blue = Color.New(0.11, 0.55, 0.64),
	yellow = Color.New(0.92, 0.52, 0)
}

function updateSkill(arg_124_0, arg_124_1, arg_124_2, arg_124_3)
	local var_124_0 = findTF(arg_124_0, "skill")
	local var_124_1 = findTF(arg_124_0, "lock")
	local var_124_2 = findTF(arg_124_0, "unknown")

	if arg_124_1 then
		setActive(var_124_0, true)
		setActive(var_124_2, false)
		setActive(var_124_1, not arg_124_2)
		LoadImageSpriteAsync("skillicon/" .. arg_124_1.icon, findTF(var_124_0, "icon"))

		local var_124_3 = arg_124_1.color or "blue"

		setText(findTF(var_124_0, "name"), shortenString(getSkillName(arg_124_1.id), arg_124_3 or 8))

		local var_124_4 = findTF(var_124_0, "level")

		setText(var_124_4, "LEVEL: " .. (arg_124_2 and arg_124_2.level or "??"))
		setTextColor(var_124_4, var_0_7[var_124_3])
	else
		setActive(var_124_0, false)
		setActive(var_124_2, true)
		setActive(var_124_1, false)
	end
end

local var_0_8 = true

function onBackButton(arg_125_0, arg_125_1, arg_125_2, arg_125_3)
	local var_125_0 = GetOrAddComponent(arg_125_1, "UILongPressTrigger")

	assert(arg_125_2, "callback should exist")

	var_125_0.longPressThreshold = defaultValue(arg_125_3, 1)

	local function var_125_1(arg_126_0)
		return function()
			if var_0_8 then
				pg.CriMgr.GetInstance():PlaySoundEffect_V3(SOUND_BACK)
			end

			local var_127_0, var_127_1 = arg_125_2()

			if var_127_0 then
				arg_126_0(var_127_1)
			end
		end
	end

	local var_125_2 = var_125_0.onReleased

	pg.DelegateInfo.Add(arg_125_0, var_125_2)
	var_125_2:RemoveAllListeners()
	var_125_2:AddListener(var_125_1(function(arg_128_0)
		arg_128_0:emit(BaseUI.ON_BACK)
	end))

	local var_125_3 = var_125_0.onLongPressed

	pg.DelegateInfo.Add(arg_125_0, var_125_3)
	var_125_3:RemoveAllListeners()
	var_125_3:AddListener(var_125_1(function(arg_129_0)
		arg_129_0:emit(BaseUI.ON_HOME)
	end))
end

function GetZeroTime()
	return pg.TimeMgr.GetInstance():GetNextTime(0, 0, 0)
end

function GetHalfHour()
	return pg.TimeMgr.GetInstance():GetNextTime(0, 0, 0, 1800)
end

function GetNextHour(arg_132_0)
	local var_132_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_132_1, var_132_2 = pg.TimeMgr.GetInstance():parseTimeFrom(var_132_0)

	return var_132_1 * 86400 + (var_132_2 + arg_132_0) * 3600
end

function GetPerceptualSize(arg_133_0)
	local function var_133_0(arg_134_0)
		if not arg_134_0 then
			return 0, 1
		elseif arg_134_0 > 240 then
			return 4, 1
		elseif arg_134_0 > 225 then
			return 3, 1
		elseif arg_134_0 > 192 then
			return 2, 1
		elseif arg_134_0 < 126 then
			return 1, 0.5
		else
			return 1, 1
		end
	end

	if type(arg_133_0) == "number" then
		return var_133_0(arg_133_0)
	end

	local var_133_1 = 1
	local var_133_2 = 0
	local var_133_3 = 0
	local var_133_4 = #arg_133_0

	while var_133_1 <= var_133_4 do
		local var_133_5 = string.byte(arg_133_0, var_133_1)
		local var_133_6, var_133_7 = var_133_0(var_133_5)

		var_133_1 = var_133_1 + var_133_6
		var_133_2 = var_133_2 + var_133_7
	end

	return var_133_2
end

function shortenString(arg_135_0, arg_135_1)
	local var_135_0 = 1
	local var_135_1 = 0
	local var_135_2 = 0
	local var_135_3 = #arg_135_0

	while var_135_0 <= var_135_3 do
		local var_135_4 = string.byte(arg_135_0, var_135_0)
		local var_135_5, var_135_6 = GetPerceptualSize(var_135_4)

		var_135_0 = var_135_0 + var_135_5
		var_135_1 = var_135_1 + var_135_6

		if arg_135_1 <= math.ceil(var_135_1) then
			var_135_2 = var_135_0

			break
		end
	end

	if var_135_2 == 0 or var_135_3 < var_135_2 then
		return arg_135_0
	end

	return string.sub(arg_135_0, 1, var_135_2 - 1) .. ".."
end

function shouldShortenString(arg_136_0, arg_136_1)
	local var_136_0 = 1
	local var_136_1 = 0
	local var_136_2 = 0
	local var_136_3 = #arg_136_0

	while var_136_0 <= var_136_3 do
		local var_136_4 = string.byte(arg_136_0, var_136_0)
		local var_136_5, var_136_6 = GetPerceptualSize(var_136_4)

		var_136_0 = var_136_0 + var_136_5
		var_136_1 = var_136_1 + var_136_6

		if arg_136_1 <= math.ceil(var_136_1) then
			var_136_2 = var_136_0

			break
		end
	end

	if var_136_2 == 0 or var_136_3 < var_136_2 then
		return false
	end

	return true
end

function nameValidityCheck(arg_137_0, arg_137_1, arg_137_2, arg_137_3)
	local var_137_0 = true
	local var_137_1, var_137_2 = utf8_to_unicode(arg_137_0)
	local var_137_3 = filterEgyUnicode(filterSpecChars(arg_137_0))
	local var_137_4 = wordVer(arg_137_0)

	if not checkSpaceValid(arg_137_0) then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_137_3[1]))

		var_137_0 = false
	elseif var_137_4 > 0 or var_137_3 ~= arg_137_0 then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_137_3[4]))

		var_137_0 = false
	elseif var_137_2 < arg_137_1 then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_137_3[2]))

		var_137_0 = false
	elseif arg_137_2 < var_137_2 then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_137_3[3]))

		var_137_0 = false
	end

	return var_137_0
end

function checkSpaceValid(arg_138_0)
	if PLATFORM_CODE == PLATFORM_US then
		return true
	end

	local var_138_0 = string.gsub(arg_138_0, " ", "")

	return arg_138_0 == string.gsub(var_138_0, "　", "")
end

function filterSpecChars(arg_139_0)
	local var_139_0 = {}
	local var_139_1 = 0
	local var_139_2 = 0
	local var_139_3 = 0
	local var_139_4 = 1

	while var_139_4 <= #arg_139_0 do
		local var_139_5 = string.byte(arg_139_0, var_139_4)

		if not var_139_5 then
			break
		end

		if var_139_5 >= 48 and var_139_5 <= 57 or var_139_5 >= 65 and var_139_5 <= 90 or var_139_5 == 95 or var_139_5 >= 97 and var_139_5 <= 122 then
			table.insert(var_139_0, string.char(var_139_5))
		elseif var_139_5 >= 228 and var_139_5 <= 233 then
			local var_139_6 = string.byte(arg_139_0, var_139_4 + 1)
			local var_139_7 = string.byte(arg_139_0, var_139_4 + 2)

			if var_139_6 and var_139_7 and var_139_6 >= 128 and var_139_6 <= 191 and var_139_7 >= 128 and var_139_7 <= 191 then
				var_139_4 = var_139_4 + 2

				table.insert(var_139_0, string.char(var_139_5, var_139_6, var_139_7))

				var_139_1 = var_139_1 + 1
			end
		elseif var_139_5 == 45 or var_139_5 == 40 or var_139_5 == 41 then
			table.insert(var_139_0, string.char(var_139_5))
		elseif var_139_5 == 194 then
			local var_139_8 = string.byte(arg_139_0, var_139_4 + 1)

			if var_139_8 == 183 then
				var_139_4 = var_139_4 + 1

				table.insert(var_139_0, string.char(var_139_5, var_139_8))

				var_139_1 = var_139_1 + 1
			end
		elseif var_139_5 == 239 then
			local var_139_9 = string.byte(arg_139_0, var_139_4 + 1)
			local var_139_10 = string.byte(arg_139_0, var_139_4 + 2)

			if var_139_9 == 188 and (var_139_10 == 136 or var_139_10 == 137) then
				var_139_4 = var_139_4 + 2

				table.insert(var_139_0, string.char(var_139_5, var_139_9, var_139_10))

				var_139_1 = var_139_1 + 1
			end
		elseif var_139_5 == 206 or var_139_5 == 207 then
			local var_139_11 = string.byte(arg_139_0, var_139_4 + 1)

			if var_139_5 == 206 and var_139_11 >= 177 or var_139_5 == 207 and var_139_11 <= 134 then
				var_139_4 = var_139_4 + 1

				table.insert(var_139_0, string.char(var_139_5, var_139_11))

				var_139_1 = var_139_1 + 1
			end
		elseif var_139_5 == 227 and PLATFORM_CODE == PLATFORM_JP then
			local var_139_12 = string.byte(arg_139_0, var_139_4 + 1)
			local var_139_13 = string.byte(arg_139_0, var_139_4 + 2)

			if var_139_12 and var_139_13 and var_139_12 > 128 and var_139_12 <= 191 and var_139_13 >= 128 and var_139_13 <= 191 then
				var_139_4 = var_139_4 + 2

				table.insert(var_139_0, string.char(var_139_5, var_139_12, var_139_13))

				var_139_2 = var_139_2 + 1
			end
		elseif var_139_5 >= 224 and PLATFORM_CODE == PLATFORM_KR then
			local var_139_14 = string.byte(arg_139_0, var_139_4 + 1)
			local var_139_15 = string.byte(arg_139_0, var_139_4 + 2)

			if var_139_14 and var_139_15 and var_139_14 >= 128 and var_139_14 <= 191 and var_139_15 >= 128 and var_139_15 <= 191 then
				var_139_4 = var_139_4 + 2

				table.insert(var_139_0, string.char(var_139_5, var_139_14, var_139_15))

				var_139_3 = var_139_3 + 1
			end
		elseif PLATFORM_CODE == PLATFORM_US then
			if var_139_4 ~= 1 and var_139_5 == 32 and string.byte(arg_139_0, var_139_4 + 1) ~= 32 then
				table.insert(var_139_0, string.char(var_139_5))
			end

			if var_139_5 >= 192 and var_139_5 <= 223 then
				local var_139_16 = string.byte(arg_139_0, var_139_4 + 1)

				var_139_4 = var_139_4 + 1

				if var_139_5 == 194 and var_139_16 and var_139_16 >= 128 then
					table.insert(var_139_0, string.char(var_139_5, var_139_16))
				elseif var_139_5 == 195 and var_139_16 and var_139_16 <= 191 then
					table.insert(var_139_0, string.char(var_139_5, var_139_16))
				end
			end
		end

		var_139_4 = var_139_4 + 1
	end

	return table.concat(var_139_0), var_139_1 + var_139_2 + var_139_3
end

function filterEgyUnicode(arg_140_0)
	arg_140_0 = string.gsub(arg_140_0, "\xF0\x93[\x80-\x8F][\x80-\xBF]", "")
	arg_140_0 = string.gsub(arg_140_0, "\xF0\x93\x90[\x80-\xAF]", "")

	return arg_140_0
end

function shiftPanel(arg_141_0, arg_141_1, arg_141_2, arg_141_3, arg_141_4, arg_141_5, arg_141_6, arg_141_7, arg_141_8)
	arg_141_3 = arg_141_3 or 0.2

	if arg_141_5 then
		LeanTween.cancel(go(arg_141_0))
	end

	local var_141_0 = rtf(arg_141_0)

	arg_141_1 = arg_141_1 or var_141_0.anchoredPosition.x
	arg_141_2 = arg_141_2 or var_141_0.anchoredPosition.y

	local var_141_1 = LeanTween.move(var_141_0, Vector3(arg_141_1, arg_141_2, 0), arg_141_3)

	arg_141_7 = arg_141_7 or LeanTweenType.easeInOutSine

	var_141_1:setEase(arg_141_7)

	if arg_141_4 then
		var_141_1:setDelay(arg_141_4)
	end

	if arg_141_6 then
		GetOrAddComponent(arg_141_0, "CanvasGroup").blocksRaycasts = false
	end

	var_141_1:setOnComplete(System.Action(function()
		if arg_141_8 then
			arg_141_8()
		end

		if arg_141_6 then
			GetOrAddComponent(arg_141_0, "CanvasGroup").blocksRaycasts = true
		end
	end))

	return var_141_1
end

function TweenValue(arg_143_0, arg_143_1, arg_143_2, arg_143_3, arg_143_4, arg_143_5, arg_143_6, arg_143_7)
	local var_143_0 = LeanTween.value(go(arg_143_0), arg_143_1, arg_143_2, arg_143_3):setOnUpdate(System.Action_float(function(arg_144_0)
		if arg_143_5 then
			arg_143_5(arg_144_0)
		end
	end)):setOnComplete(System.Action(function()
		if arg_143_6 then
			arg_143_6()
		end
	end)):setDelay(arg_143_4 or 0)

	if arg_143_7 and arg_143_7 > 0 then
		var_143_0:setRepeat(arg_143_7)
	end

	return var_143_0
end

function rotateAni(arg_146_0, arg_146_1, arg_146_2)
	return LeanTween.rotate(rtf(arg_146_0), 360 * arg_146_1, arg_146_2):setLoopClamp()
end

function blinkAni(arg_147_0, arg_147_1, arg_147_2, arg_147_3)
	return LeanTween.alpha(rtf(arg_147_0), arg_147_3 or 0, arg_147_1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong(arg_147_2 or 0)
end

function scaleAni(arg_148_0, arg_148_1, arg_148_2, arg_148_3)
	return LeanTween.scale(rtf(arg_148_0), arg_148_3 or 0, arg_148_1):setLoopPingPong(arg_148_2 or 0)
end

function floatAni(arg_149_0, arg_149_1, arg_149_2, arg_149_3)
	local var_149_0 = arg_149_0.localPosition.y + arg_149_1

	return LeanTween.moveY(rtf(arg_149_0), var_149_0, arg_149_2):setLoopPingPong(arg_149_3 or 0)
end

local var_0_9 = tostring

function tostring(arg_150_0)
	if arg_150_0 == nil then
		return "nil"
	end

	local var_150_0 = var_0_9(arg_150_0)

	if var_150_0 == nil then
		if type(arg_150_0) == "table" then
			return "{}"
		end

		return " ~nil"
	end

	return var_150_0
end

function wordVer(arg_151_0, arg_151_1)
	if arg_151_0.match(arg_151_0, ChatConst.EmojiCodeMatch) then
		return 0, arg_151_0
	end

	arg_151_1 = arg_151_1 or {}

	local var_151_0 = filterEgyUnicode(arg_151_0)

	if #var_151_0 ~= #arg_151_0 then
		if arg_151_1.isReplace then
			arg_151_0 = var_151_0
		else
			return 1
		end
	end

	local var_151_1 = wordSplit(arg_151_0)
	local var_151_2 = pg.word_template
	local var_151_3 = pg.word_legal_template

	arg_151_1.isReplace = arg_151_1.isReplace or false
	arg_151_1.replaceWord = arg_151_1.replaceWord or "*"

	local var_151_4 = #var_151_1
	local var_151_5 = 1
	local var_151_6 = ""
	local var_151_7 = 0

	while var_151_5 <= var_151_4 do
		local var_151_8, var_151_9, var_151_10 = wordLegalMatch(var_151_1, var_151_3, var_151_5)

		if var_151_8 then
			var_151_5 = var_151_9
			var_151_6 = var_151_6 .. var_151_10
		else
			local var_151_11, var_151_12, var_151_13 = wordVerMatch(var_151_1, var_151_2, arg_151_1, var_151_5, "", false, var_151_5, "")

			if var_151_11 then
				var_151_5 = var_151_12
				var_151_7 = var_151_7 + 1

				if arg_151_1.isReplace then
					var_151_6 = var_151_6 .. var_151_13
				end
			else
				if arg_151_1.isReplace then
					var_151_6 = var_151_6 .. var_151_1[var_151_5]
				end

				var_151_5 = var_151_5 + 1
			end
		end
	end

	if arg_151_1.isReplace then
		return var_151_7, var_151_6
	else
		return var_151_7
	end
end

function wordLegalMatch(arg_152_0, arg_152_1, arg_152_2, arg_152_3, arg_152_4)
	if arg_152_2 > #arg_152_0 then
		return arg_152_3, arg_152_2, arg_152_4
	end

	local var_152_0 = arg_152_0[arg_152_2]
	local var_152_1 = arg_152_1[var_152_0]

	arg_152_4 = arg_152_4 == nil and "" or arg_152_4

	if var_152_1 then
		if var_152_1.this then
			return wordLegalMatch(arg_152_0, var_152_1, arg_152_2 + 1, true, arg_152_4 .. var_152_0)
		else
			return wordLegalMatch(arg_152_0, var_152_1, arg_152_2 + 1, false, arg_152_4 .. var_152_0)
		end
	else
		return arg_152_3, arg_152_2, arg_152_4
	end
end

local var_0_10 = string.byte("a")
local var_0_11 = string.byte("z")
local var_0_12 = string.byte("A")
local var_0_13 = string.byte("Z")

local function var_0_14(arg_153_0)
	if not arg_153_0 then
		return arg_153_0
	end

	local var_153_0 = string.byte(arg_153_0)

	if var_153_0 > 128 then
		return
	end

	if var_153_0 >= var_0_10 and var_153_0 <= var_0_11 then
		return string.char(var_153_0 - 32)
	elseif var_153_0 >= var_0_12 and var_153_0 <= var_0_13 then
		return string.char(var_153_0 + 32)
	else
		return arg_153_0
	end
end

function wordVerMatch(arg_154_0, arg_154_1, arg_154_2, arg_154_3, arg_154_4, arg_154_5, arg_154_6, arg_154_7)
	if arg_154_3 > #arg_154_0 then
		return arg_154_5, arg_154_6, arg_154_7
	end

	local var_154_0 = arg_154_0[arg_154_3]
	local var_154_1 = arg_154_1[var_154_0]

	if var_154_1 then
		local var_154_2, var_154_3, var_154_4 = wordVerMatch(arg_154_0, var_154_1, arg_154_2, arg_154_3 + 1, arg_154_2.isReplace and arg_154_4 .. arg_154_2.replaceWord or arg_154_4, var_154_1.this or arg_154_5, var_154_1.this and arg_154_3 + 1 or arg_154_6, var_154_1.this and (arg_154_2.isReplace and arg_154_4 .. arg_154_2.replaceWord or arg_154_4) or arg_154_7)

		if var_154_2 then
			return var_154_2, var_154_3, var_154_4
		end
	end

	local var_154_5 = var_0_14(var_154_0)
	local var_154_6 = arg_154_1[var_154_5]

	if var_154_5 ~= var_154_0 and var_154_6 then
		local var_154_7, var_154_8, var_154_9 = wordVerMatch(arg_154_0, var_154_6, arg_154_2, arg_154_3 + 1, arg_154_2.isReplace and arg_154_4 .. arg_154_2.replaceWord or arg_154_4, var_154_6.this or arg_154_5, var_154_6.this and arg_154_3 + 1 or arg_154_6, var_154_6.this and (arg_154_2.isReplace and arg_154_4 .. arg_154_2.replaceWord or arg_154_4) or arg_154_7)

		if var_154_7 then
			return var_154_7, var_154_8, var_154_9
		end
	end

	return arg_154_5, arg_154_6, arg_154_7
end

function wordSplit(arg_155_0)
	local var_155_0 = {}

	for iter_155_0 in arg_155_0.gmatch(arg_155_0, "[\x01-\x7F\xC2-\xF4][\x80-\xBF]*") do
		var_155_0[#var_155_0 + 1] = iter_155_0
	end

	return var_155_0
end

function contentWrap(arg_156_0, arg_156_1, arg_156_2)
	local var_156_0 = LuaHelper.WrapContent(arg_156_0, arg_156_1, arg_156_2)

	return #var_156_0 ~= #arg_156_0, var_156_0
end

function cancelRich(arg_157_0)
	local var_157_0

	for iter_157_0 = 1, 20 do
		local var_157_1

		arg_157_0, var_157_1 = string.gsub(arg_157_0, "<([^>]*)>", "%1")

		if var_157_1 <= 0 then
			break
		end
	end

	return arg_157_0
end

function getSkillConfig(arg_158_0)
	local var_158_0 = require("GameCfg.buff.buff_" .. arg_158_0)

	if not var_158_0 then
		warning("找不到技能配置: " .. arg_158_0)

		return
	end

	local var_158_1 = Clone(var_158_0)

	var_158_1.name = getSkillName(arg_158_0)
	var_158_1.desc = HXSet.hxLan(var_158_1.desc)
	var_158_1.desc_get = HXSet.hxLan(var_158_1.desc_get)

	_.each(var_158_1, function(arg_159_0)
		arg_159_0.desc = HXSet.hxLan(arg_159_0.desc)
	end)

	return var_158_1
end

function getSkillName(arg_160_0)
	local var_160_0 = pg.skill_data_template[arg_160_0] or pg.skill_data_display[arg_160_0]

	if var_160_0 then
		return HXSet.hxLan(var_160_0.name)
	else
		return ""
	end
end

function getSkillDescGet(arg_161_0, arg_161_1)
	local var_161_0 = arg_161_1 and pg.skill_world_display[arg_161_0] and setmetatable({}, {
		__index = function(arg_162_0, arg_162_1)
			return pg.skill_world_display[arg_161_0][arg_162_1] or pg.skill_data_template[arg_161_0][arg_162_1]
		end
	}) or pg.skill_data_template[arg_161_0]

	if not var_161_0 then
		return ""
	end

	local var_161_1 = var_161_0.desc_get ~= "" and var_161_0.desc_get or var_161_0.desc

	for iter_161_0, iter_161_1 in pairs(var_161_0.desc_get_add) do
		local var_161_2 = setColorStr(iter_161_1[1], COLOR_GREEN)

		if iter_161_1[2] then
			var_161_2 = var_161_2 .. specialGSub(i18n("word_skill_desc_get"), "$1", setColorStr(iter_161_1[2], COLOR_GREEN))
		end

		var_161_1 = specialGSub(var_161_1, "$" .. iter_161_0, var_161_2)
	end

	return HXSet.hxLan(var_161_1)
end

function getSkillDescLearn(arg_163_0, arg_163_1, arg_163_2)
	local var_163_0 = arg_163_2 and pg.skill_world_display[arg_163_0] and setmetatable({}, {
		__index = function(arg_164_0, arg_164_1)
			return pg.skill_world_display[arg_163_0][arg_164_1] or pg.skill_data_template[arg_163_0][arg_164_1]
		end
	}) or pg.skill_data_template[arg_163_0]

	if not var_163_0 then
		return ""
	end

	local var_163_1 = var_163_0.desc

	if not var_163_0.desc_add then
		return HXSet.hxLan(var_163_1)
	end

	for iter_163_0, iter_163_1 in pairs(var_163_0.desc_add) do
		local var_163_2 = iter_163_1[arg_163_1][1]

		if iter_163_1[arg_163_1][2] then
			var_163_2 = var_163_2 .. specialGSub(i18n("word_skill_desc_learn"), "$1", iter_163_1[arg_163_1][2])
		end

		var_163_1 = specialGSub(var_163_1, "$" .. iter_163_0, setColorStr(var_163_2, COLOR_YELLOW))
	end

	return HXSet.hxLan(var_163_1)
end

function getSkillDesc(arg_165_0, arg_165_1, arg_165_2)
	local var_165_0 = arg_165_2 and pg.skill_world_display[arg_165_0] and setmetatable({}, {
		__index = function(arg_166_0, arg_166_1)
			return pg.skill_world_display[arg_165_0][arg_166_1] or pg.skill_data_template[arg_165_0][arg_166_1]
		end
	}) or pg.skill_data_template[arg_165_0]

	if not var_165_0 then
		return ""
	end

	local var_165_1 = var_165_0.desc

	if not var_165_0.desc_add then
		return HXSet.hxLan(var_165_1)
	end

	for iter_165_0, iter_165_1 in pairs(var_165_0.desc_add) do
		local var_165_2 = setColorStr(iter_165_1[arg_165_1][1], COLOR_GREEN)

		var_165_1 = specialGSub(var_165_1, "$" .. iter_165_0, var_165_2)
	end

	return HXSet.hxLan(var_165_1)
end

function specialGSub(arg_167_0, arg_167_1, arg_167_2)
	arg_167_0 = string.gsub(arg_167_0, "<color=#", "<color=NNN")
	arg_167_0 = string.gsub(arg_167_0, "#", "")
	arg_167_2 = string.gsub(arg_167_2, "%%", "%%%%")
	arg_167_0 = string.gsub(arg_167_0, arg_167_1, arg_167_2)
	arg_167_0 = string.gsub(arg_167_0, "<color=NNN", "<color=#")

	return arg_167_0
end

function topAnimation(arg_168_0, arg_168_1, arg_168_2, arg_168_3, arg_168_4, arg_168_5)
	local var_168_0 = {}

	arg_168_4 = arg_168_4 or 0.27

	local var_168_1 = 0.05

	if arg_168_0 then
		local var_168_2 = arg_168_0.transform.localPosition.x

		setAnchoredPosition(arg_168_0, {
			x = var_168_2 - 500
		})
		shiftPanel(arg_168_0, var_168_2, nil, 0.05, arg_168_4, true, true)
		setActive(arg_168_0, true)
	end

	setActive(arg_168_1, false)
	setActive(arg_168_2, false)
	setActive(arg_168_3, false)

	for iter_168_0 = 1, 3 do
		table.insert(var_168_0, LeanTween.delayedCall(arg_168_4 + 0.13 + var_168_1 * iter_168_0, System.Action(function()
			if arg_168_1 then
				setActive(arg_168_1, not arg_168_1.gameObject.activeSelf)
			end
		end)).uniqueId)
		table.insert(var_168_0, LeanTween.delayedCall(arg_168_4 + 0.02 + var_168_1 * iter_168_0, System.Action(function()
			if arg_168_2 then
				setActive(arg_168_2, not go(arg_168_2).activeSelf)
			end

			if arg_168_2 then
				setActive(arg_168_3, not go(arg_168_3).activeSelf)
			end
		end)).uniqueId)
	end

	if arg_168_5 then
		table.insert(var_168_0, LeanTween.delayedCall(arg_168_4 + 0.13 + var_168_1 * 3 + 0.1, System.Action(function()
			arg_168_5()
		end)).uniqueId)
	end

	return var_168_0
end

function cancelTweens(arg_172_0)
	assert(arg_172_0, "must provide cancel targets, LeanTween.cancelAll is not allow")

	for iter_172_0, iter_172_1 in ipairs(arg_172_0) do
		if iter_172_1 then
			LeanTween.cancel(iter_172_1)
		end
	end
end

function getOfflineTimeStamp(arg_173_0)
	local var_173_0 = pg.TimeMgr.GetInstance():GetServerTime() - arg_173_0
	local var_173_1 = ""

	if var_173_0 <= 59 then
		var_173_1 = i18n("just_now")
	elseif var_173_0 <= 3599 then
		var_173_1 = i18n("several_minutes_before", math.floor(var_173_0 / 60))
	elseif var_173_0 <= 86399 then
		var_173_1 = i18n("several_hours_before", math.floor(var_173_0 / 3600))
	else
		var_173_1 = i18n("several_days_before", math.floor(var_173_0 / 86400))
	end

	return var_173_1
end

function playMovie(arg_174_0, arg_174_1, arg_174_2)
	local var_174_0 = GameObject.Find("OverlayCamera/Overlay/UITop/MoviePanel")

	if not IsNil(var_174_0) then
		pg.UIMgr.GetInstance():LoadingOn()
		WWWLoader.Inst:LoadStreamingAsset(arg_174_0, function(arg_175_0)
			pg.UIMgr.GetInstance():LoadingOff()

			local var_175_0 = GCHandle.Alloc(arg_175_0, GCHandleType.Pinned)

			setActive(var_174_0, true)

			local var_175_1 = var_174_0:AddComponent(typeof(CriManaMovieControllerForUI))

			var_175_1.player:SetData(arg_175_0, arg_175_0.Length)

			var_175_1.target = var_174_0:GetComponent(typeof(Image))
			var_175_1.loop = false
			var_175_1.additiveMode = false
			var_175_1.playOnStart = true

			local var_175_2

			var_175_2 = Timer.New(function()
				if var_175_1.player.status == CriMana.Player.Status.PlayEnd or var_175_1.player.status == CriMana.Player.Status.Stop or var_175_1.player.status == CriMana.Player.Status.Error then
					var_175_2:Stop()
					Object.Destroy(var_175_1)
					GCHandle.Free(var_175_0)
					setActive(var_174_0, false)

					if arg_174_1 then
						arg_174_1()
					end
				end
			end, 0.2, -1)

			var_175_2:Start()
			removeOnButton(var_174_0)

			if arg_174_2 then
				onButton(nil, var_174_0, function()
					var_175_1:Stop()
					GetOrAddComponent(var_174_0, typeof(Button)).onClick:RemoveAllListeners()
				end, SFX_CANCEL)
			end
		end)
	elseif arg_174_1 then
		arg_174_1()
	end
end

PaintCameraAdjustOn = false

function cameraPaintViewAdjust(arg_178_0)
	if PaintCameraAdjustOn ~= arg_178_0 then
		local var_178_0 = GameObject.Find("UICamera/Canvas"):GetComponent(typeof(CanvasScaler))

		if arg_178_0 then
			CameraMgr.instance.AutoAdapt = false

			CameraMgr.instance:Revert()

			var_178_0.screenMatchMode = CanvasScaler.ScreenMatchMode.MatchWidthOrHeight
			var_178_0.matchWidthOrHeight = 1
		else
			CameraMgr.instance.AutoAdapt = true
			CameraMgr.instance.CurrentWidth = 1
			CameraMgr.instance.CurrentHeight = 1
			CameraMgr.instance.AspectRatio = 1.7777777777777777
			var_178_0.screenMatchMode = CanvasScaler.ScreenMatchMode.Expand
		end

		PaintCameraAdjustOn = arg_178_0
	end
end

function ManhattonDist(arg_179_0, arg_179_1)
	return math.abs(arg_179_0.row - arg_179_1.row) + math.abs(arg_179_0.column - arg_179_1.column)
end

function checkFirstHelpShow(arg_180_0)
	local var_180_0 = getProxy(SettingsProxy)

	if not var_180_0:checkReadHelp(arg_180_0) then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip[arg_180_0].tip
		})
		var_180_0:recordReadHelp(arg_180_0)
	end
end

preOrientation = nil
preNotchFitterEnabled = false

function openPortrait(arg_181_0)
	enableNotch(arg_181_0, true)

	preOrientation = Input.deviceOrientation:ToString()

	originalPrint("Begining Orientation:" .. preOrientation)

	Screen.autorotateToPortrait = true
	Screen.autorotateToPortraitUpsideDown = true

	cameraPaintViewAdjust(true)
end

function closePortrait(arg_182_0)
	enableNotch(arg_182_0, false)

	Screen.autorotateToPortrait = false
	Screen.autorotateToPortraitUpsideDown = false

	originalPrint("Closing Orientation:" .. preOrientation)

	Screen.orientation = ScreenOrientation.LandscapeLeft

	local var_182_0 = Timer.New(function()
		Screen.orientation = ScreenOrientation.AutoRotation
	end, 0.2, 1):Start()

	cameraPaintViewAdjust(false)
end

function enableNotch(arg_184_0, arg_184_1)
	if arg_184_0 == nil then
		return
	end

	local var_184_0 = arg_184_0:GetComponent("NotchAdapt")
	local var_184_1 = arg_184_0:GetComponent("AspectRatioFitter")

	var_184_0.enabled = arg_184_1

	if var_184_1 then
		if arg_184_1 then
			var_184_1.enabled = preNotchFitterEnabled
		else
			preNotchFitterEnabled = var_184_1.enabled
			var_184_1.enabled = false
		end
	end
end

function comma_value(arg_185_0)
	local var_185_0 = arg_185_0
	local var_185_1 = 0

	repeat
		local var_185_2

		var_185_0, var_185_2 = string.gsub(var_185_0, "^(-?%d+)(%d%d%d)", "%1,%2")
	until var_185_2 == 0

	return var_185_0
end

local var_0_15 = 0.2

function SwitchPanel(arg_186_0, arg_186_1, arg_186_2, arg_186_3, arg_186_4, arg_186_5)
	arg_186_3 = defaultValue(arg_186_3, var_0_15)

	if arg_186_5 then
		LeanTween.cancel(go(arg_186_0))
	end

	local var_186_0 = Vector3.New(tf(arg_186_0).localPosition.x, tf(arg_186_0).localPosition.y, tf(arg_186_0).localPosition.z)

	if arg_186_1 then
		var_186_0.x = arg_186_1
	end

	if arg_186_2 then
		var_186_0.y = arg_186_2
	end

	local var_186_1 = LeanTween.move(rtf(arg_186_0), var_186_0, arg_186_3):setEase(LeanTweenType.easeInOutSine)

	if arg_186_4 then
		var_186_1:setDelay(arg_186_4)
	end

	return var_186_1
end

function updateActivityTaskStatus(arg_187_0)
	local var_187_0 = arg_187_0:getConfig("config_id")
	local var_187_1, var_187_2 = getActivityTask(arg_187_0, true)

	if not var_187_2 then
		pg.m02:sendNotification(GAME.ACTIVITY_OPERATION, {
			cmd = 1,
			activity_id = arg_187_0.id
		})

		return true
	end

	return false
end

function updateCrusingActivityTask(arg_188_0)
	local var_188_0 = getProxy(TaskProxy)
	local var_188_1 = arg_188_0:getNDay()

	for iter_188_0, iter_188_1 in ipairs(arg_188_0:getConfig("config_data")) do
		local var_188_2 = pg.battlepass_task_group[iter_188_1]

		if var_188_1 >= var_188_2.time and underscore.any(underscore.flatten(var_188_2.task_group), function(arg_189_0)
			return var_188_0:getTaskVO(arg_189_0) == nil
		end) then
			pg.m02:sendNotification(GAME.CRUSING_CMD, {
				cmd = 1,
				activity_id = arg_188_0.id
			})

			return true
		end
	end

	return false
end

function setShipCardFrame(arg_190_0, arg_190_1, arg_190_2)
	arg_190_0.localScale = Vector3.one
	arg_190_0.anchorMin = Vector2.zero
	arg_190_0.anchorMax = Vector2.one

	local var_190_0 = arg_190_2 or arg_190_1

	GetImageSpriteFromAtlasAsync("shipframe", var_190_0, arg_190_0)

	local var_190_1 = pg.frame_resource[var_190_0]

	if var_190_1 then
		local var_190_2 = var_190_1.param

		arg_190_0.offsetMin = Vector2(var_190_2[1], var_190_2[2])
		arg_190_0.offsetMax = Vector2(var_190_2[3], var_190_2[4])
	else
		arg_190_0.offsetMin = Vector2.zero
		arg_190_0.offsetMax = Vector2.zero
	end
end

function setRectShipCardFrame(arg_191_0, arg_191_1, arg_191_2)
	arg_191_0.localScale = Vector3.one
	arg_191_0.anchorMin = Vector2.zero
	arg_191_0.anchorMax = Vector2.one

	setImageSprite(arg_191_0, GetSpriteFromAtlas("shipframeb", "b" .. (arg_191_2 or arg_191_1)))

	local var_191_0 = "b" .. (arg_191_2 or arg_191_1)
	local var_191_1 = pg.frame_resource[var_191_0]

	if var_191_1 then
		local var_191_2 = var_191_1.param

		arg_191_0.offsetMin = Vector2(var_191_2[1], var_191_2[2])
		arg_191_0.offsetMax = Vector2(var_191_2[3], var_191_2[4])
	else
		arg_191_0.offsetMin = Vector2.zero
		arg_191_0.offsetMax = Vector2.zero
	end
end

function setFrameEffect(arg_192_0, arg_192_1)
	if arg_192_1 then
		local var_192_0 = arg_192_1 .. "(Clone)"
		local var_192_1 = false

		eachChild(arg_192_0, function(arg_193_0)
			setActive(arg_193_0, arg_193_0.name == var_192_0)

			var_192_1 = var_192_1 or arg_193_0.name == var_192_0
		end)

		if not var_192_1 then
			LoadAndInstantiateAsync("effect", arg_192_1, function(arg_194_0)
				if IsNil(arg_192_0) or findTF(arg_192_0, var_192_0) then
					Object.Destroy(arg_194_0)
				else
					setParent(arg_194_0, arg_192_0)
					setActive(arg_194_0, true)
				end
			end)
		end
	end

	setActive(arg_192_0, arg_192_1)
end

function setProposeMarkIcon(arg_195_0, arg_195_1)
	local var_195_0 = arg_195_0:Find("proposeShipCard(Clone)")
	local var_195_1 = arg_195_1.propose and not arg_195_1:ShowPropose()

	if var_195_0 then
		setActive(var_195_0, var_195_1)
	elseif var_195_1 then
		pg.PoolMgr.GetInstance():GetUI("proposeShipCard", true, function(arg_196_0)
			if IsNil(arg_195_0) or arg_195_0:Find("proposeShipCard(Clone)") then
				pg.PoolMgr.GetInstance():ReturnUI("proposeShipCard", arg_196_0)
			else
				setParent(arg_196_0, arg_195_0, false)
			end
		end)
	end
end

function flushShipCard(arg_197_0, arg_197_1)
	local var_197_0 = arg_197_1:rarity2bgPrint()
	local var_197_1 = findTF(arg_197_0, "content/bg")

	GetImageSpriteFromAtlasAsync("bg/star_level_card_" .. var_197_0, "", var_197_1)

	local var_197_2 = findTF(arg_197_0, "content/ship_icon")
	local var_197_3 = arg_197_1 and {
		"shipYardIcon/" .. arg_197_1:getPainting(),
		arg_197_1:getPainting()
	} or {
		"shipYardIcon/unknown",
		""
	}

	GetImageSpriteFromAtlasAsync(var_197_3[1], var_197_3[2], var_197_2)

	local var_197_4 = arg_197_1:getShipType()
	local var_197_5 = findTF(arg_197_0, "content/info/top/type")

	GetImageSpriteFromAtlasAsync("shiptype", shipType2print(var_197_4), var_197_5)
	setText(findTF(arg_197_0, "content/dockyard/lv/Text"), defaultValue(arg_197_1.level, 1))

	local var_197_6 = arg_197_1:getStar()
	local var_197_7 = arg_197_1:getMaxStar()
	local var_197_8 = findTF(arg_197_0, "content/front/stars")

	setActive(var_197_8, true)

	local var_197_9 = findTF(var_197_8, "star_tpl")
	local var_197_10 = var_197_8.childCount

	for iter_197_0 = 1, Ship.CONFIG_MAX_STAR do
		local var_197_11 = var_197_10 < iter_197_0 and cloneTplTo(var_197_9, var_197_8) or var_197_8:GetChild(iter_197_0 - 1)

		setActive(var_197_11, iter_197_0 <= var_197_7)
		triggerToggle(var_197_11, iter_197_0 <= var_197_6)
	end

	local var_197_12 = findTF(arg_197_0, "content/front/frame")
	local var_197_13, var_197_14 = arg_197_1:GetFrameAndEffect()

	setShipCardFrame(var_197_12, var_197_0, var_197_13)
	setFrameEffect(findTF(arg_197_0, "content/front/bg_other"), var_197_14)
	setProposeMarkIcon(arg_197_0:Find("content/dockyard/propose"), arg_197_1)
end

function TweenItemAlphaAndWhite(arg_198_0)
	LeanTween.cancel(arg_198_0)

	local var_198_0 = GetOrAddComponent(arg_198_0, "CanvasGroup")

	var_198_0.alpha = 0

	LeanTween.alphaCanvas(var_198_0, 1, 0.2):setUseEstimatedTime(true)

	local var_198_1 = findTF(arg_198_0.transform, "white_mask")

	if var_198_1 then
		setActive(var_198_1, false)
	end
end

function ClearTweenItemAlphaAndWhite(arg_199_0)
	LeanTween.cancel(arg_199_0)

	GetOrAddComponent(arg_199_0, "CanvasGroup").alpha = 0
end

function getGroupOwnSkins(arg_200_0)
	local var_200_0 = {}
	local var_200_1 = getProxy(ShipSkinProxy):getSkinList()
	local var_200_2 = getProxy(CollectionProxy):getShipGroup(arg_200_0)

	if var_200_2 then
		local var_200_3 = ShipGroup.getSkinList(arg_200_0)

		for iter_200_0, iter_200_1 in ipairs(var_200_3) do
			if iter_200_1.skin_type == ShipSkin.SKIN_TYPE_DEFAULT or table.contains(var_200_1, iter_200_1.id) or iter_200_1.skin_type == ShipSkin.SKIN_TYPE_REMAKE and var_200_2.trans or iter_200_1.skin_type == ShipSkin.SKIN_TYPE_PROPOSE and var_200_2.married == 1 then
				var_200_0[iter_200_1.id] = true
			end
		end
	end

	return var_200_0
end

function split(arg_201_0, arg_201_1)
	local var_201_0 = {}

	if not arg_201_0 then
		return nil
	end

	local var_201_1 = #arg_201_0
	local var_201_2 = 1

	while var_201_2 <= var_201_1 do
		local var_201_3 = string.find(arg_201_0, arg_201_1, var_201_2)

		if var_201_3 == nil then
			table.insert(var_201_0, string.sub(arg_201_0, var_201_2, var_201_1))

			break
		end

		table.insert(var_201_0, string.sub(arg_201_0, var_201_2, var_201_3 - 1))

		if var_201_3 == var_201_1 then
			table.insert(var_201_0, "")

			break
		end

		var_201_2 = var_201_3 + 1
	end

	return var_201_0
end

function NumberToChinese(arg_202_0, arg_202_1)
	local var_202_0 = ""
	local var_202_1 = #arg_202_0

	for iter_202_0 = 1, var_202_1 do
		local var_202_2 = string.sub(arg_202_0, iter_202_0, iter_202_0)

		if var_202_2 ~= "0" or var_202_2 == "0" and not arg_202_1 then
			if arg_202_1 then
				if var_202_1 >= 2 then
					if iter_202_0 == 1 then
						if var_202_2 == "1" then
							var_202_0 = i18n("number_" .. 10)
						else
							var_202_0 = i18n("number_" .. var_202_2) .. i18n("number_" .. 10)
						end
					else
						var_202_0 = var_202_0 .. i18n("number_" .. var_202_2)
					end
				else
					var_202_0 = var_202_0 .. i18n("number_" .. var_202_2)
				end
			else
				var_202_0 = var_202_0 .. i18n("number_" .. var_202_2)
			end
		end
	end

	return var_202_0
end

function getActivityTask(arg_203_0, arg_203_1)
	local var_203_0 = getProxy(TaskProxy)
	local var_203_1 = arg_203_0:getConfig("config_data")
	local var_203_2 = arg_203_0:getNDay(arg_203_0.data1)
	local var_203_3
	local var_203_4
	local var_203_5

	for iter_203_0 = math.max(arg_203_0.data3, 1), math.min(var_203_2, #var_203_1) do
		local var_203_6 = _.flatten({
			var_203_1[iter_203_0]
		})

		for iter_203_1, iter_203_2 in ipairs(var_203_6) do
			local var_203_7 = var_203_0:getTaskById(iter_203_2)

			if var_203_7 then
				return var_203_7.id, var_203_7
			end

			if var_203_4 then
				var_203_5 = var_203_0:getFinishTaskById(iter_203_2)

				if var_203_5 then
					var_203_4 = var_203_5
				elseif arg_203_1 then
					return iter_203_2
				else
					return var_203_4.id, var_203_4
				end
			else
				var_203_4 = var_203_0:getFinishTaskById(iter_203_2)
				var_203_5 = var_203_5 or iter_203_2
			end
		end
	end

	if var_203_4 then
		return var_203_4.id, var_203_4
	else
		return var_203_5
	end
end

function setImageFromImage(arg_204_0, arg_204_1, arg_204_2)
	local var_204_0 = GetComponent(arg_204_0, "Image")

	var_204_0.sprite = GetComponent(arg_204_1, "Image").sprite

	if arg_204_2 then
		var_204_0:SetNativeSize()
	end
end

function skinTimeStamp(arg_205_0)
	local var_205_0, var_205_1, var_205_2, var_205_3 = pg.TimeMgr.GetInstance():parseTimeFrom(arg_205_0)

	if var_205_0 >= 1 then
		return i18n("limit_skin_time_day", var_205_0)
	elseif var_205_0 <= 0 and var_205_1 > 0 then
		return i18n("limit_skin_time_day_min", var_205_1, var_205_2)
	elseif var_205_0 <= 0 and var_205_1 <= 0 and (var_205_2 > 0 or var_205_3 > 0) then
		return i18n("limit_skin_time_min", math.max(var_205_2, 1))
	elseif var_205_0 <= 0 and var_205_1 <= 0 and var_205_2 <= 0 and var_205_3 <= 0 then
		return i18n("limit_skin_time_overtime")
	end
end

function skinCommdityTimeStamp(arg_206_0)
	local var_206_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_206_1 = math.max(arg_206_0 - var_206_0, 0)
	local var_206_2 = math.floor(var_206_1 / 86400)

	if var_206_2 > 0 then
		return i18n("time_remaining_tip") .. var_206_2 .. i18n("word_date")
	else
		local var_206_3 = math.floor(var_206_1 / 3600)

		if var_206_3 > 0 then
			return i18n("time_remaining_tip") .. var_206_3 .. i18n("word_hour")
		else
			local var_206_4 = math.floor(var_206_1 / 60)

			if var_206_4 > 0 then
				return i18n("time_remaining_tip") .. var_206_4 .. i18n("word_minute")
			else
				return i18n("time_remaining_tip") .. var_206_1 .. i18n("word_second")
			end
		end
	end
end

function InstagramTimeStamp(arg_207_0)
	local var_207_0 = pg.TimeMgr.GetInstance():GetServerTime() - arg_207_0
	local var_207_1 = var_207_0 / 86400

	if var_207_1 > 1 then
		return i18n("ins_word_day", math.floor(var_207_1))
	else
		local var_207_2 = var_207_0 / 3600

		if var_207_2 > 1 then
			return i18n("ins_word_hour", math.floor(var_207_2))
		else
			local var_207_3 = var_207_0 / 60

			if var_207_3 > 1 then
				return i18n("ins_word_minu", math.floor(var_207_3))
			else
				return i18n("ins_word_minu", 1)
			end
		end
	end
end

function InstagramReplyTimeStamp(arg_208_0)
	local var_208_0 = pg.TimeMgr.GetInstance():GetServerTime() - arg_208_0
	local var_208_1 = var_208_0 / 86400

	if var_208_1 > 1 then
		return i18n1(math.floor(var_208_1) .. "d")
	else
		local var_208_2 = var_208_0 / 3600

		if var_208_2 > 1 then
			return i18n1(math.floor(var_208_2) .. "h")
		else
			local var_208_3 = var_208_0 / 60

			if var_208_3 > 1 then
				return i18n1(math.floor(var_208_3) .. "min")
			else
				return i18n1("1min")
			end
		end
	end
end

function attireTimeStamp(arg_209_0)
	local var_209_0, var_209_1, var_209_2, var_209_3 = pg.TimeMgr.GetInstance():parseTimeFrom(arg_209_0)

	if var_209_0 <= 0 and var_209_1 <= 0 and var_209_2 <= 0 and var_209_3 <= 0 then
		return i18n("limit_skin_time_overtime")
	else
		return i18n("attire_time_stamp", var_209_0, var_209_1, var_209_2)
	end
end

function checkExist(arg_210_0, ...)
	local var_210_0 = {
		...
	}

	for iter_210_0, iter_210_1 in ipairs(var_210_0) do
		if arg_210_0 == nil then
			break
		end

		assert(type(arg_210_0) == "table", "type error : intermediate target should be table")
		assert(type(iter_210_1) == "table", "type error : param should be table")

		if type(arg_210_0[iter_210_1[1]]) == "function" then
			arg_210_0 = arg_210_0[iter_210_1[1]](arg_210_0, unpack(iter_210_1[2] or {}))
		else
			arg_210_0 = arg_210_0[iter_210_1[1]]
		end
	end

	return arg_210_0
end

function AcessWithinNull(arg_211_0, arg_211_1)
	if arg_211_0 == nil then
		return
	end

	assert(type(arg_211_0) == "table")

	return arg_211_0[arg_211_1]
end

function showRepairMsgbox()
	local var_212_0 = {
		text = i18n("msgbox_repair"),
		onCallback = function()
			if PathMgr.FileExists(Application.persistentDataPath .. "/hashes.csv") then
				BundleWizard.Inst:GetGroupMgr("DEFAULT_RES"):StartVerifyForLua()
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("word_no_cache"))
			end
		end
	}
	local var_212_1 = {
		text = i18n("msgbox_repair_l2d"),
		onCallback = function()
			if PathMgr.FileExists(Application.persistentDataPath .. "/hashes-live2d.csv") then
				BundleWizard.Inst:GetGroupMgr("L2D"):StartVerifyForLua()
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("word_no_cache"))
			end
		end
	}
	local var_212_2 = {
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
			var_212_2,
			var_212_1,
			var_212_0
		}
	})
end

function resourceVerify(arg_216_0, arg_216_1)
	if CSharpVersion > 35 then
		BundleWizard.Inst:GetGroupMgr("DEFAULT_RES"):StartVerifyForLua()

		return
	end

	local var_216_0 = Application.persistentDataPath .. "/hashes.csv"
	local var_216_1
	local var_216_2 = PathMgr.ReadAllLines(var_216_0)
	local var_216_3 = {}

	if arg_216_0 then
		setActive(arg_216_0, true)
	else
		pg.UIMgr.GetInstance():LoadingOn()
	end

	local function var_216_4()
		if arg_216_0 then
			setActive(arg_216_0, false)
		else
			pg.UIMgr.GetInstance():LoadingOff()
		end

		print(var_216_1)

		if var_216_1 then
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

	local var_216_5 = var_216_2.Length
	local var_216_6

	local function var_216_7(arg_219_0)
		if arg_219_0 < 0 then
			var_216_4()

			return
		end

		if arg_216_1 then
			setSlider(arg_216_1, 0, var_216_5, var_216_5 - arg_219_0)
		end

		local var_219_0 = string.split(var_216_2[arg_219_0], ",")
		local var_219_1 = var_219_0[1]
		local var_219_2 = var_219_0[3]
		local var_219_3 = PathMgr.getAssetBundle(var_219_1)

		if PathMgr.FileExists(var_219_3) then
			local var_219_4 = PathMgr.ReadAllBytes(PathMgr.getAssetBundle(var_219_1))

			if var_219_2 == HashUtil.CalcMD5(var_219_4) then
				onNextTick(function()
					var_216_7(arg_219_0 - 1)
				end)

				return
			end
		end

		var_216_1 = var_219_1

		var_216_4()
	end

	var_216_7(var_216_5 - 1)
end

function splitByWordEN(arg_221_0, arg_221_1)
	local var_221_0 = string.split(arg_221_0, " ")
	local var_221_1 = ""
	local var_221_2 = ""
	local var_221_3 = arg_221_1:GetComponent(typeof(RectTransform))
	local var_221_4 = arg_221_1:GetComponent(typeof(Text))
	local var_221_5 = var_221_3.rect.width

	for iter_221_0, iter_221_1 in ipairs(var_221_0) do
		local var_221_6 = var_221_2

		var_221_2 = var_221_2 == "" and iter_221_1 or var_221_2 .. " " .. iter_221_1

		setText(arg_221_1, var_221_2)

		if var_221_5 < var_221_4.preferredWidth then
			var_221_1 = var_221_1 == "" and var_221_6 or var_221_1 .. "\n" .. var_221_6
			var_221_2 = iter_221_1
		end

		if iter_221_0 >= #var_221_0 then
			var_221_1 = var_221_1 == "" and var_221_2 or var_221_1 .. "\n" .. var_221_2
		end
	end

	return var_221_1
end

function checkBirthFormat(arg_222_0)
	if #arg_222_0 ~= 8 then
		return false
	end

	local var_222_0 = 0
	local var_222_1 = #arg_222_0

	while var_222_0 < var_222_1 do
		local var_222_2 = string.byte(arg_222_0, var_222_0 + 1)

		if var_222_2 < 48 or var_222_2 > 57 then
			return false
		end

		var_222_0 = var_222_0 + 1
	end

	return true
end

function isHalfBodyLive2D(arg_223_0)
	local var_223_0 = {
		"biaoqiang",
		"z23",
		"lafei",
		"lingbo",
		"mingshi",
		"xuefeng"
	}

	return _.any(var_223_0, function(arg_224_0)
		return arg_224_0 == arg_223_0
	end)
end

function GetServerState(arg_225_0)
	local var_225_0 = -1
	local var_225_1 = 0
	local var_225_2 = 1
	local var_225_3 = 2
	local var_225_4 = NetConst.GetServerStateUrl()

	if PLATFORM_CODE == PLATFORM_CH then
		var_225_4 = string.gsub(var_225_4, "https", "http")
	end

	VersionMgr.Inst:WebRequest(var_225_4, function(arg_226_0, arg_226_1)
		local var_226_0 = true
		local var_226_1 = false

		for iter_226_0 in string.gmatch(arg_226_1, "\"state\":%d") do
			if iter_226_0 ~= "\"state\":1" then
				var_226_0 = false
			end

			var_226_1 = true
		end

		if not var_226_1 then
			var_226_0 = false
		end

		if arg_225_0 ~= nil then
			arg_225_0(var_226_0 and var_225_2 or var_225_1)
		end
	end)
end

function setScrollText(arg_227_0, arg_227_1)
	GetOrAddComponent(arg_227_0, "ScrollText"):SetText(arg_227_1)
end

function changeToScrollText(arg_228_0, arg_228_1)
	local var_228_0 = GetComponent(arg_228_0, typeof(Text))

	assert(var_228_0, "without component<Text>")

	local var_228_1 = arg_228_0:Find("subText")

	if not var_228_1 then
		var_228_1 = cloneTplTo(arg_228_0, arg_228_0, "subText")

		eachChild(arg_228_0, function(arg_229_0)
			setActive(arg_229_0, arg_229_0 == var_228_1)
		end)

		arg_228_0:GetComponent(typeof(Text)).enabled = false
	end

	setScrollText(var_228_1, arg_228_1)
end

local var_0_16
local var_0_17
local var_0_18
local var_0_19

local function var_0_20(arg_230_0, arg_230_1, arg_230_2)
	local var_230_0 = arg_230_0:Find("base")
	local var_230_1, var_230_2, var_230_3 = Equipment.GetInfoTrans(arg_230_1, arg_230_2)

	if arg_230_1.nextValue then
		local var_230_4 = {
			name = arg_230_1.name,
			type = arg_230_1.type,
			value = arg_230_1.nextValue
		}
		local var_230_5, var_230_6 = Equipment.GetInfoTrans(var_230_4, arg_230_2)

		var_230_2 = var_230_2 .. setColorStr("   >   " .. var_230_6, COLOR_GREEN)
	end

	setText(var_230_0:Find("name"), var_230_1)

	if var_230_3 then
		local var_230_7 = "<color=#afff72>(+" .. ys.Battle.BattleConst.UltimateBonus.AuxBoostValue * 100 .. "%)</color>"

		setText(var_230_0:Find("value"), var_230_2 .. var_230_7)
	else
		setText(var_230_0:Find("value"), var_230_2)
	end

	setActive(var_230_0:Find("value/up"), arg_230_1.compare and arg_230_1.compare > 0)
	setActive(var_230_0:Find("value/down"), arg_230_1.compare and arg_230_1.compare < 0)
	triggerToggle(var_230_0, arg_230_1.lock_open)

	if not arg_230_1.lock_open and arg_230_1.sub and #arg_230_1.sub > 0 then
		GetComponent(var_230_0, typeof(Toggle)).enabled = true
	else
		setActive(var_230_0:Find("name/close"), false)
		setActive(var_230_0:Find("name/open"), false)

		GetComponent(var_230_0, typeof(Toggle)).enabled = false
	end
end

local function var_0_21(arg_231_0, arg_231_1, arg_231_2, arg_231_3)
	var_0_20(arg_231_0, arg_231_2, arg_231_3)

	if not arg_231_2.sub or #arg_231_2.sub == 0 then
		return
	end

	var_0_18(arg_231_0:Find("subs"), arg_231_1, arg_231_2.sub, arg_231_3)
end

function var_0_18(arg_232_0, arg_232_1, arg_232_2, arg_232_3)
	removeAllChildren(arg_232_0)
	var_0_19(arg_232_0, arg_232_1, arg_232_2, arg_232_3)
end

function var_0_19(arg_233_0, arg_233_1, arg_233_2, arg_233_3)
	for iter_233_0, iter_233_1 in ipairs(arg_233_2) do
		local var_233_0 = cloneTplTo(arg_233_1, arg_233_0)

		var_0_21(var_233_0, arg_233_1, iter_233_1, arg_233_3)
	end
end

function updateEquipInfo(arg_234_0, arg_234_1, arg_234_2, arg_234_3)
	local var_234_0 = arg_234_0:Find("attr_tpl")

	var_0_18(arg_234_0:Find("attrs"), var_234_0, arg_234_1.attrs, arg_234_3)
	setActive(arg_234_0:Find("skill"), arg_234_2)

	if arg_234_2 then
		var_0_21(arg_234_0:Find("skill/attr"), var_234_0, {
			name = i18n("skill"),
			value = setColorStr(arg_234_2.name, "#FFDE00FF")
		}, arg_234_3)
		setText(arg_234_0:Find("skill/value/Text"), getSkillDescGet(arg_234_2.id))
	end

	setActive(arg_234_0:Find("weapon"), #arg_234_1.weapon.sub > 0)

	if #arg_234_1.weapon.sub > 0 then
		var_0_18(arg_234_0:Find("weapon"), var_234_0, {
			arg_234_1.weapon
		}, arg_234_3)
	end

	setActive(arg_234_0:Find("equip_info"), #arg_234_1.equipInfo.sub > 0)

	if #arg_234_1.equipInfo.sub > 0 then
		var_0_18(arg_234_0:Find("equip_info"), var_234_0, {
			arg_234_1.equipInfo
		}, arg_234_3)
	end

	var_0_21(arg_234_0:Find("part/attr"), var_234_0, {
		name = i18n("equip_info_23")
	}, arg_234_3)

	local var_234_1 = arg_234_0:Find("part/value")
	local var_234_2 = var_234_1:Find("label")
	local var_234_3 = {}
	local var_234_4 = {}

	if #arg_234_1.part[1] == 0 and #arg_234_1.part[2] == 0 then
		setmetatable(var_234_3, {
			__index = function(arg_235_0, arg_235_1)
				return true
			end
		})
		setmetatable(var_234_4, {
			__index = function(arg_236_0, arg_236_1)
				return true
			end
		})
	else
		for iter_234_0, iter_234_1 in ipairs(arg_234_1.part[1]) do
			var_234_3[iter_234_1] = true
		end

		for iter_234_2, iter_234_3 in ipairs(arg_234_1.part[2]) do
			var_234_4[iter_234_3] = true
		end
	end

	local var_234_5 = ShipType.MergeFengFanType(ShipType.FilterOverQuZhuType(ShipType.AllShipType), var_234_3, var_234_4)

	UIItemList.StaticAlign(var_234_1, var_234_2, #var_234_5, function(arg_237_0, arg_237_1, arg_237_2)
		arg_237_1 = arg_237_1 + 1

		if arg_237_0 == UIItemList.EventUpdate then
			local var_237_0 = var_234_5[arg_237_1]

			GetImageSpriteFromAtlasAsync("shiptype", ShipType.Type2CNLabel(var_237_0), arg_237_2)
			setActive(arg_237_2:Find("main"), var_234_3[var_237_0] and not var_234_4[var_237_0])
			setActive(arg_237_2:Find("sub"), var_234_4[var_237_0] and not var_234_3[var_237_0])
			setImageAlpha(arg_237_2, not var_234_3[var_237_0] and not var_234_4[var_237_0] and 0.3 or 1)
		end
	end)
end

function updateEquipUpgradeInfo(arg_238_0, arg_238_1, arg_238_2)
	local var_238_0 = arg_238_0:Find("attr_tpl")

	var_0_18(arg_238_0:Find("attrs"), var_238_0, arg_238_1.attrs, arg_238_2)
	setActive(arg_238_0:Find("weapon"), #arg_238_1.weapon.sub > 0)

	if #arg_238_1.weapon.sub > 0 then
		var_0_18(arg_238_0:Find("weapon"), var_238_0, {
			arg_238_1.weapon
		}, arg_238_2)
	end

	setActive(arg_238_0:Find("equip_info"), #arg_238_1.equipInfo.sub > 0)

	if #arg_238_1.equipInfo.sub > 0 then
		var_0_18(arg_238_0:Find("equip_info"), var_238_0, {
			arg_238_1.equipInfo
		}, arg_238_2)
	end
end

function setCanvasOverrideSorting(arg_239_0, arg_239_1)
	local var_239_0 = arg_239_0.parent

	arg_239_0:SetParent(pg.LayerWeightMgr.GetInstance().uiOrigin, false)

	if isActive(arg_239_0) then
		GetOrAddComponent(arg_239_0, typeof(Canvas)).overrideSorting = arg_239_1
	else
		setActive(arg_239_0, true)

		GetOrAddComponent(arg_239_0, typeof(Canvas)).overrideSorting = arg_239_1

		setActive(arg_239_0, false)
	end

	arg_239_0:SetParent(var_239_0, false)
end

function createNewGameObject(arg_240_0, arg_240_1)
	local var_240_0 = GameObject.New()

	if arg_240_0 then
		var_240_0.name = "model"
	end

	var_240_0.layer = arg_240_1 or Layer.UI

	return GetOrAddComponent(var_240_0, "RectTransform")
end

function CreateShell(arg_241_0)
	if type(arg_241_0) ~= "table" and type(arg_241_0) ~= "userdata" then
		return arg_241_0
	end

	local var_241_0 = setmetatable({
		__index = arg_241_0
	}, arg_241_0)

	return setmetatable({}, var_241_0)
end

function CameraFittingSettin(arg_242_0)
	local var_242_0 = GetComponent(arg_242_0, typeof(Camera))
	local var_242_1 = 1.7777777777777777
	local var_242_2 = Screen.width / Screen.height

	if var_242_2 < var_242_1 then
		local var_242_3 = var_242_2 / var_242_1

		var_242_0.rect = var_0_0.Rect.New(0, (1 - var_242_3) / 2, 1, var_242_3)
	end
end

function SwitchSpecialChar(arg_243_0, arg_243_1)
	if PLATFORM_CODE ~= PLATFORM_US then
		arg_243_0 = arg_243_0:gsub(" ", " ")
		arg_243_0 = arg_243_0:gsub("\t", "    ")
	end

	if not arg_243_1 then
		arg_243_0 = arg_243_0:gsub("\n", " ")
	end

	return arg_243_0
end

function AfterCheck(arg_244_0, arg_244_1)
	local var_244_0 = {}

	for iter_244_0, iter_244_1 in ipairs(arg_244_0) do
		var_244_0[iter_244_0] = iter_244_1[1]()
	end

	arg_244_1()

	for iter_244_2, iter_244_3 in ipairs(arg_244_0) do
		if var_244_0[iter_244_2] ~= iter_244_3[1]() then
			iter_244_3[2]()
		end

		var_244_0[iter_244_2] = iter_244_3[1]()
	end
end

function CompareFuncs(arg_245_0, arg_245_1)
	local var_245_0 = {}

	local function var_245_1(arg_246_0, arg_246_1)
		var_245_0[arg_246_0] = var_245_0[arg_246_0] or {}
		var_245_0[arg_246_0][arg_246_1] = var_245_0[arg_246_0][arg_246_1] or arg_245_0[arg_246_0](arg_246_1)

		return var_245_0[arg_246_0][arg_246_1]
	end

	return function(arg_247_0, arg_247_1)
		local var_247_0 = 1

		while var_247_0 <= #arg_245_0 do
			local var_247_1 = var_245_1(var_247_0, arg_247_0)
			local var_247_2 = var_245_1(var_247_0, arg_247_1)

			if var_247_1 == var_247_2 then
				var_247_0 = var_247_0 + 1
			else
				return var_247_1 < var_247_2
			end
		end

		return tobool(arg_245_1)
	end
end

function DropResultIntegration(arg_248_0)
	local var_248_0 = {}
	local var_248_1 = 1

	while var_248_1 <= #arg_248_0 do
		local var_248_2 = arg_248_0[var_248_1].type
		local var_248_3 = arg_248_0[var_248_1].id

		var_248_0[var_248_2] = var_248_0[var_248_2] or {}

		if var_248_0[var_248_2][var_248_3] then
			local var_248_4 = arg_248_0[var_248_0[var_248_2][var_248_3]]
			local var_248_5 = table.remove(arg_248_0, var_248_1)

			var_248_4.count = var_248_4.count + var_248_5.count
		else
			var_248_0[var_248_2][var_248_3] = var_248_1
			var_248_1 = var_248_1 + 1
		end
	end

	local var_248_6 = {
		function(arg_249_0)
			local var_249_0 = arg_249_0.type
			local var_249_1 = arg_249_0.id

			if var_249_0 == DROP_TYPE_SHIP then
				return 1
			elseif var_249_0 == DROP_TYPE_RESOURCE then
				if var_249_1 == 1 then
					return 2
				else
					return 3
				end
			elseif var_249_0 == DROP_TYPE_ITEM then
				if var_249_1 == 59010 then
					return 4
				elseif var_249_1 == 59900 then
					return 5
				else
					local var_249_2 = Item.getConfigData(var_249_1)
					local var_249_3 = var_249_2 and var_249_2.type or 0

					if var_249_3 == 9 then
						return 6
					elseif var_249_3 == 5 then
						return 7
					elseif var_249_3 == 4 then
						return 8
					elseif var_249_3 == 7 then
						return 9
					end
				end
			elseif var_249_0 == DROP_TYPE_VITEM and var_249_1 == 59011 then
				return 4
			end

			return 100
		end,
		function(arg_250_0)
			local var_250_0

			if arg_250_0.type == DROP_TYPE_SHIP then
				var_250_0 = pg.ship_data_statistics[arg_250_0.id]
			elseif arg_250_0.type == DROP_TYPE_ITEM then
				var_250_0 = Item.getConfigData(arg_250_0.id)
			end

			return (var_250_0 and var_250_0.rarity or 0) * -1
		end,
		function(arg_251_0)
			return arg_251_0.id
		end
	}

	table.sort(arg_248_0, CompareFuncs(var_248_6))
end

function getLoginConfig()
	local var_252_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_252_1 = 1

	for iter_252_0, iter_252_1 in ipairs(pg.login.all) do
		if pg.login[iter_252_1].date ~= "stop" then
			local var_252_2, var_252_3 = parseTimeConfig(pg.login[iter_252_1].date)

			assert(not var_252_3)

			if pg.TimeMgr.GetInstance():inTime(var_252_2, var_252_0) then
				var_252_1 = iter_252_1

				break
			end
		end
	end

	local var_252_4 = pg.login[var_252_1].login_static

	var_252_4 = var_252_4 ~= "" and var_252_4 or "login"

	local var_252_5 = pg.login[var_252_1].login_cri
	local var_252_6 = var_252_5 ~= "" and true or false
	local var_252_7 = pg.login[var_252_1].op_play == 1 and true or false
	local var_252_8 = pg.login[var_252_1].op_time

	if var_252_8 == "" or not pg.TimeMgr.GetInstance():inTime(var_252_8, var_252_0) then
		var_252_7 = false
	end

	local var_252_9 = var_252_8 == "" and var_252_8 or table.concat(var_252_8[1][1])

	return var_252_6, var_252_6 and var_252_5 or var_252_4, pg.login[var_252_1].bgm, var_252_7, var_252_9
end

function setIntimacyIcon(arg_253_0, arg_253_1, arg_253_2)
	local var_253_0 = {}
	local var_253_1

	if arg_253_0.childCount > 0 then
		var_253_1 = arg_253_0:GetChild(0)
	else
		var_253_1 = LoadAndInstantiateSync("template", "intimacytpl").transform

		setParent(var_253_1, arg_253_0)
	end

	setImageAlpha(var_253_1, arg_253_2 and 0 or 1)
	eachChild(var_253_1, function(arg_254_0)
		setActive(arg_254_0, false)
	end)

	if arg_253_2 then
		local var_253_2 = var_253_1:Find(arg_253_2 .. "(Clone)")

		if not var_253_2 then
			var_253_2 = LoadAndInstantiateSync("ui", arg_253_2)

			setParent(var_253_2, var_253_1)
		end

		setActive(var_253_2, true)
	elseif arg_253_1 then
		setImageSprite(var_253_1, GetSpriteFromAtlas("energy", arg_253_1), true)
	else
		assert(false, "param error")
	end

	return var_253_1
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

function switch(arg_257_0, arg_257_1, arg_257_2, ...)
	if arg_257_1[arg_257_0] then
		return arg_257_1[arg_257_0](...)
	elseif arg_257_2 then
		return arg_257_2(...)
	end
end

function parseTimeConfig(arg_258_0)
	if type(arg_258_0[1]) == "table" then
		return arg_258_0[2], arg_258_0[1]
	else
		return arg_258_0
	end
end

local var_0_23 = {
	__add = function(arg_259_0, arg_259_1)
		return NewPos(arg_259_0.x + arg_259_1.x, arg_259_0.y + arg_259_1.y)
	end,
	__sub = function(arg_260_0, arg_260_1)
		return NewPos(arg_260_0.x - arg_260_1.x, arg_260_0.y - arg_260_1.y)
	end,
	__mul = function(arg_261_0, arg_261_1)
		if type(arg_261_1) == "number" then
			return NewPos(arg_261_0.x * arg_261_1, arg_261_0.y * arg_261_1)
		else
			return NewPos(arg_261_0.x * arg_261_1.x, arg_261_0.y * arg_261_1.y)
		end
	end,
	__eq = function(arg_262_0, arg_262_1)
		return arg_262_0.x == arg_262_1.x and arg_262_0.y == arg_262_1.y
	end,
	__tostring = function(arg_263_0)
		return arg_263_0.x .. "_" .. arg_263_0.y
	end
}

function NewPos(arg_264_0, arg_264_1)
	assert(arg_264_0 and arg_264_1)

	local var_264_0 = setmetatable({
		x = arg_264_0,
		y = arg_264_1
	}, var_0_23)

	function var_264_0.SqrMagnitude(arg_265_0)
		return arg_265_0.x * arg_265_0.x + arg_265_0.y * arg_265_0.y
	end

	function var_264_0.Normalize(arg_266_0)
		local var_266_0 = arg_266_0:SqrMagnitude()

		if var_266_0 > 1e-05 then
			return arg_266_0 * (1 / math.sqrt(var_266_0))
		else
			return NewPos(0, 0)
		end
	end

	return var_264_0
end

local var_0_24

function Timekeeping()
	warning(Time.realtimeSinceStartup - (var_0_24 or Time.realtimeSinceStartup), Time.realtimeSinceStartup)

	var_0_24 = Time.realtimeSinceStartup
end

function GetRomanDigit(arg_268_0)
	return (string.char(226, 133, 160 + (arg_268_0 - 1)))
end

function quickPlayAnimator(arg_269_0, arg_269_1)
	arg_269_0:GetComponent(typeof(Animator)):Play(arg_269_1, -1, 0)
end

function getSurveyUrl(arg_270_0)
	local var_270_0 = pg.survey_data_template[arg_270_0]
	local var_270_1

	if not IsUnityEditor then
		if PLATFORM_CODE == PLATFORM_CH then
			local var_270_2 = getProxy(UserProxy):GetCacheGatewayInServerLogined()

			if var_270_2 == PLATFORM_ANDROID then
				if LuaHelper.GetCHPackageType() == PACKAGE_TYPE_BILI then
					var_270_1 = var_270_0.main_url
				else
					var_270_1 = var_270_0.uo_url
				end
			elseif var_270_2 == PLATFORM_IPHONEPLAYER then
				var_270_1 = var_270_0.ios_url
			end
		elseif PLATFORM_CODE == PLATFORM_US or PLATFORM_CODE == PLATFORM_JP then
			var_270_1 = var_270_0.main_url
		end
	else
		var_270_1 = var_270_0.main_url
	end

	local var_270_3 = getProxy(PlayerProxy):getRawData().id
	local var_270_4 = getProxy(UserProxy):getRawData().arg2 or ""
	local var_270_5
	local var_270_6 = PLATFORM == PLATFORM_ANDROID and 1 or PLATFORM == PLATFORM_IPHONEPLAYER and 2 or 3
	local var_270_7 = getProxy(UserProxy):getRawData()
	local var_270_8 = getProxy(ServerProxy):getRawData()[var_270_7 and var_270_7.server or 0]
	local var_270_9 = var_270_8 and var_270_8.id or ""
	local var_270_10 = getProxy(PlayerProxy):getRawData().level
	local var_270_11 = var_270_3 .. "_" .. arg_270_0
	local var_270_12 = var_270_1
	local var_270_13 = {
		var_270_3,
		var_270_4,
		var_270_6,
		var_270_9,
		var_270_10,
		var_270_11
	}

	if var_270_12 then
		for iter_270_0, iter_270_1 in ipairs(var_270_13) do
			var_270_12 = string.gsub(var_270_12, "$" .. iter_270_0, tostring(iter_270_1))
		end
	end

	warning(var_270_12)

	return var_270_12
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

function FilterVarchar(arg_272_0)
	assert(type(arg_272_0) == "string" or type(arg_272_0) == "table")

	if arg_272_0 == "" then
		return nil
	end

	return arg_272_0
end

function getGameset(arg_273_0)
	local var_273_0 = pg.gameset[arg_273_0]

	assert(var_273_0)

	return {
		var_273_0.key_value,
		var_273_0.description
	}
end

function getDorm3dGameset(arg_274_0)
	local var_274_0 = pg.dorm3d_set[arg_274_0]

	assert(var_274_0)

	return {
		var_274_0.key_value_int,
		var_274_0.key_value_varchar
	}
end

function GetItemsOverflowDic(arg_275_0)
	arg_275_0 = arg_275_0 or {}

	local var_275_0 = {
		[DROP_TYPE_ITEM] = {},
		[DROP_TYPE_RESOURCE] = {},
		[DROP_TYPE_EQUIP] = 0,
		[DROP_TYPE_SHIP] = 0,
		[DROP_TYPE_WORLD_ITEM] = 0
	}

	while #arg_275_0 > 0 do
		local var_275_1 = table.remove(arg_275_0)

		switch(var_275_1.type, {
			[DROP_TYPE_ITEM] = function()
				if var_275_1:getConfig("open_directly") == 1 then
					for iter_276_0, iter_276_1 in ipairs(var_275_1:getConfig("display_icon")) do
						local var_276_0 = Drop.Create(iter_276_1)

						var_276_0.count = var_276_0.count * var_275_1.count

						table.insert(arg_275_0, var_276_0)
					end
				elseif var_275_1:getSubClass():IsShipExpType() then
					var_275_0[var_275_1.type][var_275_1.id] = defaultValue(var_275_0[var_275_1.type][var_275_1.id], 0) + var_275_1.count
				end
			end,
			[DROP_TYPE_RESOURCE] = function()
				var_275_0[var_275_1.type][var_275_1.id] = defaultValue(var_275_0[var_275_1.type][var_275_1.id], 0) + var_275_1.count
			end,
			[DROP_TYPE_EQUIP] = function()
				var_275_0[var_275_1.type] = var_275_0[var_275_1.type] + var_275_1.count
			end,
			[DROP_TYPE_SHIP] = function()
				var_275_0[var_275_1.type] = var_275_0[var_275_1.type] + var_275_1.count
			end,
			[DROP_TYPE_WORLD_ITEM] = function()
				var_275_0[var_275_1.type] = var_275_0[var_275_1.type] + var_275_1.count
			end
		})
	end

	return var_275_0
end

function CheckOverflow(arg_281_0)
	local var_281_0 = arg_281_0[DROP_TYPE_RESOURCE][PlayerConst.ResGold] or 0
	local var_281_1 = arg_281_0[DROP_TYPE_RESOURCE][PlayerConst.ResOil] or 0
	local var_281_2 = arg_281_0[DROP_TYPE_EQUIP]
	local var_281_3 = arg_281_0[DROP_TYPE_SHIP]
	local var_281_4 = getProxy(PlayerProxy):getRawData()

	if var_281_0 > 0 and var_281_4:GoldMax(var_281_0) then
		return false, "gold"
	end

	if var_281_1 > 0 and var_281_4:OilMax(var_281_1) then
		return false, "oil"
	end

	local var_281_5 = getProxy(EquipmentProxy):getCapacity()

	if var_281_2 > 0 and var_281_2 + var_281_5 > var_281_4:getMaxEquipmentBag() then
		return false, "equip"
	end

	local var_281_6 = getProxy(BayProxy):getShipCount()

	if var_281_3 > 0 and var_281_3 + var_281_6 > var_281_4:getMaxShipBag() then
		return false, "ship"
	end

	return true
end

function CheckShipExpOverflow(arg_282_0)
	local var_282_0 = getProxy(BagProxy)

	for iter_282_0, iter_282_1 in pairs(arg_282_0[DROP_TYPE_ITEM]) do
		if var_282_0:getItemCountById(iter_282_0) + iter_282_1 > Item.getConfigData(iter_282_0).max_num then
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

function RegisterDetailButton(arg_283_0, arg_283_1, arg_283_2)
	Drop.Change(arg_283_2)
	switch(arg_283_2.type, {
		[DROP_TYPE_ITEM] = function()
			if arg_283_2:getConfig("type") == Item.SKIN_ASSIGNED_TYPE then
				local var_284_0 = Item.getConfigData(arg_283_2.id).usage_arg
				local var_284_1 = var_284_0[3]

				if Item.InTimeLimitSkinAssigned(arg_283_2.id) then
					var_284_1 = table.mergeArray(var_284_0[2], var_284_1, true)
				end

				local var_284_2 = {}

				for iter_284_0, iter_284_1 in ipairs(var_284_0[2]) do
					var_284_2[iter_284_1] = true
				end

				onButton(arg_283_0, arg_283_1, function()
					arg_283_0:closeView()
					pg.m02:sendNotification(GAME.LOAD_LAYERS, {
						parentContext = getProxy(ContextProxy):getCurrentContext(),
						context = Context.New({
							viewComponent = SelectSkinLayer,
							mediator = SkinAtlasMediator,
							data = {
								mode = SelectSkinLayer.MODE_VIEW,
								itemId = arg_283_2.id,
								selectableSkinList = underscore.map(var_284_1, function(arg_286_0)
									return SelectableSkin.New({
										id = arg_286_0,
										isTimeLimit = var_284_2[arg_286_0] or false
									})
								end)
							}
						})
					})
				end, SFX_PANEL)
				setActive(arg_283_1, true)
			else
				local var_284_3 = getProxy(TechnologyProxy):getItemCanUnlockBluePrint(arg_283_2.id) and "tech" or arg_283_2:getConfig("type")

				if var_0_25[var_284_3] then
					local var_284_4 = {
						item2Row = true,
						content = i18n(var_0_25[var_284_3]),
						itemList = underscore.map(arg_283_2:getConfig("display_icon"), function(arg_287_0)
							return Drop.Create(arg_287_0)
						end)
					}

					if var_284_3 == 11 then
						onButton(arg_283_0, arg_283_1, function()
							arg_283_0:emit(BaseUI.ON_DROP_LIST_OWN, var_284_4)
						end, SFX_PANEL)
					else
						onButton(arg_283_0, arg_283_1, function()
							arg_283_0:emit(BaseUI.ON_DROP_LIST, var_284_4)
						end, SFX_PANEL)
					end
				end

				setActive(arg_283_1, tobool(var_0_25[var_284_3]))
			end
		end,
		[DROP_TYPE_EQUIP] = function()
			onButton(arg_283_0, arg_283_1, function()
				arg_283_0:emit(BaseUI.ON_DROP, arg_283_2)
			end, SFX_PANEL)
			setActive(arg_283_1, true)
		end,
		[DROP_TYPE_SPWEAPON] = function()
			onButton(arg_283_0, arg_283_1, function()
				arg_283_0:emit(BaseUI.ON_DROP, arg_283_2)
			end, SFX_PANEL)
			setActive(arg_283_1, true)
		end
	}, function()
		setActive(arg_283_1, false)
	end)
end

function UpdateOwnDisplay(arg_295_0, arg_295_1)
	local var_295_0, var_295_1 = arg_295_1:getOwnedCount()

	setActive(arg_295_0, var_295_1 and var_295_0 > 0)

	if var_295_1 and var_295_0 > 0 then
		setText(arg_295_0:Find("label"), i18n("word_own1"))
		setText(arg_295_0:Find("Text"), var_295_0)
	end
end

function Damp(arg_296_0, arg_296_1, arg_296_2)
	arg_296_1 = Mathf.Max(1, arg_296_1)

	local var_296_0 = Mathf.Epsilon

	if arg_296_1 < var_296_0 or var_296_0 > Mathf.Abs(arg_296_0) then
		return arg_296_0
	end

	if arg_296_2 < var_296_0 then
		return 0
	end

	local var_296_1 = -4.605170186

	return arg_296_0 * (1 - Mathf.Exp(var_296_1 * arg_296_2 / arg_296_1))
end

function checkCullResume(arg_297_0)
	if not ReflectionHelp.RefCallMethodEx(typeof("UnityEngine.CanvasRenderer"), "GetMaterial", GetComponent(arg_297_0, "CanvasRenderer"), {
		typeof("System.Int32")
	}, {
		0
	}) then
		local var_297_0 = arg_297_0:GetComponentsInChildren(typeof(MeshImage))

		for iter_297_0 = 1, var_297_0.Length do
			var_297_0[iter_297_0 - 1]:SetVerticesDirty()
		end

		return false
	end

	return true
end

function parseEquipCode(arg_298_0)
	local var_298_0 = {}

	if arg_298_0 and arg_298_0 ~= "" then
		local var_298_1 = base64.dec(arg_298_0)

		var_298_0 = string.split(var_298_1, "/")
		var_298_0[5], var_298_0[6] = unpack(string.split(var_298_0[5], "\\"))

		if #var_298_0 < 6 or arg_298_0 ~= base64.enc(table.concat({
			table.concat(underscore.first(var_298_0, 5), "/"),
			var_298_0[6]
		}, "\\")) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("equipcode_illegal"))

			var_298_0 = {}
		end
	end

	for iter_298_0 = 1, 6 do
		var_298_0[iter_298_0] = var_298_0[iter_298_0] and tonumber(var_298_0[iter_298_0], 32) or 0
	end

	return var_298_0
end

function buildEquipCode(arg_299_0)
	local var_299_0 = underscore.map(arg_299_0:getAllEquipments(), function(arg_300_0)
		return ConversionBase(32, arg_300_0 and arg_300_0.id or 0)
	end)
	local var_299_1 = {
		table.concat(var_299_0, "/"),
		ConversionBase(32, checkExist(arg_299_0:GetSpWeapon(), {
			"id"
		}) or 0)
	}

	return base64.enc(table.concat(var_299_1, "\\"))
end

function setDirectorSpeed(arg_301_0, arg_301_1)
	GetComponent(arg_301_0, "TimelineSpeed"):SetTimelineSpeed(arg_301_1)
end

function envFunc(arg_302_0, arg_302_1)
	assert(not getmetatable(arg_302_1), "table has error metatable")
	setfenv(arg_302_0, setmetatable(arg_302_1, {
		__index = _G
	}))
	arg_302_0()
	setfenv(arg_302_0, _G)

	return setmetatable(arg_302_1, nil)
end

function setDefaultZeroMetatable(arg_303_0)
	return setmetatable(arg_303_0, {
		__index = function(arg_304_0, arg_304_1)
			if rawget(arg_304_0, arg_304_1) == nil then
				arg_304_0[arg_304_1] = 0
			end

			return arg_304_0[arg_304_1]
		end
	})
end

local var_0_26 = {
	__index = {
		LoadAssetSync = function(arg_305_0, ...)
			if EDITOR_TOOL then
				return ResourceMgr.Inst:getAssetSync(arg_305_0.path, ...)
			else
				return ResourceMgr.Inst:LoadAssetSync(arg_305_0.ab, ...)
			end
		end
	}
}

function buildTempAB(arg_306_0, arg_306_1)
	local var_306_0 = setmetatable({
		path = arg_306_0
	}, var_0_26)

	if EDITOR_TOOL then
		if arg_306_1 then
			onNextTick(function()
				arg_306_1(var_306_0)
			end)
		end
	elseif arg_306_1 then
		ResourceMgr.Inst:loadAssetBundleAsync(arg_306_0, function(arg_308_0)
			var_306_0.ab = arg_308_0

			arg_306_1(var_306_0)
		end)
	else
		var_306_0.ab = ResourceMgr.Inst:loadAssetBundleSync(arg_306_0)
	end

	return var_306_0
end
