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
		name = "あいさつ",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "キャラクターアクションあいさつ。自分の感情をアピールしましょう！",
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
		name = "別れ",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "キャラクターアクション別れ。自分の感情をアピールしましょう！",
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
		name = "頷く",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "キャラクターアクション頷く。自分の感情をアピールしましょう！",
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
		name = "頭を振る",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "キャラクターアクション頭を振る。自分の感情をアピールしましょう！",
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
		name = "拍手",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "キャラクターアクション拍手。自分の感情をアピールしましょう！",
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
		name = "太陽ポーズ",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "キャラクターアクション太陽ポーズ。自分の感情をアピールしましょう！",
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
				"星彩賞",
				{}
			}
		}
	}
	pg.base.island_action[1006] = {
		respond_dir = 0,
		name = "両手を腰に",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "キャラクターアクション両手を腰に。自分の感情をアピールしましょう！",
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
		name = "お辞儀",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "キャラクターアクションお辞儀。自分の感情をアピールしましょう！",
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
				"図鑑",
				{}
			}
		}
	}
	pg.base.island_action[1008] = {
		respond_dir = 0,
		name = "元気ジャンプ",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "キャラクターアクション元気ジャンプ。自分の感情をアピールしましょう！",
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
				"シーズンⅠ-ショップ",
				{}
			}
		}
	}
	pg.base.island_action[1009] = {
		respond_dir = 0,
		name = "地団駄踏む",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "キャラクターアクション地団駄踏む。自分の感情をアピールしましょう！",
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
		name = "筋肉自慢",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "キャラクターアクション筋肉自慢。自分の感情をアピールしましょう！",
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
				"シーズンⅠ-ショップ",
				{}
			}
		}
	}
	pg.base.island_action[1012] = {
		respond_dir = 0,
		name = "踊る",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "キャラクターアクション踊る。自分の感情をアピールしましょう！",
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
				"星彩賞",
				{}
			}
		}
	}
	pg.base.island_action[1013] = {
		respond_dir = 0,
		name = "ヒーロー登場",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "キャラクターアクションヒーロー登場。自分の感情をアピールしましょう！",
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
				"シーズンⅠ-ショップ",
				{}
			}
		}
	}
	pg.base.island_action[1014] = {
		respond_dir = 0,
		name = "伸び",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "インタラクトアクション「伸び」",
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
				"シーズンⅡ-開発ショップ",
				{}
			}
		}
	}
	pg.base.island_action[1015] = {
		respond_dir = 0,
		name = "怯える",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "インタラクトアクション「怯える」",
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
				"シーズンⅡ-開発ショップ",
				{}
			}
		}
	}
	pg.base.island_action[1016] = {
		respond_dir = 0,
		name = "抱拳",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "インタラクトアクション「抱拳」",
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
				"シーズンⅡ-開発ショップ",
				{}
			}
		}
	}
	pg.base.island_action[1017] = {
		respond_dir = 0,
		name = "ドヤる",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "インタラクトアクション「ドヤる」",
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
				"シーズンⅡ-開発ショップ",
				{}
			}
		}
	}
	pg.base.island_action[1018] = {
		respond_dir = 0,
		name = "坐禅",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "インタラクトアクション「坐禅」",
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
				"星彩賞",
				{}
			}
		}
	}
	pg.base.island_action[1019] = {
		respond_dir = 0,
		name = "断る",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "インタラクション「断る」",
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
				"シーズンⅢ-開発ショップ",
				{}
			}
		}
	}
	pg.base.island_action[1020] = {
		respond_dir = 0,
		name = "あくび",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "インタラクション「あくび」",
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
				"シーズンⅢ-開発ショップ",
				{}
			}
		}
	}
	pg.base.island_action[1021] = {
		respond_dir = 0,
		name = "汗を拭く",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "インタラクション「汗を拭く」",
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
				"シーズンⅢ-開発ショップ",
				{}
			}
		}
	}
	pg.base.island_action[1022] = {
		respond_dir = 0,
		name = "頭をかく",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "インタラクション「頭をかく」",
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
				"シーズンⅢ-開発ショップ",
				{}
			}
		}
	}
	pg.base.island_action[1023] = {
		respond_dir = 0,
		name = "シュート",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "インタラクション「シュート」",
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
				"星彩賞",
				{}
			}
		}
	}
	pg.base.island_action[1024] = {
		respond_dir = 0,
		name = "投げキス",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "インタラクション「投げキス」",
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
				"星彩賞",
				{}
			}
		}
	}
	pg.base.island_action[1025] = {
		respond_dir = 0,
		name = "ビシッ",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "インタラクション「ビシッ」",
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
				"シーズンIV-開発ショップ",
				{}
			}
		}
	}
	pg.base.island_action[1026] = {
		respond_dir = 0,
		name = "歓迎",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "インタラクション「歓迎」",
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
				"シーズンIV-開発ショップ",
				{}
			}
		}
	}
	pg.base.island_action[1027] = {
		respond_dir = 0,
		name = "見つめる",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "インタラクション「見つめる」",
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
				"シーズンIV-開発ショップ",
				{}
			}
		}
	}
	pg.base.island_action[1028] = {
		respond_dir = 0,
		name = "お腹ぽんぽん",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "インタラクション「お腹ぽんぽん」",
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
				"シーズンIV-開発ショップ",
				{}
			}
		}
	}
	pg.base.island_action[1029] = {
		respond_dir = 0,
		name = "眠そう",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "インタラクション「眠そう」",
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
				"星彩賞",
				{}
			}
		}
	}
	pg.base.island_action[1030] = {
		respond_dir = 0,
		name = "ジャンプ",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "インタラクション「ジャンプ」",
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
				"星彩賞",
				{}
			}
		}
	}
	pg.base.island_action[1031] = {
		respond_dir = 0,
		name = "稽古",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "インタラクトアクション「稽古」",
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
				"シーズンV-開発ショップ",
				{}
			}
		}
	}
	pg.base.island_action[1032] = {
		respond_dir = 0,
		name = "お腹さすさす",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "インタラクトアクション「お腹さすさす」",
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
				"シーズンV-開発ショップ",
				{}
			}
		}
	}
	pg.base.island_action[1033] = {
		respond_dir = 0,
		name = "かわす",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "インタラクトアクション「かわす」",
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
				"シーズンV-開発ショップ",
				{}
			}
		}
	}
	pg.base.island_action[1034] = {
		respond_dir = 0,
		name = "逆立ち",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "インタラクトアクション「逆立ち」",
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
				"シーズンV-開発ショップ",
				{}
			}
		}
	}
	pg.base.island_action[1035] = {
		respond_dir = 0,
		name = "敬礼",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "インタラクトアクション「敬礼」",
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
				"星彩賞",
				{}
			}
		}
	}
	pg.base.island_action[1036] = {
		respond_dir = 0,
		name = "お披露目",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "インタラクトアクション「お披露目」",
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
				"星彩賞",
				{}
			}
		}
	}
	pg.base.island_action[2000] = {
		chara_sigle_action_reply = "",
		name = "ハイタッチ",
		sigle_action_reply_type = 0,
		type = 2,
		feedback_type = 0,
		desc = "キャラクターアクションハイタッチ。自分の感情をアピールしましょう！",
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
		name = "握手",
		sigle_action_reply_type = 0,
		type = 2,
		feedback_type = 0,
		desc = "キャラクターアクション握手。自分の感情をアピールしましょう！",
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
				"シーズンⅠ-ショップ",
				{}
			}
		}
	}
	pg.base.island_action[2002] = {
		chara_sigle_action_reply = "",
		name = "ハグ",
		sigle_action_reply_type = 0,
		type = 2,
		feedback_type = 0,
		desc = "キャラクターアクションハグ。自分の感情をアピールしましょう！",
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
				"星彩賞",
				{}
			}
		}
	}
	pg.base.island_action[2003] = {
		chara_sigle_action_reply = "",
		name = "祝う",
		sigle_action_reply_type = 0,
		type = 2,
		feedback_type = 0,
		desc = "インタラクトアクション「祝う」",
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
				"星彩賞",
				{}
			}
		}
	}
	pg.base.island_action[2004] = {
		chara_sigle_action_reply = "",
		name = "手ハート",
		sigle_action_reply_type = 0,
		type = 2,
		feedback_type = 0,
		desc = "インタラクトアクション「手ハート」",
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
				"星彩賞",
				{}
			}
		}
	}
	pg.base.island_action[2005] = {
		chara_sigle_action_reply = "",
		name = "カーテンコール",
		sigle_action_reply_type = 0,
		type = 2,
		feedback_type = 0,
		desc = "インタラクション「カーテンコール」",
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
				"星彩賞",
				{}
			}
		}
	}
	pg.base.island_action[2006] = {
		chara_sigle_action_reply = "",
		name = "集団ダンス",
		sigle_action_reply_type = 0,
		type = 2,
		feedback_type = 0,
		desc = "インタラクション「集団ダンス」",
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
				"星彩賞",
				{}
			}
		}
	}
	pg.base.island_action[2007] = {
		chara_sigle_action_reply = "",
		name = "合体変身",
		sigle_action_reply_type = 0,
		type = 2,
		feedback_type = 0,
		desc = "インタラクトアクション「合体変身」",
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
				"星彩賞",
				{}
			}
		}
	}
end)()
