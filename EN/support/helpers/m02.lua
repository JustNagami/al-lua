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

function updateActivityMedal(arg_120_0, arg_120_1, arg_120_2)
	local var_120_0 = ItemRarity.Rarity2Print(arg_120_1.rarity)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_120_0, findTF(arg_120_0, "icon_bg"))
	setFrame(findTF(arg_120_0, "icon_bg/frame"), var_120_0)

	local var_120_1 = findTF(arg_120_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync(arg_120_1.icon, "", var_120_1)
	setIconName(arg_120_0, arg_120_1.name, arg_120_2)
end

function updateCover(arg_121_0, arg_121_1, arg_121_2)
	local var_121_0 = arg_121_1:getDropRarity()

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_121_0, findTF(arg_121_0, "icon_bg"))
	setFrame(findTF(arg_121_0, "icon_bg/frame"), var_121_0)

	local var_121_1 = findTF(arg_121_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync(arg_121_1:getIcon(), "", var_121_1)
	setIconName(arg_121_0, arg_121_1:getName(), arg_121_2)
	setIconStars(arg_121_0, false)
end

function updateEmoji(arg_122_0, arg_122_1, arg_122_2)
	local var_122_0 = findTF(arg_122_0, "icon_bg/icon")
	local var_122_1 = "icon_emoji"

	GetImageSpriteFromAtlasAsync("Props/" .. var_122_1, "", var_122_0)

	local var_122_2 = 4

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_122_2, findTF(arg_122_0, "icon_bg"))
	setFrame(findTF(arg_122_0, "icon_bg/frame"), var_122_2)
	setIconName(arg_122_0, arg_122_1.name, arg_122_2)
end

function updateEquipmentSkin(arg_123_0, arg_123_1, arg_123_2)
	arg_123_2 = arg_123_2 or {}

	local var_123_0 = EquipmentRarity.Rarity2Print(arg_123_1.rarity)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_123_0, findTF(arg_123_0, "icon_bg"))
	setFrame(findTF(arg_123_0, "icon_bg/frame"), var_123_0, "frame_skin")

	local var_123_1 = findTF(arg_123_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("equips/" .. arg_123_1.icon, "", var_123_1)
	setIconStars(arg_123_0, false)
	setIconName(arg_123_0, arg_123_1.name, arg_123_2)
	setIconCount(arg_123_0, arg_123_1.count)
	setIconColorful(arg_123_0, arg_123_1.rarity - 1, arg_123_2)
end

function NoPosMsgBox(arg_124_0, arg_124_1, arg_124_2, arg_124_3)
	local var_124_0
	local var_124_1 = {}

	if arg_124_1 then
		table.insert(var_124_1, {
			text = "text_noPos_clear",
			atuoClose = true,
			onCallback = arg_124_1
		})
	end

	if arg_124_2 then
		table.insert(var_124_1, {
			text = "text_noPos_buy",
			atuoClose = true,
			onCallback = arg_124_2
		})
	end

	if arg_124_3 then
		table.insert(var_124_1, {
			text = "text_noPos_intensify",
			atuoClose = true,
			onCallback = arg_124_3
		})
	end

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		hideYes = true,
		hideNo = true,
		content = arg_124_0,
		custom = var_124_1,
		weight = LayerWeightConst.TOP_LAYER
	})
end

function openDestroyEquip()
	if pg.m02:hasMediator(EquipmentMediator.__cname) then
		local var_125_0 = getProxy(ContextProxy):getCurrentContext():getContextByMediator(EquipmentMediator)

		if var_125_0 and var_125_0.data.shipId then
			pg.m02:sendNotification(GAME.REMOVE_LAYERS, {
				context = var_125_0
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
		local var_126_0 = getProxy(ContextProxy):getCurrentContext():getContextByMediator(EquipmentMediator)

		if var_126_0 and var_126_0.data.shipId then
			pg.m02:sendNotification(GAME.REMOVE_LAYERS, {
				context = var_126_0
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
		onClick = function(arg_129_0, arg_129_1)
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.SHIPINFO, {
				page = 3,
				shipId = arg_129_0.id,
				shipVOs = arg_129_1
			})
		end
	})
end

function GoShoppingMsgBox(arg_130_0, arg_130_1, arg_130_2)
	if arg_130_2 then
		local var_130_0 = ""

		for iter_130_0, iter_130_1 in ipairs(arg_130_2) do
			local var_130_1 = Item.getConfigData(iter_130_1[1])

			var_130_0 = var_130_0 .. i18n(iter_130_1[1] == 59001 and "text_noRes_info_tip" or "text_noRes_info_tip2", var_130_1.name, iter_130_1[2])

			if iter_130_0 < #arg_130_2 then
				var_130_0 = var_130_0 .. i18n("text_noRes_info_tip_link")
			end
		end

		if var_130_0 ~= "" then
			arg_130_0 = arg_130_0 .. "\n" .. i18n("text_noRes_tip", var_130_0)
		end
	end

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		content = arg_130_0,
		weight = LayerWeightConst.SECOND_LAYER,
		onYes = function()
			gotoChargeScene(arg_130_1, arg_130_2)
		end
	})
end

function shoppingBatch(arg_132_0, arg_132_1, arg_132_2, arg_132_3, arg_132_4)
	local var_132_0 = pg.shop_template[arg_132_0]

	assert(var_132_0, "shop_template中找不到商品id：" .. arg_132_0)

	local var_132_1 = getProxy(PlayerProxy):getData()[id2res(var_132_0.resource_type)]
	local var_132_2 = arg_132_1.price or var_132_0.resource_num
	local var_132_3 = math.floor(var_132_1 / var_132_2)

	var_132_3 = var_132_3 <= 0 and 1 or var_132_3
	var_132_3 = arg_132_2 ~= nil and arg_132_2 < var_132_3 and arg_132_2 or var_132_3

	local var_132_4 = true
	local var_132_5 = 1

	if var_132_0 ~= nil and arg_132_1.id then
		print(var_132_3 * var_132_0.num, "--", var_132_3)
		assert(Item.getConfigData(arg_132_1.id), "item config should be existence")

		local var_132_6 = Item.New({
			id = arg_132_1.id
		}):getConfig("name")

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			needCounter = true,
			type = MSGBOX_TYPE_SINGLE_ITEM,
			drop = {
				type = DROP_TYPE_ITEM,
				id = arg_132_1.id
			},
			addNum = var_132_0.num,
			maxNum = var_132_3 * var_132_0.num,
			defaultNum = var_132_0.num,
			numUpdate = function(arg_133_0, arg_133_1)
				var_132_5 = math.floor(arg_133_1 / var_132_0.num)

				local var_133_0 = var_132_5 * var_132_2

				if var_133_0 > var_132_1 then
					setText(arg_133_0, i18n(arg_132_3, var_133_0, arg_133_1, COLOR_RED, var_132_6))

					var_132_4 = false
				else
					setText(arg_133_0, i18n(arg_132_3, var_133_0, arg_133_1, COLOR_GREEN, var_132_6))

					var_132_4 = true
				end
			end,
			onYes = function()
				if var_132_4 then
					pg.m02:sendNotification(GAME.SHOPPING, {
						id = arg_132_0,
						count = var_132_5
					})
				elseif arg_132_4 then
					pg.TipsMgr.GetInstance():ShowTips(i18n(arg_132_4))
				else
					pg.TipsMgr.GetInstance():ShowTips(i18n("main_playerInfoLayer_error_changeNameNoGem"))
				end
			end
		})
	end
end

function shoppingBatchNewStyle(arg_135_0, arg_135_1, arg_135_2, arg_135_3, arg_135_4)
	local var_135_0 = pg.shop_template[arg_135_0]

	assert(var_135_0, "shop_template中找不到商品id：" .. arg_135_0)

	local var_135_1 = getProxy(PlayerProxy):getData()[id2res(var_135_0.resource_type)]
	local var_135_2 = arg_135_1.price or var_135_0.resource_num
	local var_135_3 = math.floor(var_135_1 / var_135_2)

	var_135_3 = var_135_3 <= 0 and 1 or var_135_3
	var_135_3 = arg_135_2 ~= nil and arg_135_2 < var_135_3 and arg_135_2 or var_135_3

	local var_135_4 = true
	local var_135_5 = 1

	if var_135_0 ~= nil and arg_135_1.id then
		print(var_135_3 * var_135_0.num, "--", var_135_3)
		assert(Item.getConfigData(arg_135_1.id), "item config should be existence")

		local var_135_6 = Item.New({
			id = arg_135_1.id
		}):getConfig("name")

		pg.NewStyleMsgboxMgr.GetInstance():Show(pg.NewStyleMsgboxMgr.TYPE_COMMON_SHOPPING, {
			drop = Drop.New({
				count = 1,
				type = DROP_TYPE_ITEM,
				id = arg_135_1.id
			}),
			price = var_135_2,
			addNum = var_135_0.num,
			maxNum = var_135_3 * var_135_0.num,
			defaultNum = var_135_0.num,
			numUpdate = function(arg_136_0, arg_136_1)
				var_135_5 = math.floor(arg_136_1 / var_135_0.num)

				local var_136_0 = var_135_5 * var_135_2

				if var_136_0 > var_135_1 then
					setTextInNewStyleBox(arg_136_0, i18n(arg_135_3, var_136_0, arg_136_1, COLOR_RED, var_135_6))

					var_135_4 = false
				else
					setTextInNewStyleBox(arg_136_0, i18n(arg_135_3, var_136_0, arg_136_1, "#238C40FF", var_135_6))

					var_135_4 = true
				end
			end,
			btnList = {
				{
					type = pg.NewStyleMsgboxMgr.BUTTON_TYPE.shopping,
					name = i18n("word_buy"),
					func = function()
						if var_135_4 then
							pg.m02:sendNotification(GAME.SHOPPING, {
								id = arg_135_0,
								count = var_135_5
							})
						elseif arg_135_4 then
							pg.TipsMgr.GetInstance():ShowTips(i18n(arg_135_4))
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

function gotoChargeScene(arg_138_0, arg_138_1)
	local var_138_0 = getProxy(ContextProxy)
	local var_138_1 = getProxy(ContextProxy):getCurrentContext()

	if instanceof(var_138_1.mediator, ChargeMediator) then
		var_138_1.mediator:getViewComponent():switchSubViewByTogger(arg_138_0)
	else
		pg.m02:sendNotification(GAME.GO_SCENE, SCENE.CHARGE, {
			wrap = arg_138_0 or ChargeScene.TYPE_ITEM,
			noRes = arg_138_1
		})
	end
end

function clearDrop(arg_139_0)
	local var_139_0 = findTF(arg_139_0, "icon_bg")
	local var_139_1 = findTF(arg_139_0, "icon_bg/frame")
	local var_139_2 = findTF(arg_139_0, "icon_bg/icon")
	local var_139_3 = findTF(arg_139_0, "icon_bg/icon/icon")

	clearImageSprite(var_139_0)
	clearImageSprite(var_139_1)
	clearImageSprite(var_139_2)

	if var_139_3 then
		clearImageSprite(var_139_3)
	end
end

local var_0_8 = {
	red = Color.New(1, 0.25, 0.25),
	blue = Color.New(0.11, 0.55, 0.64),
	yellow = Color.New(0.92, 0.52, 0)
}

function updateSkill(arg_140_0, arg_140_1, arg_140_2, arg_140_3)
	local var_140_0 = findTF(arg_140_0, "skill")
	local var_140_1 = findTF(arg_140_0, "lock")
	local var_140_2 = findTF(arg_140_0, "unknown")

	if arg_140_1 then
		setActive(var_140_0, true)
		setActive(var_140_2, false)
		setActive(var_140_1, not arg_140_2)
		LoadImageSpriteAsync("skillicon/" .. arg_140_1.icon, findTF(var_140_0, "icon"))

		local var_140_3 = arg_140_1.color or "blue"

		setText(findTF(var_140_0, "name"), shortenString(getSkillName(arg_140_1.id), arg_140_3 or 8))

		local var_140_4 = findTF(var_140_0, "level")

		setText(var_140_4, "LEVEL: " .. (arg_140_2 and arg_140_2.level or "??"))
		setTextColor(var_140_4, var_0_8[var_140_3])
	else
		setActive(var_140_0, false)
		setActive(var_140_2, true)
		setActive(var_140_1, false)
	end
end

local var_0_9 = true

function onBackButton(arg_141_0, arg_141_1, arg_141_2, arg_141_3)
	local var_141_0 = GetOrAddComponent(arg_141_1, "UILongPressTrigger")

	assert(arg_141_2, "callback should exist")

	var_141_0.longPressThreshold = defaultValue(arg_141_3, 1)

	local function var_141_1(arg_142_0)
		return function()
			if var_0_9 then
				pg.CriMgr.GetInstance():PlaySoundEffect_V3(SOUND_BACK)
			end

			local var_143_0, var_143_1 = arg_141_2()

			if var_143_0 then
				arg_142_0(var_143_1)
			end
		end
	end

	local var_141_2 = var_141_0.onReleased

	pg.DelegateInfo.Add(arg_141_0, var_141_2)
	var_141_2:RemoveAllListeners()
	var_141_2:AddListener(var_141_1(function(arg_144_0)
		arg_144_0:emit(BaseUI.ON_BACK)
	end))

	local var_141_3 = var_141_0.onLongPressed

	pg.DelegateInfo.Add(arg_141_0, var_141_3)
	var_141_3:RemoveAllListeners()
	var_141_3:AddListener(var_141_1(function(arg_145_0)
		arg_145_0:emit(BaseUI.ON_HOME)
	end))
end

function GetZeroTime()
	return pg.TimeMgr.GetInstance():GetNextTime(0, 0, 0)
end

function GetHalfHour()
	return pg.TimeMgr.GetInstance():GetNextTime(0, 0, 0, 1800)
end

function GetNextHour(arg_148_0)
	local var_148_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_148_1, var_148_2 = pg.TimeMgr.GetInstance():parseTimeFrom(var_148_0)

	return var_148_1 * 86400 + (var_148_2 + arg_148_0) * 3600
end

function GetPerceptualSize(arg_149_0, arg_149_1)
	local function var_149_0(arg_150_0)
		if not arg_150_0 then
			return 0, 1
		elseif arg_150_0 > 240 then
			return 4, 1
		elseif arg_150_0 > 225 then
			return 3, 1
		elseif arg_150_0 > 192 then
			return 2, 1
		elseif arg_150_0 < 126 then
			return 1, arg_149_1 or 0.5
		else
			return 1, 1
		end
	end

	if type(arg_149_0) == "number" then
		return var_149_0(arg_149_0)
	end

	local var_149_1 = 1
	local var_149_2 = 0
	local var_149_3 = 0
	local var_149_4 = #arg_149_0

	while var_149_1 <= var_149_4 do
		local var_149_5 = string.byte(arg_149_0, var_149_1)
		local var_149_6, var_149_7 = var_149_0(var_149_5)

		var_149_1 = var_149_1 + var_149_6
		var_149_2 = var_149_2 + var_149_7
	end

	return var_149_2
end

function shortenString(arg_151_0, arg_151_1, arg_151_2)
	local var_151_0 = 1
	local var_151_1 = 0
	local var_151_2 = 0
	local var_151_3 = #arg_151_0

	while var_151_0 <= var_151_3 do
		local var_151_4 = string.byte(arg_151_0, var_151_0)
		local var_151_5, var_151_6 = GetPerceptualSize(var_151_4, arg_151_2)

		var_151_0 = var_151_0 + var_151_5
		var_151_1 = var_151_1 + var_151_6

		if arg_151_1 <= math.ceil(var_151_1) then
			var_151_2 = var_151_0

			break
		end
	end

	if var_151_2 == 0 or var_151_3 < var_151_2 then
		return arg_151_0
	end

	return string.sub(arg_151_0, 1, var_151_2 - 1) .. ".."
end

function shouldShortenString(arg_152_0, arg_152_1)
	local var_152_0 = 1
	local var_152_1 = 0
	local var_152_2 = 0
	local var_152_3 = #arg_152_0

	while var_152_0 <= var_152_3 do
		local var_152_4 = string.byte(arg_152_0, var_152_0)
		local var_152_5, var_152_6 = GetPerceptualSize(var_152_4)

		var_152_0 = var_152_0 + var_152_5
		var_152_1 = var_152_1 + var_152_6

		if arg_152_1 <= math.ceil(var_152_1) then
			var_152_2 = var_152_0

			break
		end
	end

	if var_152_2 == 0 or var_152_3 < var_152_2 then
		return false
	end

	return true
end

function nameValidityCheck(arg_153_0, arg_153_1, arg_153_2, arg_153_3)
	local var_153_0 = true
	local var_153_1, var_153_2 = utf8_to_unicode(arg_153_0)
	local var_153_3 = filterEgyUnicode(filterSpecChars(arg_153_0))
	local var_153_4 = wordVer(arg_153_0)

	if not checkSpaceValid(arg_153_0) then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_153_3[1]))

		var_153_0 = false
	elseif var_153_4 > 0 or var_153_3 ~= arg_153_0 then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_153_3[4]))

		var_153_0 = false
	elseif var_153_2 < arg_153_1 then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_153_3[2]))

		var_153_0 = false
	elseif arg_153_2 < var_153_2 then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_153_3[3]))

		var_153_0 = false
	end

	return var_153_0
