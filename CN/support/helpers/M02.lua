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

function checkPaintingPrefab(arg_42_0, arg_42_1, arg_42_2, arg_42_3, arg_42_4)
	local var_42_0 = findTF(arg_42_0, "fitter")

	assert(var_42_0, "请添加子物体fitter")
	removeAllChildren(var_42_0)

	local var_42_1 = GetOrAddComponent(var_42_0, "PaintingScaler")

	var_42_1.FrameName = arg_42_2 or ""
	var_42_1.Tween = 1

	local var_42_2 = arg_42_4 or "painting/"
	local var_42_3 = arg_42_1

	if not arg_42_3 and checkABExist(var_42_2 .. arg_42_1 .. "_n") and PlayerPrefs.GetInt("paint_hide_other_obj_" .. arg_42_1, 0) ~= 0 then
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
		if var_69_0.special_bgm and type(var_69_0.special_bgm) == "table" and #var_69_0.special_bgm > 0 and _.all(var_69_0.special_bgm, function(arg_70_0)
			return type(arg_70_0) == "table" and #arg_70_0 > 2 and type(arg_70_0[2]) == "number"
		end) then
			local var_69_1 = Clone(var_69_0.special_bgm)

			table.sort(var_69_1, function(arg_71_0, arg_71_1)
				return arg_71_0[2] > arg_71_1[2]
			end)

			local var_69_2 = ""

			_.each(var_69_1, function(arg_72_0)
				if var_69_2 ~= "" then
					return
				end

				local var_72_0 = arg_72_0[1]
				local var_72_1 = arg_72_0[3]

				switch(var_72_0, {
					function()
						local var_73_0 = var_72_1[1]
						local var_73_1 = var_72_1[2]

						if #var_73_0 == 1 then
							if var_73_0[1] ~= "always" then
								return
							end
						elseif not pg.TimeMgr.GetInstance():inTime(var_73_0) then
							return
						end

						_.each(var_73_1, function(arg_74_0)
							if var_69_2 ~= "" then
								return
							end

							if #arg_74_0 == 2 and pg.TimeMgr.GetInstance():inPeriod(arg_74_0[1]) then
								var_69_2 = arg_74_0[2]
							elseif #arg_74_0 == 3 and pg.TimeMgr.GetInstance():inPeriod(arg_74_0[1], arg_74_0[2]) then
								var_69_2 = arg_74_0[3]
							end
						end)
					end,
					function()
						local var_75_0 = false
						local var_75_1 = ""

						_.each(var_72_1, function(arg_76_0)
							if #arg_76_0 ~= 2 or var_75_0 then
								return
							end

							if pg.NewStoryMgr.GetInstance():IsPlayed(arg_76_0[1]) then
								var_69_2 = arg_76_0[2]

								if var_69_2 ~= "" then
									var_75_1 = var_69_2
								else
									var_69_2 = var_75_1
								end
							else
								var_75_0 = true
							end
						end)
					end
				})
			end)

			return var_69_2 ~= "" and var_69_2 or var_69_0.bgm
		else
			return var_69_0 and var_69_0.bgm or nil
		end
	else
		return nil
	end
end

function playStory(arg_77_0, arg_77_1)
	pg.NewStoryMgr.GetInstance():Play(arg_77_0, arg_77_1)
end

function errorMessage(arg_78_0)
	local var_78_0 = ERROR_MESSAGE[arg_78_0]

	if var_78_0 == nil then
		var_78_0 = ERROR_MESSAGE[9999] .. ":" .. arg_78_0
	end

	return var_78_0
end

function errorTip(arg_79_0, arg_79_1, ...)
	local var_79_0 = pg.gametip[arg_79_0 .. "_error"]
	local var_79_1

	if var_79_0 then
		var_79_1 = var_79_0.tip
	else
		var_79_1 = pg.gametip.common_error.tip
	end

	local var_79_2 = arg_79_0 .. "_error_" .. arg_79_1

	if pg.gametip[var_79_2] then
		local var_79_3 = i18n(var_79_2, ...)

		return var_79_1 .. var_79_3
	else
		local var_79_4 = "common_error_" .. arg_79_1

		if pg.gametip[var_79_4] then
			local var_79_5 = i18n(var_79_4, ...)

			return var_79_1 .. var_79_5
		else
			local var_79_6 = errorMessage(arg_79_1)

			return var_79_1 .. arg_79_1 .. ":" .. var_79_6
		end
	end
end

function colorNumber(arg_80_0, arg_80_1)
	local var_80_0 = "@COLOR_SCOPE"
	local var_80_1 = {}

	arg_80_0 = string.gsub(arg_80_0, "<color=#%x+>", function(arg_81_0)
		table.insert(var_80_1, arg_81_0)

		return var_80_0
	end)
	arg_80_0 = string.gsub(arg_80_0, "%d+%.?%d*%%*", function(arg_82_0)
		return "<color=" .. arg_80_1 .. ">" .. arg_82_0 .. "</color>"
	end)

	if #var_80_1 > 0 then
		local var_80_2 = 0

		return (string.gsub(arg_80_0, var_80_0, function(arg_83_0)
			var_80_2 = var_80_2 + 1

			return var_80_1[var_80_2]
		end))
	else
		return arg_80_0
	end
end

function getBounds(arg_84_0)
	local var_84_0 = LuaHelper.GetWorldCorners(rtf(arg_84_0))
	local var_84_1 = Bounds.New(var_84_0[0], Vector3.zero)

	var_84_1:Encapsulate(var_84_0[2])

	return var_84_1
end

local function var_0_3(arg_85_0, arg_85_1)
	arg_85_0.localScale = Vector3.one
	arg_85_0.anchorMin = Vector2.zero
	arg_85_0.anchorMax = Vector2.one
	arg_85_0.offsetMin = Vector2(arg_85_1[1], arg_85_1[2])
	arg_85_0.offsetMax = Vector2(-arg_85_1[3], -arg_85_1[4])
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

function setFrame(arg_86_0, arg_86_1, arg_86_2)
	arg_86_1 = tostring(arg_86_1)

	local var_86_0, var_86_1 = unpack((string.split(arg_86_1, "_")))

	if var_86_1 or tonumber(var_86_0) > 5 then
		arg_86_2 = arg_86_2 or "frame" .. arg_86_1
	end

	GetImageSpriteFromAtlasAsync("weaponframes", "frame", arg_86_0)

	local var_86_2 = arg_86_2 and Color.white or Color.NewHex(ItemRarity.Rarity2FrameHexColor(var_86_0 and tonumber(var_86_0) or ItemRarity.Gray))

	setImageColor(arg_86_0, var_86_2)

	local var_86_3 = findTF(arg_86_0, "specialFrame")

	if arg_86_2 then
		if var_86_3 then
			setActive(var_86_3, true)
		else
			var_86_3 = cloneTplTo(arg_86_0, arg_86_0, "specialFrame")

			removeAllChildren(var_86_3)
		end

		var_0_3(var_86_3, var_0_4[arg_86_2] or var_0_4.other)
		GetImageSpriteFromAtlasAsync("weaponframes", arg_86_2, var_86_3)
	elseif var_86_3 then
		setActive(var_86_3, false)
	end
end

function setIconColorful(arg_87_0, arg_87_1, arg_87_2, arg_87_3)
	arg_87_3 = arg_87_3 or {
		[ItemRarity.SSR] = {
			name = "IconColorful",
			active = function(arg_88_0, arg_88_1)
				return not arg_88_1.noIconColorful and arg_88_0 == ItemRarity.SSR
			end
		}
	}

	local var_87_0 = findTF(arg_87_0, "icon_bg/frame")

	for iter_87_0, iter_87_1 in pairs(arg_87_3) do
		local var_87_1 = iter_87_1.name
		local var_87_2 = iter_87_1.active(arg_87_1, arg_87_2)
		local var_87_3 = var_87_0:Find(var_87_1 .. "(Clone)")

		if var_87_3 then
			setActive(var_87_3, var_87_2)
		elseif var_87_2 then
			LoadAndInstantiateAsync("ui", string.lower(var_87_1), function(arg_89_0)
				if IsNil(arg_87_0) or var_87_0:Find(var_87_1 .. "(Clone)") then
					Object.Destroy(arg_89_0)
				else
					setParent(arg_89_0, var_87_0)
					setActive(arg_89_0, var_87_2)
				end
			end)
		end
	end
end

function setIconStars(arg_90_0, arg_90_1, arg_90_2)
	local var_90_0 = findTF(arg_90_0, "icon_bg/startpl")
	local var_90_1 = findTF(arg_90_0, "icon_bg/stars")

	if var_90_1 and var_90_0 then
		setActive(var_90_1, false)
		setActive(var_90_0, false)
	end

	if not var_90_1 or not arg_90_1 then
		return
	end

	for iter_90_0 = 1, math.max(arg_90_2, var_90_1.childCount) do
		setActive(iter_90_0 > var_90_1.childCount and cloneTplTo(var_90_0, var_90_1) or var_90_1:GetChild(iter_90_0 - 1), iter_90_0 <= arg_90_2)
	end

	setActive(var_90_1, true)
end

local function var_0_5(arg_91_0, arg_91_1)
	local var_91_0 = findTF(arg_91_0, "icon_bg/slv")

	if not IsNil(var_91_0) then
		setActive(var_91_0, arg_91_1 > 0)
		setText(findTF(var_91_0, "Text"), arg_91_1)
	end
end

function setIconName(arg_92_0, arg_92_1, arg_92_2)
	local var_92_0 = findTF(arg_92_0, "name")

	if not IsNil(var_92_0) then
		setText(var_92_0, arg_92_1)
		setTextAlpha(var_92_0, (arg_92_2.hideName or arg_92_2.anonymous) and 0 or 1)
	end
end

function setIconCount(arg_93_0, arg_93_1)
	local var_93_0 = findTF(arg_93_0, "icon_bg/count")

	if not IsNil(var_93_0) then
		setText(var_93_0, arg_93_1 and (type(arg_93_1) ~= "number" or arg_93_1 > 0) and arg_93_1 or "")
	end
end

function updateEquipment(arg_94_0, arg_94_1, arg_94_2)
	arg_94_2 = arg_94_2 or {}

	assert(arg_94_1, "equipmentVo can not be nil.")

	local var_94_0 = EquipmentRarity.Rarity2Print(arg_94_1:getConfig("rarity"))

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_94_0, findTF(arg_94_0, "icon_bg"))
	setFrame(findTF(arg_94_0, "icon_bg/frame"), var_94_0)

	local var_94_1 = findTF(arg_94_0, "icon_bg/icon")

	var_0_3(var_94_1, {
		16,
		16,
		16,
		16
	})
	GetImageSpriteFromAtlasAsync("equips/" .. arg_94_1:getConfig("icon"), "", var_94_1)
	setIconStars(arg_94_0, true, arg_94_1:getConfig("rarity"))
	var_0_5(arg_94_0, arg_94_1:getConfig("level") - 1)
	setIconName(arg_94_0, arg_94_1:getConfig("name"), arg_94_2)
	setIconCount(arg_94_0, arg_94_1.count)
	setIconColorful(arg_94_0, arg_94_1:getConfig("rarity") - 1, arg_94_2)
end

function updateItem(arg_95_0, arg_95_1, arg_95_2)
	arg_95_2 = arg_95_2 or {}

	local var_95_0 = ItemRarity.Rarity2Print(arg_95_1:getConfig("rarity"))

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_95_0, findTF(arg_95_0, "icon_bg"))

	local var_95_1

	if arg_95_1:getConfig("type") == 9 then
		var_95_1 = "frame_design"
	elseif arg_95_2.frame then
		var_95_1 = arg_95_2.frame
	end

	setFrame(findTF(arg_95_0, "icon_bg/frame"), var_95_0, var_95_1)

	local var_95_2 = findTF(arg_95_0, "icon_bg/icon")
	local var_95_3 = arg_95_1.icon or arg_95_1:getConfig("icon")

	if arg_95_1:getConfig("type") == Item.LOVE_LETTER_TYPE then
		assert(arg_95_1.extra, "without extra data")

		var_95_3 = "SquareIcon/" .. ShipGroup.getDefaultSkin(arg_95_1.extra).prefab
	end

	GetImageSpriteFromAtlasAsync(var_95_3, "", var_95_2)
	setIconStars(arg_95_0, false)
	setIconName(arg_95_0, arg_95_1:getName(), arg_95_2)
	setIconColorful(arg_95_0, arg_95_1:getConfig("rarity"), arg_95_2)
end

function updateWorldItem(arg_96_0, arg_96_1, arg_96_2)
	arg_96_2 = arg_96_2 or {}

	local var_96_0 = ItemRarity.Rarity2Print(arg_96_1:getConfig("rarity"))

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_96_0, findTF(arg_96_0, "icon_bg"))
	setFrame(findTF(arg_96_0, "icon_bg/frame"), var_96_0)

	local var_96_1 = findTF(arg_96_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync(arg_96_1.icon or arg_96_1:getConfig("icon"), "", var_96_1)
	setIconStars(arg_96_0, false)
	setIconName(arg_96_0, arg_96_1:getConfig("name"), arg_96_2)
	setIconColorful(arg_96_0, arg_96_1:getConfig("rarity"), arg_96_2)
end

function updateWorldCollection(arg_97_0, arg_97_1, arg_97_2)
	arg_97_2 = arg_97_2 or {}

	assert(arg_97_1:getConfigTable(), "world_collection_file_template 和 world_collection_record_template 表中找不到配置: " .. arg_97_1.id)

	local var_97_0 = arg_97_1:getDropRarity()
	local var_97_1 = ItemRarity.Rarity2Print(var_97_0)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_97_1, findTF(arg_97_0, "icon_bg"))
	setFrame(findTF(arg_97_0, "icon_bg/frame"), var_97_1)

	local var_97_2 = findTF(arg_97_0, "icon_bg/icon")
	local var_97_3 = WorldCollectionProxy.GetCollectionType(arg_97_1.id) == WorldCollectionProxy.WorldCollectionType.FILE and "shoucangguangdie" or "shoucangjiaojuan"

	GetImageSpriteFromAtlasAsync("props/" .. var_97_3, "", var_97_2)
	setIconStars(arg_97_0, false)
	setIconName(arg_97_0, arg_97_1:getName(), arg_97_2)
	setIconColorful(arg_97_0, var_97_0, arg_97_2)
end

