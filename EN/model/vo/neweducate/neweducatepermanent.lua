local var_0_0 = class("NewEducatePermanent")

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.id = arg_1_1
	arg_1_0.gameCnt = arg_1_2.ng_plus_count or 1
	arg_1_0.polaroids = arg_1_2.polaroids or {}

	arg_1_0:InitPolaroidsConfig()

	arg_1_0.finishedEndings = arg_1_2.active_endings or {}
	arg_1_0.activatedEndings = arg_1_2.endings or {}

	arg_1_0:InitStroyName2Id()
	arg_1_0:InitSecretary()
	arg_1_0:UpdateSecretaryIDs(false)
end

function var_0_0.AddGameCnt(arg_2_0)
	arg_2_0.gameCnt = arg_2_0.gameCnt + 1
end

function var_0_0.GetGameCnt(arg_3_0)
	return arg_3_0.gameCnt
end

function var_0_0.GetAllMemoryIds(arg_4_0)
	return pg.child2_memory.get_id_list_by_character[arg_4_0.id]
end

function var_0_0.GetUnlockMemoryIds(arg_5_0)
	return underscore.select(arg_5_0:GetAllMemoryIds(), function(arg_6_0)
		local var_6_0 = pg.child2_memory[arg_6_0].lua

		return (pg.NewStoryMgr.GetInstance():IsPlayed(var_6_0))
	end)
end

function var_0_0.InitStroyName2Id(arg_7_0)
	arg_7_0.name2memoryIds = {}

	underscore.each(arg_7_0:GetAllMemoryIds(), function(arg_8_0)
		arg_7_0.name2memoryIds[pg.child2_memory[arg_8_0].lua] = arg_8_0
	end)
end

function var_0_0.GetMemoryIdByName(arg_9_0, arg_9_1)
	return arg_9_0.name2memoryIds[arg_9_1]
end

function var_0_0.InitPolaroidsConfig(arg_10_0)
	local var_10_0 = pg.child2_polaroid.get_id_list_by_character[arg_10_0.id]

	arg_10_0.polaroidGroup2Ids = {}

	for iter_10_0, iter_10_1 in ipairs(var_10_0) do
		local var_10_1 = pg.child2_polaroid[iter_10_1].group

		if not arg_10_0.polaroidGroup2Ids[var_10_1] then
			arg_10_0.polaroidGroup2Ids[var_10_1] = {}
		end

		table.insert(arg_10_0.polaroidGroup2Ids[var_10_1], iter_10_1)
	end

	arg_10_0.unlockPolaroidGroups = {}

	for iter_10_2, iter_10_3 in ipairs(arg_10_0.polaroids) do
		local var_10_2 = pg.child2_polaroid[iter_10_3].group

		if not table.contains(arg_10_0.unlockPolaroidGroups, var_10_2) then
			table.insert(arg_10_0.unlockPolaroidGroups, var_10_2)
		end
	end
end

function var_0_0.GetPolaroidGroup2Ids(arg_11_0)
	return arg_11_0.polaroidGroup2Ids
end

function var_0_0.GetAllPolaroidGroups(arg_12_0)
	return underscore.keys(arg_12_0.polaroidGroup2Ids)
end

function var_0_0.GetUnlockPolaroidGroups(arg_13_0)
	return arg_13_0.unlockPolaroidGroups
end

function var_0_0.GetPolaroids(arg_14_0)
	return arg_14_0.polaroids
end

function var_0_0.AddPolaroid(arg_15_0, arg_15_1)
	table.insert(arg_15_0.polaroids, arg_15_1)

	local var_15_0 = pg.child2_polaroid[arg_15_1].group

	if not table.contains(arg_15_0.unlockPolaroidGroups, var_15_0) then
		table.insert(arg_15_0.unlockPolaroidGroups, var_15_0)
		arg_15_0:UpdateSecretaryIDs(true)
	end
end

function var_0_0.GetAllEndingIds(arg_16_0)
	return pg.child2_ending.get_id_list_by_character[arg_16_0.id]
end

function var_0_0.GetFinishedEndings(arg_17_0)
	return arg_17_0.finishedEndings
end

function var_0_0.AddFinishedEnding(arg_18_0, arg_18_1)
	if table.contains(arg_18_0.finishedEndings, arg_18_1) then
		return
	end

	table.insert(arg_18_0.finishedEndings, arg_18_1)
