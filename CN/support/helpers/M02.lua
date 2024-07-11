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

	GetImageSpriteFromAtlasAsync("furnitureicon/" .. arg_105_1:getIcon(), "", var_105_2)
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

	GetImageSpriteFromAtlasAsync("furnitureicon/" .. arg_106_1:getIcon(), "", var_106_2)
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
	local var_108_0 = arg_108_1:getConfig("rarity")

	GetImageSpriteFromAtlasAsync("weaponframes", "dorm3d_" .. ItemRarity.Rarity2Print(var_108_0), arg_108_0)

	local var_108_1 = arg_108_0:Find("icon")

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

function updateEmoji(arg_116_0, arg_116_1, arg_116_2)
	local var_116_0 = findTF(arg_116_0, "icon_bg/icon")
	local var_116_1 = "icon_emoji"

	GetImageSpriteFromAtlasAsync("Props/" .. var_116_1, "", var_116_0)

	local var_116_2 = 4

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_116_2, findTF(arg_116_0, "icon_bg"))
	setFrame(findTF(arg_116_0, "icon_bg/frame"), var_116_2)
	setIconName(arg_116_0, arg_116_1.name, arg_116_2)
end

function updateEquipmentSkin(arg_117_0, arg_117_1, arg_117_2)
	arg_117_2 = arg_117_2 or {}

	local var_117_0 = EquipmentRarity.Rarity2Print(arg_117_1.rarity)

	GetImageSpriteFromAtlasAsync("weaponframes", "bg" .. var_117_0, findTF(arg_117_0, "icon_bg"))
	setFrame(findTF(arg_117_0, "icon_bg/frame"), var_117_0, "frame_skin")

	local var_117_1 = findTF(arg_117_0, "icon_bg/icon")

	GetImageSpriteFromAtlasAsync("equips/" .. arg_117_1.icon, "", var_117_1)
	setIconStars(arg_117_0, false)
	setIconName(arg_117_0, arg_117_1.name, arg_117_2)
	setIconCount(arg_117_0, arg_117_1.count)
	setIconColorful(arg_117_0, arg_117_1.rarity - 1, arg_117_2)
end

function NoPosMsgBox(arg_118_0, arg_118_1, arg_118_2, arg_118_3)
	local var_118_0
	local var_118_1 = {}

	if arg_118_1 then
		table.insert(var_118_1, {
			text = "text_noPos_clear",
			atuoClose = true,
			onCallback = arg_118_1
		})
	end

	if arg_118_2 then
		table.insert(var_118_1, {
			text = "text_noPos_buy",
			atuoClose = true,
			onCallback = arg_118_2
		})
	end

	if arg_118_3 then
		table.insert(var_118_1, {
			text = "text_noPos_intensify",
			atuoClose = true,
			onCallback = arg_118_3
		})
	end

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		hideYes = true,
		hideNo = true,
		content = arg_118_0,
		custom = var_118_1,
		weight = LayerWeightConst.TOP_LAYER
	})
end

function openDestroyEquip()
	if pg.m02:hasMediator(EquipmentMediator.__cname) then
		local var_119_0 = getProxy(ContextProxy):getCurrentContext():getContextByMediator(EquipmentMediator)

		if var_119_0 and var_119_0.data.shipId then
			pg.m02:sendNotification(GAME.REMOVE_LAYERS, {
				context = var_119_0
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
		local var_120_0 = getProxy(ContextProxy):getCurrentContext():getContextByMediator(EquipmentMediator)

		if var_120_0 and var_120_0.data.shipId then
			pg.m02:sendNotification(GAME.REMOVE_LAYERS, {
				context = var_120_0
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
		onClick = function(arg_123_0, arg_123_1)
			pg.m02:sendNotification(GAME.GO_SCENE, SCENE.SHIPINFO, {
				page = 3,
				shipId = arg_123_0.id,
				shipVOs = arg_123_1
			})
		end
	})
end

function GoShoppingMsgBox(arg_124_0, arg_124_1, arg_124_2)
	if arg_124_2 then
		local var_124_0 = ""

		for iter_124_0, iter_124_1 in ipairs(arg_124_2) do
			local var_124_1 = Item.getConfigData(iter_124_1[1])

			var_124_0 = var_124_0 .. i18n(iter_124_1[1] == 59001 and "text_noRes_info_tip" or "text_noRes_info_tip2", var_124_1.name, iter_124_1[2])

			if iter_124_0 < #arg_124_2 then
				var_124_0 = var_124_0 .. i18n("text_noRes_info_tip_link")
			end
		end

		if var_124_0 ~= "" then
			arg_124_0 = arg_124_0 .. "\n" .. i18n("text_noRes_tip", var_124_0)
		end
	end

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		content = arg_124_0,
		weight = LayerWeightConst.SECOND_LAYER,
		onYes = function()
			gotoChargeScene(arg_124_1, arg_124_2)
		end
	})
end

function shoppingBatch(arg_126_0, arg_126_1, arg_126_2, arg_126_3, arg_126_4)
	local var_126_0 = pg.shop_template[arg_126_0]

	assert(var_126_0, "shop_template中找不到商品id：" .. arg_126_0)

	local var_126_1 = getProxy(PlayerProxy):getData()[id2res(var_126_0.resource_type)]
	local var_126_2 = arg_126_1.price or var_126_0.resource_num
	local var_126_3 = math.floor(var_126_1 / var_126_2)

	var_126_3 = var_126_3 <= 0 and 1 or var_126_3
	var_126_3 = arg_126_2 ~= nil and arg_126_2 < var_126_3 and arg_126_2 or var_126_3

	local var_126_4 = true
	local var_126_5 = 1

	if var_126_0 ~= nil and arg_126_1.id then
		print(var_126_3 * var_126_0.num, "--", var_126_3)
		assert(Item.getConfigData(arg_126_1.id), "item config should be existence")

		local var_126_6 = Item.New({
			id = arg_126_1.id
		}):getConfig("name")

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			needCounter = true,
			type = MSGBOX_TYPE_SINGLE_ITEM,
			drop = {
				type = DROP_TYPE_ITEM,
				id = arg_126_1.id
			},
			addNum = var_126_0.num,
			maxNum = var_126_3 * var_126_0.num,
			defaultNum = var_126_0.num,
			numUpdate = function(arg_127_0, arg_127_1)
				var_126_5 = math.floor(arg_127_1 / var_126_0.num)

				local var_127_0 = var_126_5 * var_126_2

				if var_127_0 > var_126_1 then
					setText(arg_127_0, i18n(arg_126_3, var_127_0, arg_127_1, COLOR_RED, var_126_6))

					var_126_4 = false
				else
					setText(arg_127_0, i18n(arg_126_3, var_127_0, arg_127_1, COLOR_GREEN, var_126_6))

					var_126_4 = true
				end
			end,
			onYes = function()
				if var_126_4 then
					pg.m02:sendNotification(GAME.SHOPPING, {
						id = arg_126_0,
						count = var_126_5
					})
				elseif arg_126_4 then
					pg.TipsMgr.GetInstance():ShowTips(i18n(arg_126_4))
				else
					pg.TipsMgr.GetInstance():ShowTips(i18n("main_playerInfoLayer_error_changeNameNoGem"))
				end
			end
		})
	end
end

function gotoChargeScene(arg_129_0, arg_129_1)
	local var_129_0 = getProxy(ContextProxy)
	local var_129_1 = getProxy(ContextProxy):getCurrentContext()

	if instanceof(var_129_1.mediator, ChargeMediator) then
		var_129_1.mediator:getViewComponent():switchSubViewByTogger(arg_129_0)
	else
		pg.m02:sendNotification(GAME.GO_SCENE, SCENE.CHARGE, {
			wrap = arg_129_0 or ChargeScene.TYPE_ITEM,
			noRes = arg_129_1
		})
	end
end

function clearDrop(arg_130_0)
	local var_130_0 = findTF(arg_130_0, "icon_bg")
	local var_130_1 = findTF(arg_130_0, "icon_bg/frame")
	local var_130_2 = findTF(arg_130_0, "icon_bg/icon")
	local var_130_3 = findTF(arg_130_0, "icon_bg/icon/icon")

	clearImageSprite(var_130_0)
	clearImageSprite(var_130_1)
	clearImageSprite(var_130_2)

	if var_130_3 then
		clearImageSprite(var_130_3)
	end
end

local var_0_7 = {
	red = Color.New(1, 0.25, 0.25),
	blue = Color.New(0.11, 0.55, 0.64),
	yellow = Color.New(0.92, 0.52, 0)
}

function updateSkill(arg_131_0, arg_131_1, arg_131_2, arg_131_3)
	local var_131_0 = findTF(arg_131_0, "skill")
	local var_131_1 = findTF(arg_131_0, "lock")
	local var_131_2 = findTF(arg_131_0, "unknown")

	if arg_131_1 then
		setActive(var_131_0, true)
		setActive(var_131_2, false)
		setActive(var_131_1, not arg_131_2)
		LoadImageSpriteAsync("skillicon/" .. arg_131_1.icon, findTF(var_131_0, "icon"))

		local var_131_3 = arg_131_1.color or "blue"

		setText(findTF(var_131_0, "name"), shortenString(getSkillName(arg_131_1.id), arg_131_3 or 8))

		local var_131_4 = findTF(var_131_0, "level")

		setText(var_131_4, "LEVEL: " .. (arg_131_2 and arg_131_2.level or "??"))
		setTextColor(var_131_4, var_0_7[var_131_3])
	else
		setActive(var_131_0, false)
		setActive(var_131_2, true)
		setActive(var_131_1, false)
	end
end

local var_0_8 = true

function onBackButton(arg_132_0, arg_132_1, arg_132_2, arg_132_3)
	local var_132_0 = GetOrAddComponent(arg_132_1, "UILongPressTrigger")

	assert(arg_132_2, "callback should exist")

	var_132_0.longPressThreshold = defaultValue(arg_132_3, 1)

	local function var_132_1(arg_133_0)
		return function()
			if var_0_8 then
				pg.CriMgr.GetInstance():PlaySoundEffect_V3(SOUND_BACK)
			end

			local var_134_0, var_134_1 = arg_132_2()

			if var_134_0 then
				arg_133_0(var_134_1)
			end
		end
	end

	local var_132_2 = var_132_0.onReleased

	pg.DelegateInfo.Add(arg_132_0, var_132_2)
	var_132_2:RemoveAllListeners()
	var_132_2:AddListener(var_132_1(function(arg_135_0)
		arg_135_0:emit(BaseUI.ON_BACK)
	end))

	local var_132_3 = var_132_0.onLongPressed

	pg.DelegateInfo.Add(arg_132_0, var_132_3)
	var_132_3:RemoveAllListeners()
	var_132_3:AddListener(var_132_1(function(arg_136_0)
		arg_136_0:emit(BaseUI.ON_HOME)
	end))
end

function GetZeroTime()
	return pg.TimeMgr.GetInstance():GetNextTime(0, 0, 0)
end

function GetHalfHour()
	return pg.TimeMgr.GetInstance():GetNextTime(0, 0, 0, 1800)
end

function GetNextHour(arg_139_0)
	local var_139_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_139_1, var_139_2 = pg.TimeMgr.GetInstance():parseTimeFrom(var_139_0)

	return var_139_1 * 86400 + (var_139_2 + arg_139_0) * 3600
end

function GetPerceptualSize(arg_140_0)
	local function var_140_0(arg_141_0)
		if not arg_141_0 then
			return 0, 1
		elseif arg_141_0 > 240 then
			return 4, 1
		elseif arg_141_0 > 225 then
			return 3, 1
		elseif arg_141_0 > 192 then
			return 2, 1
		elseif arg_141_0 < 126 then
			return 1, 0.5
		else
			return 1, 1
		end
	end

	if type(arg_140_0) == "number" then
		return var_140_0(arg_140_0)
	end

	local var_140_1 = 1
	local var_140_2 = 0
	local var_140_3 = 0
	local var_140_4 = #arg_140_0

	while var_140_1 <= var_140_4 do
		local var_140_5 = string.byte(arg_140_0, var_140_1)
		local var_140_6, var_140_7 = var_140_0(var_140_5)

		var_140_1 = var_140_1 + var_140_6
		var_140_2 = var_140_2 + var_140_7
	end

	return var_140_2