function updateWorldBuff(arg_98_0, arg_98_1, arg_98_2)
	arg_98_2 = arg_98_2 or {}

	local var_98_0 = pg.world_SLGbuff_data[arg_98_1]

	assert(var_98_0, "找不到大世界buff配置: " .. arg_98_1)

	local var_98_1 = ItemRarity.Rarity2Print(ItemRarity.Gray)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_98_1, findTF(arg_98_0, "icon_bg"))
	setFrame(findTF(arg_98_0, "icon_bg/frame"), var_98_1)

	local var_98_2 = findTF(arg_98_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("world/buff/" .. var_98_0.icon, "", var_98_2)

	local var_98_3 = arg_98_0:Find("icon_bg/stars")

	if not IsNil(var_98_3) then
		setActive(var_98_3, false)
	end

	local var_98_4 = findTF(arg_98_0, "name")

	if not IsNil(var_98_4) then
		setText(var_98_4, var_98_0.name)
	end

	local var_98_5 = findTF(arg_98_0, "icon_bg/count")

	if not IsNil(var_98_5) then
		SetActive(var_98_5, false)
	end
end

function updateShip(arg_99_0, arg_99_1, arg_99_2)
	arg_99_2 = arg_99_2 or {}

	local var_99_0 = arg_99_1:rarity2bgPrint()
	local var_99_1 = arg_99_1:getPainting()

	if arg_99_2.anonymous then
		var_99_0 = "1"
		var_99_1 = "unknown"
	end

	if arg_99_2.unknown_small then
		var_99_1 = "unknown_small"
	end

	local var_99_2 = findTF(arg_99_0, "icon_bg/new")

	if var_99_2 then
		if arg_99_2.isSkin then
			setActive(var_99_2, not arg_99_2.isTimeLimit and arg_99_2.isNew)
		else
			setActive(var_99_2, arg_99_1.virgin)
		end
	end

	local var_99_3 = findTF(arg_99_0, "icon_bg/timelimit")

	if var_99_3 then
		setActive(var_99_3, arg_99_2.isTimeLimit)
	end

	local var_99_4 = findTF(arg_99_0, "icon_bg")

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. (arg_99_2.isSkin and "_skin" or var_99_0), var_99_4)

	local var_99_5 = findTF(arg_99_0, "icon_bg/frame")
	local var_99_6

	if arg_99_1.isNpc then
		var_99_6 = "frame_npc"
	elseif arg_99_1:ShowPropose() then
		var_99_6 = "frame_prop"

		if arg_99_1:isMetaShip() then
			var_99_6 = var_99_6 .. "_meta"
		end
	elseif arg_99_2.isSkin then
		var_99_6 = "frame_skin"
	end

	setFrame(var_99_5, var_99_0, var_99_6)

	if arg_99_2.gray then
		setGray(var_99_4, true, true)
	end

	local var_99_7 = findTF(arg_99_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync((arg_99_2.Q and "QIcon/" or "SquareIcon/") .. var_99_1, "", var_99_7)

	local var_99_8 = findTF(arg_99_0, "icon_bg/lv")

	if var_99_8 then
		setActive(var_99_8, not arg_99_1.isNpc)

		if not arg_99_1.isNpc then
			local var_99_9 = findTF(var_99_8, "Text")

			if var_99_9 and arg_99_1.level then
				setText(var_99_9, arg_99_1.level)
			end
		end
	end

	local var_99_10 = findTF(arg_99_0, "ship_type")

	if var_99_10 then
		setActive(var_99_10, true)
		setImageSprite(var_99_10, GetSpriteFromAtlas("shiptype", shipType2print(arg_99_1:getShipType())))
	end

	local var_99_11 = var_99_4:Find("npc")

	if not IsNil(var_99_11) then
		if var_99_2 and go(var_99_2).activeSelf then
			setActive(var_99_11, false)
		else
			setActive(var_99_11, arg_99_1:isActivityNpc())
		end
	end

	local var_99_12 = arg_99_0:Find("group_locked")

	if var_99_12 then
		setActive(var_99_12, not arg_99_2.isSkin and not getProxy(CollectionProxy):getShipGroup(arg_99_1.groupId))
	end

	setIconStars(arg_99_0, arg_99_2.initStar, arg_99_1:getStar())
	setIconName(arg_99_0, arg_99_2.isSkin and arg_99_1:GetSkinConfig().name or arg_99_1:getName(), arg_99_2)
	setIconColorful(arg_99_0, arg_99_2.isSkin and ItemRarity.Gold or arg_99_1:getRarity() - 1, arg_99_2)
end

function updateCommander(arg_100_0, arg_100_1, arg_100_2)
	arg_100_2 = arg_100_2 or {}

	local var_100_0 = arg_100_1:getDropRarity()
	local var_100_1 = ItemRarity.Rarity2Print(var_100_0)
	local var_100_2 = arg_100_1:getConfig("painting")

	if arg_100_2.anonymous then
		var_100_1 = 1
		var_100_2 = "unknown"
	end

	local var_100_3 = findTF(arg_100_0, "icon_bg")

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_100_1, var_100_3)

	local var_100_4 = findTF(arg_100_0, "icon_bg/frame")

	setFrame(var_100_4, var_100_1)

	if arg_100_2.gray then
		setGray(var_100_3, true, true)
	end

	local var_100_5 = findTF(arg_100_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("CommanderIcon/" .. var_100_2, "", var_100_5)
	setIconStars(arg_100_0, arg_100_2.initStar, 0)
	setIconName(arg_100_0, arg_100_1:getName(), arg_100_2)
end

function updateStrategy(arg_101_0, arg_101_1, arg_101_2)
	arg_101_2 = arg_101_2 or {}

	local var_101_0 = ItemRarity.Rarity2Print(ItemRarity.Gray)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_101_0, findTF(arg_101_0, "icon_bg"))
	setFrame(findTF(arg_101_0, "icon_bg/frame"), var_101_0)

	local var_101_1 = findTF(arg_101_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync((arg_101_1.isWorldBuff and "world/buff/" or "strategyicon/") .. arg_101_1:getIcon(), "", var_101_1)
	setIconStars(arg_101_0, false)
	setIconName(arg_101_0, arg_101_1:getName(), arg_101_2)
	setIconColorful(arg_101_0, ItemRarity.Gray, arg_101_2)
end

function updateFurniture(arg_102_0, arg_102_1, arg_102_2)
	arg_102_2 = arg_102_2 or {}

	local var_102_0 = arg_102_1:getDropRarity()
	local var_102_1 = ItemRarity.Rarity2Print(var_102_0)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_102_1, findTF(arg_102_0, "icon_bg"))
	setFrame(findTF(arg_102_0, "icon_bg/frame"), var_102_1)

	local var_102_2 = findTF(arg_102_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("furnitureicon/" .. arg_102_1:getIcon(), "", var_102_2)
	setIconStars(arg_102_0, false)
	setIconName(arg_102_0, arg_102_1:getName(), arg_102_2)
	setIconColorful(arg_102_0, var_102_0, arg_102_2)
end

function updateSpWeapon(arg_103_0, arg_103_1, arg_103_2)
	arg_103_2 = arg_103_2 or {}

	assert(arg_103_1, "spWeaponVO can not be nil.")
	assert(isa(arg_103_1, SpWeapon), "spWeaponVO is not Equipment.")

	local var_103_0 = ItemRarity.Rarity2Print(arg_103_1:GetRarity())

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_103_0, findTF(arg_103_0, "icon_bg"))
	setFrame(findTF(arg_103_0, "icon_bg/frame"), var_103_0)

	local var_103_1 = findTF(arg_103_0, "icon_bg/icon")

	var_0_3(var_103_1, {
		16,
		16,
		16,
		16
	})
	GetImageSpriteFromAtlasAsync(arg_103_1:GetIconPath(), "", var_103_1)
	setIconStars(arg_103_0, true, arg_103_1:GetRarity())
	var_0_5(arg_103_0, arg_103_1:GetLevel() - 1)
	setIconName(arg_103_0, arg_103_1:GetName(), arg_103_2)
	setIconCount(arg_103_0, arg_103_1.count)
	setIconColorful(arg_103_0, arg_103_1:GetRarity(), arg_103_2)
end

function UpdateSpWeaponSlot(arg_104_0, arg_104_1, arg_104_2)
	local var_104_0 = ItemRarity.Rarity2Print(arg_104_1:GetRarity())

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_104_0, findTF(arg_104_0, "Icon/Mask/icon_bg"))

	local var_104_1 = findTF(arg_104_0, "Icon/Mask/icon_bg/icon")

	arg_104_2 = arg_104_2 or {
		16,
		16,
		16,
		16
	}

	var_0_3(var_104_1, arg_104_2)
	GetImageSpriteFromAtlasAsync(arg_104_1:GetIconPath(), "", var_104_1)

	local var_104_2 = arg_104_1:GetLevel() - 1
	local var_104_3 = findTF(arg_104_0, "Icon/LV")

	setActive(var_104_3, var_104_2 > 0)
	setText(findTF(var_104_3, "Text"), var_104_2)
end

function updateDorm3dFurniture(arg_105_0, arg_105_1, arg_105_2)
	arg_105_2 = arg_105_2 or {}

	local var_105_0 = arg_105_1:getDropRarity()
	local var_105_1 = ItemRarity.Rarity2Print(var_105_0)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_105_1, findTF(arg_105_0, "icon_bg"))
	setFrame(findTF(arg_105_0, "icon_bg/frame"), var_105_1)

	local var_105_2 = findTF(arg_105_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync(arg_105_1:getIcon(), "", var_105_2)
	setIconStars(arg_105_0, false)
	setIconName(arg_105_0, arg_105_1:getName(), arg_105_2)
	setIconColorful(arg_105_0, var_105_0, arg_105_2)
end

function updateDorm3dGift(arg_106_0, arg_106_1, arg_106_2)
	arg_106_2 = arg_106_2 or {}

	local var_106_0 = arg_106_1:getDropRarity()
	local var_106_1 = ItemRarity.Rarity2Print(var_106_0) or ItemRarity.Gray

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_106_1, arg_106_0:Find("icon_bg"))
	setFrame(arg_106_0:Find("icon_bg/frame"), var_106_1)

	local var_106_2 = arg_106_0:Find("icon_bg/icon")

	GetImageSpriteFromAtlasAsync(arg_106_1:getIcon(), "", var_106_2)
	setIconStars(arg_106_0, false)
	setIconName(arg_106_0, arg_106_1:getName(), arg_106_2)
	setIconColorful(arg_106_0, var_106_0, arg_106_2)
end

function updateDorm3dSkin(arg_107_0, arg_107_1, arg_107_2)
	arg_107_2 = arg_107_2 or {}

	local var_107_0 = arg_107_1:getDropRarity()
	local var_107_1 = ItemRarity.Rarity2Print(var_107_0) or ItemRarity.Gray

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_107_1, arg_107_0:Find("icon_bg"))
	setFrame(arg_107_0:Find("icon_bg/frame"), var_107_1)

	local var_107_2 = arg_107_0:Find("icon_bg/icon")

	setIconStars(arg_107_0, false)
	setIconName(arg_107_0, arg_107_1:getName(), arg_107_2)
	setIconColorful(arg_107_0, var_107_0, arg_107_2)
end

function updateDorm3dIcon(arg_108_0, arg_108_1)
	local var_108_0 = arg_108_1:getDropRarity()

	GetImageSpriteFromAtlasAsync("weaponframes", "dorm3d_" .. ItemRarity.Rarity2Print(var_108_0), arg_108_0)

	local var_108_1 = arg_108_0:Find("icon")

	GetImageSpriteFromAtlasAsync(arg_108_1:getIcon(), "", var_108_1)
	setText(arg_108_0:Find("count/Text"), "x" .. arg_108_1.count)
	setText(arg_108_0:Find("name/Text"), arg_108_1:getName())
end

local var_0_6

function findCullAndClipWorldRect(arg_109_0)
	if #arg_109_0 == 0 then
		return false
	end

	local var_109_0 = arg_109_0[1].canvasRect

	for iter_109_0 = 1, #arg_109_0 do
		var_109_0 = rectIntersect(var_109_0, arg_109_0[iter_109_0].canvasRect)
	end

	if var_109_0.width <= 0 or var_109_0.height <= 0 then
		return false
	end

	var_0_6 = var_0_6 or GameObject.Find("UICamera/Canvas").transform

	local var_109_1 = var_0_6:TransformPoint(Vector3(var_109_0.x, var_109_0.y, 0))
	local var_109_2 = var_0_6:TransformPoint(Vector3(var_109_0.x + var_109_0.width, var_109_0.y + var_109_0.height, 0))

	return true, Vector4(var_109_1.x, var_109_1.y, var_109_2.x, var_109_2.y)
end

function rectIntersect(arg_110_0, arg_110_1)
	local var_110_0 = math.max(arg_110_0.x, arg_110_1.x)
	local var_110_1 = math.min(arg_110_0.x + arg_110_0.width, arg_110_1.x + arg_110_1.width)
	local var_110_2 = math.max(arg_110_0.y, arg_110_1.y)
	local var_110_3 = math.min(arg_110_0.y + arg_110_0.height, arg_110_1.y + arg_110_1.height)

	if var_110_0 <= var_110_1 and var_110_2 <= var_110_3 then
		return var_0_0.Rect.New(var_110_0, var_110_2, var_110_1 - var_110_0, var_110_3 - var_110_2)
	end

	return var_0_0.Rect.New(0, 0, 0, 0)
end

function getDropInfo(arg_111_0)
	local var_111_0 = {}

	for iter_111_0, iter_111_1 in ipairs(arg_111_0) do
		local var_111_1 = Drop.Create(iter_111_1)

		var_111_1.count = var_111_1.count or 1

		if var_111_1.type == DROP_TYPE_EMOJI then
			table.insert(var_111_0, var_111_1:getName())
		else
			table.insert(var_111_0, var_111_1:getName() .. "x" .. var_111_1.count)
		end
	end

	return table.concat(var_111_0, "、")
end

function updateDrop(arg_112_0, arg_112_1, arg_112_2)
	Drop.Change(arg_112_1)

	arg_112_2 = arg_112_2 or {}

	local var_112_0 = {
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
	local var_112_1

	for iter_112_0, iter_112_1 in ipairs(var_112_0) do
		local var_112_2 = arg_112_0:Find(iter_112_1[1])

		if arg_112_1.type ~= iter_112_1[2] and not IsNil(var_112_2) then
			setActive(var_112_2, false)
		end
	end

	arg_112_0:Find("icon_bg/frame"):GetComponent(typeof(Image)).enabled = true

	setIconColorful(arg_112_0, arg_112_1:getDropRarity(), arg_112_2, {
		[ItemRarity.Gold] = {
			name = "Item_duang5",
			active = function(arg_113_0, arg_113_1)
				return arg_113_1.fromAwardLayer and arg_113_0 >= ItemRarity.Gold
			end
		}
	})
	var_0_3(findTF(arg_112_0, "icon_bg/icon"), {
		2,
		2,
		2,
		2
	})
	arg_112_1:UpdateDropTpl(arg_112_0, arg_112_2)
	setIconCount(arg_112_0, arg_112_2.count or arg_112_1:getCount())
end

function updateBuff(arg_114_0, arg_114_1, arg_114_2)
	arg_114_2 = arg_114_2 or {}

	local var_114_0 = ItemRarity.Rarity2Print(ItemRarity.Gray)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_114_0, findTF(arg_114_0, "icon_bg"))

	local var_114_1 = pg.benefit_buff_template[arg_114_1]

	setFrame(findTF(arg_114_0, "icon_bg/frame"), var_114_0)
	setText(findTF(arg_114_0, "icon_bg/count"), 1)

	local var_114_2 = findTF(arg_114_0, "icon_bg/icon")
	local var_114_3 = var_114_1.icon

	GetImageSpriteFromAtlasAsync(var_114_3, "", var_114_2)
	setIconStars(arg_114_0, false)
	setIconName(arg_114_0, var_114_1.name, arg_114_2)
	setIconColorful(arg_114_0, ItemRarity.Gold, arg_114_2)
end

function updateAttire(arg_115_0, arg_115_1, arg_115_2, arg_115_3)
	local var_115_0 = 4

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_115_0, findTF(arg_115_0, "icon_bg"))
	setFrame(findTF(arg_115_0, "icon_bg/frame"), var_115_0)

	local var_115_1 = findTF(arg_115_0, "icon_bg/icon")
	local var_115_2

	if arg_115_1 == AttireConst.TYPE_CHAT_FRAME then
		var_115_2 = "chat_frame"
	elseif arg_115_1 == AttireConst.TYPE_ICON_FRAME then
		var_115_2 = "icon_frame"
	end

	GetImageSpriteFromAtlasAsync("Props/" .. var_115_2, "", var_115_1)
	setIconName(arg_115_0, arg_115_2.name, arg_115_3)
end

