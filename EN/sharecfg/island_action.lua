pg = pg or {}
pg.island_action = rawget(pg, "island_action") or setmetatable({
	__name = "island_action"
}, confNEO)
pg.island_action.all = {
	1000,
	1001,
	1002,
	1003,
	1004,
	1005,
	1006,
	1007,
	1008,
	1009,
	1011,
	1012,
	1013,
	1014,
	1015,
	1016,
	1017,
	1018,
	1019,
	1020,
	1021,
	1022,
	1023,
	1024,
	1025,
	1026,
	1027,
	1028,
	1029,
	1030,
	1031,
	1032,
	1033,
	1034,
	1035,
	1036,
	2000,
	2001,
	2002,
	2003,
	2004,
	2005,
	2006,
	2007
}
pg.island_action.get_id_list_by_type = {
	{
		1000,
		1001,
		1002,
		1003,
		1004,
		1005,
		1006,
		1007,
		1008,
		1009,
		1011,
		1012,
		1013,
		1014,
		1015,
		1016,
		1017,
		1018,
		1019,
		1020,
		1021,
		1022,
		1023,
		1024,
		1025,
		1026,
		1027,
		1028,
		1029,
		1030,
		1031,
		1032,
		1033,
		1034,
		1035,
		1036
	},
	{
		2000,
		2001,
		2002,
		2003,
		2004,
		2005,
		2006,
		2007
	}
}
pg.base = pg.base or {}
pg.base.island_action = {}

