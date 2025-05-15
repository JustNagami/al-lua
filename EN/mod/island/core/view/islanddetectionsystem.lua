local var_0_0 = class("IslandDetectionSystem")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.view = arg_1_1
	arg_1_0.isAreaDetection = false

	arg_1_0:Init()
end

function var_0_0.Emit(arg_2_0, arg_2_1, ...)
	arg_2_0.view:Emit(arg_2_1, ...)
end

function var_0_0.Init(arg_3_0)
	arg_3_0.lastHighlightDic = {}

	arg_3_0:InitProductionCfg()
end

function var_0_0.InitProductionCfg(arg_4_0)
	arg_4_0.objectIdDic = {}
	arg_4_0.objectArrDic = {}

	for iter_4_0, iter_4_1 in ipairs(pg.island_production_farm.all) do
		local var_4_0 = pg.island_production_farm[iter_4_1]

		if var_4_0.objId ~= 0 then
			arg_4_0.objectIdDic[var_4_0.objId] = var_4_0
		end

		local var_4_1 = var_4_0.array

		if var_4_1 ~= "" then
			local var_4_2 = var_4_1[1]
			local var_4_3 = var_4_1[2]

			if not arg_4_0.objectArrDic[var_4_2] then
				arg_4_0.objectArrDic[var_4_2] = {}
			end

			arg_4_0.objectArrDic[var_4_2][var_4_3] = var_4_0
		end
	end
end

function var_0_0.SetAreaDetection(arg_5_0, arg_5_1)
	arg_5_0.isAreaDetection = not arg_5_0.isAreaDetection

	local var_5_0 = arg_5_0.isAreaDetection and "切换到3*3模式" or "切换到单块检测模式"

	pg.TipsMgr.GetInstance():ShowTips(i18n1(var_5_0))

	if arg_5_0.currentDate then
		arg_5_0:CrossDetectionHandle(arg_5_0.currentDate, true)
	end
end

function var_0_0.GetNearArea(arg_6_0, arg_6_1)
	if arg_6_1 == nil then
		return {}
	end

	local var_6_0 = arg_6_0.objectIdDic[arg_6_1].array
	local var_6_1 = {}

	if arg_6_0.isAreaDetection then
		local function var_6_2(arg_7_0, arg_7_1)
			return arg_7_0 >= 1 and arg_7_0 <= 6 and arg_7_1 >= 1 and arg_7_1 <= 6
		end

		for iter_6_0 = -1, 1 do
			for iter_6_1 = -1, 1 do
				local var_6_3 = var_6_0[1] + iter_6_0
				local var_6_4 = var_6_0[2] + iter_6_1

				if var_6_2(var_6_3, var_6_4) then
					local var_6_5 = arg_6_0.objectArrDic[var_6_3][var_6_4]

					table.insert(var_6_1, var_6_5.objId)
				end
			end
		end
	else
		table.insert(var_6_1, arg_6_1)
	end

	return var_6_1
end

function var_0_0.CrossDetectionHandle(arg_8_0, arg_8_1, arg_8_2)
	arg_8_0.currentDate = arg_8_1

	if arg_8_1.displayTpye and arg_8_1.displayTpye == "plant" then
		local var_8_0 = arg_8_1.targetNearId

		if var_8_0 ~= arg_8_0.pretargetNearId or arg_8_2 then
			local var_8_1 = arg_8_0:GetNearArea(var_8_0)

			local function var_8_2(arg_9_0)
				for iter_9_0, iter_9_1 in ipairs(var_8_1) do
					if iter_9_1 == arg_9_0 then
						return true
					end
				end

				return false
			end

			for iter_8_0, iter_8_1 in pairs(arg_8_0.lastHighlightDic) do
				if not var_8_2(iter_8_0) then
					arg_8_0.lastHighlightDic[iter_8_0] = nil

					local var_8_3 = arg_8_0:GetUnitModule(iter_8_0)._go

					GetOrAddComponent(var_8_3, "HighlightController"):HighlightOff()
				end
			end

			if var_8_0 then
				for iter_8_2, iter_8_3 in ipairs(var_8_1) do
					if not arg_8_0.lastHighlightDic[iter_8_3] then
						arg_8_0.lastHighlightDic[iter_8_3] = true

						local var_8_4 = arg_8_0:GetUnitModule(iter_8_3)
						local var_8_5 = arg_8_0:GetUnitModule(iter_8_3)._go

						GetOrAddComponent(var_8_5, "HighlightController"):HighlightOn()
					end
				end
			end

			arg_8_0.pretargetNearId = var_8_0
		end
	end
end

function var_0_0.GetUnitModule(arg_10_0, arg_10_1)
	return arg_10_0.view:GetUnitModule(arg_10_1)
end

function var_0_0.OnPlayerPlant(arg_11_0)
	for iter_11_0, iter_11_1 in pairs(arg_11_0.lastHighlightDic) do
		arg_11_0:GetUnitModule(iter_11_0):DoPlant()
	end
end

function var_0_0.GetView(arg_12_0)
	return arg_12_0.view
end

function var_0_0.Dispose(arg_13_0)
	return
end

function var_0_0.Update(arg_14_0)
	return
end

return var_0_0