function updateAttireCombatUI(arg_116_0, arg_116_1, arg_116_2, arg_116_3)
	local var_116_0 = arg_116_2.rare

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_116_0, findTF(arg_116_0, "icon_bg"))
	setFrame(findTF(arg_116_0, "icon_bg/frame"), var_116_0, "frame_battle_ui")

	local var_116_1 = findTF(arg_116_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("Props/" .. arg_116_2.display_icon, "", var_116_1)
	setIconName(arg_116_0, arg_116_2.name, arg_116_3)
end

function updateCover(arg_117_0, arg_117_1, arg_117_2)
	local var_117_0 = arg_117_1:getDropRarity()

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_117_0, findTF(arg_117_0, "icon_bg"))
	setFrame(findTF(arg_117_0, "icon_bg/frame"), var_117_0)

	local var_117_1 = findTF(arg_117_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync(arg_117_1:getIcon(), "", var_117_1)
	setIconName(arg_117_0, arg_117_1:getName(), arg_117_2)
end

function updateEmoji(arg_118_0, arg_118_1, arg_118_2)
	local var_118_0 = findTF(arg_118_0, "icon_bg/icon")
	local var_118_1 = "icon_emoji"

	GetImageSpriteFromAtlasAsync("Props/" .. var_118_1, "", var_118_0)

	local var_118_2 = 4

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_118_2, findTF(arg_118_0, "icon_bg"))
	setFrame(findTF(arg_118_0, "icon_bg/frame"), var_118_2)
	setIconName(arg_118_0, arg_118_1.name, arg_118_2)
end

function updateEquipmentSkin(arg_119_0, arg_119_1, arg_119_2)
	arg_119_2 = arg_119_2 or {}

	local var_119_0 = EquipmentRarity.Rarity2Print(arg_119_1.rarity)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_119_0, findTF(arg_119_0, "icon_bg"))
	setFrame(findTF(arg_119_0, "icon_bg/frame"), var_119_0, "frame_skin")

	local var_119_1 = findTF(arg_119_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("equips/" .. arg_119_1.icon, "", var_119_1)
	setIconStars(arg_119_0, false)
	setIconName(arg_119_0, arg_119_1.name, arg_119_2)
	setIconCount(arg_119_0, arg_119_1.count)
	setIconColorful(arg_119_0, arg_119_1.rarity - 1, arg_119_2)
end

function NoPosMsgBox(arg_120_0, arg_120_1, arg_120_2, arg_120_3)
	local var_120_0
	local var_120_1 = {}

	if arg_120_1 then
		table.insert(var_120_1, {
			text = "text_noPos_clear",
			atuoClose = true,
			onCallback = arg_120_1
		})
	end

	if arg_120_2 then
		table.insert(var_120_1, {
			text = "text_noPos_buy",
			atuoClose = true,
			onCallback = arg_120_2
		})
	end

	if arg_120_3 then
		table.insert(var_120_1, {
			text = "text_noPos_intensify",
			atuoClose = true,
			onCallback = arg_120_3
		})
	end

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		hideYes = true,
		hideNo = true,
		content = arg_120_0,
		custom = var_120_1,
		weight = LayerWeightConst.TOP_LAYER
	})
end

function openDestroyEquip()
	if pg.m02:hasMediator(EquipmentMediator.__cname) then
		local var_121_0 = getProxy(ContextProxy):getCurrentContext():getContextByMediator(EquipmentMediator)

		if var_121_0 and var_121_0.data.shipId then
			pg.m02:sendNotification(GAME.REMOVE_LAYERS, {
				context = var_121_0
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
		local var_122_0 = getProxy(ContextProxy):getCurrentContext():getContextByMediator(EquipmentMediator)

		if var_122_0 and var_122_0.data.shipId then
			pg.m02:sendNotification(GAME.REMOVE_LAYERS, {
				context = var_122_0
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
		onClick = function(arg_125_0, arg_125_1)
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.SHIPINFO, {
				page = 3,
				shipId = arg_125_0.id,
				shipVOs = arg_125_1
			})
		end
	})
end

function GoShoppingMsgBox(arg_126_0, arg_126_1, arg_126_2)
	if arg_126_2 then
		local var_126_0 = ""

		for iter_126_0, iter_126_1 in ipairs(arg_126_2) do
			local var_126_1 = Item.getConfigData(iter_126_1[1])

			var_126_0 = var_126_0 .. i18n(iter_126_1[1] == 59001 and "text_noRes_info_tip" or "text_noRes_info_tip2", var_126_1.name, iter_126_1[2])

			if iter_126_0 < #arg_126_2 then
				var_126_0 = var_126_0 .. i18n("text_noRes_info_tip_link")
			end
		end

		if var_126_0 ~= "" then
			arg_126_0 = arg_126_0 .. "\n" .. i18n("text_noRes_tip", var_126_0)
		end
	end

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		content = arg_126_0,
		weight = LayerWeightConst.SECOND_LAYER,
		onYes = function()
			gotoChargeScene(arg_126_1, arg_126_2)
		end
	})
end

function shoppingBatch(arg_128_0, arg_128_1, arg_128_2, arg_128_3, arg_128_4)
	local var_128_0 = pg.shop_template[arg_128_0]

	assert(var_128_0, "shop_template中找不到商品id：" .. arg_128_0)

	local var_128_1 = getProxy(PlayerProxy):getData()[id2res(var_128_0.resource_type)]
	local var_128_2 = arg_128_1.price or var_128_0.resource_num
	local var_128_3 = math.floor(var_128_1 / var_128_2)

	var_128_3 = var_128_3 <= 0 and 1 or var_128_3
	var_128_3 = arg_128_2 ~= nil and arg_128_2 < var_128_3 and arg_128_2 or var_128_3

	local var_128_4 = true
	local var_128_5 = 1

	if var_128_0 ~= nil and arg_128_1.id then
		print(var_128_3 * var_128_0.num, "--", var_128_3)
		assert(Item.getConfigData(arg_128_1.id), "item config should be existence")

		local var_128_6 = Item.New({
			id = arg_128_1.id
		}):getConfig("name")

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			needCounter = true,
			type = MSGBOX_TYPE_SINGLE_ITEM,
			drop = {
				type = DROP_TYPE_ITEM,
				id = arg_128_1.id
			},
			addNum = var_128_0.num,
			maxNum = var_128_3 * var_128_0.num,
			defaultNum = var_128_0.num,
			numUpdate = function(arg_129_0, arg_129_1)
				var_128_5 = math.floor(arg_129_1 / var_128_0.num)

				local var_129_0 = var_128_5 * var_128_2

				if var_129_0 > var_128_1 then
					setText(arg_129_0, i18n(arg_128_3, var_129_0, arg_129_1, COLOR_RED, var_128_6))

					var_128_4 = false
				else
					setText(arg_129_0, i18n(arg_128_3, var_129_0, arg_129_1, COLOR_GREEN, var_128_6))

					var_128_4 = true
				end
			end,
			onYes = function()
				if var_128_4 then
					pg.m02:sendNotification(GAME.SHOPPING, {
						id = arg_128_0,
						count = var_128_5
					})
				elseif arg_128_4 then
					pg.TipsMgr.GetInstance():ShowTips(i18n(arg_128_4))
				else
					pg.TipsMgr.GetInstance():ShowTips(i18n("main_playerInfoLayer_error_changeNameNoGem"))
				end
			end
		})
	end
end

function gotoChargeScene(arg_131_0, arg_131_1)
	local var_131_0 = getProxy(ContextProxy)
	local var_131_1 = getProxy(ContextProxy):getCurrentContext()

	if instanceof(var_131_1.mediator, ChargeMediator) then
		var_131_1.mediator:getViewComponent():switchSubViewByTogger(arg_131_0)
	else
		pg.m02:sendNotification(GAME.GO_SCENE, SCENE.CHARGE, {
			wrap = arg_131_0 or ChargeScene.TYPE_ITEM,
			noRes = arg_131_1
		})
	end
end

function clearDrop(arg_132_0)
	local var_132_0 = findTF(arg_132_0, "icon_bg")
	local var_132_1 = findTF(arg_132_0, "icon_bg/frame")
	local var_132_2 = findTF(arg_132_0, "icon_bg/icon")
	local var_132_3 = findTF(arg_132_0, "icon_bg/icon/icon")

	clearImageSprite(var_132_0)
	clearImageSprite(var_132_1)
	clearImageSprite(var_132_2)

	if var_132_3 then
		clearImageSprite(var_132_3)
	end
end

local var_0_7 = {
	red = Color.New(1, 0.25, 0.25),
	blue = Color.New(0.11, 0.55, 0.64),
	yellow = Color.New(0.92, 0.52, 0)
}

function updateSkill(arg_133_0, arg_133_1, arg_133_2, arg_133_3)
	local var_133_0 = findTF(arg_133_0, "skill")
	local var_133_1 = findTF(arg_133_0, "lock")
	local var_133_2 = findTF(arg_133_0, "unknown")

	if arg_133_1 then
		setActive(var_133_0, true)
		setActive(var_133_2, false)
		setActive(var_133_1, not arg_133_2)
		LoadImageSpriteAsync("skillicon/" .. arg_133_1.icon, findTF(var_133_0, "icon"))

		local var_133_3 = arg_133_1.color or "blue"

		setText(findTF(var_133_0, "name"), shortenString(getSkillName(arg_133_1.id), arg_133_3 or 8))

		local var_133_4 = findTF(var_133_0, "level")

		setText(var_133_4, "LEVEL: " .. (arg_133_2 and arg_133_2.level or "??"))
		setTextColor(var_133_4, var_0_7[var_133_3])
	else
		setActive(var_133_0, false)
		setActive(var_133_2, true)
		setActive(var_133_1, false)
	end
end

local var_0_8 = true

function onBackButton(arg_134_0, arg_134_1, arg_134_2, arg_134_3)
	local var_134_0 = GetOrAddComponent(arg_134_1, "UILongPressTrigger")

	assert(arg_134_2, "callback should exist")

	var_134_0.longPressThreshold = defaultValue(arg_134_3, 1)

	local function var_134_1(arg_135_0)
		return function()
			if var_0_8 then
				pg.CriMgr.GetInstance():PlaySoundEffect_V3(SOUND_BACK)
			end

			local var_136_0, var_136_1 = arg_134_2()

			if var_136_0 then
				arg_135_0(var_136_1)
			end
		end
	end

	local var_134_2 = var_134_0.onReleased

	pg.DelegateInfo.Add(arg_134_0, var_134_2)
	var_134_2:RemoveAllListeners()
	var_134_2:AddListener(var_134_1(function(arg_137_0)
		arg_137_0:emit(BaseUI.ON_BACK)
	end))

	local var_134_3 = var_134_0.onLongPressed

	pg.DelegateInfo.Add(arg_134_0, var_134_3)
	var_134_3:RemoveAllListeners()
	var_134_3:AddListener(var_134_1(function(arg_138_0)
		arg_138_0:emit(BaseUI.ON_HOME)
	end))
end

function GetZeroTime()
	return pg.TimeMgr.GetInstance():GetNextTime(0, 0, 0)
end

function GetHalfHour()
	return pg.TimeMgr.GetInstance():GetNextTime(0, 0, 0, 1800)
end

function GetNextHour(arg_141_0)
	local var_141_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_141_1, var_141_2 = pg.TimeMgr.GetInstance():parseTimeFrom(var_141_0)

	return var_141_1 * 86400 + (var_141_2 + arg_141_0) * 3600
end

function GetPerceptualSize(arg_142_0)
	local function var_142_0(arg_143_0)
		if not arg_143_0 then
			return 0, 1
		elseif arg_143_0 > 240 then
			return 4, 1
		elseif arg_143_0 > 225 then
			return 3, 1
		elseif arg_143_0 > 192 then
			return 2, 1
		elseif arg_143_0 < 126 then
			return 1, 0.5
		else
			return 1, 1
		end
	end

	if type(arg_142_0) == "number" then
		return var_142_0(arg_142_0)
	end

	local var_142_1 = 1
	local var_142_2 = 0
	local var_142_3 = 0
	local var_142_4 = #arg_142_0

	while var_142_1 <= var_142_4 do
		local var_142_5 = string.byte(arg_142_0, var_142_1)
		local var_142_6, var_142_7 = var_142_0(var_142_5)

		var_142_1 = var_142_1 + var_142_6
		var_142_2 = var_142_2 + var_142_7
	end

	return var_142_2
end

function shortenString(arg_144_0, arg_144_1)
	local var_144_0 = 1
	local var_144_1 = 0
	local var_144_2 = 0
	local var_144_3 = #arg_144_0

	while var_144_0 <= var_144_3 do
		local var_144_4 = string.byte(arg_144_0, var_144_0)
		local var_144_5, var_144_6 = GetPerceptualSize(var_144_4)

		var_144_0 = var_144_0 + var_144_5
		var_144_1 = var_144_1 + var_144_6

		if arg_144_1 <= math.ceil(var_144_1) then
			var_144_2 = var_144_0

			break
		end
	end

	if var_144_2 == 0 or var_144_3 < var_144_2 then
		return arg_144_0
	end

	return string.sub(arg_144_0, 1, var_144_2 - 1) .. ".."
end

function shouldShortenString(arg_145_0, arg_145_1)
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
		return false
	end

	return true
end

function nameValidityCheck(arg_146_0, arg_146_1, arg_146_2, arg_146_3)
	local var_146_0 = true
	local var_146_1, var_146_2 = utf8_to_unicode(arg_146_0)
	local var_146_3 = filterEgyUnicode(filterSpecChars(arg_146_0))
	local var_146_4 = wordVer(arg_146_0)

	if not checkSpaceValid(arg_146_0) then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_146_3[1]))

		var_146_0 = false
	elseif var_146_4 > 0 or var_146_3 ~= arg_146_0 then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_146_3[4]))

		var_146_0 = false
	elseif var_146_2 < arg_146_1 then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_146_3[2]))

		var_146_0 = false
	elseif arg_146_2 < var_146_2 then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_146_3[3]))

		var_146_0 = false
	end

	return var_146_0
end

function checkSpaceValid(arg_147_0)
	if PLATFORM_CODE == PLATFORM_US then
		return true
	end

	local var_147_0 = string.gsub(arg_147_0, " ", "")

	return arg_147_0 == string.gsub(var_147_0, "　", "")
end

