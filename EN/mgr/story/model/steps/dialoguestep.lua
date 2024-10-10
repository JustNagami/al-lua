local var_0_0 = class("DialogueStep", import(".StoryStep"))

var_0_0.SIDE_LEFT = 0
var_0_0.SIDE_RIGHT = 1
var_0_0.SIDE_MIDDLE = 2
var_0_0.ACTOR_TYPE_PLAYER = 0
var_0_0.ACTOR_TYPE_FLAGSHIP = -1
var_0_0.ACTOR_TYPE_TB = -2
var_0_0.PAINTING_ACTION_MOVE = "move"
var_0_0.PAINTING_ACTION_SHAKE = "shake"
var_0_0.PAINTING_ACTION_ZOOM = "zoom"
var_0_0.PAINTING_ACTION_ROTATE = "rotate"

local var_0_1 = pg.ship_skin_template

local function var_0_2(arg_1_0)
	local var_1_0 = string.lower(arg_1_0)

	if var_1_0 == "#a9f548" or var_1_0 == "#a9f548ff" then
		return "#5CE6FF"
	elseif var_1_0 == "#ff5c5c" then
		return "#FF9B93"
	elseif var_1_0 == "#ffa500" then
		return "#FFC960"
	elseif var_1_0 == "#ffff4d" then
		return "#FEF15E"
	elseif var_1_0 == "#696969" then
		return "#BDBDBD"
	elseif var_1_0 == "#a020f0" then
		return "#C3ABFF"
	elseif var_1_0 == "#ffffff" then
		return "#FFFFFF"
	else
		return arg_1_0
	end
end

function var_0_0.Ctor(arg_2_0, arg_2_1)
	var_0_0.super.Ctor(arg_2_0, arg_2_1)

	arg_2_0.actor = arg_2_1.actor

	if arg_2_1.nameColor then
		arg_2_0.nameColor = var_0_2(arg_2_1.nameColor)
	else
		arg_2_0.nameColor = COLOR_WHITE
	end

	arg_2_0.specialTbId = nil

	if arg_2_1.tbActor then
		arg_2_0.specialTbId = arg_2_0.actor
		arg_2_0.actor = var_0_0.ACTOR_TYPE_TB
	end

	arg_2_0.actorName = arg_2_1.actorName
	arg_2_0.subActorName = arg_2_1.factiontag
	arg_2_0.subActorNameColor = arg_2_1.factiontagColor or "#FFFFFF"
	arg_2_0.withoutActorName = arg_2_1.withoutActorName
	arg_2_0.say = arg_2_1.say
	arg_2_0.dynamicBgType = arg_2_1.dynamicBgType
	arg_2_0.fontSize = arg_2_1.fontsize
	arg_2_0.side = arg_2_1.side
	arg_2_0.dir = arg_2_1.dir

	if arg_2_0.dir == 0 then
		arg_2_0.dir = 1
	end

	arg_2_0.expression = arg_2_1.expression
	arg_2_0.typewriter = arg_2_1.typewriter
	arg_2_0.painting = arg_2_1.painting
	arg_2_0.fadeInPaintingTime = arg_2_1.fadeInPaintingTime or 0.15
	arg_2_0.fadeOutPaintingTime = arg_2_1.fadeOutPaintingTime or 0.15
	arg_2_0.actorPosition = arg_2_1.actorPosition
	arg_2_0.dialogShake = arg_2_1.dialogShake
	arg_2_0.moveSideData = arg_2_1.paintingFadeOut
	arg_2_0.paingtingGray = arg_2_1.paingtingGray
	arg_2_0.glitchArt = arg_2_1.paintingNoise
	arg_2_0.hideOtherPainting = arg_2_1.hideOther
	arg_2_0.subPaintings = arg_2_1.subActors
	arg_2_0.disappearSeq = {}
	arg_2_0.disappearTime = {
		0,
		0
	}

	if arg_2_0.subPaintings and #arg_2_0.subPaintings > 0 and arg_2_1.disappearSeq then
		arg_2_0.disappearSeq = arg_2_1.disappearSeq
		arg_2_0.disappearTime = arg_2_1.disappearTime or {
			0,
			0
		}
	end

	arg_2_0.hideRecordIco = arg_2_1.hideRecordIco
	arg_2_0.paingtingScale = arg_2_1.actorScale
	arg_2_0.hidePainting = arg_2_1.withoutPainting
	arg_2_0.hidePaintingWithName = arg_2_1.hidePainting
	arg_2_0.actorShadow = arg_2_1.actorShadow
	arg_2_0.actorAlpha = arg_2_1.actorAlpha
	arg_2_0.showNPainting = arg_2_1.hidePaintObj
	arg_2_0.hasPaintbg = arg_2_1.hasPaintbg
	arg_2_0.showWJZPainting = arg_2_1.hidePaintEquip
	arg_2_0.nohead = arg_2_1.nohead
	arg_2_0.live2d = arg_2_1.live2d
	arg_2_0.live2dIdleIndex = arg_2_1.live2dIdleIndex
	arg_2_0.spine = arg_2_1.spine
	arg_2_0.spineOrderIndex = arg_2_1.spineOrderIndex
	arg_2_0.live2dOffset = arg_2_1.live2dOffset
	arg_2_0.contentBGAlpha = arg_2_1.dialogueBgAlpha or 1
	arg_2_0.canMarkNode = arg_2_1.canMarkNode
	arg_2_0.portrait = arg_2_1.portrait
	arg_2_0.glitchArtForPortrait = arg_2_1.portraitNoise

	if arg_2_0.hidePainting or arg_2_0.actor == nil then
		arg_2_0.actor = nil
		arg_2_0.hideOtherPainting = true
	end

	if arg_2_0.hidePaintingWithName or arg_2_0.actor == nil then
		if arg_2_0.actorName == nil then
			arg_2_0.actorName = arg_2_0:GetName()
		end

		arg_2_0.actor = nil
		arg_2_0.hideOtherPainting = true
	end

	arg_2_0.paintRwIndex = arg_2_1.paintRwIndex or 0
	arg_2_0.action = arg_2_1.action or {}
