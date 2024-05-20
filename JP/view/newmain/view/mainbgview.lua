local var_0_0 = class("MainBGView")
local var_0_1 = {
	{
		{
			0,
			5
		},
		"bg_main_night"
	},
	{
		{
			5,
			8
		},
		"bg_main_twilight"
	},
	{
		{
			8,
			16
		},
		"bg_main_day"
	},
	{
		{
			16,
			19
		},
		"bg_main_twilight"
	},
	{
		{
			19,
			24
		},
		"bg_main_night"
	}
}
local var_0_2 = 0

function var_0_0.GetBgAndBgm()
	local var_1_0 = var_0_1
	local var_1_1 = getProxy(ActivityProxy):RawGetActivityById(pg.gameset.dayandnight_bgm.key_value)

	if var_1_1 and not var_1_1:isEnd() then
		var_1_0 = pg.gameset.dayandnight_bgm.description
	end

	local var_1_2 = pg.TimeMgr.GetInstance():GetServerHour()

	for iter_1_0, iter_1_1 in ipairs(var_1_0) do
		local var_1_3 = iter_1_1[1]

		if var_1_2 >= var_1_3[1] and var_1_2 < var_1_3[2] then
			return iter_1_1[2], iter_1_1[3]
		end
	end
end

function var_0_0.Ctor(arg_2_0, arg_2_1)
	arg_2_0._tf = arg_2_1
	arg_2_0._go = arg_2_1.gameObject
	arg_2_0.paintingCanvases = {
		arg_2_1.parent.parent:Find("paintBg"):GetComponent(typeof(Canvas)),
		arg_2_1.parent.parent:Find("paint"):GetComponent(typeof(Canvas)),
		arg_2_1.parent.parent:Find("chat"):GetComponent(typeof(Canvas))
	}
	arg_2_0.isSpecialBg = false
	arg_2_0.isloading = false
end

function var_0_0.getUIName(arg_3_0)
	return "MainBGView"
end

function var_0_0.Init(arg_4_0, arg_4_1)
	arg_4_0.ship = arg_4_1

	arg_4_0:ClearSpecailBg()

	local var_4_0 = arg_4_1:getShipBgPrint()

	arg_4_0.isSpecialBg = var_4_0 ~= arg_4_1:rarity2bgPrintForGet()

	local var_4_1, var_4_2 = MainPaintingView.GetAssistantStatus(arg_4_1)

	if arg_4_0.isSpecialBg and var_4_2 then
		arg_4_0:SetSpecailBg(var_4_0)
		arg_4_0:ClearMapBg()
	elseif var_0_2 and var_0_2 ~= 0 then
		local var_4_3 = pg.expedition_data_by_map[var_0_2]

		assert(var_4_3, "expedition_data_by_map >>> " .. var_0_2)

		local var_4_4 = var_4_3.bg .. "_" .. var_4_3.ani_name

		if arg_4_0.mapLoaderKey ~= var_4_4 then
			arg_4_0:ClearMapBg()

			arg_4_0.mapLoaderKey = var_4_4

			arg_4_0:SetMapBg(var_4_3.bg, var_4_3.ani_name)
		end
	else
		local var_4_5 = var_0_0.GetBgAndBgm()

		arg_4_0:SetCommonBg(var_4_5)
		arg_4_0:ClearMapBg()
	end
end

function var_0_0.Refresh(arg_5_0, arg_5_1)
	arg_5_0:Init(arg_5_1)
end

function var_0_0.SetSpecailBg(arg_6_0, arg_6_1)
	arg_6_0.isloading = true

	pg.DynamicBgMgr.GetInstance():LoadBg(arg_6_0, arg_6_1, arg_6_0._tf.parent, arg_6_0._tf, function(arg_7_0)
		arg_6_0.isloading = false
		arg_7_0.transform.localPosition = Vector3(0, 0, 200)
	end, function()
		arg_6_0.isloading = false
	end)
end

function var_0_0.SetMapBg(arg_9_0, arg_9_1, arg_9_2)
	arg_9_0.isloading = true
	arg_9_0.effectGo = nil

	parallelAsync({
		function(arg_10_0)
			PoolMgr.GetInstance():GetSprite("levelmap/" .. arg_9_1, "", true, function(arg_11_0)
				setImageSprite(arg_9_0._tf, arg_11_0)
				arg_10_0()
			end)
		end,
		function(arg_12_0)
			if not arg_9_2 or arg_9_2 == "" then
				arg_12_0()

				return
			end

			PoolMgr.GetInstance():GetPrefab("ui/" .. arg_9_2, "", true, function(arg_13_0)
				setParent(arg_13_0, arg_9_0._tf)
				arg_9_0:AdjustMapEffect(arg_13_0)

				arg_9_0.effectGo = arg_13_0

				arg_12_0()
			end)
		end
	}, function()
		arg_9_0.isloading = false
	end)
end

function var_0_0.ClearMapBg(arg_15_0)
	if not IsNil(arg_15_0.effectGo) then
		Object.Destroy(arg_15_0.effectGo)

		arg_15_0.effectGo = nil
	end

	for iter_15_0, iter_15_1 in ipairs(arg_15_0.paintingCanvases) do
		iter_15_1.overrideSorting = false
		iter_15_1.sortingOrder = 0
	end

	arg_15_0.mapLoaderKey = nil
end

function var_0_0.AdjustMapEffect(arg_16_0, arg_16_1)
	local var_16_0 = -math.huge
	local var_16_1 = arg_16_1:GetComponentsInChildren(typeof(Canvas))

	for iter_16_0 = 1, var_16_1.Length do
		local var_16_2 = var_16_1[iter_16_0 - 1]

		if var_16_0 < var_16_2.sortingOrder then
			var_16_0 = var_16_2.sortingOrder
		end
	end

	local var_16_3 = arg_16_1:GetComponentsInChildren(typeof("UnityEngine.ParticleSystemRenderer"))

	for iter_16_1 = 1, var_16_3.Length do
		local var_16_4 = var_16_3[iter_16_1 - 1]
		local var_16_5 = ReflectionHelp.RefGetProperty(typeof("UnityEngine.ParticleSystemRenderer"), "sortingOrder", var_16_4)

		if var_16_0 < var_16_5 then
			var_16_0 = var_16_5
		end
	end

	for iter_16_2, iter_16_3 in ipairs(arg_16_0.paintingCanvases) do
		iter_16_3.overrideSorting = true
		iter_16_3.sortingOrder = var_16_0 + (iter_16_2 == 3 and 2 or 1)
	end
end

function var_0_0.SetCommonBg(arg_17_0, arg_17_1)
	setActive(arg_17_0._tf, true)

	arg_17_0.isloading = true

	PoolMgr.GetInstance():GetSprite("commonbg/" .. arg_17_1, "", true, function(arg_18_0)
		arg_17_0.isloading = false

		setImageSprite(arg_17_0._tf, arg_18_0)
	end)
end

function var_0_0.ClearSpecailBg(arg_19_0)
	if arg_19_0.isSpecialBg then
		pg.DynamicBgMgr.GetInstance():ClearBg(arg_19_0:getUIName())

		arg_19_0.isSpecialBg = false
	end
end

function var_0_0.IsLoading(arg_20_0)
	return arg_20_0.isloading
end

function var_0_0.Disable(arg_21_0)
	arg_21_0:ClearSpecailBg()
end

function var_0_0.Dispose(arg_22_0)
	arg_22_0:ClearSpecailBg()
	arg_22_0:ClearMapBg()
end

return var_0_0
