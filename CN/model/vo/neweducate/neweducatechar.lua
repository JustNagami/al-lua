local var_0_0 = class("NewEducateChar", import("model.vo.BaseVO"))

var_0_0.RES_TYPE = {
	FAVOR = 4,
	MONEY = 1,
	ACTION = 3,
	MOOD = 2
}
var_0_0.ATTR_TYPE = {
	ATTR = 1,
	PERSONALITY = 2
}

function var_0_0.bindConfigTable(arg_1_0)
	return pg.child2_data
end

function var_0_0.Ctor(arg_2_0, arg_2_1)
	arg_2_0.id = arg_2_1.id
	arg_2_0.configId = arg_2_0.id
	arg_2_0.roundData = NewEducateRound.New(arg_2_0.id, arg_2_1.round)

	arg_2_0:SetResources(arg_2_1.res.resource)
	arg_2_0:SetAttrs(arg_2_1.res.attrs)

	arg_2_0.group2Plan = {}

	for iter_2_0, iter_2_1 in ipairs(arg_2_1.plan.plan_upgrade or {}) do
		local var_2_0 = pg.child2_plan[iter_2_1].group_id

		arg_2_0.group2Plan[var_2_0] = iter_2_1
	end

	arg_2_0:InitSiteData(arg_2_1.site)

	arg_2_0.assessRecords = {}

	for iter_2_2, iter_2_3 in ipairs(arg_2_1.evaluations) do
		arg_2_0.assessRecords[iter_2_3.key] = iter_2_3.value
	end

	arg_2_0.callName = arg_2_1.name or ""
	arg_2_0.gotFavorLv = arg_2_1.favor_lv or 0
	arg_2_0.benefitData = NewEducateBenefit.New(arg_2_1.benefit)

	arg_2_0:BuildSiteIdMap()
end

function var_0_0.InitPermanent(arg_3_0, arg_3_1)
	arg_3_0.permanentData = NewEducatePermanent.New(arg_3_0.id, arg_3_1)
end

function var_0_0.SetPermanent(arg_4_0, arg_4_1)
	arg_4_0.permanentData = arg_4_1
end

function var_0_0.GetPermanentData(arg_5_0)
	return arg_5_0.permanentData
end

function var_0_0.GetGameCnt(arg_6_0)
	return arg_6_0.permanentData:GetGameCnt()
end

function var_0_0.InitFSM(arg_7_0, arg_7_1)
	arg_7_0.fsm = NewEducateFSM.New(arg_7_0.id, arg_7_1)
end

function var_0_0.InitSiteData(arg_8_0, arg_8_1)
	arg_8_0.siteShips = arg_8_1.characters or {}
	arg_8_0.normalType2Id = {}

	for iter_8_0, iter_8_1 in ipairs(arg_8_1.works or {}) do
		local var_8_0 = pg.child2_site_normal[iter_8_1].type

		arg_8_0.normalType2Id[var_8_0] = iter_8_1
	end

	local var_8_1 = pg.child2_site_normal.get_id_list_by_character[arg_8_0.id]

	for iter_8_2, iter_8_3 in pairs(NewEducateConst.SITE_NORMAL_TYPE) do
		if not arg_8_0.normalType2Id[iter_8_3] then
			arg_8_0.normalType2Id[iter_8_3] = underscore.detect(var_8_1, function(arg_9_0)
				local var_9_0 = pg.child2_site_normal[arg_9_0]

				return var_9_0.type == iter_8_3 and var_9_0.site_lv == 1
			end)
		end
	end

	arg_8_0.normalRecords = {}

	for iter_8_4, iter_8_5 in ipairs(arg_8_1.work_counter or {}) do
		arg_8_0.normalRecords[iter_8_5.key] = iter_8_5.value
	end

	arg_8_0.eventRecords = {}

	for iter_8_6, iter_8_7 in ipairs(arg_8_1.event_counter or {}) do
		arg_8_0.eventRecords[iter_8_7.key] = iter_8_7.value
	end
end

function var_0_0.GetSelectInfo(arg_10_0)
	return {
		bg = arg_10_0.roundData:getConfig("main_background"),
		name = arg_10_0:getConfig("name2"),
		gameCnt = arg_10_0:GetGameCnt(),
		progressStr = i18n("child2_cur_round", arg_10_0.roundData.round)
	}
end

function var_0_0.GetName(arg_11_0)
	return arg_11_0:getConfig("name")
end

