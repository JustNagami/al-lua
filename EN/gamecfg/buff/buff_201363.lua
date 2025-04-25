return {
	time = 10,
	name = "2025荷兰活动 扬起郁金之旗",
	init_effect = "",
	stack = 1,
	id = 201363,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach"
			},
			arg_list = {
				minTargetNumber = 1,
				skill_id = 201364,
				nationality = 11,
				check_target = {
					"TargetSelf",
					"TargetNationalityFriendly"
				}
			}
		},
		{
			id = 1,
			type = "BattleBuffShieldWall",
			trigger = {
				"onStack",
				"onUpdate"
			},
			arg_list = {
				do_when_hit = "intercept",
				effect = "shield02",
				count = 3,
				bulletType = 1,
				cld_list = {
					{
						box = {
							4,
							6,
							9
						},
						offset = {
							1.02,
							0,
							1.22
						}
					}
				},
				centerPosFun = function(arg_1_0)
					local var_1_0 = arg_1_0 * 3

					return Vector3(math.sin(var_1_0) * 3, 0.75, math.cos(var_1_0) * 3)
				end,
				rotationFun = function(arg_2_0)
					return Vector3(0, arg_2_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST + 90, 0)
				end
			}
		},
		{
			id = 2,
			type = "BattleBuffShieldWall",
			trigger = {
				"onStack",
				"onUpdate"
			},
			arg_list = {
				do_when_hit = "intercept",
				effect = "shield02",
				count = 3,
				bulletType = 1,
				cld_list = {
					{
						box = {
							4,
							6,
							9
						},
						offset = {
							1.02,
							0,
							1.22
						}
					}
				},
				centerPosFun = function(arg_3_0)
					local var_3_0 = arg_3_0 * 3 + 3.14

					return Vector3(math.sin(var_3_0) * 3, 0.75, math.cos(var_3_0) * 3)
				end,
				rotationFun = function(arg_4_0)
					return Vector3(0, arg_4_0 * ys.Battle.BattleConfig.SHIELD_ROTATE_CONST + 270, 0)
				end
			}
		}
	}
}
