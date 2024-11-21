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

	ResourceMgr.Inst:getAssetAsync(arg_12_0 .. arg_12_1, "", var_0_0.Events.UnityAction_UnityEngine_Object(function(arg_13_0)
		local var_13_0 = Instantiate(arg_13_0)

		arg_12_2(var_13_0)
	end), arg_12_3, arg_12_4)
end

function LoadAndInstantiateSync(arg_14_0, arg_14_1, arg_14_2, arg_14_3)
	arg_14_3 = defaultValue(arg_14_3, true)
	arg_14_2 = defaultValue(arg_14_2, true)
	arg_14_0, arg_14_1 = HXSet.autoHxShift(arg_14_0 .. "/", arg_14_1)

	local var_14_0 = ResourceMgr.Inst:getAssetSync(arg_14_0 .. arg_14_1, "", arg_14_2, arg_14_3)

	return (Instantiate(var_14_0))
end

local var_0_1 = {}

function LoadSprite(arg_15_0, arg_15_1)
	return LoadAny(arg_15_0, arg_15_1, typeof(Sprite))
end

function LoadSpriteAtlasAsync(arg_16_0, arg_16_1, arg_16_2)
	LoadAnyAsync(arg_16_0, arg_16_1, typeof(Sprite), arg_16_2)
end

function LoadSpriteAsync(arg_17_0, arg_17_1)
	LoadSpriteAtlasAsync(arg_17_0, "", arg_17_1)
end

function LoadAny(arg_18_0, arg_18_1, arg_18_2)
	arg_18_0, arg_18_1 = HXSet.autoHxShiftPath(arg_18_0, arg_18_1)

	return AssetBundleHelper.LoadAsset(arg_18_0, arg_18_1, arg_18_2, false, nil, true)
end

function LoadAnyAsync(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
	arg_19_0, arg_19_1 = HXSet.autoHxShiftPath(arg_19_0, arg_19_1)

	AssetBundleHelper.LoadAsset(arg_19_0, arg_19_1, arg_19_2, true, arg_19_3, true)
end

function LoadImageSpriteAtlasAsync(arg_20_0, arg_20_1, arg_20_2, arg_20_3)
	local var_20_0 = arg_20_2:GetComponent(typeof(Image))

	var_20_0.enabled = false
	var_0_1[var_20_0] = arg_20_0

	LoadSpriteAtlasAsync(arg_20_0, arg_20_1, function(arg_21_0)
		if not IsNil(var_20_0) and var_0_1[var_20_0] == arg_20_0 then
			var_0_1[var_20_0] = nil
			var_20_0.enabled = true
			var_20_0.sprite = arg_21_0

			if arg_20_3 then
				var_20_0:SetNativeSize()
			end
		end
	end)
end

function LoadImageSpriteAsync(arg_22_0, arg_22_1, arg_22_2)
	LoadImageSpriteAtlasAsync(arg_22_0, nil, arg_22_1, arg_22_2)
end

function GetSpriteFromAtlas(arg_23_0, arg_23_1)
	local var_23_0

	arg_23_0, arg_23_1 = HXSet.autoHxShiftPath(arg_23_0, arg_23_1)

	PoolMgr.GetInstance():GetSprite(arg_23_0, arg_23_1, false, function(arg_24_0)
		var_23_0 = arg_24_0
	end)

	return var_23_0
end

function GetSpriteFromAtlasAsync(arg_25_0, arg_25_1, arg_25_2)
	arg_25_0, arg_25_1 = HXSet.autoHxShiftPath(arg_25_0, arg_25_1)

	PoolMgr.GetInstance():GetSprite(arg_25_0, arg_25_1, true, function(arg_26_0)
		arg_25_2(arg_26_0)
	end)
end

function GetImageSpriteFromAtlasAsync(arg_27_0, arg_27_1, arg_27_2, arg_27_3)
	arg_27_0, arg_27_1 = HXSet.autoHxShiftPath(arg_27_0, arg_27_1)

	local var_27_0 = arg_27_2:GetComponent(typeof(Image))

	var_27_0.enabled = false
	var_0_1[var_27_0] = arg_27_0 .. arg_27_1

	GetSpriteFromAtlasAsync(arg_27_0, arg_27_1, function(arg_28_0)
		if not IsNil(var_27_0) and var_0_1[var_27_0] == arg_27_0 .. arg_27_1 then
			var_0_1[var_27_0] = nil
			var_27_0.enabled = true
			var_27_0.sprite = arg_28_0

			if arg_27_3 then
				var_27_0:SetNativeSize()
			end
		end
	end)
end

function SetAction(arg_29_0, arg_29_1, arg_29_2)
	GetComponent(arg_29_0, "SkeletonGraphic").AnimationState:SetAnimation(0, arg_29_1, defaultValue(arg_29_2, true))
end

function SetActionCallback(arg_30_0, arg_30_1)
	GetOrAddComponent(arg_30_0, typeof(SpineAnimUI)):SetActionCallBack(arg_30_1)
end

function emojiText(arg_31_0, arg_31_1)
	local var_31_0 = GetComponent(arg_31_0, "TextMesh")
	local var_31_1 = GetComponent(arg_31_0, "MeshRenderer")
	local var_31_2 = Shader.Find("UI/Unlit/Transparent")
	local var_31_3 = var_31_1.materials
	local var_31_4 = {
		var_31_3[0]
	}
	local var_31_5 = {}
	local var_31_6 = 0
	local var_31_7 = {}
	local var_31_8 = string.gsub(arg_31_1, "#(%d+)#", function(arg_32_0)
		if not var_31_5[arg_32_0] then
			var_31_6 = var_31_6 + 1
			var_31_7["emoji" .. arg_32_0] = Material.New(var_31_2)

			table.insert(var_31_4, mat)

			var_31_5[arg_32_0] = var_31_6

			local var_32_0 = var_31_6
		end

		return "<quad material=" .. var_31_6 .. " />"
	end)
	local var_31_9 = AssetBundleHelper.LoadManyAssets("emojis", underscore.keys(var_31_7), nil, false, nil, true)

	for iter_31_0, iter_31_1 in pairs(var_31_7) do
		iter_31_1.mainTexture = var_31_9[iter_31_0]
	end

	var_31_0.text = var_31_8
	var_31_1.materials = var_31_4
end

function setPaintingImg(arg_33_0, arg_33_1)
	local var_33_0 = LoadSprite("painting/" .. arg_33_1) or LoadSprite("painting/unknown")

	setImageSprite(arg_33_0, var_33_0)
	resetAspectRatio(arg_33_0)
end

function setPaintingPrefab(arg_34_0, arg_34_1, arg_34_2, arg_34_3)
	local var_34_0 = findTF(arg_34_0, "fitter")

	assert(var_34_0, "请添加子物体fitter")
	removeAllChildren(var_34_0)

	local var_34_1 = GetOrAddComponent(var_34_0, "PaintingScaler")

	var_34_1.FrameName = arg_34_2 or ""
	var_34_1.Tween = 1

	local var_34_2 = arg_34_1

	if not arg_34_3 and checkABExist("painting/" .. arg_34_1 .. "_n") and PlayerPrefs.GetInt("paint_hide_other_obj_" .. arg_34_1, 0) ~= 0 then
		arg_34_1 = arg_34_1 .. "_n"
	end

	PoolMgr.GetInstance():GetPainting(arg_34_1, false, function(arg_35_0)
		setParent(arg_35_0, var_34_0, false)

		local var_35_0 = findTF(arg_35_0, "Touch")

		if not IsNil(var_35_0) then
			setActive(var_35_0, false)
		end

		local var_35_1 = findTF(arg_35_0, "hx")

		if not IsNil(var_35_1) then
			setActive(var_35_1, HXSet.isHx())
		end

		ShipExpressionHelper.SetExpression(var_34_0:GetChild(0), var_34_2)
	end)
end

local var_0_2 = {}

function setPaintingPrefabAsync(arg_36_0, arg_36_1, arg_36_2, arg_36_3, arg_36_4)
	local var_36_0 = arg_36_1

	if checkABExist("painting/" .. arg_36_1 .. "_n") and PlayerPrefs.GetInt("paint_hide_other_obj_" .. arg_36_1, 0) ~= 0 then
		arg_36_1 = arg_36_1 .. "_n"
	end

	LoadPaintingPrefabAsync(arg_36_0, var_36_0, arg_36_1, arg_36_2, arg_36_3)
end

function LoadPaintingPrefabAsync(arg_37_0, arg_37_1, arg_37_2, arg_37_3, arg_37_4)
	local var_37_0 = findTF(arg_37_0, "fitter")

	assert(var_37_0, "请添加子物体fitter")
	removeAllChildren(var_37_0)

	local var_37_1 = GetOrAddComponent(var_37_0, "PaintingScaler")

	var_37_1.FrameName = arg_37_3 or ""
	var_37_1.Tween = 1
	var_0_2[arg_37_0] = arg_37_2

	PoolMgr.GetInstance():GetPainting(arg_37_2, true, function(arg_38_0)
		if IsNil(arg_37_0) or var_0_2[arg_37_0] ~= arg_37_2 then
			PoolMgr.GetInstance():ReturnPainting(arg_37_2, arg_38_0)

			return
		else
			setParent(arg_38_0, var_37_0, false)

			var_0_2[arg_37_0] = nil

			ShipExpressionHelper.SetExpression(arg_38_0, arg_37_1)
		end

		local var_38_0 = findTF(arg_38_0, "Touch")

		if not IsNil(var_38_0) then
			setActive(var_38_0, false)
		end

		local var_38_1 = findTF(arg_38_0, "Drag")

		if not IsNil(var_38_1) then
			setActive(var_38_1, false)
		end

		local var_38_2 = findTF(arg_38_0, "hx")

		if not IsNil(var_38_2) then
			setActive(var_38_2, HXSet.isHx())
		end

		if arg_37_4 then
			arg_37_4()
		end
	end)
end

function retPaintingPrefab(arg_39_0, arg_39_1, arg_39_2)
	if arg_39_0 and arg_39_1 then
		local var_39_0 = findTF(arg_39_0, "fitter")

		if var_39_0 and var_39_0.childCount > 0 then
			local var_39_1 = var_39_0:GetChild(0)

			if not IsNil(var_39_1) then
				local var_39_2 = findTF(var_39_1, "Touch")

				if not IsNil(var_39_2) then
					eachChild(var_39_2, function(arg_40_0)
						local var_40_0 = arg_40_0:GetComponent(typeof(Button))

						if not IsNil(var_40_0) then
							removeOnButton(arg_40_0)
						end
					end)
				end

				if not arg_39_2 then
					PoolMgr.GetInstance():ReturnPainting(string.gsub(var_39_1.name, "%(Clone%)", ""), var_39_1.gameObject)
				else
					PoolMgr.GetInstance():ReturnPaintingWithPrefix(string.gsub(var_39_1.name, "%(Clone%)", ""), var_39_1.gameObject, arg_39_2)
				end
			end
		end

		var_0_2[arg_39_0] = nil
	end
end

function checkPaintingPrefab(arg_41_0, arg_41_1, arg_41_2, arg_41_3, arg_41_4)
	local var_41_0 = findTF(arg_41_0, "fitter")

	assert(var_41_0, "请添加子物体fitter")
	removeAllChildren(var_41_0)

	local var_41_1 = GetOrAddComponent(var_41_0, "PaintingScaler")

	var_41_1.FrameName = arg_41_2 or ""
	var_41_1.Tween = 1

	local var_41_2 = arg_41_4 or "painting/"
	local var_41_3 = arg_41_1

	if not arg_41_3 and checkABExist(var_41_2 .. arg_41_1 .. "_n") and PlayerPrefs.GetInt("paint_hide_other_obj_" .. arg_41_1, 0) ~= 0 then
		arg_41_1 = arg_41_1 .. "_n"
	end

	return var_41_0, arg_41_1, var_41_3
end

function onLoadedPaintingPrefab(arg_42_0)
	local var_42_0 = arg_42_0.paintingTF
	local var_42_1 = arg_42_0.fitterTF
	local var_42_2 = arg_42_0.defaultPaintingName

	setParent(var_42_0, var_42_1, false)

	local var_42_3 = findTF(var_42_0, "Touch")

	if not IsNil(var_42_3) then
		setActive(var_42_3, false)
	end

	local var_42_4 = findTF(var_42_0, "hx")

	if not IsNil(var_42_4) then
		setActive(var_42_4, HXSet.isHx())
	end

	ShipExpressionHelper.SetExpression(var_42_1:GetChild(0), var_42_2)
end

function onLoadedPaintingPrefabAsync(arg_43_0)
	local var_43_0 = arg_43_0.paintingTF
	local var_43_1 = arg_43_0.fitterTF
	local var_43_2 = arg_43_0.objectOrTransform
	local var_43_3 = arg_43_0.paintingName
	local var_43_4 = arg_43_0.defaultPaintingName
	local var_43_5 = arg_43_0.callback

	if IsNil(var_43_2) or var_0_2[var_43_2] ~= var_43_3 then
		PoolMgr.GetInstance():ReturnPainting(var_43_3, var_43_0)

		return
	else
		setParent(var_43_0, var_43_1, false)

		var_0_2[var_43_2] = nil

		ShipExpressionHelper.SetExpression(var_43_0, var_43_4)
	end

	local var_43_6 = findTF(var_43_0, "Touch")

	if not IsNil(var_43_6) then
		setActive(var_43_6, false)
	end

	local var_43_7 = findTF(var_43_0, "hx")

	if not IsNil(var_43_7) then
		setActive(var_43_7, HXSet.isHx())
	end

	if var_43_5 then
		var_43_5()
	end
end

function setCommanderPaintingPrefab(arg_44_0, arg_44_1, arg_44_2, arg_44_3)
	local var_44_0, var_44_1, var_44_2 = checkPaintingPrefab(arg_44_0, arg_44_1, arg_44_2, arg_44_3)

	PoolMgr.GetInstance():GetPaintingWithPrefix(var_44_1, false, function(arg_45_0)
		local var_45_0 = {
			paintingTF = arg_45_0,
			fitterTF = var_44_0,
			defaultPaintingName = var_44_2
		}

		onLoadedPaintingPrefab(var_45_0)
	end, "commanderpainting/")
end

function setCommanderPaintingPrefabAsync(arg_46_0, arg_46_1, arg_46_2, arg_46_3, arg_46_4)
	local var_46_0, var_46_1, var_46_2 = checkPaintingPrefab(arg_46_0, arg_46_1, arg_46_2, arg_46_4)

	var_0_2[arg_46_0] = var_46_1

	PoolMgr.GetInstance():GetPaintingWithPrefix(var_46_1, true, function(arg_47_0)
		local var_47_0 = {
			paintingTF = arg_47_0,
			fitterTF = var_46_0,
			objectOrTransform = arg_46_0,
			paintingName = var_46_1,
			defaultPaintingName = var_46_2,
			callback = arg_46_3
		}

		onLoadedPaintingPrefabAsync(var_47_0)
	end, "commanderpainting/")
end

function retCommanderPaintingPrefab(arg_48_0, arg_48_1)
	retPaintingPrefab(arg_48_0, arg_48_1, "commanderpainting/")
end

function setMetaPaintingPrefab(arg_49_0, arg_49_1, arg_49_2, arg_49_3)
	local var_49_0, var_49_1, var_49_2 = checkPaintingPrefab(arg_49_0, arg_49_1, arg_49_2, arg_49_3)

	PoolMgr.GetInstance():GetPaintingWithPrefix(var_49_1, false, function(arg_50_0)
		local var_50_0 = {
			paintingTF = arg_50_0,
			fitterTF = var_49_0,
			defaultPaintingName = var_49_2
		}

		onLoadedPaintingPrefab(var_50_0)
	end, "metapainting/")
end

function setMetaPaintingPrefabAsync(arg_51_0, arg_51_1, arg_51_2, arg_51_3, arg_51_4)
	local var_51_0, var_51_1, var_51_2 = checkPaintingPrefab(arg_51_0, arg_51_1, arg_51_2, arg_51_4)

	var_0_2[arg_51_0] = var_51_1

	PoolMgr.GetInstance():GetPaintingWithPrefix(var_51_1, true, function(arg_52_0)
		local var_52_0 = {
			paintingTF = arg_52_0,
			fitterTF = var_51_0,
			objectOrTransform = arg_51_0,
			paintingName = var_51_1,
			defaultPaintingName = var_51_2,
			callback = arg_51_3
		}

		onLoadedPaintingPrefabAsync(var_52_0)
	end, "metapainting/")
end

function retMetaPaintingPrefab(arg_53_0, arg_53_1)
	retPaintingPrefab(arg_53_0, arg_53_1, "metapainting/")
end

function setGuildPaintingPrefab(arg_54_0, arg_54_1, arg_54_2, arg_54_3)
	local var_54_0, var_54_1, var_54_2 = checkPaintingPrefab(arg_54_0, arg_54_1, arg_54_2, arg_54_3)

	PoolMgr.GetInstance():GetPaintingWithPrefix(var_54_1, false, function(arg_55_0)
		local var_55_0 = {
			paintingTF = arg_55_0,
			fitterTF = var_54_0,
			defaultPaintingName = var_54_2
		}

		onLoadedPaintingPrefab(var_55_0)
	end, "guildpainting/")
end

function setGuildPaintingPrefabAsync(arg_56_0, arg_56_1, arg_56_2, arg_56_3, arg_56_4)
	local var_56_0, var_56_1, var_56_2 = checkPaintingPrefab(arg_56_0, arg_56_1, arg_56_2, arg_56_4)

	var_0_2[arg_56_0] = var_56_1

	PoolMgr.GetInstance():GetPaintingWithPrefix(var_56_1, true, function(arg_57_0)
		local var_57_0 = {
			paintingTF = arg_57_0,
			fitterTF = var_56_0,
			objectOrTransform = arg_56_0,
			paintingName = var_56_1,
			defaultPaintingName = var_56_2,
			callback = arg_56_3
		}

		onLoadedPaintingPrefabAsync(var_57_0)
	end, "guildpainting/")
end

function retGuildPaintingPrefab(arg_58_0, arg_58_1)
	retPaintingPrefab(arg_58_0, arg_58_1, "guildpainting/")
end

function setShopPaintingPrefab(arg_59_0, arg_59_1, arg_59_2, arg_59_3)
	local var_59_0, var_59_1, var_59_2 = checkPaintingPrefab(arg_59_0, arg_59_1, arg_59_2, arg_59_3)

	PoolMgr.GetInstance():GetPaintingWithPrefix(var_59_1, false, function(arg_60_0)
		local var_60_0 = {
			paintingTF = arg_60_0,
			fitterTF = var_59_0,
			defaultPaintingName = var_59_2
		}

		onLoadedPaintingPrefab(var_60_0)
	end, "shoppainting/")
end

function retShopPaintingPrefab(arg_61_0, arg_61_1)
	retPaintingPrefab(arg_61_0, arg_61_1, "shoppainting/")
end

function setBuildPaintingPrefabAsync(arg_62_0, arg_62_1, arg_62_2, arg_62_3, arg_62_4)
	local var_62_0, var_62_1, var_62_2 = checkPaintingPrefab(arg_62_0, arg_62_1, arg_62_2, arg_62_4)

	var_0_2[arg_62_0] = var_62_1

	PoolMgr.GetInstance():GetPaintingWithPrefix(var_62_1, true, function(arg_63_0)
		local var_63_0 = {
			paintingTF = arg_63_0,
			fitterTF = var_62_0,
			objectOrTransform = arg_62_0,
			paintingName = var_62_1,
			defaultPaintingName = var_62_2,
			callback = arg_62_3
		}

		onLoadedPaintingPrefabAsync(var_63_0)
	end, "buildpainting/")
end

function retBuildPaintingPrefab(arg_64_0, arg_64_1)
	retPaintingPrefab(arg_64_0, arg_64_1, "buildpainting/")
end

function setColorCount(arg_65_0, arg_65_1, arg_65_2)
	setText(arg_65_0, string.format(arg_65_1 < arg_65_2 and "<color=" .. COLOR_RED .. ">%d</color>/%d" or "%d/%d", arg_65_1, arg_65_2))
end

function setColorStr(arg_66_0, arg_66_1)
	return "<color=" .. arg_66_1 .. ">" .. arg_66_0 .. "</color>"
end

function setSizeStr(arg_67_0, arg_67_1)
	local var_67_0, var_67_1 = string.gsub(arg_67_0, "[<]size=%d+[>]", "<size=" .. arg_67_1 .. ">")

	if var_67_1 == 0 then
		var_67_0 = "<size=" .. arg_67_1 .. ">" .. var_67_0 .. "</size>"
	end

	return var_67_0
end

function getBgm(arg_68_0, arg_68_1)
	local var_68_0 = pg.voice_bgm[arg_68_0]

	if pg.CriMgr.GetInstance():IsDefaultBGM() then
		return var_68_0 and var_68_0.default_bgm or nil
	elseif var_68_0 then
		if var_68_0.special_bgm and type(var_68_0.special_bgm) == "table" and #var_68_0.special_bgm > 0 and _.all(var_68_0.special_bgm, function(arg_69_0)
			return type(arg_69_0) == "table" and #arg_69_0 > 2 and type(arg_69_0[2]) == "number"
		end) then
			local var_68_1 = Clone(var_68_0.special_bgm)

			table.sort(var_68_1, function(arg_70_0, arg_70_1)
				return arg_70_0[2] > arg_70_1[2]
			end)

			local var_68_2 = ""

			_.each(var_68_1, function(arg_71_0)
				if var_68_2 ~= "" then
					return
				end

				local var_71_0 = arg_71_0[1]
				local var_71_1 = arg_71_0[3]

				switch(var_71_0, {
					function()
						local var_72_0 = var_71_1[1]
						local var_72_1 = var_71_1[2]

						if #var_72_0 == 1 then
							if var_72_0[1] ~= "always" then
								return
							end
						elseif not pg.TimeMgr.GetInstance():inTime(var_72_0) then
							return
						end

						_.each(var_72_1, function(arg_73_0)
							if var_68_2 ~= "" then
								return
							end

							if #arg_73_0 == 2 and pg.TimeMgr.GetInstance():inPeriod(arg_73_0[1]) then
								var_68_2 = arg_73_0[2]
							elseif #arg_73_0 == 3 and pg.TimeMgr.GetInstance():inPeriod(arg_73_0[1], arg_73_0[2]) then
								var_68_2 = arg_73_0[3]
							end
						end)
					end,
					function()
						local var_74_0 = false
						local var_74_1 = ""

						_.each(var_71_1, function(arg_75_0)
							if #arg_75_0 ~= 2 or var_74_0 then
								return
							end

							if pg.NewStoryMgr.GetInstance():IsPlayed(arg_75_0[1]) then
								var_68_2 = arg_75_0[2]

								if var_68_2 ~= "" then
									var_74_1 = var_68_2
								else
									var_68_2 = var_74_1
								end
							else
								var_74_0 = true
							end
						end)
					end,
					function()
						if not arg_68_1 then
							return
						end

						_.each(var_71_1, function(arg_77_0)
							if #arg_77_0 == 2 and arg_77_0[1] == arg_68_1 then
								var_68_2 = arg_77_0[2]

								return
							end
						end)
					end
				})
			end)

			return var_68_2 ~= "" and var_68_2 or var_68_0.bgm
		else
			return var_68_0 and var_68_0.bgm or nil
		end
	else
		return nil
	end