end

function checkSpaceValid(arg_154_0)
	if PLATFORM_CODE == PLATFORM_US then
		return true
	end

	local var_154_0 = string.gsub(arg_154_0, " ", "")

	return arg_154_0 == string.gsub(var_154_0, "　", "")
end

function filterSpecChars(arg_155_0)
	local var_155_0 = {}
	local var_155_1 = 0
	local var_155_2 = 0
	local var_155_3 = 0
	local var_155_4 = 1

	while var_155_4 <= #arg_155_0 do
		local var_155_5 = string.byte(arg_155_0, var_155_4)

		if not var_155_5 then
			break
		end

		if var_155_5 >= 48 and var_155_5 <= 57 or var_155_5 >= 65 and var_155_5 <= 90 or var_155_5 == 95 or var_155_5 >= 97 and var_155_5 <= 122 then
			table.insert(var_155_0, string.char(var_155_5))
		elseif var_155_5 >= 228 and var_155_5 <= 233 then
			local var_155_6 = string.byte(arg_155_0, var_155_4 + 1)
			local var_155_7 = string.byte(arg_155_0, var_155_4 + 2)

			if var_155_6 and var_155_7 and var_155_6 >= 128 and var_155_6 <= 191 and var_155_7 >= 128 and var_155_7 <= 191 then
				var_155_4 = var_155_4 + 2

				table.insert(var_155_0, string.char(var_155_5, var_155_6, var_155_7))

				var_155_1 = var_155_1 + 1
			end
		elseif var_155_5 == 45 or var_155_5 == 40 or var_155_5 == 41 then
			table.insert(var_155_0, string.char(var_155_5))
		elseif var_155_5 == 194 then
			local var_155_8 = string.byte(arg_155_0, var_155_4 + 1)

			if var_155_8 == 183 then
				var_155_4 = var_155_4 + 1

				table.insert(var_155_0, string.char(var_155_5, var_155_8))

				var_155_1 = var_155_1 + 1
			end
		elseif var_155_5 == 239 then
			local var_155_9 = string.byte(arg_155_0, var_155_4 + 1)
			local var_155_10 = string.byte(arg_155_0, var_155_4 + 2)

			if var_155_9 == 188 and (var_155_10 == 136 or var_155_10 == 137) then
				var_155_4 = var_155_4 + 2

				table.insert(var_155_0, string.char(var_155_5, var_155_9, var_155_10))

				var_155_1 = var_155_1 + 1
			end
		elseif var_155_5 == 206 or var_155_5 == 207 then
			local var_155_11 = string.byte(arg_155_0, var_155_4 + 1)

			if var_155_5 == 206 and var_155_11 >= 177 or var_155_5 == 207 and var_155_11 <= 134 then
				var_155_4 = var_155_4 + 1

				table.insert(var_155_0, string.char(var_155_5, var_155_11))

				var_155_1 = var_155_1 + 1
			end
		elseif var_155_5 == 227 and PLATFORM_CODE == PLATFORM_JP then
			local var_155_12 = string.byte(arg_155_0, var_155_4 + 1)
			local var_155_13 = string.byte(arg_155_0, var_155_4 + 2)

			if var_155_12 and var_155_13 and var_155_12 > 128 and var_155_12 <= 191 and var_155_13 >= 128 and var_155_13 <= 191 then
				var_155_4 = var_155_4 + 2

				table.insert(var_155_0, string.char(var_155_5, var_155_12, var_155_13))

				var_155_2 = var_155_2 + 1
			end
		elseif var_155_5 >= 224 and PLATFORM_CODE == PLATFORM_KR then
			local var_155_14 = string.byte(arg_155_0, var_155_4 + 1)
			local var_155_15 = string.byte(arg_155_0, var_155_4 + 2)

			if var_155_14 and var_155_15 and var_155_14 >= 128 and var_155_14 <= 191 and var_155_15 >= 128 and var_155_15 <= 191 then
				var_155_4 = var_155_4 + 2

				table.insert(var_155_0, string.char(var_155_5, var_155_14, var_155_15))

				var_155_3 = var_155_3 + 1
			end
		elseif PLATFORM_CODE == PLATFORM_US then
			if var_155_4 ~= 1 and var_155_5 == 32 and string.byte(arg_155_0, var_155_4 + 1) ~= 32 then
				table.insert(var_155_0, string.char(var_155_5))
			end

			if var_155_5 >= 192 and var_155_5 <= 223 then
				local var_155_16 = string.byte(arg_155_0, var_155_4 + 1)

				var_155_4 = var_155_4 + 1

				if var_155_5 == 194 and var_155_16 and var_155_16 >= 128 then
					table.insert(var_155_0, string.char(var_155_5, var_155_16))
				elseif var_155_5 == 195 and var_155_16 and var_155_16 <= 191 then
					table.insert(var_155_0, string.char(var_155_5, var_155_16))
				end
			end
		end

		var_155_4 = var_155_4 + 1
	end

	return table.concat(var_155_0), var_155_1 + var_155_2 + var_155_3
end

function filterEgyUnicode(arg_156_0)
	arg_156_0 = string.gsub(arg_156_0, "\xF0\x93[\x80-\x8F][\x80-\xBF]", "")
	arg_156_0 = string.gsub(arg_156_0, "\xF0\x93\x90[\x80-\xAF]", "")

	return arg_156_0
end

function shiftPanel(arg_157_0, arg_157_1, arg_157_2, arg_157_3, arg_157_4, arg_157_5, arg_157_6, arg_157_7, arg_157_8)
	arg_157_3 = arg_157_3 or 0.2

	if arg_157_5 then
		LeanTween.cancel(go(arg_157_0))
	end

	local var_157_0 = rtf(arg_157_0)

	arg_157_1 = arg_157_1 or var_157_0.anchoredPosition.x
	arg_157_2 = arg_157_2 or var_157_0.anchoredPosition.y

	local var_157_1 = LeanTween.move(var_157_0, Vector3(arg_157_1, arg_157_2, 0), arg_157_3)

	arg_157_7 = arg_157_7 or LeanTweenType.easeInOutSine

	var_157_1:setEase(arg_157_7)

	if arg_157_4 then
		var_157_1:setDelay(arg_157_4)
	end

	if arg_157_6 then
		GetOrAddComponent(arg_157_0, "CanvasGroup").blocksRaycasts = false
	end

	var_157_1:setOnComplete(System.Action(function()
		if arg_157_8 then
			arg_157_8()
		end

		if arg_157_6 then
			GetOrAddComponent(arg_157_0, "CanvasGroup").blocksRaycasts = true
		end
	end))

	return var_157_1
end

function TweenValue(arg_159_0, arg_159_1, arg_159_2, arg_159_3, arg_159_4, arg_159_5, arg_159_6, arg_159_7)
	local var_159_0 = LeanTween.value(go(arg_159_0), arg_159_1, arg_159_2, arg_159_3):setOnUpdate(System.Action_float(function(arg_160_0)
		if arg_159_5 then
			arg_159_5(arg_160_0)
		end
	end)):setOnComplete(System.Action(function()
		if arg_159_6 then
			arg_159_6()
		end
	end)):setDelay(arg_159_4 or 0)

	if arg_159_7 and arg_159_7 > 0 then
		var_159_0:setRepeat(arg_159_7)
	end

	return var_159_0
end

function rotateAni(arg_162_0, arg_162_1, arg_162_2)
	return LeanTween.rotate(rtf(arg_162_0), 360 * arg_162_1, arg_162_2):setLoopClamp()
end