function var_0_0.SetCallName(arg_12_0, arg_12_1)
	arg_12_0.callName = arg_12_1
end

function var_0_0.GetCallName(arg_13_0)
	return arg_13_0.callName
end

function var_0_0.BuildSiteIdMap(arg_14_0)
	arg_14_0.siteIdMap = {}

	for iter_14_0, iter_14_1 in pairs(NewEducateConst.SITE_TYPE) do
		local var_14_0 = pg.child2_site_display.get_id_list_by_type[iter_14_1]

		arg_14_0.siteIdMap[iter_14_1] = {}

		switch(iter_14_1, {
			[NewEducateConst.SITE_TYPE.SHIP] = function()
				underscore.each(var_14_0, function(arg_16_0)
					local var_16_0 = pg.child2_site_display[arg_16_0].param

					arg_14_0.siteIdMap[iter_14_1][var_16_0] = arg_16_0
				end)
			end,
			[NewEducateConst.SITE_TYPE.SHOP] = function()
				arg_14_0.siteIdMap[iter_14_1] = var_14_0
			end,
			[NewEducateConst.SITE_TYPE.WORK] = function()
				arg_14_0.siteIdMap[iter_14_1] = var_14_0
			end,
			[NewEducateConst.SITE_TYPE.TRAVEL] = function()
				arg_14_0.siteIdMap[iter_14_1] = var_14_0
			end,
			[NewEducateConst.SITE_TYPE.EVENT] = function()
				underscore.each(var_14_0, function(arg_21_0)
					local var_21_0 = pg.child2_site_display[arg_21_0].param

					arg_14_0.siteIdMap[iter_14_1][var_21_0] = arg_21_0
				end)
			end
		})
	end
end

function var_0_0.GetSiteId(arg_22_0, arg_22_1, arg_22_2)
	local var_22_0 = arg_22_2 or 1

	return arg_22_0.siteIdMap[arg_22_1][var_22_0]
end

function var_0_0.GetNormalIdByType(arg_23_0, arg_23_1)
	return arg_23_0.normalType2Id[arg_23_1]
end

function var_0_0.UpdateNormalType2Id(arg_24_0, arg_24_1, arg_24_2)
	arg_24_0.normalType2Id[arg_24_1] = arg_24_2
end

function var_0_0.AddNormalRecord(arg_25_0, arg_25_1)
	arg_25_0.normalRecords[arg_25_1] = (arg_25_0.normalRecords[arg_25_1] or 0) + 1
end

function var_0_0.GetNormalCnt(arg_26_0, arg_26_1)
	return arg_26_0.normalRecords[arg_26_1] or 0
end

function var_0_0.AddEventRecord(arg_27_0, arg_27_1)
	arg_27_0.eventRecords[arg_27_1] = (arg_27_0.eventRecords[arg_27_1] or 0) + 1
end

function var_0_0.GetEventCnt(arg_28_0, arg_28_1)
	return arg_28_0.eventRecords[arg_28_1] or 0
end

function var_0_0.SetShipIds(arg_29_0, arg_29_1)
	arg_29_0.siteShips = arg_29_1
end

function var_0_0.GetShipIds(arg_30_0)
	return arg_30_0.siteShips
end

function var_0_0.UpdateShipId(arg_31_0, arg_31_1, arg_31_2)
	table.removebyvalue(arg_31_0.siteShips, arg_31_1)
	table.insert(arg_31_0.siteShips, arg_31_2)
end

function var_0_0.AddAssessRecord(arg_32_0, arg_32_1, arg_32_2)
	arg_32_0.assessRecords[arg_32_1] = arg_32_2
end

function var_0_0.GetResources(arg_33_0)
	return Clone(arg_33_0.resources)
end

function var_0_0.SetResources(arg_34_0, arg_34_1)
	arg_34_0.resources = {}

	for iter_34_0, iter_34_1 in ipairs(arg_34_1) do
		arg_34_0.resources[iter_34_1.key] = iter_34_1.value
		arg_34_0.resources[iter_34_1.key] = math.max(pg.child2_resource[iter_34_1.key].min_value, arg_34_0.resources[iter_34_1.key])
		arg_34_0.resources[iter_34_1.key] = math.min(pg.child2_resource[iter_34_1.key].max_value, arg_34_0.resources[iter_34_1.key])
	end
end

function var_0_0.GetRes(arg_35_0, arg_35_1)
	return arg_35_0.resources[arg_35_1]
end