end

function playStory(arg_78_0, arg_78_1)
	pg.NewStoryMgr.GetInstance():Play(arg_78_0, arg_78_1)
end

function errorMessage(arg_79_0)
	local var_79_0 = ERROR_MESSAGE[arg_79_0]

	if var_79_0 == nil then
		var_79_0 = ERROR_MESSAGE[9999] .. ":" .. arg_79_0
	end

	return var_79_0
end

function errorTip(arg_80_0, arg_80_1, ...)
	local var_80_0 = pg.gametip[arg_80_0 .. "_error"]
	local var_80_1

	if var_80_0 then
		var_80_1 = var_80_0.tip
	else
		var_80_1 = pg.gametip.common_error.tip
	end

	local var_80_2 = arg_80_0 .. "_error_" .. arg_80_1

	if pg.gametip[var_80_2] then
		local var_80_3 = i18n(var_80_2, ...)

		return var_80_1 .. var_80_3
	else
		local var_80_4 = "common_error_" .. arg_80_1

		if pg.gametip[var_80_4] then
			local var_80_5 = i18n(var_80_4, ...)

			return var_80_1 .. var_80_5
		else
			local var_80_6 = errorMessage(arg_80_1)

			return var_80_1 .. arg_80_1 .. ":" .. var_80_6
		end
	end
end

function colorNumber(arg_81_0, arg_81_1)
	local var_81_0 = "@COLOR_SCOPE"
	local var_81_1 = {}

	arg_81_0 = string.gsub(arg_81_0, "<color=#%x+>", function(arg_82_0)
		table.insert(var_81_1, arg_82_0)

		return var_81_0
	end)
	arg_81_0 = string.gsub(arg_81_0, "%d+%.?%d*%%*", function(arg_83_0)
		return "<color=" .. arg_81_1 .. ">" .. arg_83_0 .. "</color>"
	end)

	if #var_81_1 > 0 then
		local var_81_2 = 0

		return (string.gsub(arg_81_0, var_81_0, function(arg_84_0)
			var_81_2 = var_81_2 + 1

			return var_81_1[var_81_2]
		end))
	else
		return arg_81_0
	end
end

function getBounds(arg_85_0)
	local var_85_0 = LuaHelper.GetWorldCorners(rtf(arg_85_0))
	local var_85_1 = Bounds.New(var_85_0[0], Vector3.zero)

	var_85_1:Encapsulate(var_85_0[2])

	return var_85_1
end

local function var_0_3(arg_86_0, arg_86_1)
	arg_86_0.localScale = Vector3.one
	arg_86_0.anchorMin = Vector2.zero
	arg_86_0.anchorMax = Vector2.one
	arg_86_0.offsetMin = Vector2(arg_86_1[1], arg_86_1[2])
	arg_86_0.offsetMax = Vector2(-arg_86_1[3], -arg_86_1[4])
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
	},
	frame_dorm = {
		-16.5,
		-2.5,
		-3.5,
		-16.5
	}
}
local var_0_5 = {
	["IconColorful(Clone)"] = 1,
	["Item_duang5(Clone)"] = 99,
	specialFrame = 2
}

function setFrame(arg_87_0, arg_87_1, arg_87_2)
	arg_87_1 = tostring(arg_87_1)

	local var_87_0, var_87_1 = unpack((string.split(arg_87_1, "_")))

	if var_87_1 or tonumber(var_87_0) > 5 then
		arg_87_2 = arg_87_2 or "frame" .. arg_87_1
	end

	GetImageSpriteFromAtlasAsync("weaponframes", "frame", arg_87_0)

	local var_87_2 = arg_87_2 and Color.white or Color.NewHex(ItemRarity.Rarity2FrameHexColor(var_87_0 and tonumber(var_87_0) or ItemRarity.Gray))

	setImageColor(arg_87_0, var_87_2)

	local var_87_3 = findTF(arg_87_0, "specialFrame")

	if arg_87_2 then
		if var_87_3 then
			setActive(var_87_3, true)
		else
			var_87_3 = cloneTplTo(arg_87_0, arg_87_0, "specialFrame")

			removeAllChildren(var_87_3)
		end

		var_0_3(var_87_3, var_0_4[arg_87_2] or var_0_4.other)
		GetImageSpriteFromAtlasAsync("weaponframes", arg_87_2, var_87_3)
	elseif var_87_3 then
		setActive(var_87_3, false)
	end
end

function setIconColorful(arg_88_0, arg_88_1, arg_88_2, arg_88_3)
	arg_88_3 = arg_88_3 or {
		[ItemRarity.SSR] = {
			name = "IconColorful",
			active = function(arg_89_0, arg_89_1)
				return not arg_89_1.noIconColorful and arg_89_0 == ItemRarity.SSR
			end
		}
	}

	local var_88_0 = findTF(arg_88_0, "icon_bg/frame")

	for iter_88_0, iter_88_1 in pairs(arg_88_3) do
		local var_88_1 = iter_88_1.name
		local var_88_2 = iter_88_1.active(arg_88_1, arg_88_2)
		local var_88_3 = var_88_0:Find(var_88_1 .. "(Clone)")

		if var_88_3 then
			setActive(var_88_3, var_88_2)
		elseif var_88_2 then
			LoadAndInstantiateAsync("ui", string.lower(var_88_1), function(arg_90_0)
				if IsNil(arg_88_0) or var_88_0:Find(var_88_1 .. "(Clone)") then
					Object.Destroy(arg_90_0)
				else
					local var_90_0 = var_0_5[arg_90_0.name] or 999
					local var_90_1 = underscore.range(var_88_0.childCount):chain():map(function(arg_91_0)
						return var_88_0:GetChild(arg_91_0 - 1)
					end):map(function(arg_92_0)
						return var_0_5[arg_92_0.name] or 0
					end):value()
					local var_90_2 = 0

					for iter_90_0 = #var_90_1, 1, -1 do
						if var_90_0 > var_90_1[iter_90_0] then
							var_90_2 = iter_90_0

							break
						end
					end

					setParent(arg_90_0, var_88_0)
					tf(arg_90_0):SetSiblingIndex(var_90_2)
					setActive(arg_90_0, var_88_2)
				end
			end)
		end
	end
end

function setIconStars(arg_93_0, arg_93_1, arg_93_2)
	local var_93_0 = findTF(arg_93_0, "icon_bg/startpl")
	local var_93_1 = findTF(arg_93_0, "icon_bg/stars")

	if var_93_1 and var_93_0 then
		setActive(var_93_1, false)
		setActive(var_93_0, false)
	end

	if not var_93_1 or not arg_93_1 then
		return
	end

	for iter_93_0 = 1, math.max(arg_93_2, var_93_1.childCount) do
		setActive(iter_93_0 > var_93_1.childCount and cloneTplTo(var_93_0, var_93_1) or var_93_1:GetChild(iter_93_0 - 1), iter_93_0 <= arg_93_2)
	end

	setActive(var_93_1, true)
end

local function var_0_6(arg_94_0, arg_94_1)
	local var_94_0 = findTF(arg_94_0, "icon_bg/slv")

	if not IsNil(var_94_0) then
		setActive(var_94_0, arg_94_1 > 0)
		setText(findTF(var_94_0, "Text"), arg_94_1)
	end
end

function setIconName(arg_95_0, arg_95_1, arg_95_2)
	local var_95_0 = findTF(arg_95_0, "name")

	if not IsNil(var_95_0) then
		setText(var_95_0, arg_95_1)
		setTextAlpha(var_95_0, (arg_95_2.hideName or arg_95_2.anonymous) and 0 or 1)
	end
end

function setIconCount(arg_96_0, arg_96_1)
	local var_96_0 = findTF(arg_96_0, "icon_bg/count")

	if not IsNil(var_96_0) then
		setText(var_96_0, arg_96_1 and (type(arg_96_1) ~= "number" or arg_96_1 > 0) and arg_96_1 or "")
	end
end

function updateEquipment(arg_97_0, arg_97_1, arg_97_2)
	arg_97_2 = arg_97_2 or {}

	assert(arg_97_1, "equipmentVo can not be nil.")

	local var_97_0 = EquipmentRarity.Rarity2Print(arg_97_1:getConfig("rarity"))

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_97_0, findTF(arg_97_0, "icon_bg"))
	setFrame(findTF(arg_97_0, "icon_bg/frame"), var_97_0)

	local var_97_1 = findTF(arg_97_0, "icon_bg/icon")

	var_0_3(var_97_1, {
		16,
		16,
		16,
		16
	})
	GetImageSpriteFromAtlasAsync("equips/" .. arg_97_1:getConfig("icon"), "", var_97_1)
	setIconStars(arg_97_0, true, arg_97_1:getConfig("rarity"))
	var_0_6(arg_97_0, arg_97_1:getConfig("level") - 1)
	setIconName(arg_97_0, arg_97_1:getConfig("name"), arg_97_2)
	setIconCount(arg_97_0, arg_97_1.count)
	setIconColorful(arg_97_0, arg_97_1:getConfig("rarity") - 1, arg_97_2)
end

function updateItem(arg_98_0, arg_98_1, arg_98_2)
	arg_98_2 = arg_98_2 or {}

	local var_98_0 = ItemRarity.Rarity2Print(arg_98_1:getConfig("rarity"))

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_98_0, findTF(arg_98_0, "icon_bg"))

	local var_98_1

	if arg_98_1:getConfig("type") == 9 then
		var_98_1 = "frame_design"
	elseif arg_98_1:getConfig("type") == 100 then
		var_98_1 = "frame_dorm"
	elseif arg_98_2.frame then
		var_98_1 = arg_98_2.frame
	end

	setFrame(findTF(arg_98_0, "icon_bg/frame"), var_98_0, var_98_1)

	local var_98_2 = findTF(arg_98_0, "icon_bg/icon")
	local var_98_3 = arg_98_1.icon or arg_98_1:getConfig("icon")

	if arg_98_1:getConfig("type") == Item.LOVE_LETTER_TYPE then
		assert(arg_98_1.extra, "without extra data")

		var_98_3 = "SquareIcon/" .. ShipGroup.getDefaultSkin(arg_98_1.extra).prefab
	end

	GetImageSpriteFromAtlasAsync(var_98_3, "", var_98_2)
	setIconStars(arg_98_0, false)
	setIconName(arg_98_0, arg_98_1:getName(), arg_98_2)
	setIconColorful(arg_98_0, arg_98_1:getConfig("rarity"), arg_98_2)
end

function updateWorldItem(arg_99_0, arg_99_1, arg_99_2)
	arg_99_2 = arg_99_2 or {}

	local var_99_0 = ItemRarity.Rarity2Print(arg_99_1:getConfig("rarity"))

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_99_0, findTF(arg_99_0, "icon_bg"))
	setFrame(findTF(arg_99_0, "icon_bg/frame"), var_99_0)

	local var_99_1 = findTF(arg_99_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync(arg_99_1.icon or arg_99_1:getConfig("icon"), "", var_99_1)
	setIconStars(arg_99_0, false)
	setIconName(arg_99_0, arg_99_1:getConfig("name"), arg_99_2)
	setIconColorful(arg_99_0, arg_99_1:getConfig("rarity"), arg_99_2)
end

function updateWorldCollection(arg_100_0, arg_100_1, arg_100_2)
	arg_100_2 = arg_100_2 or {}

	assert(arg_100_1:getConfigTable(), "world_collection_file_template 和 world_collection_record_template 表中找不到配置: " .. arg_100_1.id)

	local var_100_0 = arg_100_1:getDropRarity()
	local var_100_1 = ItemRarity.Rarity2Print(var_100_0)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_100_1, findTF(arg_100_0, "icon_bg"))
	setFrame(findTF(arg_100_0, "icon_bg/frame"), var_100_1)

	local var_100_2 = findTF(arg_100_0, "icon_bg/icon")
	local var_100_3 = WorldCollectionProxy.GetCollectionType(arg_100_1.id) == WorldCollectionProxy.WorldCollectionType.FILE and "shoucangguangdie" or "shoucangjiaojuan"

	GetImageSpriteFromAtlasAsync("props/" .. var_100_3, "", var_100_2)
	setIconStars(arg_100_0, false)
	setIconName(arg_100_0, arg_100_1:getName(), arg_100_2)
	setIconColorful(arg_100_0, var_100_0, arg_100_2)
end