end

function var_0_0.GetActivatedEndings(arg_19_0)
	return arg_19_0.activatedEndings
end

function var_0_0.AddActivatedEndings(arg_20_0, arg_20_1)
	arg_20_0.activatedEndings = table.mergeArray(arg_20_0.activatedEndings, arg_20_1, true)

	arg_20_0:UpdateSecretaryIDs(true)
end

function var_0_0.InitSecretary(arg_21_0)
	arg_21_0.unlcokTipByPolaroidCnt = {}

	for iter_21_0, iter_21_1 in ipairs(pg.secretary_special_ship.all) do
		local var_21_0 = pg.secretary_special_ship[iter_21_1]

		if var_21_0.unlock_type == EducateConst.SECRETARY_UNLCOK_TYPE_POLAROID then
			local var_21_1 = var_21_0.unlock[1]

			if not table.contains(arg_21_0.unlcokTipByPolaroidCnt, var_21_1) then
				table.insert(arg_21_0.unlcokTipByPolaroidCnt, var_21_1)
			end
		end
	end
end

function var_0_0.CheckSecretaryID(arg_22_0, arg_22_1, arg_22_2)
	if arg_22_2 == "or" then
		for iter_22_0, iter_22_1 in ipairs(arg_22_1) do
			if table.contains(arg_22_0.activatedEndings, iter_22_1[1]) then
				return true
			end
		end

		return false
	elseif arg_22_2 == "and" then
		for iter_22_2, iter_22_3 in ipairs(arg_22_1) do
			if not table.contains(arg_22_0.activatedEndings, iter_22_3) then
				return false
			end

			return true
		end
	end

	return false
end

function var_0_0.UpdateSecretaryIDs(arg_23_0, arg_23_1)
	local var_23_0

	if arg_23_1 then
		var_23_0 = Clone(NewEducateHelper.GetAllUnlockSecretaryIds())
	end

	arg_23_0.unlockSecretaryIds = {}

	local var_23_1 = #arg_23_0.unlockPolaroidGroups

	for iter_23_0, iter_23_1 in ipairs(pg.secretary_special_ship.get_id_list_by_tb_id[arg_23_0.id]) do
		local var_23_2 = pg.secretary_special_ship[iter_23_1].unlock_type
		local var_23_3 = pg.secretary_special_ship[iter_23_1].unlock

		switch(var_23_2, {
			[EducateConst.SECRETARY_UNLCOK_TYPE_DEFAULT] = function()
				return
			end,
			[EducateConst.SECRETARY_UNLCOK_TYPE_POLAROID] = function()
				if var_23_3[1] and var_23_1 >= var_23_3[1] then
					table.insert(arg_23_0.unlockSecretaryIds, iter_23_1)
				end
			end,
			[EducateConst.SECRETARY_UNLCOK_TYPE_ENDING] = function()
				if var_23_3[1] then
					if type(var_23_3[1]) == "table" then
						if arg_23_0:CheckSecretaryID(var_23_3, "or") then
							table.insert(arg_23_0.unlockSecretaryIds, iter_23_1)
						end
					elseif type(var_23_3[1]) == "number" and arg_23_0:CheckSecretaryID(var_23_3, "and") then
						table.insert(arg_23_0.unlockSecretaryIds, iter_23_1)
					end
				end
			end,
			[EducateConst.SECRETARY_UNLCOK_TYPE_SHOP] = function()
				if var_23_3[1] and getProxy(ShipSkinProxy):hasSkin(var_23_3[1]) then
					table.insert(arg_23_0.unlockSecretaryIds, iter_23_1)
				end
			end,
			[EducateConst.SECRETARY_UNLCOK_TYPE_STORY] = function()
				if var_23_3[1] and pg.NewStoryMgr.GetInstance():IsPlayed(pg.NewStoryMgr.GetInstance():StoryId2StoryName(var_23_3[1])) then
					table.insert(arg_23_0.unlockSecretaryIds, iter_23_1)
				end
			end
		})
	end

	if arg_23_1 then
		getProxy(SettingsProxy):UpdateEducateCharTip(var_23_0)
	end
end

function var_0_0.GetUnlockSecretaryIds(arg_29_0)
	return arg_29_0.unlockSecretaryIds
end

return var_0_0
