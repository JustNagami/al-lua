pg = pg or {}
pg.gametip = setmetatable({
	__name = "gametip"
}, confMT)
pg.base = pg.base or {}
pg.base.gametip = pg.base.gametip or {}
cs = cs or {}
cs.gametip = {
	ad_0 = {
		0,
		68,
		true
	},
	ad_1 = {
		68,
		306,
		true
	},
	ad_2 = {
		374,
		306,
		true
	},
	ad_3 = {
		680,
		306,
		true
	},
	word_back = {
		986,
		79,
		true
	},
	word_backyardMoney = {
		1065,
		91,
		true
	},
	word_cancel = {
		1156,
		81,
		true
	},
	word_cmdClose = {
		1237,
		89,
		true
	},
	word_delete = {
		1326,
		81,
		true
	},
	word_dockyard = {
		1407,
		83,
		true
	},
	word_dockyardUpgrade = {
		1490,
		96,
		true
	},
	word_dockyardDestroy = {
		1586,
		96,
		true
	},
	word_shipInfoScene_equip = {
		1682,
		100,
		true
	},
	word_shipInfoScene_reinfomation = {
		1782,
		107,
		true
	},
	word_shipInfoScene_infomation = {
		1889,
		105,
		true
	},
	word_editFleet = {
		1994,
		90,
		true
	},
	word_exp = {
		2084,
		75,
		true
	},
	word_expAdd = {
		2159,
		81,
		true
	},
	word_exp_chinese = {
		2240,
		86,
		true
	},
	word_exist = {
		2326,
		80,
		true
	},
	word_equip = {
		2406,
		80,
		true
	},
	word_equipDestory = {
		2486,
		87,
		true
	},
	word_food = {
		2573,
		79,
		true
	},
	word_get = {
		2652,
		78,
		true
	},
	word_got = {
		2730,
		81,
		true
	},
	word_not_get = {
		2811,
		85,
		true
	},
	word_next_level = {
		2896,
		88,
		true
	},
	word_intimacy = {
		2984,
		86,
		true
	},
	word_is = {
		3070,
		74,
		true
	},
	word_date = {
		3144,
		76,
		true
	},
	word_hour = {
		3220,
		79,
		true
	},
	word_minute = {
		3299,
		78,
		true
	},
	word_second = {
		3377,
		78,
		true
	},
	word_lv = {
		3455,
		77,
		true
	},
	word_proficiency = {
		3532,
		89,
		true
	},
	word_material = {
		3621,
		83,
		true
	},
	word_notExist = {
		3704,
		86,
		true
	},
	word_ok = {
		3790,
		77,
		true
	},
	word_preview = {
		3867,
		82,
		true
	},
	word_rarity = {
		3949,
		84,
		true
	},
	word_speedUp = {
		4033,
		82,
		true
	},
	word_succeed = {
		4115,
		82,
		true
	},
	word_start = {
		4197,
		80,
		true
	},
	word_kiss = {
		4277,
		79,
		true
	},
	word_take = {
		4356,
		79,
		true
	},
	word_takeOk = {
		4435,
		87,
		true
	},
	word_many = {
		4522,
		79,
		true
	},
	word_normal_2 = {
		4601,
		83,
		true
	},
	word_simple = {
		4684,
		81,
		true
	},
	word_save = {
		4765,
		79,
		true
	},
	word_levelup = {
		4844,
		82,
		true
	},
	word_serverLoadVindicate = {
		4926,
		117,
		true
	},
	word_serverLoadNormal = {
		5043,
		167,
		true
	},
	word_serverLoadFull = {
		5210,
		112,
		true
	},
	word_registerFull = {
		5322,
		110,
		true
	},
	word_synthesize = {
		5432,
		85,
		true
	},
	word_synthesize_power = {
		5517,
		97,
		true
	},
	word_achieved_item = {
		5614,
		94,
		true
	},
	word_formation = {
		5708,
		84,
		true
	},
	word_teach = {
		5792,
		80,
		true
	},
	word_study = {
		5872,
		80,
		true
	},
	word_destroy = {
		5952,
		82,
		true
	},
	word_upgrade = {
		6034,
		82,
		true
	},
	word_train = {
		6116,
		80,
		true
	},
	word_rest = {
		6196,
		79,
		true
	},
	word_capacity = {
		6275,
		84,
		true
	},
	word_operation = {
		6359,
		90,
		true
	},
	word_intensify_phase = {
		6449,
		96,
		true
	},
	word_systemClose = {
		6545,
		123,
		true
	},
	word_attr_antisub = {
		6668,
		87,
		true
	},
	word_attr_cannon = {
		6755,
		86,
		true
	},
	word_attr_torpedo = {
		6841,
		87,
		true
	},
	word_attr_antiaircraft = {
		6928,
		92,
		true
	},
	word_attr_air = {
		7020,
		83,
		true
	},
	word_attr_durability = {
		7103,
		90,
		true
	},
	word_attr_armor = {
		7193,
		85,
		true
	},
	word_attr_reload = {
		7278,
		86,
		true
	},
	word_attr_speed = {
		7364,
		85,
		true
	},
	word_attr_luck = {
		7449,
		84,
		true
	},
	word_attr_range = {
		7533,
		85,
		true
	},
	word_attr_range_view = {
		7618,
		90,
		true
	},
	word_attr_hit = {
		7708,
		83,
		true
	},
	word_attr_dodge = {
		7791,
		85,
		true
	},
	word_attr_luck1 = {
		7876,
		85,
		true
	},
	word_attr_damage = {
		7961,
		86,
		true
	},
	word_attr_healthy = {
		8047,
		87,
		true
	},
	word_attr_cd = {
		8134,
		82,
		true
	},
	word_attr_speciality = {
		8216,
		90,
		true
	},
	word_attr_level = {
		8306,
		91,
		true
	},
	word_shipState_npc = {
		8397,
		118,
		true
	},
	word_shipState_fight = {
		8515,
		111,
		true
	},
	word_shipState_world = {
		8626,
		114,
		true
	},
	word_shipState_rest = {
		8740,
		111,
		true
	},
	word_shipState_study = {
		8851,
		115,
		true
	},
	word_shipState_tactics = {
		8966,
		117,
		true
	},
	word_shipState_collect = {
		9083,
		136,
		true
	},
	word_shipState_event = {
		9219,
		118,
		true
	},
	word_shipState_activity = {
		9337,
		124,
		true
	},
	word_shipState_sham = {
		9461,
		123,
		true
	},
	word_shipState_support = {
		9584,
		117,
		true
	},
	word_shipType_quZhu = {
		9701,
		89,
		true
	},
	word_shipType_qinXun = {
		9790,
		90,
		true
	},
	word_shipType_zhongXun = {
		9880,
		92,
		true
	},
	word_shipType_zhanLie = {
		9972,
		91,
		true
	},
	word_shipType_hangMu = {
		10063,
		90,
		true
	},
	word_shipType_weiXiu = {
		10153,
		90,
		true
	},
	word_shipType_other = {
		10243,
		89,
		true
	},
	word_shipType_all = {
		10332,
		90,
		true
	},
	word_gem = {
		10422,
		78,
		true
	},
	word_freeGem = {
		10500,
		82,
		true
	},
	word_gem_icon = {
		10582,
		109,
		true
	},
	word_freeGem_icon = {
		10691,
		113,
		true
	},
	word_exploit = {
		10804,
		82,
		true
	},
	word_rankScore = {
		10886,
		84,
		true
	},
	word_battery = {
		10970,
		86,
		true
	},
	word_oil = {
		11056,
		78,
		true
	},
	word_gold = {
		11134,
		79,
		true
	},
	word_oilField = {
		11213,
		83,
		true
	},
	word_goldField = {
		11296,
		87,
		true
	},
	word_ema = {
		11383,
		78,
		true
	},
	word_ema1 = {
		11461,
		79,
		true
	},
	word_omamori = {
		11540,
		88,
		true
	},
	word_yisegefuke_pt = {
		11628,
		84,
		true
	},
	word_faxipt = {
		11712,
		90,
		true
	},
	word_count_2 = {
		11802,
		99,
		true
	},
	word_clear = {
		11901,
		80,
		true
	},
	word_buy = {
		11981,
		78,
		true
	},
	word_happy = {
		12059,
		103,
		true
	},
	word_normal = {
		12162,
		104,
		true
	},
	word_tired = {
		12266,
		103,
		true
	},
	word_angry = {
		12369,
		103,
		true
	},
	word_max_page = {
		12472,
		86,
		true
	},
	word_least_page = {
		12558,
		88,
		true
	},
	word_week = {
		12646,
		76,
		true
	},
	word_day = {
		12722,
		75,
		true
	},
	word_use = {
		12797,
		78,
		true
	},
	word_use_batch = {
		12875,
		89,
		true
	},
	word_discount = {
		12964,
		80,
		true
	},
	word_threaten_exclude = {
		13044,
		97,
		true
	},
	word_threaten = {
		13141,
		83,
		true
	},
	word_comingSoon = {
		13224,
		91,
		true
	},
	word_lightArmor = {
		13315,
		91,
		true
	},
	word_mediumArmor = {
		13406,
		92,
		true
	},
	word_heavyarmor = {
		13498,
		91,
		true
	},
	word_level_upperLimit = {
		13589,
		97,
		true
	},
	word_level_require = {
		13686,
		94,
		true
	},
	word_materal_no_enough = {
		13780,
		98,
		true
	},
	word_default = {
		13878,
		82,
		true
	},
	word_count = {
		13960,
		80,
		true
	},
	word_kind = {
		14040,
		79,
		true
	},
	word_piece = {
		14119,
		77,
		true
	},
	word_main_fleet = {
		14196,
		85,
		true
	},
	word_vanguard_fleet = {
		14281,
		89,
		true
	},
	word_theme = {
		14370,
		80,
		true
	},
	word_recommend = {
		14450,
		84,
		true
	},
	word_wallpaper = {
		14534,
		84,
		true
	},
	word_furniture = {
		14618,
		84,
		true
	},
	word_decorate = {
		14702,
		83,
		true
	},
	word_special = {
		14785,
		82,
		true
	},
	word_expand = {
		14867,
		81,
		true
	},
	word_wall = {
		14948,
		79,
		true
	},
	word_floorpaper = {
		15027,
		85,
		true
	},
	word_collection = {
		15112,
		85,
		true
	},
	word_mat = {
		15197,
		78,
		true
	},
	word_comfort_level = {
		15275,
		91,
		true
	},
	word_room = {
		15366,
		79,
		true
	},
	word_equipment_all = {
		15445,
		88,
		true
	},
	word_equipment_cannon = {
		15533,
		91,
		true
	},
	word_equipment_torpedo = {
		15624,
		92,
		true
	},
	word_equipment_aircraft = {
		15716,
		96,
		true
	},
	word_equipment_small_cannon = {
		15812,
		103,
		true
	},
	word_equipment_medium_cannon = {
		15915,
		104,
		true
	},
	word_equipment_big_cannon = {
		16019,
		101,
		true
	},
	word_equipment_warship_torpedo = {
		16120,
		106,
		true
	},
	word_equipment_submarine_torpedo = {
		16226,
		108,
		true
	},
	word_equipment_antiaircraft = {
		16334,
		100,
		true
	},
	word_equipment_fighter = {
		16434,
		95,
		true
	},
	word_equipment_bomber = {
		16529,
		94,
		true
	},
	word_equipment_torpedo_bomber = {
		16623,
		102,
		true
	},
	word_equipment_equip = {
		16725,
		90,
		true
	},
	word_equipment_type = {
		16815,
		89,
		true
	},
	word_equipment_rarity = {
		16904,
		94,
		true
	},
	word_equipment_intensify = {
		16998,
		94,
		true
	},
	word_equipment_special = {
		17092,
		92,
		true
	},
	word_primary_weapons = {
		17184,
		93,
		true
	},
	word_main_cannons = {
		17277,
		87,
		true
	},
	word_shipboard_aircraft = {
		17364,
		96,
		true
	},
	word_sub_cannons = {
		17460,
		86,
		true
	},
	word_sub_weapons = {
		17546,
		89,
		true
	},
	word_torpedo = {
		17635,
		82,
		true
	},
	["word_ air_defense_artillery"] = {
		17717,
		100,
		true
	},
	word_air_defense_artillery = {
		17817,
		99,
		true
	},
	word_device = {
		17916,
		81,
		true
	},
	word_cannon = {
		17997,
		81,
		true
	},
	word_fighter = {
		18078,
		85,
		true
	},
	word_bomber = {
		18163,
		84,
		true
	},
	word_attacker = {
		18247,
		86,
		true
	},
	word_seaplane = {
		18333,
		83,
		true
	},
	word_missile = {
		18416,
		82,
		true
	},
	word_online = {
		18498,
		81,
		true
	},
	word_apply = {
		18579,
		80,
		true
	},
	word_star = {
		18659,
		79,
		true
	},
	word_level = {
		18738,
		80,
		true
	},
	word_mod_value = {
		18818,
		87,
		true
	},
	word_wait = {
		18905,
		76,
		true
	},
	word_consume = {
		18981,
		82,
		true
	},
	word_sell_out = {
		19063,
		86,
		true
	},
	word_sell_lock = {
		19149,
		87,
		true
	},
	word_contribution = {
		19236,
		87,
		true
	},
	word_guild_res = {
		19323,
		90,
		true
	},
	word_fit = {
		19413,
		78,
		true
	},
	word_equipment_skin = {
		19491,
		89,
		true
	},
	word_activity = {
		19580,
		83,
		true
	},
	word_urgency_event = {
		19663,
		94,
		true
	},
	word_shop = {
		19757,
		79,
		true
	},
	word_facility = {
		19836,
		83,
		true
	},
	word_cv_key_main = {
		19919,
		89,
		true
	},
	channel_name_1 = {
		20008,
		84,
		true
	},
	channel_name_2 = {
		20092,
		84,
		true
	},
	channel_name_3 = {
		20176,
		84,
		true
	},
	channel_name_4 = {
		20260,
		84,
		true
	},
	channel_name_5 = {
		20344,
		84,
		true
	},
	common_wait = {
		20428,
		102,
		true
	},
	common_ship_type = {
		20530,
		92,
		true
	},
	common_dont_remind_dur_login = {
		20622,
		116,
		true
	},
	common_activity_end = {
		20738,
		127,
		true
	},
	common_activity_notStartOrEnd = {
		20865,
		173,
		true
	},
	common_activity_not_start = {
		21038,
		134,
		true
	},
	common_error = {
		21172,
		89,
		true
	},
	common_no_gold = {
		21261,
		119,
		true
	},
	common_no_oil = {
		21380,
		118,
		true
	},
	common_no_rmb = {
		21498,
		118,
		true
	},
	common_count_noenough = {
		21616,
		97,
		true
	},
	common_no_dorm_gold = {
		21713,
		127,
		true
	},
	common_no_resource = {
		21840,
		100,
		true
	},
	common_no_item = {
		21940,
		117,
		true
	},
	common_no_item_1 = {
		22057,
		92,
		true
	},
	common_no_x = {
		22149,
		112,
		true
	},
	common_limit_cmd = {
		22261,
		142,
		true
	},
	common_limit_type = {
		22403,
		140,
		true
	},
	common_limit_equip = {
		22543,
		100,
		true
	},
	common_buy_success = {
		22643,
		97,
		true
	},
	common_limit_level = {
		22740,
		133,
		true
	},
	common_shopId_noFound = {
		22873,
		102,
		true
	},
	common_today_buy_limit = {
		22975,
		110,
		true
	},
	common_not_enter_room = {
		23085,
		100,
		true
	},
	common_test_ship = {
		23185,
		98,
		true
	},
	common_entry_inhibited = {
		23283,
		98,
		true
	},
	common_refresh_count_insufficient = {
		23381,
		115,
		true
	},
	common_get_player_info_erro = {
		23496,
		115,
		true
	},
	common_no_open = {
		23611,
		90,
		true
	},
	["common_already owned"] = {
		23701,
		93,
		true
	},
	common_not_get_ship = {
		23794,
		98,
		true
	},
	common_sale_out = {
		23892,
		88,
		true
	},
	common_skin_out_of_stock = {
		23980,
		131,
		true
	},
	common_go_home = {
		24111,
		99,
		true
	},
	dont_remind_today = {
		24210,
		99,
		true
	},
	dont_remind_session = {
		24309,
		107,
		true
	},
	battle_no_oil = {
		24416,
		133,
		true
	},
	battle_emptyBlock = {
		24549,
		145,
		true
	},
	battle_duel_main_rage = {
		24694,
		145,
		true
	},
	battle_main_emergent = {
		24839,
		146,
		true
	},
	battle_battleMediator_goOnFight = {
		24985,
		107,
		true
	},
	battle_battleMediator_existFight = {
		25092,
		108,
		true
	},
	battle_battleMediator_clear_warning = {
		25200,
		218,
		true
	},
	battle_battleMediator_quest_exist = {
		25418,
		212,
		true
	},
	battle_levelMediator_ok_takeResource = {
		25630,
		118,
		true
	},
	battle_result_time_limit = {
		25748,
		114,
		true
	},
	battle_result_sink_limit = {
		25862,
		114,
		true
	},
	battle_result_undefeated = {
		25976,
		106,
		true
	},
	battle_result_victory = {
		26082,
		103,
		true
	},
	battle_result_defeat_all_enemys = {
		26185,
		122,
		true
	},
	battle_result_base_score = {
		26307,
		106,
		true
	},
	battle_result_dead_score = {
		26413,
		106,
		true
	},
	battle_result_score = {
		26519,
		104,
		true
	},
	battle_result_score_total = {
		26623,
		98,
		true
	},
	battle_result_total_damage = {
		26721,
		105,
		true
	},
	battle_result_contribution = {
		26826,
		105,
		true
	},
	battle_result_total_score = {
		26931,
		104,
		true
	},
	battle_result_max_combo = {
		27035,
		101,
		true
	},
	battle_levelScene_0Oil = {
		27136,
		102,
		true
	},
	battle_levelScene_0Gold = {
		27238,
		103,
		true
	},
	battle_levelScene_noRaderCount = {
		27341,
		112,
		true
	},
	battle_levelScene_lock = {
		27453,
		158,
		true
	},
	battle_levelScene_hard_lock = {
		27611,
		193,
		true
	},
	battle_levelScene_close = {
		27804,
		120,
		true
	},
	battle_levelScene_chapter_lock = {
		27924,
		181,
		true
	},
	battle_preCombatLayer_changeFormationError = {
		28105,
		146,
		true
	},
	battle_preCombatLayer_changeFormationNumberError = {
		28251,
		188,
		true
	},
	battle_preCombatLayer_ready = {
		28439,
		131,
		true
	},
	battle_preCombatLayer_quest_leaveFleet = {
		28570,
		155,
		true
	},
	battle_preCombatLayer_clear_confirm = {
		28725,
		145,
		true
	},
	battle_preCombatLayer_auto_confirm = {
		28870,
		168,
		true
	},
	battle_preCombatLayer_save_confirm = {
		29038,
		125,
		true
	},
	battle_preCombatLayer_save_march = {
		29163,
		126,
		true
	},
	battle_preCombatLayer_save_success = {
		29289,
		116,
		true
	},
	battle_preCombatLayer_time_limit = {
		29405,
		116,
		true
	},
	battle_preCombatLayer_sink_limit = {
		29521,
		128,
		true
	},
	battle_preCombatLayer_undefeated = {
		29649,
		120,
		true
	},
	battle_preCombatLayer_victory = {
		29769,
		111,
		true
	},
	battle_preCombatLayer_time_hold = {
		29880,
		118,
		true
	},
	battle_preCombatLayer_damage_before_end = {
		29998,
		146,
		true
	},
	battle_preCombatLayer_destory_transport_ship = {
		30144,
		135,
		true
	},
	battle_preCombatMediator_leastLimit = {
		30279,
		151,
		true
	},
	battle_preCombatMediator_timeout = {
		30430,
		186,
		true
	},
	battle_preCombatMediator_activity_timeout = {
		30616,
		183,
		true
	},
	battle_resourceSiteLayer_collecTimeDefault = {
		30799,
		152,
		true
	},
	battle_resourceSiteLayer_collecTime = {
		30951,
		139,
		true
	},
	battle_resourceSiteLayer_maxLv = {
		31090,
		134,
		true
	},
	battle_resourceSiteLayer_avgLv = {
		31224,
		134,
		true
	},
	battle_resourceSiteLayer_shipTypeCount = {
		31358,
		107,
		true
	},
	battle_resourceSiteLayer_no_maxLv = {
		31465,
		146,
		true
	},
	battle_resourceSiteLayer_no_avgLv = {
		31611,
		146,
		true
	},
	battle_resourceSiteLayer_no_shipTypeCount = {
		31757,
		149,
		true
	},
	battle_resourceSiteLayer_startError_collecting = {
		31906,
		122,
		true
	},
	battle_resourceSiteLayer_startError_not5Ship = {
		32028,
		150,
		true
	},
	battle_resourceSiteLayer_startError_limit = {
		32178,
		154,
		true
	},
	battle_resourceSiteLayer_endError_notStar = {
		32332,
		123,
		true
	},
	battle_resourceSiteLayer_quest_end = {
		32455,
		154,
		true
	},
	battle_resourceSiteMediator_noSite = {
		32609,
		116,
		true
	},
	battle_resourceSiteMediator_shipState_fight = {
		32725,
		155,
		true
	},
	battle_resourceSiteMediator_shipState_rest = {
		32880,
		143,
		true
	},
	battle_resourceSiteMediator_shipState_study = {
		33023,
		139,
		true
	},
	battle_resourceSiteMediator_shipState_event = {
		33162,
		157,
		true
	},
	battle_resourceSiteMediator_shipState_same = {
		33319,
		131,
		true
	},
	battle_resourceSiteMediator_ok_end = {
		33450,
		110,
		true
	},
	battle_autobot_unlock = {
		33560,
		112,
		true
	},
	tips_confirm_teleport_sub = {
		33672,
		332,
		true
	},
	backyard_addExp_Info = {
		34004,
		281,
		true
	},
	backyard_extendCapacity_error = {
		34285,
		106,
		true
	},
	backyard_extendCapacity_ok = {
		34391,
		161,
		true
	},
	backyard_addShip_error = {
		34552,
		102,
		true
	},
	backyard_buyFurniture_error = {
		34654,
		110,
		true
	},
	backyard_extendBackYard_error = {
		34764,
		118,
		true
	},
	backyard_addFood_error = {
		34882,
		105,
		true
	},
	backyard_addFood_ok = {
		34987,
		131,
		true
	},
	backyard_putFurniture_ok = {
		35118,
		100,
		true
	},
	backyard_backyardGranaryLayer_foodCountLimit = {
		35218,
		126,
		true
	},
	backyard_shipAddInimacy_ok = {
		35344,
		154,
		true
	},
	backyard_shipAddInimacy_error = {
		35498,
		115,
		true
	},
	backyard_shipAddMoney_ok = {
		35613,
		173,
		true
	},
	backyard_shipAddMoney_error = {
		35786,
		110,
		true
	},
	backyard_shipExit_error = {
		35896,
		106,
		true
	},
	backyard_shipSpeedUpEnergy_error = {
		36002,
		108,
		true
	},
	backyard_shipAlreadyExit = {
		36110,
		106,
		true
	},
	backyard_backyardGranaryLayer_full = {
		36216,
		145,
		true
	},
	backyard_backyardGranaryLayer_buyCountLimit = {
		36361,
		151,
		true
	},
	backyard_backyardGranaryLayer_error_noResource = {
		36512,
		157,
		true
	},
	backyard_backyardGranaryLayer_noFood = {
		36669,
		163,
		true
	},
	backyard_backyardGranaryLayer_noTimer = {
		36832,
		179,
		true
	},
	backyard_backyardGranaryLayer_word = {
		37011,
		150,
		true
	},
	backyard_backyardGranaryLayer_noShip = {
		37161,
		205,
		true
	},
	backyard_backyardGranaryLayer_foodTimeNotice_top = {
		37366,
		131,
		true
	},
	backyard_backyardGranaryLayer_foodTimeNotice_bottom = {
		37497,
		146,
		true
	},
	backyard_backyardGranaryLayer_foodMaxIncreaseNotice = {
		37643,
		190,
		true
	},
	backyard_backyardGranaryLayer_error_entendFail = {
		37833,
		159,
		true
	},
	backyard_backyardGranaryLayer_buy_max_count = {
		37992,
		152,
		true
	},
	backyard_backyardScene_comforChatContent1 = {
		38144,
		191,
		true
	},
	backyard_backyardScene_comforChatContent2 = {
		38335,
		202,
		true
	},
	backyard_buyExtendItem_question = {
		38537,
		146,
		true
	},
	backyard_backyardScene_expression_label_1 = {
		38683,
		111,
		true
	},
	backyard_backyardScene_expression_label_2 = {
		38794,
		111,
		true
	},
	backyard_backyardScene_expression_label_3 = {
		38905,
		111,
		true
	},
	backyard_backyardScene_quest_clearButton = {
		39016,
		152,
		true
	},
	backyard_backyardScene_quest_saveFurniture = {
		39168,
		154,
		true
	},
	backyard_backyardScene_restSuccess = {
		39322,
		134,
		true
	},
	backyard_backyardScene_clearSuccess = {
		39456,
		135,
		true
	},
	backyard_backyardScene_name = {
		39591,
		125,
		true
	},
	backyard_backyardScene_exitShipAfterAddEnergy = {
		39716,
		146,
		true
	},
	backyard_backyardScene_showAddExpInfo = {
		39862,
		198,
		true
	},
	backyard_backyardScene_error_noPosPutFurniture = {
		40060,
		138,
		true
	},
	backyard_backyardScene_error_noFurniture = {
		40198,
		132,
		true
	},
	backyard_backyardScene_error_canNotRotate = {
		40330,
		150,
		true
	},
	backyard_backyardShipInfoLayer_quest_openPos = {
		40480,
		183,
		true
	},
	backyard_backyardShipInfoLayer_quest_addShipNoFood = {
		40663,
		180,
		true
	},
	backyard_backyardShipInfoLayer_quest_quickAddEnergy = {
		40843,
		182,
		true
	},
	backyard_backyardShipInfoLayer_error_noQuickItem = {
		41025,
		137,
		true
	},
	backyard_backyardShipInfoMediator_shipState_rest = {
		41162,
		143,
		true
	},
	backyard_backyardShipInfoMediator_shipState_fight = {
		41305,
		144,
		true
	},
	backyard_backyardShipInfoMediator_shipState_study = {
		41449,
		145,
		true
	},
	backyard_backyardShipInfoMediator_shipState_collect = {
		41594,
		165,
		true
	},
	backyard_backyardShipInfoMediator_shipState_event = {
		41759,
		147,
		true
	},
	backyard_backyardShipInfoMediator_quest_moveOutFleet = {
		41906,
		200,
		true
	},
	backyard_backyardShipInfoMediator_error_vanguardFleetOnlyOneShip = {
		42106,
		162,
		true
	},
	backyard_backyardShipInfoMediator_error_mainFleetOnlyOneShip = {
		42268,
		158,
		true
	},
	backyard_backyardShipInfoMediator_ok_addShip = {
		42426,
		126,
		true
	},
	backyard_backyardShipInfoMediator_ok_unlock = {
		42552,
		119,
		true
	},
	backyard_backyardShipInfoMediator_error_noFood = {
		42671,
		132,
		true
	},
	backyard_backyardShipInfoMediator_error_fullEnergy = {
		42803,
		139,
		true
	},
	backyard_backyardShipInfoMediator_error_fleetOnlyOneShip = {
		42942,
		169,
		true
	},
	backyard_open_2floor = {
		43111,
		268,
		true
	},
	backyarad_theme_replace = {
		43379,
		174,
		true
	},
	backyard_extendArea_ok = {
		43553,
		104,
		true
	},
	backyard_extendArea_erro = {
		43657,
		132,
		true
	},
	backyard_extendArea_tip = {
		43789,
		167,
		true
	},
	backyard_notPosition_shipExit = {
		43956,
		133,
		true
	},
	backyard_no_ship_tip = {
		44089,
		99,
		true
	},
	backyard_energy_qiuck_up_tip = {
		44188,
		205,
		true
	},
	backyard_cant_put_tip = {
		44393,
		137,
		true
	},
	backyard_cant_buy_tip = {
		44530,
		97,
		true
	},
	backyard_theme_lock_tip = {
		44627,
		132,
		true
	},
	backyard_theme_open_tip = {
		44759,
		154,
		true
	},
	backyard_theme_furniture_buy_tip = {
		44913,
		274,
		true
	},
	backyard_cannot_repeat_purchase = {
		45187,
		113,
		true
	},
	backyard_theme_bought = {
		45300,
		97,
		true
	},
	backyard_interAction_no_open = {
		45397,
		116,
		true
	},
	backyard_theme_no_exist = {
		45513,
		105,
		true
	},
	backayrd_theme_delete_sucess = {
		45618,
		110,
		true
	},
	backayrd_theme_delete_erro = {
		45728,
		108,
		true
	},
	backyard_ship_on_furnitrue = {
		45836,
		133,
		true
	},
	backyard_save_empty_theme = {
		45969,
		110,
		true
	},
	backyard_theme_name_forbid = {
		46079,
		114,
		true
	},
	backyard_getResource_emptry = {
		46193,
		109,
		true
	},
	backyard_no_pos_for_ship = {
		46302,
		141,
		true
	},
	equipment_destroyEquipments_error_noEquip = {
		46443,
		120,
		true
	},
	equipment_destroyEquipments_error_notEnoughEquip = {
		46563,
		131,
		true
	},
	equipment_equipDevUI_error_noPos = {
		46694,
		120,
		true
	},
	equipment_equipmentInfoLayer_error_canNotEquip = {
		46814,
		149,
		true
	},
	equipment_equipmentScene_selectError_more = {
		46963,
		154,
		true
	},
	equipment_newEquipLayer_getNewEquip = {
		47117,
		138,
		true
	},
	equipment_select_materials_tip = {
		47255,
		121,
		true
	},
	equipment_select_device_tip = {
		47376,
		118,
		true
	},
	equipment_cant_unload = {
		47494,
		147,
		true
	},
	equipment_max_level = {
		47641,
		101,
		true
	},
	equipment_upgrade_costcheck_error = {
		47742,
		140,
		true
	},
	equipment_upgrade_feedback_lack_of_fragment = {
		47882,
		148,
		true
	},
	exercise_count_insufficient = {
		48030,
		133,
		true
	},
	exercise_clear_fleet_tip = {
		48163,
		222,
		true
	},
	exercise_fleet_exit_tip = {
		48385,
		168,
		true
	},
	exercise_replace_rivals_ok_tip = {
		48553,
		112,
		true
	},
	exercise_replace_rivals_question = {
		48665,
		153,
		true
	},
	exercise_count_recover_tip = {
		48818,
		128,
		true
	},
	exercise_shop_refresh_tip = {
		48946,
		151,
		true
	},
	exercise_shop_buy_tip = {
		49097,
		144,
		true
	},
	exercise_formation_title = {
		49241,
		106,
		true
	},
	exercise_time_tip = {
		49347,
		107,
		true
	},
	exercise_rule_tip = {
		49454,
		1129,
		true
	},
	exercise_award_tip = {
		50583,
		203,
		true
	},
	dock_yard_left_tips = {
		50786,
		136,
		true
	},
	fleet_error_no_fleet = {
		50922,
		99,
		true
	},
	fleet_repairShips_error_fullEnergy = {
		51021,
		152,
		true
	},
	fleet_repairShips_error_noResource = {
		51173,
		110,
		true
	},
	fleet_repairShips_quest = {
		51283,
		164,
		true
	},
	fleet_fleetRaname_error = {
		51447,
		103,
		true
	},
	fleet_updateFleet_error = {
		51550,
		106,
		true
	},
	friend_acceptFriendRequest_error = {
		51656,
		124,
		true
	},
	friend_deleteFriend_error = {
		51780,
		108,
		true
	},
	friend_fetchFriendMsg_error = {
		51888,
		110,
		true
	},
	friend_rejectFriendRequest_error = {
		51998,
		121,
		true
	},
	friend_searchFriend_noPlayer = {
		52119,
		107,
		true
	},
	friend_sendFriendMsg_error = {
		52226,
		109,
		true
	},
	friend_sendFriendMsg_error_noFriend = {
		52335,
		123,
		true
	},
	friend_sendFriendRequest_error = {
		52458,
		107,
		true
	},
	friend_addblacklist_error = {
		52565,
		111,
		true
	},
	friend_relieveblacklist_error = {
		52676,
		115,
		true
	},
	friend_sendFriendRequest_success = {
		52791,
		114,
		true
	},
	friend_relieveblacklist_success = {
		52905,
		116,
		true
	},
	friend_addblacklist_success = {
		53021,
		112,
		true
	},
	friend_confirm_add_blacklist = {
		53133,
		203,
		true
	},
	friend_relieve_backlist_tip = {
		53336,
		140,
		true
	},
	friend_player_is_friend_tip = {
		53476,
		115,
		true
	},
	friend_searchFriend_wait_time = {
		53591,
		119,
		true
	},
	lesson_classOver_error = {
		53710,
		105,
		true
	},
	lesson_endToLearn_error = {
		53815,
		106,
		true
	},
	lesson_startToLearn_error = {
		53921,
		102,
		true
	},
	tactics_lesson_cancel = {
		54023,
		175,
		true
	},
	tactics_lesson_system_introduce = {
		54198,
		287,
		true
	},
	tactics_lesson_start_tip = {
		54485,
		237,
		true
	},
	tactics_noskill_erro = {
		54722,
		102,
		true
	},
	tactics_max_level = {
		54824,
		108,
		true
	},
	tactics_end_to_learn = {
		54932,
		209,
		true
	},
	tactics_continue_to_learn = {
		55141,
		119,
		true
	},
	tactics_should_exist_skill = {
		55260,
		108,
		true
	},
	tactics_skill_level_up = {
		55368,
		119,
		true
	},
	tactics_no_lesson = {
		55487,
		108,
		true
	},
	tactics_lesson_full = {
		55595,
		101,
		true
	},
	tactics_lesson_repeated = {
		55696,
		120,
		true
	},
	login_gate_not_ready = {
		55816,
		105,
		true
	},
	login_game_not_ready = {
		55921,
		111,
		true
	},
	login_game_rigister_full = {
		56032,
		121,
		true
	},
	login_game_login_full = {
		56153,
		131,
		true
	},
	login_game_banned = {
		56284,
		120,
		true
	},
	login_game_frequence = {
		56404,
		111,
		true
	},
	login_createNewPlayer_full = {
		56515,
		117,
		true
	},
	login_createNewPlayer_error = {
		56632,
		104,
		true
	},
	login_createNewPlayer_error_nameNull = {
		56736,
		118,
		true
	},
	login_newPlayerScene_word_lingBo = {
		56854,
		184,
		true
	},
	login_newPlayerScene_word_yingHuoChong = {
		57038,
		200,
		true
	},
	login_newPlayerScene_word_laFei = {
		57238,
		192,
		true
	},
	login_newPlayerScene_word_biaoqiang = {
		57430,
		188,
		true
	},
	login_newPlayerScene_word_z23 = {
		57618,
		193,
		true
	},
	login_newPlayerScene_randomName = {
		57811,
		116,
		true
	},
	login_newPlayerScene_error_notChoiseShip = {
		57927,
		119,
		true
	},
	login_newPlayerScene_inputName = {
		58046,
		109,
		true
	},
	login_loginMediator_kickOtherLogin = {
		58155,
		116,
		true
	},
	login_loginMediator_kickServerClose = {
		58271,
		114,
		true
	},
	login_loginMediator_kickIntError = {
		58385,
		108,
		true
	},
	login_loginMediator_kickTimeError = {
		58493,
		115,
		true
	},
	login_loginMediator_vertifyFail = {
		58608,
		113,
		true
	},
	login_loginMediator_dataExpired = {
		58721,
		113,
		true
	},
	login_loginMediator_kickLoginOut = {
		58834,
		111,
		true
	},
	login_loginMediator_serverLoginErro = {
		58945,
		120,
		true
	},
	login_loginMediator_kickUndefined = {
		59065,
		119,
		true
	},
	login_loginMediator_loginSuccess = {
		59184,
		108,
		true
	},
	login_loginMediator_quest_RegisterSuccess = {
		59292,
		136,
		true
	},
	login_loginMediator_registerFail_error = {
		59428,
		115,
		true
	},
	login_loginMediator_userLoginFail_error = {
		59543,
		116,
		true
	},
	login_loginMediator_serverLoginFail_error = {
		59659,
		127,
		true
	},
	login_loginScene_error_noUserName = {
		59786,
		118,
		true
	},
	login_loginScene_error_noPassword = {
		59904,
		115,
		true
	},
	login_loginScene_error_diffPassword = {
		60019,
		130,
		true
	},
	login_loginScene_error_noMailBox = {
		60149,
		114,
		true
	},
	login_loginScene_choiseServer = {
		60263,
		111,
		true
	},
	login_loginScene_server_vindicate = {
		60374,
		127,
		true
	},
	login_loginScene_server_full = {
		60501,
		116,
		true
	},
	login_loginScene_server_disabled = {
		60617,
		114,
		true
	},
	login_register_full = {
		60731,
		101,
		true
	},
	system_database_busy = {
		60832,
		117,
		true
	},
	mail_getMailList_error_noNewMail = {
		60949,
		111,
		true
	},
	mail_takeAttachment_error_noMail = {
		61060,
		114,
		true
	},
	mail_takeAttachment_error_noAttach = {
		61174,
		116,
		true
	},
	mail_takeAttachment_error_noWorld = {
		61290,
		152,
		true
	},
	mail_takeAttachment_error_reWorld = {
		61442,
		203,
		true
	},
	mail_count = {
		61645,
		114,
		true
	},
	mail_takeAttachment_error_magazine_full = {
		61759,
		198,
		true
	},
	mail_takeAttachment_error_dockYrad_full = {
		61957,
		192,
		true
	},
	mail_confirm_set_important_flag = {
		62149,
		125,
		true
	},
	mail_confirm_cancel_important_flag = {
		62274,
		135,
		true
	},
	main_mailLayer_mailBoxClear = {
		62409,
		109,
		true
	},
	main_mailLayer_noNewMail = {
		62518,
		103,
		true
	},
	main_mailLayer_takeAttach = {
		62621,
		101,
		true
	},
	main_mailLayer_noAttach = {
		62722,
		96,
		true
	},
	main_mailLayer_attachTaken = {
		62818,
		105,
		true
	},
	main_mailLayer_quest_clear = {
		62923,
		195,
		true
	},
	main_mailLayer_quest_deleteNotTakeAttach = {
		63118,
		174,
		true
	},
	main_mailLayer_quest_deleteNotRead = {
		63292,
		168,
		true
	},
	main_mailMediator_mailDelete = {
		63460,
		107,
		true
	},
	main_mailMediator_attachTaken = {
		63567,
		108,
		true
	},
	main_mailMediator_notingToTake = {
		63675,
		118,
		true
	},
	main_mailMediator_takeALot = {
		63793,
		99,
		true
	},
	main_navalAcademyScene_systemClose = {
		63892,
		142,
		true
	},
	main_navalAcademyScene_quest_startClass = {
		64034,
		176,
		true
	},
	main_navalAcademyScene_quest_stopClass = {
		64210,
		223,
		true
	},
	main_navalAcademyScene_quest_Classover_long = {
		64433,
		222,
		true
	},
	main_navalAcademyScene_quest_Classover_short = {
		64655,
		192,
		true
	},
	main_navalAcademyScene_upgrade_complete = {
		64847,
		188,
		true
	},
	main_navalAcademyScene_class_upgrade_complete = {
		65035,
		151,
		true
	},
	main_navalAcademyScene_work_done = {
		65186,
		133,
		true
	},
	main_notificationLayer_searchInput = {
		65319,
		126,
		true
	},
	main_notificationLayer_noInput = {
		65445,
		112,
		true
	},
	main_notificationLayer_noFriend = {
		65557,
		113,
		true
	},
	main_notificationLayer_deleteFriend = {
		65670,
		111,
		true
	},
	main_notificationLayer_sendButton = {
		65781,
		112,
		true
	},
	main_notificationLayer_addFriendError_addSelf = {
		65893,
		137,
		true
	},
	main_notificationLayer_addFriendError_friendAlready = {
		66030,
		143,
		true
	},
	main_notificationLayer_quest_deletFriend = {
		66173,
		169,
		true
	},
	main_notificationLayer_quest_request = {
		66342,
		140,
		true
	},
	main_notificationLayer_enter_room = {
		66482,
		141,
		true
	},
	main_notificationLayer_not_roomId = {
		66623,
		115,
		true
	},
	main_notificationLayer_roomId_invaild = {
		66738,
		116,
		true
	},
	main_notificationMediator_sendFriendRequest = {
		66854,
		128,
		true
	},
	main_notificationMediator_beFriend = {
		66982,
		148,
		true
	},
	main_notificationMediator_deleteFriend = {
		67130,
		152,
		true
	},
	main_notificationMediator_room_max_number = {
		67282,
		126,
		true
	},
	main_playerInfoLayer_inputName = {
		67408,
		109,
		true
	},
	main_playerInfoLayer_inputManifesto = {
		67517,
		120,
		true
	},
	main_playerInfoLayer_quest_changeName = {
		67637,
		156,
		true
	},
	main_playerInfoLayer_error_changeNameNoGem = {
		67793,
		118,
		true
	},
	main_settingsScene_quest_exist = {
		67911,
		112,
		true
	},
	coloring_color_missmatch = {
		68023,
		106,
		true
	},
	coloring_color_not_enough = {
		68129,
		141,
		true
	},
	coloring_erase_all_warning = {
		68270,
		157,
		true
	},
	coloring_erase_warning = {
		68427,
		153,
		true
	},
	coloring_lock = {
		68580,
		86,
		true
	},
	coloring_wait_open = {
		68666,
		94,
		true
	},
	coloring_help_tip = {
		68760,
		978,
		true
	},
	link_link_help_tip = {
		69738,
		1029,
		true
	},
	player_changeManifesto_ok = {
		70767,
		107,
		true
	},
	player_changeManifesto_error = {
		70874,
		111,
		true
	},
	player_changePlayerIcon_ok = {
		70985,
		114,
		true
	},
	player_changePlayerIcon_error = {
		71099,
		112,
		true
	},
	player_changePlayerName_ok = {
		71211,
		108,
		true
	},
	player_changePlayerName_error = {
		71319,
		112,
		true
	},
	player_changePlayerName_error_2015 = {
		71431,
		119,
		true
	},
	player_harvestResource_error = {
		71550,
		111,
		true
	},
	player_harvestResource_error_fullBag = {
		71661,
		140,
		true
	},
	player_change_chat_room_erro = {
		71801,
		113,
		true
	},
	prop_destroyProp_error_noItem = {
		71914,
		111,
		true
	},
	prop_destroyProp_error_canNotSell = {
		72025,
		118,
		true
	},
	prop_destroyProp_error_notEnoughItem = {
		72143,
		134,
		true
	},
	prop_destroyProp_error = {
		72277,
		105,
		true
	},
	resourceSite_error_noSite = {
		72382,
		107,
		true
	},
	resourceSite_beginScanMap_ok = {
		72489,
		104,
		true
	},
	resourceSite_beginScanMap_error = {
		72593,
		114,
		true
	},
	resourceSite_collectResource_error = {
		72707,
		117,
		true
	},
	resourceSite_finishResourceSite_error = {
		72824,
		120,
		true
	},
	resourceSite_startResourceSite_error = {
		72944,
		122,
		true
	},
	ship_error_noShip = {
		73066,
		123,
		true
	},
	ship_addStarExp_error = {
		73189,
		107,
		true
	},
	ship_buildShip_error = {
		73296,
		103,
		true
	},
	ship_buildShip_error_noTemplate = {
		73399,
		144,
		true
	},
	ship_buildShip_error_notEnoughItem = {
		73543,
		132,
		true
	},
	ship_buildShipImmediately_error = {
		73675,
		114,
		true
	},
	ship_buildShipImmediately_error_noSHip = {
		73789,
		120,
		true
	},
	ship_buildShipImmediately_error_finished = {
		73909,
		119,
		true
	},
	ship_buildShipImmediately_error_noItem = {
		74028,
		120,
		true
	},
	ship_buildShip_not_position = {
		74148,
		131,
		true
	},
	ship_buildBatchShip = {
		74279,
		182,
		true
	},
	ship_buildSingleShip = {
		74461,
		182,
		true
	},
	ship_buildShip_succeed = {
		74643,
		104,
		true
	},
	ship_buildShip_list_empty = {
		74747,
		113,
		true
	},
	ship_buildship_tip = {
		74860,
		200,
		true
	},
	ship_destoryShips_error = {
		75060,
		103,
		true
	},
	ship_equipToShip_ok = {
		75163,
		120,
		true
	},
	ship_equipToShip_error = {
		75283,
		105,
		true
	},
	ship_equipToShip_error_noEquip = {
		75388,
		109,
		true
	},
	ship_equip_check = {
		75497,
		120,
		true
	},
	ship_getShip_error = {
		75617,
		101,
		true
	},
	ship_getShip_error_noShip = {
		75718,
		107,
		true
	},
	ship_getShip_error_notFinish = {
		75825,
		110,
		true
	},
	ship_getShip_error_full = {
		75935,
		143,
		true
	},
	ship_modShip_error = {
		76078,
		101,
		true
	},
	ship_modShip_error_notEnoughGold = {
		76179,
		132,
		true
	},
	ship_remouldShip_error = {
		76311,
		102,
		true
	},
	ship_unequipFromShip_ok = {
		76413,
		123,
		true
	},
	ship_unequipFromShip_error = {
		76536,
		109,
		true
	},
	ship_unequipFromShip_error_noEquip = {
		76645,
		122,
		true
	},
	ship_unequip_all_tip = {
		76767,
		111,
		true
	},
	ship_unequip_all_success = {
		76878,
		130,
		true
	},
	ship_updateShipLock_ok_lock = {
		77008,
		128,
		true
	},
	ship_updateShipLock_ok_unlock = {
		77136,
		131,
		true
	},
	ship_updateShipLock_error = {
		77267,
		114,
		true
	},
	ship_upgradeStar_error = {
		77381,
		105,
		true
	},
	ship_upgradeStar_error_4010 = {
		77486,
		140,
		true
	},
	ship_upgradeStar_error_lvLimit = {
		77626,
		145,
		true
	},
	ship_upgradeStar_error_noEnoughMatrail = {
		77771,
		120,
		true
	},
	ship_upgradeStar_notConfig = {
		77891,
		137,
		true
	},
	ship_upgradeStar_maxLevel = {
		78028,
		135,
		true
	},
	ship_upgradeStar_select_material_tip = {
		78163,
		121,
		true
	},
	ship_exchange_question = {
		78284,
		164,
		true
	},
	ship_exchange_medalCount_noEnough = {
		78448,
		115,
		true
	},
	ship_exchange_erro = {
		78563,
		122,
		true
	},
	ship_exchange_confirm = {
		78685,
		113,
		true
	},
	ship_exchange_tip = {
		78798,
		266,
		true
	},
	ship_vo_fighting = {
		79064,
		101,
		true
	},
	ship_vo_event = {
		79165,
		113,
		true
	},
	ship_vo_isCharacter = {
		79278,
		125,
		true
	},
	ship_vo_inBackyardRest = {
		79403,
		107,
		true
	},
	ship_vo_inClass = {
		79510,
		103,
		true
	},
	ship_vo_moveout_backyard = {
		79613,
		106,
		true
	},
	ship_vo_moveout_formation = {
		79719,
		107,
		true
	},
	ship_vo_mainFleet_must_hasShip = {
		79826,
		131,
		true
	},
	ship_vo_vanguardFleet_must_hasShip = {
		79957,
		135,
		true
	},
	ship_vo_getWordsUndefined = {
		80092,
		181,
		true
	},
	ship_vo_locked = {
		80273,
		93,
		true
	},
	ship_vo_mainFleet_exist_same_ship = {
		80366,
		134,
		true
	},
	ship_vo_vanguardFleet_exist_same_ship = {
		80500,
		138,
		true
	},
	ship_buildShipMediator_startBuild = {
		80638,
		109,
		true
	},
	ship_buildShipMediator_finishBuild = {
		80747,
		110,
		true
	},
	ship_buildShipScene_quest_quickFinish = {
		80857,
		222,
		true
	},
	ship_dockyardMediator_destroy = {
		81079,
		105,
		true
	},
	ship_dockyardScene_capacity = {
		81184,
		104,
		true
	},
	ship_dockyardScene_noRole = {
		81288,
		107,
		true
	},
	ship_dockyardScene_error_choiseRoleMore = {
		81395,
		152,
		true
	},
	ship_dockyardScene_error_choiseRoleLess = {
		81547,
		152,
		true
	},
	ship_formationMediator_leastLimit = {
		81699,
		149,
		true
	},
	ship_formationMediator_changeNameSuccess = {
		81848,
		132,
		true
	},
	ship_formationMediator_changeNameError_sameShip = {
		81980,
		148,
		true
	},
	ship_formationMediator_addShipError_overlimit = {
		82128,
		187,
		true
	},
	ship_formationMediator_replaceError_onlyShip = {
		82315,
		212,
		true
	},
	ship_formationMediator_quest_replace = {
		82527,
		185,
		true
	},
	ship_formationMediaror_trash_warning = {
		82712,
		232,
		true
	},
	ship_formationUI_fleetName1 = {
		82944,
		103,
		true
	},
	ship_formationUI_fleetName2 = {
		83047,
		103,
		true
	},
	ship_formationUI_fleetName3 = {
		83150,
		103,
		true
	},
	ship_formationUI_fleetName4 = {
		83253,
		103,
		true
	},
	ship_formationUI_fleetName5 = {
		83356,
		103,
		true
	},
	ship_formationUI_fleetName6 = {
		83459,
		103,
		true
	},
	ship_formationUI_fleetName11 = {
		83562,
		107,
		true
	},
	ship_formationUI_fleetName12 = {
		83669,
		107,
		true
	},
	ship_formationUI_exercise_fleetName = {
		83776,
		111,
		true
	},
	ship_formationUI_fleetName_world = {
		83887,
		114,
		true
	},
	ship_formationUI_changeFormationError_flag = {
		84001,
		158,
		true
	},
	ship_formationUI_changeFormationError_countError = {
		84159,
		131,
		true
	},
	ship_formationUI_removeError_onlyShip = {
		84290,
		191,
		true
	},
	ship_formationUI_quest_remove = {
		84481,
		140,
		true
	},
	ship_newShipLayer_get = {
		84621,
		146,
		true
	},
	ship_newSkinLayer_get = {
		84767,
		151,
		true
	},
	ship_newSkin_name = {
		84918,
		89,
		true
	},
	ship_shipInfoMediator_destory = {
		85007,
		105,
		true
	},
	ship_shipInfoScene_equipUnlockSlostContent = {
		85112,
		167,
		true
	},
	ship_shipInfoScene_equipUnlockSlostYesText = {
		85279,
		118,
		true
	},
	ship_shipInfoScene_effect = {
		85397,
		133,
		true
	},
	ship_shipInfoScene_effect1or2 = {
		85530,
		133,
		true
	},
	ship_shipInfoScene_modLvMax = {
		85663,
		118,
		true
	},
	ship_shipInfoScene_choiseMod = {
		85781,
		125,
		true
	},
	ship_shipModLayer_effect = {
		85906,
		132,
		true
	},
	ship_shipModLayer_effect1or2 = {
		86038,
		132,
		true
	},
	ship_shipModLayer_modSuccess = {
		86170,
		104,
		true
	},
	ship_mod_no_addition_tip = {
		86274,
		148,
		true
	},
	ship_shipModMediator_choiseMaterial = {
		86422,
		133,
		true
	},
	ship_shipModMediator_noticeLvOver1 = {
		86555,
		111,
		true
	},
	ship_shipModMediator_noticeStarOver4 = {
		86666,
		113,
		true
	},
	ship_shipModMediator_noticeSameButLargerStar = {
		86779,
		130,
		true
	},
	ship_shipModMediator_quest = {
		86909,
		173,
		true
	},
	ship_shipUpgradeLayer2_levelError = {
		87082,
		109,
		true
	},
	ship_shipUpgradeLayer2_noMaterail = {
		87191,
		109,
		true
	},
	ship_shipUpgradeLayer2_ok = {
		87300,
		101,
		true
	},
	ship_shipUpgradeLayer2_effect = {
		87401,
		137,
		true
	},
	ship_shipUpgradeLayer2_effect1or2 = {
		87538,
		137,
		true
	},
	ship_shipUpgradeLayer2_mod_uncommon_tip = {
		87675,
		190,
		true
	},
	ship_shipUpgradeLayer2_uncommon_tip = {
		87865,
		186,
		true
	},
	ship_shipUpgradeLayer2_mod_advanced_tip = {
		88051,
		191,
		true
	},
	ship_shipUpgradeLayer2_advanced_tip = {
		88242,
		187,
		true
	},
	ship_mod_exp_to_attr_tip = {
		88429,
		132,
		true
	},
	ship_max_star = {
		88561,
		131,
		true
	},
	ship_skill_unlock_tip = {
		88692,
		103,
		true
	},
	ship_lock_tip = {
		88795,
		124,
		true
	},
	ship_destroy_uncommon_tip = {
		88919,
		170,
		true
	},
	ship_destroy_advanced_tip = {
		89089,
		148,
		true
	},
	ship_energy_mid_desc = {
		89237,
		132,
		true
	},
	ship_energy_low_desc = {
		89369,
		149,
		true
	},
	ship_energy_low_warn = {
		89518,
		164,
		true
	},
	ship_energy_low_warn_no_exp = {
		89682,
		256,
		true
	},
	test_ship_intensify_tip = {
		89938,
		111,
		true
	},
	test_ship_upgrade_tip = {
		90049,
		109,
		true
	},
	shop_buyItem_ok = {
		90158,
		131,
		true
	},
	shop_buyItem_error = {
		90289,
		95,
		true
	},
	shop_extendMagazine_error = {
		90384,
		111,
		true
	},
	shop_entendShipYard_error = {
		90495,
		108,
		true
	},
	spweapon_attr_effect = {
		90603,
		96,
		true
	},
	spweapon_attr_skillupgrade = {
		90699,
		102,
		true
	},
	spweapon_help_storage = {
		90801,
		1757,
		true
	},
	spweapon_tip_upgrade = {
		92558,
		114,
		true
	},
	spweapon_tip_attr_modify = {
		92672,
		168,
		true
	},
	spweapon_tip_materal_no_enough = {
		92840,
		106,
		true
	},
	spweapon_tip_gold_no_enough = {
		92946,
		103,
		true
	},
	spweapon_tip_pt_no_enough = {
		93049,
		138,
		true
	},
	spweapon_tip_creatept_no_enough = {
		93187,
		144,
		true
	},
	spweapon_tip_bag_no_enough = {
		93331,
		120,
		true
	},
	spweapon_tip_create_sussess = {
		93451,
		139,
		true
	},
	spweapon_tip_group_error = {
		93590,
		124,
		true
	},
	spweapon_tip_breakout_overflow = {
		93714,
		165,
		true
	},
	spweapon_tip_breakout_materal_check = {
		93879,
		142,
		true
	},
	spweapon_tip_transform_materal_check = {
		94021,
		143,
		true
	},
	spweapon_tip_transform_attrmax = {
		94164,
		124,
		true
	},
	spweapon_tip_locked = {
		94288,
		158,
		true
	},
	spweapon_tip_unload = {
		94446,
		116,
		true
	},
	spweapon_tip_sail_locked = {
		94562,
		137,
		true
	},
	spweapon_ui_level = {
		94699,
		93,
		true
	},
	spweapon_ui_levelmax = {
		94792,
		102,
		true
	},
	spweapon_ui_levelmax2 = {
		94894,
		106,
		true
	},
	spweapon_ui_need_resource = {
		95000,
		102,
		true
	},
	spweapon_ui_ptitem = {
		95102,
		91,
		true
	},
	spweapon_ui_spweapon = {
		95193,
		96,
		true
	},
	spweapon_ui_transform = {
		95289,
		91,
		true
	},
	spweapon_ui_transform_attr_text = {
		95380,
		241,
		true
	},
	spweapon_ui_keep_attr = {
		95621,
		97,
		true
	},
	spweapon_ui_change_attr = {
		95718,
		99,
		true
	},
	spweapon_ui_autoselect = {
		95817,
		98,
		true
	},
	spweapon_ui_cancelselect = {
		95915,
		100,
		true
	},
	spweapon_ui_index_shipType_quZhu = {
		96015,
		102,
		true
	},
	spweapon_ui_index_shipType_qinXun = {
		96117,
		103,
		true
	},
	spweapon_ui_index_shipType_zhongXun = {
		96220,
		105,
		true
	},
	spweapon_ui_index_shipType_zhanLie = {
		96325,
		104,
		true
	},
	spweapon_ui_index_shipType_hangMu = {
		96429,
		103,
		true
	},
	spweapon_ui_index_shipType_weiXiu = {
		96532,
		103,
		true
	},
	spweapon_ui_index_shipType_qianTing = {
		96635,
		105,
		true
	},
	spweapon_ui_index_shipType_other = {
		96740,
		102,
		true
	},
	spweapon_ui_keep_attr_text1 = {
		96842,
		172,
		true
	},
	spweapon_ui_keep_attr_text2 = {
		97014,
		142,
		true
	},
	spweapon_ui_change_attr_text1 = {
		97156,
		199,
		true
	},
	spweapon_ui_change_attr_text2 = {
		97355,
		144,
		true
	},
	spweapon_ui_create_exp = {
		97499,
		105,
		true
	},
	spweapon_ui_upgrade_exp = {
		97604,
		106,
		true
	},
	spweapon_ui_breakout_exp = {
		97710,
		107,
		true
	},
	spweapon_ui_create = {
		97817,
		88,
		true
	},
	spweapon_ui_storage = {
		97905,
		89,
		true
	},
	spweapon_ui_empty = {
		97994,
		90,
		true
	},
	spweapon_ui_create_button = {
		98084,
		96,
		true
	},
	spweapon_ui_helptext = {
		98180,
		287,
		true
	},
	spweapon_ui_effect_tag = {
		98467,
		104,
		true
	},
	spweapon_ui_skill_tag = {
		98571,
		103,
		true
	},
	spweapon_activity_ui_text1 = {
		98674,
		165,
		true
	},
	spweapon_activity_ui_text2 = {
		98839,
		164,
		true
	},
	spweapon_tip_skill_locked = {
		99003,
		104,
		true
	},
	spweapon_tip_owned = {
		99107,
		96,
		true
	},
	spweapon_tip_view = {
		99203,
		145,
		true
	},
	spweapon_tip_ship = {
		99348,
		93,
		true
	},
	spweapon_tip_type = {
		99441,
		93,
		true
	},
	stage_beginStage_error = {
		99534,
		105,
		true
	},
	stage_beginStage_error_fleetEmpty = {
		99639,
		124,
		true
	},
	stage_beginStage_error_teamEmpty = {
		99763,
		171,
		true
	},
	stage_beginStage_error_noEnergy = {
		99934,
		135,
		true
	},
	stage_beginStage_error_noResource = {
		100069,
		136,
		true
	},
	stage_beginStage_error_noTicket = {
		100205,
		141,
		true
	},
	stage_finishStage_error = {
		100346,
		126,
		true
	},
	levelScene_map_lock = {
		100472,
		146,
		true
	},
	levelScene_chapter_lock = {
		100618,
		135,
		true
	},
	levelScene_chapter_strategying = {
		100753,
		142,
		true
	},
	levelScene_threat_to_rule_out = {
		100895,
		131,
		true
	},
	levelScene_whether_to_retreat = {
		101026,
		136,
		true
	},
	levelScene_who_to_retreat = {
		101162,
		131,
		true
	},
	levelScene_who_to_exchange = {
		101293,
		120,
		true
	},
	levelScene_time_out = {
		101413,
		104,
		true
	},
	levelScene_nothing = {
		101517,
		97,
		true
	},
	levelScene_notCargo = {
		101614,
		98,
		true
	},
	levelScene_openCargo_erro = {
		101712,
		107,
		true
	},
	levelScene_chapter_notInStrategy = {
		101819,
		111,
		true
	},
	levelScene_retreat_erro = {
		101930,
		99,
		true
	},
	levelScene_strategying = {
		102029,
		101,
		true
	},
	levelScene_tracking_erro = {
		102130,
		94,
		true
	},
	levelScene_tracking_error_3001 = {
		102224,
		143,
		true
	},
	levelScene_chapter_unlock_tip = {
		102367,
		161,
		true
	},
	levelScene_chapter_win = {
		102528,
		117,
		true
	},
	levelScene_sham_win = {
		102645,
		113,
		true
	},
	levelScene_escort_win = {
		102758,
		121,
		true
	},
	levelScene_escort_lose = {
		102879,
		116,
		true
	},
	levelScene_escort_help_tip = {
		102995,
		1133,
		true
	},
	levelScene_escort_retreat = {
		104128,
		184,
		true
	},
	levelScene_oni_retreat = {
		104312,
		163,
		true
	},
	levelScene_oni_win = {
		104475,
		106,
		true
	},
	levelScene_oni_lose = {
		104581,
		119,
		true
	},
	levelScene_bomb_retreat = {
		104700,
		148,
		true
	},
	levelScene_sphunt_help_tip = {
		104848,
		497,
		true
	},
	levelScene_bomb_help_tip = {
		105345,
		495,
		true
	},
	levelScene_chapter_timeout = {
		105840,
		130,
		true
	},
	levelScene_chapter_level_limit = {
		105970,
		162,
		true
	},
	levelScene_chapter_count_tip = {
		106132,
		107,
		true
	},
	levelScene_tracking_error_retry = {
		106239,
		125,
		true
	},
	levelScene_destroy_torpedo = {
		106364,
		108,
		true
	},
	levelScene_new_chapter_coming = {
		106472,
		108,
		true
	},
	levelScene_chapter_open_count_down = {
		106580,
		113,
		true
	},
	levelScene_chapter_not_open = {
		106693,
		100,
		true
	},
	levelScene_activate_remaster = {
		106793,
		179,
		true
	},
	levelScene_remaster_tickets_not_enough = {
		106972,
		123,
		true
	},
	levelScene_remaster_do_not_open = {
		107095,
		132,
		true
	},
	levelScene_remaster_help_tip = {
		107227,
		1110,
		true
	},
	levelScene_activate_loop_mode_failed = {
		108337,
		153,
		true
	},
	levelScene_coastalgun_help_tip = {
		108490,
		355,
		true
	},
	levelScene_select_SP_OP = {
		108845,
		111,
		true
	},
	levelScene_unselect_SP_OP = {
		108956,
		110,
		true
	},
	levelScene_select_SP_OP_reminder = {
		109066,
		337,
		true
	},
	tack_tickets_max_warning = {
		109403,
		266,
		true
	},
	world_battle_count = {
		109669,
		112,
		true
	},
	world_fleetName1 = {
		109781,
		95,
		true
	},
	world_fleetName2 = {
		109876,
		95,
		true
	},
	world_fleetName3 = {
		109971,
		95,
		true
	},
	world_fleetName4 = {
		110066,
		95,
		true
	},
	world_fleetName5 = {
		110161,
		95,
		true
	},
	world_ship_repair_1 = {
		110256,
		147,
		true
	},
	world_ship_repair_2 = {
		110403,
		147,
		true
	},
	world_ship_repair_all = {
		110550,
		153,
		true
	},
	world_ship_repair_no_need = {
		110703,
		113,
		true
	},
	world_event_teleport_alter = {
		110816,
		154,
		true
	},
	world_transport_battle_alter = {
		110970,
		153,
		true
	},
	world_transport_locked = {
		111123,
		165,
		true
	},
	world_target_count = {
		111288,
		114,
		true
	},
	world_target_filter_tip1 = {
		111402,
		94,
		true
	},
	world_target_filter_tip2 = {
		111496,
		97,
		true
	},
	world_target_get_all = {
		111593,
		130,
		true
	},
	world_target_goto = {
		111723,
		93,
		true
	},
	world_help_tip = {
		111816,
		136,
		true
	},
	world_dangerbattle_confirm = {
		111952,
		185,
		true
	},
	world_stamina_exchange = {
		112137,
		168,
		true
	},
	world_stamina_not_enough = {
		112305,
		103,
		true
	},
	world_stamina_recover = {
		112408,
		191,
		true
	},
	world_stamina_text = {
		112599,
		210,
		true
	},
	world_stamina_text2 = {
		112809,
		161,
		true
	},
	world_stamina_resetwarning = {
		112970,
		266,
		true
	},
	world_ship_healthy = {
		113236,
		128,
		true
	},
	world_map_dangerous = {
		113364,
		95,
		true
	},
	world_map_not_open = {
		113459,
		100,
		true
	},
	world_map_locked_stage = {
		113559,
		104,
		true
	},
	world_map_locked_border = {
		113663,
		108,
		true
	},
	world_item_allocate_panel_fleet_info_text = {
		113771,
		117,
		true
	},
	world_redeploy_not_change = {
		113888,
		156,
		true
	},
	world_redeploy_warn = {
		114044,
		168,
		true
	},
	world_redeploy_cost_tip = {
		114212,
		228,
		true
	},
	world_redeploy_tip = {
		114440,
		103,
		true
	},
	world_fleet_choose = {
		114543,
		169,
		true
	},
	world_fleet_formation_not_valid = {
		114712,
		109,
		true
	},
	world_fleet_in_vortex = {
		114821,
		149,
		true
	},
	world_stage_help = {
		114970,
		218,
		true
	},
	world_transport_disable = {
		115188,
		148,
		true
	},
	world_ap = {
		115336,
		81,
		true
	},
	world_resource_tip_1 = {
		115417,
		111,
		true
	},
	world_resource_tip_2 = {
		115528,
		111,
		true
	},
	world_instruction_all_1 = {
		115639,
		105,
		true
	},
	world_instruction_help_1 = {
		115744,
		620,
		true
	},
	world_instruction_redeploy_1 = {
		116364,
		159,
		true
	},
	world_instruction_redeploy_2 = {
		116523,
		159,
		true
	},
	world_instruction_redeploy_3 = {
		116682,
		177,
		true
	},
	world_instruction_morale_1 = {
		116859,
		181,
		true
	},
	world_instruction_morale_2 = {
		117040,
		139,
		true
	},
	world_instruction_morale_3 = {
		117179,
		123,
		true
	},
	world_instruction_morale_4 = {
		117302,
		139,
		true
	},
	world_instruction_submarine_1 = {
		117441,
		126,
		true
	},
	world_instruction_submarine_2 = {
		117567,
		157,
		true
	},
	world_instruction_submarine_3 = {
		117724,
		130,
		true
	},
	world_instruction_submarine_4 = {
		117854,
		139,
		true
	},
	world_instruction_submarine_5 = {
		117993,
		114,
		true
	},
	world_instruction_submarine_6 = {
		118107,
		181,
		true
	},
	world_instruction_submarine_7 = {
		118288,
		166,
		true
	},
	world_instruction_submarine_8 = {
		118454,
		145,
		true
	},
	world_instruction_submarine_9 = {
		118599,
		164,
		true
	},
	world_instruction_submarine_10 = {
		118763,
		106,
		true
	},
	world_instruction_submarine_11 = {
		118869,
		131,
		true
	},
	world_instruction_detect_1 = {
		119000,
		154,
		true
	},
	world_instruction_detect_2 = {
		119154,
		117,
		true
	},
	world_instruction_supply_1 = {
		119271,
		174,
		true
	},
	world_instruction_supply_2 = {
		119445,
		122,
		true
	},
	world_instruction_port_goods_locked = {
		119567,
		123,
		true
	},
	world_port_inbattle = {
		119690,
		132,
		true
	},
	world_item_recycle_1 = {
		119822,
		111,
		true
	},
	world_item_recycle_2 = {
		119933,
		111,
		true
	},
	world_item_origin = {
		120044,
		114,
		true
	},
	world_shop_bag_unactivated = {
		120158,
		160,
		true
	},
	world_shop_preview_tip = {
		120318,
		116,
		true
	},
	world_shop_init_notice = {
		120434,
		147,
		true
	},
	world_map_title_tips_en = {
		120581,
		101,
		true
	},
	world_map_title_tips = {
		120682,
		96,
		true
	},
	world_mapbuff_attrtxt_1 = {
		120778,
		99,
		true
	},
	world_mapbuff_attrtxt_2 = {
		120877,
		99,
		true
	},
	world_mapbuff_attrtxt_3 = {
		120976,
		99,
		true
	},
	world_mapbuff_compare_txt = {
		121075,
		104,
		true
	},
	world_wind_move = {
		121179,
		155,
		true
	},
	world_battle_pause = {
		121334,
		91,
		true
	},
	world_battle_pause2 = {
		121425,
		95,
		true
	},
	world_task_samemap = {
		121520,
		146,
		true
	},
	world_task_maplock = {
		121666,
		217,
		true
	},
	world_task_goto0 = {
		121883,
		116,
		true
	},
	world_task_goto3 = {
		121999,
		113,
		true
	},
	world_task_view1 = {
		122112,
		95,
		true
	},
	world_task_view2 = {
		122207,
		95,
		true
	},
	world_task_view3 = {
		122302,
		86,
		true
	},
	world_task_refuse1 = {
		122388,
		152,
		true
	},
	world_daily_task_lock = {
		122540,
		131,
		true
	},
	world_daily_task_none = {
		122671,
		127,
		true
	},
	world_daily_task_none_2 = {
		122798,
		118,
		true
	},
	world_sairen_title = {
		122916,
		97,
		true
	},
	world_sairen_description1 = {
		123013,
		146,
		true
	},
	world_sairen_description2 = {
		123159,
		146,
		true
	},
	world_sairen_description3 = {
		123305,
		146,
		true
	},
	world_low_morale = {
		123451,
		196,
		true
	},
	world_recycle_notice = {
		123647,
		154,
		true
	},
	world_recycle_item_transform = {
		123801,
		192,
		true
	},
	world_exit_tip = {
		123993,
		114,
		true
	},
	world_consume_carry_tips = {
		124107,
		100,
		true
	},
	world_boss_help_meta = {
		124207,
		2939,
		true
	},
	world_close = {
		127146,
		123,
		true
	},
	world_catsearch_success = {
		127269,
		133,
		true
	},
	world_catsearch_stop = {
		127402,
		133,
		true
	},
	world_catsearch_fleetcheck = {
		127535,
		185,
		true
	},
	world_catsearch_leavemap = {
		127720,
		189,
		true
	},
	world_catsearch_help_1 = {
		127909,
		283,
		true
	},
	world_catsearch_help_2 = {
		128192,
		104,
		true
	},
	world_catsearch_help_3 = {
		128296,
		278,
		true
	},
	world_catsearch_help_4 = {
		128574,
		98,
		true
	},
	world_catsearch_help_5 = {
		128672,
		147,
		true
	},
	world_catsearch_help_6 = {
		128819,
		128,
		true
	},
	world_level_prefix = {
		128947,
		93,
		true
	},
	world_map_level = {
		129040,
		218,
		true
	},
	world_movelimit_event_text = {
		129258,
		170,
		true
	},
	world_mapbuff_tip = {
		129428,
		120,
		true
	},
	world_sametask_tip = {
		129548,
		143,
		true
	},
	world_expedition_reward_display = {
		129691,
		107,
		true
	},
	world_expedition_reward_display2 = {
		129798,
		102,
		true
	},
	world_complete_item_tip = {
		129900,
		145,
		true
	},
	task_notfound_error = {
		130045,
		141,
		true
	},
	task_submitTask_error = {
		130186,
		104,
		true
	},
	task_submitTask_error_client = {
		130290,
		110,
		true
	},
	task_submitTask_error_notFinish = {
		130400,
		116,
		true
	},
	task_taskMediator_getItem = {
		130516,
		164,
		true
	},
	task_taskMediator_getResource = {
		130680,
		168,
		true
	},
	task_taskMediator_getEquip = {
		130848,
		165,
		true
	},
	task_target_chapter_in_progress = {
		131013,
		153,
		true
	},
	task_level_notenough = {
		131166,
		119,
		true
	},
	loading_tip_ShaderMgr = {
		131285,
		106,
		true
	},
	loading_tip_FontMgr = {
		131391,
		104,
		true
	},
	loading_tip_TipsMgr = {
		131495,
		107,
		true
	},
	loading_tip_MsgboxMgr = {
		131602,
		109,
		true
	},
	loading_tip_GuideMgr = {
		131711,
		108,
		true
	},
	loading_tip_PoolMgr = {
		131819,
		104,
		true
	},
	loading_tip_FModMgr = {
		131923,
		104,
		true
	},
	loading_tip_StoryMgr = {
		132027,
		105,
		true
	},
	energy_desc_happy = {
		132132,
		133,
		true
	},
	energy_desc_normal = {
		132265,
		127,
		true
	},
	energy_desc_tired = {
		132392,
		130,
		true
	},
	energy_desc_angry = {
		132522,
		130,
		true
	},
	create_player_success = {
		132652,
		103,
		true
	},
	login_newPlayerScene_invalideName = {
		132755,
		127,
		true
	},
	login_newPlayerScene_name_tooShort = {
		132882,
		110,
		true
	},
	login_newPlayerScene_name_existOtherChar = {
		132992,
		171,
		true
	},
	login_newPlayerScene_name_tooLong = {
		133163,
		109,
		true
	},
	equipment_updateGrade_tip = {
		133272,
		153,
		true
	},
	equipment_upgrade_ok = {
		133425,
		102,
		true
	},
	equipment_cant_upgrade = {
		133527,
		104,
		true
	},
	equipment_upgrade_erro = {
		133631,
		104,
		true
	},
	collection_nostar = {
		133735,
		99,
		true
	},
	collection_getResource_error = {
		133834,
		111,
		true
	},
	collection_hadAward = {
		133945,
		98,
		true
	},
	collection_lock = {
		134043,
		91,
		true
	},
	collection_fetched = {
		134134,
		100,
		true
	},
	buyProp_noResource_error = {
		134234,
		119,
		true
	},
	refresh_shopStreet_ok = {
		134353,
		103,
		true
	},
	refresh_shopStreet_erro = {
		134456,
		105,
		true
	},
	shopStreet_upgrade_done = {
		134561,
		108,
		true
	},
	shopStreet_refresh_max_count = {
		134669,
		125,
		true
	},
	buy_countLimit = {
		134794,
		105,
		true
	},
	buy_item_quest = {
		134899,
		102,
		true
	},
	refresh_shopStreet_question = {
		135001,
		237,
		true
	},
	quota_shop_title = {
		135238,
		106,
		true
	},
	quota_shop_description = {
		135344,
		176,
		true
	},
	quota_shop_owned = {
		135520,
		92,
		true
	},
	quota_shop_good_limit = {
		135612,
		97,
		true
	},
	quota_shop_limit_error = {
		135709,
		135,
		true
	},
	event_start_success = {
		135844,
		101,
		true
	},
	event_start_fail = {
		135945,
		98,
		true
	},
	event_finish_success = {
		136043,
		102,
		true
	},
	event_finish_fail = {
		136145,
		99,
		true
	},
	event_giveup_success = {
		136244,
		102,
		true
	},
	event_giveup_fail = {
		136346,
		99,
		true
	},
	event_flush_success = {
		136445,
		101,
		true
	},
	event_flush_fail = {
		136546,
		98,
		true
	},
	event_flush_not_enough = {
		136644,
		110,
		true
	},
	event_start = {
		136754,
		87,
		true
	},
	event_finish = {
		136841,
		88,
		true
	},
	event_giveup = {
		136929,
		88,
		true
	},
	event_minimus_ship_numbers = {
		137017,
		173,
		true
	},
	event_confirm_giveup = {
		137190,
		105,
		true
	},
	event_confirm_flush = {
		137295,
		135,
		true
	},
	event_fleet_busy = {
		137430,
		138,
		true
	},
	event_same_type_not_allowed = {
		137568,
		124,
		true
	},
	event_condition_ship_level = {
		137692,
		164,
		true
	},
	event_condition_ship_count = {
		137856,
		134,
		true
	},
	event_condition_ship_type = {
		137990,
		120,
		true
	},
	event_level_unreached = {
		138110,
		103,
		true
	},
	event_type_unreached = {
		138213,
		117,
		true
	},
	event_oil_consume = {
		138330,
		165,
		true
	},
	event_type_unlimit = {
		138495,
		94,
		true
	},
	dailyLevel_restCount_notEnough = {
		138589,
		127,
		true
	},
	dailyLevel_unopened = {
		138716,
		95,
		true
	},
	dailyLevel_opened = {
		138811,
		87,
		true
	},
	playerinfo_ship_is_already_flagship = {
		138898,
		123,
		true
	},
	playerinfo_mask_word = {
		139021,
		99,
		true
	},
	just_now = {
		139120,
		78,
		true
	},
	several_minutes_before = {
		139198,
		120,
		true
	},
	several_hours_before = {
		139318,
		118,
		true
	},
	several_days_before = {
		139436,
		114,
		true
	},
	long_time_offline = {
		139550,
		96,
		true
	},
	dont_send_message_frequently = {
		139646,
		116,
		true
	},
	no_activity = {
		139762,
		105,
		true
	},
	which_day = {
		139867,
		104,
		true
	},
	which_day_2 = {
		139971,
		83,
		true
	},
	invalidate_evaluation = {
		140054,
		115,
		true
	},
	chapter_no = {
		140169,
		105,
		true
	},
	reconnect_tip = {
		140274,
		127,
		true
	},
	like_ship_success = {
		140401,
		93,
		true
	},
	eva_ship_success = {
		140494,
		92,
		true
	},
	zan_ship_eva_success = {
		140586,
		96,
		true
	},
	zan_ship_eva_error_7 = {
		140682,
		115,
		true
	},
	eva_count_limit = {
		140797,
		112,
		true
	},
	attribute_durability = {
		140909,
		90,
		true
	},
	attribute_cannon = {
		140999,
		86,
		true
	},
	attribute_torpedo = {
		141085,
		87,
		true
	},
	attribute_antiaircraft = {
		141172,
		92,
		true
	},
	attribute_air = {
		141264,
		83,
		true
	},
	attribute_reload = {
		141347,
		86,
		true
	},
	attribute_cd = {
		141433,
		82,
		true
	},
	attribute_armor_type = {
		141515,
		96,
		true
	},
	attribute_armor = {
		141611,
		85,
		true
	},
	attribute_hit = {
		141696,
		83,
		true
	},
	attribute_speed = {
		141779,
		85,
		true
	},
	attribute_luck = {
		141864,
		84,
		true
	},
	attribute_dodge = {
		141948,
		85,
		true
	},
	attribute_expend = {
		142033,
		86,
		true
	},
	attribute_damage = {
		142119,
		86,
		true
	},
	attribute_healthy = {
		142205,
		87,
		true
	},
	attribute_speciality = {
		142292,
		90,
		true
	},
	attribute_range = {
		142382,
		85,
		true
	},
	attribute_angle = {
		142467,
		85,
		true
	},
	attribute_scatter = {
		142552,
		93,
		true
	},
	attribute_ammo = {
		142645,
		84,
		true
	},
	attribute_antisub = {
		142729,
		87,
		true
	},
	attribute_sonarRange = {
		142816,
		102,
		true
	},
	attribute_sonarInterval = {
		142918,
		99,
		true
	},
	attribute_oxy_max = {
		143017,
		87,
		true
	},
	attribute_dodge_limit = {
		143104,
		97,
		true
	},
	attribute_intimacy = {
		143201,
		91,
		true
	},
	attribute_max_distance_damage = {
		143292,
		105,
		true
	},
	attribute_anti_siren = {
		143397,
		108,
		true
	},
	attribute_add_new = {
		143505,
		85,
		true
	},
	skill = {
		143590,
		75,
		true
	},
	cd_normal = {
		143665,
		85,
		true
	},
	intensify = {
		143750,
		79,
		true
	},
	change = {
		143829,
		76,
		true
	},
	formation_switch_failed = {
		143905,
		114,
		true
	},
	formation_switch_success = {
		144019,
		102,
		true
	},
	formation_switch_tip = {
		144121,
		161,
		true
	},
	formation_reform_tip = {
		144282,
		133,
		true
	},
	formation_invalide = {
		144415,
		112,
		true
	},
	chapter_ap_not_enough = {
		144527,
		93,
		true
	},
	formation_forbid_when_in_chapter = {
		144620,
		139,
		true
	},
	military_forbid_when_in_chapter = {
		144759,
		138,
		true
	},
	confirm_app_exit = {
		144897,
		101,
		true
	},
	friend_info_page_tip = {
		144998,
		117,
		true
	},
	friend_search_page_tip = {
		145115,
		133,
		true
	},
	friend_request_page_tip = {
		145248,
		134,
		true
	},
	friend_id_copy_ok = {
		145382,
		93,
		true
	},
	friend_inpout_key_tip = {
		145475,
		103,
		true
	},
	remove_friend_tip = {
		145578,
		106,
		true
	},
	friend_request_msg_placeholder = {
		145684,
		112,
		true
	},
	friend_request_msg_title = {
		145796,
		115,
		true
	},
	friend_max_count = {
		145911,
		134,
		true
	},
	friend_add_ok = {
		146045,
		95,
		true
	},
	friend_max_count_1 = {
		146140,
		106,
		true
	},
	friend_no_request = {
		146246,
		99,
		true
	},
	reject_all_friend_ok = {
		146345,
		111,
		true
	},
	reject_friend_ok = {
		146456,
		104,
		true
	},
	friend_offline = {
		146560,
		93,
		true
	},
	friend_msg_forbid = {
		146653,
		141,
		true
	},
	dont_add_self = {
		146794,
		95,
		true
	},
	friend_already_add = {
		146889,
		112,
		true
	},
	friend_not_add = {
		147001,
		105,
		true
	},
	friend_send_msg_erro_tip = {
		147106,
		124,
		true
	},
	friend_send_msg_null_tip = {
		147230,
		109,
		true
	},
	friend_search_succeed = {
		147339,
		97,
		true
	},
	friend_request_msg_sent = {
		147436,
		105,
		true
	},
	friend_resume_ship_count = {
		147541,
		101,
		true
	},
	friend_resume_title_metal = {
		147642,
		102,
		true
	},
	friend_resume_collection_rate = {
		147744,
		103,
		true
	},
	friend_resume_attack_count = {
		147847,
		103,
		true
	},
	friend_resume_attack_win_rate = {
		147950,
		106,
		true
	},
	friend_resume_manoeuvre_count = {
		148056,
		106,
		true
	},
	friend_resume_manoeuvre_win_rate = {
		148162,
		109,
		true
	},
	friend_resume_fleet_gs = {
		148271,
		99,
		true
	},
	friend_event_count = {
		148370,
		95,
		true
	},
	firend_relieve_blacklist_ok = {
		148465,
		103,
		true
	},
	firend_relieve_blacklist_tip = {
		148568,
		131,
		true
	},
	word_shipNation_all = {
		148699,
		92,
		true
	},
	word_shipNation_baiYing = {
		148791,
		93,
		true
	},
	word_shipNation_huangJia = {
		148884,
		94,
		true
	},
	word_shipNation_chongYing = {
		148978,
		95,
		true
	},
	word_shipNation_tieXue = {
		149073,
		92,
		true
	},
	word_shipNation_dongHuang = {
		149165,
		95,
		true
	},
	word_shipNation_saDing = {
		149260,
		98,
		true
	},
	word_shipNation_beiLian = {
		149358,
		99,
		true
	},
	word_shipNation_other = {
		149457,
		91,
		true
	},
	word_shipNation_np = {
		149548,
		91,
		true
	},
	word_shipNation_ziyou = {
		149639,
		97,
		true
	},
	word_shipNation_weixi = {
		149736,
		97,
		true
	},
	word_shipNation_yuanwei = {
		149833,
		99,
		true
	},
	word_shipNation_bili = {
		149932,
		96,
		true
	},
	word_shipNation_um = {
		150028,
		94,
		true
	},
	word_shipNation_ai = {
		150122,
		90,
		true
	},
	word_shipNation_holo = {
		150212,
		92,
		true
	},
	word_shipNation_doa = {
		150304,
		98,
		true
	},
	word_shipNation_imas = {
		150402,
		96,
		true
	},
	word_shipNation_link = {
		150498,
		90,
		true
	},
	word_shipNation_ssss = {
		150588,
		88,
		true
	},
	word_shipNation_mot = {
		150676,
		89,
		true
	},
	word_shipNation_ryza = {
		150765,
		96,
		true
	},
	word_shipNation_meta_index = {
		150861,
		94,
		true
	},
	word_shipNation_senran = {
		150955,
		98,
		true
	},
	word_reset = {
		151053,
		80,
		true
	},
	word_asc = {
		151133,
		78,
		true
	},
	word_desc = {
		151211,
		79,
		true
	},
	word_own = {
		151290,
		81,
		true
	},
	word_own1 = {
		151371,
		82,
		true
	},
	oil_buy_limit_tip = {
		151453,
		155,
		true
	},
	friend_resume_title = {
		151608,
		89,
		true
	},
	friend_resume_data_title = {
		151697,
		94,
		true
	},
	batch_destroy = {
		151791,
		89,
		true
	},
	equipment_select_device_destroy_tip = {
		151880,
		127,
		true
	},
	equipment_select_device_destroy_bonus_tip = {
		152007,
		124,
		true
	},
	equipment_select_device_destroy_nobonus_tip = {
		152131,
		125,
		true
	},
	ship_equip_profiiency = {
		152256,
		95,
		true
	},
	no_open_system_tip = {
		152351,
		172,
		true
	},
	open_system_tip = {
		152523,
		99,
		true
	},
	charge_start_tip = {
		152622,
		109,
		true
	},
	charge_double_gem_tip = {
		152731,
		111,
		true
	},
	charge_month_card_lefttime_tip = {
		152842,
		120,
		true
	},
	charge_title = {
		152962,
		100,
		true
	},
	charge_extra_gem_tip = {
		153062,
		104,
		true
	},
	charge_month_card_title = {
		153166,
		145,
		true
	},
	charge_items_title = {
		153311,
		100,
		true
	},
	setting_interface_save_success = {
		153411,
		112,
		true
	},
	setting_interface_revert_check = {
		153523,
		143,
		true
	},
	setting_interface_cancel_check = {
		153666,
		127,
		true
	},
	event_special_update = {
		153793,
		110,
		true
	},
	no_notice_tip = {
		153903,
		104,
		true
	},
	energy_desc_1 = {
		154007,
		162,
		true
	},
	energy_desc_2 = {
		154169,
		137,
		true
	},
	energy_desc_3 = {
		154306,
		116,
		true
	},
	energy_desc_4 = {
		154422,
		163,
		true
	},
	intimacy_desc_1 = {
		154585,
		102,
		true
	},
	intimacy_desc_2 = {
		154687,
		108,
		true
	},
	intimacy_desc_3 = {
		154795,
		117,
		true
	},
	intimacy_desc_4 = {
		154912,
		117,
		true
	},
	intimacy_desc_5 = {
		155029,
		114,
		true
	},
	intimacy_desc_6 = {
		155143,
		117,
		true
	},
	intimacy_desc_7 = {
		155260,
		117,
		true
	},
	intimacy_desc_1_buff = {
		155377,
		108,
		true
	},
	intimacy_desc_2_buff = {
		155485,
		108,
		true
	},
	intimacy_desc_3_buff = {
		155593,
		153,
		true
	},
	intimacy_desc_4_buff = {
		155746,
		153,
		true
	},
	intimacy_desc_5_buff = {
		155899,
		153,
		true
	},
	intimacy_desc_6_buff = {
		156052,
		153,
		true
	},
	intimacy_desc_7_buff = {
		156205,
		154,
		true
	},
	intimacy_desc_propose = {
		156359,
		327,
		true
	},
	intimacy_desc_1_detail = {
		156686,
		161,
		true
	},
	intimacy_desc_2_detail = {
		156847,
		167,
		true
	},
	intimacy_desc_3_detail = {
		157014,
		206,
		true
	},
	intimacy_desc_4_detail = {
		157220,
		206,
		true
	},
	intimacy_desc_5_detail = {
		157426,
		203,
		true
	},
	intimacy_desc_6_detail = {
		157629,
		328,
		true
	},
	intimacy_desc_7_detail = {
		157957,
		328,
		true
	},
	intimacy_desc_ring = {
		158285,
		106,
		true
	},
	intimacy_desc_tiara = {
		158391,
		107,
		true
	},
	intimacy_desc_day = {
		158498,
		90,
		true
	},
	word_propose_cost_tip1 = {
		158588,
		306,
		true
	},
	word_propose_cost_tip2 = {
		158894,
		271,
		true
	},
	word_propose_tiara_tip = {
		159165,
		113,
		true
	},
	charge_title_getitem = {
		159278,
		111,
		true
	},
	charge_title_getitem_soon = {
		159389,
		113,
		true
	},
	charge_title_getitem_month = {
		159502,
		122,
		true
	},
	charge_limit_all = {
		159624,
		103,
		true
	},
	charge_limit_daily = {
		159727,
		108,
		true
	},
	charge_limit_weekly = {
		159835,
		109,
		true
	},
	charge_limit_monthly = {
		159944,
		110,
		true
	},
	charge_error = {
		160054,
		91,
		true
	},
	charge_success = {
		160145,
		90,
		true
	},
	charge_level_limit = {
		160235,
		97,
		true
	},
	ship_drop_desc_default = {
		160332,
		104,
		true
	},
	charge_limit_lv = {
		160436,
		90,
		true
	},
	charge_time_out = {
		160526,
		137,
		true
	},
	help_shipinfo_equip = {
		160663,
		628,
		true
	},
	help_shipinfo_detail = {
		161291,
		679,
		true
	},
	help_shipinfo_intensify = {
		161970,
		632,
		true
	},
	help_shipinfo_upgrate = {
		162602,
		630,
		true
	},
	help_shipinfo_maxlevel = {
		163232,
		631,
		true
	},
	help_shipinfo_actnpc = {
		163863,
		987,
		true
	},
	help_backyard = {
		164850,
		622,
		true
	},
	help_shipinfo_fashion = {
		165472,
		183,
		true
	},
	help_shipinfo_attr = {
		165655,
		3460,
		true
	},
	help_equipment = {
		169115,
		1982,
		true
	},
	help_equipment_skin = {
		171097,
		427,
		true
	},
	help_daily_task = {
		171524,
		2812,
		true
	},
	help_build = {
		174336,
		300,
		true
	},
	help_build_1 = {
		174636,
		302,
		true
	},
	help_build_2 = {
		174938,
		302,
		true
	},
	help_build_4 = {
		175240,
		752,
		true
	},
	help_build_5 = {
		175992,
		681,
		true
	},
	help_shipinfo_hunting = {
		176673,
		711,
		true
	},
	shop_extendship_success = {
		177384,
		105,
		true
	},
	shop_extendequip_success = {
		177489,
		112,
		true
	},
	shop_spweapon_success = {
		177601,
		115,
		true
	},
	naval_academy_res_desc_cateen = {
		177716,
		228,
		true
	},
	naval_academy_res_desc_shop = {
		177944,
		220,
		true
	},
	naval_academy_res_desc_class = {
		178164,
		272,
		true
	},
	number_1 = {
		178436,
		75,
		true
	},
	number_2 = {
		178511,
		75,
		true
	},
	number_3 = {
		178586,
		75,
		true
	},
	number_4 = {
		178661,
		75,
		true
	},
	number_5 = {
		178736,
		75,
		true
	},
	number_6 = {
		178811,
		75,
		true
	},
	number_7 = {
		178886,
		75,
		true
	},
	number_8 = {
		178961,
		75,
		true
	},
	number_9 = {
		179036,
		75,
		true
	},
	number_10 = {
		179111,
		76,
		true
	},
	military_shop_no_open_tip = {
		179187,
		189,
		true
	},
	switch_to_shop_tip_1 = {
		179376,
		133,
		true
	},
	switch_to_shop_tip_2 = {
		179509,
		122,
		true
	},
	switch_to_shop_tip_3 = {
		179631,
		116,
		true
	},
	switch_to_shop_tip_noPos = {
		179747,
		127,
		true
	},
	text_noPos_clear = {
		179874,
		86,
		true
	},
	text_noPos_buy = {
		179960,
		84,
		true
	},
	text_noPos_intensify = {
		180044,
		90,
		true
	},
	switch_to_shop_tip_noDockyard = {
		180134,
		133,
		true
	},
	commission_no_open = {
		180267,
		91,
		true
	},
	commission_open_tip = {
		180358,
		103,
		true
	},
	commission_idle = {
		180461,
		91,
		true
	},
	commission_urgency = {
		180552,
		95,
		true
	},
	commission_normal = {
		180647,
		94,
		true
	},
	commission_get_award = {
		180741,
		104,
		true
	},
	activity_build_end_tip = {
		180845,
		119,
		true
	},
	event_over_time_expired = {
		180964,
		102,
		true
	},
	mail_sender_default = {
		181066,
		92,
		true
	},
	exchangecode_title = {
		181158,
		97,
		true
	},
	exchangecode_use_placeholder = {
		181255,
		116,
		true
	},
	exchangecode_use_ok = {
		181371,
		150,
		true
	},
	exchangecode_use_error = {
		181521,
		101,
		true
	},
	exchangecode_use_error_3 = {
		181622,
		106,
		true
	},
	exchangecode_use_error_6 = {
		181728,
		106,
		true
	},
	exchangecode_use_error_7 = {
		181834,
		115,
		true
	},
	exchangecode_use_error_8 = {
		181949,
		106,
		true
	},
	exchangecode_use_error_9 = {
		182055,
		106,
		true
	},
	exchangecode_use_error_16 = {
		182161,
		104,
		true
	},
	exchangecode_use_error_20 = {
		182265,
		107,
		true
	},
	text_noRes_tip = {
		182372,
		90,
		true
	},
	text_noRes_info_tip = {
		182462,
		110,
		true
	},
	text_noRes_info_tip_link = {
		182572,
		91,
		true
	},
	text_noRes_info_tip2 = {
		182663,
		138,
		true
	},
	text_shop_noRes_tip = {
		182801,
		109,
		true
	},
	text_shop_enoughRes_tip = {
		182910,
		133,
		true
	},
	text_buy_fashion_tip = {
		183043,
		166,
		true
	},
	equip_part_title = {
		183209,
		86,
		true
	},
	equip_part_main_title = {
		183295,
		99,
		true
	},
	equip_part_sub_title = {
		183394,
		98,
		true
	},
	equipment_upgrade_overlimit = {
		183492,
		112,
		true
	},
	err_name_existOtherChar = {
		183604,
		123,
		true
	},
	help_battle_rule = {
		183727,
		511,
		true
	},
	help_battle_warspite = {
		184238,
		300,
		true
	},
	help_battle_defense = {
		184538,
		588,
		true
	},
	backyard_theme_set_tip = {
		185126,
		145,
		true
	},
	backyard_theme_save_tip = {
		185271,
		159,
		true
	},
	backyard_theme_defaultname = {
		185430,
		105,
		true
	},
	backyard_rename_success = {
		185535,
		105,
		true
	},
	ship_set_skin_success = {
		185640,
		103,
		true
	},
	ship_set_skin_error = {
		185743,
		102,
		true
	},
	equip_part_tip = {
		185845,
		103,
		true
	},
	help_battle_auto = {
		185948,
		359,
		true
	},
	gold_buy_tip = {
		186307,
		249,
		true
	},
	oil_buy_tip = {
		186556,
		386,
		true
	},
	text_iknow = {
		186942,
		86,
		true
	},
	help_oil_buy_limit = {
		187028,
		322,
		true
	},
	text_nofood_yes = {
		187350,
		85,
		true
	},
	text_nofood_no = {
		187435,
		84,
		true
	},
	tip_add_task = {
		187519,
		96,
		true
	},
	collection_award_ship = {
		187615,
		123,
		true
	},
	guild_create_sucess = {
		187738,
		104,
		true
	},
	guild_create_error = {
		187842,
		103,
		true
	},
	guild_create_error_noname = {
		187945,
		116,
		true
	},
	guild_create_error_nofaction = {
		188061,
		119,
		true
	},
	guild_create_error_nopolicy = {
		188180,
		118,
		true
	},
	guild_create_error_nomanifesto = {
		188298,
		121,
		true
	},
	guild_create_error_nomoney = {
		188419,
		105,
		true
	},
	guild_tip_dissolve = {
		188524,
		311,
		true
	},
	guild_tip_quit = {
		188835,
		108,
		true
	},
	guild_create_confirm = {
		188943,
		171,
		true
	},
	guild_apply_erro = {
		189114,
		101,
		true
	},
	guild_dissolve_erro = {
		189215,
		104,
		true
	},
	guild_fire_erro = {
		189319,
		106,
		true
	},
	guild_impeach_erro = {
		189425,
		109,
		true
	},
	guild_quit_erro = {
		189534,
		100,
		true
	},
	guild_accept_erro = {
		189634,
		99,
		true
	},
	guild_reject_erro = {
		189733,
		99,
		true
	},
	guild_modify_erro = {
		189832,
		99,
		true
	},
	guild_setduty_erro = {
		189931,
		100,
		true
	},
	guild_apply_sucess = {
		190031,
		94,
		true
	},
	guild_no_exist = {
		190125,
		96,
		true
	},
	guild_dissolve_sucess = {
		190221,
		106,
		true
	},
	guild_commder_in_impeach_time = {
		190327,
		114,
		true
	},
	guild_impeach_sucess = {
		190441,
		96,
		true
	},
	guild_quit_sucess = {
		190537,
		102,
		true
	},
	guild_member_max_count = {
		190639,
		122,
		true
	},
	guild_new_member_join = {
		190761,
		106,
		true
	},
	guild_player_in_cd_time = {
		190867,
		138,
		true
	},
	guild_player_already_join = {
		191005,
		113,
		true
	},
	guild_rejecet_apply_sucess = {
		191118,
		108,
		true
	},
	guild_should_input_keyword = {
		191226,
		111,
		true
	},
	guild_search_sucess = {
		191337,
		95,
		true
	},
	guild_list_refresh_sucess = {
		191432,
		116,
		true
	},
	guild_info_update = {
		191548,
		108,
		true
	},
	guild_duty_id_is_null = {
		191656,
		103,
		true
	},
	guild_player_is_null = {
		191759,
		102,
		true
	},
	guild_duty_commder_max_count = {
		191861,
		119,
		true
	},
	guild_set_duty_sucess = {
		191980,
		103,
		true
	},
	guild_policy_power = {
		192083,
		94,
		true
	},
	guild_policy_relax = {
		192177,
		94,
		true
	},
	guild_faction_blhx = {
		192271,
		94,
		true
	},
	guild_faction_cszz = {
		192365,
		94,
		true
	},
	guild_faction_unknown = {
		192459,
		89,
		true
	},
	guild_faction_meta = {
		192548,
		86,
		true
	},
	guild_word_commder = {
		192634,
		88,
		true
	},
	guild_word_deputy_commder = {
		192722,
		98,
		true
	},
	guild_word_picked = {
		192820,
		87,
		true
	},
	guild_word_ordinary = {
		192907,
		89,
		true
	},
	guild_word_home = {
		192996,
		85,
		true
	},
	guild_word_member = {
		193081,
		87,
		true
	},
	guild_word_apply = {
		193168,
		86,
		true
	},
	guild_faction_change_tip = {
		193254,
		215,
		true
	},
	guild_msg_is_null = {
		193469,
		102,
		true
	},
	guild_log_new_guild_join = {
		193571,
		196,
		true
	},
	guild_log_duty_change = {
		193767,
		186,
		true
	},
	guild_log_quit = {
		193953,
		175,
		true
	},
	guild_log_fire = {
		194128,
		184,
		true
	},
	guild_leave_cd_time = {
		194312,
		152,
		true
	},
	guild_sort_time = {
		194464,
		85,
		true
	},
	guild_sort_level = {
		194549,
		86,
		true
	},
	guild_sort_duty = {
		194635,
		85,
		true
	},
	guild_fire_tip = {
		194720,
		102,
		true
	},
	guild_impeach_tip = {
		194822,
		102,
		true
	},
	guild_set_duty_title = {
		194924,
		104,
		true
	},
	guild_search_list_max_count = {
		195028,
		114,
		true
	},
	guild_sort_all = {
		195142,
		84,
		true
	},
	guild_sort_blhx = {
		195226,
		91,
		true
	},
	guild_sort_cszz = {
		195317,
		91,
		true
	},
	guild_sort_power = {
		195408,
		92,
		true
	},
	guild_sort_relax = {
		195500,
		92,
		true
	},
	guild_join_cd = {
		195592,
		131,
		true
	},
	guild_name_invaild = {
		195723,
		103,
		true
	},
	guild_apply_full = {
		195826,
		113,
		true
	},
	guild_member_full = {
		195939,
		108,
		true
	},
	guild_fire_duty_limit = {
		196047,
		124,
		true
	},
	guild_fire_succeed = {
		196171,
		94,
		true
	},
	guild_duty_tip_1 = {
		196265,
		115,
		true
	},
	guild_duty_tip_2 = {
		196380,
		115,
		true
	},
	battle_repair_special_tip = {
		196495,
		152,
		true
	},
	battle_repair_normal_name = {
		196647,
		110,
		true
	},
	battle_repair_special_name = {
		196757,
		111,
		true
	},
	oil_max_tip_title = {
		196868,
		105,
		true
	},
	gold_max_tip_title = {
		196973,
		106,
		true
	},
	expbook_max_tip_title = {
		197079,
		121,
		true
	},
	resource_max_tip_shop = {
		197200,
		103,
		true
	},
	resource_max_tip_event = {
		197303,
		110,
		true
	},
	resource_max_tip_battle = {
		197413,
		145,
		true
	},
	resource_max_tip_collect = {
		197558,
		112,
		true
	},
	resource_max_tip_mail = {
		197670,
		103,
		true
	},
	resource_max_tip_eventstart = {
		197773,
		109,
		true
	},
	resource_max_tip_destroy = {
		197882,
		106,
		true
	},
	resource_max_tip_retire = {
		197988,
		99,
		true
	},
	resource_max_tip_retire_1 = {
		198087,
		147,
		true
	},
	new_version_tip = {
		198234,
		179,
		true
	},
	guild_request_msg_title = {
		198413,
		105,
		true
	},
	guild_request_msg_placeholder = {
		198518,
		117,
		true
	},
	ship_upgrade_unequip_tip = {
		198635,
		224,
		true
	},
	destination_can_not_reach = {
		198859,
		110,
		true
	},
	destination_can_not_reach_safety = {
		198969,
		123,
		true
	},
	destination_not_in_range = {
		199092,
		115,
		true
	},
	level_ammo_enough = {
		199207,
		114,
		true
	},
	level_ammo_supply = {
		199321,
		146,
		true
	},
	level_ammo_empty = {
		199467,
		144,
		true
	},
	level_ammo_supply_p1 = {
		199611,
		120,
		true
	},
	level_flare_supply = {
		199731,
		136,
		true
	},
	chat_level_not_enough = {
		199867,
		133,
		true
	},
	chat_msg_inform = {
		200000,
		127,
		true
	},
	chat_msg_ban = {
		200127,
		144,
		true
	},
	month_card_set_ratio_success = {
		200271,
		116,
		true
	},
	month_card_set_ratio_not_change = {
		200387,
		119,
		true
	},
	charge_ship_bag_max = {
		200506,
		113,
		true
	},
	charge_equip_bag_max = {
		200619,
		114,
		true
	},
	login_wait_tip = {
		200733,
		143,
		true
	},
	ship_equip_exchange_tip = {
		200876,
		190,
		true
	},
	ship_rename_success = {
		201066,
		104,
		true
	},
	formation_chapter_lock = {
		201170,
		117,
		true
	},
	elite_disable_unsatisfied = {
		201287,
		128,
		true
	},
	elite_disable_ship_escort = {
		201415,
		132,
		true
	},
	elite_disable_formation_unsatisfied = {
		201547,
		136,
		true
	},
	elite_disable_no_fleet = {
		201683,
		119,
		true
	},
	elite_disable_property_unsatisfied = {
		201802,
		135,
		true
	},
	elite_disable_unusable = {
		201937,
		122,
		true
	},
	elite_warp_to_latest_map = {
		202059,
		118,
		true
	},
	elite_fleet_confirm = {
		202177,
		178,
		true
	},
	elite_condition_level = {
		202355,
		97,
		true
	},
	elite_condition_durability = {
		202452,
		102,
		true
	},
	elite_condition_cannon = {
		202554,
		98,
		true
	},
	elite_condition_torpedo = {
		202652,
		99,
		true
	},
	elite_condition_antiaircraft = {
		202751,
		104,
		true
	},
	elite_condition_air = {
		202855,
		95,
		true
	},
	elite_condition_antisub = {
		202950,
		99,
		true
	},
	elite_condition_dodge = {
		203049,
		97,
		true
	},
	elite_condition_reload = {
		203146,
		98,
		true
	},
	elite_condition_fleet_totle_level = {
		203244,
		139,
		true
	},
	common_compare_larger = {
		203383,
		91,
		true
	},
	common_compare_equal = {
		203474,
		90,
		true
	},
	common_compare_smaller = {
		203564,
		92,
		true
	},
	common_compare_not_less_than = {
		203656,
		104,
		true
	},
	common_compare_not_more_than = {
		203760,
		104,
		true
	},
	level_scene_formation_active_already = {
		203864,
		124,
		true
	},
	level_scene_not_enough = {
		203988,
		119,
		true
	},
	level_scene_full_hp = {
		204107,
		128,
		true
	},
	level_click_to_move = {
		204235,
		122,
		true
	},
	common_hardmode = {
		204357,
		85,
		true
	},
	common_elite_no_quota = {
		204442,
		127,
		true
	},
	common_food = {
		204569,
		81,
		true
	},
	common_no_limit = {
		204650,
		85,
		true
	},
	common_proficiency = {
		204735,
		88,
		true
	},
	backyard_food_remind = {
		204823,
		167,
		true
	},
	backyard_food_count = {
		204990,
		105,
		true
	},
	sham_ship_level_limit = {
		205095,
		120,
		true
	},
	sham_count_limit = {
		205215,
		122,
		true
	},
	sham_count_reset = {
		205337,
		139,
		true
	},
	sham_team_limit = {
		205476,
		134,
		true
	},
	sham_formation_invalid = {
		205610,
		138,
		true
	},
	sham_my_assist_ship_level_limit = {
		205748,
		131,
		true
	},
	sham_reset_confirm = {
		205879,
		131,
		true
	},
	sham_battle_help_tip = {
		206010,
		1071,
		true
	},
	sham_reset_err_limit = {
		207081,
		111,
		true
	},
	sham_ship_equip_forbid_1 = {
		207192,
		185,
		true
	},
	sham_ship_equip_forbid_2 = {
		207377,
		164,
		true
	},
	sham_enter_error_friend_ship_expired = {
		207541,
		149,
		true
	},
	sham_can_not_change_ship = {
		207690,
		131,
		true
	},
	sham_friend_ship_tip = {
		207821,
		145,
		true
	},
	inform_sueecss = {
		207966,
		90,
		true
	},
	inform_failed = {
		208056,
		89,
		true
	},
	inform_player = {
		208145,
		94,
		true
	},
	inform_select_type = {
		208239,
		103,
		true
	},
	inform_chat_msg = {
		208342,
		97,
		true
	},
	inform_sueecss_tip = {
		208439,
		184,
		true
	},
	ship_remould_max_level = {
		208623,
		110,
		true
	},
	ship_remould_material_ship_no_enough = {
		208733,
		115,
		true
	},
	ship_remould_material_ship_on_exist = {
		208848,
		117,
		true
	},
	ship_remould_material_unlock_skill = {
		208965,
		139,
		true
	},
	ship_remould_prev_lock = {
		209104,
		101,
		true
	},
	ship_remould_need_level = {
		209205,
		102,
		true
	},
	ship_remould_need_star = {
		209307,
		101,
		true
	},
	ship_remould_finished = {
		209408,
		94,
		true
	},
	ship_remould_no_item = {
		209502,
		96,
		true
	},
	ship_remould_no_gold = {
		209598,
		96,
		true
	},
	ship_remould_no_material = {
		209694,
		100,
		true
	},
	ship_remould_selecte_exceed = {
		209794,
		119,
		true
	},
	ship_remould_sueecss = {
		209913,
		96,
		true
	},
	ship_remould_warning_102174 = {
		210009,
		188,
		true
	},
	ship_remould_warning_102284 = {
		210197,
		220,
		true
	},
	ship_remould_warning_102304 = {
		210417,
		369,
		true
	},
	ship_remould_warning_105214 = {
		210786,
		223,
		true
	},
	ship_remould_warning_105234 = {
		211009,
		226,
		true
	},
	ship_remould_warning_107984 = {
		211235,
		213,
		true
	},
	ship_remould_warning_201514 = {
		211448,
		232,
		true
	},
	ship_remould_warning_203114 = {
		211680,
		337,
		true
	},
	ship_remould_warning_203124 = {
		212017,
		337,
		true
	},
	ship_remould_warning_205124 = {
		212354,
		185,
		true
	},
	ship_remould_warning_205154 = {
		212539,
		220,
		true
	},
	ship_remould_warning_206134 = {
		212759,
		298,
		true
	},
	ship_remould_warning_301534 = {
		213057,
		220,
		true
	},
	ship_remould_warning_301874 = {
		213277,
		534,
		true
	},
	ship_remould_warning_310014 = {
		213811,
		431,
		true
	},
	ship_remould_warning_310024 = {
		214242,
		431,
		true
	},
	ship_remould_warning_310034 = {
		214673,
		431,
		true
	},
	ship_remould_warning_310044 = {
		215104,
		431,
		true
	},
	ship_remould_warning_303154 = {
		215535,
		564,
		true
	},
	ship_remould_warning_402134 = {
		216099,
		228,
		true
	},
	ship_remould_warning_702124 = {
		216327,
		468,
		true
	},
	ship_remould_warning_520014 = {
		216795,
		246,
		true
	},
	ship_remould_warning_521014 = {
		217041,
		246,
		true
	},
	ship_remould_warning_520034 = {
		217287,
		246,
		true
	},
	ship_remould_warning_521034 = {
		217533,
		246,
		true
	},
	ship_remould_warning_520044 = {
		217779,
		246,
		true
	},
	ship_remould_warning_521044 = {
		218025,
		246,
		true
	},
	ship_remould_warning_502114 = {
		218271,
		222,
		true
	},
	ship_remould_warning_506114 = {
		218493,
		388,
		true
	},
	word_soundfiles_download_title = {
		218881,
		109,
		true
	},
	word_soundfiles_download = {
		218990,
		100,
		true
	},
	word_soundfiles_checking_title = {
		219090,
		106,
		true
	},
	word_soundfiles_checking = {
		219196,
		97,
		true
	},
	word_soundfiles_checkend_title = {
		219293,
		115,
		true
	},
	word_soundfiles_checkend = {
		219408,
		100,
		true
	},
	word_soundfiles_noneedupdate = {
		219508,
		104,
		true
	},
	word_soundfiles_checkfailed = {
		219612,
		112,
		true
	},
	word_soundfiles_retry = {
		219724,
		97,
		true
	},
	word_soundfiles_update = {
		219821,
		98,
		true
	},
	word_soundfiles_update_end_title = {
		219919,
		117,
		true
	},
	word_soundfiles_update_end = {
		220036,
		102,
		true
	},
	word_soundfiles_update_failed = {
		220138,
		114,
		true
	},
	word_soundfiles_update_retry = {
		220252,
		104,
		true
	},
	word_live2dfiles_download_title = {
		220356,
		116,
		true
	},
	word_live2dfiles_download = {
		220472,
		101,
		true
	},
	word_live2dfiles_checking_title = {
		220573,
		107,
		true
	},
	word_live2dfiles_checking = {
		220680,
		98,
		true
	},
	word_live2dfiles_checkend_title = {
		220778,
		122,
		true
	},
	word_live2dfiles_checkend = {
		220900,
		101,
		true
	},
	word_live2dfiles_noneedupdate = {
		221001,
		105,
		true
	},
	word_live2dfiles_checkfailed = {
		221106,
		119,
		true
	},
	word_live2dfiles_retry = {
		221225,
		98,
		true
	},
	word_live2dfiles_update = {
		221323,
		99,
		true
	},
	word_live2dfiles_update_end_title = {
		221422,
		124,
		true
	},
	word_live2dfiles_update_end = {
		221546,
		103,
		true
	},
	word_live2dfiles_update_failed = {
		221649,
		121,
		true
	},
	word_live2dfiles_update_retry = {
		221770,
		105,
		true
	},
	word_live2dfiles_main_update_tip = {
		221875,
		164,
		true
	},
	achieve_propose_tip = {
		222039,
		106,
		true
	},
	mingshi_get_tip = {
		222145,
		124,
		true
	},
	mingshi_task_tip_1 = {
		222269,
		212,
		true
	},
	mingshi_task_tip_2 = {
		222481,
		212,
		true
	},
	mingshi_task_tip_3 = {
		222693,
		205,
		true
	},
	mingshi_task_tip_4 = {
		222898,
		212,
		true
	},
	mingshi_task_tip_5 = {
		223110,
		205,
		true
	},
	mingshi_task_tip_6 = {
		223315,
		205,
		true
	},
	mingshi_task_tip_7 = {
		223520,
		212,
		true
	},
	mingshi_task_tip_8 = {
		223732,
		209,
		true
	},
	mingshi_task_tip_9 = {
		223941,
		205,
		true
	},
	mingshi_task_tip_10 = {
		224146,
		213,
		true
	},
	mingshi_task_tip_11 = {
		224359,
		209,
		true
	},
	word_propose_changename_title = {
		224568,
		168,
		true
	},
	word_propose_changename_tip1 = {
		224736,
		140,
		true
	},
	word_propose_changename_tip2 = {
		224876,
		116,
		true
	},
	word_propose_ring_tip = {
		224992,
		118,
		true
	},
	word_rename_time_tip = {
		225110,
		135,
		true
	},
	word_rename_switch_tip = {
		225245,
		148,
		true
	},
	word_ssr = {
		225393,
		81,
		true
	},
	word_sr = {
		225474,
		77,
		true
	},
	word_r = {
		225551,
		76,
		true
	},
	ship_renameShip_error = {
		225627,
		106,
		true
	},
	ship_renameShip_error_4 = {
		225733,
		99,
		true
	},
	ship_renameShip_error_2011 = {
		225832,
		102,
		true
	},
	ship_proposeShip_error = {
		225934,
		98,
		true
	},
	ship_proposeShip_error_1 = {
		226032,
		100,
		true
	},
	word_rename_time_warning = {
		226132,
		210,
		true
	},
	word_propose_cost_tip = {
		226342,
		354,
		true
	},
	word_propose_switch_tip = {
		226696,
		99,
		true
	},
	evaluate_too_loog = {
		226795,
		93,
		true
	},
	evaluate_ban_word = {
		226888,
		99,
		true
	},
	activity_level_easy_tip = {
		226987,
		192,
		true
	},
	activity_level_difficulty_tip = {
		227179,
		207,
		true
	},
	activity_level_limit_tip = {
		227386,
		189,
		true
	},
	activity_level_inwarime_tip = {
		227575,
		177,
		true
	},
	activity_level_pass_easy_tip = {
		227752,
		163,
		true
	},
	activity_level_is_closed = {
		227915,
		112,
		true
	},
	activity_switch_tip = {
		228027,
		255,
		true
	},
	reduce_sp3_pass_count = {
		228282,
		109,
		true
	},
	qiuqiu_count = {
		228391,
		87,
		true
	},
	qiuqiu_total_count = {
		228478,
		93,
		true
	},
	npcfriendly_count = {
		228571,
		99,
		true
	},
	npcfriendly_total_count = {
		228670,
		105,
		true
	},
	longxiang_count = {
		228775,
		96,
		true
	},
	longxiang_total_count = {
		228871,
		102,
		true
	},
	pt_count = {
		228973,
		77,
		true
	},
	pt_total_count = {
		229050,
		89,
		true
	},
	remould_ship_ok = {
		229139,
		91,
		true
	},
	remould_ship_count_more = {
		229230,
		115,
		true
	},
	word_should_input = {
		229345,
		102,
		true
	},
	simulation_advantage_counting = {
		229447,
		128,
		true
	},
	simulation_disadvantage_counting = {
		229575,
		132,
		true
	},
	simulation_enhancing = {
		229707,
		148,
		true
	},
	simulation_enhanced = {
		229855,
		110,
		true
	},
	word_skill_desc_get = {
		229965,
		97,
		true
	},
	word_skill_desc_learn = {
		230062,
		89,
		true
	},
	chapter_tip_aovid_succeed = {
		230151,
		101,
		true
	},
	chapter_tip_aovid_failed = {
		230252,
		100,
		true
	},
	chapter_tip_change = {
		230352,
		99,
		true
	},
	chapter_tip_use = {
		230451,
		96,
		true
	},
	chapter_tip_with_npc = {
		230547,
		262,
		true
	},
	chapter_tip_bp_ammo = {
		230809,
		131,
		true
	},
	build_ship_tip = {
		230940,
		212,
		true
	},
	auto_battle_limit_tip = {
		231152,
		115,
		true
	},
	build_ship_quickly_buy_stone = {
		231267,
		199,
		true
	},
	build_ship_quickly_buy_tool = {
		231466,
		214,
		true
	},
	ship_profile_voice_locked = {
		231680,
		110,
		true
	},
	ship_profile_skin_locked = {
		231790,
		103,
		true
	},
	ship_profile_words = {
		231893,
		94,
		true
	},
	ship_profile_action_words = {
		231987,
		107,
		true
	},
	ship_profile_label_common = {
		232094,
		95,
		true
	},
	ship_profile_label_diff = {
		232189,
		93,
		true
	},
	level_fleet_lease_one_ship = {
		232282,
		126,
		true
	},
	level_fleet_not_enough = {
		232408,
		122,
		true
	},
	level_fleet_outof_limit = {
		232530,
		117,
		true
	},
	vote_success = {
		232647,
		88,
		true
	},
	vote_not_enough = {
		232735,
		100,
		true
	},
	vote_love_not_enough = {
		232835,
		108,
		true
	},
	vote_love_limit = {
		232943,
		134,
		true
	},
	vote_love_confirm = {
		233077,
		142,
		true
	},
	vote_primary_rule = {
		233219,
		1126,
		true
	},
	vote_final_title1 = {
		234345,
		93,
		true
	},
	vote_final_rule1 = {
		234438,
		427,
		true
	},
	vote_final_title2 = {
		234865,
		93,
		true
	},
	vote_final_rule2 = {
		234958,
		290,
		true
	},
	vote_vote_time = {
		235248,
		98,
		true
	},
	vote_vote_count = {
		235346,
		84,
		true
	},
	vote_vote_group = {
		235430,
		84,
		true
	},
	vote_rank_refresh_time = {
		235514,
		117,
		true
	},
	vote_rank_in_current_server = {
		235631,
		122,
		true
	},
	words_auto_battle_label = {
		235753,
		120,
		true
	},
	words_show_ship_name_label = {
		235873,
		117,
		true
	},
	words_rare_ship_vibrate = {
		235990,
		105,
		true
	},
	words_display_ship_get_effect = {
		236095,
		117,
		true
	},
	words_show_touch_effect = {
		236212,
		105,
		true
	},
	words_bg_fit_mode = {
		236317,
		111,
		true
	},
	words_battle_hide_bg = {
		236428,
		114,
		true
	},
	words_battle_expose_line = {
		236542,
		118,
		true
	},
	words_autoFight_battery_savemode = {
		236660,
		120,
		true
	},
	words_autoFight_battery_savemode_des = {
		236780,
		181,
		true
	},
	words_autoFIght_down_frame = {
		236961,
		108,
		true
	},
	words_autoFIght_down_frame_des = {
		237069,
		173,
		true
	},
	words_autoFight_tips = {
		237242,
		120,
		true
	},
	words_autoFight_right = {
		237362,
		158,
		true
	},
	activity_puzzle_get1 = {
		237520,
		136,
		true
	},
	activity_puzzle_get2 = {
		237656,
		138,
		true
	},
	activity_puzzle_get3 = {
		237794,
		138,
		true
	},
	activity_puzzle_get4 = {
		237932,
		138,
		true
	},
	activity_puzzle_get5 = {
		238070,
		138,
		true
	},
	activity_puzzle_get6 = {
		238208,
		138,
		true
	},
	activity_puzzle_get7 = {
		238346,
		138,
		true
	},
	activity_puzzle_get8 = {
		238484,
		138,
		true
	},
	activity_puzzle_get9 = {
		238622,
		138,
		true
	},
	activity_puzzle_get10 = {
		238760,
		137,
		true
	},
	activity_puzzle_get11 = {
		238897,
		137,
		true
	},
	activity_puzzle_get12 = {
		239034,
		137,
		true
	},
	activity_puzzle_get13 = {
		239171,
		137,
		true
	},
	activity_puzzle_get14 = {
		239308,
		137,
		true
	},
	activity_puzzle_get15 = {
		239445,
		137,
		true
	},
	exchange_item_success = {
		239582,
		97,
		true
	},
	give_up_cloth_change = {
		239679,
		117,
		true
	},
	err_cloth_change_noship = {
		239796,
		98,
		true
	},
	new_skin_no_choose = {
		239894,
		140,
		true
	},
	sure_resume_volume = {
		240034,
		124,
		true
	},
	course_class_not_ready = {
		240158,
		119,
		true
	},
	course_student_max_level = {
		240277,
		134,
		true
	},
	course_stop_confirm = {
		240411,
		125,
		true
	},
	course_class_help = {
		240536,
		1321,
		true
	},
	course_class_name = {
		241857,
		104,
		true
	},
	course_proficiency_not_enough = {
		241961,
		108,
		true
	},
	course_state_rest = {
		242069,
		93,
		true
	},
	course_state_lession = {
		242162,
		99,
		true
	},
	course_energy_not_enough = {
		242261,
		144,
		true
	},
	course_proficiency_tip = {
		242405,
		318,
		true
	},
	course_sunday_tip = {
		242723,
		136,
		true
	},
	course_exit_confirm = {
		242859,
		138,
		true
	},
	course_learning = {
		242997,
		94,
		true
	},
	time_remaining_tip = {
		243091,
		95,
		true
	},
	propose_intimacy_tip = {
		243186,
		112,
		true
	},
	no_found_record_equipment = {
		243298,
		180,
		true
	},
	sec_floor_limit_tip = {
		243478,
		125,
		true
	},
	guild_shop_flash_success = {
		243603,
		100,
		true
	},
	destroy_high_rarity_tip = {
		243703,
		122,
		true
	},
	destroy_high_level_tip = {
		243825,
		124,
		true
	},
	destroy_eliteequipment_tip = {
		243949,
		119,
		true
	},
	destroy_high_intensify_tip = {
		244068,
		127,
		true
	},
	destroy_inHardFormation_tip = {
		244195,
		130,
		true
	},
	destroy_equip_rarity_tip = {
		244325,
		135,
		true
	},
	ship_quick_change_noequip = {
		244460,
		113,
		true
	},
	ship_quick_change_nofreeequip = {
		244573,
		120,
		true
	},
	word_nowenergy = {
		244693,
		93,
		true
	},
	word_energy_recov_speed = {
		244786,
		99,
		true
	},
	destroy_eliteship_tip = {
		244885,
		117,
		true
	},
	err_resloveequip_nochoice = {
		245002,
		113,
		true
	},
	take_nothing = {
		245115,
		94,
		true
	},
	take_all_mail = {
		245209,
		164,
		true
	},
	buy_furniture_overtime = {
		245373,
		119,
		true
	},
	data_erro = {
		245492,
		88,
		true
	},
	login_failed = {
		245580,
		88,
		true
	},
	["not yet completed"] = {
		245668,
		93,
		true
	},
	escort_less_count_to_combat = {
		245761,
		131,
		true
	},
	ten_even_draw = {
		245892,
		88,
		true
	},
	ten_even_draw_confirm = {
		245980,
		111,
		true
	},
	level_risk_level_desc = {
		246091,
		90,
		true
	},
	level_risk_level_mitigation_rate = {
		246181,
		229,
		true
	},
	level_diffcult_chapter_state_safety = {
		246410,
		221,
		true
	},
	level_chapter_state_high_risk = {
		246631,
		135,
		true
	},
	level_chapter_state_risk = {
		246766,
		130,
		true
	},
	level_chapter_state_low_risk = {
		246896,
		134,
		true
	},
	level_chapter_state_safety = {
		247030,
		132,
		true
	},
	open_skill_class_success = {
		247162,
		112,
		true
	},
	backyard_sort_tag_default = {
		247274,
		95,
		true
	},
	backyard_sort_tag_price = {
		247369,
		93,
		true
	},
	backyard_sort_tag_comfortable = {
		247462,
		102,
		true
	},
	backyard_sort_tag_size = {
		247564,
		92,
		true
	},
	backyard_filter_tag_other = {
		247656,
		95,
		true
	},
	word_status_inFight = {
		247751,
		92,
		true
	},
	word_status_inPVP = {
		247843,
		90,
		true
	},
	word_status_inEvent = {
		247933,
		92,
		true
	},
	word_status_inEventFinished = {
		248025,
		100,
		true
	},
	word_status_inTactics = {
		248125,
		94,
		true
	},
	word_status_inClass = {
		248219,
		92,
		true
	},
	word_status_rest = {
		248311,
		89,
		true
	},
	word_status_train = {
		248400,
		90,
		true
	},
	word_status_world = {
		248490,
		96,
		true
	},
	word_status_inHardFormation = {
		248586,
		106,
		true
	},
	word_status_series_enemy = {
		248692,
		103,
		true
	},
	challenge_rule = {
		248795,
		741,
		true
	},
	challenge_exit_warning = {
		249536,
		199,
		true
	},
	challenge_fleet_type_fail = {
		249735,
		132,
		true
	},
	challenge_current_level = {
		249867,
		110,
		true
	},
	challenge_current_score = {
		249977,
		104,
		true
	},
	challenge_total_score = {
		250081,
		102,
		true
	},
	challenge_current_progress = {
		250183,
		110,
		true
	},
	challenge_count_unlimit = {
		250293,
		112,
		true
	},
	challenge_no_fleet = {
		250405,
		115,
		true
	},
	equipment_skin_unload = {
		250520,
		118,
		true
	},
	equipment_skin_no_old_ship = {
		250638,
		105,
		true
	},
	equipment_skin_no_old_skinorequipment = {
		250743,
		132,
		true
	},
	equipment_skin_no_new_ship = {
		250875,
		105,
		true
	},
	equipment_skin_no_new_equipment = {
		250980,
		113,
		true
	},
	equipment_skin_count_noenough = {
		251093,
		111,
		true
	},
	equipment_skin_replace_done = {
		251204,
		109,
		true
	},
	equipment_skin_unload_failed = {
		251313,
		116,
		true
	},
	equipment_skin_unmatch_equipment = {
		251429,
		158,
		true
	},
	equipment_skin_no_equipment_tip = {
		251587,
		141,
		true
	},
	activity_pool_awards_empty = {
		251728,
		117,
		true
	},
	activity_switch_award_pool_failed = {
		251845,
		161,
		true
	},
	help_activitypool_1 = {
		252006,
		480,
		true
	},
	help_activitypool_2 = {
		252486,
		443,
		true
	},
	help_activitypool_3 = {
		252929,
		477,
		true
	},
	shop_street_activity_tip = {
		253406,
		195,
		true
	},
	shop_street_Equipment_skin_box_help = {
		253601,
		173,
		true
	},
	commander_material_noenough = {
		253774,
		103,
		true
	},
	battle_result_boss_destruct = {
		253877,
		120,
		true
	},
	battle_preCombatLayer_boss_destruct = {
		253997,
		128,
		true
	},
	destory_important_equipment_tip = {
		254125,
		204,
		true
	},
	destory_important_equipment_input_erro = {
		254329,
		120,
		true
	},
	activity_hit_monster_nocount = {
		254449,
		104,
		true
	},
	activity_hit_monster_death = {
		254553,
		111,
		true
	},
	activity_hit_monster_help = {
		254664,
		104,
		true
	},
	activity_hit_monster_erro = {
		254768,
		101,
		true
	},
	activity_xiaotiane_progress = {
		254869,
		104,
		true
	},
	activity_hit_monster_reset_tip = {
		254973,
		165,
		true
	},
	answer_help_tip = {
		255138,
		182,
		true
	},
	answer_answer_role = {
		255320,
		172,
		true
	},
	answer_exit_tip = {
		255492,
		112,
		true
	},
	equip_skin_detail_tip = {
		255604,
		115,
		true
	},
	emoji_type_0 = {
		255719,
		82,
		true
	},
	emoji_type_1 = {
		255801,
		82,
		true
	},
	emoji_type_2 = {
		255883,
		82,
		true
	},
	emoji_type_3 = {
		255965,
		82,
		true
	},
	emoji_type_4 = {
		256047,
		85,
		true
	},
	card_pairs_help_tip = {
		256132,
		840,
		true
	},
	card_pairs_tips = {
		256972,
		167,
		true
	},
	["card_battle_card details_deck"] = {
		257139,
		109,
		true
	},
	["card_battle_card details_hand"] = {
		257248,
		111,
		true
	},
	["card_battle_card details"] = {
		257359,
		111,
		true
	},
	["card_battle_card details_switchto_deck"] = {
		257470,
		124,
		true
	},
	["card_battle_card details_switchto_hand"] = {
		257594,
		121,
		true
	},
	card_battle_card_empty_en = {
		257715,
		106,
		true
	},
	card_battle_card_empty_ch = {
		257821,
		122,
		true
	},
	card_puzzel_goal_ch = {
		257943,
		95,
		true
	},
	card_puzzel_goal_en = {
		258038,
		89,
		true
	},
	card_puzzle_deck = {
		258127,
		89,
		true
	},
	upgrade_to_next_maxlevel_failed = {
		258216,
		151,
		true
	},
	upgrade_to_next_maxlevel_tip = {
		258367,
		157,
		true
	},
	upgrade_to_next_maxlevel_succeed = {
		258524,
		164,
		true
	},
	extra_chapter_socre_tip = {
		258688,
		186,
		true
	},
	extra_chapter_record_updated = {
		258874,
		104,
		true
	},
	extra_chapter_record_not_updated = {
		258978,
		111,
		true
	},
	extra_chapter_locked_tip = {
		259089,
		133,
		true
	},
	extra_chapter_locked_tip_1 = {
		259222,
		135,
		true
	},
	player_name_change_time_lv_tip = {
		259357,
		162,
		true
	},
	player_name_change_time_limit_tip = {
		259519,
		147,
		true
	},
	player_name_change_windows_tip = {
		259666,
		200,
		true
	},
	player_name_change_warning = {
		259866,
		292,
		true
	},
	player_name_change_success = {
		260158,
		117,
		true
	},
	player_name_change_failed = {
		260275,
		116,
		true
	},
	same_player_name_tip = {
		260391,
		120,
		true
	},
	task_is_not_existence = {
		260511,
		105,
		true
	},
	cannot_build_multiple_printblue = {
		260616,
		274,
		true
	},
	printblue_build_success = {
		260890,
		99,
		true
	},
	printblue_build_erro = {
		260989,
		96,
		true
	},
	blueprint_mod_success = {
		261085,
		97,
		true
	},
	blueprint_mod_erro = {
		261182,
		94,
		true
	},
	technology_refresh_sucess = {
		261276,
		113,
		true
	},
	technology_refresh_erro = {
		261389,
		111,
		true
	},
	change_technology_refresh_sucess = {
		261500,
		120,
		true
	},
	change_technology_refresh_erro = {
		261620,
		118,
		true
	},
	technology_start_up = {
		261738,
		95,
		true
	},
	technology_start_erro = {
		261833,
		97,
		true
	},
	technology_stop_success = {
		261930,
		105,
		true
	},
	technology_stop_erro = {
		262035,
		102,
		true
	},
	technology_finish_success = {
		262137,
		107,
		true
	},
	technology_finish_erro = {
		262244,
		104,
		true
	},
	blueprint_stop_success = {
		262348,
		104,
		true
	},
	blueprint_stop_erro = {
		262452,
		101,
		true
	},
	blueprint_destory_tip = {
		262553,
		109,
		true
	},
	blueprint_task_update_tip = {
		262662,
		175,
		true
	},
	blueprint_mod_addition_lock = {
		262837,
		105,
		true
	},
	blueprint_mod_word_unlock = {
		262942,
		104,
		true
	},
	blueprint_mod_skin_unlock = {
		263046,
		104,
		true
	},
	blueprint_build_consume = {
		263150,
		126,
		true
	},
	blueprint_stop_tip = {
		263276,
		124,
		true
	},
	technology_canot_refresh = {
		263400,
		134,
		true
	},
	technology_refresh_tip = {
		263534,
		114,
		true
	},
	technology_is_actived = {
		263648,
		115,
		true
	},
	technology_stop_tip = {
		263763,
		125,
		true
	},
	technology_help_text = {
		263888,
		2683,
		true
	},
	blueprint_build_time_tip = {
		266571,
		171,
		true
	},
	blueprint_cannot_build_tip = {
		266742,
		143,
		true
	},
	technology_task_none_tip = {
		266885,
		93,
		true
	},
	technology_task_build_tip = {
		266978,
		126,
		true
	},
	blueprint_commit_tip = {
		267104,
		146,
		true
	},
	buleprint_need_level_tip = {
		267250,
		108,
		true
	},
	blueprint_max_level_tip = {
		267358,
		105,
		true
	},
	ship_profile_voice_locked_intimacy = {
		267463,
		124,
		true
	},
	ship_profile_voice_locked_propose = {
		267587,
		112,
		true
	},
	ship_profile_voice_locked_propose_imas = {
		267699,
		117,
		true
	},
	ship_profile_voice_locked_design = {
		267816,
		128,
		true
	},
	ship_profile_voice_locked_meta = {
		267944,
		136,
		true
	},
	help_technolog0 = {
		268080,
		350,
		true
	},
	help_technolog = {
		268430,
		513,
		true
	},
	hide_chat_warning = {
		268943,
		157,
		true
	},
	show_chat_warning = {
		269100,
		154,
		true
	},
	help_shipblueprintui = {
		269254,
		2123,
		true
	},
	help_shipblueprintui_luck = {
		271377,
		704,
		true
	},
	anniversary_task_title_1 = {
		272081,
		176,
		true
	},
	anniversary_task_title_2 = {
		272257,
		167,
		true
	},
	anniversary_task_title_3 = {
		272424,
		176,
		true
	},
	anniversary_task_title_4 = {
		272600,
		164,
		true
	},
	anniversary_task_title_5 = {
		272764,
		173,
		true
	},
	anniversary_task_title_6 = {
		272937,
		173,
		true
	},
	anniversary_task_title_7 = {
		273110,
		167,
		true
	},
	anniversary_task_title_8 = {
		273277,
		170,
		true
	},
	anniversary_task_title_9 = {
		273447,
		179,
		true
	},
	anniversary_task_title_10 = {
		273626,
		168,
		true
	},
	anniversary_task_title_11 = {
		273794,
		171,
		true
	},
	anniversary_task_title_12 = {
		273965,
		171,
		true
	},
	anniversary_task_title_13 = {
		274136,
		171,
		true
	},
	anniversary_task_title_14 = {
		274307,
		174,
		true
	},
	charge_scene_buy_confirm = {
		274481,
		167,
		true
	},
	charge_scene_buy_confirm_gold = {
		274648,
		172,
		true
	},
	charge_scene_batch_buy_tip = {
		274820,
		197,
		true
	},
	help_level_ui = {
		275017,
		968,
		true
	},
	guild_modify_info_tip = {
		275985,
		182,
		true
	},
	ai_change_1 = {
		276167,
		99,
		true
	},
	ai_change_2 = {
		276266,
		105,
		true
	},
	activity_shop_lable = {
		276371,
		130,
		true
	},
	word_bilibili = {
		276501,
		90,
		true
	},
	levelScene_tracking_error_pre = {
		276591,
		134,
		true
	},
	ship_limit_notice = {
		276725,
		112,
		true
	},
	idle = {
		276837,
		74,
		true
	},
	main_1 = {
		276911,
		82,
		true
	},
	main_2 = {
		276993,
		82,
		true
	},
	main_3 = {
		277075,
		82,
		true
	},
	complete = {
		277157,
		85,
		true
	},
	login = {
		277242,
		75,
		true
	},
	home = {
		277317,
		74,
		true
	},
	mail = {
		277391,
		81,
		true
	},
	mission = {
		277472,
		84,
		true
	},
	mission_complete = {
		277556,
		93,
		true
	},
	wedding = {
		277649,
		77,
		true
	},
	touch_head = {
		277726,
		80,
		true
	},
	touch_body = {
		277806,
		80,
		true
	},
	touch_special = {
		277886,
		84,
		true
	},
	gold = {
		277970,
		74,
		true
	},
	oil = {
		278044,
		73,
		true
	},
	diamond = {
		278117,
		77,
		true
	},
	word_photo_mode = {
		278194,
		85,
		true
	},
	word_video_mode = {
		278279,
		85,
		true
	},
	word_save_ok = {
		278364,
		109,
		true
	},
	word_save_video = {
		278473,
		119,
		true
	},
	reflux_help_tip = {
		278592,
		1079,
		true
	},
	reflux_pt_not_enough = {
		279671,
		102,
		true
	},
	reflux_word_1 = {
		279773,
		92,
		true
	},
	reflux_word_2 = {
		279865,
		86,
		true
	},
	ship_hunting_level_tips = {
		279951,
		178,
		true
	},
	acquisitionmode_is_not_open = {
		280129,
		121,
		true
	},
	collect_chapter_is_activation = {
		280250,
		140,
		true
	},
	levelScene_chapter_is_activation = {
		280390,
		183,
		true
	},
	resource_verify_warn = {
		280573,
		236,
		true
	},
	resource_verify_fail = {
		280809,
		177,
		true
	},
	resource_verify_success = {
		280986,
		111,
		true
	},
	resource_clear_all = {
		281097,
		151,
		true
	},
	acl_oil_count = {
		281248,
		92,
		true
	},
	acl_oil_total_count = {
		281340,
		104,
		true
	},
	word_take_video_tip = {
		281444,
		145,
		true
	},
	word_snapshot_share_title = {
		281589,
		116,
		true
	},
	word_snapshot_share_agreement = {
		281705,
		506,
		true
	},
	skin_remain_time = {
		282211,
		98,
		true
	},
	word_museum_1 = {
		282309,
		128,
		true
	},
	word_museum_help = {
		282437,
		748,
		true
	},
	goldship_help_tip = {
		283185,
		912,
		true
	},
	metalgearsub_help_tip = {
		284097,
		1497,
		true
	},
	acl_gold_count = {
		285594,
		93,
		true
	},
	acl_gold_total_count = {
		285687,
		105,
		true
	},
	discount_time = {
		285792,
		142,
		true
	},
	commander_talent_not_exist = {
		285934,
		105,
		true
	},
	commander_replace_talent_not_exist = {
		286039,
		119,
		true
	},
	commander_talent_learned = {
		286158,
		108,
		true
	},
	commander_talent_learn_erro = {
		286266,
		114,
		true
	},
	commander_not_exist = {
		286380,
		104,
		true
	},
	commander_fleet_not_exist = {
		286484,
		107,
		true
	},
	commander_fleet_pos_not_exist = {
		286591,
		120,
		true
	},
	commander_equip_to_fleet_erro = {
		286711,
		116,
		true
	},
	commander_acquire_erro = {
		286827,
		109,
		true
	},
	commander_lock_erro = {
		286936,
		97,
		true
	},
	commander_reset_talent_time_no_rearch = {
		287033,
		119,
		true
	},
	commander_reset_talent_is_not_need = {
		287152,
		113,
		true
	},
	commander_reset_talent_success = {
		287265,
		112,
		true
	},
	commander_reset_talent_erro = {
		287377,
		111,
		true
	},
	commander_can_not_be_upgrade = {
		287488,
		116,
		true
	},
	commander_anyone_is_in_fleet = {
		287604,
		125,
		true
	},
	commander_is_in_fleet = {
		287729,
		109,
		true
	},
	commander_play_erro = {
		287838,
		97,
		true
	},
	ship_equip_same_group_equipment = {
		287935,
		125,
		true
	},
	summary_page_un_rearch = {
		288060,
		95,
		true
	},
	player_summary_from = {
		288155,
		104,
		true
	},
	player_summary_data = {
		288259,
		95,
		true
	},
	commander_exp_overflow_tip = {
		288354,
		148,
		true
	},
	commander_reset_talent_tip = {
		288502,
		115,
		true
	},
	commander_reset_talent = {
		288617,
		98,
		true
	},
	commander_select_min_cnt = {
		288715,
		114,
		true
	},
	commander_select_max = {
		288829,
		102,
		true
	},
	commander_lock_done = {
		288931,
		98,
		true
	},
	commander_unlock_done = {
		289029,
		100,
		true
	},
	commander_get_1 = {
		289129,
		121,
		true
	},
	commander_get = {
		289250,
		117,
		true
	},
	commander_build_done = {
		289367,
		108,
		true
	},
	commander_build_erro = {
		289475,
		110,
		true
	},
	commander_get_skills_done = {
		289585,
		113,
		true
	},
	collection_way_is_unopen = {
		289698,
		118,
		true
	},
	commander_can_not_select_same_group = {
		289816,
		126,
		true
	},
	commander_capcity_is_max = {
		289942,
		100,
		true
	},
	commander_reserve_count_is_max = {
		290042,
		118,
		true
	},
	commander_build_pool_tip = {
		290160,
		147,
		true
	},
	commander_select_matiral_erro = {
		290307,
		160,
		true
	},
	commander_material_is_rarity = {
		290467,
		147,
		true
	},
	commander_material_is_maxLevel = {
		290614,
		170,
		true
	},
	charge_commander_bag_max = {
		290784,
		149,
		true
	},
	shop_extendcommander_success = {
		290933,
		116,
		true
	},
	commander_skill_point_noengough = {
		291049,
		110,
		true
	},
	buildship_new_tip = {
		291159,
		155,
		true
	},
	buildship_heavy_tip = {
		291314,
		134,
		true
	},
	buildship_light_tip = {
		291448,
		136,
		true
	},
	buildship_special_tip = {
		291584,
		122,
		true
	},
	Normalbuild_URexchange_help = {
		291706,
		604,
		true
	},
	Normalbuild_URexchange_text1 = {
		292310,
		106,
		true
	},
	Normalbuild_URexchange_text2 = {
		292416,
		104,
		true
	},
	Normalbuild_URexchange_text3 = {
		292520,
		113,
		true
	},
	Normalbuild_URexchange_text4 = {
		292633,
		104,
		true
	},
	Normalbuild_URexchange_warning1 = {
		292737,
		113,
		true
	},
	Normalbuild_URexchange_warning3 = {
		292850,
		205,
		true
	},
	Normalbuild_URexchange_confirm = {
		293055,
		142,
		true
	},
	open_skill_pos = {
		293197,
		189,
		true
	},
	open_skill_pos_discount = {
		293386,
		222,
		true
	},
	event_recommend_fail = {
		293608,
		108,
		true
	},
	newplayer_help_tip = {
		293716,
		991,
		true
	},
	newplayer_notice_1 = {
		294707,
		121,
		true
	},
	newplayer_notice_2 = {
		294828,
		121,
		true
	},
	newplayer_notice_3 = {
		294949,
		121,
		true
	},
	newplayer_notice_4 = {
		295070,
		115,
		true
	},
	newplayer_notice_5 = {
		295185,
		115,
		true
	},
	newplayer_notice_6 = {
		295300,
		160,
		true
	},
	newplayer_notice_7 = {
		295460,
		118,
		true
	},
	newplayer_notice_8 = {
		295578,
		155,
		true
	},
	tec_catchup_1 = {
		295733,
		83,
		true
	},
	tec_catchup_2 = {
		295816,
		83,
		true
	},
	tec_catchup_3 = {
		295899,
		83,
		true
	},
	tec_catchup_4 = {
		295982,
		83,
		true
	},
	tec_catchup_5 = {
		296065,
		83,
		true
	},
	tec_notice = {
		296148,
		121,
		true
	},
	tec_notice_not_open_tip = {
		296269,
		139,
		true
	},
	apply_permission_camera_tip1 = {
		296408,
		146,
		true
	},
	apply_permission_camera_tip2 = {
		296554,
		160,
		true
	},
	apply_permission_camera_tip3 = {
		296714,
		155,
		true
	},
	apply_permission_record_audio_tip1 = {
		296869,
		158,
		true
	},
	apply_permission_record_audio_tip2 = {
		297027,
		166,
		true
	},
	apply_permission_record_audio_tip3 = {
		297193,
		161,
		true
	},
	nine_choose_one = {
		297354,
		210,
		true
	},
	help_commander_info = {
		297564,
		810,
		true
	},
	help_commander_play = {
		298374,
		810,
		true
	},
	help_commander_ability = {
		299184,
		813,
		true
	},
	story_skip_confirm = {
		299997,
		199,
		true
	},
	commander_ability_replace_warning = {
		300196,
		140,
		true
	},
	help_command_room = {
		300336,
		808,
		true
	},
	commander_build_rate_tip = {
		301144,
		145,
		true
	},
	help_activity_bossbattle = {
		301289,
		1040,
		true
	},
	commander_is_in_fleet_already = {
		302329,
		130,
		true
	},
	commander_material_is_in_fleet_tip = {
		302459,
		144,
		true
	},
	commander_main_pos = {
		302603,
		91,
		true
	},
	commander_assistant_pos = {
		302694,
		96,
		true
	},
	comander_repalce_tip = {
		302790,
		152,
		true
	},
	commander_lock_tip = {
		302942,
		133,
		true
	},
	commander_is_in_battle = {
		303075,
		116,
		true
	},
	commander_rename_warning = {
		303191,
		164,
		true
	},
	commander_rename_coldtime_tip = {
		303355,
		125,
		true
	},
	commander_rename_success_tip = {
		303480,
		104,
		true
	},
	amercian_notice_1 = {
		303584,
		184,
		true
	},
	amercian_notice_2 = {
		303768,
		151,
		true
	},
	amercian_notice_3 = {
		303919,
		116,
		true
	},
	amercian_notice_4 = {
		304035,
		96,
		true
	},
	amercian_notice_5 = {
		304131,
		99,
		true
	},
	amercian_notice_6 = {
		304230,
		187,
		true
	},
	ranking_word_1 = {
		304417,
		90,
		true
	},
	ranking_word_2 = {
		304507,
		87,
		true
	},
	ranking_word_3 = {
		304594,
		87,
		true
	},
	ranking_word_4 = {
		304681,
		90,
		true
	},
	ranking_word_5 = {
		304771,
		84,
		true
	},
	ranking_word_6 = {
		304855,
		84,
		true
	},
	ranking_word_7 = {
		304939,
		90,
		true
	},
	ranking_word_8 = {
		305029,
		84,
		true
	},
	ranking_word_9 = {
		305113,
		84,
		true
	},
	ranking_word_10 = {
		305197,
		88,
		true
	},
	spece_illegal_tip = {
		305285,
		99,
		true
	},
	utaware_warmup_notice = {
		305384,
		902,
		true
	},
	utaware_formal_notice = {
		306286,
		648,
		true
	},
	npc_learn_skill_tip = {
		306934,
		184,
		true
	},
	npc_upgrade_max_level = {
		307118,
		131,
		true
	},
	npc_propse_tip = {
		307249,
		117,
		true
	},
	npc_strength_tip = {
		307366,
		185,
		true
	},
	npc_breakout_tip = {
		307551,
		185,
		true
	},
	word_chuansong = {
		307736,
		90,
		true
	},
	npc_evaluation_tip = {
		307826,
		127,
		true
	},
	map_event_skip = {
		307953,
		108,
		true
	},
	map_event_stop_tip = {
		308061,
		157,
		true
	},
	map_event_stop_battle_tip = {
		308218,
		164,
		true
	},
	map_event_stop_battle_tip_2 = {
		308382,
		166,
		true
	},
	map_event_stop_story_tip = {
		308548,
		160,
		true
	},
	map_event_save_nekone = {
		308708,
		126,
		true
	},
	map_event_save_rurutie = {
		308834,
		134,
		true
	},
	map_event_memory_collected = {
		308968,
		143,
		true
	},
	map_event_save_kizuna = {
		309111,
		126,
		true
	},
	five_choose_one = {
		309237,
		213,
		true
	},
	ship_preference_common = {
		309450,
		133,
		true
	},
	draw_big_luck_1 = {
		309583,
		118,
		true
	},
	draw_big_luck_2 = {
		309701,
		131,
		true
	},
	draw_big_luck_3 = {
		309832,
		115,
		true
	},
	draw_medium_luck_1 = {
		309947,
		112,
		true
	},
	draw_medium_luck_2 = {
		310059,
		118,
		true
	},
	draw_medium_luck_3 = {
		310177,
		115,
		true
	},
	draw_little_luck_1 = {
		310292,
		124,
		true
	},
	draw_little_luck_2 = {
		310416,
		121,
		true
	},
	draw_little_luck_3 = {
		310537,
		127,
		true
	},
	ship_preference_non = {
		310664,
		126,
		true
	},
	school_title_dajiangtang = {
		310790,
		97,
		true
	},
	school_title_zhihuimiao = {
		310887,
		96,
		true
	},
	school_title_shitang = {
		310983,
		96,
		true
	},
	school_title_xiaomaibu = {
		311079,
		95,
		true
	},
	school_title_shangdian = {
		311174,
		98,
		true
	},
	school_title_xueyuan = {
		311272,
		96,
		true
	},
	school_title_shoucang = {
		311368,
		94,
		true
	},
	school_title_xiaoyouxiting = {
		311462,
		99,
		true
	},
	tag_level_fighting = {
		311561,
		91,
		true
	},
	tag_level_oni = {
		311652,
		89,
		true
	},
	tag_level_bomb = {
		311741,
		90,
		true
	},
	ui_word_levelui2_inevent = {
		311831,
		97,
		true
	},
	exit_backyard_exp_display = {
		311928,
		120,
		true
	},
	help_monopoly = {
		312048,
		1416,
		true
	},
	md5_error = {
		313464,
		127,
		true
	},
	world_boss_help = {
		313591,
		4330,
		true
	},
	world_boss_tip = {
		317921,
		159,
		true
	},
	world_boss_award_limit = {
		318080,
		157,
		true
	},
	backyard_is_loading = {
		318237,
		113,
		true
	},
	levelScene_loop_help_tip = {
		318350,
		2330,
		true
	},
	no_airspace_competition = {
		320680,
		102,
		true
	},
	air_supremacy_value = {
		320782,
		92,
		true
	},
	read_the_user_agreement = {
		320874,
		114,
		true
	},
	award_max_warning = {
		320988,
		171,
		true
	},
	sub_item_warning = {
		321159,
		105,
		true
	},
	select_award_warning = {
		321264,
		105,
		true
	},
	no_item_selected_tip = {
		321369,
		112,
		true
	},
	backyard_traning_tip = {
		321481,
		154,
		true
	},
	backyard_rest_tip = {
		321635,
		111,
		true
	},
	backyard_class_tip = {
		321746,
		118,
		true
	},
	medal_notice_1 = {
		321864,
		96,
		true
	},
	medal_notice_2 = {
		321960,
		87,
		true
	},
	medal_help_tip = {
		322047,
		1420,
		true
	},
	trophy_achieved = {
		323467,
		94,
		true
	},
	text_shop = {
		323561,
		80,
		true
	},
	text_confirm = {
		323641,
		83,
		true
	},
	text_cancel = {
		323724,
		82,
		true
	},
	text_cancel_fight = {
		323806,
		93,
		true
	},
	text_goon_fight = {
		323899,
		91,
		true
	},
	text_exit = {
		323990,
		80,
		true
	},
	text_clear = {
		324070,
		81,
		true
	},
	text_apply = {
		324151,
		81,
		true
	},
	text_buy = {
		324232,
		79,
		true
	},
	text_forward = {
		324311,
		88,
		true
	},
	text_prepage = {
		324399,
		85,
		true
	},
	text_nextpage = {
		324484,
		86,
		true
	},
	text_exchange = {
		324570,
		84,
		true
	},
	text_retreat = {
		324654,
		83,
		true
	},
	text_goto = {
		324737,
		80,
		true
	},
	level_scene_title_word_1 = {
		324817,
		98,
		true
	},
	level_scene_title_word_2 = {
		324915,
		107,
		true
	},
	level_scene_title_word_3 = {
		325022,
		98,
		true
	},
	level_scene_title_word_4 = {
		325120,
		95,
		true
	},
	level_scene_title_word_5 = {
		325215,
		95,
		true
	},
	ambush_display_0 = {
		325310,
		86,
		true
	},
	ambush_display_1 = {
		325396,
		86,
		true
	},
	ambush_display_2 = {
		325482,
		86,
		true
	},
	ambush_display_3 = {
		325568,
		83,
		true
	},
	ambush_display_4 = {
		325651,
		83,
		true
	},
	ambush_display_5 = {
		325734,
		86,
		true
	},
	ambush_display_6 = {
		325820,
		86,
		true
	},
	black_white_grid_notice = {
		325906,
		1309,
		true
	},
	black_white_grid_reset = {
		327215,
		99,
		true
	},
	black_white_grid_switch_tip = {
		327314,
		127,
		true
	},
	no_way_to_escape = {
		327441,
		92,
		true
	},
	word_attr_ac = {
		327533,
		82,
		true
	},
	help_battle_ac = {
		327615,
		1439,
		true
	},
	help_attribute_dodge_limit = {
		329054,
		312,
		true
	},
	refuse_friend = {
		329366,
		96,
		true
	},
	refuse_and_add_into_bl = {
		329462,
		110,
		true
	},
	tech_simulate_closed = {
		329572,
		117,
		true
	},
	tech_simulate_quit = {
		329689,
		119,
		true
	},
	technology_uplevel_error_no_res = {
		329808,
		253,
		true
	},
	help_technologytree = {
		330061,
		1850,
		true
	},
	tech_change_version_mark = {
		331911,
		100,
		true
	},
	technology_uplevel_error_studying = {
		332011,
		174,
		true
	},
	fate_attr_word = {
		332185,
		114,
		true
	},
	fate_phase_word = {
		332299,
		94,
		true
	},
	blueprint_simulation_confirm = {
		332393,
		254,
		true
	},
	blueprint_simulation_confirm_19901 = {
		332647,
		420,
		true
	},
	blueprint_simulation_confirm_19902 = {
		333067,
		401,
		true
	},
	blueprint_simulation_confirm_39903 = {
		333468,
		384,
		true
	},
	blueprint_simulation_confirm_39904 = {
		333852,
		393,
		true
	},
	blueprint_simulation_confirm_49902 = {
		334245,
		388,
		true
	},
	blueprint_simulation_confirm_99901 = {
		334633,
		385,
		true
	},
	blueprint_simulation_confirm_29903 = {
		335018,
		381,
		true
	},
	blueprint_simulation_confirm_29904 = {
		335399,
		385,
		true
	},
	blueprint_simulation_confirm_49903 = {
		335784,
		379,
		true
	},
	blueprint_simulation_confirm_49904 = {
		336163,
		385,
		true
	},
	blueprint_simulation_confirm_89902 = {
		336548,
		390,
		true
	},
	blueprint_simulation_confirm_19903 = {
		336938,
		387,
		true
	},
	blueprint_simulation_confirm_39905 = {
		337325,
		386,
		true
	},
	blueprint_simulation_confirm_49905 = {
		337711,
		400,
		true
	},
	blueprint_simulation_confirm_49906 = {
		338111,
		357,
		true
	},
	blueprint_simulation_confirm_69901 = {
		338468,
		410,
		true
	},
	blueprint_simulation_confirm_29905 = {
		338878,
		389,
		true
	},
	blueprint_simulation_confirm_49907 = {
		339267,
		396,
		true
	},
	blueprint_simulation_confirm_59901 = {
		339663,
		380,
		true
	},
	blueprint_simulation_confirm_79901 = {
		340043,
		366,
		true
	},
	blueprint_simulation_confirm_89903 = {
		340409,
		410,
		true
	},
	blueprint_simulation_confirm_19904 = {
		340819,
		396,
		true
	},
	blueprint_simulation_confirm_39906 = {
		341215,
		386,
		true
	},
	blueprint_simulation_confirm_49908 = {
		341601,
		404,
		true
	},
	blueprint_simulation_confirm_49909 = {
		342005,
		401,
		true
	},
	blueprint_simulation_confirm_99902 = {
		342406,
		399,
		true
	},
	electrotherapy_wanning = {
		342805,
		107,
		true
	},
	siren_chase_warning = {
		342912,
		104,
		true
	},
	memorybook_get_award_tip = {
		343016,
		161,
		true
	},
	memorybook_notice = {
		343177,
		687,
		true
	},
	word_votes = {
		343864,
		86,
		true
	},
	number_0 = {
		343950,
		75,
		true
	},
	intimacy_desc_propose_vertical = {
		344025,
		304,
		true
	},
	without_selected_ship = {
		344329,
		115,
		true
	},
	index_all = {
		344444,
		79,
		true
	},
	index_fleetfront = {
		344523,
		92,
		true
	},
	index_fleetrear = {
		344615,
		91,
		true
	},
	index_shipType_quZhu = {
		344706,
		90,
		true
	},
	index_shipType_qinXun = {
		344796,
		91,
		true
	},
	index_shipType_zhongXun = {
		344887,
		93,
		true
	},
	index_shipType_zhanLie = {
		344980,
		92,
		true
	},
	index_shipType_hangMu = {
		345072,
		91,
		true
	},
	index_shipType_weiXiu = {
		345163,
		91,
		true
	},
	index_shipType_qianTing = {
		345254,
		93,
		true
	},
	index_other = {
		345347,
		81,
		true
	},
	index_rare2 = {
		345428,
		81,
		true
	},
	index_rare3 = {
		345509,
		81,
		true
	},
	index_rare4 = {
		345590,
		81,
		true
	},
	index_rare5 = {
		345671,
		84,
		true
	},
	index_rare6 = {
		345755,
		87,
		true
	},
	warning_mail_max_1 = {
		345842,
		154,
		true
	},
	warning_mail_max_2 = {
		345996,
		131,
		true
	},
	return_award_bind_success = {
		346127,
		101,
		true
	},
	return_award_bind_erro = {
		346228,
		100,
		true
	},
	rename_commander_erro = {
		346328,
		99,
		true
	},
	change_display_medal_success = {
		346427,
		116,
		true
	},
	limit_skin_time_day = {
		346543,
		101,
		true
	},
	limit_skin_time_day_min = {
		346644,
		116,
		true
	},
	limit_skin_time_min = {
		346760,
		104,
		true
	},
	limit_skin_time_overtime = {
		346864,
		97,
		true
	},
	limit_skin_time_before_maintenance = {
		346961,
		117,
		true
	},
	award_window_pt_title = {
		347078,
		96,
		true
	},
	return_have_participated_in_act = {
		347174,
		119,
		true
	},
	input_returner_code = {
		347293,
		98,
		true
	},
	dress_up_success = {
		347391,
		92,
		true
	},
	already_have_the_skin = {
		347483,
		106,
		true
	},
	exchange_limit_skin_tip = {
		347589,
		149,
		true
	},
	returner_help = {
		347738,
		1632,
		true
	},
	attire_time_stamp = {
		349370,
		102,
		true
	},
	pray_build_select_ship_instruction = {
		349472,
		122,
		true
	},
	warning_pray_build_pool = {
		349594,
		181,
		true
	},
	error_pray_select_ship_max = {
		349775,
		108,
		true
	},
	tip_pray_build_pool_success = {
		349883,
		103,
		true
	},
	tip_pray_build_pool_fail = {
		349986,
		100,
		true
	},
	pray_build_help = {
		350086,
		2108,
		true
	},
	pray_build_UR_warning = {
		352194,
		155,
		true
	},
	bismarck_award_tip = {
		352349,
		115,
		true
	},
	bismarck_chapter_desc = {
		352464,
		161,
		true
	},
	returner_push_success = {
		352625,
		97,
		true
	},
	returner_max_count = {
		352722,
		106,
		true
	},
	returner_push_tip = {
		352828,
		236,
		true
	},
	returner_match_tip = {
		353064,
		233,
		true
	},
	return_lock_tip = {
		353297,
		135,
		true
	},
	challenge_help = {
		353432,
		1284,
		true
	},
	challenge_casual_reset = {
		354716,
		144,
		true
	},
	challenge_infinite_reset = {
		354860,
		146,
		true
	},
	challenge_normal_reset = {
		355006,
		111,
		true
	},
	challenge_casual_click_switch = {
		355117,
		155,
		true
	},
	challenge_infinite_click_switch = {
		355272,
		157,
		true
	},
	challenge_season_update = {
		355429,
		111,
		true
	},
	challenge_season_update_casual_clear = {
		355540,
		202,
		true
	},
	challenge_season_update_infinite_clear = {
		355742,
		204,
		true
	},
	challenge_season_update_casual_switch = {
		355946,
		245,
		true
	},
	challenge_season_update_infinite_switch = {
		356191,
		247,
		true
	},
	challenge_combat_score = {
		356438,
		103,
		true
	},
	challenge_share_progress = {
		356541,
		115,
		true
	},
	challenge_share = {
		356656,
		82,
		true
	},
	challenge_expire_warn = {
		356738,
		143,
		true
	},
	challenge_normal_tip = {
		356881,
		136,
		true
	},
	challenge_unlimited_tip = {
		357017,
		130,
		true
	},
	commander_prefab_rename_success = {
		357147,
		107,
		true
	},
	commander_prefab_name = {
		357254,
		99,
		true
	},
	commander_prefab_rename_time = {
		357353,
		118,
		true
	},
	commander_build_solt_deficiency = {
		357471,
		116,
		true
	},
	commander_select_box_tip = {
		357587,
		166,
		true
	},
	challenge_end_tip = {
		357753,
		96,
		true
	},
	pass_times = {
		357849,
		86,
		true
	},
	list_empty_tip_billboardui = {
		357935,
		108,
		true
	},
	list_empty_tip_equipmentdesignui = {
		358043,
		123,
		true
	},
	list_empty_tip_storehouseui_equip = {
		358166,
		124,
		true
	},
	list_empty_tip_storehouseui_item = {
		358290,
		120,
		true
	},
	list_empty_tip_eventui = {
		358410,
		113,
		true
	},
	list_empty_tip_guildrequestui = {
		358523,
		114,
		true
	},
	list_empty_tip_joinguildui = {
		358637,
		120,
		true
	},
	list_empty_tip_friendui = {
		358757,
		99,
		true
	},
	list_empty_tip_friendui_search = {
		358856,
		127,
		true
	},
	list_empty_tip_friendui_request = {
		358983,
		113,
		true
	},
	list_empty_tip_friendui_black = {
		359096,
		114,
		true
	},
	list_empty_tip_dockyardui = {
		359210,
		116,
		true
	},
	list_empty_tip_taskscene = {
		359326,
		112,
		true
	},
	empty_tip_mailboxui = {
		359438,
		107,
		true
	},
	words_settings_unlock_ship = {
		359545,
		102,
		true
	},
	words_settings_resolve_equip = {
		359647,
		104,
		true
	},
	words_settings_unlock_commander = {
		359751,
		110,
		true
	},
	words_settings_create_inherit = {
		359861,
		108,
		true
	},
	tips_fail_secondarypwd_much_times = {
		359969,
		171,
		true
	},
	words_desc_unlock = {
		360140,
		123,
		true
	},
	words_desc_resolve_equip = {
		360263,
		131,
		true
	},
	words_desc_create_inherit = {
		360394,
		132,
		true
	},
	words_desc_close_password = {
		360526,
		132,
		true
	},
	words_desc_change_settings = {
		360658,
		145,
		true
	},
	words_set_password = {
		360803,
		94,
		true
	},
	words_information = {
		360897,
		87,
		true
	},
	Word_Ship_Exp_Buff = {
		360984,
		94,
		true
	},
	secondarypassword_incorrectpwd_error = {
		361078,
		156,
		true
	},
	secondary_password_help = {
		361234,
		1240,
		true
	},
	comic_help = {
		362474,
		465,
		true
	},
	secondarypassword_illegal_tip = {
		362939,
		130,
		true
	},
	pt_cosume = {
		363069,
		81,
		true
	},
	secondarypassword_confirm_tips = {
		363150,
		160,
		true
	},
	help_tempesteve = {
		363310,
		801,
		true
	},
	word_rest_times = {
		364111,
		125,
		true
	},
	common_buy_gold_success = {
		364236,
		136,
		true
	},
	harbour_bomb_tip = {
		364372,
		113,
		true
	},
	submarine_approach = {
		364485,
		94,
		true
	},
	submarine_approach_desc = {
		364579,
		139,
		true
	},
	desc_quick_play = {
		364718,
		97,
		true
	},
	text_win_condition = {
		364815,
		94,
		true
	},
	text_lose_condition = {
		364909,
		95,
		true
	},
	text_rest_HP = {
		365004,
		88,
		true
	},
	desc_defense_reward = {
		365092,
		128,
		true
	},
	desc_base_hp = {
		365220,
		96,
		true
	},
	map_event_open = {
		365316,
		99,
		true
	},
	word_reward = {
		365415,
		81,
		true
	},
	tips_dispense_completed = {
		365496,
		99,
		true
	},
	tips_firework_completed = {
		365595,
		105,
		true
	},
	help_summer_feast = {
		365700,
		803,
		true
	},
	help_firework_produce = {
		366503,
		491,
		true
	},
	help_firework = {
		366994,
		1195,
		true
	},
	help_summer_shrine = {
		368189,
		1071,
		true
	},
	help_summer_food = {
		369260,
		1505,
		true
	},
	help_summer_shooting = {
		370765,
		962,
		true
	},
	help_summer_stamp = {
		371727,
		307,
		true
	},
	tips_summergame_exit = {
		372034,
		166,
		true
	},
	tips_shrine_buff = {
		372200,
		112,
		true
	},
	tips_shrine_nobuff = {
		372312,
		139,
		true
	},
	paint_hide_other_obj_tip = {
		372451,
		106,
		true
	},
	help_vote = {
		372557,
		5066,
		true
	},
	tips_firework_exit = {
		377623,
		131,
		true
	},
	result_firework_produce = {
		377754,
		123,
		true
	},
	tag_level_narrative = {
		377877,
		95,
		true
	},
	vote_get_book = {
		377972,
		98,
		true
	},
	vote_book_is_over = {
		378070,
		133,
		true
	},
	vote_fame_tip = {
		378203,
		161,
		true
	},
	word_maintain = {
		378364,
		86,
		true
	},
	name_zhanliejahe = {
		378450,
		101,
		true
	},
	change_skin_secretary_ship_success = {
		378551,
		135,
		true
	},
	change_skin_secretary_ship = {
		378686,
		117,
		true
	},
	word_billboard = {
		378803,
		87,
		true
	},
	word_easy = {
		378890,
		79,
		true
	},
	word_normal_junhe = {
		378969,
		87,
		true
	},
	word_hard = {
		379056,
		79,
		true
	},
	word_special_challenge_ticket = {
		379135,
		108,
		true
	},
	tip_exchange_ticket = {
		379243,
		155,
		true
	},
	dont_remind = {
		379398,
		87,
		true
	},
	worldbossex_help = {
		379485,
		969,
		true
	},
	ship_formationUI_fleetName_easy = {
		380454,
		107,
		true
	},
	ship_formationUI_fleetName_normal = {
		380561,
		109,
		true
	},
	ship_formationUI_fleetName_hard = {
		380670,
		107,
		true
	},
	ship_formationUI_fleetName_extra = {
		380777,
		104,
		true
	},
	ship_formationUI_fleetName_easy_ss = {
		380881,
		116,
		true
	},
	ship_formationUI_fleetName_normal_ss = {
		380997,
		118,
		true
	},
	ship_formationUI_fleetName_hard_ss = {
		381115,
		116,
		true
	},
	ship_formationUI_fleetName_extra_ss = {
		381231,
		113,
		true
	},
	text_consume = {
		381344,
		83,
		true
	},
	text_inconsume = {
		381427,
		87,
		true
	},
	pt_ship_now = {
		381514,
		90,
		true
	},
	pt_ship_goal = {
		381604,
		91,
		true
	},
	option_desc1 = {
		381695,
		127,
		true
	},
	option_desc2 = {
		381822,
		146,
		true
	},
	option_desc3 = {
		381968,
		158,
		true
	},
	option_desc4 = {
		382126,
		210,
		true
	},
	option_desc5 = {
		382336,
		134,
		true
	},
	option_desc6 = {
		382470,
		149,
		true
	},
	option_desc10 = {
		382619,
		141,
		true
	},
	option_desc11 = {
		382760,
		1452,
		true
	},
	music_collection = {
		384212,
		758,
		true
	},
	music_main = {
		384970,
		1010,
		true
	},
	music_juus = {
		385980,
		465,
		true
	},
	doa_collection = {
		386445,
		684,
		true
	},
	ins_word_day = {
		387129,
		84,
		true
	},
	ins_word_hour = {
		387213,
		88,
		true
	},
	ins_word_minu = {
		387301,
		88,
		true
	},
	ins_word_like = {
		387389,
		86,
		true
	},
	ins_click_like_success = {
		387475,
		98,
		true
	},
	ins_push_comment_success = {
		387573,
		100,
		true
	},
	skinshop_live2d_fliter_failed = {
		387673,
		126,
		true
	},
	help_music_game = {
		387799,
		1231,
		true
	},
	restart_music_game = {
		389030,
		143,
		true
	},
	reselect_music_game = {
		389173,
		144,
		true
	},
	hololive_goodmorning = {
		389317,
		571,
		true
	},
	hololive_lianliankan = {
		389888,
		1165,
		true
	},
	hololive_dalaozhang = {
		391053,
		588,
		true
	},
	hololive_dashenling = {
		391641,
		869,
		true
	},
	pocky_jiujiu = {
		392510,
		88,
		true
	},
	pocky_jiujiu_desc = {
		392598,
		136,
		true
	},
	pocky_help = {
		392734,
		722,
		true
	},
	secretary_help = {
		393456,
		1478,
		true
	},
	secretary_unlock2 = {
		394934,
		105,
		true
	},
	secretary_unlock3 = {
		395039,
		105,
		true
	},
	secretary_unlock4 = {
		395144,
		105,
		true
	},
	secretary_unlock5 = {
		395249,
		106,
		true
	},
	secretary_closed = {
		395355,
		92,
		true
	},
	confirm_unlock = {
		395447,
		92,
		true
	},
	secretary_pos_save = {
		395539,
		122,
		true
	},
	secretary_pos_save_success = {
		395661,
		102,
		true
	},
	collection_help = {
		395763,
		346,
		true
	},
	juese_tiyan = {
		396109,
		220,
		true
	},
	resolve_amount_prefix = {
		396329,
		100,
		true
	},
	compose_amount_prefix = {
		396429,
		100,
		true
	},
	help_sub_limits = {
		396529,
		104,
		true
	},
	help_sub_display = {
		396633,
		105,
		true
	},
	confirm_unlock_ship_main = {
		396738,
		134,
		true
	},
	msgbox_text_confirm = {
		396872,
		90,
		true
	},
	msgbox_text_shop = {
		396962,
		87,
		true
	},
	msgbox_text_cancel = {
		397049,
		89,
		true
	},
	msgbox_text_cancel_g = {
		397138,
		91,
		true
	},
	msgbox_text_cancel_fight = {
		397229,
		100,
		true
	},
	msgbox_text_goon_fight = {
		397329,
		98,
		true
	},
	msgbox_text_exit = {
		397427,
		87,
		true
	},
	msgbox_text_clear = {
		397514,
		88,
		true
	},
	msgbox_text_apply = {
		397602,
		88,
		true
	},
	msgbox_text_buy = {
		397690,
		86,
		true
	},
	msgbox_text_noPos_buy = {
		397776,
		92,
		true
	},
	msgbox_text_noPos_clear = {
		397868,
		94,
		true
	},
	msgbox_text_noPos_intensify = {
		397962,
		98,
		true
	},
	msgbox_text_forward = {
		398060,
		95,
		true
	},
	msgbox_text_iknow = {
		398155,
		90,
		true
	},
	msgbox_text_prepage = {
		398245,
		92,
		true
	},
	msgbox_text_nextpage = {
		398337,
		93,
		true
	},
	msgbox_text_exchange = {
		398430,
		91,
		true
	},
	msgbox_text_retreat = {
		398521,
		90,
		true
	},
	msgbox_text_go = {
		398611,
		90,
		true
	},
	msgbox_text_consume = {
		398701,
		89,
		true
	},
	msgbox_text_inconsume = {
		398790,
		94,
		true
	},
	msgbox_text_unlock = {
		398884,
		89,
		true
	},
	msgbox_text_save = {
		398973,
		87,
		true
	},
	msgbox_text_replace = {
		399060,
		90,
		true
	},
	msgbox_text_unload = {
		399150,
		89,
		true
	},
	msgbox_text_modify = {
		399239,
		89,
		true
	},
	msgbox_text_breakthrough = {
		399328,
		95,
		true
	},
	msgbox_text_equipdetail = {
		399423,
		99,
		true
	},
	msgbox_text_use = {
		399522,
		86,
		true
	},
	common_flag_ship = {
		399608,
		89,
		true
	},
	fenjie_lantu_tip = {
		399697,
		137,
		true
	},
	msgbox_text_analyse = {
		399834,
		90,
		true
	},
	fragresolve_empty_tip = {
		399924,
		118,
		true
	},
	confirm_unlock_lv = {
		400042,
		123,
		true
	},
	shops_rest_day = {
		400165,
		103,
		true
	},
	title_limit_time = {
		400268,
		92,
		true
	},
	seven_choose_one = {
		400360,
		214,
		true
	},
	help_newyear_feast = {
		400574,
		967,
		true
	},
	help_newyear_shrine = {
		401541,
		1130,
		true
	},
	help_newyear_stamp = {
		402671,
		343,
		true
	},
	pt_reconfirm = {
		403014,
		126,
		true
	},
	qte_game_help = {
		403140,
		340,
		true
	},
	word_equipskin_type = {
		403480,
		89,
		true
	},
	word_equipskin_all = {
		403569,
		88,
		true
	},
	word_equipskin_cannon = {
		403657,
		91,
		true
	},
	word_equipskin_tarpedo = {
		403748,
		92,
		true
	},
	word_equipskin_aircraft = {
		403840,
		96,
		true
	},
	word_equipskin_aux = {
		403936,
		88,
		true
	},
	msgbox_repair = {
		404024,
		89,
		true
	},
	msgbox_repair_l2d = {
		404113,
		90,
		true
	},
	msgbox_repair_painting = {
		404203,
		98,
		true
	},
	word_no_cache = {
		404301,
		104,
		true
	},
	pile_game_notice = {
		404405,
		942,
		true
	},
	help_chunjie_stamp = {
		405347,
		312,
		true
	},
	help_chunjie_feast = {
		405659,
		558,
		true
	},
	help_chunjie_jiulou = {
		406217,
		824,
		true
	},
	special_animal1 = {
		407041,
		210,
		true
	},
	special_animal2 = {
		407251,
		204,
		true
	},
	special_animal3 = {
		407455,
		197,
		true
	},
	special_animal4 = {
		407652,
		199,
		true
	},
	special_animal5 = {
		407851,
		200,
		true
	},
	special_animal6 = {
		408051,
		185,
		true
	},
	special_animal7 = {
		408236,
		210,
		true
	},
	bulin_help = {
		408446,
		407,
		true
	},
	super_bulin = {
		408853,
		102,
		true
	},
	super_bulin_tip = {
		408955,
		120,
		true
	},
	bulin_tip1 = {
		409075,
		101,
		true
	},
	bulin_tip2 = {
		409176,
		110,
		true
	},
	bulin_tip3 = {
		409286,
		101,
		true
	},
	bulin_tip4 = {
		409387,
		119,
		true
	},
	bulin_tip5 = {
		409506,
		101,
		true
	},
	bulin_tip6 = {
		409607,
		107,
		true
	},
	bulin_tip7 = {
		409714,
		101,
		true
	},
	bulin_tip8 = {
		409815,
		110,
		true
	},
	bulin_tip9 = {
		409925,
		110,
		true
	},
	bulin_tip_other1 = {
		410035,
		137,
		true
	},
	bulin_tip_other2 = {
		410172,
		101,
		true
	},
	bulin_tip_other3 = {
		410273,
		138,
		true
	},
	monopoly_left_count = {
		410411,
		96,
		true
	},
	help_chunjie_monopoly = {
		410507,
		1017,
		true
	},
	monoply_drop_ship_step = {
		411524,
		143,
		true
	},
	lanternRiddles_wait_for_reanswer = {
		411667,
		130,
		true
	},
	lanternRiddles_answer_is_wrong = {
		411797,
		132,
		true
	},
	lanternRiddles_answer_is_right = {
		411929,
		113,
		true
	},
	lanternRiddles_gametip = {
		412042,
		940,
		true
	},
	LanternRiddle_wait_time_tip = {
		412982,
		110,
		true
	},
	LinkLinkGame_BestTime = {
		413092,
		98,
		true
	},
	LinkLinkGame_CurTime = {
		413190,
		97,
		true
	},
	sort_attribute = {
		413287,
		84,
		true
	},
	sort_intimacy = {
		413371,
		83,
		true
	},
	index_skin = {
		413454,
		83,
		true
	},
	index_reform = {
		413537,
		85,
		true
	},
	index_reform_cw = {
		413622,
		88,
		true
	},
	index_strengthen = {
		413710,
		89,
		true
	},
	index_special = {
		413799,
		83,
		true
	},
	index_propose_skin = {
		413882,
		94,
		true
	},
	index_not_obtained = {
		413976,
		91,
		true
	},
	index_no_limit = {
		414067,
		87,
		true
	},
	index_awakening = {
		414154,
		110,
		true
	},
	index_not_lvmax = {
		414264,
		88,
		true
	},
	index_spweapon = {
		414352,
		90,
		true
	},
	index_marry = {
		414442,
		84,
		true
	},
	decodegame_gametip = {
		414526,
		1094,
		true
	},
	indexsort_sort = {
		415620,
		84,
		true
	},
	indexsort_index = {
		415704,
		85,
		true
	},
	indexsort_camp = {
		415789,
		84,
		true
	},
	indexsort_type = {
		415873,
		84,
		true
	},
	indexsort_rarity = {
		415957,
		89,
		true
	},
	indexsort_extraindex = {
		416046,
		96,
		true
	},
	indexsort_label = {
		416142,
		85,
		true
	},
	indexsort_sorteng = {
		416227,
		85,
		true
	},
	indexsort_indexeng = {
		416312,
		87,
		true
	},
	indexsort_campeng = {
		416399,
		85,
		true
	},
	indexsort_rarityeng = {
		416484,
		89,
		true
	},
	indexsort_typeeng = {
		416573,
		85,
		true
	},
	indexsort_labeleng = {
		416658,
		87,
		true
	},
	fightfail_up = {
		416745,
		172,
		true
	},
	fightfail_equip = {
		416917,
		163,
		true
	},
	fight_strengthen = {
		417080,
		167,
		true
	},
	fightfail_noequip = {
		417247,
		126,
		true
	},
	fightfail_choiceequip = {
		417373,
		157,
		true
	},
	fightfail_choicestrengthen = {
		417530,
		165,
		true
	},
	sofmap_attention = {
		417695,
		272,
		true
	},
	sofmapsd_1 = {
		417967,
		161,
		true
	},
	sofmapsd_2 = {
		418128,
		146,
		true
	},
	sofmapsd_3 = {
		418274,
		130,
		true
	},
	sofmapsd_4 = {
		418404,
		123,
		true
	},
	inform_level_limit = {
		418527,
		130,
		true
	},
	["3match_tip"] = {
		418657,
		381,
		true
	},
	retire_selectzero = {
		419038,
		111,
		true
	},
	retire_marry_skin = {
		419149,
		101,
		true
	},
	undermist_tip = {
		419250,
		122,
		true
	},
	retire_1 = {
		419372,
		204,
		true
	},
	retire_2 = {
		419576,
		204,
		true
	},
	retire_3 = {
		419780,
		94,
		true
	},
	retire_rarity = {
		419874,
		94,
		true
	},
	retire_title = {
		419968,
		94,
		true
	},
	res_unlock_tip = {
		420062,
		108,
		true
	},
	res_wifi_tip = {
		420170,
		151,
		true
	},
	res_downloading = {
		420321,
		88,
		true
	},
	res_pic_new_tip = {
		420409,
		111,
		true
	},
	res_music_no_pre_tip = {
		420520,
		105,
		true
	},
	res_music_no_next_tip = {
		420625,
		109,
		true
	},
	res_music_new_tip = {
		420734,
		113,
		true
	},
	apple_link_title = {
		420847,
		113,
		true
	},
	retire_setting_help = {
		420960,
		505,
		true
	},
	activity_shop_exchange_count = {
		421465,
		107,
		true
	},
	shops_msgbox_exchange_count = {
		421572,
		104,
		true
	},
	shops_msgbox_output = {
		421676,
		95,
		true
	},
	shop_word_exchange = {
		421771,
		89,
		true
	},
	shop_word_cancel = {
		421860,
		87,
		true
	},
	title_item_ways = {
		421947,
		141,
		true
	},
	item_lack_title = {
		422088,
		145,
		true
	},
	oil_buy_tip_2 = {
		422233,
		456,
		true
	},
	target_chapter_is_lock = {
		422689,
		113,
		true
	},
	ship_book = {
		422802,
		102,
		true
	},
	month_sign_resign = {
		422904,
		151,
		true
	},
	collect_tip = {
		423055,
		133,
		true
	},
	collect_tip2 = {
		423188,
		137,
		true
	},
	word_weakness = {
		423325,
		83,
		true
	},
	special_operation_tip1 = {
		423408,
		110,
		true
	},
	special_operation_tip2 = {
		423518,
		113,
		true
	},
	area_lock = {
		423631,
		97,
		true
	},
	equipment_upgrade_equipped_tag = {
		423728,
		106,
		true
	},
	equipment_upgrade_spare_tag = {
		423834,
		103,
		true
	},
	equipment_upgrade_help = {
		423937,
		1081,
		true
	},
	equipment_upgrade_title = {
		425018,
		99,
		true
	},
	equipment_upgrade_coin_consume = {
		425117,
		106,
		true
	},
	equipment_upgrade_quick_interface_source_chosen = {
		425223,
		126,
		true
	},
	equipment_upgrade_quick_interface_materials_consume = {
		425349,
		140,
		true
	},
	equipment_upgrade_feedback_lack_of_materials = {
		425489,
		120,
		true
	},
	equipment_upgrade_feedback_equipment_consume = {
		425609,
		192,
		true
	},
	equipment_upgrade_feedback_equipment_can_be_produced = {
		425801,
		177,
		true
	},
	equipment_upgrade_quick_interface_feedback_source_chosen = {
		425978,
		136,
		true
	},
	equipment_upgrade_feedback_lack_of_equipment = {
		426114,
		126,
		true
	},
	equipment_upgrade_equipped_unavailable = {
		426240,
		183,
		true
	},
	equipment_upgrade_initial_node = {
		426423,
		134,
		true
	},
	equipment_upgrade_feedback_compose_tip = {
		426557,
		217,
		true
	},
	discount_coupon_tip = {
		426774,
		193,
		true
	},
	pizzahut_help = {
		426967,
		793,
		true
	},
	towerclimbing_gametip = {
		427760,
		670,
		true
	},
	qingdianguangchang_help = {
		428430,
		599,
		true
	},
	building_tip = {
		429029,
		195,
		true
	},
	building_upgrade_tip = {
		429224,
		126,
		true
	},
	msgbox_text_upgrade = {
		429350,
		90,
		true
	},
	towerclimbing_sign_help = {
		429440,
		692,
		true
	},
	building_complete_tip = {
		430132,
		97,
		true
	},
	backyard_theme_refresh_time_tip = {
		430229,
		113,
		true
	},
	backyard_theme_total_print = {
		430342,
		96,
		true
	},
	backyard_theme_shop_title = {
		430438,
		101,
		true
	},
	backyard_theme_mine_title = {
		430539,
		101,
		true
	},
	backyard_theme_collection_title = {
		430640,
		107,
		true
	},
	backyard_theme_ban_upload_tip = {
		430747,
		171,
		true
	},
	backyard_theme_upload_over_maxcnt = {
		430918,
		180,
		true
	},
	backyard_theme_apply_tip1 = {
		431098,
		144,
		true
	},
	backyard_theme_word_buy = {
		431242,
		93,
		true
	},
	backyard_theme_word_apply = {
		431335,
		95,
		true
	},
	backyard_theme_apply_success = {
		431430,
		104,
		true
	},
	backyard_theme_unload_success = {
		431534,
		111,
		true
	},
	backyard_theme_upload_success = {
		431645,
		105,
		true
	},
	backyard_theme_delete_success = {
		431750,
		105,
		true
	},
	backyard_theme_apply_tip2 = {
		431855,
		107,
		true
	},
	backyard_theme_upload_cnt = {
		431962,
		111,
		true
	},
	backyard_theme_upload_time = {
		432073,
		103,
		true
	},
	backyard_theme_word_like = {
		432176,
		94,
		true
	},
	backyard_theme_word_collection = {
		432270,
		100,
		true
	},
	backyard_theme_cancel_collection = {
		432370,
		117,
		true
	},
	backyard_theme_inform_them = {
		432487,
		104,
		true
	},
	towerclimbing_book_tip = {
		432591,
		125,
		true
	},
	towerclimbing_reward_tip = {
		432716,
		124,
		true
	},
	open_backyard_theme_template_tip = {
		432840,
		123,
		true
	},
	backyard_theme_cancel_template_upload_tip = {
		432963,
		193,
		true
	},
	backyard_theme_delete_themplate_tip = {
		433156,
		178,
		true
	},
	backyard_theme_template_be_delete_tip = {
		433334,
		122,
		true
	},
	backyard_theme_template_collection_cnt_max = {
		433456,
		134,
		true
	},
	backyard_theme_template_collection_cnt = {
		433590,
		120,
		true
	},
	words_visit_backyard_toggle = {
		433710,
		115,
		true
	},
	words_show_friend_backyardship_toggle = {
		433825,
		125,
		true
	},
	words_show_my_backyardship_toggle = {
		433950,
		121,
		true
	},
	option_desc7 = {
		434071,
		134,
		true
	},
	option_desc8 = {
		434205,
		173,
		true
	},
	option_desc9 = {
		434378,
		167,
		true
	},
	backyard_unopen = {
		434545,
		94,
		true
	},
	coupon_timeout_tip = {
		434639,
		138,
		true
	},
	coupon_repeat_tip = {
		434777,
		143,
		true
	},
	backyard_shop_refresh_frequently = {
		434920,
		141,
		true
	},
	word_random = {
		435061,
		81,
		true
	},
	word_hot = {
		435142,
		78,
		true
	},
	word_new = {
		435220,
		78,
		true
	},
	backyard_decoration_theme_template_delete_tip = {
		435298,
		188,
		true
	},
	backyard_not_found_theme_template = {
		435486,
		121,
		true
	},
	backyard_apply_theme_template_erro = {
		435607,
		110,
		true
	},
	backyard_theme_template_list_is_empty = {
		435717,
		128,
		true
	},
	BackYard_collection_be_delete_tip = {
		435845,
		152,
		true
	},
	backyard_theme_template_shop_tip = {
		435997,
		1110,
		true
	},
	backyard_shop_reach_last_page = {
		437107,
		133,
		true
	},
	help_monopoly_car = {
		437240,
		992,
		true
	},
	help_monopoly_car_2 = {
		438232,
		1177,
		true
	},
	help_monopoly_3th = {
		439409,
		1707,
		true
	},
	backYard_missing_furnitrue_tip = {
		441116,
		112,
		true
	},
	win_condition_display_qijian = {
		441228,
		110,
		true
	},
	win_condition_display_qijian_tip = {
		441338,
		127,
		true
	},
	win_condition_display_shangchuan = {
		441465,
		120,
		true
	},
	win_condition_display_shangchuan_tip = {
		441585,
		137,
		true
	},
	win_condition_display_judian = {
		441722,
		116,
		true
	},
	win_condition_display_tuoli = {
		441838,
		118,
		true
	},
	win_condition_display_tuoli_tip = {
		441956,
		138,
		true
	},
	lose_condition_display_quanmie = {
		442094,
		112,
		true
	},
	lose_condition_display_gangqu = {
		442206,
		132,
		true
	},
	re_battle = {
		442338,
		85,
		true
	},
	keep_fate_tip = {
		442423,
		131,
		true
	},
	equip_info_1 = {
		442554,
		82,
		true
	},
	equip_info_2 = {
		442636,
		88,
		true
	},
	equip_info_3 = {
		442724,
		82,
		true
	},
	equip_info_4 = {
		442806,
		82,
		true
	},
	equip_info_5 = {
		442888,
		82,
		true
	},
	equip_info_6 = {
		442970,
		88,
		true
	},
	equip_info_7 = {
		443058,
		88,
		true
	},
	equip_info_8 = {
		443146,
		88,
		true
	},
	equip_info_9 = {
		443234,
		88,
		true
	},
	equip_info_10 = {
		443322,
		89,
		true
	},
	equip_info_11 = {
		443411,
		89,
		true
	},
	equip_info_12 = {
		443500,
		89,
		true
	},
	equip_info_13 = {
		443589,
		83,
		true
	},
	equip_info_14 = {
		443672,
		89,
		true
	},
	equip_info_15 = {
		443761,
		89,
		true
	},
	equip_info_16 = {
		443850,
		89,
		true
	},
	equip_info_17 = {
		443939,
		89,
		true
	},
	equip_info_18 = {
		444028,
		89,
		true
	},
	equip_info_19 = {
		444117,
		89,
		true
	},
	equip_info_20 = {
		444206,
		92,
		true
	},
	equip_info_21 = {
		444298,
		92,
		true
	},
	equip_info_22 = {
		444390,
		98,
		true
	},
	equip_info_23 = {
		444488,
		89,
		true
	},
	equip_info_24 = {
		444577,
		89,
		true
	},
	equip_info_25 = {
		444666,
		80,
		true
	},
	equip_info_26 = {
		444746,
		92,
		true
	},
	equip_info_27 = {
		444838,
		77,
		true
	},
	equip_info_28 = {
		444915,
		95,
		true
	},
	equip_info_29 = {
		445010,
		95,
		true
	},
	equip_info_30 = {
		445105,
		89,
		true
	},
	equip_info_31 = {
		445194,
		83,
		true
	},
	equip_info_32 = {
		445277,
		92,
		true
	},
	equip_info_33 = {
		445369,
		95,
		true
	},
	equip_info_34 = {
		445464,
		89,
		true
	},
	equip_info_extralevel_0 = {
		445553,
		94,
		true
	},
	equip_info_extralevel_1 = {
		445647,
		94,
		true
	},
	equip_info_extralevel_2 = {
		445741,
		94,
		true
	},
	equip_info_extralevel_3 = {
		445835,
		94,
		true
	},
	tec_settings_btn_word = {
		445929,
		97,
		true
	},
	tec_tendency_x = {
		446026,
		89,
		true
	},
	tec_tendency_0 = {
		446115,
		87,
		true
	},
	tec_tendency_1 = {
		446202,
		90,
		true
	},
	tec_tendency_2 = {
		446292,
		90,
		true
	},
	tec_tendency_3 = {
		446382,
		90,
		true
	},
	tec_tendency_4 = {
		446472,
		90,
		true
	},
	tec_tendency_cur_x = {
		446562,
		102,
		true
	},
	tec_tendency_cur_0 = {
		446664,
		106,
		true
	},
	tec_tendency_cur_1 = {
		446770,
		103,
		true
	},
	tec_tendency_cur_2 = {
		446873,
		103,
		true
	},
	tec_tendency_cur_3 = {
		446976,
		103,
		true
	},
	tec_target_catchup_none = {
		447079,
		111,
		true
	},
	tec_target_catchup_selected = {
		447190,
		103,
		true
	},
	tec_tendency_cur_4 = {
		447293,
		103,
		true
	},
	tec_target_catchup_none_x = {
		447396,
		114,
		true
	},
	tec_target_catchup_none_1 = {
		447510,
		115,
		true
	},
	tec_target_catchup_none_2 = {
		447625,
		115,
		true
	},
	tec_target_catchup_none_3 = {
		447740,
		115,
		true
	},
	tec_target_catchup_selected_x = {
		447855,
		118,
		true
	},
	tec_target_catchup_selected_1 = {
		447973,
		119,
		true
	},
	tec_target_catchup_selected_2 = {
		448092,
		119,
		true
	},
	tec_target_catchup_selected_3 = {
		448211,
		119,
		true
	},
	tec_target_catchup_finish_x = {
		448330,
		116,
		true
	},
	tec_target_catchup_finish_1 = {
		448446,
		117,
		true
	},
	tec_target_catchup_finish_2 = {
		448563,
		117,
		true
	},
	tec_target_catchup_finish_3 = {
		448680,
		117,
		true
	},
	tec_target_catchup_dr_finish_tip = {
		448797,
		105,
		true
	},
	tec_target_catchup_all_finish_tip = {
		448902,
		118,
		true
	},
	tec_target_catchup_show_the_finished_version = {
		449020,
		145,
		true
	},
	tec_target_catchup_pry_char = {
		449165,
		103,
		true
	},
	tec_target_catchup_dr_char = {
		449268,
		102,
		true
	},
	tec_target_need_print = {
		449370,
		97,
		true
	},
	tec_target_catchup_progress = {
		449467,
		103,
		true
	},
	tec_target_catchup_select_tip = {
		449570,
		127,
		true
	},
	tec_target_catchup_help_tip = {
		449697,
		710,
		true
	},
	tec_speedup_title = {
		450407,
		93,
		true
	},
	tec_speedup_progress = {
		450500,
		95,
		true
	},
	tec_speedup_overflow = {
		450595,
		153,
		true
	},
	tec_speedup_help_tip = {
		450748,
		227,
		true
	},
	click_back_tip = {
		450975,
		102,
		true
	},
	tech_catchup_sentence_pauses = {
		451077,
		98,
		true
	},
	tec_act_catchup_btn_word = {
		451175,
		100,
		true
	},
	tec_catchup_errorfix = {
		451275,
		353,
		true
	},
	guild_duty_is_too_low = {
		451628,
		115,
		true
	},
	guild_trainee_duty_change_tip = {
		451743,
		123,
		true
	},
	guild_not_exist_donate_task = {
		451866,
		109,
		true
	},
	guild_week_task_state_is_wrong = {
		451975,
		124,
		true
	},
	guild_get_week_done = {
		452099,
		113,
		true
	},
	guild_public_awards = {
		452212,
		101,
		true
	},
	guild_private_awards = {
		452313,
		99,
		true
	},
	guild_task_selecte_tip = {
		452412,
		179,
		true
	},
	guild_task_accept = {
		452591,
		331,
		true
	},
	guild_commander_and_sub_op = {
		452922,
		142,
		true
	},
	["guild_donate_times_not enough"] = {
		453064,
		120,
		true
	},
	guild_donate_success = {
		453184,
		102,
		true
	},
	guild_left_donate_cnt = {
		453286,
		108,
		true
	},
	guild_donate_tip = {
		453394,
		214,
		true
	},
	guild_donate_addition_capital_tip = {
		453608,
		120,
		true
	},
	guild_donate_addition_techpoint_tip = {
		453728,
		119,
		true
	},
	guild_donate_capital_toplimit = {
		453847,
		175,
		true
	},
	guild_donate_techpoint_toplimit = {
		454022,
		174,
		true
	},
	guild_supply_no_open = {
		454196,
		108,
		true
	},
	guild_supply_award_got = {
		454304,
		110,
		true
	},
	guild_new_member_get_award_tip = {
		454414,
		152,
		true
	},
	guild_start_supply_consume_tip = {
		454566,
		260,
		true
	},
	guild_left_supply_day = {
		454826,
		96,
		true
	},
	guild_supply_help_tip = {
		454922,
		601,
		true
	},
	guild_op_only_administrator = {
		455523,
		143,
		true
	},
	guild_shop_refresh_done = {
		455666,
		99,
		true
	},
	guild_shop_cnt_no_enough = {
		455765,
		100,
		true
	},
	guild_shop_refresh_all_tip = {
		455865,
		148,
		true
	},
	guild_shop_exchange_tip = {
		456013,
		108,
		true
	},
	guild_shop_label_1 = {
		456121,
		115,
		true
	},
	guild_shop_label_2 = {
		456236,
		97,
		true
	},
	guild_shop_label_3 = {
		456333,
		89,
		true
	},
	guild_shop_label_4 = {
		456422,
		88,
		true
	},
	guild_shop_label_5 = {
		456510,
		115,
		true
	},
	guild_shop_must_select_goods = {
		456625,
		125,
		true
	},
	guild_not_exist_activation_tech = {
		456750,
		141,
		true
	},
	guild_not_exist_tech = {
		456891,
		108,
		true
	},
	guild_cancel_only_once_pre_day = {
		456999,
		137,
		true
	},
	guild_tech_is_max_level = {
		457136,
		120,
		true
	},
	guild_tech_gold_no_enough = {
		457256,
		132,
		true
	},
	guild_tech_guildgold_no_enough = {
		457388,
		140,
		true
	},
	guild_tech_upgrade_done = {
		457528,
		126,
		true
	},
	guild_exist_activation_tech = {
		457654,
		127,
		true
	},
	guild_tech_gold_desc = {
		457781,
		110,
		true
	},
	guild_tech_oil_desc = {
		457891,
		109,
		true
	},
	guild_tech_shipbag_desc = {
		458000,
		113,
		true
	},
	guild_tech_equipbag_desc = {
		458113,
		114,
		true
	},
	guild_box_gold_desc = {
		458227,
		109,
		true
	},
	guidl_r_box_time_desc = {
		458336,
		112,
		true
	},
	guidl_sr_box_time_desc = {
		458448,
		114,
		true
	},
	guidl_ssr_box_time_desc = {
		458562,
		116,
		true
	},
	guild_member_max_cnt_desc = {
		458678,
		118,
		true
	},
	guild_tech_livness_no_enough = {
		458796,
		230,
		true
	},
	guild_tech_livness_no_enough_label = {
		459026,
		124,
		true
	},
	guild_ship_attr_desc = {
		459150,
		117,
		true
	},
	guild_start_tech_group_tip = {
		459267,
		138,
		true
	},
	guild_cancel_tech_tip = {
		459405,
		227,
		true
	},
	guild_tech_consume_tip = {
		459632,
		202,
		true
	},
	guild_tech_non_admin = {
		459834,
		169,
		true
	},
	guild_tech_label_max_level = {
		460003,
		103,
		true
	},
	guild_tech_label_dev_progress = {
		460106,
		105,
		true
	},
	guild_tech_label_condition = {
		460211,
		114,
		true
	},
	guild_tech_donate_target = {
		460325,
		109,
		true
	},
	guild_not_exist = {
		460434,
		97,
		true
	},
	guild_not_exist_battle = {
		460531,
		110,
		true
	},
	guild_battle_is_end = {
		460641,
		107,
		true
	},
	guild_battle_is_exist = {
		460748,
		112,
		true
	},
	guild_guildgold_no_enough_for_battle = {
		460860,
		143,
		true
	},
	guild_event_start_tip1 = {
		461003,
		144,
		true
	},
	guild_event_start_tip2 = {
		461147,
		150,
		true
	},
	guild_word_may_happen_event = {
		461297,
		109,
		true
	},
	guild_battle_award = {
		461406,
		94,
		true
	},
	guild_word_consume = {
		461500,
		88,
		true
	},
	guild_start_event_consume_tip = {
		461588,
		146,
		true
	},
	guild_start_event_consume_tip_extra = {
		461734,
		207,
		true
	},
	guild_word_consume_for_battle = {
		461941,
		111,
		true
	},
	guild_level_no_enough = {
		462052,
		124,
		true
	},
	guild_open_event_info_when_exist_active = {
		462176,
		142,
		true
	},
	guild_join_event_cnt_label = {
		462318,
		109,
		true
	},
	guild_join_event_max_cnt_tip = {
		462427,
		132,
		true
	},
	guild_join_event_progress_label = {
		462559,
		108,
		true
	},
	guild_join_event_exist_finished_mission_tip = {
		462667,
		232,
		true
	},
	guild_event_not_exist = {
		462899,
		106,
		true
	},
	guild_fleet_can_not_edit = {
		463005,
		112,
		true
	},
	guild_fleet_exist_same_kind_ship = {
		463117,
		148,
		true
	},
	guild_event_exist_same_kind_ship = {
		463265,
		130,
		true
	},
	guidl_event_ship_in_event = {
		463395,
		138,
		true
	},
	guild_event_start_done = {
		463533,
		98,
		true
	},
	guild_fleet_update_done = {
		463631,
		105,
		true
	},
	guild_event_is_lock = {
		463736,
		98,
		true
	},
	guild_event_is_finish = {
		463834,
		158,
		true
	},
	guild_fleet_not_save_tip = {
		463992,
		138,
		true
	},
	guild_word_battle_area = {
		464130,
		99,
		true
	},
	guild_word_battle_type = {
		464229,
		99,
		true
	},
	guild_wrod_battle_target = {
		464328,
		101,
		true
	},
	guild_event_recomm_ship_failed = {
		464429,
		124,
		true
	},
	guild_event_start_event_tip = {
		464553,
		137,
		true
	},
	guild_word_sea = {
		464690,
		84,
		true
	},
	guild_word_score_addition = {
		464774,
		102,
		true
	},
	guild_word_effect_addition = {
		464876,
		103,
		true
	},
	guild_curr_fleet_can_not_edit = {
		464979,
		117,
		true
	},
	guild_next_edit_fleet_time = {
		465096,
		119,
		true
	},
	guild_event_info_desc1 = {
		465215,
		136,
		true
	},
	guild_event_info_desc2 = {
		465351,
		119,
		true
	},
	guild_join_member_cnt = {
		465470,
		98,
		true
	},
	guild_total_effect = {
		465568,
		92,
		true
	},
	guild_word_people = {
		465660,
		84,
		true
	},
	guild_event_info_desc3 = {
		465744,
		105,
		true
	},
	guild_not_exist_boss = {
		465849,
		105,
		true
	},
	guild_ship_from = {
		465954,
		86,
		true
	},
	guild_boss_formation_1 = {
		466040,
		130,
		true
	},
	guild_boss_formation_2 = {
		466170,
		130,
		true
	},
	guild_boss_formation_3 = {
		466300,
		125,
		true
	},
	guild_boss_cnt_no_enough = {
		466425,
		106,
		true
	},
	guild_boss_fleet_cnt_invaild = {
		466531,
		125,
		true
	},
	guild_boss_formation_not_exist_self_ship = {
		466656,
		166,
		true
	},
	guild_boss_formation_exist_event_ship = {
		466822,
		155,
		true
	},
	guild_fleet_is_legal = {
		466977,
		144,
		true
	},
	guild_battle_result_boss_is_death = {
		467121,
		149,
		true
	},
	guild_must_edit_fleet = {
		467270,
		109,
		true
	},
	guild_ship_in_battle = {
		467379,
		153,
		true
	},
	guild_ship_in_assult_fleet = {
		467532,
		130,
		true
	},
	guild_event_exist_assult_ship = {
		467662,
		130,
		true
	},
	guild_formation_erro_in_boss_battle = {
		467792,
		151,
		true
	},
	guild_get_report_failed = {
		467943,
		111,
		true
	},
	guild_report_get_all = {
		468054,
		96,
		true
	},
	guild_can_not_get_tip = {
		468150,
		124,
		true
	},
	guild_not_exist_notifycation = {
		468274,
		116,
		true
	},
	guild_exist_report_award_when_exit = {
		468390,
		147,
		true
	},
	guild_report_tooltip = {
		468537,
		179,
		true
	},
	word_guildgold = {
		468716,
		87,
		true
	},
	guild_member_rank_title_donate = {
		468803,
		106,
		true
	},
	guild_member_rank_title_finish_cnt = {
		468909,
		110,
		true
	},
	guild_member_rank_title_join_cnt = {
		469019,
		108,
		true
	},
	guild_donate_log = {
		469127,
		142,
		true
	},
	guild_supply_log = {
		469269,
		139,
		true
	},
	guild_weektask_log = {
		469408,
		133,
		true
	},
	guild_battle_log = {
		469541,
		134,
		true
	},
	guild_tech_change_log = {
		469675,
		119,
		true
	},
	guild_log_title = {
		469794,
		91,
		true
	},
	guild_use_donateitem_success = {
		469885,
		128,
		true
	},
	guild_use_battleitem_success = {
		470013,
		128,
		true
	},
	not_exist_guild_use_item = {
		470141,
		131,
		true
	},
	guild_member_tip = {
		470272,
		2310,
		true
	},
	guild_tech_tip = {
		472582,
		2233,
		true
	},
	guild_office_tip = {
		474815,
		2541,
		true
	},
	guild_event_help_tip = {
		477356,
		2346,
		true
	},
	guild_mission_info_tip = {
		479702,
		1309,
		true
	},
	guild_public_tech_tip = {
		481011,
		531,
		true
	},
	guild_public_office_tip = {
		481542,
		373,
		true
	},
	guild_tech_price_inc_tip = {
		481915,
		242,
		true
	},
	guild_boss_fleet_desc = {
		482157,
		458,
		true
	},
	guild_boss_formation_exist_invaild_ship = {
		482615,
		161,
		true
	},
	guild_exist_unreceived_supply_award = {
		482776,
		127,
		true
	},
	word_shipState_guild_event = {
		482903,
		139,
		true
	},
	word_shipState_guild_boss = {
		483042,
		180,
		true
	},
	commander_is_in_guild = {
		483222,
		182,
		true
	},
	guild_assult_ship_recommend = {
		483404,
		152,
		true
	},
	guild_cancel_assult_ship_recommend = {
		483556,
		159,
		true
	},
	guild_assult_ship_recommend_conflict = {
		483715,
		167,
		true
	},
	guild_recommend_limit = {
		483882,
		144,
		true
	},
	guild_cancel_assult_ship_recommend_conflict = {
		484026,
		183,
		true
	},
	guild_mission_complate = {
		484209,
		112,
		true
	},
	guild_operation_event_occurrence = {
		484321,
		160,
		true
	},
	guild_transfer_president_confirm = {
		484481,
		201,
		true
	},
	guild_damage_ranking = {
		484682,
		90,
		true
	},
	guild_total_damage = {
		484772,
		91,
		true
	},
	guild_donate_list_updated = {
		484863,
		116,
		true
	},
	guild_donate_list_update_failed = {
		484979,
		125,
		true
	},
	guild_tip_quit_operation = {
		485104,
		244,
		true
	},
	guild_tip_grand_fleet_is_frozen = {
		485348,
		141,
		true
	},
	guild_tip_operation_time_is_not_ample = {
		485489,
		236,
		true
	},
	guild_time_remaining_tip = {
		485725,
		107,
		true
	},
	help_rollingBallGame = {
		485832,
		1086,
		true
	},
	rolling_ball_help = {
		486918,
		691,
		true
	},
	help_jiujiu_expedition_game = {
		487609,
		609,
		true
	},
	jiujiu_expedition_game_stg_desc = {
		488218,
		112,
		true
	},
	build_ship_accumulative = {
		488330,
		100,
		true
	},
	destory_ship_before_tip = {
		488430,
		99,
		true
	},
	destory_ship_input_erro = {
		488529,
		133,
		true
	},
	destroy_ur_rarity_tip = {
		488662,
		182,
		true
	},
	destory_ur_pt_overflowa = {
		488844,
		231,
		true
	},
	jiujiu_expedition_help = {
		489075,
		561,
		true
	},
	shop_label_unlimt_cnt = {
		489636,
		100,
		true
	},
	jiujiu_expedition_book_tip = {
		489736,
		130,
		true
	},
	jiujiu_expedition_reward_tip = {
		489866,
		128,
		true
	},
	jiujiu_expedition_amount_tip = {
		489994,
		147,
		true
	},
	jiujiu_expedition_stg_tip = {
		490141,
		128,
		true
	},
	trade_card_tips1 = {
		490269,
		92,
		true
	},
	trade_card_tips2 = {
		490361,
		327,
		true
	},
	trade_card_tips3 = {
		490688,
		324,
		true
	},
	trade_card_tips4 = {
		491012,
		95,
		true
	},
	ur_exchange_help_tip = {
		491107,
		771,
		true
	},
	fleet_antisub_range = {
		491878,
		95,
		true
	},
	fleet_antisub_range_tip = {
		491973,
		1424,
		true
	},
	practise_idol_tip = {
		493397,
		107,
		true
	},
	practise_idol_help = {
		493504,
		937,
		true
	},
	upgrade_idol_tip = {
		494441,
		113,
		true
	},
	upgrade_complete_tip = {
		494554,
		99,
		true
	},
	upgrade_introduce_tip = {
		494653,
		123,
		true
	},
	collect_idol_tip = {
		494776,
		122,
		true
	},
	hand_account_tip = {
		494898,
		107,
		true
	},
	hand_account_resetting_tip = {
		495005,
		117,
		true
	},
	help_candymagic = {
		495122,
		961,
		true
	},
	award_overflow_tip = {
		496083,
		140,
		true
	},
	hunter_npc = {
		496223,
		901,
		true
	},
	fighterplane_help = {
		497124,
		931,
		true
	},
	fighterplane_J10_tip = {
		498055,
		276,
		true
	},
	fighterplane_J15_tip = {
		498331,
		513,
		true
	},
	fighterplane_FC1_tip = {
		498844,
		457,
		true
	},
	fighterplane_FC31_tip = {
		499301,
		378,
		true
	},
	fighterplane_complete_tip = {
		499679,
		204,
		true
	},
	fighterplane_destroy_tip = {
		499883,
		102,
		true
	},
	fighterplane_hit_tip = {
		499985,
		101,
		true
	},
	fighterplane_score_tip = {
		500086,
		92,
		true
	},
	venusvolleyball_help = {
		500178,
		1100,
		true
	},
	venusvolleyball_rule_tip = {
		501278,
		99,
		true
	},
	venusvolleyball_return_tip = {
		501377,
		111,
		true
	},
	venusvolleyball_suspend_tip = {
		501488,
		112,
		true
	},
	doa_main = {
		501600,
		1227,
		true
	},
	doa_pt_help = {
		502827,
		818,
		true
	},
	doa_pt_complete = {
		503645,
		94,
		true
	},
	doa_pt_up = {
		503739,
		97,
		true
	},
	doa_liliang = {
		503836,
		81,
		true
	},
	doa_jiqiao = {
		503917,
		80,
		true
	},
	doa_tili = {
		503997,
		78,
		true
	},
	doa_meili = {
		504075,
		79,
		true
	},
	snowball_help = {
		504154,
		1488,
		true
	},
	help_xinnian2021_feast = {
		505642,
		500,
		true
	},
	help_xinnian2021__qiaozhong = {
		506142,
		1153,
		true
	},
	help_xinnian2021__meishiyemian = {
		507295,
		687,
		true
	},
	help_xinnian2021__meishi = {
		507982,
		1222,
		true
	},
	help_act_event = {
		509204,
		286,
		true
	},
	autofight = {
		509490,
		85,
		true
	},
	autofight_errors_tip = {
		509575,
		139,
		true
	},
	autofight_special_operation_tip = {
		509714,
		358,
		true
	},
	autofight_formation = {
		510072,
		89,
		true
	},
	autofight_cat = {
		510161,
		86,
		true
	},
	autofight_function = {
		510247,
		88,
		true
	},
	autofight_function1 = {
		510335,
		95,
		true
	},
	autofight_function2 = {
		510430,
		95,
		true
	},
	autofight_function3 = {
		510525,
		95,
		true
	},
	autofight_function4 = {
		510620,
		89,
		true
	},
	autofight_function5 = {
		510709,
		101,
		true
	},
	autofight_rewards = {
		510810,
		99,
		true
	},
	autofight_rewards_none = {
		510909,
		113,
		true
	},
	autofight_leave = {
		511022,
		85,
		true
	},
	autofight_onceagain = {
		511107,
		95,
		true
	},
	autofight_entrust = {
		511202,
		116,
		true
	},
	autofight_task = {
		511318,
		107,
		true
	},
	autofight_effect = {
		511425,
		131,
		true
	},
	autofight_file = {
		511556,
		110,
		true
	},
	autofight_discovery = {
		511666,
		124,
		true
	},
	autofight_tip_bigworld_dead = {
		511790,
		140,
		true
	},
	autofight_tip_bigworld_begin = {
		511930,
		128,
		true
	},
	autofight_tip_bigworld_stop = {
		512058,
		127,
		true
	},
	autofight_tip_bigworld_suspend = {
		512185,
		167,
		true
	},
	autofight_tip_bigworld_loop = {
		512352,
		143,
		true
	},
	autofight_farm = {
		512495,
		90,
		true
	},
	autofight_story = {
		512585,
		118,
		true
	},
	fushun_adventure_help = {
		512703,
		1774,
		true
	},
	autofight_change_tip = {
		514477,
		165,
		true
	},
	autofight_selectprops_tip = {
		514642,
		114,
		true
	},
	help_chunjie2021_feast = {
		514756,
		759,
		true
	},
	valentinesday__txt1_tip = {
		515515,
		157,
		true
	},
	valentinesday__txt2_tip = {
		515672,
		157,
		true
	},
	valentinesday__txt3_tip = {
		515829,
		145,
		true
	},
	valentinesday__txt4_tip = {
		515974,
		145,
		true
	},
	valentinesday__txt5_tip = {
		516119,
		163,
		true
	},
	valentinesday__txt6_tip = {
		516282,
		151,
		true
	},
	valentinesday__shop_tip = {
		516433,
		120,
		true
	},
	wwf_bamboo_tip1 = {
		516553,
		109,
		true
	},
	wwf_bamboo_tip2 = {
		516662,
		109,
		true
	},
	wwf_bamboo_tip3 = {
		516771,
		121,
		true
	},
	wwf_bamboo_help = {
		516892,
		760,
		true
	},
	wwf_guide_tip = {
		517652,
		152,
		true
	},
	securitycake_help = {
		517804,
		1537,
		true
	},
	icecream_help = {
		519341,
		800,
		true
	},
	icecream_make_tip = {
		520141,
		92,
		true
	},
	cadpa_help = {
		520233,
		1225,
		true
	},
	cadpa_tip1 = {
		521458,
		86,
		true
	},
	cadpa_tip2 = {
		521544,
		85,
		true
	},
	query_role = {
		521629,
		83,
		true
	},
	query_role_none = {
		521712,
		88,
		true
	},
	query_role_button = {
		521800,
		93,
		true
	},
	query_role_fail = {
		521893,
		91,
		true
	},
	cumulative_victory_target_tip = {
		521984,
		114,
		true
	},
	cumulative_victory_now_tip = {
		522098,
		111,
		true
	},
	word_files_repair = {
		522209,
		93,
		true
	},
	repair_setting_label = {
		522302,
		96,
		true
	},
	voice_control = {
		522398,
		83,
		true
	},
	index_equip = {
		522481,
		84,
		true
	},
	index_without_limit = {
		522565,
		92,
		true
	},
	meta_learn_skill = {
		522657,
		108,
		true
	},
	world_joint_boss_not_found = {
		522765,
		139,
		true
	},
	world_joint_boss_is_death = {
		522904,
		138,
		true
	},
	world_joint_whitout_guild = {
		523042,
		116,
		true
	},
	world_joint_whitout_friend = {
		523158,
		114,
		true
	},
	world_joint_call_support_failed = {
		523272,
		116,
		true
	},
	world_joint_call_support_success = {
		523388,
		117,
		true
	},
	world_joint_call_friend_support_txt = {
		523505,
		163,
		true
	},
	world_joint_call_guild_support_txt = {
		523668,
		171,
		true
	},
	world_joint_call_world_support_txt = {
		523839,
		165,
		true
	},
	ad_4 = {
		524004,
		211,
		true
	},
	world_word_expired = {
		524215,
		97,
		true
	},
	world_word_guild_member = {
		524312,
		113,
		true
	},
	world_word_guild_player = {
		524425,
		104,
		true
	},
	world_joint_boss_award_expired = {
		524529,
		112,
		true
	},
	world_joint_not_refresh_frequently = {
		524641,
		116,
		true
	},
	world_joint_exit_battle_tip = {
		524757,
		140,
		true
	},
	world_boss_get_item = {
		524897,
		171,
		true
	},
	world_boss_ask_help = {
		525068,
		119,
		true
	},
	world_joint_count_no_enough = {
		525187,
		115,
		true
	},
	world_boss_none = {
		525302,
		146,
		true
	},
	world_boss_fleet = {
		525448,
		92,
		true
	},
	world_max_challenge_cnt = {
		525540,
		145,
		true
	},
	world_reset_success = {
		525685,
		104,
		true
	},
	world_map_dangerous_confirm = {
		525789,
		183,
		true
	},
	world_map_version = {
		525972,
		120,
		true
	},
	world_resource_fill = {
		526092,
		128,
		true
	},
	meta_sys_lock_tip = {
		526220,
		160,
		true
	},
	meta_story_lock = {
		526380,
		139,
		true
	},
	meta_acttime_limit = {
		526519,
		88,
		true
	},
	meta_pt_left = {
		526607,
		87,
		true
	},
	meta_syn_rate = {
		526694,
		92,
		true
	},
	meta_repair_rate = {
		526786,
		95,
		true
	},
	meta_story_tip_1 = {
		526881,
		103,
		true
	},
	meta_story_tip_2 = {
		526984,
		100,
		true
	},
	meta_pt_get_way = {
		527084,
		130,
		true
	},
	meta_pt_point = {
		527214,
		86,
		true
	},
	meta_award_get = {
		527300,
		87,
		true
	},
	meta_award_got = {
		527387,
		87,
		true
	},
	meta_repair = {
		527474,
		88,
		true
	},
	meta_repair_success = {
		527562,
		101,
		true
	},
	meta_repair_effect_unlock = {
		527663,
		110,
		true
	},
	meta_repair_effect_special = {
		527773,
		130,
		true
	},
	meta_energy_ship_level_need = {
		527903,
		116,
		true
	},
	meta_energy_ship_repairrate_need = {
		528019,
		124,
		true
	},
	meta_energy_active_box_tip = {
		528143,
		165,
		true
	},
	meta_break = {
		528308,
		108,
		true
	},
	meta_energy_preview_title = {
		528416,
		119,
		true
	},
	meta_energy_preview_tip = {
		528535,
		131,
		true
	},
	meta_exp_per_day = {
		528666,
		92,
		true
	},
	meta_skill_unlock = {
		528758,
		117,
		true
	},
	meta_unlock_skill_tip = {
		528875,
		155,
		true
	},
	meta_unlock_skill_select = {
		529030,
		123,
		true
	},
	meta_switch_skill_disable = {
		529153,
		139,
		true
	},
	meta_switch_skill_box_title = {
		529292,
		124,
		true
	},
	meta_cur_pt = {
		529416,
		90,
		true
	},
	meta_toast_fullexp = {
		529506,
		106,
		true
	},
	meta_toast_tactics = {
		529612,
		91,
		true
	},
	meta_skillbtn_tactics = {
		529703,
		92,
		true
	},
	meta_destroy_tip = {
		529795,
		105,
		true
	},
	meta_voice_name_feeling1 = {
		529900,
		94,
		true
	},
	meta_voice_name_feeling2 = {
		529994,
		94,
		true
	},
	meta_voice_name_feeling3 = {
		530088,
		94,
		true
	},
	meta_voice_name_feeling4 = {
		530182,
		94,
		true
	},
	meta_voice_name_feeling5 = {
		530276,
		94,
		true
	},
	meta_voice_name_propose = {
		530370,
		93,
		true
	},
	world_boss_ad = {
		530463,
		88,
		true
	},
	world_boss_drop_title = {
		530551,
		108,
		true
	},
	world_boss_pt_recove_desc = {
		530659,
		122,
		true
	},
	world_boss_progress_item_desc = {
		530781,
		373,
		true
	},
	world_joint_max_challenge_people_cnt = {
		531154,
		143,
		true
	},
	equip_ammo_type_1 = {
		531297,
		90,
		true
	},
	equip_ammo_type_2 = {
		531387,
		90,
		true
	},
	equip_ammo_type_3 = {
		531477,
		90,
		true
	},
	equip_ammo_type_4 = {
		531567,
		87,
		true
	},
	equip_ammo_type_5 = {
		531654,
		87,
		true
	},
	equip_ammo_type_6 = {
		531741,
		90,
		true
	},
	equip_ammo_type_7 = {
		531831,
		93,
		true
	},
	equip_ammo_type_8 = {
		531924,
		90,
		true
	},
	equip_ammo_type_9 = {
		532014,
		90,
		true
	},
	equip_ammo_type_10 = {
		532104,
		85,
		true
	},
	equip_ammo_type_11 = {
		532189,
		88,
		true
	},
	common_daily_limit = {
		532277,
		105,
		true
	},
	meta_help = {
		532382,
		2341,
		true
	},
	world_boss_daily_limit = {
		534723,
		104,
		true
	},
	common_go_to_analyze = {
		534827,
		96,
		true
	},
	world_boss_not_reach_target = {
		534923,
		115,
		true
	},
	special_transform_limit_reach = {
		535038,
		163,
		true
	},
	meta_pt_notenough = {
		535201,
		180,
		true
	},
	meta_boss_unlock = {
		535381,
		182,
		true
	},
	word_take_effect = {
		535563,
		86,
		true
	},
	world_boss_challenge_cnt = {
		535649,
		100,
		true
	},
	word_shipNation_meta = {
		535749,
		87,
		true
	},
	world_word_friend = {
		535836,
		87,
		true
	},
	world_word_world = {
		535923,
		86,
		true
	},
	world_word_guild = {
		536009,
		89,
		true
	},
	world_collection_1 = {
		536098,
		94,
		true
	},
	world_collection_2 = {
		536192,
		88,
		true
	},
	world_collection_3 = {
		536280,
		91,
		true
	},
	zero_hour_command_error = {
		536371,
		111,
		true
	},
	commander_is_in_bigworld = {
		536482,
		118,
		true
	},
	world_collection_back = {
		536600,
		106,
		true
	},
	archives_whether_to_retreat = {
		536706,
		168,
		true
	},
	world_fleet_stop = {
		536874,
		104,
		true
	},
	world_setting_title = {
		536978,
		101,
		true
	},
	world_setting_quickmode = {
		537079,
		101,
		true
	},
	world_setting_quickmodetip = {
		537180,
		144,
		true
	},
	world_setting_submititem = {
		537324,
		115,
		true
	},
	world_setting_submititemtip = {
		537439,
		158,
		true
	},
	world_setting_mapauto = {
		537597,
		115,
		true
	},
	world_setting_mapautotip = {
		537712,
		158,
		true
	},
	world_boss_maintenance = {
		537870,
		139,
		true
	},
	world_boss_inbattle = {
		538009,
		119,
		true
	},
	world_automode_title_1 = {
		538128,
		104,
		true
	},
	world_automode_title_2 = {
		538232,
		95,
		true
	},
	world_automode_treasure_1 = {
		538327,
		132,
		true
	},
	world_automode_treasure_2 = {
		538459,
		132,
		true
	},
	world_automode_treasure_3 = {
		538591,
		128,
		true
	},
	world_automode_cancel = {
		538719,
		91,
		true
	},
	world_automode_confirm = {
		538810,
		92,
		true
	},
	world_automode_start_tip1 = {
		538902,
		119,
		true
	},
	world_automode_start_tip2 = {
		539021,
		104,
		true
	},
	world_automode_start_tip3 = {
		539125,
		122,
		true
	},
	world_automode_start_tip4 = {
		539247,
		113,
		true
	},
	world_automode_start_tip5 = {
		539360,
		144,
		true
	},
	world_automode_setting_1 = {
		539504,
		115,
		true
	},
	world_automode_setting_1_1 = {
		539619,
		100,
		true
	},
	world_automode_setting_1_2 = {
		539719,
		91,
		true
	},
	world_automode_setting_1_3 = {
		539810,
		91,
		true
	},
	world_automode_setting_1_4 = {
		539901,
		96,
		true
	},
	world_automode_setting_2 = {
		539997,
		112,
		true
	},
	world_automode_setting_2_1 = {
		540109,
		108,
		true
	},
	world_automode_setting_2_2 = {
		540217,
		111,
		true
	},
	world_automode_setting_all_1 = {
		540328,
		119,
		true
	},
	world_automode_setting_all_1_1 = {
		540447,
		97,
		true
	},
	world_automode_setting_all_1_2 = {
		540544,
		97,
		true
	},
	world_automode_setting_all_2 = {
		540641,
		116,
		true
	},
	world_automode_setting_all_2_1 = {
		540757,
		97,
		true
	},
	world_automode_setting_all_2_2 = {
		540854,
		109,
		true
	},
	world_automode_setting_all_2_3 = {
		540963,
		109,
		true
	},
	world_automode_setting_all_3 = {
		541072,
		119,
		true
	},
	world_automode_setting_all_3_1 = {
		541191,
		97,
		true
	},
	world_automode_setting_all_3_2 = {
		541288,
		97,
		true
	},
	world_automode_setting_all_4 = {
		541385,
		119,
		true
	},
	world_automode_setting_all_4_1 = {
		541504,
		97,
		true
	},
	world_automode_setting_all_4_2 = {
		541601,
		97,
		true
	},
	world_automode_setting_new_1 = {
		541698,
		119,
		true
	},
	world_automode_setting_new_1_1 = {
		541817,
		104,
		true
	},
	world_automode_setting_new_1_2 = {
		541921,
		95,
		true
	},
	world_automode_setting_new_1_3 = {
		542016,
		95,
		true
	},
	world_automode_setting_new_1_4 = {
		542111,
		95,
		true
	},
	world_automode_setting_new_1_5 = {
		542206,
		100,
		true
	},
	world_collection_task_tip_1 = {
		542306,
		152,
		true
	},
	area_putong = {
		542458,
		87,
		true
	},
	area_anquan = {
		542545,
		87,
		true
	},
	area_yaosai = {
		542632,
		87,
		true
	},
	area_yaosai_2 = {
		542719,
		107,
		true
	},
	area_shenyuan = {
		542826,
		89,
		true
	},
	area_yinmi = {
		542915,
		86,
		true
	},
	area_renwu = {
		543001,
		86,
		true
	},
	area_zhuxian = {
		543087,
		88,
		true
	},
	area_dangan = {
		543175,
		87,
		true
	},
	charge_trade_no_error = {
		543262,
		126,
		true
	},
	world_reset_1 = {
		543388,
		130,
		true
	},
	world_reset_2 = {
		543518,
		136,
		true
	},
	world_reset_3 = {
		543654,
		116,
		true
	},
	guild_is_frozen_when_start_tech = {
		543770,
		141,
		true
	},
	world_boss_unactivated = {
		543911,
		128,
		true
	},
	world_reset_tip = {
		544039,
		2572,
		true
	},
	spring_invited_2021 = {
		546611,
		217,
		true
	},
	charge_error_count_limit = {
		546828,
		149,
		true
	},
	charge_error_disable = {
		546977,
		120,
		true
	},
	levelScene_select_sp = {
		547097,
		120,
		true
	},
	word_adjustFleet = {
		547217,
		92,
		true
	},
	levelScene_select_noitem = {
		547309,
		112,
		true
	},
	story_setting_label = {
		547421,
		113,
		true
	},
	login_arrears_tips = {
		547534,
		154,
		true
	},
	Supplement_pay1 = {
		547688,
		195,
		true
	},
	Supplement_pay2 = {
		547883,
		146,
		true
	},
	Supplement_pay3 = {
		548029,
		237,
		true
	},
	Supplement_pay4 = {
		548266,
		91,
		true
	},
	world_ship_repair = {
		548357,
		114,
		true
	},
	Supplement_pay5 = {
		548471,
		143,
		true
	},
	area_unkown = {
		548614,
		87,
		true
	},
	Supplement_pay6 = {
		548701,
		94,
		true
	},
	Supplement_pay7 = {
		548795,
		94,
		true
	},
	Supplement_pay8 = {
		548889,
		88,
		true
	},
	world_battle_damage = {
		548977,
		164,
		true
	},
	setting_story_speed_1 = {
		549141,
		88,
		true
	},
	setting_story_speed_2 = {
		549229,
		91,
		true
	},
	setting_story_speed_3 = {
		549320,
		88,
		true
	},
	setting_story_speed_4 = {
		549408,
		91,
		true
	},
	story_autoplay_setting_label = {
		549499,
		110,
		true
	},
	story_autoplay_setting_1 = {
		549609,
		94,
		true
	},
	story_autoplay_setting_2 = {
		549703,
		94,
		true
	},
	meta_shop_exchange_limit = {
		549797,
		103,
		true
	},
	meta_shop_unexchange_label = {
		549900,
		108,
		true
	},
	daily_level_quick_battle_label2 = {
		550008,
		101,
		true
	},
	daily_level_quick_battle_label1 = {
		550109,
		131,
		true
	},
	dailyLevel_quickfinish = {
		550240,
		335,
		true
	},
	daily_level_quick_battle_label3 = {
		550575,
		107,
		true
	},
	backyard_longpress_ship_tip = {
		550682,
		134,
		true
	},
	common_npc_formation_tip = {
		550816,
		124,
		true
	},
	gametip_xiaotiancheng = {
		550940,
		1012,
		true
	},
	guild_task_autoaccept_1 = {
		551952,
		122,
		true
	},
	guild_task_autoaccept_2 = {
		552074,
		122,
		true
	},
	task_lock = {
		552196,
		85,
		true
	},
	week_task_pt_name = {
		552281,
		90,
		true
	},
	week_task_award_preview_label = {
		552371,
		105,
		true
	},
	week_task_title_label = {
		552476,
		103,
		true
	},
	cattery_op_clean_success = {
		552579,
		100,
		true
	},
	cattery_op_feed_success = {
		552679,
		99,
		true
	},
	cattery_op_play_success = {
		552778,
		99,
		true
	},
	cattery_style_change_success = {
		552877,
		104,
		true
	},
	cattery_add_commander_success = {
		552981,
		114,
		true
	},
	cattery_remove_commander_success = {
		553095,
		117,
		true
	},
	commander_box_quickly_tool_tip_1 = {
		553212,
		136,
		true
	},
	commander_box_quickly_tool_tip_2 = {
		553348,
		132,
		true
	},
	commander_box_quickly_tool_tip_3 = {
		553480,
		111,
		true
	},
	commander_box_was_finished = {
		553591,
		114,
		true
	},
	comander_tool_cnt_is_reclac = {
		553705,
		118,
		true
	},
	comander_tool_max_cnt = {
		553823,
		105,
		true
	},
	cat_home_help = {
		553928,
		925,
		true
	},
	cat_accelfrate_notenough = {
		554853,
		124,
		true
	},
	cat_home_unlock = {
		554977,
		121,
		true
	},
	cat_sleep_notplay = {
		555098,
		126,
		true
	},
	cathome_style_unlock = {
		555224,
		126,
		true
	},
	commander_is_in_cattery = {
		555350,
		120,
		true
	},
	cat_home_interaction = {
		555470,
		110,
		true
	},
	cat_accelerate_left = {
		555580,
		101,
		true
	},
	common_clean = {
		555681,
		82,
		true
	},
	common_feed = {
		555763,
		81,
		true
	},
	common_play = {
		555844,
		81,
		true
	},
	game_stopwords = {
		555925,
		105,
		true
	},
	game_openwords = {
		556030,
		105,
		true
	},
	amusementpark_shop_enter = {
		556135,
		149,
		true
	},
	amusementpark_shop_exchange = {
		556284,
		189,
		true
	},
	amusementpark_shop_success = {
		556473,
		105,
		true
	},
	amusementpark_shop_special = {
		556578,
		143,
		true
	},
	amusementpark_shop_end = {
		556721,
		138,
		true
	},
	amusementpark_shop_0 = {
		556859,
		139,
		true
	},
	amusementpark_shop_carousel1 = {
		556998,
		159,
		true
	},
	amusementpark_shop_carousel2 = {
		557157,
		159,
		true
	},
	amusementpark_shop_carousel3 = {
		557316,
		139,
		true
	},
	amusementpark_shop_exchange2 = {
		557455,
		180,
		true
	},
	amusementpark_help = {
		557635,
		1043,
		true
	},
	amusementpark_shop_help = {
		558678,
		608,
		true
	},
	handshake_game_help = {
		559286,
		966,
		true
	},
	MeixiV4_help = {
		560252,
		792,
		true
	},
	activity_permanent_total = {
		561044,
		100,
		true
	},
	word_investigate = {
		561144,
		86,
		true
	},
	ambush_display_none = {
		561230,
		86,
		true
	},
	activity_permanent_help = {
		561316,
		386,
		true
	},
	activity_permanent_tips1 = {
		561702,
		157,
		true
	},
	activity_permanent_tips2 = {
		561859,
		164,
		true
	},
	activity_permanent_tips3 = {
		562023,
		146,
		true
	},
	activity_permanent_tips4 = {
		562169,
		214,
		true
	},
	activity_permanent_finished = {
		562383,
		100,
		true
	},
	idolmaster_main = {
		562483,
		1095,
		true
	},
	idolmaster_game_tip1 = {
		563578,
		103,
		true
	},
	idolmaster_game_tip2 = {
		563681,
		103,
		true
	},
	idolmaster_game_tip3 = {
		563784,
		98,
		true
	},
	idolmaster_game_tip4 = {
		563882,
		98,
		true
	},
	idolmaster_game_tip5 = {
		563980,
		92,
		true
	},
	idolmaster_collection = {
		564072,
		539,
		true
	},
	idolmaster_voice_name_feeling1 = {
		564611,
		100,
		true
	},
	idolmaster_voice_name_feeling2 = {
		564711,
		100,
		true
	},
	idolmaster_voice_name_feeling3 = {
		564811,
		100,
		true
	},
	idolmaster_voice_name_feeling4 = {
		564911,
		100,
		true
	},
	idolmaster_voice_name_feeling5 = {
		565011,
		100,
		true
	},
	idolmaster_voice_name_propose = {
		565111,
		99,
		true
	},
	cartoon_notall = {
		565210,
		84,
		true
	},
	cartoon_haveno = {
		565294,
		105,
		true
	},
	res_cartoon_new_tip = {
		565399,
		115,
		true
	},
	memory_actiivty_ex = {
		565514,
		86,
		true
	},
	memory_activity_sp = {
		565600,
		86,
		true
	},
	memory_activity_daily = {
		565686,
		91,
		true
	},
	memory_activity_others = {
		565777,
		92,
		true
	},
	battle_end_title = {
		565869,
		92,
		true
	},
	battle_end_subtitle1 = {
		565961,
		96,
		true
	},
	battle_end_subtitle2 = {
		566057,
		96,
		true
	},
	meta_skill_dailyexp = {
		566153,
		104,
		true
	},
	meta_skill_learn = {
		566257,
		119,
		true
	},
	meta_skill_maxtip = {
		566376,
		153,
		true
	},
	meta_tactics_detail = {
		566529,
		95,
		true
	},
	meta_tactics_unlock = {
		566624,
		95,
		true
	},
	meta_tactics_switch = {
		566719,
		95,
		true
	},
	meta_skill_maxtip2 = {
		566814,
		100,
		true
	},
	activity_permanent_progress = {
		566914,
		100,
		true
	},
	cattery_settlement_dialogue_1 = {
		567014,
		111,
		true
	},
	cattery_settlement_dialogue_2 = {
		567125,
		134,
		true
	},
	cattery_settlement_dialogue_3 = {
		567259,
		102,
		true
	},
	cattery_settlement_dialogue_4 = {
		567361,
		106,
		true
	},
	blueprint_catchup_by_gold_confirm = {
		567467,
		154,
		true
	},
	blueprint_catchup_by_gold_help = {
		567621,
		318,
		true
	},
	tec_tip_no_consumption = {
		567939,
		95,
		true
	},
	tec_tip_material_stock = {
		568034,
		92,
		true
	},
	tec_tip_to_consumption = {
		568126,
		98,
		true
	},
	onebutton_max_tip = {
		568224,
		90,
		true
	},
	target_get_tip = {
		568314,
		84,
		true
	},
	fleet_select_title = {
		568398,
		94,
		true
	},
	backyard_rename_title = {
		568492,
		97,
		true
	},
	backyard_rename_tip = {
		568589,
		101,
		true
	},
	equip_add = {
		568690,
		99,
		true
	},
	equipskin_add = {
		568789,
		109,
		true
	},
	equipskin_none = {
		568898,
		113,
		true
	},
	equipskin_typewrong = {
		569011,
		121,
		true
	},
	equipskin_typewrong_en = {
		569132,
		107,
		true
	},
	user_is_banned = {
		569239,
		121,
		true
	},
	user_is_forever_banned = {
		569360,
		104,
		true
	},
	old_class_is_close = {
		569464,
		134,
		true
	},
	activity_event_building = {
		569598,
		1087,
		true
	},
	salvage_tips = {
		570685,
		799,
		true
	},
	tips_shakebeads = {
		571484,
		757,
		true
	},
	gem_shop_xinzhi_tip = {
		572241,
		138,
		true
	},
	cowboy_tips = {
		572379,
		747,
		true
	},
	backyard_backyardScene_Disable_Rotation = {
		573126,
		124,
		true
	},
	chazi_tips = {
		573250,
		792,
		true
	},
	catchteasure_help = {
		574042,
		700,
		true
	},
	unlock_tips = {
		574742,
		97,
		true
	},
	class_label_tran = {
		574839,
		87,
		true
	},
	class_label_gen = {
		574926,
		89,
		true
	},
	class_attr_store = {
		575015,
		92,
		true
	},
	class_attr_proficiency = {
		575107,
		101,
		true
	},
	class_attr_getproficiency = {
		575208,
		104,
		true
	},
	class_attr_costproficiency = {
		575312,
		105,
		true
	},
	class_label_upgrading = {
		575417,
		94,
		true
	},
	class_label_upgradetime = {
		575511,
		99,
		true
	},
	class_label_oilfield = {
		575610,
		96,
		true
	},
	class_label_goldfield = {
		575706,
		97,
		true
	},
	class_res_maxlevel_tip = {
		575803,
		104,
		true
	},
	ship_exp_item_title = {
		575907,
		95,
		true
	},
	ship_exp_item_label_clear = {
		576002,
		96,
		true
	},
	ship_exp_item_label_recom = {
		576098,
		96,
		true
	},
	ship_exp_item_label_confirm = {
		576194,
		98,
		true
	},
	player_expResource_mail_fullBag = {
		576292,
		180,
		true
	},
	tec_nation_award_finish = {
		576472,
		100,
		true
	},
	coures_exp_overflow_tip = {
		576572,
		155,
		true
	},
	coures_exp_npc_tip = {
		576727,
		179,
		true
	},
	coures_level_tip = {
		576906,
		160,
		true
	},
	coures_tip_material_stock = {
		577066,
		98,
		true
	},
	coures_tip_exceeded_lv = {
		577164,
		110,
		true
	},
	eatgame_tips = {
		577274,
		1055,
		true
	},
	breakout_tip_ultimatebonus_gunner = {
		578329,
		159,
		true
	},
	breakout_tip_ultimatebonus_torpedo = {
		578488,
		141,
		true
	},
	breakout_tip_ultimatebonus_aux = {
		578629,
		137,
		true
	},
	map_event_lighthouse_tip_1 = {
		578766,
		151,
		true
	},
	battlepass_main_tip_2110 = {
		578917,
		238,
		true
	},
	battlepass_main_time = {
		579155,
		94,
		true
	},
	battlepass_main_help_2110 = {
		579249,
		2927,
		true
	},
	cruise_task_help_2110 = {
		582176,
		1226,
		true
	},
	cruise_task_phase = {
		583402,
		104,
		true
	},
	cruise_task_tips = {
		583506,
		92,
		true
	},
	battlepass_task_quickfinish1 = {
		583598,
		254,
		true
	},
	battlepass_task_quickfinish2 = {
		583852,
		209,
		true
	},
	battlepass_task_quickfinish3 = {
		584061,
		110,
		true
	},
	cruise_task_unlock = {
		584171,
		119,
		true
	},
	cruise_task_week = {
		584290,
		88,
		true
	},
	battlepass_pay_timelimit = {
		584378,
		99,
		true
	},
	battlepass_pay_acquire = {
		584477,
		110,
		true
	},
	battlepass_pay_attention = {
		584587,
		134,
		true
	},
	battlepass_acquire_attention = {
		584721,
		160,
		true
	},
	battlepass_pay_tip = {
		584881,
		118,
		true
	},
	battlepass_main_tip1 = {
		584999,
		300,
		true
	},
	battlepass_main_tip2 = {
		585299,
		266,
		true
	},
	battlepass_main_tip3 = {
		585565,
		300,
		true
	},
	battlepass_complete = {
		585865,
		110,
		true
	},
	shop_free_tag = {
		585975,
		83,
		true
	},
	quick_equip_tip1 = {
		586058,
		89,
		true
	},
	quick_equip_tip2 = {
		586147,
		86,
		true
	},
	quick_equip_tip3 = {
		586233,
		86,
		true
	},
	quick_equip_tip4 = {
		586319,
		107,
		true
	},
	quick_equip_tip5 = {
		586426,
		125,
		true
	},
	quick_equip_tip6 = {
		586551,
		170,
		true
	},
	retire_importantequipment_tips = {
		586721,
		155,
		true
	},
	settle_rewards_title = {
		586876,
		102,
		true
	},
	settle_rewards_subtitle = {
		586978,
		101,
		true
	},
	total_rewards_subtitle = {
		587079,
		99,
		true
	},
	settle_rewards_text = {
		587178,
		95,
		true
	},
	use_oil_limit_help = {
		587273,
		254,
		true
	},
	formationScene_use_oil_limit_tip = {
		587527,
		117,
		true
	},
	index_awakening2 = {
		587644,
		130,
		true
	},
	index_upgrade = {
		587774,
		86,
		true
	},
	formationScene_use_oil_limit_enemy = {
		587860,
		104,
		true
	},
	formationScene_use_oil_limit_flagship = {
		587964,
		107,
		true
	},
	formationScene_use_oil_limit_submarine = {
		588071,
		108,
		true
	},
	formationScene_use_oil_limit_surface = {
		588179,
		106,
		true
	},
	formationScene_use_oil_limit_tip_worldboss = {
		588285,
		119,
		true
	},
	attr_durability = {
		588404,
		85,
		true
	},
	attr_armor = {
		588489,
		80,
		true
	},
	attr_reload = {
		588569,
		81,
		true
	},
	attr_cannon = {
		588650,
		81,
		true
	},
	attr_torpedo = {
		588731,
		82,
		true
	},
	attr_motion = {
		588813,
		81,
		true
	},
	attr_antiaircraft = {
		588894,
		87,
		true
	},
	attr_air = {
		588981,
		78,
		true
	},
	attr_hit = {
		589059,
		78,
		true
	},
	attr_antisub = {
		589137,
		82,
		true
	},
	attr_oxy_max = {
		589219,
		82,
		true
	},
	attr_ammo = {
		589301,
		82,
		true
	},
	attr_hunting_range = {
		589383,
		94,
		true
	},
	attr_luck = {
		589477,
		79,
		true
	},
	attr_consume = {
		589556,
		82,
		true
	},
	attr_speed = {
		589638,
		80,
		true
	},
	monthly_card_tip = {
		589718,
		103,
		true
	},
	shopping_error_time_limit = {
		589821,
		162,
		true
	},
	world_total_power = {
		589983,
		90,
		true
	},
	world_mileage = {
		590073,
		89,
		true
	},
	world_pressing = {
		590162,
		90,
		true
	},
	Settings_title_FPS = {
		590252,
		94,
		true
	},
	Settings_title_Notification = {
		590346,
		109,
		true
	},
	Settings_title_Other = {
		590455,
		96,
		true
	},
	Settings_title_LoginJP = {
		590551,
		95,
		true
	},
	Settings_title_Redeem = {
		590646,
		94,
		true
	},
	Settings_title_AdjustScr = {
		590740,
		103,
		true
	},
	Settings_title_Secpw = {
		590843,
		96,
		true
	},
	Settings_title_Secpwlimop = {
		590939,
		113,
		true
	},
	Settings_title_agreement = {
		591052,
		100,
		true
	},
	Settings_title_sound = {
		591152,
		96,
		true
	},
	Settings_title_resUpdate = {
		591248,
		100,
		true
	},
	equipment_info_change_tip = {
		591348,
		116,
		true
	},
	equipment_info_change_name_a = {
		591464,
		119,
		true
	},
	equipment_info_change_name_b = {
		591583,
		119,
		true
	},
	equipment_info_change_text_before = {
		591702,
		106,
		true
	},
	equipment_info_change_text_after = {
		591808,
		105,
		true
	},
	world_boss_progress_tip_title = {
		591913,
		117,
		true
	},
	world_boss_progress_tip_desc = {
		592030,
		286,
		true
	},
	ssss_main_help = {
		592316,
		1030,
		true
	},
	mini_game_time = {
		593346,
		88,
		true
	},
	mini_game_score = {
		593434,
		86,
		true
	},
	mini_game_leave = {
		593520,
		98,
		true
	},
	mini_game_pause = {
		593618,
		98,
		true
	},
	mini_game_cur_score = {
		593716,
		96,
		true
	},
	mini_game_high_score = {
		593812,
		97,
		true
	},
	monopoly_world_tip1 = {
		593909,
		104,
		true
	},
	monopoly_world_tip2 = {
		594013,
		213,
		true
	},
	monopoly_world_tip3 = {
		594226,
		183,
		true
	},
	help_monopoly_world = {
		594409,
		1446,
		true
	},
	ssssmedal_tip = {
		595855,
		185,
		true
	},
	ssssmedal_name = {
		596040,
		110,
		true
	},
	ssssmedal_belonging = {
		596150,
		115,
		true
	},
	ssssmedal_name1 = {
		596265,
		107,
		true
	},
	ssssmedal_name2 = {
		596372,
		107,
		true
	},
	ssssmedal_name3 = {
		596479,
		107,
		true
	},
	ssssmedal_name4 = {
		596586,
		107,
		true
	},
	ssssmedal_name5 = {
		596693,
		107,
		true
	},
	ssssmedal_name6 = {
		596800,
		88,
		true
	},
	ssssmedal_belonging1 = {
		596888,
		106,
		true
	},
	ssssmedal_belonging2 = {
		596994,
		106,
		true
	},
	ssssmedal_desc1 = {
		597100,
		161,
		true
	},
	ssssmedal_desc2 = {
		597261,
		173,
		true
	},
	ssssmedal_desc3 = {
		597434,
		179,
		true
	},
	ssssmedal_desc4 = {
		597613,
		182,
		true
	},
	ssssmedal_desc5 = {
		597795,
		185,
		true
	},
	ssssmedal_desc6 = {
		597980,
		155,
		true
	},
	show_fate_demand_count = {
		598135,
		140,
		true
	},
	show_design_demand_count = {
		598275,
		144,
		true
	},
	blueprint_select_overflow = {
		598419,
		107,
		true
	},
	blueprint_select_overflow_tip = {
		598526,
		175,
		true
	},
	blueprint_exchange_empty_tip = {
		598701,
		125,
		true
	},
	blueprint_exchange_select_display = {
		598826,
		124,
		true
	},
	build_rate_title = {
		598950,
		92,
		true
	},
	build_pools_intro = {
		599042,
		136,
		true
	},
	build_detail_intro = {
		599178,
		118,
		true
	},
	ssss_game_tip = {
		599296,
		2399,
		true
	},
	ssss_medal_tip = {
		601695,
		557,
		true
	},
	battlepass_main_tip_2112 = {
		602252,
		237,
		true
	},
	battlepass_main_help_2112 = {
		602489,
		2927,
		true
	},
	cruise_task_help_2112 = {
		605416,
		1225,
		true
	},
	littleSanDiego_npc = {
		606641,
		1044,
		true
	},
	tag_ship_unlocked = {
		607685,
		96,
		true
	},
	tag_ship_locked = {
		607781,
		94,
		true
	},
	acceleration_tips_1 = {
		607875,
		191,
		true
	},
	acceleration_tips_2 = {
		608066,
		197,
		true
	},
	noacceleration_tips = {
		608263,
		122,
		true
	},
	word_shipskin = {
		608385,
		83,
		true
	},
	settings_sound_title_bgm = {
		608468,
		101,
		true
	},
	settings_sound_title_effct = {
		608569,
		103,
		true
	},
	settings_sound_title_cv = {
		608672,
		100,
		true
	},
	setting_resdownload_title_gallery = {
		608772,
		115,
		true
	},
	setting_resdownload_title_live2d = {
		608887,
		114,
		true
	},
	setting_resdownload_title_music = {
		609001,
		113,
		true
	},
	setting_resdownload_title_sound = {
		609114,
		116,
		true
	},
	setting_resdownload_title_manga = {
		609230,
		113,
		true
	},
	setting_resdownload_title_dorm = {
		609343,
		112,
		true
	},
	setting_resdownload_title_main_group = {
		609455,
		118,
		true
	},
	settings_battle_title = {
		609573,
		97,
		true
	},
	settings_battle_tip = {
		609670,
		114,
		true
	},
	settings_battle_Btn_edit = {
		609784,
		95,
		true
	},
	settings_battle_Btn_reset = {
		609879,
		96,
		true
	},
	settings_battle_Btn_save = {
		609975,
		95,
		true
	},
	settings_battle_Btn_cancel = {
		610070,
		97,
		true
	},
	settings_pwd_label_close = {
		610167,
		94,
		true
	},
	settings_pwd_label_open = {
		610261,
		93,
		true
	},
	word_frame = {
		610354,
		77,
		true
	},
	Settings_title_Redeem_input_label = {
		610431,
		113,
		true
	},
	Settings_title_Redeem_input_submit = {
		610544,
		105,
		true
	},
	Settings_title_Redeem_input_placeholder = {
		610649,
		127,
		true
	},
	CurlingGame_tips1 = {
		610776,
		937,
		true
	},
	maid_task_tips1 = {
		611713,
		584,
		true
	},
	shop_diamond_title = {
		612297,
		94,
		true
	},
	shop_gift_title = {
		612391,
		91,
		true
	},
	shop_item_title = {
		612482,
		91,
		true
	},
	shop_charge_level_limit = {
		612573,
		96,
		true
	},
	backhill_cantupbuilding = {
		612669,
		149,
		true
	},
	pray_cant_tips = {
		612818,
		139,
		true
	},
	help_xinnian2022_feast = {
		612957,
		688,
		true
	},
	Pray_activity_tips1 = {
		613645,
		1325,
		true
	},
	backhill_notenoughbuilding = {
		614970,
		219,
		true
	},
	help_xinnian2022_z28 = {
		615189,
		690,
		true
	},
	help_xinnian2022_firework = {
		615879,
		1229,
		true
	},
	player_manifesto_placeholder = {
		617108,
		113,
		true
	},
	box_ship_del_click = {
		617221,
		94,
		true
	},
	box_equipment_del_click = {
		617315,
		99,
		true
	},
	change_player_name_title = {
		617414,
		100,
		true
	},
	change_player_name_subtitle = {
		617514,
		106,
		true
	},
	change_player_name_input_tip = {
		617620,
		104,
		true
	},
	change_player_name_illegal = {
		617724,
		179,
		true
	},
	nodisplay_player_home_name = {
		617903,
		96,
		true
	},
	nodisplay_player_home_share = {
		617999,
		112,
		true
	},
	tactics_class_start = {
		618111,
		95,
		true
	},
	tactics_class_cancel = {
		618206,
		90,
		true
	},
	tactics_class_get_exp = {
		618296,
		103,
		true
	},
	tactics_class_spend_time = {
		618399,
		100,
		true
	},
	build_ticket_description = {
		618499,
		112,
		true
	},
	build_ticket_expire_warning = {
		618611,
		107,
		true
	},
	tip_build_ticket_expired = {
		618718,
		130,
		true
	},
	tip_build_ticket_exchange_expired = {
		618848,
		142,
		true
	},
	tip_build_ticket_not_enough = {
		618990,
		111,
		true
	},
	build_ship_tip_use_ticket = {
		619101,
		177,
		true
	},
	springfes_tips1 = {
		619278,
		914,
		true
	},
	worldinpicture_tavel_point_tip = {
		620192,
		112,
		true
	},
	worldinpicture_draw_point_tip = {
		620304,
		111,
		true
	},
	worldinpicture_help = {
		620415,
		661,
		true
	},
	worldinpicture_task_help = {
		621076,
		666,
		true
	},
	worldinpicture_not_area_can_draw = {
		621742,
		123,
		true
	},
	missile_attack_area_confirm = {
		621865,
		103,
		true
	},
	missile_attack_area_cancel = {
		621968,
		102,
		true
	},
	shipchange_alert_infleet = {
		622070,
		143,
		true
	},
	shipchange_alert_inpvp = {
		622213,
		147,
		true
	},
	shipchange_alert_inexercise = {
		622360,
		152,
		true
	},
	shipchange_alert_inworld = {
		622512,
		149,
		true
	},
	shipchange_alert_inguildbossevent = {
		622661,
		159,
		true
	},
	shipchange_alert_indiff = {
		622820,
		148,
		true
	},
	shipmodechange_reject_1stfleet_only = {
		622968,
		188,
		true
	},
	shipmodechange_reject_worldfleet_only = {
		623156,
		193,
		true
	},
	monopoly3thre_tip = {
		623349,
		133,
		true
	},
	fushun_game3_tip = {
		623482,
		974,
		true
	},
	battlepass_main_tip_2202 = {
		624456,
		236,
		true
	},
	battlepass_main_help_2202 = {
		624692,
		2928,
		true
	},
	cruise_task_help_2202 = {
		627620,
		1224,
		true
	},
	battlepass_main_tip_2204 = {
		628844,
		236,
		true
	},
	battlepass_main_help_2204 = {
		629080,
		2919,
		true
	},
	cruise_task_help_2204 = {
		631999,
		1224,
		true
	},
	battlepass_main_tip_2206 = {
		633223,
		242,
		true
	},
	battlepass_main_help_2206 = {
		633465,
		2931,
		true
	},
	cruise_task_help_2206 = {
		636396,
		1224,
		true
	},
	battlepass_main_tip_2208 = {
		637620,
		242,
		true
	},
	battlepass_main_help_2208 = {
		637862,
		2928,
		true
	},
	cruise_task_help_2208 = {
		640790,
		1224,
		true
	},
	battlepass_main_tip_2210 = {
		642014,
		241,
		true
	},
	battlepass_main_help_2210 = {
		642255,
		2945,
		true
	},
	cruise_task_help_2210 = {
		645200,
		1226,
		true
	},
	battlepass_main_tip_2212 = {
		646426,
		246,
		true
	},
	battlepass_main_help_2212 = {
		646672,
		2933,
		true
	},
	cruise_task_help_2212 = {
		649605,
		1225,
		true
	},
	battlepass_main_tip_2302 = {
		650830,
		245,
		true
	},
	battlepass_main_help_2302 = {
		651075,
		2928,
		true
	},
	cruise_task_help_2302 = {
		654003,
		1225,
		true
	},
	battlepass_main_tip_2304 = {
		655228,
		243,
		true
	},
	battlepass_main_help_2304 = {
		655471,
		2954,
		true
	},
	cruise_task_help_2304 = {
		658425,
		1225,
		true
	},
	battlepass_main_tip_2306 = {
		659650,
		232,
		true
	},
	battlepass_main_help_2306 = {
		659882,
		2919,
		true
	},
	cruise_task_help_2306 = {
		662801,
		1225,
		true
	},
	battlepass_main_tip_2308 = {
		664026,
		226,
		true
	},
	battlepass_main_help_2308 = {
		664252,
		2922,
		true
	},
	cruise_task_help_2308 = {
		667174,
		1225,
		true
	},
	battlepass_main_tip_2310 = {
		668399,
		237,
		true
	},
	battlepass_main_help_2310 = {
		668636,
		2942,
		true
	},
	cruise_task_help_2310 = {
		671578,
		1226,
		true
	},
	battlepass_main_tip_2312 = {
		672804,
		243,
		true
	},
	battlepass_main_help_2312 = {
		673047,
		2922,
		true
	},
	cruise_task_help_2312 = {
		675969,
		1226,
		true
	},
	battlepass_main_tip_2402 = {
		677195,
		242,
		true
	},
	battlepass_main_help_2402 = {
		677437,
		2928,
		true
	},
	cruise_task_help_2402 = {
		680365,
		1225,
		true
	},
	battlepass_main_tip_2404 = {
		681590,
		242,
		true
	},
	battlepass_main_help_2404 = {
		681832,
		2925,
		true
	},
	cruise_task_help_2404 = {
		684757,
		1225,
		true
	},
	attrset_reset = {
		685982,
		89,
		true
	},
	attrset_save = {
		686071,
		88,
		true
	},
	attrset_ask_save = {
		686159,
		111,
		true
	},
	attrset_save_success = {
		686270,
		96,
		true
	},
	attrset_disable = {
		686366,
		134,
		true
	},
	attrset_input_ill = {
		686500,
		96,
		true
	},
	blackfriday_help = {
		686596,
		458,
		true
	},
	eventshop_time_hint = {
		687054,
		112,
		true
	},
	purchase_backyard_theme_desc_for_onekey = {
		687166,
		144,
		true
	},
	purchase_backyard_theme_desc_for_all = {
		687310,
		158,
		true
	},
	sp_no_quota = {
		687468,
		113,
		true
	},
	fur_all_buy = {
		687581,
		87,
		true
	},
	fur_onekey_buy = {
		687668,
		90,
		true
	},
	littleRenown_npc = {
		687758,
		1040,
		true
	},
	tech_package_tip = {
		688798,
		209,
		true
	},
	backyard_food_shop_tip = {
		689007,
		101,
		true
	},
	dorm_2f_lock = {
		689108,
		85,
		true
	},
	word_get_way = {
		689193,
		89,
		true
	},
	word_get_date = {
		689282,
		90,
		true
	},
	enter_theme_name = {
		689372,
		95,
		true
	},
	enter_extend_food_label = {
		689467,
		93,
		true
	},
	backyard_extend_tip_1 = {
		689560,
		103,
		true
	},
	backyard_extend_tip_2 = {
		689663,
		104,
		true
	},
	backyard_extend_tip_3 = {
		689767,
		109,
		true
	},
	backyard_extend_tip_4 = {
		689876,
		89,
		true
	},
	levelScene_remaster_story_tip = {
		689965,
		160,
		true
	},
	levelScene_remaster_unlock_tip = {
		690125,
		146,
		true
	},
	level_remaster_tip1 = {
		690271,
		98,
		true
	},
	level_remaster_tip2 = {
		690369,
		89,
		true
	},
	level_remaster_tip3 = {
		690458,
		89,
		true
	},
	level_remaster_tip4 = {
		690547,
		109,
		true
	},
	newserver_time = {
		690656,
		88,
		true
	},
	newserver_soldout = {
		690744,
		96,
		true
	},
	skill_learn_tip = {
		690840,
		133,
		true
	},
	newserver_build_tip = {
		690973,
		132,
		true
	},
	build_count_tip = {
		691105,
		85,
		true
	},
	help_research_package = {
		691190,
		299,
		true
	},
	lv70_package_tip = {
		691489,
		251,
		true
	},
	tech_select_tip1 = {
		691740,
		101,
		true
	},
	tech_select_tip2 = {
		691841,
		149,
		true
	},
	tech_select_tip3 = {
		691990,
		89,
		true
	},
	tech_select_tip4 = {
		692079,
		98,
		true
	},
	tech_select_tip5 = {
		692177,
		110,
		true
	},
	techpackage_item_use = {
		692287,
		253,
		true
	},
	techpackage_item_use_1 = {
		692540,
		168,
		true
	},
	techpackage_item_use_2 = {
		692708,
		196,
		true
	},
	techpackage_item_use_confirm = {
		692904,
		147,
		true
	},
	new_server_shop_sel_goods_tip = {
		693051,
		123,
		true
	},
	new_server_shop_unopen_tip = {
		693174,
		102,
		true
	},
	newserver_activity_tip = {
		693276,
		1419,
		true
	},
	newserver_shop_timelimit = {
		694695,
		114,
		true
	},
	tech_character_get = {
		694809,
		97,
		true
	},
	package_detail_tip = {
		694906,
		94,
		true
	},
	event_ui_consume = {
		695000,
		87,
		true
	},
	event_ui_recommend = {
		695087,
		88,
		true
	},
	event_ui_start = {
		695175,
		84,
		true
	},
	event_ui_giveup = {
		695259,
		85,
		true
	},
	event_ui_finish = {
		695344,
		85,
		true
	},
	nav_tactics_sel_skill_title = {
		695429,
		103,
		true
	},
	battle_result_confirm = {
		695532,
		91,
		true
	},
	battle_result_targets = {
		695623,
		97,
		true
	},
	battle_result_continue = {
		695720,
		98,
		true
	},
	index_L2D = {
		695818,
		76,
		true
	},
	index_DBG = {
		695894,
		85,
		true
	},
	index_BG = {
		695979,
		84,
		true
	},
	index_CANTUSE = {
		696063,
		89,
		true
	},
	index_UNUSE = {
		696152,
		84,
		true
	},
	index_BGM = {
		696236,
		85,
		true
	},
	without_ship_to_wear = {
		696321,
		108,
		true
	},
	choose_ship_to_wear_this_skin = {
		696429,
		123,
		true
	},
	skinatlas_search_holder = {
		696552,
		114,
		true
	},
	skinatlas_search_result_is_empty = {
		696666,
		126,
		true
	},
	chang_ship_skin_window_title = {
		696792,
		98,
		true
	},
	world_boss_item_info = {
		696890,
		364,
		true
	},
	world_past_boss_item_info = {
		697254,
		383,
		true
	},
	world_boss_lefttime = {
		697637,
		88,
		true
	},
	world_boss_item_count_noenough = {
		697725,
		118,
		true
	},
	world_boss_item_usage_tip = {
		697843,
		144,
		true
	},
	world_boss_no_select_archives = {
		697987,
		130,
		true
	},
	world_boss_archives_item_count_noenough = {
		698117,
		127,
		true
	},
	world_boss_archives_are_clear = {
		698244,
		115,
		true
	},
	world_boss_switch_archives = {
		698359,
		187,
		true
	},
	world_boss_switch_archives_success = {
		698546,
		150,
		true
	},
	world_boss_archives_auto_battle_unopen = {
		698696,
		148,
		true
	},
	world_boss_archives_need_stop_auto_battle = {
		698844,
		148,
		true
	},
	world_boss_archives_stop_auto_battle = {
		698992,
		112,
		true
	},
	world_boss_archives_continue_auto_battle = {
		699104,
		116,
		true
	},
	world_boss_archives_auto_battle_reusle_title = {
		699220,
		126,
		true
	},
	world_boss_archives_stop_auto_battle_title = {
		699346,
		127,
		true
	},
	world_boss_archives_stop_auto_battle_tip = {
		699473,
		119,
		true
	},
	world_boss_archives_stop_auto_battle_tip1 = {
		699592,
		177,
		true
	},
	world_archives_boss_help = {
		699769,
		2774,
		true
	},
	world_archives_boss_list_help = {
		702543,
		438,
		true
	},
	archives_boss_was_opened = {
		702981,
		158,
		true
	},
	current_boss_was_opened = {
		703139,
		157,
		true
	},
	world_boss_title_auto_battle = {
		703296,
		104,
		true
	},
	world_boss_title_highest_damge = {
		703400,
		106,
		true
	},
	world_boss_title_estimation = {
		703506,
		115,
		true
	},
	world_boss_title_battle_cnt = {
		703621,
		103,
		true
	},
	world_boss_title_consume_oil_cnt = {
		703724,
		108,
		true
	},
	world_boss_title_spend_time = {
		703832,
		103,
		true
	},
	world_boss_title_total_damage = {
		703935,
		102,
		true
	},
	world_no_time_to_auto_battle = {
		704037,
		125,
		true
	},
	world_boss_current_boss_label = {
		704162,
		108,
		true
	},
	world_boss_current_boss_label1 = {
		704270,
		106,
		true
	},
	world_boss_archives_boss_tip = {
		704376,
		144,
		true
	},
	world_boss_progress_no_enough = {
		704520,
		111,
		true
	},
	world_boss_auto_battle_no_oil = {
		704631,
		120,
		true
	},
	meta_syn_value_label = {
		704751,
		99,
		true
	},
	meta_syn_finish = {
		704850,
		97,
		true
	},
	index_meta_repair = {
		704947,
		96,
		true
	},
	index_meta_tactics = {
		705043,
		97,
		true
	},
	index_meta_energy = {
		705140,
		96,
		true
	},
	tactics_continue_to_learn_other_skill = {
		705236,
		138,
		true
	},
	tactics_continue_to_learn_other_ship_skill = {
		705374,
		176,
		true
	},
	tactics_no_recent_ships = {
		705550,
		111,
		true
	},
	activity_kill = {
		705661,
		89,
		true
	},
	battle_result_dmg = {
		705750,
		87,
		true
	},
	battle_result_kill_count = {
		705837,
		94,
		true
	},
	battle_result_toggle_on = {
		705931,
		102,
		true
	},
	battle_result_toggle_off = {
		706033,
		103,
		true
	},
	battle_result_continue_battle = {
		706136,
		108,
		true
	},
	battle_result_quit_battle = {
		706244,
		104,
		true
	},
	battle_result_share_battle = {
		706348,
		105,
		true
	},
	pre_combat_team = {
		706453,
		91,
		true
	},
	pre_combat_vanguard = {
		706544,
		95,
		true
	},
	pre_combat_main = {
		706639,
		91,
		true
	},
	pre_combat_submarine = {
		706730,
		96,
		true
	},
	pre_combat_targets = {
		706826,
		88,
		true
	},
	pre_combat_atlasloot = {
		706914,
		90,
		true
	},
	destroy_confirm_access = {
		707004,
		93,
		true
	},
	destroy_confirm_cancel = {
		707097,
		93,
		true
	},
	pt_count_tip = {
		707190,
		82,
		true
	},
	dockyard_data_loss_detected = {
		707272,
		140,
		true
	},
	littleEugen_npc = {
		707412,
		1035,
		true
	},
	five_shujuhuigu = {
		708447,
		91,
		true
	},
	five_shujuhuigu1 = {
		708538,
		91,
		true
	},
	littleChaijun_npc = {
		708629,
		1017,
		true
	},
	five_qingdian = {
		709646,
		684,
		true
	},
	friend_resume_title_detail = {
		710330,
		102,
		true
	},
	item_type13_tip1 = {
		710432,
		92,
		true
	},
	item_type13_tip2 = {
		710524,
		92,
		true
	},
	item_type16_tip1 = {
		710616,
		92,
		true
	},
	item_type16_tip2 = {
		710708,
		92,
		true
	},
	item_type17_tip1 = {
		710800,
		92,
		true
	},
	item_type17_tip2 = {
		710892,
		92,
		true
	},
	five_duomaomao = {
		710984,
		816,
		true
	},
	main_4 = {
		711800,
		82,
		true
	},
	main_5 = {
		711882,
		82,
		true
	},
	honor_medal_support_tips_display = {
		711964,
		448,
		true
	},
	honor_medal_support_tips_confirm = {
		712412,
		213,
		true
	},
	support_rate_title = {
		712625,
		94,
		true
	},
	support_times_limited = {
		712719,
		121,
		true
	},
	support_times_tip = {
		712840,
		93,
		true
	},
	build_times_tip = {
		712933,
		91,
		true
	},
	tactics_recent_ship_label = {
		713024,
		101,
		true
	},
	title_info = {
		713125,
		80,
		true
	},
	eventshop_unlock_info = {
		713205,
		93,
		true
	},
	eventshop_unlock_hint = {
		713298,
		117,
		true
	},
	commission_event_tip = {
		713415,
		765,
		true
	},
	decoration_medal_placeholder = {
		714180,
		116,
		true
	},
	technology_filter_placeholder = {
		714296,
		114,
		true
	},
	eva_comment_send_null = {
		714410,
		100,
		true
	},
	report_sent_thank = {
		714510,
		154,
		true
	},
	report_ship_cannot_comment = {
		714664,
		117,
		true
	},
	report_cannot_comment = {
		714781,
		137,
		true
	},
	report_sent_title = {
		714918,
		87,
		true
	},
	report_sent_desc = {
		715005,
		113,
		true
	},
	report_type_1 = {
		715118,
		89,
		true
	},
	report_type_1_1 = {
		715207,
		100,
		true
	},
	report_type_2 = {
		715307,
		89,
		true
	},
	report_type_2_1 = {
		715396,
		100,
		true
	},
	report_type_3 = {
		715496,
		89,
		true
	},
	report_type_3_1 = {
		715585,
		100,
		true
	},
	report_type_other = {
		715685,
		87,
		true
	},
	report_type_other_1 = {
		715772,
		125,
		true
	},
	report_type_other_2 = {
		715897,
		107,
		true
	},
	report_sent_help = {
		716004,
		431,
		true
	},
	rename_input = {
		716435,
		88,
		true
	},
	avatar_task_level = {
		716523,
		125,
		true
	},
	avatar_upgrad_1 = {
		716648,
		94,
		true
	},
	avatar_upgrad_2 = {
		716742,
		94,
		true
	},
	avatar_upgrad_3 = {
		716836,
		85,
		true
	},
	avatar_task_ship_1 = {
		716921,
		102,
		true
	},
	avatar_task_ship_2 = {
		717023,
		105,
		true
	},
	technology_queue_complete = {
		717128,
		101,
		true
	},
	technology_queue_processing = {
		717229,
		100,
		true
	},
	technology_queue_waiting = {
		717329,
		100,
		true
	},
	technology_queue_getaward = {
		717429,
		101,
		true
	},
	technology_daily_refresh = {
		717530,
		110,
		true
	},
	technology_queue_full = {
		717640,
		118,
		true
	},
	technology_queue_in_mission_incomplete = {
		717758,
		151,
		true
	},
	technology_consume = {
		717909,
		94,
		true
	},
	technology_request = {
		718003,
		100,
		true
	},
	technology_queue_in_doublecheck = {
		718103,
		201,
		true
	},
	playervtae_setting_btn_label = {
		718304,
		104,
		true
	},
	technology_queue_in_success = {
		718408,
		109,
		true
	},
	star_require_enemy_text = {
		718517,
		135,
		true
	},
	star_require_enemy_title = {
		718652,
		106,
		true
	},
	star_require_enemy_check = {
		718758,
		94,
		true
	},
	worldboss_rank_timer_label = {
		718852,
		118,
		true
	},
	technology_detail = {
		718970,
		93,
		true
	},
	technology_mission_unfinish = {
		719063,
		106,
		true
	},
	word_chinese = {
		719169,
		82,
		true
	},
	word_japanese_2 = {
		719251,
		86,
		true
	},
	word_japanese = {
		719337,
		83,
		true
	},
	avatarframe_got = {
		719420,
		88,
		true
	},
	item_is_max_cnt = {
		719508,
		103,
		true
	},
	level_fleet_ship_desc = {
		719611,
		106,
		true
	},
	level_fleet_sub_desc = {
		719717,
		102,
		true
	},
	summerland_tip = {
		719819,
		375,
		true
	},
	icecreamgame_tip = {
		720194,
		1431,
		true
	},
	unlock_date_tip = {
		721625,
		118,
		true
	},
	guild_duty_shoule_be_deputy_commander = {
		721743,
		147,
		true
	},
	guild_deputy_commander_cnt_is_full = {
		721890,
		134,
		true
	},
	guild_deputy_commander_cnt = {
		722024,
		154,
		true
	},
	mail_filter_placeholder = {
		722178,
		105,
		true
	},
	recently_sticker_placeholder = {
		722283,
		110,
		true
	},
	backhill_campusfestival_tip = {
		722393,
		1085,
		true
	},
	mini_cookgametip = {
		723478,
		717,
		true
	},
	cook_game_Albacore = {
		724195,
		103,
		true
	},
	cook_game_august = {
		724298,
		98,
		true
	},
	cook_game_elbe = {
		724396,
		99,
		true
	},
	cook_game_hakuryu = {
		724495,
		120,
		true
	},
	cook_game_howe = {
		724615,
		124,
		true
	},
	cook_game_marcopolo = {
		724739,
		107,
		true
	},
	cook_game_noshiro = {
		724846,
		106,
		true
	},
	cook_game_pnelope = {
		724952,
		118,
		true
	},
	cook_game_laffey = {
		725070,
		127,
		true
	},
	cook_game_janus = {
		725197,
		131,
		true
	},
	cook_game_flandre = {
		725328,
		111,
		true
	},
	cook_game_constellation = {
		725439,
		165,
		true
	},
	cook_game_constellation_skill_name = {
		725604,
		146,
		true
	},
	cook_game_constellation_skill_desc = {
		725750,
		233,
		true
	},
	random_ship_on = {
		725983,
		108,
		true
	},
	random_ship_off_0 = {
		726091,
		154,
		true
	},
	random_ship_off = {
		726245,
		137,
		true
	},
	random_ship_forbidden = {
		726382,
		155,
		true
	},
	random_ship_now = {
		726537,
		97,
		true
	},
	random_ship_label = {
		726634,
		96,
		true
	},
	player_vitae_skin_setting = {
		726730,
		107,
		true
	},
	random_ship_tips1 = {
		726837,
		133,
		true
	},
	random_ship_tips2 = {
		726970,
		120,
		true
	},
	random_ship_before = {
		727090,
		103,
		true
	},
	random_ship_and_skin_title = {
		727193,
		117,
		true
	},
	random_ship_frequse_mode = {
		727310,
		100,
		true
	},
	random_ship_locked_mode = {
		727410,
		102,
		true
	},
	littleSpee_npc = {
		727512,
		1185,
		true
	},
	random_flag_ship = {
		728697,
		95,
		true
	},
	random_flag_ship_changskinBtn_label = {
		728792,
		111,
		true
	},
	expedition_drop_use_out = {
		728903,
		133,
		true
	},
	expedition_extra_drop_tip = {
		729036,
		110,
		true
	},
	ex_pass_use = {
		729146,
		81,
		true
	},
	defense_formation_tip_npc = {
		729227,
		183,
		true
	},
	word_item = {
		729410,
		79,
		true
	},
	word_tool = {
		729489,
		79,
		true
	},
	word_other = {
		729568,
		80,
		true
	},
	ryza_word_equip = {
		729648,
		85,
		true
	},
	ryza_rest_produce_count = {
		729733,
		113,
		true
	},
	ryza_composite_confirm = {
		729846,
		115,
		true
	},
	ryza_composite_confirm_single = {
		729961,
		117,
		true
	},
	ryza_composite_count = {
		730078,
		99,
		true
	},
	ryza_toggle_only_composite = {
		730177,
		108,
		true
	},
	ryza_tip_select_recipe = {
		730285,
		122,
		true
	},
	ryza_tip_put_materials = {
		730407,
		126,
		true
	},
	ryza_tip_composite_unlock = {
		730533,
		131,
		true
	},
	ryza_tip_unlock_all_tools = {
		730664,
		128,
		true
	},
	ryza_material_not_enough = {
		730792,
		143,
		true
	},
	ryza_tip_composite_invalid = {
		730935,
		126,
		true
	},
	ryza_tip_max_composite_count = {
		731061,
		128,
		true
	},
	ryza_tip_no_item = {
		731189,
		106,
		true
	},
	ryza_ui_show_acess = {
		731295,
		101,
		true
	},
	ryza_tip_no_recipe = {
		731396,
		105,
		true
	},
	ryza_tip_item_access = {
		731501,
		123,
		true
	},
	ryza_tip_control_buff_not_obtain_tip = {
		731624,
		131,
		true
	},
	ryza_tip_control_buff_upgrade = {
		731755,
		99,
		true
	},
	ryza_tip_control_buff_replace = {
		731854,
		99,
		true
	},
	ryza_tip_control_buff_limit = {
		731953,
		103,
		true
	},
	ryza_tip_control_buff_already_active_tip = {
		732056,
		113,
		true
	},
	ryza_tip_control_buff = {
		732169,
		125,
		true
	},
	ryza_tip_control_buff_not_obtain = {
		732294,
		105,
		true
	},
	ryza_tip_control = {
		732399,
		132,
		true
	},
	ryza_tip_main = {
		732531,
		1118,
		true
	},
	battle_levelScene_ryza_lock = {
		733649,
		163,
		true
	},
	ryza_tip_toast_item_got = {
		733812,
		99,
		true
	},
	ryza_composite_help_tip = {
		733911,
		476,
		true
	},
	ryza_control_help_tip = {
		734387,
		296,
		true
	},
	ryza_mini_game = {
		734683,
		351,
		true
	},
	ryza_task_level_desc = {
		735034,
		96,
		true
	},
	ryza_task_tag_explore = {
		735130,
		91,
		true
	},
	ryza_task_tag_battle = {
		735221,
		90,
		true
	},
	ryza_task_tag_dalegate = {
		735311,
		92,
		true
	},
	ryza_task_tag_develop = {
		735403,
		91,
		true
	},
	ryza_task_tag_adventure = {
		735494,
		93,
		true
	},
	ryza_task_tag_build = {
		735587,
		89,
		true
	},
	ryza_task_tag_create = {
		735676,
		90,
		true
	},
	ryza_task_tag_daily = {
		735766,
		89,
		true
	},
	ryza_task_detail_content = {
		735855,
		94,
		true
	},
	ryza_task_detail_award = {
		735949,
		92,
		true
	},
	ryza_task_go = {
		736041,
		82,
		true
	},
	ryza_task_get = {
		736123,
		83,
		true
	},
	ryza_task_get_all = {
		736206,
		93,
		true
	},
	ryza_task_confirm = {
		736299,
		87,
		true
	},
	ryza_task_cancel = {
		736386,
		86,
		true
	},
	ryza_task_level_num = {
		736472,
		95,
		true
	},
	ryza_task_level_add = {
		736567,
		95,
		true
	},
	ryza_task_submit = {
		736662,
		86,
		true
	},
	ryza_task_detail = {
		736748,
		86,
		true
	},
	ryza_composite_words = {
		736834,
		707,
		true
	},
	ryza_task_help_tip = {
		737541,
		345,
		true
	},
	hotspring_buff = {
		737886,
		127,
		true
	},
	random_ship_custom_mode_empty = {
		738013,
		157,
		true
	},
	random_ship_custom_mode_main_button_add = {
		738170,
		109,
		true
	},
	random_ship_custom_mode_main_button_remove = {
		738279,
		112,
		true
	},
	random_ship_custom_mode_main_tip1 = {
		738391,
		140,
		true
	},
	random_ship_custom_mode_main_tip2 = {
		738531,
		112,
		true
	},
	random_ship_custom_mode_main_empty = {
		738643,
		128,
		true
	},
	random_ship_custom_mode_select_all = {
		738771,
		110,
		true
	},
	random_ship_custom_mode_add_tip1 = {
		738881,
		133,
		true
	},
	random_ship_custom_mode_select_number = {
		739014,
		113,
		true
	},
	random_ship_custom_mode_add_complete = {
		739127,
		118,
		true
	},
	random_ship_custom_mode_add_tip2 = {
		739245,
		139,
		true
	},
	random_ship_custom_mode_remove_tip1 = {
		739384,
		139,
		true
	},
	random_ship_custom_mode_remove_complete = {
		739523,
		121,
		true
	},
	random_ship_custom_mode_remove_tip2 = {
		739644,
		142,
		true
	},
	index_dressed = {
		739786,
		86,
		true
	},
	random_ship_custom_mode = {
		739872,
		111,
		true
	},
	random_ship_custom_mode_add_title = {
		739983,
		109,
		true
	},
	random_ship_custom_mode_remove_title = {
		740092,
		112,
		true
	},
	hotspring_shop_enter1 = {
		740204,
		149,
		true
	},
	hotspring_shop_enter2 = {
		740353,
		159,
		true
	},
	hotspring_shop_insufficient = {
		740512,
		166,
		true
	},
	hotspring_shop_success1 = {
		740678,
		103,
		true
	},
	hotspring_shop_success2 = {
		740781,
		112,
		true
	},
	hotspring_shop_finish = {
		740893,
		155,
		true
	},
	hotspring_shop_end = {
		741048,
		166,
		true
	},
	hotspring_shop_touch1 = {
		741214,
		121,
		true
	},
	hotspring_shop_touch2 = {
		741335,
		140,
		true
	},
	hotspring_shop_touch3 = {
		741475,
		131,
		true
	},
	hotspring_shop_exchanged = {
		741606,
		151,
		true
	},
	hotspring_shop_exchange = {
		741757,
		167,
		true
	},
	hotspring_tip1 = {
		741924,
		130,
		true
	},
	hotspring_tip2 = {
		742054,
		94,
		true
	},
	hotspring_help = {
		742148,
		525,
		true
	},
	hotspring_expand = {
		742673,
		150,
		true
	},
	hotspring_shop_help = {
		742823,
		387,
		true
	},
	resorts_help = {
		743210,
		585,
		true
	},
	pvzminigame_help = {
		743795,
		1204,
		true
	},
	tips_yuandanhuoyue2023 = {
		744999,
		658,
		true
	},
	beach_guard_chaijun = {
		745657,
		144,
		true
	},
	beach_guard_jianye = {
		745801,
		155,
		true
	},
	beach_guard_lituoliao = {
		745956,
		243,
		true
	},
	beach_guard_bominghan = {
		746199,
		231,
		true
	},
	beach_guard_nengdai = {
		746430,
		262,
		true
	},
	beach_guard_m_craft = {
		746692,
		119,
		true
	},
	beach_guard_m_atk = {
		746811,
		114,
		true
	},
	beach_guard_m_guard = {
		746925,
		113,
		true
	},
	beach_guard_m_craft_name = {
		747038,
		97,
		true
	},
	beach_guard_m_atk_name = {
		747135,
		95,
		true
	},
	beach_guard_m_guard_name = {
		747230,
		97,
		true
	},
	beach_guard_e1 = {
		747327,
		87,
		true
	},
	beach_guard_e2 = {
		747414,
		87,
		true
	},
	beach_guard_e3 = {
		747501,
		87,
		true
	},
	beach_guard_e4 = {
		747588,
		87,
		true
	},
	beach_guard_e5 = {
		747675,
		87,
		true
	},
	beach_guard_e6 = {
		747762,
		87,
		true
	},
	beach_guard_e7 = {
		747849,
		87,
		true
	},
	beach_guard_e1_desc = {
		747936,
		144,
		true
	},
	beach_guard_e2_desc = {
		748080,
		144,
		true
	},
	beach_guard_e3_desc = {
		748224,
		144,
		true
	},
	beach_guard_e4_desc = {
		748368,
		159,
		true
	},
	beach_guard_e5_desc = {
		748527,
		159,
		true
	},
	beach_guard_e6_desc = {
		748686,
		266,
		true
	},
	beach_guard_e7_desc = {
		748952,
		156,
		true
	},
	ninghai_nianye = {
		749108,
		127,
		true
	},
	yingrui_nianye = {
		749235,
		128,
		true
	},
	zhaohe_nianye = {
		749363,
		135,
		true
	},
	zhenhai_nianye = {
		749498,
		143,
		true
	},
	haitian_nianye = {
		749641,
		154,
		true
	},
	taiyuan_nianye = {
		749795,
		139,
		true
	},
	yixian_nianye = {
		749934,
		144,
		true
	},
	activity_yanhua_tip1 = {
		750078,
		90,
		true
	},
	activity_yanhua_tip2 = {
		750168,
		105,
		true
	},
	activity_yanhua_tip3 = {
		750273,
		105,
		true
	},
	activity_yanhua_tip4 = {
		750378,
		122,
		true
	},
	activity_yanhua_tip5 = {
		750500,
		103,
		true
	},
	activity_yanhua_tip6 = {
		750603,
		112,
		true
	},
	activity_yanhua_tip7 = {
		750715,
		133,
		true
	},
	activity_yanhua_tip8 = {
		750848,
		99,
		true
	},
	help_chunjie2023 = {
		750947,
		1175,
		true
	},
	sevenday_nianye = {
		752122,
		277,
		true
	},
	tip_nianye = {
		752399,
		106,
		true
	},
	couplete_activty_desc = {
		752505,
		348,
		true
	},
	couplete_click_desc = {
		752853,
		125,
		true
	},
	couplet_index_desc = {
		752978,
		90,
		true
	},
	couplete_help = {
		753068,
		862,
		true
	},
	couplete_drag_tip = {
		753930,
		112,
		true
	},
	couplete_remind = {
		754042,
		109,
		true
	},
	couplete_complete = {
		754151,
		139,
		true
	},
	couplete_enter = {
		754290,
		114,
		true
	},
	couplete_stay = {
		754404,
		107,
		true
	},
	couplete_task = {
		754511,
		123,
		true
	},
	couplete_pass_1 = {
		754634,
		104,
		true
	},
	couplete_pass_2 = {
		754738,
		110,
		true
	},
	couplete_fail_1 = {
		754848,
		121,
		true
	},
	couplete_fail_2 = {
		754969,
		112,
		true
	},
	couplete_pair_1 = {
		755081,
		100,
		true
	},
	couplete_pair_2 = {
		755181,
		100,
		true
	},
	couplete_pair_3 = {
		755281,
		100,
		true
	},
	couplete_pair_4 = {
		755381,
		100,
		true
	},
	couplete_pair_5 = {
		755481,
		100,
		true
	},
	couplete_pair_6 = {
		755581,
		100,
		true
	},
	couplete_pair_7 = {
		755681,
		100,
		true
	},
	["2023spring_minigame_item_lantern"] = {
		755781,
		186,
		true
	},
	["2023spring_minigame_item_firecracker"] = {
		755967,
		181,
		true
	},
	["2023spring_minigame_skill_icewall"] = {
		756148,
		141,
		true
	},
	["2023spring_minigame_skill_icewall_up"] = {
		756289,
		197,
		true
	},
	["2023spring_minigame_skill_sprint"] = {
		756486,
		137,
		true
	},
	["2023spring_minigame_skill_sprint_up"] = {
		756623,
		190,
		true
	},
	["2023spring_minigame_skill_flash"] = {
		756813,
		169,
		true
	},
	["2023spring_minigame_skill_flash_up"] = {
		756982,
		177,
		true
	},
	["2023spring_minigame_bless_speed"] = {
		757159,
		126,
		true
	},
	["2023spring_minigame_bless_speed_up"] = {
		757285,
		164,
		true
	},
	["2023spring_minigame_bless_substitute"] = {
		757449,
		188,
		true
	},
	["2023spring_minigame_bless_substitute_up"] = {
		757637,
		115,
		true
	},
	["2023spring_minigame_nenjuu_skill1"] = {
		757752,
		180,
		true
	},
	["2023spring_minigame_nenjuu_skill2"] = {
		757932,
		132,
		true
	},
	["2023spring_minigame_nenjuu_skill3"] = {
		758064,
		133,
		true
	},
	["2023spring_minigame_nenjuu_skill4"] = {
		758197,
		132,
		true
	},
	["2023spring_minigame_nenjuu_skill5"] = {
		758329,
		186,
		true
	},
	["2023spring_minigame_nenjuu_skill6"] = {
		758515,
		138,
		true
	},
	["2023spring_minigame_nenjuu_skill7"] = {
		758653,
		268,
		true
	},
	["2023spring_minigame_nenjuu_skill8"] = {
		758921,
		223,
		true
	},
	["2023spring_minigame_tip1"] = {
		759144,
		94,
		true
	},
	["2023spring_minigame_tip2"] = {
		759238,
		97,
		true
	},
	["2023spring_minigame_tip3"] = {
		759335,
		94,
		true
	},
	["2023spring_minigame_tip5"] = {
		759429,
		121,
		true
	},
	["2023spring_minigame_tip6"] = {
		759550,
		103,
		true
	},
	["2023spring_minigame_tip7"] = {
		759653,
		103,
		true
	},
	["2023spring_minigame_help"] = {
		759756,
		970,
		true
	},
	multiple_sorties_title = {
		760726,
		98,
		true
	},
	multiple_sorties_title_eng = {
		760824,
		106,
		true
	},
	multiple_sorties_locked_tip = {
		760930,
		157,
		true
	},
	multiple_sorties_times = {
		761087,
		98,
		true
	},
	multiple_sorties_tip = {
		761185,
		203,
		true
	},
	multiple_sorties_challenge_ticket_use = {
		761388,
		113,
		true
	},
	multiple_sorties_cost1 = {
		761501,
		164,
		true
	},
	multiple_sorties_cost2 = {
		761665,
		170,
		true
	},
	multiple_sorties_cost3 = {
		761835,
		176,
		true
	},
	multiple_sorties_stopped = {
		762011,
		97,
		true
	},
	multiple_sorties_stop_tip = {
		762108,
		170,
		true
	},
	multiple_sorties_resume_tip = {
		762278,
		139,
		true
	},
	multiple_sorties_auto_on = {
		762417,
		133,
		true
	},
	multiple_sorties_finish = {
		762550,
		111,
		true
	},
	multiple_sorties_stop = {
		762661,
		109,
		true
	},
	multiple_sorties_stop_end = {
		762770,
		116,
		true
	},
	multiple_sorties_end_status = {
		762886,
		184,
		true
	},
	multiple_sorties_finish_tip = {
		763070,
		136,
		true
	},
	multiple_sorties_stop_tip_end = {
		763206,
		141,
		true
	},
	multiple_sorties_stop_reason1 = {
		763347,
		128,
		true
	},
	multiple_sorties_stop_reason2 = {
		763475,
		149,
		true
	},
	multiple_sorties_stop_reason3 = {
		763624,
		105,
		true
	},
	multiple_sorties_stop_reason4 = {
		763729,
		105,
		true
	},
	multiple_sorties_main_tip = {
		763834,
		325,
		true
	},
	multiple_sorties_main_end = {
		764159,
		188,
		true
	},
	multiple_sorties_rest_time = {
		764347,
		102,
		true
	},
	multiple_sorties_retry_desc = {
		764449,
		108,
		true
	},
	msgbox_text_battle = {
		764557,
		88,
		true
	},
	pre_combat_start = {
		764645,
		86,
		true
	},
	pre_combat_start_en = {
		764731,
		95,
		true
	},
	["2023Valentine_minigame_s"] = {
		764826,
		194,
		true
	},
	["2023Valentine_minigame_a"] = {
		765020,
		176,
		true
	},
	["2023Valentine_minigame_b"] = {
		765196,
		167,
		true
	},
	["2023Valentine_minigame_c"] = {
		765363,
		179,
		true
	},
	["2023Valentine_minigame_label1"] = {
		765542,
		108,
		true
	},
	["2023Valentine_minigame_label2"] = {
		765650,
		105,
		true
	},
	["2023Valentine_minigame_label3"] = {
		765755,
		108,
		true
	},
	sort_energy = {
		765863,
		84,
		true
	},
	dockyard_search_holder = {
		765947,
		101,
		true
	},
	loveletter_exchange_tip1 = {
		766048,
		134,
		true
	},
	loveletter_exchange_tip2 = {
		766182,
		149,
		true
	},
	loveletter_exchange_confirm = {
		766331,
		372,
		true
	},
	loveletter_exchange_button = {
		766703,
		96,
		true
	},
	loveletter_exchange_tip3 = {
		766799,
		124,
		true
	},
	battle_text_common_1 = {
		766923,
		183,
		true
	},
	battle_text_common_2 = {
		767106,
		213,
		true
	},
	battle_text_common_3 = {
		767319,
		189,
		true
	},
	battle_text_yingxiv4_1 = {
		767508,
		152,
		true
	},
	battle_text_yingxiv4_2 = {
		767660,
		152,
		true
	},
	battle_text_yingxiv4_3 = {
		767812,
		152,
		true
	},
	battle_text_yingxiv4_4 = {
		767964,
		149,
		true
	},
	battle_text_yingxiv4_5 = {
		768113,
		149,
		true
	},
	battle_text_yingxiv4_6 = {
		768262,
		164,
		true
	},
	battle_text_yingxiv4_7 = {
		768426,
		167,
		true
	},
	battle_text_yingxiv4_8 = {
		768593,
		167,
		true
	},
	battle_text_yingxiv4_9 = {
		768760,
		155,
		true
	},
	battle_text_yingxiv4_10 = {
		768915,
		171,
		true
	},
	battle_text_bisimaiz_1 = {
		769086,
		138,
		true
	},
	battle_text_bisimaiz_2 = {
		769224,
		138,
		true
	},
	battle_text_bisimaiz_3 = {
		769362,
		138,
		true
	},
	battle_text_bisimaiz_4 = {
		769500,
		138,
		true
	},
	battle_text_bisimaiz_5 = {
		769638,
		138,
		true
	},
	battle_text_bisimaiz_6 = {
		769776,
		138,
		true
	},
	battle_text_bisimaiz_7 = {
		769914,
		171,
		true
	},
	battle_text_bisimaiz_8 = {
		770085,
		218,
		true
	},
	battle_text_bisimaiz_9 = {
		770303,
		213,
		true
	},
	battle_text_bisimaiz_10 = {
		770516,
		181,
		true
	},
	battle_text_yunxian_1 = {
		770697,
		190,
		true
	},
	battle_text_yunxian_2 = {
		770887,
		175,
		true
	},
	battle_text_yunxian_3 = {
		771062,
		146,
		true
	},
	battle_text_haidao_1 = {
		771208,
		155,
		true
	},
	battle_text_haidao_2 = {
		771363,
		182,
		true
	},
	battle_text_tongmeng_1 = {
		771545,
		134,
		true
	},
	battle_text_luodeni_1 = {
		771679,
		172,
		true
	},
	battle_text_luodeni_2 = {
		771851,
		184,
		true
	},
	battle_text_luodeni_3 = {
		772035,
		175,
		true
	},
	series_enemy_mood = {
		772210,
		93,
		true
	},
	series_enemy_mood_error = {
		772303,
		153,
		true
	},
	series_enemy_reward_tip1 = {
		772456,
		107,
		true
	},
	series_enemy_reward_tip2 = {
		772563,
		113,
		true
	},
	series_enemy_reward_tip3 = {
		772676,
		101,
		true
	},
	series_enemy_reward_tip4 = {
		772777,
		107,
		true
	},
	series_enemy_cost = {
		772884,
		96,
		true
	},
	series_enemy_SP_count = {
		772980,
		100,
		true
	},
	series_enemy_SP_error = {
		773080,
		111,
		true
	},
	series_enemy_unlock = {
		773191,
		117,
		true
	},
	series_enemy_storyunlock = {
		773308,
		112,
		true
	},
	series_enemy_storyreward = {
		773420,
		106,
		true
	},
	series_enemy_help = {
		773526,
		990,
		true
	},
	series_enemy_score = {
		774516,
		88,
		true
	},
	series_enemy_total_score = {
		774604,
		97,
		true
	},
	setting_label_private = {
		774701,
		97,
		true
	},
	setting_label_licence = {
		774798,
		97,
		true
	},
	series_enemy_reward = {
		774895,
		95,
		true
	},
	series_enemy_mode_1 = {
		774990,
		98,
		true
	},
	series_enemy_mode_2 = {
		775088,
		96,
		true
	},
	series_enemy_fleet_prefix = {
		775184,
		97,
		true
	},
	series_enemy_team_notenough = {
		775281,
		201,
		true
	},
	series_enemy_empty_commander_main = {
		775482,
		109,
		true
	},
	series_enemy_empty_commander_assistant = {
		775591,
		114,
		true
	},
	limit_team_character_tips = {
		775705,
		135,
		true
	},
	game_room_help = {
		775840,
		779,
		true
	},
	game_cannot_go = {
		776619,
		114,
		true
	},
	game_ticket_notenough = {
		776733,
		143,
		true
	},
	game_ticket_max_all = {
		776876,
		204,
		true
	},
	game_ticket_max_month = {
		777080,
		213,
		true
	},
	game_icon_notenough = {
		777293,
		154,
		true
	},
	game_goldbyicon = {
		777447,
		117,
		true
	},
	game_icon_max = {
		777564,
		180,
		true
	},
	caibulin_tip1 = {
		777744,
		121,
		true
	},
	caibulin_tip2 = {
		777865,
		149,
		true
	},
	caibulin_tip3 = {
		778014,
		121,
		true
	},
	caibulin_tip4 = {
		778135,
		149,
		true
	},
	caibulin_tip5 = {
		778284,
		121,
		true
	},
	caibulin_tip6 = {
		778405,
		149,
		true
	},
	caibulin_tip7 = {
		778554,
		121,
		true
	},
	caibulin_tip8 = {
		778675,
		149,
		true
	},
	caibulin_tip9 = {
		778824,
		152,
		true
	},
	caibulin_tip10 = {
		778976,
		153,
		true
	},
	caibulin_help = {
		779129,
		416,
		true
	},
	caibulin_tip11 = {
		779545,
		150,
		true
	},
	caibulin_lock_tip = {
		779695,
		124,
		true
	},
	gametip_xiaoqiye = {
		779819,
		1026,
		true
	},
	event_recommend_level1 = {
		780845,
		181,
		true
	},
	doa_minigame_Luna = {
		781026,
		87,
		true
	},
	doa_minigame_Misaki = {
		781113,
		89,
		true
	},
	doa_minigame_Marie = {
		781202,
		94,
		true
	},
	doa_minigame_Tamaki = {
		781296,
		86,
		true
	},
	doa_minigame_help = {
		781382,
		308,
		true
	},
	gametip_xiaokewei = {
		781690,
		1030,
		true
	},
	doa_character_select_confirm = {
		782720,
		223,
		true
	},
	blueprint_combatperformance = {
		782943,
		103,
		true
	},
	blueprint_shipperformance = {
		783046,
		101,
		true
	},
	blueprint_researching = {
		783147,
		103,
		true
	},
	sculpture_drawline_tip = {
		783250,
		111,
		true
	},
	sculpture_drawline_done = {
		783361,
		151,
		true
	},
	sculpture_drawline_exit = {
		783512,
		176,
		true
	},
	sculpture_puzzle_tip = {
		783688,
		158,
		true
	},
	sculpture_gratitude_tip = {
		783846,
		115,
		true
	},
	sculpture_close_tip = {
		783961,
		102,
		true
	},
	gift_act_help = {
		784063,
		456,
		true
	},
	gift_act_drawline_help = {
		784519,
		465,
		true
	},
	gift_act_tips = {
		784984,
		85,
		true
	},
	expedition_award_tip = {
		785069,
		151,
		true
	},
	island_act_tips1 = {
		785220,
		107,
		true
	},
	haidaojudian_help = {
		785327,
		1318,
		true
	},
	haidaojudian_building_tip = {
		786645,
		119,
		true
	},
	workbench_help = {
		786764,
		600,
		true
	},
	workbench_need_materials = {
		787364,
		100,
		true
	},
	workbench_tips1 = {
		787464,
		100,
		true
	},
	workbench_tips2 = {
		787564,
		91,
		true
	},
	workbench_tips3 = {
		787655,
		115,
		true
	},
	workbench_tips4 = {
		787770,
		105,
		true
	},
	workbench_tips5 = {
		787875,
		105,
		true
	},
	workbench_tips6 = {
		787980,
		97,
		true
	},
	workbench_tips7 = {
		788077,
		85,
		true
	},
	workbench_tips8 = {
		788162,
		91,
		true
	},
	workbench_tips9 = {
		788253,
		91,
		true
	},
	workbench_tips10 = {
		788344,
		98,
		true
	},
	island_help = {
		788442,
		610,
		true
	},
	islandnode_tips1 = {
		789052,
		92,
		true
	},
	islandnode_tips2 = {
		789144,
		86,
		true
	},
	islandnode_tips3 = {
		789230,
		102,
		true
	},
	islandnode_tips4 = {
		789332,
		107,
		true
	},
	islandnode_tips5 = {
		789439,
		138,
		true
	},
	islandnode_tips6 = {
		789577,
		114,
		true
	},
	islandnode_tips7 = {
		789691,
		137,
		true
	},
	islandnode_tips8 = {
		789828,
		168,
		true
	},
	islandnode_tips9 = {
		789996,
		154,
		true
	},
	islandshop_tips1 = {
		790150,
		98,
		true
	},
	islandshop_tips2 = {
		790248,
		86,
		true
	},
	islandshop_tips3 = {
		790334,
		86,
		true
	},
	islandshop_tips4 = {
		790420,
		88,
		true
	},
	island_shop_limit_error = {
		790508,
		136,
		true
	},
	haidaojudian_upgrade_limit = {
		790644,
		167,
		true
	},
	chargetip_monthcard_1 = {
		790811,
		127,
		true
	},
	chargetip_monthcard_2 = {
		790938,
		134,
		true
	},
	chargetip_crusing = {
		791072,
		108,
		true
	},
	chargetip_giftpackage = {
		791180,
		115,
		true
	},
	package_view_1 = {
		791295,
		117,
		true
	},
	package_view_2 = {
		791412,
		133,
		true
	},
	package_view_3 = {
		791545,
		105,
		true
	},
	package_view_4 = {
		791650,
		90,
		true
	},
	probabilityskinshop_tip = {
		791740,
		142,
		true
	},
	skin_gift_desc = {
		791882,
		233,
		true
	},
	springtask_tip = {
		792115,
		311,
		true
	},
	island_build_desc = {
		792426,
		124,
		true
	},
	island_history_desc = {
		792550,
		151,
		true
	},
	island_build_level = {
		792701,
		94,
		true
	},
	island_game_limit_help = {
		792795,
		138,
		true
	},
	island_game_limit_num = {
		792933,
		94,
		true
	},
	ore_minigame_help = {
		793027,
		596,
		true
	},
	meta_shop_exchange_limit_2 = {
		793623,
		102,
		true
	},
	meta_shop_tip = {
		793725,
		135,
		true
	},
	pt_shop_tran_tip = {
		793860,
		309,
		true
	},
	urdraw_tip = {
		794169,
		138,
		true
	},
	urdraw_complement = {
		794307,
		169,
		true
	},
	meta_class_t_level_1 = {
		794476,
		96,
		true
	},
	meta_class_t_level_2 = {
		794572,
		96,
		true
	},
	meta_class_t_level_3 = {
		794668,
		96,
		true
	},
	meta_class_t_level_4 = {
		794764,
		96,
		true
	},
	meta_class_t_level_5 = {
		794860,
		96,
		true
	},
	meta_shop_exchange_limit_tip = {
		794956,
		112,
		true
	},
	meta_shop_exchange_limit_2_tip = {
		795068,
		149,
		true
	},
	charge_tip_crusing_label = {
		795217,
		100,
		true
	},
	mktea_1 = {
		795317,
		132,
		true
	},
	mktea_2 = {
		795449,
		132,
		true
	},
	mktea_3 = {
		795581,
		132,
		true
	},
	mktea_4 = {
		795713,
		177,
		true
	},
	mktea_5 = {
		795890,
		186,
		true
	},
	random_skin_list_item_desc_label = {
		796076,
		103,
		true
	},
	notice_input_desc = {
		796179,
		104,
		true
	},
	notice_label_send = {
		796283,
		93,
		true
	},
	notice_label_room = {
		796376,
		96,
		true
	},
	notice_label_recv = {
		796472,
		93,
		true
	},
	notice_label_tip = {
		796565,
		130,
		true
	},
	littleTaihou_npc = {
		796695,
		1208,
		true
	},
	disassemble_selected = {
		797903,
		93,
		true
	},
	disassemble_available = {
		797996,
		94,
		true
	},
	ship_formationUI_fleetName_challenge = {
		798090,
		118,
		true
	},
	ship_formationUI_fleetName_challenge_sub = {
		798208,
		122,
		true
	},
	word_status_activity = {
		798330,
		99,
		true
	},
	word_status_challenge = {
		798429,
		106,
		true
	},
	shipmodechange_reject_inactivity = {
		798535,
		167,
		true
	},
	shipmodechange_reject_inchallenge = {
		798702,
		161,
		true
	},
	battle_result_total_time = {
		798863,
		103,
		true
	},
	charge_game_room_coin_tip = {
		798966,
		231,
		true
	},
	game_room_shooting_tip = {
		799197,
		101,
		true
	},
	mini_game_shop_ticked_not_enough = {
		799298,
		154,
		true
	},
	game_ticket_current_month = {
		799452,
		101,
		true
	},
	game_icon_max_full = {
		799553,
		128,
		true
	},
	pre_combat_consume = {
		799681,
		91,
		true
	},
	file_down_msgbox = {
		799772,
		232,
		true
	},
	file_down_mgr_title = {
		800004,
		98,
		true
	},
	file_down_mgr_progress = {
		800102,
		91,
		true
	},
	file_down_mgr_error = {
		800193,
		135,
		true
	},
	last_building_not_shown = {
		800328,
		133,
		true
	},
	setting_group_prefs_tip = {
		800461,
		108,
		true
	},
	group_prefs_switch_tip = {
		800569,
		144,
		true
	},
	main_group_msgbox_content = {
		800713,
		225,
		true
	},
	word_maingroup_checking = {
		800938,
		96,
		true
	},
	word_maingroup_checktoupdate = {
		801034,
		104,
		true
	},
	word_maingroup_checkfailure = {
		801138,
		118,
		true
	},
	word_maingroup_updating = {
		801256,
		99,
		true
	},
	word_maingroup_updatesuccess = {
		801355,
		104,
		true
	},
	word_maingroup_updatefailure = {
		801459,
		119,
		true
	},
	group_download_tip = {
		801578,
		136,
		true
	},
	word_manga_checking = {
		801714,
		92,
		true
	},
	word_manga_checktoupdate = {
		801806,
		100,
		true
	},
	word_manga_checkfailure = {
		801906,
		114,
		true
	},
	word_manga_updating = {
		802020,
		107,
		true
	},
	word_manga_updatesuccess = {
		802127,
		100,
		true
	},
	word_manga_updatefailure = {
		802227,
		115,
		true
	},
	cryptolalia_lock_res = {
		802342,
		102,
		true
	},
	cryptolalia_not_download_res = {
		802444,
		113,
		true
	},
	cryptolalia_timelimie = {
		802557,
		91,
		true
	},
	cryptolalia_label_downloading = {
		802648,
		114,
		true
	},
	cryptolalia_delete_res = {
		802762,
		102,
		true
	},
	cryptolalia_delete_res_tip = {
		802864,
		118,
		true
	},
	cryptolalia_delete_res_title = {
		802982,
		104,
		true
	},
	cryptolalia_use_gem_title = {
		803086,
		112,
		true
	},
	cryptolalia_use_ticket_title = {
		803198,
		115,
		true
	},
	cryptolalia_exchange = {
		803313,
		96,
		true
	},
	cryptolalia_exchange_success = {
		803409,
		104,
		true
	},
	cryptolalia_list_title = {
		803513,
		98,
		true
	},
	cryptolalia_list_subtitle = {
		803611,
		97,
		true
	},
	cryptolalia_download_done = {
		803708,
		101,
		true
	},
	cryptolalia_coming_soom = {
		803809,
		102,
		true
	},
	cryptolalia_unopen = {
		803911,
		94,
		true
	},
	cryptolalia_no_ticket = {
		804005,
		146,
		true
	},
	cryptolalia_entrance_coming_soom = {
		804151,
		123,
		true
	},
	ship_formationUI_fleetName_sp = {
		804274,
		111,
		true
	},
	ship_formationUI_fleetName_sp_ss = {
		804385,
		120,
		true
	},
	activityboss_sp_all_buff = {
		804505,
		100,
		true
	},
	activityboss_sp_best_score = {
		804605,
		102,
		true
	},
	activityboss_sp_display_reward = {
		804707,
		106,
		true
	},
	activityboss_sp_score_bonus = {
		804813,
		103,
		true
	},
	activityboss_sp_active_buff = {
		804916,
		103,
		true
	},
	activityboss_sp_window_best_score = {
		805019,
		115,
		true
	},
	activityboss_sp_score_target = {
		805134,
		107,
		true
	},
	activityboss_sp_score = {
		805241,
		97,
		true
	},
	activityboss_sp_score_update = {
		805338,
		110,
		true
	},
	activityboss_sp_score_not_update = {
		805448,
		111,
		true
	},
	collect_page_got = {
		805559,
		92,
		true
	},
	charge_menu_month_tip = {
		805651,
		136,
		true
	},
	activity_shop_title = {
		805787,
		89,
		true
	},
	street_shop_title = {
		805876,
		87,
		true
	},
	military_shop_title = {
		805963,
		89,
		true
	},
	quota_shop_title1 = {
		806052,
		109,
		true
	},
	sham_shop_title = {
		806161,
		107,
		true
	},
	fragment_shop_title = {
		806268,
		89,
		true
	},
	guild_shop_title = {
		806357,
		86,
		true
	},
	medal_shop_title = {
		806443,
		86,
		true
	},
	meta_shop_title = {
		806529,
		83,
		true
	},
	mini_game_shop_title = {
		806612,
		90,
		true
	},
	metaskill_up = {
		806702,
		196,
		true
	},
	metaskill_overflow_tip = {
		806898,
		157,
		true
	},
	msgbox_repair_cipher = {
		807055,
		96,
		true
	},
	msgbox_repair_title = {
		807151,
		89,
		true
	},
	equip_skin_detail_count = {
		807240,
		94,
		true
	},
	faest_nothing_to_get = {
		807334,
		108,
		true
	},
	feast_click_to_close = {
		807442,
		112,
		true
	},
	feast_invitation_btn_label = {
		807554,
		102,
		true
	},
	feast_task_btn_label = {
		807656,
		96,
		true
	},
	feast_task_pt_label = {
		807752,
		93,
		true
	},
	feast_task_pt_level = {
		807845,
		88,
		true
	},
	feast_task_pt_get = {
		807933,
		90,
		true
	},
	feast_task_pt_got = {
		808023,
		90,
		true
	},
	feast_task_tag_daily = {
		808113,
		97,
		true
	},
	feast_task_tag_activity = {
		808210,
		100,
		true
	},
	feast_label_make_invitation = {
		808310,
		106,
		true
	},
	feast_no_invitation = {
		808416,
		98,
		true
	},
	feast_no_gift = {
		808514,
		98,
		true
	},
	feast_label_give_invitation = {
		808612,
		106,
		true
	},
	feast_label_give_invitation_finish = {
		808718,
		107,
		true
	},
	feast_label_give_gift = {
		808825,
		100,
		true
	},
	feast_label_give_gift_finish = {
		808925,
		101,
		true
	},
	feast_label_make_ticket_tip = {
		809026,
		140,
		true
	},
	feast_label_make_ticket_click_tip = {
		809166,
		121,
		true
	},
	feast_label_make_ticket_failed_tip = {
		809287,
		139,
		true
	},
	feast_res_window_title = {
		809426,
		92,
		true
	},
	feast_res_window_go_label = {
		809518,
		95,
		true
	},
	feast_tip = {
		809613,
		422,
		true
	},
	feast_invitation_part1 = {
		810035,
		188,
		true
	},
	feast_invitation_part2 = {
		810223,
		241,
		true
	},
	feast_invitation_part3 = {
		810464,
		259,
		true
	},
	feast_invitation_part4 = {
		810723,
		189,
		true
	},
	uscastle2023_help = {
		810912,
		933,
		true
	},
	feast_cant_give_gift_tip = {
		811845,
		147,
		true
	},
	uscastle2023_minigame_help = {
		811992,
		367,
		true
	},
	feast_drag_invitation_tip = {
		812359,
		130,
		true
	},
	feast_drag_gift_tip = {
		812489,
		120,
		true
	},
	shoot_preview = {
		812609,
		89,
		true
	},
	hit_preview = {
		812698,
		87,
		true
	},
	story_label_skip = {
		812785,
		86,
		true
	},
	story_label_auto = {
		812871,
		86,
		true
	},
	launch_ball_skill_desc = {
		812957,
		98,
		true
	},
	launch_ball_hatsuduki_skill_1 = {
		813055,
		118,
		true
	},
	launch_ball_hatsuduki_skill_1_desc = {
		813173,
		190,
		true
	},
	launch_ball_hatsuduki_skill_2 = {
		813363,
		132,
		true
	},
	launch_ball_hatsuduki_skill_2_desc = {
		813495,
		337,
		true
	},
	launch_ball_shinano_skill_1 = {
		813832,
		116,
		true
	},
	launch_ball_shinano_skill_1_desc = {
		813948,
		175,
		true
	},
	launch_ball_shinano_skill_2 = {
		814123,
		116,
		true
	},
	launch_ball_shinano_skill_2_desc = {
		814239,
		215,
		true
	},
	launch_ball_yura_skill_1 = {
		814454,
		113,
		true
	},
	launch_ball_yura_skill_1_desc = {
		814567,
		149,
		true
	},
	launch_ball_yura_skill_2 = {
		814716,
		113,
		true
	},
	launch_ball_yura_skill_2_desc = {
		814829,
		188,
		true
	},
	launch_ball_shimakaze_skill_1 = {
		815017,
		118,
		true
	},
	launch_ball_shimakaze_skill_1_desc = {
		815135,
		201,
		true
	},
	launch_ball_shimakaze_skill_2 = {
		815336,
		118,
		true
	},
	launch_ball_shimakaze_skill_2_desc = {
		815454,
		184,
		true
	},
	jp6th_spring_tip1 = {
		815638,
		162,
		true
	},
	jp6th_spring_tip2 = {
		815800,
		100,
		true
	},
	jp6th_biaohoushan_help = {
		815900,
		734,
		true
	},
	jp6th_lihoushan_help = {
		816634,
		1928,
		true
	},
	jp6th_lihoushan_time = {
		818562,
		116,
		true
	},
	jp6th_lihoushan_order = {
		818678,
		110,
		true
	},
	jp6th_lihoushan_pt1 = {
		818788,
		113,
		true
	},
	launchball_minigame_help = {
		818901,
		357,
		true
	},
	launchball_minigame_select = {
		819258,
		111,
		true
	},
	launchball_minigame_un_select = {
		819369,
		133,
		true
	},
	launchball_minigame_shop = {
		819502,
		107,
		true
	},
	launchball_lock_Shinano = {
		819609,
		165,
		true
	},
	launchball_lock_Yura = {
		819774,
		162,
		true
	},
	launchball_lock_Shimakaze = {
		819936,
		166,
		true
	},
	launchball_spilt_series = {
		820102,
		151,
		true
	},
	launchball_spilt_mix = {
		820253,
		233,
		true
	},
	launchball_spilt_over = {
		820486,
		191,
		true
	},
	launchball_spilt_many = {
		820677,
		168,
		true
	},
	luckybag_skin_isani = {
		820845,
		95,
		true
	},
	luckybag_skin_islive2d = {
		820940,
		93,
		true
	},
	SkinMagazinePage2_tip = {
		821033,
		97,
		true
	},
	racing_cost = {
		821130,
		88,
		true
	},
	racing_rank_top_text = {
		821218,
		96,
		true
	},
	racing_rank_half_h = {
		821314,
		104,
		true
	},
	racing_rank_no_data = {
		821418,
		106,
		true
	},
	racing_minigame_help = {
		821524,
		357,
		true
	},
	child_msg_title_detail = {
		821881,
		92,
		true
	},
	child_msg_title_tip = {
		821973,
		89,
		true
	},
	child_msg_owned = {
		822062,
		93,
		true
	},
	child_polaroid_get_tip = {
		822155,
		125,
		true
	},
	child_close_tip = {
		822280,
		106,
		true
	},
	word_month = {
		822386,
		77,
		true
	},
	word_which_month = {
		822463,
		88,
		true
	},
	word_which_week = {
		822551,
		87,
		true
	},
	word_in_one_week = {
		822638,
		89,
		true
	},
	word_week_title = {
		822727,
		85,
		true
	},
	word_harbour = {
		822812,
		82,
		true
	},
	child_btn_target = {
		822894,
		86,
		true
	},
	child_btn_collect = {
		822980,
		87,
		true
	},
	child_btn_mind = {
		823067,
		84,
		true
	},
	child_btn_bag = {
		823151,
		83,
		true
	},
	child_btn_news = {
		823234,
		96,
		true
	},
	child_main_help = {
		823330,
		526,
		true
	},
	child_archive_name = {
		823856,
		88,
		true
	},
	child_news_import_title = {
		823944,
		99,
		true
	},
	child_news_other_title = {
		824043,
		98,
		true
	},
	child_favor_progress = {
		824141,
		101,
		true
	},
	child_favor_lock1 = {
		824242,
		101,
		true
	},
	child_favor_lock2 = {
		824343,
		92,
		true
	},
	child_target_lock_tip = {
		824435,
		127,
		true
	},
	child_target_progress = {
		824562,
		97,
		true
	},
	child_target_finish_tip = {
		824659,
		112,
		true
	},
	child_target_time_title = {
		824771,
		108,
		true
	},
	child_target_title1 = {
		824879,
		95,
		true
	},
	child_target_title2 = {
		824974,
		95,
		true
	},
	child_item_type0 = {
		825069,
		86,
		true
	},
	child_item_type1 = {
		825155,
		86,
		true
	},
	child_item_type2 = {
		825241,
		86,
		true
	},
	child_item_type3 = {
		825327,
		86,
		true
	},
	child_item_type4 = {
		825413,
		86,
		true
	},
	child_mind_empty_tip = {
		825499,
		110,
		true
	},
	child_mind_finish_title = {
		825609,
		96,
		true
	},
	child_mind_processing_title = {
		825705,
		100,
		true
	},
	child_mind_time_title = {
		825805,
		100,
		true
	},
	child_collect_lock = {
		825905,
		93,
		true
	},
	child_nature_title = {
		825998,
		91,
		true
	},
	child_btn_review = {
		826089,
		92,
		true
	},
	child_schedule_empty_tip = {
		826181,
		121,
		true
	},
	child_schedule_event_tip = {
		826302,
		128,
		true
	},
	child_schedule_sure_tip = {
		826430,
		169,
		true
	},
	child_schedule_sure_tip2 = {
		826599,
		152,
		true
	},
	child_plan_check_tip1 = {
		826751,
		140,
		true
	},
	child_plan_check_tip2 = {
		826891,
		112,
		true
	},
	child_plan_check_tip3 = {
		827003,
		118,
		true
	},
	child_plan_check_tip4 = {
		827121,
		109,
		true
	},
	child_plan_check_tip5 = {
		827230,
		109,
		true
	},
	child_plan_event = {
		827339,
		92,
		true
	},
	child_btn_home = {
		827431,
		84,
		true
	},
	child_option_limit = {
		827515,
		88,
		true
	},
	child_shop_tip1 = {
		827603,
		111,
		true
	},
	child_shop_tip2 = {
		827714,
		115,
		true
	},
	child_filter_title = {
		827829,
		88,
		true
	},
	child_filter_type1 = {
		827917,
		94,
		true
	},
	child_filter_type2 = {
		828011,
		94,
		true
	},
	child_filter_type3 = {
		828105,
		94,
		true
	},
	child_plan_type1 = {
		828199,
		92,
		true
	},
	child_plan_type2 = {
		828291,
		92,
		true
	},
	child_plan_type3 = {
		828383,
		92,
		true
	},
	child_plan_type4 = {
		828475,
		92,
		true
	},
	child_filter_award_res = {
		828567,
		92,
		true
	},
	child_filter_award_nature = {
		828659,
		95,
		true
	},
	child_filter_award_attr1 = {
		828754,
		94,
		true
	},
	child_filter_award_attr2 = {
		828848,
		94,
		true
	},
	child_mood_desc1 = {
		828942,
		155,
		true
	},
	child_mood_desc2 = {
		829097,
		155,
		true
	},
	child_mood_desc3 = {
		829252,
		157,
		true
	},
	child_mood_desc4 = {
		829409,
		155,
		true
	},
	child_mood_desc5 = {
		829564,
		155,
		true
	},
	child_stage_desc1 = {
		829719,
		93,
		true
	},
	child_stage_desc2 = {
		829812,
		93,
		true
	},
	child_stage_desc3 = {
		829905,
		93,
		true
	},
	child_default_callname = {
		829998,
		95,
		true
	},
	flagship_display_mode_1 = {
		830093,
		111,
		true
	},
	flagship_display_mode_2 = {
		830204,
		111,
		true
	},
	flagship_display_mode_3 = {
		830315,
		96,
		true
	},
	flagship_educate_slot_lock_tip = {
		830411,
		199,
		true
	},
	child_story_name = {
		830610,
		89,
		true
	},
	secretary_special_name = {
		830699,
		98,
		true
	},
	secretary_special_lock_tip = {
		830797,
		130,
		true
	},
	secretary_special_title_age = {
		830927,
		109,
		true
	},
	secretary_special_title_physiognomy = {
		831036,
		117,
		true
	},
	child_plan_skip = {
		831153,
		97,
		true
	},
	child_attr_name1 = {
		831250,
		86,
		true
	},
	child_attr_name2 = {
		831336,
		86,
		true
	},
	child_task_system_type2 = {
		831422,
		93,
		true
	},
	child_task_system_type3 = {
		831515,
		93,
		true
	},
	child_plan_perform_title = {
		831608,
		100,
		true
	},
	child_date_text1 = {
		831708,
		92,
		true
	},
	child_date_text2 = {
		831800,
		92,
		true
	},
	child_date_text3 = {
		831892,
		92,
		true
	},
	child_date_text4 = {
		831984,
		92,
		true
	},
	child_upgrade_sure_tip = {
		832076,
		214,
		true
	},
	child_school_sure_tip = {
		832290,
		194,
		true
	},
	child_extraAttr_sure_tip = {
		832484,
		140,
		true
	},
	child_reset_sure_tip = {
		832624,
		187,
		true
	},
	child_end_sure_tip = {
		832811,
		106,
		true
	},
	child_buff_name = {
		832917,
		85,
		true
	},
	child_unlock_tip = {
		833002,
		86,
		true
	},
	child_unlock_out = {
		833088,
		86,
		true
	},
	child_unlock_memory = {
		833174,
		89,
		true
	},
	child_unlock_polaroid = {
		833263,
		91,
		true
	},
	child_unlock_ending = {
		833354,
		89,
		true
	},
	child_unlock_intimacy = {
		833443,
		94,
		true
	},
	child_unlock_buff = {
		833537,
		87,
		true
	},
	child_unlock_attr2 = {
		833624,
		88,
		true
	},
	child_unlock_attr3 = {
		833712,
		88,
		true
	},
	child_unlock_bag = {
		833800,
		86,
		true
	},
	child_shop_empty_tip = {
		833886,
		119,
		true
	},
	child_bag_empty_tip = {
		834005,
		109,
		true
	},
	levelscene_deploy_submarine = {
		834114,
		103,
		true
	},
	levelscene_deploy_submarine_cancel = {
		834217,
		110,
		true
	},
	levelscene_airexpel_cancel = {
		834327,
		102,
		true
	},
	levelscene_airexpel_select_enemy = {
		834429,
		133,
		true
	},
	levelscene_airexpel_outrange = {
		834562,
		122,
		true
	},
	levelscene_airexpel_select_boss = {
		834684,
		132,
		true
	},
	levelscene_airexpel_select_battle = {
		834816,
		156,
		true
	},
	levelscene_airexpel_select_confirm_left = {
		834972,
		203,
		true
	},
	levelscene_airexpel_select_confirm_right = {
		835175,
		204,
		true
	},
	levelscene_airexpel_select_confirm_up = {
		835379,
		201,
		true
	},
	levelscene_airexpel_select_confirm_down = {
		835580,
		203,
		true
	},
	shipyard_phase_1 = {
		835783,
		712,
		true
	},
	shipyard_phase_2 = {
		836495,
		86,
		true
	},
	shipyard_button_1 = {
		836581,
		93,
		true
	},
	shipyard_button_2 = {
		836674,
		137,
		true
	},
	shipyard_introduce = {
		836811,
		219,
		true
	},
	help_supportfleet = {
		837030,
		358,
		true
	},
	word_status_inSupportFleet = {
		837388,
		105,
		true
	},
	ship_formationMediator_request_replace_support = {
		837493,
		205,
		true
	},
	courtyard_label_train = {
		837698,
		91,
		true
	},
	courtyard_label_rest = {
		837789,
		90,
		true
	},
	courtyard_label_capacity = {
		837879,
		94,
		true
	},
	courtyard_label_share = {
		837973,
		91,
		true
	},
	courtyard_label_shop = {
		838064,
		90,
		true
	},
	courtyard_label_decoration = {
		838154,
		96,
		true
	},
	courtyard_label_template = {
		838250,
		94,
		true
	},
	courtyard_label_floor = {
		838344,
		98,
		true
	},
	courtyard_label_exp_addition = {
		838442,
		105,
		true
	},
	courtyard_label_total_exp_addition = {
		838547,
		117,
		true
	},
	courtyard_label_comfortable_addition = {
		838664,
		125,
		true
	},
	courtyard_label_placed_furniture = {
		838789,
		111,
		true
	},
	courtyard_label_shop_1 = {
		838900,
		98,
		true
	},
	courtyard_label_clear = {
		838998,
		91,
		true
	},
	courtyard_label_save = {
		839089,
		90,
		true
	},
	courtyard_label_save_theme = {
		839179,
		102,
		true
	},
	courtyard_label_using = {
		839281,
		97,
		true
	},
	courtyard_label_search_holder = {
		839378,
		105,
		true
	},
	courtyard_label_filter = {
		839483,
		92,
		true
	},
	courtyard_label_time = {
		839575,
		90,
		true
	},
	courtyard_label_week = {
		839665,
		93,
		true
	},
	courtyard_label_month = {
		839758,
		94,
		true
	},
	courtyard_label_year = {
		839852,
		93,
		true
	},
	courtyard_label_putlist_title = {
		839945,
		114,
		true
	},
	courtyard_label_custom_theme = {
		840059,
		107,
		true
	},
	courtyard_label_system_theme = {
		840166,
		104,
		true
	},
	courtyard_tip_furniture_not_in_layer = {
		840270,
		124,
		true
	},
	courtyard_label_detail = {
		840394,
		92,
		true
	},
	courtyard_label_place_pnekey = {
		840486,
		104,
		true
	},
	courtyard_label_delete = {
		840590,
		92,
		true
	},
	courtyard_label_cancel_share = {
		840682,
		104,
		true
	},
	courtyard_label_empty_template_list = {
		840786,
		139,
		true
	},
	courtyard_label_empty_custom_template_list = {
		840925,
		195,
		true
	},
	courtyard_label_empty_collection_list = {
		841120,
		135,
		true
	},
	courtyard_label_go = {
		841255,
		88,
		true
	},
	mot_class_t_level_1 = {
		841343,
		92,
		true
	},
	mot_class_t_level_2 = {
		841435,
		95,
		true
	},
	equip_share_label_1 = {
		841530,
		95,
		true
	},
	equip_share_label_2 = {
		841625,
		95,
		true
	},
	equip_share_label_3 = {
		841720,
		95,
		true
	},
	equip_share_label_4 = {
		841815,
		95,
		true
	},
	equip_share_label_5 = {
		841910,
		95,
		true
	},
	equip_share_label_6 = {
		842005,
		95,
		true
	},
	equip_share_label_7 = {
		842100,
		95,
		true
	},
	equip_share_label_8 = {
		842195,
		95,
		true
	},
	equip_share_label_9 = {
		842290,
		95,
		true
	},
	equipcode_input = {
		842385,
		97,
		true
	},
	equipcode_slot_unmatch = {
		842482,
		138,
		true
	},
	equipcode_share_nolabel = {
		842620,
		133,
		true
	},
	equipcode_share_exceedlimit = {
		842753,
		127,
		true
	},
	equipcode_illegal = {
		842880,
		102,
		true
	},
	equipcode_confirm_doublecheck = {
		842982,
		133,
		true
	},
	equipcode_import_success = {
		843115,
		106,
		true
	},
	equipcode_share_success = {
		843221,
		111,
		true
	},
	equipcode_like_limited = {
		843332,
		125,
		true
	},
	equipcode_like_success = {
		843457,
		98,
		true
	},
	equipcode_dislike_success = {
		843555,
		101,
		true
	},
	equipcode_report_type_1 = {
		843656,
		105,
		true
	},
	equipcode_report_type_2 = {
		843761,
		105,
		true
	},
	equipcode_report_warning = {
		843866,
		147,
		true
	},
	equipcode_level_unmatched = {
		844013,
		101,
		true
	},
	equipcode_equipment_unowned = {
		844114,
		100,
		true
	},
	equipcode_diff_selected = {
		844214,
		99,
		true
	},
	equipcode_export_success = {
		844313,
		109,
		true
	},
	equipcode_unsaved_tips = {
		844422,
		135,
		true
	},
	equipcode_share_ruletips = {
		844557,
		155,
		true
	},
	equipcode_share_errorcode7 = {
		844712,
		136,
		true
	},
	equipcode_share_errorcode44 = {
		844848,
		140,
		true
	},
	equipcode_share_title = {
		844988,
		97,
		true
	},
	equipcode_share_titleeng = {
		845085,
		98,
		true
	},
	equipcode_share_listempty = {
		845183,
		107,
		true
	},
	equipcode_equip_occupied = {
		845290,
		97,
		true
	},
	sail_boat_equip_tip_1 = {
		845387,
		199,
		true
	},
	sail_boat_equip_tip_2 = {
		845586,
		199,
		true
	},
	sail_boat_equip_tip_3 = {
		845785,
		199,
		true
	},
	sail_boat_equip_tip_4 = {
		845984,
		184,
		true
	},
	sail_boat_equip_tip_5 = {
		846168,
		169,
		true
	},
	sail_boat_minigame_help = {
		846337,
		356,
		true
	},
	pirate_wanted_help = {
		846693,
		376,
		true
	},
	harbor_backhill_help = {
		847069,
		939,
		true
	},
	cryptolalia_download_task_already_exists = {
		848008,
		127,
		true
	},
	charge_scene_buy_confirm_backyard = {
		848135,
		172,
		true
	},
	roll_room1 = {
		848307,
		89,
		true
	},
	roll_room2 = {
		848396,
		80,
		true
	},
	roll_room3 = {
		848476,
		83,
		true
	},
	roll_room4 = {
		848559,
		80,
		true
	},
	roll_room5 = {
		848639,
		83,
		true
	},
	roll_room6 = {
		848722,
		83,
		true
	},
	roll_room7 = {
		848805,
		80,
		true
	},
	roll_room8 = {
		848885,
		80,
		true
	},
	roll_room9 = {
		848965,
		83,
		true
	},
	roll_room10 = {
		849048,
		84,
		true
	},
	roll_room11 = {
		849132,
		81,
		true
	},
	roll_room12 = {
		849213,
		84,
		true
	},
	roll_room13 = {
		849297,
		81,
		true
	},
	roll_room14 = {
		849378,
		81,
		true
	},
	roll_room15 = {
		849459,
		81,
		true
	},
	roll_room16 = {
		849540,
		81,
		true
	},
	roll_room17 = {
		849621,
		84,
		true
	},
	roll_attr_list = {
		849705,
		631,
		true
	},
	roll_notimes = {
		850336,
		115,
		true
	},
	roll_tip2 = {
		850451,
		124,
		true
	},
	roll_reward_word1 = {
		850575,
		87,
		true
	},
	roll_reward_word2 = {
		850662,
		90,
		true
	},
	roll_reward_word3 = {
		850752,
		90,
		true
	},
	roll_reward_word4 = {
		850842,
		90,
		true
	},
	roll_reward_word5 = {
		850932,
		90,
		true
	},
	roll_reward_word6 = {
		851022,
		90,
		true
	},
	roll_reward_word7 = {
		851112,
		90,
		true
	},
	roll_reward_word8 = {
		851202,
		87,
		true
	},
	roll_reward_tip = {
		851289,
		93,
		true
	},
	roll_unlock = {
		851382,
		159,
		true
	},
	roll_noname = {
		851541,
		93,
		true
	},
	roll_card_info = {
		851634,
		90,
		true
	},
	roll_card_attr = {
		851724,
		84,
		true
	},
	roll_card_skill = {
		851808,
		85,
		true
	},
	roll_times_left = {
		851893,
		94,
		true
	},
	roll_room_unexplored = {
		851987,
		87,
		true
	},
	roll_reward_got = {
		852074,
		88,
		true
	},
	roll_gametip = {
		852162,
		1177,
		true
	},
	roll_ending_tip1 = {
		853339,
		139,
		true
	},
	roll_ending_tip2 = {
		853478,
		142,
		true
	},
	commandercat_label_raw_name = {
		853620,
		103,
		true
	},
	commandercat_label_custom_name = {
		853723,
		109,
		true
	},
	commandercat_label_display_name = {
		853832,
		110,
		true
	},
	commander_selected_max = {
		853942,
		112,
		true
	},
	word_talent = {
		854054,
		81,
		true
	},
	word_click_to_close = {
		854135,
		101,
		true
	},
	commander_subtile_ablity = {
		854236,
		100,
		true
	},
	commander_subtile_talent = {
		854336,
		100,
		true
	},
	commander_confirm_tip = {
		854436,
		128,
		true
	},
	commander_level_up_tip = {
		854564,
		128,
		true
	},
	commander_skill_effect = {
		854692,
		98,
		true
	},
	commander_choice_talent_1 = {
		854790,
		125,
		true
	},
	commander_choice_talent_2 = {
		854915,
		104,
		true
	},
	commander_choice_talent_3 = {
		855019,
		132,
		true
	},
	commander_get_box_tip_1 = {
		855151,
		98,
		true
	},
	commander_get_box_tip = {
		855249,
		139,
		true
	},
	commander_total_gold = {
		855388,
		99,
		true
	},
	commander_use_box_tip = {
		855487,
		97,
		true
	},
	commander_use_box_queue = {
		855584,
		99,
		true
	},
	commander_command_ability = {
		855683,
		101,
		true
	},
	commander_logistics_ability = {
		855784,
		103,
		true
	},
	commander_tactical_ability = {
		855887,
		102,
		true
	},
	commander_choice_talent_4 = {
		855989,
		133,
		true
	},
	commander_rename_tip = {
		856122,
		138,
		true
	},
	commander_home_level_label = {
		856260,
		102,
		true
	},
	commander_get_commander_coptyright = {
		856362,
		125,
		true
	},
	commander_choice_talent_reset = {
		856487,
		202,
		true
	},
	commander_lock_setting_title = {
		856689,
		159,
		true
	},
	skin_exchange_confirm = {
		856848,
		160,
		true
	},
	skin_purchase_confirm = {
		857008,
		231,
		true
	},
	blackfriday_pack_lock = {
		857239,
		112,
		true
	},
	skin_exchange_title = {
		857351,
		98,
		true
	},
	blackfriday_pack_select_skinall = {
		857449,
		213,
		true
	},
	skin_discount_desc = {
		857662,
		124,
		true
	},
	skin_exchange_timelimit = {
		857786,
		172,
		true
	},
	blackfriday_pack_purchased = {
		857958,
		99,
		true
	},
	commander_unsel_lock_flag_tip = {
		858057,
		190,
		true
	},
	skin_discount_timelimit = {
		858247,
		155,
		true
	},
	shan_luan_task_progress_tip = {
		858402,
		104,
		true
	},
	shan_luan_task_level_tip = {
		858506,
		104,
		true
	},
	shan_luan_task_help = {
		858610,
		551,
		true
	},
	shan_luan_task_buff_default = {
		859161,
		100,
		true
	},
	senran_pt_consume_tip = {
		859261,
		204,
		true
	},
	senran_pt_not_enough = {
		859465,
		122,
		true
	},
	senran_pt_help = {
		859587,
		472,
		true
	},
	senran_pt_rank = {
		860059,
		95,
		true
	},
	senran_pt_words_feiniao = {
		860154,
		368,
		true
	},
	senran_pt_words_banjiu = {
		860522,
		423,
		true
	},
	senran_pt_words_yan = {
		860945,
		439,
		true
	},
	senran_pt_words_xuequan = {
		861384,
		415,
		true
	},
	senran_pt_words_xuebugui = {
		861799,
		422,
		true
	},
	senran_pt_words_zi = {
		862221,
		371,
		true
	},
	senran_pt_words_xishao = {
		862592,
		378,
		true
	},
	senrankagura_backhill_help = {
		862970,
		1007,
		true
	},
	dorm3d_furnitrue_type_wallpaper = {
		863977,
		101,
		true
	},
	dorm3d_furnitrue_type_floor = {
		864078,
		97,
		true
	},
	dorm3d_furnitrue_type_decoration = {
		864175,
		102,
		true
	},
	dorm3d_furnitrue_type_bed = {
		864277,
		92,
		true
	},
	dorm3d_furnitrue_type_couch = {
		864369,
		97,
		true
	},
	dorm3d_furnitrue_type_table = {
		864466,
		97,
		true
	},
	vote_lable_not_start = {
		864563,
		93,
		true
	},
	vote_lable_voting = {
		864656,
		90,
		true
	},
	vote_lable_title = {
		864746,
		155,
		true
	},
	vote_lable_acc_title_1 = {
		864901,
		98,
		true
	},
	vote_lable_acc_title_2 = {
		864999,
		105,
		true
	},
	vote_lable_curr_title_1 = {
		865104,
		99,
		true
	},
	vote_lable_curr_title_2 = {
		865203,
		106,
		true
	},
	vote_lable_window_title = {
		865309,
		99,
		true
	},
	vote_lable_rearch = {
		865408,
		90,
		true
	},
	vote_lable_daily_task_title = {
		865498,
		103,
		true
	},
	vote_lable_daily_task_tip = {
		865601,
		124,
		true
	},
	vote_lable_task_title = {
		865725,
		97,
		true
	},
	vote_lable_task_list_is_empty = {
		865822,
		123,
		true
	},
	vote_lable_ship_votes = {
		865945,
		90,
		true
	},
	vote_help_2023 = {
		866035,
		4707,
		true
	},
	vote_tip_level_limit = {
		870742,
		160,
		true
	},
	vote_label_rank = {
		870902,
		85,
		true
	},
	vote_label_rank_fresh_time_tip = {
		870987,
		127,
		true
	},
	vote_tip_area_closed = {
		871114,
		117,
		true
	},
	commander_skill_ui_info = {
		871231,
		93,
		true
	},
	commander_skill_ui_confirm = {
		871324,
		96,
		true
	},
	commander_formation_prefab_fleet = {
		871420,
		111,
		true
	},
	rect_ship_card_tpl_add = {
		871531,
		98,
		true
	},
	newyear2024_backhill_help = {
		871629,
		455,
		true
	},
	last_times_sign = {
		872084,
		102,
		true
	},
	skin_page_sign = {
		872186,
		90,
		true
	},
	skin_page_desc = {
		872276,
		181,
		true
	},
	live2d_reset_desc = {
		872457,
		102,
		true
	},
	skin_exchange_usetip = {
		872559,
		144,
		true
	},
	blackfriday_pack_select_skinall_dialog = {
		872703,
		230,
		true
	},
	not_use_ticket_to_buy_skin = {
		872933,
		114,
		true
	},
	skin_purchase_over_price = {
		873047,
		277,
		true
	},
	help_chunjie2024 = {
		873324,
		980,
		true
	},
	child_random_polaroid_drop = {
		874304,
		96,
		true
	},
	child_random_ops_drop = {
		874400,
		97,
		true
	},
	child_refresh_sure_tip = {
		874497,
		119,
		true
	},
	child_target_set_sure_tip = {
		874616,
		231,
		true
	},
	child_polaroid_lock_tip = {
		874847,
		117,
		true
	},
	child_task_finish_all = {
		874964,
		118,
		true
	},
	child_unlock_new_secretary = {
		875082,
		172,
		true
	},
	child_no_resource = {
		875254,
		96,
		true
	},
	child_target_set_empty = {
		875350,
		104,
		true
	},
	child_target_set_skip = {
		875454,
		136,
		true
	},
	child_news_import_empty = {
		875590,
		111,
		true
	},
	child_news_other_empty = {
		875701,
		110,
		true
	},
	word_week_day1 = {
		875811,
		87,
		true
	},
	word_week_day2 = {
		875898,
		87,
		true
	},
	word_week_day3 = {
		875985,
		87,
		true
	},
	word_week_day4 = {
		876072,
		87,
		true
	},
	word_week_day5 = {
		876159,
		87,
		true
	},
	word_week_day6 = {
		876246,
		87,
		true
	},
	word_week_day7 = {
		876333,
		87,
		true
	},
	child_shop_price_title = {
		876420,
		95,
		true
	},
	child_callname_tip = {
		876515,
		94,
		true
	},
	child_plan_no_cost = {
		876609,
		95,
		true
	},
	word_emoji_unlock = {
		876704,
		96,
		true
	},
	word_get_emoji = {
		876800,
		86,
		true
	},
	word_show_extra_reward_at_fudai_dialog = {
		876886,
		141,
		true
	},
	skin_shop_buy_confirm = {
		877027,
		157,
		true
	},
	activity_victory = {
		877184,
		113,
		true
	},
	other_world_temple_toggle_1 = {
		877297,
		103,
		true
	},
	other_world_temple_toggle_2 = {
		877400,
		103,
		true
	},
	other_world_temple_toggle_3 = {
		877503,
		103,
		true
	},
	other_world_temple_char = {
		877606,
		102,
		true
	},
	other_world_temple_award = {
		877708,
		100,
		true
	},
	other_world_temple_got = {
		877808,
		95,
		true
	},
	other_world_temple_progress = {
		877903,
		119,
		true
	},
	other_world_temple_char_title = {
		878022,
		108,
		true
	},
	other_world_temple_award_last = {
		878130,
		104,
		true
	},
	other_world_temple_award_title_1 = {
		878234,
		117,
		true
	},
	other_world_temple_award_title_2 = {
		878351,
		117,
		true
	},
	other_world_temple_award_title_3 = {
		878468,
		117,
		true
	},
	other_world_temple_lottery_all = {
		878585,
		115,
		true
	},
	other_world_temple_award_desc = {
		878700,
		190,
		true
	},
	temple_consume_not_enough = {
		878890,
		101,
		true
	},
	other_world_temple_pay = {
		878991,
		97,
		true
	},
	other_world_task_type_daily = {
		879088,
		103,
		true
	},
	other_world_task_type_main = {
		879191,
		102,
		true
	},
	other_world_task_type_repeat = {
		879293,
		104,
		true
	},
	other_world_task_title = {
		879397,
		101,
		true
	},
	other_world_task_get_all = {
		879498,
		100,
		true
	},
	other_world_task_go = {
		879598,
		89,
		true
	},
	other_world_task_got = {
		879687,
		93,
		true
	},
	other_world_task_get = {
		879780,
		90,
		true
	},
	other_world_task_tag_main = {
		879870,
		95,
		true
	},
	other_world_task_tag_daily = {
		879965,
		96,
		true
	},
	other_world_task_tag_all = {
		880061,
		94,
		true
	},
	terminal_personal_title = {
		880155,
		99,
		true
	},
	terminal_adventure_title = {
		880254,
		100,
		true
	},
	terminal_guardian_title = {
		880354,
		96,
		true
	},
	personal_info_title = {
		880450,
		95,
		true
	},
	personal_property_title = {
		880545,
		93,
		true
	},
	personal_ability_title = {
		880638,
		92,
		true
	},
	adventure_award_title = {
		880730,
		103,
		true
	},
	adventure_progress_title = {
		880833,
		109,
		true
	},
	adventure_lv_title = {
		880942,
		97,
		true
	},
	adventure_record_title = {
		881039,
		98,
		true
	},
	adventure_record_grade_title = {
		881137,
		110,
		true
	},
	adventure_award_end_tip = {
		881247,
		121,
		true
	},
	guardian_select_title = {
		881368,
		100,
		true
	},
	guardian_sure_btn = {
		881468,
		87,
		true
	},
	guardian_cancel_btn = {
		881555,
		89,
		true
	},
	guardian_active_tip = {
		881644,
		92,
		true
	},
	personal_random = {
		881736,
		91,
		true
	},
	adventure_get_all = {
		881827,
		93,
		true
	},
	Announcements_Event_Notice = {
		881920,
		102,
		true
	},
	Announcements_System_Notice = {
		882022,
		103,
		true
	},
	Announcements_News = {
		882125,
		94,
		true
	},
	Announcements_Donotshow = {
		882219,
		105,
		true
	},
	adventure_unlock_tip = {
		882324,
		156,
		true
	},
	personal_random_tip = {
		882480,
		134,
		true
	},
	guardian_sure_limit_tip = {
		882614,
		120,
		true
	},
	other_world_temple_tip = {
		882734,
		533,
		true
	},
	otherworld_map_help = {
		883267,
		530,
		true
	},
	otherworld_backhill_help = {
		883797,
		535,
		true
	},
	otherworld_terminal_help = {
		884332,
		535,
		true
	},
	vote_2023_reward_word_1 = {
		884867,
		309,
		true
	},
	vote_2023_reward_word_2 = {
		885176,
		338,
		true
	},
	vote_2023_reward_word_3 = {
		885514,
		322,
		true
	},
	voting_page_reward = {
		885836,
		94,
		true
	},
	backyard_shipAddInimacy_ships_ok = {
		885930,
		170,
		true
	},
	backyard_shipAddMoney_ships_ok = {
		886100,
		189,
		true
	},
	idol3rd_houshan = {
		886289,
		1031,
		true
	},
	idol3rd_collection = {
		887320,
		675,
		true
	},
	idol3rd_practice = {
		887995,
		927,
		true
	},
	dorm3d_furniture_window_acesses = {
		888922,
		107,
		true
	},
	dorm3d_furniture_count = {
		889029,
		97,
		true
	},
	dorm3d_furniture_used = {
		889126,
		119,
		true
	},
	dorm3d_furniture_unfit = {
		889245,
		98,
		true
	},
	dorm3d_waiting = {
		889343,
		90,
		true
	},
	dorm3d_daily_favor = {
		889433,
		103,
		true
	},
	dorm3d_favor_level = {
		889536,
		106,
		true
	},
	dorm3d_time_choose = {
		889642,
		94,
		true
	},
	dorm3d_now_time = {
		889736,
		91,
		true
	},
	dorm3d_is_auto_time = {
		889827,
		116,
		true
	},
	dorm3d_clothing_choose = {
		889943,
		98,
		true
	},
	dorm3d_now_clothing = {
		890041,
		89,
		true
	},
	dorm3d_talk = {
		890130,
		81,
		true
	},
	dorm3d_touch = {
		890211,
		82,
		true
	},
	dorm3d_gift = {
		890293,
		81,
		true
	},
	dorm3d_gift_owner_num = {
		890374,
		94,
		true
	},
	main_silent_tip_1 = {
		890468,
		102,
		true
	},
	main_silent_tip_2 = {
		890570,
		103,
		true
	},
	main_silent_tip_3 = {
		890673,
		103,
		true
	},
	main_silent_tip_4 = {
		890776,
		103,
		true
	},
	commission_label_go = {
		890879,
		90,
		true
	},
	commission_label_finish = {
		890969,
		94,
		true
	},
	commission_label_go_mellow = {
		891063,
		96,
		true
	},
	commission_label_finish_mellow = {
		891159,
		100,
		true
	},
	commission_label_unlock_event_tip = {
		891259,
		133,
		true
	},
	commission_label_unlock_tech_tip = {
		891392,
		132,
		true
	},
	specialshipyard_tip = {
		891524,
		143,
		true
	},
	specialshipyard_name = {
		891667,
		99,
		true
	},
	liner_sign_cnt_tip = {
		891766,
		106,
		true
	},
	liner_sign_unlock_tip = {
		891872,
		104,
		true
	},
	liner_target_type1 = {
		891976,
		94,
		true
	},
	liner_target_type2 = {
		892070,
		94,
		true
	},
	liner_target_type3 = {
		892164,
		100,
		true
	},
	liner_target_type4 = {
		892264,
		109,
		true
	},
	liner_target_type5 = {
		892373,
		103,
		true
	},
	liner_log_schedule_title = {
		892476,
		105,
		true
	},
	liner_log_room_title = {
		892581,
		104,
		true
	},
	liner_log_event_title = {
		892685,
		105,
		true
	},
	liner_schedule_award_tip1 = {
		892790,
		113,
		true
	},
	liner_schedule_award_tip2 = {
		892903,
		113,
		true
	},
	liner_room_award_tip = {
		893016,
		108,
		true
	},
	liner_event_award_tip1 = {
		893124,
		142,
		true
	},
	liner_log_event_group_title1 = {
		893266,
		103,
		true
	},
	liner_log_event_group_title2 = {
		893369,
		103,
		true
	},
	liner_log_event_group_title3 = {
		893472,
		103,
		true
	},
	liner_log_event_group_title4 = {
		893575,
		103,
		true
	},
	liner_event_award_tip2 = {
		893678,
		108,
		true
	},
	liner_event_reasoning_title = {
		893786,
		109,
		true
	},
	["7th_main_tip"] = {
		893895,
		667,
		true
	},
	pipe_minigame_help = {
		894562,
		294,
		true
	},
	pipe_minigame_rank = {
		894856,
		115,
		true
	},
	liner_event_award_tip3 = {
		894971,
		144,
		true
	},
	liner_room_get_tip = {
		895115,
		102,
		true
	},
	liner_event_get_tip = {
		895217,
		94,
		true
	},
	liner_event_lock = {
		895311,
		132,
		true
	},
	liner_event_title1 = {
		895443,
		91,
		true
	},
	liner_event_title2 = {
		895534,
		91,
		true
	},
	liner_event_title3 = {
		895625,
		91,
		true
	},
	liner_help = {
		895716,
		282,
		true
	},
	liner_activity_lock = {
		895998,
		141,
		true
	},
	liner_name_modify = {
		896139,
		105,
		true
	},
	UrExchange_Pt_NotEnough = {
		896244,
		116,
		true
	},
	UrExchange_Pt_charges = {
		896360,
		102,
		true
	},
	UrExchange_Pt_help = {
		896462,
		320,
		true
	}
}