end

function shortenString(arg_142_0, arg_142_1)
	local var_142_0 = 1
	local var_142_1 = 0
	local var_142_2 = 0
	local var_142_3 = #arg_142_0

	while var_142_0 <= var_142_3 do
		local var_142_4 = string.byte(arg_142_0, var_142_0)
		local var_142_5, var_142_6 = GetPerceptualSize(var_142_4)

		var_142_0 = var_142_0 + var_142_5
		var_142_1 = var_142_1 + var_142_6

		if arg_142_1 <= math.ceil(var_142_1) then
			var_142_2 = var_142_0

			break
		end
	end

	if var_142_2 == 0 or var_142_3 < var_142_2 then
		return arg_142_0
	end

	return string.sub(arg_142_0, 1, var_142_2 - 1) .. ".."
end

function shouldShortenString(arg_143_0, arg_143_1)
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
		return false
	end

	return true
end

function nameValidityCheck(arg_144_0, arg_144_1, arg_144_2, arg_144_3)
	local var_144_0 = true
	local var_144_1, var_144_2 = utf8_to_unicode(arg_144_0)
	local var_144_3 = filterEgyUnicode(filterSpecChars(arg_144_0))
	local var_144_4 = wordVer(arg_144_0)

	if not checkSpaceValid(arg_144_0) then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_144_3[1]))

		var_144_0 = false
	elseif var_144_4 > 0 or var_144_3 ~= arg_144_0 then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_144_3[4]))

		var_144_0 = false
	elseif var_144_2 < arg_144_1 then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_144_3[2]))

		var_144_0 = false
	elseif arg_144_2 < var_144_2 then
		pg.TipsMgr.GetInstance():ShowTips(i18n(arg_144_3[3]))

		var_144_0 = false
	end

	return var_144_0
end

function checkSpaceValid(arg_145_0)
	if PLATFORM_CODE == PLATFORM_US then
		return true
	end

	local var_145_0 = string.gsub(arg_145_0, " ", "")

	return arg_145_0 == string.gsub(var_145_0, "　", "")
end

function filterSpecChars(arg_146_0)
	local var_146_0 = {}
	local var_146_1 = 0
	local var_146_2 = 0
	local var_146_3 = 0
	local var_146_4 = 1

	while var_146_4 <= #arg_146_0 do
		local var_146_5 = string.byte(arg_146_0, var_146_4)

		if not var_146_5 then
			break
		end

		if var_146_5 >= 48 and var_146_5 <= 57 or var_146_5 >= 65 and var_146_5 <= 90 or var_146_5 == 95 or var_146_5 >= 97 and var_146_5 <= 122 then
			table.insert(var_146_0, string.char(var_146_5))
		elseif var_146_5 >= 228 and var_146_5 <= 233 then
			local var_146_6 = string.byte(arg_146_0, var_146_4 + 1)
			local var_146_7 = string.byte(arg_146_0, var_146_4 + 2)

			if var_146_6 and var_146_7 and var_146_6 >= 128 and var_146_6 <= 191 and var_146_7 >= 128 and var_146_7 <= 191 then
				var_146_4 = var_146_4 + 2

				table.insert(var_146_0, string.char(var_146_5, var_146_6, var_146_7))

				var_146_1 = var_146_1 + 1
			end
		elseif var_146_5 == 45 or var_146_5 == 40 or var_146_5 == 41 then
			table.insert(var_146_0, string.char(var_146_5))
		elseif var_146_5 == 194 then
			local var_146_8 = string.byte(arg_146_0, var_146_4 + 1)

			if var_146_8 == 183 then
				var_146_4 = var_146_4 + 1

				table.insert(var_146_0, string.char(var_146_5, var_146_8))

				var_146_1 = var_146_1 + 1
			end
		elseif var_146_5 == 239 then
			local var_146_9 = string.byte(arg_146_0, var_146_4 + 1)
			local var_146_10 = string.byte(arg_146_0, var_146_4 + 2)

			if var_146_9 == 188 and (var_146_10 == 136 or var_146_10 == 137) then
				var_146_4 = var_146_4 + 2

				table.insert(var_146_0, string.char(var_146_5, var_146_9, var_146_10))

				var_146_1 = var_146_1 + 1
			end
		elseif var_146_5 == 206 or var_146_5 == 207 then
			local var_146_11 = string.byte(arg_146_0, var_146_4 + 1)

			if var_146_5 == 206 and var_146_11 >= 177 or var_146_5 == 207 and var_146_11 <= 134 then
				var_146_4 = var_146_4 + 1

				table.insert(var_146_0, string.char(var_146_5, var_146_11))

				var_146_1 = var_146_1 + 1
			end
		elseif var_146_5 == 227 and PLATFORM_CODE == PLATFORM_JP then
			local var_146_12 = string.byte(arg_146_0, var_146_4 + 1)
			local var_146_13 = string.byte(arg_146_0, var_146_4 + 2)

			if var_146_12 and var_146_13 and var_146_12 > 128 and var_146_12 <= 191 and var_146_13 >= 128 and var_146_13 <= 191 then
				var_146_4 = var_146_4 + 2

				table.insert(var_146_0, string.char(var_146_5, var_146_12, var_146_13))

				var_146_2 = var_146_2 + 1
			end
		elseif var_146_5 >= 224 and PLATFORM_CODE == PLATFORM_KR then
			local var_146_14 = string.byte(arg_146_0, var_146_4 + 1)
			local var_146_15 = string.byte(arg_146_0, var_146_4 + 2)

			if var_146_14 and var_146_15 and var_146_14 >= 128 and var_146_14 <= 191 and var_146_15 >= 128 and var_146_15 <= 191 then
				var_146_4 = var_146_4 + 2

				table.insert(var_146_0, string.char(var_146_5, var_146_14, var_146_15))

				var_146_3 = var_146_3 + 1
			end
		elseif PLATFORM_CODE == PLATFORM_US then
			if var_146_4 ~= 1 and var_146_5 == 32 and string.byte(arg_146_0, var_146_4 + 1) ~= 32 then
				table.insert(var_146_0, string.char(var_146_5))
			end

			if var_146_5 >= 192 and var_146_5 <= 223 then
				local var_146_16 = string.byte(arg_146_0, var_146_4 + 1)

				var_146_4 = var_146_4 + 1

				if var_146_5 == 194 and var_146_16 and var_146_16 >= 128 then
					table.insert(var_146_0, string.char(var_146_5, var_146_16))
				elseif var_146_5 == 195 and var_146_16 and var_146_16 <= 191 then
					table.insert(var_146_0, string.char(var_146_5, var_146_16))
				end
			end
		end

		var_146_4 = var_146_4 + 1
	end

	return table.concat(var_146_0), var_146_1 + var_146_2 + var_146_3
end

function filterEgyUnicode(arg_147_0)
	arg_147_0 = string.gsub(arg_147_0, "\xF0\x93[\x80-\x8F][\x80-\xBF]", "")
	arg_147_0 = string.gsub(arg_147_0, "\xF0\x93\x90[\x80-\xAF]", "")

	return arg_147_0
end

function shiftPanel(arg_148_0, arg_148_1, arg_148_2, arg_148_3, arg_148_4, arg_148_5, arg_148_6, arg_148_7, arg_148_8)
	arg_148_3 = arg_148_3 or 0.2

	if arg_148_5 then
		LeanTween.cancel(go(arg_148_0))
	end

	local var_148_0 = rtf(arg_148_0)

	arg_148_1 = arg_148_1 or var_148_0.anchoredPosition.x
	arg_148_2 = arg_148_2 or var_148_0.anchoredPosition.y

	local var_148_1 = LeanTween.move(var_148_0, Vector3(arg_148_1, arg_148_2, 0), arg_148_3)

	arg_148_7 = arg_148_7 or LeanTweenType.easeInOutSine

	var_148_1:setEase(arg_148_7)

	if arg_148_4 then
		var_148_1:setDelay(arg_148_4)
	end

	if arg_148_6 then
		GetOrAddComponent(arg_148_0, "CanvasGroup").blocksRaycasts = false
	end

	var_148_1:setOnComplete(System.Action(function()
		if arg_148_8 then
			arg_148_8()
		end

		if arg_148_6 then
			GetOrAddComponent(arg_148_0, "CanvasGroup").blocksRaycasts = true
		end
	end))

	return var_148_1
end

function TweenValue(arg_150_0, arg_150_1, arg_150_2, arg_150_3, arg_150_4, arg_150_5, arg_150_6, arg_150_7)
	local var_150_0 = LeanTween.value(go(arg_150_0), arg_150_1, arg_150_2, arg_150_3):setOnUpdate(System.Action_float(function(arg_151_0)
		if arg_150_5 then
			arg_150_5(arg_151_0)
		end
	end)):setOnComplete(System.Action(function()
		if arg_150_6 then
			arg_150_6()
		end
	end)):setDelay(arg_150_4 or 0)

	if arg_150_7 and arg_150_7 > 0 then
		var_150_0:setRepeat(arg_150_7)
	end

	return var_150_0
end

function rotateAni(arg_153_0, arg_153_1, arg_153_2)
	return LeanTween.rotate(rtf(arg_153_0), 360 * arg_153_1, arg_153_2):setLoopClamp()
end