function filterSpecChars(arg_148_0)
	local var_148_0 = {}
	local var_148_1 = 0
	local var_148_2 = 0
	local var_148_3 = 0
	local var_148_4 = 1

	while var_148_4 <= #arg_148_0 do
		local var_148_5 = string.byte(arg_148_0, var_148_4)

		if not var_148_5 then
			break
		end

		if var_148_5 >= 48 and var_148_5 <= 57 or var_148_5 >= 65 and var_148_5 <= 90 or var_148_5 == 95 or var_148_5 >= 97 and var_148_5 <= 122 then
			table.insert(var_148_0, string.char(var_148_5))
		elseif var_148_5 >= 228 and var_148_5 <= 233 then
			local var_148_6 = string.byte(arg_148_0, var_148_4 + 1)
			local var_148_7 = string.byte(arg_148_0, var_148_4 + 2)

			if var_148_6 and var_148_7 and var_148_6 >= 128 and var_148_6 <= 191 and var_148_7 >= 128 and var_148_7 <= 191 then
				var_148_4 = var_148_4 + 2

				table.insert(var_148_0, string.char(var_148_5, var_148_6, var_148_7))

				var_148_1 = var_148_1 + 1
			end
		elseif var_148_5 == 45 or var_148_5 == 40 or var_148_5 == 41 then
			table.insert(var_148_0, string.char(var_148_5))
		elseif var_148_5 == 194 then
			local var_148_8 = string.byte(arg_148_0, var_148_4 + 1)

			if var_148_8 == 183 then
				var_148_4 = var_148_4 + 1

				table.insert(var_148_0, string.char(var_148_5, var_148_8))

				var_148_1 = var_148_1 + 1
			end
		elseif var_148_5 == 239 then
			local var_148_9 = string.byte(arg_148_0, var_148_4 + 1)
			local var_148_10 = string.byte(arg_148_0, var_148_4 + 2)

			if var_148_9 == 188 and (var_148_10 == 136 or var_148_10 == 137) then
				var_148_4 = var_148_4 + 2

				table.insert(var_148_0, string.char(var_148_5, var_148_9, var_148_10))

				var_148_1 = var_148_1 + 1
			end
		elseif var_148_5 == 206 or var_148_5 == 207 then
			local var_148_11 = string.byte(arg_148_0, var_148_4 + 1)

			if var_148_5 == 206 and var_148_11 >= 177 or var_148_5 == 207 and var_148_11 <= 134 then
				var_148_4 = var_148_4 + 1

				table.insert(var_148_0, string.char(var_148_5, var_148_11))

				var_148_1 = var_148_1 + 1
			end
		elseif var_148_5 == 227 and PLATFORM_CODE == PLATFORM_JP then
			local var_148_12 = string.byte(arg_148_0, var_148_4 + 1)
			local var_148_13 = string.byte(arg_148_0, var_148_4 + 2)

			if var_148_12 and var_148_13 and var_148_12 > 128 and var_148_12 <= 191 and var_148_13 >= 128 and var_148_13 <= 191 then
				var_148_4 = var_148_4 + 2

				table.insert(var_148_0, string.char(var_148_5, var_148_12, var_148_13))

				var_148_2 = var_148_2 + 1
			end
		elseif var_148_5 >= 224 and PLATFORM_CODE == PLATFORM_KR then
			local var_148_14 = string.byte(arg_148_0, var_148_4 + 1)
			local var_148_15 = string.byte(arg_148_0, var_148_4 + 2)

			if var_148_14 and var_148_15 and var_148_14 >= 128 and var_148_14 <= 191 and var_148_15 >= 128 and var_148_15 <= 191 then
				var_148_4 = var_148_4 + 2

				table.insert(var_148_0, string.char(var_148_5, var_148_14, var_148_15))

				var_148_3 = var_148_3 + 1
			end
		elseif PLATFORM_CODE == PLATFORM_US then
			if var_148_4 ~= 1 and var_148_5 == 32 and string.byte(arg_148_0, var_148_4 + 1) ~= 32 then
				table.insert(var_148_0, string.char(var_148_5))
			end

			if var_148_5 >= 192 and var_148_5 <= 223 then
				local var_148_16 = string.byte(arg_148_0, var_148_4 + 1)

				var_148_4 = var_148_4 + 1

				if var_148_5 == 194 and var_148_16 and var_148_16 >= 128 then
					table.insert(var_148_0, string.char(var_148_5, var_148_16))
				elseif var_148_5 == 195 and var_148_16 and var_148_16 <= 191 then
					table.insert(var_148_0, string.char(var_148_5, var_148_16))
				end
			end
		end

		var_148_4 = var_148_4 + 1
	end

	return table.concat(var_148_0), var_148_1 + var_148_2 + var_148_3
end

function filterEgyUnicode(arg_149_0)
	arg_149_0 = string.gsub(arg_149_0, "\xF0\x93[\x80-\x8F][\x80-\xBF]", "")
	arg_149_0 = string.gsub(arg_149_0, "\xF0\x93\x90[\x80-\xAF]", "")

	return arg_149_0
end

function shiftPanel(arg_150_0, arg_150_1, arg_150_2, arg_150_3, arg_150_4, arg_150_5, arg_150_6, arg_150_7, arg_150_8)
	arg_150_3 = arg_150_3 or 0.2

	if arg_150_5 then
		LeanTween.cancel(go(arg_150_0))
	end

	local var_150_0 = rtf(arg_150_0)

	arg_150_1 = arg_150_1 or var_150_0.anchoredPosition.x
	arg_150_2 = arg_150_2 or var_150_0.anchoredPosition.y

	local var_150_1 = LeanTween.move(var_150_0, Vector3(arg_150_1, arg_150_2, 0), arg_150_3)

	arg_150_7 = arg_150_7 or LeanTweenType.easeInOutSine

	var_150_1:setEase(arg_150_7)

	if arg_150_4 then
		var_150_1:setDelay(arg_150_4)
	end

	if arg_150_6 then
		GetOrAddComponent(arg_150_0, "CanvasGroup").blocksRaycasts = false
	end

	var_150_1:setOnComplete(System.Action(function()
		if arg_150_8 then
			arg_150_8()
		end

		if arg_150_6 then
			GetOrAddComponent(arg_150_0, "CanvasGroup").blocksRaycasts = true
		end
	end))

	return var_150_1
end

function TweenValue(arg_152_0, arg_152_1, arg_152_2, arg_152_3, arg_152_4, arg_152_5, arg_152_6, arg_152_7)
	local var_152_0 = LeanTween.value(go(arg_152_0), arg_152_1, arg_152_2, arg_152_3):setOnUpdate(System.Action_float(function(arg_153_0)
		if arg_152_5 then
			arg_152_5(arg_153_0)
		end
	end)):setOnComplete(System.Action(function()
		if arg_152_6 then
			arg_152_6()
		end
	end)):setDelay(arg_152_4 or 0)

	if arg_152_7 and arg_152_7 > 0 then
		var_152_0:setRepeat(arg_152_7)
	end

	return var_152_0
end

function rotateAni(arg_155_0, arg_155_1, arg_155_2)
	return LeanTween.rotate(rtf(arg_155_0), 360 * arg_155_1, arg_155_2):setLoopClamp()
end

function blinkAni(arg_156_0, arg_156_1, arg_156_2, arg_156_3)
	return LeanTween.alpha(rtf(arg_156_0), arg_156_3 or 0, arg_156_1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong(arg_156_2 or 0)
end

function scaleAni(arg_157_0, arg_157_1, arg_157_2, arg_157_3)
	return LeanTween.scale(rtf(arg_157_0), arg_157_3 or 0, arg_157_1):setLoopPingPong(arg_157_2 or 0)
end

function floatAni(arg_158_0, arg_158_1, arg_158_2, arg_158_3)
	local var_158_0 = arg_158_0.localPosition.y + arg_158_1

	return LeanTween.moveY(rtf(arg_158_0), var_158_0, arg_158_2):setLoopPingPong(arg_158_3 or 0)
end

local var_0_9 = tostring

function tostring(arg_159_0)
	if arg_159_0 == nil then
		return "nil"
	end

	local var_159_0 = var_0_9(arg_159_0)

	if var_159_0 == nil then
		if type(arg_159_0) == "table" then
			return "{}"
		end

		return " ~nil"
	end

	return var_159_0
end

function wordVer(arg_160_0, arg_160_1)
	if arg_160_0.match(arg_160_0, ChatConst.EmojiCodeMatch) then
		return 0, arg_160_0
	end

	arg_160_1 = arg_160_1 or {}

	local var_160_0 = filterEgyUnicode(arg_160_0)

	if #var_160_0 ~= #arg_160_0 then
		if arg_160_1.isReplace then
			arg_160_0 = var_160_0
		else
			return 1
		end
	end

	local var_160_1 = wordSplit(arg_160_0)
	local var_160_2 = pg.word_template
	local var_160_3 = pg.word_legal_template

	arg_160_1.isReplace = arg_160_1.isReplace or false
	arg_160_1.replaceWord = arg_160_1.replaceWord or "*"

	local var_160_4 = #var_160_1
	local var_160_5 = 1
	local var_160_6 = ""
	local var_160_7 = 0

	while var_160_5 <= var_160_4 do
		local var_160_8, var_160_9, var_160_10 = wordLegalMatch(var_160_1, var_160_3, var_160_5)

		if var_160_8 then
			var_160_5 = var_160_9
			var_160_6 = var_160_6 .. var_160_10
		else
			local var_160_11, var_160_12, var_160_13 = wordVerMatch(var_160_1, var_160_2, arg_160_1, var_160_5, "", false, var_160_5, "")

			if var_160_11 then
				var_160_5 = var_160_12
				var_160_7 = var_160_7 + 1

				if arg_160_1.isReplace then
					var_160_6 = var_160_6 .. var_160_13
				end
			else
				if arg_160_1.isReplace then
					var_160_6 = var_160_6 .. var_160_1[var_160_5]
				end

				var_160_5 = var_160_5 + 1
			end
		end
	end

	if arg_160_1.isReplace then
		return var_160_7, var_160_6
	else
		return var_160_7
	end
end

function wordLegalMatch(arg_161_0, arg_161_1, arg_161_2, arg_161_3, arg_161_4)
	if arg_161_2 > #arg_161_0 then
		return arg_161_3, arg_161_2, arg_161_4
	end

	local var_161_0 = arg_161_0[arg_161_2]
	local var_161_1 = arg_161_1[var_161_0]

	arg_161_4 = arg_161_4 == nil and "" or arg_161_4

	if var_161_1 then
		if var_161_1.this then
			return wordLegalMatch(arg_161_0, var_161_1, arg_161_2 + 1, true, arg_161_4 .. var_161_0)
		else
			return wordLegalMatch(arg_161_0, var_161_1, arg_161_2 + 1, false, arg_161_4 .. var_161_0)
		end
	else
		return arg_161_3, arg_161_2, arg_161_4
	end
end

local var_0_10 = string.byte("a")
local var_0_11 = string.byte("z")
local var_0_12 = string.byte("A")
local var_0_13 = string.byte("Z")

local function var_0_14(arg_162_0)
	if not arg_162_0 then
		return arg_162_0
	end

	local var_162_0 = string.byte(arg_162_0)

	if var_162_0 > 128 then
		return
	end

	if var_162_0 >= var_0_10 and var_162_0 <= var_0_11 then
		return string.char(var_162_0 - 32)
	elseif var_162_0 >= var_0_12 and var_162_0 <= var_0_13 then
		return string.char(var_162_0 + 32)
	else
		return arg_162_0
	end
end

function wordVerMatch(arg_163_0, arg_163_1, arg_163_2, arg_163_3, arg_163_4, arg_163_5, arg_163_6, arg_163_7)
	if arg_163_3 > #arg_163_0 then
		return arg_163_5, arg_163_6, arg_163_7
	end

	local var_163_0 = arg_163_0[arg_163_3]
	local var_163_1 = arg_163_1[var_163_0]

	if var_163_1 then
		local var_163_2, var_163_3, var_163_4 = wordVerMatch(arg_163_0, var_163_1, arg_163_2, arg_163_3 + 1, arg_163_2.isReplace and arg_163_4 .. arg_163_2.replaceWord or arg_163_4, var_163_1.this or arg_163_5, var_163_1.this and arg_163_3 + 1 or arg_163_6, var_163_1.this and (arg_163_2.isReplace and arg_163_4 .. arg_163_2.replaceWord or arg_163_4) or arg_163_7)

		if var_163_2 then
			return var_163_2, var_163_3, var_163_4
		end
	end

	local var_163_5 = var_0_14(var_163_0)
	local var_163_6 = arg_163_1[var_163_5]

	if var_163_5 ~= var_163_0 and var_163_6 then
		local var_163_7, var_163_8, var_163_9 = wordVerMatch(arg_163_0, var_163_6, arg_163_2, arg_163_3 + 1, arg_163_2.isReplace and arg_163_4 .. arg_163_2.replaceWord or arg_163_4, var_163_6.this or arg_163_5, var_163_6.this and arg_163_3 + 1 or arg_163_6, var_163_6.this and (arg_163_2.isReplace and arg_163_4 .. arg_163_2.replaceWord or arg_163_4) or arg_163_7)

		if var_163_7 then
			return var_163_7, var_163_8, var_163_9
		end
	end

	return arg_163_5, arg_163_6, arg_163_7
end

function wordSplit(arg_164_0)
	local var_164_0 = {}

	for iter_164_0 in arg_164_0.gmatch(arg_164_0, "[\x01-\x7F\xC2-\xF4][\x80-\xBF]*") do
		var_164_0[#var_164_0 + 1] = iter_164_0
	end

	return var_164_0
end

function contentWrap(arg_165_0, arg_165_1, arg_165_2)
	local var_165_0 = LuaHelper.WrapContent(arg_165_0, arg_165_1, arg_165_2)

	return #var_165_0 ~= #arg_165_0, var_165_0
end

function cancelRich(arg_166_0)
	local var_166_0

	for iter_166_0 = 1, 20 do
		local var_166_1

		arg_166_0, var_166_1 = string.gsub(arg_166_0, "<([^>]*)>", "%1")

		if var_166_1 <= 0 then
			break
		end
	end

	return arg_166_0
end

function getSkillConfig(arg_167_0)
	local var_167_0 = require("GameCfg.buff.buff_" .. arg_167_0)

	if not var_167_0 then
		warning("找不到技能配置: " .. arg_167_0)

		return
	end

	local var_167_1 = Clone(var_167_0)

	var_167_1.name = getSkillName(arg_167_0)
	var_167_1.desc = HXSet.hxLan(var_167_1.desc)
	var_167_1.desc_get = HXSet.hxLan(var_167_1.desc_get)

	_.each(var_167_1, function(arg_168_0)
		arg_168_0.desc = HXSet.hxLan(arg_168_0.desc)
	end)

	return var_167_1
end

function getSkillName(arg_169_0)
	local var_169_0 = pg.skill_data_template[arg_169_0] or pg.skill_data_display[arg_169_0]

	if var_169_0 then
		return HXSet.hxLan(var_169_0.name)
	else
		return ""
	end
end

function getSkillDescGet(arg_170_0, arg_170_1)
	local var_170_0 = arg_170_1 and pg.skill_world_display[arg_170_0] and setmetatable({}, {
		__index = function(arg_171_0, arg_171_1)
			return pg.skill_world_display[arg_170_0][arg_171_1] or pg.skill_data_template[arg_170_0][arg_171_1]
		end
	}) or pg.skill_data_template[arg_170_0]

	if not var_170_0 then
		return ""
	end

	local var_170_1 = var_170_0.desc_get ~= "" and var_170_0.desc_get or var_170_0.desc

	for iter_170_0, iter_170_1 in pairs(var_170_0.desc_get_add) do
		local var_170_2 = setColorStr(iter_170_1[1], COLOR_GREEN)

		if iter_170_1[2] then
			var_170_2 = var_170_2 .. specialGSub(i18n("word_skill_desc_get"), "$1", setColorStr(iter_170_1[2], COLOR_GREEN))
		end

		var_170_1 = specialGSub(var_170_1, "$" .. iter_170_0, var_170_2)
	end

	return HXSet.hxLan(var_170_1)
end

function getSkillDescLearn(arg_172_0, arg_172_1, arg_172_2)
	local var_172_0 = arg_172_2 and pg.skill_world_display[arg_172_0] and setmetatable({}, {
		__index = function(arg_173_0, arg_173_1)
			return pg.skill_world_display[arg_172_0][arg_173_1] or pg.skill_data_template[arg_172_0][arg_173_1]
		end
	}) or pg.skill_data_template[arg_172_0]

	if not var_172_0 then
		return ""
	end

	local var_172_1 = var_172_0.desc

	if not var_172_0.desc_add then
		return HXSet.hxLan(var_172_1)
	end

	for iter_172_0, iter_172_1 in pairs(var_172_0.desc_add) do
		local var_172_2 = iter_172_1[arg_172_1][1]

		if iter_172_1[arg_172_1][2] then
			var_172_2 = var_172_2 .. specialGSub(i18n("word_skill_desc_learn"), "$1", iter_172_1[arg_172_1][2])
		end

		var_172_1 = specialGSub(var_172_1, "$" .. iter_172_0, setColorStr(var_172_2, COLOR_YELLOW))
	end

	return HXSet.hxLan(var_172_1)
end

function getSkillDesc(arg_174_0, arg_174_1, arg_174_2)
	local var_174_0 = arg_174_2 and pg.skill_world_display[arg_174_0] and setmetatable({}, {
		__index = function(arg_175_0, arg_175_1)
			return pg.skill_world_display[arg_174_0][arg_175_1] or pg.skill_data_template[arg_174_0][arg_175_1]
		end
	}) or pg.skill_data_template[arg_174_0]

	if not var_174_0 then
		return ""
	end

	local var_174_1 = var_174_0.desc

	if not var_174_0.desc_add then
		return HXSet.hxLan(var_174_1)
	end

	for iter_174_0, iter_174_1 in pairs(var_174_0.desc_add) do
		local var_174_2 = setColorStr(iter_174_1[arg_174_1][1], COLOR_GREEN)

		var_174_1 = specialGSub(var_174_1, "$" .. iter_174_0, var_174_2)
	end

	return HXSet.hxLan(var_174_1)
end

function specialGSub(arg_176_0, arg_176_1, arg_176_2)
	arg_176_0 = string.gsub(arg_176_0, "<color=#", "<color=NNN")
	arg_176_0 = string.gsub(arg_176_0, "#", "")
	arg_176_2 = string.gsub(arg_176_2, "%%", "%%%%")
	arg_176_0 = string.gsub(arg_176_0, arg_176_1, arg_176_2)
	arg_176_0 = string.gsub(arg_176_0, "<color=NNN", "<color=#")

	return arg_176_0
end

function topAnimation(arg_177_0, arg_177_1, arg_177_2, arg_177_3, arg_177_4, arg_177_5)
	local var_177_0 = {}

	arg_177_4 = arg_177_4 or 0.27

	local var_177_1 = 0.05

	if arg_177_0 then
		local var_177_2 = arg_177_0.transform.localPosition.x

		setAnchoredPosition(arg_177_0, {
			x = var_177_2 - 500
		})
		shiftPanel(arg_177_0, var_177_2, nil, 0.05, arg_177_4, true, true)
		setActive(arg_177_0, true)
	end

	setActive(arg_177_1, false)
	setActive(arg_177_2, false)
	setActive(arg_177_3, false)

	for iter_177_0 = 1, 3 do
		table.insert(var_177_0, LeanTween.delayedCall(arg_177_4 + 0.13 + var_177_1 * iter_177_0, System.Action(function()
			if arg_177_1 then
				setActive(arg_177_1, not arg_177_1.gameObject.activeSelf)
			end
		end)).uniqueId)
		table.insert(var_177_0, LeanTween.delayedCall(arg_177_4 + 0.02 + var_177_1 * iter_177_0, System.Action(function()
			if arg_177_2 then
				setActive(arg_177_2, not go(arg_177_2).activeSelf)
			end

			if arg_177_2 then
				setActive(arg_177_3, not go(arg_177_3).activeSelf)
			end
		end)).uniqueId)
	end

	if arg_177_5 then
		table.insert(var_177_0, LeanTween.delayedCall(arg_177_4 + 0.13 + var_177_1 * 3 + 0.1, System.Action(function()
			arg_177_5()
		end)).uniqueId)
	end

	return var_177_0
end

function cancelTweens(arg_181_0)
	assert(arg_181_0, "must provide cancel targets, LeanTween.cancelAll is not allow")

	for iter_181_0, iter_181_1 in ipairs(arg_181_0) do
		if iter_181_1 then
			LeanTween.cancel(iter_181_1)
		end
	end
end

function getOfflineTimeStamp(arg_182_0)
	local var_182_0 = pg.TimeMgr.GetInstance():GetServerTime() - arg_182_0
	local var_182_1 = ""

	if var_182_0 <= 59 then
		var_182_1 = i18n("just_now")
	elseif var_182_0 <= 3599 then
		var_182_1 = i18n("several_minutes_before", math.floor(var_182_0 / 60))
	elseif var_182_0 <= 86399 then
		var_182_1 = i18n("several_hours_before", math.floor(var_182_0 / 3600))
	else
		var_182_1 = i18n("several_days_before", math.floor(var_182_0 / 86400))
	end

	return var_182_1
end

function playMovie(arg_183_0, arg_183_1, arg_183_2)
	local var_183_0 = GameObject.Find("OverlayCamera/Overlay/UITop/MoviePanel")

	if not IsNil(var_183_0) then
		pg.UIMgr.GetInstance():LoadingOn()
		WWWLoader.Inst:LoadStreamingAsset(arg_183_0, function(arg_184_0)
			pg.UIMgr.GetInstance():LoadingOff()

			local var_184_0 = GCHandle.Alloc(arg_184_0, GCHandleType.Pinned)

			setActive(var_183_0, true)

			local var_184_1 = var_183_0:AddComponent(typeof(CriManaMovieControllerForUI))

			var_184_1.player:SetData(arg_184_0, arg_184_0.Length)

			var_184_1.target = var_183_0:GetComponent(typeof(Image))
			var_184_1.loop = false
			var_184_1.additiveMode = false
			var_184_1.playOnStart = true

			local var_184_2

			var_184_2 = Timer.New(function()
				if var_184_1.player.status == CriMana.Player.Status.PlayEnd or var_184_1.player.status == CriMana.Player.Status.Stop or var_184_1.player.status == CriMana.Player.Status.Error then
					var_184_2:Stop()
					Object.Destroy(var_184_1)
					GCHandle.Free(var_184_0)
					setActive(var_183_0, false)

					if arg_183_1 then
						arg_183_1()
					end
				end
			end, 0.2, -1)

			var_184_2:Start()
			removeOnButton(var_183_0)

			if arg_183_2 then
				onButton(nil, var_183_0, function()
					var_184_1:Stop()
					GetOrAddComponent(var_183_0, typeof(Button)).onClick:RemoveAllListeners()
				end, SFX_CANCEL)
			end
		end)
	elseif arg_183_1 then
		arg_183_1()
	end
end

PaintCameraAdjustOn = false

function cameraPaintViewAdjust(arg_187_0)
	if PaintCameraAdjustOn ~= arg_187_0 then
		local var_187_0 = GameObject.Find("UICamera/Canvas"):GetComponent(typeof(CanvasScaler))

		if arg_187_0 then
			CameraMgr.instance.AutoAdapt = false

			CameraMgr.instance:Revert()

			var_187_0.screenMatchMode = CanvasScaler.ScreenMatchMode.MatchWidthOrHeight
			var_187_0.matchWidthOrHeight = 1
		else
			CameraMgr.instance.AutoAdapt = true
			CameraMgr.instance.CurrentWidth = 1
			CameraMgr.instance.CurrentHeight = 1
			CameraMgr.instance.AspectRatio = 1.7777777777777777
			var_187_0.screenMatchMode = CanvasScaler.ScreenMatchMode.Expand
		end

		PaintCameraAdjustOn = arg_187_0
	end
end

function ManhattonDist(arg_188_0, arg_188_1)
	return math.abs(arg_188_0.row - arg_188_1.row) + math.abs(arg_188_0.column - arg_188_1.column)
end

function checkFirstHelpShow(arg_189_0)
	local var_189_0 = getProxy(SettingsProxy)

	if not var_189_0:checkReadHelp(arg_189_0) then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip[arg_189_0].tip
		})
		var_189_0:recordReadHelp(arg_189_0)
	end
