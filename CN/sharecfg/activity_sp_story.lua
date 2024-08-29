pg = pg or {}
pg.activity_sp_story = {
	{
		story_type = 1,
		pre_event = "",
		name = "EPS-1 演奏者的梦",
		unlock_conditions = "",
		change_prefab = "",
		change_background = "star_level_bg_546",
		story = "HUANMENGJIANZOUQU1",
		change_bgm = "story-richang-light",
		id = 1,
		lock = ""
	},
	{
		story_type = 1,
		name = "EPS-2 联合演习的邀约",
		unlock_conditions = "完成前置剧情后解锁",
		change_bgm = "story-richang-light",
		change_prefab = "",
		change_background = "star_level_bg_546",
		id = 2,
		story = "HUANMENGJIANZOUQU2",
		pre_event = {
			1
		},
		lock = {
			{
				4,
				1
			}
		}
	},
	{
		story_type = 1,
		name = "EPS-3 悠闲午餐会",
		unlock_conditions = "完成前置剧情后解锁",
		change_bgm = "level-french1",
		change_prefab = "",
		change_background = "bg_story_shengmixieer_1",
		id = 3,
		story = "HUANMENGJIANZOUQU3",
		pre_event = {
			2
		},
		lock = {
			{
				4,
				2
			}
		}
	},
	{
		story_type = 2,
		name = "EPS-4 和平间奏曲",
		unlock_conditions = "完成前置剧情后解锁",
		change_bgm = "story-richang-light",
		change_prefab = "",
		change_background = "bg_story_shengmixieer_1",
		id = 4,
		story = "1826001",
		pre_event = {
			3
		},
		lock = {
			{
				4,
				3
			}
		}
	},
	{
		story_type = 1,
		name = "EPS-5 与“宰相”的密谈",
		unlock_conditions = "完成前置剧情后解锁",
		change_bgm = "story-richang-sooth",
		change_prefab = "",
		change_background = "bg_story_shengmixieer_2",
		id = 5,
		story = "HUANMENGJIANZOUQU5",
		pre_event = {
			4
		},
		lock = {
			{
				4,
				4
			}
		}
	},
	{
		story_type = 1,
		name = "EPS-6 宴会与之后的夜",
		unlock_conditions = "完成前置剧情后解锁",
		change_bgm = "story-richang-sooth",
		change_prefab = "",
		change_background = "bg_story_shengmixieer_2",
		id = 6,
		story = "HUANMENGJIANZOUQU6",
		pre_event = {
			5
		},
		lock = {
			{
				4,
				5
			}
		}
	},
	{
		story_type = 1,
		name = "EPS-7 圣堂的秘密",
		unlock_conditions = "完成前置剧情后解锁",
		change_bgm = "theme-vichy-church",
		change_prefab = "",
		change_background = "bg_story_shengmixieer_2",
		id = 7,
		story = "HUANMENGJIANZOUQU7",
		pre_event = {
			6
		},
		lock = {
			{
				4,
				6
			}
		}
	},
	{
		story_type = 1,
		name = "EPS-8 「她」存在的梦",
		unlock_conditions = "完成前置剧情后解锁",
		change_bgm = "story-richang-light",
		change_prefab = "",
		change_background = "bg_story_shengmixieer_1",
		id = 8,
		story = "HUANMENGJIANZOUQU8",
		pre_event = {
			7
		},
		lock = {
			{
				4,
				7
			}
		}
	},
	{
		story_type = 1,
		name = "EPS-9 美好的一日",
		unlock_conditions = "完成前置剧情后解锁",
		change_bgm = "story-richang-light",
		change_prefab = "",
		change_background = "bg_story_shengmixieer_1",
		id = 9,
		story = "HUANMENGJIANZOUQU9",
		pre_event = {
			8
		},
		lock = {
			{
				4,
				8
			}
		}
	},
	{
		story_type = 1,
		name = "EPS-10 亦是美好一日？",
		unlock_conditions = "完成前置剧情后解锁",
		change_bgm = "story-richang-light",
		change_prefab = "",
		change_background = "bg_story_shengmixieer_1",
		id = 10,
		story = "HUANMENGJIANZOUQU10",
		pre_event = {
			9
		},
		lock = {
			{
				4,
				9
			}
		}
	},
	{
		story_type = 1,
		pre_event = "",
		name = "EPS-1 御狐移驾",
		unlock_conditions = "",
		change_prefab = "",
		change_background = "star_level_bg_531",
		story = "MAIZANGYUBIANZHIHUA1",
		change_bgm = "map-longgong",
		id = 11,
		lock = ""
	},
	{
		story_type = 1,
		name = "EPS-2 暗访八云山",
		unlock_conditions = "完成EPS-1",
		change_bgm = "story-richang-light",
		change_prefab = "",
		change_background = "star_level_bg_532",
		id = 12,
		story = "MAIZANGYUBIANZHIHUA2",
		pre_event = {
			11
		},
		lock = {
			{
				4,
				11
			}
		}
	},
	{
		story_type = 1,
		name = "EPS-3 重樱大结界",
		unlock_conditions = "完成EPS-2",
		change_bgm = "story-4",
		change_prefab = "",
		change_background = "bg_story_tiancheng6",
		id = 13,
		story = "MAIZANGYUBIANZHIHUA3",
		pre_event = {
			12
		},
		lock = {
			{
				4,
				12
			}
		}
	},
	{
		story_type = 1,
		name = "EPS-4 紧随噩梦而来之事",
		unlock_conditions = "完成EPS-3",
		change_bgm = "musashi-2",
		change_prefab = "",
		change_background = "star_level_bg_508",
		id = 14,
		story = "MAIZANGYUBIANZHIHUA4",
		pre_event = {
			13
		},
		lock = {
			{
				4,
				13
			}
		}
	},
	{
		story_type = 1,
		name = "EPS-5 第七十签",
		unlock_conditions = "完成EPS-4",
		change_bgm = "nagato-boss",
		change_prefab = "",
		change_background = "star_level_bg_504",
		id = 15,
		story = "MAIZANGYUBIANZHIHUA5",
		pre_event = {
			14
		},
		lock = {
			{
				4,
				14
			}
		}
	},
	{
		story_type = 1,
		name = "EPS-6 扎根于往昔的执念",
		unlock_conditions = "完成EPS-5",
		change_bgm = "musashi-2",
		change_prefab = "",
		change_background = "star_level_bg_510",
		id = 16,
		story = "MAIZANGYUBIANZHIHUA6",
		pre_event = {
			15
		},
		lock = {
			{
				4,
				15
			}
		}
	},
	{
		story_type = 1,
		name = "EPS-7 战前准备",
		unlock_conditions = "完成EPS-6",
		change_bgm = "story-nailuo-theme",
		change_prefab = "",
		change_background = "bg_bianzhihua_1",
		id = 17,
		story = "MAIZANGYUBIANZHIHUA7",
		pre_event = {
			16
		},
		lock = {
			{
				4,
				16
			}
		}
	},
	{
		story_type = 1,
		name = "EPS-8 决战兵器之相",
		unlock_conditions = "完成EPS-7",
		change_bgm = "story-nailuo-theme",
		change_prefab = "",
		change_background = "bg_bianzhihua_1",
		id = 18,
		story = "MAIZANGYUBIANZHIHUA8",
		pre_event = {
			17
		},
		lock = {
			{
				4,
				17
			}
		}
	},
	{
		story_type = 1,
		name = "EPS-9 退守云峦",
		unlock_conditions = "完成EPS-8",
		change_bgm = "story-nailuo-theme",
		change_prefab = "",
		change_background = "bg_bianzhihua_1",
		id = 19,
		story = "MAIZANGYUBIANZHIHUA9",
		pre_event = {
			17
		},
		lock = {
			{
				4,
				18
			}
		}
	},
	{
		story_type = 1,
		name = "EPS-10 雷散",
		unlock_conditions = "完成EPS-9",
		change_bgm = "story-nailuo-theme",
		change_prefab = "",
		change_background = "bg_bianzhihua_1",
		id = 20,
		story = "MAIZANGYUBIANZHIHUA10",
		pre_event = {
			19
		},
		lock = {
			{
				4,
				19
			}
		}
	},
	{
		story_type = 1,
		name = "EPS-11 剑碎",
		unlock_conditions = "完成EPS-10",
		change_bgm = "story-nailuo-theme",
		change_prefab = "",
		change_background = "bg_bianzhihua_1",
		id = 21,
		story = "MAIZANGYUBIANZHIHUA11",
		pre_event = {
			18
		},
		lock = {
			{
				4,
				20
			}
		}
	},
	{
		story_type = 1,
		name = "EPS-12 花落",
		unlock_conditions = "完成EPS-11",
		change_bgm = "story-nailuo-theme",
		change_prefab = "",
		change_background = "bg_bianzhihua_2",
		id = 22,
		story = "MAIZANGYUBIANZHIHUA12",
		pre_event = {
			21,
			20
		},
		lock = {
			{
				4,
				21
			}
		}
	},
	{
		story_type = 1,
		name = "EPS-13 另一个计划",
		unlock_conditions = "完成EPS-12",
		change_bgm = "story-nailuo-theme",
		change_prefab = "Map_1840002",
		change_background = "bg_bianzhihua_2",
		id = 23,
		story = "MAIZANGYUBIANZHIHUA13",
		pre_event = {
			22
		},
		lock = {
			{
				4,
				22
			}
		}
	},
	all = {
		1,
		2,
		3,
		4,
		5,
		6,
		7,
		8,
		9,
		10,
		11,
		12,
		13,
		14,
		15,
		16,
		17,
		18,
		19,
		20,
		21,
		22,
		23
	}
}