function var_0_0.GetPoint(arg_36_0)
	return arg_36_0:GetResByType(var_0_0.RES_TYPE.ACTION)
end

function var_0_0.GetResByType(arg_37_0, arg_37_1)
	return arg_37_0.resources[arg_37_0:GetResIdByType(arg_37_1)]
end

function var_0_0.GetResPanelIds(arg_38_0)
	return underscore.select(underscore.keys(arg_38_0.resources), function(arg_39_0)
		return pg.child2_resource[arg_39_0].type ~= var_0_0.RES_TYPE.FAVOR
	end)
end

function var_0_0.GetResIdByType(arg_40_0, arg_40_1)
	return underscore.detect(underscore.keys(arg_40_0.resources), function(arg_41_0)
		return pg.child2_resource[arg_41_0].type == arg_40_1
	end)
end

function var_0_0.UpdateRes(arg_42_0, arg_42_1, arg_42_2)
	arg_42_0.resources[arg_42_1] = arg_42_0.resources[arg_42_1] + arg_42_2
	arg_42_0.resources[arg_42_1] = math.max(pg.child2_resource[arg_42_1].min_value, arg_42_0.resources[arg_42_1])
	arg_42_0.resources[arg_42_1] = math.min(pg.child2_resource[arg_42_1].max_value, arg_42_0.resources[arg_42_1])
end