end

preOrientation = nil
preNotchFitterEnabled = false

function openPortrait(arg_190_0)
	enableNotch(arg_190_0, true)

	preOrientation = Input.deviceOrientation:ToString()

	originalPrint("Begining Orientation:" .. preOrientation)

	Screen.autorotateToPortrait = true
	Screen.autorotateToPortraitUpsideDown = true

	cameraPaintViewAdjust(true)
end

function closePortrait(arg_191_0)
	enableNotch(arg_191_0, false)

	Screen.autorotateToPortrait = false
	Screen.autorotateToPortraitUpsideDown = false

	originalPrint("Closing Orientation:" .. preOrientation)

	Screen.orientation = ScreenOrientation.LandscapeLeft

	local var_191_0 = Timer.New(function()
		Screen.orientation = ScreenOrientation.AutoRotation
	end, 0.2, 1):Start()

	cameraPaintViewAdjust(false)
end

function enableNotch(arg_193_0, arg_193_1)
	if arg_193_0 == nil then
		return
	end

	local var_193_0 = arg_193_0:GetComponent("NotchAdapt")
	local var_193_1 = arg_193_0:GetComponent("AspectRatioFitter")

	var_193_0.enabled = arg_193_1

	if var_193_1 then
		if arg_193_1 then
			var_193_1.enabled = preNotchFitterEnabled
		else
			preNotchFitterEnabled = var_193_1.enabled
			var_193_1.enabled = false
		end
	end
end

function comma_value(arg_194_0)
	local var_194_0 = arg_194_0
	local var_194_1 = 0

	repeat
		local var_194_2

		var_194_0, var_194_2 = string.gsub(var_194_0, "^(-?%d+)(%d%d%d)", "%1,%2")
	until var_194_2 == 0

	return var_194_0
end

local var_0_15 = 0.2

function SwitchPanel(arg_195_0, arg_195_1, arg_195_2, arg_195_3, arg_195_4, arg_195_5)
	arg_195_3 = defaultValue(arg_195_3, var_0_15)

	if arg_195_5 then
		LeanTween.cancel(go(arg_195_0))
	end

	local var_195_0 = Vector3.New(tf(arg_195_0).localPosition.x, tf(arg_195_0).localPosition.y, tf(arg_195_0).localPosition.z)

	if arg_195_1 then
		var_195_0.x = arg_195_1
	end

	if arg_195_2 then
		var_195_0.y = arg_195_2
	end

	local var_195_1 = LeanTween.move(rtf(arg_195_0), var_195_0, arg_195_3):setEase(LeanTweenType.easeInOutSine)

	if arg_195_4 then
		var_195_1:setDelay(arg_195_4)
	end

	return var_195_1
end

function updateActivityTaskStatus(arg_196_0)
	local var_196_0 = arg_196_0:getConfig("config_id")
	local var_196_1, var_196_2 = getActivityTask(arg_196_0, true)

	if not var_196_2 then
		pg.m02:sendNotification(GAME.ACTIVITY_OPERATION, {
			cmd = 1,
			activity_id = arg_196_0.id
		})

		return true
	end

	return false
end

function updateCrusingActivityTask(arg_197_0)
	local var_197_0 = getProxy(TaskProxy)
	local var_197_1 = arg_197_0:getNDay()

	for iter_197_0, iter_197_1 in ipairs(arg_197_0:getConfig("config_data")) do
		local var_197_2 = pg.battlepass_task_group[iter_197_1]

		if var_197_1 >= var_197_2.time and underscore.any(underscore.flatten(var_197_2.task_group), function(arg_198_0)
			return var_197_0:getTaskVO(arg_198_0) == nil
		end) then
			pg.m02:sendNotification(GAME.CRUSING_CMD, {
				cmd = 1,
				activity_id = arg_197_0.id
			})

			return true
		end
	end

	return false
end

function setShipCardFrame(arg_199_0, arg_199_1, arg_199_2)
	arg_199_0.localScale = Vector3.one
	arg_199_0.anchorMin = Vector2.zero
	arg_199_0.anchorMax = Vector2.one

	local var_199_0 = arg_199_2 or arg_199_1

	GetImageSpriteFromAtlasAsync("shipframe", var_199_0, arg_199_0)

	local var_199_1 = pg.frame_resource[var_199_0]

	if var_199_1 then
		local var_199_2 = var_199_1.param

		arg_199_0.offsetMin = Vector2(var_199_2[1], var_199_2[2])
		arg_199_0.offsetMax = Vector2(var_199_2[3], var_199_2[4])
	else
		arg_199_0.offsetMin = Vector2.zero
		arg_199_0.offsetMax = Vector2.zero
	end
end

function setRectShipCardFrame(arg_200_0, arg_200_1, arg_200_2)
	arg_200_0.localScale = Vector3.one
	arg_200_0.anchorMin = Vector2.zero
	arg_200_0.anchorMax = Vector2.one

	setImageSprite(arg_200_0, GetSpriteFromAtlas("shipframeb", "b" .. (arg_200_2 or arg_200_1)))

	local var_200_0 = "b" .. (arg_200_2 or arg_200_1)
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

function setFrameEffect(arg_201_0, arg_201_1)
	if arg_201_1 then
		local var_201_0 = arg_201_1 .. "(Clone)"
		local var_201_1 = false

		eachChild(arg_201_0, function(arg_202_0)
			setActive(arg_202_0, arg_202_0.name == var_201_0)

			var_201_1 = var_201_1 or arg_202_0.name == var_201_0
		end)

		if not var_201_1 then
			LoadAndInstantiateAsync("effect", arg_201_1, function(arg_203_0)
				if IsNil(arg_201_0) or findTF(arg_201_0, var_201_0) then
					Object.Destroy(arg_203_0)
				else
					setParent(arg_203_0, arg_201_0)
					setActive(arg_203_0, true)
				end
			end)
		end
	end

	setActive(arg_201_0, arg_201_1)
end

function setProposeMarkIcon(arg_204_0, arg_204_1)
	local var_204_0 = arg_204_0:Find("proposeShipCard(Clone)")
	local var_204_1 = arg_204_1.propose and not arg_204_1:ShowPropose()

	if var_204_0 then
		setActive(var_204_0, var_204_1)
	elseif var_204_1 then
		pg.PoolMgr.GetInstance():GetUI("proposeShipCard", true, function(arg_205_0)
			if IsNil(arg_204_0) or arg_204_0:Find("proposeShipCard(Clone)") then
				pg.PoolMgr.GetInstance():ReturnUI("proposeShipCard", arg_205_0)
			else
				setParent(arg_205_0, arg_204_0, false)
			end
		end)
	end
end

function flushShipCard(arg_206_0, arg_206_1)
	local var_206_0 = arg_206_1:rarity2bgPrint()
	local var_206_1 = findTF(arg_206_0, "content/bg")

	GetImageSpriteFromAtlasAsync("bg/star_level_card_" .. var_206_0, "", var_206_1)

	local var_206_2 = findTF(arg_206_0, "content/ship_icon")
	local var_206_3 = arg_206_1 and {
		"shipYardIcon/" .. arg_206_1:getPainting(),
		arg_206_1:getPainting()
	} or {
		"shipYardIcon/unknown",
		""
	}

	GetImageSpriteFromAtlasAsync(var_206_3[1], var_206_3[2], var_206_2)

	local var_206_4 = arg_206_1:getShipType()
	local var_206_5 = findTF(arg_206_0, "content/info/top/type")

	GetImageSpriteFromAtlasAsync("shiptype", shipType2print(var_206_4), var_206_5)
	setText(findTF(arg_206_0, "content/dockyard/lv/Text"), defaultValue(arg_206_1.level, 1))

	local var_206_6 = arg_206_1:getStar()
	local var_206_7 = arg_206_1:getMaxStar()
	local var_206_8 = findTF(arg_206_0, "content/front/stars")

	setActive(var_206_8, true)

	local var_206_9 = findTF(var_206_8, "star_tpl")
	local var_206_10 = var_206_8.childCount

	for iter_206_0 = 1, Ship.CONFIG_MAX_STAR do
		local var_206_11 = var_206_10 < iter_206_0 and cloneTplTo(var_206_9, var_206_8) or var_206_8:GetChild(iter_206_0 - 1)

		setActive(var_206_11, iter_206_0 <= var_206_7)
		triggerToggle(var_206_11, iter_206_0 <= var_206_6)
	end

	local var_206_12 = findTF(arg_206_0, "content/front/frame")
	local var_206_13, var_206_14 = arg_206_1:GetFrameAndEffect()

	setShipCardFrame(var_206_12, var_206_0, var_206_13)
	setFrameEffect(findTF(arg_206_0, "content/front/bg_other"), var_206_14)
	setProposeMarkIcon(arg_206_0:Find("content/dockyard/propose"), arg_206_1)