end

function var_0_0.SetDefaultSide(arg_3_0)
	arg_3_0.side = defaultValue(arg_3_0.side, var_0_0.SIDE_LEFT)
end

function var_0_0.GetBgName(arg_4_0)
	if arg_4_0.dynamicBgType and arg_4_0.dynamicBgType == var_0_0.ACTOR_TYPE_TB and getProxy(EducateProxy) and not pg.NewStoryMgr.GetInstance():IsReView() then
		local var_4_0, var_4_1, var_4_2 = getProxy(EducateProxy):GetStoryInfo()

		return (arg_4_0:Convert2StoryBg(var_4_2))
	else
		return var_0_0.super.GetBgName(arg_4_0)
	end
end

function var_0_0.Convert2StoryBg(arg_5_0, arg_5_1)
	return ({
		educate_tb_1 = "bg_project_tb_room1",
		educate_tb_2 = "bg_project_tb_room2",
		educate_tb_3 = "bg_project_tb_room3"
	})[arg_5_1] or arg_5_1
end

function var_0_0.GetPaintingRwIndex(arg_6_0)
	if not arg_6_0.glitchArt then
		return 0
	end

	if not arg_6_0.expression then
		return 0
	end

	return arg_6_0.paintRwIndex
end

function var_0_0.ExistPortrait(arg_7_0)
	return arg_7_0.portrait ~= nil
end

function var_0_0.GetPortrait(arg_8_0)
	if type(arg_8_0.portrait) == "number" then
		return pg.ship_skin_template[arg_8_0.portrait].painting
	elseif type(arg_8_0.portrait) == "string" then
		return arg_8_0.portrait
	else
		return nil
	end
end

function var_0_0.ShouldGlitchArtForPortrait(arg_9_0)
	return arg_9_0.glitchArtForPortrait
end

function var_0_0.GetMode(arg_10_0)
	return Story.MODE_DIALOGUE
end

function var_0_0.GetContentBGAlpha(arg_11_0)
	return arg_11_0.contentBGAlpha
end

function var_0_0.GetSpineExPression(arg_12_0)
	if arg_12_0.expression then
		return arg_12_0.expression
	end
end

function var_0_0.GetExPression(arg_13_0)
	if arg_13_0.expression then
		return arg_13_0.expression
	else
		local var_13_0 = arg_13_0:GetPainting()

		if var_13_0 and ShipExpressionHelper.DefaultFaceless(var_13_0) then
			return ShipExpressionHelper.GetDefaultFace(var_13_0)
		end
	end