function updateWorldBuff(arg_101_0, arg_101_1, arg_101_2)
	arg_101_2 = arg_101_2 or {}

	local var_101_0 = pg.world_SLGbuff_data[arg_101_1]

	assert(var_101_0, "找不到大世界buff配置: " .. arg_101_1)

	local var_101_1 = ItemRarity.Rarity2Print(ItemRarity.Gray)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_101_1, findTF(arg_101_0, "icon_bg"))
	setFrame(findTF(arg_101_0, "icon_bg/frame"), var_101_1)

	local var_101_2 = findTF(arg_101_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("world/buff/" .. var_101_0.icon, "", var_101_2)

	local var_101_3 = arg_101_0:Find("icon_bg/stars")

	if not IsNil(var_101_3) then
		setActive(var_101_3, false)
	end

	local var_101_4 = findTF(arg_101_0, "name")

	if not IsNil(var_101_4) then
		setText(var_101_4, var_101_0.name)
	end

	local var_101_5 = findTF(arg_101_0, "icon_bg/count")

	if not IsNil(var_101_5) then
		SetActive(var_101_5, false)
	end
end

function updateShip(arg_102_0, arg_102_1, arg_102_2)
	arg_102_2 = arg_102_2 or {}

	local var_102_0 = arg_102_1:rarity2bgPrint()
	local var_102_1 = arg_102_1:getPainting()

	if arg_102_2.anonymous then
		var_102_0 = "1"
		var_102_1 = "unknown"
	end

	if arg_102_2.unknown_small then
		var_102_1 = "unknown_small"
	end

	local var_102_2 = findTF(arg_102_0, "icon_bg/new")

	if var_102_2 then
		if arg_102_2.isSkin then
			setActive(var_102_2, not arg_102_2.isTimeLimit and arg_102_2.isNew)
		else
			setActive(var_102_2, arg_102_1.virgin)
		end
	end

	local var_102_3 = findTF(arg_102_0, "icon_bg/timelimit")

	if var_102_3 then
		setActive(var_102_3, arg_102_2.isTimeLimit)
	end

	local var_102_4 = findTF(arg_102_0, "icon_bg")

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. (arg_102_2.isSkin and "_skin" or var_102_0), var_102_4)

	local var_102_5 = findTF(arg_102_0, "icon_bg/frame")
	local var_102_6

	if arg_102_1.isNpc then
		var_102_6 = "frame_npc"
	elseif arg_102_1:ShowPropose() then
		var_102_6 = "frame_prop"

		if arg_102_1:isMetaShip() then
			var_102_6 = var_102_6 .. "_meta"
		end
	elseif arg_102_2.isSkin then
		var_102_6 = "frame_skin"
	end

	setFrame(var_102_5, var_102_0, var_102_6)

	if arg_102_2.gray then
		setGray(var_102_4, true, true)
	end

	local var_102_7 = findTF(arg_102_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync((arg_102_2.Q and "QIcon/" or "SquareIcon/") .. var_102_1, "", var_102_7)

	local var_102_8 = findTF(arg_102_0, "icon_bg/lv")

	if var_102_8 then
		setActive(var_102_8, not arg_102_1.isNpc)

		if not arg_102_1.isNpc then
			local var_102_9 = findTF(var_102_8, "Text")

			if var_102_9 and arg_102_1.level then
				setText(var_102_9, arg_102_1.level)
			end
		end
	end

	local var_102_10 = findTF(arg_102_0, "ship_type")

	if var_102_10 then
		setActive(var_102_10, true)
		setImageSprite(var_102_10, GetSpriteFromAtlas("shiptype", shipType2print(arg_102_1:getShipType())))
	end

	local var_102_11 = var_102_4:Find("npc")

	if not IsNil(var_102_11) then
		if var_102_2 and go(var_102_2).activeSelf then
			setActive(var_102_11, false)
		else
			setActive(var_102_11, arg_102_1:isActivityNpc())
		end
	end

	local var_102_12 = arg_102_0:Find("group_locked")

	if var_102_12 then
		setActive(var_102_12, not arg_102_2.isSkin and not getProxy(CollectionProxy):getShipGroup(arg_102_1.groupId))
	end

	setIconStars(arg_102_0, arg_102_2.initStar, arg_102_1:getStar())
	setIconName(arg_102_0, arg_102_2.isSkin and arg_102_1:GetSkinConfig().name or arg_102_1:getName(), arg_102_2)
	setIconColorful(arg_102_0, arg_102_2.isSkin and ItemRarity.Gold or arg_102_1:getRarity() - 1, arg_102_2)
end

function updateCommander(arg_103_0, arg_103_1, arg_103_2)
	arg_103_2 = arg_103_2 or {}

	local var_103_0 = arg_103_1:getDropRarity()
	local var_103_1 = ItemRarity.Rarity2Print(var_103_0)
	local var_103_2 = arg_103_1:getConfig("painting")

	if arg_103_2.anonymous then
		var_103_1 = 1
		var_103_2 = "unknown"
	end

	local var_103_3 = findTF(arg_103_0, "icon_bg")

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_103_1, var_103_3)

	local var_103_4 = findTF(arg_103_0, "icon_bg/frame")

	setFrame(var_103_4, var_103_1)

	if arg_103_2.gray then
		setGray(var_103_3, true, true)
	end

	local var_103_5 = findTF(arg_103_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("CommanderIcon/" .. var_103_2, "", var_103_5)
	setIconStars(arg_103_0, arg_103_2.initStar, 0)
	setIconName(arg_103_0, arg_103_1:getName(), arg_103_2)
end

function updateStrategy(arg_104_0, arg_104_1, arg_104_2)
	arg_104_2 = arg_104_2 or {}

	local var_104_0 = ItemRarity.Rarity2Print(ItemRarity.Gray)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_104_0, findTF(arg_104_0, "icon_bg"))
	setFrame(findTF(arg_104_0, "icon_bg/frame"), var_104_0)

	local var_104_1 = findTF(arg_104_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync((arg_104_1.isWorldBuff and "world/buff/" or "strategyicon/") .. arg_104_1:getIcon(), "", var_104_1)
	setIconStars(arg_104_0, false)
	setIconName(arg_104_0, arg_104_1:getName(), arg_104_2)
	setIconColorful(arg_104_0, ItemRarity.Gray, arg_104_2)
end

function updateFurniture(arg_105_0, arg_105_1, arg_105_2)
	arg_105_2 = arg_105_2 or {}

	local var_105_0 = arg_105_1:getDropRarity()
	local var_105_1 = ItemRarity.Rarity2Print(var_105_0)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_105_1, findTF(arg_105_0, "icon_bg"))
	setFrame(findTF(arg_105_0, "icon_bg/frame"), var_105_1)

	local var_105_2 = findTF(arg_105_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("furnitureicon/" .. arg_105_1:getIcon(), "", var_105_2)
	setIconStars(arg_105_0, false)
	setIconName(arg_105_0, arg_105_1:getName(), arg_105_2)
	setIconColorful(arg_105_0, var_105_0, arg_105_2)
end

function updateSpWeapon(arg_106_0, arg_106_1, arg_106_2)
	arg_106_2 = arg_106_2 or {}

	assert(arg_106_1, "spWeaponVO can not be nil.")
	assert(isa(arg_106_1, SpWeapon), "spWeaponVO is not Equipment.")

	local var_106_0 = ItemRarity.Rarity2Print(arg_106_1:GetRarity())

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_106_0, findTF(arg_106_0, "icon_bg"))
	setFrame(findTF(arg_106_0, "icon_bg/frame"), var_106_0)

	local var_106_1 = findTF(arg_106_0, "icon_bg/icon")

	var_0_3(var_106_1, {
		16,
		16,
		16,
		16
	})
	GetImageSpriteFromAtlasAsync(arg_106_1:GetIconPath(), "", var_106_1)
	setIconStars(arg_106_0, true, arg_106_1:GetRarity())
	var_0_6(arg_106_0, arg_106_1:GetLevel() - 1)
	setIconName(arg_106_0, arg_106_1:GetName(), arg_106_2)
	setIconCount(arg_106_0, arg_106_1.count)
	setIconColorful(arg_106_0, arg_106_1:GetRarity(), arg_106_2)
end

function UpdateSpWeaponSlot(arg_107_0, arg_107_1, arg_107_2)
	local var_107_0 = ItemRarity.Rarity2Print(arg_107_1:GetRarity())

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_107_0, findTF(arg_107_0, "Icon/Mask/icon_bg"))

	local var_107_1 = findTF(arg_107_0, "Icon/Mask/icon_bg/icon")

	arg_107_2 = arg_107_2 or {
		16,
		16,
		16,
		16
	}

	var_0_3(var_107_1, arg_107_2)
	GetImageSpriteFromAtlasAsync(arg_107_1:GetIconPath(), "", var_107_1)

	local var_107_2 = arg_107_1:GetLevel() - 1
	local var_107_3 = findTF(arg_107_0, "Icon/LV")

	setActive(var_107_3, var_107_2 > 0)
	setText(findTF(var_107_3, "Text"), var_107_2)
end

function updateDorm3dFurniture(arg_108_0, arg_108_1, arg_108_2)
	arg_108_2 = arg_108_2 or {}

	local var_108_0 = arg_108_1:getDropRarity()
	local var_108_1 = ItemRarity.Rarity2Print(var_108_0)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_108_1, findTF(arg_108_0, "icon_bg"))
	setFrame(findTF(arg_108_0, "icon_bg/frame"), var_108_1)

	local var_108_2 = findTF(arg_108_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync(arg_108_1:getIcon(), "", var_108_2)
	setIconStars(arg_108_0, false)
	setIconName(arg_108_0, arg_108_1:getName(), arg_108_2)
	setIconColorful(arg_108_0, var_108_0, arg_108_2)
end

function updateDorm3dGift(arg_109_0, arg_109_1, arg_109_2)
	arg_109_2 = arg_109_2 or {}

	local var_109_0 = arg_109_1:getDropRarity()
	local var_109_1 = ItemRarity.Rarity2Print(var_109_0) or ItemRarity.Gray

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_109_1, arg_109_0:Find("icon_bg"))
	setFrame(arg_109_0:Find("icon_bg/frame"), var_109_1)

	local var_109_2 = arg_109_0:Find("icon_bg/icon")

	GetImageSpriteFromAtlasAsync(arg_109_1:getIcon(), "", var_109_2)
	setIconStars(arg_109_0, false)
	setIconName(arg_109_0, arg_109_1:getName(), arg_109_2)
	setIconColorful(arg_109_0, var_109_0, arg_109_2)
end

function updateDorm3dSkin(arg_110_0, arg_110_1, arg_110_2)
	arg_110_2 = arg_110_2 or {}

	local var_110_0 = arg_110_1:getDropRarity()
	local var_110_1 = ItemRarity.Rarity2Print(var_110_0) or ItemRarity.Gray

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_110_1, arg_110_0:Find("icon_bg"))
	setFrame(arg_110_0:Find("icon_bg/frame"), var_110_1)

	local var_110_2 = arg_110_0:Find("icon_bg/icon")

	setIconStars(arg_110_0, false)
	setIconName(arg_110_0, arg_110_1:getName(), arg_110_2)
	setIconColorful(arg_110_0, var_110_0, arg_110_2)
end

function updateDorm3dIcon(arg_111_0, arg_111_1)
	local var_111_0 = arg_111_1:getDropRarityDorm()

	GetImageSpriteFromAtlasAsync("weaponframes", "dorm3d_" .. ItemRarity.Rarity2Print(var_111_0), arg_111_0)

	local var_111_1 = arg_111_0:Find("icon")

	GetImageSpriteFromAtlasAsync(arg_111_1:getIcon(), "", var_111_1)
	setText(arg_111_0:Find("count/Text"), "x" .. arg_111_1.count)
	setText(arg_111_0:Find("name/Text"), arg_111_1:getName())
end

local var_0_7

function findCullAndClipWorldRect(arg_112_0)
	if #arg_112_0 == 0 then
		return false
	end

	local var_112_0 = arg_112_0[1].canvasRect

	for iter_112_0 = 1, #arg_112_0 do
		var_112_0 = rectIntersect(var_112_0, arg_112_0[iter_112_0].canvasRect)
	end

	if var_112_0.width <= 0 or var_112_0.height <= 0 then
		return false
	end

	var_0_7 = var_0_7 or GameObject.Find("UICamera/Canvas").transform

	local var_112_1 = var_0_7:TransformPoint(Vector3(var_112_0.x, var_112_0.y, 0))
	local var_112_2 = var_0_7:TransformPoint(Vector3(var_112_0.x + var_112_0.width, var_112_0.y + var_112_0.height, 0))

	return true, Vector4(var_112_1.x, var_112_1.y, var_112_2.x, var_112_2.y)
end

function rectIntersect(arg_113_0, arg_113_1)
	local var_113_0 = math.max(arg_113_0.x, arg_113_1.x)
	local var_113_1 = math.min(arg_113_0.x + arg_113_0.width, arg_113_1.x + arg_113_1.width)
	local var_113_2 = math.max(arg_113_0.y, arg_113_1.y)
	local var_113_3 = math.min(arg_113_0.y + arg_113_0.height, arg_113_1.y + arg_113_1.height)

	if var_113_0 <= var_113_1 and var_113_2 <= var_113_3 then
		return var_0_0.Rect.New(var_113_0, var_113_2, var_113_1 - var_113_0, var_113_3 - var_113_2)
	end

	return var_0_0.Rect.New(0, 0, 0, 0)
end

function getDropInfo(arg_114_0)
	local var_114_0 = {}

	for iter_114_0, iter_114_1 in ipairs(arg_114_0) do
		local var_114_1 = Drop.Create(iter_114_1)

		var_114_1.count = var_114_1.count or 1

		if var_114_1.type == DROP_TYPE_EMOJI then
			table.insert(var_114_0, var_114_1:getName())
		else
			table.insert(var_114_0, var_114_1:getName() .. "x" .. var_114_1.count)
		end
	end

	return table.concat(var_114_0, "、")
end

function updateDrop(arg_115_0, arg_115_1, arg_115_2)
	Drop.Change(arg_115_1)

	arg_115_2 = arg_115_2 or {}

	local var_115_0 = {
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
	local var_115_1

	for iter_115_0, iter_115_1 in ipairs(var_115_0) do
		local var_115_2 = arg_115_0:Find(iter_115_1[1])

		if arg_115_1.type ~= iter_115_1[2] and not IsNil(var_115_2) then
			setActive(var_115_2, false)
		end
	end

	arg_115_0:Find("icon_bg/frame"):GetComponent(typeof(Image)).enabled = true

	setIconColorful(arg_115_0, arg_115_1:getDropRarity(), arg_115_2, {
		[ItemRarity.Gold] = {
			name = "Item_duang5",
			active = function(arg_116_0, arg_116_1)
				return arg_116_1.fromAwardLayer and arg_116_0 >= ItemRarity.Gold
			end
		}
	})
	var_0_3(findTF(arg_115_0, "icon_bg/icon"), {
		2,
		2,
		2,
		2
	})
	arg_115_1:UpdateDropTpl(arg_115_0, arg_115_2)
	setIconCount(arg_115_0, arg_115_2.count or arg_115_1:getCount())
end

function updateBuff(arg_117_0, arg_117_1, arg_117_2)
	arg_117_2 = arg_117_2 or {}

	local var_117_0 = ItemRarity.Rarity2Print(ItemRarity.Gray)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_117_0, findTF(arg_117_0, "icon_bg"))

	local var_117_1 = pg.benefit_buff_template[arg_117_1]

	setFrame(findTF(arg_117_0, "icon_bg/frame"), var_117_0)
	setText(findTF(arg_117_0, "icon_bg/count"), 1)

	local var_117_2 = findTF(arg_117_0, "icon_bg/icon")
	local var_117_3 = var_117_1.icon

	GetImageSpriteFromAtlasAsync(var_117_3, "", var_117_2)
	setIconStars(arg_117_0, false)
	setIconName(arg_117_0, var_117_1.name, arg_117_2)
	setIconColorful(arg_117_0, ItemRarity.Gold, arg_117_2)
end

function updateAttire(arg_118_0, arg_118_1, arg_118_2, arg_118_3)
	local var_118_0 = 4

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_118_0, findTF(arg_118_0, "icon_bg"))
	setFrame(findTF(arg_118_0, "icon_bg/frame"), var_118_0)

	local var_118_1 = findTF(arg_118_0, "icon_bg/icon")
	local var_118_2

	if arg_118_1 == AttireConst.TYPE_CHAT_FRAME then
		var_118_2 = "chat_frame"
	elseif arg_118_1 == AttireConst.TYPE_ICON_FRAME then
		var_118_2 = "icon_frame"
	end

	GetImageSpriteFromAtlasAsync("Props/" .. var_118_2, "", var_118_1)
	setIconName(arg_118_0, arg_118_2.name, arg_118_3)
end

function updateAttireCombatUI(arg_119_0, arg_119_1, arg_119_2, arg_119_3)
	local var_119_0 = arg_119_2.rare

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_119_0, findTF(arg_119_0, "icon_bg"))
	setFrame(findTF(arg_119_0, "icon_bg/frame"), var_119_0, "frame_battle_ui")

	local var_119_1 = findTF(arg_119_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("Props/" .. arg_119_2.display_icon, "", var_119_1)
	setIconName(arg_119_0, arg_119_2.name, arg_119_3)
end

function updateCover(arg_120_0, arg_120_1, arg_120_2)
	local var_120_0 = arg_120_1:getDropRarity()

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_120_0, findTF(arg_120_0, "icon_bg"))
	setFrame(findTF(arg_120_0, "icon_bg/frame"), var_120_0)

	local var_120_1 = findTF(arg_120_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync(arg_120_1:getIcon(), "", var_120_1)
	setIconName(arg_120_0, arg_120_1:getName(), arg_120_2)
	setIconStars(arg_120_0, false)
end

function updateEmoji(arg_121_0, arg_121_1, arg_121_2)
	local var_121_0 = findTF(arg_121_0, "icon_bg/icon")
	local var_121_1 = "icon_emoji"

	GetImageSpriteFromAtlasAsync("Props/" .. var_121_1, "", var_121_0)

	local var_121_2 = 4

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_121_2, findTF(arg_121_0, "icon_bg"))
	setFrame(findTF(arg_121_0, "icon_bg/frame"), var_121_2)
	setIconName(arg_121_0, arg_121_1.name, arg_121_2)
end

function updateEquipmentSkin(arg_122_0, arg_122_1, arg_122_2)
	arg_122_2 = arg_122_2 or {}

	local var_122_0 = EquipmentRarity.Rarity2Print(arg_122_1.rarity)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_122_0, findTF(arg_122_0, "icon_bg"))
	setFrame(findTF(arg_122_0, "icon_bg/frame"), var_122_0, "frame_skin")

	local var_122_1 = findTF(arg_122_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("equips/" .. arg_122_1.icon, "", var_122_1)
	setIconStars(arg_122_0, false)
	setIconName(arg_122_0, arg_122_1.name, arg_122_2)
	setIconCount(arg_122_0, arg_122_1.count)
	setIconColorful(arg_122_0, arg_122_1.rarity - 1, arg_122_2)
end

function NoPosMsgBox(arg_123_0, arg_123_1, arg_123_2, arg_123_3)
	local var_123_0
	local var_123_1 = {}

	if arg_123_1 then
		table.insert(var_123_1, {
			text = "text_noPos_clear",
			atuoClose = true,
			onCallback = arg_123_1
		})
	end

	if arg_123_2 then
		table.insert(var_123_1, {
			text = "text_noPos_buy",
			atuoClose = true,
			onCallback = arg_123_2
		})
	end

	if arg_123_3 then
		table.insert(var_123_1, {
			text = "text_noPos_intensify",
			atuoClose = true,
			onCallback = arg_123_3
		})
	end

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		hideYes = true,
		hideNo = true,
		content = arg_123_0,
		custom = var_123_1,
		weight = LayerWeightConst.TOP_LAYER
	})
end

function openDestroyEquip()
	if pg.m02:hasMediator(EquipmentMediator.__cname) then
		local var_124_0 = getProxy(ContextProxy):getCurrentContext():getContextByMediator(EquipmentMediator)

		if var_124_0 and var_124_0.data.shipId then
			pg.m02:sendNotification(GAME.REMOVE_LAYERS, {
				context = var_124_0
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
		local var_125_0 = getProxy(ContextProxy):getCurrentContext():getContextByMediator(EquipmentMediator)

		if var_125_0 and var_125_0.data.shipId then
			pg.m02:sendNotification(GAME.REMOVE_LAYERS, {
				context = var_125_0
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
		onClick = function(arg_128_0, arg_128_1)
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.SHIPINFO, {
				page = 3,
				shipId = arg_128_0.id,
				shipVOs = arg_128_1
			})
		end
	})
end

function GoShoppingMsgBox(arg_129_0, arg_129_1, arg_129_2)
	if arg_129_2 then
		local var_129_0 = ""

		for iter_129_0, iter_129_1 in ipairs(arg_129_2) do
			local var_129_1 = Item.getConfigData(iter_129_1[1])

			var_129_0 = var_129_0 .. i18n(iter_129_1[1] == 59001 and "text_noRes_info_tip" or "text_noRes_info_tip2", var_129_1.name, iter_129_1[2])

			if iter_129_0 < #arg_129_2 then
				var_129_0 = var_129_0 .. i18n("text_noRes_info_tip_link")
			end
		end

		if var_129_0 ~= "" then
			arg_129_0 = arg_129_0 .. "\n" .. i18n("text_noRes_tip", var_129_0)
		end
	end

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		content = arg_129_0,
		weight = LayerWeightConst.SECOND_LAYER,
		onYes = function()
			gotoChargeScene(arg_129_1, arg_129_2)
		end
	})