function blinkAni(arg_163_0, arg_163_1, arg_163_2, arg_163_3)
	return LeanTween.alpha(rtf(arg_163_0), arg_163_3 or 0, arg_163_1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong(arg_163_2 or 0)
end

function scaleAni(arg_164_0, arg_164_1, arg_164_2, arg_164_3)
	return LeanTween.scale(rtf(arg_164_0), arg_164_3 or 0, arg_164_1):setLoopPingPong(arg_164_2 or 0)
end

function floatAni(arg_165_0, arg_165_1, arg_165_2, arg_165_3)
	local var_165_0 = arg_165_0.localPosition.y + arg_165_1

	return LeanTween.moveY(rtf(arg_165_0), var_165_0, arg_165_2):setLoopPingPong(arg_165_3 or 0)
end

local var_0_10 = tostring

function tostring(arg_166_0)
	if arg_166_0 == nil then
		return "nil"
	end

	local var_166_0 = var_0_10(arg_166_0)

	if var_166_0 == nil then
		if type(arg_166_0) == "table" then
			return "{}"
		end

		return " ~nil"
	end

	return var_166_0
end

function wordVer(arg_167_0, arg_167_1)
	if arg_167_0.match(arg_167_0, ChatConst.EmojiCodeMatch) then
		return 0, arg_167_0
	end

	arg_167_1 = arg_167_1 or {}

	local var_167_0 = filterEgyUnicode(arg_167_0)

	if #var_167_0 ~= #arg_167_0 then
		if arg_167_1.isReplace then
			arg_167_0 = var_167_0
		else
			return 1
		end
	end

	local var_167_1 = wordSplit(arg_167_0)
	local var_167_2 = pg.word_template
	local var_167_3 = pg.word_legal_template

	arg_167_1.isReplace = arg_167_1.isReplace or false
	arg_167_1.replaceWord = arg_167_1.replaceWord or "*"

	local var_167_4 = #var_167_1
	local var_167_5 = 1
	local var_167_6 = ""
	local var_167_7 = 0

	while var_167_5 <= var_167_4 do
		local var_167_8, var_167_9, var_167_10 = wordLegalMatch(var_167_1, var_167_3, var_167_5)

		if var_167_8 then
			var_167_5 = var_167_9
			var_167_6 = var_167_6 .. var_167_10
		else
			local var_167_11, var_167_12, var_167_13 = wordVerMatch(var_167_1, var_167_2, arg_167_1, var_167_5, "", false, var_167_5, "")

			if var_167_11 then
				var_167_5 = var_167_12
				var_167_7 = var_167_7 + 1

				if arg_167_1.isReplace then
					var_167_6 = var_167_6 .. var_167_13
				end
			else
				if arg_167_1.isReplace then
					var_167_6 = var_167_6 .. var_167_1[var_167_5]
				end

				var_167_5 = var_167_5 + 1
			end
		end
	end

	if arg_167_1.isReplace then
		return var_167_7, var_167_6
	else
		return var_167_7
	end
end

function wordLegalMatch(arg_168_0, arg_168_1, arg_168_2, arg_168_3, arg_168_4)
	if arg_168_2 > #arg_168_0 then
		return arg_168_3, arg_168_2, arg_168_4
	end

	local var_168_0 = arg_168_0[arg_168_2]
	local var_168_1 = arg_168_1[var_168_0]

	arg_168_4 = arg_168_4 == nil and "" or arg_168_4

	if var_168_1 then
		if var_168_1.this then
			return wordLegalMatch(arg_168_0, var_168_1, arg_168_2 + 1, true, arg_168_4 .. var_168_0)
		else
			return wordLegalMatch(arg_168_0, var_168_1, arg_168_2 + 1, false, arg_168_4 .. var_168_0)
		end
	else
		return arg_168_3, arg_168_2, arg_168_4
	end
end

local var_0_11 = string.byte("a")
local var_0_12 = string.byte("z")
local var_0_13 = string.byte("A")
local var_0_14 = string.byte("Z")

local function var_0_15(arg_169_0)
	if not arg_169_0 then
		return arg_169_0
	end

	local var_169_0 = string.byte(arg_169_0)

	if var_169_0 > 128 then
		return
	end

	if var_169_0 >= var_0_11 and var_169_0 <= var_0_12 then
		return string.char(var_169_0 - 32)
	elseif var_169_0 >= var_0_13 and var_169_0 <= var_0_14 then
		return string.char(var_169_0 + 32)
	else
		return arg_169_0
	end
end

function wordVerMatch(arg_170_0, arg_170_1, arg_170_2, arg_170_3, arg_170_4, arg_170_5, arg_170_6, arg_170_7)
	if arg_170_3 > #arg_170_0 then
		return arg_170_5, arg_170_6, arg_170_7
	end

	local var_170_0 = arg_170_0[arg_170_3]
	local var_170_1 = arg_170_1[var_170_0]

	if var_170_1 then
		local var_170_2, var_170_3, var_170_4 = wordVerMatch(arg_170_0, var_170_1, arg_170_2, arg_170_3 + 1, arg_170_2.isReplace and arg_170_4 .. arg_170_2.replaceWord or arg_170_4, var_170_1.this or arg_170_5, var_170_1.this and arg_170_3 + 1 or arg_170_6, var_170_1.this and (arg_170_2.isReplace and arg_170_4 .. arg_170_2.replaceWord or arg_170_4) or arg_170_7)

		if var_170_2 then
			return var_170_2, var_170_3, var_170_4
		end
	end

	local var_170_5 = var_0_15(var_170_0)
	local var_170_6 = arg_170_1[var_170_5]

	if var_170_5 ~= var_170_0 and var_170_6 then
		local var_170_7, var_170_8, var_170_9 = wordVerMatch(arg_170_0, var_170_6, arg_170_2, arg_170_3 + 1, arg_170_2.isReplace and arg_170_4 .. arg_170_2.replaceWord or arg_170_4, var_170_6.this or arg_170_5, var_170_6.this and arg_170_3 + 1 or arg_170_6, var_170_6.this and (arg_170_2.isReplace and arg_170_4 .. arg_170_2.replaceWord or arg_170_4) or arg_170_7)

		if var_170_7 then
			return var_170_7, var_170_8, var_170_9
		end
	end

	return arg_170_5, arg_170_6, arg_170_7
end

function wordSplit(arg_171_0)
	local var_171_0 = {}

	for iter_171_0 in arg_171_0.gmatch(arg_171_0, "[\x01-\x7F\xC2-\xF4][\x80-\xBF]*") do
		var_171_0[#var_171_0 + 1] = iter_171_0
	end

	return var_171_0
end

function contentWrap(arg_172_0, arg_172_1, arg_172_2)
	local var_172_0 = LuaHelper.WrapContent(arg_172_0, arg_172_1, arg_172_2)

	return #var_172_0 ~= #arg_172_0, var_172_0
end

function cancelRich(arg_173_0)
	local var_173_0

	for iter_173_0 = 1, 20 do
		local var_173_1

		arg_173_0, var_173_1 = string.gsub(arg_173_0, "<([^>]*)>", "%1")

		if var_173_1 <= 0 then
			break
		end
	end

	return arg_173_0
end

function cancelColorRich(arg_174_0)
	local var_174_0

	for iter_174_0 = 1, 20 do
		local var_174_1

		arg_174_0, var_174_1 = string.gsub(arg_174_0, "<color=#[a-zA-Z0-9]+>(.-)</color>", "%1")

		if var_174_1 <= 0 then
			break
		end
	end

	return arg_174_0
end

function getSkillConfig(arg_175_0)
	local var_175_0 = pg.buffCfg["buff_" .. arg_175_0]

	if not var_175_0 then
		return
	end

	local var_175_1 = Clone(var_175_0)

	var_175_1.name = getSkillName(arg_175_0)
	var_175_1.desc = HXSet.hxLan(var_175_1.desc)
	var_175_1.desc_get = HXSet.hxLan(var_175_1.desc_get)

	_.each(var_175_1, function(arg_176_0)
		arg_176_0.desc = HXSet.hxLan(arg_176_0.desc)
	end)

	return var_175_1
end

function getSkillName(arg_177_0)
	local var_177_0 = pg.skill_data_template[arg_177_0] or pg.skill_data_display[arg_177_0]

	if var_177_0 then
		return HXSet.hxLan(var_177_0.name)
	else
		return ""
	end
end

function getSkillDescGet(arg_178_0, arg_178_1)
	local var_178_0 = arg_178_1 and pg.skill_world_display[arg_178_0] and setmetatable({}, {
		__index = function(arg_179_0, arg_179_1)
			return pg.skill_world_display[arg_178_0][arg_179_1] or pg.skill_data_template[arg_178_0][arg_179_1]
		end
	}) or pg.skill_data_template[arg_178_0]

	if not var_178_0 then
		return ""
	end

	local var_178_1 = var_178_0.desc_get ~= "" and var_178_0.desc_get or var_178_0.desc

	for iter_178_0, iter_178_1 in pairs(var_178_0.desc_get_add) do
		local var_178_2 = setColorStr(iter_178_1[1], COLOR_GREEN)

		if iter_178_1[2] then
			var_178_2 = var_178_2 .. specialGSub(i18n("word_skill_desc_get"), "$1", setColorStr(iter_178_1[2], COLOR_GREEN))
		end

		var_178_1 = specialGSub(var_178_1, "$" .. iter_178_0, var_178_2)
	end

	return HXSet.hxLan(var_178_1)
end

function getSkillDescLearn(arg_180_0, arg_180_1, arg_180_2)
	local var_180_0 = arg_180_2 and pg.skill_world_display[arg_180_0] and setmetatable({}, {
		__index = function(arg_181_0, arg_181_1)
			return pg.skill_world_display[arg_180_0][arg_181_1] or pg.skill_data_template[arg_180_0][arg_181_1]
		end
	}) or pg.skill_data_template[arg_180_0]

	if not var_180_0 then
		return ""
	end

	local var_180_1 = var_180_0.desc

	if not var_180_0.desc_add then
		return HXSet.hxLan(var_180_1)
	end

	for iter_180_0, iter_180_1 in pairs(var_180_0.desc_add) do
		local var_180_2 = iter_180_1[arg_180_1][1]

		if iter_180_1[arg_180_1][2] then
			var_180_2 = var_180_2 .. specialGSub(i18n("word_skill_desc_learn"), "$1", iter_180_1[arg_180_1][2])
		end

		var_180_1 = specialGSub(var_180_1, "$" .. iter_180_0, setColorStr(var_180_2, COLOR_YELLOW))
	end

	return HXSet.hxLan(var_180_1)
end

function getSkillDesc(arg_182_0, arg_182_1, arg_182_2)
	local var_182_0 = arg_182_2 and pg.skill_world_display[arg_182_0] and setmetatable({}, {
		__index = function(arg_183_0, arg_183_1)
			return pg.skill_world_display[arg_182_0][arg_183_1] or pg.skill_data_template[arg_182_0][arg_183_1]
		end
	}) or pg.skill_data_template[arg_182_0]

	if not var_182_0 then
		return ""
	end

	local var_182_1 = var_182_0.desc

	if not var_182_0.desc_add then
		return HXSet.hxLan(var_182_1)
	end

	for iter_182_0, iter_182_1 in pairs(var_182_0.desc_add) do
		local var_182_2 = setColorStr(iter_182_1[arg_182_1][1], COLOR_GREEN)

		var_182_1 = specialGSub(var_182_1, "$" .. iter_182_0, var_182_2)
	end

	return HXSet.hxLan(var_182_1)
end

function specialGSub(arg_184_0, arg_184_1, arg_184_2)
	arg_184_0 = string.gsub(arg_184_0, "<color=#", "<color=NNN")
	arg_184_0 = string.gsub(arg_184_0, "#", "")
	arg_184_2 = string.gsub(arg_184_2, "%%", "%%%%")
	arg_184_0 = string.gsub(arg_184_0, arg_184_1, arg_184_2)
	arg_184_0 = string.gsub(arg_184_0, "<color=NNN", "<color=#")

	return arg_184_0
end

function topAnimation(arg_185_0, arg_185_1, arg_185_2, arg_185_3, arg_185_4, arg_185_5)
	local var_185_0 = {}

	arg_185_4 = arg_185_4 or 0.27

	local var_185_1 = 0.05

	if arg_185_0 then
		local var_185_2 = arg_185_0.transform.localPosition.x

		setAnchoredPosition(arg_185_0, {
			x = var_185_2 - 500
		})
		shiftPanel(arg_185_0, var_185_2, nil, 0.05, arg_185_4, true, true)
		setActive(arg_185_0, true)
	end

	setActive(arg_185_1, false)
	setActive(arg_185_2, false)
	setActive(arg_185_3, false)

	for iter_185_0 = 1, 3 do
		table.insert(var_185_0, LeanTween.delayedCall(arg_185_4 + 0.13 + var_185_1 * iter_185_0, System.Action(function()
			if arg_185_1 then
				setActive(arg_185_1, not arg_185_1.gameObject.activeSelf)
			end
		end)).uniqueId)
		table.insert(var_185_0, LeanTween.delayedCall(arg_185_4 + 0.02 + var_185_1 * iter_185_0, System.Action(function()
			if arg_185_2 then
				setActive(arg_185_2, not go(arg_185_2).activeSelf)
			end

			if arg_185_2 then
				setActive(arg_185_3, not go(arg_185_3).activeSelf)
			end
		end)).uniqueId)
	end

	if arg_185_5 then
		table.insert(var_185_0, LeanTween.delayedCall(arg_185_4 + 0.13 + var_185_1 * 3 + 0.1, System.Action(function()
			arg_185_5()
		end)).uniqueId)
	end

	return var_185_0
end

function cancelTweens(arg_189_0)
	assert(arg_189_0, "must provide cancel targets, LeanTween.cancelAll is not allow")

	for iter_189_0, iter_189_1 in ipairs(arg_189_0) do
		if iter_189_1 then
			LeanTween.cancel(iter_189_1)
		end
	end
end

function getOfflineTimeStamp(arg_190_0)
	local var_190_0 = pg.TimeMgr.GetInstance():GetServerTime() - arg_190_0
	local var_190_1 = ""

	if var_190_0 <= 59 then
		var_190_1 = i18n("just_now")
	elseif var_190_0 <= 3599 then
		var_190_1 = i18n("several_minutes_before", math.floor(var_190_0 / 60))
	elseif var_190_0 <= 86399 then
		var_190_1 = i18n("several_hours_before", math.floor(var_190_0 / 3600))
	else
		var_190_1 = i18n("several_days_before", math.floor(var_190_0 / 86400))
	end

	return var_190_1
end

function playMovie(arg_191_0, arg_191_1, arg_191_2)
	local var_191_0 = GameObject.Find("OverlayCamera/Overlay/UITop/MoviePanel")

	if not IsNil(var_191_0) then
		pg.UIMgr.GetInstance():LoadingOn()
		WWWLoader.Inst:LoadStreamingAsset(arg_191_0, function(arg_192_0)
			pg.UIMgr.GetInstance():LoadingOff()

			local var_192_0 = GCHandle.Alloc(arg_192_0, GCHandleType.Pinned)

			setActive(var_191_0, true)

			local var_192_1 = var_191_0:AddComponent(typeof(CriManaMovieControllerForUI))

			var_192_1.player:SetData(arg_192_0, arg_192_0.Length)

			var_192_1.target = var_191_0:GetComponent(typeof(Image))
			var_192_1.loop = false
			var_192_1.additiveMode = false
			var_192_1.playOnStart = true

			local var_192_2

			var_192_2 = Timer.New(function()
				if var_192_1.player.status == CriMana.Player.Status.PlayEnd or var_192_1.player.status == CriMana.Player.Status.Stop or var_192_1.player.status == CriMana.Player.Status.Error then
					var_192_2:Stop()
					Object.Destroy(var_192_1)
					GCHandle.Free(var_192_0)
					setActive(var_191_0, false)

					if arg_191_1 then
						arg_191_1()
					end
				end
			end, 0.2, -1)

			var_192_2:Start()
			removeOnButton(var_191_0)

			if arg_191_2 then
				onButton(nil, var_191_0, function()
					var_192_1:Stop()
					GetOrAddComponent(var_191_0, typeof(Button)).onClick:RemoveAllListeners()
				end, SFX_CANCEL)
			end
		end)
	elseif arg_191_1 then
		arg_191_1()
	end
end

PaintCameraAdjustOn = false

function cameraPaintViewAdjust(arg_195_0)
	if PaintCameraAdjustOn ~= arg_195_0 then
		local var_195_0 = GameObject.Find("UICamera/Canvas"):GetComponent(typeof(CanvasScaler))

		if arg_195_0 then
			CameraMgr.instance.AutoAdapt = false

			CameraMgr.instance:Revert()

			var_195_0.screenMatchMode = CanvasScaler.ScreenMatchMode.MatchWidthOrHeight
			var_195_0.matchWidthOrHeight = 1
		else
			CameraMgr.instance.AutoAdapt = true
			CameraMgr.instance.CurrentWidth = 1
			CameraMgr.instance.CurrentHeight = 1
			CameraMgr.instance.AspectRatio = 1.7777777777777777
			var_195_0.screenMatchMode = CanvasScaler.ScreenMatchMode.Expand
		end

		PaintCameraAdjustOn = arg_195_0
	end
end

function ManhattonDist(arg_196_0, arg_196_1)
	return math.abs(arg_196_0.row - arg_196_1.row) + math.abs(arg_196_0.column - arg_196_1.column)
end

function checkFirstHelpShow(arg_197_0)
	local var_197_0 = getProxy(SettingsProxy)

	if not var_197_0:checkReadHelp(arg_197_0) then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip[arg_197_0].tip
		})
		var_197_0:recordReadHelp(arg_197_0)
	end
