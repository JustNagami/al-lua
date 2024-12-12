pg = pg or {}
pg.pay_data_display = setmetatable({
	__name = "pay_data_display",
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
		60,
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
		80,
		81,
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
		2012,
		2013,
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
	}
}, confHX)
pg.base = pg.base or {}
pg.base.pay_data_display = {
	{
		name = "贸易许可证（30日）",
		limit_group = 0,
		descrip_extra = "",
		type = 0,
		subject = "贸易许可证",
		limit_arg = 7,
		name_display = "贸易许可证（30日）",
		show_group = "",
		type_order = 0,
		extra_service = 2,
		money = 30,
		id = 1,
		tag = 2,
		gem = 500,
		limit_type = 1,
		time = "always",
		picture = "month",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi102",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "购买后立即获得$1钻,30日内每天获得资源",
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
		}
	},
	{
		name = "新手启航补给",
		limit_group = 0,
		descrip_extra = "",
		type = 0,
		subject = "新手起航补给",
		limit_arg = 1,
		name_display = "新手启航补给",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 1,
		id = 2,
		tag = 1,
		gem = 30,
		limit_type = 2,
		time = "always",
		picture = "boxNewplayer",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi101",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "购买礼包可获得建造及钻石资源",
		airijp_id = "com.yostarjp.azurlane.diamond101",
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
				2,
				15003,
				2
			},
			{
				2,
				20001,
				2
			},
			{
				1,
				4,
				30
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
	},
	{
		name = "几个钻石",
		limit_group = 0,
		descrip_extra = "",
		type = 0,
		subject = "钻石*60",
		limit_arg = 10,
		name_display = "几个钻石",
		show_group = "",
		type_order = 0,
		extra_service_item = "0",
		money = 6,
		extra_service = 0,
		tag = 0,
		id = 3,
		gem = 60,
		limit_type = 99,
		time = "always",
		picture = "1",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi1",
		first_pay_double = 1,
		extra_gem = 0,
		descrip = "额外赠送$1钻",
		airijp_id = "com.yostarjp.azurlane.diamond1",
		display = {},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	{
		name = "一小堆钻石",
		limit_group = 0,
		descrip_extra = "",
		type = 0,
		subject = "钻石*300",
		limit_arg = 10,
		name_display = "一小堆钻石",
		show_group = "",
		type_order = 0,
		extra_service_item = "0",
		money = 30,
		extra_service = 0,
		tag = 0,
		id = 4,
		gem = 300,
		limit_type = 99,
		time = "always",
		picture = "2",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi2",
		first_pay_double = 1,
		extra_gem = 30,
		descrip = "额外赠送$1钻",
		airijp_id = "com.yostarjp.azurlane.diamond2",
		display = {},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	{
		name = "一大袋钻石",
		limit_group = 0,
		descrip_extra = "",
		type = 0,
		subject = "钻石*980",
		limit_arg = 0,
		name_display = "一大袋钻石",
		show_group = "",
		type_order = 0,
		extra_service_item = "0",
		money = 98,
		extra_service = 0,
		tag = 0,
		id = 5,
		gem = 980,
		limit_type = 0,
		time = "always",
		picture = "3",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi3",
		first_pay_double = 1,
		extra_gem = 120,
		descrip = "额外赠送$1钻",
		airijp_id = "com.yostarjp.azurlane.diamond3",
		display = {},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	{
		name = "一小箱钻石",
		limit_group = 0,
		descrip_extra = "",
		type = 0,
		subject = "钻石*1980",
		limit_arg = 0,
		name_display = "一小箱钻石",
		show_group = "",
		type_order = 0,
		extra_service_item = "0",
		money = 198,
		extra_service = 0,
		tag = 0,
		id = 6,
		gem = 1980,
		limit_type = 0,
		time = "always",
		picture = "4",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi4",
		first_pay_double = 1,
		extra_gem = 300,
		descrip = "额外赠送$1钻",
		airijp_id = "com.yostarjp.azurlane.diamond4",
		display = {},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	{
		name = "一大箱钻石",
		limit_group = 0,
		descrip_extra = "",
		type = 0,
		subject = "钻石*3280",
		limit_arg = 0,
		name_display = "一大箱钻石",
		show_group = "",
		type_order = 0,
		extra_service_item = "0",
		money = 328,
		extra_service = 0,
		tag = 0,
		id = 7,
		gem = 3280,
		limit_type = 0,
		time = "always",
		picture = "5",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi5",
		first_pay_double = 1,
		extra_gem = 720,
		descrip = "额外赠送$1钻",
		airijp_id = "com.yostarjp.azurlane.diamond5",
		display = {},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	{
		name = "一整船钻石",
		limit_group = 0,
		descrip_extra = "",
		type = 0,
		subject = "钻石*6480",
		limit_arg = 0,
		name_display = "一整船钻石",
		show_group = "",
		type_order = 0,
		extra_service_item = "0",
		money = 648,
		extra_service = 0,
		tag = 1,
		id = 8,
		gem = 6480,
		limit_type = 0,
		time = "always",
		picture = "6",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi6",
		first_pay_double = 1,
		extra_gem = 2400,
		descrip = "额外赠送$1钻",
		airijp_id = "com.yostarjp.azurlane.diamond6",
		display = {},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {}
	},
	{
		name = "新年福袋",
		limit_group = 0,
		descrip_extra = "*福袋将发送到邮箱，请注意查收。已获得的衣装将自动置换成等价的钻石。",
		type = 1,
		subject = "新年福袋",
		limit_arg = 1,
		name_display = "新年福袋",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 198,
		id = 9,
		tag = 1,
		gem = 0,
		limit_type = 2,
		picture = "fudai",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi103",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色新年换装，3个外观装备箱，和大量其他奖励",
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
	},
	[11] = {
		name = "国庆福袋",
		limit_group = 0,
		descrip_extra = "*福袋将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则会转化为对应原价9折的钻石。",
		type = 1,
		subject = "国庆福袋",
		limit_arg = 1,
		name_display = "国庆福袋",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 198,
		id = 11,
		tag = 1,
		gem = 0,
		limit_type = 2,
		picture = "fudai",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi108",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2019钻，和大量其他奖励",
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
	},
	[12] = {
		name = "2019新年福袋",
		limit_group = 0,
		descrip_extra = "*福袋将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "2019新年福袋",
		limit_arg = 1,
		name_display = "2019新年福袋",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 198,
		id = 12,
		tag = 1,
		gem = 0,
		limit_type = 2,
		picture = "fudai",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi109",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2019钻，和大量其他奖励",
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
	},
	[13] = {
		name = "2019春节福袋",
		limit_group = 0,
		descrip_extra = "*福袋将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "2019春节福袋",
		limit_arg = 1,
		name_display = "2019春节福袋",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 198,
		id = 13,
		tag = 1,
		gem = 0,
		limit_type = 2,
		picture = "fudai",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi110",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2019钻，和大量其他奖励",
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
	},
	[14] = {
		name = "二周年礼盒",
		limit_group = 0,
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "二周年礼盒",
		limit_arg = 1,
		name_display = "二周年礼盒",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 198,
		id = 14,
		tag = 1,
		gem = 0,
		limit_type = 2,
		picture = "lihe2_l",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi111",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2019钻，和大量其他奖励",
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
	},
	[15] = {
		name = "2019国庆礼盒",
		limit_group = 0,
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "2019国庆礼盒",
		limit_arg = 1,
		name_display = "2019国庆礼盒",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 198,
		id = 15,
		tag = 1,
		gem = 0,
		limit_type = 2,
		picture = "lihe1_l",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi113",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2019钻，和大量其他奖励",
		airijp_id = "com.yostarjp.azurlane.diamond109",
		extra_service_item = {
			{
				2,
				69906,
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
				69906,
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
				40906,
				1
			}
		}
	},
	[16] = {
		name = "新年福袋2020",
		limit_group = 0,
		descrip_extra = "*福袋将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "新年福袋2020",
		limit_arg = 1,
		name_display = "新年福袋2020",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 198,
		id = 16,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "fudai1",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi118",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2020钻，和大量其他奖励",
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
	},
	[17] = {
		name = "新年福袋复刻(2019)",
		limit_group = 0,
		descrip_extra = "*福袋将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "新年福袋复刻(2019)",
		limit_arg = 1,
		name_display = "新年福袋复刻(2019)",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 198,
		id = 17,
		tag = 1,
		gem = 0,
		limit_type = 2,
		picture = "fudai",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi119",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2019钻，和大量其他奖励",
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
	},
	[18] = {
		name = "春节福袋2020",
		limit_group = 0,
		descrip_extra = "*福袋将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "春节福袋2020",
		limit_arg = 1,
		name_display = "春节福袋2020",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 198,
		id = 18,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "fudai2",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi120",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2020钻，和大量其他奖励",
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
	},
	[19] = {
		name = "春节福袋复刻(2019)",
		limit_group = 0,
		descrip_extra = "*福袋将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "春节福袋复刻(2019)",
		limit_arg = 1,
		name_display = "春节福袋复刻(2019)",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 198,
		id = 19,
		tag = 1,
		gem = 0,
		limit_type = 2,
		picture = "fudai",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi121",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2019钻，和大量其他奖励",
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
	},
	[20] = {
		name = "新晋指挥官支援包·I",
		limit_group = 0,
		descrip_extra = "*支援包将发送到邮箱，请注意查收。",
		type = 0,
		subject = "新晋指挥官支援包·I ",
		limit_arg = 1,
		name_display = "新晋指挥官支援包·I",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 18,
		id = 20,
		tag = 1,
		gem = 0,
		limit_type = 2,
		time = "always",
		picture = "support1",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.libao101",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得180钻，石油储备箱(1000)x2和其他奖励",
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
		}
	},
	[21] = {
		name = "新晋指挥官支援包·II",
		limit_group = 0,
		descrip_extra = "*支援包将发送到邮箱，请注意查收。",
		type = 0,
		subject = "新晋指挥官支援包·II ",
		limit_arg = 1,
		name_display = "新晋指挥官支援包·II",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 78,
		id = 21,
		tag = 1,
		gem = 0,
		limit_type = 2,
		time = "always",
		picture = "support2",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.libao102",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得780钻，定向装备箱·超稀有x2，石油储备箱(1000)x4和其他奖励",
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
		}
	},
	[22] = {
		name = "新晋指挥官支援包·III",
		limit_group = 0,
		descrip_extra = "*支援包将发送到邮箱，请注意查收。",
		type = 0,
		subject = "新晋指挥官支援包·III ",
		limit_arg = 1,
		name_display = "新晋指挥官支援包·III",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 168,
		id = 22,
		tag = 1,
		gem = 0,
		limit_type = 2,
		time = "always",
		picture = "support3",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.libao103",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得1680钻，定向装备箱·超稀有x4，石油储备箱(1000)x8和其他奖励",
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
		}
	},
	[23] = {
		name = "三周年礼盒",
		limit_group = 0,
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "三周年礼盒",
		limit_arg = 1,
		name_display = "三周年礼盒",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 198,
		id = 23,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "lihe4_l",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi122",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2020钻，和大量其他奖励",
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
	},
	[24] = {
		name = "2020国庆礼盒",
		limit_group = 0,
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "2020国庆礼盒",
		limit_arg = 1,
		name_display = "2020国庆礼盒",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 198,
		id = 24,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "lihe3_l",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi123",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2020钻，和大量其他奖励",
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
	},
	[25] = {
		name = "新年福袋2021",
		limit_group = 0,
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "新年福袋2021",
		limit_arg = 1,
		name_display = "新年福袋2021",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 198,
		id = 25,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "fudai3",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi124",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2021钻，和大量其他奖励",
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
	},
	[26] = {
		name = "新年福袋复刻(2020)",
		limit_group = 0,
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "新年福袋复刻(2020)",
		limit_arg = 1,
		name_display = "新年福袋复刻(2020)",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 198,
		id = 26,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "fudai1",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi125",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2020钻，和大量其他奖励",
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
	},
	[27] = {
		name = "春节福袋2021",
		limit_group = 0,
		descrip_extra = "*福袋将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "春节福袋2021",
		limit_arg = 1,
		name_display = "春节福袋2021",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 198,
		id = 27,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "fudai4",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi126",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2021钻，和大量其他奖励",
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
	},
	[28] = {
		name = "春节福袋复刻(2020)",
		limit_group = 0,
		descrip_extra = "*福袋将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "春节福袋复刻(2020)",
		limit_arg = 1,
		name_display = "春节福袋复刻(2020)",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 198,
		id = 28,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "fudai2",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi127",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2020钻，和大量其他奖励",
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
	},
	[29] = {
		name = "四周年礼盒",
		limit_group = 0,
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "四周年礼盒",
		limit_arg = 1,
		name_display = "四周年礼盒",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 198,
		id = 29,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "lihe5_l",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi128",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2021钻，和大量其他奖励",
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
	},
	[30] = {
		name = "三周年礼盒复刻",
		limit_group = 0,
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "三周年礼盒复刻",
		limit_arg = 1,
		name_display = "三周年礼盒复刻",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 198,
		id = 30,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "lihe4_l",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi129",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2020钻，和大量其他奖励",
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
	},
	[31] = {
		name = "大型作战攻略支援包",
		limit_group = 0,
		descrip_extra = "*支援包将发送到邮箱，请注意查收。",
		type = 1,
		subject = "大型作战攻略支援包",
		limit_arg = 1,
		name_display = "大型作战攻略支援包",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 198,
		id = 31,
		tag = 1,
		gem = 0,
		limit_type = 2,
		time = "always",
		picture = "support4",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi130",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得1980钻，定向部件T4x35，定向装备箱·研发装备①x1和其他奖励",
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
				1,
				14,
				1980
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
		}
	},
	[32] = {
		name = "2021国庆礼盒",
		limit_group = 0,
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "2021国庆礼盒",
		limit_arg = 1,
		name_display = "2021国庆礼盒",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 198,
		id = 32,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "lihe6_l",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi131",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2021钻，和大量其他奖励",
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
	},
	[33] = {
		name = "国庆礼盒复刻（2020）",
		limit_group = 0,
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "国庆礼盒复刻(2020)",
		limit_arg = 1,
		name_display = "国庆礼盒复刻（2020）",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 198,
		id = 33,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "lihe3_l",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi132",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2020钻，和大量其他奖励",
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
	},
	[34] = {
		name = "新年福袋2022",
		limit_group = 0,
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "新年福袋2022",
		limit_arg = 1,
		name_display = "新年福袋2022",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 198,
		id = 34,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "fudai6",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi133",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2022钻，和大量其他奖励",
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
	},
	[35] = {
		name = "新年福袋复刻(2021)",
		limit_group = 0,
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "新年福袋复刻(2021)",
		limit_arg = 1,
		name_display = "新年福袋复刻(2021)",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 198,
		id = 35,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "fudai3",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi134",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2021钻，和大量其他奖励",
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
	},
	[36] = {
		name = "春节福袋2022",
		limit_group = 0,
		descrip_extra = "*福袋将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "春节福袋2022",
		limit_arg = 1,
		name_display = "春节福袋2022",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 198,
		id = 36,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "fudai7",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi135",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2022钻，和大量其他奖励",
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
	},
	[37] = {
		name = "春节福袋复刻(2021)",
		limit_group = 0,
		descrip_extra = "*福袋将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "春节福袋复刻(2021)",
		limit_arg = 1,
		name_display = "春节福袋复刻(2021)",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 198,
		id = 37,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "fudai4",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi136",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2021钻，和大量其他奖励",
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
	},
	[38] = {
		name = "五周年礼盒",
		limit_group = 0,
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "五周年礼盒",
		limit_arg = 1,
		name_display = "五周年礼盒",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 198,
		id = 38,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "lihe7_l",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi137",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2022钻，和大量其他奖励",
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
	},
	[39] = {
		name = "四周年礼盒复刻",
		limit_group = 0,
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "四周年礼盒复刻",
		limit_arg = 1,
		name_display = "四周年礼盒复刻",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 198,
		id = 39,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "lihe5_l",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi138",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2021钻，和大量其他奖励",
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
	},
	[40] = {
		name = "金秋庆典礼盒",
		limit_group = 0,
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "金秋庆典礼盒",
		limit_arg = 1,
		name_display = "金秋庆典礼盒",
		show_group = "",
		type_order = 2,
		extra_service = 3,
		money = 198,
		id = 40,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "lihe8_l",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi139",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2022钻，和大量其他奖励",
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
	},
	[41] = {
		name = "金秋庆典礼盒（2021）",
		limit_group = 0,
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "金秋庆典礼盒（2021）",
		limit_arg = 1,
		name_display = "金秋庆典礼盒（2021）",
		show_group = "",
		type_order = 2,
		extra_service = 3,
		money = 198,
		id = 41,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "lihe6_l",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi140",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2021钻，和大量其他奖励",
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
	},
	[44] = {
		name = "回归礼包",
		limit_group = 0,
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 1,
		subject = "回归礼包",
		limit_arg = 1,
		name_display = "回归礼包",
		show_group = "",
		type_order = 2,
		extra_service = 3,
		money = 128,
		id = 44,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "support6",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi141",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得大量材料奖励",
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
	},
	[45] = {
		name = "2023泳装礼盒·I",
		limit_group = 0,
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "2023泳装礼盒·I",
		limit_arg = 1,
		name_display = "2023泳装礼盒·I",
		show_group = "",
		type_order = 2,
		extra_service = 3,
		money = 198,
		id = 45,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "lihe10_l",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi142",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2023钻，和大量其他奖励",
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
	},
	[46] = {
		name = "2023泳装礼盒·II",
		limit_group = 0,
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "2023泳装礼盒·II",
		limit_arg = 1,
		name_display = "2023泳装礼盒·II",
		show_group = "",
		type_order = 2,
		extra_service = 3,
		money = 198,
		id = 46,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "lihe11_l",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi143",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2023钻，和大量其他奖励",
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
	},
	[47] = {
		name = "新年福袋复刻(2022)",
		limit_group = 0,
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "新年福袋2022",
		limit_arg = 1,
		name_display = "新年福袋复刻(2022)",
		show_group = "",
		type_order = 2,
		extra_service = 3,
		money = 198,
		id = 47,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "fudai6",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi144",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2022钻，和大量其他奖励",
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
	},
	[48] = {
		name = "2023年春节福袋·I",
		limit_group = 0,
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "2023年春节福袋·I",
		limit_arg = 1,
		name_display = "2023年春节福袋·I",
		show_group = "",
		type_order = 2,
		extra_service = 3,
		money = 198,
		id = 48,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "fudaiqp1",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi145",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2023钻，和大量其他奖励",
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
	},
	[49] = {
		name = "2023年春节福袋·II",
		limit_group = 0,
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "2023年春节福袋·II",
		limit_arg = 1,
		name_display = "2023年春节福袋·II",
		show_group = "",
		type_order = 2,
		extra_service = 3,
		money = 198,
		id = 49,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "fudaiqp2",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi146",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2023钻，和大量其他奖励",
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
	},
	[50] = {
		name = "春节福袋复刻(2022)",
		limit_group = 0,
		descrip_extra = "*福袋将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "春节福袋复刻(2022)",
		limit_arg = 1,
		name_display = "春节福袋复刻(2022)",
		show_group = "",
		type_order = 2,
		extra_service = 3,
		money = 198,
		id = 50,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "fudai7",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi147",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2022钻，和大量其他奖励",
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
	},
	[51] = {
		name = "六周年泳装礼盒",
		limit_group = 0,
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "六周年泳装礼盒",
		limit_arg = 1,
		name_display = "六周年泳装礼盒",
		show_group = "",
		type_order = 2,
		extra_service = 3,
		money = 198,
		id = 51,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "lihecn6ss_l",
		skin_inquire_relation = 69926,
		id_str = "com.bilibili.blhx.zuanshi151",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2023钻，和大量其他奖励",
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
		}
	},
	[52] = {
		name = "六周年礼盒",
		limit_group = 0,
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "六周年礼盒",
		limit_arg = 1,
		name_display = "六周年礼盒",
		show_group = "",
		type_order = 2,
		extra_service = 3,
		money = 198,
		id = 52,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "lihecn6lf_l",
		skin_inquire_relation = 69927,
		id_str = "com.bilibili.blhx.zuanshi152",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2023钻，和大量其他奖励",
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
		}
	},
	[53] = {
		name = "五周年礼盒复刻",
		limit_group = 0,
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "五周年礼盒复刻",
		limit_arg = 1,
		name_display = "五周年礼盒复刻",
		show_group = "",
		type_order = 2,
		extra_service = 3,
		money = 198,
		id = 53,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "lihe7_l",
		skin_inquire_relation = 69919,
		id_str = "com.bilibili.blhx.zuanshi153",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2022钻，和大量其他奖励",
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
	},
	[55] = {
		name = "金秋庆典礼盒(2023)",
		limit_group = 0,
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "金秋庆典礼盒(2023)",
		limit_arg = 1,
		name_display = "金秋庆典礼盒(2023)",
		show_group = "",
		type_order = 2,
		extra_service = 3,
		money = 198,
		id = 55,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "lihejp6lf_l",
		skin_inquire_relation = 69929,
		id_str = "com.bilibili.blhx.zuanshi155",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2023钻，和大量其他奖励",
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
		}
	},
	[56] = {
		name = "金秋庆典礼盒复刻(2022)",
		limit_group = 0,
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "金秋庆典礼盒复刻(2022)",
		limit_arg = 1,
		name_display = "金秋庆典礼盒复刻(2022)",
		show_group = "",
		type_order = 2,
		extra_service = 3,
		money = 198,
		id = 56,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "lihe8_l",
		skin_inquire_relation = 69920,
		id_str = "com.bilibili.blhx.zuanshi156",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2022钻，和大量其他奖励",
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
	},
	[57] = {
		name = "金秋礼盒2023",
		limit_group = 0,
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "金秋礼盒2023",
		limit_arg = 1,
		name_display = "金秋礼盒2023",
		show_group = "",
		type_order = 2,
		extra_service = 3,
		money = 198,
		id = 57,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "lihejp6ss_l",
		skin_inquire_relation = 69928,
		id_str = "com.bilibili.blhx.zuanshi157",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2023钻，和大量其他奖励",
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
		}
	},
	[58] = {
		name = "茗的促销大礼包",
		limit_group = 0,
		descrip_extra = "礼盒将发送到邮箱，请注意查收。\n*自选促销礼物盒需要在仓库中使用",
		type = 0,
		subject = "茗的促销大礼包",
		limit_arg = 1,
		name_display = "茗的促销大礼包",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 198,
		id = 58,
		tag = 2,
		gem = 0,
		limit_type = 2,
		time = "stop",
		picture = "pack_198",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi158",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得1980钻，自选促销礼物盒*1，和大量其他奖励",
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
	},
	[59] = {
		name = "茗的豪华促销大礼包",
		limit_group = 0,
		descrip_extra = "礼盒将发送到邮箱，请注意查收。\n*豪华自选促销礼物盒中的促销换装兑换券（限时）具有时限，请即时使用。",
		type = 0,
		subject = "茗的豪华促销大礼包",
		limit_arg = 1,
		name_display = "茗的豪华促销大礼包",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 328,
		id = 59,
		tag = 2,
		gem = 0,
		limit_type = 2,
		time = "stop",
		picture = "pack_328",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.zuanshi159",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得3280钻，豪华自选促销礼物盒*1，和大量其他奖励",
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
	},
	[60] = {
		name = "促销心动福袋",
		limit_group = 0,
		descrip_extra = "*福袋将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "促销心动福袋",
		limit_arg = 1,
		name_display = "促销心动福袋",
		show_group = "",
		type_order = 2,
		extra_service = 3,
		money = 198,
		id = 60,
		tag = 2,
		gem = 0,
		limit_type = 2,
		time = "stop",
		picture = "fudai8",
		skin_inquire_relation = 69984,
		id_str = "com.bilibili.blhx.zuanshi160",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2023钻，和大量其他奖励",
		airijp_id = "com.yostarjp.azurlane.diamond146",
		extra_service_item = {
			{
				2,
				69984,
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
		display = {
			{
				2,
				69984,
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
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40998,
				1
			}
		}
	},
	[61] = {
		name = "绚烂缤纷夜福袋·I",
		limit_group = 0,
		descrip_extra = "*福袋将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "绚烂缤纷夜福袋·I",
		limit_arg = 1,
		name_display = "绚烂缤纷夜福袋·I",
		show_group = "",
		type_order = 2,
		extra_service = 3,
		money = 198,
		id = 61,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "fudai9",
		skin_inquire_relation = 86200,
		id_str = "com.bilibili.blhx.zuanshi161",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2024钻，和大量其他奖励",
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
		}
	},
	[62] = {
		name = "2023泳装礼盒·I复刻",
		limit_group = 0,
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "2023泳装礼盒·I复刻",
		limit_arg = 1,
		name_display = "2023泳装礼盒·I复刻",
		show_group = "",
		type_order = 2,
		extra_service = 3,
		money = 198,
		id = 62,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "lihe10_l",
		skin_inquire_relation = 69922,
		id_str = "com.bilibili.blhx.zuanshi162",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2023钻，和大量其他奖励",
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
	},
	[63] = {
		name = "绚烂缤纷夜福袋·Ⅱ",
		limit_group = 0,
		descrip_extra = "*福袋将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "绚烂缤纷夜福袋·Ⅱ",
		limit_arg = 1,
		name_display = "绚烂缤纷夜福袋·Ⅱ",
		show_group = "",
		type_order = 2,
		extra_service = 3,
		money = 198,
		id = 63,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "fudai10",
		skin_inquire_relation = 86201,
		id_str = "com.bilibili.blhx.zuanshi163",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2024钻，和大量其他奖励",
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
		}
	},
	[64] = {
		name = "2023泳装礼盒·Ⅱ复刻",
		limit_group = 0,
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "2023泳装礼盒·Ⅱ复刻",
		limit_arg = 1,
		name_display = "2023泳装礼盒·Ⅱ复刻",
		show_group = "",
		type_order = 2,
		extra_service = 3,
		money = 198,
		id = 64,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "lihe11_l",
		skin_inquire_relation = 69923,
		id_str = "com.bilibili.blhx.zuanshi164",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2023钻，和大量其他奖励",
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
	},
	[65] = {
		name = "2024年春节福袋·I",
		limit_group = 0,
		descrip_extra = "*福袋将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "2024年春节福袋·I",
		limit_arg = 1,
		name_display = "2024年春节福袋·I",
		show_group = "",
		type_order = 2,
		extra_service = 3,
		money = 198,
		id = 65,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "fudai11",
		skin_inquire_relation = 86202,
		id_str = "com.bilibili.blhx.zuanshi165",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2024钻，和大量其他奖励",
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
		}
	},
	[66] = {
		name = "2023年春节福袋·I复刻",
		limit_group = 0,
		descrip_extra = "*福袋将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "2023年春节福袋·I复刻",
		limit_arg = 1,
		name_display = "2023年春节福袋·I复刻",
		show_group = "",
		type_order = 2,
		extra_service = 3,
		money = 198,
		id = 66,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "fudaiqp1",
		skin_inquire_relation = 69924,
		id_str = "com.bilibili.blhx.zuanshi166",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2023钻，和大量其他奖励",
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
	},
	[67] = {
		name = "2024年春节福袋·II",
		limit_group = 0,
		descrip_extra = "*福袋将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "2024年春节福袋·II",
		limit_arg = 1,
		name_display = "2024年春节福袋·II",
		show_group = "",
		type_order = 2,
		extra_service = 3,
		money = 198,
		id = 67,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "fudai12",
		skin_inquire_relation = 86203,
		id_str = "com.bilibili.blhx.zuanshi167",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2024钻，和大量其他奖励",
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
		}
	},
	[68] = {
		name = "2023年春节福袋·II复刻",
		limit_group = 0,
		descrip_extra = "*福袋将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "2023年春节福袋·II复刻",
		limit_arg = 1,
		name_display = "2023年春节福袋·II复刻",
		show_group = "",
		type_order = 2,
		extra_service = 3,
		money = 198,
		id = 68,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "fudaiqp2",
		skin_inquire_relation = 69925,
		id_str = "com.bilibili.blhx.zuanshi168",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2023钻，和大量其他奖励",
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
	},
	[69] = {
		name = "七周年泳装礼盒",
		limit_group = 0,
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "七周年泳装礼盒",
		limit_arg = 1,
		name_display = "七周年泳装礼盒",
		show_group = "",
		type_order = 2,
		extra_service = 3,
		money = 198,
		id = 69,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "fudai13",
		skin_inquire_relation = 86204,
		id_str = "com.bilibili.blhx.zuanshi169",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2024钻，和大量其他奖励",
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
		}
	},
	[70] = {
		name = "六周年泳装礼盒复刻",
		limit_group = 0,
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "六周年泳装礼盒复刻",
		limit_arg = 1,
		name_display = "六周年泳装礼盒复刻",
		show_group = "",
		type_order = 2,
		extra_service = 3,
		money = 198,
		id = 70,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "lihecn6ss_l",
		skin_inquire_relation = 69926,
		id_str = "com.bilibili.blhx.zuanshi172",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2023钻，和大量其他奖励",
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
		}
	},
	[71] = {
		name = "七周年礼盒",
		limit_group = 0,
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "七周年礼盒",
		limit_arg = 1,
		name_display = "七周年礼盒",
		show_group = "",
		type_order = 2,
		extra_service = 3,
		money = 198,
		id = 71,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "fudai14",
		skin_inquire_relation = 86205,
		id_str = "com.bilibili.blhx.zuanshi170",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2024钻，和大量其他奖励",
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
		}
	},
	[72] = {
		name = "六周年礼盒复刻",
		limit_group = 0,
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "六周年礼盒复刻",
		limit_arg = 1,
		name_display = "六周年礼盒复刻",
		show_group = "",
		type_order = 2,
		extra_service = 3,
		money = 198,
		id = 72,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "lihecn6lf_l",
		skin_inquire_relation = 69927,
		id_str = "com.bilibili.blhx.zuanshi171",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2023钻，和大量其他奖励",
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
		}
	},
	[73] = {
		name = "梦幻乐园换装礼盒I",
		limit_group = 0,
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "梦幻乐园换装礼盒I",
		limit_arg = 1,
		name_display = "梦幻乐园换装礼盒I",
		show_group = "",
		type_order = 3,
		extra_service = 3,
		money = 198,
		id = 73,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "fudai15",
		skin_inquire_relation = 86206,
		id_str = "com.bilibili.blhx.zuanshi173",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2024钻，和大量其他奖励",
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
		}
	},
	[74] = {
		name = "金秋礼盒2023复刻",
		limit_group = 0,
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "金秋礼盒2023复刻",
		limit_arg = 1,
		name_display = "金秋礼盒2023复刻",
		show_group = "",
		type_order = 3,
		extra_service = 3,
		money = 198,
		id = 74,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "lihejp6ss_l",
		skin_inquire_relation = 69928,
		id_str = "com.bilibili.blhx.zuanshi174",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2023钻，和大量其他奖励",
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
		}
	},
	[75] = {
		name = "梦幻乐园换装礼盒II",
		limit_group = 0,
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "梦幻乐园换装礼盒II",
		limit_arg = 1,
		name_display = "梦幻乐园换装礼盒II",
		show_group = "",
		type_order = 2,
		extra_service = 3,
		money = 198,
		id = 75,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "fudai16",
		skin_inquire_relation = 86207,
		id_str = "com.bilibili.blhx.zuanshi175",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2024钻，和大量其他奖励",
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
		}
	},
	[76] = {
		name = "金秋庆典礼盒(2023)复刻",
		limit_group = 0,
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "金秋庆典礼盒(2023)复刻",
		limit_arg = 1,
		name_display = "金秋庆典礼盒(2023)复刻",
		show_group = "",
		type_order = 2,
		extra_service = 3,
		money = 198,
		id = 76,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "lihejp6lf_l",
		skin_inquire_relation = 69929,
		id_str = "com.bilibili.blhx.zuanshi176",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2023钻，和大量其他奖励",
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
		}
	},
	[80] = {
		name = "豪华冬至促销礼盒(2024)",
		limit_group = 0,
		descrip_extra = "*福袋将发送到邮箱，请注意查收。\n*重复获得已拥有的换装时，则自动置换成等价的钻石。",
		type = 1,
		subject = "2024冬至礼包",
		limit_arg = 1,
		name_display = "豪华冬至促销礼盒(2024)",
		show_group = "",
		type_order = 2,
		extra_service = 3,
		money = 198,
		id = 80,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "fudai17",
		skin_inquire_relation = 86411,
		id_str = "com.bilibili.blhx.zuanshi180",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得一件角色换装，2024钻，和大量其他奖励",
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
					2024,
					12,
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
					12,
					19
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
				2024
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
		}
	},
	[81] = {
		name = "冬至促销礼盒(2024)",
		limit_group = 0,
		descrip_extra = "*福袋将发送到邮箱，请注意查收。\n*拥有列表中的所有换装则转换为获得1080钻石。",
		type = 1,
		subject = "2024冬至礼包",
		limit_arg = 2,
		name_display = "冬至促销礼盒(2024)",
		show_group = "",
		type_order = 2,
		extra_service = 3,
		money = 68,
		id = 81,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "fudai18",
		skin_inquire_relation = 86412,
		id_str = "com.bilibili.blhx.zuanshi181",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得列表中未拥有的L2D换装*1（拥有列表中所有换装则转换为获得钻石）和其他奖励",
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
					2024,
					12,
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
					12,
					19
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
				86412,
				1
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
		}
	},
	[1000] = {
		name = "特许巡游凭证",
		limit_group = 0,
		descrip_extra = "*需要通过任务达成对应巡游进度后才可获取",
		type = 0,
		subject = "特许巡游凭证",
		limit_arg = 1,
		name_display = "特许巡游凭证",
		show_group = "",
		type_order = 0,
		extra_service = 4,
		money = 68,
		id = 1000,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "battlepass_1",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.battlepass1",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得1500巡游点数，同时解锁特许巡游奖励:约克城限定换装和其他奖励",
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
	},
	[1001] = {
		name = "特许巡游凭证(2021.12.1-1.31)",
		limit_group = 0,
		descrip_extra = "*需要通过任务达成对应巡游进度后才可获取",
		type = 0,
		subject = "特许巡游凭证",
		limit_arg = 1,
		name_display = "特许巡游凭证",
		show_group = "",
		type_order = 0,
		extra_service = 4,
		money = 68,
		id = 1001,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "battlepass_1",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.battlepass2",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得1500巡游点数，同时解锁特许巡游奖励:科罗拉多限定换装和其他奖励",
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
	},
	[1002] = {
		name = "特许巡游凭证(2022.2)",
		limit_group = 0,
		descrip_extra = "*需要通过任务达成对应巡游进度后才可获取",
		type = 0,
		subject = "特许巡游凭证",
		limit_arg = 1,
		name_display = "特许巡游凭证",
		show_group = "",
		type_order = 0,
		extra_service = 4,
		money = 68,
		id = 1002,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "battlepass_1",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.battlepass3",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得1500巡游点数，同时解锁特许巡游奖励:哥伦比亚限定换装和其他奖励",
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
	},
	[1003] = {
		name = "特许巡游凭证(2022.4)",
		limit_group = 0,
		descrip_extra = "*需要通过任务达成对应巡游进度后才可获取",
		type = 0,
		subject = "特许巡游凭证",
		limit_arg = 1,
		name_display = "特许巡游凭证",
		show_group = "",
		type_order = 0,
		extra_service = 4,
		money = 68,
		id = 1003,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "battlepass_1",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.battlepass4",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得1500巡游点数，同时解锁特许巡游奖励·企业限定换装和其他奖励",
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
	},
	[1004] = {
		name = "特许巡游凭证(2022.6)",
		limit_group = 0,
		descrip_extra = "*需要通过任务达成对应巡游进度后才可获取",
		type = 0,
		subject = "特许巡游凭证",
		limit_arg = 1,
		name_display = "特许巡游凭证",
		show_group = "",
		type_order = 0,
		extra_service = 4,
		money = 68,
		id = 1004,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "battlepass_1",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.battlepass5",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得1500巡游点数，同时解锁特许巡游奖励·枫限定换装和其他奖励",
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
	},
	[1005] = {
		name = "特许巡游凭证(2022.8)",
		limit_group = 0,
		descrip_extra = "*需要通过任务达成对应巡游进度后才可获取",
		type = 0,
		subject = "特许巡游凭证",
		limit_arg = 1,
		name_display = "特许巡游凭证",
		show_group = "",
		type_order = 4,
		extra_service = 4,
		money = 68,
		id = 1005,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "battlepass_1",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.battlepass6",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得1500巡游点数，同时解锁特许巡游奖励·苝限定换装和其他奖励",
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
	},
	[1006] = {
		name = "特许巡游凭证(2022.10)",
		limit_group = 0,
		descrip_extra = "*需要通过任务达成对应巡游进度后才可获取",
		type = 0,
		subject = "特许巡游凭证",
		limit_arg = 1,
		name_display = "特许巡游凭证",
		show_group = "",
		type_order = 4,
		extra_service = 4,
		money = 68,
		id = 1006,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "battlepass_1",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.battlepass7",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得1500巡游点数，同时解锁特许巡游奖励·水星纪念限定换装和其他奖励",
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
	},
	[1007] = {
		name = "特许巡游凭证(2022.12)",
		limit_group = 0,
		descrip_extra = "*需要通过任务达成对应巡游进度后才可获取",
		type = 0,
		subject = "特许巡游凭证",
		limit_arg = 1,
		name_display = "特许巡游凭证",
		show_group = "",
		type_order = 4,
		extra_service = 4,
		money = 68,
		id = 1007,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "battlepass_1",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.battlepass8",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得1500巡游点数，同时解锁特许巡游奖励·克利夫兰限定换装和其他奖励",
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
	},
	[1008] = {
		name = "特许巡游凭证(2023.2)",
		limit_group = 0,
		descrip_extra = "*需要通过任务达成对应巡游进度后才可获取",
		type = 0,
		subject = "特许巡游凭证",
		limit_arg = 1,
		name_display = "特许巡游凭证",
		show_group = "",
		type_order = 4,
		extra_service = 4,
		money = 68,
		id = 1008,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "battlepass_1",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.battlepass9",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得1500巡游点数，同时解锁特许巡游奖励·棭限定换装和其他奖励",
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
	},
	[1009] = {
		name = "特许巡游凭证(2023.4)",
		limit_group = 0,
		descrip_extra = "*需要通过任务达成对应巡游进度后才可获取",
		type = 0,
		subject = "特许巡游凭证",
		limit_arg = 1,
		name_display = "特许巡游凭证",
		show_group = "",
		type_order = 4,
		extra_service = 4,
		money = 68,
		id = 1009,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "battlepass_1",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.battlepass10",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得1500巡游点数，同时解锁特许巡游奖励·沃克兰限定换装和其他奖励",
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
	},
	[1010] = {
		name = "特许巡游凭证(2023.6)",
		limit_group = 0,
		descrip_extra = "*需要通过任务达成对应巡游进度后才可获取",
		type = 0,
		subject = "特许巡游凭证",
		limit_arg = 1,
		name_display = "特许巡游凭证",
		show_group = "",
		type_order = 4,
		extra_service = 4,
		money = 68,
		id = 1010,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "battlepass_1",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.battlepass12",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得1500巡游点数，同时解锁特许巡游奖励·鸾限定换装和其他奖励",
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
	},
	[1011] = {
		name = "特许巡游凭证(2023.8)",
		limit_group = 0,
		descrip_extra = "*需要通过任务达成对应巡游进度后才可获取",
		type = 0,
		subject = "特许巡游凭证",
		limit_arg = 1,
		name_display = "特许巡游凭证",
		show_group = "",
		type_order = 4,
		extra_service = 4,
		money = 68,
		id = 1011,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "battlepass_1",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.battlepass13",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得1500巡游点数，同时解锁特许巡游奖励·福煦限定换装和其他奖励",
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
	},
	[1012] = {
		name = "特许巡游凭证(2023.10)",
		limit_group = 0,
		descrip_extra = "*需要通过任务达成对应巡游进度后才可获取",
		type = 0,
		subject = "特许巡游凭证",
		limit_arg = 1,
		name_display = "特许巡游凭证",
		show_group = "",
		type_order = 4,
		extra_service = 4,
		money = 68,
		id = 1012,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "battlepass_1",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.battlepass14",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得1500巡游点数，同时解锁特许巡游奖励·优斯伊丽限定换装和其他奖励",
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
	},
	[1013] = {
		name = "特许巡游凭证(2023.12)",
		limit_group = 0,
		descrip_extra = "*需要通过任务达成对应巡游进度后才可获取",
		type = 0,
		subject = "特许巡游凭证",
		limit_arg = 1,
		name_display = "特许巡游凭证",
		show_group = "",
		type_order = 4,
		extra_service = 4,
		money = 68,
		id = 1013,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "battlepass_1",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.battlepass15",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得1500巡游点数，同时解锁特许巡游奖励·梅限定换装和其他奖励",
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
	},
	[1014] = {
		name = "特许巡游凭证(2024.2)",
		limit_group = 0,
		descrip_extra = "*需要通过任务达成对应巡游进度后才可获取",
		type = 0,
		subject = "特许巡游凭证",
		limit_arg = 1,
		name_display = "特许巡游凭证",
		show_group = "",
		type_order = 4,
		extra_service = 4,
		money = 68,
		id = 1014,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "battlepass_1",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.battlepass16",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得1500巡游点数，同时解锁特许巡游奖励·梧限定换装和其他奖励",
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
	},
	[1015] = {
		name = "特许巡游凭证(2024.4)",
		limit_group = 0,
		descrip_extra = "*需要通过任务达成对应巡游进度后才可获取",
		type = 0,
		subject = "特许巡游凭证",
		limit_arg = 1,
		name_display = "特许巡游凭证",
		show_group = "",
		type_order = 4,
		extra_service = 4,
		money = 68,
		id = 1015,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "battlepass_1",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.battlepass17",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得1500巡游点数，同时解锁特许巡游奖励·柏限定换装和其他奖励",
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
	},
	[1016] = {
		name = "特许巡游凭证(2024.6)",
		limit_group = 0,
		descrip_extra = "*需要通过任务达成对应巡游进度后才可获取",
		type = 0,
		subject = "特许巡游凭证",
		limit_arg = 1,
		name_display = "特许巡游凭证",
		show_group = "",
		type_order = 4,
		extra_service = 4,
		money = 68,
		id = 1016,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "battlepass_1",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.battlepass18",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得1500巡游点数，同时解锁特许巡游奖励·阿蒂利奥·雷戈洛限定换装和其他奖励",
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
	},
	[1017] = {
		name = "特许巡游凭证(2024.8)",
		limit_group = 0,
		descrip_extra = "*需要通过任务达成对应巡游进度后才可获取",
		type = 0,
		subject = "特许巡游凭证",
		limit_arg = 1,
		name_display = "特许巡游凭证",
		show_group = "",
		type_order = 4,
		extra_service = 4,
		money = 68,
		id = 1017,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "battlepass_1",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.battlepass19",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得1500巡游点数，同时解锁特许巡游奖励·罗马限定换装和其他奖励",
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
	},
	[1018] = {
		name = "特许巡游凭证(2024.10)",
		limit_group = 0,
		descrip_extra = "*需要通过任务达成对应巡游进度后才可获取",
		type = 0,
		subject = "特许巡游凭证",
		limit_arg = 1,
		name_display = "特许巡游凭证",
		show_group = "",
		type_order = 4,
		extra_service = 4,
		money = 68,
		id = 1018,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "battlepass_1",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.battlepass20",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得1500巡游点数，同时解锁特许巡游奖励·絮弗伦限定换装和其他奖励",
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
	},
	[1019] = {
		name = "特许巡游凭证(2024.12)",
		limit_group = 0,
		descrip_extra = "*需要通过任务达成对应巡游进度后才可获取",
		type = 0,
		subject = "特许巡游凭证",
		limit_arg = 1,
		name_display = "特许巡游凭证",
		show_group = "",
		type_order = 4,
		extra_service = 4,
		money = 68,
		id = 1019,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "battlepass_1",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.battlepass21",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得1500巡游点数，同时解锁特许巡游奖励·威悉限定换装和其他奖励",
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
	},
	[2001] = {
		name = "最高方案研发礼包(一期)",
		limit_group = 1,
		descrip_extra = "此处不会被看到",
		type = 0,
		subject = "最高方案研发礼包(一期)",
		limit_arg = 0,
		name_display = "最高方案研发礼包(一期)",
		show_group = "tech",
		type_order = 0,
		extra_service = 3,
		money = 108,
		id = 2001,
		tag = 2,
		gem = 0,
		limit_type = 3,
		time = "always",
		picture = "tech1_display",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.keyan",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得最高方案快速研发券·一期*1、定向蓝图·一期*343",
		airijp_id = "com.yostarjp.azurlane.tech",
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
		drop_item = {}
	},
	[2002] = {
		name = "最高方案研发礼包(一期)高级版",
		limit_group = 1,
		descrip_extra = "*最高方案快速研发券·一期奖励可能发生变化，点击道具查看详情",
		type = 0,
		subject = "最高方案研发礼包(一期)高级版",
		limit_arg = 1,
		name_display = "高级版",
		show_group = "tech",
		type_order = 0,
		extra_service = 3,
		money = 108,
		id = 2002,
		tag = 2,
		gem = 0,
		limit_type = 3,
		time = "always",
		picture = "tech1_promotion",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.keyan1",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "礼包内容",
		airijp_id = "com.yostarjp.azurlane.tech1",
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
	},
	[2003] = {
		name = "最高方案研发礼包(一期)标准版",
		limit_group = 1,
		descrip_extra = "*最高方案快速研发券·一期奖励可能发生变化，点击道具查看详情",
		type = 0,
		subject = "最高方案研发礼包(一期)标准版",
		limit_arg = 2,
		name_display = "标准版",
		show_group = "tech",
		type_order = 0,
		extra_service = 3,
		money = 68,
		id = 2003,
		tag = 2,
		gem = 0,
		limit_type = 3,
		time = "always",
		picture = "tech1_normal",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.keyan2",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "礼包内容",
		airijp_id = "com.yostarjp.azurlane.tech2",
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
	},
	[2004] = {
		name = "最高方案研发礼包(一期)升级版",
		limit_group = 1,
		descrip_extra = "升级为高级版后可获得定向蓝图·一期x343",
		type = 0,
		subject = "最高方案研发礼包(一期)升级版",
		limit_arg = 3,
		name_display = "高级版",
		show_group = "tech",
		type_order = 0,
		extra_service = 3,
		money = 40,
		id = 2004,
		tag = 2,
		gem = 0,
		limit_type = 3,
		time = "always",
		picture = "tech1_promotion",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.keyan3",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "礼包内容",
		airijp_id = "com.yostarjp.azurlane.tech3",
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
	},
	[2005] = {
		name = "最高方案研发礼包(二期)",
		limit_group = 2,
		descrip_extra = "此处不会被看到",
		type = 0,
		subject = "最高方案研发礼包(二期)",
		limit_arg = 0,
		name_display = "最高方案研发礼包(二期)",
		show_group = "tech",
		type_order = 0,
		extra_service = 3,
		money = 108,
		id = 2005,
		tag = 2,
		gem = 0,
		limit_type = 3,
		time = "always",
		picture = "tech2_display",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.keyan",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得最高方案快速研发券·二期*1、定向蓝图·二期*343",
		airijp_id = "com.yostarjp.azurlane.tech",
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
		drop_item = {}
	},
	[2006] = {
		name = "最高方案研发礼包(二期)高级版",
		limit_group = 2,
		descrip_extra = "*最高方案快速研发券·二期奖励可能发生变化，点击道具查看详情",
		type = 0,
		subject = "最高方案研发礼包(二期)高级版",
		limit_arg = 1,
		name_display = "高级版",
		show_group = "tech",
		type_order = 0,
		extra_service = 3,
		money = 108,
		id = 2006,
		tag = 2,
		gem = 0,
		limit_type = 3,
		time = "always",
		picture = "tech2_promotion",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.keyan4",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "礼包内容",
		airijp_id = "com.yostarjp.azurlane.tech4",
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
	},
	[2007] = {
		name = "最高方案研发礼包(二期)标准版",
		limit_group = 2,
		descrip_extra = "*最高方案快速研发券·二期奖励可能发生变化，点击道具查看详情",
		type = 0,
		subject = "最高方案研发礼包(二期)标准版",
		limit_arg = 2,
		name_display = "标准版",
		show_group = "tech",
		type_order = 0,
		extra_service = 3,
		money = 68,
		id = 2007,
		tag = 2,
		gem = 0,
		limit_type = 3,
		time = "always",
		picture = "tech2_normal",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.keyan5",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "礼包内容",
		airijp_id = "com.yostarjp.azurlane.tech5",
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
	},
	[2008] = {
		name = "最高方案研发礼包(二期)升级版",
		limit_group = 2,
		descrip_extra = "升级为高级版后可获得定向蓝图·二期x343",
		type = 0,
		subject = "最高方案研发礼包(二期)升级版",
		limit_arg = 3,
		name_display = "高级版",
		show_group = "tech",
		type_order = 0,
		extra_service = 3,
		money = 40,
		id = 2008,
		tag = 2,
		gem = 0,
		limit_type = 3,
		time = "always",
		picture = "tech2_promotion",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.keyan6",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "礼包内容",
		airijp_id = "com.yostarjp.azurlane.tech6",
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
	},
	[2009] = {
		name = "即刻出战礼包",
		limit_group = 0,
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		subject = "即刻出战礼包",
		limit_arg = 1,
		name_display = "即刻出战礼包",
		show_group = "",
		type_order = 7,
		extra_service = 3,
		money = 30,
		id = 2009,
		tag = 2,
		gem = 0,
		limit_type = 2,
		time = "always",
		picture = "lv_70",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.libao104",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "购买后指挥官等级将提升至70级和大量其他奖励",
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
		}
	},
	[2010] = {
		name = "舰艇教材礼包",
		limit_group = 0,
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		subject = "舰艇教材礼包",
		limit_arg = 4,
		name_display = "舰艇教材礼包",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 18,
		id = 2010,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "boxSkill",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.libao105",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得大量教材奖励",
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
	},
	[2011] = {
		name = "舰艇教材礼包(2022秋)",
		limit_group = 0,
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		subject = "舰艇教材礼包",
		limit_arg = 4,
		name_display = "舰艇教材礼包",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 18,
		id = 2011,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "boxSkill",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.libao106",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得大量教材奖励",
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
	},
	[2012] = {
		name = "冬至礼包1",
		limit_group = 0,
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		subject = "冬至礼包1",
		limit_arg = 1,
		name_display = "冬至礼包1",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 88,
		id = 2012,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "dongzhi1",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.libao107",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得1280钻，定向部件T4x15和其他奖励",
		airijp_id = "com.yostarjp.azurlane.package107",
		extra_service_item = {
			{
				1,
				14,
				1280
			},
			{
				2,
				30114,
				15
			},
			{
				2,
				17003,
				10
			},
			{
				2,
				17013,
				10
			},
			{
				2,
				17023,
				10
			},
			{
				2,
				17033,
				10
			},
			{
				2,
				17043,
				10
			}
		},
		time = {
			{
				{
					2022,
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
				1,
				14,
				1280
			},
			{
				2,
				30114,
				15
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40981,
				1
			}
		}
	},
	[2013] = {
		name = "冬至礼包2",
		limit_group = 0,
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		subject = "冬至礼包2",
		limit_arg = 1,
		name_display = "冬至礼包2",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 168,
		id = 2013,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "dongzhi2",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.libao108",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得2480钻，定向外观装备箱(星辰无垠)x2和其他奖励",
		airijp_id = "com.yostarjp.azurlane.package108",
		extra_service_item = {
			{
				1,
				14,
				2480
			},
			{
				2,
				30515,
				2
			},
			{
				2,
				20001,
				10
			},
			{
				2,
				15003,
				5
			},
			{
				2,
				15001,
				60
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
				1,
				14,
				2480
			},
			{
				2,
				30515,
				2
			},
			{
				2,
				20001,
				10
			}
		},
		sub_display = {},
		ignorePlatform = {},
		limit_args = {},
		drop_item = {
			{
				2,
				40983,
				1
			}
		}
	},
	[2014] = {
		name = "舰艇教材礼包(2023春)",
		limit_group = 0,
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		subject = "舰艇教材礼包",
		limit_arg = 4,
		name_display = "舰艇教材礼包",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 18,
		id = 2014,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "boxSkill",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.libao109",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得大量教材奖励",
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
	},
	[2015] = {
		name = "最高方案研发礼包(三期)",
		limit_group = 3,
		descrip_extra = "此处不会被看到",
		type = 0,
		subject = "最高方案研发礼包(三期)",
		limit_arg = 0,
		name_display = "最高方案研发礼包(三期)",
		show_group = "tech",
		type_order = 0,
		extra_service = 3,
		money = 108,
		id = 2015,
		tag = 2,
		gem = 0,
		limit_type = 3,
		time = "always",
		picture = "tech3_display",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.keyan",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得最高方案快速研发券·三期*1、定向蓝图·三期*343",
		airijp_id = "com.yostarjp.azurlane.tech",
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
		drop_item = {}
	},
	[2016] = {
		name = "最高方案研发礼包(三期)高级版",
		limit_group = 3,
		descrip_extra = "*最高方案快速研发券·三期奖励可能发生变化，点击道具查看详情",
		type = 0,
		subject = "最高方案研发礼包(三期)高级版",
		limit_arg = 1,
		name_display = "高级版",
		show_group = "tech",
		type_order = 0,
		extra_service = 3,
		money = 108,
		id = 2016,
		tag = 2,
		gem = 0,
		limit_type = 3,
		time = "always",
		picture = "tech3_promotion",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.keyan7",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "礼包内容",
		airijp_id = "com.yostarjp.azurlane.tech7",
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
	},
	[2017] = {
		name = "最高方案研发礼包(三期)标准版",
		limit_group = 3,
		descrip_extra = "*最高方案快速研发券·三期奖励可能发生变化，点击道具查看详情",
		type = 0,
		subject = "最高方案研发礼包(三期)标准版",
		limit_arg = 2,
		name_display = "标准版",
		show_group = "tech",
		type_order = 0,
		extra_service = 3,
		money = 68,
		id = 2017,
		tag = 2,
		gem = 0,
		limit_type = 3,
		time = "always",
		picture = "tech3_normal",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.keyan8",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "礼包内容",
		airijp_id = "com.yostarjp.azurlane.tech8",
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
	},
	[2018] = {
		name = "最高方案研发礼包(三期)升级版",
		limit_group = 3,
		descrip_extra = "升级为高级版后可获得定向蓝图·三期x343",
		type = 0,
		subject = "最高方案研发礼包(三期)升级版",
		limit_arg = 3,
		name_display = "高级版",
		show_group = "tech",
		type_order = 0,
		extra_service = 3,
		money = 40,
		id = 2018,
		tag = 2,
		gem = 0,
		limit_type = 3,
		time = "always",
		picture = "tech3_promotion",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.keyan9",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "礼包内容",
		airijp_id = "com.yostarjp.azurlane.tech9",
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
	},
	[2019] = {
		name = "舰艇教材礼包(2023秋)",
		limit_group = 0,
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		subject = "舰艇教材礼包",
		limit_arg = 4,
		name_display = "舰艇教材礼包",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 18,
		id = 2019,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "boxSkill",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.libao110",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得大量教材奖励",
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
	},
	[2020] = {
		name = "冬至礼包(2023冬)",
		limit_group = 0,
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		subject = "冬至礼包(2023冬)",
		limit_arg = 1,
		name_display = "冬至礼包(2023冬)",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 258,
		id = 2020,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "dongzhi3",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.libao111",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得3880钻，和特装型布里MKIII*1和其他奖励",
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
	},
	[2021] = {
		name = "海上传奇支援组合包",
		limit_group = 0,
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		subject = "海上传奇支援组合包",
		limit_arg = 2,
		name_display = "海上传奇支援组合包",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 128,
		id = 2021,
		tag = 2,
		gem = 0,
		limit_type = 2,
		sub_display = "",
		picture = "haishangchuanqi",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.libao112",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得换装自选券、心智魔方、舰艇演习数据T2和物资奖励！",
		airijp_id = "com.yostarjp.azurlane.package112",
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
	},
	[2022] = {
		name = "魔方支援礼包1",
		limit_group = 0,
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		subject = "魔方支援礼包1",
		limit_arg = 2,
		name_display = "魔方支援礼包1",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 12,
		id = 2022,
		tag = 2,
		gem = 0,
		limit_type = 2,
		sub_display = "",
		picture = "mofangzhiyuan1",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.libao113",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得心智魔方*10",
		airijp_id = "com.yostarjp.azurlane.package113",
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
	},
	[2023] = {
		name = "魔方支援礼包2",
		limit_group = 0,
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		subject = "魔方支援礼包2",
		limit_arg = 2,
		name_display = "魔方支援礼包2",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 30,
		id = 2023,
		tag = 2,
		gem = 0,
		limit_type = 2,
		sub_display = "",
		picture = "mofangzhiyuan2",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.libao114",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得心智魔方*20",
		airijp_id = "com.yostarjp.azurlane.package114",
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
	},
	[2024] = {
		name = "魔方支援礼包3",
		limit_group = 0,
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		subject = "魔方支援礼包3",
		limit_arg = 2,
		name_display = "魔方支援礼包3",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 56,
		id = 2024,
		tag = 2,
		gem = 0,
		limit_type = 2,
		sub_display = "",
		picture = "mofangzhiyuan3",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.libao115",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得心智魔方*30",
		airijp_id = "com.yostarjp.azurlane.package115",
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
	},
	[2025] = {
		name = "日常补给礼包",
		limit_group = 0,
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		subject = "日常补给礼包",
		limit_arg = 1,
		name_display = "日常补给礼包",
		show_group = "",
		type_order = 6,
		extra_service = 3,
		money = 6,
		id = 2025,
		tag = 2,
		gem = 0,
		limit_type = 4,
		time = "always",
		picture = "richang",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.libao116",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "购买礼包可获得心智魔方*1和石油*1200",
		airijp_id = "com.yostarjp.azurlane.package116",
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
	},
	[2026] = {
		name = "舰艇教材礼包(2024春)",
		limit_group = 0,
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		subject = "舰艇教材礼包",
		limit_arg = 4,
		name_display = "舰艇教材礼包",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 18,
		id = 2026,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "boxSkill",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.libao118",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得大量教材奖励",
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
	},
	[2027] = {
		name = "最高方案研发礼包(四期)",
		limit_group = 4,
		descrip_extra = "此处不会被看到",
		type = 0,
		subject = "最高方案研发礼包(四期)",
		limit_arg = 0,
		name_display = "最高方案研发礼包(四期)",
		show_group = "tech",
		type_order = 0,
		extra_service = 3,
		money = 108,
		id = 2027,
		tag = 2,
		gem = 0,
		limit_type = 3,
		time = "always",
		picture = "tech4_display",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.keyan",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得最高方案快速研发券·四期*1、定向蓝图·四期*343",
		airijp_id = "com.yostarjp.azurlane.tech",
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
		drop_item = {}
	},
	[2028] = {
		name = "最高方案研发礼包(四期)高级版",
		limit_group = 4,
		descrip_extra = "*最高方案快速研发券·四期奖励可能发生变化，点击道具查看详情",
		type = 0,
		subject = "最高方案研发礼包(四期)高级版",
		limit_arg = 1,
		name_display = "高级版",
		show_group = "tech",
		type_order = 0,
		extra_service = 3,
		money = 108,
		id = 2028,
		tag = 2,
		gem = 0,
		limit_type = 3,
		time = "always",
		picture = "tech4_promotion",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.keyan10",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "礼包内容",
		airijp_id = "com.yostarjp.azurlane.tech10",
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
	},
	[2029] = {
		name = "最高方案研发礼包(四期)标准版",
		limit_group = 4,
		descrip_extra = "*最高方案快速研发券·四期奖励可能发生变化，点击道具查看详情",
		type = 0,
		subject = "最高方案研发礼包(四期)标准版",
		limit_arg = 2,
		name_display = "标准版",
		show_group = "tech",
		type_order = 0,
		extra_service = 3,
		money = 68,
		id = 2029,
		tag = 2,
		gem = 0,
		limit_type = 3,
		time = "always",
		picture = "tech4_normal",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.keyan11",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "礼包内容",
		airijp_id = "com.yostarjp.azurlane.tech11",
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
	},
	[2030] = {
		name = "最高方案研发礼包(四期)升级版",
		limit_group = 4,
		descrip_extra = "升级为高级版后可获得定向蓝图·四期x343",
		type = 0,
		subject = "最高方案研发礼包(四期)升级版",
		limit_arg = 3,
		name_display = "高级版",
		show_group = "tech",
		type_order = 0,
		extra_service = 3,
		money = 40,
		id = 2030,
		tag = 2,
		gem = 0,
		limit_type = 3,
		time = "always",
		picture = "tech4_promotion",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.keyan12",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "礼包内容",
		airijp_id = "com.yostarjp.azurlane.tech12",
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
	},
	[2031] = {
		name = "海上传奇支援组合包(240718)",
		limit_group = 0,
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		subject = "海上传奇支援组合包(240718)",
		limit_arg = 1,
		name_display = "海上传奇支援组合包(240718)",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 128,
		id = 2031,
		tag = 2,
		gem = 0,
		limit_type = 2,
		sub_display = "",
		picture = "daofeng_package",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.libao119",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得换装自选券、心智魔方、舰艇演习数据T2和物资奖励！",
		airijp_id = "com.yostarjp.azurlane.package119",
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
	},
	[2032] = {
		name = "梦幻霓虹主题礼包",
		limit_group = 101,
		descrip_extra = "此处不会被看到",
		type = 0,
		subject = "梦幻霓虹主题礼包",
		limit_arg = 0,
		name_display = "梦幻霓虹主题礼包",
		show_group = "uigift",
		type_order = 4,
		extra_service = 3,
		money = 78,
		id = 2032,
		tag = 2,
		gem = 0,
		limit_type = 5,
		picture = "ui1",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.ui",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得战斗界面主题 梦幻霓虹*1",
		airijp_id = "com.yostarjp.azurlane.ui",
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
	},
	[2033] = {
		name = "梦幻霓虹主题礼包（基础版）",
		limit_group = 101,
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		subject = "梦幻霓虹主题礼包（基础版）",
		limit_arg = 1,
		name_display = "梦幻霓虹主题礼包（基础版）",
		show_group = "uigift",
		type_order = 4,
		extra_service = 3,
		money = 78,
		id = 2033,
		tag = 2,
		gem = 0,
		limit_type = 5,
		picture = "ui1",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.ui1",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得战斗界面主题 梦幻霓虹*1",
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
	},
	[2034] = {
		name = "梦幻霓虹主题礼包（豪华版）",
		limit_group = 101,
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		subject = "梦幻霓虹主题礼包（豪华版）",
		limit_arg = 1,
		name_display = "梦幻霓虹主题礼包（豪华版）",
		show_group = "uigift",
		type_order = 4,
		extra_service = 3,
		money = 258,
		id = 2034,
		tag = 2,
		gem = 0,
		limit_type = 5,
		picture = "ui1",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.ui2",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得战斗界面主题 梦幻霓虹*1,3060钻石",
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
	},
	[2035] = {
		name = "海上传奇支援组合包(241017)",
		limit_group = 0,
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		subject = "海上传奇支援组合包(241017)",
		limit_arg = 1,
		name_display = "海上传奇支援组合包",
		show_group = "",
		type_order = 5,
		extra_service = 3,
		money = 128,
		id = 2035,
		tag = 2,
		gem = 0,
		limit_type = 2,
		sub_display = "",
		picture = "huteng_package",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.libao120",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得换装自选券、心智魔方、舰艇演习数据T2和物资奖励！",
		airijp_id = "com.yostarjp.azurlane.package120",
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
	},
	[2036] = {
		name = "舰艇教材礼包(2024冬)",
		limit_group = 0,
		descrip_extra = "*礼包将发送到邮箱，请注意查收。",
		type = 0,
		subject = "舰艇教材礼包",
		limit_arg = 4,
		name_display = "舰艇教材礼包",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 18,
		id = 2036,
		tag = 2,
		gem = 0,
		limit_type = 2,
		picture = "boxSkill",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.libao121",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得大量教材奖励",
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
	},
	[5001] = {
		name = "促销礼包I",
		limit_group = 0,
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。",
		type = 0,
		subject = "促销礼包I",
		limit_arg = 1,
		name_display = "促销礼包I",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 6,
		id = 5001,
		tag = 2,
		gem = 0,
		limit_type = 2,
		time = "stop",
		picture = "pack_day1",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.libao201",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得60钻，高级定向蓝图·五期*2",
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
	},
	[5002] = {
		name = "促销礼包II",
		limit_group = 0,
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。",
		type = 0,
		subject = "促销礼包II",
		limit_arg = 1,
		name_display = "促销礼包II",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 6,
		id = 5002,
		tag = 2,
		gem = 0,
		limit_type = 2,
		time = "stop",
		picture = "pack_day2",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.libao202",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得200钻",
		airijp_id = "com.yostarjp.azurlane.package202",
		extra_service_item = {
			{
				1,
				14,
				200
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
	},
	[5003] = {
		name = "促销礼包III",
		limit_group = 0,
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。",
		type = 0,
		subject = "促销礼包III",
		limit_arg = 1,
		name_display = "促销礼包III",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 6,
		id = 5003,
		tag = 2,
		gem = 0,
		limit_type = 2,
		time = "stop",
		picture = "pack_day3",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.libao203",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得定向装备箱·超稀有*1，定向部件T4*5",
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
	},
	[5004] = {
		name = "促销礼包IV",
		limit_group = 0,
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。",
		type = 0,
		subject = "促销礼包IV",
		limit_arg = 1,
		name_display = "促销礼包IV",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 6,
		id = 5004,
		tag = 2,
		gem = 0,
		limit_type = 2,
		time = "stop",
		picture = "pack_day4",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.libao204",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得60钻，试作型布里MKII*1",
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
	},
	[5005] = {
		name = "促销礼包V",
		limit_group = 0,
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。",
		type = 0,
		subject = "促销礼包V",
		limit_arg = 1,
		name_display = "促销礼包V",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 6,
		id = 5005,
		tag = 2,
		gem = 0,
		limit_type = 2,
		time = "stop",
		picture = "pack_day5",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.libao205",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得舰艇演习数据T2*60",
		airijp_id = "com.yostarjp.azurlane.package205",
		extra_service_item = {
			{
				2,
				16502,
				60
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
	},
	[5006] = {
		name = "促销礼包VI",
		limit_group = 0,
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。",
		type = 0,
		subject = "促销礼包VI",
		limit_arg = 1,
		name_display = "促销礼包VI",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 6,
		id = 5006,
		tag = 2,
		gem = 0,
		limit_type = 2,
		time = "stop",
		picture = "pack_day6",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.libao206",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得心智魔方*10，快速完成工具*5",
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
	},
	[5007] = {
		name = "促销礼包VII",
		limit_group = 0,
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。",
		type = 0,
		subject = "促销礼包VII",
		limit_arg = 1,
		name_display = "促销礼包VII",
		show_group = "",
		type_order = 0,
		extra_service = 3,
		money = 6,
		id = 5007,
		tag = 2,
		gem = 0,
		limit_type = 2,
		time = "stop",
		picture = "pack_day7",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.libao207",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "可获得60钻，高级定向蓝图·六期*2",
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
	},
	[5011] = {
		name = "促销礼包I(2024)",
		limit_group = 0,
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。",
		type = 0,
		subject = "促销礼包I",
		limit_arg = 1,
		name_display = "促销礼包I",
		show_group = "",
		type_order = 5,
		extra_service = 3,
		money = 6,
		id = 5011,
		tag = 2,
		gem = 0,
		limit_type = 2,
		sub_display = "",
		picture = "pack_day1",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.libao211",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "购买礼包可获得60钻，高级定向蓝图·六期*2",
		airijp_id = "com.yostarjp.azurlane.package211",
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
					12,
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
					12,
					19
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
	},
	[5012] = {
		name = "促销礼包II(2024)",
		limit_group = 0,
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。",
		type = 0,
		subject = "促销礼包II",
		limit_arg = 1,
		name_display = "促销礼包II",
		show_group = "",
		type_order = 5,
		extra_service = 3,
		money = 6,
		id = 5012,
		tag = 2,
		gem = 0,
		limit_type = 2,
		sub_display = "",
		picture = "pack_day2",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.libao212",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "购买礼包可获得200钻",
		airijp_id = "com.yostarjp.azurlane.package212",
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
					12,
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
					2024,
					12,
					19
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
	},
	[5013] = {
		name = "促销礼包III(2024)",
		limit_group = 0,
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。",
		type = 0,
		subject = "促销礼包III",
		limit_arg = 1,
		name_display = "促销礼包III",
		show_group = "",
		type_order = 5,
		extra_service = 3,
		money = 6,
		id = 5013,
		tag = 2,
		gem = 0,
		limit_type = 2,
		sub_display = "",
		picture = "pack_day3",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.libao213",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "购买礼包可获得定向部件T4*5，心智单元*200",
		airijp_id = "com.yostarjp.azurlane.package213",
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
					2024,
					12,
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
					2024,
					12,
					19
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
	},
	[5014] = {
		name = "促销礼包IV(2024)",
		limit_group = 0,
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。",
		type = 0,
		subject = "促销礼包IV",
		limit_arg = 1,
		name_display = "促销礼包IV",
		show_group = "",
		type_order = 5,
		extra_service = 3,
		money = 6,
		id = 5014,
		tag = 2,
		gem = 0,
		limit_type = 2,
		sub_display = "",
		picture = "pack_day4",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.libao214",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "购买礼包可获得60钻，试作型布里MKII*1",
		airijp_id = "com.yostarjp.azurlane.package214",
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
					2024,
					12,
					19
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
	},
	[5015] = {
		name = "促销礼包V(2024)",
		limit_group = 0,
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。",
		type = 0,
		subject = "促销礼包V",
		limit_arg = 1,
		name_display = "促销礼包V",
		show_group = "",
		type_order = 5,
		extra_service = 3,
		money = 6,
		id = 5015,
		tag = 2,
		gem = 0,
		limit_type = 2,
		sub_display = "",
		picture = "pack_day5",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.libao215",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "购买礼包可获得舰艇演习数据T2*60",
		airijp_id = "com.yostarjp.azurlane.package215",
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
					12,
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
					2024,
					12,
					19
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
	},
	[5016] = {
		name = "促销礼包VI(2024)",
		limit_group = 0,
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。",
		type = 0,
		subject = "促销礼包VI",
		limit_arg = 1,
		name_display = "促销礼包VI",
		show_group = "",
		type_order = 5,
		extra_service = 3,
		money = 6,
		id = 5016,
		tag = 2,
		gem = 0,
		limit_type = 2,
		sub_display = "",
		picture = "pack_day6",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.libao216",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "购买礼包可获得心智魔方*10，快速完成工具*5",
		airijp_id = "com.yostarjp.azurlane.package216",
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
					12,
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
					12,
					19
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
	},
	[5017] = {
		name = "促销礼包VII(2024)",
		limit_group = 0,
		descrip_extra = "*礼盒将发送到邮箱，请注意查收。",
		type = 0,
		subject = "促销礼包VII",
		limit_arg = 1,
		name_display = "促销礼包VII",
		show_group = "",
		type_order = 5,
		extra_service = 3,
		money = 6,
		id = 5017,
		tag = 2,
		gem = 0,
		limit_type = 2,
		sub_display = "",
		picture = "pack_day7",
		skin_inquire_relation = 0,
		id_str = "com.bilibili.blhx.libao217",
		first_pay_double = 0,
		extra_gem = 0,
		descrip = "购买礼包可获得60钻，高级定向蓝图·七期*2",
		airijp_id = "com.yostarjp.azurlane.package217",
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
					2024,
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
					2024,
					12,
					19
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
}