end

function var_0_0.ShouldAddHeadMaskWhenFade(arg_14_0)
	if arg_14_0:ShouldAddGlitchArtEffect() then
		return false
	end

	if arg_14_0:IsNoHeadPainting() then
		return false
	end

	if not arg_14_0:GetExPression() then
		return false
	end

	return true
end

function var_0_0.ShouldGrayingPainting(arg_15_0, arg_15_1)
	return arg_15_1:GetPainting() ~= nil and not arg_15_0:IsSameSide(arg_15_1)
end

function var_0_0.ShouldGrayingOutPainting(arg_16_0, arg_16_1)
	return arg_16_0:GetPainting() ~= nil and not arg_16_0:IsSameSide(arg_16_1)
end

function var_0_0.ShouldFadeInPainting(arg_17_0)
	if not arg_17_0:GetPainting() then
		return false
	end

	if arg_17_0:IsLive2dPainting() or arg_17_0:IsSpinePainting() then
		return false
	end

	local var_17_0 = arg_17_0:GetFadeInPaintingTime()

	if not var_17_0 or var_17_0 <= 0 then
		return false
	end

	return true
end

function var_0_0.GetTypewriter(arg_18_0)
	return arg_18_0.typewriter
end

function var_0_0.ShouldFaceBlack(arg_19_0)
	return arg_19_0.actorShadow
end

function var_0_0.GetPaintingData(arg_20_0)
	local var_20_0 = arg_20_0.painting or {}

	return {
		alpha = var_20_0.alpha or 0.3,
		time = var_20_0.time or 1
	}
end

function var_0_0.GetFadeInPaintingTime(arg_21_0)
	return arg_21_0.fadeInPaintingTime
end

function var_0_0.GetFadeOutPaintingTime(arg_22_0)
	return arg_22_0.fadeOutPaintingTime
end

function var_0_0.GetPaintingDir(arg_23_0)
	local var_23_0 = arg_23_0.paingtingScale or 1

	return (arg_23_0.dir or 1) * var_23_0
end

function var_0_0.GetTag(arg_24_0)
	if arg_24_0.glitchArt == true then
		return 2
	else
		return 1
	end
end

function var_0_0.GetPaintingAlpha(arg_25_0)
	return arg_25_0.actorAlpha
end

function var_0_0.GetPaitingOffst(arg_26_0)
	return arg_26_0.actorPosition
end

function var_0_0.GetSound(arg_27_0)
	return arg_27_0.sound
end

function var_0_0.GetPaintingActions(arg_28_0)
	return arg_28_0.action
end

function var_0_0.GetPaintingMoveToSide(arg_29_0)
	return arg_29_0.moveSideData
end

function var_0_0.ShouldMoveToSide(arg_30_0)
	return arg_30_0.moveSideData ~= nil
end

function var_0_0.GetPaintingAction(arg_31_0, arg_31_1)
	local var_31_0 = {}
	local var_31_1 = arg_31_0:GetPaintingActions()

	for iter_31_0, iter_31_1 in ipairs(var_31_1) do
		if iter_31_1.type == arg_31_1 then
			table.insert(var_31_0, iter_31_1)
		end
	end

	return var_31_0
end

function var_0_0.GetSide(arg_32_0)
	return arg_32_0.side
end

function var_0_0.GetContent(arg_33_0)
	if not arg_33_0.say then
		return "..."
	end

	local var_33_0 = arg_33_0.say

	if arg_33_0:ShouldReplacePlayer() then
		var_33_0 = arg_33_0:ReplacePlayerName(var_33_0)
	end

	if arg_33_0:ShouldReplaceTb() then
		var_33_0 = arg_33_0:ReplaceTbName(var_33_0)
	end

	if PLATFORM_CODE ~= PLATFORM_US then
		var_33_0 = SwitchSpecialChar(HXSet.hxLan(var_33_0), true)
	else
		var_33_0 = HXSet.hxLan(var_33_0)
	end

	return var_33_0
end

function var_0_0.GetNameWithColor(arg_34_0)
	local var_34_0 = arg_34_0:GetName()

	if not var_34_0 then
		return nil
	end

	local var_34_1 = arg_34_0:GetNameColor()

	return setColorStr(var_34_0, var_34_1)
