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

function updateCover(arg_116_0, arg_116_1, arg_116_2)
	local var_116_0 = arg_116_1:getDropRarity()

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_116_0, findTF(arg_116_0, "icon_bg"))
	setFrame(findTF(arg_116_0, "icon_bg/frame"), var_116_0)

	local var_116_1 = findTF(arg_116_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync(arg_116_1:getIcon(), "", var_116_1)
	setIconName(arg_116_0, arg_116_1:getName(), arg_116_2)
end

function updateEmoji(arg_117_0, arg_117_1, arg_117_2)
	local var_117_0 = findTF(arg_117_0, "icon_bg/icon")
	local var_117_1 = "icon_emoji"

	GetImageSpriteFromAtlasAsync("Props/" .. var_117_1, "", var_117_0)

	local var_117_2 = 4

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_117_2, findTF(arg_117_0, "icon_bg"))
	setFrame(findTF(arg_117_0, "icon_bg/frame"), var_117_2)
	setIconName(arg_117_0, arg_117_1.name, arg_117_2)
end

function updateEquipmentSkin(arg_118_0, arg_118_1, arg_118_2)
	arg_118_2 = arg_118_2 or {}

	local var_118_0 = EquipmentRarity.Rarity2Print(arg_118_1.rarity)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_118_0, findTF(arg_118_0, "icon_bg"))
	setFrame(findTF(arg_118_0, "icon_bg/frame"), var_118_0, "frame_skin")

	local var_118_1 = findTF(arg_118_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("equips/" .. arg_118_1.icon, "", var_118_1)
	setIconStars(arg_118_0, false)
	setIconName(arg_118_0, arg_118_1.name, arg_118_2)
	setIconCount(arg_118_0, arg_118_1.count)
	setIconColorful(arg_118_0, arg_118_1.rarity - 1, arg_118_2)
end

function NoPosMsgBox(arg_119_0, arg_119_1, arg_119_2, arg_119_3)
	local var_119_0
	local var_119_1 = {}

	if arg_119_1 then
		table.insert(var_119_1, {
			text = "text_noPos_clear",
			atuoClose = true,
			onCallback = arg_119_1
		})
	end

	if arg_119_2 then
		table.insert(var_119_1, {
			text = "text_noPos_buy",
			atuoClose = true,
			onCallback = arg_119_2
		})
	end

	if arg_119_3 then
		table.insert(var_119_1, {
			text = "text_noPos_intensify",
			atuoClose = true,
			onCallback = arg_119_3
		})
	end

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		hideYes = true,
		hideNo = true,
		content = arg_119_0,
		custom = var_119_1,
		weight = LayerWeightConst.TOP_LAYER
	})
end

function openDestroyEquip()
	if pg.m02:hasMediator(EquipmentMediator.__cname) then
		local var_120_0 = getProxy(ContextProxy):getCurrentContext():getContextByMediator(EquipmentMediator)

		if var_120_0 and var_120_0.data.shipId then
			pg.m02:sendNotification(GAME.REMOVE_LAYERS, {
				context = var_120_0
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
		local var_121_0 = getProxy(ContextProxy):getCurrentContext():getContextByMediator(EquipmentMediator)

		if var_121_0 and var_121_0.data.shipId then
			pg.m02:sendNotification(GAME.REMOVE_LAYERS, {
				context = var_121_0
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
		onClick = function(arg_124_0, arg_124_1)
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.SHIPINFO, {
				page = 3,
				shipId = arg_124_0.id,
				shipVOs = arg_124_1
			})
		end
	})
end

function GoShoppingMsgBox(arg_125_0, arg_125_1, arg_125_2)
	if arg_125_2 then
		local var_125_0 = ""

		for iter_125_0, iter_125_1 in ipairs(arg_125_2) do
			local var_125_1 = Item.getConfigData(iter_125_1[1])

			var_125_0 = var_125_0 .. i18n(iter_125_1[1] == 59001 and "text_noRes_info_tip" or "text_noRes_info_tip2", var_125_1.name, iter_125_1[2])

			if iter_125_0 < #arg_125_2 then
				var_125_0 = var_125_0 .. i18n("text_noRes_info_tip_link")
			end
		end

		if var_125_0 ~= "" then
			arg_125_0 = arg_125_0 .. "\n" .. i18n("text_noRes_tip", var_125_0)
		end
	end

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		content = arg_125_0,
		weight = LayerWeightConst.SECOND_LAYER,
		onYes = function()
			gotoChargeScene(arg_125_1, arg_125_2)
		end
	})
end

function shoppingBatch(arg_127_0, arg_127_1, arg_127_2, arg_127_3, arg_127_4)
	local var_127_0 = pg.shop_template[arg_127_0]

	assert(var_127_0, "shop_template中找不到商品id：" .. arg_127_0)

	local var_127_1 = getProxy(PlayerProxy):getData()[id2res(var_127_0.resource_type)]
	local var_127_2 = arg_127_1.price or var_127_0.resource_num
	local var_127_3 = math.floor(var_127_1 / var_127_2)

	var_127_3 = var_127_3 <= 0 and 1 or var_127_3
	var_127_3 = arg_127_2 ~= nil and arg_127_2 < var_127_3 and arg_127_2 or var_127_3

	local var_127_4 = true
	local var_127_5 = 1

	if var_127_0 ~= nil and arg_127_1.id then
		print(var_127_3 * var_127_0.num, "--", var_127_3)
		assert(Item.getConfigData(arg_127_1.id), "item config should be existence")

		local var_127_6 = Item.New({
			id = arg_127_1.id
		}):getConfig("name")

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			needCounter = true,
			type = MSGBOX_TYPE_SINGLE_ITEM,
			drop = {
				type = DROP_TYPE_ITEM,
				id = arg_127_1.id
			},
			addNum = var_127_0.num,
			maxNum = var_127_3 * var_127_0.num,
			defaultNum = var_127_0.num,
			numUpdate = function(arg_128_0, arg_128_1)
				var_127_5 = math.floor(arg_128_1 / var_127_0.num)

				local var_128_0 = var_127_5 * var_127_2

				if var_128_0 > var_127_1 then
					setText(arg_128_0, i18n(arg_127_3, var_128_0, arg_128_1, COLOR_RED, var_127_6))

					var_127_4 = false
				else
					setText(arg_128_0, i18n(arg_127_3, var_128_0, arg_128_1, COLOR_GREEN, var_127_6))

					var_127_4 = true
				end
			end,
			onYes = function()
				if var_127_4 then
					pg.m02:sendNotification(GAME.SHOPPING, {
						id = arg_127_0,
						count = var_127_5
					})
				elseif arg_127_4 then
					pg.TipsMgr.GetInstance():ShowTips(i18n(arg_127_4))
				else
					pg.TipsMgr.GetInstance():ShowTips(i18n("main_playerInfoLayer_error_changeNameNoGem"))
				end
			end
		})
	end
end

function gotoChargeScene(arg_130_0, arg_130_1)
	local var_130_0 = getProxy(ContextProxy)
	local var_130_1 = getProxy(ContextProxy):getCurrentContext()

	if instanceof(var_130_1.mediator, ChargeMediator) then
		var_130_1.mediator:getViewComponent():switchSubViewByTogger(arg_130_0)
	else
		pg.m02:sendNotification(GAME.GO_SCENE, SCENE.CHARGE, {
			wrap = arg_130_0 or ChargeScene.TYPE_ITEM,
			noRes = arg_130_1
		})
	end
end

function clearDrop(arg_131_0)
	local var_131_0 = findTF(arg_131_0, "icon_bg")
	local var_131_1 = findTF(arg_131_0, "icon_bg/frame")
	local var_131_2 = findTF(arg_131_0, "icon_bg/icon")
	local var_131_3 = findTF(arg_131_0, "icon_bg/icon/icon")

	clearImageSprite(var_131_0)
	clearImageSprite(var_131_1)
	clearImageSprite(var_131_2)

	if var_131_3 then
		clearImageSprite(var_131_3)
	end
end

local var_0_7 = {
	red = Color.New(1, 0.25, 0.25),
	blue = Color.New(0.11, 0.55, 0.64),
	yellow = Color.New(0.92, 0.52, 0)
}

function updateSkill(arg_132_0, arg_132_1, arg_132_2, arg_132_3)
	local var_132_0 = findTF(arg_132_0, "skill")
	local var_132_1 = findTF(arg_132_0, "lock")
	local var_132_2 = findTF(arg_132_0, "unknown")

	if arg_132_1 then
		setActive(var_132_0, true)
		setActive(var_132_2, false)
		setActive(var_132_1, not arg_132_2)
		LoadImageSpriteAsync("skillicon/" .. arg_132_1.icon, findTF(var_132_0, "icon"))

		local var_132_3 = arg_132_1.color or "blue"

		setText(findTF(var_132_0, "name"), shortenString(getSkillName(arg_132_1.id), arg_132_3 or 8))

		local var_132_4 = findTF(var_132_0, "level")

		setText(var_132_4, "LEVEL: " .. (arg_132_2 and arg_132_2.level or "??"))
		setTextColor(var_132_4, var_0_7[var_132_3])
	else
		setActive(var_132_0, false)
		setActive(var_132_2, true)
		setActive(var_132_1, false)
	end
end

local var_0_8 = true

function onBackButton(arg_133_0, arg_133_1, arg_133_2, arg_133_3)
	local var_133_0 = GetOrAddComponent(arg_133_1, "UILongPressTrigger")

	assert(arg_133_2, "callback should exist")

	var_133_0.longPressThreshold = defaultValue(arg_133_3, 1)

	local function var_133_1(arg_134_0)
		return function()
			if var_0_8 then
				pg.CriMgr.GetInstance():PlaySoundEffect_V3(SOUND_BACK)
			end

			local var_135_0, var_135_1 = arg_133_2()

			if var_135_0 then
				arg_134_0(var_135_1)
			end
		end
	end

	local var_133_2 = var_133_0.onReleased

	pg.DelegateInfo.Add(arg_133_0, var_133_2)
	var_133_2:RemoveAllListeners()
	var_133_2:AddListener(var_133_1(function(arg_136_0)
		arg_136_0:emit(BaseUI.ON_BACK)
	end))

	local var_133_3 = var_133_0.onLongPressed

	pg.DelegateInfo.Add(arg_133_0, var_133_3)
	var_133_3:RemoveAllListeners()
	var_133_3:AddListener(var_133_1(function(arg_137_0)
		arg_137_0:emit(BaseUI.ON_HOME)
	end))
end

function GetZeroTime()
	return pg.TimeMgr.GetInstance():GetNextTime(0, 0, 0)
end

function GetHalfHour()
	return pg.TimeMgr.GetInstance():GetNextTime(0, 0, 0, 1800)
end

function GetNextHour(arg_140_0)
	local var_140_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_140_1, var_140_2 = pg.TimeMgr.GetInstance():parseTimeFrom(var_140_0)

	return var_140_1 * 86400 + (var_140_2 + arg_140_0) * 3600
end

function GetPerceptualSize(arg_141_0)
	local function var_141_0(arg_142_0)
		if not arg_142_0 then
			return 0, 1
		elseif arg_142_0 > 240 then
			return 4, 1
		elseif arg_142_0 > 225 then
			return 3, 1
		elseif arg_142_0 > 192 then
			return 2, 1
		elseif arg_142_0 < 126 then
			return 1, 0.5
		else
			return 1, 1
		end
	end

	if type(arg_141_0) == "number" then
		return var_141_0(arg_141_0)
	end

	local var_141_1 = 1
	local var_141_2 = 0
	local var_141_3 = 0
	local var_141_4 = #arg_141_0

	while var_141_1 <= var_141_4 do
		local var_141_5 = string.byte(arg_141_0, var_141_1)
		local var_141_6, var_141_7 = var_141_0(var_141_5)

		var_141_1 = var_141_1 + var_141_6
		var_141_2 = var_141_2 + var_141_7
	end

	return var_141_2
