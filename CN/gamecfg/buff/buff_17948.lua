return {
	init_effect = "",
	name = "",
	time = 1.5,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 17948,
	icon = 17940,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCount",
			trigger = {
				"onTakeDamage"
			},
			arg_list = {
				maxHPRatio = 0.1,
				countType = 17940
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onBattleBuffCount"
			},
			arg_list = {
				target = "TargetSelf",
				skill_id = 17942,
				countType = 17940
			}
		}
	}
}