end

function var_0_0.GetNameColor(arg_35_0)
	return arg_35_0.nameColor or COLOR_WHITE
end

function var_0_0.GetNameColorCode(arg_36_0)
	local var_36_0 = arg_36_0:GetNameColor()

	return string.gsub(var_36_0, "#", "")
end

function var_0_0.GetCustomActorName(arg_37_0)
	if type(arg_37_0.actorName) == "number" and arg_37_0.actorName == 0 and getProxy(PlayerProxy) then
		return getProxy(PlayerProxy):getRawData().name
	elseif type(arg_37_0.actorName) == "string" then
		return arg_37_0.actorName
	else
		return ""
	end
end

function var_0_0.GetPortraitName(arg_38_0)
	if not arg_38_0:ExistPortrait() then
		return ""
	end

	if type(arg_38_0.portrait) ~= "number" then
		return ""
	end

	local var_38_0 = var_0_1[arg_38_0.portrait]

	if not var_38_0 then
		return ""
	end

	local var_38_1 = ""
	local var_38_2 = var_38_0.ship_group
	local var_38_3 = ShipGroup.getDefaultShipConfig(var_38_2)

	if not var_38_3 then
		var_38_1 = var_38_0.name
	else
		var_38_1 = Ship.getShipName(var_38_3.id)
	end

	return var_38_1
end

function var_0_0.GetName(arg_39_0)
	local var_39_0 = arg_39_0.actorName and arg_39_0:GetCustomActorName() or arg_39_0:GetPaintingAndName() or ""

	if not var_39_0 or var_39_0 == "" then
		var_39_0 = arg_39_0:GetPortraitName()
	end

	if not var_39_0 or var_39_0 == "" or arg_39_0.withoutActorName then
		return nil
	end

	if arg_39_0:ShouldReplacePlayer() then
		var_39_0 = arg_39_0:ReplacePlayerName(var_39_0)
	end

	if arg_39_0:ShouldReplaceTb() then
		var_39_0 = arg_39_0:ReplaceTbName(var_39_0)
	end

	return (HXSet.hxLan(var_39_0))
end

function var_0_0.GetPainting(arg_40_0)
	local var_40_0, var_40_1 = arg_40_0:GetPaintingAndName()

	return var_40_1
end

function var_0_0.ExistPainting(arg_41_0)
	return arg_41_0:GetPainting() ~= nil
end

function var_0_0.ShouldShakeDailogue(arg_42_0)
	return arg_42_0.dialogShake ~= nil
end

function var_0_0.GetShakeDailogueData(arg_43_0)
	return arg_43_0.dialogShake
end

function var_0_0.IsSameSide(arg_44_0, arg_44_1)
	local var_44_0 = arg_44_0:GetPrevSide(arg_44_1)
	local var_44_1 = arg_44_0:GetSide()

	return var_44_0 ~= nil and var_44_1 ~= nil and var_44_0 == var_44_1
end

function var_0_0.GetPrevSide(arg_45_0, arg_45_1)
	local var_45_0 = arg_45_1:GetSide()

	if arg_45_0.moveSideData then
		var_45_0 = arg_45_0.moveSideData.side
	end

	return var_45_0
end

function var_0_0.GetPaintingIcon(arg_46_0)
	local var_46_0

	if arg_46_0.actor == var_0_0.ACTOR_TYPE_FLAGSHIP then
		local var_46_1 = getProxy(PlayerProxy):getRawData().character

		var_46_0 = getProxy(BayProxy):getShipById(var_46_1):getPrefab()
	else
		var_46_0 = (arg_46_0.actor ~= var_0_0.ACTOR_TYPE_PLAYER or nil) and (arg_46_0.actor ~= var_0_0.ACTOR_TYPE_TB or nil) and (arg_46_0.actor or nil) and (not arg_46_0.hideRecordIco or nil) and var_0_1[arg_46_0.actor].prefab
	end

	if var_46_0 == nil and arg_46_0:ExistPortrait() then
		var_46_0 = arg_46_0:GetPortrait()
	end

	return var_46_0
end