function blinkAni(arg_154_0, arg_154_1, arg_154_2, arg_154_3)
	return LeanTween.alpha(rtf(arg_154_0), arg_154_3 or 0, arg_154_1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong(arg_154_2 or 0)
end

function scaleAni(arg_155_0, arg_155_1, arg_155_2, arg_155_3)
	return LeanTween.scale(rtf(arg_155_0), arg_155_3 or 0, arg_155_1):setLoopPingPong(arg_155_2 or 0)
end

function floatAni(arg_156_0, arg_156_1, arg_156_2, arg_156_3)
	local var_156_0 = arg_156_0.localPosition.y + arg_156_1

	return LeanTween.moveY(rtf(arg_156_0), var_156_0, arg_156_2):setLoopPingPong(arg_156_3 or 0)
end

local var_0_9 = tostring

function tostring(arg_157_0)
	if arg_157_0 == nil then
		return "nil"
	end

	local var_157_0 = var_0_9(arg_157_0)

	if var_157_0 == nil then
		if type(arg_157_0) == "table" then
			return "{}"
		end

		return " ~nil"
	end

	return var_157_0
end

function wordVer(arg_158_0, arg_158_1)
	if arg_158_0.match(arg_158_0, ChatConst.EmojiCodeMatch) then
		return 0, arg_158_0
	end

	arg_158_1 = arg_158_1 or {}

	local var_158_0 = filterEgyUnicode(arg_158_0)

	if #var_158_0 ~= #arg_158_0 then
		if arg_158_1.isReplace then
			arg_158_0 = var_158_0
		else
			return 1
		end
	end

	local var_158_1 = wordSplit(arg_158_0)
	local var_158_2 = pg.word_template
	local var_158_3 = pg.word_legal_template

	arg_158_1.isReplace = arg_158_1.isReplace or false
	arg_158_1.replaceWord = arg_158_1.replaceWord or "*"

	local var_158_4 = #var_158_1
	local var_158_5 = 1
	local var_158_6 = ""
	local var_158_7 = 0

	while var_158_5 <= var_158_4 do
		local var_158_8, var_158_9, var_158_10 = wordLegalMatch(var_158_1, var_158_3, var_158_5)

		if var_158_8 then
			var_158_5 = var_158_9
			var_158_6 = var_158_6 .. var_158_10
		else
			local var_158_11, var_158_12, var_158_13 = wordVerMatch(var_158_1, var_158_2, arg_158_1, var_158_5, "", false, var_158_5, "")

			if var_158_11 then
				var_158_5 = var_158_12
				var_158_7 = var_158_7 + 1

				if arg_158_1.isReplace then
					var_158_6 = var_158_6 .. var_158_13
				end
			else
				if arg_158_1.isReplace then
					var_158_6 = var_158_6 .. var_158_1[var_158_5]
				end

				var_158_5 = var_158_5 + 1
			end
		end
	end

	if arg_158_1.isReplace then
		return var_158_7, var_158_6
	else
		return var_158_7
	end
end

function wordLegalMatch(arg_159_0, arg_159_1, arg_159_2, arg_159_3, arg_159_4)
	if arg_159_2 > #arg_159_0 then
		return arg_159_3, arg_159_2, arg_159_4
	end

	local var_159_0 = arg_159_0[arg_159_2]
	local var_159_1 = arg_159_1[var_159_0]

	arg_159_4 = arg_159_4 == nil and "" or arg_159_4

	if var_159_1 then
		if var_159_1.this then
			return wordLegalMatch(arg_159_0, var_159_1, arg_159_2 + 1, true, arg_159_4 .. var_159_0)
		else
			return wordLegalMatch(arg_159_0, var_159_1, arg_159_2 + 1, false, arg_159_4 .. var_159_0)
		end
	else
		return arg_159_3, arg_159_2, arg_159_4
	end
end

local var_0_10 = string.byte("a")
local var_0_11 = string.byte("z")
local var_0_12 = string.byte("A")
local var_0_13 = string.byte("Z")

local function var_0_14(arg_160_0)
	if not arg_160_0 then
		return arg_160_0
	end

	local var_160_0 = string.byte(arg_160_0)

	if var_160_0 > 128 then
		return
	end

	if var_160_0 >= var_0_10 and var_160_0 <= var_0_11 then
		return string.char(var_160_0 - 32)
	elseif var_160_0 >= var_0_12 and var_160_0 <= var_0_13 then
		return string.char(var_160_0 + 32)
	else
		return arg_160_0
	end
end

function wordVerMatch(arg_161_0, arg_161_1, arg_161_2, arg_161_3, arg_161_4, arg_161_5, arg_161_6, arg_161_7)
	if arg_161_3 > #arg_161_0 then
		return arg_161_5, arg_161_6, arg_161_7
	end

	local var_161_0 = arg_161_0[arg_161_3]
	local var_161_1 = arg_161_1[var_161_0]

	if var_161_1 then
		local var_161_2, var_161_3, var_161_4 = wordVerMatch(arg_161_0, var_161_1, arg_161_2, arg_161_3 + 1, arg_161_2.isReplace and arg_161_4 .. arg_161_2.replaceWord or arg_161_4, var_161_1.this or arg_161_5, var_161_1.this and arg_161_3 + 1 or arg_161_6, var_161_1.this and (arg_161_2.isReplace and arg_161_4 .. arg_161_2.replaceWord or arg_161_4) or arg_161_7)

		if var_161_2 then
			return var_161_2, var_161_3, var_161_4
		end
	end

	local var_161_5 = var_0_14(var_161_0)
	local var_161_6 = arg_161_1[var_161_5]

	if var_161_5 ~= var_161_0 and var_161_6 then
		local var_161_7, var_161_8, var_161_9 = wordVerMatch(arg_161_0, var_161_6, arg_161_2, arg_161_3 + 1, arg_161_2.isReplace and arg_161_4 .. arg_161_2.replaceWord or arg_161_4, var_161_6.this or arg_161_5, var_161_6.this and arg_161_3 + 1 or arg_161_6, var_161_6.this and (arg_161_2.isReplace and arg_161_4 .. arg_161_2.replaceWord or arg_161_4) or arg_161_7)

		if var_161_7 then
			return var_161_7, var_161_8, var_161_9
		end
	end

	return arg_161_5, arg_161_6, arg_161_7
end

function wordSplit(arg_162_0)
	local var_162_0 = {}

	for iter_162_0 in arg_162_0.gmatch(arg_162_0, "[\x01-\x7F\xC2-\xF4][\x80-\xBF]*") do
		var_162_0[#var_162_0 + 1] = iter_162_0
	end

	return var_162_0
end

function contentWrap(arg_163_0, arg_163_1, arg_163_2)
	local var_163_0 = LuaHelper.WrapContent(arg_163_0, arg_163_1, arg_163_2)

	return #var_163_0 ~= #arg_163_0, var_163_0
end

function cancelRich(arg_164_0)
	local var_164_0

	for iter_164_0 = 1, 20 do
		local var_164_1

		arg_164_0, var_164_1 = string.gsub(arg_164_0, "<([^>]*)>", "%1")

		if var_164_1 <= 0 then
			break
		end
	end

	return arg_164_0
end

function getSkillConfig(arg_165_0)
	local var_165_0 = require("GameCfg.buff.buff_" .. arg_165_0)

	if not var_165_0 then
		warning("找不到技能配置: " .. arg_165_0)

		return
	end

	local var_165_1 = Clone(var_165_0)

	var_165_1.name = getSkillName(arg_165_0)
	var_165_1.desc = HXSet.hxLan(var_165_1.desc)
	var_165_1.desc_get = HXSet.hxLan(var_165_1.desc_get)

	_.each(var_165_1, function(arg_166_0)
		arg_166_0.desc = HXSet.hxLan(arg_166_0.desc)
	end)

	return var_165_1
end

function getSkillName(arg_167_0)
	local var_167_0 = pg.skill_data_template[arg_167_0] or pg.skill_data_display[arg_167_0]

	if var_167_0 then
		return HXSet.hxLan(var_167_0.name)
	else
		return ""
	end
end

function getSkillDescGet(arg_168_0, arg_168_1)
	local var_168_0 = arg_168_1 and pg.skill_world_display[arg_168_0] and setmetatable({}, {
		__index = function(arg_169_0, arg_169_1)
			return pg.skill_world_display[arg_168_0][arg_169_1] or pg.skill_data_template[arg_168_0][arg_169_1]
		end
	}) or pg.skill_data_template[arg_168_0]

	if not var_168_0 then
		return ""
	end

	local var_168_1 = var_168_0.desc_get ~= "" and var_168_0.desc_get or var_168_0.desc

	for iter_168_0, iter_168_1 in pairs(var_168_0.desc_get_add) do
		local var_168_2 = setColorStr(iter_168_1[1], COLOR_GREEN)

		if iter_168_1[2] then
			var_168_2 = var_168_2 .. specialGSub(i18n("word_skill_desc_get"), "$1", setColorStr(iter_168_1[2], COLOR_GREEN))
		end

		var_168_1 = specialGSub(var_168_1, "$" .. iter_168_0, var_168_2)
	end

	return HXSet.hxLan(var_168_1)
end

function getSkillDescLearn(arg_170_0, arg_170_1, arg_170_2)
	local var_170_0 = arg_170_2 and pg.skill_world_display[arg_170_0] and setmetatable({}, {
		__index = function(arg_171_0, arg_171_1)
			return pg.skill_world_display[arg_170_0][arg_171_1] or pg.skill_data_template[arg_170_0][arg_171_1]
		end
	}) or pg.skill_data_template[arg_170_0]

	if not var_170_0 then
		return ""
	end

	local var_170_1 = var_170_0.desc

	if not var_170_0.desc_add then
		return HXSet.hxLan(var_170_1)
	end

	for iter_170_0, iter_170_1 in pairs(var_170_0.desc_add) do
		local var_170_2 = iter_170_1[arg_170_1][1]

		if iter_170_1[arg_170_1][2] then
			var_170_2 = var_170_2 .. specialGSub(i18n("word_skill_desc_learn"), "$1", iter_170_1[arg_170_1][2])
		end

		var_170_1 = specialGSub(var_170_1, "$" .. iter_170_0, setColorStr(var_170_2, COLOR_YELLOW))
	end

	return HXSet.hxLan(var_170_1)
end

function getSkillDesc(arg_172_0, arg_172_1, arg_172_2)
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
		local var_172_2 = setColorStr(iter_172_1[arg_172_1][1], COLOR_GREEN)

		var_172_1 = specialGSub(var_172_1, "$" .. iter_172_0, var_172_2)
	end

	return HXSet.hxLan(var_172_1)
end

function specialGSub(arg_174_0, arg_174_1, arg_174_2)
	arg_174_0 = string.gsub(arg_174_0, "<color=#", "<color=NNN")
	arg_174_0 = string.gsub(arg_174_0, "#", "")
	arg_174_2 = string.gsub(arg_174_2, "%%", "%%%%")
	arg_174_0 = string.gsub(arg_174_0, arg_174_1, arg_174_2)
	arg_174_0 = string.gsub(arg_174_0, "<color=NNN", "<color=#")

	return arg_174_0
end

function topAnimation(arg_175_0, arg_175_1, arg_175_2, arg_175_3, arg_175_4, arg_175_5)
	local var_175_0 = {}

	arg_175_4 = arg_175_4 or 0.27

	local var_175_1 = 0.05

	if arg_175_0 then
		local var_175_2 = arg_175_0.transform.localPosition.x

		setAnchoredPosition(arg_175_0, {
			x = var_175_2 - 500
		})
		shiftPanel(arg_175_0, var_175_2, nil, 0.05, arg_175_4, true, true)
		setActive(arg_175_0, true)
	end

	setActive(arg_175_1, false)
	setActive(arg_175_2, false)
	setActive(arg_175_3, false)

	for iter_175_0 = 1, 3 do
		table.insert(var_175_0, LeanTween.delayedCall(arg_175_4 + 0.13 + var_175_1 * iter_175_0, System.Action(function()
			if arg_175_1 then
				setActive(arg_175_1, not arg_175_1.gameObject.activeSelf)
			end
		end)).uniqueId)
		table.insert(var_175_0, LeanTween.delayedCall(arg_175_4 + 0.02 + var_175_1 * iter_175_0, System.Action(function()
			if arg_175_2 then
				setActive(arg_175_2, not go(arg_175_2).activeSelf)
			end

			if arg_175_2 then
				setActive(arg_175_3, not go(arg_175_3).activeSelf)
			end
		end)).uniqueId)
	end

	if arg_175_5 then
		table.insert(var_175_0, LeanTween.delayedCall(arg_175_4 + 0.13 + var_175_1 * 3 + 0.1, System.Action(function()
			arg_175_5()
		end)).uniqueId)
	end

	return var_175_0
end

function cancelTweens(arg_179_0)
	assert(arg_179_0, "must provide cancel targets, LeanTween.cancelAll is not allow")

	for iter_179_0, iter_179_1 in ipairs(arg_179_0) do
		if iter_179_1 then
			LeanTween.cancel(iter_179_1)
		end
	end
end

function getOfflineTimeStamp(arg_180_0)
	local var_180_0 = pg.TimeMgr.GetInstance():GetServerTime() - arg_180_0
	local var_180_1 = ""

	if var_180_0 <= 59 then
		var_180_1 = i18n("just_now")
	elseif var_180_0 <= 3599 then
		var_180_1 = i18n("several_minutes_before", math.floor(var_180_0 / 60))
	elseif var_180_0 <= 86399 then
		var_180_1 = i18n("several_hours_before", math.floor(var_180_0 / 3600))
	else
		var_180_1 = i18n("several_days_before", math.floor(var_180_0 / 86400))
	end

	return var_180_1
end

function playMovie(arg_181_0, arg_181_1, arg_181_2)
	local var_181_0 = GameObject.Find("OverlayCamera/Overlay/UITop/MoviePanel")

	if not IsNil(var_181_0) then
		pg.UIMgr.GetInstance():LoadingOn()
		WWWLoader.Inst:LoadStreamingAsset(arg_181_0, function(arg_182_0)
			pg.UIMgr.GetInstance():LoadingOff()

			local var_182_0 = GCHandle.Alloc(arg_182_0, GCHandleType.Pinned)

			setActive(var_181_0, true)

			local var_182_1 = var_181_0:AddComponent(typeof(CriManaMovieControllerForUI))

			var_182_1.player:SetData(arg_182_0, arg_182_0.Length)

			var_182_1.target = var_181_0:GetComponent(typeof(Image))
			var_182_1.loop = false
			var_182_1.additiveMode = false
			var_182_1.playOnStart = true

			local var_182_2

			var_182_2 = Timer.New(function()
				if var_182_1.player.status == CriMana.Player.Status.PlayEnd or var_182_1.player.status == CriMana.Player.Status.Stop or var_182_1.player.status == CriMana.Player.Status.Error then
					var_182_2:Stop()
					Object.Destroy(var_182_1)
					GCHandle.Free(var_182_0)
					setActive(var_181_0, false)

					if arg_181_1 then
						arg_181_1()
					end
				end
			end, 0.2, -1)

			var_182_2:Start()
			removeOnButton(var_181_0)

			if arg_181_2 then
				onButton(nil, var_181_0, function()
					var_182_1:Stop()
					GetOrAddComponent(var_181_0, typeof(Button)).onClick:RemoveAllListeners()
				end, SFX_CANCEL)
			end
		end)
	elseif arg_181_1 then
		arg_181_1()
	end
end

PaintCameraAdjustOn = false

function cameraPaintViewAdjust(arg_185_0)
	if PaintCameraAdjustOn ~= arg_185_0 then
		local var_185_0 = GameObject.Find("UICamera/Canvas"):GetComponent(typeof(CanvasScaler))

		if arg_185_0 then
			CameraMgr.instance.AutoAdapt = false

			CameraMgr.instance:Revert()

			var_185_0.screenMatchMode = CanvasScaler.ScreenMatchMode.MatchWidthOrHeight
			var_185_0.matchWidthOrHeight = 1
		else
			CameraMgr.instance.AutoAdapt = true
			CameraMgr.instance.CurrentWidth = 1
			CameraMgr.instance.CurrentHeight = 1
			CameraMgr.instance.AspectRatio = 1.7777777777777777
			var_185_0.screenMatchMode = CanvasScaler.ScreenMatchMode.Expand
		end

		PaintCameraAdjustOn = arg_185_0
	end
end

function ManhattonDist(arg_186_0, arg_186_1)
	return math.abs(arg_186_0.row - arg_186_1.row) + math.abs(arg_186_0.column - arg_186_1.column)
end

function checkFirstHelpShow(arg_187_0)
	local var_187_0 = getProxy(SettingsProxy)

	if not var_187_0:checkReadHelp(arg_187_0) then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip[arg_187_0].tip
		})
		var_187_0:recordReadHelp(arg_187_0)
	end