end

function shoppingBatch(arg_131_0, arg_131_1, arg_131_2, arg_131_3, arg_131_4)
	local var_131_0 = pg.shop_template[arg_131_0]

	assert(var_131_0, "shop_template中找不到商品id：" .. arg_131_0)

	local var_131_1 = getProxy(PlayerProxy):getData()[id2res(var_131_0.resource_type)]
	local var_131_2 = arg_131_1.price or var_131_0.resource_num
	local var_131_3 = math.floor(var_131_1 / var_131_2)

	var_131_3 = var_131_3 <= 0 and 1 or var_131_3
	var_131_3 = arg_131_2 ~= nil and arg_131_2 < var_131_3 and arg_131_2 or var_131_3

	local var_131_4 = true
	local var_131_5 = 1

	if var_131_0 ~= nil and arg_131_1.id then
		print(var_131_3 * var_131_0.num, "--", var_131_3)
		assert(Item.getConfigData(arg_131_1.id), "item config should be existence")

		local var_131_6 = Item.New({
			id = arg_131_1.id
		}):getConfig("name")

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			needCounter = true,
			type = MSGBOX_TYPE_SINGLE_ITEM,
			drop = {
				type = DROP_TYPE_ITEM,
				id = arg_131_1.id
			},
			addNum = var_131_0.num,
			maxNum = var_131_3 * var_131_0.num,
			defaultNum = var_131_0.num,
			numUpdate = function(arg_132_0, arg_132_1)
				var_131_5 = math.floor(arg_132_1 / var_131_0.num)

				local var_132_0 = var_131_5 * var_131_2

				if var_132_0 > var_131_1 then
					setText(arg_132_0, i18n(arg_131_3, var_132_0, arg_132_1, COLOR_RED, var_131_6))

					var_131_4 = false
				else
					setText(arg_132_0, i18n(arg_131_3, var_132_0, arg_132_1, COLOR_GREEN, var_131_6))

					var_131_4 = true
				end
			end,
			onYes = function()
				if var_131_4 then
					pg.m02:sendNotification(GAME.SHOPPING, {
						id = arg_131_0,
						count = var_131_5
					})
				elseif arg_131_4 then
					pg.TipsMgr.GetInstance():ShowTips(i18n(arg_131_4))
				else
					pg.TipsMgr.GetInstance():ShowTips(i18n("main_playerInfoLayer_error_changeNameNoGem"))
				end
			end
		})
	end
end

function shoppingBatchNewStyle(arg_134_0, arg_134_1, arg_134_2, arg_134_3, arg_134_4)
	local var_134_0 = pg.shop_template[arg_134_0]

	assert(var_134_0, "shop_template中找不到商品id：" .. arg_134_0)

	local var_134_1 = getProxy(PlayerProxy):getData()[id2res(var_134_0.resource_type)]
	local var_134_2 = arg_134_1.price or var_134_0.resource_num
	local var_134_3 = math.floor(var_134_1 / var_134_2)

	var_134_3 = var_134_3 <= 0 and 1 or var_134_3
	var_134_3 = arg_134_2 ~= nil and arg_134_2 < var_134_3 and arg_134_2 or var_134_3

	local var_134_4 = true
	local var_134_5 = 1

	if var_134_0 ~= nil and arg_134_1.id then
		print(var_134_3 * var_134_0.num, "--", var_134_3)
		assert(Item.getConfigData(arg_134_1.id), "item config should be existence")

		local var_134_6 = Item.New({
			id = arg_134_1.id
		}):getConfig("name")

		pg.NewStyleMsgboxMgr.GetInstance():Show(pg.NewStyleMsgboxMgr.TYPE_COMMON_SHOPPING, {
			drop = Drop.New({
				count = 1,
				type = DROP_TYPE_ITEM,
				id = arg_134_1.id
			}),
			price = var_134_2,
			addNum = var_134_0.num,
			maxNum = var_134_3 * var_134_0.num,
			defaultNum = var_134_0.num,
			numUpdate = function(arg_135_0, arg_135_1)
				var_134_5 = math.floor(arg_135_1 / var_134_0.num)

				local var_135_0 = var_134_5 * var_134_2

				if var_135_0 > var_134_1 then
					setTextInNewStyleBox(arg_135_0, i18n(arg_134_3, var_135_0, arg_135_1, COLOR_RED, var_134_6))

					var_134_4 = false
				else
					setTextInNewStyleBox(arg_135_0, i18n(arg_134_3, var_135_0, arg_135_1, "#238C40FF", var_134_6))

					var_134_4 = true
				end
			end,
			btnList = {
				{
					type = pg.NewStyleMsgboxMgr.BUTTON_TYPE.shopping,
					name = i18n("word_buy"),
					func = function()
						if var_134_4 then
							pg.m02:sendNotification(GAME.SHOPPING, {
								id = arg_134_0,
								count = var_134_5
							})
						elseif arg_134_4 then
							pg.TipsMgr.GetInstance():ShowTips(i18n(arg_134_4))
						else
							pg.TipsMgr.GetInstance():ShowTips(i18n("main_playerInfoLayer_error_changeNameNoGem"))
						end
					end,
					sound = SFX_CONFIRM
				}
			}
		})
	end
end

function gotoChargeScene(arg_137_0, arg_137_1)
	local var_137_0 = getProxy(ContextProxy)
	local var_137_1 = getProxy(ContextProxy):getCurrentContext()

	if instanceof(var_137_1.mediator, ChargeMediator) then
		var_137_1.mediator:getViewComponent():switchSubViewByTogger(arg_137_0)
	else
		pg.m02:sendNotification(GAME.GO_SCENE, SCENE.CHARGE, {
			wrap = arg_137_0 or ChargeScene.TYPE_ITEM,
			noRes = arg_137_1
		})
	end
end

function clearDrop(arg_138_0)
	local var_138_0 = findTF(arg_138_0, "icon_bg")
	local var_138_1 = findTF(arg_138_0, "icon_bg/frame")
	local var_138_2 = findTF(arg_138_0, "icon_bg/icon")
	local var_138_3 = findTF(arg_138_0, "icon_bg/icon/icon")

	clearImageSprite(var_138_0)
	clearImageSprite(var_138_1)
	clearImageSprite(var_138_2)

	if var_138_3 then
		clearImageSprite(var_138_3)
	end
end

local var_0_8 = {
	red = Color.New(1, 0.25, 0.25),
	blue = Color.New(0.11, 0.55, 0.64),
	yellow = Color.New(0.92, 0.52, 0)
}

function updateSkill(arg_139_0, arg_139_1, arg_139_2, arg_139_3)
	local var_139_0 = findTF(arg_139_0, "skill")
	local var_139_1 = findTF(arg_139_0, "lock")
	local var_139_2 = findTF(arg_139_0, "unknown")

	if arg_139_1 then
		setActive(var_139_0, true)
		setActive(var_139_2, false)
		setActive(var_139_1, not arg_139_2)
		LoadImageSpriteAsync("skillicon/" .. arg_139_1.icon, findTF(var_139_0, "icon"))

		local var_139_3 = arg_139_1.color or "blue"

		setText(findTF(var_139_0, "name"), shortenString(getSkillName(arg_139_1.id), arg_139_3 or 8))

		local var_139_4 = findTF(var_139_0, "level")

		setText(var_139_4, "LEVEL: " .. (arg_139_2 and arg_139_2.level or "??"))
		setTextColor(var_139_4, var_0_8[var_139_3])
	else
		setActive(var_139_0, false)
		setActive(var_139_2, true)
		setActive(var_139_1, false)
	end
end

local var_0_9 = true

function onBackButton(arg_140_0, arg_140_1, arg_140_2, arg_140_3)
	local var_140_0 = GetOrAddComponent(arg_140_1, "UILongPressTrigger")

	assert(arg_140_2, "callback should exist")

	var_140_0.longPressThreshold = defaultValue(arg_140_3, 1)

	local function var_140_1(arg_141_0)
		return function()
			if var_0_9 then
				pg.CriMgr.GetInstance():PlaySoundEffect_V3(SOUND_BACK)
			end

			local var_142_0, var_142_1 = arg_140_2()

			if var_142_0 then
				arg_141_0(var_142_1)
			end
		end
	end

	local var_140_2 = var_140_0.onReleased

	pg.DelegateInfo.Add(arg_140_0, var_140_2)
	var_140_2:RemoveAllListeners()
	var_140_2:AddListener(var_140_1(function(arg_143_0)
		arg_143_0:emit(BaseUI.ON_BACK)
	end))

	local var_140_3 = var_140_0.onLongPressed

	pg.DelegateInfo.Add(arg_140_0, var_140_3)
	var_140_3:RemoveAllListeners()
	var_140_3:AddListener(var_140_1(function(arg_144_0)
		arg_144_0:emit(BaseUI.ON_HOME)
	end))
end

function GetZeroTime()
	return pg.TimeMgr.GetInstance():GetNextTime(0, 0, 0)
end

function GetHalfHour()
	return pg.TimeMgr.GetInstance():GetNextTime(0, 0, 0, 1800)
end

function GetNextHour(arg_147_0)
	local var_147_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_147_1, var_147_2 = pg.TimeMgr.GetInstance():parseTimeFrom(var_147_0)

	return var_147_1 * 86400 + (var_147_2 + arg_147_0) * 3600
end

function GetPerceptualSize(arg_148_0)
	local function var_148_0(arg_149_0)
		if not arg_149_0 then
			return 0, 1
		elseif arg_149_0 > 240 then
			return 4, 1
		elseif arg_149_0 > 225 then
			return 3, 1
		elseif arg_149_0 > 192 then
			return 2, 1
		elseif arg_149_0 < 126 then
			return 1, 0.5
		else
			return 1, 1
		end
	end

	if type(arg_148_0) == "number" then
		return var_148_0(arg_148_0)
	end

	local var_148_1 = 1
	local var_148_2 = 0
	local var_148_3 = 0
	local var_148_4 = #arg_148_0

	while var_148_1 <= var_148_4 do
		local var_148_5 = string.byte(arg_148_0, var_148_1)
		local var_148_6, var_148_7 = var_148_0(var_148_5)

		var_148_1 = var_148_1 + var_148_6
		var_148_2 = var_148_2 + var_148_7
	end

	return var_148_2
end

function shortenString(arg_150_0, arg_150_1)
	local var_150_0 = 1
	local var_150_1 = 0
	local var_150_2 = 0
	local var_150_3 = #arg_150_0

	while var_150_0 <= var_150_3 do
		local var_150_4 = string.byte(arg_150_0, var_150_0)
		local var_150_5, var_150_6 = GetPerceptualSize(var_150_4)

		var_150_0 = var_150_0 + var_150_5
		var_150_1 = var_150_1 + var_150_6

		if arg_150_1 <= math.ceil(var_150_1) then
			var_150_2 = var_150_0

			break
		end
	end

	if var_150_2 == 0 or var_150_3 < var_150_2 then
		return arg_150_0
	end

	return string.sub(arg_150_0, 1, var_150_2 - 1) .. ".."
end

function shouldShortenString(arg_151_0, arg_151_1)
	local var_151_0 = 1
	local var_151_1 = 0
	local var_151_2 = 0
	local var_151_3 = #arg_151_0

	while var_151_0 <= var_151_3 do
		local var_151_4 = string.byte(arg_151_0, var_151_0)
		local var_151_5, var_151_6 = GetPerceptualSize(var_151_4)

		var_151_0 = var_151_0 + var_151_5
		var_151_1 = var_151_1 + var_151_6

		if arg_151_1 <= math.ceil(var_151_1) then
			var_151_2 = var_151_0

			break
		end
	end

	if var_151_2 == 0 or var_151_3 < var_151_2 then
		return false
	end

	return true
end

function nameValidityCheck(arg_152_0, arg_152_1, arg_152_2, arg_152_3)
	local var_152_0 = true
	local var_152_1, var_152_2 = utf8_to_unicode(arg_152_0)
	local var_152_3 = filterEgyUnicode(filterSpecChars(arg_152_0))
	local var_152_4 = wordVer(arg_152_0)

	if not checkSpaceValid(arg_152_0) then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_152_3[1]))

		var_152_0 = false
	elseif var_152_4 > 0 or var_152_3 ~= arg_152_0 then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_152_3[4]))

		var_152_0 = false
	elseif var_152_2 < arg_152_1 then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_152_3[2]))

		var_152_0 = false
	elseif arg_152_2 < var_152_2 then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_152_3[3]))

		var_152_0 = false
	end

	return var_152_0
end

function checkSpaceValid(arg_153_0)
	if PLATFORM_CODE == PLATFORM_US then
		return true
	end

	local var_153_0 = string.gsub(arg_153_0, " ", "")

	return arg_153_0 == string.gsub(var_153_0, "　", "")
end

function filterSpecChars(arg_154_0)
	local var_154_0 = {}
	local var_154_1 = 0
	local var_154_2 = 0
	local var_154_3 = 0
	local var_154_4 = 1

	while var_154_4 <= #arg_154_0 do
		local var_154_5 = string.byte(arg_154_0, var_154_4)

		if not var_154_5 then
			break
		end

		if var_154_5 >= 48 and var_154_5 <= 57 or var_154_5 >= 65 and var_154_5 <= 90 or var_154_5 == 95 or var_154_5 >= 97 and var_154_5 <= 122 then
			table.insert(var_154_0, string.char(var_154_5))
		elseif var_154_5 >= 228 and var_154_5 <= 233 then
			local var_154_6 = string.byte(arg_154_0, var_154_4 + 1)
			local var_154_7 = string.byte(arg_154_0, var_154_4 + 2)

			if var_154_6 and var_154_7 and var_154_6 >= 128 and var_154_6 <= 191 and var_154_7 >= 128 and var_154_7 <= 191 then
				var_154_4 = var_154_4 + 2

				table.insert(var_154_0, string.char(var_154_5, var_154_6, var_154_7))

				var_154_1 = var_154_1 + 1
			end
		elseif var_154_5 == 45 or var_154_5 == 40 or var_154_5 == 41 then
			table.insert(var_154_0, string.char(var_154_5))
		elseif var_154_5 == 194 then
			local var_154_8 = string.byte(arg_154_0, var_154_4 + 1)

			if var_154_8 == 183 then
				var_154_4 = var_154_4 + 1

				table.insert(var_154_0, string.char(var_154_5, var_154_8))

				var_154_1 = var_154_1 + 1
			end
		elseif var_154_5 == 239 then
			local var_154_9 = string.byte(arg_154_0, var_154_4 + 1)
			local var_154_10 = string.byte(arg_154_0, var_154_4 + 2)

			if var_154_9 == 188 and (var_154_10 == 136 or var_154_10 == 137) then
				var_154_4 = var_154_4 + 2

				table.insert(var_154_0, string.char(var_154_5, var_154_9, var_154_10))

				var_154_1 = var_154_1 + 1
			end
		elseif var_154_5 == 206 or var_154_5 == 207 then
			local var_154_11 = string.byte(arg_154_0, var_154_4 + 1)

			if var_154_5 == 206 and var_154_11 >= 177 or var_154_5 == 207 and var_154_11 <= 134 then
				var_154_4 = var_154_4 + 1

				table.insert(var_154_0, string.char(var_154_5, var_154_11))

				var_154_1 = var_154_1 + 1
			end
		elseif var_154_5 == 227 and PLATFORM_CODE == PLATFORM_JP then
			local var_154_12 = string.byte(arg_154_0, var_154_4 + 1)
			local var_154_13 = string.byte(arg_154_0, var_154_4 + 2)

			if var_154_12 and var_154_13 and var_154_12 > 128 and var_154_12 <= 191 and var_154_13 >= 128 and var_154_13 <= 191 then
				var_154_4 = var_154_4 + 2

				table.insert(var_154_0, string.char(var_154_5, var_154_12, var_154_13))

				var_154_2 = var_154_2 + 1
			end
		elseif var_154_5 >= 224 and PLATFORM_CODE == PLATFORM_KR then
			local var_154_14 = string.byte(arg_154_0, var_154_4 + 1)
			local var_154_15 = string.byte(arg_154_0, var_154_4 + 2)

			if var_154_14 and var_154_15 and var_154_14 >= 128 and var_154_14 <= 191 and var_154_15 >= 128 and var_154_15 <= 191 then
				var_154_4 = var_154_4 + 2

				table.insert(var_154_0, string.char(var_154_5, var_154_14, var_154_15))

				var_154_3 = var_154_3 + 1
			end
		elseif PLATFORM_CODE == PLATFORM_US then
			if var_154_4 ~= 1 and var_154_5 == 32 and string.byte(arg_154_0, var_154_4 + 1) ~= 32 then
				table.insert(var_154_0, string.char(var_154_5))
			end

			if var_154_5 >= 192 and var_154_5 <= 223 then
				local var_154_16 = string.byte(arg_154_0, var_154_4 + 1)

				var_154_4 = var_154_4 + 1

				if var_154_5 == 194 and var_154_16 and var_154_16 >= 128 then
					table.insert(var_154_0, string.char(var_154_5, var_154_16))
				elseif var_154_5 == 195 and var_154_16 and var_154_16 <= 191 then
					table.insert(var_154_0, string.char(var_154_5, var_154_16))
				end
			end
		end

		var_154_4 = var_154_4 + 1
	end

	return table.concat(var_154_0), var_154_1 + var_154_2 + var_154_3
end

function filterEgyUnicode(arg_155_0)
	arg_155_0 = string.gsub(arg_155_0, "\xF0\x93[\x80-\x8F][\x80-\xBF]", "")
	arg_155_0 = string.gsub(arg_155_0, "\xF0\x93\x90[\x80-\xAF]", "")

	return arg_155_0
end

function shiftPanel(arg_156_0, arg_156_1, arg_156_2, arg_156_3, arg_156_4, arg_156_5, arg_156_6, arg_156_7, arg_156_8)
	arg_156_3 = arg_156_3 or 0.2

	if arg_156_5 then
		LeanTween.cancel(go(arg_156_0))
	end

	local var_156_0 = rtf(arg_156_0)

	arg_156_1 = arg_156_1 or var_156_0.anchoredPosition.x
	arg_156_2 = arg_156_2 or var_156_0.anchoredPosition.y

	local var_156_1 = LeanTween.move(var_156_0, Vector3(arg_156_1, arg_156_2, 0), arg_156_3)

	arg_156_7 = arg_156_7 or LeanTweenType.easeInOutSine

	var_156_1:setEase(arg_156_7)

	if arg_156_4 then
		var_156_1:setDelay(arg_156_4)
	end

	if arg_156_6 then
		GetOrAddComponent(arg_156_0, "CanvasGroup").blocksRaycasts = false
	end

	var_156_1:setOnComplete(System.Action(function()
		if arg_156_8 then
			arg_156_8()
		end

		if arg_156_6 then
			GetOrAddComponent(arg_156_0, "CanvasGroup").blocksRaycasts = true
		end
	end))

	return var_156_1