function var_0_0.GetMoodStage(arg_43_0, arg_43_1)
	local var_43_0 = pg.gameset.child_emotion.description
	local var_43_1 = arg_43_1 or arg_43_0:GetResByType(var_0_0.RES_TYPE.MOOD)

	if var_43_1 <= var_43_0[1][1][1] then
		return 1
	end

	if var_43_1 >= var_43_0[#var_43_0][1][2] then
		return #var_43_0
	end

	for iter_43_0, iter_43_1 in ipairs(var_43_0) do
		if var_43_1 >= iter_43_1[1][1] and var_43_1 < iter_43_1[1][2] then
			return iter_43_0
		end
	end
end

function var_0_0.UpgradeFavor(arg_44_0)
	arg_44_0.gotFavorLv = arg_44_0.gotFavorLv + 1
end

function var_0_0.CheckFavor(arg_45_0)
	local var_45_0 = arg_45_0:GetFavorInfo()
	local var_45_1 = arg_45_0:getConfig("favor_exp")[var_45_0.lv]

	if not var_45_1 then
		return false
	end

	return var_45_1 <= var_45_0.value
end

function var_0_0.GetFavorInfo(arg_46_0)
	local var_46_0 = arg_46_0:GetResByType(var_0_0.RES_TYPE.FAVOR)
	local var_46_1 = math.min(arg_46_0.gotFavorLv + 1, arg_46_0:getConfig("favor_level"))
	local var_46_2 = 0

	if arg_46_0.gotFavorLv > 0 then
		for iter_46_0 = 1, arg_46_0.gotFavorLv do
			var_46_2 = var_46_2 + arg_46_0:getConfig("favor_exp")[iter_46_0]
		end
	end

	return {
		lv = var_46_1,
		value = var_46_0 - var_46_2
	}
end

function var_0_0.GetAttrs(arg_47_0)
	return Clone(arg_47_0.attrs)
end

function var_0_0.SetAttrs(arg_48_0, arg_48_1)
	arg_48_0.attrs = {}

	for iter_48_0, iter_48_1 in ipairs(arg_48_1) do
		arg_48_0.attrs[iter_48_1.key] = iter_48_1.value
		arg_48_0.attrs[iter_48_1.key] = math.max(pg.child2_attr[iter_48_1.key].min_value, arg_48_0.attrs[iter_48_1.key])
		arg_48_0.attrs[iter_48_1.key] = math.min(pg.child2_attr[iter_48_1.key].max_value, arg_48_0.attrs[iter_48_1.key])
	end
end

function var_0_0.GetAttr(arg_49_0, arg_49_1)
	return arg_49_0.attrs[arg_49_1]
end

function var_0_0.GetAttrIds(arg_50_0, arg_50_1)
	local var_50_0 = underscore.select(underscore.keys(arg_50_0.attrs), function(arg_51_0)
		return pg.child2_attr[arg_51_0].type == var_0_0.ATTR_TYPE.ATTR
	end)

	table.sort(var_50_0)

	return var_50_0
end

function var_0_0.GetAttrSum(arg_52_0)
	return underscore.reduce(arg_52_0:GetAttrIds(), 0, function(arg_53_0, arg_53_1)
		return arg_53_0 + arg_52_0.attrs[arg_53_1]
	end)
end

function var_0_0.GetPersonalityId(arg_54_0)
	return underscore.detect(underscore.keys(arg_54_0.attrs), function(arg_55_0)
		return pg.child2_attr[arg_55_0].type == var_0_0.ATTR_TYPE.PERSONALITY
	end)
end

function var_0_0.GetPersonality(arg_56_0)
	return arg_56_0.attrs[arg_56_0:GetPersonalityId()]
end

function var_0_0.GetPersonalityMiddle(arg_57_0)
	local var_57_0 = arg_57_0:GetPersonalityId()
	local var_57_1 = pg.child2_attr[var_57_0]

	return math.floor((var_57_1.min_value + var_57_1.max_value) / 2)
end

function var_0_0.GetPersonalityTag(arg_58_0, arg_58_1)
	local var_58_0 = arg_58_1 or arg_58_0:GetPersonality()

	return (switch(arg_58_0:getConfig("personality_type"), {
		function()
			for iter_59_0, iter_59_1 in ipairs(arg_58_0:getConfig("personality_param")) do
				if var_58_0 >= iter_59_1[2][1] and var_58_0 <= iter_59_1[2][2] then
					return iter_59_1[1]
				end
			end

			return arg_58_0:getConfig("personality_param")[1][1]
		end
	}, function()
		assert(false, "不合法的personality_type")
	end))
end

function var_0_0.UpdateAttr(arg_61_0, arg_61_1, arg_61_2)
	arg_61_0.attrs[arg_61_1] = arg_61_0.attrs[arg_61_1] + arg_61_2
	arg_61_0.attrs[arg_61_1] = math.max(pg.child2_attr[arg_61_1].min_value, arg_61_0.attrs[arg_61_1])
	arg_61_0.attrs[arg_61_1] = math.min(pg.child2_attr[arg_61_1].max_value, arg_61_0.attrs[arg_61_1])
end

function var_0_0.GetAssessRankIdx(arg_62_0)
	local var_62_0 = arg_62_0.roundData:getConfig("target_id")

	if var_62_0 == 0 then
		return 0
	end

	local var_62_1 = arg_62_0:GetAttrSum()
	local var_62_2 = pg.child2_target[var_62_0].attr_sum_level

	for iter_62_0, iter_62_1 in ipairs(var_62_2) do
		if var_62_1 >= iter_62_1[1] and var_62_1 <= iter_62_1[2] then
			return iter_62_0
		end
	end

	return #var_62_2
end

function var_0_0.GetAssessPreStory(arg_63_0)
	local var_63_0 = arg_63_0.roundData:getConfig("target_id")

	if var_63_0 == 0 then
		return nil
	end

	return pg.child2_target[var_63_0].pre_perform
end

function var_0_0.GetRoundData(arg_64_0)
	return arg_64_0.roundData
end

function var_0_0.GetFSM(arg_65_0)
	return arg_65_0.fsm
end

function var_0_0.GetBgm(arg_66_0)
	local var_66_0 = arg_66_0:GetPersonalityTag()

	return underscore.detect(arg_66_0:getConfig("bgm"), function(arg_67_0)
		return arg_67_0[1] == var_66_0
	end)[2]
end

function var_0_0.GetPaintingName(arg_68_0)
	local var_68_0 = arg_68_0:GetPersonalityTag()

	return underscore.detect(arg_68_0.roundData:getConfig("main_painting"), function(arg_69_0)
		return arg_69_0[1] == var_68_0
	end)[2]
end

function var_0_0.GetBGName(arg_70_0)
	return arg_70_0.roundData:getConfig("main_background")
end

function var_0_0.GetMainDialogueInfo(arg_71_0)
	local var_71_0 = arg_71_0:GetPersonalityTag()
	local var_71_1 = underscore.detect(arg_71_0.roundData:getConfig("main_word"), function(arg_72_0)
		return arg_72_0[1] == var_71_0
	end)
	local var_71_2 = underscore.detect(arg_71_0.roundData:getConfig("main_word_expression"), function(arg_73_0)
		return arg_73_0[1] == var_71_0
	end)

	return var_71_1[2], var_71_2[2]
end

function var_0_0.OnUpgradedPlan(arg_74_0, arg_74_1)
	local var_74_0 = pg.child2_plan[arg_74_1].group_id

	arg_74_0.group2Plan[var_74_0] = arg_74_1
end

function var_0_0.GetPlanList(arg_75_0)
	local var_75_0 = {}
	local var_75_1 = arg_75_0.roundData:getConfig("plan_group")

	for iter_75_0, iter_75_1 in ipairs(var_75_1) do
		local var_75_2 = pg.child2_plan.get_id_list_by_group_id[iter_75_1]

		if #var_75_2 == 1 then
			table.insert(var_75_0, NewEducatePlan.New(var_75_2[1]))
		elseif arg_75_0.group2Plan[iter_75_1] then
			table.insert(var_75_0, NewEducatePlan.New(arg_75_0.group2Plan[iter_75_1]))
		else
			table.sort(var_75_2, function(arg_76_0, arg_76_1)
				return pg.child2_plan[arg_76_0].level < pg.child2_plan[arg_76_1].level
			end)
			table.insert(var_75_0, NewEducatePlan.New(var_75_2[1]))
		end
	end

	for iter_75_2, iter_75_3 in ipairs(arg_75_0.benefitData:GetExtraPlan(arg_75_0)) do
		table.insert(var_75_0, NewEducatePlan.New(iter_75_3, true))
	end

	return var_75_0
end

function var_0_0.OnNextRound(arg_77_0)
	arg_77_0.siteShips = {}

	arg_77_0.fsm:Reset()
	arg_77_0.roundData:OnNextRound()

	arg_77_0.resources[arg_77_0:GetResIdByType(NewEducateChar.RES_TYPE.ACTION)] = arg_77_0.roundData:getConfig("map_mobility")

	arg_77_0.benefitData:OnNextRound(arg_77_0.roundData.round)
end

function var_0_0.GetBenefitData(arg_78_0)
	return arg_78_0.benefitData
end

function var_0_0.AddBuff(arg_79_0, arg_79_1, arg_79_2)
	if arg_79_2 > 0 then
		if arg_79_0.fsm:IsImmediateBenefit() then
			arg_79_0.benefitData:AddActiveBuff(arg_79_1, arg_79_0.roundData.round)
		else
			arg_79_0.benefitData:AddPendingBuff(arg_79_1)
		end
	else
		arg_79_0.benefitData:RemoveBuff(arg_79_1)
	end
end

function var_0_0.GetTalentList(arg_80_0)
	return arg_80_0.benefitData:GetListByType(NewEducateBuff.TYPE.TALENT)
end

function var_0_0.GetTalent(arg_81_0, arg_81_1)
	return arg_81_0.benefitData:GetBuff(arg_81_1)
end

function var_0_0.GetStatusList(arg_82_0)
	return arg_82_0.benefitData:GetListByType(NewEducateBuff.TYPE.STATUS)
end

function var_0_0.GetStatus(arg_83_0, arg_83_1)
	return arg_83_0.benefitData:GetBuff(arg_83_1)
end

function var_0_0.GetGoodsDiscountInfos(arg_84_0)
	return arg_84_0.benefitData:GetGoodsDiscountInfos(arg_84_0)
end

function var_0_0.GetPlanDiscountInfos(arg_85_0)
	return arg_85_0.benefitData:GetPlanDiscountInfos(arg_85_0)
end

function var_0_0.IsUnlock(arg_86_0, arg_86_1)
	local var_86_0 = underscore.detect(arg_86_0:getConfig("unlock"), function(arg_87_0)
		return arg_87_0[1] == arg_86_1
	end)

	return (var_86_0 and var_86_0[2] or 1) <= arg_86_0.roundData.round
end

function var_0_0.GetOwnCnt(arg_88_0, arg_88_1)
	return switch(arg_88_1.type, {
		[NewEducateConst.DROP_TYPE.ATTR] = function()
			return arg_88_0:GetAttr(arg_88_1.id)
		end,
		[NewEducateConst.DROP_TYPE.RES] = function()
			return arg_88_0:GetRes(arg_88_1.id)
		end,
		[NewEducateConst.DROP_TYPE.BUFF] = function()
			return arg_88_0.benefitData:ExistBuff(arg_88_1.id) and 1 or 0
		end
	})
end

function var_0_0.IsMatch(arg_92_0, arg_92_1)
	return compareNumber(arg_92_0:GetOwnCnt(arg_92_1), arg_92_1.operator, arg_92_1.number)
end

function var_0_0.IsMatchs(arg_93_0, arg_93_1)
	return underscore.all(arg_93_1, function(arg_94_0)
		return arg_93_0:IsMatch(arg_94_0)
	end)
end

function var_0_0.IsMatchCondition(arg_95_0, arg_95_1)
	local var_95_0 = pg.child2_condition[arg_95_1]

	return (switch(var_95_0.type, {
		[NewEducateConst.CONDITION_TYPE.DROP] = function()
			local var_96_0 = {
				type = var_95_0.param[1],
				id = var_95_0.param[2],
				number = var_95_0.param[4]
			}

			return compareNumber(arg_95_0:GetOwnCnt(var_96_0), var_95_0.param[3], var_95_0.param[4])
		end,
		[NewEducateConst.CONDITION_TYPE.ATTR_SUM] = function()
			return compareNumber(arg_95_0:GetAttrSum(), var_95_0.param[1], var_95_0.param[2])
		end,
		[NewEducateConst.CONDITION_TYPE.EVENT_SITE_CNT] = function()
			return compareNumber(arg_95_0:GetEventCnt(var_95_0.param[1]), var_95_0.param[2], var_95_0.param[3])
		end,
		[NewEducateConst.CONDITION_TYPE.ROUND] = function()
			return compareNumber(arg_95_0.roundData.round, var_95_0.param[1], var_95_0.param[2])
		end,
		[NewEducateConst.CONDITION_TYPE.NORMAL_SITE_CNT] = function()
			local var_100_0 = underscore.reduce(var_95_0.param[1], 0, function(arg_101_0, arg_101_1)
				return arg_101_0 + arg_95_0:GetNormalCnt(arg_101_1)
			end)

			return compareNumber(var_100_0, var_95_0.param[2], var_95_0.param[3])
		end
	}, function()
		assert(false, "非法condition type" .. var_95_0.type)
	end))
end

function var_0_0.LogicalOperator(arg_103_0, arg_103_1)
	if type(arg_103_1) == "number" then
		return arg_103_0:IsMatchCondition(arg_103_1)
	end

	local var_103_0 = arg_103_1.operator

	if var_103_0 == "||" then
		if arg_103_1.conditions.operator then
			return underscore.any(arg_103_1.conditions, function(arg_104_0)
				return arg_103_0:LogicalOperator(arg_104_0)
			end)
		else
			return underscore.any(arg_103_1.conditions, function(arg_105_0)
				return arg_103_0:IsMatchCondition(arg_105_0)
			end)
		end
	elseif var_103_0 == "&&" then
		if arg_103_1.conditions.operator then
			return underscore.all(arg_103_1.conditions, function(arg_106_0)
				return arg_103_0:LogicalOperator(arg_106_0)
			end)
		else
			return underscore.all(arg_103_1.conditions, function(arg_107_0)
				return arg_103_0:IsMatchCondition(arg_107_0)
			end)
		end
	end
end

function var_0_0.IsFormatCondition(arg_108_0, arg_108_1)
	return (arg_108_1[1] == "||" or arg_108_1[1] == "&&") and type(arg_108_1[2]) == "table" and type(arg_108_1[2][1]) == "number"
end

function var_0_0.GetFormatCondition(arg_109_0, arg_109_1)
	if type(arg_109_1) == "number" then
		return arg_109_1
	end

	if arg_109_0:IsFormatCondition(arg_109_1) then
		return {
			operator = arg_109_1[1],
			conditions = arg_109_1[2]
		}
	elseif arg_109_0:IsFormatCondition(arg_109_1[2]) then
		return {
			operator = arg_109_1[1],
			conditions = underscore.map(arg_109_1[2], function(arg_110_0)
				arg_109_0:GetFormatCondition(arg_110_0)
			end)
		}
	end
end

function var_0_0.IsMatchComplex(arg_111_0, arg_111_1)
	if #arg_111_1 == 0 then
		return true
	end

	return arg_111_0:LogicalOperator(arg_111_0:GetFormatCondition(arg_111_1))
end

function var_0_0.GetConditionIdsFromComplex(arg_112_0, arg_112_1)
	if type(arg_112_1) == "number" then
		return {
			arg_112_1
		}
	end

	if type(arg_112_1) == "table" and #arg_112_1 == 0 then
		return arg_112_1
	end

	if arg_112_0:IsFormatCondition(arg_112_1) then
		return arg_112_1[2]
	elseif arg_112_0:IsFormatCondition(arg_112_1[2]) then
		return underscore.map(arg_112_1[2], function(arg_113_0)
			arg_112_0:GetConditionIdsFromComplex(arg_113_0)
		end)
	end
end

return var_0_0
