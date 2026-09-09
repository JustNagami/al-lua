pg = pg or {}
pg.pay_data_display = rawget(pg, "pay_data_display") or setmetatable({
	__name = "pay_data_display"
}, confNEO)
pg.pay_data_display.__namecode__ = true
pg.pay_data_display.all = {
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
	23,
	24,
	25,
	26,
	27,
	28,
	29,
	30,
	31,
	32,
	33,
	34,
	35,
	36,
	37,
	38,
	39,
	40,
	41,
	44,
	45,
	46,
	47,
	48,
	49,
	50,
	51,
	52,
	53,
	55,
	56,
	57,
	58,
	59,
	61,
	62,
	63,
	64,
	65,
	66,
	67,
	68,
	69,
	70,
	71,
	72,
	73,
	74,
	75,
	76,
	77,
	78,
	79,
	80,
	81,
	82,
	83,
	84,
	85,
	86,
	87,
	88,
	89,
	90,
	91,
	92,
	93,
	94,
	95,
	96,
	97,
	98,
	99,
	9001,
	9002,
	9003,
	9004,
	9005,
	9006,
	9007,
	9008,
	9009,
	9010,
	9011,
	9012,
	9013,
	9014,
	9015,
	9016,
	9017,
	9018,
	9019,
	9020,
	9021,
	9022,
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
	1010,
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
	1303,
	2001,
	2002,
	2003,
	2004,
	2005,
	2006,
	2007,
	2008,
	2009,
	2010,
	2011,
	2014,
	2015,
	2016,
	2017,
	2018,
	2019,
	2020,
	2021,
	2022,
	2023,
	2024,
	2025,
	2026,
	2027,
	2028,
	2029,
	2030,
	2031,
	2032,
	2033,
	2034,
	2035,
	2036,
	2037,
	2038,
	2039,
	2040,
	2041,
	2042,
	2043,
	2044,
	2045,
	2046,
	2047,
	2048,
	2049,
	2050,
	2051,
	2052,
	2053,
	2054,
	2055,
	2056,
	2057,
	2058,
	2059,
	2063,
	2064,
	2068,
	2069,
	2070,
	2071,
	2074,
	2075,
	2076,
	2078,
	2079,
	2080,
	2081,
	2085,
	2086,
	2087,
	2088,
	2089,
	2090,
	2091,
	2093,
	2094,
	2095,
	5001,
	5002,
	5003,
	5004,
	5005,
	5006,
	5007,
	5011,
	5012,
	5013,
	5014,
	5015,
	5016,
	5017,
	70001
}
pg.pay_data_display.get_id_list_by_extra_service = {
	[0] = {
		3,
		4,
		5,
		6,
		7,
		8
	},
	[2] = {
		1
	},
	[3] = {
		2,
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
		23,
		24,
		25,
		26,
		27,
		28,
		29,
		30,
		31,
		32,
		33,
		34,
		35,
		36,
		37,
		38,
		39,
		40,
		41,
		44,
		45,
		46,
		47,
		48,
		49,
		50,
		51,
		52,
		53,
		55,
		56,
		57,
		58,
		59,
		61,
		62,
		63,
		64,
		65,
		66,
		67,
		68,
		69,
		70,
		71,
		72,
		73,
		74,
		75,
		76,
		77,
		78,
		79,
		80,
		81,
		82,
		83,
		84,
		85,
		86,
		87,
		88,
		89,
		90,
		91,
		92,
		93,
		94,
		95,
		96,
		97,
		98,
		99,
		9001,
		9002,
		9003,
		9004,
		9005,
		9006,
		9007,
		9008,
		9009,
		9010,
		9011,
		9012,
		9013,
		9014,
		9015,
		9016,
		9017,
		9018,
		9019,
		9020,
		9021,
		9022,
		2001,
		2002,
		2003,
		2004,
		2005,
		2006,
		2007,
		2008,
		2009,
		2010,
		2011,
		2014,
		2015,
		2016,
		2017,
		2018,
		2019,
		2020,
		2021,
		2022,
		2023,
		2024,
		2025,
		2026,
		2027,
		2028,
		2029,
		2030,
		2031,
		2032,
		2033,
		2034,
		2035,
		2036,
		2037,
		2038,
		2039,
		2040,
		2041,
		2042,
		2043,
		2044,
		2045,
		2046,
		2047,
		2048,
		2049,
		2050,
		2051,
		2052,
		2053,
		2054,
		2055,
		2056,
		2057,
		2058,
		2059,
		2063,
		2064,
		2068,
		2069,
		2070,
		2071,
		2074,
		2075,
		2076,
		2078,
		2079,
		2080,
		2081,
		2085,
		2086,
		2087,
		2088,
		2089,
		2090,
		2091,
		2093,
		2094,
		2095,
		5001,
		5002,
		5003,
		5004,
		5005,
		5006,
		5007,
		5011,
		5012,
		5013,
		5014,
		5015,
		5016,
		5017
	},
	[4] = {
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
		1010,
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
		1303
	},
	[6] = {
		70001
	}
}
pg.base = pg.base or {}
pg.base.pay_data_display = {}