end

function TweenItemAlphaAndWhite(arg_207_0)
	LeanTween.cancel(arg_207_0)

	local var_207_0 = GetOrAddComponent(arg_207_0, "CanvasGroup")

	var_207_0.alpha = 0

	LeanTween.alphaCanvas(var_207_0, 1, 0.2):setUseEstimatedTime(true)

	local var_207_1 = findTF(arg_207_0.transform, "white_mask")

	if var_207_1 then
		setActive(var_207_1, false)
	end
end

function ClearTweenItemAlphaAndWhite(arg_208_0)
	LeanTween.cancel(arg_208_0)

	GetOrAddComponent(arg_208_0, "CanvasGroup").alpha = 0
end

function getGroupOwnSkins(arg_209_0)
	local var_209_0 = {}
	local var_209_1 = getProxy(ShipSkinProxy):getSkinList()
	local var_209_2 = getProxy(CollectionProxy):getShipGroup(arg_209_0)

	if var_209_2 then
		local var_209_3 = ShipGroup.getSkinList(arg_209_0)

		for iter_209_0, iter_209_1 in ipairs(var_209_3) do
			if iter_209_1.skin_type == ShipSkin.SKIN_TYPE_DEFAULT or table.contains(var_209_1, iter_209_1.id) or iter_209_1.skin_type == ShipSkin.SKIN_TYPE_REMAKE and var_209_2.trans or iter_209_1.skin_type == ShipSkin.SKIN_TYPE_PROPOSE and var_209_2.married == 1 then
				var_209_0[iter_209_1.id] = true
			end
		end
	end

	return var_209_0
end

function split(arg_210_0, arg_210_1)
	local var_210_0 = {}

	if not arg_210_0 then
		return nil
	end

	local var_210_1 = #arg_210_0
	local var_210_2 = 1

	while var_210_2 <= var_210_1 do
		local var_210_3 = string.find(arg_210_0, arg_210_1, var_210_2)

		if var_210_3 == nil then
			table.insert(var_210_0, string.sub(arg_210_0, var_210_2, var_210_1))

			break
		end

		table.insert(var_210_0, string.sub(arg_210_0, var_210_2, var_210_3 - 1))

		if var_210_3 == var_210_1 then
			table.insert(var_210_0, "")

			break
		end

		var_210_2 = var_210_3 + 1
	end

	return var_210_0
end

function NumberToChinese(arg_211_0, arg_211_1)
	local var_211_0 = ""
	local var_211_1 = #arg_211_0

	for iter_211_0 = 1, var_211_1 do
		local var_211_2 = string.sub(arg_211_0, iter_211_0, iter_211_0)

		if var_211_2 ~= "0" or var_211_2 == "0" and not arg_211_1 then
			if arg_211_1 then
				if var_211_1 >= 2 then
					if iter_211_0 == 1 then
						if var_211_2 == "1" then
							var_211_0 = i18n("number_" .. 10)
						else
							var_211_0 = i18n("number_" .. var_211_2) .. i18n("number_" .. 10)
						end
					else
						var_211_0 = var_211_0 .. i18n("number_" .. var_211_2)
					end
				else
					var_211_0 = var_211_0 .. i18n("number_" .. var_211_2)
				end
			else
				var_211_0 = var_211_0 .. i18n("number_" .. var_211_2)
			end
		end
	end

	return var_211_0
end

function getActivityTask(arg_212_0, arg_212_1)
	local var_212_0 = getProxy(TaskProxy)
	local var_212_1 = arg_212_0:getConfig("config_data")
	local var_212_2 = arg_212_0:getNDay(arg_212_0.data1)
	local var_212_3
	local var_212_4
	local var_212_5

	for iter_212_0 = math.max(arg_212_0.data3, 1), math.min(var_212_2, #var_212_1) do
		local var_212_6 = _.flatten({
			var_212_1[iter_212_0]
		})

		for iter_212_1, iter_212_2 in ipairs(var_212_6) do
			local var_212_7 = var_212_0:getTaskById(iter_212_2)

			if var_212_7 then
				return var_212_7.id, var_212_7
			end

			if var_212_4 then
				var_212_5 = var_212_0:getFinishTaskById(iter_212_2)

				if var_212_5 then
					var_212_4 = var_212_5
				elseif arg_212_1 then
					return iter_212_2
				else
					return var_212_4.id, var_212_4
				end
			else
				var_212_4 = var_212_0:getFinishTaskById(iter_212_2)
				var_212_5 = var_212_5 or iter_212_2
			end
		end
	end

	if var_212_4 then
		return var_212_4.id, var_212_4
	else
		return var_212_5
	end
end

function setImageFromImage(arg_213_0, arg_213_1, arg_213_2)
	local var_213_0 = GetComponent(arg_213_0, "Image")

	var_213_0.sprite = GetComponent(arg_213_1, "Image").sprite

	if arg_213_2 then
		var_213_0:SetNativeSize()
	end
end

function skinTimeStamp(arg_214_0)
	local var_214_0, var_214_1, var_214_2, var_214_3 = pg.TimeMgr.GetInstance():parseTimeFrom(arg_214_0)

	if var_214_0 >= 1 then
		return i18n("limit_skin_time_day", var_214_0)
	elseif var_214_0 <= 0 and var_214_1 > 0 then
		return i18n("limit_skin_time_day_min", var_214_1, var_214_2)
	elseif var_214_0 <= 0 and var_214_1 <= 0 and (var_214_2 > 0 or var_214_3 > 0) then
		return i18n("limit_skin_time_min", math.max(var_214_2, 1))
	elseif var_214_0 <= 0 and var_214_1 <= 0 and var_214_2 <= 0 and var_214_3 <= 0 then
		return i18n("limit_skin_time_overtime")
	end
end

function skinCommdityTimeStamp(arg_215_0)
	local var_215_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_215_1 = math.max(arg_215_0 - var_215_0, 0)
	local var_215_2 = math.floor(var_215_1 / 86400)

	if var_215_2 > 0 then
		return i18n("time_remaining_tip") .. var_215_2 .. i18n("word_date")
	else
		local var_215_3 = math.floor(var_215_1 / 3600)

		if var_215_3 > 0 then
			return i18n("time_remaining_tip") .. var_215_3 .. i18n("word_hour")
		else
			local var_215_4 = math.floor(var_215_1 / 60)

			if var_215_4 > 0 then
				return i18n("time_remaining_tip") .. var_215_4 .. i18n("word_minute")
			else
				return i18n("time_remaining_tip") .. var_215_1 .. i18n("word_second")
			end
		end
	end
end

function InstagramTimeStamp(arg_216_0)
	local var_216_0 = pg.TimeMgr.GetInstance():GetServerTime() - arg_216_0
	local var_216_1 = var_216_0 / 86400

	if var_216_1 > 1 then
		return i18n("ins_word_day", math.floor(var_216_1))
	else
		local var_216_2 = var_216_0 / 3600

		if var_216_2 > 1 then
			return i18n("ins_word_hour", math.floor(var_216_2))
		else
			local var_216_3 = var_216_0 / 60

			if var_216_3 > 1 then
				return i18n("ins_word_minu", math.floor(var_216_3))
			else
				return i18n("ins_word_minu", 1)
			end
		end
	end
end

function InstagramReplyTimeStamp(arg_217_0)
	local var_217_0 = pg.TimeMgr.GetInstance():GetServerTime() - arg_217_0
	local var_217_1 = var_217_0 / 86400

	if var_217_1 > 1 then
		return i18n1(math.floor(var_217_1) .. "d")
	else
		local var_217_2 = var_217_0 / 3600

		if var_217_2 > 1 then
			return i18n1(math.floor(var_217_2) .. "h")
		else
			local var_217_3 = var_217_0 / 60

			if var_217_3 > 1 then
				return i18n1(math.floor(var_217_3) .. "min")
			else
				return i18n1("1min")
			end
		end
	end
end

function attireTimeStamp(arg_218_0)
	local var_218_0, var_218_1, var_218_2, var_218_3 = pg.TimeMgr.GetInstance():parseTimeFrom(arg_218_0)

	if var_218_0 <= 0 and var_218_1 <= 0 and var_218_2 <= 0 and var_218_3 <= 0 then
		return i18n("limit_skin_time_overtime")
	else
		return i18n("attire_time_stamp", var_218_0, var_218_1, var_218_2)
	end
end

function checkExist(arg_219_0, ...)
	local var_219_0 = {
		...
	}

	for iter_219_0, iter_219_1 in ipairs(var_219_0) do
		if arg_219_0 == nil then
			break
		end

		assert(type(arg_219_0) == "table", "type error : intermediate target should be table")
		assert(type(iter_219_1) == "table", "type error : param should be table")

		if type(arg_219_0[iter_219_1[1]]) == "function" then
			arg_219_0 = arg_219_0[iter_219_1[1]](arg_219_0, unpack(iter_219_1[2] or {}))
		else
			arg_219_0 = arg_219_0[iter_219_1[1]]
		end
	end

	return arg_219_0
end

function AcessWithinNull(arg_220_0, arg_220_1)
	if arg_220_0 == nil then
		return
	end

	assert(type(arg_220_0) == "table")

	return arg_220_0[arg_220_1]
end

function showRepairMsgbox()
	local var_221_0 = {
		text = i18n("msgbox_repair"),
		onCallback = function()
			if PathMgr.FileExists(Application.persistentDataPath .. "/hashes.csv") then
				BundleWizard.Inst:GetGroupMgr("DEFAULT_RES"):StartVerifyForLua()
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("word_no_cache"))
			end
		end
	}
	local var_221_1 = {
		text = i18n("msgbox_repair_l2d"),
		onCallback = function()
			if PathMgr.FileExists(Application.persistentDataPath .. "/hashes-live2d.csv") then
				BundleWizard.Inst:GetGroupMgr("L2D"):StartVerifyForLua()
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("word_no_cache"))
			end
		end
	}
	local var_221_2 = {
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
			var_221_2,
			var_221_1,
			var_221_0
		}
	})
end

function resourceVerify(arg_225_0, arg_225_1)
	if CSharpVersion > 35 then
		BundleWizard.Inst:GetGroupMgr("DEFAULT_RES"):StartVerifyForLua()

		return
	end

	local var_225_0 = Application.persistentDataPath .. "/hashes.csv"
	local var_225_1
	local var_225_2 = PathMgr.ReadAllLines(var_225_0)
	local var_225_3 = {}

	if arg_225_0 then
		setActive(arg_225_0, true)
	else
		pg.UIMgr.GetInstance():LoadingOn()
	end

	local function var_225_4()
		if arg_225_0 then
			setActive(arg_225_0, false)
		else
			pg.UIMgr.GetInstance():LoadingOff()
		end

		print(var_225_1)

		if var_225_1 then
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

	local var_225_5 = var_225_2.Length
	local var_225_6

	local function var_225_7(arg_228_0)
		if arg_228_0 < 0 then
			var_225_4()

			return
		end

		if arg_225_1 then
			setSlider(arg_225_1, 0, var_225_5, var_225_5 - arg_228_0)
		end

		local var_228_0 = string.split(var_225_2[arg_228_0], ",")
		local var_228_1 = var_228_0[1]
		local var_228_2 = var_228_0[3]
		local var_228_3 = PathMgr.getAssetBundle(var_228_1)

		if PathMgr.FileExists(var_228_3) then
			local var_228_4 = PathMgr.ReadAllBytes(PathMgr.getAssetBundle(var_228_1))

			if var_228_2 == HashUtil.CalcMD5(var_228_4) then
				onNextTick(function()
					var_225_7(arg_228_0 - 1)
				end)

				return
			end
		end

		var_225_1 = var_228_1

		var_225_4()
	end

	var_225_7(var_225_5 - 1)
end

function splitByWordEN(arg_230_0, arg_230_1)
	local var_230_0 = string.split(arg_230_0, " ")
	local var_230_1 = ""
	local var_230_2 = ""
	local var_230_3 = arg_230_1:GetComponent(typeof(RectTransform))
	local var_230_4 = arg_230_1:GetComponent(typeof(Text))
	local var_230_5 = var_230_3.rect.width

	for iter_230_0, iter_230_1 in ipairs(var_230_0) do
		local var_230_6 = var_230_2

		var_230_2 = var_230_2 == "" and iter_230_1 or var_230_2 .. " " .. iter_230_1

		setText(arg_230_1, var_230_2)

		if var_230_5 < var_230_4.preferredWidth then
			var_230_1 = var_230_1 == "" and var_230_6 or var_230_1 .. "\n" .. var_230_6
			var_230_2 = iter_230_1
		end

		if iter_230_0 >= #var_230_0 then
			var_230_1 = var_230_1 == "" and var_230_2 or var_230_1 .. "\n" .. var_230_2
		end
	end

	return var_230_1
end

function checkBirthFormat(arg_231_0)
	if #arg_231_0 ~= 8 then
		return false
	end

	local var_231_0 = 0
	local var_231_1 = #arg_231_0

	while var_231_0 < var_231_1 do
		local var_231_2 = string.byte(arg_231_0, var_231_0 + 1)

		if var_231_2 < 48 or var_231_2 > 57 then
			return false
		end

		var_231_0 = var_231_0 + 1
	end

	return true
end

function isHalfBodyLive2D(arg_232_0)
	local var_232_0 = {
		"biaoqiang",
		"z23",
		"lafei",
		"lingbo",
		"mingshi",
		"xuefeng"
	}

	return _.any(var_232_0, function(arg_233_0)
		return arg_233_0 == arg_232_0
	end)
end

function GetServerState(arg_234_0)
	local var_234_0 = -1
	local var_234_1 = 0
	local var_234_2 = 1
	local var_234_3 = 2
	local var_234_4 = NetConst.GetServerStateUrl()

	if PLATFORM_CODE == PLATFORM_CH then
		var_234_4 = string.gsub(var_234_4, "https", "http")
	end

	VersionMgr.Inst:WebRequest(var_234_4, function(arg_235_0, arg_235_1)
		local var_235_0 = true
		local var_235_1 = false

		for iter_235_0 in string.gmatch(arg_235_1, "\"state\":%d") do
			if iter_235_0 ~= "\"state\":1" then
				var_235_0 = false
			end

			var_235_1 = true
		end

		if not var_235_1 then
			var_235_0 = false
		end

		if arg_234_0 ~= nil then
			arg_234_0(var_235_0 and var_234_2 or var_234_1)
		end
	end)
end

function setScrollText(arg_236_0, arg_236_1)
	GetOrAddComponent(arg_236_0, "ScrollText"):SetText(arg_236_1)
end

function changeToScrollText(arg_237_0, arg_237_1)
	local var_237_0 = GetComponent(arg_237_0, typeof(Text))

	assert(var_237_0, "without component<Text>")

	local var_237_1 = arg_237_0:Find("subText")

	if not var_237_1 then
		var_237_1 = cloneTplTo(arg_237_0, arg_237_0, "subText")

		eachChild(arg_237_0, function(arg_238_0)
			setActive(arg_238_0, arg_238_0 == var_237_1)
		end)

		arg_237_0:GetComponent(typeof(Text)).enabled = false
	end

	setScrollText(var_237_1, arg_237_1)
end

local var_0_16
local var_0_17
local var_0_18
local var_0_19