end

function TweenValue(arg_158_0, arg_158_1, arg_158_2, arg_158_3, arg_158_4, arg_158_5, arg_158_6, arg_158_7)
	local var_158_0 = LeanTween.value(go(arg_158_0), arg_158_1, arg_158_2, arg_158_3):setOnUpdate(System.Action_float(function(arg_159_0)
		if arg_158_5 then
			arg_158_5(arg_159_0)
		end
	end)):setOnComplete(System.Action(function()
		if arg_158_6 then
			arg_158_6()
		end
	end)):setDelay(arg_158_4 or 0)

	if arg_158_7 and arg_158_7 > 0 then
		var_158_0:setRepeat(arg_158_7)
	end

	return var_158_0
end

function rotateAni(arg_161_0, arg_161_1, arg_161_2)
	return LeanTween.rotate(rtf(arg_161_0), 360 * arg_161_1, arg_161_2):setLoopClamp()
end

function blinkAni(arg_162_0, arg_162_1, arg_162_2, arg_162_3)
	return LeanTween.alpha(rtf(arg_162_0), arg_162_3 or 0, arg_162_1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong(arg_162_2 or 0)
end

function scaleAni(arg_163_0, arg_163_1, arg_163_2, arg_163_3)
	return LeanTween.scale(rtf(arg_163_0), arg_163_3 or 0, arg_163_1):setLoopPingPong(arg_163_2 or 0)
end

function floatAni(arg_164_0, arg_164_1, arg_164_2, arg_164_3)
	local var_164_0 = arg_164_0.localPosition.y + arg_164_1

	return LeanTween.moveY(rtf(arg_164_0), var_164_0, arg_164_2):setLoopPingPong(arg_164_3 or 0)
end

local var_0_10 = tostring

function tostring(arg_165_0)
	if arg_165_0 == nil then
		return "nil"
	end

	local var_165_0 = var_0_10(arg_165_0)

	if var_165_0 == nil then
		if type(arg_165_0) == "table" then
			return "{}"
		end

		return " ~nil"
	end

	return var_165_0
end

function wordVer(arg_166_0, arg_166_1)
	if arg_166_0.match(arg_166_0, ChatConst.EmojiCodeMatch) then
		return 0, arg_166_0
	end

	arg_166_1 = arg_166_1 or {}

	local var_166_0 = filterEgyUnicode(arg_166_0)

	if #var_166_0 ~= #arg_166_0 then
		if arg_166_1.isReplace then
			arg_166_0 = var_166_0
		else
			return 1
		end
	end

	local var_166_1 = wordSplit(arg_166_0)
	local var_166_2 = pg.word_template
	local var_166_3 = pg.word_legal_template

	arg_166_1.isReplace = arg_166_1.isReplace or false
	arg_166_1.replaceWord = arg_166_1.replaceWord or "*"

	local var_166_4 = #var_166_1
	local var_166_5 = 1
	local var_166_6 = ""
	local var_166_7 = 0

	while var_166_5 <= var_166_4 do
		local var_166_8, var_166_9, var_166_10 = wordLegalMatch(var_166_1, var_166_3, var_166_5)

		if var_166_8 then
			var_166_5 = var_166_9
			var_166_6 = var_166_6 .. var_166_10
		else
			local var_166_11, var_166_12, var_166_13 = wordVerMatch(var_166_1, var_166_2, arg_166_1, var_166_5, "", false, var_166_5, "")

			if var_166_11 then
				var_166_5 = var_166_12
				var_166_7 = var_166_7 + 1

				if arg_166_1.isReplace then
					var_166_6 = var_166_6 .. var_166_13
				end
			else
				if arg_166_1.isReplace then
					var_166_6 = var_166_6 .. var_166_1[var_166_5]
				end

				var_166_5 = var_166_5 + 1
			end
		end
	end

	if arg_166_1.isReplace then
		return var_166_7, var_166_6
	else
		return var_166_7
	end
end

function wordLegalMatch(arg_167_0, arg_167_1, arg_167_2, arg_167_3, arg_167_4)
	if arg_167_2 > #arg_167_0 then
		return arg_167_3, arg_167_2, arg_167_4
	end

	local var_167_0 = arg_167_0[arg_167_2]
	local var_167_1 = arg_167_1[var_167_0]

	arg_167_4 = arg_167_4 == nil and "" or arg_167_4

	if var_167_1 then
		if var_167_1.this then
			return wordLegalMatch(arg_167_0, var_167_1, arg_167_2 + 1, true, arg_167_4 .. var_167_0)
		else
			return wordLegalMatch(arg_167_0, var_167_1, arg_167_2 + 1, false, arg_167_4 .. var_167_0)
		end
	else
		return arg_167_3, arg_167_2, arg_167_4
	end
end

local var_0_11 = string.byte("a")
local var_0_12 = string.byte("z")
local var_0_13 = string.byte("A")
local var_0_14 = string.byte("Z")

local function var_0_15(arg_168_0)
	if not arg_168_0 then
		return arg_168_0
	end

	local var_168_0 = string.byte(arg_168_0)

	if var_168_0 > 128 then
		return
	end

	if var_168_0 >= var_0_11 and var_168_0 <= var_0_12 then
		return string.char(var_168_0 - 32)
	elseif var_168_0 >= var_0_13 and var_168_0 <= var_0_14 then
		return string.char(var_168_0 + 32)
	else
		return arg_168_0
	end
end

function wordVerMatch(arg_169_0, arg_169_1, arg_169_2, arg_169_3, arg_169_4, arg_169_5, arg_169_6, arg_169_7)
	if arg_169_3 > #arg_169_0 then
		return arg_169_5, arg_169_6, arg_169_7
	end

	local var_169_0 = arg_169_0[arg_169_3]
	local var_169_1 = arg_169_1[var_169_0]

	if var_169_1 then
		local var_169_2, var_169_3, var_169_4 = wordVerMatch(arg_169_0, var_169_1, arg_169_2, arg_169_3 + 1, arg_169_2.isReplace and arg_169_4 .. arg_169_2.replaceWord or arg_169_4, var_169_1.this or arg_169_5, var_169_1.this and arg_169_3 + 1 or arg_169_6, var_169_1.this and (arg_169_2.isReplace and arg_169_4 .. arg_169_2.replaceWord or arg_169_4) or arg_169_7)

		if var_169_2 then
			return var_169_2, var_169_3, var_169_4
		end
	end

	local var_169_5 = var_0_15(var_169_0)
	local var_169_6 = arg_169_1[var_169_5]

	if var_169_5 ~= var_169_0 and var_169_6 then
		local var_169_7, var_169_8, var_169_9 = wordVerMatch(arg_169_0, var_169_6, arg_169_2, arg_169_3 + 1, arg_169_2.isReplace and arg_169_4 .. arg_169_2.replaceWord or arg_169_4, var_169_6.this or arg_169_5, var_169_6.this and arg_169_3 + 1 or arg_169_6, var_169_6.this and (arg_169_2.isReplace and arg_169_4 .. arg_169_2.replaceWord or arg_169_4) or arg_169_7)

		if var_169_7 then
			return var_169_7, var_169_8, var_169_9
		end
	end

	return arg_169_5, arg_169_6, arg_169_7
end

function wordSplit(arg_170_0)
	local var_170_0 = {}

	for iter_170_0 in arg_170_0.gmatch(arg_170_0, "[\x01-\x7F\xC2-\xF4][\x80-\xBF]*") do
		var_170_0[#var_170_0 + 1] = iter_170_0
	end

	return var_170_0
end

function contentWrap(arg_171_0, arg_171_1, arg_171_2)
	local var_171_0 = LuaHelper.WrapContent(arg_171_0, arg_171_1, arg_171_2)

	return #var_171_0 ~= #arg_171_0, var_171_0
end

function cancelRich(arg_172_0)
	local var_172_0

	for iter_172_0 = 1, 20 do
		local var_172_1

		arg_172_0, var_172_1 = string.gsub(arg_172_0, "<([^>]*)>", "%1")

		if var_172_1 <= 0 then
			break
		end
	end

	return arg_172_0
end

function cancelColorRich(arg_173_0)
	local var_173_0

	for iter_173_0 = 1, 20 do
		local var_173_1

		arg_173_0, var_173_1 = string.gsub(arg_173_0, "<color=#[a-zA-Z0-9]+>(.-)</color>", "%1")

		if var_173_1 <= 0 then
			break
		end
	end

	return arg_173_0
end

function getSkillConfig(arg_174_0)
	local var_174_0 = require("GameCfg.buff.buff_" .. arg_174_0)

	if not var_174_0 then
		warning("找不到技能配置: " .. arg_174_0)

		return
	end

	local var_174_1 = Clone(var_174_0)

	var_174_1.name = getSkillName(arg_174_0)
	var_174_1.desc = HXSet.hxLan(var_174_1.desc)
	var_174_1.desc_get = HXSet.hxLan(var_174_1.desc_get)

	_.each(var_174_1, function(arg_175_0)
		arg_175_0.desc = HXSet.hxLan(arg_175_0.desc)
	end)

	return var_174_1
end

function getSkillName(arg_176_0)
	local var_176_0 = pg.skill_data_template[arg_176_0] or pg.skill_data_display[arg_176_0]

	if var_176_0 then
		return HXSet.hxLan(var_176_0.name)
	else
		return ""
	end
end

function getSkillDescGet(arg_177_0, arg_177_1)
	local var_177_0 = arg_177_1 and pg.skill_world_display[arg_177_0] and setmetatable({}, {
		__index = function(arg_178_0, arg_178_1)
			return pg.skill_world_display[arg_177_0][arg_178_1] or pg.skill_data_template[arg_177_0][arg_178_1]
		end
	}) or pg.skill_data_template[arg_177_0]

	if not var_177_0 then
		return ""
	end

	local var_177_1 = var_177_0.desc_get ~= "" and var_177_0.desc_get or var_177_0.desc

	for iter_177_0, iter_177_1 in pairs(var_177_0.desc_get_add) do
		local var_177_2 = setColorStr(iter_177_1[1], COLOR_GREEN)

		if iter_177_1[2] then
			var_177_2 = var_177_2 .. specialGSub(i18n("word_skill_desc_get"), "$1", setColorStr(iter_177_1[2], COLOR_GREEN))
		end

		var_177_1 = specialGSub(var_177_1, "$" .. iter_177_0, var_177_2)
	end

	return HXSet.hxLan(var_177_1)
end

function getSkillDescLearn(arg_179_0, arg_179_1, arg_179_2)
	local var_179_0 = arg_179_2 and pg.skill_world_display[arg_179_0] and setmetatable({}, {
		__index = function(arg_180_0, arg_180_1)
			return pg.skill_world_display[arg_179_0][arg_180_1] or pg.skill_data_template[arg_179_0][arg_180_1]
		end
	}) or pg.skill_data_template[arg_179_0]

	if not var_179_0 then
		return ""
	end

	local var_179_1 = var_179_0.desc

	if not var_179_0.desc_add then
		return HXSet.hxLan(var_179_1)
	end

	for iter_179_0, iter_179_1 in pairs(var_179_0.desc_add) do
		local var_179_2 = iter_179_1[arg_179_1][1]

		if iter_179_1[arg_179_1][2] then
			var_179_2 = var_179_2 .. specialGSub(i18n("word_skill_desc_learn"), "$1", iter_179_1[arg_179_1][2])
		end

		var_179_1 = specialGSub(var_179_1, "$" .. iter_179_0, setColorStr(var_179_2, COLOR_YELLOW))
	end

	return HXSet.hxLan(var_179_1)
end

function getSkillDesc(arg_181_0, arg_181_1, arg_181_2)
	local var_181_0 = arg_181_2 and pg.skill_world_display[arg_181_0] and setmetatable({}, {
		__index = function(arg_182_0, arg_182_1)
			return pg.skill_world_display[arg_181_0][arg_182_1] or pg.skill_data_template[arg_181_0][arg_182_1]
		end
	}) or pg.skill_data_template[arg_181_0]

	if not var_181_0 then
		return ""
	end

	local var_181_1 = var_181_0.desc

	if not var_181_0.desc_add then
		return HXSet.hxLan(var_181_1)
	end

	for iter_181_0, iter_181_1 in pairs(var_181_0.desc_add) do
		local var_181_2 = setColorStr(iter_181_1[arg_181_1][1], COLOR_GREEN)

		var_181_1 = specialGSub(var_181_1, "$" .. iter_181_0, var_181_2)
	end

	return HXSet.hxLan(var_181_1)
end

function specialGSub(arg_183_0, arg_183_1, arg_183_2)
	arg_183_0 = string.gsub(arg_183_0, "<color=#", "<color=NNN")
	arg_183_0 = string.gsub(arg_183_0, "#", "")
	arg_183_2 = string.gsub(arg_183_2, "%%", "%%%%")
	arg_183_0 = string.gsub(arg_183_0, arg_183_1, arg_183_2)
	arg_183_0 = string.gsub(arg_183_0, "<color=NNN", "<color=#")

	return arg_183_0
end

function topAnimation(arg_184_0, arg_184_1, arg_184_2, arg_184_3, arg_184_4, arg_184_5)
	local var_184_0 = {}

	arg_184_4 = arg_184_4 or 0.27

	local var_184_1 = 0.05

	if arg_184_0 then
		local var_184_2 = arg_184_0.transform.localPosition.x

		setAnchoredPosition(arg_184_0, {
			x = var_184_2 - 500
		})
		shiftPanel(arg_184_0, var_184_2, nil, 0.05, arg_184_4, true, true)
		setActive(arg_184_0, true)
	end

	setActive(arg_184_1, false)
	setActive(arg_184_2, false)
	setActive(arg_184_3, false)

	for iter_184_0 = 1, 3 do
		table.insert(var_184_0, LeanTween.delayedCall(arg_184_4 + 0.13 + var_184_1 * iter_184_0, System.Action(function()
			if arg_184_1 then
				setActive(arg_184_1, not arg_184_1.gameObject.activeSelf)
			end
		end)).uniqueId)
		table.insert(var_184_0, LeanTween.delayedCall(arg_184_4 + 0.02 + var_184_1 * iter_184_0, System.Action(function()
			if arg_184_2 then
				setActive(arg_184_2, not go(arg_184_2).activeSelf)
			end

			if arg_184_2 then
				setActive(arg_184_3, not go(arg_184_3).activeSelf)
			end
		end)).uniqueId)
	end

	if arg_184_5 then
		table.insert(var_184_0, LeanTween.delayedCall(arg_184_4 + 0.13 + var_184_1 * 3 + 0.1, System.Action(function()
			arg_184_5()
		end)).uniqueId)
	end

	return var_184_0
end

function cancelTweens(arg_188_0)
	assert(arg_188_0, "must provide cancel targets, LeanTween.cancelAll is not allow")

	for iter_188_0, iter_188_1 in ipairs(arg_188_0) do
		if iter_188_1 then
			LeanTween.cancel(iter_188_1)
		end
	end
end

function getOfflineTimeStamp(arg_189_0)
	local var_189_0 = pg.TimeMgr.GetInstance():GetServerTime() - arg_189_0
	local var_189_1 = ""

	if var_189_0 <= 59 then
		var_189_1 = i18n("just_now")
	elseif var_189_0 <= 3599 then
		var_189_1 = i18n("several_minutes_before", math.floor(var_189_0 / 60))
	elseif var_189_0 <= 86399 then
		var_189_1 = i18n("several_hours_before", math.floor(var_189_0 / 3600))
	else
		var_189_1 = i18n("several_days_before", math.floor(var_189_0 / 86400))
	end

	return var_189_1
end

function playMovie(arg_190_0, arg_190_1, arg_190_2)
	local var_190_0 = GameObject.Find("OverlayCamera/Overlay/UITop/MoviePanel")

	if not IsNil(var_190_0) then
		pg.UIMgr.GetInstance():LoadingOn()
		WWWLoader.Inst:LoadStreamingAsset(arg_190_0, function(arg_191_0)
			pg.UIMgr.GetInstance():LoadingOff()

			local var_191_0 = GCHandle.Alloc(arg_191_0, GCHandleType.Pinned)

			setActive(var_190_0, true)

			local var_191_1 = var_190_0:AddComponent(typeof(CriManaMovieControllerForUI))

			var_191_1.player:SetData(arg_191_0, arg_191_0.Length)

			var_191_1.target = var_190_0:GetComponent(typeof(Image))
			var_191_1.loop = false
			var_191_1.additiveMode = false
			var_191_1.playOnStart = true

			local var_191_2

			var_191_2 = Timer.New(function()
				if var_191_1.player.status == CriMana.Player.Status.PlayEnd or var_191_1.player.status == CriMana.Player.Status.Stop or var_191_1.player.status == CriMana.Player.Status.Error then
					var_191_2:Stop()
					Object.Destroy(var_191_1)
					GCHandle.Free(var_191_0)
					setActive(var_190_0, false)

					if arg_190_1 then
						arg_190_1()
					end
				end
			end, 0.2, -1)

			var_191_2:Start()
			removeOnButton(var_190_0)

			if arg_190_2 then
				onButton(nil, var_190_0, function()
					var_191_1:Stop()
					GetOrAddComponent(var_190_0, typeof(Button)).onClick:RemoveAllListeners()
				end, SFX_CANCEL)
			end
		end)
	elseif arg_190_1 then
		arg_190_1()
	end
end

PaintCameraAdjustOn = false

function cameraPaintViewAdjust(arg_194_0)
	if PaintCameraAdjustOn ~= arg_194_0 then
		local var_194_0 = GameObject.Find("UICamera/Canvas"):GetComponent(typeof(CanvasScaler))

		if arg_194_0 then
			CameraMgr.instance.AutoAdapt = false

			CameraMgr.instance:Revert()

			var_194_0.screenMatchMode = CanvasScaler.ScreenMatchMode.MatchWidthOrHeight
			var_194_0.matchWidthOrHeight = 1
		else
			CameraMgr.instance.AutoAdapt = true
			CameraMgr.instance.CurrentWidth = 1
			CameraMgr.instance.CurrentHeight = 1
			CameraMgr.instance.AspectRatio = 1.7777777777777777
			var_194_0.screenMatchMode = CanvasScaler.ScreenMatchMode.Expand
		end

		PaintCameraAdjustOn = arg_194_0
	end
end

function ManhattonDist(arg_195_0, arg_195_1)
	return math.abs(arg_195_0.row - arg_195_1.row) + math.abs(arg_195_0.column - arg_195_1.column)
end

function checkFirstHelpShow(arg_196_0)
	local var_196_0 = getProxy(SettingsProxy)

	if not var_196_0:checkReadHelp(arg_196_0) then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip[arg_196_0].tip
		})
		var_196_0:recordReadHelp(arg_196_0)
	end
end

preOrientation = nil
preNotchFitterEnabled = false

function openPortrait(arg_197_0)
	enableNotch(arg_197_0, true)

	preOrientation = Input.deviceOrientation:ToString()

	originalPrint("Begining Orientation:" .. preOrientation)

	Screen.autorotateToPortrait = true
	Screen.autorotateToPortraitUpsideDown = true

	cameraPaintViewAdjust(true)