end

preOrientation = nil
preNotchFitterEnabled = false

function openPortrait(arg_188_0)
	enableNotch(arg_188_0, true)

	preOrientation = Input.deviceOrientation:ToString()

	originalPrint("Begining Orientation:" .. preOrientation)

	Screen.autorotateToPortrait = true
	Screen.autorotateToPortraitUpsideDown = true

	cameraPaintViewAdjust(true)
end

function closePortrait(arg_189_0)
	enableNotch(arg_189_0, false)

	Screen.autorotateToPortrait = false
	Screen.autorotateToPortraitUpsideDown = false

	originalPrint("Closing Orientation:" .. preOrientation)

	Screen.orientation = ScreenOrientation.LandscapeLeft

	local var_189_0 = Timer.New(function()
		Screen.orientation = ScreenOrientation.AutoRotation
	end, 0.2, 1):Start()

	cameraPaintViewAdjust(false)
end

function enableNotch(arg_191_0, arg_191_1)
	if arg_191_0 == nil then
		return
	end

	local var_191_0 = arg_191_0:GetComponent("NotchAdapt")
	local var_191_1 = arg_191_0:GetComponent("AspectRatioFitter")

	var_191_0.enabled = arg_191_1

	if var_191_1 then
		if arg_191_1 then
			var_191_1.enabled = preNotchFitterEnabled
		else
			preNotchFitterEnabled = var_191_1.enabled
			var_191_1.enabled = false
		end
	end
end

function comma_value(arg_192_0)
	local var_192_0 = arg_192_0
	local var_192_1 = 0

	repeat
		local var_192_2

		var_192_0, var_192_2 = string.gsub(var_192_0, "^(-?%d+)(%d%d%d)", "%1,%2")
	until var_192_2 == 0

	return var_192_0
end

local var_0_15 = 0.2

function SwitchPanel(arg_193_0, arg_193_1, arg_193_2, arg_193_3, arg_193_4, arg_193_5)
	arg_193_3 = defaultValue(arg_193_3, var_0_15)

	if arg_193_5 then
		LeanTween.cancel(go(arg_193_0))
	end

	local var_193_0 = Vector3.New(tf(arg_193_0).localPosition.x, tf(arg_193_0).localPosition.y, tf(arg_193_0).localPosition.z)

	if arg_193_1 then
		var_193_0.x = arg_193_1
	end

	if arg_193_2 then
		var_193_0.y = arg_193_2
	end

	local var_193_1 = LeanTween.move(rtf(arg_193_0), var_193_0, arg_193_3):setEase(LeanTweenType.easeInOutSine)

	if arg_193_4 then
		var_193_1:setDelay(arg_193_4)
	end

	return var_193_1
end

function updateActivityTaskStatus(arg_194_0)
	local var_194_0 = arg_194_0:getConfig("config_id")
	local var_194_1, var_194_2 = getActivityTask(arg_194_0, true)

	if not var_194_2 then
		pg.m02:sendNotification(GAME.ACTIVITY_OPERATION, {
			cmd = 1,
			activity_id = arg_194_0.id
		})

		return true
	end

	return false
end

function updateCrusingActivityTask(arg_195_0)
	local var_195_0 = getProxy(TaskProxy)
	local var_195_1 = arg_195_0:getNDay()

	for iter_195_0, iter_195_1 in ipairs(arg_195_0:getConfig("config_data")) do
		local var_195_2 = pg.battlepass_task_group[iter_195_1]

		if var_195_1 >= var_195_2.time and underscore.any(underscore.flatten(var_195_2.task_group), function(arg_196_0)
			return var_195_0:getTaskVO(arg_196_0) == nil
		end) then
			pg.m02:sendNotification(GAME.CRUSING_CMD, {
				cmd = 1,
				activity_id = arg_195_0.id
			})

			return true
		end
	end

	return false
end

function setShipCardFrame(arg_197_0, arg_197_1, arg_197_2)
	arg_197_0.localScale = Vector3.one
	arg_197_0.anchorMin = Vector2.zero
	arg_197_0.anchorMax = Vector2.one

	local var_197_0 = arg_197_2 or arg_197_1

	GetImageSpriteFromAtlasAsync("shipframe", var_197_0, arg_197_0)

	local var_197_1 = pg.frame_resource[var_197_0]

	if var_197_1 then
		local var_197_2 = var_197_1.param

		arg_197_0.offsetMin = Vector2(var_197_2[1], var_197_2[2])
		arg_197_0.offsetMax = Vector2(var_197_2[3], var_197_2[4])
	else
		arg_197_0.offsetMin = Vector2.zero
		arg_197_0.offsetMax = Vector2.zero
	end
end

function setRectShipCardFrame(arg_198_0, arg_198_1, arg_198_2)
	arg_198_0.localScale = Vector3.one
	arg_198_0.anchorMin = Vector2.zero
	arg_198_0.anchorMax = Vector2.one

	setImageSprite(arg_198_0, GetSpriteFromAtlas("shipframeb", "b" .. (arg_198_2 or arg_198_1)))

	local var_198_0 = "b" .. (arg_198_2 or arg_198_1)
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

function setFrameEffect(arg_199_0, arg_199_1)
	if arg_199_1 then
		local var_199_0 = arg_199_1 .. "(Clone)"
		local var_199_1 = false

		eachChild(arg_199_0, function(arg_200_0)
			setActive(arg_200_0, arg_200_0.name == var_199_0)

			var_199_1 = var_199_1 or arg_200_0.name == var_199_0
		end)

		if not var_199_1 then
			LoadAndInstantiateAsync("effect", arg_199_1, function(arg_201_0)
				if IsNil(arg_199_0) or findTF(arg_199_0, var_199_0) then
					Object.Destroy(arg_201_0)
				else
					setParent(arg_201_0, arg_199_0)
					setActive(arg_201_0, true)
				end
			end)
		end
	end

	setActive(arg_199_0, arg_199_1)
end

function setProposeMarkIcon(arg_202_0, arg_202_1)
	local var_202_0 = arg_202_0:Find("proposeShipCard(Clone)")
	local var_202_1 = arg_202_1.propose and not arg_202_1:ShowPropose()

	if var_202_0 then
		setActive(var_202_0, var_202_1)
	elseif var_202_1 then
		pg.PoolMgr.GetInstance():GetUI("proposeShipCard", true, function(arg_203_0)
			if IsNil(arg_202_0) or arg_202_0:Find("proposeShipCard(Clone)") then
				pg.PoolMgr.GetInstance():ReturnUI("proposeShipCard", arg_203_0)
			else
				setParent(arg_203_0, arg_202_0, false)
			end
		end)
	end
end

function flushShipCard(arg_204_0, arg_204_1)
	local var_204_0 = arg_204_1:rarity2bgPrint()
	local var_204_1 = findTF(arg_204_0, "content/bg")

	GetImageSpriteFromAtlasAsync("bg/star_level_card_" .. var_204_0, "", var_204_1)

	local var_204_2 = findTF(arg_204_0, "content/ship_icon")
	local var_204_3 = arg_204_1 and {
		"shipYardIcon/" .. arg_204_1:getPainting(),
		arg_204_1:getPainting()
	} or {
		"shipYardIcon/unknown",
		""
	}

	GetImageSpriteFromAtlasAsync(var_204_3[1], var_204_3[2], var_204_2)

	local var_204_4 = arg_204_1:getShipType()
	local var_204_5 = findTF(arg_204_0, "content/info/top/type")

	GetImageSpriteFromAtlasAsync("shiptype", shipType2print(var_204_4), var_204_5)
	setText(findTF(arg_204_0, "content/dockyard/lv/Text"), defaultValue(arg_204_1.level, 1))

	local var_204_6 = arg_204_1:getStar()
	local var_204_7 = arg_204_1:getMaxStar()
	local var_204_8 = findTF(arg_204_0, "content/front/stars")

	setActive(var_204_8, true)

	local var_204_9 = findTF(var_204_8, "star_tpl")
	local var_204_10 = var_204_8.childCount

	for iter_204_0 = 1, Ship.CONFIG_MAX_STAR do
		local var_204_11 = var_204_10 < iter_204_0 and cloneTplTo(var_204_9, var_204_8) or var_204_8:GetChild(iter_204_0 - 1)

		setActive(var_204_11, iter_204_0 <= var_204_7)
		triggerToggle(var_204_11, iter_204_0 <= var_204_6)
	end

	local var_204_12 = findTF(arg_204_0, "content/front/frame")
	local var_204_13, var_204_14 = arg_204_1:GetFrameAndEffect()

	setShipCardFrame(var_204_12, var_204_0, var_204_13)
	setFrameEffect(findTF(arg_204_0, "content/front/bg_other"), var_204_14)
	setProposeMarkIcon(arg_204_0:Find("content/dockyard/propose"), arg_204_1)
end

function TweenItemAlphaAndWhite(arg_205_0)
	LeanTween.cancel(arg_205_0)

	local var_205_0 = GetOrAddComponent(arg_205_0, "CanvasGroup")

	var_205_0.alpha = 0

	LeanTween.alphaCanvas(var_205_0, 1, 0.2):setUseEstimatedTime(true)

	local var_205_1 = findTF(arg_205_0.transform, "white_mask")

	if var_205_1 then
		setActive(var_205_1, false)
	end
end