function var_0_0.GetPaintingAndName(arg_47_0)
	local var_47_0
	local var_47_1

	if not UnGamePlayState and arg_47_0.actor == var_0_0.ACTOR_TYPE_FLAGSHIP then
		local var_47_2 = getProxy(PlayerProxy):getRawData().character
		local var_47_3 = getProxy(BayProxy):getShipById(var_47_2)

		var_47_0 = var_47_3:getName()
		var_47_1 = var_47_3:getPainting()
	elseif not UnGamePlayState and arg_47_0.actor == var_0_0.ACTOR_TYPE_PLAYER then
		if getProxy(PlayerProxy) then
			var_47_0 = getProxy(PlayerProxy):getRawData().name
		else
			var_47_0 = ""
		end
	elseif not UnGamePlayState and arg_47_0.actor == var_0_0.ACTOR_TYPE_TB then
		if pg.NewStoryMgr.GetInstance():IsReView() then
			assert(arg_47_0.defaultTb and arg_47_0.defaultTb > 0, "<<< defaultTb is nil >>>")

			local var_47_4 = pg.secretary_special_ship[arg_47_0.defaultTb]

			var_47_0 = var_47_4.name or ""
			var_47_1 = var_47_4.prefab
		elseif arg_47_0.specialTbId then
			local var_47_5 = pg.secretary_special_ship[arg_47_0.specialTbId]

			assert(var_47_5)

			var_47_0 = var_47_5.name or ""
			var_47_1 = var_47_5.prefab
		elseif EducateProxy and getProxy(EducateProxy) then
			var_47_1, var_47_0 = getProxy(EducateProxy):GetStoryInfo()
		else
			var_47_0 = ""
		end
	elseif not arg_47_0.actor or var_0_1[arg_47_0.actor] == nil then
		var_47_0, var_47_1 = nil
	else
		local var_47_6 = var_0_1[arg_47_0.actor]
		local var_47_7 = var_47_6.ship_group
		local var_47_8 = ShipGroup.getDefaultShipConfig(var_47_7)

		if not var_47_8 then
			var_47_0 = var_47_6.name
		else
			var_47_0 = Ship.getShipName(var_47_8.id)
		end

		var_47_1 = var_47_6.painting
	end

	return HXSet.hxLan(var_47_0), var_47_1
end

function var_0_0.GetShipSkinId(arg_48_0)
	if arg_48_0.actor == var_0_0.ACTOR_TYPE_FLAGSHIP then
		local var_48_0 = getProxy(PlayerProxy):getRawData().character

		return getProxy(BayProxy):getShipById(var_48_0).skinId
	elseif arg_48_0.actor == var_0_0.ACTOR_TYPE_PLAYER then
		return nil
	elseif not arg_48_0.actor then
		return nil
	else
		return arg_48_0.actor
	end
end

function var_0_0.IsShowNPainting(arg_49_0)
	return arg_49_0.showNPainting
end

function var_0_0.IsShowWJZPainting(arg_50_0)
	return arg_50_0.showWJZPainting
end

function var_0_0.ShouldGrayPainting(arg_51_0)
	return arg_51_0.paingtingGray
end

function var_0_0.ShouldAddGlitchArtEffect(arg_52_0)
	return arg_52_0.glitchArt
end

function var_0_0.HideOtherPainting(arg_53_0)
	return arg_53_0.hideOtherPainting
end

function var_0_0.GetSubPaintings(arg_54_0)
	return _.map(arg_54_0.subPaintings or {}, function(arg_55_0)
		local var_55_0 = pg.ship_skin_template[arg_55_0.actor]

		assert(var_55_0)

		return {
			actor = arg_55_0.actor,
			name = var_55_0.painting,
			expression = arg_55_0.expression,
			pos = arg_55_0.pos,
			dir = arg_55_0.dir or 1,
			paintingNoise = arg_55_0.paintingNoise or false,
			showNPainting = arg_55_0.hidePaintObj or false
		}
	end)
end

function var_0_0.NeedDispppearSubPainting(arg_56_0)
	return #arg_56_0.disappearSeq > 0
end

function var_0_0.GetDisappearSeq(arg_57_0)
	return arg_57_0.disappearSeq
end

function var_0_0.GetDisappearTime(arg_58_0)
	return arg_58_0.disappearTime[1], arg_58_0.disappearTime[2]
end

function var_0_0.IsNoHeadPainting(arg_59_0)
	return arg_59_0.nohead
end

function var_0_0.GetFontSize(arg_60_0)
	return arg_60_0.fontSize