end

preOrientation = nil
preNotchFitterEnabled = false

function openPortrait(arg_198_0)
	enableNotch(arg_198_0, true)

	preOrientation = Input.deviceOrientation:ToString()

	originalPrint("Begining Orientation:" .. preOrientation)

	Screen.autorotateToPortrait = true
	Screen.autorotateToPortraitUpsideDown = true

	cameraPaintViewAdjust(true)
end

function closePortrait(arg_199_0)
	enableNotch(arg_199_0, false)

	Screen.autorotateToPortrait = false
	Screen.autorotateToPortraitUpsideDown = false

	originalPrint("Closing Orientation:" .. preOrientation)

	Screen.orientation = ScreenOrientation.LandscapeLeft

	local var_199_0 = Timer.New(function()
		Screen.orientation = ScreenOrientation.AutoRotation
	end, 0.2, 1):Start()

	cameraPaintViewAdjust(false)
end

function enableNotch(arg_201_0, arg_201_1)
	if arg_201_0 == nil then
		return
	end

	local var_201_0 = arg_201_0:GetComponent("NotchAdapt")
	local var_201_1 = arg_201_0:GetComponent("AspectRatioFitter")

	var_201_0.enabled = arg_201_1

	if var_201_1 then
		if arg_201_1 then
			var_201_1.enabled = preNotchFitterEnabled
		else
			preNotchFitterEnabled = var_201_1.enabled
			var_201_1.enabled = false
		end
	end
end

function comma_value(arg_202_0)
	local var_202_0 = arg_202_0
	local var_202_1 = 0

	repeat
		local var_202_2

		var_202_0, var_202_2 = string.gsub(var_202_0, "^(-?%d+)(%d%d%d)", "%1,%2")
	until var_202_2 == 0

	return var_202_0
end

local var_0_16 = 0.2

function SwitchPanel(arg_203_0, arg_203_1, arg_203_2, arg_203_3, arg_203_4, arg_203_5)
	arg_203_3 = defaultValue(arg_203_3, var_0_16)

	if arg_203_5 then
		LeanTween.cancel(go(arg_203_0))
	end

	local var_203_0 = Vector3.New(tf(arg_203_0).localPosition.x, tf(arg_203_0).localPosition.y, tf(arg_203_0).localPosition.z)

	if arg_203_1 then
		var_203_0.x = arg_203_1
	end

	if arg_203_2 then
		var_203_0.y = arg_203_2
	end

	local var_203_1 = LeanTween.move(rtf(arg_203_0), var_203_0, arg_203_3):setEase(LeanTweenType.easeInOutSine)

	if arg_203_4 then
		var_203_1:setDelay(arg_203_4)
	end

	return var_203_1
end

function updateActivityTaskStatus(arg_204_0)
	local var_204_0 = arg_204_0:getConfig("config_id")
	local var_204_1, var_204_2 = getActivityTask(arg_204_0, true)

	if not var_204_2 then
		pg.m02:sendNotification(GAME.ACTIVITY_OPERATION, {
			cmd = 1,
			activity_id = arg_204_0.id
		})

		return true
	end

	return false
end

function updateCrusingActivityTask(arg_205_0)
	local var_205_0 = getProxy(TaskProxy)
	local var_205_1 = arg_205_0:getNDay()
	local var_205_2 = pg.TimeMgr.GetInstance():GetServerOverWeek(arg_205_0:getStartTime())

	for iter_205_0, iter_205_1 in ipairs(arg_205_0:getConfig("config_data")) do
		local var_205_3 = pg.battlepass_task_group[iter_205_1]

		if var_205_3 and var_205_2 >= var_205_3.group_mask then
			if underscore.any(underscore.flatten(var_205_3.task_group), function(arg_206_0)
				return var_205_0:getTaskVO(arg_206_0) == nil
			end) then
				pg.m02:sendNotification(GAME.CRUSING_CMD, {
					cmd = 1,
					activity_id = arg_205_0.id
				})

				return true
			end
		elseif not var_205_3 then
			warning("battlepass_task_group表中不存在 id = " .. iter_205_1)
		end
	end

	return false
end

function setShipCardFrame(arg_207_0, arg_207_1, arg_207_2)
	arg_207_0.localScale = Vector3.one
	arg_207_0.anchorMin = Vector2.zero
	arg_207_0.anchorMax = Vector2.one

	local var_207_0 = arg_207_2 or arg_207_1

	GetImageSpriteFromAtlasAsync("shipframe", var_207_0, arg_207_0)

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

function setRectShipCardFrame(arg_208_0, arg_208_1, arg_208_2)
	arg_208_0.localScale = Vector3.one
	arg_208_0.anchorMin = Vector2.zero
	arg_208_0.anchorMax = Vector2.one

	setImageSprite(arg_208_0, GetSpriteFromAtlas("shipframeb", "b" .. (arg_208_2 or arg_208_1)))

	local var_208_0 = "b" .. (arg_208_2 or arg_208_1)
	local var_208_1 = pg.frame_resource[var_208_0]

	if var_208_1 then
		local var_208_2 = var_208_1.param

		arg_208_0.offsetMin = Vector2(var_208_2[1], var_208_2[2])
		arg_208_0.offsetMax = Vector2(var_208_2[3], var_208_2[4])
	else
		arg_208_0.offsetMin = Vector2.zero
		arg_208_0.offsetMax = Vector2.zero
	end
end

function setFrameEffect(arg_209_0, arg_209_1)
	if arg_209_1 then
		local var_209_0 = arg_209_1 .. "(Clone)"
		local var_209_1 = false

		eachChild(arg_209_0, function(arg_210_0)
			setActive(arg_210_0, arg_210_0.name == var_209_0)

			var_209_1 = var_209_1 or arg_210_0.name == var_209_0
		end)

		if not var_209_1 then
			LoadAndInstantiateAsync("effect", arg_209_1, function(arg_211_0)
				if IsNil(arg_209_0) or findTF(arg_209_0, var_209_0) then
					Object.Destroy(arg_211_0)
				else
					setParent(arg_211_0, arg_209_0)
					setActive(arg_211_0, true)
				end
			end)
		end
	end

	setActive(arg_209_0, arg_209_1)
end

function setProposeMarkIcon(arg_212_0, arg_212_1)
	local var_212_0 = arg_212_0:Find("proposeShipCard(Clone)")
	local var_212_1 = arg_212_1.propose and not arg_212_1:ShowPropose()

	if var_212_0 then
		setActive(var_212_0, var_212_1)
	elseif var_212_1 then
		pg.PoolMgr.GetInstance():GetUI("proposeShipCard", true, function(arg_213_0)
			if IsNil(arg_212_0) or arg_212_0:Find("proposeShipCard(Clone)") then
				pg.PoolMgr.GetInstance():ReturnUI("proposeShipCard", arg_213_0)
			else
				setParent(arg_213_0, arg_212_0, false)
			end
		end)
	end
end