function ClearTweenItemAlphaAndWhite(arg_206_0)
	LeanTween.cancel(arg_206_0)

	GetOrAddComponent(arg_206_0, "CanvasGroup").alpha = 0
end

function getGroupOwnSkins(arg_207_0)
	local var_207_0 = {}
	local var_207_1 = getProxy(ShipSkinProxy):getSkinList()
	local var_207_2 = getProxy(CollectionProxy):getShipGroup(arg_207_0)

	if var_207_2 then
		local var_207_3 = ShipGroup.getSkinList(arg_207_0)

		for iter_207_0, iter_207_1 in ipairs(var_207_3) do
			if iter_207_1.skin_type == ShipSkin.SKIN_TYPE_DEFAULT or table.contains(var_207_1, iter_207_1.id) or iter_207_1.skin_type == ShipSkin.SKIN_TYPE_REMAKE and var_207_2.trans or iter_207_1.skin_type == ShipSkin.SKIN_TYPE_PROPOSE and var_207_2.married == 1 then
				var_207_0[iter_207_1.id] = true
			end
		end
	end

	return var_207_0
end

function split(arg_208_0, arg_208_1)
	local var_208_0 = {}

	if not arg_208_0 then
		return nil
	end

	local var_208_1 = #arg_208_0
	local var_208_2 = 1

	while var_208_2 <= var_208_1 do
		local var_208_3 = string.find(arg_208_0, arg_208_1, var_208_2)

		if var_208_3 == nil then
			table.insert(var_208_0, string.sub(arg_208_0, var_208_2, var_208_1))

			break
		end

		table.insert(var_208_0, string.sub(arg_208_0, var_208_2, var_208_3 - 1))

		if var_208_3 == var_208_1 then
			table.insert(var_208_0, "")

			break
		end

		var_208_2 = var_208_3 + 1
	end

	return var_208_0
end

function NumberToChinese(arg_209_0, arg_209_1)
	local var_209_0 = ""
	local var_209_1 = #arg_209_0

	for iter_209_0 = 1, var_209_1 do
		local var_209_2 = string.sub(arg_209_0, iter_209_0, iter_209_0)

		if var_209_2 ~= "0" or var_209_2 == "0" and not arg_209_1 then
			if arg_209_1 then
				if var_209_1 >= 2 then
					if iter_209_0 == 1 then
						if var_209_2 == "1" then
							var_209_0 = i18n("number_" .. 10)
						else
							var_209_0 = i18n("number_" .. var_209_2) .. i18n("number_" .. 10)
						end
					else
						var_209_0 = var_209_0 .. i18n("number_" .. var_209_2)
					end
				else
					var_209_0 = var_209_0 .. i18n("number_" .. var_209_2)
				end
			else
				var_209_0 = var_209_0 .. i18n("number_" .. var_209_2)
			end
		end
	end

	return var_209_0
end

function getActivityTask(arg_210_0, arg_210_1)
	local var_210_0 = getProxy(TaskProxy)
	local var_210_1 = arg_210_0:getConfig("config_data")
	local var_210_2 = arg_210_0:getNDay(arg_210_0.data1)
	local var_210_3
	local var_210_4
	local var_210_5

	for iter_210_0 = math.max(arg_210_0.data3, 1), math.min(var_210_2, #var_210_1) do
		local var_210_6 = _.flatten({
			var_210_1[iter_210_0]
		})

		for iter_210_1, iter_210_2 in ipairs(var_210_6) do
			local var_210_7 = var_210_0:getTaskById(iter_210_2)

			if var_210_7 then
				return var_210_7.id, var_210_7
			end

			if var_210_4 then
				var_210_5 = var_210_0:getFinishTaskById(iter_210_2)

				if var_210_5 then
					var_210_4 = var_210_5
				elseif arg_210_1 then
					return iter_210_2
				else
					return var_210_4.id, var_210_4
				end
			else
				var_210_4 = var_210_0:getFinishTaskById(iter_210_2)
				var_210_5 = var_210_5 or iter_210_2
			end
		end
	end

	if var_210_4 then
		return var_210_4.id, var_210_4
	else
		return var_210_5
	end
end

function setImageFromImage(arg_211_0, arg_211_1, arg_211_2)
	local var_211_0 = GetComponent(arg_211_0, "Image")

	var_211_0.sprite = GetComponent(arg_211_1, "Image").sprite

	if arg_211_2 then
		var_211_0:SetNativeSize()
	end
end

function skinTimeStamp(arg_212_0)
	local var_212_0, var_212_1, var_212_2, var_212_3 = pg.TimeMgr.GetInstance():parseTimeFrom(arg_212_0)

	if var_212_0 >= 1 then
		return i18n("limit_skin_time_day", var_212_0)
	elseif var_212_0 <= 0 and var_212_1 > 0 then
		return i18n("limit_skin_time_day_min", var_212_1, var_212_2)
	elseif var_212_0 <= 0 and var_212_1 <= 0 and (var_212_2 > 0 or var_212_3 > 0) then
		return i18n("limit_skin_time_min", math.max(var_212_2, 1))
	elseif var_212_0 <= 0 and var_212_1 <= 0 and var_212_2 <= 0 and var_212_3 <= 0 then
		return i18n("limit_skin_time_overtime")
	end
end

function skinCommdityTimeStamp(arg_213_0)
	local var_213_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_213_1 = math.max(arg_213_0 - var_213_0, 0)
	local var_213_2 = math.floor(var_213_1 / 86400)

	if var_213_2 > 0 then
		return i18n("time_remaining_tip") .. var_213_2 .. i18n("word_date")
	else
		local var_213_3 = math.floor(var_213_1 / 3600)

		if var_213_3 > 0 then
			return i18n("time_remaining_tip") .. var_213_3 .. i18n("word_hour")
		else
			local var_213_4 = math.floor(var_213_1 / 60)

			if var_213_4 > 0 then
				return i18n("time_remaining_tip") .. var_213_4 .. i18n("word_minute")
			else
				return i18n("time_remaining_tip") .. var_213_1 .. i18n("word_second")
			end
		end
	end
end

function InstagramTimeStamp(arg_214_0)
	local var_214_0 = pg.TimeMgr.GetInstance():GetServerTime() - arg_214_0
	local var_214_1 = var_214_0 / 86400

	if var_214_1 > 1 then
		return i18n("ins_word_day", math.floor(var_214_1))
	else
		local var_214_2 = var_214_0 / 3600

		if var_214_2 > 1 then
			return i18n("ins_word_hour", math.floor(var_214_2))
		else
			local var_214_3 = var_214_0 / 60

			if var_214_3 > 1 then
				return i18n("ins_word_minu", math.floor(var_214_3))
			else
				return i18n("ins_word_minu", 1)
			end
		end
	end
end

function InstagramReplyTimeStamp(arg_215_0)
	local var_215_0 = pg.TimeMgr.GetInstance():GetServerTime() - arg_215_0
	local var_215_1 = var_215_0 / 86400

	if var_215_1 > 1 then
		return i18n1(math.floor(var_215_1) .. "d")
	else
		local var_215_2 = var_215_0 / 3600

		if var_215_2 > 1 then
			return i18n1(math.floor(var_215_2) .. "h")
		else
			local var_215_3 = var_215_0 / 60

			if var_215_3 > 1 then
				return i18n1(math.floor(var_215_3) .. "min")
			else
				return i18n1("1min")
			end
		end
	end
end

function attireTimeStamp(arg_216_0)
	local var_216_0, var_216_1, var_216_2, var_216_3 = pg.TimeMgr.GetInstance():parseTimeFrom(arg_216_0)

	if var_216_0 <= 0 and var_216_1 <= 0 and var_216_2 <= 0 and var_216_3 <= 0 then
		return i18n("limit_skin_time_overtime")
	else
		return i18n("attire_time_stamp", var_216_0, var_216_1, var_216_2)
	end
end

function checkExist(arg_217_0, ...)
	local var_217_0 = {
		...
	}

	for iter_217_0, iter_217_1 in ipairs(var_217_0) do
		if arg_217_0 == nil then
			break
		end

		assert(type(arg_217_0) == "table", "type error : intermediate target should be table")
		assert(type(iter_217_1) == "table", "type error : param should be table")

		if type(arg_217_0[iter_217_1[1]]) == "function" then
			arg_217_0 = arg_217_0[iter_217_1[1]](arg_217_0, unpack(iter_217_1[2] or {}))
		else
			arg_217_0 = arg_217_0[iter_217_1[1]]
		end
	end

	return arg_217_0
end

function AcessWithinNull(arg_218_0, arg_218_1)
	if arg_218_0 == nil then
		return
	end

	assert(type(arg_218_0) == "table")

	return arg_218_0[arg_218_1]
end

function showRepairMsgbox()
	local var_219_0 = {
		text = i18n("msgbox_repair"),
		onCallback = function()
			if PathMgr.FileExists(Application.persistentDataPath .. "/hashes.csv") then
				BundleWizard.Inst:GetGroupMgr("DEFAULT_RES"):StartVerifyForLua()
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("word_no_cache"))
			end
		end
	}
	local var_219_1 = {
		text = i18n("msgbox_repair_l2d"),
		onCallback = function()
			if PathMgr.FileExists(Application.persistentDataPath .. "/hashes-live2d.csv") then
				BundleWizard.Inst:GetGroupMgr("L2D"):StartVerifyForLua()
			else
				pg.TipsMgr.GetInstance():ShowTips(i18n("word_no_cache"))
			end
		end
	}
	local var_219_2 = {
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
			var_219_2,
			var_219_1,
			var_219_0
		}
	})
end

function resourceVerify(arg_223_0, arg_223_1)
	if CSharpVersion > 35 then
		BundleWizard.Inst:GetGroupMgr("DEFAULT_RES"):StartVerifyForLua()

		return
	end

	local var_223_0 = Application.persistentDataPath .. "/hashes.csv"
	local var_223_1
	local var_223_2 = PathMgr.ReadAllLines(var_223_0)
	local var_223_3 = {}

	if arg_223_0 then
		setActive(arg_223_0, true)
	else
		pg.UIMgr.GetInstance():LoadingOn()
	end

	local function var_223_4()
		if arg_223_0 then
			setActive(arg_223_0, false)
		else
			pg.UIMgr.GetInstance():LoadingOff()
		end

		print(var_223_1)

		if var_223_1 then
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

	local var_223_5 = var_223_2.Length
	local var_223_6

	local function var_223_7(arg_226_0)
		if arg_226_0 < 0 then
			var_223_4()

			return
		end

		if arg_223_1 then
			setSlider(arg_223_1, 0, var_223_5, var_223_5 - arg_226_0)
		end

		local var_226_0 = string.split(var_223_2[arg_226_0], ",")
		local var_226_1 = var_226_0[1]
		local var_226_2 = var_226_0[3]
		local var_226_3 = PathMgr.getAssetBundle(var_226_1)

		if PathMgr.FileExists(var_226_3) then
			local var_226_4 = PathMgr.ReadAllBytes(PathMgr.getAssetBundle(var_226_1))

			if var_226_2 == HashUtil.CalcMD5(var_226_4) then
				onNextTick(function()
					var_223_7(arg_226_0 - 1)
				end)

				return
			end
		end

		var_223_1 = var_226_1

		var_223_4()
	end

	var_223_7(var_223_5 - 1)
end

function splitByWordEN(arg_228_0, arg_228_1)
	local var_228_0 = string.split(arg_228_0, " ")
	local var_228_1 = ""
	local var_228_2 = ""
	local var_228_3 = arg_228_1:GetComponent(typeof(RectTransform))
	local var_228_4 = arg_228_1:GetComponent(typeof(Text))
	local var_228_5 = var_228_3.rect.width

	for iter_228_0, iter_228_1 in ipairs(var_228_0) do
		local var_228_6 = var_228_2

		var_228_2 = var_228_2 == "" and iter_228_1 or var_228_2 .. " " .. iter_228_1

		setText(arg_228_1, var_228_2)

		if var_228_5 < var_228_4.preferredWidth then
			var_228_1 = var_228_1 == "" and var_228_6 or var_228_1 .. "\n" .. var_228_6
			var_228_2 = iter_228_1
		end

		if iter_228_0 >= #var_228_0 then
			var_228_1 = var_228_1 == "" and var_228_2 or var_228_1 .. "\n" .. var_228_2
		end
	end

	return var_228_1