end

function shortenString(arg_143_0, arg_143_1)
	local var_143_0 = 1
	local var_143_1 = 0
	local var_143_2 = 0
	local var_143_3 = #arg_143_0

	while var_143_0 <= var_143_3 do
		local var_143_4 = string.byte(arg_143_0, var_143_0)
		local var_143_5, var_143_6 = GetPerceptualSize(var_143_4)

		var_143_0 = var_143_0 + var_143_5
		var_143_1 = var_143_1 + var_143_6

		if arg_143_1 <= math.ceil(var_143_1) then
			var_143_2 = var_143_0

			break
		end
	end

	if var_143_2 == 0 or var_143_3 < var_143_2 then
		return arg_143_0
	end

	return string.sub(arg_143_0, 1, var_143_2 - 1) .. ".."
end

function shouldShortenString(arg_144_0, arg_144_1)
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
		return false
	end

	return true
end

function nameValidityCheck(arg_145_0, arg_145_1, arg_145_2, arg_145_3)
	local var_145_0 = true
	local var_145_1, var_145_2 = utf8_to_unicode(arg_145_0)
	local var_145_3 = filterEgyUnicode(filterSpecChars(arg_145_0))
	local var_145_4 = wordVer(arg_145_0)

	if not checkSpaceValid(arg_145_0) then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_145_3[1]))

		var_145_0 = false
	elseif var_145_4 > 0 or var_145_3 ~= arg_145_0 then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_145_3[4]))

		var_145_0 = false
	elseif var_145_2 < arg_145_1 then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_145_3[2]))

		var_145_0 = false
	elseif arg_145_2 < var_145_2 then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_145_3[3]))

		var_145_0 = false
	end

	return var_145_0
end

function checkSpaceValid(arg_146_0)
	if PLATFORM_CODE == PLATFORM_US then
		return true
	end

	local var_146_0 = string.gsub(arg_146_0, " ", "")

	return arg_146_0 == string.gsub(var_146_0, "　", "")
end

function filterSpecChars(arg_147_0)
	local var_147_0 = {}
	local var_147_1 = 0
	local var_147_2 = 0
	local var_147_3 = 0
	local var_147_4 = 1

	while var_147_4 <= #arg_147_0 do
		local var_147_5 = string.byte(arg_147_0, var_147_4)

		if not var_147_5 then
			break
		end

		if var_147_5 >= 48 and var_147_5 <= 57 or var_147_5 >= 65 and var_147_5 <= 90 or var_147_5 == 95 or var_147_5 >= 97 and var_147_5 <= 122 then
			table.insert(var_147_0, string.char(var_147_5))
		elseif var_147_5 >= 228 and var_147_5 <= 233 then
			local var_147_6 = string.byte(arg_147_0, var_147_4 + 1)
			local var_147_7 = string.byte(arg_147_0, var_147_4 + 2)

			if var_147_6 and var_147_7 and var_147_6 >= 128 and var_147_6 <= 191 and var_147_7 >= 128 and var_147_7 <= 191 then
				var_147_4 = var_147_4 + 2

				table.insert(var_147_0, string.char(var_147_5, var_147_6, var_147_7))

				var_147_1 = var_147_1 + 1
			end
		elseif var_147_5 == 45 or var_147_5 == 40 or var_147_5 == 41 then
			table.insert(var_147_0, string.char(var_147_5))
		elseif var_147_5 == 194 then
			local var_147_8 = string.byte(arg_147_0, var_147_4 + 1)

			if var_147_8 == 183 then
				var_147_4 = var_147_4 + 1

				table.insert(var_147_0, string.char(var_147_5, var_147_8))

				var_147_1 = var_147_1 + 1
			end
		elseif var_147_5 == 239 then
			local var_147_9 = string.byte(arg_147_0, var_147_4 + 1)
			local var_147_10 = string.byte(arg_147_0, var_147_4 + 2)

			if var_147_9 == 188 and (var_147_10 == 136 or var_147_10 == 137) then
				var_147_4 = var_147_4 + 2

				table.insert(var_147_0, string.char(var_147_5, var_147_9, var_147_10))

				var_147_1 = var_147_1 + 1
			end
		elseif var_147_5 == 206 or var_147_5 == 207 then
			local var_147_11 = string.byte(arg_147_0, var_147_4 + 1)

			if var_147_5 == 206 and var_147_11 >= 177 or var_147_5 == 207 and var_147_11 <= 134 then
				var_147_4 = var_147_4 + 1

				table.insert(var_147_0, string.char(var_147_5, var_147_11))

				var_147_1 = var_147_1 + 1
			end
		elseif var_147_5 == 227 and PLATFORM_CODE == PLATFORM_JP then
			local var_147_12 = string.byte(arg_147_0, var_147_4 + 1)
			local var_147_13 = string.byte(arg_147_0, var_147_4 + 2)

			if var_147_12 and var_147_13 and var_147_12 > 128 and var_147_12 <= 191 and var_147_13 >= 128 and var_147_13 <= 191 then
				var_147_4 = var_147_4 + 2

				table.insert(var_147_0, string.char(var_147_5, var_147_12, var_147_13))

				var_147_2 = var_147_2 + 1
			end
		elseif var_147_5 >= 224 and PLATFORM_CODE == PLATFORM_KR then
			local var_147_14 = string.byte(arg_147_0, var_147_4 + 1)
			local var_147_15 = string.byte(arg_147_0, var_147_4 + 2)

			if var_147_14 and var_147_15 and var_147_14 >= 128 and var_147_14 <= 191 and var_147_15 >= 128 and var_147_15 <= 191 then
				var_147_4 = var_147_4 + 2

				table.insert(var_147_0, string.char(var_147_5, var_147_14, var_147_15))

				var_147_3 = var_147_3 + 1
			end
		elseif PLATFORM_CODE == PLATFORM_US then
			if var_147_4 ~= 1 and var_147_5 == 32 and string.byte(arg_147_0, var_147_4 + 1) ~= 32 then
				table.insert(var_147_0, string.char(var_147_5))
			end

			if var_147_5 >= 192 and var_147_5 <= 223 then
				local var_147_16 = string.byte(arg_147_0, var_147_4 + 1)

				var_147_4 = var_147_4 + 1

				if var_147_5 == 194 and var_147_16 and var_147_16 >= 128 then
					table.insert(var_147_0, string.char(var_147_5, var_147_16))
				elseif var_147_5 == 195 and var_147_16 and var_147_16 <= 191 then
					table.insert(var_147_0, string.char(var_147_5, var_147_16))
				end
			end
		end

		var_147_4 = var_147_4 + 1
	end

	return table.concat(var_147_0), var_147_1 + var_147_2 + var_147_3
end

function filterEgyUnicode(arg_148_0)
	arg_148_0 = string.gsub(arg_148_0, "\xF0\x93[\x80-\x8F][\x80-\xBF]", "")
	arg_148_0 = string.gsub(arg_148_0, "\xF0\x93\x90[\x80-\xAF]", "")

	return arg_148_0
end

function shiftPanel(arg_149_0, arg_149_1, arg_149_2, arg_149_3, arg_149_4, arg_149_5, arg_149_6, arg_149_7, arg_149_8)
	arg_149_3 = arg_149_3 or 0.2

	if arg_149_5 then
		LeanTween.cancel(go(arg_149_0))
	end

	local var_149_0 = rtf(arg_149_0)

	arg_149_1 = arg_149_1 or var_149_0.anchoredPosition.x
	arg_149_2 = arg_149_2 or var_149_0.anchoredPosition.y

	local var_149_1 = LeanTween.move(var_149_0, Vector3(arg_149_1, arg_149_2, 0), arg_149_3)

	arg_149_7 = arg_149_7 or LeanTweenType.easeInOutSine

	var_149_1:setEase(arg_149_7)

	if arg_149_4 then
		var_149_1:setDelay(arg_149_4)
	end

	if arg_149_6 then
		GetOrAddComponent(arg_149_0, "CanvasGroup").blocksRaycasts = false
	end

	var_149_1:setOnComplete(System.Action(function()
		if arg_149_8 then
			arg_149_8()
		end

		if arg_149_6 then
			GetOrAddComponent(arg_149_0, "CanvasGroup").blocksRaycasts = true
		end
	end))

	return var_149_1
end

function TweenValue(arg_151_0, arg_151_1, arg_151_2, arg_151_3, arg_151_4, arg_151_5, arg_151_6, arg_151_7)
	local var_151_0 = LeanTween.value(go(arg_151_0), arg_151_1, arg_151_2, arg_151_3):setOnUpdate(System.Action_float(function(arg_152_0)
		if arg_151_5 then
			arg_151_5(arg_152_0)
		end
	end)):setOnComplete(System.Action(function()
		if arg_151_6 then
			arg_151_6()
		end
	end)):setDelay(arg_151_4 or 0)

	if arg_151_7 and arg_151_7 > 0 then
		var_151_0:setRepeat(arg_151_7)
	end

	return var_151_0
end

function rotateAni(arg_154_0, arg_154_1, arg_154_2)
	return LeanTween.rotate(rtf(arg_154_0), 360 * arg_154_1, arg_154_2):setLoopClamp()
end

