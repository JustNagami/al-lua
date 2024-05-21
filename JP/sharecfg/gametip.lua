pg = pg or {}
pg.gametip = setmetatable({
	__name = "gametip"
}, confMT)
pg.base = pg.base or {}
pg.base.gametip = pg.base.gametip or {}
cs = cs or {}
cs.gametip = {
	["new_airi_error_code_-1"] = {
		0,
		125,
		true
	},
	new_airi_error_code_0 = {
		125,
		112,
		true
	},
	new_airi_error_code_100100 = {
		237,
		160,
		true
	},
	new_airi_error_code_100110 = {
		397,
		168,
		true
	},
	new_airi_error_code_100111 = {
		565,
		133,
		true
	},
	new_airi_error_code_100112 = {
		698,
		133,
		true
	},
	new_airi_error_code_100113 = {
		831,
		166,
		true
	},
	new_airi_error_code_100114 = {
		997,
		156,
		true
	},
	new_airi_error_code_100115 = {
		1153,
		154,
		true
	},
	new_airi_error_code_100116 = {
		1307,
		157,
		true
	},
	new_airi_error_code_100117 = {
		1464,
		139,
		true
	},
	new_airi_error_code_100120 = {
		1603,
		156,
		true
	},
	new_airi_error_code_100130 = {
		1759,
		157,
		true
	},
	new_airi_error_code_100140 = {
		1916,
		133,
		true
	},
	new_airi_error_code_100150 = {
		2049,
		136,
		true
	},
	new_airi_error_code_100160 = {
		2185,
		117,
		true
	},
	new_airi_error_code_100170 = {
		2302,
		173,
		true
	},
	new_airi_error_code_100180 = {
		2475,
		163,
		true
	},
	new_airi_error_code_100190 = {
		2638,
		151,
		true
	},
	new_airi_error_code_100200 = {
		2789,
		142,
		true
	},
	new_airi_error_code_100210 = {
		2931,
		163,
		true
	},
	new_airi_error_code_100211 = {
		3094,
		157,
		true
	},
	new_airi_error_code_100212 = {
		3251,
		157,
		true
	},
	new_airi_error_code_100213 = {
		3408,
		123,
		true
	},
	new_airi_error_code_100215 = {
		3531,
		155,
		true
	},
	new_airi_error_code_100216 = {
		3686,
		155,
		true
	},
	new_airi_error_code_100217 = {
		3841,
		158,
		true
	},
	new_airi_error_code_100220 = {
		3999,
		117,
		true
	},
	new_airi_error_code_100221 = {
		4116,
		117,
		true
	},
	new_airi_error_code_100222 = {
		4233,
		124,
		true
	},
	new_airi_error_code_100223 = {
		4357,
		123,
		true
	},
	new_airi_error_code_100224 = {
		4480,
		130,
		true
	},
	new_airi_error_code_100225 = {
		4610,
		123,
		true
	},
	new_airi_error_code_100226 = {
		4733,
		148,
		true
	},
	new_airi_error_code_100227 = {
		4881,
		151,
		true
	},
	new_airi_error_code_100228 = {
		5032,
		130,
		true
	},
	new_airi_error_code_100229 = {
		5162,
		117,
		true
	},
	new_airi_error_code_100231 = {
		5279,
		169,
		true
	},
	new_airi_error_code_100232 = {
		5448,
		169,
		true
	},
	new_airi_error_code_100233 = {
		5617,
		166,
		true
	},
	new_airi_error_code_100234 = {
		5783,
		142,
		true
	},
	new_airi_error_code_100230 = {
		5925,
		120,
		true
	},
	new_airi_error_code_100240 = {
		6045,
		156,
		true
	},
	new_airi_error_code_100241 = {
		6201,
		135,
		true
	},
	new_airi_error_code_100242 = {
		6336,
		122,
		true
	},
	new_airi_error_code_100243 = {
		6458,
		122,
		true
	},
	new_airi_error_code_100244 = {
		6580,
		122,
		true
	},
	new_airi_error_code_100245 = {
		6702,
		122,
		true
	},
	new_airi_error_code_100246 = {
		6824,
		162,
		true
	},
	new_airi_error_code_100300 = {
		6986,
		126,
		true
	},
	new_airi_error_code_100301 = {
		7112,
		133,
		true
	},
	new_airi_error_code_100302 = {
		7245,
		205,
		true
	},
	new_airi_error_code_100303 = {
		7450,
		142,
		true
	},
	new_airi_error_code_100304 = {
		7592,
		184,
		true
	},
	new_airi_error_code_100305 = {
		7776,
		157,
		true
	},
	new_airi_error_code_100306 = {
		7933,
		133,
		true
	},
	new_airi_error_code_100404 = {
		8066,
		126,
		true
	},
	new_airi_error_code_200100 = {
		8192,
		160,
		true
	},
	new_airi_error_code_200110 = {
		8352,
		169,
		true
	},
	new_airi_error_code_200120 = {
		8521,
		154,
		true
	},
	new_airi_error_code_200130 = {
		8675,
		172,
		true
	},
	new_airi_error_code_200140 = {
		8847,
		166,
		true
	},
	new_airi_error_code_200150 = {
		9013,
		130,
		true
	},
	new_airi_error_code_200160 = {
		9143,
		126,
		true
	},
	new_airi_error_code_200170 = {
		9269,
		126,
		true
	},
	new_airi_error_code_200180 = {
		9395,
		154,
		true
	},
	new_airi_error_code_200190 = {
		9549,
		133,
		true
	},
	new_airi_error_code_200200 = {
		9682,
		139,
		true
	},
	new_airi_error_code_200210 = {
		9821,
		142,
		true
	},
	new_airi_error_code_200220 = {
		9963,
		157,
		true
	},
	new_airi_error_code_200230 = {
		10120,
		154,
		true
	},
	new_airi_error_code_200240 = {
		10274,
		147,
		true
	},
	new_airi_error_code_200250 = {
		10421,
		123,
		true
	},
	new_airi_error_code_200260 = {
		10544,
		123,
		true
	},
	new_airi_error_code_200270 = {
		10667,
		147,
		true
	},
	new_airi_error_code_200280 = {
		10814,
		139,
		true
	},
	new_airi_error_code_200290 = {
		10953,
		139,
		true
	},
	new_airi_error_code_200300 = {
		11092,
		139,
		true
	},
	new_airi_error_code_200310 = {
		11231,
		192,
		true
	},
	new_airi_error_code_200320 = {
		11423,
		192,
		true
	},
	new_airi_error_code_200330 = {
		11615,
		136,
		true
	},
	new_airi_error_code_200340 = {
		11751,
		130,
		true
	},
	new_airi_error_code_200350 = {
		11881,
		133,
		true
	},
	new_airi_error_code_200360 = {
		12014,
		142,
		true
	},
	new_airi_error_code_300100 = {
		12156,
		133,
		true
	},
	new_airi_error_code_100121 = {
		12289,
		153,
		true
	},
	new_airi_error_code_100201 = {
		12442,
		289,
		true
	},
	new_airi_error_code_100202 = {
		12731,
		312,
		true
	},
	new_airi_error_code_100203 = {
		13043,
		363,
		true
	},
	new_airi_error_code_100204 = {
		13406,
		269,
		true
	},
	new_airi_error_code_100205 = {
		13675,
		147,
		true
	},
	new_airi_error_code_100206 = {
		13822,
		250,
		true
	},
	new_airi_error_code_100207 = {
		14072,
		155,
		true
	},
	new_airi_error_code_100214 = {
		14227,
		267,
		true
	},
	new_airi_error_code_100218 = {
		14494,
		163,
		true
	},
	new_airi_error_code_100235 = {
		14657,
		172,
		true
	},
	new_airi_error_code_100307 = {
		14829,
		144,
		true
	},
	new_airi_error_code_100310 = {
		14973,
		157,
		true
	},
	new_airi_error_code_100311 = {
		15130,
		172,
		true
	},
	new_airi_error_code_100401 = {
		15302,
		107,
		true
	},
	new_airi_error_code_100600 = {
		15409,
		154,
		true
	},
	new_airi_error_code_100802 = {
		15563,
		165,
		true
	},
	new_airi_error_code_100803 = {
		15728,
		123,
		true
	},
	new_airi_error_code_200141 = {
		15851,
		160,
		true
	},
	new_airi_error_code_200145 = {
		16011,
		141,
		true
	},
	new_airi_error_code_200231 = {
		16152,
		125,
		true
	},
	new_airi_error_code_200232 = {
		16277,
		130,
		true
	},
	new_airi_error_code_200235 = {
		16407,
		130,
		true
	},
	new_airi_error_code_200236 = {
		16537,
		130,
		true
	},
	new_airi_error_code_200370 = {
		16667,
		165,
		true
	},
	new_airi_error_code_200380 = {
		16832,
		159,
		true
	},
	new_airi_error_code_200390 = {
		16991,
		183,
		true
	},
	new_airi_error_code_200400 = {
		17174,
		183,
		true
	},
	new_airi_error_code_200410 = {
		17357,
		130,
		true
	},
	new_airi_error_code_200420 = {
		17487,
		123,
		true
	},
	new_airi_error_code_200430 = {
		17610,
		130,
		true
	},
	new_airi_error_code_300101 = {
		17740,
		139,
		true
	},
	new_airi_error_code_300102 = {
		17879,
		157,
		true
	},
	new_airi_error_code_300200 = {
		18036,
		117,
		true
	},
	new_airi_error_code_300210 = {
		18153,
		130,
		true
	},
	new_airi_error_code_300220 = {
		18283,
		130,
		true
	},
	new_airi_error_code_300300 = {
		18413,
		126,
		true
	},
	new_airi_error_code_400010 = {
		18539,
		166,
		true
	},
	new_airi_error_code_400020 = {
		18705,
		178,
		true
	},
	new_airi_error_code_400030 = {
		18883,
		172,
		true
	},
	new_airi_error_code_400040 = {
		19055,
		175,
		true
	},
	new_airi_error_code_400050 = {
		19230,
		175,
		true
	},
	new_airi_error_code_400060 = {
		19405,
		190,
		true
	},
	new_airi_error_code_400070 = {
		19595,
		126,
		true
	},
	new_airi_error_code_400080 = {
		19721,
		181,
		true
	},
	new_airi_error_code_400090 = {
		19902,
		190,
		true
	},
	new_airi_error_code_400100 = {
		20092,
		193,
		true
	},
	new_airi_error_code_400460 = {
		20285,
		169,
		true
	},
	ad_0 = {
		20454,
		68,
		true
	},
	ad_1 = {
		20522,
		306,
		true
	},
	ad_2 = {
		20828,
		305,
		true
	},
	ad_3 = {
		21133,
		306,
		true
	},
	word_back = {
		21439,
		79,
		true
	},
	word_backyardMoney = {
		21518,
		91,
		true
	},
	word_cancel = {
		21609,
		81,
		true
	},
	word_cmdClose = {
		21690,
		86,
		true
	},
	word_delete = {
		21776,
		81,
		true
	},
	word_dockyard = {
		21857,
		86,
		true
	},
	word_dockyardUpgrade = {
		21943,
		96,
		true
	},
	word_dockyardDestroy = {
		22039,
		96,
		true
	},
	word_shipInfoScene_equip = {
		22135,
		100,
		true
	},
	word_shipInfoScene_reinfomation = {
		22235,
		107,
		true
	},
	word_shipInfoScene_infomation = {
		22342,
		105,
		true
	},
	word_editFleet = {
		22447,
		90,
		true
	},
	word_exp = {
		22537,
		75,
		true
	},
	word_expAdd = {
		22612,
		81,
		true
	},
	word_exp_chinese = {
		22693,
		86,
		true
	},
	word_exist = {
		22779,
		83,
		true
	},
	word_equip = {
		22862,
		80,
		true
	},
	word_equipDestory = {
		22942,
		87,
		true
	},
	word_food = {
		23029,
		79,
		true
	},
	word_get = {
		23108,
		78,
		true
	},
	word_got = {
		23186,
		81,
		true
	},
	word_not_get = {
		23267,
		85,
		true
	},
	word_next_level = {
		23352,
		84,
		true
	},
	word_intimacy = {
		23436,
		86,
		true
	},
	word_is = {
		23522,
		77,
		true
	},
	word_date = {
		23599,
		76,
		true
	},
	word_hour = {
		23675,
		79,
		true
	},
	word_minute = {
		23754,
		78,
		true
	},
	word_second = {
		23832,
		78,
		true
	},
	word_lv = {
		23910,
		77,
		true
	},
	word_proficiency = {
		23987,
		80,
		true
	},
	word_material = {
		24067,
		83,
		true
	},
	word_notExist = {
		24150,
		92,
		true
	},
	word_ok = {
		24242,
		77,
		true
	},
	word_preview = {
		24319,
		82,
		true
	},
	word_rarity = {
		24401,
		84,
		true
	},
	word_speedUp = {
		24485,
		112,
		true
	},
	word_succeed = {
		24597,
		76,
		true
	},
	word_start = {
		24673,
		80,
		true
	},
	word_kiss = {
		24753,
		86,
		true
	},
	word_take = {
		24839,
		79,
		true
	},
	word_takeOk = {
		24918,
		87,
		true
	},
	word_many = {
		25005,
		79,
		true
	},
	word_normal_2 = {
		25084,
		83,
		true
	},
	word_simple = {
		25167,
		81,
		true
	},
	word_save = {
		25248,
		79,
		true
	},
	word_levelup = {
		25327,
		82,
		true
	},
	word_serverLoadVindicate = {
		25409,
		120,
		true
	},
	word_serverLoadNormal = {
		25529,
		167,
		true
	},
	word_serverLoadFull = {
		25696,
		112,
		true
	},
	word_registerFull = {
		25808,
		110,
		true
	},
	word_synthesize = {
		25918,
		85,
		true
	},
	word_synthesize_power = {
		26003,
		97,
		true
	},
	word_achieved_item = {
		26100,
		94,
		true
	},
	word_formation = {
		26194,
		84,
		true
	},
	word_teach = {
		26278,
		80,
		true
	},
	word_study = {
		26358,
		80,
		true
	},
	word_destroy = {
		26438,
		82,
		true
	},
	word_upgrade = {
		26520,
		82,
		true
	},
	word_train = {
		26602,
		80,
		true
	},
	word_rest = {
		26682,
		79,
		true
	},
	word_capacity = {
		26761,
		84,
		true
	},
	word_operation = {
		26845,
		90,
		true
	},
	word_intensify_phase = {
		26935,
		96,
		true
	},
	word_systemClose = {
		27031,
		128,
		true
	},
	word_attr_antisub = {
		27159,
		87,
		true
	},
	word_attr_cannon = {
		27246,
		86,
		true
	},
	word_attr_torpedo = {
		27332,
		87,
		true
	},
	word_attr_antiaircraft = {
		27419,
		92,
		true
	},
	word_attr_air = {
		27511,
		83,
		true
	},
	word_attr_durability = {
		27594,
		90,
		true
	},
	word_attr_armor = {
		27684,
		85,
		true
	},
	word_attr_reload = {
		27769,
		86,
		true
	},
	word_attr_speed = {
		27855,
		85,
		true
	},
	word_attr_luck = {
		27940,
		84,
		true
	},
	word_attr_range = {
		28024,
		85,
		true
	},
	word_attr_range_view = {
		28109,
		90,
		true
	},
	word_attr_hit = {
		28199,
		83,
		true
	},
	word_attr_dodge = {
		28282,
		85,
		true
	},
	word_attr_luck1 = {
		28367,
		82,
		true
	},
	word_attr_damage = {
		28449,
		86,
		true
	},
	word_attr_healthy = {
		28535,
		87,
		true
	},
	word_attr_cd = {
		28622,
		82,
		true
	},
	word_attr_speciality = {
		28704,
		90,
		true
	},
	word_attr_level = {
		28794,
		94,
		true
	},
	word_shipState_npc = {
		28888,
		131,
		true
	},
	word_shipState_fight = {
		29019,
		99,
		true
	},
	word_shipState_world = {
		29118,
		130,
		true
	},
	word_shipState_rest = {
		29248,
		107,
		true
	},
	word_shipState_study = {
		29355,
		111,
		true
	},
	word_shipState_tactics = {
		29466,
		116,
		true
	},
	word_shipState_collect = {
		29582,
		116,
		true
	},
	word_shipState_event = {
		29698,
		120,
		true
	},
	word_shipState_activity = {
		29818,
		145,
		true
	},
	word_shipState_sham = {
		29963,
		119,
		true
	},
	word_shipState_support = {
		30082,
		135,
		true
	},
	word_shipType_quZhu = {
		30217,
		89,
		true
	},
	word_shipType_qinXun = {
		30306,
		90,
		true
	},
	word_shipType_zhongXun = {
		30396,
		92,
		true
	},
	word_shipType_zhanLie = {
		30488,
		91,
		true
	},
	word_shipType_hangMu = {
		30579,
		90,
		true
	},
	word_shipType_weiXiu = {
		30669,
		90,
		true
	},
	word_shipType_other = {
		30759,
		86,
		true
	},
	word_shipType_all = {
		30845,
		90,
		true
	},
	word_gem = {
		30935,
		81,
		true
	},
	word_freeGem = {
		31016,
		85,
		true
	},
	word_gem_icon = {
		31101,
		109,
		true
	},
	word_freeGem_icon = {
		31210,
		113,
		true
	},
	word_exploit = {
		31323,
		82,
		true
	},
	word_rankScore = {
		31405,
		87,
		true
	},
	word_battery = {
		31492,
		91,
		true
	},
	word_oil = {
		31583,
		78,
		true
	},
	word_gold = {
		31661,
		79,
		true
	},
	word_oilField = {
		31740,
		83,
		true
	},
	word_goldField = {
		31823,
		87,
		true
	},
	word_ema = {
		31910,
		78,
		true
	},
	word_ema1 = {
		31988,
		79,
		true
	},
	word_pt = {
		32067,
		79,
		true
	},
	word_omamori = {
		32146,
		91,
		true
	},
	word_yisegefuke_pt = {
		32237,
		90,
		true
	},
	word_faxipt = {
		32327,
		90,
		true
	},
	word_count_2 = {
		32417,
		99,
		true
	},
	word_clear = {
		32516,
		83,
		true
	},
	word_buy = {
		32599,
		78,
		true
	},
	word_happy = {
		32677,
		103,
		true
	},
	word_normal = {
		32780,
		104,
		true
	},
	word_tired = {
		32884,
		103,
		true
	},
	word_angry = {
		32987,
		103,
		true
	},
	word_max_page = {
		33090,
		83,
		true
	},
	word_least_page = {
		33173,
		85,
		true
	},
	word_week = {
		33258,
		76,
		true
	},
	word_day = {
		33334,
		75,
		true
	},
	word_use = {
		33409,
		78,
		true
	},
	word_use_batch = {
		33487,
		89,
		true
	},
	word_discount = {
		33576,
		83,
		true
	},
	word_threaten_exclude = {
		33659,
		97,
		true
	},
	word_threaten = {
		33756,
		83,
		true
	},
	word_comingSoon = {
		33839,
		88,
		true
	},
	word_lightArmor = {
		33927,
		88,
		true
	},
	word_mediumArmor = {
		34015,
		89,
		true
	},
	word_heavyarmor = {
		34104,
		88,
		true
	},
	word_level_upperLimit = {
		34192,
		93,
		true
	},
	word_level_require = {
		34285,
		90,
		true
	},
	word_materal_no_enough = {
		34375,
		98,
		true
	},
	word_default = {
		34473,
		82,
		true
	},
	word_count = {
		34555,
		80,
		true
	},
	word_kind = {
		34635,
		79,
		true
	},
	word_piece = {
		34714,
		77,
		true
	},
	word_main_fleet = {
		34791,
		85,
		true
	},
	word_vanguard_fleet = {
		34876,
		89,
		true
	},
	word_theme = {
		34965,
		83,
		true
	},
	word_recommend = {
		35048,
		90,
		true
	},
	word_wallpaper = {
		35138,
		84,
		true
	},
	word_furniture = {
		35222,
		84,
		true
	},
	word_decorate = {
		35306,
		83,
		true
	},
	word_special = {
		35389,
		82,
		true
	},
	word_expand = {
		35471,
		81,
		true
	},
	word_wall = {
		35552,
		82,
		true
	},
	word_floorpaper = {
		35634,
		82,
		true
	},
	word_collection = {
		35716,
		88,
		true
	},
	word_mat = {
		35804,
		81,
		true
	},
	word_comfort_level = {
		35885,
		91,
		true
	},
	word_room = {
		35976,
		79,
		true
	},
	word_equipment_all = {
		36055,
		88,
		true
	},
	word_equipment_cannon = {
		36143,
		91,
		true
	},
	word_equipment_torpedo = {
		36234,
		92,
		true
	},
	word_equipment_aircraft = {
		36326,
		96,
		true
	},
	word_equipment_small_cannon = {
		36422,
		106,
		true
	},
	word_equipment_medium_cannon = {
		36528,
		107,
		true
	},
	word_equipment_big_cannon = {
		36635,
		104,
		true
	},
	word_equipment_warship_torpedo = {
		36739,
		109,
		true
	},
	word_equipment_submarine_torpedo = {
		36848,
		111,
		true
	},
	word_equipment_antiaircraft = {
		36959,
		97,
		true
	},
	word_equipment_fighter = {
		37056,
		95,
		true
	},
	word_equipment_bomber = {
		37151,
		94,
		true
	},
	word_equipment_torpedo_bomber = {
		37245,
		102,
		true
	},
	word_equipment_equip = {
		37347,
		90,
		true
	},
	word_equipment_type = {
		37437,
		89,
		true
	},
	word_equipment_rarity = {
		37526,
		94,
		true
	},
	word_equipment_intensify = {
		37620,
		94,
		true
	},
	word_equipment_special = {
		37714,
		95,
		true
	},
	word_primary_weapons = {
		37809,
		93,
		true
	},
	word_main_cannons = {
		37902,
		87,
		true
	},
	word_shipboard_aircraft = {
		37989,
		96,
		true
	},
	word_sub_cannons = {
		38085,
		86,
		true
	},
	word_sub_weapons = {
		38171,
		89,
		true
	},
	word_torpedo = {
		38260,
		82,
		true
	},
	["word_ air_defense_artillery"] = {
		38342,
		100,
		true
	},
	word_air_defense_artillery = {
		38442,
		96,
		true
	},
	word_device = {
		38538,
		81,
		true
	},
	word_cannon = {
		38619,
		81,
		true
	},
	word_fighter = {
		38700,
		85,
		true
	},
	word_bomber = {
		38785,
		84,
		true
	},
	word_attacker = {
		38869,
		86,
		true
	},
	word_seaplane = {
		38955,
		86,
		true
	},
	word_missile = {
		39041,
		88,
		true
	},
	word_online = {
		39129,
		90,
		true
	},
	word_apply = {
		39219,
		80,
		true
	},
	word_star = {
		39299,
		79,
		true
	},
	word_level = {
		39378,
		80,
		true
	},
	word_mod_value = {
		39458,
		87,
		true
	},
	word_wait = {
		39545,
		73,
		true
	},
	word_consume = {
		39618,
		82,
		true
	},
	word_sell_out = {
		39700,
		86,
		true
	},
	word_sell_lock = {
		39786,
		88,
		true
	},
	word_diamond_tip = {
		39874,
		533,
		true
	},
	word_contribution = {
		40407,
		87,
		true
	},
	word_guild_res = {
		40494,
		90,
		true
	},
	word_fit = {
		40584,
		78,
		true
	},
	word_equipment_skin = {
		40662,
		89,
		true
	},
	word_activity = {
		40751,
		83,
		true
	},
	word_urgency_event = {
		40834,
		94,
		true
	},
	word_shop = {
		40928,
		85,
		true
	},
	word_facility = {
		41013,
		83,
		true
	},
	word_cv_key_main = {
		41096,
		89,
		true
	},
	channel_name_1 = {
		41185,
		84,
		true
	},
	channel_name_2 = {
		41269,
		84,
		true
	},
	channel_name_3 = {
		41353,
		84,
		true
	},
	channel_name_4 = {
		41437,
		84,
		true
	},
	channel_name_5 = {
		41521,
		84,
		true
	},
	common_wait = {
		41605,
		133,
		true
	},
	common_ship_type = {
		41738,
		86,
		true
	},
	common_dont_remind_dur_login = {
		41824,
		135,
		true
	},
	common_activity_end = {
		41959,
		140,
		true
	},
	common_activity_notStartOrEnd = {
		42099,
		120,
		true
	},
	common_activity_not_start = {
		42219,
		138,
		true
	},
	common_error = {
		42357,
		98,
		true
	},
	common_no_gold = {
		42455,
		128,
		true
	},
	common_no_oil = {
		42583,
		127,
		true
	},
	common_no_rmb = {
		42710,
		131,
		true
	},
	common_count_noenough = {
		42841,
		109,
		true
	},
	common_no_dorm_gold = {
		42950,
		137,
		true
	},
	common_no_resource = {
		43087,
		115,
		true
	},
	common_no_item = {
		43202,
		139,
		true
	},
	common_no_item_1 = {
		43341,
		119,
		true
	},
	common_no_x = {
		43460,
		127,
		true
	},
	common_limit_cmd = {
		43587,
		125,
		true
	},
	common_limit_type = {
		43712,
		130,
		true
	},
	common_limit_equip = {
		43842,
		118,
		true
	},
	common_buy_success = {
		43960,
		112,
		true
	},
	common_limit_level = {
		44072,
		125,
		true
	},
	common_shopId_noFound = {
		44197,
		117,
		true
	},
	common_today_buy_limit = {
		44314,
		128,
		true
	},
	common_not_enter_room = {
		44442,
		118,
		true
	},
	common_test_ship = {
		44560,
		113,
		true
	},
	common_entry_inhibited = {
		44673,
		119,
		true
	},
	common_refresh_count_insufficient = {
		44792,
		146,
		true
	},
	common_get_player_info_erro = {
		44938,
		137,
		true
	},
	common_no_open = {
		45075,
		87,
		true
	},
	["common_already owned"] = {
		45162,
		93,
		true
	},
	common_not_get_ship = {
		45255,
		92,
		true
	},
	common_sale_out = {
		45347,
		88,
		true
	},
	common_skin_out_of_stock = {
		45435,
		109,
		true
	},
	common_go_home = {
		45544,
		114,
		true
	},
	dont_remind_today = {
		45658,
		111,
		true
	},
	dont_remind_session = {
		45769,
		113,
		true
	},
	battle_no_oil = {
		45882,
		128,
		true
	},
	battle_emptyBlock = {
		46010,
		133,
		true
	},
	battle_duel_main_rage = {
		46143,
		131,
		true
	},
	battle_main_emergent = {
		46274,
		149,
		true
	},
	battle_battleMediator_goOnFight = {
		46423,
		107,
		true
	},
	battle_battleMediator_existFight = {
		46530,
		108,
		true
	},
	battle_battleMediator_clear_warning = {
		46638,
		278,
		true
	},
	battle_battleMediator_quest_exist = {
		46916,
		212,
		true
	},
	battle_levelMediator_ok_takeResource = {
		47128,
		131,
		true
	},
	battle_result_time_limit = {
		47259,
		117,
		true
	},
	battle_result_sink_limit = {
		47376,
		114,
		true
	},
	battle_result_undefeated = {
		47490,
		121,
		true
	},
	battle_result_victory = {
		47611,
		103,
		true
	},
	battle_result_defeat_all_enemys = {
		47714,
		119,
		true
	},
	battle_result_base_score = {
		47833,
		112,
		true
	},
	battle_result_dead_score = {
		47945,
		112,
		true
	},
	battle_result_score = {
		48057,
		104,
		true
	},
	battle_result_score_total = {
		48161,
		98,
		true
	},
	battle_result_total_damage = {
		48259,
		111,
		true
	},
	battle_result_contribution = {
		48370,
		105,
		true
	},
	battle_result_total_score = {
		48475,
		101,
		true
	},
	battle_result_max_combo = {
		48576,
		105,
		true
	},
	battle_levelScene_0Oil = {
		48681,
		128,
		true
	},
	battle_levelScene_0Gold = {
		48809,
		130,
		true
	},
	battle_levelScene_noRaderCount = {
		48939,
		128,
		true
	},
	battle_levelScene_lock = {
		49067,
		203,
		true
	},
	battle_levelScene_hard_lock = {
		49270,
		239,
		true
	},
	battle_levelScene_close = {
		49509,
		136,
		true
	},
	battle_levelScene_chapter_lock = {
		49645,
		211,
		true
	},
	battle_preCombatLayer_changeFormationError = {
		49856,
		146,
		true
	},
	battle_preCombatLayer_changeFormationNumberError = {
		50002,
		177,
		true
	},
	battle_preCombatLayer_ready = {
		50179,
		146,
		true
	},
	battle_preCombatLayer_quest_leaveFleet = {
		50325,
		161,
		true
	},
	battle_preCombatLayer_clear_confirm = {
		50486,
		145,
		true
	},
	battle_preCombatLayer_auto_confirm = {
		50631,
		162,
		true
	},
	battle_preCombatLayer_save_confirm = {
		50793,
		138,
		true
	},
	battle_preCombatLayer_save_march = {
		50931,
		148,
		true
	},
	battle_preCombatLayer_save_success = {
		51079,
		132,
		true
	},
	battle_preCombatLayer_time_limit = {
		51211,
		119,
		true
	},
	battle_preCombatLayer_sink_limit = {
		51330,
		122,
		true
	},
	battle_preCombatLayer_undefeated = {
		51452,
		130,
		true
	},
	battle_preCombatLayer_victory = {
		51582,
		111,
		true
	},
	battle_preCombatLayer_time_hold = {
		51693,
		121,
		true
	},
	battle_preCombatLayer_damage_before_end = {
		51814,
		152,
		true
	},
	battle_preCombatLayer_destory_transport_ship = {
		51966,
		138,
		true
	},
	battle_preCombatMediator_leastLimit = {
		52104,
		154,
		true
	},
	battle_preCombatMediator_timeout = {
		52258,
		174,
		true
	},
	battle_preCombatMediator_activity_timeout = {
		52432,
		142,
		true
	},
	battle_resourceSiteLayer_collecTimeDefault = {
		52574,
		152,
		true
	},
	battle_resourceSiteLayer_collecTime = {
		52726,
		145,
		true
	},
	battle_resourceSiteLayer_maxLv = {
		52871,
		127,
		true
	},
	battle_resourceSiteLayer_avgLv = {
		52998,
		134,
		true
	},
	battle_resourceSiteLayer_shipTypeCount = {
		53132,
		107,
		true
	},
	battle_resourceSiteLayer_no_maxLv = {
		53239,
		164,
		true
	},
	battle_resourceSiteLayer_no_avgLv = {
		53403,
		164,
		true
	},
	battle_resourceSiteLayer_no_shipTypeCount = {
		53567,
		164,
		true
	},
	battle_resourceSiteLayer_startError_collecting = {
		53731,
		132,
		true
	},
	battle_resourceSiteLayer_startError_not5Ship = {
		53863,
		158,
		true
	},
	battle_resourceSiteLayer_startError_limit = {
		54021,
		171,
		true
	},
	battle_resourceSiteLayer_endError_notStar = {
		54192,
		148,
		true
	},
	battle_resourceSiteLayer_quest_end = {
		54340,
		204,
		true
	},
	battle_resourceSiteMediator_noSite = {
		54544,
		125,
		true
	},
	battle_resourceSiteMediator_shipState_fight = {
		54669,
		135,
		true
	},
	battle_resourceSiteMediator_shipState_rest = {
		54804,
		134,
		true
	},
	battle_resourceSiteMediator_shipState_study = {
		54938,
		138,
		true
	},
	battle_resourceSiteMediator_shipState_event = {
		55076,
		138,
		true
	},
	battle_resourceSiteMediator_shipState_same = {
		55214,
		140,
		true
	},
	battle_resourceSiteMediator_ok_end = {
		55354,
		125,
		true
	},
	battle_autobot_unlock = {
		55479,
		139,
		true
	},
	tips_confirm_teleport_sub = {
		55618,
		404,
		true
	},
	backyard_addExp_Info = {
		56022,
		288,
		true
	},
	backyard_extendCapacity_error = {
		56310,
		106,
		true
	},
	backyard_extendCapacity_ok = {
		56416,
		152,
		true
	},
	backyard_addShip_error = {
		56568,
		111,
		true
	},
	backyard_buyFurniture_error = {
		56679,
		110,
		true
	},
	backyard_extendBackYard_error = {
		56789,
		115,
		true
	},
	backyard_addFood_error = {
		56904,
		105,
		true
	},
	backyard_addFood_ok = {
		57009,
		143,
		true
	},
	backyard_putFurniture_ok = {
		57152,
		106,
		true
	},
	backyard_backyardGranaryLayer_foodCountLimit = {
		57258,
		139,
		true
	},
	backyard_shipAddInimacy_ok = {
		57397,
		175,
		true
	},
	backyard_shipAddInimacy_error = {
		57572,
		115,
		true
	},
	backyard_shipAddMoney_ok = {
		57687,
		175,
		true
	},
	backyard_shipAddMoney_error = {
		57862,
		113,
		true
	},
	backyard_shipExit_error = {
		57975,
		106,
		true
	},
	backyard_shipSpeedUpEnergy_error = {
		58081,
		109,
		true
	},
	backyard_shipAlreadyExit = {
		58190,
		127,
		true
	},
	backyard_backyardGranaryLayer_full = {
		58317,
		154,
		true
	},
	backyard_backyardGranaryLayer_buyCountLimit = {
		58471,
		178,
		true
	},
	backyard_backyardGranaryLayer_error_noResource = {
		58649,
		190,
		true
	},
	backyard_backyardGranaryLayer_noFood = {
		58839,
		152,
		true
	},
	backyard_backyardGranaryLayer_noTimer = {
		58991,
		185,
		true
	},
	backyard_backyardGranaryLayer_word = {
		59176,
		122,
		true
	},
	backyard_backyardGranaryLayer_noShip = {
		59298,
		190,
		true
	},
	backyard_backyardGranaryLayer_foodTimeNotice_top = {
		59488,
		144,
		true
	},
	backyard_backyardGranaryLayer_foodTimeNotice_bottom = {
		59632,
		168,
		true
	},
	backyard_backyardGranaryLayer_foodMaxIncreaseNotice = {
		59800,
		199,
		true
	},
	backyard_backyardGranaryLayer_error_entendFail = {
		59999,
		176,
		true
	},
	backyard_backyardGranaryLayer_buy_max_count = {
		60175,
		135,
		true
	},
	backyard_backyardScene_comforChatContent1 = {
		60310,
		241,
		true
	},
	backyard_backyardScene_comforChatContent2 = {
		60551,
		275,
		true
	},
	backyard_buyExtendItem_question = {
		60826,
		160,
		true
	},
	backyard_backyardScene_expression_label_1 = {
		60986,
		111,
		true
	},
	backyard_backyardScene_expression_label_2 = {
		61097,
		111,
		true
	},
	backyard_backyardScene_expression_label_3 = {
		61208,
		111,
		true
	},
	backyard_backyardScene_quest_clearButton = {
		61319,
		170,
		true
	},
	backyard_backyardScene_quest_saveFurniture = {
		61489,
		169,
		true
	},
	backyard_backyardScene_restSuccess = {
		61658,
		155,
		true
	},
	backyard_backyardScene_clearSuccess = {
		61813,
		162,
		true
	},
	backyard_backyardScene_name = {
		61975,
		125,
		true
	},
	backyard_backyardScene_exitShipAfterAddEnergy = {
		62100,
		143,
		true
	},
	backyard_backyardScene_showAddExpInfo = {
		62243,
		182,
		true
	},
	backyard_backyardScene_error_noPosPutFurniture = {
		62425,
		150,
		true
	},
	backyard_backyardScene_error_noFurniture = {
		62575,
		144,
		true
	},
	backyard_backyardScene_error_canNotRotate = {
		62719,
		151,
		true
	},
	backyard_backyardShipInfoLayer_quest_openPos = {
		62870,
		191,
		true
	},
	backyard_backyardShipInfoLayer_quest_addShipNoFood = {
		63061,
		178,
		true
	},
	backyard_backyardShipInfoLayer_quest_quickAddEnergy = {
		63239,
		199,
		true
	},
	backyard_backyardShipInfoLayer_error_noQuickItem = {
		63438,
		152,
		true
	},
	backyard_backyardShipInfoMediator_shipState_rest = {
		63590,
		140,
		true
	},
	backyard_backyardShipInfoMediator_shipState_fight = {
		63730,
		141,
		true
	},
	backyard_backyardShipInfoMediator_shipState_study = {
		63871,
		144,
		true
	},
	backyard_backyardShipInfoMediator_shipState_collect = {
		64015,
		146,
		true
	},
	backyard_backyardShipInfoMediator_shipState_event = {
		64161,
		153,
		true
	},
	backyard_backyardShipInfoMediator_quest_moveOutFleet = {
		64314,
		183,
		true
	},
	backyard_backyardShipInfoMediator_error_vanguardFleetOnlyOneShip = {
		64497,
		174,
		true
	},
	backyard_backyardShipInfoMediator_error_mainFleetOnlyOneShip = {
		64671,
		170,
		true
	},
	backyard_backyardShipInfoMediator_ok_addShip = {
		64841,
		139,
		true
	},
	backyard_backyardShipInfoMediator_ok_unlock = {
		64980,
		119,
		true
	},
	backyard_backyardShipInfoMediator_error_noFood = {
		65099,
		135,
		true
	},
	backyard_backyardShipInfoMediator_error_fullEnergy = {
		65234,
		142,
		true
	},
	backyard_backyardShipInfoMediator_error_fleetOnlyOneShip = {
		65376,
		160,
		true
	},
	backyard_open_2floor = {
		65536,
		311,
		true
	},
	backyarad_theme_replace = {
		65847,
		226,
		true
	},
	backyard_extendArea_ok = {
		66073,
		122,
		true
	},
	backyard_extendArea_erro = {
		66195,
		150,
		true
	},
	backyard_extendArea_tip = {
		66345,
		159,
		true
	},
	backyard_notPosition_shipExit = {
		66504,
		126,
		true
	},
	backyard_no_ship_tip = {
		66630,
		108,
		true
	},
	backyard_energy_qiuck_up_tip = {
		66738,
		203,
		true
	},
	backyard_cant_put_tip = {
		66941,
		106,
		true
	},
	backyard_cant_buy_tip = {
		67047,
		106,
		true
	},
	backyard_theme_lock_tip = {
		67153,
		147,
		true
	},
	backyard_theme_open_tip = {
		67300,
		144,
		true
	},
	backyard_theme_furniture_buy_tip = {
		67444,
		283,
		true
	},
	backyard_cannot_repeat_purchase = {
		67727,
		122,
		true
	},
	backyard_theme_bought = {
		67849,
		109,
		true
	},
	backyard_interAction_no_open = {
		67958,
		101,
		true
	},
	backyard_theme_no_exist = {
		68059,
		117,
		true
	},
	backayrd_theme_delete_sucess = {
		68176,
		113,
		true
	},
	backayrd_theme_delete_erro = {
		68289,
		111,
		true
	},
	backyard_ship_on_furnitrue = {
		68400,
		154,
		true
	},
	backyard_save_empty_theme = {
		68554,
		138,
		true
	},
	backyard_theme_name_forbid = {
		68692,
		125,
		true
	},
	backyard_getResource_emptry = {
		68817,
		143,
		true
	},
	backyard_no_pos_for_ship = {
		68960,
		124,
		true
	},
	equipment_destroyEquipments_error_noEquip = {
		69084,
		133,
		true
	},
	equipment_destroyEquipments_error_notEnoughEquip = {
		69217,
		143,
		true
	},
	equipment_equipDevUI_error_noPos = {
		69360,
		117,
		true
	},
	equipment_equipmentInfoLayer_error_canNotEquip = {
		69477,
		161,
		true
	},
	equipment_equipmentScene_selectError_more = {
		69638,
		156,
		true
	},
	equipment_newEquipLayer_getNewEquip = {
		69794,
		138,
		true
	},
	equipment_select_materials_tip = {
		69932,
		127,
		true
	},
	equipment_select_device_tip = {
		70059,
		124,
		true
	},
	equipment_cant_unload = {
		70183,
		166,
		true
	},
	equipment_max_level = {
		70349,
		113,
		true
	},
	equipment_upgrade_costcheck_error = {
		70462,
		176,
		true
	},
	equipment_upgrade_feedback_lack_of_fragment = {
		70638,
		163,
		true
	},
	exercise_count_insufficient = {
		70801,
		127,
		true
	},
	exercise_clear_fleet_tip = {
		70928,
		251,
		true
	},
	exercise_fleet_exit_tip = {
		71179,
		153,
		true
	},
	exercise_replace_rivals_ok_tip = {
		71332,
		134,
		true
	},
	exercise_replace_rivals_question = {
		71466,
		191,
		true
	},
	exercise_count_recover_tip = {
		71657,
		128,
		true
	},
	exercise_shop_refresh_tip = {
		71785,
		175,
		true
	},
	exercise_shop_buy_tip = {
		71960,
		150,
		true
	},
	exercise_formation_title = {
		72110,
		106,
		true
	},
	exercise_time_tip = {
		72216,
		105,
		true
	},
	exercise_rule_tip = {
		72321,
		1243,
		true
	},
	exercise_award_tip = {
		73564,
		169,
		true
	},
	dock_yard_left_tips = {
		73733,
		149,
		true
	},
	fleet_error_no_fleet = {
		73882,
		117,
		true
	},
	fleet_repairShips_error_fullEnergy = {
		73999,
		125,
		true
	},
	fleet_repairShips_error_noResource = {
		74124,
		128,
		true
	},
	fleet_repairShips_quest = {
		74252,
		152,
		true
	},
	fleet_fleetRaname_error = {
		74404,
		106,
		true
	},
	fleet_updateFleet_error = {
		74510,
		100,
		true
	},
	friend_acceptFriendRequest_error = {
		74610,
		115,
		true
	},
	friend_deleteFriend_error = {
		74725,
		108,
		true
	},
	friend_fetchFriendMsg_error = {
		74833,
		110,
		true
	},
	friend_rejectFriendRequest_error = {
		74943,
		115,
		true
	},
	friend_searchFriend_noPlayer = {
		75058,
		132,
		true
	},
	friend_sendFriendMsg_error = {
		75190,
		103,
		true
	},
	friend_sendFriendMsg_error_noFriend = {
		75293,
		136,
		true
	},
	friend_sendFriendRequest_error = {
		75429,
		107,
		true
	},
	friend_addblacklist_error = {
		75536,
		108,
		true
	},
	friend_relieveblacklist_error = {
		75644,
		118,
		true
	},
	friend_sendFriendRequest_success = {
		75762,
		123,
		true
	},
	friend_relieveblacklist_success = {
		75885,
		128,
		true
	},
	friend_addblacklist_success = {
		76013,
		115,
		true
	},
	friend_confirm_add_blacklist = {
		76128,
		212,
		true
	},
	friend_relieve_backlist_tip = {
		76340,
		176,
		true
	},
	friend_player_is_friend_tip = {
		76516,
		143,
		true
	},
	friend_searchFriend_wait_time = {
		76659,
		125,
		true
	},
	lesson_classOver_error = {
		76784,
		105,
		true
	},
	lesson_endToLearn_error = {
		76889,
		106,
		true
	},
	lesson_startToLearn_error = {
		76995,
		102,
		true
	},
	tactics_lesson_cancel = {
		77097,
		239,
		true
	},
	tactics_lesson_system_introduce = {
		77336,
		287,
		true
	},
	tactics_lesson_start_tip = {
		77623,
		246,
		true
	},
	tactics_noskill_erro = {
		77869,
		111,
		true
	},
	tactics_max_level = {
		77980,
		108,
		true
	},
	tactics_end_to_learn = {
		78088,
		233,
		true
	},
	tactics_continue_to_learn = {
		78321,
		148,
		true
	},
	tactics_should_exist_skill = {
		78469,
		117,
		true
	},
	tactics_skill_level_up = {
		78586,
		119,
		true
	},
	tactics_no_lesson = {
		78705,
		111,
		true
	},
	tactics_lesson_full = {
		78816,
		107,
		true
	},
	tactics_lesson_repeated = {
		78923,
		117,
		true
	},
	login_gate_not_ready = {
		79040,
		123,
		true
	},
	login_game_not_ready = {
		79163,
		123,
		true
	},
	login_game_rigister_full = {
		79286,
		115,
		true
	},
	login_game_login_full = {
		79401,
		188,
		true
	},
	login_game_banned = {
		79589,
		114,
		true
	},
	login_game_frequence = {
		79703,
		139,
		true
	},
	login_createNewPlayer_full = {
		79842,
		117,
		true
	},
	login_createNewPlayer_error = {
		79959,
		104,
		true
	},
	login_createNewPlayer_error_nameNull = {
		80063,
		134,
		true
	},
	login_newPlayerScene_word_lingBo = {
		80197,
		233,
		true
	},
	login_newPlayerScene_word_yingHuoChong = {
		80430,
		202,
		true
	},
	login_newPlayerScene_word_laFei = {
		80632,
		183,
		true
	},
	login_newPlayerScene_word_biaoqiang = {
		80815,
		190,
		true
	},
	login_newPlayerScene_word_z23 = {
		81005,
		187,
		true
	},
	login_newPlayerScene_randomName = {
		81192,
		138,
		true
	},
	login_newPlayerScene_error_notChoiseShip = {
		81330,
		141,
		true
	},
	login_newPlayerScene_inputName = {
		81471,
		127,
		true
	},
	login_loginMediator_kickOtherLogin = {
		81598,
		141,
		true
	},
	login_loginMediator_kickServerClose = {
		81739,
		139,
		true
	},
	login_loginMediator_kickIntError = {
		81878,
		139,
		true
	},
	login_loginMediator_kickTimeError = {
		82017,
		152,
		true
	},
	login_loginMediator_vertifyFail = {
		82169,
		117,
		true
	},
	login_loginMediator_dataExpired = {
		82286,
		128,
		true
	},
	login_loginMediator_kickLoginOut = {
		82414,
		142,
		true
	},
	login_loginMediator_serverLoginErro = {
		82556,
		127,
		true
	},
	login_loginMediator_kickUndefined = {
		82683,
		133,
		true
	},
	login_loginMediator_loginSuccess = {
		82816,
		120,
		true
	},
	login_loginMediator_quest_RegisterSuccess = {
		82936,
		145,
		true
	},
	login_loginMediator_registerFail_error = {
		83081,
		115,
		true
	},
	login_loginMediator_userLoginFail_error = {
		83196,
		116,
		true
	},
	login_loginMediator_serverLoginFail_error = {
		83312,
		134,
		true
	},
	login_loginScene_error_noUserName = {
		83446,
		131,
		true
	},
	login_loginScene_error_noPassword = {
		83577,
		140,
		true
	},
	login_loginScene_error_diffPassword = {
		83717,
		142,
		true
	},
	login_loginScene_error_noMailBox = {
		83859,
		145,
		true
	},
	login_loginScene_choiseServer = {
		84004,
		133,
		true
	},
	login_loginScene_server_vindicate = {
		84137,
		124,
		true
	},
	login_loginScene_server_full = {
		84261,
		119,
		true
	},
	login_loginScene_server_disabled = {
		84380,
		133,
		true
	},
	login_register_full = {
		84513,
		110,
		true
	},
	system_database_busy = {
		84623,
		181,
		true
	},
	mail_getMailList_error_noNewMail = {
		84804,
		133,
		true
	},
	mail_takeAttachment_error_noMail = {
		84937,
		126,
		true
	},
	mail_takeAttachment_error_noAttach = {
		85063,
		156,
		true
	},
	mail_takeAttachment_error_noWorld = {
		85219,
		203,
		true
	},
	mail_takeAttachment_error_reWorld = {
		85422,
		273,
		true
	},
	mail_count = {
		85695,
		97,
		true
	},
	mail_takeAttachment_error_magazine_full = {
		85792,
		190,
		true
	},
	mail_takeAttachment_error_dockYrad_full = {
		85982,
		187,
		true
	},
	mail_confirm_set_important_flag = {
		86169,
		128,
		true
	},
	mail_confirm_cancel_important_flag = {
		86297,
		138,
		true
	},
	main_mailLayer_mailBoxClear = {
		86435,
		137,
		true
	},
	main_mailLayer_noNewMail = {
		86572,
		124,
		true
	},
	main_mailLayer_takeAttach = {
		86696,
		101,
		true
	},
	main_mailLayer_noAttach = {
		86797,
		99,
		true
	},
	main_mailLayer_attachTaken = {
		86896,
		111,
		true
	},
	main_mailLayer_quest_clear = {
		87007,
		232,
		true
	},
	main_mailLayer_quest_deleteNotTakeAttach = {
		87239,
		207,
		true
	},
	main_mailLayer_quest_deleteNotRead = {
		87446,
		183,
		true
	},
	main_mailMediator_mailDelete = {
		87629,
		110,
		true
	},
	main_mailMediator_attachTaken = {
		87739,
		136,
		true
	},
	main_mailMediator_notingToTake = {
		87875,
		140,
		true
	},
	main_mailMediator_takeALot = {
		88015,
		117,
		true
	},
	main_navalAcademyScene_systemClose = {
		88132,
		147,
		true
	},
	main_navalAcademyScene_quest_startClass = {
		88279,
		191,
		true
	},
	main_navalAcademyScene_quest_stopClass = {
		88470,
		103,
		true
	},
	main_navalAcademyScene_quest_Classover_long = {
		88573,
		108,
		true
	},
	main_navalAcademyScene_quest_Classover_short = {
		88681,
		109,
		true
	},
	main_navalAcademyScene_upgrade_complete = {
		88790,
		136,
		true
	},
	main_navalAcademyScene_class_upgrade_complete = {
		88926,
		123,
		true
	},
	main_navalAcademyScene_work_done = {
		89049,
		130,
		true
	},
	main_notificationLayer_searchInput = {
		89179,
		141,
		true
	},
	main_notificationLayer_noInput = {
		89320,
		137,
		true
	},
	main_notificationLayer_noFriend = {
		89457,
		116,
		true
	},
	main_notificationLayer_deleteFriend = {
		89573,
		111,
		true
	},
	main_notificationLayer_sendButton = {
		89684,
		118,
		true
	},
	main_notificationLayer_addFriendError_addSelf = {
		89802,
		164,
		true
	},
	main_notificationLayer_addFriendError_friendAlready = {
		89966,
		164,
		true
	},
	main_notificationLayer_quest_deletFriend = {
		90130,
		172,
		true
	},
	main_notificationLayer_quest_request = {
		90302,
		161,
		true
	},
	main_notificationLayer_enter_room = {
		90463,
		153,
		true
	},
	main_notificationLayer_not_roomId = {
		90616,
		143,
		true
	},
	main_notificationLayer_roomId_invaild = {
		90759,
		132,
		true
	},
	main_notificationMediator_sendFriendRequest = {
		90891,
		141,
		true
	},
	main_notificationMediator_beFriend = {
		91032,
		157,
		true
	},
	main_notificationMediator_deleteFriend = {
		91189,
		170,
		true
	},
	main_notificationMediator_room_max_number = {
		91359,
		136,
		true
	},
	main_playerInfoLayer_inputName = {
		91495,
		127,
		true
	},
	main_playerInfoLayer_inputManifesto = {
		91622,
		139,
		true
	},
	main_playerInfoLayer_quest_changeName = {
		91761,
		179,
		true
	},
	main_playerInfoLayer_error_changeNameNoGem = {
		91940,
		121,
		true
	},
	main_settingsScene_quest_exist = {
		92061,
		124,
		true
	},
	coloring_color_missmatch = {
		92185,
		149,
		true
	},
	coloring_color_not_enough = {
		92334,
		122,
		true
	},
	coloring_erase_all_warning = {
		92456,
		211,
		true
	},
	coloring_erase_warning = {
		92667,
		238,
		true
	},
	coloring_lock = {
		92905,
		86,
		true
	},
	coloring_wait_open = {
		92991,
		91,
		true
	},
	coloring_help_tip = {
		93082,
		1240,
		true
	},
	link_link_help_tip = {
		94322,
		1461,
		true
	},
	player_changeManifesto_ok = {
		95783,
		122,
		true
	},
	player_changeManifesto_error = {
		95905,
		117,
		true
	},
	player_changePlayerIcon_ok = {
		96022,
		123,
		true
	},
	player_changePlayerIcon_error = {
		96145,
		131,
		true
	},
	player_changePlayerName_ok = {
		96276,
		117,
		true
	},
	player_changePlayerName_error = {
		96393,
		112,
		true
	},
	player_changePlayerName_error_2015 = {
		96505,
		135,
		true
	},
	player_harvestResource_error = {
		96640,
		111,
		true
	},
	player_harvestResource_error_fullBag = {
		96751,
		146,
		true
	},
	player_change_chat_room_erro = {
		96897,
		114,
		true
	},
	prop_destroyProp_error_noItem = {
		97011,
		126,
		true
	},
	prop_destroyProp_error_canNotSell = {
		97137,
		140,
		true
	},
	prop_destroyProp_error_notEnoughItem = {
		97277,
		146,
		true
	},
	prop_destroyProp_error = {
		97423,
		99,
		true
	},
	resourceSite_error_noSite = {
		97522,
		116,
		true
	},
	resourceSite_beginScanMap_ok = {
		97638,
		104,
		true
	},
	resourceSite_beginScanMap_error = {
		97742,
		108,
		true
	},
	resourceSite_collectResource_error = {
		97850,
		117,
		true
	},
	resourceSite_finishResourceSite_error = {
		97967,
		126,
		true
	},
	resourceSite_startResourceSite_error = {
		98093,
		119,
		true
	},
	ship_error_noShip = {
		98212,
		133,
		true
	},
	ship_addStarExp_error = {
		98345,
		107,
		true
	},
	ship_buildShip_error = {
		98452,
		97,
		true
	},
	ship_buildShip_error_noTemplate = {
		98549,
		155,
		true
	},
	ship_buildShip_error_notEnoughItem = {
		98704,
		128,
		true
	},
	ship_buildShipImmediately_error = {
		98832,
		114,
		true
	},
	ship_buildShipImmediately_error_noSHip = {
		98946,
		136,
		true
	},
	ship_buildShipImmediately_error_finished = {
		99082,
		132,
		true
	},
	ship_buildShipImmediately_error_noItem = {
		99214,
		136,
		true
	},
	ship_buildShip_not_position = {
		99350,
		118,
		true
	},
	ship_buildBatchShip = {
		99468,
		179,
		true
	},
	ship_buildSingleShip = {
		99647,
		179,
		true
	},
	ship_buildShip_succeed = {
		99826,
		110,
		true
	},
	ship_buildShip_list_empty = {
		99936,
		119,
		true
	},
	ship_buildship_tip = {
		100055,
		207,
		true
	},
	ship_destoryShips_error = {
		100262,
		100,
		true
	},
	ship_equipToShip_ok = {
		100362,
		153,
		true
	},
	ship_equipToShip_error = {
		100515,
		105,
		true
	},
	ship_equipToShip_error_noEquip = {
		100620,
		121,
		true
	},
	ship_equip_check = {
		100741,
		132,
		true
	},
	ship_getShip_error = {
		100873,
		95,
		true
	},
	ship_getShip_error_noShip = {
		100968,
		122,
		true
	},
	ship_getShip_error_notFinish = {
		101090,
		125,
		true
	},
	ship_getShip_error_full = {
		101215,
		135,
		true
	},
	ship_modShip_error = {
		101350,
		95,
		true
	},
	ship_modShip_error_notEnoughGold = {
		101445,
		150,
		true
	},
	ship_remouldShip_error = {
		101595,
		105,
		true
	},
	ship_unequipFromShip_ok = {
		101700,
		145,
		true
	},
	ship_unequipFromShip_error = {
		101845,
		109,
		true
	},
	ship_unequipFromShip_error_noEquip = {
		101954,
		122,
		true
	},
	ship_unequip_all_tip = {
		102076,
		117,
		true
	},
	ship_unequip_all_success = {
		102193,
		112,
		true
	},
	ship_updateShipLock_ok_lock = {
		102305,
		141,
		true
	},
	ship_updateShipLock_ok_unlock = {
		102446,
		149,
		true
	},
	ship_updateShipLock_error = {
		102595,
		121,
		true
	},
	ship_upgradeStar_error = {
		102716,
		105,
		true
	},
	ship_upgradeStar_error_4010 = {
		102821,
		143,
		true
	},
	ship_upgradeStar_error_lvLimit = {
		102964,
		146,
		true
	},
	ship_upgradeStar_error_noEnoughMatrail = {
		103110,
		133,
		true
	},
	ship_upgradeStar_notConfig = {
		103243,
		164,
		true
	},
	ship_upgradeStar_maxLevel = {
		103407,
		128,
		true
	},
	ship_upgradeStar_select_material_tip = {
		103535,
		140,
		true
	},
	ship_exchange_question = {
		103675,
		191,
		true
	},
	ship_exchange_medalCount_noEnough = {
		103866,
		127,
		true
	},
	ship_exchange_erro = {
		103993,
		144,
		true
	},
	ship_exchange_confirm = {
		104137,
		167,
		true
	},
	ship_exchange_tip = {
		104304,
		339,
		true
	},
	ship_vo_fighting = {
		104643,
		107,
		true
	},
	ship_vo_event = {
		104750,
		116,
		true
	},
	ship_vo_isCharacter = {
		104866,
		116,
		true
	},
	ship_vo_inBackyardRest = {
		104982,
		113,
		true
	},
	ship_vo_inClass = {
		105095,
		109,
		true
	},
	ship_vo_moveout_backyard = {
		105204,
		118,
		true
	},
	ship_vo_moveout_formation = {
		105322,
		119,
		true
	},
	ship_vo_mainFleet_must_hasShip = {
		105441,
		140,
		true
	},
	ship_vo_vanguardFleet_must_hasShip = {
		105581,
		144,
		true
	},
	ship_vo_getWordsUndefined = {
		105725,
		132,
		true
	},
	ship_vo_locked = {
		105857,
		105,
		true
	},
	ship_vo_mainFleet_exist_same_ship = {
		105962,
		146,
		true
	},
	ship_vo_vanguardFleet_exist_same_ship = {
		106108,
		150,
		true
	},
	ship_buildShipMediator_startBuild = {
		106258,
		109,
		true
	},
	ship_buildShipMediator_finishBuild = {
		106367,
		110,
		true
	},
	ship_buildShipScene_quest_quickFinish = {
		106477,
		207,
		true
	},
	ship_dockyardMediator_destroy = {
		106684,
		105,
		true
	},
	ship_dockyardScene_capacity = {
		106789,
		101,
		true
	},
	ship_dockyardScene_noRole = {
		106890,
		119,
		true
	},
	ship_dockyardScene_error_choiseRoleMore = {
		107009,
		164,
		true
	},
	ship_dockyardScene_error_choiseRoleLess = {
		107173,
		155,
		true
	},
	ship_formationMediator_leastLimit = {
		107328,
		158,
		true
	},
	ship_formationMediator_changeNameSuccess = {
		107486,
		125,
		true
	},
	ship_formationMediator_changeNameError_sameShip = {
		107611,
		145,
		true
	},
	ship_formationMediator_addShipError_overlimit = {
		107756,
		193,
		true
	},
	ship_formationMediator_replaceError_onlyShip = {
		107949,
		233,
		true
	},
	ship_formationMediator_quest_replace = {
		108182,
		205,
		true
	},
	ship_formationMediaror_trash_warning = {
		108387,
		213,
		true
	},
	ship_formationUI_fleetName1 = {
		108600,
		103,
		true
	},
	ship_formationUI_fleetName2 = {
		108703,
		103,
		true
	},
	ship_formationUI_fleetName3 = {
		108806,
		103,
		true
	},
	ship_formationUI_fleetName4 = {
		108909,
		103,
		true
	},
	ship_formationUI_fleetName5 = {
		109012,
		103,
		true
	},
	ship_formationUI_fleetName6 = {
		109115,
		103,
		true
	},
	ship_formationUI_fleetName11 = {
		109218,
		110,
		true
	},
	ship_formationUI_fleetName12 = {
		109328,
		110,
		true
	},
	ship_formationUI_exercise_fleetName = {
		109438,
		111,
		true
	},
	ship_formationUI_fleetName_world = {
		109549,
		114,
		true
	},
	ship_formationUI_changeFormationError_flag = {
		109663,
		155,
		true
	},
	ship_formationUI_changeFormationError_countError = {
		109818,
		146,
		true
	},
	ship_formationUI_removeError_onlyShip = {
		109964,
		184,
		true
	},
	ship_formationUI_quest_remove = {
		110148,
		152,
		true
	},
	ship_newShipLayer_get = {
		110300,
		146,
		true
	},
	ship_newSkinLayer_get = {
		110446,
		181,
		true
	},
	ship_newSkin_name = {
		110627,
		112,
		true
	},
	ship_shipInfoMediator_destory = {
		110739,
		105,
		true
	},
	ship_shipInfoScene_equipUnlockSlostContent = {
		110844,
		137,
		true
	},
	ship_shipInfoScene_equipUnlockSlostYesText = {
		110981,
		118,
		true
	},
	ship_shipInfoScene_effect = {
		111099,
		128,
		true
	},
	ship_shipInfoScene_effect1or2 = {
		111227,
		126,
		true
	},
	ship_shipInfoScene_modLvMax = {
		111353,
		124,
		true
	},
	ship_shipInfoScene_choiseMod = {
		111477,
		132,
		true
	},
	ship_shipModLayer_effect = {
		111609,
		127,
		true
	},
	ship_shipModLayer_effect1or2 = {
		111736,
		132,
		true
	},
	ship_shipModLayer_modSuccess = {
		111868,
		104,
		true
	},
	ship_mod_no_addition_tip = {
		111972,
		152,
		true
	},
	ship_shipModMediator_choiseMaterial = {
		112124,
		133,
		true
	},
	ship_shipModMediator_noticeLvOver1 = {
		112257,
		108,
		true
	},
	ship_shipModMediator_noticeStarOver4 = {
		112365,
		110,
		true
	},
	ship_shipModMediator_noticeSameButLargerStar = {
		112475,
		123,
		true
	},
	ship_shipModMediator_quest = {
		112598,
		173,
		true
	},
	ship_shipUpgradeLayer2_levelError = {
		112771,
		117,
		true
	},
	ship_shipUpgradeLayer2_noMaterail = {
		112888,
		127,
		true
	},
	ship_shipUpgradeLayer2_ok = {
		113015,
		122,
		true
	},
	ship_shipUpgradeLayer2_effect = {
		113137,
		133,
		true
	},
	ship_shipUpgradeLayer2_effect1or2 = {
		113270,
		134,
		true
	},
	ship_shipUpgradeLayer2_mod_uncommon_tip = {
		113404,
		184,
		true
	},
	ship_shipUpgradeLayer2_uncommon_tip = {
		113588,
		180,
		true
	},
	ship_shipUpgradeLayer2_mod_advanced_tip = {
		113768,
		202,
		true
	},
	ship_shipUpgradeLayer2_advanced_tip = {
		113970,
		198,
		true
	},
	ship_mod_exp_to_attr_tip = {
		114168,
		126,
		true
	},
	ship_max_star = {
		114294,
		104,
		true
	},
	ship_skill_unlock_tip = {
		114398,
		103,
		true
	},
	ship_lock_tip = {
		114501,
		110,
		true
	},
	ship_destroy_uncommon_tip = {
		114611,
		161,
		true
	},
	ship_destroy_advanced_tip = {
		114772,
		188,
		true
	},
	ship_energy_mid_desc = {
		114960,
		132,
		true
	},
	ship_energy_low_desc = {
		115092,
		165,
		true
	},
	ship_energy_low_warn = {
		115257,
		216,
		true
	},
	ship_energy_low_warn_no_exp = {
		115473,
		299,
		true
	},
	test_ship_intensify_tip = {
		115772,
		117,
		true
	},
	test_ship_upgrade_tip = {
		115889,
		121,
		true
	},
	shop_buyItem_ok = {
		116010,
		131,
		true
	},
	shop_buyItem_error = {
		116141,
		95,
		true
	},
	shop_extendMagazine_error = {
		116236,
		108,
		true
	},
	shop_entendShipYard_error = {
		116344,
		111,
		true
	},
	spweapon_attr_effect = {
		116455,
		96,
		true
	},
	spweapon_attr_skillupgrade = {
		116551,
		105,
		true
	},
	spweapon_help_storage = {
		116656,
		3790,
		true
	},
	spweapon_tip_upgrade = {
		120446,
		139,
		true
	},
	spweapon_tip_attr_modify = {
		120585,
		200,
		true
	},
	spweapon_tip_materal_no_enough = {
		120785,
		124,
		true
	},
	spweapon_tip_gold_no_enough = {
		120909,
		121,
		true
	},
	spweapon_tip_pt_no_enough = {
		121030,
		153,
		true
	},
	spweapon_tip_creatept_no_enough = {
		121183,
		153,
		true
	},
	spweapon_tip_bag_no_enough = {
		121336,
		136,
		true
	},
	spweapon_tip_create_sussess = {
		121472,
		156,
		true
	},
	spweapon_tip_group_error = {
		121628,
		124,
		true
	},
	spweapon_tip_breakout_overflow = {
		121752,
		186,
		true
	},
	spweapon_tip_breakout_materal_check = {
		121938,
		157,
		true
	},
	spweapon_tip_transform_materal_check = {
		122095,
		152,
		true
	},
	spweapon_tip_transform_attrmax = {
		122247,
		127,
		true
	},
	spweapon_tip_locked = {
		122374,
		138,
		true
	},
	spweapon_tip_unload = {
		122512,
		125,
		true
	},
	spweapon_tip_sail_locked = {
		122637,
		164,
		true
	},
	spweapon_ui_level = {
		122801,
		96,
		true
	},
	spweapon_ui_levelmax = {
		122897,
		102,
		true
	},
	spweapon_ui_levelmax2 = {
		122999,
		121,
		true
	},
	spweapon_ui_need_resource = {
		123120,
		104,
		true
	},
	spweapon_ui_ptitem = {
		123224,
		91,
		true
	},
	spweapon_ui_spweapon = {
		123315,
		96,
		true
	},
	spweapon_ui_transform = {
		123411,
		97,
		true
	},
	spweapon_ui_transform_attr_text = {
		123508,
		226,
		true
	},
	spweapon_ui_keep_attr = {
		123734,
		97,
		true
	},
	spweapon_ui_change_attr = {
		123831,
		99,
		true
	},
	spweapon_ui_autoselect = {
		123930,
		98,
		true
	},
	spweapon_ui_cancelselect = {
		124028,
		100,
		true
	},
	spweapon_ui_index_shipType_quZhu = {
		124128,
		102,
		true
	},
	spweapon_ui_index_shipType_qinXun = {
		124230,
		103,
		true
	},
	spweapon_ui_index_shipType_zhongXun = {
		124333,
		105,
		true
	},
	spweapon_ui_index_shipType_zhanLie = {
		124438,
		104,
		true
	},
	spweapon_ui_index_shipType_hangMu = {
		124542,
		103,
		true
	},
	spweapon_ui_index_shipType_weiXiu = {
		124645,
		103,
		true
	},
	spweapon_ui_index_shipType_qianTing = {
		124748,
		105,
		true
	},
	spweapon_ui_index_shipType_other = {
		124853,
		105,
		true
	},
	spweapon_ui_keep_attr_text1 = {
		124958,
		169,
		true
	},
	spweapon_ui_keep_attr_text2 = {
		125127,
		154,
		true
	},
	spweapon_ui_change_attr_text1 = {
		125281,
		162,
		true
	},
	spweapon_ui_change_attr_text2 = {
		125443,
		189,
		true
	},
	spweapon_ui_create_exp = {
		125632,
		119,
		true
	},
	spweapon_ui_upgrade_exp = {
		125751,
		118,
		true
	},
	spweapon_ui_breakout_exp = {
		125869,
		121,
		true
	},
	spweapon_ui_create = {
		125990,
		88,
		true
	},
	spweapon_ui_storage = {
		126078,
		89,
		true
	},
	spweapon_ui_empty = {
		126167,
		111,
		true
	},
	spweapon_ui_create_button = {
		126278,
		101,
		true
	},
	spweapon_ui_helptext = {
		126379,
		384,
		true
	},
	spweapon_ui_effect_tag = {
		126763,
		104,
		true
	},
	spweapon_ui_skill_tag = {
		126867,
		100,
		true
	},
	spweapon_activity_ui_text1 = {
		126967,
		203,
		true
	},
	spweapon_activity_ui_text2 = {
		127170,
		194,
		true
	},
	spweapon_tip_skill_locked = {
		127364,
		104,
		true
	},
	spweapon_tip_owned = {
		127468,
		96,
		true
	},
	spweapon_tip_view = {
		127564,
		151,
		true
	},
	spweapon_tip_ship = {
		127715,
		93,
		true
	},
	spweapon_tip_type = {
		127808,
		93,
		true
	},
	stage_beginStage_error = {
		127901,
		111,
		true
	},
	stage_beginStage_error_fleetEmpty = {
		128012,
		140,
		true
	},
	stage_beginStage_error_teamEmpty = {
		128152,
		180,
		true
	},
	stage_beginStage_error_noEnergy = {
		128332,
		144,
		true
	},
	stage_beginStage_error_noResource = {
		128476,
		146,
		true
	},
	stage_beginStage_error_noTicket = {
		128622,
		125,
		true
	},
	stage_finishStage_error = {
		128747,
		142,
		true
	},
	levelScene_map_lock = {
		128889,
		132,
		true
	},
	levelScene_chapter_lock = {
		129021,
		142,
		true
	},
	levelScene_chapter_strategying = {
		129163,
		142,
		true
	},
	levelScene_threat_to_rule_out = {
		129305,
		131,
		true
	},
	levelScene_whether_to_retreat = {
		129436,
		145,
		true
	},
	levelScene_who_to_retreat = {
		129581,
		118,
		true
	},
	levelScene_who_to_exchange = {
		129699,
		133,
		true
	},
	levelScene_time_out = {
		129832,
		101,
		true
	},
	levelScene_nothing = {
		129933,
		112,
		true
	},
	levelScene_notCargo = {
		130045,
		122,
		true
	},
	levelScene_openCargo_erro = {
		130167,
		111,
		true
	},
	levelScene_chapter_notInStrategy = {
		130278,
		120,
		true
	},
	levelScene_retreat_erro = {
		130398,
		100,
		true
	},
	levelScene_strategying = {
		130498,
		101,
		true
	},
	levelScene_tracking_erro = {
		130599,
		94,
		true
	},
	levelScene_tracking_error_3001 = {
		130693,
		143,
		true
	},
	levelScene_chapter_unlock_tip = {
		130836,
		139,
		true
	},
	levelScene_chapter_win = {
		130975,
		128,
		true
	},
	levelScene_sham_win = {
		131103,
		113,
		true
	},
	levelScene_escort_win = {
		131216,
		155,
		true
	},
	levelScene_escort_lose = {
		131371,
		144,
		true
	},
	levelScene_escort_help_tip = {
		131515,
		1399,
		true
	},
	levelScene_escort_retreat = {
		132914,
		237,
		true
	},
	levelScene_oni_retreat = {
		133151,
		224,
		true
	},
	levelScene_oni_win = {
		133375,
		106,
		true
	},
	levelScene_oni_lose = {
		133481,
		150,
		true
	},
	levelScene_bomb_retreat = {
		133631,
		180,
		true
	},
	levelScene_sphunt_help_tip = {
		133811,
		497,
		true
	},
	levelScene_bomb_help_tip = {
		134308,
		341,
		true
	},
	levelScene_chapter_timeout = {
		134649,
		139,
		true
	},
	levelScene_chapter_level_limit = {
		134788,
		149,
		true
	},
	levelScene_chapter_count_tip = {
		134937,
		107,
		true
	},
	levelScene_tracking_error_retry = {
		135044,
		135,
		true
	},
	levelScene_destroy_torpedo = {
		135179,
		117,
		true
	},
	levelScene_new_chapter_coming = {
		135296,
		105,
		true
	},
	levelScene_chapter_open_count_down = {
		135401,
		110,
		true
	},
	levelScene_chapter_not_open = {
		135511,
		100,
		true
	},
	levelScene_activate_remaster = {
		135611,
		225,
		true
	},
	levelScene_remaster_tickets_not_enough = {
		135836,
		142,
		true
	},
	levelScene_remaster_do_not_open = {
		135978,
		128,
		true
	},
	levelScene_remaster_help_tip = {
		136106,
		1574,
		true
	},
	levelScene_activate_loop_mode_failed = {
		137680,
		183,
		true
	},
	levelScene_coastalgun_help_tip = {
		137863,
		355,
		true
	},
	levelScene_select_SP_OP = {
		138218,
		117,
		true
	},
	levelScene_unselect_SP_OP = {
		138335,
		119,
		true
	},
	levelScene_select_SP_OP_reminder = {
		138454,
		296,
		true
	},
	tack_tickets_max_warning = {
		138750,
		303,
		true
	},
	world_battle_count = {
		139053,
		112,
		true
	},
	world_fleetName1 = {
		139165,
		95,
		true
	},
	world_fleetName2 = {
		139260,
		95,
		true
	},
	world_fleetName3 = {
		139355,
		95,
		true
	},
	world_fleetName4 = {
		139450,
		95,
		true
	},
	world_fleetName5 = {
		139545,
		95,
		true
	},
	world_ship_repair_1 = {
		139640,
		154,
		true
	},
	world_ship_repair_2 = {
		139794,
		154,
		true
	},
	world_ship_repair_all = {
		139948,
		174,
		true
	},
	world_ship_repair_no_need = {
		140122,
		135,
		true
	},
	world_event_teleport_alter = {
		140257,
		190,
		true
	},
	world_transport_battle_alter = {
		140447,
		180,
		true
	},
	world_transport_locked = {
		140627,
		201,
		true
	},
	world_target_count = {
		140828,
		109,
		true
	},
	world_target_filter_tip1 = {
		140937,
		97,
		true
	},
	world_target_filter_tip2 = {
		141034,
		97,
		true
	},
	world_target_get_all = {
		141131,
		142,
		true
	},
	world_target_goto = {
		141273,
		96,
		true
	},
	world_help_tip = {
		141369,
		136,
		true
	},
	world_dangerbattle_confirm = {
		141505,
		203,
		true
	},
	world_stamina_exchange = {
		141708,
		213,
		true
	},
	world_stamina_not_enough = {
		141921,
		131,
		true
	},
	world_stamina_recover = {
		142052,
		216,
		true
	},
	world_stamina_text = {
		142268,
		217,
		true
	},
	world_stamina_text2 = {
		142485,
		176,
		true
	},
	world_stamina_resetwarning = {
		142661,
		492,
		true
	},
	world_ship_healthy = {
		143153,
		165,
		true
	},
	world_map_dangerous = {
		143318,
		95,
		true
	},
	world_map_not_open = {
		143413,
		121,
		true
	},
	world_map_locked_stage = {
		143534,
		125,
		true
	},
	world_map_locked_border = {
		143659,
		133,
		true
	},
	world_item_allocate_panel_fleet_info_text = {
		143792,
		117,
		true
	},
	world_redeploy_not_change = {
		143909,
		207,
		true
	},
	world_redeploy_warn = {
		144116,
		195,
		true
	},
	world_redeploy_cost_tip = {
		144311,
		310,
		true
	},
	world_redeploy_tip = {
		144621,
		124,
		true
	},
	world_fleet_choose = {
		144745,
		224,
		true
	},
	world_fleet_formation_not_valid = {
		144969,
		134,
		true
	},
	world_fleet_in_vortex = {
		145103,
		203,
		true
	},
	world_stage_help = {
		145306,
		218,
		true
	},
	world_transport_disable = {
		145524,
		136,
		true
	},
	world_ap = {
		145660,
		81,
		true
	},
	world_resource_tip_1 = {
		145741,
		111,
		true
	},
	world_resource_tip_2 = {
		145852,
		111,
		true
	},
	world_instruction_all_1 = {
		145963,
		136,
		true
	},
	world_instruction_help_1 = {
		146099,
		1236,
		true
	},
	world_instruction_redeploy_1 = {
		147335,
		147,
		true
	},
	world_instruction_redeploy_2 = {
		147482,
		156,
		true
	},
	world_instruction_redeploy_3 = {
		147638,
		180,
		true
	},
	world_instruction_morale_1 = {
		147818,
		219,
		true
	},
	world_instruction_morale_2 = {
		148037,
		120,
		true
	},
	world_instruction_morale_3 = {
		148157,
		126,
		true
	},
	world_instruction_morale_4 = {
		148283,
		166,
		true
	},
	world_instruction_submarine_1 = {
		148449,
		142,
		true
	},
	world_instruction_submarine_2 = {
		148591,
		154,
		true
	},
	world_instruction_submarine_3 = {
		148745,
		136,
		true
	},
	world_instruction_submarine_4 = {
		148881,
		166,
		true
	},
	world_instruction_submarine_5 = {
		149047,
		142,
		true
	},
	world_instruction_submarine_6 = {
		149189,
		211,
		true
	},
	world_instruction_submarine_7 = {
		149400,
		181,
		true
	},
	world_instruction_submarine_8 = {
		149581,
		190,
		true
	},
	world_instruction_submarine_9 = {
		149771,
		185,
		true
	},
	world_instruction_submarine_10 = {
		149956,
		144,
		true
	},
	world_instruction_submarine_11 = {
		150100,
		140,
		true
	},
	world_instruction_detect_1 = {
		150240,
		151,
		true
	},
	world_instruction_detect_2 = {
		150391,
		120,
		true
	},
	world_instruction_supply_1 = {
		150511,
		174,
		true
	},
	world_instruction_supply_2 = {
		150685,
		138,
		true
	},
	world_instruction_port_goods_locked = {
		150823,
		120,
		true
	},
	world_port_inbattle = {
		150943,
		138,
		true
	},
	world_item_recycle_1 = {
		151081,
		169,
		true
	},
	world_item_recycle_2 = {
		151250,
		166,
		true
	},
	world_item_origin = {
		151416,
		93,
		true
	},
	world_shop_bag_unactivated = {
		151509,
		184,
		true
	},
	world_shop_preview_tip = {
		151693,
		125,
		true
	},
	world_shop_init_notice = {
		151818,
		177,
		true
	},
	world_map_title_tips_en = {
		151995,
		101,
		true
	},
	world_map_title_tips = {
		152096,
		96,
		true
	},
	world_mapbuff_attrtxt_1 = {
		152192,
		99,
		true
	},
	world_mapbuff_attrtxt_2 = {
		152291,
		99,
		true
	},
	world_mapbuff_attrtxt_3 = {
		152390,
		99,
		true
	},
	world_mapbuff_compare_txt = {
		152489,
		101,
		true
	},
	world_wind_move = {
		152590,
		179,
		true
	},
	world_battle_pause = {
		152769,
		91,
		true
	},
	world_battle_pause2 = {
		152860,
		104,
		true
	},
	world_task_samemap = {
		152964,
		182,
		true
	},
	world_task_maplock = {
		153146,
		242,
		true
	},
	world_task_goto0 = {
		153388,
		138,
		true
	},
	world_task_goto3 = {
		153526,
		141,
		true
	},
	world_task_view1 = {
		153667,
		98,
		true
	},
	world_task_view2 = {
		153765,
		98,
		true
	},
	world_task_view3 = {
		153863,
		86,
		true
	},
	world_task_refuse1 = {
		153949,
		140,
		true
	},
	world_daily_task_lock = {
		154089,
		171,
		true
	},
	world_daily_task_none = {
		154260,
		131,
		true
	},
	world_daily_task_none_2 = {
		154391,
		118,
		true
	},
	world_sairen_title = {
		154509,
		106,
		true
	},
	world_sairen_description1 = {
		154615,
		155,
		true
	},
	world_sairen_description2 = {
		154770,
		155,
		true
	},
	world_sairen_description3 = {
		154925,
		155,
		true
	},
	world_low_morale = {
		155080,
		299,
		true
	},
	world_recycle_notice = {
		155379,
		181,
		true
	},
	world_recycle_item_transform = {
		155560,
		226,
		true
	},
	world_exit_tip = {
		155786,
		114,
		true
	},
	world_consume_carry_tips = {
		155900,
		100,
		true
	},
	world_boss_help_meta = {
		156000,
		3723,
		true
	},
	world_close = {
		159723,
		117,
		true
	},
	world_catsearch_success = {
		159840,
		142,
		true
	},
	world_catsearch_stop = {
		159982,
		215,
		true
	},
	world_catsearch_fleetcheck = {
		160197,
		264,
		true
	},
	world_catsearch_leavemap = {
		160461,
		262,
		true
	},
	world_catsearch_help_1 = {
		160723,
		232,
		true
	},
	world_catsearch_help_2 = {
		160955,
		104,
		true
	},
	world_catsearch_help_3 = {
		161059,
		278,
		true
	},
	world_catsearch_help_4 = {
		161337,
		95,
		true
	},
	world_catsearch_help_5 = {
		161432,
		171,
		true
	},
	world_catsearch_help_6 = {
		161603,
		138,
		true
	},
	world_level_prefix = {
		161741,
		87,
		true
	},
	world_map_level = {
		161828,
		306,
		true
	},
	world_movelimit_event_text = {
		162134,
		184,
		true
	},
	world_mapbuff_tip = {
		162318,
		114,
		true
	},
	world_sametask_tip = {
		162432,
		176,
		true
	},
	world_expedition_reward_display = {
		162608,
		107,
		true
	},
	world_expedition_reward_display2 = {
		162715,
		102,
		true
	},
	world_complete_item_tip = {
		162817,
		160,
		true
	},
	task_notfound_error = {
		162977,
		150,
		true
	},
	task_submitTask_error = {
		163127,
		104,
		true
	},
	task_submitTask_error_client = {
		163231,
		110,
		true
	},
	task_submitTask_error_notFinish = {
		163341,
		138,
		true
	},
	task_taskMediator_getItem = {
		163479,
		158,
		true
	},
	task_taskMediator_getResource = {
		163637,
		162,
		true
	},
	task_taskMediator_getEquip = {
		163799,
		159,
		true
	},
	task_target_chapter_in_progress = {
		163958,
		153,
		true
	},
	task_level_notenough = {
		164111,
		119,
		true
	},
	loading_tip_ShaderMgr = {
		164230,
		115,
		true
	},
	loading_tip_FontMgr = {
		164345,
		122,
		true
	},
	loading_tip_TipsMgr = {
		164467,
		113,
		true
	},
	loading_tip_MsgboxMgr = {
		164580,
		124,
		true
	},
	loading_tip_GuideMgr = {
		164704,
		122,
		true
	},
	loading_tip_PoolMgr = {
		164826,
		113,
		true
	},
	loading_tip_FModMgr = {
		164939,
		119,
		true
	},
	loading_tip_StoryMgr = {
		165058,
		130,
		true
	},
	energy_desc_happy = {
		165188,
		148,
		true
	},
	energy_desc_normal = {
		165336,
		137,
		true
	},
	energy_desc_tired = {
		165473,
		136,
		true
	},
	energy_desc_angry = {
		165609,
		134,
		true
	},
	create_player_success = {
		165743,
		115,
		true
	},
	login_newPlayerScene_invalideName = {
		165858,
		133,
		true
	},
	login_newPlayerScene_name_tooShort = {
		165991,
		122,
		true
	},
	login_newPlayerScene_name_existOtherChar = {
		166113,
		153,
		true
	},
	login_newPlayerScene_name_tooLong = {
		166266,
		121,
		true
	},
	equipment_updateGrade_tip = {
		166387,
		147,
		true
	},
	equipment_upgrade_ok = {
		166534,
		102,
		true
	},
	equipment_cant_upgrade = {
		166636,
		98,
		true
	},
	equipment_upgrade_erro = {
		166734,
		105,
		true
	},
	collection_nostar = {
		166839,
		120,
		true
	},
	collection_getResource_error = {
		166959,
		111,
		true
	},
	collection_hadAward = {
		167070,
		98,
		true
	},
	collection_lock = {
		167168,
		112,
		true
	},
	collection_fetched = {
		167280,
		100,
		true
	},
	buyProp_noResource_error = {
		167380,
		119,
		true
	},
	refresh_shopStreet_ok = {
		167499,
		103,
		true
	},
	refresh_shopStreet_erro = {
		167602,
		106,
		true
	},
	shopStreet_upgrade_done = {
		167708,
		108,
		true
	},
	shopStreet_refresh_max_count = {
		167816,
		128,
		true
	},
	buy_countLimit = {
		167944,
		111,
		true
	},
	buy_item_quest = {
		168055,
		99,
		true
	},
	refresh_shopStreet_question = {
		168154,
		264,
		true
	},
	quota_shop_title = {
		168418,
		122,
		true
	},
	quota_shop_description = {
		168540,
		150,
		true
	},
	quota_shop_owned = {
		168690,
		92,
		true
	},
	quota_shop_good_limit = {
		168782,
		97,
		true
	},
	quota_shop_limit_error = {
		168879,
		168,
		true
	},
	event_start_success = {
		169047,
		95,
		true
	},
	event_start_fail = {
		169142,
		99,
		true
	},
	event_finish_success = {
		169241,
		96,
		true
	},
	event_finish_fail = {
		169337,
		100,
		true
	},
	event_giveup_success = {
		169437,
		96,
		true
	},
	event_giveup_fail = {
		169533,
		100,
		true
	},
	event_flush_success = {
		169633,
		101,
		true
	},
	event_flush_fail = {
		169734,
		99,
		true
	},
	event_flush_not_enough = {
		169833,
		122,
		true
	},
	event_start = {
		169955,
		87,
		true
	},
	event_finish = {
		170042,
		88,
		true
	},
	event_giveup = {
		170130,
		88,
		true
	},
	event_minimus_ship_numbers = {
		170218,
		137,
		true
	},
	event_confirm_giveup = {
		170355,
		111,
		true
	},
	event_confirm_flush = {
		170466,
		165,
		true
	},
	event_fleet_busy = {
		170631,
		122,
		true
	},
	event_same_type_not_allowed = {
		170753,
		124,
		true
	},
	event_condition_ship_level = {
		170877,
		172,
		true
	},
	event_condition_ship_count = {
		171049,
		131,
		true
	},
	event_condition_ship_type = {
		171180,
		120,
		true
	},
	event_level_unreached = {
		171300,
		97,
		true
	},
	event_type_unreached = {
		171397,
		105,
		true
	},
	event_oil_consume = {
		171502,
		171,
		true
	},
	event_type_unlimit = {
		171673,
		91,
		true
	},
	dailyLevel_restCount_notEnough = {
		171764,
		127,
		true
	},
	dailyLevel_unopened = {
		171891,
		98,
		true
	},
	dailyLevel_opened = {
		171989,
		87,
		true
	},
	playerinfo_ship_is_already_flagship = {
		172076,
		120,
		true
	},
	playerinfo_mask_word = {
		172196,
		119,
		true
	},
	just_now = {
		172315,
		78,
		true
	},
	several_minutes_before = {
		172393,
		117,
		true
	},
	several_hours_before = {
		172510,
		118,
		true
	},
	several_days_before = {
		172628,
		114,
		true
	},
	long_time_offline = {
		172742,
		90,
		true
	},
	dont_send_message_frequently = {
		172832,
		113,
		true
	},
	no_activity = {
		172945,
		120,
		true
	},
	which_day = {
		173065,
		104,
		true
	},
	which_day_2 = {
		173169,
		83,
		true
	},
	invalidate_evaluation = {
		173252,
		120,
		true
	},
	chapter_no = {
		173372,
		102,
		true
	},
	reconnect_tip = {
		173474,
		146,
		true
	},
	like_ship_success = {
		173620,
		120,
		true
	},
	eva_ship_success = {
		173740,
		98,
		true
	},
	zan_ship_eva_success = {
		173838,
		105,
		true
	},
	zan_ship_eva_error_7 = {
		173943,
		102,
		true
	},
	eva_count_limit = {
		174045,
		124,
		true
	},
	attribute_durability = {
		174169,
		90,
		true
	},
	attribute_cannon = {
		174259,
		86,
		true
	},
	attribute_torpedo = {
		174345,
		87,
		true
	},
	attribute_antiaircraft = {
		174432,
		92,
		true
	},
	attribute_air = {
		174524,
		83,
		true
	},
	attribute_reload = {
		174607,
		86,
		true
	},
	attribute_cd = {
		174693,
		82,
		true
	},
	attribute_armor_type = {
		174775,
		96,
		true
	},
	attribute_armor = {
		174871,
		85,
		true
	},
	attribute_hit = {
		174956,
		83,
		true
	},
	attribute_speed = {
		175039,
		85,
		true
	},
	attribute_luck = {
		175124,
		81,
		true
	},
	attribute_dodge = {
		175205,
		85,
		true
	},
	attribute_expend = {
		175290,
		86,
		true
	},
	attribute_damage = {
		175376,
		92,
		true
	},
	attribute_healthy = {
		175468,
		87,
		true
	},
	attribute_speciality = {
		175555,
		90,
		true
	},
	attribute_range = {
		175645,
		85,
		true
	},
	attribute_angle = {
		175730,
		85,
		true
	},
	attribute_scatter = {
		175815,
		93,
		true
	},
	attribute_ammo = {
		175908,
		84,
		true
	},
	attribute_antisub = {
		175992,
		87,
		true
	},
	attribute_sonarRange = {
		176079,
		102,
		true
	},
	attribute_sonarInterval = {
		176181,
		99,
		true
	},
	attribute_oxy_max = {
		176280,
		90,
		true
	},
	attribute_dodge_limit = {
		176370,
		97,
		true
	},
	attribute_intimacy = {
		176467,
		91,
		true
	},
	attribute_max_distance_damage = {
		176558,
		105,
		true
	},
	attribute_anti_siren = {
		176663,
		114,
		true
	},
	attribute_add_new = {
		176777,
		85,
		true
	},
	skill = {
		176862,
		78,
		true
	},
	cd_normal = {
		176940,
		85,
		true
	},
	intensify = {
		177025,
		79,
		true
	},
	change = {
		177104,
		76,
		true
	},
	formation_switch_failed = {
		177180,
		126,
		true
	},
	formation_switch_success = {
		177306,
		130,
		true
	},
	formation_switch_tip = {
		177436,
		176,
		true
	},
	formation_reform_tip = {
		177612,
		139,
		true
	},
	formation_invalide = {
		177751,
		146,
		true
	},
	chapter_ap_not_enough = {
		177897,
		93,
		true
	},
	formation_forbid_when_in_chapter = {
		177990,
		130,
		true
	},
	military_forbid_when_in_chapter = {
		178120,
		128,
		true
	},
	confirm_app_exit = {
		178248,
		113,
		true
	},
	friend_info_page_tip = {
		178361,
		117,
		true
	},
	friend_search_page_tip = {
		178478,
		148,
		true
	},
	friend_request_page_tip = {
		178626,
		155,
		true
	},
	friend_id_copy_ok = {
		178781,
		126,
		true
	},
	friend_inpout_key_tip = {
		178907,
		127,
		true
	},
	remove_friend_tip = {
		179034,
		111,
		true
	},
	friend_request_msg_placeholder = {
		179145,
		134,
		true
	},
	friend_request_msg_title = {
		179279,
		137,
		true
	},
	friend_max_count = {
		179416,
		132,
		true
	},
	friend_add_ok = {
		179548,
		101,
		true
	},
	friend_max_count_1 = {
		179649,
		121,
		true
	},
	friend_no_request = {
		179770,
		111,
		true
	},
	reject_all_friend_ok = {
		179881,
		108,
		true
	},
	reject_friend_ok = {
		179989,
		98,
		true
	},
	friend_offline = {
		180087,
		108,
		true
	},
	friend_msg_forbid = {
		180195,
		116,
		true
	},
	dont_add_self = {
		180311,
		107,
		true
	},
	friend_already_add = {
		180418,
		115,
		true
	},
	friend_not_add = {
		180533,
		111,
		true
	},
	friend_send_msg_erro_tip = {
		180644,
		118,
		true
	},
	friend_send_msg_null_tip = {
		180762,
		131,
		true
	},
	friend_search_succeed = {
		180893,
		97,
		true
	},
	friend_request_msg_sent = {
		180990,
		105,
		true
	},
	friend_resume_ship_count = {
		181095,
		101,
		true
	},
	friend_resume_title_metal = {
		181196,
		102,
		true
	},
	friend_resume_collection_rate = {
		181298,
		103,
		true
	},
	friend_resume_attack_count = {
		181401,
		100,
		true
	},
	friend_resume_attack_win_rate = {
		181501,
		106,
		true
	},
	friend_resume_manoeuvre_count = {
		181607,
		106,
		true
	},
	friend_resume_manoeuvre_win_rate = {
		181713,
		109,
		true
	},
	friend_resume_fleet_gs = {
		181822,
		99,
		true
	},
	friend_event_count = {
		181921,
		95,
		true
	},
	firend_relieve_blacklist_ok = {
		182016,
		103,
		true
	},
	firend_relieve_blacklist_tip = {
		182119,
		146,
		true
	},
	word_shipNation_all = {
		182265,
		92,
		true
	},
	word_shipNation_baiYing = {
		182357,
		99,
		true
	},
	word_shipNation_huangJia = {
		182456,
		100,
		true
	},
	word_shipNation_chongYing = {
		182556,
		95,
		true
	},
	word_shipNation_tieXue = {
		182651,
		92,
		true
	},
	word_shipNation_dongHuang = {
		182743,
		95,
		true
	},
	word_shipNation_saDing = {
		182838,
		104,
		true
	},
	word_shipNation_beiLian = {
		182942,
		99,
		true
	},
	word_shipNation_other = {
		183041,
		94,
		true
	},
	word_shipNation_np = {
		183135,
		100,
		true
	},
	word_shipNation_ziyou = {
		183235,
		97,
		true
	},
	word_shipNation_weixi = {
		183332,
		97,
		true
	},
	word_shipNation_yuanwei = {
		183429,
		99,
		true
	},
	word_shipNation_um = {
		183528,
		103,
		true
	},
	word_shipNation_ai = {
		183631,
		90,
		true
	},
	word_shipNation_holo = {
		183721,
		92,
		true
	},
	word_shipNation_doa = {
		183813,
		89,
		true
	},
	word_shipNation_imas = {
		183902,
		108,
		true
	},
	word_shipNation_link = {
		184010,
		93,
		true
	},
	word_shipNation_ssss = {
		184103,
		88,
		true
	},
	word_shipNation_mot = {
		184191,
		98,
		true
	},
	word_shipNation_ryza = {
		184289,
		117,
		true
	},
	word_shipNation_meta_index = {
		184406,
		94,
		true
	},
	word_shipNation_senran = {
		184500,
		101,
		true
	},
	word_reset = {
		184601,
		83,
		true
	},
	word_asc = {
		184684,
		81,
		true
	},
	word_desc = {
		184765,
		82,
		true
	},
	word_own = {
		184847,
		84,
		true
	},
	word_own1 = {
		184931,
		82,
		true
	},
	oil_buy_limit_tip = {
		185013,
		155,
		true
	},
	friend_resume_title = {
		185168,
		89,
		true
	},
	friend_resume_data_title = {
		185257,
		94,
		true
	},
	batch_destroy = {
		185351,
		89,
		true
	},
	equipment_select_device_destroy_tip = {
		185440,
		127,
		true
	},
	equipment_select_device_destroy_bonus_tip = {
		185567,
		118,
		true
	},
	equipment_select_device_destroy_nobonus_tip = {
		185685,
		125,
		true
	},
	ship_equip_profiiency = {
		185810,
		95,
		true
	},
	no_open_system_tip = {
		185905,
		168,
		true
	},
	open_system_tip = {
		186073,
		108,
		true
	},
	charge_start_tip = {
		186181,
		118,
		true
	},
	charge_double_gem_tip = {
		186299,
		130,
		true
	},
	charge_month_card_lefttime_tip = {
		186429,
		120,
		true
	},
	charge_title = {
		186549,
		106,
		true
	},
	charge_extra_gem_tip = {
		186655,
		107,
		true
	},
	charge_month_card_title = {
		186762,
		170,
		true
	},
	charge_items_title = {
		186932,
		121,
		true
	},
	setting_interface_save_success = {
		187053,
		131,
		true
	},
	setting_interface_revert_check = {
		187184,
		137,
		true
	},
	setting_interface_cancel_check = {
		187321,
		143,
		true
	},
	event_special_update = {
		187464,
		113,
		true
	},
	no_notice_tip = {
		187577,
		107,
		true
	},
	energy_desc_1 = {
		187684,
		189,
		true
	},
	energy_desc_2 = {
		187873,
		136,
		true
	},
	energy_desc_3 = {
		188009,
		122,
		true
	},
	energy_desc_4 = {
		188131,
		171,
		true
	},
	intimacy_desc_1 = {
		188302,
		111,
		true
	},
	intimacy_desc_2 = {
		188413,
		136,
		true
	},
	intimacy_desc_3 = {
		188549,
		133,
		true
	},
	intimacy_desc_4 = {
		188682,
		136,
		true
	},
	intimacy_desc_5 = {
		188818,
		120,
		true
	},
	intimacy_desc_6 = {
		188938,
		123,
		true
	},
	intimacy_desc_7 = {
		189061,
		123,
		true
	},
	intimacy_desc_1_buff = {
		189184,
		102,
		true
	},
	intimacy_desc_2_buff = {
		189286,
		102,
		true
	},
	intimacy_desc_3_buff = {
		189388,
		144,
		true
	},
	intimacy_desc_4_buff = {
		189532,
		144,
		true
	},
	intimacy_desc_5_buff = {
		189676,
		144,
		true
	},
	intimacy_desc_6_buff = {
		189820,
		144,
		true
	},
	intimacy_desc_7_buff = {
		189964,
		145,
		true
	},
	intimacy_desc_propose = {
		190109,
		312,
		true
	},
	intimacy_desc_1_detail = {
		190421,
		173,
		true
	},
	intimacy_desc_2_detail = {
		190594,
		197,
		true
	},
	intimacy_desc_3_detail = {
		190791,
		213,
		true
	},
	intimacy_desc_4_detail = {
		191004,
		216,
		true
	},
	intimacy_desc_5_detail = {
		191220,
		197,
		true
	},
	intimacy_desc_6_detail = {
		191417,
		313,
		true
	},
	intimacy_desc_7_detail = {
		191730,
		313,
		true
	},
	intimacy_desc_ring = {
		192043,
		107,
		true
	},
	intimacy_desc_tiara = {
		192150,
		111,
		true
	},
	intimacy_desc_day = {
		192261,
		81,
		true
	},
	word_propose_cost_tip1 = {
		192342,
		321,
		true
	},
	word_propose_cost_tip2 = {
		192663,
		341,
		true
	},
	word_propose_tiara_tip = {
		193004,
		132,
		true
	},
	charge_title_getitem = {
		193136,
		130,
		true
	},
	charge_title_getitem_soon = {
		193266,
		107,
		true
	},
	charge_title_getitem_month = {
		193373,
		113,
		true
	},
	charge_limit_all = {
		193486,
		100,
		true
	},
	charge_limit_daily = {
		193586,
		111,
		true
	},
	charge_limit_weekly = {
		193697,
		112,
		true
	},
	charge_limit_monthly = {
		193809,
		113,
		true
	},
	charge_error = {
		193922,
		103,
		true
	},
	charge_success = {
		194025,
		105,
		true
	},
	charge_level_limit = {
		194130,
		94,
		true
	},
	ship_drop_desc_default = {
		194224,
		98,
		true
	},
	charge_limit_lv = {
		194322,
		92,
		true
	},
	charge_time_out = {
		194414,
		118,
		true
	},
	help_shipinfo_equip = {
		194532,
		649,
		true
	},
	help_shipinfo_detail = {
		195181,
		700,
		true
	},
	help_shipinfo_intensify = {
		195881,
		653,
		true
	},
	help_shipinfo_upgrate = {
		196534,
		651,
		true
	},
	help_shipinfo_maxlevel = {
		197185,
		631,
		true
	},
	help_shipinfo_actnpc = {
		197816,
		1254,
		true
	},
	help_backyard = {
		199070,
		643,
		true
	},
	help_shipinfo_fashion = {
		199713,
		177,
		true
	},
	help_shipinfo_attr = {
		199890,
		3537,
		true
	},
	help_equipment = {
		203427,
		2179,
		true
	},
	help_equipment_skin = {
		205606,
		496,
		true
	},
	help_daily_task = {
		206102,
		4671,
		true
	},
	help_build = {
		210773,
		300,
		true
	},
	help_build_1 = {
		211073,
		302,
		true
	},
	help_build_2 = {
		211375,
		302,
		true
	},
	help_build_4 = {
		211677,
		540,
		true
	},
	help_build_5 = {
		212217,
		681,
		true
	},
	help_shipinfo_hunting = {
		212898,
		1019,
		true
	},
	shop_extendship_success = {
		213917,
		108,
		true
	},
	shop_extendequip_success = {
		214025,
		106,
		true
	},
	shop_spweapon_success = {
		214131,
		134,
		true
	},
	naval_academy_res_desc_cateen = {
		214265,
		236,
		true
	},
	naval_academy_res_desc_shop = {
		214501,
		209,
		true
	},
	naval_academy_res_desc_class = {
		214710,
		261,
		true
	},
	number_1 = {
		214971,
		75,
		true
	},
	number_2 = {
		215046,
		75,
		true
	},
	number_3 = {
		215121,
		75,
		true
	},
	number_4 = {
		215196,
		75,
		true
	},
	number_5 = {
		215271,
		75,
		true
	},
	number_6 = {
		215346,
		75,
		true
	},
	number_7 = {
		215421,
		75,
		true
	},
	number_8 = {
		215496,
		75,
		true
	},
	number_9 = {
		215571,
		75,
		true
	},
	number_10 = {
		215646,
		76,
		true
	},
	military_shop_no_open_tip = {
		215722,
		173,
		true
	},
	switch_to_shop_tip_1 = {
		215895,
		154,
		true
	},
	switch_to_shop_tip_2 = {
		216049,
		150,
		true
	},
	switch_to_shop_tip_3 = {
		216199,
		135,
		true
	},
	switch_to_shop_tip_noPos = {
		216334,
		206,
		true
	},
	text_noPos_clear = {
		216540,
		86,
		true
	},
	text_noPos_buy = {
		216626,
		84,
		true
	},
	text_noPos_intensify = {
		216710,
		90,
		true
	},
	switch_to_shop_tip_noDockyard = {
		216800,
		181,
		true
	},
	commission_no_open = {
		216981,
		91,
		true
	},
	commission_open_tip = {
		217072,
		106,
		true
	},
	commission_idle = {
		217178,
		88,
		true
	},
	commission_urgency = {
		217266,
		95,
		true
	},
	commission_normal = {
		217361,
		94,
		true
	},
	commission_get_award = {
		217455,
		104,
		true
	},
	activity_build_end_tip = {
		217559,
		92,
		true
	},
	event_over_time_expired = {
		217651,
		130,
		true
	},
	mail_sender_default = {
		217781,
		92,
		true
	},
	exchangecode_title = {
		217873,
		100,
		true
	},
	exchangecode_use_placeholder = {
		217973,
		122,
		true
	},
	exchangecode_use_ok = {
		218095,
		171,
		true
	},
	exchangecode_use_error = {
		218266,
		98,
		true
	},
	exchangecode_use_error_3 = {
		218364,
		124,
		true
	},
	exchangecode_use_error_6 = {
		218488,
		127,
		true
	},
	exchangecode_use_error_7 = {
		218615,
		127,
		true
	},
	exchangecode_use_error_8 = {
		218742,
		124,
		true
	},
	exchangecode_use_error_9 = {
		218866,
		124,
		true
	},
	exchangecode_use_error_16 = {
		218990,
		128,
		true
	},
	exchangecode_use_error_20 = {
		219118,
		125,
		true
	},
	text_noRes_tip = {
		219243,
		95,
		true
	},
	text_noRes_info_tip = {
		219338,
		110,
		true
	},
	text_noRes_info_tip_link = {
		219448,
		91,
		true
	},
	text_noRes_info_tip2 = {
		219539,
		138,
		true
	},
	text_shop_noRes_tip = {
		219677,
		124,
		true
	},
	text_shop_enoughRes_tip = {
		219801,
		145,
		true
	},
	text_buy_fashion_tip = {
		219946,
		124,
		true
	},
	equip_part_title = {
		220070,
		86,
		true
	},
	equip_part_main_title = {
		220156,
		99,
		true
	},
	equip_part_sub_title = {
		220255,
		98,
		true
	},
	equipment_upgrade_overlimit = {
		220353,
		124,
		true
	},
	err_name_existOtherChar = {
		220477,
		145,
		true
	},
	help_battle_rule = {
		220622,
		511,
		true
	},
	help_battle_warspite = {
		221133,
		300,
		true
	},
	help_battle_defense = {
		221433,
		588,
		true
	},
	backyard_theme_set_tip = {
		222021,
		151,
		true
	},
	backyard_theme_save_tip = {
		222172,
		151,
		true
	},
	backyard_theme_defaultname = {
		222323,
		105,
		true
	},
	backyard_rename_success = {
		222428,
		111,
		true
	},
	ship_set_skin_success = {
		222539,
		103,
		true
	},
	ship_set_skin_error = {
		222642,
		102,
		true
	},
	equip_part_tip = {
		222744,
		106,
		true
	},
	help_battle_auto = {
		222850,
		348,
		true
	},
	gold_buy_tip = {
		223198,
		237,
		true
	},
	oil_buy_tip = {
		223435,
		329,
		true
	},
	text_iknow = {
		223764,
		80,
		true
	},
	help_oil_buy_limit = {
		223844,
		327,
		true
	},
	text_nofood_yes = {
		224171,
		91,
		true
	},
	text_nofood_no = {
		224262,
		90,
		true
	},
	tip_add_task = {
		224352,
		96,
		true
	},
	collection_award_ship = {
		224448,
		151,
		true
	},
	guild_create_sucess = {
		224599,
		104,
		true
	},
	guild_create_error = {
		224703,
		103,
		true
	},
	guild_create_error_noname = {
		224806,
		119,
		true
	},
	guild_create_error_nofaction = {
		224925,
		122,
		true
	},
	guild_create_error_nopolicy = {
		225047,
		121,
		true
	},
	guild_create_error_nomanifesto = {
		225168,
		134,
		true
	},
	guild_create_error_nomoney = {
		225302,
		117,
		true
	},
	guild_tip_dissolve = {
		225419,
		296,
		true
	},
	guild_tip_quit = {
		225715,
		114,
		true
	},
	guild_create_confirm = {
		225829,
		155,
		true
	},
	guild_apply_erro = {
		225984,
		113,
		true
	},
	guild_dissolve_erro = {
		226097,
		110,
		true
	},
	guild_fire_erro = {
		226207,
		118,
		true
	},
	guild_impeach_erro = {
		226325,
		109,
		true
	},
	guild_quit_erro = {
		226434,
		106,
		true
	},
	guild_accept_erro = {
		226540,
		114,
		true
	},
	guild_reject_erro = {
		226654,
		114,
		true
	},
	guild_modify_erro = {
		226768,
		114,
		true
	},
	guild_setduty_erro = {
		226882,
		115,
		true
	},
	guild_apply_sucess = {
		226997,
		100,
		true
	},
	guild_no_exist = {
		227097,
		108,
		true
	},
	guild_dissolve_sucess = {
		227205,
		103,
		true
	},
	guild_commder_in_impeach_time = {
		227308,
		136,
		true
	},
	guild_impeach_sucess = {
		227444,
		102,
		true
	},
	guild_quit_sucess = {
		227546,
		99,
		true
	},
	guild_member_max_count = {
		227645,
		132,
		true
	},
	guild_new_member_join = {
		227777,
		121,
		true
	},
	guild_player_in_cd_time = {
		227898,
		150,
		true
	},
	guild_player_already_join = {
		228048,
		122,
		true
	},
	guild_rejecet_apply_sucess = {
		228170,
		117,
		true
	},
	guild_should_input_keyword = {
		228287,
		136,
		true
	},
	guild_search_sucess = {
		228423,
		95,
		true
	},
	guild_list_refresh_sucess = {
		228518,
		125,
		true
	},
	guild_info_update = {
		228643,
		111,
		true
	},
	guild_duty_id_is_null = {
		228754,
		127,
		true
	},
	guild_player_is_null = {
		228881,
		133,
		true
	},
	guild_duty_commder_max_count = {
		229014,
		138,
		true
	},
	guild_set_duty_sucess = {
		229152,
		112,
		true
	},
	guild_policy_power = {
		229264,
		94,
		true
	},
	guild_policy_relax = {
		229358,
		94,
		true
	},
	guild_faction_blhx = {
		229452,
		103,
		true
	},
	guild_faction_cszz = {
		229555,
		103,
		true
	},
	guild_faction_unknown = {
		229658,
		89,
		true
	},
	guild_faction_meta = {
		229747,
		86,
		true
	},
	guild_word_commder = {
		229833,
		88,
		true
	},
	guild_word_deputy_commder = {
		229921,
		98,
		true
	},
	guild_word_picked = {
		230019,
		87,
		true
	},
	guild_word_ordinary = {
		230106,
		89,
		true
	},
	guild_word_home = {
		230195,
		88,
		true
	},
	guild_word_member = {
		230283,
		93,
		true
	},
	guild_word_apply = {
		230376,
		86,
		true
	},
	guild_faction_change_tip = {
		230462,
		202,
		true
	},
	guild_msg_is_null = {
		230664,
		126,
		true
	},
	guild_log_new_guild_join = {
		230790,
		221,
		true
	},
	guild_log_duty_change = {
		231011,
		207,
		true
	},
	guild_log_quit = {
		231218,
		196,
		true
	},
	guild_log_fire = {
		231414,
		199,
		true
	},
	guild_leave_cd_time = {
		231613,
		170,
		true
	},
	guild_sort_time = {
		231783,
		85,
		true
	},
	guild_sort_level = {
		231868,
		86,
		true
	},
	guild_sort_duty = {
		231954,
		85,
		true
	},
	guild_fire_tip = {
		232039,
		120,
		true
	},
	guild_impeach_tip = {
		232159,
		117,
		true
	},
	guild_set_duty_title = {
		232276,
		104,
		true
	},
	guild_search_list_max_count = {
		232380,
		105,
		true
	},
	guild_sort_all = {
		232485,
		84,
		true
	},
	guild_sort_blhx = {
		232569,
		100,
		true
	},
	guild_sort_cszz = {
		232669,
		100,
		true
	},
	guild_sort_power = {
		232769,
		92,
		true
	},
	guild_sort_relax = {
		232861,
		92,
		true
	},
	guild_join_cd = {
		232953,
		164,
		true
	},
	guild_name_invaild = {
		233117,
		118,
		true
	},
	guild_apply_full = {
		233235,
		110,
		true
	},
	guild_member_full = {
		233345,
		105,
		true
	},
	guild_fire_duty_limit = {
		233450,
		164,
		true
	},
	guild_fire_succeed = {
		233614,
		100,
		true
	},
	guild_duty_tip_1 = {
		233714,
		109,
		true
	},
	guild_duty_tip_2 = {
		233823,
		115,
		true
	},
	battle_repair_special_tip = {
		233938,
		155,
		true
	},
	battle_repair_normal_name = {
		234093,
		108,
		true
	},
	battle_repair_special_name = {
		234201,
		109,
		true
	},
	oil_max_tip_title = {
		234310,
		117,
		true
	},
	gold_max_tip_title = {
		234427,
		118,
		true
	},
	expbook_max_tip_title = {
		234545,
		134,
		true
	},
	resource_max_tip_shop = {
		234679,
		115,
		true
	},
	resource_max_tip_event = {
		234794,
		138,
		true
	},
	resource_max_tip_battle = {
		234932,
		166,
		true
	},
	resource_max_tip_collect = {
		235098,
		134,
		true
	},
	resource_max_tip_mail = {
		235232,
		131,
		true
	},
	resource_max_tip_eventstart = {
		235363,
		134,
		true
	},
	resource_max_tip_destroy = {
		235497,
		134,
		true
	},
	resource_max_tip_retire = {
		235631,
		126,
		true
	},
	resource_max_tip_retire_1 = {
		235757,
		162,
		true
	},
	new_version_tip = {
		235919,
		204,
		true
	},
	guild_request_msg_title = {
		236123,
		105,
		true
	},
	guild_request_msg_placeholder = {
		236228,
		120,
		true
	},
	ship_upgrade_unequip_tip = {
		236348,
		178,
		true
	},
	destination_can_not_reach = {
		236526,
		128,
		true
	},
	destination_can_not_reach_safety = {
		236654,
		160,
		true
	},
	destination_not_in_range = {
		236814,
		155,
		true
	},
	level_ammo_enough = {
		236969,
		108,
		true
	},
	level_ammo_supply = {
		237077,
		145,
		true
	},
	level_ammo_empty = {
		237222,
		155,
		true
	},
	level_ammo_supply_p1 = {
		237377,
		116,
		true
	},
	level_flare_supply = {
		237493,
		193,
		true
	},
	chat_level_not_enough = {
		237686,
		144,
		true
	},
	chat_msg_inform = {
		237830,
		106,
		true
	},
	chat_msg_ban = {
		237936,
		159,
		true
	},
	month_card_set_ratio_success = {
		238095,
		132,
		true
	},
	month_card_set_ratio_not_change = {
		238227,
		141,
		true
	},
	charge_ship_bag_max = {
		238368,
		125,
		true
	},
	charge_equip_bag_max = {
		238493,
		126,
		true
	},
	login_wait_tip = {
		238619,
		152,
		true
	},
	ship_equip_exchange_tip = {
		238771,
		215,
		true
	},
	ship_rename_success = {
		238986,
		104,
		true
	},
	formation_chapter_lock = {
		239090,
		120,
		true
	},
	elite_disable_unsatisfied = {
		239210,
		142,
		true
	},
	elite_disable_ship_escort = {
		239352,
		138,
		true
	},
	elite_disable_formation_unsatisfied = {
		239490,
		139,
		true
	},
	elite_disable_no_fleet = {
		239629,
		125,
		true
	},
	elite_disable_property_unsatisfied = {
		239754,
		138,
		true
	},
	elite_disable_unusable = {
		239892,
		153,
		true
	},
	elite_warp_to_latest_map = {
		240045,
		121,
		true
	},
	elite_fleet_confirm = {
		240166,
		227,
		true
	},
	elite_condition_level = {
		240393,
		97,
		true
	},
	elite_condition_durability = {
		240490,
		102,
		true
	},
	elite_condition_cannon = {
		240592,
		98,
		true
	},
	elite_condition_torpedo = {
		240690,
		99,
		true
	},
	elite_condition_antiaircraft = {
		240789,
		104,
		true
	},
	elite_condition_air = {
		240893,
		95,
		true
	},
	elite_condition_antisub = {
		240988,
		99,
		true
	},
	elite_condition_dodge = {
		241087,
		97,
		true
	},
	elite_condition_reload = {
		241184,
		98,
		true
	},
	elite_condition_fleet_totle_level = {
		241282,
		136,
		true
	},
	common_compare_larger = {
		241418,
		86,
		true
	},
	common_compare_equal = {
		241504,
		85,
		true
	},
	common_compare_smaller = {
		241589,
		87,
		true
	},
	common_compare_not_less_than = {
		241676,
		95,
		true
	},
	common_compare_not_more_than = {
		241771,
		95,
		true
	},
	level_scene_formation_active_already = {
		241866,
		131,
		true
	},
	level_scene_not_enough = {
		241997,
		114,
		true
	},
	level_scene_full_hp = {
		242111,
		120,
		true
	},
	level_click_to_move = {
		242231,
		119,
		true
	},
	common_hardmode = {
		242350,
		83,
		true
	},
	common_elite_no_quota = {
		242433,
		127,
		true
	},
	common_food = {
		242560,
		81,
		true
	},
	common_no_limit = {
		242641,
		88,
		true
	},
	common_proficiency = {
		242729,
		88,
		true
	},
	backyard_food_remind = {
		242817,
		194,
		true
	},
	backyard_food_count = {
		243011,
		102,
		true
	},
	sham_ship_level_limit = {
		243113,
		136,
		true
	},
	sham_count_limit = {
		243249,
		147,
		true
	},
	sham_count_reset = {
		243396,
		191,
		true
	},
	sham_team_limit = {
		243587,
		146,
		true
	},
	sham_formation_invalid = {
		243733,
		189,
		true
	},
	sham_my_assist_ship_level_limit = {
		243922,
		146,
		true
	},
	sham_reset_confirm = {
		244068,
		188,
		true
	},
	sham_battle_help_tip = {
		244256,
		1645,
		true
	},
	sham_reset_err_limit = {
		245901,
		142,
		true
	},
	sham_ship_equip_forbid_1 = {
		246043,
		242,
		true
	},
	sham_ship_equip_forbid_2 = {
		246285,
		246,
		true
	},
	sham_enter_error_friend_ship_expired = {
		246531,
		146,
		true
	},
	sham_can_not_change_ship = {
		246677,
		152,
		true
	},
	sham_friend_ship_tip = {
		246829,
		239,
		true
	},
	inform_sueecss = {
		247068,
		105,
		true
	},
	inform_failed = {
		247173,
		104,
		true
	},
	inform_player = {
		247277,
		115,
		true
	},
	inform_select_type = {
		247392,
		121,
		true
	},
	inform_chat_msg = {
		247513,
		121,
		true
	},
	inform_sueecss_tip = {
		247634,
		100,
		true
	},
	ship_remould_max_level = {
		247734,
		122,
		true
	},
	ship_remould_material_ship_no_enough = {
		247856,
		131,
		true
	},
	ship_remould_material_ship_on_exist = {
		247987,
		123,
		true
	},
	ship_remould_material_unlock_skill = {
		248110,
		132,
		true
	},
	ship_remould_prev_lock = {
		248242,
		98,
		true
	},
	ship_remould_need_level = {
		248340,
		101,
		true
	},
	ship_remould_need_star = {
		248441,
		100,
		true
	},
	ship_remould_finished = {
		248541,
		94,
		true
	},
	ship_remould_no_item = {
		248635,
		123,
		true
	},
	ship_remould_no_gold = {
		248758,
		114,
		true
	},
	ship_remould_no_material = {
		248872,
		100,
		true
	},
	ship_remould_selecte_exceed = {
		248972,
		122,
		true
	},
	ship_remould_sueecss = {
		249094,
		111,
		true
	},
	ship_remould_warning_102174 = {
		249205,
		191,
		true
	},
	ship_remould_warning_102284 = {
		249396,
		247,
		true
	},
	ship_remould_warning_102304 = {
		249643,
		378,
		true
	},
	ship_remould_warning_105214 = {
		250021,
		262,
		true
	},
	ship_remould_warning_105234 = {
		250283,
		264,
		true
	},
	ship_remould_warning_107984 = {
		250547,
		220,
		true
	},
	ship_remould_warning_201514 = {
		250767,
		198,
		true
	},
	ship_remould_warning_203114 = {
		250965,
		347,
		true
	},
	ship_remould_warning_203124 = {
		251312,
		347,
		true
	},
	ship_remould_warning_205124 = {
		251659,
		188,
		true
	},
	ship_remould_warning_205154 = {
		251847,
		256,
		true
	},
	ship_remould_warning_206134 = {
		252103,
		320,
		true
	},
	ship_remould_warning_301534 = {
		252423,
		190,
		true
	},
	ship_remould_warning_301874 = {
		252613,
		562,
		true
	},
	ship_remould_warning_310014 = {
		253175,
		437,
		true
	},
	ship_remould_warning_310024 = {
		253612,
		437,
		true
	},
	ship_remould_warning_310034 = {
		254049,
		437,
		true
	},
	ship_remould_warning_310044 = {
		254486,
		437,
		true
	},
	ship_remould_warning_303154 = {
		254923,
		500,
		true
	},
	ship_remould_warning_402134 = {
		255423,
		360,
		true
	},
	ship_remould_warning_702124 = {
		255783,
		426,
		true
	},
	ship_remould_warning_520014 = {
		256209,
		300,
		true
	},
	ship_remould_warning_521014 = {
		256509,
		300,
		true
	},
	ship_remould_warning_520034 = {
		256809,
		300,
		true
	},
	ship_remould_warning_521034 = {
		257109,
		300,
		true
	},
	ship_remould_warning_520044 = {
		257409,
		300,
		true
	},
	ship_remould_warning_521044 = {
		257709,
		300,
		true
	},
	ship_remould_warning_502114 = {
		258009,
		255,
		true
	},
	ship_remould_warning_506114 = {
		258264,
		365,
		true
	},
	word_soundfiles_download_title = {
		258629,
		109,
		true
	},
	word_soundfiles_download = {
		258738,
		103,
		true
	},
	word_soundfiles_checking_title = {
		258841,
		112,
		true
	},
	word_soundfiles_checking = {
		258953,
		106,
		true
	},
	word_soundfiles_checkend_title = {
		259059,
		118,
		true
	},
	word_soundfiles_checkend = {
		259177,
		100,
		true
	},
	word_soundfiles_noneedupdate = {
		259277,
		104,
		true
	},
	word_soundfiles_checkfailed = {
		259381,
		115,
		true
	},
	word_soundfiles_retry = {
		259496,
		97,
		true
	},
	word_soundfiles_update = {
		259593,
		98,
		true
	},
	word_soundfiles_update_end_title = {
		259691,
		117,
		true
	},
	word_soundfiles_update_end = {
		259808,
		102,
		true
	},
	word_soundfiles_update_failed = {
		259910,
		114,
		true
	},
	word_soundfiles_update_retry = {
		260024,
		104,
		true
	},
	word_live2dfiles_download_title = {
		260128,
		119,
		true
	},
	word_live2dfiles_download = {
		260247,
		113,
		true
	},
	word_live2dfiles_checking_title = {
		260360,
		113,
		true
	},
	word_live2dfiles_checking = {
		260473,
		107,
		true
	},
	word_live2dfiles_checkend_title = {
		260580,
		119,
		true
	},
	word_live2dfiles_checkend = {
		260699,
		101,
		true
	},
	word_live2dfiles_noneedupdate = {
		260800,
		105,
		true
	},
	word_live2dfiles_checkfailed = {
		260905,
		116,
		true
	},
	word_live2dfiles_retry = {
		261021,
		104,
		true
	},
	word_live2dfiles_update = {
		261125,
		99,
		true
	},
	word_live2dfiles_update_end_title = {
		261224,
		121,
		true
	},
	word_live2dfiles_update_end = {
		261345,
		103,
		true
	},
	word_live2dfiles_update_failed = {
		261448,
		118,
		true
	},
	word_live2dfiles_update_retry = {
		261566,
		111,
		true
	},
	word_live2dfiles_main_update_tip = {
		261677,
		190,
		true
	},
	achieve_propose_tip = {
		261867,
		118,
		true
	},
	mingshi_get_tip = {
		261985,
		124,
		true
	},
	mingshi_task_tip_1 = {
		262109,
		224,
		true
	},
	mingshi_task_tip_2 = {
		262333,
		230,
		true
	},
	mingshi_task_tip_3 = {
		262563,
		230,
		true
	},
	mingshi_task_tip_4 = {
		262793,
		227,
		true
	},
	mingshi_task_tip_5 = {
		263020,
		230,
		true
	},
	mingshi_task_tip_6 = {
		263250,
		224,
		true
	},
	mingshi_task_tip_7 = {
		263474,
		221,
		true
	},
	mingshi_task_tip_8 = {
		263695,
		230,
		true
	},
	mingshi_task_tip_9 = {
		263925,
		230,
		true
	},
	mingshi_task_tip_10 = {
		264155,
		240,
		true
	},
	mingshi_task_tip_11 = {
		264395,
		236,
		true
	},
	word_propose_changename_title = {
		264631,
		194,
		true
	},
	word_propose_changename_tip1 = {
		264825,
		165,
		true
	},
	word_propose_changename_tip2 = {
		264990,
		128,
		true
	},
	word_propose_ring_tip = {
		265118,
		134,
		true
	},
	word_rename_time_tip = {
		265252,
		128,
		true
	},
	word_rename_switch_tip = {
		265380,
		189,
		true
	},
	word_ssr = {
		265569,
		75,
		true
	},
	word_sr = {
		265644,
		73,
		true
	},
	word_r = {
		265717,
		71,
		true
	},
	ship_renameShip_error = {
		265788,
		118,
		true
	},
	ship_renameShip_error_4 = {
		265906,
		114,
		true
	},
	ship_renameShip_error_2011 = {
		266020,
		114,
		true
	},
	ship_proposeShip_error = {
		266134,
		132,
		true
	},
	ship_proposeShip_error_1 = {
		266266,
		109,
		true
	},
	word_rename_time_warning = {
		266375,
		253,
		true
	},
	word_propose_cost_tip = {
		266628,
		370,
		true
	},
	word_propose_switch_tip = {
		266998,
		99,
		true
	},
	evaluate_too_loog = {
		267097,
		111,
		true
	},
	evaluate_ban_word = {
		267208,
		116,
		true
	},
	activity_level_easy_tip = {
		267324,
		265,
		true
	},
	activity_level_difficulty_tip = {
		267589,
		226,
		true
	},
	activity_level_limit_tip = {
		267815,
		253,
		true
	},
	activity_level_inwarime_tip = {
		268068,
		238,
		true
	},
	activity_level_pass_easy_tip = {
		268306,
		225,
		true
	},
	activity_level_is_closed = {
		268531,
		115,
		true
	},
	activity_switch_tip = {
		268646,
		360,
		true
	},
	reduce_sp3_pass_count = {
		269006,
		103,
		true
	},
	qiuqiu_count = {
		269109,
		85,
		true
	},
	qiuqiu_total_count = {
		269194,
		91,
		true
	},
	npcfriendly_count = {
		269285,
		99,
		true
	},
	npcfriendly_total_count = {
		269384,
		99,
		true
	},
	longxiang_count = {
		269483,
		92,
		true
	},
	longxiang_total_count = {
		269575,
		98,
		true
	},
	pt_count = {
		269673,
		83,
		true
	},
	pt_total_count = {
		269756,
		89,
		true
	},
	remould_ship_ok = {
		269845,
		91,
		true
	},
	remould_ship_count_more = {
		269936,
		118,
		true
	},
	word_should_input = {
		270054,
		126,
		true
	},
	simulation_advantage_counting = {
		270180,
		132,
		true
	},
	simulation_disadvantage_counting = {
		270312,
		135,
		true
	},
	simulation_enhancing = {
		270447,
		196,
		true
	},
	simulation_enhanced = {
		270643,
		125,
		true
	},
	word_skill_desc_get = {
		270768,
		94,
		true
	},
	word_skill_desc_learn = {
		270862,
		89,
		true
	},
	chapter_tip_aovid_succeed = {
		270951,
		101,
		true
	},
	chapter_tip_aovid_failed = {
		271052,
		100,
		true
	},
	chapter_tip_change = {
		271152,
		99,
		true
	},
	chapter_tip_use = {
		271251,
		97,
		true
	},
	chapter_tip_with_npc = {
		271348,
		302,
		true
	},
	chapter_tip_bp_ammo = {
		271650,
		131,
		true
	},
	build_ship_tip = {
		271781,
		242,
		true
	},
	auto_battle_limit_tip = {
		272023,
		134,
		true
	},
	build_ship_quickly_buy_stone = {
		272157,
		233,
		true
	},
	build_ship_quickly_buy_tool = {
		272390,
		245,
		true
	},
	ship_profile_voice_locked = {
		272635,
		128,
		true
	},
	ship_profile_skin_locked = {
		272763,
		143,
		true
	},
	ship_profile_words = {
		272906,
		97,
		true
	},
	ship_profile_action_words = {
		273003,
		107,
		true
	},
	ship_profile_label_common = {
		273110,
		95,
		true
	},
	ship_profile_label_diff = {
		273205,
		93,
		true
	},
	level_fleet_lease_one_ship = {
		273298,
		133,
		true
	},
	level_fleet_not_enough = {
		273431,
		135,
		true
	},
	level_fleet_outof_limit = {
		273566,
		136,
		true
	},
	vote_success = {
		273702,
		91,
		true
	},
	vote_not_enough = {
		273793,
		106,
		true
	},
	vote_love_not_enough = {
		273899,
		117,
		true
	},
	vote_love_limit = {
		274016,
		127,
		true
	},
	vote_love_confirm = {
		274143,
		118,
		true
	},
	vote_primary_rule = {
		274261,
		1112,
		true
	},
	vote_final_title1 = {
		275373,
		99,
		true
	},
	vote_final_rule1 = {
		275472,
		390,
		true
	},
	vote_final_title2 = {
		275862,
		99,
		true
	},
	vote_final_rule2 = {
		275961,
		174,
		true
	},
	vote_vote_time = {
		276135,
		97,
		true
	},
	vote_vote_count = {
		276232,
		84,
		true
	},
	vote_vote_group = {
		276316,
		93,
		true
	},
	vote_rank_refresh_time = {
		276409,
		148,
		true
	},
	vote_rank_in_current_server = {
		276557,
		134,
		true
	},
	words_auto_battle_label = {
		276691,
		105,
		true
	},
	words_show_ship_name_label = {
		276796,
		111,
		true
	},
	words_rare_ship_vibrate = {
		276907,
		111,
		true
	},
	words_display_ship_get_effect = {
		277018,
		120,
		true
	},
	words_show_touch_effect = {
		277138,
		117,
		true
	},
	words_bg_fit_mode = {
		277255,
		123,
		true
	},
	words_battle_hide_bg = {
		277378,
		117,
		true
	},
	words_battle_expose_line = {
		277495,
		115,
		true
	},
	words_autoFight_battery_savemode = {
		277610,
		120,
		true
	},
	words_autoFight_battery_savemode_des = {
		277730,
		184,
		true
	},
	words_autoFIght_down_frame = {
		277914,
		117,
		true
	},
	words_autoFIght_down_frame_des = {
		278031,
		173,
		true
	},
	words_autoFight_tips = {
		278204,
		159,
		true
	},
	words_autoFight_right = {
		278363,
		182,
		true
	},
	activity_puzzle_get1 = {
		278545,
		136,
		true
	},
	activity_puzzle_get2 = {
		278681,
		138,
		true
	},
	activity_puzzle_get3 = {
		278819,
		138,
		true
	},
	activity_puzzle_get4 = {
		278957,
		138,
		true
	},
	activity_puzzle_get5 = {
		279095,
		138,
		true
	},
	activity_puzzle_get6 = {
		279233,
		138,
		true
	},
	activity_puzzle_get7 = {
		279371,
		138,
		true
	},
	activity_puzzle_get8 = {
		279509,
		138,
		true
	},
	activity_puzzle_get9 = {
		279647,
		138,
		true
	},
	activity_puzzle_get10 = {
		279785,
		137,
		true
	},
	activity_puzzle_get11 = {
		279922,
		137,
		true
	},
	activity_puzzle_get12 = {
		280059,
		137,
		true
	},
	activity_puzzle_get13 = {
		280196,
		137,
		true
	},
	activity_puzzle_get14 = {
		280333,
		137,
		true
	},
	activity_puzzle_get15 = {
		280470,
		137,
		true
	},
	word_stopremain_build = {
		280607,
		115,
		true
	},
	word_stopremain_default = {
		280722,
		117,
		true
	},
	transcode_desc = {
		280839,
		231,
		true
	},
	transcode_empty_tip = {
		281070,
		141,
		true
	},
	set_birth_title = {
		281211,
		127,
		true
	},
	set_birth_confirm_tip = {
		281338,
		184,
		true
	},
	set_birth_empty_tip = {
		281522,
		128,
		true
	},
	set_birth_success = {
		281650,
		111,
		true
	},
	clear_transcode_cache_confirm = {
		281761,
		191,
		true
	},
	clear_transcode_cache_success = {
		281952,
		136,
		true
	},
	exchange_item_success = {
		282088,
		121,
		true
	},
	give_up_cloth_change = {
		282209,
		139,
		true
	},
	err_cloth_change_noship = {
		282348,
		116,
		true
	},
	need_break_tip = {
		282464,
		93,
		true
	},
	max_level_notice = {
		282557,
		131,
		true
	},
	new_skin_no_choose = {
		282688,
		185,
		true
	},
	sure_resume_volume = {
		282873,
		121,
		true
	},
	course_class_not_ready = {
		282994,
		144,
		true
	},
	course_student_max_level = {
		283138,
		130,
		true
	},
	course_stop_confirm = {
		283268,
		159,
		true
	},
	course_class_help = {
		283427,
		1549,
		true
	},
	course_class_name = {
		284976,
		107,
		true
	},
	course_proficiency_not_enough = {
		285083,
		126,
		true
	},
	course_state_rest = {
		285209,
		90,
		true
	},
	course_state_lession = {
		285299,
		99,
		true
	},
	course_energy_not_enough = {
		285398,
		183,
		true
	},
	course_proficiency_tip = {
		285581,
		355,
		true
	},
	course_sunday_tip = {
		285936,
		131,
		true
	},
	course_exit_confirm = {
		286067,
		162,
		true
	},
	course_learning = {
		286229,
		100,
		true
	},
	time_remaining_tip = {
		286329,
		92,
		true
	},
	propose_intimacy_tip = {
		286421,
		106,
		true
	},
	no_found_record_equipment = {
		286527,
		197,
		true
	},
	sec_floor_limit_tip = {
		286724,
		118,
		true
	},
	guild_shop_flash_success = {
		286842,
		100,
		true
	},
	destroy_high_rarity_tip = {
		286942,
		123,
		true
	},
	destroy_high_level_tip = {
		287065,
		120,
		true
	},
	destroy_eliteequipment_tip = {
		287185,
		150,
		true
	},
	destroy_high_intensify_tip = {
		287335,
		124,
		true
	},
	destroy_inHardFormation_tip = {
		287459,
		136,
		true
	},
	destroy_equip_rarity_tip = {
		287595,
		168,
		true
	},
	ship_quick_change_noequip = {
		287763,
		132,
		true
	},
	ship_quick_change_nofreeequip = {
		287895,
		151,
		true
	},
	word_nowenergy = {
		288046,
		102,
		true
	},
	word_energy_recov_speed = {
		288148,
		99,
		true
	},
	destroy_eliteship_tip = {
		288247,
		126,
		true
	},
	err_resloveequip_nochoice = {
		288373,
		138,
		true
	},
	take_nothing = {
		288511,
		121,
		true
	},
	take_all_mail = {
		288632,
		147,
		true
	},
	buy_furniture_overtime = {
		288779,
		113,
		true
	},
	twitter_login_tips = {
		288892,
		237,
		true
	},
	data_erro = {
		289129,
		121,
		true
	},
	login_failed = {
		289250,
		94,
		true
	},
	["not yet completed"] = {
		289344,
		81,
		true
	},
	escort_less_count_to_combat = {
		289425,
		134,
		true
	},
	ten_even_draw = {
		289559,
		94,
		true
	},
	ten_even_draw_confirm = {
		289653,
		111,
		true
	},
	level_risk_level_desc = {
		289764,
		90,
		true
	},
	level_risk_level_mitigation_rate = {
		289854,
		226,
		true
	},
	level_diffcult_chapter_state_safety = {
		290080,
		232,
		true
	},
	level_chapter_state_high_risk = {
		290312,
		135,
		true
	},
	level_chapter_state_risk = {
		290447,
		130,
		true
	},
	level_chapter_state_low_risk = {
		290577,
		134,
		true
	},
	level_chapter_state_safety = {
		290711,
		132,
		true
	},
	open_skill_class_success = {
		290843,
		118,
		true
	},
	backyard_sort_tag_default = {
		290961,
		94,
		true
	},
	backyard_sort_tag_price = {
		291055,
		93,
		true
	},
	backyard_sort_tag_comfortable = {
		291148,
		102,
		true
	},
	backyard_sort_tag_size = {
		291250,
		95,
		true
	},
	backyard_filter_tag_other = {
		291345,
		98,
		true
	},
	word_status_inFight = {
		291443,
		108,
		true
	},
	word_status_inPVP = {
		291551,
		109,
		true
	},
	word_status_inEvent = {
		291660,
		108,
		true
	},
	word_status_inEventFinished = {
		291768,
		113,
		true
	},
	word_status_inTactics = {
		291881,
		113,
		true
	},
	word_status_inClass = {
		291994,
		108,
		true
	},
	word_status_rest = {
		292102,
		105,
		true
	},
	word_status_train = {
		292207,
		106,
		true
	},
	word_status_world = {
		292313,
		118,
		true
	},
	word_status_inHardFormation = {
		292431,
		128,
		true
	},
	word_status_series_enemy = {
		292559,
		128,
		true
	},
	challenge_current_score = {
		292687,
		104,
		true
	},
	equipment_skin_unload = {
		292791,
		127,
		true
	},
	equipment_skin_no_old_ship = {
		292918,
		114,
		true
	},
	equipment_skin_no_old_skinorequipment = {
		293032,
		147,
		true
	},
	equipment_skin_no_new_ship = {
		293179,
		114,
		true
	},
	equipment_skin_no_new_equipment = {
		293293,
		132,
		true
	},
	equipment_skin_count_noenough = {
		293425,
		130,
		true
	},
	equipment_skin_replace_done = {
		293555,
		124,
		true
	},
	equipment_skin_unload_failed = {
		293679,
		132,
		true
	},
	equipment_skin_unmatch_equipment = {
		293811,
		193,
		true
	},
	equipment_skin_no_equipment_tip = {
		294004,
		165,
		true
	},
	activity_pool_awards_empty = {
		294169,
		142,
		true
	},
	activity_switch_award_pool_failed = {
		294311,
		173,
		true
	},
	shop_street_activity_tip = {
		294484,
		203,
		true
	},
	shop_street_Equipment_skin_box_help = {
		294687,
		170,
		true
	},
	twitter_link_title = {
		294857,
		114,
		true
	},
	commander_material_noenough = {
		294971,
		103,
		true
	},
	battle_result_boss_destruct = {
		295074,
		127,
		true
	},
	battle_preCombatLayer_boss_destruct = {
		295201,
		136,
		true
	},
	destory_important_equipment_tip = {
		295337,
		213,
		true
	},
	destory_important_equipment_input_erro = {
		295550,
		136,
		true
	},
	activity_hit_monster_nocount = {
		295686,
		116,
		true
	},
	activity_hit_monster_death = {
		295802,
		123,
		true
	},
	activity_hit_monster_help = {
		295925,
		119,
		true
	},
	activity_hit_monster_erro = {
		296044,
		116,
		true
	},
	activity_xiaotiane_progress = {
		296160,
		104,
		true
	},
	activity_hit_monster_reset_tip = {
		296264,
		201,
		true
	},
	equip_skin_detail_tip = {
		296465,
		121,
		true
	},
	emoji_type_0 = {
		296586,
		91,
		true
	},
	emoji_type_1 = {
		296677,
		91,
		true
	},
	emoji_type_2 = {
		296768,
		85,
		true
	},
	emoji_type_3 = {
		296853,
		85,
		true
	},
	emoji_type_4 = {
		296938,
		82,
		true
	},
	card_pairs_help_tip = {
		297020,
		938,
		true
	},
	card_pairs_tips = {
		297958,
		179,
		true
	},
	["card_battle_card details_deck"] = {
		298137,
		114,
		true
	},
	["card_battle_card details_hand"] = {
		298251,
		117,
		true
	},
	["card_battle_card details"] = {
		298368,
		106,
		true
	},
	["card_battle_card details_switchto_deck"] = {
		298474,
		117,
		true
	},
	["card_battle_card details_switchto_hand"] = {
		298591,
		120,
		true
	},
	card_battle_card_empty_en = {
		298711,
		106,
		true
	},
	card_battle_card_empty_ch = {
		298817,
		144,
		true
	},
	card_puzzel_goal_ch = {
		298961,
		101,
		true
	},
	card_puzzel_goal_en = {
		299062,
		89,
		true
	},
	card_puzzle_deck = {
		299151,
		89,
		true
	},
	upgrade_to_next_maxlevel_failed = {
		299240,
		175,
		true
	},
	upgrade_to_next_maxlevel_tip = {
		299415,
		210,
		true
	},
	upgrade_to_next_maxlevel_succeed = {
		299625,
		179,
		true
	},
	extra_chapter_socre_tip = {
		299804,
		188,
		true
	},
	extra_chapter_record_updated = {
		299992,
		122,
		true
	},
	extra_chapter_record_not_updated = {
		300114,
		126,
		true
	},
	extra_chapter_locked_tip = {
		300240,
		158,
		true
	},
	extra_chapter_locked_tip_1 = {
		300398,
		163,
		true
	},
	player_name_change_time_lv_tip = {
		300561,
		179,
		true
	},
	player_name_change_time_limit_tip = {
		300740,
		159,
		true
	},
	player_name_change_windows_tip = {
		300899,
		194,
		true
	},
	player_name_change_warning = {
		301093,
		330,
		true
	},
	player_name_change_success = {
		301423,
		114,
		true
	},
	player_name_change_failed = {
		301537,
		113,
		true
	},
	same_player_name_tip = {
		301650,
		130,
		true
	},
	task_is_not_existence = {
		301780,
		114,
		true
	},
	cannot_build_multiple_printblue = {
		301894,
		368,
		true
	},
	printblue_build_success = {
		302262,
		99,
		true
	},
	printblue_build_erro = {
		302361,
		96,
		true
	},
	blueprint_mod_success = {
		302457,
		97,
		true
	},
	blueprint_mod_erro = {
		302554,
		94,
		true
	},
	technology_refresh_sucess = {
		302648,
		122,
		true
	},
	technology_refresh_erro = {
		302770,
		120,
		true
	},
	change_technology_refresh_sucess = {
		302890,
		123,
		true
	},
	change_technology_refresh_erro = {
		303013,
		121,
		true
	},
	technology_start_up = {
		303134,
		95,
		true
	},
	technology_start_erro = {
		303229,
		97,
		true
	},
	technology_stop_success = {
		303326,
		120,
		true
	},
	technology_stop_erro = {
		303446,
		117,
		true
	},
	technology_finish_success = {
		303563,
		122,
		true
	},
	technology_finish_erro = {
		303685,
		119,
		true
	},
	blueprint_stop_success = {
		303804,
		119,
		true
	},
	blueprint_stop_erro = {
		303923,
		116,
		true
	},
	blueprint_destory_tip = {
		304039,
		124,
		true
	},
	blueprint_task_update_tip = {
		304163,
		180,
		true
	},
	blueprint_mod_addition_lock = {
		304343,
		136,
		true
	},
	blueprint_mod_word_unlock = {
		304479,
		109,
		true
	},
	blueprint_mod_skin_unlock = {
		304588,
		112,
		true
	},
	blueprint_build_consume = {
		304700,
		132,
		true
	},
	blueprint_stop_tip = {
		304832,
		176,
		true
	},
	technology_canot_refresh = {
		305008,
		143,
		true
	},
	technology_refresh_tip = {
		305151,
		128,
		true
	},
	technology_is_actived = {
		305279,
		124,
		true
	},
	technology_stop_tip = {
		305403,
		177,
		true
	},
	technology_help_text = {
		305580,
		2618,
		true
	},
	blueprint_build_time_tip = {
		308198,
		210,
		true
	},
	blueprint_cannot_build_tip = {
		308408,
		135,
		true
	},
	technology_task_none_tip = {
		308543,
		96,
		true
	},
	technology_task_build_tip = {
		308639,
		167,
		true
	},
	blueprint_commit_tip = {
		308806,
		200,
		true
	},
	buleprint_need_level_tip = {
		309006,
		120,
		true
	},
	blueprint_max_level_tip = {
		309126,
		136,
		true
	},
	ship_profile_voice_locked_intimacy = {
		309262,
		118,
		true
	},
	ship_profile_voice_locked_propose = {
		309380,
		118,
		true
	},
	ship_profile_voice_locked_propose_imas = {
		309498,
		117,
		true
	},
	ship_profile_voice_locked_design = {
		309615,
		122,
		true
	},
	ship_profile_voice_locked_meta = {
		309737,
		136,
		true
	},
	help_technolog0 = {
		309873,
		350,
		true
	},
	help_technolog = {
		310223,
		513,
		true
	},
	hide_chat_warning = {
		310736,
		224,
		true
	},
	show_chat_warning = {
		310960,
		230,
		true
	},
	help_shipblueprintui = {
		311190,
		4595,
		true
	},
	help_shipblueprintui_luck = {
		315785,
		812,
		true
	},
	anniversary_task_title_1 = {
		316597,
		158,
		true
	},
	anniversary_task_title_2 = {
		316755,
		176,
		true
	},
	anniversary_task_title_3 = {
		316931,
		176,
		true
	},
	anniversary_task_title_4 = {
		317107,
		176,
		true
	},
	anniversary_task_title_5 = {
		317283,
		176,
		true
	},
	anniversary_task_title_6 = {
		317459,
		176,
		true
	},
	anniversary_task_title_7 = {
		317635,
		176,
		true
	},
	anniversary_task_title_8 = {
		317811,
		176,
		true
	},
	anniversary_task_title_9 = {
		317987,
		176,
		true
	},
	anniversary_task_title_10 = {
		318163,
		177,
		true
	},
	anniversary_task_title_11 = {
		318340,
		165,
		true
	},
	anniversary_task_title_12 = {
		318505,
		177,
		true
	},
	anniversary_task_title_13 = {
		318682,
		171,
		true
	},
	anniversary_task_title_14 = {
		318853,
		177,
		true
	},
	charge_scene_buy_confirm = {
		319030,
		211,
		true
	},
	charge_scene_buy_confirm_1 = {
		319241,
		326,
		true
	},
	charge_scene_buy_confirm_gold = {
		319567,
		210,
		true
	},
	charge_scene_batch_buy_tip = {
		319777,
		213,
		true
	},
	help_level_ui = {
		319990,
		968,
		true
	},
	guild_modify_info_tip = {
		320958,
		182,
		true
	},
	ai_change_1 = {
		321140,
		130,
		true
	},
	ai_change_2 = {
		321270,
		130,
		true
	},
	activity_shop_lable = {
		321400,
		134,
		true
	},
	levelScene_tracking_error_pre = {
		321534,
		143,
		true
	},
	ship_limit_notice = {
		321677,
		124,
		true
	},
	idle = {
		321801,
		74,
		true
	},
	main_1 = {
		321875,
		81,
		true
	},
	main_2 = {
		321956,
		81,
		true
	},
	main_3 = {
		322037,
		81,
		true
	},
	complete = {
		322118,
		85,
		true
	},
	login = {
		322203,
		82,
		true
	},
	home = {
		322285,
		81,
		true
	},
	mail = {
		322366,
		77,
		true
	},
	mission = {
		322443,
		77,
		true
	},
	mission_complete = {
		322520,
		93,
		true
	},
	wedding = {
		322613,
		83,
		true
	},
	touch_head = {
		322696,
		85,
		true
	},
	touch_body = {
		322781,
		85,
		true
	},
	touch_special = {
		322866,
		88,
		true
	},
	gold = {
		322954,
		74,
		true
	},
	oil = {
		323028,
		73,
		true
	},
	diamond = {
		323101,
		80,
		true
	},
	word_photo_mode = {
		323181,
		88,
		true
	},
	word_video_mode = {
		323269,
		85,
		true
	},
	word_save_ok = {
		323354,
		103,
		true
	},
	word_save_video = {
		323457,
		152,
		true
	},
	reflux_help_tip = {
		323609,
		1023,
		true
	},
	reflux_pt_not_enough = {
		324632,
		110,
		true
	},
	reflux_word_1 = {
		324742,
		89,
		true
	},
	reflux_word_2 = {
		324831,
		83,
		true
	},
	ship_hunting_level_tips = {
		324914,
		204,
		true
	},
	acquisitionmode_is_not_open = {
		325118,
		140,
		true
	},
	collect_chapter_is_activation = {
		325258,
		154,
		true
	},
	levelScene_chapter_is_activation = {
		325412,
		271,
		true
	},
	resource_verify_warn = {
		325683,
		230,
		true
	},
	resource_verify_fail = {
		325913,
		238,
		true
	},
	resource_verify_success = {
		326151,
		136,
		true
	},
	resource_clear_all = {
		326287,
		211,
		true
	},
	acl_oil_count = {
		326498,
		89,
		true
	},
	acl_oil_total_count = {
		326587,
		101,
		true
	},
	word_take_video_tip = {
		326688,
		177,
		true
	},
	word_snapshot_share_title = {
		326865,
		125,
		true
	},
	word_snapshot_share_agreement = {
		326990,
		873,
		true
	},
	skin_remain_time = {
		327863,
		98,
		true
	},
	word_museum_1 = {
		327961,
		141,
		true
	},
	word_museum_help = {
		328102,
		1008,
		true
	},
	goldship_help_tip = {
		329110,
		1105,
		true
	},
	metalgearsub_help_tip = {
		330215,
		2144,
		true
	},
	acl_gold_count = {
		332359,
		93,
		true
	},
	acl_gold_total_count = {
		332452,
		105,
		true
	},
	discount_time = {
		332557,
		142,
		true
	},
	commander_talent_not_exist = {
		332699,
		169,
		true
	},
	commander_replace_talent_not_exist = {
		332868,
		162,
		true
	},
	commander_talent_learned = {
		333030,
		126,
		true
	},
	commander_talent_learn_erro = {
		333156,
		142,
		true
	},
	commander_not_exist = {
		333298,
		122,
		true
	},
	commander_fleet_not_exist = {
		333420,
		122,
		true
	},
	commander_fleet_pos_not_exist = {
		333542,
		136,
		true
	},
	commander_equip_to_fleet_erro = {
		333678,
		141,
		true
	},
	commander_acquire_erro = {
		333819,
		134,
		true
	},
	commander_lock_erro = {
		333953,
		112,
		true
	},
	commander_reset_talent_time_no_rearch = {
		334065,
		160,
		true
	},
	commander_reset_talent_is_not_need = {
		334225,
		144,
		true
	},
	commander_reset_talent_success = {
		334369,
		137,
		true
	},
	commander_reset_talent_erro = {
		334506,
		148,
		true
	},
	commander_can_not_be_upgrade = {
		334654,
		147,
		true
	},
	commander_anyone_is_in_fleet = {
		334801,
		144,
		true
	},
	commander_is_in_fleet = {
		334945,
		115,
		true
	},
	commander_play_erro = {
		335060,
		112,
		true
	},
	ship_equip_same_group_equipment = {
		335172,
		148,
		true
	},
	summary_page_un_rearch = {
		335320,
		117,
		true
	},
	player_summary_from = {
		335437,
		104,
		true
	},
	player_summary_data = {
		335541,
		95,
		true
	},
	commander_exp_overflow_tip = {
		335636,
		181,
		true
	},
	commander_reset_talent_tip = {
		335817,
		136,
		true
	},
	commander_reset_talent = {
		335953,
		104,
		true
	},
	commander_select_min_cnt = {
		336057,
		148,
		true
	},
	commander_select_max = {
		336205,
		117,
		true
	},
	commander_lock_done = {
		336322,
		110,
		true
	},
	commander_unlock_done = {
		336432,
		118,
		true
	},
	commander_get_1 = {
		336550,
		137,
		true
	},
	commander_get = {
		336687,
		142,
		true
	},
	commander_build_done = {
		336829,
		111,
		true
	},
	commander_build_erro = {
		336940,
		113,
		true
	},
	commander_get_skills_done = {
		337053,
		141,
		true
	},
	collection_way_is_unopen = {
		337194,
		118,
		true
	},
	commander_can_not_select_same_group = {
		337312,
		163,
		true
	},
	commander_capcity_is_max = {
		337475,
		124,
		true
	},
	commander_reserve_count_is_max = {
		337599,
		131,
		true
	},
	commander_build_pool_tip = {
		337730,
		150,
		true
	},
	commander_select_matiral_erro = {
		337880,
		193,
		true
	},
	commander_material_is_rarity = {
		338073,
		159,
		true
	},
	commander_material_is_maxLevel = {
		338232,
		237,
		true
	},
	charge_commander_bag_max = {
		338469,
		194,
		true
	},
	shop_extendcommander_success = {
		338663,
		159,
		true
	},
	commander_skill_point_noengough = {
		338822,
		137,
		true
	},
	buildship_new_tip = {
		338959,
		185,
		true
	},
	buildship_heavy_tip = {
		339144,
		153,
		true
	},
	buildship_light_tip = {
		339297,
		174,
		true
	},
	buildship_special_tip = {
		339471,
		185,
		true
	},
	Normalbuild_URexchange_help = {
		339656,
		676,
		true
	},
	Normalbuild_URexchange_text1 = {
		340332,
		106,
		true
	},
	Normalbuild_URexchange_text2 = {
		340438,
		98,
		true
	},
	Normalbuild_URexchange_text3 = {
		340536,
		119,
		true
	},
	Normalbuild_URexchange_text4 = {
		340655,
		104,
		true
	},
	Normalbuild_URexchange_warning1 = {
		340759,
		140,
		true
	},
	Normalbuild_URexchange_warning3 = {
		340899,
		241,
		true
	},
	Normalbuild_URexchange_confirm = {
		341140,
		141,
		true
	},
	open_skill_pos = {
		341281,
		189,
		true
	},
	open_skill_pos_discount = {
		341470,
		222,
		true
	},
	event_recommend_fail = {
		341692,
		133,
		true
	},
	newplayer_help_tip = {
		341825,
		1191,
		true
	},
	newplayer_notice_1 = {
		343016,
		115,
		true
	},
	newplayer_notice_2 = {
		343131,
		115,
		true
	},
	newplayer_notice_3 = {
		343246,
		115,
		true
	},
	newplayer_notice_4 = {
		343361,
		124,
		true
	},
	newplayer_notice_5 = {
		343485,
		118,
		true
	},
	newplayer_notice_6 = {
		343603,
		219,
		true
	},
	newplayer_notice_7 = {
		343822,
		121,
		true
	},
	newplayer_notice_8 = {
		343943,
		219,
		true
	},
	tec_catchup_1 = {
		344162,
		83,
		true
	},
	tec_catchup_2 = {
		344245,
		83,
		true
	},
	tec_catchup_3 = {
		344328,
		83,
		true
	},
	tec_catchup_4 = {
		344411,
		83,
		true
	},
	tec_catchup_5 = {
		344494,
		83,
		true
	},
	tec_notice = {
		344577,
		121,
		true
	},
	tec_notice_not_open_tip = {
		344698,
		133,
		true
	},
	apply_permission_camera_tip1 = {
		344831,
		204,
		true
	},
	apply_permission_camera_tip2 = {
		345035,
		190,
		true
	},
	apply_permission_camera_tip3 = {
		345225,
		173,
		true
	},
	apply_permission_record_audio_tip1 = {
		345398,
		189,
		true
	},
	apply_permission_record_audio_tip2 = {
		345587,
		199,
		true
	},
	apply_permission_record_audio_tip3 = {
		345786,
		179,
		true
	},
	nine_choose_one = {
		345965,
		260,
		true
	},
	help_commander_info = {
		346225,
		810,
		true
	},
	help_commander_play = {
		347035,
		810,
		true
	},
	help_commander_ability = {
		347845,
		813,
		true
	},
	story_skip_confirm = {
		348658,
		201,
		true
	},
	commander_ability_replace_warning = {
		348859,
		197,
		true
	},
	help_command_room = {
		349056,
		808,
		true
	},
	commander_build_rate_tip = {
		349864,
		136,
		true
	},
	help_activity_bossbattle = {
		350000,
		1372,
		true
	},
	commander_is_in_fleet_already = {
		351372,
		133,
		true
	},
	commander_material_is_in_fleet_tip = {
		351505,
		187,
		true
	},
	commander_main_pos = {
		351692,
		94,
		true
	},
	commander_assistant_pos = {
		351786,
		99,
		true
	},
	comander_repalce_tip = {
		351885,
		186,
		true
	},
	commander_lock_tip = {
		352071,
		118,
		true
	},
	commander_is_in_battle = {
		352189,
		116,
		true
	},
	commander_rename_warning = {
		352305,
		139,
		true
	},
	commander_rename_coldtime_tip = {
		352444,
		169,
		true
	},
	commander_rename_success_tip = {
		352613,
		104,
		true
	},
	amercian_notice_1 = {
		352717,
		201,
		true
	},
	amercian_notice_2 = {
		352918,
		151,
		true
	},
	amercian_notice_3 = {
		353069,
		116,
		true
	},
	amercian_notice_4 = {
		353185,
		96,
		true
	},
	amercian_notice_5 = {
		353281,
		126,
		true
	},
	amercian_notice_6 = {
		353407,
		240,
		true
	},
	ranking_word_1 = {
		353647,
		90,
		true
	},
	ranking_word_2 = {
		353737,
		87,
		true
	},
	ranking_word_3 = {
		353824,
		79,
		true
	},
	ranking_word_4 = {
		353903,
		95,
		true
	},
	ranking_word_5 = {
		353998,
		93,
		true
	},
	ranking_word_6 = {
		354091,
		84,
		true
	},
	ranking_word_7 = {
		354175,
		90,
		true
	},
	ranking_word_8 = {
		354265,
		90,
		true
	},
	ranking_word_9 = {
		354355,
		84,
		true
	},
	ranking_word_10 = {
		354439,
		87,
		true
	},
	spece_illegal_tip = {
		354526,
		139,
		true
	},
	utaware_warmup_notice = {
		354665,
		1439,
		true
	},
	utaware_formal_notice = {
		356104,
		758,
		true
	},
	npc_learn_skill_tip = {
		356862,
		277,
		true
	},
	npc_upgrade_max_level = {
		357139,
		170,
		true
	},
	npc_propse_tip = {
		357309,
		163,
		true
	},
	npc_strength_tip = {
		357472,
		280,
		true
	},
	npc_breakout_tip = {
		357752,
		280,
		true
	},
	word_chuansong = {
		358032,
		87,
		true
	},
	npc_evaluation_tip = {
		358119,
		173,
		true
	},
	map_event_skip = {
		358292,
		120,
		true
	},
	map_event_stop_tip = {
		358412,
		175,
		true
	},
	map_event_stop_battle_tip = {
		358587,
		188,
		true
	},
	map_event_stop_battle_tip_2 = {
		358775,
		169,
		true
	},
	map_event_stop_story_tip = {
		358944,
		187,
		true
	},
	map_event_save_nekone = {
		359131,
		151,
		true
	},
	map_event_save_rurutie = {
		359282,
		158,
		true
	},
	map_event_memory_collected = {
		359440,
		128,
		true
	},
	map_event_save_kizuna = {
		359568,
		126,
		true
	},
	five_choose_one = {
		359694,
		228,
		true
	},
	ship_preference_common = {
		359922,
		119,
		true
	},
	draw_big_luck_1 = {
		360041,
		124,
		true
	},
	draw_big_luck_2 = {
		360165,
		127,
		true
	},
	draw_big_luck_3 = {
		360292,
		127,
		true
	},
	draw_medium_luck_1 = {
		360419,
		140,
		true
	},
	draw_medium_luck_2 = {
		360559,
		131,
		true
	},
	draw_medium_luck_3 = {
		360690,
		127,
		true
	},
	draw_little_luck_1 = {
		360817,
		121,
		true
	},
	draw_little_luck_2 = {
		360938,
		115,
		true
	},
	draw_little_luck_3 = {
		361053,
		143,
		true
	},
	ship_preference_non = {
		361196,
		122,
		true
	},
	school_title_dajiangtang = {
		361318,
		97,
		true
	},
	school_title_zhihuimiao = {
		361415,
		99,
		true
	},
	school_title_shitang = {
		361514,
		96,
		true
	},
	school_title_xiaomaibu = {
		361610,
		98,
		true
	},
	school_title_shangdian = {
		361708,
		95,
		true
	},
	school_title_xueyuan = {
		361803,
		96,
		true
	},
	school_title_shoucang = {
		361899,
		94,
		true
	},
	school_title_xiaoyouxiting = {
		361993,
		108,
		true
	},
	tag_level_fighting = {
		362101,
		91,
		true
	},
	tag_level_oni = {
		362192,
		89,
		true
	},
	tag_level_bomb = {
		362281,
		90,
		true
	},
	ui_word_levelui2_inevent = {
		362371,
		97,
		true
	},
	exit_backyard_exp_display = {
		362468,
		139,
		true
	},
	help_monopoly = {
		362607,
		1896,
		true
	},
	md5_error = {
		364503,
		146,
		true
	},
	world_boss_help = {
		364649,
		6358,
		true
	},
	world_boss_tip = {
		371007,
		179,
		true
	},
	world_boss_award_limit = {
		371186,
		136,
		true
	},
	backyard_is_loading = {
		371322,
		128,
		true
	},
	levelScene_loop_help_tip = {
		371450,
		3326,
		true
	},
	no_airspace_competition = {
		374776,
		102,
		true
	},
	air_supremacy_value = {
		374878,
		92,
		true
	},
	read_the_user_agreement = {
		374970,
		157,
		true
	},
	award_max_warning = {
		375127,
		169,
		true
	},
	sub_item_warning = {
		375296,
		147,
		true
	},
	select_award_warning = {
		375443,
		126,
		true
	},
	no_item_selected_tip = {
		375569,
		126,
		true
	},
	backyard_traning_tip = {
		375695,
		190,
		true
	},
	backyard_rest_tip = {
		375885,
		163,
		true
	},
	backyard_class_tip = {
		376048,
		134,
		true
	},
	medal_notice_1 = {
		376182,
		114,
		true
	},
	medal_notice_2 = {
		376296,
		87,
		true
	},
	medal_help_tip = {
		376383,
		1746,
		true
	},
	trophy_achieved = {
		378129,
		109,
		true
	},
	text_shop = {
		378238,
		85,
		true
	},
	text_confirm = {
		378323,
		83,
		true
	},
	text_cancel = {
		378406,
		82,
		true
	},
	text_cancel_fight = {
		378488,
		93,
		true
	},
	text_goon_fight = {
		378581,
		91,
		true
	},
	text_exit = {
		378672,
		80,
		true
	},
	text_clear = {
		378752,
		83,
		true
	},
	text_apply = {
		378835,
		81,
		true
	},
	text_buy = {
		378916,
		79,
		true
	},
	text_forward = {
		378995,
		83,
		true
	},
	text_prepage = {
		379078,
		82,
		true
	},
	text_nextpage = {
		379160,
		83,
		true
	},
	text_exchange = {
		379243,
		84,
		true
	},
	text_retreat = {
		379327,
		83,
		true
	},
	text_goto = {
		379410,
		80,
		true
	},
	level_scene_title_word_1 = {
		379490,
		98,
		true
	},
	level_scene_title_word_2 = {
		379588,
		104,
		true
	},
	level_scene_title_word_3 = {
		379692,
		98,
		true
	},
	level_scene_title_word_4 = {
		379790,
		95,
		true
	},
	level_scene_title_word_5 = {
		379885,
		95,
		true
	},
	ambush_display_0 = {
		379980,
		86,
		true
	},
	ambush_display_1 = {
		380066,
		86,
		true
	},
	ambush_display_2 = {
		380152,
		83,
		true
	},
	ambush_display_3 = {
		380235,
		86,
		true
	},
	ambush_display_4 = {
		380321,
		83,
		true
	},
	ambush_display_5 = {
		380404,
		83,
		true
	},
	ambush_display_6 = {
		380487,
		86,
		true
	},
	black_white_grid_notice = {
		380573,
		1309,
		true
	},
	black_white_grid_reset = {
		381882,
		99,
		true
	},
	black_white_grid_switch_tip = {
		381981,
		127,
		true
	},
	no_way_to_escape = {
		382108,
		119,
		true
	},
	word_attr_ac = {
		382227,
		82,
		true
	},
	help_battle_ac = {
		382309,
		1967,
		true
	},
	help_attribute_dodge_limit = {
		384276,
		377,
		true
	},
	refuse_friend = {
		384653,
		110,
		true
	},
	refuse_and_add_into_bl = {
		384763,
		150,
		true
	},
	tech_simulate_closed = {
		384913,
		130,
		true
	},
	tech_simulate_quit = {
		385043,
		171,
		true
	},
	technology_uplevel_error_no_res = {
		385214,
		187,
		true
	},
	help_technologytree = {
		385401,
		2629,
		true
	},
	tech_change_version_mark = {
		388030,
		100,
		true
	},
	technology_uplevel_error_studying = {
		388130,
		133,
		true
	},
	fate_attr_word = {
		388263,
		114,
		true
	},
	fate_phase_word = {
		388377,
		91,
		true
	},
	blueprint_simulation_confirm = {
		388468,
		200,
		true
	},
	blueprint_simulation_confirm_19901 = {
		388668,
		373,
		true
	},
	blueprint_simulation_confirm_19902 = {
		389041,
		352,
		true
	},
	blueprint_simulation_confirm_39903 = {
		389393,
		351,
		true
	},
	blueprint_simulation_confirm_39904 = {
		389744,
		357,
		true
	},
	blueprint_simulation_confirm_49902 = {
		390101,
		337,
		true
	},
	blueprint_simulation_confirm_99901 = {
		390438,
		342,
		true
	},
	blueprint_simulation_confirm_29903 = {
		390780,
		347,
		true
	},
	blueprint_simulation_confirm_29904 = {
		391127,
		348,
		true
	},
	blueprint_simulation_confirm_49903 = {
		391475,
		337,
		true
	},
	blueprint_simulation_confirm_49904 = {
		391812,
		345,
		true
	},
	blueprint_simulation_confirm_89902 = {
		392157,
		347,
		true
	},
	blueprint_simulation_confirm_19903 = {
		392504,
		359,
		true
	},
	blueprint_simulation_confirm_39905 = {
		392863,
		415,
		true
	},
	blueprint_simulation_confirm_49905 = {
		393278,
		360,
		true
	},
	blueprint_simulation_confirm_49906 = {
		393638,
		341,
		true
	},
	blueprint_simulation_confirm_69901 = {
		393979,
		366,
		true
	},
	blueprint_simulation_confirm_29905 = {
		394345,
		351,
		true
	},
	blueprint_simulation_confirm_49907 = {
		394696,
		346,
		true
	},
	blueprint_simulation_confirm_59901 = {
		395042,
		342,
		true
	},
	blueprint_simulation_confirm_79901 = {
		395384,
		331,
		true
	},
	blueprint_simulation_confirm_89903 = {
		395715,
		379,
		true
	},
	blueprint_simulation_confirm_19904 = {
		396094,
		356,
		true
	},
	blueprint_simulation_confirm_39906 = {
		396450,
		343,
		true
	},
	blueprint_simulation_confirm_49908 = {
		396793,
		358,
		true
	},
	blueprint_simulation_confirm_49909 = {
		397151,
		355,
		true
	},
	blueprint_simulation_confirm_99902 = {
		397506,
		359,
		true
	},
	electrotherapy_wanning = {
		397865,
		119,
		true
	},
	siren_chase_warning = {
		397984,
		107,
		true
	},
	memorybook_get_award_tip = {
		398091,
		161,
		true
	},
	memorybook_notice = {
		398252,
		687,
		true
	},
	word_votes = {
		398939,
		86,
		true
	},
	number_0 = {
		399025,
		75,
		true
	},
	intimacy_desc_propose_vertical = {
		399100,
		289,
		true
	},
	without_selected_ship = {
		399389,
		121,
		true
	},
	index_all = {
		399510,
		82,
		true
	},
	index_fleetfront = {
		399592,
		92,
		true
	},
	index_fleetrear = {
		399684,
		91,
		true
	},
	index_shipType_quZhu = {
		399775,
		90,
		true
	},
	index_shipType_qinXun = {
		399865,
		91,
		true
	},
	index_shipType_zhongXun = {
		399956,
		93,
		true
	},
	index_shipType_zhanLie = {
		400049,
		92,
		true
	},
	index_shipType_hangMu = {
		400141,
		91,
		true
	},
	index_shipType_weiXiu = {
		400232,
		91,
		true
	},
	index_shipType_qianTing = {
		400323,
		96,
		true
	},
	index_other = {
		400419,
		84,
		true
	},
	index_rare2 = {
		400503,
		87,
		true
	},
	index_rare3 = {
		400590,
		81,
		true
	},
	index_rare4 = {
		400671,
		82,
		true
	},
	index_rare5 = {
		400753,
		83,
		true
	},
	index_rare6 = {
		400836,
		82,
		true
	},
	warning_mail_max_1 = {
		400918,
		209,
		true
	},
	warning_mail_max_2 = {
		401127,
		170,
		true
	},
	return_award_bind_success = {
		401297,
		104,
		true
	},
	return_award_bind_erro = {
		401401,
		103,
		true
	},
	rename_commander_erro = {
		401504,
		105,
		true
	},
	change_display_medal_success = {
		401609,
		132,
		true
	},
	limit_skin_time_day = {
		401741,
		95,
		true
	},
	limit_skin_time_day_min = {
		401836,
		107,
		true
	},
	limit_skin_time_min = {
		401943,
		95,
		true
	},
	limit_skin_time_overtime = {
		402038,
		109,
		true
	},
	limit_skin_time_before_maintenance = {
		402147,
		123,
		true
	},
	award_window_pt_title = {
		402270,
		105,
		true
	},
	return_have_participated_in_act = {
		402375,
		132,
		true
	},
	input_returner_code = {
		402507,
		92,
		true
	},
	dress_up_success = {
		402599,
		110,
		true
	},
	already_have_the_skin = {
		402709,
		115,
		true
	},
	exchange_limit_skin_tip = {
		402824,
		194,
		true
	},
	returner_help = {
		403018,
		2546,
		true
	},
	attire_time_stamp = {
		405564,
		99,
		true
	},
	pray_build_select_ship_instruction = {
		405663,
		119,
		true
	},
	warning_pray_build_pool = {
		405782,
		266,
		true
	},
	error_pray_select_ship_max = {
		406048,
		123,
		true
	},
	tip_pray_build_pool_success = {
		406171,
		127,
		true
	},
	tip_pray_build_pool_fail = {
		406298,
		124,
		true
	},
	pray_build_help = {
		406422,
		2510,
		true
	},
	pray_build_UR_warning = {
		408932,
		134,
		true
	},
	bismarck_award_tip = {
		409066,
		121,
		true
	},
	bismarck_chapter_desc = {
		409187,
		124,
		true
	},
	returner_push_success = {
		409311,
		109,
		true
	},
	returner_max_count = {
		409420,
		134,
		true
	},
	returner_push_tip = {
		409554,
		254,
		true
	},
	returner_match_tip = {
		409808,
		245,
		true
	},
	return_lock_tip = {
		410053,
		132,
		true
	},
	challenge_help = {
		410185,
		2116,
		true
	},
	challenge_casual_reset = {
		412301,
		154,
		true
	},
	challenge_infinite_reset = {
		412455,
		183,
		true
	},
	challenge_normal_reset = {
		412638,
		138,
		true
	},
	challenge_casual_click_switch = {
		412776,
		175,
		true
	},
	challenge_infinite_click_switch = {
		412951,
		189,
		true
	},
	challenge_season_update = {
		413140,
		139,
		true
	},
	challenge_season_update_casual_clear = {
		413279,
		272,
		true
	},
	challenge_season_update_infinite_clear = {
		413551,
		289,
		true
	},
	challenge_season_update_casual_switch = {
		413840,
		280,
		true
	},
	challenge_season_update_infinite_switch = {
		414120,
		300,
		true
	},
	challenge_combat_score = {
		414420,
		109,
		true
	},
	challenge_share_progress = {
		414529,
		118,
		true
	},
	challenge_share = {
		414647,
		79,
		true
	},
	challenge_expire_warn = {
		414726,
		173,
		true
	},
	challenge_normal_tip = {
		414899,
		160,
		true
	},
	challenge_unlimited_tip = {
		415059,
		142,
		true
	},
	commander_prefab_rename_success = {
		415201,
		113,
		true
	},
	commander_prefab_name = {
		415314,
		96,
		true
	},
	commander_prefab_rename_time = {
		415410,
		137,
		true
	},
	commander_build_solt_deficiency = {
		415547,
		134,
		true
	},
	commander_select_box_tip = {
		415681,
		182,
		true
	},
	challenge_end_tip = {
		415863,
		111,
		true
	},
	pass_times = {
		415974,
		86,
		true
	},
	list_empty_tip_billboardui = {
		416060,
		133,
		true
	},
	list_empty_tip_equipmentdesignui = {
		416193,
		133,
		true
	},
	list_empty_tip_storehouseui_equip = {
		416326,
		131,
		true
	},
	list_empty_tip_storehouseui_item = {
		416457,
		130,
		true
	},
	list_empty_tip_eventui = {
		416587,
		132,
		true
	},
	list_empty_tip_guildrequestui = {
		416719,
		126,
		true
	},
	list_empty_tip_joinguildui = {
		416845,
		136,
		true
	},
	list_empty_tip_friendui = {
		416981,
		117,
		true
	},
	list_empty_tip_friendui_search = {
		417098,
		137,
		true
	},
	list_empty_tip_friendui_request = {
		417235,
		125,
		true
	},
	list_empty_tip_friendui_black = {
		417360,
		136,
		true
	},
	list_empty_tip_dockyardui = {
		417496,
		132,
		true
	},
	list_empty_tip_taskscene = {
		417628,
		115,
		true
	},
	empty_tip_mailboxui = {
		417743,
		110,
		true
	},
	words_settings_unlock_ship = {
		417853,
		108,
		true
	},
	words_settings_resolve_equip = {
		417961,
		104,
		true
	},
	words_settings_unlock_commander = {
		418065,
		119,
		true
	},
	words_settings_create_inherit = {
		418184,
		114,
		true
	},
	tips_fail_secondarypwd_much_times = {
		418298,
		195,
		true
	},
	words_desc_unlock = {
		418493,
		139,
		true
	},
	words_desc_resolve_equip = {
		418632,
		146,
		true
	},
	words_desc_create_inherit = {
		418778,
		110,
		true
	},
	words_desc_close_password = {
		418888,
		119,
		true
	},
	words_desc_change_settings = {
		419007,
		142,
		true
	},
	words_set_password = {
		419149,
		103,
		true
	},
	words_information = {
		419252,
		87,
		true
	},
	Word_Ship_Exp_Buff = {
		419339,
		94,
		true
	},
	secondarypassword_incorrectpwd_error = {
		419433,
		195,
		true
	},
	secondary_password_help = {
		419628,
		1764,
		true
	},
	comic_help = {
		421392,
		367,
		true
	},
	secondarypassword_illegal_tip = {
		421759,
		130,
		true
	},
	pt_cosume = {
		421889,
		81,
		true
	},
	secondarypassword_confirm_tips = {
		421970,
		180,
		true
	},
	help_tempesteve = {
		422150,
		1073,
		true
	},
	word_rest_times = {
		423223,
		125,
		true
	},
	common_buy_gold_success = {
		423348,
		145,
		true
	},
	harbour_bomb_tip = {
		423493,
		110,
		true
	},
	submarine_approach = {
		423603,
		94,
		true
	},
	submarine_approach_desc = {
		423697,
		123,
		true
	},
	desc_quick_play = {
		423820,
		100,
		true
	},
	text_win_condition = {
		423920,
		94,
		true
	},
	text_lose_condition = {
		424014,
		95,
		true
	},
	text_rest_HP = {
		424109,
		88,
		true
	},
	desc_defense_reward = {
		424197,
		162,
		true
	},
	desc_base_hp = {
		424359,
		96,
		true
	},
	map_event_open = {
		424455,
		120,
		true
	},
	word_reward = {
		424575,
		81,
		true
	},
	tips_dispense_completed = {
		424656,
		99,
		true
	},
	tips_firework_completed = {
		424755,
		108,
		true
	},
	help_summer_feast = {
		424863,
		1663,
		true
	},
	help_firework_produce = {
		426526,
		528,
		true
	},
	help_firework = {
		427054,
		1872,
		true
	},
	help_summer_shrine = {
		428926,
		1266,
		true
	},
	help_summer_food = {
		430192,
		1658,
		true
	},
	help_summer_shooting = {
		431850,
		943,
		true
	},
	help_summer_stamp = {
		432793,
		434,
		true
	},
	tips_summergame_exit = {
		433227,
		184,
		true
	},
	tips_shrine_buff = {
		433411,
		137,
		true
	},
	tips_shrine_nobuff = {
		433548,
		163,
		true
	},
	paint_hide_other_obj_tip = {
		433711,
		107,
		true
	},
	help_vote = {
		433818,
		5495,
		true
	},
	tips_firework_exit = {
		439313,
		149,
		true
	},
	result_firework_produce = {
		439462,
		117,
		true
	},
	tag_level_narrative = {
		439579,
		98,
		true
	},
	vote_get_book = {
		439677,
		110,
		true
	},
	vote_book_is_over = {
		439787,
		133,
		true
	},
	vote_fame_tip = {
		439920,
		186,
		true
	},
	word_maintain = {
		440106,
		89,
		true
	},
	name_zhanliejahe = {
		440195,
		94,
		true
	},
	change_skin_secretary_ship_success = {
		440289,
		128,
		true
	},
	change_skin_secretary_ship = {
		440417,
		114,
		true
	},
	word_billboard = {
		440531,
		93,
		true
	},
	word_easy = {
		440624,
		79,
		true
	},
	word_normal_junhe = {
		440703,
		87,
		true
	},
	word_hard = {
		440790,
		82,
		true
	},
	word_special_challenge_ticket = {
		440872,
		108,
		true
	},
	tip_exchange_ticket = {
		440980,
		187,
		true
	},
	dont_remind = {
		441167,
		105,
		true
	},
	worldbossex_help = {
		441272,
		832,
		true
	},
	ship_formationUI_fleetName_easy = {
		442104,
		107,
		true
	},
	ship_formationUI_fleetName_normal = {
		442211,
		109,
		true
	},
	ship_formationUI_fleetName_hard = {
		442320,
		110,
		true
	},
	ship_formationUI_fleetName_extra = {
		442430,
		104,
		true
	},
	ship_formationUI_fleetName_easy_ss = {
		442534,
		116,
		true
	},
	ship_formationUI_fleetName_normal_ss = {
		442650,
		118,
		true
	},
	ship_formationUI_fleetName_hard_ss = {
		442768,
		119,
		true
	},
	ship_formationUI_fleetName_extra_ss = {
		442887,
		113,
		true
	},
	text_consume = {
		443000,
		82,
		true
	},
	text_inconsume = {
		443082,
		87,
		true
	},
	pt_ship_now = {
		443169,
		93,
		true
	},
	pt_ship_goal = {
		443262,
		88,
		true
	},
	option_desc1 = {
		443350,
		160,
		true
	},
	option_desc2 = {
		443510,
		184,
		true
	},
	option_desc3 = {
		443694,
		187,
		true
	},
	option_desc4 = {
		443881,
		192,
		true
	},
	option_desc5 = {
		444073,
		145,
		true
	},
	option_desc6 = {
		444218,
		169,
		true
	},
	option_desc10 = {
		444387,
		149,
		true
	},
	option_desc11 = {
		444536,
		1895,
		true
	},
	music_collection = {
		446431,
		1155,
		true
	},
	music_main = {
		447586,
		1358,
		true
	},
	music_juus = {
		448944,
		522,
		true
	},
	doa_collection = {
		449466,
		1095,
		true
	},
	ins_word_day = {
		450561,
		84,
		true
	},
	ins_word_hour = {
		450645,
		88,
		true
	},
	ins_word_minu = {
		450733,
		85,
		true
	},
	ins_word_like = {
		450818,
		94,
		true
	},
	ins_click_like_success = {
		450912,
		110,
		true
	},
	ins_push_comment_success = {
		451022,
		112,
		true
	},
	skinshop_live2d_fliter_failed = {
		451134,
		139,
		true
	},
	help_music_game = {
		451273,
		1711,
		true
	},
	restart_music_game = {
		452984,
		155,
		true
	},
	reselect_music_game = {
		453139,
		159,
		true
	},
	hololive_goodmorning = {
		453298,
		1065,
		true
	},
	hololive_lianliankan = {
		454363,
		2244,
		true
	},
	hololive_dalaozhang = {
		456607,
		841,
		true
	},
	hololive_dashenling = {
		457448,
		2436,
		true
	},
	pocky_jiujiu = {
		459884,
		91,
		true
	},
	pocky_jiujiu_desc = {
		459975,
		136,
		true
	},
	pocky_help = {
		460111,
		1424,
		true
	},
	secretary_help = {
		461535,
		3266,
		true
	},
	secretary_unlock2 = {
		464801,
		102,
		true
	},
	secretary_unlock3 = {
		464903,
		102,
		true
	},
	secretary_unlock4 = {
		465005,
		102,
		true
	},
	secretary_unlock5 = {
		465107,
		103,
		true
	},
	secretary_closed = {
		465210,
		95,
		true
	},
	confirm_unlock = {
		465305,
		189,
		true
	},
	secretary_pos_save = {
		465494,
		131,
		true
	},
	secretary_pos_save_success = {
		465625,
		136,
		true
	},
	collection_help = {
		465761,
		346,
		true
	},
	juese_tiyan = {
		466107,
		123,
		true
	},
	resolve_amount_prefix = {
		466230,
		97,
		true
	},
	compose_amount_prefix = {
		466327,
		97,
		true
	},
	help_sub_limits = {
		466424,
		103,
		true
	},
	help_sub_display = {
		466527,
		105,
		true
	},
	confirm_unlock_ship_main = {
		466632,
		143,
		true
	},
	msgbox_text_confirm = {
		466775,
		90,
		true
	},
	msgbox_text_shop = {
		466865,
		92,
		true
	},
	msgbox_text_cancel = {
		466957,
		89,
		true
	},
	msgbox_text_cancel_g = {
		467046,
		91,
		true
	},
	msgbox_text_cancel_fight = {
		467137,
		100,
		true
	},
	msgbox_text_goon_fight = {
		467237,
		98,
		true
	},
	msgbox_text_exit = {
		467335,
		87,
		true
	},
	msgbox_text_clear = {
		467422,
		90,
		true
	},
	msgbox_text_apply = {
		467512,
		88,
		true
	},
	msgbox_text_buy = {
		467600,
		86,
		true
	},
	msgbox_text_noPos_buy = {
		467686,
		92,
		true
	},
	msgbox_text_noPos_clear = {
		467778,
		94,
		true
	},
	msgbox_text_noPos_intensify = {
		467872,
		98,
		true
	},
	msgbox_text_forward = {
		467970,
		90,
		true
	},
	msgbox_text_iknow = {
		468060,
		88,
		true
	},
	msgbox_text_prepage = {
		468148,
		89,
		true
	},
	msgbox_text_nextpage = {
		468237,
		90,
		true
	},
	msgbox_text_exchange = {
		468327,
		91,
		true
	},
	msgbox_text_retreat = {
		468418,
		90,
		true
	},
	msgbox_text_go = {
		468508,
		85,
		true
	},
	msgbox_text_consume = {
		468593,
		89,
		true
	},
	msgbox_text_inconsume = {
		468682,
		94,
		true
	},
	msgbox_text_unlock = {
		468776,
		89,
		true
	},
	msgbox_text_save = {
		468865,
		92,
		true
	},
	msgbox_text_replace = {
		468957,
		95,
		true
	},
	msgbox_text_unload = {
		469052,
		94,
		true
	},
	msgbox_text_modify = {
		469146,
		94,
		true
	},
	msgbox_text_breakthrough = {
		469240,
		100,
		true
	},
	msgbox_text_equipdetail = {
		469340,
		99,
		true
	},
	msgbox_text_use = {
		469439,
		85,
		true
	},
	common_flag_ship = {
		469524,
		105,
		true
	},
	fenjie_lantu_tip = {
		469629,
		194,
		true
	},
	msgbox_text_analyse = {
		469823,
		90,
		true
	},
	fragresolve_empty_tip = {
		469913,
		137,
		true
	},
	confirm_unlock_lv = {
		470050,
		142,
		true
	},
	shops_rest_day = {
		470192,
		109,
		true
	},
	title_limit_time = {
		470301,
		92,
		true
	},
	seven_choose_one = {
		470393,
		233,
		true
	},
	help_newyear_feast = {
		470626,
		1728,
		true
	},
	help_newyear_shrine = {
		472354,
		1389,
		true
	},
	help_newyear_stamp = {
		473743,
		245,
		true
	},
	pt_reconfirm = {
		473988,
		125,
		true
	},
	qte_game_help = {
		474113,
		340,
		true
	},
	word_equipskin_type = {
		474453,
		89,
		true
	},
	word_equipskin_all = {
		474542,
		88,
		true
	},
	word_equipskin_cannon = {
		474630,
		91,
		true
	},
	word_equipskin_tarpedo = {
		474721,
		92,
		true
	},
	word_equipskin_aircraft = {
		474813,
		96,
		true
	},
	word_equipskin_aux = {
		474909,
		88,
		true
	},
	msgbox_repair = {
		474997,
		95,
		true
	},
	msgbox_repair_l2d = {
		475092,
		93,
		true
	},
	msgbox_repair_painting = {
		475185,
		109,
		true
	},
	word_no_cache = {
		475294,
		119,
		true
	},
	pile_game_notice = {
		475413,
		1374,
		true
	},
	help_chunjie_stamp = {
		476787,
		819,
		true
	},
	help_chunjie_feast = {
		477606,
		693,
		true
	},
	help_chunjie_jiulou = {
		478299,
		947,
		true
	},
	special_animal1 = {
		479246,
		256,
		true
	},
	special_animal2 = {
		479502,
		265,
		true
	},
	special_animal3 = {
		479767,
		305,
		true
	},
	special_animal4 = {
		480072,
		208,
		true
	},
	special_animal5 = {
		480280,
		238,
		true
	},
	special_animal6 = {
		480518,
		247,
		true
	},
	special_animal7 = {
		480765,
		280,
		true
	},
	bulin_help = {
		481045,
		1512,
		true
	},
	super_bulin = {
		482557,
		117,
		true
	},
	super_bulin_tip = {
		482674,
		127,
		true
	},
	bulin_tip1 = {
		482801,
		101,
		true
	},
	bulin_tip2 = {
		482902,
		110,
		true
	},
	bulin_tip3 = {
		483012,
		101,
		true
	},
	bulin_tip4 = {
		483113,
		116,
		true
	},
	bulin_tip5 = {
		483229,
		101,
		true
	},
	bulin_tip6 = {
		483330,
		119,
		true
	},
	bulin_tip7 = {
		483449,
		101,
		true
	},
	bulin_tip8 = {
		483550,
		113,
		true
	},
	bulin_tip9 = {
		483663,
		98,
		true
	},
	bulin_tip_other1 = {
		483761,
		183,
		true
	},
	bulin_tip_other2 = {
		483944,
		119,
		true
	},
	bulin_tip_other3 = {
		484063,
		159,
		true
	},
	monopoly_left_count = {
		484222,
		96,
		true
	},
	help_chunjie_monopoly = {
		484318,
		1378,
		true
	},
	monoply_drop_ship_step = {
		485696,
		143,
		true
	},
	lanternRiddles_wait_for_reanswer = {
		485839,
		175,
		true
	},
	lanternRiddles_answer_is_wrong = {
		486014,
		124,
		true
	},
	lanternRiddles_answer_is_right = {
		486138,
		109,
		true
	},
	lanternRiddles_gametip = {
		486247,
		1120,
		true
	},
	LanternRiddle_wait_time_tip = {
		487367,
		107,
		true
	},
	LinkLinkGame_BestTime = {
		487474,
		98,
		true
	},
	LinkLinkGame_CurTime = {
		487572,
		97,
		true
	},
	sort_attribute = {
		487669,
		93,
		true
	},
	sort_intimacy = {
		487762,
		86,
		true
	},
	index_skin = {
		487848,
		86,
		true
	},
	index_reform = {
		487934,
		88,
		true
	},
	index_reform_cw = {
		488022,
		91,
		true
	},
	index_strengthen = {
		488113,
		92,
		true
	},
	index_special = {
		488205,
		83,
		true
	},
	index_propose_skin = {
		488288,
		100,
		true
	},
	index_not_obtained = {
		488388,
		91,
		true
	},
	index_no_limit = {
		488479,
		87,
		true
	},
	index_awakening = {
		488566,
		110,
		true
	},
	index_not_lvmax = {
		488676,
		100,
		true
	},
	index_spweapon = {
		488776,
		90,
		true
	},
	index_marry = {
		488866,
		90,
		true
	},
	decodegame_gametip = {
		488956,
		2708,
		true
	},
	indexsort_sort = {
		491664,
		87,
		true
	},
	indexsort_index = {
		491751,
		94,
		true
	},
	indexsort_camp = {
		491845,
		84,
		true
	},
	indexsort_type = {
		491929,
		87,
		true
	},
	indexsort_rarity = {
		492016,
		95,
		true
	},
	indexsort_extraindex = {
		492111,
		105,
		true
	},
	indexsort_label = {
		492216,
		88,
		true
	},
	indexsort_sorteng = {
		492304,
		85,
		true
	},
	indexsort_indexeng = {
		492389,
		87,
		true
	},
	indexsort_campeng = {
		492476,
		92,
		true
	},
	indexsort_rarityeng = {
		492568,
		89,
		true
	},
	indexsort_typeeng = {
		492657,
		85,
		true
	},
	indexsort_labeleng = {
		492742,
		87,
		true
	},
	fightfail_up = {
		492829,
		167,
		true
	},
	fightfail_equip = {
		492996,
		173,
		true
	},
	fight_strengthen = {
		493169,
		195,
		true
	},
	fightfail_noequip = {
		493364,
		117,
		true
	},
	fightfail_choiceequip = {
		493481,
		143,
		true
	},
	fightfail_choicestrengthen = {
		493624,
		148,
		true
	},
	sofmap_attention = {
		493772,
		235,
		true
	},
	sofmapsd_1 = {
		494007,
		167,
		true
	},
	sofmapsd_2 = {
		494174,
		148,
		true
	},
	sofmapsd_3 = {
		494322,
		115,
		true
	},
	sofmapsd_4 = {
		494437,
		136,
		true
	},
	inform_level_limit = {
		494573,
		123,
		true
	},
	["3match_tip"] = {
		494696,
		381,
		true
	},
	retire_selectzero = {
		495077,
		130,
		true
	},
	retire_marry_skin = {
		495207,
		128,
		true
	},
	undermist_tip = {
		495335,
		119,
		true
	},
	retire_1 = {
		495454,
		217,
		true
	},
	retire_2 = {
		495671,
		220,
		true
	},
	retire_3 = {
		495891,
		94,
		true
	},
	retire_rarity = {
		495985,
		97,
		true
	},
	retire_title = {
		496082,
		94,
		true
	},
	res_unlock_tip = {
		496176,
		181,
		true
	},
	res_wifi_tip = {
		496357,
		177,
		true
	},
	res_downloading = {
		496534,
		100,
		true
	},
	res_pic_new_tip = {
		496634,
		120,
		true
	},
	res_music_no_pre_tip = {
		496754,
		102,
		true
	},
	res_music_no_next_tip = {
		496856,
		103,
		true
	},
	res_music_new_tip = {
		496959,
		119,
		true
	},
	apple_link_title = {
		497078,
		113,
		true
	},
	retire_setting_help = {
		497191,
		926,
		true
	},
	activity_shop_exchange_count = {
		498117,
		104,
		true
	},
	shops_msgbox_exchange_count = {
		498221,
		104,
		true
	},
	shops_msgbox_output = {
		498325,
		92,
		true
	},
	shop_word_exchange = {
		498417,
		89,
		true
	},
	shop_word_cancel = {
		498506,
		87,
		true
	},
	title_item_ways = {
		498593,
		138,
		true
	},
	item_lack_title = {
		498731,
		138,
		true
	},
	oil_buy_tip_2 = {
		498869,
		414,
		true
	},
	target_chapter_is_lock = {
		499283,
		141,
		true
	},
	ship_book = {
		499424,
		82,
		true
	},
	collect_tip = {
		499506,
		154,
		true
	},
	collect_tip2 = {
		499660,
		149,
		true
	},
	word_weakness = {
		499809,
		83,
		true
	},
	special_operation_tip1 = {
		499892,
		122,
		true
	},
	special_operation_tip2 = {
		500014,
		122,
		true
	},
	area_lock = {
		500136,
		115,
		true
	},
	equipment_upgrade_equipped_tag = {
		500251,
		106,
		true
	},
	equipment_upgrade_spare_tag = {
		500357,
		100,
		true
	},
	equipment_upgrade_help = {
		500457,
		1377,
		true
	},
	equipment_upgrade_title = {
		501834,
		99,
		true
	},
	equipment_upgrade_coin_consume = {
		501933,
		106,
		true
	},
	equipment_upgrade_quick_interface_source_chosen = {
		502039,
		145,
		true
	},
	equipment_upgrade_quick_interface_materials_consume = {
		502184,
		152,
		true
	},
	equipment_upgrade_feedback_lack_of_materials = {
		502336,
		120,
		true
	},
	equipment_upgrade_feedback_equipment_consume = {
		502456,
		216,
		true
	},
	equipment_upgrade_feedback_equipment_can_be_produced = {
		502672,
		213,
		true
	},
	equipment_upgrade_quick_interface_feedback_source_chosen = {
		502885,
		169,
		true
	},
	equipment_upgrade_feedback_lack_of_equipment = {
		503054,
		205,
		true
	},
	equipment_upgrade_equipped_unavailable = {
		503259,
		242,
		true
	},
	equipment_upgrade_initial_node = {
		503501,
		149,
		true
	},
	equipment_upgrade_feedback_compose_tip = {
		503650,
		251,
		true
	},
	pizzahut_help = {
		503901,
		787,
		true
	},
	towerclimbing_gametip = {
		504688,
		881,
		true
	},
	qingdianguangchang_help = {
		505569,
		2165,
		true
	},
	building_tip = {
		507734,
		196,
		true
	},
	building_upgrade_tip = {
		507930,
		114,
		true
	},
	msgbox_text_upgrade = {
		508044,
		90,
		true
	},
	towerclimbing_sign_help = {
		508134,
		524,
		true
	},
	building_complete_tip = {
		508658,
		112,
		true
	},
	backyard_theme_refresh_time_tip = {
		508770,
		113,
		true
	},
	backyard_theme_total_print = {
		508883,
		96,
		true
	},
	backyard_theme_word_buy = {
		508979,
		93,
		true
	},
	backyard_theme_word_apply = {
		509072,
		95,
		true
	},
	backyard_theme_apply_success = {
		509167,
		110,
		true
	},
	words_visit_backyard_toggle = {
		509277,
		121,
		true
	},
	words_show_friend_backyardship_toggle = {
		509398,
		138,
		true
	},
	words_show_my_backyardship_toggle = {
		509536,
		134,
		true
	},
	option_desc7 = {
		509670,
		136,
		true
	},
	option_desc8 = {
		509806,
		198,
		true
	},
	option_desc9 = {
		510004,
		184,
		true
	},
	backyard_unopen = {
		510188,
		124,
		true
	},
	help_monopoly_car = {
		510312,
		1350,
		true
	},
	help_monopoly_car_2 = {
		511662,
		1517,
		true
	},
	help_monopoly_3th = {
		513179,
		934,
		true
	},
	backYard_missing_furnitrue_tip = {
		514113,
		112,
		true
	},
	win_condition_display_qijian = {
		514225,
		113,
		true
	},
	win_condition_display_qijian_tip = {
		514338,
		139,
		true
	},
	win_condition_display_shangchuan = {
		514477,
		130,
		true
	},
	win_condition_display_shangchuan_tip = {
		514607,
		170,
		true
	},
	win_condition_display_judian = {
		514777,
		116,
		true
	},
	win_condition_display_tuoli = {
		514893,
		121,
		true
	},
	win_condition_display_tuoli_tip = {
		515014,
		128,
		true
	},
	lose_condition_display_quanmie = {
		515142,
		112,
		true
	},
	lose_condition_display_gangqu = {
		515254,
		132,
		true
	},
	re_battle = {
		515386,
		85,
		true
	},
	keep_fate_tip = {
		515471,
		146,
		true
	},
	equip_info_1 = {
		515617,
		88,
		true
	},
	equip_info_2 = {
		515705,
		88,
		true
	},
	equip_info_3 = {
		515793,
		97,
		true
	},
	equip_info_4 = {
		515890,
		85,
		true
	},
	equip_info_5 = {
		515975,
		82,
		true
	},
	equip_info_6 = {
		516057,
		88,
		true
	},
	equip_info_7 = {
		516145,
		88,
		true
	},
	equip_info_8 = {
		516233,
		88,
		true
	},
	equip_info_9 = {
		516321,
		88,
		true
	},
	equip_info_10 = {
		516409,
		89,
		true
	},
	equip_info_11 = {
		516498,
		89,
		true
	},
	equip_info_12 = {
		516587,
		89,
		true
	},
	equip_info_13 = {
		516676,
		83,
		true
	},
	equip_info_14 = {
		516759,
		89,
		true
	},
	equip_info_15 = {
		516848,
		89,
		true
	},
	equip_info_16 = {
		516937,
		89,
		true
	},
	equip_info_17 = {
		517026,
		89,
		true
	},
	equip_info_18 = {
		517115,
		89,
		true
	},
	equip_info_19 = {
		517204,
		89,
		true
	},
	equip_info_20 = {
		517293,
		92,
		true
	},
	equip_info_21 = {
		517385,
		92,
		true
	},
	equip_info_22 = {
		517477,
		98,
		true
	},
	equip_info_23 = {
		517575,
		89,
		true
	},
	equip_info_24 = {
		517664,
		89,
		true
	},
	equip_info_25 = {
		517753,
		78,
		true
	},
	equip_info_26 = {
		517831,
		95,
		true
	},
	equip_info_27 = {
		517926,
		77,
		true
	},
	equip_info_28 = {
		518003,
		101,
		true
	},
	equip_info_29 = {
		518104,
		95,
		true
	},
	equip_info_30 = {
		518199,
		89,
		true
	},
	equip_info_31 = {
		518288,
		83,
		true
	},
	equip_info_32 = {
		518371,
		95,
		true
	},
	equip_info_33 = {
		518466,
		95,
		true
	},
	equip_info_34 = {
		518561,
		89,
		true
	},
	equip_info_extralevel_0 = {
		518650,
		97,
		true
	},
	equip_info_extralevel_1 = {
		518747,
		97,
		true
	},
	equip_info_extralevel_2 = {
		518844,
		97,
		true
	},
	equip_info_extralevel_3 = {
		518941,
		97,
		true
	},
	tec_settings_btn_word = {
		519038,
		97,
		true
	},
	tec_tendency_x = {
		519135,
		92,
		true
	},
	tec_tendency_0 = {
		519227,
		90,
		true
	},
	tec_tendency_1 = {
		519317,
		93,
		true
	},
	tec_tendency_2 = {
		519410,
		93,
		true
	},
	tec_tendency_3 = {
		519503,
		93,
		true
	},
	tec_tendency_4 = {
		519596,
		93,
		true
	},
	tec_tendency_cur_x = {
		519689,
		99,
		true
	},
	tec_tendency_cur_0 = {
		519788,
		107,
		true
	},
	tec_tendency_cur_1 = {
		519895,
		100,
		true
	},
	tec_tendency_cur_2 = {
		519995,
		100,
		true
	},
	tec_tendency_cur_3 = {
		520095,
		100,
		true
	},
	tec_target_catchup_none = {
		520195,
		111,
		true
	},
	tec_target_catchup_selected = {
		520306,
		103,
		true
	},
	tec_tendency_cur_4 = {
		520409,
		100,
		true
	},
	tec_target_catchup_none_x = {
		520509,
		116,
		true
	},
	tec_target_catchup_none_1 = {
		520625,
		117,
		true
	},
	tec_target_catchup_none_2 = {
		520742,
		117,
		true
	},
	tec_target_catchup_none_3 = {
		520859,
		117,
		true
	},
	tec_target_catchup_selected_x = {
		520976,
		120,
		true
	},
	tec_target_catchup_selected_1 = {
		521096,
		121,
		true
	},
	tec_target_catchup_selected_2 = {
		521217,
		121,
		true
	},
	tec_target_catchup_selected_3 = {
		521338,
		121,
		true
	},
	tec_target_catchup_finish_x = {
		521459,
		115,
		true
	},
	tec_target_catchup_finish_1 = {
		521574,
		116,
		true
	},
	tec_target_catchup_finish_2 = {
		521690,
		116,
		true
	},
	tec_target_catchup_finish_3 = {
		521806,
		116,
		true
	},
	tec_target_catchup_dr_finish_tip = {
		521922,
		108,
		true
	},
	tec_target_catchup_all_finish_tip = {
		522030,
		109,
		true
	},
	tec_target_catchup_show_the_finished_version = {
		522139,
		166,
		true
	},
	tec_target_catchup_pry_char = {
		522305,
		103,
		true
	},
	tec_target_catchup_dr_char = {
		522408,
		102,
		true
	},
	tec_target_need_print = {
		522510,
		97,
		true
	},
	tec_target_catchup_progress = {
		522607,
		131,
		true
	},
	tec_target_catchup_select_tip = {
		522738,
		141,
		true
	},
	tec_target_catchup_help_tip = {
		522879,
		1097,
		true
	},
	tec_speedup_title = {
		523976,
		93,
		true
	},
	tec_speedup_progress = {
		524069,
		95,
		true
	},
	tec_speedup_overflow = {
		524164,
		223,
		true
	},
	tec_speedup_help_tip = {
		524387,
		327,
		true
	},
	click_back_tip = {
		524714,
		102,
		true
	},
	tech_catchup_sentence_pauses = {
		524816,
		98,
		true
	},
	tec_act_catchup_btn_word = {
		524914,
		106,
		true
	},
	tec_catchup_errorfix = {
		525020,
		232,
		true
	},
	guild_duty_is_too_low = {
		525252,
		170,
		true
	},
	guild_trainee_duty_change_tip = {
		525422,
		157,
		true
	},
	guild_not_exist_donate_task = {
		525579,
		124,
		true
	},
	guild_week_task_state_is_wrong = {
		525703,
		149,
		true
	},
	guild_get_week_done = {
		525852,
		132,
		true
	},
	guild_public_awards = {
		525984,
		101,
		true
	},
	guild_private_awards = {
		526085,
		105,
		true
	},
	guild_task_selecte_tip = {
		526190,
		243,
		true
	},
	guild_task_accept = {
		526433,
		363,
		true
	},
	guild_commander_and_sub_op = {
		526796,
		155,
		true
	},
	["guild_donate_times_not enough"] = {
		526951,
		146,
		true
	},
	guild_donate_success = {
		527097,
		111,
		true
	},
	guild_left_donate_cnt = {
		527208,
		111,
		true
	},
	guild_donate_tip = {
		527319,
		225,
		true
	},
	guild_donate_addition_capital_tip = {
		527544,
		136,
		true
	},
	guild_donate_addition_techpoint_tip = {
		527680,
		141,
		true
	},
	guild_donate_capital_toplimit = {
		527821,
		216,
		true
	},
	guild_donate_techpoint_toplimit = {
		528037,
		218,
		true
	},
	guild_supply_no_open = {
		528255,
		130,
		true
	},
	guild_supply_award_got = {
		528385,
		125,
		true
	},
	guild_new_member_get_award_tip = {
		528510,
		158,
		true
	},
	guild_start_supply_consume_tip = {
		528668,
		166,
		true
	},
	guild_left_supply_day = {
		528834,
		96,
		true
	},
	guild_supply_help_tip = {
		528930,
		661,
		true
	},
	guild_op_only_administrator = {
		529591,
		156,
		true
	},
	guild_shop_refresh_done = {
		529747,
		111,
		true
	},
	guild_shop_cnt_no_enough = {
		529858,
		109,
		true
	},
	guild_shop_refresh_all_tip = {
		529967,
		209,
		true
	},
	guild_shop_exchange_tip = {
		530176,
		133,
		true
	},
	guild_shop_label_1 = {
		530309,
		134,
		true
	},
	guild_shop_label_2 = {
		530443,
		97,
		true
	},
	guild_shop_label_3 = {
		530540,
		88,
		true
	},
	guild_shop_label_4 = {
		530628,
		88,
		true
	},
	guild_shop_label_5 = {
		530716,
		137,
		true
	},
	guild_shop_must_select_goods = {
		530853,
		144,
		true
	},
	guild_not_exist_activation_tech = {
		530997,
		141,
		true
	},
	guild_not_exist_tech = {
		531138,
		117,
		true
	},
	guild_cancel_only_once_pre_day = {
		531255,
		168,
		true
	},
	guild_tech_is_max_level = {
		531423,
		126,
		true
	},
	guild_tech_gold_no_enough = {
		531549,
		150,
		true
	},
	guild_tech_guildgold_no_enough = {
		531699,
		157,
		true
	},
	guild_tech_upgrade_done = {
		531856,
		130,
		true
	},
	guild_exist_activation_tech = {
		531986,
		156,
		true
	},
	guild_tech_gold_desc = {
		532142,
		107,
		true
	},
	guild_tech_oil_desc = {
		532249,
		104,
		true
	},
	guild_tech_shipbag_desc = {
		532353,
		105,
		true
	},
	guild_tech_equipbag_desc = {
		532458,
		103,
		true
	},
	guild_box_gold_desc = {
		532561,
		113,
		true
	},
	guidl_r_box_time_desc = {
		532674,
		118,
		true
	},
	guidl_sr_box_time_desc = {
		532792,
		120,
		true
	},
	guidl_ssr_box_time_desc = {
		532912,
		122,
		true
	},
	guild_member_max_cnt_desc = {
		533034,
		122,
		true
	},
	guild_tech_livness_no_enough = {
		533156,
		308,
		true
	},
	guild_tech_livness_no_enough_label = {
		533464,
		124,
		true
	},
	guild_ship_attr_desc = {
		533588,
		114,
		true
	},
	guild_start_tech_group_tip = {
		533702,
		180,
		true
	},
	guild_cancel_tech_tip = {
		533882,
		218,
		true
	},
	guild_tech_consume_tip = {
		534100,
		246,
		true
	},
	guild_tech_non_admin = {
		534346,
		149,
		true
	},
	guild_tech_label_max_level = {
		534495,
		101,
		true
	},
	guild_tech_label_dev_progress = {
		534596,
		105,
		true
	},
	guild_tech_label_condition = {
		534701,
		123,
		true
	},
	guild_tech_donate_target = {
		534824,
		117,
		true
	},
	guild_not_exist = {
		534941,
		109,
		true
	},
	guild_not_exist_battle = {
		535050,
		122,
		true
	},
	guild_battle_is_end = {
		535172,
		119,
		true
	},
	guild_battle_is_exist = {
		535291,
		137,
		true
	},
	guild_guildgold_no_enough_for_battle = {
		535428,
		179,
		true
	},
	guild_event_start_tip1 = {
		535607,
		195,
		true
	},
	guild_event_start_tip2 = {
		535802,
		192,
		true
	},
	guild_word_may_happen_event = {
		535994,
		121,
		true
	},
	guild_battle_award = {
		536115,
		94,
		true
	},
	guild_word_consume = {
		536209,
		88,
		true
	},
	guild_start_event_consume_tip = {
		536297,
		161,
		true
	},
	guild_start_event_consume_tip_extra = {
		536458,
		247,
		true
	},
	guild_word_consume_for_battle = {
		536705,
		105,
		true
	},
	guild_level_no_enough = {
		536810,
		164,
		true
	},
	guild_open_event_info_when_exist_active = {
		536974,
		175,
		true
	},
	guild_join_event_cnt_label = {
		537149,
		117,
		true
	},
	guild_join_event_max_cnt_tip = {
		537266,
		135,
		true
	},
	guild_join_event_progress_label = {
		537401,
		110,
		true
	},
	guild_join_event_exist_finished_mission_tip = {
		537511,
		213,
		true
	},
	guild_event_not_exist = {
		537724,
		118,
		true
	},
	guild_fleet_can_not_edit = {
		537842,
		118,
		true
	},
	guild_fleet_exist_same_kind_ship = {
		537960,
		166,
		true
	},
	guild_event_exist_same_kind_ship = {
		538126,
		166,
		true
	},
	guidl_event_ship_in_event = {
		538292,
		156,
		true
	},
	guild_event_start_done = {
		538448,
		98,
		true
	},
	guild_fleet_update_done = {
		538546,
		123,
		true
	},
	guild_event_is_lock = {
		538669,
		125,
		true
	},
	guild_event_is_finish = {
		538794,
		182,
		true
	},
	guild_fleet_not_save_tip = {
		538976,
		167,
		true
	},
	guild_word_battle_area = {
		539143,
		101,
		true
	},
	guild_word_battle_type = {
		539244,
		101,
		true
	},
	guild_wrod_battle_target = {
		539345,
		103,
		true
	},
	guild_event_recomm_ship_failed = {
		539448,
		146,
		true
	},
	guild_event_start_event_tip = {
		539594,
		200,
		true
	},
	guild_word_sea = {
		539794,
		84,
		true
	},
	guild_word_score_addition = {
		539878,
		100,
		true
	},
	guild_word_effect_addition = {
		539978,
		101,
		true
	},
	guild_curr_fleet_can_not_edit = {
		540079,
		130,
		true
	},
	guild_next_edit_fleet_time = {
		540209,
		135,
		true
	},
	guild_event_info_desc1 = {
		540344,
		162,
		true
	},
	guild_event_info_desc2 = {
		540506,
		147,
		true
	},
	guild_join_member_cnt = {
		540653,
		100,
		true
	},
	guild_total_effect = {
		540753,
		91,
		true
	},
	guild_word_people = {
		540844,
		84,
		true
	},
	guild_event_info_desc3 = {
		540928,
		104,
		true
	},
	guild_not_exist_boss = {
		541032,
		117,
		true
	},
	guild_ship_from = {
		541149,
		84,
		true
	},
	guild_boss_formation_1 = {
		541233,
		166,
		true
	},
	guild_boss_formation_2 = {
		541399,
		166,
		true
	},
	guild_boss_formation_3 = {
		541565,
		138,
		true
	},
	guild_boss_cnt_no_enough = {
		541703,
		124,
		true
	},
	guild_boss_fleet_cnt_invaild = {
		541827,
		177,
		true
	},
	guild_boss_formation_not_exist_self_ship = {
		542004,
		211,
		true
	},
	guild_boss_formation_exist_event_ship = {
		542215,
		182,
		true
	},
	guild_fleet_is_legal = {
		542397,
		173,
		true
	},
	guild_battle_result_boss_is_death = {
		542570,
		188,
		true
	},
	guild_must_edit_fleet = {
		542758,
		124,
		true
	},
	guild_ship_in_battle = {
		542882,
		174,
		true
	},
	guild_ship_in_assult_fleet = {
		543056,
		145,
		true
	},
	guild_event_exist_assult_ship = {
		543201,
		151,
		true
	},
	guild_formation_erro_in_boss_battle = {
		543352,
		184,
		true
	},
	guild_get_report_failed = {
		543536,
		145,
		true
	},
	guild_report_get_all = {
		543681,
		96,
		true
	},
	guild_can_not_get_tip = {
		543777,
		176,
		true
	},
	guild_not_exist_notifycation = {
		543953,
		144,
		true
	},
	guild_exist_report_award_when_exit = {
		544097,
		171,
		true
	},
	guild_report_tooltip = {
		544268,
		241,
		true
	},
	word_guildgold = {
		544509,
		86,
		true
	},
	guild_member_rank_title_donate = {
		544595,
		106,
		true
	},
	guild_member_rank_title_finish_cnt = {
		544701,
		110,
		true
	},
	guild_member_rank_title_join_cnt = {
		544811,
		108,
		true
	},
	guild_donate_log = {
		544919,
		163,
		true
	},
	guild_supply_log = {
		545082,
		169,
		true
	},
	guild_weektask_log = {
		545251,
		151,
		true
	},
	guild_battle_log = {
		545402,
		161,
		true
	},
	guild_tech_change_log = {
		545563,
		141,
		true
	},
	guild_log_title = {
		545704,
		91,
		true
	},
	guild_use_donateitem_success = {
		545795,
		141,
		true
	},
	guild_use_battleitem_success = {
		545936,
		150,
		true
	},
	not_exist_guild_use_item = {
		546086,
		167,
		true
	},
	guild_member_tip = {
		546253,
		3081,
		true
	},
	guild_tech_tip = {
		549334,
		3324,
		true
	},
	guild_office_tip = {
		552658,
		2827,
		true
	},
	guild_event_help_tip = {
		555485,
		2874,
		true
	},
	guild_mission_info_tip = {
		558359,
		1512,
		true
	},
	guild_public_tech_tip = {
		559871,
		1337,
		true
	},
	guild_public_office_tip = {
		561208,
		332,
		true
	},
	guild_tech_price_inc_tip = {
		561540,
		309,
		true
	},
	guild_boss_fleet_desc = {
		561849,
		555,
		true
	},
	guild_boss_formation_exist_invaild_ship = {
		562404,
		215,
		true
	},
	guild_exist_unreceived_supply_award = {
		562619,
		127,
		true
	},
	word_shipState_guild_event = {
		562746,
		157,
		true
	},
	word_shipState_guild_boss = {
		562903,
		201,
		true
	},
	commander_is_in_guild = {
		563104,
		203,
		true
	},
	guild_assult_ship_recommend = {
		563307,
		155,
		true
	},
	guild_cancel_assult_ship_recommend = {
		563462,
		162,
		true
	},
	guild_assult_ship_recommend_conflict = {
		563624,
		170,
		true
	},
	guild_recommend_limit = {
		563794,
		171,
		true
	},
	guild_cancel_assult_ship_recommend_conflict = {
		563965,
		177,
		true
	},
	guild_mission_complate = {
		564142,
		112,
		true
	},
	guild_operation_event_occurrence = {
		564254,
		178,
		true
	},
	guild_transfer_president_confirm = {
		564432,
		229,
		true
	},
	guild_damage_ranking = {
		564661,
		90,
		true
	},
	guild_total_damage = {
		564751,
		94,
		true
	},
	guild_donate_list_updated = {
		564845,
		138,
		true
	},
	guild_donate_list_update_failed = {
		564983,
		153,
		true
	},
	guild_tip_quit_operation = {
		565136,
		225,
		true
	},
	guild_tip_grand_fleet_is_frozen = {
		565361,
		159,
		true
	},
	guild_tip_operation_time_is_not_ample = {
		565520,
		344,
		true
	},
	guild_time_remaining_tip = {
		565864,
		107,
		true
	},
	help_rollingBallGame = {
		565971,
		1483,
		true
	},
	rolling_ball_help = {
		567454,
		1007,
		true
	},
	help_jiujiu_expedition_game = {
		568461,
		854,
		true
	},
	jiujiu_expedition_game_stg_desc = {
		569315,
		118,
		true
	},
	build_ship_accumulative = {
		569433,
		100,
		true
	},
	destory_ship_before_tip = {
		569533,
		114,
		true
	},
	destory_ship_input_erro = {
		569647,
		142,
		true
	},
	destroy_ur_rarity_tip = {
		569789,
		218,
		true
	},
	destory_ur_pt_overflowa = {
		570007,
		297,
		true
	},
	jiujiu_expedition_help = {
		570304,
		996,
		true
	},
	shop_label_unlimt_cnt = {
		571300,
		94,
		true
	},
	jiujiu_expedition_book_tip = {
		571394,
		151,
		true
	},
	jiujiu_expedition_reward_tip = {
		571545,
		150,
		true
	},
	jiujiu_expedition_amount_tip = {
		571695,
		210,
		true
	},
	jiujiu_expedition_stg_tip = {
		571905,
		150,
		true
	},
	trade_card_tips1 = {
		572055,
		92,
		true
	},
	trade_card_tips2 = {
		572147,
		333,
		true
	},
	trade_card_tips3 = {
		572480,
		330,
		true
	},
	trade_card_tips4 = {
		572810,
		88,
		true
	},
	ur_exchange_help_tip = {
		572898,
		1225,
		true
	},
	fleet_antisub_range = {
		574123,
		95,
		true
	},
	fleet_antisub_range_tip = {
		574218,
		1184,
		true
	},
	practise_idol_tip = {
		575402,
		165,
		true
	},
	practise_idol_help = {
		575567,
		1171,
		true
	},
	upgrade_idol_tip = {
		576738,
		132,
		true
	},
	upgrade_complete_tip = {
		576870,
		102,
		true
	},
	upgrade_introduce_tip = {
		576972,
		124,
		true
	},
	collect_idol_tip = {
		577096,
		159,
		true
	},
	hand_account_tip = {
		577255,
		125,
		true
	},
	hand_account_resetting_tip = {
		577380,
		123,
		true
	},
	help_candymagic = {
		577503,
		1659,
		true
	},
	award_overflow_tip = {
		579162,
		158,
		true
	},
	hunter_npc = {
		579320,
		1365,
		true
	},
	venusvolleyball_help = {
		580685,
		1228,
		true
	},
	venusvolleyball_rule_tip = {
		581913,
		105,
		true
	},
	venusvolleyball_return_tip = {
		582018,
		130,
		true
	},
	venusvolleyball_suspend_tip = {
		582148,
		131,
		true
	},
	doa_main = {
		582279,
		2170,
		true
	},
	doa_pt_help = {
		584449,
		1059,
		true
	},
	doa_pt_complete = {
		585508,
		91,
		true
	},
	doa_pt_up = {
		585599,
		111,
		true
	},
	doa_liliang = {
		585710,
		78,
		true
	},
	doa_jiqiao = {
		585788,
		77,
		true
	},
	doa_tili = {
		585865,
		75,
		true
	},
	doa_meili = {
		585940,
		77,
		true
	},
	snowball_help = {
		586017,
		1358,
		true
	},
	help_xinnian2021_feast = {
		587375,
		1463,
		true
	},
	help_xinnian2021__qiaozhong = {
		588838,
		1329,
		true
	},
	help_xinnian2021__meishiyemian = {
		590167,
		1729,
		true
	},
	help_xinnian2021__meishi = {
		591896,
		1723,
		true
	},
	help_act_event = {
		593619,
		286,
		true
	},
	autofight = {
		593905,
		85,
		true
	},
	autofight_errors_tip = {
		593990,
		169,
		true
	},
	autofight_special_operation_tip = {
		594159,
		326,
		true
	},
	autofight_formation = {
		594485,
		89,
		true
	},
	autofight_cat = {
		594574,
		89,
		true
	},
	autofight_function = {
		594663,
		94,
		true
	},
	autofight_function1 = {
		594757,
		95,
		true
	},
	autofight_function2 = {
		594852,
		95,
		true
	},
	autofight_function3 = {
		594947,
		92,
		true
	},
	autofight_function4 = {
		595039,
		89,
		true
	},
	autofight_function5 = {
		595128,
		101,
		true
	},
	autofight_rewards = {
		595229,
		99,
		true
	},
	autofight_rewards_none = {
		595328,
		125,
		true
	},
	autofight_leave = {
		595453,
		85,
		true
	},
	autofight_onceagain = {
		595538,
		95,
		true
	},
	autofight_entrust = {
		595633,
		104,
		true
	},
	autofight_task = {
		595737,
		110,
		true
	},
	autofight_effect = {
		595847,
		137,
		true
	},
	autofight_file = {
		595984,
		95,
		true
	},
	autofight_discovery = {
		596079,
		112,
		true
	},
	autofight_tip_bigworld_dead = {
		596191,
		167,
		true
	},
	autofight_tip_bigworld_begin = {
		596358,
		147,
		true
	},
	autofight_tip_bigworld_stop = {
		596505,
		146,
		true
	},
	autofight_tip_bigworld_suspend = {
		596651,
		197,
		true
	},
	autofight_tip_bigworld_loop = {
		596848,
		176,
		true
	},
	autofight_farm = {
		597024,
		93,
		true
	},
	autofight_story = {
		597117,
		124,
		true
	},
	fushun_adventure_help = {
		597241,
		1626,
		true
	},
	autofight_change_tip = {
		598867,
		177,
		true
	},
	autofight_selectprops_tip = {
		599044,
		119,
		true
	},
	help_chunjie2021_feast = {
		599163,
		673,
		true
	},
	valentinesday__txt1_tip = {
		599836,
		166,
		true
	},
	valentinesday__txt2_tip = {
		600002,
		157,
		true
	},
	valentinesday__txt3_tip = {
		600159,
		143,
		true
	},
	valentinesday__txt4_tip = {
		600302,
		163,
		true
	},
	valentinesday__txt5_tip = {
		600465,
		151,
		true
	},
	valentinesday__txt6_tip = {
		600616,
		175,
		true
	},
	valentinesday__shop_tip = {
		600791,
		136,
		true
	},
	wwf_bamboo_tip1 = {
		600927,
		109,
		true
	},
	wwf_bamboo_tip2 = {
		601036,
		109,
		true
	},
	wwf_bamboo_tip3 = {
		601145,
		143,
		true
	},
	wwf_bamboo_help = {
		601288,
		1435,
		true
	},
	wwf_guide_tip = {
		602723,
		122,
		true
	},
	securitycake_help = {
		602845,
		2621,
		true
	},
	icecream_help = {
		605466,
		916,
		true
	},
	icecream_make_tip = {
		606382,
		95,
		true
	},
	query_role = {
		606477,
		83,
		true
	},
	query_role_none = {
		606560,
		88,
		true
	},
	query_role_button = {
		606648,
		93,
		true
	},
	query_role_fail = {
		606741,
		91,
		true
	},
	cumulative_victory_target_tip = {
		606832,
		114,
		true
	},
	cumulative_victory_now_tip = {
		606946,
		111,
		true
	},
	word_files_repair = {
		607057,
		102,
		true
	},
	repair_setting_label = {
		607159,
		103,
		true
	},
	voice_control = {
		607262,
		89,
		true
	},
	index_equip = {
		607351,
		84,
		true
	},
	index_without_limit = {
		607435,
		92,
		true
	},
	meta_learn_skill = {
		607527,
		108,
		true
	},
	world_joint_boss_not_found = {
		607635,
		169,
		true
	},
	world_joint_boss_is_death = {
		607804,
		168,
		true
	},
	world_joint_whitout_guild = {
		607972,
		132,
		true
	},
	world_joint_whitout_friend = {
		608104,
		123,
		true
	},
	world_joint_call_support_failed = {
		608227,
		128,
		true
	},
	world_joint_call_support_success = {
		608355,
		130,
		true
	},
	world_joint_call_friend_support_txt = {
		608485,
		163,
		true
	},
	world_joint_call_guild_support_txt = {
		608648,
		171,
		true
	},
	world_joint_call_world_support_txt = {
		608819,
		165,
		true
	},
	ad_4 = {
		608984,
		223,
		true
	},
	world_word_expired = {
		609207,
		124,
		true
	},
	world_word_guild_member = {
		609331,
		113,
		true
	},
	world_word_guild_player = {
		609444,
		104,
		true
	},
	world_joint_boss_award_expired = {
		609548,
		131,
		true
	},
	world_joint_not_refresh_frequently = {
		609679,
		153,
		true
	},
	world_joint_exit_battle_tip = {
		609832,
		153,
		true
	},
	world_boss_get_item = {
		609985,
		191,
		true
	},
	world_boss_ask_help = {
		610176,
		141,
		true
	},
	world_joint_count_no_enough = {
		610317,
		134,
		true
	},
	world_boss_none = {
		610451,
		121,
		true
	},
	world_boss_fleet = {
		610572,
		93,
		true
	},
	world_max_challenge_cnt = {
		610665,
		172,
		true
	},
	world_reset_success = {
		610837,
		135,
		true
	},
	world_map_dangerous_confirm = {
		610972,
		235,
		true
	},
	world_map_version = {
		611207,
		166,
		true
	},
	world_resource_fill = {
		611373,
		147,
		true
	},
	meta_sys_lock_tip = {
		611520,
		159,
		true
	},
	meta_story_lock = {
		611679,
		139,
		true
	},
	meta_acttime_limit = {
		611818,
		88,
		true
	},
	meta_pt_left = {
		611906,
		87,
		true
	},
	meta_syn_rate = {
		611993,
		89,
		true
	},
	meta_repair_rate = {
		612082,
		95,
		true
	},
	meta_story_tip_1 = {
		612177,
		103,
		true
	},
	meta_story_tip_2 = {
		612280,
		100,
		true
	},
	meta_pt_get_way = {
		612380,
		130,
		true
	},
	meta_pt_point = {
		612510,
		85,
		true
	},
	meta_award_get = {
		612595,
		87,
		true
	},
	meta_award_got = {
		612682,
		87,
		true
	},
	meta_repair = {
		612769,
		88,
		true
	},
	meta_repair_success = {
		612857,
		116,
		true
	},
	meta_repair_effect_unlock = {
		612973,
		107,
		true
	},
	meta_repair_effect_special = {
		613080,
		133,
		true
	},
	meta_energy_ship_level_need = {
		613213,
		114,
		true
	},
	meta_energy_ship_repairrate_need = {
		613327,
		126,
		true
	},
	meta_energy_active_box_tip = {
		613453,
		168,
		true
	},
	meta_break = {
		613621,
		100,
		true
	},
	meta_energy_preview_title = {
		613721,
		110,
		true
	},
	meta_energy_preview_tip = {
		613831,
		139,
		true
	},
	meta_exp_per_day = {
		613970,
		89,
		true
	},
	meta_skill_unlock = {
		614059,
		130,
		true
	},
	meta_unlock_skill_tip = {
		614189,
		147,
		true
	},
	meta_unlock_skill_select = {
		614336,
		123,
		true
	},
	meta_switch_skill_disable = {
		614459,
		156,
		true
	},
	meta_switch_skill_box_title = {
		614615,
		126,
		true
	},
	meta_cur_pt = {
		614741,
		83,
		true
	},
	meta_toast_fullexp = {
		614824,
		94,
		true
	},
	meta_toast_tactics = {
		614918,
		91,
		true
	},
	meta_skillbtn_tactics = {
		615009,
		92,
		true
	},
	meta_destroy_tip = {
		615101,
		114,
		true
	},
	meta_voice_name_feeling1 = {
		615215,
		94,
		true
	},
	meta_voice_name_feeling2 = {
		615309,
		94,
		true
	},
	meta_voice_name_feeling3 = {
		615403,
		94,
		true
	},
	meta_voice_name_feeling4 = {
		615497,
		94,
		true
	},
	meta_voice_name_feeling5 = {
		615591,
		91,
		true
	},
	meta_voice_name_propose = {
		615682,
		99,
		true
	},
	world_boss_ad = {
		615781,
		88,
		true
	},
	world_boss_drop_title = {
		615869,
		108,
		true
	},
	world_boss_pt_recove_desc = {
		615977,
		119,
		true
	},
	world_boss_progress_item_desc = {
		616096,
		448,
		true
	},
	world_joint_max_challenge_people_cnt = {
		616544,
		143,
		true
	},
	equip_ammo_type_1 = {
		616687,
		90,
		true
	},
	equip_ammo_type_2 = {
		616777,
		87,
		true
	},
	equip_ammo_type_3 = {
		616864,
		90,
		true
	},
	equip_ammo_type_4 = {
		616954,
		87,
		true
	},
	equip_ammo_type_5 = {
		617041,
		87,
		true
	},
	equip_ammo_type_6 = {
		617128,
		90,
		true
	},
	equip_ammo_type_7 = {
		617218,
		87,
		true
	},
	equip_ammo_type_8 = {
		617305,
		90,
		true
	},
	equip_ammo_type_9 = {
		617395,
		90,
		true
	},
	equip_ammo_type_10 = {
		617485,
		88,
		true
	},
	equip_ammo_type_11 = {
		617573,
		94,
		true
	},
	common_daily_limit = {
		617667,
		105,
		true
	},
	meta_help = {
		617772,
		3170,
		true
	},
	world_boss_daily_limit = {
		620942,
		104,
		true
	},
	common_go_to_analyze = {
		621046,
		99,
		true
	},
	world_boss_not_reach_target = {
		621145,
		109,
		true
	},
	special_transform_limit_reach = {
		621254,
		193,
		true
	},
	meta_pt_notenough = {
		621447,
		154,
		true
	},
	meta_boss_unlock = {
		621601,
		184,
		true
	},
	word_take_effect = {
		621785,
		92,
		true
	},
	world_boss_challenge_cnt = {
		621877,
		97,
		true
	},
	word_shipNation_meta = {
		621974,
		87,
		true
	},
	world_word_friend = {
		622061,
		87,
		true
	},
	world_word_world = {
		622148,
		86,
		true
	},
	world_word_guild = {
		622234,
		86,
		true
	},
	world_collection_1 = {
		622320,
		88,
		true
	},
	world_collection_2 = {
		622408,
		88,
		true
	},
	world_collection_3 = {
		622496,
		88,
		true
	},
	zero_hour_command_error = {
		622584,
		157,
		true
	},
	commander_is_in_bigworld = {
		622741,
		149,
		true
	},
	world_collection_back = {
		622890,
		103,
		true
	},
	archives_whether_to_retreat = {
		622993,
		216,
		true
	},
	world_fleet_stop = {
		623209,
		113,
		true
	},
	world_setting_title = {
		623322,
		110,
		true
	},
	world_setting_quickmode = {
		623432,
		104,
		true
	},
	world_setting_quickmodetip = {
		623536,
		266,
		true
	},
	world_setting_submititem = {
		623802,
		124,
		true
	},
	world_setting_submititemtip = {
		623926,
		327,
		true
	},
	world_setting_mapauto = {
		624253,
		112,
		true
	},
	world_setting_mapautotip = {
		624365,
		182,
		true
	},
	world_boss_maintenance = {
		624547,
		150,
		true
	},
	world_boss_inbattle = {
		624697,
		155,
		true
	},
	world_automode_title_1 = {
		624852,
		107,
		true
	},
	world_automode_title_2 = {
		624959,
		95,
		true
	},
	world_automode_treasure_1 = {
		625054,
		141,
		true
	},
	world_automode_treasure_2 = {
		625195,
		141,
		true
	},
	world_automode_treasure_3 = {
		625336,
		147,
		true
	},
	world_automode_cancel = {
		625483,
		91,
		true
	},
	world_automode_confirm = {
		625574,
		92,
		true
	},
	world_automode_start_tip1 = {
		625666,
		147,
		true
	},
	world_automode_start_tip2 = {
		625813,
		132,
		true
	},
	world_automode_start_tip3 = {
		625945,
		135,
		true
	},
	world_automode_start_tip4 = {
		626080,
		135,
		true
	},
	world_automode_start_tip5 = {
		626215,
		141,
		true
	},
	world_automode_setting_1 = {
		626356,
		134,
		true
	},
	world_automode_setting_1_1 = {
		626490,
		97,
		true
	},
	world_automode_setting_1_2 = {
		626587,
		91,
		true
	},
	world_automode_setting_1_3 = {
		626678,
		91,
		true
	},
	world_automode_setting_1_4 = {
		626769,
		99,
		true
	},
	world_automode_setting_2 = {
		626868,
		109,
		true
	},
	world_automode_setting_2_1 = {
		626977,
		114,
		true
	},
	world_automode_setting_2_2 = {
		627091,
		123,
		true
	},
	world_automode_setting_all_1 = {
		627214,
		113,
		true
	},
	world_automode_setting_all_1_1 = {
		627327,
		115,
		true
	},
	world_automode_setting_all_1_2 = {
		627442,
		115,
		true
	},
	world_automode_setting_all_2 = {
		627557,
		130,
		true
	},
	world_automode_setting_all_2_1 = {
		627687,
		97,
		true
	},
	world_automode_setting_all_2_2 = {
		627784,
		105,
		true
	},
	world_automode_setting_all_2_3 = {
		627889,
		105,
		true
	},
	world_automode_setting_all_3 = {
		627994,
		128,
		true
	},
	world_automode_setting_all_3_1 = {
		628122,
		97,
		true
	},
	world_automode_setting_all_3_2 = {
		628219,
		96,
		true
	},
	world_automode_setting_all_4 = {
		628315,
		132,
		true
	},
	world_automode_setting_all_4_1 = {
		628447,
		96,
		true
	},
	world_automode_setting_all_4_2 = {
		628543,
		97,
		true
	},
	world_automode_setting_new_1 = {
		628640,
		125,
		true
	},
	world_automode_setting_new_1_1 = {
		628765,
		101,
		true
	},
	world_automode_setting_new_1_2 = {
		628866,
		95,
		true
	},
	world_automode_setting_new_1_3 = {
		628961,
		95,
		true
	},
	world_automode_setting_new_1_4 = {
		629056,
		95,
		true
	},
	world_automode_setting_new_1_5 = {
		629151,
		100,
		true
	},
	world_collection_task_tip_1 = {
		629251,
		167,
		true
	},
	area_putong = {
		629418,
		87,
		true
	},
	area_anquan = {
		629505,
		87,
		true
	},
	area_yaosai = {
		629592,
		87,
		true
	},
	area_yaosai_2 = {
		629679,
		128,
		true
	},
	area_shenyuan = {
		629807,
		89,
		true
	},
	area_yinmi = {
		629896,
		86,
		true
	},
	area_renwu = {
		629982,
		86,
		true
	},
	area_zhuxian = {
		630068,
		91,
		true
	},
	area_dangan = {
		630159,
		87,
		true
	},
	charge_trade_no_error = {
		630246,
		157,
		true
	},
	world_reset_1 = {
		630403,
		130,
		true
	},
	world_reset_2 = {
		630533,
		154,
		true
	},
	world_reset_3 = {
		630687,
		150,
		true
	},
	guild_is_frozen_when_start_tech = {
		630837,
		138,
		true
	},
	world_boss_unactivated = {
		630975,
		211,
		true
	},
	world_reset_tip = {
		631186,
		2953,
		true
	},
	spring_invited_2021 = {
		634139,
		236,
		true
	},
	charge_error_count_limit = {
		634375,
		131,
		true
	},
	charge_error_disable = {
		634506,
		136,
		true
	},
	levelScene_select_sp = {
		634642,
		136,
		true
	},
	word_adjustFleet = {
		634778,
		92,
		true
	},
	levelScene_select_noitem = {
		634870,
		124,
		true
	},
	story_setting_label = {
		634994,
		119,
		true
	},
	login_arrears_tips = {
		635113,
		218,
		true
	},
	Supplement_pay1 = {
		635331,
		267,
		true
	},
	Supplement_pay2 = {
		635598,
		312,
		true
	},
	Supplement_pay3 = {
		635910,
		255,
		true
	},
	Supplement_pay4 = {
		636165,
		91,
		true
	},
	world_ship_repair = {
		636256,
		148,
		true
	},
	Supplement_pay5 = {
		636404,
		207,
		true
	},
	area_unkown = {
		636611,
		90,
		true
	},
	Supplement_pay6 = {
		636701,
		94,
		true
	},
	Supplement_pay7 = {
		636795,
		94,
		true
	},
	Supplement_pay8 = {
		636889,
		88,
		true
	},
	world_battle_damage = {
		636977,
		182,
		true
	},
	setting_story_speed_1 = {
		637159,
		91,
		true
	},
	setting_story_speed_2 = {
		637250,
		91,
		true
	},
	setting_story_speed_3 = {
		637341,
		91,
		true
	},
	setting_story_speed_4 = {
		637432,
		100,
		true
	},
	story_autoplay_setting_label = {
		637532,
		119,
		true
	},
	story_autoplay_setting_1 = {
		637651,
		91,
		true
	},
	story_autoplay_setting_2 = {
		637742,
		90,
		true
	},
	meta_shop_exchange_limit = {
		637832,
		97,
		true
	},
	meta_shop_unexchange_label = {
		637929,
		99,
		true
	},
	daily_level_quick_battle_label2 = {
		638028,
		101,
		true
	},
	daily_level_quick_battle_label1 = {
		638129,
		112,
		true
	},
	dailyLevel_quickfinish = {
		638241,
		363,
		true
	},
	daily_level_quick_battle_label3 = {
		638604,
		107,
		true
	},
	backyard_longpress_ship_tip = {
		638711,
		131,
		true
	},
	common_npc_formation_tip = {
		638842,
		137,
		true
	},
	gametip_xiaotiancheng = {
		638979,
		1907,
		true
	},
	guild_task_autoaccept_1 = {
		640886,
		138,
		true
	},
	guild_task_autoaccept_2 = {
		641024,
		138,
		true
	},
	task_lock = {
		641162,
		93,
		true
	},
	week_task_pt_name = {
		641255,
		89,
		true
	},
	week_task_award_preview_label = {
		641344,
		105,
		true
	},
	week_task_title_label = {
		641449,
		103,
		true
	},
	cattery_op_clean_success = {
		641552,
		134,
		true
	},
	cattery_op_feed_success = {
		641686,
		133,
		true
	},
	cattery_op_play_success = {
		641819,
		120,
		true
	},
	cattery_style_change_success = {
		641939,
		144,
		true
	},
	cattery_add_commander_success = {
		642083,
		126,
		true
	},
	cattery_remove_commander_success = {
		642209,
		139,
		true
	},
	commander_box_quickly_tool_tip_1 = {
		642348,
		148,
		true
	},
	commander_box_quickly_tool_tip_2 = {
		642496,
		133,
		true
	},
	commander_box_quickly_tool_tip_3 = {
		642629,
		108,
		true
	},
	commander_box_was_finished = {
		642737,
		133,
		true
	},
	comander_tool_cnt_is_reclac = {
		642870,
		149,
		true
	},
	comander_tool_max_cnt = {
		643019,
		111,
		true
	},
	cat_home_help = {
		643130,
		1571,
		true
	},
	cat_accelfrate_notenough = {
		644701,
		134,
		true
	},
	cat_home_unlock = {
		644835,
		164,
		true
	},
	cat_sleep_notplay = {
		644999,
		154,
		true
	},
	cathome_style_unlock = {
		645153,
		172,
		true
	},
	commander_is_in_cattery = {
		645325,
		151,
		true
	},
	cat_home_interaction = {
		645476,
		119,
		true
	},
	cat_accelerate_left = {
		645595,
		101,
		true
	},
	common_clean = {
		645696,
		82,
		true
	},
	common_feed = {
		645778,
		87,
		true
	},
	common_play = {
		645865,
		81,
		true
	},
	game_stopwords = {
		645946,
		123,
		true
	},
	game_openwords = {
		646069,
		120,
		true
	},
	amusementpark_shop_enter = {
		646189,
		167,
		true
	},
	amusementpark_shop_exchange = {
		646356,
		179,
		true
	},
	amusementpark_shop_success = {
		646535,
		114,
		true
	},
	amusementpark_shop_special = {
		646649,
		175,
		true
	},
	amusementpark_shop_end = {
		646824,
		162,
		true
	},
	amusementpark_shop_0 = {
		646986,
		193,
		true
	},
	amusementpark_shop_carousel1 = {
		647179,
		141,
		true
	},
	amusementpark_shop_carousel2 = {
		647320,
		153,
		true
	},
	amusementpark_shop_carousel3 = {
		647473,
		144,
		true
	},
	amusementpark_shop_exchange2 = {
		647617,
		187,
		true
	},
	amusementpark_help = {
		647804,
		2175,
		true
	},
	amusementpark_shop_help = {
		649979,
		560,
		true
	},
	handshake_game_help = {
		650539,
		1207,
		true
	},
	MeixiV4_help = {
		651746,
		919,
		true
	},
	activity_permanent_total = {
		652665,
		112,
		true
	},
	word_investigate = {
		652777,
		86,
		true
	},
	ambush_display_none = {
		652863,
		89,
		true
	},
	activity_permanent_help = {
		652952,
		644,
		true
	},
	activity_permanent_tips1 = {
		653596,
		172,
		true
	},
	activity_permanent_tips2 = {
		653768,
		201,
		true
	},
	activity_permanent_tips3 = {
		653969,
		182,
		true
	},
	activity_permanent_tips4 = {
		654151,
		270,
		true
	},
	activity_permanent_finished = {
		654421,
		97,
		true
	},
	idolmaster_main = {
		654518,
		1311,
		true
	},
	idolmaster_game_tip1 = {
		655829,
		117,
		true
	},
	idolmaster_game_tip2 = {
		655946,
		117,
		true
	},
	idolmaster_game_tip3 = {
		656063,
		96,
		true
	},
	idolmaster_game_tip4 = {
		656159,
		96,
		true
	},
	idolmaster_game_tip5 = {
		656255,
		90,
		true
	},
	idolmaster_collection = {
		656345,
		746,
		true
	},
	idolmaster_voice_name_feeling1 = {
		657091,
		100,
		true
	},
	idolmaster_voice_name_feeling2 = {
		657191,
		100,
		true
	},
	idolmaster_voice_name_feeling3 = {
		657291,
		100,
		true
	},
	idolmaster_voice_name_feeling4 = {
		657391,
		100,
		true
	},
	idolmaster_voice_name_feeling5 = {
		657491,
		100,
		true
	},
	idolmaster_voice_name_propose = {
		657591,
		99,
		true
	},
	cartoon_notall = {
		657690,
		84,
		true
	},
	cartoon_haveno = {
		657774,
		124,
		true
	},
	res_cartoon_new_tip = {
		657898,
		141,
		true
	},
	memory_actiivty_ex = {
		658039,
		94,
		true
	},
	memory_activity_sp = {
		658133,
		90,
		true
	},
	memory_activity_daily = {
		658223,
		97,
		true
	},
	memory_activity_others = {
		658320,
		95,
		true
	},
	battle_end_title = {
		658415,
		92,
		true
	},
	battle_end_subtitle1 = {
		658507,
		96,
		true
	},
	battle_end_subtitle2 = {
		658603,
		96,
		true
	},
	meta_skill_dailyexp = {
		658699,
		104,
		true
	},
	meta_skill_learn = {
		658803,
		144,
		true
	},
	meta_skill_maxtip = {
		658947,
		194,
		true
	},
	meta_tactics_detail = {
		659141,
		95,
		true
	},
	meta_tactics_unlock = {
		659236,
		98,
		true
	},
	meta_tactics_switch = {
		659334,
		98,
		true
	},
	meta_skill_maxtip2 = {
		659432,
		96,
		true
	},
	activity_permanent_progress = {
		659528,
		106,
		true
	},
	cattery_settlement_dialogue_1 = {
		659634,
		102,
		true
	},
	cattery_settlement_dialogue_2 = {
		659736,
		130,
		true
	},
	cattery_settlement_dialogue_3 = {
		659866,
		102,
		true
	},
	cattery_settlement_dialogue_4 = {
		659968,
		117,
		true
	},
	blueprint_catchup_by_gold_confirm = {
		660085,
		151,
		true
	},
	blueprint_catchup_by_gold_help = {
		660236,
		318,
		true
	},
	tec_tip_no_consumption = {
		660554,
		98,
		true
	},
	tec_tip_material_stock = {
		660652,
		92,
		true
	},
	tec_tip_to_consumption = {
		660744,
		98,
		true
	},
	onebutton_max_tip = {
		660842,
		93,
		true
	},
	target_get_tip = {
		660935,
		90,
		true
	},
	fleet_select_title = {
		661025,
		94,
		true
	},
	backyard_rename_title = {
		661119,
		97,
		true
	},
	backyard_rename_tip = {
		661216,
		107,
		true
	},
	equip_add = {
		661323,
		107,
		true
	},
	equipskin_add = {
		661430,
		118,
		true
	},
	equipskin_none = {
		661548,
		132,
		true
	},
	equipskin_typewrong = {
		661680,
		137,
		true
	},
	equipskin_typewrong_en = {
		661817,
		107,
		true
	},
	user_is_banned = {
		661924,
		164,
		true
	},
	user_is_forever_banned = {
		662088,
		135,
		true
	},
	old_class_is_close = {
		662223,
		149,
		true
	},
	activity_event_building = {
		662372,
		1919,
		true
	},
	salvage_tips = {
		664291,
		995,
		true
	},
	tips_shakebeads = {
		665286,
		977,
		true
	},
	gem_shop_xinzhi_tip = {
		666263,
		109,
		true
	},
	cowboy_tips = {
		666372,
		1025,
		true
	},
	backyard_backyardScene_Disable_Rotation = {
		667397,
		140,
		true
	},
	chazi_tips = {
		667537,
		938,
		true
	},
	catchteasure_help = {
		668475,
		432,
		true
	},
	unlock_tips = {
		668907,
		97,
		true
	},
	class_label_tran = {
		669004,
		88,
		true
	},
	class_label_gen = {
		669092,
		89,
		true
	},
	class_attr_store = {
		669181,
		92,
		true
	},
	class_attr_proficiency = {
		669273,
		101,
		true
	},
	class_attr_getproficiency = {
		669374,
		104,
		true
	},
	class_attr_costproficiency = {
		669478,
		105,
		true
	},
	class_label_upgrading = {
		669583,
		94,
		true
	},
	class_label_upgradetime = {
		669677,
		99,
		true
	},
	class_label_oilfield = {
		669776,
		96,
		true
	},
	class_label_goldfield = {
		669872,
		97,
		true
	},
	class_res_maxlevel_tip = {
		669969,
		98,
		true
	},
	ship_exp_item_title = {
		670067,
		92,
		true
	},
	ship_exp_item_label_clear = {
		670159,
		98,
		true
	},
	ship_exp_item_label_recom = {
		670257,
		101,
		true
	},
	ship_exp_item_label_confirm = {
		670358,
		97,
		true
	},
	player_expResource_mail_fullBag = {
		670455,
		171,
		true
	},
	tec_nation_award_finish = {
		670626,
		97,
		true
	},
	coures_exp_overflow_tip = {
		670723,
		165,
		true
	},
	coures_exp_npc_tip = {
		670888,
		240,
		true
	},
	coures_level_tip = {
		671128,
		150,
		true
	},
	coures_tip_material_stock = {
		671278,
		98,
		true
	},
	coures_tip_exceeded_lv = {
		671376,
		119,
		true
	},
	eatgame_tips = {
		671495,
		1013,
		true
	},
	breakout_tip_ultimatebonus_gunner = {
		672508,
		165,
		true
	},
	breakout_tip_ultimatebonus_torpedo = {
		672673,
		144,
		true
	},
	breakout_tip_ultimatebonus_aux = {
		672817,
		135,
		true
	},
	map_event_lighthouse_tip_1 = {
		672952,
		166,
		true
	},
	battlepass_main_tip_2110 = {
		673118,
		222,
		true
	},
	battlepass_main_time = {
		673340,
		97,
		true
	},
	battlepass_main_help_2110 = {
		673437,
		3324,
		true
	},
	cruise_task_help_2110 = {
		676761,
		1201,
		true
	},
	cruise_task_phase = {
		677962,
		96,
		true
	},
	cruise_task_tips = {
		678058,
		92,
		true
	},
	battlepass_task_quickfinish1 = {
		678150,
		359,
		true
	},
	battlepass_task_quickfinish2 = {
		678509,
		279,
		true
	},
	battlepass_task_quickfinish3 = {
		678788,
		125,
		true
	},
	cruise_task_unlock = {
		678913,
		122,
		true
	},
	cruise_task_week = {
		679035,
		88,
		true
	},
	battlepass_pay_timelimit = {
		679123,
		99,
		true
	},
	battlepass_pay_acquire = {
		679222,
		107,
		true
	},
	battlepass_pay_attention = {
		679329,
		152,
		true
	},
	battlepass_acquire_attention = {
		679481,
		218,
		true
	},
	battlepass_pay_tip = {
		679699,
		115,
		true
	},
	battlepass_main_tip1 = {
		679814,
		286,
		true
	},
	battlepass_main_tip2 = {
		680100,
		238,
		true
	},
	battlepass_main_tip3 = {
		680338,
		310,
		true
	},
	battlepass_complete = {
		680648,
		128,
		true
	},
	shop_free_tag = {
		680776,
		83,
		true
	},
	quick_equip_tip1 = {
		680859,
		89,
		true
	},
	quick_equip_tip2 = {
		680948,
		92,
		true
	},
	quick_equip_tip3 = {
		681040,
		86,
		true
	},
	quick_equip_tip4 = {
		681126,
		125,
		true
	},
	quick_equip_tip5 = {
		681251,
		147,
		true
	},
	quick_equip_tip6 = {
		681398,
		183,
		true
	},
	retire_importantequipment_tips = {
		681581,
		194,
		true
	},
	settle_rewards_title = {
		681775,
		105,
		true
	},
	settle_rewards_subtitle = {
		681880,
		101,
		true
	},
	total_rewards_subtitle = {
		681981,
		99,
		true
	},
	settle_rewards_text = {
		682080,
		98,
		true
	},
	use_oil_limit_help = {
		682178,
		270,
		true
	},
	formationScene_use_oil_limit_tip = {
		682448,
		115,
		true
	},
	index_awakening2 = {
		682563,
		131,
		true
	},
	index_upgrade = {
		682694,
		92,
		true
	},
	formationScene_use_oil_limit_enemy = {
		682786,
		104,
		true
	},
	formationScene_use_oil_limit_flagship = {
		682890,
		107,
		true
	},
	formationScene_use_oil_limit_submarine = {
		682997,
		108,
		true
	},
	formationScene_use_oil_limit_surface = {
		683105,
		106,
		true
	},
	formationScene_use_oil_limit_tip_worldboss = {
		683211,
		119,
		true
	},
	attr_durability = {
		683330,
		85,
		true
	},
	attr_armor = {
		683415,
		80,
		true
	},
	attr_reload = {
		683495,
		81,
		true
	},
	attr_cannon = {
		683576,
		81,
		true
	},
	attr_torpedo = {
		683657,
		82,
		true
	},
	attr_motion = {
		683739,
		81,
		true
	},
	attr_antiaircraft = {
		683820,
		87,
		true
	},
	attr_air = {
		683907,
		78,
		true
	},
	attr_hit = {
		683985,
		78,
		true
	},
	attr_antisub = {
		684063,
		82,
		true
	},
	attr_oxy_max = {
		684145,
		85,
		true
	},
	attr_ammo = {
		684230,
		82,
		true
	},
	attr_hunting_range = {
		684312,
		94,
		true
	},
	attr_luck = {
		684406,
		76,
		true
	},
	attr_consume = {
		684482,
		82,
		true
	},
	attr_speed = {
		684564,
		80,
		true
	},
	monthly_card_tip = {
		684644,
		100,
		true
	},
	shopping_error_time_limit = {
		684744,
		144,
		true
	},
	world_total_power = {
		684888,
		90,
		true
	},
	world_mileage = {
		684978,
		89,
		true
	},
	world_pressing = {
		685067,
		90,
		true
	},
	Settings_title_FPS = {
		685157,
		94,
		true
	},
	Settings_title_Notification = {
		685251,
		109,
		true
	},
	Settings_title_Other = {
		685360,
		99,
		true
	},
	Settings_title_LoginJP = {
		685459,
		101,
		true
	},
	Settings_title_Redeem = {
		685560,
		100,
		true
	},
	Settings_title_AdjustScr = {
		685660,
		109,
		true
	},
	Settings_title_Secpw = {
		685769,
		105,
		true
	},
	Settings_title_Secpwlimop = {
		685874,
		122,
		true
	},
	Settings_title_agreement = {
		685996,
		100,
		true
	},
	Settings_title_sound = {
		686096,
		96,
		true
	},
	Settings_title_resUpdate = {
		686192,
		100,
		true
	},
	equipment_info_change_tip = {
		686292,
		135,
		true
	},
	equipment_info_change_name_a = {
		686427,
		113,
		true
	},
	equipment_info_change_name_b = {
		686540,
		113,
		true
	},
	equipment_info_change_text_before = {
		686653,
		106,
		true
	},
	equipment_info_change_text_after = {
		686759,
		105,
		true
	},
	world_boss_progress_tip_title = {
		686864,
		117,
		true
	},
	world_boss_progress_tip_desc = {
		686981,
		326,
		true
	},
	ssss_main_help = {
		687307,
		1980,
		true
	},
	mini_game_time = {
		689287,
		91,
		true
	},
	mini_game_score = {
		689378,
		86,
		true
	},
	mini_game_leave = {
		689464,
		112,
		true
	},
	mini_game_pause = {
		689576,
		112,
		true
	},
	mini_game_cur_score = {
		689688,
		96,
		true
	},
	mini_game_high_score = {
		689784,
		97,
		true
	},
	monopoly_world_tip1 = {
		689881,
		101,
		true
	},
	monopoly_world_tip2 = {
		689982,
		257,
		true
	},
	monopoly_world_tip3 = {
		690239,
		234,
		true
	},
	help_monopoly_world = {
		690473,
		1615,
		true
	},
	ssssmedal_tip = {
		692088,
		200,
		true
	},
	ssssmedal_name = {
		692288,
		111,
		true
	},
	ssssmedal_belonging = {
		692399,
		116,
		true
	},
	ssssmedal_name1 = {
		692515,
		100,
		true
	},
	ssssmedal_name2 = {
		692615,
		94,
		true
	},
	ssssmedal_name3 = {
		692709,
		97,
		true
	},
	ssssmedal_name4 = {
		692806,
		97,
		true
	},
	ssssmedal_name5 = {
		692903,
		97,
		true
	},
	ssssmedal_name6 = {
		693000,
		94,
		true
	},
	ssssmedal_belonging1 = {
		693094,
		105,
		true
	},
	ssssmedal_belonging2 = {
		693199,
		105,
		true
	},
	ssssmedal_desc1 = {
		693304,
		167,
		true
	},
	ssssmedal_desc2 = {
		693471,
		161,
		true
	},
	ssssmedal_desc3 = {
		693632,
		179,
		true
	},
	ssssmedal_desc4 = {
		693811,
		161,
		true
	},
	ssssmedal_desc5 = {
		693972,
		173,
		true
	},
	ssssmedal_desc6 = {
		694145,
		124,
		true
	},
	show_fate_demand_count = {
		694269,
		149,
		true
	},
	show_design_demand_count = {
		694418,
		149,
		true
	},
	blueprint_select_overflow = {
		694567,
		128,
		true
	},
	blueprint_select_overflow_tip = {
		694695,
		224,
		true
	},
	blueprint_exchange_empty_tip = {
		694919,
		147,
		true
	},
	blueprint_exchange_select_display = {
		695066,
		116,
		true
	},
	build_rate_title = {
		695182,
		92,
		true
	},
	build_pools_intro = {
		695274,
		154,
		true
	},
	build_detail_intro = {
		695428,
		106,
		true
	},
	ssss_game_tip = {
		695534,
		1752,
		true
	},
	ssss_medal_tip = {
		697286,
		527,
		true
	},
	battlepass_main_tip_2112 = {
		697813,
		231,
		true
	},
	battlepass_main_help_2112 = {
		698044,
		3327,
		true
	},
	cruise_task_help_2112 = {
		701371,
		1201,
		true
	},
	littleSanDiego_npc = {
		702572,
		2062,
		true
	},
	tag_ship_unlocked = {
		704634,
		96,
		true
	},
	tag_ship_locked = {
		704730,
		94,
		true
	},
	acceleration_tips_1 = {
		704824,
		219,
		true
	},
	acceleration_tips_2 = {
		705043,
		203,
		true
	},
	noacceleration_tips = {
		705246,
		138,
		true
	},
	word_shipskin = {
		705384,
		79,
		true
	},
	settings_sound_title_bgm = {
		705463,
		108,
		true
	},
	settings_sound_title_effct = {
		705571,
		104,
		true
	},
	settings_sound_title_cv = {
		705675,
		98,
		true
	},
	setting_resdownload_title_gallery = {
		705773,
		132,
		true
	},
	setting_resdownload_title_live2d = {
		705905,
		108,
		true
	},
	setting_resdownload_title_music = {
		706013,
		122,
		true
	},
	setting_resdownload_title_sound = {
		706135,
		110,
		true
	},
	setting_resdownload_title_manga = {
		706245,
		116,
		true
	},
	setting_resdownload_title_dorm = {
		706361,
		118,
		true
	},
	setting_resdownload_title_main_group = {
		706479,
		117,
		true
	},
	settings_battle_title = {
		706596,
		100,
		true
	},
	settings_battle_tip = {
		706696,
		138,
		true
	},
	settings_battle_Btn_edit = {
		706834,
		94,
		true
	},
	settings_battle_Btn_reset = {
		706928,
		101,
		true
	},
	settings_battle_Btn_save = {
		707029,
		97,
		true
	},
	settings_battle_Btn_cancel = {
		707126,
		97,
		true
	},
	settings_pwd_label_close = {
		707223,
		91,
		true
	},
	settings_pwd_label_open = {
		707314,
		89,
		true
	},
	word_frame = {
		707403,
		77,
		true
	},
	Settings_title_Redeem_input_label = {
		707480,
		116,
		true
	},
	Settings_title_Redeem_input_submit = {
		707596,
		105,
		true
	},
	Settings_title_Redeem_input_placeholder = {
		707701,
		134,
		true
	},
	CurlingGame_tips1 = {
		707835,
		1572,
		true
	},
	maid_task_tips1 = {
		709407,
		1164,
		true
	},
	shop_diamond_title = {
		710571,
		97,
		true
	},
	shop_gift_title = {
		710668,
		94,
		true
	},
	shop_item_title = {
		710762,
		91,
		true
	},
	shop_charge_level_limit = {
		710853,
		102,
		true
	},
	backhill_cantupbuilding = {
		710955,
		144,
		true
	},
	pray_cant_tips = {
		711099,
		145,
		true
	},
	help_xinnian2022_feast = {
		711244,
		2621,
		true
	},
	Pray_activity_tips1 = {
		713865,
		2233,
		true
	},
	backhill_notenoughbuilding = {
		716098,
		193,
		true
	},
	help_xinnian2022_z28 = {
		716291,
		801,
		true
	},
	help_xinnian2022_firework = {
		717092,
		1896,
		true
	},
	settings_title_account_del = {
		718988,
		105,
		true
	},
	settings_text_account_del = {
		719093,
		110,
		true
	},
	settings_text_account_del_desc = {
		719203,
		324,
		true
	},
	settings_text_account_del_confirm = {
		719527,
		179,
		true
	},
	settings_text_account_del_btn = {
		719706,
		105,
		true
	},
	box_account_del_input = {
		719811,
		205,
		true
	},
	box_account_del_target = {
		720016,
		92,
		true
	},
	box_account_del_click = {
		720108,
		104,
		true
	},
	box_account_del_success_content = {
		720212,
		171,
		true
	},
	box_account_reborn_content = {
		720383,
		425,
		true
	},
	tip_account_del_dismatch = {
		720808,
		115,
		true
	},
	tip_account_del_reborn = {
		720923,
		138,
		true
	},
	player_manifesto_placeholder = {
		721061,
		107,
		true
	},
	box_ship_del_click = {
		721168,
		131,
		true
	},
	box_equipment_del_click = {
		721299,
		114,
		true
	},
	change_player_name_title = {
		721413,
		100,
		true
	},
	change_player_name_subtitle = {
		721513,
		125,
		true
	},
	change_player_name_input_tip = {
		721638,
		126,
		true
	},
	change_player_name_illegal = {
		721764,
		255,
		true
	},
	nodisplay_player_home_name = {
		722019,
		96,
		true
	},
	nodisplay_player_home_share = {
		722115,
		100,
		true
	},
	tactics_class_start = {
		722215,
		95,
		true
	},
	tactics_class_cancel = {
		722310,
		96,
		true
	},
	tactics_class_get_exp = {
		722406,
		97,
		true
	},
	tactics_class_spend_time = {
		722503,
		100,
		true
	},
	build_ticket_description = {
		722603,
		118,
		true
	},
	build_ticket_expire_warning = {
		722721,
		106,
		true
	},
	tip_build_ticket_expired = {
		722827,
		166,
		true
	},
	tip_build_ticket_exchange_expired = {
		722993,
		166,
		true
	},
	tip_build_ticket_not_enough = {
		723159,
		123,
		true
	},
	build_ship_tip_use_ticket = {
		723282,
		203,
		true
	},
	springfes_tips1 = {
		723485,
		899,
		true
	},
	worldinpicture_tavel_point_tip = {
		724384,
		131,
		true
	},
	worldinpicture_draw_point_tip = {
		724515,
		136,
		true
	},
	worldinpicture_help = {
		724651,
		1094,
		true
	},
	worldinpicture_task_help = {
		725745,
		1099,
		true
	},
	worldinpicture_not_area_can_draw = {
		726844,
		148,
		true
	},
	missile_attack_area_confirm = {
		726992,
		103,
		true
	},
	missile_attack_area_cancel = {
		727095,
		102,
		true
	},
	shipchange_alert_infleet = {
		727197,
		170,
		true
	},
	shipchange_alert_inpvp = {
		727367,
		186,
		true
	},
	shipchange_alert_inexercise = {
		727553,
		188,
		true
	},
	shipchange_alert_inworld = {
		727741,
		209,
		true
	},
	shipchange_alert_inguildbossevent = {
		727950,
		231,
		true
	},
	shipchange_alert_indiff = {
		728181,
		166,
		true
	},
	shipmodechange_reject_1stfleet_only = {
		728347,
		238,
		true
	},
	shipmodechange_reject_worldfleet_only = {
		728585,
		227,
		true
	},
	monopoly3thre_tip = {
		728812,
		172,
		true
	},
	fushun_game3_tip = {
		728984,
		1496,
		true
	},
	battlepass_main_tip_2202 = {
		730480,
		230,
		true
	},
	battlepass_main_help_2202 = {
		730710,
		3336,
		true
	},
	cruise_task_help_2202 = {
		734046,
		1201,
		true
	},
	battlepass_main_tip_2204 = {
		735247,
		230,
		true
	},
	battlepass_main_help_2204 = {
		735477,
		3366,
		true
	},
	cruise_task_help_2204 = {
		738843,
		1201,
		true
	},
	battlepass_main_tip_2206 = {
		740044,
		255,
		true
	},
	battlepass_main_help_2206 = {
		740299,
		3351,
		true
	},
	cruise_task_help_2206 = {
		743650,
		1201,
		true
	},
	battlepass_main_tip_2208 = {
		744851,
		252,
		true
	},
	battlepass_main_help_2208 = {
		745103,
		3336,
		true
	},
	cruise_task_help_2208 = {
		748439,
		1201,
		true
	},
	battlepass_main_tip_2210 = {
		749640,
		254,
		true
	},
	battlepass_main_help_2210 = {
		749894,
		3373,
		true
	},
	cruise_task_help_2210 = {
		753267,
		1201,
		true
	},
	battlepass_main_tip_2212 = {
		754468,
		259,
		true
	},
	battlepass_main_help_2212 = {
		754727,
		3355,
		true
	},
	cruise_task_help_2212 = {
		758082,
		1201,
		true
	},
	battlepass_main_tip_2302 = {
		759283,
		261,
		true
	},
	battlepass_main_help_2302 = {
		759544,
		3339,
		true
	},
	cruise_task_help_2302 = {
		762883,
		1201,
		true
	},
	battlepass_main_tip_2304 = {
		764084,
		267,
		true
	},
	battlepass_main_help_2304 = {
		764351,
		3374,
		true
	},
	cruise_task_help_2304 = {
		767725,
		1201,
		true
	},
	battlepass_main_tip_2306 = {
		768926,
		256,
		true
	},
	battlepass_main_help_2306 = {
		769182,
		3333,
		true
	},
	cruise_task_help_2306 = {
		772515,
		1201,
		true
	},
	battlepass_main_tip_2308 = {
		773716,
		247,
		true
	},
	battlepass_main_help_2308 = {
		773963,
		3348,
		true
	},
	cruise_task_help_2308 = {
		777311,
		1201,
		true
	},
	battlepass_main_tip_2310 = {
		778512,
		261,
		true
	},
	battlepass_main_help_2310 = {
		778773,
		3361,
		true
	},
	cruise_task_help_2310 = {
		782134,
		1201,
		true
	},
	battlepass_main_tip_2312 = {
		783335,
		254,
		true
	},
	battlepass_main_help_2312 = {
		783589,
		3328,
		true
	},
	cruise_task_help_2312 = {
		786917,
		1201,
		true
	},
	battlepass_main_tip_2402 = {
		788118,
		256,
		true
	},
	battlepass_main_help_2402 = {
		788374,
		3339,
		true
	},
	cruise_task_help_2402 = {
		791713,
		1201,
		true
	},
	battlepass_main_tip_2404 = {
		792914,
		259,
		true
	},
	battlepass_main_help_2404 = {
		793173,
		3333,
		true
	},
	cruise_task_help_2404 = {
		796506,
		1198,
		true
	},
	attrset_reset = {
		797704,
		89,
		true
	},
	attrset_save = {
		797793,
		88,
		true
	},
	attrset_ask_save = {
		797881,
		119,
		true
	},
	attrset_save_success = {
		798000,
		111,
		true
	},
	attrset_disable = {
		798111,
		137,
		true
	},
	attrset_input_ill = {
		798248,
		102,
		true
	},
	blackfriday_help = {
		798350,
		783,
		true
	},
	eventshop_time_hint = {
		799133,
		121,
		true
	},
	purchase_backyard_theme_desc_for_onekey = {
		799254,
		147,
		true
	},
	purchase_backyard_theme_desc_for_all = {
		799401,
		152,
		true
	},
	sp_no_quota = {
		799553,
		117,
		true
	},
	fur_all_buy = {
		799670,
		87,
		true
	},
	fur_onekey_buy = {
		799757,
		94,
		true
	},
	littleRenown_npc = {
		799851,
		2014,
		true
	},
	tech_package_tip = {
		801865,
		428,
		true
	},
	backyard_food_shop_tip = {
		802293,
		101,
		true
	},
	dorm_2f_lock = {
		802394,
		85,
		true
	},
	word_get_way = {
		802479,
		89,
		true
	},
	word_get_date = {
		802568,
		90,
		true
	},
	enter_theme_name = {
		802658,
		107,
		true
	},
	enter_extend_food_label = {
		802765,
		93,
		true
	},
	backyard_extend_tip_1 = {
		802858,
		100,
		true
	},
	backyard_extend_tip_2 = {
		802958,
		113,
		true
	},
	backyard_extend_tip_3 = {
		803071,
		95,
		true
	},
	backyard_extend_tip_4 = {
		803166,
		89,
		true
	},
	email_text = {
		803255,
		95,
		true
	},
	emailhold_text = {
		803350,
		148,
		true
	},
	code_text = {
		803498,
		88,
		true
	},
	codehold_text = {
		803586,
		101,
		true
	},
	genBtn_text = {
		803687,
		87,
		true
	},
	desc_text = {
		803774,
		157,
		true
	},
	loginBtn_text = {
		803931,
		89,
		true
	},
	verification_code_req_tip1 = {
		804020,
		139,
		true
	},
	verification_code_req_tip2 = {
		804159,
		126,
		true
	},
	verification_code_req_tip3 = {
		804285,
		157,
		true
	},
	levelScene_remaster_story_tip = {
		804442,
		196,
		true
	},
	levelScene_remaster_unlock_tip = {
		804638,
		159,
		true
	},
	linkBtn_text = {
		804797,
		82,
		true
	},
	amazon_link_title = {
		804879,
		104,
		true
	},
	amazon_unlink_btn_text = {
		804983,
		119,
		true
	},
	yostar_link_title = {
		805102,
		105,
		true
	},
	yostar_unlink_btn_text = {
		805207,
		119,
		true
	},
	level_remaster_tip1 = {
		805326,
		95,
		true
	},
	level_remaster_tip2 = {
		805421,
		92,
		true
	},
	level_remaster_tip3 = {
		805513,
		89,
		true
	},
	level_remaster_tip4 = {
		805602,
		112,
		true
	},
	newserver_time = {
		805714,
		91,
		true
	},
	newserver_soldout = {
		805805,
		126,
		true
	},
	skill_learn_tip = {
		805931,
		139,
		true
	},
	newserver_build_tip = {
		806070,
		156,
		true
	},
	build_count_tip = {
		806226,
		85,
		true
	},
	help_research_package = {
		806311,
		299,
		true
	},
	lv70_package_tip = {
		806610,
		243,
		true
	},
	tech_select_tip1 = {
		806853,
		94,
		true
	},
	tech_select_tip2 = {
		806947,
		153,
		true
	},
	tech_select_tip3 = {
		807100,
		89,
		true
	},
	tech_select_tip4 = {
		807189,
		98,
		true
	},
	tech_select_tip5 = {
		807287,
		144,
		true
	},
	techpackage_item_use = {
		807431,
		264,
		true
	},
	techpackage_item_use_1 = {
		807695,
		237,
		true
	},
	techpackage_item_use_2 = {
		807932,
		250,
		true
	},
	techpackage_item_use_confirm = {
		808182,
		210,
		true
	},
	new_server_shop_sel_goods_tip = {
		808392,
		134,
		true
	},
	new_server_shop_unopen_tip = {
		808526,
		99,
		true
	},
	newserver_activity_tip = {
		808625,
		1923,
		true
	},
	newserver_shop_timelimit = {
		810548,
		111,
		true
	},
	tech_character_get = {
		810659,
		91,
		true
	},
	package_detail_tip = {
		810750,
		94,
		true
	},
	event_ui_consume = {
		810844,
		86,
		true
	},
	event_ui_recommend = {
		810930,
		94,
		true
	},
	event_ui_start = {
		811024,
		84,
		true
	},
	event_ui_giveup = {
		811108,
		85,
		true
	},
	event_ui_finish = {
		811193,
		85,
		true
	},
	nav_tactics_sel_skill_title = {
		811278,
		106,
		true
	},
	battle_result_confirm = {
		811384,
		92,
		true
	},
	battle_result_targets = {
		811476,
		100,
		true
	},
	battle_result_continue = {
		811576,
		104,
		true
	},
	index_L2D = {
		811680,
		76,
		true
	},
	index_DBG = {
		811756,
		94,
		true
	},
	index_BG = {
		811850,
		84,
		true
	},
	index_CANTUSE = {
		811934,
		89,
		true
	},
	index_UNUSE = {
		812023,
		84,
		true
	},
	index_BGM = {
		812107,
		82,
		true
	},
	without_ship_to_wear = {
		812189,
		126,
		true
	},
	choose_ship_to_wear_this_skin = {
		812315,
		149,
		true
	},
	skinatlas_search_holder = {
		812464,
		126,
		true
	},
	skinatlas_search_result_is_empty = {
		812590,
		148,
		true
	},
	chang_ship_skin_window_title = {
		812738,
		98,
		true
	},
	world_boss_item_info = {
		812836,
		411,
		true
	},
	world_past_boss_item_info = {
		813247,
		502,
		true
	},
	world_boss_lefttime = {
		813749,
		88,
		true
	},
	world_boss_item_count_noenough = {
		813837,
		143,
		true
	},
	world_boss_item_usage_tip = {
		813980,
		172,
		true
	},
	world_boss_no_select_archives = {
		814152,
		148,
		true
	},
	world_boss_archives_item_count_noenough = {
		814300,
		146,
		true
	},
	world_boss_archives_are_clear = {
		814446,
		140,
		true
	},
	world_boss_switch_archives = {
		814586,
		238,
		true
	},
	world_boss_switch_archives_success = {
		814824,
		184,
		true
	},
	world_boss_archives_auto_battle_unopen = {
		815008,
		179,
		true
	},
	world_boss_archives_need_stop_auto_battle = {
		815187,
		163,
		true
	},
	world_boss_archives_stop_auto_battle = {
		815350,
		118,
		true
	},
	world_boss_archives_continue_auto_battle = {
		815468,
		122,
		true
	},
	world_boss_archives_auto_battle_reusle_title = {
		815590,
		126,
		true
	},
	world_boss_archives_stop_auto_battle_title = {
		815716,
		124,
		true
	},
	world_boss_archives_stop_auto_battle_tip = {
		815840,
		117,
		true
	},
	world_boss_archives_stop_auto_battle_tip1 = {
		815957,
		248,
		true
	},
	world_archives_boss_help = {
		816205,
		3943,
		true
	},
	world_archives_boss_list_help = {
		820148,
		633,
		true
	},
	archives_boss_was_opened = {
		820781,
		180,
		true
	},
	current_boss_was_opened = {
		820961,
		179,
		true
	},
	world_boss_title_auto_battle = {
		821140,
		104,
		true
	},
	world_boss_title_highest_damge = {
		821244,
		112,
		true
	},
	world_boss_title_estimation = {
		821356,
		109,
		true
	},
	world_boss_title_battle_cnt = {
		821465,
		103,
		true
	},
	world_boss_title_consume_oil_cnt = {
		821568,
		108,
		true
	},
	world_boss_title_spend_time = {
		821676,
		103,
		true
	},
	world_boss_title_total_damage = {
		821779,
		105,
		true
	},
	world_no_time_to_auto_battle = {
		821884,
		136,
		true
	},
	world_boss_current_boss_label = {
		822020,
		105,
		true
	},
	world_boss_current_boss_label1 = {
		822125,
		113,
		true
	},
	world_boss_archives_boss_tip = {
		822238,
		172,
		true
	},
	world_boss_progress_no_enough = {
		822410,
		145,
		true
	},
	world_boss_auto_battle_no_oil = {
		822555,
		123,
		true
	},
	meta_syn_value_label = {
		822678,
		98,
		true
	},
	meta_syn_finish = {
		822776,
		97,
		true
	},
	index_meta_repair = {
		822873,
		99,
		true
	},
	index_meta_tactics = {
		822972,
		100,
		true
	},
	index_meta_energy = {
		823072,
		99,
		true
	},
	tactics_continue_to_learn_other_skill = {
		823171,
		166,
		true
	},
	tactics_continue_to_learn_other_ship_skill = {
		823337,
		162,
		true
	},
	tactics_no_recent_ships = {
		823499,
		123,
		true
	},
	activity_kill = {
		823622,
		89,
		true
	},
	battle_result_dmg = {
		823711,
		93,
		true
	},
	battle_result_kill_count = {
		823804,
		97,
		true
	},
	battle_result_toggle_on = {
		823901,
		102,
		true
	},
	battle_result_toggle_off = {
		824003,
		103,
		true
	},
	battle_result_continue_battle = {
		824106,
		108,
		true
	},
	battle_result_quit_battle = {
		824214,
		104,
		true
	},
	battle_result_share_battle = {
		824318,
		99,
		true
	},
	pre_combat_team = {
		824417,
		91,
		true
	},
	pre_combat_vanguard = {
		824508,
		95,
		true
	},
	pre_combat_main = {
		824603,
		91,
		true
	},
	pre_combat_submarine = {
		824694,
		96,
		true
	},
	pre_combat_targets = {
		824790,
		88,
		true
	},
	pre_combat_atlasloot = {
		824878,
		90,
		true
	},
	destroy_confirm_access = {
		824968,
		93,
		true
	},
	destroy_confirm_cancel = {
		825061,
		93,
		true
	},
	pt_count_tip = {
		825154,
		82,
		true
	},
	dockyard_data_loss_detected = {
		825236,
		191,
		true
	},
	littleEugen_npc = {
		825427,
		1788,
		true
	},
	five_shujuhuigu = {
		827215,
		118,
		true
	},
	five_shujuhuigu1 = {
		827333,
		91,
		true
	},
	littleChaijun_npc = {
		827424,
		1739,
		true
	},
	five_qingdian = {
		829163,
		804,
		true
	},
	friend_resume_title_detail = {
		829967,
		102,
		true
	},
	item_type13_tip1 = {
		830069,
		92,
		true
	},
	item_type13_tip2 = {
		830161,
		92,
		true
	},
	item_type16_tip1 = {
		830253,
		92,
		true
	},
	item_type16_tip2 = {
		830345,
		92,
		true
	},
	item_type17_tip1 = {
		830437,
		92,
		true
	},
	item_type17_tip2 = {
		830529,
		92,
		true
	},
	five_duomaomao = {
		830621,
		901,
		true
	},
	main_4 = {
		831522,
		81,
		true
	},
	main_5 = {
		831603,
		81,
		true
	},
	honor_medal_support_tips_display = {
		831684,
		453,
		true
	},
	honor_medal_support_tips_confirm = {
		832137,
		240,
		true
	},
	support_rate_title = {
		832377,
		94,
		true
	},
	support_times_limited = {
		832471,
		134,
		true
	},
	support_times_tip = {
		832605,
		93,
		true
	},
	build_times_tip = {
		832698,
		91,
		true
	},
	tactics_recent_ship_label = {
		832789,
		107,
		true
	},
	title_info = {
		832896,
		80,
		true
	},
	eventshop_unlock_info = {
		832976,
		96,
		true
	},
	eventshop_unlock_hint = {
		833072,
		117,
		true
	},
	commission_event_tip = {
		833189,
		886,
		true
	},
	decoration_medal_placeholder = {
		834075,
		125,
		true
	},
	technology_filter_placeholder = {
		834200,
		126,
		true
	},
	eva_comment_send_null = {
		834326,
		124,
		true
	},
	report_sent_thank = {
		834450,
		172,
		true
	},
	report_ship_cannot_comment = {
		834622,
		142,
		true
	},
	report_cannot_comment = {
		834764,
		137,
		true
	},
	report_sent_title = {
		834901,
		87,
		true
	},
	report_sent_desc = {
		834988,
		141,
		true
	},
	report_type_1 = {
		835129,
		95,
		true
	},
	report_type_1_1 = {
		835224,
		131,
		true
	},
	report_type_2 = {
		835355,
		95,
		true
	},
	report_type_2_1 = {
		835450,
		109,
		true
	},
	report_type_3 = {
		835559,
		92,
		true
	},
	report_type_3_1 = {
		835651,
		137,
		true
	},
	report_type_other = {
		835788,
		90,
		true
	},
	report_type_other_1 = {
		835878,
		140,
		true
	},
	report_type_other_2 = {
		836018,
		116,
		true
	},
	report_sent_help = {
		836134,
		538,
		true
	},
	rename_input = {
		836672,
		109,
		true
	},
	avatar_task_level = {
		836781,
		171,
		true
	},
	avatar_upgrad_1 = {
		836952,
		89,
		true
	},
	avatar_upgrad_2 = {
		837041,
		89,
		true
	},
	avatar_upgrad_3 = {
		837130,
		88,
		true
	},
	avatar_task_ship_1 = {
		837218,
		105,
		true
	},
	avatar_task_ship_2 = {
		837323,
		115,
		true
	},
	technology_queue_complete = {
		837438,
		101,
		true
	},
	technology_queue_processing = {
		837539,
		100,
		true
	},
	technology_queue_waiting = {
		837639,
		100,
		true
	},
	technology_queue_getaward = {
		837739,
		101,
		true
	},
	technology_daily_refresh = {
		837840,
		114,
		true
	},
	technology_queue_full = {
		837954,
		149,
		true
	},
	technology_queue_in_mission_incomplete = {
		838103,
		190,
		true
	},
	technology_consume = {
		838293,
		109,
		true
	},
	technology_request = {
		838402,
		100,
		true
	},
	technology_queue_in_doublecheck = {
		838502,
		274,
		true
	},
	playervtae_setting_btn_label = {
		838776,
		107,
		true
	},
	technology_queue_in_success = {
		838883,
		121,
		true
	},
	star_require_enemy_text = {
		839004,
		135,
		true
	},
	star_require_enemy_title = {
		839139,
		106,
		true
	},
	star_require_enemy_check = {
		839245,
		94,
		true
	},
	worldboss_rank_timer_label = {
		839339,
		115,
		true
	},
	technology_detail = {
		839454,
		93,
		true
	},
	technology_mission_unfinish = {
		839547,
		106,
		true
	},
	word_chinese = {
		839653,
		82,
		true
	},
	word_japanese_2 = {
		839735,
		82,
		true
	},
	word_japanese = {
		839817,
		80,
		true
	},
	avatarframe_got = {
		839897,
		88,
		true
	},
	item_is_max_cnt = {
		839985,
		115,
		true
	},
	level_fleet_ship_desc = {
		840100,
		98,
		true
	},
	level_fleet_sub_desc = {
		840198,
		97,
		true
	},
	summerland_tip = {
		840295,
		542,
		true
	},
	icecreamgame_tip = {
		840837,
		1943,
		true
	},
	unlock_date_tip = {
		842780,
		118,
		true
	},
	guild_duty_shoule_be_deputy_commander = {
		842898,
		189,
		true
	},
	guild_deputy_commander_cnt_is_full = {
		843087,
		149,
		true
	},
	guild_deputy_commander_cnt = {
		843236,
		163,
		true
	},
	mail_filter_placeholder = {
		843399,
		123,
		true
	},
	recently_sticker_placeholder = {
		843522,
		141,
		true
	},
	backhill_campusfestival_tip = {
		843663,
		1548,
		true
	},
	mini_cookgametip = {
		845211,
		1206,
		true
	},
	cook_game_Albacore = {
		846417,
		112,
		true
	},
	cook_game_august = {
		846529,
		94,
		true
	},
	cook_game_elbe = {
		846623,
		102,
		true
	},
	cook_game_hakuryu = {
		846725,
		116,
		true
	},
	cook_game_howe = {
		846841,
		117,
		true
	},
	cook_game_marcopolo = {
		846958,
		113,
		true
	},
	cook_game_noshiro = {
		847071,
		106,
		true
	},
	cook_game_pnelope = {
		847177,
		119,
		true
	},
	cook_game_laffey = {
		847296,
		137,
		true
	},
	cook_game_janus = {
		847433,
		140,
		true
	},
	cook_game_flandre = {
		847573,
		120,
		true
	},
	cook_game_constellation = {
		847693,
		168,
		true
	},
	cook_game_constellation_skill_name = {
		847861,
		140,
		true
	},
	cook_game_constellation_skill_desc = {
		848001,
		237,
		true
	},
	random_ship_on = {
		848238,
		125,
		true
	},
	random_ship_off_0 = {
		848363,
		190,
		true
	},
	random_ship_off = {
		848553,
		173,
		true
	},
	random_ship_forbidden = {
		848726,
		178,
		true
	},
	random_ship_now = {
		848904,
		97,
		true
	},
	random_ship_label = {
		849001,
		102,
		true
	},
	player_vitae_skin_setting = {
		849103,
		107,
		true
	},
	random_ship_tips1 = {
		849210,
		160,
		true
	},
	random_ship_tips2 = {
		849370,
		130,
		true
	},
	random_ship_before = {
		849500,
		118,
		true
	},
	random_ship_and_skin_title = {
		849618,
		114,
		true
	},
	random_ship_frequse_mode = {
		849732,
		100,
		true
	},
	random_ship_locked_mode = {
		849832,
		105,
		true
	},
	littleSpee_npc = {
		849937,
		2014,
		true
	},
	random_flag_ship = {
		851951,
		101,
		true
	},
	random_flag_ship_changskinBtn_label = {
		852052,
		117,
		true
	},
	expedition_drop_use_out = {
		852169,
		154,
		true
	},
	expedition_extra_drop_tip = {
		852323,
		108,
		true
	},
	ex_pass_use = {
		852431,
		81,
		true
	},
	defense_formation_tip_npc = {
		852512,
		195,
		true
	},
	pgs_login_tip = {
		852707,
		284,
		true
	},
	pgs_login_binding_exist1 = {
		852991,
		229,
		true
	},
	pgs_login_binding_exist2 = {
		853220,
		244,
		true
	},
	pgs_login_binding_exist3 = {
		853464,
		373,
		true
	},
	pgs_binding_account = {
		853837,
		118,
		true
	},
	pgs_unbind = {
		853955,
		107,
		true
	},
	pgs_unbind_tip1 = {
		854062,
		176,
		true
	},
	pgs_unbind_tip2 = {
		854238,
		271,
		true
	},
	word_item = {
		854509,
		85,
		true
	},
	word_tool = {
		854594,
		85,
		true
	},
	word_other = {
		854679,
		86,
		true
	},
	ryza_word_equip = {
		854765,
		91,
		true
	},
	ryza_rest_produce_count = {
		854856,
		113,
		true
	},
	ryza_composite_confirm = {
		854969,
		119,
		true
	},
	ryza_composite_confirm_single = {
		855088,
		119,
		true
	},
	ryza_composite_count = {
		855207,
		99,
		true
	},
	ryza_toggle_only_composite = {
		855306,
		108,
		true
	},
	ryza_tip_select_recipe = {
		855414,
		128,
		true
	},
	ryza_tip_put_materials = {
		855542,
		160,
		true
	},
	ryza_tip_composite_unlock = {
		855702,
		167,
		true
	},
	ryza_tip_unlock_all_tools = {
		855869,
		128,
		true
	},
	ryza_material_not_enough = {
		855997,
		194,
		true
	},
	ryza_tip_composite_invalid = {
		856191,
		142,
		true
	},
	ryza_tip_max_composite_count = {
		856333,
		156,
		true
	},
	ryza_tip_no_item = {
		856489,
		119,
		true
	},
	ryza_ui_show_acess = {
		856608,
		104,
		true
	},
	ryza_tip_no_recipe = {
		856712,
		124,
		true
	},
	ryza_tip_item_access = {
		856836,
		148,
		true
	},
	ryza_tip_control_buff_not_obtain_tip = {
		856984,
		143,
		true
	},
	ryza_tip_control_buff_upgrade = {
		857127,
		99,
		true
	},
	ryza_tip_control_buff_replace = {
		857226,
		99,
		true
	},
	ryza_tip_control_buff_limit = {
		857325,
		103,
		true
	},
	ryza_tip_control_buff_already_active_tip = {
		857428,
		113,
		true
	},
	ryza_tip_control_buff = {
		857541,
		153,
		true
	},
	ryza_tip_control_buff_not_obtain = {
		857694,
		105,
		true
	},
	ryza_tip_control = {
		857799,
		135,
		true
	},
	ryza_tip_main = {
		857934,
		1454,
		true
	},
	battle_levelScene_ryza_lock = {
		859388,
		172,
		true
	},
	ryza_tip_toast_item_got = {
		859560,
		99,
		true
	},
	ryza_composite_help_tip = {
		859659,
		476,
		true
	},
	ryza_control_help_tip = {
		860135,
		296,
		true
	},
	ryza_mini_game = {
		860431,
		351,
		true
	},
	ryza_task_level_desc = {
		860782,
		96,
		true
	},
	ryza_task_tag_explore = {
		860878,
		91,
		true
	},
	ryza_task_tag_battle = {
		860969,
		90,
		true
	},
	ryza_task_tag_dalegate = {
		861059,
		92,
		true
	},
	ryza_task_tag_develop = {
		861151,
		91,
		true
	},
	ryza_task_tag_adventure = {
		861242,
		93,
		true
	},
	ryza_task_tag_build = {
		861335,
		95,
		true
	},
	ryza_task_tag_create = {
		861430,
		96,
		true
	},
	ryza_task_tag_daily = {
		861526,
		95,
		true
	},
	ryza_task_detail_content = {
		861621,
		94,
		true
	},
	ryza_task_detail_award = {
		861715,
		92,
		true
	},
	ryza_task_go = {
		861807,
		82,
		true
	},
	ryza_task_get = {
		861889,
		83,
		true
	},
	ryza_task_get_all = {
		861972,
		93,
		true
	},
	ryza_task_confirm = {
		862065,
		87,
		true
	},
	ryza_task_cancel = {
		862152,
		86,
		true
	},
	ryza_task_level_num = {
		862238,
		98,
		true
	},
	ryza_task_level_add = {
		862336,
		95,
		true
	},
	ryza_task_submit = {
		862431,
		86,
		true
	},
	ryza_task_detail = {
		862517,
		86,
		true
	},
	ryza_composite_words = {
		862603,
		720,
		true
	},
	ryza_task_help_tip = {
		863323,
		345,
		true
	},
	hotspring_buff = {
		863668,
		151,
		true
	},
	random_ship_custom_mode_empty = {
		863819,
		163,
		true
	},
	random_ship_custom_mode_main_button_add = {
		863982,
		109,
		true
	},
	random_ship_custom_mode_main_button_remove = {
		864091,
		112,
		true
	},
	random_ship_custom_mode_main_tip1 = {
		864203,
		158,
		true
	},
	random_ship_custom_mode_main_tip2 = {
		864361,
		112,
		true
	},
	random_ship_custom_mode_main_empty = {
		864473,
		159,
		true
	},
	random_ship_custom_mode_select_all = {
		864632,
		110,
		true
	},
	random_ship_custom_mode_add_tip1 = {
		864742,
		151,
		true
	},
	random_ship_custom_mode_select_number = {
		864893,
		116,
		true
	},
	random_ship_custom_mode_add_complete = {
		865009,
		137,
		true
	},
	random_ship_custom_mode_add_tip2 = {
		865146,
		151,
		true
	},
	random_ship_custom_mode_remove_tip1 = {
		865297,
		157,
		true
	},
	random_ship_custom_mode_remove_complete = {
		865454,
		143,
		true
	},
	random_ship_custom_mode_remove_tip2 = {
		865597,
		157,
		true
	},
	index_dressed = {
		865754,
		92,
		true
	},
	random_ship_custom_mode = {
		865846,
		123,
		true
	},
	random_ship_custom_mode_add_title = {
		865969,
		109,
		true
	},
	random_ship_custom_mode_remove_title = {
		866078,
		112,
		true
	},
	hotspring_shop_enter1 = {
		866190,
		158,
		true
	},
	hotspring_shop_enter2 = {
		866348,
		161,
		true
	},
	hotspring_shop_insufficient = {
		866509,
		194,
		true
	},
	hotspring_shop_success1 = {
		866703,
		108,
		true
	},
	hotspring_shop_success2 = {
		866811,
		111,
		true
	},
	hotspring_shop_finish = {
		866922,
		161,
		true
	},
	hotspring_shop_end = {
		867083,
		161,
		true
	},
	hotspring_shop_touch1 = {
		867244,
		124,
		true
	},
	hotspring_shop_touch2 = {
		867368,
		137,
		true
	},
	hotspring_shop_touch3 = {
		867505,
		127,
		true
	},
	hotspring_shop_exchanged = {
		867632,
		154,
		true
	},
	hotspring_shop_exchange = {
		867786,
		188,
		true
	},
	hotspring_tip1 = {
		867974,
		151,
		true
	},
	hotspring_tip2 = {
		868125,
		111,
		true
	},
	hotspring_help = {
		868236,
		785,
		true
	},
	hotspring_expand = {
		869021,
		146,
		true
	},
	hotspring_shop_help = {
		869167,
		608,
		true
	},
	resorts_help = {
		869775,
		865,
		true
	},
	pvzminigame_help = {
		870640,
		1554,
		true
	},
	tips_yuandanhuoyue2023 = {
		872194,
		728,
		true
	},
	beach_guard_chaijun = {
		872922,
		192,
		true
	},
	beach_guard_jianye = {
		873114,
		167,
		true
	},
	beach_guard_lituoliao = {
		873281,
		287,
		true
	},
	beach_guard_bominghan = {
		873568,
		243,
		true
	},
	beach_guard_nengdai = {
		873811,
		287,
		true
	},
	beach_guard_m_craft = {
		874098,
		156,
		true
	},
	beach_guard_m_atk = {
		874254,
		136,
		true
	},
	beach_guard_m_guard = {
		874390,
		153,
		true
	},
	beach_guard_m_craft_name = {
		874543,
		100,
		true
	},
	beach_guard_m_atk_name = {
		874643,
		98,
		true
	},
	beach_guard_m_guard_name = {
		874741,
		100,
		true
	},
	beach_guard_e1 = {
		874841,
		99,
		true
	},
	beach_guard_e2 = {
		874940,
		93,
		true
	},
	beach_guard_e3 = {
		875033,
		96,
		true
	},
	beach_guard_e4 = {
		875129,
		96,
		true
	},
	beach_guard_e5 = {
		875225,
		96,
		true
	},
	beach_guard_e6 = {
		875321,
		90,
		true
	},
	beach_guard_e7 = {
		875411,
		102,
		true
	},
	beach_guard_e1_desc = {
		875513,
		138,
		true
	},
	beach_guard_e2_desc = {
		875651,
		165,
		true
	},
	beach_guard_e3_desc = {
		875816,
		165,
		true
	},
	beach_guard_e4_desc = {
		875981,
		174,
		true
	},
	beach_guard_e5_desc = {
		876155,
		153,
		true
	},
	beach_guard_e6_desc = {
		876308,
		318,
		true
	},
	beach_guard_e7_desc = {
		876626,
		165,
		true
	},
	ninghai_nianye = {
		876791,
		133,
		true
	},
	yingrui_nianye = {
		876924,
		145,
		true
	},
	zhaohe_nianye = {
		877069,
		162,
		true
	},
	zhenhai_nianye = {
		877231,
		145,
		true
	},
	haitian_nianye = {
		877376,
		166,
		true
	},
	taiyuan_nianye = {
		877542,
		133,
		true
	},
	yixian_nianye = {
		877675,
		162,
		true
	},
	activity_yanhua_tip1 = {
		877837,
		90,
		true
	},
	activity_yanhua_tip2 = {
		877927,
		102,
		true
	},
	activity_yanhua_tip3 = {
		878029,
		114,
		true
	},
	activity_yanhua_tip4 = {
		878143,
		141,
		true
	},
	activity_yanhua_tip5 = {
		878284,
		120,
		true
	},
	activity_yanhua_tip6 = {
		878404,
		126,
		true
	},
	activity_yanhua_tip7 = {
		878530,
		163,
		true
	},
	activity_yanhua_tip8 = {
		878693,
		111,
		true
	},
	help_chunjie2023 = {
		878804,
		1515,
		true
	},
	sevenday_nianye = {
		880319,
		571,
		true
	},
	tip_nianye = {
		880890,
		131,
		true
	},
	couplete_activty_desc = {
		881021,
		316,
		true
	},
	couplete_click_desc = {
		881337,
		141,
		true
	},
	couplet_index_desc = {
		881478,
		90,
		true
	},
	couplete_help = {
		881568,
		711,
		true
	},
	couplete_drag_tip = {
		882279,
		130,
		true
	},
	couplete_remind = {
		882409,
		96,
		true
	},
	couplete_complete = {
		882505,
		114,
		true
	},
	couplete_enter = {
		882619,
		133,
		true
	},
	couplete_stay = {
		882752,
		127,
		true
	},
	couplete_task = {
		882879,
		125,
		true
	},
	couplete_pass_1 = {
		883004,
		106,
		true
	},
	couplete_pass_2 = {
		883110,
		106,
		true
	},
	couplete_fail_1 = {
		883216,
		118,
		true
	},
	couplete_fail_2 = {
		883334,
		121,
		true
	},
	couplete_pair_1 = {
		883455,
		100,
		true
	},
	couplete_pair_2 = {
		883555,
		100,
		true
	},
	couplete_pair_3 = {
		883655,
		100,
		true
	},
	couplete_pair_4 = {
		883755,
		100,
		true
	},
	couplete_pair_5 = {
		883855,
		100,
		true
	},
	couplete_pair_6 = {
		883955,
		100,
		true
	},
	couplete_pair_7 = {
		884055,
		100,
		true
	},
	["2023spring_minigame_item_lantern"] = {
		884155,
		189,
		true
	},
	["2023spring_minigame_item_firecracker"] = {
		884344,
		199,
		true
	},
	["2023spring_minigame_skill_icewall"] = {
		884543,
		159,
		true
	},
	["2023spring_minigame_skill_icewall_up"] = {
		884702,
		273,
		true
	},
	["2023spring_minigame_skill_sprint"] = {
		884975,
		163,
		true
	},
	["2023spring_minigame_skill_sprint_up"] = {
		885138,
		271,
		true
	},
	["2023spring_minigame_skill_flash"] = {
		885409,
		181,
		true
	},
	["2023spring_minigame_skill_flash_up"] = {
		885590,
		250,
		true
	},
	["2023spring_minigame_bless_speed"] = {
		885840,
		148,
		true
	},
	["2023spring_minigame_bless_speed_up"] = {
		885988,
		212,
		true
	},
	["2023spring_minigame_bless_substitute"] = {
		886200,
		238,
		true
	},
	["2023spring_minigame_bless_substitute_up"] = {
		886438,
		137,
		true
	},
	["2023spring_minigame_nenjuu_skill1"] = {
		886575,
		216,
		true
	},
	["2023spring_minigame_nenjuu_skill2"] = {
		886791,
		156,
		true
	},
	["2023spring_minigame_nenjuu_skill3"] = {
		886947,
		138,
		true
	},
	["2023spring_minigame_nenjuu_skill4"] = {
		887085,
		158,
		true
	},
	["2023spring_minigame_nenjuu_skill5"] = {
		887243,
		209,
		true
	},
	["2023spring_minigame_nenjuu_skill6"] = {
		887452,
		182,
		true
	},
	["2023spring_minigame_nenjuu_skill7"] = {
		887634,
		283,
		true
	},
	["2023spring_minigame_nenjuu_skill8"] = {
		887917,
		240,
		true
	},
	["2023spring_minigame_tip1"] = {
		888157,
		94,
		true
	},
	["2023spring_minigame_tip2"] = {
		888251,
		100,
		true
	},
	["2023spring_minigame_tip3"] = {
		888351,
		97,
		true
	},
	["2023spring_minigame_tip5"] = {
		888448,
		146,
		true
	},
	["2023spring_minigame_tip6"] = {
		888594,
		111,
		true
	},
	["2023spring_minigame_tip7"] = {
		888705,
		123,
		true
	},
	["2023spring_minigame_help"] = {
		888828,
		1404,
		true
	},
	multiple_sorties_title = {
		890232,
		98,
		true
	},
	multiple_sorties_title_eng = {
		890330,
		106,
		true
	},
	multiple_sorties_locked_tip = {
		890436,
		178,
		true
	},
	multiple_sorties_times = {
		890614,
		98,
		true
	},
	multiple_sorties_tip = {
		890712,
		225,
		true
	},
	multiple_sorties_challenge_ticket_use = {
		890937,
		113,
		true
	},
	multiple_sorties_cost1 = {
		891050,
		161,
		true
	},
	multiple_sorties_cost2 = {
		891211,
		164,
		true
	},
	multiple_sorties_cost3 = {
		891375,
		167,
		true
	},
	multiple_sorties_stopped = {
		891542,
		97,
		true
	},
	multiple_sorties_stop_tip = {
		891639,
		194,
		true
	},
	multiple_sorties_resume_tip = {
		891833,
		145,
		true
	},
	multiple_sorties_auto_on = {
		891978,
		151,
		true
	},
	multiple_sorties_finish = {
		892129,
		120,
		true
	},
	multiple_sorties_stop = {
		892249,
		118,
		true
	},
	multiple_sorties_stop_end = {
		892367,
		132,
		true
	},
	multiple_sorties_end_status = {
		892499,
		218,
		true
	},
	multiple_sorties_finish_tip = {
		892717,
		148,
		true
	},
	multiple_sorties_stop_tip_end = {
		892865,
		136,
		true
	},
	multiple_sorties_stop_reason1 = {
		893001,
		126,
		true
	},
	multiple_sorties_stop_reason2 = {
		893127,
		170,
		true
	},
	multiple_sorties_stop_reason3 = {
		893297,
		126,
		true
	},
	multiple_sorties_stop_reason4 = {
		893423,
		114,
		true
	},
	multiple_sorties_main_tip = {
		893537,
		280,
		true
	},
	multiple_sorties_main_end = {
		893817,
		222,
		true
	},
	multiple_sorties_rest_time = {
		894039,
		102,
		true
	},
	multiple_sorties_retry_desc = {
		894141,
		108,
		true
	},
	msgbox_text_battle = {
		894249,
		88,
		true
	},
	pre_combat_start = {
		894337,
		86,
		true
	},
	pre_combat_start_en = {
		894423,
		95,
		true
	},
	["2023Valentine_minigame_s"] = {
		894518,
		216,
		true
	},
	["2023Valentine_minigame_a"] = {
		894734,
		182,
		true
	},
	["2023Valentine_minigame_b"] = {
		894916,
		206,
		true
	},
	["2023Valentine_minigame_c"] = {
		895122,
		176,
		true
	},
	["2023Valentine_minigame_label1"] = {
		895298,
		102,
		true
	},
	["2023Valentine_minigame_label2"] = {
		895400,
		120,
		true
	},
	["2023Valentine_minigame_label3"] = {
		895520,
		120,
		true
	},
	sort_energy = {
		895640,
		99,
		true
	},
	dockyard_search_holder = {
		895739,
		104,
		true
	},
	loveletter_exchange_tip1 = {
		895843,
		173,
		true
	},
	loveletter_exchange_tip2 = {
		896016,
		170,
		true
	},
	loveletter_exchange_confirm = {
		896186,
		285,
		true
	},
	loveletter_exchange_button = {
		896471,
		96,
		true
	},
	loveletter_exchange_tip3 = {
		896567,
		155,
		true
	},
	battle_text_common_1 = {
		896722,
		207,
		true
	},
	battle_text_common_2 = {
		896929,
		252,
		true
	},
	battle_text_common_3 = {
		897181,
		201,
		true
	},
	battle_text_yingxiv4_1 = {
		897382,
		132,
		true
	},
	battle_text_yingxiv4_2 = {
		897514,
		135,
		true
	},
	battle_text_yingxiv4_3 = {
		897649,
		132,
		true
	},
	battle_text_yingxiv4_4 = {
		897781,
		132,
		true
	},
	battle_text_yingxiv4_5 = {
		897913,
		125,
		true
	},
	battle_text_yingxiv4_6 = {
		898038,
		135,
		true
	},
	battle_text_yingxiv4_7 = {
		898173,
		135,
		true
	},
	battle_text_yingxiv4_8 = {
		898308,
		144,
		true
	},
	battle_text_yingxiv4_9 = {
		898452,
		153,
		true
	},
	battle_text_yingxiv4_10 = {
		898605,
		148,
		true
	},
	battle_text_bisimaiz_1 = {
		898753,
		138,
		true
	},
	battle_text_bisimaiz_2 = {
		898891,
		138,
		true
	},
	battle_text_bisimaiz_3 = {
		899029,
		138,
		true
	},
	battle_text_bisimaiz_4 = {
		899167,
		138,
		true
	},
	battle_text_bisimaiz_5 = {
		899305,
		138,
		true
	},
	battle_text_bisimaiz_6 = {
		899443,
		138,
		true
	},
	battle_text_bisimaiz_7 = {
		899581,
		171,
		true
	},
	battle_text_bisimaiz_8 = {
		899752,
		264,
		true
	},
	battle_text_bisimaiz_9 = {
		900016,
		255,
		true
	},
	battle_text_bisimaiz_10 = {
		900271,
		229,
		true
	},
	battle_text_yunxian_1 = {
		900500,
		182,
		true
	},
	battle_text_yunxian_2 = {
		900682,
		155,
		true
	},
	battle_text_yunxian_3 = {
		900837,
		164,
		true
	},
	battle_text_haidao_1 = {
		901001,
		151,
		true
	},
	battle_text_haidao_2 = {
		901152,
		169,
		true
	},
	battle_text_tongmeng_1 = {
		901321,
		134,
		true
	},
	battle_text_luodeni_1 = {
		901455,
		187,
		true
	},
	battle_text_luodeni_2 = {
		901642,
		205,
		true
	},
	battle_text_luodeni_3 = {
		901847,
		193,
		true
	},
	series_enemy_mood = {
		902040,
		93,
		true
	},
	series_enemy_mood_error = {
		902133,
		171,
		true
	},
	series_enemy_reward_tip1 = {
		902304,
		100,
		true
	},
	series_enemy_reward_tip2 = {
		902404,
		106,
		true
	},
	series_enemy_reward_tip3 = {
		902510,
		103,
		true
	},
	series_enemy_reward_tip4 = {
		902613,
		103,
		true
	},
	series_enemy_cost = {
		902716,
		96,
		true
	},
	series_enemy_SP_count = {
		902812,
		100,
		true
	},
	series_enemy_SP_error = {
		902912,
		127,
		true
	},
	series_enemy_unlock = {
		903039,
		153,
		true
	},
	series_enemy_storyunlock = {
		903192,
		118,
		true
	},
	series_enemy_storyreward = {
		903310,
		100,
		true
	},
	series_enemy_help = {
		903410,
		2486,
		true
	},
	series_enemy_score = {
		905896,
		91,
		true
	},
	series_enemy_total_score = {
		905987,
		103,
		true
	},
	setting_label_private = {
		906090,
		97,
		true
	},
	setting_label_licence = {
		906187,
		97,
		true
	},
	series_enemy_reward = {
		906284,
		97,
		true
	},
	series_enemy_mode_1 = {
		906381,
		95,
		true
	},
	series_enemy_mode_2 = {
		906476,
		95,
		true
	},
	series_enemy_fleet_prefix = {
		906571,
		97,
		true
	},
	series_enemy_team_notenough = {
		906668,
		210,
		true
	},
	series_enemy_empty_commander_main = {
		906878,
		109,
		true
	},
	series_enemy_empty_commander_assistant = {
		906987,
		114,
		true
	},
	limit_team_character_tips = {
		907101,
		162,
		true
	},
	game_room_help = {
		907263,
		1728,
		true
	},
	game_cannot_go = {
		908991,
		108,
		true
	},
	game_ticket_notenough = {
		909099,
		182,
		true
	},
	game_ticket_max_all = {
		909281,
		247,
		true
	},
	game_ticket_max_month = {
		909528,
		267,
		true
	},
	game_icon_notenough = {
		909795,
		171,
		true
	},
	game_goldbyicon = {
		909966,
		141,
		true
	},
	game_icon_max = {
		910107,
		229,
		true
	},
	caibulin_tip1 = {
		910336,
		125,
		true
	},
	caibulin_tip2 = {
		910461,
		165,
		true
	},
	caibulin_tip3 = {
		910626,
		125,
		true
	},
	caibulin_tip4 = {
		910751,
		168,
		true
	},
	caibulin_tip5 = {
		910919,
		125,
		true
	},
	caibulin_tip6 = {
		911044,
		165,
		true
	},
	caibulin_tip7 = {
		911209,
		125,
		true
	},
	caibulin_tip8 = {
		911334,
		165,
		true
	},
	caibulin_tip9 = {
		911499,
		177,
		true
	},
	caibulin_tip10 = {
		911676,
		172,
		true
	},
	caibulin_help = {
		911848,
		560,
		true
	},
	caibulin_tip11 = {
		912408,
		136,
		true
	},
	caibulin_lock_tip = {
		912544,
		145,
		true
	},
	gametip_xiaoqiye = {
		912689,
		2162,
		true
	},
	event_recommend_level1 = {
		914851,
		205,
		true
	},
	doa_minigame_Luna = {
		915056,
		87,
		true
	},
	doa_minigame_Misaki = {
		915143,
		92,
		true
	},
	doa_minigame_Marie = {
		915235,
		102,
		true
	},
	doa_minigame_Tamaki = {
		915337,
		92,
		true
	},
	doa_minigame_help = {
		915429,
		308,
		true
	},
	gametip_xiaokewei = {
		915737,
		2158,
		true
	},
	doa_character_select_confirm = {
		917895,
		232,
		true
	},
	blueprint_combatperformance = {
		918127,
		103,
		true
	},
	blueprint_shipperformance = {
		918230,
		98,
		true
	},
	blueprint_researching = {
		918328,
		100,
		true
	},
	sculpture_drawline_tip = {
		918428,
		138,
		true
	},
	sculpture_drawline_done = {
		918566,
		160,
		true
	},
	sculpture_drawline_exit = {
		918726,
		255,
		true
	},
	sculpture_puzzle_tip = {
		918981,
		187,
		true
	},
	sculpture_gratitude_tip = {
		919168,
		154,
		true
	},
	sculpture_close_tip = {
		919322,
		107,
		true
	},
	gift_act_help = {
		919429,
		957,
		true
	},
	gift_act_drawline_help = {
		920386,
		966,
		true
	},
	gift_act_tips = {
		921352,
		103,
		true
	},
	expedition_award_tip = {
		921455,
		160,
		true
	},
	island_act_tips1 = {
		921615,
		110,
		true
	},
	haidaojudian_help = {
		921725,
		3101,
		true
	},
	haidaojudian_building_tip = {
		924826,
		144,
		true
	},
	workbench_help = {
		924970,
		799,
		true
	},
	workbench_need_materials = {
		925769,
		100,
		true
	},
	workbench_tips1 = {
		925869,
		121,
		true
	},
	workbench_tips2 = {
		925990,
		121,
		true
	},
	workbench_tips3 = {
		926111,
		118,
		true
	},
	workbench_tips4 = {
		926229,
		105,
		true
	},
	workbench_tips5 = {
		926334,
		126,
		true
	},
	workbench_tips6 = {
		926460,
		121,
		true
	},
	workbench_tips7 = {
		926581,
		85,
		true
	},
	workbench_tips8 = {
		926666,
		91,
		true
	},
	workbench_tips9 = {
		926757,
		91,
		true
	},
	workbench_tips10 = {
		926848,
		116,
		true
	},
	island_help = {
		926964,
		610,
		true
	},
	islandnode_tips1 = {
		927574,
		98,
		true
	},
	islandnode_tips2 = {
		927672,
		84,
		true
	},
	islandnode_tips3 = {
		927756,
		110,
		true
	},
	islandnode_tips4 = {
		927866,
		110,
		true
	},
	islandnode_tips5 = {
		927976,
		138,
		true
	},
	islandnode_tips6 = {
		928114,
		116,
		true
	},
	islandnode_tips7 = {
		928230,
		143,
		true
	},
	islandnode_tips8 = {
		928373,
		165,
		true
	},
	islandnode_tips9 = {
		928538,
		165,
		true
	},
	islandshop_tips1 = {
		928703,
		104,
		true
	},
	islandshop_tips2 = {
		928807,
		86,
		true
	},
	islandshop_tips3 = {
		928893,
		86,
		true
	},
	islandshop_tips4 = {
		928979,
		88,
		true
	},
	island_shop_limit_error = {
		929067,
		178,
		true
	},
	haidaojudian_upgrade_limit = {
		929245,
		178,
		true
	},
	chargetip_monthcard_1 = {
		929423,
		162,
		true
	},
	chargetip_monthcard_2 = {
		929585,
		167,
		true
	},
	chargetip_crusing = {
		929752,
		135,
		true
	},
	chargetip_giftpackage = {
		929887,
		173,
		true
	},
	package_view_1 = {
		930060,
		136,
		true
	},
	package_view_2 = {
		930196,
		139,
		true
	},
	package_view_3 = {
		930335,
		108,
		true
	},
	package_view_4 = {
		930443,
		90,
		true
	},
	probabilityskinshop_tip = {
		930533,
		184,
		true
	},
	skin_gift_desc = {
		930717,
		289,
		true
	},
	springtask_tip = {
		931006,
		330,
		true
	},
	island_build_desc = {
		931336,
		152,
		true
	},
	island_history_desc = {
		931488,
		159,
		true
	},
	island_build_level = {
		931647,
		90,
		true
	},
	island_game_limit_help = {
		931737,
		135,
		true
	},
	island_game_limit_num = {
		931872,
		97,
		true
	},
	ore_minigame_help = {
		931969,
		1218,
		true
	},
	meta_shop_exchange_limit_2 = {
		933187,
		99,
		true
	},
	meta_shop_tip = {
		933286,
		119,
		true
	},
	pt_shop_tran_tip = {
		933405,
		248,
		true
	},
	urdraw_tip = {
		933653,
		141,
		true
	},
	urdraw_complement = {
		933794,
		181,
		true
	},
	meta_class_t_level_1 = {
		933975,
		96,
		true
	},
	meta_class_t_level_2 = {
		934071,
		96,
		true
	},
	meta_class_t_level_3 = {
		934167,
		96,
		true
	},
	meta_class_t_level_4 = {
		934263,
		96,
		true
	},
	meta_class_t_level_5 = {
		934359,
		96,
		true
	},
	meta_shop_exchange_limit_tip = {
		934455,
		134,
		true
	},
	meta_shop_exchange_limit_2_tip = {
		934589,
		162,
		true
	},
	charge_tip_crusing_label = {
		934751,
		106,
		true
	},
	mktea_1 = {
		934857,
		177,
		true
	},
	mktea_2 = {
		935034,
		144,
		true
	},
	mktea_3 = {
		935178,
		147,
		true
	},
	mktea_4 = {
		935325,
		229,
		true
	},
	mktea_5 = {
		935554,
		223,
		true
	},
	random_skin_list_item_desc_label = {
		935777,
		99,
		true
	},
	notice_input_desc = {
		935876,
		102,
		true
	},
	notice_label_send = {
		935978,
		87,
		true
	},
	notice_label_room = {
		936065,
		90,
		true
	},
	notice_label_recv = {
		936155,
		87,
		true
	},
	notice_label_tip = {
		936242,
		138,
		true
	},
	littleTaihou_npc = {
		936380,
		1980,
		true
	},
	disassemble_selected = {
		938360,
		93,
		true
	},
	disassemble_available = {
		938453,
		97,
		true
	},
	ship_formationUI_fleetName_challenge = {
		938550,
		127,
		true
	},
	ship_formationUI_fleetName_challenge_sub = {
		938677,
		132,
		true
	},
	word_status_activity = {
		938809,
		124,
		true
	},
	word_status_challenge = {
		938933,
		128,
		true
	},
	shipmodechange_reject_inactivity = {
		939061,
		218,
		true
	},
	shipmodechange_reject_inchallenge = {
		939279,
		209,
		true
	},
	battle_result_total_time = {
		939488,
		106,
		true
	},
	charge_game_room_coin_tip = {
		939594,
		253,
		true
	},
	game_room_shooting_tip = {
		939847,
		96,
		true
	},
	mini_game_shop_ticked_not_enough = {
		939943,
		193,
		true
	},
	game_ticket_current_month = {
		940136,
		107,
		true
	},
	game_icon_max_full = {
		940243,
		173,
		true
	},
	pre_combat_consume = {
		940416,
		91,
		true
	},
	file_down_msgbox = {
		940507,
		222,
		true
	},
	file_down_mgr_title = {
		940729,
		119,
		true
	},
	file_down_mgr_progress = {
		940848,
		91,
		true
	},
	file_down_mgr_error = {
		940939,
		205,
		true
	},
	last_building_not_shown = {
		941144,
		126,
		true
	},
	setting_group_prefs_tip = {
		941270,
		111,
		true
	},
	group_prefs_switch_tip = {
		941381,
		167,
		true
	},
	main_group_msgbox_content = {
		941548,
		285,
		true
	},
	word_maingroup_checking = {
		941833,
		102,
		true
	},
	word_maingroup_checktoupdate = {
		941935,
		106,
		true
	},
	word_maingroup_checkfailure = {
		942041,
		155,
		true
	},
	word_maingroup_updating = {
		942196,
		99,
		true
	},
	word_maingroup_updatesuccess = {
		942295,
		104,
		true
	},
	word_maingroup_updatefailure = {
		942399,
		150,
		true
	},
	group_download_tip = {
		942549,
		193,
		true
	},
	word_manga_checking = {
		942742,
		98,
		true
	},
	word_manga_checktoupdate = {
		942840,
		102,
		true
	},
	word_manga_checkfailure = {
		942942,
		151,
		true
	},
	word_manga_updating = {
		943093,
		98,
		true
	},
	word_manga_updatesuccess = {
		943191,
		100,
		true
	},
	word_manga_updatefailure = {
		943291,
		146,
		true
	},
	cryptolalia_lock_res = {
		943437,
		101,
		true
	},
	cryptolalia_not_download_res = {
		943538,
		109,
		true
	},
	cryptolalia_timelimie = {
		943647,
		97,
		true
	},
	cryptolalia_label_downloading = {
		943744,
		126,
		true
	},
	cryptolalia_delete_res = {
		943870,
		108,
		true
	},
	cryptolalia_delete_res_tip = {
		943978,
		146,
		true
	},
	cryptolalia_delete_res_title = {
		944124,
		106,
		true
	},
	cryptolalia_use_gem_title = {
		944230,
		107,
		true
	},
	cryptolalia_use_ticket_title = {
		944337,
		113,
		true
	},
	cryptolalia_exchange = {
		944450,
		99,
		true
	},
	cryptolalia_exchange_success = {
		944549,
		110,
		true
	},
	cryptolalia_list_title = {
		944659,
		107,
		true
	},
	cryptolalia_list_subtitle = {
		944766,
		100,
		true
	},
	cryptolalia_download_done = {
		944866,
		109,
		true
	},
	cryptolalia_coming_soom = {
		944975,
		105,
		true
	},
	cryptolalia_unopen = {
		945080,
		91,
		true
	},
	cryptolalia_no_ticket = {
		945171,
		194,
		true
	},
	cryptolalia_entrance_coming_soom = {
		945365,
		123,
		true
	},
	ship_formationUI_fleetName_sp = {
		945488,
		120,
		true
	},
	ship_formationUI_fleetName_sp_ss = {
		945608,
		123,
		true
	},
	activityboss_sp_all_buff = {
		945731,
		100,
		true
	},
	activityboss_sp_best_score = {
		945831,
		108,
		true
	},
	activityboss_sp_display_reward = {
		945939,
		106,
		true
	},
	activityboss_sp_score_bonus = {
		946045,
		106,
		true
	},
	activityboss_sp_active_buff = {
		946151,
		100,
		true
	},
	activityboss_sp_window_best_score = {
		946251,
		118,
		true
	},
	activityboss_sp_score_target = {
		946369,
		110,
		true
	},
	activityboss_sp_score = {
		946479,
		100,
		true
	},
	activityboss_sp_score_update = {
		946579,
		113,
		true
	},
	activityboss_sp_score_not_update = {
		946692,
		120,
		true
	},
	collect_page_got = {
		946812,
		92,
		true
	},
	charge_menu_month_tip = {
		946904,
		154,
		true
	},
	activity_shop_title = {
		947058,
		95,
		true
	},
	street_shop_title = {
		947153,
		93,
		true
	},
	military_shop_title = {
		947246,
		89,
		true
	},
	quota_shop_title1 = {
		947335,
		93,
		true
	},
	sham_shop_title = {
		947428,
		91,
		true
	},
	fragment_shop_title = {
		947519,
		92,
		true
	},
	guild_shop_title = {
		947611,
		89,
		true
	},
	medal_shop_title = {
		947700,
		86,
		true
	},
	meta_shop_title = {
		947786,
		83,
		true
	},
	mini_game_shop_title = {
		947869,
		96,
		true
	},
	metaskill_up = {
		947965,
		212,
		true
	},
	metaskill_overflow_tip = {
		948177,
		205,
		true
	},
	msgbox_repair_cipher = {
		948382,
		117,
		true
	},
	msgbox_repair_title = {
		948499,
		89,
		true
	},
	equip_skin_detail_count = {
		948588,
		97,
		true
	},
	faest_nothing_to_get = {
		948685,
		123,
		true
	},
	feast_click_to_close = {
		948808,
		109,
		true
	},
	feast_invitation_btn_label = {
		948917,
		102,
		true
	},
	feast_task_btn_label = {
		949019,
		95,
		true
	},
	feast_task_pt_label = {
		949114,
		93,
		true
	},
	feast_task_pt_level = {
		949207,
		87,
		true
	},
	feast_task_pt_get = {
		949294,
		90,
		true
	},
	feast_task_pt_got = {
		949384,
		90,
		true
	},
	feast_task_tag_daily = {
		949474,
		97,
		true
	},
	feast_task_tag_activity = {
		949571,
		100,
		true
	},
	feast_label_make_invitation = {
		949671,
		106,
		true
	},
	feast_no_invitation = {
		949777,
		110,
		true
	},
	feast_no_gift = {
		949887,
		104,
		true
	},
	feast_label_give_invitation = {
		949991,
		103,
		true
	},
	feast_label_give_invitation_finish = {
		950094,
		110,
		true
	},
	feast_label_give_gift = {
		950204,
		100,
		true
	},
	feast_label_give_gift_finish = {
		950304,
		107,
		true
	},
	feast_label_make_ticket_tip = {
		950411,
		170,
		true
	},
	feast_label_make_ticket_click_tip = {
		950581,
		124,
		true
	},
	feast_label_make_ticket_failed_tip = {
		950705,
		147,
		true
	},
	feast_res_window_title = {
		950852,
		92,
		true
	},
	feast_res_window_go_label = {
		950944,
		98,
		true
	},
	feast_tip = {
		951042,
		422,
		true
	},
	feast_invitation_part1 = {
		951464,
		138,
		true
	},
	feast_invitation_part2 = {
		951602,
		229,
		true
	},
	feast_invitation_part3 = {
		951831,
		265,
		true
	},
	feast_invitation_part4 = {
		952096,
		180,
		true
	},
	uscastle2023_help = {
		952276,
		1894,
		true
	},
	feast_cant_give_gift_tip = {
		954170,
		137,
		true
	},
	uscastle2023_minigame_help = {
		954307,
		367,
		true
	},
	feast_drag_invitation_tip = {
		954674,
		139,
		true
	},
	feast_drag_gift_tip = {
		954813,
		133,
		true
	},
	shoot_preview = {
		954946,
		89,
		true
	},
	hit_preview = {
		955035,
		87,
		true
	},
	story_label_skip = {
		955122,
		92,
		true
	},
	story_label_auto = {
		955214,
		89,
		true
	},
	launch_ball_skill_desc = {
		955303,
		98,
		true
	},
	launch_ball_hatsuduki_skill_1 = {
		955401,
		121,
		true
	},
	launch_ball_hatsuduki_skill_1_desc = {
		955522,
		176,
		true
	},
	launch_ball_hatsuduki_skill_2 = {
		955698,
		118,
		true
	},
	launch_ball_hatsuduki_skill_2_desc = {
		955816,
		350,
		true
	},
	launch_ball_shinano_skill_1 = {
		956166,
		119,
		true
	},
	launch_ball_shinano_skill_1_desc = {
		956285,
		212,
		true
	},
	launch_ball_shinano_skill_2 = {
		956497,
		116,
		true
	},
	launch_ball_shinano_skill_2_desc = {
		956613,
		259,
		true
	},
	launch_ball_yura_skill_1 = {
		956872,
		116,
		true
	},
	launch_ball_yura_skill_1_desc = {
		956988,
		180,
		true
	},
	launch_ball_yura_skill_2 = {
		957168,
		113,
		true
	},
	launch_ball_yura_skill_2_desc = {
		957281,
		234,
		true
	},
	launch_ball_shimakaze_skill_1 = {
		957515,
		121,
		true
	},
	launch_ball_shimakaze_skill_1_desc = {
		957636,
		230,
		true
	},
	launch_ball_shimakaze_skill_2 = {
		957866,
		118,
		true
	},
	launch_ball_shimakaze_skill_2_desc = {
		957984,
		225,
		true
	},
	jp6th_spring_tip1 = {
		958209,
		184,
		true
	},
	jp6th_spring_tip2 = {
		958393,
		117,
		true
	},
	jp6th_biaohoushan_help = {
		958510,
		1803,
		true
	},
	jp6th_lihoushan_help = {
		960313,
		3040,
		true
	},
	jp6th_lihoushan_time = {
		963353,
		143,
		true
	},
	jp6th_lihoushan_order = {
		963496,
		146,
		true
	},
	jp6th_lihoushan_pt1 = {
		963642,
		107,
		true
	},
	launchball_minigame_help = {
		963749,
		357,
		true
	},
	launchball_minigame_select = {
		964106,
		117,
		true
	},
	launchball_minigame_un_select = {
		964223,
		133,
		true
	},
	launchball_minigame_shop = {
		964356,
		109,
		true
	},
	launchball_lock_Shinano = {
		964465,
		177,
		true
	},
	launchball_lock_Yura = {
		964642,
		174,
		true
	},
	launchball_lock_Shimakaze = {
		964816,
		179,
		true
	},
	launchball_spilt_series = {
		964995,
		193,
		true
	},
	launchball_spilt_mix = {
		965188,
		296,
		true
	},
	launchball_spilt_over = {
		965484,
		252,
		true
	},
	launchball_spilt_many = {
		965736,
		183,
		true
	},
	luckybag_skin_isani = {
		965919,
		95,
		true
	},
	luckybag_skin_islive2d = {
		966014,
		93,
		true
	},
	SkinMagazinePage2_tip = {
		966107,
		97,
		true
	},
	racing_cost = {
		966204,
		88,
		true
	},
	racing_rank_top_text = {
		966292,
		96,
		true
	},
	racing_rank_half_h = {
		966388,
		100,
		true
	},
	racing_rank_no_data = {
		966488,
		107,
		true
	},
	racing_minigame_help = {
		966595,
		357,
		true
	},
	child_msg_title_detail = {
		966952,
		92,
		true
	},
	child_msg_title_tip = {
		967044,
		87,
		true
	},
	child_msg_owned = {
		967131,
		93,
		true
	},
	child_polaroid_get_tip = {
		967224,
		165,
		true
	},
	child_close_tip = {
		967389,
		109,
		true
	},
	word_month = {
		967498,
		77,
		true
	},
	word_which_month = {
		967575,
		91,
		true
	},
	word_which_week = {
		967666,
		87,
		true
	},
	word_in_one_week = {
		967753,
		89,
		true
	},
	word_week_title = {
		967842,
		85,
		true
	},
	word_harbour = {
		967927,
		82,
		true
	},
	child_btn_target = {
		968009,
		86,
		true
	},
	child_btn_collect = {
		968095,
		90,
		true
	},
	child_btn_mind = {
		968185,
		87,
		true
	},
	child_btn_bag = {
		968272,
		86,
		true
	},
	child_btn_news = {
		968358,
		99,
		true
	},
	child_main_help = {
		968457,
		526,
		true
	},
	child_archive_name = {
		968983,
		88,
		true
	},
	child_news_import_title = {
		969071,
		105,
		true
	},
	child_news_other_title = {
		969176,
		104,
		true
	},
	child_favor_progress = {
		969280,
		101,
		true
	},
	child_favor_lock1 = {
		969381,
		92,
		true
	},
	child_favor_lock2 = {
		969473,
		92,
		true
	},
	child_target_lock_tip = {
		969565,
		140,
		true
	},
	child_target_progress = {
		969705,
		97,
		true
	},
	child_target_finish_tip = {
		969802,
		133,
		true
	},
	child_target_time_title = {
		969935,
		102,
		true
	},
	child_target_title1 = {
		970037,
		95,
		true
	},
	child_target_title2 = {
		970132,
		95,
		true
	},
	child_item_type0 = {
		970227,
		89,
		true
	},
	child_item_type1 = {
		970316,
		86,
		true
	},
	child_item_type2 = {
		970402,
		86,
		true
	},
	child_item_type3 = {
		970488,
		86,
		true
	},
	child_item_type4 = {
		970574,
		89,
		true
	},
	child_mind_empty_tip = {
		970663,
		119,
		true
	},
	child_mind_finish_title = {
		970782,
		96,
		true
	},
	child_mind_processing_title = {
		970878,
		100,
		true
	},
	child_mind_time_title = {
		970978,
		100,
		true
	},
	child_collect_lock = {
		971078,
		93,
		true
	},
	child_nature_title = {
		971171,
		91,
		true
	},
	child_btn_review = {
		971262,
		92,
		true
	},
	child_schedule_empty_tip = {
		971354,
		158,
		true
	},
	child_schedule_event_tip = {
		971512,
		131,
		true
	},
	child_schedule_sure_tip = {
		971643,
		233,
		true
	},
	child_schedule_sure_tip2 = {
		971876,
		158,
		true
	},
	child_plan_check_tip1 = {
		972034,
		176,
		true
	},
	child_plan_check_tip2 = {
		972210,
		170,
		true
	},
	child_plan_check_tip3 = {
		972380,
		176,
		true
	},
	child_plan_check_tip4 = {
		972556,
		152,
		true
	},
	child_plan_check_tip5 = {
		972708,
		160,
		true
	},
	child_plan_event = {
		972868,
		92,
		true
	},
	child_btn_home = {
		972960,
		84,
		true
	},
	child_option_limit = {
		973044,
		88,
		true
	},
	child_shop_tip1 = {
		973132,
		133,
		true
	},
	child_shop_tip2 = {
		973265,
		135,
		true
	},
	child_filter_title = {
		973400,
		94,
		true
	},
	child_filter_type1 = {
		973494,
		97,
		true
	},
	child_filter_type2 = {
		973591,
		97,
		true
	},
	child_filter_type3 = {
		973688,
		97,
		true
	},
	child_plan_type1 = {
		973785,
		92,
		true
	},
	child_plan_type2 = {
		973877,
		92,
		true
	},
	child_plan_type3 = {
		973969,
		92,
		true
	},
	child_plan_type4 = {
		974061,
		92,
		true
	},
	child_filter_award_res = {
		974153,
		88,
		true
	},
	child_filter_award_nature = {
		974241,
		95,
		true
	},
	child_filter_award_attr1 = {
		974336,
		94,
		true
	},
	child_filter_award_attr2 = {
		974430,
		94,
		true
	},
	child_mood_desc1 = {
		974524,
		89,
		true
	},
	child_mood_desc2 = {
		974613,
		86,
		true
	},
	child_mood_desc3 = {
		974699,
		86,
		true
	},
	child_mood_desc4 = {
		974785,
		86,
		true
	},
	child_mood_desc5 = {
		974871,
		89,
		true
	},
	child_stage_desc1 = {
		974960,
		96,
		true
	},
	child_stage_desc2 = {
		975056,
		96,
		true
	},
	child_stage_desc3 = {
		975152,
		96,
		true
	},
	child_default_callname = {
		975248,
		95,
		true
	},
	flagship_display_mode_1 = {
		975343,
		120,
		true
	},
	flagship_display_mode_2 = {
		975463,
		114,
		true
	},
	flagship_display_mode_3 = {
		975577,
		99,
		true
	},
	flagship_educate_slot_lock_tip = {
		975676,
		201,
		true
	},
	child_story_name = {
		975877,
		89,
		true
	},
	secretary_special_name = {
		975966,
		88,
		true
	},
	secretary_special_lock_tip = {
		976054,
		142,
		true
	},
	secretary_special_title_age = {
		976196,
		112,
		true
	},
	secretary_special_title_physiognomy = {
		976308,
		120,
		true
	},
	child_plan_skip = {
		976428,
		106,
		true
	},
	child_attr_name1 = {
		976534,
		86,
		true
	},
	child_attr_name2 = {
		976620,
		86,
		true
	},
	child_task_system_type2 = {
		976706,
		93,
		true
	},
	child_task_system_type3 = {
		976799,
		93,
		true
	},
	child_plan_perform_title = {
		976892,
		103,
		true
	},
	child_date_text1 = {
		976995,
		92,
		true
	},
	child_date_text2 = {
		977087,
		92,
		true
	},
	child_date_text3 = {
		977179,
		92,
		true
	},
	child_date_text4 = {
		977271,
		92,
		true
	},
	child_upgrade_sure_tip = {
		977363,
		265,
		true
	},
	child_school_sure_tip = {
		977628,
		249,
		true
	},
	child_extraAttr_sure_tip = {
		977877,
		140,
		true
	},
	child_reset_sure_tip = {
		978017,
		226,
		true
	},
	child_end_sure_tip = {
		978243,
		124,
		true
	},
	child_buff_name = {
		978367,
		85,
		true
	},
	child_unlock_tip = {
		978452,
		86,
		true
	},
	child_unlock_out = {
		978538,
		92,
		true
	},
	child_unlock_memory = {
		978630,
		92,
		true
	},
	child_unlock_polaroid = {
		978722,
		100,
		true
	},
	child_unlock_ending = {
		978822,
		101,
		true
	},
	child_unlock_intimacy = {
		978923,
		94,
		true
	},
	child_unlock_buff = {
		979017,
		87,
		true
	},
	child_unlock_attr2 = {
		979104,
		88,
		true
	},
	child_unlock_attr3 = {
		979192,
		88,
		true
	},
	child_unlock_bag = {
		979280,
		89,
		true
	},
	child_shop_empty_tip = {
		979369,
		128,
		true
	},
	child_bag_empty_tip = {
		979497,
		112,
		true
	},
	levelscene_deploy_submarine = {
		979609,
		103,
		true
	},
	levelscene_deploy_submarine_cancel = {
		979712,
		110,
		true
	},
	levelscene_airexpel_cancel = {
		979822,
		102,
		true
	},
	levelscene_airexpel_select_enemy = {
		979924,
		130,
		true
	},
	levelscene_airexpel_outrange = {
		980054,
		150,
		true
	},
	levelscene_airexpel_select_boss = {
		980204,
		135,
		true
	},
	levelscene_airexpel_select_battle = {
		980339,
		143,
		true
	},
	levelscene_airexpel_select_confirm_left = {
		980482,
		244,
		true
	},
	levelscene_airexpel_select_confirm_right = {
		980726,
		245,
		true
	},
	levelscene_airexpel_select_confirm_up = {
		980971,
		242,
		true
	},
	levelscene_airexpel_select_confirm_down = {
		981213,
		244,
		true
	},
	shipyard_phase_1 = {
		981457,
		1378,
		true
	},
	shipyard_phase_2 = {
		982835,
		86,
		true
	},
	shipyard_button_1 = {
		982921,
		96,
		true
	},
	shipyard_button_2 = {
		983017,
		154,
		true
	},
	shipyard_introduce = {
		983171,
		313,
		true
	},
	help_supportfleet = {
		983484,
		358,
		true
	},
	word_status_inSupportFleet = {
		983842,
		105,
		true
	},
	ship_formationMediator_request_replace_support = {
		983947,
		195,
		true
	},
	tw_unsupport_tip = {
		984142,
		201,
		true
	},
	courtyard_label_train = {
		984343,
		91,
		true
	},
	courtyard_label_rest = {
		984434,
		90,
		true
	},
	courtyard_label_capacity = {
		984524,
		94,
		true
	},
	courtyard_label_share = {
		984618,
		94,
		true
	},
	courtyard_label_shop = {
		984712,
		96,
		true
	},
	courtyard_label_decoration = {
		984808,
		96,
		true
	},
	courtyard_label_template = {
		984904,
		94,
		true
	},
	courtyard_label_floor = {
		984998,
		94,
		true
	},
	courtyard_label_exp_addition = {
		985092,
		104,
		true
	},
	courtyard_label_total_exp_addition = {
		985196,
		119,
		true
	},
	courtyard_label_comfortable_addition = {
		985315,
		121,
		true
	},
	courtyard_label_placed_furniture = {
		985436,
		114,
		true
	},
	courtyard_label_shop_1 = {
		985550,
		98,
		true
	},
	courtyard_label_clear = {
		985648,
		94,
		true
	},
	courtyard_label_save = {
		985742,
		93,
		true
	},
	courtyard_label_save_theme = {
		985835,
		108,
		true
	},
	courtyard_label_using = {
		985943,
		100,
		true
	},
	courtyard_label_search_holder = {
		986043,
		102,
		true
	},
	courtyard_label_filter = {
		986145,
		98,
		true
	},
	courtyard_label_time = {
		986243,
		90,
		true
	},
	courtyard_label_week = {
		986333,
		93,
		true
	},
	courtyard_label_month = {
		986426,
		94,
		true
	},
	courtyard_label_year = {
		986520,
		93,
		true
	},
	courtyard_label_putlist_title = {
		986613,
		117,
		true
	},
	courtyard_label_custom_theme = {
		986730,
		107,
		true
	},
	courtyard_label_system_theme = {
		986837,
		107,
		true
	},
	courtyard_tip_furniture_not_in_layer = {
		986944,
		155,
		true
	},
	courtyard_label_detail = {
		987099,
		92,
		true
	},
	courtyard_label_place_pnekey = {
		987191,
		104,
		true
	},
	courtyard_label_delete = {
		987295,
		92,
		true
	},
	courtyard_label_cancel_share = {
		987387,
		107,
		true
	},
	courtyard_label_empty_template_list = {
		987494,
		139,
		true
	},
	courtyard_label_empty_custom_template_list = {
		987633,
		195,
		true
	},
	courtyard_label_empty_collection_list = {
		987828,
		135,
		true
	},
	courtyard_label_go = {
		987963,
		88,
		true
	},
	mot_class_t_level_1 = {
		988051,
		98,
		true
	},
	mot_class_t_level_2 = {
		988149,
		101,
		true
	},
	equip_share_label_1 = {
		988250,
		95,
		true
	},
	equip_share_label_2 = {
		988345,
		95,
		true
	},
	equip_share_label_3 = {
		988440,
		95,
		true
	},
	equip_share_label_4 = {
		988535,
		92,
		true
	},
	equip_share_label_5 = {
		988627,
		95,
		true
	},
	equip_share_label_6 = {
		988722,
		95,
		true
	},
	equip_share_label_7 = {
		988817,
		95,
		true
	},
	equip_share_label_8 = {
		988912,
		101,
		true
	},
	equip_share_label_9 = {
		989013,
		101,
		true
	},
	equipcode_input = {
		989114,
		121,
		true
	},
	equipcode_slot_unmatch = {
		989235,
		122,
		true
	},
	equipcode_share_nolabel = {
		989357,
		143,
		true
	},
	equipcode_share_exceedlimit = {
		989500,
		141,
		true
	},
	equipcode_illegal = {
		989641,
		133,
		true
	},
	equipcode_confirm_doublecheck = {
		989774,
		145,
		true
	},
	equipcode_import_success = {
		989919,
		121,
		true
	},
	equipcode_share_success = {
		990040,
		123,
		true
	},
	equipcode_like_limited = {
		990163,
		147,
		true
	},
	equipcode_like_success = {
		990310,
		107,
		true
	},
	equipcode_dislike_success = {
		990417,
		107,
		true
	},
	equipcode_report_type_1 = {
		990524,
		114,
		true
	},
	equipcode_report_type_2 = {
		990638,
		114,
		true
	},
	equipcode_report_warning = {
		990752,
		173,
		true
	},
	equipcode_level_unmatched = {
		990925,
		107,
		true
	},
	equipcode_equipment_unowned = {
		991032,
		100,
		true
	},
	equipcode_diff_selected = {
		991132,
		99,
		true
	},
	equipcode_export_success = {
		991231,
		127,
		true
	},
	equipcode_unsaved_tips = {
		991358,
		174,
		true
	},
	equipcode_share_ruletips = {
		991532,
		156,
		true
	},
	equipcode_share_errorcode7 = {
		991688,
		160,
		true
	},
	equipcode_share_errorcode44 = {
		991848,
		152,
		true
	},
	equipcode_share_title = {
		992000,
		97,
		true
	},
	equipcode_share_titleeng = {
		992097,
		98,
		true
	},
	equipcode_share_listempty = {
		992195,
		141,
		true
	},
	equipcode_equip_occupied = {
		992336,
		97,
		true
	},
	sail_boat_equip_tip_1 = {
		992433,
		208,
		true
	},
	sail_boat_equip_tip_2 = {
		992641,
		208,
		true
	},
	sail_boat_equip_tip_3 = {
		992849,
		218,
		true
	},
	sail_boat_equip_tip_4 = {
		993067,
		199,
		true
	},
	sail_boat_equip_tip_5 = {
		993266,
		178,
		true
	},
	sail_boat_minigame_help = {
		993444,
		356,
		true
	},
	pirate_wanted_help = {
		993800,
		444,
		true
	},
	harbor_backhill_help = {
		994244,
		1385,
		true
	},
	cryptolalia_download_task_already_exists = {
		995629,
		149,
		true
	},
	charge_scene_buy_confirm_backyard = {
		995778,
		220,
		true
	},
	roll_room1 = {
		995998,
		89,
		true
	},
	roll_room2 = {
		996087,
		85,
		true
	},
	roll_room3 = {
		996172,
		80,
		true
	},
	roll_room4 = {
		996252,
		80,
		true
	},
	roll_room5 = {
		996332,
		86,
		true
	},
	roll_room6 = {
		996418,
		89,
		true
	},
	roll_room7 = {
		996507,
		89,
		true
	},
	roll_room8 = {
		996596,
		86,
		true
	},
	roll_room9 = {
		996682,
		89,
		true
	},
	roll_room10 = {
		996771,
		90,
		true
	},
	roll_room11 = {
		996861,
		93,
		true
	},
	roll_room12 = {
		996954,
		102,
		true
	},
	roll_room13 = {
		997056,
		86,
		true
	},
	roll_room14 = {
		997142,
		93,
		true
	},
	roll_room15 = {
		997235,
		81,
		true
	},
	roll_room16 = {
		997316,
		87,
		true
	},
	roll_room17 = {
		997403,
		87,
		true
	},
	roll_attr_list = {
		997490,
		673,
		true
	},
	roll_notimes = {
		998163,
		115,
		true
	},
	roll_tip2 = {
		998278,
		137,
		true
	},
	roll_reward_word1 = {
		998415,
		87,
		true
	},
	roll_reward_word2 = {
		998502,
		90,
		true
	},
	roll_reward_word3 = {
		998592,
		90,
		true
	},
	roll_reward_word4 = {
		998682,
		90,
		true
	},
	roll_reward_word5 = {
		998772,
		90,
		true
	},
	roll_reward_word6 = {
		998862,
		90,
		true
	},
	roll_reward_word7 = {
		998952,
		90,
		true
	},
	roll_reward_word8 = {
		999042,
		90,
		true
	},
	roll_reward_tip = {
		999132,
		93,
		true
	},
	roll_unlock = {
		999225,
		151,
		true
	},
	roll_noname = {
		999376,
		142,
		true
	},
	roll_card_info = {
		999518,
		90,
		true
	},
	roll_card_attr = {
		999608,
		84,
		true
	},
	roll_card_skill = {
		999692,
		85,
		true
	},
	roll_times_left = {
		999777,
		94,
		true
	},
	roll_room_unexplored = {
		999871,
		87,
		true
	},
	roll_reward_got = {
		999958,
		88,
		true
	},
	roll_gametip = {
		1000046,
		2304,
		true
	},
	roll_ending_tip1 = {
		1002350,
		160,
		true
	},
	roll_ending_tip2 = {
		1002510,
		133,
		true
	},
	commandercat_label_raw_name = {
		1002643,
		103,
		true
	},
	commandercat_label_custom_name = {
		1002746,
		109,
		true
	},
	commandercat_label_display_name = {
		1002855,
		110,
		true
	},
	commander_selected_max = {
		1002965,
		124,
		true
	},
	word_talent = {
		1003089,
		93,
		true
	},
	word_click_to_close = {
		1003182,
		107,
		true
	},
	commander_subtile_ablity = {
		1003289,
		106,
		true
	},
	commander_subtile_talent = {
		1003395,
		109,
		true
	},
	commander_confirm_tip = {
		1003504,
		147,
		true
	},
	commander_level_up_tip = {
		1003651,
		153,
		true
	},
	commander_skill_effect = {
		1003804,
		95,
		true
	},
	commander_choice_talent_1 = {
		1003899,
		162,
		true
	},
	commander_choice_talent_2 = {
		1004061,
		104,
		true
	},
	commander_choice_talent_3 = {
		1004165,
		180,
		true
	},
	commander_get_box_tip_1 = {
		1004345,
		108,
		true
	},
	commander_get_box_tip = {
		1004453,
		118,
		true
	},
	commander_total_gold = {
		1004571,
		97,
		true
	},
	commander_use_box_tip = {
		1004668,
		103,
		true
	},
	commander_use_box_queue = {
		1004771,
		99,
		true
	},
	commander_command_ability = {
		1004870,
		101,
		true
	},
	commander_logistics_ability = {
		1004971,
		103,
		true
	},
	commander_tactical_ability = {
		1005074,
		102,
		true
	},
	commander_choice_talent_4 = {
		1005176,
		146,
		true
	},
	commander_rename_tip = {
		1005322,
		160,
		true
	},
	commander_home_level_label = {
		1005482,
		98,
		true
	},
	commander_get_commander_coptyright = {
		1005580,
		135,
		true
	},
	commander_choice_talent_reset = {
		1005715,
		244,
		true
	},
	commander_lock_setting_title = {
		1005959,
		177,
		true
	},
	skin_exchange_confirm = {
		1006136,
		178,
		true
	},
	skin_purchase_confirm = {
		1006314,
		277,
		true
	},
	blackfriday_pack_lock = {
		1006591,
		117,
		true
	},
	skin_exchange_title = {
		1006708,
		113,
		true
	},
	blackfriday_pack_select_skinall = {
		1006821,
		304,
		true
	},
	skin_discount_desc = {
		1007125,
		158,
		true
	},
	skin_exchange_timelimit = {
		1007283,
		204,
		true
	},
	blackfriday_pack_purchased = {
		1007487,
		99,
		true
	},
	commander_unsel_lock_flag_tip = {
		1007586,
		218,
		true
	},
	skin_discount_timelimit = {
		1007804,
		216,
		true
	},
	shan_luan_task_progress_tip = {
		1008020,
		105,
		true
	},
	shan_luan_task_level_tip = {
		1008125,
		111,
		true
	},
	shan_luan_task_help = {
		1008236,
		1048,
		true
	},
	shan_luan_task_buff_default = {
		1009284,
		100,
		true
	},
	senran_pt_consume_tip = {
		1009384,
		229,
		true
	},
	senran_pt_not_enough = {
		1009613,
		141,
		true
	},
	senran_pt_help = {
		1009754,
		651,
		true
	},
	senran_pt_rank = {
		1010405,
		98,
		true
	},
	senran_pt_words_feiniao = {
		1010503,
		442,
		true
	},
	senran_pt_words_banjiu = {
		1010945,
		549,
		true
	},
	senran_pt_words_yan = {
		1011494,
		483,
		true
	},
	senran_pt_words_xuequan = {
		1011977,
		520,
		true
	},
	senran_pt_words_xuebugui = {
		1012497,
		515,
		true
	},
	senran_pt_words_zi = {
		1013012,
		470,
		true
	},
	senran_pt_words_xishao = {
		1013482,
		414,
		true
	},
	senrankagura_backhill_help = {
		1013896,
		1462,
		true
	},
	dorm3d_furnitrue_type_wallpaper = {
		1015358,
		101,
		true
	},
	dorm3d_furnitrue_type_floor = {
		1015459,
		97,
		true
	},
	dorm3d_furnitrue_type_decoration = {
		1015556,
		102,
		true
	},
	dorm3d_furnitrue_type_bed = {
		1015658,
		92,
		true
	},
	dorm3d_furnitrue_type_couch = {
		1015750,
		97,
		true
	},
	dorm3d_furnitrue_type_table = {
		1015847,
		97,
		true
	},
	vote_lable_not_start = {
		1015944,
		93,
		true
	},
	vote_lable_voting = {
		1016037,
		90,
		true
	},
	vote_lable_title = {
		1016127,
		164,
		true
	},
	vote_lable_acc_title_1 = {
		1016291,
		98,
		true
	},
	vote_lable_acc_title_2 = {
		1016389,
		104,
		true
	},
	vote_lable_curr_title_1 = {
		1016493,
		99,
		true
	},
	vote_lable_curr_title_2 = {
		1016592,
		105,
		true
	},
	vote_lable_window_title = {
		1016697,
		99,
		true
	},
	vote_lable_rearch = {
		1016796,
		90,
		true
	},
	vote_lable_daily_task_title = {
		1016886,
		103,
		true
	},
	vote_lable_daily_task_tip = {
		1016989,
		160,
		true
	},
	vote_lable_task_title = {
		1017149,
		97,
		true
	},
	vote_lable_task_list_is_empty = {
		1017246,
		136,
		true
	},
	vote_lable_ship_votes = {
		1017382,
		90,
		true
	},
	vote_help_2023 = {
		1017472,
		6179,
		true
	},
	vote_tip_level_limit = {
		1023651,
		149,
		true
	},
	vote_label_rank = {
		1023800,
		86,
		true
	},
	vote_label_rank_fresh_time_tip = {
		1023886,
		130,
		true
	},
	vote_tip_area_closed = {
		1024016,
		117,
		true
	},
	commander_skill_ui_info = {
		1024133,
		93,
		true
	},
	commander_skill_ui_confirm = {
		1024226,
		96,
		true
	},
	commander_formation_prefab_fleet = {
		1024322,
		111,
		true
	},
	rect_ship_card_tpl_add = {
		1024433,
		104,
		true
	},
	newyear2024_backhill_help = {
		1024537,
		1296,
		true
	},
	last_times_sign = {
		1025833,
		108,
		true
	},
	skin_page_sign = {
		1025941,
		90,
		true
	},
	skin_page_desc = {
		1026031,
		166,
		true
	},
	live2d_reset_desc = {
		1026197,
		123,
		true
	},
	skin_exchange_usetip = {
		1026320,
		162,
		true
	},
	blackfriday_pack_select_skinall_dialog = {
		1026482,
		269,
		true
	},
	not_use_ticket_to_buy_skin = {
		1026751,
		114,
		true
	},
	skin_purchase_over_price = {
		1026865,
		346,
		true
	},
	help_chunjie2024 = {
		1027211,
		1490,
		true
	},
	child_random_polaroid_drop = {
		1028701,
		108,
		true
	},
	child_random_ops_drop = {
		1028809,
		100,
		true
	},
	child_refresh_sure_tip = {
		1028909,
		125,
		true
	},
	child_target_set_sure_tip = {
		1029034,
		238,
		true
	},
	child_polaroid_lock_tip = {
		1029272,
		156,
		true
	},
	child_task_finish_all = {
		1029428,
		131,
		true
	},
	child_unlock_new_secretary = {
		1029559,
		211,
		true
	},
	child_no_resource = {
		1029770,
		114,
		true
	},
	child_target_set_empty = {
		1029884,
		128,
		true
	},
	child_target_set_skip = {
		1030012,
		151,
		true
	},
	child_news_import_empty = {
		1030163,
		133,
		true
	},
	child_news_other_empty = {
		1030296,
		132,
		true
	},
	word_week_day1 = {
		1030428,
		87,
		true
	},
	word_week_day2 = {
		1030515,
		87,
		true
	},
	word_week_day3 = {
		1030602,
		87,
		true
	},
	word_week_day4 = {
		1030689,
		87,
		true
	},
	word_week_day5 = {
		1030776,
		87,
		true
	},
	word_week_day6 = {
		1030863,
		87,
		true
	},
	word_week_day7 = {
		1030950,
		87,
		true
	},
	child_shop_price_title = {
		1031037,
		95,
		true
	},
	child_callname_tip = {
		1031132,
		115,
		true
	},
	child_plan_no_cost = {
		1031247,
		98,
		true
	},
	word_emoji_unlock = {
		1031345,
		102,
		true
	},
	word_get_emoji = {
		1031447,
		86,
		true
	},
	word_show_extra_reward_at_fudai_dialog = {
		1031533,
		141,
		true
	},
	skin_shop_buy_confirm = {
		1031674,
		180,
		true
	},
	activity_victory = {
		1031854,
		122,
		true
	},
	other_world_temple_toggle_1 = {
		1031976,
		100,
		true
	},
	other_world_temple_toggle_2 = {
		1032076,
		103,
		true
	},
	other_world_temple_toggle_3 = {
		1032179,
		103,
		true
	},
	other_world_temple_char = {
		1032282,
		99,
		true
	},
	other_world_temple_award = {
		1032381,
		100,
		true
	},
	other_world_temple_got = {
		1032481,
		95,
		true
	},
	other_world_temple_progress = {
		1032576,
		128,
		true
	},
	other_world_temple_char_title = {
		1032704,
		105,
		true
	},
	other_world_temple_award_last = {
		1032809,
		104,
		true
	},
	other_world_temple_award_title_1 = {
		1032913,
		114,
		true
	},
	other_world_temple_award_title_2 = {
		1033027,
		117,
		true
	},
	other_world_temple_award_title_3 = {
		1033144,
		117,
		true
	},
	other_world_temple_lottery_all = {
		1033261,
		112,
		true
	},
	other_world_temple_award_desc = {
		1033373,
		190,
		true
	},
	temple_consume_not_enough = {
		1033563,
		135,
		true
	},
	other_world_temple_pay = {
		1033698,
		97,
		true
	},
	other_world_task_type_daily = {
		1033795,
		103,
		true
	},
	other_world_task_type_main = {
		1033898,
		99,
		true
	},
	other_world_task_type_repeat = {
		1033997,
		104,
		true
	},
	other_world_task_title = {
		1034101,
		101,
		true
	},
	other_world_task_get_all = {
		1034202,
		100,
		true
	},
	other_world_task_go = {
		1034302,
		89,
		true
	},
	other_world_task_got = {
		1034391,
		93,
		true
	},
	other_world_task_get = {
		1034484,
		90,
		true
	},
	other_world_task_tag_main = {
		1034574,
		98,
		true
	},
	other_world_task_tag_daily = {
		1034672,
		102,
		true
	},
	other_world_task_tag_all = {
		1034774,
		97,
		true
	},
	terminal_personal_title = {
		1034871,
		102,
		true
	},
	terminal_adventure_title = {
		1034973,
		103,
		true
	},
	terminal_guardian_title = {
		1035076,
		93,
		true
	},
	personal_info_title = {
		1035169,
		95,
		true
	},
	personal_property_title = {
		1035264,
		102,
		true
	},
	personal_ability_title = {
		1035366,
		95,
		true
	},
	adventure_award_title = {
		1035461,
		106,
		true
	},
	adventure_progress_title = {
		1035567,
		112,
		true
	},
	adventure_lv_title = {
		1035679,
		100,
		true
	},
	adventure_record_title = {
		1035779,
		98,
		true
	},
	adventure_record_grade_title = {
		1035877,
		113,
		true
	},
	adventure_award_end_tip = {
		1035990,
		127,
		true
	},
	guardian_select_title = {
		1036117,
		97,
		true
	},
	guardian_sure_btn = {
		1036214,
		87,
		true
	},
	guardian_cancel_btn = {
		1036301,
		89,
		true
	},
	guardian_active_tip = {
		1036390,
		92,
		true
	},
	personal_random = {
		1036482,
		97,
		true
	},
	adventure_get_all = {
		1036579,
		93,
		true
	},
	Announcements_Event_Notice = {
		1036672,
		102,
		true
	},
	Announcements_System_Notice = {
		1036774,
		97,
		true
	},
	Announcements_News = {
		1036871,
		94,
		true
	},
	Announcements_Donotshow = {
		1036965,
		123,
		true
	},
	adventure_unlock_tip = {
		1037088,
		177,
		true
	},
	personal_random_tip = {
		1037265,
		146,
		true
	},
	guardian_sure_limit_tip = {
		1037411,
		130,
		true
	},
	other_world_temple_tip = {
		1037541,
		533,
		true
	},
	otherworld_map_help = {
		1038074,
		530,
		true
	},
	otherworld_backhill_help = {
		1038604,
		535,
		true
	},
	otherworld_terminal_help = {
		1039139,
		535,
		true
	},
	vote_2023_reward_word_1 = {
		1039674,
		362,
		true
	},
	vote_2023_reward_word_2 = {
		1040036,
		392,
		true
	},
	vote_2023_reward_word_3 = {
		1040428,
		395,
		true
	},
	voting_page_reward = {
		1040823,
		94,
		true
	},
	backyard_shipAddInimacy_ships_ok = {
		1040917,
		187,
		true
	},
	backyard_shipAddMoney_ships_ok = {
		1041104,
		203,
		true
	},
	idol3rd_houshan = {
		1041307,
		1405,
		true
	},
	idol3rd_collection = {
		1042712,
		973,
		true
	},
	idol3rd_practice = {
		1043685,
		1172,
		true
	},
	dorm3d_furniture_window_acesses = {
		1044857,
		107,
		true
	},
	dorm3d_furniture_count = {
		1044964,
		97,
		true
	},
	dorm3d_furniture_used = {
		1045061,
		119,
		true
	},
	dorm3d_furniture_unfit = {
		1045180,
		98,
		true
	},
	dorm3d_waiting = {
		1045278,
		90,
		true
	},
	dorm3d_daily_favor = {
		1045368,
		103,
		true
	},
	dorm3d_favor_level = {
		1045471,
		106,
		true
	},
	dorm3d_time_choose = {
		1045577,
		94,
		true
	},
	dorm3d_now_time = {
		1045671,
		91,
		true
	},
	dorm3d_is_auto_time = {
		1045762,
		116,
		true
	},
	dorm3d_clothing_choose = {
		1045878,
		98,
		true
	},
	dorm3d_now_clothing = {
		1045976,
		89,
		true
	},
	dorm3d_talk = {
		1046065,
		81,
		true
	},
	dorm3d_touch = {
		1046146,
		82,
		true
	},
	dorm3d_gift = {
		1046228,
		81,
		true
	},
	dorm3d_gift_owner_num = {
		1046309,
		94,
		true
	},
	main_silent_tip_1 = {
		1046403,
		133,
		true
	},
	main_silent_tip_2 = {
		1046536,
		123,
		true
	},
	main_silent_tip_3 = {
		1046659,
		120,
		true
	},
	main_silent_tip_4 = {
		1046779,
		136,
		true
	},
	commission_label_go = {
		1046915,
		89,
		true
	},
	commission_label_finish = {
		1047004,
		93,
		true
	},
	commission_label_go_mellow = {
		1047097,
		96,
		true
	},
	commission_label_finish_mellow = {
		1047193,
		100,
		true
	},
	commission_label_unlock_event_tip = {
		1047293,
		120,
		true
	},
	commission_label_unlock_tech_tip = {
		1047413,
		119,
		true
	},
	specialshipyard_tip = {
		1047532,
		179,
		true
	},
	specialshipyard_name = {
		1047711,
		102,
		true
	},
	liner_sign_cnt_tip = {
		1047813,
		103,
		true
	},
	liner_sign_unlock_tip = {
		1047916,
		107,
		true
	},
	liner_target_type1 = {
		1048023,
		100,
		true
	},
	liner_target_type2 = {
		1048123,
		94,
		true
	},
	liner_target_type3 = {
		1048217,
		100,
		true
	},
	liner_target_type4 = {
		1048317,
		97,
		true
	},
	liner_target_type5 = {
		1048414,
		115,
		true
	},
	liner_log_schedule_title = {
		1048529,
		100,
		true
	},
	liner_log_room_title = {
		1048629,
		105,
		true
	},
	liner_log_event_title = {
		1048734,
		103,
		true
	},
	liner_schedule_award_tip1 = {
		1048837,
		113,
		true
	},
	liner_schedule_award_tip2 = {
		1048950,
		113,
		true
	},
	liner_room_award_tip = {
		1049063,
		111,
		true
	},
	liner_event_award_tip1 = {
		1049174,
		186,
		true
	},
	liner_log_event_group_title1 = {
		1049360,
		104,
		true
	},
	liner_log_event_group_title2 = {
		1049464,
		104,
		true
	},
	liner_log_event_group_title3 = {
		1049568,
		104,
		true
	},
	liner_log_event_group_title4 = {
		1049672,
		104,
		true
	},
	liner_event_award_tip2 = {
		1049776,
		125,
		true
	},
	liner_event_reasoning_title = {
		1049901,
		109,
		true
	},
	["7th_main_tip"] = {
		1050010,
		902,
		true
	},
	pipe_minigame_help = {
		1050912,
		294,
		true
	},
	pipe_minigame_rank = {
		1051206,
		124,
		true
	},
	liner_event_award_tip3 = {
		1051330,
		153,
		true
	},
	liner_room_get_tip = {
		1051483,
		99,
		true
	},
	liner_event_get_tip = {
		1051582,
		106,
		true
	},
	liner_event_lock = {
		1051688,
		132,
		true
	},
	liner_event_title1 = {
		1051820,
		97,
		true
	},
	liner_event_title2 = {
		1051917,
		97,
		true
	},
	liner_event_title3 = {
		1052014,
		97,
		true
	},
	liner_help = {
		1052111,
		282,
		true
	},
	liner_activity_lock = {
		1052393,
		125,
		true
	},
	liner_name_modify = {
		1052518,
		123,
		true
	},
	UrExchange_Pt_NotEnough = {
		1052641,
		138,
		true
	},
	UrExchange_Pt_charges = {
		1052779,
		102,
		true
	},
	UrExchange_Pt_help = {
		1052881,
		316,
		true
	}
}