;(function()
	pg.base.pay_data_display[1] = {
		limit_group = 0,
		name = "貿易許可証（30日間）",
		descrip_extra = "",
		type = 0,
		second_text = "30日間毎日入手",
		id = 1,
		subject = "貿易許可証（30日間）",
		first_text = "すぐに入手",
		package_sort_id = 0,
		tip = "",
		money = 1000,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 500,
		descrip = "ダイヤ$1個+30日間毎日資源が貰える",
		name_display = "貿易許可証（30日間）",
		limit_type = 1,
		time = "always",
		akashi_pick = 0,
		package_tag = "",
		picture = "month",
		type_order = 0,
		skin_inquire_relation = 0,
		extra_service = 2,
		id_str = "com.bilibili.blhx.zuanshi102",
		first_pay_double = 0,
		extra_gem = 10,
		show_group = "",
		limit_arg = 7,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.passport1",
		extra_service_item = {
			{
				1,
				1,
				1000
			},
			{
				1,
				2,
				200
			},
			{
				2,
				20001,
				1
			}
		},
		display = {
			{
				1,
				1,
				1000
			},
			{
				1,
				2,
				200
			},
			{
				2,
				20001,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				1,
				1,
				1000
			},
			{
				1,
				2,
				200
			},
			{
				2,
				20001,
				1
			}
		},
		first_icon = {
			{
				1,
				14,
				500
			}
		}
	}
	pg.base.pay_data_display[2] = {
		limit_group = 0,
		name = "新規着任パック",
		descrip_extra = "",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "新規着任パック",
		package_sort_id = 1,
		tip = "",
		tip_open = 0,
		money = 160,
		cash_show = 0,
		descrip = "ダイヤなどのアイテムを入手可能",
		name_display = "新規着任パック",
		gem = 80,
		limit_arg = 1,
		limit_type = 2,
		package_tag = "新人",
		picture = "boxNewplayer",
		id_str = "com.bilibili.blhx.zuanshi101",
		extra_gem = 0,
		id = 2,
		airijp_id = "com.yostarjp.azurlane.diamond101",
		first_icon = "",
		first_text = "",
		tag = 1,
		akashi_pick = 1,
		time = "always",
		skin_inquire_relation = 0,
		first_pay_double = 0,
		extra_service = 3,
		show_group = "",
		package_tag_open = 1,
		extra_service_item = {
			{
				2,
				15003,
				2
			},
			{
				2,
				20001,
				2
			}
		},
		display = {
			{
				1,
				4,
				80
			},
			{
				2,
				15003,
				2
			},
			{
				2,
				20001,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				15003,
				2
			},
			{
				2,
				20001,
				2
			}
		}
	}
	pg.base.pay_data_display[3] = {
		limit_group = 0,
		name = "ダイヤ一摘み",
		descrip_extra = "",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "ダイヤ一摘み",
		package_sort_id = 0,
		tip = "",
		tip_open = 0,
		money = 160,
		cash_show = 0,
		descrip = "+おまけ$1個",
		name_display = "ダイヤ一摘み",
		gem = 80,
		extra_service_item = "0",
		limit_arg = 10,
		limit_type = 99,
		package_tag = "",
		picture = "1",
		id_str = "com.bilibili.blhx.zuanshi1",
		extra_gem = 0,
		id = 3,
		airijp_id = "com.yostarjp.azurlane.diamond1",
		first_icon = "",
		first_text = "",
		tag = 0,
		akashi_pick = 0,
		time = "always",
		skin_inquire_relation = 0,
		first_pay_double = 1,
		extra_service = 0,
		show_group = "",
		package_tag_open = 0,
		display = {},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[4] = {
		limit_group = 0,
		name = "ダイヤ一握り",
		descrip_extra = "",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "ダイヤ一握り",
		package_sort_id = 0,
		tip = "",
		tip_open = 0,
		money = 650,
		cash_show = 0,
		descrip = "+おまけ$1個",
		name_display = "ダイヤ一握り",
		gem = 325,
		extra_service_item = "0",
		limit_arg = 10,
		limit_type = 99,
		package_tag = "",
		picture = "2",
		id_str = "com.bilibili.blhx.zuanshi2",
		extra_gem = 30,
		id = 4,
		airijp_id = "com.yostarjp.azurlane.diamond2",
		first_icon = "",
		first_text = "",
		tag = 0,
		akashi_pick = 0,
		time = "always",
		skin_inquire_relation = 0,
		first_pay_double = 1,
		extra_service = 0,
		show_group = "",
		package_tag_open = 0,
		display = {},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[5] = {
		limit_group = 0,
		name = "ダイヤ一袋",
		descrip_extra = "",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "ダイヤ一袋",
		package_sort_id = 0,
		tip = "",
		tip_open = 0,
		money = 1200,
		cash_show = 0,
		descrip = "+おまけ$1個",
		name_display = "ダイヤ一袋",
		gem = 600,
		extra_service_item = "0",
		limit_arg = 0,
		limit_type = 0,
		package_tag = "",
		picture = "3",
		id_str = "com.bilibili.blhx.zuanshi3",
		extra_gem = 145,
		id = 5,
		airijp_id = "com.yostarjp.azurlane.diamond3",
		first_icon = "",
		first_text = "",
		tag = 0,
		akashi_pick = 0,
		time = "always",
		skin_inquire_relation = 0,
		first_pay_double = 1,
		extra_service = 0,
		show_group = "",
		package_tag_open = 0,
		display = {},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[6] = {
		limit_group = 0,
		name = "ダイヤ小箱",
		descrip_extra = "",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "ダイヤ小箱",
		package_sort_id = 0,
		tip = "",
		tip_open = 0,
		money = 2400,
		cash_show = 0,
		descrip = "+おまけ$1個",
		name_display = "ダイヤ小箱",
		gem = 1200,
		extra_service_item = "0",
		limit_arg = 0,
		limit_type = 0,
		package_tag = "",
		picture = "4",
		id_str = "com.bilibili.blhx.zuanshi4",
		extra_gem = 350,
		id = 6,
		airijp_id = "com.yostarjp.azurlane.diamond4",
		first_icon = "",
		first_text = "",
		tag = 0,
		akashi_pick = 0,
		time = "always",
		skin_inquire_relation = 0,
		first_pay_double = 1,
		extra_service = 0,
		show_group = "",
		package_tag_open = 0,
		display = {},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[7] = {
		limit_group = 0,
		name = "ダイヤ大箱",
		descrip_extra = "",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "ダイヤ大箱",
		package_sort_id = 0,
		tip = "",
		tip_open = 0,
		money = 4900,
		cash_show = 0,
		descrip = "+おまけ$1個",
		name_display = "ダイヤ大箱",
		gem = 2450,
		extra_service_item = "0",
		limit_arg = 0,
		limit_type = 0,
		package_tag = "",
		picture = "5",
		id_str = "com.bilibili.blhx.zuanshi5",
		extra_gem = 880,
		id = 7,
		airijp_id = "com.yostarjp.azurlane.diamond5",
		first_icon = "",
		first_text = "",
		tag = 0,
		akashi_pick = 0,
		time = "always",
		skin_inquire_relation = 0,
		first_pay_double = 1,
		extra_service = 0,
		show_group = "",
		package_tag_open = 0,
		display = {},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[8] = {
		limit_group = 0,
		name = "ダイヤ一船",
		descrip_extra = "",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "ダイヤ一船",
		package_sort_id = 0,
		tip = "",
		tip_open = 0,
		money = 10000,
		cash_show = 0,
		descrip = "+おまけ$1個",
		name_display = "ダイヤ一船",
		gem = 5000,
		extra_service_item = "0",
		limit_arg = 0,
		limit_type = 0,
		package_tag = "",
		picture = "6",
		id_str = "com.bilibili.blhx.zuanshi6",
		extra_gem = 2500,
		id = 8,
		airijp_id = "com.yostarjp.azurlane.diamond6",
		first_icon = "",
		first_text = "",
		tag = 1,
		akashi_pick = 0,
		time = "always",
		skin_inquire_relation = 0,
		first_pay_double = 1,
		extra_service = 0,
		show_group = "",
		package_tag_open = 0,
		display = {},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[9] = {
		limit_group = 0,
		name = "福袋",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\n※すでに所有している衣装を入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		id = 9,
		subject = "福袋",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 3800,
		tip = "",
		tag = 1,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "アイテム・資源とランダムに正月シリーズの着せ替え衣装を入手可能",
		limit_type = 2,
		name_display = "福袋",
		type_order = 0,
		package_tag = "",
		picture = "fudai",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.zuanshi103",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond103",
		extra_service_item = {
			{
				2,
				69901,
				1
			},
			{
				2,
				30302,
				3
			},
			{
				1,
				14,
				2018
			},
			{
				2,
				20001,
				8
			},
			{
				2,
				15003,
				4
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2017,
					12,
					20
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					1,
					15
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69901,
				1
			},
			{
				2,
				30302,
				3
			},
			{
				1,
				14,
				2018
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40901,
				1
			}
		}
	}
	pg.base.pay_data_display[10] = {
		limit_group = 0,
		name = "新生活キャンペｰン",
		descrip_extra = "アプリストア新生活キャンペーン特典",
		type = 0,
		second_text = "",
		id = 10,
		subject = "新生活キャンペｰン",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1200,
		tip = "",
		tag = 1,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "など6つのアイテム",
		limit_type = 2,
		name_display = "新生活キャンペｰン",
		type_order = 0,
		package_tag = "",
		picture = "box-act",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.zuanshi104",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond104",
		extra_service_item = {
			{
				1,
				14,
				700
			},
			{
				1,
				6,
				100
			},
			{
				1,
				1,
				3000
			},
			{
				2,
				20001,
				6
			},
			{
				2,
				15003,
				3
			},
			{
				1,
				2,
				850
			}
		},
		time = {
			{
				{
					2018,
					3,
					2
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					3,
					9
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				1,
				14,
				700
			},
			{
				1,
				6,
				100
			},
			{
				1,
				1,
				3000
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40901,
				1
			}
		}
	}
	pg.base.pay_data_display[11] = {
		limit_group = 0,
		name = "一周年福袋",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の初回割引販売時の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		id = 11,
		subject = "福袋",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 3800,
		tip = "",
		tag = 1,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "アイテム・資源とランダムにドレスシリーズの着せ替え衣装を入手可能",
		limit_type = 2,
		name_display = "一周年福袋",
		type_order = 0,
		package_tag = "",
		picture = "fudai",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.zuanshi108",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond105",
		extra_service_item = {
			{
				2,
				69902,
				1
			},
			{
				1,
				14,
				2019
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2018,
					9,
					14
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2018,
					10,
					7
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69902,
				1
			},
			{
				1,
				14,
				2019
			},
			{
				2,
				15008,
				50
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40902,
				1
			}
		}
	}
	pg.base.pay_data_display[12] = {
		limit_group = 0,
		name = "福袋2019",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		id = 12,
		subject = "福袋2019",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 3800,
		tip = "",
		tag = 1,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "アイテム・資源とランダムにお正月シリーズの着せ替え衣装を入手可能",
		limit_type = 2,
		name_display = "福袋2019",
		type_order = 0,
		package_tag = "",
		picture = "fudai",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.zuanshi109",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond106",
		extra_service_item = {
			{
				2,
				69903,
				1
			},
			{
				1,
				14,
				2019
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2018,
					12,
					15
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					1,
					16
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69903,
				1
			},
			{
				1,
				14,
				2019
			},
			{
				2,
				15008,
				50
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40903,
				1
			}
		}
	}
	pg.base.pay_data_display[13] = {
		limit_group = 0,
		name = "春節福袋",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		id = 13,
		subject = "福袋",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 3800,
		tip = "",
		tag = 1,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "アイテム・資源とランダムに旧正月2019シリーズの着せ替え衣装を入手可能",
		limit_type = 2,
		name_display = "春節福袋",
		type_order = 0,
		package_tag = "",
		picture = "fudai",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.zuanshi110",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond107",
		extra_service_item = {
			{
				2,
				69904,
				1
			},
			{
				1,
				14,
				2019
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2019,
					1,
					10
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					2,
					13
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69904,
				1
			},
			{
				1,
				14,
				2019
			},
			{
				2,
				15008,
				50
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40904,
				1
			}
		}
	}
	pg.base.pay_data_display[14] = {
		limit_group = 0,
		name = "福袋",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		id = 14,
		subject = "福袋",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 3800,
		tip = "",
		tag = 1,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "アイテム・資源とランダムにドレスシリーズの着せ替え衣装を入手可能",
		limit_type = 2,
		name_display = "福袋",
		type_order = 0,
		package_tag = "",
		picture = "lihe1_l",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.zuanshi111",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond108",
		extra_service_item = {
			{
				2,
				69905,
				1
			},
			{
				1,
				14,
				2019
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2019,
					5,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					6,
					12
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69905,
				1
			},
			{
				1,
				14,
				2019
			},
			{
				2,
				15008,
				50
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40905,
				1
			}
		}
	}
	pg.base.pay_data_display[15] = {
		limit_group = 0,
		name = "二週年福袋",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		id = 15,
		subject = "二週年福袋",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 3800,
		tip = "",
		tag = 1,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "アイテム・資源とランダムにドレスシリーズの着せ替え衣装を入手可能",
		limit_type = 2,
		name_display = "二週年福袋",
		type_order = 0,
		package_tag = "",
		picture = "lihe2_l",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.zuanshi113",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond109",
		extra_service_item = {
			{
				2,
				69907,
				1
			},
			{
				1,
				14,
				2059
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2019,
					8,
					30
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2019,
					10,
					9
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69907,
				1
			},
			{
				1,
				14,
				2059
			},
			{
				2,
				15008,
				50
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40906,
				1
			}
		}
	}
	pg.base.pay_data_display[16] = {
		limit_group = 0,
		name = "新年福袋2020",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		id = 16,
		subject = "新年福袋2020",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "アイテム・資源とランダムにお正月2020シリーズの着せ替え衣装を入手可能",
		limit_type = 2,
		name_display = "新年福袋2020",
		type_order = 0,
		package_tag = "",
		picture = "fudai1",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.zuanshi118",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond110",
		extra_service_item = {
			{
				2,
				69908,
				1
			},
			{
				1,
				14,
				2020
			},
			{
				2,
				42017,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2019,
					12,
					20
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					1,
					8
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69908,
				1
			},
			{
				1,
				14,
				2020
			},
			{
				2,
				42017,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40908,
				1
			}
		}
	}
	pg.base.pay_data_display[17] = {
		limit_group = 0,
		name = "新年福袋復刻(2019)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		id = 17,
		subject = "新年福袋復刻(2019)",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 3800,
		tip = "",
		tag = 1,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "アイテム・資源とランダムにお正月2019シリーズの着せ替え衣装を入手可能",
		limit_type = 2,
		name_display = "新年福袋復刻(2019)",
		type_order = 0,
		package_tag = "",
		picture = "fudai",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.zuanshi119",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond111",
		extra_service_item = {
			{
				2,
				69903,
				1
			},
			{
				1,
				14,
				2019
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2019,
					12,
					20
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					1,
					8
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69903,
				1
			},
			{
				1,
				14,
				2019
			},
			{
				2,
				15008,
				50
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40903,
				1
			}
		}
	}
	pg.base.pay_data_display[18] = {
		limit_group = 0,
		name = "春節福袋2020",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		id = 18,
		subject = "春節福袋2020",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "アイテム・資源とランダムに旧正月2020シリーズの着せ替え衣装を入手可能",
		limit_type = 2,
		name_display = "春節福袋2020",
		type_order = 0,
		package_tag = "",
		picture = "fudai2",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.zuanshi120",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond112",
		extra_service_item = {
			{
				2,
				69909,
				1
			},
			{
				1,
				14,
				2020
			},
			{
				2,
				42017,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2020,
					1,
					15
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					2,
					5
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69909,
				1
			},
			{
				1,
				14,
				2020
			},
			{
				2,
				42017,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40909,
				1
			}
		}
	}
	pg.base.pay_data_display[19] = {
		limit_group = 0,
		name = "春節福袋復刻(2019)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		id = 19,
		subject = "春節福袋復刻(2019)",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 3800,
		tip = "",
		tag = 1,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "アイテム・資源とランダムに旧正月2019シリーズの着せ替え衣装を入手可能",
		limit_type = 2,
		name_display = "春節福袋復刻(2019)",
		type_order = 0,
		package_tag = "",
		picture = "fudai",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.zuanshi121",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond113",
		extra_service_item = {
			{
				2,
				69904,
				1
			},
			{
				1,
				14,
				2019
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2020,
					1,
					15
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					2,
					5
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69904,
				1
			},
			{
				1,
				14,
				2019
			},
			{
				2,
				15008,
				50
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40904,
				1
			}
		}
	}
	pg.base.pay_data_display[20] = {
		limit_group = 0,
		name = "着任応援パック・Ⅰ",
		descrip_extra = "お得パックのアイテムはメールボックスに送られます ",
		type = 0,
		second_text = "+資源",
		id = 20,
		subject = "着任応援パック・Ⅰ",
		first_text = "ダイヤ入手",
		package_sort_id = 1,
		tip = "",
		money = 320,
		tip_open = 0,
		tag = 1,
		cash_show = 0,
		gem = 0,
		descrip = "ダイヤ×180、燃料貯蔵箱(1000)×2などのアイテムを入手可能",
		name_display = "着任応援パック・Ⅰ",
		limit_type = 2,
		time = "always",
		akashi_pick = 1,
		package_tag = "",
		picture = "support1",
		type_order = 0,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.libao101",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.package101",
		extra_service_item = {
			{
				1,
				14,
				180
			},
			{
				2,
				30121,
				2
			},
			{
				4,
				100001,
				1
			},
			{
				2,
				15001,
				30
			},
			{
				2,
				16002,
				4
			},
			{
				2,
				16012,
				4
			},
			{
				2,
				16022,
				4
			},
			{
				2,
				30112,
				30
			}
		},
		display = {
			{
				4,
				100001,
				1
			},
			{
				2,
				30121,
				2
			},
			{
				2,
				15001,
				30
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40012,
				1
			}
		},
		first_icon = {
			{
				1,
				14,
				180
			}
		}
	}
	pg.base.pay_data_display[21] = {
		limit_group = 0,
		name = "着任応援パック・Ⅱ",
		descrip_extra = "お得パックのアイテムはメールボックスに送られます ",
		type = 0,
		second_text = "+資源",
		id = 21,
		subject = "着任応援パック・Ⅱ",
		first_text = "ダイヤ入手",
		package_sort_id = 1,
		tip = "",
		money = 1500,
		tip_open = 0,
		tag = 1,
		cash_show = 0,
		gem = 0,
		descrip = "ダイヤ×780、SSR選択装備箱×2、燃料貯蔵箱(1000)×4などのアイテムを入手可能",
		name_display = "着任応援パック・Ⅱ",
		limit_type = 2,
		time = "always",
		akashi_pick = 1,
		package_tag = "",
		picture = "support2",
		type_order = 0,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.libao102",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.package102",
		extra_service_item = {
			{
				1,
				14,
				780
			},
			{
				2,
				30202,
				2
			},
			{
				2,
				30121,
				4
			},
			{
				4,
				100001,
				1
			},
			{
				2,
				15001,
				50
			},
			{
				2,
				16003,
				3
			},
			{
				2,
				16013,
				3
			},
			{
				2,
				16023,
				3
			},
			{
				2,
				16002,
				3
			},
			{
				2,
				16012,
				3
			},
			{
				2,
				16022,
				3
			},
			{
				2,
				30113,
				30
			},
			{
				2,
				30112,
				50
			}
		},
		display = {
			{
				4,
				100001,
				1
			},
			{
				2,
				30202,
				2
			},
			{
				2,
				30121,
				4
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40013,
				1
			}
		},
		first_icon = {
			{
				1,
				14,
				780
			}
		}
	}
	pg.base.pay_data_display[22] = {
		limit_group = 0,
		name = "着任応援パック・Ⅲ",
		descrip_extra = "お得パックのアイテムはメールボックスに送られます ",
		type = 0,
		second_text = "+資源",
		id = 22,
		subject = "着任応援パック・Ⅲ",
		first_text = "ダイヤ入手",
		package_sort_id = 1,
		tip = "",
		money = 3000,
		tip_open = 0,
		tag = 1,
		cash_show = 0,
		gem = 0,
		descrip = "ダイヤ×1680、SSR選択装備箱×4、燃料貯蔵箱(1000)×8などのアイテムを入手可能",
		name_display = "着任応援パック・Ⅲ",
		limit_type = 2,
		time = "always",
		akashi_pick = 1,
		package_tag = "",
		picture = "support3",
		type_order = 0,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.libao103",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.package103",
		extra_service_item = {
			{
				1,
				14,
				1680
			},
			{
				2,
				30202,
				4
			},
			{
				2,
				30121,
				8
			},
			{
				4,
				100011,
				1
			},
			{
				2,
				59900,
				1000
			},
			{
				2,
				15001,
				80
			},
			{
				2,
				16003,
				5
			},
			{
				2,
				16013,
				5
			},
			{
				2,
				16023,
				5
			},
			{
				2,
				16002,
				5
			},
			{
				2,
				16012,
				5
			},
			{
				2,
				16022,
				5
			},
			{
				2,
				30113,
				100
			},
			{
				2,
				30112,
				100
			}
		},
		display = {
			{
				4,
				100011,
				1
			},
			{
				2,
				30202,
				4
			},
			{
				2,
				30121,
				8
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40014,
				1
			}
		},
		first_icon = {
			{
				1,
				14,
				1680
			}
		}
	}
	pg.base.pay_data_display[23] = {
		limit_group = 0,
		name = "福袋（夏2020）",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\n既に所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		id = 23,
		subject = "福袋（夏2020）",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "アイテム・資源とランダムなドレス（夏2020）シリーズの着せ替え衣装を入手可能",
		limit_type = 2,
		name_display = "福袋（夏2020）",
		type_order = 0,
		package_tag = "",
		picture = "lihe3_l",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.zuanshi122",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond114",
		extra_service_item = {
			{
				2,
				69910,
				1
			},
			{
				1,
				14,
				2020
			},
			{
				2,
				42017,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2020,
					5,
					28
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					6,
					17
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69910,
				1
			},
			{
				1,
				14,
				2020
			},
			{
				2,
				42017,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40910,
				1
			}
		}
	}
	pg.base.pay_data_display[24] = {
		limit_group = 0,
		name = "三周年福袋",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		id = 24,
		subject = "三周年福袋",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "アイテム・資源とランダムなドレスシリーズの着せ替え衣装を入手可能",
		limit_type = 2,
		name_display = "三周年福袋",
		type_order = 0,
		package_tag = "",
		picture = "lihe4_l",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.zuanshi123",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond115",
		extra_service_item = {
			{
				2,
				69911,
				1
			},
			{
				1,
				14,
				2020
			},
			{
				2,
				42026,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2020,
					9,
					24
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2020,
					10,
					11
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69911,
				1
			},
			{
				1,
				14,
				2020
			},
			{
				2,
				42026,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40911,
				1
			}
		}
	}
	pg.base.pay_data_display[25] = {
		limit_group = 0,
		name = "新年福袋2021",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		id = 25,
		subject = "新年福袋2021",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "アイテム・資源とランダムにお正月2021シリーズの着せ替え衣装を入手可能",
		limit_type = 2,
		name_display = "新年福袋2021",
		type_order = 0,
		package_tag = "",
		picture = "fudai3",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.zuanshi124",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond116",
		extra_service_item = {
			{
				2,
				69912,
				1
			},
			{
				1,
				14,
				2021
			},
			{
				2,
				42026,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2020,
					12,
					29
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2021,
					1,
					13
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69912,
				1
			},
			{
				1,
				14,
				2021
			},
			{
				2,
				42026,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40912,
				1
			}
		}
	}
	pg.base.pay_data_display[26] = {
		limit_group = 0,
		name = "新年福袋2020(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		id = 26,
		subject = "新年福袋2020(復刻)",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "アイテム・資源とランダムにお正月2020シリーズの着せ替え衣装を入手可能",
		limit_type = 2,
		name_display = "新年福袋2020(復刻)",
		type_order = 0,
		package_tag = "",
		picture = "fudai1",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.zuanshi125",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond117",
		extra_service_item = {
			{
				2,
				69908,
				1
			},
			{
				1,
				14,
				2020
			},
			{
				2,
				42017,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2020,
					12,
					29
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2021,
					1,
					13
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69908,
				1
			},
			{
				1,
				14,
				2020
			},
			{
				2,
				42017,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40908,
				1
			}
		}
	}
	pg.base.pay_data_display[27] = {
		limit_group = 0,
		name = "春節福袋2021",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		id = 27,
		subject = "春節福袋2021",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "アイテム・資源とランダムに旧正月2021シリーズの着せ替え衣装を入手可能",
		limit_type = 2,
		name_display = "春節福袋2021",
		type_order = 0,
		package_tag = "",
		picture = "fudai4",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.zuanshi126",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond118",
		extra_service_item = {
			{
				2,
				69913,
				1
			},
			{
				1,
				14,
				2021
			},
			{
				2,
				42026,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2021,
					2,
					4
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2021,
					2,
					18
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69913,
				1
			},
			{
				1,
				14,
				2021
			},
			{
				2,
				42026,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40913,
				1
			}
		}
	}
	pg.base.pay_data_display[28] = {
		limit_group = 0,
		name = "春節福袋2020(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		id = 28,
		subject = "春節福袋2020(復刻)",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "アイテム・資源とランダムに旧正月2020シリーズの着せ替え衣装を入手可能",
		limit_type = 2,
		name_display = "春節福袋2020(復刻)",
		type_order = 0,
		package_tag = "",
		picture = "fudai2",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.zuanshi127",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond119",
		extra_service_item = {
			{
				2,
				69909,
				1
			},
			{
				1,
				14,
				2020
			},
			{
				2,
				42017,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2021,
					2,
					4
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2021,
					2,
					18
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69909,
				1
			},
			{
				1,
				14,
				2020
			},
			{
				2,
				42017,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40909,
				1
			}
		}
	}
	pg.base.pay_data_display[29] = {
		limit_group = 0,
		name = "福袋(夏2021)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		id = 29,
		subject = "四周年礼盒",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "アイテム・資源とランダムなドレス（夏2021）シリーズの着せ替え衣装を入手可能",
		limit_type = 2,
		name_display = "福袋(夏2021)",
		type_order = 0,
		package_tag = "",
		picture = "lihe6_l",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.zuanshi128",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond120",
		extra_service_item = {
			{
				2,
				69914,
				1
			},
			{
				1,
				14,
				2021
			},
			{
				2,
				42026,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2021,
					5,
					18
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2021,
					6,
					16
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69914,
				1
			},
			{
				1,
				14,
				2021
			},
			{
				2,
				42026,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40914,
				1
			}
		}
	}
	pg.base.pay_data_display[30] = {
		limit_group = 0,
		name = "福袋(夏2020) (復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		id = 30,
		subject = "三周年礼盒复刻",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "アイテム・資源とランダムなドレス（夏2020）シリーズの着せ替え衣装を入手可能",
		limit_type = 2,
		name_display = "福袋(夏2020) (復刻)",
		type_order = 0,
		package_tag = "",
		picture = "lihe3_l",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.zuanshi129",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond121",
		extra_service_item = {
			{
				2,
				69910,
				1
			},
			{
				1,
				14,
				2020
			},
			{
				2,
				42017,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2021,
					5,
					18
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2021,
					6,
					16
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69910,
				1
			},
			{
				1,
				14,
				2020
			},
			{
				2,
				42017,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40910,
				1
			}
		}
	}
	pg.base.pay_data_display[31] = {
		limit_group = 0,
		name = "着任応援パック・Ⅳ",
		descrip_extra = "※購入されたパックはメールに送られます。ご注意ください",
		type = 1,
		second_text = "+資源",
		id = 31,
		subject = "着任応援パック・Ⅳ",
		first_text = "ダイヤ入手",
		package_sort_id = 1,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 1,
		cash_show = 0,
		gem = 0,
		descrip = "ダイヤ×1980、兵装開発専用①・選択装備箱×1などのアイテムを入手可能！",
		name_display = "着任応援パック・Ⅳ",
		limit_type = 2,
		time = "always",
		akashi_pick = 1,
		package_tag = "",
		picture = "support4",
		type_order = 0,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.zuanshi130",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond122",
		extra_service_item = {
			{
				1,
				14,
				1980
			},
			{
				2,
				30121,
				10
			},
			{
				2,
				30114,
				35
			},
			{
				2,
				30113,
				100
			},
			{
				2,
				14004,
				25
			},
			{
				2,
				30203,
				1
			},
			{
				2,
				42036,
				5
			},
			{
				2,
				16003,
				10
			},
			{
				2,
				16013,
				5
			},
			{
				2,
				16023,
				5
			},
			{
				2,
				15008,
				500
			},
			{
				4,
				100011,
				1
			}
		},
		display = {
			{
				2,
				14004,
				25
			},
			{
				2,
				30114,
				35
			},
			{
				2,
				30121,
				10
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40015,
				1
			}
		},
		first_icon = {
			{
				1,
				14,
				1980
			}
		}
	}
	pg.base.pay_data_display[32] = {
		limit_group = 0,
		name = "四周年福袋",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		id = 32,
		subject = "四周年福袋",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "アイテム・資源とランダムなドレスシリーズの着せ替え衣装を入手可能",
		limit_type = 2,
		name_display = "四周年福袋",
		type_order = 0,
		package_tag = "",
		picture = "lihe6_l",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.zuanshi131",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond123",
		extra_service_item = {
			{
				2,
				69915,
				1
			},
			{
				1,
				14,
				2021
			},
			{
				2,
				42036,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2021,
					9,
					23
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2021,
					10,
					13
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69915,
				1
			},
			{
				1,
				14,
				2021
			},
			{
				2,
				42036,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40915,
				1
			}
		}
	}
	pg.base.pay_data_display[33] = {
		limit_group = 0,
		name = "三周年福袋 (復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		id = 33,
		subject = "三周年福袋 (復刻)",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "アイテム・資源とランダムなドレスシリーズの着せ替え衣装を入手可能",
		limit_type = 2,
		name_display = "三周年福袋 (復刻)",
		type_order = 0,
		package_tag = "",
		picture = "lihe3_l",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.zuanshi132",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond124",
		extra_service_item = {
			{
				2,
				69911,
				1
			},
			{
				1,
				14,
				2020
			},
			{
				2,
				42026,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2021,
					9,
					23
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2021,
					10,
					13
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69911,
				1
			},
			{
				1,
				14,
				2020
			},
			{
				2,
				42026,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40911,
				1
			}
		}
	}
	pg.base.pay_data_display[34] = {
		limit_group = 0,
		name = "新年福袋2022",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		id = 34,
		subject = "新年福袋2022",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "アイテム・資源とランダムにお正月2022シリーズの着せ替え衣装を入手可能",
		limit_type = 2,
		name_display = "新年福袋2022",
		type_order = 0,
		package_tag = "",
		picture = "fudai6",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.zuanshi133",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond125",
		extra_service_item = {
			{
				2,
				69916,
				1
			},
			{
				1,
				14,
				2022
			},
			{
				2,
				42036,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2021,
					12,
					29
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2022,
					1,
					12
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69916,
				1
			},
			{
				1,
				14,
				2022
			},
			{
				2,
				42036,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40916,
				1
			}
		}
	}
	pg.base.pay_data_display[35] = {
		limit_group = 0,
		name = "新年福袋2021(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		id = 35,
		subject = "新年福袋2021(復刻)",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "アイテム・資源とランダムにお正月2021シリーズの着せ替え衣装を入手可能",
		limit_type = 2,
		name_display = "新年福袋2021(復刻)",
		type_order = 0,
		package_tag = "",
		picture = "fudai3",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.zuanshi134",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond126",
		extra_service_item = {
			{
				2,
				69912,
				1
			},
			{
				1,
				14,
				2021
			},
			{
				2,
				42026,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2021,
					12,
					29
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2022,
					1,
					12
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69912,
				1
			},
			{
				1,
				14,
				2021
			},
			{
				2,
				42026,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40912,
				1
			}
		}
	}
	pg.base.pay_data_display[36] = {
		limit_group = 0,
		name = "春節福袋2022",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		id = 36,
		subject = "春節福袋2022",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "アイテム・資源とランダムに旧正月2022シリーズの着せ替え衣装を入手可能",
		limit_type = 2,
		name_display = "春節福袋2022",
		type_order = 0,
		package_tag = "",
		picture = "fudai7",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.zuanshi135",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond127",
		extra_service_item = {
			{
				2,
				69917,
				1
			},
			{
				1,
				14,
				2022
			},
			{
				2,
				42036,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2022,
					1,
					27
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2022,
					2,
					9
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69917,
				1
			},
			{
				1,
				14,
				2022
			},
			{
				2,
				42036,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40917,
				1
			}
		}
	}
	pg.base.pay_data_display[37] = {
		limit_group = 0,
		name = "春節福袋2021(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		id = 37,
		subject = "春節福袋2021(復刻)",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "アイテム・資源とランダムに旧正月2021シリーズの着せ替え衣装を入手可能",
		limit_type = 2,
		name_display = "春節福袋2021(復刻)",
		type_order = 0,
		package_tag = "",
		picture = "fudai4",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.zuanshi136",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond128",
		extra_service_item = {
			{
				2,
				69913,
				1
			},
			{
				1,
				14,
				2021
			},
			{
				2,
				42026,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2022,
					1,
					27
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2022,
					2,
					9
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69913,
				1
			},
			{
				1,
				14,
				2021
			},
			{
				2,
				42026,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40913,
				1
			}
		}
	}
	pg.base.pay_data_display[38] = {
		limit_group = 0,
		name = "福袋(夏2022)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		id = 38,
		subject = "福袋(夏2022)",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "アイテム・資源とランダムなドレス（夏2022）シリーズの着せ替え衣装を入手可能",
		limit_type = 2,
		name_display = "福袋(夏2022)",
		type_order = 0,
		package_tag = "",
		picture = "lihe7_l",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.zuanshi137",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond129",
		extra_service_item = {
			{
				2,
				69919,
				1
			},
			{
				1,
				14,
				2022
			},
			{
				2,
				42036,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2022,
					6,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2022,
					6,
					15
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69919,
				1
			},
			{
				1,
				14,
				2022
			},
			{
				2,
				42036,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40919,
				1
			}
		}
	}
	pg.base.pay_data_display[39] = {
		limit_group = 0,
		name = "福袋(夏2021) (復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		id = 39,
		subject = "福袋(夏2021) (復刻)",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "アイテム・資源とランダムなドレス（夏2021）シリーズの着せ替え衣装を入手可能",
		limit_type = 2,
		name_display = "福袋(夏2021) (復刻)",
		type_order = 0,
		package_tag = "",
		picture = "lihe5_l",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.zuanshi138",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond130",
		extra_service_item = {
			{
				2,
				69914,
				1
			},
			{
				1,
				14,
				2021
			},
			{
				2,
				42026,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2022,
					6,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2022,
					6,
					15
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69914,
				1
			},
			{
				1,
				14,
				2021
			},
			{
				2,
				42026,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40914,
				1
			}
		}
	}
	pg.base.pay_data_display[40] = {
		limit_group = 0,
		name = "五周年福袋",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		id = 40,
		subject = "五周年福袋",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "アイテム・資源とランダムなドレスシリーズの着せ替え衣装を入手可能",
		limit_type = 2,
		name_display = "五周年福袋",
		type_order = 2,
		package_tag = "",
		picture = "lihe7_l",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.zuanshi139",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond131",
		extra_service_item = {
			{
				2,
				69920,
				1
			},
			{
				1,
				14,
				2022
			},
			{
				2,
				42046,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2022,
					9,
					22
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2022,
					10,
					12
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69920,
				1
			},
			{
				1,
				14,
				2022
			},
			{
				2,
				42046,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40920,
				1
			}
		}
	}
	pg.base.pay_data_display[41] = {
		limit_group = 0,
		name = "四周年福袋 (復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		id = 41,
		subject = "四周年福袋 (復刻)",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "アイテム・資源とランダムなドレスシリーズの着せ替え衣装を入手可能",
		limit_type = 2,
		name_display = "四周年福袋 (復刻)",
		type_order = 2,
		package_tag = "",
		picture = "lihe5_l",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.zuanshi140",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond132",
		extra_service_item = {
			{
				2,
				69915,
				1
			},
			{
				1,
				14,
				2021
			},
			{
				2,
				42036,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2022,
					9,
					22
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2022,
					10,
					12
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69915,
				1
			},
			{
				1,
				14,
				2021
			},
			{
				2,
				42036,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40915,
				1
			}
		}
	}
	pg.base.pay_data_display[44] = {
		limit_group = 0,
		name = "カムバックパック",
		descrip_extra = "購入すると、アイテムはメールボックスに送られます",
		type = 1,
		second_text = "",
		id = 44,
		subject = "カムバックパック",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 2600,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "購入すると材料を大量に入手可能",
		limit_type = 2,
		name_display = "カムバックパック",
		type_order = 2,
		package_tag = "",
		picture = "support6",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.zuanshi141",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond133",
		extra_service_item = {
			{
				2,
				20001,
				40
			},
			{
				2,
				15003,
				20
			},
			{
				1,
				1,
				30000
			},
			{
				2,
				16502,
				200
			},
			{
				2,
				15008,
				1000
			},
			{
				2,
				16004,
				1
			},
			{
				2,
				16014,
				1
			},
			{
				2,
				16024,
				1
			},
			{
				2,
				16003,
				3
			},
			{
				2,
				16013,
				3
			},
			{
				2,
				16023,
				3
			},
			{
				2,
				30114,
				15
			},
			{
				2,
				30113,
				60
			},
			{
				1,
				3,
				20000
			},
			{
				2,
				59900,
				1000
			}
		},
		time = {
			{
				{
					2022,
					11,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2022,
					12,
					8
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				20001,
				40
			},
			{
				2,
				30114,
				15
			},
			{
				2,
				16502,
				200
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40921,
				1
			}
		}
	}
	pg.base.pay_data_display[45] = {
		limit_group = 0,
		name = "冬の水着福袋2023①",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		id = 45,
		subject = "冬の水着福袋2023①",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "アイテム・資源とランダムな冬の水着2023シリーズの着せ替え衣装を入手可能",
		limit_type = 2,
		name_display = "冬の水着福袋2023①",
		type_order = 2,
		package_tag = "",
		picture = "lihe10_l",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.zuanshi142",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond134",
		extra_service_item = {
			{
				2,
				69922,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42046,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2022,
					12,
					22
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2023,
					1,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69922,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42046,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40922,
				1
			}
		}
	}
	pg.base.pay_data_display[46] = {
		limit_group = 0,
		name = "冬の水着福袋2023②",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		id = 46,
		subject = "冬の水着福袋2023②",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "アイテム・資源とランダムな冬の水着2023シリーズの着せ替え衣装を入手可能",
		limit_type = 2,
		name_display = "冬の水着福袋2023②",
		type_order = 2,
		package_tag = "",
		picture = "lihe11_l",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.zuanshi143",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond135",
		extra_service_item = {
			{
				2,
				69923,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42046,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2022,
					12,
					22
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2023,
					1,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69923,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42046,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40923,
				1
			}
		}
	}
	pg.base.pay_data_display[47] = {
		limit_group = 0,
		name = "新年福袋2022(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		id = 47,
		subject = "新年福袋2022",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "アイテム・資源とランダムにお正月2022シリーズの着せ替え衣装を入手可能",
		limit_type = 2,
		name_display = "新年福袋2022(復刻) ",
		type_order = 2,
		package_tag = "",
		picture = "fudai6",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.zuanshi144",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond136",
		extra_service_item = {
			{
				2,
				69916,
				1
			},
			{
				1,
				14,
				2022
			},
			{
				2,
				42036,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2022,
					12,
					22
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2023,
					1,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69916,
				1
			},
			{
				1,
				14,
				2022
			},
			{
				2,
				42036,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40916,
				1
			}
		}
	}
	pg.base.pay_data_display[48] = {
		limit_group = 0,
		name = "春節福袋2023・Ⅰ ",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		id = 48,
		subject = "春節福袋2023・Ⅰ ",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "アイテム・資源とランダムに旧正月2023シリーズの着せ替え衣装を入手可能",
		limit_type = 2,
		name_display = "春節福袋2023・Ⅰ ",
		type_order = 2,
		package_tag = "",
		picture = "fudaiqp1",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.zuanshi145",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond137",
		extra_service_item = {
			{
				2,
				69924,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42046,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2023,
					1,
					18
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2023,
					2,
					1
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69924,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42046,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40924,
				1
			}
		}
	}
	pg.base.pay_data_display[49] = {
		limit_group = 0,
		name = "春節福袋2023・Ⅱ ",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		id = 49,
		subject = "春節福袋2023・Ⅱ ",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "アイテム・資源とランダムに旧正月2023シリーズの着せ替え衣装を入手可能",
		limit_type = 2,
		name_display = "春節福袋2023・Ⅱ ",
		type_order = 2,
		package_tag = "",
		picture = "fudaiqp2",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.zuanshi146",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond138",
		extra_service_item = {
			{
				2,
				69925,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42046,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2023,
					1,
					18
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2023,
					2,
					1
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69925,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42046,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40925,
				1
			}
		}
	}
	pg.base.pay_data_display[50] = {
		limit_group = 0,
		name = "春節福袋2022(復刻) ",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "",
		id = 50,
		subject = "春節福袋2022(復刻) ",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "アイテム・資源とランダムに旧正月2022シリーズの着せ替え衣装を入手可能",
		limit_type = 2,
		name_display = "春節福袋2022(復刻) ",
		type_order = 2,
		package_tag = "",
		picture = "fudai7",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.zuanshi147",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond139",
		extra_service_item = {
			{
				2,
				69917,
				1
			},
			{
				1,
				14,
				2022
			},
			{
				2,
				42036,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2023,
					1,
					18
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2023,
					2,
					1
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				69917,
				1
			},
			{
				1,
				14,
				2022
			},
			{
				2,
				42036,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40917,
				1
			}
		}
	}
	pg.base.pay_data_display[51] = {
		limit_group = 0,
		name = "夏の水着福袋2023",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 51,
		subject = "夏の水着福袋2023",
		first_text = "ランダム着せ替えとダイヤ",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "アイテム・資源とランダムな夏の水着2023シリーズの着せ替え衣装を入手可能",
		name_display = "夏の水着福袋2023",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "lihecn6ss_l",
		extra_service = 3,
		skin_inquire_relation = 69926,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi151",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond140",
		extra_service_item = {
			{
				2,
				69926,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42046,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2023,
					5,
					25
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2023,
					6,
					14
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42046,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40926,
				1
			}
		},
		first_icon = {
			{
				2,
				69926,
				1
			},
			{
				1,
				4,
				2023
			}
		}
	}
	pg.base.pay_data_display[52] = {
		limit_group = 0,
		name = "福袋(夏2023)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 52,
		subject = "福袋(夏2023)",
		first_text = "ランダム着せ替えとダイヤ",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "アイテム・資源とランダムなドレス（夏2023）シリーズの着せ替え衣装を入手可能",
		name_display = "福袋(夏2023)",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "lihecn6lf_l",
		extra_service = 3,
		skin_inquire_relation = 69927,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi152",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond141",
		extra_service_item = {
			{
				2,
				69927,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42046,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2023,
					6,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2023,
					6,
					14
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42046,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40927,
				1
			}
		},
		first_icon = {
			{
				2,
				69927,
				1
			},
			{
				1,
				4,
				2023
			}
		}
	}
	pg.base.pay_data_display[53] = {
		limit_group = 0,
		name = "福袋(夏2022) (復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 53,
		subject = "福袋(夏2022) (復刻)",
		first_text = "ランダム着せ替えとダイヤ",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "アイテム・資源とランダムなドレス（夏2022）シリーズの着せ替え衣装を入手可能",
		name_display = "福袋(夏2022) (復刻)",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "lihe7_l",
		extra_service = 3,
		skin_inquire_relation = 69919,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi153",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond142",
		extra_service_item = {
			{
				2,
				69919,
				1
			},
			{
				1,
				14,
				2022
			},
			{
				2,
				42036,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2023,
					6,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2023,
					6,
					14
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42036,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40919,
				1
			}
		},
		first_icon = {
			{
				2,
				69919,
				1
			},
			{
				1,
				4,
				2022
			}
		}
	}
	pg.base.pay_data_display[55] = {
		limit_group = 0,
		name = "六周年福袋②",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 55,
		subject = "六周年福袋②",
		first_text = "ランダム着せ替えとダイヤ",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "アイテム・資源とランダムな六周年②の着せ替え衣装を入手可能",
		name_display = "六周年福袋②",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "lihejp6lf_l",
		extra_service = 3,
		skin_inquire_relation = 69929,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi155",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond144",
		extra_service_item = {
			{
				2,
				69929,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2023,
					9,
					21
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2023,
					10,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40929,
				1
			}
		},
		first_icon = {
			{
				2,
				69929,
				1
			},
			{
				1,
				4,
				2023
			}
		}
	}
	pg.base.pay_data_display[56] = {
		limit_group = 0,
		name = "五周年福袋(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 56,
		subject = "五周年福袋(復刻)",
		first_text = "ランダム着せ替えとダイヤ",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "アイテム・資源とランダムなドレスシリーズの着せ替え衣装を入手可能",
		name_display = "五周年福袋(復刻)",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "lihe8_l",
		extra_service = 3,
		skin_inquire_relation = 69920,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi156",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond145",
		extra_service_item = {
			{
				2,
				69920,
				1
			},
			{
				1,
				14,
				2022
			},
			{
				2,
				42046,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2023,
					9,
					21
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2023,
					10,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42046,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40920,
				1
			}
		},
		first_icon = {
			{
				2,
				69920,
				1
			},
			{
				1,
				4,
				2022
			}
		}
	}
	pg.base.pay_data_display[57] = {
		limit_group = 0,
		name = "六周年福袋①",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 57,
		subject = "六周年福袋①",
		first_text = "ランダム着せ替えとダイヤ",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "アイテム・資源とランダムな六周年①の着せ替え衣装を入手可能",
		name_display = "六周年福袋①",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "lihejp6ss_l",
		extra_service = 3,
		skin_inquire_relation = 69928,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi157",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond143",
		extra_service_item = {
			{
				2,
				69928,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2023,
					9,
					14
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2023,
					10,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40928,
				1
			}
		},
		first_icon = {
			{
				2,
				69928,
				1
			},
			{
				1,
				4,
				2023
			}
		}
	}
	pg.base.pay_data_display[58] = {
		limit_group = 0,
		name = "選べる迎春福袋①",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\n*選べるアイテムボックスは倉庫で使用でき、指定されたアイテムを入手できます。",
		type = 0,
		second_text = "",
		id = 58,
		subject = "選べる迎春福袋①",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "ダイヤ×1980と、選べるアイテムボックス×1などを入手可能",
		limit_type = 2,
		name_display = "選べる迎春福袋①",
		type_order = 0,
		package_tag = "",
		picture = "pack_198",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.zuanshi158",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond155",
		extra_service_item = {
			{
				2,
				59504,
				1
			},
			{
				1,
				14,
				1980
			},
			{
				2,
				15008,
				1000
			},
			{
				2,
				30114,
				30
			},
			{
				2,
				17003,
				20
			},
			{
				2,
				17013,
				20
			},
			{
				2,
				17023,
				20
			},
			{
				2,
				17033,
				20
			},
			{
				2,
				17043,
				20
			}
		},
		time = {
			{
				{
					2024,
					2,
					29
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					3,
					13
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				59504,
				1
			},
			{
				1,
				14,
				1980
			},
			{
				2,
				15008,
				1000
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40988,
				1
			}
		}
	}
	pg.base.pay_data_display[59] = {
		limit_group = 0,
		name = "選べる迎春福袋②",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\n*選べるアイテムボックス・Ⅱは倉庫にて使用できます。\n*キャンペーン着せ替え交換チケットは期間終了後に交換対象が変更されてしまいますので、ご注意ください。",
		type = 0,
		second_text = "",
		id = 59,
		subject = "選べる迎春福袋②",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 6800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "ダイヤ×3280と、選べるアイテムボックス・Ⅱ×1などを入手可能",
		limit_type = 2,
		name_display = "選べる迎春福袋②",
		type_order = 0,
		package_tag = "",
		picture = "pack_328",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.zuanshi159",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond156",
		extra_service_item = {
			{
				2,
				59505,
				1
			},
			{
				1,
				14,
				3280
			},
			{
				2,
				15012,
				150
			},
			{
				2,
				15008,
				2000
			},
			{
				2,
				16004,
				2
			},
			{
				2,
				16014,
				2
			},
			{
				2,
				16024,
				2
			},
			{
				2,
				16032,
				30
			}
		},
		time = {
			{
				{
					2024,
					2,
					29
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					3,
					13
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				59505,
				1
			},
			{
				1,
				14,
				3280
			},
			{
				2,
				15012,
				150
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40989,
				1
			}
		}
	}
	pg.base.pay_data_display[61] = {
		limit_group = 0,
		name = "新年福袋2024①",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 61,
		subject = "新年福袋2024①",
		first_text = "ランダム着せ替えとダイヤ",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name_display = "新年福袋2024①",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai9",
		extra_service = 3,
		skin_inquire_relation = 86200,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi161",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond147",
		extra_service_item = {
			{
				2,
				86200,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2023,
					12,
					21
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					1,
					3
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81200,
				1
			}
		},
		first_icon = {
			{
				2,
				86200,
				1
			},
			{
				1,
				4,
				2024
			}
		}
	}
	pg.base.pay_data_display[62] = {
		limit_group = 0,
		name = "冬の水着福袋2023①(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 62,
		subject = "冬の水着福袋2023①(復刻)",
		first_text = "ランダム着せ替えとダイヤ",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name_display = "冬の水着福袋2023①(復刻)",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "lihe10_l",
		extra_service = 3,
		skin_inquire_relation = 69922,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi162",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond148",
		extra_service_item = {
			{
				2,
				69922,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42046,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2023,
					12,
					21
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					1,
					3
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42046,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40922,
				1
			}
		},
		first_icon = {
			{
				2,
				69922,
				1
			},
			{
				1,
				4,
				2023
			}
		}
	}
	pg.base.pay_data_display[63] = {
		limit_group = 0,
		name = "新年福袋2024②",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 63,
		subject = "新年福袋2024②",
		first_text = "ランダム着せ替えとダイヤ",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name_display = "新年福袋2024②",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai10",
		extra_service = 3,
		skin_inquire_relation = 86201,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi163",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond149",
		extra_service_item = {
			{
				2,
				86201,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2023,
					12,
					28
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					1,
					11
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81201,
				1
			}
		},
		first_icon = {
			{
				2,
				86201,
				1
			},
			{
				1,
				4,
				2024
			}
		}
	}
	pg.base.pay_data_display[64] = {
		limit_group = 0,
		name = "冬の水着福袋2023②(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 64,
		subject = "冬の水着福袋2023②(復刻)",
		first_text = "ランダム着せ替えとダイヤ",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name_display = "冬の水着福袋2023②(復刻)",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "lihe11_l",
		extra_service = 3,
		skin_inquire_relation = 69923,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi164",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond150",
		extra_service_item = {
			{
				2,
				69923,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42046,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2023,
					12,
					28
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					1,
					11
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42046,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40923,
				1
			}
		},
		first_icon = {
			{
				2,
				69923,
				1
			},
			{
				1,
				4,
				2023
			}
		}
	}
	pg.base.pay_data_display[65] = {
		limit_group = 0,
		name = "春節福袋2024①",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 65,
		subject = "春節福袋2024①",
		first_text = "ランダム着せ替えとダイヤ",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name_display = "春節福袋2024①",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai11",
		extra_service = 3,
		skin_inquire_relation = 86202,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi165",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond151",
		extra_service_item = {
			{
				2,
				86202,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2024,
					1,
					30
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					2,
					21
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81202,
				1
			}
		},
		first_icon = {
			{
				2,
				86202,
				1
			},
			{
				1,
				4,
				2024
			}
		}
	}
	pg.base.pay_data_display[66] = {
		limit_group = 0,
		name = "春節福袋2023①(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 66,
		subject = "春節福袋2023①(復刻)",
		first_text = "ランダム着せ替えとダイヤ",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name_display = "春節福袋2023①(復刻)",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudaiqp1",
		extra_service = 3,
		skin_inquire_relation = 69924,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi166",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond152",
		extra_service_item = {
			{
				2,
				69924,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42046,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2024,
					1,
					30
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					2,
					21
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42046,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40924,
				1
			}
		},
		first_icon = {
			{
				2,
				69924,
				1
			},
			{
				1,
				4,
				2023
			}
		}
	}
	pg.base.pay_data_display[67] = {
		limit_group = 0,
		name = "春節福袋2024②",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 67,
		subject = "春節福袋2024②",
		first_text = "ランダム着せ替えとダイヤ",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name_display = "春節福袋2024②",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai12",
		extra_service = 3,
		skin_inquire_relation = 86203,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi167",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond153",
		extra_service_item = {
			{
				2,
				86203,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2024,
					2,
					6
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					2,
					21
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81203,
				1
			}
		},
		first_icon = {
			{
				2,
				86203,
				1
			},
			{
				1,
				4,
				2024
			}
		}
	}
	pg.base.pay_data_display[68] = {
		limit_group = 0,
		name = "春節福袋2023②(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 68,
		subject = "春節福袋2023②(復刻)",
		first_text = "ランダム着せ替えとダイヤ",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name_display = "春節福袋2023②(復刻)",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudaiqp2",
		extra_service = 3,
		skin_inquire_relation = 69925,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi168",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond154",
		extra_service_item = {
			{
				2,
				69925,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42046,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2024,
					2,
					6
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					2,
					21
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42046,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40925,
				1
			}
		},
		first_icon = {
			{
				2,
				69925,
				1
			},
			{
				1,
				4,
				2023
			}
		}
	}
	pg.base.pay_data_display[69] = {
		limit_group = 0,
		name = "夏の水着福袋2024",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 69,
		subject = "夏の水着福袋2024",
		first_text = "ランダム着せ替えとダイヤ",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name_display = "夏の水着福袋2024",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai13",
		extra_service = 3,
		skin_inquire_relation = 86204,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi169",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond157",
		extra_service_item = {
			{
				2,
				86204,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2024,
					5,
					21
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					6,
					12
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81204,
				1
			}
		},
		first_icon = {
			{
				2,
				86204,
				1
			},
			{
				1,
				14,
				2024
			}
		}
	}
	pg.base.pay_data_display[70] = {
		limit_group = 0,
		name = "夏の水着福袋2023(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 70,
		subject = "夏の水着福袋2023(復刻)",
		first_text = "ランダム着せ替えとダイヤ",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name_display = "夏の水着福袋2023(復刻)",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "lihecn6ss_l",
		extra_service = 3,
		skin_inquire_relation = 69926,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi172",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond158",
		extra_service_item = {
			{
				2,
				69926,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42046,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2024,
					5,
					21
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					6,
					12
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42046,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40926,
				1
			}
		},
		first_icon = {
			{
				2,
				69926,
				1
			},
			{
				1,
				4,
				2023
			}
		}
	}
	pg.base.pay_data_display[71] = {
		limit_group = 0,
		name = "福袋(夏2024)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 71,
		subject = "福袋(夏2024)",
		first_text = "ランダム着せ替えとダイヤ",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name_display = "福袋(夏2024)",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai14",
		extra_service = 3,
		skin_inquire_relation = 86205,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi170",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond159",
		extra_service_item = {
			{
				2,
				86205,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2024,
					5,
					30
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					6,
					12
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81205,
				1
			}
		},
		first_icon = {
			{
				2,
				86205,
				1
			},
			{
				1,
				14,
				2024
			}
		}
	}
	pg.base.pay_data_display[72] = {
		limit_group = 0,
		name = "福袋(夏2023)(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 72,
		subject = "福袋(夏2023)(復刻)",
		first_text = "ランダム着せ替えとダイヤ",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name_display = "福袋(夏2023)(復刻)",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "lihecn6lf_l",
		extra_service = 3,
		skin_inquire_relation = 69927,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi171",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond160",
		extra_service_item = {
			{
				2,
				69927,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42046,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2024,
					5,
					30
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					6,
					12
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42046,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40927,
				1
			}
		},
		first_icon = {
			{
				2,
				69927,
				1
			},
			{
				1,
				4,
				2023
			}
		}
	}
	pg.base.pay_data_display[73] = {
		limit_group = 0,
		name = "七周年福袋①",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 73,
		subject = "七周年福袋① ",
		first_text = "ランダム着せ替えとダイヤ",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name_display = "七周年福袋① ",
		limit_type = 2,
		type_order = 3,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai15",
		extra_service = 3,
		skin_inquire_relation = 86206,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi173",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond161",
		extra_service_item = {
			{
				2,
				86206,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42066,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2024,
					9,
					12
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					10,
					2
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42066,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81206,
				1
			}
		},
		first_icon = {
			{
				2,
				86206,
				1
			},
			{
				1,
				14,
				2024
			}
		}
	}
	pg.base.pay_data_display[74] = {
		limit_group = 0,
		name = "六周年福袋①(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 74,
		subject = "六周年福袋①(復刻)",
		first_text = "ランダム着せ替えとダイヤ",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name_display = "六周年福袋①(復刻)",
		limit_type = 2,
		type_order = 3,
		akashi_pick = 1,
		package_tag = "",
		picture = "lihejp6ss_l",
		extra_service = 3,
		skin_inquire_relation = 69928,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi174",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond162",
		extra_service_item = {
			{
				2,
				69928,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2024,
					9,
					12
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					10,
					2
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40928,
				1
			}
		},
		first_icon = {
			{
				2,
				69928,
				1
			},
			{
				1,
				4,
				2023
			}
		}
	}
	pg.base.pay_data_display[75] = {
		limit_group = 0,
		name = "七周年福袋② ",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 75,
		subject = "七周年福袋② ",
		first_text = "ランダム着せ替えとダイヤ",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name_display = "七周年福袋② ",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai16",
		extra_service = 3,
		skin_inquire_relation = 86207,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi175",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond163",
		extra_service_item = {
			{
				2,
				86207,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42066,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2024,
					9,
					19
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					10,
					2
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42066,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81207,
				1
			}
		},
		first_icon = {
			{
				2,
				86207,
				1
			},
			{
				1,
				14,
				2024
			}
		}
	}
	pg.base.pay_data_display[76] = {
		limit_group = 0,
		name = "六周年福袋②(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 76,
		subject = "六周年福袋②(復刻)",
		first_text = "ランダム着せ替えとダイヤ",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name_display = "六周年福袋②(復刻)",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "lihejp6lf_l",
		extra_service = 3,
		skin_inquire_relation = 69929,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi176",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond164",
		extra_service_item = {
			{
				2,
				69929,
				1
			},
			{
				1,
				14,
				2023
			},
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2024,
					9,
					19
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					10,
					2
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40929,
				1
			}
		},
		first_icon = {
			{
				2,
				69929,
				1
			},
			{
				1,
				4,
				2023
			}
		}
	}
	pg.base.pay_data_display[77] = {
		limit_group = 0,
		name = "選べる迎春パック2025A",
		descrip_extra = "※購入すると、アイテムはメールボックスに送られます ",
		type = 0,
		second_text = "",
		id = 77,
		subject = "選べる迎春パック2025A",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 2280,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "「ダイヤ」×980、「選べる迎春アイテムボックス2025A」×1などのアイテムを入手できます",
		limit_type = 2,
		name_display = "選べる迎春パック2025A",
		type_order = 2,
		package_tag = "",
		picture = "pack_2024_98",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.zuanshi177",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond165",
		extra_service_item = {
			{
				2,
				59555,
				1
			},
			{
				1,
				14,
				980
			},
			{
				2,
				16501,
				100
			},
			{
				2,
				59010,
				1000
			}
		},
		time = {
			{
				{
					2025,
					2,
					27
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					3,
					12
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				59555,
				1
			},
			{
				1,
				14,
				980
			},
			{
				2,
				16501,
				100
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81407,
				1
			}
		}
	}
	pg.base.pay_data_display[78] = {
		limit_group = 0,
		name = "選べる迎春パック2025B",
		descrip_extra = "※購入すると、アイテムはメールボックスに送られます ",
		type = 0,
		second_text = "",
		id = 78,
		subject = "選べる迎春パック2025B",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "「ダイヤ」×1980、「選べる迎春アイテムボックス2025B」×1などのアイテムを入手できます",
		limit_type = 2,
		name_display = "選べる迎春パック2025B",
		type_order = 2,
		package_tag = "",
		picture = "pack_2024_198",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.zuanshi178",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond166",
		extra_service_item = {
			{
				2,
				59556,
				1
			},
			{
				1,
				14,
				1980
			},
			{
				2,
				15008,
				1000
			},
			{
				2,
				30114,
				30
			},
			{
				2,
				59010,
				2000
			}
		},
		time = {
			{
				{
					2025,
					2,
					27
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					3,
					12
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				59556,
				1
			},
			{
				1,
				14,
				1980
			},
			{
				2,
				15008,
				1000
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81408,
				1
			}
		}
	}
	pg.base.pay_data_display[79] = {
		limit_group = 0,
		name = "選べる迎春パック2025C",
		descrip_extra = "※購入すると、アイテムはメールボックスに送られます ",
		type = 0,
		second_text = "",
		id = 79,
		subject = "選べる迎春パック2025C",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 6800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "「ダイヤ」×3280、「選べる迎春アイテムボックス2025C」×1などのアイテムを入手できます",
		limit_type = 2,
		name_display = "選べる迎春パック2025C",
		type_order = 2,
		package_tag = "",
		picture = "pack_2024_328",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.zuanshi179",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond167",
		extra_service_item = {
			{
				2,
				59563,
				1
			},
			{
				1,
				14,
				3280
			},
			{
				2,
				15012,
				150
			},
			{
				2,
				15008,
				2000
			},
			{
				2,
				16004,
				2
			},
			{
				2,
				16014,
				2
			},
			{
				2,
				16024,
				2
			},
			{
				2,
				16032,
				30
			}
		},
		time = {
			{
				{
					2025,
					2,
					27
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					3,
					12
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				59563,
				1
			},
			{
				1,
				14,
				3280
			},
			{
				2,
				15012,
				150
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81421,
				1
			}
		}
	}
	pg.base.pay_data_display[80] = {
		limit_group = 0,
		name = "復刻L2D着せ替え福袋2025B",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 80,
		subject = "復刻L2D着せ替え福袋2025B",
		first_text = "ランダム着せ替えとダイヤ",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name_display = "復刻L2D着せ替え福袋2025B",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai17",
		extra_service = 3,
		skin_inquire_relation = 86411,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi180",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond168",
		extra_service_item = {
			{
				2,
				86411,
				1
			},
			{
				1,
				14,
				2025
			},
			{
				2,
				42066,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				35
			},
			{
				2,
				15003,
				12
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2025,
					2,
					27
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					3,
					12
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				86411,
				1
			},
			{
				1,
				14,
				2025
			},
			{
				2,
				42066,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81419,
				1
			}
		},
		first_icon = {
			{
				2,
				86411,
				1
			},
			{
				1,
				14,
				2024
			}
		}
	}
	pg.base.pay_data_display[81] = {
		limit_group = 0,
		name = "復刻L2D着せ替え福袋2025A",
		descrip_extra = "※福袋はメールボックスに贈られます\n※全部所持している場合自動でダイヤ×1080に変換されます",
		type = 1,
		second_text = "大量な報酬",
		id = 81,
		subject = "復刻L2D着せ替え福袋2025A",
		first_text = "ランダム着せ替え",
		package_sort_id = 0,
		tip = "",
		money = 1200,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "<size=18>下記L2D着せ替え中の未所持着せ替えをランダムで1着（全部所持している場合自動でダイヤに変換されます）とその他アイテムを入手できます</size>",
		name_display = "復刻L2D着せ替え福袋2025A",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai18",
		extra_service = 3,
		skin_inquire_relation = 86412,
		limit_arg = 2,
		id_str = "com.bilibili.blhx.zuanshi181",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond169",
		extra_service_item = {
			{
				2,
				86412,
				1
			},
			{
				1,
				1,
				2000
			},
			{
				1,
				2,
				1000
			},
			{
				2,
				15008,
				20
			}
		},
		time = {
			{
				{
					2025,
					2,
					27
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					3,
					12
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				1,
				1,
				2000
			},
			{
				1,
				2,
				1000
			},
			{
				2,
				15008,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81420,
				1
			}
		},
		first_icon = {
			{
				2,
				86412,
				1
			}
		}
	}
	pg.base.pay_data_display[82] = {
		limit_group = 0,
		name = "新年福袋2025A",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 82,
		subject = "新年福袋2025A",
		first_text = "ランダム着せ替えとダイヤ",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name_display = "新年福袋2025A",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai19",
		extra_service = 3,
		skin_inquire_relation = 86208,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi182",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond170",
		extra_service_item = {
			{
				2,
				86208,
				1
			},
			{
				1,
				14,
				2025
			},
			{
				2,
				42066,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2024,
					12,
					19
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					1,
					1
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42066,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81208,
				1
			}
		},
		first_icon = {
			{
				2,
				86208,
				1
			},
			{
				1,
				14,
				2025
			}
		}
	}
	pg.base.pay_data_display[83] = {
		limit_group = 0,
		name = "新年福袋2024A(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 83,
		subject = "新年福袋2024A(復刻)",
		first_text = "ランダム着せ替えとダイヤ",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name_display = "新年福袋2024A(復刻)",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai9",
		extra_service = 3,
		skin_inquire_relation = 86200,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi183",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond171",
		extra_service_item = {
			{
				2,
				86200,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2024,
					12,
					19
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					1,
					1
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81200,
				1
			}
		},
		first_icon = {
			{
				2,
				86200,
				1
			},
			{
				1,
				4,
				2024
			}
		}
	}
	pg.base.pay_data_display[84] = {
		limit_group = 0,
		name = "新年福袋2025B",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 84,
		subject = "新年福袋2025B",
		first_text = "ランダム着せ替えとダイヤ",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name_display = "新年福袋2025B",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai20",
		extra_service = 3,
		skin_inquire_relation = 86209,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi184",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond172",
		extra_service_item = {
			{
				2,
				86209,
				1
			},
			{
				1,
				14,
				2025
			},
			{
				2,
				42066,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2024,
					12,
					26
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					1,
					8
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42066,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81209,
				1
			}
		},
		first_icon = {
			{
				2,
				86209,
				1
			},
			{
				1,
				14,
				2025
			}
		}
	}
	pg.base.pay_data_display[85] = {
		limit_group = 0,
		name = "新年福袋2024B(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 85,
		subject = "新年福袋2024B(復刻)",
		first_text = "ランダム着せ替えとダイヤ",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name_display = "新年福袋2024B(復刻)",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai10",
		extra_service = 3,
		skin_inquire_relation = 86201,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi185",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond173",
		extra_service_item = {
			{
				2,
				86201,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2024,
					12,
					26
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					1,
					8
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81201,
				1
			}
		},
		first_icon = {
			{
				2,
				86201,
				1
			},
			{
				1,
				4,
				2024
			}
		}
	}
	pg.base.pay_data_display[86] = {
		limit_group = 0,
		name = "春節福袋2025A",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 86,
		subject = "春節福袋2025A",
		first_text = "ランダム着せ替えとダイヤ",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name_display = "春節福袋2025A",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai21",
		extra_service = 3,
		skin_inquire_relation = 86210,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi186",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond174",
		extra_service_item = {
			{
				2,
				86210,
				1
			},
			{
				1,
				14,
				2025
			},
			{
				2,
				42066,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2025,
					1,
					16
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					2,
					5
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42066,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81210,
				1
			}
		},
		first_icon = {
			{
				2,
				86210,
				1
			},
			{
				1,
				14,
				2025
			}
		}
	}
	pg.base.pay_data_display[87] = {
		limit_group = 0,
		name = "春節福袋2025B",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 87,
		subject = "春節福袋2025B",
		first_text = "ランダム着せ替えとダイヤ",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name_display = "春節福袋2025B",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai22",
		extra_service = 3,
		skin_inquire_relation = 86211,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi187",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond175",
		extra_service_item = {
			{
				2,
				86211,
				1
			},
			{
				1,
				14,
				2025
			},
			{
				2,
				42066,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2025,
					1,
					23
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					2,
					5
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42066,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81211,
				1
			}
		},
		first_icon = {
			{
				2,
				86211,
				1
			},
			{
				1,
				14,
				2025
			}
		}
	}
	pg.base.pay_data_display[88] = {
		limit_group = 0,
		name = "春節福袋2024A(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 88,
		subject = "春節福袋2024A(復刻)",
		first_text = "ランダム着せ替えとダイヤ",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name_display = "春節福袋2024A(復刻)",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai11",
		extra_service = 3,
		skin_inquire_relation = 86202,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi188",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond176",
		extra_service_item = {
			{
				2,
				86202,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2025,
					1,
					16
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					2,
					5
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81202,
				1
			}
		},
		first_icon = {
			{
				2,
				86202,
				1
			},
			{
				1,
				4,
				2024
			}
		}
	}
	pg.base.pay_data_display[89] = {
		limit_group = 0,
		name = "春節福袋2024B(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 89,
		subject = "春節福袋2024B(復刻)",
		first_text = "ランダム着せ替えとダイヤ",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name_display = "春節福袋2024B(復刻)",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai12",
		extra_service = 3,
		skin_inquire_relation = 86203,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi189",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond177",
		extra_service_item = {
			{
				2,
				86203,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2025,
					1,
					23
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					2,
					5
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81203,
				1
			}
		},
		first_icon = {
			{
				2,
				86203,
				1
			},
			{
				1,
				4,
				2024
			}
		}
	}
	pg.base.pay_data_display[90] = {
		limit_group = 0,
		name = "着せ替えパック(学園)",
		descrip_extra = "※福袋はメールボックスに送られます\n※全部所持している場合自動でダイヤ×680に変換されます",
		type = 1,
		second_text = "大量な報酬",
		id = 90,
		subject = "着せ替えパック(学園)",
		first_text = "ランダム着せ替え",
		package_sort_id = 0,
		tip = "",
		money = 1000,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "<size=18>下記着せ替え中の未所持着せ替えをランダムで1着（全部所持している場合自動でダイヤに変換されます）とその他アイテムを入手できます</size>",
		name_display = "着せ替えパック(学園)",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai23",
		extra_service = 3,
		skin_inquire_relation = 86212,
		limit_arg = 2,
		id_str = "com.bilibili.blhx.zuanshi190",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond178",
		extra_service_item = {
			{
				2,
				86212,
				1
			},
			{
				1,
				1,
				2000
			},
			{
				1,
				2,
				1000
			},
			{
				2,
				15008,
				20
			}
		},
		time = {
			{
				{
					2025,
					3,
					20
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					4,
					9
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				1,
				1,
				2000
			},
			{
				1,
				2,
				1000
			},
			{
				2,
				15008,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81212,
				1
			}
		},
		first_icon = {
			{
				2,
				86212,
				1
			}
		}
	}
	pg.base.pay_data_display[91] = {
		limit_group = 0,
		name = "夏の水着福袋2025A",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 91,
		subject = "夏の水着福袋2025A",
		first_text = "ランダム着せ替えとダイヤ",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name_display = "夏の水着福袋2025A",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai24",
		extra_service = 3,
		skin_inquire_relation = 86213,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi191",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond179",
		extra_service_item = {
			{
				2,
				86213,
				1
			},
			{
				1,
				14,
				2025
			},
			{
				2,
				42066,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2025,
					5,
					20
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					6,
					11
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42066,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81213,
				1
			}
		},
		first_icon = {
			{
				2,
				86213,
				1
			},
			{
				1,
				14,
				2025
			}
		}
	}
	pg.base.pay_data_display[92] = {
		limit_group = 0,
		name = "夏の水着福袋2024(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 92,
		subject = "夏の水着福袋2024(復刻)",
		first_text = "ランダム着せ替えとダイヤ",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name_display = "夏の水着福袋2024(復刻)",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai13",
		extra_service = 3,
		skin_inquire_relation = 86204,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi192",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond180",
		extra_service_item = {
			{
				2,
				86204,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2025,
					5,
					20
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					6,
					11
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81204,
				1
			}
		},
		first_icon = {
			{
				2,
				86204,
				1
			},
			{
				1,
				14,
				2024
			}
		}
	}
	pg.base.pay_data_display[93] = {
		limit_group = 0,
		name = "夏の水着福袋2025B",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 93,
		subject = "夏の水着福袋2025B",
		first_text = "ランダム着せ替えとダイヤ",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name_display = "夏の水着福袋2025B",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai25",
		extra_service = 3,
		skin_inquire_relation = 86214,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi193",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond181",
		extra_service_item = {
			{
				2,
				86214,
				1
			},
			{
				1,
				14,
				2025
			},
			{
				2,
				42066,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2025,
					5,
					29
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					6,
					11
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42066,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81214,
				1
			}
		},
		first_icon = {
			{
				2,
				86214,
				1
			},
			{
				1,
				14,
				2025
			}
		}
	}
	pg.base.pay_data_display[94] = {
		limit_group = 0,
		name = "福袋(夏2024)(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 94,
		subject = "福袋(夏2024)(復刻)",
		first_text = "ランダム着せ替えとダイヤ",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name_display = "福袋(夏2024)(復刻)",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai14",
		extra_service = 3,
		skin_inquire_relation = 86205,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi194",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond182",
		extra_service_item = {
			{
				2,
				86205,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2025,
					5,
					29
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					6,
					11
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42056,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81205,
				1
			}
		},
		first_icon = {
			{
				2,
				86205,
				1
			},
			{
				1,
				14,
				2024
			}
		}
	}
	pg.base.pay_data_display[95] = {
		limit_group = 0,
		name = "着せ替えパック(バニー)",
		descrip_extra = "※福袋はメールボックスに送られます\n※全部所持している場合自動でダイヤ×680に変換されます",
		type = 1,
		second_text = "大量な報酬",
		id = 95,
		subject = "着せ替えパック(バニー)",
		first_text = "ランダム着せ替え",
		package_sort_id = 0,
		tip = "",
		money = 1000,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "<size=18>下記着せ替え中の未所持着せ替えをランダムで1着（全部所持している場合自動でダイヤに変換されます）とその他アイテムを入手できます</size>",
		name_display = "着せ替えパック(バニー)",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai26",
		extra_service = 3,
		skin_inquire_relation = 86215,
		limit_arg = 2,
		id_str = "com.bilibili.blhx.zuanshi195",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond183",
		extra_service_item = {
			{
				2,
				86215,
				1
			},
			{
				1,
				1,
				2000
			},
			{
				1,
				2,
				1000
			},
			{
				2,
				15008,
				20
			}
		},
		time = {
			{
				{
					2025,
					7,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					8,
					13
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				1,
				1,
				2000
			},
			{
				1,
				2,
				1000
			},
			{
				2,
				15008,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81215,
				1
			}
		},
		first_icon = {
			{
				2,
				86215,
				1
			}
		}
	}
	pg.base.pay_data_display[96] = {
		limit_group = 0,
		name = "八周年福袋A",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 96,
		subject = "八周年福袋A",
		first_text = "ランダム着せ替え",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name_display = "八周年福袋A",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai27",
		extra_service = 3,
		skin_inquire_relation = 86217,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi196",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond184",
		extra_service_item = {
			{
				2,
				86217,
				1
			},
			{
				1,
				14,
				2025
			},
			{
				2,
				42076,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2025,
					9,
					12
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					10,
					2
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42076,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81217,
				1
			}
		},
		first_icon = {
			{
				2,
				86217,
				1
			},
			{
				1,
				14,
				2025
			}
		}
	}
	pg.base.pay_data_display[97] = {
		limit_group = 0,
		name = "七周年福袋A(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 97,
		subject = "七周年福袋A(復刻)",
		first_text = "ランダム着せ替え",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name_display = "七周年福袋A(復刻)",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai15",
		extra_service = 3,
		skin_inquire_relation = 86206,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi197",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond185",
		extra_service_item = {
			{
				2,
				86206,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42066,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2025,
					9,
					12
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					10,
					2
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42066,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81206,
				1
			}
		},
		first_icon = {
			{
				2,
				86206,
				1
			},
			{
				1,
				14,
				2024
			}
		}
	}
	pg.base.pay_data_display[98] = {
		limit_group = 0,
		name = "八周年福袋B",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 98,
		subject = "八周年福袋B",
		first_text = "ランダム着せ替え",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name_display = "八周年福袋B",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai28",
		extra_service = 3,
		skin_inquire_relation = 86218,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi198",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond186",
		extra_service_item = {
			{
				2,
				86218,
				1
			},
			{
				1,
				14,
				2025
			},
			{
				2,
				42076,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2025,
					9,
					19
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					10,
					2
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42076,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81218,
				1
			}
		},
		first_icon = {
			{
				2,
				86218,
				1
			},
			{
				1,
				14,
				2025
			}
		}
	}
	pg.base.pay_data_display[99] = {
		limit_group = 0,
		name = "七周年福袋B(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 99,
		subject = "七周年福袋B(復刻)",
		first_text = "ランダム着せ替え",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name_display = "七周年福袋B(復刻)",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai16",
		extra_service = 3,
		skin_inquire_relation = 86207,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi199",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond187",
		extra_service_item = {
			{
				2,
				86207,
				1
			},
			{
				1,
				14,
				2024
			},
			{
				2,
				42066,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2025,
					9,
					19
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					10,
					2
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42066,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81207,
				1
			}
		},
		first_icon = {
			{
				2,
				86207,
				1
			},
			{
				1,
				14,
				2024
			}
		}
	}
	pg.base.pay_data_display[9001] = {
		limit_group = 0,
		name = "着せ替えパック(スポーツ、レースクイーン)",
		descrip_extra = "※福袋はメールボックスに送られます\n※全部所持している場合自動でダイヤ×680に変換されます",
		type = 1,
		second_text = "大量な報酬",
		id = 9001,
		subject = "着せ替えパック(スポーツ、レースクイーン)",
		first_text = "ランダム着せ替え",
		package_sort_id = 0,
		tip = "",
		money = 1000,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "<size=18>下記着せ替え中の未所持着せ替えをランダムで1着（全部所持している場合自動でダイヤに変換されます）とその他アイテムを入手できます</size>",
		name_display = "着せ替えパック(スポーツ、レースクイーン)",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai29",
		extra_service = 3,
		skin_inquire_relation = 86219,
		limit_arg = 2,
		id_str = "com.bilibili.blhx.zuanshi200",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond188",
		extra_service_item = {
			{
				2,
				86219,
				1
			},
			{
				1,
				1,
				2000
			},
			{
				1,
				2,
				1000
			},
			{
				2,
				15008,
				20
			}
		},
		time = {
			{
				{
					2025,
					9,
					25
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					10,
					22
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				1,
				1,
				2000
			},
			{
				1,
				2,
				1000
			},
			{
				2,
				15008,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81219,
				1
			}
		},
		first_icon = {
			{
				2,
				86219,
				1
			}
		}
	}
	pg.base.pay_data_display[9002] = {
		limit_group = 0,
		name = "選べる迎春パック2026A",
		descrip_extra = "※購入すると、アイテムはメールボックスに送られます ",
		type = 0,
		second_text = "大量な報酬",
		id = 9002,
		subject = "選べる迎春パック2026A",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 2280,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "「ダイヤ」×980、「選べる迎春アイテムボックス2026A」×1などのアイテムを入手できます",
		limit_type = 2,
		name_display = "選べる迎春パック2026A",
		type_order = 3,
		package_tag = "",
		picture = "pack_2024_98",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.zuanshi201",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond197",
		extra_service_item = {
			{
				2,
				81221,
				1
			},
			{
				1,
				14,
				980
			},
			{
				2,
				16501,
				100
			},
			{
				2,
				59010,
				1000
			}
		},
		time = {
			{
				{
					2026,
					2,
					26
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					3,
					11
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				81221,
				1
			},
			{
				1,
				14,
				980
			},
			{
				2,
				16501,
				100
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81225,
				1
			}
		}
	}
	pg.base.pay_data_display[9003] = {
		limit_group = 0,
		name = "選べる迎春パック2026B",
		descrip_extra = "※購入すると、アイテムはメールボックスに送られます ",
		type = 0,
		second_text = "大量な報酬",
		id = 9003,
		subject = "選べる迎春パック2026B",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 3800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "「ダイヤ」×1980、「選べる迎春アイテムボックス2026B」×1などのアイテムを入手できます",
		limit_type = 2,
		name_display = "選べる迎春パック2026B",
		type_order = 3,
		package_tag = "",
		picture = "pack_2024_198",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.zuanshi202",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond198",
		extra_service_item = {
			{
				2,
				81222,
				1
			},
			{
				1,
				14,
				1980
			},
			{
				2,
				15008,
				1000
			},
			{
				2,
				30114,
				30
			},
			{
				2,
				59010,
				2000
			}
		},
		time = {
			{
				{
					2026,
					2,
					26
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					3,
					11
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				81222,
				1
			},
			{
				1,
				14,
				1980
			},
			{
				2,
				15008,
				1000
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81226,
				1
			}
		}
	}
	pg.base.pay_data_display[9004] = {
		limit_group = 0,
		name = "選べる迎春パック2026C",
		descrip_extra = "※購入すると、アイテムはメールボックスに送られます ",
		type = 0,
		second_text = "大量な報酬",
		id = 9004,
		subject = "選べる迎春パック2026C",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 6800,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "「ダイヤ」×3280、「選べる迎春アイテムボックス2026C」×1などのアイテムを入手できます",
		limit_type = 2,
		name_display = "選べる迎春パック2026C",
		type_order = 3,
		package_tag = "",
		picture = "pack_2024_328",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.zuanshi203",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond199",
		extra_service_item = {
			{
				2,
				81223,
				1
			},
			{
				1,
				14,
				3280
			},
			{
				2,
				15012,
				150
			},
			{
				2,
				15008,
				2000
			},
			{
				2,
				16004,
				2
			},
			{
				2,
				16014,
				2
			},
			{
				2,
				16024,
				2
			},
			{
				2,
				16032,
				30
			}
		},
		time = {
			{
				{
					2026,
					2,
					26
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					3,
					11
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				81223,
				1
			},
			{
				1,
				14,
				3280
			},
			{
				2,
				15012,
				150
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81227,
				1
			}
		}
	}
	pg.base.pay_data_display[9005] = {
		limit_group = 0,
		name = "復刻L2D着せ替え福袋2026B",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 9005,
		subject = "復刻L2D着せ替え福袋2026B",
		first_text = "ランダム着せ替え",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "艦船着せ替え1着、「ダイヤ」×2026などのアイテムを入手できます",
		name_display = "復刻L2D着せ替え福袋2026B",
		limit_type = 2,
		type_order = 3,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai99",
		extra_service = 3,
		skin_inquire_relation = 86220,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi204",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond200",
		extra_service_item = {
			{
				2,
				86220,
				1
			},
			{
				1,
				14,
				2026
			},
			{
				2,
				42076,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				35
			},
			{
				2,
				15003,
				12
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2026,
					2,
					26
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					3,
					11
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42076,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				35
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81228,
				1
			}
		},
		first_icon = {
			{
				2,
				86220,
				1
			},
			{
				1,
				14,
				2026
			}
		}
	}
end)()
;(function()
	pg.base.pay_data_display[9006] = {
		limit_group = 0,
		name = "復刻L2D着せ替え福袋2026A",
		descrip_extra = "※福袋はメールボックスに贈られます\n※全部所持している場合自動でダイヤ×1080に変換されます",
		type = 1,
		second_text = "大量な報酬",
		id = 9006,
		subject = "復刻L2D着せ替え福袋2026A",
		first_text = "ランダム着せ替え",
		package_sort_id = 0,
		tip = "",
		money = 1200,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "下記L2D着せ替え中の未所持着せ替えをランダムで1着（全部所持している場合自動でダイヤに変換されます）とその他アイテムを入手できます",
		name_display = "復刻L2D着せ替え福袋2026A",
		limit_type = 2,
		type_order = 3,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai_L2d_new",
		extra_service = 3,
		skin_inquire_relation = 86221,
		limit_arg = 2,
		id_str = "com.bilibili.blhx.zuanshi205",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond201",
		extra_service_item = {
			{
				2,
				86221,
				1
			},
			{
				1,
				1,
				2000
			},
			{
				1,
				2,
				1000
			},
			{
				2,
				15008,
				20
			}
		},
		time = {
			{
				{
					2026,
					2,
					26
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					3,
					11
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				1,
				1,
				2000
			},
			{
				1,
				2,
				1000
			},
			{
				2,
				15008,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81229,
				1
			}
		},
		first_icon = {
			{
				2,
				86221,
				1
			}
		}
	}
	pg.base.pay_data_display[9007] = {
		limit_group = 0,
		name = "新年福袋2026A",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 9007,
		subject = "新年福袋2026A",
		first_text = "ランダム着せ替えとダイヤ",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name_display = "新年福袋2026A",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai30",
		extra_service = 3,
		skin_inquire_relation = 86222,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi206",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond189",
		extra_service_item = {
			{
				2,
				86222,
				1
			},
			{
				1,
				14,
				2026
			},
			{
				2,
				42076,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2025,
					12,
					18
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					1,
					7
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42076,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81230,
				1
			}
		},
		first_icon = {
			{
				2,
				86222,
				1
			},
			{
				1,
				14,
				2026
			}
		}
	}
	pg.base.pay_data_display[9008] = {
		limit_group = 0,
		name = "新年福袋2025A・復刻",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 9008,
		subject = "新年福袋2025A・復刻",
		first_text = "ランダム着せ替えとダイヤ",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name_display = "新年福袋2025A・復刻",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai19",
		extra_service = 3,
		skin_inquire_relation = 86208,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi207",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond190",
		extra_service_item = {
			{
				2,
				86208,
				1
			},
			{
				1,
				14,
				2025
			},
			{
				2,
				42066,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2025,
					12,
					18
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					1,
					7
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42066,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81208,
				1
			}
		},
		first_icon = {
			{
				2,
				86208,
				1
			},
			{
				1,
				14,
				2025
			}
		}
	}
	pg.base.pay_data_display[9009] = {
		limit_group = 0,
		name = "新年福袋2026B",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 9009,
		subject = "新年福袋2026B",
		first_text = "ランダム着せ替えとダイヤ",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name_display = "新年福袋2026B",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai31",
		extra_service = 3,
		skin_inquire_relation = 86223,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi208",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond191",
		extra_service_item = {
			{
				2,
				86223,
				1
			},
			{
				1,
				14,
				2026
			},
			{
				2,
				42076,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2025,
					12,
					25
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					1,
					7
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42076,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81231,
				1
			}
		},
		first_icon = {
			{
				2,
				86223,
				1
			},
			{
				1,
				14,
				2026
			}
		}
	}
	pg.base.pay_data_display[9010] = {
		limit_group = 0,
		name = "新年福袋2025B・復刻",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 9010,
		subject = "新年福袋2025B・復刻",
		first_text = "ランダム着せ替えとダイヤ",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name_display = "新年福袋2025B・復刻",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai20",
		extra_service = 3,
		skin_inquire_relation = 86209,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi209",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond192",
		extra_service_item = {
			{
				2,
				86209,
				1
			},
			{
				1,
				14,
				2025
			},
			{
				2,
				42066,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2025,
					12,
					25
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					1,
					7
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42066,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81209,
				1
			}
		},
		first_icon = {
			{
				2,
				86209,
				1
			},
			{
				1,
				14,
				2025
			}
		}
	}
	pg.base.pay_data_display[9011] = {
		limit_group = 0,
		name = "春節福袋2026A",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 9011,
		subject = "春節福袋2026A",
		first_text = "ランダム着せ替えとダイヤ",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name_display = "春節福袋2026A",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai32",
		extra_service = 3,
		skin_inquire_relation = 86224,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi210",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond193",
		extra_service_item = {
			{
				2,
				86224,
				1
			},
			{
				1,
				14,
				2026
			},
			{
				2,
				42076,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2026,
					2,
					12
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					3,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42076,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81232,
				1
			}
		},
		first_icon = {
			{
				2,
				86224,
				1
			},
			{
				1,
				14,
				2026
			}
		}
	}
	pg.base.pay_data_display[9012] = {
		limit_group = 0,
		name = "春節福袋2025A(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 9012,
		subject = "春節福袋2025A(復刻)",
		first_text = "ランダム着せ替えとダイヤ",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name_display = "春節福袋2025A(復刻)",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai21",
		extra_service = 3,
		skin_inquire_relation = 86210,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi211",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond194",
		extra_service_item = {
			{
				2,
				86210,
				1
			},
			{
				1,
				14,
				2025
			},
			{
				2,
				42066,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2026,
					2,
					12
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					3,
					4
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42066,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81210,
				1
			}
		},
		first_icon = {
			{
				2,
				86210,
				1
			},
			{
				1,
				14,
				2025
			}
		}
	}
	pg.base.pay_data_display[9013] = {
		limit_group = 0,
		name = "春節福袋2026B",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 9013,
		subject = "春節福袋2026B",
		first_text = "ランダム着せ替え",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "艦船着せ替え1着、「ダイヤ」×2026などのアイテムを入手できます",
		name_display = "春節福袋2026B",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai33",
		extra_service = 3,
		skin_inquire_relation = 86225,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi212",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond195",
		extra_service_item = {
			{
				2,
				86225,
				1
			},
			{
				1,
				14,
				2026
			},
			{
				2,
				42076,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2026,
					2,
					26
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					3,
					11
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42076,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81233,
				1
			}
		},
		first_icon = {
			{
				2,
				86225,
				1
			},
			{
				1,
				14,
				2026
			}
		}
	}
	pg.base.pay_data_display[9014] = {
		limit_group = 0,
		name = "春節福袋2025B(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 9014,
		subject = "春節福袋2025B(復刻)",
		first_text = "ランダム着せ替え",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "艦船着せ替え1着、「ダイヤ」×2025などのアイテムを入手できます",
		name_display = "春節福袋2025B(復刻)",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai22",
		extra_service = 3,
		skin_inquire_relation = 86211,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi213",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond196",
		extra_service_item = {
			{
				2,
				86211,
				1
			},
			{
				1,
				14,
				2025
			},
			{
				2,
				42066,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2026,
					2,
					26
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					3,
					11
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42066,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81211,
				1
			}
		},
		first_icon = {
			{
				2,
				86211,
				1
			},
			{
				1,
				14,
				2025
			}
		}
	}
	pg.base.pay_data_display[9015] = {
		limit_group = 0,
		name = "着せ替えパック（ドレス）",
		descrip_extra = "※福袋はメールボックスに送られます\n※全部所持している場合自動でダイヤ×680に変換されます",
		type = 1,
		second_text = "大量な報酬",
		id = 9015,
		subject = "着せ替えパック（ドレス）",
		first_text = "ランダム着せ替え",
		package_sort_id = 0,
		tip = "",
		money = 1000,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "<size=18>下記着せ替え中の未所持着せ替えをランダムで1着（全部所持している場合自動でダイヤに変換されます）とその他アイテムを入手できます</size>",
		name_display = "着せ替えパック（ドレス）",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai34",
		extra_service = 3,
		skin_inquire_relation = 86226,
		limit_arg = 2,
		id_str = "com.bilibili.blhx.zuanshi214",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond202",
		extra_service_item = {
			{
				2,
				86226,
				1
			},
			{
				1,
				1,
				2000
			},
			{
				1,
				2,
				1000
			},
			{
				2,
				15008,
				20
			}
		},
		time = {
			{
				{
					2026,
					3,
					19
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					4,
					8
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				1,
				1,
				2000
			},
			{
				1,
				2,
				1000
			},
			{
				2,
				15008,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81234,
				1
			}
		},
		first_icon = {
			{
				2,
				86226,
				1
			}
		}
	}
	pg.base.pay_data_display[9016] = {
		limit_group = 0,
		name = "夏の水着福袋2026A",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 9016,
		subject = "夏の水着福袋2026A",
		first_text = "ランダム着せ替え",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "ランダムな夏水着2026A・ダイヤ×2026などを入手可能",
		name_display = "夏の水着福袋2026A",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai35",
		extra_service = 3,
		skin_inquire_relation = 86227,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi215",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond203",
		extra_service_item = {
			{
				2,
				86227,
				1
			},
			{
				1,
				14,
				2026
			},
			{
				2,
				42076,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2026,
					5,
					20
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					6,
					11
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42076,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81235,
				1
			}
		},
		first_icon = {
			{
				2,
				86227,
				1
			},
			{
				1,
				14,
				2026
			}
		}
	}
	pg.base.pay_data_display[9017] = {
		limit_group = 0,
		name = "夏の水着福袋2025A(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 9017,
		subject = "夏の水着福袋2025A(復刻)",
		first_text = "ランダム着せ替え",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "ランダムな夏水着2025A・ダイヤ×2025などを入手可能",
		name_display = "夏の水着福袋2025A(復刻)",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai24",
		extra_service = 3,
		skin_inquire_relation = 86213,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi216",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond204",
		extra_service_item = {
			{
				2,
				86213,
				1
			},
			{
				1,
				14,
				2025
			},
			{
				2,
				42066,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2026,
					5,
					20
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					6,
					11
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42066,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81213,
				1
			}
		},
		first_icon = {
			{
				2,
				86213,
				1
			},
			{
				1,
				14,
				2025
			}
		}
	}
	pg.base.pay_data_display[9018] = {
		limit_group = 0,
		name = "夏の水着福袋2026B",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 9018,
		subject = "夏の水着福袋2026B",
		first_text = "ランダム着せ替え",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "ランダムな夏水着2026B・ダイヤ×2026などを入手可能",
		name_display = "夏の水着福袋2026B",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai36",
		extra_service = 3,
		skin_inquire_relation = 86228,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi217",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond205",
		extra_service_item = {
			{
				2,
				86228,
				1
			},
			{
				1,
				14,
				2026
			},
			{
				2,
				42076,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2026,
					5,
					28
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					6,
					11
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42076,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81236,
				1
			}
		},
		first_icon = {
			{
				2,
				86228,
				1
			},
			{
				1,
				14,
				2026
			}
		}
	}
	pg.base.pay_data_display[9019] = {
		limit_group = 0,
		name = "夏の水着福袋2025B(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 9019,
		subject = "夏の水着福袋2025B(復刻)",
		first_text = "ランダム着せ替え",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "ランダムな夏水着2025B・ダイヤ×2025などを入手可能",
		name_display = "夏の水着福袋2025B(復刻)",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai25",
		extra_service = 3,
		skin_inquire_relation = 86214,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi218",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond206",
		extra_service_item = {
			{
				2,
				86214,
				1
			},
			{
				1,
				14,
				2025
			},
			{
				2,
				42066,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2026,
					5,
					28
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					6,
					11
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42066,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81214,
				1
			}
		},
		first_icon = {
			{
				2,
				86214,
				1
			},
			{
				1,
				14,
				2025
			}
		}
	}
	pg.base.pay_data_display[9020] = {
		limit_group = 0,
		name = "海浜レース福袋",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 9020,
		subject = "海浜レース福袋",
		first_text = "ランダム着せ替え",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name_display = "海浜レース福袋",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai37",
		extra_service = 3,
		skin_inquire_relation = 86229,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi219",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond207",
		extra_service_item = {
			{
				2,
				86229,
				1
			},
			{
				1,
				14,
				2026
			},
			{
				2,
				42086,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2026,
					8,
					13
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					8,
					26
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42086,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81237,
				1
			}
		},
		first_icon = {
			{
				2,
				86229,
				1
			},
			{
				1,
				14,
				2026
			}
		}
	}
	pg.base.pay_data_display[9021] = {
		limit_group = 0,
		name = "九周年福袋A",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 9021,
		subject = "九周年福袋A",
		first_text = "ランダム着せ替え",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name_display = "九周年福袋A",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai38",
		extra_service = 3,
		skin_inquire_relation = 86230,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi220",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond208",
		extra_service_item = {
			{
				2,
				86230,
				1
			},
			{
				1,
				14,
				2026
			},
			{
				2,
				42086,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2026,
					9,
					8
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					9,
					30
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42086,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81238,
				1
			}
		},
		first_icon = {
			{
				2,
				86230,
				1
			},
			{
				1,
				14,
				2026
			}
		}
	}
	pg.base.pay_data_display[9022] = {
		limit_group = 0,
		name = "八周年福袋A(復刻)",
		descrip_extra = "※福袋は購入後、メールボックスに送られます。\nすでに所持している着せ替えを入手した場合、自動的に衣装の価格分の無償ダイヤに変換されます。",
		type = 1,
		second_text = "大量な報酬",
		id = 9022,
		subject = "八周年福袋A(復刻)",
		first_text = "ランダム着せ替え",
		package_sort_id = 0,
		tip = "",
		money = 3800,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "アイテム・資源とランダムな着せ替え衣装を入手可能",
		name_display = "八周年福袋A(復刻)",
		limit_type = 2,
		type_order = 2,
		akashi_pick = 1,
		package_tag = "",
		picture = "fudai27",
		extra_service = 3,
		skin_inquire_relation = 86217,
		limit_arg = 1,
		id_str = "com.bilibili.blhx.zuanshi221",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.diamond209",
		extra_service_item = {
			{
				2,
				86217,
				1
			},
			{
				1,
				14,
				2025
			},
			{
				2,
				42076,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			},
			{
				2,
				15003,
				10
			},
			{
				1,
				6,
				100
			}
		},
		time = {
			{
				{
					2026,
					9,
					8
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					9,
					30
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42076,
				2
			},
			{
				2,
				15008,
				50
			},
			{
				2,
				20001,
				20
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81217,
				1
			}
		},
		first_icon = {
			{
				2,
				86217,
				1
			},
			{
				1,
				14,
				2025
			}
		}
	}
	pg.base.pay_data_display[1000] = {
		limit_group = 0,
		name = "クルーズパス",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "",
		id = 1000,
		subject = "クルーズパス",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		limit_type = 2,
		name_display = "クルーズパス",
		type_order = 0,
		package_tag = "",
		picture = "battlepass_1",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 4,
		id_str = "com.bilibili.blhx.battlepass1",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.seasonpass1",
		extra_service_item = {
			{
				1,
				4001,
				1500
			},
			{
				8,
				59242,
				1
			}
		},
		time = {
			{
				{
					2021,
					10,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2021,
					11,
					30
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				1,
				4001,
				1500
			}
		},
		sub_display = {
			7001,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[1001] = {
		limit_group = 0,
		name = "クルーズパス(21初冬)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "",
		id = 1001,
		subject = "クルーズパス(21初冬)",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		limit_type = 2,
		name_display = "クルーズパス(21初冬)",
		type_order = 0,
		package_tag = "",
		picture = "battlepass_1",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 4,
		id_str = "com.bilibili.blhx.battlepass2",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.seasonpass2",
		extra_service_item = {
			{
				1,
				4002,
				1500
			},
			{
				8,
				59254,
				1
			}
		},
		time = {
			{
				{
					2021,
					12,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2022,
					1,
					31
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				1,
				4002,
				1500
			}
		},
		sub_display = {
			7002,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[1002] = {
		limit_group = 0,
		name = "クルーズパス(22冬)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "",
		id = 1002,
		subject = "クルーズパス(22冬)",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		limit_type = 2,
		name_display = "クルーズパス(22冬)",
		type_order = 0,
		package_tag = "",
		picture = "battlepass_1",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 4,
		id_str = "com.bilibili.blhx.battlepass3",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.seasonpass3",
		extra_service_item = {
			{
				1,
				4003,
				1500
			},
			{
				8,
				59270,
				1
			}
		},
		time = {
			{
				{
					2022,
					2,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2022,
					3,
					31
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				1,
				4003,
				1500
			}
		},
		sub_display = {
			7003,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[1003] = {
		limit_group = 0,
		name = "クルーズパス(22春)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "",
		id = 1003,
		subject = "クルーズパス(22春)",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		limit_type = 2,
		name_display = "クルーズパス(22春)",
		type_order = 0,
		package_tag = "",
		picture = "battlepass_1",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 4,
		id_str = "com.bilibili.blhx.battlepass4",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.seasonpass4",
		extra_service_item = {
			{
				1,
				4004,
				1500
			},
			{
				8,
				59281,
				1
			}
		},
		time = {
			{
				{
					2022,
					4,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2022,
					5,
					31
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				1,
				4004,
				1500
			}
		},
		sub_display = {
			7004,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[1004] = {
		limit_group = 0,
		name = "クルーズパス(22初夏)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "",
		id = 1004,
		subject = "クルーズパス(22初夏)",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		limit_type = 2,
		name_display = "クルーズパス(22初夏)",
		type_order = 0,
		package_tag = "",
		picture = "battlepass_1",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 4,
		id_str = "com.bilibili.blhx.battlepass5",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.seasonpass5",
		extra_service_item = {
			{
				1,
				4005,
				1500
			},
			{
				8,
				59291,
				1
			}
		},
		time = {
			{
				{
					2022,
					6,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2022,
					7,
					31
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				1,
				4005,
				1500
			}
		},
		sub_display = {
			7005,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[1005] = {
		limit_group = 0,
		name = "クルーズパス(22夏)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "",
		id = 1005,
		subject = "クルーズパス(22夏)",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		limit_type = 2,
		name_display = "クルーズパス(22夏)",
		type_order = 4,
		package_tag = "",
		picture = "battlepass_1",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 4,
		id_str = "com.bilibili.blhx.battlepass6",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.seasonpass6",
		extra_service_item = {
			{
				1,
				4006,
				1500
			},
			{
				8,
				59292,
				1
			}
		},
		time = {
			{
				{
					2022,
					8,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2022,
					9,
					30
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				1,
				4006,
				1500
			}
		},
		sub_display = {
			7006,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[1006] = {
		limit_group = 0,
		name = "クルーズパス(22秋)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "",
		id = 1006,
		subject = "クルーズパス(22秋)",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		limit_type = 2,
		name_display = "クルーズパス(22秋)",
		type_order = 4,
		package_tag = "",
		picture = "battlepass_1",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 4,
		id_str = "com.bilibili.blhx.battlepass7",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.seasonpass7",
		extra_service_item = {
			{
				1,
				4007,
				1500
			},
			{
				8,
				59294,
				1
			}
		},
		time = {
			{
				{
					2022,
					10,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2022,
					11,
					30
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				1,
				4007,
				1500
			}
		},
		sub_display = {
			7007,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[1007] = {
		limit_group = 0,
		name = "クルーズパス(22初冬)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "",
		id = 1007,
		subject = "クルーズパス(22初冬)",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		limit_type = 2,
		name_display = "クルーズパス(22初冬)",
		type_order = 4,
		package_tag = "",
		picture = "battlepass_1",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 4,
		id_str = "com.bilibili.blhx.battlepass8",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.seasonpass8",
		extra_service_item = {
			{
				1,
				4008,
				1500
			},
			{
				8,
				59297,
				1
			}
		},
		time = {
			{
				{
					2022,
					12,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2023,
					1,
					31
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				1,
				4008,
				1500
			}
		},
		sub_display = {
			7008,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[1008] = {
		limit_group = 0,
		name = "クルーズパス(23冬)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "",
		id = 1008,
		subject = "クルーズパス(23冬)",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		limit_type = 2,
		name_display = "クルーズパス(23冬)",
		type_order = 4,
		package_tag = "",
		picture = "battlepass_1",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 4,
		id_str = "com.bilibili.blhx.battlepass9",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.seasonpass9",
		extra_service_item = {
			{
				1,
				4009,
				1500
			},
			{
				8,
				59299,
				1
			}
		},
		time = {
			{
				{
					2023,
					2,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2023,
					3,
					31
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				1,
				4009,
				1500
			}
		},
		sub_display = {
			7009,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[1009] = {
		limit_group = 0,
		name = "クルーズパス(23春)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "",
		id = 1009,
		subject = "クルーズパス(23春)",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		limit_type = 2,
		name_display = "クルーズパス(23春)",
		type_order = 4,
		package_tag = "",
		picture = "battlepass_1",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 4,
		id_str = "com.bilibili.blhx.battlepass10",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.seasonpass10",
		extra_service_item = {
			{
				1,
				4010,
				1500
			},
			{
				8,
				59404,
				1
			}
		},
		time = {
			{
				{
					2023,
					4,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2023,
					5,
					31
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				1,
				4010,
				1500
			}
		},
		sub_display = {
			7010,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[1010] = {
		limit_group = 0,
		name = "クルーズパス(23初夏)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "",
		id = 1010,
		subject = "クルーズパス(23初夏)",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		limit_type = 2,
		name_display = "クルーズパス(23初夏)",
		type_order = 4,
		package_tag = "",
		picture = "battlepass_1",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 4,
		id_str = "com.bilibili.blhx.battlepass12",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.seasonpass11",
		extra_service_item = {
			{
				1,
				4011,
				1500
			},
			{
				8,
				59456,
				1
			}
		},
		time = {
			{
				{
					2023,
					6,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2023,
					7,
					31
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				1,
				4011,
				1500
			}
		},
		sub_display = {
			7011,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[1011] = {
		limit_group = 0,
		name = "クルーズパス(23夏)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "",
		id = 1011,
		subject = "クルーズパス(23夏)",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		limit_type = 2,
		name_display = "クルーズパス(23夏)",
		type_order = 4,
		package_tag = "",
		picture = "battlepass_1",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 4,
		id_str = "com.bilibili.blhx.battlepass13",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.seasonpass12",
		extra_service_item = {
			{
				1,
				4012,
				1500
			},
			{
				8,
				59468,
				1
			}
		},
		time = {
			{
				{
					2023,
					8,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2023,
					9,
					30
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				1,
				4012,
				1500
			}
		},
		sub_display = {
			7012,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[1012] = {
		limit_group = 0,
		name = "クルーズパス(23秋)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "",
		id = 1012,
		subject = "クルーズパス(23秋)",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		limit_type = 2,
		name_display = "クルーズパス(23秋)",
		type_order = 4,
		package_tag = "",
		picture = "battlepass_1",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 4,
		id_str = "com.bilibili.blhx.battlepass14",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.seasonpass13",
		extra_service_item = {
			{
				1,
				4013,
				1500
			},
			{
				8,
				59494,
				1
			}
		},
		time = {
			{
				{
					2023,
					10,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2023,
					11,
					30
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				1,
				4013,
				1500
			}
		},
		sub_display = {
			7013,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[1013] = {
		limit_group = 0,
		name = "クルーズパス(23初冬)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "",
		id = 1013,
		subject = "クルーズパス(23初冬)",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		limit_type = 2,
		name_display = "クルーズパス(23初冬)",
		type_order = 4,
		package_tag = "",
		picture = "battlepass_1",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 4,
		id_str = "com.bilibili.blhx.battlepass15",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.seasonpass14",
		extra_service_item = {
			{
				1,
				4014,
				1500
			},
			{
				8,
				59511,
				1
			}
		},
		time = {
			{
				{
					2023,
					12,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					1,
					31
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				1,
				4014,
				1500
			}
		},
		sub_display = {
			7014,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[1014] = {
		limit_group = 0,
		name = "クルーズパス(24冬)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "",
		id = 1014,
		subject = "クルーズパス(24冬)",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		limit_type = 2,
		name_display = "クルーズパス(24冬)",
		type_order = 4,
		package_tag = "",
		picture = "battlepass_1",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 4,
		id_str = "com.bilibili.blhx.battlepass16",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.seasonpass15",
		extra_service_item = {
			{
				1,
				4015,
				1500
			},
			{
				8,
				59526,
				1
			}
		},
		time = {
			{
				{
					2024,
					2,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					3,
					31
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				1,
				4015,
				1500
			}
		},
		sub_display = {
			7015,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[1015] = {
		limit_group = 0,
		name = "クルーズパス(24春)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "",
		id = 1015,
		subject = "クルーズパス(24春)",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		limit_type = 2,
		name_display = "クルーズパス(24春)",
		type_order = 4,
		package_tag = "",
		picture = "battlepass_1",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 4,
		id_str = "com.bilibili.blhx.battlepass17",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.seasonpass16",
		extra_service_item = {
			{
				1,
				4016,
				1500
			},
			{
				8,
				59541,
				1
			}
		},
		time = {
			{
				{
					2024,
					4,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					5,
					31
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				1,
				4016,
				1500
			}
		},
		sub_display = {
			7016,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[1016] = {
		limit_group = 0,
		name = "クルーズパス(24初夏)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "",
		id = 1016,
		subject = "クルーズパス(24初夏)",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		limit_type = 2,
		name_display = "クルーズパス(24初夏)",
		type_order = 4,
		package_tag = "",
		picture = "battlepass_1",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 4,
		id_str = "com.bilibili.blhx.battlepass18",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.seasonpass17",
		extra_service_item = {
			{
				1,
				4017,
				1500
			},
			{
				8,
				59584,
				1
			}
		},
		time = {
			{
				{
					2024,
					6,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					7,
					31
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				1,
				4017,
				1500
			}
		},
		sub_display = {
			7017,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[1017] = {
		limit_group = 0,
		name = "クルーズパス(24夏)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "",
		id = 1017,
		subject = "クルーズパス(24夏)",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		limit_type = 2,
		name_display = "クルーズパス(24夏)",
		type_order = 4,
		package_tag = "",
		picture = "battlepass_1",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 4,
		id_str = "com.bilibili.blhx.battlepass19",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.seasonpass18",
		extra_service_item = {
			{
				1,
				4018,
				1500
			},
			{
				8,
				65001,
				1
			}
		},
		time = {
			{
				{
					2024,
					8,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					9,
					30
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				1,
				4018,
				1500
			}
		},
		sub_display = {
			7018,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[1018] = {
		limit_group = 0,
		name = "クルーズパス(24秋)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "",
		id = 1018,
		subject = "クルーズパス(24秋)",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		limit_type = 2,
		name_display = "クルーズパス(24秋)",
		type_order = 4,
		package_tag = "",
		picture = "battlepass_1",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 4,
		id_str = "com.bilibili.blhx.battlepass20",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.seasonpass19",
		extra_service_item = {
			{
				1,
				4019,
				1500
			},
			{
				8,
				65028,
				1
			}
		},
		time = {
			{
				{
					2024,
					10,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					11,
					30
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				1,
				4019,
				1500
			}
		},
		sub_display = {
			7019,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[1019] = {
		limit_group = 0,
		name = "クルーズパス(24初冬)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "",
		id = 1019,
		subject = "クルーズパス(24初冬)",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		limit_type = 2,
		name_display = "クルーズパス(24初冬)",
		type_order = 6,
		package_tag = "",
		picture = "battlepass_1",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 4,
		id_str = "com.bilibili.blhx.battlepass21",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.seasonpass20",
		extra_service_item = {
			{
				1,
				4020,
				1500
			},
			{
				8,
				65057,
				1
			}
		},
		time = {
			{
				{
					2024,
					12,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					1,
					31
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				8,
				59599,
				1500
			}
		},
		sub_display = {
			7020,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[1020] = {
		limit_group = 0,
		name = "クルーズパス(25冬)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "",
		id = 1020,
		subject = "クルーズパス(25冬)",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		limit_type = 2,
		name_display = "クルーズパス(25冬)",
		type_order = 6,
		package_tag = "",
		picture = "battlepass_1",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 4,
		id_str = "com.bilibili.blhx.battlepass22",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.seasonpass21",
		extra_service_item = {
			{
				1,
				4021,
				1500
			},
			{
				8,
				65074,
				1
			}
		},
		time = {
			{
				{
					2025,
					2,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					3,
					31
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				8,
				59599,
				1500
			}
		},
		sub_display = {
			7021,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[1021] = {
		limit_group = 0,
		name = "クルーズパス(25春)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "",
		id = 1021,
		subject = "クルーズパス(25春)",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		limit_type = 2,
		name_display = "クルーズパス(25春)",
		type_order = 6,
		package_tag = "",
		picture = "battlepass_1",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 4,
		id_str = "com.bilibili.blhx.battlepass23",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.seasonpass22",
		extra_service_item = {
			{
				1,
				4022,
				1500
			},
			{
				8,
				65086,
				1
			}
		},
		time = {
			{
				{
					2025,
					4,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					5,
					31
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				8,
				59599,
				1500
			}
		},
		sub_display = {
			7022,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[1022] = {
		limit_group = 0,
		name = "クルーズパス(25初夏)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "",
		id = 1022,
		subject = "クルーズパス(25初夏)",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		limit_type = 2,
		name_display = "クルーズパス(25初夏)",
		type_order = 6,
		package_tag = "",
		picture = "battlepass_1",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 4,
		id_str = "com.bilibili.blhx.battlepass24",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.seasonpass23",
		extra_service_item = {
			{
				1,
				4023,
				1500
			},
			{
				8,
				65100,
				1
			}
		},
		time = {
			{
				{
					2025,
					6,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					7,
					31
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				8,
				59599,
				1500
			}
		},
		sub_display = {
			7023,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[1023] = {
		limit_group = 0,
		name = "クルーズパス(25夏)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "特別報酬開放",
		id = 1023,
		subject = "クルーズパス(25夏)",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		limit_type = 2,
		name_display = "クルーズパス(25夏)",
		type_order = 6,
		package_tag = "",
		picture = "battlepass_1",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 4,
		id_str = "com.bilibili.blhx.battlepass25",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.seasonpass24",
		extra_service_item = {
			{
				1,
				4024,
				1500
			},
			{
				8,
				65101,
				1
			}
		},
		time = {
			{
				{
					2025,
					8,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					9,
					30
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				8,
				59599,
				1500
			}
		},
		sub_display = {
			7024,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[1024] = {
		limit_group = 0,
		name = "クルーズパス(25秋)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "特別報酬開放",
		id = 1024,
		subject = "クルーズパス(25秋)",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		limit_type = 2,
		name_display = "クルーズパス(25秋)",
		type_order = 6,
		package_tag = "",
		picture = "battlepass_1",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 4,
		id_str = "com.bilibili.blhx.battlepass26",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.seasonpass25",
		extra_service_item = {
			{
				1,
				4025,
				1500
			},
			{
				8,
				65106,
				1
			}
		},
		time = {
			{
				{
					2025,
					10,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					11,
					30
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				8,
				59599,
				1500
			}
		},
		sub_display = {
			7025,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[1025] = {
		limit_group = 0,
		name = "クルーズパス(25初冬)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "特別報酬開放",
		id = 1025,
		subject = "クルーズパス(25初冬)",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		limit_type = 2,
		name_display = "クルーズパス(25初冬)",
		type_order = 6,
		package_tag = "",
		picture = "battlepass_1",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 4,
		id_str = "com.bilibili.blhx.battlepass27",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.seasonpass26",
		extra_service_item = {
			{
				1,
				4026,
				1500
			},
			{
				8,
				65108,
				1
			}
		},
		time = {
			{
				{
					2025,
					12,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					1,
					31
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				8,
				59599,
				1500
			}
		},
		sub_display = {
			7026,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[1026] = {
		limit_group = 0,
		name = "クルーズパス(26冬)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "特別報酬開放",
		id = 1026,
		subject = "クルーズパス(26冬)",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		limit_type = 2,
		name_display = "クルーズパス(26冬)",
		type_order = 6,
		package_tag = "",
		picture = "battlepass_1",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 4,
		id_str = "com.bilibili.blhx.battlepass28",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.seasonpass27",
		extra_service_item = {
			{
				1,
				4027,
				1500
			},
			{
				8,
				65113,
				1
			}
		},
		time = {
			{
				{
					2026,
					2,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					3,
					31
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				8,
				59599,
				1500
			}
		},
		sub_display = {
			7027,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[1027] = {
		limit_group = 0,
		name = "クルーズパス(26春)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "特別報酬開放",
		id = 1027,
		subject = "クルーズパス(26春)",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		limit_type = 2,
		name_display = "クルーズパス(26春)",
		type_order = 6,
		package_tag = "",
		picture = "battlepass_1",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 4,
		id_str = "com.bilibili.blhx.battlepass29",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.seasonpass28",
		extra_service_item = {
			{
				1,
				4028,
				1500
			},
			{
				8,
				65116,
				1
			}
		},
		time = {
			{
				{
					2026,
					4,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					5,
					31
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				8,
				59599,
				1500
			}
		},
		sub_display = {
			7028,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[1028] = {
		limit_group = 0,
		name = "クルーズパス(26初夏)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "特別報酬開放",
		id = 1028,
		subject = "クルーズパス(26初夏)",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		limit_type = 2,
		name_display = "クルーズパス(26初夏)",
		type_order = 6,
		package_tag = "",
		picture = "battlepass_1",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 4,
		id_str = "com.bilibili.blhx.battlepass30",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.seasonpass29",
		extra_service_item = {
			{
				1,
				4029,
				1500
			},
			{
				8,
				65117,
				1
			}
		},
		time = {
			{
				{
					2026,
					6,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					7,
					31
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				8,
				59599,
				1500
			}
		},
		sub_display = {
			7029,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[1029] = {
		limit_group = 0,
		name = "クルーズパス(26夏)",
		descrip_extra = "※シーズン任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "特別報酬開放",
		id = 1029,
		subject = "クルーズパス(26夏)",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1200,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "購入すると、シーズン任務進捗Pt1500を入手し、さらにSP報酬を開放",
		limit_type = 2,
		name_display = "クルーズパス(26夏)",
		type_order = 6,
		package_tag = "",
		picture = "battlepass_1",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 4,
		id_str = "com.bilibili.blhx.battlepass31",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.seasonpass30",
		extra_service_item = {
			{
				1,
				4030,
				1500
			},
			{
				8,
				65118,
				1
			}
		},
		time = {
			{
				{
					2026,
					8,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					9,
					30
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				8,
				59599,
				1500
			}
		},
		sub_display = {
			7030,
			1500
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[1303] = {
		limit_group = 0,
		name = "迎春特売パス2026",
		descrip_extra = "※パス任務クリア時に追加の報酬を入手可能",
		type = 0,
		second_text = "",
		id = 1303,
		subject = "迎春特売パス2026",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1100,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "特売任務Pt200を入手でき、さらにダイヤ・キューブ・戦闘UIなどの追加報酬が開放されます",
		limit_type = 2,
		name_display = "迎春特売パス2026",
		type_order = 4,
		package_tag = "",
		picture = "battlepass_winter_1",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 4,
		id_str = "com.bilibili.blhx.battlepass303",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.seasonpass302",
		extra_service_item = {
			{
				1,
				4102,
				200
			},
			{
				8,
				65112,
				1
			}
		},
		time = {
			{
				{
					2026,
					2,
					26
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					3,
					18
				},
				{
					22,
					59,
					59
				}
			}
		},
		display = {
			{
				8,
				65112,
				200
			}
		},
		sub_display = {
			7303,
			200
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[2001] = {
		limit_group = 1,
		name = "PR特別計画艦パック・Ⅰ期",
		descrip_extra = "此处不会被看到",
		type = 0,
		second_text = "+強化ユニット",
		id = 2001,
		subject = "PR特別計画艦パック・Ⅰ期",
		first_text = "特別計画艦",
		package_sort_id = 3,
		tip = "",
		money = 2000,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "特別計画艦・Ⅰ期と交換できるアイテムなどを入手できます",
		name_display = "PR特別計画艦パック・Ⅰ期",
		limit_type = 3,
		time = "always",
		akashi_pick = 1,
		package_tag = "",
		picture = "tech1_display",
		type_order = 0,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "tech",
		limit_arg = 0,
		package_tag_open = 0,
		airijp_id = "",
		extra_service_item = {
			{
				2,
				40124,
				1
			},
			{
				2,
				42000,
				343
			}
		},
		display = {
			{
				2,
				42000,
				343
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {
			{
				"level",
				30
			}
		},
		drop_item = {},
		first_icon = {
			{
				2,
				40124,
				1
			}
		}
	}
	pg.base.pay_data_display[2002] = {
		limit_group = 1,
		name = "PR艦船Ⅰ期交換アイテム＋強化ユニットセット",
		descrip_extra = "既に特別計画艦Ⅰ期全艦船をすべて所持している場合、使用時にアイテムに変換されます（アイコンタップで確認）",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "PR艦船Ⅰ期交換アイテム＋強化ユニットセット",
		package_sort_id = 3,
		tip = "",
		tip_open = 0,
		money = 2000,
		cash_show = 0,
		descrip = "内容",
		name_display = "PR艦船Ⅰ期交換アイテム\n＋強化ユニットセット",
		gem = 0,
		limit_arg = 1,
		limit_type = 3,
		package_tag = "",
		picture = "tech1_promotion",
		id_str = "com.bilibili.blhx.keyan1",
		extra_gem = 0,
		id = 2002,
		airijp_id = "com.yostarjp.azurlane.tech1",
		first_icon = "",
		first_text = "",
		tag = 2,
		akashi_pick = 1,
		time = "always",
		skin_inquire_relation = 0,
		first_pay_double = 0,
		extra_service = 3,
		show_group = "tech",
		package_tag_open = 0,
		extra_service_item = {
			{
				2,
				40124,
				1
			},
			{
				2,
				42000,
				343
			}
		},
		display = {
			{
				2,
				40124,
				1
			},
			{
				2,
				42000,
				343
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {
			{
				"level",
				30
			}
		},
		drop_item = {
			{
				2,
				40016,
				1
			}
		}
	}
	pg.base.pay_data_display[2003] = {
		limit_group = 1,
		name = "PR艦船Ⅰ期交換アイテム",
		descrip_extra = "既に特別計画艦Ⅰ期全艦船をすべて所持している場合、使用時にアイテムに変換されます（アイコンタップで確認）",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "PR艦船Ⅰ期交換アイテム",
		package_sort_id = 3,
		tip = "",
		tip_open = 0,
		money = 1200,
		cash_show = 0,
		descrip = "内容",
		name_display = "PR艦船Ⅰ期交換アイテム",
		gem = 0,
		limit_arg = 2,
		limit_type = 3,
		package_tag = "",
		picture = "tech1_normal",
		id_str = "com.bilibili.blhx.keyan2",
		extra_gem = 0,
		id = 2003,
		airijp_id = "com.yostarjp.azurlane.tech2",
		first_icon = "",
		first_text = "",
		tag = 2,
		akashi_pick = 1,
		time = "always",
		skin_inquire_relation = 0,
		first_pay_double = 0,
		extra_service = 3,
		show_group = "tech",
		package_tag_open = 0,
		extra_service_item = {
			{
				2,
				40124,
				1
			}
		},
		display = {
			{
				2,
				40124,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {
			{
				"level",
				30
			}
		},
		drop_item = {
			{
				2,
				40017,
				1
			}
		}
	}
	pg.base.pay_data_display[2004] = {
		limit_group = 1,
		name = "PR特別計画艦Ⅰ期強化ユニットセット",
		descrip_extra = "購入すると指向型強化ユニット・Ⅰ期×343個を入手可能",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "強化ユニット",
		package_sort_id = 3,
		tip = "",
		tip_open = 0,
		money = 1000,
		cash_show = 0,
		descrip = "内容",
		name_display = "強化ユニット",
		gem = 0,
		limit_arg = 3,
		limit_type = 3,
		package_tag = "",
		picture = "tech1_promotion",
		id_str = "com.bilibili.blhx.keyan3",
		extra_gem = 0,
		id = 2004,
		airijp_id = "com.yostarjp.azurlane.tech3",
		first_icon = "",
		first_text = "",
		tag = 2,
		akashi_pick = 1,
		time = "always",
		skin_inquire_relation = 0,
		first_pay_double = 0,
		extra_service = 3,
		show_group = "tech",
		package_tag_open = 0,
		extra_service_item = {
			{
				2,
				42000,
				343
			}
		},
		display = {
			{
				2,
				42000,
				343
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {
			{
				"level",
				30
			}
		},
		drop_item = {
			{
				2,
				40018,
				1
			}
		}
	}
	pg.base.pay_data_display[2005] = {
		limit_group = 2,
		name = "PR特別計画艦パック・Ⅱ期",
		descrip_extra = "此处不会被看到",
		type = 0,
		second_text = "+強化ユニット",
		id = 2005,
		subject = "PR特別計画艦パック・Ⅱ期",
		first_text = "特別計画艦",
		package_sort_id = 3,
		tip = "",
		money = 2000,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "特別計画艦・Ⅱ期と交換できるアイテムなどを入手できます",
		name_display = "PR特別計画艦パック・Ⅱ期",
		limit_type = 3,
		time = "always",
		akashi_pick = 1,
		package_tag = "",
		picture = "tech2_display",
		type_order = 0,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "tech",
		limit_arg = 0,
		package_tag_open = 0,
		airijp_id = "",
		extra_service_item = {
			{
				2,
				40125,
				1
			},
			{
				2,
				42010,
				343
			}
		},
		display = {
			{
				2,
				42010,
				343
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {
			{
				"level",
				30
			}
		},
		drop_item = {},
		first_icon = {
			{
				2,
				40125,
				1
			}
		}
	}
	pg.base.pay_data_display[2006] = {
		limit_group = 2,
		name = "PR艦船Ⅱ期交換アイテム＋強化ユニットセット",
		descrip_extra = "既にPR艦船・Ⅱ期をすべて所持している場合、使用時にアイテムに変換されます（アイコンタップで確認）",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "PR艦船Ⅱ期交換アイテム＋強化ユニットセット",
		package_sort_id = 3,
		tip = "",
		tip_open = 0,
		money = 2000,
		cash_show = 0,
		descrip = "内容",
		name_display = "PR艦船Ⅱ期交換アイテム\n＋強化ユニットセット",
		gem = 0,
		limit_arg = 1,
		limit_type = 3,
		package_tag = "",
		picture = "tech2_promotion",
		id_str = "com.bilibili.blhx.keyan4",
		extra_gem = 0,
		id = 2006,
		airijp_id = "com.yostarjp.azurlane.tech4",
		first_icon = "",
		first_text = "",
		tag = 2,
		akashi_pick = 1,
		time = "always",
		skin_inquire_relation = 0,
		first_pay_double = 0,
		extra_service = 3,
		show_group = "tech",
		package_tag_open = 0,
		extra_service_item = {
			{
				2,
				40125,
				1
			},
			{
				2,
				42010,
				343
			}
		},
		display = {
			{
				2,
				40125,
				1
			},
			{
				2,
				42010,
				343
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {
			{
				"level",
				30
			}
		},
		drop_item = {
			{
				2,
				40019,
				1
			}
		}
	}
	pg.base.pay_data_display[2007] = {
		limit_group = 2,
		name = "PR艦船Ⅱ期交換アイテム",
		descrip_extra = "*既にPR艦船・Ⅱ期をすべて所持している場合、使用時にアイテムに変換されます（アイコンタップで確認）",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "PR艦船Ⅱ期交換アイテム",
		package_sort_id = 3,
		tip = "",
		tip_open = 0,
		money = 1200,
		cash_show = 0,
		descrip = "内容",
		name_display = "PR艦船Ⅱ期交換アイテム",
		gem = 0,
		limit_arg = 2,
		limit_type = 3,
		package_tag = "",
		picture = "tech2_normal",
		id_str = "com.bilibili.blhx.keyan5",
		extra_gem = 0,
		id = 2007,
		airijp_id = "com.yostarjp.azurlane.tech5",
		first_icon = "",
		first_text = "",
		tag = 2,
		akashi_pick = 1,
		time = "always",
		skin_inquire_relation = 0,
		first_pay_double = 0,
		extra_service = 3,
		show_group = "tech",
		package_tag_open = 0,
		extra_service_item = {
			{
				2,
				40125,
				1
			}
		},
		display = {
			{
				2,
				40125,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {
			{
				"level",
				30
			}
		},
		drop_item = {
			{
				2,
				40020,
				1
			}
		}
	}
	pg.base.pay_data_display[2008] = {
		limit_group = 2,
		name = "PR特別計画艦Ⅱ期強化ユニットセット",
		descrip_extra = "購入すると指向型強化ユニット・Ⅱ期×343個を入手可能",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "強化ユニット",
		package_sort_id = 3,
		tip = "",
		tip_open = 0,
		money = 1000,
		cash_show = 0,
		descrip = "内容",
		name_display = "強化ユニット",
		gem = 0,
		limit_arg = 3,
		limit_type = 3,
		package_tag = "",
		picture = "tech2_promotion",
		id_str = "com.bilibili.blhx.keyan6",
		extra_gem = 0,
		id = 2008,
		airijp_id = "com.yostarjp.azurlane.tech6",
		first_icon = "",
		first_text = "",
		tag = 2,
		akashi_pick = 1,
		time = "always",
		skin_inquire_relation = 0,
		first_pay_double = 0,
		extra_service = 3,
		show_group = "tech",
		package_tag_open = 0,
		extra_service_item = {
			{
				2,
				42010,
				343
			}
		},
		display = {
			{
				2,
				42010,
				343
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {
			{
				"level",
				30
			}
		},
		drop_item = {
			{
				2,
				40021,
				1
			}
		}
	}
	pg.base.pay_data_display[2009] = {
		limit_group = 0,
		name = "指揮官レベルアップパック",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "さらに",
		id = 2009,
		subject = "指揮官レベルアップパック",
		first_text = "指揮官Lv70に",
		package_sort_id = 1,
		tip = "",
		money = 650,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "購入すると指揮官レベルがLv70に上がり、さらにアイテムを大量に入手可能",
		name_display = "指揮官レベルアップパック",
		limit_type = 2,
		time = "always",
		akashi_pick = 1,
		package_tag = "",
		picture = "lv_70",
		type_order = 7,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.libao104",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.package104",
		extra_service_item = {
			{
				2,
				40126,
				1
			},
			{
				2,
				16502,
				200
			},
			{
				4,
				100011,
				4
			},
			{
				4,
				100001,
				4
			},
			{
				2,
				69001,
				1
			}
		},
		display = {
			{
				2,
				16502,
				200
			},
			{
				4,
				100011,
				4
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {
			{
				"lv_70",
				70
			}
		},
		drop_item = {
			{
				2,
				40022,
				1
			}
		},
		first_icon = {
			{
				2,
				40126,
				1
			}
		}
	}
	pg.base.pay_data_display[2010] = {
		limit_group = 0,
		name = "教科書パック",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		id = 2010,
		subject = "教科書パック",
		first_text = "",
		package_sort_id = 1,
		first_icon = "",
		money = 480,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "購入すると教科書を大量に入手可能",
		limit_type = 2,
		name_display = "教科書パック",
		type_order = 0,
		package_tag = "",
		picture = "boxSkill",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.libao105",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 4,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.package105",
		extra_service_item = {
			{
				2,
				16004,
				1
			},
			{
				2,
				16014,
				1
			},
			{
				2,
				16024,
				1
			},
			{
				2,
				16003,
				3
			},
			{
				2,
				16013,
				3
			},
			{
				2,
				16023,
				3
			}
		},
		time = {
			{
				{
					2022,
					4,
					14
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2022,
					6,
					30
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				16004,
				1
			},
			{
				2,
				16014,
				1
			},
			{
				2,
				16024,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40023,
				1
			}
		}
	}
	pg.base.pay_data_display[2011] = {
		limit_group = 0,
		name = "教科書パック",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		id = 2011,
		subject = "教科書パック",
		first_text = "",
		package_sort_id = 1,
		first_icon = "",
		money = 480,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "購入すると教科書を大量に入手可能",
		limit_type = 2,
		name_display = "教科書パック",
		type_order = 0,
		package_tag = "",
		picture = "boxSkill",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.libao106",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 4,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.package106",
		extra_service_item = {
			{
				2,
				16004,
				1
			},
			{
				2,
				16014,
				1
			},
			{
				2,
				16024,
				1
			},
			{
				2,
				16003,
				3
			},
			{
				2,
				16013,
				3
			},
			{
				2,
				16023,
				3
			}
		},
		time = {
			{
				{
					2022,
					9,
					15
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2022,
					11,
					30
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				16004,
				1
			},
			{
				2,
				16014,
				1
			},
			{
				2,
				16024,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40023,
				1
			}
		}
	}
	pg.base.pay_data_display[2014] = {
		limit_group = 0,
		name = "教科書パック",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		id = 2014,
		subject = "教科書パック",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 480,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "購入すると教科書を大量に入手可能",
		limit_type = 2,
		name_display = "教科書パック",
		type_order = 0,
		package_tag = "",
		picture = "boxSkill",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.libao109",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 4,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.package109",
		extra_service_item = {
			{
				2,
				16004,
				1
			},
			{
				2,
				16014,
				1
			},
			{
				2,
				16024,
				1
			},
			{
				2,
				16003,
				3
			},
			{
				2,
				16013,
				3
			},
			{
				2,
				16023,
				3
			}
		},
		time = {
			{
				{
					2023,
					4,
					27
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2023,
					7,
					12
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				16004,
				1
			},
			{
				2,
				16014,
				1
			},
			{
				2,
				16024,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40023,
				1
			}
		}
	}
	pg.base.pay_data_display[2015] = {
		limit_group = 3,
		name = "PR特別計画艦パック・Ⅲ期",
		descrip_extra = "此处不会被看到",
		type = 0,
		second_text = "+強化ユニット",
		id = 2015,
		subject = "PR特別計画艦パック・Ⅲ期",
		first_text = "特別計画艦",
		package_sort_id = 3,
		tip = "",
		money = 2000,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "特別計画艦・Ⅲ期と交換できるアイテムなどを入手できます",
		name_display = "PR特別計画艦パック・Ⅲ期",
		limit_type = 3,
		time = "always",
		akashi_pick = 1,
		package_tag = "",
		picture = "tech3_display",
		type_order = 0,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "tech",
		limit_arg = 0,
		package_tag_open = 0,
		airijp_id = "",
		extra_service_item = {
			{
				2,
				40130,
				1
			},
			{
				2,
				42020,
				343
			}
		},
		display = {
			{
				2,
				42020,
				343
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {
			{
				"level",
				30
			}
		},
		drop_item = {},
		first_icon = {
			{
				2,
				40130,
				1
			}
		}
	}
	pg.base.pay_data_display[2016] = {
		limit_group = 3,
		name = "PR艦船Ⅲ期交換アイテム＋強化ユニットセット",
		descrip_extra = "*既にPR艦船・Ⅲ期をすべて所持している場合、使用時にアイテムに変換されます（アイコンタップで確認）",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "PR艦船Ⅲ期交換アイテム\n＋強化ユニットセット",
		package_sort_id = 3,
		tip = "",
		tip_open = 0,
		money = 2000,
		cash_show = 0,
		descrip = "内容",
		name_display = "PR艦船Ⅲ期交換アイテム\n＋強化ユニットセット",
		gem = 0,
		limit_arg = 1,
		limit_type = 3,
		package_tag = "",
		picture = "tech3_promotion",
		id_str = "com.bilibili.blhx.keyan7",
		extra_gem = 0,
		id = 2016,
		airijp_id = "com.yostarjp.azurlane.tech7",
		first_icon = "",
		first_text = "",
		tag = 2,
		akashi_pick = 1,
		time = "always",
		skin_inquire_relation = 0,
		first_pay_double = 0,
		extra_service = 3,
		show_group = "tech",
		package_tag_open = 0,
		extra_service_item = {
			{
				2,
				40130,
				1
			},
			{
				2,
				42020,
				343
			}
		},
		display = {
			{
				2,
				40130,
				1
			},
			{
				2,
				42020,
				343
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {
			{
				"level",
				30
			}
		},
		drop_item = {
			{
				2,
				40026,
				1
			}
		}
	}
	pg.base.pay_data_display[2017] = {
		limit_group = 3,
		name = "PR艦船Ⅲ期交換アイテム",
		descrip_extra = "*既にPR艦船・Ⅲ期をすべて所持している場合、使用時にアイテムに変換されます（アイコンタップで確認）",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "PR艦船Ⅲ期交換アイテム",
		package_sort_id = 3,
		tip = "",
		tip_open = 0,
		money = 1200,
		cash_show = 0,
		descrip = "内容",
		name_display = "PR艦船Ⅲ期交換アイテム",
		gem = 0,
		limit_arg = 2,
		limit_type = 3,
		package_tag = "",
		picture = "tech3_normal",
		id_str = "com.bilibili.blhx.keyan8",
		extra_gem = 0,
		id = 2017,
		airijp_id = "com.yostarjp.azurlane.tech8",
		first_icon = "",
		first_text = "",
		tag = 2,
		akashi_pick = 1,
		time = "always",
		skin_inquire_relation = 0,
		first_pay_double = 0,
		extra_service = 3,
		show_group = "tech",
		package_tag_open = 0,
		extra_service_item = {
			{
				2,
				40130,
				1
			}
		},
		display = {
			{
				2,
				40130,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {
			{
				"level",
				30
			}
		},
		drop_item = {
			{
				2,
				40027,
				1
			}
		}
	}
	pg.base.pay_data_display[2018] = {
		limit_group = 3,
		name = "PR特別計画艦Ⅲ期強化ユニットセット",
		descrip_extra = "購入すると指向型強化ユニット・Ⅲ期×343個を入手可能",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "強化ユニット",
		package_sort_id = 3,
		tip = "",
		tip_open = 0,
		money = 1000,
		cash_show = 0,
		descrip = "内容",
		name_display = "強化ユニット",
		gem = 0,
		limit_arg = 3,
		limit_type = 3,
		package_tag = "",
		picture = "tech3_promotion",
		id_str = "com.bilibili.blhx.keyan9",
		extra_gem = 0,
		id = 2018,
		airijp_id = "com.yostarjp.azurlane.tech9",
		first_icon = "",
		first_text = "",
		tag = 2,
		akashi_pick = 1,
		time = "always",
		skin_inquire_relation = 0,
		first_pay_double = 0,
		extra_service = 3,
		show_group = "tech",
		package_tag_open = 0,
		extra_service_item = {
			{
				2,
				42020,
				343
			}
		},
		display = {
			{
				2,
				42020,
				343
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {
			{
				"level",
				30
			}
		},
		drop_item = {
			{
				2,
				40028,
				1
			}
		}
	}
	pg.base.pay_data_display[2019] = {
		limit_group = 0,
		name = "教科書パック",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		id = 2019,
		subject = "教科書パック",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 480,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "購入すると教科書を大量に入手可能",
		limit_type = 2,
		name_display = "教科書パック",
		type_order = 0,
		package_tag = "",
		picture = "boxSkill",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.libao110",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 4,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.package110",
		extra_service_item = {
			{
				2,
				16004,
				1
			},
			{
				2,
				16014,
				1
			},
			{
				2,
				16024,
				1
			},
			{
				2,
				16003,
				3
			},
			{
				2,
				16013,
				3
			},
			{
				2,
				16023,
				3
			}
		},
		time = {
			{
				{
					2023,
					11,
					23
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					4,
					3
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				16004,
				1
			},
			{
				2,
				16014,
				1
			},
			{
				2,
				16024,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40023,
				1
			}
		}
	}
	pg.base.pay_data_display[2020] = {
		limit_group = 0,
		name = "冬のお得福袋・2024",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		id = 2020,
		subject = "冬のお得福袋・2024",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 5280,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "ダイヤ3880個、特装型ブリMkⅢなどを入手可能",
		limit_type = 2,
		name_display = "冬のお得福袋・2024",
		type_order = 0,
		package_tag = "",
		picture = "dongzhi3",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.libao111",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.package111",
		extra_service_item = {
			{
				1,
				14,
				3880
			},
			{
				4,
				100021,
				1
			},
			{
				4,
				100011,
				2
			},
			{
				2,
				15012,
				150
			},
			{
				2,
				16502,
				60
			},
			{
				2,
				30113,
				150
			}
		},
		time = {
			{
				{
					2024,
					1,
					18
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					2,
					21
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				1,
				14,
				3880
			},
			{
				4,
				100021,
				1
			},
			{
				4,
				100011,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40029,
				1
			}
		}
	}
	pg.base.pay_data_display[2021] = {
		limit_group = 0,
		name = "選べるUR着せ替え福袋①",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "選べるUR着せ替え福袋①",
		package_sort_id = 0,
		tip = "",
		tip_open = 0,
		money = 2600,
		cash_show = 0,
		descrip = "選べる着せ替えチケット、キューブ、経験値パックT2などを入手可能",
		name_display = "選べるUR着せ替え福袋①",
		gem = 0,
		limit_arg = 2,
		limit_type = 2,
		package_tag = "",
		picture = "haishangchuanqi",
		id_str = "com.bilibili.blhx.libao112",
		extra_gem = 0,
		id = 2021,
		airijp_id = "com.yostarjp.azurlane.package112",
		first_icon = "",
		first_text = "",
		tag = 2,
		akashi_pick = 1,
		sub_display = "",
		skin_inquire_relation = 0,
		first_pay_double = 0,
		extra_service = 3,
		show_group = "",
		package_tag_open = 0,
		extra_service_item = {
			{
				2,
				59550,
				1
			},
			{
				2,
				20001,
				40
			},
			{
				1,
				1,
				30000
			},
			{
				2,
				16502,
				50
			}
		},
		time = {
			{
				{
					2024,
					1,
					18
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					2,
					21
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				59550,
				1
			},
			{
				2,
				20001,
				40
			},
			{
				2,
				16502,
				50
			}
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40030,
				1
			}
		}
	}
	pg.base.pay_data_display[2022] = {
		limit_group = 0,
		name = "キューブ補給パック①",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "キューブ補給パック①",
		package_sort_id = 0,
		tip = "",
		tip_open = 0,
		money = 250,
		cash_show = 0,
		descrip = "キューブ10個を入手可能",
		name_display = "キューブ補給パック①",
		gem = 0,
		limit_arg = 2,
		limit_type = 2,
		package_tag = "",
		picture = "mofangzhiyuan1",
		id_str = "com.bilibili.blhx.libao113",
		extra_gem = 0,
		id = 2022,
		airijp_id = "com.yostarjp.azurlane.package113",
		first_icon = "",
		first_text = "",
		tag = 2,
		akashi_pick = 1,
		sub_display = "",
		skin_inquire_relation = 0,
		first_pay_double = 0,
		extra_service = 3,
		show_group = "",
		package_tag_open = 0,
		extra_service_item = {
			{
				2,
				20001,
				10
			}
		},
		time = {
			{
				{
					2024,
					1,
					18
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					2,
					21
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				20001,
				10
			}
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40031,
				1
			}
		}
	}
	pg.base.pay_data_display[2023] = {
		limit_group = 0,
		name = "キューブ補給パック②",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "キューブ補給パック②",
		package_sort_id = 0,
		tip = "",
		tip_open = 0,
		money = 610,
		cash_show = 0,
		descrip = "キューブ20個を入手可能",
		name_display = "キューブ補給パック②",
		gem = 0,
		limit_arg = 2,
		limit_type = 2,
		package_tag = "",
		picture = "mofangzhiyuan2",
		id_str = "com.bilibili.blhx.libao114",
		extra_gem = 0,
		id = 2023,
		airijp_id = "com.yostarjp.azurlane.package114",
		first_icon = "",
		first_text = "",
		tag = 2,
		akashi_pick = 1,
		sub_display = "",
		skin_inquire_relation = 0,
		first_pay_double = 0,
		extra_service = 3,
		show_group = "",
		package_tag_open = 0,
		extra_service_item = {
			{
				2,
				20001,
				20
			}
		},
		time = {
			{
				{
					2024,
					1,
					18
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					2,
					21
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				20001,
				20
			}
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40032,
				1
			}
		}
	}
	pg.base.pay_data_display[2024] = {
		limit_group = 0,
		name = "キューブ補給パック③",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "キューブ補給パック③",
		package_sort_id = 0,
		tip = "",
		tip_open = 0,
		money = 1100,
		cash_show = 0,
		descrip = "キューブ30個を入手可能",
		name_display = "キューブ補給パック③",
		gem = 0,
		limit_arg = 2,
		limit_type = 2,
		package_tag = "",
		picture = "mofangzhiyuan3",
		id_str = "com.bilibili.blhx.libao115",
		extra_gem = 0,
		id = 2024,
		airijp_id = "com.yostarjp.azurlane.package115",
		first_icon = "",
		first_text = "",
		tag = 2,
		akashi_pick = 1,
		sub_display = "",
		skin_inquire_relation = 0,
		first_pay_double = 0,
		extra_service = 3,
		show_group = "",
		package_tag_open = 0,
		extra_service_item = {
			{
				2,
				20001,
				30
			}
		},
		time = {
			{
				{
					2024,
					1,
					18
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					2,
					21
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				20001,
				30
			}
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40033,
				1
			}
		}
	}
	pg.base.pay_data_display[2025] = {
		limit_group = 0,
		name = "お得パック(デイリー)",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 6,
		subject = "お得パック(デイリー)",
		package_sort_id = 0,
		tip = "",
		tip_open = 0,
		money = 120,
		cash_show = 0,
		descrip = "購入するとキューブ1個、燃料1200を入手可能",
		name_display = "お得パック(デイリー)",
		gem = 0,
		limit_arg = 1,
		limit_type = 4,
		package_tag = "",
		picture = "richang",
		id_str = "com.bilibili.blhx.libao116",
		extra_gem = 0,
		id = 2025,
		airijp_id = "com.yostarjp.azurlane.package116",
		first_icon = "",
		first_text = "",
		tag = 2,
		akashi_pick = 1,
		time = "always",
		skin_inquire_relation = 0,
		first_pay_double = 0,
		extra_service = 3,
		show_group = "",
		package_tag_open = 0,
		extra_service_item = {
			{
				1,
				2,
				1200
			},
			{
				2,
				20001,
				1
			}
		},
		display = {
			{
				1,
				2,
				1200
			},
			{
				2,
				20001,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40043,
				1
			}
		}
	}
	pg.base.pay_data_display[2026] = {
		limit_group = 0,
		name = "教科書パック ",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		id = 2026,
		subject = "教科書パック",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 480,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "購入すると教科書を大量に入手可能",
		limit_type = 2,
		name_display = "教科書パック ",
		type_order = 0,
		package_tag = "",
		picture = "boxSkill",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.libao118",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 4,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.package118",
		extra_service_item = {
			{
				2,
				16004,
				1
			},
			{
				2,
				16014,
				1
			},
			{
				2,
				16024,
				1
			},
			{
				2,
				16003,
				3
			},
			{
				2,
				16013,
				3
			},
			{
				2,
				16023,
				3
			}
		},
		time = {
			{
				{
					2024,
					4,
					25
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					11,
					6
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				16004,
				1
			},
			{
				2,
				16014,
				1
			},
			{
				2,
				16024,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40023,
				1
			}
		}
	}
	pg.base.pay_data_display[2027] = {
		limit_group = 4,
		name = "PR特別計画艦パック·Ⅳ期",
		descrip_extra = "此处不会被看到",
		type = 0,
		second_text = "+強化ユニット",
		id = 2027,
		subject = "PR特別計画艦パック・Ⅳ期",
		first_text = "特別計画艦",
		package_sort_id = 3,
		tip = "",
		money = 2000,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "特別計画艦・Ⅳ期と交換できるアイテムなどを入手できます",
		name_display = "PR特別計画艦パック·Ⅳ期",
		limit_type = 3,
		time = "always",
		akashi_pick = 1,
		package_tag = "",
		picture = "tech4_display",
		type_order = 0,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "tech",
		limit_arg = 0,
		package_tag_open = 0,
		airijp_id = "",
		extra_service_item = {
			{
				2,
				40139,
				1
			},
			{
				2,
				42030,
				343
			}
		},
		display = {
			{
				2,
				42030,
				343
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {
			{
				"level",
				30
			}
		},
		drop_item = {},
		first_icon = {
			{
				2,
				40139,
				1
			}
		}
	}
	pg.base.pay_data_display[2028] = {
		limit_group = 4,
		name = "PR艦船Ⅳ期交換アイテム＋強化ユニットセット",
		descrip_extra = "*既にPR艦船・Ⅳ期をすべて所持している場合、使用時にアイテムに変換されます（アイコンタップで確認）",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "PR艦船Ⅳ期交換アイテム＋強化ユニットセット",
		package_sort_id = 3,
		tip = "",
		tip_open = 0,
		money = 2000,
		cash_show = 0,
		descrip = "内容",
		name_display = "PR艦船Ⅳ期交換アイテム\n＋強化ユニットセット",
		gem = 0,
		limit_arg = 1,
		limit_type = 3,
		package_tag = "",
		picture = "tech4_promotion",
		id_str = "com.bilibili.blhx.keyan10",
		extra_gem = 0,
		id = 2028,
		airijp_id = "com.yostarjp.azurlane.tech10",
		first_icon = "",
		first_text = "",
		tag = 2,
		akashi_pick = 1,
		time = "always",
		skin_inquire_relation = 0,
		first_pay_double = 0,
		extra_service = 3,
		show_group = "tech",
		package_tag_open = 0,
		extra_service_item = {
			{
				2,
				40139,
				1
			},
			{
				2,
				42030,
				343
			}
		},
		display = {
			{
				2,
				40139,
				1
			},
			{
				2,
				42030,
				343
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {
			{
				"level",
				30
			}
		},
		drop_item = {
			{
				2,
				40044,
				1
			}
		}
	}
	pg.base.pay_data_display[2029] = {
		limit_group = 4,
		name = "PR艦船Ⅳ期交換アイテム",
		descrip_extra = "*既にPR艦船・Ⅳ期をすべて所持している場合、使用時にアイテムに変換されます（アイコンタップで確認）",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "PR艦船Ⅳ期交換アイテム",
		package_sort_id = 3,
		tip = "",
		tip_open = 0,
		money = 1200,
		cash_show = 0,
		descrip = "内容",
		name_display = "PR艦船Ⅳ期交換アイテム",
		gem = 0,
		limit_arg = 2,
		limit_type = 3,
		package_tag = "",
		picture = "tech4_normal",
		id_str = "com.bilibili.blhx.keyan11",
		extra_gem = 0,
		id = 2029,
		airijp_id = "com.yostarjp.azurlane.tech11",
		first_icon = "",
		first_text = "",
		tag = 2,
		akashi_pick = 1,
		time = "always",
		skin_inquire_relation = 0,
		first_pay_double = 0,
		extra_service = 3,
		show_group = "tech",
		package_tag_open = 0,
		extra_service_item = {
			{
				2,
				40139,
				1
			}
		},
		display = {
			{
				2,
				40139,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {
			{
				"level",
				30
			}
		},
		drop_item = {
			{
				2,
				40045,
				1
			}
		}
	}
	pg.base.pay_data_display[2030] = {
		limit_group = 4,
		name = "PR特別計画艦Ⅳ期強化ユニットセット",
		descrip_extra = "購入すると指向型強化ユニット・Ⅳ期×343個を入手可能",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "強化ユニット",
		package_sort_id = 3,
		tip = "",
		tip_open = 0,
		money = 1000,
		cash_show = 0,
		descrip = "内容",
		name_display = "強化ユニット",
		gem = 0,
		limit_arg = 3,
		limit_type = 3,
		package_tag = "",
		picture = "tech4_promotion",
		id_str = "com.bilibili.blhx.keyan12",
		extra_gem = 0,
		id = 2030,
		airijp_id = "com.yostarjp.azurlane.tech12",
		first_icon = "",
		first_text = "",
		tag = 2,
		akashi_pick = 1,
		time = "always",
		skin_inquire_relation = 0,
		first_pay_double = 0,
		extra_service = 3,
		show_group = "tech",
		package_tag_open = 0,
		extra_service_item = {
			{
				2,
				42030,
				343
			}
		},
		display = {
			{
				2,
				42030,
				343
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {
			{
				"level",
				30
			}
		},
		drop_item = {
			{
				2,
				40046,
				1
			}
		}
	}
	pg.base.pay_data_display[2031] = {
		limit_group = 0,
		name = "選べるUR着せ替え福袋②",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "選べるUR着せ替え福袋②",
		package_sort_id = 0,
		tip = "",
		tip_open = 0,
		money = 2600,
		cash_show = 0,
		descrip = "選べる着せ替えチケット、キューブ、経験値パックT2などを入手可能",
		name_display = "選べるUR着せ替え福袋②",
		gem = 0,
		limit_arg = 1,
		limit_type = 2,
		package_tag = "お得 ",
		picture = "daofeng_package",
		id_str = "com.bilibili.blhx.libao119",
		extra_gem = 0,
		id = 2031,
		airijp_id = "com.yostarjp.azurlane.package119",
		first_icon = "",
		first_text = "",
		tag = 2,
		akashi_pick = 1,
		sub_display = "",
		skin_inquire_relation = 0,
		first_pay_double = 0,
		extra_service = 3,
		show_group = "",
		package_tag_open = 1,
		extra_service_item = {
			{
				2,
				59553,
				1
			},
			{
				2,
				20001,
				40
			},
			{
				1,
				1,
				30000
			},
			{
				2,
				16502,
				50
			}
		},
		time = {
			{
				{
					2024,
					7,
					18
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					8,
					14
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				59553,
				1
			},
			{
				2,
				20001,
				40
			},
			{
				2,
				16502,
				50
			}
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40047,
				1
			}
		}
	}
	pg.base.pay_data_display[2032] = {
		limit_group = 101,
		name = "戦闘UI・レインボー",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		id = 2032,
		subject = "戦闘UI・レインボー",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1600,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "戦闘UIテーマ・レインボーを入手できます",
		limit_type = 5,
		name_display = "戦闘UI・レインボー",
		type_order = 4,
		package_tag = "",
		picture = "ui1",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "uigift",
		limit_arg = 0,
		package_tag_open = 0,
		airijp_id = "",
		extra_service_item = {
			{
				31,
				103,
				1
			}
		},
		time = {
			{
				{
					2024,
					9,
					12
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					10,
					2
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				31,
				103,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[2033] = {
		limit_group = 101,
		name = "戦闘UI・レインボー（単品）",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		id = 2033,
		subject = "戦闘UI・レインボー（単品）",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1600,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "戦闘UIテーマ・レインボーを入手できます",
		limit_type = 5,
		name_display = "戦闘UI・レインボー（単品）",
		type_order = 4,
		package_tag = "",
		picture = "ui1",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.ui1",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "uigift",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.ui1",
		extra_service_item = {
			{
				31,
				103,
				1
			}
		},
		time = {
			{
				{
					2024,
					9,
					12
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					10,
					2
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				31,
				103,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40048,
				1
			}
		}
	}
	pg.base.pay_data_display[2034] = {
		limit_group = 101,
		name = "戦闘UI・レインボー（セット）",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		id = 2034,
		subject = "戦闘UI・レインボー（セット）",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 4700,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "戦闘UIテーマ・レインボー,ダイヤ×3060を入手できます",
		limit_type = 5,
		name_display = "戦闘UI・レインボー（セット）",
		type_order = 4,
		package_tag = "",
		picture = "ui1",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.ui2",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "uigift",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.ui2",
		extra_service_item = {
			{
				31,
				103,
				1
			},
			{
				1,
				14,
				3060
			}
		},
		time = {
			{
				{
					2024,
					9,
					12
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					10,
					2
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				31,
				103,
				1
			},
			{
				1,
				14,
				3060
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40049,
				1
			}
		}
	}
	pg.base.pay_data_display[2035] = {
		limit_group = 0,
		name = "選べるUR着せ替え福袋③",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 5,
		subject = "選べるUR着せ替え福袋③",
		package_sort_id = 0,
		tip = "",
		tip_open = 0,
		money = 2600,
		cash_show = 0,
		descrip = "選べる着せ替えチケット、キューブ、経験値パックT2などを入手可能",
		name_display = "選べるUR着せ替え福袋③",
		gem = 0,
		limit_arg = 1,
		limit_type = 2,
		package_tag = "",
		picture = "huteng_package",
		id_str = "com.bilibili.blhx.libao120",
		extra_gem = 0,
		id = 2035,
		airijp_id = "com.yostarjp.azurlane.package120",
		first_icon = "",
		first_text = "",
		tag = 2,
		akashi_pick = 1,
		sub_display = "",
		skin_inquire_relation = 0,
		first_pay_double = 0,
		extra_service = 3,
		show_group = "",
		package_tag_open = 0,
		extra_service_item = {
			{
				2,
				59554,
				1
			},
			{
				2,
				20001,
				40
			},
			{
				1,
				1,
				30000
			},
			{
				2,
				16502,
				50
			}
		},
		time = {
			{
				{
					2024,
					10,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					11,
					13
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				59554,
				1
			},
			{
				2,
				20001,
				40
			},
			{
				2,
				16502,
				50
			}
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40050,
				1
			}
		}
	}
	pg.base.pay_data_display[2036] = {
		limit_group = 0,
		name = "教科書パック",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		id = 2036,
		subject = "教科書パック",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 480,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "購入すると教科書を大量に入手可能",
		limit_type = 2,
		name_display = "教科書パック",
		type_order = 0,
		package_tag = "",
		picture = "boxSkill",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.libao121",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 4,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.package121",
		extra_service_item = {
			{
				2,
				16004,
				1
			},
			{
				2,
				16014,
				1
			},
			{
				2,
				16024,
				1
			},
			{
				2,
				16003,
				3
			},
			{
				2,
				16013,
				3
			},
			{
				2,
				16023,
				3
			}
		},
		time = {
			{
				{
					2024,
					11,
					21
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					4,
					16
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				16004,
				1
			},
			{
				2,
				16014,
				1
			},
			{
				2,
				16024,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40023,
				1
			}
		}
	}
	pg.base.pay_data_display[2037] = {
		limit_group = 102,
		name = "戦闘UI・クリスマス",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		id = 2037,
		subject = "戦闘UI・クリスマス",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1600,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "戦闘UI・クリスマスを入手できます",
		limit_type = 5,
		name_display = "戦闘UI・クリスマス",
		type_order = 4,
		package_tag = "",
		picture = "ui2",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "uigift",
		limit_arg = 0,
		package_tag_open = 0,
		airijp_id = "",
		extra_service_item = {
			{
				31,
				201,
				1
			}
		},
		time = {
			{
				{
					2024,
					12,
					19
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					1,
					1
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				31,
				201,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[2038] = {
		limit_group = 102,
		name = "戦闘UI・クリスマス（単品）",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		id = 2038,
		subject = "戦闘UI・クリスマス（単品）",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1600,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "戦闘UI・クリスマスを入手できます",
		limit_type = 5,
		name_display = "戦闘UI・クリスマス（単品）",
		type_order = 4,
		package_tag = "",
		picture = "ui2",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.ui4",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "uigift",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.ui4",
		extra_service_item = {
			{
				31,
				201,
				1
			}
		},
		time = {
			{
				{
					2024,
					12,
					19
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					1,
					1
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				31,
				201,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40051,
				1
			}
		}
	}
	pg.base.pay_data_display[2039] = {
		limit_group = 102,
		name = "戦闘UI・クリスマス（セット）",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		id = 2039,
		subject = "戦闘UI・クリスマス（セット）",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 4700,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "戦闘UI・クリスマス,ダイヤ×3060を入手できます",
		limit_type = 5,
		name_display = "戦闘UI・クリスマス（セット）",
		type_order = 4,
		package_tag = "",
		picture = "ui2",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.ui5",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "uigift",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.ui5",
		extra_service_item = {
			{
				31,
				201,
				1
			},
			{
				1,
				14,
				3060
			}
		},
		time = {
			{
				{
					2024,
					12,
					19
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					1,
					1
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				31,
				201,
				1
			},
			{
				1,
				14,
				3060
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40052,
				1
			}
		}
	}
	pg.base.pay_data_display[2040] = {
		limit_group = 0,
		name = "冬のお得福袋・2025",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		id = 2040,
		subject = "冬のお得福袋・2025",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 5280,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "ダイヤ3880個、特装型ブリMkⅢなどを入手可能",
		limit_type = 2,
		name_display = "冬のお得福袋・2025",
		type_order = 4,
		package_tag = "",
		picture = "dongzhi3",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.libao122",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.package122",
		extra_service_item = {
			{
				1,
				14,
				3880
			},
			{
				4,
				100021,
				1
			},
			{
				4,
				100011,
				2
			},
			{
				2,
				15012,
				150
			},
			{
				2,
				16502,
				60
			},
			{
				2,
				30113,
				150
			}
		},
		time = {
			{
				{
					2025,
					1,
					9
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					1,
					15
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				1,
				14,
				3880
			},
			{
				4,
				100021,
				1
			},
			{
				4,
				100011,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40053,
				1
			}
		}
	}
	pg.base.pay_data_display[2041] = {
		limit_group = 0,
		name = "選べるUR着せ替え福袋D",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 5,
		subject = "選べるUR着せ替え福袋D",
		package_sort_id = 0,
		tip = "",
		tip_open = 0,
		money = 2600,
		cash_show = 0,
		descrip = "選べる着せ替えチケット、キューブ、経験値パックT2などを入手可能",
		name_display = "選べるUR着せ替え福袋D",
		gem = 0,
		limit_arg = 1,
		limit_type = 2,
		package_tag = "お得 ",
		picture = "huteng_package",
		id_str = "com.bilibili.blhx.libao123",
		extra_gem = 0,
		id = 2041,
		airijp_id = "com.yostarjp.azurlane.package123",
		first_icon = "",
		first_text = "",
		tag = 2,
		akashi_pick = 1,
		sub_display = "",
		skin_inquire_relation = 0,
		first_pay_double = 0,
		extra_service = 3,
		show_group = "",
		package_tag_open = 1,
		extra_service_item = {
			{
				2,
				59561,
				1
			},
			{
				2,
				20001,
				40
			},
			{
				1,
				1,
				30000
			},
			{
				2,
				16502,
				50
			}
		},
		time = {
			{
				{
					2025,
					1,
					9
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					1,
					15
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				59561,
				1
			},
			{
				2,
				20001,
				40
			},
			{
				2,
				16502,
				50
			}
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40050,
				1
			}
		}
	}
	pg.base.pay_data_display[2042] = {
		limit_group = 103,
		name = "戦闘UI・ファラオ",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		id = 2042,
		subject = "戦闘UI・ファラオ",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1600,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "戦闘UI・ファラオを入手できます",
		limit_type = 5,
		name_display = "戦闘UI・ファラオ",
		type_order = 4,
		package_tag = "",
		picture = "ui3",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "uigift",
		limit_arg = 0,
		package_tag_open = 0,
		airijp_id = "",
		extra_service_item = {
			{
				31,
				202,
				1
			}
		},
		time = {
			{
				{
					2025,
					2,
					27
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					3,
					12
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				31,
				202,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[2043] = {
		limit_group = 103,
		name = "戦闘UI・ファラオ（単品）",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		id = 2043,
		subject = "戦闘UI・ファラオ（単品）",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1600,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "戦闘UI・ファラオを入手できます",
		limit_type = 5,
		name_display = "戦闘UI・ファラオ（単品）",
		type_order = 4,
		package_tag = "",
		picture = "ui3",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.ui7",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "uigift",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.ui7",
		extra_service_item = {
			{
				31,
				202,
				1
			}
		},
		time = {
			{
				{
					2025,
					2,
					27
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					3,
					12
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				31,
				202,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40055,
				1
			}
		}
	}
	pg.base.pay_data_display[2044] = {
		limit_group = 103,
		name = "戦闘UI・ファラオ（セット）",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		id = 2044,
		subject = "戦闘UI・ファラオ（セット）",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 4700,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "戦闘UI・ファラオ,ダイヤ×3060を入手できます",
		limit_type = 5,
		name_display = "戦闘UI・ファラオ（セット）",
		type_order = 4,
		package_tag = "",
		picture = "ui3",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.ui8",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "uigift",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.ui8",
		extra_service_item = {
			{
				31,
				202,
				1
			},
			{
				1,
				14,
				3060
			}
		},
		time = {
			{
				{
					2025,
					2,
					27
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					3,
					12
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				31,
				202,
				1
			},
			{
				1,
				14,
				3060
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40056,
				1
			}
		}
	}
	pg.base.pay_data_display[2045] = {
		limit_group = 104,
		name = "戦闘UI・ジーン",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		id = 2045,
		subject = "戦闘UI・ジーン",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1600,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "戦闘UI・ジーンを入手できます",
		limit_type = 5,
		name_display = "戦闘UI・ジーン",
		type_order = 4,
		package_tag = "",
		picture = "ui4",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "uigift",
		limit_arg = 0,
		package_tag_open = 0,
		airijp_id = "",
		extra_service_item = {
			{
				31,
				203,
				1
			}
		},
		time = {
			{
				{
					2025,
					3,
					27
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					4,
					9
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				31,
				203,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[2046] = {
		limit_group = 104,
		name = "戦闘UI・ジーン（単品）",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		id = 2046,
		subject = "戦闘UI・ジーン（単品）",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1600,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "戦闘UI・ジーンを入手できます",
		limit_type = 5,
		name_display = "戦闘UI・ジーン（単品）",
		type_order = 4,
		package_tag = "",
		picture = "ui4",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.ui10",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "uigift",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.ui10",
		extra_service_item = {
			{
				31,
				203,
				1
			}
		},
		time = {
			{
				{
					2025,
					3,
					27
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					4,
					9
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				31,
				203,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40057,
				1
			}
		}
	}
	pg.base.pay_data_display[2047] = {
		limit_group = 104,
		name = "戦闘UI・ジーン（セット）",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		id = 2047,
		subject = "戦闘UI・ジーン（セット）",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 4700,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "戦闘UI・ジーン,ダイヤ×3060を入手できます",
		limit_type = 5,
		name_display = "戦闘UI・ジーン（セット）",
		type_order = 4,
		package_tag = "",
		picture = "ui4",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.ui11",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "uigift",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.ui11",
		extra_service_item = {
			{
				31,
				203,
				1
			},
			{
				1,
				14,
				3060
			}
		},
		time = {
			{
				{
					2025,
					3,
					27
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					4,
					9
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				31,
				203,
				1
			},
			{
				1,
				14,
				3060
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40058,
				1
			}
		}
	}
	pg.base.pay_data_display[2048] = {
		limit_group = 0,
		name = "選べるUR着せ替え福袋E",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 5,
		subject = "選べるUR着せ替え福袋E",
		package_sort_id = 0,
		tip = "",
		tip_open = 0,
		money = 2600,
		cash_show = 0,
		descrip = "選べる着せ替えチケット、キューブ、経験値パックT2などを入手可能",
		name_display = "選べるUR着せ替え福袋E",
		gem = 0,
		limit_arg = 1,
		limit_type = 2,
		package_tag = "お得 ",
		picture = "huteng_package",
		id_str = "com.bilibili.blhx.libao124",
		extra_gem = 0,
		id = 2048,
		airijp_id = "com.yostarjp.azurlane.package124",
		first_icon = "",
		first_text = "",
		tag = 2,
		akashi_pick = 1,
		sub_display = "",
		skin_inquire_relation = 0,
		first_pay_double = 0,
		extra_service = 3,
		show_group = "",
		package_tag_open = 1,
		extra_service_item = {
			{
				2,
				59564,
				1
			},
			{
				2,
				20001,
				40
			},
			{
				1,
				1,
				30000
			},
			{
				2,
				16502,
				50
			}
		},
		time = {
			{
				{
					2025,
					4,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					4,
					23
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				59564,
				1
			},
			{
				2,
				20001,
				40
			},
			{
				2,
				16502,
				50
			}
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40059,
				1
			}
		}
	}
	pg.base.pay_data_display[2049] = {
		limit_group = 0,
		name = "教科書パック",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		id = 2049,
		subject = "教科書パック",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 480,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "購入すると教科書を大量に入手可能",
		limit_type = 2,
		name_display = "教科書パック",
		type_order = 0,
		package_tag = "",
		picture = "boxSkill",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.libao125",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 4,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.package125",
		extra_service_item = {
			{
				2,
				16004,
				1
			},
			{
				2,
				16014,
				1
			},
			{
				2,
				16024,
				1
			},
			{
				2,
				16003,
				3
			},
			{
				2,
				16013,
				3
			},
			{
				2,
				16023,
				3
			}
		},
		time = {
			{
				{
					2025,
					4,
					24
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					11,
					12
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				16004,
				1
			},
			{
				2,
				16014,
				1
			},
			{
				2,
				16024,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40023,
				1
			}
		}
	}
	pg.base.pay_data_display[2050] = {
		limit_group = 105,
		name = "戦闘UI・シーサイド",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		id = 2050,
		subject = "戦闘UI・シーサイド",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1600,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "戦闘UI・シーサイドを入手できます",
		limit_type = 5,
		name_display = "戦闘UI・シーサイド",
		type_order = 4,
		package_tag = "",
		picture = "ui5",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "uigift",
		limit_arg = 0,
		package_tag_open = 0,
		airijp_id = "",
		extra_service_item = {
			{
				31,
				204,
				1
			}
		},
		time = {
			{
				{
					2025,
					5,
					20
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					6,
					11
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				31,
				204,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[2051] = {
		limit_group = 105,
		name = "戦闘UI・シーサイド（単品）",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		id = 2051,
		subject = "戦闘UI・シーサイド（単品）",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1600,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "戦闘UI・シーサイドを入手できます",
		limit_type = 5,
		name_display = "戦闘UI・シーサイド（単品）",
		type_order = 4,
		package_tag = "",
		picture = "ui5",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.ui13",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "uigift",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.ui13",
		extra_service_item = {
			{
				31,
				204,
				1
			},
			{
				1,
				1,
				1000
			}
		},
		time = {
			{
				{
					2025,
					5,
					20
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					6,
					11
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				31,
				204,
				1
			},
			{
				1,
				1,
				1000
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40060,
				1
			}
		}
	}
	pg.base.pay_data_display[2052] = {
		limit_group = 105,
		name = "戦闘UI・シーサイド（セット）",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		id = 2052,
		subject = "戦闘UI・シーサイド（セット）",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 4700,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "戦闘UI・シーサイド,ダイヤ×3060を入手できます",
		limit_type = 5,
		name_display = "戦闘UI・シーサイド（セット）",
		type_order = 4,
		package_tag = "",
		picture = "ui5",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.ui14",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "uigift",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.ui14",
		extra_service_item = {
			{
				31,
				204,
				1
			},
			{
				1,
				14,
				3060
			}
		},
		time = {
			{
				{
					2025,
					5,
					20
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					6,
					11
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				31,
				204,
				1
			},
			{
				1,
				14,
				3060
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40061,
				1
			}
		}
	}
	pg.base.pay_data_display[2053] = {
		limit_group = 5,
		name = "PR特別計画艦パック·Ⅴ期",
		descrip_extra = "此处不会被看到",
		type = 0,
		second_text = "+強化ユニット",
		id = 2053,
		subject = "PR特別計画艦パック・Ⅴ期",
		first_text = "特別計画艦",
		package_sort_id = 3,
		tip = "",
		money = 2000,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "特別計画艦・Ⅴ期と交換できるアイテムなどを入手できます",
		name_display = "PR特別計画艦パック·Ⅴ期",
		limit_type = 3,
		time = "always",
		akashi_pick = 1,
		package_tag = "",
		picture = "tech5_display",
		type_order = 0,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "tech",
		limit_arg = 0,
		package_tag_open = 0,
		airijp_id = "",
		extra_service_item = {
			{
				2,
				40140,
				1
			},
			{
				2,
				42040,
				343
			}
		},
		display = {
			{
				2,
				42040,
				343
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {
			{
				"level",
				30
			}
		},
		drop_item = {},
		first_icon = {
			{
				2,
				40140,
				1
			}
		}
	}
	pg.base.pay_data_display[2054] = {
		limit_group = 5,
		name = "PR艦船Ⅴ期交換アイテム＋強化ユニットセット",
		descrip_extra = "*既にPR艦船・Ⅴ期をすべて所持している場合、使用時にアイテムに変換されます（アイコンタップで確認）",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "PR艦船Ⅴ期交換アイテム＋強化ユニットセット",
		package_sort_id = 3,
		tip = "",
		tip_open = 0,
		money = 2000,
		cash_show = 0,
		descrip = "内容",
		name_display = "PR艦船Ⅴ期交換アイテム\n＋強化ユニットセット",
		gem = 0,
		limit_arg = 1,
		limit_type = 3,
		package_tag = "",
		picture = "tech5_promotion",
		id_str = "com.bilibili.blhx.keyan13",
		extra_gem = 0,
		id = 2054,
		airijp_id = "com.yostarjp.azurlane.tech13",
		first_icon = "",
		first_text = "",
		tag = 2,
		akashi_pick = 1,
		time = "always",
		skin_inquire_relation = 0,
		first_pay_double = 0,
		extra_service = 3,
		show_group = "tech",
		package_tag_open = 0,
		extra_service_item = {
			{
				2,
				40140,
				1
			},
			{
				2,
				42040,
				343
			}
		},
		display = {
			{
				2,
				40140,
				1
			},
			{
				2,
				42040,
				343
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {
			{
				"level",
				30
			}
		},
		drop_item = {
			{
				2,
				40062,
				1
			}
		}
	}
end)()
;(function()
	pg.base.pay_data_display[2055] = {
		limit_group = 5,
		name = "PR艦船Ⅴ期交換アイテム",
		descrip_extra = "*既にPR艦船・Ⅴ期をすべて所持している場合、使用時にアイテムに変換されます（アイコンタップで確認）",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "PR艦船Ⅴ期交換アイテム",
		package_sort_id = 3,
		tip = "",
		tip_open = 0,
		money = 1200,
		cash_show = 0,
		descrip = "内容",
		name_display = "PR艦船Ⅴ期交換アイテム",
		gem = 0,
		limit_arg = 2,
		limit_type = 3,
		package_tag = "",
		picture = "tech5_normal",
		id_str = "com.bilibili.blhx.keyan14",
		extra_gem = 0,
		id = 2055,
		airijp_id = "com.yostarjp.azurlane.tech14",
		first_icon = "",
		first_text = "",
		tag = 2,
		akashi_pick = 1,
		time = "always",
		skin_inquire_relation = 0,
		first_pay_double = 0,
		extra_service = 3,
		show_group = "tech",
		package_tag_open = 0,
		extra_service_item = {
			{
				2,
				40140,
				1
			}
		},
		display = {
			{
				2,
				40140,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {
			{
				"level",
				30
			}
		},
		drop_item = {
			{
				2,
				40063,
				1
			}
		}
	}
	pg.base.pay_data_display[2056] = {
		limit_group = 5,
		name = "PR特別計画艦Ⅴ期強化ユニットセット",
		descrip_extra = "購入すると指向型強化ユニット・Ⅴ期×343個を入手可能",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "強化ユニット",
		package_sort_id = 3,
		tip = "",
		tip_open = 0,
		money = 1000,
		cash_show = 0,
		descrip = "内容",
		name_display = "強化ユニット",
		gem = 0,
		limit_arg = 3,
		limit_type = 3,
		package_tag = "",
		picture = "tech5_promotion",
		id_str = "com.bilibili.blhx.keyan15",
		extra_gem = 0,
		id = 2056,
		airijp_id = "com.yostarjp.azurlane.tech15",
		first_icon = "",
		first_text = "",
		tag = 2,
		akashi_pick = 1,
		time = "always",
		skin_inquire_relation = 0,
		first_pay_double = 0,
		extra_service = 3,
		show_group = "tech",
		package_tag_open = 0,
		extra_service_item = {
			{
				2,
				42040,
				343
			}
		},
		display = {
			{
				2,
				42040,
				343
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {
			{
				"level",
				30
			}
		},
		drop_item = {
			{
				2,
				40064,
				1
			}
		}
	}
	pg.base.pay_data_display[2057] = {
		limit_group = 106,
		name = "戦闘UI・シノビ",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		id = 2057,
		subject = "戦闘UI・シノビ",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1600,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "戦闘UI・シノビを入手できます",
		limit_type = 5,
		name_display = "戦闘UI・シノビ",
		type_order = 4,
		package_tag = "",
		picture = "ui6",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "uigift",
		limit_arg = 0,
		package_tag_open = 0,
		airijp_id = "",
		extra_service_item = {
			{
				31,
				205,
				1
			}
		},
		time = {
			{
				{
					2025,
					9,
					12
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					10,
					2
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				31,
				205,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[2058] = {
		limit_group = 106,
		name = "戦闘UI・シノビ（単品）",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		id = 2058,
		subject = "戦闘UI・シノビ（単品）",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1600,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "戦闘UI・シノビを入手できます",
		limit_type = 5,
		name_display = "戦闘UI・シノビ（単品）",
		type_order = 4,
		package_tag = "",
		picture = "ui6",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.ui16",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "uigift",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.ui16",
		extra_service_item = {
			{
				31,
				205,
				1
			},
			{
				1,
				1,
				1000
			}
		},
		time = {
			{
				{
					2025,
					9,
					12
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					10,
					2
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				31,
				205,
				1
			},
			{
				1,
				1,
				1000
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40065,
				1
			}
		}
	}
	pg.base.pay_data_display[2059] = {
		limit_group = 106,
		name = "戦闘UI・シノビ（セット）",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		id = 2059,
		subject = "戦闘UI・シノビ（セット）",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 4700,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "戦闘UI・シノビ,ダイヤ×3060を入手できます",
		limit_type = 5,
		name_display = "戦闘UI・シノビ（セット）",
		type_order = 4,
		package_tag = "",
		picture = "ui6",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.ui17",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "uigift",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.ui17",
		extra_service_item = {
			{
				31,
				205,
				1
			},
			{
				1,
				14,
				3060
			}
		},
		time = {
			{
				{
					2025,
					9,
					12
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					10,
					2
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				31,
				205,
				1
			},
			{
				1,
				14,
				3060
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40066,
				1
			}
		}
	}
	pg.base.pay_data_display[2063] = {
		limit_group = 0,
		name = "選べるUR着せ替え福袋F",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 5,
		subject = "選べるUR着せ替え福袋F",
		package_sort_id = 0,
		tip = "",
		tip_open = 0,
		money = 2600,
		cash_show = 0,
		descrip = "選べる着せ替えチケット、キューブ、経験値パックT2などを入手可能",
		name_display = "選べるUR着せ替え福袋F",
		gem = 0,
		limit_arg = 1,
		limit_type = 2,
		package_tag = "お得 ",
		picture = "huteng_package",
		id_str = "com.bilibili.blhx.libao126",
		extra_gem = 0,
		id = 2063,
		airijp_id = "com.yostarjp.azurlane.package126",
		first_icon = "",
		first_text = "",
		tag = 2,
		akashi_pick = 1,
		sub_display = "",
		skin_inquire_relation = 0,
		first_pay_double = 0,
		extra_service = 3,
		show_group = "",
		package_tag_open = 1,
		extra_service_item = {
			{
				2,
				59565,
				1
			},
			{
				2,
				20001,
				40
			},
			{
				1,
				1,
				30000
			},
			{
				2,
				16502,
				50
			}
		},
		time = {
			{
				{
					2025,
					11,
					6
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					11,
					12
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				59565,
				1
			},
			{
				2,
				20001,
				40
			},
			{
				2,
				16502,
				50
			}
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40070,
				1
			}
		}
	}
	pg.base.pay_data_display[2064] = {
		limit_group = 0,
		name = "教科書パック",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		id = 2064,
		subject = "教科書パック",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 480,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "購入すると教科書を大量に入手可能",
		limit_type = 2,
		name_display = "教科書パック",
		type_order = 0,
		package_tag = "",
		picture = "boxSkill",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.libao127",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 4,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.package127",
		extra_service_item = {
			{
				2,
				16004,
				1
			},
			{
				2,
				16014,
				1
			},
			{
				2,
				16024,
				1
			},
			{
				2,
				16003,
				3
			},
			{
				2,
				16013,
				3
			},
			{
				2,
				16023,
				3
			}
		},
		time = {
			{
				{
					2025,
					11,
					20
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					4,
					15
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				16004,
				1
			},
			{
				2,
				16014,
				1
			},
			{
				2,
				16024,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40023,
				1
			}
		}
	}
	pg.base.pay_data_display[2068] = {
		limit_group = 107,
		name = "戦闘UI・メイドカフェ",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		id = 2068,
		subject = "戦闘UI・メイドカフェ",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1600,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "戦闘UI・メイドカフェを入手できます",
		limit_type = 5,
		name_display = "戦闘UI・メイドカフェ",
		type_order = 4,
		package_tag = "",
		picture = "ui7",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "uigift",
		limit_arg = 0,
		package_tag_open = 0,
		airijp_id = "",
		extra_service_item = {
			{
				31,
				206,
				1
			}
		},
		time = {
			{
				{
					2025,
					12,
					18
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					1,
					7
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				31,
				206,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[2069] = {
		limit_group = 107,
		name = "戦闘UI・メイドカフェ（単品）",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		id = 2069,
		subject = "戦闘UI・メイドカフェ（単品）",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1600,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "戦闘UI・メイドカフェを入手できます",
		limit_type = 5,
		name_display = "戦闘UI・メイドカフェ（単品）",
		type_order = 4,
		package_tag = "",
		picture = "ui7",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.ui19",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "uigift",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.ui19",
		extra_service_item = {
			{
				31,
				206,
				1
			},
			{
				1,
				1,
				1000
			}
		},
		time = {
			{
				{
					2025,
					12,
					18
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					1,
					7
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				31,
				206,
				1
			},
			{
				1,
				1,
				1000
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40074,
				1
			}
		}
	}
	pg.base.pay_data_display[2070] = {
		limit_group = 107,
		name = "戦闘UI・メイドカフェ（セット）",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		id = 2070,
		subject = "戦闘UI・メイドカフェ（セット）",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 4700,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "戦闘UI・メイドカフェ,ダイヤ×3060を入手できます",
		limit_type = 5,
		name_display = "戦闘UI・メイドカフェ（セット）",
		type_order = 4,
		package_tag = "",
		picture = "ui7",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.ui20",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "uigift",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.ui20",
		extra_service_item = {
			{
				31,
				206,
				1
			},
			{
				1,
				14,
				3060
			}
		},
		time = {
			{
				{
					2025,
					12,
					18
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					1,
					7
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				31,
				206,
				1
			},
			{
				1,
				14,
				3060
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40075,
				1
			}
		}
	}
	pg.base.pay_data_display[2071] = {
		limit_group = 0,
		name = "冬のお得福袋・2026",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		id = 2071,
		subject = "冬のお得福袋・2026",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 5280,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "ダイヤ3880個、特装型ブリMkⅢなどを入手可能",
		limit_type = 2,
		name_display = "冬のお得福袋・2026",
		type_order = 4,
		package_tag = "",
		picture = "dongzhi3",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.libao128",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.package128",
		extra_service_item = {
			{
				1,
				14,
				3880
			},
			{
				4,
				100021,
				1
			},
			{
				4,
				100011,
				2
			},
			{
				2,
				15012,
				150
			},
			{
				2,
				16502,
				60
			},
			{
				2,
				30113,
				150
			}
		},
		time = {
			{
				{
					2026,
					1,
					15
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					1,
					28
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				1,
				14,
				3880
			},
			{
				4,
				100021,
				1
			},
			{
				4,
				100011,
				2
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40076,
				1
			}
		}
	}
	pg.base.pay_data_display[2074] = {
		limit_group = 108,
		name = "戦闘UI・春色旅籠",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		id = 2074,
		subject = "戦闘UI・春色旅籠",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1600,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "戦闘UI・春色旅籠を入手できます",
		limit_type = 5,
		name_display = "戦闘UI・春色旅籠",
		type_order = 5,
		package_tag = "",
		picture = "ui8",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "uigift",
		limit_arg = 0,
		package_tag_open = 0,
		airijp_id = "",
		extra_service_item = {
			{
				31,
				207,
				1
			}
		},
		time = {
			{
				{
					2026,
					2,
					26
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					3,
					11
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				31,
				207,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[2075] = {
		limit_group = 108,
		name = "戦闘UI・春色旅籠（単品）",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		id = 2075,
		subject = "戦闘UI・春色旅籠（単品）",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1600,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "戦闘UI・春色旅籠を入手できます",
		limit_type = 5,
		name_display = "戦闘UI・春色旅籠（単品）",
		type_order = 5,
		package_tag = "",
		picture = "ui8",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.ui22",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "uigift",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.ui22",
		extra_service_item = {
			{
				31,
				207,
				1
			},
			{
				1,
				1,
				1000
			}
		},
		time = {
			{
				{
					2026,
					2,
					26
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					3,
					11
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				31,
				207,
				1
			},
			{
				1,
				1,
				1000
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40077,
				1
			}
		}
	}
	pg.base.pay_data_display[2076] = {
		limit_group = 108,
		name = "戦闘UI・春色旅籠（セット）",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		id = 2076,
		subject = "戦闘UI・春色旅籠（セット）",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 4700,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "戦闘UI・春色旅籠,ダイヤ×3060を入手できます",
		limit_type = 5,
		name_display = "戦闘UI・春色旅籠（セット）",
		type_order = 5,
		package_tag = "",
		picture = "ui8",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.ui23",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "uigift",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.ui23",
		extra_service_item = {
			{
				31,
				207,
				1
			},
			{
				1,
				14,
				3060
			}
		},
		time = {
			{
				{
					2026,
					2,
					26
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					3,
					11
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				31,
				207,
				1
			},
			{
				1,
				14,
				3060
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40078,
				1
			}
		}
	}
	pg.base.pay_data_display[2078] = {
		limit_group = 0,
		name = "教科書パック",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		id = 2078,
		subject = "教科書パック",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 480,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "購入すると教科書を大量に入手可能",
		limit_type = 2,
		name_display = "教科書パック",
		type_order = 0,
		package_tag = "",
		picture = "boxSkill",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.libao130",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 4,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.package130",
		extra_service_item = {
			{
				2,
				16004,
				1
			},
			{
				2,
				16014,
				1
			},
			{
				2,
				16024,
				1
			},
			{
				2,
				16003,
				3
			},
			{
				2,
				16013,
				3
			},
			{
				2,
				16023,
				3
			}
		},
		time = {
			{
				{
					2026,
					4,
					17
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					11,
					18
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				16004,
				1
			},
			{
				2,
				16014,
				1
			},
			{
				2,
				16024,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40023,
				1
			}
		}
	}
	pg.base.pay_data_display[2079] = {
		limit_group = 109,
		name = "戦闘UI・ゴールデンベイ",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		id = 2079,
		subject = "戦闘UI・ゴールデンベイ",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1600,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "戦闘UI・ゴールデンベイ",
		limit_type = 5,
		name_display = "戦闘UI・ゴールデンベイ",
		type_order = 4,
		package_tag = "",
		picture = "ui9",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "uigift",
		limit_arg = 0,
		package_tag_open = 0,
		airijp_id = "",
		extra_service_item = {
			{
				31,
				208,
				1
			}
		},
		time = {
			{
				{
					2026,
					5,
					20
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					6,
					11
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				31,
				208,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[2080] = {
		limit_group = 109,
		name = "戦闘UI・ゴールデンベイ（単品）",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		id = 2080,
		subject = "戦闘UI・ゴールデンベイ（単品）",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1600,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "戦闘UI・ゴールデンベイ、資金×1000を入手可能",
		limit_type = 5,
		name_display = "戦闘UI・ゴールデンベイ（単品）",
		type_order = 4,
		package_tag = "",
		picture = "ui9",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.ui25",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "uigift",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.ui25",
		extra_service_item = {
			{
				31,
				208,
				1
			},
			{
				1,
				1,
				1000
			}
		},
		time = {
			{
				{
					2026,
					5,
					20
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					6,
					11
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				31,
				208,
				1
			},
			{
				1,
				1,
				1000
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40080,
				1
			}
		}
	}
	pg.base.pay_data_display[2081] = {
		limit_group = 109,
		name = "戦闘UI・ゴールデンベイ（セット）",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		id = 2081,
		subject = "戦闘UI・ゴールデンベイ（セット）",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 4700,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "戦闘UI・ゴールデンベイ、ダイヤ×3060を入手可能",
		limit_type = 5,
		name_display = "戦闘UI・ゴールデンベイ（セット）",
		type_order = 4,
		package_tag = "",
		picture = "ui9",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.ui26",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "uigift",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.ui26",
		extra_service_item = {
			{
				31,
				208,
				1
			},
			{
				1,
				14,
				3060
			}
		},
		time = {
			{
				{
					2026,
					5,
					20
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					6,
					11
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				31,
				208,
				1
			},
			{
				1,
				14,
				3060
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40081,
				1
			}
		}
	}
	pg.base.pay_data_display[2085] = {
		limit_group = 110,
		name = "戦闘UI・ヨルハ",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		id = 2085,
		subject = "戦闘UI・ヨルハ",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1600,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "戦闘UI・ヨルハ",
		limit_type = 5,
		name_display = "戦闘UI・ヨルハ",
		type_order = 4,
		package_tag = "",
		picture = "ui10",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "uigift",
		limit_arg = 0,
		package_tag_open = 0,
		airijp_id = "",
		extra_service_item = {
			{
				31,
				209,
				1
			}
		},
		time = {
			{
				{
					2026,
					7,
					16
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					7,
					29
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				31,
				209,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[2086] = {
		limit_group = 110,
		name = "戦闘UI・ヨルハ（単品）",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		id = 2086,
		subject = "戦闘UI・ヨルハ（単品）",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1600,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "戦闘UI・ヨルハ、資金×1000を入手可能",
		limit_type = 5,
		name_display = "戦闘UI・ヨルハ（単品）",
		type_order = 4,
		package_tag = "",
		picture = "ui10",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.ui27",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "uigift",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.ui27",
		extra_service_item = {
			{
				31,
				209,
				1
			},
			{
				1,
				1,
				1000
			}
		},
		time = {
			{
				{
					2026,
					7,
					16
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					7,
					29
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				31,
				209,
				1
			},
			{
				1,
				1,
				1000
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40084,
				1
			}
		}
	}
	pg.base.pay_data_display[2087] = {
		limit_group = 110,
		name = "戦闘UI・ヨルハ（セット）",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		id = 2087,
		subject = "戦闘UI・ヨルハ（セット）",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 4700,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "戦闘UI・ヨルハ、ダイヤ×3060を入手可能",
		limit_type = 5,
		name_display = "戦闘UI・ヨルハ（セット）",
		type_order = 4,
		package_tag = "",
		picture = "ui10",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.ui28",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "uigift",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.ui28",
		extra_service_item = {
			{
				31,
				209,
				1
			},
			{
				1,
				14,
				3060
			}
		},
		time = {
			{
				{
					2026,
					7,
					16
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					7,
					29
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				31,
				209,
				1
			},
			{
				1,
				14,
				3060
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40085,
				1
			}
		}
	}
	pg.base.pay_data_display[2088] = {
		limit_group = 6,
		name = "PR特別計画艦パック・Ⅵ期",
		descrip_extra = "此处不会被看到",
		type = 0,
		second_text = "+強化ユニット",
		id = 2088,
		subject = "PR特別計画艦パック・Ⅵ期",
		first_text = "特別計画艦",
		package_sort_id = 3,
		tip = "",
		money = 2000,
		tip_open = 0,
		tag = 2,
		cash_show = 0,
		gem = 0,
		descrip = "特別計画艦・Ⅵ期と交換できるアイテムなどを入手できます",
		name_display = "PR特別計画艦パック·Ⅵ期",
		limit_type = 3,
		time = "always",
		akashi_pick = 1,
		package_tag = "",
		picture = "tech6_display",
		type_order = 0,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "tech",
		limit_arg = 0,
		package_tag_open = 0,
		airijp_id = "",
		extra_service_item = {
			{
				2,
				40145,
				1
			},
			{
				2,
				42050,
				343
			}
		},
		display = {
			{
				2,
				42050,
				343
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {
			{
				"level",
				30
			}
		},
		drop_item = {},
		first_icon = {
			{
				2,
				40145,
				1
			}
		}
	}
	pg.base.pay_data_display[2089] = {
		limit_group = 6,
		name = "PR艦船Ⅵ期交換アイテム＋強化ユニットセット",
		descrip_extra = "*既にPR艦船・Ⅵ期をすべて所持している場合、使用時にアイテムに変換されます（アイコンタップで確認）",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "PR艦船Ⅵ期交換アイテム＋強化ユニットセット",
		package_sort_id = 3,
		tip = "",
		tip_open = 0,
		money = 2000,
		cash_show = 0,
		descrip = "内容",
		name_display = "PR艦船Ⅵ期交換アイテム\n＋強化ユニットセット",
		gem = 0,
		limit_arg = 1,
		limit_type = 3,
		package_tag = "",
		picture = "tech6_promotion",
		id_str = "com.bilibili.blhx.keyan16",
		extra_gem = 0,
		id = 2089,
		airijp_id = "com.yostarjp.azurlane.tech16",
		first_icon = "",
		first_text = "",
		tag = 2,
		akashi_pick = 1,
		time = "always",
		skin_inquire_relation = 0,
		first_pay_double = 0,
		extra_service = 3,
		show_group = "tech",
		package_tag_open = 0,
		extra_service_item = {
			{
				2,
				40145,
				1
			},
			{
				2,
				42050,
				343
			}
		},
		display = {
			{
				2,
				40145,
				1
			},
			{
				2,
				42050,
				343
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {
			{
				"level",
				30
			}
		},
		drop_item = {
			{
				2,
				40086,
				1
			}
		}
	}
	pg.base.pay_data_display[2090] = {
		limit_group = 6,
		name = "PR艦船Ⅵ期交換アイテム",
		descrip_extra = "*既にPR艦船・Ⅵ期をすべて所持している場合、使用時にアイテムに変換されます（アイコンタップで確認）",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "PR艦船Ⅵ期交換アイテム",
		package_sort_id = 3,
		tip = "",
		tip_open = 0,
		money = 1200,
		cash_show = 0,
		descrip = "内容",
		name_display = "PR艦船Ⅵ期交換アイテム",
		gem = 0,
		limit_arg = 2,
		limit_type = 3,
		package_tag = "",
		picture = "tech6_normal",
		id_str = "com.bilibili.blhx.keyan17",
		extra_gem = 0,
		id = 2090,
		airijp_id = "com.yostarjp.azurlane.tech17",
		first_icon = "",
		first_text = "",
		tag = 2,
		akashi_pick = 1,
		time = "always",
		skin_inquire_relation = 0,
		first_pay_double = 0,
		extra_service = 3,
		show_group = "tech",
		package_tag_open = 0,
		extra_service_item = {
			{
				2,
				40145,
				1
			}
		},
		display = {
			{
				2,
				40145,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {
			{
				"level",
				30
			}
		},
		drop_item = {
			{
				2,
				40087,
				1
			}
		}
	}
	pg.base.pay_data_display[2091] = {
		limit_group = 6,
		name = "PR特別計画艦Ⅵ期強化ユニットセット",
		descrip_extra = "購入すると指向型強化ユニット・Ⅵ期×343個を入手可能",
		type = 0,
		second_text = "",
		type_order = 0,
		subject = "強化ユニット",
		package_sort_id = 3,
		tip = "",
		tip_open = 0,
		money = 1000,
		cash_show = 0,
		descrip = "内容",
		name_display = "強化ユニット",
		gem = 0,
		limit_arg = 3,
		limit_type = 3,
		package_tag = "",
		picture = "tech6_promotion",
		id_str = "com.bilibili.blhx.keyan18",
		extra_gem = 0,
		id = 2091,
		airijp_id = "com.yostarjp.azurlane.tech18",
		first_icon = "",
		first_text = "",
		tag = 2,
		akashi_pick = 1,
		time = "always",
		skin_inquire_relation = 0,
		first_pay_double = 0,
		extra_service = 3,
		show_group = "tech",
		package_tag_open = 0,
		extra_service_item = {
			{
				2,
				42050,
				343
			}
		},
		display = {
			{
				2,
				42050,
				343
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {
			{
				"level",
				30
			}
		},
		drop_item = {
			{
				2,
				40088,
				1
			}
		}
	}
	pg.base.pay_data_display[2093] = {
		limit_group = 111,
		name = "戦闘UI・ミスティック",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		id = 2093,
		subject = "戦闘UI・ミスティック",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1600,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "戦闘UI・ミスティック",
		limit_type = 5,
		name_display = "戦闘UI・ミスティック",
		type_order = 4,
		package_tag = "",
		picture = "ui11",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "uigift",
		limit_arg = 0,
		package_tag_open = 0,
		airijp_id = "",
		extra_service_item = {
			{
				31,
				210,
				1
			}
		},
		time = {
			{
				{
					2026,
					9,
					8
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					9,
					30
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				31,
				210,
				1
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	}
	pg.base.pay_data_display[2094] = {
		limit_group = 111,
		name = "戦闘UI・ミスティック（単品）",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		id = 2094,
		subject = "戦闘UI・ミスティック（単品）",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 1600,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "戦闘UI・ミスティック、資金×1000を入手可能",
		limit_type = 5,
		name_display = "戦闘UI・ミスティック（単品）",
		type_order = 4,
		package_tag = "",
		picture = "ui11",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.ui29",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "uigift",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.ui29",
		extra_service_item = {
			{
				31,
				210,
				1
			},
			{
				1,
				1,
				1000
			}
		},
		time = {
			{
				{
					2026,
					9,
					8
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					9,
					30
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				31,
				210,
				1
			},
			{
				1,
				1,
				1000
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40089,
				1
			}
		}
	}
	pg.base.pay_data_display[2095] = {
		limit_group = 111,
		name = "戦闘UI・ミスティック（セット）",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		id = 2095,
		subject = "戦闘UI・ミスティック（セット）",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 4700,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "戦闘UI・ミスティック、ダイヤ×3060を入手可能",
		limit_type = 5,
		name_display = "戦闘UI・ミスティック（セット）",
		type_order = 4,
		package_tag = "",
		picture = "ui11",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.ui30",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "uigift",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.ui30",
		extra_service_item = {
			{
				31,
				210,
				1
			},
			{
				1,
				14,
				3060
			}
		},
		time = {
			{
				{
					2026,
					9,
					8
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					9,
					30
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				31,
				210,
				1
			},
			{
				1,
				14,
				3060
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40090,
				1
			}
		}
	}
	pg.base.pay_data_display[5001] = {
		limit_group = 0,
		name = "お得デイリーパック①",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		id = 5001,
		subject = "お得デイリーパック①",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 120,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "ダイヤ×60と、上級指向型強化ユニット・五期目×2を入手可能",
		limit_type = 2,
		name_display = "お得デイリーパック①",
		type_order = 0,
		package_tag = "",
		picture = "pack_day1",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.libao201",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.package201",
		extra_service_item = {
			{
				2,
				42046,
				2
			},
			{
				1,
				14,
				60
			}
		},
		time = {
			{
				{
					2024,
					2,
					29
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					3,
					13
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42046,
				2
			},
			{
				1,
				14,
				60
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40990,
				1
			}
		}
	}
	pg.base.pay_data_display[5002] = {
		limit_group = 0,
		name = "お得デイリーパック②",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		id = 5002,
		subject = "お得デイリーパック②",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 120,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "ダイヤ×200を入手可能",
		limit_type = 2,
		name_display = "お得デイリーパック②",
		type_order = 0,
		package_tag = "",
		picture = "pack_day2",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.libao202",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.package202",
		extra_service_item = {
			{
				1,
				14,
				200
			}
		},
		time = {
			{
				{
					2024,
					3,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					3,
					13
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				1,
				14,
				200
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40991,
				1
			}
		}
	}
	pg.base.pay_data_display[5003] = {
		limit_group = 0,
		name = "お得デイリーパック③",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		id = 5003,
		subject = "お得デイリーパック③",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 120,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "SSR選択装備箱×1と、指向性強化パーツT4×5を入手可能",
		limit_type = 2,
		name_display = "お得デイリーパック③",
		type_order = 0,
		package_tag = "",
		picture = "pack_day3",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.libao203",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.package203",
		extra_service_item = {
			{
				2,
				30202,
				1
			},
			{
				2,
				30114,
				5
			}
		},
		time = {
			{
				{
					2024,
					3,
					2
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					3,
					13
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				30202,
				1
			},
			{
				2,
				30114,
				5
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40992,
				1
			}
		}
	}
	pg.base.pay_data_display[5004] = {
		limit_group = 0,
		name = "お得デイリーパック④",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		id = 5004,
		subject = "お得デイリーパック④",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 120,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "ダイヤ×60と、試作型ブリMkⅡを入手可能",
		limit_type = 2,
		name_display = "お得デイリーパック④",
		type_order = 0,
		package_tag = "",
		picture = "pack_day4",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.libao204",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.package204",
		extra_service_item = {
			{
				4,
				100011,
				1
			},
			{
				1,
				14,
				60
			}
		},
		time = {
			{
				{
					2024,
					3,
					3
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					3,
					13
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				4,
				100011,
				1
			},
			{
				1,
				14,
				60
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40993,
				1
			}
		}
	}
	pg.base.pay_data_display[5005] = {
		limit_group = 0,
		name = "お得デイリーパック⑤",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		id = 5005,
		subject = "お得デイリーパック⑤",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 120,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "艦船経験値パックT2×60を入手可能",
		limit_type = 2,
		name_display = "お得デイリーパック⑤",
		type_order = 0,
		package_tag = "",
		picture = "pack_day5",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.libao205",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.package205",
		extra_service_item = {
			{
				2,
				16502,
				60
			}
		},
		time = {
			{
				{
					2024,
					3,
					4
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					3,
					13
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				16502,
				60
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40994,
				1
			}
		}
	}
	pg.base.pay_data_display[5006] = {
		limit_group = 0,
		name = "お得デイリーパック⑥",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		id = 5006,
		subject = "お得デイリーパック⑥",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 120,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "キューブ×10と、高速建造材×5を入手可能",
		limit_type = 2,
		name_display = "お得デイリーパック⑥",
		type_order = 0,
		package_tag = "",
		picture = "pack_day6",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.libao206",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.package206",
		extra_service_item = {
			{
				2,
				20001,
				10
			},
			{
				2,
				15003,
				5
			}
		},
		time = {
			{
				{
					2024,
					3,
					5
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					3,
					13
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				20001,
				10
			},
			{
				2,
				15003,
				5
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40995,
				1
			}
		}
	}
	pg.base.pay_data_display[5007] = {
		limit_group = 0,
		name = "お得デイリーパック⑦",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		id = 5007,
		subject = "お得デイリーパック⑦",
		first_text = "",
		package_sort_id = 0,
		first_icon = "",
		money = 120,
		tip = "",
		tag = 2,
		tip_open = 0,
		gem = 0,
		cash_show = 0,
		descrip = "ダイヤ×60と、上級指向型強化ユニット・六期目×2を入手可能",
		limit_type = 2,
		name_display = "お得デイリーパック⑦",
		type_order = 0,
		package_tag = "",
		picture = "pack_day7",
		akashi_pick = 1,
		skin_inquire_relation = 0,
		extra_service = 3,
		id_str = "com.bilibili.blhx.libao207",
		first_pay_double = 0,
		extra_gem = 0,
		show_group = "",
		limit_arg = 1,
		package_tag_open = 0,
		airijp_id = "com.yostarjp.azurlane.package207",
		extra_service_item = {
			{
				2,
				42056,
				2
			},
			{
				1,
				14,
				60
			}
		},
		time = {
			{
				{
					2024,
					3,
					6
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2024,
					3,
					13
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42056,
				2
			},
			{
				1,
				14,
				60
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40996,
				1
			}
		}
	}
	pg.base.pay_data_display[5011] = {
		limit_group = 0,
		name = "お得デイリーパック2025A",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 5,
		subject = "お得デイリーパック2025A",
		package_sort_id = 0,
		tip = "",
		tip_open = 0,
		money = 120,
		cash_show = 0,
		descrip = "ダイヤ×60と、上級指向型強化ユニット・Ⅵ期目×2を入手可能",
		name_display = "お得デイリーパック2025A",
		gem = 0,
		limit_arg = 1,
		limit_type = 2,
		package_tag = "",
		picture = "pack_day1",
		id_str = "com.bilibili.blhx.libao211",
		extra_gem = 0,
		id = 5011,
		airijp_id = "com.yostarjp.azurlane.package211",
		first_icon = "",
		first_text = "",
		tag = 2,
		akashi_pick = 1,
		sub_display = "",
		skin_inquire_relation = 0,
		first_pay_double = 0,
		extra_service = 3,
		show_group = "",
		package_tag_open = 0,
		extra_service_item = {
			{
				2,
				42056,
				2
			},
			{
				1,
				14,
				60
			}
		},
		time = {
			{
				{
					2025,
					2,
					27
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					3,
					12
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42056,
				2
			},
			{
				1,
				14,
				60
			}
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81410,
				1
			}
		}
	}
	pg.base.pay_data_display[5012] = {
		limit_group = 0,
		name = "お得デイリーパック2025B",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 5,
		subject = "お得デイリーパック2025B",
		package_sort_id = 0,
		tip = "",
		tip_open = 0,
		money = 120,
		cash_show = 0,
		descrip = "ダイヤ×200を入手可能",
		name_display = "お得デイリーパック2025B",
		gem = 0,
		limit_arg = 1,
		limit_type = 2,
		package_tag = "",
		picture = "pack_day2",
		id_str = "com.bilibili.blhx.libao212",
		extra_gem = 0,
		id = 5012,
		airijp_id = "com.yostarjp.azurlane.package212",
		first_icon = "",
		first_text = "",
		tag = 2,
		akashi_pick = 1,
		sub_display = "",
		skin_inquire_relation = 0,
		first_pay_double = 0,
		extra_service = 3,
		show_group = "",
		package_tag_open = 0,
		extra_service_item = {
			{
				1,
				14,
				200
			}
		},
		time = {
			{
				{
					2025,
					2,
					28
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					3,
					12
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				1,
				14,
				200
			}
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81411,
				1
			}
		}
	}
	pg.base.pay_data_display[5013] = {
		limit_group = 0,
		name = "お得デイリーパック2025C",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 5,
		subject = "お得デイリーパック2025C",
		package_sort_id = 0,
		tip = "",
		tip_open = 0,
		money = 120,
		cash_show = 0,
		descrip = "指向性強化パーツT4×5、メンタルユニット×200を入手可能",
		name_display = "お得デイリーパック2025C",
		gem = 0,
		limit_arg = 1,
		limit_type = 2,
		package_tag = "",
		picture = "pack_day3",
		id_str = "com.bilibili.blhx.libao213",
		extra_gem = 0,
		id = 5013,
		airijp_id = "com.yostarjp.azurlane.package213",
		first_icon = "",
		first_text = "",
		tag = 2,
		akashi_pick = 1,
		sub_display = "",
		skin_inquire_relation = 0,
		first_pay_double = 0,
		extra_service = 3,
		show_group = "",
		package_tag_open = 0,
		extra_service_item = {
			{
				2,
				30114,
				5
			},
			{
				2,
				15008,
				200
			}
		},
		time = {
			{
				{
					2025,
					3,
					1
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					3,
					12
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				30114,
				5
			},
			{
				2,
				15008,
				200
			}
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81412,
				1
			}
		}
	}
	pg.base.pay_data_display[5014] = {
		limit_group = 0,
		name = "お得デイリーパック2025D",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 5,
		subject = "お得デイリーパック2025D",
		package_sort_id = 0,
		tip = "",
		tip_open = 0,
		money = 120,
		cash_show = 0,
		descrip = "ダイヤ×60と、試作型ブリMkⅡを入手可能",
		name_display = "お得デイリーパック2025D",
		gem = 0,
		limit_arg = 1,
		limit_type = 2,
		package_tag = "",
		picture = "pack_day4",
		id_str = "com.bilibili.blhx.libao214",
		extra_gem = 0,
		id = 5014,
		airijp_id = "com.yostarjp.azurlane.package214",
		first_icon = "",
		first_text = "",
		tag = 2,
		akashi_pick = 1,
		sub_display = "",
		skin_inquire_relation = 0,
		first_pay_double = 0,
		extra_service = 3,
		show_group = "",
		package_tag_open = 0,
		extra_service_item = {
			{
				4,
				100011,
				1
			},
			{
				1,
				14,
				60
			}
		},
		time = {
			{
				{
					2025,
					3,
					2
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					3,
					12
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				4,
				100011,
				1
			},
			{
				1,
				14,
				60
			}
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81413,
				1
			}
		}
	}
	pg.base.pay_data_display[5015] = {
		limit_group = 0,
		name = "お得デイリーパック2025E",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 5,
		subject = "お得デイリーパック2025E",
		package_sort_id = 0,
		tip = "",
		tip_open = 0,
		money = 120,
		cash_show = 0,
		descrip = "艦船経験値パックT2×60を入手可能",
		name_display = "お得デイリーパック2025E",
		gem = 0,
		limit_arg = 1,
		limit_type = 2,
		package_tag = "",
		picture = "pack_day5",
		id_str = "com.bilibili.blhx.libao215",
		extra_gem = 0,
		id = 5015,
		airijp_id = "com.yostarjp.azurlane.package215",
		first_icon = "",
		first_text = "",
		tag = 2,
		akashi_pick = 1,
		sub_display = "",
		skin_inquire_relation = 0,
		first_pay_double = 0,
		extra_service = 3,
		show_group = "",
		package_tag_open = 0,
		extra_service_item = {
			{
				2,
				16502,
				60
			}
		},
		time = {
			{
				{
					2025,
					3,
					3
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					3,
					12
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				16502,
				60
			}
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81414,
				1
			}
		}
	}
	pg.base.pay_data_display[5016] = {
		limit_group = 0,
		name = "お得デイリーパック2025F",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 5,
		subject = "お得デイリーパック2025F",
		package_sort_id = 0,
		tip = "",
		tip_open = 0,
		money = 120,
		cash_show = 0,
		descrip = "キューブ×10と、高速建造材×5を入手可能",
		name_display = "お得デイリーパック2025F",
		gem = 0,
		limit_arg = 1,
		limit_type = 2,
		package_tag = "",
		picture = "pack_day6",
		id_str = "com.bilibili.blhx.libao216",
		extra_gem = 0,
		id = 5016,
		airijp_id = "com.yostarjp.azurlane.package216",
		first_icon = "",
		first_text = "",
		tag = 2,
		akashi_pick = 1,
		sub_display = "",
		skin_inquire_relation = 0,
		first_pay_double = 0,
		extra_service = 3,
		show_group = "",
		package_tag_open = 0,
		extra_service_item = {
			{
				2,
				20001,
				10
			},
			{
				2,
				15003,
				5
			}
		},
		time = {
			{
				{
					2025,
					3,
					4
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					3,
					12
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				20001,
				10
			},
			{
				2,
				15003,
				5
			}
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81415,
				1
			}
		}
	}
	pg.base.pay_data_display[5017] = {
		limit_group = 0,
		name = "お得デイリーパック2025G",
		descrip_extra = "※購入したアイテムはメールボックスに送られます",
		type = 0,
		second_text = "",
		type_order = 5,
		subject = "お得デイリーパック2025G",
		package_sort_id = 0,
		tip = "",
		tip_open = 0,
		money = 120,
		cash_show = 0,
		descrip = "ダイヤ×60と、上級指向型強化ユニット・Ⅶ期目×2を入手可能",
		name_display = "お得デイリーパック2025G",
		gem = 0,
		limit_arg = 1,
		limit_type = 2,
		package_tag = "",
		picture = "pack_day7",
		id_str = "com.bilibili.blhx.libao217",
		extra_gem = 0,
		id = 5017,
		airijp_id = "com.yostarjp.azurlane.package217",
		first_icon = "",
		first_text = "",
		tag = 2,
		akashi_pick = 1,
		sub_display = "",
		skin_inquire_relation = 0,
		first_pay_double = 0,
		extra_service = 3,
		show_group = "",
		package_tag_open = 0,
		extra_service_item = {
			{
				2,
				42066,
				2
			},
			{
				1,
				14,
				60
			}
		},
		time = {
			{
				{
					2025,
					3,
					5
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2025,
					3,
					12
				},
				{
					23,
					59,
					59
				}
			}
		},
		display = {
			{
				2,
				42066,
				2
			},
			{
				1,
				14,
				60
			}
		},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				81416,
				1
			}
		}
	}
	pg.base.pay_data_display[70001] = {
		descrip_extra = "",
		name = "紅姫の肝試し遊戯",
		ignorePlatform = "",
		type = 0,
		second_text = "",
		limit_group = 0,
		subject = "紅姫の肝試し遊戯",
		type_order = 0,
		package_sort_id = 0,
		tip = "",
		money = 2580,
		tip_open = 0,
		cash_show = 4000,
		descrip = "紅姫の肝試し遊戯",
		gem = 0,
		name_display = "紅姫の肝試し遊戯",
		limit_arg = 1,
		limit_type = 2,
		package_tag = "",
		picture = "",
		id_str = "com.bilibili.blhx.skin1",
		extra_gem = 0,
		id = 70001,
		airijp_id = "com.yostarjp.azurlane.skin1",
		display = "",
		first_icon = "",
		first_text = "",
		tag = 0,
		akashi_pick = 1,
		sub_display = "",
		skin_inquire_relation = 0,
		first_pay_double = 0,
		extra_service = 6,
		show_group = "",
		package_tag_open = 0,
		extra_service_item = {
			{
				7,
				304091,
				1
			}
		},
		time = {
			{
				{
					2026,
					9,
					8
				},
				{
					0,
					0,
					0
				}
			},
			{
				{
					2026,
					9,
					30
				},
				{
					23,
					59,
					59
				}
			}
		},
		limit_args = {},
		drop_item = {}
	}
end)()