function blinkAni(arg_155_0, arg_155_1, arg_155_2, arg_155_3)
	return LeanTween.alpha(rtf(arg_155_0), arg_155_3 or 0, arg_155_1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong(arg_155_2 or 0)
end

function scaleAni(arg_156_0, arg_156_1, arg_156_2, arg_156_3)
	return LeanTween.scale(rtf(arg_156_0), arg_156_3 or 0, arg_156_1):setLoopPingPong(arg_156_2 or 0)
end

function floatAni(arg_157_0, arg_157_1, arg_157_2, arg_157_3)
	local var_157_0 = arg_157_0.localPosition.y + arg_157_1

	return LeanTween.moveY(rtf(arg_157_0), var_157_0, arg_157_2):setLoopPingPong(arg_157_3 or 0)
end

local var_0_9 = tostring

function tostring(arg_158_0)
	if arg_158_0 == nil then
		return "nil"
	end

	local var_158_0 = var_0_9(arg_158_0)

	if var_158_0 == nil then
		if type(arg_158_0) == "table" then
			return "{}"
		end

		return " ~nil"
	end

	return var_158_0
end

function wordVer(arg_159_0, arg_159_1)
	if arg_159_0.match(arg_159_0, ChatConst.EmojiCodeMatch) then
		return 0, arg_159_0
	end

	arg_159_1 = arg_159_1 or {}

	local var_159_0 = filterEgyUnicode(arg_159_0)

	if #var_159_0 ~= #arg_159_0 then
		if arg_159_1.isReplace then
			arg_159_0 = var_159_0
		else
			return 1
		end
	end

	local var_159_1 = wordSplit(arg_159_0)
	local var_159_2 = pg.word_template
	local var_159_3 = pg.word_legal_template

	arg_159_1.isReplace = arg_159_1.isReplace or false
	arg_159_1.replaceWord = arg_159_1.replaceWord or "*"

	local var_159_4 = #var_159_1
	local var_159_5 = 1
	local var_159_6 = ""
	local var_159_7 = 0

	while var_159_5 <= var_159_4 do
		local var_159_8, var_159_9, var_159_10 = wordLegalMatch(var_159_1, var_159_3, var_159_5)

		if var_159_8 then
			var_159_5 = var_159_9
			var_159_6 = var_159_6 .. var_159_10
		else
			local var_159_11, var_159_12, var_159_13 = wordVerMatch(var_159_1, var_159_2, arg_159_1, var_159_5, "", false, var_159_5, "")

			if var_159_11 then
				var_159_5 = var_159_12
				var_159_7 = var_159_7 + 1

				if arg_159_1.isReplace then
					var_159_6 = var_159_6 .. var_159_13
				end
			else
				if arg_159_1.isReplace then
					var_159_6 = var_159_6 .. var_159_1[var_159_5]
				end

				var_159_5 = var_159_5 + 1
			end
		end
	end

	if arg_159_1.isReplace then
		return var_159_7, var_159_6
	else
		return var_159_7
	end
end

function wordLegalMatch(arg_160_0, arg_160_1, arg_160_2, arg_160_3, arg_160_4)
	if arg_160_2 > #arg_160_0 then
		return arg_160_3, arg_160_2, arg_160_4
	end

	local var_160_0 = arg_160_0[arg_160_2]
	local var_160_1 = arg_160_1[var_160_0]

	arg_160_4 = arg_160_4 == nil and "" or arg_160_4

	if var_160_1 then
		if var_160_1.this then
			return wordLegalMatch(arg_160_0, var_160_1, arg_160_2 + 1, true, arg_160_4 .. var_160_0)
		else
			return wordLegalMatch(arg_160_0, var_160_1, arg_160_2 + 1, false, arg_160_4 .. var_160_0)
		end
	else
		return arg_160_3, arg_160_2, arg_160_4
	end
end

local var_0_10 = string.byte("a")
local var_0_11 = string.byte("z")
local var_0_12 = string.byte("A")
local var_0_13 = string.byte("Z")

local function var_0_14(arg_161_0)
	if not arg_161_0 then
		return arg_161_0
	end

	local var_161_0 = string.byte(arg_161_0)

	if var_161_0 > 128 then
		return
	end

	if var_161_0 >= var_0_10 and var_161_0 <= var_0_11 then
		return string.char(var_161_0 - 32)
	elseif var_161_0 >= var_0_12 and var_161_0 <= var_0_13 then
		return string.char(var_161_0 + 32)
	else
		return arg_161_0
	end
end

function wordVerMatch(arg_162_0, arg_162_1, arg_162_2, arg_162_3, arg_162_4, arg_162_5, arg_162_6, arg_162_7)
	if arg_162_3 > #arg_162_0 then
		return arg_162_5, arg_162_6, arg_162_7
	end

	local var_162_0 = arg_162_0[arg_162_3]
	local var_162_1 = arg_162_1[var_162_0]

	if var_162_1 then
		local var_162_2, var_162_3, var_162_4 = wordVerMatch(arg_162_0, var_162_1, arg_162_2, arg_162_3 + 1, arg_162_2.isReplace and arg_162_4 .. arg_162_2.replaceWord or arg_162_4, var_162_1.this or arg_162_5, var_162_1.this and arg_162_3 + 1 or arg_162_6, var_162_1.this and (arg_162_2.isReplace and arg_162_4 .. arg_162_2.replaceWord or arg_162_4) or arg_162_7)

		if var_162_2 then
			return var_162_2, var_162_3, var_162_4
		end
	end

	local var_162_5 = var_0_14(var_162_0)
	local var_162_6 = arg_162_1[var_162_5]

	if var_162_5 ~= var_162_0 and var_162_6 then
		local var_162_7, var_162_8, var_162_9 = wordVerMatch(arg_162_0, var_162_6, arg_162_2, arg_162_3 + 1, arg_162_2.isReplace and arg_162_4 .. arg_162_2.replaceWord or arg_162_4, var_162_6.this or arg_162_5, var_162_6.this and arg_162_3 + 1 or arg_162_6, var_162_6.this and (arg_162_2.isReplace and arg_162_4 .. arg_162_2.replaceWord or arg_162_4) or arg_162_7)

		if var_162_7 then
			return var_162_7, var_162_8, var_162_9
		end
	end

	return arg_162_5, arg_162_6, arg_162_7
end

function wordSplit(arg_163_0)
	local var_163_0 = {}

	for iter_163_0 in arg_163_0.gmatch(arg_163_0, "[\x01-\x7F\xC2-\xF4][\x80-\xBF]*") do
		var_163_0[#var_163_0 + 1] = iter_163_0
	end

	return var_163_0
end

function contentWrap(arg_164_0, arg_164_1, arg_164_2)
	local var_164_0 = LuaHelper.WrapContent(arg_164_0, arg_164_1, arg_164_2)

	return #var_164_0 ~= #arg_164_0, var_164_0
end

function cancelRich(arg_165_0)
	local var_165_0

	for iter_165_0 = 1, 20 do
		local var_165_1

		arg_165_0, var_165_1 = string.gsub(arg_165_0, "<([^>]*)>", "%1")

		if var_165_1 <= 0 then
			break
		end
	end

	return arg_165_0
end

function getSkillConfig(arg_166_0)
	local var_166_0 = require("GameCfg.buff.buff_" .. arg_166_0)

	if not var_166_0 then
		warning("找不到技能配置: " .. arg_166_0)

		return
	end

	local var_166_1 = Clone(var_166_0)

	var_166_1.name = getSkillName(arg_166_0)
	var_166_1.desc = HXSet.hxLan(var_166_1.desc)
	var_166_1.desc_get = HXSet.hxLan(var_166_1.desc_get)

	_.each(var_166_1, function(arg_167_0)
		arg_167_0.desc = HXSet.hxLan(arg_167_0.desc)
	end)

	return var_166_1
end

function getSkillName(arg_168_0)
	local var_168_0 = pg.skill_data_template[arg_168_0] or pg.skill_data_display[arg_168_0]

	if var_168_0 then
		return HXSet.hxLan(var_168_0.name)
	else
		return ""
	end
end

function getSkillDescGet(arg_169_0, arg_169_1)
	local var_169_0 = arg_169_1 and pg.skill_world_display[arg_169_0] and setmetatable({}, {
		__index = function(arg_170_0, arg_170_1)
			return pg.skill_world_display[arg_169_0][arg_170_1] or pg.skill_data_template[arg_169_0][arg_170_1]
		end
	}) or pg.skill_data_template[arg_169_0]

	if not var_169_0 then
		return ""
	end

	local var_169_1 = var_169_0.desc_get ~= "" and var_169_0.desc_get or var_169_0.desc

	for iter_169_0, iter_169_1 in pairs(var_169_0.desc_get_add) do
		local var_169_2 = setColorStr(iter_169_1[1], COLOR_GREEN)

		if iter_169_1[2] then
			var_169_2 = var_169_2 .. specialGSub(i18n("word_skill_desc_get"), "$1", setColorStr(iter_169_1[2], COLOR_GREEN))
		end

		var_169_1 = specialGSub(var_169_1, "$" .. iter_169_0, var_169_2)
	end

	return HXSet.hxLan(var_169_1)
end

function getSkillDescLearn(arg_171_0, arg_171_1, arg_171_2)
	local var_171_0 = arg_171_2 and pg.skill_world_display[arg_171_0] and setmetatable({}, {
		__index = function(arg_172_0, arg_172_1)
			return pg.skill_world_display[arg_171_0][arg_172_1] or pg.skill_data_template[arg_171_0][arg_172_1]
		end
	}) or pg.skill_data_template[arg_171_0]

	if not var_171_0 then
		return ""
	end

	local var_171_1 = var_171_0.desc

	if not var_171_0.desc_add then
		return HXSet.hxLan(var_171_1)
	end

	for iter_171_0, iter_171_1 in pairs(var_171_0.desc_add) do
		local var_171_2 = iter_171_1[arg_171_1][1]

		if iter_171_1[arg_171_1][2] then
			var_171_2 = var_171_2 .. specialGSub(i18n("word_skill_desc_learn"), "$1", iter_171_1[arg_171_1][2])
		end

		var_171_1 = specialGSub(var_171_1, "$" .. iter_171_0, setColorStr(var_171_2, COLOR_YELLOW))
	end

	return HXSet.hxLan(var_171_1)
end

function getSkillDesc(arg_173_0, arg_173_1, arg_173_2)
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
		local var_173_2 = setColorStr(iter_173_1[arg_173_1][1], COLOR_GREEN)

		var_173_1 = specialGSub(var_173_1, "$" .. iter_173_0, var_173_2)
	end

	return HXSet.hxLan(var_173_1)
end

function specialGSub(arg_175_0, arg_175_1, arg_175_2)
	arg_175_0 = string.gsub(arg_175_0, "<color=#", "<color=NNN")
	arg_175_0 = string.gsub(arg_175_0, "#", "")
	arg_175_2 = string.gsub(arg_175_2, "%%", "%%%%")
	arg_175_0 = string.gsub(arg_175_0, arg_175_1, arg_175_2)
	arg_175_0 = string.gsub(arg_175_0, "<color=NNN", "<color=#")

	return arg_175_0
end

function topAnimation(arg_176_0, arg_176_1, arg_176_2, arg_176_3, arg_176_4, arg_176_5)
	local var_176_0 = {}

	arg_176_4 = arg_176_4 or 0.27

	local var_176_1 = 0.05

	if arg_176_0 then
		local var_176_2 = arg_176_0.transform.localPosition.x

		setAnchoredPosition(arg_176_0, {
			x = var_176_2 - 500
		})
		shiftPanel(arg_176_0, var_176_2, nil, 0.05, arg_176_4, true, true)
		setActive(arg_176_0, true)
	end

	setActive(arg_176_1, false)
	setActive(arg_176_2, false)
	setActive(arg_176_3, false)

	for iter_176_0 = 1, 3 do
		table.insert(var_176_0, LeanTween.delayedCall(arg_176_4 + 0.13 + var_176_1 * iter_176_0, System.Action(function()
			if arg_176_1 then
				setActive(arg_176_1, not arg_176_1.gameObject.activeSelf)
			end
		end)).uniqueId)
		table.insert(var_176_0, LeanTween.delayedCall(arg_176_4 + 0.02 + var_176_1 * iter_176_0, System.Action(function()
			if arg_176_2 then
				setActive(arg_176_2, not go(arg_176_2).activeSelf)
			end

			if arg_176_2 then
				setActive(arg_176_3, not go(arg_176_3).activeSelf)
			end
		end)).uniqueId)
	end

	if arg_176_5 then
		table.insert(var_176_0, LeanTween.delayedCall(arg_176_4 + 0.13 + var_176_1 * 3 + 0.1, System.Action(function()
			arg_176_5()
		end)).uniqueId)
	end

	return var_176_0
end

function cancelTweens(arg_180_0)
	assert(arg_180_0, "must provide cancel targets, LeanTween.cancelAll is not allow")

	for iter_180_0, iter_180_1 in ipairs(arg_180_0) do
		if iter_180_1 then
			LeanTween.cancel(iter_180_1)
		end
	end
end

function getOfflineTimeStamp(arg_181_0)
	local var_181_0 = pg.TimeMgr.GetInstance():GetServerTime() - arg_181_0
	local var_181_1 = ""

	if var_181_0 <= 59 then
		var_181_1 = i18n("just_now")
	elseif var_181_0 <= 3599 then
		var_181_1 = i18n("several_minutes_before", math.floor(var_181_0 / 60))
	elseif var_181_0 <= 86399 then
		var_181_1 = i18n("several_hours_before", math.floor(var_181_0 / 3600))
	else
		var_181_1 = i18n("several_days_before", math.floor(var_181_0 / 86400))
	end

	return var_181_1
end

function playMovie(arg_182_0, arg_182_1, arg_182_2)
	local var_182_0 = GameObject.Find("OverlayCamera/Overlay/UITop/MoviePanel")

	if not IsNil(var_182_0) then
		pg.UIMgr.GetInstance():LoadingOn()
		WWWLoader.Inst:LoadStreamingAsset(arg_182_0, function(arg_183_0)
			pg.UIMgr.GetInstance():LoadingOff()

			local var_183_0 = GCHandle.Alloc(arg_183_0, GCHandleType.Pinned)

			setActive(var_182_0, true)

			local var_183_1 = var_182_0:AddComponent(typeof(CriManaMovieControllerForUI))

			var_183_1.player:SetData(arg_183_0, arg_183_0.Length)

			var_183_1.target = var_182_0:GetComponent(typeof(Image))
			var_183_1.loop = false
			var_183_1.additiveMode = false
			var_183_1.playOnStart = true

			local var_183_2

			var_183_2 = Timer.New(function()
				if var_183_1.player.status == CriMana.Player.Status.PlayEnd or var_183_1.player.status == CriMana.Player.Status.Stop or var_183_1.player.status == CriMana.Player.Status.Error then
					var_183_2:Stop()
					Object.Destroy(var_183_1)
					GCHandle.Free(var_183_0)
					setActive(var_182_0, false)

					if arg_182_1 then
						arg_182_1()
					end
				end
			end, 0.2, -1)

			var_183_2:Start()
			removeOnButton(var_182_0)

			if arg_182_2 then
				onButton(nil, var_182_0, function()
					var_183_1:Stop()
					GetOrAddComponent(var_182_0, typeof(Button)).onClick:RemoveAllListeners()
				end, SFX_CANCEL)
			end
		end)
	elseif arg_182_1 then
		arg_182_1()
	end
end

PaintCameraAdjustOn = false

function cameraPaintViewAdjust(arg_186_0)
	if PaintCameraAdjustOn ~= arg_186_0 then
		local var_186_0 = GameObject.Find("UICamera/Canvas"):GetComponent(typeof(CanvasScaler))

		if arg_186_0 then
			CameraMgr.instance.AutoAdapt = false

			CameraMgr.instance:Revert()

			var_186_0.screenMatchMode = CanvasScaler.ScreenMatchMode.MatchWidthOrHeight
			var_186_0.matchWidthOrHeight = 1
		else
			CameraMgr.instance.AutoAdapt = true
			CameraMgr.instance.CurrentWidth = 1
			CameraMgr.instance.CurrentHeight = 1
			CameraMgr.instance.AspectRatio = 1.7777777777777777
			var_186_0.screenMatchMode = CanvasScaler.ScreenMatchMode.Expand
		end

		PaintCameraAdjustOn = arg_186_0
	end
end

function ManhattonDist(arg_187_0, arg_187_1)
	return math.abs(arg_187_0.row - arg_187_1.row) + math.abs(arg_187_0.column - arg_187_1.column)
end

function checkFirstHelpShow(arg_188_0)
	local var_188_0 = getProxy(SettingsProxy)

	if not var_188_0:checkReadHelp(arg_188_0) then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip[arg_188_0].tip
		})
		var_188_0:recordReadHelp(arg_188_0)
	end
