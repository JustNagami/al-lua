local var_0_0 = class("LevelInfoSPView", import(".LevelInfoView"))

function var_0_0.getUIName(arg_1_0)
	return "LevelInfoSPUI"
end

function var_0_0.InitUI(arg_2_0)
	var_0_0.super.InitUI(arg_2_0)

	arg_2_0.levelBanner = arg_2_0._tf:Find("panel/Level")
	arg_2_0.btnSwitchNormal = arg_2_0._tf:Find("panel/Difficulty/Normal")
	arg_2_0.btnSwitchHard = arg_2_0._tf:Find("panel/Difficulty/Hard")
end

function var_0_0.SetChapterGroupInfo(arg_3_0, arg_3_1)
	arg_3_0.groupInfo = arg_3_1
end

function var_0_0.set(arg_4_0, arg_4_1, arg_4_2)
	var_0_0.super.set(arg_4_0, arg_4_1, arg_4_2)

	local var_4_0 = getProxy(ChapterProxy):getChapterById(arg_4_1, true)
	local var_4_1 = arg_4_0.groupInfo

	assert(var_4_1)

	local var_4_2 = {
		"Normal",
		"Hard"
	}
	local var_4_3 = 1
	local var_4_4

	if #var_4_1 > 1 then
		local var_4_5 = table.indexof(var_4_1, arg_4_1)

		var_4_3 = var_4_5
		var_4_4 = var_4_1[#var_4_1 - var_4_5 + 1]
	elseif var_4_0:IsSpChapter() or var_4_0:IsEXChapter() then
		var_4_3 = 2
	end

	for iter_4_0, iter_4_1 in ipairs(var_4_2) do
		setActive(arg_4_0.titleBG:Find(iter_4_1), iter_4_0 == var_4_3)
	end

	for iter_4_2, iter_4_3 in ipairs(var_4_2) do
		setActive(arg_4_0.levelBanner:Find(iter_4_3), iter_4_2 == var_4_3)
	end

	setActive(arg_4_0.btnSwitchNormal, #var_4_1 > 1 and var_4_3 == 1)
	setActive(arg_4_0.btnSwitchHard, #var_4_1 > 1 and var_4_3 == 2)

	if #var_4_1 > 1 then
		local var_4_6 = var_4_3 == 1 and arg_4_0.btnSwitchNormal or arg_4_0.btnSwitchHard

		for iter_4_4 = 1, 2 do
			local var_4_7 = var_4_6:Find("Bonus" .. iter_4_4)
			local var_4_8 = getProxy(ChapterProxy):getChapterById(var_4_1[iter_4_4], true)
			local var_4_9 = var_4_8:GetDailyBonusQuota()

			setActive(var_4_7, var_4_9)

			if var_4_9 then
				local var_4_10 = getProxy(ChapterProxy):getMapById(var_4_8:getConfig("map")):getConfig("type") == Map.ACTIVITY_HARD and "bonus_us_hard" or "bonus_us"

				arg_4_0.loader:GetSprite("ui/levelmainscene_atlas", var_4_10, var_4_7:Find("Image"))
			end
		end
	end

	local var_4_11 = var_4_3 == 1 and Color.NewHex("FFDE38") or Color.white

	setTextColor(arg_4_0:findTF("title_index", arg_4_0.txTitle), var_4_11)
	setTextColor(arg_4_0:findTF("title", arg_4_0.txTitle), var_4_11)
	setTextColor(arg_4_0:findTF("title_en", arg_4_0.txTitle), var_4_11)

	local var_4_12 = var_4_0:getConfig("boss_expedition_id")

	if var_4_0:getPlayType() == ChapterConst.TypeMultiStageBoss then
		var_4_12 = pg.chapter_model_multistageboss[var_4_0.id].boss_expedition_id
	end

	local var_4_13 = pg.expedition_data_template[var_4_12[#var_4_12]].level

	setText(arg_4_0.levelBanner:Find("Text"), "LV " .. var_4_13)
	onButton(arg_4_0, arg_4_0.btnSwitchNormal:Find("Switch"), function()
		arg_4_0:emit(LevelUIConst.SWITCH_SPCHAPTER_DIFFICULTY, var_4_4)
		arg_4_0:set(var_4_4)
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0.btnSwitchHard:Find("Switch"), function()
		arg_4_0:emit(LevelUIConst.SWITCH_SPCHAPTER_DIFFICULTY, var_4_4)
		arg_4_0:set(var_4_4)
	end, SFX_PANEL)
	;(function()
		if IsUnityEditor and not ENABLE_GUIDE then
			return
		end

		if var_4_3 ~= 1 or #var_4_1 == 1 then
			return
		end

		local var_7_0 = "NG0045"

		if pg.NewStoryMgr.GetInstance():IsPlayed(var_7_0) then
			return
		end

		pg.SystemGuideMgr.GetInstance():PlayByGuideId(var_7_0)
	end)()
end

return var_0_0