end

function var_0_0.IsSpinePainting(arg_61_0)
	if PLATFORM_CODE == PLATFORM_CH and HXSet.isHx() then
		return false
	end

	local var_61_0 = arg_61_0:GetPainting()

	return tobool(var_61_0 ~= nil and arg_61_0.spine)
end

function var_0_0.IsHideSpineBg(arg_62_0)
	return arg_62_0.spine == 1
end

function var_0_0.GetSpineOrderIndex(arg_63_0)
	if arg_63_0:IsSpinePainting() then
		return arg_63_0.spineOrderIndex
	else
		return nil
	end
end

function var_0_0.IsLive2dPainting(arg_64_0)
	if PLATFORM_CODE == PLATFORM_CH and HXSet.isHx() then
		return false
	end

	local var_64_0 = arg_64_0:GetPainting()

	return tobool(var_64_0 ~= nil and arg_64_0.live2d)
end

function var_0_0.GetLive2dPos(arg_65_0)
	if arg_65_0.live2dOffset then
		return Vector3(arg_65_0.live2dOffset[1], arg_65_0.live2dOffset[2], arg_65_0.live2dOffset[3])
	end
end

function var_0_0.GetVirtualShip(arg_66_0)
	local var_66_0 = arg_66_0:GetShipSkinId()
	local var_66_1 = pg.ship_skin_template[var_66_0].ship_group

	return StoryShip.New({
		skin_id = var_66_0
	})
end

function var_0_0.GetLive2dAction(arg_67_0)
	if type(arg_67_0.live2d) == "string" then
		local var_67_0 = pg.character_voice[arg_67_0.live2d]

		if var_67_0 then
			return var_67_0.l2d_action
		end

		return arg_67_0.live2d
	else
		return nil
	end
end

function var_0_0.GetL2dIdleIndex(arg_68_0)
	return arg_68_0.live2dIdleIndex
end

function var_0_0.GetSubActorName(arg_69_0)
	if arg_69_0.subActorName and arg_69_0.subActorName ~= "" then
		local var_69_0 = HXSet.hxLan(arg_69_0.subActorName)

		return " " .. setColorStr(var_69_0, arg_69_0.subActorNameColor)
	else
		return ""
	end
end

function var_0_0.IsSamePainting(arg_70_0, arg_70_1)
	local function var_70_0()
		return arg_70_1:ShouldAddGlitchArtEffect() or arg_70_0:ShouldAddGlitchArtEffect()
	end

	return (function()
		return arg_70_0:GetPainting() == arg_70_1:GetPainting() and arg_70_0:IsShowNPainting() == arg_70_1:IsShowNPainting() and arg_70_0:IsShowWJZPainting() == arg_70_1:IsShowWJZPainting()
	end)() and arg_70_0:IsLive2dPainting() == arg_70_1:IsLive2dPainting() and arg_70_0:IsSpinePainting() == arg_70_1:IsSpinePainting() and not var_70_0()
end

function var_0_0.ExistCanMarkNode(arg_73_0)
	return arg_73_0.canMarkNode ~= nil and type(arg_73_0.canMarkNode) == "table" and arg_73_0.canMarkNode[1] and arg_73_0.canMarkNode[1] ~= "" and arg_73_0.canMarkNode[2] and type(arg_73_0.canMarkNode[2]) == "table"
end

function var_0_0.GetCanMarkNodeData(arg_74_0)
	local var_74_0 = {}

	for iter_74_0, iter_74_1 in ipairs(arg_74_0.canMarkNode[2] or {}) do
		table.insert(var_74_0, iter_74_1 .. "")
	end

	return {
		name = arg_74_0.canMarkNode[1],
		marks = var_74_0
	}
end

function var_0_0.OnClear(arg_75_0)
	return
end

function var_0_0.GetUsingPaintingNames(arg_76_0)
	local var_76_0 = {}
	local var_76_1 = arg_76_0:GetPainting()

	if var_76_1 ~= nil then
		table.insert(var_76_0, var_76_1)
	end

	local var_76_2 = arg_76_0:GetSubPaintings()

	for iter_76_0, iter_76_1 in ipairs(var_76_2) do
		local var_76_3 = iter_76_1.name

		table.insert(var_76_0, var_76_3)
	end

	return var_76_0
end

return var_0_0