local function var_0_20(arg_239_0, arg_239_1, arg_239_2)
	local var_239_0 = arg_239_0:Find("base")
	local var_239_1, var_239_2, var_239_3 = Equipment.GetInfoTrans(arg_239_1, arg_239_2)

	if arg_239_1.nextValue then
		local var_239_4 = {
			name = arg_239_1.name,
			type = arg_239_1.type,
			value = arg_239_1.nextValue
		}
		local var_239_5, var_239_6 = Equipment.GetInfoTrans(var_239_4, arg_239_2)

		var_239_2 = var_239_2 .. setColorStr("   >   " .. var_239_6, COLOR_GREEN)
	end

	setText(var_239_0:Find("name"), var_239_1)

	if var_239_3 then
		local var_239_7 = "<color=#afff72>(+" .. ys.Battle.BattleConst.UltimateBonus.AuxBoostValue * 100 .. "%)</color>"

		setText(var_239_0:Find("value"), var_239_2 .. var_239_7)
	else
		setText(var_239_0:Find("value"), var_239_2)
	end

	setActive(var_239_0:Find("value/up"), arg_239_1.compare and arg_239_1.compare > 0)
	setActive(var_239_0:Find("value/down"), arg_239_1.compare and arg_239_1.compare < 0)
	triggerToggle(var_239_0, arg_239_1.lock_open)

	if not arg_239_1.lock_open and arg_239_1.sub and #arg_239_1.sub > 0 then
		GetComponent(var_239_0, typeof(Toggle)).enabled = true
	else
		setActive(var_239_0:Find("name/close"), false)
		setActive(var_239_0:Find("name/open"), false)

		GetComponent(var_239_0, typeof(Toggle)).enabled = false
	end
end

local function var_0_21(arg_240_0, arg_240_1, arg_240_2, arg_240_3)
	var_0_20(arg_240_0, arg_240_2, arg_240_3)

	if not arg_240_2.sub or #arg_240_2.sub == 0 then
		return
	end

	var_0_18(arg_240_0:Find("subs"), arg_240_1, arg_240_2.sub, arg_240_3)
end

function var_0_18(arg_241_0, arg_241_1, arg_241_2, arg_241_3)
	removeAllChildren(arg_241_0)
	var_0_19(arg_241_0, arg_241_1, arg_241_2, arg_241_3)
end

function var_0_19(arg_242_0, arg_242_1, arg_242_2, arg_242_3)
	for iter_242_0, iter_242_1 in ipairs(arg_242_2) do
		local var_242_0 = cloneTplTo(arg_242_1, arg_242_0)

		var_0_21(var_242_0, arg_242_1, iter_242_1, arg_242_3)
	end
end