end

preOrientation = nil
preNotchFitterEnabled = false

function openPortrait(arg_189_0)
	enableNotch(arg_189_0, true)

	preOrientation = Input.deviceOrientation:ToString()

	originalPrint("Begining Orientation:" .. preOrientation)

	Screen.autorotateToPortrait = true
	Screen.autorotateToPortraitUpsideDown = true

	cameraPaintViewAdjust(true)
end

function closePortrait(arg_190_0)
	enableNotch(arg_190_0, false)

	Screen.autorotateToPortrait = false
	Screen.autorotateToPortraitUpsideDown = false

	originalPrint("Closing Orientation:" .. preOrientation)

	Screen.orientation = ScreenOrientation.LandscapeLeft

	local var_190_0 = Timer.New(function()
		Screen.orientation = ScreenOrientation.AutoRotation
	end, 0.2, 1):Start()

	cameraPaintViewAdjust(false)
end

function enableNotch(arg_192_0, arg_192_1)
	if arg_192_0 == nil then
		return
	end

	local var_192_0 = arg_192_0:GetComponent("NotchAdapt")
	local var_192_1 = arg_192_0:GetComponent("AspectRatioFitter")

	var_192_0.enabled = arg_192_1

	if var_192_1 then
		if arg_192_1 then
			var_192_1.enabled = preNotchFitterEnabled
		else
			preNotchFitterEnabled = var_192_1.enabled
			var_192_1.enabled = false
		end
	end
end

function comma_value(arg_193_0)
	local var_193_0 = arg_193_0
	local var_193_1 = 0

	repeat
		local var_193_2

		var_193_0, var_193_2 = string.gsub(var_193_0, "^(-?%d+)(%d%d%d)", "%1,%2")
	until var_193_2 == 0

	return var_193_0
end

local var_0_15 = 0.2

function SwitchPanel(arg_194_0, arg_194_1, arg_194_2, arg_194_3, arg_194_4, arg_194_5)
	arg_194_3 = defaultValue(arg_194_3, var_0_15)

	if arg_194_5 then
		LeanTween.cancel(go(arg_194_0))
	end

	local var_194_0 = Vector3.New(tf(arg_194_0).localPosition.x, tf(arg_194_0).localPosition.y, tf(arg_194_0).localPosition.z)

	if arg_194_1 then
		var_194_0.x = arg_194_1
	end

	if arg_194_2 then
		var_194_0.y = arg_194_2
	end

	local var_194_1 = LeanTween.move(rtf(arg_194_0), var_194_0, arg_194_3):setEase(LeanTweenType.easeInOutSine)

	if arg_194_4 then
		var_194_1:setDelay(arg_194_4)
	end

	return var_194_1
end

function updateActivityTaskStatus(arg_195_0)
	local var_195_0 = arg_195_0:getConfig("config_id")
	local var_195_1, var_195_2 = getActivityTask(arg_195_0, true)

	if not var_195_2 then
		pg.m02:sendNotification(GAME.ACTIVITY_OPERATION, {
			cmd = 1,
			activity_id = arg_195_0.id
		})

		return true
	end

	return false
end

function updateCrusingActivityTask(arg_196_0)
	local var_196_0 = getProxy(TaskProxy)
	local var_196_1 = arg_196_0:getNDay()

	for iter_196_0, iter_196_1 in ipairs(arg_196_0:getConfig("config_data")) do
		local var_196_2 = pg.battlepass_task_group[iter_196_1]

		if var_196_1 >= var_196_2.time and underscore.any(underscore.flatten(var_196_2.task_group), function(arg_197_0)
			return var_196_0:getTaskVO(arg_197_0) == nil
		end) then
			pg.m02:sendNotification(GAME.CRUSING_CMD, {
				cmd = 1,
				activity_id = arg_196_0.id
			})

			return true
		end
	end

	return false
end

function setShipCardFrame(arg_198_0, arg_198_1, arg_198_2)
	arg_198_0.localScale = Vector3.one
	arg_198_0.anchorMin = Vector2.zero
	arg_198_0.anchorMax = Vector2.one

	local var_198_0 = arg_198_2 or arg_198_1

	GetImageSpriteFromAtlasAsync("shipframe", var_198_0, arg_198_0)

	local var_198_1 = pg.frame_resource[var_198_0]

	if var_198_1 then
		local var_198_2 = var_198_1.param

		arg_198_0.offsetMin = Vector2(var_198_2[1], var_198_2[2])
		arg_198_0.offsetMax = Vector2(var_198_2[3], var_198_2[4])
	else
		arg_198_0.offsetMin = Vector2.zero
		arg_198_0.offsetMax = Vector2.zero
	end
end

function setRectShipCardFrame(arg_199_0, arg_199_1, arg_199_2)
	arg_199_0.localScale = Vector3.one
	arg_199_0.anchorMin = Vector2.zero
	arg_199_0.anchorMax = Vector2.one

	setImageSprite(arg_199_0, GetSpriteFromAtlas("shipframeb", "b" .. (arg_199_2 or arg_199_1)))

	local var_199_0 = "b" .. (arg_199_2 or arg_199_1)
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

function setFrameEffect(arg_200_0, arg_200_1)
	if arg_200_1 then
		local var_200_0 = arg_200_1 .. "(Clone)"
		local var_200_1 = false

		eachChild(arg_200_0, function(arg_201_0)
			setActive(arg_201_0, arg_201_0.name == var_200_0)

			var_200_1 = var_200_1 or arg_201_0.name == var_200_0
		end)

		if not var_200_1 then
			LoadAndInstantiateAsync("effect", arg_200_1, function(arg_202_0)
				if IsNil(arg_200_0) or findTF(arg_200_0, var_200_0) then
					Object.Destroy(arg_202_0)
				else
					setParent(arg_202_0, arg_200_0)
					setActive(arg_202_0, true)
				end
			end)
		end
	end

	setActive(arg_200_0, arg_200_1)
end

function setProposeMarkIcon(arg_203_0, arg_203_1)
	local var_203_0 = arg_203_0:Find("proposeShipCard(Clone)")
	local var_203_1 = arg_203_1.propose and not arg_203_1:ShowPropose()

	if var_203_0 then
		setActive(var_203_0, var_203_1)
	elseif var_203_1 then
		pg.PoolMgr.GetInstance():GetUI("proposeShipCard", true, function(arg_204_0)
			if IsNil(arg_203_0) or arg_203_0:Find("proposeShipCard(Clone)") then
				pg.PoolMgr.GetInstance():ReturnUI("proposeShipCard", arg_204_0)
			else
				setParent(arg_204_0, arg_203_0, false)
			end
		end)
	end
end

function flushShipCard(arg_205_0, arg_205_1)
	local var_205_0 = arg_205_1:rarity2bgPrint()
	local var_205_1 = findTF(arg_205_0, "content/bg")

	GetImageSpriteFromAtlasAsync("bg/star_level_card_" .. var_205_0, "", var_205_1)

	local var_205_2 = findTF(arg_205_0, "content/ship_icon")
	local var_205_3 = arg_205_1 and {
		"shipYardIcon/" .. arg_205_1:getPainting(),
		arg_205_1:getPainting()
	} or {
		"shipYardIcon/unknown",
		""
	}

	GetImageSpriteFromAtlasAsync(var_205_3[1], var_205_3[2], var_205_2)

	local var_205_4 = arg_205_1:getShipType()
	local var_205_5 = findTF(arg_205_0, "content/info/top/type")

	GetImageSpriteFromAtlasAsync("shiptype", shipType2print(var_205_4), var_205_5)
	setText(findTF(arg_205_0, "content/dockyard/lv/Text"), defaultValue(arg_205_1.level, 1))

	local var_205_6 = arg_205_1:getStar()
	local var_205_7 = arg_205_1:getMaxStar()
	local var_205_8 = findTF(arg_205_0, "content/front/stars")

	setActive(var_205_8, true)

	local var_205_9 = findTF(var_205_8, "star_tpl")
	local var_205_10 = var_205_8.childCount

	for iter_205_0 = 1, Ship.CONFIG_MAX_STAR do
		local var_205_11 = var_205_10 < iter_205_0 and cloneTplTo(var_205_9, var_205_8) or var_205_8:GetChild(iter_205_0 - 1)

		setActive(var_205_11, iter_205_0 <= var_205_7)
		triggerToggle(var_205_11, iter_205_0 <= var_205_6)
	end

	local var_205_12 = findTF(arg_205_0, "content/front/frame")
	local var_205_13, var_205_14 = arg_205_1:GetFrameAndEffect()

	setShipCardFrame(var_205_12, var_205_0, var_205_13)
	setFrameEffect(findTF(arg_205_0, "content/front/bg_other"), var_205_14)
	setProposeMarkIcon(arg_205_0:Find("content/dockyard/propose"), arg_205_1)
end

