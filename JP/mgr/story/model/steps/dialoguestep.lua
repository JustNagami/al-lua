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
	arg_2_0.paingtingYFlip = arg_2_1.actorYFlip
	arg_2_0.hidePainting = arg_2_1.withoutPainting
	arg_2_0.hidePaintingWithName = arg_2_1.hidePainting
	arg_2_0.actorShadow = arg_2_1.actorShadow
	arg_2_0.actorAlpha = arg_2_1.actorAlpha
	arg_2_0.showNPainting = arg_2_1.hidePaintObj
	arg_2_0.hasPaintbg = arg_2_1.hasPaintbg
	arg_2_0.showWJZPainting = arg_2_1.hidePaintEquip
	arg_2_0.hideDialogFragment = arg_2_1.hideDialogFragment
	arg_2_0.nohead = arg_2_1.nohead
	arg_2_0.live2d = arg_2_1.live2d
	arg_2_0.live2dIdleIndex = arg_2_1.live2dIdleIndex
	arg_2_0.spine = arg_2_1.spine
	arg_2_0.spineOrderIndex = arg_2_1.spineOrderIndex
	arg_2_0.live2dOffset = arg_2_1.live2dOffset
	arg_2_0.contentBGAlpha = arg_2_1.dialogueBgAlpha or 1
	arg_2_0.canMarkNode = arg_2_1.canMarkNode
	arg_2_0.portrait = arg_2_1.portrait
	arg_2_0.miniPortrait = false

	if arg_2_0.portrait and (arg_2_0.portrait == "zhihuiguan" or arg_2_0.portrait == "tongxunqi") then
		arg_2_0.miniPortrait = true
	end

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

function var_0_0.IsMiniPortrait(arg_7_0)
	return arg_7_0.miniPortrait
end

function var_0_0.ExistPortrait(arg_8_0)
	return arg_8_0.portrait ~= nil
end

function var_0_0.GetPortrait(arg_9_0)
	if type(arg_9_0.portrait) == "number" then
		return pg.ship_skin_template[arg_9_0.portrait].painting
	elseif type(arg_9_0.portrait) == "string" then
		return arg_9_0.portrait
	else
		return nil
	end
end

function var_0_0.ShouldHideDialogue(arg_10_0)
	return arg_10_0.hideDialogFragment
end

function var_0_0.ShouldGlitchArtForPortrait(arg_11_0)
	return arg_11_0.glitchArtForPortrait
end

function var_0_0.GetMode(arg_12_0)
	return Story.MODE_DIALOGUE
end

function var_0_0.GetContentBGAlpha(arg_13_0)
	return arg_13_0.contentBGAlpha
end

function var_0_0.GetSpineExPression(arg_14_0)
	if arg_14_0.expression then
		return arg_14_0.expression
	end
end

function var_0_0.GetExPression(arg_15_0)
	if arg_15_0.expression then
		return arg_15_0.expression
	else
		local var_15_0 = arg_15_0:GetPainting()

		if var_15_0 and ShipExpressionHelper.DefaultFaceless(var_15_0) then
			return ShipExpressionHelper.GetDefaultFace(var_15_0)
		end
	end
end

function var_0_0.ShouldAddHeadMaskWhenFade(arg_16_0)
	if arg_16_0:ShouldAddGlitchArtEffect() then
		return false
	end

	if arg_16_0:IsNoHeadPainting() then
		return false
	end

	if not arg_16_0:GetExPression() then
		return false
	end

	return true
end

function var_0_0.ShouldGrayingPainting(arg_17_0, arg_17_1)
	return arg_17_1:GetPainting() ~= nil and not arg_17_0:IsSameSide(arg_17_1)
end

function var_0_0.ShouldGrayingOutPainting(arg_18_0, arg_18_1)
	return arg_18_0:GetPainting() ~= nil and not arg_18_0:IsSameSide(arg_18_1)
end

function var_0_0.ShouldFadeInPainting(arg_19_0)
	if not arg_19_0:GetPainting() then
		return false
	end

	if arg_19_0:IsLive2dPainting() or arg_19_0:IsSpinePainting() then
		return false
	end

	local var_19_0 = arg_19_0:GetFadeInPaintingTime()

	if not var_19_0 or var_19_0 <= 0 then
		return false
	end

	return true