function updateEquipInfo(arg_243_0, arg_243_1, arg_243_2, arg_243_3)
	local var_243_0 = arg_243_0:Find("attr_tpl")

	var_0_18(arg_243_0:Find("attrs"), var_243_0, arg_243_1.attrs, arg_243_3)
	setActive(arg_243_0:Find("skill"), arg_243_2)

	if arg_243_2 then
		var_0_21(arg_243_0:Find("skill/attr"), var_243_0, {
			name = i18n("skill"),
			value = setColorStr(arg_243_2.name, "#FFDE00FF")
		}, arg_243_3)
		setText(arg_243_0:Find("skill/value/Text"), getSkillDescGet(arg_243_2.id))
	end

	setActive(arg_243_0:Find("weapon"), #arg_243_1.weapon.sub > 0)

	if #arg_243_1.weapon.sub > 0 then
		var_0_18(arg_243_0:Find("weapon"), var_243_0, {
			arg_243_1.weapon
		}, arg_243_3)
	end

	setActive(arg_243_0:Find("equip_info"), #arg_243_1.equipInfo.sub > 0)

	if #arg_243_1.equipInfo.sub > 0 then
		var_0_18(arg_243_0:Find("equip_info"), var_243_0, {
			arg_243_1.equipInfo
		}, arg_243_3)
	end

	var_0_21(arg_243_0:Find("part/attr"), var_243_0, {
		name = i18n("equip_info_23")
	}, arg_243_3)

	local var_243_1 = arg_243_0:Find("part/value")
	local var_243_2 = var_243_1:Find("label")
	local var_243_3 = {}
	local var_243_4 = {}

	if #arg_243_1.part[1] == 0 and #arg_243_1.part[2] == 0 then
		setmetatable(var_243_3, {
			__index = function(arg_244_0, arg_244_1)
				return true
			end
		})
		setmetatable(var_243_4, {
			__index = function(arg_245_0, arg_245_1)
				return true
			end
		})
	else
		for iter_243_0, iter_243_1 in ipairs(arg_243_1.part[1]) do
			var_243_3[iter_243_1] = true
		end

		for iter_243_2, iter_243_3 in ipairs(arg_243_1.part[2]) do
			var_243_4[iter_243_3] = true
		end
	end

	local var_243_5 = ShipType.MergeFengFanType(ShipType.FilterOverQuZhuType(ShipType.AllShipType), var_243_3, var_243_4)

	UIItemList.StaticAlign(var_243_1, var_243_2, #var_243_5, function(arg_246_0, arg_246_1, arg_246_2)
		arg_246_1 = arg_246_1 + 1

		if arg_246_0 == UIItemList.EventUpdate then
			local var_246_0 = var_243_5[arg_246_1]

			GetImageSpriteFromAtlasAsync("shiptype", ShipType.Type2CNLabel(var_246_0), arg_246_2)
			setActive(arg_246_2:Find("main"), var_243_3[var_246_0] and not var_243_4[var_246_0])
			setActive(arg_246_2:Find("sub"), var_243_4[var_246_0] and not var_243_3[var_246_0])
			setImageAlpha(arg_246_2, not var_243_3[var_246_0] and not var_243_4[var_246_0] and 0.3 or 1)
		end
	end)
end

function updateEquipUpgradeInfo(arg_247_0, arg_247_1, arg_247_2)
	local var_247_0 = arg_247_0:Find("attr_tpl")

	var_0_18(arg_247_0:Find("attrs"), var_247_0, arg_247_1.attrs, arg_247_2)
	setActive(arg_247_0:Find("weapon"), #arg_247_1.weapon.sub > 0)

	if #arg_247_1.weapon.sub > 0 then
		var_0_18(arg_247_0:Find("weapon"), var_247_0, {
			arg_247_1.weapon
		}, arg_247_2)
	end

	setActive(arg_247_0:Find("equip_info"), #arg_247_1.equipInfo.sub > 0)

	if #arg_247_1.equipInfo.sub > 0 then
		var_0_18(arg_247_0:Find("equip_info"), var_247_0, {
			arg_247_1.equipInfo
		}, arg_247_2)
	end
end

function setCanvasOverrideSorting(arg_248_0, arg_248_1)
	local var_248_0 = arg_248_0.parent

	arg_248_0:SetParent(pg.LayerWeightMgr.GetInstance().uiOrigin, false)

	if isActive(arg_248_0) then
		GetOrAddComponent(arg_248_0, typeof(Canvas)).overrideSorting = arg_248_1
	else
		setActive(arg_248_0, true)

		GetOrAddComponent(arg_248_0, typeof(Canvas)).overrideSorting = arg_248_1

		setActive(arg_248_0, false)
	end

	arg_248_0:SetParent(var_248_0, false)
end

function createNewGameObject(arg_249_0, arg_249_1)
	local var_249_0 = GameObject.New()

	if arg_249_0 then
		var_249_0.name = "model"
	end

	var_249_0.layer = arg_249_1 or Layer.UI

	return GetOrAddComponent(var_249_0, "RectTransform")
end

function CreateShell(arg_250_0)
	if type(arg_250_0) ~= "table" and type(arg_250_0) ~= "userdata" then
		return arg_250_0
	end

	local var_250_0 = setmetatable({
		__index = arg_250_0
	}, arg_250_0)

	return setmetatable({}, var_250_0)
end

function CameraFittingSettin(arg_251_0)
	local var_251_0 = GetComponent(arg_251_0, typeof(Camera))
	local var_251_1 = 1.7777777777777777
	local var_251_2 = Screen.width / Screen.height

	if var_251_2 < var_251_1 then
		local var_251_3 = var_251_2 / var_251_1

		var_251_0.rect = var_0_0.Rect.New(0, (1 - var_251_3) / 2, 1, var_251_3)
	end
end

function SwitchSpecialChar(arg_252_0, arg_252_1)
	if PLATFORM_CODE ~= PLATFORM_US then
		arg_252_0 = arg_252_0:gsub(" ", " ")
		arg_252_0 = arg_252_0:gsub("\t", "    ")
	end

	if not arg_252_1 then
		arg_252_0 = arg_252_0:gsub("\n", " ")
	end

	return arg_252_0
end

function AfterCheck(arg_253_0, arg_253_1)
	local var_253_0 = {}

	for iter_253_0, iter_253_1 in ipairs(arg_253_0) do
		var_253_0[iter_253_0] = iter_253_1[1]()
	end

	arg_253_1()

	for iter_253_2, iter_253_3 in ipairs(arg_253_0) do
		if var_253_0[iter_253_2] ~= iter_253_3[1]() then
			iter_253_3[2]()
		end

		var_253_0[iter_253_2] = iter_253_3[1]()
	end
end

function CompareFuncs(arg_254_0, arg_254_1)
	local var_254_0 = {}

	local function var_254_1(arg_255_0, arg_255_1)
		var_254_0[arg_255_0] = var_254_0[arg_255_0] or {}
		var_254_0[arg_255_0][arg_255_1] = var_254_0[arg_255_0][arg_255_1] or arg_254_0[arg_255_0](arg_255_1)

		return var_254_0[arg_255_0][arg_255_1]
	end

	return function(arg_256_0, arg_256_1)
		local var_256_0 = 1

		while var_256_0 <= #arg_254_0 do
			local var_256_1 = var_254_1(var_256_0, arg_256_0)
			local var_256_2 = var_254_1(var_256_0, arg_256_1)

			if var_256_1 == var_256_2 then
				var_256_0 = var_256_0 + 1
			else
				return var_256_1 < var_256_2
			end
		end

		return tobool(arg_254_1)
	end
end

function DropResultIntegration(arg_257_0)
	local var_257_0 = {}
	local var_257_1 = 1

	while var_257_1 <= #arg_257_0 do
		local var_257_2 = arg_257_0[var_257_1].type
		local var_257_3 = arg_257_0[var_257_1].id

		var_257_0[var_257_2] = var_257_0[var_257_2] or {}

		if var_257_0[var_257_2][var_257_3] then
			local var_257_4 = arg_257_0[var_257_0[var_257_2][var_257_3]]
			local var_257_5 = table.remove(arg_257_0, var_257_1)

			var_257_4.count = var_257_4.count + var_257_5.count
		else
			var_257_0[var_257_2][var_257_3] = var_257_1
			var_257_1 = var_257_1 + 1
		end
	end

	local var_257_6 = {
		function(arg_258_0)
			local var_258_0 = arg_258_0.type
			local var_258_1 = arg_258_0.id

			if var_258_0 == DROP_TYPE_SHIP then
				return 1
			elseif var_258_0 == DROP_TYPE_RESOURCE then
				if var_258_1 == 1 then
					return 2
				else
					return 3
				end
			elseif var_258_0 == DROP_TYPE_ITEM then
				if var_258_1 == 59010 then
					return 4
				elseif var_258_1 == 59900 then
					return 5
				else
					local var_258_2 = Item.getConfigData(var_258_1)
					local var_258_3 = var_258_2 and var_258_2.type or 0

					if var_258_3 == 9 then
						return 6
					elseif var_258_3 == 5 then
						return 7
					elseif var_258_3 == 4 then
						return 8
					elseif var_258_3 == 7 then
						return 9
					end
				end
			elseif var_258_0 == DROP_TYPE_VITEM and var_258_1 == 59011 then
				return 4
			end

			return 100
		end,
		function(arg_259_0)
			local var_259_0

			if arg_259_0.type == DROP_TYPE_SHIP then
				var_259_0 = pg.ship_data_statistics[arg_259_0.id]
			elseif arg_259_0.type == DROP_TYPE_ITEM then
				var_259_0 = Item.getConfigData(arg_259_0.id)
			end

			return (var_259_0 and var_259_0.rarity or 0) * -1
		end,
		function(arg_260_0)
			return arg_260_0.id
		end
	}

	table.sort(arg_257_0, CompareFuncs(var_257_6))
end

function getLoginConfig()
	local var_261_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_261_1 = 1

	for iter_261_0, iter_261_1 in ipairs(pg.login.all) do
		if pg.login[iter_261_1].date ~= "stop" then
			local var_261_2, var_261_3 = parseTimeConfig(pg.login[iter_261_1].date)

			assert(not var_261_3)

			if pg.TimeMgr.GetInstance():inTime(var_261_2, var_261_0) then
				var_261_1 = iter_261_1

				break
			end
		end
	end

	local var_261_4 = pg.login[var_261_1].login_static

	var_261_4 = var_261_4 ~= "" and var_261_4 or "login"

	local var_261_5 = pg.login[var_261_1].login_cri
	local var_261_6 = var_261_5 ~= "" and true or false
	local var_261_7 = pg.login[var_261_1].op_play == 1 and true or false
	local var_261_8 = pg.login[var_261_1].op_time

	if var_261_8 == "" or not pg.TimeMgr.GetInstance():inTime(var_261_8, var_261_0) then
		var_261_7 = false
	end

	local var_261_9 = var_261_8 == "" and var_261_8 or table.concat(var_261_8[1][1])

	return var_261_6, var_261_6 and var_261_5 or var_261_4, pg.login[var_261_1].bgm, var_261_7, var_261_9
end

function setIntimacyIcon(arg_262_0, arg_262_1, arg_262_2)
	local var_262_0 = {}
	local var_262_1

	seriesAsync({
		function(arg_263_0)
			if arg_262_0.childCount > 0 then
				var_262_1 = arg_262_0:GetChild(0)

				arg_263_0()
			else
				LoadAndInstantiateAsync("template", "intimacytpl", function(arg_264_0)
					var_262_1 = tf(arg_264_0)

					setParent(var_262_1, arg_262_0)
					arg_263_0()
				end)
			end
		end,
		function(arg_265_0)
			setImageAlpha(var_262_1, arg_262_2 and 0 or 1)
			eachChild(var_262_1, function(arg_266_0)
				setActive(arg_266_0, false)
			end)

			if arg_262_2 then
				local var_265_0 = var_262_1:Find(arg_262_2 .. "(Clone)")

				if not var_265_0 then
					LoadAndInstantiateAsync("ui", arg_262_2, function(arg_267_0)
						setParent(arg_267_0, var_262_1)
						setActive(arg_267_0, true)
					end)
				else
					setActive(var_265_0, true)
				end
			elseif arg_262_1 then
				setImageSprite(var_262_1, GetSpriteFromAtlas("energy", arg_262_1), true)
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

function switch(arg_270_0, arg_270_1, arg_270_2, ...)
	if arg_270_1[arg_270_0] then
		return arg_270_1[arg_270_0](...)
	elseif arg_270_2 then
		return arg_270_2(...)
	end
end

function parseTimeConfig(arg_271_0)
	if type(arg_271_0[1]) == "table" then
		return arg_271_0[2], arg_271_0[1]
	else
		return arg_271_0
	end
end

local var_0_23 = {
	__add = function(arg_272_0, arg_272_1)
		return NewPos(arg_272_0.x + arg_272_1.x, arg_272_0.y + arg_272_1.y)
	end,
	__sub = function(arg_273_0, arg_273_1)
		return NewPos(arg_273_0.x - arg_273_1.x, arg_273_0.y - arg_273_1.y)
	end,
	__mul = function(arg_274_0, arg_274_1)
		if type(arg_274_1) == "number" then
			return NewPos(arg_274_0.x * arg_274_1, arg_274_0.y * arg_274_1)
		else
			return NewPos(arg_274_0.x * arg_274_1.x, arg_274_0.y * arg_274_1.y)
		end
	end,
	__eq = function(arg_275_0, arg_275_1)
		return arg_275_0.x == arg_275_1.x and arg_275_0.y == arg_275_1.y
	end,
	__tostring = function(arg_276_0)
		return arg_276_0.x .. "_" .. arg_276_0.y
	end
}

function NewPos(arg_277_0, arg_277_1)
	assert(arg_277_0 and arg_277_1)

	local var_277_0 = setmetatable({
		x = arg_277_0,
		y = arg_277_1
	}, var_0_23)

	function var_277_0.SqrMagnitude(arg_278_0)
		return arg_278_0.x * arg_278_0.x + arg_278_0.y * arg_278_0.y
	end

	function var_277_0.Normalize(arg_279_0)
		local var_279_0 = arg_279_0:SqrMagnitude()

		if var_279_0 > 1e-05 then
			return arg_279_0 * (1 / math.sqrt(var_279_0))
		else
			return NewPos(0, 0)
		end
	end

	return var_277_0
end

local var_0_24

function Timekeeping()
	warning(Time.realtimeSinceStartup - (var_0_24 or Time.realtimeSinceStartup), Time.realtimeSinceStartup)

	var_0_24 = Time.realtimeSinceStartup
end

function GetRomanDigit(arg_281_0)
	return (string.char(226, 133, 160 + (arg_281_0 - 1)))
end

function quickPlayAnimator(arg_282_0, arg_282_1)
	arg_282_0:GetComponent(typeof(Animator)):Play(arg_282_1, -1, 0)
end

function quickPlayAnimation(arg_283_0, arg_283_1)
	arg_283_0:GetComponent(typeof(Animation)):Play(arg_283_1)
end

function getSurveyUrl(arg_284_0)
	local var_284_0 = pg.survey_data_template[arg_284_0]
	local var_284_1

	if not IsUnityEditor then
		if PLATFORM_CODE == PLATFORM_CH then
			local var_284_2 = getProxy(UserProxy):GetCacheGatewayInServerLogined()

			if var_284_2 == PLATFORM_ANDROID then
				if LuaHelper.GetCHPackageType() == PACKAGE_TYPE_BILI then
					var_284_1 = var_284_0.main_url
				else
					var_284_1 = var_284_0.uo_url
				end
			elseif var_284_2 == PLATFORM_IPHONEPLAYER then
				var_284_1 = var_284_0.ios_url
			end
		elseif PLATFORM_CODE == PLATFORM_US or PLATFORM_CODE == PLATFORM_JP then
			var_284_1 = var_284_0.main_url
		end
	else
		var_284_1 = var_284_0.main_url
	end

	local var_284_3 = getProxy(PlayerProxy):getRawData().id
	local var_284_4 = getProxy(UserProxy):getRawData().arg2 or ""
	local var_284_5
	local var_284_6 = PLATFORM == PLATFORM_ANDROID and 1 or PLATFORM == PLATFORM_IPHONEPLAYER and 2 or 3
	local var_284_7 = getProxy(UserProxy):getRawData()
	local var_284_8 = getProxy(ServerProxy):getRawData()[var_284_7 and var_284_7.server or 0]
	local var_284_9 = var_284_8 and var_284_8.id or ""
	local var_284_10 = getProxy(PlayerProxy):getRawData().level
	local var_284_11 = var_284_3 .. "_" .. arg_284_0
	local var_284_12 = var_284_1
	local var_284_13 = {
		var_284_3,
		var_284_4,
		var_284_6,
		var_284_9,
		var_284_10,
		var_284_11
	}

	if var_284_12 then
		for iter_284_0, iter_284_1 in ipairs(var_284_13) do
			var_284_12 = string.gsub(var_284_12, "$" .. iter_284_0, tostring(iter_284_1))
		end
	end

	warning(var_284_12)

	return var_284_12
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

function FilterVarchar(arg_286_0)
	assert(type(arg_286_0) == "string" or type(arg_286_0) == "table")

	if arg_286_0 == "" then
		return nil
	end

	return arg_286_0
end

function getGameset(arg_287_0)
	local var_287_0 = pg.gameset[arg_287_0]

	assert(var_287_0)

	return {
		var_287_0.key_value,
		var_287_0.description
	}
end

function getDorm3dGameset(arg_288_0)
	local var_288_0 = pg.dorm3d_set[arg_288_0]

	assert(var_288_0)

	return {
		var_288_0.key_value_int,
		var_288_0.key_value_varchar
	}
end

function GetItemsOverflowDic(arg_289_0)
	arg_289_0 = arg_289_0 or {}

	local var_289_0 = {
		[DROP_TYPE_ITEM] = {},
		[DROP_TYPE_RESOURCE] = {},
		[DROP_TYPE_EQUIP] = 0,
		[DROP_TYPE_SHIP] = 0,
		[DROP_TYPE_WORLD_ITEM] = 0
	}

	while #arg_289_0 > 0 do
		local var_289_1 = table.remove(arg_289_0)

		switch(var_289_1.type, {
			[DROP_TYPE_ITEM] = function()
				if var_289_1:getConfig("open_directly") == 1 then
					for iter_290_0, iter_290_1 in ipairs(var_289_1:getConfig("display_icon")) do
						local var_290_0 = Drop.Create(iter_290_1)

						var_290_0.count = var_290_0.count * var_289_1.count

						table.insert(arg_289_0, var_290_0)
					end
				elseif var_289_1:getSubClass():IsShipExpType() then
					var_289_0[var_289_1.type][var_289_1.id] = defaultValue(var_289_0[var_289_1.type][var_289_1.id], 0) + var_289_1.count
				end
			end,
			[DROP_TYPE_RESOURCE] = function()
				var_289_0[var_289_1.type][var_289_1.id] = defaultValue(var_289_0[var_289_1.type][var_289_1.id], 0) + var_289_1.count
			end,
			[DROP_TYPE_EQUIP] = function()
				var_289_0[var_289_1.type] = var_289_0[var_289_1.type] + var_289_1.count
			end,
			[DROP_TYPE_SHIP] = function()
				var_289_0[var_289_1.type] = var_289_0[var_289_1.type] + var_289_1.count
			end,
			[DROP_TYPE_WORLD_ITEM] = function()
				var_289_0[var_289_1.type] = var_289_0[var_289_1.type] + var_289_1.count
			end
		})
	end

	return var_289_0
end

function CheckOverflow(arg_295_0, arg_295_1)
	local var_295_0 = {}
	local var_295_1 = arg_295_0[DROP_TYPE_RESOURCE][PlayerConst.ResGold] or 0
	local var_295_2 = arg_295_0[DROP_TYPE_RESOURCE][PlayerConst.ResOil] or 0
	local var_295_3 = arg_295_0[DROP_TYPE_EQUIP]
	local var_295_4 = arg_295_0[DROP_TYPE_SHIP]
	local var_295_5 = getProxy(PlayerProxy):getRawData()
	local var_295_6 = false

	if arg_295_1 then
		local var_295_7 = var_295_5:OverStore(PlayerConst.ResStoreGold, var_295_1)
		local var_295_8 = var_295_5:OverStore(PlayerConst.ResStoreOil, var_295_2)

		if var_295_7 > 0 or var_295_8 > 0 then
			var_295_0.isStoreOverflow = {
				var_295_7,
				var_295_8
			}
		end
	else
		if var_295_1 > 0 and var_295_5:GoldMax(var_295_1) then
			return false, "gold"
		end

		if var_295_2 > 0 and var_295_5:OilMax(var_295_2) then
			return false, "oil"
		end
	end

	var_295_0.isExpBookOverflow = {}

	for iter_295_0, iter_295_1 in pairs(arg_295_0[DROP_TYPE_ITEM]) do
		local var_295_9 = Item.getConfigData(iter_295_0)

		if getProxy(BagProxy):getItemCountById(iter_295_0) + iter_295_1 > var_295_9.max_num then
			table.insert(var_295_0.isExpBookOverflow, iter_295_0)
		end
	end

	local var_295_10 = getProxy(EquipmentProxy):getCapacity()

	if var_295_3 > 0 and var_295_3 + var_295_10 > var_295_5:getMaxEquipmentBag() then
		return false, "equip"
	end

	local var_295_11 = getProxy(BayProxy):getShipCount()

	if var_295_4 > 0 and var_295_4 + var_295_11 > var_295_5:getMaxShipBag() then
		return false, "ship"
	end

	return true, var_295_0
end

function CheckShipExpOverflow(arg_296_0)
	local var_296_0 = getProxy(BagProxy)

	for iter_296_0, iter_296_1 in pairs(arg_296_0[DROP_TYPE_ITEM]) do
		if var_296_0:getItemCountById(iter_296_0) + iter_296_1 > Item.getConfigData(iter_296_0).max_num then
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

function RegisterDetailButton(arg_297_0, arg_297_1, arg_297_2)
	Drop.Change(arg_297_2)
	switch(arg_297_2.type, {
		[DROP_TYPE_ITEM] = function()
			if arg_297_2:getConfig("type") == Item.SKIN_ASSIGNED_TYPE then
				local var_298_0 = Item.getConfigData(arg_297_2.id).usage_arg
				local var_298_1 = var_298_0[3]

				if Item.InTimeLimitSkinAssigned(arg_297_2.id) then
					var_298_1 = table.mergeArray(var_298_0[2], var_298_1, true)
				end

				local var_298_2 = {}

				for iter_298_0, iter_298_1 in ipairs(var_298_0[2]) do
					var_298_2[iter_298_1] = true
				end

				onButton(arg_297_0, arg_297_1, function()
					arg_297_0:closeView()
					pg.m02:sendNotification(GAME.LOAD_LAYERS, {
						parentContext = getProxy(ContextProxy):getCurrentContext(),
						context = Context.New({
							viewComponent = SelectSkinLayer,
							mediator = SkinAtlasMediator,
							data = {
								mode = SelectSkinLayer.MODE_VIEW,
								itemId = arg_297_2.id,
								selectableSkinList = underscore.map(var_298_1, function(arg_300_0)
									return SelectableSkin.New({
										id = arg_300_0,
										isTimeLimit = var_298_2[arg_300_0] or false
									})
								end)
							}
						})
					})
				end, SFX_PANEL)
				setActive(arg_297_1, true)
			else
				local var_298_3 = getProxy(TechnologyProxy):getItemCanUnlockBluePrint(arg_297_2.id) and "tech" or arg_297_2:getConfig("type")

				if var_0_25[var_298_3] then
					local var_298_4 = {
						item2Row = true,
						content = i18n(var_0_25[var_298_3]),
						itemList = underscore.map(arg_297_2:getConfig("display_icon"), function(arg_301_0)
							return Drop.Create(arg_301_0)
						end)
					}

					if var_298_3 == 11 then
						onButton(arg_297_0, arg_297_1, function()
							arg_297_0:emit(BaseUI.ON_DROP_LIST_OWN, var_298_4)
						end, SFX_PANEL)
					else
						onButton(arg_297_0, arg_297_1, function()
							arg_297_0:emit(BaseUI.ON_DROP_LIST, var_298_4)
						end, SFX_PANEL)
					end
				end

				setActive(arg_297_1, tobool(var_0_25[var_298_3]))
			end
		end,
		[DROP_TYPE_EQUIP] = function()
			onButton(arg_297_0, arg_297_1, function()
				arg_297_0:emit(BaseUI.ON_DROP, arg_297_2)
			end, SFX_PANEL)
			setActive(arg_297_1, true)
		end,
		[DROP_TYPE_SPWEAPON] = function()
			onButton(arg_297_0, arg_297_1, function()
				arg_297_0:emit(BaseUI.ON_DROP, arg_297_2)
			end, SFX_PANEL)
			setActive(arg_297_1, true)
		end
	}, function()
		setActive(arg_297_1, false)
	end)
end

function UpdateOwnDisplay(arg_309_0, arg_309_1)
	local var_309_0, var_309_1 = arg_309_1:getOwnedCount()

	setActive(arg_309_0, var_309_1 and var_309_0 > 0)

	if var_309_1 and var_309_0 > 0 then
		setText(arg_309_0:Find("label"), i18n("word_own1"))
		setText(arg_309_0:Find("Text"), var_309_0)
	end
end

function Damp(arg_310_0, arg_310_1, arg_310_2)
	arg_310_1 = Mathf.Max(1, arg_310_1)

	local var_310_0 = Mathf.Epsilon

	if arg_310_1 < var_310_0 or var_310_0 > Mathf.Abs(arg_310_0) then
		return arg_310_0
	end

	if arg_310_2 < var_310_0 then
		return 0
	end

	local var_310_1 = -4.605170186

	return arg_310_0 * (1 - Mathf.Exp(var_310_1 * arg_310_2 / arg_310_1))
end

function checkCullResume(arg_311_0)
	if not ReflectionHelp.RefCallMethodEx(typeof("UnityEngine.CanvasRenderer"), "GetMaterial", GetComponent(arg_311_0, "CanvasRenderer"), {
		typeof("System.Int32")
	}, {
		0
	}) then
		local var_311_0 = arg_311_0:GetComponentsInChildren(typeof(MeshImage))

		for iter_311_0 = 1, var_311_0.Length do
			var_311_0[iter_311_0 - 1]:SetVerticesDirty()
		end

		return false
	end

	return true
end

function parseEquipCode(arg_312_0)
	local var_312_0 = {}

	if arg_312_0 and arg_312_0 ~= "" then
		local var_312_1 = base64.dec(arg_312_0)

		var_312_0 = string.split(var_312_1, "/")
		var_312_0[5], var_312_0[6] = unpack(string.split(var_312_0[5], "\\"))

		if #var_312_0 < 6 or arg_312_0 ~= base64.enc(table.concat({
			table.concat(underscore.first(var_312_0, 5), "/"),
			var_312_0[6]
		}, "\\")) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("equipcode_illegal"))

			var_312_0 = {}
		end
	end

	for iter_312_0 = 1, 6 do
		var_312_0[iter_312_0] = var_312_0[iter_312_0] and tonumber(var_312_0[iter_312_0], 32) or 0
	end

	return var_312_0
end

function buildEquipCode(arg_313_0)
	local var_313_0 = underscore.map(arg_313_0:getAllEquipments(), function(arg_314_0)
		return ConversionBase(32, arg_314_0 and arg_314_0.id or 0)
	end)
	local var_313_1 = {
		table.concat(var_313_0, "/"),
		ConversionBase(32, checkExist(arg_313_0:GetSpWeapon(), {
			"id"
		}) or 0)
	}

	return base64.enc(table.concat(var_313_1, "\\"))
end

function setDirectorSpeed(arg_315_0, arg_315_1)
	GetComponent(arg_315_0, "TimelineSpeed"):SetTimelineSpeed(arg_315_1)
end

function setDefaultZeroMetatable(arg_316_0)
	return setmetatable(arg_316_0, {
		__index = function(arg_317_0, arg_317_1)
			if rawget(arg_317_0, arg_317_1) == nil then
				arg_317_0[arg_317_1] = 0
			end

			return arg_317_0[arg_317_1]
		end
	})
end

function checkABExist(arg_318_0)
	if EDITOR_TOOL then
		return PathMgr.FileExists(PathMgr.getAssetBundle(arg_318_0)) or ResourceMgr.Inst:AssetExist(arg_318_0)
	else
		return PathMgr.FileExists(PathMgr.getAssetBundle(arg_318_0))
	end
end