function flushShipCard(arg_214_0, arg_214_1)
	local var_214_0 = arg_214_1:rarity2bgPrint()
	local var_214_1 = findTF(arg_214_0, "content/bg")

	GetImageSpriteFromAtlasAsync("bg/star_level_card_" .. var_214_0, "", var_214_1)

	local var_214_2 = findTF(arg_214_0, "content/ship_icon")
	local var_214_3 = arg_214_1 and {
		"shipYardIcon/" .. arg_214_1:getPainting(),
		arg_214_1:getPainting()
	} or {
		"shipYardIcon/unknown",
		""
	}

	GetImageSpriteFromAtlasAsync(var_214_3[1], var_214_3[2], var_214_2)

	local var_214_4 = arg_214_1:getShipType()
	local var_214_5 = findTF(arg_214_0, "content/info/top/type")

	GetImageSpriteFromAtlasAsync("shiptype", shipType2print(var_214_4), var_214_5)
	setText(findTF(arg_214_0, "content/dockyard/lv/Text"), defaultValue(arg_214_1.level, 1))

	local var_214_6 = arg_214_1:getStar()
	local var_214_7 = arg_214_1:getMaxStar()
	local var_214_8 = findTF(arg_214_0, "content/front/stars")

	setActive(var_214_8, true)

	local var_214_9 = findTF(var_214_8, "star_tpl")
	local var_214_10 = var_214_8.childCount

	for iter_214_0 = 1, Ship.CONFIG_MAX_STAR do
		local var_214_11 = var_214_10 < iter_214_0 and cloneTplTo(var_214_9, var_214_8) or var_214_8:GetChild(iter_214_0 - 1)

		setActive(var_214_11, iter_214_0 <= var_214_7)
		triggerToggle(var_214_11, iter_214_0 <= var_214_6)
	end

	local var_214_12 = findTF(arg_214_0, "content/front/frame")
	local var_214_13, var_214_14 = arg_214_1:GetFrameAndEffect()

	setShipCardFrame(var_214_12, var_214_0, var_214_13)
	setFrameEffect(findTF(arg_214_0, "content/front/bg_other"), var_214_14)
	setProposeMarkIcon(arg_214_0:Find("content/dockyard/propose"), arg_214_1)
end

function TweenItemAlphaAndWhite(arg_215_0)
	LeanTween.cancel(arg_215_0)

	local var_215_0 = GetOrAddComponent(arg_215_0, "CanvasGroup")

	var_215_0.alpha = 0

	LeanTween.alphaCanvas(var_215_0, 1, 0.2):setUseEstimatedTime(true)

	local var_215_1 = findTF(arg_215_0.transform, "white_mask")

	if var_215_1 then
		setActive(var_215_1, false)
	end
end

function ClearTweenItemAlphaAndWhite(arg_216_0)
	LeanTween.cancel(arg_216_0)

	GetOrAddComponent(arg_216_0, "CanvasGroup").alpha = 0
end

function getGroupOwnSkins(arg_217_0)
	local var_217_0 = {}
	local var_217_1 = getProxy(ShipSkinProxy):getSkinList()
	local var_217_2 = getProxy(CollectionProxy):getShipGroup(arg_217_0)

	if var_217_2 then
		local var_217_3 = ShipGroup.getSkinList(arg_217_0)

		for iter_217_0, iter_217_1 in ipairs(var_217_3) do
			if iter_217_1.skin_type == ShipSkin.SKIN_TYPE_DEFAULT or table.contains(var_217_1, iter_217_1.id) or iter_217_1.skin_type == ShipSkin.SKIN_TYPE_REMAKE and var_217_2.trans or iter_217_1.skin_type == ShipSkin.SKIN_TYPE_PROPOSE and var_217_2.married == 1 then
				var_217_0[iter_217_1.id] = true
			end
		end
	end

	return var_217_0
end

function split(arg_218_0, arg_218_1)
	local var_218_0 = {}

	if not arg_218_0 then
		return nil
	end

	local var_218_1 = #arg_218_0
	local var_218_2 = 1

	while var_218_2 <= var_218_1 do
		local var_218_3 = string.find(arg_218_0, arg_218_1, var_218_2)

		if var_218_3 == nil then
			table.insert(var_218_0, string.sub(arg_218_0, var_218_2, var_218_1))

			break
		end

		table.insert(var_218_0, string.sub(arg_218_0, var_218_2, var_218_3 - 1))

		if var_218_3 == var_218_1 then
			table.insert(var_218_0, "")

			break
		end

		var_218_2 = var_218_3 + 1
	end

	return var_218_0
end

function NumberToChinese(arg_219_0, arg_219_1)
	local var_219_0 = ""
	local var_219_1 = #arg_219_0

	for iter_219_0 = 1, var_219_1 do
		local var_219_2 = string.sub(arg_219_0, iter_219_0, iter_219_0)

		if var_219_2 ~= "0" or var_219_2 == "0" and not arg_219_1 then
			if arg_219_1 then
				if var_219_1 >= 2 then
					if iter_219_0 == 1 then
						if var_219_2 == "1" then
							var_219_0 = i18n("number_" .. 10)
						else
							var_219_0 = i18n("number_" .. var_219_2) .. i18n("number_" .. 10)
						end
					else
						var_219_0 = var_219_0 .. i18n("number_" .. var_219_2)
					end
				else
					var_219_0 = var_219_0 .. i18n("number_" .. var_219_2)
				end
			else
				var_219_0 = var_219_0 .. i18n("number_" .. var_219_2)
			end
		end
	end

	return var_219_0
end

function getActivityTask(arg_220_0, arg_220_1)
	local var_220_0 = getProxy(TaskProxy)
	local var_220_1 = arg_220_0:getConfig("config_data")
	local var_220_2 = arg_220_0:getNDay(arg_220_0.data1)
	local var_220_3
	local var_220_4
	local var_220_5

	for iter_220_0 = math.max(arg_220_0.data3, 1), math.min(var_220_2, #var_220_1) do
		local var_220_6 = _.flatten({
			var_220_1[iter_220_0]
		})

		for iter_220_1, iter_220_2 in ipairs(var_220_6) do
			local var_220_7 = var_220_0:getTaskById(iter_220_2)

			if var_220_7 then
				return var_220_7.id, var_220_7
			end

			if var_220_4 then
				var_220_5 = var_220_0:getFinishTaskById(iter_220_2)

				if var_220_5 then
					var_220_4 = var_220_5
				elseif arg_220_1 then
					return iter_220_2
				else
					return var_220_4.id, var_220_4
				end
			else
				var_220_4 = var_220_0:getFinishTaskById(iter_220_2)
				var_220_5 = var_220_5 or iter_220_2
			end
		end
	end

	if var_220_4 then
		return var_220_4.id, var_220_4
	else
		return var_220_5
	end
end

function setImageFromImage(arg_221_0, arg_221_1, arg_221_2)
	local var_221_0 = GetComponent(arg_221_0, "Image")

	var_221_0.sprite = GetComponent(arg_221_1, "Image").sprite

	if arg_221_2 then
		var_221_0:SetNativeSize()
	end
end

function skinTimeStamp(arg_222_0)
	local var_222_0, var_222_1, var_222_2, var_222_3 = pg.TimeMgr.GetInstance():parseTimeFrom(arg_222_0)

	if var_222_0 >= 1 then
		return i18n("limit_skin_time_day", var_222_0)
	elseif var_222_0 <= 0 and var_222_1 > 0 then
		return i18n("limit_skin_time_day_min", var_222_1, var_222_2)
	elseif var_222_0 <= 0 and var_222_1 <= 0 and (var_222_2 > 0 or var_222_3 > 0) then
		return i18n("limit_skin_time_min", math.max(var_222_2, 1))
	elseif var_222_0 <= 0 and var_222_1 <= 0 and var_222_2 <= 0 and var_222_3 <= 0 then
		return i18n("limit_skin_time_overtime")
	end
end

function skinCommdityTimeStamp(arg_223_0)
	local var_223_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_223_1 = math.max(arg_223_0 - var_223_0, 0)
	local var_223_2 = math.floor(var_223_1 / 86400)

	if var_223_2 > 0 then
		return i18n("time_remaining_tip") .. var_223_2 .. i18n("word_date")
	else
		local var_223_3 = math.floor(var_223_1 / 3600)

		if var_223_3 > 0 then
			return i18n("time_remaining_tip") .. var_223_3 .. i18n("word_hour")
		else
			local var_223_4 = math.floor(var_223_1 / 60)

			if var_223_4 > 0 then
				return i18n("time_remaining_tip") .. var_223_4 .. i18n("word_minute")
			else
				return i18n("time_remaining_tip") .. var_223_1 .. i18n("word_second")
			end
		end
	end
end

function InstagramTimeStamp(arg_224_0)
	local var_224_0 = pg.TimeMgr.GetInstance():GetServerTime() - arg_224_0
	local var_224_1 = var_224_0 / 86400

	if var_224_1 > 1 then
		return i18n("ins_word_day", math.floor(var_224_1))
	else
		local var_224_2 = var_224_0 / 3600

		if var_224_2 > 1 then
			return i18n("ins_word_hour", math.floor(var_224_2))
		else
			local var_224_3 = var_224_0 / 60

			if var_224_3 > 1 then
				return i18n("ins_word_minu", math.floor(var_224_3))
			else
				return i18n("ins_word_minu", 1)
			end
		end
	end
end

function InstagramReplyTimeStamp(arg_225_0)
	local var_225_0 = pg.TimeMgr.GetInstance():GetServerTime() - arg_225_0
	local var_225_1 = var_225_0 / 86400

	if var_225_1 > 1 then
		return i18n1(math.floor(var_225_1) .. "d")
	else
		local var_225_2 = var_225_0 / 3600

		if var_225_2 > 1 then
			return i18n1(math.floor(var_225_2) .. "h")
		else
			local var_225_3 = var_225_0 / 60

			if var_225_3 > 1 then
				return i18n1(math.floor(var_225_3) .. "min")
			else
				return i18n1("1min")
			end
		end
	end
end

function attireTimeStamp(arg_226_0)
	local var_226_0, var_226_1, var_226_2, var_226_3 = pg.TimeMgr.GetInstance():parseTimeFrom(arg_226_0)

	if var_226_0 <= 0 and var_226_1 <= 0 and var_226_2 <= 0 and var_226_3 <= 0 then
		return i18n("limit_skin_time_overtime")
	else
		return i18n("attire_time_stamp", var_226_0, var_226_1, var_226_2)
	end
end

function checkExist(arg_227_0, ...)
	local var_227_0 = {
		...
	}

	for iter_227_0, iter_227_1 in ipairs(var_227_0) do
		if arg_227_0 == nil then
			break
		end

		assert(type(arg_227_0) == "table", "type error : intermediate target should be table")
		assert(type(iter_227_1) == "table", "type error : param should be table")

		if type(arg_227_0[iter_227_1[1]]) == "function" then
			arg_227_0 = arg_227_0[iter_227_1[1]](arg_227_0, unpack(iter_227_1[2] or {}))
		else
			arg_227_0 = arg_227_0[iter_227_1[1]]
		end
	end

	return arg_227_0
end

function AcessWithinNull(arg_228_0, arg_228_1)
	if arg_228_0 == nil then
		return
	end

	assert(type(arg_228_0) == "table")

	return arg_228_0[arg_228_1]
end

function showRepairMsgbox()
	local var_229_0 = {
		text = i18n("msgbox_repair"),
		onCallback = function()
			if PathMgr.FileExists(Application.persistentDataPath .. "/hashes.csv") then
				BundleWizard.Inst:GetGroupMgr("DEFAULT_RES"):StartVerifyForLua()
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("word_no_cache"))
			end
		end
	}
	local var_229_1 = {
		text = i18n("msgbox_repair_l2d"),
		onCallback = function()
			if PathMgr.FileExists(Application.persistentDataPath .. "/hashes-live2d.csv") then
				BundleWizard.Inst:GetGroupMgr("L2D"):StartVerifyForLua()
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("word_no_cache"))
			end
		end
	}
	local var_229_2 = {
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
			var_229_2,
			var_229_1,
			var_229_0
		}
	})
end

function resourceVerify(arg_233_0, arg_233_1)
	if CSharpVersion > 35 then
		BundleWizard.Inst:GetGroupMgr("DEFAULT_RES"):StartVerifyForLua()

		return
	end

	local var_233_0 = Application.persistentDataPath .. "/hashes.csv"
	local var_233_1
	local var_233_2 = PathMgr.ReadAllLines(var_233_0)
	local var_233_3 = {}

	if arg_233_0 then
		setActive(arg_233_0, true)
	else
		pg.UIMgr.GetInstance():LoadingOn()
	end

	local function var_233_4()
		if arg_233_0 then
			setActive(arg_233_0, false)
		else
			pg.UIMgr.GetInstance():LoadingOff()
		end

		print(var_233_1)

		if var_233_1 then
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

	local var_233_5 = var_233_2.Length
	local var_233_6

	local function var_233_7(arg_236_0)
		if arg_236_0 < 0 then
			var_233_4()

			return
		end

		if arg_233_1 then
			setSlider(arg_233_1, 0, var_233_5, var_233_5 - arg_236_0)
		end

		local var_236_0 = string.split(var_233_2[arg_236_0], ",")
		local var_236_1 = var_236_0[1]
		local var_236_2 = var_236_0[3]
		local var_236_3 = PathMgr.getAssetBundle(var_236_1)

		if PathMgr.FileExists(var_236_3) then
			local var_236_4 = PathMgr.ReadAllBytes(PathMgr.getAssetBundle(var_236_1))

			if var_236_2 == HashUtil.CalcMD5(var_236_4) then
				onNextTick(function()
					var_233_7(arg_236_0 - 1)
				end)

				return
			end
		end

		var_233_1 = var_236_1

		var_233_4()
	end

	var_233_7(var_233_5 - 1)
