local var_0_0 = class("MainIslandActDelegationBtn", import(".MainBaseSpcailActBtn"))

function var_0_0.InShowTime(arg_1_0)
	local var_1_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_ISLAND)

	return var_1_0 and not var_1_0:isEnd()
end

function var_0_0.GetUIName(arg_2_0)
	return "MainIslandActDelegationBtn"
end

function var_0_0.OnClick(arg_3_0)
	arg_3_0.event:emit(NewMainMediator.GO_SCENE, SCENE.ANNIVERSARY_ISLAND_SEA, {
		checkMain = true
	})
end

function var_0_0.OnInit(arg_4_0)
	return
end

function var_0_0.OnRegister(arg_5_0)
	arg_5_0.redDot = RedDotNode.New(arg_5_0._tf:Find("tip"), {
		pg.RedDotMgr.TYPES.ISLAND
	})

	pg.redDotHelper:AddNode(arg_5_0.redDot)
end

function var_0_0.OnClear(arg_6_0)
	if arg_6_0.redDot then
		pg.redDotHelper:RemoveNode(arg_6_0.redDot)
	end
end

return var_0_0
