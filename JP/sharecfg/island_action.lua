pg = pg or {}
pg.island_action = {
	[1000] = {
		feedback_type = 1,
		name = "あいさつ",
		respond_point = "",
		type = 1,
		id = 1000,
		responder_feedback = "",
		resource = "hi"
	},
	[1001] = {
		feedback_type = 1,
		name = "別れ",
		respond_point = "",
		type = 1,
		id = 1001,
		responder_feedback = "",
		resource = "bye"
	},
	[1002] = {
		feedback_type = 1,
		name = "頷く",
		respond_point = "",
		type = 1,
		id = 1002,
		responder_feedback = "",
		resource = "nod"
	},
	[1003] = {
		feedback_type = 1,
		name = "頭を振る",
		respond_point = "",
		type = 1,
		id = 1003,
		responder_feedback = "",
		resource = "shakehead"
	},
	[1004] = {
		feedback_type = 1,
		name = "拍手",
		respond_point = "",
		type = 1,
		id = 1004,
		responder_feedback = "",
		resource = "clap"
	},
	[1005] = {
		feedback_type = 1,
		name = "太陽ポーズ",
		respond_point = "",
		type = 1,
		id = 1005,
		responder_feedback = "",
		resource = "handsup"
	},
	[1006] = {
		feedback_type = 1,
		name = "両手を腰に",
		respond_point = "",
		type = 1,
		id = 1006,
		responder_feedback = "",
		resource = "akimbo"
	},
	[1007] = {
		feedback_type = 1,
		name = "お辞儀",
		respond_point = "",
		type = 1,
		id = 1007,
		responder_feedback = "",
		resource = "bow"
	},
	[1008] = {
		feedback_type = 1,
		name = "元気ジャンプ",
		respond_point = "",
		type = 1,
		id = 1008,
		responder_feedback = "",
		resource = "vjump"
	},
	[1009] = {
		feedback_type = 1,
		name = "地団駄踏む",
		respond_point = "",
		type = 1,
		id = 1009,
		responder_feedback = "",
		resource = "stomp"
	},
	[1011] = {
		feedback_type = 1,
		name = "筋肉自慢",
		respond_point = "",
		type = 1,
		id = 1011,
		responder_feedback = "",
		resource = "muscle"
	},
	[1012] = {
		feedback_type = 1,
		name = "踊る",
		respond_point = "",
		type = 1,
		id = 1012,
		responder_feedback = "",
		resource = "dance"
	},
	[2000] = {
		feedback_type = 0,
		name = "ハイタッチ",
		type = 2,
		id = 2000,
		responder_feedback = "givemefive_end",
		resource = "givemefive",
		respond_point = {
			0.07173,
			0,
			1.28364
		}
	},
	[2001] = {
		feedback_type = 0,
		name = "握手",
		type = 2,
		id = 2001,
		responder_feedback = "handshake_end",
		resource = "handshake",
		respond_point = {
			0.03018,
			0,
			1.35235
		}
	},
	[2002] = {
		feedback_type = 0,
		name = "ハグ",
		type = 2,
		id = 2002,
		responder_feedback = "hug_end",
		resource = "hug",
		respond_point = {
			0.05431,
			0,
			0.62654
		}
	},
	get_id_list_by_type = {
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
			1012
		},
		{
			2000,
			2001,
			2002
		}
	},
	all = {
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
		2000,
		2001,
		2002
	}
}