function TweenItemAlphaAndWhite(arg_206_0)
	LeanTween.cancel(arg_206_0)

	local var_206_0 = GetOrAddComponent(arg_206_0, "CanvasGroup")

	var_206_0.alpha = 0

	LeanTween.alphaCanvas(var_206_0, 1, 0.2):setUseEstimatedTime(true)

	local var_206_1 = findTF(arg_206_0.transform, "white_mask")

	if var_206_1 then
		setActive(var_206_1, false)
	end
end

function ClearTweenItemAlphaAndWhite(arg_207_0)
	LeanTween.cancel(arg_207_0)

	GetOrAddComponent(arg_207_0, "CanvasGroup").alpha = 0
end

function getGroupOwnSkins(arg_208_0)
	local var_208_0 = {}
	local var_208_1 = getProxy(ShipSkinProxy):getSkinList()
	local var_208_2 = getProxy(CollectionProxy):getShipGroup(arg_208_0)

	if var_208_2 then
		local var_208_3 = ShipGroup.getSkinList(arg_208_0)

		for iter_208_0, iter_208_1 in ipairs(var_208_3) do
			if iter_208_1.skin_type == ShipSkin.SKIN_TYPE_DEFAULT or table.contains(var_208_1, iter_208_1.id) or iter_208_1.skin_type == ShipSkin.SKIN_TYPE_REMAKE and var_208_2.trans or iter_208_1.skin_type == ShipSkin.SKIN_TYPE_PROPOSE and var_208_2.married == 1 then
				var_208_0[iter_208_1.id] = true
			end
		end
	end

	return var_208_0
end

function split(arg_209_0, arg_209_1)
	local var_209_0 = {}

	if not arg_209_0 then
		return nil
	end

	local var_209_1 = #arg_209_0
	local var_209_2 = 1

	while var_209_2 <= var_209_1 do
		local var_209_3 = string.find(arg_209_0, arg_209_1, var_209_2)

		if var_209_3 == nil then
			table.insert(var_209_0, string.sub(arg_209_0, var_209_2, var_209_1))

			break
		end

		table.insert(var_209_0, string.sub(arg_209_0, var_209_2, var_209_3 - 1))

		if var_209_3 == var_209_1 then
			table.insert(var_209_0, "")

			break
		end

		var_209_2 = var_209_3 + 1
	end

	return var_209_0
end

function NumberToChinese(arg_210_0, arg_210_1)
	local var_210_0 = ""
	local var_210_1 = #arg_210_0

	for iter_210_0 = 1, var_210_1 do
		local var_210_2 = string.sub(arg_210_0, iter_210_0, iter_210_0)

		if var_210_2 ~= "0" or var_210_2 == "0" and not arg_210_1 then
			if arg_210_1 then
				if var_210_1 >= 2 then
					if iter_210_0 == 1 then
						if var_210_2 == "1" then
							var_210_0 = i18n("number_" .. 10)
						else
							var_210_0 = i18n("number_" .. var_210_2) .. i18n("number_" .. 10)
						end
					else
						var_210_0 = var_210_0 .. i18n("number_" .. var_210_2)
					end
				else
					var_210_0 = var_210_0 .. i18n("number_" .. var_210_2)
				end
			else
				var_210_0 = var_210_0 .. i18n("number_" .. var_210_2)
			end
		end
	end

	return var_210_0
end

function getActivityTask(arg_211_0, arg_211_1)
	local var_211_0 = getProxy(TaskProxy)
	local var_211_1 = arg_211_0:getConfig("config_data")
	local var_211_2 = arg_211_0:getNDay(arg_211_0.data1)
	local var_211_3
	local var_211_4
	local var_211_5

	for iter_211_0 = math.max(arg_211_0.data3, 1), math.min(var_211_2, #var_211_1) do
		local var_211_6 = _.flatten({
			var_211_1[iter_211_0]
		})

		for iter_211_1, iter_211_2 in ipairs(var_211_6) do
			local var_211_7 = var_211_0:getTaskById(iter_211_2)

			if var_211_7 then
				return var_211_7.id, var_211_7
			end

			if var_211_4 then
				var_211_5 = var_211_0:getFinishTaskById(iter_211_2)

				if var_211_5 then
					var_211_4 = var_211_5
				elseif arg_211_1 then
					return iter_211_2
				else
					return var_211_4.id, var_211_4
				end
			else
				var_211_4 = var_211_0:getFinishTaskById(iter_211_2)
				var_211_5 = var_211_5 or iter_211_2
			end
		end
	end

	if var_211_4 then
		return var_211_4.id, var_211_4
	else
		return var_211_5
	end
end

function setImageFromImage(arg_212_0, arg_212_1, arg_212_2)
	local var_212_0 = GetComponent(arg_212_0, "Image")

	var_212_0.sprite = GetComponent(arg_212_1, "Image").sprite

	if arg_212_2 then
		var_212_0:SetNativeSize()
	end
end

function skinTimeStamp(arg_213_0)
	local var_213_0, var_213_1, var_213_2, var_213_3 = pg.TimeMgr.GetInstance():parseTimeFrom(arg_213_0)

	if var_213_0 >= 1 then
		return i18n("limit_skin_time_day", var_213_0)
	elseif var_213_0 <= 0 and var_213_1 > 0 then
		return i18n("limit_skin_time_day_min", var_213_1, var_213_2)
	elseif var_213_0 <= 0 and var_213_1 <= 0 and (var_213_2 > 0 or var_213_3 > 0) then
		return i18n("limit_skin_time_min", math.max(var_213_2, 1))
	elseif var_213_0 <= 0 and var_213_1 <= 0 and var_213_2 <= 0 and var_213_3 <= 0 then
		return i18n("limit_skin_time_overtime")
	end
end

function skinCommdityTimeStamp(arg_214_0)
	local var_214_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_214_1 = math.max(arg_214_0 - var_214_0, 0)
	local var_214_2 = math.floor(var_214_1 / 86400)

	if var_214_2 > 0 then
		return i18n("time_remaining_tip") .. var_214_2 .. i18n("word_date")
	else
		local var_214_3 = math.floor(var_214_1 / 3600)

		if var_214_3 > 0 then
			return i18n("time_remaining_tip") .. var_214_3 .. i18n("word_hour")
		else
			local var_214_4 = math.floor(var_214_1 / 60)

			if var_214_4 > 0 then
				return i18n("time_remaining_tip") .. var_214_4 .. i18n("word_minute")
			else
				return i18n("time_remaining_tip") .. var_214_1 .. i18n("word_second")
			end
		end
	end
end

function InstagramTimeStamp(arg_215_0)
	local var_215_0 = pg.TimeMgr.GetInstance():GetServerTime() - arg_215_0
	local var_215_1 = var_215_0 / 86400

	if var_215_1 > 1 then
		return i18n("ins_word_day", math.floor(var_215_1))
	else
		local var_215_2 = var_215_0 / 3600

		if var_215_2 > 1 then
			return i18n("ins_word_hour", math.floor(var_215_2))
		else
			local var_215_3 = var_215_0 / 60

			if var_215_3 > 1 then
				return i18n("ins_word_minu", math.floor(var_215_3))
			else
				return i18n("ins_word_minu", 1)
			end
		end
	end
end

function InstagramReplyTimeStamp(arg_216_0)
	local var_216_0 = pg.TimeMgr.GetInstance():GetServerTime() - arg_216_0
	local var_216_1 = var_216_0 / 86400

	if var_216_1 > 1 then
		return i18n1(math.floor(var_216_1) .. "d")
	else
		local var_216_2 = var_216_0 / 3600

		if var_216_2 > 1 then
			return i18n1(math.floor(var_216_2) .. "h")
		else
			local var_216_3 = var_216_0 / 60

			if var_216_3 > 1 then
				return i18n1(math.floor(var_216_3) .. "min")
			else
				return i18n1("1min")
			end
		end
	end
end

function attireTimeStamp(arg_217_0)
	local var_217_0, var_217_1, var_217_2, var_217_3 = pg.TimeMgr.GetInstance():parseTimeFrom(arg_217_0)

	if var_217_0 <= 0 and var_217_1 <= 0 and var_217_2 <= 0 and var_217_3 <= 0 then
		return i18n("limit_skin_time_overtime")
	else
		return i18n("attire_time_stamp", var_217_0, var_217_1, var_217_2)
	end
end

function checkExist(arg_218_0, ...)
	local var_218_0 = {
		...
	}

	for iter_218_0, iter_218_1 in ipairs(var_218_0) do
		if arg_218_0 == nil then
			break
		end

		assert(type(arg_218_0) == "table", "type error : intermediate target should be table")
		assert(type(iter_218_1) == "table", "type error : param should be table")

		if type(arg_218_0[iter_218_1[1]]) == "function" then
			arg_218_0 = arg_218_0[iter_218_1[1]](arg_218_0, unpack(iter_218_1[2] or {}))
		else
			arg_218_0 = arg_218_0[iter_218_1[1]]
		end
	end

	return arg_218_0
end

function AcessWithinNull(arg_219_0, arg_219_1)
	if arg_219_0 == nil then
		return
	end

	assert(type(arg_219_0) == "table")

	return arg_219_0[arg_219_1]
end

function showRepairMsgbox()
	local var_220_0 = {
		text = i18n("msgbox_repair"),
		onCallback = function()
			if PathMgr.FileExists(Application.persistentDataPath .. "/hashes.csv") then
				BundleWizard.Inst:GetGroupMgr("DEFAULT_RES"):StartVerifyForLua()
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("word_no_cache"))
			end
		end
	}
	local var_220_1 = {
		text = i18n("msgbox_repair_l2d"),
		onCallback = function()
			if PathMgr.FileExists(Application.persistentDataPath .. "/hashes-live2d.csv") then
				BundleWizard.Inst:GetGroupMgr("L2D"):StartVerifyForLua()
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("word_no_cache"))
			end
		end
	}
	local var_220_2 = {
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
			var_220_2,
			var_220_1,
			var_220_0
		}
	})
end

function resourceVerify(arg_224_0, arg_224_1)
	if CSharpVersion > 35 then
		BundleWizard.Inst:GetGroupMgr("DEFAULT_RES"):StartVerifyForLua()

		return
	end

	local var_224_0 = Application.persistentDataPath .. "/hashes.csv"
	local var_224_1
	local var_224_2 = PathMgr.ReadAllLines(var_224_0)
	local var_224_3 = {}

	if arg_224_0 then
		setActive(arg_224_0, true)
	else
		pg.UIMgr.GetInstance():LoadingOn()
	end

	local function var_224_4()
		if arg_224_0 then
			setActive(arg_224_0, false)
		else
			pg.UIMgr.GetInstance():LoadingOff()
		end

		print(var_224_1)

		if var_224_1 then
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

	local var_224_5 = var_224_2.Length
	local var_224_6

	local function var_224_7(arg_227_0)
		if arg_227_0 < 0 then
			var_224_4()

			return
		end

		if arg_224_1 then
			setSlider(arg_224_1, 0, var_224_5, var_224_5 - arg_227_0)
		end

		local var_227_0 = string.split(var_224_2[arg_227_0], ",")
		local var_227_1 = var_227_0[1]
		local var_227_2 = var_227_0[3]
		local var_227_3 = PathMgr.getAssetBundle(var_227_1)

		if PathMgr.FileExists(var_227_3) then
			local var_227_4 = PathMgr.ReadAllBytes(PathMgr.getAssetBundle(var_227_1))

			if var_227_2 == HashUtil.CalcMD5(var_227_4) then
				onNextTick(function()
					var_224_7(arg_227_0 - 1)
				end)

				return
			end
		end

		var_224_1 = var_227_1

		var_224_4()
	end

	var_224_7(var_224_5 - 1)