end

function checkBirthFormat(arg_229_0)
	if #arg_229_0 ~= 8 then
		return false
	end

	local var_229_0 = 0
	local var_229_1 = #arg_229_0

	while var_229_0 < var_229_1 do
		local var_229_2 = string.byte(arg_229_0, var_229_0 + 1)

		if var_229_2 < 48 or var_229_2 > 57 then
			return false
		end

		var_229_0 = var_229_0 + 1
	end

	return true
end

function isHalfBodyLive2D(arg_230_0)
	local var_230_0 = {
		"biaoqiang",
		"z23",
		"lafei",
		"lingbo",
		"mingshi",
		"xuefeng"
	}

	return _.any(var_230_0, function(arg_231_0)
		return arg_231_0 == arg_230_0
	end)
end

function GetServerState(arg_232_0)
	local var_232_0 = -1
	local var_232_1 = 0
	local var_232_2 = 1
	local var_232_3 = 2
	local var_232_4 = NetConst.GetServerStateUrl()

	if PLATFORM_CODE == PLATFORM_CH then
		var_232_4 = string.gsub(var_232_4, "https", "http")
	end

	VersionMgr.Inst:WebRequest(var_232_4, function(arg_233_0, arg_233_1)
		local var_233_0 = true
		local var_233_1 = false

		for iter_233_0 in string.gmatch(arg_233_1, "\"state\":%d") do
			if iter_233_0 ~= "\"state\":1" then
				var_233_0 = false
			end

			var_233_1 = true
		end

		if not var_233_1 then
			var_233_0 = false
		end

		if arg_232_0 ~= nil then
			arg_232_0(var_233_0 and var_232_2 or var_232_1)
		end
	end)
end

function setScrollText(arg_234_0, arg_234_1)
	GetOrAddComponent(arg_234_0, "ScrollText"):SetText(arg_234_1)
end

function changeToScrollText(arg_235_0, arg_235_1)
	local var_235_0 = GetComponent(arg_235_0, typeof(Text))

	assert(var_235_0, "without component<Text>")

	local var_235_1 = arg_235_0:Find("subText")

	if not var_235_1 then
		var_235_1 = cloneTplTo(arg_235_0, arg_235_0, "subText")

		eachChild(arg_235_0, function(arg_236_0)
			setActive(arg_236_0, arg_236_0 == var_235_1)
		end)

		arg_235_0:GetComponent(typeof(Text)).enabled = false
	end

	setScrollText(var_235_1, arg_235_1)
end

local var_0_16
local var_0_17
local var_0_18
local var_0_19

local function var_0_20(arg_237_0, arg_237_1, arg_237_2)
	local var_237_0 = arg_237_0:Find("base")
	local var_237_1, var_237_2, var_237_3 = Equipment.GetInfoTrans(arg_237_1, arg_237_2)

	if arg_237_1.nextValue then
		local var_237_4 = {
			name = arg_237_1.name,
			type = arg_237_1.type,
			value = arg_237_1.nextValue
		}
		local var_237_5, var_237_6 = Equipment.GetInfoTrans(var_237_4, arg_237_2)

		var_237_2 = var_237_2 .. setColorStr("   >   " .. var_237_6, COLOR_GREEN)
	end

	setText(var_237_0:Find("name"), var_237_1)

	if var_237_3 then
		local var_237_7 = "<color=#afff72>(+" .. ys.Battle.BattleConst.UltimateBonus.AuxBoostValue * 100 .. "%)</color>"

		setText(var_237_0:Find("value"), var_237_2 .. var_237_7)
	else
		setText(var_237_0:Find("value"), var_237_2)
	end

	setActive(var_237_0:Find("value/up"), arg_237_1.compare and arg_237_1.compare > 0)
	setActive(var_237_0:Find("value/down"), arg_237_1.compare and arg_237_1.compare < 0)
	triggerToggle(var_237_0, arg_237_1.lock_open)

	if not arg_237_1.lock_open and arg_237_1.sub and #arg_237_1.sub > 0 then
		GetComponent(var_237_0, typeof(Toggle)).enabled = true
	else
		setActive(var_237_0:Find("name/close"), false)
		setActive(var_237_0:Find("name/open"), false)

		GetComponent(var_237_0, typeof(Toggle)).enabled = false
	end
end

local function var_0_21(arg_238_0, arg_238_1, arg_238_2, arg_238_3)
	var_0_20(arg_238_0, arg_238_2, arg_238_3)

	if not arg_238_2.sub or #arg_238_2.sub == 0 then
		return
	end

	var_0_18(arg_238_0:Find("subs"), arg_238_1, arg_238_2.sub, arg_238_3)
end

function var_0_18(arg_239_0, arg_239_1, arg_239_2, arg_239_3)
	removeAllChildren(arg_239_0)
	var_0_19(arg_239_0, arg_239_1, arg_239_2, arg_239_3)
end

function var_0_19(arg_240_0, arg_240_1, arg_240_2, arg_240_3)
	for iter_240_0, iter_240_1 in ipairs(arg_240_2) do
		local var_240_0 = cloneTplTo(arg_240_1, arg_240_0)

		var_0_21(var_240_0, arg_240_1, iter_240_1, arg_240_3)
	end
end