end

function var_0_0.GetTypewriter(arg_20_0)
	return arg_20_0.typewriter
end

function var_0_0.ShouldFaceBlack(arg_21_0)
	return arg_21_0.actorShadow
end

function var_0_0.GetPaintingData(arg_22_0)
	local var_22_0 = arg_22_0.painting or {}

	return {
		alpha = var_22_0.alpha or 0.3,
		time = var_22_0.time or 1
	}
end

function var_0_0.GetFadeInPaintingTime(arg_23_0)
	return arg_23_0.fadeInPaintingTime
end

function var_0_0.GetFadeOutPaintingTime(arg_24_0)
	return arg_24_0.fadeOutPaintingTime
end

function var_0_0.GetPaintingDir(arg_25_0)
	local var_25_0 = arg_25_0.paingtingScale or 1

	return (arg_25_0.dir or 1) * var_25_0
end

function var_0_0.ShouldFlipPaintingY(arg_26_0)
	return arg_26_0.paingtingYFlip ~= nil
end

function var_0_0.GetTag(arg_27_0)
	if arg_27_0.glitchArt == true then
		return 2
	else
		return 1
	end
end

function var_0_0.GetPaintingAlpha(arg_28_0)
	return arg_28_0.actorAlpha
end

function var_0_0.GetPaitingOffst(arg_29_0)
	return arg_29_0.actorPosition
end

function var_0_0.GetSound(arg_30_0)
	return arg_30_0.sound
end

function var_0_0.GetPaintingActions(arg_31_0)
	return arg_31_0.action
end

function var_0_0.GetPaintingMoveToSide(arg_32_0)
	return arg_32_0.moveSideData
end

function var_0_0.ShouldMoveToSide(arg_33_0)
	return arg_33_0.moveSideData ~= nil
end

function var_0_0.GetPaintingAction(arg_34_0, arg_34_1)
	local var_34_0 = {}
	local var_34_1 = arg_34_0:GetPaintingActions()

	for iter_34_0, iter_34_1 in ipairs(var_34_1) do
		if iter_34_1.type == arg_34_1 then
			table.insert(var_34_0, iter_34_1)
		end
	end

	return var_34_0
end

function var_0_0.GetSide(arg_35_0)
	return arg_35_0.side
end

function var_0_0.GetContent(arg_36_0)
	if not arg_36_0.say then
		return "..."
	end

	local var_36_0 = arg_36_0.say

	if arg_36_0:ShouldReplacePlayer() then
		var_36_0 = arg_36_0:ReplacePlayerName(var_36_0)
	end

	if arg_36_0:ShouldReplaceTb() then
		var_36_0 = arg_36_0:ReplaceTbName(var_36_0)
	end

	if arg_36_0:ShouldReplaceDorm() then
		var_36_0 = arg_36_0:ReplaceDormName(var_36_0)
	end

	if PLATFORM_CODE ~= PLATFORM_US then
		var_36_0 = SwitchSpecialChar(HXSet.hxLan(var_36_0), true)
	else
		var_36_0 = HXSet.hxLan(var_36_0)
	end

	return var_36_0
end

function var_0_0.GetNameWithColor(arg_37_0)
	local var_37_0 = arg_37_0:GetName()

	if not var_37_0 then
		return nil
	end

	local var_37_1 = arg_37_0:GetNameColor()

	return setColorStr(var_37_0, var_37_1)
end

function var_0_0.GetNameColor(arg_38_0)
	return arg_38_0.nameColor or COLOR_WHITE
end

function var_0_0.GetNameColorCode(arg_39_0)
	local var_39_0 = arg_39_0:GetNameColor()

	return string.gsub(var_39_0, "#", "")
end

function var_0_0.GetCustomActorName(arg_40_0)
	if type(arg_40_0.actorName) == "number" and arg_40_0.actorName == 0 and getProxy(PlayerProxy) then
		return getProxy(PlayerProxy):getRawData().name
	elseif type(arg_40_0.actorName) == "number" then
		return ShipGroup.getDefaultShipNameByGroupID(arg_40_0.actorName)
	elseif type(arg_40_0.actorName) == "string" then
		return arg_40_0.actorName
	else
		return ""
	end