end

function splitByWordEN(arg_229_0, arg_229_1)
	local var_229_0 = string.split(arg_229_0, " ")
	local var_229_1 = ""
	local var_229_2 = ""
	local var_229_3 = arg_229_1:GetComponent(typeof(RectTransform))
	local var_229_4 = arg_229_1:GetComponent(typeof(Text))
	local var_229_5 = var_229_3.rect.width

	for iter_229_0, iter_229_1 in ipairs(var_229_0) do
		local var_229_6 = var_229_2

		var_229_2 = var_229_2 == "" and iter_229_1 or var_229_2 .. " " .. iter_229_1

		setText(arg_229_1, var_229_2)

		if var_229_5 < var_229_4.preferredWidth then
			var_229_1 = var_229_1 == "" and var_229_6 or var_229_1 .. "\n" .. var_229_6
			var_229_2 = iter_229_1
		end

		if iter_229_0 >= #var_229_0 then
			var_229_1 = var_229_1 == "" and var_229_2 or var_229_1 .. "\n" .. var_229_2
		end
	end

	return var_229_1
end

function checkBirthFormat(arg_230_0)
	if #arg_230_0 ~= 8 then
		return false
	end

	local var_230_0 = 0
	local var_230_1 = #arg_230_0

	while var_230_0 < var_230_1 do
		local var_230_2 = string.byte(arg_230_0, var_230_0 + 1)

		if var_230_2 < 48 or var_230_2 > 57 then
			return false
		end

		var_230_0 = var_230_0 + 1
	end

	return true
end

function isHalfBodyLive2D(arg_231_0)
	local var_231_0 = {
		"biaoqiang",
		"z23",
		"lafei",
		"lingbo",
		"mingshi",
		"xuefeng"
	}

	return _.any(var_231_0, function(arg_232_0)
		return arg_232_0 == arg_231_0
	end)
end

function GetServerState(arg_233_0)
	local var_233_0 = -1
	local var_233_1 = 0
	local var_233_2 = 1
	local var_233_3 = 2
	local var_233_4 = NetConst.GetServerStateUrl()

	if PLATFORM_CODE == PLATFORM_CH then
		var_233_4 = string.gsub(var_233_4, "https", "http")
	end

	VersionMgr.Inst:WebRequest(var_233_4, function(arg_234_0, arg_234_1)
		local var_234_0 = true
		local var_234_1 = false

		for iter_234_0 in string.gmatch(arg_234_1, "\"state\":%d") do
			if iter_234_0 ~= "\"state\":1" then
				var_234_0 = false
			end

			var_234_1 = true
		end

		if not var_234_1 then
			var_234_0 = false
		end

		if arg_233_0 ~= nil then
			arg_233_0(var_234_0 and var_233_2 or var_233_1)
		end
	end)
end

function setScrollText(arg_235_0, arg_235_1)
	GetOrAddComponent(arg_235_0, "ScrollText"):SetText(arg_235_1)
end

function changeToScrollText(arg_236_0, arg_236_1)
	local var_236_0 = GetComponent(arg_236_0, typeof(Text))

	assert(var_236_0, "without component<Text>")

	local var_236_1 = arg_236_0:Find("subText")

	if not var_236_1 then
		var_236_1 = cloneTplTo(arg_236_0, arg_236_0, "subText")

		eachChild(arg_236_0, function(arg_237_0)
			setActive(arg_237_0, arg_237_0 == var_236_1)
		end)

		arg_236_0:GetComponent(typeof(Text)).enabled = false
	end

	setScrollText(var_236_1, arg_236_1)
end

local var_0_16
local var_0_17
local var_0_18
local var_0_19

local function var_0_20(arg_238_0, arg_238_1, arg_238_2)
	local var_238_0 = arg_238_0:Find("base")
	local var_238_1, var_238_2, var_238_3 = Equipment.GetInfoTrans(arg_238_1, arg_238_2)

	if arg_238_1.nextValue then
		local var_238_4 = {
			name = arg_238_1.name,
			type = arg_238_1.type,
			value = arg_238_1.nextValue
		}
		local var_238_5, var_238_6 = Equipment.GetInfoTrans(var_238_4, arg_238_2)

		var_238_2 = var_238_2 .. setColorStr("   >   " .. var_238_6, COLOR_GREEN)
	end

	setText(var_238_0:Find("name"), var_238_1)

	if var_238_3 then
		local var_238_7 = "<color=#afff72>(+" .. ys.Battle.BattleConst.UltimateBonus.AuxBoostValue * 100 .. "%)</color>"

		setText(var_238_0:Find("value"), var_238_2 .. var_238_7)
	else
		setText(var_238_0:Find("value"), var_238_2)
	end

	setActive(var_238_0:Find("value/up"), arg_238_1.compare and arg_238_1.compare > 0)
	setActive(var_238_0:Find("value/down"), arg_238_1.compare and arg_238_1.compare < 0)
	triggerToggle(var_238_0, arg_238_1.lock_open)

	if not arg_238_1.lock_open and arg_238_1.sub and #arg_238_1.sub > 0 then
		GetComponent(var_238_0, typeof(Toggle)).enabled = true
	else
		setActive(var_238_0:Find("name/close"), false)
		setActive(var_238_0:Find("name/open"), false)

		GetComponent(var_238_0, typeof(Toggle)).enabled = false
	end
end

local function var_0_21(arg_239_0, arg_239_1, arg_239_2, arg_239_3)
	var_0_20(arg_239_0, arg_239_2, arg_239_3)

	if not arg_239_2.sub or #arg_239_2.sub == 0 then
		return
	end

	var_0_18(arg_239_0:Find("subs"), arg_239_1, arg_239_2.sub, arg_239_3)
end

function var_0_18(arg_240_0, arg_240_1, arg_240_2, arg_240_3)
	removeAllChildren(arg_240_0)
	var_0_19(arg_240_0, arg_240_1, arg_240_2, arg_240_3)
end

function var_0_19(arg_241_0, arg_241_1, arg_241_2, arg_241_3)
	for iter_241_0, iter_241_1 in ipairs(arg_241_2) do
		local var_241_0 = cloneTplTo(arg_241_1, arg_241_0)

		var_0_21(var_241_0, arg_241_1, iter_241_1, arg_241_3)
	end
end