;(function()
	pg.base.island_action[1000] = {
		respond_dir = 0,
		name = "Greet",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "Character action to [Greet], it shows the character's emotion and attitude.",
		sigle_action_reply_type = 2,
		resource = "hi",
		tech_id = 0,
		id = 1000,
		responder_feedback = "",
		chara_sigle_action_reply = {
			101,
			102,
			104
		},
		jump_page = {}
	}
	pg.base.island_action[1001] = {
		respond_dir = 0,
		name = "Goodbye",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "Character action to [Goodbye], it shows the character's emotion and attitude.",
		sigle_action_reply_type = 2,
		resource = "bye",
		tech_id = 0,
		id = 1001,
		responder_feedback = "",
		chara_sigle_action_reply = {
			101
		},
		jump_page = {}
	}
	pg.base.island_action[1002] = {
		respond_dir = 0,
		name = "Nod",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "Character action to [Nod], it shows the character's emotion and attitude.",
		sigle_action_reply_type = 2,
		resource = "nod",
		tech_id = 0,
		id = 1002,
		responder_feedback = "",
		chara_sigle_action_reply = {
			103,
			105
		},
		jump_page = {}
	}
	pg.base.island_action[1003] = {
		respond_dir = 0,
		name = "Shake Head",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "Character action to [Shake Head], it shows the character's emotion and attitude.",
		sigle_action_reply_type = 2,
		resource = "shakehead",
		tech_id = 0,
		id = 1003,
		responder_feedback = "",
		chara_sigle_action_reply = {
			202,
			207
		},
		jump_page = {}
	}
	pg.base.island_action[1004] = {
		respond_dir = 0,
		name = "Clap",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "Character action to [Clap], it shows the character's emotion and attitude.",
		sigle_action_reply_type = 2,
		resource = "clap",
		tech_id = 0,
		id = 1004,
		responder_feedback = "",
		chara_sigle_action_reply = {
			103,
			105
		},
		jump_page = {}
	}
	pg.base.island_action[1005] = {
		respond_dir = 0,
		name = "Praise the Sun",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "Character action to [Praise the Sun], it shows the character's emotion and attitude.",
		sigle_action_reply_type = 2,
		resource = "handsup",
		tech_id = 0,
		id = 1005,
		responder_feedback = "",
		chara_sigle_action_reply = {
			204,
			207
		},
		jump_page = {
			{
				"星彩奖",
				{}
			}
		}
	}
	pg.base.island_action[1006] = {
		respond_dir = 0,
		name = "Hands on Hips",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "Character action to [Hands on Hips], it shows the character's emotion and attitude.",
		sigle_action_reply_type = 2,
		resource = "akimbo",
		tech_id = 0,
		id = 1006,
		responder_feedback = "",
		chara_sigle_action_reply = {
			106
		},
		jump_page = {}
	}
	pg.base.island_action[1007] = {
		respond_dir = 0,
		name = "Bow",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "Character action to [Bow], it shows the character's emotion and attitude.",
		sigle_action_reply_type = 2,
		resource = "bow",
		tech_id = 0,
		id = 1007,
		responder_feedback = "",
		chara_sigle_action_reply = {
			105,
			204
		},
		jump_page = {
			{
				"Island Collection",
				{}
			}
		}
	}
	pg.base.island_action[1008] = {
		respond_dir = 0,
		name = "Excited Jump",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "Character action to [Excited Jump], it shows the character's emotion and attitude.",
		sigle_action_reply_type = 2,
		resource = "vjump",
		tech_id = 0,
		id = 1008,
		responder_feedback = "",
		chara_sigle_action_reply = {
			106,
			204
		},
		jump_page = {
			{
				"Island Seasonal Shop",
				{}
			}
		}
	}
	pg.base.island_action[1009] = {
		respond_dir = 0,
		name = "Stamp Feet",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "Character action to [Stamp Feet], it shows the character's emotion and attitude.",
		sigle_action_reply_type = 2,
		resource = "stomp",
		tech_id = 0,
		id = 1009,
		responder_feedback = "",
		chara_sigle_action_reply = {
			201,
			207
		},
		jump_page = {}
	}
	pg.base.island_action[1011] = {
		respond_dir = 0,
		name = "Flaunt Muscles",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "Character action to [Flaunt Muscles], it shows the character's emotion and attitude.",
		sigle_action_reply_type = 2,
		resource = "muscle",
		tech_id = 0,
		id = 1011,
		responder_feedback = "",
		chara_sigle_action_reply = {
			106,
			204
		},
		jump_page = {
			{
				"Island Seasonal Shop",
				{}
			}
		}
	}
	pg.base.island_action[1012] = {
		respond_dir = 0,
		name = "Dance",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "Character action to [Dance], it shows the character's emotion and attitude.",
		sigle_action_reply_type = 2,
		resource = "dance",
		tech_id = 0,
		id = 1012,
		responder_feedback = "",
		chara_sigle_action_reply = {
			106,
			204
		},
		jump_page = {
			{
				"星彩奖",
				{}
			}
		}
	}
	pg.base.island_action[1013] = {
		respond_dir = 0,
		name = "The Hero is Here",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "The hero is here! Express your style and enthusiasm to the world.",
		sigle_action_reply_type = 2,
		resource = "herocoming",
		tech_id = 0,
		id = 1013,
		responder_feedback = "",
		chara_sigle_action_reply = {
			204,
			207
		},
		jump_page = {
			{
				"Island Seasonal Shop",
				{}
			}
		}
	}
	pg.base.island_action[1014] = {
		respond_dir = 0,
		name = "Stretch",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "Action - Stretch",
		sigle_action_reply_type = 2,
		resource = "stretch",
		tech_id = 0,
		id = 1014,
		responder_feedback = "",
		chara_sigle_action_reply = {
			207
		},
		jump_page = {
			{
				"Island Seasonal Shop",
				{}
			}
		}
	}
	pg.base.island_action[1015] = {
		respond_dir = 0,
		name = "Cower",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "Action - Cower",
		sigle_action_reply_type = 2,
		resource = "fearshake",
		tech_id = 0,
		id = 1015,
		responder_feedback = "",
		chara_sigle_action_reply = {
			201,
			207
		},
		jump_page = {
			{
				"Island Seasonal Shop",
				{}
			}
		}
	}
	pg.base.island_action[1016] = {
		respond_dir = 0,
		name = "Clench Fists",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "Action - Clench Fists",
		sigle_action_reply_type = 2,
		resource = "holdfist",
		tech_id = 0,
		id = 1016,
		responder_feedback = "",
		chara_sigle_action_reply = {
			103,
			107
		},
		jump_page = {
			{
				"Island Seasonal Shop",
				{}
			}
		}
	}
	pg.base.island_action[1017] = {
		respond_dir = 0,
		name = "Smug",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "Action - Smug",
		sigle_action_reply_type = 2,
		resource = "vouch",
		tech_id = 0,
		id = 1017,
		responder_feedback = "",
		chara_sigle_action_reply = {
			106,
			108
		},
		jump_page = {
			{
				"Island Seasonal Shop",
				{}
			}
		}
	}
	pg.base.island_action[1018] = {
		respond_dir = 0,
		name = "Meditate",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "Action - Meditate",
		sigle_action_reply_type = 2,
		resource = "float",
		tech_id = 0,
		id = 1018,
		responder_feedback = "",
		chara_sigle_action_reply = {
			106,
			108
		},
		jump_page = {
			{
				"Stellar Prize Draw",
				{}
			}
		}
	}
	pg.base.island_action[1019] = {
		respond_dir = 0,
		name = "Refuse",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "Action - Refuse",
		sigle_action_reply_type = 2,
		resource = "refuse",
		tech_id = 0,
		id = 1019,
		responder_feedback = "",
		chara_sigle_action_reply = {
			204,
			207
		},
		jump_page = {
			{
				"Season Ⅲ - Island Seasonal Shop",
				{}
			}
		}
	}
	pg.base.island_action[1020] = {
		respond_dir = 0,
		name = "Yawn",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "Action - Yawn",
		sigle_action_reply_type = 2,
		resource = "yawn",
		tech_id = 0,
		id = 1020,
		responder_feedback = "",
		chara_sigle_action_reply = {
			108,
			207
		},
		jump_page = {
			{
				"Season Ⅲ - Island Seasonal Shop",
				{}
			}
		}
	}
	pg.base.island_action[1021] = {
		respond_dir = 0,
		name = "Wipe Sweat",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "Action - Wipe Sweat",
		sigle_action_reply_type = 2,
		resource = "wipingsweat",
		tech_id = 0,
		id = 1021,
		responder_feedback = "",
		chara_sigle_action_reply = {
			204
		},
		jump_page = {
			{
				"Season Ⅲ - Island Seasonal Shop",
				{}
			}
		}
	}
	pg.base.island_action[1022] = {
		respond_dir = 0,
		name = "Scratch Head",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "Action - Scratch Head",
		sigle_action_reply_type = 2,
		resource = "scratchinghead",
		tech_id = 0,
		id = 1022,
		responder_feedback = "",
		chara_sigle_action_reply = {
			105,
			106
		},
		jump_page = {
			{
				"Season Ⅲ - Island Seasonal Shop",
				{}
			}
		}
	}
	pg.base.island_action[1023] = {
		respond_dir = 0,
		name = "Shoot Hoops",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "Action - Shoot Hoops",
		sigle_action_reply_type = 2,
		resource = "shootingbasketball",
		tech_id = 0,
		id = 1023,
		responder_feedback = "",
		chara_sigle_action_reply = {
			102,
			106
		},
		jump_page = {
			{
				"Stellar Prize Draw",
				{}
			}
		}
	}
	pg.base.island_action[1024] = {
		respond_dir = 0,
		name = "Blow Kiss",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "Action - Blow Kiss",
		sigle_action_reply_type = 2,
		resource = "blowkisses",
		tech_id = 0,
		id = 1024,
		responder_feedback = "",
		chara_sigle_action_reply = {
			102,
			104,
			105
		},
		jump_page = {
			{
				"Stellar Prize Draw",
				{}
			}
		}
	}
	pg.base.island_action[1025] = {
		respond_dir = 0,
		name = "Point",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "Action - Point",
		sigle_action_reply_type = 2,
		resource = "point",
		tech_id = 0,
		id = 1025,
		responder_feedback = "",
		chara_sigle_action_reply = {
			105,
			204
		},
		jump_page = {
			{
				"Season IV - Island Seasonal Shop",
				{}
			}
		}
	}
	pg.base.island_action[1026] = {
		respond_dir = 0,
		name = "Greet",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "Action - Greet",
		sigle_action_reply_type = 2,
		resource = "welcome",
		tech_id = 0,
		id = 1026,
		responder_feedback = "",
		chara_sigle_action_reply = {
			102,
			107
		},
		jump_page = {
			{
				"Season IV - Island Seasonal Shop",
				{}
			}
		}
	}
	pg.base.island_action[1027] = {
		respond_dir = 0,
		name = "Stare",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "Action - Stare",
		sigle_action_reply_type = 2,
		resource = "lookover",
		tech_id = 0,
		id = 1027,
		responder_feedback = "",
		chara_sigle_action_reply = {
			105,
			201
		},
		jump_page = {
			{
				"Season IV - Island Seasonal Shop",
				{}
			}
		}
	}
	pg.base.island_action[1028] = {
		respond_dir = 0,
		name = "Stuffed",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "Action - Stuffed",
		sigle_action_reply_type = 2,
		resource = "slapbelly",
		tech_id = 0,
		id = 1028,
		responder_feedback = "",
		chara_sigle_action_reply = {
			106,
			207
		},
		jump_page = {
			{
				"Season IV - Island Seasonal Shop",
				{}
			}
		}
	}
	pg.base.island_action[1029] = {
		respond_dir = 0,
		name = "Sleepy",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "Action - Sleepy",
		sigle_action_reply_type = 2,
		resource = "doze",
		tech_id = 0,
		id = 1029,
		responder_feedback = "",
		chara_sigle_action_reply = {
			103,
			108
		},
		jump_page = {
			{
				"Stellar Prize Draw",
				{}
			}
		}
	}
	pg.base.island_action[1030] = {
		respond_dir = 0,
		name = "Jump",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "Action - Jump",
		sigle_action_reply_type = 2,
		resource = "jumpinplace",
		tech_id = 0,
		id = 1030,
		responder_feedback = "",
		chara_sigle_action_reply = {
			103,
			104
		},
		jump_page = {
			{
				"Stellar Prize Draw",
				{}
			}
		}
	}
	pg.base.island_action[1031] = {
		respond_dir = 0,
		name = "Kung-fu",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "Interactive Action: Kung-fu",
		sigle_action_reply_type = 2,
		resource = "kungfu",
		tech_id = 0,
		id = 1031,
		responder_feedback = "",
		chara_sigle_action_reply = {
			104,
			106
		},
		jump_page = {
			{
				"Season V - Island Seasonal Shop",
				{}
			}
		}
	}
	pg.base.island_action[1032] = {
		respond_dir = 0,
		name = "Belly Rub",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "Interactive Action: Belly Rub",
		sigle_action_reply_type = 2,
		resource = "rub",
		tech_id = 0,
		id = 1032,
		responder_feedback = "",
		chara_sigle_action_reply = {
			108,
			203
		},
		jump_page = {
			{
				"Season V - Island Seasonal Shop",
				{}
			}
		}
	}
	pg.base.island_action[1033] = {
		respond_dir = 0,
		name = "Dodge",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "Interactive Action: Dodge",
		sigle_action_reply_type = 2,
		resource = "dodge",
		tech_id = 0,
		id = 1033,
		responder_feedback = "",
		chara_sigle_action_reply = {
			202,
			103
		},
		jump_page = {
			{
				"Season V - Island Seasonal Shop",
				{}
			}
		}
	}
	pg.base.island_action[1034] = {
		respond_dir = 0,
		name = "Handstand",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "Interactive Action: Handstand",
		sigle_action_reply_type = 2,
		resource = "handstand",
		tech_id = 0,
		id = 1034,
		responder_feedback = "",
		chara_sigle_action_reply = {
			103,
			107
		},
		jump_page = {
			{
				"Season V - Island Seasonal Shop",
				{}
			}
		}
	}
	pg.base.island_action[1035] = {
		respond_dir = 0,
		name = "Salute",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "Interactive Action: Salute",
		sigle_action_reply_type = 2,
		resource = "salute",
		tech_id = 0,
		id = 1035,
		responder_feedback = "",
		chara_sigle_action_reply = {
			102,
			107
		},
		jump_page = {
			{
				"Stellar Prize Draw",
				{}
			}
		}
	}
	pg.base.island_action[1036] = {
		respond_dir = 0,
		name = "Show Off",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "Interactive Action: Show Off",
		sigle_action_reply_type = 2,
		resource = "show",
		tech_id = 0,
		id = 1036,
		responder_feedback = "",
		chara_sigle_action_reply = {
			103,
			107
		},
		jump_page = {
			{
				"Stellar Prize Draw",
				{}
			}
		}
	}
	pg.base.island_action[2000] = {
		chara_sigle_action_reply = "",
		name = "High Five",
		sigle_action_reply_type = 0,
		type = 2,
		feedback_type = 0,
		desc = "Character action to [High Five], it shows the character's emotion and attitude.",
		respond_dir = 0,
		resource = "givemefive",
		tech_id = 0,
		id = 2000,
		responder_feedback = "givemefive_end",
		respond_point = {
			0.07173,
			0,
			1.28364
		},
		jump_page = {}
	}
	pg.base.island_action[2001] = {
		chara_sigle_action_reply = "",
		name = "Shake Hands",
		sigle_action_reply_type = 0,
		type = 2,
		feedback_type = 0,
		desc = "Character action to [Shake Hands], it shows the character's emotion and attitude.",
		respond_dir = 0,
		resource = "handshake",
		tech_id = 0,
		id = 2001,
		responder_feedback = "handshake_end",
		respond_point = {
			0.03018,
			0,
			1.35235
		},
		jump_page = {
			{
				"Island Seasonal Shop",
				{}
			}
		}
	}
	pg.base.island_action[2002] = {
		chara_sigle_action_reply = "",
		name = "Hug",
		sigle_action_reply_type = 0,
		type = 2,
		feedback_type = 0,
		desc = "Character action to [Hug], it shows the character's emotion and attitude.",
		respond_dir = 0,
		resource = "hug",
		tech_id = 0,
		id = 2002,
		responder_feedback = "hug_end",
		respond_point = {
			0.05431,
			0,
			0.62654
		},
		jump_page = {
			{
				"星彩奖",
				{}
			}
		}
	}
	pg.base.island_action[2003] = {
		chara_sigle_action_reply = "",
		name = "Celebrate",
		sigle_action_reply_type = 0,
		type = 2,
		feedback_type = 0,
		desc = "Action - Celebrate",
		respond_dir = 0,
		resource = "claphands",
		tech_id = 0,
		id = 2003,
		responder_feedback = "claphands_end",
		respond_point = {
			0,
			0,
			1.5276
		},
		jump_page = {
			{
				"Stellar Prize Draw",
				{}
			}
		}
	}
	pg.base.island_action[2004] = {
		chara_sigle_action_reply = "",
		name = "Hand Heart",
		sigle_action_reply_type = 0,
		type = 2,
		feedback_type = 0,
		desc = "Action - Hand Heart",
		respond_dir = 0,
		resource = "handheart",
		tech_id = 0,
		id = 2004,
		responder_feedback = "handheart_end",
		respond_point = {
			0,
			0,
			1.35224
		},
		jump_page = {
			{
				"Stellar Prize Draw",
				{}
			}
		}
	}
	pg.base.island_action[2005] = {
		chara_sigle_action_reply = "",
		name = "Take a Bow",
		sigle_action_reply_type = 0,
		type = 2,
		feedback_type = 0,
		desc = "Action - Take a Bow",
		respond_dir = 0,
		resource = "curtaincall",
		tech_id = 0,
		id = 2005,
		responder_feedback = "curtaincall_end_sp",
		respond_point = {
			0,
			0,
			2
		},
		jump_page = {
			{
				"Stellar Prize Draw",
				{}
			}
		}
	}
	pg.base.island_action[2006] = {
		chara_sigle_action_reply = "",
		name = "Group Dance",
		sigle_action_reply_type = 0,
		type = 2,
		feedback_type = 0,
		desc = "Action - Group Dance",
		respond_dir = 0,
		resource = "mutidance",
		tech_id = 0,
		id = 2006,
		responder_feedback = "mutidance_end",
		respond_point = {
			0,
			0,
			1.41529
		},
		jump_page = {
			{
				"Stellar Prize Draw",
				{}
			}
		}
	}
	pg.base.island_action[2007] = {
		chara_sigle_action_reply = "",
		name = "Mighty Morphin'",
		sigle_action_reply_type = 0,
		type = 2,
		feedback_type = 0,
		desc = "Interactive Action: Mighty Morphin'",
		respond_dir = 1,
		resource = "combine",
		tech_id = 0,
		id = 2007,
		responder_feedback = "combine_end_sp",
		respond_point = {
			-2.181,
			0,
			0
		},
		jump_page = {
			{
				"Stellar Prize Draw",
				{}
			}
		}
	}
end)()