end

function var_0_0.GetPortraitName(arg_41_0)
	if not arg_41_0:ExistPortrait() then
		return ""
	end

	if type(arg_41_0.portrait) ~= "number" then
		return ""
	end

	local var_41_0 = var_0_1[arg_41_0.portrait]

	if not var_41_0 then
		return ""
	end

	local var_41_1 = ""
	local var_41_2 = var_41_0.ship_group
	local var_41_3 = ShipGroup.getDefaultShipConfig(var_41_2)

	if not var_41_3 then
		var_41_1 = var_41_0.name
	else
		var_41_1 = Ship.getShipName(var_41_3.id)
	end

	return var_41_1
end

function var_0_0.GetName(arg_42_0)
	local var_42_0 = arg_42_0.actorName and arg_42_0:GetCustomActorName() or arg_42_0:GetPaintingAndName() or ""

	if not var_42_0 or var_42_0 == "" then
		var_42_0 = arg_42_0:GetPortraitName()
	end

	if not var_42_0 or var_42_0 == "" or arg_42_0.withoutActorName then
		return nil
	end

	if arg_42_0:ShouldReplacePlayer() then
		var_42_0 = arg_42_0:ReplacePlayerName(var_42_0)
	end

	if arg_42_0:ShouldReplaceTb() then
		var_42_0 = arg_42_0:ReplaceTbName(var_42_0)
	end

	return (HXSet.hxLan(var_42_0))
end

function var_0_0.GetPainting(arg_43_0)
	local var_43_0, var_43_1 = arg_43_0:GetPaintingAndName()

	return var_43_1
end

function var_0_0.ExistPainting(arg_44_0)
	return arg_44_0:GetPainting() ~= nil
end

function var_0_0.ShouldShakeDailogue(arg_45_0)
	return arg_45_0.dialogShake ~= nil
end

function var_0_0.GetShakeDailogueData(arg_46_0)
	return arg_46_0.dialogShake
end

function var_0_0.IsSameSide(arg_47_0, arg_47_1)
	local var_47_0 = arg_47_0:GetPrevSide(arg_47_1)
	local var_47_1 = arg_47_0:GetSide()

	return var_47_0 ~= nil and var_47_1 ~= nil and var_47_0 == var_47_1
end

function var_0_0.GetPrevSide(arg_48_0, arg_48_1)
	local var_48_0 = arg_48_1:GetSide()

	if arg_48_0.moveSideData then
		var_48_0 = arg_48_0.moveSideData.side
	end

	return var_48_0
end

function var_0_0.GetPaintingIcon(arg_49_0)
	local var_49_0

	if arg_49_0.actor == var_0_0.ACTOR_TYPE_FLAGSHIP then
		local var_49_1 = getProxy(PlayerProxy):getRawData().character

		var_49_0 = getProxy(BayProxy):getShipById(var_49_1):getPrefab()
	else
		var_49_0 = (arg_49_0.actor ~= var_0_0.ACTOR_TYPE_PLAYER or nil) and (arg_49_0.actor ~= var_0_0.ACTOR_TYPE_TB or nil) and (arg_49_0.actor or nil) and (not arg_49_0.hideRecordIco or nil) and var_0_1[arg_49_0.actor].prefab
	end

	if var_49_0 == nil and arg_49_0:ExistPortrait() then
		var_49_0 = arg_49_0:GetPortrait()
	end

	return var_49_0
end