end

function closePortrait(arg_198_0)
	enableNotch(arg_198_0, false)

	Screen.autorotateToPortrait = false
	Screen.autorotateToPortraitUpsideDown = false

	originalPrint("Closing Orientation:" .. preOrientation)

	Screen.orientation = ScreenOrientation.LandscapeLeft

	local var_198_0 = Timer.New(function()
		Screen.orientation = ScreenOrientation.AutoRotation
	end, 0.2, 1):Start()

	cameraPaintViewAdjust(false)
end

function enableNotch(arg_200_0, arg_200_1)
	if arg_200_0 == nil then
		return
	end

	local var_200_0 = arg_200_0:GetComponent("NotchAdapt")
	local var_200_1 = arg_200_0:GetComponent("AspectRatioFitter")

	var_200_0.enabled = arg_200_1

	if var_200_1 then
		if arg_200_1 then
			var_200_1.enabled = preNotchFitterEnabled
		else
			preNotchFitterEnabled = var_200_1.enabled
			var_200_1.enabled = false
		end
	end
end

function comma_value(arg_201_0)
	local var_201_0 = arg_201_0
	local var_201_1 = 0

	repeat
		local var_201_2

		var_201_0, var_201_2 = string.gsub(var_201_0, "^(-?%d+)(%d%d%d)", "%1,%2")
	until var_201_2 == 0

	return var_201_0
end

local var_0_16 = 0.2

function SwitchPanel(arg_202_0, arg_202_1, arg_202_2, arg_202_3, arg_202_4, arg_202_5)
	arg_202_3 = defaultValue(arg_202_3, var_0_16)

	if arg_202_5 then
		LeanTween.cancel(go(arg_202_0))
	end

	local var_202_0 = Vector3.New(tf(arg_202_0).localPosition.x, tf(arg_202_0).localPosition.y, tf(arg_202_0).localPosition.z)

	if arg_202_1 then
		var_202_0.x = arg_202_1
	end

	if arg_202_2 then
		var_202_0.y = arg_202_2
	end

	local var_202_1 = LeanTween.move(rtf(arg_202_0), var_202_0, arg_202_3):setEase(LeanTweenType.easeInOutSine)

	if arg_202_4 then
		var_202_1:setDelay(arg_202_4)
	end

	return var_202_1
end

function updateActivityTaskStatus(arg_203_0)
	local var_203_0 = arg_203_0:getConfig("config_id")
	local var_203_1, var_203_2 = getActivityTask(arg_203_0, true)

	if not var_203_2 then
		pg.m02:sendNotification(GAME.ACTIVITY_OPERATION, {
			cmd = 1,
			activity_id = arg_203_0.id
		})

		return true
	end

	return false
end

function updateCrusingActivityTask(arg_204_0)
	local var_204_0 = getProxy(TaskProxy)
	local var_204_1 = arg_204_0:getNDay()

	for iter_204_0, iter_204_1 in ipairs(arg_204_0:getConfig("config_data")) do
		local var_204_2 = pg.battlepass_task_group[iter_204_1]

		if var_204_1 >= var_204_2.time and underscore.any(underscore.flatten(var_204_2.task_group), function(arg_205_0)
			return var_204_0:getTaskVO(arg_205_0) == nil
		end) then
			pg.m02:sendNotification(GAME.CRUSING_CMD, {
				cmd = 1,
				activity_id = arg_204_0.id
			})

			return true
		end
	end

	return false
end

function setShipCardFrame(arg_206_0, arg_206_1, arg_206_2)
	arg_206_0.localScale = Vector3.one
	arg_206_0.anchorMin = Vector2.zero
	arg_206_0.anchorMax = Vector2.one

	local var_206_0 = arg_206_2 or arg_206_1

	GetImageSpriteFromAtlasAsync("shipframe", var_206_0, arg_206_0)

	local var_206_1 = pg.frame_resource[var_206_0]

	if var_206_1 then
		local var_206_2 = var_206_1.param

		arg_206_0.offsetMin = Vector2(var_206_2[1], var_206_2[2])
		arg_206_0.offsetMax = Vector2(var_206_2[3], var_206_2[4])
	else
		arg_206_0.offsetMin = Vector2.zero
		arg_206_0.offsetMax = Vector2.zero
	end
end

function setRectShipCardFrame(arg_207_0, arg_207_1, arg_207_2)
	arg_207_0.localScale = Vector3.one
	arg_207_0.anchorMin = Vector2.zero
	arg_207_0.anchorMax = Vector2.one

	setImageSprite(arg_207_0, GetSpriteFromAtlas("shipframeb", "b" .. (arg_207_2 or arg_207_1)))

	local var_207_0 = "b" .. (arg_207_2 or arg_207_1)
	local var_207_1 = pg.frame_resource[var_207_0]

	if var_207_1 then
		local var_207_2 = var_207_1.param

		arg_207_0.offsetMin = Vector2(var_207_2[1], var_207_2[2])
		arg_207_0.offsetMax = Vector2(var_207_2[3], var_207_2[4])
	else
		arg_207_0.offsetMin = Vector2.zero
		arg_207_0.offsetMax = Vector2.zero
	end
end

function setFrameEffect(arg_208_0, arg_208_1)
	if arg_208_1 then
		local var_208_0 = arg_208_1 .. "(Clone)"
		local var_208_1 = false

		eachChild(arg_208_0, function(arg_209_0)
			setActive(arg_209_0, arg_209_0.name == var_208_0)

			var_208_1 = var_208_1 or arg_209_0.name == var_208_0
		end)

		if not var_208_1 then
			LoadAndInstantiateAsync("effect", arg_208_1, function(arg_210_0)
				if IsNil(arg_208_0) or findTF(arg_208_0, var_208_0) then
					Object.Destroy(arg_210_0)
				else
					setParent(arg_210_0, arg_208_0)
					setActive(arg_210_0, true)
				end
			end)
		end
	end

	setActive(arg_208_0, arg_208_1)
end

function setProposeMarkIcon(arg_211_0, arg_211_1)
	local var_211_0 = arg_211_0:Find("proposeShipCard(Clone)")
	local var_211_1 = arg_211_1.propose and not arg_211_1:ShowPropose()

	if var_211_0 then
		setActive(var_211_0, var_211_1)
	elseif var_211_1 then
		pg.PoolMgr.GetInstance():GetUI("proposeShipCard", true, function(arg_212_0)
			if IsNil(arg_211_0) or arg_211_0:Find("proposeShipCard(Clone)") then
				pg.PoolMgr.GetInstance():ReturnUI("proposeShipCard", arg_212_0)
			else
				setParent(arg_212_0, arg_211_0, false)
			end
		end)
	end
end

function flushShipCard(arg_213_0, arg_213_1)
	local var_213_0 = arg_213_1:rarity2bgPrint()
	local var_213_1 = findTF(arg_213_0, "content/bg")

	GetImageSpriteFromAtlasAsync("bg/star_level_card_" .. var_213_0, "", var_213_1)

	local var_213_2 = findTF(arg_213_0, "content/ship_icon")
	local var_213_3 = arg_213_1 and {
		"shipYardIcon/" .. arg_213_1:getPainting(),
		arg_213_1:getPainting()
	} or {
		"shipYardIcon/unknown",
		""
	}

	GetImageSpriteFromAtlasAsync(var_213_3[1], var_213_3[2], var_213_2)

	local var_213_4 = arg_213_1:getShipType()
	local var_213_5 = findTF(arg_213_0, "content/info/top/type")

	GetImageSpriteFromAtlasAsync("shiptype", shipType2print(var_213_4), var_213_5)
	setText(findTF(arg_213_0, "content/dockyard/lv/Text"), defaultValue(arg_213_1.level, 1))

	local var_213_6 = arg_213_1:getStar()
	local var_213_7 = arg_213_1:getMaxStar()
	local var_213_8 = findTF(arg_213_0, "content/front/stars")

	setActive(var_213_8, true)

	local var_213_9 = findTF(var_213_8, "star_tpl")
	local var_213_10 = var_213_8.childCount

	for iter_213_0 = 1, Ship.CONFIG_MAX_STAR do
		local var_213_11 = var_213_10 < iter_213_0 and cloneTplTo(var_213_9, var_213_8) or var_213_8:GetChild(iter_213_0 - 1)

		setActive(var_213_11, iter_213_0 <= var_213_7)
		triggerToggle(var_213_11, iter_213_0 <= var_213_6)
	end

	local var_213_12 = findTF(arg_213_0, "content/front/frame")
	local var_213_13, var_213_14 = arg_213_1:GetFrameAndEffect()

	setShipCardFrame(var_213_12, var_213_0, var_213_13)
	setFrameEffect(findTF(arg_213_0, "content/front/bg_other"), var_213_14)
	setProposeMarkIcon(arg_213_0:Find("content/dockyard/propose"), arg_213_1)
end

function TweenItemAlphaAndWhite(arg_214_0)
	LeanTween.cancel(arg_214_0)

	local var_214_0 = GetOrAddComponent(arg_214_0, "CanvasGroup")

	var_214_0.alpha = 0

	LeanTween.alphaCanvas(var_214_0, 1, 0.2):setUseEstimatedTime(true)

	local var_214_1 = findTF(arg_214_0.transform, "white_mask")

	if var_214_1 then
		setActive(var_214_1, false)
	end
end

function ClearTweenItemAlphaAndWhite(arg_215_0)
	LeanTween.cancel(arg_215_0)

	GetOrAddComponent(arg_215_0, "CanvasGroup").alpha = 0
end

function getGroupOwnSkins(arg_216_0)
	local var_216_0 = {}
	local var_216_1 = getProxy(ShipSkinProxy):getSkinList()
	local var_216_2 = getProxy(CollectionProxy):getShipGroup(arg_216_0)

	if var_216_2 then
		local var_216_3 = ShipGroup.getSkinList(arg_216_0)

		for iter_216_0, iter_216_1 in ipairs(var_216_3) do
			if iter_216_1.skin_type == ShipSkin.SKIN_TYPE_DEFAULT or table.contains(var_216_1, iter_216_1.id) or iter_216_1.skin_type == ShipSkin.SKIN_TYPE_REMAKE and var_216_2.trans or iter_216_1.skin_type == ShipSkin.SKIN_TYPE_PROPOSE and var_216_2.married == 1 then
				var_216_0[iter_216_1.id] = true
			end
		end
	end

	return var_216_0
end

function split(arg_217_0, arg_217_1)
	local var_217_0 = {}

	if not arg_217_0 then
		return nil
	end

	local var_217_1 = #arg_217_0
	local var_217_2 = 1

	while var_217_2 <= var_217_1 do
		local var_217_3 = string.find(arg_217_0, arg_217_1, var_217_2)

		if var_217_3 == nil then
			table.insert(var_217_0, string.sub(arg_217_0, var_217_2, var_217_1))

			break
		end

		table.insert(var_217_0, string.sub(arg_217_0, var_217_2, var_217_3 - 1))

		if var_217_3 == var_217_1 then
			table.insert(var_217_0, "")

			break
		end

		var_217_2 = var_217_3 + 1
	end

	return var_217_0
end

function NumberToChinese(arg_218_0, arg_218_1)
	local var_218_0 = ""
	local var_218_1 = #arg_218_0

	for iter_218_0 = 1, var_218_1 do
		local var_218_2 = string.sub(arg_218_0, iter_218_0, iter_218_0)

		if var_218_2 ~= "0" or var_218_2 == "0" and not arg_218_1 then
			if arg_218_1 then
				if var_218_1 >= 2 then
					if iter_218_0 == 1 then
						if var_218_2 == "1" then
							var_218_0 = i18n("number_" .. 10)
						else
							var_218_0 = i18n("number_" .. var_218_2) .. i18n("number_" .. 10)
						end
					else
						var_218_0 = var_218_0 .. i18n("number_" .. var_218_2)
					end
				else
					var_218_0 = var_218_0 .. i18n("number_" .. var_218_2)
				end
			else
				var_218_0 = var_218_0 .. i18n("number_" .. var_218_2)
			end
		end
	end

	return var_218_0
end

function getActivityTask(arg_219_0, arg_219_1)
	local var_219_0 = getProxy(TaskProxy)
	local var_219_1 = arg_219_0:getConfig("config_data")
	local var_219_2 = arg_219_0:getNDay(arg_219_0.data1)
	local var_219_3
	local var_219_4
	local var_219_5

	for iter_219_0 = math.max(arg_219_0.data3, 1), math.min(var_219_2, #var_219_1) do
		local var_219_6 = _.flatten({
			var_219_1[iter_219_0]
		})

		for iter_219_1, iter_219_2 in ipairs(var_219_6) do
			local var_219_7 = var_219_0:getTaskById(iter_219_2)

			if var_219_7 then
				return var_219_7.id, var_219_7
			end

			if var_219_4 then
				var_219_5 = var_219_0:getFinishTaskById(iter_219_2)

				if var_219_5 then
					var_219_4 = var_219_5
				elseif arg_219_1 then
					return iter_219_2
				else
					return var_219_4.id, var_219_4
				end
			else
				var_219_4 = var_219_0:getFinishTaskById(iter_219_2)
				var_219_5 = var_219_5 or iter_219_2
			end
		end
	end

	if var_219_4 then
		return var_219_4.id, var_219_4
	else
		return var_219_5
	end
end

function setImageFromImage(arg_220_0, arg_220_1, arg_220_2)
	local var_220_0 = GetComponent(arg_220_0, "Image")

	var_220_0.sprite = GetComponent(arg_220_1, "Image").sprite

	if arg_220_2 then
		var_220_0:SetNativeSize()
	end
end

function skinTimeStamp(arg_221_0)
	local var_221_0, var_221_1, var_221_2, var_221_3 = pg.TimeMgr.GetInstance():parseTimeFrom(arg_221_0)

	if var_221_0 >= 1 then
		return i18n("limit_skin_time_day", var_221_0)
	elseif var_221_0 <= 0 and var_221_1 > 0 then
		return i18n("limit_skin_time_day_min", var_221_1, var_221_2)
	elseif var_221_0 <= 0 and var_221_1 <= 0 and (var_221_2 > 0 or var_221_3 > 0) then
		return i18n("limit_skin_time_min", math.max(var_221_2, 1))
	elseif var_221_0 <= 0 and var_221_1 <= 0 and var_221_2 <= 0 and var_221_3 <= 0 then
		return i18n("limit_skin_time_overtime")
	end
end

function skinCommdityTimeStamp(arg_222_0)
	local var_222_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_222_1 = math.max(arg_222_0 - var_222_0, 0)
	local var_222_2 = math.floor(var_222_1 / 86400)

	if var_222_2 > 0 then
		return i18n("time_remaining_tip") .. var_222_2 .. i18n("word_date")
	else
		local var_222_3 = math.floor(var_222_1 / 3600)

		if var_222_3 > 0 then
			return i18n("time_remaining_tip") .. var_222_3 .. i18n("word_hour")
		else
			local var_222_4 = math.floor(var_222_1 / 60)

			if var_222_4 > 0 then
				return i18n("time_remaining_tip") .. var_222_4 .. i18n("word_minute")
			else
				return i18n("time_remaining_tip") .. var_222_1 .. i18n("word_second")
			end
		end
	end
end

function InstagramTimeStamp(arg_223_0)
	local var_223_0 = pg.TimeMgr.GetInstance():GetServerTime() - arg_223_0
	local var_223_1 = var_223_0 / 86400

	if var_223_1 > 1 then
		return i18n("ins_word_day", math.floor(var_223_1))
	else
		local var_223_2 = var_223_0 / 3600

		if var_223_2 > 1 then
			return i18n("ins_word_hour", math.floor(var_223_2))
		else
			local var_223_3 = var_223_0 / 60

			if var_223_3 > 1 then
				return i18n("ins_word_minu", math.floor(var_223_3))
			else
				return i18n("ins_word_minu", 1)
			end
		end
	end
end

function InstagramReplyTimeStamp(arg_224_0)
	local var_224_0 = pg.TimeMgr.GetInstance():GetServerTime() - arg_224_0
	local var_224_1 = var_224_0 / 86400

	if var_224_1 > 1 then
		return i18n1(math.floor(var_224_1) .. "d")
	else
		local var_224_2 = var_224_0 / 3600

		if var_224_2 > 1 then
			return i18n1(math.floor(var_224_2) .. "h")
		else
			local var_224_3 = var_224_0 / 60

			if var_224_3 > 1 then
				return i18n1(math.floor(var_224_3) .. "min")
			else
				return i18n1("1min")
			end
		end
	end
end

function attireTimeStamp(arg_225_0)
	local var_225_0, var_225_1, var_225_2, var_225_3 = pg.TimeMgr.GetInstance():parseTimeFrom(arg_225_0)

	if var_225_0 <= 0 and var_225_1 <= 0 and var_225_2 <= 0 and var_225_3 <= 0 then
		return i18n("limit_skin_time_overtime")
	else
		return i18n("attire_time_stamp", var_225_0, var_225_1, var_225_2)
	end
end

function checkExist(arg_226_0, ...)
	local var_226_0 = {
		...
	}

	for iter_226_0, iter_226_1 in ipairs(var_226_0) do
		if arg_226_0 == nil then
			break
		end

		assert(type(arg_226_0) == "table", "type error : intermediate target should be table")
		assert(type(iter_226_1) == "table", "type error : param should be table")

		if type(arg_226_0[iter_226_1[1]]) == "function" then
			arg_226_0 = arg_226_0[iter_226_1[1]](arg_226_0, unpack(iter_226_1[2] or {}))
		else
			arg_226_0 = arg_226_0[iter_226_1[1]]
		end
	end

	return arg_226_0
end

function AcessWithinNull(arg_227_0, arg_227_1)
	if arg_227_0 == nil then
		return
	end

	assert(type(arg_227_0) == "table")

	return arg_227_0[arg_227_1]
end

function showRepairMsgbox()
	local var_228_0 = {
		text = i18n("msgbox_repair"),
		onCallback = function()
			if PathMgr.FileExists(Application.persistentDataPath .. "/hashes.csv") then
				BundleWizard.Inst:GetGroupMgr("DEFAULT_RES"):StartVerifyForLua()
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("word_no_cache"))
			end
		end
	}
	local var_228_1 = {
		text = i18n("msgbox_repair_l2d"),
		onCallback = function()
			if PathMgr.FileExists(Application.persistentDataPath .. "/hashes-live2d.csv") then
				BundleWizard.Inst:GetGroupMgr("L2D"):StartVerifyForLua()
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("word_no_cache"))
			end
		end
	}
	local var_228_2 = {
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
			var_228_2,
			var_228_1,
			var_228_0
		}
	})
end