end

function splitByWordEN(arg_238_0, arg_238_1)
	local var_238_0 = string.split(arg_238_0, " ")
	local var_238_1 = ""
	local var_238_2 = ""
	local var_238_3 = arg_238_1:GetComponent(typeof(RectTransform))
	local var_238_4 = arg_238_1:GetComponent(typeof(Text))
	local var_238_5 = var_238_3.rect.width

	for iter_238_0, iter_238_1 in ipairs(var_238_0) do
		local var_238_6 = var_238_2

		var_238_2 = var_238_2 == "" and iter_238_1 or var_238_2 .. " " .. iter_238_1

		setText(arg_238_1, var_238_2)

		if var_238_5 < var_238_4.preferredWidth then
			var_238_1 = var_238_1 == "" and var_238_6 or var_238_1 .. "\n" .. var_238_6
			var_238_2 = iter_238_1
		end

		if iter_238_0 >= #var_238_0 then
			var_238_1 = var_238_1 == "" and var_238_2 or var_238_1 .. "\n" .. var_238_2
		end
	end

	return var_238_1
end

function checkBirthFormat(arg_239_0)
	if #arg_239_0 ~= 8 then
		return false
	end

	local var_239_0 = 0
	local var_239_1 = #arg_239_0

	while var_239_0 < var_239_1 do
		local var_239_2 = string.byte(arg_239_0, var_239_0 + 1)

		if var_239_2 < 48 or var_239_2 > 57 then
			return false
		end

		var_239_0 = var_239_0 + 1
	end

	return true
end

function isHalfBodyLive2D(arg_240_0)
	local var_240_0 = {
		"biaoqiang",
		"z23",
		"lafei",
		"lingbo",
		"mingshi",
		"xuefeng"
	}

	return _.any(var_240_0, function(arg_241_0)
		return arg_241_0 == arg_240_0
	end)
end

function GetServerState(arg_242_0)
	local var_242_0 = -1
	local var_242_1 = 0
	local var_242_2 = 1
	local var_242_3 = 2
	local var_242_4 = NetConst.GetServerStateUrl()

	if PLATFORM_CODE == PLATFORM_CH then
		var_242_4 = string.gsub(var_242_4, "https", "http")
	end

	VersionMgr.Inst:WebRequest(var_242_4, function(arg_243_0, arg_243_1)
		local var_243_0 = true
		local var_243_1 = false

		for iter_243_0 in string.gmatch(arg_243_1, "\"state\":%d") do
			if iter_243_0 ~= "\"state\":1" then
				var_243_0 = false
			end

			var_243_1 = true
		end

		if not var_243_1 then
			var_243_0 = false
		end

		if arg_242_0 ~= nil then
			arg_242_0(var_243_0 and var_242_2 or var_242_1)
		end
	end)
end

function setScrollText(arg_244_0, arg_244_1)
	GetOrAddComponent(arg_244_0, "ScrollText"):SetText(arg_244_1)
end

function changeToScrollText(arg_245_0, arg_245_1)
	local var_245_0 = GetComponent(arg_245_0, typeof(Text))

	assert(var_245_0, "without component<Text>")

	local var_245_1 = arg_245_0:Find("subText")

	if not var_245_1 then
		var_245_1 = cloneTplTo(arg_245_0, arg_245_0, "subText")

		eachChild(arg_245_0, function(arg_246_0)
			setActive(arg_246_0, arg_246_0 == var_245_1)
		end)

		arg_245_0:GetComponent(typeof(Text)).enabled = false
	end

	setScrollText(var_245_1, arg_245_1)
end

local var_0_17
local var_0_18
local var_0_19
local var_0_20

local function var_0_21(arg_247_0, arg_247_1, arg_247_2)
	local var_247_0 = arg_247_0:Find("base")
	local var_247_1, var_247_2, var_247_3 = Equipment.GetInfoTrans(arg_247_1, arg_247_2)

	if arg_247_1.nextValue then
		local var_247_4 = {
			name = arg_247_1.name,
			type = arg_247_1.type,
			value = arg_247_1.nextValue
		}
		local var_247_5, var_247_6 = Equipment.GetInfoTrans(var_247_4, arg_247_2)

		var_247_2 = var_247_2 .. setColorStr("   >   " .. var_247_6, COLOR_GREEN)
	end

	setText(var_247_0:Find("name"), var_247_1)

	if var_247_3 then
		local var_247_7 = "<color=#afff72>(+" .. ys.Battle.BattleConst.UltimateBonus.AuxBoostValue * 100 .. "%)</color>"

		setText(var_247_0:Find("value"), var_247_2 .. var_247_7)
	else
		setText(var_247_0:Find("value"), var_247_2)
	end

	setActive(var_247_0:Find("value/up"), arg_247_1.compare and arg_247_1.compare > 0)
	setActive(var_247_0:Find("value/down"), arg_247_1.compare and arg_247_1.compare < 0)
	triggerToggle(var_247_0, arg_247_1.lock_open)

	if not arg_247_1.lock_open and arg_247_1.sub and #arg_247_1.sub > 0 then
		GetComponent(var_247_0, typeof(Toggle)).enabled = true
	else
		setActive(var_247_0:Find("name/close"), false)
		setActive(var_247_0:Find("name/open"), false)

		GetComponent(var_247_0, typeof(Toggle)).enabled = false
	end
end

local function var_0_22(arg_248_0, arg_248_1, arg_248_2, arg_248_3)
	var_0_21(arg_248_0, arg_248_2, arg_248_3)

	if not arg_248_2.sub or #arg_248_2.sub == 0 then
		return
	end

	var_0_19(arg_248_0:Find("subs"), arg_248_1, arg_248_2.sub, arg_248_3)
end

function var_0_19(arg_249_0, arg_249_1, arg_249_2, arg_249_3)
	removeAllChildren(arg_249_0)
	var_0_20(arg_249_0, arg_249_1, arg_249_2, arg_249_3)
end

function var_0_20(arg_250_0, arg_250_1, arg_250_2, arg_250_3)
	for iter_250_0, iter_250_1 in ipairs(arg_250_2) do
		local var_250_0 = cloneTplTo(arg_250_1, arg_250_0)

		var_0_22(var_250_0, arg_250_1, iter_250_1, arg_250_3)
	end
end