function updateEquipInfo(arg_242_0, arg_242_1, arg_242_2, arg_242_3)
	local var_242_0 = arg_242_0:Find("attr_tpl")

	var_0_18(arg_242_0:Find("attrs"), var_242_0, arg_242_1.attrs, arg_242_3)
	setActive(arg_242_0:Find("skill"), arg_242_2)

	if arg_242_2 then
		var_0_21(arg_242_0:Find("skill/attr"), var_242_0, {
			name = i18n("skill"),
			value = setColorStr(arg_242_2.name, "#FFDE00FF")
		}, arg_242_3)
		setText(arg_242_0:Find("skill/value/Text"), getSkillDescGet(arg_242_2.id))
	end

	setActive(arg_242_0:Find("weapon"), #arg_242_1.weapon.sub > 0)

	if #arg_242_1.weapon.sub > 0 then
		var_0_18(arg_242_0:Find("weapon"), var_242_0, {
			arg_242_1.weapon
		}, arg_242_3)
	end

	setActive(arg_242_0:Find("equip_info"), #arg_242_1.equipInfo.sub > 0)

	if #arg_242_1.equipInfo.sub > 0 then
		var_0_18(arg_242_0:Find("equip_info"), var_242_0, {
			arg_242_1.equipInfo
		}, arg_242_3)
	end

	var_0_21(arg_242_0:Find("part/attr"), var_242_0, {
		name = i18n("equip_info_23")
	}, arg_242_3)

	local var_242_1 = arg_242_0:Find("part/value")
	local var_242_2 = var_242_1:Find("label")
	local var_242_3 = {}
	local var_242_4 = {}

	if #arg_242_1.part[1] == 0 and #arg_242_1.part[2] == 0 then
		setmetatable(var_242_3, {
			__index = function(arg_243_0, arg_243_1)
				return true
			end
		})
		setmetatable(var_242_4, {
			__index = function(arg_244_0, arg_244_1)
				return true
			end
		})
	else
		for iter_242_0, iter_242_1 in ipairs(arg_242_1.part[1]) do
			var_242_3[iter_242_1] = true
		end

		for iter_242_2, iter_242_3 in ipairs(arg_242_1.part[2]) do
			var_242_4[iter_242_3] = true
		end
	end

	local var_242_5 = ShipType.MergeFengFanType(ShipType.FilterOverQuZhuType(ShipType.AllShipType), var_242_3, var_242_4)

	UIItemList.StaticAlign(var_242_1, var_242_2, #var_242_5, function(arg_245_0, arg_245_1, arg_245_2)
		arg_245_1 = arg_245_1 + 1

		if arg_245_0 == UIItemList.EventUpdate then
			local var_245_0 = var_242_5[arg_245_1]

			GetImageSpriteFromAtlasAsync("shiptype", ShipType.Type2CNLabel(var_245_0), arg_245_2)
			setActive(arg_245_2:Find("main"), var_242_3[var_245_0] and not var_242_4[var_245_0])
			setActive(arg_245_2:Find("sub"), var_242_4[var_245_0] and not var_242_3[var_245_0])
			setImageAlpha(arg_245_2, not var_242_3[var_245_0] and not var_242_4[var_245_0] and 0.3 or 1)
		end
	end)
end

function updateEquipUpgradeInfo(arg_246_0, arg_246_1, arg_246_2)
	local var_246_0 = arg_246_0:Find("attr_tpl")

	var_0_18(arg_246_0:Find("attrs"), var_246_0, arg_246_1.attrs, arg_246_2)
	setActive(arg_246_0:Find("weapon"), #arg_246_1.weapon.sub > 0)

	if #arg_246_1.weapon.sub > 0 then
		var_0_18(arg_246_0:Find("weapon"), var_246_0, {
			arg_246_1.weapon
		}, arg_246_2)
	end

	setActive(arg_246_0:Find("equip_info"), #arg_246_1.equipInfo.sub > 0)

	if #arg_246_1.equipInfo.sub > 0 then
		var_0_18(arg_246_0:Find("equip_info"), var_246_0, {
			arg_246_1.equipInfo
		}, arg_246_2)
	end
end

function setCanvasOverrideSorting(arg_247_0, arg_247_1)
	local var_247_0 = arg_247_0.parent

	arg_247_0:SetParent(pg.LayerWeightMgr.GetInstance().uiOrigin, false)

	if isActive(arg_247_0) then
		GetOrAddComponent(arg_247_0, typeof(Canvas)).overrideSorting = arg_247_1
	else
		setActive(arg_247_0, true)

		GetOrAddComponent(arg_247_0, typeof(Canvas)).overrideSorting = arg_247_1

		setActive(arg_247_0, false)
	end

	arg_247_0:SetParent(var_247_0, false)
end

function createNewGameObject(arg_248_0, arg_248_1)
	local var_248_0 = GameObject.New()

	if arg_248_0 then
		var_248_0.name = "model"
	end

	var_248_0.layer = arg_248_1 or Layer.UI

	return GetOrAddComponent(var_248_0, "RectTransform")
end

function CreateShell(arg_249_0)
	if type(arg_249_0) ~= "table" and type(arg_249_0) ~= "userdata" then
		return arg_249_0
	end

	local var_249_0 = setmetatable({
		__index = arg_249_0
	}, arg_249_0)

	return setmetatable({}, var_249_0)
end

function CameraFittingSettin(arg_250_0)
	local var_250_0 = GetComponent(arg_250_0, typeof(Camera))
	local var_250_1 = 1.7777777777777777
	local var_250_2 = Screen.width / Screen.height

	if var_250_2 < var_250_1 then
		local var_250_3 = var_250_2 / var_250_1

		var_250_0.rect = var_0_0.Rect.New(0, (1 - var_250_3) / 2, 1, var_250_3)
	end
end

function SwitchSpecialChar(arg_251_0, arg_251_1)
	if PLATFORM_CODE ~= PLATFORM_US then
		arg_251_0 = arg_251_0:gsub(" ", " ")
		arg_251_0 = arg_251_0:gsub("\t", "    ")
	end

	if not arg_251_1 then
		arg_251_0 = arg_251_0:gsub("\n", " ")
	end

	return arg_251_0
end

function AfterCheck(arg_252_0, arg_252_1)
	local var_252_0 = {}

	for iter_252_0, iter_252_1 in ipairs(arg_252_0) do
		var_252_0[iter_252_0] = iter_252_1[1]()
	end

	arg_252_1()

	for iter_252_2, iter_252_3 in ipairs(arg_252_0) do
		if var_252_0[iter_252_2] ~= iter_252_3[1]() then
			iter_252_3[2]()
		end

		var_252_0[iter_252_2] = iter_252_3[1]()
	end
end

function CompareFuncs(arg_253_0, arg_253_1)
	local var_253_0 = {}

	local function var_253_1(arg_254_0, arg_254_1)
		var_253_0[arg_254_0] = var_253_0[arg_254_0] or {}
		var_253_0[arg_254_0][arg_254_1] = var_253_0[arg_254_0][arg_254_1] or arg_253_0[arg_254_0](arg_254_1)

		return var_253_0[arg_254_0][arg_254_1]
	end

	return function(arg_255_0, arg_255_1)
		local var_255_0 = 1

		while var_255_0 <= #arg_253_0 do
			local var_255_1 = var_253_1(var_255_0, arg_255_0)
			local var_255_2 = var_253_1(var_255_0, arg_255_1)

			if var_255_1 == var_255_2 then
				var_255_0 = var_255_0 + 1
			else
				return var_255_1 < var_255_2
			end
		end

		return tobool(arg_253_1)
	end
end

function DropResultIntegration(arg_256_0)
	local var_256_0 = {}
	local var_256_1 = 1

	while var_256_1 <= #arg_256_0 do
		local var_256_2 = arg_256_0[var_256_1].type
		local var_256_3 = arg_256_0[var_256_1].id

		var_256_0[var_256_2] = var_256_0[var_256_2] or {}

		if var_256_0[var_256_2][var_256_3] then
			local var_256_4 = arg_256_0[var_256_0[var_256_2][var_256_3]]
			local var_256_5 = table.remove(arg_256_0, var_256_1)

			var_256_4.count = var_256_4.count + var_256_5.count
		else
			var_256_0[var_256_2][var_256_3] = var_256_1
			var_256_1 = var_256_1 + 1
		end
	end

	local var_256_6 = {
		function(arg_257_0)
			local var_257_0 = arg_257_0.type
			local var_257_1 = arg_257_0.id

			if var_257_0 == DROP_TYPE_SHIP then
				return 1
			elseif var_257_0 == DROP_TYPE_RESOURCE then
				if var_257_1 == 1 then
					return 2
				else
					return 3
				end
			elseif var_257_0 == DROP_TYPE_ITEM then
				if var_257_1 == 59010 then
					return 4
				elseif var_257_1 == 59900 then
					return 5
				else
					local var_257_2 = Item.getConfigData(var_257_1)
					local var_257_3 = var_257_2 and var_257_2.type or 0

					if var_257_3 == 9 then
						return 6
					elseif var_257_3 == 5 then
						return 7
					elseif var_257_3 == 4 then
						return 8
					elseif var_257_3 == 7 then
						return 9
					end
				end
			elseif var_257_0 == DROP_TYPE_VITEM and var_257_1 == 59011 then
				return 4
			end

			return 100
		end,
		function(arg_258_0)
			local var_258_0

			if arg_258_0.type == DROP_TYPE_SHIP then
				var_258_0 = pg.ship_data_statistics[arg_258_0.id]
			elseif arg_258_0.type == DROP_TYPE_ITEM then
				var_258_0 = Item.getConfigData(arg_258_0.id)
			end

			return (var_258_0 and var_258_0.rarity or 0) * -1
		end,
		function(arg_259_0)
			return arg_259_0.id
		end
	}

	table.sort(arg_256_0, CompareFuncs(var_256_6))
end

function getLoginConfig()
	local var_260_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_260_1 = 1

	for iter_260_0, iter_260_1 in ipairs(pg.login.all) do
		if pg.login[iter_260_1].date ~= "stop" then
			local var_260_2, var_260_3 = parseTimeConfig(pg.login[iter_260_1].date)

			assert(not var_260_3)

			if pg.TimeMgr.GetInstance():inTime(var_260_2, var_260_0) then
				var_260_1 = iter_260_1

				break
			end
		end
	end

	local var_260_4 = pg.login[var_260_1].login_static

	var_260_4 = var_260_4 ~= "" and var_260_4 or "login"

	local var_260_5 = pg.login[var_260_1].login_cri
	local var_260_6 = var_260_5 ~= "" and true or false
	local var_260_7 = pg.login[var_260_1].op_play == 1 and true or false
	local var_260_8 = pg.login[var_260_1].op_time

	if var_260_8 == "" or not pg.TimeMgr.GetInstance():inTime(var_260_8, var_260_0) then
		var_260_7 = false
	end

	local var_260_9 = var_260_8 == "" and var_260_8 or table.concat(var_260_8[1][1])

	return var_260_6, var_260_6 and var_260_5 or var_260_4, pg.login[var_260_1].bgm, var_260_7, var_260_9
end

function setIntimacyIcon(arg_261_0, arg_261_1, arg_261_2)
	local var_261_0 = {}
	local var_261_1

	seriesAsync({
		function(arg_262_0)
			if arg_261_0.childCount > 0 then
				var_261_1 = arg_261_0:GetChild(0)

				arg_262_0()
			else
				LoadAndInstantiateAsync("template", "intimacytpl", function(arg_263_0)
					var_261_1 = tf(arg_263_0)

					setParent(var_261_1, arg_261_0)
					arg_262_0()
				end)
			end
		end,
		function(arg_264_0)
			setImageAlpha(var_261_1, arg_261_2 and 0 or 1)
			eachChild(var_261_1, function(arg_265_0)
				setActive(arg_265_0, false)
			end)

			if arg_261_2 then
				local var_264_0 = var_261_1:Find(arg_261_2 .. "(Clone)")

				if not var_264_0 then
					LoadAndInstantiateAsync("ui", arg_261_2, function(arg_266_0)
						setParent(arg_266_0, var_261_1)
						setActive(arg_266_0, true)
					end)
				else
					setActive(var_264_0, true)
				end
			elseif arg_261_1 then
				setImageSprite(var_261_1, GetSpriteFromAtlas("energy", arg_261_1), true)
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

function switch(arg_269_0, arg_269_1, arg_269_2, ...)
	if arg_269_1[arg_269_0] then
		return arg_269_1[arg_269_0](...)
	elseif arg_269_2 then
		return arg_269_2(...)
	end
end

function parseTimeConfig(arg_270_0)
	if type(arg_270_0[1]) == "table" then
		return arg_270_0[2], arg_270_0[1]
	else
		return arg_270_0
	end
end

local var_0_23 = {
	__add = function(arg_271_0, arg_271_1)
		return NewPos(arg_271_0.x + arg_271_1.x, arg_271_0.y + arg_271_1.y)
	end,
	__sub = function(arg_272_0, arg_272_1)
		return NewPos(arg_272_0.x - arg_272_1.x, arg_272_0.y - arg_272_1.y)
	end,
	__mul = function(arg_273_0, arg_273_1)
		if type(arg_273_1) == "number" then
			return NewPos(arg_273_0.x * arg_273_1, arg_273_0.y * arg_273_1)
		else
			return NewPos(arg_273_0.x * arg_273_1.x, arg_273_0.y * arg_273_1.y)
		end
	end,
	__eq = function(arg_274_0, arg_274_1)
		return arg_274_0.x == arg_274_1.x and arg_274_0.y == arg_274_1.y
	end,
	__tostring = function(arg_275_0)
		return arg_275_0.x .. "_" .. arg_275_0.y
	end
}

function NewPos(arg_276_0, arg_276_1)
	assert(arg_276_0 and arg_276_1)

	local var_276_0 = setmetatable({
		x = arg_276_0,
		y = arg_276_1
	}, var_0_23)

	function var_276_0.SqrMagnitude(arg_277_0)
		return arg_277_0.x * arg_277_0.x + arg_277_0.y * arg_277_0.y
	end

	function var_276_0.Normalize(arg_278_0)
		local var_278_0 = arg_278_0:SqrMagnitude()

		if var_278_0 > 1e-05 then
			return arg_278_0 * (1 / math.sqrt(var_278_0))
		else
			return NewPos(0, 0)
		end
	end

	return var_276_0
end

local var_0_24

function Timekeeping()
	warning(Time.realtimeSinceStartup - (var_0_24 or Time.realtimeSinceStartup), Time.realtimeSinceStartup)

	var_0_24 = Time.realtimeSinceStartup
end

function GetRomanDigit(arg_280_0)
	return (string.char(226, 133, 160 + (arg_280_0 - 1)))
end

function quickPlayAnimator(arg_281_0, arg_281_1)
	arg_281_0:GetComponent(typeof(Animator)):Play(arg_281_1, -1, 0)
end

function quickPlayAnimation(arg_282_0, arg_282_1)
	arg_282_0:GetComponent(typeof(Animation)):Play(arg_282_1)
end

function getSurveyUrl(arg_283_0)
	local var_283_0 = pg.survey_data_template[arg_283_0]
	local var_283_1

	if not IsUnityEditor then
		if PLATFORM_CODE == PLATFORM_CH then
			local var_283_2 = getProxy(UserProxy):GetCacheGatewayInServerLogined()

			if var_283_2 == PLATFORM_ANDROID then
				if LuaHelper.GetCHPackageType() == PACKAGE_TYPE_BILI then
					var_283_1 = var_283_0.main_url
				else
					var_283_1 = var_283_0.uo_url
				end
			elseif var_283_2 == PLATFORM_IPHONEPLAYER then
				var_283_1 = var_283_0.ios_url
			end
		elseif PLATFORM_CODE == PLATFORM_US or PLATFORM_CODE == PLATFORM_JP then
			var_283_1 = var_283_0.main_url
		end
	else
		var_283_1 = var_283_0.main_url
	end

	local var_283_3 = getProxy(PlayerProxy):getRawData().id
	local var_283_4 = getProxy(UserProxy):getRawData().arg2 or ""
	local var_283_5
	local var_283_6 = PLATFORM == PLATFORM_ANDROID and 1 or PLATFORM == PLATFORM_IPHONEPLAYER and 2 or 3
	local var_283_7 = getProxy(UserProxy):getRawData()
	local var_283_8 = getProxy(ServerProxy):getRawData()[var_283_7 and var_283_7.server or 0]
	local var_283_9 = var_283_8 and var_283_8.id or ""
	local var_283_10 = getProxy(PlayerProxy):getRawData().level
	local var_283_11 = var_283_3 .. "_" .. arg_283_0
	local var_283_12 = var_283_1
	local var_283_13 = {
		var_283_3,
		var_283_4,
		var_283_6,
		var_283_9,
		var_283_10,
		var_283_11
	}

	if var_283_12 then
		for iter_283_0, iter_283_1 in ipairs(var_283_13) do
			var_283_12 = string.gsub(var_283_12, "$" .. iter_283_0, tostring(iter_283_1))
		end
	end

	warning(var_283_12)

	return var_283_12
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

function FilterVarchar(arg_285_0)
	assert(type(arg_285_0) == "string" or type(arg_285_0) == "table")

	if arg_285_0 == "" then
		return nil
	end

	return arg_285_0
end

function getGameset(arg_286_0)
	local var_286_0 = pg.gameset[arg_286_0]

	assert(var_286_0)

	return {
		var_286_0.key_value,
		var_286_0.description
	}
end

function getDorm3dGameset(arg_287_0)
	local var_287_0 = pg.dorm3d_set[arg_287_0]

	assert(var_287_0)

	return {
		var_287_0.key_value_int,
		var_287_0.key_value_varchar
	}
end

function GetItemsOverflowDic(arg_288_0)
	arg_288_0 = arg_288_0 or {}

	local var_288_0 = {
		[DROP_TYPE_ITEM] = {},
		[DROP_TYPE_RESOURCE] = {},
		[DROP_TYPE_EQUIP] = 0,
		[DROP_TYPE_SHIP] = 0,
		[DROP_TYPE_WORLD_ITEM] = 0
	}

	while #arg_288_0 > 0 do
		local var_288_1 = table.remove(arg_288_0)

		switch(var_288_1.type, {
			[DROP_TYPE_ITEM] = function()
				if var_288_1:getConfig("open_directly") == 1 then
					for iter_289_0, iter_289_1 in ipairs(var_288_1:getConfig("display_icon")) do
						local var_289_0 = Drop.Create(iter_289_1)

						var_289_0.count = var_289_0.count * var_288_1.count

						table.insert(arg_288_0, var_289_0)
					end
				elseif var_288_1:getSubClass():IsShipExpType() then
					var_288_0[var_288_1.type][var_288_1.id] = defaultValue(var_288_0[var_288_1.type][var_288_1.id], 0) + var_288_1.count
				end
			end,
			[DROP_TYPE_RESOURCE] = function()
				var_288_0[var_288_1.type][var_288_1.id] = defaultValue(var_288_0[var_288_1.type][var_288_1.id], 0) + var_288_1.count
			end,
			[DROP_TYPE_EQUIP] = function()
				var_288_0[var_288_1.type] = var_288_0[var_288_1.type] + var_288_1.count
			end,
			[DROP_TYPE_SHIP] = function()
				var_288_0[var_288_1.type] = var_288_0[var_288_1.type] + var_288_1.count
			end,
			[DROP_TYPE_WORLD_ITEM] = function()
				var_288_0[var_288_1.type] = var_288_0[var_288_1.type] + var_288_1.count
			end
		})
	end

	return var_288_0
end

function CheckOverflow(arg_294_0, arg_294_1)
	local var_294_0 = {}
	local var_294_1 = arg_294_0[DROP_TYPE_RESOURCE][PlayerConst.ResGold] or 0
	local var_294_2 = arg_294_0[DROP_TYPE_RESOURCE][PlayerConst.ResOil] or 0
	local var_294_3 = arg_294_0[DROP_TYPE_EQUIP]
	local var_294_4 = arg_294_0[DROP_TYPE_SHIP]
	local var_294_5 = getProxy(PlayerProxy):getRawData()
	local var_294_6 = false

	if arg_294_1 then
		local var_294_7 = var_294_5:OverStore(PlayerConst.ResStoreGold, var_294_1)
		local var_294_8 = var_294_5:OverStore(PlayerConst.ResStoreOil, var_294_2)

		if var_294_7 > 0 or var_294_8 > 0 then
			var_294_0.isStoreOverflow = {
				var_294_7,
				var_294_8
			}
		end
	else
		if var_294_1 > 0 and var_294_5:GoldMax(var_294_1) then
			return false, "gold"
		end

		if var_294_2 > 0 and var_294_5:OilMax(var_294_2) then
			return false, "oil"
		end
	end

	var_294_0.isExpBookOverflow = {}

	for iter_294_0, iter_294_1 in pairs(arg_294_0[DROP_TYPE_ITEM]) do
		local var_294_9 = Item.getConfigData(iter_294_0)

		if getProxy(BagProxy):getItemCountById(iter_294_0) + iter_294_1 > var_294_9.max_num then
			table.insert(var_294_0.isExpBookOverflow, iter_294_0)
		end
	end

	local var_294_10 = getProxy(EquipmentProxy):getCapacity()

	if var_294_3 > 0 and var_294_3 + var_294_10 > var_294_5:getMaxEquipmentBag() then
		return false, "equip"
	end

	local var_294_11 = getProxy(BayProxy):getShipCount()

	if var_294_4 > 0 and var_294_4 + var_294_11 > var_294_5:getMaxShipBag() then
		return false, "ship"
	end

	return true, var_294_0
end

function CheckShipExpOverflow(arg_295_0)
	local var_295_0 = getProxy(BagProxy)

	for iter_295_0, iter_295_1 in pairs(arg_295_0[DROP_TYPE_ITEM]) do
		if var_295_0:getItemCountById(iter_295_0) + iter_295_1 > Item.getConfigData(iter_295_0).max_num then
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

function RegisterDetailButton(arg_296_0, arg_296_1, arg_296_2)
	Drop.Change(arg_296_2)
	switch(arg_296_2.type, {
		[DROP_TYPE_ITEM] = function()
			if arg_296_2:getConfig("type") == Item.SKIN_ASSIGNED_TYPE then
				local var_297_0 = Item.getConfigData(arg_296_2.id).usage_arg
				local var_297_1 = var_297_0[3]

				if Item.InTimeLimitSkinAssigned(arg_296_2.id) then
					var_297_1 = table.mergeArray(var_297_0[2], var_297_1, true)
				end

				local var_297_2 = {}

				for iter_297_0, iter_297_1 in ipairs(var_297_0[2]) do
					var_297_2[iter_297_1] = true
				end

				onButton(arg_296_0, arg_296_1, function()
					arg_296_0:closeView()
					pg.m02:sendNotification(GAME.LOAD_LAYERS, {
						parentContext = getProxy(ContextProxy):getCurrentContext(),
						context = Context.New({
							viewComponent = SelectSkinLayer,
							mediator = SkinAtlasMediator,
							data = {
								mode = SelectSkinLayer.MODE_VIEW,
								itemId = arg_296_2.id,
								selectableSkinList = underscore.map(var_297_1, function(arg_299_0)
									return SelectableSkin.New({
										id = arg_299_0,
										isTimeLimit = var_297_2[arg_299_0] or false
									})
								end)
							}
						})
					})
				end, SFX_PANEL)
				setActive(arg_296_1, true)
			else
				local var_297_3 = getProxy(TechnologyProxy):getItemCanUnlockBluePrint(arg_296_2.id) and "tech" or arg_296_2:getConfig("type")

				if var_0_25[var_297_3] then
					local var_297_4 = {
						item2Row = true,
						content = i18n(var_0_25[var_297_3]),
						itemList = underscore.map(arg_296_2:getConfig("display_icon"), function(arg_300_0)
							return Drop.Create(arg_300_0)
						end)
					}

					if var_297_3 == 11 then
						onButton(arg_296_0, arg_296_1, function()
							arg_296_0:emit(BaseUI.ON_DROP_LIST_OWN, var_297_4)
						end, SFX_PANEL)
					else
						onButton(arg_296_0, arg_296_1, function()
							arg_296_0:emit(BaseUI.ON_DROP_LIST, var_297_4)
						end, SFX_PANEL)
					end
				end

				setActive(arg_296_1, tobool(var_0_25[var_297_3]))
			end
		end,
		[DROP_TYPE_EQUIP] = function()
			onButton(arg_296_0, arg_296_1, function()
				arg_296_0:emit(BaseUI.ON_DROP, arg_296_2)
			end, SFX_PANEL)
			setActive(arg_296_1, true)
		end,
		[DROP_TYPE_SPWEAPON] = function()
			onButton(arg_296_0, arg_296_1, function()
				arg_296_0:emit(BaseUI.ON_DROP, arg_296_2)
			end, SFX_PANEL)
			setActive(arg_296_1, true)
		end
	}, function()
		setActive(arg_296_1, false)
	end)
end

function UpdateOwnDisplay(arg_308_0, arg_308_1)
	local var_308_0, var_308_1 = arg_308_1:getOwnedCount()

	setActive(arg_308_0, var_308_1 and var_308_0 > 0)

	if var_308_1 and var_308_0 > 0 then
		setText(arg_308_0:Find("label"), i18n("word_own1"))
		setText(arg_308_0:Find("Text"), var_308_0)
	end
end

function Damp(arg_309_0, arg_309_1, arg_309_2)
	arg_309_1 = Mathf.Max(1, arg_309_1)

	local var_309_0 = Mathf.Epsilon

	if arg_309_1 < var_309_0 or var_309_0 > Mathf.Abs(arg_309_0) then
		return arg_309_0
	end

	if arg_309_2 < var_309_0 then
		return 0
	end

	local var_309_1 = -4.605170186

	return arg_309_0 * (1 - Mathf.Exp(var_309_1 * arg_309_2 / arg_309_1))
end

function checkCullResume(arg_310_0)
	if not ReflectionHelp.RefCallMethodEx(typeof("UnityEngine.CanvasRenderer"), "GetMaterial", GetComponent(arg_310_0, "CanvasRenderer"), {
		typeof("System.Int32")
	}, {
		0
	}) then
		local var_310_0 = arg_310_0:GetComponentsInChildren(typeof(MeshImage))

		for iter_310_0 = 1, var_310_0.Length do
			var_310_0[iter_310_0 - 1]:SetVerticesDirty()
		end

		return false
	end

	return true
end

function parseEquipCode(arg_311_0)
	local var_311_0 = {}

	if arg_311_0 and arg_311_0 ~= "" then
		local var_311_1 = base64.dec(arg_311_0)

		var_311_0 = string.split(var_311_1, "/")
		var_311_0[5], var_311_0[6] = unpack(string.split(var_311_0[5], "\\"))

		if #var_311_0 < 6 or arg_311_0 ~= base64.enc(table.concat({
			table.concat(underscore.first(var_311_0, 5), "/"),
			var_311_0[6]
		}, "\\")) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("equipcode_illegal"))

			var_311_0 = {}
		end
	end

	for iter_311_0 = 1, 6 do
		var_311_0[iter_311_0] = var_311_0[iter_311_0] and tonumber(var_311_0[iter_311_0], 32) or 0
	end

	return var_311_0
end

function buildEquipCode(arg_312_0)
	local var_312_0 = underscore.map(arg_312_0:getAllEquipments(), function(arg_313_0)
		return ConversionBase(32, arg_313_0 and arg_313_0.id or 0)
	end)
	local var_312_1 = {
		table.concat(var_312_0, "/"),
		ConversionBase(32, checkExist(arg_312_0:GetSpWeapon(), {
			"id"
		}) or 0)
	}

	return base64.enc(table.concat(var_312_1, "\\"))
end

function setDirectorSpeed(arg_314_0, arg_314_1)
	GetComponent(arg_314_0, "TimelineSpeed"):SetTimelineSpeed(arg_314_1)
end

function setDefaultZeroMetatable(arg_315_0)
	return setmetatable(arg_315_0, {
		__index = function(arg_316_0, arg_316_1)
			if rawget(arg_316_0, arg_316_1) == nil then
				arg_316_0[arg_316_1] = 0
			end

			return arg_316_0[arg_316_1]
		end
	})
end

function checkABExist(arg_317_0)
	if EDITOR_TOOL then
		return PathMgr.FileExists(PathMgr.getAssetBundle(arg_317_0)) or ResourceMgr.Inst:AssetExist(arg_317_0)
	else
		return PathMgr.FileExists(PathMgr.getAssetBundle(arg_317_0))
	end
end