function resourceVerify(arg_232_0, arg_232_1)
	if CSharpVersion > 35 then
		BundleWizard.Inst:GetGroupMgr("DEFAULT_RES"):StartVerifyForLua()

		return
	end

	local var_232_0 = Application.persistentDataPath .. "/hashes.csv"
	local var_232_1
	local var_232_2 = PathMgr.ReadAllLines(var_232_0)
	local var_232_3 = {}

	if arg_232_0 then
		setActive(arg_232_0, true)
	else
		pg.UIMgr.GetInstance():LoadingOn()
	end

	local function var_232_4()
		if arg_232_0 then
			setActive(arg_232_0, false)
		else
			pg.UIMgr.GetInstance():LoadingOff()
		end

		print(var_232_1)

		if var_232_1 then
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

	local var_232_5 = var_232_2.Length
	local var_232_6

	local function var_232_7(arg_235_0)
		if arg_235_0 < 0 then
			var_232_4()

			return
		end

		if arg_232_1 then
			setSlider(arg_232_1, 0, var_232_5, var_232_5 - arg_235_0)
		end

		local var_235_0 = string.split(var_232_2[arg_235_0], ",")
		local var_235_1 = var_235_0[1]
		local var_235_2 = var_235_0[3]
		local var_235_3 = PathMgr.getAssetBundle(var_235_1)

		if PathMgr.FileExists(var_235_3) then
			local var_235_4 = PathMgr.ReadAllBytes(PathMgr.getAssetBundle(var_235_1))

			if var_235_2 == HashUtil.CalcMD5(var_235_4) then
				onNextTick(function()
					var_232_7(arg_235_0 - 1)
				end)

				return
			end
		end

		var_232_1 = var_235_1

		var_232_4()
	end

	var_232_7(var_232_5 - 1)
end

function splitByWordEN(arg_237_0, arg_237_1)
	local var_237_0 = string.split(arg_237_0, " ")
	local var_237_1 = ""
	local var_237_2 = ""
	local var_237_3 = arg_237_1:GetComponent(typeof(RectTransform))
	local var_237_4 = arg_237_1:GetComponent(typeof(Text))
	local var_237_5 = var_237_3.rect.width

	for iter_237_0, iter_237_1 in ipairs(var_237_0) do
		local var_237_6 = var_237_2

		var_237_2 = var_237_2 == "" and iter_237_1 or var_237_2 .. " " .. iter_237_1

		setText(arg_237_1, var_237_2)

		if var_237_5 < var_237_4.preferredWidth then
			var_237_1 = var_237_1 == "" and var_237_6 or var_237_1 .. "\n" .. var_237_6
			var_237_2 = iter_237_1
		end

		if iter_237_0 >= #var_237_0 then
			var_237_1 = var_237_1 == "" and var_237_2 or var_237_1 .. "\n" .. var_237_2
		end
	end

	return var_237_1
end

function checkBirthFormat(arg_238_0)
	if #arg_238_0 ~= 8 then
		return false
	end

	local var_238_0 = 0
	local var_238_1 = #arg_238_0

	while var_238_0 < var_238_1 do
		local var_238_2 = string.byte(arg_238_0, var_238_0 + 1)

		if var_238_2 < 48 or var_238_2 > 57 then
			return false
		end

		var_238_0 = var_238_0 + 1
	end

	return true
end

function isHalfBodyLive2D(arg_239_0)
	local var_239_0 = {
		"biaoqiang",
		"z23",
		"lafei",
		"lingbo",
		"mingshi",
		"xuefeng"
	}

	return _.any(var_239_0, function(arg_240_0)
		return arg_240_0 == arg_239_0
	end)
end

function GetServerState(arg_241_0)
	local var_241_0 = -1
	local var_241_1 = 0
	local var_241_2 = 1
	local var_241_3 = 2
	local var_241_4 = NetConst.GetServerStateUrl()

	if PLATFORM_CODE == PLATFORM_CH then
		var_241_4 = string.gsub(var_241_4, "https", "http")
	end

	VersionMgr.Inst:WebRequest(var_241_4, function(arg_242_0, arg_242_1)
		local var_242_0 = true
		local var_242_1 = false

		for iter_242_0 in string.gmatch(arg_242_1, "\"state\":%d") do
			if iter_242_0 ~= "\"state\":1" then
				var_242_0 = false
			end

			var_242_1 = true
		end

		if not var_242_1 then
			var_242_0 = false
		end

		if arg_241_0 ~= nil then
			arg_241_0(var_242_0 and var_241_2 or var_241_1)
		end
	end)
end

function setScrollText(arg_243_0, arg_243_1)
	GetOrAddComponent(arg_243_0, "ScrollText"):SetText(arg_243_1)
end

function changeToScrollText(arg_244_0, arg_244_1)
	local var_244_0 = GetComponent(arg_244_0, typeof(Text))

	assert(var_244_0, "without component<Text>")

	local var_244_1 = arg_244_0:Find("subText")

	if not var_244_1 then
		var_244_1 = cloneTplTo(arg_244_0, arg_244_0, "subText")

		eachChild(arg_244_0, function(arg_245_0)
			setActive(arg_245_0, arg_245_0 == var_244_1)
		end)

		arg_244_0:GetComponent(typeof(Text)).enabled = false
	end

	setScrollText(var_244_1, arg_244_1)
end

local var_0_17
local var_0_18
local var_0_19
local var_0_20

local function var_0_21(arg_246_0, arg_246_1, arg_246_2)
	local var_246_0 = arg_246_0:Find("base")
	local var_246_1, var_246_2, var_246_3 = Equipment.GetInfoTrans(arg_246_1, arg_246_2)

	if arg_246_1.nextValue then
		local var_246_4 = {
			name = arg_246_1.name,
			type = arg_246_1.type,
			value = arg_246_1.nextValue
		}
		local var_246_5, var_246_6 = Equipment.GetInfoTrans(var_246_4, arg_246_2)

		var_246_2 = var_246_2 .. setColorStr("   >   " .. var_246_6, COLOR_GREEN)
	end

	setText(var_246_0:Find("name"), var_246_1)

	if var_246_3 then
		local var_246_7 = "<color=#afff72>(+" .. ys.Battle.BattleConst.UltimateBonus.AuxBoostValue * 100 .. "%)</color>"

		setText(var_246_0:Find("value"), var_246_2 .. var_246_7)
	else
		setText(var_246_0:Find("value"), var_246_2)
	end

	setActive(var_246_0:Find("value/up"), arg_246_1.compare and arg_246_1.compare > 0)
	setActive(var_246_0:Find("value/down"), arg_246_1.compare and arg_246_1.compare < 0)
	triggerToggle(var_246_0, arg_246_1.lock_open)

	if not arg_246_1.lock_open and arg_246_1.sub and #arg_246_1.sub > 0 then
		GetComponent(var_246_0, typeof(Toggle)).enabled = true
	else
		setActive(var_246_0:Find("name/close"), false)
		setActive(var_246_0:Find("name/open"), false)

		GetComponent(var_246_0, typeof(Toggle)).enabled = false
	end
end

local function var_0_22(arg_247_0, arg_247_1, arg_247_2, arg_247_3)
	var_0_21(arg_247_0, arg_247_2, arg_247_3)

	if not arg_247_2.sub or #arg_247_2.sub == 0 then
		return
	end

	var_0_19(arg_247_0:Find("subs"), arg_247_1, arg_247_2.sub, arg_247_3)
end

function var_0_19(arg_248_0, arg_248_1, arg_248_2, arg_248_3)
	removeAllChildren(arg_248_0)
	var_0_20(arg_248_0, arg_248_1, arg_248_2, arg_248_3)
end

function var_0_20(arg_249_0, arg_249_1, arg_249_2, arg_249_3)
	for iter_249_0, iter_249_1 in ipairs(arg_249_2) do
		local var_249_0 = cloneTplTo(arg_249_1, arg_249_0)

		var_0_22(var_249_0, arg_249_1, iter_249_1, arg_249_3)
	end
end