function updateEquipInfo(arg_251_0, arg_251_1, arg_251_2, arg_251_3)
	local var_251_0 = arg_251_0:Find("attr_tpl")

	var_0_19(arg_251_0:Find("attrs"), var_251_0, arg_251_1.attrs, arg_251_3)
	setActive(arg_251_0:Find("skill"), arg_251_2)

	if arg_251_2 then
		var_0_22(arg_251_0:Find("skill/attr"), var_251_0, {
			name = i18n("skill"),
			value = setColorStr(arg_251_2.name, "#FFDE00FF")
		}, arg_251_3)
		setText(arg_251_0:Find("skill/value/Text"), getSkillDescGet(arg_251_2.id))
	end

	setActive(arg_251_0:Find("weapon"), #arg_251_1.weapon.sub > 0)

	if #arg_251_1.weapon.sub > 0 then
		var_0_19(arg_251_0:Find("weapon"), var_251_0, {
			arg_251_1.weapon
		}, arg_251_3)
	end

	setActive(arg_251_0:Find("equip_info"), #arg_251_1.equipInfo.sub > 0)

	if #arg_251_1.equipInfo.sub > 0 then
		var_0_19(arg_251_0:Find("equip_info"), var_251_0, {
			arg_251_1.equipInfo
		}, arg_251_3)
	end

	var_0_22(arg_251_0:Find("part/attr"), var_251_0, {
		name = i18n("equip_info_23")
	}, arg_251_3)

	local var_251_1 = arg_251_0:Find("part/value")
	local var_251_2 = var_251_1:Find("label")
	local var_251_3 = {}
	local var_251_4 = {}

	if #arg_251_1.part[1] == 0 and #arg_251_1.part[2] == 0 then
		setmetatable(var_251_3, {
			__index = function(arg_252_0, arg_252_1)
				return true
			end
		})
		setmetatable(var_251_4, {
			__index = function(arg_253_0, arg_253_1)
				return true
			end
		})
	else
		for iter_251_0, iter_251_1 in ipairs(arg_251_1.part[1]) do
			var_251_3[iter_251_1] = true
		end

		for iter_251_2, iter_251_3 in ipairs(arg_251_1.part[2]) do
			var_251_4[iter_251_3] = true
		end
	end

	local var_251_5 = ShipType.MergeFengFanType(ShipType.FilterOverQuZhuType(ShipType.AllShipType), var_251_3, var_251_4)

	UIItemList.StaticAlign(var_251_1, var_251_2, #var_251_5, function(arg_254_0, arg_254_1, arg_254_2)
		arg_254_1 = arg_254_1 + 1

		if arg_254_0 == UIItemList.EventUpdate then
			local var_254_0 = var_251_5[arg_254_1]

			GetImageSpriteFromAtlasAsync("shiptype", ShipType.Type2CNLabel(var_254_0), arg_254_2)
			setActive(arg_254_2:Find("main"), var_251_3[var_254_0] and not var_251_4[var_254_0])
			setActive(arg_254_2:Find("sub"), var_251_4[var_254_0] and not var_251_3[var_254_0])
			setImageAlpha(arg_254_2, not var_251_3[var_254_0] and not var_251_4[var_254_0] and 0.3 or 1)
		end
	end)
end

function updateEquipUpgradeInfo(arg_255_0, arg_255_1, arg_255_2)
	local var_255_0 = arg_255_0:Find("attr_tpl")

	var_0_19(arg_255_0:Find("attrs"), var_255_0, arg_255_1.attrs, arg_255_2)
	setActive(arg_255_0:Find("weapon"), #arg_255_1.weapon.sub > 0)

	if #arg_255_1.weapon.sub > 0 then
		var_0_19(arg_255_0:Find("weapon"), var_255_0, {
			arg_255_1.weapon
		}, arg_255_2)
	end

	setActive(arg_255_0:Find("equip_info"), #arg_255_1.equipInfo.sub > 0)

	if #arg_255_1.equipInfo.sub > 0 then
		var_0_19(arg_255_0:Find("equip_info"), var_255_0, {
			arg_255_1.equipInfo
		}, arg_255_2)
	end
end

function setCanvasOverrideSorting(arg_256_0, arg_256_1)
	local var_256_0 = arg_256_0.parent

	arg_256_0:SetParent(pg.LayerWeightMgr.GetInstance().uiOrigin, false)

	if isActive(arg_256_0) then
		GetOrAddComponent(arg_256_0, typeof(Canvas)).overrideSorting = arg_256_1
	else
		setActive(arg_256_0, true)

		GetOrAddComponent(arg_256_0, typeof(Canvas)).overrideSorting = arg_256_1

		setActive(arg_256_0, false)
	end

	arg_256_0:SetParent(var_256_0, false)
end

function createNewGameObject(arg_257_0, arg_257_1)
	local var_257_0 = GameObject.New()

	if arg_257_0 then
		var_257_0.name = "model"
	end

	var_257_0.layer = arg_257_1 or Layer.UI

	return GetOrAddComponent(var_257_0, "RectTransform")
end

function CreateShell(arg_258_0)
	if type(arg_258_0) ~= "table" and type(arg_258_0) ~= "userdata" then
		return arg_258_0
	end

	local var_258_0 = setmetatable({
		__index = arg_258_0
	}, arg_258_0)

	return setmetatable({}, var_258_0)
end

function CameraFittingSettin(arg_259_0)
	local var_259_0 = GetComponent(arg_259_0, typeof(Camera))
	local var_259_1 = 1.7777777777777777
	local var_259_2 = Screen.width / Screen.height

	if var_259_2 < var_259_1 then
		local var_259_3 = var_259_2 / var_259_1

		var_259_0.rect = var_0_0.Rect.New(0, (1 - var_259_3) / 2, 1, var_259_3)
	end
end

function SwitchSpecialChar(arg_260_0, arg_260_1)
	if PLATFORM_CODE ~= PLATFORM_US then
		arg_260_0 = arg_260_0:gsub(" ", " ")
		arg_260_0 = arg_260_0:gsub("\t", "    ")
	end

	if not arg_260_1 then
		arg_260_0 = arg_260_0:gsub("\n", " ")
	end

	return arg_260_0
end

function AfterCheck(arg_261_0, arg_261_1)
	local var_261_0 = {}

	for iter_261_0, iter_261_1 in ipairs(arg_261_0) do
		var_261_0[iter_261_0] = iter_261_1[1]()
	end

	arg_261_1()

	for iter_261_2, iter_261_3 in ipairs(arg_261_0) do
		if var_261_0[iter_261_2] ~= iter_261_3[1]() then
			iter_261_3[2]()
		end

		var_261_0[iter_261_2] = iter_261_3[1]()
	end
end

function CompareFuncs(arg_262_0, arg_262_1)
	local var_262_0 = {}

	local function var_262_1(arg_263_0, arg_263_1)
		var_262_0[arg_263_0] = var_262_0[arg_263_0] or {}
		var_262_0[arg_263_0][arg_263_1] = var_262_0[arg_263_0][arg_263_1] or arg_262_0[arg_263_0](arg_263_1)

		return var_262_0[arg_263_0][arg_263_1]
	end

	return function(arg_264_0, arg_264_1)
		local var_264_0 = 1

		while var_264_0 <= #arg_262_0 do
			local var_264_1 = var_262_1(var_264_0, arg_264_0)
			local var_264_2 = var_262_1(var_264_0, arg_264_1)

			if var_264_1 == var_264_2 then
				var_264_0 = var_264_0 + 1
			else
				return var_264_1 < var_264_2
			end
		end

		return tobool(arg_262_1)
	end
end

function DropResultIntegration(arg_265_0)
	local var_265_0 = {}
	local var_265_1 = 1

	while var_265_1 <= #arg_265_0 do
		local var_265_2 = arg_265_0[var_265_1].type
		local var_265_3 = arg_265_0[var_265_1].id

		var_265_0[var_265_2] = var_265_0[var_265_2] or {}

		if var_265_0[var_265_2][var_265_3] then
			local var_265_4 = arg_265_0[var_265_0[var_265_2][var_265_3]]
			local var_265_5 = table.remove(arg_265_0, var_265_1)

			var_265_4.count = var_265_4.count + var_265_5.count
		else
			var_265_0[var_265_2][var_265_3] = var_265_1
			var_265_1 = var_265_1 + 1
		end
	end

	local var_265_6 = {
		function(arg_266_0)
			local var_266_0 = arg_266_0.type
			local var_266_1 = arg_266_0.id

			if var_266_0 == DROP_TYPE_SHIP then
				return 1
			elseif var_266_0 == DROP_TYPE_RESOURCE then
				if var_266_1 == 1 then
					return 2
				else
					return 3
				end
			elseif var_266_0 == DROP_TYPE_ITEM then
				if var_266_1 == 59010 then
					return 4
				elseif var_266_1 == 59900 then
					return 5
				else
					local var_266_2 = Item.getConfigData(var_266_1)
					local var_266_3 = var_266_2 and var_266_2.type or 0

					if var_266_3 == 9 then
						return 6
					elseif var_266_3 == 5 then
						return 7
					elseif var_266_3 == 4 then
						return 8
					elseif var_266_3 == 7 then
						return 9
					end
				end
			elseif var_266_0 == DROP_TYPE_VITEM and var_266_1 == 59011 then
				return 4
			end

			return 100
		end,
		function(arg_267_0)
			local var_267_0

			if arg_267_0.type == DROP_TYPE_SHIP then
				var_267_0 = pg.ship_data_statistics[arg_267_0.id]
			elseif arg_267_0.type == DROP_TYPE_ITEM then
				var_267_0 = Item.getConfigData(arg_267_0.id)
			end

			return (var_267_0 and var_267_0.rarity or 0) * -1
		end,
		function(arg_268_0)
			return arg_268_0.id
		end
	}

	table.sort(arg_265_0, CompareFuncs(var_265_6))
end

function getLoginConfig()
	local var_269_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_269_1 = 1

	for iter_269_0, iter_269_1 in ipairs(pg.login.all) do
		if pg.login[iter_269_1].date ~= "stop" then
			local var_269_2, var_269_3 = parseTimeConfig(pg.login[iter_269_1].date)

			assert(not var_269_3)

			if pg.TimeMgr.GetInstance():inTime(var_269_2, var_269_0) then
				var_269_1 = iter_269_1

				break
			end
		end
	end

	local var_269_4 = pg.login[var_269_1].login_static

	var_269_4 = var_269_4 ~= "" and var_269_4 or "login"

	local var_269_5 = pg.login[var_269_1].login_cri
	local var_269_6 = var_269_5 ~= "" and true or false
	local var_269_7 = pg.login[var_269_1].op_play == 1 and true or false
	local var_269_8 = pg.login[var_269_1].op_time

	if var_269_8 == "" or not pg.TimeMgr.GetInstance():inTime(var_269_8, var_269_0) then
		var_269_7 = false
	end

	local var_269_9 = var_269_8 == "" and var_269_8 or table.concat(var_269_8[1][1])

	return var_269_6, var_269_6 and var_269_5 or var_269_4, pg.login[var_269_1].bgm, var_269_7, var_269_9
end

function setIntimacyIcon(arg_270_0, arg_270_1, arg_270_2)
	local var_270_0 = {}
	local var_270_1

	seriesAsync({
		function(arg_271_0)
			if arg_270_0.childCount > 0 then
				var_270_1 = arg_270_0:GetChild(0)

				arg_271_0()
			else
				LoadAndInstantiateAsync("template", "intimacytpl", function(arg_272_0)
					var_270_1 = tf(arg_272_0)

					setParent(var_270_1, arg_270_0)
					arg_271_0()
				end)
			end
		end,
		function(arg_273_0)
			setImageAlpha(var_270_1, arg_270_2 and 0 or 1)
			eachChild(var_270_1, function(arg_274_0)
				setActive(arg_274_0, false)
			end)

			if arg_270_2 then
				local var_273_0 = var_270_1:Find(arg_270_2 .. "(Clone)")

				if not var_273_0 then
					LoadAndInstantiateAsync("ui", arg_270_2, function(arg_275_0)
						setParent(arg_275_0, var_270_1)
						setActive(arg_275_0, true)
					end)
				else
					setActive(var_273_0, true)
				end
			elseif arg_270_1 then
				setImageSprite(var_270_1, GetSpriteFromAtlas("energy", arg_270_1), true)
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

function switch(arg_278_0, arg_278_1, arg_278_2, ...)
	if arg_278_1[arg_278_0] then
		return arg_278_1[arg_278_0](...)
	elseif arg_278_2 then
		return arg_278_2(...)
	end
end

function parseTimeConfig(arg_279_0)
	if type(arg_279_0[1]) == "table" then
		return arg_279_0[2], arg_279_0[1]
	else
		return arg_279_0
	end
end

local var_0_24 = {
	__add = function(arg_280_0, arg_280_1)
		return NewPos(arg_280_0.x + arg_280_1.x, arg_280_0.y + arg_280_1.y)
	end,
	__sub = function(arg_281_0, arg_281_1)
		return NewPos(arg_281_0.x - arg_281_1.x, arg_281_0.y - arg_281_1.y)
	end,
	__mul = function(arg_282_0, arg_282_1)
		if type(arg_282_1) == "number" then
			return NewPos(arg_282_0.x * arg_282_1, arg_282_0.y * arg_282_1)
		else
			return NewPos(arg_282_0.x * arg_282_1.x, arg_282_0.y * arg_282_1.y)
		end
	end,
	__eq = function(arg_283_0, arg_283_1)
		return arg_283_0.x == arg_283_1.x and arg_283_0.y == arg_283_1.y
	end,
	__tostring = function(arg_284_0)
		return arg_284_0.x .. "_" .. arg_284_0.y
	end
}

function NewPos(arg_285_0, arg_285_1)
	assert(arg_285_0 and arg_285_1)

	local var_285_0 = setmetatable({
		x = arg_285_0,
		y = arg_285_1
	}, var_0_24)

	function var_285_0.SqrMagnitude(arg_286_0)
		return arg_286_0.x * arg_286_0.x + arg_286_0.y * arg_286_0.y
	end

	function var_285_0.Normalize(arg_287_0)
		local var_287_0 = arg_287_0:SqrMagnitude()

		if var_287_0 > 1e-05 then
			return arg_287_0 * (1 / math.sqrt(var_287_0))
		else
			return NewPos(0, 0)
		end
	end

	return var_285_0
end

local var_0_25

function Timekeeping()
	warning(Time.realtimeSinceStartup - (var_0_25 or Time.realtimeSinceStartup), Time.realtimeSinceStartup)

	var_0_25 = Time.realtimeSinceStartup
end

function GetRomanDigit(arg_289_0)
	return (string.char(226, 133, 160 + (arg_289_0 - 1)))
end

function quickPlayAnimator(arg_290_0, arg_290_1)
	arg_290_0:GetComponent(typeof(Animator)):Play(arg_290_1, -1, 0)
end

function quickCheckAndPlayAnimator(arg_291_0, arg_291_1)
	local var_291_0 = arg_291_0:GetComponent(typeof(Animator))
	local var_291_1 = Animator.StringToHash(arg_291_1)

	if var_291_0:HasState(0, var_291_1) then
		var_291_0:Play(arg_291_1, -1, 0)
	end
end

function quickPlayAnimation(arg_292_0, arg_292_1)
	arg_292_0:GetComponent(typeof(Animation)):Play(arg_292_1)
end

function getSurveyUrl(arg_293_0)
	local var_293_0 = pg.survey_data_template[arg_293_0]
	local var_293_1

	if not IsUnityEditor then
		if PLATFORM_CODE == PLATFORM_CH then
			local var_293_2 = getProxy(UserProxy):GetCacheGatewayInServerLogined()

			if var_293_2 == PLATFORM_ANDROID then
				if LuaHelper.GetCHPackageType() == PACKAGE_TYPE_BILI then
					var_293_1 = var_293_0.main_url
				else
					var_293_1 = var_293_0.uo_url
				end
			elseif var_293_2 == PLATFORM_IPHONEPLAYER then
				var_293_1 = var_293_0.ios_url
			end
		elseif PLATFORM_CODE == PLATFORM_US or PLATFORM_CODE == PLATFORM_JP then
			var_293_1 = var_293_0.main_url
		end
	else
		var_293_1 = var_293_0.main_url
	end

	local var_293_3 = getProxy(PlayerProxy):getRawData().id
	local var_293_4 = getProxy(UserProxy):getRawData().arg2 or ""
	local var_293_5
	local var_293_6 = PLATFORM == PLATFORM_ANDROID and 1 or PLATFORM == PLATFORM_IPHONEPLAYER and 2 or 3
	local var_293_7 = getProxy(UserProxy):getRawData()
	local var_293_8 = getProxy(ServerProxy):getRawData()[var_293_7 and var_293_7.server or 0]
	local var_293_9 = var_293_8 and var_293_8.id or ""
	local var_293_10 = getProxy(PlayerProxy):getRawData().level
	local var_293_11 = var_293_3 .. "_" .. arg_293_0
	local var_293_12 = var_293_1
	local var_293_13 = {
		var_293_3,
		var_293_4,
		var_293_6,
		var_293_9,
		var_293_10,
		var_293_11
	}

	if var_293_12 then
		for iter_293_0, iter_293_1 in ipairs(var_293_13) do
			var_293_12 = string.gsub(var_293_12, "$" .. iter_293_0, tostring(iter_293_1))
		end
	end

	warning(var_293_12)

	return var_293_12
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

function FilterVarchar(arg_295_0)
	assert(type(arg_295_0) == "string" or type(arg_295_0) == "table")

	if arg_295_0 == "" then
		return nil
	end

	return arg_295_0
end

function getGameset(arg_296_0)
	local var_296_0 = pg.gameset[arg_296_0]

	assert(var_296_0)

	return {
		var_296_0.key_value,
		var_296_0.description
	}
end

function getDorm3dGameset(arg_297_0)
	local var_297_0 = pg.dorm3d_set[arg_297_0]

	assert(var_297_0)

	return {
		var_297_0.key_value_int,
		var_297_0.key_value_varchar
	}
end

function GetItemsOverflowDic(arg_298_0)
	arg_298_0 = arg_298_0 or {}

	local var_298_0 = {
		[DROP_TYPE_ITEM] = {},
		[DROP_TYPE_RESOURCE] = {},
		[DROP_TYPE_EQUIP] = 0,
		[DROP_TYPE_SHIP] = 0,
		[DROP_TYPE_WORLD_ITEM] = 0
	}

	while #arg_298_0 > 0 do
		local var_298_1 = table.remove(arg_298_0)

		switch(var_298_1.type, {
			[DROP_TYPE_ITEM] = function()
				if var_298_1:getConfig("open_directly") == 1 then
					for iter_299_0, iter_299_1 in ipairs(var_298_1:getConfig("display_icon")) do
						local var_299_0 = Drop.Create(iter_299_1)

						var_299_0.count = var_299_0.count * var_298_1.count

						table.insert(arg_298_0, var_299_0)
					end
				elseif var_298_1:getSubClass():IsShipExpType() then
					var_298_0[var_298_1.type][var_298_1.id] = defaultValue(var_298_0[var_298_1.type][var_298_1.id], 0) + var_298_1.count
				end
			end,
			[DROP_TYPE_RESOURCE] = function()
				var_298_0[var_298_1.type][var_298_1.id] = defaultValue(var_298_0[var_298_1.type][var_298_1.id], 0) + var_298_1.count
			end,
			[DROP_TYPE_EQUIP] = function()
				var_298_0[var_298_1.type] = var_298_0[var_298_1.type] + var_298_1.count
			end,
			[DROP_TYPE_SHIP] = function()
				var_298_0[var_298_1.type] = var_298_0[var_298_1.type] + var_298_1.count
			end,
			[DROP_TYPE_WORLD_ITEM] = function()
				var_298_0[var_298_1.type] = var_298_0[var_298_1.type] + var_298_1.count
			end
		})
	end

	return var_298_0
end

function CheckOverflow(arg_304_0, arg_304_1)
	local var_304_0 = {}
	local var_304_1 = arg_304_0[DROP_TYPE_RESOURCE][PlayerConst.ResGold] or 0
	local var_304_2 = arg_304_0[DROP_TYPE_RESOURCE][PlayerConst.ResOil] or 0
	local var_304_3 = arg_304_0[DROP_TYPE_EQUIP]
	local var_304_4 = arg_304_0[DROP_TYPE_SHIP]
	local var_304_5 = getProxy(PlayerProxy):getRawData()
	local var_304_6 = false

	if arg_304_1 then
		local var_304_7 = var_304_5:OverStore(PlayerConst.ResStoreGold, var_304_1)
		local var_304_8 = var_304_5:OverStore(PlayerConst.ResStoreOil, var_304_2)

		if var_304_7 > 0 or var_304_8 > 0 then
			var_304_0.isStoreOverflow = {
				var_304_7,
				var_304_8
			}
		end
	else
		if var_304_1 > 0 and var_304_5:GoldMax(var_304_1) then
			return false, "gold"
		end

		if var_304_2 > 0 and var_304_5:OilMax(var_304_2) then
			return false, "oil"
		end
	end

	var_304_0.isExpBookOverflow = {}

	for iter_304_0, iter_304_1 in pairs(arg_304_0[DROP_TYPE_ITEM]) do
		local var_304_9 = Item.getConfigData(iter_304_0)

		if getProxy(BagProxy):getItemCountById(iter_304_0) + iter_304_1 > var_304_9.max_num then
			table.insert(var_304_0.isExpBookOverflow, iter_304_0)
		end
	end

	local var_304_10 = getProxy(EquipmentProxy):getCapacity()

	if var_304_3 > 0 and var_304_3 + var_304_10 > var_304_5:getMaxEquipmentBag() then
		return false, "equip"
	end

	local var_304_11 = getProxy(BayProxy):getShipCount()

	if var_304_4 > 0 and var_304_4 + var_304_11 > var_304_5:getMaxShipBag() then
		return false, "ship"
	end

	return true, var_304_0
end

function CheckShipExpOverflow(arg_305_0)
	local var_305_0 = getProxy(BagProxy)

	for iter_305_0, iter_305_1 in pairs(arg_305_0[DROP_TYPE_ITEM]) do
		if var_305_0:getItemCountById(iter_305_0) + iter_305_1 > Item.getConfigData(iter_305_0).max_num then
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

function RegisterDetailButton(arg_306_0, arg_306_1, arg_306_2)
	Drop.Change(arg_306_2)
	switch(arg_306_2.type, {
		[DROP_TYPE_ITEM] = function()
			if arg_306_2:getConfig("type") == Item.SKIN_ASSIGNED_TYPE then
				local var_307_0 = Item.getConfigData(arg_306_2.id).usage_arg
				local var_307_1 = var_307_0[3]

				if Item.InTimeLimitSkinAssigned(arg_306_2.id) then
					var_307_1 = table.mergeArray(var_307_0[2], var_307_1, true)
				end

				local var_307_2 = {}

				for iter_307_0, iter_307_1 in ipairs(var_307_0[2]) do
					var_307_2[iter_307_1] = true
				end

				onButton(arg_306_0, arg_306_1, function()
					arg_306_0:closeView()
					pg.m02:sendNotification(GAME.LOAD_LAYERS, {
						parentContext = getProxy(ContextProxy):getCurrentContext(),
						context = Context.New({
							viewComponent = SelectSkinLayer,
							mediator = SkinAtlasMediator,
							data = {
								mode = SelectSkinLayer.MODE_VIEW,
								itemId = arg_306_2.id,
								selectableSkinList = underscore.map(var_307_1, function(arg_309_0)
									return SelectableSkin.New({
										id = arg_309_0,
										isTimeLimit = var_307_2[arg_309_0] or false
									})
								end)
							}
						})
					})
				end, SFX_PANEL)
				setActive(arg_306_1, true)
			else
				local var_307_3 = getProxy(TechnologyProxy):getItemCanUnlockBluePrint(arg_306_2.id) and "tech" or arg_306_2:getConfig("type")

				if var_0_26[var_307_3] then
					local var_307_4 = {
						item2Row = true,
						content = i18n(var_0_26[var_307_3]),
						itemList = underscore.map(arg_306_2:getConfig("display_icon"), function(arg_310_0)
							return Drop.Create(arg_310_0)
						end)
					}

					if var_307_3 == 11 then
						onButton(arg_306_0, arg_306_1, function()
							arg_306_0:emit(BaseUI.ON_DROP_LIST_OWN, var_307_4)
						end, SFX_PANEL)
					else
						onButton(arg_306_0, arg_306_1, function()
							arg_306_0:emit(BaseUI.ON_DROP_LIST, var_307_4)
						end, SFX_PANEL)
					end
				end

				setActive(arg_306_1, tobool(var_0_26[var_307_3]))
			end
		end,
		[DROP_TYPE_EQUIP] = function()
			onButton(arg_306_0, arg_306_1, function()
				arg_306_0:emit(BaseUI.ON_DROP, arg_306_2)
			end, SFX_PANEL)
			setActive(arg_306_1, true)
		end,
		[DROP_TYPE_SPWEAPON] = function()
			onButton(arg_306_0, arg_306_1, function()
				arg_306_0:emit(BaseUI.ON_DROP, arg_306_2)
			end, SFX_PANEL)
			setActive(arg_306_1, true)
		end
	}, function()
		setActive(arg_306_1, false)
	end)
end

function RegisterNewStyleDetailButton(arg_318_0, arg_318_1, arg_318_2)
	Drop.Change(arg_318_2)
	switch(arg_318_2.type, {
		[DROP_TYPE_ITEM] = function()
			local var_319_0 = getProxy(TechnologyProxy):getItemCanUnlockBluePrint(arg_318_2.id) and "tech" or arg_318_2:getConfig("type")

			if var_0_26[var_319_0] then
				local var_319_1 = {
					useDeepShow = true,
					showOwn = var_319_0 == 11,
					content = i18n(var_0_26[var_319_0]),
					itemList = underscore.map(arg_318_2:getConfig("display_icon"), function(arg_320_0)
						return Drop.Create(arg_320_0)
					end)
				}

				onButton(arg_318_0, arg_318_1, function()
					arg_318_0:emit(BaseUI.ON_NEW_STYLE_ITEMS, var_319_1)
				end, SFX_PANEL)
			end

			setActive(arg_318_1, tobool(var_0_26[var_319_0]))
		end
	}, function()
		setActive(arg_318_1, false)
	end)
end

function UpdateOwnDisplay(arg_323_0, arg_323_1)
	local var_323_0, var_323_1 = arg_323_1:getOwnedCount()

	setActive(arg_323_0, var_323_1 and var_323_0 > 0)

	if var_323_1 and var_323_0 > 0 then
		setText(arg_323_0:Find("label"), i18n("word_own1"))
		setText(arg_323_0:Find("Text"), var_323_0)
	end
end

function Damp(arg_324_0, arg_324_1, arg_324_2)
	arg_324_1 = Mathf.Max(1, arg_324_1)

	local var_324_0 = Mathf.Epsilon

	if arg_324_1 < var_324_0 or var_324_0 > Mathf.Abs(arg_324_0) then
		return arg_324_0
	end

	if arg_324_2 < var_324_0 then
		return 0
	end

	local var_324_1 = -4.605170186

	return arg_324_0 * (1 - Mathf.Exp(var_324_1 * arg_324_2 / arg_324_1))
end

function checkCullResume(arg_325_0)
	if not ReflectionHelp.RefCallMethodEx(typeof("UnityEngine.CanvasRenderer"), "GetMaterial", GetComponent(arg_325_0, "CanvasRenderer"), {
		typeof("System.Int32")
	}, {
		0
	}) then
		local var_325_0 = arg_325_0:GetComponentsInChildren(typeof(MeshImage))

		for iter_325_0 = 1, var_325_0.Length do
			var_325_0[iter_325_0 - 1]:SetVerticesDirty()
		end

		return false
	end

	return true
end

function parseEquipCode(arg_326_0)
	local var_326_0 = {}

	if arg_326_0 and arg_326_0 ~= "" then
		local var_326_1 = base64.dec(arg_326_0)

		var_326_0 = string.split(var_326_1, "/")
		var_326_0[5], var_326_0[6] = unpack(string.split(var_326_0[5], "\\"))

		if #var_326_0 < 6 or arg_326_0 ~= base64.enc(table.concat({
			table.concat(underscore.first(var_326_0, 5), "/"),
			var_326_0[6]
		}, "\\")) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("equipcode_illegal"))

			var_326_0 = {}
		end
	end

	for iter_326_0 = 1, 6 do
		var_326_0[iter_326_0] = var_326_0[iter_326_0] and tonumber(var_326_0[iter_326_0], 32) or 0
	end

	return var_326_0
end

function buildEquipCode(arg_327_0)
	local var_327_0 = underscore.map(arg_327_0:getAllEquipments(), function(arg_328_0)
		return ConversionBase(32, arg_328_0 and arg_328_0.id or 0)
	end)
	local var_327_1 = {
		table.concat(var_327_0, "/"),
		ConversionBase(32, checkExist(arg_327_0:GetSpWeapon(), {
			"id"
		}) or 0)
	}

	return base64.enc(table.concat(var_327_1, "\\"))
end

function setDirectorSpeed(arg_329_0, arg_329_1)
	GetComponent(arg_329_0, "TimelineSpeed"):SetTimelineSpeed(arg_329_1)
end

function setDefaultZeroMetatable(arg_330_0)
	return setmetatable(arg_330_0, {
		__index = function(arg_331_0, arg_331_1)
			if rawget(arg_331_0, arg_331_1) == nil then
				arg_331_0[arg_331_1] = 0
			end

			return arg_331_0[arg_331_1]
		end
	})
end

function checkABExist(arg_332_0)
	if EDITOR_TOOL then
		return ResourceMgr.Inst:AssetExist(arg_332_0)
	else
		return PathMgr.FileExists(PathMgr.getAssetBundle(arg_332_0))
	end
end

function compareNumber(arg_333_0, arg_333_1, arg_333_2)
	return switch(arg_333_1, {
		[">"] = function()
			return arg_333_0 > arg_333_2
		end,
		[">="] = function()
			return arg_333_0 >= arg_333_2
		end,
		["="] = function()
			return arg_333_0 == arg_333_2
		end,
		["<"] = function()
			return arg_333_0 < arg_333_2
		end,
		["<="] = function()
			return arg_333_0 <= arg_333_2
		end
	})
end
