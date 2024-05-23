return {
	init_effect = "",
	name = "",
	time = 1.5,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 17949,
	icon = 17940,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				attr = "hammerDamagePrevent",
				number = 0.8
			}
		},
		{
			type = "BattleBuffDeactiveCLDBox",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {}
		}
	}
}
