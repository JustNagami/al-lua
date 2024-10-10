pg = pg or {}
pg.ClickEffectMgr = singletonClass("ClickEffectMgr")

local var_0_0 = pg.ClickEffectMgr

var_0_0.CONFIG = {
	NORMAL = {
		"ui",
		"ClickEffect"
	},
	DORM3D = {
		"dorm3d/effect/prefab/ui",
		"vfx_ui_dianji01"
	}
}

function var_0_0.Init(arg_1_0, arg_1_1)
	print("initializing click effect manager...")

	arg_1_0.OverlayCamera = tf(GameObject.Find("OverlayCamera"))
	arg_1_0.OverlayEffect = arg_1_0.OverlayCamera:Find("Overlay/UIEffect")
	arg_1_0.OverlayEffectClickCom = arg_1_0.OverlayEffect:GetComponent("ClickEffectBehaviour")

	arg_1_0.OverlayEffectClickCom:Init(arg_1_0.OverlayCamera:GetComponent("Camera"), arg_1_0.OverlayEffect)

	arg_1_0.effectClick = nil
	arg_1_0.effectDic = {}

	local var_1_0 = PlayerPrefs.GetInt(SHOW_TOUCH_EFFECT, 1) > 0

	SetActive(arg_1_0.OverlayEffect, var_1_0)
	arg_1_0:SetClickEffect("NORMAL", nil, nil, arg_1_1)
end

function var_0_0.ClearClickEffect(arg_2_0)
	if arg_2_0.clickEffect then
		arg_2_0.OverlayEffectClickCom:UnRegisterEffect()
		SetActive(arg_2_0.clickEffect, false)

		arg_2_0.clickEffect = nil
	end
end

function var_0_0.SetClickEffect(arg_3_0, arg_3_1, arg_3_2, arg_3_3, arg_3_4)
	if not arg_3_0.CONFIG[arg_3_1] then
		return
	end

	local var_3_0 = arg_3_0.CONFIG[arg_3_1][1]
	local var_3_1 = arg_3_0.CONFIG[arg_3_1][2]

	arg_3_0:ClearClickEffect()

	arg_3_0.clickEffect = arg_3_0.effectDic[var_3_1]

	local function var_3_2()
		arg_3_0.OverlayEffectClickCom:RegisterEffect(arg_3_0.clickEffect, arg_3_2, arg_3_3)

		if arg_3_4 then
			arg_3_4()
		end
	end

	if arg_3_0.clickEffect then
		var_3_2()
	else
		LoadAndInstantiateAsync(var_3_0, var_3_1, function(arg_5_0)
			arg_3_0.effectDic[var_3_1] = go(arg_5_0)

			setParent(arg_3_0.effectDic[var_3_1], arg_3_0.OverlayEffect)

			arg_3_0.clickEffect = arg_3_0.effectDic[var_3_1]

			var_3_2()
		end)
	end
end