function var_0_0.GetPaintingAndName(arg_50_0)
	local var_50_0
	local var_50_1

	if not UnGamePlayState and arg_50_0.actor == var_0_0.ACTOR_TYPE_FLAGSHIP then
		local var_50_2 = getProxy(PlayerProxy):getRawData().character
		local var_50_3 = getProxy(BayProxy):getShipById(var_50_2)

		var_50_0 = var_50_3:getName()
		var_50_1 = var_50_3:getPainting()
	elseif not UnGamePlayState and arg_50_0.actor == var_0_0.ACTOR_TYPE_PLAYER then
		if getProxy(PlayerProxy) then
			var_50_0 = getProxy(PlayerProxy):getRawData().name
		else
			var_50_0 = ""
		end
	elseif not UnGamePlayState and arg_50_0.actor == var_0_0.ACTOR_TYPE_TB then
		if pg.NewStoryMgr.GetInstance():IsReView() then
			assert(arg_50_0.defaultTb and arg_50_0.defaultTb > 0, "<<< defaultTb is nil >>>")

			local var_50_4 = pg.secretary_special_ship[arg_50_0.defaultTb]

			var_50_0 = var_50_4.name or ""
			var_50_1 = var_50_4.prefab
		elseif arg_50_0.specialTbId then
			local var_50_5 = pg.secretary_special_ship[arg_50_0.specialTbId]

			assert(var_50_5)

			var_50_0 = var_50_5.name or ""
			var_50_1 = var_50_5.prefab
		elseif EducateProxy and getProxy(EducateProxy) then
			var_50_1, var_50_0 = getProxy(EducateProxy):GetStoryInfo()
		else
			var_50_0 = ""
		end
	elseif not arg_50_0.actor or var_0_1[arg_50_0.actor] == nil then
		var_50_0, var_50_1 = nil
	else
		local var_50_6 = var_0_1[arg_50_0.actor]
		local var_50_7 = var_50_6.ship_group
		local var_50_8 = ShipGroup.getDefaultShipConfig(var_50_7)

		if not var_50_8 then
			var_50_0 = var_50_6.name
		else
			var_50_0 = Ship.getShipName(var_50_8.id)
		end

		var_50_1 = var_50_6.painting
	end

	return HXSet.hxLan(var_50_0), var_50_1
end

function var_0_0.GetShipSkinId(arg_51_0)
	if arg_51_0.actor == var_0_0.ACTOR_TYPE_FLAGSHIP then
		local var_51_0 = getProxy(PlayerProxy):getRawData().character

		return getProxy(BayProxy):getShipById(var_51_0).skinId
	elseif arg_51_0.actor == var_0_0.ACTOR_TYPE_PLAYER then
		return nil
	elseif not arg_51_0.actor then
		return nil
	else
		return arg_51_0.actor
	end
end

function var_0_0.IsShowNPainting(arg_52_0)
	return arg_52_0.showNPainting
end

function var_0_0.IsShowWJZPainting(arg_53_0)
	return arg_53_0.showWJZPainting
end

function var_0_0.ShouldGrayPainting(arg_54_0)
	return arg_54_0.paingtingGray
end

function var_0_0.ShouldAddGlitchArtEffect(arg_55_0)
	return arg_55_0.glitchArt
end

function var_0_0.HideOtherPainting(arg_56_0)
	return arg_56_0.hideOtherPainting
end

function var_0_0.GetSubPaintings(arg_57_0)
	return _.map(arg_57_0.subPaintings or {}, function(arg_58_0)
		local var_58_0 = pg.ship_skin_template[arg_58_0.actor]

		assert(var_58_0)

		return {
			actor = arg_58_0.actor,
			name = var_58_0.painting,
			expression = arg_58_0.expression,
			pos = arg_58_0.pos,
			dir = arg_58_0.dir or 1,
			paintingNoise = arg_58_0.paintingNoise or false,
			showNPainting = arg_58_0.hidePaintObj or false
		}
	end)
end

function var_0_0.NeedDispppearSubPainting(arg_59_0)
	return #arg_59_0.disappearSeq > 0
end

function var_0_0.GetDisappearSeq(arg_60_0)
	return arg_60_0.disappearSeq
end

function var_0_0.GetDisappearTime(arg_61_0)
	return arg_61_0.disappearTime[1], arg_61_0.disappearTime[2]
end

function var_0_0.IsNoHeadPainting(arg_62_0)
	return arg_62_0.nohead
end

function var_0_0.GetFontSize(arg_63_0)
	return arg_63_0.fontSize
end

