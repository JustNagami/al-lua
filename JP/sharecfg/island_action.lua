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
	2000,
	2001,
	2002,
	2003,
	2004,
	2005,
	2006
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
		1030
	},
	{
		2000,
		2001,
		2002,
		2003,
		2004,
		2005,
		2006
	}
}
pg.base = pg.base or {}
pg.base.island_action = {}

;(function()
	pg.base.island_action[1000] = {
		sigle_action_reply_type = 2,
		name = "あいさつ",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "キャラクターアクションあいさつ。自分の感情をアピールしましょう！",
		tech_id = 0,
		resource = "hi",
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
		sigle_action_reply_type = 2,
		name = "別れ",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "キャラクターアクション別れ。自分の感情をアピールしましょう！",
		tech_id = 0,
		resource = "bye",
		id = 1001,
		responder_feedback = "",
		chara_sigle_action_reply = {
			101
		},
		jump_page = {}
	}
	pg.base.island_action[1002] = {
		sigle_action_reply_type = 2,
		name = "頷く",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "キャラクターアクション頷く。自分の感情をアピールしましょう！",
		tech_id = 0,
		resource = "nod",
		id = 1002,
		responder_feedback = "",
		chara_sigle_action_reply = {
			103,
			105
		},
		jump_page = {}
	}
	pg.base.island_action[1003] = {
		sigle_action_reply_type = 2,
		name = "頭を振る",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "キャラクターアクション頭を振る。自分の感情をアピールしましょう！",
		tech_id = 0,
		resource = "shakehead",
		id = 1003,
		responder_feedback = "",
		chara_sigle_action_reply = {
			202,
			207
		},
		jump_page = {}
	}
	pg.base.island_action[1004] = {
		sigle_action_reply_type = 2,
		name = "拍手",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "キャラクターアクション拍手。自分の感情をアピールしましょう！",
		tech_id = 0,
		resource = "clap",
		id = 1004,
		responder_feedback = "",
		chara_sigle_action_reply = {
			103,
			105
		},
		jump_page = {}
	}
	pg.base.island_action[1005] = {
		sigle_action_reply_type = 2,
		name = "太陽ポーズ",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "キャラクターアクション太陽ポーズ。自分の感情をアピールしましょう！",
		tech_id = 0,
		resource = "handsup",
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
		sigle_action_reply_type = 2,
		name = "両手を腰に",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "キャラクターアクション両手を腰に。自分の感情をアピールしましょう！",
		tech_id = 0,
		resource = "akimbo",
		id = 1006,
		responder_feedback = "",
		chara_sigle_action_reply = {
			106
		},
		jump_page = {}
	}
	pg.base.island_action[1007] = {
		sigle_action_reply_type = 2,
		name = "お辞儀",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "キャラクターアクションお辞儀。自分の感情をアピールしましょう！",
		tech_id = 0,
		resource = "bow",
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
		sigle_action_reply_type = 2,
		name = "元気ジャンプ",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "キャラクターアクション元気ジャンプ。自分の感情をアピールしましょう！",
		tech_id = 0,
		resource = "vjump",
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
		sigle_action_reply_type = 2,
		name = "地団駄踏む",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "キャラクターアクション地団駄踏む。自分の感情をアピールしましょう！",
		tech_id = 0,
		resource = "stomp",
		id = 1009,
		responder_feedback = "",
		chara_sigle_action_reply = {
			201,
			207
		},
		jump_page = {}
	}
	pg.base.island_action[1011] = {
		sigle_action_reply_type = 2,
		name = "筋肉自慢",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "キャラクターアクション筋肉自慢。自分の感情をアピールしましょう！",
		tech_id = 0,
		resource = "muscle",
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
		sigle_action_reply_type = 2,
		name = "踊る",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "キャラクターアクション踊る。自分の感情をアピールしましょう！",
		tech_id = 0,
		resource = "dance",
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
		sigle_action_reply_type = 2,
		name = "ヒーロー登場",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "キャラクターアクションヒーロー登場。自分の感情をアピールしましょう！",
		tech_id = 0,
		resource = "herocoming",
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
		sigle_action_reply_type = 2,
		name = "伸び",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "インタラクトアクション「伸び」",
		tech_id = 0,
		resource = "stretch",
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
		sigle_action_reply_type = 2,
		name = "怯える",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "インタラクトアクション「怯える」",
		tech_id = 0,
		resource = "fearshake",
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
		sigle_action_reply_type = 2,
		name = "抱拳",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "インタラクトアクション「抱拳」",
		tech_id = 0,
		resource = "holdfist",
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
		sigle_action_reply_type = 2,
		name = "ドヤる",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "インタラクトアクション「ドヤる」",
		tech_id = 0,
		resource = "vouch",
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
		sigle_action_reply_type = 2,
		name = "坐禅",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "インタラクトアクション「坐禅」",
		tech_id = 0,
		resource = "float",
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
		sigle_action_reply_type = 2,
		name = "断る",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "インタラクション「断る」",
		tech_id = 0,
		resource = "refuse",
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
		sigle_action_reply_type = 2,
		name = "あくび",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "インタラクション「あくび」",
		tech_id = 0,
		resource = "yawn",
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
		sigle_action_reply_type = 2,
		name = "汗を拭く",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "インタラクション「汗を拭く」",
		tech_id = 0,
		resource = "wipingsweat",
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
		sigle_action_reply_type = 2,
		name = "頭をかく",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "インタラクション「頭をかく」",
		tech_id = 0,
		resource = "scratchinghead",
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
		sigle_action_reply_type = 2,
		name = "シュート",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "インタラクション「シュート」",
		tech_id = 0,
		resource = "shootingbasketball",
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
		sigle_action_reply_type = 2,
		name = "投げキス",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "インタラクション「投げキス」",
		tech_id = 0,
		resource = "blowkisses",
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
		sigle_action_reply_type = 2,
		name = "ビシッ",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "インタラクション「ビシッ」",
		tech_id = 0,
		resource = "point",
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
		sigle_action_reply_type = 2,
		name = "歓迎",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "インタラクション「歓迎」",
		tech_id = 0,
		resource = "welcome",
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
		sigle_action_reply_type = 2,
		name = "見つめる",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "インタラクション「見つめる」",
		tech_id = 0,
		resource = "lookover",
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
		sigle_action_reply_type = 2,
		name = "お腹ぽんぽん",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "インタラクション「お腹ぽんぽん」",
		tech_id = 0,
		resource = "slapbelly",
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
		sigle_action_reply_type = 2,
		name = "眠そう",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "インタラクション「眠そう」",
		tech_id = 0,
		resource = "doze",
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
		sigle_action_reply_type = 2,
		name = "ジャンプ",
		respond_point = "",
		type = 1,
		feedback_type = 1,
		desc = "インタラクション「ジャンプ」",
		tech_id = 0,
		resource = "jumpinplace",
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
	pg.base.island_action[2000] = {
		chara_sigle_action_reply = "",
		name = "ハイタッチ",
		sigle_action_reply_type = 0,
		type = 2,
		feedback_type = 0,
		desc = "キャラクターアクションハイタッチ。自分の感情をアピールしましょう！",
		tech_id = 0,
		resource = "givemefive",
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
		tech_id = 0,
		resource = "handshake",
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
		tech_id = 0,
		resource = "hug",
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
		tech_id = 0,
		resource = "claphands",
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
		tech_id = 0,
		resource = "handheart",
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
		tech_id = 0,
		resource = "curtaincall",
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
		tech_id = 0,
		resource = "mutidance",
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
end)()