function updateEquipInfo(arg_241_0, arg_241_1, arg_241_2, arg_241_3)
	local var_241_0 = arg_241_0:Find("attr_tpl")

	var_0_18(arg_241_0:Find("attrs"), var_241_0, arg_241_1.attrs, arg_241_3)
	setActive(arg_241_0:Find("skill"), arg_241_2)

	if arg_241_2 then
		var_0_21(arg_241_0:Find("skill/attr"), var_241_0, {
			name = i18n("skill"),
			value = setColorStr(arg_241_2.name, "#FFDE00FF")
		}, arg_241_3)
		setText(arg_241_0:Find("skill/value/Text"), getSkillDescGet(arg_241_2.id))
	end

	setActive(arg_241_0:Find("weapon"), #arg_241_1.weapon.sub > 0)

	if #arg_241_1.weapon.sub > 0 then
		var_0_18(arg_241_0:Find("weapon"), var_241_0, {
			arg_241_1.weapon
		}, arg_241_3)
	end

	setActive(arg_241_0:Find("equip_info"), #arg_241_1.equipInfo.sub > 0)

	if #arg_241_1.equipInfo.sub > 0 then
		var_0_18(arg_241_0:Find("equip_info"), var_241_0, {
			arg_241_1.equipInfo
		}, arg_241_3)
	end

	var_0_21(arg_241_0:Find("part/attr"), var_241_0, {
		name = i18n("equip_info_23")
	}, arg_241_3)

	local var_241_1 = arg_241_0:Find("part/value")
	local var_241_2 = var_241_1:Find("label")
	local var_241_3 = {}
	local var_241_4 = {}

	if #arg_241_1.part[1] == 0 and #arg_241_1.part[2] == 0 then
		setmetatable(var_241_3, {
			__index = function(arg_242_0, arg_242_1)
				return true
			end
		})
		setmetatable(var_241_4, {
			__index = function(arg_243_0, arg_243_1)
				return true
			end
		})
	else
		for iter_241_0, iter_241_1 in ipairs(arg_241_1.part[1]) do
			var_241_3[iter_241_1] = true
		end

		for iter_241_2, iter_241_3 in ipairs(arg_241_1.part[2]) do
			var_241_4[iter_241_3] = true
		end
	end

	local var_241_5 = ShipType.MergeFengFanType(ShipType.FilterOverQuZhuType(ShipType.AllShipType), var_241_3, var_241_4)

	UIItemList.StaticAlign(var_241_1, var_241_2, #var_241_5, function(arg_244_0, arg_244_1, arg_244_2)
		arg_244_1 = arg_244_1 + 1

		if arg_244_0 == UIItemList.EventUpdate then
			local var_244_0 = var_241_5[arg_244_1]

			GetImageSpriteFromAtlasAsync("shiptype", ShipType.Type2CNLabel(var_244_0), arg_244_2)
			setActive(arg_244_2:Find("main"), var_241_3[var_244_0] and not var_241_4[var_244_0])
			setActive(arg_244_2:Find("sub"), var_241_4[var_244_0] and not var_241_3[var_244_0])
			setImageAlpha(arg_244_2, not var_241_3[var_244_0] and not var_241_4[var_244_0] and 0.3 or 1)
		end
	end)
end

function updateEquipUpgradeInfo(arg_245_0, arg_245_1, arg_245_2)
	local var_245_0 = arg_245_0:Find("attr_tpl")

	var_0_18(arg_245_0:Find("attrs"), var_245_0, arg_245_1.attrs, arg_245_2)
	setActive(arg_245_0:Find("weapon"), #arg_245_1.weapon.sub > 0)

	if #arg_245_1.weapon.sub > 0 then
		var_0_18(arg_245_0:Find("weapon"), var_245_0, {
			arg_245_1.weapon
		}, arg_245_2)
	end

	setActive(arg_245_0:Find("equip_info"), #arg_245_1.equipInfo.sub > 0)

	if #arg_245_1.equipInfo.sub > 0 then
		var_0_18(arg_245_0:Find("equip_info"), var_245_0, {
			arg_245_1.equipInfo
		}, arg_245_2)
	end
end

function setCanvasOverrideSorting(arg_246_0, arg_246_1)
	local var_246_0 = arg_246_0.parent

	arg_246_0:SetParent(pg.LayerWeightMgr.GetInstance().uiOrigin, false)

	if isActive(arg_246_0) then
		GetOrAddComponent(arg_246_0, typeof(Canvas)).overrideSorting = arg_246_1
	else
		setActive(arg_246_0, true)

		GetOrAddComponent(arg_246_0, typeof(Canvas)).overrideSorting = arg_246_1

		setActive(arg_246_0, false)
	end

	arg_246_0:SetParent(var_246_0, false)
end

function createNewGameObject(arg_247_0, arg_247_1)
	local var_247_0 = GameObject.New()

	if arg_247_0 then
		var_247_0.name = "model"
	end

	var_247_0.layer = arg_247_1 or Layer.UI

	return GetOrAddComponent(var_247_0, "RectTransform")
end

function CreateShell(arg_248_0)
	if type(arg_248_0) ~= "table" and type(arg_248_0) ~= "userdata" then
		return arg_248_0
	end

	local var_248_0 = setmetatable({
		__index = arg_248_0
	}, arg_248_0)

	return setmetatable({}, var_248_0)
end

function CameraFittingSettin(arg_249_0)
	local var_249_0 = GetComponent(arg_249_0, typeof(Camera))
	local var_249_1 = 1.7777777777777777
	local var_249_2 = Screen.width / Screen.height

	if var_249_2 < var_249_1 then
		local var_249_3 = var_249_2 / var_249_1

		var_249_0.rect = var_0_0.Rect.New(0, (1 - var_249_3) / 2, 1, var_249_3)
	end
end

function SwitchSpecialChar(arg_250_0, arg_250_1)
	if PLATFORM_CODE ~= PLATFORM_US then
		arg_250_0 = arg_250_0:gsub(" ", " ")
		arg_250_0 = arg_250_0:gsub("\t", "    ")
	end

	if not arg_250_1 then
		arg_250_0 = arg_250_0:gsub("\n", " ")
	end

	return arg_250_0
end

function AfterCheck(arg_251_0, arg_251_1)
	local var_251_0 = {}

	for iter_251_0, iter_251_1 in ipairs(arg_251_0) do
		var_251_0[iter_251_0] = iter_251_1[1]()
	end

	arg_251_1()

	for iter_251_2, iter_251_3 in ipairs(arg_251_0) do
		if var_251_0[iter_251_2] ~= iter_251_3[1]() then
			iter_251_3[2]()
		end

		var_251_0[iter_251_2] = iter_251_3[1]()
	end
end

function CompareFuncs(arg_252_0, arg_252_1)
	local var_252_0 = {}

	local function var_252_1(arg_253_0, arg_253_1)
		var_252_0[arg_253_0] = var_252_0[arg_253_0] or {}
		var_252_0[arg_253_0][arg_253_1] = var_252_0[arg_253_0][arg_253_1] or arg_252_0[arg_253_0](arg_253_1)

		return var_252_0[arg_253_0][arg_253_1]
	end

	return function(arg_254_0, arg_254_1)
		local var_254_0 = 1

		while var_254_0 <= #arg_252_0 do
			local var_254_1 = var_252_1(var_254_0, arg_254_0)
			local var_254_2 = var_252_1(var_254_0, arg_254_1)

			if var_254_1 == var_254_2 then
				var_254_0 = var_254_0 + 1
			else
				return var_254_1 < var_254_2
			end
		end

		return tobool(arg_252_1)
	end
end

function DropResultIntegration(arg_255_0)
	local var_255_0 = {}
	local var_255_1 = 1

	while var_255_1 <= #arg_255_0 do
		local var_255_2 = arg_255_0[var_255_1].type
		local var_255_3 = arg_255_0[var_255_1].id

		var_255_0[var_255_2] = var_255_0[var_255_2] or {}

		if var_255_0[var_255_2][var_255_3] then
			local var_255_4 = arg_255_0[var_255_0[var_255_2][var_255_3]]
			local var_255_5 = table.remove(arg_255_0, var_255_1)

			var_255_4.count = var_255_4.count + var_255_5.count
		else
			var_255_0[var_255_2][var_255_3] = var_255_1
			var_255_1 = var_255_1 + 1
		end
	end

	local var_255_6 = {
		function(arg_256_0)
			local var_256_0 = arg_256_0.type
			local var_256_1 = arg_256_0.id

			if var_256_0 == DROP_TYPE_SHIP then
				return 1
			elseif var_256_0 == DROP_TYPE_RESOURCE then
				if var_256_1 == 1 then
					return 2
				else
					return 3
				end
			elseif var_256_0 == DROP_TYPE_ITEM then
				if var_256_1 == 59010 then
					return 4
				elseif var_256_1 == 59900 then
					return 5
				else
					local var_256_2 = Item.getConfigData(var_256_1)
					local var_256_3 = var_256_2 and var_256_2.type or 0

					if var_256_3 == 9 then
						return 6
					elseif var_256_3 == 5 then
						return 7
					elseif var_256_3 == 4 then
						return 8
					elseif var_256_3 == 7 then
						return 9
					end
				end
			elseif var_256_0 == DROP_TYPE_VITEM and var_256_1 == 59011 then
				return 4
			end

			return 100
		end,
		function(arg_257_0)
			local var_257_0

			if arg_257_0.type == DROP_TYPE_SHIP then
				var_257_0 = pg.ship_data_statistics[arg_257_0.id]
			elseif arg_257_0.type == DROP_TYPE_ITEM then
				var_257_0 = Item.getConfigData(arg_257_0.id)
			end

			return (var_257_0 and var_257_0.rarity or 0) * -1
		end,
		function(arg_258_0)
			return arg_258_0.id
		end
	}

	table.sort(arg_255_0, CompareFuncs(var_255_6))
end

function getLoginConfig()
	local var_259_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_259_1 = 1

	for iter_259_0, iter_259_1 in ipairs(pg.login.all) do
		if pg.login[iter_259_1].date ~= "stop" then
			local var_259_2, var_259_3 = parseTimeConfig(pg.login[iter_259_1].date)

			assert(not var_259_3)

			if pg.TimeMgr.GetInstance():inTime(var_259_2, var_259_0) then
				var_259_1 = iter_259_1

				break
			end
		end
	end

	local var_259_4 = pg.login[var_259_1].login_static

	var_259_4 = var_259_4 ~= "" and var_259_4 or "login"

	local var_259_5 = pg.login[var_259_1].login_cri
	local var_259_6 = var_259_5 ~= "" and true or false
	local var_259_7 = pg.login[var_259_1].op_play == 1 and true or false
	local var_259_8 = pg.login[var_259_1].op_time

	if var_259_8 == "" or not pg.TimeMgr.GetInstance():inTime(var_259_8, var_259_0) then
		var_259_7 = false
	end

	local var_259_9 = var_259_8 == "" and var_259_8 or table.concat(var_259_8[1][1])

	return var_259_6, var_259_6 and var_259_5 or var_259_4, pg.login[var_259_1].bgm, var_259_7, var_259_9
end

function setIntimacyIcon(arg_260_0, arg_260_1, arg_260_2)
	local var_260_0 = {}
	local var_260_1

	if arg_260_0.childCount > 0 then
		var_260_1 = arg_260_0:GetChild(0)
	else
		var_260_1 = LoadAndInstantiateSync("template", "intimacytpl").transform

		setParent(var_260_1, arg_260_0)
	end

	setImageAlpha(var_260_1, arg_260_2 and 0 or 1)
	eachChild(var_260_1, function(arg_261_0)
		setActive(arg_261_0, false)
	end)

	if arg_260_2 then
		local var_260_2 = var_260_1:Find(arg_260_2 .. "(Clone)")

		if not var_260_2 then
			var_260_2 = LoadAndInstantiateSync("ui", arg_260_2)

			setParent(var_260_2, var_260_1)
		end

		setActive(var_260_2, true)
	elseif arg_260_1 then
		setImageSprite(var_260_1, GetSpriteFromAtlas("energy", arg_260_1), true)
	else
		assert(false, "param error")
	end

	return var_260_1
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

function switch(arg_264_0, arg_264_1, arg_264_2, ...)
	if arg_264_1[arg_264_0] then
		return arg_264_1[arg_264_0](...)
	elseif arg_264_2 then
		return arg_264_2(...)
	end
end

function parseTimeConfig(arg_265_0)
	if type(arg_265_0[1]) == "table" then
		return arg_265_0[2], arg_265_0[1]
	else
		return arg_265_0
	end
end

local var_0_23 = {
	__add = function(arg_266_0, arg_266_1)
		return NewPos(arg_266_0.x + arg_266_1.x, arg_266_0.y + arg_266_1.y)
	end,
	__sub = function(arg_267_0, arg_267_1)
		return NewPos(arg_267_0.x - arg_267_1.x, arg_267_0.y - arg_267_1.y)
	end,
	__mul = function(arg_268_0, arg_268_1)
		if type(arg_268_1) == "number" then
			return NewPos(arg_268_0.x * arg_268_1, arg_268_0.y * arg_268_1)
		else
			return NewPos(arg_268_0.x * arg_268_1.x, arg_268_0.y * arg_268_1.y)
		end
	end,
	__eq = function(arg_269_0, arg_269_1)
		return arg_269_0.x == arg_269_1.x and arg_269_0.y == arg_269_1.y
	end,
	__tostring = function(arg_270_0)
		return arg_270_0.x .. "_" .. arg_270_0.y
	end
}

function NewPos(arg_271_0, arg_271_1)
	assert(arg_271_0 and arg_271_1)

	local var_271_0 = setmetatable({
		x = arg_271_0,
		y = arg_271_1
	}, var_0_23)

	function var_271_0.SqrMagnitude(arg_272_0)
		return arg_272_0.x * arg_272_0.x + arg_272_0.y * arg_272_0.y
	end

	function var_271_0.Normalize(arg_273_0)
		local var_273_0 = arg_273_0:SqrMagnitude()

		if var_273_0 > 1e-05 then
			return arg_273_0 * (1 / math.sqrt(var_273_0))
		else
			return NewPos(0, 0)
		end
	end

	return var_271_0
end

local var_0_24

function Timekeeping()
	warning(Time.realtimeSinceStartup - (var_0_24 or Time.realtimeSinceStartup), Time.realtimeSinceStartup)

	var_0_24 = Time.realtimeSinceStartup
end

function GetRomanDigit(arg_275_0)
	return (string.char(226, 133, 160 + (arg_275_0 - 1)))
end

function quickPlayAnimator(arg_276_0, arg_276_1)
	arg_276_0:GetComponent(typeof(Animator)):Play(arg_276_1, -1, 0)
end

function getSurveyUrl(arg_277_0)
	local var_277_0 = pg.survey_data_template[arg_277_0]
	local var_277_1

	if not IsUnityEditor then
		if PLATFORM_CODE == PLATFORM_CH then
			local var_277_2 = getProxy(UserProxy):GetCacheGatewayInServerLogined()

			if var_277_2 == PLATFORM_ANDROID then
				if LuaHelper.GetCHPackageType() == PACKAGE_TYPE_BILI then
					var_277_1 = var_277_0.main_url
				else
					var_277_1 = var_277_0.uo_url
				end
			elseif var_277_2 == PLATFORM_IPHONEPLAYER then
				var_277_1 = var_277_0.ios_url
			end
		elseif PLATFORM_CODE == PLATFORM_US or PLATFORM_CODE == PLATFORM_JP then
			var_277_1 = var_277_0.main_url
		end
	else
		var_277_1 = var_277_0.main_url
	end

	local var_277_3 = getProxy(PlayerProxy):getRawData().id
	local var_277_4 = getProxy(UserProxy):getRawData().arg2 or ""
	local var_277_5
	local var_277_6 = PLATFORM == PLATFORM_ANDROID and 1 or PLATFORM == PLATFORM_IPHONEPLAYER and 2 or 3
	local var_277_7 = getProxy(UserProxy):getRawData()
	local var_277_8 = getProxy(ServerProxy):getRawData()[var_277_7 and var_277_7.server or 0]
	local var_277_9 = var_277_8 and var_277_8.id or ""
	local var_277_10 = getProxy(PlayerProxy):getRawData().level
	local var_277_11 = var_277_3 .. "_" .. arg_277_0
	local var_277_12 = var_277_1
	local var_277_13 = {
		var_277_3,
		var_277_4,
		var_277_6,
		var_277_9,
		var_277_10,
		var_277_11
	}

	if var_277_12 then
		for iter_277_0, iter_277_1 in ipairs(var_277_13) do
			var_277_12 = string.gsub(var_277_12, "$" .. iter_277_0, tostring(iter_277_1))
		end
	end

	warning(var_277_12)

	return var_277_12
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

function FilterVarchar(arg_279_0)
	assert(type(arg_279_0) == "string" or type(arg_279_0) == "table")

	if arg_279_0 == "" then
		return nil
	end

	return arg_279_0
end

function getGameset(arg_280_0)
	local var_280_0 = pg.gameset[arg_280_0]

	assert(var_280_0)

	return {
		var_280_0.key_value,
		var_280_0.description
	}
end

function getDorm3dGameset(arg_281_0)
	local var_281_0 = pg.dorm3d_set[arg_281_0]

	assert(var_281_0)

	return {
		var_281_0.key_value_int,
		var_281_0.key_value_varchar
	}
end

function GetItemsOverflowDic(arg_282_0)
	arg_282_0 = arg_282_0 or {}

	local var_282_0 = {
		[DROP_TYPE_ITEM] = {},
		[DROP_TYPE_RESOURCE] = {},
		[DROP_TYPE_EQUIP] = 0,
		[DROP_TYPE_SHIP] = 0,
		[DROP_TYPE_WORLD_ITEM] = 0
	}

	while #arg_282_0 > 0 do
		local var_282_1 = table.remove(arg_282_0)

		switch(var_282_1.type, {
			[DROP_TYPE_ITEM] = function()
				if var_282_1:getConfig("open_directly") == 1 then
					for iter_283_0, iter_283_1 in ipairs(var_282_1:getConfig("display_icon")) do
						local var_283_0 = Drop.Create(iter_283_1)

						var_283_0.count = var_283_0.count * var_282_1.count

						table.insert(arg_282_0, var_283_0)
					end
				elseif var_282_1:getSubClass():IsShipExpType() then
					var_282_0[var_282_1.type][var_282_1.id] = defaultValue(var_282_0[var_282_1.type][var_282_1.id], 0) + var_282_1.count
				end
			end,
			[DROP_TYPE_RESOURCE] = function()
				var_282_0[var_282_1.type][var_282_1.id] = defaultValue(var_282_0[var_282_1.type][var_282_1.id], 0) + var_282_1.count
			end,
			[DROP_TYPE_EQUIP] = function()
				var_282_0[var_282_1.type] = var_282_0[var_282_1.type] + var_282_1.count
			end,
			[DROP_TYPE_SHIP] = function()
				var_282_0[var_282_1.type] = var_282_0[var_282_1.type] + var_282_1.count
			end,
			[DROP_TYPE_WORLD_ITEM] = function()
				var_282_0[var_282_1.type] = var_282_0[var_282_1.type] + var_282_1.count
			end
		})
	end

	return var_282_0
end

function CheckOverflow(arg_288_0, arg_288_1)
	local var_288_0 = {}
	local var_288_1 = arg_288_0[DROP_TYPE_RESOURCE][PlayerConst.ResGold] or 0
	local var_288_2 = arg_288_0[DROP_TYPE_RESOURCE][PlayerConst.ResOil] or 0
	local var_288_3 = arg_288_0[DROP_TYPE_EQUIP]
	local var_288_4 = arg_288_0[DROP_TYPE_SHIP]
	local var_288_5 = getProxy(PlayerProxy):getRawData()
	local var_288_6 = false

	if arg_288_1 then
		local var_288_7 = var_288_5:OverStore(PlayerConst.ResStoreGold, var_288_1)
		local var_288_8 = var_288_5:OverStore(PlayerConst.ResStoreOil, var_288_2)

		if var_288_7 > 0 or var_288_8 > 0 then
			var_288_0.isStoreOverflow = {
				var_288_7,
				var_288_8
			}
		end
	else
		if var_288_1 > 0 and var_288_5:GoldMax(var_288_1) then
			return false, "gold"
		end

		if var_288_2 > 0 and var_288_5:OilMax(var_288_2) then
			return false, "oil"
		end
	end

	var_288_0.isExpBookOverflow = {}

	for iter_288_0, iter_288_1 in pairs(arg_288_0[DROP_TYPE_ITEM]) do
		local var_288_9 = Item.getConfigData(iter_288_0)

		if getProxy(BagProxy):getItemCountById(iter_288_0) + iter_288_1 > var_288_9.max_num then
			table.insert(var_288_0.isExpBookOverflow, iter_288_0)
		end
	end

	local var_288_10 = getProxy(EquipmentProxy):getCapacity()

	if var_288_3 > 0 and var_288_3 + var_288_10 > var_288_5:getMaxEquipmentBag() then
		return false, "equip"
	end

	local var_288_11 = getProxy(BayProxy):getShipCount()

	if var_288_4 > 0 and var_288_4 + var_288_11 > var_288_5:getMaxShipBag() then
		return false, "ship"
	end

	return true, var_288_0
end

function CheckShipExpOverflow(arg_289_0)
	local var_289_0 = getProxy(BagProxy)

	for iter_289_0, iter_289_1 in pairs(arg_289_0[DROP_TYPE_ITEM]) do
		if var_289_0:getItemCountById(iter_289_0) + iter_289_1 > Item.getConfigData(iter_289_0).max_num then
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

function RegisterDetailButton(arg_290_0, arg_290_1, arg_290_2)
	Drop.Change(arg_290_2)
	switch(arg_290_2.type, {
		[DROP_TYPE_ITEM] = function()
			if arg_290_2:getConfig("type") == Item.SKIN_ASSIGNED_TYPE then
				local var_291_0 = Item.getConfigData(arg_290_2.id).usage_arg
				local var_291_1 = var_291_0[3]

				if Item.InTimeLimitSkinAssigned(arg_290_2.id) then
					var_291_1 = table.mergeArray(var_291_0[2], var_291_1, true)
				end

				local var_291_2 = {}

				for iter_291_0, iter_291_1 in ipairs(var_291_0[2]) do
					var_291_2[iter_291_1] = true
				end

				onButton(arg_290_0, arg_290_1, function()
					arg_290_0:closeView()
					pg.m02:sendNotification(GAME.LOAD_LAYERS, {
						parentContext = getProxy(ContextProxy):getCurrentContext(),
						context = Context.New({
							viewComponent = SelectSkinLayer,
							mediator = SkinAtlasMediator,
							data = {
								mode = SelectSkinLayer.MODE_VIEW,
								itemId = arg_290_2.id,
								selectableSkinList = underscore.map(var_291_1, function(arg_293_0)
									return SelectableSkin.New({
										id = arg_293_0,
										isTimeLimit = var_291_2[arg_293_0] or false
									})
								end)
							}
						})
					})
				end, SFX_PANEL)
				setActive(arg_290_1, true)
			else
				local var_291_3 = getProxy(TechnologyProxy):getItemCanUnlockBluePrint(arg_290_2.id) and "tech" or arg_290_2:getConfig("type")

				if var_0_25[var_291_3] then
					local var_291_4 = {
						item2Row = true,
						content = i18n(var_0_25[var_291_3]),
						itemList = underscore.map(arg_290_2:getConfig("display_icon"), function(arg_294_0)
							return Drop.Create(arg_294_0)
						end)
					}

					if var_291_3 == 11 then
						onButton(arg_290_0, arg_290_1, function()
							arg_290_0:emit(BaseUI.ON_DROP_LIST_OWN, var_291_4)
						end, SFX_PANEL)
					else
						onButton(arg_290_0, arg_290_1, function()
							arg_290_0:emit(BaseUI.ON_DROP_LIST, var_291_4)
						end, SFX_PANEL)
					end
				end

				setActive(arg_290_1, tobool(var_0_25[var_291_3]))
			end
		end,
		[DROP_TYPE_EQUIP] = function()
			onButton(arg_290_0, arg_290_1, function()
				arg_290_0:emit(BaseUI.ON_DROP, arg_290_2)
			end, SFX_PANEL)
			setActive(arg_290_1, true)
		end,
		[DROP_TYPE_SPWEAPON] = function()
			onButton(arg_290_0, arg_290_1, function()
				arg_290_0:emit(BaseUI.ON_DROP, arg_290_2)
			end, SFX_PANEL)
			setActive(arg_290_1, true)
		end
	}, function()
		setActive(arg_290_1, false)
	end)
end

function UpdateOwnDisplay(arg_302_0, arg_302_1)
	local var_302_0, var_302_1 = arg_302_1:getOwnedCount()

	setActive(arg_302_0, var_302_1 and var_302_0 > 0)

	if var_302_1 and var_302_0 > 0 then
		setText(arg_302_0:Find("label"), i18n("word_own1"))
		setText(arg_302_0:Find("Text"), var_302_0)
	end
end

function Damp(arg_303_0, arg_303_1, arg_303_2)
	arg_303_1 = Mathf.Max(1, arg_303_1)

	local var_303_0 = Mathf.Epsilon

	if arg_303_1 < var_303_0 or var_303_0 > Mathf.Abs(arg_303_0) then
		return arg_303_0
	end

	if arg_303_2 < var_303_0 then
		return 0
	end

	local var_303_1 = -4.605170186

	return arg_303_0 * (1 - Mathf.Exp(var_303_1 * arg_303_2 / arg_303_1))
end

function checkCullResume(arg_304_0)
	if not ReflectionHelp.RefCallMethodEx(typeof("UnityEngine.CanvasRenderer"), "GetMaterial", GetComponent(arg_304_0, "CanvasRenderer"), {
		typeof("System.Int32")
	}, {
		0
	}) then
		local var_304_0 = arg_304_0:GetComponentsInChildren(typeof(MeshImage))

		for iter_304_0 = 1, var_304_0.Length do
			var_304_0[iter_304_0 - 1]:SetVerticesDirty()
		end

		return false
	end

	return true
end

function parseEquipCode(arg_305_0)
	local var_305_0 = {}

	if arg_305_0 and arg_305_0 ~= "" then
		local var_305_1 = base64.dec(arg_305_0)

		var_305_0 = string.split(var_305_1, "/")
		var_305_0[5], var_305_0[6] = unpack(string.split(var_305_0[5], "\\"))

		if #var_305_0 < 6 or arg_305_0 ~= base64.enc(table.concat({
			table.concat(underscore.first(var_305_0, 5), "/"),
			var_305_0[6]
		}, "\\")) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("equipcode_illegal"))

			var_305_0 = {}
		end
	end

	for iter_305_0 = 1, 6 do
		var_305_0[iter_305_0] = var_305_0[iter_305_0] and tonumber(var_305_0[iter_305_0], 32) or 0
	end

	return var_305_0