function var_0_0.IsSpinePainting(arg_64_0)
	if PLATFORM_CODE == PLATFORM_CH and HXSet.isHx() then
		return false
	end

	local var_64_0 = arg_64_0:GetPainting()

	return tobool(var_64_0 ~= nil and arg_64_0.spine)
end

function var_0_0.IsHideSpineBg(arg_65_0)
	return arg_65_0.spine == 1
end

function var_0_0.GetSpineOrderIndex(arg_66_0)
	if arg_66_0:IsSpinePainting() then
		return arg_66_0.spineOrderIndex
	else
		return nil
	end
end

function var_0_0.IsLive2dPainting(arg_67_0)
	if PLATFORM_CODE == PLATFORM_CH and HXSet.isHx() then
		return false
	end

	local var_67_0 = arg_67_0:GetPainting()

	return tobool(var_67_0 ~= nil and arg_67_0.live2d)
end

function var_0_0.GetLive2dPos(arg_68_0)
	if arg_68_0.live2dOffset then
		return Vector3(arg_68_0.live2dOffset[1], arg_68_0.live2dOffset[2], arg_68_0.live2dOffset[3])
	end
end

function var_0_0.GetVirtualShip(arg_69_0)
	local var_69_0 = arg_69_0:GetShipSkinId()
	local var_69_1 = pg.ship_skin_template[var_69_0].ship_group

	return StoryShip.New({
		skin_id = var_69_0
	})
end

function var_0_0.GetLive2dAction(arg_70_0)
	if type(arg_70_0.live2d) == "string" then
		local var_70_0 = pg.character_voice[arg_70_0.live2d]

		if var_70_0 then
			return var_70_0.l2d_action
		end

		return arg_70_0.live2d
	else
		return nil
	end
end

function var_0_0.GetL2dIdleIndex(arg_71_0)
	return arg_71_0.live2dIdleIndex
end

function var_0_0.GetSubActorName(arg_72_0)
	if arg_72_0.subActorName and arg_72_0.subActorName ~= "" then
		local var_72_0 = HXSet.hxLan(arg_72_0.subActorName)

		return " " .. setColorStr(var_72_0, arg_72_0.subActorNameColor)
	else
		return ""
	end
end

function var_0_0.IsSamePainting(arg_73_0, arg_73_1)
	local function var_73_0()
		return arg_73_1:ShouldAddGlitchArtEffect() or arg_73_0:ShouldAddGlitchArtEffect()
	end

	return (function()
		return arg_73_0:GetPainting() == arg_73_1:GetPainting() and arg_73_0:IsShowNPainting() == arg_73_1:IsShowNPainting() and arg_73_0:IsShowWJZPainting() == arg_73_1:IsShowWJZPainting()
	end)() and arg_73_0:IsLive2dPainting() == arg_73_1:IsLive2dPainting() and arg_73_0:IsSpinePainting() == arg_73_1:IsSpinePainting() and not var_73_0()
end

function var_0_0.ExistCanMarkNode(arg_76_0)
	return arg_76_0.canMarkNode ~= nil and type(arg_76_0.canMarkNode) == "table" and arg_76_0.canMarkNode[1] and arg_76_0.canMarkNode[1] ~= "" and arg_76_0.canMarkNode[2] and type(arg_76_0.canMarkNode[2]) == "table"
end

function var_0_0.GetCanMarkNodeData(arg_77_0)
	local var_77_0 = {}

	for iter_77_0, iter_77_1 in ipairs(arg_77_0.canMarkNode[2] or {}) do
		table.insert(var_77_0, iter_77_1 .. "")
	end

	return {
		name = arg_77_0.canMarkNode[1],
		marks = var_77_0
	}
end

function var_0_0.OnClear(arg_78_0)
	return
end

function var_0_0.GetUsingPaintingNames(arg_79_0)
	local var_79_0 = {}
	local var_79_1 = arg_79_0:GetPainting()

	if var_79_1 ~= nil then
		table.insert(var_79_0, var_79_1)
	end

	local var_79_2 = arg_79_0:GetSubPaintings()

	for iter_79_0, iter_79_1 in ipairs(var_79_2) do
		local var_79_3 = iter_79_1.name

		table.insert(var_79_0, var_79_3)
	end

	return var_79_0
end

return var_0_0