function updateEquipInfo(arg_250_0, arg_250_1, arg_250_2, arg_250_3)
	local var_250_0 = arg_250_0:Find("attr_tpl")

	var_0_19(arg_250_0:Find("attrs"), var_250_0, arg_250_1.attrs, arg_250_3)
	setActive(arg_250_0:Find("skill"), arg_250_2)

	if arg_250_2 then
		var_0_22(arg_250_0:Find("skill/attr"), var_250_0, {
			name = i18n("skill"),
			value = setColorStr(arg_250_2.name, "#FFDE00FF")
		}, arg_250_3)
		setText(arg_250_0:Find("skill/value/Text"), getSkillDescGet(arg_250_2.id))
	end

	setActive(arg_250_0:Find("weapon"), #arg_250_1.weapon.sub > 0)

	if #arg_250_1.weapon.sub > 0 then
		var_0_19(arg_250_0:Find("weapon"), var_250_0, {
			arg_250_1.weapon
		}, arg_250_3)
	end

	setActive(arg_250_0:Find("equip_info"), #arg_250_1.equipInfo.sub > 0)

	if #arg_250_1.equipInfo.sub > 0 then
		var_0_19(arg_250_0:Find("equip_info"), var_250_0, {
			arg_250_1.equipInfo
		}, arg_250_3)
	end

	var_0_22(arg_250_0:Find("part/attr"), var_250_0, {
		name = i18n("equip_info_23")
	}, arg_250_3)

	local var_250_1 = arg_250_0:Find("part/value")
	local var_250_2 = var_250_1:Find("label")
	local var_250_3 = {}
	local var_250_4 = {}

	if #arg_250_1.part[1] == 0 and #arg_250_1.part[2] == 0 then
		setmetatable(var_250_3, {
			__index = function(arg_251_0, arg_251_1)
				return true
			end
		})
		setmetatable(var_250_4, {
			__index = function(arg_252_0, arg_252_1)
				return true
			end
		})
	else
		for iter_250_0, iter_250_1 in ipairs(arg_250_1.part[1]) do
			var_250_3[iter_250_1] = true
		end

		for iter_250_2, iter_250_3 in ipairs(arg_250_1.part[2]) do
			var_250_4[iter_250_3] = true
		end
	end

	local var_250_5 = ShipType.MergeFengFanType(ShipType.FilterOverQuZhuType(ShipType.AllShipType), var_250_3, var_250_4)

	UIItemList.StaticAlign(var_250_1, var_250_2, #var_250_5, function(arg_253_0, arg_253_1, arg_253_2)
		arg_253_1 = arg_253_1 + 1

		if arg_253_0 == UIItemList.EventUpdate then
			local var_253_0 = var_250_5[arg_253_1]

			GetImageSpriteFromAtlasAsync("shiptype", ShipType.Type2CNLabel(var_253_0), arg_253_2)
			setActive(arg_253_2:Find("main"), var_250_3[var_253_0] and not var_250_4[var_253_0])
			setActive(arg_253_2:Find("sub"), var_250_4[var_253_0] and not var_250_3[var_253_0])
			setImageAlpha(arg_253_2, not var_250_3[var_253_0] and not var_250_4[var_253_0] and 0.3 or 1)
		end
	end)
end

function updateEquipUpgradeInfo(arg_254_0, arg_254_1, arg_254_2)
	local var_254_0 = arg_254_0:Find("attr_tpl")

	var_0_19(arg_254_0:Find("attrs"), var_254_0, arg_254_1.attrs, arg_254_2)
	setActive(arg_254_0:Find("weapon"), #arg_254_1.weapon.sub > 0)

	if #arg_254_1.weapon.sub > 0 then
		var_0_19(arg_254_0:Find("weapon"), var_254_0, {
			arg_254_1.weapon
		}, arg_254_2)
	end

	setActive(arg_254_0:Find("equip_info"), #arg_254_1.equipInfo.sub > 0)

	if #arg_254_1.equipInfo.sub > 0 then
		var_0_19(arg_254_0:Find("equip_info"), var_254_0, {
			arg_254_1.equipInfo
		}, arg_254_2)
	end
end

function setCanvasOverrideSorting(arg_255_0, arg_255_1)
	local var_255_0 = arg_255_0.parent

	arg_255_0:SetParent(pg.LayerWeightMgr.GetInstance().uiOrigin, false)

	if isActive(arg_255_0) then
		GetOrAddComponent(arg_255_0, typeof(Canvas)).overrideSorting = arg_255_1
	else
		setActive(arg_255_0, true)

		GetOrAddComponent(arg_255_0, typeof(Canvas)).overrideSorting = arg_255_1

		setActive(arg_255_0, false)
	end

	arg_255_0:SetParent(var_255_0, false)
end

function createNewGameObject(arg_256_0, arg_256_1)
	local var_256_0 = GameObject.New()

	if arg_256_0 then
		var_256_0.name = "model"
	end

	var_256_0.layer = arg_256_1 or Layer.UI

	return GetOrAddComponent(var_256_0, "RectTransform")
end

function CreateShell(arg_257_0)
	if type(arg_257_0) ~= "table" and type(arg_257_0) ~= "userdata" then
		return arg_257_0
	end

	local var_257_0 = setmetatable({
		__index = arg_257_0
	}, arg_257_0)

	return setmetatable({}, var_257_0)
end

function CameraFittingSettin(arg_258_0)
	local var_258_0 = GetComponent(arg_258_0, typeof(Camera))
	local var_258_1 = 1.7777777777777777
	local var_258_2 = Screen.width / Screen.height

	if var_258_2 < var_258_1 then
		local var_258_3 = var_258_2 / var_258_1

		var_258_0.rect = var_0_0.Rect.New(0, (1 - var_258_3) / 2, 1, var_258_3)
	end
end

function SwitchSpecialChar(arg_259_0, arg_259_1)
	if PLATFORM_CODE ~= PLATFORM_US then
		arg_259_0 = arg_259_0:gsub(" ", " ")
		arg_259_0 = arg_259_0:gsub("\t", "    ")
	end

	if not arg_259_1 then
		arg_259_0 = arg_259_0:gsub("\n", " ")
	end

	return arg_259_0
end

function AfterCheck(arg_260_0, arg_260_1)
	local var_260_0 = {}

	for iter_260_0, iter_260_1 in ipairs(arg_260_0) do
		var_260_0[iter_260_0] = iter_260_1[1]()
	end

	arg_260_1()

	for iter_260_2, iter_260_3 in ipairs(arg_260_0) do
		if var_260_0[iter_260_2] ~= iter_260_3[1]() then
			iter_260_3[2]()
		end

		var_260_0[iter_260_2] = iter_260_3[1]()
	end
end

function CompareFuncs(arg_261_0, arg_261_1)
	local var_261_0 = {}

	local function var_261_1(arg_262_0, arg_262_1)
		var_261_0[arg_262_0] = var_261_0[arg_262_0] or {}
		var_261_0[arg_262_0][arg_262_1] = var_261_0[arg_262_0][arg_262_1] or arg_261_0[arg_262_0](arg_262_1)

		return var_261_0[arg_262_0][arg_262_1]
	end

	return function(arg_263_0, arg_263_1)
		local var_263_0 = 1

		while var_263_0 <= #arg_261_0 do
			local var_263_1 = var_261_1(var_263_0, arg_263_0)
			local var_263_2 = var_261_1(var_263_0, arg_263_1)

			if var_263_1 == var_263_2 then
				var_263_0 = var_263_0 + 1
			else
				return var_263_1 < var_263_2
			end
		end

		return tobool(arg_261_1)
	end
end

function DropResultIntegration(arg_264_0)
	local var_264_0 = {}
	local var_264_1 = 1

	while var_264_1 <= #arg_264_0 do
		local var_264_2 = arg_264_0[var_264_1].type
		local var_264_3 = arg_264_0[var_264_1].id

		var_264_0[var_264_2] = var_264_0[var_264_2] or {}

		if var_264_0[var_264_2][var_264_3] then
			local var_264_4 = arg_264_0[var_264_0[var_264_2][var_264_3]]
			local var_264_5 = table.remove(arg_264_0, var_264_1)

			var_264_4.count = var_264_4.count + var_264_5.count
		else
			var_264_0[var_264_2][var_264_3] = var_264_1
			var_264_1 = var_264_1 + 1
		end
	end

	local var_264_6 = {
		function(arg_265_0)
			local var_265_0 = arg_265_0.type
			local var_265_1 = arg_265_0.id

			if var_265_0 == DROP_TYPE_SHIP then
				return 1
			elseif var_265_0 == DROP_TYPE_RESOURCE then
				if var_265_1 == 1 then
					return 2
				else
					return 3
				end
			elseif var_265_0 == DROP_TYPE_ITEM then
				if var_265_1 == 59010 then
					return 4
				elseif var_265_1 == 59900 then
					return 5
				else
					local var_265_2 = Item.getConfigData(var_265_1)
					local var_265_3 = var_265_2 and var_265_2.type or 0

					if var_265_3 == 9 then
						return 6
					elseif var_265_3 == 5 then
						return 7
					elseif var_265_3 == 4 then
						return 8
					elseif var_265_3 == 7 then
						return 9
					end
				end
			elseif var_265_0 == DROP_TYPE_VITEM and var_265_1 == 59011 then
				return 4
			end

			return 100
		end,
		function(arg_266_0)
			local var_266_0

			if arg_266_0.type == DROP_TYPE_SHIP then
				var_266_0 = pg.ship_data_statistics[arg_266_0.id]
			elseif arg_266_0.type == DROP_TYPE_ITEM then
				var_266_0 = Item.getConfigData(arg_266_0.id)
			end

			return (var_266_0 and var_266_0.rarity or 0) * -1
		end,
		function(arg_267_0)
			return arg_267_0.id
		end
	}

	table.sort(arg_264_0, CompareFuncs(var_264_6))
end

function getLoginConfig()
	local var_268_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_268_1 = 1

	for iter_268_0, iter_268_1 in ipairs(pg.login.all) do
		if pg.login[iter_268_1].date ~= "stop" then
			local var_268_2, var_268_3 = parseTimeConfig(pg.login[iter_268_1].date)

			assert(not var_268_3)

			if pg.TimeMgr.GetInstance():inTime(var_268_2, var_268_0) then
				var_268_1 = iter_268_1

				break
			end
		end
	end

	local var_268_4 = pg.login[var_268_1].login_static

	var_268_4 = var_268_4 ~= "" and var_268_4 or "login"

	local var_268_5 = pg.login[var_268_1].login_cri
	local var_268_6 = var_268_5 ~= "" and true or false
	local var_268_7 = pg.login[var_268_1].op_play == 1 and true or false
	local var_268_8 = pg.login[var_268_1].op_time

	if var_268_8 == "" or not pg.TimeMgr.GetInstance():inTime(var_268_8, var_268_0) then
		var_268_7 = false
	end

	local var_268_9 = var_268_8 == "" and var_268_8 or table.concat(var_268_8[1][1])

	return var_268_6, var_268_6 and var_268_5 or var_268_4, pg.login[var_268_1].bgm, var_268_7, var_268_9
end

function setIntimacyIcon(arg_269_0, arg_269_1, arg_269_2)
	local var_269_0 = {}
	local var_269_1

	seriesAsync({
		function(arg_270_0)
			if arg_269_0.childCount > 0 then
				var_269_1 = arg_269_0:GetChild(0)

				arg_270_0()
			else
				LoadAndInstantiateAsync("template", "intimacytpl", function(arg_271_0)
					var_269_1 = tf(arg_271_0)

					setParent(var_269_1, arg_269_0)
					arg_270_0()
				end)
			end
		end,
		function(arg_272_0)
			setImageAlpha(var_269_1, arg_269_2 and 0 or 1)
			eachChild(var_269_1, function(arg_273_0)
				setActive(arg_273_0, false)
			end)

			if arg_269_2 then
				local var_272_0 = var_269_1:Find(arg_269_2 .. "(Clone)")

				if not var_272_0 then
					LoadAndInstantiateAsync("ui", arg_269_2, function(arg_274_0)
						setParent(arg_274_0, var_269_1)
						setActive(arg_274_0, true)
					end)
				else
					setActive(var_272_0, true)
				end
			elseif arg_269_1 then
				setImageSprite(var_269_1, GetSpriteFromAtlas("energy", arg_269_1), true)
			else
				assert(false, "param error")
			end
		end
	})
end

local var_0_23

function nowWorld()
	var_0_23 = var_0_23 or getProxy(WorldProxy)

	return var_0_23 and var_0_23.world
end

function removeWorld()
	var_0_23.world:Dispose()

	var_0_23.world = nil
	var_0_23 = nil
end

function switch(arg_277_0, arg_277_1, arg_277_2, ...)
	if arg_277_1[arg_277_0] then
		return arg_277_1[arg_277_0](...)
	elseif arg_277_2 then
		return arg_277_2(...)
	end
end

function parseTimeConfig(arg_278_0)
	if type(arg_278_0[1]) == "table" then
		return arg_278_0[2], arg_278_0[1]
	else
		return arg_278_0
	end
end

local var_0_24 = {
	__add = function(arg_279_0, arg_279_1)
		return NewPos(arg_279_0.x + arg_279_1.x, arg_279_0.y + arg_279_1.y)
	end,
	__sub = function(arg_280_0, arg_280_1)
		return NewPos(arg_280_0.x - arg_280_1.x, arg_280_0.y - arg_280_1.y)
	end,
	__mul = function(arg_281_0, arg_281_1)
		if type(arg_281_1) == "number" then
			return NewPos(arg_281_0.x * arg_281_1, arg_281_0.y * arg_281_1)
		else
			return NewPos(arg_281_0.x * arg_281_1.x, arg_281_0.y * arg_281_1.y)
		end
	end,
	__eq = function(arg_282_0, arg_282_1)
		return arg_282_0.x == arg_282_1.x and arg_282_0.y == arg_282_1.y
	end,
	__tostring = function(arg_283_0)
		return arg_283_0.x .. "_" .. arg_283_0.y
	end
}

function NewPos(arg_284_0, arg_284_1)
	assert(arg_284_0 and arg_284_1)

	local var_284_0 = setmetatable({
		x = arg_284_0,
		y = arg_284_1
	}, var_0_24)

	function var_284_0.SqrMagnitude(arg_285_0)
		return arg_285_0.x * arg_285_0.x + arg_285_0.y * arg_285_0.y
	end

	function var_284_0.Normalize(arg_286_0)
		local var_286_0 = arg_286_0:SqrMagnitude()

		if var_286_0 > 1e-05 then
			return arg_286_0 * (1 / math.sqrt(var_286_0))
		else
			return NewPos(0, 0)
		end
	end

	return var_284_0
end

local var_0_25

function Timekeeping()
	warning(Time.realtimeSinceStartup - (var_0_25 or Time.realtimeSinceStartup), Time.realtimeSinceStartup)

	var_0_25 = Time.realtimeSinceStartup
end

function GetRomanDigit(arg_288_0)
	return (string.char(226, 133, 160 + (arg_288_0 - 1)))
end

function quickPlayAnimator(arg_289_0, arg_289_1)
	arg_289_0:GetComponent(typeof(Animator)):Play(arg_289_1, -1, 0)
end

function quickCheckAndPlayAnimator(arg_290_0, arg_290_1)
	local var_290_0 = arg_290_0:GetComponent(typeof(Animator))
	local var_290_1 = Animator.StringToHash(arg_290_1)

	if var_290_0:HasState(0, var_290_1) then
		var_290_0:Play(arg_290_1, -1, 0)
	end
end

function quickPlayAnimation(arg_291_0, arg_291_1)
	arg_291_0:GetComponent(typeof(Animation)):Play(arg_291_1)
end

function getSurveyUrl(arg_292_0)
	local var_292_0 = pg.survey_data_template[arg_292_0]
	local var_292_1

	if not IsUnityEditor then
		if PLATFORM_CODE == PLATFORM_CH then
			local var_292_2 = getProxy(UserProxy):GetCacheGatewayInServerLogined()

			if var_292_2 == PLATFORM_ANDROID then
				if LuaHelper.GetCHPackageType() == PACKAGE_TYPE_BILI then
					var_292_1 = var_292_0.main_url
				else
					var_292_1 = var_292_0.uo_url
				end
			elseif var_292_2 == PLATFORM_IPHONEPLAYER then
				var_292_1 = var_292_0.ios_url
			end
		elseif PLATFORM_CODE == PLATFORM_US or PLATFORM_CODE == PLATFORM_JP then
			var_292_1 = var_292_0.main_url
		end
	else
		var_292_1 = var_292_0.main_url
	end

	local var_292_3 = getProxy(PlayerProxy):getRawData().id
	local var_292_4 = getProxy(UserProxy):getRawData().arg2 or ""
	local var_292_5
	local var_292_6 = PLATFORM == PLATFORM_ANDROID and 1 or PLATFORM == PLATFORM_IPHONEPLAYER and 2 or 3
	local var_292_7 = getProxy(UserProxy):getRawData()
	local var_292_8 = getProxy(ServerProxy):getRawData()[var_292_7 and var_292_7.server or 0]
	local var_292_9 = var_292_8 and var_292_8.id or ""
	local var_292_10 = getProxy(PlayerProxy):getRawData().level
	local var_292_11 = var_292_3 .. "_" .. arg_292_0
	local var_292_12 = var_292_1
	local var_292_13 = {
		var_292_3,
		var_292_4,
		var_292_6,
		var_292_9,
		var_292_10,
		var_292_11
	}

	if var_292_12 then
		for iter_292_0, iter_292_1 in ipairs(var_292_13) do
			var_292_12 = string.gsub(var_292_12, "$" .. iter_292_0, tostring(iter_292_1))
		end
	end

	warning(var_292_12)

	return var_292_12
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

function FilterVarchar(arg_294_0)
	assert(type(arg_294_0) == "string" or type(arg_294_0) == "table")

	if arg_294_0 == "" then
		return nil
	end

	return arg_294_0
end

function getGameset(arg_295_0)
	local var_295_0 = pg.gameset[arg_295_0]

	assert(var_295_0)

	return {
		var_295_0.key_value,
		var_295_0.description
	}
end

function getDorm3dGameset(arg_296_0)
	local var_296_0 = pg.dorm3d_set[arg_296_0]

	assert(var_296_0)

	return {
		var_296_0.key_value_int,
		var_296_0.key_value_varchar
	}
end

function GetItemsOverflowDic(arg_297_0)
	arg_297_0 = arg_297_0 or {}

	local var_297_0 = {
		[DROP_TYPE_ITEM] = {},
		[DROP_TYPE_RESOURCE] = {},
		[DROP_TYPE_EQUIP] = 0,
		[DROP_TYPE_SHIP] = 0,
		[DROP_TYPE_WORLD_ITEM] = 0
	}

	while #arg_297_0 > 0 do
		local var_297_1 = table.remove(arg_297_0)

		switch(var_297_1.type, {
			[DROP_TYPE_ITEM] = function()
				if var_297_1:getConfig("open_directly") == 1 then
					for iter_298_0, iter_298_1 in ipairs(var_297_1:getConfig("display_icon")) do
						local var_298_0 = Drop.Create(iter_298_1)

						var_298_0.count = var_298_0.count * var_297_1.count

						table.insert(arg_297_0, var_298_0)
					end
				elseif var_297_1:getSubClass():IsShipExpType() then
					var_297_0[var_297_1.type][var_297_1.id] = defaultValue(var_297_0[var_297_1.type][var_297_1.id], 0) + var_297_1.count
				end
			end,
			[DROP_TYPE_RESOURCE] = function()
				var_297_0[var_297_1.type][var_297_1.id] = defaultValue(var_297_0[var_297_1.type][var_297_1.id], 0) + var_297_1.count
			end,
			[DROP_TYPE_EQUIP] = function()
				var_297_0[var_297_1.type] = var_297_0[var_297_1.type] + var_297_1.count
			end,
			[DROP_TYPE_SHIP] = function()
				var_297_0[var_297_1.type] = var_297_0[var_297_1.type] + var_297_1.count
			end,
			[DROP_TYPE_WORLD_ITEM] = function()
				var_297_0[var_297_1.type] = var_297_0[var_297_1.type] + var_297_1.count
			end
		})
	end

	return var_297_0
end

function CheckOverflow(arg_303_0, arg_303_1)
	local var_303_0 = {}
	local var_303_1 = arg_303_0[DROP_TYPE_RESOURCE][PlayerConst.ResGold] or 0
	local var_303_2 = arg_303_0[DROP_TYPE_RESOURCE][PlayerConst.ResOil] or 0
	local var_303_3 = arg_303_0[DROP_TYPE_EQUIP]
	local var_303_4 = arg_303_0[DROP_TYPE_SHIP]
	local var_303_5 = getProxy(PlayerProxy):getRawData()
	local var_303_6 = false

	if arg_303_1 then
		local var_303_7 = var_303_5:OverStore(PlayerConst.ResStoreGold, var_303_1)
		local var_303_8 = var_303_5:OverStore(PlayerConst.ResStoreOil, var_303_2)

		if var_303_7 > 0 or var_303_8 > 0 then
			var_303_0.isStoreOverflow = {
				var_303_7,
				var_303_8
			}
		end
	else
		if var_303_1 > 0 and var_303_5:GoldMax(var_303_1) then
			return false, "gold"
		end

		if var_303_2 > 0 and var_303_5:OilMax(var_303_2) then
			return false, "oil"
		end
	end

	var_303_0.isExpBookOverflow = {}

	for iter_303_0, iter_303_1 in pairs(arg_303_0[DROP_TYPE_ITEM]) do
		local var_303_9 = Item.getConfigData(iter_303_0)

		if getProxy(BagProxy):getItemCountById(iter_303_0) + iter_303_1 > var_303_9.max_num then
			table.insert(var_303_0.isExpBookOverflow, iter_303_0)
		end
	end

	local var_303_10 = getProxy(EquipmentProxy):getCapacity()

	if var_303_3 > 0 and var_303_3 + var_303_10 > var_303_5:getMaxEquipmentBag() then
		return false, "equip"
	end

	local var_303_11 = getProxy(BayProxy):getShipCount()

	if var_303_4 > 0 and var_303_4 + var_303_11 > var_303_5:getMaxShipBag() then
		return false, "ship"
	end

	return true, var_303_0
end

function CheckShipExpOverflow(arg_304_0)
	local var_304_0 = getProxy(BagProxy)

	for iter_304_0, iter_304_1 in pairs(arg_304_0[DROP_TYPE_ITEM]) do
		if var_304_0:getItemCountById(iter_304_0) + iter_304_1 > Item.getConfigData(iter_304_0).max_num then
			return false
		end
	end

	return true
end

local var_0_26 = {
	[17] = "item_type17_tip2",
	tech = "techpackage_item_use_confirm",
	[16] = "item_type16_tip2",
	[11] = "equip_skin_detail_tip",
	[13] = "item_type13_tip2"
}

function RegisterDetailButton(arg_305_0, arg_305_1, arg_305_2)
	Drop.Change(arg_305_2)
	switch(arg_305_2.type, {
		[DROP_TYPE_ITEM] = function()
			if arg_305_2:getConfig("type") == Item.SKIN_ASSIGNED_TYPE then
				local var_306_0 = Item.getConfigData(arg_305_2.id).usage_arg
				local var_306_1 = var_306_0[3]

				if Item.InTimeLimitSkinAssigned(arg_305_2.id) then
					var_306_1 = table.mergeArray(var_306_0[2], var_306_1, true)
				end

				local var_306_2 = {}

				for iter_306_0, iter_306_1 in ipairs(var_306_0[2]) do
					var_306_2[iter_306_1] = true
				end

				onButton(arg_305_0, arg_305_1, function()
					arg_305_0:closeView()
					pg.m02:sendNotification(GAME.LOAD_LAYERS, {
						parentContext = getProxy(ContextProxy):getCurrentContext(),
						context = Context.New({
							viewComponent = SelectSkinLayer,
							mediator = SkinAtlasMediator,
							data = {
								mode = SelectSkinLayer.MODE_VIEW,
								itemId = arg_305_2.id,
								selectableSkinList = underscore.map(var_306_1, function(arg_308_0)
									return SelectableSkin.New({
										id = arg_308_0,
										isTimeLimit = var_306_2[arg_308_0] or false
									})
								end)
							}
						})
					})
				end, SFX_PANEL)
				setActive(arg_305_1, true)
			else
				local var_306_3 = getProxy(TechnologyProxy):getItemCanUnlockBluePrint(arg_305_2.id) and "tech" or arg_305_2:getConfig("type")

				if var_0_26[var_306_3] then
					local var_306_4 = {
						item2Row = true,
						content = i18n(var_0_26[var_306_3]),
						itemList = underscore.map(arg_305_2:getConfig("display_icon"), function(arg_309_0)
							return Drop.Create(arg_309_0)
						end)
					}

					if var_306_3 == 11 then
						onButton(arg_305_0, arg_305_1, function()
							arg_305_0:emit(BaseUI.ON_DROP_LIST_OWN, var_306_4)
						end, SFX_PANEL)
					else
						onButton(arg_305_0, arg_305_1, function()
							arg_305_0:emit(BaseUI.ON_DROP_LIST, var_306_4)
						end, SFX_PANEL)
					end
				end

				setActive(arg_305_1, tobool(var_0_26[var_306_3]))
			end
		end,
		[DROP_TYPE_EQUIP] = function()
			onButton(arg_305_0, arg_305_1, function()
				arg_305_0:emit(BaseUI.ON_DROP, arg_305_2)
			end, SFX_PANEL)
			setActive(arg_305_1, true)
		end,
		[DROP_TYPE_SPWEAPON] = function()
			onButton(arg_305_0, arg_305_1, function()
				arg_305_0:emit(BaseUI.ON_DROP, arg_305_2)
			end, SFX_PANEL)
			setActive(arg_305_1, true)
		end
	}, function()
		setActive(arg_305_1, false)
	end)
end

function RegisterNewStyleDetailButton(arg_317_0, arg_317_1, arg_317_2)
	Drop.Change(arg_317_2)
	switch(arg_317_2.type, {
		[DROP_TYPE_ITEM] = function()
			local var_318_0 = getProxy(TechnologyProxy):getItemCanUnlockBluePrint(arg_317_2.id) and "tech" or arg_317_2:getConfig("type")

			if var_0_26[var_318_0] then
				local var_318_1 = {
					useDeepShow = true,
					showOwn = var_318_0 == 11,
					content = i18n(var_0_26[var_318_0]),
					itemList = underscore.map(arg_317_2:getConfig("display_icon"), function(arg_319_0)
						return Drop.Create(arg_319_0)
					end)
				}

				onButton(arg_317_0, arg_317_1, function()
					arg_317_0:emit(BaseUI.ON_NEW_STYLE_ITEMS, var_318_1)
				end, SFX_PANEL)
			end

			setActive(arg_317_1, tobool(var_0_26[var_318_0]))
		end
	}, function()
		setActive(arg_317_1, false)
	end)
end

function UpdateOwnDisplay(arg_322_0, arg_322_1)
	local var_322_0, var_322_1 = arg_322_1:getOwnedCount()

	setActive(arg_322_0, var_322_1 and var_322_0 > 0)

	if var_322_1 and var_322_0 > 0 then
		setText(arg_322_0:Find("label"), i18n("word_own1"))
		setText(arg_322_0:Find("Text"), var_322_0)
	end
end

function Damp(arg_323_0, arg_323_1, arg_323_2)
	arg_323_1 = Mathf.Max(1, arg_323_1)

	local var_323_0 = Mathf.Epsilon

	if arg_323_1 < var_323_0 or var_323_0 > Mathf.Abs(arg_323_0) then
		return arg_323_0
	end

	if arg_323_2 < var_323_0 then
		return 0
	end

	local var_323_1 = -4.605170186

	return arg_323_0 * (1 - Mathf.Exp(var_323_1 * arg_323_2 / arg_323_1))
end

function checkCullResume(arg_324_0)
	if not ReflectionHelp.RefCallMethodEx(typeof("UnityEngine.CanvasRenderer"), "GetMaterial", GetComponent(arg_324_0, "CanvasRenderer"), {
		typeof("System.Int32")
	}, {
		0
	}) then
		local var_324_0 = arg_324_0:GetComponentsInChildren(typeof(MeshImage))

		for iter_324_0 = 1, var_324_0.Length do
			var_324_0[iter_324_0 - 1]:SetVerticesDirty()
		end

		return false
	end

	return true
end

function parseEquipCode(arg_325_0)
	local var_325_0 = {}

	if arg_325_0 and arg_325_0 ~= "" then
		local var_325_1 = base64.dec(arg_325_0)

		var_325_0 = string.split(var_325_1, "/")
		var_325_0[5], var_325_0[6] = unpack(string.split(var_325_0[5], "\\"))

		if #var_325_0 < 6 or arg_325_0 ~= base64.enc(table.concat({
			table.concat(underscore.first(var_325_0, 5), "/"),
			var_325_0[6]
		}, "\\")) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("equipcode_illegal"))

			var_325_0 = {}
		end
	end

	for iter_325_0 = 1, 6 do
		var_325_0[iter_325_0] = var_325_0[iter_325_0] and tonumber(var_325_0[iter_325_0], 32) or 0
	end

	return var_325_0
end

function buildEquipCode(arg_326_0)
	local var_326_0 = underscore.map(arg_326_0:getAllEquipments(), function(arg_327_0)
		return ConversionBase(32, arg_327_0 and arg_327_0.id or 0)
	end)
	local var_326_1 = {
		table.concat(var_326_0, "/"),
		ConversionBase(32, checkExist(arg_326_0:GetSpWeapon(), {
			"id"
		}) or 0)
	}

	return base64.enc(table.concat(var_326_1, "\\"))
end

function setDirectorSpeed(arg_328_0, arg_328_1)
	GetComponent(arg_328_0, "TimelineSpeed"):SetTimelineSpeed(arg_328_1)
end

function setDefaultZeroMetatable(arg_329_0)
	return setmetatable(arg_329_0, {
		__index = function(arg_330_0, arg_330_1)
			if rawget(arg_330_0, arg_330_1) == nil then
				arg_330_0[arg_330_1] = 0
			end

			return arg_330_0[arg_330_1]
		end
	})
end

function checkABExist(arg_331_0)
	if EDITOR_TOOL then
		return PathMgr.FileExists(PathMgr.getAssetBundle(arg_331_0)) or ResourceMgr.Inst:AssetExist(arg_331_0)
	else
		return PathMgr.FileExists(PathMgr.getAssetBundle(arg_331_0))
	end
end