end

function buildEquipCode(arg_306_0)
	local var_306_0 = underscore.map(arg_306_0:getAllEquipments(), function(arg_307_0)
		return ConversionBase(32, arg_307_0 and arg_307_0.id or 0)
	end)
	local var_306_1 = {
		table.concat(var_306_0, "/"),
		ConversionBase(32, checkExist(arg_306_0:GetSpWeapon(), {
			"id"
		}) or 0)
	}

	return base64.enc(table.concat(var_306_1, "\\"))
end

function setDirectorSpeed(arg_308_0, arg_308_1)
	GetComponent(arg_308_0, "TimelineSpeed"):SetTimelineSpeed(arg_308_1)
end

function setDefaultZeroMetatable(arg_309_0)
	return setmetatable(arg_309_0, {
		__index = function(arg_310_0, arg_310_1)
			if rawget(arg_310_0, arg_310_1) == nil then
				arg_310_0[arg_310_1] = 0
			end

			return arg_310_0[arg_310_1]
		end
	})
end

if EDITOR_TOOL then
	local var_0_26 = {
		__index = {
			LoadAssetSync = function(arg_311_0, ...)
				return ResourceMgr.Inst:getAssetSync(arg_311_0.path, ...)
			end,
			GetAllAssetNames = function(arg_312_0, ...)
				return ReflectionHelp.RefCallMethod(typeof(ResourceMgr), "GetAssetBundleAllAssetNames", ResourceMgr.Inst, {
					typeof("System.String")
				}, {
					arg_312_0.path
				})
			end
		}
	}

	function buildTempAB(arg_313_0, arg_313_1)
		local var_313_0 = setmetatable({
			path = arg_313_0
		}, var_0_26)

		if arg_313_1 then
			onNextTick(function()
				arg_313_1(var_313_0)
			end)
		end

		return var_313_0
	end

	function checkABExist(arg_315_0)
		return PathMgr.FileExists(PathMgr.getAssetBundle(arg_315_0)) or ResourceMgr.Inst:AssetExist(arg_315_0)
	end
else
	local var_0_27 = {
		__index = {
			LoadAssetSync = function(arg_316_0, ...)
				return ResourceMgr.Inst:LoadAssetSync(arg_316_0.ab, ...)
			end,
			GetAllAssetNames = function(arg_317_0, ...)
				return arg_317_0.ab:GetAllAssetNames(...)
			end
		}
	}

	function buildTempAB(arg_318_0, arg_318_1)
		local var_318_0 = setmetatable({
			path = arg_318_0
		}, var_0_27)

		if arg_318_1 then
			ResourceMgr.Inst:loadAssetBundleAsync(arg_318_0, function(arg_319_0)
				var_318_0.ab = arg_319_0

				arg_318_1(var_318_0)
			end)
		else
			var_318_0.ab = ResourceMgr.Inst:loadAssetBundleSync(arg_318_0)
		end

		return var_318_0
	end

	function checkABExist(arg_320_0)
		return PathMgr.FileExists(PathMgr.getAssetBundle(arg_320_0))
	end
end
