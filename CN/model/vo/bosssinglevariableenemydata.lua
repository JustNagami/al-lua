local var_0_0 = class("BossSingleVariableEnemyData", import(".BossSingleEnemyData"))

var_0_0.TYPE = {
	EAST = 1,
	HARD = 3,
	NORMAL = 2,
	SP = 4
}

function var_0_0.IsContinuousType(arg_1_0)
	return true
end

return var_0_0
